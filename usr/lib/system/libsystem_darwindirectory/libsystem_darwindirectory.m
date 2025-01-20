void __getStore_block_invoke()
{
  _DWORD *v0;
  uint64_t v1;
  _OWORD v2[5];
  uint64_t v3;

  v3 = *MEMORY[0x263EF8C08];
  v0 = malloc_type_calloc(1uLL, 4uLL, 0x61D5536CuLL);
  if (!v0) {
    __getStore_block_invoke_cold_1(&v1, v2);
  }
  qword_26AF39678 = (uint64_t)v0;
  *v0 = 0;
  if (getSideEffects_once != -1) {
    dispatch_once(&getSideEffects_once, &__block_literal_global_4);
  }
  qword_26AF39680 = getSideEffects_sideEffects;
}

void *__getSideEffects_block_invoke()
{
  uint64_t v18 = *MEMORY[0x263EF8C08];
  v0 = malloc_type_calloc(1uLL, 0x40uLL, 0x61D5536CuLL);
  if (!v0) {
    __getSideEffects_block_invoke_cold_1(&v16, v17);
  }
  getSideEffects_sideEffects = (uint64_t)v0;
  void *v0 = &__block_literal_global_8;
  v1 = _Block_copy(&__block_literal_global_8);
  uint64_t v2 = getSideEffects_sideEffects;
  *(void *)getSideEffects_sideEffects = v1;
  *(void *)(v2 + 8) = &__block_literal_global_12;
  v3 = _Block_copy(&__block_literal_global_12);
  uint64_t v4 = getSideEffects_sideEffects;
  *(void *)(getSideEffects_sideEffects + 8) = v3;
  *(void *)(v4 + 16) = &__block_literal_global_16;
  v5 = _Block_copy(&__block_literal_global_16);
  uint64_t v6 = getSideEffects_sideEffects;
  *(void *)(getSideEffects_sideEffects + 16) = v5;
  *(void *)(v6 + 24) = &__block_literal_global_20;
  v7 = _Block_copy(&__block_literal_global_20);
  uint64_t v8 = getSideEffects_sideEffects;
  *(void *)(getSideEffects_sideEffects + 24) = v7;
  *(void *)(v8 + 32) = &__block_literal_global_24;
  v9 = _Block_copy(&__block_literal_global_24);
  uint64_t v10 = getSideEffects_sideEffects;
  *(void *)(getSideEffects_sideEffects + 32) = v9;
  *(void *)(v10 + 40) = &__block_literal_global_28;
  v11 = _Block_copy(&__block_literal_global_28);
  uint64_t v12 = getSideEffects_sideEffects;
  *(void *)(getSideEffects_sideEffects + 40) = v11;
  *(void *)(v12 + 48) = &__block_literal_global_32;
  v13 = _Block_copy(&__block_literal_global_32);
  uint64_t v14 = getSideEffects_sideEffects;
  *(void *)(getSideEffects_sideEffects + 48) = v13;
  *(void *)(v14 + 56) = &__block_literal_global_36;
  result = _Block_copy(&__block_literal_global_36);
  *(void *)(getSideEffects_sideEffects + 56) = result;
  return result;
}

uint64_t ___ddrsReaderExtractRecordStoreBootUUID_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x263EF8C08];
  if (a2 == 6)
  {
    if (!a3) {
      ___ddrsReaderExtractRecordStoreBootUUID_block_invoke_cold_1(&v5, v6);
    }
    if (*(void *)a3 != MEMORY[0x263EF8D28]) {
      ___ddrsReaderExtractRecordStoreBootUUID_block_invoke_cold_3(&v5, v6);
    }
    if (*(void *)(a3 + 8) != 16) {
      ___ddrsReaderExtractRecordStoreBootUUID_block_invoke_cold_2(&v5, v6);
    }
    uuid_copy(*(unsigned __int8 **)(a1 + 40), *(const unsigned __int8 **)(a3 + 16));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    return 3;
  }
  else if (a2 == 5)
  {
    if (!a3) {
      ___ddrsReaderExtractRecordStoreBootUUID_block_invoke_cold_1(&v5, v6);
    }
    return strncmp(*(const char **)a3, "ddrsKeyBootUUID", 0xFuLL) != 0;
  }
  else
  {
    return 0;
  }
}

