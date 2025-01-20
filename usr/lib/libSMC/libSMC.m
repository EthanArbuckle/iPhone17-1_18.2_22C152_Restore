uint64_t SMCReadKey(mach_port_t *a1, int a2, void *a3, unsigned int a4)
{
  char v5;
  void v10[2];
  uint64_t v11;

  v5 = -1;
  if (a1 && a2 && a3)
  {
    v10[0] = 0;
    v10[1] = 0;
    v11 = 0;
    if (SMCGetKeyInfo(a1, a2, (uint64_t)v10))
    {
      return -1;
    }
    else if (HIDWORD(v11) <= a4)
    {
      return (char)SMCReadKeyWithKnownSize(a1, a2, HIDWORD(v11), a3);
    }
    else
    {
      return -5;
    }
  }
  return v5;
}

uint64_t SMCReadKeyAsNumericWithKnownKeyInfo(uint64_t a1, uint64_t a2, uint64_t a3, double *a4)
{
  uint64_t v4 = a1;
  v12[1] = *MEMORY[0x263EF8340];
  LOBYTE(a1) = -1;
  if (v4)
  {
    if (a3)
    {
      if (a4)
      {
        MEMORY[0x270FA5388](255);
        v8 = (char *)v12 - ((v7 + 15) & 0x1FFFFFFF0);
        LODWORD(a1) = SMCReadKeyWithKnownSize(v10, v9, *(_DWORD *)(a3 + 20), v8);
        if (!a1) {
          LOBYTE(a1) = SMCParseBytesForNumeric((unsigned __int8 *)v8, *(_DWORD *)(a3 + 20), a4, (int *)(a3 + 8));
        }
      }
    }
  }
  return (char)a1;
}

uint64_t SMCReadKeyWithKnownSize(mach_port_t *a1, int a2, unsigned int a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  char v4 = -1;
  if (a1 && a2 && a4)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    int v23 = 0;
    memset(v8, 0, sizeof(v8));
    long long v9 = 0u;
    memset(v10, 0, sizeof(v10));
    uint64_t v11 = 0;
    int inputStruct = a2;
    DWORD2(v14) = a3;
    BYTE6(v15) = 5;
    if (SMCKextCall(*a1, &inputStruct, v8))
    {
      return -2;
    }
    else if (BYTE8(v9))
    {
      return -3;
    }
    else
    {
      memcpy(a4, v10, a3);
      return 0;
    }
  }
  return v4;
}

uint64_t SMCGetKeyInfo(mach_port_t *a1, int a2, uint64_t a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  char v3 = -1;
  if (a1 && a2 && a3)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    int v31 = 0;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v19 = 0;
    int inputStruct = a2;
    BYTE6(v23) = 9;
    if (SMCKextCall(*a1, &inputStruct, &v9))
    {
      return -2;
    }
    else if (BYTE8(v11))
    {
      return -3;
    }
    else
    {
      signed int v5 = v11;
      *(_DWORD *)(a3 + 20) = HIDWORD(v10);
      if (SMCGetTypeDescriptionForNumericType(v5, a3 + 8) == -1)
      {
        *(unsigned char *)(a3 + 8) = HIBYTE(v5);
        *(unsigned char *)(a3 + 9) = BYTE2(v5);
        *(unsigned char *)(a3 + 10) = BYTE1(v5);
        *(unsigned char *)(a3 + 11) = v5;
        int v6 = 1;
        *(unsigned char *)(a3 + 12) = 0;
      }
      else
      {
        int v6 = 0;
      }
      char v3 = 0;
      int v7 = BYTE4(v11);
      *(_DWORD *)a3 = v6;
      *(_DWORD *)(a3 + 4) = v7;
    }
  }
  return v3;
}

uint64_t SMCKextCall(mach_port_t a1, void *inputStruct, void *outputStruct)
{
  size_t outputStructCnt = 168;
  if (*((_DWORD *)inputStruct + 7) < 0x79u) {
    return IOConnectCallStructMethod(a1, 2u, inputStruct, 0xA8uLL, outputStruct, &outputStructCnt);
  }
  uint64_t v3 = 3758097090;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    SMCKextCall_cold_1();
  }
  return v3;
}

uint64_t SMCMakeUInt32Key(const char *a1)
{
  int v2 = strlen(a1);
  uint64_t v3 = 0;
  LODWORD(result) = 0;
  int v5 = 24;
  do
  {
    if (v3 >= v2) {
      int v6 = 32;
    }
    else {
      int v6 = a1[v3];
    }
    uint64_t result = (v6 << v5) | result;
    ++v3;
    v5 -= 8;
  }
  while (v3 != 4);
  return result;
}

uint64_t SMCGetTypeDescriptionForNumericType(signed int a1, uint64_t a2)
{
  if (a2)
  {
    if (bswap32(a1) == 544500838)
    {
      char v5 = 0;
      *(_DWORD *)a2 = 1;
      *(unsigned char *)(a2 + 4) = 1;
      __int16 v6 = 32;
LABEL_8:
      *(_WORD *)(a2 + 6) = v6;
      *(unsigned char *)(a2 + 8) = 0;
      return v5;
    }
    if (BYTE2(a1) == 105)
    {
      int v4 = 0;
      int v3 = 0;
      int v2 = 1;
    }
    else
    {
      if (SBYTE2(a1) != 112) {
        return -1;
      }
      int v2 = 0;
      int v3 = 2;
      int v4 = 1;
    }
    *(_DWORD *)a2 = v3;
    int v7 = a1 >> 24;
    if (a1 >> 24 == 102)
    {
      if (!v4) {
        return -1;
      }
      char v8 = 0;
      *(unsigned char *)(a2 + 4) = 0;
    }
    else
    {
      if (v7 != 115)
      {
        if (v7 != 117 || !v2) {
          return -1;
        }
        *(unsigned char *)(a2 + 4) = 0;
        goto LABEL_16;
      }
      char v8 = 1;
      *(unsigned char *)(a2 + 4) = 1;
      if (v2)
      {
LABEL_16:
        if ((BYTE1(a1) - 48) <= 9u)
        {
          if (a1 == 32)
          {
            __int16 v6 = (BYTE1(a1) - 48);
LABEL_38:
            char v5 = 0;
            goto LABEL_8;
          }
          if ((a1 - 48) <= 9u)
          {
            __int16 v6 = 10 * (BYTE1(a1) - 48) + (a1 - 48);
            goto LABEL_38;
          }
        }
        return -1;
      }
    }
    int v9 = (a1 >> 8) - 48;
    if ((BYTE1(a1) - 48) >= 0xAu) {
      LOBYTE(v9) = -1;
    }
    if ((BYTE1(a1) - 97) < 0x17u) {
      LOBYTE(v9) = BYTE1(a1) - 87;
    }
    char v10 = a1 - 48;
    if ((a1 - 48) >= 0xAu) {
      char v10 = -1;
    }
    if ((a1 - 97) >= 0x17u) {
      char v11 = v10;
    }
    else {
      char v11 = a1 - 87;
    }
    if ((v9 & 0x80) == 0 && (v11 & 0x80000000) == 0)
    {
      unsigned int v12 = (v8 + v9) + v11;
      *(_WORD *)(a2 + 6) = v12;
      *(unsigned char *)(a2 + 8) = v11;
      if (v12 < 0x41) {
        return 0;
      }
    }
    return -1;
  }
  return -1;
}

uint64_t SMCParseBytesForNumeric(unsigned __int8 *a1, unsigned int a2, double *a3, int *a4)
{
  unsigned int v4 = *((unsigned __int16 *)a4 + 3);
  if (8 * (unsigned __int16)a2 < v4) {
    return -1;
  }
  int v6 = *a4;
  if (*a4 == 2)
  {
    int64_t v10 = 0;
    if (a2)
    {
      uint64_t v11 = a2;
      do
      {
        unsigned int v12 = *a1++;
        int64_t v10 = v12 | (unint64_t)(v10 << 8);
        --v11;
      }
      while (v11);
    }
    int64_t v13 = (v10 & ~(-1 << v4) ^ (unint64_t)(1 << (v4 - 1)))
        - (1 << (v4 - 1));
    if (!*((unsigned char *)a4 + 4)) {
      int64_t v13 = v10;
    }
    BOOL v14 = *((unsigned char *)a4 + 4) != 0 && v13 < 0;
    if (v14) {
      int64_t v13 = -v13;
    }
    double v15 = (double)(unint64_t)v13;
    if (*((unsigned char *)a4 + 8)) {
      double v15 = v15 / (double)(unint64_t)(1 << *((unsigned char *)a4 + 8));
    }
    char v5 = 0;
    if (v14) {
      double v15 = -v15;
    }
    goto LABEL_29;
  }
  if (v6 == 1)
  {
    if (a2)
    {
      float v16 = 0.0;
      uint64_t v17 = a2 - 1;
      do
        LODWORD(v16) = a1[v17] | (LODWORD(v16) << 8);
      while ((unint64_t)v17--);
      double v15 = v16;
    }
    else
    {
      double v15 = 0.0;
    }
    char v5 = 0;
LABEL_29:
    *a3 = v15;
    return v5;
  }
  if (v6) {
    return -1;
  }
  unint64_t v7 = 0;
  if (a2)
  {
    uint64_t v8 = a2;
    do
    {
      unsigned int v9 = *a1++;
      unint64_t v7 = v9 | (v7 << 8);
      --v8;
    }
    while (v8);
  }
  *(void *)a3 = v7;
  char v5 = *((unsigned char *)a4 + 4);
  if (v5)
  {
    char v5 = 0;
    *(void *)a3 = (v7 & ~(-1 << *((_WORD *)a4 + 3)) ^ (unint64_t)(1 << (*((_WORD *)a4 + 3)
                                                                                               - 1)))
                  - (1 << (*((_WORD *)a4 + 3) - 1));
  }
  return v5;
}

