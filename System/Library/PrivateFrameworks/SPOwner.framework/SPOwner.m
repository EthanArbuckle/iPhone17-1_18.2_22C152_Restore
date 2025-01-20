void sub_1B2FDBE34(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 48));
  _Unwind_Resume(a1);
}

id LogCategory_BeaconManager()
{
  if (LogCategory_BeaconManager_onceToken != -1) {
    dispatch_once(&LogCategory_BeaconManager_onceToken, &__block_literal_global_10);
  }
  v0 = (void *)LogCategory_BeaconManager_log;

  return v0;
}

void sub_1B2FDD454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_1B2FDD804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void *sp_key_index_map_create_handle_from_file(const char *a1)
{
  int v2 = open(a1, 0);
  if (v2 == -1)
  {
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "failed to open file: %s\n", a1);
    return 0;
  }
  else
  {
    return sp_key_index_map_create_handle_from_file_descriptor(v2);
  }
}

void *sp_key_index_map_create_handle_from_file_descriptor(int a1)
{
  int v2 = _sp_mmap_file_descriptor(a1);
  if (!v2)
  {
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "failed to mmap index map for fd %d\n", a1);
    return 0;
  }
  v4 = v2;
  size_t v5 = v3;
  if (*v2 != 18763 || *((unsigned char *)v2 + 2) != 77)
  {
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "unrecognized magic %3s for fd %d (expected KIM)\n", (const char *)v2, a1);
    _sp_munmap_region_handle(v4, v5);
    return 0;
  }
  result = malloc_type_calloc(1uLL, 0x10uLL, 0x1020040EDED9539uLL);
  void *result = v4;
  result[1] = v5;
  return result;
}

void *_sp_mmap_file_descriptor(int a1)
{
  memset(&v3, 0, sizeof(v3));
  if (fstat(a1, &v3))
  {
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "failed to stat fd %d\n");
    return 0;
  }
  result = mmap(0, v3.st_size, 1, 2, a1, 0);
  if (result == (void *)-1)
  {
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "failed to mmap fd %d\n");
    return 0;
  }
  return result;
}

size_t _sp_munmap_region_handle(void *a1, size_t a2)
{
  size_t result = munmap(a1, a2);
  if (result)
  {
    stat v3 = (FILE *)*MEMORY[0x1E4F143C8];
    return fwrite("failed to munmap handle\n", 0x18uLL, 1uLL, v3);
  }
  return result;
}

void sp_key_index_map_destroy(uint64_t a1)
{
  munmap(*(void **)a1, *(void *)(a1 + 8));

  free((void *)a1);
}

uint64_t sp_key_index_map_get_version(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)a1 + 3);
}

uint64_t sp_key_index_map_get_first_index(uint64_t a1)
{
  return *(unsigned int *)(*(void *)a1 + 8);
}

uint64_t sp_key_index_map_get_last_index(uint64_t a1)
{
  return *(unsigned int *)(*(void *)a1 + 12);
}

uint64_t sp_key_index_map_get_record_length(uint64_t a1)
{
  return *(unsigned int *)(*(void *)a1 + 4);
}

uint64_t sp_key_index_map_print_description(unsigned __int8 **a1)
{
  return sp_key_file_header_print_description(*a1);
}

uint64_t sp_key_file_header_print_description(unsigned __int8 *a1)
{
  int v2 = (FILE **)MEMORY[0x1E4F143D8];
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "        magic: %02x%02x%02x (%c%c%c)\n", *a1, a1[1], a1[2], *a1, a1[1], a1[2]);
  fprintf(*v2, "      version: %02x\n", a1[3]);
  fprintf(*v2, "record length: %d\n", *((_DWORD *)a1 + 1));
  fprintf(*v2, "  first index: %d\n", *((_DWORD *)a1 + 2));
  return fprintf(*v2, "   last index: %d\n", *((_DWORD *)a1 + 3));
}

uint64_t sp_key_index_map_print_toc(void *a1)
{
  uint64_t v1 = 0;
  int v2 = (void *)(*a1 + 40);
  stat v3 = (FILE **)MEMORY[0x1E4F143D8];
  do
  {
    uint64_t result = fprintf(*v3, "[%ld] offset: %llu, count: %llu\n", v1++, *(v2 - 1), *v2);
    v2 += 2;
  }
  while (v1 != 256);
  return result;
}

BOOL sp_key_index_map_contains_key(uint64_t *a1, unsigned __int8 *a2, _DWORD *a3)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a1 + 16 * *a2;
  uint64_t v5 = *(void *)(v4 + 40);
  unint64_t v6 = ((unint64_t)*(unsigned int *)(v4 + 32) - 4128) / *(unsigned int *)(*a1 + 4);
  unint64_t v7 = v6;
  unint64_t v8 = v5 + v6;
  if (v7 >= v8) {
    return 0;
  }
  uint64_t v9 = v3 + 32 * v7;
  uint64_t v10 = *(void *)(v9 + 4128);
  uint64_t v11 = *(void *)(v9 + 4136);
  uint64_t v12 = *(void *)(v9 + 4144);
  uint64_t v13 = *(unsigned int *)(v9 + 4152);
  if (*(void *)a2 != v10 || *((void *)a2 + 1) != v11 || *((void *)a2 + 2) != v12 || *((_DWORD *)a2 + 6) != v13)
  {
    while (++v7 != v8)
    {
      uint64_t v17 = v3 + 32 * v7;
      uint64_t v18 = *(void *)(v17 + 4128);
      uint64_t v19 = *(void *)(v17 + 4136);
      uint64_t v20 = *(void *)(v17 + 4144);
      uint64_t v21 = *(unsigned int *)(v17 + 4152);
      if (*(void *)a2 == v18
        && *((void *)a2 + 1) == v19
        && *((void *)a2 + 2) == v20
        && *((_DWORD *)a2 + 6) == v21)
      {
        BOOL result = v7 < v8;
        goto LABEL_27;
      }
    }
    return 0;
  }
  BOOL result = 1;
LABEL_27:
  *a3 = *(_DWORD *)(v3 + 32 * v7 + 4156);
  return result;
}

BOOL sp_key_index_map_contains_key_prefix(uint64_t *a1, unsigned __int16 *__s1, size_t __n, _DWORD *a4)
{
  if (__n > 0x1C) {
    return 0;
  }
  uint64_t v5 = *a1;
  uint64_t v6 = *a1 + 16 * *(unsigned __int8 *)__s1;
  unint64_t v7 = *(unsigned int *)(*a1 + 4);
  unint64_t v8 = (((unint64_t)*(unsigned int *)(v6 + 32) - 4128) / v7);
  unint64_t v9 = *(void *)(v6 + 40) + v8;
  if (v8 >= v9) {
    return 0;
  }
  BOOL v11 = 1;
  while (v7 != 32)
  {
    if (v7 != 10) {
      return 0;
    }
    uint64_t v12 = v5 + 10 * v8;
    int v13 = *(_DWORD *)(v12 + 4128);
    int v14 = *(unsigned __int16 *)(v12 + 4132);
    if (*(_DWORD *)__s1 == v13 && __s1[2] == v14)
    {
      uint64_t v18 = (_DWORD *)(v5 + 10 * v8 + 4134);
      goto LABEL_18;
    }
LABEL_13:
    BOOL v11 = ++v8 < v9;
    if (v8 == v9) {
      return v11;
    }
  }
  uint64_t v16 = v5 + 32 * v8;
  if (memcmp(__s1, (const void *)(v16 + 4128), __n)) {
    goto LABEL_13;
  }
  uint64_t v18 = (_DWORD *)(v16 + 4156);
LABEL_18:
  *a4 = *v18;
  return v11;
}