uint64_t DarwinDirectoryRecordStoreApply(int a1, uint64_t a2)
{
  if (getStore_once != -1) {
    dispatch_once(&getStore_once, &__block_literal_global);
  }
  _ddrsReaderApplyToStore((uint64_t)&getStore_store, a1, 0, a2);
  return 1;
}

uint64_t DarwinDirectoryRecordStoreApplyWithFilter(int a1, const unsigned __int8 *a2, uint64_t a3)
{
  if (getStore_once != -1) {
    dispatch_once(&getStore_once, &__block_literal_global);
  }
  _ddrsReaderApplyToStore((uint64_t)&getStore_store, a1, a2, a3);
  return 1;
}

void _ddrsReaderApplyToStore(uint64_t a1, int a2, const unsigned __int8 *a3, uint64_t a4)
{
  uint64_t v39 = *MEMORY[0x263EF8C08];
  os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 24));
  _ddrsReaderUpdateRecordStoreIfNeeded(a1);
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(a1 + 24));
  if (a2)
  {
    if (a2 != 1) {
      _ddrsReaderApplyToStore_cold_1(v8, v9);
    }
    uint64_t v10 = "ddrsKeyGroupRecordList";
  }
  else
  {
    uint64_t v10 = "ddrsKeyUserRecordList";
  }
  if (!a3)
  {
    uint64_t v17 = 0;
LABEL_18:
    *(void *)&long long v28 = MEMORY[0x263EF8BF8];
    *((void *)&v28 + 1) = 0x40000000;
    v29 = ___ddrsReaderApplyToStoreRecords_block_invoke;
    v30 = &unk_2649A7AC0;
    v33 = a3;
    uint64_t v34 = v17;
    char v36 = a2;
    uint64_t v35 = a1;
    uint64_t v31 = a4;
    v32 = v10;
    xpc_traverse_serialized_data();
    goto LABEL_19;
  }
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(a1 + 24));
  memset(out, 0, 37);
  int v13 = *(_DWORD *)a3;
  if (*(_DWORD *)a3 == 2)
  {
    uint64_t v14 = out;
    uuid_unparse(a3 + 8, out);
    v15 = "ddrsKeyGroupUUIDMap";
    uint64_t v16 = "ddrsKeyUserUUIDMap";
  }
  else if (v13 == 1)
  {
    uint64_t v14 = (char *)*((void *)a3 + 1);
    v15 = "ddrsKeyGroupNameMap";
    uint64_t v16 = "ddrsKeyUserNameMap";
  }
  else
  {
    if (v13) {
      _ddrsReaderApplyToStore_cold_2(v11, v12);
    }
    uint64_t v14 = __str;
    snprintf(__str, 0xBuLL, "%u", *((_DWORD *)a3 + 2));
    v15 = "ddrsKeyGroupIDMap";
    uint64_t v16 = "ddrsKeyUserIDMap";
  }
  if (a2) {
    uint64_t v18 = v15;
  }
  else {
    uint64_t v18 = v16;
  }
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2000000000;
  char v27 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2000000000;
  uint64_t v23 = -1;
  v19[1] = MEMORY[0x263EF8BF8];
  v19[2] = 0x40000000;
  v19[3] = ___ddrsReaderFindStoreRecordIndex_block_invoke;
  v19[4] = &unk_2649A7AE8;
  v19[7] = v14;
  v19[8] = v18;
  v19[9] = strlen(v18);
  v19[5] = &v24;
  v19[6] = &v20;
  xpc_traverse_serialized_data();
  if (!*((unsigned char *)v25 + 24)) {
    _ddrsReaderApplyToStore_cold_3(v19, &v28);
  }
  uint64_t v17 = v21[3];
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  if (v17 != -1) {
    goto LABEL_18;
  }
LABEL_19:
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(a1 + 24));
}