uint64_t SMCAEPopulatePlatform(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = SMCReadKey((mach_port_t *)a1, 1381002356, v18, 0x20u);
  if (v2)
  {
    uint64_t v3 = v2;
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SMCAEPopulatePlatform_cold_9();
    }
    return v3;
  }
  __strlcpy_chk();
  if (SMCReadKey((mach_port_t *)a1, 1297307713, v18, 0x20u))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SMCAEPopulatePlatform_cold_8();
    }
    uint64_t v4 = 0;
    while (strcasecmp(v19, &AccumulatorPlatformStructLookupArray[v4]))
    {
      v4 += 48;
      if (v4 == 2688) {
        goto LABEL_29;
      }
    }
    *(void *)(a1 + 8) = &AccumulatorPlatformStructLookupArray[v4];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SMCAEPopulatePlatform_cold_7();
    }
    goto LABEL_17;
  }
  char v5 = (int *)malloc_type_malloc(0x30uLL, 0x106004040E2E4D3uLL);
  if (!v5)
  {
LABEL_29:
    uint64_t v3 = 0;
    *(unsigned char *)(a1 + 509) = 1;
    *(unsigned char *)(a1 + 4) = 0;
    return v3;
  }
  int v6 = v5;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v14 = 0;
  __strlcpy_chk();
  if (SMCReadKeyAsNumeric((mach_port_t *)a1, 1297307758, (uint64_t)&v15, (double *)&v14))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SMCAEPopulatePlatform_cold_6();
    }
    goto LABEL_28;
  }
  if (v15 || v16 || BYTE4(v16) || (v15 & 0x8000000000) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SMCAEPopulatePlatform_cold_1();
    }
    goto LABEL_28;
  }
  v6[8] = v14;
  if (SMCReadKeyAsNumeric((mach_port_t *)a1, 1297307726, (uint64_t)&v15, (double *)&v14))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SMCAEPopulatePlatform_cold_5();
    }
    goto LABEL_28;
  }
  if (v15 || v16 || BYTE4(v16) || (v15 & 0x8000000000) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SMCAEPopulatePlatform_cold_2();
    }
    goto LABEL_28;
  }
  v6[9] = v14;
  int64_t v10 = malloc_type_calloc(0x110uLL, v6[8], 0x80C14700uLL);
  if (!v10)
  {
LABEL_28:
    free(v6);
    goto LABEL_29;
  }
  uint64_t v11 = v10;
  if (SMCAEPopulateChannelInfo((mach_port_t *)a1, (uint64_t)v10, v6[8], 1u, 2u, 3u, 4u, 2))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SMCAEPopulatePlatform_cold_4();
    }
    goto LABEL_44;
  }
  unsigned int v12 = malloc_type_calloc(0x110uLL, v6[9], 0x654793ABuLL);
  if (!v12)
  {
LABEL_44:
    free(v11);
    goto LABEL_28;
  }
  int64_t v13 = v12;
  if (SMCAEPopulateChannelInfo((mach_port_t *)a1, (uint64_t)v12, v6[9], 0xBu, 0xCu, 0xDu, 0xEu, 3))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SMCAEPopulatePlatform_cold_3();
    }
    free(v13);
    goto LABEL_44;
  }
  *((void *)v6 + 2) = v11;
  *((void *)v6 + 3) = v13;
  v6[10] = 0;
  *(void *)(a1 + 8) = v6;
LABEL_17:
  *(unsigned char *)(a1 + 509) = 1;
  *(unsigned char *)(a1 + 4) = 1;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  BOOL v7 = !SMCGetKeyInfo((mach_port_t *)a1, 1297315938, (uint64_t)&v15)
    && (v15 & 0x5000000000) != 0
    && HIDWORD(v17) == 2;
  *(unsigned char *)(a1 + 508) = v7;
  int v8 = SMCReadKey((mach_port_t *)a1, 1297307720, v18, 0x20u);
  uint64_t v3 = SMCReadKey((mach_port_t *)a1, 1297307724, v18, 0x20u);
  *(unsigned char *)(a1 + 466) = (v3 | v8) == 0;
  *(_WORD *)(a1 + 464) = 0;
  *(_WORD *)(a1 + 467) = 0;
  *(_OWORD *)(a1 + 472) = 0u;
  *(_OWORD *)(a1 + 488) = 0u;
  *(_DWORD *)(a1 + 504) = 0;
  return v3;
}

_DWORD *SMCAccumGetChannelInfoForKey(uint64_t a1, int a2)
{
  if (!a1)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SMCAccumGetChannelInfoForKey_cold_1();
    }
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + 8);
  if (!v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SMCAccumGetChannelInfoForKey_cold_2();
    }
    return 0;
  }
  uint64_t result = *(_DWORD **)(v2 + 16);
  if (!result)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SMCAccumGetChannelInfoForKey_cold_3();
    }
    return 0;
  }
  uint64_t v4 = *(unsigned int *)(v2 + 32);
  if ((int)v4 < 1)
  {
LABEL_7:
    uint64_t result = *(_DWORD **)(v2 + 24);
    if (result)
    {
      uint64_t v5 = *(unsigned int *)(v2 + 36);
      if ((int)v5 >= 1)
      {
        while (*result != a2)
        {
          result += 68;
          if (!--v5) {
            return 0;
          }
        }
        return result;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      SMCAccumGetChannelInfoForKey_cold_4();
    }
    return 0;
  }
  while (*result != a2)
  {
    result += 68;
    if (!--v4) {
      goto LABEL_7;
    }
  }
  return result;
}

uint64_t SMCOSAccumIsSupported(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 509) || !SMCAEPopulatePlatform(result))
    {
      return *(unsigned char *)(v1 + 508) != 0;
    }
    else
    {
      uint64_t result = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (result)
      {
        SMCOSAccumIsSupported_cold_1();
        return 0;
      }
    }
  }
  return result;
}

uint64_t SMCOSAccumSampleChannel(mach_port_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a1;
  LOBYTE(a1) = -1;
  if (v3 && a2 && a3)
  {
    if (SMCOSAccumIsSupported((uint64_t)v3))
    {
      __int16 v12 = *(_WORD *)(a2 + 268);
      LODWORD(a1) = SMCWriteKey(v3, 1297315938, (uint64_t)&v12);
      if (!a1)
      {
        uint64_t v10 = 0;
        double v11 = 0.0;
        LODWORD(a1) = SMCReadKey(v3, 1297315955, &v10, 0x10u);
        if (!a1)
        {
          if (__PAIR64__(BYTE1(v10), v10) == __PAIR64__(*(unsigned __int8 *)(a2 + 269), *(unsigned __int8 *)(a2 + 268)))
          {
            int v9 = 0;
            uint64_t v8 = 0;
            LODWORD(a1) = SMCGetTypeDescriptionForNumericType(*(_DWORD *)(a2 + 264), (uint64_t)&v8);
            if (!a1)
            {
              double v6 = (double)(1 << v9);
              if (v8 != 2) {
                double v6 = 1.0;
              }
              *(double *)a3 = v11 / v6;
              *(_DWORD *)(a3 + 8) = HIDWORD(v10);
              *(unsigned char *)(a3 + 12) = v10;
            }
          }
          else
          {
            LOBYTE(a1) = 0;
          }
        }
      }
    }
    else
    {
      LOBYTE(a1) = -1;
    }
  }
  return (char)a1;
}

uint64_t SMCAEPopulateChannelInfo(mach_port_t *a1, uint64_t a2, int a3, unsigned int a4, unsigned int a5, unsigned int a6, unsigned int a7, char a8)
{
  if (a3 < 1) {
    return 0;
  }
  uint64_t v15 = 0;
  uint64_t v28 = a3;
  while (1)
  {
    uint64_t ChannelAttribute = SMCAEPrepareToFetchChannelAttribute(a1, v15, a4, 16);
    if (ChannelAttribute) {
      break;
    }
    int v31 = 0;
    uint64_t v17 = SMCReadKey(a1, 1297307713, &v31, 4u);
    if (v17)
    {
      uint64_t v26 = v17;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        SMCAEPopulateChannelInfo_cold_7();
      }
      return v26;
    }
    uint64_t v18 = SMCAEPrepareToFetchChannelAttribute(a1, v15, a7, 16);
    if (v18)
    {
      uint64_t v26 = v18;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        SMCAEPopulateChannelInfo_cold_6();
      }
      return v26;
    }
    int v30 = 0;
    uint64_t v19 = SMCReadKey(a1, 1297307713, &v30, 4u);
    if (v19)
    {
      uint64_t v26 = v19;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        SMCAEPopulateChannelInfo_cold_5();
      }
      return v26;
    }
    uint64_t v20 = SMCAEPrepareToFetchChannelAttribute(a1, v15, a6, 49);
    if (v20)
    {
      uint64_t v26 = v20;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        SMCAEPopulateChannelInfo_cold_4();
      }
      return v26;
    }
    uint64_t v21 = SMCReadKey(a1, 1297307713, v29, 4u);
    if (v21)
    {
      uint64_t v26 = v21;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        SMCAEPopulateChannelInfo_cold_3();
      }
      return v26;
    }
    int v22 = SMCMakeUInt32Key(v29);
    uint64_t v23 = SMCAEPrepareToFetchChannelAttribute(a1, v15, a5, 48);
    if (v23)
    {
      uint64_t v26 = v23;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        SMCAEPopulateChannelInfo_cold_2();
      }
      return v26;
    }
    uint64_t v24 = SMCReadKey(a1, 1297307713, v29, 4u);
    if (v24)
    {
      uint64_t v26 = v24;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        SMCAEPopulateChannelInfo_cold_1();
      }
      return v26;
    }
    int v25 = SMCMakeUInt32Key(v29);
    *(unsigned char *)(a2 + 4) = v31;
    *(_DWORD *)a2 = v25;
    *(_DWORD *)(a2 + 264) = v22;
    *(unsigned char *)(a2 + 261) = v30;
    *(unsigned char *)(a2 + 5) = 0;
    *(unsigned char *)(a2 + 268) = a8;
    *(unsigned char *)(a2 + 269) = v15++;
    a2 += 272;
    if (v28 == v15) {
      return 0;
    }
  }
  uint64_t v26 = ChannelAttribute;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    SMCAEPopulateChannelInfo_cold_8();
  }
  return v26;
}

uint64_t SMCAEPrepareToFetchChannelAttribute(mach_port_t *a1, uint64_t a2, unsigned int a3, int a4)
{
  int v7 = SMCWriteKeyAsNumeric(a1, 1297307696, a2);
  if (!v7)
  {
    int v7 = SMCWriteKeyAsNumeric(a1, 1297307698, a3);
    if (!v7)
    {
      uint64_t v11 = 0;
      memset(v10, 0, sizeof(v10));
      int v7 = SMCReadKeyAsNumeric(a1, 1297307705, (uint64_t)v10, (double *)&v11);
      if (v11 == a4) {
        char v8 = 0;
      }
      else {
        char v8 = -9;
      }
      if (!v7) {
        LOBYTE(v7) = v8;
      }
    }
  }
  return (char)v7;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

uint64_t SMCOpenAppleSMC(uint64_t result)
{
  kern_return_t v2;
  io_connect_t connect;

  connect = 0;
  if (!result) {
    return result;
  }
  uint64_t v1 = result;
  uint64_t v2 = IOServiceOpen(result, *MEMORY[0x263EF8960], 0, &connect);
  if (v2)
  {
    if (v2 == -536870201) {
      findMaxClientCreatorAndReport(v1);
    }
    uint64_t result = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    SMCOpenAppleSMC_cold_1();
    return 0;
  }
  if (!connect)
  {
    uint64_t result = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    SMCOpenAppleSMC_cold_2();
    return 0;
  }
  if (!IOConnectCallScalarMethod(connect, 0, 0, 0, 0, 0)) {
    return connect;
  }
  uint64_t result = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  if (result)
  {
    SMCOpenAppleSMC_cold_3();
    return 0;
  }
  return result;
}

void findMaxClientCreatorAndReport(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  memset(v35, 0, sizeof(v35));
  uint64_t v34 = 0;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  findUserClients(a1, Mutable);
  CFIndex Count = CFDictionaryGetCount(Mutable);
  if (Count)
  {
    uint64_t v4 = Count;
    unint64_t v5 = 8 * Count;
    MEMORY[0x270FA5388](Count);
    unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
    int v7 = (CFStringRef *)((char *)&v26 - v6);
    if (v5 >= 0x200) {
      size_t v8 = 512;
    }
    else {
      size_t v8 = v5;
    }
    bzero((char *)&v26 - v6, v8);
    MEMORY[0x270FA5388](v9);
    uint64_t v10 = (CFMutableDataRef *)((char *)&v26 - v6);
    bzero((char *)&v26 - v6, v8);
    CFDictionaryGetKeysAndValues(Mutable, (const void **)((char *)&v26 - v6), (const void **)((char *)&v26 - v6));
    if (v4 < 1)
    {
      int v25 = 0;
    }
    else
    {
      unsigned __int16 v11 = 0;
      unsigned __int16 v12 = 0;
      do
      {
        MutableBytePtr = CFDataGetMutableBytePtr(*v10);
        unsigned int v14 = *((unsigned __int16 *)MutableBytePtr + 66);
        if (v14 > v11)
        {
          uint64_t v15 = MutableBytePtr;
          long long v26 = *(_OWORD *)MutableBytePtr;
          long long v16 = *((_OWORD *)MutableBytePtr + 1);
          long long v17 = *((_OWORD *)MutableBytePtr + 2);
          long long v18 = *((_OWORD *)MutableBytePtr + 4);
          long long v29 = *((_OWORD *)MutableBytePtr + 3);
          long long v30 = v18;
          long long v27 = v16;
          long long v28 = v17;
          long long v19 = *((_OWORD *)MutableBytePtr + 5);
          long long v20 = *((_OWORD *)MutableBytePtr + 6);
          long long v21 = *((_OWORD *)MutableBytePtr + 7);
          uint64_t v34 = *((void *)MutableBytePtr + 16);
          long long v32 = v20;
          long long v33 = v21;
          long long v31 = v19;
          CFStringRef v22 = *v7;
          if ((unint64_t)(CFStringGetLength(*v7) + 1) > 0x7F) {
            CFIndex v23 = 128;
          }
          else {
            CFIndex v23 = CFStringGetLength(*v7) + 1;
          }
          if (!CFStringGetCString(v22, (char *)v35, v23, 0x8000100u)) {
            LOBYTE(v35[0]) = 0;
          }
          unsigned __int16 v11 = *((_WORD *)v15 + 66);
        }
        v12 += v14;
        uint64_t v24 = *v10++;
        v38.location = 0;
        v38.length = 136;
        CFDataDeleteBytes(v24, v38);
        ++v7;
        --v4;
      }
      while (v4);
      int v25 = v12;
    }
    CFDictionaryRemoveAllValues(Mutable);
    CFRelease(Mutable);
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT)) {
      findMaxClientCreatorAndReport_cold_1((uint64_t)&v26, (uint64_t)v35, v25);
    }
  }
  else
  {
    CFRelease(Mutable);
  }
}

