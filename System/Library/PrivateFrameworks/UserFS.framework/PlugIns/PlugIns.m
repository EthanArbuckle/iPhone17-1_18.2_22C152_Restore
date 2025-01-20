uint64_t exfat_timestamp_to_unix(uint64_t result, int a2, int a3, void *a4)
{
  signed int v4;
  unsigned int v5;
  unsigned __int16 *v7;
  BOOL v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;

  if ((a3 & 0x80) != 0) {
    v4 = 900 * ((a3 << 25 >> 31) & 0xFFFFFF80 | a3 & 0x7F);
  }
  else {
    v4 = -exfat_secondsWest;
  }
  v5 = WORD1(result) & 0x1F;
  if (result >> 25 != 120 && (result & 0x6000000) == 0) {
    v7 = (unsigned __int16 *)&leap_months;
  }
  else {
    v7 = (unsigned __int16 *)&non_leap_months;
  }
  v8 = v5 != 0;
  v9 = v5 - 1;
  v10 = (result >> 21) & 0xF;
  if (!v8) {
    v9 = 0;
  }
  v11 = v10 - 13;
  v12 = v10 - 1;
  if (v11 < 0xFFFFFFF4) {
    v12 = 0;
  }
  *a4 = 86400
      * (365 * (result >> 25)
       - (result >> 25 > 0x78)
       + v9
       + (((result >> 25) + 3) >> 2)
       + v7[v12])
      - v4
      + 2 * (result & 0x1F)
      + ((41 * a2) >> 12)
      + 60 * ((result >> 5) & 0x3F)
      + 3600 * ((unsigned __int16)result >> 11)
      + 315532800;
  a4[1] = 10000000 * (a2 - 100 * ((41 * a2) >> 12));
  return result;
}

uint64_t exfat_timestamp_to_nanoseconds(uint64_t a1, int a2, int a3)
{
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  exfat_timestamp_to_unix(a1, a2, a3, &v4);
  return v5 + 1000000000 * v4;
}

_DWORD *exfat_timestamp_from_unix(_DWORD *result, unsigned char *a2, unsigned char *a3, void *a4)
{
  if (*a4 < 315532800 - exfat_secondsWest)
  {
    unsigned int v4 = 0;
    int v5 = 0;
    int v6 = 0;
    int v7 = 0;
    int v8 = 0;
    unsigned int v9 = 1;
    if (!result) {
      goto LABEL_15;
    }
LABEL_14:
    *result = (v5 | (v4 >> 1)) + v6 + v7 + (v9 << 21) + v8;
    goto LABEL_15;
  }
  uint64_t v10 = *a4 + exfat_secondsWest - 315532800;
  if (v10 >= 0xFFFFFFFFLL) {
    LODWORD(v10) = -1;
  }
  unsigned int v11 = v10;
  unsigned int v12 = v10 / 0x15180;
  unsigned int v13 = v10 / 0xE10;
  unint64_t v14 = (178956971 * (unint64_t)(v10 / 0xE10)) >> 32;
  unsigned int v15 = v10 / 0x3C;
  unint64_t v16 = (143165577 * (unint64_t)(v10 / 0x3C)) >> 33;
  unsigned int v4 = v10 % 0x3C;
  unsigned int v17 = v11 / 0x7861F80;
  unsigned int v18 = v12 - 1461 * ((22967 * v12) >> 25);
  if (!(_WORD)v18)
  {
    unsigned int v20 = 0;
    unsigned int v19 = 0;
    goto LABEL_10;
  }
  unsigned int v19 = (unsigned __int16)(v18 - 1) / 0x16Du;
  unsigned int v20 = (unsigned __int16)v18 - days_per_year[v19];
  if ((unsigned __int16)v18 <= 0x16Du)
  {
LABEL_10:
    v21 = (unsigned __int16 *)&leap_months;
    goto LABEL_11;
  }
  v21 = (unsigned __int16 *)&non_leap_months;
LABEL_11:
  unsigned int v9 = 0;
  int v22 = v13 - 24 * v14;
  do
    ++v9;
  while (v20 >= v21[v9]);
  int v8 = (v19 << 25) + (v17 << 27);
  int v7 = ((v20 - v21[v9 - 1]) << 16) + 0x10000;
  int v6 = v22 << 11;
  int v5 = 32 * (v15 - 60 * v16);
  if (result) {
    goto LABEL_14;
  }
LABEL_15:
  if (a2)
  {
    uint64_t v23 = ((unsigned __int128)((uint64_t)a4[1] * (__int128)(uint64_t)0xD6BF94D5E57A42BDLL) >> 64) + a4[1];
    *a2 = (v23 < 0) + (v23 >> 23) + (((int)(v4 << 31) >> 31) & 0x64);
  }
  if (a3)
  {
    if (*a4 >= 315532800 - exfat_secondsWest) {
      int v24 = exfat_secondsWest;
    }
    else {
      int v24 = exfat_timezone_diff_01_01_1980;
    }
    *a3 = (v24 / 900) | 0x80;
  }
  return result;
}

uint64_t FSOPS_CheckIfVolumeIsDirty(uint64_t a1)
{
  return (*(unsigned __int16 *)(*(void *)(a1 + 2024) + 106) >> 1) & 1;
}

uint64_t FSOPS_SetDeviceAsDirty(uint64_t a1, char a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = *(_WORD **)(a1 + 2024);
  __int16 v4 = v3[53];
  char v5 = a2 ^ 1;
  if ((v5 & 1) != 0 || (v4 & 2) != 0)
  {
    if ((*(_DWORD *)&v5 & ((v4 & 2) >> 1)) != 1) {
      return 0;
    }
    __int16 v6 = v4 & 0xFFFD;
  }
  else
  {
    __int16 v6 = v4 | 2;
  }
  v3[53] = v6;
  uint64_t v7 = metaWrite((int *)a1, v3, 0, *(void *)(a1 + 2032));
  if (v7)
  {
    if (gbIsLoggerInit)
    {
      int v8 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        v10[0] = 67109120;
        v10[1] = v7;
        _os_log_impl(&dword_22C0F9000, v8, OS_LOG_TYPE_ERROR, "FSOPS_SetDeviceAsDirty: Failed to write boot record, error: %d\n", (uint8_t *)v10, 8u);
      }
    }
  }
  return v7;
}

uint64_t FSOPS_SetDirtyBitAndAcquireLck(uint64_t a1)
{
  MultiReadSingleWrite_LockRead((pthread_rwlock_t *)(a1 + 2064));

  return FSOPS_SetDeviceAsDirty(a1, 1);
}

uint64_t FSOPS_FlushCacheAndFreeLck(uint64_t a1)
{
  uint64_t v2 = FATMOD_FlushAllCacheEntries(a1);
  MultiReadSingleWrite_FreeRead((pthread_rwlock_t *)(a1 + 2064));
  return v2;
}

uint64_t EXFAT_Init()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  time_t v0 = time(0);
  exfat_secondsWest = -(int)EXFAT_GetGMTDiffOffset(v0);
  exfat_timezone_diff_01_01_1980 = EXFAT_GetGMTDiffOffset(315532800);
  uint64_t v1 = EXFAT_LoggerInit();
  if (!v1) {
    uint64_t v1 = ZeroFill_Init();
  }
  if (gbIsLoggerInit)
  {
    uint64_t v2 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 67109120;
      v4[1] = v1;
      _os_log_impl(&dword_22C0F9000, v2, OS_LOG_TYPE_DEFAULT, "EXFAT_Init status = %d\n", (uint8_t *)v4, 8u);
    }
  }
  return v1;
}

uint64_t EXFAT_Taste(int a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (gbIsLoggerInit)
  {
    uint64_t v2 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel))
    {
      LOWORD(__nbyte_4) = 0;
      _os_log_impl(&dword_22C0F9000, v2, (os_log_type_t)gpeExfatToOsLevel, "EXFAT_Taste\n", (uint8_t *)&__nbyte_4, 2u);
    }
  }
  unsigned int __nbyte = 0;
  if (ioctl(a1, 0x40046418uLL, &__nbyte) < 0)
  {
    size_t v3 = 512;
    unsigned int __nbyte = 512;
  }
  else
  {
    size_t v3 = __nbyte;
  }
  __int16 v4 = malloc_type_malloc(v3, 0xB8083312uLL);
  if (v4)
  {
    uint64_t v5 = v4;
    ssize_t v6 = pread(a1, v4, __nbyte, 0);
    if (v6 == __nbyte)
    {
      if (*v5 ^ 0x54414658459076EBLL | *(void *)((char *)v5 + 3) ^ 0x2020205441465845) {
        uint64_t v7 = 45;
      }
      else {
        uint64_t v7 = 0;
      }
    }
    else
    {
      uint64_t v7 = *__error();
      if (gbIsLoggerInit)
      {
        unsigned int v9 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          LODWORD(__nbyte_4) = 67109120;
          HIDWORD(__nbyte_4) = v7;
          _os_log_impl(&dword_22C0F9000, v9, OS_LOG_TYPE_ERROR, "EXFAT_Taste: Failed to read. Error [%d]\n", (uint8_t *)&__nbyte_4, 8u);
        }
      }
    }
    free(v5);
  }
  else
  {
    if (gbIsLoggerInit)
    {
      int v8 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        LOWORD(__nbyte_4) = 0;
        _os_log_impl(&dword_22C0F9000, v8, OS_LOG_TYPE_ERROR, "EXFAT_Taste: failed to malloc pvBootSector\n", (uint8_t *)&__nbyte_4, 2u);
      }
    }
    return 12;
  }
  return v7;
}

uint64_t EXFAT_Mount(int a1, uint64_t a2, char a3, uint64_t a4, char **a5)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (gbIsLoggerInit)
  {
    unsigned int v9 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C0F9000, v9, (os_log_type_t)gpeExfatToOsLevel, "EXFAT_Mount\n", buf, 2u);
    }
  }
  if (!a2)
  {
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    unsigned int v12 = (char *)malloc_type_malloc(0xA58uLL, 0x10B0040F10DB1E9uLL);
    if (!v12)
    {
      if (gbIsLoggerInit)
      {
        unint64_t v16 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22C0F9000, v16, OS_LOG_TYPE_ERROR, "EXFAT_Mount: failed to malloc psVolume\n", buf, 2u);
        }
      }
      unsigned int v17 = 0;
      uint64_t RootRecord = 12;
      goto LABEL_40;
    }
    uint64_t v13 = (uint64_t)v12;
    bzero(v12 + 4, 0xA54uLL);
    *(_DWORD *)uint64_t v13 = a1;
    *(unsigned char *)(v13 + 2640) = 1;
    MultiReadSingleWrite_Init((pthread_rwlock_t *)(v13 + 2064));
    MultiReadSingleWrite_Init((pthread_rwlock_t *)(v13 + 2272));
    atomic_store(0, (unint64_t *)(v13 + 2264));
    atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)(v13 + 2016));
    FILERECORD_InitChainCache(v13);
    if (ioctl(*(_DWORD *)v13, 0x40046418uLL, &v22) < 0)
    {
      LODWORD(v14) = 512;
      LODWORD(v22) = 512;
    }
    else
    {
      uint64_t v14 = v22;
      if (v22 > 0x1000)
      {
        if (gbIsLoggerInit)
        {
          unsigned int v15 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v25 = v14;
            _os_log_impl(&dword_22C0F9000, v15, OS_LOG_TYPE_ERROR, "EXFAT_Mount: block size is too big (%lu)\n", buf, 0xCu);
          }
        }
        uint64_t RootRecord = 22;
LABEL_39:
        MultiReadSingleWrite_DeInit((pthread_rwlock_t *)(v13 + 2064));
        MultiReadSingleWrite_DeInit((pthread_rwlock_t *)(v13 + 2272));
        free((void *)v13);
        unsigned int v17 = v23;
LABEL_40:
        *a5 = v17;
        return RootRecord;
      }
    }
    FSOPS_ReadBootSector(v13, (int *)&v22 + 1, v14, (a3 & 1) == 0, 1);
    uint64_t RootRecord = HIDWORD(v22);
    if (!HIDWORD(v22))
    {
      uint64_t RootRecord = FAT_Access_M_FATInit(v13);
      if (!RootRecord)
      {
        uint64_t RootRecord = FSOPS_CreateRootRecord(v13, (void **)&v23);
        if (!RootRecord)
        {
          uint64_t RootRecord = FAT_Access_M_BitmapCacheInit((void *)v13);
          if (!RootRecord)
          {
            uint64_t RootRecord = FAT_Access_M_GetTotalFreeClusters(v13);
            if (!RootRecord)
            {
              *(_DWORD *)(v13 + 2000) = 0;
              uint64_t RootRecord = FAT_Access_M_FindFirstFreeCluster(v13);
              if (!RootRecord)
              {
                *a5 = v23;
                *(unsigned char *)(v13 + 2641) = 1;
                return RootRecord;
              }
              FAT_Access_M_BitmapCacheFini(v13);
            }
          }
        }
        if (v23)
        {
          FILERECORD_FreeRecord(v23, 1);
          uint64_t v23 = 0;
        }
      }
      FAT_Access_M_FATFini(v13);
    }
    unsigned int v18 = *(char **)(v13 + 2040);
    if (v18) {
      FILERECORD_FreeRecord(v18, 1);
    }
    unsigned int v19 = *(void **)(v13 + 2048);
    if (v19) {
      free(v19);
    }
    if (*(void *)(v13 + 2008)) {
      FILERECORD_DeInitChainCache(v13);
    }
    unsigned int v20 = *(void **)(v13 + 2024);
    if (v20) {
      free(v20);
    }
    goto LABEL_39;
  }
  if (gbIsLoggerInit)
  {
    uint64_t v10 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C0F9000, v10, OS_LOG_TYPE_ERROR, "EXFAT_Mount: unknown volume ID\n", buf, 2u);
    }
  }
  return 22;
}

uint64_t EXFAT_Sync(_DWORD *a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (gbIsLoggerInit)
  {
    uint64_t v2 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel))
    {
      int v6 = 136315138;
      uint64_t v7 = "EXFAT_Sync";
      _os_log_impl(&dword_22C0F9000, v2, (os_log_type_t)gpeExfatToOsLevel, "%s\n", (uint8_t *)&v6, 0xCu);
    }
  }
  if (a1)
  {
    if (*a1 == -1061240642)
    {
      if (a1[140] == -1061240642) {
        return exfat_sync_internal((uint64_t)a1, 1);
      }
    }
    else if (*a1 == -559031622 && a1[140] == -559031622)
    {
      if (gbIsLoggerInit)
      {
        size_t v3 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v6) = 0;
          _os_log_impl(&dword_22C0F9000, v3, OS_LOG_TYPE_ERROR, "Got stale node", (uint8_t *)&v6, 2u);
        }
      }
      return 70;
    }
  }
  if (gbIsLoggerInit)
  {
    uint64_t v5 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_22C0F9000, v5, OS_LOG_TYPE_ERROR, "Got invalid node", (uint8_t *)&v6, 2u);
    }
  }
  return 22;
}

uint64_t EXFAT_Sync_async(_DWORD *a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (gbIsLoggerInit)
  {
    uint64_t v2 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel))
    {
      int v6 = 136315138;
      uint64_t v7 = "EXFAT_Sync_async";
      _os_log_impl(&dword_22C0F9000, v2, (os_log_type_t)gpeExfatToOsLevel, "%s\n", (uint8_t *)&v6, 0xCu);
    }
  }
  if (a1)
  {
    if (*a1 == -1061240642)
    {
      if (a1[140] == -1061240642) {
        return exfat_sync_internal((uint64_t)a1, 0);
      }
    }
    else if (*a1 == -559031622 && a1[140] == -559031622)
    {
      if (gbIsLoggerInit)
      {
        size_t v3 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v6) = 0;
          _os_log_impl(&dword_22C0F9000, v3, OS_LOG_TYPE_ERROR, "Got stale node", (uint8_t *)&v6, 2u);
        }
      }
      return 70;
    }
  }
  if (gbIsLoggerInit)
  {
    uint64_t v5 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_22C0F9000, v5, OS_LOG_TYPE_ERROR, "Got invalid node", (uint8_t *)&v6, 2u);
    }
  }
  return 22;
}

uint64_t EXFAT_Unmount(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (gbIsLoggerInit)
  {
    __int16 v4 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel))
    {
      int v10 = 67109120;
      LODWORD(v11) = a2;
      _os_log_impl(&dword_22C0F9000, v4, (os_log_type_t)gpeExfatToOsLevel, "EXFAT_Unmount hint = %u\n", (uint8_t *)&v10, 8u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 216);
  MultiReadSingleWrite_LockWrite((pthread_rwlock_t *)(v5 + 2064));
  if ((a2 & 2) == 0 && (*(_WORD *)(*(void *)(v5 + 2024) + 106) & 2) != 0)
  {
    if (gbIsLoggerInit)
    {
      int v6 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_FAULT))
      {
        int v10 = 136315138;
        uint64_t v11 = "EXFAT_Unmount";
        _os_log_impl(&dword_22C0F9000, v6, OS_LOG_TYPE_FAULT, "%s: Unmounting a dirty file system", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  MultiReadSingleWrite_FreeWrite((pthread_rwlock_t *)(v5 + 2064));
  FAT_Access_M_FATFini(v5);
  FAT_Access_M_BitmapCacheFini(v5);
  FILERECORD_FreeRecord((char *)a1, 1);
  FILERECORD_FreeRecord(*(char **)(v5 + 2040), 1);
  MultiReadSingleWrite_DeInit((pthread_rwlock_t *)(v5 + 2064));
  MultiReadSingleWrite_DeInit((pthread_rwlock_t *)(v5 + 2272));
  FILERECORD_DeInitChainCache(v5);
  uint64_t v7 = *(void **)(v5 + 2024);
  if (v7) {
    free(v7);
  }
  uint64_t v8 = *(void **)(v5 + 2048);
  if (v8) {
    free(v8);
  }
  free((void *)v5);
  return 0;
}

uint64_t EXFAT_GetFSAttr(uint64_t a1, char *__s1, uint64_t a3, unint64_t a4, size_t *a5)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (!a1)
  {
LABEL_34:
    if (gbIsLoggerInit)
    {
      uint64_t v13 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_22C0F9000, v13, OS_LOG_TYPE_ERROR, "Got invalid node", (uint8_t *)&v24, 2u);
      }
    }
    return 22;
  }
  if (*(_DWORD *)a1 == -1061240642)
  {
    if (*(_DWORD *)(a1 + 560) != -1061240642) {
      goto LABEL_34;
    }
    if (!strcmp(__s1, "_N_mntflags"))
    {
      *a5 = 8;
      if (a4 >= 8)
      {
        uint64_t result = 0;
        uint64_t FileValidDataSize = 0x2000;
        *(void *)a3 = 0x2000;
        if (*(unsigned char *)(*(void *)(a1 + 216) + 2640)) {
          uint64_t FileValidDataSize = 1610620928;
        }
        goto LABEL_63;
      }
      return 7;
    }
    if (!strcmp(__s1, "_N_PC_LINK_MAX"))
    {
      *a5 = 8;
      if (a4 >= 8)
      {
        uint64_t result = 0;
        uint64_t FileValidDataSize = 1;
        goto LABEL_63;
      }
      return 7;
    }
    if (!strcmp(__s1, "_N_PC_NAME_MAX"))
    {
      *a5 = 8;
      if (a4 >= 8)
      {
        uint64_t result = 0;
        uint64_t FileValidDataSize = 255;
        goto LABEL_63;
      }
      return 7;
    }
    if (!strcmp(__s1, "_B_PC_NO_TRUNC"))
    {
      *a5 = 1;
      if (a4)
      {
        uint64_t result = 0;
        *(unsigned char *)a3 = 1;
        return result;
      }
      return 7;
    }
    if (!strcmp(__s1, "_N_PC_FILESIZEBITS"))
    {
      *a5 = 8;
      if (a4 >= 8)
      {
        uint64_t result = 0;
        uint64_t FileValidDataSize = 64;
        goto LABEL_63;
      }
      return 7;
    }
    if (!strcmp(__s1, "_N_PC_XATTR_SIZE_BITS"))
    {
      *a5 = 8;
      if (a4 < 8) {
        return 7;
      }
      *(void *)a3 = 0;
      return 45;
    }
    if (!strcmp(__s1, "_N_f_bsize"))
    {
      *a5 = 8;
      if (a4 >= 8)
      {
        uint64_t result = 0;
        uint64_t FileValidDataSize = *(void *)(*(void *)(a1 + 216) + 56);
        goto LABEL_63;
      }
      return 7;
    }
    if (!strcmp(__s1, "_N_f_iosize"))
    {
      *a5 = 8;
      if (a4 >= 8)
      {
        uint64_t result = 0;
        uint64_t FileValidDataSize = 0x8000;
        goto LABEL_63;
      }
      return 7;
    }
    if (!strcmp(__s1, "_N_f_blocks"))
    {
      *a5 = 8;
      if (a4 >= 8)
      {
        uint64_t result = 0;
        uint64_t FileValidDataSize = *(unsigned int *)(*(void *)(a1 + 216) + 80);
        goto LABEL_63;
      }
      return 7;
    }
    if (!strcmp(__s1, "_N_f_bfree") || !strcmp(__s1, "_N_f_bavail"))
    {
      *a5 = 8;
      if (a4 >= 8)
      {
        uint64_t result = 0;
        uint64_t FileValidDataSize = *(unsigned int *)(*(void *)(a1 + 216) + 76);
        goto LABEL_63;
      }
      return 7;
    }
    if (!strcmp(__s1, "_N_f_bused"))
    {
      *a5 = 8;
      if (a4 >= 8)
      {
        uint64_t result = 0;
        uint64_t FileValidDataSize = (*(_DWORD *)(*(void *)(a1 + 216) + 80)
                                         - *(_DWORD *)(*(void *)(a1 + 216) + 76));
        goto LABEL_63;
      }
      return 7;
    }
    if (!strcmp(__s1, "_S_f_cname"))
    {
      uint64_t v14 = *(const char **)(a1 + 448);
      if (!v14) {
        return 22;
      }
      size_t v15 = strlen(v14) + 1;
      *a5 = v15;
      if (v15 > a4) {
        return 7;
      }
      strlcpy((char *)a3, v14, v15);
    }
    else
    {
      if (!strcmp(__s1, "_S_f_type"))
      {
        *a5 = 6;
        if (a4 >= 6)
        {
          uint64_t result = 0;
          strcpy((char *)a3, "exfat");
          return result;
        }
        return 7;
      }
      if (!strcmp(__s1, "_S_f_subtype"))
      {
        *a5 = 1;
        if (a4) {
          return 45;
        }
        else {
          return 7;
        }
      }
      if (strcmp(__s1, "_S_f_vol_name"))
      {
        if (strcmp(__s1, "_O_f_uuid"))
        {
          if (!strcmp(__s1, "_O_vol_attributes_attr"))
          {
            *a5 = 40;
            if (a4 >= 0x28)
            {
              uint64_t result = 0;
              *(_OWORD *)a3 = xmmword_22C116214;
              *(_OWORD *)(a3 + 16) = *(_OWORD *)algn_22C116224;
              *(void *)(a3 + 32) = 1574;
              return result;
            }
            return 7;
          }
          if (!strcmp(__s1, "_N_caps_format"))
          {
            *a5 = 8;
            if (a4 >= 8)
            {
              uint64_t result = 0;
              uint64_t FileValidDataSize = 4206114;
              goto LABEL_63;
            }
            return 7;
          }
          if (!strcmp(__s1, "_N_caps_interfaces"))
          {
            *a5 = 8;
            if (a4 >= 8)
            {
              uint64_t result = 0;
              uint64_t FileValidDataSize = 192;
              goto LABEL_63;
            }
            return 7;
          }
          if (!strcmp(__s1, "_N_f_vdl") && *(_DWORD *)(a1 + 208) == 3)
          {
            *a5 = 8;
            if (a4 >= 8)
            {
              uint64_t FileValidDataSize = FILEOPS_GetFileValidDataSize(a1);
              uint64_t result = 0;
LABEL_63:
              *(void *)a3 = FileValidDataSize;
              return result;
            }
            return 7;
          }
          return 45;
        }
        uint64_t v20 = *(void *)(a1 + 216);
        if (*(unsigned char *)(v20 + 169))
        {
          *a5 = 16;
          if (a4 >= 0x10)
          {
            uint64_t result = 0;
            *(_OWORD *)a3 = *(_OWORD *)(v20 + 153);
            return result;
          }
          return 7;
        }
        return 2;
      }
      uint64_t v16 = *(void *)(a1 + 216);
      if (!*(unsigned char *)(v16 + 152))
      {
        if (gbIsLoggerInit)
        {
          v21 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel))
          {
            int v24 = 136315138;
            uint64_t v25 = "EXFAT_GetFSAttr";
            _os_log_impl(&dword_22C0F9000, v21, (os_log_type_t)gpeExfatToOsLevel, "%s: no volume label: returning ENOENT", (uint8_t *)&v24, 0xCu);
          }
        }
        return 2;
      }
      unsigned int v17 = (const char *)(v16 + 88);
      size_t v18 = strlen((const char *)(v16 + 88)) + 1;
      *a5 = v18;
      if (v18 > a4)
      {
        if (gbIsLoggerInit)
        {
          unsigned int v19 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel))
          {
            int v24 = 136315394;
            uint64_t v25 = "EXFAT_GetFSAttr";
            __int16 v26 = 2048;
            size_t v27 = v18;
            _os_log_impl(&dword_22C0F9000, v19, (os_log_type_t)gpeExfatToOsLevel, "%s: returning E2BIG: %zu", (uint8_t *)&v24, 0x16u);
          }
        }
        return 7;
      }
      strcpy((char *)a3, v17);
      if (gbIsLoggerInit)
      {
        uint64_t v22 = gpsExFatLog;
        uint64_t result = os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel);
        if (!result) {
          return result;
        }
        uint64_t v23 = *(void *)(a1 + 216) + 88;
        int v24 = 136315394;
        uint64_t v25 = "EXFAT_GetFSAttr";
        __int16 v26 = 2080;
        size_t v27 = v23;
        _os_log_impl(&dword_22C0F9000, v22, (os_log_type_t)gpeExfatToOsLevel, "%s: returning: [%s]", (uint8_t *)&v24, 0x16u);
      }
    }
    return 0;
  }
  if (*(_DWORD *)a1 != -559031622 || *(_DWORD *)(a1 + 560) != -559031622) {
    goto LABEL_34;
  }
  if (gbIsLoggerInit)
  {
    int v6 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_22C0F9000, v6, OS_LOG_TYPE_ERROR, "Got stale node", (uint8_t *)&v24, 2u);
    }
  }
  return 70;
}

uint64_t EXFAT_SetFSAttr(_DWORD *a1, char *__s1, char *a3, unint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  if (!a1) {
    goto LABEL_16;
  }
  if (*a1 != -1061240642)
  {
    if (*a1 == -559031622 && a1[140] == -559031622)
    {
      if (gbIsLoggerInit)
      {
        uint64_t v7 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v40) = 0;
          _os_log_impl(&dword_22C0F9000, v7, OS_LOG_TYPE_ERROR, "Got stale node", (uint8_t *)&v40, 2u);
        }
      }
      return 70;
    }
    goto LABEL_16;
  }
  if (a1[140] != -1061240642)
  {
LABEL_16:
    if (gbIsLoggerInit)
    {
      uint64_t v14 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v40) = 0;
        _os_log_impl(&dword_22C0F9000, v14, OS_LOG_TYPE_ERROR, "Got invalid node", (uint8_t *)&v40, 2u);
      }
    }
    return 22;
  }
  uint64_t Clusters = 22;
  if (!__s1 || !a3 || !a5) {
    goto LABEL_32;
  }
  if (strcmp(__s1, "_O_f_preallocate"))
  {
    if (strcmp(__s1, "_S_f_vol_name"))
    {
      uint64_t Clusters = 45;
      goto LABEL_32;
    }
    if (a1[52] != 1) {
      goto LABEL_32;
    }
    size_t v37 = strlen(a3);
    uint64_t Clusters = DIROPS_WriteVolumeLableEntry((uint64_t)a1, (unsigned __int8 *)a3, v37);
    if (Clusters) {
      goto LABEL_32;
    }
    uint64_t Clusters = FSOPS_lookupVolumeLabel((uint64_t)a1);
    if (!Clusters) {
      goto LABEL_32;
    }
    if (!gbIsLoggerInit) {
      return Clusters;
    }
    uint64_t v39 = gpsExFatLog;
    if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_FAULT)) {
      goto LABEL_32;
    }
    int v40 = 136315138;
    v41 = "EXFAT_SetFSAttr";
    v33 = "%s: failed to find volume label";
    v34 = v39;
    os_log_type_t v35 = OS_LOG_TYPE_FAULT;
    uint32_t v36 = 12;
LABEL_29:
    _os_log_impl(&dword_22C0F9000, v34, v35, v33, (uint8_t *)&v40, v36);
    goto LABEL_32;
  }
  if (a4 < 0xE8 || a6 < 0xE8)
  {
LABEL_32:
    if (gbIsLoggerInit)
    {
      v38 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel))
      {
        int v40 = 136315394;
        v41 = "EXFAT_SetFSAttr";
        __int16 v42 = 1024;
        LODWORD(v43) = Clusters;
        _os_log_impl(&dword_22C0F9000, v38, (os_log_type_t)gpeExfatToOsLevel, "%s: iErr: %d", (uint8_t *)&v40, 0x12u);
      }
    }
    return Clusters;
  }
  if (gbIsLoggerInit)
  {
    uint64_t v16 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = *((_DWORD *)a3 + 4);
      uint64_t v18 = *(void *)a3;
      uint64_t v19 = *((void *)a3 + 1);
      int v40 = 136315906;
      v41 = "EXFAT_SetFSAttr";
      __int16 v42 = 2048;
      uint64_t v43 = v18;
      __int16 v44 = 1024;
      int v45 = v17;
      __int16 v46 = 2048;
      uint64_t v47 = v19;
      _os_log_impl(&dword_22C0F9000, v16, OS_LOG_TYPE_DEFAULT, "%s: Request: offset:%llu flags:%u, length:%llu", (uint8_t *)&v40, 0x26u);
    }
  }
  long long v20 = *(_OWORD *)a3;
  long long v21 = *((_OWORD *)a3 + 2);
  *(_OWORD *)(a5 + 16) = *((_OWORD *)a3 + 1);
  *(_OWORD *)(a5 + 32) = v21;
  *(_OWORD *)a5 = v20;
  long long v22 = *((_OWORD *)a3 + 3);
  long long v23 = *((_OWORD *)a3 + 4);
  long long v24 = *((_OWORD *)a3 + 6);
  *(_OWORD *)(a5 + 80) = *((_OWORD *)a3 + 5);
  *(_OWORD *)(a5 + 96) = v24;
  *(_OWORD *)(a5 + 48) = v22;
  *(_OWORD *)(a5 + 64) = v23;
  long long v25 = *((_OWORD *)a3 + 7);
  long long v26 = *((_OWORD *)a3 + 8);
  long long v27 = *((_OWORD *)a3 + 10);
  *(_OWORD *)(a5 + 144) = *((_OWORD *)a3 + 9);
  *(_OWORD *)(a5 + 160) = v27;
  *(_OWORD *)(a5 + 112) = v25;
  *(_OWORD *)(a5 + 128) = v26;
  long long v28 = *((_OWORD *)a3 + 11);
  long long v29 = *((_OWORD *)a3 + 12);
  long long v30 = *((_OWORD *)a3 + 13);
  *(void *)(a5 + 224) = *((void *)a3 + 28);
  *(_OWORD *)(a5 + 192) = v29;
  *(_OWORD *)(a5 + 208) = v30;
  *(_OWORD *)(a5 + 176) = v28;
  *((void *)a3 + 3) = 0;
  uint64_t Clusters = FILEOPS_PreAllocateClusters((uint64_t)a1, (uint64_t *)a3, a5);
  if (gbIsLoggerInit)
  {
    uint64_t v31 = gpsExFatLog;
    if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_32;
    }
    uint64_t v32 = *(void *)(a5 + 24);
    int v40 = 136315394;
    v41 = "EXFAT_SetFSAttr";
    __int16 v42 = 2048;
    uint64_t v43 = v32;
    v33 = "%s: Reply: bytesallocated %llu";
    v34 = v31;
    os_log_type_t v35 = OS_LOG_TYPE_DEFAULT;
    uint32_t v36 = 22;
    goto LABEL_29;
  }
  return Clusters;
}

uint64_t EXFAT_check(int a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  posix_spawn_file_actions_t v18 = 0;
  *(void *)uint64_t v19 = 0;
  posix_spawnattr_t v17 = 0;
  if (gbIsLoggerInit)
  {
    int v6 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = a1;
      _os_log_impl(&dword_22C0F9000, v6, (os_log_type_t)gpeExfatToOsLevel, "fsck_exfat - fsck start for %d", buf, 8u);
    }
  }
  snprintf(__str, 0x18uLL, "/dev/fd/%d", a1);
  *(void *)buf = "fsck_exfat";
  long long v23 = "-q";
  long long v24 = __str;
  uint64_t v25 = 0;
  if (a4 != 1)
  {
    if (a4 == 3)
    {
      uint64_t v7 = "-y";
      goto LABEL_9;
    }
    if (a4 == 2)
    {
      uint64_t v7 = "-n";
LABEL_9:
      long long v23 = v7;
      goto LABEL_10;
    }
    if (gbIsLoggerInit)
    {
      int v10 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long v20 = 67109120;
        int v21 = a4;
        _os_log_impl(&dword_22C0F9000, v10, OS_LOG_TYPE_ERROR, "Invalid how flags for the check, ignoring; %d", v20, 8u);
      }
    }
  }
LABEL_10:
  if (a1 < 0) {
    return 22;
  }
  uint64_t v8 = posix_spawn_file_actions_init(&v18);
  if (!v8)
  {
    uint64_t v8 = posix_spawn_file_actions_addinherit_np(&v18, 0);
    if (!v8)
    {
      uint64_t v8 = posix_spawn_file_actions_addinherit_np(&v18, 1);
      if (!v8)
      {
        uint64_t v8 = posix_spawn_file_actions_addinherit_np(&v18, 2);
        if (!v8)
        {
          uint64_t v8 = posix_spawn_file_actions_addinherit_np(&v18, a1);
          if (!v8)
          {
            uint64_t v8 = posix_spawnattr_init(&v17);
            if (v8 || (uint64_t v8 = posix_spawnattr_setflags(&v17, 0x4000), v8))
            {
              posix_spawn_file_actions_destroy(&v18);
            }
            else
            {
              uint64_t v8 = posix_spawn(&v19[1], "/System/Library/Filesystems/exfat.fs/fsck_exfat", &v18, &v17, (char *const *)buf, (char *const *)*MEMORY[0x263EF8878]);
              posix_spawn_file_actions_destroy(&v18);
              posix_spawnattr_destroy(&v17);
              if (v8)
              {
                if (gbIsLoggerInit)
                {
                  uint64_t v11 = gpsExFatLog;
                  if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)long long v20 = 67109120;
                    int v21 = v8;
                    uint64_t v12 = "posix_spawn fsck_exfat: error=%d";
LABEL_38:
                    _os_log_impl(&dword_22C0F9000, v11, OS_LOG_TYPE_ERROR, v12, v20, 8u);
                  }
                }
              }
              else
              {
                do
                {
                  if (waitpid(v19[1], v19, 0) != -1)
                  {
                    int v13 = v19[0] & 0x7F;
                    if ((v19[0] & 0x7F) != 0)
                    {
                      if (gbIsLoggerInit)
                      {
                        uint64_t v14 = gpsExFatLog;
                        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)long long v20 = 67109120;
                          int v21 = v13;
                          _os_log_impl(&dword_22C0F9000, v14, OS_LOG_TYPE_ERROR, "fsck_exfat: terminated by signal %d", v20, 8u);
                        }
                      }
                      return 4;
                    }
                    else
                    {
                      int v15 = BYTE1(v19[0]);
                      if (BYTE1(v19[0]))
                      {
                        if (gbIsLoggerInit)
                        {
                          uint64_t v16 = gpsExFatLog;
                          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)long long v20 = 67109120;
                            int v21 = v15;
                            _os_log_impl(&dword_22C0F9000, v16, OS_LOG_TYPE_ERROR, "fsck_exfat: exited with status %d", v20, 8u);
                          }
                        }
                        if (v15 == 45) {
                          return 45;
                        }
                        else {
                          return 92;
                        }
                      }
                      else
                      {
                        return 0;
                      }
                    }
                  }
                }
                while (*__error() == 4);
                uint64_t v8 = *__error();
                if (gbIsLoggerInit)
                {
                  uint64_t v11 = gpsExFatLog;
                  if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)long long v20 = 67109120;
                    int v21 = v8;
                    uint64_t v12 = "waitpid fsck_exfat: errno=%d";
                    goto LABEL_38;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v8;
}

uint64_t EXFAT_ScanVols(int a1, void *a2, uint64_t a3)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  if (gbIsLoggerInit)
  {
    int v6 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C0F9000, v6, (os_log_type_t)gpeExfatToOsLevel, "EXFAT_ScanVols\n", buf, 2u);
    }
  }
  uint64_t result = 22;
  if (a2 && a3)
  {
    if (*a2) {
      return 4294966295;
    }
    *(void *)a3 = 0;
    *(_DWORD *)(a3 + 8) = 0;
    uint64_t v8 = a3 + 28;
    int v26 = 0;
    uint64_t v25 = 0;
    unsigned int v24 = 0;
    unsigned int v9 = (unsigned int *)malloc_type_malloc(0xA58uLL, 0x10B0040F10DB1E9uLL);
    if (!v9)
    {
      *(unsigned char *)uint64_t v8 = 0;
      if (gbIsLoggerInit)
      {
        int v13 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22C0F9000, v13, OS_LOG_TYPE_ERROR, "EXFAT_ScanVolGetVolName: failed to malloc psVolume\n", buf, 2u);
        }
      }
      return 0;
    }
    int v10 = v9;
    bzero(v9 + 1, 0xA54uLL);
    *int v10 = a1;
    if (ioctl(a1, 0x40046418uLL, &v24) < 0)
    {
      LODWORD(v11) = 512;
      unsigned int v24 = 512;
    }
    else
    {
      uint64_t v11 = v24;
      if (v24 > 0x1000)
      {
        if (gbIsLoggerInit)
        {
          uint64_t v12 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)&uint8_t buf[4] = v11;
            _os_log_impl(&dword_22C0F9000, v12, OS_LOG_TYPE_ERROR, "EXFAT_ScanVolGetVolName: block size is too big (%lu)\n", buf, 0xCu);
          }
        }
        goto LABEL_29;
      }
    }
    FSOPS_ReadBootSector((uint64_t)v10, &v26, v11, 0, 0);
    if (v26)
    {
LABEL_29:
      if (*((void *)v10 + 251)) {
        FILERECORD_DeInitChainCache((uint64_t)v10);
      }
      uint64_t v16 = (void *)*((void *)v10 + 253);
      if (v16) {
        free(v16);
      }
      free(v10);
      return 0;
    }
    FILERECORD_InitChainCache((uint64_t)v10);
    int Record = FAT_Access_M_FATInit((uint64_t)v10);
    if (!Record)
    {
      int Record = FILERECORD_AllocateRecord((void **)&v25, 0, (uint64_t)v10, v10[8], v10[8], 1, 0, "");
      if (!Record)
      {
        uint64_t v23 = 0;
        memset(v22, 0, sizeof(v22));
        LODWORD(v22[0]) = 2;
        *(_OWORD *)buf = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        if (DIROPS_LookForDirEntry((uint64_t)v25, (int *)v22, 0, (uint64_t)buf)) {
          goto LABEL_25;
        }
        posix_spawnattr_t v17 = malloc_type_malloc(0x200uLL, 0x10000407EBBDD04uLL);
        if (v17)
        {
          posix_spawn_file_actions_t v18 = v17;
          v17[31] = 0u;
          *(_OWORD *)((char *)v17 + 242) = 0u;
          *(_OWORD *)((char *)v17 + 226) = 0u;
          *(_OWORD *)((char *)v17 + 210) = 0u;
          *(_OWORD *)((char *)v17 + 194) = 0u;
          *(_OWORD *)((char *)v17 + 178) = 0u;
          *(_OWORD *)((char *)v17 + 162) = 0u;
          *(_OWORD *)((char *)v17 + 146) = 0u;
          *(_OWORD *)((char *)v17 + 130) = 0u;
          *(_OWORD *)((char *)v17 + 114) = 0u;
          *(_OWORD *)((char *)v17 + 98) = 0u;
          *(_OWORD *)((char *)v17 + 82) = 0u;
          *(_OWORD *)((char *)v17 + 66) = 0u;
          *(_OWORD *)((char *)v17 + 50) = 0u;
          *(_OWORD *)((char *)v17 + 34) = 0u;
          *(_OWORD *)((char *)v17 + 2) = 0u;
          uint64_t v19 = (_OWORD *)((char *)v17 + 2);
          *(_OWORD *)((char *)v18 + 18) = 0u;
          v19[29] = 0u;
          v19[30] = 0u;
          v19[27] = 0u;
          v19[28] = 0u;
          v19[25] = 0u;
          v19[26] = 0u;
          v19[23] = 0u;
          v19[24] = 0u;
          v19[21] = 0u;
          v19[22] = 0u;
          v19[19] = 0u;
          v19[20] = 0u;
          v19[17] = 0u;
          v19[18] = 0u;
          __int16 v20 = buf[1];
          if (buf[1] >= 0xBu) {
            __int16 v20 = 11;
          }
          *(_WORD *)posix_spawn_file_actions_t v18 = v20;
          v19[16] = 0uLL;
          __memcpy_chk();
          *(_OWORD *)uint64_t v8 = 0u;
          *(_OWORD *)(v8 + 16) = 0u;
          *(_OWORD *)(v8 + 32) = 0u;
          *(_OWORD *)(v8 + 48) = 0u;
          *(_OWORD *)(v8 + 64) = 0u;
          *(_OWORD *)(v8 + 80) = 0u;
          *(_OWORD *)(v8 + 96) = 0u;
          *(_OWORD *)(v8 + 112) = 0u;
          *(_OWORD *)(v8 + 128) = 0u;
          *(_OWORD *)(v8 + 144) = 0u;
          *(_OWORD *)(v8 + 160) = 0u;
          *(_OWORD *)(v8 + 176) = 0u;
          *(_OWORD *)(v8 + 192) = 0u;
          *(_OWORD *)(v8 + 208) = 0u;
          *(_OWORD *)(v8 + 224) = 0u;
          *(_OWORD *)(v8 + 240) = 0u;
          CONV_Unistr255ToUTF8(v18, (unsigned char *)v8, 256);
          free(v18);
          goto LABEL_26;
        }
        if (!gbIsLoggerInit)
        {
LABEL_25:
          *(unsigned char *)uint64_t v8 = 0;
LABEL_26:
          if (v25) {
            FILERECORD_FreeRecord(v25, 1);
          }
          FAT_Access_M_FATFini((uint64_t)v10);
          goto LABEL_29;
        }
        int v21 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v27 = 0;
          _os_log_impl(&dword_22C0F9000, v21, OS_LOG_TYPE_ERROR, "EXFAT_ScanVolGetVolName failed to allocate memory.\n", v27, 2u);
        }
        int Record = 12;
      }
    }
    if (gbIsLoggerInit)
    {
      int v15 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t v27 = 67109120;
        int v28 = Record;
        _os_log_impl(&dword_22C0F9000, v15, OS_LOG_TYPE_ERROR, "EXFAT_ScanVolGetVolName: failed with error %d, returning empty name and no error\n", v27, 8u);
      }
    }
    goto LABEL_25;
  }
  return result;
}

uint64_t EXFAT_GetFSRepresentation(char *__s, unsigned char *a2, uint64_t a3)
{
  uint64_t result = 22;
  if (__s && a2)
  {
    memset(v8, 0, sizeof(v8));
    size_t v7 = strlen(__s);
    uint64_t result = CONV_UTF8ToUnistr255((unsigned __int8 *)__s, v7, v8);
    if (!result) {
      return CONV_Unistr255ToUTF8(v8, a2, a3);
    }
  }
  return result;
}

void *livefiles_plugin_init(void *result)
{
  if (result) {
    *uint64_t result = &ExFat_fsOps;
  }
  return result;
}

uint64_t EXFAT_GetGMTDiffOffset(time_t a1)
{
  time_t v4 = a1;
  uint64_t v1 = gmtime(&v4);
  v1->tm_isdst = -1;
  time_t v2 = mktime(v1);
  return (int)difftime(v4, v2);
}

void FSOPS_ReadBootSector(uint64_t a1, int *a2, int a3, int a4, int a5)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  size_t v9 = (12 * a3);
  *(void *)(a1 + 2032) = v9;
  int v10 = malloc_type_malloc(v9, 0x68062F7AuLL);
  *(void *)(a1 + 2024) = v10;
  if (v10)
  {
    if (pread(*(_DWORD *)a1, v10, *(void *)(a1 + 2032), 0) != *(void *)(a1 + 2032))
    {
      uint64_t v16 = __error();
      int v17 = *v16;
      *a2 = *v16;
      if (!gbIsLoggerInit) {
        goto LABEL_25;
      }
      uint64_t v18 = gpsExFatLog;
      if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      int v44 = 67109120;
      LODWORD(v45) = v17;
      uint64_t v19 = "FSOPS_ReadBootSector: failed to read boot record %d\n";
LABEL_18:
      __int16 v20 = v18;
LABEL_22:
      uint32_t v23 = 8;
LABEL_23:
      _os_log_impl(&dword_22C0F9000, v20, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v44, v23);
      goto LABEL_24;
    }
    uint64_t v11 = *(_WORD **)(a1 + 2024);
    if (*((unsigned __int8 *)v11 + 105) << 8 != 256)
    {
      *a2 = 22;
      if (!gbIsLoggerInit) {
        goto LABEL_26;
      }
      uint64_t v21 = gpsExFatLog;
      if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      int v22 = (unsigned __int16)v11[52];
      int v44 = 67109120;
      LODWORD(v45) = v22;
      uint64_t v19 = "FSOPS_ReadBootSector: Unknown ExFAT version: %04X\n";
      __int16 v20 = v21;
      goto LABEL_22;
    }
    __int16 v12 = v11[53];
    if ((v12 & 2) != 0)
    {
      if (gbIsLoggerInit)
      {
        int v13 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = "Continue";
          if (a4) {
            uint64_t v14 = "Fail";
          }
          int v44 = 136315138;
          size_t v45 = (size_t)v14;
          _os_log_impl(&dword_22C0F9000, v13, OS_LOG_TYPE_DEFAULT, "FSOPS_ReadBootSector: Device is dirty [%s]", (uint8_t *)&v44, 0xCu);
        }
      }
      if (a4)
      {
        *a2 = 22;
LABEL_26:
        free(*(void **)(a1 + 2024));
        *(void *)(a1 + 2024) = 0;
        return;
      }
    }
    int v24 = *((unsigned __int8 *)v11 + 108);
    if ((v24 - 13) <= 0xFFFFFFFB)
    {
      *a2 = 22;
      if (!gbIsLoggerInit) {
        goto LABEL_26;
      }
      uint64_t v18 = gpsExFatLog;
      if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      int v44 = 67109120;
      LODWORD(v45) = v24;
      uint64_t v19 = "FSOPS_ReadBootSector: Invalid bytes per sector shift: %d\n";
      goto LABEL_18;
    }
    unint64_t v25 = 1 << v24;
    *(void *)(a1 + 48) = 1 << v24;
    int v26 = *(unsigned __int8 **)(a1 + 2024);
    if (*(void *)(a1 + 2032) >= (unint64_t)(12 << v24))
    {
      unint64_t v30 = 11 << v24;
    }
    else
    {
      free(v26);
      size_t v27 = 12 * *(void *)(a1 + 48);
      *(void *)(a1 + 2032) = v27;
      if (gbIsLoggerInit)
      {
        int v28 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel))
        {
          int v44 = 134217984;
          size_t v45 = v27;
          _os_log_impl(&dword_22C0F9000, v28, (os_log_type_t)gpeExfatToOsLevel, "FSOPS_ReadBootSector: Resizing boot region to %llu\n", (uint8_t *)&v44, 0xCu);
          size_t v27 = *(void *)(a1 + 2032);
        }
      }
      long long v29 = malloc_type_malloc(v27, 0xB5CE6482uLL);
      *(void *)(a1 + 2024) = v29;
      if (!v29)
      {
        *a2 = 12;
        if (!gbIsLoggerInit) {
          goto LABEL_26;
        }
        uint64_t v37 = gpsExFatLog;
        if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
          goto LABEL_24;
        }
        LOWORD(v44) = 0;
        uint64_t v19 = "FSOPS_ReadBootSector: failed to malloc pvBootSector\n";
LABEL_62:
        __int16 v20 = v37;
        uint32_t v23 = 2;
        goto LABEL_23;
      }
      uint64_t v11 = v29;
      if (pread(*(_DWORD *)a1, v29, *(void *)(a1 + 2032), 0) != *(void *)(a1 + 2032))
      {
        v41 = __error();
        int v17 = *v41;
        *a2 = *v41;
        if (!gbIsLoggerInit)
        {
LABEL_25:
          if (!v17) {
            return;
          }
          goto LABEL_26;
        }
        uint64_t v18 = gpsExFatLog;
        if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
LABEL_24:
          int v17 = *a2;
          goto LABEL_25;
        }
        int v44 = 67109120;
        LODWORD(v45) = v17;
        uint64_t v19 = "FSOPS_ReadBootSector: failed to read boot record %d\n";
        goto LABEL_18;
      }
      unint64_t v25 = *(void *)(a1 + 48);
      int v26 = *(unsigned __int8 **)(a1 + 2024);
      if (!v25)
      {
        unint64_t v30 = 0;
        int v32 = 0;
        goto LABEL_49;
      }
      unint64_t v30 = 11 * v25;
    }
    uint64_t v31 = 0;
    int v32 = 0;
    do
    {
      if ((v31 - 106) > 6 || ((1 << (v31 - 106)) & 0x43) == 0)
      {
        HIDWORD(v34) = v32;
        LODWORD(v34) = v32;
        int v32 = (v34 >> 1) + v26[v31];
      }
      ++v31;
    }
    while (v30 > v31);
LABEL_49:
    long long v35 = &v26[v30];
    while (v35 < &v26[12 * v25])
    {
      int v36 = *(_DWORD *)v35;
      v35 += 4;
      if (v36 != v32)
      {
        *a2 = 22;
        if (!gbIsLoggerInit) {
          goto LABEL_26;
        }
        uint64_t v37 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v44) = 0;
          uint64_t v19 = "FSOPS_ReadBootSector: Invalid boot region checksum\n";
          goto LABEL_62;
        }
        goto LABEL_24;
      }
    }
    int v38 = *((unsigned __int8 *)v11 + 109);
    if (v38 + *((unsigned __int8 *)v11 + 108) < 0x1A)
    {
      unint64_t v39 = v25 << v38;
      *(void *)(a1 + 56) = v39;
      if (a5 && v39 >= 0x2000001)
      {
        *a2 = 45;
        if (!gbIsLoggerInit) {
          goto LABEL_26;
        }
        uint64_t v40 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          int v44 = 134217984;
          size_t v45 = v39;
          uint64_t v19 = "FSOPS_ReadBootSector: Cluster size not supported: %llu\n";
          __int16 v20 = v40;
          uint32_t v23 = 12;
          goto LABEL_23;
        }
      }
      else
      {
        int v42 = *((unsigned __int8 *)v11 + 110);
        if ((v42 - 3) > 0xFFFFFFFD)
        {
          if (v42 == 1 && (v11[53] & 1) != 0)
          {
            *a2 = 22;
            if (!gbIsLoggerInit) {
              goto LABEL_26;
            }
            uint64_t v37 = gpsExFatLog;
            if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
            {
              LOWORD(v44) = 0;
              uint64_t v19 = "FSOPS_ReadBootSector: Alternate FAT is active, but volume has only one FAT!\n";
              goto LABEL_62;
            }
          }
          else
          {
            *(_DWORD *)(a1 + 24) = v12 & 1;
            uint64_t v43 = *((unsigned int *)v11 + 21);
            *(void *)(a1 + 8) = (*((unsigned int *)v11 + 20) + (unint64_t)(v43 * (v12 & 1)))
                                * v25;
            *(void *)(a1 + 16) = v25 * v43;
            *(void *)(a1 + 64) = v25 * *((unsigned int *)v11 + 22);
            *(_DWORD *)(a1 + 80) = *((_DWORD *)v11 + 23) + 1;
            *(_DWORD *)(a1 + 32) = *((_DWORD *)v11 + 24);
            *(void *)(a1 + 40) = v25;
            *(_DWORD *)(a1 + 84) = 2 * (v39 / v25);
          }
        }
        else
        {
          *a2 = 22;
          if (!gbIsLoggerInit) {
            goto LABEL_26;
          }
          uint64_t v18 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            int v44 = 67109120;
            LODWORD(v45) = v42;
            uint64_t v19 = "FSOPS_ReadBootSector: Invalid number of FATs: %d\n";
            goto LABEL_18;
          }
        }
      }
    }
    else
    {
      *a2 = 22;
      if (!gbIsLoggerInit) {
        goto LABEL_26;
      }
      uint64_t v18 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        int v44 = 67109120;
        LODWORD(v45) = v38;
        uint64_t v19 = "FSOPS_ReadBootSector: Invalid sectors per cluster shift: %d\n";
        goto LABEL_18;
      }
    }
    goto LABEL_24;
  }
  *a2 = 12;
  if (gbIsLoggerInit)
  {
    int v15 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v44) = 0;
      _os_log_impl(&dword_22C0F9000, v15, OS_LOG_TYPE_ERROR, "FSOPS_ReadBootSector: failed to malloc pvBootSector\n", (uint8_t *)&v44, 2u);
    }
  }
}

uint64_t FSOPS_CreateRootRecord(uint64_t a1, void **a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t Record = FILERECORD_AllocateRecord(a2, 0, a1, *(_DWORD *)(a1 + 32), *(_DWORD *)(a1 + 32), 1, 0, "");
  if (!Record)
  {
    memset(v33, 0, sizeof(v33));
    memset(v31, 0, sizeof(v31));
    uint64_t v32 = 0;
    FSOPS_lookupVolumeLabel((uint64_t)*a2);
    LODWORD(v31[0]) = 4;
    uint64_t v6 = DIROPS_LookForDirEntry((uint64_t)*a2, (int *)v31, 0, (uint64_t)v33);
    if (v6)
    {
      uint64_t Record = v6;
      if (!gbIsLoggerInit) {
        return Record;
      }
      uint64_t v7 = gpsExFatLog;
      if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
        return Record;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = Record;
      uint64_t v8 = "FSOPS_CreateRootRecord: Failed to locate Upcase entry. Error [%d]\n";
      size_t v9 = v7;
      uint32_t v10 = 8;
LABEL_7:
      _os_log_impl(&dword_22C0F9000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
      return Record;
    }
    *(void *)buf = 0;
    if (gbIsLoggerInit)
    {
      uint64_t v11 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel))
      {
        *(_WORD *)long long v35 = 0;
        _os_log_impl(&dword_22C0F9000, v11, (os_log_type_t)gpeExfatToOsLevel, "FSOPS_CreateRootRecord: found Upcase entry.\n", v35, 2u);
      }
    }
    int v12 = DWORD1(v33[1]);
    if (DWORD1(v33[1]) < 2 || DWORD1(v33[1]) > *(_DWORD *)(a1 + 80))
    {
      if (!gbIsLoggerInit) {
        return 22;
      }
      uint64_t v13 = gpsExFatLog;
      if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
        return 22;
      }
      *(_DWORD *)long long v35 = 67109120;
      int v36 = v12;
      uint64_t v14 = "FSOPS_CreateRootRecord: first cluster is invalid (%u)\n";
      int v15 = v35;
      uint64_t v16 = v13;
      uint32_t v17 = 8;
LABEL_16:
      _os_log_impl(&dword_22C0F9000, v16, OS_LOG_TYPE_ERROR, v14, v15, v17);
      return 22;
    }
    uint64_t v18 = FILERECORD_AllocateRecord((void **)buf, 0, a1, DWORD1(v33[1]), *(_DWORD *)(a1 + 32), 6, 0, 0);
    if (v18) {
      return v18;
    }
    uint64_t Record = FSOPS_ReadUpcase(a1, (uint64_t)v33, *(uint64_t *)buf);
    FILERECORD_FreeRecord(*(char **)buf, 1);
    if (Record) {
      return Record;
    }
    LODWORD(v31[0]) = 3;
    uint64_t v19 = DIROPS_LookForDirEntry((uint64_t)*a2, (int *)v31, 0, (uint64_t)v33);
    if (v19)
    {
      uint64_t Record = v19;
      if (!gbIsLoggerInit) {
        return Record;
      }
      uint64_t v20 = gpsExFatLog;
      if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
        return Record;
      }
      *(_WORD *)buf = 0;
      uint64_t v8 = "FSOPS_CreateRootRecord: Failed to locate Bitmap entry.\n";
LABEL_25:
      size_t v9 = v20;
      uint32_t v10 = 2;
      goto LABEL_7;
    }
    if (gbIsLoggerInit)
    {
      uint64_t v21 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C0F9000, v21, (os_log_type_t)gpeExfatToOsLevel, "FSOPS_CreateRootRecord: found bitmap entry.\n", buf, 2u);
      }
    }
    uint64_t v22 = *((void *)&v33[1] + 1);
    unint64_t v23 = (*(_DWORD *)(a1 + 80) - 1);
    if (v23 > 8 * *((void *)&v33[1] + 1))
    {
      if (!gbIsLoggerInit) {
        return 22;
      }
      uint64_t v24 = gpsExFatLog;
      if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
        return 22;
      }
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v22;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v23;
      uint64_t v14 = "FSOPS_CreateRootRecord: Bitmap is too small (bitmapLength=%llu, numClusters=%u).\n";
      int v15 = buf;
      uint64_t v16 = v24;
      uint32_t v17 = 18;
      goto LABEL_16;
    }
    uint64_t Record = FILERECORD_AllocateRecord((void **)(a1 + 2040), 0, a1, DWORD1(v33[1]), *(_DWORD *)(a1 + 32), 5, v33, 0);
    if (Record) {
      return Record;
    }
    *(void *)(a1 + 1480) = v22;
    LODWORD(v31[0]) = 5;
    uint64_t v25 = DIROPS_LookForDirEntry((uint64_t)*a2, (int *)v31, 0, (uint64_t)v33);
    if (v25 == 2)
    {
      uint64_t v28 = *(void *)(a1 + 2024);
      if (gbIsLoggerInit)
      {
        long long v29 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22C0F9000, v29, (os_log_type_t)gpeExfatToOsLevel, "FSOPS_CreateRootRecord: did not find GUID entry, creating one based on the serial number.\n", buf, 2u);
        }
      }
      FSOPS_CreateUUidFromSerial(a1 + 153, (const void *)(v28 + 100));
    }
    else
    {
      uint64_t Record = v25;
      if (v25)
      {
        if (!gbIsLoggerInit) {
          return Record;
        }
        uint64_t v20 = gpsExFatLog;
        if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
          return Record;
        }
        *(_WORD *)buf = 0;
        uint64_t v8 = "FSOPS_CreateRootRecord: Failed to locate GUID entry.\n";
        goto LABEL_25;
      }
      *(_DWORD *)long long v35 = 0;
      int v26 = DIROPS_ChecksumFileSet((uint64_t)v33, 0, v35, 1u);
      if (WORD1(v33[0]) != v26)
      {
        if (!gbIsLoggerInit) {
          return 22;
        }
        uint64_t v30 = gpsExFatLog;
        if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
          return 22;
        }
        *(_WORD *)buf = 0;
        uint64_t v14 = "FSOPS_CreateRootRecord: GUID checksum is Invalid.\n";
        int v15 = buf;
        uint64_t v16 = v30;
        uint32_t v17 = 2;
        goto LABEL_16;
      }
      if (gbIsLoggerInit)
      {
        size_t v27 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22C0F9000, v27, (os_log_type_t)gpeExfatToOsLevel, "FSOPS_CreateRootRecord: found GUID entry.\n", buf, 2u);
        }
      }
      *(_OWORD *)buf = *(long long *)((char *)v33 + 6);
      exfat_guid_to_uuid((uint64_t)buf, a1 + 153);
    }
    uint64_t Record = 0;
    *(unsigned char *)(a1 + 169) = 1;
  }
  return Record;
}

uint64_t FSOPS_lookupVolumeLabel(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 216);
  uint64_t v3 = a1 + 8;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  uint64_t v22 = 0;
  memset(v21, 0, sizeof(v21));
  LODWORD(v21[0]) = 2;
  MultiReadSingleWrite_LockRead((pthread_rwlock_t *)(a1 + 8));
  uint64_t v4 = DIROPS_LookForDirEntry(a1, (int *)v21, 0, (uint64_t)&v23);
  if (v4)
  {
    uint64_t v5 = v4;
    if (gbIsLoggerInit)
    {
      uint64_t v6 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel))
      {
        *(_DWORD *)buf = 136315138;
        long long v35 = "FSOPS_lookupVolumeLabel";
        _os_log_impl(&dword_22C0F9000, v6, (os_log_type_t)gpeExfatToOsLevel, "%s: volume label entry is not there", buf, 0xCu);
      }
    }
    goto LABEL_22;
  }
  *(_OWORD *)(a1 + 248) = v23;
  long long v7 = v31;
  *(_OWORD *)(v3 + 352) = v30;
  *(_OWORD *)(v3 + 368) = v7;
  long long v8 = v33;
  *(_OWORD *)(v3 + 384) = v32;
  *(_OWORD *)(v3 + 400) = v8;
  long long v9 = v27;
  *(_OWORD *)(v3 + 288) = v26;
  *(_OWORD *)(v3 + 304) = v9;
  long long v10 = v29;
  *(_OWORD *)(v3 + 320) = v28;
  *(_OWORD *)(v3 + 336) = v10;
  long long v11 = v24;
  long long v12 = v25;
  *(unsigned char *)(a1 + 424) = 1;
  if (BYTE1(v23) >= 0xBu) {
    int v13 = 11;
  }
  else {
    int v13 = BYTE1(v23);
  }
  *(_OWORD *)(v3 + 256) = v11;
  *(_OWORD *)(v3 + 272) = v12;
  if (!v13)
  {
    if (gbIsLoggerInit)
    {
      uint64_t v18 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel))
      {
        *(_DWORD *)buf = 136315138;
        long long v35 = "FSOPS_lookupVolumeLabel";
        _os_log_impl(&dword_22C0F9000, v18, (os_log_type_t)gpeExfatToOsLevel, "%s: volume label entry is there, but 0 length", buf, 0xCu);
      }
    }
    goto LABEL_17;
  }
  uint64_t v14 = malloc_type_calloc(1uLL, 0x200uLL, 0x10000407EBBDD04uLL);
  if (v14)
  {
    int v15 = v14;
    __memcpy_chk();
    *int v15 = v13;
    *(_OWORD *)(v2 + 88) = 0u;
    uint64_t v16 = v2 + 88;
    *(_OWORD *)(v16 + 16) = 0u;
    *(_OWORD *)(v16 + 32) = 0u;
    *(_OWORD *)(v16 + 48) = 0u;
    CONV_Unistr255ToUTF8(v15, (unsigned char *)v16, 64);
    *(unsigned char *)(v16 + 64) = 1;
    if (gbIsLoggerInit)
    {
      uint32_t v17 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel))
      {
        *(_DWORD *)buf = 136315650;
        long long v35 = "FSOPS_lookupVolumeLabel";
        __int16 v36 = 1024;
        int v37 = v13;
        __int16 v38 = 2080;
        uint64_t v39 = v16;
        _os_log_impl(&dword_22C0F9000, v17, (os_log_type_t)gpeExfatToOsLevel, "%s: volume label length: %d: volume label: [%s]", buf, 0x1Cu);
      }
    }
    free(v15);
LABEL_17:
    uint64_t v5 = 0;
    goto LABEL_22;
  }
  if (gbIsLoggerInit)
  {
    uint64_t v19 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C0F9000, v19, OS_LOG_TYPE_ERROR, "FSOPS_CreateRootRecord failed to allocate memory.", buf, 2u);
    }
  }
  uint64_t v5 = 12;
LABEL_22:
  MultiReadSingleWrite_FreeRead((pthread_rwlock_t *)v3);
  return v5;
}

uint64_t FSOPS_ReadUpcase(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  int v35 = *(_DWORD *)(a3 + 428);
  unsigned int v36 = 0;
  unint64_t v4 = *(void *)(a2 + 24);
  if (v4 <= 0x20000)
  {
    long long v9 = malloc_type_malloc(0x20000uLL, 0x1000040BDFB0063uLL);
    *(void *)(a1 + 2048) = v9;
    if (v9)
    {
      long long v10 = (unsigned __int16 *)malloc_type_malloc(*(void *)(a1 + 56), 0x9C9BE610uLL);
      if (v10)
      {
        uint64_t v6 = v10;
        unint64_t v11 = 0;
        unint64_t v12 = 0;
        unint64_t v13 = v4 >> 1;
        do
        {
          int v14 = *(_DWORD *)a1;
          size_t v15 = *(void *)(a1 + 56);
          off_t v16 = DIROPS_VolumeOffsetForCluster(a1, v35);
          unint64_t v17 = pread(v14, v6, v15, v16);
          if (*(void *)(a1 + 56) != v17)
          {
            int v33 = *__error();
            unsigned int v36 = v33;
            if (gbIsLoggerInit)
            {
              unint64_t v34 = gpsExFatLog;
              if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109120;
                LODWORD(v38) = v33;
                _os_log_impl(&dword_22C0F9000, v34, OS_LOG_TYPE_ERROR, "FSOPS_ReadUpcase: failed to read errno = %d\n", buf, 8u);
              }
            }
            goto LABEL_47;
          }
          if (v11 < v13)
          {
            uint64_t v18 = 0;
            unint64_t v19 = v17 >> 1;
            while (v18 != v19)
            {
              int v20 = v6[v11 % v19];
              unint64_t v21 = v11 + 1;
              BOOL v22 = v20 != 0xFFFF || v21 >= v13;
              if (v22)
              {
                *(_WORD *)(*(void *)(a1 + 2048) + 2 * v12++) = v20;
                ++v11;
              }
              else
              {
                int v23 = v6[v21 % v19];
                if (v23)
                {
                  uint64_t v24 = *(void *)(a1 + 2048);
                  do
                  {
                    *(_WORD *)(v24 + 2 * v12) = v12;
                    unint64_t v25 = v12 + 1;
                    LOWORD(v23) = v23 - 1;
                    if (!(_WORD)v23) {
                      break;
                    }
                    BOOL v22 = v12++ >= 0xFFFF;
                  }
                  while (!v22);
                }
                else
                {
                  unint64_t v25 = v12;
                }
                if ((_WORD)v23)
                {
                  if (gbIsLoggerInit)
                  {
                    long long v26 = gpsExFatLog;
                    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)buf = 0;
                      long long v27 = "FSOPS_ReadUpcase: malformed upcase table (run too large)\n";
                      goto LABEL_55;
                    }
                  }
                  goto LABEL_6;
                }
                v11 += 2;
                unint64_t v12 = v25;
              }
              if (v11 < v13)
              {
                ++v18;
                if (v12 < 0x10000) {
                  continue;
                }
              }
              break;
            }
          }
          *(_DWORD *)buf = 0;
          FILERECORD_GetChainFromCache(a3, 2 * v11, (unsigned int *)&v35, buf, (int *)&v36);
          if (v36) {
            goto LABEL_47;
          }
        }
        while (v11 < v13 && v12 < 0x10000);
        if (v11 >= v13)
        {
          if (v12 == 0x10000)
          {
            *(void *)(a1 + 2056) = v11;
            goto LABEL_50;
          }
          if (gbIsLoggerInit)
          {
            long long v26 = gpsExFatLog;
            if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              long long v27 = "FSOPS_ReadUpcase: malformed upcase table (too short)\n";
              goto LABEL_55;
            }
          }
        }
        else if (gbIsLoggerInit)
        {
          long long v26 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            long long v27 = "FSOPS_ReadUpcase: malformed upcase table (source too large\n";
LABEL_55:
            _os_log_impl(&dword_22C0F9000, v26, OS_LOG_TYPE_ERROR, v27, buf, 2u);
            goto LABEL_6;
          }
        }
        goto LABEL_6;
      }
      if (!gbIsLoggerInit
        || (long long v28 = gpsExFatLog, !os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)))
      {
LABEL_45:
        uint64_t v6 = 0;
        unsigned int v7 = 12;
        goto LABEL_46;
      }
      *(_WORD *)buf = 0;
      long long v29 = "FSOPS_ReadUpcase: could not allocate compressed upcase table\n";
    }
    else
    {
      if (!gbIsLoggerInit) {
        goto LABEL_45;
      }
      long long v28 = gpsExFatLog;
      if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_45;
      }
      *(_WORD *)buf = 0;
      long long v29 = "FSOPS_ReadUpcase: could not allocate upcase table\n";
    }
    _os_log_impl(&dword_22C0F9000, v28, OS_LOG_TYPE_ERROR, v29, buf, 2u);
    goto LABEL_45;
  }
  if (gbIsLoggerInit)
  {
    uint64_t v5 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v38 = v4;
      _os_log_impl(&dword_22C0F9000, v5, OS_LOG_TYPE_ERROR, "FSOPS_ReadUpcase: length is too large (%llu)\n", buf, 0xCu);
    }
  }
  uint64_t v6 = 0;
LABEL_6:
  unsigned int v7 = 22;
LABEL_46:
  unsigned int v36 = v7;
LABEL_47:
  long long v30 = *(void **)(a1 + 2048);
  if (v30)
  {
    long long v31 = (void *)(a1 + 2048);
    free(v30);
    *long long v31 = 0;
    v31[1] = 0;
  }
  if (v6) {
LABEL_50:
  }
    free(v6);
  return v36;
}

uint64_t exfat_guid_to_uuid(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = bswap32(*(_DWORD *)result);
  *(_WORD *)(a2 + 4) = bswap32(*(unsigned __int16 *)(result + 4)) >> 16;
  *(_WORD *)(a2 + 6) = bswap32(*(unsigned __int16 *)(result + 6)) >> 16;
  *(void *)(a2 + 8) = *(void *)(result + 8);
  return result;
}

uint64_t FSOPS_CreateUUidFromSerial(uint64_t a1, const void *a2)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  memset(&v5, 0, sizeof(v5));
  CC_MD5_Init(&v5);
  CC_MD5_Update(&v5, &kFSUUIDNamespaceSHA1, 0x10u);
  CC_MD5_Update(&v5, a2, 4u);
  uint64_t result = CC_MD5_Final((unsigned __int8 *)a1, &v5);
  *(unsigned char *)(a1 + 6) = *(unsigned char *)(a1 + 6) & 0xF | 0x30;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a1 + 8) & 0x3F | 0x80;
  return result;
}

uint64_t exfat_sync_internal(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 216);
  int v4 = FILEOPS_FlushDirEntryIfNeeded(a1);
  if (v4)
  {
    if (gbIsLoggerInit)
    {
      int v5 = v4;
      uint64_t v6 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        int v13 = 136315394;
        int v14 = "exfat_sync_internal";
        __int16 v15 = 1024;
        int v16 = v5;
        _os_log_impl(&dword_22C0F9000, v6, OS_LOG_TYPE_ERROR, "%s: FILEOPS_FlushDirEntryIfNeeded returned %d\n", (uint8_t *)&v13, 0x12u);
      }
    }
  }
  unsigned int v7 = (pthread_rwlock_t *)(v3 + 2064);
  MultiReadSingleWrite_LockWrite((pthread_rwlock_t *)(v3 + 2064));
  if (!atomic_load((unint64_t *)(v3 + 2264)) && !atomic_load((unint64_t *)(v3 + 2632))) {
    FSOPS_SetDeviceAsDirty(v3, 0);
  }
  uint64_t v10 = metaFlush((unsigned int *)v3, a2);
  if (v10)
  {
    if (gbIsLoggerInit)
    {
      unint64_t v11 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        int v13 = 136315394;
        int v14 = "exfat_sync_internal";
        __int16 v15 = 1024;
        int v16 = v10;
        _os_log_impl(&dword_22C0F9000, v11, OS_LOG_TYPE_ERROR, "%s: couldn't flush metadata. error = %d.", (uint8_t *)&v13, 0x12u);
      }
    }
  }
  MultiReadSingleWrite_FreeWrite(v7);
  return v10;
}

unint64_t RAWFILE_read(uint64_t a1, unint64_t a2, unint64_t a3, char *a4, int *a5)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  if (!a3) {
    return 0;
  }
  unint64_t v7 = 0;
  uint64_t v8 = *(void *)(a1 + 216);
  unint64_t v9 = *(void *)(a1 + 288);
  size_t v10 = *(void *)(v8 + 48);
  unint64_t v38 = *(void *)(v8 + 56);
  uint64_t v36 = a1;
  while (1)
  {
    if (v9 >= a2 + a3 - v7) {
      size_t v11 = a3 - v7;
    }
    else {
      size_t v11 = v9 - a2;
    }
    if (!v11) {
      return v7;
    }
    uint64_t v40 = 0;
    FILERECORD_GetChainFromCache(a1, a2, (unsigned int *)&v40 + 1, &v40, a5);
    int v12 = *a5;
    if (*a5)
    {
      if (gbIsLoggerInit)
      {
        uint64_t v27 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)int v42 = v12;
          uint64_t v24 = "RAWFILE_read failed to get chain from cache = %d\n";
          unint64_t v25 = v27;
          uint32_t v26 = 8;
          goto LABEL_36;
        }
      }
      return 0;
    }
    if (!v40 || v9 <= a2) {
      return v7;
    }
    unint64_t v13 = a2 / v10 * v10 % v38 + DIROPS_VolumeOffsetForCluster(v8, SHIDWORD(v40));
    if (v13 < *(void *)(v8 + 64)) {
      break;
    }
    unint64_t v14 = a2 % v10;
    if (a2 % v10)
    {
      __int16 v15 = (char *)malloc_type_malloc(v10, 0xDB3E967EuLL);
      if (!v15) {
        goto LABEL_41;
      }
      int v16 = v15;
      if (pread(*(_DWORD *)v8, v15, v10, v13) != v10)
      {
        long long v29 = __error();
        int v30 = *v29;
        *a5 = *v29;
        if (gbIsLoggerInit)
        {
          long long v31 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109632;
            *(_DWORD *)int v42 = v30;
            *(_WORD *)&v42[4] = 2048;
            *(void *)&v42[6] = v13;
            __int16 v43 = 2048;
            size_t v44 = v10;
            long long v32 = "RAWFILE_read [1] failed to read err = %d, offset [%llu], size [%llu] \n";
            goto LABEL_48;
          }
        }
        goto LABEL_49;
      }
      if (v11 >= v10 - v14) {
        size_t v11 = v10 - v14;
      }
      uint64_t v17 = &v16[v14];
      uint64_t v18 = a4;
      goto LABEL_21;
    }
    if (v11 >= v10)
    {
      if (a2 / v38 * v38 - a2 + v38 * v40 >= 0x7FFFF000) {
        size_t v20 = 2147479552;
      }
      else {
        size_t v20 = a2 / v38 * v38 - a2 + v38 * v40;
      }
      if (v11 < v20) {
        size_t v20 = v11 / v10 * v10;
      }
      if (pread(*(_DWORD *)v8, &a4[v7], v20, v13) == v20) {
        goto LABEL_22;
      }
      unint64_t v21 = __error();
      int v22 = *v21;
      *a5 = *v21;
      if (gbIsLoggerInit)
      {
        uint64_t v23 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109632;
          *(_DWORD *)int v42 = v22;
          *(_WORD *)&v42[4] = 2048;
          *(void *)&v42[6] = v13;
          __int16 v43 = 2048;
          size_t v44 = v20;
          uint64_t v24 = "RAWFILE_read [3] failed to read err = %d, offset [%llu], size [%llu] \n";
          unint64_t v25 = v23;
          uint32_t v26 = 28;
LABEL_36:
          _os_log_impl(&dword_22C0F9000, v25, OS_LOG_TYPE_ERROR, v24, buf, v26);
          return 0;
        }
      }
      return 0;
    }
    unint64_t v19 = (char *)malloc_type_malloc(v10, 0xB2FDCE54uLL);
    if (!v19)
    {
LABEL_41:
      *a5 = 12;
      return 0;
    }
    int v16 = v19;
    if (pread(*(_DWORD *)v8, v19, v10, v13) != v10)
    {
      int v33 = __error();
      int v34 = *v33;
      *a5 = *v33;
      if (gbIsLoggerInit)
      {
        long long v31 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109632;
          *(_DWORD *)int v42 = v34;
          *(_WORD *)&v42[4] = 2048;
          *(void *)&v42[6] = v13;
          __int16 v43 = 2048;
          size_t v44 = v10;
          long long v32 = "RAWFILE_read [2] failed to read err = %d, offset [%llu], size [%llu] \n";
LABEL_48:
          _os_log_impl(&dword_22C0F9000, v31, OS_LOG_TYPE_ERROR, v32, buf, 0x1Cu);
        }
      }
LABEL_49:
      free(v16);
      return 0;
    }
    uint64_t v18 = &a4[v7];
    uint64_t v17 = v16;
LABEL_21:
    memcpy(v18, v17, v11);
    free(v16);
    size_t v20 = v11;
LABEL_22:
    v7 += v20;
    a2 += v20;
    a1 = v36;
    if (v7 >= a3) {
      return v7;
    }
  }
  if (gbIsLoggerInit)
  {
    long long v28 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)int v42 = v13;
      _os_log_impl(&dword_22C0F9000, v28, OS_LOG_TYPE_ERROR, "RAWFILE_read read file offset is within cluster offset zone = %llu\n", buf, 0xCu);
    }
  }
  *a5 = 14;
  return v7;
}

unint64_t RAWFILE_write(uint64_t a1, unint64_t a2, unint64_t a3, char *a4, int *a5)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  if (!a3) {
    return 0;
  }
  unint64_t v6 = a3;
  unint64_t v8 = 0;
  uint64_t v9 = *(void *)(a1 + 216);
  size_t v10 = *(void *)(v9 + 48);
  unint64_t v11 = *(void *)(v9 + 56);
  uint64_t v38 = a1;
  while (1)
  {
    uint64_t v41 = 0;
    FILERECORD_GetChainFromCache(a1, a2, (unsigned int *)&v41, (_DWORD *)&v41 + 1, a5);
    if (*a5) {
      return v8;
    }
    if (!HIDWORD(v41)) {
      break;
    }
    unint64_t v12 = a2 / v10 * v10 % v11 + DIROPS_VolumeOffsetForCluster(v9, v41);
    if (v12 < *(void *)(v9 + 64))
    {
      if (gbIsLoggerInit)
      {
        size_t v20 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)__int16 v43 = v12;
          _os_log_impl(&dword_22C0F9000, v20, OS_LOG_TYPE_ERROR, "RAWFILE_write write file offset is within cluster offset zone = %llu\n", buf, 0xCu);
        }
      }
      *a5 = 14;
      return v8;
    }
    size_t v13 = v6 - v8;
    unint64_t v14 = a2 % v10;
    if (a2 % v10)
    {
      __int16 v15 = (char *)malloc_type_malloc(v10, 0x99243AFuLL);
      if (!v15) {
        goto LABEL_34;
      }
      int v16 = v15;
      if (v13 >= v10 - v14) {
        size_t v13 = v10 - v14;
      }
      if (pread(*(_DWORD *)v9, v15, v10, v12) != v10)
      {
        unint64_t v21 = __error();
        int v22 = *v21;
        *a5 = *v21;
        if (!gbIsLoggerInit) {
          goto LABEL_53;
        }
        uint64_t v23 = gpsExFatLog;
        if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
          goto LABEL_53;
        }
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)__int16 v43 = v22;
        uint64_t v24 = "RAWFILE_write: Failed to read (1). Error [%d]\n";
LABEL_51:
        int v33 = v23;
        uint32_t v34 = 8;
        goto LABEL_52;
      }
      memcpy(&v16[v14], a4, v13);
      if (pwrite(*(_DWORD *)v9, v16, v10, v12) != v10)
      {
        unint64_t v25 = __error();
        int v26 = *v25;
        *a5 = *v25;
        if (gbIsLoggerInit)
        {
          uint64_t v27 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109632;
            *(_DWORD *)__int16 v43 = v26;
            *(_WORD *)&v43[4] = 2048;
            *(void *)&v43[6] = v12;
            __int16 v44 = 2048;
            size_t v45 = v10;
            uint64_t v24 = "RAWFILE_write [1] failed to write err = %d, offset [%llu], size [%llu] \n";
            goto LABEL_47;
          }
        }
        goto LABEL_53;
      }
      free(v16);
      *a5 = 0;
    }
    else if (v13 >= v10)
    {
      if (a2 / v11 * v11 - a2 + v11 * HIDWORD(v41) >= 0x7FFFF000) {
        size_t v18 = 2147479552;
      }
      else {
        size_t v18 = a2 / v11 * v11 - a2 + v11 * HIDWORD(v41);
      }
      if (v13 < v18) {
        size_t v18 = v13 / v10 * v10;
      }
      if (pwrite(*(_DWORD *)v9, &a4[v8], v18, v12) != v18)
      {
        long long v28 = __error();
        int v29 = *v28;
        *a5 = *v28;
        if (gbIsLoggerInit)
        {
          int v30 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109632;
            *(_DWORD *)__int16 v43 = v29;
            *(_WORD *)&v43[4] = 2048;
            *(void *)&v43[6] = v12;
            __int16 v44 = 2048;
            size_t v45 = v18;
            _os_log_impl(&dword_22C0F9000, v30, OS_LOG_TYPE_ERROR, "RAWFILE_write [3] failed to write err = %d, offset [%llu], size [%llu] \n", buf, 0x1Cu);
          }
        }
        return 0;
      }
      size_t v13 = v18;
    }
    else
    {
      uint64_t v17 = (char *)malloc_type_malloc(v10, 0x77D187D3uLL);
      if (!v17)
      {
LABEL_34:
        *a5 = 12;
        return 0;
      }
      int v16 = v17;
      if (pread(*(_DWORD *)v9, v17, v10, v12) != v10)
      {
        long long v31 = __error();
        int v32 = *v31;
        *a5 = *v31;
        if (gbIsLoggerInit)
        {
          uint64_t v27 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109632;
            *(_DWORD *)__int16 v43 = v32;
            *(_WORD *)&v43[4] = 2048;
            *(void *)&v43[6] = v12;
            __int16 v44 = 2048;
            size_t v45 = v10;
            uint64_t v24 = "RAWFILE_write [2] failed to read err = %d, offset [%llu], size [%llu] \n";
LABEL_47:
            int v33 = v27;
            uint32_t v34 = 28;
LABEL_52:
            _os_log_impl(&dword_22C0F9000, v33, OS_LOG_TYPE_ERROR, v24, buf, v34);
          }
        }
LABEL_53:
        free(v16);
        return 0;
      }
      memcpy(v16, &a4[v8], v13);
      if (pwrite(*(_DWORD *)v9, v16, v10, v12) != v10)
      {
        int v35 = __error();
        int v36 = *v35;
        *a5 = *v35;
        if (!gbIsLoggerInit) {
          goto LABEL_53;
        }
        uint64_t v23 = gpsExFatLog;
        if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
          goto LABEL_53;
        }
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)__int16 v43 = v36;
        uint64_t v24 = "RAWFILE_write: Failed to write (2). Error [%d]\n";
        goto LABEL_51;
      }
      *a5 = 0;
      free(v16);
    }
    v8 += v13;
    a2 += v13;
    a1 = v38;
    unint64_t v6 = a3;
    if (v8 >= a3) {
      return v8;
    }
  }
  if (gbIsLoggerInit)
  {
    unint64_t v19 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)__int16 v43 = a2;
      _os_log_impl(&dword_22C0F9000, v19, (os_log_type_t)gpeExfatToOsLevel, "RAWFILE_write can't write anymore data, we reached the end of the allocated space - %llu\n", buf, 0xCu);
    }
  }
  return v8;
}

uint64_t metaWrite(int *a1, void *__buf, off_t a3, size_t __nbyte)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)a1 + 2641))
  {
    unint64_t v8 = (void *)fsUserClient;
    if (!fsUserClient)
    {
      uint64_t v9 = [MEMORY[0x263F522B0] defaultClient];
      size_t v10 = (void *)fsUserClient;
      fsUserClient = v9;

      unint64_t v8 = (void *)fsUserClient;
    }
    int v11 = [v8 writeMeta:*a1 buffer:__buf offset:a3 length:__nbyte];
    if (v11)
    {
      if (gbIsLoggerInit)
      {
        int v12 = v11;
        size_t v13 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          int v17 = 136315394;
          size_t v18 = "metaWrite";
          __int16 v19 = 1024;
          int v20 = v12;
          _os_log_impl(&dword_22C0F9000, v13, OS_LOG_TYPE_ERROR, "%s: writeMeta() failed, status: %d\n", (uint8_t *)&v17, 0x12u);
        }
      }
      return 5;
    }
    return 0;
  }
  if (pwrite(*a1, __buf, __nbyte, a3) == __nbyte) {
    return 0;
  }
  uint64_t v14 = *__error();
  if (gbIsLoggerInit)
  {
    int v16 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315394;
      size_t v18 = "metaWrite";
      __int16 v19 = 1024;
      int v20 = v14;
      _os_log_impl(&dword_22C0F9000, v16, OS_LOG_TYPE_ERROR, "%s: pwrite failed, errno = %d.\n", (uint8_t *)&v17, 0x12u);
    }
  }
  return v14;
}

uint64_t metaRead(int *a1, void *__buf, off_t a3, size_t __nbyte, uint64_t a5, uint64_t a6)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)a1 + 2641))
  {
    if (!fsUserClient)
    {
      uint64_t v12 = [MEMORY[0x263F522B0] defaultClient];
      size_t v13 = (void *)fsUserClient;
      fsUserClient = v12;
    }
    uint64_t v14 = *a1;
    if ((int)a6 < 1) {
      uint64_t v15 = [(id)fsUserClient readMeta:v14 buffer:__buf offset:a3 length:__nbyte];
    }
    else {
      uint64_t v15 = [(id)fsUserClient readMetaWithRA:v14 buffer:__buf offset:a3 length:__nbyte raList:a5 raListCount:a6];
    }
    uint64_t v16 = v15;
    if (v15)
    {
      if (gbIsLoggerInit)
      {
        int v17 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          int v20 = 136315394;
          uint64_t v21 = "metaRead";
          __int16 v22 = 1024;
          int v23 = v16;
          _os_log_impl(&dword_22C0F9000, v17, OS_LOG_TYPE_ERROR, "%s: readMeta() failed, status: %d\n", (uint8_t *)&v20, 0x12u);
        }
      }
      return 5;
    }
  }
  else if (pread(*a1, __buf, __nbyte, a3) == __nbyte)
  {
    return 0;
  }
  else
  {
    uint64_t v16 = *__error();
    if (gbIsLoggerInit)
    {
      __int16 v19 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        int v20 = 136315394;
        uint64_t v21 = "metaRead";
        __int16 v22 = 1024;
        int v23 = v16;
        _os_log_impl(&dword_22C0F9000, v19, OS_LOG_TYPE_ERROR, "%s: pread failed, errno = %d.\n", (uint8_t *)&v20, 0x12u);
      }
    }
  }
  return v16;
}

uint64_t metaFlush(unsigned int *a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!*((unsigned char *)a1 + 2641)) {
    return 0;
  }
  int v4 = (void *)fsUserClient;
  if (!fsUserClient)
  {
    uint64_t v5 = [MEMORY[0x263F522B0] defaultClient];
    unint64_t v6 = (void *)fsUserClient;
    fsUserClient = v5;

    int v4 = (void *)fsUserClient;
  }
  uint64_t result = [v4 flushMeta:*a1 wait:a2];
  if (result)
  {
    if (gbIsLoggerInit)
    {
      int v8 = result;
      uint64_t v9 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        int v10 = 136315394;
        int v11 = "metaFlush";
        __int16 v12 = 1024;
        int v13 = v8;
        _os_log_impl(&dword_22C0F9000, v9, OS_LOG_TYPE_ERROR, "%s: flushMeta() failed, status: %d\n", (uint8_t *)&v10, 0x12u);
      }
    }
    return 5;
  }
  return result;
}

uint64_t metaClear(unsigned int *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)a1 + 2641))
  {
    unint64_t v6 = (void *)fsUserClient;
    if (!fsUserClient)
    {
      uint64_t v7 = [MEMORY[0x263F522B0] defaultClient];
      int v8 = (void *)fsUserClient;
      fsUserClient = v7;

      unint64_t v6 = (void *)fsUserClient;
    }
    uint64_t result = [v6 clearMetaBlocks:*a1 ranges:a2 rangesCount:a3 wait:1];
    if (result)
    {
      if (gbIsLoggerInit)
      {
        int v10 = result;
        int v11 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          int v14 = 136315394;
          uint64_t v15 = "metaClear";
          __int16 v16 = 1024;
          int v17 = v10;
          _os_log_impl(&dword_22C0F9000, v11, OS_LOG_TYPE_ERROR, "%s: clearMetaBlocks() failed, status: %d\n", (uint8_t *)&v14, 0x12u);
        }
      }
      return 5;
    }
  }
  else
  {
    if ((int)a3 >= 1)
    {
      uint64_t v12 = a3;
      int v13 = (_DWORD *)(a2 + 12);
      do
      {
        ZeroFill_Fill(*a1, *(void *)(v13 - 3), (*v13 * *(v13 - 1)));
        v13 += 4;
        --v12;
      }
      while (v12);
    }
    return 0;
  }
  return result;
}

uint64_t metaPurge(unsigned int *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (!*((unsigned char *)a1 + 2641)) {
    return 0;
  }
  unint64_t v6 = (void *)fsUserClient;
  if (!fsUserClient)
  {
    uint64_t v7 = [MEMORY[0x263F522B0] defaultClient];
    int v8 = (void *)fsUserClient;
    fsUserClient = v7;

    unint64_t v6 = (void *)fsUserClient;
  }
  uint64_t result = [v6 purgeMetaBlocks:*a1 ranges:a2 rangesCount:a3];
  if (result)
  {
    if (gbIsLoggerInit)
    {
      int v10 = result;
      int v11 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136315394;
        int v13 = "metaPurge";
        __int16 v14 = 1024;
        int v15 = v10;
        _os_log_impl(&dword_22C0F9000, v11, OS_LOG_TYPE_ERROR, "%s: clearMetaBlocks() failed, status: %d\n", (uint8_t *)&v12, 0x12u);
      }
    }
    return 5;
  }
  return result;
}

uint64_t ZeroFill_Init()
{
  if (gpvZeroBuf) {
    return 0;
  }
  gpvZeroBuf = (uint64_t)mmap(0, 0x100000uLL, 1, 4098, -1, 0);
  if (gpvZeroBuf != -1) {
    return 0;
  }
  gpvZeroBuf = 0;
  return *__error();
}

void ZeroFill_DeInit()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  if (gpvZeroBuf)
  {
    if (munmap((void *)gpvZeroBuf, 0x100000uLL))
    {
      time_t v0 = __error();
      if (gbIsLoggerInit)
      {
        int v1 = *v0;
        uint64_t v2 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          v3[0] = 67109120;
          v3[1] = v1;
          _os_log_impl(&dword_22C0F9000, v2, OS_LOG_TYPE_ERROR, "failed to unmap zero buffer: %d", (uint8_t *)v3, 8u);
        }
      }
    }
  }
  gpvZeroBuf = 0;
}

unint64_t ZeroFill_Fill(int __fd, uint64_t a2, unint64_t a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (!gpvZeroBuf) {
    return 22;
  }
  unint64_t v3 = a3;
  if (a3)
  {
    unint64_t v6 = 0;
    while (1)
    {
      size_t v7 = v3 - v6 >= 0x100000 ? 0x100000 : v3 - v6;
      if (pwrite(__fd, (const void *)gpvZeroBuf, v7, v6 + a2) != v7) {
        break;
      }
      v6 += v7;
      if (v6 >= v3) {
        return 0;
      }
    }
    unint64_t v3 = *__error();
    if (gbIsLoggerInit)
    {
      uint64_t v9 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        v10[0] = 67109120;
        v10[1] = v3;
        _os_log_impl(&dword_22C0F9000, v9, OS_LOG_TYPE_ERROR, "ZeroFill_Fill: Failed to write. Error [%d]\n", (uint8_t *)v10, 8u);
      }
    }
  }
  return v3;
}

uint64_t ZeroFill_FillClusterSuffixWithZeros(uint64_t a1, unint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (gbIsLoggerInit)
  {
    uint64_t v4 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel))
    {
      unsigned int v6 = 134217984;
      unint64_t v7 = a2;
      _os_log_impl(&dword_22C0F9000, v4, (os_log_type_t)gpeExfatToOsLevel, "ZeroFill_FillClusterSuffixWithZeros = %llu\n", (uint8_t *)&v6, 0xCu);
    }
  }
  unsigned int v6 = 0;
  RAWFILE_write(a1, a2, *(void *)(*(void *)(a1 + 216) + 56)- 1- (a2 + *(void *)(*(void *)(a1 + 216) + 56) - 1) % *(void *)(*(void *)(a1 + 216) + 56), (char *)gpvZeroBuf, (int *)&v6);
  return v6;
}

uint64_t MultiReadSingleWrite_Init(pthread_rwlock_t *a1)
{
  return pthread_rwlock_init(a1, 0);
}

BOOL MultiReadSingleWrite_TryLockWrite(pthread_rwlock_t *a1)
{
  return pthread_rwlock_trywrlock(a1) == 0;
}

uint64_t FILEOPS_GetFileAllocatedSize(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 216) + 56) * *(unsigned int *)(a1 + 436);
}

uint64_t FILEOPS_GetFileDataSize(uint64_t a1)
{
  return *(void *)(a1 + 304);
}

uint64_t FILEOPS_GetFileValidDataSize(uint64_t a1)
{
  return *(void *)(a1 + 288);
}

uint64_t FILEOPS_GetAtrrFromDirEntry(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  *(void *)(a2 + 176) = 0;
  *(_OWORD *)(a2 + 144) = 0u;
  *(_OWORD *)(a2 + 160) = 0u;
  *(_OWORD *)(a2 + 112) = 0u;
  *(_OWORD *)(a2 + 128) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  int v4 = *(_DWORD *)(result + 208);
  if (*(unsigned char *)(result + 424))
  {
    if (v4 != 1)
    {
      *(_DWORD *)(a2 + 28) = 448;
      if (v4 == 4) {
        uint64_t v5 = *(unsigned int *)(result + 504);
      }
      else {
        uint64_t v5 = *(void *)(result + 304);
      }
      *(void *)(a2 + 48) = v5;
      unsigned int v6 = *(unsigned __int16 *)(result + 252);
      unsigned int v7 = v6 >> 1;
      if ((v6 & 0x11) == 1) {
        int v8 = (((v6 & 0x30) == 0) << 16) | 2;
      }
      else {
        int v8 = ((v6 & 0x30) == 0) << 16;
      }
      *(_DWORD *)(a2 + 44) = v8 & 0xFFFF7FFF | ((v7 & 1) << 15);
      exfat_timestamp_to_unix(*(unsigned int *)(result + 264), 0, *(unsigned __int8 *)(result + 272), (void *)(a2 + 80));
      exfat_timestamp_to_unix(*(unsigned int *)(v3 + 260), *(unsigned __int8 *)(v3 + 269), *(unsigned __int8 *)(v3 + 271), (void *)(a2 + 96));
      uint64_t result = exfat_timestamp_to_unix(*(unsigned int *)(v3 + 260), *(unsigned __int8 *)(v3 + 269), *(unsigned __int8 *)(v3 + 271), (void *)(a2 + 112));
      if (*(unsigned char *)(v3 + 480))
      {
        unint64_t v9 = *(unsigned int *)(v3 + 484) / 0xF4240uLL;
        *(void *)(a2 + 128) = *(void *)(v3 + 488);
        *(void *)(a2 + 136) = v9;
      }
      else
      {
        uint64_t result = exfat_timestamp_to_unix(*(unsigned int *)(v3 + 256), *(unsigned __int8 *)(v3 + 268), *(unsigned __int8 *)(v3 + 270), (void *)(a2 + 128));
      }
      goto LABEL_14;
    }
  }
  else if (v4 != 1)
  {
    return result;
  }
  *(void *)(a2 + 48) = *(void *)(*(void *)(result + 216) + 56) * *(unsigned int *)(result + 436);
  *(_DWORD *)(a2 + 28) = 448;
LABEL_14:
  *(_DWORD *)(a2 + 24) = puRecordId2FaType[*(unsigned int *)(v3 + 208)];
  *(_DWORD *)(a2 + 32) = 1;
  uint64_t v10 = *(void *)(v3 + 216);
  *(void *)(a2 + 56) = *(void *)(v10 + 56) * *(unsigned int *)(v3 + 436);
  *(void *)(a2 + 8) = 81895;
  unint64_t add = *(unsigned int *)(v3 + 428);
  if (!add)
  {
    int v12 = (atomic_ullong *)(v10 + 2016);
    unint64_t add = atomic_fetch_add(v12, 0xFFFFFFFFFFFFFFFFLL);
    if (add == 0xFFFFFFFF00000000)
    {
      atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)v12);
      unint64_t add = 0xFFFFFFFF00000000;
    }
  }
  *(void *)(a2 + 64) = add;
  unint64_t v13 = *(unsigned int *)(v3 + 440);
  if (!v13)
  {
    __int16 v14 = (atomic_ullong *)(*(void *)(v3 + 216) + 2016);
    unint64_t v13 = atomic_fetch_add(v14, 0xFFFFFFFFFFFFFFFFLL);
    if (v13 == 0xFFFFFFFF00000000)
    {
      atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)v14);
      unint64_t v13 = 0xFFFFFFFF00000000;
    }
  }
  *(void *)(a2 + 72) = v13;
  if (*(_DWORD *)(v3 + 208) == 3 && *(unsigned char *)(*(void *)(v3 + 216) + 2640))
  {
    *(_DWORD *)(a2 + 176) = 1;
    if (*(void *)(v3 + 288) >= *(void *)(v3 + 304)) {
      int v15 = 1;
    }
    else {
      int v15 = 3;
    }
    *(_DWORD *)(a2 + 176) = v15;
  }
  else
  {
    *(_DWORD *)(a2 + 176) = 0;
  }
  return result;
}

unint64_t FILEOPS_GetFileID(unint64_t result, uint64_t a2)
{
  if (!result)
  {
    uint64_t result = atomic_fetch_add((atomic_ullong *volatile)(a2 + 2016), 0xFFFFFFFFFFFFFFFFLL);
    if (result == 0xFFFFFFFF00000000)
    {
      atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)(a2 + 2016));
      return 0xFFFFFFFF00000000;
    }
  }
  return result;
}

uint64_t EXFAT_Read(uint64_t a1, unint64_t a2, unint64_t a3, char *a4, unint64_t *a5)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  unsigned int v22 = 0;
  if (gbIsLoggerInit)
  {
    uint64_t v10 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v24 = a2;
      __int16 v25 = 2048;
      unint64_t v26 = a3;
      _os_log_impl(&dword_22C0F9000, v10, (os_log_type_t)gpeExfatToOsLevel, "EXFAT_Read, offset %llu, length %zu\n", buf, 0x16u);
    }
  }
  if (!a1) {
    goto LABEL_15;
  }
  if (*(_DWORD *)a1 == -1061240642)
  {
    if (*(_DWORD *)(a1 + 560) != -1061240642) {
      goto LABEL_15;
    }
    MultiReadSingleWrite_LockRead((pthread_rwlock_t *)(a1 + 8));
    int v13 = *(_DWORD *)(a1 + 208);
    if ((v13 - 1) >= 2)
    {
      if (v13 == 3)
      {
        unint64_t v16 = *(void *)(a1 + 304);
        if (v16 <= a2)
        {
          if (gbIsLoggerInit)
          {
            uint64_t v21 = gpsExFatLog;
            if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel))
            {
              *(_DWORD *)buf = 134218240;
              unint64_t v24 = a2;
              __int16 v25 = 2048;
              unint64_t v26 = v16;
              _os_log_impl(&dword_22C0F9000, v21, (os_log_type_t)gpeExfatToOsLevel, "EXFAT_Read: Asked to read [offset - %llu] after file size [%llu] . Exiting\n", buf, 0x16u);
            }
          }
          *a5 = 0;
        }
        else
        {
          unint64_t v17 = *(void *)(a1 + 288);
          unint64_t v18 = v17 - a2;
          if (v17 - a2 >= a3) {
            unint64_t v18 = a3;
          }
          if (v17 <= a2) {
            unint64_t v19 = 0;
          }
          else {
            unint64_t v19 = v18;
          }
          if (a3 + a2 > v16) {
            a3 = v16 - a2;
          }
          unint64_t v20 = RAWFILE_read(a1, a2, v19, a4, (int *)&v22);
          *a5 = v20;
          if (!v22 && v20 < a3)
          {
            bzero(&a4[v19], a3 - v19);
            *a5 += a3 - v19;
          }
        }
        goto LABEL_34;
      }
      unsigned int v14 = 22;
    }
    else
    {
      unsigned int v14 = 21;
    }
    unsigned int v22 = v14;
LABEL_34:
    MultiReadSingleWrite_FreeRead((pthread_rwlock_t *)(a1 + 8));
    return v22;
  }
  if (*(_DWORD *)a1 == -559031622 && *(_DWORD *)(a1 + 560) == -559031622)
  {
    if (gbIsLoggerInit)
    {
      uint64_t v11 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C0F9000, v11, OS_LOG_TYPE_ERROR, "Got stale node", buf, 2u);
      }
    }
    return 70;
  }
LABEL_15:
  if (gbIsLoggerInit)
  {
    int v15 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C0F9000, v15, OS_LOG_TYPE_ERROR, "Got invalid node", buf, 2u);
    }
  }
  return 22;
}

uint64_t EXFAT_Write(uint64_t a1, unint64_t a2, unint64_t a3, char *a4, unint64_t *a5)
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  if (gbIsLoggerInit)
  {
    unint64_t v9 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = a2;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a3;
      _os_log_impl(&dword_22C0F9000, v9, (os_log_type_t)gpeExfatToOsLevel, "EXFAT_Write, offset %llu, length %zu\n", buf, 0x16u);
    }
  }
  if (!a1) {
    goto LABEL_18;
  }
  if (*(_DWORD *)a1 != -1061240642)
  {
    if (*(_DWORD *)a1 == -559031622 && *(_DWORD *)(a1 + 560) == -559031622)
    {
      if (gbIsLoggerInit)
      {
        uint64_t v10 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22C0F9000, v10, OS_LOG_TYPE_ERROR, "Got stale node", buf, 2u);
        }
      }
      return 70;
    }
    goto LABEL_18;
  }
  if (*(_DWORD *)(a1 + 560) != -1061240642)
  {
LABEL_18:
    if (!gbIsLoggerInit) {
      return 22;
    }
    uint64_t v16 = gpsExFatLog;
    if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
      return 22;
    }
    *(_WORD *)buf = 0;
    unint64_t v17 = "Got invalid node";
    unint64_t v18 = buf;
    unint64_t v19 = v16;
    os_log_type_t v20 = OS_LOG_TYPE_ERROR;
    uint32_t v21 = 2;
LABEL_21:
    _os_log_impl(&dword_22C0F9000, v19, v20, v17, v18, v21);
    return 22;
  }
  uint64_t v12 = *(void *)(a1 + 216);
  unint64_t v13 = *(void *)(v12 + 56);
  unsigned int v64 = 0;
  uint64_t v81 = 0;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v72 = 0u;
  memset(buf, 0, sizeof(buf));
  uint64_t v63 = 0;
  int v14 = *(_DWORD *)(a1 + 208);
  memset(v62, 0, sizeof(v62));
  if ((v14 - 1) >= 2)
  {
    if (v14 != 3)
    {
      if (!gbIsLoggerInit) {
        return 22;
      }
      uint64_t v31 = gpsExFatLog;
      if (!os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel)) {
        return 22;
      }
      LODWORD(v69[0]) = 136315394;
      *(void *)((char *)v69 + 4) = "EXFAT_Write";
      WORD6(v69[0]) = 1024;
      *(_DWORD *)((char *)v69 + 14) = v14;
      unint64_t v17 = "%s: Given node is not a file. Record ID [%d]\n";
      unint64_t v18 = (uint8_t *)v69;
      unint64_t v19 = v31;
      os_log_type_t v20 = gpeExfatToOsLevel;
      uint32_t v21 = 18;
      goto LABEL_21;
    }
    if (!a3)
    {
      uint64_t result = 0;
      *a5 = 0;
      return result;
    }
    unint64_t v54 = v13;
    uint64_t v57 = v12;
    FSOPS_SetDirtyBitAndAcquireLck(v12);
    v56 = (pthread_rwlock_t *)(a1 + 8);
    MultiReadSingleWrite_LockWrite((pthread_rwlock_t *)(a1 + 8));
    unint64_t v22 = *(void *)(*(void *)(a1 + 216) + 56) * *(unsigned int *)(a1 + 436);
    unint64_t v23 = *(void *)(a1 + 304);
    unint64_t v24 = *(void *)(a1 + 288);
    unint64_t v25 = a3 + a2;
    BOOL v55 = a3 + a2 > v22;
    if (a3 + a2 > v22)
    {
      uint64_t v81 = 0;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      long long v74 = 0u;
      *(_OWORD *)&uint8_t buf[16] = 0u;
      long long v72 = 0u;
      *(void *)buf = 0;
      *(void *)&uint8_t buf[8] = 64;
      long long v73 = v25;
      unsigned int v26 = FileOPS_SetAttrToDirEntry(a1, (uint64_t)buf, (uint64_t)v62, 1, 0, 0, 0, 0);
      unsigned int v64 = v26;
      if (v26)
      {
        if (!gbIsLoggerInit) {
          goto LABEL_77;
        }
        uint64_t v27 = gpsExFatLog;
        os_log_type_t v28 = gpeExfatToOsLevel;
        unsigned int v29 = v26;
        if (!os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel)) {
          goto LABEL_77;
        }
        LODWORD(v69[0]) = 136315394;
        *(void *)((char *)v69 + 4) = "EXFAT_Write";
        WORD6(v69[0]) = 1024;
        *(_DWORD *)((char *)v69 + 14) = v29;
        int v30 = "%s: Failed to allocate enough clusters for wanted length. Error [%d]\n";
LABEL_76:
        _os_log_impl(&dword_22C0F9000, v27, v28, v30, (uint8_t *)v69, 0x12u);
LABEL_77:
        MultiReadSingleWrite_FreeWrite(v56);
        FSOPS_FlushCacheAndFreeLck(v57);
        return v64;
      }
      unint64_t v32 = *(void *)(*(void *)(a1 + 216) + 56) * *(unsigned int *)(a1 + 436);
      if (v32 == v22 || (unint64_t v33 = v32 - a2, v32 <= a2))
      {
        unsigned int v64 = 28;
        if (!gbIsLoggerInit) {
          goto LABEL_77;
        }
        uint64_t v27 = gpsExFatLog;
        os_log_type_t v28 = gpeExfatToOsLevel;
        if (!os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel)) {
          goto LABEL_77;
        }
        LODWORD(v69[0]) = 136315394;
        *(void *)((char *)v69 + 4) = "EXFAT_Write";
        WORD6(v69[0]) = 1024;
        *(_DWORD *)((char *)v69 + 14) = 28;
        int v30 = "%s: Failed to allocate enough clusters for wanted length [2]. Error [%d]\n";
        goto LABEL_76;
      }
      if (v32 < v25)
      {
        if (gbIsLoggerInit)
        {
          uint32_t v34 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel))
          {
            LODWORD(v69[0]) = 136315650;
            *(void *)((char *)v69 + 4) = "EXFAT_Write";
            WORD6(v69[0]) = 2048;
            *(void *)((char *)v69 + 14) = a3;
            WORD3(v69[1]) = 2048;
            *((void *)&v69[1] + 1) = a3;
            _os_log_impl(&dword_22C0F9000, v34, (os_log_type_t)gpeExfatToOsLevel, "%s: not enough clusters for wanted length, bytes to write %llu out of %lu. Error\n", (uint8_t *)v69, 0x20u);
          }
        }
        a3 = v33;
      }
    }
    if (*(void *)(a1 + 520) <= v24) {
      unint64_t v35 = v24;
    }
    else {
      unint64_t v35 = *(void *)(a1 + 520);
    }
    if (v35 < a2 && (unsigned int v36 = FileOPS_FillFileSuffixWithZeros(a1, v35, a2), (v64 = v36) != 0))
    {
      unint64_t v53 = v23;
      unint64_t v37 = v24;
      unint64_t v38 = v24;
      if (!gbIsLoggerInit) {
        goto LABEL_60;
      }
      unsigned int v39 = v36;
      uint64_t v40 = gpsExFatLog;
      BOOL v41 = os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR);
      unint64_t v37 = v24;
      unint64_t v38 = v24;
      if (!v41) {
        goto LABEL_60;
      }
      LODWORD(v69[0]) = 136315394;
      *(void *)((char *)v69 + 4) = "EXFAT_Write";
      WORD6(v69[0]) = 1024;
      *(_DWORD *)((char *)v69 + 14) = v39;
      _os_log_impl(&dword_22C0F9000, v40, OS_LOG_TYPE_ERROR, "%s: Failed to fill file with zeroes (%d)\n", (uint8_t *)v69, 0x12u);
      unint64_t v37 = v24;
    }
    else
    {
      unint64_t v42 = a3 + a2;
      if (a3 + a2 > v23) {
        *(void *)(a1 + 304) = v42;
      }
      if (*(void *)(a1 + 520) < v42) {
        *(void *)(a1 + 520) = v42;
      }
      atomic_fetch_add((atomic_ullong *volatile)(a1 + 512), 1uLL);
      *a5 = RAWFILE_write(a1, a2, a3, a4, (int *)&v64);
      atomic_fetch_add((atomic_ullong *volatile)(a1 + 512), 0xFFFFFFFFFFFFFFFFLL);
      unsigned int v43 = v64;
      if (!v64 && *a5)
      {
        unint64_t v38 = *(void *)(a1 + 288);
        unint64_t v49 = *a5 + a2;
        if (v49 > v38)
        {
          *(void *)(a1 + 288) = v49;
          BOOL v55 = 1;
        }
        if (*(unsigned char *)(a1 + 564)) {
          goto LABEL_71;
        }
        __tp.tv_sec = 0;
        __tp.tv_nsec = 0;
        CONV_GetCurrentTime(&__tp);
        uint64_t v60 = 0;
        memset(v59, 0, sizeof(v59));
        *(void *)&v69[0] = 0;
        memset(&v69[1], 0, 80);
        memset(&v69[7], 0, 64);
        uint64_t v70 = 0;
        *((void *)&v69[0] + 1) = 2048;
        v69[6] = __tp;
        unsigned int v50 = FileOPS_SetAttrToDirEntry(a1, (uint64_t)v69, (uint64_t)v59, 0, v55, 1, 1, 0);
        unsigned int v64 = v50;
        if (!v50)
        {
LABEL_71:
          if (*(unsigned char *)(a1 + 504) && (v54 + *(void *)(a1 + 304) - 1) / v54 == *(_DWORD *)(a1 + 436))
          {
            *(unsigned char *)(a1 + 504) = 0;
            atomic_fetch_add((atomic_ullong *volatile)(v57 + 2264), 0xFFFFFFFFFFFFFFFFLL);
          }
          goto LABEL_77;
        }
        unint64_t v53 = v23;
        if (gbIsLoggerInit)
        {
          unsigned int v51 = v50;
          v52 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel))
          {
            *(_DWORD *)v65 = 136315394;
            v66 = "EXFAT_Write";
            __int16 v67 = 1024;
            unsigned int v68 = v51;
            _os_log_impl(&dword_22C0F9000, v52, (os_log_type_t)gpeExfatToOsLevel, "%s: Failed to update Dir Entry with new modification time. Error [%d]\n", v65, 0x12u);
          }
        }
        unint64_t v37 = v24;
        goto LABEL_60;
      }
      unint64_t v53 = v23;
      if (gbIsLoggerInit)
      {
        __int16 v44 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          unint64_t v45 = *a5;
          LODWORD(v69[0]) = 136315906;
          *(void *)((char *)v69 + 4) = "EXFAT_Write";
          WORD6(v69[0]) = 1024;
          *(_DWORD *)((char *)v69 + 14) = v43;
          WORD1(v69[1]) = 2048;
          *(void *)((char *)&v69[1] + 4) = v45;
          WORD6(v69[1]) = 2048;
          *(void *)((char *)&v69[1] + 14) = a3;
          _os_log_impl(&dword_22C0F9000, v44, OS_LOG_TYPE_ERROR, "%s: Failed in writing to device. Error [%d], written %lu bytes, wanted %llu\n bytes", (uint8_t *)v69, 0x26u);
          unsigned int v43 = v64;
        }
      }
      unint64_t v37 = v24;
      unint64_t v38 = v24;
      if (v43)
      {
LABEL_60:
        if (atomic_load((unint64_t *)(a1 + 512))) {
          goto LABEL_77;
        }
        if (v38 != v37) {
          goto LABEL_77;
        }
        uint64_t v81 = 0;
        long long v79 = 0u;
        long long v80 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        long long v74 = 0u;
        *(_OWORD *)&uint8_t buf[16] = 0u;
        long long v72 = 0u;
        *(void *)buf = 0;
        *(void *)&uint8_t buf[8] = 64;
        long long v73 = v53;
        *(void *)(a1 + 304) = v53;
        *(void *)(a1 + 288) = v37;
        int v47 = FileOPS_SetAttrToDirEntry(a1, (uint64_t)buf, (uint64_t)v62, 1, 0, 1, 1, 0);
        if (!v47) {
          goto LABEL_77;
        }
        if (!gbIsLoggerInit) {
          goto LABEL_77;
        }
        int v48 = v47;
        uint64_t v27 = gpsExFatLog;
        os_log_type_t v28 = OS_LOG_TYPE_ERROR;
        if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
          goto LABEL_77;
        }
        LODWORD(v69[0]) = 136315394;
        *(void *)((char *)v69 + 4) = "EXFAT_Write";
        WORD6(v69[0]) = 1024;
        *(_DWORD *)((char *)v69 + 14) = v48;
        int v30 = "%s: Failed in updating original size. Error [%d]\n";
        goto LABEL_76;
      }
      unsigned int v64 = 5;
    }
    unint64_t v38 = v37;
    goto LABEL_60;
  }
  if (gbIsLoggerInit)
  {
    int v15 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel))
    {
      LODWORD(v69[0]) = 136315138;
      *(void *)((char *)v69 + 4) = "EXFAT_Write";
      _os_log_impl(&dword_22C0F9000, v15, (os_log_type_t)gpeExfatToOsLevel, "%s: Given node is a directory.\n", (uint8_t *)v69, 0xCu);
    }
  }
  return 21;
}

uint64_t FileOPS_SetAttrToDirEntry(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, char a6, int a7, int a8)
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  *(void *)(a3 + 176) = 0;
  *(_OWORD *)(a3 + 144) = 0u;
  *(_OWORD *)(a3 + 160) = 0u;
  *(_OWORD *)(a3 + 112) = 0u;
  *(_OWORD *)(a3 + 128) = 0u;
  *(_OWORD *)(a3 + 80) = 0u;
  *(_OWORD *)(a3 + 96) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)(a3 + 64) = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)a3 = 0u;
  unint64_t v8 = *(void *)(a2 + 8);
  if ((v8 & 0x1385) != 0) {
    return 22;
  }
  uint64_t v12 = *(void *)(a1 + 216);
  long long v76 = 0uLL;
  int v75 = 0;
  __int16 v74 = 0;
  if (!v8) {
    goto LABEL_99;
  }
  unsigned int v18 = *(_DWORD *)(a1 + 208);
  if (v18 == 1 && !*(unsigned char *)(a1 + 424)) {
    goto LABEL_99;
  }
  uint64_t v19 = a1 + 8;
  long long v20 = *(_OWORD *)(a1 + 264);
  long long v21 = *(_OWORD *)(a1 + 280);
  long long v72 = *(_OWORD *)(a1 + 248);
  long long v73 = v20;
  long long v22 = *(_OWORD *)(a1 + 296);
  long long v70 = v21;
  long long v71 = v22;
  if (v18 - 1 >= 2) {
    WORD2(v72) |= 0x20u;
  }
  if ((v8 & 0x40) == 0)
  {
LABEL_70:
    uint64_t v52 = *(void *)(a2 + 8);
    if ((v52 & 0x400) != 0)
    {
      long long v76 = *(_OWORD *)(a2 + 80);
      exfat_timestamp_from_unix(&v75, (unsigned char *)&v74 + 1, &v74, &v76);
      LODWORD(v73) = v75;
      BYTE8(v73) = v74;
      uint64_t v52 = *(void *)(a2 + 8);
      LOBYTE(v53) = 1;
      if ((v52 & 0x800) == 0) {
        goto LABEL_79;
      }
    }
    else
    {
      uint64_t v53 = (v8 >> 6) & 1;
      if ((v52 & 0x800) == 0) {
        goto LABEL_79;
      }
    }
    long long v76 = *(_OWORD *)(a2 + 96);
    exfat_timestamp_from_unix(&v75, (unsigned char *)&v74 + 1, &v74, &v76);
    int v54 = v75;
    if (HIDWORD(v72) != v75) {
      a5 = 1;
    }
    if ((a5 & 1) == 0) {
      *(unsigned char *)(a1 + 496) = 1;
    }
    HIDWORD(v72) = v54;
    BYTE5(v73) = HIBYTE(v74);
    BYTE7(v73) = v74;
    uint64_t v52 = *(void *)(a2 + 8);
    LOBYTE(v53) = 1;
LABEL_79:
    if ((v52 & 0x2000) != 0)
    {
      long long v76 = *(_OWORD *)(a2 + 128);
      exfat_timestamp_from_unix(&v75, (unsigned char *)&v74 + 1, &v74, &v76);
      DWORD2(v72) = v75;
      BYTE4(v73) = HIBYTE(v74);
      BYTE6(v73) = v74;
      *(void *)(a1 + 488) = v76;
      *(_DWORD *)(a1 + 484) = DWORD2(v76) / 0xF4240;
      LOBYTE(v53) = 1;
      *(unsigned char *)(a1 + 480) = 1;
      uint64_t v52 = *(void *)(a2 + 8);
      if ((v52 & 0x20) == 0)
      {
LABEL_81:
        if (!a5)
        {
LABEL_98:
          long long v58 = v73;
          *(_OWORD *)(a1 + 248) = v72;
          *(_OWORD *)(a1 + 264) = v58;
          long long v59 = v71;
          *(_OWORD *)(v19 + 272) = v70;
          *(_OWORD *)(v19 + 288) = v59;
          goto LABEL_99;
        }
        goto LABEL_93;
      }
    }
    else if ((v52 & 0x20) == 0)
    {
      goto LABEL_81;
    }
    unsigned int v55 = *(_DWORD *)(a2 + 44);
    if ((v55 & 0xFFFC7FFD) != 0)
    {
      if (gbIsLoggerInit)
      {
        v56 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v78) = v55;
          _os_log_impl(&dword_22C0F9000, v56, OS_LOG_TYPE_ERROR, "FILEOPS_SetFileBSDFlags: Recieved invalid BSD Flag to set [0x%x]\n", buf, 8u);
        }
      }
      return 22;
    }
    LODWORD(v53) = WORD2(v72) & 0xFFFD | (2 * ((v55 >> 15) & 1));
    if ((*(_DWORD *)(a1 + 208) - 1) >= 2)
    {
      if ((v55 & 0x10000) != 0) {
        LOWORD(v53) = WORD2(v72) & 0xFFDC | (2 * ((v55 & 0x8000) != 0)) & 0xDF | ((v55 & 0x20002) != 0);
      }
      else {
        LOWORD(v53) = WORD2(v72) & 0xFFFC | (2 * ((v55 >> 15) & 1)) | ((v55 & 0x20002) != 0) | 0x20;
      }
    }
    WORD2(v72) = v53;
    LOBYTE(v53) = 1;
    if (!a5) {
      goto LABEL_98;
    }
LABEL_93:
    char v57 = v53 ^ 1;
    if (*(_DWORD *)(a1 + 208) == 1) {
      char v57 = 1;
    }
    if (v57) {
      goto LABEL_98;
    }
    uint64_t updated = DIROPS_UpdateDirectoryEntries(a1, (uint64_t)&v72, &v70, (v52 & 0x840) == 64, 0);
    if (updated) {
      return updated;
    }
    *(unsigned char *)(a1 + 496) = 0;
LABEL_99:
    FILEOPS_GetAtrrFromDirEntry(a1, a3);
    return 0;
  }
  if (v18 > 4 || (uint64_t updated = 1, ((1 << v18) & 0x16) == 0))
  {
    unint64_t v23 = *(void *)(v12 + 56);
    unint64_t v24 = v23 * *(unsigned int *)(a1 + 436);
    unint64_t v25 = *((void *)&v71 + 1);
    if (!a7) {
      goto LABEL_17;
    }
    unint64_t v26 = *(void *)(a2 + 48);
    if (v26 <= *((void *)&v71 + 1)) {
      goto LABEL_17;
    }
    uint64_t v27 = v26 >= v24 ? v23 * *(unsigned int *)(a1 + 436) : *(void *)(a2 + 48);
    unint64_t v63 = *(void *)(v12 + 56);
    uint64_t v65 = v12;
    uint64_t v28 = FileOPS_FillFileSuffixWithZeros(a1, *((unint64_t *)&v71 + 1), v27);
    unint64_t v25 = *((void *)&v71 + 1);
    uint64_t updated = v28;
    unint64_t v23 = v63;
    uint64_t v12 = v65;
    if (!updated)
    {
LABEL_17:
      unint64_t v29 = *(void *)(a2 + 48);
      unint64_t v30 = v24 - v29;
      if (v24 >= v29)
      {
        uint64_t v19 = a1 + 8;
        if (v29 >= v25)
        {
LABEL_58:
          uint64_t v48 = *(unsigned int *)(a1 + 436);
          unint64_t v49 = v23 * v48;
          unint64_t v50 = *(void *)(a2 + 48);
          if (v23 * v48 >= v50) {
            unint64_t v49 = *(void *)(a2 + 48);
          }
          *((void *)&v71 + 1) = v49;
          if (*((void *)&v70 + 1) > v49 || a8 != 0) {
            *((void *)&v70 + 1) = v49;
          }
          if (v50 < *(void *)(a1 + 520)) {
            *(void *)(a1 + 520) = v50;
          }
          if (*(unsigned char *)(a1 + 504) && (v23 + v49 - 1) / v23 == v48)
          {
            *(unsigned char *)(a1 + 504) = 0;
            atomic_fetch_add((atomic_ullong *volatile)(v12 + 2264), 0xFFFFFFFFFFFFFFFFLL);
          }
          goto LABEL_70;
        }
        uint64_t v34 = v12;
        if ((v30 / v23))
        {
          unint64_t v35 = v23;
          uint64_t Clusters = FAT_Access_M_TruncateLastClusters(a1, v30 / v23, (unsigned char *)(a1 + 444));
          if (Clusters)
          {
            uint64_t updated = Clusters;
            if (gbIsLoggerInit)
            {
              unint64_t v37 = gpsExFatLog;
              if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109120;
                LODWORD(v78) = updated;
                _os_log_impl(&dword_22C0F9000, v37, OS_LOG_TYPE_ERROR, "FileOPS_SetAttrToDirEntry: failed to evict clusters [%d]", buf, 8u);
              }
            }
            if ((FSOPS_CheckIfVolumeIsDirty(v34) & 1) == 0)
            {
              if (gbIsLoggerInit)
              {
                unint64_t v38 = gpsExFatLog;
                if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_22C0F9000, v38, OS_LOG_TYPE_FAULT, "FileOPS_SetAttrToDirEntry: expected the volume to be dirty", buf, 2u);
                }
              }
              FSOPS_SetDirtyBitAndAcquireLck(v34);
              MultiReadSingleWrite_FreeRead((pthread_rwlock_t *)(v34 + 2064));
            }
            return updated;
          }
          unint64_t v23 = v35;
          if (!*(_DWORD *)(a1 + 428)) {
            DWORD1(v71) = 0;
          }
        }
        unint64_t v47 = v23;
        FILERECORD_EvictAllFileChainCacheEntriesFromGivenOffset(a1, (*(void *)(a2 + 48) + v23 - 1) / v23 * v23, 1);
        unint64_t v23 = v47;
        uint64_t v12 = v34;
        goto LABEL_58;
      }
      uint64_t v69 = 0;
      unsigned int v68 = 0;
      unint64_t v31 = (v23 + v29 + ~v24) / v23;
      if (!v31)
      {
LABEL_54:
        uint64_t v19 = a1 + 8;
        goto LABEL_58;
      }
      unsigned int v32 = *(_DWORD *)(a1 + 432);
      unint64_t v33 = (unsigned __int8 *)(a1 + 444);
      unint64_t v64 = v23;
      if (v32)
      {
        int v62 = *v33;
      }
      else
      {
        int v62 = 1;
        unsigned __int8 *v33 = 1;
        BYTE1(v70) |= 2u;
      }
      __int16 v67 = 0;
      uint64_t v66 = v12;
      uint64_t v39 = FAT_Access_M_AllocateClusters(v12, v31, v32, v33, (_DWORD *)&v69 + 1, (unsigned int *)&v69, (int *)&v68, a4, a6, *(_DWORD *)(a1 + 428), &v67, 0);
      unsigned int v40 = v31;
      uint64_t updated = v39;
      unsigned int v41 = v68;
      unsigned int v61 = v40;
      if (v68 >= v40)
      {
        if (v39) {
          return updated;
        }
        goto LABEL_46;
      }
      if (a4)
      {
        if (v39 == 28 && v68 != 0)
        {
LABEL_46:
          if (v62 && !*(unsigned char *)(a1 + 444)) {
            BYTE1(v70) &= ~2u;
          }
          pthread_mutex_lock((pthread_mutex_t *)(*(void *)(v66 + 2008) + 8));
          if (!*(_DWORD *)(a1 + 428))
          {
            int v44 = HIDWORD(v69);
            *(_DWORD *)(a1 + 428) = HIDWORD(v69);
            DWORD1(v71) = v44;
          }
          *(_DWORD *)(a1 + 436) += v68;
          *(_DWORD *)(a1 + 432) = v69;
          for (i = (int *)v67; v67; i = (int *)v67)
          {
            FILERECORD_UpdateNewAllocatedClustersInChain((void *)a1, *i, i[1], v24);
            uint64_t v46 = v67;
            v24 += *(void *)(v66 + 56) * *((unsigned int *)v67 + 1);
            __int16 v67 = (void *)*((void *)v67 + 1);
            free(v46);
          }
          pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(v66 + 2008) + 8));
          uint64_t v12 = v66;
          unint64_t v23 = v64;
          goto LABEL_54;
        }
      }
      if (!v39)
      {
        if (gbIsLoggerInit)
        {
          unsigned int v43 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315650;
            long long v78 = "FileOPS_SetAttrToDirEntry";
            __int16 v79 = 1024;
            unsigned int v80 = v61;
            __int16 v81 = 1024;
            unsigned int v82 = v41;
            _os_log_impl(&dword_22C0F9000, v43, OS_LOG_TYPE_FAULT, "%s: uNeedToAllocClusters %u, uAmountOfAllocatedClusters %u", buf, 0x18u);
          }
        }
        return 5;
      }
    }
  }
  return updated;
}

uint64_t FileOPS_FillFileSuffixWithZeros(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (gbIsLoggerInit)
  {
    unsigned int v6 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v21 = a2;
      __int16 v22 = 2048;
      uint64_t v23 = a3;
      _os_log_impl(&dword_22C0F9000, v6, (os_log_type_t)gpeExfatToOsLevel, "FileOPS_FillFileSuffixWithZeros = %llu --> %llu\n", buf, 0x16u);
    }
  }
  uint64_t v19 = 0;
  uint64_t v7 = *(void *)(a1 + 216);
  unint64_t v8 = *(void *)(v7 + 56);
  unsigned int v18 = 0;
  if (a2 % v8)
  {
    uint64_t v9 = ZeroFill_FillClusterSuffixWithZeros(a1, a2);
    HIDWORD(v19) = v9;
    if (v9) {
      return v9;
    }
    a2 = (a2 + v8 - 1) / v8 * v8;
  }
  unint64_t v10 = (a3 + v8 - 1 - a2 - (a3 + v8 - 1) % v8) / v8;
  if (!v10) {
    return 0;
  }
  while (1)
  {
    FILERECORD_GetChainFromCache(a1, a2, (unsigned int *)&v19, &v18, (int *)&v19 + 1);
    uint64_t v9 = HIDWORD(v19);
    if (HIDWORD(v19)) {
      break;
    }
    if (!v18) {
      return 0;
    }
    if (v10 >= v18) {
      uint64_t v11 = v18;
    }
    else {
      uint64_t v11 = v10;
    }
    int v12 = *(_DWORD *)v7;
    uint64_t v13 = DIROPS_VolumeOffsetForCluster(v7, v19);
    unint64_t v14 = ZeroFill_Fill(v12, v13, v8 * v11);
    HIDWORD(v19) = v14;
    if (v14)
    {
      uint64_t v9 = v14;
      if (gbIsLoggerInit)
      {
        uint64_t v16 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v21) = v9;
          unint64_t v17 = "FileOPS_FillFileSuffixWithZeros: Failed to zero fill. Error [%d]\n";
          goto LABEL_23;
        }
      }
      return v9;
    }
    a2 += v8 * v11;
    LODWORD(v10) = v10 - v11;
    if (!v10) {
      return 0;
    }
  }
  if (gbIsLoggerInit)
  {
    uint64_t v16 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v21) = v9;
      unint64_t v17 = "FileOPS_FillFileSuffixWithZeros: Failed to get chain from cache. Error [%d]\n";
LABEL_23:
      _os_log_impl(&dword_22C0F9000, v16, OS_LOG_TYPE_ERROR, v17, buf, 8u);
      return HIDWORD(v19);
    }
  }
  return v9;
}

uint64_t EXFAT_BeginBlockmap(uint64_t a1, unint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, uint64_t a7, int *a8)
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  if (!a1) {
    goto LABEL_23;
  }
  if (*(_DWORD *)a1 != -1061240642)
  {
    if (*(_DWORD *)a1 == -559031622 && *(_DWORD *)(a1 + 560) == -559031622)
    {
      if (gbIsLoggerInit)
      {
        uint64_t v9 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22C0F9000, v9, OS_LOG_TYPE_ERROR, "Got stale node", buf, 2u);
        }
      }
      return 70;
    }
    goto LABEL_23;
  }
  if (*(_DWORD *)(a1 + 560) != -1061240642)
  {
LABEL_23:
    if (!gbIsLoggerInit) {
      return 22;
    }
    uint64_t v26 = gpsExFatLog;
    if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
      return 22;
    }
    *(_WORD *)buf = 0;
    __int16 v22 = "Got invalid node";
    uint64_t v23 = buf;
    uint64_t v24 = v26;
    uint32_t v25 = 2;
LABEL_26:
    _os_log_impl(&dword_22C0F9000, v24, OS_LOG_TYPE_ERROR, v22, v23, v25);
    return 22;
  }
  uint64_t v54 = *(void *)(a1 + 216);
  uint64_t v78 = 0;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  *(_OWORD *)buf = 0u;
  uint64_t v66 = 0;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v55 = 0u;
  if (gbIsLoggerInit)
  {
    unsigned int v18 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel))
    {
      *(_DWORD *)__int16 v79 = 136316418;
      unsigned int v80 = "EXFAT_BeginBlockmap";
      __int16 v81 = 2048;
      unint64_t v82 = a2;
      __int16 v83 = 2048;
      uint64_t v84 = a3;
      __int16 v85 = 1024;
      int v86 = a4;
      __int16 v87 = 1024;
      int v88 = a5;
      __int16 v89 = 2048;
      uint64_t v90 = a6;
      _os_log_impl(&dword_22C0F9000, v18, (os_log_type_t)gpeExfatToOsLevel, "%s: offset: %llu, length: %lu, startIO: %d, flags: %u, operationID: %llu.\n", v79, 0x36u);
    }
  }
  int v19 = *(_DWORD *)(a1 + 208);
  if (v19 != 3)
  {
    if (!gbIsLoggerInit) {
      return 22;
    }
    uint64_t v28 = gpsExFatLog;
    if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
      return 22;
    }
    *(_DWORD *)__int16 v79 = 136315394;
    unsigned int v80 = "EXFAT_BeginBlockmap";
    __int16 v81 = 1024;
    LODWORD(v82) = v19;
    __int16 v22 = "%s: Given node is not a file. Record ID = [%d].\n";
    uint64_t v23 = v79;
    uint64_t v24 = v28;
    uint32_t v25 = 18;
    goto LABEL_26;
  }
  if ((a5 & 0x200) != 0)
  {
    if (a3)
    {
      FSOPS_SetDirtyBitAndAcquireLck(v54);
      goto LABEL_35;
    }
  }
  else
  {
    if (a6) {
      int v20 = 1;
    }
    else {
      int v20 = a4;
    }
    if ((a5 & 0x100) == 0 && v20)
    {
      if (!gbIsLoggerInit) {
        return 22;
      }
      uint64_t v21 = gpsExFatLog;
      if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
        return 22;
      }
      *(_DWORD *)__int16 v79 = 136315138;
      unsigned int v80 = "EXFAT_BeginBlockmap";
      __int16 v22 = "%s: ERROR: Neither of FSKIT_FLAGS_WRITE or FSKIT_FLAGS_READ bits are set in flags.\n";
      uint64_t v23 = v79;
      uint64_t v24 = v21;
      uint32_t v25 = 12;
      goto LABEL_26;
    }
    if (a3)
    {
LABEL_35:
      uint64_t v53 = (pthread_rwlock_t *)(a1 + 8);
      MultiReadSingleWrite_LockWrite((pthread_rwlock_t *)(a1 + 8));
      uint64_t v29 = *(unsigned int *)(a1 + 436);
      uint64_t v30 = *(void *)(a1 + 216);
      unint64_t v31 = *(void *)(v30 + 56) * v29;
      unint64_t v32 = *(void *)(a1 + 304);
      if ((a5 & 0x200) == 0 && v31 <= a2)
      {
        if (gbIsLoggerInit)
        {
          unint64_t v33 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int16 v79 = 136315138;
            unsigned int v80 = "EXFAT_BeginBlockmap";
            _os_log_impl(&dword_22C0F9000, v33, OS_LOG_TYPE_ERROR, "%s: Read with requested offset >= file allocated size. Exiting.", v79, 0xCu);
          }
        }
        *a8 = 0;
        uint64_t FileExtents = 22;
        uint64_t v34 = (pthread_rwlock_t *)(a1 + 8);
        goto LABEL_62;
      }
      if ((a5 & 0x200) == 0)
      {
        uint64_t v51 = *(void *)(a1 + 288);
        uint64_t v52 = *(void *)(a1 + 304);
LABEL_47:
        uint64_t FileExtents = FILEOPS_FetchFileExtents(a1, a2, *(void *)(v30 + 56) * v29, a7, a8);
        if (FileExtents) {
          goto LABEL_48;
        }
        if ((a5 & 0x200) == 0 || !a4) {
          goto LABEL_53;
        }
        uint64_t FileExtents = FILEOPS_CreateBlockmapRequestEntry(a1, a6, v52, v51);
        if (FileExtents)
        {
          if (!gbIsLoggerInit) {
            goto LABEL_48;
          }
          int v44 = gpsExFatLog;
          if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
            goto LABEL_48;
          }
          *(_DWORD *)__int16 v79 = 136315394;
          unsigned int v80 = "EXFAT_BeginBlockmap";
          __int16 v81 = 1024;
          LODWORD(v82) = FileExtents;
          unint64_t v45 = "%s: FILEOPS_CreateBlockmapRequestEntry returned error = %d\n.";
          goto LABEL_85;
        }
        atomic_fetch_add((atomic_ullong *volatile)(a1 + 512), 1uLL);
        goto LABEL_60;
      }
      if (v31 >= v32)
      {
        unint64_t v41 = a3 + a2;
        uint64_t v51 = *(void *)(a1 + 288);
        uint64_t v52 = *(void *)(a1 + 304);
        if (a3 + a2 <= v31)
        {
          if (v41 > v32) {
            *(void *)(a1 + 304) = v41;
          }
          goto LABEL_47;
        }
        uint64_t v78 = 0;
        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        long long v71 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        *(void *)buf = 0;
        *(void *)&uint8_t buf[8] = 64;
        long long v70 = v41;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        uint64_t v66 = 0;
        uint64_t v42 = FileOPS_SetAttrToDirEntry(a1, (uint64_t)buf, (uint64_t)&v55, 1, 0, 0, 0, 0);
        if (!v42)
        {
          uint64_t v29 = *(unsigned int *)(a1 + 436);
          uint64_t v30 = *(void *)(a1 + 216);
          unint64_t v46 = *(void *)(v30 + 56) * v29;
          if (v46 <= a2)
          {
            if (!gbIsLoggerInit)
            {
              uint64_t FileExtents = 28;
LABEL_48:
              uint64_t v78 = 0;
              long long v76 = 0u;
              long long v77 = 0u;
              long long v74 = 0u;
              long long v75 = 0u;
              long long v72 = 0u;
              long long v73 = 0u;
              long long v71 = 0u;
              long long v68 = 0u;
              long long v69 = 0u;
              *(void *)buf = 0;
              *(void *)&uint8_t buf[8] = 64;
              long long v70 = (unint64_t)v52;
              long long v55 = 0u;
              long long v56 = 0u;
              long long v57 = 0u;
              long long v58 = 0u;
              long long v59 = 0u;
              long long v60 = 0u;
              long long v61 = 0u;
              long long v62 = 0u;
              long long v63 = 0u;
              long long v64 = 0u;
              long long v65 = 0u;
              uint64_t v66 = 0;
              int v36 = FileOPS_SetAttrToDirEntry(a1, (uint64_t)buf, (uint64_t)&v55, 1, 0, 1, 1, 1);
              if (v36)
              {
                if (gbIsLoggerInit)
                {
                  int v37 = v36;
                  unint64_t v38 = gpsExFatLog;
                  if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)__int16 v79 = 136315394;
                    unsigned int v80 = "EXFAT_BeginBlockmap";
                    __int16 v81 = 1024;
                    LODWORD(v82) = v37;
                    _os_log_impl(&dword_22C0F9000, v38, OS_LOG_TYPE_ERROR, "%s: Failed in updating original size. Error [%d]\n", v79, 0x12u);
                  }
                }
              }
              *a8 = 0;
LABEL_53:
              uint64_t v34 = (pthread_rwlock_t *)(a1 + 8);
              if ((a5 & 0x200) == 0) {
                goto LABEL_62;
              }
              goto LABEL_61;
            }
            int v44 = gpsExFatLog;
            uint64_t FileExtents = 28;
            if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
              goto LABEL_48;
            }
            *(_DWORD *)__int16 v79 = 136315394;
            unsigned int v80 = "EXFAT_BeginBlockmap";
            __int16 v81 = 1024;
            LODWORD(v82) = 28;
            unint64_t v45 = "%s: Failed to allocate enough clusters for wanted offset and length. Error [%d].\n";
LABEL_85:
            _os_log_impl(&dword_22C0F9000, v44, OS_LOG_TYPE_ERROR, v45, v79, 0x12u);
            goto LABEL_48;
          }
          if (v46 < a3 + a2)
          {
            unint64_t v49 = v46 - a2;
            uint64_t v50 = *(unsigned int *)(a1 + 436);
            if (gbIsLoggerInit)
            {
              unint64_t v47 = gpsExFatLog;
              BOOL v48 = os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel);
              uint64_t v29 = v50;
              if (v48)
              {
                *(_DWORD *)__int16 v79 = 136315650;
                unsigned int v80 = "EXFAT_BeginBlockmap";
                __int16 v81 = 2048;
                unint64_t v82 = v49;
                __int16 v83 = 2048;
                uint64_t v84 = a3;
                _os_log_impl(&dword_22C0F9000, v47, (os_log_type_t)gpeExfatToOsLevel, "%s: Couldn't allocate all clusters for wanted offset and length. Length to write = %llu (instead of %lu).\n", v79, 0x20u);
                uint64_t v29 = *(unsigned int *)(a1 + 436);
                uint64_t v30 = *(void *)(a1 + 216);
              }
            }
          }
          goto LABEL_47;
        }
        uint64_t FileExtents = v42;
        if (gbIsLoggerInit)
        {
          unsigned int v43 = gpsExFatLog;
          uint64_t v34 = (pthread_rwlock_t *)(a1 + 8);
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int16 v79 = 136315394;
            unsigned int v80 = "EXFAT_BeginBlockmap";
            __int16 v81 = 1024;
            LODWORD(v82) = FileExtents;
            _os_log_impl(&dword_22C0F9000, v43, OS_LOG_TYPE_ERROR, "%s: FileOPS_SetAttrToDirEntry returned error = [%d].\n", v79, 0x12u);
          }
          goto LABEL_61;
        }
      }
      else
      {
        uint64_t v39 = *(void *)(a1 + 304);
        if (gbIsLoggerInit)
        {
          unsigned int v40 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int16 v79 = 136315650;
            unsigned int v80 = "EXFAT_BeginBlockmap";
            __int16 v81 = 2048;
            unint64_t v82 = v31;
            __int16 v83 = 2048;
            uint64_t v84 = v39;
            _os_log_impl(&dword_22C0F9000, v40, OS_LOG_TYPE_ERROR, "%s: allocated size (%llu) < file size (%llu). The file is probably corrupted. Exiting.", v79, 0x20u);
          }
        }
        *a8 = 0;
        uint64_t FileExtents = 5;
      }
LABEL_60:
      uint64_t v34 = v53;
LABEL_61:
      FSOPS_FlushCacheAndFreeLck(v54);
LABEL_62:
      MultiReadSingleWrite_FreeWrite(v34);
      return FileExtents;
    }
  }
  if (gbIsLoggerInit)
  {
    unint64_t v35 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v79 = 136315138;
      unsigned int v80 = "EXFAT_BeginBlockmap";
      _os_log_impl(&dword_22C0F9000, v35, OS_LOG_TYPE_DEFAULT, "%s: Requested length = 0. Exit with SUCCESS and extentCount = 0.", v79, 0xCu);
    }
  }
  uint64_t FileExtents = 0;
  *a8 = 0;
  return FileExtents;
}

uint64_t FILEOPS_FetchFileExtents(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, int *a5)
{
  LODWORD(v5) = 0;
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v6 = *(void *)(a1 + 216);
  int v7 = *a5;
  unint64_t v9 = *(void *)(v6 + 48);
  unint64_t v8 = *(void *)(v6 + 56);
  unsigned int v25 = 0;
  if (v7 >= 1 && a2 < a3)
  {
    unint64_t v13 = a2;
    uint64_t v5 = 0;
    int v15 = (unint64_t *)(a4 + 8);
    while (1)
    {
      int v23 = 0;
      unsigned int v24 = 0;
      FILERECORD_GetChainFromCache(a1, v13, (unsigned int *)&v23, &v24, (int *)&v25);
      if (v25) {
        break;
      }
      if (!v24)
      {
        if (v5)
        {
          if (gbIsLoggerInit)
          {
            int v19 = gpsExFatLog;
            if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel))
            {
              *(_DWORD *)buf = 136315394;
              uint64_t v27 = "FILEOPS_FetchFileExtents";
              __int16 v28 = 2048;
              unint64_t v29 = v13;
              _os_log_impl(&dword_22C0F9000, v19, (os_log_type_t)gpeExfatToOsLevel, "%s: Can't fetch anymore extents, reached the end of the allocated space. offset in file = %llu.\n", buf, 0x16u);
            }
          }
        }
        else
        {
          unsigned int v25 = 5;
          if (gbIsLoggerInit)
          {
            uint64_t v21 = gpsExFatLog;
            if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              uint64_t v27 = "FILEOPS_FetchFileExtents";
              __int16 v28 = 2048;
              unint64_t v29 = v13;
              __int16 v30 = 1024;
              int v31 = 5;
              _os_log_impl(&dword_22C0F9000, v21, OS_LOG_TYPE_ERROR, "%s: Couldn't fetch any extents. offset in file = %llu. Returning error = %d.", buf, 0x1Cu);
            }
          }
          LODWORD(v5) = 0;
        }
        goto LABEL_6;
      }
      unint64_t v16 = v13 % v8 + DIROPS_VolumeOffsetForCluster(v6, v23);
      if (v16 < *(void *)(v6 + 64))
      {
        if (gbIsLoggerInit)
        {
          int v20 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            uint64_t v27 = "FILEOPS_FetchFileExtents";
            __int16 v28 = 2048;
            unint64_t v29 = v16;
            _os_log_impl(&dword_22C0F9000, v20, OS_LOG_TYPE_ERROR, "%s: file offset is within cluster offset zone = %llu.\n", buf, 0x16u);
          }
        }
        if (!v5) {
          unsigned int v25 = 14;
        }
        goto LABEL_6;
      }
      unint64_t v17 = v8 * v24 - v13 % v8;
      if (v17 >= 0x7FFFF000) {
        unint64_t v17 = 2147479552;
      }
      unint64_t v18 = (v17 + v9 - 1) / v9 * v9;
      ++v5;
      *((_DWORD *)v15 - 2) = *(_DWORD *)v6 & 0xFFFFFF | 0x1000000;
      *((_DWORD *)v15 - 1) = v18;
      *int v15 = v16;
      v15[1] = v13;
      if (v5 < *a5)
      {
        v13 += v18;
        v15 += 3;
        if (v13 < a3) {
          continue;
        }
      }
      goto LABEL_6;
    }
    if (v5) {
      unsigned int v25 = 0;
    }
  }
LABEL_6:
  *a5 = v5;
  return v25;
}

uint64_t FILEOPS_CreateBlockmapRequestEntry(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  unint64_t v8 = malloc_type_calloc(1uLL, 0x30uLL, 0x10A0040D74595A4uLL);
  if (v8)
  {
    *(unsigned char *)unint64_t v8 = 1;
    v8[1] = a2;
    v8[2] = a3;
    v8[3] = a4;
    unint64_t v9 = (void *)(a1 + 472);
    uint64_t v10 = *(void *)(a1 + 472);
    v8[4] = v10;
    if (v10) {
      *(void *)(v10 + 40) = v8 + 4;
    }
    uint64_t v11 = 0;
    *unint64_t v9 = v8;
    v8[5] = v9;
  }
  else if (gbIsLoggerInit {
         && (int v12 = gpsExFatLog, os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)))
  }
  {
    int v14 = 136315138;
    int v15 = "FILEOPS_CreateBlockmapRequestEntry";
    uint64_t v11 = 12;
    _os_log_impl(&dword_22C0F9000, v12, OS_LOG_TYPE_ERROR, "%s: failed to allocate memory\n", (uint8_t *)&v14, 0xCu);
  }
  else
  {
    return 12;
  }
  return v11;
}

uint64_t EXFAT_EndBlockmap(uint64_t a1, unint64_t a2, unint64_t a3, int a4, int a5, unint64_t a6)
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  uint64_t v12 = *(void *)(a1 + 216);
  unint64_t v36 = *(void *)(v12 + 56);
  uint64_t v61 = 0;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  timespec v56 = (timespec)0;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v50 = 0u;
  uint64_t v49 = 0;
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
  long long v38 = 0u;
  if (gbIsLoggerInit)
  {
    unint64_t v13 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel))
    {
      *(_DWORD *)buf = 136316418;
      long long v63 = "EXFAT_EndBlockmap";
      __int16 v64 = 2048;
      unint64_t v65 = a2;
      __int16 v66 = 2048;
      unint64_t v67 = a3;
      __int16 v68 = 1024;
      int v69 = a4;
      __int16 v70 = 1024;
      int v71 = a5;
      __int16 v72 = 2048;
      unint64_t v73 = a6;
      _os_log_impl(&dword_22C0F9000, v13, (os_log_type_t)gpeExfatToOsLevel, "%s: offset: %llu, length: %lu, status: %d, flags: %u, operationID: %llu.\n", buf, 0x36u);
    }
  }
  int v14 = *(_DWORD *)(a1 + 208);
  if (v14 != 3)
  {
    if (!gbIsLoggerInit) {
      return 22;
    }
    uint64_t v22 = gpsExFatLog;
    if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
      return 22;
    }
    *(_DWORD *)buf = 136315394;
    long long v63 = "EXFAT_EndBlockmap";
    __int16 v64 = 1024;
    LODWORD(v65) = v14;
    int v23 = "%s: Given node is not a file. Record ID = [%d].\n";
    unsigned int v24 = v22;
    uint32_t v25 = 18;
    goto LABEL_23;
  }
  if ((a5 & 0x100) == 0)
  {
    int v15 = (pthread_rwlock_t *)(a1 + 8);
    FSOPS_SetDirtyBitAndAcquireLck(v12);
    MultiReadSingleWrite_LockWrite((pthread_rwlock_t *)(a1 + 8));
    if ((a5 & 0x1000) != 0)
    {
      uint64_t v16 = *(void **)(a1 + 472);
      if (!v16)
      {
LABEL_28:
        if (gbIsLoggerInit
          && (uint64_t v27 = gpsExFatLog, os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)))
        {
          *(_DWORD *)buf = 136315394;
          long long v63 = "EXFAT_EndBlockmap";
          __int16 v64 = 2048;
          unint64_t v65 = a6;
          uint64_t v17 = 22;
          _os_log_impl(&dword_22C0F9000, v27, OS_LOG_TYPE_ERROR, "%s: Couldn't find operationID = %llu in blockmap requests list.", buf, 0x16u);
        }
        else
        {
          uint64_t v17 = 22;
        }
        goto LABEL_55;
      }
      while (v16[1] != a6)
      {
        uint64_t v16 = (void *)v16[4];
        if (!v16) {
          goto LABEL_28;
        }
      }
      if (*(unsigned char *)v16) {
        atomic_fetch_add((atomic_ullong *volatile)(a1 + 512), 0xFFFFFFFFFFFFFFFFLL);
      }
    }
    else
    {
      uint64_t v16 = 0;
    }
    if (a4)
    {
      uint64_t v17 = 0;
    }
    else
    {
      unint64_t v28 = a3 + a2;
      unint64_t v29 = *(void *)(*(void *)(a1 + 216) + 56) * *(unsigned int *)(a1 + 436);
      if (v28 > v29)
      {
        if (gbIsLoggerInit)
        {
          __int16 v30 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            long long v63 = "EXFAT_EndBlockmap";
            __int16 v64 = 2048;
            unint64_t v65 = v28;
            __int16 v66 = 2048;
            unint64_t v67 = v29;
            _os_log_impl(&dword_22C0F9000, v30, OS_LOG_TYPE_ERROR, "%s: offset + length > file's allocated size (%llu > %llu).", buf, 0x20u);
          }
        }
        uint64_t v17 = 22;
        goto LABEL_51;
      }
      int v31 = (a5 & 0x1000) != 0 && v28 > v16[2];
      if (v28 > *(void *)(a1 + 304))
      {
        *(void *)(a1 + 304) = v28;
        int v31 = 1;
      }
      if (v28 > *(void *)(a1 + 288))
      {
        *(void *)(a1 + 288) = v28;
        int v31 = 1;
      }
      if (*(unsigned char *)(a1 + 564)) {
        goto LABEL_48;
      }
      __tp.tv_sec = 0;
      __tp.tv_nsec = 0;
      CONV_GetCurrentTime(&__tp);
      uint64_t v61 = 0;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      *(void *)&long long v50 = 0;
      long long v51 = 0u;
      *((void *)&v50 + 1) = 2048;
      timespec v56 = __tp;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      uint64_t v49 = 0;
      uint64_t v34 = FileOPS_SetAttrToDirEntry(a1, (uint64_t)&v50, (uint64_t)&v38, 0, v31, 1, 1, 0);
      if (!v34)
      {
LABEL_48:
        if (*(unsigned char *)(a1 + 504) && (v36 + *(void *)(a1 + 304) - 1) / v36 == *(_DWORD *)(a1 + 436))
        {
          uint64_t v17 = 0;
          *(unsigned char *)(a1 + 504) = 0;
          atomic_fetch_add((atomic_ullong *volatile)(v12 + 2264), 0xFFFFFFFFFFFFFFFFLL);
        }
        else
        {
          uint64_t v17 = 0;
        }
        goto LABEL_51;
      }
      uint64_t v17 = v34;
      if (gbIsLoggerInit)
      {
        unint64_t v35 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          long long v63 = "EXFAT_EndBlockmap";
          __int16 v64 = 1024;
          LODWORD(v65) = v17;
          _os_log_impl(&dword_22C0F9000, v35, OS_LOG_TYPE_ERROR, "%s: Failed to update dir entry with new size and modification time. Error = [%d].\n", buf, 0x12u);
        }
      }
    }
    if (!atomic_load((unint64_t *)(a1 + 512)))
    {
      if ((a5 & 0x1000) != 0)
      {
        if (*(void *)(a1 + 288) == v16[3])
        {
          uint64_t v61 = 0;
          long long v59 = 0u;
          long long v60 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          long long v55 = 0u;
          timespec v56 = (timespec)0;
          long long v53 = 0u;
          long long v54 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          long long v50 = 0u;
          *(void *)&long long v53 = v16[2];
          *((void *)&v50 + 1) = 64;
          uint64_t v49 = 0;
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
          long long v38 = 0u;
          *(void *)(a1 + 288) = v16[3];
          int v19 = FileOPS_SetAttrToDirEntry(a1, (uint64_t)&v50, (uint64_t)&v38, 1, 0, 1, 1, 0);
          if (v19)
          {
            if (gbIsLoggerInit)
            {
              int v20 = v19;
              uint64_t v21 = gpsExFatLog;
              if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                long long v63 = "EXFAT_EndBlockmap";
                __int16 v64 = 1024;
                LODWORD(v65) = v20;
                _os_log_impl(&dword_22C0F9000, v21, OS_LOG_TYPE_ERROR, "%s: Failed reverting file size. Error [%d]\n", buf, 0x12u);
              }
            }
          }
        }
        goto LABEL_52;
      }
      goto LABEL_55;
    }
LABEL_51:
    if (v16)
    {
LABEL_52:
      uint64_t v32 = v16[4];
      if (v32) {
        *(void *)(v32 + 40) = v16[5];
      }
      *(void *)v16[5] = v32;
      free(v16);
    }
LABEL_55:
    MultiReadSingleWrite_FreeWrite(v15);
    FSOPS_FlushCacheAndFreeLck(v12);
    return v17;
  }
  if (gbIsLoggerInit)
  {
    uint64_t v26 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      long long v63 = "EXFAT_EndBlockmap";
      int v23 = "%s: No EndBlockmap calls should be made for reads.\n";
      unsigned int v24 = v26;
      uint32_t v25 = 12;
LABEL_23:
      _os_log_impl(&dword_22C0F9000, v24, OS_LOG_TYPE_ERROR, v23, buf, v25);
    }
  }
  return 22;
}

uint64_t EXFAT_Create(uint64_t a1, char *a2, uint64_t a3, void *a4)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  if (gbIsLoggerInit)
  {
    unint64_t v8 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel[0]))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C0F9000, v8, (os_log_type_t)gpeExfatToOsLevel[0], "EXFAT_Create\n", buf, 2u);
    }
  }
  if (!a1) {
    goto LABEL_16;
  }
  if (*(_DWORD *)a1 == -1061240642)
  {
    if (*(_DWORD *)(a1 + 560) != -1061240642) {
      goto LABEL_16;
    }
    uint64_t v11 = *(void *)(a3 + 8);
    if ((v11 & 2) == 0) {
      return 22;
    }
    if ((v11 & 0x40) != 0) {
      uint64_t v12 = *(void *)(a3 + 48);
    }
    else {
      uint64_t v12 = 0;
    }
    uint64_t v15 = *(void *)(a1 + 216);
    uint64_t HTForDirectory = DIROPS_CreateHTForDirectory(a1);
    if (HTForDirectory) {
      return HTForDirectory;
    }
    int v52 = 0;
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
    *(_OWORD *)buf = 0u;
    FSOPS_SetDirtyBitAndAcquireLck(v15);
    MultiReadSingleWrite_LockWrite((pthread_rwlock_t *)(a1 + 8));
    unsigned int v16 = DIROPS_LookForDirEntryByName(a1, a2, 0, &v52, (uint64_t)buf);
    if (v16 != 2)
    {
      if (v16) {
        uint64_t HTForDirectory = v16;
      }
      else {
        uint64_t HTForDirectory = 17;
      }
      if (!gbIsLoggerInit) {
        goto LABEL_36;
      }
      int v20 = gpsExFatLog;
      if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_36;
      }
      *(_DWORD *)long long v53 = 67109120;
      int v54 = HTForDirectory;
      uint64_t v21 = "EXFAT_Create: Lookup For Dir Entry ended with error [%d].\n";
      goto LABEL_35;
    }
    unint64_t v17 = *(void *)(v15 + 56);
    uint64_t v40 = 0;
    int v39 = 0;
    char v38 = 1;
    int v37 = 0;
    unint64_t v18 = (v12 + v17 - 1) / v17;
    int v35 = v18;
    if (v18)
    {
      uint64_t v19 = FAT_Access_M_AllocateClusters(v15, v18, 0, &v38, (_DWORD *)&v40 + 1, (unsigned int *)&v40, &v39, 0, 1, 0, &v37, 0);
      if (v19)
      {
        uint64_t HTForDirectory = v19;
        if (!gbIsLoggerInit) {
          goto LABEL_36;
        }
        int v20 = gpsExFatLog;
        if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
          goto LABEL_36;
        }
        *(_DWORD *)long long v53 = 67109120;
        int v54 = HTForDirectory;
        uint64_t v21 = "EXFAT_Create: Allocate new file clusters ended with error [%d].\n";
LABEL_35:
        _os_log_impl(&dword_22C0F9000, v20, OS_LOG_TYPE_ERROR, v21, v53, 8u);
LABEL_36:
        uint64_t v22 = (pthread_rwlock_t *)(a1 + 8);
LABEL_37:
        MultiReadSingleWrite_FreeWrite(v22);
        FSOPS_FlushCacheAndFreeLck(v15);
        if (HTForDirectory) {
          BOOL v23 = HTForDirectory == 17;
        }
        else {
          BOOL v23 = 1;
        }
        char v24 = !v23;
        DIROPS_ReleaseHTForDirectory(a1, v24);
        return HTForDirectory;
      }
      unsigned int v26 = HIDWORD(v40);
      char v25 = v38 != 0;
    }
    else
    {
      char v25 = 0;
      unsigned int v26 = 0;
      char v38 = 0;
    }
    unint64_t v36 = 0;
    uint64_t v27 = DIROPS_CreateNewEntry(a1, a2, a3, v26, 1, v12, v12, v25, &v36);
    if (v27)
    {
      uint64_t HTForDirectory = v27;
      if (gbIsLoggerInit)
      {
        unint64_t v28 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long v53 = 67109120;
          int v54 = HTForDirectory;
          unint64_t v29 = "EXFAT_Create: Create new dir entry for the file ended with error [%d].\n";
LABEL_54:
          _os_log_impl(&dword_22C0F9000, v28, OS_LOG_TYPE_ERROR, v29, v53, 8u);
        }
      }
    }
    else
    {
      uint64_t v30 = DIROPS_LookupInternal(a1, a2, &v36, a4);
      if (!v30)
      {
        int v31 = (void *)*a4;
        pthread_mutex_lock((pthread_mutex_t *)(*(void *)(v15 + 2008) + 8));
        uint64_t v32 = (int *)v37;
        if (v37)
        {
          uint64_t v33 = 0;
          do
          {
            FILERECORD_UpdateNewAllocatedClustersInChain(v31, *v32, v32[1], v33);
            uint64_t v34 = v37;
            v33 += *(void *)(v15 + 56) * *((unsigned int *)v37 + 1);
            int v37 = (void *)*((void *)v37 + 1);
            free(v34);
            uint64_t v32 = (int *)v37;
          }
          while (v37);
        }
        pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(v15 + 2008) + 8));
        uint64_t HTForDirectory = 0;
        goto LABEL_36;
      }
      uint64_t HTForDirectory = v30;
      if (gbIsLoggerInit)
      {
        unint64_t v28 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long v53 = 67109120;
          int v54 = HTForDirectory;
          unint64_t v29 = "EXFAT_Create: New file lookup ended with error [%d].\n";
          goto LABEL_54;
        }
      }
    }
    uint64_t v22 = (pthread_rwlock_t *)(a1 + 8);
    if (v35) {
      FAT_Access_M_FATChainFree(*(void *)(a1 + 216), HIDWORD(v40), 0, &v38, v35);
    }
    goto LABEL_37;
  }
  if (*(_DWORD *)a1 != -559031622 || *(_DWORD *)(a1 + 560) != -559031622)
  {
LABEL_16:
    if (gbIsLoggerInit)
    {
      unint64_t v13 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C0F9000, v13, OS_LOG_TYPE_ERROR, "Got invalid node", buf, 2u);
      }
    }
    return 22;
  }
  if (gbIsLoggerInit)
  {
    unint64_t v9 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C0F9000, v9, OS_LOG_TYPE_ERROR, "Got stale node", buf, 2u);
    }
  }
  return 70;
}

uint64_t EXFAT_GetAttr(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (gbIsLoggerInit)
  {
    int v4 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel[0]))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_22C0F9000, v4, (os_log_type_t)gpeExfatToOsLevel[0], "EXFAT_GetAttr\n", (uint8_t *)&v11, 2u);
    }
  }
  if (!a1) {
    goto LABEL_18;
  }
  if (*(_DWORD *)a1 != -1061240642)
  {
    if (*(_DWORD *)a1 == -559031622 && *(_DWORD *)(a1 + 560) == -559031622)
    {
      if (gbIsLoggerInit)
      {
        uint64_t v5 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v11) = 0;
          _os_log_impl(&dword_22C0F9000, v5, OS_LOG_TYPE_ERROR, "Got stale node", (uint8_t *)&v11, 2u);
        }
      }
      return 70;
    }
    goto LABEL_18;
  }
  if (*(_DWORD *)(a1 + 560) != -1061240642)
  {
LABEL_18:
    if (gbIsLoggerInit)
    {
      unint64_t v9 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_22C0F9000, v9, OS_LOG_TYPE_ERROR, "Got invalid node", (uint8_t *)&v11, 2u);
      }
    }
    return 22;
  }
  MultiReadSingleWrite_LockRead((pthread_rwlock_t *)(a1 + 8));
  FILEOPS_GetAtrrFromDirEntry(a1, a2);
  int v7 = *(unsigned __int8 *)(a1 + 496);
  MultiReadSingleWrite_FreeRead((pthread_rwlock_t *)(a1 + 8));
  if (!v7) {
    return 0;
  }
  uint64_t v6 = FILEOPS_FlushDirEntryIfNeeded(a1);
  if (v6)
  {
    if (gbIsLoggerInit)
    {
      unint64_t v8 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        int v11 = 136315394;
        uint64_t v12 = "EXFAT_GetAttr";
        __int16 v13 = 1024;
        int v14 = v6;
        _os_log_impl(&dword_22C0F9000, v8, OS_LOG_TYPE_ERROR, "%s: FILEOPS_FlushDirEntryIfNeeded returned %d\n", (uint8_t *)&v11, 0x12u);
      }
    }
  }
  return v6;
}

uint64_t FILEOPS_FlushDirEntryIfNeeded(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = (pthread_rwlock_t *)(a1 + 8);
  MultiReadSingleWrite_LockWrite((pthread_rwlock_t *)(a1 + 8));
  if (*(unsigned char *)(a1 + 496) && *(_DWORD *)(a1 + 208) != 1)
  {
    uint64_t updated = DIROPS_UpdateDirectoryEntries(a1, a1 + 248, (_OWORD *)(a1 + 280), 0, 0);
    if (updated)
    {
      if (gbIsLoggerInit)
      {
        uint64_t v5 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          int v6 = 136315394;
          int v7 = "FILEOPS_FlushDirEntryIfNeeded";
          __int16 v8 = 1024;
          int v9 = updated;
          _os_log_impl(&dword_22C0F9000, v5, OS_LOG_TYPE_ERROR, "%s: DIROPS_UpdateDirectoryEntries returned %d\n", (uint8_t *)&v6, 0x12u);
        }
      }
    }
    else
    {
      *(unsigned char *)(a1 + 496) = 0;
    }
  }
  else
  {
    uint64_t updated = 0;
  }
  MultiReadSingleWrite_FreeWrite(v2);
  return updated;
}

uint64_t EXFAT_SetAttr(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (gbIsLoggerInit)
  {
    int v6 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel[0]))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C0F9000, v6, (os_log_type_t)gpeExfatToOsLevel[0], "EXFAT_SetAttr\n", buf, 2u);
    }
  }
  if (a1)
  {
    if (*(_DWORD *)a1 == -1061240642)
    {
      if (*(_DWORD *)(a1 + 560) == -1061240642)
      {
        FSOPS_SetDirtyBitAndAcquireLck(*(void *)(a1 + 216));
        MultiReadSingleWrite_LockWrite((pthread_rwlock_t *)(a1 + 8));
        uint64_t v8 = FileOPS_SetAttrToDirEntry(a1, a2, a3, 0, *(unsigned char *)(a1 + 564) == 0, 0, 0, 0);
        MultiReadSingleWrite_FreeWrite((pthread_rwlock_t *)(a1 + 8));
        FSOPS_FlushCacheAndFreeLck(*(void *)(a1 + 216));
        return v8;
      }
    }
    else if (*(_DWORD *)a1 == -559031622 && *(_DWORD *)(a1 + 560) == -559031622)
    {
      if (gbIsLoggerInit)
      {
        int v7 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v12 = 0;
          _os_log_impl(&dword_22C0F9000, v7, OS_LOG_TYPE_ERROR, "Got stale node", v12, 2u);
        }
      }
      return 70;
    }
  }
  if (gbIsLoggerInit)
  {
    int v9 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v11 = 0;
      _os_log_impl(&dword_22C0F9000, v9, OS_LOG_TYPE_ERROR, "Got invalid node", v11, 2u);
    }
  }
  return 22;
}

uint64_t EXFAT_Reclaim(uint64_t a1, char a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 216);
  if (gbIsLoggerInit)
  {
    uint64_t v5 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel[0]))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_22C0F9000, v5, (os_log_type_t)gpeExfatToOsLevel[0], "EXFAT_Reclaim", (uint8_t *)&v16, 2u);
    }
  }
  if (*(_DWORD *)a1 == -559031622 || *(_DWORD *)a1 == -1061240642)
  {
    int v7 = *(_DWORD *)(a1 + 560);
    if (v7 == -1061240642 || v7 == -559031622)
    {
      uint64_t v9 = 0;
      if ((a2 & 1) == 0 && *(unsigned char *)(a1 + 564))
      {
        if (*(_DWORD *)(a1 + 436))
        {
          if (*(_DWORD *)(a1 + 208) == 4)
          {
            int v10 = DIROPS_PurgeNodeMetaBlocksFromCache(a1);
            if (v10)
            {
              if (gbIsLoggerInit)
              {
                int v11 = v10;
                uint64_t v12 = gpsExFatLog;
                if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
                {
                  int v16 = 136315394;
                  unint64_t v17 = "EXFAT_Reclaim";
                  __int16 v18 = 1024;
                  int v19 = v11;
                  _os_log_impl(&dword_22C0F9000, v12, OS_LOG_TYPE_ERROR, "%s: Couldn't purge the symlink's metadata blocks. error = %d.", (uint8_t *)&v16, 0x12u);
                }
              }
            }
          }
          FSOPS_SetDirtyBitAndAcquireLck(v4);
          uint64_t v9 = FAT_Access_M_FATChainFree(*(void *)(a1 + 216), *(unsigned int *)(a1 + 428), 0, (unsigned char *)(a1 + 444), *(_DWORD *)(a1 + 436));
          FSOPS_FlushCacheAndFreeLck(v4);
          if (v9 > 9 || ((1 << v9) & 0x241) == 0)
          {
            if (gbIsLoggerInit)
            {
              __int16 v13 = gpsExFatLog;
              if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
              {
                int v16 = 136315394;
                unint64_t v17 = "EXFAT_Reclaim";
                __int16 v18 = 1024;
                int v19 = v9;
                _os_log_impl(&dword_22C0F9000, v13, OS_LOG_TYPE_ERROR, "%s: FAT_Access_M_FATChainFree returned %d\n", (uint8_t *)&v16, 0x12u);
              }
            }
            goto LABEL_33;
          }
        }
        else
        {
          uint64_t v9 = 0;
        }
        atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 216) + 2632), 0xFFFFFFFFFFFFFFFFLL);
      }
LABEL_33:
      FILEOPS_FreeUnusedPreAllocatedClusters(a1);
      FILERECORD_FreeRecord((char *)a1, 0);
      return v9;
    }
  }
  if (gbIsLoggerInit)
  {
    int v14 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_22C0F9000, v14, OS_LOG_TYPE_ERROR, "Got invalid node for reclaim", (uint8_t *)&v16, 2u);
    }
  }
  return 22;
}

uint64_t FILEOPS_FreeUnusedPreAllocatedClusters(uint64_t result)
{
  if (*(_DWORD *)(result + 208) == 3)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 504))
    {
      uint64_t v2 = *(void *)(result + 216);
      if (*(unsigned char *)(result + 564))
      {
        *(unsigned char *)(result + 504) = 0;
        atomic_fetch_add((atomic_ullong *volatile)(v2 + 2264), 0xFFFFFFFFFFFFFFFFLL);
        return result;
      }
      uint64_t v3 = (pthread_rwlock_t *)(result + 8);
      FSOPS_SetDirtyBitAndAcquireLck(*(void *)(result + 216));
      MultiReadSingleWrite_LockWrite((pthread_rwlock_t *)(v1 + 8));
      long long v4 = *(_OWORD *)(v1 + 264);
      long long v5 = *(_OWORD *)(v1 + 280);
      v15[0] = *(_OWORD *)(v1 + 248);
      v15[1] = v4;
      long long v6 = *(_OWORD *)(v1 + 296);
      long long v13 = v5;
      long long v14 = v6;
      unint64_t v7 = (unint64_t)(*((void *)&v6 + 1) + *(void *)(v2 + 56) - 1) / *(void *)(v2 + 56);
      unint64_t v8 = *(unsigned int *)(v1 + 436);
      if (v7 >= v8) {
        goto LABEL_18;
      }
      if (FAT_Access_M_TruncateLastClusters(v1, (int)v8 - (int)v7, (unsigned char *)(v1 + 444)))
      {
        if (gbIsLoggerInit)
        {
          uint64_t v9 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)uint64_t v12 = 0;
            _os_log_impl(&dword_22C0F9000, v9, OS_LOG_TYPE_ERROR, "FILEOPS_FreeUnusedPreAllocatedClusters: failed to evict clusters, will be removed during fsck\n", v12, 2u);
          }
        }
        if ((FSOPS_CheckIfVolumeIsDirty(v2) & 1) == 0)
        {
          if (gbIsLoggerInit)
          {
            int v10 = gpsExFatLog;
            if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)uint64_t v12 = 0;
              _os_log_impl(&dword_22C0F9000, v10, OS_LOG_TYPE_FAULT, "FILEOPS_FreeUnusedPreAllocatedClusters: expected the volume to be dirty\n", v12, 2u);
            }
          }
          FSOPS_SetDirtyBitAndAcquireLck(v2);
          MultiReadSingleWrite_FreeRead((pthread_rwlock_t *)(v2 + 2064));
        }
      }
      else
      {
        if (*(_DWORD *)(v1 + 428))
        {
          FILERECORD_EvictAllFileChainCacheEntriesFromGivenOffset(v1, *(void *)(v2 + 56) * v7, 1);
        }
        else
        {
          DWORD1(v14) = 0;
          FILERECORD_EvictAllFileChainCacheEntriesFromGivenOffset(v1, *(void *)(v2 + 56) * v7, 1);
          if (DIROPS_UpdateDirectoryEntries(v1, (uint64_t)v15, &v13, 1, 0))
          {
            if (gbIsLoggerInit)
            {
              int v11 = gpsExFatLog;
              if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)uint64_t v12 = 0;
                _os_log_impl(&dword_22C0F9000, v11, OS_LOG_TYPE_ERROR, "FILEOPS_FreeUnusedPreAllocatedClusters: failed to update dir entry, will be fixed during fsck\n", v12, 2u);
              }
            }
            goto LABEL_18;
          }
        }
        *(unsigned char *)(v1 + 504) = 0;
        atomic_fetch_add((atomic_ullong *volatile)(v2 + 2264), 0xFFFFFFFFFFFFFFFFLL);
      }
LABEL_18:
      MultiReadSingleWrite_FreeWrite(v3);
      return FSOPS_FlushCacheAndFreeLck(v2);
    }
  }
  return result;
}

uint64_t EXFAT_ReadLink(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  if (gbIsLoggerInit)
  {
    int v10 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel[0]))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C0F9000, v10, (os_log_type_t)gpeExfatToOsLevel[0], "EXFAT_ReadLink\n", buf, 2u);
    }
  }
  if (!a1) {
    goto LABEL_25;
  }
  if (*(_DWORD *)a1 != -1061240642)
  {
    if (*(_DWORD *)a1 == -559031622 && *(_DWORD *)(a1 + 560) == -559031622)
    {
      if (gbIsLoggerInit)
      {
        int v11 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22C0F9000, v11, OS_LOG_TYPE_ERROR, "Got stale node", buf, 2u);
        }
      }
      return 70;
    }
    goto LABEL_25;
  }
  if (*(_DWORD *)(a1 + 560) != -1061240642)
  {
LABEL_25:
    if (gbIsLoggerInit)
    {
      char v25 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C0F9000, v25, OS_LOG_TYPE_ERROR, "Got invalid node", buf, 2u);
      }
    }
    return 22;
  }
  __dst = a2;
  uint64_t v36 = a3;
  long long v13 = (pthread_rwlock_t *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 216);
  unint64_t v15 = *(void *)(v14 + 48);
  uint64_t v37 = *(void *)(v14 + 56);
  unsigned int v41 = 0;
  MultiReadSingleWrite_LockRead((pthread_rwlock_t *)(a1 + 8));
  if (*(_DWORD *)(a1 + 208) != 4)
  {
    int v26 = 22;
LABEL_31:
    unsigned int v41 = v26;
    goto LABEL_47;
  }
  size_t v16 = (v15 + 1066) / v15 * v15;
  unint64_t v17 = (char *)malloc_type_malloc(v16, 0x3301BA7BuLL);
  if (!v17)
  {
    int v26 = 12;
    goto LABEL_31;
  }
  uint64_t v34 = a5;
  uint64_t v33 = a4;
  char v38 = v17;
  bzero(v17, v16);
  unsigned int v18 = *(_DWORD *)(a1 + 428);
  unsigned int __n_4 = 0;
  if (!v16) {
    goto LABEL_39;
  }
  uint64_t v19 = 0;
  while (1)
  {
    size_t v20 = v16;
    if (*(unsigned char *)(a1 + 444)) {
      goto LABEL_22;
    }
    unsigned int v21 = FAT_Access_M_ContiguousClustersInChain(v14, v18, &__n_4, &v41);
    unsigned int v22 = v41;
    if (v41) {
      break;
    }
    if (v37 * (unint64_t)v21 >= v16) {
      size_t v20 = v16;
    }
    else {
      size_t v20 = v37 * v21;
    }
LABEL_22:
    off_t v23 = DIROPS_VolumeOffsetForCluster(v14, v18);
    unsigned int v24 = metaRead((int *)v14, (void *)&v38[v19], v23, v20, 0, 0);
    unsigned int v41 = v24;
    if (v24)
    {
      uint64_t v27 = (char *)v38;
      if (!gbIsLoggerInit) {
        goto LABEL_46;
      }
      unsigned int v28 = v24;
      unint64_t v29 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        long long v43 = "EXFAT_ReadLink";
        __int16 v44 = 1024;
        unsigned int v45 = v28;
        uint64_t v30 = "%s: Failed to read link contents. Error = %d.";
LABEL_38:
        _os_log_impl(&dword_22C0F9000, v29, OS_LOG_TYPE_ERROR, v30, buf, 0x12u);
        goto LABEL_39;
      }
      goto LABEL_39;
    }
    v19 += v20;
    unsigned int v18 = __n_4;
    v16 -= v20;
    if (!v16) {
      goto LABEL_39;
    }
  }
  uint64_t v27 = (char *)v38;
  if (!gbIsLoggerInit) {
    goto LABEL_46;
  }
  unint64_t v29 = gpsExFatLog;
  if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    long long v43 = "EXFAT_ReadLink";
    __int16 v44 = 1024;
    unsigned int v45 = v22;
    uint64_t v30 = "%s: Failed to get the next cluster(s). Error = %d.";
    goto LABEL_38;
  }
LABEL_39:
  uint64_t v27 = (char *)v38;
  if (!v41)
  {
    CC_LONG __n = 0;
    if (DIROPS_VerifyIfLinkAndGetLinkLength(v38, &__n))
    {
      size_t v31 = __n;
      if (v36 - 1 < (unint64_t)__n)
      {
        int v32 = 55;
        goto LABEL_44;
      }
      void *v33 = __n;
      memcpy(__dst, v38 + 43, v31);
      *((unsigned char *)__dst + (*v33)++) = 0;
      FILEOPS_GetAtrrFromDirEntry(a1, v34);
    }
    else
    {
      int v32 = 22;
LABEL_44:
      unsigned int v41 = v32;
    }
  }
LABEL_46:
  free(v27);
  long long v13 = (pthread_rwlock_t *)(a1 + 8);
LABEL_47:
  MultiReadSingleWrite_FreeRead(v13);
  return v41;
}

uint64_t EXFAT_SymLink(uint64_t a1, char *a2, char *a3, uint64_t a4, void *a5)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  if (gbIsLoggerInit)
  {
    int v10 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel[0]))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C0F9000, v10, (os_log_type_t)gpeExfatToOsLevel[0], "EXFAT_SymLink\n", buf, 2u);
    }
  }
  if (!a1) {
    goto LABEL_22;
  }
  if (*(_DWORD *)a1 == -1061240642)
  {
    if (*(_DWORD *)(a1 + 560) != -1061240642) {
      goto LABEL_22;
    }
    uint64_t HTForDirectory = 22;
    if (!a3) {
      return HTForDirectory;
    }
    if ((*(void *)(a4 + 8) & 2) == 0) {
      return HTForDirectory;
    }
    uint64_t v13 = *(void *)(a1 + 216);
    int v45 = 0;
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
    *(_OWORD *)buf = 0u;
    uint64_t HTForDirectory = DIROPS_CreateHTForDirectory(a1);
    if (HTForDirectory) {
      return HTForDirectory;
    }
    FSOPS_SetDirtyBitAndAcquireLck(v13);
    MultiReadSingleWrite_LockWrite((pthread_rwlock_t *)(a1 + 8));
    uint64_t v14 = DIROPS_LookForDirEntryByName(a1, a2, 0, &v45, (uint64_t)buf);
    if (v14)
    {
      uint64_t HTForDirectory = v14;
      if (v14 == 2)
      {
        unint64_t v15 = *(void *)(v13 + 56);
        *(void *)uint64_t v33 = 0;
        int v32 = 0;
        char v31 = 1;
        unint64_t v16 = (v15 + 1066) / v15;
        uint64_t v17 = FAT_Access_M_AllocateClusters(v13, v16, 0, &v31, &v33[1], (unsigned int *)v33, &v32, 0, 0, 0, 0, 0);
        if (v17)
        {
          uint64_t HTForDirectory = v17;
          if (!gbIsLoggerInit) {
            goto LABEL_32;
          }
          unsigned int v18 = gpsExFatLog;
          if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
            goto LABEL_32;
          }
          *(_DWORD *)uint64_t v46 = 67109120;
          int v47 = HTForDirectory;
          uint64_t v19 = "EXFAT_SymLink: Allocate new link cluster ended with error [%d].\n";
LABEL_31:
          _os_log_impl(&dword_22C0F9000, v18, OS_LOG_TYPE_ERROR, v19, v46, 8u);
LABEL_32:
          unsigned int v22 = (pthread_rwlock_t *)(a1 + 8);
LABEL_33:
          MultiReadSingleWrite_FreeWrite(v22);
          FSOPS_FlushCacheAndFreeLck(v13);
          if (HTForDirectory) {
            BOOL v23 = HTForDirectory == 17;
          }
          else {
            BOOL v23 = 1;
          }
          char v24 = !v23;
          DIROPS_ReleaseHTForDirectory(a1, v24);
          return HTForDirectory;
        }
        int v29 = v16;
        uint64_t LinkAccordingToContent = DIROPS_CreateLinkAccordingToContent(v13, v33[1], a3, v31);
        if (LinkAccordingToContent)
        {
          uint64_t HTForDirectory = LinkAccordingToContent;
          if (!gbIsLoggerInit) {
            goto LABEL_53;
          }
          int v26 = gpsExFatLog;
          if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
            goto LABEL_53;
          }
          *(_DWORD *)uint64_t v46 = 67109120;
          int v47 = HTForDirectory;
          uint64_t v27 = "EXFAT_SymLink: Create new dir entry for the link ended with error [%d].\n";
        }
        else
        {
          unint64_t v30 = 0;
          uint64_t v28 = DIROPS_CreateNewEntry(a1, a2, a4, v33[1], 3, 1067, 1067, v31, &v30);
          if (v28)
          {
            uint64_t HTForDirectory = v28;
            if (!gbIsLoggerInit) {
              goto LABEL_53;
            }
            int v26 = gpsExFatLog;
            if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
              goto LABEL_53;
            }
            *(_DWORD *)uint64_t v46 = 67109120;
            int v47 = HTForDirectory;
            uint64_t v27 = "EXFAT_SymLink: Create new dir entry for the link ended with error [%d].\n";
          }
          else
          {
            uint64_t HTForDirectory = DIROPS_LookupInternal(a1, a2, &v30, a5);
            if (!HTForDirectory)
            {
              unsigned int v22 = (pthread_rwlock_t *)(a1 + 8);
              goto LABEL_33;
            }
            if (!gbIsLoggerInit) {
              goto LABEL_53;
            }
            int v26 = gpsExFatLog;
            if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
              goto LABEL_53;
            }
            *(_DWORD *)uint64_t v46 = 67109120;
            int v47 = HTForDirectory;
            uint64_t v27 = "EXFAT_SymLink:New file lookup ended with error [%d].\n";
          }
        }
        _os_log_impl(&dword_22C0F9000, v26, OS_LOG_TYPE_ERROR, v27, v46, 8u);
LABEL_53:
        unsigned int v22 = (pthread_rwlock_t *)(a1 + 8);
        FAT_Access_M_FATChainFree(v13, v33[1], 0, &v31, v29);
        goto LABEL_33;
      }
    }
    else
    {
      uint64_t HTForDirectory = 17;
    }
    if (!gbIsLoggerInit) {
      goto LABEL_32;
    }
    unsigned int v18 = gpsExFatLog;
    if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    *(_DWORD *)uint64_t v46 = 67109120;
    int v47 = HTForDirectory;
    uint64_t v19 = "EXFAT_SymLink: Lookup For Dir Entry ended with error [%d].\n";
    goto LABEL_31;
  }
  if (*(_DWORD *)a1 == -559031622 && *(_DWORD *)(a1 + 560) == -559031622)
  {
    if (gbIsLoggerInit)
    {
      int v11 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C0F9000, v11, OS_LOG_TYPE_ERROR, "Got stale node", buf, 2u);
      }
    }
    return 70;
  }
LABEL_22:
  if (gbIsLoggerInit)
  {
    size_t v20 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C0F9000, v20, OS_LOG_TYPE_ERROR, "Got invalid node", buf, 2u);
    }
  }
  return 22;
}

uint64_t DIROPS_CreateLinkAccordingToContent(uint64_t a1, unsigned int a2, char *__s1, char a4)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  unsigned int v29 = 0;
  unint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  size_t v10 = strnlen(__s1, 0x400uLL);
  if (v10)
  {
    size_t v11 = v10;
    size_t v12 = (v8 + 1066) / v8 * v8;
    uint64_t v13 = (char *)malloc_type_calloc(1uLL, v12, 0x1BF80EBAuLL);
    if (v13)
    {
      uint64_t v14 = v13;
      v13[4] = 10;
      *(_DWORD *)uint64_t v13 = 1836667736;
      snprintf(v13 + 5, 6uLL, "%04u\n", v11);
      DIROPS_GetMD5Digest(__s1, v11, v14 + 10);
      v14[42] = 10;
      memcpy(v14 + 43, __s1, v11);
      if (v11 <= 0x3FF)
      {
        v14[v11 + 43] = 10;
        if (v11 != 1023) {
          memset(&v14[v11 + 44], 32, 1023 - v11);
        }
      }
      unsigned int v28 = 0;
      if (!v12) {
        goto LABEL_32;
      }
      uint64_t v15 = 0;
      while (1)
      {
        size_t v16 = v12;
        if ((a4 & 1) == 0)
        {
          unsigned int v17 = FAT_Access_M_ContiguousClustersInChain(a1, a2, &v28, &v29);
          unsigned int v18 = v29;
          if (v29)
          {
            if (gbIsLoggerInit)
            {
              char v25 = gpsExFatLog;
              if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                char v31 = "DIROPS_CreateLinkAccordingToContent";
                __int16 v32 = 1024;
                unsigned int v33 = v18;
                int v26 = "%s: Failed to get the next cluster(s). Error = %d.";
                goto LABEL_31;
              }
            }
LABEL_32:
            free(v14);
            return v29;
          }
          if (v9 * (unint64_t)v17 >= v12) {
            size_t v16 = v12;
          }
          else {
            size_t v16 = v9 * v17;
          }
        }
        off_t v19 = DIROPS_VolumeOffsetForCluster(a1, a2);
        unsigned int v20 = metaWrite((int *)a1, &v14[v15], v19, v16);
        unsigned int v29 = v20;
        if (v20)
        {
          if (gbIsLoggerInit)
          {
            unsigned int v24 = v20;
            char v25 = gpsExFatLog;
            if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              char v31 = "DIROPS_CreateLinkAccordingToContent";
              __int16 v32 = 1024;
              unsigned int v33 = v24;
              int v26 = "%s: Failed to write link content into the device. Error = %d.";
LABEL_31:
              _os_log_impl(&dword_22C0F9000, v25, OS_LOG_TYPE_ERROR, v26, buf, 0x12u);
              goto LABEL_32;
            }
          }
          goto LABEL_32;
        }
        v15 += v16;
        a2 = v28;
        v12 -= v16;
        if (!v12) {
          goto LABEL_32;
        }
      }
    }
    if (!gbIsLoggerInit) {
      return 12;
    }
    unsigned int v21 = gpsExFatLog;
    uint64_t v22 = 12;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v31) = 12;
      BOOL v23 = "DIROPS_CreateLinkAccordingToContent: Failed to allocate buffer for symlink. Error [%d]\n";
      goto LABEL_22;
    }
  }
  else
  {
    if (!gbIsLoggerInit) {
      return 22;
    }
    unsigned int v21 = gpsExFatLog;
    uint64_t v22 = 22;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v31) = 22;
      BOOL v23 = "DIROPS_CreateLinkAccordingToContent: Link content is empty. Error [%d].\n";
LABEL_22:
      _os_log_impl(&dword_22C0F9000, v21, OS_LOG_TYPE_ERROR, v23, buf, 8u);
    }
  }
  return v22;
}

uint64_t EXFAT_Link()
{
  return 45;
}

uint64_t EXFAT_Rename(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, char *a6)
{
  uint64_t v137 = *MEMORY[0x263EF8340];
  if (gbIsLoggerInit)
  {
    size_t v10 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel[0]))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_22C0F9000, v10, (os_log_type_t)gpeExfatToOsLevel[0], "EXFAT_Rename\n", (uint8_t *)&buf, 2u);
    }
  }
  long long v135 = 0u;
  long long v136 = 0u;
  if (!a1) {
    goto LABEL_21;
  }
  if (*(_DWORD *)a1 != -1061240642)
  {
    if (*(_DWORD *)a1 == -559031622 && *(_DWORD *)(a1 + 560) == -559031622)
    {
      if (!gbIsLoggerInit) {
        return 70;
      }
      size_t v11 = gpsExFatLog;
      if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
        return 70;
      }
      LOWORD(buf) = 0;
LABEL_11:
      _os_log_impl(&dword_22C0F9000, v11, OS_LOG_TYPE_ERROR, "Got stale node", (uint8_t *)&buf, 2u);
      return 70;
    }
LABEL_21:
    if (gbIsLoggerInit)
    {
      uint64_t v13 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        uint64_t v14 = "Got invalid node";
        goto LABEL_24;
      }
    }
    return 22;
  }
  if (*(_DWORD *)(a1 + 560) != -1061240642) {
    goto LABEL_21;
  }
  *(void *)&long long v135 = a1;
  if (!a4) {
    goto LABEL_36;
  }
  if (*(_DWORD *)a4 != -1061240642)
  {
    if (*(_DWORD *)a4 == -559031622 && *(_DWORD *)(a4 + 560) == -559031622)
    {
      if (!gbIsLoggerInit) {
        return 70;
      }
      size_t v11 = gpsExFatLog;
      if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
        return 70;
      }
      LOWORD(buf) = 0;
      goto LABEL_11;
    }
    goto LABEL_36;
  }
  if (*(_DWORD *)(a4 + 560) != -1061240642)
  {
LABEL_36:
    if (!gbIsLoggerInit) {
      return 22;
    }
    uint64_t v13 = gpsExFatLog;
    if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
      return 22;
    }
    LOWORD(buf) = 0;
    uint64_t v14 = "Got invalid node";
LABEL_24:
    p_long long buf = (uint8_t *)&buf;
    size_t v16 = v13;
    uint32_t v17 = 2;
LABEL_25:
    _os_log_impl(&dword_22C0F9000, v16, OS_LOG_TYPE_ERROR, v14, p_buf, v17);
    return 22;
  }
  *((void *)&v135 + 1) = a4;
  if (a2)
  {
    if (*(_DWORD *)a2 != -1061240642)
    {
      if (*(_DWORD *)a2 == -559031622 && *(_DWORD *)(a2 + 560) == -559031622)
      {
        if (!gbIsLoggerInit) {
          return 70;
        }
        size_t v11 = gpsExFatLog;
        if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
          return 70;
        }
        LOWORD(buf) = 0;
        goto LABEL_11;
      }
      goto LABEL_48;
    }
    if (*(_DWORD *)(a2 + 560) != -1061240642)
    {
LABEL_48:
      if (!gbIsLoggerInit) {
        return 22;
      }
      uint64_t v13 = gpsExFatLog;
      if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
        return 22;
      }
      LOWORD(buf) = 0;
      uint64_t v14 = "Got invalid node";
      goto LABEL_24;
    }
    *(void *)&long long v136 = a2;
  }
  if (a5)
  {
    if (*(_DWORD *)a5 != -1061240642)
    {
      if (*(_DWORD *)a5 == -559031622 && *(_DWORD *)(a5 + 560) == -559031622)
      {
        if (!gbIsLoggerInit) {
          return 70;
        }
        size_t v11 = gpsExFatLog;
        if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
          return 70;
        }
        LOWORD(buf) = 0;
        goto LABEL_11;
      }
      goto LABEL_58;
    }
    if (*(_DWORD *)(a5 + 560) != -1061240642)
    {
LABEL_58:
      if (!gbIsLoggerInit) {
        return 22;
      }
      uint64_t v13 = gpsExFatLog;
      if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
        return 22;
      }
      LOWORD(buf) = 0;
      uint64_t v14 = "Got invalid node";
      goto LABEL_24;
    }
    *((void *)&v136 + 1) = a5;
  }
  uint64_t v84 = *(void *)(a1 + 216);
  uint64_t v122 = 0;
  long long v120 = 0uLL;
  long long v121 = 0uLL;
  long long v118 = 0uLL;
  long long v119 = 0uLL;
  long long v116 = 0uLL;
  long long v117 = 0uLL;
  long long v114 = 0uLL;
  long long v115 = 0uLL;
  long long v112 = 0uLL;
  long long v113 = 0uLL;
  long long buf = 0uLL;
  uint64_t v110 = 0;
  long long v108 = 0uLL;
  long long v109 = 0uLL;
  long long v106 = 0uLL;
  long long v107 = 0uLL;
  long long v104 = 0uLL;
  long long v105 = 0uLL;
  long long v102 = 0uLL;
  long long v103 = 0uLL;
  long long v100 = 0uLL;
  long long v101 = 0uLL;
  long long v98 = 0uLL;
  long long v99 = 0uLL;
  long long v96 = 0uLL;
  long long v97 = 0uLL;
  long long v94 = 0uLL;
  long long v95 = 0uLL;
  long long v92 = 0uLL;
  long long v93 = 0uLL;
  long long v90 = 0uLL;
  long long v91 = 0uLL;
  long long v88 = 0uLL;
  long long v89 = 0uLL;
  unint64_t v87 = 0;
  uint64_t HTForDirectory = DIROPS_CreateHTForDirectory(a1);
  if (!HTForDirectory)
  {
    uint64_t HTForDirectory = DIROPS_CreateHTForDirectory(a4);
    if (!HTForDirectory)
    {
      if (*(_DWORD *)(a2 + 208) == 2)
      {
        uint64_t v21 = a4;
        while (1)
        {
          uint64_t v21 = *(void *)(v21 + 224);
          if (!v21) {
            break;
          }
          if (*(_DWORD *)(v21 + 428) == *(_DWORD *)(a2 + 428))
          {
            if (gbIsLoggerInit)
            {
              uint64_t v22 = gpsExFatLog;
              if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v123 = 136315138;
                *(void *)&v123[4] = "EXFAT_Rename";
                uint64_t v14 = "%s: Can't move a directory into its subdirectory";
                p_long long buf = v123;
                size_t v16 = v22;
                uint32_t v17 = 12;
                goto LABEL_25;
              }
            }
            return 22;
          }
        }
      }
      FSOPS_SetDirtyBitAndAcquireLck(v84);
      FILERECORD_MultiLock((char *)&v135, 4, 1, 1);
      if (!a3 || !a6 || !strcmp(a3, ".") || !strcmp(a3, "..") || !strcmp(a6, ".") || !strcmp(a6, ".."))
      {
        if (!gbIsLoggerInit) {
          goto LABEL_120;
        }
        uint64_t v43 = gpsExFatLog;
        if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
          goto LABEL_120;
        }
        long long v44 = "NULL";
        if (a3) {
          int v45 = a3;
        }
        else {
          int v45 = "NULL";
        }
        if (a6) {
          long long v44 = a6;
        }
        *(_DWORD *)v123 = 136315394;
        *(void *)&v123[4] = v45;
        *(_WORD *)&v123[12] = 2080;
        *(void *)&v123[14] = v44;
        uint64_t v46 = "EXFAT_Rename: Got illegal fromName/toName [%s] [%s]\n";
        uint64_t HTForDirectory = 22;
        int v47 = v123;
        uint64_t v48 = v43;
        os_log_type_t v49 = OS_LOG_TYPE_ERROR;
        uint32_t v50 = 22;
LABEL_88:
        _os_log_impl(&dword_22C0F9000, v48, v49, v46, v47, v50);
LABEL_121:
        FILERECORD_MultiLock((char *)&v135, 4, 1, 0);
        FSOPS_FlushCacheAndFreeLck(v84);
        DIROPS_ReleaseHTForDirectory(a1, HTForDirectory != 0);
        DIROPS_ReleaseHTForDirectory(a4, HTForDirectory != 0);
        return HTForDirectory;
      }
      if (*(unsigned char *)(a2 + 424))
      {
        long long v23 = *(_OWORD *)(a2 + 360);
        long long v24 = *(_OWORD *)(a2 + 392);
        long long v25 = *(_OWORD *)(a2 + 408);
        long long v107 = *(_OWORD *)(a2 + 376);
        long long v108 = v24;
        long long v109 = v25;
        long long v26 = *(_OWORD *)(a2 + 296);
        long long v27 = *(_OWORD *)(a2 + 328);
        long long v28 = *(_OWORD *)(a2 + 344);
        long long v103 = *(_OWORD *)(a2 + 312);
        long long v104 = v27;
        long long v29 = *(_OWORD *)(a2 + 248);
        long long v105 = v28;
        long long v106 = v23;
        long long v30 = *(_OWORD *)(a2 + 264);
        long long v31 = *(_OWORD *)(a2 + 280);
        long long v99 = v29;
        long long v100 = v30;
        long long v101 = v31;
        long long v102 = v26;
        int v81 = *(unsigned __int8 *)(a2 + 444);
        HIDWORD(v110) = *(_DWORD *)(a2 + 208);
        unsigned int StartCluster = DIROPS_GetStartCluster((uint64_t)&v101);
        uint64_t v82 = *((void *)&v101 + 1);
        uint64_t v83 = *((void *)&v102 + 1);
        FILEOPS_GetAtrrFromDirEntry(a2, (uint64_t)&buf);
      }
      else
      {
        uint64_t v51 = DIROPS_LookForDirEntryByName(a1, a3, 0, (_DWORD *)&v110 + 1, (uint64_t)&v99);
        if (v51)
        {
          uint64_t HTForDirectory = v51;
          if (!gbIsLoggerInit) {
            goto LABEL_121;
          }
          uint64_t v52 = gpsExFatLog;
          uint64_t v53 = 3;
          if (v51 == 2) {
            uint64_t v53 = 0;
          }
          os_log_type_t v54 = gpeExfatToOsLevel[v53];
          if (!os_log_type_enabled((os_log_t)gpsExFatLog, v54)) {
            goto LABEL_121;
          }
          *(_DWORD *)v123 = 67109120;
          *(_DWORD *)&v123[4] = HTForDirectory;
          uint64_t v46 = "EXFAT_Rename: 'From' lookup ended with error [%d].\n";
          goto LABEL_142;
        }
        unsigned int StartCluster = DIROPS_GetStartCluster((uint64_t)&v101);
        uint64_t v82 = *((void *)&v101 + 1);
        uint64_t v83 = *((void *)&v102 + 1);
        *(void *)v123 = 0;
        uint64_t v57 = FILERECORD_AllocateRecord((void **)v123, 0, v84, StartCluster, *(_DWORD *)(a1 + 428), SHIDWORD(v110), &v99, 0);
        if (v57)
        {
          uint64_t HTForDirectory = v57;
          if (!gbIsLoggerInit) {
            goto LABEL_121;
          }
          uint64_t v58 = gpsExFatLog;
          if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
            goto LABEL_121;
          }
          LOWORD(v133) = 0;
          uint64_t v46 = "EXFAT_Rename failed to allocate record.\n";
LABEL_105:
          int v47 = (uint8_t *)&v133;
          uint64_t v48 = v58;
          os_log_type_t v49 = OS_LOG_TYPE_ERROR;
          uint32_t v50 = 2;
          goto LABEL_88;
        }
        int v81 = *(unsigned __int8 *)(*(void *)v123 + 444);
        FILEOPS_GetAtrrFromDirEntry(*(uint64_t *)v123, (uint64_t)&buf);
        FILERECORD_FreeRecord(*(char **)v123, 1);
      }
      if (a5 == a2) {
        goto LABEL_97;
      }
      if (a5 && *(unsigned char *)(a5 + 424))
      {
        long long v33 = *(_OWORD *)(a5 + 360);
        long long v34 = *(_OWORD *)(a5 + 392);
        long long v35 = *(_OWORD *)(a5 + 408);
        long long v96 = *(_OWORD *)(a5 + 376);
        long long v97 = v34;
        long long v98 = v35;
        long long v36 = *(_OWORD *)(a5 + 296);
        long long v37 = *(_OWORD *)(a5 + 328);
        long long v38 = *(_OWORD *)(a5 + 344);
        long long v92 = *(_OWORD *)(a5 + 312);
        long long v93 = v37;
        long long v39 = *(_OWORD *)(a5 + 248);
        long long v94 = v38;
        long long v95 = v33;
        long long v40 = *(_OWORD *)(a5 + 264);
        long long v41 = *(_OWORD *)(a5 + 280);
        long long v88 = v39;
        long long v89 = v40;
        long long v90 = v41;
        long long v91 = v36;
        int v42 = *(_DWORD *)(a5 + 208);
        LODWORD(v110) = v42;
      }
      else
      {
        uint64_t v55 = DIROPS_LookForDirEntryByName(a4, a6, 0, &v110, (uint64_t)&v88);
        if (v55)
        {
          uint64_t HTForDirectory = v55;
          if (v55 != 2)
          {
            if (!gbIsLoggerInit) {
              goto LABEL_121;
            }
            uint64_t v52 = gpsExFatLog;
            os_log_type_t v54 = OS_LOG_TYPE_ERROR;
            if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
              goto LABEL_121;
            }
            *(_DWORD *)v123 = 67109120;
            *(_DWORD *)&v123[4] = HTForDirectory;
            uint64_t v46 = "EXFAT_Rename: DIROPS_LookForDirEntry of 'to' returned an error [%d].\n";
            goto LABEL_142;
          }
          goto LABEL_97;
        }
        int v42 = v110;
      }
      int v61 = HIDWORD(v110);
      if (HIDWORD(v110) == v42)
      {
        if ((v42 - 5) <= 0xFFFFFFFC)
        {
          if (!gbIsLoggerInit) {
            goto LABEL_120;
          }
          uint64_t v62 = gpsExFatLog;
          if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
            goto LABEL_120;
          }
          *(_DWORD *)v123 = 67109376;
          *(_DWORD *)&v123[4] = v42;
          *(_WORD *)&v123[8] = 1024;
          *(_DWORD *)&v123[10] = v42;
          long long v63 = v62;
LABEL_119:
          _os_log_impl(&dword_22C0F9000, v63, OS_LOG_TYPE_ERROR, "EXFAT_Rename: Invalid objects ('From' is %d 'To' is %d).\n", v123, 0xEu);
LABEL_120:
          uint64_t HTForDirectory = 22;
          goto LABEL_121;
        }
      }
      else
      {
        if (HIDWORD(v110) == 2)
        {
          if (gbIsLoggerInit)
          {
            __int16 v64 = gpsExFatLog;
            if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v123 = 67109120;
              *(_DWORD *)&v123[4] = v42;
              _os_log_impl(&dword_22C0F9000, v64, OS_LOG_TYPE_ERROR, "EXFAT_Rename: 'To' is not a directory [eToRecId %d].\n", v123, 8u);
            }
          }
          uint64_t HTForDirectory = 20;
          goto LABEL_121;
        }
        if (v42 == 2)
        {
          if (gbIsLoggerInit)
          {
            unint64_t v65 = gpsExFatLog;
            if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v123 = 67109120;
              *(_DWORD *)&v123[4] = v61;
              _os_log_impl(&dword_22C0F9000, v65, OS_LOG_TYPE_ERROR, "EXFAT_Rename: 'To' is a directory [eFromRecId %d].\n", v123, 8u);
            }
          }
          uint64_t HTForDirectory = 21;
          goto LABEL_121;
        }
        if ((v42 - 5) < 0xFFFFFFFE || (HIDWORD(v110) - 5) <= 0xFFFFFFFD)
        {
          if (!gbIsLoggerInit) {
            goto LABEL_120;
          }
          uint64_t v78 = gpsExFatLog;
          if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
            goto LABEL_120;
          }
          *(_DWORD *)v123 = 67109376;
          *(_DWORD *)&v123[4] = v61;
          *(_WORD *)&v123[8] = 1024;
          *(_DWORD *)&v123[10] = v42;
          long long v63 = v78;
          goto LABEL_119;
        }
      }
      if (a1 == a4 && !strcmp(a6, a3))
      {
        if (gbIsLoggerInit)
        {
          unsigned int v80 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel[0]))
          {
            *(_WORD *)v123 = 0;
            _os_log_impl(&dword_22C0F9000, v80, (os_log_type_t)gpeExfatToOsLevel[0], "EXFAT_Rename: 'To' and 'From' are the same\n", v123, 2u);
          }
        }
        uint64_t HTForDirectory = 0;
        goto LABEL_121;
      }
      uint64_t v75 = DIROPS_GetStartCluster((uint64_t)&v90);
      *(void *)v123 = 0;
      if (a5)
      {
        *(void *)v123 = a5;
LABEL_150:
        if (v110 == 2)
        {
          uint64_t isDirEmpty = DIROPS_isDirEmpty(*(uint64_t *)v123);
          if (isDirEmpty)
          {
            uint64_t HTForDirectory = isDirEmpty;
            if (!a5) {
              FILERECORD_FreeRecord(*(char **)v123, 1);
            }
            if (!gbIsLoggerInit) {
              goto LABEL_121;
            }
            uint64_t v52 = gpsExFatLog;
            os_log_type_t v54 = OS_LOG_TYPE_ERROR;
            if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
              goto LABEL_121;
            }
            int v133 = 67109120;
            int v134 = HTForDirectory;
            uint64_t v46 = "EXFAT_Rename: DIROPS_isDirEmpty returned error %d.\n";
            goto LABEL_112;
          }
        }
        ++*(void *)(a4 + 504);
        if (a5 || !v75)
        {
          if (a5)
          {
            if (!*(unsigned char *)(a5 + 564))
            {
              *(unsigned char *)(a5 + 564) = 1;
              atomic_fetch_add((atomic_ullong *volatile)(v84 + 2632), 1uLL);
            }
LABEL_172:
            uint64_t v79 = DIROPS_MarkNodeDirEntriesAsDeleted((void *)a4, (uint64_t)&v88, a6);
            if (v79)
            {
              uint64_t HTForDirectory = v79;
              if (!gbIsLoggerInit) {
                goto LABEL_121;
              }
              uint64_t v52 = gpsExFatLog;
              os_log_type_t v54 = OS_LOG_TYPE_ERROR;
              if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
                goto LABEL_121;
              }
              int v133 = 67109120;
              int v134 = HTForDirectory;
              uint64_t v46 = "EXFAT_Rename: unable to remove 'to' file / record (iError %d).\n";
              goto LABEL_112;
            }
LABEL_97:
            *((void *)&buf + 1) &= 0xFFFFFFFFFFFFEC7ALL;
            uint64_t v56 = DIROPS_CreateNewEntry(a4, a6, (uint64_t)&buf, StartCluster, puRecordId2FaType[HIDWORD(v110)], v82, v83, v81 != 0, &v87);
            if (v56)
            {
              uint64_t HTForDirectory = v56;
              if (!gbIsLoggerInit) {
                goto LABEL_121;
              }
              uint64_t v52 = gpsExFatLog;
              os_log_type_t v54 = OS_LOG_TYPE_ERROR;
              if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
                goto LABEL_121;
              }
              *(_DWORD *)v123 = 67109120;
              *(_DWORD *)&v123[4] = HTForDirectory;
              uint64_t v46 = "EXFAT_Rename: unable to create new file / directory entry in destination dir (%d).\n";
            }
            else
            {
              long long v131 = 0u;
              long long v132 = 0u;
              long long v129 = 0u;
              long long v130 = 0u;
              long long v127 = 0u;
              long long v128 = 0u;
              long long v125 = 0u;
              long long v126 = 0u;
              long long v124 = 0u;
              memset(v123, 0, sizeof(v123));
              uint64_t FileDirEntryDataByOffset = DIROPS_GetFileDirEntryDataByOffset(a4, v87, (uint64_t)v123, a6);
              if (FileDirEntryDataByOffset)
              {
                uint64_t HTForDirectory = FileDirEntryDataByOffset;
                if (!gbIsLoggerInit) {
                  goto LABEL_121;
                }
                uint64_t v52 = gpsExFatLog;
                uint64_t v60 = 3;
                if (FileDirEntryDataByOffset == 2) {
                  uint64_t v60 = 0;
                }
                os_log_type_t v54 = gpeExfatToOsLevel[v60];
                if (!os_log_type_enabled((os_log_t)gpsExFatLog, v54)) {
                  goto LABEL_121;
                }
                int v133 = 67109120;
                int v134 = HTForDirectory;
                uint64_t v46 = "EXFAT_Rename: fail to lookup for new dir record [%d].\n";
LABEL_112:
                int v47 = (uint8_t *)&v133;
LABEL_143:
                uint64_t v48 = v52;
                os_log_type_t v49 = v54;
                uint32_t v50 = 8;
                goto LABEL_88;
              }
              long long v66 = *(_OWORD *)&v123[16];
              *(_OWORD *)(a2 + 248) = *(_OWORD *)v123;
              long long v67 = v130;
              long long v68 = v131;
              long long v69 = v128;
              *(_OWORD *)(a2 + 360) = v129;
              *(_OWORD *)(a2 + 376) = v67;
              long long v70 = v132;
              *(_OWORD *)(a2 + 392) = v68;
              *(_OWORD *)(a2 + 408) = v70;
              long long v71 = v126;
              long long v72 = v127;
              long long v73 = v124;
              *(_OWORD *)(a2 + 296) = v125;
              *(_OWORD *)(a2 + 312) = v71;
              *(_OWORD *)(a2 + 328) = v72;
              *(_OWORD *)(a2 + 344) = v69;
              *(_OWORD *)(a2 + 264) = v66;
              *(_OWORD *)(a2 + 280) = v73;
              *(unsigned char *)(a2 + 424) = 1;
              uint64_t v74 = *(void **)(a2 + 448);
              if (v74)
              {
                free(v74);
                *(void *)(a2 + 448) = 0;
              }
              CONV_DuplicateName((char *)(a2 + 448), a6);
              *(void *)(a2 + 224) = a4;
              uint64_t HTForDirectory = DIROPS_MarkNodeDirEntriesAsDeleted((void *)a1, (uint64_t)&v99, a3);
              ++*(void *)(a1 + 504);
              if (!HTForDirectory) {
                goto LABEL_121;
              }
              if (!gbIsLoggerInit) {
                goto LABEL_121;
              }
              uint64_t v52 = gpsExFatLog;
              os_log_type_t v54 = OS_LOG_TYPE_ERROR;
              if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
                goto LABEL_121;
              }
              *(_DWORD *)v123 = 67109120;
              *(_DWORD *)&v123[4] = HTForDirectory;
              uint64_t v46 = "EXFAT_Rename: unable to remove old file / directory entry (DIROPS_MarkNodeDirEntriesAsDeleted returned %d).\n";
            }
LABEL_142:
            int v47 = v123;
            goto LABEL_143;
          }
        }
        else
        {
          uint64_t HTForDirectory = FAT_Access_M_FATChainFree(v84, v75, 0, (unsigned char *)(*(void *)v123 + 444), *(_DWORD *)(*(void *)v123 + 436));
          if (HTForDirectory) {
            goto LABEL_121;
          }
        }
        FILERECORD_FreeRecord(*(char **)v123, 1);
        goto LABEL_172;
      }
      uint64_t v77 = FILERECORD_AllocateRecord((void **)v123, 0, v84, v75, *(_DWORD *)(a4 + 428), v110, &v88, a6);
      if (!v77) {
        goto LABEL_150;
      }
      uint64_t HTForDirectory = v77;
      if (!gbIsLoggerInit) {
        goto LABEL_121;
      }
      uint64_t v58 = gpsExFatLog;
      if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_121;
      }
      LOWORD(v133) = 0;
      uint64_t v46 = "EXFAT_Rename failed to allocate record.\n";
      goto LABEL_105;
    }
  }
  if (gbIsLoggerInit)
  {
    off_t v19 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
    {
      unsigned int v20 = strerror(HTForDirectory);
      *(_DWORD *)v123 = 136315138;
      *(void *)&v123[4] = v20;
      _os_log_impl(&dword_22C0F9000, v19, OS_LOG_TYPE_ERROR, "EXFAT_Rename: failed to create HT with error %s", v123, 0xCu);
    }
  }
  return HTForDirectory;
}

uint64_t FILEOPS_PreAllocateClusters(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  if (*(_DWORD *)(a1 + 208) == 3)
  {
    if ((a2[2] & 0x20) == 0)
    {
      uint64_t v4 = *a2;
      if (*a2)
      {
        if (gbIsLoggerInit)
        {
          long long v5 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 134217984;
            *(void *)int v42 = v4;
            _os_log_impl(&dword_22C0F9000, v5, OS_LOG_TYPE_ERROR, "FILEOPS_PreAllocateClusters: offset given wasn't 0 -  %lld\n", buf, 0xCu);
          }
        }
        return 22;
      }
      size_t v11 = (pthread_rwlock_t *)(a1 + 8);
      size_t v12 = *(void **)(a1 + 216);
      FSOPS_SetDirtyBitAndAcquireLck((uint64_t)v12);
      MultiReadSingleWrite_LockWrite(v11);
      uint64_t updated = 0;
      unint64_t v13 = v12[7];
      unint64_t v14 = v13 * *(unsigned int *)(a1 + 436);
      uint64_t v15 = a2[1];
      unint64_t v16 = v14 + v15;
      int v17 = *((_DWORD *)a2 + 4);
      uint64_t v40 = 0;
      unsigned int v39 = 0;
      if (v14 + v15 <= v14)
      {
LABEL_44:
        *(void *)(a3 + 24) = v13 * v39;
        MultiReadSingleWrite_FreeWrite(v11);
        FSOPS_FlushCacheAndFreeLck((uint64_t)v12);
        return updated;
      }
      long long v18 = *(_OWORD *)(a1 + 264);
      long long v19 = *(_OWORD *)(a1 + 280);
      v38[0] = *(_OWORD *)(a1 + 248);
      v38[1] = v18;
      long long v20 = *(_OWORD *)(a1 + 296);
      long long v36 = v19;
      long long v37 = v20;
      unint64_t v21 = (v13 + v15 - 1) / v13;
      if (v21)
      {
        unint64_t v33 = v14 + v15;
        long long v34 = v11;
        unsigned int v22 = *(_DWORD *)(a1 + 432);
        long long v23 = (unsigned char *)(a1 + 444);
        if (!v22)
        {
          *long long v23 = 1;
          BYTE1(v36) |= 2u;
        }
        long long v35 = 0;
        uint64_t v24 = FAT_Access_M_AllocateClusters((uint64_t)v12, v21, v22, (unsigned char *)(a1 + 444), (_DWORD *)&v40 + 1, (unsigned int *)&v40, (int *)&v39, (v17 & 4) == 0, 0, *(_DWORD *)(a1 + 428), &v35, 0);
        uint64_t updated = v24;
        unsigned int v25 = v39;
        if (!v39) {
          goto LABEL_31;
        }
        if (v39 >= v21)
        {
          if (v24)
          {
LABEL_31:
            size_t v11 = v34;
            goto LABEL_44;
          }
        }
        else if ((v17 & 4) != 0 || v24 != 28)
        {
          if (gbIsLoggerInit)
          {
            long long v26 = gpsExFatLog;
            if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 67109632;
              *(_DWORD *)int v42 = v21;
              *(_WORD *)&v42[4] = 1024;
              *(_DWORD *)&v42[6] = v25;
              __int16 v43 = 1024;
              int v44 = updated;
              _os_log_impl(&dword_22C0F9000, v26, OS_LOG_TYPE_ERROR, "FILEOPS_PreAllocateClusters, uNeedToAllocClusters %u, uAmountOfAllocatedClusters %u iErr %d\n", buf, 0x14u);
            }
          }
          if (updated) {
            uint64_t updated = updated;
          }
          else {
            uint64_t updated = 5;
          }
          goto LABEL_31;
        }
        if ((v32 & 1) == 0 && !*v23) {
          BYTE1(v36) &= ~2u;
        }
        pthread_mutex_lock((pthread_mutex_t *)(v12[251] + 8));
        if (!*(_DWORD *)(a1 + 428))
        {
          int v27 = HIDWORD(v40);
          *(_DWORD *)(a1 + 428) = HIDWORD(v40);
          DWORD1(v37) = v27;
        }
        *(_DWORD *)(a1 + 436) += v39;
        *(_DWORD *)(a1 + 432) = v40;
        size_t v11 = v34;
        long long v28 = (int *)v35;
        unint64_t v16 = v33;
        if (v35)
        {
          uint64_t v29 = v14;
          do
          {
            FILERECORD_UpdateNewAllocatedClustersInChain((void *)a1, *v28, v28[1], v29);
            long long v30 = v35;
            v29 += v12[7] * *((unsigned int *)v35 + 1);
            long long v35 = (void *)*((void *)v35 + 1);
            free(v30);
            long long v28 = (int *)v35;
          }
          while (v35);
        }
        pthread_mutex_unlock((pthread_mutex_t *)(v12[251] + 8));
      }
      uint64_t updated = DIROPS_UpdateDirectoryEntries(a1, (uint64_t)v38, &v36, 1, 0);
      if (!*(unsigned char *)(a1 + 504))
      {
        *(unsigned char *)(a1 + 504) = 1;
        atomic_fetch_add(v12 + 283, 1uLL);
      }
      *(_DWORD *)(a3 + 224) = 8;
      FILEOPS_FetchFileExtents(a1, v14, v16, a3 + 32, (int *)(a3 + 224));
      goto LABEL_44;
    }
    if (gbIsLoggerInit)
    {
      unint64_t v8 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_22C0F9000, v8, OS_LOG_TYPE_ERROR, "FILEOPS_PreAllocateClusters: Not supporting LI_PREALLOCATE_ALLOCATEFROMVOL mode\n", buf, 2u);
      }
    }
    return 45;
  }
  else
  {
    if (gbIsLoggerInit)
    {
      unint64_t v7 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_22C0F9000, v7, OS_LOG_TYPE_ERROR, "FILEOPS_PreAllocateClusters: Cannot change size of a directory or symlink\n", buf, 2u);
      }
    }
    return 1;
  }
}

uint64_t CONV_UTF8ToUnistr255(unsigned __int8 *a1, uint64_t a2, _WORD *a3)
{
  uint64_t v4 = a3 + 1;
  if (!a2)
  {
    uint64_t result = 0;
    LODWORD(v10) = a3 + 2;
    goto LABEL_92;
  }
  uint64_t v5 = a2;
  signed int v7 = 0;
  unint64_t v8 = (unint64_t)(a3 + 256);
  uint64_t v9 = (char *)&__CFUniCharPrecompSourceTable;
  size_t v10 = a3 + 1;
  do
  {
    size_t v11 = a1;
    while (1)
    {
      unsigned int v13 = *a1++;
      unint64_t v12 = v13;
      if (!v13) {
        goto LABEL_88;
      }
      if ((unint64_t)v10 >= v8)
      {
LABEL_91:
        uint64_t result = 63;
        goto LABEL_92;
      }
      --v5;
      if ((v12 & 0x80) == 0)
      {
        signed int v46 = v7;
        if (v5) {
          goto LABEL_34;
        }
        if (v12 == 32)
        {
          LOWORD(v12) = -4056;
        }
        else
        {
          if (v12 != 46)
          {
LABEL_34:
            if (v12 > 0x1F)
            {
              int v27 = mac2sfm[(v12 - 32)];
              if (v27 != v12) {
                LOWORD(v12) = v27 | 0xF000;
              }
            }
            else
            {
              LOWORD(v12) = v12 | 0xF000;
            }
            goto LABEL_42;
          }
          LOWORD(v12) = -4055;
        }
LABEL_42:
        long long v28 = v9;
        unsigned __int16 v29 = v12;
        goto LABEL_43;
      }
      uint64_t v14 = utf_extrabytes[v12 >> 3];
      if ((v14 & 0x80000000) != 0 || (int)v5 < (int)v14) {
        goto LABEL_27;
      }
      v5 -= v14;
      if (v14 == 3)
      {
        int v17 = *a1;
        if ((v17 & 0xC0) == 0x80)
        {
          int v18 = v11[2];
          if ((v18 & 0xC0) == 0x80)
          {
            int v19 = v11[3];
            if ((v19 & 0xC0) == 0x80)
            {
              unsigned int v20 = v19 + (((v17 << 6) + (v12 << 12) + v18) << 6) - 63512704;
              if (!(v20 >> 20))
              {
                *size_t v10 = (v20 >> 10) - 10240;
                if ((unint64_t)(v10 + 1) >= v8)
                {
                  uint64_t result = 63;
                  LODWORD(v10) = v10 + 2;
                  goto LABEL_92;
                }
                a1 = v11 + 4;
                v10[1] = v20 & 0x3FF | 0xDC00;
                uint64_t v21 = 2;
                goto LABEL_31;
              }
            }
          }
        }
        goto LABEL_27;
      }
      if (v14 != 2)
      {
        if (v14 != 1)
        {
          uint64_t result = 22;
          goto LABEL_92;
        }
        int v15 = *a1;
        if ((v15 & 0xC0) == 0x80)
        {
          unsigned int v16 = v15 + (v12 << 6) - 12416;
          if (v16 >= 0x80)
          {
            long long v30 = v9;
            uint64_t v31 = 2;
            goto LABEL_51;
          }
        }
        goto LABEL_27;
      }
      int v22 = *a1;
      if ((v22 & 0xC0) == 0x80)
      {
        int v23 = v11[2];
        if ((v23 & 0xC0) == 0x80)
        {
          int v24 = (v22 << 6) + (v12 << 12) + v23;
          unsigned int v16 = v24 - 925824;
          if ((v24 - 925824) >= 0x800
            && (v16 >> 11 < 0x1B || v16 >= 0xE000 && (v24 & 0x3FFFFE) != 0xF207E))
          {
            break;
          }
        }
      }
LABEL_27:
      if ((unint64_t)(v10 + 2) >= v8) {
        goto LABEL_91;
      }
      unsigned __int16 v25 = hexdigits[v12 >> 4];
      unsigned __int16 v26 = hexdigits[v12 & 0xF];
      *size_t v10 = 37;
      if ((int)v14 <= 0) {
        uint64_t v14 = 0;
      }
      v5 += v14;
      v10[1] = v25;
      _DWORD v10[2] = v26;
      uint64_t v21 = 3;
LABEL_31:
      v10 += v21;
      size_t v11 = a1;
      if (!v5) {
        goto LABEL_88;
      }
    }
    long long v30 = v9;
    uint64_t v31 = 3;
LABEL_51:
    signed int v46 = v7;
    if (v10 == v4)
    {
      size_t v10 = v4;
      goto LABEL_82;
    }
    uint64_t v45 = v31;
    if (!unicode_combinable((unsigned __int16)v16)) {
      goto LABEL_81;
    }
    unsigned int v32 = *(v10 - 1);
    if ((unsigned __int16)(v16 - 4449) > 0x61u)
    {
      if ((unsigned __int16)(v16 - 12443) < 0xD265u) {
        goto LABEL_81;
      }
    }
    else
    {
      if ((unsigned __int16)((unsigned __int16)v16 >> 1) <= 0x8BAu && (unsigned __int16)(v32 - 4352) <= 0x12u)
      {
        LOWORD(v32) = 588 * v32 + 28 * v16 - 18076;
LABEL_57:
        uint64_t v31 = v45;
        goto LABEL_58;
      }
      if ((unsigned __int16)((unsigned __int16)v16 >> 3) >= 0x235u
        && (unsigned __int16)((unsigned __int16)(v32 + 21504) >> 2) <= 0xAE8u)
      {
        HIDWORD(v37) = -1227133513 * v32 - 1840706560;
        LODWORD(v37) = HIDWORD(v37);
        if ((v37 >> 2) <= 0x9249249)
        {
          LOWORD(v32) = v16 + v32 - 4519;
          goto LABEL_57;
        }
LABEL_81:
        uint64_t v31 = v45;
        goto LABEL_82;
      }
    }
    unint64_t v33 = v30 + 416;
    long long v34 = v30;
    while (2)
    {
      uint64_t v35 = (v33 - v34) >> 4;
      long long v36 = &v34[8 * v35];
      if (*(_DWORD *)v36 > (unsigned __int16)v16)
      {
        unint64_t v33 = v36 - 8;
        goto LABEL_67;
      }
      if (*(_DWORD *)v36 < (unsigned __int16)v16)
      {
        long long v34 = v36 + 8;
LABEL_67:
        if (v34 > v33) {
          goto LABEL_81;
        }
        continue;
      }
      break;
    }
    int v38 = *(_DWORD *)&v34[8 * v35 + 4];
    if (!v38) {
      goto LABEL_81;
    }
    unsigned int v39 = (char *)&__CFUniCharBMPPrecompDestinationTable + 4 * (unsigned __int16)v38;
    if (*(unsigned __int16 *)v39 > v32) {
      goto LABEL_81;
    }
    uint64_t v40 = (unsigned __int16 *)&v39[4 * HIWORD(v38) - 4];
    if (*v40 < v32) {
      goto LABEL_81;
    }
    while (2)
    {
      uint64_t v41 = ((char *)v40 - v39) >> 3;
      int v42 = (unsigned __int16 *)&v39[4 * v41];
      unsigned int v43 = *v42;
      if (v43 > v32)
      {
        uint64_t v40 = v42 - 2;
        goto LABEL_80;
      }
      if (v43 < v32)
      {
        unsigned int v39 = (char *)(v42 + 2);
LABEL_80:
        if (v39 > (char *)v40) {
          goto LABEL_81;
        }
        continue;
      }
      break;
    }
    unsigned int v32 = *(unsigned __int16 *)&v39[4 * v41 + 2];
    uint64_t v31 = v45;
    if (!v32) {
      goto LABEL_82;
    }
LABEL_58:
    unsigned int v16 = (unsigned __int16)v32;
    --v10;
LABEL_82:
    long long v28 = v30;
    a1 = &v11[v31];
    if (v16 == 9216) {
      unsigned __int16 v29 = 0;
    }
    else {
      unsigned __int16 v29 = v16;
    }
LABEL_43:
    if (unicode_combinable(v29))
    {
      signed int v7 = v46 + 1;
      uint64_t v9 = v28;
    }
    else
    {
      uint64_t v9 = v28;
      if (v46 >= 2)
      {
        priortysort(&v10[-v46], v46);
        uint64_t v9 = v28;
      }
      signed int v7 = 0;
    }
    *v10++ = v29;
  }
  while (v5);
LABEL_88:
  if (v7 >= 2) {
    priortysort(&v10[-v7], v7);
  }
  uint64_t result = 0;
LABEL_92:
  *a3 = (v10 - v4) >> 1;
  return result;
}

uint64_t unicode_combinable(unsigned int a1)
{
  if (a1 < 0x300) {
    return 0;
  }
  int v1 = __CFUniCharCombiningBitmap[(unint64_t)a1 >> 8];
  if (!__CFUniCharCombiningBitmap[(unint64_t)a1 >> 8]) {
    return 0;
  }
  if (v1 == 255) {
    return 1;
  }
  return (__CFUniCharCombiningBitmap[(a1 >> 3) + 256 + 32 * v1 - 32] >> (a1 & 7)) & 1;
}

_WORD *priortysort(_WORD *result, unsigned int a2)
{
  do
  {
    if (__CFUniCharCombiningPropertyBitmap[(unint64_t)(unsigned __int16)*result >> 8]) {
      unsigned int v2 = __CFUniCharCombiningPropertyBitmap[256
    }
                                            * (unint64_t)__CFUniCharCombiningPropertyBitmap[(unint64_t)(unsigned __int16)*result >> 8]
                                            + *result];
    else {
      unsigned int v2 = 0;
    }
    if (a2 < 2) {
      break;
    }
    int v3 = 0;
    uint64_t v4 = result + 1;
    do
    {
      unint64_t v5 = (unsigned __int16)*v4;
      uint64_t v6 = __CFUniCharCombiningPropertyBitmap[v5 >> 8];
      if (__CFUniCharCombiningPropertyBitmap[v5 >> 8]) {
        LODWORD(v6) = __CFUniCharCombiningPropertyBitmap[256 * v6 + *v4];
      }
      if (v2 > v6)
      {
        __int16 v7 = *(v4 - 1);
        *(v4 - 1) = v5;
        *uint64_t v4 = v7;
        int v3 = 1;
      }
      ++v4;
      unsigned int v2 = v6;
    }
    while (v4 < &result[a2]);
  }
  while (v3);
  return result;
}

uint64_t CONV_Unistr255ToUTF8(_WORD *a1, unsigned char *a2, uint64_t a3)
{
  int v3 = a2;
  uint64_t v26 = *MEMORY[0x263EF8340];
  int v4 = (unsigned __int16)*a1;
  if (*a1)
  {
    int v5 = 0;
    uint64_t v6 = 0;
    unsigned int v7 = 0;
    unint64_t v8 = (unint64_t)&a2[a3 - 1];
    uint64_t v9 = a1 + 1;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          while (1)
          {
            --v4;
            if (v5 < 1)
            {
              unsigned int v12 = *v9++;
              unint64_t v10 = v12;
              if (v12 >= 0xC0uLL)
              {
                int v13 = __CFUniCharDecomposableBitmap[v10 >> 8];
                if (__CFUniCharDecomposableBitmap[v10 >> 8])
                {
                  if (v13 == 255
                    || ((__CFUniCharDecomposableBitmap[(v10 >> 3) + 256 + 32 * v13 - 32] >> (v10 & 7)) & 1) != 0)
                  {
                    unsigned __int16 v14 = v10 + 21504;
                    if ((unsigned __int16)(v10 + 21504) > 0x2BA4u)
                    {
                      int v16 = unicode_recursive_decompose(v10, &v24);
                      LODWORD(v10) = v24;
                    }
                    else
                    {
                      __int16 v15 = (unsigned __int16)(v10 + 21504) % 0x1Cu;
                      LODWORD(v10) = ((28533 * (unsigned __int16)(v10 + 21504)) >> 24) | 0x1100;
                      unsigned __int16 v24 = ((28533 * v14) >> 24) | 0x1100;
                      v25[0] = v14 % 0x24Cu / 0x1C + 4449;
                      if (v14 % 0x1Cu)
                      {
                        v25[1] = v15 + 4519;
                        int v16 = 3;
                      }
                      else
                      {
                        int v16 = 2;
                      }
                    }
                    int v5 = v16 - 1;
                    v4 += v16 - 1;
                    uint64_t v6 = v25;
                  }
                }
              }
            }
            else
            {
              int v11 = *v6++;
              LODWORD(v10) = v11;
              --v5;
            }
            if (v10) {
              unsigned int v17 = v10;
            }
            else {
              unsigned int v17 = 9216;
            }
            if (v10 == 47)
            {
              unsigned int v7 = 22;
              unsigned int v17 = 95;
            }
            if (v17 > 0x7F) {
              break;
            }
            if ((unint64_t)v3 >= v8) {
              goto LABEL_49;
            }
            *v3++ = v17;
            if (!v4) {
              goto LABEL_51;
            }
          }
          if (v17 > 0x7FF) {
            break;
          }
          if ((unint64_t)(v3 + 1) >= v8) {
            goto LABEL_49;
          }
          unsigned char *v3 = (v17 >> 6) | 0xC0;
          v3[1] = v17 & 0x3F | 0x80;
          v3 += 2;
          if (!v4) {
            goto LABEL_51;
          }
        }
        if (v17 > 0xFFFD)
        {
          unsigned int v7 = 22;
          goto LABEL_51;
        }
        if (v17 >> 10 != 54 || v4 == 0) {
          break;
        }
        int v19 = *v9;
        if ((v19 & 0xFC00) == 0xDC00)
        {
          if ((unint64_t)(v3 + 3) >= v8) {
            goto LABEL_49;
          }
          unsigned int v20 = v19 + (v17 << 10) - 56613888;
          --v4;
          ++v9;
          unsigned char *v3 = (v20 >> 18) | 0xF0;
          v3[1] = (v20 >> 12) & 0x3F | 0x80;
          _DWORD v3[2] = (v20 >> 6) & 0x3F | 0x80;
          v3[3] = v19 & 0x3F | 0x80;
          v3 += 4;
          if (!v4) {
            goto LABEL_51;
          }
        }
        else
        {
          unsigned int v21 = v17 >> 6;
          LOBYTE(v22) = 13;
LABEL_45:
          if ((unint64_t)(v3 + 2) >= v8)
          {
LABEL_49:
            unsigned int v7 = 63;
            goto LABEL_51;
          }
          unsigned char *v3 = v22 | 0xE0;
          v3[1] = v21 & 0x3F | 0x80;
          _DWORD v3[2] = v17 & 0x3F | 0x80;
          v3 += 3;
          if (!v4) {
            goto LABEL_51;
          }
        }
      }
      if ((v17 & 0xFFC0) != 0xF000 || (v17 & 0x3F) >= 0x2B)
      {
        unsigned int v21 = v17 >> 6;
        unsigned int v22 = v17 >> 12;
        goto LABEL_45;
      }
      if ((unint64_t)v3 >= v8) {
        goto LABEL_49;
      }
      *v3++ = sfm2mac[v17 & 0x3F];
      if (!v4) {
        goto LABEL_51;
      }
    }
  }
  unsigned int v7 = 0;
LABEL_51:
  unsigned char *v3 = 0;
  return v7;
}

_WORD *CONV_Unistr255ToUpperCase(_WORD *result, uint64_t a2)
{
  uint64_t v2 = (unsigned __int16)*result;
  if (*result)
  {
    unint64_t v3 = *(void *)(a2 + 2056);
    int v4 = result + 1;
    do
    {
      unint64_t v5 = (unsigned __int16)*v4;
      if (v3 > v5) {
        *int v4 = *(_WORD *)(*(void *)(a2 + 2048) + 2 * v5);
      }
      ++v4;
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t CONV_UnistrUTF8ToUpperCase(char *a1, unsigned char *a2, uint64_t a3)
{
  uint64_t result = 22;
  if (a1 && a2)
  {
    unsigned int v7 = malloc_type_malloc(0x200uLL, 0x10000407EBBDD04uLL);
    if (v7)
    {
      unint64_t v8 = v7;
      size_t v9 = strlen(a1);
      CONV_UTF8ToUnistr255((unsigned __int8 *)a1, v9, v8);
      uint64_t v10 = (unsigned __int16)*v8;
      if (*v8)
      {
        unint64_t v11 = *(void *)(a3 + 2056);
        unsigned int v12 = v8 + 1;
        do
        {
          unint64_t v13 = (unsigned __int16)*v12;
          if (v11 > v13) {
            *unsigned int v12 = *(_WORD *)(*(void *)(a3 + 2048) + 2 * v13);
          }
          ++v12;
          --v10;
        }
        while (v10);
      }
      CONV_Unistr255ToUTF8(v8, a2, 766);
      free(v8);
      return 0;
    }
    else
    {
      return 12;
    }
  }
  return result;
}

uint64_t CONV_GetCurrentTime(timespec *__tp)
{
  return clock_gettime(_CLOCK_REALTIME, __tp);
}

char *CONV_DuplicateName(char *result, char *__s)
{
  *(void *)uint64_t result = 0;
  if (__s)
  {
    unint64_t v3 = result;
    size_t v4 = strlen(__s) + 1;
    uint64_t result = (char *)malloc_type_malloc(v4, 0x446E67DFuLL);
    *(void *)unint64_t v3 = result;
    if (result)
    {
      return (char *)strlcpy(result, __s, v4);
    }
  }
  return result;
}

uint64_t unicode_recursive_decompose(unsigned int a1, _WORD *a2)
{
  uint64_t v2 = a2;
  if ((unsigned __int16)(a1 + 1201) < 0x571u)
  {
LABEL_8:
    unsigned int v8 = 0;
    goto LABEL_9;
  }
  unint64_t v3 = (unsigned __int16 *)&__CFUniCharDecompositionTable;
  size_t v4 = (unsigned __int16 *)&unk_22C119DB8;
  while (1)
  {
    uint64_t v5 = ((char *)v4 - (char *)v3) >> 3;
    uint64_t v6 = &v3[2 * v5];
    unsigned int v7 = *v6;
    if (v7 <= a1) {
      break;
    }
    size_t v4 = v6 - 2;
LABEL_7:
    if (v3 > v4) {
      goto LABEL_8;
    }
  }
  if (v7 < a1)
  {
    unint64_t v3 = v6 + 2;
    goto LABEL_7;
  }
  unsigned int v8 = v3[2 * v5 + 1];
LABEL_9:
  int v9 = (v8 >> 12) & 7;
  __int16 v15 = v8 & 0xFFF;
  uint64_t v10 = (char *)&__CFUniCharMultipleDecompositionTable + 2 * (v8 & 0xFFF);
  unint64_t v11 = (unsigned __int16 *)&v15;
  if (v9 != 1) {
    unint64_t v11 = (unsigned __int16 *)((char *)&__CFUniCharMultipleDecompositionTable + 2 * (v8 & 0xFFF));
  }
  if ((v8 & 0x8000) == 0)
  {
    LODWORD(result) = 0;
    goto LABEL_17;
  }
  uint64_t result = unicode_recursive_decompose(*v11, a2);
  if (result)
  {
    --v9;
    unint64_t v13 = &v15;
    if (v9) {
      unint64_t v13 = (__int16 *)v10;
    }
    unint64_t v11 = (unsigned __int16 *)(v13 + 1);
    v2 += result;
LABEL_17:
    for (uint64_t result = (result + v9); v9; --v9)
    {
      __int16 v14 = *v11++;
      *v2++ = v14;
    }
  }
  return result;
}

uint64_t DIROPS_GetStartCluster(uint64_t a1)
{
  return *(unsigned int *)(a1 + 20);
}

uint64_t DIROPS_VolumeOffsetForCluster(uint64_t a1, int a2)
{
  return *(void *)(a1 + 64) + *(void *)(a1 + 56) * (a2 - 2);
}

uint64_t DIROPS_VolumeOffsetForDirBlock(uint64_t a1, int a2)
{
  return *(void *)(a1 + 64) + *(void *)(a1 + 40) * (a2 - *(_DWORD *)(a1 + 84));
}

uint64_t DIROPS_ChecksumFileSet(uint64_t a1, unsigned __int16 a2, _DWORD *a3, unsigned int a4)
{
  unint64_t v4 = 32 * a4;
  for (unint64_t i = *a3; v4 > i; *a3 = i)
  {
    if ((i & 0xFFFFFFFE) != 2) {
      a2 = ((a2 >> 1) | (a2 << 15)) + *(unsigned __int8 *)(a1 + (i & 0x1F));
    }
    unint64_t i = (i + 1);
  }
  return a2;
}

uint64_t DIROPS_GetFileDirEntryDataByOffset(uint64_t a1, unint64_t a2, uint64_t a3, char *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  unsigned int v8 = (unsigned __int16 *)malloc_type_calloc(1uLL, 0x200uLL, 0x10000407EBBDD04uLL);
  int v9 = (unsigned __int16 *)malloc_type_calloc(1uLL, 0x200uLL, 0x10000407EBBDD04uLL);
  uint64_t v10 = v9;
  unsigned int v19 = 0;
  if (v8 && v9)
  {
    *(_OWORD *)(a3 + 144) = 0u;
    *(_OWORD *)(a3 + 160) = 0u;
    *(_OWORD *)(a3 + 112) = 0u;
    *(_OWORD *)(a3 + 128) = 0u;
    *(_OWORD *)(a3 + 80) = 0u;
    *(_OWORD *)(a3 + 96) = 0u;
    *(_OWORD *)(a3 + 48) = 0u;
    *(_OWORD *)(a3 + 64) = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)a3 = 0u;
    int DirEntryByOffset = DIROPS_GetDirEntryByOffset(a1, a2, &v20, (unsigned __int8 *)a3, v9, 0, 0, &v19);
    if (v19 || DirEntryByOffset == 17)
    {
      size_t v14 = strlen(a4);
      uint64_t v15 = CONV_UTF8ToUnistr255((unsigned __int8 *)a4, v14, v8);
      if (v15)
      {
        uint64_t v12 = v15;
        if (gbIsLoggerInit)
        {
          int v16 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 136315138;
            unsigned int v22 = "DIROPS_GetFileDirEntryDataByOffset";
            _os_log_impl(&dword_22C0F9000, v16, OS_LOG_TYPE_ERROR, "%s: failed to convert utf8 -> utf16", buf, 0xCu);
          }
        }
      }
      else
      {
        uint64_t v17 = *v8;
        if (v17 == *v10 && !memcmp(v10 + 1, v8 + 1, 2 * v17))
        {
          uint64_t v12 = 0;
        }
        else
        {
          if (gbIsLoggerInit)
          {
            int v18 = gpsExFatLog;
            if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)long long buf = 136315138;
              unsigned int v22 = "DIROPS_GetFileDirEntryDataByOffset";
              _os_log_impl(&dword_22C0F9000, v18, OS_LOG_TYPE_FAULT, "%s: unexpected name", buf, 0xCu);
            }
          }
          uint64_t v12 = 22;
        }
      }
    }
    else
    {
      uint64_t v12 = 2;
    }
  }
  else
  {
    uint64_t v12 = 12;
    if (!v9) {
      goto LABEL_8;
    }
  }
  free(v10);
LABEL_8:
  if (v8) {
    free(v8);
  }
  return v12;
}

uint64_t DIROPS_GetDirEntryByOffset(uint64_t a1, unint64_t a2, void *a3, unsigned __int8 *a4, _WORD *a5, _DWORD *a6, int a7, unsigned int *a8)
{
  uint64_t v121 = *MEMORY[0x263EF8340];
  long long v115 = a6;
  uint64_t v9 = *(void *)(a1 + 216);
  unint64_t v10 = *(void *)(v9 + 56);
  unint64_t v11 = *(void *)(v9 + 40);
  *((void *)a4 + 9) = a2;
  unint64_t v12 = a2 / v11;
  *a8 = 0;
  if ((a2 / v11) / (v10 / v11) == *(_DWORD *)(a1 + 436)) {
    return 27;
  }
  unint64_t v113 = v10 / v11;
  int v16 = a6;
  if (!a6)
  {
    int v24 = a7;
    unint64_t v25 = v10;
    uint64_t v26 = a3;
    int v27 = a8;
    unsigned int DirBlockBuffer = DIROPS_AllocateDirBlockBuffer(v9, (void **)&v115);
    a8 = v27;
    *int v27 = DirBlockBuffer;
    if (DirBlockBuffer)
    {
      if (gbIsLoggerInit)
      {
        unsigned int v29 = DirBlockBuffer;
        long long v30 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 136315394;
          *(void *)long long v117 = "DIROPS_GetDirEntryByOffset";
          *(_WORD *)&v117[8] = 1024;
          unsigned int v118 = v29;
          _os_log_impl(&dword_22C0F9000, v30, OS_LOG_TYPE_ERROR, "%s: Failed to allocate dir block, error = %d.", buf, 0x12u);
        }
      }
      return 26;
    }
    int v16 = v115;
    a3 = v26;
    unint64_t v10 = v25;
    a7 = v24;
  }
  int v17 = v12;
  int v18 = v16[4];
  if (!v18 || v16[5] != v12)
  {
    unsigned int v19 = a3;
    int v20 = a7;
    unsigned int v21 = a8;
    unsigned int DirBlockRelative = DIROPS_GetDirBlockRelative(a1, v12, (uint64_t *)&v115, a7);
    unsigned int *v21 = DirBlockRelative;
    if (DirBlockRelative)
    {
      if (gbIsLoggerInit)
      {
        uint64_t v23 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 136315138;
          *(void *)long long v117 = "DIROPS_GetDirEntryByOffset";
LABEL_10:
          _os_log_impl(&dword_22C0F9000, v23, OS_LOG_TYPE_ERROR, "%s: Failed to get dir block.", buf, 0xCu);
        }
      }
      goto LABEL_11;
    }
    a8 = v21;
    int v16 = v115;
    int v18 = v115[4];
    a3 = v19;
    a7 = v20;
    int v17 = v12;
  }
  unint64_t v31 = a2 - v12 * v11;
  unsigned int v32 = (unsigned __int8 *)(*(void *)v16 + v31);
  int v33 = *v32;
  if (!*v32)
  {
    *a3 = -1;
LABEL_22:
    uint64_t v13 = 27;
    goto LABEL_43;
  }
  if ((v33 & 0x80) == 0)
  {
    *a3 = a2 + 32;
    uint64_t v13 = 16;
    goto LABEL_43;
  }
  if (*v32 > 0x9Fu)
  {
    if ((v33 - 161) < 2)
    {
      unsigned __int8 v34 = 0;
      int v35 = 0;
      long long v38 = *((_OWORD *)v32 + 1);
      *(_OWORD *)a4 = *(_OWORD *)v32;
      *((_OWORD *)a4 + 1) = v38;
      unsigned int v37 = 1;
      uint64_t v13 = 22;
      goto LABEL_42;
    }
    if (v33 == 160)
    {
      unsigned __int8 v34 = 0;
      int v35 = 0;
      long long v39 = *((_OWORD *)v32 + 1);
      *(_OWORD *)a4 = *(_OWORD *)v32;
      *((_OWORD *)a4 + 1) = v39;
      unsigned int v37 = 1;
      uint64_t v13 = 21;
      goto LABEL_42;
    }
  }
  else
  {
    switch(v33)
    {
      case 129:
        unsigned __int8 v34 = 0;
        int v35 = 0;
        long long v40 = *((_OWORD *)v32 + 1);
        *(_OWORD *)a4 = *(_OWORD *)v32;
        *((_OWORD *)a4 + 1) = v40;
        unsigned int v37 = 1;
        uint64_t v13 = 20;
        goto LABEL_42;
      case 130:
        unsigned __int8 v34 = 0;
        int v35 = 0;
        long long v44 = *((_OWORD *)v32 + 1);
        *(_OWORD *)a4 = *(_OWORD *)v32;
        *((_OWORD *)a4 + 1) = v44;
        unsigned int v37 = 1;
        uint64_t v13 = 19;
        goto LABEL_42;
      case 131:
        unsigned __int8 v34 = 0;
        int v35 = 0;
        long long v36 = *((_OWORD *)v32 + 1);
        *(_OWORD *)a4 = *(_OWORD *)v32;
        *((_OWORD *)a4 + 1) = v36;
        unsigned int v37 = 1;
        uint64_t v13 = 18;
LABEL_42:
        *((void *)a4 + 8) = v10;
        *((void *)a4 + 10) = v31;
        *((void *)a4 + 11) = v37;
        *((_DWORD *)a4 + 24) = v18;
        *((_DWORD *)a4 + 25) = v35;
        a4[168] = v34;
        *a3 = a2 + 32 * v37;
        goto LABEL_43;
    }
  }
  if ((v33 & 0x40) != 0)
  {
    if (gbIsLoggerInit)
    {
      signed int v46 = gpsExFatLog;
      int v47 = a3;
      BOOL v48 = os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR);
      a3 = v47;
      if (v48)
      {
        *(_DWORD *)long long buf = 134217984;
        *(void *)long long v117 = a2;
        _os_log_impl(&dword_22C0F9000, v46, OS_LOG_TYPE_ERROR, "DIROPS_GetDirEntryByOffset: Got secondary entry without a primary one. offset = %llu.", buf, 0xCu);
        a3 = v47;
      }
    }
    *a3 = a2 + 32;
    goto LABEL_50;
  }
  if (v33 != 133 && (v33 & 0x20) == 0)
  {
    if (gbIsLoggerInit)
    {
      uint64_t v41 = gpsExFatLog;
      int v42 = a8;
      BOOL v43 = os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR);
      a8 = v42;
      if (v43)
      {
        *(_DWORD *)long long buf = 67109120;
        *(_DWORD *)long long v117 = v33;
        _os_log_impl(&dword_22C0F9000, v41, OS_LOG_TYPE_ERROR, "DIROPS_GetDirEntryByOffset: Unrecognized primary entry of type 0x%x.", buf, 8u);
        a8 = v42;
      }
    }
    *a8 = 22;
    goto LABEL_11;
  }
  unint64_t v49 = v32[1];
  unsigned int v99 = v49 + 1;
  unint64_t v50 = a2 + 32 * (v49 + 1);
  uint64_t v51 = pthread_mutexattr_destroy;
  unint64_t v105 = v50;
  unint64_t v106 = v49;
  unint64_t v98 = v31;
  int v104 = a7;
  if (v49 >= 0x24)
  {
    if (gbIsLoggerInit)
    {
      log = gpsExFatLog;
      int v52 = v17;
      uint64_t v53 = a3;
      os_log_type_t v54 = a8;
      BOOL v55 = os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR);
      uint64_t v51 = pthread_mutexattr_destroy;
      unint64_t v50 = v105;
      int v17 = v52;
      a8 = v54;
      a7 = v104;
      unint64_t v31 = v98;
      a3 = v53;
      if (v55)
      {
        *(_DWORD *)long long buf = 67109120;
        *(_DWORD *)long long v117 = v106;
        _os_log_impl(&dword_22C0F9000, log, OS_LOG_TYPE_ERROR, "DIROPS_GetDirEntryByOffset: unexpected secondaryCount %u", buf, 8u);
        uint64_t v51 = pthread_mutexattr_destroy;
        unint64_t v50 = v105;
        int v17 = v52;
        a8 = v54;
        a7 = v104;
        unint64_t v31 = v98;
        a3 = v53;
      }
    }
  }
  unint64_t v56 = 0;
  int v100 = 0;
  int v57 = 0;
  uint64_t v107 = 0;
  unsigned int v103 = 0;
  unint64_t v58 = 0;
  long long v101 = 0;
  uint64_t v59 = v99;
  uint64_t v60 = 32;
  int v96 = *((void *)v51 + 56);
  unint64_t v61 = v31;
  unint64_t v62 = v106;
  long long v102 = a3;
  while (1)
  {
    unint64_t v63 = 32 * v56 + 32;
    if (v50 > *(void *)(a1 + 544) && v63 > v58)
    {
      do
      {
        if ((v58 & 0xFFFFFFFE) != 2) {
          int v57 = (((unsigned __int16)v57 >> 1) | (v57 << 15)) + v32[v58 & 0x1F];
        }
        ++v58;
      }
      while (v63 > v58);
      unint64_t v58 = v60;
    }
    if (v56 != 1)
    {
      if (v56)
      {
        if ((int)v56 - 2 >= v107) {
          goto LABEL_77;
        }
        int v70 = *v32;
        if (v70 == 193)
        {
          long long v71 = *(_OWORD *)(v32 + 2);
          long long v72 = &a5[v100];
          *((_OWORD *)v72 + 1) = *((_OWORD *)v32 + 1);
          *(_OWORD *)(v72 + 1) = v71;
          v100 += 15;
          goto LABEL_77;
        }
        __int16 v85 = a3;
        if (gbIsLoggerInit)
        {
          uint64_t v91 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = v96;
            *(_DWORD *)long long v117 = v70;
            unint64_t v87 = "DIROPS_GetDirEntryByOffset: dir entry is expected to be of type EXFAT_DIR_FILENAME, but type = 0x%x.";
            long long v88 = v91;
            goto LABEL_116;
          }
        }
      }
      else
      {
        int v65 = *v32;
        if (v65 == 133)
        {
          long long v66 = *((_OWORD *)v32 + 1);
          *(_OWORD *)a4 = *(_OWORD *)v32;
          *((_OWORD *)a4 + 1) = v66;
          long long v101 = a4;
          goto LABEL_77;
        }
        __int16 v85 = a3;
        if (gbIsLoggerInit)
        {
          uint64_t v86 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = v96;
            *(_DWORD *)long long v117 = v65;
            unint64_t v87 = "DIROPS_GetDirEntryByOffset: First dir entry in set is expected to be of type EXFAT_DIR_FILE, but type = 0x%x.";
LABEL_115:
            long long v88 = v86;
LABEL_116:
            _os_log_impl(&dword_22C0F9000, v88, OS_LOG_TYPE_ERROR, v87, buf, 8u);
          }
        }
      }
LABEL_117:
      *__int16 v85 = a2 + 32;
      goto LABEL_50;
    }
    int v67 = *v32;
    if (v67 != 192)
    {
      __int16 v85 = a3;
      if (!gbIsLoggerInit) {
        goto LABEL_117;
      }
      uint64_t v86 = gpsExFatLog;
      if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_117;
      }
      *(_DWORD *)long long buf = v96;
      *(_DWORD *)long long v117 = v67;
      unint64_t v87 = "DIROPS_GetDirEntryByOffset: Second dir entry in set is expected to be of type EXFAT_DIR_STREAM, but type = 0x%x.";
      goto LABEL_115;
    }
    long long v68 = *((_OWORD *)v32 + 1);
    *((_OWORD *)a4 + 2) = *(_OWORD *)v32;
    *((_OWORD *)a4 + 3) = v68;
    unsigned int v69 = a4[35] / 0xFu;
    if (a4[35] % 0xFu) {
      ++v69;
    }
    if (v69 >= v62)
    {
      long long v89 = a8;
      if (gbIsLoggerInit)
      {
        long long v90 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_22C0F9000, v90, OS_LOG_TYPE_ERROR, "DIROPS_GetDirEntryByOffset: Amount of secondary entries is invalid.", buf, 2u);
        }
      }
      *long long v89 = 22;
      goto LABEL_11;
    }
    LODWORD(v107) = v69;
    *a5 = a4[35];
LABEL_77:
    v61 += 32;
    if (v56 >= v62 || v61 % v11) {
      goto LABEL_95;
    }
    unint64_t v73 = (v17 + 1);
    if (v73 / v113 == *(_DWORD *)(a1 + 436)) {
      goto LABEL_22;
    }
    uint64_t v108 = v60;
    unint64_t v109 = v56;
    int loga = v57;
    int v74 = v73;
    uint64_t v75 = a8;
    unsigned int v76 = DIROPS_GetDirBlockRelative(a1, v73, (uint64_t *)&v115, a7);
    *uint64_t v75 = v76;
    if (v76) {
      break;
    }
    a8 = v75;
    if (HIDWORD(v107))
    {
      if (v103 > 0xF)
      {
        if (gbIsLoggerInit)
        {
          unsigned int v80 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = v96;
            *(_DWORD *)long long v117 = v103;
            _os_log_impl(&dword_22C0F9000, v80, OS_LOG_TYPE_ERROR, "Could not cache secondary entry %d", buf, 8u);
          }
          unint64_t v61 = 0;
          a3 = v102;
          a7 = v104;
          a8 = v75;
          goto LABEL_94;
        }
        unint64_t v61 = 0;
      }
      else
      {
        uint64_t v77 = v115;
        *(_DWORD *)&a4[4 * v103 + 104] = v115[4];
        if (gbIsLoggerInit)
        {
          long long v95 = gpsExFatLog;
          long long v97 = v77;
          BOOL v78 = os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel);
          a8 = v75;
          if (v78)
          {
            int v79 = v97[4];
            *(_DWORD *)long long buf = 136315650;
            *(void *)long long v117 = "DIROPS_GetDirEntryByOffset";
            *(_WORD *)&v117[8] = 1024;
            unsigned int v118 = v103;
            __int16 v119 = 1024;
            int v120 = v79;
            _os_log_impl(&dword_22C0F9000, v95, (os_log_type_t)gpeExfatToOsLevel, "%s: secondaryEntriesDirBlocks[%u] = %u.", buf, 0x18u);
            a8 = v75;
          }
        }
        unint64_t v61 = 0;
        ++v103;
      }
    }
    else
    {
      unint64_t v61 = 0;
      HIDWORD(v107) = v115[4];
    }
    a3 = v102;
    a7 = v104;
LABEL_94:
    int v17 = v74;
    unint64_t v50 = v105;
    unint64_t v62 = v106;
    int v57 = loga;
    uint64_t v60 = v108;
    unint64_t v56 = v109;
    uint64_t v59 = v99;
LABEL_95:
    unsigned int v32 = (unsigned __int8 *)(*(void *)v115 + v61);
    ++v56;
    v60 += 32;
    if (v56 == v59)
    {
      int v81 = *v101;
      if (v81 != 133)
      {
        if (gbIsLoggerInit)
        {
          uint64_t v83 = a3;
          uint64_t v84 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = v96;
            *(_DWORD *)long long v117 = v81;
            _os_log_impl(&dword_22C0F9000, v84, OS_LOG_TYPE_ERROR, "DIROPS_GetDirEntryByOffset: dir entry is unknown 0x%x.", buf, 8u);
          }
          unsigned int v37 = 1;
          uint64_t v13 = 23;
          a3 = v83;
        }
        else
        {
          unsigned int v37 = 1;
          uint64_t v13 = 23;
        }
        unint64_t v31 = v98;
        goto LABEL_124;
      }
      if (v50 <= *(void *)(a1 + 544))
      {
LABEL_101:
        uint64_t v13 = 17;
        unint64_t v31 = v98;
        unsigned int v37 = v99;
LABEL_124:
        unsigned __int8 v34 = v103;
        int v35 = HIDWORD(v107);
        goto LABEL_42;
      }
      int v82 = *((unsigned __int16 *)v101 + 1);
      if (v82 == (unsigned __int16)v57)
      {
        if (!*(unsigned char *)(a1 + 552)) {
          *(void *)(a1 + 544) = v105;
        }
        goto LABEL_101;
      }
      long long v92 = a3;
      if (gbIsLoggerInit)
      {
        unsigned __int16 v93 = v57;
        long long v94 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 67109376;
          *(_DWORD *)long long v117 = v82;
          *(_WORD *)&v117[4] = 1024;
          *(_DWORD *)&v117[6] = v93;
          _os_log_impl(&dword_22C0F9000, v94, OS_LOG_TYPE_ERROR, "DIROPS_GetDirEntryByOffset: Checksum error: %u != %u.", buf, 0xEu);
        }
      }
      *long long v92 = a2 + 32;
      *(unsigned char *)(a1 + 552) = 1;
LABEL_50:
      uint64_t v13 = 25;
      goto LABEL_43;
    }
  }
  if (gbIsLoggerInit)
  {
    uint64_t v23 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      *(void *)long long v117 = "DIROPS_GetDirEntryByOffset";
      goto LABEL_10;
    }
  }
LABEL_11:
  uint64_t v13 = 26;
LABEL_43:
  if (!a6) {
    DIROPS_FreeDirBlockBuffer((void **)v115);
  }
  return v13;
}

uint64_t DIROPS_isDirEmpty(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  unsigned int v21 = 0;
  unint64_t v22 = 0;
  uint64_t v2 = (unsigned __int16 *)malloc_type_malloc(0x200uLL, 0x10000407EBBDD04uLL);
  memset(v20, 0, sizeof(v20));
  if (!v2)
  {
    if (gbIsLoggerInit)
    {
      unint64_t v10 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_22C0F9000, v10, OS_LOG_TYPE_ERROR, "DIROPS_isDirEmpty fail to allocate memory.\n", buf, 2u);
      }
    }
    return 12;
  }
  unint64_t v3 = v2;
  *((_OWORD *)v2 + 30) = 0uLL;
  *((_OWORD *)v2 + 31) = 0uLL;
  *((_OWORD *)v2 + 28) = 0uLL;
  *((_OWORD *)v2 + 29) = 0uLL;
  *((_OWORD *)v2 + 26) = 0uLL;
  *((_OWORD *)v2 + 27) = 0uLL;
  *((_OWORD *)v2 + 24) = 0uLL;
  *((_OWORD *)v2 + 25) = 0uLL;
  *((_OWORD *)v2 + 22) = 0uLL;
  *((_OWORD *)v2 + 23) = 0uLL;
  *((_OWORD *)v2 + 20) = 0uLL;
  *((_OWORD *)v2 + 21) = 0uLL;
  *((_OWORD *)v2 + 18) = 0uLL;
  *((_OWORD *)v2 + 19) = 0uLL;
  *((_OWORD *)v2 + 16) = 0uLL;
  *((_OWORD *)v2 + 17) = 0uLL;
  *((_OWORD *)v2 + 14) = 0uLL;
  *((_OWORD *)v2 + 15) = 0uLL;
  *((_OWORD *)v2 + 12) = 0uLL;
  *((_OWORD *)v2 + 13) = 0uLL;
  *((_OWORD *)v2 + 10) = 0uLL;
  *((_OWORD *)v2 + 11) = 0uLL;
  *((_OWORD *)v2 + 8) = 0uLL;
  *((_OWORD *)v2 + 9) = 0uLL;
  *((_OWORD *)v2 + 6) = 0uLL;
  *((_OWORD *)v2 + 7) = 0uLL;
  *((_OWORD *)v2 + 4) = 0uLL;
  *((_OWORD *)v2 + 5) = 0uLL;
  *((_OWORD *)v2 + 2) = 0uLL;
  *((_OWORD *)v2 + 3) = 0uLL;
  *(_OWORD *)uint64_t v2 = 0uLL;
  *((_OWORD *)v2 + 1) = 0uLL;
  if ((*(_DWORD *)(a1 + 208) - 1) >= 2)
  {
    unsigned int v11 = 20;
LABEL_13:
    unsigned int v23 = v11;
    goto LABEL_14;
  }
  unsigned int DirBlockBuffer = DIROPS_AllocateDirBlockBuffer(*(void *)(a1 + 216), (void **)&v21);
  unsigned int v23 = DirBlockBuffer;
  if (DirBlockBuffer)
  {
    if (gbIsLoggerInit)
    {
      unsigned int v5 = DirBlockBuffer;
      uint64_t v6 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        unint64_t v25 = "DIROPS_isDirEmpty";
        __int16 v26 = 1024;
        unsigned int v27 = v5;
        unsigned int v7 = "%s: Couldn't allocate dir block buffer. error = %d.\n";
        unsigned int v8 = v6;
        uint32_t v9 = 18;
        goto LABEL_7;
      }
    }
    goto LABEL_14;
  }
  unint64_t v13 = 0;
  while (1)
  {
    int DirEntryByOffset = DIROPS_GetDirEntryByOffset(a1, v13, &v22, (unsigned __int8 *)v20, v3, v21, 0, &v23);
    int v15 = DirEntryByOffset;
    if (DirEntryByOffset == 17)
    {
      int v16 = *v3;
      if (v16 == 2)
      {
        if (v3[1] != 46) {
          goto LABEL_33;
        }
        int v17 = v3[2];
      }
      else
      {
        if (v16 != 1) {
          goto LABEL_33;
        }
        int v17 = v3[1];
      }
      if (v17 != 46)
      {
LABEL_33:
        unsigned int v11 = 66;
        goto LABEL_13;
      }
      goto LABEL_31;
    }
    if (DirEntryByOffset == 25)
    {
      if (gbIsLoggerInit)
      {
        int v18 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel[0]))
        {
          *(_DWORD *)long long buf = 136315138;
          unint64_t v25 = "DIROPS_isDirEmpty";
          _os_log_impl(&dword_22C0F9000, v18, (os_log_type_t)gpeExfatToOsLevel[0], "%s: Failed reading current dir entry. Trying to continue enumeration.", buf, 0xCu);
        }
      }
      goto LABEL_31;
    }
    if (DirEntryByOffset == 26) {
      break;
    }
LABEL_31:
    unint64_t v13 = v22;
    if ((v15 - 28) >= 0xFFFFFFFE) {
      goto LABEL_14;
    }
  }
  if (gbIsLoggerInit)
  {
    uint64_t v19 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v25) = v23;
      unsigned int v7 = "DIROPS_isDirEmpty:DIROPS_GetDirEntryByOffset error: %d.\n";
      unsigned int v8 = v19;
      uint32_t v9 = 8;
LABEL_7:
      _os_log_impl(&dword_22C0F9000, v8, OS_LOG_TYPE_ERROR, v7, buf, v9);
    }
  }
LABEL_14:
  free(v3);
  if (v21) {
    DIROPS_FreeDirBlockBuffer(v21);
  }
  return v23;
}

uint64_t DIROPS_AllocateDirBlockBuffer(uint64_t a1, void **a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (a2)
  {
    size_t v3 = *(void *)(a1 + 40);
    unint64_t v4 = malloc_type_calloc(1uLL, 0x18uLL, 0x1010040113C0ABBuLL);
    *a2 = v4;
    if (v4)
    {
      *(void *)*a2 = malloc_type_malloc(v3, 0xC085ADD6uLL);
      if (*(void *)*a2) {
        return 0;
      }
      free(*a2);
    }
    return 12;
  }
  else
  {
    if (gbIsLoggerInit)
    {
      uint64_t v6 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136315138;
        unsigned int v8 = "DIROPS_AllocateDirBlockBuffer";
        _os_log_impl(&dword_22C0F9000, v6, OS_LOG_TYPE_ERROR, "%s: Got NULL pDirBlock.", (uint8_t *)&v7, 0xCu);
      }
    }
    return 22;
  }
}

void DIROPS_FreeDirBlockBuffer(void **a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v2 = *a1;
    if (v2) {
      free(v2);
    }
    free(a1);
  }
  else if (gbIsLoggerInit)
  {
    size_t v3 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315138;
      unsigned int v5 = "DIROPS_FreeDirBlockBuffer";
      _os_log_impl(&dword_22C0F9000, v3, OS_LOG_TYPE_ERROR, "%s: Got NULL dirBlock.", (uint8_t *)&v4, 0xCu);
    }
  }
}

uint64_t DIROPS_GetMD5Digest(const void *a1, CC_LONG a2, char *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  *(void *)md = 0;
  uint64_t v10 = 0;
  memset(&c, 0, sizeof(c));
  CC_MD5_Init(&c);
  CC_MD5_Update(&c, a1, a2);
  CC_MD5_Final(md, &c);
  for (uint64_t i = 0; i != 16; ++i)
  {
    uint64_t result = snprintf(a3, 3uLL, "%02x", md[i]);
    a3 += 2;
  }
  return result;
}

BOOL DIROPS_VerifyIfLinkAndGetLinkLength(const char *a1, CC_LONG *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (!strncmp(a1, "XSym\n", 5uLL))
  {
    CC_LONG v5 = 0;
    uint64_t v6 = 0;
    *a2 = 0;
    while (1)
    {
      int v7 = a1[v6 + 5];
      if ((v7 - 48) > 9) {
        break;
      }
      CC_LONG v5 = v7 + 10 * v5 - 48;
      *a2 = v5;
      if (++v6 == 4)
      {
        if (v5 > 0x400) {
          return 0;
        }
        DIROPS_GetMD5Digest(a1 + 43, v5, __s1);
        return strncmp(__s1, a1 + 10, 0x20uLL) == 0;
      }
    }
  }
  return 0;
}

uint64_t DIROPS_GetRecordId(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if ((*(_WORD *)(a1 + 4) & 0x10) != 0) {
    return 2;
  }
  int v26 = 0;
  if (*(void *)(a2 + 24) != 1067) {
    return 3;
  }
  unsigned int v4 = *(_DWORD *)(a2 + 20);
  if (!v4) {
    return 3;
  }
  uint64_t v5 = *(void *)(a3 + 216);
  uint64_t v29 = 0;
  unint64_t v6 = *(void *)(v5 + 48);
  unint64_t v7 = *(void *)(v5 + 56);
  if ((*(unsigned char *)(a2 + 1) & 2) != 0)
  {
    unint64_t v9 = v7 + 1066;
    unint64_t v8 = (v7 + 1066) / v7;
    LODWORD(v29) = v4 + v8 - 1;
    HIDWORD(v29) = v8;
  }
  else
  {
    int v26 = FAT_Access_M_ChainLength(v5, v4, (unsigned int *)&v29 + 1, 0, &v29);
    if (v26) {
      return 0;
    }
    LODWORD(v8) = HIDWORD(v29);
    unint64_t v9 = v7 + 1066;
  }
  if (v7 * v8 != v9 / v7 * v7) {
    return 3;
  }
  unsigned int v28 = 0;
  size_t v11 = (v6 + 1066) / v6 * v6;
  unint64_t v12 = (char *)malloc_type_malloc(v11, 0xB5E8DB84uLL);
  if (!v12)
  {
    if (gbIsLoggerInit)
    {
      uint64_t v19 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_22C0F9000, v19, OS_LOG_TYPE_ERROR, "DIROPS_IsEntryASymLink failed to allocate memory\n", buf, 2u);
      }
    }
    return 0;
  }
  unint64_t v13 = v12;
  if (!v11) {
    goto LABEL_33;
  }
  uint64_t v14 = 0;
  while (1)
  {
    if ((*(unsigned char *)(a2 + 1) & 2) != 0)
    {
      unsigned int v28 = *(_DWORD *)(v5 + 80);
      size_t v17 = v11;
      goto LABEL_19;
    }
    unsigned int v15 = FAT_Access_M_ContiguousClustersInChain(v5, v4, &v28, &v26);
    int v16 = v26;
    if (v26) {
      break;
    }
    if (v7 * v15 >= v11) {
      size_t v17 = v11;
    }
    else {
      size_t v17 = v7 * v15;
    }
LABEL_19:
    int v18 = metaRead((int *)v5, &v13[v14], *(void *)(v5 + 64) + *(void *)(v5 + 56) * (v4 - 2), v17, 0, 0);
    int v26 = v18;
    if (v18)
    {
      if (!gbIsLoggerInit) {
        goto LABEL_34;
      }
      int v20 = v18;
      unsigned int v21 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        unint64_t v31 = "DIROPS_IsEntryASymLink";
        __int16 v32 = 1024;
        int v33 = v20;
        unint64_t v22 = "%s: failed to read from the device. Error = %d.";
LABEL_32:
        _os_log_impl(&dword_22C0F9000, v21, OS_LOG_TYPE_ERROR, v22, buf, 0x12u);
        goto LABEL_33;
      }
      goto LABEL_33;
    }
    v14 += v17;
    unsigned int v4 = v28;
    v11 -= v17;
    if (!v11) {
      goto LABEL_33;
    }
  }
  if (!gbIsLoggerInit) {
    goto LABEL_34;
  }
  unsigned int v21 = gpsExFatLog;
  if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315394;
    unint64_t v31 = "DIROPS_IsEntryASymLink";
    __int16 v32 = 1024;
    int v33 = v16;
    unint64_t v22 = "%s: failed to get next cont clusters. Error = %d.";
    goto LABEL_32;
  }
LABEL_33:
  if (v26)
  {
LABEL_34:
    free(v13);
    return 0;
  }
  BOOL LinkLength = DIROPS_VerifyIfLinkAndGetLinkLength(v13, &v27);
  int v24 = v26;
  free(v13);
  if (v24) {
    unsigned int v25 = 0;
  }
  else {
    unsigned int v25 = 3;
  }
  if (LinkLength) {
    return 4;
  }
  else {
    return v25;
  }
}

uint64_t DIROPS_LookForDirEntryByName(uint64_t a1, char *a2, unint64_t *a3, _DWORD *a4, uint64_t a5)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if ((*(_DWORD *)(a1 + 208) - 1) < 2)
  {
    uint64_t v35 = 0;
    uint64_t v10 = (unsigned __int16 *)malloc_type_malloc(0x200uLL, 0x10000407EBBDD04uLL);
    size_t v11 = (unsigned __int16 *)malloc_type_malloc(0x200uLL, 0x10000407EBBDD04uLL);
    *(_OWORD *)uint64_t v10 = 0u;
    *((_OWORD *)v10 + 1) = 0u;
    *((_OWORD *)v10 + 2) = 0u;
    *((_OWORD *)v10 + 3) = 0u;
    *((_OWORD *)v10 + 4) = 0u;
    *((_OWORD *)v10 + 5) = 0u;
    *((_OWORD *)v10 + 6) = 0u;
    *((_OWORD *)v10 + 7) = 0u;
    *((_OWORD *)v10 + 8) = 0u;
    *((_OWORD *)v10 + 9) = 0u;
    *((_OWORD *)v10 + 10) = 0u;
    *((_OWORD *)v10 + 11) = 0u;
    *((_OWORD *)v10 + 12) = 0u;
    *((_OWORD *)v10 + 13) = 0u;
    *((_OWORD *)v10 + 14) = 0u;
    *((_OWORD *)v10 + 15) = 0u;
    *((_OWORD *)v10 + 16) = 0u;
    *((_OWORD *)v10 + 17) = 0u;
    *((_OWORD *)v10 + 18) = 0u;
    *((_OWORD *)v10 + 19) = 0u;
    *((_OWORD *)v10 + 20) = 0u;
    *((_OWORD *)v10 + 21) = 0u;
    *((_OWORD *)v10 + 22) = 0u;
    *((_OWORD *)v10 + 23) = 0u;
    *((_OWORD *)v10 + 24) = 0u;
    *((_OWORD *)v10 + 25) = 0u;
    *((_OWORD *)v10 + 26) = 0u;
    *((_OWORD *)v10 + 27) = 0u;
    *((_OWORD *)v10 + 28) = 0u;
    *((_OWORD *)v10 + 29) = 0u;
    *((_OWORD *)v10 + 30) = 0u;
    *((_OWORD *)v10 + 31) = 0u;
    *((_OWORD *)v11 + 30) = 0u;
    *((_OWORD *)v11 + 31) = 0u;
    *((_OWORD *)v11 + 28) = 0u;
    *((_OWORD *)v11 + 29) = 0u;
    *((_OWORD *)v11 + 26) = 0u;
    *((_OWORD *)v11 + 27) = 0u;
    *((_OWORD *)v11 + 24) = 0u;
    *((_OWORD *)v11 + 25) = 0u;
    *((_OWORD *)v11 + 22) = 0u;
    *((_OWORD *)v11 + 23) = 0u;
    *((_OWORD *)v11 + 20) = 0u;
    *((_OWORD *)v11 + 21) = 0u;
    *((_OWORD *)v11 + 18) = 0u;
    *((_OWORD *)v11 + 19) = 0u;
    *((_OWORD *)v11 + 16) = 0u;
    *((_OWORD *)v11 + 17) = 0u;
    *((_OWORD *)v11 + 14) = 0u;
    *((_OWORD *)v11 + 15) = 0u;
    *((_OWORD *)v11 + 12) = 0u;
    *((_OWORD *)v11 + 13) = 0u;
    *((_OWORD *)v11 + 10) = 0u;
    *((_OWORD *)v11 + 11) = 0u;
    *((_OWORD *)v11 + 8) = 0u;
    *((_OWORD *)v11 + 9) = 0u;
    *((_OWORD *)v11 + 6) = 0u;
    *((_OWORD *)v11 + 7) = 0u;
    *((_OWORD *)v11 + 4) = 0u;
    *((_OWORD *)v11 + 5) = 0u;
    *((_OWORD *)v11 + 2) = 0u;
    *((_OWORD *)v11 + 3) = 0u;
    *(_OWORD *)size_t v11 = 0u;
    *((_OWORD *)v11 + 1) = 0u;
    *(_OWORD *)(a5 + 144) = 0u;
    *(_OWORD *)(a5 + 160) = 0u;
    *(_OWORD *)(a5 + 112) = 0u;
    *(_OWORD *)(a5 + 128) = 0u;
    *(_OWORD *)(a5 + 80) = 0u;
    *(_OWORD *)(a5 + 96) = 0u;
    *(_OWORD *)(a5 + 48) = 0u;
    *(_OWORD *)(a5 + 64) = 0u;
    *(_OWORD *)(a5 + 16) = 0u;
    *(_OWORD *)(a5 + 32) = 0u;
    *(_OWORD *)a5 = 0u;
    size_t v12 = strlen(a2);
    unsigned int v36 = CONV_UTF8ToUnistr255((unsigned __int8 *)a2, v12, v11);
    if (v36)
    {
      if (!gbIsLoggerInit) {
        goto LABEL_7;
      }
      uint64_t v13 = gpsExFatLog;
      if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      *(_DWORD *)long long buf = 136315395;
      *(void *)&uint8_t buf[4] = "DIROPS_LookForDirEntryByName";
      *(_WORD *)&buf[12] = 2081;
      *(void *)&buf[14] = a2;
      uint64_t v14 = "%s: failed to convert [%{private}s] utf8 -> utf16";
      unsigned int v15 = v13;
      uint32_t v16 = 22;
      goto LABEL_6;
    }
    CONV_Unistr255ToUpperCase(v11, *(void *)(a1 + 216));
    if (a3 || (uint64_t v19 = *(void *)(a1 + 512)) == 0)
    {
      if (!a3
        || DIROPS_GetDirEntryByOffset(a1, *a3, &v35, (unsigned __int8 *)a5, v10, 0, 0, &v36) != 17)
      {
        goto LABEL_41;
      }
    }
    else
    {
      MultiReadSingleWrite_LockRead((pthread_rwlock_t *)(v19 + 8));
      int v20 = ht_LookupByName(*(uint64_t **)(a1 + 512), v11);
      if (!v20)
      {
        if (*(unsigned char *)(*(void *)(a1 + 512) + 4))
        {
LABEL_41:
          *(void *)long long buf = 0;
          *(_OWORD *)&uint8_t buf[16] = 0u;
          uint64_t v38 = 0;
          *(void *)&uint8_t buf[8] = v11;
          unsigned int v36 = DIROPS_LookForDirEntry(a1, (int *)buf, a4, a5);
          LODWORD(a4) = v36 == 0;
LABEL_42:
          uint64_t v32 = *(void *)(a1 + 512);
          if (v32)
          {
            MultiReadSingleWrite_FreeRead((pthread_rwlock_t *)(v32 + 8));
            if (a4) {
              ht_insert(*(void *)(a1 + 216), *(void *)(a1 + 512), v11, *(void *)(a5 + 72), 1);
            }
          }
          free(v10);
          free(v11);
          return v36;
        }
        LODWORD(a4) = 0;
        unsigned int v27 = 2;
LABEL_30:
        unsigned int v36 = v27;
        goto LABEL_42;
      }
      int DirEntryByOffset = DIROPS_GetDirEntryByOffset(a1, 32 * *((unsigned int *)v20 + 2), &v35, (unsigned __int8 *)a5, v10, 0, 0, &v36);
      int v22 = DirEntryByOffset;
      if (DirEntryByOffset > 25)
      {
        if (DirEntryByOffset == 26)
        {
          if (!gbIsLoggerInit) {
            goto LABEL_7;
          }
          uint64_t v34 = gpsExFatLog;
          if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
            goto LABEL_7;
          }
          *(_DWORD *)long long buf = 136315394;
          *(void *)&uint8_t buf[4] = "DIROPS_LookForDirEntryByName";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v36;
          uint64_t v14 = "%s: Error [%d] during hashed lookup";
          unsigned int v15 = v34;
          uint32_t v16 = 18;
LABEL_6:
          _os_log_impl(&dword_22C0F9000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
LABEL_7:
          LODWORD(a4) = 0;
          goto LABEL_42;
        }
        if (DirEntryByOffset == 27)
        {
          if (!gbIsLoggerInit) {
            goto LABEL_41;
          }
          uint64_t v23 = gpsExFatLog;
          char v24 = gpeExfatToOsLevel;
          if (!os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel)) {
            goto LABEL_41;
          }
          *(_DWORD *)long long buf = 136315138;
          *(void *)&uint8_t buf[4] = "DIROPS_LookForDirEntryByName";
          unsigned int v25 = "%s: Got to the end of directory";
LABEL_36:
          unsigned int v28 = v23;
          os_log_type_t v29 = v24;
          uint32_t v30 = 12;
LABEL_40:
          _os_log_impl(&dword_22C0F9000, v28, v29, v25, buf, v30);
          goto LABEL_41;
        }
LABEL_37:
        if (!gbIsLoggerInit) {
          goto LABEL_41;
        }
        uint64_t v31 = gpsExFatLog;
        if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_FAULT)) {
          goto LABEL_41;
        }
        *(_DWORD *)long long buf = 136315394;
        *(void *)&uint8_t buf[4] = "DIROPS_LookForDirEntryByName";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v22;
        unsigned int v25 = "%s: Found unexpected type during hashed lookup, eStatus %d, skipping";
        unsigned int v28 = v31;
        os_log_type_t v29 = OS_LOG_TYPE_FAULT;
        uint32_t v30 = 18;
        goto LABEL_40;
      }
      if (DirEntryByOffset != 17)
      {
        if (DirEntryByOffset == 25)
        {
          if (!gbIsLoggerInit) {
            goto LABEL_41;
          }
          uint64_t v23 = gpsExFatLog;
          char v24 = gpeExfatToOsLevel;
          if (!os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel)) {
            goto LABEL_41;
          }
          *(_DWORD *)long long buf = 136315138;
          *(void *)&uint8_t buf[4] = "DIROPS_LookForDirEntryByName";
          unsigned int v25 = "%s: Failed reading current dir entry. Trying to continue enumeration.";
          goto LABEL_36;
        }
        goto LABEL_37;
      }
    }
    if (*v11 != *v10) {
      goto LABEL_41;
    }
    CONV_Unistr255ToUpperCase(v10, *(void *)(a1 + 216));
    if (memcmp(v10 + 1, v11 + 1, 2 * *v11)) {
      goto LABEL_41;
    }
    if (!a4) {
      goto LABEL_42;
    }
    int RecordId = DIROPS_GetRecordId(a5, a5 + 32, a1);
    *a4 = RecordId;
    if (RecordId) {
      goto LABEL_7;
    }
    LODWORD(a4) = 0;
    unsigned int v27 = 9;
    goto LABEL_30;
  }
  if (!gbIsLoggerInit) {
    return 20;
  }
  size_t v17 = gpsExFatLog;
  uint64_t v18 = 20;
  if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = 20;
    _os_log_impl(&dword_22C0F9000, v17, OS_LOG_TYPE_ERROR, "DIROPS_LookForDirEntryByName: Given node is not a dir [%d]", buf, 8u);
  }
  return v18;
}

uint64_t DIROPS_LookForDirEntry(uint64_t a1, int *a2, _DWORD *a3, uint64_t a4)
{
  uint64_t v101 = *MEMORY[0x263EF8340];
  if (*a2 == 6)
  {
    unint64_t v8 = *((void *)a2 + 3);
    uint64_t v9 = *((void *)a2 + 4);
  }
  else
  {
    unint64_t v8 = 0;
    LODWORD(v9) = 0;
  }
  unint64_t v87 = 0;
  unint64_t v88 = 0;
  uint64_t v10 = *(void *)(a1 + 216);
  size_t v11 = (unsigned __int16 *)malloc_type_malloc(0x200uLL, 0x10000407EBBDD04uLL);
  if (!v11)
  {
    if (gbIsLoggerInit)
    {
      uint64_t v19 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_22C0F9000, v19, OS_LOG_TYPE_ERROR, "DIROPS_LookForDirEntry fail to allocate memory.\n", buf, 2u);
      }
    }
    unsigned int v89 = 12;
    goto LABEL_134;
  }
  size_t v12 = v11;
  *(_OWORD *)(a4 + 144) = 0u;
  *(_OWORD *)(a4 + 160) = 0u;
  *(_OWORD *)(a4 + 112) = 0u;
  *(_OWORD *)(a4 + 128) = 0u;
  *(_OWORD *)(a4 + 80) = 0u;
  *(_OWORD *)(a4 + 96) = 0u;
  *(_OWORD *)(a4 + 48) = 0u;
  *(_OWORD *)(a4 + 64) = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)a4 = 0u;
  *((_OWORD *)v11 + 30) = 0u;
  *((_OWORD *)v11 + 31) = 0u;
  *((_OWORD *)v11 + 28) = 0u;
  *((_OWORD *)v11 + 29) = 0u;
  *((_OWORD *)v11 + 26) = 0u;
  *((_OWORD *)v11 + 27) = 0u;
  *((_OWORD *)v11 + 24) = 0u;
  *((_OWORD *)v11 + 25) = 0u;
  *((_OWORD *)v11 + 22) = 0u;
  *((_OWORD *)v11 + 23) = 0u;
  *((_OWORD *)v11 + 20) = 0u;
  *((_OWORD *)v11 + 21) = 0u;
  *((_OWORD *)v11 + 18) = 0u;
  *((_OWORD *)v11 + 19) = 0u;
  *((_OWORD *)v11 + 16) = 0u;
  *((_OWORD *)v11 + 17) = 0u;
  *((_OWORD *)v11 + 14) = 0u;
  *((_OWORD *)v11 + 15) = 0u;
  *((_OWORD *)v11 + 12) = 0u;
  *((_OWORD *)v11 + 13) = 0u;
  *((_OWORD *)v11 + 10) = 0u;
  *((_OWORD *)v11 + 11) = 0u;
  *((_OWORD *)v11 + 8) = 0u;
  *((_OWORD *)v11 + 9) = 0u;
  *((_OWORD *)v11 + 6) = 0u;
  *((_OWORD *)v11 + 7) = 0u;
  *((_OWORD *)v11 + 4) = 0u;
  *((_OWORD *)v11 + 5) = 0u;
  *((_OWORD *)v11 + 2) = 0u;
  *((_OWORD *)v11 + 3) = 0u;
  *(_OWORD *)size_t v11 = 0u;
  *((_OWORD *)v11 + 1) = 0u;
  if (!*a2 && !*((void *)a2 + 1))
  {
    unsigned int v89 = 22;
    if (!gbIsLoggerInit) {
      goto LABEL_133;
    }
    uint64_t v65 = gpsExFatLog;
    if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_133;
    }
    *(_WORD *)long long buf = 0;
    uint32_t v16 = "DIROPS_LookForDirEntry: LU_BY_NAME but psSearchName == NULL \n";
    size_t v17 = v65;
    uint32_t v18 = 2;
LABEL_130:
    _os_log_impl(&dword_22C0F9000, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
    goto LABEL_133;
  }
  unsigned int v13 = DIROPS_AllocateDirBlockBuffer(v10, &v87);
  unsigned int v89 = v13;
  if (v13)
  {
    if (!gbIsLoggerInit) {
      goto LABEL_133;
    }
    unsigned int v14 = v13;
    uint64_t v15 = gpsExFatLog;
    if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_133;
    }
    *(_DWORD *)long long buf = 136315394;
    *(void *)&uint8_t buf[4] = "DIROPS_LookForDirEntry";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v14;
    uint32_t v16 = "%s: Couldn't allocate dir block buffer. error = %d.\n";
    size_t v17 = v15;
    uint32_t v18 = 18;
    goto LABEL_130;
  }
  int v78 = v9;
  int v79 = a3;
  int v86 = 0;
  uint64_t v81 = a4 + 32;
  uint64_t v20 = gpeExfatToOsLevel;
  uint64_t v82 = v10;
  while (1)
  {
    uint64_t v21 = v20;
    int DirEntryByOffset = DIROPS_GetDirEntryByOffset(a1, v8, &v88, (unsigned __int8 *)a4, v12, v87, 2, &v89);
    int v23 = DirEntryByOffset;
    if (DirEntryByOffset != 17)
    {
      if (DirEntryByOffset == 25)
      {
        int v28 = gbIsLoggerInit;
        if (gbIsLoggerInit)
        {
          os_log_type_t v29 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)v21))
          {
            *(_DWORD *)long long buf = 136315138;
            *(void *)&uint8_t buf[4] = "DIROPS_LookForDirEntry";
            _os_log_impl(&dword_22C0F9000, v29, (os_log_type_t)v21, "%s: Failed reading current dir entry. Trying to continue enumeration.", buf, 0xCu);
          }
          int v28 = 0;
        }
        goto LABEL_67;
      }
      if (DirEntryByOffset == 26)
      {
        if (gbIsLoggerInit)
        {
          uint64_t v67 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v89;
            uint32_t v16 = "DIROPS_LookForDirEntry:DIROPS_GetDirEntryByOffset error: %d.\n";
            size_t v17 = v67;
            uint32_t v18 = 8;
            goto LABEL_130;
          }
        }
        goto LABEL_133;
      }
      int v24 = *a2;
      if (DirEntryByOffset == 18 && v24 == 2) {
        goto LABEL_117;
      }
      uint64_t v20 = v21;
      if (DirEntryByOffset == 20 && v24 == 3)
      {
        if (*(_DWORD *)(v10 + 24) == (*(unsigned char *)(a4 + 1) & 1)) {
          goto LABEL_117;
        }
      }
      else if (DirEntryByOffset == 19 && v24 == 4)
      {
        goto LABEL_117;
      }
      BOOL v27 = DirEntryByOffset == 21 && v24 == 5;
      goto LABEL_41;
    }
    ++v86;
    int v26 = *a2;
    if (*a2 == 6) {
      break;
    }
    if (v26 == 1)
    {
      int v28 = a2[2] == *(_DWORD *)(a4 + 52);
LABEL_67:
      uint64_t v20 = v21;
      goto LABEL_68;
    }
    uint64_t v20 = v21;
    if (v26 || **((unsigned __int16 **)a2 + 1) != *v12)
    {
      int v28 = 0;
      goto LABEL_68;
    }
    CONV_Unistr255ToUpperCase(v12, v10);
    BOOL v27 = memcmp(v12 + 1, (const void *)(*((void *)a2 + 1) + 2), 2 * **((unsigned __int16 **)a2 + 1)) == 0;
    uint64_t v20 = v21;
LABEL_41:
    int v28 = v27;
LABEL_68:
    unint64_t v8 = v88;
    if (v23 == 27 || v28 != 0)
    {
      if (v28) {
        goto LABEL_117;
      }
      if (v23 == 27 && *a2 == 6)
      {
        **((unsigned char **)a2 + 2) = 0;
        **(void **)(*((void *)a2 + 2) + 8) = -1;
        goto LABEL_133;
      }
      unsigned int v66 = 2;
      goto LABEL_132;
    }
  }
  *(void *)long long buf = 0;
  uint64_t v83 = *(void *)(a1 + 216);
  uint64_t v80 = *(void *)(*((void *)a2 + 2) + 8);
  uint32_t v30 = (char *)malloc_type_malloc(0x2FEuLL, 0x6F48D7E7uLL);
  uint64_t v31 = (char *)malloc_type_malloc(0x2FEuLL, 0x1D82E30AuLL);
  uint64_t v32 = (char *)malloc_type_malloc(0x2FEuLL, 0xFD105F90uLL);
  __s2 = v32;
  __s = v31;
  if (!v31 || !v32 || !v30)
  {
    if (gbIsLoggerInit)
    {
      unsigned int v37 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long v90 = 0;
        _os_log_impl(&dword_22C0F9000, v37, OS_LOG_TYPE_ERROR, "Failed to allocate memory", v90, 2u);
      }
    }
    unsigned int Record = 12;
    unsigned int v89 = 12;
LABEL_55:
    int v38 = 1;
    goto LABEL_56;
  }
  CONV_Unistr255ToUTF8(v12, v30, 766);
  CONV_Unistr255ToUpperCase(v12, v83);
  CONV_Unistr255ToUTF8(v12, v31, 766);
  int RecordId = DIROPS_GetRecordId(a4, v81, a1);
  unsigned int Record = FILERECORD_AllocateRecord((void **)buf, a1, v83, *(_DWORD *)(a4 + 52), *(_DWORD *)(a1 + 428), RecordId, (long long *)a4, v31);
  unsigned int v89 = Record;
  if (Record) {
    goto LABEL_49;
  }
  uint64_t v77 = v30;
  FILEOPS_GetAtrrFromDirEntry(*(uint64_t *)buf, v80 + 16);
  uint64_t v41 = *((void *)a2 + 1);
  uint64_t v42 = *(void *)(v41 + 16);
  if ((*(unsigned char *)(v42 + 8) & 0x20) != 0 && (*(unsigned char *)(v42 + 45) & 0x80) != 0)
  {
LABEL_77:
    BOOL v43 = *(const char ***)v41;
    if (*(void *)v41)
    {
      long long v44 = (char *)*v43;
      if (*v43)
      {
        size_t v45 = strlen(*v43);
        uint64_t v46 = v83;
        if (v45)
        {
          size_t v47 = v45;
          char v75 = 0;
          BOOL v48 = v43 + 1;
          while (1)
          {
            unsigned int v49 = CONV_UnistrUTF8ToUpperCase(v44, __s2, v46);
            if (v49) {
              goto LABEL_106;
            }
            if (v47 <= strlen(v31)) {
              v75 |= strstr(v31, __s2) != 0;
            }
            long long v44 = (char *)*v48;
            if (*v48)
            {
              size_t v50 = strlen(*v48);
              uint64_t v46 = v83;
              size_t v47 = v50;
              ++v48;
              if (v50) {
                continue;
              }
            }
            unsigned int v89 = 0;
            if ((v75 & 1) == 0) {
              goto LABEL_111;
            }
            uint64_t v41 = *((void *)a2 + 1);
            goto LABEL_88;
          }
        }
      }
      goto LABEL_111;
    }
LABEL_88:
    uint64_t v51 = *(const char ***)(v41 + 8);
    if (v51)
    {
      int v52 = (char *)*v51;
      if (*v51)
      {
        size_t v53 = strlen(*v51);
        uint64_t v54 = v83;
        if (v53)
        {
          char v76 = 0;
          BOOL v55 = v51 + 1;
          while (1)
          {
            size_t v56 = v53;
            unsigned int v49 = CONV_UnistrUTF8ToUpperCase(v52, __s2, v54);
            if (v49) {
              break;
            }
            size_t v57 = strlen(v31);
            if (v57 >= v56) {
              v76 |= memcmp(&v31[v57 - v56], __s2, v56) == 0;
            }
            int v52 = (char *)*v55;
            if (*v55)
            {
              size_t v53 = strlen(*v55);
              uint64_t v54 = v83;
              ++v55;
              if (v53) {
                continue;
              }
            }
            unsigned int v89 = 0;
            if ((v76 & 1) == 0) {
              goto LABEL_111;
            }
            uint64_t v41 = *((void *)a2 + 1);
            goto LABEL_99;
          }
LABEL_106:
          unsigned int Record = v49;
          unsigned int v89 = v49;
          goto LABEL_114;
        }
      }
      goto LABEL_111;
    }
LABEL_99:
    uint64_t v58 = *(void *)(v41 + 16);
    uint64_t v59 = *(void *)(v58 + 8);
    if (v59)
    {
      if ((v59 & 1) != 0 && ((*(_DWORD *)(v58 + 24) >> (*(_DWORD *)(v80 + 40) - 1)) & 1) == 0) {
        goto LABEL_111;
      }
      if ((v59 & 0x800) == 0) {
        goto LABEL_103;
      }
      uint64_t v62 = *(void *)(v80 + 112);
      uint64_t v63 = *(void *)(v58 + 96);
      if (v62 == v63)
      {
        if (*(void *)(v80 + 120) < *(void *)(v58 + 104)) {
          goto LABEL_111;
        }
      }
      else if (v62 <= v63)
      {
LABEL_111:
        if (*(_DWORD *)(v80 + 40) != 2) {
          goto LABEL_115;
        }
        uint64_t v60 = (char *)*((void *)a2 + 2);
        char v61 = *v60;
LABEL_113:
        unsigned int Record = 0;
        *uint64_t v60 = v61 | 2;
LABEL_114:
        uint32_t v30 = v77;
LABEL_49:
        unsigned __int16 v35 = strlen(v30);
        *(_WORD *)(v80 + 12) = v35;
        *(_WORD *)(v80 + 14) = 0;
        *(_WORD *)(v80 + 10) = 200;
        uint64_t v36 = v35;
        memcpy((void *)(v80 + 200), v30, v35);
        *(unsigned char *)(v80 + 200 + v36) = 0;
        goto LABEL_55;
      }
    }
LABEL_103:
    uint64_t v60 = (char *)*((void *)a2 + 2);
    char v61 = 1;
    *uint64_t v60 = 1;
    if (*(_DWORD *)(v80 + 40) != 2)
    {
      unsigned int Record = 0;
      goto LABEL_114;
    }
    goto LABEL_113;
  }
  if (*v31 == 46)
  {
LABEL_115:
    unsigned int Record = 0;
    int v38 = 0;
    uint32_t v30 = v77;
LABEL_56:
    uint64_t v39 = *(char **)buf;
    if (*(void *)buf) {
      goto LABEL_57;
    }
    goto LABEL_58;
  }
  uint64_t v39 = *(char **)buf;
  if ((*(_WORD *)(*(void *)buf + 252) & 2) == 0) {
    goto LABEL_77;
  }
  unsigned int Record = 0;
  int v38 = 0;
LABEL_57:
  FILERECORD_FreeRecord(v39, 1);
LABEL_58:
  if (__s) {
    free(__s);
  }
  if (__s2) {
    free(__s2);
  }
  if (v30) {
    free(v30);
  }
  if (Record) {
    goto LABEL_133;
  }
  if (!v38)
  {
    int v28 = 0;
    uint64_t v10 = v82;
    goto LABEL_67;
  }
  unint64_t v69 = v88;
  int v70 = malloc_type_malloc(0x200uLL, 0x10000407EBBDD04uLL);
  if (!v70)
  {
    unsigned int v66 = 12;
    goto LABEL_132;
  }
  long long v71 = v70;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v96 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  memset(buf, 0, sizeof(buf));
  int v72 = DIROPS_GetDirEntryByOffset(a1, v69, v90, buf, v70, 0, 0, &v89);
  free(v71);
  if (!v89)
  {
    unint64_t v73 = v69 | ((unint64_t)(v86 + v78) << 32);
    if (v72 == 27) {
      uint64_t v74 = -1;
    }
    else {
      uint64_t v74 = v73;
    }
    **(void **)(*((void *)a2 + 2) + 8) = v74;
    *(_WORD *)(*(void *)(*((void *)a2 + 2) + 8) + 8) = (*(_WORD *)(*(void *)(*((void *)a2 + 2) + 8) + 12) & 0xFFF8)
                                                             + 208;
LABEL_117:
    if (!v79 || (int v64 = DIROPS_GetRecordId(a4, v81, a1), (*v79 = v64) != 0))
    {
      unsigned int v89 = 0;
      goto LABEL_133;
    }
    unsigned int v66 = 9;
LABEL_132:
    unsigned int v89 = v66;
  }
LABEL_133:
  free(v12);
LABEL_134:
  if (v87) {
    DIROPS_FreeDirBlockBuffer((void **)v87);
  }
  return v89;
}

uint64_t DIROPS_PurgeNodeMetaBlocksFromCache(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  unsigned int v1 = *(_DWORD *)(a1 + 208);
  BOOL v16 = v1 > 4;
  int v2 = (1 << v1) & 0x16;
  if (v16 || v2 == 0)
  {
    if (gbIsLoggerInit)
    {
      uint32_t v30 = gpsExFatLog;
      os_log_type_t v31 = gpeExfatToOsLevel[0];
      if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel[0]))
      {
        *(_DWORD *)long long buf = 136315138;
        *(void *)&uint8_t buf[4] = "DIROPS_PurgeNodeMetaBlocksFromCache";
        uint64_t v32 = "%s: Should only be called with a directory or a symlink. Exiting.";
        int v33 = buf;
LABEL_43:
        _os_log_impl(&dword_22C0F9000, v30, v31, v32, v33, 0xCu);
      }
    }
    return 0;
  }
  else
  {
    BOOL v5 = 0;
    unsigned int v6 = 0;
    uint64_t v7 = *(void *)(a1 + 216);
    uint64_t v37 = 0;
    uint64_t v8 = *(void *)(v7 + 48);
    unsigned int v9 = *(_DWORD *)(v7 + 56);
    unsigned int v10 = *(_DWORD *)(v7 + 40);
    unsigned int v11 = *(_DWORD *)(a1 + 428);
    int v12 = v9 / v10;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    *(_OWORD *)long long buf = 0u;
    long long v43 = 0u;
    unsigned int v13 = ((unint64_t)v8 + 1066) / v8 * v8;
    unsigned int v35 = v10;
    unsigned int v36 = v9;
    while (2)
    {
      if (v11 < 2 || v11 > *(_DWORD *)(v7 + 80) || v5) {
        return 0;
      }
      unint64_t v14 = 0;
      BOOL v5 = 0;
      uint64_t v15 = &buf[8];
      do
      {
        BOOL v16 = v11 > *(_DWORD *)(v7 + 80) || v14 > 7;
        if (v16 || v5) {
          break;
        }
        if (*(unsigned char *)(a1 + 444))
        {
          unsigned int v17 = *(_DWORD *)(a1 + 436);
          int v18 = v17;
        }
        else
        {
          int v18 = FAT_Access_M_ContiguousClustersInChain(v7, v11, (unsigned int *)&v37, (_DWORD *)&v37 + 1);
          uint64_t v19 = HIDWORD(v37);
          if (HIDWORD(v37))
          {
            if (gbIsLoggerInit)
            {
              int v28 = gpsExFatLog;
              if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)int v38 = 136315394;
                uint64_t v39 = "DIROPS_PurgeNodeMetaBlocksFromCache";
                __int16 v40 = 1024;
                int v41 = v19;
                os_log_type_t v29 = "%s: Failed to get the next cluster(s). Error = %d.";
                goto LABEL_49;
              }
            }
            return v19;
          }
          unsigned int v17 = *(_DWORD *)(a1 + 436);
          unsigned int v10 = v35;
          unsigned int v9 = v36;
        }
        v6 += v18;
        if (v6 > v17)
        {
          if (gbIsLoggerInit)
          {
            uint32_t v30 = gpsExFatLog;
            os_log_type_t v31 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)int v38 = 136315138;
              uint64_t v39 = "DIROPS_PurgeNodeMetaBlocksFromCache";
              uint64_t v32 = "%s: There are more clusters than expected. Exiting.";
              int v33 = v38;
              goto LABEL_43;
            }
          }
          return 0;
        }
        *((void *)v15 - 1) = *(void *)(v7 + 64) + *(void *)(v7 + 56) * (v11 - 2);
        unsigned int v20 = *(_DWORD *)(a1 + 208) - 1;
        int v21 = v18 * v9;
        if (v18 * v9 >= v13) {
          int v21 = v13;
        }
        unsigned int v22 = v13 - v21;
        BOOL v23 = v13 == v21;
        BOOL v24 = v20 > 1;
        if (v20 <= 1) {
          int v25 = v10;
        }
        else {
          int v25 = v21;
        }
        if (v24) {
          int v26 = 1;
        }
        else {
          int v26 = v18 * v12;
        }
        BOOL v5 = v24 && v23;
        if (v24) {
          unsigned int v13 = v22;
        }
        *(_DWORD *)uint64_t v15 = v25;
        *((_DWORD *)v15 + 1) = v26;
        v15 += 16;
        ++v14;
        unsigned int v11 = v37;
      }
      while (v37 > 1);
      uint64_t v27 = metaPurge((unsigned int *)v7, (uint64_t)buf, v14);
      HIDWORD(v37) = v27;
      unsigned int v10 = v35;
      unsigned int v9 = v36;
      if (!v27) {
        continue;
      }
      break;
    }
    uint64_t v19 = v27;
    if (gbIsLoggerInit)
    {
      int v28 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int v38 = 136315394;
        uint64_t v39 = "DIROPS_PurgeNodeMetaBlocksFromCache";
        __int16 v40 = 1024;
        int v41 = v19;
        os_log_type_t v29 = "%s: Failed to purge clusters. Error = %d.";
LABEL_49:
        _os_log_impl(&dword_22C0F9000, v28, OS_LOG_TYPE_ERROR, v29, v38, 0x12u);
        return HIDWORD(v37);
      }
    }
  }
  return v19;
}

uint64_t DIROPS_CreateNewEntry(uint64_t a1, char *a2, uint64_t a3, unsigned int a4, int a5, uint64_t a6, uint64_t a7, char a8, void *a9)
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  unint64_t v63 = 0;
  unsigned int v17 = *(char **)(a3 + 8);
  if (a5 != 2 && (v17 & 2) == 0)
  {
    if (!gbIsLoggerInit) {
      return 22;
    }
    uint64_t v18 = gpsExFatLog;
    if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_FAULT)) {
      return 22;
    }
    *(_DWORD *)long long buf = 134218240;
    uint64_t v65 = v17;
    __int16 v66 = 1024;
    LODWORD(v67) = a5;
    uint64_t v19 = "DIROPS_CreateNewEntry: Invalid mode or type[%#llx, %d]";
    unsigned int v20 = v18;
    os_log_type_t v21 = OS_LOG_TYPE_FAULT;
    uint32_t v22 = 18;
LABEL_6:
    _os_log_impl(&dword_22C0F9000, v20, v21, v19, buf, v22);
    return 22;
  }
  if (((unsigned __int16)v17 & 0x1385) == 0)
  {
    if ((*(_DWORD *)(a1 + 208) - 1) >= 2)
    {
      if (gbIsLoggerInit)
      {
        uint64_t v27 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_22C0F9000, v27, OS_LOG_TYPE_ERROR, "DIROPS_CreateNewEntry: FolderNode is not a directory.\n", buf, 2u);
        }
      }
      return 20;
    }
    if ((a5 - 4) <= 0xFFFFFFFC)
    {
      if (!gbIsLoggerInit) {
        return 22;
      }
      uint64_t v25 = gpsExFatLog;
      if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
        return 22;
      }
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v65) = 0;
      uint64_t v19 = "DIROPS_CreateNewEntry: Got invalid new entry type [%d].\n";
      unsigned int v20 = v25;
      os_log_type_t v21 = OS_LOG_TYPE_ERROR;
      uint32_t v22 = 8;
      goto LABEL_6;
    }
    uint64_t v60 = *(void *)(a1 + 216);
    int v28 = (unsigned __int16 *)malloc_type_malloc(0x200uLL, 0x10000407EBBDD04uLL);
    if (!v28)
    {
      if (gbIsLoggerInit)
      {
        uint64_t v37 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_22C0F9000, v37, OS_LOG_TYPE_ERROR, "DIROPS_CreateNewEntry: Failed to allocate psName.\n", buf, 2u);
        }
      }
      return 12;
    }
    os_log_type_t v29 = v28;
    *((_OWORD *)v28 + 30) = 0u;
    *((_OWORD *)v28 + 31) = 0u;
    *((_OWORD *)v28 + 28) = 0u;
    *((_OWORD *)v28 + 29) = 0u;
    *((_OWORD *)v28 + 26) = 0u;
    *((_OWORD *)v28 + 27) = 0u;
    *((_OWORD *)v28 + 24) = 0u;
    *((_OWORD *)v28 + 25) = 0u;
    *((_OWORD *)v28 + 22) = 0u;
    *((_OWORD *)v28 + 23) = 0u;
    *((_OWORD *)v28 + 20) = 0u;
    *((_OWORD *)v28 + 21) = 0u;
    *((_OWORD *)v28 + 18) = 0u;
    *((_OWORD *)v28 + 19) = 0u;
    *((_OWORD *)v28 + 16) = 0u;
    *((_OWORD *)v28 + 17) = 0u;
    *((_OWORD *)v28 + 14) = 0u;
    *((_OWORD *)v28 + 15) = 0u;
    *((_OWORD *)v28 + 12) = 0u;
    *((_OWORD *)v28 + 13) = 0u;
    *((_OWORD *)v28 + 10) = 0u;
    *((_OWORD *)v28 + 11) = 0u;
    *((_OWORD *)v28 + 8) = 0u;
    *((_OWORD *)v28 + 9) = 0u;
    *((_OWORD *)v28 + 6) = 0u;
    *((_OWORD *)v28 + 7) = 0u;
    *((_OWORD *)v28 + 4) = 0u;
    *((_OWORD *)v28 + 5) = 0u;
    *((_OWORD *)v28 + 2) = 0u;
    *((_OWORD *)v28 + 3) = 0u;
    *(_OWORD *)int v28 = 0u;
    *((_OWORD *)v28 + 1) = 0u;
    size_t v30 = strlen(a2);
    char v61 = v29;
    uint64_t v31 = CONV_UTF8ToUnistr255((unsigned __int8 *)a2, v30, v29);
    if (v31)
    {
      uint64_t v24 = v31;
      if (gbIsLoggerInit)
      {
        uint64_t v32 = gpsExFatLog;
        int v33 = a9;
        if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
LABEL_70:
          free(v61);
          if (v33 && !v24) {
            void *v33 = v63;
          }
          return v24;
        }
        *(_WORD *)long long buf = 0;
        uint64_t v34 = "DIROPS_CreateNewEntry:  fail to convert utf8 -> utf16.\n";
        unsigned int v35 = v32;
        uint32_t v36 = 2;
LABEL_27:
        _os_log_impl(&dword_22C0F9000, v35, OS_LOG_TYPE_ERROR, v34, buf, v36);
        goto LABEL_70;
      }
    }
    else if (a4 && (a4 == 1 || *(_DWORD *)(v60 + 80) < a4))
    {
      if (gbIsLoggerInit)
      {
        int v38 = gpsExFatLog;
        int v33 = a9;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 136315394;
          uint64_t v65 = a2;
          __int16 v66 = 1024;
          LODWORD(v67) = a4;
          _os_log_impl(&dword_22C0F9000, v38, OS_LOG_TYPE_ERROR, "DIROPS_CreateNewEntry: got invalid first cluster for: %s %u.\n", buf, 0x12u);
        }
        uint64_t v24 = 0;
        goto LABEL_70;
      }
      uint64_t v24 = 0;
    }
    else
    {
      uint64_t v39 = v29 + 1;
      unsigned int v40 = *v29 / 0xFu;
      if (*v29 % 0xFu) {
        ++v40;
      }
      if (*v29)
      {
        int v41 = 0;
        uint64_t v42 = *v29;
        do
        {
          unsigned int v43 = *v39++;
          unsigned int v44 = *(unsigned __int16 *)(*(void *)(v60 + 2048) + 2 * v43);
          int v45 = (((unsigned __int16)v41 >> 1) | (v41 << 15)) + v44;
          int v41 = (((unsigned __int16)v45 >> 1) | (v45 << 15)) + (v44 >> 8);
          --v42;
        }
        while (v42);
      }
      else
      {
        LOWORD(v41) = 0;
      }
      char v62 = 0;
      unint64_t v46 = (unsigned __int16)(v40 + 2);
      int v59 = v40 + 2;
      uint64_t v47 = DIROPS_LookForFreeEntriesInDirectory(a1, v46, &v63, &v62);
      if (v47)
      {
        uint64_t v24 = v47;
        if (gbIsLoggerInit)
        {
          uint64_t v48 = gpsExFatLog;
          int v33 = a9;
          if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
            goto LABEL_70;
          }
          *(_DWORD *)long long buf = 67109120;
          LODWORD(v65) = v24;
          uint64_t v34 = "DIROPS_CreateNewEntry: Lookup for free directory entries failed with error [%d].\n";
          unsigned int v35 = v48;
          uint32_t v36 = 8;
          goto LABEL_27;
        }
      }
      else
      {
        long long v49 = malloc_type_malloc(0x2000uLL, 0x10000401B2BBF36uLL);
        if (v49)
        {
          uint64_t v50 = v49;
          DIROPS_CreateFileEntrySet(v49, (uint64_t)v61, a3, a4, v41, v59, a5, a7, a6, a8);
          unint64_t v51 = v63;
          int v52 = v50;
          uint64_t v53 = DIROPS_SaveNewEntriesIntoDevice(a1, v50, v63, v59);
          if (v53)
          {
            uint64_t v24 = v53;
            int v33 = a9;
            if (gbIsLoggerInit)
            {
              uint64_t v54 = gpsExFatLog;
              if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 67109120;
                LODWORD(v65) = v24;
                _os_log_impl(&dword_22C0F9000, v54, OS_LOG_TYPE_ERROR, "DIROPS_CreateNewEntry: Save new entries to device failed with error [%d].\n", buf, 8u);
              }
            }
          }
          else
          {
            if (v62) {
              unint64_t v56 = v51 + 32 * v46;
            }
            else {
              unint64_t v56 = 0;
            }
            *(void *)(a1 + 536) = v56;
            uint64_t v57 = *(void *)(a1 + 512);
            ++*(void *)(a1 + 504);
            if (v57)
            {
              uint64_t v24 = ht_insert(v60, v57, v61, v51, 0);
              if (v24)
              {
                if (gbIsLoggerInit)
                {
                  uint64_t v58 = gpsExFatLog;
                  if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)long long buf = 67109120;
                    LODWORD(v65) = v24;
                    _os_log_impl(&dword_22C0F9000, v58, OS_LOG_TYPE_ERROR, "DIROPS_CreateNewEntry: ht_insert failed with [%d].\n", buf, 8u);
                  }
                }
              }
            }
            else
            {
              uint64_t v24 = 0;
            }
            int v33 = a9;
          }
          free(v52);
          goto LABEL_70;
        }
        if (gbIsLoggerInit)
        {
          BOOL v55 = gpsExFatLog;
          int v33 = a9;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_22C0F9000, v55, OS_LOG_TYPE_ERROR, "DIROPS_CreateNewEntry: Failed to allocate FileSet.\n", buf, 2u);
          }
          uint64_t v24 = 12;
          goto LABEL_70;
        }
        uint64_t v24 = 12;
      }
    }
    int v33 = a9;
    goto LABEL_70;
  }
  if (!gbIsLoggerInit) {
    return 22;
  }
  BOOL v23 = gpsExFatLog;
  if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
    return 22;
  }
  *(_DWORD *)long long buf = 134218240;
  uint64_t v65 = v17;
  __int16 v66 = 2048;
  uint64_t v67 = 4997;
  uint64_t v24 = 22;
  _os_log_impl(&dword_22C0F9000, v23, OS_LOG_TYPE_ERROR, "DIROPS_CreateNewEntry: Setting readonly fields, %#llx 0x%llx]", buf, 0x16u);
  return v24;
}

uint64_t DIROPS_LookForFreeEntriesInDirectory(uint64_t a1, unint64_t a2, unint64_t *a3, unsigned char *a4)
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 216);
  *a3 = 0;
  if ((*(_DWORD *)(a1 + 208) - 1) >= 2)
  {
    if (gbIsLoggerInit)
    {
      unsigned int v20 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)unint64_t v51 = 0;
        _os_log_impl(&dword_22C0F9000, v20, OS_LOG_TYPE_ERROR, "DIROPS_LookForFreeEntriesInDirectory: Folder node is not a directory.\n", v51, 2u);
      }
    }
    return 20;
  }
  uint64_t v9 = *(unsigned int *)(a1 + 436);
  unsigned int v10 = *(_DWORD *)(a1 + 432);
  unsigned int v62 = v10;
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
  *(_OWORD *)unint64_t v51 = 0u;
  unint64_t v11 = *(void *)(a1 + 536);
  unint64_t v50 = 0;
  int v12 = malloc_type_malloc(0x200uLL, 0x10000407EBBDD04uLL);
  if (!v12)
  {
    if (gbIsLoggerInit)
    {
      uint32_t v22 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_22C0F9000, v22, OS_LOG_TYPE_ERROR, "DIROPS_LookForFreeEntriesInDirectory: Failed to allocate memory.\n", buf, 2u);
      }
    }
    return 12;
  }
  unsigned int v13 = v12;
  uint64_t v45 = v9;
  long long v49 = 0;
  unsigned int v14 = DIROPS_AllocateDirBlockBuffer(v4, &v49);
  unsigned int v63 = v14;
  if (v14)
  {
    if (gbIsLoggerInit)
    {
      unsigned int v15 = v14;
      uint64_t v16 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        uint64_t v65 = "DIROPS_LookForFreeEntriesInDirectory";
        __int16 v66 = 1024;
        unsigned int v67 = v15;
        unsigned int v17 = "%s: Couldn't allocate dir block buffer. error = %d.\n";
        uint64_t v18 = v16;
        uint32_t v19 = 18;
LABEL_7:
        _os_log_impl(&dword_22C0F9000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
      }
    }
    goto LABEL_33;
  }
  unint64_t v23 = 0;
  *a4 = 1;
  while (1)
  {
    int DirEntryByOffset = DIROPS_GetDirEntryByOffset(a1, v11, &v50, v51, v13, v49, 0, &v63);
    if (DirEntryByOffset == 16)
    {
      *a4 = 0;
      if (v23)
      {
        ++v23;
      }
      else if ((v11 + 32) % *(unsigned int *)(v4 + 48))
      {
        *a3 = v11;
        unint64_t v23 = 1;
      }
      else
      {
        unint64_t v23 = 0;
      }
      goto LABEL_32;
    }
    if ((DirEntryByOffset - 17) <= 5)
    {
      unint64_t v23 = 0;
      *a3 = 0;
      goto LABEL_32;
    }
    if (DirEntryByOffset == 25)
    {
      *a4 = 0;
      if (gbIsLoggerInit)
      {
        uint64_t v25 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel))
        {
          *(_DWORD *)long long buf = 136315138;
          uint64_t v65 = "DIROPS_LookForFreeEntriesInDirectory";
          _os_log_impl(&dword_22C0F9000, v25, (os_log_type_t)gpeExfatToOsLevel, "%s: Failed reading current dir entry. Trying to continue enumeration.", buf, 0xCu);
        }
      }
      goto LABEL_32;
    }
    if (DirEntryByOffset == 26)
    {
      *a4 = 0;
      if (!gbIsLoggerInit) {
        goto LABEL_33;
      }
      uint64_t v26 = gpsExFatLog;
      if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_33;
      }
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v65) = v63;
      unsigned int v17 = "DIROPS_LookForFreeEntriesInDirectory: Dir entry lookup result == %d.\n";
      goto LABEL_73;
    }
    if (DirEntryByOffset == 27) {
      break;
    }
LABEL_32:
    unint64_t v11 = v50;
    if (v23 >= a2) {
      goto LABEL_33;
    }
  }
  unint64_t v27 = (*(void *)(v4 + 56) * v45 - v11) >> 5;
  if (v23) {
    goto LABEL_44;
  }
  if ((v11 + 32) % *(unsigned int *)(v4 + 48))
  {
    *a3 = v11;
    goto LABEL_44;
  }
  unint64_t v46 = (*(void *)(v4 + 56) * v45 - v11) >> 5;
  int v28 = malloc_type_calloc(1uLL, 0x2000uLL, 0x10000401B2BBF36uLL);
  if (v28)
  {
    *(unsigned char *)int v28 = 5;
    unsigned int v44 = v28;
    DIROPS_SaveNewEntriesIntoDevice(a1, v28, v11, 1);
    free(v44);
    *a3 = v11 + 32;
    unint64_t v27 = v46 - 1;
LABEL_44:
    unint64_t v29 = v27 + v23;
    if (v27 + v23 < a2)
    {
      unint64_t v47 = v27;
      uint64_t v48 = 0;
      size_t v30 = (char *)(a1 + 444);
      int v31 = *(unsigned __int8 *)(a1 + 444);
      unint64_t v32 = (*(void *)(v4 + 56) + 32 * (a2 - v23) - 1) / *(void *)(v4 + 56);
      unsigned int v33 = FAT_Access_M_AllocateClusters(v4, v32, v10, (unsigned char *)(a1 + 444), &v48, &v62, (int *)&v48 + 1, 0, 0, *(_DWORD *)(a1 + 428), 0, 0);
      unsigned int v63 = v33;
      if (v33)
      {
        if (gbIsLoggerInit)
        {
          unsigned int v34 = v33;
          unsigned int v35 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 67109120;
            LODWORD(v65) = v34;
            _os_log_impl(&dword_22C0F9000, v35, OS_LOG_TYPE_ERROR, "DIROPS_LookForFreeEntriesInDirectory: Failed to allocate new cluster for dir expand [%d].\n", buf, 8u);
          }
        }
        unsigned int v62 = 0;
        goto LABEL_33;
      }
      unsigned int v36 = DIROPS_ClearNewDirectoryClusters(v4, v48, HIDWORD(v48), *v30);
      unsigned int v63 = v36;
      if (v36)
      {
        if (gbIsLoggerInit)
        {
          unsigned int v37 = v36;
          int v38 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 136315394;
            uint64_t v65 = "DIROPS_LookForFreeEntriesInDirectory";
            __int16 v66 = 1024;
            unsigned int v67 = v37;
            _os_log_impl(&dword_22C0F9000, v38, OS_LOG_TYPE_ERROR, "%s: Failed to zero-fill new cluster(s) for dir expand. Error = %d.", buf, 0x12u);
          }
        }
        FAT_Access_M_FATChainFree(v4, v48, 1, v30, SHIDWORD(v48));
        goto LABEL_33;
      }
      *(_DWORD *)(a1 + 436) += v32;
      *(_DWORD *)(a1 + 432) = v62;
      if (*(_DWORD *)(a1 + 208) != 1)
      {
        if (v31 && !*v30) {
          *(unsigned char *)(a1 + 281) &= ~2u;
        }
        uint64_t v39 = HIDWORD(v48);
        *(void *)(a1 + 304) += *(void *)(v4 + 56) * HIDWORD(v48);
        *(void *)(a1 + 288) += *(void *)(v4 + 56) * v39;
        unsigned int updated = DIROPS_UpdateDirectoryEntries(a1, a1 + 248, (_OWORD *)(a1 + 280), 1, 1);
        unsigned int v63 = updated;
        if (updated)
        {
          if (!gbIsLoggerInit) {
            goto LABEL_33;
          }
          unsigned int v41 = updated;
          uint64_t v26 = gpsExFatLog;
          if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
            goto LABEL_33;
          }
          *(_DWORD *)long long buf = 67109120;
          LODWORD(v65) = v41;
          unsigned int v17 = "DIROPS_LookForFreeEntriesInDirectory: Failed to update DirEntries with new allocated clusters [%d].\n";
          goto LABEL_73;
        }
      }
      unint64_t v29 = v47 + ((*(void *)(v4 + 56) * (unint64_t)v32) >> 5) + v23;
    }
    if (v29 >= a2 || gbIsLoggerInit == 0) {
      goto LABEL_33;
    }
    uint64_t v26 = gpsExFatLog;
    if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_33;
    }
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v65) = v63;
    unsigned int v17 = "DIROPS_LookForFreeEntriesInDirectory: Failed to allocate new cluster for dir expand [%d].\n";
LABEL_73:
    uint64_t v18 = v26;
    uint32_t v19 = 8;
    goto LABEL_7;
  }
  unsigned int v63 = 12;
  if (gbIsLoggerInit)
  {
    uint64_t v42 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v65 = "DIROPS_LookForFreeEntriesInDirectory";
      unsigned int v17 = "%s: Failed to allocate dir entry.";
      uint64_t v18 = v42;
      uint32_t v19 = 12;
      goto LABEL_7;
    }
  }
LABEL_33:
  free(v13);
  if (v49) {
    DIROPS_FreeDirBlockBuffer((void **)v49);
  }
  return v63;
}

void *DIROPS_CreateFileEntrySet(unsigned char *a1, uint64_t a2, uint64_t a3, int a4, __int16 a5, char a6, int a7, uint64_t a8, uint64_t a9, char a10)
{
  bzero(a1, 0x2000uLL);
  *a1 = -123;
  a1[1] = a6 - 1;
  uint64_t v45 = (unsigned char *)a2;
  if (a7 == 2) {
    __int16 v18 = 16;
  }
  else {
    __int16 v18 = 32;
  }
  *((_WORD *)a1 + 2) = v18 | (2 * (*(_WORD *)(a2 + 2) == 46));
  __tp.tv_seCC_MD5_CTX c = 0;
  __tp.tv_nseCC_MD5_CTX c = 0;
  uint64_t v48 = 0;
  __int16 v47 = 0;
  __int16 v46 = 0;
  CONV_GetCurrentTime(&__tp);
  uint32_t v19 = (uint64_t *)((char *)&v48 + 4);
  unsigned int v20 = (char *)&v47 + 1;
  os_log_type_t v21 = (char *)&v46 + 1;
  uint64_t result = exfat_timestamp_from_unix((_DWORD *)&v48 + 1, (unsigned char *)&v47 + 1, (unsigned char *)&v46 + 1, &__tp);
  if ((*(unsigned char *)(a3 + 9) & 0x20) != 0)
  {
    long long v49 = *(_OWORD *)(a3 + 128);
    uint32_t v19 = &v48;
    unsigned int v20 = (char *)&v47;
    os_log_type_t v21 = (char *)&v46;
    uint64_t result = exfat_timestamp_from_unix(&v48, &v47, &v46, &v49);
  }
  char v23 = *v21;
  char v24 = *v20;
  *((_DWORD *)a1 + 2) = *(_DWORD *)v19;
  a1[20] = v24;
  a1[22] = v23;
  if ((*(unsigned char *)(a3 + 9) & 8) != 0)
  {
    long long v49 = *(_OWORD *)(a3 + 96);
    unint64_t v27 = &v48;
    uint64_t v26 = (char *)&v47;
    uint64_t v25 = (char *)&v46;
    uint64_t result = exfat_timestamp_from_unix(&v48, &v47, &v46, &v49);
  }
  else
  {
    uint64_t v25 = (char *)&v46 + 1;
    uint64_t v26 = (char *)&v47 + 1;
    unint64_t v27 = (uint64_t *)((char *)&v48 + 4);
  }
  char v28 = *v25;
  char v29 = *v26;
  *((_DWORD *)a1 + 3) = *(_DWORD *)v27;
  a1[21] = v29;
  a1[23] = v28;
  if ((*(unsigned char *)(a3 + 9) & 4) != 0)
  {
    long long v49 = *(_OWORD *)(a3 + 80);
    int v31 = &v48;
    size_t v30 = (char *)&v46;
    uint64_t result = exfat_timestamp_from_unix(&v48, &v47, &v46, &v49);
  }
  else
  {
    size_t v30 = (char *)&v46 + 1;
    int v31 = (uint64_t *)((char *)&v48 + 4);
  }
  uint64_t v32 = 0;
  unsigned __int16 v33 = 0;
  char v34 = *v30;
  *((_DWORD *)a1 + 4) = *(_DWORD *)v31;
  a1[24] = v34;
  do
  {
    if ((v32 & 0xFFFFFFFE) != 2) {
      unsigned __int16 v33 = ((v33 >> 1) | (v33 << 15)) + a1[v32];
    }
    ++v32;
  }
  while (v32 != 32);
  a1[32] = -64;
  if (a10) {
    char v35 = 3;
  }
  else {
    char v35 = 1;
  }
  a1[33] = v35;
  a1[35] = *v45;
  *((_WORD *)a1 + 18) = a5;
  *((_DWORD *)a1 + 13) = a4;
  *((void *)a1 + 5) = a9;
  *((void *)a1 + 7) = a8;
  for (uint64_t i = 32; i != 64; ++i)
  {
    if ((i & 0xFFFFFFFE) != 2) {
      unsigned __int16 v33 = ((v33 >> 1) | (v33 << 15)) + a1[i];
    }
  }
  int v37 = a1[1];
  uint64_t v38 = (v37 - 1);
  if (v37 != 1)
  {
    uint64_t v39 = 0;
    unsigned __int16 v40 = 2 * *(_WORD *)v45;
    LODWORD(v41) = 64;
    do
    {
      if (v40 >= 0xFu) {
        int v42 = 15;
      }
      else {
        int v42 = v40;
      }
      uint64_t v43 = (uint64_t)&a1[32 * v39 + 64];
      *(unsigned char *)uint64_t v43 = -63;
      *(void *)(v43 + 18) = 0;
      *(void *)(v43 + 10) = 0;
      *(void *)(v43 + 24) = 0;
      *(void *)(v43 + 2) = 0;
      uint64_t result = memcpy((void *)(v43 + 2), &v45[2 * (15 * v39) + 2], (2 * v42));
      unint64_t v44 = (32 * v39 + 96) & 0x1FFFFFFFE0;
      if (v44 > v41)
      {
        do
        {
          if ((v41 & 0xFFFFFFFE) != 2) {
            unsigned __int16 v33 = ((v33 >> 1) | (v33 << 15)) + *(unsigned __int8 *)(v43 + (v41 & 0x1F));
          }
          unint64_t v41 = (v41 + 1);
        }
        while (v44 > v41);
      }
      v40 -= 2 * v42;
      ++v39;
    }
    while (v39 != v38);
  }
  *((_WORD *)a1 + 1) = v33;
  return result;
}

uint64_t DIROPS_SaveNewEntriesIntoDevice(uint64_t a1, _OWORD *a2, unint64_t a3, int a4)
{
  LODWORD(v4) = a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v8 = *(void *)(a1 + 216);
  size_t v9 = *(void *)(v8 + 40);
  uint64_t v25 = 0;
  uint64_t v10 = DIROPS_AllocateDirBlockBuffer(v8, &v25);
  if (!v10)
  {
    size_t v13 = a3 / v9;
    uint64_t DirBlockRelative = DIROPS_GetDirBlockRelative(a1, a3 / v9, (uint64_t *)&v25, 0);
    if (DirBlockRelative)
    {
      uint64_t v11 = DirBlockRelative;
      if (gbIsLoggerInit)
      {
        unsigned int v15 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
LABEL_8:
          *(_DWORD *)long long buf = 136315394;
          unint64_t v27 = "DIROPS_SaveNewEntriesIntoDevice";
          __int16 v28 = 1024;
          int v29 = v11;
          uint64_t v16 = "%s: Couldn't get dir block. error = [%d].\n";
LABEL_9:
          _os_log_impl(&dword_22C0F9000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0x12u);
        }
      }
    }
    else
    {
      if (v4)
      {
        uint64_t v17 = (v4 - 1);
        uint64_t v4 = v4;
        while (1)
        {
          __int16 v18 = (_OWORD *)(*(void *)v25 + ((a3 % v9) & 0xFFFFFFFFFFFFFFE0));
          long long v19 = a2[1];
          *__int16 v18 = *a2;
          v18[1] = v19;
          a3 += 32;
          if (!(a3 % v9) || !v17)
          {
            unsigned int v20 = (const char *)*((void *)v25 + 1);
            if ((unint64_t)v20 < *(void *)(v8 + 64))
            {
              if (gbIsLoggerInit)
              {
                char v24 = gpsExFatLog;
                if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)long long buf = 134217984;
                  unint64_t v27 = v20;
                  _os_log_impl(&dword_22C0F9000, v24, OS_LOG_TYPE_ERROR, "DIROPS_SaveNewEntriesIntoDevice write dir offset is within cluster offset zone = %llu\n", buf, 0xCu);
                }
              }
              uint64_t v11 = 14;
              goto LABEL_21;
            }
            uint64_t v21 = metaWrite((int *)v8, *(void **)v25, *((void *)v25 + 1), v9);
            if (v21)
            {
              uint64_t v11 = v21;
              if (gbIsLoggerInit)
              {
                unsigned int v15 = gpsExFatLog;
                if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)long long buf = 136315394;
                  unint64_t v27 = "DIROPS_SaveNewEntriesIntoDevice";
                  __int16 v28 = 1024;
                  int v29 = v11;
                  uint64_t v16 = "%s: failed to update dir entry, error = %d.\n";
                  goto LABEL_9;
                }
              }
              goto LABEL_21;
            }
            if (!(a3 % v9))
            {
              if (v17)
              {
                LODWORD(v13) = v13 + 1;
                uint64_t v22 = DIROPS_GetDirBlockRelative(a1, v13, (uint64_t *)&v25, 0);
                if (v22) {
                  break;
                }
              }
            }
          }
          a2 += 2;
          --v17;
          if (!--v4) {
            goto LABEL_20;
          }
        }
        uint64_t v11 = v22;
        if (!gbIsLoggerInit) {
          goto LABEL_21;
        }
        unsigned int v15 = gpsExFatLog;
        if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
          goto LABEL_21;
        }
        goto LABEL_8;
      }
LABEL_20:
      uint64_t v11 = 0;
    }
LABEL_21:
    DIROPS_FreeDirBlockBuffer((void **)v25);
    return v11;
  }
  uint64_t v11 = v10;
  if (gbIsLoggerInit)
  {
    int v12 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      unint64_t v27 = "DIROPS_SaveNewEntriesIntoDevice";
      __int16 v28 = 1024;
      int v29 = v11;
      _os_log_impl(&dword_22C0F9000, v12, OS_LOG_TYPE_ERROR, "%s: Couldn't allocate dir block buffer. error = %d.\n", buf, 0x12u);
    }
  }
  return v11;
}

uint64_t DIROPS_MarkNodeDirEntriesAsDeleted(void *a1, uint64_t a2, char *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1[27];
  size_t v6 = *(void *)(v5 + 40);
  unint64_t v7 = *(void *)(a2 + 72);
  int v29 = 0;
  uint64_t v8 = a1[64];
  if (v8)
  {
    uint64_t v9 = ht_remove(v5, v8, a3, v7);
    if (v9)
    {
      uint64_t v10 = v9;
      if (gbIsLoggerInit)
      {
        uint64_t v11 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 67109120;
          LODWORD(v31) = v10;
          int v12 = "ht_remove failed with err [%d]\n";
LABEL_6:
          size_t v13 = v11;
          uint32_t v14 = 8;
          goto LABEL_16;
        }
      }
      goto LABEL_17;
    }
  }
  uint64_t v15 = DIROPS_AllocateDirBlockBuffer(v5, &v29);
  if (v15)
  {
    uint64_t v10 = v15;
    if (gbIsLoggerInit)
    {
      uint64_t v16 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        int v31 = "DIROPS_MarkNodeDirEntriesAsDeleted";
        __int16 v32 = 1024;
        int v33 = v10;
        int v12 = "%s: Couldn't allocate dir block buffer. error = %d.\n";
        goto LABEL_15;
      }
    }
    goto LABEL_17;
  }
  unint64_t v17 = v7 / v6;
  uint64_t DirBlockRelative = DIROPS_GetDirBlockRelative((uint64_t)a1, v17, (uint64_t *)&v29, 0);
  if (DirBlockRelative)
  {
    uint64_t v10 = DirBlockRelative;
    if (gbIsLoggerInit)
    {
      uint64_t v16 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
    }
    goto LABEL_17;
  }
  if (!*(void *)(a2 + 88))
  {
LABEL_32:
    uint64_t v26 = a1[64];
    if (v26 && *(unsigned char *)(v26 + 4) && ht_reached_low_bound((_DWORD *)v26))
    {
      uint64_t v10 = DIROPS_PopulateHT((uint64_t)a1, a1[64], 1u);
      if (v10)
      {
        if (gbIsLoggerInit)
        {
          unint64_t v27 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 67109120;
            LODWORD(v31) = v10;
            _os_log_impl(&dword_22C0F9000, v27, OS_LOG_TYPE_ERROR, "DIROPS_MarkNodeDirEntriesAsDeleted: DIROPS_PopulateHT failed with err = [%d]\n", buf, 8u);
          }
        }
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
    *(unsigned char *)a2 &= ~0x80u;
    *(unsigned char *)(a2 + 32) &= ~0x80u;
    goto LABEL_17;
  }
  uint64_t v20 = 0;
  unint64_t v21 = *(void *)(a2 + 80);
  while (1)
  {
    *(unsigned char *)(*(void *)v29 + v21) &= ~0x80u;
    v21 += 32;
    if (!(v21 % v6) || (unint64_t v22 = *(void *)(a2 + 88), v20 == v22 - 1))
    {
      char v23 = (const char *)*((void *)v29 + 1);
      if ((unint64_t)v23 < *(void *)(v5 + 64))
      {
        if (gbIsLoggerInit)
        {
          __int16 v28 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 134217984;
            int v31 = v23;
            _os_log_impl(&dword_22C0F9000, v28, OS_LOG_TYPE_ERROR, "DIROPS_SaveNewEntriesIntoDevice write dir offset is within cluster offset zone = %llu\n", buf, 0xCu);
          }
        }
        uint64_t v10 = 14;
        goto LABEL_17;
      }
      uint64_t v24 = metaWrite((int *)v5, *(void **)v29, *((void *)v29 + 1), v6);
      if (v24)
      {
        uint64_t v10 = v24;
        if (gbIsLoggerInit)
        {
          uint64_t v11 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 67109120;
            LODWORD(v31) = v10;
            int v12 = "DIROPS_MarkNodeDirEntriesAsDeleted fail to write errno = [%d]\n";
            goto LABEL_6;
          }
        }
        goto LABEL_17;
      }
      unint64_t v22 = *(void *)(a2 + 88);
      if (v20 != v22 - 1) {
        break;
      }
    }
LABEL_31:
    if (++v20 >= v22) {
      goto LABEL_32;
    }
  }
  LODWORD(v17) = v17 + 1;
  uint64_t v25 = DIROPS_GetDirBlockRelative((uint64_t)a1, v17, (uint64_t *)&v29, 0);
  if (!v25)
  {
    unint64_t v21 = 0;
    unint64_t v22 = *(void *)(a2 + 88);
    goto LABEL_31;
  }
  uint64_t v10 = v25;
  if (!gbIsLoggerInit) {
    goto LABEL_17;
  }
  uint64_t v16 = gpsExFatLog;
  if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
    goto LABEL_17;
  }
LABEL_14:
  *(_DWORD *)long long buf = 136315394;
  int v31 = "DIROPS_MarkNodeDirEntriesAsDeleted";
  __int16 v32 = 1024;
  int v33 = v10;
  int v12 = "%s: Couldn't get dir block. error = %d.\n";
LABEL_15:
  size_t v13 = v16;
  uint32_t v14 = 18;
LABEL_16:
  _os_log_impl(&dword_22C0F9000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
LABEL_17:
  if (v29) {
    DIROPS_FreeDirBlockBuffer((void **)v29);
  }
  if (!v10) {
    a1[67] = 0;
  }
  return v10;
}

uint64_t DIROPS_GetDirBlockRelative(uint64_t a1, unsigned int a2, uint64_t *a3, int a4)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 216);
  unint64_t v5 = *(void *)(v4 + 56);
  unint64_t v6 = *(void *)(v4 + 40);
  uint64_t v7 = a2;
  unint64_t v8 = v6 * a2;
  memset(v38, 0, sizeof(v38));
  unsigned int v32 = 0;
  unint64_t v9 = v5 * *(unsigned int *)(a1 + 436);
  if (v8 >= v9)
  {
    if (gbIsLoggerInit)
    {
      uint32_t v14 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315650;
        uint64_t v34 = "DIROPS_GetDirBlockRelative";
        __int16 v35 = 2048;
        *(void *)unsigned int v36 = v8;
        *(_WORD *)&v36[8] = 2048;
        unint64_t v37 = v9;
        _os_log_impl(&dword_22C0F9000, v14, OS_LOG_TYPE_ERROR, "%s: offsetInDir [%llu] >= Dir Size = [%lu].\n", buf, 0x20u);
      }
    }
    return 4294967279;
  }
  else
  {
    int v13 = a4;
    if (a4 >= 9)
    {
      if (gbIsLoggerInit)
      {
        log = gpsExFatLog;
        int v13 = 8;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel))
        {
          *(_DWORD *)long long buf = 136315650;
          uint64_t v34 = "DIROPS_GetDirBlockRelative";
          __int16 v35 = 1024;
          *(_DWORD *)unsigned int v36 = a4;
          *(_WORD *)&v36[4] = 1024;
          *(_DWORD *)&v36[6] = 8;
          _os_log_impl(&dword_22C0F9000, log, (os_log_type_t)gpeExfatToOsLevel, "%s: blocksToReadAhead (%d) > FSKIT_META_MAX_READAHEAD (%d).", buf, 0x18u);
        }
      }
      else
      {
        int v13 = 8;
      }
    }
    *(_DWORD *)long long buf = 0;
    int v31 = 0;
    FILERECORD_GetChainFromCache(a1, v8, (unsigned int *)buf, &v31, (int *)&v32);
    uint64_t result = v32;
    if (!v32)
    {
      if (v31)
      {
        unint64_t v16 = v5 / v6;
        int v17 = v8 % v5 / v6 + *(_DWORD *)buf * (v5 / v6);
        if (a4 < 1)
        {
          uint64_t v19 = 0;
          uint64_t v25 = 0;
        }
        else
        {
          if (a2 + 1 <= *(_DWORD *)(a1 + 532))
          {
            uint64_t v19 = 0;
          }
          else
          {
            uint64_t v18 = v13;
            if (v13 < 1)
            {
              uint64_t v19 = 0;
            }
            else
            {
              uint64_t v19 = 0;
              unsigned int v20 = (*(_DWORD *)buf + v31) * v16 - 1;
              unint64_t v21 = (unint64_t *)v38 + 1;
              unint64_t v22 = v6 + v6 * v7;
              int v23 = v17;
              int v24 = v17;
              do
              {
                if (++v24 > v20)
                {
                  FILERECORD_GetChainFromCache(a1, v22, (unsigned int *)buf, &v31, (int *)&v32);
                  uint64_t result = v32;
                  if (v32) {
                    return result;
                  }
                  if (!v31) {
                    goto LABEL_24;
                  }
                  int v24 = *(_DWORD *)buf * v16;
                  unsigned int v20 = (*(_DWORD *)buf + v31) * v16 - 1;
                }
                *(v21 - 1) = *(void *)(v4 + 64) + *(void *)(v4 + 40) * (v24 - *(_DWORD *)(v4 + 84));
                unint64_t *v21 = v6;
                ++v19;
                v21 += 2;
                v22 += v6;
              }
              while (v18 != v19);
              uint64_t v19 = v18;
LABEL_24:
              int v17 = v23;
            }
            *(_DWORD *)(a1 + 532) = v19 + a2;
          }
          uint64_t v25 = v38;
        }
        size_t v26 = *(void *)(v4 + 40);
        uint64_t v27 = *a3;
        *(_DWORD *)(v27 + 16) = v17;
        off_t v28 = *(void *)(v4 + 64) + v26 * (v17 - *(_DWORD *)(v4 + 84));
        *(void *)(v27 + 8) = v28;
        uint64_t result = metaRead((int *)v4, *(void **)v27, v28, v26, (uint64_t)v25, v19);
        if (!result) {
          *(_DWORD *)(*a3 + 20) = a2;
        }
      }
      else
      {
        return 22;
      }
    }
  }
  return result;
}

uint64_t DIROPS_PopulateHT(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  size_t v26 = 0;
  unint64_t v27 = 0;
  memset(v25, 0, sizeof(v25));
  unint64_t v6 = malloc_type_malloc(0x200uLL, 0x10000407EBBDD04uLL);
  if (!v6)
  {
    if (gbIsLoggerInit)
    {
      uint32_t v14 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_22C0F9000, v14, OS_LOG_TYPE_ERROR, "DIROPS_PopulateHT: Failed to allocate memory", buf, 2u);
      }
    }
    return 12;
  }
  uint64_t v7 = v6;
  v6[30] = 0u;
  v6[31] = 0u;
  v6[28] = 0u;
  v6[29] = 0u;
  v6[26] = 0u;
  v6[27] = 0u;
  v6[24] = 0u;
  v6[25] = 0u;
  v6[22] = 0u;
  v6[23] = 0u;
  v6[20] = 0u;
  v6[21] = 0u;
  v6[18] = 0u;
  v6[19] = 0u;
  v6[16] = 0u;
  v6[17] = 0u;
  v6[14] = 0u;
  v6[15] = 0u;
  v6[12] = 0u;
  v6[13] = 0u;
  v6[10] = 0u;
  v6[11] = 0u;
  v6[8] = 0u;
  v6[9] = 0u;
  v6[6] = 0u;
  v6[7] = 0u;
  v6[4] = 0u;
  v6[5] = 0u;
  v6[2] = 0u;
  v6[3] = 0u;
  *unint64_t v6 = 0u;
  v6[1] = 0u;
  unsigned int DirBlockBuffer = DIROPS_AllocateDirBlockBuffer(*(void *)(a1 + 216), (void **)&v26);
  unsigned int v28 = DirBlockBuffer;
  if (DirBlockBuffer)
  {
    if (gbIsLoggerInit)
    {
      unsigned int v9 = DirBlockBuffer;
      uint64_t v10 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        uint64_t v30 = "DIROPS_PopulateHT";
        __int16 v31 = 1024;
        unsigned int v32 = v9;
        uint64_t v11 = "%s: Couldn't allocate dir block buffer. error = %d.\n";
        int v12 = v10;
        uint32_t v13 = 18;
LABEL_6:
        _os_log_impl(&dword_22C0F9000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
      }
    }
    goto LABEL_36;
  }
  ht_set_incomplete(a2, 0);
  unint64_t v15 = 0;
  int v16 = 1;
  while (1)
  {
    int DirEntryByOffset = DIROPS_GetDirEntryByOffset(a1, v15, &v27, (unsigned __int8 *)v25, v7, v26, 4, &v28);
    int v18 = DirEntryByOffset;
    if ((DirEntryByOffset - 17) > 5) {
      break;
    }
    if (DirEntryByOffset == 17)
    {
      int v19 = ht_insert(*(void *)(a1 + 216), a2, v7, v15, 0);
      unsigned int v20 = (a3 & (v19 == 17)) != 0 ? 0 : v19;
      unsigned int v28 = v20;
      if (v20) {
        goto LABEL_36;
      }
    }
LABEL_27:
    unint64_t v15 = v27;
    if ((v18 - 28) >= 0xFFFFFFFE) {
      goto LABEL_36;
    }
  }
  if (DirEntryByOffset == 25)
  {
    if (gbIsLoggerInit)
    {
      unint64_t v21 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel))
      {
        *(_DWORD *)long long buf = 136315138;
        uint64_t v30 = "DIROPS_PopulateHT";
        _os_log_impl(&dword_22C0F9000, v21, (os_log_type_t)gpeExfatToOsLevel, "%s: Failed reading current dir entry. Trying to continue enumeration.", buf, 0xCu);
      }
    }
LABEL_26:
    int v16 = 0;
    goto LABEL_27;
  }
  if (DirEntryByOffset != 26)
  {
    if (DirEntryByOffset == 27)
    {
      if (v16) {
        unint64_t v23 = v15;
      }
      else {
        unint64_t v23 = 0;
      }
      *(void *)(a1 + 536) = v23;
      goto LABEL_36;
    }
    goto LABEL_26;
  }
  ht_set_incomplete(a2, 1);
  if (gbIsLoggerInit)
  {
    uint64_t v22 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v30) = v28;
      uint64_t v11 = "DIROPS_PopulateHT: DIROPS_GetDirEntryByOffset result == %d.\n";
      int v12 = v22;
      uint32_t v13 = 8;
      goto LABEL_6;
    }
  }
LABEL_36:
  free(v7);
  if (v26) {
    DIROPS_FreeDirBlockBuffer(v26);
  }
  return v28;
}

uint64_t DIROPS_UpdateDirectoryEntries(uint64_t a1, uint64_t a2, _OWORD *a3, int a4, char a5)
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  if (*(_DWORD *)(a1 + 208) == 1)
  {
    if (gbIsLoggerInit)
    {
      unint64_t v5 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_22C0F9000, v5, OS_LOG_TYPE_FAULT, "DIROPS_UpdateDirectoryEntries: Invalid node record", buf, 2u);
      }
    }
    return 22;
  }
  char v6 = a5;
  uint64_t v10 = *(void *)(a1 + 216);
  unint64_t v69 = *(void *)(v10 + 40);
  uint64_t v70 = a1;
  if (a5)
  {
    if (!a4)
    {
LABEL_8:
      uint64_t v11 = 0;
      int v12 = 0;
      uint32_t v13 = (_OWORD *)(a1 + 248);
      do
      {
        if ((v11 & 0xFFFFFFFE) != 2) {
          int v12 = (((unsigned __int16)v12 >> 1) | (v12 << 15)) + *(unsigned __int8 *)(a2 + v11);
        }
        ++v11;
      }
      while (v11 != 32);
      unint64_t v14 = *(void *)(a1 + 328);
      int v15 = *(_DWORD *)(a1 + 344);
      long long v71 = 0;
      uint64_t v16 = DIROPS_AllocateDirBlockBuffer(v10, &v71);
      if (v16)
      {
        uint64_t v17 = v16;
        if (gbIsLoggerInit)
        {
          uint64_t v18 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 136315394;
            *(void *)&uint8_t buf[4] = "DIROPS_UpdateDirectoryEntries";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v17;
            int v19 = "%s: Couldn't allocate dir block buffer. error = %d.\n";
            goto LABEL_16;
          }
        }
        goto LABEL_66;
      }
      __int16 v66 = v13;
      char v67 = v6;
      if (*(unsigned char *)(a2 + 1))
      {
        unint64_t v24 = 0;
        unsigned int v68 = 0;
        unint64_t v26 = v69;
        uint64_t v25 = v70;
        char v27 = 1;
        unint64_t v28 = 32;
        unsigned int v29 = 64;
        while (1)
        {
          v14 += 32;
          if (!(v14 % v26)) {
            break;
          }
          if (!v24) {
            goto LABEL_45;
          }
          if (v27) {
            goto LABEL_37;
          }
LABEL_38:
          unint64_t v36 = 32 * v24 + 64;
          if (v36 <= v28)
          {
            char v27 = 0;
          }
          else
          {
            do
            {
              if ((v28 & 0xFFFFFFFE) != 2) {
                int v12 = (((unsigned __int16)v12 >> 1) | (v12 << 15))
              }
                    + *(unsigned __int8 *)(*(void *)v71 + v14 + (v28 & 0x1F));
              ++v28;
            }
            while (v36 > v28);
            char v27 = 0;
            unint64_t v28 = v29;
          }
LABEL_49:
          ++v24;
          v29 += 32;
          if (v24 >= *(unsigned __int8 *)(a2 + 1)) {
            goto LABEL_64;
          }
        }
        if (v15 == *(_DWORD *)(v25 + 344))
        {
          uint64_t v30 = (int *)(v70 + 348);
        }
        else
        {
          unsigned int v31 = *(unsigned __int8 *)(v25 + 416);
          if (v68 >= v31)
          {
            if (gbIsLoggerInit)
            {
              unsigned int v62 = gpsExFatLog;
              char v6 = v67;
              if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)long long buf = 136315650;
                *(void *)&uint8_t buf[4] = "DIROPS_UpdateDirectoryEntries";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v68;
                __int16 v74 = 1024;
                unsigned int v75 = v31;
                _os_log_impl(&dword_22C0F9000, v62, OS_LOG_TYPE_FAULT, "%s %d %d", buf, 0x18u);
              }
              uint64_t v17 = 5;
              goto LABEL_66;
            }
            uint64_t v17 = 5;
            goto LABEL_117;
          }
          uint64_t v30 = (int *)(v25 + 4 * v68++ + 352);
        }
        unint64_t v14 = 0;
        int v15 = *v30;
        if (!v24)
        {
          char v27 = 1;
LABEL_45:
          if (v28 <= 0x3F)
          {
            do
            {
              if ((v28 & 0xFFFFFFFE) != 2) {
                int v12 = (((unsigned __int16)v12 >> 1) | (v12 << 15)) + *((unsigned __int8 *)a3 + (v28 & 0x1F));
              }
              ++v28;
            }
            while (v28 != 64);
          }
          goto LABEL_49;
        }
LABEL_37:
        size_t v32 = *(void *)(v10 + 40);
        uint64_t v33 = (void **)v71;
        *((_DWORD *)v71 + 4) = v15;
        off_t v34 = *(void *)(v10 + 64) + v32 * (v15 - *(_DWORD *)(v10 + 84));
        v33[1] = (void *)v34;
        uint64_t v35 = metaRead((int *)v10, *v33, v34, v32, 0, 0);
        unint64_t v26 = v69;
        uint64_t v25 = v70;
        if (v35)
        {
          uint64_t v17 = v35;
          if (gbIsLoggerInit)
          {
            uint64_t v18 = gpsExFatLog;
            char v6 = v67;
            if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
              goto LABEL_66;
            }
LABEL_80:
            *(_DWORD *)long long buf = 136315394;
            *(void *)&uint8_t buf[4] = "DIROPS_UpdateDirectoryEntries";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v17;
            int v19 = "%s: failed to get dir block, error = %d.\n";
LABEL_16:
            unsigned int v20 = v18;
            uint32_t v21 = 18;
LABEL_17:
            _os_log_impl(&dword_22C0F9000, v20, OS_LOG_TYPE_ERROR, v19, buf, v21);
            goto LABEL_66;
          }
LABEL_117:
          char v6 = v67;
          goto LABEL_66;
        }
        goto LABEL_38;
      }
      uint64_t v25 = v70;
LABEL_64:
      *(_WORD *)(a2 + 2) = v12;
      char v6 = v67;
      if (*(unsigned char *)(v25 + 564))
      {
LABEL_65:
        uint64_t v17 = 0;
        long long v41 = *(_OWORD *)(a2 + 16);
        _OWORD *v66 = *(_OWORD *)a2;
        v66[1] = v41;
        long long v42 = a3[1];
        *(_OWORD *)(v25 + 280) = *a3;
        *(_OWORD *)(v25 + 296) = v42;
        goto LABEL_66;
      }
      int v46 = *(_DWORD *)(v25 + 344);
      size_t v47 = *(void *)(v10 + 40);
      uint64_t v48 = (void **)v71;
      *((_DWORD *)v71 + 4) = v46;
      off_t v49 = *(void *)(v10 + 64) + v47 * (v46 - *(_DWORD *)(v10 + 84));
      v48[1] = (void *)v49;
      uint64_t v50 = v25;
      uint64_t v51 = metaRead((int *)v10, *v48, v49, v47, 0, 0);
      if (v51)
      {
        uint64_t v17 = v51;
        if (gbIsLoggerInit)
        {
          uint64_t v18 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
            goto LABEL_80;
          }
        }
        goto LABEL_66;
      }
      uint64_t v54 = *(void *)(v50 + 328);
      long long v55 = v71;
      long long v56 = (_OWORD *)(*(void *)v71 + v54);
      long long v57 = *(_OWORD *)(a2 + 16);
      _OWORD *v56 = *(_OWORD *)a2;
      v56[1] = v57;
      unint64_t v58 = v54 + 32;
      if (v58 % v69)
      {
LABEL_102:
        long long v59 = (_OWORD *)(*(void *)v55 + v58);
        long long v60 = a3[1];
        *long long v59 = *a3;
        v59[1] = v60;
        uint64_t v61 = metaWrite((int *)v10, *(void **)v55, *((void *)v55 + 1), *(void *)(v10 + 40));
        uint64_t v25 = v70;
        if (v61)
        {
          uint64_t v17 = v61;
          if (gbIsLoggerInit)
          {
            uint64_t v18 = gpsExFatLog;
            if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 136315394;
              *(void *)&uint8_t buf[4] = "DIROPS_UpdateDirectoryEntries";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v17;
              int v19 = "%s: (2) failed to write with error = [%d].\n";
              goto LABEL_16;
            }
          }
          goto LABEL_66;
        }
        goto LABEL_65;
      }
      uint64_t v63 = metaWrite((int *)v10, *(void **)v55, *((void *)v55 + 1), *(void *)(v10 + 40));
      if (v63)
      {
        uint64_t v17 = v63;
        if (gbIsLoggerInit)
        {
          uint64_t v18 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 136315394;
            *(void *)&uint8_t buf[4] = "DIROPS_UpdateDirectoryEntries";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v17;
            int v19 = "%s: (1) failed to write with error = [%d].\n";
            goto LABEL_16;
          }
        }
        goto LABEL_66;
      }
      uint64_t DirBlockAbsolute = DIROPS_GetDirBlockAbsolute(v10, *(_DWORD *)(v70 + 348), (uint64_t *)&v71, 0, 0);
      if (!DirBlockAbsolute)
      {
        unint64_t v58 = 0;
        long long v55 = v71;
        goto LABEL_102;
      }
      uint64_t v17 = DirBlockAbsolute;
      if (gbIsLoggerInit)
      {
        uint64_t v65 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v17;
          int v19 = "DIROPS_GetClusterInternal: for stream entry failed with err = %d\n";
          unsigned int v20 = v65;
          uint32_t v21 = 8;
          goto LABEL_17;
        }
      }
LABEL_66:
      if (v71) {
        DIROPS_FreeDirBlockBuffer((void **)v71);
      }
      if (v6) {
        return v17;
      }
      uint64_t v43 = *(void *)(v70 + 224);
      if (v43)
      {
        if (*(_DWORD *)v43 == -1061240642)
        {
          if (*(_DWORD *)(v43 + 560) == -1061240642)
          {
            MultiReadSingleWrite_FreeWrite((pthread_rwlock_t *)(v43 + 8));
            return v17;
          }
        }
        else if (*(_DWORD *)v43 == -559031622 && *(_DWORD *)(v43 + 560) == -559031622)
        {
          if (gbIsLoggerInit)
          {
            unint64_t v44 = gpsExFatLog;
            if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl(&dword_22C0F9000, v44, OS_LOG_TYPE_ERROR, "Got stale node", buf, 2u);
            }
            unsigned int v45 = 70;
            goto LABEL_87;
          }
          unsigned int v53 = 70;
          goto LABEL_95;
        }
      }
      if (gbIsLoggerInit)
      {
        long long v52 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_22C0F9000, v52, OS_LOG_TYPE_ERROR, "Got invalid node", buf, 2u);
        }
        unsigned int v45 = 22;
LABEL_87:
        if (v17) {
          uint64_t v17 = v17;
        }
        else {
          uint64_t v17 = v45;
        }
        if (gbIsLoggerInit)
        {
          uint64_t v38 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 136315394;
            *(void *)&uint8_t buf[4] = "DIROPS_UpdateDirectoryEntries";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v45;
            uint64_t v39 = "%s: Couldn't unlock parent node, error = %d.";
            goto LABEL_93;
          }
        }
        return v17;
      }
      unsigned int v53 = 22;
LABEL_95:
      if (v17) {
        return v17;
      }
      else {
        return v53;
      }
    }
LABEL_7:
    *(void *)long long buf = 0;
    *(void *)&uint8_t buf[8] = 0;
    LODWORD(v71) = 0;
    __int16 v72 = 0;
    CONV_GetCurrentTime((timespec *)buf);
    exfat_timestamp_from_unix(&v71, (unsigned char *)&v72 + 1, &v72, buf);
    a1 = v70;
    *(_DWORD *)(a2 + 12) = v71;
    *(unsigned char *)(a2 + 21) = HIBYTE(v72);
    *(unsigned char *)(a2 + 23) = v72;
    goto LABEL_8;
  }
  uint64_t v22 = *(void *)(a1 + 224);
  if (v22)
  {
    if (*(_DWORD *)v22 == -1061240642)
    {
      if (*(_DWORD *)(v22 + 560) == -1061240642)
      {
        MultiReadSingleWrite_LockWrite((pthread_rwlock_t *)(v22 + 8));
        a1 = v70;
        if (!a4) {
          goto LABEL_8;
        }
        goto LABEL_7;
      }
    }
    else if (*(_DWORD *)v22 == -559031622 && *(_DWORD *)(v22 + 560) == -559031622)
    {
      if (!gbIsLoggerInit) {
        return 70;
      }
      unint64_t v23 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_22C0F9000, v23, OS_LOG_TYPE_ERROR, "Got stale node", buf, 2u);
      }
      uint64_t v17 = 70;
      goto LABEL_58;
    }
  }
  if (!gbIsLoggerInit) {
    return 22;
  }
  unint64_t v37 = gpsExFatLog;
  if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_22C0F9000, v37, OS_LOG_TYPE_ERROR, "Got invalid node", buf, 2u);
  }
  uint64_t v17 = 22;
LABEL_58:
  if (gbIsLoggerInit)
  {
    uint64_t v38 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      *(void *)&uint8_t buf[4] = "DIROPS_UpdateDirectoryEntries";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v17;
      uint64_t v39 = "%s: Couldn't lock parent node, error = %d.";
LABEL_93:
      _os_log_impl(&dword_22C0F9000, v38, OS_LOG_TYPE_ERROR, v39, buf, 0x12u);
    }
  }
  return v17;
}

uint64_t DIROPS_GetDirBlockAbsolute(uint64_t a1, int a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  size_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *a3;
  *(_DWORD *)(v8 + 16) = a2;
  off_t v9 = *(void *)(a1 + 64) + v7 * (a2 - *(_DWORD *)(a1 + 84));
  *(void *)(v8 + 8) = v9;
  return metaRead((int *)a1, *(void **)v8, v9, v7, a4, a5);
}

uint64_t DIROPS_CreateHTForDirectory(uint64_t a1)
{
  __tp.tv_seCC_MD5_CTX c = 0;
  __tp.tv_nseCC_MD5_CTX c = 0;
  if ((*(_DWORD *)(a1 + 208) - 1) > 1) {
    return 20;
  }
  int v2 = (pthread_rwlock_t *)(a1 + 8);
  clock_gettime(_CLOCK_MONOTONIC, &__tp);
  MultiReadSingleWrite_LockWrite(v2);
  if (*(void *)(a1 + 512))
  {
    ++*(_DWORD *)(a1 + 528);
    uint64_t v3 = DIROPS_AcquireHTLRUSlotAndUnlockNode(a1, &__tp);
    if (v3) {
      DIROPS_MaybeFreeEvictedHTAndUnlockNode(v3);
    }
    return 0;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t HashTable = ht_AllocateHashTable((uint64_t)&v7);
    if (HashTable || *(void *)(a1 + 512))
    {
      MultiReadSingleWrite_FreeWrite(v2);
    }
    else
    {
      uint64_t HashTable = DIROPS_PopulateHT(a1, v7, 0);
      *(void *)(a1 + 512) = v7;
      uint64_t v7 = 0;
      ++*(_DWORD *)(a1 + 528);
      uint64_t v6 = DIROPS_AcquireHTLRUSlotAndUnlockNode(a1, &__tp);
      if (v6) {
        DIROPS_MaybeFreeEvictedHTAndUnlockNode(v6);
      }
    }
    if (v7) {
      ht_DeAllocateHashTable(v7);
    }
  }
  return HashTable;
}

uint64_t DIROPS_AcquireHTLRUSlotAndUnlockNode(uint64_t a1, _OWORD *a2)
{
  uint64_t v4 = (pthread_rwlock_t *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 216);
  uint64_t v6 = (pthread_rwlock_t *)(v5 + 2272);
  MultiReadSingleWrite_LockWrite((pthread_rwlock_t *)(v5 + 2272));
  uint64_t v7 = *(void *)(a1 + 520);
  if (v7 && *(void *)(v7 + 16) == a1)
  {
    *(_OWORD *)uint64_t v7 = *a2;
    *(unsigned char *)(*(void *)(a1 + 520) + 24) = 1;
    MultiReadSingleWrite_FreeWrite((pthread_rwlock_t *)(v5 + 2272));
    MultiReadSingleWrite_FreeWrite(v4);
    return 0;
  }
  else
  {
    uint64_t v8 = 0;
    off_t v9 = 0;
    do
    {
      uint64_t v10 = v5 + v8 + 2472;
      if (!*(void *)(v5 + v8 + 2488)) {
        break;
      }
      if (v9 && *(void *)v10 >= *v9)
      {
        if (*(void *)v10 == *v9)
        {
          if (*(void *)(v5 + v8 + 2480) >= v9[1]) {
            uint64_t v10 = (uint64_t)v9;
          }
        }
        else
        {
          uint64_t v10 = (uint64_t)v9;
        }
      }
      v8 += 32;
      off_t v9 = (void *)v10;
    }
    while (v8 != 160);
    if (*(unsigned char *)(v10 + 24)) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = *(void *)(v10 + 16);
    }
    *(void *)(v10 + 16) = a1;
    *(_OWORD *)uint64_t v10 = *a2;
    *(unsigned char *)(v10 + 24) = 1;
    *(void *)(a1 + 520) = v10;
    MultiReadSingleWrite_FreeWrite(v4);
    if (v11 && !MultiReadSingleWrite_TryLockWrite((pthread_rwlock_t *)(v11 + 8)))
    {
      if (gbIsLoggerInit)
      {
        int v12 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)unint64_t v14 = 0;
          _os_log_impl(&dword_22C0F9000, v12, OS_LOG_TYPE_ERROR, "Failed to lock LRU-Evicted Directory Node - hope it cleans up!", v14, 2u);
        }
      }
      uint64_t v11 = 0;
    }
    MultiReadSingleWrite_FreeWrite(v6);
  }
  return v11;
}

void DIROPS_MaybeFreeEvictedHTAndUnlockNode(uint64_t a1)
{
  if (DIROPS_WasEvictedFromHTLRUSlot(a1, *(_DWORD *)(a1 + 528)) && !*(_DWORD *)(a1 + 528))
  {
    uint64_t v2 = *(void *)(a1 + 520);
    if (v2 && *(void *)(v2 + 16) == a1) {
      *(void *)(v2 + 16) = 0;
    }
    uint64_t v3 = *(void *)(a1 + 512);
    *(void *)(a1 + 520) = 0;
    *(void *)(a1 + 512) = 0;
    MultiReadSingleWrite_FreeWrite((pthread_rwlock_t *)(a1 + 8));
    if (v3)
    {
      ht_DeAllocateHashTable(v3);
    }
  }
  else
  {
    MultiReadSingleWrite_FreeWrite((pthread_rwlock_t *)(a1 + 8));
  }
}

void DIROPS_ReleaseHTForDirectory(uint64_t a1, char a2)
{
  uint64_t v4 = (pthread_rwlock_t *)(a1 + 8);
  MultiReadSingleWrite_LockWrite((pthread_rwlock_t *)(a1 + 8));
  int v5 = *(_DWORD *)(a1 + 528) - 1;
  *(_DWORD *)(a1 + 528) = v5;
  if (DIROPS_WasEvictedFromHTLRUSlot(a1, v5) & 1) != 0 || (a2)
  {
    uint64_t v6 = *(void *)(a1 + 520);
    if (v6 && *(void *)(v6 + 16) == a1) {
      *(void *)(v6 + 16) = 0;
    }
    uint64_t v7 = *(void *)(a1 + 512);
    *(void *)(a1 + 520) = 0;
    *(void *)(a1 + 512) = 0;
    MultiReadSingleWrite_FreeWrite(v4);
    if (v7)
    {
      ht_DeAllocateHashTable(v7);
    }
  }
  else
  {
    MultiReadSingleWrite_FreeWrite(v4);
  }
}

uint64_t DIROPS_WasEvictedFromHTLRUSlot(uint64_t a1, int a2)
{
  if (!*(void *)(a1 + 520)) {
    return 1;
  }
  uint64_t v4 = (pthread_rwlock_t *)(*(void *)(a1 + 216) + 2272);
  MultiReadSingleWrite_LockWrite(v4);
  uint64_t v5 = *(void *)(a1 + 520);
  uint64_t v6 = *(void *)(v5 + 16);
  BOOL v7 = v6 == a1;
  BOOL v8 = v6 != a1;
  if (!a2 && v7) {
    *(unsigned char *)(v5 + 24) = 0;
  }
  MultiReadSingleWrite_FreeWrite(v4);
  return v8;
}

void DIROPS_DestroyHTForDirectory(uint64_t a1)
{
  uint64_t v2 = (pthread_rwlock_t *)(a1 + 8);
  MultiReadSingleWrite_LockWrite((pthread_rwlock_t *)(a1 + 8));
  if (*(void *)(a1 + 520))
  {
    uint64_t v3 = (pthread_rwlock_t *)(*(void *)(a1 + 216) + 2272);
    MultiReadSingleWrite_LockWrite(v3);
    uint64_t v4 = *(void *)(a1 + 520);
    if (*(void *)(v4 + 16) == a1) {
      *(void *)(v4 + 16) = 0;
    }
    MultiReadSingleWrite_FreeWrite(v3);
  }
  uint64_t v5 = *(void *)(a1 + 512);
  *(void *)(a1 + 520) = 0;
  *(void *)(a1 + 512) = 0;
  MultiReadSingleWrite_FreeWrite(v2);
  if (v5)
  {
    ht_DeAllocateHashTable(v5);
  }
}

uint64_t EXFAT_ReadDir(_DWORD *a1, uint64_t a2, unint64_t a3, unint64_t a4, size_t *a5, void *a6)
{
  if (!a1) {
    goto LABEL_13;
  }
  if (*a1 != -1061240642)
  {
    if (*a1 == -559031622 && a1[140] == -559031622)
    {
      if (gbIsLoggerInit)
      {
        uint64_t v6 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_22C0F9000, v6, OS_LOG_TYPE_ERROR, "Got stale node", buf, 2u);
        }
      }
      return 70;
    }
    goto LABEL_13;
  }
  if (a1[140] != -1061240642)
  {
LABEL_13:
    if (gbIsLoggerInit)
    {
      BOOL v8 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)off_t v9 = 0;
        _os_log_impl(&dword_22C0F9000, v8, OS_LOG_TYPE_ERROR, "Got invalid node", v9, 2u);
      }
    }
    return 22;
  }

  return DIROPS_ReadDirInternal((uint64_t)a1, a2, a3, a4, a5, a6, 0);
}

uint64_t DIROPS_ReadDirInternal(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, size_t *a5, void *a6, int a7)
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  if (gbIsLoggerInit)
  {
    unint64_t v14 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel[0]))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_22C0F9000, v14, (os_log_type_t)gpeExfatToOsLevel[0], "DIROPS_ReadDirInternal\n", buf, 2u);
    }
  }
  uint64_t v15 = *(void *)(a1 + 216);
  unsigned int v87 = a4;
  __int16 v85 = 0;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v82 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  uint64_t HTForDirectory = 22;
  *(_OWORD *)long long buf = 0u;
  long long v75 = 0u;
  if (a5 && a6)
  {
    *a5 = 0;
    if ((*(_DWORD *)(a1 + 208) - 1) >= 2)
    {
      if (gbIsLoggerInit)
      {
        unsigned int v20 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)unint64_t v88 = 0;
          _os_log_impl(&dword_22C0F9000, v20, OS_LOG_TYPE_ERROR, "DIROPS_ReadDirInternal node is not a directory.\n", v88, 2u);
        }
      }
      return 20;
    }
    else
    {
      unint64_t v17 = 280;
      if (a7) {
        unint64_t v17 = 456;
      }
      if (v17 <= a3)
      {
        uint64_t HTForDirectory = DIROPS_CreateHTForDirectory(a1);
        if (!HTForDirectory)
        {
          uint64_t v18 = (pthread_rwlock_t *)(a1 + 8);
          unint64_t v69 = HIDWORD(a4);
          MultiReadSingleWrite_LockRead((pthread_rwlock_t *)(a1 + 8));
          if (*(void *)(a1 + 504) == *a6)
          {
            unsigned int DirEntryOffsetByIndex = DIROPS_VerifyCookie(a1, a4, a7, 0);
            unsigned int Record = DirEntryOffsetByIndex;
          }
          else
          {
            unsigned int DirEntryOffsetByIndex = DIROPS_VerifyCookie(a1, a4, a7, 1);
            unsigned int Record = DirEntryOffsetByIndex;
            if (DirEntryOffsetByIndex == -1002)
            {
              if (gbIsLoggerInit)
              {
                uint64_t v22 = gpsExFatLog;
                if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel[0]))
                {
                  *(_DWORD *)unint64_t v88 = 136315138;
                  *(void *)&v88[4] = "DIROPS_ReadDirInternal";
                  _os_log_impl(&dword_22C0F9000, v22, (os_log_type_t)gpeExfatToOsLevel[0], "%s: Got UVFS_READDIR_BAD_COOKIE from DIROPS_VerifyCookie, calling DIROPS_GetDirEntryOffsetByIndex.", v88, 0xCu);
                }
              }
              unsigned int DirEntryOffsetByIndex = DIROPS_GetDirEntryOffsetByIndex(a1, v69, &v87, a7, 0);
              unsigned int Record = DirEntryOffsetByIndex;
              uint64_t v18 = (pthread_rwlock_t *)(a1 + 8);
            }
          }
          if (DirEntryOffsetByIndex)
          {
            MultiReadSingleWrite_FreeRead(v18);
LABEL_41:
            if (v85) {
              DIROPS_FreeDirBlockBuffer(v85);
            }
            uint64_t HTForDirectory = Record;
            if (Record) {
              BOOL v30 = Record == -1001;
            }
            else {
              BOOL v30 = 1;
            }
            char v31 = !v30;
            DIROPS_ReleaseHTForDirectory(a1, v31);
            return HTForDirectory;
          }
          *a6 = *(void *)(a1 + 504);
          unint64_t v73 = 0;
          unint64_t v23 = malloc_type_malloc(0x200uLL, 0x10000407EBBDD04uLL);
          unint64_t v24 = (char *)malloc_type_malloc(0x2FEuLL, 0x15D82ACCuLL);
          __s = v24;
          if (!v23 || !v24)
          {
            if (gbIsLoggerInit)
            {
              unint64_t v28 = gpsExFatLog;
              if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)unint64_t v88 = 0;
                _os_log_impl(&dword_22C0F9000, v28, OS_LOG_TYPE_ERROR, "Failed to allocate memory", v88, 2u);
              }
            }
            unsigned int v29 = 12;
LABEL_36:
            unsigned int Record = v29;
LABEL_37:
            MultiReadSingleWrite_FreeRead(v18);
            if (!v23) {
              goto LABEL_39;
            }
            goto LABEL_38;
          }
          v23[30] = 0u;
          v23[31] = 0u;
          v23[28] = 0u;
          v23[29] = 0u;
          v23[26] = 0u;
          v23[27] = 0u;
          v23[24] = 0u;
          v23[25] = 0u;
          v23[22] = 0u;
          v23[23] = 0u;
          v23[20] = 0u;
          v23[21] = 0u;
          v23[18] = 0u;
          v23[19] = 0u;
          v23[16] = 0u;
          v23[17] = 0u;
          v23[14] = 0u;
          v23[15] = 0u;
          v23[12] = 0u;
          v23[13] = 0u;
          v23[10] = 0u;
          v23[11] = 0u;
          v23[8] = 0u;
          v23[9] = 0u;
          v23[6] = 0u;
          v23[7] = 0u;
          v23[4] = 0u;
          v23[5] = 0u;
          v23[2] = 0u;
          v23[3] = 0u;
          *unint64_t v23 = 0u;
          v23[1] = 0u;
          long long v71 = v23;
          bzero(v24, 0x2FEuLL);
          unsigned int DirBlockBuffer = DIROPS_AllocateDirBlockBuffer(v15, (void **)&v85);
          unsigned int Record = DirBlockBuffer;
          if (DirBlockBuffer)
          {
            if (gbIsLoggerInit)
            {
              unsigned int v26 = DirBlockBuffer;
              char v27 = gpsExFatLog;
              if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)unint64_t v88 = 136315394;
                *(void *)&v88[4] = "DIROPS_ReadDirInternal";
                __int16 v89 = 1024;
                unsigned int v90 = v26;
                _os_log_impl(&dword_22C0F9000, v27, OS_LOG_TYPE_ERROR, "%s: Couldn't allocate dir block buffer. error = %d.\n", v88, 0x12u);
              }
            }
            MultiReadSingleWrite_FreeRead(v18);
            unint64_t v23 = v71;
LABEL_38:
            free(v23);
LABEL_39:
            if (__s) {
              free(__s);
            }
            goto LABEL_41;
          }
          unint64_t v32 = v87;
          char v67 = v18;
          if (a7)
          {
            int v65 = 0;
            int v72 = 0;
            uint64_t v66 = 0;
            char v62 = 1;
          }
          else if (v87 != 24 && v87)
          {
            int v72 = 0;
            uint64_t v66 = 0;
            unint64_t v32 = v87 - 48;
            char v62 = 1;
            int v65 = 48;
          }
          else
          {
            uint64_t v33 = 0;
            int v72 = 0;
            do
            {
              uint64_t v34 = a2 + v33;
              *(void *)uint64_t v34 = 0;
              *(void *)(v34 + 8) = 0;
              *(void *)(v34 + 16) = 0;
              uint64_t v35 = *(void *)(a1 + 216);
              if (v32 + v33)
              {
                unint64_t FileID = FILEOPS_GetFileID(*(unsigned int *)(a1 + 440), v35);
                *(unsigned char *)(v34 + 23) = 0;
                __int16 v37 = 2;
                char v38 = 46;
              }
              else
              {
                unint64_t FileID = FILEOPS_GetFileID(*(unsigned int *)(a1 + 428), v35);
                char v38 = 0;
                __int16 v37 = 1;
              }
              *(_WORD *)(v34 + 20) = 11778;
              *(_WORD *)(v34 + 16) = 24;
              *(void *)uint64_t v34 = FileID;
              *(void *)(v34 + 8) = v32 + v33 + 24;
              *(unsigned char *)(v34 + 22) = v38;
              *(_WORD *)(v34 + 18) = v37;
              *a5 += 24;
              ++v72;
              v33 += 24;
            }
            while (v32 + v33 - 24 < 0x18);
            char v62 = 0;
            unsigned int v87 = v32 + v33;
            a2 += v33;
            uint64_t v66 = 24;
            int v65 = 48;
            unint64_t v32 = 0;
          }
          char v64 = 0;
          int v63 = v69 + 1;
          uint64_t v39 = a2;
          unint64_t v23 = v71;
          while (1)
          {
            int DirEntryByOffset = DIROPS_GetDirEntryByOffset(a1, v32, &v73, buf, v23, v85, 4, &Record);
            if (DirEntryByOffset <= 24)
            {
              if (DirEntryByOffset == 17)
              {
                int v68 = 17;
                CONV_Unistr255ToUTF8(v71, __s, 766);
                if (a7)
                {
                  if (strcmp(__s, ".") && strcmp(__s, ".."))
                  {
                    uint64_t v42 = (strlen(__s) + 208) & 0xFFFFFFF8;
                    unint64_t v43 = v42 + *a5;
                    if (v43 > a3)
                    {
                      int v53 = 0;
                      uint64_t v61 = a2 - v66;
                      *(_WORD *)(v61 + 8) = 0;
                      int v54 = v72;
                      *(void *)uint64_t v61 = (v32 + v65) | ((unint64_t)(v72 + v69) << 32);
                      goto LABEL_115;
                    }
                    *a5 = v43;
                    int RecordId = DIROPS_GetRecordId((uint64_t)buf, (uint64_t)&v76, a1);
                    if (!RecordId) {
                      goto LABEL_101;
                    }
                    *(void *)unint64_t v88 = 0;
                    unsigned int Record = FILERECORD_AllocateRecord((void **)v88, a1, v15, DWORD1(v77), *(_DWORD *)(a1 + 428), RecordId, (long long *)buf, 0);
                    if (Record) {
                      goto LABEL_105;
                    }
                    FILEOPS_GetAtrrFromDirEntry(*(uint64_t *)v88, a2 + 16);
                    FILERECORD_FreeRecord(*(char **)v88, 1);
                    int v45 = v72;
                    *(void *)a2 = (v73 + v65) | ((unint64_t)(v63 + v72) << 32);
                    *(_WORD *)(a2 + 8) = v42;
                    unsigned __int16 v46 = strlen(__s);
                    *(_WORD *)(a2 + 12) = v46;
                    *(_WORD *)(a2 + 14) = 0;
                    *(_WORD *)(a2 + 10) = 200;
                    size_t v47 = (void *)(a2 + 200);
                    uint64_t v66 = v42;
                    goto LABEL_82;
                  }
LABEL_75:
                  uint64_t v48 = a2;
                  a2 = v39;
                }
                else
                {
                  size_t v49 = (strlen(__s) + 29) & 0xFFFFFFFFFFFFFFF8;
                  size_t v50 = v49 + *a5;
                  if (v50 > a3)
                  {
                    int v53 = 0;
                    uint64_t v60 = a2 - v66;
                    *(_WORD *)(v60 + 16) = 0;
                    int v54 = v72;
                    *(void *)(v60 + 8) = (v32 + v65) | ((unint64_t)(v72 + v69) << 32);
LABEL_115:
                    uint64_t v18 = v67;
                    unint64_t v23 = v71;
                    goto LABEL_87;
                  }
                  *a5 = v50;
                  int v51 = DIROPS_GetRecordId((uint64_t)buf, (uint64_t)&v76, a1);
                  if (!v51)
                  {
LABEL_101:
                    if (gbIsLoggerInit)
                    {
                      long long v57 = gpsExFatLog;
                      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
                      {
                        *(_WORD *)unint64_t v88 = 0;
                        _os_log_impl(&dword_22C0F9000, v57, OS_LOG_TYPE_ERROR, "DIROPS_ReadDirInternal RECORD_IDENTIFIER_UNKNOWN.\n", v88, 2u);
                      }
                    }
                    unsigned int Record = 5;
LABEL_105:
                    uint64_t v18 = v67;
                    unint64_t v23 = v71;
                    goto LABEL_37;
                  }
                  *(unsigned char *)(a2 + 20) = puRecordId2FaType[v51];
                  *(void *)a2 = FILEOPS_GetFileID(DWORD1(v77), v15);
                  unsigned __int16 v46 = strlen(__s);
                  *(_WORD *)(a2 + 18) = v46;
                  *(_WORD *)(a2 + 16) = v49;
                  uint64_t v66 = v49;
                  int v45 = v72;
                  *(void *)(a2 + 8) = (v73 + v65) | ((unint64_t)(v63 + v72) << 32);
                  size_t v47 = (void *)(a2 + 21);
LABEL_82:
                  uint64_t v52 = v46;
                  memcpy(v47, __s, v46);
                  *((unsigned char *)v47 + v52) = 0;
                  uint64_t v48 = a2 + v66;
                  int v72 = v45 + 1;
                  char v64 = 1;
                }
                int DirEntryByOffset = v68;
                goto LABEL_84;
              }
            }
            else
            {
              switch(DirEntryByOffset)
              {
                case 25:
                  if (gbIsLoggerInit)
                  {
                    int v68 = 25;
                    long long v41 = gpsExFatLog;
                    if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel[0]))
                    {
                      *(_DWORD *)unint64_t v88 = 136315138;
                      *(void *)&v88[4] = "DIROPS_ReadDirInternal";
                      _os_log_impl(&dword_22C0F9000, v41, (os_log_type_t)gpeExfatToOsLevel[0], "%s: Failed reading current dir entry. Trying to continue enumeration.", v88, 0xCu);
                    }
                    goto LABEL_75;
                  }
                  break;
                case 26:
                  if (gbIsLoggerInit)
                  {
                    long long v56 = gpsExFatLog;
                    uint64_t v18 = v67;
                    unint64_t v23 = v71;
                    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)unint64_t v88 = 67109120;
                      *(_DWORD *)&v88[4] = Record;
                      _os_log_impl(&dword_22C0F9000, v56, OS_LOG_TYPE_ERROR, "DIROPS_ReadDirInternal: DIROPS_GetDirEntryByOffset result == %d.\n", v88, 8u);
                    }
                    int v53 = 1;
                  }
                  else
                  {
                    int v53 = 1;
                    uint64_t v18 = v67;
                    unint64_t v23 = v71;
                  }
                  goto LABEL_86;
                case 27:
                  if (a7)
                  {
                    *(_WORD *)(v39 + 8) = 0;
                  }
                  else
                  {
                    if ((v62 | v64)) {
                      uint64_t v58 = 0;
                    }
                    else {
                      uint64_t v58 = -v66;
                    }
                    uint64_t v59 = v39 + v58;
                    *(_WORD *)(v59 + 16) = 0;
                    uint64_t v39 = v59 + 8;
                  }
                  unint64_t v23 = v71;
                  *(void *)uint64_t v39 = -1;
                  uint64_t v18 = v67;
                  int v53 = v72;
                  if (v72) {
                    goto LABEL_37;
                  }
                  int v54 = 0;
                  unsigned int Record = -1001;
LABEL_87:
                  if (!v54 && Record != -1001)
                  {
                    unsigned int v29 = 22;
                    goto LABEL_36;
                  }
                  if (v53)
                  {
                    if (gbIsLoggerInit)
                    {
                      long long v55 = gpsExFatLog;
                      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
                      {
                        *(_WORD *)unint64_t v88 = 0;
                        _os_log_impl(&dword_22C0F9000, v55, OS_LOG_TYPE_ERROR, "DIROPS_ReadDirInternal DIR_ENTRY_ERROR.\n", v88, 2u);
                      }
                    }
                    unsigned int v29 = 5;
                    goto LABEL_36;
                  }
                  goto LABEL_37;
              }
            }
            uint64_t v48 = a2;
            a2 = v39;
LABEL_84:
            uint64_t v39 = a2;
            unint64_t v32 = v73;
            a2 = v48;
            unint64_t v23 = v71;
            if ((DirEntryByOffset - 28) >= 0xFFFFFFFE)
            {
              int v53 = 0;
              uint64_t v18 = v67;
LABEL_86:
              int v54 = v72;
              goto LABEL_87;
            }
          }
        }
      }
    }
  }
  return HTForDirectory;
}

uint64_t EXFAT_ReadDirAttr(_DWORD *a1, uint64_t a2, unint64_t a3, unint64_t a4, size_t *a5, void *a6)
{
  if (!a1) {
    goto LABEL_13;
  }
  if (*a1 != -1061240642)
  {
    if (*a1 == -559031622 && a1[140] == -559031622)
    {
      if (gbIsLoggerInit)
      {
        uint64_t v6 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_22C0F9000, v6, OS_LOG_TYPE_ERROR, "Got stale node", buf, 2u);
        }
      }
      return 70;
    }
    goto LABEL_13;
  }
  if (a1[140] != -1061240642)
  {
LABEL_13:
    if (gbIsLoggerInit)
    {
      BOOL v8 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)off_t v9 = 0;
        _os_log_impl(&dword_22C0F9000, v8, OS_LOG_TYPE_ERROR, "Got invalid node", v9, 2u);
      }
    }
    return 22;
  }

  return DIROPS_ReadDirInternal((uint64_t)a1, a2, a3, a4, a5, a6, 1);
}

uint64_t EXFAT_MkDir(uint64_t a1, char *a2, uint64_t a3, void *a4)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  if (gbIsLoggerInit)
  {
    BOOL v8 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel[0]))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_22C0F9000, v8, (os_log_type_t)gpeExfatToOsLevel[0], "EXFAT_MkDir\n", buf, 2u);
    }
  }
  if (!a1) {
    goto LABEL_20;
  }
  if (*(_DWORD *)a1 == -1061240642)
  {
    if (*(_DWORD *)(a1 + 560) != -1061240642) {
      goto LABEL_20;
    }
    uint64_t v11 = *(void *)(a1 + 216);
    int v44 = 0;
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
    *(_OWORD *)long long buf = 0u;
    uint64_t HTForDirectory = DIROPS_CreateHTForDirectory(a1);
    if (HTForDirectory) {
      return HTForDirectory;
    }
    FSOPS_SetDirtyBitAndAcquireLck(v11);
    MultiReadSingleWrite_LockWrite((pthread_rwlock_t *)(a1 + 8));
    uint64_t v12 = DIROPS_LookForDirEntryByName(a1, a2, 0, &v44, (uint64_t)buf);
    if (v12)
    {
      uint64_t HTForDirectory = v12;
      if (v12 == 2)
      {
        uint64_t v32 = 0;
        unsigned int v31 = 0;
        char v30 = 1;
        uint64_t v13 = FAT_Access_M_AllocateClusters(v11, 1u, 0, &v30, (_DWORD *)&v32 + 1, (unsigned int *)&v32, (int *)&v31, 0, 0, 0, 0, 0);
        if (v13)
        {
          uint64_t HTForDirectory = v13;
          if (gbIsLoggerInit)
          {
            unint64_t v14 = gpsExFatLog;
            if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)int v45 = 67109120;
              LODWORD(v46) = HTForDirectory;
              uint64_t v15 = "EXFAT_MkDir: New cluster allocation failure [%d].\n";
LABEL_29:
              _os_log_impl(&dword_22C0F9000, v14, OS_LOG_TYPE_ERROR, v15, v45, 8u);
              goto LABEL_45;
            }
          }
          goto LABEL_45;
        }
        uint64_t v18 = DIROPS_ClearNewDirectoryClusters(v11, HIDWORD(v32), v31, v30);
        if (v18)
        {
          uint64_t HTForDirectory = v18;
          if (!gbIsLoggerInit) {
            goto LABEL_44;
          }
          uint64_t v19 = gpsExFatLog;
          if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
            goto LABEL_44;
          }
          *(_DWORD *)int v45 = 136315394;
          unsigned __int16 v46 = "EXFAT_MkDir";
          __int16 v47 = 1024;
          int v48 = HTForDirectory;
          unsigned int v20 = "%s: Failed to zero-fill new cluster. Error = %d.";
          uint32_t v21 = v19;
          uint32_t v22 = 18;
        }
        else
        {
          unint64_t v29 = 0;
          uint64_t v23 = DIROPS_CreateNewEntry(a1, a2, a3, HIDWORD(v32), 2, *(void *)(v11 + 56), *(void *)(v11 + 56), v30, &v29);
          if (v23)
          {
            uint64_t HTForDirectory = v23;
            if (!gbIsLoggerInit) {
              goto LABEL_44;
            }
            uint64_t v24 = gpsExFatLog;
            if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
              goto LABEL_44;
            }
            *(_DWORD *)int v45 = 67109120;
            LODWORD(v46) = HTForDirectory;
            unsigned int v20 = "EXFAT_MkDir: Create new dir entry failure [%d].\n";
          }
          else
          {
            uint64_t v28 = 0;
            memset(v27, 0, sizeof(v27));
            FILEOPS_GetAtrrFromDirEntry(a1, (uint64_t)v27);
            uint64_t HTForDirectory = DIROPS_LookupInternal(a1, a2, &v29, a4);
            if (!HTForDirectory) {
              goto LABEL_45;
            }
            if (!gbIsLoggerInit || (uint64_t v24 = gpsExFatLog, !os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)))
            {
LABEL_44:
              FAT_Access_M_FATChainFree(v11, HIDWORD(v32), 0, &v30, 1);
              goto LABEL_45;
            }
            *(_DWORD *)int v45 = 67109120;
            LODWORD(v46) = HTForDirectory;
            unsigned int v20 = "EXFAT_MkDir: Lookup for new created folder failed [%d].\n";
          }
          uint32_t v21 = v24;
          uint32_t v22 = 8;
        }
        _os_log_impl(&dword_22C0F9000, v21, OS_LOG_TYPE_ERROR, v20, v45, v22);
        goto LABEL_44;
      }
    }
    else
    {
      uint64_t HTForDirectory = 17;
    }
    if (gbIsLoggerInit)
    {
      unint64_t v14 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int v45 = 67109120;
        LODWORD(v46) = HTForDirectory;
        uint64_t v15 = "EXFAT_MkDir: Look for same name dir entry failure [%d].\n";
        goto LABEL_29;
      }
    }
LABEL_45:
    MultiReadSingleWrite_FreeWrite((pthread_rwlock_t *)(a1 + 8));
    FSOPS_FlushCacheAndFreeLck(v11);
    if (HTForDirectory) {
      BOOL v25 = HTForDirectory == 17;
    }
    else {
      BOOL v25 = 1;
    }
    char v26 = !v25;
    DIROPS_ReleaseHTForDirectory(a1, v26);
    return HTForDirectory;
  }
  if (*(_DWORD *)a1 == -559031622 && *(_DWORD *)(a1 + 560) == -559031622)
  {
    if (gbIsLoggerInit)
    {
      off_t v9 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_22C0F9000, v9, OS_LOG_TYPE_ERROR, "Got stale node", buf, 2u);
      }
    }
    return 70;
  }
LABEL_20:
  if (gbIsLoggerInit)
  {
    uint64_t v16 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_22C0F9000, v16, OS_LOG_TYPE_ERROR, "Got invalid node", buf, 2u);
    }
  }
  return 22;
}

uint64_t DIROPS_ClearNewDirectoryClusters(uint64_t a1, unsigned int a2, unsigned int a3, char a4)
{
  unsigned int v8 = 0;
  uint64_t v28 = *MEMORY[0x263EF8340];
  unint64_t v9 = *(void *)(a1 + 40);
  unint64_t v10 = *(void *)(a1 + 56);
  memset(v27, 0, sizeof(v27));
  uint64_t v22 = 0;
  unint64_t v11 = v10 / v9;
  while (2)
  {
    if (a2 < 2 || a2 > *(_DWORD *)(a1 + 80)) {
      return 0;
    }
    unint64_t v12 = 0;
    uint64_t v13 = (_DWORD *)((unint64_t)v27 | 0xC);
    do
    {
      if (a2 > *(_DWORD *)(a1 + 80) || v12 > 7) {
        break;
      }
      int v15 = a3;
      if ((a4 & 1) == 0)
      {
        int v15 = FAT_Access_M_ContiguousClustersInChain(a1, a2, (unsigned int *)&v22, (_DWORD *)&v22 + 1);
        uint64_t v16 = HIDWORD(v22);
        if (HIDWORD(v22))
        {
          if (gbIsLoggerInit)
          {
            uint64_t v18 = gpsExFatLog;
            if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 136315394;
              uint64_t v24 = "DIROPS_ClearNewDirectoryClusters";
              __int16 v25 = 1024;
              int v26 = v16;
              uint64_t v19 = "%s: Failed to get the next cluster(s). Error = %d.";
              goto LABEL_25;
            }
          }
          return v16;
        }
      }
      v8 += v15;
      if (v8 > a3)
      {
        if (gbIsLoggerInit)
        {
          unsigned int v20 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 136315138;
            uint64_t v24 = "DIROPS_ClearNewDirectoryClusters";
            _os_log_impl(&dword_22C0F9000, v20, OS_LOG_TYPE_ERROR, "%s: There are more clusters in this cluster chain than expected. Exiting.", buf, 0xCu);
          }
        }
        return 0;
      }
      *(void *)(v13 - 3) = *(void *)(a1 + 64) + *(void *)(a1 + 56) * (a2 - 2);
      *(v13 - 1) = v9;
      *uint64_t v13 = v15 * v11;
      ++v12;
      a2 = v22;
      v13 += 4;
    }
    while (v22 > 1);
    uint64_t v17 = metaClear((unsigned int *)a1, (uint64_t)v27, v12);
    HIDWORD(v22) = v17;
    if (!v17) {
      continue;
    }
    break;
  }
  uint64_t v16 = v17;
  if (gbIsLoggerInit)
  {
    uint64_t v18 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v24 = "DIROPS_ClearNewDirectoryClusters";
      __int16 v25 = 1024;
      int v26 = v16;
      uint64_t v19 = "%s: Failed to clear clusters. Error = %d.";
LABEL_25:
      _os_log_impl(&dword_22C0F9000, v18, OS_LOG_TYPE_ERROR, v19, buf, 0x12u);
      return HIDWORD(v22);
    }
  }
  return v16;
}

uint64_t DIROPS_LookupInternal(uint64_t a1, char *__s, unint64_t *a3, void *a4)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  if (gbIsLoggerInit)
  {
    unsigned int v8 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel[0]))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_22C0F9000, v8, (os_log_type_t)gpeExfatToOsLevel[0], "DIROPS_LookupInternal\n", buf, 2u);
    }
  }
  if ((*(_DWORD *)(a1 + 208) - 1) <= 1)
  {
    uint64_t v9 = *(void *)(a1 + 216);
    size_t v10 = strlen(__s);
    if (v10 == 2)
    {
      if (*__s != 46) {
        goto LABEL_13;
      }
      int v11 = __s[1];
    }
    else
    {
      if (v10 != 1) {
        goto LABEL_13;
      }
      int v11 = *__s;
    }
    if (v11 == 46) {
      return 17;
    }
LABEL_13:
    int v35 = 0;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v32 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    *(_OWORD *)long long buf = 0u;
    long long v25 = 0u;
    uint64_t v13 = DIROPS_LookForDirEntryByName(a1, __s, a3, &v35, (uint64_t)buf);
    if (v13)
    {
      uint64_t v12 = v13;
      if (!gbIsLoggerInit) {
        goto LABEL_24;
      }
      unint64_t v14 = gpsExFatLog;
      uint64_t v15 = 3;
      if (v13 == 2) {
        uint64_t v15 = 0;
      }
      os_log_type_t v16 = gpeExfatToOsLevel[v15];
      if (!os_log_type_enabled((os_log_t)gpsExFatLog, v16)) {
        goto LABEL_24;
      }
      *(_DWORD *)long long v36 = 67109120;
      int v37 = v12;
      uint64_t v17 = "DIROPS_LookupInternal fail to lookup for dir entry err = %d.\n";
    }
    else
    {
      uint64_t v23 = 0;
      uint64_t Record = FILERECORD_AllocateRecord((void **)&v23, a1, v9, DWORD1(v27), *(_DWORD *)(a1 + 428), v35, (long long *)buf, __s);
      if (Record)
      {
        uint64_t v12 = Record;
        if (!gbIsLoggerInit) {
          goto LABEL_24;
        }
        unint64_t v14 = gpsExFatLog;
        os_log_type_t v16 = OS_LOG_TYPE_ERROR;
        if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
          goto LABEL_24;
        }
        *(_DWORD *)long long v36 = 67109120;
        int v37 = v12;
        uint64_t v17 = "DIROPS_LookupInternal fail to allocate record (%d).\n";
      }
      else
      {
        if (v35 != 2
          || (uint64_t v21 = (uint64_t)v23,
              v23[67] = 0,
              uint64_t HTForDirectory = DIROPS_CreateHTForDirectory(v21),
              !HTForDirectory))
        {
          uint64_t v12 = 0;
          uint64_t v19 = v23;
          goto LABEL_25;
        }
        uint64_t v12 = HTForDirectory;
        if (!gbIsLoggerInit
          || (unint64_t v14 = gpsExFatLog,
              os_log_type_t v16 = OS_LOG_TYPE_ERROR,
              !os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)))
        {
LABEL_24:
          uint64_t v19 = 0;
LABEL_25:
          *a4 = v19;
          return v12;
        }
        *(_DWORD *)long long v36 = 67109120;
        int v37 = v12;
        uint64_t v17 = "DIROPS_CreateHTForDirectory failed with (%d).\n";
      }
    }
    _os_log_impl(&dword_22C0F9000, v14, v16, v17, v36, 8u);
    goto LABEL_24;
  }
  return 20;
}

uint64_t EXFAT_RmDir(uint64_t a1, char *__s, uint64_t a3)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  if (gbIsLoggerInit)
  {
    uint64_t v6 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel[0]))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_22C0F9000, v6, (os_log_type_t)gpeExfatToOsLevel[0], "EXFAT_RmDir", buf, 2u);
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  if (*(_DWORD *)a1 != -1061240642)
  {
    if (*(_DWORD *)a1 == -559031622 && *(_DWORD *)(a1 + 560) == -559031622)
    {
      if (!gbIsLoggerInit) {
        return 70;
      }
      BOOL v7 = gpsExFatLog;
      if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
        return 70;
      }
      *(_WORD *)long long buf = 0;
LABEL_11:
      _os_log_impl(&dword_22C0F9000, v7, OS_LOG_TYPE_ERROR, "Got stale node", buf, 2u);
      return 70;
    }
    goto LABEL_19;
  }
  if (*(_DWORD *)(a1 + 560) != -1061240642)
  {
LABEL_19:
    if (!gbIsLoggerInit) {
      return 22;
    }
    size_t v10 = gpsExFatLog;
    if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
      return 22;
    }
    *(_WORD *)long long buf = 0;
    goto LABEL_22;
  }
  if (!a3) {
    return 22;
  }
  size_t v9 = strlen(__s);
  if (v9 == 2)
  {
    if (!strncmp(__s, "..", 2uLL)) {
      return 1;
    }
  }
  else if (v9 == 1 && *__s == 46)
  {
    return 1;
  }
  if ((*(_DWORD *)(a1 + 208) - 1) > 1) {
    return 20;
  }
  if (*(_DWORD *)a3 != -1061240642)
  {
    if (*(_DWORD *)a3 == -559031622 && *(_DWORD *)(a3 + 560) == -559031622)
    {
      if (!gbIsLoggerInit) {
        return 70;
      }
      BOOL v7 = gpsExFatLog;
      if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
        return 70;
      }
      *(_WORD *)long long buf = 0;
      goto LABEL_11;
    }
    goto LABEL_38;
  }
  if (*(_DWORD *)(a3 + 560) != -1061240642)
  {
LABEL_38:
    if (!gbIsLoggerInit) {
      return 22;
    }
    size_t v10 = gpsExFatLog;
    if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
      return 22;
    }
    *(_WORD *)long long buf = 0;
LABEL_22:
    _os_log_impl(&dword_22C0F9000, v10, OS_LOG_TYPE_ERROR, "Got invalid node", buf, 2u);
    return 22;
  }
  uint64_t v12 = *(void *)(a1 + 216);
  uint64_t HTForDirectory = DIROPS_CreateHTForDirectory(a1);
  if (HTForDirectory) {
    return HTForDirectory;
  }
  FSOPS_SetDirtyBitAndAcquireLck(v12);
  MultiReadSingleWrite_LockWrite((pthread_rwlock_t *)(a1 + 8));
  if (*(unsigned char *)(a3 + 564))
  {
LABEL_37:
    uint64_t HTForDirectory = 0;
    goto LABEL_48;
  }
  long long v13 = *(_OWORD *)(a3 + 360);
  long long v14 = *(_OWORD *)(a3 + 392);
  long long v15 = *(_OWORD *)(a3 + 408);
  long long v38 = *(_OWORD *)(a3 + 376);
  long long v39 = v14;
  long long v40 = v15;
  long long v16 = *(_OWORD *)(a3 + 296);
  long long v17 = *(_OWORD *)(a3 + 328);
  long long v18 = *(_OWORD *)(a3 + 344);
  long long v34 = *(_OWORD *)(a3 + 312);
  long long v35 = v17;
  long long v19 = *(_OWORD *)(a3 + 248);
  long long v36 = v18;
  long long v37 = v13;
  long long v20 = *(_OWORD *)(a3 + 264);
  long long v21 = *(_OWORD *)(a3 + 280);
  v32[0] = v19;
  v32[1] = v20;
  int v22 = *(_DWORD *)(a3 + 208);
  v32[2] = v21;
  long long v33 = v16;
  if (v22 != 2)
  {
    uint64_t HTForDirectory = 20;
    goto LABEL_48;
  }
  uint64_t isDirEmpty = DIROPS_isDirEmpty(a3);
  if (isDirEmpty)
  {
    uint64_t HTForDirectory = isDirEmpty;
    if (gbIsLoggerInit)
    {
      uint64_t v24 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        long long v25 = "EXFAT_RmDir dir is not empty.\n";
LABEL_46:
        _os_log_impl(&dword_22C0F9000, v24, OS_LOG_TYPE_ERROR, v25, buf, 2u);
      }
    }
  }
  else
  {
    ++*(void *)(a1 + 504);
    int v28 = DIROPS_PurgeNodeMetaBlocksFromCache(a3);
    if (v28)
    {
      if (gbIsLoggerInit)
      {
        int v29 = v28;
        long long v30 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 136315394;
          long long v42 = "EXFAT_RmDir";
          __int16 v43 = 1024;
          int v44 = v29;
          _os_log_impl(&dword_22C0F9000, v30, OS_LOG_TYPE_ERROR, "%s: Couldn't purge the dir's metadata blocks. error = %d.", buf, 0x12u);
        }
      }
    }
    uint64_t HTForDirectory = FAT_Access_M_FATChainFree(v12, DWORD1(v33), 0, (unsigned char *)(a3 + 444), *(_DWORD *)(a3 + 436));
    *(_DWORD *)(a3 + 436) = 0;
    if (HTForDirectory) {
      goto LABEL_48;
    }
    uint64_t v31 = DIROPS_MarkNodeDirEntriesAsDeleted((void *)a1, (uint64_t)v32, __s);
    if (!v31)
    {
      if (!*(unsigned char *)(a3 + 564))
      {
        uint64_t HTForDirectory = 0;
        atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a3 + 216) + 2632), 1uLL);
        *(unsigned char *)(a3 + 564) = 1;
        goto LABEL_48;
      }
      goto LABEL_37;
    }
    uint64_t HTForDirectory = v31;
    if (gbIsLoggerInit)
    {
      uint64_t v24 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        long long v25 = "EXFAT_RmDir fail to mark entries as deleted.\n";
        goto LABEL_46;
      }
    }
  }
LABEL_48:
  MultiReadSingleWrite_FreeWrite((pthread_rwlock_t *)(a1 + 8));
  FSOPS_FlushCacheAndFreeLck(v12);
  if (HTForDirectory) {
    BOOL v26 = HTForDirectory == 20;
  }
  else {
    BOOL v26 = 1;
  }
  char v27 = !v26;
  DIROPS_ReleaseHTForDirectory(a1, v27);
  return HTForDirectory;
}

uint64_t EXFAT_Remove(uint64_t a1, char *__s, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (gbIsLoggerInit)
  {
    uint64_t v6 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel[0]))
    {
      LOWORD(v18[0]) = 0;
      _os_log_impl(&dword_22C0F9000, v6, (os_log_type_t)gpeExfatToOsLevel[0], "EXFAT_Remove", (uint8_t *)v18, 2u);
    }
  }
  if (!a1) {
    goto LABEL_20;
  }
  if (*(_DWORD *)a1 != -1061240642)
  {
    if (*(_DWORD *)a1 == -559031622 && *(_DWORD *)(a1 + 560) == -559031622)
    {
      if (!gbIsLoggerInit) {
        return 70;
      }
      BOOL v7 = gpsExFatLog;
      if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
        return 70;
      }
      LOWORD(v18[0]) = 0;
LABEL_11:
      _os_log_impl(&dword_22C0F9000, v7, OS_LOG_TYPE_ERROR, "Got stale node", (uint8_t *)v18, 2u);
      return 70;
    }
    goto LABEL_20;
  }
  if (*(_DWORD *)(a1 + 560) != -1061240642)
  {
LABEL_20:
    if (!gbIsLoggerInit) {
      return 22;
    }
    int v11 = gpsExFatLog;
    if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
      return 22;
    }
    LOWORD(v18[0]) = 0;
    goto LABEL_23;
  }
  if (!a3) {
    return 22;
  }
  if ((*(_DWORD *)(a1 + 208) - 1) > 1) {
    return 20;
  }
  uint64_t v9 = *(void *)(a1 + 216);
  size_t v10 = strlen(__s);
  if (v10 == 2)
  {
    if (!strncmp(__s, "..", 2uLL)) {
      return 1;
    }
  }
  else if (v10 == 1 && *__s == 46)
  {
    return 1;
  }
  uint64_t HTForDirectory = DIROPS_CreateHTForDirectory(a1);
  if (HTForDirectory) {
    return HTForDirectory;
  }
  if (*(_DWORD *)a3 != -1061240642)
  {
    if (*(_DWORD *)a3 == -559031622 && *(_DWORD *)(a3 + 560) == -559031622)
    {
      if (!gbIsLoggerInit) {
        return 70;
      }
      BOOL v7 = gpsExFatLog;
      if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
        return 70;
      }
      LOWORD(v18[0]) = 0;
      goto LABEL_11;
    }
    goto LABEL_38;
  }
  if (*(_DWORD *)(a3 + 560) != -1061240642)
  {
LABEL_38:
    if (!gbIsLoggerInit) {
      return 22;
    }
    int v11 = gpsExFatLog;
    if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
      return 22;
    }
    LOWORD(v18[0]) = 0;
LABEL_23:
    _os_log_impl(&dword_22C0F9000, v11, OS_LOG_TYPE_ERROR, "Got invalid node", (uint8_t *)v18, 2u);
    return 22;
  }
  FSOPS_SetDirtyBitAndAcquireLck(v9);
  MultiReadSingleWrite_LockWrite((pthread_rwlock_t *)(a1 + 8));
  if (*(unsigned char *)(a3 + 564)) {
    goto LABEL_37;
  }
  if (*(_DWORD *)(a3 + 208) == 2)
  {
    if (gbIsLoggerInit)
    {
      long long v13 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v18[0]) = 0;
        _os_log_impl(&dword_22C0F9000, v13, OS_LOG_TYPE_ERROR, "EXFAT_Remove entry is a directory.\n", (uint8_t *)v18, 2u);
      }
    }
    uint64_t HTForDirectory = 21;
    goto LABEL_46;
  }
  ++*(void *)(a1 + 504);
  uint64_t v16 = DIROPS_MarkNodeDirEntriesAsDeleted((void *)a1, a3 + 248, __s);
  if (v16)
  {
    uint64_t HTForDirectory = v16;
    if (gbIsLoggerInit)
    {
      long long v17 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        v18[0] = 67109120;
        v18[1] = HTForDirectory;
        _os_log_impl(&dword_22C0F9000, v17, OS_LOG_TYPE_ERROR, "EXFAT_Remove fail to mark entries as deleted with error %d.\n", (uint8_t *)v18, 8u);
      }
    }
    goto LABEL_46;
  }
  if (*(unsigned char *)(a3 + 564))
  {
LABEL_37:
    uint64_t HTForDirectory = 0;
  }
  else
  {
    uint64_t HTForDirectory = 0;
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a3 + 216) + 2632), 1uLL);
    *(unsigned char *)(a3 + 564) = 1;
  }
LABEL_46:
  MultiReadSingleWrite_FreeWrite((pthread_rwlock_t *)(a1 + 8));
  FSOPS_FlushCacheAndFreeLck(v9);
  if (HTForDirectory) {
    BOOL v14 = HTForDirectory == 21;
  }
  else {
    BOOL v14 = 1;
  }
  char v15 = !v14;
  DIROPS_ReleaseHTForDirectory(a1, v15);
  return HTForDirectory;
}

uint64_t EXFAT_Lookup(uint64_t a1, char *a2, void *a3)
{
  if (gbIsLoggerInit)
  {
    uint64_t v6 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel[0]))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_22C0F9000, v6, (os_log_type_t)gpeExfatToOsLevel[0], "EXFAT_Lookup\n", buf, 2u);
    }
  }
  if (!a1) {
    goto LABEL_15;
  }
  if (*(_DWORD *)a1 != -1061240642)
  {
    if (*(_DWORD *)a1 == -559031622 && *(_DWORD *)(a1 + 560) == -559031622)
    {
      if (gbIsLoggerInit)
      {
        BOOL v7 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v12 = 0;
          _os_log_impl(&dword_22C0F9000, v7, OS_LOG_TYPE_ERROR, "Got stale node", v12, 2u);
        }
      }
      return 70;
    }
    goto LABEL_15;
  }
  if (*(_DWORD *)(a1 + 560) != -1061240642)
  {
LABEL_15:
    if (gbIsLoggerInit)
    {
      uint64_t v9 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)int v11 = 0;
        _os_log_impl(&dword_22C0F9000, v9, OS_LOG_TYPE_ERROR, "Got invalid node", v11, 2u);
      }
    }
    return 22;
  }
  uint64_t HTForDirectory = DIROPS_CreateHTForDirectory(a1);
  if (!HTForDirectory)
  {
    MultiReadSingleWrite_LockWrite((pthread_rwlock_t *)(a1 + 8));
    uint64_t HTForDirectory = DIROPS_LookupInternal(a1, a2, 0, a3);
    MultiReadSingleWrite_FreeWrite((pthread_rwlock_t *)(a1 + 8));
    DIROPS_ReleaseHTForDirectory(a1, (HTForDirectory & 0xFFFFFFFD) != 0);
  }
  return HTForDirectory;
}

uint64_t EXFAT_ScanDir(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (gbIsLoggerInit)
  {
    uint64_t v6 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel[0]))
    {
      LOWORD(v20[0]) = 0;
      _os_log_impl(&dword_22C0F9000, v6, (os_log_type_t)gpeExfatToOsLevel[0], "EXFAT_ScanDir\n", (uint8_t *)v20, 2u);
    }
  }
  if (!a1) {
    goto LABEL_20;
  }
  if (*(_DWORD *)a1 != -1061240642)
  {
    if (*(_DWORD *)a1 == -559031622 && *(_DWORD *)(a1 + 560) == -559031622)
    {
      if (gbIsLoggerInit)
      {
        BOOL v7 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v20[0]) = 0;
          _os_log_impl(&dword_22C0F9000, v7, OS_LOG_TYPE_ERROR, "Got stale node", (uint8_t *)v20, 2u);
        }
      }
      return 70;
    }
    goto LABEL_20;
  }
  if (*(_DWORD *)(a1 + 560) != -1061240642)
  {
LABEL_20:
    if (!gbIsLoggerInit) {
      return 22;
    }
    char v15 = gpsExFatLog;
    if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
      return 22;
    }
    LOWORD(v20[0]) = 0;
    uint64_t v16 = "Got invalid node";
    long long v17 = (uint8_t *)v20;
LABEL_23:
    _os_log_impl(&dword_22C0F9000, v15, OS_LOG_TYPE_ERROR, v16, v17, 2u);
    return 22;
  }
  unint64_t v9 = a2[3];
  unsigned int v23 = v9;
  v22[0] = 0;
  int v21 = 0;
  unsigned int v10 = *(_DWORD *)(a1 + 208) - 1;
  memset(v20, 0, sizeof(v20));
  if (v10 > 1) {
    return 20;
  }
  if (*a2 && !**(unsigned char **)*a2 || (int v11 = (unsigned char **)a2[1]) != 0 && !**v11)
  {
    if (!gbIsLoggerInit) {
      return 22;
    }
    char v15 = gpsExFatLog;
    if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
      return 22;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v16 = "EXFAT_ScanDir: one of the given smr_filename_contains or smr_filename_ends_with, is empty.\n";
    long long v17 = buf;
    goto LABEL_23;
  }
  unint64_t v12 = HIDWORD(v9);
  MultiReadSingleWrite_LockWrite((pthread_rwlock_t *)(a1 + 8));
  uint64_t v13 = a2[3];
  if (*(void *)(a1 + 504) == a2[4])
  {
    uint64_t DirEntryOffsetByIndex = DIROPS_VerifyCookie(a1, v13, 1, 0);
LABEL_35:
    uint64_t v8 = DirEntryOffsetByIndex;
    goto LABEL_36;
  }
  uint64_t v8 = DIROPS_VerifyCookie(a1, v13, 1, 1);
  if (v8 == -1002)
  {
    if (gbIsLoggerInit)
    {
      uint64_t v19 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel[0]))
      {
        *(_DWORD *)long long buf = 136315138;
        long long v25 = "EXFAT_ScanDir";
        _os_log_impl(&dword_22C0F9000, v19, (os_log_type_t)gpeExfatToOsLevel[0], "%s: Got UVFS_READDIR_BAD_COOKIE from DIROPS_VerifyCookie, calling DIROPS_GetDirEntryOffsetByIndex.", buf, 0xCu);
      }
    }
    uint64_t DirEntryOffsetByIndex = DIROPS_GetDirEntryOffsetByIndex(a1, v12, &v23, 0, 1);
    goto LABEL_35;
  }
LABEL_36:
  if (!v8)
  {
    *(unsigned char *)a3 = 0;
    *(void *)(a3 + 16) = *(void *)(a1 + 504);
    LODWORD(v22[0]) = 6;
    v22[1] = a2;
    _OWORD v22[2] = a3;
    v22[3] = v23;
    v22[4] = v12;
    uint64_t v8 = DIROPS_LookForDirEntry(a1, (int *)v22, &v21, (uint64_t)v20);
  }
  MultiReadSingleWrite_FreeWrite((pthread_rwlock_t *)(a1 + 8));
  return v8;
}

uint64_t DIROPS_VerifyCookie(uint64_t a1, uint64_t a2, char a3, int a4)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(a1 + 216);
  unint64_t v6 = *(void *)(v5 + 40);
  int v22 = 0;
  if (a2 == -1) {
    return 4294966295;
  }
  unsigned int v7 = a2;
  if ((a3 & 1) == 0)
  {
    uint64_t v8 = 0;
    if (!a2 || a2 == 24) {
      return v8;
    }
    unsigned int v7 = a2 - 48;
  }
  if ((v7 & 0x1F) != 0)
  {
    if (gbIsLoggerInit)
    {
      unint64_t v9 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315650;
        uint64_t v24 = "DIROPS_VerifyCookie";
        __int16 v25 = 1024;
        int v26 = v7;
        __int16 v27 = 2048;
        uint64_t v28 = 32;
        _os_log_impl(&dword_22C0F9000, v9, OS_LOG_TYPE_ERROR, "%s: uCookieOffset [%u] %% sizeof(exfat_direntry) [%lu] != 0.\n", buf, 0x1Cu);
      }
    }
    return 4294966294;
  }
  uint64_t v8 = 0;
  if (!v7 || !a4) {
    goto LABEL_36;
  }
  uint64_t v11 = DIROPS_AllocateDirBlockBuffer(v5, &v22);
  if (v11)
  {
    uint64_t v8 = v11;
    if (gbIsLoggerInit)
    {
      unint64_t v12 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        uint64_t v24 = "DIROPS_VerifyCookie";
        __int16 v25 = 1024;
        int v26 = v8;
        _os_log_impl(&dword_22C0F9000, v12, OS_LOG_TYPE_ERROR, "%s: Couldn't allocate dir block buffer. error = %d.\n", buf, 0x12u);
      }
    }
    return v8;
  }
  uint64_t DirBlockRelative = DIROPS_GetDirBlockRelative(a1, v7 / v6, (uint64_t *)&v22, 0);
  if (DirBlockRelative)
  {
    uint64_t v8 = DirBlockRelative;
    if (DirBlockRelative != -17) {
      goto LABEL_36;
    }
    if (!gbIsLoggerInit) {
      goto LABEL_34;
    }
    uint64_t v14 = gpsExFatLog;
    if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    *(_DWORD *)long long buf = 136315138;
    uint64_t v24 = "DIROPS_VerifyCookie";
    char v15 = "%s: DIROPS_GetDirBlockRelative returned DIR_BAD_CLUSTER.\n";
    uint64_t v16 = v14;
    uint32_t v17 = 12;
    goto LABEL_33;
  }
  int v18 = *(unsigned __int8 *)(*(void *)v22 + v7 % v6);
  if (*(unsigned char *)(*(void *)v22 + v7 % v6)) {
    BOOL v19 = (v18 & 0x40) == 0;
  }
  else {
    BOOL v19 = 0;
  }
  if (!v19)
  {
    if (!gbIsLoggerInit) {
      goto LABEL_34;
    }
    uint64_t v20 = gpsExFatLog;
    if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    int v21 = "Secondary";
    uint64_t v24 = "DIROPS_VerifyCookie";
    *(_DWORD *)long long buf = 136315650;
    if (!v18) {
      int v21 = "EOD";
    }
    __int16 v25 = 1024;
    int v26 = v7;
    __int16 v27 = 2080;
    uint64_t v28 = (uint64_t)v21;
    char v15 = "%s: uCookieOffset = [%u] pointed to entry of type: %s.\n";
    uint64_t v16 = v20;
    uint32_t v17 = 28;
LABEL_33:
    _os_log_impl(&dword_22C0F9000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
LABEL_34:
    uint64_t v8 = 4294966294;
    goto LABEL_36;
  }
  uint64_t v8 = 0;
LABEL_36:
  if (v22) {
    DIROPS_FreeDirBlockBuffer((void **)v22);
  }
  return v8;
}

uint64_t DIROPS_GetDirEntryOffsetByIndex(uint64_t a1, unsigned int a2, _DWORD *a3, int a4, int a5)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v28 = 0;
  unint64_t v29 = 0;
  memset(v27, 0, sizeof(v27));
  unsigned int v10 = malloc_type_calloc(1uLL, 0x200uLL, 0x10000407EBBDD04uLL);
  uint64_t v11 = (char *)malloc_type_calloc(1uLL, 0xFFuLL, 0x875B4B04uLL);
  unint64_t v12 = v11;
  if (!v10 || !v11)
  {
    if (gbIsLoggerInit)
    {
      uint32_t v17 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315138;
        long long v32 = "DIROPS_GetDirEntryOffsetByIndex";
        _os_log_impl(&dword_22C0F9000, v17, OS_LOG_TYPE_ERROR, "%s: Failed to allocate memory", buf, 0xCu);
      }
    }
    unsigned int v18 = 12;
LABEL_12:
    unsigned int v30 = v18;
    goto LABEL_13;
  }
  unsigned int DirBlockBuffer = DIROPS_AllocateDirBlockBuffer(*(void *)(a1 + 216), (void **)&v28);
  unsigned int v30 = DirBlockBuffer;
  if (DirBlockBuffer)
  {
    if (gbIsLoggerInit)
    {
      unsigned int v14 = DirBlockBuffer;
      char v15 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        long long v32 = "DIROPS_GetDirEntryOffsetByIndex";
        __int16 v33 = 1024;
        unsigned int v34 = v14;
        uint64_t v16 = "%s: Couldn't allocate dir block buffer. error = %d.\n";
        goto LABEL_7;
      }
    }
    goto LABEL_13;
  }
  if (a2 < 2) {
    int v20 = 1;
  }
  else {
    int v20 = a5;
  }
  int v21 = v20 | a4;
  if (v21) {
    unsigned int v22 = a2;
  }
  else {
    unsigned int v22 = a2 - 2;
  }
  if (v21) {
    int v23 = 0;
  }
  else {
    int v23 = 48;
  }
  if (!v22)
  {
    LODWORD(v25) = 0;
LABEL_43:
    *a3 = v23 + v25;
    goto LABEL_13;
  }
  unsigned int v24 = 0;
  unint64_t v25 = 0;
  while (1)
  {
    int DirEntryByOffset = DIROPS_GetDirEntryByOffset(a1, v25, &v29, (unsigned __int8 *)v27, v10, v28, 4, &v30);
    if (DirEntryByOffset == 17)
    {
      if (!a4
        || (unsigned __int16)*v10 > 2u
        || (CONV_Unistr255ToUTF8(v10, v12, 255), strcmp(v12, ".")) && strcmp(v12, ".."))
      {
        ++v24;
      }
      goto LABEL_40;
    }
    if (DirEntryByOffset == 26) {
      break;
    }
    if (DirEntryByOffset == 27)
    {
      unsigned int v18 = -1001;
      goto LABEL_12;
    }
LABEL_40:
    unint64_t v25 = v29;
    if (v24 >= v22) {
      goto LABEL_43;
    }
  }
  if (gbIsLoggerInit)
  {
    char v15 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      long long v32 = "DIROPS_GetDirEntryOffsetByIndex";
      __int16 v33 = 1024;
      unsigned int v34 = v30;
      uint64_t v16 = "%s: DIROPS_GetDirEntryByOffset returned DIR_ENTRY_ERROR with error code = %d.\n";
LABEL_7:
      _os_log_impl(&dword_22C0F9000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0x12u);
    }
  }
LABEL_13:
  if (v28) {
    DIROPS_FreeDirBlockBuffer(v28);
  }
  if (v10) {
    free(v10);
  }
  if (v12) {
    free(v12);
  }
  return v30;
}

uint64_t DIROPS_WriteVolumeLableEntry(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 216);
  unint64_t v4 = *(void *)(v3 + 40);
  unint64_t v5 = *(void *)(v3 + 56);
  long long v40 = 0u;
  long long v41 = 0u;
  unint64_t v35 = 0;
  char v34 = 0;
  __int16 v33 = 0;
  memset(v32, 0, sizeof(v32));
  if (*(_DWORD *)(a1 + 208) != 1)
  {
    if (!gbIsLoggerInit) {
      goto LABEL_11;
    }
    uint64_t v11 = gpsExFatLog;
    if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_DWORD *)long long buf = 136315138;
    long long v37 = "DIROPS_WriteVolumeLableEntry";
    unint64_t v12 = "%s: node record is not root";
    uint64_t v13 = v11;
    os_log_type_t v14 = OS_LOG_TYPE_ERROR;
    uint32_t v15 = 12;
    goto LABEL_10;
  }
  uint64_t v7 = CONV_UTF8ToUnistr255(a2, a3, v32);
  if (v7)
  {
    uint64_t v8 = v7;
    if (gbIsLoggerInit)
    {
      unint64_t v9 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        long long v37 = "DIROPS_WriteVolumeLableEntry";
        __int16 v38 = 1024;
        int v39 = v8;
        unsigned int v10 = "%s: CONV_UTF8ToUnistr255 failed [%d]";
LABEL_6:
        _os_log_impl(&dword_22C0F9000, v9, OS_LOG_TYPE_ERROR, v10, buf, 0x12u);
        goto LABEL_12;
      }
    }
    goto LABEL_12;
  }
  int v17 = LOWORD(v32[0]);
  if (LOWORD(v32[0]) >= 0xCu)
  {
    if (!gbIsLoggerInit) {
      goto LABEL_11;
    }
    uint64_t v18 = gpsExFatLog;
    if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    *(_DWORD *)long long buf = 136315394;
    long long v37 = "DIROPS_WriteVolumeLableEntry";
    __int16 v38 = 1024;
    int v39 = v17;
    unint64_t v12 = "%s: volume name too long %u";
    uint64_t v13 = v18;
    os_log_type_t v14 = OS_LOG_TYPE_INFO;
    uint32_t v15 = 18;
LABEL_10:
    _os_log_impl(&dword_22C0F9000, v13, v14, v12, buf, v15);
LABEL_11:
    uint64_t v8 = 22;
    goto LABEL_12;
  }
  BOOL v19 = (pthread_rwlock_t *)(a1 + 8);
  LOBYTE(v40) = -125;
  BYTE1(v40) = v32[0];
  __memcpy_chk();
  FSOPS_SetDirtyBitAndAcquireLck(v3);
  MultiReadSingleWrite_LockWrite((pthread_rwlock_t *)(a1 + 8));
  int v20 = *(unsigned __int8 *)(a1 + 424);
  if (*(unsigned char *)(a1 + 424))
  {
    LODWORD(v5) = *(_DWORD *)(a1 + 344) - *(_DWORD *)(a1 + 428) * (v5 / v4);
    unint64_t v21 = *(void *)(a1 + 328);
    uint64_t v22 = 32;
  }
  else
  {
    uint64_t v24 = DIROPS_LookForFreeEntriesInDirectory(a1, 1uLL, &v35, &v34);
    if (v24)
    {
      uint64_t v8 = v24;
      if (!gbIsLoggerInit) {
        goto LABEL_40;
      }
      unint64_t v25 = gpsExFatLog;
      if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_40;
      }
      *(_DWORD *)long long buf = 136315394;
      long long v37 = "DIROPS_WriteVolumeLableEntry";
      __int16 v38 = 1024;
      int v39 = v8;
      int v26 = "%s: Lookup for free directory entries failed with error [%d].";
      goto LABEL_33;
    }
    unint64_t v5 = v35 / v4;
    unint64_t v21 = v35 % v4;
    uint64_t v22 = v35 + 32;
  }
  uint64_t DirBlockBuffer = DIROPS_AllocateDirBlockBuffer(v3, (void **)&v33);
  if (!DirBlockBuffer)
  {
    uint64_t DirBlockRelative = DIROPS_GetDirBlockRelative(a1, v5, (uint64_t *)&v33, 0);
    if (!DirBlockRelative)
    {
      uint64_t v28 = v33;
      unint64_t v29 = (char *)*v33 + v21;
      long long v30 = v41;
      *unint64_t v29 = v40;
      v29[1] = v30;
      uint64_t v8 = metaWrite((int *)v3, *v28, (off_t)v28[1], *(void *)(v3 + 40));
      if (!v20)
      {
        if (v34) {
          uint64_t v31 = v22;
        }
        else {
          uint64_t v31 = 0;
        }
        *(void *)(a1 + 536) = v31;
      }
      goto LABEL_40;
    }
    uint64_t v8 = DirBlockRelative;
    if (!gbIsLoggerInit
      || (unint64_t v25 = gpsExFatLog, !os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)))
    {
LABEL_40:
      MultiReadSingleWrite_FreeWrite(v19);
      FSOPS_FlushCacheAndFreeLck(v3);
      goto LABEL_12;
    }
    *(_DWORD *)long long buf = 136315394;
    long long v37 = "DIROPS_WriteVolumeLableEntry";
    __int16 v38 = 1024;
    int v39 = v8;
    int v26 = "%s: Couldn't get dir block. error = %d.\n";
LABEL_33:
    _os_log_impl(&dword_22C0F9000, v25, OS_LOG_TYPE_ERROR, v26, buf, 0x12u);
    goto LABEL_40;
  }
  uint64_t v8 = DirBlockBuffer;
  if (gbIsLoggerInit)
  {
    unint64_t v9 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      long long v37 = "DIROPS_WriteVolumeLableEntry";
      __int16 v38 = 1024;
      int v39 = v8;
      unsigned int v10 = "%s: Couldn't allocate dir block buffer. error = %d.\n";
      goto LABEL_6;
    }
  }
LABEL_12:
  if (v33) {
    DIROPS_FreeDirBlockBuffer(v33);
  }
  return v8;
}

uint64_t ht_AllocateHashTable(uint64_t a1)
{
  uint64_t v2 = malloc_type_malloc(0x2D0uLL, 0x1020040771ACFCCuLL);
  *(void *)a1 = v2;
  if (!v2) {
    return 12;
  }
  bzero(v2, 0x2D0uLL);
  MultiReadSingleWrite_Init((pthread_rwlock_t *)(*(void *)a1 + 8));
  return 0;
}

uint64_t *ht_LookupByName(uint64_t *result, _WORD *a2)
{
  if (result)
  {
    uint64_t v2 = (unsigned __int16)*a2;
    if (*a2)
    {
      int v3 = 0;
      unint64_t v4 = a2 + 1;
      do
      {
        int v5 = *v4++;
        int v3 = v5 - v3 + 32 * v3;
        --v2;
      }
      while (v2);
    }
    else
    {
      int v3 = 0;
    }
    result += (v3 & 0x3F) + 26;
    do
      uint64_t result = (uint64_t *)*result;
    while (result && *((_DWORD *)result + 3) != v3);
  }
  return result;
}

uint64_t ht_insert(uint64_t a1, uint64_t a2, _WORD *a3, unint64_t a4, char a5)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (!a2) {
    return 22;
  }
  if ((a4 & 0xFFFFFFE00000001FLL) != 0)
  {
    if (gbIsLoggerInit)
    {
      uint64_t v7 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        int v23 = 136315394;
        uint64_t v24 = "ht_insert";
        __int16 v25 = 2048;
        unint64_t v26 = a4;
        uint64_t v8 = 22;
        _os_log_impl(&dword_22C0F9000, v7, OS_LOG_TYPE_ERROR, "%s: unexpected entry offset %llu", (uint8_t *)&v23, 0x16u);
        return v8;
      }
    }
    return 22;
  }
  CONV_Unistr255ToUpperCase(a3, a1);
  uint64_t v12 = (unsigned __int16)*a3;
  if (*a3)
  {
    int v13 = 0;
    os_log_type_t v14 = a3 + 1;
    do
    {
      int v15 = *v14++;
      int v13 = v15 - v13 + 32 * v13;
      --v12;
    }
    while (v12);
  }
  else
  {
    int v13 = 0;
  }
  MultiReadSingleWrite_LockWrite((pthread_rwlock_t *)(a2 + 8));
  unsigned int v16 = *(_DWORD *)a2 >> 4;
  if (v16 < 0xC35 || (a5 & 1) != 0)
  {
    unint64_t v17 = a4 >> 5;
    uint64_t v18 = (void *)(a2 + 8 * (v13 & 0x3F) + 208);
    BOOL v19 = v18;
    while (1)
    {
      BOOL v19 = (void *)*v19;
      if (!v19) {
        break;
      }
      if (*((_DWORD *)v19 + 2) == v17)
      {
        MultiReadSingleWrite_FreeRead((pthread_rwlock_t *)(a2 + 8));
        uint64_t v8 = 17;
        goto LABEL_28;
      }
    }
    if (v16 >= 0xC35)
    {
      do
      {
        char v20 = rand();
        unint64_t v21 = *(void **)(a2 + 8 * (v20 & 0x3F) + 208);
      }
      while (!v21);
      ht_remove_from_list((_DWORD *)a2, v21, 0, v20);
      rand();
    }
    uint64_t v22 = malloc_type_malloc(0x10uLL, 0x1020040EDED9539uLL);
    if (v22)
    {
      *(void *)uint64_t v22 = 0;
      _OWORD v22[2] = v17;
      v22[3] = v13;
      if (*v18) {
        *(void *)uint64_t v22 = *v18;
      }
      uint64_t v8 = 0;
      *uint64_t v18 = v22;
      ++*(_DWORD *)a2;
    }
    else
    {
      uint64_t v8 = 12;
    }
LABEL_28:
    MultiReadSingleWrite_FreeWrite((pthread_rwlock_t *)(a2 + 8));
  }
  else
  {
    *(unsigned char *)(a2 + 4) = 1;
    MultiReadSingleWrite_FreeWrite((pthread_rwlock_t *)(a2 + 8));
    return 0;
  }
  return v8;
}

_DWORD *ht_reached_max_bound(_DWORD *result)
{
  if (result) {
    return (_DWORD *)(*result >> 4 > 0xC34u);
  }
  return result;
}

_DWORD *ht_reached_low_bound(_DWORD *result)
{
  if (result) {
    return (_DWORD *)(*result < 0xBF69u);
  }
  return result;
}

uint64_t ht_remove(uint64_t a1, uint64_t a2, char *a3, unint64_t a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (!a2) {
    return 22;
  }
  if ((a4 & 0xFFFFFFE00000001FLL) != 0)
  {
    if (gbIsLoggerInit)
    {
      int v5 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        int v22 = 136315394;
        int v23 = "ht_remove";
        __int16 v24 = 2048;
        unint64_t v25 = a4;
        uint64_t v6 = 22;
        _os_log_impl(&dword_22C0F9000, v5, OS_LOG_TYPE_ERROR, "%s: unexpected entry offset %llu", (uint8_t *)&v22, 0x16u);
        return v6;
      }
    }
    return 22;
  }
  uint64_t v11 = (__int16 *)malloc_type_malloc(0x200uLL, 0x10000407EBBDD04uLL);
  if (!v11) {
    return 12;
  }
  uint64_t v12 = v11;
  *((_OWORD *)v11 + 30) = 0u;
  *((_OWORD *)v11 + 31) = 0u;
  *((_OWORD *)v11 + 28) = 0u;
  *((_OWORD *)v11 + 29) = 0u;
  *((_OWORD *)v11 + 26) = 0u;
  *((_OWORD *)v11 + 27) = 0u;
  *((_OWORD *)v11 + 24) = 0u;
  *((_OWORD *)v11 + 25) = 0u;
  *((_OWORD *)v11 + 22) = 0u;
  *((_OWORD *)v11 + 23) = 0u;
  *((_OWORD *)v11 + 20) = 0u;
  *((_OWORD *)v11 + 21) = 0u;
  *((_OWORD *)v11 + 18) = 0u;
  *((_OWORD *)v11 + 19) = 0u;
  *((_OWORD *)v11 + 16) = 0u;
  *((_OWORD *)v11 + 17) = 0u;
  *((_OWORD *)v11 + 14) = 0u;
  *((_OWORD *)v11 + 15) = 0u;
  *((_OWORD *)v11 + 12) = 0u;
  *((_OWORD *)v11 + 13) = 0u;
  *((_OWORD *)v11 + 10) = 0u;
  *((_OWORD *)v11 + 11) = 0u;
  *((_OWORD *)v11 + 8) = 0u;
  *((_OWORD *)v11 + 9) = 0u;
  *((_OWORD *)v11 + 6) = 0u;
  *((_OWORD *)v11 + 7) = 0u;
  *((_OWORD *)v11 + 4) = 0u;
  *((_OWORD *)v11 + 5) = 0u;
  *((_OWORD *)v11 + 2) = 0u;
  *((_OWORD *)v11 + 3) = 0u;
  *(_OWORD *)uint64_t v11 = 0u;
  *((_OWORD *)v11 + 1) = 0u;
  size_t v13 = strlen(a3);
  uint64_t v6 = CONV_UTF8ToUnistr255((unsigned __int8 *)a3, v13, v12);
  if (!v6)
  {
    unint64_t v14 = a4 >> 5;
    CONV_Unistr255ToUpperCase(v12, a1);
    uint64_t v15 = (unsigned __int16)*v12;
    if (*v12)
    {
      char v16 = 0;
      unint64_t v17 = v12 + 1;
      do
      {
        __int16 v18 = *v17++;
        char v16 = v18 - v16 + 32 * v16;
        --v15;
      }
      while (v15);
    }
    else
    {
      char v16 = 0;
    }
    MultiReadSingleWrite_LockWrite((pthread_rwlock_t *)(a2 + 8));
    BOOL v19 = 0;
    uint64_t v20 = a2 + 8 * (v16 & 0x3F) + 208;
    while (1)
    {
      uint64_t v20 = *(void *)v20;
      if (!v20) {
        break;
      }
      unint64_t v21 = v19;
      BOOL v19 = (void *)v20;
      if (*(_DWORD *)(v20 + 8) == v14)
      {
        MultiReadSingleWrite_FreeRead((pthread_rwlock_t *)(a2 + 8));
        ht_remove_from_list((_DWORD *)a2, (void *)v20, v21, v16);
        MultiReadSingleWrite_FreeWrite((pthread_rwlock_t *)(a2 + 8));
        uint64_t v6 = 0;
        goto LABEL_21;
      }
    }
    MultiReadSingleWrite_FreeWrite((pthread_rwlock_t *)(a2 + 8));
    uint64_t v6 = 2 * (*(unsigned char *)(a2 + 4) == 0);
  }
LABEL_21:
  free(v12);
  return v6;
}

void ht_remove_from_list(_DWORD *a1, void *a2, void *a3, char a4)
{
  int v5 = a2;
  if (!a3)
  {
    uint64_t v6 = &a1[2 * (a4 & 0x3F)];
    uint64_t v7 = (void *)*((void *)v6 + 26);
    a3 = v6 + 52;
    int v5 = v7;
  }
  *a3 = *v5;
  if (*a1)
  {
    --*a1;
    free(a2);
  }
  else
  {
    if (gbIsLoggerInit)
    {
      uint64_t v8 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)unint64_t v9 = 0;
        _os_log_impl(&dword_22C0F9000, v8, OS_LOG_TYPE_FAULT, "ht_remove_from_list: hashtable is empty", v9, 2u);
      }
    }
    free(a2);
  }
}

uint64_t ht_free_all(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = (pthread_rwlock_t *)(result + 8);
    MultiReadSingleWrite_LockWrite((pthread_rwlock_t *)(result + 8));
    for (uint64_t i = 0; i != 64; ++i)
    {
      uint64_t v4 = v1 + 8 * i;
      uint64_t v7 = *(void **)(v4 + 208);
      uint64_t v6 = (void *)(v4 + 208);
      int v5 = v7;
      if (v7)
      {
        do
        {
          uint64_t v8 = (void *)*v5;
          free(v5);
          int v5 = v8;
        }
        while (v8);
        *uint64_t v6 = 0;
      }
    }
    return MultiReadSingleWrite_FreeWrite(v2);
  }
  return result;
}

void ht_DeAllocateHashTable(uint64_t a1)
{
  if (a1)
  {
    ht_free_all(a1);
    MultiReadSingleWrite_DeInit((pthread_rwlock_t *)(a1 + 8));
    free((void *)a1);
  }
}

uint64_t ht_set_incomplete(uint64_t result, char a2)
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = (pthread_rwlock_t *)(result + 8);
    MultiReadSingleWrite_LockWrite((pthread_rwlock_t *)(result + 8));
    *(unsigned char *)(v3 + 4) = a2;
    return MultiReadSingleWrite_FreeWrite(v4);
  }
  return result;
}

uint64_t FILERECORD_AllocateRecord(void **a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5, int a6, long long *a7, char *a8)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  if (a4 && (a4 == 1 || *(_DWORD *)(a3 + 80) < a4))
  {
    if (gbIsLoggerInit)
    {
      char v16 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int v44 = 136315394;
        *(void *)&v44[4] = a8;
        *(_WORD *)&v44[12] = 1024;
        *(_DWORD *)&v44[14] = a4;
        _os_log_impl(&dword_22C0F9000, v16, OS_LOG_TYPE_ERROR, "FILERECORD_AllocateRecord: got bad start cluster for: %s, %u", v44, 0x12u);
      }
    }
    return 22;
  }
  __int16 v18 = malloc_type_malloc(0x238uLL, 0x10B20407E54F647uLL);
  *a1 = v18;
  if (!v18)
  {
    if (!gbIsLoggerInit)
    {
      *a1 = 0;
      return 12;
    }
    int v23 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v44 = 0;
      _os_log_impl(&dword_22C0F9000, v23, OS_LOG_TYPE_ERROR, "FILERECORD_AllocateRecord: failed to allocate record.\n", v44, 2u);
    }
    int v22 = 0;
    goto LABEL_18;
  }
  bzero(v18, 0x238uLL);
  BOOL v19 = *a1;
  if (*a1)
  {
    *BOOL v19 = -1061240642;
    v19[140] = -1061240642;
  }
  *((void *)v19 + 27) = a3;
  uint64_t v20 = *a1;
  v20[52] = a6;
  *((void *)v20 + 28) = a2;
  unint64_t v21 = *a1;
  v21[107] = a4;
  v21[110] = a5;
  *((void *)v21 + 29) = 0;
  *((void *)*a1 + 30) = (char *)*a1 + 232;
  if ((a6 - 1) > 1)
  {
    if (a6 == 3)
    {
      int v22 = 0;
      *((unsigned char *)*a1 + 504) = 0;
      atomic_store(0, (unint64_t *)*a1 + 64);
      if (a7) {
        goto LABEL_34;
      }
      goto LABEL_45;
    }
    if (a6 != 4)
    {
      int v22 = 0;
      if (!a7) {
        goto LABEL_45;
      }
      goto LABEL_34;
    }
    size_t v24 = *(void *)(a3 + 56);
    size_t v25 = (unint64_t)(*(void *)(a3 + 48) + 1066) / *(void *)(a3 + 48) * *(void *)(a3 + 48);
    int v22 = (char *)malloc_type_malloc(v25, 0xB0A977F1uLL);
    if (v22)
    {
      int StartCluster = DIROPS_GetStartCluster((uint64_t)(a7 + 2));
      if ((!a7 || (*((unsigned char *)a7 + 33) & 2) == 0) && v24 < v25) {
        size_t v25 = v24;
      }
      off_t v27 = DIROPS_VolumeOffsetForCluster(a3, StartCluster);
      uint64_t v28 = metaRead((int *)a3, v22, v27, v25, 0, 0);
      if (v28)
      {
        uint64_t v17 = v28;
        if (gbIsLoggerInit)
        {
          unint64_t v29 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)int v44 = 136315394;
            *(void *)&v44[4] = "FILERECORD_AllocateRecord";
            *(_WORD *)&v44[12] = 1024;
            *(_DWORD *)&v44[14] = v17;
            _os_log_impl(&dword_22C0F9000, v29, OS_LOG_TYPE_ERROR, "%s: Failed to read from the device. Error = %d.", v44, 0x12u);
          }
        }
        goto LABEL_48;
      }
      for (uint64_t i = 5; i != 9; ++i)
        *((_DWORD *)*a1 + 126) = v22[i] + 10 * *((_DWORD *)*a1 + 126) - 48;
      free(v22);
      if (a7) {
        goto LABEL_34;
      }
LABEL_45:
      if (a4)
      {
        long long v40 = *a1;
        goto LABEL_47;
      }
LABEL_52:
      long long v40 = *a1;
      *((void *)*a1 + 54) = 0;
      goto LABEL_54;
    }
LABEL_18:
    uint64_t v17 = 12;
LABEL_48:
    if (*a1) {
      free(*a1);
    }
    *a1 = 0;
    if (v22) {
      free(v22);
    }
    return v17;
  }
  int v22 = 0;
  *((void *)*a1 + 63) = 1;
  *((void *)*a1 + 64) = 0;
  if (!a7) {
    goto LABEL_45;
  }
LABEL_34:
  long long v30 = (char *)*a1;
  uint64_t v31 = (char *)*a1 + 8;
  v30[424] = 1;
  long long v32 = a7[6];
  long long v34 = a7[3];
  long long v33 = a7[4];
  v31[20] = a7[5];
  v31[21] = v32;
  v31[18] = v34;
  v31[19] = v33;
  long long v35 = a7[10];
  long long v37 = a7[7];
  long long v36 = a7[8];
  v31[24] = a7[9];
  v31[25] = v35;
  v31[22] = v37;
  v31[23] = v36;
  long long v38 = *a7;
  long long v39 = a7[2];
  v31[16] = a7[1];
  v31[17] = v39;
  *(_OWORD *)(v30 + 248) = v38;
  if (!a4) {
    goto LABEL_52;
  }
  long long v40 = *a1;
  if (a6 != 5)
  {
    if ((*((unsigned char *)a7 + 33) & 2) == 0) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
  if ((*((unsigned char *)a7 + 1) & 2) != 0) {
LABEL_39:
  }
    *((unsigned char *)v40 + 444) = 1;
LABEL_40:
  if (*((unsigned char *)v40 + 444))
  {
    unint64_t v41 = (unint64_t)(*((void *)a7 + 7) + *(void *)(a3 + 56) - 1) / *(void *)(a3 + 56);
    *((_DWORD *)v40 + 109) = v41;
    *((_DWORD *)v40 + 108) = a4 + v41 - 1;
    goto LABEL_54;
  }
LABEL_47:
  uint64_t v17 = FAT_Access_M_ChainLength(a3, a4, (unsigned int *)v40 + 109, 0, (_DWORD *)v40 + 108);
  if (v17) {
    goto LABEL_48;
  }
  long long v40 = *a1;
LABEL_54:
  CONV_DuplicateName((char *)v40 + 448, a8);
  MultiReadSingleWrite_Init((pthread_rwlock_t *)((char *)*a1 + 8));
  *(void *)int v44 = 0;
  *(void *)&v44[8] = 0;
  pthread_mutexattr_init((pthread_mutexattr_t *)v44);
  pthread_mutexattr_settype((pthread_mutexattr_t *)v44, 1);
  if (a6 != 1) {
    *((_DWORD *)*a1 + 110) = a5;
  }
  return 0;
}

void FILERECORD_FreeRecord(char *a1, int a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = (pthread_rwlock_t *)(a1 + 8);
  while (1)
  {
    MultiReadSingleWrite_LockWrite(v4);
    if (*((_DWORD *)a1 + 52) != 3) {
      break;
    }
    if (!atomic_load((unint64_t *)a1 + 64)) {
      break;
    }
    if (!a2)
    {
      if (gbIsLoggerInit)
      {
        uint64_t v6 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          unint64_t v7 = atomic_load((unint64_t *)a1 + 64);
          int v9 = 136315650;
          unsigned int v10 = "FILERECORD_FreeRecord";
          __int16 v11 = 2048;
          unint64_t v12 = v7;
          __int16 v13 = 1024;
          int v14 = 0;
          _os_log_impl(&dword_22C0F9000, v6, OS_LOG_TYPE_ERROR, "%s: %llu open writes when waitForWrites is %d", (uint8_t *)&v9, 0x1Cu);
        }
      }
      break;
    }
    MultiReadSingleWrite_FreeWrite(v4);
    usleep(0x64u);
  }
  FILERECORD_EvictAllFileChainCacheEntriesFromGivenOffset((uint64_t)a1, 0, 1);
  MultiReadSingleWrite_FreeWrite(v4);
  *(_DWORD *)a1 = -559031622;
  *((_DWORD *)a1 + 140) = -559031622;
  if ((*((_DWORD *)a1 + 52) - 1) <= 1) {
    DIROPS_DestroyHTForDirectory((uint64_t)a1);
  }
  uint64_t v8 = (void *)*((void *)a1 + 56);
  if (v8) {
    free(v8);
  }
  MultiReadSingleWrite_DeInit(v4);
  free(a1);
}

void *FILERECORD_EvictAllFileChainCacheEntriesFromGivenOffset(uint64_t a1, unint64_t a2, int a3)
{
  uint64_t v6 = *(void *)(a1 + 216);
  if (a3) {
    pthread_mutex_lock((pthread_mutex_t *)(*(void *)(v6 + 2008) + 8));
  }
  uint64_t result = *(void **)(a1 + 232);
  if (result)
  {
    do
    {
      uint64_t v8 = (void *)result[16];
      if (*result + *(void *)(v6 + 56) * (unint64_t)*((unsigned int *)result + 2) >= a2) {
        FILERECORD_RemoveChainCacheEntry(result);
      }
      uint64_t result = v8;
    }
    while (v8);
  }
  if (a3)
  {
    int v9 = (pthread_mutex_t *)(*(void *)(v6 + 2008) + 8);
    return (void *)pthread_mutex_unlock(v9);
  }
  return result;
}

uint64_t FILERECORD_InitChainCache(uint64_t a1)
{
  uint64_t v2 = (char *)malloc_type_malloc(0x60uLL, 0x10A004019B037CAuLL);
  *(void *)(a1 + 2008) = v2;
  if (v2)
  {
    *((void *)v2 + 9) = 0;
    *((void *)v2 + 10) = v2 + 72;
    *(_DWORD *)uint64_t v2 = 0;
    atomic_store(0, (unint64_t *)v2 + 11);
    pthread_mutex_init((pthread_mutex_t *)(v2 + 8), 0);
    return 0;
  }
  else
  {
    if (gbIsLoggerInit)
    {
      uint64_t v4 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)int v5 = 0;
        _os_log_impl(&dword_22C0F9000, v4, OS_LOG_TYPE_ERROR, "FILERECORD_InitChainCache: fail to allocate record.\n", v5, 2u);
      }
    }
    return 12;
  }
}

void FILERECORD_DeInitChainCache(uint64_t a1)
{
  pthread_mutex_destroy((pthread_mutex_t *)(*(void *)(a1 + 2008) + 8));
  uint64_t v2 = *(unint64_t **)(a1 + 2008);
  *(_DWORD *)uint64_t v2 = 0;
  atomic_store(0, v2 + 11);
  free(v2);
  *(void *)(a1 + 2008) = 0;
}

void FILERECORD_RemoveChainCacheEntry(void *a1)
{
  uint64_t v1 = *((void *)a1 + 2);
  uint64_t v2 = *(void *)(v1 + 216);
  uint64_t v3 = *((void *)a1 + 14);
  uint64_t v4 = (void *)*((void *)a1 + 15);
  if (v3)
  {
    *(void *)(v3 + 120) = v4;
    uint64_t v4 = (void *)*((void *)a1 + 15);
  }
  else
  {
    *(void *)(*(void *)(v2 + 2008) + 80) = v4;
  }
  *uint64_t v4 = v3;
  uint64_t v5 = *((void *)a1 + 16);
  uint64_t v6 = (void *)*((void *)a1 + 17);
  if (v5)
  {
    *(void *)(v5 + 136) = v6;
    uint64_t v6 = (void *)*((void *)a1 + 17);
  }
  else
  {
    *(void *)(v1 + 240) = v6;
  }
  *uint64_t v6 = v5;
  --**(_DWORD **)(v2 + 2008);
  free(a1);
}

void FILERECORD_GetChainFromCache(uint64_t a1, unint64_t a2, unsigned int *a3, _DWORD *a4, int *a5)
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  unsigned int v8 = *(_DWORD *)(a1 + 428);
  if (v8 != 1)
  {
    if (!v8)
    {
      *a3 = 0;
      *a4 = 0;
      return;
    }
    uint64_t v10 = *(void *)(a1 + 216);
    if (v8 <= *(_DWORD *)(v10 + 80))
    {
      pthread_mutex_lock((pthread_mutex_t *)(*(void *)(v10 + 2008) + 8));
      *a3 = *(_DWORD *)(a1 + 428);
      unint64_t v13 = *(void *)(v10 + 56);
      char v60 = 0;
      uint64_t v14 = *(void *)(a1 + 232);
      if (!v14)
      {
        unint64_t v17 = a2 / v13;
        __int16 v18 = (unsigned int *)&v60;
        goto LABEL_15;
      }
      uint64_t v15 = *(void *)v14;
      if (*(void *)v14 > a2) {
        goto LABEL_11;
      }
      uint64_t v19 = **(void **)(*(void *)(a1 + 240) + 8);
      uint64_t v20 = *(void *)(*(void *)(a1 + 216) + 56);
      if (*(void *)v19 + v20 * (unint64_t)*(unsigned int *)(v19 + 8) >= a2)
      {
        while (1)
        {
          uint64_t v19 = v14;
          if (v15 + v20 * (unint64_t)*(unsigned int *)(v14 + 8) > a2) {
            break;
          }
          uint64_t v14 = *(void *)(v14 + 128);
          if (!v14) {
            goto LABEL_11;
          }
          uint64_t v15 = *(void *)v14;
          if (*(void *)v14 > a2) {
            goto LABEL_20;
          }
        }
        FILERECORD_GetClusterFromChainArray(a1, (uint64_t *)v14, a3, a4, a2, &v60);
        if (!v60)
        {
LABEL_11:
          LOBYTE(v61) = 0;
          uint64_t v16 = *(void *)(a1 + 216);
LABEL_12:
          *a3 = *(_DWORD *)(a1 + 428);
          unint64_t v17 = a2 / *(void *)(v16 + 56);
LABEL_13:
          __int16 v18 = &v61;
LABEL_15:
          *a5 = FILERECORD_FindClusterToCreateChainCacheEntry(v18, a1, v17, a2, a3, a4);
LABEL_34:
          pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(v10 + 2008) + 8));
          return;
        }
LABEL_37:
        *(void *)(v19 + 24) = atomic_fetch_add((atomic_ullong *volatile)(*(void *)(v10 + 2008) + 88), 1uLL);
        goto LABEL_34;
      }
LABEL_20:
      *(_DWORD *)long long buf = 0;
      uint64_t v21 = *(void *)(*(void *)(v19 + 16) + 216);
      unsigned int LastElementNumInCacheEntry = FILERECORD_GetLastElementNumInCacheEntry(v19, buf);
      if (*(_DWORD *)buf
        || (unsigned int v23 = *(_DWORD *)(v19 + 8 * LastElementNumInCacheEntry + 36)
                + *(_DWORD *)(v19 + 8 * LastElementNumInCacheEntry + 32),
            unsigned int v24 = v23 - 1,
            v23 - 1 < 2)
        || v24 > *(_DWORD *)(v21 + 80))
      {
        if (gbIsLoggerInit)
        {
          size_t v25 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)char v62 = 0;
            _os_log_impl(&dword_22C0F9000, v25, OS_LOG_TYPE_ERROR, "FILERECORD_UpdateLastElementNumInCacheEntry: Last known cluster is invalid", v62, 2u);
          }
          int ClustersFatEntryContent = 22;
          goto LABEL_27;
        }
        int ClustersFatEntryContent = 22;
LABEL_32:
        *a5 = ClustersFatEntryContent;
        goto LABEL_33;
      }
      unsigned int v61 = 0;
      int ClustersFatEntryContent = FAT_Access_M_GetClustersFatEntryContent(v21, v24, &v61);
      *(_DWORD *)long long buf = ClustersFatEntryContent;
      if (!ClustersFatEntryContent)
      {
        unsigned int v33 = FILERECORD_GetLastElementNumInCacheEntry(v19, buf);
        int ClustersFatEntryContent = *(_DWORD *)buf;
        if (*(_DWORD *)buf)
        {
          if (gbIsLoggerInit)
          {
            long long v34 = gpsExFatLog;
            if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)char v62 = 0;
              _os_log_impl(&dword_22C0F9000, v34, OS_LOG_TYPE_ERROR, "FILERECORD_UpdateLastElementNumInCacheEntry: FILERECORD_GetLastElementNumInCacheEntry failed", v62, 2u);
            }
            goto LABEL_27;
          }
          goto LABEL_32;
        }
        char v35 = v33;
        unsigned int v36 = v61;
        if (v61 != v23)
        {
LABEL_46:
          if ((v35 + 1) <= 9u && v36 >= 2)
          {
            unint64_t v38 = (v35 + 1);
            uint64_t v39 = v19 + 8 * v38 + 36;
            do
            {
              if (v36 > *(_DWORD *)(v21 + 80)) {
                break;
              }
              long long v57 = (_DWORD *)v39;
              unint64_t v59 = v38;
              unsigned int v40 = v36;
              int v41 = FAT_Access_M_ContiguousClustersInChain(v21, v36, &v61, buf);
              int ClustersFatEntryContent = *(_DWORD *)buf;
              if (*(_DWORD *)buf) {
                goto LABEL_27;
              }
              int v42 = *(_DWORD *)(v19 + 8);
              *(v57 - 1) = v40;
              *long long v57 = v41;
              *(_DWORD *)(v19 + 8) = v42 + v41;
              if (v59 > 8) {
                break;
              }
              unint64_t v38 = v59 + 1;
              unsigned int v36 = v61;
              uint64_t v39 = (uint64_t)(v57 + 2);
            }
            while (v61 > 1);
          }
          *a5 = 0;
          unint64_t v43 = *(void *)(v10 + 56);
          uint64_t v44 = *(unsigned int *)(v19 + 8);
          if (v44 > ((a2 - *(void *)v19) / v43) && *(void *)v19 + v43 * v44 > a2)
          {
            FILERECORD_GetClusterFromChainArray(a1, (uint64_t *)v19, a3, a4, a2, &v60);
            if (v60) {
              goto LABEL_37;
            }
            if (!gbIsLoggerInit
              || (uint64_t v54 = gpsExFatLog, !os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel)))
            {
LABEL_33:
              *a4 = 0;
              goto LABEL_34;
            }
            *(_WORD *)long long buf = 0;
            unint64_t v29 = "FILERECORD_GetChainFromCache: Couldn't find cluster in the cache.\n";
            long long v30 = v54;
            os_log_type_t v31 = gpeExfatToOsLevel;
            uint32_t v32 = 2;
LABEL_30:
            _os_log_impl(&dword_22C0F9000, v30, v31, v29, buf, v32);
            goto LABEL_33;
          }
          LOBYTE(v61) = 0;
          uint64_t v16 = *(void *)(a1 + 216);
          unint64_t v46 = *(void *)(v16 + 56);
          unint64_t v47 = *(void *)v19 + v46 * *(unsigned int *)(v19 + 8);
          if (a2 >= v47)
          {
            unsigned int v52 = FILERECORD_GetLastElementNumInCacheEntry(v19, a5);
            if (*a5) {
              unsigned int v53 = 0;
            }
            else {
              unsigned int v53 = *(_DWORD *)(v19 + 8 * v52 + 32) + *(_DWORD *)(v19 + 8 * v52 + 36) - 1;
            }
            *a3 = v53;
            if (*a5) {
              goto LABEL_76;
            }
            int v55 = FAT_Access_M_GetClustersFatEntryContent(v16, v53, a3);
            *a5 = v55;
            if (!v55 && *a3 >= 2 && *a3 <= *(_DWORD *)(v16 + 80))
            {
              unint64_t v17 = (a2 - v47) / v46;
              goto LABEL_13;
            }
            if (!gbIsLoggerInit) {
              goto LABEL_76;
            }
            uint64_t v56 = gpsExFatLog;
            if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_FAULT)) {
              goto LABEL_76;
            }
            *(_WORD *)long long buf = 0;
            uint64_t v49 = "Next Cluster is invalid, end of chain.\n";
            size_t v50 = v56;
            uint32_t v51 = 2;
          }
          else
          {
            if (!gbIsLoggerInit) {
              goto LABEL_76;
            }
            uint64_t v48 = gpsExFatLog;
            if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_FAULT)) {
              goto LABEL_76;
            }
            *(_DWORD *)long long buf = 134218240;
            unint64_t v64 = v47;
            __int16 v65 = 2048;
            unint64_t v66 = a2;
            uint64_t v49 = "Something went wrong with our cache - uLastKnownOffset [%llu], uWantedOffsetInFile [%llu].\n";
            size_t v50 = v48;
            uint32_t v51 = 22;
          }
          _os_log_impl(&dword_22C0F9000, v50, OS_LOG_TYPE_FAULT, v49, buf, v51);
LABEL_76:
          FILERECORD_EvictAllFileChainCacheEntriesFromGivenOffset(a1, 0, 0);
          goto LABEL_12;
        }
        unsigned int v58 = v33;
        int v37 = FAT_Access_M_ContiguousClustersInChain(v21, v23, &v61, buf);
        int ClustersFatEntryContent = *(_DWORD *)buf;
        if (!*(_DWORD *)buf)
        {
          char v35 = v58;
          *(_DWORD *)(v19 + 8 * v58 + 36) += v37;
          *(_DWORD *)(v19 + 8) += v37;
          unsigned int v36 = v61;
          goto LABEL_46;
        }
      }
LABEL_27:
      int v27 = gbIsLoggerInit;
      *a5 = ClustersFatEntryContent;
      if (!v27) {
        goto LABEL_33;
      }
      uint64_t v28 = gpsExFatLog;
      if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_33;
      }
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v64) = ClustersFatEntryContent;
      unint64_t v29 = "FILERECORD_GetChainFromCache: FILERECORD_UpdateLastElementNumInCacheEntry failed with error [%d].\n";
      long long v30 = v28;
      os_log_type_t v31 = OS_LOG_TYPE_ERROR;
      uint32_t v32 = 8;
      goto LABEL_30;
    }
  }
  if (gbIsLoggerInit)
  {
    __int16 v11 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v64) = v8;
      _os_log_impl(&dword_22C0F9000, v11, OS_LOG_TYPE_FAULT, "FILERECORD_GetChainFromCache: first cluster is bad: %u.\n", buf, 8u);
    }
  }
  *a3 = 0;
  *a4 = 0;
  *a5 = 5;
}

uint64_t FILERECORD_FindClusterToCreateChainCacheEntry(unsigned char *a1, uint64_t a2, unsigned int a3, unint64_t a4, unsigned int *a5, _DWORD *a6)
{
  uint64_t result = 0;
  uint64_t v39 = *MEMORY[0x263EF8340];
  unsigned int v35 = 0;
  if (!*a1)
  {
    uint64_t result = 0;
    uint64_t v13 = *(void *)(a2 + 216);
    unsigned int v14 = *a5;
    while (1)
    {
      if (v14 < 2 || v14 > *(_DWORD *)(v13 + 80)) {
        return result;
      }
      unsigned int v34 = 0;
      if (*(unsigned char *)(a2 + 444))
      {
        unsigned int v15 = 0;
        unsigned int v16 = *(_DWORD *)(a2 + 436);
      }
      else
      {
        unsigned int v16 = FAT_Access_M_ContiguousClustersInChain(v13, v14, &v34, &v35);
        uint64_t result = v35;
        unsigned int v15 = v35;
        if (v35) {
          break;
        }
      }
      if (!v16) {
        break;
      }
      if (a3 < v16)
      {
        *a5 += a3;
        *a6 = v16 - a3;
        unsigned int v18 = *a5;
        uint64_t v19 = *(void *)(a2 + 216);
        uint64_t v20 = malloc_type_malloc(0x90uLL, 0x10A0040D965DAE5uLL);
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = 0;
          int v23 = 0;
          *((_OWORD *)v20 + 7) = 0u;
          *((_OWORD *)v20 + 8) = 0u;
          *((_OWORD *)v20 + 5) = 0u;
          *((_OWORD *)v20 + 6) = 0u;
          *((_OWORD *)v20 + 3) = 0u;
          *((_OWORD *)v20 + 4) = 0u;
          *((_OWORD *)v20 + 1) = 0u;
          *((_OWORD *)v20 + 2) = 0u;
          *(_OWORD *)uint64_t v20 = 0u;
          unint64_t v24 = a4 / *(void *)(v19 + 56) * *(void *)(v19 + 56);
          uint64_t v25 = *(void *)(a2 + 216);
          *(void *)uint64_t v20 = v24;
          *(_DWORD *)long long buf = 0;
          v20[2] = 0;
          *((void *)v20 + 2) = a2;
          while (1)
          {
            if (*(unsigned char *)(a2 + 444))
            {
              *(void *)uint64_t v21 = 0;
              unsigned int v18 = *(_DWORD *)(a2 + 428);
              int v26 = *(_DWORD *)(a2 + 436);
              unsigned int v27 = -1;
            }
            else
            {
              unsigned int v36 = 0;
              int v26 = FAT_Access_M_ContiguousClustersInChain(v25, v18, &v36, buf);
              int v28 = *(_DWORD *)buf;
              if (*(_DWORD *)buf)
              {
                free(v21);
                goto LABEL_38;
              }
              unsigned int v27 = v36;
              int v23 = v21[2];
            }
            unint64_t v29 = &v21[v22];
            v29[8] = v18;
            v29[9] = v26;
            v23 += v26;
            _OWORD v21[2] = v23;
            if (v27 >= 2 && v27 <= *(_DWORD *)(v25 + 80))
            {
              unsigned int v18 = v27;
              BOOL v30 = v22 == 18;
              v22 += 2;
              if (!v30) {
                continue;
              }
            }
            FILERECORD_AddChainCacheEntryToMainList(v19, v21);
            FILERECORD_SetChainCacheEntryInFileLocations((unint64_t *)v21, (void *)a2);
            uint64_t result = 0;
            *a1 = 1;
            return result;
          }
        }
        if (gbIsLoggerInit)
        {
          os_log_type_t v31 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_22C0F9000, v31, OS_LOG_TYPE_ERROR, "FILERECORD_CreateChainCacheEntry failed to allocate memory\n", buf, 2u);
          }
          int v28 = 12;
LABEL_38:
          int v32 = gbIsLoggerInit;
          unsigned int v35 = v28;
          *a6 = 0;
          if (v32)
          {
            unsigned int v33 = gpsExFatLog;
            if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 67109120;
              int v38 = v28;
              _os_log_impl(&dword_22C0F9000, v33, OS_LOG_TYPE_ERROR, "FILERECORD_FindClusterToCreateChainCacheEntry fail to create cache entry [%d].\n", buf, 8u);
            }
          }
          return v35;
        }
        unsigned int v35 = 12;
LABEL_35:
        *a6 = 0;
        return v35;
      }
      unsigned int v14 = v34;
      if (a3 == v16 && (v34 < 2 || v34 > *(_DWORD *)(v13 + 80))) {
        goto LABEL_35;
      }
      *a5 = v34;
      a3 -= v16;
      if (*a1) {
        return result;
      }
    }
    if (gbIsLoggerInit)
    {
      unint64_t v17 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 67109120;
        int v38 = v15;
        _os_log_impl(&dword_22C0F9000, v17, OS_LOG_TYPE_ERROR, "FILERECORD_FindClusterToCreateChainCacheEntry failed allocateerror [%d].\n", buf, 8u);
      }
    }
    goto LABEL_35;
  }
  return result;
}

void FILERECORD_GetClusterFromChainArray(uint64_t a1, uint64_t *a2, _DWORD *a3, _DWORD *a4, unint64_t a5, unsigned char *a6)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  *a4 = 0;
  uint64_t v7 = *a2;
  if (a5 >= *a2)
  {
    uint64_t v14 = 0;
    unsigned int v15 = (unsigned int *)a2 + 9;
    unint64_t v16 = (a5 - *a2) / *(void *)(*(void *)(a1 + 216) + 56);
    while (1)
    {
      unsigned int v17 = *v15;
      if (!*v15) {
        break;
      }
      BOOL v18 = v16 >= v17;
      int v19 = v16 - v17;
      if (!v18)
      {
        *a3 = *(v15 - 1) + v16;
        *a4 = *v15 - v16;
        *a6 = 1;
        return;
      }
      ++v14;
      v15 += 2;
      LODWORD(v16) = v19;
      if (v14 == 10) {
        return;
      }
    }
    if (gbIsLoggerInit)
    {
      uint64_t v20 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        int v21 = *((_DWORD *)a2 + 2);
        int v22 = 134219008;
        uint64_t v23 = v7;
        __int16 v24 = 1024;
        *(_DWORD *)uint64_t v25 = v21;
        *(_WORD *)&v25[4] = 2048;
        *(void *)&v25[6] = a5;
        __int16 v26 = 1024;
        int v27 = v16;
        __int16 v28 = 1024;
        int v29 = v14;
        int v9 = "FILERECORD_GetClusterFromChainArray: failed to find offset [%llu, %u, %llu, %u, %d].\n";
        uint64_t v10 = v20;
        os_log_type_t v11 = OS_LOG_TYPE_ERROR;
        uint32_t v12 = 40;
        goto LABEL_14;
      }
    }
  }
  else if (gbIsLoggerInit)
  {
    uint64_t v8 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_FAULT))
    {
      int v22 = 134218240;
      uint64_t v23 = v7;
      __int16 v24 = 2048;
      *(void *)uint64_t v25 = a5;
      int v9 = "FILERECORD_GetClusterFromChainArray: psLookupEntry->uFileOffset [%llu] > uWantedOffsetInFile [%llu].\n";
      uint64_t v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_FAULT;
      uint32_t v12 = 22;
LABEL_14:
      _os_log_impl(&dword_22C0F9000, v10, v11, v9, (uint8_t *)&v22, v12);
    }
  }
}

uint64_t FILERECORD_UpdateNewAllocatedClustersInChain(void *a1, int a2, int a3, uint64_t a4)
{
  uint64_t v8 = a1[27];
  int v22 = 0;
  if (a1[29])
  {
    char v9 = 0;
    do
    {
      uint64_t v10 = **(void **)(a1[30] + 8);
      if (*(void *)v10 + *(void *)(v8 + 56) * *(unsigned int *)(v10 + 8) != a4) {
        break;
      }
      unsigned int LastElementNumInCacheEntry = FILERECORD_GetLastElementNumInCacheEntry(**(void **)(a1[30] + 8), &v22);
      if (!v22)
      {
        unsigned int v12 = LastElementNumInCacheEntry;
        unsigned __int8 v13 = LastElementNumInCacheEntry + 1;
        if (LastElementNumInCacheEntry == 9)
        {
          char v14 = 1;
          continue;
        }
        unsigned int v15 = FILERECORD_GetLastElementNumInCacheEntry(v10, &v22);
        if (!v22)
        {
          if (*(_DWORD *)(v10 + 8 * v15 + 32) + *(_DWORD *)(v10 + 8 * v15 + 36) == a2)
          {
            *(_DWORD *)(v10 + 8 * v12 + 36) += a3;
          }
          else
          {
            uint64_t v20 = v10 + 8 * v13;
            *(_DWORD *)(v20 + 32) = a2;
            *(_DWORD *)(v20 + 36) = a3;
          }
          uint64_t result = 0;
          *(_DWORD *)(v10 + 8) += a3;
          *(void *)(v10 + 24) = atomic_fetch_add((atomic_ullong *volatile)(*(void *)(v8 + 2008) + 88), 1uLL);
          return result;
        }
      }
      if (v9) {
        return 22;
      }
      FILERECORD_EvictAllFileChainCacheEntriesFromGivenOffset((uint64_t)a1, 0, 0);
      char v14 = 0;
      char v9 = 1;
    }
    while (a1[29] && (v14 & 1) == 0);
  }
  unint64_t v16 = (char *)malloc_type_malloc(0x90uLL, 0x10A0040D965DAE5uLL);
  if (v16)
  {
    unsigned int v17 = (unint64_t *)v16;
    *(_OWORD *)(v16 + 12) = 0u;
    *(_OWORD *)(v16 + 28) = 0u;
    *((_DWORD *)v16 + 35) = 0;
    *(_OWORD *)(v16 + 124) = 0u;
    *(_OWORD *)(v16 + 108) = 0u;
    *(_OWORD *)(v16 + 92) = 0u;
    *(_OWORD *)(v16 + 76) = 0u;
    *(_OWORD *)(v16 + 60) = 0u;
    *(_OWORD *)(v16 + 44) = 0u;
    *(void *)unint64_t v16 = a4;
    *((void *)v16 + 2) = a1;
    *((_DWORD *)v16 + 8) = a2;
    *((_DWORD *)v16 + 9) = a3;
    *((_DWORD *)v16 + 2) = a3;
    FILERECORD_AddChainCacheEntryToMainList(v8, v16);
    FILERECORD_SetChainCacheEntryInFileLocations(v17, a1);
    return 0;
  }
  else
  {
    if (gbIsLoggerInit)
    {
      int v19 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)int v21 = 0;
        _os_log_impl(&dword_22C0F9000, v19, OS_LOG_TYPE_ERROR, "FILERECORD_UpdateNewAllocatedClustersInChain failed to allocate memory\n", v21, 2u);
      }
    }
    return 12;
  }
}

void FILERECORD_AddChainCacheEntryToMainList(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  a2[3] = atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 2008) + 88), 1uLL);
  uint64_t v4 = *(void *)(a1 + 2008);
  unsigned int v5 = *(_DWORD *)v4 + 1;
  *(_DWORD *)uint64_t v4 = v5;
  if (v5 >= 0x65)
  {
    memset(v18, 0, sizeof(v18));
    uint64_t v6 = *(void *)(v4 + 72);
    if (v6)
    {
      unsigned __int8 v7 = 0;
      unsigned __int8 v8 = 0;
      unint64_t v9 = 0;
      do
      {
        if (v7 > 9u)
        {
          unint64_t v12 = *(void *)(v6 + 24);
          if (v12 < v9)
          {
            uint64_t v13 = 0;
            *((void *)v18 + v8) = v6;
            unint64_t v9 = v12;
            do
            {
              unint64_t v14 = *(void *)(*((void *)v18 + v13) + 24);
              BOOL v15 = v9 >= v14;
              if (v9 <= v14) {
                unint64_t v9 = *(void *)(*((void *)v18 + v13) + 24);
              }
              if (!v15) {
                unsigned __int8 v8 = v13;
              }
              ++v13;
            }
            while (v13 != 10);
          }
        }
        else
        {
          *((void *)v18 + v7) = v6;
          unint64_t v10 = *(void *)(v6 + 24);
          BOOL v11 = v9 >= v10;
          if (v9 <= v10) {
            unint64_t v9 = *(void *)(v6 + 24);
          }
          if (!v11) {
            unsigned __int8 v8 = v7;
          }
          ++v7;
        }
        uint64_t v6 = *(void *)(v6 + 112);
      }
      while (v6);
    }
    for (uint64_t i = 0; i != 80; i += 8)
      FILERECORD_RemoveChainCacheEntry(*(void **)((char *)v18 + i));
    uint64_t v4 = *(void *)(a1 + 2008);
  }
  a2[14] = 0;
  unsigned int v17 = *(void **)(v4 + 80);
  a2[15] = v17;
  *unsigned int v17 = a2;
  *(void *)(*(void *)(a1 + 2008) + 80) = a2 + 14;
}

void FILERECORD_SetChainCacheEntryInFileLocations(unint64_t *a1, void *a2)
{
  uint64_t v2 = (unsigned int *)a2[29];
  if (v2)
  {
    unint64_t v3 = *a1;
    uint64_t v4 = *(void *)(a2[27] + 56);
    uint64_t v5 = *(void *)v2;
    if (*(void *)v2 <= *a1)
    {
      while (1)
      {
        uint64_t v6 = v2;
        uint64_t v2 = (unsigned int *)*((void *)v2 + 16);
        if (!v2) {
          break;
        }
        uint64_t v5 = *(void *)v2;
        if (*(void *)v2 > v3) {
          goto LABEL_6;
        }
      }
      a1[16] = 0;
      unint64_t v10 = (unint64_t **)a2[30];
      a1[17] = (unint64_t)v10;
      *unint64_t v10 = a1;
      a2[30] = a1 + 16;
    }
    else
    {
      uint64_t v6 = 0;
LABEL_6:
      unint64_t v7 = v3 + v4 * *((unsigned int *)a1 + 2);
      unint64_t v8 = v5 + v4 * v2[2];
      if (v6) {
        unint64_t v9 = *(void *)v6 + v4 * v6[2];
      }
      else {
        unint64_t v9 = 0;
      }
      a1[17] = *((void *)v2 + 17);
      a1[16] = (unint64_t)v2;
      **((void **)v2 + 17) = a1;
      *((void *)v2 + 17) = a1 + 16;
      if (v8 <= v7)
      {
        FILERECORD_RemoveChainCacheEntry(v2);
      }
      else if (v6)
      {
        if (v3 <= v9) {
          FILERECORD_RemoveChainCacheEntry(v6);
        }
      }
    }
  }
  else
  {
    a1[16] = 0;
    a2[29] = a1;
    a2[30] = a1 + 16;
    a1[17] = (unint64_t)(a2 + 29);
  }
}

uint64_t FILERECORD_GetLastElementNumInCacheEntry(uint64_t a1, _DWORD *a2)
{
  uint64_t v3 = 0;
  *a2 = 0;
  uint64_t v4 = (int *)(a1 + 32);
  while (1)
  {
    int v5 = *v4;
    v4 += 2;
    if (!v5) {
      break;
    }
    if (++v3 == 10) {
      return (v3 - 1);
    }
  }
  if ((_BYTE)v3) {
    return (v3 - 1);
  }
  if (gbIsLoggerInit)
  {
    unint64_t v8 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)unint64_t v9 = 0;
      _os_log_impl(&dword_22C0F9000, v8, OS_LOG_TYPE_FAULT, "FILERECORD_GetLastElementNumInCacheEntry: got psEntry with no valid elements", v9, 2u);
    }
  }
  *a2 = 22;
  return 10;
}

void FILERECORD_MultiLock(char *a1, int a2, int a3, int a4)
{
  if (a4) {
    unint64_t v8 = (int (__cdecl *)(const void *, const void *))FILERECORD_CompareRecordsLock;
  }
  else {
    unint64_t v8 = (int (__cdecl *)(const void *, const void *))FILERECORD_CompareRecordsRelease;
  }
  qsort(a1, a2, 8uLL, v8);
  if (a2 >= 1)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 8 * a2;
    do
    {
      uint64_t v11 = *(void *)&a1[v9];
      if (v11 && (!v9 || v11 != *(void *)&a1[v9 - 8]))
      {
        unint64_t v12 = (pthread_rwlock_t *)(v11 + 8);
        if (a4)
        {
          if (a3) {
            MultiReadSingleWrite_LockWrite(v12);
          }
          else {
            MultiReadSingleWrite_LockRead(v12);
          }
        }
        else if (a3)
        {
          MultiReadSingleWrite_FreeWrite(v12);
        }
        else
        {
          MultiReadSingleWrite_FreeRead(v12);
        }
      }
      v9 += 8;
    }
    while (v10 != v9);
  }
}

uint64_t FILERECORD_CompareRecordsLock(void *a1, void *a2)
{
  if (*a1 == *a2) {
    unsigned int v2 = 0;
  }
  else {
    unsigned int v2 = -1;
  }
  if ((uint64_t)(*a1 - *a2) > 0) {
    return 1;
  }
  else {
    return v2;
  }
}

uint64_t FILERECORD_CompareRecordsRelease(void *a1, void *a2)
{
  if ((uint64_t)(*a1 - *a2) > 0) {
    return 0xFFFFFFFFLL;
  }
  else {
    return *a1 != *a2;
  }
}

uint64_t EXFAT_LoggerInit()
{
  gpsExFatLog = (uint64_t)os_log_create("com.apple.filesystems.livefiles_exfat_plugin", "plugin");
  uint64_t result = 1;
  if (gpsExFatLog)
  {
    gbIsLoggerInit = 1;
    return 0;
  }
  return result;
}

uint64_t FAT_Access_M_GetClustersFatEntryContent(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  uint64_t v10 = 0;
  uint64_t v6 = (pthread_mutex_t *)(a1 + 176);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 176));
  uint64_t FatEntry = FAT_Access_M_GetFatEntry(a1, a2, &v10);
  if (FatEntry) {
    int v8 = 0;
  }
  else {
    int v8 = *v10;
  }
  pthread_mutex_unlock(v6);
  *a3 = v8;
  return FatEntry;
}

uint64_t FAT_Access_M_GetFatEntry(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v5 = 4 * a2;
  uint64_t v6 = v5 & 0xFFFFE000;
  if (a2 < 2 || *(_DWORD *)(a1 + 80) < a2) {
    goto LABEL_8;
  }
  uint64_t v7 = 0;
  int v8 = (uint64_t *)(a1 + 272);
  while (v6 != *(v8 - 1))
  {
    ++v7;
    v8 += 18;
    if (v7 == 4) {
      goto LABEL_8;
    }
  }
  if ((v7 & 0xFC) != 0)
  {
LABEL_8:
    uint64_t v41 = 4 * a2;
    uint64_t v9 = 0;
    unsigned __int8 v10 = 0;
    uint64_t v11 = (unint64_t *)(a1 + 272);
    unint64_t v12 = 0x8000000000000000;
    while (*(v11 - 1) != *(void *)(a1 + 16) + *(void *)(a1 + 8))
    {
      unint64_t v14 = *v11;
      v11 += 18;
      unint64_t v13 = v14;
      if (v14 < v12)
      {
        unsigned __int8 v10 = v9;
        unint64_t v12 = v13;
      }
      if (++v9 == 4) {
        goto LABEL_15;
      }
    }
    unsigned __int8 v10 = v9;
LABEL_15:
    BOOL v15 = (pthread_mutex_t *)(a1 + 176);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 176));
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 176));
    uint64_t v16 = 0;
    unsigned int v17 = v10;
    BOOL v18 = (char *)v15 + 144 * v10;
    uint64_t v21 = *((void *)v18 + 11);
    uint64_t v19 = v18 + 88;
    uint64_t v20 = v21;
    while (1)
    {
      uint64_t v22 = a1 + v16;
      if (*(void *)(a1 + v16 + 904) == v20) {
        break;
      }
      v16 += 144;
      if (v16 == 576) {
        goto LABEL_25;
      }
    }
    pthread_mutex_lock((pthread_mutex_t *)(v22 + 976));
    if (*(unsigned char *)(v22 + 920))
    {
      uint64_t v23 = (pthread_cond_t *)(a1 + v16 + 928);
      do
      {
        if (*(void *)(v22 + 904) != v20) {
          break;
        }
        if (*(unsigned char *)(v22 + 921)) {
          break;
        }
        __tp.tv_seCC_MD5_CTX c = 0;
        __tp.tv_nseCC_MD5_CTX c = 0;
        clock_gettime(_CLOCK_REALTIME, &__tp);
        __tp.tv_nsec += 100000;
        pthread_cond_timedwait(v23, (pthread_mutex_t *)(v22 + 976), &__tp);
      }
      while (*(unsigned char *)(v22 + 920));
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v22 + 976));
LABEL_25:
    __int16 v24 = (const void **)(a1 + 144 * v10 + 256);
    uint64_t v25 = FAT_Access_M_FlushCacheEntry(a1, (uint64_t)v24, 0);
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 176));
    if (v25)
    {
      if (gbIsLoggerInit)
      {
        __int16 v26 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          LOWORD(__tp.tv_sec) = 0;
          _os_log_impl(&dword_22C0F9000, v26, OS_LOG_TYPE_ERROR, "FAT_Access_M_GetFATCluster failed to flush cache entry\n", (uint8_t *)&__tp, 2u);
        }
      }
LABEL_43:
      pthread_mutex_unlock(v15);
      if (gbIsLoggerInit)
      {
        unsigned int v33 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          LODWORD(__tp.tv_sec) = 67109120;
          HIDWORD(__tp.tv_sec) = v25;
          _os_log_impl(&dword_22C0F9000, v33, OS_LOG_TYPE_ERROR, "FAT_Access_M_GetFATCluster: fail to get fat cluster %d\n", (uint8_t *)&__tp, 8u);
        }
      }
      *a3 = 0;
    }
    else
    {
      uint64_t v27 = 0;
      unint64_t v28 = *(void *)(a1 + 16);
      while (1)
      {
        uint64_t v29 = a1 + v27;
        if (*(void *)(a1 + v27 + 904) == v6) {
          break;
        }
        v27 += 144;
        if (v27 == 576) {
          goto LABEL_35;
        }
      }
      if (*(unsigned char *)(v29 + 920))
      {
        memcpy(*(void **)(a1 + v27 + 896), *v24, 0x2000uLL);
        *(unsigned char *)(a1 + 144 * v17 + 280) = *(unsigned char *)(v29 + 920);
        goto LABEL_47;
      }
LABEL_35:
      if (v6 + 0x2000 <= v28) {
        size_t v30 = 0x2000;
      }
      else {
        size_t v30 = (v28 - v6);
      }
      uint64_t v31 = metaRead((int *)a1, (void *)*v24, *(void *)(a1 + 8) + v6, v30, 0, 0);
      if (v31)
      {
        uint64_t v25 = v31;
        if (gbIsLoggerInit)
        {
          int v32 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            LODWORD(__tp.tv_sec) = 67109120;
            HIDWORD(__tp.tv_sec) = v25;
            _os_log_impl(&dword_22C0F9000, v32, OS_LOG_TYPE_ERROR, "FAT_Access_M_GetFATCluster failed to read with error = [%d].\n", (uint8_t *)&__tp, 8u);
          }
        }
        *uint64_t v19 = *(void *)(a1 + 16) + *(void *)(a1 + 8);
        goto LABEL_43;
      }
LABEL_47:
      *uint64_t v19 = v6;
      pthread_mutex_unlock((pthread_mutex_t *)(a1 + 176));
      *a3 = (char *)*v24 + (v41 & 0x300001FFCLL);
      uint64_t v34 = *(void *)(a1 + 240);
      uint64_t v35 = v34 + 1;
      *(void *)(a1 + 240) = v34 + 1;
      if (v34 <= -2)
      {
        for (uint64_t i = 272; i != 848; i += 144)
          *(void *)(a1 + i) = 0;
        uint64_t v35 = 1;
        *(void *)(a1 + 240) = 1;
      }
      uint64_t v25 = 0;
      *(void *)(a1 + 144 * v17 + 272) = v35;
    }
  }
  else
  {
    *a3 = *(v8 - 2) + (v5 & 0x300001FFCLL);
    uint64_t v38 = *(void *)(a1 + 240);
    uint64_t v39 = v38 + 1;
    *(void *)(a1 + 240) = v38 + 1;
    if (v38 <= -2)
    {
      for (uint64_t j = 272; j != 848; j += 144)
        *(void *)(a1 + j) = 0;
      uint64_t v39 = 1;
      *(void *)(a1 + 240) = 1;
    }
    uint64_t v25 = 0;
    *int v8 = v39;
  }
  return v25;
}

uint64_t FAT_Access_M_ContiguousClustersInChain(uint64_t a1, unsigned int a2, unsigned int *a3, _DWORD *a4)
{
  unsigned int v5 = a2;
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a2 >= 2 && *(_DWORD *)(a1 + 80) >= a2)
  {
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 176));
    int ClustersFatEntryContent = FAT_Access_M_GetClustersFatEntryContent(a1, v5, a3);
    *a4 = ClustersFatEntryContent;
    if (ClustersFatEntryContent)
    {
LABEL_11:
      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v8 = 1;
      while (1)
      {
        unsigned int v11 = *a3;
        if (*a3 != v5 + 1) {
          break;
        }
        uint64_t v8 = (v8 + 1);
        int v12 = FAT_Access_M_GetClustersFatEntryContent(a1, *a3, a3);
        *a4 = v12;
        unsigned int v5 = v11;
        if (v12) {
          goto LABEL_11;
        }
      }
    }
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 176));
  }
  else
  {
    if (gbIsLoggerInit)
    {
      uint64_t v7 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_FAULT))
      {
        v14[0] = 67109120;
        v14[1] = v5;
        _os_log_impl(&dword_22C0F9000, v7, OS_LOG_TYPE_FAULT, "FAT_Access_M_ContiguousClustersInChain got bad cluster [%u] .\n", (uint8_t *)v14, 8u);
      }
    }
    uint64_t v8 = 0;
    *a4 = 5;
  }
  return v8;
}

uint64_t FAT_Access_M_ChainLength(uint64_t a1, unsigned int a2, unsigned int *a3, uint64_t a4, _DWORD *a5)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v17 = 0;
  uint64_t v9 = (pthread_mutex_t *)(a1 + 176);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 176));
  unsigned int v10 = 0;
  if (a2 >= 2)
  {
    unsigned int v10 = 0;
    while (a2 <= *(_DWORD *)(a1 + 80))
    {
      int v11 = FAT_Access_M_ContiguousClustersInChain(a1, a2, (unsigned int *)&v17 + 1, &v17);
      uint64_t v12 = v17;
      if (v17)
      {
        if (gbIsLoggerInit)
        {
          uint64_t v15 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 67109120;
            int v19 = v12;
            _os_log_impl(&dword_22C0F9000, v15, OS_LOG_TYPE_ERROR, "FAT_Access_M_ChainLength failed to read from fat iErr = %d\n", buf, 8u);
          }
        }
        goto LABEL_8;
      }
      v10 += v11;
      unsigned int v13 = *(_DWORD *)(a1 + 80);
      if (v10 >= v13)
      {
        if (gbIsLoggerInit)
        {
          uint64_t v16 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 67109376;
            int v19 = v10;
            __int16 v20 = 1024;
            unsigned int v21 = v13;
            _os_log_impl(&dword_22C0F9000, v16, OS_LOG_TYPE_ERROR, "FAT_Access_M_ChainLength found circle cycle %u > %u.\n", buf, 0xEu);
          }
        }
        uint64_t v12 = 5;
        goto LABEL_8;
      }
      *a5 = a2 + v11 - 1;
      a2 = HIDWORD(v17);
      if (HIDWORD(v17) <= 1) {
        break;
      }
    }
  }
  uint64_t v12 = 0;
  *a3 = v10;
LABEL_8:
  pthread_mutex_unlock(v9);
  return v12;
}

uint64_t FAT_Access_M_GetTotalFreeClusters(uint64_t a1)
{
  unint64_t v14 = 0;
  uint64_t v15 = 0;
  unsigned int v13 = 0;
  unsigned int v2 = (pthread_mutex_t *)(a1 + 176);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 176));
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a1 + 80) - 1;
  uint64_t v3 = FAT_Access_M_BitmapMap(a1, 0, &v14, (int *)&v13, &v15);
  if (!v3) {
    goto LABEL_16;
  }
  unsigned int v4 = *(_DWORD *)(a1 + 80);
  if (v4 < 0x21)
  {
    unsigned int v10 = 0;
    unsigned int v9 = v4 - 2;
LABEL_12:
    int v11 = 1;
    do
    {
      if ((*(_DWORD *)v3 & v11) != 0) {
        --*(_DWORD *)(a1 + 76);
      }
      v11 *= 2;
      ++v10;
    }
    while (v10 <= v9);
    goto LABEL_16;
  }
  int v5 = 0;
  unsigned int v6 = 32;
  do
  {
    unsigned int v7 = *(_DWORD *)v3;
    v3 += 4;
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    *(_DWORD *)(a1 + 76) -= v8.i32[0];
    if (v6 <= v4 - 2 && (unint64_t)v3 >= v14)
    {
      uint64_t v3 = FAT_Access_M_BitmapMap(a1, v6, &v14, (int *)&v13, &v15);
      if (!v3) {
        goto LABEL_16;
      }
      unsigned int v4 = *(_DWORD *)(a1 + 80);
    }
    v5 -= 32;
    v6 += 32;
  }
  while (v4 + v5 > 0x20);
  unsigned int v9 = v4 - 2;
  unsigned int v10 = -v5;
  if (-v5 <= v9) {
    goto LABEL_12;
  }
LABEL_16:
  pthread_mutex_unlock(v2);
  return v13;
}

char *FAT_Access_M_BitmapMap(uint64_t a1, unsigned int a2, void *a3, int *a4, void ***a5)
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  if (*(_DWORD *)(a1 + 80) - 2 < a2)
  {
    if (gbIsLoggerInit)
    {
      unsigned int v7 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 67109120;
        unsigned int v63 = a2;
        _os_log_impl(&dword_22C0F9000, v7, OS_LOG_TYPE_ERROR, "FAT_Access_M_BitmapMap Got bad cluster [%d].\n", buf, 8u);
      }
    }
    uint64_t result = 0;
    *a4 = 22;
    return result;
  }
  unint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 2040);
  size_t v13 = 8 * v11;
  unint64_t v14 = (a2 >> 3) & 0x1FFFFFFC;
  unint64_t v15 = v14 / (8 * v11) * 8 * v11;
  unint64_t v16 = v14 % (8 * v11);
  unint64_t v17 = *(void *)(a1 + 1480);
  size_t v18 = 8 * v11;
  size_t v19 = 8 * v11;
  if (v15 + 8 * v11 > v17)
  {
    size_t v19 = v17 - v15;
    size_t v18 = (v17 - v15 + v11 - 1) / v11 * v11;
  }
  uint64_t v20 = 0;
  unsigned int v21 = (void **)(a1 + 1488);
  while (1)
  {
    uint64_t v22 = v21[1];
    if (v22 == (void *)v15 && v22 != (void *)v17) {
      break;
    }
    ++v20;
    v21 += 4;
    if (v20 == 8) {
      goto LABEL_17;
    }
  }
  if (v20 != 8)
  {
    *a5 = v21;
    if (!a3)
    {
LABEL_40:
      unint64_t v14 = v16;
      goto LABEL_41;
    }
LABEL_39:
    *a3 = (char *)*v21 + v19;
    goto LABEL_40;
  }
LABEL_17:
  unint64_t v60 = v14 % (8 * v11);
  unsigned int v61 = a3;
  uint64_t v24 = 0;
  LOBYTE(v20) = 0;
  uint64_t v25 = (unint64_t *)(a1 + 1504);
  unint64_t v26 = 0x8000000000000000;
  while (*(v25 - 1) != v17)
  {
    unint64_t v28 = *v25;
    v25 += 4;
    unint64_t v27 = v28;
    if (v28 < v26)
    {
      LOBYTE(v20) = v24;
      unint64_t v26 = v27;
    }
    if (++v24 == 8) {
      goto LABEL_24;
    }
  }
  LOBYTE(v20) = v24;
LABEL_24:
  uint64_t v29 = a1 + 32 * v20;
  size_t v30 = (void **)(v29 + 1488);
  *a5 = (void **)(v29 + 1488);
  unsigned int v31 = *(_DWORD *)(v29 + 1512);
  if (!v31 || (uint64_t v32 = *(void *)(v29 + 1496), v32 == v17))
  {
LABEL_26:
    *a4 = 0;
    goto LABEL_27;
  }
  uint64_t v59 = v12;
  unsigned int v46 = 0;
  unsigned int v58 = (_DWORD *)(v29 + 1512);
  unint64_t v47 = (void *)(v29 + 1496);
  int v48 = 7;
  do
  {
    int v49 = v31 & 3;
    v31 >>= 1;
    if (v49 == 1) {
      ++v46;
    }
    --v48;
  }
  while (v48);
  if (v46 >= 2)
  {
    long long v57 = v47;
    if (v32 + v13 > v17) {
      size_t v13 = (v17 + v11 - v32 - 1) / v11 * v11;
    }
    uint64_t v51 = DIROPS_VolumeOffsetForCluster(a1, *(_DWORD *)(*(void *)(a1 + 2040) + 428));
    int v52 = metaWrite((int *)a1, *v30, *v57 + v51, v13);
    if (v52)
    {
      int v53 = v52;
      if (gbIsLoggerInit)
      {
        uint64_t v54 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 67109120;
          unsigned int v63 = v53;
          _os_log_impl(&dword_22C0F9000, v54, OS_LOG_TYPE_ERROR, "FAT_Access_M_FlushBitmapCacheEntry failed to write with error = %d.\n", buf, 8u);
        }
      }
      goto LABEL_64;
    }
    uint64_t v12 = v59;
    *unsigned int v58 = 0;
    goto LABEL_26;
  }
  int v50 = FAT_Access_M_FlushPartialBitmapCache(a1, (uint64_t)v30);
  uint64_t v12 = v59;
  *unsigned int v58 = 0;
  *a4 = v50;
  if (v50) {
    goto LABEL_65;
  }
LABEL_27:
  uint64_t v33 = DIROPS_VolumeOffsetForCluster(a1, *(_DWORD *)(v12 + 428));
  uint64_t v34 = v33;
  if (v18 != v19)
  {
    bzero(**a5, 8 * *(void *)(a1 + 48));
    uint64_t v38 = malloc_type_malloc(v18, 0xD75E7EDAuLL);
    if (v38)
    {
      uint64_t v39 = v38;
      int v40 = metaRead((int *)a1, v38, v34 + v15, v18, 0, 0);
      *a4 = v40;
      if (v40)
      {
        if (gbIsLoggerInit)
        {
          unsigned int v41 = v40;
          int v42 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 67109120;
            unsigned int v63 = v41;
            _os_log_impl(&dword_22C0F9000, v42, OS_LOG_TYPE_ERROR, "FAT_Access_M_BitmapMap failed to read from bitmap file [%d].\n", buf, 8u);
          }
        }
        free(v39);
        goto LABEL_41;
      }
      memcpy(**a5, v39, v19);
      free(v39);
LABEL_67:
      unsigned int v21 = *a5;
      v21[1] = (void *)v15;
      *((_DWORD *)v21 + 6) = 0;
      unint64_t v16 = v60;
      a3 = v61;
      if (!v61) {
        goto LABEL_40;
      }
      goto LABEL_39;
    }
    if (gbIsLoggerInit)
    {
      int v55 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_22C0F9000, v55, OS_LOG_TYPE_ERROR, "FAT_Access_M_BitmapMap failed to allocate buffer.\n", buf, 2u);
      }
    }
    int v53 = 12;
LABEL_64:
    *a4 = v53;
    goto LABEL_65;
  }
  int v35 = metaRead((int *)a1, **a5, v33 + v15, v18, 0, 0);
  *a4 = v35;
  if (!v35) {
    goto LABEL_67;
  }
  if (!gbIsLoggerInit)
  {
LABEL_65:
    uint64_t result = 0;
    uint64_t v56 = *a5;
    v56[1] = *(void **)(a1 + 1480);
    *((_DWORD *)v56 + 6) = 0;
    return result;
  }
  unsigned int v36 = v35;
  int v37 = gpsExFatLog;
  if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 67109120;
    unsigned int v63 = v36;
    _os_log_impl(&dword_22C0F9000, v37, OS_LOG_TYPE_ERROR, "FAT_Access_M_BitmapMap failed to read from bitmap file %d.\n", buf, 8u);
  }
LABEL_41:
  if (*a4) {
    goto LABEL_65;
  }
  uint64_t v43 = *(void *)(a1 + 1472);
  uint64_t v44 = v43 + 1;
  *(void *)(a1 + 1472) = v43 + 1;
  if (v43 <= -2)
  {
    for (uint64_t i = 0; i != 256; i += 32)
      *(void *)(a1 + 1504 + i) = 0;
    uint64_t v44 = 1;
    *(void *)(a1 + 1472) = 1;
  }
  *(void *)(a1 + 32 * v20 + 1504) = v44;
  return (char *)**a5 + v14;
}

uint64_t FATMOD_FlushAllCacheEntries(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  unsigned int v2 = (pthread_mutex_t *)(a1 + 176);
  uint64_t v3 = (pthread_mutex_t *)(a1 + 832);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 832));
  pthread_mutex_lock(v2);
  uint64_t v4 = -576;
  do
  {
    uint64_t v5 = a1 + v4;
    int v6 = *(unsigned __int8 *)(a1 + v4 + 856);
    *(unsigned char *)(a1 + v4 + 1496) = v6;
    if (v6)
    {
      pthread_mutex_lock((pthread_mutex_t *)(v5 + 1552));
      memcpy(*(void **)(v5 + 1472), *(const void **)(v5 + 832), 0x2000uLL);
      *(void *)(v5 + 1480) = *(void *)(v5 + 840);
      *(unsigned char *)(v5 + 856) = 0;
      *(unsigned char *)(v5 + 1497) = 0;
      pthread_mutex_unlock((pthread_mutex_t *)(v5 + 1552));
    }
    else
    {
      *(void *)(v5 + 1480) = *(void *)(a1 + 16) + *(void *)(a1 + 8);
    }
    v4 += 144;
  }
  while (v4);
  for (uint64_t i = 0; i != 256; i += 32)
  {
    uint64_t v8 = a1 + i;
    int v9 = *(_DWORD *)(a1 + i + 1512);
    *(_DWORD *)(a1 + i + 1768) = v9;
    if (v9)
    {
      memcpy(*(void **)(v8 + 1744), *(const void **)(v8 + 1488), 8 * *(void *)(a1 + 48));
      uint64_t v10 = *(void *)(v8 + 1496);
      *(_DWORD *)(v8 + 1512) = 0;
    }
    else
    {
      uint64_t v10 = *(void *)(a1 + 1480);
    }
    *(void *)(a1 + i + 1752) = v10;
  }
  pthread_mutex_unlock(v2);
  uint64_t v11 = 0;
  unsigned int v12 = 0;
  do
  {
    uint64_t v13 = a1 + v11;
    pthread_mutex_lock((pthread_mutex_t *)(a1 + v11 + 976));
    if (*(unsigned char *)(a1 + v11 + 920) || *(void *)(v13 + 904) < *(void *)(a1 + 16) + *(void *)(a1 + 8))
    {
      v12 |= FAT_Access_M_FlushCacheEntry(a1, v13 + 896, 1);
      pthread_cond_broadcast((pthread_cond_t *)(v13 + 928));
    }
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + v11 + 976));
    v11 += 144;
  }
  while (v11 != 576);
  uint64_t v14 = 0;
  while (1)
  {
    uint64_t v15 = a1 + 32 * v14;
    unsigned int v16 = *(_DWORD *)(v15 + 1768);
    if (!v16) {
      goto LABEL_31;
    }
    uint64_t v17 = *(void *)(v15 + 1752);
    unint64_t v18 = *(void *)(a1 + 1480);
    if (v18 == v17) {
      goto LABEL_31;
    }
    unsigned int v19 = 0;
    uint64_t v20 = (void **)(v15 + 1744);
    unsigned int v21 = (_DWORD *)(v15 + 1768);
    uint64_t v22 = (void *)(v15 + 1752);
    int v23 = 7;
    do
    {
      int v24 = v16 & 3;
      v16 >>= 1;
      if (v24 == 1) {
        ++v19;
      }
      --v23;
    }
    while (v23);
    if (v19 < 2)
    {
      int v25 = FAT_Access_M_FlushPartialBitmapCache(a1, (uint64_t)v20);
      _DWORD *v21 = 0;
      if (v25)
      {
        int v31 = v25;
        goto LABEL_33;
      }
      goto LABEL_31;
    }
    unint64_t v26 = *(void *)(a1 + 48);
    size_t v27 = v17 + 8 * v26 <= v18 ? 8 * v26 : (v18 - v17 + v26 - 1) / v26 * v26;
    uint64_t v28 = DIROPS_VolumeOffsetForCluster(a1, *(_DWORD *)(*(void *)(a1 + 2040) + 428));
    int v29 = metaWrite((int *)a1, *v20, *v22 + v28, v27);
    if (v29) {
      break;
    }
    _DWORD *v21 = 0;
LABEL_31:
    if (++v14 == 8)
    {
      int v31 = 0;
      goto LABEL_33;
    }
  }
  int v31 = v29;
  if (gbIsLoggerInit)
  {
    uint64_t v32 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
    {
      v33[0] = 67109120;
      v33[1] = v31;
      _os_log_impl(&dword_22C0F9000, v32, OS_LOG_TYPE_ERROR, "FAT_Access_M_FlushBitmapCacheEntryInternal failed to write with error = %d.\n", (uint8_t *)v33, 8u);
    }
  }
LABEL_33:
  pthread_mutex_unlock(v3);
  return v31 | v12;
}

uint64_t FAT_Access_M_FlushCacheEntry(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(a2 + 24)) {
    return 0;
  }
  unint64_t v5 = *(void *)(a2 + 8);
  unint64_t v6 = *(void *)(a1 + 16);
  unint64_t v7 = *(void *)(a1 + 8) + v6;
  if (v5 >= v7)
  {
    if (gbIsLoggerInit)
    {
      uint64_t v15 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        int v18 = 134218240;
        unint64_t v19 = v5;
        __int16 v20 = 2048;
        unint64_t v21 = v7;
        _os_log_impl(&dword_22C0F9000, v15, OS_LOG_TYPE_ERROR, "FAT_Access_M_FlushCacheEntry uBlockOffset %llu, is invalid (>%llu)\n", (uint8_t *)&v18, 0x16u);
      }
    }
    return 14;
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 2024);
    unsigned int v9 = *(unsigned __int8 *)(v8 + 110);
    if (*(unsigned char *)(v8 + 110))
    {
      unsigned int v11 = 0;
      if (v5 + 0x2000 <= v6) {
        size_t v12 = 0x2000;
      }
      else {
        size_t v12 = (v6 - v5);
      }
      while (1)
      {
        uint64_t v13 = metaWrite((int *)a1, *(void **)a2, *(void *)(a1 + 8) + v5, v12);
        if (v13) {
          break;
        }
        ++v11;
        v5 += *(void *)(a1 + 16);
        if (v11 >= v9) {
          goto LABEL_9;
        }
      }
      uint64_t v14 = v13;
      if (a3) {
        *(unsigned char *)(a2 + 25) = 1;
      }
      if (gbIsLoggerInit)
      {
        uint64_t v17 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          int v18 = 67109120;
          LODWORD(v19) = v14;
          _os_log_impl(&dword_22C0F9000, v17, OS_LOG_TYPE_ERROR, "FAT_Access_M_FlushCacheEntry failed to write with error = [%d].\n", (uint8_t *)&v18, 8u);
        }
      }
    }
    else
    {
LABEL_9:
      uint64_t v14 = 0;
      *(unsigned char *)(a2 + 24) = 0;
    }
  }
  return v14;
}

uint64_t FAT_Access_M_FATChainFree(uint64_t a1, uint64_t a2, int a3, unsigned char *a4, int a5)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  unsigned int v23 = 0;
  if (gbIsLoggerInit)
  {
    uint64_t v10 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel))
    {
      int v11 = *a4;
      *(_DWORD *)long long buf = 67109888;
      int v25 = a2;
      __int16 v26 = 1024;
      int v27 = a3;
      __int16 v28 = 1024;
      int v29 = v11;
      __int16 v30 = 1024;
      int v31 = a5;
      _os_log_impl(&dword_22C0F9000, v10, (os_log_type_t)gpeExfatToOsLevel, "FAT_Access_M_FATChainFree uStart = %u, bIsPartialRelease = %d, is Contig = %d, Num uint64_t Clusters = %d\n", buf, 0x1Au);
    }
  }
  if (a2 >= 2 && *(_DWORD *)(a1 + 80) >= a2)
  {
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 176));
    uint64_t v14 = a2;
    if (a3)
    {
      if (*a4)
      {
LABEL_20:
        uint64_t v16 = FAT_Access_M_BitmapMarkBits((_DWORD *)a1, a3 + (int)a2, a5, 0);
LABEL_21:
        uint64_t ClustersFatEntryContent = v16;
        goto LABEL_22;
      }
      int v22 = a5;
      uint64_t ClustersFatEntryContent = FAT_Access_M_GetClustersFatEntryContent(a1, a2, &v23);
      if (ClustersFatEntryContent)
      {
LABEL_22:
        pthread_mutex_unlock((pthread_mutex_t *)(a1 + 176));
        return ClustersFatEntryContent;
      }
      FAT_Access_M_SetClustersFatEntryContent(a1, a2, -1);
      if (gbIsLoggerInit)
      {
        uint64_t v15 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel))
        {
          *(_DWORD *)long long buf = 67109120;
          int v25 = a2;
          _os_log_impl(&dword_22C0F9000, v15, (os_log_type_t)gpeExfatToOsLevel, "Marking %u as EOF\n", buf, 8u);
        }
      }
      uint64_t v14 = v23;
      if (v23 < 2 || (a5 = v22, v23 > *(_DWORD *)(a1 + 80)))
      {
        uint64_t ClustersFatEntryContent = 0;
        goto LABEL_22;
      }
    }
    if (!*a4)
    {
      uint64_t ClustersFatEntryContent = 0;
      do
      {
        if (v14 > *(_DWORD *)(a1 + 80) || ClustersFatEntryContent != 0) {
          break;
        }
        int v19 = 0;
        uint64_t v20 = v14;
        do
        {
          if (v20 > *(_DWORD *)(a1 + 80)) {
            break;
          }
          uint64_t v16 = FAT_Access_M_GetClustersFatEntryContent(a1, v20, &v23);
          if (v16) {
            goto LABEL_21;
          }
          ++v19;
          FAT_Access_M_SetClustersFatEntryContent(a1, v20, 0);
          uint64_t v20 = v23;
        }
        while (v23 >= 2 && v19 + v14 == v23);
        uint64_t ClustersFatEntryContent = FAT_Access_M_BitmapMarkBits((_DWORD *)a1, v14, v19, 0);
        uint64_t v14 = v20;
      }
      while (v20 > 1);
      goto LABEL_22;
    }
    goto LABEL_20;
  }
  if (gbIsLoggerInit)
  {
    size_t v12 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      int v25 = a2;
      _os_log_impl(&dword_22C0F9000, v12, OS_LOG_TYPE_FAULT, "FAT_Access_M_FATChainFree Got bad cluster  = %u", buf, 8u);
    }
  }
  return 22;
}

uint64_t FAT_Access_M_SetClustersFatEntryContent(uint64_t a1, unsigned int a2, int a3)
{
  unint64_t v6 = (pthread_mutex_t *)(a1 + 176);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 176));
  int v11 = 0;
  uint64_t FatEntry = FAT_Access_M_GetFatEntry(a1, a2, &v11);
  if (!FatEntry)
  {
    *int v11 = a3;
    if (a2 >= 2 && *(_DWORD *)(a1 + 80) >= a2)
    {
      uint64_t v8 = 0;
      unsigned int v9 = (unsigned char *)(a1 + 280);
      while (((4 * a2) & 0xFFFFE000) != *((void *)v9 - 2))
      {
        ++v8;
        v9 += 144;
        if (v8 == 4) {
          goto LABEL_10;
        }
      }
      if ((v8 & 0xFC) == 0) {
        *unsigned int v9 = 1;
      }
    }
  }
LABEL_10:
  pthread_mutex_unlock(v6);
  return FatEntry;
}

uint64_t FAT_Access_M_BitmapMarkBits(_DWORD *a1, unsigned int a2, int a3, int a4)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  unint64_t v30 = 0;
  unsigned int v29 = 0;
  __int16 v28 = 0;
  if (!a3)
  {
    if (!gbIsLoggerInit) {
      return 22;
    }
    uint64_t v14 = gpsExFatLog;
    if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
      return 22;
    }
    *(_WORD *)long long buf = 0;
    int v11 = "FAT_Access_M_BitmapMarkBits: uCount is 0!\n";
    size_t v12 = v14;
    uint32_t v13 = 2;
    goto LABEL_10;
  }
  if (a2 < 2 || (unsigned int v8 = a1[20], v8 < a2) || (v16 = a2 + a3 - 1, v16 < 2) || v16 > v8)
  {
    if (!gbIsLoggerInit) {
      return 22;
    }
    uint64_t v9 = gpsExFatLog;
    if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
      return 22;
    }
    int v10 = a1[20];
    *(_DWORD *)long long buf = 67109888;
    unsigned int v32 = a2;
    __int16 v33 = 1024;
    int v34 = a3;
    __int16 v35 = 1024;
    int v36 = a4;
    __int16 v37 = 1024;
    int v38 = v10;
    int v11 = "FAT_Access_M_BitmapMarkBits: invalid uCluster (%d) or uCount (%d) bMarkAsUsed %d, max cluster %d\n";
    size_t v12 = v9;
    uint32_t v13 = 26;
LABEL_10:
    _os_log_impl(&dword_22C0F9000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
    return 22;
  }
  unsigned int v17 = a2 - 2;
  int v18 = (int *)FAT_Access_M_BitmapMap((uint64_t)a1, a2 - 2, &v30, (int *)&v29, &v28);
  if (!v18) {
    return v29;
  }
  int v19 = v18;
  int v20 = v17 & 0x1F;
  if ((v17 & 0x1F) == 0)
  {
    unsigned int v24 = v17;
    unsigned int v25 = a3;
    goto LABEL_26;
  }
  if ((v20 + a3) >= 0x20) {
    unsigned int v21 = 32;
  }
  else {
    unsigned int v21 = v20 + a3;
  }
  FAT_Access_M_MarkAllBitGivenRange(v18, v20 + 1, v21, a4);
  unsigned int v22 = v21 - v20;
  unsigned int v23 = v17;
  unsigned int v24 = v17;
  unsigned int v25 = a3 - v22;
  if (a3 != v22)
  {
    unsigned int v24 = v22 + v17;
    if ((unint64_t)++v19 >= v30)
    {
      uint64_t result = FAT_Access_M_SetBitampCacheDirtyBitmap((uint64_t)a1, (uint64_t)v28, v17, v24);
      unsigned int v29 = result;
      if (result) {
        return result;
      }
      int v19 = (int *)FAT_Access_M_BitmapMap((uint64_t)a1, v24, &v30, (int *)&v29, &v28);
      unsigned int v23 = v24;
      if (!v19) {
        return v29;
      }
      goto LABEL_27;
    }
LABEL_26:
    unsigned int v23 = v17;
LABEL_27:
    if (v25 < 0x20)
    {
LABEL_33:
      FAT_Access_M_MarkAllBitGivenRange(v19, 1, v25, a4);
    }
    else
    {
      while (1)
      {
        FAT_Access_M_MarkAllBitGivenRange(v19, 1, 0x20u, a4);
        v25 -= 32;
        if (!v25) {
          break;
        }
        v24 += 32;
        if ((unint64_t)++v19 >= v30)
        {
          uint64_t result = FAT_Access_M_SetBitampCacheDirtyBitmap((uint64_t)a1, (uint64_t)v28, v23, v24);
          unsigned int v29 = result;
          if (result) {
            return result;
          }
          int v19 = (int *)FAT_Access_M_BitmapMap((uint64_t)a1, v24, &v30, (int *)&v29, &v28);
          unsigned int v23 = v24;
          if (!v19) {
            return v29;
          }
        }
        if (v25 <= 0x1F) {
          goto LABEL_33;
        }
      }
    }
  }
  uint64_t result = FAT_Access_M_SetBitampCacheDirtyBitmap((uint64_t)a1, (uint64_t)v28, v23, v24);
  if (!result)
  {
    unsigned int v26 = a1[500];
    if (a4)
    {
      if (v26 > v17 && v26 < v17 + a3) {
        a1[500] = v17 + a3;
      }
      uint64_t result = 0;
      int v27 = a1[19] - a3;
    }
    else
    {
      if (v26 > v17 && v26 < v17 + a3) {
        a1[500] = v17;
      }
      uint64_t result = 0;
      int v27 = a1[19] + a3;
    }
    a1[19] = v27;
  }
  return result;
}

uint64_t FAT_Access_M_AllocateClusters(uint64_t a1, unsigned int a2, unsigned int a3, unsigned char *a4, _DWORD *a5, unsigned int *a6, int *a7, int a8, char a9, unsigned int a10, void *a11, unsigned __int8 a12)
{
  uint64_t v18 = a1;
  int v19 = a11;
  uint64_t v128 = *MEMORY[0x263EF8340];
  uint64_t v120 = 0;
  long long v112 = (pthread_mutex_t *)(a1 + 176);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 176));
  uint64_t v110 = a5;
  v111 = a6;
  *a5 = 0;
  *a6 = 0;
  *a7 = 0;
  if (a3 < 2)
  {
    LODWORD(v31) = 0;
    unsigned int v32 = a3;
    int v116 = 0;
    goto LABEL_59;
  }
  unsigned int v20 = *(_DWORD *)(v18 + 80);
  BOOL v21 = v20 >= a3;
  unsigned int v22 = v20 - a3;
  if (v22 == 0 || !v21)
  {
    LODWORD(v31) = 0;
    int v116 = 0;
    unsigned int v32 = a3;
    goto LABEL_59;
  }
  unint64_t v106 = a7;
  unint64_t v123 = 0;
  *(void *)long long buf = 0;
  unsigned int v122 = 0;
  if (v22 >= a2) {
    unint64_t v23 = a2;
  }
  else {
    unint64_t v23 = v22;
  }
  uint64_t v24 = v18;
  unsigned int v25 = a3 - 1;
  uint64_t v26 = v24;
  int v27 = FAT_Access_M_BitmapMap(v24, a3 - 1, &v123, (int *)&v122, (void ***)buf);
  if (!v27) {
    goto LABEL_36;
  }
  LODWORD(v31) = 0;
  if ((v25 & 0x1F) != 0)
  {
    if (v23)
    {
      int v28 = 1 << (v25 & 0x1F);
      while ((v28 & *(_DWORD *)v27) == 0)
      {
        LODWORD(v31) = v31 + 1;
        v28 *= 2;
        if (v31 >= v23 || !v28)
        {
          if (v28) {
            goto LABEL_37;
          }
          v25 += v31;
          v27 += 4;
          goto LABEL_16;
        }
      }
    }
    goto LABEL_37;
  }
LABEL_16:
  if (v31 < v23 && (unint64_t)v27 >= v123)
  {
    int v27 = FAT_Access_M_BitmapMap(v26, v25, &v123, (int *)&v122, (void ***)buf);
    if (!v27) {
      goto LABEL_36;
    }
  }
  if (v31 < v23)
  {
    unint64_t v29 = v31 + 32;
    if (v29 <= v23 && !*(_DWORD *)v27)
    {
      unsigned int v33 = v25 + 32;
      while (1)
      {
        LODWORD(v31) = v29;
        v27 += 4;
        if (v23 > v29 && (unint64_t)v27 >= v123)
        {
          int v27 = FAT_Access_M_BitmapMap(v26, v33, &v123, (int *)&v122, (void ***)buf);
          if (!v27) {
            break;
          }
        }
        unint64_t v29 = v29 + 32;
        if (v29 <= v23)
        {
          v33 += 32;
          if (!*(_DWORD *)v27) {
            continue;
          }
        }
        goto LABEL_22;
      }
LABEL_36:
      uint64_t v31 = v122;
      if (v122) {
        goto LABEL_253;
      }
      goto LABEL_37;
    }
  }
LABEL_22:
  if (v31 < v23)
  {
    int v30 = 1;
    do
    {
      if ((v30 & *(_DWORD *)v27) != 0) {
        break;
      }
      LODWORD(v31) = v31 + 1;
      if (v31 >= v23) {
        break;
      }
      v30 *= 2;
    }
    while (v30);
  }
LABEL_37:
  unsigned int v34 = a2 - v31;
  if (a2 > v31 && *a4)
  {
    if (a3 < a10)
    {
      if (gbIsLoggerInit)
      {
        __int16 v35 = gpsExFatLog;
        if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 67109376;
          *(_DWORD *)&uint8_t buf[4] = a3;
          *(_WORD *)&uint8_t buf[8] = 1024;
          *(_DWORD *)&buf[10] = a10;
          _os_log_impl(&dword_22C0F9000, v35, OS_LOG_TYPE_ERROR, "FAT_Access_M_AllocateClusters: uFirstCluster %u but uAbsFirstCluster is %u", buf, 0xEu);
        }
      }
      uint64_t v31 = 22;
      goto LABEL_253;
    }
    if (gbIsLoggerInit)
    {
      int v36 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel))
      {
        *(_DWORD *)long long buf = 67109376;
        *(_DWORD *)&uint8_t buf[4] = a3;
        *(_WORD *)&uint8_t buf[8] = 1024;
        *(_DWORD *)&buf[10] = a3 - a10 + 1;
        _os_log_impl(&dword_22C0F9000, v36, (os_log_type_t)gpeExfatToOsLevel, "FAT_Access_M_AllocateClusters: node became fragmented - allocate chain in FAT uFirstCluster %d count %d\n", buf, 0xEu);
      }
    }
    FAT_Access_M_FATChainAlloc(v26, a10, a3 - a10 + 1);
    *a4 = 0;
    int v19 = a11;
  }
  if (v31)
  {
    unsigned int v37 = v31;
    if (!*a4)
    {
      uint64_t v31 = FAT_Access_M_FATChainAlloc(v26, a3, (int)v31 + 1);
      if (v31) {
        goto LABEL_253;
      }
    }
    uint64_t v31 = FAT_Access_M_BitmapMarkBits((_DWORD *)v26, a3 + 1, v37, 1);
    if (v31) {
      goto LABEL_253;
    }
    if (a9)
    {
      int v38 = *(_DWORD *)v26;
      uint64_t v39 = DIROPS_VolumeOffsetForCluster(v26, a3 + 1);
      unint64_t v40 = ZeroFill_Fill(v38, v39, *(void *)(v26 + 56) * v37);
      if (v40)
      {
        uint64_t v31 = v40;
        if (gbIsLoggerInit)
        {
          unsigned int v41 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_22C0F9000, v41, OS_LOG_TYPE_ERROR, "FAT_Access_M_AllocateClusters: Failed to write zero buffer into the device\n", buf, 2u);
          }
        }
        FAT_Access_M_FATChainFree(v26, a3 + 1, 0, a4, v37);
        FAT_Access_M_SetClustersFatEntryContent(v26, a3, -1);
        goto LABEL_253;
      }
    }
    *uint64_t v110 = a3 + 1;
    if (v19)
    {
      uint64_t v31 = FAT_Access_M_CreateClusterInfo(&v120, v19, a3 + 1, v37);
      if (v31) {
        goto LABEL_253;
      }
    }
    LODWORD(v31) = v37;
    unsigned int v32 = v37 + a3;
    int v116 = 1;
    a2 = v34;
  }
  else
  {
    int v116 = 0;
    unsigned int v32 = a3;
  }
  uint64_t v18 = v26;
  a7 = v106;
LABEL_59:
  unsigned int v117 = v32;
  if (!a2)
  {
    int v118 = v31;
    int v42 = 0;
LABEL_197:
    uint64_t v31 = 0;
    unsigned int *v111 = v117;
    *a7 = v118;
    goto LABEL_251;
  }
  int v42 = malloc_type_malloc(0x1000uLL, 0x100004000313F17uLL);
  if (!v42)
  {
    int v118 = v31;
    uint64_t v31 = 12;
    goto LABEL_245;
  }
  int v43 = 0;
  unint64_t v114 = 0;
  int v101 = a3 - a10 + 1;
  unsigned int v103 = a3;
  long long v102 = a4;
  uint64_t v107 = a7;
  while (2)
  {
    int v118 = v31;
    unint64_t v123 = 0;
    *(void *)long long buf = 0;
    uint64_t v44 = *(unsigned int *)(v18 + 2000);
    unsigned int v45 = *(_DWORD *)(v18 + 80) - 2;
    unsigned int v122 = 0;
    bzero(v42, 0x1000uLL);
    if (v44 > v45)
    {
      uint64_t v44 = 0;
      *(_DWORD *)(v18 + 2000) = 0;
    }
    int v119 = 0;
    unsigned int v46 = 0;
    unsigned int v100 = v44 - 1;
    int v47 = 1;
    unsigned int v115 = v44;
    int v48 = a12;
    while (2)
    {
      if (v46 >= a2) {
        goto LABEL_148;
      }
      do
      {
        int v49 = FAT_Access_M_BitmapMap(v18, v44, &v123, (int *)&v122, (void ***)buf);
        if (!v49)
        {
          int v48 = a12;
          goto LABEL_150;
        }
        if ((unint64_t)v49 >= v123 || v44 > v45)
        {
LABEL_72:
          BOOL v51 = 0;
        }
        else
        {
          while (*(_DWORD *)v49 == -1)
          {
            uint64_t v44 = (v44 & 0xFFFFFFE0) + 32;
            v49 += 4;
            if ((unint64_t)v49 >= v123 || v44 > v45) {
              goto LABEL_72;
            }
          }
          int v47 = 1 << v44;
          do
          {
            if (v44 > v45) {
              break;
            }
            if ((v47 & *(_DWORD *)v49) == 0) {
              break;
            }
            uint64_t v44 = (v44 + 1);
            v47 *= 2;
          }
          while (v47);
          BOOL v51 = v47 != 0;
          if (v47) {
            continue;
          }
        }
        if (v44 > v45)
        {
          if (v119)
          {
            if (gbIsLoggerInit)
            {
              unint64_t v66 = gpsExFatLog;
              if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)uint64_t v121 = 0;
                _os_log_impl(&dword_22C0F9000, v66, OS_LOG_TYPE_ERROR, "FAT_Access_M_BitmapFindFree: bitmap is full\n", v121, 2u);
              }
            }
            int v48 = a12;
LABEL_148:
            a3 = v103;
            a4 = v102;
            a7 = v107;
            goto LABEL_151;
          }
          uint64_t v44 = 0;
          int v119 = 1;
          unsigned int v45 = v115;
        }
      }
      while (!v51);
      uint64_t v108 = v42;
      if (v44 > v45) {
        goto LABEL_87;
      }
      int v104 = v43;
      uint64_t v113 = v18;
      unsigned int v53 = 0;
      uint64_t v52 = v44;
      int v48 = a12;
LABEL_92:
      if ((*(_DWORD *)v49 & v47) != 0)
      {
        BOOL v61 = 0;
LABEL_131:
        if (v53)
        {
          uint64_t v62 = 0;
          unsigned int v63 = v44 + 2;
          while (1)
          {
            uint64_t v64 = &v108[v62];
            unsigned int v65 = v108[v62 + 1];
            if (v65 < v53 || v65 == v53 && v108[v62] > v63) {
              break;
            }
            v62 += 2;
            if (v62 == 1024) {
              goto LABEL_137;
            }
          }
          if (v62 != 1022)
          {
            memmove(&v108[v62 + 2], v64, (4088 - v62 * 4) & 0x7FFFFFFF8);
            int v48 = a12;
          }
          *uint64_t v64 = v63;
          v64[1] = v53;
          if (!v61) {
            goto LABEL_142;
          }
        }
        else
        {
LABEL_137:
          if (!v61)
          {
LABEL_142:
            uint64_t v18 = v113;
            *(_DWORD *)(v113 + 2000) = v52;
            int v43 = v104;
LABEL_89:
            uint64_t v44 = v52;
            int v42 = v108;
            if (v46 == a2) {
              goto LABEL_148;
            }
            continue;
          }
        }
        uint64_t v18 = v113;
        int v42 = v108;
        int v43 = v104;
LABEL_87:
        *(_DWORD *)(v18 + 2000) = 0;
        FAT_Access_M_FindFirstFreeCluster(v18);
        int v48 = a12;
        if (v119) {
          goto LABEL_148;
        }
        uint64_t v52 = 0;
        int v119 = 1;
        unsigned int v45 = v100;
        goto LABEL_89;
      }
      break;
    }
    ++v53;
    ++v46;
    uint64_t v52 = (v52 + 1);
    v47 *= 2;
    if (v47) {
      goto LABEL_123;
    }
    v49 += 4;
    while (1)
    {
      if ((unint64_t)v49 >= v123)
      {
        char v55 = 0;
LABEL_105:
        char v56 = 0;
        goto LABEL_108;
      }
      if ((unint64_t)v52 + 32 > v45)
      {
        char v56 = 0;
        char v55 = 1;
      }
      else
      {
        char v54 = v48 ^ 1;
        char v55 = 1;
        if (v46 < a2) {
          char v54 = 0;
        }
        if ((v54 & 1) != 0 || v53 >= a2) {
          goto LABEL_105;
        }
        if (!*(_DWORD *)v49 && (unint64_t)v46 + 32 < a2)
        {
          uint64_t v52 = (v52 + 32);
          v46 += 32;
          v53 += 32;
          v49 += 4;
          continue;
        }
        char v55 = 1;
        char v56 = 1;
      }
LABEL_108:
      int v57 = v48 ^ 1;
      if (v46 < a2) {
        int v57 = 0;
      }
      int v58 = v53 >= a2 ? 1 : v57;
      if ((v55 & 1) == 0 && (v58 & 1) == 0 && v52 < v45)
      {
        int v49 = FAT_Access_M_BitmapMap(v113, v52, &v123, (int *)&v122, (void ***)buf);
        int v48 = a12;
        if (!v49) {
          break;
        }
      }
      if ((v56 & 1) == 0)
      {
        int v59 = (unint64_t)v52 + 32 > v45 ? 1 : v58;
        if (v59 != 1) {
          continue;
        }
      }
      int v47 = 1;
LABEL_123:
      if (v46 < a2) {
        int v60 = 1;
      }
      else {
        int v60 = v48;
      }
      BOOL v61 = v52 > v45;
      if (v60 != 1 || v53 >= a2 || v52 > v45) {
        goto LABEL_131;
      }
      goto LABEL_92;
    }
    uint64_t v18 = v113;
    int v42 = v108;
    int v43 = v104;
LABEL_150:
    uint64_t v31 = v122;
    a3 = v103;
    a4 = v102;
    a7 = v107;
    if (v122)
    {
LABEL_204:
      if (v31 != 28 || !a8 || !v48 || !HIDWORD(v114)) {
        goto LABEL_245;
      }
      if (*a4)
      {
        if (*(_DWORD *)(v18 + 80) == a3)
        {
          if (a3 < a10)
          {
            if (gbIsLoggerInit)
            {
              int v86 = gpsExFatLog;
              if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 136315650;
                *(void *)&uint8_t buf[4] = "FAT_Access_M_AllocateClusters";
                *(_WORD *)&buf[12] = 1024;
                unsigned int v125 = a3;
                __int16 v126 = 1024;
                unsigned int v127 = a10;
                _os_log_impl(&dword_22C0F9000, v86, OS_LOG_TYPE_ERROR, "%s: uLastKnownCluster %u but uAbsFirstCluster is %u", buf, 0x18u);
              }
            }
            uint64_t v31 = 22;
            goto LABEL_251;
          }
          if (gbIsLoggerInit)
          {
            long long v92 = gpsExFatLog;
            if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel))
            {
              *(_DWORD *)long long buf = 136315650;
              *(void *)&uint8_t buf[4] = "FAT_Access_M_AllocateClusters";
              *(_WORD *)&buf[12] = 1024;
              unsigned int v125 = a3;
              __int16 v126 = 1024;
              unsigned int v127 = v101;
              _os_log_impl(&dword_22C0F9000, v92, (os_log_type_t)gpeExfatToOsLevel, "%s: node became fragmented - uFirstCluster %d count %d\n", buf, 0x18u);
            }
          }
          FAT_Access_M_FATChainAlloc(v18, a10, v101);
        }
        else
        {
          unsigned int v91 = v114;
          unsigned int v90 = HIDWORD(v114);
          if (HIDWORD(v114) >= a2)
          {
LABEL_243:
            uint64_t v93 = FAT_Access_M_BitmapMarkBits((_DWORD *)v18, v91, v90, 1);
            if (!v93)
            {
              if (!v116) {
                *uint64_t v110 = v91;
              }
              if (v117 >= 2 && v117 <= *(_DWORD *)(v18 + 80)) {
                FAT_Access_M_SetClustersFatEntryContent(v18, v117, v91);
              }
              unsigned int v117 = v91 + v90 - 1;
              v118 += v90;
              if (a9
                && (int v95 = *(_DWORD *)v18,
                    uint64_t v96 = DIROPS_VolumeOffsetForCluster(v18, v91),
                    unint64_t v97 = ZeroFill_Fill(v95, v96, *(void *)(v18 + 56) * v90),
                    v97))
              {
                uint64_t v31 = v97;
                uint64_t v98 = v18;
                if (gbIsLoggerInit)
                {
                  long long v99 = gpsExFatLog;
                  if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)long long buf = 0;
                    _os_log_impl(&dword_22C0F9000, v99, OS_LOG_TYPE_ERROR, "FAT_Access_M_AllocateClusters: (2) Failed to write zero buffer into the device\n", buf, 2u);
                  }
                }
                uint64_t v18 = v98;
                FAT_Access_M_FATChainFree(v98, *v110, 0, a4, v90);
                if (a3) {
                  FAT_Access_M_SetClustersFatEntryContent(v98, a3, -1);
                }
              }
              else
              {
                ++v116;
                uint64_t v31 = 28;
              }
              goto LABEL_245;
            }
LABEL_244:
            uint64_t v31 = v93;
            goto LABEL_245;
          }
        }
        *a4 = 0;
      }
      unsigned int v91 = v114;
      unsigned int v90 = HIDWORD(v114);
      uint64_t v93 = FAT_Access_M_FATChainAlloc(v18, v114, SHIDWORD(v114));
      if (v93) {
        goto LABEL_244;
      }
      goto LABEL_243;
    }
LABEL_151:
    if (!v42[1]) {
      goto LABEL_219;
    }
    if (v119)
    {
      ++v43;
      LODWORD(v31) = v118;
      if (v43 > 1u)
      {
LABEL_219:
        uint64_t v31 = 28;
        goto LABEL_204;
      }
    }
    else
    {
      LODWORD(v31) = v118;
    }
    int v105 = v43;
    uint64_t v67 = 0;
LABEL_157:
    int v68 = &v42[v67];
    unsigned int v69 = v42[v67 + 1];
    if (!v69)
    {
LABEL_195:
      int v43 = v105;
      continue;
    }
    break;
  }
  unsigned int v70 = *v68;
  if (*v68 >= 2)
  {
    unsigned int v71 = *(_DWORD *)(v18 + 80);
    if (v70 <= v71)
    {
      int v72 = v42;
      if (v69 >= a2) {
        uint64_t v73 = a2;
      }
      else {
        uint64_t v73 = v69;
      }
      if (v69 < a2 && v48 != 0)
      {
        unsigned int v77 = v114;
        unsigned int v76 = HIDWORD(v114);
        if (v69 > HIDWORD(v114))
        {
          unsigned int v77 = *v68;
          unsigned int v76 = v69;
        }
        unint64_t v114 = __PAIR64__(v76, v77);
LABEL_194:
        int v42 = v72;
        v67 += 2;
        if (v67 == 1024) {
          goto LABEL_195;
        }
        goto LABEL_157;
      }
      int v118 = v31;
      if (*a4)
      {
        if (v71 == a3)
        {
          if (a3 < a10)
          {
            if (gbIsLoggerInit)
            {
              __int16 v89 = gpsExFatLog;
              int v42 = v72;
              if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 136315650;
                *(void *)&uint8_t buf[4] = "FAT_Access_M_AllocateClusters";
                *(_WORD *)&buf[12] = 1024;
                unsigned int v125 = a3;
                __int16 v126 = 1024;
                unsigned int v127 = a10;
                _os_log_impl(&dword_22C0F9000, v89, OS_LOG_TYPE_ERROR, "%s: uLastKnownCluster %u but uAbsFirstCluster is %u", buf, 0x18u);
              }
              uint64_t v31 = 22;
            }
            else
            {
              uint64_t v31 = 22;
              int v42 = v72;
            }
            goto LABEL_252;
          }
          if (gbIsLoggerInit)
          {
            long long v75 = gpsExFatLog;
            if (os_log_type_enabled((os_log_t)gpsExFatLog, (os_log_type_t)gpeExfatToOsLevel))
            {
              *(_DWORD *)long long buf = 136315650;
              *(void *)&uint8_t buf[4] = "FAT_Access_M_AllocateClusters";
              *(_WORD *)&buf[12] = 1024;
              unsigned int v125 = a3;
              __int16 v126 = 1024;
              unsigned int v127 = v101;
              _os_log_impl(&dword_22C0F9000, v75, (os_log_type_t)gpeExfatToOsLevel, "%s: node became fragmented - uFirstCluster %d count %d\n", buf, 0x18u);
            }
          }
          FAT_Access_M_FATChainAlloc(v18, a10, v101);
          *a4 = 0;
          unsigned int v70 = *v68;
          goto LABEL_180;
        }
        if (v69 < a2)
        {
          *a4 = 0;
          goto LABEL_180;
        }
      }
      else
      {
LABEL_180:
        uint64_t v78 = FAT_Access_M_FATChainAlloc(v18, v70, v73);
        if (v78) {
          goto LABEL_203;
        }
        unsigned int v70 = *v68;
      }
      uint64_t v78 = FAT_Access_M_BitmapMarkBits((_DWORD *)v18, v70, v73, 1);
      if (v78)
      {
LABEL_203:
        uint64_t v31 = v78;
        int v42 = v72;
        int v48 = a12;
        goto LABEL_204;
      }
      unsigned int v79 = v117;
      if (!v116)
      {
        *uint64_t v110 = *v68;
        unsigned int v79 = v117;
      }
      if (v79 >= 2 && v117 <= *(_DWORD *)(v18 + 80)) {
        FAT_Access_M_SetClustersFatEntryContent(v18, v117, *v68);
      }
      unsigned int v117 = v73 + *v68 - 1;
      v118 += v73;
      if (a11)
      {
        uint64_t v80 = FAT_Access_M_CreateClusterInfo(&v120, a11, *v68, v73);
        if (v80)
        {
          uint64_t v31 = v80;
LABEL_229:
          int v42 = v72;
          goto LABEL_245;
        }
      }
      if (a9)
      {
        int v81 = *(_DWORD *)v18;
        uint64_t v82 = DIROPS_VolumeOffsetForCluster(v18, *v68);
        unint64_t v83 = ZeroFill_Fill(v81, v82, *(void *)(v18 + 56) * v73);
        if (v83)
        {
          uint64_t v31 = v83;
          uint64_t v87 = v18;
          if (gbIsLoggerInit)
          {
            unint64_t v88 = gpsExFatLog;
            if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl(&dword_22C0F9000, v88, OS_LOG_TYPE_ERROR, "FAT_Access_M_AllocateClusters: Failed to write zero buffer into the device\n", buf, 2u);
            }
          }
          uint64_t v18 = v87;
          FAT_Access_M_FATChainFree(v87, *v110, 0, a4, v73);
          if (a3) {
            FAT_Access_M_SetClustersFatEntryContent(v87, a3, -1);
          }
          goto LABEL_229;
        }
      }
      a2 -= v73;
      if (!a2)
      {
        int v42 = v72;
        goto LABEL_197;
      }
      int v48 = a12;
      ++v116;
      LODWORD(v31) = v118;
      goto LABEL_194;
    }
  }
  int v118 = v31;
  if (gbIsLoggerInit)
  {
    uint64_t v84 = v18;
    __int16 v85 = gpsExFatLog;
    if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_22C0F9000, v85, OS_LOG_TYPE_FAULT, "FAT_Access_M_AllocateClusters: invalid extent start cluster\n", buf, 2u);
    }
    uint64_t v31 = 22;
    uint64_t v18 = v84;
  }
  else
  {
    uint64_t v31 = 22;
  }
LABEL_245:
  if (v116)
  {
    if (v31 == 28 && a8)
    {
      unsigned int *v111 = v117;
      *a7 = v118;
      uint64_t v31 = 28;
    }
    else
    {
      FAT_Access_M_FATChainFree(v18, *v110, 0, a4, v118);
      *a7 = 0;
      unsigned int *v111 = 0;
      if (a3) {
        FAT_Access_M_SetClustersFatEntryContent(v18, a3, -1);
      }
    }
  }
LABEL_251:
  if (v42) {
LABEL_252:
  }
    free(v42);
LABEL_253:
  pthread_mutex_unlock(v112);
  return v31;
}

uint64_t FAT_Access_M_FATChainAlloc(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (!a3) {
    return 0;
  }
  int v3 = a3;
  unsigned int v4 = a2;
  if (a2 >= 2)
  {
    unsigned int v6 = *(_DWORD *)(a1 + 80);
    if (v6 >= a2)
    {
      unsigned int v9 = a2 + a3 - 1;
      if (v9 >= 2 && v9 <= v6)
      {
        while (v3)
        {
          if (--v3) {
            int v10 = v4 + 1;
          }
          else {
            int v10 = -1;
          }
          uint64_t v11 = FAT_Access_M_SetClustersFatEntryContent(a1, v4++, v10);
          if (v11) {
            return v11;
          }
        }
        return 0;
      }
    }
  }
  if (!gbIsLoggerInit) {
    return 14;
  }
  unint64_t v7 = gpsExFatLog;
  if (!os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR)) {
    return 14;
  }
  v13[0] = 67109376;
  v13[1] = v4;
  __int16 v14 = 1024;
  int v15 = v3;
  uint64_t v8 = 14;
  _os_log_impl(&dword_22C0F9000, v7, OS_LOG_TYPE_ERROR, "FAT_Access_M_FATChainAlloc: start=%u, count=%u\n", (uint8_t *)v13, 0xEu);
  return v8;
}

uint64_t FAT_Access_M_CreateClusterInfo(uint64_t *a1, void *a2, int a3, int a4)
{
  uint64_t v8 = *a1;
  unsigned int v9 = malloc_type_malloc(0x10uLL, 0x10200405730B0C9uLL);
  if (v8)
  {
    *(void *)(*a1 + 8) = v9;
    uint64_t v10 = *(void *)(*a1 + 8);
    if (v10)
    {
      *a1 = v10;
LABEL_6:
      uint64_t result = 0;
      *(_DWORD *)uint64_t v10 = a3;
      *(_DWORD *)(v10 + 4) = a4;
      *(void *)(v10 + 8) = 0;
      return result;
    }
  }
  else
  {
    *a1 = (uint64_t)v9;
    if (v9)
    {
      *a2 = v9;
      uint64_t v10 = *a1;
      goto LABEL_6;
    }
  }
  return 12;
}

uint64_t FAT_Access_M_TruncateLastClusters(uint64_t a1, unsigned int a2, unsigned char *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v17 = 0;
  uint64_t v6 = *(void *)(a1 + 216);
  int v7 = *(_DWORD *)(a1 + 436);
  unsigned int v8 = *(_DWORD *)(a1 + 428);
  pthread_mutex_lock((pthread_mutex_t *)(v6 + 176));
  if (a2 && *(_DWORD *)(a1 + 436) >= a2)
  {
    unsigned int v13 = v7 - a2;
    if (v7 == a2)
    {
      uint64_t v11 = FAT_Access_M_FATChainFree(v6, *(unsigned int *)(a1 + 428), 0, a3, a2);
      if (!v11)
      {
        *(_DWORD *)(a1 + 428) = 0;
        *(void *)(a1 + 432) = 0;
      }
    }
    else
    {
      if (v8 >= 2)
      {
        while (v8 <= *(_DWORD *)(v6 + 80))
        {
          if (*a3)
          {
            unsigned int v14 = *(_DWORD *)(a1 + 436);
          }
          else
          {
            unsigned int v14 = FAT_Access_M_ContiguousClustersInChain(v6, v8, (unsigned int *)&v17, (_DWORD *)&v17 + 1);
            uint64_t v11 = HIDWORD(v17);
            if (HIDWORD(v17)) {
              goto LABEL_7;
            }
          }
          unsigned int v15 = v13 - v14;
          if (v13 <= v14)
          {
            uint64_t v16 = v13 + v8 - 1;
            *(_DWORD *)(a1 + 432) = v16;
            *(_DWORD *)(a1 + 436) -= a2;
            uint64_t v11 = FAT_Access_M_FATChainFree(v6, v16, 1, a3, a2);
            goto LABEL_7;
          }
          unsigned int v8 = v17;
          v13 -= v14;
          if (v17 <= 1)
          {
            if (v15) {
              goto LABEL_17;
            }
LABEL_21:
            uint64_t v11 = 0;
            goto LABEL_7;
          }
        }
        if (v13) {
          goto LABEL_17;
        }
        goto LABEL_21;
      }
LABEL_17:
      uint64_t v11 = 1;
    }
  }
  else
  {
    if (gbIsLoggerInit)
    {
      unsigned int v9 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_FAULT))
      {
        int v10 = *(_DWORD *)(a1 + 436);
        *(_DWORD *)long long buf = 67109376;
        unsigned int v19 = a2;
        __int16 v20 = 1024;
        int v21 = v10;
        _os_log_impl(&dword_22C0F9000, v9, OS_LOG_TYPE_FAULT, "FAT_Access_M_TruncateLastClusters: uClusToTrunc %u uClusterChainLength %u\n", buf, 0xEu);
      }
    }
    uint64_t v11 = 5;
  }
LABEL_7:
  pthread_mutex_unlock((pthread_mutex_t *)(v6 + 176));
  return v11;
}

uint64_t FAT_Access_M_FATInit(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  unsigned int v2 = (pthread_mutex_t *)(a1 + 176);
  bzero((void *)(a1 + 176), 0x510uLL);
  *(unsigned char *)(a1 + 248) = 0;
  v8.__sig = 0;
  *(void *)v8.__opaque = 0;
  pthread_mutexattr_init(&v8);
  pthread_mutexattr_settype(&v8, 2);
  pthread_mutex_init(v2, &v8);
  pthread_mutex_init((pthread_mutex_t *)(a1 + 832), &v8);
  pthread_mutexattr_destroy(&v8);
  uint64_t v3 = -576;
  while (1)
  {
    uint64_t v4 = a1 + v3;
    *(void *)(v4 + 848) = 0;
    *(void *)(v4 + 840) = *(void *)(a1 + 16) + *(void *)(a1 + 8);
    *(_WORD *)(v4 + 856) = 0;
    unint64_t v5 = malloc_type_malloc(0x2000uLL, 0x4E3783CBuLL);
    *(void *)(v4 + 832) = v5;
    if (!v5) {
      break;
    }
    *(void *)(v4 + 1472) = 0;
    *(void *)(v4 + 1488) = 0;
    *(void *)(v4 + 1480) = *(void *)(a1 + 16) + *(void *)(a1 + 8);
    *(_WORD *)(v4 + 1496) = 0;
    uint64_t v6 = malloc_type_malloc(0x2000uLL, 0xFF44BB29uLL);
    *(void *)(v4 + 1472) = v6;
    if (!v6) {
      break;
    }
    pthread_mutex_init((pthread_mutex_t *)(a1 + v3 + 1552), 0);
    pthread_cond_init((pthread_cond_t *)(a1 + v3 + 1504), 0);
    v3 += 144;
    if (!v3) {
      return 0;
    }
  }
  return 12;
}

uint64_t FAT_Access_M_FATFini(uint64_t a1)
{
  *(unsigned char *)(a1 + 248) = 0;
  uint64_t v2 = -576;
  do
  {
    uint64_t v3 = (void *)(a1 + v2);
    uint64_t v4 = *(void **)(a1 + v2 + 832);
    if (v4) {
      free(v4);
    }
    v3[104] = 0;
    v3[106] = 0;
    uint64_t v5 = *(void *)(a1 + 16) + *(void *)(a1 + 8);
    v3[105] = v5;
    uint64_t v6 = (void *)v3[184];
    if (v6)
    {
      free(v6);
      pthread_mutex_destroy((pthread_mutex_t *)(a1 + v2 + 1552));
      pthread_cond_destroy((pthread_cond_t *)(a1 + v2 + 1504));
      uint64_t v5 = *(void *)(a1 + 16) + *(void *)(a1 + 8);
    }
    v3[184] = 0;
    uint64_t v7 = a1 + v2;
    *(void *)(v7 + 1488) = 0;
    *(void *)(v7 + 1480) = v5;
    v2 += 144;
  }
  while (v2);
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 176));

  return pthread_mutex_destroy((pthread_mutex_t *)(a1 + 832));
}

void FAT_Access_M_BitmapCacheFini(uint64_t a1)
{
  for (uint64_t i = 0; i != 256; i += 32)
  {
    uint64_t v3 = a1 + i;
    uint64_t v4 = *(void **)(a1 + i + 1488);
    if (v4) {
      free(v4);
    }
    *(void *)(v3 + 1488) = 0;
    *(_DWORD *)(v3 + 1512) = 0;
    *(void *)(v3 + 1504) = 0;
    uint64_t v5 = *(void *)(a1 + 1480);
    *(void *)(v3 + 1496) = v5;
    uint64_t v6 = *(void **)(v3 + 1744);
    if (v6)
    {
      free(v6);
      uint64_t v5 = *(void *)(a1 + 1480);
    }
    *(void *)(v3 + 1744) = 0;
    uint64_t v7 = a1 + i;
    *(_DWORD *)(v7 + 1768) = 0;
    *(void *)(v7 + 1760) = 0;
    *(void *)(v7 + 1752) = v5;
  }
}

uint64_t FAT_Access_M_BitmapCacheInit(void *a1)
{
  uint64_t v2 = 0;
  a1[184] = 0;
  while (1)
  {
    uint64_t v3 = &a1[v2];
    v3[188] = 0;
    v3[187] = a1[185];
    *((_DWORD *)v3 + 378) = 0;
    uint64_t v4 = malloc_type_malloc(8 * a1[6], 0x933B44BAuLL);
    v3[186] = v4;
    if (!v4) {
      break;
    }
    memset(v4, 255, 8 * a1[6]);
    v3[220] = 0;
    v3[219] = a1[185];
    *((_DWORD *)v3 + 442) = 0;
    uint64_t v5 = malloc_type_malloc(8 * a1[6], 0xE41339E0uLL);
    v3[218] = v5;
    if (!v5) {
      break;
    }
    memset(v5, 255, 8 * a1[6]);
    v2 += 4;
    if (v2 == 32) {
      return 0;
    }
  }
  return 12;
}

uint64_t FAT_Access_M_FindFirstFreeCluster(uint64_t a1)
{
  unsigned int v10 = 0;
  uint64_t v2 = (pthread_mutex_t *)(a1 + 176);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 176));
  unint64_t v8 = 0;
  uint64_t v9 = 0;
  unsigned int v3 = *(_DWORD *)(a1 + 80) - 2;
  if (*(_DWORD *)(a1 + 2000) <= v3) {
    unsigned int v4 = *(_DWORD *)(a1 + 2000);
  }
  else {
    unsigned int v4 = 0;
  }
  uint64_t v5 = FAT_Access_M_BitmapMap(a1, v4, &v8, (int *)&v10, &v9);
  if (v5)
  {
    int v6 = 1 << v4;
    do
    {
      if ((*(_DWORD *)v5 & v6) == 0) {
        break;
      }
      ++v4;
      v6 *= 2;
      if (!v6)
      {
        v5 += 4;
        if (v4 >= v3 || (unint64_t)v5 < v8)
        {
          unsigned int v4 = 0;
          unsigned int v3 = *(_DWORD *)(a1 + 2000);
        }
        else
        {
          uint64_t v5 = FAT_Access_M_BitmapMap(a1, v4, &v8, (int *)&v10, &v9);
          if (!v5) {
            goto LABEL_16;
          }
        }
        int v6 = 1;
      }
    }
    while (v4 <= v3);
    *(_DWORD *)(a1 + 2000) = v4;
  }
LABEL_16:
  pthread_mutex_unlock(v2);
  return v10;
}

uint64_t FAT_Access_M_FlushPartialBitmapCache(uint64_t a1, uint64_t a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  int v2 = *(_DWORD *)(a2 + 24);
  if (v2 && *(void *)(a2 + 8) != *(void *)(a1 + 1480))
  {
    unsigned int v7 = 0;
    uint64_t v8 = *(void *)(a1 + 2040);
    while (v7 <= 7)
    {
      unsigned int v9 = v7 - 1;
      do
        unsigned int v7 = v9++;
      while (v9 <= 7 && ((1 << v9) & v2) == 0);
      if (v9 == 8) {
        break;
      }
      unint64_t v10 = *(void *)(a1 + 48);
      do
        ++v7;
      while (v7 <= 7 && ((1 << v7) & v2) != 0);
      uint64_t v11 = *(void *)(a2 + 8);
      unint64_t v12 = *(void *)(a1 + 1480);
      if (v11 + 8 * v10 <= v12) {
        size_t v13 = 8 * v10;
      }
      else {
        size_t v13 = (v10 - v11 + v12 - 1) / v10 * v10;
      }
      off_t v14 = *(void *)(a2 + 8) + DIROPS_VolumeOffsetForCluster(a1, *(_DWORD *)(v8 + 428));
      uint64_t v15 = metaWrite((int *)a1, *(void **)a2, v14, v13);
      if (v15)
      {
        uint64_t v5 = v15;
        if (gbIsLoggerInit)
        {
          uint64_t v16 = gpsExFatLog;
          if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
          {
            int v17 = 136315906;
            uint64_t v18 = "FAT_Access_M_FlushPartialBitmapCache";
            __int16 v19 = 1024;
            int v20 = v5;
            __int16 v21 = 2048;
            off_t v22 = v14;
            __int16 v23 = 2048;
            size_t v24 = v13;
            _os_log_impl(&dword_22C0F9000, v16, OS_LOG_TYPE_ERROR, "%s: failed to write with error = %d, offset %llu, size %llu.", (uint8_t *)&v17, 0x26u);
          }
        }
        return v5;
      }
    }
  }
  return 0;
}

void FAT_Access_M_MarkAllBitGivenRange(int *a1, int a2, unsigned int a3, int a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (a3 >= 0x21)
  {
    if (gbIsLoggerInit)
    {
      uint64_t v8 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_FAULT))
      {
        int v17 = 67109376;
        int v18 = a2;
        __int16 v19 = 1024;
        unsigned int v20 = a3;
        _os_log_impl(&dword_22C0F9000, v8, OS_LOG_TYPE_FAULT, "FAT_Access_M_MarkAllBitGivenRange: got invalid index set [%d,%d]!\n", (uint8_t *)&v17, 0xEu);
      }
    }
  }
  if (a3 - a2 == 31) {
    int v9 = -1;
  }
  else {
    int v9 = ~(-1 << (a3 - a2 + 1)) << (a2 - 1);
  }
  int v10 = *a1;
  int v11 = *a1 & v9;
  if (a4)
  {
    if (v11) {
      BOOL v12 = gbIsLoggerInit == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (!v12)
    {
      size_t v13 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        int v17 = 67109376;
        int v18 = v10;
        __int16 v19 = 1024;
        unsigned int v20 = v9;
        _os_log_impl(&dword_22C0F9000, v13, OS_LOG_TYPE_ERROR, "FAT_Access_M_MarkAllBitGivenRange: some bits in the word are already set! (0x%x), uMask (0x%x)\n", (uint8_t *)&v17, 0xEu);
        int v10 = *a1;
      }
    }
    int v14 = v10 | v9;
  }
  else
  {
    if (v11 != v9 && gbIsLoggerInit != 0)
    {
      uint64_t v16 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        int v17 = 67109376;
        int v18 = v10;
        __int16 v19 = 1024;
        unsigned int v20 = v9;
        _os_log_impl(&dword_22C0F9000, v16, OS_LOG_TYPE_ERROR, "FAT_Access_M_MarkAllBitGivenRange: some bits in the word are already clear! (0x%x), uMask (0x%x)\n", (uint8_t *)&v17, 0xEu);
        int v10 = *a1;
      }
    }
    int v14 = v10 & ~v9;
  }
  *a1 = v14;
}

uint64_t FAT_Access_M_SetBitampCacheDirtyBitmap(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int v6 = *(_DWORD *)(a1 + 80);
  if (v6 - 2 >= a3 && v6 - 2 >= a4)
  {
    uint64_t result = 0;
    uint64_t v11 = *(void *)(a2 + 8);
    unint64_t v12 = *(void *)(a1 + 48);
    unint64_t v13 = ((unint64_t)(a3 >> 3) - v11) / v12;
    unint64_t v14 = ((unint64_t)(a4 >> 3) - v11) / v12 - v13 + 1;
    int v15 = ~(-1 << v14) << v13;
    if (v14 == 32) {
      int v16 = -1;
    }
    else {
      int v16 = v15;
    }
    *(_DWORD *)(a2 + 24) |= v16;
  }
  else
  {
    if (gbIsLoggerInit)
    {
      uint64_t v8 = gpsExFatLog;
      if (os_log_type_enabled((os_log_t)gpsExFatLog, OS_LOG_TYPE_ERROR))
      {
        v17[0] = 67109632;
        v17[1] = a3;
        __int16 v18 = 1024;
        unsigned int v19 = a4;
        __int16 v20 = 1024;
        int v21 = v6;
        _os_log_impl(&dword_22C0F9000, v8, OS_LOG_TYPE_ERROR, "FAT_Access_M_SetBitampCacheDirtyBitmap: trying to mark an invalid cluster range [%u, %u, max = %u]\n", (uint8_t *)v17, 0x14u);
      }
    }
    return 22;
  }
  return result;
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x270ED7AD8](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x270ED7AE0](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7AE8](c, data, *(void *)&len);
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return MEMORY[0x270ED8EF0](*(void *)&__clock_id, __tp);
}

double difftime(time_t a1, time_t a2)
{
  MEMORY[0x270ED9180](a1, a2);
  return result;
}

void free(void *a1)
{
}

tm *__cdecl gmtime(const time_t *a1)
{
  return (tm *)MEMORY[0x270ED9DD8](a1);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x270ED9ED8](*(void *)&a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
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

time_t mktime(tm *a1)
{
  return MEMORY[0x270EDA588](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x270EDAC68](a1, a2, a3, a4, __argv, __envp);
}

int posix_spawn_file_actions_addinherit_np(posix_spawn_file_actions_t *a1, int a2)
{
  return MEMORY[0x270EDAC88](a1, *(void *)&a2);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x270EDAC98](a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x270EDACA0](a1);
}

int posix_spawnattr_destroy(posix_spawnattr_t *a1)
{
  return MEMORY[0x270EDACA8](a1);
}

int posix_spawnattr_init(posix_spawnattr_t *a1)
{
  return MEMORY[0x270EDACB8](a1);
}

int posix_spawnattr_setflags(posix_spawnattr_t *a1, __int16 a2)
{
  return MEMORY[0x270EDACC8](a1, a2);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x270EDAD10](*(void *)&__fd, __buf, __nbyte, a4);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE50](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE58](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x270EDAE60](a1, a2);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x270EDAE78](a1, a2, a3);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF50](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x270EDAF78](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x270EDAF80](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x270EDAF98](a1, *(void *)&a2);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFC8](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x270EDAFD0](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFD8](a1);
}

int pthread_rwlock_trywrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFE8](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF0](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF8](a1);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x270EDB0A0](*(void *)&__fd, __buf, __nbyte, a4);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

int rand(void)
{
  return MEMORY[0x270EDB0D8]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x270EDB5C0](__dst, __src);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x270EDB658](__s1, __n);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB6A0](__s1, __s2);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x270EDBB48](*(void *)&a1, a2, *(void *)&a3);
}