void _ddrsReaderUpdateRecordStoreIfNeeded(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8C08];
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(a1 + 24));
  if (*(_DWORD *)(a1 + 16) == -1)
  {
    os_unfair_lock_assert_owner(*(const os_unfair_lock **)(a1 + 24));
    if (*(_DWORD *)(a1 + 16) != -1) {
      _ddrsReaderUpdateRecordStoreIfNeeded_cold_5(&v7, v9);
    }
    if ((*(unsigned int (**)(void))(*(void *)(*(void *)(a1 + 32) + 40) + 16))())
    {
      v9[0] = 0uLL;
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      if ((_dyld_get_image_uuid() & 1) == 0) {
        v9[0] = 0uLL;
      }
      if (_dyld_get_shared_cache_uuid())
      {
        _dyld_get_shared_cache_range();
      }
      else
      {
        uint64_t v7 = 0;
        uint64_t v8 = 0;
      }
      _os_log_simple();
    }
  }
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(a1 + 24));
  if (*(_DWORD *)(a1 + 16) != -1) {
    (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 48) + 16))(*(void *)(*(void *)(a1 + 32) + 48));
  }
  if (!*(void *)a1)
  {
    v9[0] = 0uLL;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    if ((_dyld_get_image_uuid() & 1) == 0) {
      v9[0] = 0uLL;
    }
    if (_dyld_get_shared_cache_uuid())
    {
      _dyld_get_shared_cache_range();
    }
    else
    {
      uint64_t v7 = 0;
      uint64_t v8 = 0;
    }
    _os_log_simple();
    os_unfair_lock_assert_owner(*(const os_unfair_lock **)(a1 + 24));
    uint64_t v2 = *(void *)a1;
    if (*(void *)a1) {
      _ddrsReaderUnloadRecordStore(a1);
    }
    os_unfair_lock_assert_owner(*(const os_unfair_lock **)(a1 + 24));
    if (*(void *)a1) {
      _ddrsReaderUpdateRecordStoreIfNeeded_cold_4(&v7, v9);
    }
    if (*(void *)(a1 + 8)) {
      _ddrsReaderUpdateRecordStoreIfNeeded_cold_3(&v7, v9);
    }
    uint64_t v3 = _ddrsReaderLoadAndValidateRecordStoreAtPath((uint64_t)"/private/var/db/DarwinDirectory/local/recordStore.data", a1);
    if (v3)
    {
      v9[0] = 0uLL;
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      if ((_dyld_get_image_uuid() & 1) == 0) {
        v9[0] = 0uLL;
      }
      if (_dyld_get_shared_cache_uuid())
      {
        _dyld_get_shared_cache_range();
      }
      else
      {
        uint64_t v7 = 0;
        uint64_t v8 = 0;
      }
      _os_log_simple();
      ++*(_WORD *)(a1 + 20);
    }
    else
    {
      if (v2) {
        _ddrsReaderUpdateRecordStoreIfNeeded_cold_2(v3, v4);
      }
      uint64_t v5 = _ddrsReaderLoadAndValidateRecordStoreAtPath((uint64_t)"/System/Library/DarwinDirectory/system/recordStore.data", a1);
      if ((v5 & 1) == 0) {
        _ddrsReaderUpdateRecordStoreIfNeeded_cold_1(v5, v6);
      }
      v9[0] = 0uLL;
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      if ((_dyld_get_image_uuid() & 1) == 0) {
        v9[0] = 0uLL;
      }
      if (_dyld_get_shared_cache_uuid())
      {
        _dyld_get_shared_cache_range();
      }
      else
      {
        uint64_t v7 = 0;
        uint64_t v8 = 0;
      }
      _os_log_simple();
    }
  }
}

uint64_t __getSideEffects_block_invoke_8(int a1, int token, int *check)
{
  return notify_check(token, check);
}

uint64_t __getSideEffects_block_invoke_7(int a1, char *name, int *out_token)
{
  return notify_register_check(name, out_token);
}