uint64_t SMCCloseAppleSMC(io_connect_t a1)
{
  if (IOConnectCallScalarMethod(a1, 1u, 0, 0, 0, 0))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SMCCloseAppleSMC_cold_1();
    }
    return 3758097084;
  }
  else
  {
    return IOServiceClose(a1);
  }
}

uint64_t findUserClients(uint64_t a1, const __CFDictionary *a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  io_iterator_t iterator = 0;
  BOOLean_t v4 = IOObjectConformsTo(a1, "IOUserClient");
  if (a2)
  {
    if (v4)
    {
      memset(cStr, 0, sizeof(cStr));
      uint64_t v30 = 0;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      *(_OWORD *)bytes = 0u;
      long long v23 = 0u;
      if (!MEMORY[0x223C5AE00](a1, cStr))
      {
        CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        CFStringRef v6 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], (const char *)cStr, 0x8000100u);
        Value = (__CFData *)CFDictionaryGetValue(a2, v6);
        if (Value)
        {
          MutableBytePtr = CFDataGetMutableBytePtr(Value);
          ++*((_WORD *)MutableBytePtr + 66);
        }
        else
        {
          CFStringRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(a1, @"IOUserClientCreator", v5, 0);
          CFStringRef v10 = CFProperty;
          if (CFProperty && (CFTypeID v11 = CFGetTypeID(CFProperty), v11 == CFStringGetTypeID()))
          {
            CFIndex v12 = CFStringGetLength(v10) + 1;
            int64_t v13 = (char *)malloc_type_malloc(v12, 0x2BC645C1uLL);
            if (v13)
            {
              unsigned int v14 = v13;
              if (CFStringGetCString(v10, v13, v12, 0x8000100u) && sscanf(v14, "pid %d, %128s", &v30, bytes) != 2) {
                LODWORD(v30) = 0;
              }
              CFRelease(v10);
              free(v14);
            }
            else
            {
              CFRelease(v10);
            }
            if (!v30) {
              goto LABEL_20;
            }
            WORD2(v30) = 1;
            CFDictionaryRef Mutable = CFDataCreateMutable(v5, 0);
            long long v17 = Mutable;
            if (Mutable)
            {
              CFDataAppendBytes(Mutable, bytes, 136);
              CFDictionaryAddValue(a2, v6, v17);
            }
            CFStringRef v15 = (const __CFString *)v17;
          }
          else
          {
            CFStringRef v15 = v10;
          }
          CFRelease(v15);
        }
LABEL_20:
        CFRelease(v6);
      }
    }
  }
  if (!MEMORY[0x223C5ADF0](a1, "IOService", &iterator))
  {
    uint64_t v18 = IOIteratorNext(iterator);
    if (v18)
    {
      uint64_t v19 = v18;
      do
      {
        findUserClients(v19, a2);
        IOObjectRelease(v19);
        uint64_t v19 = IOIteratorNext(iterator);
      }
      while (v19);
    }
  }
  uint64_t result = iterator;
  if (iterator) {
    return IOObjectRelease(iterator);
  }
  return result;
}

_DWORD *SMCOpenConnection(uint64_t a1)
{
  uint64_t v2 = malloc_type_calloc(1uLL, 0x200uLL, 0x106004083A41F05uLL);
  if (!v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SMCOpenConnection_cold_1();
    }
    return 0;
  }
  uint64_t v3 = v2;
  int v4 = SMCOpenAppleSMC(a1);
  *uint64_t v3 = v4;
  if (!v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SMCOpenConnection_cold_2();
    }
    free(v3);
    return 0;
  }
  return v3;
}

_DWORD *SMCOpenConnectionWithDefaultService()
{
  mach_port_name_t name = 0;
  if (MEMORY[0x223C5AD80](0, &name))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SMCOpenConnectionWithDefaultService_cold_1();
    }
    return 0;
  }
  else
  {
    mach_port_name_t v1 = name;
    CFDictionaryRef v2 = IOServiceMatching("AppleSMC");
    uint64_t MatchingService = IOServiceGetMatchingService(v1, v2);
    io_object_t v4 = MatchingService;
    v0 = SMCOpenConnection(MatchingService);
    IOObjectRelease(v4);
    mach_port_deallocate(*MEMORY[0x263EF8960], name);
  }
  return v0;
}

uint64_t SMCCloseConnection(io_connect_t *a1)
{
  if (a1)
  {
    SMCCloseAppleSMC(*a1);
    free(a1);
    return 0;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SMCCloseConnection_cold_1();
    }
    return -1;
  }
}

uint64_t SMCUInt32ToString(uint64_t result, unsigned char *a2)
{
  *a2 = BYTE3(result);
  a2[1] = BYTE2(result);
  a2[2] = BYTE1(result);
  a2[3] = result;
  a2[4] = 0;
  return result;
}

uint64_t SMCGetKeyFromIndex(mach_port_t *a1, int a2, _DWORD *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  char v3 = -1;
  if (a1 && a3)
  {
    uint64_t v15 = 0;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    memset(v6, 0, sizeof(v6));
    memset(inputStruct, 0, sizeof(inputStruct));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v25 = 0;
    HIDWORD(v17) = a2;
    BYTE10(v17) = 8;
    if (SMCKextCall(*a1, inputStruct, v6))
    {
      return -2;
    }
    else
    {
      char v3 = BYTE8(v7);
      if (BYTE8(v7))
      {
        if (BYTE8(v7) == 184) {
          return -4;
        }
        else {
          return -3;
        }
      }
      else
      {
        *a3 = v6[0];
      }
    }
  }
  return v3;
}

unint64_t SMCReadBigEndianArrayToUIntMax(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  unint64_t result = 0;
  uint64_t v4 = a2;
  do
  {
    unsigned int v5 = *a1++;
    unint64_t result = v5 | (result << 8);
    --v4;
  }
  while (v4);
  return result;
}

unint64_t SMCReadLittleEndianArrayToUIntMax(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  unint64_t result = 0;
  uint64_t v4 = a2 - 1;
  do
    unint64_t result = *(unsigned __int8 *)(a1 + v4) | (result << 8);
  while ((unint64_t)v4--);
  return result;
}

unint64_t SMCSignExtendToIntMax(unsigned int a1, char a2)
{
  return (~(-1 << a2) & a1 ^ (unint64_t)(1 << (a2 - 1))) - (1 << (a2 - 1));
}

uint64_t SMCReadKeyAsNumeric(mach_port_t *a1, uint64_t a2, uint64_t a3, double *a4)
{
  uint64_t v4 = a1;
  LOBYTE(a1) = -1;
  if (v4)
  {
    if (a4)
    {
      long long v9 = 0uLL;
      uint64_t v10 = 0;
      LODWORD(a1) = SMCGetKeyInfo(v4, a2, (uint64_t)&v9);
      if (!a1)
      {
        LODWORD(a1) = SMCReadKeyAsNumericWithKnownKeyInfo((uint64_t)v4, a2, (uint64_t)&v9, a4);
        if (!a1)
        {
          LOBYTE(a1) = 0;
          if (a3)
          {
            *(_OWORD *)a3 = v9;
            *(void *)(a3 + 16) = v10;
          }
        }
      }
    }
  }
  return (char)a1;
}

uint64_t SMCWriteKeyWithKnownSize(mach_port_t *a1, int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  char v4 = -1;
  if (a1 && a4)
  {
    uint64_t v17 = 0;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    memset(v8, 0, sizeof(v8));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    int v29 = 0;
    int inputStruct = a2;
    DWORD2(v20) = a3;
    BYTE6(v21) = 6;
    if (a3 <= 0x78)
    {
      __memcpy_chk();
      int v6 = SMCKextCall(*a1, &inputStruct, v8);
      kdebug_trace();
      if (v6 == -536870207)
      {
        return -7;
      }
      else if (v6)
      {
        return -2;
      }
      else if (BYTE8(v9))
      {
        return -3;
      }
      else
      {
        return 0;
      }
    }
    else
    {
      return -1;
    }
  }
  return v4;
}

uint64_t SMCWriteKey(mach_port_t *a1, int a2, uint64_t a3)
{
  char v3 = a1;
  LOBYTE(a1) = -1;
  if (v3)
  {
    if (a3)
    {
      v7[0] = 0;
      v7[1] = 0;
      uint64_t v8 = 0;
      LODWORD(a1) = SMCGetKeyInfo(v3, a2, (uint64_t)v7);
      if (!a1) {
        LOBYTE(a1) = SMCWriteKeyWithKnownSize(v3, a2, HIDWORD(v8), a3);
      }
    }
  }
  return (char)a1;
}