void *sp_key_subsequence_create_from_file(const char *a1)
{
  int v2 = open(a1, 0);
  if (v2 == -1)
  {
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "failed to open file: %s\n", a1);
    return 0;
  }
  else
  {
    return sp_key_subsequence_create_from_file_descriptor(v2);
  }
}

void *sp_key_subsequence_create_from_file_descriptor(int a1)
{
  int v2 = _sp_mmap_file_descriptor(a1);
  if (!v2)
  {
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "failed to mmap index map for fd %d\n", a1);
    return 0;
  }
  uint64_t v4 = v2;
  size_t v5 = v3;
  if (*v2 != 17739 || *((unsigned char *)v2 + 2) != 89)
  {
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "unrecognized magic %3s for fd %d (expected KEY)\n", (const char *)v2, a1);
    _sp_munmap_region_handle(v4, v5);
    return 0;
  }
  BOOL result = malloc_type_calloc(1uLL, 0x10uLL, 0x1020040EDED9539uLL);
  void *result = v4;
  result[1] = v5;
  return result;
}

void sp_key_subsequence_destroy(uint64_t a1)
{
  munmap(*(void **)a1, *(void *)(a1 + 8));

  free((void *)a1);
}

uint64_t sp_key_subsequence_get_record_for_index(uint64_t a1, int a2)
{
  return *(void *)a1 + 207 * (a2 - *(_DWORD *)(*(void *)a1 + 8)) + 32;
}

uint64_t sp_key_subsequence_print_description(unsigned __int8 **a1)
{
  return sp_key_file_header_print_description(*a1);
}

uint64_t sp_key_subsequence_print_records_description(uint64_t result)
{
  uint64_t v1 = *(unsigned int *)(*(void *)result + 8);
  int v2 = *(_DWORD *)(*(void *)result + 12) + 1;
  if (v2 != v1)
  {
    unsigned int v3 = v2 - v1;
    if (v3 <= 1) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = v3;
    }
    size_t v5 = (char *)(*(void *)result + 64);
    uint64_t v6 = (FILE **)MEMORY[0x1E4F143D8];
    do
    {
      unint64_t v8 = *v5;
      v5 += 207;
      unint64_t v7 = v8;
      if (v8 <= 2) {
        BOOL result = fprintf(*v6, off_1E601B768[v7], v1);
      }
      ++v1;
      --v4;
    }
    while (v4);
  }
  return result;
}

uint64_t sp_key_subsequence_map_get_first_index(uint64_t a1)
{
  return *(unsigned int *)(*(void *)a1 + 8);
}

uint64_t sp_key_subsequence_map_get_last_index(uint64_t a1)
{
  return *(unsigned int *)(*(void *)a1 + 12);
}

id sp_key_record_copy_intermediate_key(uint64_t a1)
{
  uint64_t v1 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a1 length:32];

  return v1;
}

id sp_key_record_copy_public_key(uint64_t a1)
{
  uint64_t v1 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a1 + 33 length:57];

  return v1;
}

id sp_key_record_copy_private_key(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 32) == 1) {
    uint64_t v1 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a1 + 33 length:85];
  }
  else {
    uint64_t v1 = 0;
  }

  return v1;
}

id sp_key_record_copy_private_encrypted_key(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 32) == 2) {
    uint64_t v1 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a1 + 33 length:174];
  }
  else {
    uint64_t v1 = 0;
  }

  return v1;
}

void sub_1B2FE35F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B2FE4020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B2FE6520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

id LogCategory_AccessoryDiscovery()
{
  if (LogCategory_AccessoryDiscovery_onceToken != -1) {
    dispatch_once(&LogCategory_AccessoryDiscovery_onceToken, &__block_literal_global_2);
  }
  v0 = (void *)LogCategory_AccessoryDiscovery_log;

  return v0;
}

id LogCategory_LocalFindableConnectionMaterialMonitoring()
{
  if (LogCategory_LocalFindableConnectionMaterialMonitoring_onceToken != -1) {
    dispatch_once(&LogCategory_LocalFindableConnectionMaterialMonitoring_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)LogCategory_LocalFindableConnectionMaterialMonitoring_log;

  return v0;
}

id LogCategory_BTFinding()
{
  if (LogCategory_BTFinding_onceToken != -1) {
    dispatch_once(&LogCategory_BTFinding_onceToken, &__block_literal_global_7);
  }
  v0 = (void *)LogCategory_BTFinding_log;

  return v0;
}

id LogCategory_SimpleBeaconUpdateInterface()
{
  if (LogCategory_SimpleBeaconUpdateInterface_onceToken != -1) {
    dispatch_once(&LogCategory_SimpleBeaconUpdateInterface_onceToken, &__block_literal_global_13);
  }
  v0 = (void *)LogCategory_SimpleBeaconUpdateInterface_log;

  return v0;
}

id LogCategory_BeaconScanning()
{
  if (LogCategory_BeaconScanning_onceToken != -1) {
    dispatch_once(&LogCategory_BeaconScanning_onceToken, &__block_literal_global_16);
  }
  v0 = (void *)LogCategory_BeaconScanning_log;

  return v0;
}

id LogCategory_BeaconSharing()
{
  if (LogCategory_BeaconSharing_onceToken != -1) {
    dispatch_once(&LogCategory_BeaconSharing_onceToken, &__block_literal_global_19);
  }
  v0 = (void *)LogCategory_BeaconSharing_log;

  return v0;
}

id LogCategory_CBPeripheralManagement()
{
  if (LogCategory_CBPeripheralManagement_onceToken != -1) {
    dispatch_once(&LogCategory_CBPeripheralManagement_onceToken, &__block_literal_global_22);
  }
  v0 = (void *)LogCategory_CBPeripheralManagement_log;

  return v0;
}

id LogCategory_Crypto()
{
  if (LogCategory_Crypto_onceToken != -1) {
    dispatch_once(&LogCategory_Crypto_onceToken, &__block_literal_global_25);
  }
  v0 = (void *)LogCategory_Crypto_log;

  return v0;
}

id LogCategory_FirmwareUpdate()
{
  if (LogCategory_FirmwareUpdate_onceToken != -1) {
    dispatch_once(&LogCategory_FirmwareUpdate_onceToken, &__block_literal_global_28);
  }
  v0 = (void *)LogCategory_FirmwareUpdate_log;

  return v0;
}

id LogCategory_LocationFetch()
{
  if (LogCategory_LocationFetch_onceToken != -1) {
    dispatch_once(&LogCategory_LocationFetch_onceToken, &__block_literal_global_31);
  }
  v0 = (void *)LogCategory_LocationFetch_log;

  return v0;
}

id LogCategory_MaintenanceConnection()
{
  if (LogCategory_MaintenanceConnection_onceToken != -1) {
    dispatch_once(&LogCategory_MaintenanceConnection_onceToken, &__block_literal_global_34);
  }
  v0 = (void *)LogCategory_MaintenanceConnection_log;

  return v0;
}

id LogCategory_NVRAM()
{
  if (LogCategory_NVRAM_onceToken != -1) {
    dispatch_once(&LogCategory_NVRAM_onceToken, &__block_literal_global_37);
  }
  v0 = (void *)LogCategory_NVRAM_log;

  return v0;
}

id LogCategory_OfflineAdvertising()
{
  if (LogCategory_OfflineAdvertising_onceToken != -1) {
    dispatch_once(&LogCategory_OfflineAdvertising_onceToken, &__block_literal_global_40);
  }
  v0 = (void *)LogCategory_OfflineAdvertising_log;

  return v0;
}

id LogCategory_OwnerSession()
{
  if (LogCategory_OwnerSession_onceToken != -1) {
    dispatch_once(&LogCategory_OwnerSession_onceToken, &__block_literal_global_43);
  }
  v0 = (void *)LogCategory_OwnerSession_log;

  return v0;
}

id LogCategory_PowerManagement()
{
  if (LogCategory_PowerManagement_onceToken != -1) {
    dispatch_once(&LogCategory_PowerManagement_onceToken, &__block_literal_global_46);
  }
  v0 = (void *)LogCategory_PowerManagement_log;

  return v0;
}

id LogCategory_SecureLocations()
{
  if (LogCategory_SecureLocations_onceToken != -1) {
    dispatch_once(&LogCategory_SecureLocations_onceToken, &__block_literal_global_49);
  }
  v0 = (void *)LogCategory_SecureLocations_log;

  return v0;
}

id LogCategory_ServiceState()
{
  if (LogCategory_ServiceState_onceToken != -1) {
    dispatch_once(&LogCategory_ServiceState_onceToken, &__block_literal_global_52);
  }
  v0 = (void *)LogCategory_ServiceState_log;

  return v0;
}

id LogCategory_SystemHealth()
{
  if (LogCategory_SystemHealth_onceToken != -1) {
    dispatch_once(&LogCategory_SystemHealth_onceToken, &__block_literal_global_55);
  }
  v0 = (void *)LogCategory_SystemHealth_log;

  return v0;
}

id LogCategory_UnknownDiscovery()
{
  if (LogCategory_UnknownDiscovery_onceToken != -1) {
    dispatch_once(&LogCategory_UnknownDiscovery_onceToken, &__block_literal_global_58);
  }
  v0 = (void *)LogCategory_UnknownDiscovery_log;

  return v0;
}

id LogCategory_Unspecified()
{
  if (LogCategory_Unspecified_onceToken != -1) {
    dispatch_once(&LogCategory_Unspecified_onceToken, &__block_literal_global_61);
  }
  v0 = (void *)LogCategory_Unspecified_log;

  return v0;
}

void sub_1B2FEA37C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_1B2FEA598(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B2FEA83C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void interfaceReconnectTrampoline()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:SPSimpleBeaconUpdateInterfaceReconnect object:0];
}