uint64_t _ddrsReaderLoadAndValidateRecordStoreAtPath(uint64_t a1, uint64_t a2)
{
  uint64_t v36 = *MEMORY[0x263EF8C08];
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(a2 + 24));
  uint64_t v3 = *(void **)(a2 + 32);
  uint64_t v4 = (*(uint64_t (**)(void))(*v3 + 16))();
  if (v4 == -1)
  {
    int v7 = *__error();
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t v32 = 0;
    v33 = 0;
    if ((_dyld_get_image_uuid() & 1) == 0)
    {
      uint64_t v26 = 0;
      uint64_t v27 = 0;
    }
    if (_dyld_get_shared_cache_uuid())
    {
      *(void *)uu = 0;
      _dyld_get_shared_cache_range();
    }
    else
    {
      uint64_t v32 = 0;
      v33 = 0;
    }
    strerror(v7);
    _os_log_simple();
    uint64_t result = 0;
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    return result;
  }
  uint64_t v5 = v4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  *(_OWORD *)uu2 = 0u;
  if ((*(unsigned int (**)(void))(v3[2] + 16))())
  {
    int v6 = *__error();
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t v32 = 0;
    v33 = 0;
    if ((_dyld_get_image_uuid() & 1) == 0)
    {
      uint64_t v26 = 0;
      uint64_t v27 = 0;
    }
    if ((_dyld_get_shared_cache_uuid() & 1) == 0)
    {
      uint64_t v32 = 0;
      v33 = 0;
      goto LABEL_17;
    }
LABEL_6:
    *(void *)uu = 0;
    _dyld_get_shared_cache_range();
LABEL_17:
    strerror(v6);
    _os_log_simple();
    uint64_t v9 = 0;
    goto LABEL_18;
  }
  uint64_t v9 = (*(uint64_t (**)(void))(v3[3] + 16))();
  if (v9 == -1)
  {
    int v6 = *__error();
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t v32 = 0;
    v33 = 0;
    if ((_dyld_get_image_uuid() & 1) == 0)
    {
      uint64_t v26 = 0;
      uint64_t v27 = 0;
    }
    if ((_dyld_get_shared_cache_uuid() & 1) == 0)
    {
      uint64_t v32 = 0;
      v33 = 0;
      goto LABEL_17;
    }
    goto LABEL_6;
  }
LABEL_18:
  (*(void (**)(void, uint64_t, uint64_t))(v3[1] + 16))(v3[1], v5, v8);
  uint64_t v10 = v21;
  if (!v9) {
    uint64_t v10 = 0;
  }
  *(void *)a2 = v9;
  *(void *)(a2 + 8) = v10;
  if (v9)
  {
    os_unfair_lock_assert_owner(*(const os_unfair_lock **)(a2 + 24));
    *(void *)uu = 0;
    uint64_t v25 = 0;
    os_unfair_lock_assert_owner(*(const os_unfair_lock **)(a2 + 24));
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2000000000;
    char v35 = 0;
    uint64_t v26 = MEMORY[0x263EF8BF8];
    uint64_t v27 = 0x40000000;
    long long v28 = ___ddrsReaderExtractRecordStoreBootUUID_block_invoke;
    v29 = &unk_2649A7A98;
    v30 = &v32;
    uint64_t v31 = uu;
    xpc_traverse_serialized_data();
    if (!*((unsigned char *)v33 + 24)) {
      _ddrsReaderLoadAndValidateRecordStoreAtPath_cold_1(&v14, uu2);
    }
    _Block_object_dispose(&v32, 8);
    if (uuid_is_null(uu))
    {
      memset(uu2, 0, sizeof(uu2));
      uint64_t v26 = 0;
      uint64_t v27 = 0;
      if ((_dyld_get_image_uuid() & 1) == 0) {
        memset(uu2, 0, sizeof(uu2));
      }
      if (_dyld_get_shared_cache_uuid())
      {
        uint64_t v32 = 0;
        _dyld_get_shared_cache_range();
      }
      else
      {
        uint64_t v26 = 0;
        uint64_t v27 = 0;
      }
      _os_log_simple();
      return 1;
    }
    memset(uu2, 0, sizeof(uu2));
    if ((*(unsigned int (**)(void, unsigned __int8 *, uint64_t))(*(void *)(*(void *)(a2 + 32) + 56)
                                                                            + 16))(*(void *)(*(void *)(a2 + 32) + 56), uu2, v11))
    {
      int v12 = *__error();
      uint64_t v26 = 0;
      uint64_t v27 = 0;
      uint64_t v32 = 0;
      v33 = 0;
      if ((_dyld_get_image_uuid() & 1) == 0)
      {
        uint64_t v26 = 0;
        uint64_t v27 = 0;
      }
      if (_dyld_get_shared_cache_uuid())
      {
        uint64_t v14 = 0;
        _dyld_get_shared_cache_range();
      }
      else
      {
        uint64_t v32 = 0;
        v33 = 0;
      }
      strerror(v12);
    }
    else
    {
      if (!uuid_compare(uu, uu2)) {
        return 1;
      }
      uint64_t v26 = 0;
      uint64_t v27 = 0;
      uint64_t v32 = 0;
      v33 = 0;
      if ((_dyld_get_image_uuid() & 1) == 0)
      {
        uint64_t v26 = 0;
        uint64_t v27 = 0;
      }
      if (_dyld_get_shared_cache_uuid())
      {
        uint64_t v14 = 0;
        _dyld_get_shared_cache_range();
      }
      else
      {
        uint64_t v32 = 0;
        v33 = 0;
      }
    }
    _os_log_simple();
    memset(uu2, 0, sizeof(uu2));
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    if ((_dyld_get_image_uuid() & 1) == 0) {
      memset(uu2, 0, sizeof(uu2));
    }
    if (_dyld_get_shared_cache_uuid())
    {
      uint64_t v32 = 0;
      _dyld_get_shared_cache_range();
    }
    else
    {
      uint64_t v26 = 0;
      uint64_t v27 = 0;
    }
    _os_log_simple();
    _ddrsReaderUnloadRecordStore(a2);
  }
  return 0;
}