uint64_t SMCConvertNumericToBytes(double *a1, uint64_t a2, unint64_t *a3, unsigned __int16 a4)
{
  unint64_t v5 = *(unsigned __int16 *)(a2 + 6);
  if (8 * a4 >= v5)
  {
    int v6 = *(_DWORD *)a2;
    if (*(_DWORD *)a2 == 2)
    {
      double v11 = *a1;
      if (*a1 < 0.0) {
        double v11 = -*a1;
      }
      unint64_t v12 = (unint64_t)(v11 * (double)(unint64_t)(1 << *(unsigned char *)(a2 + 8)));
      if (*a1 < 0.0) {
        unint64_t v12 = -(uint64_t)v12;
      }
      unint64_t v18 = v12;
      if (v5 >= 8)
      {
        unint64_t v7 = 0;
        unint64_t v14 = v5 >> 3;
        long long v15 = &v18;
        do
        {
          unsigned int v16 = *(unsigned __int8 *)v15;
          long long v15 = (unint64_t *)((char *)v15 + 1);
          unint64_t v7 = v16 | (v7 << 8);
          --v14;
        }
        while (v14);
        goto LABEL_21;
      }
      goto LABEL_17;
    }
    if (v6 == 1)
    {
      char v10 = 0;
      *(float *)&unsigned int v13 = *a1;
      unint64_t v7 = v13;
LABEL_22:
      *a3 = v7;
      return v10;
    }
    if (!v6)
    {
      if (v5 >= 8)
      {
        unint64_t v7 = 0;
        unint64_t v8 = v5 >> 3;
        do
        {
          unsigned int v9 = *(unsigned __int8 *)a1;
          a1 = (double *)((char *)a1 + 1);
          unint64_t v7 = v9 | (v7 << 8);
          --v8;
        }
        while (v8);
        goto LABEL_21;
      }
LABEL_17:
      unint64_t v7 = 0;
LABEL_21:
      char v10 = 0;
      goto LABEL_22;
    }
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    SMCConvertNumericToBytes_cold_1((int *)a2, v5);
  }
  return -1;
}

uint64_t SMCWriteKeyAsNumeric(mach_port_t *a1, int a2, uint64_t a3)
{
  v13[1] = *(double *)MEMORY[0x263EF8340];
  *(void *)&v13[0] = a3;
  if (a1)
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v5 = SMCGetKeyInfo(a1, a2, (uint64_t)&v10);
    if (!v5)
    {
      MEMORY[0x270FA5388](v5);
      unint64_t v7 = (unint64_t *)((char *)&v9 - ((v6 + 15) & 0x1FFFFFFF0));
      if (SMCConvertNumericToBytes(v13, (uint64_t)&v11, v7, WORD2(v12))) {
        LOBYTE(v5) = -1;
      }
      else {
        LOBYTE(v5) = SMCWriteKeyWithKnownSize(a1, a2, HIDWORD(v12), (uint64_t)v7);
      }
    }
  }
  else
  {
    LOBYTE(v5) = -1;
  }
  return (char)v5;
}

uint64_t SMCAccumIsSupported(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 509) || !SMCAEPopulatePlatform(result))
    {
      return *(unsigned char *)(v1 + 4) != 0;
    }
    else
    {
      unint64_t result = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (result)
      {
        SMCAccumIsSupported_cold_1();
        return 0;
      }
    }
  }
  return result;
}

BOOL SMCAccumCheckMinMaxSupport(uint64_t a1)
{
  return !a1 || *(unsigned char *)(a1 + 466) != 0;
}

uint64_t SMCSetAccum1msChannels(uint64_t a1, uint64_t a2)
{
  char v2 = -1;
  if (a1 && a2)
  {
    if (SMCAccumIsSupported(a1))
    {
      for (uint64_t i = 0; i != 16; i += 4)
        *(_DWORD *)(a1 + 472 + i) = *(_DWORD *)(a2 + i);
      return 0;
    }
    else
    {
      return -6;
    }
  }
  return v2;
}

uint64_t SMCSetAccum1secChannels(uint64_t a1, uint64_t a2)
{
  char v2 = -1;
  if (a1 && a2)
  {
    if (SMCAccumIsSupported(a1))
    {
      for (uint64_t i = 0; i != 16; i += 4)
        *(_DWORD *)(a1 + 488 + i) = *(_DWORD *)(a2 + i);
      return 0;
    }
    else
    {
      return -6;
    }
  }
  return v2;
}

uint64_t SMCSetAccumMode(uint64_t a1, unsigned int a2)
{
  char v2 = -1;
  if (a1)
  {
    char v3 = a2;
    if (a2 <= 2)
    {
      if (SMCAccumIsSupported(a1))
      {
        char v2 = 0;
        *(unsigned char *)(a1 + 504) = v3;
      }
      else
      {
        return -6;
      }
    }
  }
  return v2;
}

uint64_t SMCSetAccumBitShift(uint64_t a1, unsigned int a2)
{
  if (a1)
  {
    if (SMCAccumIsSupported(a1))
    {
      if (a2 <= 0x10)
      {
        char v4 = 0;
        *(unsigned char *)(a1 + 505) = a2;
      }
      else
      {
        return -1;
      }
    }
    else
    {
      return -6;
    }
  }
  else
  {
    return -1;
  }
  return v4;
}

uint64_t SMCProgramAccum(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (a1)
  {
    if (SMCAccumIsSupported(a1))
    {
      int v2 = populateChannels(a1, v5, (uint64_t)v4, v8, v7);
      if (!v2)
      {
        int v2 = SMCWriteKeyWithKnownSize((mach_port_t *)a1, 1297307763, 4u, (uint64_t)v5);
        if (!v2)
        {
          int v2 = SMCWriteKeyWithKnownSize((mach_port_t *)a1, 1297307731, 4u, (uint64_t)v4);
          if (!v2)
          {
            int v2 = programAccumModes(a1);
            if (!v2)
            {
              char v6 = 3;
              int v2 = SMCWriteKeyWithKnownSize((mach_port_t *)a1, 1297307746, 1u, (uint64_t)&v6);
              if (!v2)
              {
                *(unsigned char *)(a1 + 467) = 1;
                copyKeyInfo(a1, v8, v7);
                LOBYTE(v2) = 0;
              }
            }
          }
        }
      }
    }
    else
    {
      LOBYTE(v2) = -6;
    }
  }
  else
  {
    LOBYTE(v2) = -1;
  }
  return (char)v2;
}

uint64_t populateChannels(uint64_t a1, unsigned char *a2, uint64_t a3, _DWORD *a4, _DWORD *a5)
{
  if (lookup1msChannel(a1, *(_DWORD *)(a1 + 472), a4, a2))
  {
    int v10 = 1;
  }
  else
  {
    unint64_t v12 = 0;
    unsigned int v13 = a4 + 6;
    unint64_t v14 = a2 + 1;
    long long v15 = (int *)(a1 + 488);
    int v10 = 1;
    unsigned int v16 = (int *)(a1 + 488);
    do
    {
      int v17 = *v16++;
      if (lookup1secChannel(a1, v17, a5, (unsigned char *)(a3 + v12))) {
        break;
      }
      int v10 = v12 < 3;
      if (v12 == 3) {
        break;
      }
      int v18 = lookup1msChannel(a1, *(v15 - 3), v13, &v14[v12]);
      v13 += 6;
      a5 += 6;
      ++v12;
      long long v15 = v16;
    }
    while (!v18);
  }
  return (v10 << 31 >> 31);
}

uint64_t programAccumModes(uint64_t a1)
{
  __int16 v3 = 0;
  uint64_t result = SMCReadKeyWithKnownSize((mach_port_t *)a1, 1297307757, 2u, &v3);
  if (!result)
  {
    __int16 v3 = v3 & 0xFF2 | (*(unsigned __int8 *)(a1 + 505) << 12) | (4 * (*(unsigned char *)(a1 + 504) & 3)) | 1;
    uint64_t result = SMCWriteKeyWithKnownSize((mach_port_t *)a1, 1297307757, 2u, (uint64_t)&v3);
    if (!result) {
      *(_WORD *)(a1 + 464) = *(_WORD *)(a1 + 504);
    }
  }
  return result;
}

uint64_t copyKeyInfo(uint64_t result, long long *a2, long long *a3)
{
  uint64_t v3 = 16;
  uint64_t v4 = 488;
  do
  {
    int v5 = *(_DWORD *)(result + v4 - 16);
    char v6 = (_DWORD *)(result + v3);
    unint64_t v7 = (_OWORD *)(result + v3 + 4);
    if (v5)
    {
      *char v6 = v5;
      long long v8 = *a2;
      *(void *)(result + v3 + 20) = *((void *)a2 + 2);
      *unint64_t v7 = v8;
    }
    else
    {
      *(void *)char v6 = 0x100000000;
    }
    int v9 = *(_DWORD *)(result + v4);
    uint64_t v10 = result + v3;
    if (v9)
    {
      *(_DWORD *)(v10 + 224) = v9;
      long long v11 = *a3;
      *(void *)(v10 + 244) = *((void *)a3 + 2);
      *(_OWORD *)(v10 + 228) = v11;
    }
    else
    {
      *(_DWORD *)(v10 + 224) = 0;
      *(_DWORD *)unint64_t v7 = 1;
    }
    a3 = (long long *)((char *)a3 + 24);
    a2 = (long long *)((char *)a2 + 24);
    v3 += 56;
    v4 += 4;
  }
  while (v3 != 240);
  return result;
}

uint64_t SMCProgramAccumWithoutReset(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (a1)
  {
    if (SMCAccumIsSupported(a1))
    {
      int v2 = populateChannels(a1, v17, (uint64_t)v16, v19, v18);
      if (!v2)
      {
        int v2 = SMCReadKeyWithKnownSize((mach_port_t *)a1, 1297307763, 4u, v15);
        if (!v2)
        {
          int v2 = SMCReadKeyWithKnownSize((mach_port_t *)a1, 1297307731, 4u, v14);
          if (!v2)
          {
            uint64_t v3 = 0;
            uint64_t v4 = 0;
            int v5 = v18;
            char v6 = v19;
            uint64_t v7 = 488;
            do
            {
              if (*v6 == 1 && *(_DWORD *)(a1 + v3 + 20) != 1)
              {
                v17[v4] = v15[v4];
                *(_OWORD *)char v6 = *(_OWORD *)(a1 + v3 + 20);
                *((void *)v6 + 2) = *(void *)(a1 + v3 + 36);
                *(_DWORD *)(a1 + v7 - 16) = *(_DWORD *)(a1 + v3 + 16);
              }
              if (v5[5] == 1)
              {
                uint64_t v8 = a1 + v3;
                if (*(_DWORD *)(a1 + v3 + 264) != 1)
                {
                  v16[v4] = v14[v4];
                  *(_OWORD *)int v5 = *(_OWORD *)(v8 + 244);
                  *((void *)v5 + 2) = *(void *)(v8 + 260);
                  *(_DWORD *)(a1 + v7) = *(_DWORD *)(v8 + 240);
                }
              }
              ++v4;
              v5 += 6;
              v6 += 6;
              v3 += 56;
              v7 += 4;
            }
            while (v4 != 4);
            int v2 = SMCWriteKeyWithKnownSize((mach_port_t *)a1, 1297307763, 4u, (uint64_t)v17);
            if (!v2)
            {
              int v2 = SMCWriteKeyWithKnownSize((mach_port_t *)a1, 1297307731, 4u, (uint64_t)v16);
              if (!v2)
              {
                int v2 = programAccumModes(a1);
                if (!v2)
                {
                  uint64_t v9 = 0;
                  *(unsigned char *)(a1 + 467) = 1;
                  uint64_t v10 = (_DWORD *)(a1 + 488);
                  uint64_t v11 = a1 + 244;
                  do
                  {
                    int v12 = *(v10 - 4);
                    if (v12)
                    {
                      *(_DWORD *)(v11 - 228) = v12;
                      *(_OWORD *)(v11 - 224) = *(_OWORD *)&v19[v9];
                      *(void *)(v11 - 208) = *(void *)&v19[v9 + 4];
                    }
                    if (*v10)
                    {
                      *(_DWORD *)(v11 - 4) = *v10;
                      *(_OWORD *)uint64_t v11 = *(_OWORD *)&v18[v9];
                      *(void *)(v11 + 16) = *(void *)&v18[v9 + 4];
                    }
                    LOBYTE(v2) = 0;
                    v9 += 6;
                    ++v10;
                    v11 += 56;
                  }
                  while (v9 != 24);
                }
              }
            }
          }
        }
      }
    }
    else
    {
      LOBYTE(v2) = -6;
    }
  }
  else
  {
    LOBYTE(v2) = -1;
  }
  return (char)v2;
}