void sub_1B2FEAE5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B2FECCDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B2FECDF0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1B2FECF0C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_1B2FEDEC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B2FEECB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B2FEEF20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B2FF6A5C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_1B2FF78DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,id location)
{
}

void beaconsChangedTrampoline()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"SPBeaconsChanged" object:0];
}

void beaconingStateChangedTrampoline()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"SPBeaconingStateChanged" object:0];
}

void localActivationLockInfoChangedTrampoline(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1B2FD8000, v3, OS_LOG_TYPE_DEFAULT, "SPLocalBeaconManager: Observed com.apple.icloud.findmydeviced.localActivationLockInfoChanged", v4, 2u);
  }

  [v2 localActivationLockInfoChanged];
}

void sub_1B2FF9448(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B2FF9668(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 32));
  _Unwind_Resume(a1);
}

void sub_1B2FF97C8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B2FF99B8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B2FFA744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
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

void sub_1B2FFA940(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B2FFAA2C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B2FFAE1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_1B2FFB594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v12 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1B2FFBD70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose((const void *)(v39 - 176), 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1B2FFDF00(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B2FFE0A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_1B2FFE2A4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B2FFE404(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B2FFE6A0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B2FFE83C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1B2FFEAB4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B2FFEC14(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B2FFED74(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B2FFF094(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1B2FFF220(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1B2FFF3B4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1B2FFF4F4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B2FFF630(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B2FFF768(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1B2FFF864(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B30017CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id OUTLINED_FUNCTION_1_1(id a1)
{
  return a1;
}

void sub_1B30026E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
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

void sub_1B30086E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_1B3008A30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B3008EC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
}

void sub_1B30091F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B30094A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B300971C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B3009A24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_1B3009C04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_1B3009E48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_1B300A564(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B300AE78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B300CA70(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1B300CCD0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

BOOL runningInBluetoothd()
{
  return *MEMORY[0x1E4F1BD70] != 0;
}

uint64_t bluetoothContextStartup(void *a1)
{
  id v1 = a1;
  +[ObjCSwiftBridge bootstrapWithContext:@"bluetoothd" completionHandler:&__block_literal_global_9];
  uint64_t v2 = [[SPOfflineAdvertisingKeysDelegate alloc] initWithBeaconManager:v1];

  uint64_t v3 = (void *)__offlineAdvertisingKeysDelegate;
  __offlineAdvertisingKeysDelegate = (uint64_t)v2;

  uint64_t result = _os_feature_enabled_impl();
  if (result)
  {
    __SBCBLeechScanner = objc_alloc_init(SPCBLeechScanner);
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

void __bluetoothContextStartup_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = LogCategory_Unspecified();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __bluetoothContextStartup_block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void sub_1B300FD3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B3010138(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_1B30109FC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1B3010E6C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1B3011298(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1B3011688(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1B3011984(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1B3011C80(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1B3011F7C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1B3012278(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1B3012544(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1B30127D0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1B3012AC8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1B3012DC4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1B30130C0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1B301337C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1B30136B0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1B3013A24(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1B3013F18(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1B30141EC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1B30145BC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1B3014954(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1B3014C50(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1B3014F48(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1B30151C0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1B3015438(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1B30156F0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1B3015B08(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1B3015F4C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1B3017E80(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1B3018308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1B3018AC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B3018C68(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 32));
  _Unwind_Resume(a1);
}

void sub_1B3018EF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B30190D8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1B30193FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B3019558(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B30196CC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B3019840(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B3019FFC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B301A170(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B301A2E4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B301A438(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B301A638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B301A854(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B301AA00(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1B301AB78(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B301AD20(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1B301AED0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1B301B04C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B301B1EC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1B301C138(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B301C814(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B301CBDC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 104));
  _Unwind_Resume(a1);
}

void sub_1B301CF10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B301D878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B301D9E0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B301DAE0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B301DBC4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B301E5AC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B301E720(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B301E894(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B301E9E8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B301EB3C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B301EC90(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B301EDE4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B301EFE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B301F72C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B301FB5C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1B301FED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3020008(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1B3020110(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B3020460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B3020604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_1B30208CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B3020B04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_1B3020DCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B3021000(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B302122C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B30213A0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B3021BDC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1B302219C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1B302274C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B3022C98(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_1B3024ED0(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf)
{
  if (a2 == 1)
  {
    id v11 = objc_begin_catch(a1);
    uint64_t v12 = LogCategory_PowerManagement();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_1B2FD8000, v12, OS_LOG_TYPE_DEFAULT, "Exception caught while attempting to take power assertion: %@", (uint8_t *)&buf, 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x1B3024E98);
  }
  _Unwind_Resume(a1);
}

void sub_1B3026B34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B3027078(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B3027974(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B3028C74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B3028E84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B3029094(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B30292A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B30294B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B30296C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B30298C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B3029AEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B3029D34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B3029F74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B302A168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_1B302A378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B302A55C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

uint64_t observerTrampoline(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handleDarwinNotificationNamed:");
}

void sub_1B302C534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_1B302D2E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t inPostEraseSetupAssistant()
{
  uint64_t result = SetupAssistantLibraryCore();
  if (result)
  {
    uint64_t v5 = 0;
    uint64_t v6 = &v5;
    uint64_t v7 = 0x2020000000;
    uint64_t v1 = (uint64_t (*)(void))getBYSetupAssistantHasCompletedInitialRunSymbolLoc_ptr;
    uint64_t v8 = getBYSetupAssistantHasCompletedInitialRunSymbolLoc_ptr;
    if (!getBYSetupAssistantHasCompletedInitialRunSymbolLoc_ptr)
    {
      id v2 = (void *)SetupAssistantLibrary();
      v6[3] = (uint64_t)dlsym(v2, "BYSetupAssistantHasCompletedInitialRun");
      getBYSetupAssistantHasCompletedInitialRunSymbolLoc_ptr = (_UNKNOWN *)v6[3];
      uint64_t v1 = (uint64_t (*)(void))v6[3];
    }
    _Block_object_dispose(&v5, 8);
    if (!v1) {
      inPostEraseSetupAssistant_cold_1();
    }
    if (v1())
    {
      return 0;
    }
    else
    {
      uint64_t v5 = 0;
      uint64_t v6 = &v5;
      uint64_t v7 = 0x2020000000;
      uint64_t v3 = (uint64_t (*)(void))getBYSetupAssistantNeedsToRunSymbolLoc_ptr;
      uint64_t v8 = getBYSetupAssistantNeedsToRunSymbolLoc_ptr;
      if (!getBYSetupAssistantNeedsToRunSymbolLoc_ptr)
      {
        uint64_t v4 = (void *)SetupAssistantLibrary();
        v6[3] = (uint64_t)dlsym(v4, "BYSetupAssistantNeedsToRun");
        getBYSetupAssistantNeedsToRunSymbolLoc_ptr = (_UNKNOWN *)v6[3];
        uint64_t v3 = (uint64_t (*)(void))v6[3];
      }
      _Block_object_dispose(&v5, 8);
      if (!v3) {
        inPostEraseSetupAssistant_cold_2();
      }
      return v3();
    }
  }
  return result;
}

void sub_1B302FF78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SetupAssistantLibraryCore()
{
  if (!SetupAssistantLibraryCore_frameworkLibrary) {
    SetupAssistantLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return SetupAssistantLibraryCore_frameworkLibrary;
}

uint64_t __SetupAssistantLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SetupAssistantLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getBYSetupAssistantHasCompletedInitialRunSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)SetupAssistantLibrary();
  uint64_t result = dlsym(v2, "BYSetupAssistantHasCompletedInitialRun");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBYSetupAssistantHasCompletedInitialRunSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SetupAssistantLibrary()
{
  uint64_t v1 = 0;
  uint64_t result = SetupAssistantLibraryCore();
  if (!result) {
    SetupAssistantLibrary_cold_1(&v1);
  }
  return result;
}

void *__getBYSetupAssistantNeedsToRunSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)SetupAssistantLibrary();
  uint64_t result = dlsym(v2, "BYSetupAssistantNeedsToRun");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBYSetupAssistantNeedsToRunSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id allBeaconTypes()
{
  if (allBeaconTypes_onceToken != -1) {
    dispatch_once(&allBeaconTypes_onceToken, &__block_literal_global_15);
  }
  id v0 = (void *)allBeaconTypes__allBeaconTypes;

  return v0;
}

void __allBeaconTypes_block_invoke()
{
  v4[6] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v4[0] = @"accessory";
  v4[1] = @"selfBeaconing";
  v4[2] = @"durian";
  v4[3] = @"hele";
  v4[4] = @"localFindable";
  v4[5] = @"virtualMeDevice";
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:6];
  uint64_t v2 = [v0 initWithArray:v1];
  uint64_t v3 = (void *)allBeaconTypes__allBeaconTypes;
  allBeaconTypes__allBeaconTypes = v2;
}

void sub_1B30329F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_1B3032CF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B3032FBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B3033280(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B3033544(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B3033808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B3033A88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_1B3033D20(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 48));
  _Unwind_Resume(a1);
}

void sub_1B30341D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B3034C84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_1B3034F80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B3035248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B30354EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_1B303576C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_1B3035A3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B3036ACC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 64));
  _Unwind_Resume(a1);
}

void sub_1B3036E00(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 64));
  _Unwind_Resume(a1);
}

void sub_1B30370DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B30373CC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 64));
  _Unwind_Resume(a1);
}

void sub_1B30376A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B3037E5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B3038134(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B30383F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B30385EC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B3038A00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_1B303B1F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B303D850(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B303EB48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B303F2E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_1B303F498(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 48));
  _Unwind_Resume(a1);
}

void sub_1B303F75C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 48));
  _Unwind_Resume(a1);
}

void sub_1B303FA38(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 48));
  _Unwind_Resume(a1);
}

void sub_1B303FCE0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 48));
  _Unwind_Resume(a1);
}

void sub_1B303FEC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1B3040080(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 48));
  _Unwind_Resume(a1);
}

uint64_t sp_IDS_supportsIDSRegistrationPropertySupportsFMDV2()
{
  return 1;
}

void serviceSettingsChangedTrampoline()
{
  if (settingsChangedNotificationQueue_onceToken[0] != -1) {
    dispatch_once(settingsChangedNotificationQueue_onceToken, &__block_literal_global_279);
  }
  id v0 = settingsChangedNotificationQueue_settingsChangedNotificationQ;

  dispatch_async(v0, &__block_literal_global_18);
}

void sub_1B3043480(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void __serviceSettingsChangedTrampoline_block_invoke()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:SPServiceSettingsChangedLocalNotification object:0];
}

uint64_t __settingsChangedNotificationQueue_block_invoke()
{
  settingsChangedNotificationQueue_settingsChangedNotificationQ = (uint64_t)dispatch_queue_create("com.apple.icloud.searchpartyd.settingsChangedNotificationQ", 0);

  return MEMORY[0x1F41817F8]();
}

uint64_t LocalBeaconKeyInfo.userIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1B304A038();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t LocalBeaconKeyInfo.beaconIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for LocalBeaconKeyInfo() + 20);
  uint64_t v4 = sub_1B304A038();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for LocalBeaconKeyInfo()
{
  uint64_t result = qword_1EB6379E0;
  if (!qword_1EB6379E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t LocalBeaconKeyInfo.pairDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for LocalBeaconKeyInfo() + 24);
  uint64_t v4 = sub_1B304A028();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t LocalBeaconKeyInfo.publicKey.getter()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for LocalBeaconKeyInfo() + 28);
  uint64_t v2 = *(void *)v1;
  sub_1B3044034(*(void *)v1, *(void *)(v1 + 8));
  return v2;
}

uint64_t sub_1B3044034(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t LocalBeaconKeyInfo.sharedSecretKey.getter()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for LocalBeaconKeyInfo() + 32);
  uint64_t v2 = *(void *)v1;
  sub_1B3044034(*(void *)v1, *(void *)(v1 + 8));
  return v2;
}

uint64_t LocalBeaconKeyInfo.init(userIdentifier:beaconIdentifier:pairDate:publicKey:sharedSecretKey:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v15 = sub_1B304A038();
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32);
  v16(a8, a1, v15);
  uint64_t v17 = (int *)type metadata accessor for LocalBeaconKeyInfo();
  v16(a8 + v17[5], a2, v15);
  uint64_t v18 = a8 + v17[6];
  uint64_t v19 = sub_1B304A028();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(v18, a3, v19);
  uint64_t v21 = (void *)(a8 + v17[7]);
  *uint64_t v21 = a4;
  v21[1] = a5;
  v22 = (void *)(a8 + v17[8]);
  void *v22 = a6;
  v22[1] = a7;
  return result;
}

uint64_t LocalBeaconKeyInfo.description.getter()
{
  sub_1B304A108();
  swift_bridgeObjectRelease();
  uint64_t v1 = type metadata accessor for LocalBeaconKeyInfo();
  sub_1B304A028();
  sub_1B3045104(&qword_1E9CB1F90, MEMORY[0x1E4F27928]);
  sub_1B304A168();
  sub_1B304A098();
  swift_bridgeObjectRelease();
  sub_1B304A098();
  uint64_t v2 = (uint64_t *)(v0 + *(int *)(v1 + 28));
  uint64_t v3 = *v2;
  unint64_t v4 = v2[1];
  sub_1B3044034(*v2, v4);
  sub_1B304A018();
  sub_1B304A098();
  swift_bridgeObjectRelease();
  sub_1B30443BC(v3, v4);
  sub_1B304A098();
  uint64_t v5 = (uint64_t *)(v0 + *(int *)(v1 + 32));
  uint64_t v6 = *v5;
  unint64_t v7 = v5[1];
  sub_1B3044034(*v5, v7);
  sub_1B304A018();
  sub_1B304A098();
  swift_bridgeObjectRelease();
  sub_1B30443BC(v6, v7);
  sub_1B304A098();
  return 0x203A726961703CLL;
}

uint64_t sub_1B30443BC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

unint64_t sub_1B3044414(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0x6574614472696170;
      break;
    case 3:
      unint64_t result = 0x654B63696C627570;
      break;
    case 4:
      unint64_t result = 0x6553646572616873;
      break;
    default:
      unint64_t result = 0x6E65644972657375;
      break;
  }
  return result;
}

BOOL sub_1B30444E4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1B30444F8()
{
  return sub_1B304A1B8();
}

uint64_t sub_1B3044540()
{
  return sub_1B304A1A8();
}

uint64_t sub_1B304456C()
{
  return sub_1B304A1B8();
}

unint64_t sub_1B30445B0()
{
  return sub_1B3044414(*v0);
}

uint64_t sub_1B30445B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1B3045F50(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1B30445E0()
{
  return 0;
}

void sub_1B30445EC(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_1B30445F8(uint64_t a1)
{
  unint64_t v2 = sub_1B30449C4();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1B3044634(uint64_t a1)
{
  unint64_t v2 = sub_1B30449C4();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t LocalBeaconKeyInfo.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CB1F98);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B30449C4();
  sub_1B304A1D8();
  LOBYTE(v11) = 0;
  sub_1B304A038();
  sub_1B3045104(&qword_1E9CB1FA8, MEMORY[0x1E4F27990]);
  sub_1B304A158();
  if (!v2)
  {
    uint64_t v9 = type metadata accessor for LocalBeaconKeyInfo();
    LOBYTE(v11) = 1;
    sub_1B304A158();
    LOBYTE(v11) = 2;
    sub_1B304A028();
    sub_1B3045104(&qword_1E9CB1FB0, MEMORY[0x1E4F27928]);
    sub_1B304A158();
    long long v11 = *(_OWORD *)(v3 + *(int *)(v9 + 28));
    char v12 = 3;
    sub_1B3044A18();
    sub_1B304A158();
    long long v11 = *(_OWORD *)(v3 + *(int *)(v9 + 32));
    char v12 = 4;
    sub_1B304A158();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_1B30449C4()
{
  unint64_t result = qword_1E9CB1FA0;
  if (!qword_1E9CB1FA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CB1FA0);
  }
  return result;
}

unint64_t sub_1B3044A18()
{
  unint64_t result = qword_1E9CB1FB8;
  if (!qword_1E9CB1FB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CB1FB8);
  }
  return result;
}

uint64_t LocalBeaconKeyInfo.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v26 = a2;
  uint64_t v31 = sub_1B304A028();
  uint64_t v27 = *(void *)(v31 - 8);
  ((void (*)(void))MEMORY[0x1F4188790])();
  unint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_1B304A038();
  uint64_t v28 = *(void *)(v34 - 8);
  uint64_t v5 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  v30 = (char *)&v22 - v8;
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CB1FC0);
  uint64_t v29 = *(void *)(v33 - 8);
  MEMORY[0x1F4188790](v33);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for LocalBeaconKeyInfo();
  MEMORY[0x1F4188790](v11);
  int v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B30449C4();
  v32 = v10;
  uint64_t v14 = (uint64_t)v35;
  sub_1B304A1C8();
  if (v14) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  v23 = v4;
  v24 = (int *)v11;
  v25 = v13;
  v35 = a1;
  uint64_t v15 = v31;
  LOBYTE(v36) = 0;
  sub_1B3045104(&qword_1E9CB1FC8, MEMORY[0x1E4F27990]);
  uint64_t v16 = v30;
  sub_1B304A148();
  v30 = *(char **)(v28 + 32);
  ((void (*)(char *, char *, uint64_t))v30)(v25, v16, v34);
  LOBYTE(v36) = 1;
  sub_1B304A148();
  uint64_t v17 = v24;
  ((void (*)(char *, char *, uint64_t))v30)(&v25[v24[5]], v7, v34);
  LOBYTE(v36) = 2;
  sub_1B3045104(&qword_1E9CB1FD0, MEMORY[0x1E4F27928]);
  uint64_t v18 = v23;
  uint64_t v19 = v15;
  v30 = 0;
  sub_1B304A148();
  uint64_t v20 = (uint64_t)v25;
  (*(void (**)(char *, char *, uint64_t))(v27 + 32))(&v25[v17[6]], v18, v19);
  char v37 = 3;
  sub_1B304514C();
  sub_1B304A148();
  *(_OWORD *)(v20 + v17[7]) = v36;
  char v37 = 4;
  sub_1B304A148();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v32, v33);
  *(_OWORD *)(v20 + v17[8]) = v36;
  sub_1B30451A0(v20, v26);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
  return sub_1B3045204(v20);
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1B3045104(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1B304514C()
{
  unint64_t result = qword_1E9CB1FD8;
  if (!qword_1E9CB1FD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CB1FD8);
  }
  return result;
}

uint64_t sub_1B30451A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LocalBeaconKeyInfo();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B3045204(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LocalBeaconKeyInfo();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B3045260@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return LocalBeaconKeyInfo.init(from:)(a1, a2);
}

uint64_t sub_1B3045278(void *a1)
{
  return LocalBeaconKeyInfo.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for LocalBeaconKeyInfo(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v23 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v23 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1B304A038();
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + a3[5]), (uint64_t *)((char *)a2 + a3[5]), v7);
    uint64_t v9 = a3[6];
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_1B304A028();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    uint64_t v13 = a3[7];
    uint64_t v14 = (uint64_t *)((char *)a1 + v13);
    uint64_t v15 = (uint64_t *)((char *)a2 + v13);
    uint64_t v16 = *v15;
    unint64_t v17 = v15[1];
    sub_1B3044034(*v15, v17);
    *uint64_t v14 = v16;
    v14[1] = v17;
    uint64_t v18 = a3[8];
    uint64_t v19 = (uint64_t *)((char *)a1 + v18);
    uint64_t v20 = (uint64_t *)((char *)a2 + v18);
    uint64_t v21 = *v20;
    unint64_t v22 = v20[1];
    sub_1B3044034(*v20, v22);
    *uint64_t v19 = v21;
    v19[1] = v22;
  }
  return a1;
}

uint64_t destroy for LocalBeaconKeyInfo(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_1B304A038();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + a2[5], v4);
  uint64_t v6 = a1 + a2[6];
  uint64_t v7 = sub_1B304A028();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  sub_1B30443BC(*(void *)(a1 + a2[7]), *(void *)(a1 + a2[7] + 8));
  uint64_t v8 = (uint64_t *)(a1 + a2[8]);
  uint64_t v9 = *v8;
  unint64_t v10 = v8[1];

  return sub_1B30443BC(v9, v10);
}

uint64_t initializeWithCopy for LocalBeaconKeyInfo(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1B304A038();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_1B304A028();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  uint64_t v12 = a3[7];
  uint64_t v13 = (uint64_t *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v15 = *v14;
  unint64_t v16 = v14[1];
  sub_1B3044034(*v14, v16);
  *uint64_t v13 = v15;
  v13[1] = v16;
  uint64_t v17 = a3[8];
  uint64_t v18 = (uint64_t *)(a1 + v17);
  uint64_t v19 = (uint64_t *)(a2 + v17);
  uint64_t v20 = *v19;
  unint64_t v21 = v19[1];
  sub_1B3044034(*v19, v21);
  *uint64_t v18 = v20;
  v18[1] = v21;
  return a1;
}

uint64_t assignWithCopy for LocalBeaconKeyInfo(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1B304A038();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_1B304A028();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 24))(v9, v10, v11);
  uint64_t v12 = a3[7];
  uint64_t v13 = (uint64_t *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v15 = *v14;
  unint64_t v16 = v14[1];
  sub_1B3044034(*v14, v16);
  uint64_t v17 = *v13;
  unint64_t v18 = v13[1];
  *uint64_t v13 = v15;
  v13[1] = v16;
  sub_1B30443BC(v17, v18);
  uint64_t v19 = a3[8];
  uint64_t v20 = (uint64_t *)(a1 + v19);
  unint64_t v21 = (uint64_t *)(a2 + v19);
  uint64_t v22 = *v21;
  unint64_t v23 = v21[1];
  sub_1B3044034(*v21, v23);
  uint64_t v24 = *v20;
  unint64_t v25 = v20[1];
  *uint64_t v20 = v22;
  v20[1] = v23;
  sub_1B30443BC(v24, v25);
  return a1;
}

uint64_t initializeWithTake for LocalBeaconKeyInfo(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1B304A038();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_1B304A028();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  uint64_t v12 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  return a1;
}

uint64_t assignWithTake for LocalBeaconKeyInfo(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1B304A038();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_1B304A028();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  uint64_t v12 = a3[7];
  uint64_t v13 = *(void *)(a1 + v12);
  unint64_t v14 = *(void *)(a1 + v12 + 8);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  sub_1B30443BC(v13, v14);
  uint64_t v15 = a3[8];
  uint64_t v16 = *(void *)(a1 + v15);
  unint64_t v17 = *(void *)(a1 + v15 + 8);
  *(_OWORD *)(a1 + v15) = *(_OWORD *)(a2 + v15);
  sub_1B30443BC(v16, v17);
  return a1;
}

uint64_t getEnumTagSinglePayload for LocalBeaconKeyInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B3045960);
}

uint64_t sub_1B3045960(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1B304A038();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
  }
  else
  {
    uint64_t v11 = sub_1B304A028();
    uint64_t v12 = *(void *)(v11 - 8);
    if (*(_DWORD *)(v12 + 84) != a2)
    {
      uint64_t v14 = *(void *)(a1 + *(int *)(a3 + 28) + 8) >> 60;
      if (((4 * v14) & 0xC) != 0) {
        return 16 - ((4 * v14) & 0xC | (v14 >> 2));
      }
      else {
        return 0;
      }
    }
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }

  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for LocalBeaconKeyInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B3045A9C);
}

uint64_t sub_1B3045A9C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_1B304A038();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = sub_1B304A028();
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      uint64_t v15 = (void *)(a1 + *(int *)(a4 + 28));
      void *v15 = 0;
      v15[1] = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * a2) << 60;
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 24);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

uint64_t sub_1B3045BBC()
{
  uint64_t result = sub_1B304A038();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_1B304A028();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  void *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LocalBeaconKeyInfo.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for LocalBeaconKeyInfo.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    void *result = a2 + 4;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1B3045DFCLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          void *result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_1B3045E24(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1B3045E30(unsigned char *result, char a2)
{
  void *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for LocalBeaconKeyInfo.CodingKeys()
{
  return &type metadata for LocalBeaconKeyInfo.CodingKeys;
}

unint64_t sub_1B3045E4C()
{
  unint64_t result = qword_1E9CB1FE0;
  if (!qword_1E9CB1FE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CB1FE0);
  }
  return result;
}

unint64_t sub_1B3045EA4()
{
  unint64_t result = qword_1E9CB1FE8;
  if (!qword_1E9CB1FE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CB1FE8);
  }
  return result;
}

unint64_t sub_1B3045EFC()
{
  unint64_t result = qword_1E9CB1FF0;
  if (!qword_1E9CB1FF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1E9CB1FF0);
  }
  return result;
}

uint64_t sub_1B3045F50(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6E65644972657375 && a2 == 0xEE00726569666974;
  if (v3 || (sub_1B304A178() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x80000001B3059A00 || (sub_1B304A178() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6574614472696170 && a2 == 0xE800000000000000 || (sub_1B304A178() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x654B63696C627570 && a2 == 0xE900000000000079 || (sub_1B304A178() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6553646572616873 && a2 == 0xEF79654B74657263)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_1B304A178();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_1B3046188()
{
  *(void *)(v1 + 64) = v0;
  return MEMORY[0x1F4188298](sub_1B30461A8, v0, 0);
}

uint64_t sub_1B30461A8()
{
  swift_beginAccess();
  uint64_t v1 = swift_bridgeObjectRetain();
  char v2 = sub_1B3046F34(v1);
  swift_bridgeObjectRelease();
  if (v2)
  {
    sub_1B304A108();
    v0[5] = 0;
    v0[6] = 0xE000000000000000;
    sub_1B304A098();
    sub_1B304A118();
    sub_1B304A098();
    return sub_1B304A128();
  }
  else
  {
    swift_beginAccess();
    sub_1B30466D4();
    swift_endAccess();
    if (qword_1EB6378F0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_1B304A068();
    __swift_project_value_buffer(v4, (uint64_t)qword_1EB637DF8);
    uint64_t v5 = sub_1B304A048();
    os_log_type_t v6 = sub_1B304A0D8();
    if (os_log_type_enabled(v5, v6))
    {
      BOOL v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)BOOL v7 = 0;
      _os_log_impl(&dword_1B2FD8000, v5, v6, "Booted SPOwner bluetoothd Swift context", v7, 2u);
      MEMORY[0x1B3EB4E00](v7, -1, -1);
    }

    int v8 = (uint64_t (*)(void))v0[1];
    return v8();
  }
}

uint64_t sub_1B30463EC()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();

  return MEMORY[0x1F4188210](v0);
}

uint64_t type metadata accessor for SwiftBootstrapManager()
{
  return self;
}

uint64_t getEnumTagSinglePayload for SwiftBootstrapManager.Context(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for SwiftBootstrapManager.Context(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        void *result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      void *result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1B3046538);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1B3046560()
{
  return 0;
}

ValueMetadata *type metadata accessor for SwiftBootstrapManager.Context()
{
  return &type metadata for SwiftBootstrapManager.Context;
}

uint64_t sub_1B3046578()
{
  return v0;
}

uint64_t sub_1B3046594@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_1B304A138();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_1B30465E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1B3046FD0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_1B3046614()
{
  unint64_t result = qword_1EB6378E8;
  if (!qword_1EB6378E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6378E8);
  }
  return result;
}

uint64_t sub_1B3046668()
{
  uint64_t v0 = sub_1B304A068();
  __swift_allocate_value_buffer(v0, qword_1EB637DF8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EB637DF8);
  return sub_1B304A058();
}

BOOL sub_1B30466D4()
{
  uint64_t v1 = *v0;
  sub_1B304A198();
  swift_bridgeObjectRetain();
  sub_1B304A088();
  unint64_t v2 = sub_1B304A1B8() & ~(-1 << *(unsigned char *)(v1 + 32));
  uint64_t v3 = (1 << v2) & *(void *)(v1 + ((v2 >> 3) & 0xFFFFFFFFFFFFFF8) + 56);
  swift_bridgeObjectRelease();
  if (!v3)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v6 = *v0;
    uint64_t *v0 = 0x8000000000000000;
    sub_1B3046A5C(v2, isUniquelyReferenced_nonNull_native);
    uint64_t *v0 = v6;
    swift_bridgeObjectRelease();
  }
  return v3 == 0;
}

uint64_t sub_1B30467C4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_1EB637900);
  uint64_t v3 = sub_1B304A0F8();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    uint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (!v8)
      {
        int64_t v14 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_36:
          __break(1u);
LABEL_37:
          __break(1u);
          return result;
        }
        if (v14 >= v9) {
          goto LABEL_31;
        }
        uint64_t v8 = v6[v14];
        ++v12;
        if (!v8)
        {
          int64_t v12 = v14 + 1;
          if (v14 + 1 >= v9) {
            goto LABEL_31;
          }
          uint64_t v8 = v6[v12];
          if (!v8)
          {
            int64_t v12 = v14 + 2;
            if (v14 + 2 >= v9) {
              goto LABEL_31;
            }
            uint64_t v8 = v6[v12];
            if (!v8)
            {
              int64_t v15 = v14 + 3;
              if (v15 >= v9)
              {
LABEL_31:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v23 = 1 << *(unsigned char *)(v2 + 32);
                if (v23 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v23 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v23;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              uint64_t v8 = v6[v15];
              if (!v8)
              {
                while (1)
                {
                  int64_t v12 = v15 + 1;
                  if (__OFADD__(v15, 1)) {
                    goto LABEL_37;
                  }
                  if (v12 >= v9) {
                    goto LABEL_31;
                  }
                  uint64_t v8 = v6[v12];
                  ++v15;
                  if (v8) {
                    goto LABEL_22;
                  }
                }
              }
              int64_t v12 = v15;
            }
          }
        }
      }
LABEL_22:
      sub_1B304A198();
      sub_1B304A088();
      uint64_t result = sub_1B304A1B8();
      uint64_t v16 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v17 = result & ~v16;
      unint64_t v18 = v17 >> 6;
      if (((-1 << v17) & ~*(void *)(v10 + 8 * (v17 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v17) & ~*(void *)(v10 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v19 = 0;
        unint64_t v20 = (unint64_t)(63 - v16) >> 6;
        do
        {
          if (++v18 == v20 && (v19 & 1) != 0)
          {
            __break(1u);
            goto LABEL_36;
          }
          BOOL v21 = v18 == v20;
          if (v18 == v20) {
            unint64_t v18 = 0;
          }
          v19 |= v21;
          uint64_t v22 = *(void *)(v10 + 8 * v18);
        }
        while (v22 == -1);
        unint64_t v13 = __clz(__rbit64(~v22)) + (v18 << 6);
      }
      v8 &= v8 - 1;
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_1B3046A5C(uint64_t result, char a2)
{
  unint64_t v3 = result;
  unint64_t v4 = *(void *)(*v2 + 16);
  unint64_t v5 = *(void *)(*v2 + 24);
  if (v5 <= v4 || (a2 & 1) == 0)
  {
    if (a2)
    {
      sub_1B30467C4();
      goto LABEL_8;
    }
    if (v5 <= v4)
    {
      sub_1B3046CD0();
LABEL_8:
      uint64_t v6 = *v2;
      sub_1B304A198();
      sub_1B304A088();
      uint64_t result = sub_1B304A1B8();
      unint64_t v3 = result & ~(-1 << *(unsigned char *)(v6 + 32));
      if ((*(void *)(v6 + ((v3 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) >> v3)) {
        goto LABEL_12;
      }
      goto LABEL_9;
    }
    uint64_t result = (uint64_t)sub_1B3046B70();
  }
LABEL_9:
  uint64_t v7 = *v2;
  *(void *)(*v2 + 8 * (v3 >> 6) + 56) |= 1 << v3;
  uint64_t v8 = *(void *)(v7 + 16);
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (!v9)
  {
    *(void *)(v7 + 16) = v10;
    return result;
  }
  __break(1u);
LABEL_12:
  uint64_t result = sub_1B304A188();
  __break(1u);
  return result;
}

void *sub_1B3046B70()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_1EB637900);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1B304A0E8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_27:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  uint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (!v12)
    {
      int64_t v14 = v9 + 1;
      if (__OFADD__(v9, 1))
      {
        __break(1u);
        goto LABEL_29;
      }
      if (v14 >= v13) {
        goto LABEL_27;
      }
      uint64_t v12 = *(void *)(v6 + 8 * v14);
      ++v9;
      if (!v12)
      {
        int64_t v9 = v14 + 1;
        if (v14 + 1 >= v13) {
          goto LABEL_27;
        }
        uint64_t v12 = *(void *)(v6 + 8 * v9);
        if (!v12)
        {
          int64_t v9 = v14 + 2;
          if (v14 + 2 >= v13) {
            goto LABEL_27;
          }
          uint64_t v12 = *(void *)(v6 + 8 * v9);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_12:
    v12 &= v12 - 1;
  }
  int64_t v15 = v14 + 3;
  if (v15 >= v13) {
    goto LABEL_27;
  }
  uint64_t v12 = *(void *)(v6 + 8 * v15);
  if (v12)
  {
    int64_t v9 = v15;
    goto LABEL_12;
  }
  while (1)
  {
    int64_t v9 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_27;
    }
    uint64_t v12 = *(void *)(v6 + 8 * v9);
    ++v15;
    if (v12) {
      goto LABEL_12;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_1B3046CD0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_1EB637900);
  uint64_t v3 = sub_1B304A0F8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_33:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  uint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (!v8)
    {
      int64_t v14 = v12 + 1;
      if (__OFADD__(v12, 1))
      {
LABEL_34:
        __break(1u);
        goto LABEL_35;
      }
      if (v14 >= v9) {
        goto LABEL_31;
      }
      uint64_t v8 = *(void *)(v6 + 8 * v14);
      ++v12;
      if (!v8)
      {
        int64_t v12 = v14 + 1;
        if (v14 + 1 >= v9) {
          goto LABEL_31;
        }
        uint64_t v8 = *(void *)(v6 + 8 * v12);
        if (!v8)
        {
          int64_t v12 = v14 + 2;
          if (v14 + 2 >= v9) {
            goto LABEL_31;
          }
          uint64_t v8 = *(void *)(v6 + 8 * v12);
          if (!v8) {
            break;
          }
        }
      }
    }
LABEL_22:
    sub_1B304A198();
    sub_1B304A088();
    uint64_t result = sub_1B304A1B8();
    uint64_t v16 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v17 = result & ~v16;
    unint64_t v18 = v17 >> 6;
    if (((-1 << v17) & ~*(void *)(v10 + 8 * (v17 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v17) & ~*(void *)(v10 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v19 = 0;
      unint64_t v20 = (unint64_t)(63 - v16) >> 6;
      do
      {
        if (++v18 == v20 && (v19 & 1) != 0)
        {
          __break(1u);
          goto LABEL_34;
        }
        BOOL v21 = v18 == v20;
        if (v18 == v20) {
          unint64_t v18 = 0;
        }
        v19 |= v21;
        uint64_t v22 = *(void *)(v10 + 8 * v18);
      }
      while (v22 == -1);
      unint64_t v13 = __clz(__rbit64(~v22)) + (v18 << 6);
    }
    v8 &= v8 - 1;
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    ++*(void *)(v4 + 16);
  }
  int64_t v15 = v14 + 3;
  if (v15 >= v9)
  {
LABEL_31:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_33;
  }
  uint64_t v8 = *(void *)(v6 + 8 * v15);
  if (v8)
  {
    int64_t v12 = v15;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v12 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_31;
    }
    uint64_t v8 = *(void *)(v6 + 8 * v12);
    ++v15;
    if (v8) {
      goto LABEL_22;
    }
  }
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_1B3046F34(uint64_t a1)
{
  if (!*(void *)(a1 + 16)) {
    return 0;
  }
  sub_1B304A198();
  sub_1B304A088();
  unint64_t v2 = sub_1B304A1B8() & ~(-1 << *(unsigned char *)(a1 + 32));
  return (*(void *)(a1 + ((v2 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) >> v2) & 1;
}

uint64_t sub_1B3046FC8()
{
  return 1;
}

uint64_t sub_1B3046FD0()
{
  return 0x746F6F7465756C62;
}

uint64_t sub_1B3046FEC()
{
  return sub_1B304A1B8();
}

uint64_t sub_1B3047044()
{
  return sub_1B304A088();
}

uint64_t sub_1B3047060()
{
  return sub_1B304A1B8();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1B3047150()
{
  type metadata accessor for SwiftBootstrapManager();
  uint64_t v0 = swift_allocObject();
  uint64_t result = swift_defaultActor_initialize();
  *(void *)(v0 + 112) = MEMORY[0x1E4FBC870];
  qword_1EB637DF0 = v0;
  return result;
}

uint64_t static ObjCSwiftBridge.bootstrap(context:)(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1E9CB2008 + dword_1E9CB2008);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1B3047250;
  return v7(a1, a2);
}

uint64_t sub_1B3047250()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1B30474BC(int a1, void *aBlock)
{
  v2[2] = _Block_copy(aBlock);
  uint64_t v3 = sub_1B304A078();
  uint64_t v5 = v4;
  v2[3] = v4;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1E9CB2008 + dword_1E9CB2008);
  uint64_t v6 = (void *)swift_task_alloc();
  v2[4] = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_1B304758C;
  return v8(v3, v5);
}

uint64_t sub_1B304758C()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(v3 + 16);
  if (v2)
  {
    uint64_t v7 = (void *)sub_1B304A008();

    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
  _Block_release(*(const void **)(v4 + 16));
  uint64_t v8 = *(uint64_t (**)(void))(v5 + 8);
  return v8();
}

id ObjCSwiftBridge.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id ObjCSwiftBridge.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ObjCSwiftBridge();
  return objc_msgSendSuper2(&v2, sel_init);
}

id ObjCSwiftBridge.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ObjCSwiftBridge();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1B30477F4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_1B30483F4;
  return v6();
}

uint64_t sub_1B30478C0(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_1B30483F4;
  return v7();
}

uint64_t sub_1B304798C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1B304A0C8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1B304A0B8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1B30482A4(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1B304A0A8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1B3047B30(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_1B3047C0C;
  return v6(a1);
}

uint64_t sub_1B3047C0C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1B3047D04(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return MEMORY[0x1F4188298](sub_1B3047D24, 0, 0);
}

uint64_t sub_1B3047D24()
{
  swift_bridgeObjectRetain();
  uint64_t v1 = sub_1B304A138();
  swift_bridgeObjectRelease();
  if (v1)
  {
    sub_1B304A108();
    swift_bridgeObjectRelease();
    sub_1B304A098();
    sub_1B304A098();
    return sub_1B304A128();
  }
  else
  {
    if (qword_1EB6378E0 != -1) {
      swift_once();
    }
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 32) = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_1B3047EC4;
    return sub_1B3046188();
  }
}

uint64_t sub_1B3047EC4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t type metadata accessor for ObjCSwiftBridge()
{
  return self;
}

uint64_t sub_1B3047FDC()
{
  _Block_release(*(const void **)(v0 + 24));

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1B304801C()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_1B3047250;
  uint64_t v5 = (uint64_t (*)(int, void *))((char *)&dword_1E9CB2010 + dword_1E9CB2010);
  return v5(v2, v3);
}

uint64_t sub_1B30480D4()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_1B30483F4;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1E9CB2020 + dword_1E9CB2020);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_6Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1B30481D8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1B30483F4;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1E9CB2030 + dword_1E9CB2030);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_1B30482A4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6378F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B3048304()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1B304833C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1B3047250;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1E9CB2040 + dword_1E9CB2040);
  return v6(a1, v4);
}

void __bluetoothContextStartup_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void inPostEraseSetupAssistant_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"BOOL _BYSetupAssistantHasCompletedInitialRun(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SPSetupAssistantHelper.m", 20, @"%s", dlerror());

  __break(1u);
}

void inPostEraseSetupAssistant_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"BOOL _BYSetupAssistantNeedsToRun(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SPSetupAssistantHelper.m", 21, @"%s", dlerror());

  __break(1u);
}

void SetupAssistantLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *SetupAssistantLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SPSetupAssistantHelper.m", 19, @"%s", *a1);

  __break(1u);
}

uint64_t sub_1B304A008()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1B304A018()
{
  return MEMORY[0x1F40E4C30]();
}

uint64_t sub_1B304A028()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1B304A038()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1B304A048()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1B304A058()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1B304A068()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1B304A078()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1B304A088()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1B304A098()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1B304A0A8()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1B304A0B8()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1B304A0C8()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1B304A0D8()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1B304A0E8()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1B304A0F8()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1B304A108()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1B304A118()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1B304A128()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1B304A138()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1B304A148()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1B304A158()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1B304A168()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1B304A178()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1B304A188()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1B304A198()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1B304A1A8()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1B304A1B8()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1B304A1C8()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1B304A1D8()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t CCDeriveKey()
{
  return MEMORY[0x1F40C9540]();
}

uint64_t CCECCryptorExportKey()
{
  return MEMORY[0x1F40C9598]();
}

uint64_t CCECCryptorImportKey()
{
  return MEMORY[0x1F40C95B8]();
}

uint64_t CCECCryptorRelease()
{
  return MEMORY[0x1F40C95C0]();
}

uint64_t CCECCryptorTwinDiversifyKey()
{
  return MEMORY[0x1F40C95C8]();
}

uint64_t CCKDFParametersCreateAnsiX963()
{
  return MEMORY[0x1F40C9628]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

uint64_t FMEmptyResult()
{
  return MEMORY[0x1F41188B8]();
}

IOReturn IOPMAssertionCreateWithProperties(CFDictionaryRef AssertionProperties, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1F40E8F88](AssertionProperties, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1F40E8FA8](*(void *)&AssertionID);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1F40CBD40](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

long double exp2(long double __x)
{
  MEMORY[0x1F40CBFE8](__x);
  return result;
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

long double nextafter(long double __x, long double __y)
{
  MEMORY[0x1F40CCFF8](__x, __y);
  return result;
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1F40CD648]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1F4188218]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1F4188220]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}