uint64_t __getSideEffects_block_invoke_2(int a1, char *a2, int a3)
{
  return open(a2, a3);
}

void *__getSideEffects_block_invoke_5(uint64_t a1, size_t a2, int a3, int a4, int a5)
{
  return mmap(0, a2, a3, a4, a5, 0);
}

uint64_t __getSideEffects_block_invoke_4(int a1, int a2, stat *a3)
{
  return fstat(a2, a3);
}

uint64_t __getSideEffects_block_invoke_3(int a1, int a2)
{
  return close(a2);
}

uint64_t ___ddrsReaderFindStoreRecordIndex_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x263EF8C08];
  if (a2 != 6)
  {
    if (a2 != 5) {
      return 0;
    }
    if (!a3) {
      ___ddrsReaderExtractRecordStoreBootUUID_block_invoke_cold_1(&v5, v6);
    }
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(unsigned char *)(v3 + 24))
    {
      uint64_t result = strcmp(*(const char **)a3, *(const char **)(a1 + 48));
      if (!result) {
        return result;
      }
    }
    else
    {
      uint64_t result = strncmp(*(const char **)a3, *(const char **)(a1 + 56), *(void *)(a1 + 64));
      if (!result)
      {
        *(unsigned char *)(v3 + 24) = 1;
        return result;
      }
    }
    return 1;
  }
  if (!a3) {
    ___ddrsReaderExtractRecordStoreBootUUID_block_invoke_cold_1(&v5, v6);
  }
  if (*(void *)a3 == MEMORY[0x263EF8D10]) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(a3 + 16);
  }
  return 3;
}