uint64_t SMCProgramAccum1Channel(mach_port_t *a1, int a2)
{
  int v2 = a1;
  LOBYTE(a1) = -1;
  if (v2 && a2)
  {
    if (!SMCAccumIsSupported((uint64_t)v2))
    {
      LOBYTE(a1) = -6;
      return (char)a1;
    }
    char v20 = 0;
    long long v18 = 0uLL;
    uint64_t v19 = 0;
    int v4 = lookup1msChannel((uint64_t)v2, a2, &v18, &v20);
    if (v4)
    {
      if (lookup1secChannel((uint64_t)v2, a2, &v18, &v20))
      {
        LOBYTE(a1) = -1;
        return (char)a1;
      }
      uint64_t v10 = 0;
      int v7 = 0;
      uint64_t v11 = (int *)(v2 + 61);
      do
      {
        int v12 = *v11;
        v11 += 14;
        if (v12 == 1) {
          int v7 = v10;
        }
        ++v10;
      }
      while (v10 != 4);
    }
    else
    {
      uint64_t v6 = 0;
      int v7 = 0;
      uint64_t v8 = (int *)(v2 + 5);
      do
      {
        int v9 = *v8;
        v8 += 14;
        if (v9 == 1) {
          int v7 = v6;
        }
        ++v6;
      }
      while (v6 != 4);
    }
    if (v4)
    {
      LODWORD(a1) = SMCReadKeyWithKnownSize(v2, 1297307731, 4u, v17);
      if (!a1)
      {
        v17[v7] = v20;
        LODWORD(a1) = SMCWriteKeyWithKnownSize(v2, 1297307731, 4u, (uint64_t)v17);
        if (!a1)
        {
          unsigned int v13 = &v2[14 * v7];
          unint64_t v14 = (int *)(v13 + 60);
          long long v15 = v13 + 61;
LABEL_25:
          LOBYTE(a1) = 0;
          *(_OWORD *)long long v15 = v18;
          *((void *)v15 + 2) = v19;
          *unint64_t v14 = a2;
        }
      }
    }
    else
    {
      LODWORD(a1) = SMCReadKeyWithKnownSize(v2, 1297307763, 4u, v17);
      if (!a1)
      {
        v17[v7] = v20;
        LODWORD(a1) = SMCWriteKeyWithKnownSize(v2, 1297307763, 4u, (uint64_t)v17);
        if (!a1)
        {
          unsigned int v16 = &v2[14 * v7];
          unint64_t v14 = (int *)(v16 + 4);
          long long v15 = v16 + 5;
          goto LABEL_25;
        }
      }
    }
  }
  return (char)a1;
}

uint64_t lookup1msChannel(uint64_t a1, int a2, _DWORD *a3, unsigned char *a4)
{
  uint64_t v4 = *(void *)(a1 + 8);
  if (a2)
  {
    unint64_t v5 = *(unsigned int *)(v4 + 32);
    if ((int)v5 >= 1)
    {
      uint64_t v6 = *(_DWORD **)(v4 + 16);
      if (*v6 == a2)
      {
        unint64_t v7 = 0;
        int v8 = 0;
LABEL_10:
        uint64_t v12 = 17 * v7;
        *a4 = v6[4 * v12 + 1];
        *a3 = 0;
        uint64_t v13 = *(void *)(*(void *)(a1 + 8) + 16) + 16 * v12;
        a3[5] = *(unsigned __int8 *)(v13 + 261);
        if (SMCGetTypeDescriptionForNumericType(*(_DWORD *)(v13 + 264), (uint64_t)(a3 + 2)))
        {
          LOBYTE(v9) = -1;
          return (char)v9;
        }
LABEL_13:
        int v9 = v8 << 31 >> 31;
        return (char)v9;
      }
      unint64_t v7 = 0;
      uint64_t v10 = v6 + 68;
      while (v5 - 1 != v7)
      {
        int v11 = *v10;
        v10 += 68;
        ++v7;
        if (v11 == a2)
        {
          int v8 = v7 >= v5;
          goto LABEL_10;
        }
      }
    }
    int v8 = 1;
    goto LABEL_13;
  }
  LOBYTE(v9) = 0;
  *a4 = *(unsigned char *)(*(void *)(v4 + 16) + 4);
  *a3 = 1;
  return (char)v9;
}

uint64_t lookup1secChannel(uint64_t a1, int a2, _DWORD *a3, unsigned char *a4)
{
  uint64_t v4 = *(void *)(a1 + 8);
  if (a2)
  {
    unint64_t v5 = *(unsigned int *)(v4 + 36);
    if ((int)v5 >= 1)
    {
      uint64_t v6 = *(_DWORD **)(v4 + 24);
      if (*v6 == a2)
      {
        unint64_t v7 = 0;
        int v8 = 0;
LABEL_10:
        uint64_t v12 = 17 * v7;
        *a4 = v6[4 * v12 + 1];
        *a3 = 0;
        uint64_t v13 = *(void *)(*(void *)(a1 + 8) + 24) + 16 * v12;
        a3[5] = *(unsigned __int8 *)(v13 + 261);
        if (SMCGetTypeDescriptionForNumericType(*(_DWORD *)(v13 + 264), (uint64_t)(a3 + 2)))
        {
          LOBYTE(v9) = -1;
          return (char)v9;
        }
LABEL_13:
        int v9 = v8 << 31 >> 31;
        return (char)v9;
      }
      unint64_t v7 = 0;
      uint64_t v10 = v6 + 68;
      while (v5 - 1 != v7)
      {
        int v11 = *v10;
        v10 += 68;
        ++v7;
        if (v11 == a2)
        {
          int v8 = v7 >= v5;
          goto LABEL_10;
        }
      }
    }
    int v8 = 1;
    goto LABEL_13;
  }
  LOBYTE(v9) = 0;
  *a4 = *(unsigned char *)(*(void *)(v4 + 24) + 4);
  *a3 = 1;
  return (char)v9;
}

uint64_t SMCProgramAccumDefaults(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (a1)
  {
    if (!SMCAccumIsSupported(a1))
    {
      LOBYTE(v10) = -6;
      return (char)v10;
    }
    uint64_t v2 = 0;
    uint64_t v3 = 0;
    uint64_t v4 = *(void *)(a1 + 8);
    uint64_t v5 = -1088;
    uint64_t v6 = *(void *)(v4 + 16);
    while (1)
    {
      v23[v3] = *(_DWORD *)(v6 + v5 + 1088);
      v20[v3] = *(unsigned char *)(v6 + v5 + 1092);
      unint64_t v7 = &v21[v2 + 97];
      *unint64_t v7 = 0;
      v7[5] = *(unsigned __int8 *)(v6 + v5 + 1349);
      if (SMCGetTypeDescriptionForNumericType(*(_DWORD *)(v6 + v5 + 1352), (uint64_t)&v21[v2 + 105])) {
        break;
      }
      uint64_t v8 = *(void *)(v4 + 24) + v5;
      v22[v3] = *(_DWORD *)(v8 + 1088);
      v19[v3] = *(unsigned char *)(v8 + 1092);
      int v9 = &v21[v2 + 1];
      *int v9 = 0;
      v9[5] = *(unsigned __int8 *)(v8 + 1349);
      if (SMCGetTypeDescriptionForNumericType(*(_DWORD *)(v8 + 1352), (uint64_t)&v21[v2 + 9])) {
        break;
      }
      ++v3;
      v2 += 24;
      v5 += 272;
      if (!v5)
      {
        int v10 = SMCWriteKeyWithKnownSize((mach_port_t *)a1, 1297307763, 4u, (uint64_t)v20);
        if (!v10)
        {
          int v10 = SMCWriteKeyWithKnownSize((mach_port_t *)a1, 1297307731, 4u, (uint64_t)v19);
          if (!v10)
          {
            *(_WORD *)(a1 + 504) = 0;
            int v10 = programAccumModes(a1);
            if (!v10)
            {
              v21[0] = 3;
              int v10 = SMCWriteKeyWithKnownSize((mach_port_t *)a1, 1297307746, 1u, (uint64_t)v21);
              if (!v10)
              {
                uint64_t v11 = 0;
                uint64_t v12 = a1 + 244;
                *(unsigned char *)(a1 + 467) = 1;
                uint64_t v13 = v22;
                unint64_t v14 = v23;
                do
                {
                  LOBYTE(v10) = 0;
                  int v15 = *v14++;
                  *(_DWORD *)(v12 - 228) = v15;
                  *(_OWORD *)(v12 - 224) = *(_OWORD *)&v21[v11 + 97];
                  *(void *)(v12 - 208) = *(void *)&v21[v11 + 113];
                  int v16 = *v13++;
                  *(_DWORD *)(v12 - 4) = v16;
                  long long v17 = *(_OWORD *)&v21[v11 + 1];
                  *(void *)(v12 + 16) = *(void *)&v21[v11 + 17];
                  *(_OWORD *)uint64_t v12 = v17;
                  v12 += 56;
                  v11 += 24;
                }
                while (v11 != 96);
              }
            }
          }
        }
        return (char)v10;
      }
    }
  }
  LOBYTE(v10) = -1;
  return (char)v10;
}

uint64_t SMCStartAccum(uint64_t a1)
{
  if (a1)
  {
    if (SMCAccumIsSupported(a1))
    {
      if (*(unsigned char *)(a1 + 467))
      {
        char v4 = 1;
        int v2 = SMCWriteKeyWithKnownSize((mach_port_t *)a1, 1297307746, 1u, (uint64_t)&v4);
        if (!v2) {
          *(unsigned char *)(a1 + 468) = 1;
        }
      }
      else
      {
        LOBYTE(v2) = -1;
      }
    }
    else
    {
      LOBYTE(v2) = -6;
    }
  }
  else
  {
    LOBYTE(v2) = -1;
  }
  return (char)v2;
}

uint64_t SMCStopAccum(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1;
  LOBYTE(a1) = -1;
  if (v2 && a2)
  {
    if (SMCAccumIsSupported(v2))
    {
      char v5 = 0;
      LODWORD(a1) = SMCWriteKeyWithKnownSize((mach_port_t *)v2, 1297307746, 1u, (uint64_t)&v5);
      if (!a1)
      {
        *(unsigned char *)(v2 + 468) = 0;
        LOBYTE(a1) = SMCGetAccumStatus(v2, a2);
      }
    }
    else
    {
      LOBYTE(a1) = -6;
    }
  }
  return (char)a1;
}