uint64_t ___ddrsReaderApplyToStoreRecords_block_invoke(uint64_t a1, int a2, const char **a3)
{
  uint64_t v37 = *MEMORY[0x263EF8C08];
  string_ptr = 0;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  memset(v30, 0, sizeof(v30));
  if (a2 != 4)
  {
    if (a2 != 7)
    {
      uint64_t result = 0;
      if (a2 == 5)
      {
        if (!a3) {
          ___ddrsReaderExtractRecordStoreBootUUID_block_invoke_cold_1(&v29, v36);
        }
        int v6 = *a3;
        uint64_t v7 = *(const char **)(a1 + 40);
        size_t v8 = strlen(v7);
        return strncmp(v6, v7, v8) != 0;
      }
      return result;
    }
    if (!a3) {
      ___ddrsReaderExtractRecordStoreBootUUID_block_invoke_cold_1(&v29, v36);
    }
    int v9 = *(unsigned __int8 *)(a1 + 72);
    if (v9 == 1) {
      *((void *)&v33 + 1) = v30;
    }
    LOBYTE(v31) = v9;
    if (MEMORY[0x230F7D420](a3) != MEMORY[0x263EF8D00]) {
      ___ddrsReaderApplyToStoreRecords_block_invoke_cold_12(&v29, v36);
    }
    xpc_object_t value = xpc_dictionary_get_value(a3, "ID");
    uint64_t v11 = MEMORY[0x230F7D420]();
    uint64_t v12 = MEMORY[0x263EF8D20];
    if (v11 != MEMORY[0x263EF8D20]) {
      ___ddrsReaderApplyToStoreRecords_block_invoke_cold_5(&v29, v36);
    }
    DWORD1(v31) = xpc_uint64_get_value(value);
    xpc_object_t v13 = xpc_dictionary_get_value(a3, "name");
    uint64_t v14 = MEMORY[0x230F7D420]();
    uint64_t v15 = MEMORY[0x263EF8D18];
    if (v14 != MEMORY[0x263EF8D18]) {
      ___ddrsReaderApplyToStoreRecords_block_invoke_cold_2(&v29, v36);
    }
    *((void *)&v31 + 1) = xpc_string_get_string_ptr(v13);
    xpc_object_t v16 = xpc_dictionary_get_value(a3, "UUID");
    if (MEMORY[0x230F7D420]() != MEMORY[0x263EF8D28]) {
      ___ddrsReaderApplyToStoreRecords_block_invoke_cold_9(&v29, v36);
    }
    bytes = xpc_uuid_get_bytes(v16);
    uuid_copy((unsigned __int8 *)&v32, bytes);
    xpc_object_t v18 = xpc_dictionary_get_value(a3, "isMutable");
    if (MEMORY[0x230F7D420]() != MEMORY[0x263EF8CF0]) {
      ___ddrsReaderApplyToStoreRecords_block_invoke_cold_8(&v29, v36);
    }
    LOBYTE(v33) = xpc_BOOL_get_value(v18);
    if (v9 != 1)
    {
      if (!v9)
      {
        xpc_object_t v19 = xpc_dictionary_get_value(a3, "primaryGroupID");
        if (MEMORY[0x230F7D420]() != v12) {
          ___ddrsReaderApplyToStoreRecords_block_invoke_cold_5(&v29, v36);
        }
        DWORD2(v33) = xpc_uint64_get_value(v19);
        xpc_object_t v20 = xpc_dictionary_get_value(a3, "fullName");
        if (MEMORY[0x230F7D420]() != v15) {
          ___ddrsReaderApplyToStoreRecords_block_invoke_cold_2(&v29, v36);
        }
        *(void *)&long long v34 = xpc_string_get_string_ptr(v20);
        xpc_object_t v21 = xpc_dictionary_get_value(a3, "homeDirectory");
        if (MEMORY[0x230F7D420]() != v15) {
          ___ddrsReaderApplyToStoreRecords_block_invoke_cold_2(&v29, v36);
        }
        *((void *)&v34 + 1) = xpc_string_get_string_ptr(v21);
        xpc_object_t v22 = xpc_dictionary_get_value(a3, "shell");
        if (MEMORY[0x230F7D420]() != v15) {
          ___ddrsReaderApplyToStoreRecords_block_invoke_cold_2(&v29, v36);
        }
        string_ptr = xpc_string_get_string_ptr(v22);
      }
      goto LABEL_33;
    }
    xpc_object_t v23 = xpc_dictionary_get_value(a3, "memberNames");
    if (MEMORY[0x230F7D420]() != MEMORY[0x263EF8CE8]) {
      ___ddrsReaderApplyToStoreRecords_block_invoke_cold_7(&v29, v36);
    }
    size_t count = xpc_array_get_count(v23);
    size_t v25 = count;
    if (count >= 0x20)
    {
      *((void *)&v33 + 1) = malloc_type_malloc(8 * count + 8, 0x10040436913F5uLL);
      *(void *)(*((void *)&v33 + 1) + 8 * v25) = 0;
    }
    else
    {
      *(void *)(*((void *)&v33 + 1) + 8 * count) = 0;
      if (!count)
      {
LABEL_33:
        WORD1(v33) = *(_WORD *)(*(void *)(a1 + 64) + 20);
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        if (*(unsigned char *)(a1 + 72) == 1 && *((_OWORD **)&v33 + 1) != v30) {
          free(*((void **)&v33 + 1));
        }
        return 0;
      }
    }
    size_t v26 = 0;
    do
    {
      xpc_object_t v27 = xpc_array_get_value(v23, v26);
      if (MEMORY[0x230F7D420]() != v15) {
        ___ddrsReaderApplyToStoreRecords_block_invoke_cold_6(&v29, v36);
      }
      long long v28 = xpc_string_get_string_ptr(v27);
      *(void *)(*((void *)&v33 + 1) + 8 * v26++) = v28;
    }
    while (v25 != v26);
    goto LABEL_33;
  }
  if (!*(void *)(a1 + 48)) {
    return 2;
  }
  if (!a3) {
    ___ddrsReaderApplyToStoreRecords_block_invoke_cold_13(&v29, v36);
  }
  if (*a3 == *(const char **)(a1 + 56)) {
    return 2;
  }
  else {
    return 1;
  }
}

uint64_t _ddrsGetGeneration(uint64_t a1)
{
  os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 24));
  _ddrsReaderUpdateRecordStoreIfNeeded(a1);
  uint64_t v2 = *(unsigned __int16 *)(a1 + 20);
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(a1 + 24));
  return v2;
}

uint64_t _ddrsReaderUnloadRecordStore(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8C08];
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(a1 + 24));
  if (!*(void *)a1) {
    _ddrsReaderUnloadRecordStore_cold_1(&v3, v4);
  }
  if (!*(void *)(a1 + 8)) {
    _ddrsReaderUnloadRecordStore_cold_2(&v3, v4);
  }
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 32) + 16))();
  if (result) {
    _ddrsReaderUnloadRecordStore_cold_3(&v3, v4);
  }
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270EDDD20](a1, v6, v5, 80, a5, v7, 16);
}

double OUTLINED_FUNCTION_1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_3()
{
  return _os_crash_msg();
}

BOOL OUTLINED_FUNCTION_4()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

uint64_t OUTLINED_FUNCTION_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270EDD590](2, 6, a3, 0);
}

uint64_t DarwinDirectoryGetGeneration()
{
  if (getStore_once != -1) {
    dispatch_once(&getStore_once, &__block_literal_global);
  }

  return _ddrsGetGeneration((uint64_t)&getStore_store);
}

uint64_t __getSideEffects_block_invoke_6(int a1, void *a2, size_t a3)
{
  return munmap(a2, a3);
}

uint64_t __getSideEffects_block_invoke_9(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8C08];
  *(_OWORD *)in = 0u;
  memset(v7, 0, sizeof(v7));
  size_t v5 = 37;
  uint64_t v3 = sysctlbyname("kern.bootsessionuuid", in, &v5, 0, 0);
  if (!v3) {
    uuid_parse(in, a2);
  }
  return v3;
}

uint64_t OUTLINED_FUNCTION_0_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270EDDD20](v8, v5, v6, 80, a5, v7, 16);
}

void _ddrsReaderApplyToStore_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = OUTLINED_FUNCTION_5(a1, a2, (uint64_t)"libsystem_darwindirectory: Invalid record type");
  _ddrsReaderApplyToStore_cold_2(v2);
}

void _ddrsReaderApplyToStore_cold_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = OUTLINED_FUNCTION_5(a1, a2, (uint64_t)"libsystem_darwindirectory: Invalid filter type");
  _ddrsReaderApplyToStore_cold_3(v2);
}

void _ddrsReaderApplyToStore_cold_3(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_22D3AE000);
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void _ddrsReaderUpdateRecordStoreIfNeeded_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = OUTLINED_FUNCTION_5(a1, a2, (uint64_t)"libsystem_darwindirectory: Failed to load system record store");
  _ddrsReaderUpdateRecordStoreIfNeeded_cold_2(v2);
}