uint64_t SMCGetAccumStatus(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1;
  uint64_t v24 = *MEMORY[0x263EF8340];
  LOBYTE(a1) = -1;
  if (v2 && a2)
  {
    if (!SMCAccumIsSupported(v2))
    {
      LOBYTE(a1) = -6;
      return (char)a1;
    }
    int v4 = *(unsigned __int8 *)(v2 + 468);
    if (*(unsigned char *)(v2 + 468))
    {
      LOBYTE(v22) = 0;
      LODWORD(a1) = SMCWriteKeyWithKnownSize((mach_port_t *)v2, 1297307746, 1u, (uint64_t)&v22);
      if (a1) {
        return (char)a1;
      }
      *(unsigned char *)(v2 + 468) = 0;
    }
    LODWORD(a1) = SMCReadKey((mach_port_t *)v2, 1297307747, v21, 4u);
    if (!a1)
    {
      uint64_t v5 = 0;
      int v6 = 0;
      do
        int v6 = v21[v5++] | (v6 << 8);
      while (v5 != 4);
      *(_DWORD *)(a2 + 448) = v6;
      LODWORD(a1) = SMCReadKey((mach_port_t *)v2, 1297307715, v21, 4u);
      if (!a1)
      {
        uint64_t v7 = 0;
        int v8 = 0;
        do
          int v8 = v21[v7++] | (v8 << 8);
        while (v7 != 4);
        *(_DWORD *)(a2 + 452) = v8;
        *(_DWORD *)(a2 + 460) = *(unsigned char *)(v2 + 468) == 0;
        *(_WORD *)(a2 + 464) = *(_WORD *)(v2 + 464);
        uint64_t v9 = -224;
        do
        {
          int v10 = (_OWORD *)(a2 + v9 + 224);
          if (*(_DWORD *)(v2 + v9 + 240))
          {
            long long v11 = *(_OWORD *)(v2 + v9 + 240);
            long long v12 = *(_OWORD *)(v2 + v9 + 256);
            long long v13 = *(_OWORD *)(v2 + v9 + 272);
            *(void *)(a2 + v9 + 272) = *(void *)(v2 + v9 + 288);
            *(_OWORD *)(a2 + v9 + 240) = v12;
            *(_OWORD *)(a2 + v9 + 256) = v13;
            _OWORD *v10 = v11;
          }
          else
          {
            *(_DWORD *)int v10 = 0;
          }
          uint64_t v14 = v2 + v9;
          int v15 = (_OWORD *)(a2 + v9 + 448);
          if (*(_DWORD *)(v2 + v9 + 464))
          {
            long long v17 = *(_OWORD *)(v14 + 464);
            long long v18 = *(_OWORD *)(v14 + 480);
            uint64_t v16 = v14 + 464;
            long long v19 = *(_OWORD *)(v16 + 32);
            *(void *)(a2 + v9 + 496) = *(void *)(v16 + 48);
            *(_OWORD *)(a2 + v9 + 464) = v18;
            *(_OWORD *)(a2 + v9 + 480) = v19;
            *int v15 = v17;
          }
          else
          {
            *(_DWORD *)int v15 = 0;
          }
          v9 += 56;
        }
        while (v9);
        LODWORD(a1) = SMCReadKey((mach_port_t *)v2, 1297307748, &v22, 0x20u);
        if (!a1)
        {
          parseAccumOutput(a2, (int *)&v22, 0, 1);
          long long v22 = 0u;
          long long v23 = 0u;
          LODWORD(a1) = SMCReadKey((mach_port_t *)v2, 1297307716, &v22, 0x20u);
          if (!a1)
          {
            parseAccumOutput(a2, (int *)&v22, 0, 2);
            if (*(unsigned char *)(v2 + 466))
            {
              long long v22 = 0u;
              long long v23 = 0u;
              LODWORD(a1) = SMCReadKey((mach_port_t *)v2, 1297307752, &v22, 0x20u);
              if (a1) {
                return (char)a1;
              }
              parseAccumOutput(a2, (int *)&v22, 2, 1);
              long long v22 = 0u;
              long long v23 = 0u;
              LODWORD(a1) = SMCReadKey((mach_port_t *)v2, 1297307720, &v22, 0x20u);
              if (a1) {
                return (char)a1;
              }
              parseAccumOutput(a2, (int *)&v22, 2, 2);
              long long v22 = 0u;
              long long v23 = 0u;
              LODWORD(a1) = SMCReadKey((mach_port_t *)v2, 1297307756, &v22, 0x20u);
              if (a1) {
                return (char)a1;
              }
              parseAccumOutput(a2, (int *)&v22, 1, 1);
              long long v22 = 0u;
              long long v23 = 0u;
              LODWORD(a1) = SMCReadKey((mach_port_t *)v2, 1297307724, &v22, 0x20u);
              if (a1) {
                return (char)a1;
              }
              parseAccumOutput(a2, (int *)&v22, 1, 2);
            }
            if (!v4 || (LODWORD(a1) = SMCStartAccum(v2), !a1)) {
              LOBYTE(a1) = 0;
            }
          }
        }
      }
    }
  }
  return (char)a1;
}

uint64_t parseAccumOutput(uint64_t result, int *a2, int a3, int a4)
{
  uint64_t v12 = result;
  for (uint64_t i = 0; i != 224; i += 56)
  {
    int v14 = *a2++;
    int v24 = v14;
    if (a3 == 2)
    {
      char v15 = *(unsigned char *)(v12 + 465);
      uint64_t v22 = v12 + i;
      if (a4 == 1)
      {
        long long v18 = (double *)(v22 + 40);
        uint64_t v19 = *(void *)(v22 + 12);
        unint64_t v4 = v4 & 0xFFFFFFFF00000000 | *(unsigned int *)(v22 + 20);
        LOBYTE(v20) = v4;
      }
      else
      {
        long long v18 = (double *)(v22 + 264);
        uint64_t v19 = *(void *)(v22 + 236);
        unsigned int v20 = *(_DWORD *)(v22 + 244);
        unint64_t v23 = v23 & 0xFFFFFFFF00000000 | v20;
      }
      goto LABEL_14;
    }
    if (a3 == 1)
    {
      char v15 = *(unsigned char *)(v12 + 465);
      uint64_t v21 = v12 + i;
      if (a4 == 1)
      {
        long long v18 = (double *)(v21 + 48);
        uint64_t v19 = *(void *)(v21 + 12);
        unint64_t v6 = v6 & 0xFFFFFFFF00000000 | *(unsigned int *)(v21 + 20);
        LOBYTE(v20) = v6;
      }
      else
      {
        long long v18 = (double *)(v21 + 272);
        uint64_t v19 = *(void *)(v21 + 236);
        unint64_t v5 = v5 & 0xFFFFFFFF00000000 | *(unsigned int *)(v21 + 244);
        LOBYTE(v20) = v5;
      }
LABEL_14:
      unint64_t v17 = 1;
      goto LABEL_15;
    }
    if (a3) {
      continue;
    }
    char v15 = *(unsigned char *)(v12 + 465);
    uint64_t v16 = v12 + i;
    if (a4 == 1)
    {
      unint64_t v17 = *(unsigned int *)(v12 + 448);
      long long v18 = (double *)(v16 + 32);
      uint64_t v19 = *(void *)(v16 + 12);
      unint64_t v8 = v8 & 0xFFFFFFFF00000000 | *(unsigned int *)(v16 + 20);
      LOBYTE(v20) = v8;
    }
    else
    {
      unint64_t v17 = *(unsigned int *)(v12 + 452);
      long long v18 = (double *)(v16 + 256);
      uint64_t v19 = *(void *)(v16 + 236);
      unint64_t v7 = v7 & 0xFFFFFFFF00000000 | *(unsigned int *)(v16 + 244);
      LOBYTE(v20) = v7;
    }
LABEL_15:
    uint64_t result = SMCParseAccumOutputToNumeric((uint64_t)&v24, v19, v20, v15, v17, v18);
  }
  return result;
}

uint64_t SMCGetAccumStatusFor(uint64_t a1, int a2, double *a3, void *a4)
{
  uint64_t v4 = a1;
  uint64_t v15 = *MEMORY[0x263EF8340];
  LOBYTE(a1) = -1;
  if (v4 && a2 && a3 && a4)
  {
    if (!SMCAccumIsSupported(v4))
    {
      LOBYTE(a1) = -6;
      return (char)a1;
    }
    uint64_t v8 = -224;
    for (uint64_t i = v14; ; i += 4)
    {
      int v10 = *(_DWORD *)(v4 + v8 + 240);
      if (v10 == a2 || *(_DWORD *)(v4 + v8 + 464) == a2) {
        break;
      }
      v8 += 56;
      if (!v8)
      {
        LOBYTE(a1) = -1;
        return (char)a1;
      }
    }
    int v11 = *(unsigned __int8 *)(v4 + 468);
    if (*(unsigned char *)(v4 + 468))
    {
      v14[0] = 0;
      LODWORD(a1) = SMCWriteKeyWithKnownSize((mach_port_t *)v4, 1297307746, 1u, (uint64_t)v14);
      if (a1) {
        return (char)a1;
      }
      *(unsigned char *)(v4 + 468) = 0;
    }
    if (v10 == a2)
    {
      LODWORD(a1) = SMCReadKey((mach_port_t *)v4, 1297307747, a4, 4u);
      if (a1) {
        return (char)a1;
      }
      LODWORD(a1) = SMCReadKey((mach_port_t *)v4, 1297307748, v14, 0x20u);
      if (a1) {
        return (char)a1;
      }
      uint64_t v12 = (int *)(v4 + v8 + 252);
    }
    else
    {
      LODWORD(a1) = SMCReadKey((mach_port_t *)v4, 1297307715, a4, 4u);
      if (a1) {
        return (char)a1;
      }
      LODWORD(a1) = SMCReadKey((mach_port_t *)v4, 1297307716, v14, 0x20u);
      if (a1) {
        return (char)a1;
      }
      uint64_t v12 = (int *)(v4 + v8 + 476);
    }
    LODWORD(a1) = SMCParseBytesForNumeric(i, 4u, a3, v12);
    if (v11 && !a1) {
      LOBYTE(a1) = SMCStartAccum(v4);
    }
  }
  return (char)a1;
}

__CFDictionary *SMCCreateAccumProgrammableChannelsDict1ms(uint64_t a1)
{
  if (!a1 || !SMCAccumIsSupported(a1)) {
    return 0;
  }
  uint64_t v2 = *(unsigned int *)(*(void *)(a1 + 8) + 32);
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if ((int)v2 >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      int v6 = *(_DWORD *)(*(void *)(*(void *)(a1 + 8) + 16) + v5);
      cStr[0] = HIBYTE(v6);
      cStr[1] = BYTE2(v6);
      cStr[2] = BYTE1(v6);
      cStr[3] = v6;
      cStr[4] = 0;
      CFStringRef v7 = CFStringCreateWithCString(v3, cStr, 0x600u);
      CFDictionaryAddValue(Mutable, v7, @"NULL");
      CFRelease(v7);
      v5 += 272;
    }
    while (272 * v2 != v5);
  }
  return Mutable;
}