void _ddrsReaderUpdateRecordStoreIfNeeded_cold_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = OUTLINED_FUNCTION_5(a1, a2, (uint64_t)"libsystem_darwindirectory: Failed to load local record store on reload");
  _ddrsReaderUpdateRecordStoreIfNeeded_cold_3(v2);
}

void _ddrsReaderUpdateRecordStoreIfNeeded_cold_3(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_22D3AE000);
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void _ddrsReaderUpdateRecordStoreIfNeeded_cold_4(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_22D3AE000);
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void _ddrsReaderUpdateRecordStoreIfNeeded_cold_5(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_22D3AE000);
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void _ddrsReaderUnloadRecordStore_cold_1(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_22D3AE000);
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void _ddrsReaderUnloadRecordStore_cold_2(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_22D3AE000);
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void _ddrsReaderUnloadRecordStore_cold_3(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_22D3AE000);
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void _ddrsReaderLoadAndValidateRecordStoreAtPath_cold_1(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_22D3AE000);
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void ___ddrsReaderExtractRecordStoreBootUUID_block_invoke_cold_1(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_22D3AE000);
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void ___ddrsReaderExtractRecordStoreBootUUID_block_invoke_cold_2(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_22D3AE000);
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void ___ddrsReaderExtractRecordStoreBootUUID_block_invoke_cold_3(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_22D3AE000);
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void ___ddrsReaderApplyToStoreRecords_block_invoke_cold_2(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_22D3AE000);
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void ___ddrsReaderApplyToStoreRecords_block_invoke_cold_5(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_22D3AE000);
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void ___ddrsReaderApplyToStoreRecords_block_invoke_cold_6(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_22D3AE000);
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void ___ddrsReaderApplyToStoreRecords_block_invoke_cold_7(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_22D3AE000);
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void ___ddrsReaderApplyToStoreRecords_block_invoke_cold_8(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_22D3AE000);
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void ___ddrsReaderApplyToStoreRecords_block_invoke_cold_9(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_22D3AE000);
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void ___ddrsReaderApplyToStoreRecords_block_invoke_cold_12(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_22D3AE000);
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void ___ddrsReaderApplyToStoreRecords_block_invoke_cold_13(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_22D3AE000);
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void __getStore_block_invoke_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x263EF8CC0], OS_LOG_TYPE_ERROR);
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v3, v4, v5, v6, (uint64_t)&dword_22D3AE000);
  _os_crash_msg();
  __break(1u);
}

void __getSideEffects_block_invoke_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x263EF8CC0], OS_LOG_TYPE_ERROR);
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v3, v4, v5, v6, (uint64_t)&dword_22D3AE000);
  uint64_t v7 = (const void *)_os_crash_msg();
  __break(1u);
  _Block_copy(v7);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270EDCE88](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270EDD478]();
}

uint64_t _dyld_get_image_uuid()
{
  return MEMORY[0x270EDCDC8]();
}

uint64_t _dyld_get_shared_cache_range()
{
  return MEMORY[0x270EDCDE0]();
}

uint64_t _dyld_get_shared_cache_uuid()
{
  return MEMORY[0x270EDCDE8]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x270EDCF28]();
}

uint64_t _os_log_simple()
{
  return MEMORY[0x270EDDB98]();
}

int close(int a1)
{
  return MEMORY[0x270EDD5C8](*(void *)&a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270EDD688](*(void *)&a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDDB00](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDDB08](size, type_id);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDD8B8](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDD8C8](a1, a2);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x270EDDB50](*(void *)&token, check);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDDB68](name, out_token);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDD8D0](a1, *(void *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDDD50](oslog, type);
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

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDD268](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDD2A0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDD2B8](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDD2E0](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDD2F0](__s1, __s2, __n);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDD360](a1, a2, a3, a4, a5);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x270EDD390](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x270EDD3A8](uu);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x270EDD3B0](in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x270EDDDC8](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x270EDDDD0](xarray, index);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x270EDDDD8](xBOOL);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDDE90](xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDDED0](object);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x270EDDF00](xstring);
}

uint64_t xpc_traverse_serialized_data()
{
  return MEMORY[0x270EDDF08]();
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x270EDDF18](xuint);
}