__CFDictionary *SMCCreateAccumProgrammableChannelsDict1sec(uint64_t a1)
{
  if (!a1 || !SMCAccumIsSupported(a1)) {
    return 0;
  }
  uint64_t v2 = *(unsigned int *)(*(void *)(a1 + 8) + 36);
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if ((int)v2 >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      int v6 = *(_DWORD *)(*(void *)(*(void *)(a1 + 8) + 24) + v5);
      cStr[0] = HIBYTE(v6);
      cStr[1] = BYTE2(v6);
      cStr[2] = BYTE1(v6);
      cStr[3] = v6;
      cStr[4] = 0;
      CFStringRef v7 = CFStringCreateWithCString(v3, cStr, 0x600u);
      CFDictionaryAddValue(Mutable, v7, @"NULL");
      CFRelease(v7);
      v5 += 272;
    }
    while (272 * v2 != v5);
  }
  return Mutable;
}

uint64_t getSMCQueue()
{
  if (getSMCQueue_SMCQueue_pred != -1) {
    dispatch_once(&getSMCQueue_SMCQueue_pred, &__block_literal_global);
  }
  return getSMCQueue_SMCQueue;
}

dispatch_queue_t __getSMCQueue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("SMC gNotifications", 0);
  getSMCQueue_SMCQueue = (uint64_t)result;
  gSMCClientList = 0;
  return result;
}

void _smcNotificationCallback(uint64_t a1, uint64_t a2, int a3, int a4)
{
  if (getSMCQueue_SMCQueue_pred != -1) {
    dispatch_once(&getSMCQueue_SMCQueue_pred, &__block_literal_global);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)getSMCQueue_SMCQueue);
  for (uint64_t i = gSMCClientList; i; uint64_t i = *(void *)i)
  {
    if (*(unsigned __int8 *)(i + 16) == a3)
    {
      int v7 = *(unsigned __int8 *)(i + 17);
      if (v7 == BYTE2(a4) || v7 == 255)
      {
        uint64_t v8 = _Block_copy(*(const void **)(i + 24));
        uint64_t v9 = *(NSObject **)(i + 32);
        v10[0] = MEMORY[0x263EF8330];
        v10[1] = 0x40000000;
        v10[2] = ___smcNotificationCallback_block_invoke;
        void v10[3] = &unk_264529530;
        v10[4] = v8;
        char v11 = BYTE2(a4);
        char v12 = BYTE1(a4);
        char v13 = a4;
        dispatch_async(v9, v10);
      }
    }
  }
}

void ___smcNotificationCallback_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(const void **)(a1 + 32);

  _Block_release(v2);
}

uint64_t SMCRegisterForSubTypeNotification(const char *a1, char a2, NSObject *a3, const void *a4)
{
  if (!a1 || !a3 || !a4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SMCRegisterForSubTypeNotification_cold_3();
    }
    return 0;
  }
  if (!strcmp(a1, "system-state-notify"))
  {
    char v9 = 112;
  }
  else if (!strcmp(a1, "power-state-notify"))
  {
    char v9 = 113;
  }
  else
  {
    if (strcmp(a1, "hid-event-notify"))
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        SMCRegisterForSubTypeNotification_cold_2();
      }
      return 0;
    }
    char v9 = 114;
  }
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2000000000;
  long long v18 = 0;
  long long v18 = malloc_type_calloc(1uLL, 0x28uLL, 0x10A0040CF3D8648uLL);
  if (v16[3])
  {
    int v10 = _Block_copy(a4);
    uint64_t v11 = v16[3];
    *(void *)(v11 + 24) = v10;
    *(void *)(v11 + 32) = a3;
    dispatch_retain(a3);
    uint64_t v12 = v16[3];
    *(unsigned char *)(v12 + 16) = v9;
    *(unsigned char *)(v12 + 17) = a2;
    if (getSMCQueue_SMCQueue_pred != -1) {
      dispatch_once(&getSMCQueue_SMCQueue_pred, &__block_literal_global);
    }
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 0x40000000;
    v14[2] = __SMCRegisterForSubTypeNotification_block_invoke;
    v14[3] = &unk_264529558;
    unsigned char v14[4] = &v15;
    v14[5] = getSMCQueue_SMCQueue;
    dispatch_sync((dispatch_queue_t)getSMCQueue_SMCQueue, v14);
    uint64_t v8 = v16[3];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      SMCRegisterForSubTypeNotification_cold_1();
    }
    uint64_t v8 = 0;
  }
  _Block_object_dispose(&v15, 8);
  return v8;
}

void __SMCRegisterForSubTypeNotification_block_invoke(uint64_t a1)
{
  kern_return_t v8;

  if (!gNotifyPort)
  {
    uint64_t v2 = IONotificationPortCreate(0);
    gNotifyPort = (uint64_t)v2;
    if (!v2)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __SMCRegisterForSubTypeNotification_block_invoke_cold_1();
      }
      goto LABEL_15;
    }
    IONotificationPortSetDispatchQueue(v2, *(dispatch_queue_t *)(a1 + 40));
  }
  uint64_t v3 = gSMCClientList;
  **(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = gSMCClientList;
  if (v3) {
    *(void *)(v3 + 8) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  gSMCClientList = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  *(void *)(gSMCClientList + 8) = &gSMCClientList;
  mach_port_t v4 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v5 = IOServiceMatching("AppleSMC");
  io_service_t MatchingService = IOServiceGetMatchingService(v4, v5);
  if (!MatchingService)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __SMCRegisterForSubTypeNotification_block_invoke_cold_2();
    }
    goto LABEL_15;
  }
  if (!gNotification)
  {
    io_object_t v7 = MatchingService;
    uint64_t v8 = IOServiceAddInterestNotification((IONotificationPortRef)gNotifyPort, MatchingService, "IOGeneralInterest", (IOServiceInterestCallback)_smcNotificationCallback, 0, (io_object_t *)&gNotification);
    IOObjectRelease(v7);
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __SMCRegisterForSubTypeNotification_block_invoke_cold_3();
      }
LABEL_15:
      _unregisterForNotification(*(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    }
  }
}

void _unregisterForNotification(void *a1)
{
  if (getSMCQueue_SMCQueue_pred != -1) {
    dispatch_once(&getSMCQueue_SMCQueue_pred, &__block_literal_global);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)getSMCQueue_SMCQueue);
  if (a1)
  {
    uint64_t v2 = (void *)gSMCClientList;
    if (gSMCClientList)
    {
      do
      {
        if (v2 == a1)
        {
          uint64_t v3 = *a1;
          if (*a1) {
            *(void *)(v3 + 8) = a1[1];
          }
          *(void *)a1[1] = v3;
        }
        uint64_t v2 = (void *)*v2;
      }
      while (v2);
    }
    mach_port_t v4 = (const void *)a1[3];
    if (v4) {
      _Block_release(v4);
    }
    if (!gSMCClientList)
    {
      if (gNotifyPort)
      {
        IONotificationPortDestroy((IONotificationPortRef)gNotifyPort);
        gNotifyPort = 0;
      }
      if (gNotification)
      {
        IOObjectRelease(gNotification);
        gNotification = 0;
      }
    }
    CFDictionaryRef v5 = a1[4];
    if (v5) {
      dispatch_release(v5);
    }
    a1[4] = 0;
    *(_OWORD *)a1 = 0u;
    *((_OWORD *)a1 + 1) = 0u;
    free(a1);
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    _unregisterForNotification_cold_1();
  }
}

uint64_t SMCRegisterForNotification(const char *a1, NSObject *a2, const void *a3)
{
  return SMCRegisterForSubTypeNotification(a1, 255, a2, a3);
}

void SMCUnregisterForNotification(uint64_t a1)
{
  if (getSMCQueue_SMCQueue_pred != -1) {
    dispatch_once(&getSMCQueue_SMCQueue_pred, &__block_literal_global);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __SMCUnregisterForNotification_block_invoke;
  block[3] = &__block_descriptor_tmp_11;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)getSMCQueue_SMCQueue, block);
}

void __SMCUnregisterForNotification_block_invoke(uint64_t a1)
{
}

uint64_t SMCRequestMacOSWakeFromAP(mach_port_t *a1, __int16 a2)
{
  if (a1)
  {
    v4[0] = -32656;
    v4[1] = a2;
    return (char)SMCWriteKeyWithKnownSize(a1, 1313166158, 4u, (uint64_t)v4);
  }
  else
  {
    return -1;
  }
}

uint64_t SMCParseAccumOutputToNumeric(uint64_t result, uint64_t a2, char a3, char a4, unint64_t a5, double *a6)
{
  if (a2)
  {
    if (a2 == 1)
    {
      float v22 = 0.0;
      uint64_t v23 = 3;
      do
        LODWORD(v22) = *(unsigned __int8 *)(result + v23) | (LODWORD(v22) << 8);
      while ((unint64_t)v23--);
      double v12 = v22 / (double)a5;
    }
    else
    {
      if (a2 != 2) {
        SMCParseAccumOutputToNumeric_cold_1();
      }
      uint64_t v6 = 0;
      unint64_t v7 = 0;
      do
        unint64_t v7 = *(unsigned __int8 *)(result + v6++) | (v7 << 8);
      while (v6 != 4);
      unint64_t v8 = v7 / a5;
      unint64_t v9 = v7 % a5;
      int64_t v10 = (v8 & ~(-1 << SBYTE6(a2)) ^ (unint64_t)(1 << (BYTE6(a2) - 1)))
          - (1 << (BYTE6(a2) - 1));
      if ((a2 & 0x100000000) == 0) {
        int64_t v10 = v8;
      }
      BOOL v11 = v10 < 0;
      if ((HIDWORD(a2) & v11) != 0) {
        int64_t v10 = -v10;
      }
      double v12 = (double)(v9 << a4) / (double)a5 / (double)(unint64_t)(1 << a3)
          + (double)(unint64_t)v10
          / (double)(unint64_t)(1 << a3)
          * (double)(unint64_t)(1 << a4);
      if ((HIDWORD(a2) & v11) != 0) {
        double v12 = -v12;
      }
    }
    *a6 = v12;
  }
  else
  {
    uint64_t v13 = 0;
    unint64_t v14 = 0;
    do
      unint64_t v14 = *(unsigned __int8 *)(result + v13++) | (v14 << 8);
    while (v13 != 4);
    unint64_t v15 = (v14 / a5) << a4;
    unint64_t v16 = (v14 % a5) << a4;
    uint64_t v17 = 1 << (BYTE6(a2) - 1);
    int64_t v18 = v15 & ~(-1 << SBYTE6(a2)) ^ (unint64_t)v17;
    BOOL v19 = v18 < v17;
    unint64_t v20 = v18 - v17;
    if (v19) {
      uint64_t v21 = -(uint64_t)v16;
    }
    else {
      uint64_t v21 = v16;
    }
    if ((a2 & 0x100000000) != 0) {
      unint64_t v16 = v21;
    }
    else {
      unint64_t v20 = v15;
    }
    *(void *)a6 = v16 / a5 + v20;
  }
  return result;
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void SMCAEPopulatePlatform_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FB0E000, MEMORY[0x263EF8438], v0, "[%{public}s:%d] 1ms Channel count type failed\n", v1, v2, v3, v4, v5);
}

void SMCAEPopulatePlatform_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FB0E000, MEMORY[0x263EF8438], v0, "[%{public}s:%d] 1s Channel count type failed\n", v1, v2, v3, v4, v5);
}

void SMCAEPopulatePlatform_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FB0E000, MEMORY[0x263EF8438], v0, "[%{public}s:%d] Populate 1s channel info failed\n", v1, v2, v3, v4, v5);
}

void SMCAEPopulatePlatform_cold_4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FB0E000, MEMORY[0x263EF8438], v0, "[%{public}s:%d] Populate 1ms channel info failed\n", v1, v2, v3, v4, v5);
}

void SMCAEPopulatePlatform_cold_5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FB0E000, MEMORY[0x263EF8438], v0, "[%{public}s:%d] Read MSXN key failed\n", v1, v2, v3, v4, v5);
}

void SMCAEPopulatePlatform_cold_6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FB0E000, MEMORY[0x263EF8438], v0, "[%{public}s:%d] Read MSXn key failed\n", v1, v2, v3, v4, v5);
}

void SMCAEPopulatePlatform_cold_7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FB0E000, MEMORY[0x263EF8438], v0, "[%{public}s:%d] Accumulator Exposer not found, so populating legacy config\n", v1, v2, v3, v4, v5);
}

void SMCAEPopulatePlatform_cold_8()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FB0E000, MEMORY[0x263EF8438], v0, "[%{public}s:%d] Read MSXA key failed\n", v1, v2, v3, v4, v5);
}

void SMCAEPopulatePlatform_cold_9()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FB0E000, MEMORY[0x263EF8438], v0, "[%{public}s:%d] Read RPlt failed\n", v1, v2, v3, v4, v5);
}

void SMCAccumGetChannelInfoForKey_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FB0E000, MEMORY[0x263EF8438], v0, "[%{public}s:%d] smcObject is NULL\n", v1, v2, v3, v4, v5);
}

void SMCAccumGetChannelInfoForKey_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FB0E000, MEMORY[0x263EF8438], v0, "[%{public}s:%d] SMC OSAccum is not initialized via SMCOSAccumIsSupported\n", v1, v2, v3, v4, v5);
}

void SMCAccumGetChannelInfoForKey_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FB0E000, MEMORY[0x263EF8438], v0, "[%{public}s:%d] SMC OSAccum 1ms look up table is NULL\n", v1, v2, v3, v4, v5);
}

void SMCAccumGetChannelInfoForKey_cold_4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FB0E000, MEMORY[0x263EF8438], v0, "[%{public}s:%d] SMC OSAccum 1s look up table is NULL\n", v1, v2, v3, v4, v5);
}

void SMCOSAccumIsSupported_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FB0E000, MEMORY[0x263EF8438], v0, "[%{public}s:%d] SMC Accumulator Exposer populate platform failed\n", v1, v2, v3, v4, v5);
}

void SMCAEPopulateChannelInfo_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FB0E000, MEMORY[0x263EF8438], v0, "[%{public}s:%d] Read MSXA key failed: %d\n", v1, v2, v3, v4, v5);
}

void SMCAEPopulateChannelInfo_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FB0E000, MEMORY[0x263EF8438], v0, "[%{public}s:%d] AE fetch request key failed: %d\n", v1, v2, v3, v4, v5);
}

void SMCAEPopulateChannelInfo_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FB0E000, MEMORY[0x263EF8438], v0, "[%{public}s:%d] Read MSXA key failed: %d\n", v1, v2, v3, v4, v5);
}

void SMCAEPopulateChannelInfo_cold_4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FB0E000, MEMORY[0x263EF8438], v0, "[%{public}s:%d] AE fetch request format failed: %d\n", v1, v2, v3, v4, v5);
}

void SMCAEPopulateChannelInfo_cold_5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FB0E000, MEMORY[0x263EF8438], v0, "[%{public}s:%d] Read MSXA key failed: %d\n", v1, v2, v3, v4, v5);
}

void SMCAEPopulateChannelInfo_cold_6()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FB0E000, MEMORY[0x263EF8438], v0, "[%{public}s:%d] AE fetch request size failed: %d\n", v1, v2, v3, v4, v5);
}

void SMCAEPopulateChannelInfo_cold_7()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FB0E000, MEMORY[0x263EF8438], v0, "[%{public}s:%d] Read MSXA key failed: %d\n", v1, v2, v3, v4, v5);
}

void SMCAEPopulateChannelInfo_cold_8()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FB0E000, MEMORY[0x263EF8438], v0, "[%{public}s:%d] AE fetch channel index failed: %d\n", v1, v2, v3, v4, v5);
}

void SMCOpenAppleSMC_cold_1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  *(_DWORD *)uint64_t v2 = 136446978;
  OUTLINED_FUNCTION_0_0();
  *(_DWORD *)&v2[7] = 186;
  v2[9] = 2080;
  uint64_t v3 = "AppleSMC";
  __int16 v4 = v0;
  int v5 = v1;
  _os_log_error_impl(&dword_21FB0E000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "[%{public}s:%d] IOServiceOpen failed with %s: %d\n", (uint8_t *)v2, 0x22u);
}

void SMCOpenAppleSMC_cold_2()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 136446466;
  OUTLINED_FUNCTION_0_0();
  *(_DWORD *)((char *)&v0[3] + 2) = 199;
  _os_log_error_impl(&dword_21FB0E000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "[%{public}s:%d] io_connect_t handle is NULL\n", (uint8_t *)v0, 0x12u);
}

void SMCOpenAppleSMC_cold_3()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 136446722;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_21FB0E000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "[%{public}s:%d] IOConnectCallScalarMethod failed: %d\n", (uint8_t *)v0, 0x18u);
}

void findMaxClientCreatorAndReport_cold_1(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v3 = *(_DWORD *)(a1 + 128);
  int v4 = *(unsigned __int16 *)(a1 + 132);
  int v5 = 136316162;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = v3;
  __int16 v9 = 1024;
  int v10 = v4;
  __int16 v11 = 2080;
  uint64_t v12 = a2;
  __int16 v13 = 1024;
  int v14 = a3;
  _os_log_fault_impl(&dword_21FB0E000, MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT, "'%s' (pid %d) opened %d '%s' user clients (%d total)\n", (uint8_t *)&v5, 0x28u);
}

void SMCCloseAppleSMC_cold_1()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 136446722;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_21FB0E000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "[%{public}s:%d] IOConnectCallScalarMethod failed: %d\n", (uint8_t *)v0, 0x18u);
}

void SMCKextCall_cold_1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 136446978;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  __int16 v2 = v0;
  int v3 = 120;
  _os_log_error_impl(&dword_21FB0E000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "[%{public}s:%d] KeyInfo data size > SMC_MAX_KEY_SIZE [%u > %u]\n", (uint8_t *)v1, 0x1Eu);
}

void SMCOpenConnection_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_21FB0E000, MEMORY[0x263EF8438], v0, "[%{public}s:%d] Unable to allocate: smc_connect_t\n", v1, v2, v3, v4, 2u);
}

void SMCOpenConnection_cold_2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_21FB0E000, MEMORY[0x263EF8438], v0, "[%{public}s:%d] Connection to %s failed\n", v1, v2, v3, v4, 2u);
}

void SMCOpenConnectionWithDefaultService_cold_1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  *(_DWORD *)uint64_t v2 = 136446722;
  OUTLINED_FUNCTION_0_0();
  *(_DWORD *)&v2[7] = 61;
  v2[9] = v0;
  int v3 = v1;
  _os_log_error_impl(&dword_21FB0E000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "[%{public}s:%d] IOMainPort failed: %d\n", (uint8_t *)v2, 0x18u);
}

void SMCCloseConnection_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_21FB0E000, MEMORY[0x263EF8438], v0, "[%{public}s:%d] smcObject is NULL\n", v1, v2, v3, v4, 2u);
}

void SMCConvertNumericToBytes_cold_1(int *a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  int v3 = 136446978;
  uint64_t v4 = "SMCConvertNumericToBytes";
  __int16 v5 = 1024;
  int v6 = 774;
  __int16 v7 = 1024;
  int v8 = v2;
  __int16 v9 = 1024;
  int v10 = a2;
  _os_log_error_impl(&dword_21FB0E000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "[%{public}s:%d] SMCConvertNumericToBytes failed: type: %u, expected bits: %u\n", (uint8_t *)&v3, 0x1Eu);
}

void SMCAccumIsSupported_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_21FB0E000, MEMORY[0x263EF8438], v0, "[%{public}s:%d] SMC Accumulator Exposer populate platform failed\n", v1, v2, v3, v4, 2u);
}

void SMCRegisterForSubTypeNotification_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_21FB0E000, MEMORY[0x263EF8438], v0, "[%{public}s:%d] Unable to allocate: SMCRegInfo\n", v1, v2, v3, v4, 2u);
}

void SMCRegisterForSubTypeNotification_cold_2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_21FB0E000, MEMORY[0x263EF8438], v0, "[%{public}s:%d] Unsupported notification type: %s\n", v1, v2, v3, v4, 2u);
}

void SMCRegisterForSubTypeNotification_cold_3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_21FB0E000, MEMORY[0x263EF8438], v0, "[%{public}s:%d] Invalid input\n", v1, v2, v3, v4, 2u);
}

void __SMCRegisterForSubTypeNotification_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_21FB0E000, MEMORY[0x263EF8438], v0, "[%{public}s:%d] Failed to create notification port\n", v1, v2, v3, v4, 2u);
}

void __SMCRegisterForSubTypeNotification_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_21FB0E000, MEMORY[0x263EF8438], v0, "[%{public}s:%d] Could not find service: %s\n", v1, v2, v3, v4, 2u);
}

void __SMCRegisterForSubTypeNotification_block_invoke_cold_3()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  *(_DWORD *)uint64_t v2 = 136446978;
  OUTLINED_FUNCTION_0_0();
  *(_DWORD *)&v2[7] = 2083;
  v2[9] = 2080;
  uint64_t v3 = "AppleSMC";
  __int16 v4 = v0;
  int v5 = v1;
  _os_log_error_impl(&dword_21FB0E000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "[%{public}s:%d] Failed to register notification with %s: %d\n", (uint8_t *)v2, 0x22u);
}

void _unregisterForNotification_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_21FB0E000, MEMORY[0x263EF8438], v0, "[%{public}s:%d] Input handle is NULL\n", v1, v2, v3, v4, 2u);
}

void SMCParseAccumOutputToNumeric_cold_1()
{
  __assert_rtn("SMCParseAccumOutputToNumeric", "SMCFunctions.c", 1600, "0 == 1");
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

void CFDataDeleteBytes(CFMutableDataRef theData, CFRange range)
{
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x270EE4830](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F38](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F40](*(void *)&connection, *(void *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x270EF47A8](*(void *)&bootstrapPort, mainPort);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x270EF47B8](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x270EF47E0](*(void *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return MEMORY[0x270EF49F8](*(void *)&entry, plane, iterator);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return MEMORY[0x270EF4A08](*(void *)&entry, name);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x270EF4A80](notifyPort, *(void *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDA1C8](*(void *)&task, *(void *)&name);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x270EDB590](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}