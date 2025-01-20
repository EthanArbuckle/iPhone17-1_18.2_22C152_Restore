uint64_t ETLDMCMessageGetNumRanges(unsigned int *a1, int a2)
{
  uint64_t result;

  switch(a2)
  {
    case 0:
      result = a1[4];
      break;
    case 1:
      result = a1[20];
      break;
    case 2:
      result = a1[36];
      break;
    case 3:
      result = a1[52];
      break;
    default:
      _ETLDebugPrint();
      __break(1u);
      JUMPOUT(0x1E45978E8);
  }
  return result;
}

BOOL ETLDMCMessageGetRangeAndMasks(_DWORD *a1, int a2, unsigned int a3, _DWORD *a4, void *a5)
{
  switch(a2)
  {
    case 0:
      v5 = a1 + 4;
      unsigned int v6 = a1[4];
      if (v6 <= a3) {
        return v6 > a3;
      }
      goto LABEL_9;
    case 1:
      v5 = a1 + 20;
      unsigned int v6 = a1[20];
      if (v6 > a3) {
        goto LABEL_9;
      }
      return v6 > a3;
    case 2:
      v5 = a1 + 36;
      unsigned int v6 = a1[36];
      if (v6 <= a3) {
        return v6 > a3;
      }
      goto LABEL_9;
    case 3:
      v5 = a1 + 52;
      unsigned int v6 = a1[52];
      if (v6 <= a3) {
        return v6 > a3;
      }
LABEL_9:
      uint64_t v7 = *((void *)v5 + 1) + 16 * a3;
      *a4 = *(_DWORD *)v7;
      *a5 = *(void *)(v7 + 8);
      return v6 > a3;
    default:
      _ETLDebugPrint();
      __break(1u);
      JUMPOUT(0x1E45979C8);
  }
}

_OWORD *_ETLDMCAllocate()
{
  pthread_once(&_ETLDMCRegisterClassOnce, (void (*)(void))_ETLDMCRegisterClass);
  result = (_OWORD *)_CFRuntimeCreateInstance();
  if (result)
  {
    result[15] = 0u;
    result[16] = 0u;
    result[13] = 0u;
    result[14] = 0u;
    result[11] = 0u;
    result[12] = 0u;
    result[9] = 0u;
    result[10] = 0u;
    result[7] = 0u;
    result[8] = 0u;
    result[5] = 0u;
    result[6] = 0u;
    result[3] = 0u;
    result[4] = 0u;
    result[1] = 0u;
    result[2] = 0u;
  }
  else
  {
    _ETLDebugPrint();
    return 0;
  }
  return result;
}

uint64_t _ETLDMCGetView(uint64_t a1, int a2)
{
  switch(a2)
  {
    case 0:
      uint64_t result = a1 + 16;
      break;
    case 1:
      uint64_t result = a1 + 80;
      break;
    case 2:
      uint64_t result = a1 + 144;
      break;
    case 3:
      uint64_t result = a1 + 208;
      break;
    default:
      _ETLDebugPrint();
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t _ETLDMCRegisterClass()
{
  uint64_t result = _CFRuntimeRegisterClass();
  _ETLDMCHandleTypeID = result;
  return result;
}

void _ETLDMCHandleDestroy(void *a1)
{
  ETLDMCViewFree(a1 + 2);
  ETLDMCViewFree(a1 + 10);
  ETLDMCViewFree(a1 + 18);

  ETLDMCViewFree(a1 + 26);
}

uint64_t ETLLOGParseLogRecord(void *a1, _DWORD *a2, void *a3, _WORD *a4, unsigned __int16 *a5, unsigned int a6, unsigned int *a7)
{
  if (a6 < 0xC) {
    return 0;
  }
  unsigned int v8 = *a5;
  *a7 = v8;
  if (v8 <= a6 && v8 > 0xB)
  {
    if (a1) {
      *a1 = a5 + 6;
    }
    if (a2) {
      *a2 = v8 - 12;
    }
    if (a3) {
      *a3 = *(void *)(a5 + 2);
    }
    if (a4) {
      *a4 = a5[1];
    }
    return 1;
  }
  else
  {
    _ETLDebugPrint();
    return 0;
  }
}

uint64_t ETLLOGParseLogHeader(uint64_t a1, unsigned int *a2, void *a3, _WORD *a4, uint64_t a5, unsigned int a6, _DWORD *a7)
{
  uint64_t result = 0;
  *a7 = 0;
  if (a6 >= 4)
  {
    if (*(unsigned char *)a5 == 16 && (unsigned int v8 = *(unsigned __int16 *)(a5 + 2), *a2 = v8, v8 <= a6) && (*a7 = 4, a6 - 4 >= 0xC))
    {
      *a4 = *(_WORD *)(a5 + 6);
      *a3 = *(void *)(a5 + 8);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t ETLLOGParseLog(char *__str, size_t __size, uint64_t a3, unsigned int a4, _DWORD *a5)
{
  *a5 = 0;
  if (a4 < 4 || *(unsigned char *)a3 != 16)
  {
    unint64_t v6 = 0;
    int v7 = 0;
    unsigned int v5 = 0;
    goto LABEL_6;
  }
  unsigned int v5 = *(unsigned __int16 *)(a3 + 2);
  if (v5 > a4)
  {
    unint64_t v6 = 0;
    int v7 = 0;
LABEL_6:
    int v8 = 0;
    goto LABEL_7;
  }
  int v7 = 4;
  *a5 = 4;
  if (a4 - 4 < 0xC)
  {
    unint64_t v6 = 0;
    goto LABEL_6;
  }
  int v8 = *(unsigned __int16 *)(a3 + 6);
  unint64_t v6 = *(void *)(a3 + 8);
LABEL_7:
  *a5 = v5 + v7;
  unint64_t v9 = 5 * (v6 >> 16)
     + ((unsigned __int16)(((43685 * (unsigned __int16)v6) >> 16)
                                       + ((unsigned __int16)((v6 - ((43685 * (unsigned __int16)v6) >> 16)) & 0xFFFE) >> 1)) >> 13)
     + 2;
  unint64_t v10 = v9 >> 2;
  unint64_t v11 = ((v9 * (unsigned __int128)0x10624DD2F1A9FCuLL) >> 64) + 315964800;
  if (__size >= snprintf(__str, __size, "[%02u:%02u:%02u:%06u: %04x] LOG 0x%02x: ", ((v11 * (unsigned __int128)0x123456789ABCE0uLL) >> 64) % 0x18, v11 / 0x3C- 60* ((unint64_t)((v11 / 0x3C * (unsigned __int128)0x888888888888889uLL) >> 64) >> 1), v11 % 0x3C, 1000* (v10 - 1000 * ((v10 * (unsigned __int128)0x4189374BC6A7F0uLL) >> 64)), v8, v5))TelephonyUtilBinToHex(); {
  return 1;
  }
}

uint64_t ETLDMCEventGetNumRanges(unsigned int *a1, int a2)
{
  switch(a2)
  {
    case 0:
      uint64_t result = a1[10];
      break;
    case 1:
      uint64_t result = a1[26];
      break;
    case 2:
      uint64_t result = a1[42];
      break;
    case 3:
      uint64_t result = a1[58];
      break;
    default:
      _ETLDebugPrint();
      __break(1u);
      JUMPOUT(0x1E4597EFCLL);
  }
  return result;
}

BOOL ETLDMCEventGetRange(_DWORD *a1, int a2, unsigned int a3, _DWORD *a4)
{
  switch(a2)
  {
    case 0:
      v4 = a1 + 4;
      unsigned int v5 = a1[10];
      if (v5 <= a3) {
        return v5 > a3;
      }
      goto LABEL_9;
    case 1:
      v4 = a1 + 20;
      unsigned int v5 = a1[26];
      if (v5 > a3) {
        goto LABEL_9;
      }
      return v5 > a3;
    case 2:
      v4 = a1 + 36;
      unsigned int v5 = a1[42];
      if (v5 <= a3) {
        return v5 > a3;
      }
      goto LABEL_9;
    case 3:
      v4 = a1 + 52;
      unsigned int v5 = a1[58];
      if (v5 <= a3) {
        return v5 > a3;
      }
LABEL_9:
      *a4 = *(_DWORD *)(*((void *)v4 + 4) + 4 * a3);
      return v5 > a3;
    default:
      _ETLDebugPrint();
      __break(1u);
      JUMPOUT(0x1E4597FD0);
  }
}

BOOL ETLDMCLogGetMask(uint64_t a1, int a2, unsigned int a3, void *a4, _DWORD *a5)
{
  switch(a2)
  {
    case 0:
      uint64_t v8 = a1 + 16;
      *a5 = 0;
      if (a3 <= 0xD) {
        goto LABEL_11;
      }
      break;
    case 1:
      uint64_t v8 = a1 + 80;
      *a5 = 0;
      if (a3 <= 0xD) {
        goto LABEL_11;
      }
      break;
    case 2:
      uint64_t v8 = a1 + 144;
      *a5 = 0;
      if (a3 <= 0xD) {
        goto LABEL_11;
      }
      break;
    case 3:
      uint64_t v8 = a1 + 208;
      *a5 = 0;
      if (a3 <= 0xD) {
        goto LABEL_11;
      }
      break;
    default:
      _ETLDebugPrint();
      uint64_t v8 = 0;
      *a5 = 0;
      if (a3 <= 0xD)
      {
LABEL_11:
        uint64_t v9 = *(void *)(v8 + 16);
        if (v9)
        {
          uint64_t v10 = v9 + 16 * a3;
          *a5 = *(_DWORD *)v10;
          *a4 = *(void *)(v10 + 8);
        }
      }
      break;
  }
  return a3 < 0xE;
}

uint64_t ETLDMCLogGetEnabledEquipIDs(void *a1, int a2, _DWORD *a3)
{
  switch(a2)
  {
    case 0:
      v4 = a1 + 2;
      unsigned int v5 = (_DWORD *)a1[4];
      if (v5) {
        goto LABEL_9;
      }
      return 0;
    case 1:
      v4 = a1 + 10;
      unsigned int v5 = (_DWORD *)a1[12];
      if (!v5) {
        return 0;
      }
      goto LABEL_9;
    case 2:
      v4 = a1 + 18;
      unsigned int v5 = (_DWORD *)a1[20];
      if (v5) {
        goto LABEL_9;
      }
      return 0;
    case 3:
      v4 = a1 + 26;
      unsigned int v5 = (_DWORD *)a1[28];
      if (!v5) {
        return 0;
      }
      goto LABEL_9;
    default:
      _ETLDebugPrint();
      v4 = 0;
      unsigned int v5 = (_DWORD *)MEMORY[0x10];
      if (!MEMORY[0x10]) {
        return 0;
      }
LABEL_9:
      if (*v5)
      {
        *a3 = 0;
        unsigned int v5 = (_DWORD *)v4[2];
        uint64_t result = 1;
        if (!v5[4]) {
          goto LABEL_12;
        }
        goto LABEL_11;
      }
      uint64_t result = 0;
      if (v5[4])
      {
LABEL_11:
        a3[result] = 1;
        uint64_t result = (result + 1);
        unsigned int v5 = (_DWORD *)v4[2];
      }
LABEL_12:
      if (v5[8])
      {
        a3[result] = 2;
        uint64_t result = (result + 1);
        unsigned int v5 = (_DWORD *)v4[2];
      }
      if (v5[12])
      {
        a3[result] = 3;
        uint64_t result = (result + 1);
        unsigned int v5 = (_DWORD *)v4[2];
      }
      if (v5[16])
      {
        a3[result] = 4;
        uint64_t result = (result + 1);
        unsigned int v5 = (_DWORD *)v4[2];
      }
      if (v5[20])
      {
        a3[result] = 5;
        uint64_t result = (result + 1);
        unsigned int v5 = (_DWORD *)v4[2];
      }
      if (v5[24])
      {
        a3[result] = 6;
        uint64_t result = (result + 1);
        unsigned int v5 = (_DWORD *)v4[2];
      }
      if (v5[28])
      {
        a3[result] = 7;
        uint64_t result = (result + 1);
        unsigned int v5 = (_DWORD *)v4[2];
      }
      if (v5[32])
      {
        a3[result] = 8;
        uint64_t result = (result + 1);
        unsigned int v5 = (_DWORD *)v4[2];
      }
      if (v5[36])
      {
        a3[result] = 9;
        uint64_t result = (result + 1);
        unsigned int v5 = (_DWORD *)v4[2];
      }
      if (v5[40])
      {
        a3[result] = 10;
        uint64_t result = (result + 1);
        unsigned int v5 = (_DWORD *)v4[2];
      }
      if (v5[44])
      {
        a3[result] = 11;
        uint64_t result = (result + 1);
        unsigned int v5 = (_DWORD *)v4[2];
      }
      if (v5[48])
      {
        a3[result] = 12;
        uint64_t result = (result + 1);
        unsigned int v5 = (_DWORD *)v4[2];
      }
      if (v5[52])
      {
        a3[result] = 13;
        return (result + 1);
      }
      return result;
  }
}

uint64_t ETLDMCLogFilter(void *a1, char a2, unsigned int a3, uint64_t a4, unsigned int a5)
{
  if ((a2 & 1) == 0) {
    goto LABEL_6;
  }
  uint64_t v5 = a1[4];
  if (!v5) {
    goto LABEL_6;
  }
  unsigned int v6 = *(_DWORD *)(v5 + 16 * a3);
  if (v6 >= a5) {
    unsigned int v6 = a5;
  }
  unsigned int v7 = v6 + 7;
  if (v6 + 7 >= 8)
  {
    uint64_t v22 = 0;
    int v8 = 0;
    uint64_t v23 = v7 >> 3;
    v24 = (void *)(v5 + 16 * a3 + 8);
    do
    {
      int v25 = *(unsigned __int8 *)(a4 + v22);
      int v26 = *(unsigned __int8 *)(*v24 + v22);
      if ((v26 & v25) != 0)
      {
        *(unsigned char *)(*v24 + v22) = v26 & ~(_BYTE)v25;
        int v8 = 1;
      }
      ++v22;
    }
    while (v23 != v22);
  }
  else
  {
LABEL_6:
    int v8 = 0;
  }
  if ((a2 & 2) == 0)
  {
    if ((a2 & 4) == 0) {
      goto LABEL_9;
    }
LABEL_17:
    uint64_t v14 = a1[20];
    if (!v14) {
      goto LABEL_21;
    }
    unsigned int v15 = *(_DWORD *)(v14 + 16 * a3);
    if (v15 >= a5) {
      unsigned int v15 = a5;
    }
    unsigned int v16 = v15 + 7;
    if (v15 + 7 >= 8)
    {
      uint64_t v32 = 0;
      int v17 = 0;
      uint64_t v33 = v16 >> 3;
      v34 = (void *)(v14 + 16 * a3 + 8);
      do
      {
        int v35 = *(unsigned __int8 *)(a4 + v32);
        int v36 = *(unsigned __int8 *)(*v34 + v32);
        if ((v36 & v35) != 0)
        {
          *(unsigned char *)(*v34 + v32) = v36 & ~(_BYTE)v35;
          int v17 = 1;
        }
        ++v32;
      }
      while (v33 != v32);
    }
    else
    {
LABEL_21:
      int v17 = 0;
    }
    v8 |= v17;
    if ((a2 & 8) == 0) {
      return v8 & 1;
    }
    goto LABEL_23;
  }
  uint64_t v10 = a1[12];
  if (!v10) {
    goto LABEL_15;
  }
  unsigned int v11 = *(_DWORD *)(v10 + 16 * a3);
  if (v11 >= a5) {
    unsigned int v11 = a5;
  }
  unsigned int v12 = v11 + 7;
  if (v11 + 7 >= 8)
  {
    uint64_t v27 = 0;
    int v13 = 0;
    uint64_t v28 = v12 >> 3;
    v29 = (void *)(v10 + 16 * a3 + 8);
    do
    {
      int v30 = *(unsigned __int8 *)(a4 + v27);
      int v31 = *(unsigned __int8 *)(*v29 + v27);
      if ((v31 & v30) != 0)
      {
        *(unsigned char *)(*v29 + v27) = v31 & ~(_BYTE)v30;
        int v13 = 1;
      }
      ++v27;
    }
    while (v28 != v27);
  }
  else
  {
LABEL_15:
    int v13 = 0;
  }
  v8 |= v13;
  if ((a2 & 4) != 0) {
    goto LABEL_17;
  }
LABEL_9:
  if ((a2 & 8) == 0) {
    return v8 & 1;
  }
LABEL_23:
  uint64_t v18 = a1[28];
  if (!v18) {
    return v8 & 1;
  }
  unsigned int v19 = *(_DWORD *)(v18 + 16 * a3);
  if (v19 >= a5) {
    unsigned int v19 = a5;
  }
  unsigned int v20 = v19 + 7;
  if (v19 + 7 >= 8)
  {
    uint64_t v37 = 0;
    int v21 = 0;
    uint64_t v38 = v20 >> 3;
    v39 = (void *)(v18 + 16 * a3 + 8);
    do
    {
      int v40 = *(unsigned __int8 *)(a4 + v37);
      int v41 = *(unsigned __int8 *)(*v39 + v37);
      if ((v41 & v40) != 0)
      {
        *(unsigned char *)(*v39 + v37) = v41 & ~(_BYTE)v40;
        int v21 = 1;
      }
      ++v37;
    }
    while (v38 != v37);
  }
  else
  {
    int v21 = 0;
  }
  return (v8 | v21) & 1;
}

uint64_t ETLDMCLogGetDefaultFilters(void *a1)
{
  if (_MergedGlobals != -1) {
    dispatch_once(&_MergedGlobals, &__block_literal_global);
  }
  *a1 = &dword_1EAE52758;
  return 2;
}

double __ETLDMCLogGetDefaultFilters_block_invoke()
{
  dword_1EAE52758 = 1;
  v0 = malloc(0x123uLL);
  qword_1EAE52760 = (uint64_t)v0;
  _OWORD *v0 = 0u;
  v0[1] = 0u;
  v0[2] = 0u;
  v0[3] = 0u;
  v0[4] = 0u;
  v0[5] = 0u;
  v0[6] = 0u;
  v0[7] = 0u;
  v0[8] = 0u;
  v0[9] = 0u;
  v0[10] = 0u;
  v0[11] = 0u;
  v0[12] = 0u;
  v0[13] = 0u;
  v0[14] = 0u;
  v0[15] = 0u;
  v0[16] = 0u;
  v0[17] = 0u;
  *((_WORD *)v0 + 144) = 0;
  *((unsigned char *)v0 + 1) = 6;
  *((unsigned char *)v0 + 118) = 3;
  *((unsigned char *)v0 + 154) = 7;
  *((_WORD *)v0 + 88) = 3136;
  *((unsigned char *)v0 + 256) = 48;
  *((unsigned char *)v0 + 290) = 48;
  dword_1EAE52768 = 2325;
  dword_1EAE52770 = 7;
  v1 = (char *)malloc(0x29uLL);
  qword_1EAE52778 = (uint64_t)v1;
  double result = 0.0;
  *(_OWORD *)v1 = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  *(void *)(v1 + 31) = 0;
  *(_WORD *)(v1 + 39) = 6528;
  dword_1EAE52780 = 324;
  return result;
}

uint64_t APPLIB_DIAG_AUDIO_PCM_14Bit_Start_Loopback(char *a1, int a2)
{
  int v3 = 458315;
  __int16 v4 = 1;
  return APPLIB_DIAG_SendRawRequest(a1, a2, &v3, 6);
}

uint64_t APPLIB_DIAG_AUDIO_PCM_14Bit_Stop_Loopback(char *a1, int a2)
{
  int v3 = 458315;
  __int16 v4 = 2;
  return APPLIB_DIAG_SendRawRequest(a1, a2, &v3, 6);
}

uint64_t APPLIB_DIAG_AUDIO_PCM_16Bit_Start_Loopback(char *a1, int a2)
{
  int v3 = 458315;
  __int16 v4 = 3;
  return APPLIB_DIAG_SendRawRequest(a1, a2, &v3, 6);
}

uint64_t APPLIB_DIAG_AUDIO_PCM_16Bit_Stop_Loopback(char *a1, int a2)
{
  int v3 = 458315;
  __int16 v4 = 4;
  return APPLIB_DIAG_SendRawRequest(a1, a2, &v3, 6);
}

uint64_t APPLIB_DIAG_AUDIO_I2S_Start_Loopback(char *a1, int a2)
{
  int v3 = 458315;
  __int16 v4 = 5;
  return APPLIB_DIAG_SendRawRequest(a1, a2, &v3, 6);
}

uint64_t APPLIB_DIAG_AUDIO_I2S_Stop_Loopback(char *a1, int a2)
{
  int v3 = 458315;
  __int16 v4 = 6;
  return APPLIB_DIAG_SendRawRequest(a1, a2, &v3, 6);
}

uint64_t APPLIB_DIAG_AUDIO_PCM_I2S_PASSTHROUGH_Start(char *a1, int a2)
{
  int v3 = 458315;
  __int16 v4 = 7;
  return APPLIB_DIAG_SendRawRequest(a1, a2, &v3, 6);
}

uint64_t APPLIB_DIAG_AUDIO_PCM_I2S_PASSTHROUGH_Stop(char *a1, int a2)
{
  int v3 = 458315;
  __int16 v4 = 8;
  return APPLIB_DIAG_SendRawRequest(a1, a2, &v3, 6);
}

uint64_t APPLIB_DIAG_AUDIO_I2S_PCM_PASSTHROUGH_Start(char *a1, int a2)
{
  int v3 = 458315;
  __int16 v4 = 9;
  return APPLIB_DIAG_SendRawRequest(a1, a2, &v3, 6);
}

uint64_t APPLIB_DIAG_AUDIO_I2S_PCM_PASSTHROUGH_Stop(char *a1, int a2)
{
  int v3 = 458315;
  __int16 v4 = 10;
  return APPLIB_DIAG_SendRawRequest(a1, a2, &v3, 6);
}

uint64_t APPLIB_DIAG_SEND_SMS(_OWORD *a1, int a2, unsigned int a3, int a4, uint64_t a5)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)((char *)a1 + 204) = 0u;
  a1[11] = 0u;
  a1[12] = 0u;
  a1[9] = 0u;
  a1[10] = 0u;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  *(_DWORD *)a1 = 130123;
  *((unsigned char *)a1 + 4) = a2;
  if (a2 >= 1)
  {
    unint64_t v7 = a2 + 1;
    do
    {
      *((unsigned char *)a1 + (v7-- - 2) + 5) = a3 % 0xA;
      a3 /= 0xAu;
    }
    while (v7 > 1);
  }
  *((unsigned char *)a1 + 20) = a4;
  if (a4 >= 1)
  {
    if (a4 < 8 || (unint64_t)a1 - a5 + 21 < 0x20)
    {
      uint64_t v8 = 0;
      goto LABEL_8;
    }
    if (a4 >= 0x20)
    {
      uint64_t v8 = a4 & 0xFFFFFFE0;
      v24 = (long long *)(a5 + 16);
      int v25 = (_OWORD *)((char *)a1 + 37);
      uint64_t v26 = v8;
      do
      {
        long long v27 = *v24;
        *(v25 - 1) = *(v24 - 1);
        *int v25 = v27;
        v24 += 2;
        v25 += 2;
        v26 -= 32;
      }
      while (v26);
      if (v8 == a4) {
        goto LABEL_10;
      }
      if ((a4 & 0x18) == 0)
      {
LABEL_8:
        uint64_t v9 = a4 - v8;
        uint64_t v10 = (char *)a1 + v8 + 21;
        unsigned int v11 = (char *)(a5 + v8);
        do
        {
          char v12 = *v11++;
          *v10++ = v12;
          --v9;
        }
        while (v9);
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
    uint64_t v28 = v8;
    uint64_t v8 = a4 & 0xFFFFFFF8;
    v29 = (uint64_t *)(a5 + v28);
    int v30 = (void *)((char *)a1 + v28 + 21);
    uint64_t v31 = v28 - v8;
    do
    {
      uint64_t v32 = *v29++;
      *v30++ = v32;
      v31 += 8;
    }
    while (v31);
    if (v8 != a4) {
      goto LABEL_8;
    }
  }
LABEL_10:
  uint64_t v13 = a4 + 21;
  int v14 = 8 * v13;
  if (((8 * v13) & 0xFFF8) != 0)
  {
    LOWORD(v15) = -1;
    unsigned int v16 = (char *)a1;
    do
    {
      char v17 = *v16++;
      int v15 = crc_16_l_table[(v17 ^ v15)] ^ ((unsigned __int16)(v15 & 0xFF00) >> 8);
      v14 -= 8;
    }
    while ((_WORD)v14);
    *((unsigned char *)a1 + v13) = ~(_BYTE)v15;
    *((unsigned char *)a1 + a4 + 22) = (unsigned __int16)~(_WORD)v15 >> 8;
    if (a4 > 233) {
      return 0xFFFFFFFFLL;
    }
  }
  else
  {
    *((unsigned char *)a1 + v13) = 0;
    *((unsigned char *)a1 + a4 + 22) = 0;
    if (a4 > 233) {
      return 0xFFFFFFFFLL;
    }
  }
  bzero(__src, 0x800uLL);
  if (a4 < -22)
  {
    int v19 = 0;
  }
  else
  {
    int v19 = 0;
    uint64_t v20 = (a4 + 23);
    int v21 = (unsigned __int8 *)a1;
    do
    {
      int v23 = *v21++;
      char v22 = v23;
      if ((v23 - 125) <= 1)
      {
        __src[v19] = 125;
        v22 ^= 0x20u;
        ++v19;
      }
      __src[v19++] = v22;
      --v20;
    }
    while (v20);
  }
  memcpy(a1, __src, v19);
  uint64_t result = (v19 + 1);
  *((unsigned char *)a1 + v19) = 126;
  return result;
}

uint64_t APPLIB_DIAG_ENABLE_MT_SMS_STORE(unsigned char *a1, unsigned __int8 a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  *(_DWORD *)a1 = 195659;
  int v3 = a2;
  a1[4] = a2;
  __int16 v4 = crc_16_l_table[a2 ^ 0xA4] ^ 0xFF30;
  int v5 = crc_16_l_table[a2 ^ 0xA4] ^ 0x30;
  a1[5] = crc_16_l_table[a2 ^ 0xA4] ^ 0x30;
  int v6 = HIBYTE(v4);
  a1[6] = HIBYTE(v4);
  bzero(v12, 0x7FCuLL);
  int __src = 195659;
  if ((v3 - 125) > 1)
  {
    int v7 = 4;
    v12[0] = v3;
    uint64_t v8 = 5;
    if ((v5 - 125) > 1) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v12[0] = 125;
  int v7 = 5;
  v12[1] = v3 ^ 0x20;
  uint64_t v8 = 6;
  if ((v5 - 125) <= 1)
  {
LABEL_5:
    v12[v8 - 4] = 125;
    LODWORD(v8) = v7 | 2;
    LOBYTE(v5) = v5 ^ 0x20;
  }
LABEL_6:
  v12[v8 - 4] = v5;
  uint64_t v9 = v8 + 1;
  if ((v6 - 125) <= 1)
  {
    v12[v9 - 4] = 125;
    LOBYTE(v6) = v6 ^ 0x20;
    LODWORD(v9) = v8 + 2;
  }
  v12[v9 - 4] = v6;
  memcpy(a1, &__src, v9 + 1);
  a1[v9 + 1] = 126;
  return (v9 + 2);
}

uint64_t APPLIB_DIAG_RECV_MT_SMS(uint64_t a1)
{
  *(_DWORD *)a1 = 261195;
  *(_WORD *)(a1 + 4) = 10627;
  *(unsigned char *)(a1 + 6) = 126;
  return 7;
}

_OWORD *_ETLDMCCreateFromFile(const char *a1, uint64_t a2, int a3, int a4)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  xmlParserCtxtPtr v7 = xmlNewParserCtxt();
  if (v7)
  {
    uint64_t v8 = v7;
    int v9 = open(a1, 4);
    if (v9 < 0)
    {
      char v17 = __error();
      strerror(*v17);
      _ETLDebugPrint();
    }
    else
    {
      int v10 = v9;
      off_t v11 = lseek(v9, 0, 2);
      lseek(v10, 0, 0);
      if (v11 <= 0x200000)
      {
        char v12 = (char *)malloc(v11);
        if (!v12)
        {
          close(v10);
          goto LABEL_16;
        }
        int v13 = TelephonyUtilUnblockableReadToCompletionWithTimeout();
        close(v10);
        if (!v13)
        {
LABEL_16:
          unsigned int v16 = 0;
LABEL_17:
          xmlFreeParserCtxt(v8);
          free(v12);
          return v16;
        }
        if (v11 < 1) {
          goto LABEL_40;
        }
        if (v11 <= 1) {
          uint64_t v14 = 1;
        }
        else {
          uint64_t v14 = v11;
        }
        if (v14 < 8)
        {
          uint64_t v15 = 0;
LABEL_49:
          long long v27 = &v12[v15];
          uint64_t v28 = v14 - v15;
          do
          {
            if (*v27 == 13) {
              *long long v27 = 32;
            }
            ++v27;
            --v28;
          }
          while (v28);
LABEL_40:
          xmlDocPtr Memory = xmlCtxtReadMemory(v8, v12, v11, "", 0, 1);
          if (Memory)
          {
            int v23 = Memory;
            if (!v8->valid)
            {
LABEL_92:
              unsigned int v16 = 0;
              goto LABEL_93;
            }
            unsigned int v16 = _ETLDMCAllocate();
            if (!v16)
            {
LABEL_93:
              xmlFreeDoc(v23);
              goto LABEL_17;
            }
            _ETLDebugPrint();
            xmlNodePtr RootElement = xmlDocGetRootElement(v23);
            if (RootElement)
            {
              xmlNodePtr v25 = RootElement;
              xmlNodePtr v26 = RootElement;
              while (v26->type != XML_ELEMENT_NODE || strcmp("QXDMProfessional", (const char *)v26->name))
              {
                xmlNodePtr v26 = v26->next;
                if (!v26)
                {
                  while (v25->type != XML_ELEMENT_NODE || strcmp("QXDM", (const char *)v25->name))
                  {
                    xmlNodePtr v25 = v25->next;
                    if (!v25) {
                      goto LABEL_90;
                    }
                  }
                  xmlNodePtr v26 = v25;
                  break;
                }
              }
              children = v26->children;
              if (children)
              {
                while (children->type != XML_ELEMENT_NODE || strcmp("Persistence", (const char *)children->name))
                {
                  children = children->next;
                  if (!children) {
                    goto LABEL_90;
                  }
                }
                uint64_t v30 = (uint64_t)children->children;
                if (!v30) {
                  goto LABEL_91;
                }
                switch(a3)
                {
                  case 3:
                    goto LABEL_67;
                  case 1:
                    goto LABEL_69;
                  case 0:
LABEL_67:
                    uint64_t v31 = v16 + 1;
                    if ((_ETLDMCLoadViewFromFile(v16 + 1, "MessagesView", v30, 0) & 1) == 0)
                    {
LABEL_97:
                      ETLDMCViewFree(v31);
                      goto LABEL_91;
                    }
                    if ((a3 | 2) == 3)
                    {
LABEL_69:
                      uint64_t v31 = v16 + 5;
                      if (_ETLDMCLoadViewFromFile(v16 + 5, "LoggingView", v30, 0)) {
                        goto LABEL_70;
                      }
                      goto LABEL_97;
                    }
                    break;
                }
                if ((a3 & 0xFFFFFFFE) != 2) {
                  goto LABEL_94;
                }
LABEL_70:
                while (*(_DWORD *)(v30 + 8) != 1 || strcmp("Displays", *(const char **)(v30 + 16)))
                {
                  uint64_t v30 = *(void *)(v30 + 48);
                  if (!v30) {
                    goto LABEL_94;
                  }
                }
                uint64_t v32 = *(void *)(v30 + 24);
                if (!v32) {
                  goto LABEL_94;
                }
                *(void *)&long long v33 = 0xAAAAAAAAAAAAAAAALL;
                *((void *)&v33 + 1) = 0xAAAAAAAAAAAAAAAALL;
                *(_OWORD *)__str = v33;
                long long v45 = v33;
                long long v42 = v33;
                long long v43 = v33;
                long long v40 = v33;
                long long v41 = v33;
                uint64_t v38 = v16 + 9;
                int v39 = 0;
                while (2)
                {
                  snprintf(__str, 0x20uLL, "%s%u", "Display", v39);
                  uint64_t v34 = v32;
                  while (*(_DWORD *)(v34 + 8) != 1 || strcmp(__str, *(const char **)(v34 + 16)))
                  {
                    uint64_t v34 = *(void *)(v34 + 48);
                    if (!v34) {
                      goto LABEL_94;
                    }
                  }
                  uint64_t v35 = *(void *)(v34 + 24);
                  if (v35)
                  {
                    long long v42 = 0u;
                    long long v43 = 0u;
                    uint64_t v36 = v35;
                    long long v40 = 0u;
                    long long v41 = 0u;
                    while (*(_DWORD *)(v36 + 8) != 1 || strcmp("View", *(const char **)(v36 + 16)))
                    {
                      uint64_t v36 = *(void *)(v36 + 48);
                      if (!v36) {
                        goto LABEL_89;
                      }
                    }
                    if (_ETLDMCLoadViewFromFile(&v40, "View", v35, a4))
                    {
                      char v37 = ETLDMCViewMergeInto((uint64_t)v38, (unsigned int *)&v40);
                      ETLDMCViewFree(&v40);
                      if (v37)
                      {
LABEL_89:
                        ++v39;
                        continue;
                      }
                    }
                    else
                    {
                      ETLDMCViewFree(&v40);
                    }
                    ETLDMCViewFree(v38);
                  }
                  else
                  {
LABEL_94:
                    if (a3 != 3 || (_ETLDMCGenerateMergedView((unsigned int *)v16) & 1) != 0)
                    {
                      _ETLDebugPrint();
                      goto LABEL_93;
                    }
                    ETLDMCViewFree((void *)v16 + 26);
                  }
                  goto LABEL_91;
                }
              }
LABEL_90:
              _ETLDebugPrint();
            }
LABEL_91:
            _ETLDebugPrint();
            CFRelease(v16);
            goto LABEL_92;
          }
          goto LABEL_16;
        }
        uint64_t v15 = v14 & 0x3FFFF8;
        int v19 = v12 + 3;
        uint64_t v20 = v14 & 0xFFFFFFF8;
        while (1)
        {
          int8x8_t v21 = vceq_s8(*(int8x8_t *)(v19 - 3), (int8x8_t)0xD0D0D0D0D0D0D0DLL);
          if (v21.i8[0])
          {
            *(v19 - 3) = 32;
            if ((v21.i8[1] & 1) == 0) {
              goto LABEL_24;
            }
          }
          else if ((v21.i8[1] & 1) == 0)
          {
LABEL_24:
            if (v21.i8[2]) {
              goto LABEL_25;
            }
            goto LABEL_33;
          }
          *(v19 - 2) = 32;
          if (v21.i8[2])
          {
LABEL_25:
            *(v19 - 1) = 32;
            if ((v21.i8[3] & 1) == 0) {
              goto LABEL_26;
            }
            goto LABEL_34;
          }
LABEL_33:
          if ((v21.i8[3] & 1) == 0)
          {
LABEL_26:
            if (v21.i8[4]) {
              goto LABEL_27;
            }
            goto LABEL_35;
          }
LABEL_34:
          *int v19 = 32;
          if (v21.i8[4])
          {
LABEL_27:
            v19[1] = 32;
            if ((v21.i8[5] & 1) == 0) {
              goto LABEL_28;
            }
            goto LABEL_36;
          }
LABEL_35:
          if ((v21.i8[5] & 1) == 0)
          {
LABEL_28:
            if (v21.i8[6]) {
              goto LABEL_29;
            }
            goto LABEL_37;
          }
LABEL_36:
          v19[2] = 32;
          if (v21.i8[6])
          {
LABEL_29:
            v19[3] = 32;
            if (v21.i8[7]) {
              goto LABEL_38;
            }
            goto LABEL_21;
          }
LABEL_37:
          if (v21.i8[7]) {
LABEL_38:
          }
            v19[4] = 32;
LABEL_21:
          v19 += 8;
          v20 -= 8;
          if (!v20)
          {
            if (v15 == v14) {
              goto LABEL_40;
            }
            goto LABEL_49;
          }
        }
      }
      _ETLDebugPrint();
      close(v10);
    }
    char v12 = 0;
    goto LABEL_16;
  }
  _ETLDebugPrint();
  return 0;
}

_OWORD *ETLDMCCreateFromFile(const char *a1, uint64_t a2)
{
  return _ETLDMCCreateFromFile(a1, a2, 3, 0);
}

void ETLDMCFree(void *a1)
{
  ETLDMCViewFree(a1 + 2);
  ETLDMCViewFree(a1 + 10);
  ETLDMCViewFree(a1 + 18);

  ETLDMCViewFree(a1 + 26);
}

const void *ETLDMCMerge(unsigned int *a1, unsigned int *a2)
{
  _ETLDebugPrint();
  __int16 v4 = _ETLDMCAllocate();
  int v5 = v4;
  if (v4
    && (!ETLDMCViewMerge((uint64_t)(v4 + 1), a1 + 4, a2 + 4)
     || !ETLDMCViewMerge((uint64_t)v5 + 80, a1 + 20, a2 + 20)
     || !ETLDMCViewMerge((uint64_t)v5 + 144, a1 + 36, a2 + 36)
     || (ETLDMCViewMerge((uint64_t)v5 + 208, a1 + 52, a2 + 52) & 1) == 0))
  {
    CFRelease(v5);
    return 0;
  }
  return v5;
}

uint64_t ETLDMCAppend(CFTypeRef *a1, unsigned int *cf)
{
  v2 = cf;
  __int16 v4 = (unsigned int *)*a1;
  if (v4)
  {
    uint64_t result = (uint64_t)ETLDMCMerge(v4, cf);
    if (!result) {
      return result;
    }
    v2 = (unsigned int *)result;
    CFRelease(*a1);
  }
  else
  {
    CFRetain(cf);
  }
  *a1 = v2;
  return 1;
}

uint64_t _ETLDMCLoadViewFromFile(_OWORD *a1, char *__s1, uint64_t a3, int a4)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  while (*(_DWORD *)(a3 + 8) != 1 || strcmp(__s1, *(const char **)(a3 + 16)))
  {
    a3 = *(void *)(a3 + 48);
    if (!a3) {
      return 1;
    }
  }
  uint64_t v8 = *(void *)(a3 + 24);
  if (!v8) {
    return 1;
  }
  while (*(_DWORD *)(v8 + 8) != 1 || strcmp("ISVConfig", *(const char **)(v8 + 16)))
  {
    uint64_t v8 = *(void *)(v8 + 48);
    if (!v8) {
      return 1;
    }
  }
  uint64_t v9 = *(void *)(v8 + 24);
  if (!v9) {
    return 1;
  }
  _ETLDebugPrint();
  uint64_t v10 = v9;
  while (*(_DWORD *)(v10 + 8) != 1 || strcmp("EventIDs", *(const char **)(v10 + 16)))
  {
    uint64_t v10 = *(void *)(v10 + 48);
    if (!v10) {
      goto LABEL_31;
    }
  }
  uint64_t v11 = *(void *)(v10 + 24);
  if (v11 && *(_DWORD *)(v11 + 8) == 3)
  {
    v48[0] = *(char **)(v11 + 80);
    v48[1] = 0;
    unsigned int v12 = ETLDMCParserCountTokens(v48, 44);
    unsigned int v13 = v12;
    if (v12)
    {
      uint64_t v14 = (char *)malloc(2 * v12);
      if (v14)
      {
        uint64_t v15 = 0;
        unsigned int v16 = 0;
        int v17 = -1;
        while (1)
        {
          *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
          *(_OWORD *)__str = v18;
          long long v51 = v18;
          if (!ETLDMCParserGetToken((uint64_t)v48, 0x2Cu, __str, 0x20u)) {
            break;
          }
          __endptr = (char *)0xAAAAAAAAAAAAAAAALL;
          int v19 = strtoul(__str, &__endptr, 10);
          unsigned int v20 = *__endptr;
          if (*__endptr)
          {
            if ((v20 & 0x80000000) != 0)
            {
              if (!__maskrune(v20, 0x4000uLL)) {
                break;
              }
            }
            else if ((*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v20 + 60) & 0x4000) == 0)
            {
              break;
            }
          }
          *(_WORD *)&v14[v15] = v19;
          if (v17 != v19) {
            ++v16;
          }
          int v17 = v19 + 1;
          v15 += 2;
          if (2 * v13 == v15) {
            goto LABEL_30;
          }
        }
      }
      free(v14);
      goto LABEL_78;
    }
    unsigned int v16 = 0;
    uint64_t v14 = 0;
LABEL_30:
    int v21 = ETLDMCLoadEventRangesFromEventsArray((uint64_t)a1, (uint64_t)v14, v16, v13);
    free(v14);
    if (!v21) {
      goto LABEL_78;
    }
  }
LABEL_31:
  uint64_t v22 = v9;
  while (*(_DWORD *)(v22 + 8) != 1 || strcmp("MessageLevels", *(const char **)(v22 + 16)))
  {
    uint64_t v22 = *(void *)(v22 + 48);
    if (!v22) {
      goto LABEL_74;
    }
  }
  uint64_t v23 = *(void *)(v22 + 24);
  if (!v23 || *(_DWORD *)(v23 + 8) != 3)
  {
LABEL_74:
    if (!_ETLDMCParseLogCodesInternal(v9, "LogCodes", (uint64_t)a1, a4)
      || !_ETLDMCParseLogCodesInternal(v9, "OTATypes", (uint64_t)a1, 0)
      || (_ETLDMCParseQTraces(v9, (uint64_t)a1) & 1) == 0)
    {
      goto LABEL_78;
    }
    return 1;
  }
  v24 = malloc(0x34000uLL);
  if (!v24) {
    goto LABEL_78;
  }
  xmlNodePtr v25 = v24;
  bzero(v24, 0x34000uLL);
  unsigned int v26 = 0;
  uint64_t v27 = *(void *)(v23 + 80);
  while (1)
  {
    *(void *)&long long v28 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v28 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)__str = v28;
    long long v51 = v28;
    int v29 = *(unsigned __int8 *)(v27 + v26);
    int v30 = v26;
    if (v29 == 44)
    {
LABEL_44:
      unsigned int v32 = v30 + 1;
      int v31 = v30 + 1 - v26;
      unsigned int v26 = v32;
      goto LABEL_47;
    }
    int v31 = 1;
    while (v29)
    {
      int v29 = *(unsigned __int8 *)(v27 + v26 + v31++);
      if (v29 == 44)
      {
        int v30 = v26 + v31 - 1;
        goto LABEL_44;
      }
    }
    if (v31 == 1) {
      break;
    }
    unsigned int v26 = v26 + v31 - 1;
LABEL_47:
    if (!v31) {
      break;
    }
    __strlcpy_chk();
    long long v33 = strchr(__str, 47);
    if (!v33) {
      goto LABEL_62;
    }
    uint64_t v34 = v33;
    *long long v33 = 0;
    v48[0] = (char *)0xAAAAAAAAAAAAAAAALL;
    unsigned int v35 = strtoul(__str, v48, 10);
    unsigned int v36 = *v48[0];
    if (*v48[0])
    {
      if (!((v36 & 0x80000000) != 0
           ? __maskrune(v36, 0x4000uLL)
           : *(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v36 + 60) & 0x4000))
        goto LABEL_62;
    }
    if ((v48[0] = (char *)0xAAAAAAAAAAAAAAAALL, char v38 = strtoul(v34 + 1, v48, 10), (v39 = *v48[0]) != 0)
      && ((v39 & 0x80000000) != 0
        ? (int v40 = __maskrune(v39, 0x4000uLL))
        : (int v40 = *(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v39 + 60) & 0x4000),
          !v40)
      || v35 >> 12 > 0xC)
    {
LABEL_62:
      free(v25);
      goto LABEL_78;
    }
    *((_DWORD *)v25 + v35) |= 1 << v38;
  }
  uint64_t v41 = 0;
  unsigned int v42 = 0;
  int v43 = 0;
  do
  {
    if ((v41 - v43) > 1 || v42 == 0) {
      unsigned int v45 = v42 + 1;
    }
    else {
      unsigned int v45 = v42;
    }
    if (*((_DWORD *)v25 + v41))
    {
      int v43 = v41;
      unsigned int v42 = v45;
    }
    ++v41;
  }
  while (v41 != 53248);
  int MessagesFromMaskArray = ETLDMCViewLoadMessagesFromMaskArray((uint64_t)a1, (uint64_t)v25, v42);
  free(v25);
  if (MessagesFromMaskArray) {
    goto LABEL_74;
  }
LABEL_78:
  _ETLDebugPrint();
  return 0;
}

uint64_t _ETLDMCGenerateMergedView(unsigned int *a1)
{
  v2 = a1 + 52;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  if ((ETLDMCViewMerge((uint64_t)&v11, a1 + 52, a1 + 4) & 1) == 0) {
    goto LABEL_6;
  }
  ETLDMCViewFree(v2);
  long long v3 = v12;
  *(_OWORD *)v2 = v11;
  *((_OWORD *)v2 + 1) = v3;
  long long v4 = v14;
  *((_OWORD *)v2 + 2) = v13;
  *((_OWORD *)v2 + 3) = v4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  if (ETLDMCViewMerge((uint64_t)&v11, v2, a1 + 20))
  {
    ETLDMCViewFree(v2);
    long long v5 = v12;
    *(_OWORD *)v2 = v11;
    *((_OWORD *)v2 + 1) = v5;
    long long v6 = v14;
    *((_OWORD *)v2 + 2) = v13;
    *((_OWORD *)v2 + 3) = v6;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v7 = ETLDMCViewMerge((uint64_t)&v11, v2, a1 + 36);
    if (v7)
    {
      ETLDMCViewFree(v2);
      long long v8 = v12;
      *(_OWORD *)v2 = v11;
      *((_OWORD *)v2 + 1) = v8;
      long long v9 = v14;
      *((_OWORD *)v2 + 2) = v13;
      *((_OWORD *)v2 + 3) = v9;
    }
    else
    {
      ETLDMCViewFree(&v11);
    }
    return v7;
  }
  else
  {
LABEL_6:
    ETLDMCViewFree(&v11);
    return 0;
  }
}

uint64_t _ETLDMCParseQTraces(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  while (*(_DWORD *)(a1 + 8) != 1 || strcmp("QTraces", *(const char **)(a1 + 16)))
  {
    a1 = *(void *)(a1 + 48);
    if (!a1) {
      goto LABEL_10;
    }
  }
  uint64_t v4 = *(void *)(a1 + 24);
  if (!v4 || *(_DWORD *)(v4 + 8) != 3)
  {
LABEL_10:
    _ETLDebugPrint();
    return 1;
  }
  long long v5 = (int16x8_t *)malloc(0x20000uLL);
  if (!v5)
  {
    _ETLDebugPrint();
    return 0;
  }
  long long v6 = v5;
  bzero(v5, 0x20000uLL);
  uint64_t v7 = *(unsigned __int8 **)(v4 + 80);
  *(_OWORD *)__s = 0u;
  long long v27 = 0u;
  int v8 = *v7;
  if (v8 == 44)
  {
    unsigned int v9 = 1;
  }
  else
  {
    unsigned int v9 = 0;
    while (v8)
    {
      int v8 = v7[++v9];
      if (v8 == 44)
      {
        unsigned int v12 = ++v9;
        goto LABEL_19;
      }
    }
    if (!v9) {
      goto LABEL_47;
    }
    unsigned int v12 = v9 + 1;
LABEL_19:
    if (!v12) {
      goto LABEL_47;
    }
  }
  __strlcpy_chk();
  long long v13 = strchr(__s, 47);
  if (!v13) {
    goto LABEL_46;
  }
  long long v14 = v13;
  uint64_t v15 = MEMORY[0x1E4F14390];
  while (1)
  {
    *long long v14 = 0;
    __endptr = (char *)0xAAAAAAAAAAAAAAAALL;
    int v16 = strtoul(__s, &__endptr, 10);
    unsigned int v17 = *__endptr;
    if (*__endptr)
    {
      if ((v17 & 0x80000000) != 0)
      {
        if (!__maskrune(v17, 0x4000uLL)) {
          goto LABEL_46;
        }
      }
      else if ((*(_DWORD *)(v15 + 4 * v17 + 60) & 0x4000) == 0)
      {
        goto LABEL_46;
      }
    }
    __endptr = (char *)0xAAAAAAAAAAAAAAAALL;
    char v18 = strtoul(v14 + 1, &__endptr, 10);
    unsigned int v19 = *__endptr;
    if (*__endptr)
    {
      if ((v19 & 0x80000000) != 0)
      {
        if (!__maskrune(v19, 0x4000uLL)) {
          goto LABEL_46;
        }
      }
      else if ((*(_DWORD *)(v15 + 4 * v19 + 60) & 0x4000) == 0)
      {
        goto LABEL_46;
      }
    }
    v6->i16[v16] |= 1 << v18;
    int v20 = v7[v9];
    int v21 = v9;
    if (v20 != 44) {
      break;
    }
LABEL_37:
    unsigned int v23 = v21 + 1;
    unsigned int v24 = v21 + 1 - v9;
    unsigned int v9 = v23;
    if (!v24) {
      goto LABEL_44;
    }
LABEL_41:
    __strlcpy_chk();
    long long v14 = strchr(__s, 47);
    if (!v14) {
      goto LABEL_46;
    }
  }
  int v22 = 1;
  while (v20)
  {
    int v20 = v7[v9 + v22++];
    if (v20 == 44)
    {
      int v21 = v9 + v22 - 1;
      goto LABEL_37;
    }
  }
  if (v22 != 1)
  {
    unsigned int v9 = v9 + v22 - 1;
    if (v22) {
      goto LABEL_41;
    }
  }
LABEL_44:
  if (ETLDMCViewLoadQTraces(a2, v6, 0x10000u))
  {
    uint64_t v10 = 1;
    goto LABEL_48;
  }
LABEL_46:
  _ETLDebugPrint();
LABEL_47:
  uint64_t v10 = 0;
LABEL_48:
  free(v6);
  return v10;
}

uint64_t _ETLDMCParseLogCodesInternal(uint64_t a1, char *__s1, uint64_t a3, int a4)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  while (*(_DWORD *)(a1 + 8) != 1 || strcmp(__s1, *(const char **)(a1 + 16)))
  {
    a1 = *(void *)(a1 + 48);
    if (!a1) {
      return 1;
    }
  }
  uint64_t v8 = *(void *)(a1 + 24);
  if (!v8 || *(_DWORD *)(v8 + 8) != 3) {
    return 1;
  }
  unsigned int v9 = *(unsigned __int8 **)(v8 + 80);
  *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__s = v10;
  long long v37 = v10;
  int v11 = *v9;
  if (v11 == 44)
  {
    unsigned int v12 = 1;
    goto LABEL_13;
  }
  unsigned int v12 = 0;
  while (v11)
  {
    int v11 = v9[++v12];
    if (v11 == 44)
    {
      if (++v12) {
        goto LABEL_13;
      }
LABEL_21:
      uint64_t result = 0;
      if (a4) {
        goto LABEL_22;
      }
      return result;
    }
  }
  if (!v12 || v12 == -1) {
    goto LABEL_21;
  }
LABEL_13:
  __strlcpy_chk();
  long long v13 = strchr(__s, 47);
  if (v13) {
    *long long v13 = 0;
  }
  __endptr = (char *)0xAAAAAAAAAAAAAAAALL;
  unsigned int v14 = strtoul(__s, &__endptr, 16);
  unsigned int v15 = *__endptr;
  if (*__endptr)
  {
    if ((v15 & 0x80000000) != 0)
    {
      if (!__maskrune(v15, 0x4000uLL)) {
        return 0;
      }
    }
    else if ((*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v15 + 60) & 0x4000) == 0)
    {
      return 0;
    }
  }
  char v18 = *(_OWORD **)(a3 + 16);
  if (!v18)
  {
    char v18 = malloc(0x100uLL);
    *(void *)(a3 + 16) = v18;
    if (!v18) {
      return 0;
    }
    v18[14] = 0u;
    v18[15] = 0u;
    v18[12] = 0u;
    v18[13] = 0u;
    v18[10] = 0u;
    v18[11] = 0u;
    v18[8] = 0u;
    v18[9] = 0u;
    v18[6] = 0u;
    v18[7] = 0u;
    v18[4] = 0u;
    v18[5] = 0u;
    v18[2] = 0u;
    v18[3] = 0u;
    *char v18 = 0u;
    v18[1] = 0u;
  }
  if (v14 >> 13 > 6) {
    return 0;
  }
  unsigned int v19 = &v18[v14 >> 12];
  int v20 = (_OWORD *)*((void *)v19 + 1);
  if (v20) {
    goto LABEL_40;
  }
  int v20 = malloc(0x200uLL);
  *((void *)v19 + 1) = v20;
  if (!v20) {
    return 0;
  }
  v20[30] = 0u;
  v20[31] = 0u;
  v20[28] = 0u;
  v20[29] = 0u;
  v20[26] = 0u;
  v20[27] = 0u;
  v20[24] = 0u;
  v20[25] = 0u;
  v20[22] = 0u;
  v20[23] = 0u;
  v20[20] = 0u;
  v20[21] = 0u;
  v20[18] = 0u;
  v20[19] = 0u;
  v20[16] = 0u;
  v20[17] = 0u;
  v20[14] = 0u;
  v20[15] = 0u;
  v20[12] = 0u;
  v20[13] = 0u;
  v20[10] = 0u;
  v20[11] = 0u;
  v20[8] = 0u;
  v20[9] = 0u;
  v20[6] = 0u;
  v20[7] = 0u;
  v20[4] = 0u;
  v20[5] = 0u;
  v20[2] = 0u;
  v20[3] = 0u;
  *int v20 = 0u;
  v20[1] = 0u;
LABEL_40:
  unint64_t v21 = v14 & 0xFFF;
  *((unsigned char *)v20 + (v21 >> 3)) |= 1 << (v14 & 7);
  if (v21 >= *(_DWORD *)v19) {
    *(_DWORD *)unsigned int v19 = v21 + 1;
  }
  while (1)
  {
    *(void *)&long long v22 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)__s = v22;
    long long v37 = v22;
    int v23 = v9[v12];
    int v24 = v12;
    if (v23 != 44) {
      break;
    }
LABEL_47:
    unsigned int v26 = v24 + 1;
    unsigned int v27 = v24 + 1 - v12;
    unsigned int v12 = v26;
    if (!v27) {
      goto LABEL_68;
    }
LABEL_51:
    __strlcpy_chk();
    uint64_t v28 = strchr(__s, 47);
    if (v28) {
      *uint64_t v28 = 0;
    }
    __endptr = (char *)0xAAAAAAAAAAAAAAAALL;
    unsigned int v29 = strtoul(__s, &__endptr, 16);
    unsigned int v30 = *__endptr;
    if (*__endptr)
    {
      if ((v30 & 0x80000000) != 0)
      {
        if (!__maskrune(v30, 0x4000uLL)) {
          return 0;
        }
      }
      else if ((*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v30 + 60) & 0x4000) == 0)
      {
        return 0;
      }
    }
    int v31 = *(_OWORD **)(a3 + 16);
    if (!v31)
    {
      int v31 = malloc(0x100uLL);
      *(void *)(a3 + 16) = v31;
      if (!v31) {
        return 0;
      }
      v31[14] = 0u;
      v31[15] = 0u;
      v31[12] = 0u;
      v31[13] = 0u;
      v31[10] = 0u;
      v31[11] = 0u;
      v31[8] = 0u;
      v31[9] = 0u;
      v31[6] = 0u;
      v31[7] = 0u;
      v31[4] = 0u;
      v31[5] = 0u;
      v31[2] = 0u;
      v31[3] = 0u;
      *int v31 = 0u;
      v31[1] = 0u;
    }
    if (v29 >> 13 > 6) {
      return 0;
    }
    unsigned int v32 = &v31[v29 >> 12];
    long long v33 = (_OWORD *)*((void *)v32 + 1);
    if (!v33)
    {
      long long v33 = malloc(0x200uLL);
      *((void *)v32 + 1) = v33;
      if (!v33) {
        return 0;
      }
      v33[30] = 0u;
      v33[31] = 0u;
      v33[28] = 0u;
      v33[29] = 0u;
      v33[26] = 0u;
      v33[27] = 0u;
      v33[24] = 0u;
      v33[25] = 0u;
      v33[22] = 0u;
      v33[23] = 0u;
      v33[20] = 0u;
      v33[21] = 0u;
      v33[18] = 0u;
      v33[19] = 0u;
      v33[16] = 0u;
      v33[17] = 0u;
      v33[14] = 0u;
      v33[15] = 0u;
      v33[12] = 0u;
      v33[13] = 0u;
      v33[10] = 0u;
      v33[11] = 0u;
      v33[8] = 0u;
      v33[9] = 0u;
      v33[6] = 0u;
      v33[7] = 0u;
      v33[4] = 0u;
      v33[5] = 0u;
      v33[2] = 0u;
      v33[3] = 0u;
      *long long v33 = 0u;
      v33[1] = 0u;
    }
    unint64_t v34 = v29 & 0xFFF;
    *((unsigned char *)v33 + (v34 >> 3)) |= 1 << (v29 & 7);
    if (v34 >= *(_DWORD *)v32) {
      *(_DWORD *)unsigned int v32 = v34 + 1;
    }
  }
  int v25 = 1;
  while (v23)
  {
    int v23 = v9[v12 + v25++];
    if (v23 == 44)
    {
      int v24 = v12 + v25 - 1;
      goto LABEL_47;
    }
  }
  if (v25 != 1)
  {
    unsigned int v12 = v12 + v25 - 1;
    if (v25) {
      goto LABEL_51;
    }
  }
LABEL_68:
  uint64_t result = 1;
  if (!a4) {
    return result;
  }
LABEL_22:
  uint64_t v17 = *(void *)(a3 + 16);
  if (v17) {
    goto LABEL_25;
  }
  uint64_t result = (uint64_t)malloc(0x100uLL);
  *(void *)(a3 + 16) = result;
  if (result)
  {
    uint64_t v17 = result;
    *(_OWORD *)(result + 224) = 0u;
    *(_OWORD *)(result + 240) = 0u;
    *(_OWORD *)(result + 192) = 0u;
    *(_OWORD *)(result + 208) = 0u;
    *(_OWORD *)(result + 160) = 0u;
    *(_OWORD *)(result + 176) = 0u;
    *(_OWORD *)(result + 128) = 0u;
    *(_OWORD *)(result + 144) = 0u;
    *(_OWORD *)(result + 96) = 0u;
    *(_OWORD *)(result + 112) = 0u;
    *(_OWORD *)(result + 64) = 0u;
    *(_OWORD *)(result + 80) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)uint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
LABEL_25:
    uint64_t result = *(void *)(v17 + 24);
    if (!result)
    {
      uint64_t result = (uint64_t)malloc(0x200uLL);
      *(void *)(v17 + 24) = result;
      if (result)
      {
        *(_OWORD *)(result + 480) = 0u;
        *(_OWORD *)(result + 496) = 0u;
        *(_OWORD *)(result + 448) = 0u;
        *(_OWORD *)(result + 464) = 0u;
        *(_OWORD *)(result + 416) = 0u;
        *(_OWORD *)(result + 432) = 0u;
        *(_OWORD *)(result + 384) = 0u;
        *(_OWORD *)(result + 400) = 0u;
        *(_OWORD *)(result + 352) = 0u;
        *(_OWORD *)(result + 368) = 0u;
        *(_OWORD *)(result + 320) = 0u;
        *(_OWORD *)(result + 336) = 0u;
        *(_OWORD *)(result + 288) = 0u;
        *(_OWORD *)(result + 304) = 0u;
        *(_OWORD *)(result + 256) = 0u;
        *(_OWORD *)(result + 272) = 0u;
        *(_OWORD *)(result + 224) = 0u;
        *(_OWORD *)(result + 240) = 0u;
        *(_OWORD *)(result + 192) = 0u;
        *(_OWORD *)(result + 208) = 0u;
        *(_OWORD *)(result + 160) = 0u;
        *(_OWORD *)(result + 176) = 0u;
        *(_OWORD *)(result + 128) = 0u;
        *(_OWORD *)(result + 144) = 0u;
        *(_OWORD *)(result + 96) = 0u;
        *(_OWORD *)(result + 112) = 0u;
        *(_OWORD *)(result + 64) = 0u;
        *(_OWORD *)(result + 80) = 0u;
        *(_OWORD *)(result + 32) = 0u;
        *(_OWORD *)(result + 48) = 0u;
        *(_OWORD *)uint64_t result = 0u;
        *(_OWORD *)(result + 16) = 0u;
        goto LABEL_28;
      }
      return result;
    }
LABEL_28:
    *(unsigned char *)(result + 61) |= 8u;
    if (*(_DWORD *)(v17 + 16) <= 0x1EBu) {
      *(_DWORD *)(v17 + 16) = 492;
    }
    return 1;
  }
  return result;
}

uint64_t APPLIB_LOG_DISABLE(unsigned __int8 *a1, int a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x10)
  {
    bzero(a1, a2);
    *a1 = 115;
    *((_DWORD *)a1 + 1) = 0;
    uint64_t v5 = a1[1];
    unsigned __int16 v6 = crc_16_l_table[v5 ^ 0x9B];
    int v7 = a1[2];
    unsigned int v8 = crc_16_l_table[(v7 ^ v6) ^ 0x4E];
    int v9 = a1[3];
    unsigned int v10 = crc_16_l_table[(v9 ^ v8 ^ HIBYTE(v6))];
    unsigned int v11 = crc_16_l_table[v10 ^ (v8 >> 8)];
    unsigned int v12 = crc_16_l_table[v11 ^ (v10 >> 8)];
    unsigned int v13 = crc_16_l_table[v12 ^ (v11 >> 8)];
    int v14 = crc_16_l_table[crc_16_l_table[v12 ^ (v11 >> 8)] ^ (v12 >> 8)];
    int v15 = v14 ^ ~(v13 >> 8);
    *((_WORD *)a1 + 4) = v14 ^ ~HIBYTE(crc_16_l_table[v12 ^ (v11 >> 8)]);
    if (a2 >= 20)
    {
      bzero(v25, 0x7FFuLL);
      char __src = 115;
      if ((v5 - 125) > 1)
      {
        unsigned int v16 = 1;
      }
      else
      {
        v25[0] = 125;
        LOBYTE(v5) = v5 ^ 0x20;
        unsigned int v16 = 2;
      }
      v25[v16 - 1] = v5;
      uint64_t v17 = v16 + 1;
      if ((v7 - 125) <= 1)
      {
        v25[v17 - 1] = 125;
        LODWORD(v17) = v16 + 2;
        LOBYTE(v7) = v7 ^ 0x20;
      }
      int v18 = ~(v14 ^ BYTE1(v13));
      v25[v17 - 1] = v7;
      uint64_t v19 = v17 + 1;
      if ((v9 - 125) <= 1)
      {
        v25[v19 - 1] = 125;
        LOBYTE(v9) = v9 ^ 0x20;
        LODWORD(v19) = v17 + 2;
      }
      char v20 = (unsigned __int16)(v14 ^ ~(unsigned __int16)(v13 >> 8)) >> 8;
      unint64_t v21 = &v25[v19 - 1];
      *unint64_t v21 = v9;
      *(_DWORD *)(v21 + 1) = 0;
      uint64_t v22 = v19 + 5;
      if ((v18 - 125) <= 1)
      {
        v25[v22 - 1] = 125;
        LOBYTE(v18) = v18 ^ 0x20;
        LODWORD(v22) = v19 + 6;
      }
      v25[v22 - 1] = v18;
      uint64_t v23 = v22 + 1;
      if (BYTE1(v15) - 125 <= 1)
      {
        v25[v23 - 1] = 125;
        char v20 = BYTE1(v15) ^ 0x20;
        LODWORD(v23) = v22 + 2;
      }
      v25[v23 - 1] = v20;
      memcpy(a1, &__src, v23 + 1);
      uint64_t result = (v23 + 2);
      a1[v23 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_FTM_LOG_ENABLE(unsigned __int8 *a1, int a2, __int16 a3, int a4, int a5)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x1F)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 592715;
    *((_WORD *)a1 + 5) = a3;
    *((_DWORD *)a1 + 3) = a4;
    *((_DWORD *)a1 + 4) = a5;
    unsigned __int16 v11 = crc_16_l_table[a1[4] ^ 0x3DLL];
    unsigned __int16 v12 = crc_16_l_table[a1[5] ^ 0x2B ^ v11];
    unsigned __int16 v13 = crc_16_l_table[(a1[6] ^ v12 ^ HIBYTE(v11))];
    unsigned __int16 v14 = crc_16_l_table[(a1[7] ^ v13 ^ HIBYTE(v12))];
    unsigned __int16 v15 = crc_16_l_table[(a1[8] ^ v14 ^ HIBYTE(v13))];
    unsigned __int16 v16 = crc_16_l_table[(a1[9] ^ v15 ^ HIBYTE(v14))];
    unsigned __int16 v17 = crc_16_l_table[(a3 ^ v16 ^ HIBYTE(v15))];
    unsigned __int16 v18 = crc_16_l_table[(HIBYTE(a3) ^ v17 ^ HIBYTE(v16))];
    unsigned __int16 v19 = crc_16_l_table[(a4 ^ v18 ^ HIBYTE(v17))];
    unsigned __int16 v20 = crc_16_l_table[(a1[13] ^ v19 ^ HIBYTE(v18))];
    unsigned __int16 v21 = crc_16_l_table[(a1[14] ^ v20 ^ HIBYTE(v19))];
    unsigned __int16 v22 = crc_16_l_table[(a1[15] ^ v21 ^ HIBYTE(v20))];
    unsigned __int16 v23 = crc_16_l_table[(a5 ^ v22 ^ HIBYTE(v21))];
    unsigned __int16 v24 = crc_16_l_table[(a1[17] ^ v23 ^ HIBYTE(v22))];
    unsigned int v25 = crc_16_l_table[(a1[18] ^ v24 ^ HIBYTE(v23))];
    unsigned __int16 v26 = crc_16_l_table[(a1[19] ^ v25 ^ HIBYTE(v24))];
    *((_WORD *)a1 + 10) = v26 ^ ~HIBYTE(crc_16_l_table[(a1[18] ^ v24 ^ HIBYTE(v23))]);
    if (a2 >= 44)
    {
      bzero(__src, 0x800uLL);
      int v27 = *a1;
      if ((v27 - 125) > 1)
      {
        unsigned int v28 = 0;
      }
      else
      {
        __src[0] = 125;
        LOBYTE(v27) = v27 ^ 0x20;
        unsigned int v28 = 1;
      }
      __src[v28] = v27;
      uint64_t v29 = v28 + 1;
      int v30 = a1[1];
      if ((v30 - 125) <= 1)
      {
        __src[v29] = 125;
        LODWORD(v29) = v28 | 2;
        LOBYTE(v30) = v30 ^ 0x20;
      }
      __src[v29] = v30;
      uint64_t v31 = v29 + 1;
      int v32 = a1[2];
      if ((v32 - 125) <= 1)
      {
        __src[v31] = 125;
        LOBYTE(v32) = v32 ^ 0x20;
        LODWORD(v31) = v29 + 2;
      }
      __src[v31] = v32;
      uint64_t v33 = v31 + 1;
      int v34 = a1[3];
      if ((v34 - 125) <= 1)
      {
        __src[v33] = 125;
        LODWORD(v33) = v31 + 2;
        LOBYTE(v34) = v34 ^ 0x20;
      }
      __src[v33] = v34;
      uint64_t v35 = v33 + 1;
      int v36 = a1[4];
      if ((v36 - 125) <= 1)
      {
        __src[v35] = 125;
        LOBYTE(v36) = v36 ^ 0x20;
        LODWORD(v35) = v33 + 2;
      }
      __src[v35] = v36;
      uint64_t v37 = v35 + 1;
      int v38 = a1[5];
      if ((v38 - 125) <= 1)
      {
        __src[v37] = 125;
        LODWORD(v37) = v35 + 2;
        LOBYTE(v38) = v38 ^ 0x20;
      }
      __src[v37] = v38;
      uint64_t v39 = v37 + 1;
      int v40 = a1[6];
      if ((v40 - 125) <= 1)
      {
        __src[v39] = 125;
        LOBYTE(v40) = v40 ^ 0x20;
        LODWORD(v39) = v37 + 2;
      }
      __src[v39] = v40;
      uint64_t v41 = v39 + 1;
      int v42 = a1[7];
      if ((v42 - 125) <= 1)
      {
        __src[v41] = 125;
        LODWORD(v41) = v39 + 2;
        LOBYTE(v42) = v42 ^ 0x20;
      }
      __src[v41] = v42;
      uint64_t v43 = v41 + 1;
      int v44 = a1[8];
      if ((v44 - 125) <= 1)
      {
        __src[v43] = 125;
        LOBYTE(v44) = v44 ^ 0x20;
        LODWORD(v43) = v41 + 2;
      }
      __src[v43] = v44;
      uint64_t v45 = v43 + 1;
      int v46 = a1[9];
      if ((v46 - 125) <= 1)
      {
        __src[v45] = 125;
        LODWORD(v45) = v43 + 2;
        LOBYTE(v46) = v46 ^ 0x20;
      }
      __src[v45] = v46;
      uint64_t v47 = v45 + 1;
      int v48 = a1[10];
      if ((v48 - 125) <= 1)
      {
        __src[v47] = 125;
        LOBYTE(v48) = v48 ^ 0x20;
        LODWORD(v47) = v45 + 2;
      }
      __src[v47] = v48;
      uint64_t v49 = v47 + 1;
      int v50 = a1[11];
      if ((v50 - 125) <= 1)
      {
        __src[v49] = 125;
        LODWORD(v49) = v47 + 2;
        LOBYTE(v50) = v50 ^ 0x20;
      }
      __src[v49] = v50;
      uint64_t v51 = v49 + 1;
      int v52 = a1[12];
      if ((v52 - 125) <= 1)
      {
        __src[v51] = 125;
        LOBYTE(v52) = v52 ^ 0x20;
        LODWORD(v51) = v49 + 2;
      }
      __src[v51] = v52;
      uint64_t v53 = v51 + 1;
      int v54 = a1[13];
      if ((v54 - 125) <= 1)
      {
        __src[v53] = 125;
        LODWORD(v53) = v51 + 2;
        LOBYTE(v54) = v54 ^ 0x20;
      }
      __src[v53] = v54;
      uint64_t v55 = v53 + 1;
      int v56 = a1[14];
      if ((v56 - 125) <= 1)
      {
        __src[v55] = 125;
        LOBYTE(v56) = v56 ^ 0x20;
        LODWORD(v55) = v53 + 2;
      }
      __src[v55] = v56;
      uint64_t v57 = v55 + 1;
      int v58 = a1[15];
      if ((v58 - 125) <= 1)
      {
        __src[v57] = 125;
        LODWORD(v57) = v55 + 2;
        LOBYTE(v58) = v58 ^ 0x20;
      }
      __src[v57] = v58;
      uint64_t v59 = v57 + 1;
      int v60 = a1[16];
      if ((v60 - 125) <= 1)
      {
        __src[v59] = 125;
        LOBYTE(v60) = v60 ^ 0x20;
        LODWORD(v59) = v57 + 2;
      }
      __src[v59] = v60;
      uint64_t v61 = v59 + 1;
      int v62 = a1[17];
      if ((v62 - 125) <= 1)
      {
        __src[v61] = 125;
        LODWORD(v61) = v59 + 2;
        LOBYTE(v62) = v62 ^ 0x20;
      }
      __src[v61] = v62;
      uint64_t v63 = v61 + 1;
      int v64 = a1[18];
      if ((v64 - 125) <= 1)
      {
        __src[v63] = 125;
        LOBYTE(v64) = v64 ^ 0x20;
        LODWORD(v63) = v61 + 2;
      }
      int v65 = ~(v26 ^ BYTE1(v25));
      __src[v63] = v64;
      uint64_t v66 = v63 + 1;
      int v67 = a1[19];
      if ((v67 - 125) <= 1)
      {
        __src[v66] = 125;
        LOBYTE(v67) = v67 ^ 0x20;
        LODWORD(v66) = v63 + 2;
      }
      int v68 = ((unsigned __int16)(v26 ^ ~(unsigned __int16)(v25 >> 8)) >> 8);
      __src[v66] = v67;
      uint64_t v69 = v66 + 1;
      if ((v65 - 125) <= 1)
      {
        __src[v69] = 125;
        LOBYTE(v65) = v65 ^ 0x20;
        LODWORD(v69) = v66 + 2;
      }
      __src[v69] = v65;
      uint64_t v70 = v69 + 1;
      if ((v68 - 125) <= 1)
      {
        __src[v70] = 125;
        LOBYTE(v68) = v68 ^ 0x20;
        LODWORD(v70) = v69 + 2;
      }
      __src[v70] = v68;
      memcpy(a1, __src, v70 + 1);
      uint64_t result = (v70 + 2);
      a1[v70 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_FTM_LOG_DISABLE(unsigned __int8 *a1, int a2, __int16 a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0x1F) {
    return result;
  }
  bzero(a1, a2);
  *(_DWORD *)a1 = 592715;
  a1[4] = 1;
  *((_WORD *)a1 + 5) = a3;
  char v7 = HIBYTE(a3);
  uint64_t v8 = a1[5];
  unsigned __int16 v9 = crc_16_l_table[v8 ^ 0xC4];
  int v10 = a1[6];
  unsigned __int16 v11 = crc_16_l_table[(v10 ^ v9) ^ 0xFB];
  unsigned __int16 v12 = crc_16_l_table[(a1[7] ^ v11 ^ HIBYTE(v9))];
  unsigned __int16 v13 = crc_16_l_table[(a1[8] ^ v12 ^ HIBYTE(v11))];
  unsigned int v14 = crc_16_l_table[(a1[9] ^ v13 ^ HIBYTE(v12))];
  unsigned int v15 = crc_16_l_table[(a3 ^ v14 ^ HIBYTE(v13))];
  int v16 = crc_16_l_table[HIBYTE(a3) ^ crc_16_l_table[(a3 ^ v14 ^ HIBYTE(v13))] ^ (v14 >> 8)];
  int v17 = v16 ^ ~(v15 >> 8);
  *((_WORD *)a1 + 6) = v16 ^ ~HIBYTE(crc_16_l_table[(a3 ^ v14 ^ HIBYTE(v13))]);
  if (a2 < 28) {
    return 0xFFFFFFFFLL;
  }
  bzero(v35, 0x7FBuLL);
  int __src = 592715;
  char v34 = 1;
  if ((v8 - 125) <= 1)
  {
    v35[0] = 125;
    int v18 = 6;
    v35[1] = v8 ^ 0x20;
    uint64_t v19 = 7;
    if ((v10 - 125) > 1) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  int v18 = 5;
  v35[0] = v8;
  uint64_t v19 = 6;
  if ((v10 - 125) <= 1)
  {
LABEL_9:
    *((unsigned char *)&__src + v19) = 125;
    LODWORD(v19) = v18 + 2;
    LOBYTE(v10) = v10 ^ 0x20;
  }
LABEL_10:
  *((unsigned char *)&__src + v19) = v10;
  uint64_t v20 = v19 + 1;
  int v21 = a1[7];
  if ((v21 - 125) <= 1)
  {
    *((unsigned char *)&__src + v20) = 125;
    LOBYTE(v21) = v21 ^ 0x20;
    LODWORD(v20) = v19 + 2;
  }
  *((unsigned char *)&__src + v20) = v21;
  uint64_t v22 = v20 + 1;
  int v23 = a1[8];
  if ((v23 - 125) <= 1)
  {
    *((unsigned char *)&__src + v22) = 125;
    LOBYTE(v23) = v23 ^ 0x20;
    LODWORD(v22) = v20 + 2;
  }
  char v24 = a3;
  *((unsigned char *)&__src + v22) = v23;
  uint64_t v25 = v22 + 1;
  int v26 = a1[9];
  if ((v26 - 125) <= 1)
  {
    *((unsigned char *)&__src + v25) = 125;
    LOBYTE(v26) = v26 ^ 0x20;
    LODWORD(v25) = v22 + 2;
  }
  *((unsigned char *)&__src + v25) = v26;
  uint64_t v27 = v25 + 1;
  if (a3 - 125 <= 1)
  {
    *((unsigned char *)&__src + v27) = 125;
    char v24 = a3 ^ 0x20;
    LODWORD(v27) = v25 + 2;
  }
  int v28 = ~(v16 ^ BYTE1(v15));
  *((unsigned char *)&__src + v27) = v24;
  uint64_t v29 = v27 + 1;
  if (HIBYTE(a3) - 125 <= 1)
  {
    *((unsigned char *)&__src + v29) = 125;
    char v7 = HIBYTE(a3) ^ 0x20;
    LODWORD(v29) = v27 + 2;
  }
  char v30 = (unsigned __int16)(v16 ^ ~(unsigned __int16)(v15 >> 8)) >> 8;
  *((unsigned char *)&__src + v29) = v7;
  uint64_t v31 = v29 + 1;
  if ((v28 - 125) <= 1)
  {
    *((unsigned char *)&__src + v31) = 125;
    LOBYTE(v28) = v28 ^ 0x20;
    LODWORD(v31) = v29 + 2;
  }
  *((unsigned char *)&__src + v31) = v28;
  uint64_t v32 = v31 + 1;
  if (BYTE1(v17) - 125 <= 1)
  {
    *((unsigned char *)&__src + v32) = 125;
    char v30 = BYTE1(v17) ^ 0x20;
    LODWORD(v32) = v31 + 2;
  }
  *((unsigned char *)&__src + v32) = v30;
  memcpy(a1, &__src, v32 + 1);
  uint64_t result = (v32 + 2);
  a1[v32 + 1] = 126;
  return result;
}

uint64_t APPLIB_LOG_GetIds(unsigned __int8 *a1, int a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x10)
  {
    bzero(a1, a2);
    *a1 = 115;
    *((_DWORD *)a1 + 1) = 1;
    uint64_t v5 = a1[1];
    unsigned __int16 v6 = crc_16_l_table[v5 ^ 0x9B];
    int v7 = a1[2];
    unsigned int v8 = crc_16_l_table[(v7 ^ v6) ^ 0x4E];
    int v9 = a1[3];
    unsigned int v10 = crc_16_l_table[(v9 ^ v8 ^ HIBYTE(v6))];
    unsigned int v11 = crc_16_l_table[v10 ^ (v8 >> 8) ^ 1];
    unsigned int v12 = crc_16_l_table[v11 ^ (v10 >> 8)];
    unsigned int v13 = crc_16_l_table[v12 ^ (v11 >> 8)];
    int v14 = crc_16_l_table[crc_16_l_table[v12 ^ (v11 >> 8)] ^ (v12 >> 8)];
    int v15 = v14 ^ ~(v13 >> 8);
    *((_WORD *)a1 + 4) = v14 ^ ~HIBYTE(crc_16_l_table[v12 ^ (v11 >> 8)]);
    if (a2 >= 20)
    {
      bzero(v25, 0x7FFuLL);
      char __src = 115;
      if ((v5 - 125) > 1)
      {
        unsigned int v16 = 1;
      }
      else
      {
        v25[0] = 125;
        LOBYTE(v5) = v5 ^ 0x20;
        unsigned int v16 = 2;
      }
      v25[v16 - 1] = v5;
      uint64_t v17 = v16 + 1;
      if ((v7 - 125) <= 1)
      {
        v25[v17 - 1] = 125;
        LODWORD(v17) = v16 + 2;
        LOBYTE(v7) = v7 ^ 0x20;
      }
      int v18 = ~(v14 ^ BYTE1(v13));
      v25[v17 - 1] = v7;
      uint64_t v19 = v17 + 1;
      if ((v9 - 125) <= 1)
      {
        v25[v19 - 1] = 125;
        LOBYTE(v9) = v9 ^ 0x20;
        LODWORD(v19) = v17 + 2;
      }
      char v20 = (unsigned __int16)(v14 ^ ~(unsigned __int16)(v13 >> 8)) >> 8;
      int v21 = &v25[v19 - 1];
      *int v21 = v9;
      *(_DWORD *)(v21 + 1) = 1;
      uint64_t v22 = v19 + 5;
      if ((v18 - 125) <= 1)
      {
        v25[v22 - 1] = 125;
        LOBYTE(v18) = v18 ^ 0x20;
        LODWORD(v22) = v19 + 6;
      }
      v25[v22 - 1] = v18;
      uint64_t v23 = v22 + 1;
      if (BYTE1(v15) - 125 <= 1)
      {
        v25[v23 - 1] = 125;
        char v20 = BYTE1(v15) ^ 0x20;
        LODWORD(v23) = v22 + 2;
      }
      v25[v23 - 1] = v20;
      memcpy(a1, &__src, v23 + 1);
      uint64_t result = (v23 + 2);
      a1[v23 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_LOG_GetMasks(unsigned __int8 *a1, int a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x10)
  {
    bzero(a1, a2);
    *a1 = 115;
    *((_DWORD *)a1 + 1) = 4;
    uint64_t v5 = a1[1];
    unsigned __int16 v6 = crc_16_l_table[v5 ^ 0x9B];
    int v7 = a1[2];
    unsigned int v8 = crc_16_l_table[(v7 ^ v6) ^ 0x4E];
    int v9 = a1[3];
    unsigned int v10 = crc_16_l_table[(v9 ^ v8 ^ HIBYTE(v6))];
    unsigned int v11 = crc_16_l_table[v10 ^ (v8 >> 8) ^ 4];
    unsigned int v12 = crc_16_l_table[v11 ^ (v10 >> 8)];
    unsigned int v13 = crc_16_l_table[v12 ^ (v11 >> 8)];
    int v14 = crc_16_l_table[crc_16_l_table[v12 ^ (v11 >> 8)] ^ (v12 >> 8)];
    int v15 = v14 ^ ~(v13 >> 8);
    *((_WORD *)a1 + 4) = v14 ^ ~HIBYTE(crc_16_l_table[v12 ^ (v11 >> 8)]);
    if (a2 >= 20)
    {
      bzero(v25, 0x7FFuLL);
      char __src = 115;
      if ((v5 - 125) > 1)
      {
        unsigned int v16 = 1;
      }
      else
      {
        v25[0] = 125;
        LOBYTE(v5) = v5 ^ 0x20;
        unsigned int v16 = 2;
      }
      v25[v16 - 1] = v5;
      uint64_t v17 = v16 + 1;
      if ((v7 - 125) <= 1)
      {
        v25[v17 - 1] = 125;
        LODWORD(v17) = v16 + 2;
        LOBYTE(v7) = v7 ^ 0x20;
      }
      int v18 = ~(v14 ^ BYTE1(v13));
      v25[v17 - 1] = v7;
      uint64_t v19 = v17 + 1;
      if ((v9 - 125) <= 1)
      {
        v25[v19 - 1] = 125;
        LOBYTE(v9) = v9 ^ 0x20;
        LODWORD(v19) = v17 + 2;
      }
      char v20 = (unsigned __int16)(v14 ^ ~(unsigned __int16)(v13 >> 8)) >> 8;
      int v21 = &v25[v19 - 1];
      *int v21 = v9;
      *(_DWORD *)(v21 + 1) = 4;
      uint64_t v22 = v19 + 5;
      if ((v18 - 125) <= 1)
      {
        v25[v22 - 1] = 125;
        LOBYTE(v18) = v18 ^ 0x20;
        LODWORD(v22) = v19 + 6;
      }
      v25[v22 - 1] = v18;
      uint64_t v23 = v22 + 1;
      if (BYTE1(v15) - 125 <= 1)
      {
        v25[v23 - 1] = 125;
        char v20 = BYTE1(v15) ^ 0x20;
        LODWORD(v23) = v22 + 2;
      }
      v25[v23 - 1] = v20;
      memcpy(a1, &__src, v23 + 1);
      uint64_t result = (v23 + 2);
      a1[v23 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_LOG_SetMasks(char *a1, int a2, unsigned int a3, unint64_t a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x10)
  {
    bzero(a1, a2);
    *a1 = 115;
    *((_DWORD *)a1 + 1) = 3;
    *((_DWORD *)a1 + 2) = a4 >> 12;
    *((_DWORD *)a1 + 3) = a3;
    if (a3 >= 8)
    {
      uint64_t v13 = a3 >> 3;
      uint64_t v14 = (a4 >> 3) & 0x1FF;
      do
      {
        if (!v14) {
          a1[((a4 >> 3) & 0x1FF) + 16] = 1 << (a4 & 7);
        }
        --v14;
        --v13;
      }
      while (v13);
    }
    int v9 = 1336;
    LOWORD(v10) = -1;
    unsigned int v11 = a1;
    do
    {
      char v12 = *v11++;
      int v10 = crc_16_l_table[(v12 ^ v10)] ^ ((unsigned __int16)(v10 & 0xFF00) >> 8);
      v9 -= 8;
    }
    while ((_WORD)v9);
    *(_WORD *)(a1 + 167) = ~(_WORD)v10;
    if (a2 >= 338)
    {
      bzero(__src, 0x800uLL);
      uint64_t v15 = 0;
      LODWORD(v16) = 0;
      do
      {
        while (1)
        {
          int v18 = a1[v15];
          if ((v18 - 125) > 1) {
            break;
          }
          int v17 = v16 + 1;
          __src[(int)v16] = 125;
          __src[(int)v16 + 1] = v18 ^ 0x20;
          size_t v16 = (int)v16 + 1 + 1;
          if (++v15 == 169) {
            goto LABEL_16;
          }
        }
        int v17 = v16;
        __src[(int)v16] = v18;
        size_t v16 = (int)v16 + 1;
        ++v15;
      }
      while (v15 != 169);
LABEL_16:
      memcpy(a1, __src, v16);
      uint64_t result = (v17 + 2);
      a1[v16] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_LOG_SetMultipleLogMasks(unsigned __int8 *a1, int a2, int a3, unsigned int a4, int a5, uint64_t a6)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x10)
  {
    bzero(a1, a2);
    *a1 = 115;
    *((_DWORD *)a1 + 1) = 3;
    *((_DWORD *)a1 + 2) = a3;
    *((_DWORD *)a1 + 3) = a4;
    LODWORD(v13) = a4 >> 3;
    if ((a4 & 7) != 0) {
      uint64_t v13 = (v13 + 1);
    }
    else {
      uint64_t v13 = v13;
    }
    if (a5 && v13)
    {
      uint64_t v14 = 0;
      do
      {
        unint64_t v15 = *(unsigned __int16 *)(a6 + 2 * v14);
        uint64_t v16 = (v15 >> 3) & 0x1FF;
        int v17 = 1 << (v15 & 7);
        uint64_t v18 = v16;
        uint64_t v19 = v13;
        do
        {
          if (!v18) {
            a1[v16 + 16] |= v17;
          }
          --v18;
          --v19;
        }
        while (v19);
        ++v14;
      }
      while (v14 != a5);
    }
    uint64_t v20 = v13 + 16;
    int v21 = 8 * (v13 + 16);
    if (8 * ((_WORD)v13 + 16))
    {
      LOWORD(v22) = -1;
      uint64_t v23 = (char *)a1;
      do
      {
        char v24 = *v23++;
        int v22 = crc_16_l_table[(v24 ^ v22)] ^ ((unsigned __int16)(v22 & 0xFF00) >> 8);
        v21 -= 8;
      }
      while ((_WORD)v21);
      a1[v20] = ~(_BYTE)v22;
      a1[v13 + 17] = (unsigned __int16)~(_WORD)v22 >> 8;
      uint64_t result = 0xFFFFFFFFLL;
      if (v13 > 0x3EE) {
        return result;
      }
    }
    else
    {
      a1[v20] = 0;
      a1[v13 + 17] = 0;
      uint64_t result = 0xFFFFFFFFLL;
      if (v13 > 0x3EE) {
        return result;
      }
    }
    uint64_t v25 = (v13 + 18);
    if (2 * (int)v25 <= a2)
    {
      bzero(__src, 0x800uLL);
      uint64_t v26 = 0;
      LODWORD(v27) = 0;
      do
      {
        while (1)
        {
          int v29 = a1[v26];
          if ((v29 - 125) > 1) {
            break;
          }
          int v28 = v27 + 1;
          __src[(int)v27] = 125;
          __src[(int)v27 + 1] = v29 ^ 0x20;
          size_t v27 = (int)v27 + 1 + 1;
          if (v25 == ++v26) {
            goto LABEL_25;
          }
        }
        int v28 = v27;
        __src[(int)v27] = v29;
        size_t v27 = (int)v27 + 1;
        ++v26;
      }
      while (v25 != v26);
LABEL_25:
      memcpy(a1, __src, v27);
      uint64_t result = (v28 + 2);
      a1[v27] = 126;
    }
  }
  return result;
}

uint64_t APPLIB_ParseRDALog(uint64_t a1)
{
  if ((*(_WORD *)(a1 + 16) & 0x1C0) != 0) {
    unsigned int v1 = (((*(_WORD *)(a1 + 16) & 0x38) != 0) | (4 * ((*(_WORD *)(a1 + 16) & 7) != 0))) + 1;
  }
  else {
    unsigned int v1 = ((*(_WORD *)(a1 + 16) & 0x38) != 0) | (4 * ((*(_WORD *)(a1 + 16) & 7) != 0));
  }
  unsigned int v2 = *(unsigned __int8 *)(a1 + 19);
  if (v1 > v2 || (*(unsigned char *)(a1 + 18) & 2) == 0) {
    return 0;
  }
  unsigned int v3 = v2 / v1;
  if (v3 <= 1) {
    unsigned int v3 = 1;
  }
  unsigned int v4 = 0;
  unsigned int v5 = 0;
  if ((*(unsigned char *)(a1 + 18) & 8) != 0)
  {
    if ((*(unsigned char *)(a1 + 18) & 4) != 0)
    {
      uint64_t v11 = a1 + 20;
      do
      {
        unint64_t v12 = *(char *)(v11 + 10);
        if (v12 <= 4)
        {
          v4 += dword_1E45B3D20[v12];
          v5 += *(unsigned __int16 *)(v11 + qword_1E45B3CF8[v12]);
        }
        v11 += 98;
        --v3;
      }
      while (v3);
    }
    else
    {
      uint64_t v9 = a1 + 20;
      do
      {
        unint64_t v10 = *(char *)(v9 + 10);
        if (v10 <= 4)
        {
          v4 += dword_1E45B3D20[v10];
          v5 += *(unsigned __int16 *)(v9 + qword_1E45B3CF8[v10]);
        }
        v9 += 72;
        --v3;
      }
      while (v3);
    }
  }
  else
  {
    uint64_t v6 = 74;
    if ((*(unsigned char *)(a1 + 18) & 4) == 0) {
      uint64_t v6 = 48;
    }
    uint64_t v7 = a1 + 20;
    do
    {
      unint64_t v8 = *(char *)(v7 + 10);
      if (v8 <= 4)
      {
        v4 += dword_1E45B3D20[v8];
        v5 += *(unsigned __int16 *)(v7 + qword_1E45B3CF8[v8]);
      }
      v7 += v6;
      --v3;
    }
    while (v3);
  }
  if (v4) {
    return v5 / v4;
  }
  else {
    return 0;
  }
}

uint64_t APPLIB_DIAG_Unlock(unsigned char *a1, int a2, unsigned __int8 *a3, int a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 13 && a4 == 6)
  {
    bzero(a1, a2);
    *a1 = 65;
    uint64_t v8 = *a3;
    a1[1] = v8;
    int v9 = a3[1];
    a1[2] = v9;
    int v10 = a3[2];
    a1[3] = v10;
    int v11 = a3[3];
    a1[4] = v11;
    int v12 = a3[4];
    a1[5] = v12;
    int v13 = a3[5];
    a1[6] = v13;
    unsigned __int16 v14 = crc_16_l_table[v8 ^ 0xA];
    unsigned __int16 v15 = crc_16_l_table[(v9 ^ v14) ^ 0x5C];
    unsigned __int16 v16 = crc_16_l_table[(v10 ^ v15 ^ HIBYTE(v14))];
    unsigned __int16 v17 = crc_16_l_table[(v11 ^ v16 ^ HIBYTE(v15))];
    unsigned int v18 = crc_16_l_table[(v12 ^ v17 ^ HIBYTE(v16))];
    int v19 = crc_16_l_table[(v13 ^ v18 ^ HIBYTE(v17))];
    int v20 = v19 ^ ~(v18 >> 8);
    a1[7] = v20;
    int v21 = BYTE1(v20);
    a1[8] = v21;
    if (a2 >= 0x12)
    {
      int v32 = v21;
      bzero(v34, 0x7FFuLL);
      char __src = 65;
      if ((v8 - 125) > 1)
      {
        unsigned int v22 = 1;
      }
      else
      {
        v34[0] = 125;
        LOBYTE(v8) = v8 ^ 0x20;
        unsigned int v22 = 2;
      }
      v34[v22 - 1] = v8;
      uint64_t v23 = v22 + 1;
      if ((v9 - 125) <= 1)
      {
        v34[v23 - 1] = 125;
        LODWORD(v23) = v22 + 2;
        LOBYTE(v9) = v9 ^ 0x20;
      }
      v34[v23 - 1] = v9;
      uint64_t v24 = v23 + 1;
      if ((v10 - 125) <= 1)
      {
        v34[v24 - 1] = 125;
        LOBYTE(v10) = v10 ^ 0x20;
        LODWORD(v24) = v23 + 2;
      }
      v34[v24 - 1] = v10;
      uint64_t v25 = v24 + 1;
      if ((v11 - 125) <= 1)
      {
        v34[v25 - 1] = 125;
        LODWORD(v25) = v24 + 2;
        LOBYTE(v11) = v11 ^ 0x20;
      }
      v34[v25 - 1] = v11;
      uint64_t v26 = v25 + 1;
      if ((v12 - 125) <= 1)
      {
        v34[v26 - 1] = 125;
        LOBYTE(v12) = v12 ^ 0x20;
        LODWORD(v26) = v25 + 2;
      }
      int v27 = ~(v19 ^ BYTE1(v18));
      v34[v26 - 1] = v12;
      uint64_t v28 = v26 + 1;
      if ((v13 - 125) <= 1)
      {
        v34[v28 - 1] = 125;
        LOBYTE(v13) = v13 ^ 0x20;
        LODWORD(v28) = v26 + 2;
      }
      v34[v28 - 1] = v13;
      uint64_t v29 = v28 + 1;
      if ((v27 - 125) <= 1)
      {
        v34[v29 - 1] = 125;
        LODWORD(v29) = v28 + 2;
        LOBYTE(v27) = v27 ^ 0x20;
      }
      char v30 = v32;
      v34[v29 - 1] = v27;
      uint64_t v31 = v29 + 1;
      if ((v32 - 125) <= 1)
      {
        v34[v31 - 1] = 125;
        char v30 = v32 ^ 0x20;
        LODWORD(v31) = v29 + 2;
      }
      v34[v31 - 1] = v30;
      memcpy(a1, &__src, v31 + 1);
      uint64_t result = (v31 + 2);
      a1[v31 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_Lock(_WORD *a1, int a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 4)
  {
    bzero(a1, a2);
    *a1 = 11387;
    *((unsigned char *)a1 + 2) = 61;
    if (a2 >= 6)
    {
      *(_DWORD *)a1 = 2117938299;
      return 4;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_CreateICCID_EFS_File(char *a1, int a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a2 < 64) {
    return 0xFFFFFFFFLL;
  }
  long long v4 = 0u;
  long long v5 = 0u;
  memset(v6, 0, sizeof(v6));
  __int16 v3 = 8523;
  BYTE2(v4) = 1;
  BYTE4(v5) = 1;
  BYTE8(v5) = 1;
  BYTE14(v5) = 10;
  qmemcpy(v6, "sim.txt", 7);
  return APPLIB_DIAG_SendRawRequest(a1, a2, &v3, 42);
}

uint64_t APPLIB_DIAG_GetICCID(char *a1, int a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a2 < 64) {
    return 0xFFFFFFFFLL;
  }
  long long v5 = 0u;
  long long v6 = 0u;
  memset(v7, 0, sizeof(v7));
  __int16 v3 = 8576;
  char v4 = 72;
  BYTE1(v5) = 1;
  BYTE5(v5) = 119;
  *(_WORD *)((char *)&v5 + 9) = 4097;
  BYTE11(v6) = 107;
  HIBYTE(v6) = 107;
  v7[7] = 1;
  v7[15] = 10;
  return APPLIB_DIAG_SendRawRequest(a1, a2, &v3, 55);
}

uint64_t APPLIB_DIAG_Read_Meid(char *a1, int a2)
{
  return APPLIB_DIAG_NvItemRead(a1, a2, 1943);
}

uint64_t APPLIB_DIAG_Write_Meid(char *a1, int a2, void *__src, int a4)
{
  if (a4 > 8) {
    return 0xFFFFFFFFLL;
  }
  else {
    return APPLIB_DIAG_NvItemWrite(a1, a2, 1943, __src, a4);
  }
}

uint64_t APPLIB_DIAG_Read_Msl(char *a1, int a2)
{
  return APPLIB_DIAG_NvItemRead(a1, a2, 85);
}

uint64_t APPLIB_DIAG_Write_Msl(char *a1, int a2, void *__src, int a4)
{
  if (a4 > 6) {
    return 0xFFFFFFFFLL;
  }
  else {
    return APPLIB_DIAG_NvItemWrite(a1, a2, 85, __src, a4);
  }
}

uint64_t APPLIB_DIAG_Read_Otksl(char *a1, int a2)
{
  return APPLIB_DIAG_NvItemRead(a1, a2, 85);
}

uint64_t APPLIB_DIAG_Write_Otksl(char *a1, int a2, void *__src, int a4)
{
  if (a4 > 6) {
    return 0xFFFFFFFFLL;
  }
  else {
    return APPLIB_DIAG_NvItemWrite(a1, a2, 219, __src, a4);
  }
}

uint64_t APPLIB_DIAG_Write_AKey(char *a1, int a2, void *__src, int a4)
{
  if (a4 > 9) {
    return 0xFFFFFFFFLL;
  }
  else {
    return APPLIB_DIAG_NvItemWrite(a1, a2, 25, __src, a4);
  }
}

uint64_t APPLIB_DIAG_Write_AKeyCSum(char *a1, int a2, void *__src, int a4)
{
  if (a4 > 8) {
    return 0xFFFFFFFFLL;
  }
  else {
    return APPLIB_DIAG_NvItemWrite(a1, a2, 26, __src, a4);
  }
}

uint64_t APPLIB_DIAG_Write_BlueToothAddr(char *a1, int a2, void *__src, int a4)
{
  if (a4 > 6) {
    return 0xFFFFFFFFLL;
  }
  else {
    return APPLIB_DIAG_NvItemWrite(a1, a2, 50001, __src, a4);
  }
}

uint64_t APPLIB_DIAG_Read_BlueToothAddr(char *a1, int a2)
{
  return APPLIB_DIAG_NvItemRead(a1, a2, 50001);
}

uint64_t APPLIB_DIAG_Write_WiFi_MAC_Addr(char *a1, int a2, void *__src, int a4)
{
  if (a4 > 6) {
    return 0xFFFFFFFFLL;
  }
  else {
    return APPLIB_DIAG_NvItemWrite(a1, a2, 50002, __src, a4);
  }
}

uint64_t APPLIB_DIAG_Read_WiFi_MAC_Addr(char *a1, int a2)
{
  return APPLIB_DIAG_NvItemRead(a1, a2, 50002);
}

uint64_t APPLIB_DIAG_Write_WiFi_Cal_Data(char *a1, int a2, void *__src, int a4)
{
  if (a4 > 64) {
    return 0xFFFFFFFFLL;
  }
  else {
    return APPLIB_DIAG_NvItemWrite(a1, a2, 50003, __src, a4);
  }
}

uint64_t APPLIB_DIAG_Read_WiFi_Cal_Data(char *a1, int a2)
{
  return APPLIB_DIAG_NvItemRead(a1, a2, 50003);
}

uint64_t APPLIB_DIAG_Write_USB2ETHERNET_MAC_Addr(char *a1, int a2, void *__src, int a4)
{
  if (a4 > 6) {
    return 0xFFFFFFFFLL;
  }
  else {
    return APPLIB_DIAG_NvItemWrite(a1, a2, 50004, __src, a4);
  }
}

uint64_t APPLIB_DIAG_Read_USB2ETHERNET_MAC_Addr(char *a1, int a2)
{
  return APPLIB_DIAG_NvItemRead(a1, a2, 50004);
}

uint64_t APPLIB_DIAG_GetSerialNumAndChipID(void *a1, int a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 8)
  {
    bzero(a1, a2);
    *a1 = 0x9B390003000CFE4BLL;
    if (a2 >= 16)
    {
      *a1 = 0x9B390003000CFE4BLL;
      *((unsigned char *)a1 + 8) = 126;
      return 9;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_GetNonce(void *a1, int a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 8)
  {
    bzero(a1, a2);
    *a1 = 0x82E10002000CFE4BLL;
    if (a2 >= 16)
    {
      *a1 = 0x82E10002000CFE4BLL;
      *((unsigned char *)a1 + 8) = 126;
      return 9;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_SfpNvBackup(void *a1, int a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 8)
  {
    bzero(a1, a2);
    *a1 = 0xFC590007000CFE4BLL;
    if (a2 >= 16)
    {
      *a1 = 0xFC590007000CFE4BLL;
      *((unsigned char *)a1 + 8) = 126;
      return 9;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_SfpNvRestore(void *a1, int a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 8)
  {
    bzero(a1, a2);
    *a1 = 0x7F910008000CFE4BLL;
    if (a2 >= 16)
    {
      *a1 = 0x7F910008000CFE4BLL;
      *((unsigned char *)a1 + 8) = 126;
      return 9;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_ReadRootManifest(_DWORD *a1, int a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x17)
  {
    bzero(a1, a2);
    *a1 = 851275;
    a1[1] = 10;
    *((_WORD *)a1 + 4) = 5546;
    if (a2 >= 20)
    {
      *(void *)a1 = 0xA000CFD4BLL;
      *((_WORD *)a1 + 4) = 5546;
      *((unsigned char *)a1 + 10) = 126;
      return 11;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_StartProvision(_WORD *a1, unsigned int a2, const void *a3, unsigned int a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!a1 || 2 * (unint64_t)a4 + 22 >= a2) {
    return 0xFFFFFFFFLL;
  }
  bzero(a1, a2);
  *(_DWORD *)a1 = 851531;
  a1[2] = 0;
  a1[3] = a4;
  memcpy(a1 + 4, a3, a4);
  int v8 = 8 * (a4 + 8);
  if (8 * ((_WORD)a4 + 8))
  {
    LOWORD(v9) = -1;
    int v10 = (char *)a1;
    do
    {
      char v11 = *v10++;
      int v9 = crc_16_l_table[(v11 ^ v9)] ^ ((unsigned __int16)(v9 & 0xFF00) >> 8);
      v8 -= 8;
    }
    while ((_WORD)v8);
    char v12 = ~(_BYTE)v9;
    char v13 = (unsigned __int16)~(_WORD)v9 >> 8;
  }
  else
  {
    char v12 = 0;
    char v13 = 0;
  }
  *((unsigned char *)a1 + a4 + 8) = v12;
  *((unsigned char *)a1 + a4 + 9) = v13;
  uint64_t v15 = a4 + 10;
  uint64_t result = 0xFFFFFFFFLL;
  if ((int)v15 <= 1024 && 2 * (int)v15 <= (int)a2)
  {
    bzero(__src, 0x800uLL);
    if ((int)v15 < 1)
    {
      int v16 = 0;
    }
    else
    {
      int v16 = 0;
      unsigned __int16 v17 = (unsigned __int8 *)a1;
      do
      {
        int v19 = *v17++;
        char v18 = v19;
        if ((v19 - 125) <= 1)
        {
          __src[v16] = 125;
          v18 ^= 0x20u;
          ++v16;
        }
        __src[v16++] = v18;
        --v15;
      }
      while (v15);
    }
    memcpy(a1, __src, v16);
    uint64_t result = (v16 + 1);
    *((unsigned char *)a1 + v16) = 126;
  }
  return result;
}

uint64_t APPLIB_DIAG_FinishProvision(_WORD *a1, unsigned int a2, const void *a3, unsigned int a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!a1 || 2 * (unint64_t)a4 + 22 >= a2) {
    return 0xFFFFFFFFLL;
  }
  bzero(a1, a2);
  *(_DWORD *)a1 = 851531;
  a1[2] = 1;
  a1[3] = a4;
  memcpy(a1 + 4, a3, a4);
  int v8 = 8 * (a4 + 8);
  if (8 * ((_WORD)a4 + 8))
  {
    LOWORD(v9) = -1;
    int v10 = (char *)a1;
    do
    {
      char v11 = *v10++;
      int v9 = crc_16_l_table[(v11 ^ v9)] ^ ((unsigned __int16)(v9 & 0xFF00) >> 8);
      v8 -= 8;
    }
    while ((_WORD)v8);
    char v12 = ~(_BYTE)v9;
    char v13 = (unsigned __int16)~(_WORD)v9 >> 8;
  }
  else
  {
    char v12 = 0;
    char v13 = 0;
  }
  *((unsigned char *)a1 + a4 + 8) = v12;
  *((unsigned char *)a1 + a4 + 9) = v13;
  uint64_t v15 = a4 + 10;
  uint64_t result = 0xFFFFFFFFLL;
  if ((int)v15 <= 1024 && 2 * (int)v15 <= (int)a2)
  {
    bzero(__src, 0x800uLL);
    if ((int)v15 < 1)
    {
      int v16 = 0;
    }
    else
    {
      int v16 = 0;
      unsigned __int16 v17 = (unsigned __int8 *)a1;
      do
      {
        int v19 = *v17++;
        char v18 = v19;
        if ((v19 - 125) <= 1)
        {
          __src[v16] = 125;
          v18 ^= 0x20u;
          ++v16;
        }
        __src[v16++] = v18;
        --v15;
      }
      while (v15);
    }
    memcpy(a1, __src, v16);
    uint64_t result = (v16 + 1);
    *((unsigned char *)a1 + v16) = 126;
  }
  return result;
}

uint64_t APPLIB_DIAG_WriteCalibrationManifest(_WORD *a1, unsigned int a2, const void *a3, unsigned int a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!a1 || 2 * (unint64_t)a4 + 22 >= a2) {
    return 0xFFFFFFFFLL;
  }
  bzero(a1, a2);
  *(_DWORD *)a1 = 851531;
  a1[2] = 6;
  a1[3] = a4;
  memcpy(a1 + 4, a3, a4);
  uint64_t v8 = a4 + 8;
  int v9 = 8 * (a4 + 8);
  if (8 * ((_WORD)a4 + 8))
  {
    LOWORD(v10) = -1;
    char v11 = (char *)a1;
    do
    {
      char v12 = *v11++;
      int v10 = crc_16_l_table[(v12 ^ v10)] ^ ((unsigned __int16)(v10 & 0xFF00) >> 8);
      v9 -= 8;
    }
    while ((_WORD)v9);
    *((unsigned char *)a1 + v8) = ~(_BYTE)v10;
    *((unsigned char *)a1 + a4 + 9) = (unsigned __int16)~(_WORD)v10 >> 8;
    uint64_t result = 0xFFFFFFFFLL;
    if (a4 > 0x3F6) {
      return result;
    }
  }
  else
  {
    *((unsigned char *)a1 + v8) = 0;
    *((unsigned char *)a1 + a4 + 9) = 0;
    uint64_t result = 0xFFFFFFFFLL;
    if (a4 > 0x3F6) {
      return result;
    }
  }
  uint64_t v14 = a4 + 10;
  if (2 * (int)v14 <= (int)a2)
  {
    bzero(__src, 0x800uLL);
    uint64_t v15 = 0;
    LODWORD(v16) = 0;
    do
    {
      while (1)
      {
        int v18 = *((unsigned __int8 *)a1 + v15);
        if ((v18 - 125) > 1) {
          break;
        }
        int v17 = v16 + 1;
        __src[(int)v16] = 125;
        __src[(int)v16 + 1] = v18 ^ 0x20;
        size_t v16 = (int)v16 + 1 + 1;
        if (v14 == ++v15) {
          goto LABEL_16;
        }
      }
      int v17 = v16;
      __src[(int)v16] = v18;
      size_t v16 = (int)v16 + 1;
      ++v15;
    }
    while (v14 != v15);
LABEL_16:
    memcpy(a1, __src, v16);
    uint64_t result = (v17 + 2);
    *((unsigned char *)a1 + v16) = 126;
  }
  return result;
}

uint64_t APPLIB_DIAG_ReadCalibrationBackup(void *a1, int a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x13)
  {
    bzero(a1, a2);
    *a1 = 0xCFE90005000CFE4BLL;
    if (a2 >= 16)
    {
      *a1 = 0xCFE90005000CFE4BLL;
      *((unsigned char *)a1 + 8) = 126;
      return 9;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_BackupCalibrationData(void *a1, int a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x13)
  {
    bzero(a1, a2);
    *a1 = 0xD6310004000CFE4BLL;
    if (a2 >= 16)
    {
      *a1 = 0xD6310004000CFE4BLL;
      *((unsigned char *)a1 + 8) = 126;
      return 9;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_RestoreCalibrationData(void *a1, int a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x13)
  {
    bzero(a1, a2);
    *a1 = 0x66490009000CFE4BLL;
    if (a2 >= 16)
    {
      *a1 = 0x66490009000CFE4BLL;
      *((unsigned char *)a1 + 8) = 126;
      return 9;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_ReadManifestStatus(void *a1, int a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x13)
  {
    bzero(a1, a2);
    *a1 = 0x53D000C000CFD4BLL;
    if (a2 >= 16)
    {
      *a1 = 0x53D000C000CFD4BLL;
      *((unsigned char *)a1 + 8) = 126;
      return 9;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_CheckCalibrationData(void *a1, int a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x13)
  {
    bzero(a1, a2);
    *a1 = 0x129000D000CFE4BLL;
    if (a2 >= 16)
    {
      *a1 = 0x129000D000CFE4BLL;
      *((unsigned char *)a1 + 8) = 126;
      return 9;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_ReadCalCounter(void *a1, int a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x13)
  {
    bzero(a1, a2);
    *a1 = 0x2B41000E000CFE4BLL;
    if (a2 >= 16)
    {
      *a1 = 0x2B41000E000CFE4BLL;
      *((unsigned char *)a1 + 8) = 126;
      return 9;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_GetRevision(_WORD *a1, int a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 4)
  {
    bzero(a1, a2);
    *a1 = 30720;
    *((unsigned char *)a1 + 2) = -16;
    if (a2 >= 6)
    {
      *(_DWORD *)a1 = 2129688576;
      return 4;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t DetectAndFixSpecialCharacters(unsigned __int8 *a1, int a2, int a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a3 <= 1024 && 2 * a3 <= a2)
  {
    bzero(__src, 0x800uLL);
    if (a3 < 1)
    {
      int v6 = 0;
    }
    else
    {
      int v6 = 0;
      uint64_t v7 = a1;
      uint64_t v8 = a3;
      do
      {
        int v10 = *v7++;
        char v9 = v10;
        if ((v10 - 125) <= 1)
        {
          __src[v6] = 125;
          v9 ^= 0x20u;
          ++v6;
        }
        __src[v6++] = v9;
        --v8;
      }
      while (v8);
    }
    memcpy(a1, __src, v6);
    uint64_t result = (v6 + 1);
    a1[v6] = 126;
  }
  return result;
}

uint64_t APPLIB_DIAG_PingBaseBand(_WORD *a1, int a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 4)
  {
    bzero(a1, a2);
    *a1 = 11387;
    *((unsigned char *)a1 + 2) = 61;
    if (a2 >= 6)
    {
      *(_DWORD *)a1 = 2117938299;
      return 4;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_GetBaseBandRevision(_WORD *a1, int a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 4)
  {
    bzero(a1, a2);
    *a1 = -27780;
    *((unsigned char *)a1 + 2) = 73;
    if (a2 >= 6)
    {
      *(_DWORD *)a1 = 2118751100;
      return 4;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_SetDownloadMode(_WORD *a1, int a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 4)
  {
    bzero(a1, a2);
    *a1 = -24262;
    *((unsigned char *)a1 + 2) = 110;
    if (a2 >= 6)
    {
      *(_DWORD *)a1 = 2121179450;
      return 4;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_NvItemRead(char *a1, int a2, __int16 a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 140)
  {
    *(_OWORD *)(a1 + 124) = 0u;
    *((_OWORD *)a1 + 6) = 0u;
    *((_OWORD *)a1 + 7) = 0u;
    *((_OWORD *)a1 + 4) = 0u;
    *((_OWORD *)a1 + 5) = 0u;
    *((_OWORD *)a1 + 2) = 0u;
    *((_OWORD *)a1 + 3) = 0u;
    *(_OWORD *)a1 = 0u;
    *((_OWORD *)a1 + 1) = 0u;
    *a1 = 38;
    *(_WORD *)(a1 + 1) = a3;
    int v5 = 1064;
    LOWORD(v6) = -1;
    uint64_t v7 = a1;
    do
    {
      char v8 = *v7++;
      int v6 = crc_16_l_table[(v8 ^ v6)] ^ ((unsigned __int16)(v6 & 0xFF00) >> 8);
      v5 -= 8;
    }
    while ((_WORD)v5);
    *(_WORD *)(a1 + 133) = ~(_WORD)v6;
    if (a2 >= 0x10E)
    {
      bzero(__src, 0x800uLL);
      uint64_t v9 = 0;
      LODWORD(v10) = 0;
      do
      {
        while (1)
        {
          int v12 = a1[v9];
          if ((v12 - 125) > 1) {
            break;
          }
          int v11 = v10 + 1;
          __src[(int)v10] = 125;
          __src[(int)v10 + 1] = v12 ^ 0x20;
          size_t v10 = (int)v10 + 1 + 1;
          if (++v9 == 135) {
            goto LABEL_11;
          }
        }
        int v11 = v10;
        __src[(int)v10] = v12;
        size_t v10 = (int)v10 + 1;
        ++v9;
      }
      while (v9 != 135);
LABEL_11:
      memcpy(a1, __src, v10);
      uint64_t result = (v11 + 2);
      a1[v10] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_NvItemWrite(char *a1, int a2, __int16 a3, void *__src, int a5)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 140 && __src && a5 <= 128)
  {
    *(_OWORD *)(a1 + 124) = 0u;
    *((_OWORD *)a1 + 6) = 0u;
    *((_OWORD *)a1 + 7) = 0u;
    *((_OWORD *)a1 + 4) = 0u;
    *((_OWORD *)a1 + 5) = 0u;
    *((_OWORD *)a1 + 2) = 0u;
    *((_OWORD *)a1 + 3) = 0u;
    *(_OWORD *)a1 = 0u;
    *((_OWORD *)a1 + 1) = 0u;
    *a1 = 39;
    *(_WORD *)(a1 + 1) = a3;
    memcpy(a1 + 3, __src, a5);
    int v8 = 1064;
    LOWORD(v9) = -1;
    size_t v10 = a1;
    do
    {
      char v11 = *v10++;
      int v9 = crc_16_l_table[(v11 ^ v9)] ^ ((unsigned __int16)(v9 & 0xFF00) >> 8);
      v8 -= 8;
    }
    while ((_WORD)v8);
    *(_WORD *)(a1 + 133) = ~(_WORD)v9;
    if (a2 >= 0x10E)
    {
      bzero(__srca, 0x800uLL);
      uint64_t v12 = 0;
      LODWORD(v13) = 0;
      do
      {
        while (1)
        {
          int v15 = a1[v12];
          if ((v15 - 125) > 1) {
            break;
          }
          int v14 = v13 + 1;
          __srca[(int)v13] = 125;
          __srca[(int)v13 + 1] = v15 ^ 0x20;
          size_t v13 = (int)v13 + 1 + 1;
          if (++v12 == 135) {
            goto LABEL_13;
          }
        }
        int v14 = v13;
        __srca[(int)v13] = v15;
        size_t v13 = (int)v13 + 1;
        ++v12;
      }
      while (v12 != 135);
LABEL_13:
      memcpy(a1, __srca, v13);
      uint64_t result = (v14 + 2);
      a1[v13] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTMNvItemRead(char *a1, int a2, unsigned int a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    if (a2 >= 19)
    {
      *(void *)a1 = 0;
      *((void *)a1 + 1) = 0;
      *(_DWORD *)(a1 + 15) = 0;
      *(_WORD *)a1 = 2891;
      *(void *)(a1 + 2) = 0x900000025C0024;
      *((_WORD *)a1 + 5) = a3;
      unsigned __int16 v5 = crc_16_l_table[a1[7] ^ 0x5FLL];
      unsigned __int16 v6 = crc_16_l_table[a1[8] ^ 0xB7 ^ v5];
      unsigned int v7 = crc_16_l_table[(a1[9] ^ v6 ^ HIBYTE(v5))];
      unsigned int v8 = crc_16_l_table[(v7 ^ HIBYTE(v6) ^ a3)];
      unsigned int v9 = a3 >> 8;
      int v10 = crc_16_l_table[(a3 >> 8) ^ crc_16_l_table[(v7 ^ HIBYTE(v6) ^ a3)] ^ (v7 >> 8)];
      int v11 = v10 ^ ~(v8 >> 8);
      *((_WORD *)a1 + 6) = v10 ^ ~(unsigned __int16)(v8 >> 8);
      if (a2 >= 0x1C)
      {
        int v12 = a3;
        int v13 = v10 ^ (v8 >> 8);
        bzero(v22, 0x7F6uLL);
        uint64_t __src = 0x25C00240B4BLL;
        __int16 v21 = 144;
        if ((v12 - 125) > 1)
        {
          unsigned int v14 = 10;
        }
        else
        {
          v22[0] = 125;
          LOBYTE(v12) = v12 ^ 0x20;
          unsigned int v14 = 11;
        }
        int v15 = ~(_BYTE)v13;
        *((unsigned char *)&__src + v14) = v12;
        uint64_t v16 = v14 + 1;
        if (v9 - 125 <= 1)
        {
          *((unsigned char *)&__src + v16) = 125;
          LOBYTE(v9) = v9 ^ 0x20;
          LODWORD(v16) = v14 + 2;
        }
        int v17 = BYTE1(v11);
        *((unsigned char *)&__src + v16) = v9;
        uint64_t v18 = v16 + 1;
        if ((v15 - 125) <= 1)
        {
          *((unsigned char *)&__src + v18) = 125;
          LOBYTE(v15) = v15 ^ 0x20;
          LODWORD(v18) = v16 + 2;
        }
        *((unsigned char *)&__src + v18) = v15;
        uint64_t v19 = v18 + 1;
        if ((v17 - 125) <= 1)
        {
          *((unsigned char *)&__src + v19) = 125;
          LOBYTE(v17) = v17 ^ 0x20;
          LODWORD(v19) = v18 + 2;
        }
        *((unsigned char *)&__src + v19) = v17;
        memcpy(a1, &__src, v19 + 1);
        uint64_t result = (v19 + 2);
        a1[v19 + 1] = 126;
      }
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTMNvItemWrite(void *a1, int a2, __int16 a3, void *__src, int a5)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 - a5 >= 21)
  {
    *a1 = 0;
    a1[1] = 0;
    *(void *)((char *)a1 + 13) = 0;
    *(_WORD *)a1 = 2891;
    *(void *)((char *)a1 + 2) = 0xE0000025D0024;
    *((_WORD *)a1 + 5) = a3;
    *((_WORD *)a1 + 6) = a5;
    memcpy((char *)a1 + 14, __src, a5);
    int v10 = 8 * (a5 + 14);
    if (8 * ((_WORD)a5 + 14))
    {
      LOWORD(v11) = -1;
      int v12 = (char *)a1;
      do
      {
        char v13 = *v12++;
        int v11 = crc_16_l_table[(v13 ^ v11)] ^ ((unsigned __int16)(v11 & 0xFF00) >> 8);
        v10 -= 8;
      }
      while ((_WORD)v10);
      char v14 = ~(_BYTE)v11;
      char v15 = (unsigned __int16)~(_WORD)v11 >> 8;
    }
    else
    {
      char v14 = 0;
      char v15 = 0;
    }
    *((unsigned char *)a1 + a5 + 14) = v14;
    *((unsigned char *)a1 + a5 + 15) = v15;
    uint64_t v16 = (a5 + 16);
    uint64_t result = 0xFFFFFFFFLL;
    if ((int)v16 <= 1024 && 2 * (int)v16 <= a2)
    {
      bzero(__srca, 0x800uLL);
      if ((int)v16 < 1)
      {
        int v17 = 0;
      }
      else
      {
        int v17 = 0;
        uint64_t v18 = (unsigned __int8 *)a1;
        do
        {
          int v20 = *v18++;
          char v19 = v20;
          if ((v20 - 125) <= 1)
          {
            __srca[v17] = 125;
            v19 ^= 0x20u;
            ++v17;
          }
          __srca[v17++] = v19;
          --v16;
        }
        while (v16);
      }
      memcpy(a1, __srca, v17);
      uint64_t result = (v17 + 1);
      *((unsigned char *)a1 + v17) = 126;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_ModeChange(_WORD *a1, int a2, unsigned int a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 10)
  {
    *(void *)a1 = 0;
    a1[4] = 0;
    *(unsigned char *)a1 = 41;
    int v5 = a3;
    *((unsigned char *)a1 + 1) = a3;
    unsigned int v6 = a3 >> 8;
    *((unsigned char *)a1 + 2) = BYTE1(a3);
    unsigned int v7 = crc_16_l_table[a3 ^ 0x44];
    int v8 = crc_16_l_table[crc_16_l_table[a3 ^ 0x44] ^ (a3 >> 8) ^ 0xB3];
    int v9 = v8 ^ (v7 >> 8);
    int v10 = v8 ^ ~(v7 >> 8);
    *((unsigned char *)a1 + 3) = v10;
    int v11 = BYTE1(v10);
    *((unsigned char *)a1 + 4) = BYTE1(v10);
    bzero(v18, 0x7FFuLL);
    char __src = 41;
    if ((v5 - 125) > 1)
    {
      unsigned int v12 = 1;
    }
    else
    {
      v18[0] = 125;
      LOBYTE(v5) = v5 ^ 0x20;
      unsigned int v12 = 2;
    }
    int v13 = ~(_BYTE)v9;
    v18[v12 - 1] = v5;
    uint64_t v14 = v12 + 1;
    if (v6 - 125 <= 1)
    {
      v18[v14 - 1] = 125;
      LODWORD(v14) = v12 + 2;
      LOBYTE(v6) = v6 ^ 0x20;
    }
    v18[v14 - 1] = v6;
    uint64_t v15 = v14 + 1;
    if ((v13 - 125) <= 1)
    {
      v18[v15 - 1] = 125;
      LOBYTE(v13) = v13 ^ 0x20;
      LODWORD(v15) = v14 + 2;
    }
    v18[v15 - 1] = v13;
    uint64_t v16 = v15 + 1;
    if ((v11 - 125) <= 1)
    {
      v18[v16 - 1] = 125;
      LOBYTE(v11) = v11 ^ 0x20;
      LODWORD(v16) = v15 + 2;
    }
    v18[v16 - 1] = v11;
    memcpy(a1, &__src, v16 + 1);
    uint64_t result = (v16 + 2);
    *((unsigned char *)a1 + v16 + 1) = 126;
  }
  return result;
}

uint64_t APPLIB_DIAG_GetStatus(_WORD *a1, int a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 4)
  {
    bzero(a1, a2);
    *a1 = 5132;
    *((unsigned char *)a1 + 2) = 58;
    if (a2 >= 6)
    {
      *(_DWORD *)a1 = 2117735436;
      return 4;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_GetDeviceID(_DWORD *a1, int a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 5)
  {
    bzero(a1, a2);
    *a1 = 65099;
    *((_WORD *)a1 + 2) = -18861;
    if (a2 >= 0xC)
    {
      *a1 = 65099;
      *((_WORD *)a1 + 2) = -18861;
      *((unsigned char *)a1 + 6) = 126;
      return 7;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_DetectSim(_DWORD *a1, int a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 5)
  {
    bzero(a1, a2);
    *a1 = 130635;
    *((_WORD *)a1 + 2) = -20597;
    if (a2 >= 0xC)
    {
      *a1 = 130635;
      *((_WORD *)a1 + 2) = -20597;
      *((unsigned char *)a1 + 6) = 126;
      return 7;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t DetectAndStripSpecialCharacters(unsigned char *a1, int a2, int a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = 0xFFFFFFFFLL;
  if (a3 <= 2048 && a3 <= a2)
  {
    bzero(__src, 0x800uLL);
    if (a3 < 1)
    {
      uint64_t v3 = 0;
    }
    else
    {
      uint64_t v3 = 0;
      int v6 = 0;
      do
      {
        uint64_t v7 = v6;
        int v8 = a1[v6];
        if (v8 == 125)
        {
          ++v6;
          LOBYTE(v8) = a1[v7 + 1] ^ 0x20;
        }
        __src[v3++] = v8;
        ++v6;
      }
      while (v6 < a3);
    }
    bzero(a1, a3);
    memcpy(a1, __src, v3);
  }
  return v3;
}

uint64_t APPLIB_DIAG_SendRawRequest(char *a1, int a2, const void *a3, int a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0xFFFFFFFFLL;
  if (a3 && a4 + 7 <= a2)
  {
    bzero(a1, a4 + 7);
    memcpy(a1, a3, a4);
    int v9 = 8 * a4;
    if (((8 * a4) & 0xFFF8) != 0)
    {
      LOWORD(v10) = -1;
      uint64_t v11 = a1;
      do
      {
        char v12 = *v11++;
        int v10 = crc_16_l_table[(v12 ^ v10)] ^ ((unsigned __int16)(v10 & 0xFF00) >> 8);
        v9 -= 8;
      }
      while ((_WORD)v9);
      *(_WORD *)&a1[a4] = ~(_WORD)v10;
      uint64_t result = 0xFFFFFFFFLL;
      if (a4 > 1022) {
        return result;
      }
    }
    else
    {
      int v13 = &a1[a4];
      *int v13 = 0;
      v13[1] = 0;
      uint64_t result = 0xFFFFFFFFLL;
      if (a4 > 1022) {
        return result;
      }
    }
    uint64_t v14 = (a4 + 2);
    if (2 * (int)v14 <= a2)
    {
      bzero(__src, 0x800uLL);
      if (a4 < -1)
      {
        int v15 = 0;
      }
      else
      {
        int v15 = 0;
        uint64_t v16 = (unsigned __int8 *)a1;
        do
        {
          int v18 = *v16++;
          char v17 = v18;
          if ((v18 - 125) <= 1)
          {
            __src[v15] = 125;
            v17 ^= 0x20u;
            ++v15;
          }
          __src[v15++] = v17;
          --v14;
        }
        while (v14);
      }
      memcpy(a1, __src, v15);
      uint64_t result = (v15 + 1);
      a1[v15] = 126;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_SetOneRx(_DWORD *a1, int a2, __int16 a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 9)
  {
    bzero(a1, a2);
    *a1 = 195915;
    int v7 = a3;
    *((_WORD *)a1 + 2) = a3;
    int v8 = HIBYTE(a3);
    unsigned int v9 = crc_16_l_table[a3 ^ 0x78];
    int v10 = crc_16_l_table[crc_16_l_table[a3 ^ 0x78] ^ HIBYTE(a3) ^ 0x95];
    int v11 = v10 ^ ~(v9 >> 8);
    *((unsigned char *)a1 + 6) = v10 ^ ~(v9 >> 8);
    int v12 = BYTE1(v11);
    *((unsigned char *)a1 + 7) = BYTE1(v11);
    if (a2 >= 0x10)
    {
      int v13 = v10 ^ (v9 >> 8);
      bzero(v20, 0x7FCuLL);
      int __src = 195915;
      if ((v7 - 125) > 1)
      {
        unsigned int v14 = 4;
      }
      else
      {
        v20[0] = 125;
        LOBYTE(v7) = v7 ^ 0x20;
        unsigned int v14 = 5;
      }
      int v15 = ~(_BYTE)v13;
      v20[v14 - 4] = v7;
      uint64_t v16 = v14 + 1;
      if ((v8 - 125) <= 1)
      {
        v20[v16 - 4] = 125;
        LODWORD(v16) = v14 | 2;
        LOBYTE(v8) = v8 ^ 0x20;
      }
      v20[v16 - 4] = v8;
      uint64_t v17 = v16 + 1;
      if ((v15 - 125) <= 1)
      {
        v20[v17 - 4] = 125;
        LOBYTE(v15) = v15 ^ 0x20;
        LODWORD(v17) = v16 + 2;
      }
      v20[v17 - 4] = v15;
      uint64_t v18 = v17 + 1;
      if ((v12 - 125) <= 1)
      {
        v20[v18 - 4] = 125;
        LOBYTE(v12) = v12 ^ 0x20;
        LODWORD(v18) = v17 + 2;
      }
      v20[v18 - 4] = v12;
      memcpy(a1, &__src, v18 + 1);
      uint64_t result = (v18 + 2);
      *((unsigned char *)a1 + v18 + 1) = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_Get_RSSI_Channel(_DWORD *a1, int a2, __int16 a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 9)
  {
    bzero(a1, a2);
    *a1 = 261451;
    int v7 = a3;
    *((_WORD *)a1 + 2) = a3;
    int v8 = HIBYTE(a3);
    unsigned int v9 = crc_16_l_table[a3 ^ 0xA0];
    int v10 = crc_16_l_table[crc_16_l_table[a3 ^ 0xA0] ^ HIBYTE(a3) ^ 0x8C];
    int v11 = v10 ^ ~(v9 >> 8);
    *((unsigned char *)a1 + 6) = v10 ^ ~(v9 >> 8);
    int v12 = BYTE1(v11);
    *((unsigned char *)a1 + 7) = BYTE1(v11);
    if (a2 >= 0x10)
    {
      int v13 = v10 ^ (v9 >> 8);
      bzero(v20, 0x7FCuLL);
      int __src = 261451;
      if ((v7 - 125) > 1)
      {
        unsigned int v14 = 4;
      }
      else
      {
        v20[0] = 125;
        LOBYTE(v7) = v7 ^ 0x20;
        unsigned int v14 = 5;
      }
      int v15 = ~(_BYTE)v13;
      v20[v14 - 4] = v7;
      uint64_t v16 = v14 + 1;
      if ((v8 - 125) <= 1)
      {
        v20[v16 - 4] = 125;
        LODWORD(v16) = v14 | 2;
        LOBYTE(v8) = v8 ^ 0x20;
      }
      v20[v16 - 4] = v8;
      uint64_t v17 = v16 + 1;
      if ((v15 - 125) <= 1)
      {
        v20[v17 - 4] = 125;
        LOBYTE(v15) = v15 ^ 0x20;
        LODWORD(v17) = v16 + 2;
      }
      v20[v17 - 4] = v15;
      uint64_t v18 = v17 + 1;
      if ((v12 - 125) <= 1)
      {
        v20[v18 - 4] = 125;
        LOBYTE(v12) = v12 ^ 0x20;
        LODWORD(v18) = v17 + 2;
      }
      v20[v18 - 4] = v12;
      memcpy(a1, &__src, v18 + 1);
      uint64_t result = (v18 + 2);
      *((unsigned char *)a1 + v18 + 1) = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_Get_OneRxConfig(_DWORD *a1, int a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 7)
  {
    bzero(a1, a2);
    *a1 = 326987;
    *((_WORD *)a1 + 2) = 15959;
    if (a2 >= 0xC)
    {
      *a1 = 326987;
      *((_WORD *)a1 + 2) = 15959;
      *((unsigned char *)a1 + 6) = 126;
      return 7;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_Release_BB_RESET_DET_N(_DWORD *a1, int a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 5)
  {
    bzero(a1, a2);
    *a1 = 523595;
    *((_WORD *)a1 + 2) = 5183;
    if (a2 >= 0xC)
    {
      *a1 = 523595;
      *((_WORD *)a1 + 2) = 5183;
      *((unsigned char *)a1 + 6) = 126;
      return 7;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_PowerDown_BaseBand(_DWORD *a1, int a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 5)
  {
    bzero(a1, a2);
    *a1 = 654667;
    *((_WORD *)a1 + 2) = -29137;
    if (a2 >= 0xC)
    {
      *a1 = 654667;
      *((_WORD *)a1 + 2) = -29137;
      *((unsigned char *)a1 + 6) = 126;
      return 7;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_EDLOAD(_DWORD *a1, int a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 5)
  {
    bzero(a1, a2);
    *a1 = 982347;
    *((_WORD *)a1 + 2) = -15577;
    if (a2 >= 0xC)
    {
      *a1 = 982347;
      *((_WORD *)a1 + 2) = -15577;
      *((unsigned char *)a1 + 6) = 126;
      return 7;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

BOOL ETLLOGGetItemIDAndEquipIDFromCode(unsigned int a1, unsigned int *a2, unsigned int *a3)
{
  if (a1 >> 13 <= 6)
  {
    *a2 = a1 >> 12;
    *a3 = a1 & 0xFFF;
  }
  return a1 < 0xE000;
}

uint64_t ETLLOGGetCode(int a1, int a2)
{
  return (a2 + (a1 << 12));
}

uint64_t ETLLOGDisable()
{
  if (ETLFrameCreateUplink()
    && ETLRequireFreeSpace()
    && HDLCFrameInject()
    && ETLSendCommand())
  {
    ETLFindMatchingResponse();
  }
  HDLCFrameFree();
  HDLCFrameFree();
  return 0;
}

uint64_t ETLLOGGetIDs()
{
  if (ETLFrameCreateUplink()
    && ETLRequireFreeSpace()
    && HDLCFrameInject()
    && ETLSendCommand())
  {
    ETLFindMatchingResponse();
  }
  HDLCFrameFree();
  HDLCFrameFree();
  return 0;
}

uint64_t ETLLOGSetMask(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (ETLFrameCreateUplink()
    && ETLRequireFreeSpace()
    && HDLCFrameInject()
    && (a4 > 0x1000
     || !a4
     || ETLRequireFreeSpace()
     && HDLCFrameInjectUnsignedInt()
     && HDLCFrameInjectUnsignedInt()
     && HDLCFrameInject()
     && ETLSendCommand()
     && ETLFindMatchingResponse()))
  {
    _ETLDebugPrint();
  }
  HDLCFrameFree();
  HDLCFrameFree();
  return 0;
}

uint64_t ETLLOGSetMaskWithRetry(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, int a6)
{
  if (!a6) {
    return 0;
  }
  int v6 = a6;
  do
  {
    uint64_t v11 = ETLLOGSetMask(a1, a2, a3, a4);
    if (v11) {
      break;
    }
    ETLFlushResponseFull();
    _ETLDebugPrint();
    --v6;
  }
  while (v6);
  return v11;
}

uint64_t ETLLOGClearAllMasksWithRetry(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v13[2] = v5;
  v13[3] = v5;
  v13[0] = v5;
  v13[1] = v5;
  _ETLDebugPrint();
  uint64_t result = ETLLOGGetIDs();
  if (result)
  {
    memset(v12, 0, sizeof(v12));
    if (a3)
    {
      uint64_t v7 = 0;
      while (2)
      {
        unsigned int v8 = *((_DWORD *)v13 + v7);
        if (v8 >= 0x1000) {
          int v9 = 4096;
        }
        else {
          int v9 = *((_DWORD *)v13 + v7);
        }
        if (v8) {
          unsigned int v10 = v9;
        }
        else {
          unsigned int v10 = 4096;
        }
        unsigned int v11 = a3;
        while ((ETLLOGSetMask(a1, v7, (uint64_t)v12, v10) & 1) == 0)
        {
          if (v11 >= 2)
          {
            ETLFlushResponseFull();
            _ETLDebugPrint();
          }
          if (!--v11) {
            return 0;
          }
        }
        if (++v7 != 14) {
          continue;
        }
        break;
      }
    }
    return 1;
  }
  return result;
}

uint64_t ETLLOGClearAllEnabledMasksWithRetry(uint64_t a1, int a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v18[2] = v8;
  v18[3] = v8;
  v18[0] = v8;
  v18[1] = v8;
  _ETLDebugPrint();
  uint64_t result = ETLLOGGetIDs();
  if (result)
  {
    memset(v17, 0, sizeof(v17));
    if (a2 && a5)
    {
      uint64_t v10 = 0;
      do
      {
        uint64_t v11 = *(unsigned int *)(a3 + 4 * v10);
        if (v11 <= 0xD)
        {
          unsigned int v12 = *((_DWORD *)v18 + v11);
          if (v12 >= 0x1000) {
            int v13 = 4096;
          }
          else {
            int v13 = *((_DWORD *)v18 + v11);
          }
          if (v12) {
            unsigned int v14 = v13;
          }
          else {
            unsigned int v14 = 4096;
          }
          unsigned int v15 = a5;
          while ((ETLLOGSetMask(a1, v11, (uint64_t)v17, v14) & 1) == 0)
          {
            if (v15 >= 2)
            {
              ETLFlushResponseFull();
              _ETLDebugPrint();
            }
            if (!--v15) {
              return 0;
            }
          }
        }
        ++v10;
      }
      while (v10 != a2);
    }
    return 1;
  }
  return result;
}

const char *ETLLOGEquipIDAsString(unsigned int a1)
{
  if (a1 <= 0xD) {
    return (&__const_ETLLOGEquipIDAsString_kNames)[a1];
  }
  else {
    return "Unknown";
  }
}

uint64_t ETLEVENTGetRangeSize(unsigned __int16 *a1)
{
  return a1[1] - *a1 + 1;
}

uint64_t ETLEVENTProcessEvent(char *__str, size_t __size, unsigned int *a3, char *a4, unsigned int a5, _DWORD *a6)
{
  uint64_t result = 0;
  *a3 = 0;
  *a6 = 0;
  unsigned int v8 = a5 - 2;
  if (a5 < 2) {
    return result;
  }
  unsigned int v10 = __size;
  int v11 = *a4;
  unsigned int v12 = a4[1];
  *a6 = 2;
  int v13 = a4 + 2;
  if ((v12 & 0x80000000) == 0)
  {
    if (v8 >= 8)
    {
      uint64_t v14 = *v13 >> 8;
      uint64_t v15 = *v13 >> 16;
      unint64_t v16 = *v13 & 0xFFFFFFFFFF000000;
      int v17 = *v13;
      unsigned int v18 = 8;
      goto LABEL_7;
    }
LABEL_26:
    uint64_t result = 0;
    *a6 = 0;
    return result;
  }
  if (v8 < 2) {
    goto LABEL_26;
  }
  int v17 = 0;
  unint64_t v16 = 0;
  LOBYTE(v14) = a4[2];
  LOBYTE(v15) = a4[3];
  unsigned int v18 = 2;
LABEL_7:
  unsigned int v19 = v11 & 0xFFFFF0FF | ((v12 & 0xF) << 8);
  uint64_t v20 = (v12 >> 5) & 3;
  unsigned int v21 = v8 - v18;
  unsigned int v22 = v18 + 2;
  *a6 = v18 + 2;
  switch(v20)
  {
    case 1:
      goto LABEL_9;
    case 2:
      LODWORD(v20) = 2;
LABEL_9:
      if (v21 < v20) {
        goto LABEL_10;
      }
      goto LABEL_14;
    case 3:
      if (!v21) {
        goto LABEL_26;
      }
      unsigned int v23 = *((unsigned __int8 *)v13 + v18);
      unsigned int v22 = v18 + 3;
      *a6 = v18 + 3;
      LODWORD(v20) = v23;
      if (v21 - 1 >= v23) {
        goto LABEL_14;
      }
LABEL_10:
      uint64_t result = 0;
      break;
    default:
LABEL_14:
      *a6 = v20 + v22;
      unint64_t v24 = ((v16 | ((unint64_t)v15 << 16)) >> 14)
          + ((v16 | ((unint64_t)v15 << 16)) >> 16)
          + ((unsigned __int16)(((43685 * (v17 & 0xFFFF00FF | (v14 << 8))) >> 16)
                                            + ((unsigned __int16)(((v17 | (v14 << 8))
                                                                 - ((43685
                                                                   * (v17 & 0xFFFF00FF | (v14 << 8))) >> 16)) & 0xFFFE) >> 1)) >> 13)
          + 2;
      unint64_t v25 = v24 >> 2;
      unint64_t v26 = ((v24 * (unsigned __int128)0x10624DD2F1A9FCuLL) >> 64) + 315964800;
      unsigned int v27 = snprintf(__str, v10, "[%02u:%02u:%02u:%06u] EVENT 0x%04x ", ((v26 * (unsigned __int128)0x123456789ABCE0uLL) >> 64) % 0x18, v26 / 0x3C - 60 * ((unint64_t)((v26 / 0x3C * (unsigned __int128)0x888888888888889uLL) >> 64) >> 1), v26 % 0x3C, 1000 * (v25 - 1000 * ((v25 * (unsigned __int128)0x4189374BC6A7F0uLL) >> 64)), v19);
      if (v27 >= v10) {
        unsigned int v28 = v10;
      }
      else {
        unsigned int v28 = v27;
      }
      *a3 = v28;
      if (v27 < v10)
      {
        if (v10 >= v27) {
          unsigned int v29 = v10 - v27;
        }
        else {
          unsigned int v29 = 0;
        }
        unsigned int v30 = TelephonyUtilBinToHex();
        if (v30 >= v29) {
          unsigned int v31 = v29;
        }
        else {
          unsigned int v31 = v30;
        }
        *a3 += v31;
      }
      uint64_t result = 1;
      break;
  }
  return result;
}

uint64_t ETLEVENTProcessEventItem(unsigned __int8 *a1, unsigned int a2, _DWORD *a3, _WORD *a4, unsigned char *a5, uint64_t a6)
{
  return ETLEVENTProcessEventItemTSLength(a1, a2, a3, a4, a5, a6, 0);
}

uint64_t ETLEVENTProcessEventItemTSLength(unsigned __int8 *a1, unsigned int a2, _DWORD *a3, _WORD *a4, unsigned char *a5, uint64_t a6, unsigned int *a7)
{
  uint64_t v7 = 0;
  *a3 = 0;
  unsigned int v8 = a2 - 2;
  if (a2 < 2) {
    return v7;
  }
  unsigned int v9 = a1[1];
  *a4 = (*a1 | (unsigned __int16)((_WORD)v9 << 8)) & 0xFFF;
  if (a7)
  {
    *a7 = v9 >> 7;
    *a3 += 2;
    unsigned int v10 = a1 + 2;
    if ((v9 & 0x80) == 0) {
      goto LABEL_4;
    }
  }
  else
  {
    *a3 = 2;
    unsigned int v10 = a1 + 2;
    if ((v9 & 0x80) == 0)
    {
LABEL_4:
      if (v8 >= 8)
      {
        *(void *)a6 = *v10;
        unsigned int v11 = 8;
        goto LABEL_10;
      }
      goto LABEL_8;
    }
  }
  if (v8 >= 2)
  {
    *(unsigned char *)(a6 + 1) = a1[2];
    *(unsigned char *)(a6 + 2) = a1[3];
    unsigned int v11 = 2;
LABEL_10:
    uint64_t v13 = (v9 >> 5) & 3;
    uint64_t v7 = v8 - v11;
    *a3 += v11;
    switch(v13)
    {
      case 1:
        unsigned int v14 = 1;
        *a5 = 1;
        if (!v7) {
          return 0;
        }
        goto LABEL_18;
      case 2:
        unsigned int v14 = 2;
        *a5 = 2;
        if (v7 < 2) {
          return 0;
        }
        goto LABEL_18;
      case 3:
        if (v7)
        {
          *a5 = *((unsigned char *)v10 + v11);
          ++*a3;
          unsigned int v14 = *a5;
          if ((int)v7 - 1 < v14) {
            return 0;
          }
LABEL_18:
          unsigned int v12 = *a3 + v14;
          uint64_t v7 = 1;
        }
        else
        {
          unsigned int v12 = 0;
        }
        break;
      default:
        unsigned int v14 = 0;
        *a5 = 0;
        goto LABEL_18;
    }
    goto LABEL_19;
  }
LABEL_8:
  unsigned int v12 = 0;
  uint64_t v7 = 0;
LABEL_19:
  *a3 = v12;
  return v7;
}

uint64_t ETLEVENTProcessHeader(uint64_t a1, unsigned int a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t result = 0;
  *a3 = 0;
  *a4 = 0;
  if (a2 >= 3)
  {
    if (*(unsigned char *)a1 == 96)
    {
      *a3 = *(unsigned __int16 *)(a1 + 1);
      *a4 = 3;
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t ETLEVENTParseReport(char *__str, size_t __size, uint64_t a3, unsigned int a4, _DWORD *a5)
{
  uint64_t result = 0;
  *a5 = 0;
  if (a4 >= 3)
  {
    if (*(unsigned char *)a3 == 96)
    {
      unsigned int v8 = *(unsigned __int16 *)(a3 + 1);
      *a5 = 3;
      if (v8)
      {
        unsigned int v10 = (char *)(a3 + 3);
        while (1)
        {
          unsigned int v12 = -1431655766;
          unsigned int v13 = -1431655766;
          if ((ETLEVENTProcessEvent(__str, __size, &v12, v10, v8, &v13) & 1) == 0) {
            break;
          }
          unsigned int v11 = v13;
          v10 += v13;
          *a5 += v13;
          __str += v12;
          __size = __size - v12;
          v8 -= v11;
          if (!v8) {
            return 1;
          }
        }
        uint64_t result = 0;
        *a5 = 0;
      }
      else
      {
        return 1;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t ETLEVENTParseEventReport(uint64_t a1, void *a2)
{
  unsigned int v2 = *(unsigned char **)a1;
  unsigned int v3 = *(_DWORD *)(a1 + 8);
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  if (v3 < 3 || *v2 != 96 || *(unsigned __int16 *)(v2 + 1) + 3 != v3) {
    return 0;
  }
  uint64_t result = (uint64_t)malloc(0x28uLL);
  if (!result) {
    return result;
  }
  uint64_t v7 = (void *)result;
  unsigned int v8 = *(unsigned char **)a1;
  int v9 = *(_DWORD *)(a1 + 8);
  *(_OWORD *)uint64_t result = 0u;
  *(_OWORD *)(result + 16) = 0u;
  *(void *)(result + 32) = 0;
  unsigned int v10 = v9 + 1;
  if ((v9 + 1) > 0xFFFFFFFD) {
    goto LABEL_23;
  }
  unsigned int v11 = (char)v8[4];
  *(_WORD *)uint64_t result = (v8[3] | (unsigned __int16)((char)v8[4] << 8)) & 0xFFF;
  unsigned int v12 = v8 + 5;
  if ((v11 & 0x80000000) == 0)
  {
    if (v10 >= 8)
    {
      *(void *)(result + 2) = *v12;
      unsigned int v13 = 8;
      goto LABEL_11;
    }
LABEL_23:
    free(v7);
    return 0;
  }
  if (v10 < 2) {
    goto LABEL_23;
  }
  *(unsigned char *)(result + 3) = v8[5];
  *(unsigned char *)(result + 4) = v8[6];
  unsigned int v13 = 2;
LABEL_11:
  unsigned int v14 = v8 + 3;
  unsigned int v15 = v10 - v13;
  unsigned int v16 = v13 + 2;
  switch((v11 >> 5) & 3)
  {
    case 1u:
      unsigned int v17 = 1;
      *(unsigned char *)(result + 24) = 1;
      break;
    case 2u:
      unsigned int v17 = 2;
      *(unsigned char *)(result + 24) = 2;
      break;
    case 3u:
      if (!v15) {
        goto LABEL_23;
      }
      unsigned int v17 = *((unsigned __int8 *)v12 + v13);
      *(unsigned char *)(result + 24) = v17;
      --v15;
      unsigned int v16 = v13 + 3;
      break;
    default:
      goto LABEL_23;
  }
  if (v15 < v17) {
    goto LABEL_23;
  }
  if (!v17) {
    goto LABEL_23;
  }
  unsigned int v18 = malloc(v17);
  v7[2] = v18;
  if (!v18) {
    goto LABEL_23;
  }
  memcpy(v18, &v14[v16], v17);
  uint64_t v19 = a2[1];
  if (v19) {
    uint64_t v20 = (void *)(v19 + 32);
  }
  else {
    uint64_t v20 = a2;
  }
  *uint64_t v20 = v7;
  a2[1] = v7;
  ++*((_DWORD *)a2 + 4);
  return 1;
}

BOOL ETLEVENTReportFree(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (!*a1)
  {
    int v3 = 0;
    int v5 = *((_DWORD *)a1 + 4);
    if (v5) {
      return v3 == v5;
    }
    goto LABEL_5;
  }
  int v3 = 0;
  do
  {
    uint64_t v4 = *(void *)(v2 + 32);
    free(*(void **)(v2 + 16));
    free((void *)v2);
    ++v3;
    uint64_t v2 = v4;
  }
  while (v4);
  int v5 = *((_DWORD *)a1 + 4);
  if (v3 == v5)
  {
LABEL_5:
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
  return v3 == v5;
}

uint64_t ETLMESSAGEGetSubsystemRangeSize(unsigned __int16 *a1)
{
  return a1[1] - *a1 + 1;
}

uint64_t ETLMESSAGEGetSubsystemIDRanges(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  *a4 = 0;
  if (ETLFrameCreateUplink()
    && (ETLRequireFreeSpace() & 1) != 0
    && HDLCFrameInject()
    && ETLSendCommand()
    && (ETLFindMatchingResponse() & 1) == 0)
  {
    _ETLDebugPrint();
  }
  HDLCFrameFree();
  HDLCFrameFree();
  return 0;
}

uint64_t ETLMESSAGEGetSubsystemMasksWithRetry(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, _DWORD *a6, uint64_t a7, unsigned int a8)
{
  *a6 = 0;
  if (a8)
  {
    unsigned int v8 = a8;
    _ETLDebugPrint();
    do
    {
      if (ETLFrameCreateUplink()
        && (a3 > 1
         || (ETLRequireFreeSpace() & 1) != 0
         && HDLCFrameInject()
         && ETLRequireFreeSpace()
         && HDLCFrameInject()
         && ETLSendCommand()
         && (ETLFindMatchingResponse() & 1) == 0))
      {
        _ETLDebugPrint();
      }
      HDLCFrameFree();
      HDLCFrameFree();
      if (v8 >= 2)
      {
        ETLFlushResponseFull();
        _ETLDebugPrint();
      }
      --v8;
    }
    while (v8);
  }
  else
  {
    _ETLDebugPrint();
  }
  uint64_t result = 0;
  *a6 = 0;
  return result;
}

uint64_t ETLMESSAGESetSubsystemRuntimeMasksWithRetry(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  if (a5)
  {
    _ETLDebugPrint();
    unsigned int v6 = a5;
    do
    {
      if (ETLFrameCreateUplink()
        && (ETLRequireFreeSpace() & 1) != 0
        && HDLCFrameInject()
        && ETLRequireFreeSpace()
        && HDLCFrameInject()
        && HDLCFrameInjectUnsignedShort()
        && HDLCFrameInject()
        && ETLSendCommand()
        && (ETLFindMatchingResponse() & 1) == 0)
      {
        _ETLDebugPrint();
      }
      HDLCFrameFree();
      HDLCFrameFree();
      if (v6 >= 2)
      {
        ETLFlushResponseFull();
        _ETLDebugPrint();
      }
      --v6;
    }
    while (v6);
  }
  else
  {
    _ETLDebugPrint();
  }
  return 0;
}

uint64_t ETLMESSAGESetAllSubsystemRunTimeMasks()
{
  if (ETLFrameCreateUplink()
    && (ETLRequireFreeSpace() & 1) != 0
    && HDLCFrameInject()
    && ETLRequireFreeSpace()
    && HDLCFrameInjectUnsignedShort()
    && HDLCFrameInjectUnsignedInt()
    && ETLSendCommand()
    && (ETLFindMatchingResponse() & 1) == 0)
  {
    _ETLDebugPrint();
  }
  HDLCFrameFree();
  HDLCFrameFree();
  _ETLDebugPrint();
  return 0;
}

uint64_t ETLMESSAGESetFlags(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  *a4 = 0;
  _ETLDebugPrint();
  if (ETLFrameCreateUplink()
    && (ETLRequireFreeSpace() & 1) != 0
    && HDLCFrameInject()
    && ETLRequireFreeSpace()
    && HDLCFrameInjectUnsignedShort()
    && HDLCFrameInjectUnsignedInt()
    && ETLSendCommand())
  {
    if (ETLFindMatchingResponse()) {
      *a4 = 0;
    }
    else {
      _ETLDebugPrint();
    }
  }
  HDLCFrameFree();
  HDLCFrameFree();
  return 0;
}

uint64_t ETLMESSAGESetEnabled(uint64_t a1, uint64_t a2)
{
  int v2 = a2;
  int v5 = 0;
  LODWORD(result) = ETLMESSAGESetFlags(a1, a2, (uint64_t)&v5, &v4);
  if (v5 == v2) {
    return result;
  }
  else {
    return 0;
  }
}

uint64_t ETLQtraceSend(uint64_t a1, _DWORD *a2)
{
  if (a1)
  {
    if (ETLFrameCreateUplink())
    {
      if ((ETLSubsysAddHeader() & 1) == 0
        || (HDLCFrameInjectUnsignedInt() & 1) == 0
        || (HDLCFrameInjectUnsignedInt() & 1) == 0
        || (HDLCFrameInjectUnsignedInt() & 1) == 0
        || (HDLCFrameInjectUnsignedInt() & 1) == 0
        || !ETLRequireFreeSpace())
      {
LABEL_18:
        _ETLDebugPrint();
        goto LABEL_19;
      }
      if (*a2)
      {
        uint64_t v3 = 0;
        unint64_t v4 = 0;
        while ((HDLCFrameInjectUnsignedShort() & 1) != 0 && (HDLCFrameInjectUnsignedShort() & 1) != 0)
        {
          ++v4;
          v3 += 4;
          if (v4 >= *a2) {
            goto LABEL_14;
          }
        }
        goto LABEL_18;
      }
LABEL_14:
      if (ETLSendCommand() && ETLSubsysFindMatchingResponse())
      {
        uint64_t v5 = ETLQtraceParseResponse();
LABEL_20:
        HDLCFrameFree();
        HDLCFrameFree();
        return v5;
      }
    }
LABEL_19:
    uint64_t v5 = 0;
    goto LABEL_20;
  }
  _ETLDebugPrint();
  return 0;
}

uint64_t ETLQtraceParseResponse()
{
  return 0;
}

uint64_t ETLQtraceClearSend(uint64_t a1)
{
  if (!a1)
  {
    _ETLDebugPrint();
    return 0;
  }
  if (!ETLFrameCreateUplink()) {
    goto LABEL_13;
  }
  if (!ETLSubsysAddHeader()
    || !HDLCFrameInjectUnsignedInt()
    || !HDLCFrameInjectUnsignedInt()
    || !HDLCFrameInjectUnsignedInt()
    || (HDLCFrameInjectUnsignedInt() & 1) == 0)
  {
    _ETLDebugPrint();
LABEL_13:
    uint64_t v1 = 0;
    goto LABEL_14;
  }
  if (!ETLSendCommand() || !ETLSubsysFindMatchingResponse()) {
    goto LABEL_13;
  }
  uint64_t v1 = ETLQtraceParseResponse();
LABEL_14:
  HDLCFrameFree();
  HDLCFrameFree();
  return v1;
}

uint64_t ETLDMCUtilCountRangesInMaskArray(uint64_t result, int a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v2 = result;
  uint64_t v3 = 0;
  LODWORD(result) = 0;
  int v4 = 0;
  do
  {
    if ((v3 - v4) > 1 || result == 0) {
      unsigned int v6 = result + 1;
    }
    else {
      unsigned int v6 = result;
    }
    if (*(_DWORD *)(v2 + 4 * v3))
    {
      int v4 = v3;
      uint64_t result = v6;
    }
    else
    {
      uint64_t result = result;
    }
    ++v3;
  }
  while (a2 != v3);
  return result;
}

uint64_t ETLDMCKeyword(unsigned int a1)
{
  if (a1 > 0xF) {
    return 0;
  }
  else {
    return *((void *)&kDMCFilesMap + 2 * a1 + 1);
  }
}

uint64_t *ETLDMCFileName(unsigned int a1)
{
  uint64_t HardwareModel = _MergedGlobals_0;
  if (_MergedGlobals_0)
  {
    if (a1 > 0xF) {
      return 0;
    }
  }
  else
  {
    uint64_t HardwareModel = TelephonyCapabilitiesGetHardwareModel();
    _MergedGlobals_0 = HardwareModel;
    if (a1 > 0xF) {
      return 0;
    }
  }
  uint64_t v3 = (const char *)*((void *)&kDMCFilesMap + 2 * a1 + 1);
  if (!v3) {
    return 0;
  }
  qword_1EAE52790 = 0;
  *(void *)algn_1EAE52798 = 0;
  *(uint64_t *)((char *)&qword_1EAE527A0 + 7) = 0;
  qword_1EAE527A0 = 0;
  if (!HardwareModel) {
    return 0;
  }
  int v4 = &qword_1EAE52790;
  if (snprintf((char *)&qword_1EAE52790, 0x1EuLL, "%c%d%s%s%s", *(char *)(HardwareModel + 4), *(_DWORD *)HardwareModel, (const char *)(HardwareModel + 5), "_", v3) >= 30)return 0; {
  return v4;
  }
}

const char *ETLDMCGetMatchingKeyword(const char *a1)
{
  uint64_t HardwareModel = _MergedGlobals_0;
  if (a1)
  {
    uint64_t v2 = a1;
    uint64_t v3 = 0;
    uint64_t v4 = _MergedGlobals_0;
    while (1)
    {
      if (v4)
      {
        uint64_t v5 = *(const char **)((char *)&kDMCFilesMap + v3 + 8);
        if (v5) {
          goto LABEL_9;
        }
      }
      else
      {
        uint64_t HardwareModel = TelephonyCapabilitiesGetHardwareModel();
        _MergedGlobals_0 = HardwareModel;
        uint64_t v4 = HardwareModel;
        uint64_t v5 = *(const char **)((char *)&kDMCFilesMap + v3 + 8);
        if (v5)
        {
LABEL_9:
          qword_1EAE52790 = 0;
          *(void *)algn_1EAE52798 = 0;
          *(uint64_t *)((char *)&qword_1EAE527A0 + 7) = 0;
          qword_1EAE527A0 = 0;
          if (v4)
          {
            int v6 = snprintf((char *)&qword_1EAE52790, 0x1EuLL, "%c%d%s%s%s", *(char *)(v4 + 4), *(_DWORD *)v4, (const char *)(v4 + 5), "_", v5);
            uint64_t HardwareModel = _MergedGlobals_0;
            if (v6 > 29)
            {
              uint64_t v4 = _MergedGlobals_0;
            }
            else
            {
              int v7 = strcmp(v2, (const char *)&qword_1EAE52790);
              uint64_t v4 = HardwareModel;
              if (!v7) {
                return *(const char **)((char *)&kDMCFilesMap + v3 + 8);
              }
            }
          }
        }
      }
      v3 += 16;
      if (v3 == 256)
      {
        if (HardwareModel
          || (uint64_t HardwareModel = TelephonyCapabilitiesGetHardwareModel(), (_MergedGlobals_0 = HardwareModel) != 0))
        {
          if (strlen(v2) >= 3
            && *(unsigned __int8 *)(HardwareModel + 4) == *(unsigned __int8 *)v2
            && *((unsigned __int8 *)v2 + 1) - 49 < 8)
          {
            return 0;
          }
        }
        return v2;
      }
    }
  }
  uint64_t v2 = 0;
  if (!_MergedGlobals_0) {
    _MergedGlobals_0 = TelephonyCapabilitiesGetHardwareModel();
  }
  return v2;
}

uint64_t *ETLDMCGetMatchingFileName(char *a1)
{
  return ETLDMCGetMatchingFileNameAndType(a1, 0);
}

uint64_t *ETLDMCGetMatchingFileNameAndType(char *a1, unsigned int *a2)
{
  if (!a1) {
    return 0;
  }
  if (off_1EAE52650 && !strcasecmp(a1, off_1EAE52650))
  {
    unsigned int v4 = 0;
  }
  else if (off_1EAE52660 && !strcasecmp(a1, off_1EAE52660))
  {
    unsigned int v4 = 1;
  }
  else if (off_1EAE52670 && !strcasecmp(a1, off_1EAE52670))
  {
    unsigned int v4 = 2;
  }
  else if (off_1EAE52680 && !strcasecmp(a1, off_1EAE52680))
  {
    unsigned int v4 = 3;
  }
  else if (off_1EAE52690 && !strcasecmp(a1, off_1EAE52690))
  {
    unsigned int v4 = 4;
  }
  else if (off_1EAE526A0 && !strcasecmp(a1, off_1EAE526A0))
  {
    unsigned int v4 = 5;
  }
  else if (off_1EAE526B0 && !strcasecmp(a1, off_1EAE526B0))
  {
    unsigned int v4 = 6;
  }
  else if (off_1EAE526C0 && !strcasecmp(a1, off_1EAE526C0))
  {
    unsigned int v4 = 7;
  }
  else if (off_1EAE526D0 && !strcasecmp(a1, off_1EAE526D0))
  {
    unsigned int v4 = 8;
  }
  else if (off_1EAE526E0 && !strcasecmp(a1, off_1EAE526E0))
  {
    unsigned int v4 = 9;
  }
  else if (off_1EAE526F0 && !strcasecmp(a1, off_1EAE526F0))
  {
    unsigned int v4 = 10;
  }
  else if (off_1EAE52700 && !strcasecmp(a1, off_1EAE52700))
  {
    unsigned int v4 = 11;
  }
  else if (off_1EAE52710 && !strcasecmp(a1, off_1EAE52710))
  {
    unsigned int v4 = 12;
  }
  else if (off_1EAE52720 && !strcasecmp(a1, off_1EAE52720))
  {
    unsigned int v4 = 13;
  }
  else if (off_1EAE52730 && !strcasecmp(a1, off_1EAE52730))
  {
    unsigned int v4 = 14;
  }
  else
  {
    if (!off_1EAE52740 || strcasecmp(a1, off_1EAE52740)) {
      return 0;
    }
    unsigned int v4 = 15;
  }
  if (a2) {
    *a2 = v4;
  }
  uint64_t HardwareModel = _MergedGlobals_0;
  if (_MergedGlobals_0)
  {
    int v6 = (const char *)*((void *)&kDMCFilesMap + 2 * v4 + 1);
    if (!v6) {
      return 0;
    }
  }
  else
  {
    uint64_t HardwareModel = TelephonyCapabilitiesGetHardwareModel();
    _MergedGlobals_0 = HardwareModel;
    int v6 = (const char *)*((void *)&kDMCFilesMap + 2 * v4 + 1);
    if (!v6) {
      return 0;
    }
  }
  qword_1EAE52790 = 0;
  *(void *)algn_1EAE52798 = 0;
  *(uint64_t *)((char *)&qword_1EAE527A0 + 7) = 0;
  qword_1EAE527A0 = 0;
  if (!HardwareModel) {
    return 0;
  }
  int v7 = &qword_1EAE52790;
  if (snprintf((char *)&qword_1EAE52790, 0x1EuLL, "%c%d%s%s%s", *(char *)(HardwareModel + 4), *(_DWORD *)HardwareModel, (const char *)(HardwareModel + 5), "_", v6) >= 30)return 0; {
  return v7;
  }
}

void *ETLTimestampGetTimeval(void *result, uint64_t a2)
{
  unsigned int v2 = (43685 * (unsigned __int16)*result) >> 16;
  unint64_t v3 = 5 * (*result >> 16)
     + ((unsigned __int16)(v2 + ((unsigned __int16)((*result - v2) & 0xFFFE) >> 1)) >> 13)
     + 2;
  *(void *)a2 = ((v3 * (unsigned __int128)0x10624DD2F1A9FCuLL) >> 64) + 315964800;
  *(_DWORD *)(a2 + 8) = 1000 * ((v3 >> 2) - 1000 * (((v3 >> 2) * (unsigned __int128)0x4189374BC6A7F0uLL) >> 64));
  return result;
}

uint64_t ETLTimestampFromTimeval(uint64_t result, void *a2)
{
  if (result)
  {
    if (a2) {
      *a2 = ((unsigned __int16)(-25600 * (*(_DWORD *)(result + 8) % 1250)) | (unint64_t)((800
    }
                                                                                               * *(void *)result
                                                                                               + *(_DWORD *)(result + 8)
                                                                                               / 1250) << 16))
          - 16565655306240000;
  }
  return result;
}

uint64_t ETLTimestampGetHoursMinutesSeconds(uint64_t result, int *a2, int *a3, _DWORD *a4)
{
  *a4 = result % 60;
  *a3 = (int)(result / 60) % 60;
  *a2 = (int)(result / 3600) % 24;
  return result;
}

uint64_t ETLTimestampsEqual(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2 = bswap64(*a1);
  unint64_t v3 = bswap64(*a2);
  BOOL v4 = v2 >= v3;
  BOOL v5 = v2 > v3;
  int v6 = !v4;
  return (v5 - v6);
}

uint64_t ETLDMCDebugGetMessageRange@<X0>(unsigned char *a1@<X8>)
{
  unint64_t v26 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v25[7] = v2;
  v25[8] = v2;
  v25[5] = v2;
  v25[6] = v2;
  v25[3] = v2;
  v25[4] = v2;
  v25[1] = v2;
  v25[2] = v2;
  long long v24 = v2;
  v25[0] = v2;
  *(_OWORD *)__p = v2;
  long long v23 = v2;
  long long v20 = v2;
  *(_OWORD *)int __src = v2;
  long long v18 = v2;
  long long v19 = v2;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v18);
  uint64_t v3 = v18;
  BOOL v4 = (char *)&v18 + *(void *)(v18 - 24);
  if (*((_DWORD *)v4 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)&v18 + *(void *)(v18 - 24)));
    BOOL v5 = std::locale::use_facet(&v27, MEMORY[0x1E4FBA258]);
    ((void (*)(const std::locale::facet *, uint64_t))v5->__vftable[2].~facet_0)(v5, 32);
    std::locale::~locale(&v27);
    uint64_t v3 = v18;
  }
  *((_DWORD *)v4 + 36) = 48;
  *(void *)((char *)&v19 + *(void *)(v3 - 24) + 8) = 4;
  int v6 = (uint64_t *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)" to ", 4);
  uint64_t v7 = *v6;
  unsigned int v8 = (char *)v6 + *(void *)(*v6 - 24);
  if (*((_DWORD *)v8 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)v6 + *(void *)(*v6 - 24)));
    int v9 = std::locale::use_facet(&v27, MEMORY[0x1E4FBA258]);
    int v10 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v9->__vftable[2].~facet_0)(v9, 32);
    std::locale::~locale(&v27);
    *((_DWORD *)v8 + 36) = v10;
    uint64_t v7 = *v6;
  }
  *((_DWORD *)v8 + 36) = 48;
  *(uint64_t *)((char *)v6 + *(void *)(v7 - 24) + 24) = 4;
  std::ostream::operator<<();
  if ((BYTE8(v24) & 0x10) != 0)
  {
    unsigned int v12 = (unsigned char *)v24;
    if ((void *)v24 < __src[1])
    {
      *(void **)&long long v24 = __src[1];
      unsigned int v12 = __src[1];
    }
    unsigned int v13 = __src[0];
    size_t v11 = v12 - (char *)__src[0];
    if ((unint64_t)(v12 - (char *)__src[0]) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_22;
    }
  }
  else
  {
    if ((BYTE8(v24) & 8) == 0)
    {
      size_t v11 = 0;
      a1[23] = 0;
      goto LABEL_18;
    }
    unsigned int v13 = (const void *)*((void *)&v19 + 1);
    size_t v11 = *((void *)&v20 + 1) - *((void *)&v19 + 1);
    if (*((void *)&v20 + 1) - *((void *)&v19 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_22:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v11 >= 0x17)
  {
    uint64_t v14 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v11 | 7) != 0x17) {
      uint64_t v14 = v11 | 7;
    }
    uint64_t v15 = v14 + 1;
    unsigned int v16 = operator new(v14 + 1);
    *((void *)a1 + 1) = v11;
    *((void *)a1 + 2) = v15 | 0x8000000000000000;
    *(void *)a1 = v16;
    a1 = v16;
    goto LABEL_17;
  }
  a1[23] = v11;
  if (v11) {
LABEL_17:
  }
    memmove(a1, v13, v11);
LABEL_18:
  a1[v11] = 0;
  *(void *)&long long v18 = *MEMORY[0x1E4FBA418];
  *(void *)((char *)&v18 + *(void *)(v18 - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  *((void *)&v18 + 1) = MEMORY[0x1E4FBA470] + 16;
  if (SHIBYTE(v23) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1E4E81CC0](v25);
}

void sub_1E45A1024(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_1E45A1038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_1E45A104C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::locale::~locale((std::locale *)(v9 - 56));
  std::ostringstream::~ostringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_1E45A106C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_1E45A1080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_1E45A1094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::ostringstream::basic_ostringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4FBA498] + 64;
  *(void *)(a1 + 112) = MEMORY[0x1E4FBA498] + 64;
  uint64_t v3 = *(void *)(MEMORY[0x1E4FBA418] + 16);
  uint64_t v4 = *(void *)(MEMORY[0x1E4FBA418] + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + *(void *)(v4 - 24)) = v3;
  BOOL v5 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v5, (void *)(a1 + 8));
  uint64_t v6 = MEMORY[0x1E4FBA498] + 24;
  v5[1].__vftable = 0;
  v5[1].__fmtflags_ = -1;
  *(void *)a1 = v6;
  *(void *)(a1 + 112) = v2;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 8) = MEMORY[0x1E4FBA470] + 16;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_1E45A1218(_Unwind_Exception *a1)
{
  std::ostream::~ostream();
  MEMORY[0x1E4E81CC0](v1);
  _Unwind_Resume(a1);
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4FBA418];
  uint64_t v3 = *MEMORY[0x1E4FBA418];
  *(void *)a1 = *MEMORY[0x1E4FBA418];
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 8) = MEMORY[0x1E4FBA470] + 16;
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1E4E81CC0](a1 + 112);
  return a1;
}

uint64_t ETLDMCDebugGetEventRange@<X0>(unsigned char *a1@<X8>)
{
  unint64_t v26 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v25[7] = v2;
  v25[8] = v2;
  v25[5] = v2;
  v25[6] = v2;
  v25[3] = v2;
  v25[4] = v2;
  v25[1] = v2;
  v25[2] = v2;
  long long v24 = v2;
  v25[0] = v2;
  *(_OWORD *)__p = v2;
  long long v23 = v2;
  long long v20 = v2;
  *(_OWORD *)int __src = v2;
  long long v18 = v2;
  long long v19 = v2;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v18);
  uint64_t v3 = v18;
  uint64_t v4 = (char *)&v18 + *(void *)(v18 - 24);
  if (*((_DWORD *)v4 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)&v18 + *(void *)(v18 - 24)));
    BOOL v5 = std::locale::use_facet(&v27, MEMORY[0x1E4FBA258]);
    ((void (*)(const std::locale::facet *, uint64_t))v5->__vftable[2].~facet_0)(v5, 32);
    std::locale::~locale(&v27);
    uint64_t v3 = v18;
  }
  *((_DWORD *)v4 + 36) = 48;
  *(void *)((char *)&v19 + *(void *)(v3 - 24) + 8) = 4;
  uint64_t v6 = (uint64_t *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)" to ", 4);
  uint64_t v7 = *v6;
  unsigned int v8 = (char *)v6 + *(void *)(*v6 - 24);
  if (*((_DWORD *)v8 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)v6 + *(void *)(*v6 - 24)));
    uint64_t v9 = std::locale::use_facet(&v27, MEMORY[0x1E4FBA258]);
    int v10 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v9->__vftable[2].~facet_0)(v9, 32);
    std::locale::~locale(&v27);
    *((_DWORD *)v8 + 36) = v10;
    uint64_t v7 = *v6;
  }
  *((_DWORD *)v8 + 36) = 48;
  *(uint64_t *)((char *)v6 + *(void *)(v7 - 24) + 24) = 4;
  std::ostream::operator<<();
  if ((BYTE8(v24) & 0x10) != 0)
  {
    unsigned int v12 = (unsigned char *)v24;
    if ((void *)v24 < __src[1])
    {
      *(void **)&long long v24 = __src[1];
      unsigned int v12 = __src[1];
    }
    unsigned int v13 = __src[0];
    size_t v11 = v12 - (char *)__src[0];
    if ((unint64_t)(v12 - (char *)__src[0]) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_22;
    }
  }
  else
  {
    if ((BYTE8(v24) & 8) == 0)
    {
      size_t v11 = 0;
      a1[23] = 0;
      goto LABEL_18;
    }
    unsigned int v13 = (const void *)*((void *)&v19 + 1);
    size_t v11 = *((void *)&v20 + 1) - *((void *)&v19 + 1);
    if (*((void *)&v20 + 1) - *((void *)&v19 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_22:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v11 >= 0x17)
  {
    uint64_t v14 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v11 | 7) != 0x17) {
      uint64_t v14 = v11 | 7;
    }
    uint64_t v15 = v14 + 1;
    unsigned int v16 = operator new(v14 + 1);
    *((void *)a1 + 1) = v11;
    *((void *)a1 + 2) = v15 | 0x8000000000000000;
    *(void *)a1 = v16;
    a1 = v16;
    goto LABEL_17;
  }
  a1[23] = v11;
  if (v11) {
LABEL_17:
  }
    memmove(a1, v13, v11);
LABEL_18:
  a1[v11] = 0;
  *(void *)&long long v18 = *MEMORY[0x1E4FBA418];
  *(void *)((char *)&v18 + *(void *)(v18 - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  *((void *)&v18 + 1) = MEMORY[0x1E4FBA470] + 16;
  if (SHIBYTE(v23) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1E4E81CC0](v25);
}

void sub_1E45A16DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_1E45A16F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_1E45A1704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::locale::~locale((std::locale *)(v9 - 56));
  std::ostringstream::~ostringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_1E45A1724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_1E45A1738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_1E45A174C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t ETLDMCDebugGetMessageMasks@<X0>(unsigned int *a1@<X0>, int a2@<W1>, void *a3@<X8>)
{
  switch(a2)
  {
    case 0:
      uint64_t v6 = a1 + 4;
      goto LABEL_6;
    case 1:
      uint64_t v6 = a1 + 20;
      goto LABEL_6;
    case 2:
      uint64_t v6 = a1 + 36;
      goto LABEL_6;
    case 3:
      uint64_t v6 = a1 + 52;
LABEL_6:
      uint64_t v7 = *v6;
      unint64_t v40 = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v39[7] = v8;
      v39[8] = v8;
      v39[5] = v8;
      v39[6] = v8;
      v39[3] = v8;
      v39[4] = v8;
      v39[1] = v8;
      v39[2] = v8;
      long long v38 = v8;
      v39[0] = v8;
      *(_OWORD *)uint64_t v36 = v8;
      long long v37 = v8;
      long long v34 = v8;
      long long v35 = v8;
      long long v32 = v8;
      long long v33 = v8;
      std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v32);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v32, (uint64_t)"Ranges: ", 8);
      uint64_t v9 = (void *)std::ostream::operator<<();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)"\n", 1);
      __dst = a3;
      if (v7)
      {
        unint64_t v10 = 0;
        uint64_t v11 = 8;
        while (2)
        {
          int v31 = -1431655766;
          unsigned int v12 = a1 + 4;
          switch(a2)
          {
            case 0:
              goto LABEL_12;
            case 1:
              unsigned int v12 = a1 + 20;
              if (v10 >= a1[20]) {
                goto LABEL_15;
              }
              goto LABEL_13;
            case 2:
              unsigned int v12 = a1 + 36;
LABEL_12:
              if (v10 < *v12) {
                goto LABEL_13;
              }
              goto LABEL_15;
            case 3:
              unsigned int v12 = a1 + 52;
              if (v10 < a1[52])
              {
LABEL_13:
                unsigned int v13 = *(_DWORD *)(*((void *)v12 + 1) + v11 - 8);
                int v31 = v13;
                int v14 = HIWORD(v13);
              }
              else
              {
LABEL_15:
                LOWORD(v13) = -21846;
                int v14 = 43690;
              }
              ETLDMCDebugGetMessageRange(__p);
              if ((v30 & 0x80u) == 0) {
                uint64_t v15 = __p;
              }
              else {
                uint64_t v15 = (void **)__p[0];
              }
              if ((v30 & 0x80u) == 0) {
                uint64_t v16 = v30;
              }
              else {
                uint64_t v16 = (uint64_t)__p[1];
              }
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v32, (uint64_t)v15, v16);
              v41[0] = 58;
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v32, (uint64_t)v41, 1);
              if ((char)v30 < 0) {
                operator delete(__p[0]);
              }
              int v17 = v14 - (unsigned __int16)v13 + 1;
              long long v18 = operator new[]((8 * v17) | 1u);
              bzero(v18, (8 * v17) | 1u);
              TelephonyUtilBinToHex();
              size_t v19 = strlen((const char *)v18);
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v32, (uint64_t)v18, v19);
              LOBYTE(__p[0]) = 10;
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v32, (uint64_t)__p, 1);
              operator delete[](v18);
              ++v10;
              v11 += 16;
              if (v7 == v10) {
                break;
              }
              continue;
            default:
              goto LABEL_43;
          }
          break;
        }
      }
      if ((BYTE8(v38) & 0x10) != 0)
      {
        uint64_t v22 = v38;
        if ((unint64_t)v38 < *((void *)&v35 + 1))
        {
          *(void *)&long long v38 = *((void *)&v35 + 1);
          uint64_t v22 = *((void *)&v35 + 1);
        }
        unsigned int v21 = __dst;
        long long v23 = (const void *)v35;
        size_t v20 = v22 - v35;
        if ((unint64_t)(v22 - v35) >= 0x7FFFFFFFFFFFFFF8) {
          goto LABEL_42;
        }
      }
      else
      {
        if ((BYTE8(v38) & 8) == 0)
        {
          size_t v20 = 0;
          unsigned int v21 = __dst;
          *((unsigned char *)__dst + 23) = 0;
          goto LABEL_38;
        }
        unsigned int v21 = __dst;
        long long v23 = (const void *)*((void *)&v33 + 1);
        size_t v20 = *((void *)&v34 + 1) - *((void *)&v33 + 1);
        if (*((void *)&v34 + 1) - *((void *)&v33 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_42:
        }
          std::string::__throw_length_error[abi:ne180100]();
      }
      if (v20 >= 0x17)
      {
        uint64_t v24 = (v20 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v20 | 7) != 0x17) {
          uint64_t v24 = v20 | 7;
        }
        uint64_t v25 = v24 + 1;
        unint64_t v26 = operator new(v24 + 1);
        v21[1] = v20;
        v21[2] = v25 | 0x8000000000000000;
        *unsigned int v21 = v26;
        unsigned int v21 = v26;
      }
      else
      {
        *((unsigned char *)v21 + 23) = v20;
        if (!v20) {
          goto LABEL_38;
        }
      }
      memmove(v21, v23, v20);
LABEL_38:
      *((unsigned char *)v21 + v20) = 0;
      *(void *)&long long v32 = *MEMORY[0x1E4FBA418];
      *(void *)((char *)&v32 + *(void *)(v32 - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
      *((void *)&v32 + 1) = MEMORY[0x1E4FBA470] + 16;
      if (SHIBYTE(v37) < 0) {
        operator delete(v36[1]);
      }
      std::streambuf::~streambuf();
      std::ostream::~ostream();
      return MEMORY[0x1E4E81CC0](v39);
    default:
LABEL_43:
      uint64_t result = _ETLDebugPrint();
      __break(1u);
      return result;
  }
}

void sub_1E45A1BC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,char a22)
{
}

uint64_t ETLDMCDebugGetLogCodes@<X0>(uint64_t a1@<X0>, int a2@<W1>, char a3@<W2>, void *a4@<X8>)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  unint64_t v53 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v52[7] = v8;
  v52[8] = v8;
  v52[5] = v8;
  v52[6] = v8;
  v52[3] = v8;
  v52[4] = v8;
  v52[1] = v8;
  v52[2] = v8;
  long long v51 = v8;
  v52[0] = v8;
  *(_OWORD *)__p = v8;
  long long v50 = v8;
  long long v47 = v8;
  long long v48 = v8;
  long long v45 = v8;
  long long v46 = v8;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v45);
  uint64_t v42 = a1 + 144;
  uint64_t v43 = a1 + 208;
  __dst = a4;
  uint64_t v41 = a1 + 80;
  uint64_t v9 = a1 + 16;
  int v44 = a2;
  if (a3)
  {
    int v10 = 0;
    uint64_t v11 = 0;
    while (2)
    {
      uint64_t v12 = v9;
      switch(a2)
      {
        case 0:
          goto LABEL_8;
        case 1:
          uint64_t v13 = *(void *)(v41 + 16);
          if (!v13) {
            goto LABEL_3;
          }
          goto LABEL_9;
        case 2:
          uint64_t v12 = v42;
LABEL_8:
          uint64_t v13 = *(void *)(v12 + 16);
          if (v13) {
            goto LABEL_9;
          }
          goto LABEL_3;
        case 3:
          uint64_t v13 = *(void *)(v43 + 16);
          if (!v13) {
            goto LABEL_3;
          }
LABEL_9:
          int v14 = (int *)(v13 + 16 * v11);
          int v15 = *v14;
          if (*v14)
          {
            uint64_t v16 = *((void *)v14 + 1);
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v45, (uint64_t)"EquipID(", 8);
            int v17 = (void *)std::ostream::operator<<();
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)"): ", 3);
            size_t v18 = strlen((&__const_ETLLOGEquipIDAsString_kNames)[v11]);
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)(&__const_ETLLOGEquipIDAsString_kNames)[v11], v18);
            __str[0] = 58;
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)__str, 1);
            __str[0] = 10;
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v45, (uint64_t)__str, 1);
            unsigned int v19 = 0;
            a2 = v44;
            do
            {
              if ((*(unsigned __int8 *)(v16 + ((unint64_t)v19 >> 3)) >> (v19 & 7)))
              {
                *(void *)&long long v20 = 0xAAAAAAAAAAAAAAAALL;
                *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
                *(_OWORD *)__str = v20;
                long long v56 = v20;
                snprintf(__str, 0x20uLL, "0x%x", v10 + v19);
                char v54 = 9;
                std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v45, (uint64_t)&v54, 1);
                size_t v21 = strlen(__str);
                std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v45, (uint64_t)__str, v21);
                char v54 = 10;
                std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v45, (uint64_t)&v54, 1);
              }
              ++v19;
            }
            while (v15 != v19);
          }
LABEL_3:
          ++v11;
          v10 += 4096;
          if (v11 != 14) {
            continue;
          }
          goto LABEL_27;
        default:
          goto LABEL_46;
      }
    }
  }
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  while (2)
  {
    uint64_t v24 = a1 + 16;
    switch(a2)
    {
      case 0:
        goto LABEL_22;
      case 1:
        uint64_t v25 = *(void *)(a1 + 96);
        if (!v25) {
          goto LABEL_17;
        }
        goto LABEL_23;
      case 2:
        uint64_t v24 = a1 + 144;
LABEL_22:
        uint64_t v25 = *(void *)(v24 + 16);
        if (v25) {
          goto LABEL_23;
        }
        goto LABEL_17;
      case 3:
        uint64_t v25 = *(void *)(a1 + 224);
        if (!v25) {
          goto LABEL_17;
        }
LABEL_23:
        int v26 = *(_DWORD *)(v25 + v22);
        if (v26)
        {
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v45, (uint64_t)"EquipID(", 8);
          std::locale v27 = (void *)std::ostream::operator<<();
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)"): ", 3);
          size_t v28 = strlen((&__const_ETLLOGEquipIDAsString_kNames)[v23]);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)(&__const_ETLLOGEquipIDAsString_kNames)[v23], v28);
          __str[0] = 58;
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)__str, 1);
          size_t v29 = ((v26 + 7) >> 2) | 1;
          unsigned __int8 v30 = operator new[](v29);
          bzero(v30, v29);
          TelephonyUtilBinToHex();
          size_t v31 = strlen((const char *)v30);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v45, (uint64_t)v30, v31);
          __str[0] = 10;
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v45, (uint64_t)__str, 1);
          operator delete[](v30);
          a2 = v44;
        }
LABEL_17:
        ++v23;
        v22 += 16;
        if (v23 != 14) {
          continue;
        }
LABEL_27:
        long long v32 = __dst;
        if ((BYTE8(v51) & 0x10) != 0)
        {
          uint64_t v34 = v51;
          if ((unint64_t)v51 < *((void *)&v48 + 1))
          {
            *(void *)&long long v51 = *((void *)&v48 + 1);
            uint64_t v34 = *((void *)&v48 + 1);
          }
          long long v35 = (const void *)v48;
          size_t v33 = v34 - v48;
          if ((unint64_t)(v34 - v48) >= 0x7FFFFFFFFFFFFFF8) {
            goto LABEL_44;
          }
        }
        else
        {
          if ((BYTE8(v51) & 8) == 0)
          {
            size_t v33 = 0;
            *((unsigned char *)__dst + 23) = 0;
            goto LABEL_40;
          }
          long long v35 = (const void *)*((void *)&v46 + 1);
          size_t v33 = *((void *)&v47 + 1) - *((void *)&v46 + 1);
          if (*((void *)&v47 + 1) - *((void *)&v46 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_44:
          }
            std::string::__throw_length_error[abi:ne180100]();
        }
        if (v33 >= 0x17)
        {
          uint64_t v36 = (v33 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v33 | 7) != 0x17) {
            uint64_t v36 = v33 | 7;
          }
          uint64_t v37 = v36 + 1;
          long long v38 = operator new(v36 + 1);
          __dst[1] = v33;
          __dst[2] = v37 | 0x8000000000000000;
          void *__dst = v38;
          long long v32 = v38;
        }
        else
        {
          *((unsigned char *)__dst + 23) = v33;
          if (!v33) {
            goto LABEL_40;
          }
        }
        memmove(v32, v35, v33);
LABEL_40:
        *((unsigned char *)v32 + v33) = 0;
        *(void *)&long long v45 = *MEMORY[0x1E4FBA418];
        *(void *)((char *)&v45 + *(void *)(v45 - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
        *((void *)&v45 + 1) = MEMORY[0x1E4FBA470] + 16;
        if (SHIBYTE(v50) < 0) {
          operator delete(__p[1]);
        }
        std::streambuf::~streambuf();
        std::ostream::~ostream();
        return MEMORY[0x1E4E81CC0](v52);
      default:
        _ETLDebugPrint();
        __break(1u);
LABEL_46:
        uint64_t result = _ETLDebugPrint();
        __break(1u);
        return result;
    }
  }
}

void sub_1E45A2208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1E45A221C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1E45A2230(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1E45A2244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1E45A2258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t ETLDMCDebugGetEvents@<X0>(uint64_t a1@<X0>, int a2@<W1>, unsigned char *a3@<X8>)
{
  switch(a2)
  {
    case 0:
      uint64_t v6 = a1 + 16;
      goto LABEL_6;
    case 1:
      uint64_t v6 = a1 + 80;
      goto LABEL_6;
    case 2:
      uint64_t v6 = a1 + 144;
      goto LABEL_6;
    case 3:
      uint64_t v6 = a1 + 208;
LABEL_6:
      uint64_t v7 = *(unsigned int *)(v6 + 24);
      unint64_t v32 = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v31[7] = v8;
      v31[8] = v8;
      v31[5] = v8;
      v31[6] = v8;
      v31[3] = v8;
      v31[4] = v8;
      v31[1] = v8;
      v31[2] = v8;
      long long v30 = v8;
      v31[0] = v8;
      *(_OWORD *)size_t v28 = v8;
      long long v29 = v8;
      long long v26 = v8;
      long long v27 = v8;
      long long v24 = v8;
      long long v25 = v8;
      std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v24);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v24, (uint64_t)"Ranges: ", 8);
      uint64_t v9 = (void *)std::ostream::operator<<();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)"\n", 1);
      if (v7)
      {
        unint64_t v10 = 0;
        while (2)
        {
          int v23 = -1431655766;
          uint64_t v11 = a1 + 16;
          switch(a2)
          {
            case 0:
              goto LABEL_13;
            case 1:
              uint64_t v11 = a1 + 80;
              if (v10 >= *(unsigned int *)(a1 + 104)) {
                goto LABEL_15;
              }
              goto LABEL_14;
            case 2:
              uint64_t v11 = a1 + 144;
LABEL_13:
              if (v10 < *(unsigned int *)(v11 + 24)) {
                goto LABEL_14;
              }
              goto LABEL_15;
            case 3:
              uint64_t v11 = a1 + 208;
              if (v10 >= *(unsigned int *)(a1 + 232)) {
                goto LABEL_15;
              }
LABEL_14:
              int v23 = *(_DWORD *)(*(void *)(v11 + 32) + 4 * v10);
LABEL_15:
              ETLDMCDebugGetEventRange(__p);
              if ((v22 & 0x80u) == 0) {
                uint64_t v12 = __p;
              }
              else {
                uint64_t v12 = (void **)__p[0];
              }
              if ((v22 & 0x80u) == 0) {
                uint64_t v13 = v22;
              }
              else {
                uint64_t v13 = (uint64_t)__p[1];
              }
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v24, (uint64_t)v12, v13);
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v24, (uint64_t)"\n", 1);
              if ((char)v22 < 0) {
                operator delete(__p[0]);
              }
              if (v7 != ++v10) {
                continue;
              }
              goto LABEL_25;
            default:
              goto LABEL_43;
          }
        }
      }
LABEL_25:
      if ((BYTE8(v30) & 0x10) != 0)
      {
        uint64_t v15 = v30;
        if ((unint64_t)v30 < *((void *)&v27 + 1))
        {
          *(void *)&long long v30 = *((void *)&v27 + 1);
          uint64_t v15 = *((void *)&v27 + 1);
        }
        uint64_t v16 = (const void *)v27;
        size_t v14 = v15 - v27;
        if ((unint64_t)(v15 - v27) >= 0x7FFFFFFFFFFFFFF8) {
          goto LABEL_42;
        }
      }
      else
      {
        if ((BYTE8(v30) & 8) == 0)
        {
          size_t v14 = 0;
          a3[23] = 0;
          goto LABEL_38;
        }
        uint64_t v16 = (const void *)*((void *)&v25 + 1);
        size_t v14 = *((void *)&v26 + 1) - *((void *)&v25 + 1);
        if (*((void *)&v26 + 1) - *((void *)&v25 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_42:
        }
          std::string::__throw_length_error[abi:ne180100]();
      }
      if (v14 >= 0x17)
      {
        uint64_t v17 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v14 | 7) != 0x17) {
          uint64_t v17 = v14 | 7;
        }
        uint64_t v18 = v17 + 1;
        unsigned int v19 = operator new(v17 + 1);
        *((void *)a3 + 1) = v14;
        *((void *)a3 + 2) = v18 | 0x8000000000000000;
        *(void *)a3 = v19;
        a3 = v19;
      }
      else
      {
        a3[23] = v14;
        if (!v14) {
          goto LABEL_38;
        }
      }
      memmove(a3, v16, v14);
LABEL_38:
      a3[v14] = 0;
      *(void *)&long long v24 = *MEMORY[0x1E4FBA418];
      *(void *)((char *)&v24 + *(void *)(v24 - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
      *((void *)&v24 + 1) = MEMORY[0x1E4FBA470] + 16;
      if (SHIBYTE(v29) < 0) {
        operator delete(v28[1]);
      }
      std::streambuf::~streambuf();
      std::ostream::~ostream();
      return MEMORY[0x1E4E81CC0](v31);
    default:
LABEL_43:
      uint64_t result = _ETLDebugPrint();
      __break(1u);
      return result;
  }
}

void sub_1E45A2664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1E45A267C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, char a20)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  std::ostringstream::~ostringstream((uint64_t)&a20);
  _Unwind_Resume(a1);
}

const char *ETLDMCDebugGetViewAsString(unsigned int a1)
{
  if (a1 > 3) {
    return "Unknown";
  }
  else {
    return (&off_1E6E700E0)[a1];
  }
}

uint64_t ETLDMCDebugGetQtraces@<X0>(void *a1@<X0>, int a2@<W1>, unsigned char *a3@<X8>)
{
  unint64_t v29 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v28[7] = v6;
  v28[8] = v6;
  v28[5] = v6;
  v28[6] = v6;
  v28[3] = v6;
  v28[4] = v6;
  v28[1] = v6;
  v28[2] = v6;
  long long v27 = v6;
  v28[0] = v6;
  *(_OWORD *)__p = v6;
  long long v26 = v6;
  long long v23 = v6;
  long long v24 = v6;
  long long v21 = v6;
  long long v22 = v6;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v21);
  switch(a2)
  {
    case 0:
      uint64_t v7 = a1 + 2;
      if (a1[9]) {
        goto LABEL_11;
      }
      break;
    case 1:
      uint64_t v7 = a1 + 10;
      if (a1[17]) {
        goto LABEL_11;
      }
      break;
    case 2:
      uint64_t v7 = a1 + 18;
      if (a1[25]) {
        goto LABEL_11;
      }
      break;
    case 3:
      uint64_t v7 = a1 + 26;
      if (a1[33]) {
        goto LABEL_11;
      }
      break;
    default:
      _ETLDebugPrint();
      uint64_t v7 = 0;
      if (MEMORY[0x38])
      {
LABEL_11:
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v21, (uint64_t)"Total Clinet IDs: ", 18);
        long long v8 = (void *)std::ostream::operator<<();
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)"\n", 1);
        if (*((_DWORD *)v7 + 12))
        {
          uint64_t v9 = 0;
          unint64_t v10 = 0;
          do
          {
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v21, (uint64_t)"  Clinet ID: ", 13);
            *(_DWORD *)((char *)&v21 + *(void *)(v21 - 24) + 8) = *(_DWORD *)((unsigned char *)&v21 + *(void *)(v21 - 24)
                                                                                              + 8) & 0xFFFFFFB5 | 2;
            uint64_t v11 = (void *)std::ostream::operator<<();
            uint64_t v12 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)", Mask: 0x", 10);
            *(_DWORD *)((char *)v12 + *(void *)(*v12 - 24) + 8) = *(_DWORD *)((unsigned char *)v12
                                                                                + *(void *)(*v12 - 24)
                                                                                + 8) & 0xFFFFFFB5 | 8;
            uint64_t v13 = (void *)std::ostream::operator<<();
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)"\n", 1);
            ++v10;
            v9 += 4;
          }
          while (v10 < *((unsigned int *)v7 + 12));
        }
      }
      break;
  }
  if ((BYTE8(v27) & 0x10) != 0)
  {
    uint64_t v15 = v27;
    if ((unint64_t)v27 < *((void *)&v24 + 1))
    {
      *(void *)&long long v27 = *((void *)&v24 + 1);
      uint64_t v15 = *((void *)&v24 + 1);
    }
    uint64_t v16 = (const void *)v24;
    size_t v14 = v15 - v24;
    if ((unint64_t)(v15 - v24) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_31;
    }
  }
  else
  {
    if ((BYTE8(v27) & 8) == 0)
    {
      size_t v14 = 0;
      a3[23] = 0;
      goto LABEL_27;
    }
    uint64_t v16 = (const void *)*((void *)&v22 + 1);
    size_t v14 = *((void *)&v23 + 1) - *((void *)&v22 + 1);
    if (*((void *)&v23 + 1) - *((void *)&v22 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_31:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v14 >= 0x17)
  {
    uint64_t v17 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17) {
      uint64_t v17 = v14 | 7;
    }
    uint64_t v18 = v17 + 1;
    unsigned int v19 = operator new(v17 + 1);
    *((void *)a3 + 1) = v14;
    *((void *)a3 + 2) = v18 | 0x8000000000000000;
    *(void *)a3 = v19;
    a3 = v19;
    goto LABEL_26;
  }
  a3[23] = v14;
  if (v14) {
LABEL_26:
  }
    memmove(a3, v16, v14);
LABEL_27:
  a3[v14] = 0;
  *(void *)&long long v21 = *MEMORY[0x1E4FBA418];
  *(void *)((char *)&v21 + *(void *)(v21 - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  *((void *)&v21 + 1) = MEMORY[0x1E4FBA470] + 16;
  if (SHIBYTE(v26) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1E4E81CC0](v28);
}

void sub_1E45A2AA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1E45A2ABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1E45A2AD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  v24[0] = 0xAAAAAAAAAAAAAAAALL;
  v24[1] = 0xAAAAAAAAAAAAAAAALL;
  MEMORY[0x1E4E81C10](v24, a1);
  if (LOBYTE(v24[0]))
  {
    long long v6 = (char *)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *((void *)v6 + 5);
    int v8 = *((_DWORD *)v6 + 2);
    int v9 = *((_DWORD *)v6 + 36);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      uint64_t v12 = std::locale::use_facet(__b, MEMORY[0x1E4FBA258]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v12->__vftable[2].~facet_0)(v12, 32);
      std::locale::~locale(__b);
      *((_DWORD *)v6 + 36) = v9;
      uint64_t v10 = a2 + a3;
      if ((v8 & 0xB0) == 0x20) {
        uint64_t v11 = a2 + a3;
      }
      else {
        uint64_t v11 = a2;
      }
      if (!v7) {
        goto LABEL_34;
      }
    }
    else
    {
      uint64_t v10 = a2 + a3;
      if ((*((_DWORD *)v6 + 2) & 0xB0) == 0x20) {
        uint64_t v11 = a2 + a3;
      }
      else {
        uint64_t v11 = a2;
      }
      if (!v7) {
        goto LABEL_34;
      }
    }
    uint64_t v13 = *((void *)v6 + 3);
    BOOL v14 = v13 <= a3;
    size_t v15 = v13 - a3;
    if (v14) {
      size_t v16 = 0;
    }
    else {
      size_t v16 = v15;
    }
    if (v11 - a2 < 1
      || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 96))(v7, a2, v11 - a2) == v11 - a2)
    {
      if ((uint64_t)v16 >= 1)
      {
        memset(__b, 170, sizeof(__b));
        if (v16 >= 0x7FFFFFFFFFFFFFF8) {
          std::string::__throw_length_error[abi:ne180100]();
        }
        if (v16 >= 0x17)
        {
          uint64_t v18 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v16 | 7) != 0x17) {
            uint64_t v18 = v16 | 7;
          }
          uint64_t v19 = v18 + 1;
          uint64_t v17 = (std::locale::__imp *)operator new(v18 + 1);
          __b[1].__locale_ = (std::locale::__imp *)v16;
          __b[2].__locale_ = (std::locale::__imp *)(v19 | 0x8000000000000000);
          __b[0].__locale_ = v17;
        }
        else
        {
          HIBYTE(__b[2].__locale_) = v16;
          uint64_t v17 = (std::locale::__imp *)__b;
        }
        memset(v17, v9, v16);
        *((unsigned char *)v17 + v16) = 0;
        if (SHIBYTE(__b[2].__locale_) >= 0) {
          locale = __b;
        }
        else {
          locale = __b[0].__locale_;
        }
        uint64_t v21 = (*(uint64_t (**)(uint64_t, void *, size_t))(*(void *)v7 + 96))(v7, locale, v16);
        uint64_t v22 = v21;
        if (SHIBYTE(__b[2].__locale_) < 0)
        {
          operator delete(__b[0].__locale_);
          if (v22 != v16) {
            goto LABEL_34;
          }
        }
        else if (v21 != v16)
        {
          goto LABEL_34;
        }
      }
      if (v10 - v11 < 1
        || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 96))(v7, v11, v10 - v11) == v10 - v11)
      {
        *((void *)v6 + 3) = 0;
        goto LABEL_35;
      }
    }
LABEL_34:
    std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
  }
LABEL_35:
  MEMORY[0x1E4E81C20](v24);
  return a1;
}

void sub_1E45A2DE0(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  MEMORY[0x1E4E81C20](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v17 + *(void *)(*v17 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x1E45A2DB4);
}

void sub_1E45A2E4C(_Unwind_Exception *a1)
{
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100]()
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception);
  __cxa_throw(exception, (struct type_info *)off_1E6E70020, MEMORY[0x1E4FBA1C8]);
}

void sub_1E45A2EB0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1)
{
  uint64_t result = std::logic_error::logic_error(a1, "basic_string");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

uint64_t crc_16_calc(unsigned __int8 *a1, unsigned int a2)
{
  if (a2 < 8)
  {
    int v3 = 0xFFFF;
    if (!(_WORD)a2) {
      return (unsigned __int16)~(_WORD)v3;
    }
  }
  else
  {
    unsigned int v2 = ((unsigned __int16)(a2 - 8) >> 3) + 1;
    int v3 = 0xFFFF;
    uint64_t v4 = a1;
    do
    {
      int v5 = *v4++;
      int v3 = crc16_table[v5 ^ ((unsigned __int16)(v3 & 0xFF00) >> 8)] ^ (v3 << 8);
      LOWORD(a2) = a2 - 8;
    }
    while ((unsigned __int16)a2 > 7u);
    a1 += v2;
    if (!(_WORD)a2) {
      return (unsigned __int16)~(_WORD)v3;
    }
  }
  __int16 v6 = *a1 << 8;
  do
  {
    LOWORD(a2) = a2 - 1;
    __int16 v7 = v6 ^ v3;
    v3 *= 2;
    if (v7 < 0) {
      v3 ^= 0x1021u;
    }
    __int16 v6 = (2 * v6) & 0xFE00;
  }
  while ((_WORD)a2);
  return (unsigned __int16)~(_WORD)v3;
}

uint64_t crc_16_l_calc(char *a1, unsigned int a2)
{
  if (a2 < 8)
  {
    LOWORD(v3) = -1;
    if (!(_WORD)a2) {
      return (unsigned __int16)~(_WORD)v3;
    }
  }
  else
  {
    unsigned int v2 = ((unsigned __int16)(a2 - 8) >> 3) + 1;
    LOWORD(v3) = -1;
    uint64_t v4 = a1;
    do
    {
      char v5 = *v4++;
      int v3 = crc_16_l_table[(v5 ^ v3)] ^ ((unsigned __int16)(v3 & 0xFF00) >> 8);
      LOWORD(a2) = a2 - 8;
    }
    while ((unsigned __int16)a2 > 7u);
    a1 += v2;
    if (!(_WORD)a2) {
      return (unsigned __int16)~(_WORD)v3;
    }
  }
  unsigned __int16 v6 = *a1 << 8;
  do
  {
    LOWORD(a2) = a2 - 1;
    char v7 = v6 ^ v3;
    LOWORD(v3) = (unsigned __int16)v3 >> 1;
    if (v7) {
      LOWORD(v3) = v3 ^ 0x8408;
    }
    v6 >>= 1;
  }
  while ((_WORD)a2);
  return (unsigned __int16)~(_WORD)v3;
}

uint64_t crc_30_calc(char *a1, unsigned int a2)
{
  if (a2 < 8)
  {
    unsigned int v3 = 0x3FFFFFFF;
    if (!(_WORD)a2) {
      return ~v3 & 0x3FFFFFFF;
    }
  }
  else
  {
    unsigned int v2 = ((unsigned __int16)(a2 - 8) >> 3) + 1;
    unsigned int v3 = 0x3FFFFFFF;
    uint64_t v4 = a1;
    do
    {
      char v5 = *v4++;
      unsigned int v3 = crc30_table[(v5 ^ (v3 >> 22))] ^ (v3 << 8);
      LOWORD(a2) = a2 - 8;
    }
    while ((unsigned __int16)a2 > 7u);
    a1 += v2;
    if (!(_WORD)a2) {
      return ~v3 & 0x3FFFFFFF;
    }
  }
  int v6 = *a1 << 22;
  do
  {
    LOWORD(a2) = a2 - 1;
    int v7 = v6 ^ v3;
    v3 *= 2;
    if ((v7 & 0x20000000) != 0) {
      v3 ^= 0x6030B9C7u;
    }
    v6 *= 2;
  }
  while ((_WORD)a2);
  return ~v3 & 0x3FFFFFFF;
}

uint64_t crc_30_step(int a1, char *a2, unsigned int a3)
{
  unsigned int v3 = ~a1 & 0x3FFFFFFF;
  if (a3 >= 8)
  {
    unsigned int v4 = ((unsigned __int16)(a3 - 8) >> 3) + 1;
    char v5 = a2;
    do
    {
      char v6 = *v5++;
      unsigned int v3 = crc30_table[(v6 ^ (v3 >> 22))] ^ (v3 << 8);
      LOWORD(a3) = a3 - 8;
    }
    while ((unsigned __int16)a3 > 7u);
    a2 += v4;
  }
  if ((_WORD)a3)
  {
    int v7 = *a2 << 22;
    do
    {
      LOWORD(a3) = a3 - 1;
      int v8 = v7 ^ v3;
      v3 *= 2;
      if ((v8 & 0x20000000) != 0) {
        v3 ^= 0x6030B9C7u;
      }
      v7 *= 2;
    }
    while ((_WORD)a3);
  }
  return ~v3 & 0x3FFFFFFF;
}

uint64_t crc_16_step(uint64_t result, unsigned __int8 *a2, int a3)
{
  if (a3)
  {
    __int16 v3 = ~(_WORD)result;
    do
    {
      int v4 = *a2++;
      __int16 v3 = crc16_table[v4 ^ ((unsigned __int16)(v3 & 0xFF00) >> 8)] ^ (v3 << 8);
      --a3;
    }
    while ((_WORD)a3);
    LOWORD(result) = ~v3;
  }
  return (unsigned __int16)result;
}

uint64_t crc_16_l_step(uint64_t result, char *a2, int a3)
{
  if (a3)
  {
    LOWORD(v3) = ~(_WORD)result;
    do
    {
      char v4 = *a2++;
      int v3 = crc_16_l_table[(v4 ^ v3)] ^ ((unsigned __int16)(v3 & 0xFF00) >> 8);
      --a3;
    }
    while (a3);
    LOWORD(result) = ~(_WORD)v3;
  }
  return (unsigned __int16)result;
}

uint64_t crc_32_calc(unsigned __int8 *a1, unsigned int a2, uint64_t a3)
{
  if (a2 >= 8)
  {
    unsigned int v3 = ((unsigned __int16)(a2 - 8) >> 3) + 1;
    char v4 = a1;
    do
    {
      int v5 = *v4++;
      a3 = (crc32_table[v5 ^ BYTE3(a3)] ^ (a3 << 8));
      LOWORD(a2) = a2 - 8;
    }
    while ((unsigned __int16)a2 > 7u);
    a1 += v3;
  }
  if ((_WORD)a2)
  {
    int v6 = *a1 << 24;
    do
    {
      LOWORD(a2) = a2 - 1;
      if ((int)(v6 ^ a3) >= 0) {
        a3 = (2 * a3);
      }
      else {
        a3 = (2 * a3) ^ 0x4C11DB7u;
      }
      v6 *= 2;
    }
    while ((_WORD)a2);
  }
  return a3;
}

uint64_t APPLIB_DIAG_GPS_SA_RF_VERIF_MODE_SWITCH(_DWORD *a1, int a2, int a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0x12) {
    return result;
  }
  bzero(a1, a2);
  *a1 = 6622539;
  *((_WORD *)a1 + 2) = 276;
  *((unsigned char *)a1 + 6) = a3;
  __int16 v7 = crc_16_l_table[a3 ^ 0x3B] ^ 0xFFB0;
  *((unsigned char *)a1 + 7) = crc_16_l_table[a3 ^ 0x3B] ^ 0xB0;
  int v8 = HIBYTE(v7);
  *((unsigned char *)a1 + 8) = HIBYTE(v7);
  if (a2 < 18) {
    return 0xFFFFFFFFLL;
  }
  int v9 = v7;
  bzero(v15, 0x7FAuLL);
  int __src = 6622539;
  __int16 v14 = 276;
  if ((a3 - 125) <= 1)
  {
    v15[0] = 125;
    int v10 = 7;
    v15[1] = a3 ^ 0x20;
    uint64_t v11 = 8;
    if ((v9 - 125) > 1) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  int v10 = 6;
  v15[0] = a3;
  uint64_t v11 = 7;
  if ((v9 - 125) <= 1)
  {
LABEL_9:
    *((unsigned char *)&__src + v11) = 125;
    LODWORD(v11) = v10 + 2;
    LOBYTE(v9) = v9 ^ 0x20;
  }
LABEL_10:
  *((unsigned char *)&__src + v11) = v9;
  uint64_t v12 = v11 + 1;
  if ((v8 - 125) <= 1)
  {
    *((unsigned char *)&__src + v12) = 125;
    LOBYTE(v8) = v8 ^ 0x20;
    LODWORD(v12) = v11 + 2;
  }
  *((unsigned char *)&__src + v12) = v8;
  memcpy(a1, &__src, v12 + 1);
  uint64_t result = (v12 + 2);
  *((unsigned char *)a1 + v12 + 1) = 126;
  return result;
}

uint64_t APPLIB_DIAG_GPS_GEN8_HW_CONFIG(char *a1, int a2, uint64_t a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x16)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 6622539;
    *((_WORD *)a1 + 2) = 12826;
    char v7 = *(unsigned char *)(a3 + 4);
    *(_DWORD *)(a1 + 6) = *(_DWORD *)a3;
    a1[10] = v7;
    *(_WORD *)(a1 + 11) = 0;
    a1[13] = 0;
    uint64_t v8 = a1[6];
    unsigned __int16 v9 = crc_16_l_table[v8 ^ 0x33];
    unsigned __int16 v10 = crc_16_l_table[a1[7] ^ 0xD6 ^ v9];
    unsigned __int16 v11 = crc_16_l_table[(a1[8] ^ v10 ^ HIBYTE(v9))];
    unsigned __int16 v12 = crc_16_l_table[(a1[9] ^ v11 ^ HIBYTE(v10))];
    unsigned __int16 v13 = crc_16_l_table[(a1[10] ^ v12 ^ HIBYTE(v11))];
    unsigned int v14 = crc_16_l_table[(v13 ^ HIBYTE(v12))];
    unsigned int v15 = crc_16_l_table[(v14 ^ HIBYTE(v13))];
    unsigned __int16 v16 = crc_16_l_table[crc_16_l_table[(v14 ^ HIBYTE(v13))] ^ (v14 >> 8)];
    *((_WORD *)a1 + 7) = v16 ^ ~HIBYTE(crc_16_l_table[(v14 ^ HIBYTE(v13))]);
    if (a2 >= 32)
    {
      bzero(__src, 0x800uLL);
      int v17 = *a1;
      if ((v17 - 125) > 1)
      {
        unsigned int v18 = 0;
      }
      else
      {
        __src[0] = 125;
        LOBYTE(v17) = v17 ^ 0x20;
        unsigned int v18 = 1;
      }
      __src[v18] = v17;
      uint64_t v19 = v18 + 1;
      int v20 = a1[1];
      if ((v20 - 125) <= 1)
      {
        __src[v19] = 125;
        LODWORD(v19) = v18 | 2;
        LOBYTE(v20) = v20 ^ 0x20;
      }
      uint64_t v21 = &__src[v19];
      *uint64_t v21 = v20;
      *(_DWORD *)(v21 + 1) = 840564837;
      uint64_t v22 = v19 + 5;
      if ((v8 - 125) <= 1)
      {
        __src[v22] = 125;
        LOBYTE(v8) = v8 ^ 0x20;
        LODWORD(v22) = v19 + 6;
      }
      __src[v22] = v8;
      uint64_t v23 = v22 + 1;
      int v24 = a1[7];
      if ((v24 - 125) <= 1)
      {
        __src[v23] = 125;
        LODWORD(v23) = v22 + 2;
        LOBYTE(v24) = v24 ^ 0x20;
      }
      __src[v23] = v24;
      uint64_t v25 = v23 + 1;
      int v26 = a1[8];
      if ((v26 - 125) <= 1)
      {
        __src[v25] = 125;
        LODWORD(v25) = v23 + 2;
        LOBYTE(v26) = v26 ^ 0x20;
      }
      __src[v25] = v26;
      uint64_t v27 = v25 + 1;
      int v28 = a1[9];
      if ((v28 - 125) <= 1)
      {
        __src[v27] = 125;
        LOBYTE(v28) = v28 ^ 0x20;
        LODWORD(v27) = v25 + 2;
      }
      int v29 = ~(v16 ^ BYTE1(v15));
      __src[v27] = v28;
      uint64_t v30 = v27 + 1;
      int v31 = a1[10];
      if ((v31 - 125) <= 1)
      {
        __src[v30] = 125;
        LOBYTE(v31) = v31 ^ 0x20;
        LODWORD(v30) = v27 + 2;
      }
      int v32 = ((unsigned __int16)(v16 ^ ~(unsigned __int16)(v15 >> 8)) >> 8);
      size_t v33 = &__src[v30];
      *size_t v33 = v31;
      *(_WORD *)(v33 + 1) = 0;
      v33[3] = 0;
      uint64_t v34 = v30 + 4;
      if ((v29 - 125) <= 1)
      {
        __src[v34] = 125;
        LOBYTE(v29) = v29 ^ 0x20;
        LODWORD(v34) = v30 + 5;
      }
      __src[v34] = v29;
      uint64_t v35 = v34 + 1;
      if ((v32 - 125) <= 1)
      {
        __src[v35] = 125;
        LOBYTE(v32) = v32 ^ 0x20;
        LODWORD(v35) = v34 + 2;
      }
      __src[v35] = v32;
      memcpy(a1, __src, v35 + 1);
      uint64_t result = (v35 + 2);
      a1[v35 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_FTM_GNSS_EXTERNAL_LNA(unsigned __int8 *a1, int a2, int a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0x11) {
    return result;
  }
  bzero(a1, a2);
  *(_DWORD *)a1 = 2231115;
  a1[4] = -3;
  a1[6] = a3;
  uint64_t v7 = a1[5];
  unsigned __int16 v8 = crc_16_l_table[crc_16_l_table[v7 ^ 0xBA] ^ a3 ^ 0xEC];
  unsigned __int16 v9 = crc_16_l_table[(a1[7] ^ v8 ^ HIBYTE(crc_16_l_table[v7 ^ 0xBA]))];
  unsigned int v10 = crc_16_l_table[(a1[8] ^ v9 ^ HIBYTE(v8))];
  int v11 = crc_16_l_table[(a1[9] ^ v10 ^ HIBYTE(v9))];
  int v12 = v11 ^ ~(v10 >> 8);
  *((_WORD *)a1 + 5) = v11 ^ ~HIBYTE(crc_16_l_table[(a1[8] ^ v9 ^ HIBYTE(v8))]);
  if (a2 < 24) {
    return 0xFFFFFFFFLL;
  }
  bzero(v27, 0x7FBuLL);
  int __src = 2231115;
  char v26 = -3;
  if ((v7 - 125) <= 1)
  {
    v27[0] = 125;
    int v13 = 6;
    v27[1] = v7 ^ 0x20;
    uint64_t v14 = 7;
    if ((a3 - 125) > 1) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  int v13 = 5;
  v27[0] = v7;
  uint64_t v14 = 6;
  if ((a3 - 125) <= 1)
  {
LABEL_9:
    *((unsigned char *)&__src + v14) = 125;
    LOBYTE(a3) = a3 ^ 0x20;
    LODWORD(v14) = v13 + 2;
  }
LABEL_10:
  *((unsigned char *)&__src + v14) = a3;
  uint64_t v15 = v14 + 1;
  int v16 = a1[7];
  if ((v16 - 125) <= 1)
  {
    *((unsigned char *)&__src + v15) = 125;
    LODWORD(v15) = v14 + 2;
    LOBYTE(v16) = v16 ^ 0x20;
  }
  *((unsigned char *)&__src + v15) = v16;
  uint64_t v17 = v15 + 1;
  int v18 = a1[8];
  if ((v18 - 125) <= 1)
  {
    *((unsigned char *)&__src + v17) = 125;
    LOBYTE(v18) = v18 ^ 0x20;
    LODWORD(v17) = v15 + 2;
  }
  int v19 = ~(v11 ^ BYTE1(v10));
  *((unsigned char *)&__src + v17) = v18;
  uint64_t v20 = v17 + 1;
  int v21 = a1[9];
  if ((v21 - 125) <= 1)
  {
    *((unsigned char *)&__src + v20) = 125;
    LOBYTE(v21) = v21 ^ 0x20;
    LODWORD(v20) = v17 + 2;
  }
  char v22 = (unsigned __int16)(v11 ^ ~(unsigned __int16)(v10 >> 8)) >> 8;
  *((unsigned char *)&__src + v20) = v21;
  uint64_t v23 = v20 + 1;
  if ((v19 - 125) <= 1)
  {
    *((unsigned char *)&__src + v23) = 125;
    LOBYTE(v19) = v19 ^ 0x20;
    LODWORD(v23) = v20 + 2;
  }
  *((unsigned char *)&__src + v23) = v19;
  uint64_t v24 = v23 + 1;
  if (BYTE1(v12) - 125 <= 1)
  {
    *((unsigned char *)&__src + v24) = 125;
    char v22 = BYTE1(v12) ^ 0x20;
    LODWORD(v24) = v23 + 2;
  }
  *((unsigned char *)&__src + v24) = v22;
  memcpy(a1, &__src, v24 + 1);
  uint64_t result = (v24 + 2);
  a1[v24 + 1] = 126;
  return result;
}

uint64_t APPLIB_DIAG_GPS_GEN8_StartIQTest(unsigned __int8 *a1, int a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 16)
  {
    bzero(a1, a2);
    *(_OWORD *)a1 = xmmword_1E45B4A20;
    *((_WORD *)a1 + 8) = 2560;
    unsigned __int16 v5 = crc_16_l_table[a1[7] ^ 0x6DLL];
    unsigned __int16 v6 = crc_16_l_table[a1[8] ^ 0xA6 ^ v5];
    unsigned __int16 v7 = crc_16_l_table[(a1[9] ^ v6 ^ HIBYTE(v5))];
    unsigned __int16 v8 = crc_16_l_table[(a1[10] ^ v7 ^ HIBYTE(v6))];
    unsigned __int16 v9 = crc_16_l_table[(a1[11] ^ v8 ^ HIBYTE(v7))];
    unsigned __int16 v10 = crc_16_l_table[(a1[12] ^ v9 ^ HIBYTE(v8))];
    unsigned __int16 v11 = crc_16_l_table[(a1[13] ^ v10 ^ HIBYTE(v9))];
    unsigned __int16 v12 = crc_16_l_table[(a1[14] ^ v11 ^ HIBYTE(v10))];
    unsigned int v13 = crc_16_l_table[(a1[15] ^ v12 ^ HIBYTE(v11))];
    unsigned __int16 v14 = crc_16_l_table[(v13 ^ HIBYTE(v12))];
    LOWORD(v13) = crc_16_l_table[v14 ^ (v13 >> 8) ^ 0xA];
    unsigned __int16 v15 = crc_16_l_table[(a1[18] ^ v13 ^ HIBYTE(v14))];
    LOWORD(v13) = crc_16_l_table[(a1[19] ^ v15 ^ BYTE1(v13))];
    unsigned int v16 = crc_16_l_table[(a1[20] ^ v13 ^ HIBYTE(v15))];
    *((_WORD *)a1 + 11) = crc_16_l_table[(a1[21] ^ v16 ^ BYTE1(v13))] ^ ~(unsigned __int16)(v16 >> 8);
    if (a2 >= 0x30)
    {
      bzero(__src, 0x800uLL);
      uint64_t v17 = 0;
      LODWORD(v18) = 0;
      do
      {
        while (1)
        {
          int v20 = a1[v17];
          if ((v20 - 125) > 1) {
            break;
          }
          int v19 = v18 + 1;
          __src[(int)v18] = 125;
          __src[(int)v18 + 1] = v20 ^ 0x20;
          size_t v18 = (int)v18 + 1 + 1;
          if (++v17 == 24) {
            goto LABEL_9;
          }
        }
        int v19 = v18;
        __src[(int)v18] = v20;
        size_t v18 = (int)v18 + 1;
        ++v17;
      }
      while (v17 != 24);
LABEL_9:
      memcpy(a1, __src, v18);
      uint64_t result = (v19 + 2);
      a1[v18] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_GPS_GEN8_SV_TRACK(char *a1, int a2, _DWORD *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x12)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 6622539;
    *((_WORD *)a1 + 2) = 12827;
    int v7 = *(_DWORD *)((char *)a3 + 3);
    *(_DWORD *)(a1 + 6) = *a3;
    *(_DWORD *)(a1 + 9) = v7;
    uint64_t v8 = a1[6];
    LOWORD(v7) = crc_16_l_table[v8 ^ 0xEB];
    unsigned __int16 v9 = crc_16_l_table[(a1[7] ^ v7) ^ 0xCF];
    LOWORD(v7) = crc_16_l_table[(a1[8] ^ v9 ^ BYTE1(v7))];
    unsigned __int16 v10 = crc_16_l_table[(a1[9] ^ v7 ^ HIBYTE(v9))];
    LOWORD(v7) = crc_16_l_table[(a1[10] ^ v10 ^ BYTE1(v7))];
    unsigned int v11 = crc_16_l_table[(a1[11] ^ v7 ^ HIBYTE(v10))];
    unsigned __int16 v12 = crc_16_l_table[(a1[12] ^ v11 ^ BYTE1(v7))];
    *(_WORD *)(a1 + 13) = v12 ^ ~HIBYTE(crc_16_l_table[(a1[11] ^ v7 ^ HIBYTE(v10))]);
    if (a2 >= 30)
    {
      bzero(v32, 0x7FAuLL);
      int __src = 6622539;
      __int16 v31 = 12827;
      if ((v8 - 125) > 1)
      {
        unsigned int v13 = 6;
      }
      else
      {
        v32[0] = 125;
        LOBYTE(v8) = v8 ^ 0x20;
        unsigned int v13 = 7;
      }
      *((unsigned char *)&__src + v13) = v8;
      uint64_t v14 = v13 + 1;
      int v15 = a1[7];
      if ((v15 - 125) <= 1)
      {
        *((unsigned char *)&__src + v14) = 125;
        LODWORD(v14) = v13 + 2;
        LOBYTE(v15) = v15 ^ 0x20;
      }
      *((unsigned char *)&__src + v14) = v15;
      uint64_t v16 = v14 + 1;
      int v17 = a1[8];
      if ((v17 - 125) <= 1)
      {
        *((unsigned char *)&__src + v16) = 125;
        LOBYTE(v17) = v17 ^ 0x20;
        LODWORD(v16) = v14 + 2;
      }
      *((unsigned char *)&__src + v16) = v17;
      uint64_t v18 = v16 + 1;
      int v19 = a1[9];
      if ((v19 - 125) <= 1)
      {
        *((unsigned char *)&__src + v18) = 125;
        LODWORD(v18) = v16 + 2;
        LOBYTE(v19) = v19 ^ 0x20;
      }
      *((unsigned char *)&__src + v18) = v19;
      uint64_t v20 = v18 + 1;
      int v21 = a1[10];
      if ((v21 - 125) <= 1)
      {
        *((unsigned char *)&__src + v20) = 125;
        LODWORD(v20) = v18 + 2;
        LOBYTE(v21) = v21 ^ 0x20;
      }
      *((unsigned char *)&__src + v20) = v21;
      uint64_t v22 = v20 + 1;
      int v23 = a1[11];
      if ((v23 - 125) <= 1)
      {
        *((unsigned char *)&__src + v22) = 125;
        LOBYTE(v23) = v23 ^ 0x20;
        LODWORD(v22) = v20 + 2;
      }
      int v24 = ~(v12 ^ BYTE1(v11));
      *((unsigned char *)&__src + v22) = v23;
      uint64_t v25 = v22 + 1;
      int v26 = a1[12];
      if ((v26 - 125) <= 1)
      {
        *((unsigned char *)&__src + v25) = 125;
        LOBYTE(v26) = v26 ^ 0x20;
        LODWORD(v25) = v22 + 2;
      }
      int v27 = ((unsigned __int16)(v12 ^ ~(unsigned __int16)(v11 >> 8)) >> 8);
      *((unsigned char *)&__src + v25) = v26;
      uint64_t v28 = v25 + 1;
      if ((v24 - 125) <= 1)
      {
        *((unsigned char *)&__src + v28) = 125;
        LOBYTE(v24) = v24 ^ 0x20;
        LODWORD(v28) = v25 + 2;
      }
      *((unsigned char *)&__src + v28) = v24;
      uint64_t v29 = v28 + 1;
      if ((v27 - 125) <= 1)
      {
        *((unsigned char *)&__src + v29) = 125;
        LOBYTE(v27) = v27 ^ 0x20;
        LODWORD(v29) = v28 + 2;
      }
      *((unsigned char *)&__src + v29) = v27;
      memcpy(a1, &__src, v29 + 1);
      uint64_t result = (v29 + 2);
      a1[v29 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_MemoryPoke_Byte(char *a1, int a2, int a3, void *__src, int a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a5 && a3 && a1 && a2 >= 0xD && __src)
  {
    *(void *)a1 = 0;
    *(void *)(a1 + 5) = 0;
    *a1 = 5;
    *(_DWORD *)(a1 + 1) = a3;
    a1[5] = a5;
    memcpy(a1 + 6, __src, a5);
    int v9 = 8 * (a5 + 6);
    if (8 * ((_WORD)a5 + 6))
    {
      LOWORD(v10) = -1;
      unsigned int v11 = a1;
      do
      {
        char v12 = *v11++;
        int v10 = crc_16_l_table[(v12 ^ v10)] ^ ((unsigned __int16)(v10 & 0xFF00) >> 8);
        v9 -= 8;
      }
      while ((_WORD)v9);
      char v13 = ~(_BYTE)v10;
      char v14 = (unsigned __int16)~(_WORD)v10 >> 8;
    }
    else
    {
      char v13 = 0;
      char v14 = 0;
    }
    a1[a5 + 6] = v13;
    a1[a5 + 7] = v14;
    uint64_t v15 = (a5 + 8);
    uint64_t result = 0xFFFFFFFFLL;
    if ((int)v15 <= 1024 && 2 * (int)v15 <= a2)
    {
      bzero(__srca, 0x800uLL);
      if ((int)v15 < 1)
      {
        int v16 = 0;
      }
      else
      {
        int v16 = 0;
        int v17 = (unsigned __int8 *)a1;
        do
        {
          int v19 = *v17++;
          char v18 = v19;
          if ((v19 - 125) <= 1)
          {
            __srca[v16] = 125;
            v18 ^= 0x20u;
            ++v16;
          }
          __srca[v16++] = v18;
          --v15;
        }
        while (v15);
      }
      memcpy(a1, __srca, v16);
      uint64_t result = (v16 + 1);
      a1[v16] = 126;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_MemoryPoke_Word(char *a1, int a2, int a3, void *__src, int a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a5 && a3 && a1 && a2 >= 0xD && __src)
  {
    *(void *)a1 = 0;
    *a1 = 6;
    *(_DWORD *)(a1 + 1) = a3;
    int v8 = 2 * a5;
    *(void *)(a1 + 5) = 0;
    a1[5] = a5;
    memcpy(a1 + 6, __src, 2 * a5);
    int v9 = 8 * (v8 + 6);
    if ((v9 & 0xFFF0) != 0)
    {
      LOWORD(v10) = -1;
      unsigned int v11 = a1;
      do
      {
        char v12 = *v11++;
        int v10 = crc_16_l_table[(v12 ^ v10)] ^ ((unsigned __int16)(v10 & 0xFF00) >> 8);
        v9 -= 8;
      }
      while ((_WORD)v9);
      char v13 = ~(_BYTE)v10;
      char v14 = (unsigned __int16)~(_WORD)v10 >> 8;
    }
    else
    {
      char v13 = 0;
      char v14 = 0;
    }
    a1[v8 + 6] = v13;
    a1[v8 + 7] = v14;
    uint64_t v15 = (v8 + 8);
    uint64_t result = 0xFFFFFFFFLL;
    if ((int)v15 <= 1024 && 2 * (int)v15 <= a2)
    {
      bzero(__srca, 0x800uLL);
      if ((int)v15 < 1)
      {
        int v16 = 0;
      }
      else
      {
        int v16 = 0;
        int v17 = (unsigned __int8 *)a1;
        do
        {
          int v19 = *v17++;
          char v18 = v19;
          if ((v19 - 125) <= 1)
          {
            __srca[v16] = 125;
            v18 ^= 0x20u;
            ++v16;
          }
          __srca[v16++] = v18;
          --v15;
        }
        while (v15);
      }
      memcpy(a1, __srca, v16);
      uint64_t result = (v16 + 1);
      a1[v16] = 126;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_MemoryPoke_DWord(char *a1, int a2, int a3, void *__src, int a5)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a5)
  {
    if (a3)
    {
      if (a1)
      {
        if (a2 >= 0xD)
        {
          if (__src)
          {
            *(void *)a1 = 0;
            *a1 = 7;
            *(_DWORD *)(a1 + 1) = a3;
            int v8 = 4 * a5;
            *(void *)(a1 + 5) = 0;
            a1[5] = a5;
            memcpy(a1 + 6, __src, 4 * a5);
            int v9 = 8 * (v8 + 6);
            LOWORD(v10) = -1;
            unsigned int v11 = a1;
            do
            {
              char v12 = *v11++;
              int v10 = crc_16_l_table[(v12 ^ v10)] ^ ((unsigned __int16)(v10 & 0xFF00) >> 8);
              v9 -= 8;
            }
            while ((_WORD)v9);
            a1[v8 + 6] = ~(_BYTE)v10;
            a1[v8 + 7] = (unsigned __int16)~(_WORD)v10 >> 8;
            uint64_t v13 = (v8 + 8);
            uint64_t result = 0xFFFFFFFFLL;
            if ((int)v13 <= 1024 && 2 * (int)v13 <= a2)
            {
              bzero(__srca, 0x800uLL);
              if ((int)v13 < 1)
              {
                int v14 = 0;
              }
              else
              {
                int v14 = 0;
                uint64_t v15 = (unsigned __int8 *)a1;
                do
                {
                  int v17 = *v15++;
                  char v16 = v17;
                  if ((v17 - 125) <= 1)
                  {
                    __srca[v14] = 125;
                    v16 ^= 0x20u;
                    ++v14;
                  }
                  __srca[v14++] = v16;
                  --v13;
                }
                while (v13);
              }
              memcpy(a1, __srca, v14);
              uint64_t result = (v14 + 1);
              a1[v14] = 126;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_GPS_SessionControl(char *a1, int a2, char a3, void *__src, int a5)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 39 && __src && a5)
  {
    *(void *)a1 = 0;
    *(void *)(a1 + 5) = 0;
    *a1 = 108;
    a1[1] = a3;
    *((_WORD *)a1 + 1) = a5;
    memcpy(a1 + 4, __src, a5);
    uint64_t v9 = a5 + 4;
    int v10 = 8 * (a5 + 4);
    if (8 * ((_WORD)a5 + 4))
    {
      LOWORD(v11) = -1;
      char v12 = a1;
      do
      {
        char v13 = *v12++;
        int v11 = crc_16_l_table[(v13 ^ v11)] ^ ((unsigned __int16)(v11 & 0xFF00) >> 8);
        v10 -= 8;
      }
      while ((_WORD)v10);
      a1[v9] = ~(_BYTE)v11;
      a1[a5 + 5] = (unsigned __int16)~(_WORD)v11 >> 8;
      uint64_t result = 0xFFFFFFFFLL;
      if (a5 > 1018) {
        return result;
      }
    }
    else
    {
      a1[v9] = 0;
      a1[a5 + 5] = 0;
      uint64_t result = 0xFFFFFFFFLL;
      if (a5 > 1018) {
        return result;
      }
    }
    uint64_t v14 = (a5 + 6);
    if (2 * (int)v14 <= a2)
    {
      bzero(__srca, 0x800uLL);
      if (a5 < -5)
      {
        int v15 = 0;
      }
      else
      {
        int v15 = 0;
        char v16 = (unsigned __int8 *)a1;
        do
        {
          int v18 = *v16++;
          char v17 = v18;
          if ((v18 - 125) <= 1)
          {
            __srca[v15] = 125;
            v17 ^= 0x20u;
            ++v15;
          }
          __srca[v15++] = v17;
          --v14;
        }
        while (v14);
      }
      memcpy(a1, __srca, v15);
      uint64_t result = (v15 + 1);
      a1[v15] = 126;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_CreateFile(char *a1, int a2, const void *a3, int a4)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a4 <= 32 && a4 + 7 <= a2)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 523851;
    memcpy(a1 + 4, a3, a4);
    unsigned __int16 v9 = crc_16_l_table[a1[4] ^ 0xA4];
    unsigned __int16 v10 = crc_16_l_table[(a1[5] ^ v9) ^ 4];
    unsigned __int16 v11 = crc_16_l_table[(a1[6] ^ v10 ^ HIBYTE(v9))];
    unsigned __int16 v12 = crc_16_l_table[(a1[7] ^ v11 ^ HIBYTE(v10))];
    unsigned __int16 v13 = crc_16_l_table[(a1[8] ^ v12 ^ HIBYTE(v11))];
    unsigned __int16 v14 = crc_16_l_table[(a1[9] ^ v13 ^ HIBYTE(v12))];
    unsigned __int16 v15 = crc_16_l_table[(a1[10] ^ v14 ^ HIBYTE(v13))];
    unsigned __int16 v16 = crc_16_l_table[(a1[11] ^ v15 ^ HIBYTE(v14))];
    unsigned __int16 v17 = crc_16_l_table[(a1[12] ^ v16 ^ HIBYTE(v15))];
    unsigned __int16 v18 = crc_16_l_table[(a1[13] ^ v17 ^ HIBYTE(v16))];
    unsigned __int16 v19 = crc_16_l_table[(a1[14] ^ v18 ^ HIBYTE(v17))];
    unsigned __int16 v20 = crc_16_l_table[(a1[15] ^ v19 ^ HIBYTE(v18))];
    unsigned __int16 v21 = crc_16_l_table[(a1[16] ^ v20 ^ HIBYTE(v19))];
    unsigned __int16 v22 = crc_16_l_table[(a1[17] ^ v21 ^ HIBYTE(v20))];
    unsigned __int16 v23 = crc_16_l_table[(a1[18] ^ v22 ^ HIBYTE(v21))];
    unsigned __int16 v24 = crc_16_l_table[(a1[19] ^ v23 ^ HIBYTE(v22))];
    unsigned __int16 v25 = crc_16_l_table[(a1[20] ^ v24 ^ HIBYTE(v23))];
    unsigned __int16 v26 = crc_16_l_table[(a1[21] ^ v25 ^ HIBYTE(v24))];
    unsigned __int16 v27 = crc_16_l_table[(a1[22] ^ v26 ^ HIBYTE(v25))];
    unsigned __int16 v28 = crc_16_l_table[(a1[23] ^ v27 ^ HIBYTE(v26))];
    unsigned __int16 v29 = crc_16_l_table[(a1[24] ^ v28 ^ HIBYTE(v27))];
    unsigned __int16 v30 = crc_16_l_table[(a1[25] ^ v29 ^ HIBYTE(v28))];
    unsigned __int16 v31 = crc_16_l_table[(a1[26] ^ v30 ^ HIBYTE(v29))];
    unsigned __int16 v32 = crc_16_l_table[(a1[27] ^ v31 ^ HIBYTE(v30))];
    unsigned __int16 v33 = crc_16_l_table[(a1[28] ^ v32 ^ HIBYTE(v31))];
    unsigned __int16 v34 = crc_16_l_table[(a1[29] ^ v33 ^ HIBYTE(v32))];
    unsigned __int16 v35 = crc_16_l_table[(a1[30] ^ v34 ^ HIBYTE(v33))];
    unsigned __int16 v36 = crc_16_l_table[(a1[31] ^ v35 ^ HIBYTE(v34))];
    unsigned __int16 v37 = crc_16_l_table[(a1[32] ^ v36 ^ HIBYTE(v35))];
    unsigned __int16 v38 = crc_16_l_table[(a1[33] ^ v37 ^ HIBYTE(v36))];
    unsigned int v39 = crc_16_l_table[(a1[34] ^ v38 ^ HIBYTE(v37))];
    *((_WORD *)a1 + 18) = crc_16_l_table[(a1[35] ^ v39 ^ HIBYTE(v38))] ^ ~(unsigned __int16)(v39 >> 8);
    if (a2 >= 76)
    {
      bzero(__src, 0x800uLL);
      uint64_t v40 = 0;
      LODWORD(v41) = 0;
      do
      {
        while (1)
        {
          int v43 = a1[v40];
          if ((v43 - 125) > 1) {
            break;
          }
          int v42 = v41 + 1;
          __src[(int)v41] = 125;
          __src[(int)v41 + 1] = v43 ^ 0x20;
          size_t v41 = (int)v41 + 1 + 1;
          if (++v40 == 38) {
            goto LABEL_10;
          }
        }
        int v42 = v41;
        __src[(int)v41] = v43;
        size_t v41 = (int)v41 + 1;
        ++v40;
      }
      while (v40 != 38);
LABEL_10:
      memcpy(a1, __src, v41);
      uint64_t result = (v42 + 2);
      a1[v41] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_GetFileInfo(char *a1, int a2, const void *a3, int a4)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a4 <= 32 && a4 + 7 <= a2)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 785995;
    memcpy(a1 + 4, a3, a4);
    unsigned __int16 v9 = crc_16_l_table[a1[4] ^ 4];
    unsigned __int16 v10 = crc_16_l_table[a1[5] ^ 0xAD ^ v9];
    unsigned __int16 v11 = crc_16_l_table[(a1[6] ^ v10 ^ HIBYTE(v9))];
    unsigned __int16 v12 = crc_16_l_table[(a1[7] ^ v11 ^ HIBYTE(v10))];
    unsigned __int16 v13 = crc_16_l_table[(a1[8] ^ v12 ^ HIBYTE(v11))];
    unsigned __int16 v14 = crc_16_l_table[(a1[9] ^ v13 ^ HIBYTE(v12))];
    unsigned __int16 v15 = crc_16_l_table[(a1[10] ^ v14 ^ HIBYTE(v13))];
    unsigned __int16 v16 = crc_16_l_table[(a1[11] ^ v15 ^ HIBYTE(v14))];
    unsigned __int16 v17 = crc_16_l_table[(a1[12] ^ v16 ^ HIBYTE(v15))];
    unsigned __int16 v18 = crc_16_l_table[(a1[13] ^ v17 ^ HIBYTE(v16))];
    unsigned __int16 v19 = crc_16_l_table[(a1[14] ^ v18 ^ HIBYTE(v17))];
    unsigned __int16 v20 = crc_16_l_table[(a1[15] ^ v19 ^ HIBYTE(v18))];
    unsigned __int16 v21 = crc_16_l_table[(a1[16] ^ v20 ^ HIBYTE(v19))];
    unsigned __int16 v22 = crc_16_l_table[(a1[17] ^ v21 ^ HIBYTE(v20))];
    unsigned __int16 v23 = crc_16_l_table[(a1[18] ^ v22 ^ HIBYTE(v21))];
    unsigned __int16 v24 = crc_16_l_table[(a1[19] ^ v23 ^ HIBYTE(v22))];
    unsigned __int16 v25 = crc_16_l_table[(a1[20] ^ v24 ^ HIBYTE(v23))];
    unsigned __int16 v26 = crc_16_l_table[(a1[21] ^ v25 ^ HIBYTE(v24))];
    unsigned __int16 v27 = crc_16_l_table[(a1[22] ^ v26 ^ HIBYTE(v25))];
    unsigned __int16 v28 = crc_16_l_table[(a1[23] ^ v27 ^ HIBYTE(v26))];
    unsigned __int16 v29 = crc_16_l_table[(a1[24] ^ v28 ^ HIBYTE(v27))];
    unsigned __int16 v30 = crc_16_l_table[(a1[25] ^ v29 ^ HIBYTE(v28))];
    unsigned __int16 v31 = crc_16_l_table[(a1[26] ^ v30 ^ HIBYTE(v29))];
    unsigned __int16 v32 = crc_16_l_table[(a1[27] ^ v31 ^ HIBYTE(v30))];
    unsigned __int16 v33 = crc_16_l_table[(a1[28] ^ v32 ^ HIBYTE(v31))];
    unsigned __int16 v34 = crc_16_l_table[(a1[29] ^ v33 ^ HIBYTE(v32))];
    unsigned __int16 v35 = crc_16_l_table[(a1[30] ^ v34 ^ HIBYTE(v33))];
    unsigned __int16 v36 = crc_16_l_table[(a1[31] ^ v35 ^ HIBYTE(v34))];
    unsigned __int16 v37 = crc_16_l_table[(a1[32] ^ v36 ^ HIBYTE(v35))];
    unsigned __int16 v38 = crc_16_l_table[(a1[33] ^ v37 ^ HIBYTE(v36))];
    unsigned int v39 = crc_16_l_table[(a1[34] ^ v38 ^ HIBYTE(v37))];
    *((_WORD *)a1 + 18) = crc_16_l_table[(a1[35] ^ v39 ^ HIBYTE(v38))] ^ ~(unsigned __int16)(v39 >> 8);
    if (a2 >= 76)
    {
      bzero(__src, 0x800uLL);
      uint64_t v40 = 0;
      LODWORD(v41) = 0;
      do
      {
        while (1)
        {
          int v43 = a1[v40];
          if ((v43 - 125) > 1) {
            break;
          }
          int v42 = v41 + 1;
          __src[(int)v41] = 125;
          __src[(int)v41 + 1] = v43 ^ 0x20;
          size_t v41 = (int)v41 + 1 + 1;
          if (++v40 == 38) {
            goto LABEL_10;
          }
        }
        int v42 = v41;
        __src[(int)v41] = v43;
        size_t v41 = (int)v41 + 1;
        ++v40;
      }
      while (v40 != 38);
LABEL_10:
      memcpy(a1, __src, v41);
      uint64_t result = (v42 + 2);
      a1[v41] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_DeleteFile(char *a1, int a2, const void *a3, int a4)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a4 <= 32 && a4 + 7 <= a2)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 589387;
    memcpy(a1 + 4, a3, a4);
    unsigned __int16 v9 = crc_16_l_table[a1[4] ^ 0x6CLL];
    unsigned __int16 v10 = crc_16_l_table[(a1[5] ^ v9) ^ 0x87];
    unsigned __int16 v11 = crc_16_l_table[(a1[6] ^ v10 ^ HIBYTE(v9))];
    unsigned __int16 v12 = crc_16_l_table[(a1[7] ^ v11 ^ HIBYTE(v10))];
    unsigned __int16 v13 = crc_16_l_table[(a1[8] ^ v12 ^ HIBYTE(v11))];
    unsigned __int16 v14 = crc_16_l_table[(a1[9] ^ v13 ^ HIBYTE(v12))];
    unsigned __int16 v15 = crc_16_l_table[(a1[10] ^ v14 ^ HIBYTE(v13))];
    unsigned __int16 v16 = crc_16_l_table[(a1[11] ^ v15 ^ HIBYTE(v14))];
    unsigned __int16 v17 = crc_16_l_table[(a1[12] ^ v16 ^ HIBYTE(v15))];
    unsigned __int16 v18 = crc_16_l_table[(a1[13] ^ v17 ^ HIBYTE(v16))];
    unsigned __int16 v19 = crc_16_l_table[(a1[14] ^ v18 ^ HIBYTE(v17))];
    unsigned __int16 v20 = crc_16_l_table[(a1[15] ^ v19 ^ HIBYTE(v18))];
    unsigned __int16 v21 = crc_16_l_table[(a1[16] ^ v20 ^ HIBYTE(v19))];
    unsigned __int16 v22 = crc_16_l_table[(a1[17] ^ v21 ^ HIBYTE(v20))];
    unsigned __int16 v23 = crc_16_l_table[(a1[18] ^ v22 ^ HIBYTE(v21))];
    unsigned __int16 v24 = crc_16_l_table[(a1[19] ^ v23 ^ HIBYTE(v22))];
    unsigned __int16 v25 = crc_16_l_table[(a1[20] ^ v24 ^ HIBYTE(v23))];
    unsigned __int16 v26 = crc_16_l_table[(a1[21] ^ v25 ^ HIBYTE(v24))];
    unsigned __int16 v27 = crc_16_l_table[(a1[22] ^ v26 ^ HIBYTE(v25))];
    unsigned __int16 v28 = crc_16_l_table[(a1[23] ^ v27 ^ HIBYTE(v26))];
    unsigned __int16 v29 = crc_16_l_table[(a1[24] ^ v28 ^ HIBYTE(v27))];
    unsigned __int16 v30 = crc_16_l_table[(a1[25] ^ v29 ^ HIBYTE(v28))];
    unsigned __int16 v31 = crc_16_l_table[(a1[26] ^ v30 ^ HIBYTE(v29))];
    unsigned __int16 v32 = crc_16_l_table[(a1[27] ^ v31 ^ HIBYTE(v30))];
    unsigned __int16 v33 = crc_16_l_table[(a1[28] ^ v32 ^ HIBYTE(v31))];
    unsigned __int16 v34 = crc_16_l_table[(a1[29] ^ v33 ^ HIBYTE(v32))];
    unsigned __int16 v35 = crc_16_l_table[(a1[30] ^ v34 ^ HIBYTE(v33))];
    unsigned __int16 v36 = crc_16_l_table[(a1[31] ^ v35 ^ HIBYTE(v34))];
    unsigned __int16 v37 = crc_16_l_table[(a1[32] ^ v36 ^ HIBYTE(v35))];
    unsigned __int16 v38 = crc_16_l_table[(a1[33] ^ v37 ^ HIBYTE(v36))];
    unsigned int v39 = crc_16_l_table[(a1[34] ^ v38 ^ HIBYTE(v37))];
    *((_WORD *)a1 + 18) = crc_16_l_table[(a1[35] ^ v39 ^ HIBYTE(v38))] ^ ~(unsigned __int16)(v39 >> 8);
    if (a2 >= 76)
    {
      bzero(__src, 0x800uLL);
      uint64_t v40 = 0;
      LODWORD(v41) = 0;
      do
      {
        while (1)
        {
          int v43 = a1[v40];
          if ((v43 - 125) > 1) {
            break;
          }
          int v42 = v41 + 1;
          __src[(int)v41] = 125;
          __src[(int)v41 + 1] = v43 ^ 0x20;
          size_t v41 = (int)v41 + 1 + 1;
          if (++v40 == 38) {
            goto LABEL_10;
          }
        }
        int v42 = v41;
        __src[(int)v41] = v43;
        size_t v41 = (int)v41 + 1;
        ++v40;
      }
      while (v40 != 38);
LABEL_10:
      memcpy(a1, __src, v41);
      uint64_t result = (v42 + 2);
      a1[v41] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_WriteFile(char *a1, int a2, const void *a3, int a4, int a5, _OWORD *a6)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a4 <= 32 && a4 + 135 <= a2)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 720459;
    *((_DWORD *)a1 + 1) = a5;
    memcpy(a1 + 8, a3, a4);
    long long v13 = a6[2];
    long long v14 = a6[3];
    long long v15 = a6[1];
    *(_OWORD *)(a1 + 40) = *a6;
    *(_OWORD *)(a1 + 88) = v14;
    *(_OWORD *)(a1 + 72) = v13;
    *(_OWORD *)(a1 + 56) = v15;
    long long v16 = a6[6];
    long long v17 = a6[7];
    long long v18 = a6[5];
    *(_OWORD *)(a1 + 104) = a6[4];
    *(_OWORD *)(a1 + 152) = v17;
    *(_OWORD *)(a1 + 136) = v16;
    *(_OWORD *)(a1 + 120) = v18;
    int v19 = 1344;
    LOWORD(v20) = -1;
    unsigned __int16 v21 = a1;
    do
    {
      char v22 = *v21++;
      int v20 = crc_16_l_table[(v22 ^ v20)] ^ ((unsigned __int16)(v20 & 0xFF00) >> 8);
      v19 -= 8;
    }
    while ((_WORD)v19);
    *((_WORD *)a1 + 84) = ~(_WORD)v20;
    if (a2 >= 340)
    {
      bzero(__src, 0x800uLL);
      uint64_t v23 = 0;
      LODWORD(v24) = 0;
      do
      {
        while (1)
        {
          int v26 = a1[v23];
          if ((v26 - 125) > 1) {
            break;
          }
          int v25 = v24 + 1;
          __src[(int)v24] = 125;
          __src[(int)v24 + 1] = v26 ^ 0x20;
          size_t v24 = (int)v24 + 1 + 1;
          if (++v23 == 170) {
            goto LABEL_12;
          }
        }
        int v25 = v24;
        __src[(int)v24] = v26;
        size_t v24 = (int)v24 + 1;
        ++v23;
      }
      while (v23 != 170);
LABEL_12:
      memcpy(a1, __src, v24);
      uint64_t result = (v25 + 2);
      a1[v24] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_ReadFile(char *a1, int a2, const void *a3, int a4, int a5)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a4 <= 32 && a4 + 135 <= a2)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 654923;
    *((_DWORD *)a1 + 1) = a5;
    memcpy(a1 + 8, a3, a4);
    unsigned __int16 v11 = crc_16_l_table[a5 ^ 0xB4];
    unsigned __int16 v12 = crc_16_l_table[(v11 ^ BYTE1(a5)) ^ 0x9E];
    unsigned __int16 v13 = crc_16_l_table[(v12 ^ HIBYTE(v11) ^ BYTE2(a5))];
    unsigned __int16 v14 = crc_16_l_table[(a1[7] ^ v13 ^ HIBYTE(v12))];
    unsigned __int16 v15 = crc_16_l_table[(a1[8] ^ v14 ^ HIBYTE(v13))];
    unsigned __int16 v16 = crc_16_l_table[(a1[9] ^ v15 ^ HIBYTE(v14))];
    unsigned __int16 v17 = crc_16_l_table[(a1[10] ^ v16 ^ HIBYTE(v15))];
    unsigned __int16 v18 = crc_16_l_table[(a1[11] ^ v17 ^ HIBYTE(v16))];
    unsigned __int16 v19 = crc_16_l_table[(a1[12] ^ v18 ^ HIBYTE(v17))];
    unsigned __int16 v20 = crc_16_l_table[(a1[13] ^ v19 ^ HIBYTE(v18))];
    unsigned __int16 v21 = crc_16_l_table[(a1[14] ^ v20 ^ HIBYTE(v19))];
    unsigned __int16 v22 = crc_16_l_table[(a1[15] ^ v21 ^ HIBYTE(v20))];
    unsigned __int16 v23 = crc_16_l_table[(a1[16] ^ v22 ^ HIBYTE(v21))];
    unsigned __int16 v24 = crc_16_l_table[(a1[17] ^ v23 ^ HIBYTE(v22))];
    unsigned __int16 v25 = crc_16_l_table[(a1[18] ^ v24 ^ HIBYTE(v23))];
    unsigned __int16 v26 = crc_16_l_table[(a1[19] ^ v25 ^ HIBYTE(v24))];
    unsigned __int16 v27 = crc_16_l_table[(a1[20] ^ v26 ^ HIBYTE(v25))];
    unsigned __int16 v28 = crc_16_l_table[(a1[21] ^ v27 ^ HIBYTE(v26))];
    unsigned __int16 v29 = crc_16_l_table[(a1[22] ^ v28 ^ HIBYTE(v27))];
    unsigned __int16 v30 = crc_16_l_table[(a1[23] ^ v29 ^ HIBYTE(v28))];
    unsigned __int16 v31 = crc_16_l_table[(a1[24] ^ v30 ^ HIBYTE(v29))];
    unsigned __int16 v32 = crc_16_l_table[(a1[25] ^ v31 ^ HIBYTE(v30))];
    unsigned __int16 v33 = crc_16_l_table[(a1[26] ^ v32 ^ HIBYTE(v31))];
    unsigned __int16 v34 = crc_16_l_table[(a1[27] ^ v33 ^ HIBYTE(v32))];
    unsigned __int16 v35 = crc_16_l_table[(a1[28] ^ v34 ^ HIBYTE(v33))];
    unsigned __int16 v36 = crc_16_l_table[(a1[29] ^ v35 ^ HIBYTE(v34))];
    unsigned __int16 v37 = crc_16_l_table[(a1[30] ^ v36 ^ HIBYTE(v35))];
    unsigned __int16 v38 = crc_16_l_table[(a1[31] ^ v37 ^ HIBYTE(v36))];
    unsigned __int16 v39 = crc_16_l_table[(a1[32] ^ v38 ^ HIBYTE(v37))];
    unsigned __int16 v40 = crc_16_l_table[(a1[33] ^ v39 ^ HIBYTE(v38))];
    unsigned __int16 v41 = crc_16_l_table[(a1[34] ^ v40 ^ HIBYTE(v39))];
    unsigned __int16 v42 = crc_16_l_table[(a1[35] ^ v41 ^ HIBYTE(v40))];
    unsigned __int16 v43 = crc_16_l_table[(a1[36] ^ v42 ^ HIBYTE(v41))];
    unsigned __int16 v44 = crc_16_l_table[(a1[37] ^ v43 ^ HIBYTE(v42))];
    unsigned int v45 = crc_16_l_table[(a1[38] ^ v44 ^ HIBYTE(v43))];
    *((_WORD *)a1 + 20) = crc_16_l_table[(a1[39] ^ v45 ^ HIBYTE(v44))] ^ ~(unsigned __int16)(v45 >> 8);
    if (a2 >= 84)
    {
      bzero(__src, 0x800uLL);
      uint64_t v46 = 0;
      LODWORD(v47) = 0;
      do
      {
        while (1)
        {
          int v49 = a1[v46];
          if ((v49 - 125) > 1) {
            break;
          }
          int v48 = v47 + 1;
          __src[(int)v47] = 125;
          __src[(int)v47 + 1] = v49 ^ 0x20;
          size_t v47 = (int)v47 + 1 + 1;
          if (++v46 == 42) {
            goto LABEL_10;
          }
        }
        int v48 = v47;
        __src[(int)v47] = v49;
        size_t v47 = (int)v47 + 1;
        ++v46;
      }
      while (v46 != 42);
LABEL_10:
      memcpy(a1, __src, v47);
      uint64_t result = (v48 + 2);
      a1[v47] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_ReadICCID_EFS_File(void *a1, int a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (a2 < 512) {
    return 0xFFFFFFFFLL;
  }
  size_t v3 = a2;
  bzero(a1, a2);
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  bzero(a1, v3);
  *(_OWORD *)(a1 + 1) = *(_OWORD *)"sim.txt";
  *a1 = 654923;
  *(_OWORD *)(a1 + 3) = unk_1E45B4A40;
  unsigned __int16 v4 = crc_16_l_table[*((unsigned char *)a1 + 8) ^ 0x6A ^ LOBYTE(crc_16_l_table[110])];
  unsigned __int16 v5 = crc_16_l_table[(*((unsigned char *)a1 + 9) ^ v4 ^ HIBYTE(crc_16_l_table[110]))];
  unsigned __int16 v6 = crc_16_l_table[(*((unsigned char *)a1 + 10) ^ v5 ^ HIBYTE(v4))];
  unsigned __int16 v7 = crc_16_l_table[(*((unsigned char *)a1 + 11) ^ v6 ^ HIBYTE(v5))];
  unsigned __int16 v8 = crc_16_l_table[(*((unsigned char *)a1 + 12) ^ v7 ^ HIBYTE(v6))];
  unsigned __int16 v9 = crc_16_l_table[(*((unsigned char *)a1 + 13) ^ v8 ^ HIBYTE(v7))];
  unsigned __int16 v10 = crc_16_l_table[(*((unsigned char *)a1 + 14) ^ v9 ^ HIBYTE(v8))];
  unsigned __int16 v11 = crc_16_l_table[(*((unsigned char *)a1 + 15) ^ v10 ^ HIBYTE(v9))];
  unsigned __int16 v12 = crc_16_l_table[(*((unsigned char *)a1 + 16) ^ v11 ^ HIBYTE(v10))];
  unsigned __int16 v13 = crc_16_l_table[(*((unsigned char *)a1 + 17) ^ v12 ^ HIBYTE(v11))];
  unsigned __int16 v14 = crc_16_l_table[(*((unsigned char *)a1 + 18) ^ v13 ^ HIBYTE(v12))];
  unsigned __int16 v15 = crc_16_l_table[(*((unsigned char *)a1 + 19) ^ v14 ^ HIBYTE(v13))];
  unsigned __int16 v16 = crc_16_l_table[(*((unsigned char *)a1 + 20) ^ v15 ^ HIBYTE(v14))];
  unsigned __int16 v17 = crc_16_l_table[(*((unsigned char *)a1 + 21) ^ v16 ^ HIBYTE(v15))];
  unsigned __int16 v18 = crc_16_l_table[(*((unsigned char *)a1 + 22) ^ v17 ^ HIBYTE(v16))];
  unsigned __int16 v19 = crc_16_l_table[(*((unsigned char *)a1 + 23) ^ v18 ^ HIBYTE(v17))];
  unsigned __int16 v20 = crc_16_l_table[(*((unsigned char *)a1 + 24) ^ v19 ^ HIBYTE(v18))];
  unsigned __int16 v21 = crc_16_l_table[(*((unsigned char *)a1 + 25) ^ v20 ^ HIBYTE(v19))];
  unsigned __int16 v22 = crc_16_l_table[(*((unsigned char *)a1 + 26) ^ v21 ^ HIBYTE(v20))];
  unsigned __int16 v23 = crc_16_l_table[(*((unsigned char *)a1 + 27) ^ v22 ^ HIBYTE(v21))];
  unsigned __int16 v24 = crc_16_l_table[(*((unsigned char *)a1 + 28) ^ v23 ^ HIBYTE(v22))];
  unsigned __int16 v25 = crc_16_l_table[(*((unsigned char *)a1 + 29) ^ v24 ^ HIBYTE(v23))];
  unsigned __int16 v26 = crc_16_l_table[(*((unsigned char *)a1 + 30) ^ v25 ^ HIBYTE(v24))];
  unsigned __int16 v27 = crc_16_l_table[(*((unsigned char *)a1 + 31) ^ v26 ^ HIBYTE(v25))];
  unsigned __int16 v28 = crc_16_l_table[(*((unsigned char *)a1 + 32) ^ v27 ^ HIBYTE(v26))];
  unsigned __int16 v29 = crc_16_l_table[(*((unsigned char *)a1 + 33) ^ v28 ^ HIBYTE(v27))];
  unsigned __int16 v30 = crc_16_l_table[(*((unsigned char *)a1 + 34) ^ v29 ^ HIBYTE(v28))];
  unsigned __int16 v31 = crc_16_l_table[(*((unsigned char *)a1 + 35) ^ v30 ^ HIBYTE(v29))];
  unsigned __int16 v32 = crc_16_l_table[(*((unsigned char *)a1 + 36) ^ v31 ^ HIBYTE(v30))];
  unsigned __int16 v33 = crc_16_l_table[(*((unsigned char *)a1 + 37) ^ v32 ^ HIBYTE(v31))];
  unsigned int v34 = crc_16_l_table[(*((unsigned char *)a1 + 38) ^ v33 ^ HIBYTE(v32))];
  *((_WORD *)a1 + 20) = crc_16_l_table[(*((unsigned char *)a1 + 39) ^ v34 ^ HIBYTE(v33))] ^ ~(unsigned __int16)(v34 >> 8);
  bzero(__src, 0x800uLL);
  uint64_t v35 = 0;
  LODWORD(v3) = 0;
  do
  {
    while (1)
    {
      int v37 = *((unsigned __int8 *)a1 + v35);
      if ((v37 - 125) > 1) {
        break;
      }
      int v36 = v3 + 1;
      __src[(int)v3] = 125;
      __src[(int)v3 + 1] = v37 ^ 0x20;
      size_t v3 = (int)v3 + 1 + 1;
      if (++v35 == 42) {
        goto LABEL_7;
      }
    }
    int v36 = v3;
    __src[(int)v3] = v37;
    size_t v3 = (int)v3 + 1;
    ++v35;
  }
  while (v35 != 42);
LABEL_7:
  memcpy(a1, __src, v3);
  uint64_t result = (v36 + 2);
  *((unsigned char *)a1 + v3) = 126;
  return result;
}

uint64_t ETLDMCViewLoadMessagesFromMaskArray(uint64_t a1, uint64_t a2, unsigned int a3)
{
  *(_DWORD *)a1 = a3;
  if (!a3) {
    return 1;
  }
  size_t v6 = 16 * a3;
  unsigned __int16 v7 = malloc(v6);
  *(void *)(a1 + 8) = v7;
  if (!v7) {
    return 0;
  }
  unsigned __int16 v8 = v7;
  bzero(v7, v6);
  uint64_t v9 = 0;
  unsigned int v10 = 0;
  uint64_t v11 = a3;
  do
  {
    unsigned int v12 = v10 + 1;
    do
    {
      unsigned int v13 = v12;
      int v14 = *(_DWORD *)(a2 + 4 * v10++);
      ++v12;
    }
    while (!v14);
    unsigned __int16 v15 = &v8[2 * v9];
    unsigned __int16 v16 = v10 - 1;
    *unsigned __int16 v15 = v10 - 1;
    do
    {
      unsigned int v10 = v13;
      if (v13 >> 12 > 0xC) {
        break;
      }
      ++v13;
    }
    while (*(_DWORD *)(a2 + 4 * v10));
    v15[1] = v10 - 1;
    unsigned int v17 = v16;
    unsigned __int16 v18 = malloc(4 * ((unsigned __int16)(v10 - 1) - v16 + 1));
    v8[2 * v9 + 1] = v18;
    BOOL v19 = v18 != 0;
    if (!v18) {
      break;
    }
    memcpy(v18, (const void *)(a2 + 4 * v17), 4 * ((unsigned __int16)(v10 - 1) - v17 + 1));
    ++v9;
  }
  while (v9 != v11);
  return v19;
}

uint64_t ETLDMCViewCopyMasksToMaskArray(unsigned int *a1, uint64_t a2)
{
  unint64_t v2 = *a1;
  if (v2)
  {
    unint64_t v3 = 0;
    uint64_t v4 = *((void *)a1 + 1);
    do
    {
      unsigned __int16 v5 = (unsigned __int16 *)(v4 + 16 * v3);
      uint64_t v6 = *v5;
      __int16 v7 = v5[1] - v6 + 1;
      unint64_t v8 = v5[1] - v6 + 1;
      if (v5[1] - v6 == -1) {
        goto LABEL_4;
      }
      unint64_t v9 = *((void *)v5 + 1);
      if (v8 >= 0xC)
      {
        uint64_t v10 = 0;
        if (__CFADD__(v6, v8 - 1) || (v8 - 1) >> 32) {
          goto LABEL_19;
        }
        unint64_t v11 = a2 + 4 * v6;
        if (v9 >= v11 + 4 * v8 || v11 >= v9 + 4 * v8)
        {
          uint64_t v13 = v7 & 7;
          uint64_t v10 = v8 - v13;
          int v14 = (int8x16_t *)(v9 + 16);
          uint64_t v15 = v8 - v13;
          uint64_t v16 = v6;
          do
          {
            unsigned int v17 = (int8x16_t *)(a2 + 4 * v16);
            int8x16_t v18 = vorrq_s8(v17[1], *v14);
            *unsigned int v17 = vorrq_s8(*v17, v14[-1]);
            v17[1] = v18;
            v16 += 8;
            v14 += 2;
            v15 -= 8;
          }
          while (v15);
          if (!v13) {
            goto LABEL_3;
          }
          goto LABEL_19;
        }
      }
      uint64_t v10 = 0;
LABEL_19:
      uint64_t v19 = v8 - v10;
      unsigned __int16 v20 = (int *)(v9 + 4 * v10);
      uint64_t v21 = v10 + v6;
      do
      {
        int v22 = *v20++;
        *(_DWORD *)(a2 + 4 * v21++) |= v22;
        --v19;
      }
      while (v19);
LABEL_3:
      unint64_t v2 = *a1;
LABEL_4:
      ++v3;
    }
    while (v3 < v2);
  }
  return 1;
}

uint64_t ETLDMCLoadEventRangesFromEventsArray(uint64_t a1, uint64_t a2, unsigned int a3, int a4)
{
  if (!a4) {
    return 1;
  }
  uint64_t result = (uint64_t)malloc(4 * a3);
  *(void *)(a1 + 32) = result;
  if (result)
  {
    *(_DWORD *)(a1 + 24) = a3;
    *(_DWORD *)(a1 + 40) = a4;
    if (a3)
    {
      uint64_t v9 = 0;
      unsigned int v10 = 0;
      do
      {
        uint64_t v13 = (unsigned __int16 *)(a2 + 2 * v10);
        int v11 = a4 - v10;
        int v14 = *v13;
        if (a4 - v10 < 2)
        {
          int v11 = 1;
        }
        else
        {
          uint64_t v15 = 1;
          while (v14 + v15 == v13[v15])
          {
            if (v11 == ++v15) {
              goto LABEL_6;
            }
          }
          int v11 = v15;
        }
LABEL_6:
        unsigned int v12 = (_WORD *)(result + 4 * v9);
        *unsigned int v12 = v14;
        v12[1] = v14 + v11 - 1;
        v10 += v11;
        ++v9;
      }
      while (v9 != a3);
    }
    return 1;
  }
  return result;
}

void ETLDMCViewFree(void *a1)
{
  if (a1)
  {
    unint64_t v2 = *(unsigned int *)a1;
    if (v2)
    {
      uint64_t v3 = a1[1];
      if (v3)
      {
        unint64_t v4 = 1;
        uint64_t v5 = 8;
LABEL_6:
        uint64_t v6 = *(void **)(v3 + v5);
        if (v6)
        {
          free(v6);
          *(void *)(v3 + v5) = 0;
          unint64_t v2 = *(unsigned int *)a1;
        }
        while (v4 < v2)
        {
          uint64_t v3 = a1[1];
          ++v4;
          v5 += 16;
          if (v3) {
            goto LABEL_6;
          }
        }
      }
    }
    __int16 v7 = (void *)a1[1];
    if (v7) {
      free(v7);
    }
    *a1 = 0;
    a1[1] = 0;
  }
  unint64_t v8 = (void ***)(a1 + 2);
  uint64_t v9 = a1[2];
  if (v9)
  {
    free(*(void **)(v9 + 8));
    *(void *)(v9 + 8) = 0;
    unsigned int v10 = *v8;
    if (!*v8) {
      goto LABEL_29;
    }
    free(v10[3]);
    v10[3] = 0;
    int v11 = *v8;
    if (!*v8) {
      goto LABEL_29;
    }
    free(v11[5]);
    v11[5] = 0;
    unsigned int v12 = *v8;
    if (!*v8) {
      goto LABEL_29;
    }
    free(v12[7]);
    v12[7] = 0;
    uint64_t v13 = *v8;
    if (!*v8) {
      goto LABEL_29;
    }
    free(v13[9]);
    v13[9] = 0;
    int v14 = *v8;
    if (!*v8) {
      goto LABEL_29;
    }
    free(v14[11]);
    v14[11] = 0;
    uint64_t v15 = *v8;
    if (!*v8) {
      goto LABEL_29;
    }
    free(v15[13]);
    v15[13] = 0;
    uint64_t v16 = *v8;
    if (!*v8) {
      goto LABEL_29;
    }
    free(v16[15]);
    v16[15] = 0;
    unsigned int v17 = *v8;
    if (!*v8) {
      goto LABEL_29;
    }
    free(v17[17]);
    v17[17] = 0;
    int8x16_t v18 = *v8;
    if (!*v8) {
      goto LABEL_29;
    }
    free(v18[19]);
    v18[19] = 0;
    uint64_t v19 = *v8;
    if (!*v8) {
      goto LABEL_29;
    }
    free(v19[21]);
    v19[21] = 0;
    unsigned __int16 v20 = *v8;
    if (!*v8) {
      goto LABEL_29;
    }
    free(v20[23]);
    v20[23] = 0;
    uint64_t v21 = *v8;
    if (!*v8) {
      goto LABEL_29;
    }
    free(v21[25]);
    v21[25] = 0;
    int v22 = *v8;
    if (!*v8) {
      goto LABEL_29;
    }
    free(v22[27]);
    v22[27] = 0;
    unsigned __int16 v23 = *v8;
    if (*v8 && (free(v23[29]), v23[29] = 0, (unsigned __int16 v24 = *v8) != 0))
    {
      free(v24[31]);
      v24[31] = 0;
      unsigned __int16 v25 = *v8;
    }
    else
    {
LABEL_29:
      unsigned __int16 v25 = 0;
    }
    free(v25);
  }
  *unint64_t v8 = 0;
  a1[3] = 0;
  unsigned __int16 v26 = (void *)a1[4];
  if (v26) {
    free(v26);
  }
  a1[3] = 0;
  a1[4] = 0;
  a1[5] = 0;
  unsigned __int16 v27 = (void *)a1[7];
  if (v27) {
    free(v27);
  }
  a1[6] = 0;
  a1[7] = 0;
}

uint64_t ETLDMCViewMerge(uint64_t a1, unsigned int *a2, unsigned int *a3)
{
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  uint64_t v6 = *a2;
  uint64_t v7 = *a3;
  if (!v6)
  {
    if (v7 && (_ETLDMCViewCopyMessageMasks((unsigned int *)a1, (uint64_t)a3) & 1) == 0) {
      return 0;
    }
    goto LABEL_46;
  }
  if (!v7)
  {
    if ((_ETLDMCViewCopyMessageMasks((unsigned int *)a1, (uint64_t)a2) & 1) == 0) {
      return 0;
    }
    goto LABEL_46;
  }
  uint64_t result = (uint64_t)malloc(0x34000uLL);
  if (!result) {
    return result;
  }
  uint64_t v9 = (_DWORD *)result;
  bzero((void *)result, 0x34000uLL);
  uint64_t v10 = 0;
  uint64_t v11 = *((void *)a2 + 1);
  do
  {
    unsigned int v12 = (unsigned __int16 *)(v11 + 16 * v10);
    uint64_t v13 = *v12;
    __int16 v14 = v12[1] - v13 + 1;
    unint64_t v15 = v12[1] - v13 + 1;
    if (v12[1] - v13 == -1) {
      goto LABEL_5;
    }
    uint64_t v16 = (int8x16_t *)*((void *)v12 + 1);
    if (v15 < 8)
    {
      uint64_t v17 = 0;
LABEL_14:
      uint64_t v24 = v15 - v17;
      unsigned __int16 v25 = &v16->i32[v17];
      uint64_t v26 = v17 + v13;
      do
      {
        int v27 = *v25++;
        v9[v26++] |= v27;
        --v24;
      }
      while (v24);
      goto LABEL_5;
    }
    uint64_t v17 = 0;
    if (__CFADD__(v13, v15 - 1)) {
      goto LABEL_14;
    }
    if ((v15 - 1) >> 32) {
      goto LABEL_14;
    }
    uint64_t v18 = v14 & 7;
    uint64_t v17 = v15 - v18;
    uint64_t v19 = v16 + 1;
    uint64_t v20 = v15 - v18;
    uint64_t v21 = v13;
    do
    {
      int v22 = (int8x16_t *)&v9[v21];
      int8x16_t v23 = vorrq_s8(v22[1], *v19);
      *int v22 = vorrq_s8(*v22, v19[-1]);
      v22[1] = v23;
      v21 += 8;
      v19 += 2;
      v20 -= 8;
    }
    while (v20);
    if (v18) {
      goto LABEL_14;
    }
LABEL_5:
    ++v10;
  }
  while (v10 != v6);
  uint64_t v28 = 0;
  uint64_t v29 = *((void *)a3 + 1);
  do
  {
    unsigned __int16 v30 = (unsigned __int16 *)(v29 + 16 * v28);
    uint64_t v31 = *v30;
    __int16 v32 = v30[1] - v31 + 1;
    unint64_t v33 = v30[1] - v31 + 1;
    if (v30[1] - v31 == -1) {
      goto LABEL_21;
    }
    unsigned int v34 = (int8x16_t *)*((void *)v30 + 1);
    if (v33 < 8)
    {
      uint64_t v35 = 0;
LABEL_30:
      uint64_t v42 = v33 - v35;
      unsigned __int16 v43 = &v34->i32[v35];
      uint64_t v44 = v35 + v31;
      do
      {
        int v45 = *v43++;
        v9[v44++] |= v45;
        --v42;
      }
      while (v42);
      goto LABEL_21;
    }
    uint64_t v35 = 0;
    if (__CFADD__(v31, v33 - 1)) {
      goto LABEL_30;
    }
    if ((v33 - 1) >> 32) {
      goto LABEL_30;
    }
    uint64_t v36 = v32 & 7;
    uint64_t v35 = v33 - v36;
    int v37 = v34 + 1;
    uint64_t v38 = v33 - v36;
    uint64_t v39 = v31;
    do
    {
      uint64_t v40 = (int8x16_t *)&v9[v39];
      int8x16_t v41 = vorrq_s8(v40[1], *v37);
      *uint64_t v40 = vorrq_s8(*v40, v37[-1]);
      v40[1] = v41;
      v39 += 8;
      v37 += 2;
      v38 -= 8;
    }
    while (v38);
    if (v36) {
      goto LABEL_30;
    }
LABEL_21:
    ++v28;
  }
  while (v28 != v7);
  uint64_t v46 = 0;
  unsigned int v47 = 0;
  int v48 = 0;
  do
  {
    if ((v46 - v48) > 1 || v47 == 0) {
      unsigned int v50 = v47 + 1;
    }
    else {
      unsigned int v50 = v47;
    }
    if (v9[v46])
    {
      int v48 = v46;
      unsigned int v47 = v50;
    }
    ++v46;
  }
  while (v46 != 53248);
  int MessagesFromMaskArray = ETLDMCViewLoadMessagesFromMaskArray(a1, (uint64_t)v9, v47);
  free(v9);
  if (!MessagesFromMaskArray) {
    return 0;
  }
LABEL_46:
  uint64_t v52 = *((void *)a3 + 2);
  if (*((void *)a2 + 2))
  {
    if (v52)
    {
      uint64_t result = (uint64_t)malloc(0x100uLL);
      *(void *)(a1 + 16) = result;
      if (!result) {
        return result;
      }
      uint64_t v53 = 0;
      *(_OWORD *)(result + 224) = 0u;
      *(_OWORD *)(result + 240) = 0u;
      *(_OWORD *)(result + 192) = 0u;
      *(_OWORD *)(result + 208) = 0u;
      *(_OWORD *)(result + 160) = 0u;
      *(_OWORD *)(result + 176) = 0u;
      *(_OWORD *)(result + 128) = 0u;
      *(_OWORD *)(result + 144) = 0u;
      *(_OWORD *)(result + 96) = 0u;
      *(_OWORD *)(result + 112) = 0u;
      *(_OWORD *)(result + 64) = 0u;
      *(_OWORD *)(result + 80) = 0u;
      *(_OWORD *)(result + 32) = 0u;
      *(_OWORD *)(result + 48) = 0u;
      *(_OWORD *)uint64_t result = 0u;
      *(_OWORD *)(result + 16) = 0u;
      do
      {
        uint64_t v54 = *((void *)a2 + 2);
        uint64_t v55 = (unsigned int *)(v54 + 16 * v53);
        uint64_t v56 = *((void *)a3 + 2);
        uint64_t v57 = (unsigned int *)(v56 + 16 * v53);
        if (*v55 || *v57)
        {
          uint64_t v58 = *(void *)(a1 + 16) + 16 * v53;
          uint64_t result = (uint64_t)malloc(0x200uLL);
          *(void *)(v58 + 8) = result;
          if (!result) {
            return result;
          }
          uint64_t v59 = *(const void **)(v54 + 16 * v53 + 8);
          if (v59)
          {
            memcpy((void *)result, v59, 0x200uLL);
            unsigned int v60 = *v55;
            *(_DWORD *)uint64_t v58 = *v55;
            uint64_t v61 = v56 + 16 * v53;
            uint64_t v63 = *(void *)(v61 + 8);
            int v62 = (void *)(v61 + 8);
            if (v63)
            {
              unsigned int v64 = *v57;
              if (*v57 > v60) {
                *(_DWORD *)uint64_t v58 = v64;
              }
              unsigned int v65 = v64 + 7;
              if (v65 >= 8)
              {
                uint64_t v66 = 0;
                LODWORD(v67) = v65 >> 3;
                if (v67 <= 1) {
                  uint64_t v67 = 1;
                }
                else {
                  uint64_t v67 = v67;
                }
                do
                {
                  *(unsigned char *)(*(void *)(v58 + 8) + v66) |= *(unsigned char *)(*v62 + v66);
                  ++v66;
                }
                while (v67 != v66);
              }
            }
          }
          else
          {
            int v68 = *(const void **)(v56 + 16 * v53 + 8);
            if (v68)
            {
              memcpy((void *)result, v68, 0x200uLL);
              *(_DWORD *)uint64_t v58 = *v57;
            }
          }
        }
        ++v53;
      }
      while (v53 != 14);
    }
    else if ((_ETLDMCViewCopyLogMasks(a1, (uint64_t)a2) & 1) == 0)
    {
      return 0;
    }
  }
  else if (v52 && (_ETLDMCViewCopyLogMasks(a1, (uint64_t)a3) & 1) == 0)
  {
    return 0;
  }
  unsigned int v69 = a2[6];
  unsigned int v70 = a3[6];
  if (!v69)
  {
    if (v70)
    {
      uint64_t result = (uint64_t)malloc(4 * v70);
      *(void *)(a1 + 32) = result;
      if (!result) {
        return result;
      }
      bzero((void *)result, 4 * v70);
      unint64_t v99 = 0;
      *(_DWORD *)(a1 + 24) = v70;
      *(_DWORD *)(a1 + 40) = a3[10];
      do
      {
        *(_DWORD *)(*(void *)(a1 + 32) + 4 * v99) = *(_DWORD *)(*((void *)a3 + 4) + 4 * v99);
        ++v99;
      }
      while (v99 < *(unsigned int *)(a1 + 24));
    }
LABEL_142:
    uint64_t v109 = a2[12];
    uint64_t v110 = a3[12];
    if (!v109) {
      goto LABEL_148;
    }
    goto LABEL_143;
  }
  if (!v70)
  {
    uint64_t result = (uint64_t)malloc(4 * v69);
    *(void *)(a1 + 32) = result;
    if (!result) {
      return result;
    }
    bzero((void *)result, 4 * v69);
    unint64_t v108 = 0;
    *(_DWORD *)(a1 + 24) = v69;
    *(_DWORD *)(a1 + 40) = a2[10];
    do
    {
      *(_DWORD *)(*(void *)(a1 + 32) + 4 * v108) = *(_DWORD *)(*((void *)a2 + 4) + 4 * v108);
      ++v108;
    }
    while (v108 < *(unsigned int *)(a1 + 24));
    goto LABEL_142;
  }
  size_t v71 = 2 * (a3[10] + a2[10]);
  uint64_t result = (uint64_t)malloc(v71);
  if (!result) {
    return result;
  }
  uint64_t v72 = (_WORD *)result;
  bzero((void *)result, v71);
  int v73 = 0;
  unsigned int v74 = 0;
  int v75 = 0;
  unsigned int v76 = 0;
  unsigned int v77 = 0;
  unsigned __int16 v78 = 0;
  int v79 = 1;
  while (2)
  {
    unsigned __int16 v88 = -1;
    if (v74 == 0xFFFF)
    {
      unsigned __int16 v89 = -1;
      if (v76 == 0xFFFF) {
        goto LABEL_96;
      }
LABEL_99:
      unsigned __int16 v89 = *(_WORD *)(*((void *)a3 + 4) + 4 * v76) + v75;
      if (v88 == 0xFFFF) {
        goto LABEL_100;
      }
LABEL_101:
      uint64_t v90 = (v79 - 1);
      if (v88 == v89)
      {
        v72[v90] = v88;
        v80 = (unsigned __int16 *)(*((void *)a2 + 4) + 4 * v74);
        int v81 = v80[1] - *v80;
        if (v74 + 1 == v69) {
          int v82 = 0xFFFF;
        }
        else {
          int v82 = v74 + 1;
        }
        BOOL v83 = v73 == v81;
        if (v73 == v81) {
          int v73 = 0;
        }
        else {
          ++v73;
        }
        if (v83) {
          unsigned int v74 = v82;
        }
        v84 = (unsigned __int16 *)(*((void *)a3 + 4) + 4 * v76);
        int v85 = v84[1] - *v84;
        if (v76 + 1 == v70) {
          int v86 = 0xFFFF;
        }
        else {
          int v86 = v76 + 1;
        }
        BOOL v87 = v75 == v85;
        if (v75 == v85) {
          int v75 = 0;
        }
        else {
          ++v75;
        }
        if (v87) {
          unsigned int v76 = v86;
        }
      }
      else if (v88 >= v89)
      {
        v72[v90] = v89;
        v95 = (unsigned __int16 *)(*((void *)a3 + 4) + 4 * v76);
        int v96 = v95[1] - *v95;
        if (v76 + 1 == v70) {
          int v97 = 0xFFFF;
        }
        else {
          int v97 = v76 + 1;
        }
        BOOL v98 = v75 == v96;
        if (v75 == v96) {
          int v75 = 0;
        }
        else {
          ++v75;
        }
        if (v98) {
          unsigned int v76 = v97;
        }
        unsigned __int16 v88 = v89;
      }
      else
      {
        v72[v90] = v88;
        v91 = (unsigned __int16 *)(*((void *)a2 + 4) + 4 * v74);
        int v92 = v91[1] - *v91;
        if (v74 + 1 == v69) {
          int v93 = 0xFFFF;
        }
        else {
          int v93 = v74 + 1;
        }
        BOOL v94 = v73 == v92;
        if (v73 == v92) {
          int v73 = 0;
        }
        else {
          ++v73;
        }
        if (v94) {
          unsigned int v74 = v93;
        }
      }
      if (v88 - v78 > 1) {
        ++v77;
      }
      ++v79;
      unsigned __int16 v78 = v88;
      continue;
    }
    break;
  }
  unsigned __int16 v88 = *(_WORD *)(*((void *)a2 + 4) + 4 * v74) + v73;
  unsigned __int16 v89 = -1;
  if (v76 != 0xFFFF) {
    goto LABEL_99;
  }
LABEL_96:
  if (v88 != 0xFFFF) {
    goto LABEL_101;
  }
LABEL_100:
  if (v89 != 0xFFFF) {
    goto LABEL_101;
  }
  if (!v79) {
    goto LABEL_147;
  }
  v100 = (char *)malloc(4 * v77);
  *(void *)(a1 + 32) = v100;
  if (!v100)
  {
    free(v72);
    return 0;
  }
  *(_DWORD *)(a1 + 24) = v77;
  *(_DWORD *)(a1 + 40) = v79;
  if (v77)
  {
    uint64_t v101 = 0;
    unsigned int v102 = 0;
    do
    {
      uint64_t v105 = v102;
      unsigned int v103 = v79 - v102;
      int v106 = (unsigned __int16)v72[v102];
      if (v103 < 2)
      {
        unsigned int v103 = 1;
      }
      else
      {
        uint64_t v107 = 0;
        while (v106 + 1 + v107 == (unsigned __int16)v72[v105 + 1 + v107])
        {
          if (~v105 + v79 == ++v107) {
            goto LABEL_132;
          }
        }
        unsigned int v103 = v107 + 1;
      }
LABEL_132:
      v104 = &v100[4 * v101];
      *(_WORD *)v104 = v106;
      *((_WORD *)v104 + 1) = v106 + v103 - 1;
      unsigned int v102 = v103 + v105;
      ++v101;
    }
    while (v101 != v77);
  }
LABEL_147:
  free(v72);
  uint64_t v109 = a2[12];
  uint64_t v110 = a3[12];
  if (v109)
  {
LABEL_143:
    if (!v110)
    {
      v117 = malloc((4 * v109));
      *(void *)(a1 + 56) = v117;
      if (!v117) {
        goto LABEL_172;
      }
      v118 = v117;
      bzero(v117, (4 * v109));
      memcpy(v118, *((const void **)a2 + 7), (4 * v109));
      *(_DWORD *)(a1 + 48) = v109;
      return 1;
    }
    v111 = malloc(0x20000uLL);
    if (!v111) {
      goto LABEL_172;
    }
    v112 = v111;
    bzero(v111, 0x20000uLL);
    uint64_t v113 = *((void *)a2 + 7);
    if (v109 >= 2)
    {
      uint64_t v114 = v109 & 0xFFFFFFFE;
      v119 = (unsigned __int16 *)(v113 + 4);
      uint64_t v120 = v114;
      do
      {
        __int16 v121 = *(v119 - 1);
        unsigned __int16 v122 = v119[1];
        uint64_t v123 = *(v119 - 2);
        int v124 = *v119;
        v119 += 4;
        v112[v123] = v121;
        v112[v124] = v122;
        v120 -= 2;
      }
      while (v120);
      if (v114 == v109) {
        goto LABEL_161;
      }
    }
    else
    {
      uint64_t v114 = 0;
    }
    uint64_t v125 = v109 - v114;
    v126 = (_WORD *)(v113 + 4 * v114 + 2);
    do
    {
      v112[(unsigned __int16)*(v126 - 1)] = *v126;
      v126 += 2;
      --v125;
    }
    while (v125);
LABEL_161:
    v127 = (__int16 *)(*((void *)a3 + 7) + 2);
    do
    {
      uint64_t v128 = (unsigned __int16)*(v127 - 1);
      __int16 v129 = *v127;
      v127 += 2;
      v112[v128] |= v129;
      --v110;
    }
    while (v110);
    uint64_t v130 = 0;
    int32x4_t v131 = 0uLL;
    v132.i64[0] = 0x100000001;
    v132.i64[1] = 0x100000001;
    int32x4_t v133 = 0uLL;
    int32x4_t v134 = 0uLL;
    int32x4_t v135 = 0uLL;
    do
    {
      uint16x8_t v136 = (uint16x8_t)vtstq_s16(*(int16x8_t *)&v112[v130], *(int16x8_t *)&v112[v130]);
      uint16x8_t v137 = (uint16x8_t)vtstq_s16(*(int16x8_t *)&v112[v130 + 8], *(int16x8_t *)&v112[v130 + 8]);
      int32x4_t v133 = vaddq_s32(v133, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v136), v132));
      int32x4_t v131 = vaddq_s32(v131, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v136.i8), v132));
      int32x4_t v135 = vaddq_s32(v135, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v137), v132));
      int32x4_t v134 = vaddq_s32(v134, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v137.i8), v132));
      v130 += 16;
    }
    while (v130 != 0x10000);
    unsigned int v138 = vaddvq_s32(vaddq_s32(vaddq_s32(v134, v131), vaddq_s32(v135, v133)));
    uint64_t v139 = v138;
    *(_DWORD *)(a1 + 48) = v138;
    v140 = (char *)malloc(4 * v138);
    *(void *)(a1 + 56) = v140;
    if (!v140) {
      goto LABEL_172;
    }
    v141 = v140;
    bzero(v140, 2 * v139);
    uint64_t v142 = 0;
    int v143 = 0;
    do
    {
      __int16 v144 = v112[v142];
      if (v144)
      {
        v145 = &v141[4 * v143];
        *(_WORD *)v145 = v142;
        ++v143;
        *((_WORD *)v145 + 1) = v144;
      }
      ++v142;
    }
    while (v142 != 0x10000);
    free(v112);
    return 1;
  }
LABEL_148:
  if (!v110) {
    return 1;
  }
  v115 = malloc((4 * v110));
  *(void *)(a1 + 56) = v115;
  if (v115)
  {
    v116 = v115;
    bzero(v115, (4 * v110));
    memcpy(v116, *((const void **)a3 + 7), (4 * v110));
    *(_DWORD *)(a1 + 48) = v110;
    return 1;
  }
LABEL_172:
  _ETLDebugPrint();
  return 0;
}

uint64_t _ETLDMCViewCopyMessageMasks(unsigned int *a1, uint64_t a2)
{
  unsigned int v4 = *(_DWORD *)a2;
  uint64_t v5 = malloc((16 * *(_DWORD *)a2));
  *((void *)a1 + 1) = v5;
  if (v5)
  {
    bzero(v5, 16 * v4);
    *a1 = v4;
    if (!v4) {
      return 1;
    }
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    while (1)
    {
      uint64_t v8 = *((void *)a1 + 1);
      uint64_t v9 = (const void **)(*(void *)(a2 + 8) + v6);
      size_t v10 = 4 * (*((unsigned __int16 *)v9 + 1) - *(unsigned __int16 *)v9) + 4;
      uint64_t v11 = malloc(v10);
      *(void *)(v8 + v6 + 8) = v11;
      if (!v11) {
        break;
      }
      memcpy(v11, v9[1], v10);
      *(_DWORD *)(v8 + v6) = *(_DWORD *)v9;
      ++v7;
      v6 += 16;
      if (v7 >= *a1) {
        return 1;
      }
    }
  }
  _ETLDebugPrint();
  return 0;
}

uint64_t _ETLDMCViewCopyLogMasks(uint64_t a1, uint64_t a2)
{
  uint64_t result = (uint64_t)malloc(0x100uLL);
  *(void *)(a1 + 16) = result;
  if (result)
  {
    uint64_t v5 = result;
    *(_OWORD *)(result + 224) = 0u;
    *(_OWORD *)(result + 240) = 0u;
    *(_OWORD *)(result + 192) = 0u;
    *(_OWORD *)(result + 208) = 0u;
    *(_OWORD *)(result + 160) = 0u;
    *(_OWORD *)(result + 176) = 0u;
    *(_OWORD *)(result + 128) = 0u;
    *(_OWORD *)(result + 144) = 0u;
    *(_OWORD *)(result + 96) = 0u;
    *(_OWORD *)(result + 112) = 0u;
    *(_OWORD *)(result + 64) = 0u;
    *(_OWORD *)(result + 80) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)uint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    uint64_t v6 = *(void *)(a2 + 16);
    if (*(_DWORD *)v6)
    {
      uint64_t result = (uint64_t)malloc(0x200uLL);
      *(void *)(v5 + 8) = result;
      if (!result) {
        return result;
      }
      memcpy((void *)result, *(const void **)(v6 + 8), 0x200uLL);
      *(_DWORD *)uint64_t v5 = *(_DWORD *)v6;
    }
    if (*(_DWORD *)(v6 + 16))
    {
      uint64_t result = (uint64_t)malloc(0x200uLL);
      *(void *)(v5 + 24) = result;
      if (!result) {
        return result;
      }
      memcpy((void *)result, *(const void **)(v6 + 24), 0x200uLL);
      *(_DWORD *)(v5 + 16) = *(_DWORD *)(v6 + 16);
    }
    if (*(_DWORD *)(v6 + 32))
    {
      uint64_t result = (uint64_t)malloc(0x200uLL);
      *(void *)(v5 + 40) = result;
      if (!result) {
        return result;
      }
      memcpy((void *)result, *(const void **)(v6 + 40), 0x200uLL);
      *(_DWORD *)(v5 + 32) = *(_DWORD *)(v6 + 32);
    }
    if (*(_DWORD *)(v6 + 48))
    {
      uint64_t result = (uint64_t)malloc(0x200uLL);
      *(void *)(v5 + 56) = result;
      if (!result) {
        return result;
      }
      memcpy((void *)result, *(const void **)(v6 + 56), 0x200uLL);
      *(_DWORD *)(v5 + 48) = *(_DWORD *)(v6 + 48);
    }
    int v7 = *(_DWORD *)(v6 + 64);
    if (v7)
    {
      uint64_t result = (uint64_t)malloc(0x200uLL);
      *(void *)(v5 + 72) = result;
      if (!result) {
        return result;
      }
      memcpy((void *)result, *(const void **)(v6 + 72), 0x200uLL);
      *(_DWORD *)(v5 + 64) = v7;
    }
    int v8 = *(_DWORD *)(v6 + 80);
    if (v8)
    {
      uint64_t result = (uint64_t)malloc(0x200uLL);
      *(void *)(v5 + 88) = result;
      if (!result) {
        return result;
      }
      memcpy((void *)result, *(const void **)(v6 + 88), 0x200uLL);
      *(_DWORD *)(v5 + 80) = v8;
    }
    int v9 = *(_DWORD *)(v6 + 96);
    if (v9)
    {
      uint64_t result = (uint64_t)malloc(0x200uLL);
      *(void *)(v5 + 104) = result;
      if (!result) {
        return result;
      }
      memcpy((void *)result, *(const void **)(v6 + 104), 0x200uLL);
      *(_DWORD *)(v5 + 96) = v9;
    }
    int v10 = *(_DWORD *)(v6 + 112);
    if (v10)
    {
      uint64_t result = (uint64_t)malloc(0x200uLL);
      *(void *)(v5 + 120) = result;
      if (!result) {
        return result;
      }
      memcpy((void *)result, *(const void **)(v6 + 120), 0x200uLL);
      *(_DWORD *)(v5 + 112) = v10;
    }
    int v11 = *(_DWORD *)(v6 + 128);
    if (v11)
    {
      uint64_t result = (uint64_t)malloc(0x200uLL);
      *(void *)(v5 + 136) = result;
      if (!result) {
        return result;
      }
      memcpy((void *)result, *(const void **)(v6 + 136), 0x200uLL);
      *(_DWORD *)(v5 + 128) = v11;
    }
    int v12 = *(_DWORD *)(v6 + 144);
    if (v12)
    {
      uint64_t result = (uint64_t)malloc(0x200uLL);
      *(void *)(v5 + 152) = result;
      if (!result) {
        return result;
      }
      memcpy((void *)result, *(const void **)(v6 + 152), 0x200uLL);
      *(_DWORD *)(v5 + 144) = v12;
    }
    int v13 = *(_DWORD *)(v6 + 160);
    if (v13)
    {
      uint64_t result = (uint64_t)malloc(0x200uLL);
      *(void *)(v5 + 168) = result;
      if (!result) {
        return result;
      }
      memcpy((void *)result, *(const void **)(v6 + 168), 0x200uLL);
      *(_DWORD *)(v5 + 160) = v13;
    }
    int v14 = *(_DWORD *)(v6 + 176);
    if (v14)
    {
      uint64_t result = (uint64_t)malloc(0x200uLL);
      *(void *)(v5 + 184) = result;
      if (!result) {
        return result;
      }
      memcpy((void *)result, *(const void **)(v6 + 184), 0x200uLL);
      *(_DWORD *)(v5 + 176) = v14;
    }
    int v15 = *(_DWORD *)(v6 + 192);
    if (v15)
    {
      uint64_t result = (uint64_t)malloc(0x200uLL);
      *(void *)(v5 + 200) = result;
      if (!result) {
        return result;
      }
      memcpy((void *)result, *(const void **)(v6 + 200), 0x200uLL);
      *(_DWORD *)(v5 + 192) = v15;
    }
    int v16 = *(_DWORD *)(v6 + 208);
    if (v16)
    {
      uint64_t result = (uint64_t)malloc(0x200uLL);
      *(void *)(v5 + 216) = result;
      if (!result) {
        return result;
      }
      memcpy((void *)result, *(const void **)(v6 + 216), 0x200uLL);
      *(_DWORD *)(v5 + 208) = v16;
    }
    return 1;
  }
  return result;
}

uint64_t ETLDMCViewMergeInto(uint64_t a1, unsigned int *a2)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v3 = ETLDMCViewMerge((uint64_t)&v7, (unsigned int *)a1, a2);
  if (v3)
  {
    ETLDMCViewFree((void *)a1);
    long long v4 = v8;
    *(_OWORD *)a1 = v7;
    *(_OWORD *)(a1 + 16) = v4;
    long long v5 = v10;
    *(_OWORD *)(a1 + 32) = v9;
    *(_OWORD *)(a1 + 48) = v5;
  }
  else
  {
    ETLDMCViewFree(&v7);
  }
  return v3;
}

const char *ETLDMCViewGetAsString(unsigned int a1)
{
  if (a1 <= 3) {
    return (&ETLDMCViewGetAsString_kViewStrings)[a1];
  }
  else {
    return "Unknown";
  }
}

uint64_t ETLDMCViewLoadQTraces(uint64_t a1, int16x8_t *a2, unsigned int a3)
{
  if (!a3)
  {
    unsigned int v7 = 0;
    goto LABEL_12;
  }
  if (a3 >= 0x10)
  {
    uint64_t v6 = a3 & 0xFFFFFFF0;
    long long v8 = a2 + 1;
    int32x4_t v9 = 0uLL;
    v10.i64[0] = 0x100000001;
    v10.i64[1] = 0x100000001;
    uint64_t v11 = v6;
    int32x4_t v12 = 0uLL;
    int32x4_t v13 = 0uLL;
    int32x4_t v14 = 0uLL;
    do
    {
      uint16x8_t v15 = (uint16x8_t)vtstq_s16(v8[-1], v8[-1]);
      uint16x8_t v16 = (uint16x8_t)vtstq_s16(*v8, *v8);
      int32x4_t v12 = vaddq_s32(v12, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v15), v10));
      int32x4_t v9 = vaddq_s32(v9, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v15.i8), v10));
      int32x4_t v14 = vaddq_s32(v14, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v16), v10));
      int32x4_t v13 = vaddq_s32(v13, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v16.i8), v10));
      v8 += 2;
      v11 -= 16;
    }
    while (v11);
    unsigned int v7 = vaddvq_s32(vaddq_s32(vaddq_s32(v13, v9), vaddq_s32(v14, v12)));
    if (v6 == a3) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v6 = 0;
    unsigned int v7 = 0;
  }
  uint64_t v17 = a3 - v6;
  uint64_t v18 = (unsigned __int16 *)a2 + v6;
  do
  {
    if (*v18++) {
      ++v7;
    }
    --v17;
  }
  while (v17);
LABEL_12:
  *(_DWORD *)(a1 + 48) = v7;
  uint64_t v20 = (char *)malloc(4 * v7);
  *(void *)(a1 + 56) = v20;
  if (a3)
  {
    uint64_t v21 = 0;
    unsigned int v22 = 0;
    char v23 = 0;
    while (1)
    {
      __int16 v24 = a2->i16[v21];
      if (v24)
      {
        unsigned __int16 v25 = &v20[4 * v22];
        *(_WORD *)unsigned __int16 v25 = v21;
        ++v22;
        *((_WORD *)v25 + 1) = v24;
        if (v22 > v7)
        {
          _ETLDebugPrint();
          return 0;
        }
        char v23 = 1;
      }
      if (a3 == ++v21) {
        return v23 & 1;
      }
    }
  }
  char v23 = 0;
  return v23 & 1;
}

uint64_t APPLIB_DIAG_FTM_SetRFMode(unsigned __int8 *a1, int a2, __int16 a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0xF) {
    return result;
  }
  bzero(a1, a2);
  *(_WORD *)a1 = 2891;
  int v7 = gModeId;
  a1[2] = gModeId;
  int v8 = HIBYTE(gModeId);
  a1[3] = HIBYTE(gModeId);
  a1[4] = 7;
  *((_WORD *)a1 + 3) = a3;
  char v9 = HIBYTE(a3);
  unsigned __int16 v10 = crc_16_l_table[crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC] ^ HIBYTE(crc_16_l_table[v7 ^ 0xA5]) ^ 7];
  int v11 = a1[5];
  unsigned int v12 = crc_16_l_table[(v11 ^ v10 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC]))];
  unsigned int v13 = crc_16_l_table[(v12 ^ HIBYTE(v10) ^ a3)];
  int v14 = crc_16_l_table[HIBYTE(a3) ^ crc_16_l_table[(v12 ^ HIBYTE(v10) ^ a3)] ^ (v12 >> 8)];
  *((_WORD *)a1 + 4) = v14 ^ ~HIBYTE(crc_16_l_table[(v12 ^ HIBYTE(v10) ^ a3)]);
  if (a2 < 20) {
    return 0xFFFFFFFFLL;
  }
  int v26 = v14 ^ ~(v13 >> 8);
  bzero(v28, 0x7FEuLL);
  __int16 __src = 2891;
  if ((v7 - 125) <= 1)
  {
    v28[0] = 125;
    int v15 = 3;
    v28[1] = v7 ^ 0x20;
    uint64_t v16 = 4;
    if ((v8 - 125) > 1) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  int v15 = 2;
  v28[0] = v7;
  uint64_t v16 = 3;
  if ((v8 - 125) <= 1)
  {
LABEL_9:
    v28[v16 - 2] = 125;
    LOBYTE(v8) = v8 ^ 0x20;
    LODWORD(v16) = v15 + 2;
  }
LABEL_10:
  char v17 = a3;
  uint64_t v18 = &v28[v16 - 2];
  *uint64_t v18 = v8;
  v18[1] = 7;
  uint64_t v19 = v16 + 2;
  if ((v11 - 125) <= 1)
  {
    v28[v19 - 2] = 125;
    LOBYTE(v11) = v11 ^ 0x20;
    LODWORD(v19) = v16 + 3;
  }
  v28[v19 - 2] = v11;
  uint64_t v20 = v19 + 1;
  if (a3 - 125 <= 1)
  {
    v28[v20 - 2] = 125;
    char v17 = a3 ^ 0x20;
    LODWORD(v20) = v19 + 2;
  }
  int v21 = ~(v14 ^ BYTE1(v13));
  v28[v20 - 2] = v17;
  uint64_t v22 = v20 + 1;
  if (HIBYTE(a3) - 125 <= 1)
  {
    v28[v22 - 2] = 125;
    char v9 = HIBYTE(a3) ^ 0x20;
    LODWORD(v22) = v20 + 2;
  }
  char v23 = (unsigned __int16)(v14 ^ ~(unsigned __int16)(v13 >> 8)) >> 8;
  v28[v22 - 2] = v9;
  uint64_t v24 = v22 + 1;
  if ((v21 - 125) <= 1)
  {
    v28[v24 - 2] = 125;
    LOBYTE(v21) = v21 ^ 0x20;
    LODWORD(v24) = v22 + 2;
  }
  v28[v24 - 2] = v21;
  uint64_t v25 = v24 + 1;
  if (BYTE1(v26) - 125 <= 1)
  {
    v28[v25 - 2] = 125;
    char v23 = BYTE1(v26) ^ 0x20;
    LODWORD(v25) = v24 + 2;
  }
  v28[v25 - 2] = v23;
  memcpy(a1, &__src, v25 + 1);
  uint64_t result = (v25 + 2);
  a1[v25 + 1] = 126;
  return result;
}

uint64_t APPLIB_DIAG_FTM_SetChannel(unsigned __int8 *a1, int a2, __int16 a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0xF) {
    return result;
  }
  bzero(a1, a2);
  *(_WORD *)a1 = 2891;
  int v7 = gModeId;
  a1[2] = gModeId;
  int v8 = HIBYTE(gModeId);
  a1[3] = HIBYTE(gModeId);
  a1[4] = 8;
  *((_WORD *)a1 + 3) = a3;
  char v9 = HIBYTE(a3);
  unsigned __int16 v10 = crc_16_l_table[crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC] ^ HIBYTE(crc_16_l_table[v7 ^ 0xA5]) ^ 8];
  int v11 = a1[5];
  unsigned int v12 = crc_16_l_table[(v11 ^ v10 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC]))];
  unsigned int v13 = crc_16_l_table[(v12 ^ HIBYTE(v10) ^ a3)];
  int v14 = crc_16_l_table[HIBYTE(a3) ^ crc_16_l_table[(v12 ^ HIBYTE(v10) ^ a3)] ^ (v12 >> 8)];
  *((_WORD *)a1 + 4) = v14 ^ ~HIBYTE(crc_16_l_table[(v12 ^ HIBYTE(v10) ^ a3)]);
  if (a2 < 20) {
    return 0xFFFFFFFFLL;
  }
  int v26 = v14 ^ ~(v13 >> 8);
  bzero(v28, 0x7FEuLL);
  __int16 __src = 2891;
  if ((v7 - 125) <= 1)
  {
    v28[0] = 125;
    int v15 = 3;
    v28[1] = v7 ^ 0x20;
    uint64_t v16 = 4;
    if ((v8 - 125) > 1) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  int v15 = 2;
  v28[0] = v7;
  uint64_t v16 = 3;
  if ((v8 - 125) <= 1)
  {
LABEL_9:
    v28[v16 - 2] = 125;
    LOBYTE(v8) = v8 ^ 0x20;
    LODWORD(v16) = v15 + 2;
  }
LABEL_10:
  char v17 = a3;
  uint64_t v18 = &v28[v16 - 2];
  *uint64_t v18 = v8;
  v18[1] = 8;
  uint64_t v19 = v16 + 2;
  if ((v11 - 125) <= 1)
  {
    v28[v19 - 2] = 125;
    LOBYTE(v11) = v11 ^ 0x20;
    LODWORD(v19) = v16 + 3;
  }
  v28[v19 - 2] = v11;
  uint64_t v20 = v19 + 1;
  if (a3 - 125 <= 1)
  {
    v28[v20 - 2] = 125;
    char v17 = a3 ^ 0x20;
    LODWORD(v20) = v19 + 2;
  }
  int v21 = ~(v14 ^ BYTE1(v13));
  v28[v20 - 2] = v17;
  uint64_t v22 = v20 + 1;
  if (HIBYTE(a3) - 125 <= 1)
  {
    v28[v22 - 2] = 125;
    char v9 = HIBYTE(a3) ^ 0x20;
    LODWORD(v22) = v20 + 2;
  }
  char v23 = (unsigned __int16)(v14 ^ ~(unsigned __int16)(v13 >> 8)) >> 8;
  v28[v22 - 2] = v9;
  uint64_t v24 = v22 + 1;
  if ((v21 - 125) <= 1)
  {
    v28[v24 - 2] = 125;
    LOBYTE(v21) = v21 ^ 0x20;
    LODWORD(v24) = v22 + 2;
  }
  v28[v24 - 2] = v21;
  uint64_t v25 = v24 + 1;
  if (BYTE1(v26) - 125 <= 1)
  {
    v28[v25 - 2] = 125;
    char v23 = BYTE1(v26) ^ 0x20;
    LODWORD(v25) = v24 + 2;
  }
  v28[v25 - 2] = v23;
  memcpy(a1, &__src, v25 + 1);
  uint64_t result = (v25 + 2);
  a1[v25 + 1] = 126;
  return result;
}

uint64_t APPLIB_DIAG_FTM_Tx_On(unsigned __int8 *a1, int a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0xD)
  {
    bzero(a1, a2);
    *(_WORD *)a1 = 2891;
    int v5 = gModeId;
    a1[2] = gModeId;
    int v6 = HIBYTE(gModeId);
    a1[3] = HIBYTE(gModeId);
    a1[4] = 2;
    int v7 = crc_16_l_table[crc_16_l_table[v5 ^ 0xA5] ^ v6 ^ 0xEC];
    unsigned int v8 = crc_16_l_table[v7 ^ HIBYTE(crc_16_l_table[v5 ^ 0xA5]) ^ 2];
    int v9 = a1[5];
    int v10 = crc_16_l_table[(v9 ^ v8 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v5 ^ 0xA5] ^ v6 ^ 0xEC]))];
    int v11 = v10 ^ ~(v8 >> 8);
    *((_WORD *)a1 + 3) = v10 ^ ~HIBYTE(crc_16_l_table[v7 ^ HIBYTE(crc_16_l_table[v5 ^ 0xA5]) ^ 2]);
    if (a2 >= 16)
    {
      bzero(v21, 0x7FEuLL);
      __int16 __src = 2891;
      if ((v5 - 125) > 1)
      {
        unsigned int v12 = 2;
      }
      else
      {
        v21[0] = 125;
        LOBYTE(v5) = v5 ^ 0x20;
        unsigned int v12 = 3;
      }
      v21[v12 - 2] = v5;
      uint64_t v13 = v12 + 1;
      if ((v6 - 125) <= 1)
      {
        v21[v13 - 2] = 125;
        LODWORD(v13) = v12 + 2;
        LOBYTE(v6) = v6 ^ 0x20;
      }
      int v14 = ~(v10 ^ BYTE1(v8));
      int v15 = &v21[v13 - 2];
      *int v15 = v6;
      v15[1] = 2;
      uint64_t v16 = v13 + 2;
      if ((v9 - 125) <= 1)
      {
        v21[v16 - 2] = 125;
        LOBYTE(v9) = v9 ^ 0x20;
        LODWORD(v16) = v13 + 3;
      }
      char v17 = (unsigned __int16)(v10 ^ ~(unsigned __int16)(v8 >> 8)) >> 8;
      v21[v16 - 2] = v9;
      uint64_t v18 = v16 + 1;
      if ((v14 - 125) <= 1)
      {
        v21[v18 - 2] = 125;
        LOBYTE(v14) = v14 ^ 0x20;
        LODWORD(v18) = v16 + 2;
      }
      v21[v18 - 2] = v14;
      uint64_t v19 = v18 + 1;
      if (BYTE1(v11) - 125 <= 1)
      {
        v21[v19 - 2] = 125;
        char v17 = BYTE1(v11) ^ 0x20;
        LODWORD(v19) = v18 + 2;
      }
      v21[v19 - 2] = v17;
      memcpy(a1, &__src, v19 + 1);
      uint64_t result = (v19 + 2);
      a1[v19 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_Tx_Off(unsigned __int8 *a1, int a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0xD)
  {
    bzero(a1, a2);
    *(_WORD *)a1 = 2891;
    int v5 = gModeId;
    a1[2] = gModeId;
    int v6 = HIBYTE(gModeId);
    a1[3] = HIBYTE(gModeId);
    a1[4] = 3;
    int v7 = crc_16_l_table[crc_16_l_table[v5 ^ 0xA5] ^ v6 ^ 0xEC];
    unsigned int v8 = crc_16_l_table[v7 ^ HIBYTE(crc_16_l_table[v5 ^ 0xA5]) ^ 3];
    int v9 = a1[5];
    int v10 = crc_16_l_table[(v9 ^ v8 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v5 ^ 0xA5] ^ v6 ^ 0xEC]))];
    int v11 = v10 ^ ~(v8 >> 8);
    *((_WORD *)a1 + 3) = v10 ^ ~HIBYTE(crc_16_l_table[v7 ^ HIBYTE(crc_16_l_table[v5 ^ 0xA5]) ^ 3]);
    if (a2 >= 16)
    {
      bzero(v21, 0x7FEuLL);
      __int16 __src = 2891;
      if ((v5 - 125) > 1)
      {
        unsigned int v12 = 2;
      }
      else
      {
        v21[0] = 125;
        LOBYTE(v5) = v5 ^ 0x20;
        unsigned int v12 = 3;
      }
      v21[v12 - 2] = v5;
      uint64_t v13 = v12 + 1;
      if ((v6 - 125) <= 1)
      {
        v21[v13 - 2] = 125;
        LODWORD(v13) = v12 + 2;
        LOBYTE(v6) = v6 ^ 0x20;
      }
      int v14 = ~(v10 ^ BYTE1(v8));
      int v15 = &v21[v13 - 2];
      *int v15 = v6;
      v15[1] = 3;
      uint64_t v16 = v13 + 2;
      if ((v9 - 125) <= 1)
      {
        v21[v16 - 2] = 125;
        LOBYTE(v9) = v9 ^ 0x20;
        LODWORD(v16) = v13 + 3;
      }
      char v17 = (unsigned __int16)(v10 ^ ~(unsigned __int16)(v8 >> 8)) >> 8;
      v21[v16 - 2] = v9;
      uint64_t v18 = v16 + 1;
      if ((v14 - 125) <= 1)
      {
        v21[v18 - 2] = 125;
        LOBYTE(v14) = v14 ^ 0x20;
        LODWORD(v18) = v16 + 2;
      }
      v21[v18 - 2] = v14;
      uint64_t v19 = v18 + 1;
      if (BYTE1(v11) - 125 <= 1)
      {
        v21[v19 - 2] = 125;
        char v17 = BYTE1(v11) ^ 0x20;
        LODWORD(v19) = v18 + 2;
      }
      v21[v19 - 2] = v17;
      memcpy(a1, &__src, v19 + 1);
      uint64_t result = (v19 + 2);
      a1[v19 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_SetWaveForm(unsigned __int8 *a1, int a2, int a3, int a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0xF) {
    return result;
  }
  bzero(a1, a2);
  *(_WORD *)a1 = 2891;
  *((_WORD *)a1 + 1) = gModeId;
  if (a3)
  {
    if (a3 != 1) {
      return 0xFFFFFFFFLL;
    }
    if (a4)
    {
      if (a4 == 1)
      {
        a1[4] = -120;
        unsigned int v9 = 10;
        int v10 = 64;
        char v11 = 1;
        uint64_t v12 = 9;
        uint64_t v13 = 8;
        uint64_t v14 = 7;
        uint64_t v15 = 6;
        char v16 = 1;
        goto LABEL_11;
      }
      return 0xFFFFFFFFLL;
    }
    unsigned int v9 = 9;
    int v10 = 56;
    char v16 = 1;
  }
  else
  {
    char v16 = 0;
    unsigned int v9 = 9;
    int v10 = 56;
  }
  char v11 = 50;
  uint64_t v12 = 8;
  uint64_t v13 = 7;
  uint64_t v14 = 6;
  uint64_t v15 = 4;
LABEL_11:
  a1[v15] = v11;
  a1[v14] = v16;
  LOWORD(v17) = -1;
  uint64_t v18 = (char *)a1;
  do
  {
    char v19 = *v18++;
    int v17 = crc_16_l_table[(v19 ^ v17)] ^ ((unsigned __int16)(v17 & 0xFF00) >> 8);
    v10 -= 8;
  }
  while ((_WORD)v10);
  a1[v13] = ~(_BYTE)v17;
  a1[v12] = (unsigned __int16)~(_WORD)v17 >> 8;
  if (a2 < (int)(2 * v9)) {
    return 0xFFFFFFFFLL;
  }
  bzero(__src, 0x800uLL);
  uint64_t v20 = 0;
  LODWORD(v21) = 0;
  uint64_t v22 = v9;
  do
  {
    while (1)
    {
      int v24 = a1[v20];
      if ((v24 - 125) > 1) {
        break;
      }
      int v23 = v21 + 1;
      __src[(int)v21] = 125;
      __src[(int)v21 + 1] = v24 ^ 0x20;
      size_t v21 = (int)v21 + 1 + 1;
      if (v22 == ++v20) {
        goto LABEL_19;
      }
    }
    int v23 = v21;
    __src[(int)v21] = v24;
    size_t v21 = (int)v21 + 1;
    ++v20;
  }
  while (v22 != v20);
LABEL_19:
  memcpy(a1, __src, v21);
  uint64_t result = (v23 + 2);
  a1[v21] = 126;
  return result;
}

uint64_t APPLIB_DIAG_FTM_SetPARange(unsigned __int8 *a1, int a2, unsigned __int8 a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0xF) {
    return result;
  }
  bzero(a1, a2);
  *(_WORD *)a1 = 2891;
  int v7 = gModeId;
  a1[2] = gModeId;
  int v8 = HIBYTE(gModeId);
  a1[3] = HIBYTE(gModeId);
  a1[4] = 54;
  a1[6] = a3;
  unsigned __int16 v9 = crc_16_l_table[crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC] ^ HIBYTE(crc_16_l_table[v7 ^ 0xA5]) ^ 0x36];
  int v10 = a1[5];
  unsigned __int16 v11 = crc_16_l_table[(v10 ^ v9 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC]))];
  unsigned int v12 = crc_16_l_table[(v11 ^ HIBYTE(v9) ^ a3)];
  int v13 = crc_16_l_table[(a1[7] ^ v12 ^ HIBYTE(v11))];
  int v14 = v13 ^ ~(v12 >> 8);
  *((_WORD *)a1 + 4) = v13 ^ ~HIBYTE(crc_16_l_table[(v11 ^ HIBYTE(v9) ^ a3)]);
  if (a2 < 20) {
    return 0xFFFFFFFFLL;
  }
  bzero(v28, 0x7FEuLL);
  __int16 v27 = 2891;
  if ((v7 - 125) <= 1)
  {
    v28[0] = 125;
    int v15 = 3;
    v28[1] = v7 ^ 0x20;
    uint64_t v16 = 4;
    if ((v8 - 125) > 1) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  int v15 = 2;
  v28[0] = v7;
  uint64_t v16 = 3;
  if ((v8 - 125) <= 1)
  {
LABEL_9:
    v28[v16 - 2] = 125;
    LOBYTE(v8) = v8 ^ 0x20;
    LODWORD(v16) = v15 + 2;
  }
LABEL_10:
  char v17 = a3;
  uint64_t v18 = &v28[v16 - 2];
  *uint64_t v18 = v8;
  v18[1] = 54;
  uint64_t v19 = v16 + 2;
  if ((v10 - 125) <= 1)
  {
    v28[v19 - 2] = 125;
    LOBYTE(v10) = v10 ^ 0x20;
    LODWORD(v19) = v16 + 3;
  }
  v28[v19 - 2] = v10;
  uint64_t v20 = v19 + 1;
  if (a3 - 125 <= 1)
  {
    v28[v20 - 2] = 125;
    LODWORD(v20) = v19 + 2;
    char v17 = a3 ^ 0x20;
  }
  int v21 = ~(v13 ^ BYTE1(v12));
  v28[v20 - 2] = v17;
  uint64_t v22 = v20 + 1;
  int v23 = a1[7];
  if ((v23 - 125) <= 1)
  {
    v28[v22 - 2] = 125;
    LOBYTE(v23) = v23 ^ 0x20;
    LODWORD(v22) = v20 + 2;
  }
  char v24 = (unsigned __int16)(v13 ^ ~(unsigned __int16)(v12 >> 8)) >> 8;
  v28[v22 - 2] = v23;
  uint64_t v25 = v22 + 1;
  if ((v21 - 125) <= 1)
  {
    v28[v25 - 2] = 125;
    LODWORD(v25) = v22 + 2;
    LOBYTE(v21) = v21 ^ 0x20;
  }
  v28[v25 - 2] = v21;
  uint64_t v26 = v25 + 1;
  if (BYTE1(v14) - 125 <= 1)
  {
    v28[v26 - 2] = 125;
    char v24 = BYTE1(v14) ^ 0x20;
    LODWORD(v26) = v25 + 2;
  }
  v28[v26 - 2] = v24;
  memcpy(a1, &v27, v26 + 1);
  uint64_t result = (v26 + 2);
  a1[v26 + 1] = 126;
  return result;
}

uint64_t APPLIB_DIAG_FTM_SetPDM(unsigned __int8 *a1, int a2, unsigned __int8 a3, unsigned __int8 a4)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0x11) {
    return result;
  }
  bzero(a1, a2);
  *(_WORD *)a1 = 2891;
  int v9 = gModeId;
  a1[2] = gModeId;
  int v10 = HIBYTE(gModeId);
  a1[3] = HIBYTE(gModeId);
  a1[4] = 0;
  a1[6] = a3;
  a1[8] = a4;
  unsigned __int16 v11 = crc_16_l_table[crc_16_l_table[crc_16_l_table[v9 ^ 0xA5] ^ v10 ^ 0xEC] ^ HIBYTE(crc_16_l_table[v9 ^ 0xA5])];
  int v12 = a1[5];
  unsigned __int16 v13 = crc_16_l_table[(v12 ^ v11 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v9 ^ 0xA5] ^ v10 ^ 0xEC]))];
  unsigned __int16 v14 = crc_16_l_table[(v13 ^ HIBYTE(v11) ^ a3)];
  unsigned __int16 v15 = crc_16_l_table[(a1[7] ^ v14 ^ HIBYTE(v13))];
  unsigned int v16 = crc_16_l_table[(v15 ^ HIBYTE(v14) ^ a4)];
  int v17 = crc_16_l_table[(a1[9] ^ v16 ^ HIBYTE(v15))];
  *((_WORD *)a1 + 5) = v17 ^ ~HIBYTE(crc_16_l_table[(v15 ^ HIBYTE(v14) ^ a4)]);
  if (a2 < 24) {
    return 0xFFFFFFFFLL;
  }
  int v34 = v17 ^ ~(v16 >> 8);
  bzero(v36, 0x7FEuLL);
  __int16 __src = 2891;
  if ((v9 - 125) <= 1)
  {
    v36[0] = 125;
    int v18 = 3;
    v36[1] = v9 ^ 0x20;
    uint64_t v19 = 4;
    if ((v10 - 125) > 1) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  int v18 = 2;
  v36[0] = v9;
  uint64_t v19 = 3;
  if ((v10 - 125) <= 1)
  {
LABEL_9:
    v36[v19 - 2] = 125;
    LOBYTE(v10) = v10 ^ 0x20;
    LODWORD(v19) = v18 + 2;
  }
LABEL_10:
  char v20 = a3;
  int v21 = &v36[v19 - 2];
  *int v21 = v10;
  v21[1] = 0;
  uint64_t v22 = v19 + 2;
  if ((v12 - 125) <= 1)
  {
    v36[v22 - 2] = 125;
    LOBYTE(v12) = v12 ^ 0x20;
    LODWORD(v22) = v19 + 3;
  }
  v36[v22 - 2] = v12;
  uint64_t v23 = v22 + 1;
  if (a3 - 125 <= 1)
  {
    v36[v23 - 2] = 125;
    char v20 = a3 ^ 0x20;
    LODWORD(v23) = v22 + 2;
  }
  char v24 = a4;
  v36[v23 - 2] = v20;
  uint64_t v25 = v23 + 1;
  int v26 = a1[7];
  if ((v26 - 125) <= 1)
  {
    v36[v25 - 2] = 125;
    LODWORD(v25) = v23 + 2;
    LOBYTE(v26) = v26 ^ 0x20;
  }
  v36[v25 - 2] = v26;
  uint64_t v27 = v25 + 1;
  if (a4 - 125 <= 1)
  {
    v36[v27 - 2] = 125;
    char v24 = a4 ^ 0x20;
    LODWORD(v27) = v25 + 2;
  }
  int v28 = ~(v17 ^ BYTE1(v16));
  v36[v27 - 2] = v24;
  uint64_t v29 = v27 + 1;
  int v30 = a1[9];
  if ((v30 - 125) <= 1)
  {
    v36[v29 - 2] = 125;
    LOBYTE(v30) = v30 ^ 0x20;
    LODWORD(v29) = v27 + 2;
  }
  char v31 = (unsigned __int16)(v17 ^ ~(unsigned __int16)(v16 >> 8)) >> 8;
  v36[v29 - 2] = v30;
  uint64_t v32 = v29 + 1;
  if ((v28 - 125) <= 1)
  {
    v36[v32 - 2] = 125;
    LODWORD(v32) = v29 + 2;
    LOBYTE(v28) = v28 ^ 0x20;
  }
  v36[v32 - 2] = v28;
  uint64_t v33 = v32 + 1;
  if (BYTE1(v34) - 125 <= 1)
  {
    v36[v33 - 2] = 125;
    char v31 = BYTE1(v34) ^ 0x20;
    LODWORD(v33) = v32 + 2;
  }
  v36[v33 - 2] = v31;
  memcpy(a1, &__src, v33 + 1);
  uint64_t result = (v33 + 2);
  a1[v33 + 1] = 126;
  return result;
}

uint64_t APPLIB_DIAG_FTM_ExecuteTxSweep(unsigned __int8 *a1, int a2, unsigned __int8 a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0xE) {
    return result;
  }
  int v6 = a3;
  bzero(a1, a2);
  *(_WORD *)a1 = 2891;
  int v7 = gModeId;
  a1[2] = gModeId;
  int v8 = HIBYTE(gModeId);
  a1[3] = HIBYTE(gModeId);
  a1[4] = 116;
  a1[6] = v6;
  unsigned __int16 v9 = crc_16_l_table[crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC] ^ HIBYTE(crc_16_l_table[v7 ^ 0xA5]) ^ 0x74];
  int v10 = a1[5];
  uint64_t v11 = (v10 ^ v9 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC]));
  unsigned int v12 = crc_16_l_table[v11];
  int v13 = crc_16_l_table[(v12 ^ HIBYTE(v9)) ^ v6];
  int v14 = v13 ^ ~(v12 >> 8);
  *(_WORD *)(a1 + 7) = v13 ^ ~HIBYTE(crc_16_l_table[v11]);
  if (a2 < 18) {
    return 0xFFFFFFFFLL;
  }
  bzero(v25, 0x7FEuLL);
  __int16 v24 = 2891;
  if ((v7 - 125) <= 1)
  {
    v25[0] = 125;
    int v15 = 3;
    v25[1] = v7 ^ 0x20;
    uint64_t v16 = 4;
    if ((v8 - 125) > 1) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  int v15 = 2;
  v25[0] = v7;
  uint64_t v16 = 3;
  if ((v8 - 125) <= 1)
  {
LABEL_9:
    v25[v16 - 2] = 125;
    LODWORD(v16) = v15 + 2;
    LOBYTE(v8) = v8 ^ 0x20;
  }
LABEL_10:
  int v17 = &v25[v16 - 2];
  *int v17 = v8;
  v17[1] = 116;
  uint64_t v18 = v16 + 2;
  if ((v10 - 125) <= 1)
  {
    v25[v18 - 2] = 125;
    LOBYTE(v10) = v10 ^ 0x20;
    LODWORD(v18) = v16 + 3;
  }
  int v19 = ~(v13 ^ BYTE1(v12));
  v25[v18 - 2] = v10;
  uint64_t v20 = v18 + 1;
  if ((v6 - 125) <= 1)
  {
    v25[v20 - 2] = 125;
    LOBYTE(v6) = v6 ^ 0x20;
    LODWORD(v20) = v18 + 2;
  }
  char v21 = (unsigned __int16)(v13 ^ ~(unsigned __int16)(v12 >> 8)) >> 8;
  v25[v20 - 2] = v6;
  uint64_t v22 = v20 + 1;
  if ((v19 - 125) <= 1)
  {
    v25[v22 - 2] = 125;
    LODWORD(v22) = v20 + 2;
    LOBYTE(v19) = v19 ^ 0x20;
  }
  v25[v22 - 2] = v19;
  uint64_t v23 = v22 + 1;
  if (BYTE1(v14) - 125 <= 1)
  {
    v25[v23 - 2] = 125;
    char v21 = BYTE1(v14) ^ 0x20;
    LODWORD(v23) = v22 + 2;
  }
  v25[v23 - 2] = v21;
  memcpy(a1, &v24, v23 + 1);
  uint64_t result = (v23 + 2);
  a1[v23 + 1] = 126;
  return result;
}

uint64_t APPLIB_DIAG_FTM_SetPDMStepSize(unsigned __int8 *a1, int a2, unsigned __int8 a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0xE) {
    return result;
  }
  int v6 = a3;
  bzero(a1, a2);
  *(_WORD *)a1 = 2891;
  int v7 = gModeId;
  a1[2] = gModeId;
  int v8 = HIBYTE(gModeId);
  a1[3] = HIBYTE(gModeId);
  a1[4] = -127;
  a1[6] = v6;
  unsigned __int16 v9 = crc_16_l_table[crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC] ^ HIBYTE(crc_16_l_table[v7 ^ 0xA5]) ^ 0x81];
  int v10 = a1[5];
  uint64_t v11 = (v10 ^ v9 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC]));
  unsigned int v12 = crc_16_l_table[v11];
  int v13 = crc_16_l_table[(v12 ^ HIBYTE(v9)) ^ v6];
  int v14 = v13 ^ ~(v12 >> 8);
  *(_WORD *)(a1 + 7) = v13 ^ ~HIBYTE(crc_16_l_table[v11]);
  if (a2 < 18) {
    return 0xFFFFFFFFLL;
  }
  bzero(v25, 0x7FEuLL);
  __int16 v24 = 2891;
  if ((v7 - 125) <= 1)
  {
    v25[0] = 125;
    int v15 = 3;
    v25[1] = v7 ^ 0x20;
    uint64_t v16 = 4;
    if ((v8 - 125) > 1) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  int v15 = 2;
  v25[0] = v7;
  uint64_t v16 = 3;
  if ((v8 - 125) <= 1)
  {
LABEL_9:
    v25[v16 - 2] = 125;
    LODWORD(v16) = v15 + 2;
    LOBYTE(v8) = v8 ^ 0x20;
  }
LABEL_10:
  int v17 = &v25[v16 - 2];
  *int v17 = v8;
  v17[1] = -127;
  uint64_t v18 = v16 + 2;
  if ((v10 - 125) <= 1)
  {
    v25[v18 - 2] = 125;
    LOBYTE(v10) = v10 ^ 0x20;
    LODWORD(v18) = v16 + 3;
  }
  int v19 = ~(v13 ^ BYTE1(v12));
  v25[v18 - 2] = v10;
  uint64_t v20 = v18 + 1;
  if ((v6 - 125) <= 1)
  {
    v25[v20 - 2] = 125;
    LOBYTE(v6) = v6 ^ 0x20;
    LODWORD(v20) = v18 + 2;
  }
  char v21 = (unsigned __int16)(v13 ^ ~(unsigned __int16)(v12 >> 8)) >> 8;
  v25[v20 - 2] = v6;
  uint64_t v22 = v20 + 1;
  if ((v19 - 125) <= 1)
  {
    v25[v22 - 2] = 125;
    LODWORD(v22) = v20 + 2;
    LOBYTE(v19) = v19 ^ 0x20;
  }
  v25[v22 - 2] = v19;
  uint64_t v23 = v22 + 1;
  if (BYTE1(v14) - 125 <= 1)
  {
    v25[v23 - 2] = 125;
    char v21 = BYTE1(v14) ^ 0x20;
    LODWORD(v23) = v22 + 2;
  }
  v25[v23 - 2] = v21;
  memcpy(a1, &v24, v23 + 1);
  uint64_t result = (v23 + 2);
  a1[v23 + 1] = 126;
  return result;
}

uint64_t APPLIB_DIAG_FTM_ConfigTxSweep(unsigned __int8 *a1, int a2, __int16 a3, __int16 a4)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x11)
  {
    bzero(a1, a2);
    *(_WORD *)a1 = 2891;
    int v9 = gModeId;
    a1[2] = gModeId;
    int v10 = HIBYTE(gModeId);
    a1[3] = HIBYTE(gModeId);
    a1[4] = 125;
    *((_WORD *)a1 + 3) = a3;
    char v11 = HIBYTE(a3);
    *((_WORD *)a1 + 4) = a4;
    char v12 = HIBYTE(a4);
    unsigned __int16 v13 = crc_16_l_table[crc_16_l_table[crc_16_l_table[v9 ^ 0xA5] ^ v10 ^ 0xEC] ^ HIBYTE(crc_16_l_table[v9 ^ 0xA5]) ^ 0x7D];
    int v14 = a1[5];
    unsigned __int16 v15 = crc_16_l_table[(v14 ^ v13 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v9 ^ 0xA5] ^ v10 ^ 0xEC]))];
    unsigned __int16 v16 = crc_16_l_table[(v15 ^ HIBYTE(v13) ^ a3)];
    unsigned int v17 = crc_16_l_table[(HIBYTE(a3) ^ v16 ^ HIBYTE(v15))];
    unsigned int v18 = crc_16_l_table[(a4 ^ v17 ^ HIBYTE(v16))];
    int v19 = crc_16_l_table[HIBYTE(a4) ^ crc_16_l_table[(a4 ^ v17 ^ HIBYTE(v16))] ^ (v17 >> 8)];
    *((_WORD *)a1 + 5) = v19 ^ ~(unsigned __int16)(v18 >> 8);
    if (a2 >= 24)
    {
      char v38 = v19;
      int v39 = v19 ^ ~(v18 >> 8);
      bzero(__src, 0x800uLL);
      int v20 = *a1;
      if ((v20 - 125) > 1)
      {
        unsigned int v21 = 0;
      }
      else
      {
        __src[0] = 125;
        LOBYTE(v20) = v20 ^ 0x20;
        unsigned int v21 = 1;
      }
      __src[v21] = v20;
      uint64_t v22 = v21 + 1;
      int v23 = a1[1];
      if ((v23 - 125) <= 1)
      {
        __src[v22] = 125;
        LODWORD(v22) = v21 | 2;
        LOBYTE(v23) = v23 ^ 0x20;
      }
      __src[v22] = v23;
      uint64_t v24 = v22 + 1;
      if ((v9 - 125) <= 1)
      {
        __src[v24] = 125;
        LOBYTE(v9) = v9 ^ 0x20;
        LODWORD(v24) = v22 + 2;
      }
      __src[v24] = v9;
      uint64_t v25 = v24 + 1;
      if ((v10 - 125) <= 1)
      {
        __src[v25] = 125;
        LOBYTE(v10) = v10 ^ 0x20;
        LODWORD(v25) = v24 + 2;
      }
      char v26 = a3;
      uint64_t v27 = &__src[v25];
      *uint64_t v27 = v10;
      *(_WORD *)(v27 + 1) = 23933;
      uint64_t v28 = v25 + 3;
      if ((v14 - 125) <= 1)
      {
        __src[v28] = 125;
        LOBYTE(v14) = v14 ^ 0x20;
        LODWORD(v28) = v25 + 4;
      }
      __src[v28] = v14;
      uint64_t v29 = v28 + 1;
      if (a3 - 125 <= 1)
      {
        __src[v29] = 125;
        char v26 = a3 ^ 0x20;
        LODWORD(v29) = v28 + 2;
      }
      char v30 = a4;
      __src[v29] = v26;
      uint64_t v31 = v29 + 1;
      if (HIBYTE(a3) - 125 <= 1)
      {
        __src[v31] = 125;
        LODWORD(v31) = v29 + 2;
        char v11 = HIBYTE(a3) ^ 0x20;
      }
      __src[v31] = v11;
      uint64_t v32 = v31 + 1;
      if (a4 - 125 <= 1)
      {
        __src[v32] = 125;
        char v30 = a4 ^ 0x20;
        LODWORD(v32) = v31 + 2;
      }
      int v33 = ~(v38 ^ BYTE1(v18));
      __src[v32] = v30;
      uint64_t v34 = v32 + 1;
      if (HIBYTE(a4) - 125 <= 1)
      {
        __src[v34] = 125;
        char v12 = HIBYTE(a4) ^ 0x20;
        LODWORD(v34) = v32 + 2;
      }
      char v35 = BYTE1(v39);
      __src[v34] = v12;
      uint64_t v36 = v34 + 1;
      if ((v33 - 125) <= 1)
      {
        __src[v36] = 125;
        LODWORD(v36) = v34 + 2;
        LOBYTE(v33) = v33 ^ 0x20;
      }
      __src[v36] = v33;
      uint64_t v37 = v36 + 1;
      if (BYTE1(v39) - 125 <= 1)
      {
        __src[v37] = 125;
        char v35 = BYTE1(v39) ^ 0x20;
        LODWORD(v37) = v36 + 2;
      }
      __src[v37] = v35;
      memcpy(a1, __src, v37 + 1);
      uint64_t result = (v37 + 2);
      a1[v37 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_GetAllHDETValues(unsigned __int8 *a1, int a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x2D)
  {
    bzero(a1, a2);
    *(_WORD *)a1 = 2891;
    *((_WORD *)a1 + 1) = gModeId;
    a1[4] = -112;
    int v5 = 560;
    LOWORD(v6) = -1;
    int v7 = (char *)a1;
    do
    {
      char v8 = *v7++;
      int v6 = crc_16_l_table[(v8 ^ v6)] ^ ((unsigned __int16)(v6 & 0xFF00) >> 8);
      v5 -= 8;
    }
    while ((_WORD)v5);
    *((_WORD *)a1 + 35) = ~(_WORD)v6;
    if (a2 >= 144)
    {
      bzero(__src, 0x800uLL);
      uint64_t v9 = 0;
      LODWORD(v10) = 0;
      do
      {
        while (1)
        {
          int v12 = a1[v9];
          if ((v12 - 125) > 1) {
            break;
          }
          int v11 = v10 + 1;
          __src[(int)v10] = 125;
          __src[(int)v10 + 1] = v12 ^ 0x20;
          size_t v10 = (int)v10 + 1 + 1;
          if (++v9 == 72) {
            goto LABEL_11;
          }
        }
        int v11 = v10;
        __src[(int)v10] = v12;
        size_t v10 = (int)v10 + 1;
        ++v9;
      }
      while (v9 != 72);
LABEL_11:
      memcpy(a1, __src, v10);
      uint64_t result = (v11 + 2);
      a1[v10] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_GetADCValue(unsigned __int8 *a1, int a2, unsigned __int8 a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0x11) {
    return result;
  }
  int v6 = a3;
  bzero(a1, a2);
  *(_WORD *)a1 = 2891;
  int v7 = gModeId;
  a1[2] = gModeId;
  int v8 = HIBYTE(gModeId);
  a1[3] = HIBYTE(gModeId);
  a1[4] = 59;
  a1[6] = v6;
  *((_WORD *)a1 + 4) = -14636;
  unsigned __int16 v9 = crc_16_l_table[crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC] ^ HIBYTE(crc_16_l_table[v7 ^ 0xA5]) ^ 0x3B];
  int v10 = a1[5];
  unsigned __int16 v11 = crc_16_l_table[(v10 ^ v9 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC]))];
  unsigned __int16 v12 = crc_16_l_table[(v11 ^ HIBYTE(v9)) ^ v6];
  unsigned int v13 = crc_16_l_table[(a1[7] ^ v12 ^ HIBYTE(v11))];
  unsigned int v14 = crc_16_l_table[(v13 ^ HIBYTE(v12)) ^ 0xD4];
  int v15 = crc_16_l_table[crc_16_l_table[(v13 ^ HIBYTE(v12)) ^ 0xD4] ^ (v13 >> 8) ^ 0xC6];
  int v16 = v15 ^ ~(v14 >> 8);
  *((_WORD *)a1 + 5) = v15 ^ ~HIBYTE(crc_16_l_table[(v13 ^ HIBYTE(v12)) ^ 0xD4]);
  if (a2 < 24) {
    return 0xFFFFFFFFLL;
  }
  bzero(v30, 0x7FEuLL);
  __int16 v29 = 2891;
  if ((v7 - 125) <= 1)
  {
    v30[0] = 125;
    int v17 = 3;
    v30[1] = v7 ^ 0x20;
    uint64_t v18 = 4;
    if ((v8 - 125) > 1) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  int v17 = 2;
  v30[0] = v7;
  uint64_t v18 = 3;
  if ((v8 - 125) <= 1)
  {
LABEL_9:
    v30[v18 - 2] = 125;
    LOBYTE(v8) = v8 ^ 0x20;
    LODWORD(v18) = v17 + 2;
  }
LABEL_10:
  int v19 = &v30[v18 - 2];
  *int v19 = v8;
  v19[1] = 59;
  uint64_t v20 = v18 + 2;
  if ((v10 - 125) <= 1)
  {
    v30[v20 - 2] = 125;
    LODWORD(v20) = v18 + 3;
    LOBYTE(v10) = v10 ^ 0x20;
  }
  v30[v20 - 2] = v10;
  uint64_t v21 = v20 + 1;
  if ((v6 - 125) <= 1)
  {
    v30[v21 - 2] = 125;
    LOBYTE(v6) = v6 ^ 0x20;
    LODWORD(v21) = v20 + 2;
  }
  int v22 = ~(v15 ^ BYTE1(v14));
  v30[v21 - 2] = v6;
  uint64_t v23 = v21 + 1;
  int v24 = a1[7];
  if ((v24 - 125) <= 1)
  {
    v30[v23 - 2] = 125;
    LOBYTE(v24) = v24 ^ 0x20;
    LODWORD(v23) = v21 + 2;
  }
  char v25 = (unsigned __int16)(v15 ^ ~(unsigned __int16)(v14 >> 8)) >> 8;
  char v26 = &v30[v23 - 2];
  *char v26 = v24;
  *(_WORD *)(v26 + 1) = -14636;
  uint64_t v27 = v23 + 3;
  if ((v22 - 125) <= 1)
  {
    v30[v27 - 2] = 125;
    LOBYTE(v22) = v22 ^ 0x20;
    LODWORD(v27) = v23 + 4;
  }
  v30[v27 - 2] = v22;
  uint64_t v28 = v27 + 1;
  if (BYTE1(v16) - 125 <= 1)
  {
    v30[v28 - 2] = 125;
    char v25 = BYTE1(v16) ^ 0x20;
    LODWORD(v28) = v27 + 2;
  }
  v30[v28 - 2] = v25;
  memcpy(a1, &v29, v28 + 1);
  uint64_t result = (v28 + 2);
  a1[v28 + 1] = 126;
  return result;
}

uint64_t APPLIB_DIAG_FTM_SetHDETTracking(unsigned __int8 *a1, int a2, __int16 a3, __int16 a4)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x11)
  {
    bzero(a1, a2);
    *(_WORD *)a1 = 2891;
    int v9 = gModeId;
    a1[2] = gModeId;
    int v10 = HIBYTE(gModeId);
    a1[3] = HIBYTE(gModeId);
    a1[4] = 124;
    *((_WORD *)a1 + 3) = a3;
    char v11 = HIBYTE(a3);
    *((_WORD *)a1 + 4) = a4;
    char v12 = HIBYTE(a4);
    unsigned __int16 v13 = crc_16_l_table[crc_16_l_table[crc_16_l_table[v9 ^ 0xA5] ^ v10 ^ 0xEC] ^ HIBYTE(crc_16_l_table[v9 ^ 0xA5]) ^ 0x7C];
    int v14 = a1[5];
    unsigned __int16 v15 = crc_16_l_table[(v14 ^ v13 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v9 ^ 0xA5] ^ v10 ^ 0xEC]))];
    unsigned __int16 v16 = crc_16_l_table[(v15 ^ HIBYTE(v13) ^ a3)];
    unsigned int v17 = crc_16_l_table[(HIBYTE(a3) ^ v16 ^ HIBYTE(v15))];
    unsigned int v18 = crc_16_l_table[(a4 ^ v17 ^ HIBYTE(v16))];
    int v19 = crc_16_l_table[HIBYTE(a4) ^ crc_16_l_table[(a4 ^ v17 ^ HIBYTE(v16))] ^ (v17 >> 8)];
    *((_WORD *)a1 + 5) = v19 ^ ~HIBYTE(crc_16_l_table[(a4 ^ v17 ^ HIBYTE(v16))]);
    if (a2 >= 24)
    {
      char v38 = v19;
      int v39 = v19 ^ ~(v18 >> 8);
      bzero(__src, 0x800uLL);
      int v20 = *a1;
      if ((v20 - 125) > 1)
      {
        unsigned int v21 = 0;
      }
      else
      {
        __src[0] = 125;
        LOBYTE(v20) = v20 ^ 0x20;
        unsigned int v21 = 1;
      }
      __src[v21] = v20;
      uint64_t v22 = v21 + 1;
      int v23 = a1[1];
      if ((v23 - 125) <= 1)
      {
        __src[v22] = 125;
        LODWORD(v22) = v21 | 2;
        LOBYTE(v23) = v23 ^ 0x20;
      }
      __src[v22] = v23;
      uint64_t v24 = v22 + 1;
      if ((v9 - 125) <= 1)
      {
        __src[v24] = 125;
        LOBYTE(v9) = v9 ^ 0x20;
        LODWORD(v24) = v22 + 2;
      }
      __src[v24] = v9;
      uint64_t v25 = v24 + 1;
      if ((v10 - 125) <= 1)
      {
        __src[v25] = 125;
        LOBYTE(v10) = v10 ^ 0x20;
        LODWORD(v25) = v24 + 2;
      }
      char v26 = a3;
      uint64_t v27 = &__src[v25];
      *uint64_t v27 = v10;
      v27[1] = 124;
      uint64_t v28 = v25 + 2;
      if ((v14 - 125) <= 1)
      {
        __src[v28] = 125;
        LOBYTE(v14) = v14 ^ 0x20;
        LODWORD(v28) = v25 + 3;
      }
      __src[v28] = v14;
      uint64_t v29 = v28 + 1;
      if (a3 - 125 <= 1)
      {
        __src[v29] = 125;
        char v26 = a3 ^ 0x20;
        LODWORD(v29) = v28 + 2;
      }
      char v30 = a4;
      __src[v29] = v26;
      uint64_t v31 = v29 + 1;
      if (HIBYTE(a3) - 125 <= 1)
      {
        __src[v31] = 125;
        LODWORD(v31) = v29 + 2;
        char v11 = HIBYTE(a3) ^ 0x20;
      }
      __src[v31] = v11;
      uint64_t v32 = v31 + 1;
      if (a4 - 125 <= 1)
      {
        __src[v32] = 125;
        char v30 = a4 ^ 0x20;
        LODWORD(v32) = v31 + 2;
      }
      int v33 = ~(v38 ^ BYTE1(v18));
      __src[v32] = v30;
      uint64_t v34 = v32 + 1;
      if (HIBYTE(a4) - 125 <= 1)
      {
        __src[v34] = 125;
        char v12 = HIBYTE(a4) ^ 0x20;
        LODWORD(v34) = v32 + 2;
      }
      char v35 = BYTE1(v39);
      __src[v34] = v12;
      uint64_t v36 = v34 + 1;
      if ((v33 - 125) <= 1)
      {
        __src[v36] = 125;
        LODWORD(v36) = v34 + 2;
        LOBYTE(v33) = v33 ^ 0x20;
      }
      __src[v36] = v33;
      uint64_t v37 = v36 + 1;
      if (BYTE1(v39) - 125 <= 1)
      {
        __src[v37] = 125;
        char v35 = BYTE1(v39) ^ 0x20;
        LODWORD(v37) = v36 + 2;
      }
      __src[v37] = v35;
      memcpy(a1, __src, v37 + 1);
      uint64_t result = (v37 + 2);
      a1[v37 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_GetThermistorValue(_DWORD *a1, int a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 5)
  {
    bzero(a1, a2);
    *a1 = -2115764917;
    if (a2 >= 8)
    {
      *a1 = -2115764917;
      *((unsigned char *)a1 + 4) = 126;
      return 5;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_GetRxAGC(unsigned __int8 *a1, int a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0xF)
  {
    bzero(a1, a2);
    *(_WORD *)a1 = 2891;
    int v5 = gModeId;
    a1[2] = gModeId;
    int v6 = HIBYTE(gModeId);
    a1[3] = HIBYTE(gModeId);
    a1[4] = 53;
    *((_WORD *)a1 + 3) = 0;
    unsigned int v7 = crc_16_l_table[crc_16_l_table[crc_16_l_table[v5 ^ 0xA5] ^ v6 ^ 0xEC] ^ HIBYTE(crc_16_l_table[v5 ^ 0xA5]) ^ 0x35];
    int v8 = a1[5];
    int v9 = crc_16_l_table[(v8 ^ v7 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v5 ^ 0xA5] ^ v6 ^ 0xEC]))];
    unsigned int v10 = crc_16_l_table[v9 ^ (v7 >> 8)];
    int v11 = crc_16_l_table[crc_16_l_table[v9 ^ (v7 >> 8)] ^ HIBYTE(crc_16_l_table[(v8 ^ v7 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v5 ^ 0xA5] ^ v6 ^ 0xEC]))])];
    int v12 = v11 ^ ~(v10 >> 8);
    *((_WORD *)a1 + 4) = v11 ^ ~HIBYTE(crc_16_l_table[v9 ^ (v7 >> 8)]);
    if (a2 >= 20)
    {
      bzero(v23, 0x7FEuLL);
      __int16 __src = 2891;
      if ((v5 - 125) > 1)
      {
        unsigned int v13 = 2;
      }
      else
      {
        v23[0] = 125;
        LOBYTE(v5) = v5 ^ 0x20;
        unsigned int v13 = 3;
      }
      v23[v13 - 2] = v5;
      uint64_t v14 = v13 + 1;
      if ((v6 - 125) <= 1)
      {
        v23[v14 - 2] = 125;
        LODWORD(v14) = v13 + 2;
        LOBYTE(v6) = v6 ^ 0x20;
      }
      int v15 = ~(v11 ^ BYTE1(v10));
      unsigned __int16 v16 = &v23[v14 - 2];
      *unsigned __int16 v16 = v6;
      v16[1] = 53;
      uint64_t v17 = v14 + 2;
      if ((v8 - 125) <= 1)
      {
        v23[v17 - 2] = 125;
        LOBYTE(v8) = v8 ^ 0x20;
        LODWORD(v17) = v14 + 3;
      }
      char v18 = (unsigned __int16)(v11 ^ ~(unsigned __int16)(v10 >> 8)) >> 8;
      int v19 = &v23[v17 - 2];
      *int v19 = v8;
      *(_WORD *)(v19 + 1) = 0;
      uint64_t v20 = v17 + 3;
      if ((v15 - 125) <= 1)
      {
        v23[v20 - 2] = 125;
        LOBYTE(v15) = v15 ^ 0x20;
        LODWORD(v20) = v17 + 4;
      }
      v23[v20 - 2] = v15;
      uint64_t v21 = v20 + 1;
      if (BYTE1(v12) - 125 <= 1)
      {
        v23[v21 - 2] = 125;
        char v18 = BYTE1(v12) ^ 0x20;
        LODWORD(v21) = v20 + 2;
      }
      v23[v21 - 2] = v18;
      memcpy(a1, &__src, v21 + 1);
      uint64_t result = (v21 + 2);
      a1[v21 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_GetSynthState(unsigned __int8 *a1, int a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0xF)
  {
    bzero(a1, a2);
    *(_WORD *)a1 = 2891;
    int v5 = gModeId;
    a1[2] = gModeId;
    int v6 = HIBYTE(gModeId);
    a1[3] = HIBYTE(gModeId);
    a1[4] = 16;
    a1[6] = -8;
    unsigned int v7 = crc_16_l_table[crc_16_l_table[crc_16_l_table[v5 ^ 0xA5] ^ v6 ^ 0xEC] ^ HIBYTE(crc_16_l_table[v5 ^ 0xA5]) ^ 0x10];
    int v8 = a1[5];
    unsigned int v9 = crc_16_l_table[(v8 ^ v7 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v5 ^ 0xA5] ^ v6 ^ 0xEC]))];
    int v10 = crc_16_l_table[crc_16_l_table[(v8 ^ v7 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v5 ^ 0xA5] ^ v6 ^ 0xEC]))] ^ (v7 >> 8) ^ 0xF8];
    int v11 = v10 ^ ~(v9 >> 8);
    *(_WORD *)(a1 + 7) = v10 ^ ~HIBYTE(crc_16_l_table[(v8 ^ v7 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v5 ^ 0xA5] ^ v6 ^ 0xEC]))]);
    if (a2 >= 18)
    {
      bzero(v22, 0x7FEuLL);
      __int16 __src = 2891;
      if ((v5 - 125) > 1)
      {
        unsigned int v12 = 2;
      }
      else
      {
        v22[0] = 125;
        LOBYTE(v5) = v5 ^ 0x20;
        unsigned int v12 = 3;
      }
      v22[v12 - 2] = v5;
      uint64_t v13 = v12 + 1;
      if ((v6 - 125) <= 1)
      {
        v22[v13 - 2] = 125;
        LODWORD(v13) = v12 + 2;
        LOBYTE(v6) = v6 ^ 0x20;
      }
      int v14 = ~(v10 ^ BYTE1(v9));
      int v15 = &v22[v13 - 2];
      *int v15 = v6;
      v15[1] = 16;
      uint64_t v16 = v13 + 2;
      if ((v8 - 125) <= 1)
      {
        v22[v16 - 2] = 125;
        LOBYTE(v8) = v8 ^ 0x20;
        LODWORD(v16) = v13 + 3;
      }
      char v17 = (unsigned __int16)(v10 ^ ~(unsigned __int16)(v9 >> 8)) >> 8;
      char v18 = &v22[v16 - 2];
      *char v18 = v8;
      v18[1] = -8;
      uint64_t v19 = v16 + 2;
      if ((v14 - 125) <= 1)
      {
        v22[v19 - 2] = 125;
        LOBYTE(v14) = v14 ^ 0x20;
        LODWORD(v19) = v16 + 3;
      }
      v22[v19 - 2] = v14;
      uint64_t v20 = v19 + 1;
      if (BYTE1(v11) - 125 <= 1)
      {
        v22[v20 - 2] = 125;
        char v17 = BYTE1(v11) ^ 0x20;
        LODWORD(v20) = v19 + 2;
      }
      v22[v20 - 2] = v17;
      memcpy(a1, &__src, v20 + 1);
      uint64_t result = (v20 + 2);
      a1[v20 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_SetLNARange(unsigned __int8 *a1, int a2, unsigned __int8 a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0xF) {
    return result;
  }
  bzero(a1, a2);
  *(_WORD *)a1 = 2891;
  int v7 = gModeId;
  a1[2] = gModeId;
  int v8 = HIBYTE(gModeId);
  a1[3] = HIBYTE(gModeId);
  a1[4] = 58;
  a1[6] = a3;
  unsigned __int16 v9 = crc_16_l_table[crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC] ^ HIBYTE(crc_16_l_table[v7 ^ 0xA5]) ^ 0x3A];
  int v10 = a1[5];
  unsigned __int16 v11 = crc_16_l_table[(v10 ^ v9 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC]))];
  unsigned int v12 = crc_16_l_table[(v11 ^ HIBYTE(v9) ^ a3)];
  int v13 = crc_16_l_table[(a1[7] ^ v12 ^ HIBYTE(v11))];
  int v14 = v13 ^ ~(v12 >> 8);
  *((_WORD *)a1 + 4) = v13 ^ ~HIBYTE(crc_16_l_table[(v11 ^ HIBYTE(v9) ^ a3)]);
  if (a2 < 20) {
    return 0xFFFFFFFFLL;
  }
  bzero(v28, 0x7FEuLL);
  __int16 v27 = 2891;
  if ((v7 - 125) <= 1)
  {
    v28[0] = 125;
    int v15 = 3;
    v28[1] = v7 ^ 0x20;
    uint64_t v16 = 4;
    if ((v8 - 125) > 1) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  int v15 = 2;
  v28[0] = v7;
  uint64_t v16 = 3;
  if ((v8 - 125) <= 1)
  {
LABEL_9:
    v28[v16 - 2] = 125;
    LOBYTE(v8) = v8 ^ 0x20;
    LODWORD(v16) = v15 + 2;
  }
LABEL_10:
  char v17 = a3;
  char v18 = &v28[v16 - 2];
  *char v18 = v8;
  v18[1] = 58;
  uint64_t v19 = v16 + 2;
  if ((v10 - 125) <= 1)
  {
    v28[v19 - 2] = 125;
    LOBYTE(v10) = v10 ^ 0x20;
    LODWORD(v19) = v16 + 3;
  }
  v28[v19 - 2] = v10;
  uint64_t v20 = v19 + 1;
  if (a3 - 125 <= 1)
  {
    v28[v20 - 2] = 125;
    LODWORD(v20) = v19 + 2;
    char v17 = a3 ^ 0x20;
  }
  int v21 = ~(v13 ^ BYTE1(v12));
  v28[v20 - 2] = v17;
  uint64_t v22 = v20 + 1;
  int v23 = a1[7];
  if ((v23 - 125) <= 1)
  {
    v28[v22 - 2] = 125;
    LOBYTE(v23) = v23 ^ 0x20;
    LODWORD(v22) = v20 + 2;
  }
  char v24 = (unsigned __int16)(v13 ^ ~(unsigned __int16)(v12 >> 8)) >> 8;
  v28[v22 - 2] = v23;
  uint64_t v25 = v22 + 1;
  if ((v21 - 125) <= 1)
  {
    v28[v25 - 2] = 125;
    LODWORD(v25) = v22 + 2;
    LOBYTE(v21) = v21 ^ 0x20;
  }
  v28[v25 - 2] = v21;
  uint64_t v26 = v25 + 1;
  if (BYTE1(v14) - 125 <= 1)
  {
    v28[v26 - 2] = 125;
    char v24 = BYTE1(v14) ^ 0x20;
    LODWORD(v26) = v25 + 2;
  }
  v28[v26 - 2] = v24;
  memcpy(a1, &v27, v26 + 1);
  uint64_t result = (v26 + 2);
  a1[v26 + 1] = 126;
  return result;
}

uint64_t APPLIB_DIAG_FTM_GetDVGAOffset(unsigned __int8 *a1, int a2, __int16 a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0xF) {
    return result;
  }
  bzero(a1, a2);
  *(_WORD *)a1 = 2891;
  int v7 = gModeId;
  a1[2] = gModeId;
  int v8 = HIBYTE(gModeId);
  a1[3] = HIBYTE(gModeId);
  a1[4] = 117;
  *((_WORD *)a1 + 3) = a3;
  char v9 = HIBYTE(a3);
  unsigned __int16 v10 = crc_16_l_table[crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC] ^ HIBYTE(crc_16_l_table[v7 ^ 0xA5]) ^ 0x75];
  int v11 = a1[5];
  unsigned int v12 = crc_16_l_table[(v11 ^ v10 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC]))];
  unsigned int v13 = crc_16_l_table[(v12 ^ HIBYTE(v10) ^ a3)];
  int v14 = crc_16_l_table[HIBYTE(a3) ^ crc_16_l_table[(v12 ^ HIBYTE(v10) ^ a3)] ^ (v12 >> 8)];
  *((_WORD *)a1 + 4) = v14 ^ ~HIBYTE(crc_16_l_table[(v12 ^ HIBYTE(v10) ^ a3)]);
  if (a2 < 20) {
    return 0xFFFFFFFFLL;
  }
  int v26 = v14 ^ ~(v13 >> 8);
  bzero(v28, 0x7FEuLL);
  __int16 __src = 2891;
  if ((v7 - 125) <= 1)
  {
    v28[0] = 125;
    int v15 = 3;
    v28[1] = v7 ^ 0x20;
    uint64_t v16 = 4;
    if ((v8 - 125) > 1) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  int v15 = 2;
  v28[0] = v7;
  uint64_t v16 = 3;
  if ((v8 - 125) <= 1)
  {
LABEL_9:
    v28[v16 - 2] = 125;
    LOBYTE(v8) = v8 ^ 0x20;
    LODWORD(v16) = v15 + 2;
  }
LABEL_10:
  char v17 = a3;
  char v18 = &v28[v16 - 2];
  *char v18 = v8;
  v18[1] = 117;
  uint64_t v19 = v16 + 2;
  if ((v11 - 125) <= 1)
  {
    v28[v19 - 2] = 125;
    LOBYTE(v11) = v11 ^ 0x20;
    LODWORD(v19) = v16 + 3;
  }
  v28[v19 - 2] = v11;
  uint64_t v20 = v19 + 1;
  if (a3 - 125 <= 1)
  {
    v28[v20 - 2] = 125;
    char v17 = a3 ^ 0x20;
    LODWORD(v20) = v19 + 2;
  }
  int v21 = ~(v14 ^ BYTE1(v13));
  v28[v20 - 2] = v17;
  uint64_t v22 = v20 + 1;
  if (HIBYTE(a3) - 125 <= 1)
  {
    v28[v22 - 2] = 125;
    char v9 = HIBYTE(a3) ^ 0x20;
    LODWORD(v22) = v20 + 2;
  }
  char v23 = (unsigned __int16)(v14 ^ ~(unsigned __int16)(v13 >> 8)) >> 8;
  v28[v22 - 2] = v9;
  uint64_t v24 = v22 + 1;
  if ((v21 - 125) <= 1)
  {
    v28[v24 - 2] = 125;
    LOBYTE(v21) = v21 ^ 0x20;
    LODWORD(v24) = v22 + 2;
  }
  v28[v24 - 2] = v21;
  uint64_t v25 = v24 + 1;
  if (BYTE1(v26) - 125 <= 1)
  {
    v28[v25 - 2] = 125;
    char v23 = BYTE1(v26) ^ 0x20;
    LODWORD(v25) = v24 + 2;
  }
  v28[v25 - 2] = v23;
  memcpy(a1, &__src, v25 + 1);
  uint64_t result = (v25 + 2);
  a1[v25 + 1] = 126;
  return result;
}

uint64_t APPLIB_DIAG_FTM_SetDVGAOffset(unsigned __int8 *a1, int a2, unsigned __int8 a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0xF) {
    return result;
  }
  bzero(a1, a2);
  *(_WORD *)a1 = 2891;
  int v7 = gModeId;
  a1[2] = gModeId;
  int v8 = HIBYTE(gModeId);
  a1[3] = HIBYTE(gModeId);
  a1[4] = 111;
  a1[6] = a3;
  unsigned __int16 v9 = crc_16_l_table[crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC] ^ HIBYTE(crc_16_l_table[v7 ^ 0xA5]) ^ 0x6F];
  int v10 = a1[5];
  unsigned __int16 v11 = crc_16_l_table[(v10 ^ v9 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC]))];
  unsigned int v12 = crc_16_l_table[(v11 ^ HIBYTE(v9) ^ a3)];
  int v13 = crc_16_l_table[(a1[7] ^ v12 ^ HIBYTE(v11))];
  int v14 = v13 ^ ~(v12 >> 8);
  *((_WORD *)a1 + 4) = v13 ^ ~HIBYTE(crc_16_l_table[(v11 ^ HIBYTE(v9) ^ a3)]);
  if (a2 < 20) {
    return 0xFFFFFFFFLL;
  }
  bzero(v28, 0x7FEuLL);
  __int16 v27 = 2891;
  if ((v7 - 125) <= 1)
  {
    v28[0] = 125;
    int v15 = 3;
    v28[1] = v7 ^ 0x20;
    uint64_t v16 = 4;
    if ((v8 - 125) > 1) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  int v15 = 2;
  v28[0] = v7;
  uint64_t v16 = 3;
  if ((v8 - 125) <= 1)
  {
LABEL_9:
    v28[v16 - 2] = 125;
    LOBYTE(v8) = v8 ^ 0x20;
    LODWORD(v16) = v15 + 2;
  }
LABEL_10:
  char v17 = a3;
  char v18 = &v28[v16 - 2];
  *char v18 = v8;
  v18[1] = 111;
  uint64_t v19 = v16 + 2;
  if ((v10 - 125) <= 1)
  {
    v28[v19 - 2] = 125;
    LOBYTE(v10) = v10 ^ 0x20;
    LODWORD(v19) = v16 + 3;
  }
  v28[v19 - 2] = v10;
  uint64_t v20 = v19 + 1;
  if (a3 - 125 <= 1)
  {
    v28[v20 - 2] = 125;
    LODWORD(v20) = v19 + 2;
    char v17 = a3 ^ 0x20;
  }
  int v21 = ~(v13 ^ BYTE1(v12));
  v28[v20 - 2] = v17;
  uint64_t v22 = v20 + 1;
  int v23 = a1[7];
  if ((v23 - 125) <= 1)
  {
    v28[v22 - 2] = 125;
    LOBYTE(v23) = v23 ^ 0x20;
    LODWORD(v22) = v20 + 2;
  }
  char v24 = (unsigned __int16)(v13 ^ ~(unsigned __int16)(v12 >> 8)) >> 8;
  v28[v22 - 2] = v23;
  uint64_t v25 = v22 + 1;
  if ((v21 - 125) <= 1)
  {
    v28[v25 - 2] = 125;
    LODWORD(v25) = v22 + 2;
    LOBYTE(v21) = v21 ^ 0x20;
  }
  v28[v25 - 2] = v21;
  uint64_t v26 = v25 + 1;
  if (BYTE1(v14) - 125 <= 1)
  {
    v28[v26 - 2] = 125;
    char v24 = BYTE1(v14) ^ 0x20;
    LODWORD(v26) = v25 + 2;
  }
  v28[v26 - 2] = v24;
  memcpy(a1, &v27, v26 + 1);
  uint64_t result = (v26 + 2);
  a1[v26 + 1] = 126;
  return result;
}

uint64_t APPLIB_DIAG_FTM_GetLNAOffset(unsigned __int8 *a1, int a2, __int16 a3, __int16 a4)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x11)
  {
    bzero(a1, a2);
    *(_WORD *)a1 = 2891;
    int v9 = gModeId;
    a1[2] = gModeId;
    int v10 = HIBYTE(gModeId);
    a1[3] = HIBYTE(gModeId);
    a1[4] = 118;
    *((_WORD *)a1 + 3) = a3;
    char v11 = HIBYTE(a3);
    *((_WORD *)a1 + 4) = a4;
    char v12 = HIBYTE(a4);
    unsigned __int16 v13 = crc_16_l_table[crc_16_l_table[crc_16_l_table[v9 ^ 0xA5] ^ v10 ^ 0xEC] ^ HIBYTE(crc_16_l_table[v9 ^ 0xA5]) ^ 0x76];
    int v14 = a1[5];
    unsigned __int16 v15 = crc_16_l_table[(v14 ^ v13 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v9 ^ 0xA5] ^ v10 ^ 0xEC]))];
    unsigned __int16 v16 = crc_16_l_table[(v15 ^ HIBYTE(v13) ^ a3)];
    unsigned int v17 = crc_16_l_table[(HIBYTE(a3) ^ v16 ^ HIBYTE(v15))];
    unsigned int v18 = crc_16_l_table[(a4 ^ v17 ^ HIBYTE(v16))];
    int v19 = crc_16_l_table[HIBYTE(a4) ^ crc_16_l_table[(a4 ^ v17 ^ HIBYTE(v16))] ^ (v17 >> 8)];
    *((_WORD *)a1 + 5) = v19 ^ ~(unsigned __int16)(v18 >> 8);
    if (a2 >= 24)
    {
      char v38 = v19;
      int v39 = v19 ^ ~(v18 >> 8);
      bzero(__src, 0x800uLL);
      int v20 = *a1;
      if ((v20 - 125) > 1)
      {
        unsigned int v21 = 0;
      }
      else
      {
        __src[0] = 125;
        LOBYTE(v20) = v20 ^ 0x20;
        unsigned int v21 = 1;
      }
      __src[v21] = v20;
      uint64_t v22 = v21 + 1;
      int v23 = a1[1];
      if ((v23 - 125) <= 1)
      {
        __src[v22] = 125;
        LODWORD(v22) = v21 | 2;
        LOBYTE(v23) = v23 ^ 0x20;
      }
      __src[v22] = v23;
      uint64_t v24 = v22 + 1;
      if ((v9 - 125) <= 1)
      {
        __src[v24] = 125;
        LOBYTE(v9) = v9 ^ 0x20;
        LODWORD(v24) = v22 + 2;
      }
      __src[v24] = v9;
      uint64_t v25 = v24 + 1;
      if ((v10 - 125) <= 1)
      {
        __src[v25] = 125;
        LOBYTE(v10) = v10 ^ 0x20;
        LODWORD(v25) = v24 + 2;
      }
      char v26 = a3;
      __int16 v27 = &__src[v25];
      *__int16 v27 = v10;
      v27[1] = 118;
      uint64_t v28 = v25 + 2;
      if ((v14 - 125) <= 1)
      {
        __src[v28] = 125;
        LOBYTE(v14) = v14 ^ 0x20;
        LODWORD(v28) = v25 + 3;
      }
      __src[v28] = v14;
      uint64_t v29 = v28 + 1;
      if (a3 - 125 <= 1)
      {
        __src[v29] = 125;
        char v26 = a3 ^ 0x20;
        LODWORD(v29) = v28 + 2;
      }
      char v30 = a4;
      __src[v29] = v26;
      uint64_t v31 = v29 + 1;
      if (HIBYTE(a3) - 125 <= 1)
      {
        __src[v31] = 125;
        LODWORD(v31) = v29 + 2;
        char v11 = HIBYTE(a3) ^ 0x20;
      }
      __src[v31] = v11;
      uint64_t v32 = v31 + 1;
      if (a4 - 125 <= 1)
      {
        __src[v32] = 125;
        char v30 = a4 ^ 0x20;
        LODWORD(v32) = v31 + 2;
      }
      int v33 = ~(v38 ^ BYTE1(v18));
      __src[v32] = v30;
      uint64_t v34 = v32 + 1;
      if (HIBYTE(a4) - 125 <= 1)
      {
        __src[v34] = 125;
        char v12 = HIBYTE(a4) ^ 0x20;
        LODWORD(v34) = v32 + 2;
      }
      char v35 = BYTE1(v39);
      __src[v34] = v12;
      uint64_t v36 = v34 + 1;
      if ((v33 - 125) <= 1)
      {
        __src[v36] = 125;
        LODWORD(v36) = v34 + 2;
        LOBYTE(v33) = v33 ^ 0x20;
      }
      __src[v36] = v33;
      uint64_t v37 = v36 + 1;
      if (BYTE1(v39) - 125 <= 1)
      {
        __src[v37] = 125;
        char v35 = BYTE1(v39) ^ 0x20;
        LODWORD(v37) = v36 + 2;
      }
      __src[v37] = v35;
      memcpy(a1, __src, v37 + 1);
      uint64_t result = (v37 + 2);
      a1[v37 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_SetLNAOffset(unsigned __int8 *a1, int a2, __int16 a3, __int16 a4)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x11)
  {
    bzero(a1, a2);
    *(_WORD *)a1 = 2891;
    int v9 = gModeId;
    a1[2] = gModeId;
    int v10 = HIBYTE(gModeId);
    a1[3] = HIBYTE(gModeId);
    a1[4] = 81;
    *((_WORD *)a1 + 3) = a3;
    char v11 = HIBYTE(a3);
    *((_WORD *)a1 + 4) = a4;
    char v12 = HIBYTE(a4);
    unsigned __int16 v13 = crc_16_l_table[crc_16_l_table[crc_16_l_table[v9 ^ 0xA5] ^ v10 ^ 0xEC] ^ HIBYTE(crc_16_l_table[v9 ^ 0xA5]) ^ 0x51];
    int v14 = a1[5];
    unsigned __int16 v15 = crc_16_l_table[(v14 ^ v13 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v9 ^ 0xA5] ^ v10 ^ 0xEC]))];
    unsigned __int16 v16 = crc_16_l_table[(v15 ^ HIBYTE(v13) ^ a3)];
    unsigned int v17 = crc_16_l_table[(HIBYTE(a3) ^ v16 ^ HIBYTE(v15))];
    unsigned int v18 = crc_16_l_table[(a4 ^ v17 ^ HIBYTE(v16))];
    int v19 = crc_16_l_table[HIBYTE(a4) ^ crc_16_l_table[(a4 ^ v17 ^ HIBYTE(v16))] ^ (v17 >> 8)];
    *((_WORD *)a1 + 5) = v19 ^ ~(unsigned __int16)(v18 >> 8);
    if (a2 >= 24)
    {
      char v38 = v19;
      int v39 = v19 ^ ~(v18 >> 8);
      bzero(__src, 0x800uLL);
      int v20 = *a1;
      if ((v20 - 125) > 1)
      {
        unsigned int v21 = 0;
      }
      else
      {
        __src[0] = 125;
        LOBYTE(v20) = v20 ^ 0x20;
        unsigned int v21 = 1;
      }
      __src[v21] = v20;
      uint64_t v22 = v21 + 1;
      int v23 = a1[1];
      if ((v23 - 125) <= 1)
      {
        __src[v22] = 125;
        LODWORD(v22) = v21 | 2;
        LOBYTE(v23) = v23 ^ 0x20;
      }
      __src[v22] = v23;
      uint64_t v24 = v22 + 1;
      if ((v9 - 125) <= 1)
      {
        __src[v24] = 125;
        LOBYTE(v9) = v9 ^ 0x20;
        LODWORD(v24) = v22 + 2;
      }
      __src[v24] = v9;
      uint64_t v25 = v24 + 1;
      if ((v10 - 125) <= 1)
      {
        __src[v25] = 125;
        LOBYTE(v10) = v10 ^ 0x20;
        LODWORD(v25) = v24 + 2;
      }
      char v26 = a3;
      __int16 v27 = &__src[v25];
      *__int16 v27 = v10;
      v27[1] = 81;
      uint64_t v28 = v25 + 2;
      if ((v14 - 125) <= 1)
      {
        __src[v28] = 125;
        LOBYTE(v14) = v14 ^ 0x20;
        LODWORD(v28) = v25 + 3;
      }
      __src[v28] = v14;
      uint64_t v29 = v28 + 1;
      if (a3 - 125 <= 1)
      {
        __src[v29] = 125;
        char v26 = a3 ^ 0x20;
        LODWORD(v29) = v28 + 2;
      }
      char v30 = a4;
      __src[v29] = v26;
      uint64_t v31 = v29 + 1;
      if (HIBYTE(a3) - 125 <= 1)
      {
        __src[v31] = 125;
        LODWORD(v31) = v29 + 2;
        char v11 = HIBYTE(a3) ^ 0x20;
      }
      __src[v31] = v11;
      uint64_t v32 = v31 + 1;
      if (a4 - 125 <= 1)
      {
        __src[v32] = 125;
        char v30 = a4 ^ 0x20;
        LODWORD(v32) = v31 + 2;
      }
      int v33 = ~(v38 ^ BYTE1(v18));
      __src[v32] = v30;
      uint64_t v34 = v32 + 1;
      if (HIBYTE(a4) - 125 <= 1)
      {
        __src[v34] = 125;
        char v12 = HIBYTE(a4) ^ 0x20;
        LODWORD(v34) = v32 + 2;
      }
      char v35 = BYTE1(v39);
      __src[v34] = v12;
      uint64_t v36 = v34 + 1;
      if ((v33 - 125) <= 1)
      {
        __src[v36] = 125;
        LODWORD(v36) = v34 + 2;
        LOBYTE(v33) = v33 ^ 0x20;
      }
      __src[v36] = v33;
      uint64_t v37 = v36 + 1;
      if (BYTE1(v39) - 125 <= 1)
      {
        __src[v37] = 125;
        char v35 = BYTE1(v39) ^ 0x20;
        LODWORD(v37) = v36 + 2;
      }
      __src[v37] = v35;
      memcpy(a1, __src, v37 + 1);
      uint64_t result = (v37 + 2);
      a1[v37 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_SetgModeId(unsigned int a1)
{
  if (a1 > 0x8002) {
    return 0xFFFFFFFFLL;
  }
  gModeId = a1;
  return 1;
}

uint64_t APPLIB_DIAG_FTM_SetCalibrationState(_WORD *a1, int a2)
{
  return APPLIB_DIAG_ModeChange(a1, a2, 3u);
}

uint64_t APPLIB_DIAG_FTM_CDMA_API2_CALIBRATE_DVGA(char *a1, int a2, int a3, __int16 a4)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x14)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 1182539;
    a1[4] = 1;
    a1[10] = a3;
    *(_WORD *)(a1 + 11) = a4;
    char v9 = HIBYTE(a4);
    uint64_t v10 = a1[5];
    unsigned __int16 v11 = crc_16_l_table[v10 ^ 0xF7];
    int v12 = a1[6];
    unsigned __int16 v13 = crc_16_l_table[(v12 ^ v11) ^ 0x57];
    unsigned __int16 v14 = crc_16_l_table[(a1[7] ^ v13 ^ HIBYTE(v11))];
    unsigned __int16 v15 = crc_16_l_table[(a1[8] ^ v14 ^ HIBYTE(v13))];
    unsigned __int16 v16 = crc_16_l_table[(a1[9] ^ v15 ^ HIBYTE(v14))];
    unsigned int v17 = crc_16_l_table[(a3 ^ v16 ^ HIBYTE(v15))];
    unsigned int v18 = crc_16_l_table[(a4 ^ v17 ^ HIBYTE(v16))];
    int v19 = crc_16_l_table[HIBYTE(a4) ^ crc_16_l_table[(a4 ^ v17 ^ HIBYTE(v16))] ^ (v17 >> 8)];
    int v20 = v19 ^ ~(v18 >> 8);
    *(_WORD *)(a1 + 13) = v19 ^ ~HIBYTE(crc_16_l_table[(a4 ^ v17 ^ HIBYTE(v16))]);
    if (a2 >= 30)
    {
      bzero(v40, 0x800uLL);
      int v21 = *a1;
      if ((v21 - 125) > 1)
      {
        unsigned int v22 = 0;
      }
      else
      {
        v40[0] = 125;
        LOBYTE(v21) = v21 ^ 0x20;
        unsigned int v22 = 1;
      }
      int v23 = &v40[v22];
      *int v23 = v21;
      *(_DWORD *)(v23 + 1) = 16781835;
      uint64_t v24 = v22 + 5;
      if ((v10 - 125) <= 1)
      {
        v40[v24] = 125;
        LODWORD(v24) = v22 | 6;
        LOBYTE(v10) = v10 ^ 0x20;
      }
      v40[v24] = v10;
      uint64_t v25 = v24 + 1;
      if ((v12 - 125) <= 1)
      {
        v40[v25] = 125;
        LOBYTE(v12) = v12 ^ 0x20;
        LODWORD(v25) = v24 + 2;
      }
      v40[v25] = v12;
      uint64_t v26 = v25 + 1;
      int v27 = a1[7];
      if ((v27 - 125) <= 1)
      {
        v40[v26] = 125;
        LODWORD(v26) = v25 + 2;
        LOBYTE(v27) = v27 ^ 0x20;
      }
      v40[v26] = v27;
      uint64_t v28 = v26 + 1;
      int v29 = a1[8];
      if ((v29 - 125) <= 1)
      {
        v40[v28] = 125;
        LOBYTE(v29) = v29 ^ 0x20;
        LODWORD(v28) = v26 + 2;
      }
      v40[v28] = v29;
      uint64_t v30 = v28 + 1;
      int v31 = a1[9];
      if ((v31 - 125) <= 1)
      {
        v40[v30] = 125;
        LOBYTE(v31) = v31 ^ 0x20;
        LODWORD(v30) = v28 + 2;
      }
      char v32 = a4;
      v40[v30] = v31;
      uint64_t v33 = v30 + 1;
      if ((a3 - 125) <= 1)
      {
        v40[v33] = 125;
        LOBYTE(a3) = a3 ^ 0x20;
        LODWORD(v33) = v30 + 2;
      }
      v40[v33] = a3;
      uint64_t v34 = v33 + 1;
      if (a4 - 125 <= 1)
      {
        v40[v34] = 125;
        LODWORD(v34) = v33 + 2;
        char v32 = a4 ^ 0x20;
      }
      int v35 = ~(v19 ^ BYTE1(v18));
      v40[v34] = v32;
      uint64_t v36 = v34 + 1;
      if (HIBYTE(a4) - 125 <= 1)
      {
        v40[v36] = 125;
        char v9 = HIBYTE(a4) ^ 0x20;
        LODWORD(v36) = v34 + 2;
      }
      char v37 = (unsigned __int16)(v19 ^ ~(unsigned __int16)(v18 >> 8)) >> 8;
      v40[v36] = v9;
      uint64_t v38 = v36 + 1;
      if ((v35 - 125) <= 1)
      {
        v40[v38] = 125;
        LODWORD(v38) = v36 + 2;
        LOBYTE(v35) = v35 ^ 0x20;
      }
      v40[v38] = v35;
      uint64_t v39 = v38 + 1;
      if (BYTE1(v20) - 125 <= 1)
      {
        v40[v39] = 125;
        char v37 = BYTE1(v20) ^ 0x20;
        LODWORD(v39) = v38 + 2;
      }
      v40[v39] = v37;
      memcpy(a1, v40, v39 + 1);
      uint64_t result = (v39 + 2);
      a1[v39 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_CDMA_API2_CALIBRATE_LNA(unsigned __int8 *a1, int a2, unsigned __int8 a3, __int16 a4, unsigned __int8 a5)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x14)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 1182539;
    a1[4] = 2;
    a1[10] = a3;
    a1[11] = a5;
    *((_WORD *)a1 + 6) = a4;
    char v11 = HIBYTE(a4);
    uint64_t v12 = a1[5];
    unsigned __int16 v13 = crc_16_l_table[v12 ^ 0x6C];
    int v14 = a1[6];
    unsigned __int16 v15 = crc_16_l_table[(v14 ^ v13) ^ 0x65];
    unsigned __int16 v16 = crc_16_l_table[(a1[7] ^ v15 ^ HIBYTE(v13))];
    unsigned __int16 v17 = crc_16_l_table[(a1[8] ^ v16 ^ HIBYTE(v15))];
    unsigned __int16 v18 = crc_16_l_table[(a1[9] ^ v17 ^ HIBYTE(v16))];
    unsigned __int16 v19 = crc_16_l_table[(a3 ^ v18 ^ HIBYTE(v17))];
    unsigned int v20 = crc_16_l_table[(a5 ^ v19 ^ HIBYTE(v18))];
    unsigned int v21 = crc_16_l_table[(a4 ^ v20 ^ HIBYTE(v19))];
    int v22 = crc_16_l_table[HIBYTE(a4) ^ crc_16_l_table[(a4 ^ v20 ^ HIBYTE(v19))] ^ (v20 >> 8)];
    int v23 = v22 ^ ~(v21 >> 8);
    *((_WORD *)a1 + 7) = v22 ^ ~HIBYTE(crc_16_l_table[(a4 ^ v20 ^ HIBYTE(v19))]);
    if (a2 >= 32)
    {
      bzero(__src, 0x800uLL);
      int v24 = *a1;
      if ((v24 - 125) > 1)
      {
        unsigned int v25 = 0;
      }
      else
      {
        __src[0] = 125;
        LOBYTE(v24) = v24 ^ 0x20;
        unsigned int v25 = 1;
      }
      __src[v25] = v24;
      uint64_t v26 = v25 + 1;
      int v27 = a1[1];
      if ((v27 - 125) <= 1)
      {
        __src[v26] = 125;
        LODWORD(v26) = v25 | 2;
        LOBYTE(v27) = v27 ^ 0x20;
      }
      __src[v26] = v27;
      uint64_t v28 = v26 + 1;
      int v29 = a1[2];
      if ((v29 - 125) <= 1)
      {
        __src[v28] = 125;
        LOBYTE(v29) = v29 ^ 0x20;
        LODWORD(v28) = v26 + 2;
      }
      __src[v28] = v29;
      uint64_t v30 = v28 + 1;
      int v31 = a1[3];
      if ((v31 - 125) <= 1)
      {
        __src[v30] = 125;
        LODWORD(v30) = v28 + 2;
        LOBYTE(v31) = v31 ^ 0x20;
      }
      __src[v30] = v31;
      uint64_t v32 = v30 + 1;
      int v33 = a1[4];
      if ((v33 - 125) <= 1)
      {
        __src[v32] = 125;
        LOBYTE(v33) = v33 ^ 0x20;
        LODWORD(v32) = v30 + 2;
      }
      __src[v32] = v33;
      uint64_t v34 = v32 + 1;
      if ((v12 - 125) <= 1)
      {
        __src[v34] = 125;
        LODWORD(v34) = v32 + 2;
        LOBYTE(v12) = v12 ^ 0x20;
      }
      __src[v34] = v12;
      uint64_t v35 = v34 + 1;
      if ((v14 - 125) <= 1)
      {
        __src[v35] = 125;
        LOBYTE(v14) = v14 ^ 0x20;
        LODWORD(v35) = v34 + 2;
      }
      __src[v35] = v14;
      uint64_t v36 = v35 + 1;
      int v37 = a1[7];
      if ((v37 - 125) <= 1)
      {
        __src[v36] = 125;
        LODWORD(v36) = v35 + 2;
        LOBYTE(v37) = v37 ^ 0x20;
      }
      __src[v36] = v37;
      uint64_t v38 = v36 + 1;
      int v39 = a1[8];
      if ((v39 - 125) <= 1)
      {
        __src[v38] = 125;
        LOBYTE(v39) = v39 ^ 0x20;
        LODWORD(v38) = v36 + 2;
      }
      __src[v38] = v39;
      uint64_t v40 = v38 + 1;
      int v41 = a1[9];
      if ((v41 - 125) <= 1)
      {
        __src[v40] = 125;
        LODWORD(v40) = v38 + 2;
        LOBYTE(v41) = v41 ^ 0x20;
      }
      __src[v40] = v41;
      uint64_t v42 = v40 + 1;
      int v43 = a1[10];
      if ((v43 - 125) <= 1)
      {
        __src[v42] = 125;
        LOBYTE(v43) = v43 ^ 0x20;
        LODWORD(v42) = v40 + 2;
      }
      char v44 = a4;
      __src[v42] = v43;
      uint64_t v45 = v42 + 1;
      int v46 = a1[11];
      if ((v46 - 125) <= 1)
      {
        __src[v45] = 125;
        LODWORD(v45) = v42 + 2;
        LOBYTE(v46) = v46 ^ 0x20;
      }
      __src[v45] = v46;
      uint64_t v47 = v45 + 1;
      if (a4 - 125 <= 1)
      {
        __src[v47] = 125;
        char v44 = a4 ^ 0x20;
        LODWORD(v47) = v45 + 2;
      }
      int v48 = ~(v22 ^ BYTE1(v21));
      __src[v47] = v44;
      uint64_t v49 = v47 + 1;
      if (HIBYTE(a4) - 125 <= 1)
      {
        __src[v49] = 125;
        char v11 = HIBYTE(a4) ^ 0x20;
        LODWORD(v49) = v47 + 2;
      }
      char v50 = (unsigned __int16)(v22 ^ ~(unsigned __int16)(v21 >> 8)) >> 8;
      __src[v49] = v11;
      uint64_t v51 = v49 + 1;
      if ((v48 - 125) <= 1)
      {
        __src[v51] = 125;
        LOBYTE(v48) = v48 ^ 0x20;
        LODWORD(v51) = v49 + 2;
      }
      __src[v51] = v48;
      uint64_t v52 = v51 + 1;
      if (BYTE1(v23) - 125 <= 1)
      {
        __src[v52] = 125;
        char v50 = BYTE1(v23) ^ 0x20;
        LODWORD(v52) = v51 + 2;
      }
      __src[v52] = v50;
      memcpy(a1, __src, v52 + 1);
      uint64_t result = (v52 + 2);
      a1[v52 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_SecondChainTestCall(unsigned __int8 *a1, int a2, unsigned __int8 a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0xE) {
    return result;
  }
  bzero(a1, a2);
  *(_WORD *)a1 = 2891;
  int v7 = gModeId;
  a1[2] = gModeId;
  int v8 = HIBYTE(gModeId);
  a1[3] = HIBYTE(gModeId);
  a1[4] = 123;
  a1[6] = a3;
  unsigned __int16 v9 = crc_16_l_table[crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC] ^ HIBYTE(crc_16_l_table[v7 ^ 0xA5]) ^ 0x7B];
  int v10 = a1[5];
  uint64_t v11 = (v10 ^ v9 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC]));
  unsigned int v12 = crc_16_l_table[v11];
  int v13 = crc_16_l_table[(v12 ^ HIBYTE(v9) ^ a3)];
  int v14 = v13 ^ ~(v12 >> 8);
  *(_WORD *)(a1 + 7) = v13 ^ ~HIBYTE(crc_16_l_table[v11]);
  if (a2 < 18) {
    return 0xFFFFFFFFLL;
  }
  bzero(v26, 0x7FEuLL);
  __int16 v25 = 2891;
  if ((v7 - 125) <= 1)
  {
    v26[0] = 125;
    int v15 = 3;
    v26[1] = v7 ^ 0x20;
    uint64_t v16 = 4;
    if ((v8 - 125) > 1) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  int v15 = 2;
  v26[0] = v7;
  uint64_t v16 = 3;
  if ((v8 - 125) <= 1)
  {
LABEL_9:
    v26[v16 - 2] = 125;
    LOBYTE(v8) = v8 ^ 0x20;
    LODWORD(v16) = v15 + 2;
  }
LABEL_10:
  char v17 = a3;
  unsigned __int16 v18 = &v26[v16 - 2];
  *unsigned __int16 v18 = v8;
  v18[1] = 123;
  uint64_t v19 = v16 + 2;
  if ((v10 - 125) <= 1)
  {
    v26[v19 - 2] = 125;
    LOBYTE(v10) = v10 ^ 0x20;
    LODWORD(v19) = v16 + 3;
  }
  int v20 = ~(v13 ^ BYTE1(v12));
  v26[v19 - 2] = v10;
  uint64_t v21 = v19 + 1;
  if (a3 - 125 <= 1)
  {
    v26[v21 - 2] = 125;
    char v17 = a3 ^ 0x20;
    LODWORD(v21) = v19 + 2;
  }
  char v22 = (unsigned __int16)(v13 ^ ~(unsigned __int16)(v12 >> 8)) >> 8;
  v26[v21 - 2] = v17;
  uint64_t v23 = v21 + 1;
  if ((v20 - 125) <= 1)
  {
    v26[v23 - 2] = 125;
    LODWORD(v23) = v21 + 2;
    LOBYTE(v20) = v20 ^ 0x20;
  }
  v26[v23 - 2] = v20;
  uint64_t v24 = v23 + 1;
  if (BYTE1(v14) - 125 <= 1)
  {
    v26[v24 - 2] = 125;
    char v22 = BYTE1(v14) ^ 0x20;
    LODWORD(v24) = v23 + 2;
  }
  v26[v24 - 2] = v22;
  memcpy(a1, &v25, v24 + 1);
  uint64_t result = (v24 + 2);
  a1[v24 + 1] = 126;
  return result;
}

uint64_t APPLIB_DIAG_FTM_SetSecondaryChain(unsigned __int8 *a1, int a2, unsigned __int8 a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0xE) {
    return result;
  }
  bzero(a1, a2);
  *(_WORD *)a1 = 2891;
  int v7 = gModeId;
  a1[2] = gModeId;
  int v8 = HIBYTE(gModeId);
  a1[3] = HIBYTE(gModeId);
  a1[4] = 121;
  a1[6] = a3;
  unsigned __int16 v9 = crc_16_l_table[crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC] ^ HIBYTE(crc_16_l_table[v7 ^ 0xA5]) ^ 0x79];
  int v10 = a1[5];
  uint64_t v11 = (v10 ^ v9 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC]));
  unsigned int v12 = crc_16_l_table[v11];
  int v13 = crc_16_l_table[(v12 ^ HIBYTE(v9) ^ a3)];
  int v14 = v13 ^ ~(v12 >> 8);
  *(_WORD *)(a1 + 7) = v13 ^ ~HIBYTE(crc_16_l_table[v11]);
  if (a2 < 18) {
    return 0xFFFFFFFFLL;
  }
  bzero(v26, 0x7FEuLL);
  __int16 v25 = 2891;
  if ((v7 - 125) <= 1)
  {
    v26[0] = 125;
    int v15 = 3;
    v26[1] = v7 ^ 0x20;
    uint64_t v16 = 4;
    if ((v8 - 125) > 1) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  int v15 = 2;
  v26[0] = v7;
  uint64_t v16 = 3;
  if ((v8 - 125) <= 1)
  {
LABEL_9:
    v26[v16 - 2] = 125;
    LOBYTE(v8) = v8 ^ 0x20;
    LODWORD(v16) = v15 + 2;
  }
LABEL_10:
  char v17 = a3;
  unsigned __int16 v18 = &v26[v16 - 2];
  *unsigned __int16 v18 = v8;
  v18[1] = 121;
  uint64_t v19 = v16 + 2;
  if ((v10 - 125) <= 1)
  {
    v26[v19 - 2] = 125;
    LOBYTE(v10) = v10 ^ 0x20;
    LODWORD(v19) = v16 + 3;
  }
  int v20 = ~(v13 ^ BYTE1(v12));
  v26[v19 - 2] = v10;
  uint64_t v21 = v19 + 1;
  if (a3 - 125 <= 1)
  {
    v26[v21 - 2] = 125;
    char v17 = a3 ^ 0x20;
    LODWORD(v21) = v19 + 2;
  }
  char v22 = (unsigned __int16)(v13 ^ ~(unsigned __int16)(v12 >> 8)) >> 8;
  v26[v21 - 2] = v17;
  uint64_t v23 = v21 + 1;
  if ((v20 - 125) <= 1)
  {
    v26[v23 - 2] = 125;
    LODWORD(v23) = v21 + 2;
    LOBYTE(v20) = v20 ^ 0x20;
  }
  v26[v23 - 2] = v20;
  uint64_t v24 = v23 + 1;
  if (BYTE1(v14) - 125 <= 1)
  {
    v26[v24 - 2] = 125;
    char v22 = BYTE1(v14) ^ 0x20;
    LODWORD(v24) = v23 + 2;
  }
  v26[v24 - 2] = v22;
  memcpy(a1, &v25, v24 + 1);
  uint64_t result = (v24 + 2);
  a1[v24 + 1] = 126;
  return result;
}

uint64_t APPLIB_DIAG_FTM_ChangeFTM_BootMode(char *a1, int a2, char a3)
{
  char __src = a3;
  return APPLIB_DIAG_NvItemWrite(a1, a2, 453, &__src, 1);
}

uint64_t APPLIB_DIAG_FTM_CDMA_API2_CALIBRATE_IM2(unsigned __int8 *a1, int a2, int a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0x14) {
    return result;
  }
  bzero(a1, a2);
  *(_DWORD *)a1 = 1182539;
  a1[4] = 3;
  a1[10] = a3;
  uint64_t v7 = a1[5];
  unsigned __int16 v8 = crc_16_l_table[v7 ^ 0xE5];
  int v9 = a1[6];
  unsigned __int16 v10 = crc_16_l_table[(v9 ^ v8) ^ 0x74];
  unsigned __int16 v11 = crc_16_l_table[(a1[7] ^ v10 ^ HIBYTE(v8))];
  unsigned __int16 v12 = crc_16_l_table[(a1[8] ^ v11 ^ HIBYTE(v10))];
  unsigned int v13 = crc_16_l_table[(a1[9] ^ v12 ^ HIBYTE(v11))];
  int v14 = crc_16_l_table[(v13 ^ HIBYTE(v12)) ^ a3];
  int v15 = v14 ^ ~(v13 >> 8);
  *((_WORD *)a1 + 6) = v14 ^ ~HIBYTE(crc_16_l_table[(a1[9] ^ v12 ^ HIBYTE(v11))]);
  if (a2 < 28) {
    return 0xFFFFFFFFLL;
  }
  bzero(v33, 0x7FBuLL);
  int __src = 1182539;
  char v32 = 3;
  if ((v7 - 125) <= 1)
  {
    v33[0] = 125;
    int v16 = 6;
    v33[1] = v7 ^ 0x20;
    uint64_t v17 = 7;
    if ((v9 - 125) > 1) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  int v16 = 5;
  v33[0] = v7;
  uint64_t v17 = 6;
  if ((v9 - 125) <= 1)
  {
LABEL_9:
    *((unsigned char *)&__src + v17) = 125;
    LODWORD(v17) = v16 + 2;
    LOBYTE(v9) = v9 ^ 0x20;
  }
LABEL_10:
  *((unsigned char *)&__src + v17) = v9;
  uint64_t v18 = v17 + 1;
  int v19 = a1[7];
  if ((v19 - 125) <= 1)
  {
    *((unsigned char *)&__src + v18) = 125;
    LOBYTE(v19) = v19 ^ 0x20;
    LODWORD(v18) = v17 + 2;
  }
  *((unsigned char *)&__src + v18) = v19;
  uint64_t v20 = v18 + 1;
  int v21 = a1[8];
  if ((v21 - 125) <= 1)
  {
    *((unsigned char *)&__src + v20) = 125;
    LODWORD(v20) = v18 + 2;
    LOBYTE(v21) = v21 ^ 0x20;
  }
  *((unsigned char *)&__src + v20) = v21;
  uint64_t v22 = v20 + 1;
  int v23 = a1[9];
  if ((v23 - 125) <= 1)
  {
    *((unsigned char *)&__src + v22) = 125;
    LODWORD(v22) = v20 + 2;
    LOBYTE(v23) = v23 ^ 0x20;
  }
  *((unsigned char *)&__src + v22) = v23;
  uint64_t v24 = v22 + 1;
  if ((a3 - 125) <= 1)
  {
    *((unsigned char *)&__src + v24) = 125;
    LOBYTE(a3) = a3 ^ 0x20;
    LODWORD(v24) = v22 + 2;
  }
  int v25 = ~(v14 ^ BYTE1(v13));
  *((unsigned char *)&__src + v24) = a3;
  uint64_t v26 = v24 + 1;
  int v27 = a1[11];
  if ((v27 - 125) <= 1)
  {
    *((unsigned char *)&__src + v26) = 125;
    LOBYTE(v27) = v27 ^ 0x20;
    LODWORD(v26) = v24 + 2;
  }
  char v28 = (unsigned __int16)(v14 ^ ~(unsigned __int16)(v13 >> 8)) >> 8;
  *((unsigned char *)&__src + v26) = v27;
  uint64_t v29 = v26 + 1;
  if ((v25 - 125) <= 1)
  {
    *((unsigned char *)&__src + v29) = 125;
    LOBYTE(v25) = v25 ^ 0x20;
    LODWORD(v29) = v26 + 2;
  }
  *((unsigned char *)&__src + v29) = v25;
  uint64_t v30 = v29 + 1;
  if (BYTE1(v15) - 125 <= 1)
  {
    *((unsigned char *)&__src + v30) = 125;
    char v28 = BYTE1(v15) ^ 0x20;
    LODWORD(v30) = v29 + 2;
  }
  *((unsigned char *)&__src + v30) = v28;
  memcpy(a1, &__src, v30 + 1);
  uint64_t result = (v30 + 2);
  a1[v30 + 1] = 126;
  return result;
}

uint64_t APPLIB_DIAG_FTM_CDMA_API2_CALIBRATE_INTELLICEIVER(char *a1, int a2, int a3, __int16 a4)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x14)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 1182539;
    a1[4] = 4;
    a1[10] = a3;
    *(_WORD *)(a1 + 11) = a4;
    char v9 = HIBYTE(a4);
    uint64_t v10 = a1[5];
    unsigned __int16 v11 = crc_16_l_table[v10 ^ 0x5A];
    int v12 = a1[6];
    unsigned __int16 v13 = crc_16_l_table[(v12 ^ v11)];
    unsigned __int16 v14 = crc_16_l_table[(a1[7] ^ v13 ^ HIBYTE(v11))];
    unsigned __int16 v15 = crc_16_l_table[(a1[8] ^ v14 ^ HIBYTE(v13))];
    unsigned __int16 v16 = crc_16_l_table[(a1[9] ^ v15 ^ HIBYTE(v14))];
    unsigned int v17 = crc_16_l_table[(a3 ^ v16 ^ HIBYTE(v15))];
    unsigned int v18 = crc_16_l_table[(a4 ^ v17 ^ HIBYTE(v16))];
    int v19 = crc_16_l_table[HIBYTE(a4) ^ crc_16_l_table[(a4 ^ v17 ^ HIBYTE(v16))] ^ (v17 >> 8)];
    int v20 = v19 ^ ~(v18 >> 8);
    *(_WORD *)(a1 + 13) = v19 ^ ~HIBYTE(crc_16_l_table[(a4 ^ v17 ^ HIBYTE(v16))]);
    if (a2 >= 30)
    {
      bzero(v40, 0x800uLL);
      int v21 = *a1;
      if ((v21 - 125) > 1)
      {
        unsigned int v22 = 0;
      }
      else
      {
        v40[0] = 125;
        LOBYTE(v21) = v21 ^ 0x20;
        unsigned int v22 = 1;
      }
      int v23 = &v40[v22];
      *int v23 = v21;
      *(_DWORD *)(v23 + 1) = 67113483;
      uint64_t v24 = v22 + 5;
      if ((v10 - 125) <= 1)
      {
        v40[v24] = 125;
        LODWORD(v24) = v22 | 6;
        LOBYTE(v10) = v10 ^ 0x20;
      }
      v40[v24] = v10;
      uint64_t v25 = v24 + 1;
      if ((v12 - 125) <= 1)
      {
        v40[v25] = 125;
        LOBYTE(v12) = v12 ^ 0x20;
        LODWORD(v25) = v24 + 2;
      }
      v40[v25] = v12;
      uint64_t v26 = v25 + 1;
      int v27 = a1[7];
      if ((v27 - 125) <= 1)
      {
        v40[v26] = 125;
        LODWORD(v26) = v25 + 2;
        LOBYTE(v27) = v27 ^ 0x20;
      }
      v40[v26] = v27;
      uint64_t v28 = v26 + 1;
      int v29 = a1[8];
      if ((v29 - 125) <= 1)
      {
        v40[v28] = 125;
        LOBYTE(v29) = v29 ^ 0x20;
        LODWORD(v28) = v26 + 2;
      }
      v40[v28] = v29;
      uint64_t v30 = v28 + 1;
      int v31 = a1[9];
      if ((v31 - 125) <= 1)
      {
        v40[v30] = 125;
        LOBYTE(v31) = v31 ^ 0x20;
        LODWORD(v30) = v28 + 2;
      }
      char v32 = a4;
      v40[v30] = v31;
      uint64_t v33 = v30 + 1;
      if ((a3 - 125) <= 1)
      {
        v40[v33] = 125;
        LOBYTE(a3) = a3 ^ 0x20;
        LODWORD(v33) = v30 + 2;
      }
      v40[v33] = a3;
      uint64_t v34 = v33 + 1;
      if (a4 - 125 <= 1)
      {
        v40[v34] = 125;
        LODWORD(v34) = v33 + 2;
        char v32 = a4 ^ 0x20;
      }
      int v35 = ~(v19 ^ BYTE1(v18));
      v40[v34] = v32;
      uint64_t v36 = v34 + 1;
      if (HIBYTE(a4) - 125 <= 1)
      {
        v40[v36] = 125;
        char v9 = HIBYTE(a4) ^ 0x20;
        LODWORD(v36) = v34 + 2;
      }
      char v37 = (unsigned __int16)(v19 ^ ~(unsigned __int16)(v18 >> 8)) >> 8;
      v40[v36] = v9;
      uint64_t v38 = v36 + 1;
      if ((v35 - 125) <= 1)
      {
        v40[v38] = 125;
        LODWORD(v38) = v36 + 2;
        LOBYTE(v35) = v35 ^ 0x20;
      }
      v40[v38] = v35;
      uint64_t v39 = v38 + 1;
      if (BYTE1(v20) - 125 <= 1)
      {
        v40[v39] = 125;
        char v37 = BYTE1(v20) ^ 0x20;
        LODWORD(v39) = v38 + 2;
      }
      v40[v39] = v37;
      memcpy(a1, v40, v39 + 1);
      uint64_t result = (v39 + 2);
      a1[v39 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_DO_ENH_XO_DC_CAL(char *a1, int a2, long long *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x33)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 1313611;
    a1[4] = -102;
    a1[8] = 12;
    long long v7 = *a3;
    long long v8 = a3[1];
    *(_OWORD *)(a1 + 40) = *(long long *)((char *)a3 + 30);
    *(_OWORD *)(a1 + 26) = v8;
    *(_OWORD *)(a1 + 10) = v7;
    int v9 = 448;
    LOWORD(v10) = -1;
    unsigned __int16 v11 = a1;
    do
    {
      char v12 = *v11++;
      int v10 = crc_16_l_table[(v12 ^ v10)] ^ ((unsigned __int16)(v10 & 0xFF00) >> 8);
      v9 -= 8;
    }
    while ((_WORD)v9);
    *((_WORD *)a1 + 28) = ~(_WORD)v10;
    if (a2 >= 116)
    {
      bzero(__src, 0x800uLL);
      uint64_t v13 = 0;
      LODWORD(v14) = 0;
      do
      {
        while (1)
        {
          int v16 = a1[v13];
          if ((v16 - 125) > 1) {
            break;
          }
          int v15 = v14 + 1;
          __src[(int)v14] = 125;
          __src[(int)v14 + 1] = v16 ^ 0x20;
          size_t v14 = (int)v14 + 1 + 1;
          if (++v13 == 58) {
            goto LABEL_11;
          }
        }
        int v15 = v14;
        __src[(int)v14] = v16;
        size_t v14 = (int)v14 + 1;
        ++v13;
      }
      while (v13 != 58);
LABEL_11:
      memcpy(a1, __src, v14);
      uint64_t result = (v15 + 2);
      a1[v14] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_DO_ENH_XO_FT_CURVE_CAL(char *a1, int a2, long long *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x33)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 1313611;
    a1[4] = -101;
    a1[8] = 12;
    long long v7 = *a3;
    long long v8 = a3[1];
    *(_OWORD *)(a1 + 40) = *(long long *)((char *)a3 + 30);
    *(_OWORD *)(a1 + 26) = v8;
    *(_OWORD *)(a1 + 10) = v7;
    int v9 = 448;
    LOWORD(v10) = -1;
    unsigned __int16 v11 = a1;
    do
    {
      char v12 = *v11++;
      int v10 = crc_16_l_table[(v12 ^ v10)] ^ ((unsigned __int16)(v10 & 0xFF00) >> 8);
      v9 -= 8;
    }
    while ((_WORD)v9);
    *((_WORD *)a1 + 28) = ~(_WORD)v10;
    if (a2 >= 116)
    {
      bzero(__src, 0x800uLL);
      uint64_t v13 = 0;
      LODWORD(v14) = 0;
      do
      {
        while (1)
        {
          int v16 = a1[v13];
          if ((v16 - 125) > 1) {
            break;
          }
          int v15 = v14 + 1;
          __src[(int)v14] = 125;
          __src[(int)v14 + 1] = v16 ^ 0x20;
          size_t v14 = (int)v14 + 1 + 1;
          if (++v13 == 58) {
            goto LABEL_11;
          }
        }
        int v15 = v14;
        __src[(int)v14] = v16;
        size_t v14 = (int)v14 + 1;
        ++v13;
      }
      while (v13 != 58);
LABEL_11:
      memcpy(a1, __src, v14);
      uint64_t result = (v15 + 2);
      a1[v14] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_CDMA2000_PILOT_ACQ(char *a1, int a2, int a3, __int16 a4, int a5)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x1F)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 461643;
    *((_WORD *)a1 + 2) = 100;
    *(_DWORD *)(a1 + 10) = a3;
    *((_WORD *)a1 + 7) = a4;
    *((_DWORD *)a1 + 4) = a5;
    unsigned __int16 v11 = crc_16_l_table[a1[6] ^ 0x7CLL];
    unsigned __int16 v12 = crc_16_l_table[a1[7] ^ 0x35 ^ v11];
    unsigned __int16 v13 = crc_16_l_table[(a1[8] ^ v12 ^ HIBYTE(v11))];
    unsigned __int16 v14 = crc_16_l_table[(a1[9] ^ v13 ^ HIBYTE(v12))];
    unsigned __int16 v15 = crc_16_l_table[(a3 ^ v14 ^ HIBYTE(v13))];
    unsigned __int16 v16 = crc_16_l_table[(BYTE1(a3) ^ v15 ^ HIBYTE(v14))];
    unsigned __int16 v17 = crc_16_l_table[(BYTE2(a3) ^ v16 ^ HIBYTE(v15))];
    unsigned __int16 v18 = crc_16_l_table[(HIBYTE(a3) ^ v17 ^ HIBYTE(v16))];
    unsigned __int16 v19 = crc_16_l_table[(a4 ^ v18 ^ HIBYTE(v17))];
    unsigned __int16 v20 = crc_16_l_table[(HIBYTE(a4) ^ v19 ^ HIBYTE(v18))];
    unsigned __int16 v21 = crc_16_l_table[(v20 ^ HIBYTE(v19) ^ a5)];
    unsigned __int16 v22 = crc_16_l_table[(a1[17] ^ v21 ^ HIBYTE(v20))];
    unsigned int v23 = crc_16_l_table[(a1[18] ^ v22 ^ HIBYTE(v21))];
    unsigned __int16 v24 = crc_16_l_table[(a1[19] ^ v23 ^ HIBYTE(v22))];
    *((_WORD *)a1 + 10) = v24 ^ ~HIBYTE(crc_16_l_table[(a1[18] ^ v22 ^ HIBYTE(v21))]);
    if (a2 >= 44)
    {
      bzero(__src, 0x800uLL);
      int v25 = *a1;
      if ((v25 - 125) > 1)
      {
        unsigned int v26 = 0;
      }
      else
      {
        __src[0] = 125;
        LOBYTE(v25) = v25 ^ 0x20;
        unsigned int v26 = 1;
      }
      __src[v26] = v25;
      uint64_t v27 = v26 + 1;
      int v28 = a1[1];
      if ((v28 - 125) <= 1)
      {
        __src[v27] = 125;
        LODWORD(v27) = v26 | 2;
        LOBYTE(v28) = v28 ^ 0x20;
      }
      __src[v27] = v28;
      uint64_t v29 = v27 + 1;
      int v30 = a1[2];
      if ((v30 - 125) <= 1)
      {
        __src[v29] = 125;
        LOBYTE(v30) = v30 ^ 0x20;
        LODWORD(v29) = v27 + 2;
      }
      __src[v29] = v30;
      uint64_t v31 = v29 + 1;
      int v32 = a1[3];
      if ((v32 - 125) <= 1)
      {
        __src[v31] = 125;
        LODWORD(v31) = v29 + 2;
        LOBYTE(v32) = v32 ^ 0x20;
      }
      __src[v31] = v32;
      uint64_t v33 = v31 + 1;
      int v34 = a1[4];
      if ((v34 - 125) <= 1)
      {
        __src[v33] = 125;
        LOBYTE(v34) = v34 ^ 0x20;
        LODWORD(v33) = v31 + 2;
      }
      __src[v33] = v34;
      uint64_t v35 = v33 + 1;
      int v36 = a1[5];
      if ((v36 - 125) <= 1)
      {
        __src[v35] = 125;
        LODWORD(v35) = v33 + 2;
        LOBYTE(v36) = v36 ^ 0x20;
      }
      __src[v35] = v36;
      uint64_t v37 = v35 + 1;
      int v38 = a1[6];
      if ((v38 - 125) <= 1)
      {
        __src[v37] = 125;
        LOBYTE(v38) = v38 ^ 0x20;
        LODWORD(v37) = v35 + 2;
      }
      __src[v37] = v38;
      uint64_t v39 = v37 + 1;
      int v40 = a1[7];
      if ((v40 - 125) <= 1)
      {
        __src[v39] = 125;
        LODWORD(v39) = v37 + 2;
        LOBYTE(v40) = v40 ^ 0x20;
      }
      __src[v39] = v40;
      uint64_t v41 = v39 + 1;
      int v42 = a1[8];
      if ((v42 - 125) <= 1)
      {
        __src[v41] = 125;
        LOBYTE(v42) = v42 ^ 0x20;
        LODWORD(v41) = v39 + 2;
      }
      __src[v41] = v42;
      uint64_t v43 = v41 + 1;
      int v44 = a1[9];
      if ((v44 - 125) <= 1)
      {
        __src[v43] = 125;
        LODWORD(v43) = v41 + 2;
        LOBYTE(v44) = v44 ^ 0x20;
      }
      __src[v43] = v44;
      uint64_t v45 = v43 + 1;
      int v46 = a1[10];
      if ((v46 - 125) <= 1)
      {
        __src[v45] = 125;
        LOBYTE(v46) = v46 ^ 0x20;
        LODWORD(v45) = v43 + 2;
      }
      __src[v45] = v46;
      uint64_t v47 = v45 + 1;
      int v48 = a1[11];
      if ((v48 - 125) <= 1)
      {
        __src[v47] = 125;
        LODWORD(v47) = v45 + 2;
        LOBYTE(v48) = v48 ^ 0x20;
      }
      __src[v47] = v48;
      uint64_t v49 = v47 + 1;
      int v50 = a1[12];
      if ((v50 - 125) <= 1)
      {
        __src[v49] = 125;
        LOBYTE(v50) = v50 ^ 0x20;
        LODWORD(v49) = v47 + 2;
      }
      __src[v49] = v50;
      uint64_t v51 = v49 + 1;
      int v52 = a1[13];
      if ((v52 - 125) <= 1)
      {
        __src[v51] = 125;
        LODWORD(v51) = v49 + 2;
        LOBYTE(v52) = v52 ^ 0x20;
      }
      __src[v51] = v52;
      uint64_t v53 = v51 + 1;
      int v54 = a1[14];
      if ((v54 - 125) <= 1)
      {
        __src[v53] = 125;
        LOBYTE(v54) = v54 ^ 0x20;
        LODWORD(v53) = v51 + 2;
      }
      __src[v53] = v54;
      uint64_t v55 = v53 + 1;
      int v56 = a1[15];
      if ((v56 - 125) <= 1)
      {
        __src[v55] = 125;
        LODWORD(v55) = v53 + 2;
        LOBYTE(v56) = v56 ^ 0x20;
      }
      __src[v55] = v56;
      uint64_t v57 = v55 + 1;
      int v58 = a1[16];
      if ((v58 - 125) <= 1)
      {
        __src[v57] = 125;
        LOBYTE(v58) = v58 ^ 0x20;
        LODWORD(v57) = v55 + 2;
      }
      __src[v57] = v58;
      uint64_t v59 = v57 + 1;
      int v60 = a1[17];
      if ((v60 - 125) <= 1)
      {
        __src[v59] = 125;
        LODWORD(v59) = v57 + 2;
        LOBYTE(v60) = v60 ^ 0x20;
      }
      __src[v59] = v60;
      uint64_t v61 = v59 + 1;
      int v62 = a1[18];
      if ((v62 - 125) <= 1)
      {
        __src[v61] = 125;
        LOBYTE(v62) = v62 ^ 0x20;
        LODWORD(v61) = v59 + 2;
      }
      int v63 = ~(v24 ^ BYTE1(v23));
      __src[v61] = v62;
      uint64_t v64 = v61 + 1;
      int v65 = a1[19];
      if ((v65 - 125) <= 1)
      {
        __src[v64] = 125;
        LOBYTE(v65) = v65 ^ 0x20;
        LODWORD(v64) = v61 + 2;
      }
      int v66 = ((unsigned __int16)(v24 ^ ~(unsigned __int16)(v23 >> 8)) >> 8);
      __src[v64] = v65;
      uint64_t v67 = v64 + 1;
      if ((v63 - 125) <= 1)
      {
        __src[v67] = 125;
        LOBYTE(v63) = v63 ^ 0x20;
        LODWORD(v67) = v64 + 2;
      }
      __src[v67] = v63;
      uint64_t v68 = v67 + 1;
      if ((v66 - 125) <= 1)
      {
        __src[v68] = 125;
        LOBYTE(v66) = v66 ^ 0x20;
        LODWORD(v68) = v67 + 2;
      }
      __src[v68] = v66;
      memcpy(a1, __src, v68 + 1);
      uint64_t result = (v68 + 2);
      a1[v68 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_CDMA2000_DEMOD_SYNC(unsigned __int8 *a1, int a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0x15) {
    return result;
  }
  bzero(a1, a2);
  *(_DWORD *)a1 = 461643;
  a1[4] = 101;
  uint64_t v5 = a1[5];
  unsigned __int16 v6 = crc_16_l_table[v5 ^ 0xFD];
  int v7 = a1[6];
  unsigned __int16 v8 = crc_16_l_table[(v7 ^ v6) ^ 0xCE];
  unsigned __int16 v9 = crc_16_l_table[(a1[7] ^ v8 ^ HIBYTE(v6))];
  unsigned int v10 = crc_16_l_table[(a1[8] ^ v9 ^ HIBYTE(v8))];
  unsigned __int16 v11 = crc_16_l_table[(a1[9] ^ v10 ^ HIBYTE(v9))];
  *((_WORD *)a1 + 5) = v11 ^ ~HIBYTE(crc_16_l_table[(a1[8] ^ v9 ^ HIBYTE(v8))]);
  if (a2 < 24) {
    return 0xFFFFFFFFLL;
  }
  bzero(v26, 0x7FBuLL);
  int __src = 461643;
  char v25 = 101;
  if ((v5 - 125) <= 1)
  {
    v26[0] = 125;
    int v12 = 6;
    v26[1] = v5 ^ 0x20;
    uint64_t v13 = 7;
    if ((v7 - 125) > 1) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  int v12 = 5;
  v26[0] = v5;
  uint64_t v13 = 6;
  if ((v7 - 125) <= 1)
  {
LABEL_9:
    *((unsigned char *)&__src + v13) = 125;
    LOBYTE(v7) = v7 ^ 0x20;
    LODWORD(v13) = v12 + 2;
  }
LABEL_10:
  *((unsigned char *)&__src + v13) = v7;
  uint64_t v14 = v13 + 1;
  int v15 = a1[7];
  if ((v15 - 125) <= 1)
  {
    *((unsigned char *)&__src + v14) = 125;
    LODWORD(v14) = v13 + 2;
    LOBYTE(v15) = v15 ^ 0x20;
  }
  *((unsigned char *)&__src + v14) = v15;
  uint64_t v16 = v14 + 1;
  int v17 = a1[8];
  if ((v17 - 125) <= 1)
  {
    *((unsigned char *)&__src + v16) = 125;
    LOBYTE(v17) = v17 ^ 0x20;
    LODWORD(v16) = v14 + 2;
  }
  int v18 = ~(v11 ^ BYTE1(v10));
  *((unsigned char *)&__src + v16) = v17;
  uint64_t v19 = v16 + 1;
  int v20 = a1[9];
  if ((v20 - 125) <= 1)
  {
    *((unsigned char *)&__src + v19) = 125;
    LOBYTE(v20) = v20 ^ 0x20;
    LODWORD(v19) = v16 + 2;
  }
  int v21 = ((unsigned __int16)(v11 ^ ~(unsigned __int16)(v10 >> 8)) >> 8);
  *((unsigned char *)&__src + v19) = v20;
  uint64_t v22 = v19 + 1;
  if ((v18 - 125) <= 1)
  {
    *((unsigned char *)&__src + v22) = 125;
    LOBYTE(v18) = v18 ^ 0x20;
    LODWORD(v22) = v19 + 2;
  }
  *((unsigned char *)&__src + v22) = v18;
  uint64_t v23 = v22 + 1;
  if ((v21 - 125) <= 1)
  {
    *((unsigned char *)&__src + v23) = 125;
    LOBYTE(v21) = v21 ^ 0x20;
    LODWORD(v23) = v22 + 2;
  }
  *((unsigned char *)&__src + v23) = v21;
  memcpy(a1, &__src, v23 + 1);
  uint64_t result = (v23 + 2);
  a1[v23 + 1] = 126;
  return result;
}

uint64_t APPLIB_DIAG_FTM_CDMA2000_DEMOD_FCH(char *a1, int a2, int a3, char a4, char a5, char a6, char a7, char a8, char a9, uint64_t a10, char a11, char a12, char a13, char a14)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x1F)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 461643;
    *((_WORD *)a1 + 2) = 102;
    *(_DWORD *)(a1 + 10) = a3;
    a1[14] = a4;
    a1[15] = a5;
    a1[16] = a6;
    a1[17] = a7;
    a1[18] = a8;
    a1[19] = a9;
    *((_DWORD *)a1 + 5) = a10;
    a1[24] = a11;
    a1[25] = a12;
    a1[26] = a13;
    a1[27] = a14;
    unsigned __int16 v22 = crc_16_l_table[a1[6] ^ 0xCCLL];
    unsigned __int16 v23 = crc_16_l_table[(a1[7] ^ v22) ^ 6];
    unsigned __int16 v24 = crc_16_l_table[(a1[8] ^ v23 ^ HIBYTE(v22))];
    unsigned __int16 v25 = crc_16_l_table[(a1[9] ^ v24 ^ HIBYTE(v23))];
    unsigned __int16 v26 = crc_16_l_table[(a3 ^ v25 ^ HIBYTE(v24))];
    unsigned __int16 v27 = crc_16_l_table[(BYTE1(a3) ^ v26 ^ HIBYTE(v25))];
    unsigned __int16 v28 = crc_16_l_table[(BYTE2(a3) ^ v27 ^ HIBYTE(v26))];
    unsigned __int16 v29 = crc_16_l_table[(HIBYTE(a3) ^ v28 ^ HIBYTE(v27))];
    unsigned __int16 v30 = crc_16_l_table[(a4 ^ v29 ^ HIBYTE(v28))];
    unsigned __int16 v31 = crc_16_l_table[(a5 ^ v30 ^ HIBYTE(v29))];
    unsigned __int16 v32 = crc_16_l_table[(a6 ^ v31 ^ HIBYTE(v30))];
    unsigned __int16 v33 = crc_16_l_table[(a7 ^ v32 ^ HIBYTE(v31))];
    unsigned __int16 v34 = crc_16_l_table[(a8 ^ v33 ^ HIBYTE(v32))];
    unsigned __int16 v35 = crc_16_l_table[(a9 ^ v34 ^ HIBYTE(v33))];
    unsigned __int16 v36 = crc_16_l_table[(a10 ^ v35 ^ HIBYTE(v34))];
    unsigned __int16 v37 = crc_16_l_table[(a1[21] ^ v36 ^ HIBYTE(v35))];
    unsigned __int16 v38 = crc_16_l_table[(a1[22] ^ v37 ^ HIBYTE(v36))];
    unsigned __int16 v39 = crc_16_l_table[(a1[23] ^ v38 ^ HIBYTE(v37))];
    unsigned __int16 v40 = crc_16_l_table[(a11 ^ v39 ^ HIBYTE(v38))];
    unsigned __int16 v41 = crc_16_l_table[(a12 ^ v40 ^ HIBYTE(v39))];
    unsigned int v42 = crc_16_l_table[(a13 ^ v41 ^ HIBYTE(v40))];
    *((_WORD *)a1 + 14) = crc_16_l_table[(a14 ^ v42 ^ HIBYTE(v41))] ^ ~(unsigned __int16)(v42 >> 8);
    if (a2 >= 60)
    {
      bzero(__src, 0x800uLL);
      uint64_t v43 = 0;
      LODWORD(v44) = 0;
      do
      {
        while (1)
        {
          int v46 = a1[v43];
          if ((v46 - 125) > 1) {
            break;
          }
          int v45 = v44 + 1;
          __src[(int)v44] = 125;
          __src[(int)v44 + 1] = v46 ^ 0x20;
          size_t v44 = (int)v44 + 1 + 1;
          if (++v43 == 30) {
            goto LABEL_9;
          }
        }
        int v45 = v44;
        __src[(int)v44] = v46;
        size_t v44 = (int)v44 + 1;
        ++v43;
      }
      while (v43 != 30);
LABEL_9:
      memcpy(a1, __src, v44);
      uint64_t result = (v45 + 2);
      a1[v44] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_CDMA2000_MOD_FCH(char *a1, int a2, int a3, char a4, int a5, char a6, __int16 a7, int a8)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x1F)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 461643;
    *((_WORD *)a1 + 2) = 104;
    *(_DWORD *)(a1 + 10) = a3;
    a1[14] = a4;
    *(_DWORD *)(a1 + 15) = a5;
    a1[19] = a6;
    *((_WORD *)a1 + 10) = a7;
    *((_DWORD *)a1 + 6) = a8;
    unsigned __int16 v17 = crc_16_l_table[a1[6] ^ 0xDCLL];
    unsigned __int16 v18 = crc_16_l_table[a1[7] ^ 0x9C ^ v17];
    unsigned __int16 v19 = crc_16_l_table[(a1[8] ^ v18 ^ HIBYTE(v17))];
    unsigned __int16 v20 = crc_16_l_table[(a1[9] ^ v19 ^ HIBYTE(v18))];
    unsigned __int16 v21 = crc_16_l_table[(a3 ^ v20 ^ HIBYTE(v19))];
    unsigned __int16 v22 = crc_16_l_table[(BYTE1(a3) ^ v21 ^ HIBYTE(v20))];
    unsigned __int16 v23 = crc_16_l_table[(BYTE2(a3) ^ v22 ^ HIBYTE(v21))];
    unsigned __int16 v24 = crc_16_l_table[(HIBYTE(a3) ^ v23 ^ HIBYTE(v22))];
    unsigned __int16 v25 = crc_16_l_table[(a4 ^ v24 ^ HIBYTE(v23))];
    unsigned __int16 v26 = crc_16_l_table[(a5 ^ v25 ^ HIBYTE(v24))];
    unsigned __int16 v27 = crc_16_l_table[(BYTE1(a5) ^ v26 ^ HIBYTE(v25))];
    unsigned __int16 v28 = crc_16_l_table[(BYTE2(a5) ^ v27 ^ HIBYTE(v26))];
    unsigned __int16 v29 = crc_16_l_table[(HIBYTE(a5) ^ v28 ^ HIBYTE(v27))];
    unsigned __int16 v30 = crc_16_l_table[(a6 ^ v29 ^ HIBYTE(v28))];
    unsigned __int16 v31 = crc_16_l_table[(a7 ^ v30 ^ HIBYTE(v29))];
    unsigned __int16 v32 = crc_16_l_table[(HIBYTE(a7) ^ v31 ^ HIBYTE(v30))];
    unsigned __int16 v33 = crc_16_l_table[(a1[22] ^ v32 ^ HIBYTE(v31))];
    unsigned __int16 v34 = crc_16_l_table[(a1[23] ^ v33 ^ HIBYTE(v32))];
    unsigned __int16 v35 = crc_16_l_table[(a8 ^ v34 ^ HIBYTE(v33))];
    unsigned __int16 v36 = crc_16_l_table[(a1[25] ^ v35 ^ HIBYTE(v34))];
    unsigned int v37 = crc_16_l_table[(a1[26] ^ v36 ^ HIBYTE(v35))];
    *((_WORD *)a1 + 14) = crc_16_l_table[(a1[27] ^ v37 ^ HIBYTE(v36))] ^ ~(unsigned __int16)(v37 >> 8);
    if (a2 >= 60)
    {
      bzero(__src, 0x800uLL);
      uint64_t v38 = 0;
      LODWORD(v39) = 0;
      do
      {
        while (1)
        {
          int v41 = a1[v38];
          if ((v41 - 125) > 1) {
            break;
          }
          int v40 = v39 + 1;
          __src[(int)v39] = 125;
          __src[(int)v39 + 1] = v41 ^ 0x20;
          size_t v39 = (int)v39 + 1 + 1;
          if (++v38 == 30) {
            goto LABEL_9;
          }
        }
        int v40 = v39;
        __src[(int)v39] = v41;
        size_t v39 = (int)v39 + 1;
        ++v38;
      }
      while (v38 != 30);
LABEL_9:
      memcpy(a1, __src, v39);
      uint64_t result = (v40 + 2);
      a1[v39] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_CDMA2000_FTM_FWD_HHO_SC(char *a1, int a2, int a3, __int16 a4, __int16 a5)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x1F)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 461643;
    *((_WORD *)a1 + 2) = 128;
    *(_DWORD *)(a1 + 10) = a3;
    *((_WORD *)a1 + 7) = a4;
    *((_WORD *)a1 + 8) = a5;
    unsigned __int16 v11 = crc_16_l_table[a1[6] ^ 0x85];
    unsigned __int16 v12 = crc_16_l_table[(a1[7] ^ v11) ^ 0xBB];
    unsigned __int16 v13 = crc_16_l_table[(a1[8] ^ v12 ^ HIBYTE(v11))];
    unsigned __int16 v14 = crc_16_l_table[(a1[9] ^ v13 ^ HIBYTE(v12))];
    unsigned __int16 v15 = crc_16_l_table[(a3 ^ v14 ^ HIBYTE(v13))];
    unsigned __int16 v16 = crc_16_l_table[(BYTE1(a3) ^ v15 ^ HIBYTE(v14))];
    unsigned __int16 v17 = crc_16_l_table[(BYTE2(a3) ^ v16 ^ HIBYTE(v15))];
    unsigned __int16 v18 = crc_16_l_table[(HIBYTE(a3) ^ v17 ^ HIBYTE(v16))];
    unsigned __int16 v19 = crc_16_l_table[(a4 ^ v18 ^ HIBYTE(v17))];
    unsigned __int16 v20 = crc_16_l_table[(HIBYTE(a4) ^ v19 ^ HIBYTE(v18))];
    unsigned int v21 = crc_16_l_table[(v20 ^ HIBYTE(v19) ^ a5)];
    unsigned __int16 v22 = crc_16_l_table[(a1[17] ^ v21 ^ HIBYTE(v20))];
    *((_WORD *)a1 + 9) = v22 ^ ~HIBYTE(crc_16_l_table[(v20 ^ HIBYTE(v19) ^ a5)]);
    if (a2 >= 40)
    {
      bzero(__src, 0x800uLL);
      int v23 = *a1;
      if ((v23 - 125) > 1)
      {
        unsigned int v24 = 0;
      }
      else
      {
        __src[0] = 125;
        LOBYTE(v23) = v23 ^ 0x20;
        unsigned int v24 = 1;
      }
      __src[v24] = v23;
      uint64_t v25 = v24 + 1;
      int v26 = a1[1];
      if ((v26 - 125) <= 1)
      {
        __src[v25] = 125;
        LODWORD(v25) = v24 | 2;
        LOBYTE(v26) = v26 ^ 0x20;
      }
      __src[v25] = v26;
      uint64_t v27 = v25 + 1;
      int v28 = a1[2];
      if ((v28 - 125) <= 1)
      {
        __src[v27] = 125;
        LOBYTE(v28) = v28 ^ 0x20;
        LODWORD(v27) = v25 + 2;
      }
      __src[v27] = v28;
      uint64_t v29 = v27 + 1;
      int v30 = a1[3];
      if ((v30 - 125) <= 1)
      {
        __src[v29] = 125;
        LODWORD(v29) = v27 + 2;
        LOBYTE(v30) = v30 ^ 0x20;
      }
      __src[v29] = v30;
      uint64_t v31 = v29 + 1;
      int v32 = a1[4];
      if ((v32 - 125) <= 1)
      {
        __src[v31] = 125;
        LOBYTE(v32) = v32 ^ 0x20;
        LODWORD(v31) = v29 + 2;
      }
      __src[v31] = v32;
      uint64_t v33 = v31 + 1;
      int v34 = a1[5];
      if ((v34 - 125) <= 1)
      {
        __src[v33] = 125;
        LODWORD(v33) = v31 + 2;
        LOBYTE(v34) = v34 ^ 0x20;
      }
      __src[v33] = v34;
      uint64_t v35 = v33 + 1;
      int v36 = a1[6];
      if ((v36 - 125) <= 1)
      {
        __src[v35] = 125;
        LOBYTE(v36) = v36 ^ 0x20;
        LODWORD(v35) = v33 + 2;
      }
      __src[v35] = v36;
      uint64_t v37 = v35 + 1;
      int v38 = a1[7];
      if ((v38 - 125) <= 1)
      {
        __src[v37] = 125;
        LODWORD(v37) = v35 + 2;
        LOBYTE(v38) = v38 ^ 0x20;
      }
      __src[v37] = v38;
      uint64_t v39 = v37 + 1;
      int v40 = a1[8];
      if ((v40 - 125) <= 1)
      {
        __src[v39] = 125;
        LOBYTE(v40) = v40 ^ 0x20;
        LODWORD(v39) = v37 + 2;
      }
      __src[v39] = v40;
      uint64_t v41 = v39 + 1;
      int v42 = a1[9];
      if ((v42 - 125) <= 1)
      {
        __src[v41] = 125;
        LODWORD(v41) = v39 + 2;
        LOBYTE(v42) = v42 ^ 0x20;
      }
      __src[v41] = v42;
      uint64_t v43 = v41 + 1;
      int v44 = a1[10];
      if ((v44 - 125) <= 1)
      {
        __src[v43] = 125;
        LOBYTE(v44) = v44 ^ 0x20;
        LODWORD(v43) = v41 + 2;
      }
      __src[v43] = v44;
      uint64_t v45 = v43 + 1;
      int v46 = a1[11];
      if ((v46 - 125) <= 1)
      {
        __src[v45] = 125;
        LODWORD(v45) = v43 + 2;
        LOBYTE(v46) = v46 ^ 0x20;
      }
      __src[v45] = v46;
      uint64_t v47 = v45 + 1;
      int v48 = a1[12];
      if ((v48 - 125) <= 1)
      {
        __src[v47] = 125;
        LOBYTE(v48) = v48 ^ 0x20;
        LODWORD(v47) = v45 + 2;
      }
      __src[v47] = v48;
      uint64_t v49 = v47 + 1;
      int v50 = a1[13];
      if ((v50 - 125) <= 1)
      {
        __src[v49] = 125;
        LODWORD(v49) = v47 + 2;
        LOBYTE(v50) = v50 ^ 0x20;
      }
      __src[v49] = v50;
      uint64_t v51 = v49 + 1;
      int v52 = a1[14];
      if ((v52 - 125) <= 1)
      {
        __src[v51] = 125;
        LOBYTE(v52) = v52 ^ 0x20;
        LODWORD(v51) = v49 + 2;
      }
      __src[v51] = v52;
      uint64_t v53 = v51 + 1;
      int v54 = a1[15];
      if ((v54 - 125) <= 1)
      {
        __src[v53] = 125;
        LODWORD(v53) = v51 + 2;
        LOBYTE(v54) = v54 ^ 0x20;
      }
      __src[v53] = v54;
      uint64_t v55 = v53 + 1;
      int v56 = a1[16];
      if ((v56 - 125) <= 1)
      {
        __src[v55] = 125;
        LOBYTE(v56) = v56 ^ 0x20;
        LODWORD(v55) = v53 + 2;
      }
      int v57 = ~(v22 ^ BYTE1(v21));
      __src[v55] = v56;
      uint64_t v58 = v55 + 1;
      int v59 = a1[17];
      if ((v59 - 125) <= 1)
      {
        __src[v58] = 125;
        LOBYTE(v59) = v59 ^ 0x20;
        LODWORD(v58) = v55 + 2;
      }
      int v60 = ((unsigned __int16)(v22 ^ ~(unsigned __int16)(v21 >> 8)) >> 8);
      __src[v58] = v59;
      uint64_t v61 = v58 + 1;
      if ((v57 - 125) <= 1)
      {
        __src[v61] = 125;
        LOBYTE(v57) = v57 ^ 0x20;
        LODWORD(v61) = v58 + 2;
      }
      __src[v61] = v57;
      uint64_t v62 = v61 + 1;
      if ((v60 - 125) <= 1)
      {
        __src[v62] = 125;
        LOBYTE(v60) = v60 ^ 0x20;
        LODWORD(v62) = v61 + 2;
      }
      __src[v62] = v60;
      memcpy(a1, __src, v62 + 1);
      uint64_t result = (v62 + 2);
      a1[v62 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_CDMA2000_CMD_RELEASE(unsigned __int8 *a1, int a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0x33) {
    return result;
  }
  bzero(a1, a2);
  *(_DWORD *)a1 = 461643;
  a1[4] = 108;
  uint64_t v5 = a1[5];
  unsigned __int16 v6 = crc_16_l_table[v5 ^ 0x3C];
  int v7 = a1[6];
  unsigned __int16 v8 = crc_16_l_table[(v7 ^ v6) ^ 0x53];
  unsigned __int16 v9 = crc_16_l_table[(a1[7] ^ v8 ^ HIBYTE(v6))];
  unsigned int v10 = crc_16_l_table[(a1[8] ^ v9 ^ HIBYTE(v8))];
  unsigned __int16 v11 = crc_16_l_table[(a1[9] ^ v10 ^ HIBYTE(v9))];
  *((_WORD *)a1 + 5) = v11 ^ ~HIBYTE(crc_16_l_table[(a1[8] ^ v9 ^ HIBYTE(v8))]);
  if (a2 < 24) {
    return 0xFFFFFFFFLL;
  }
  bzero(v26, 0x7FBuLL);
  int __src = 461643;
  char v25 = 108;
  if ((v5 - 125) <= 1)
  {
    v26[0] = 125;
    int v12 = 6;
    v26[1] = v5 ^ 0x20;
    uint64_t v13 = 7;
    if ((v7 - 125) > 1) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  int v12 = 5;
  v26[0] = v5;
  uint64_t v13 = 6;
  if ((v7 - 125) <= 1)
  {
LABEL_9:
    *((unsigned char *)&__src + v13) = 125;
    LOBYTE(v7) = v7 ^ 0x20;
    LODWORD(v13) = v12 + 2;
  }
LABEL_10:
  *((unsigned char *)&__src + v13) = v7;
  uint64_t v14 = v13 + 1;
  int v15 = a1[7];
  if ((v15 - 125) <= 1)
  {
    *((unsigned char *)&__src + v14) = 125;
    LODWORD(v14) = v13 + 2;
    LOBYTE(v15) = v15 ^ 0x20;
  }
  *((unsigned char *)&__src + v14) = v15;
  uint64_t v16 = v14 + 1;
  int v17 = a1[8];
  if ((v17 - 125) <= 1)
  {
    *((unsigned char *)&__src + v16) = 125;
    LOBYTE(v17) = v17 ^ 0x20;
    LODWORD(v16) = v14 + 2;
  }
  int v18 = ~(v11 ^ BYTE1(v10));
  *((unsigned char *)&__src + v16) = v17;
  uint64_t v19 = v16 + 1;
  int v20 = a1[9];
  if ((v20 - 125) <= 1)
  {
    *((unsigned char *)&__src + v19) = 125;
    LOBYTE(v20) = v20 ^ 0x20;
    LODWORD(v19) = v16 + 2;
  }
  int v21 = ((unsigned __int16)(v11 ^ ~(unsigned __int16)(v10 >> 8)) >> 8);
  *((unsigned char *)&__src + v19) = v20;
  uint64_t v22 = v19 + 1;
  if ((v18 - 125) <= 1)
  {
    *((unsigned char *)&__src + v22) = 125;
    LOBYTE(v18) = v18 ^ 0x20;
    LODWORD(v22) = v19 + 2;
  }
  *((unsigned char *)&__src + v22) = v18;
  uint64_t v23 = v22 + 1;
  if ((v21 - 125) <= 1)
  {
    *((unsigned char *)&__src + v23) = 125;
    LOBYTE(v21) = v21 ^ 0x20;
    LODWORD(v23) = v22 + 2;
  }
  *((unsigned char *)&__src + v23) = v21;
  memcpy(a1, &__src, v23 + 1);
  uint64_t result = (v23 + 2);
  a1[v23 + 1] = 126;
  return result;
}

uint64_t APPLIB_DIAG_FTM_EVDO_PILOT_ACQ(char *a1, int a2, int a3, __int16 a4, int a5, int a6)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x23)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 527179;
    *((_WORD *)a1 + 2) = 113;
    *(_DWORD *)(a1 + 10) = a3;
    *((_WORD *)a1 + 7) = a4;
    *((_DWORD *)a1 + 4) = a5;
    *((_DWORD *)a1 + 5) = a6;
    unsigned __int16 v13 = crc_16_l_table[a1[6] ^ 0xACLL];
    unsigned __int16 v14 = crc_16_l_table[a1[7] ^ 0x6C ^ v13];
    unsigned __int16 v15 = crc_16_l_table[(a1[8] ^ v14 ^ HIBYTE(v13))];
    unsigned __int16 v16 = crc_16_l_table[(a1[9] ^ v15 ^ HIBYTE(v14))];
    unsigned __int16 v17 = crc_16_l_table[(a3 ^ v16 ^ HIBYTE(v15))];
    unsigned __int16 v18 = crc_16_l_table[(BYTE1(a3) ^ v17 ^ HIBYTE(v16))];
    unsigned __int16 v19 = crc_16_l_table[(BYTE2(a3) ^ v18 ^ HIBYTE(v17))];
    unsigned __int16 v20 = crc_16_l_table[(HIBYTE(a3) ^ v19 ^ HIBYTE(v18))];
    unsigned __int16 v21 = crc_16_l_table[(a4 ^ v20 ^ HIBYTE(v19))];
    unsigned __int16 v22 = crc_16_l_table[(HIBYTE(a4) ^ v21 ^ HIBYTE(v20))];
    unsigned __int16 v23 = crc_16_l_table[(a5 ^ v22 ^ HIBYTE(v21))];
    unsigned __int16 v24 = crc_16_l_table[(a1[17] ^ v23 ^ HIBYTE(v22))];
    unsigned __int16 v25 = crc_16_l_table[(a1[18] ^ v24 ^ HIBYTE(v23))];
    unsigned __int16 v26 = crc_16_l_table[(a1[19] ^ v25 ^ HIBYTE(v24))];
    unsigned __int16 v27 = crc_16_l_table[(a6 ^ v26 ^ HIBYTE(v25))];
    unsigned __int16 v28 = crc_16_l_table[(a1[21] ^ v27 ^ HIBYTE(v26))];
    unsigned int v29 = crc_16_l_table[(a1[22] ^ v28 ^ HIBYTE(v27))];
    *((_WORD *)a1 + 12) = crc_16_l_table[(a1[23] ^ v29 ^ HIBYTE(v28))] ^ ~(unsigned __int16)(v29 >> 8);
    if (a2 >= 52)
    {
      bzero(__src, 0x800uLL);
      uint64_t v30 = 0;
      LODWORD(v31) = 0;
      do
      {
        while (1)
        {
          int v33 = a1[v30];
          if ((v33 - 125) > 1) {
            break;
          }
          int v32 = v31 + 1;
          __src[(int)v31] = 125;
          __src[(int)v31 + 1] = v33 ^ 0x20;
          size_t v31 = (int)v31 + 1 + 1;
          if (++v30 == 26) {
            goto LABEL_9;
          }
        }
        int v32 = v31;
        __src[(int)v31] = v33;
        size_t v31 = (int)v31 + 1;
        ++v30;
      }
      while (v30 != 26);
LABEL_9:
      memcpy(a1, __src, v31);
      uint64_t result = (v32 + 2);
      a1[v31] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_EVDO_SYS_TIME_ACQ(unsigned __int8 *a1, int a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x1F)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 527179;
    *((_WORD *)a1 + 2) = 114;
    a1[6] = 10;
    unsigned __int16 v5 = crc_16_l_table[a1[7] ^ 0x34];
    unsigned int v6 = crc_16_l_table[a1[8] ^ 0x2F ^ v5];
    unsigned __int16 v7 = crc_16_l_table[(a1[9] ^ v6 ^ HIBYTE(v5))];
    *((_WORD *)a1 + 5) = v7 ^ ~HIBYTE(crc_16_l_table[a1[8] ^ 0x2F ^ v5]);
    if (a2 >= 24)
    {
      bzero(v21, 0x7F9uLL);
      int __src = 527179;
      __int16 v19 = 114;
      char v20 = 10;
      int v8 = a1[7];
      if ((v8 - 125) > 1)
      {
        unsigned int v9 = 7;
      }
      else
      {
        v21[0] = 125;
        LOBYTE(v8) = v8 ^ 0x20;
        unsigned int v9 = 8;
      }
      *((unsigned char *)&__src + v9) = v8;
      uint64_t v10 = v9 + 1;
      int v11 = a1[8];
      if ((v11 - 125) <= 1)
      {
        *((unsigned char *)&__src + v10) = 125;
        LODWORD(v10) = v9 + 2;
        LOBYTE(v11) = v11 ^ 0x20;
      }
      int v12 = ~(v7 ^ BYTE1(v6));
      *((unsigned char *)&__src + v10) = v11;
      uint64_t v13 = v10 + 1;
      int v14 = a1[9];
      if ((v14 - 125) <= 1)
      {
        *((unsigned char *)&__src + v13) = 125;
        LOBYTE(v14) = v14 ^ 0x20;
        LODWORD(v13) = v10 + 2;
      }
      int v15 = ((unsigned __int16)(v7 ^ ~(unsigned __int16)(v6 >> 8)) >> 8);
      *((unsigned char *)&__src + v13) = v14;
      uint64_t v16 = v13 + 1;
      if ((v12 - 125) <= 1)
      {
        *((unsigned char *)&__src + v16) = 125;
        LOBYTE(v12) = v12 ^ 0x20;
        LODWORD(v16) = v13 + 2;
      }
      *((unsigned char *)&__src + v16) = v12;
      uint64_t v17 = v16 + 1;
      if ((v15 - 125) <= 1)
      {
        *((unsigned char *)&__src + v17) = 125;
        LOBYTE(v15) = v15 ^ 0x20;
        LODWORD(v17) = v16 + 2;
      }
      *((unsigned char *)&__src + v17) = v15;
      memcpy(a1, &__src, v17 + 1);
      uint64_t result = (v17 + 2);
      a1[v17 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_EVDO_DEMOD_CC_MAC_FTC(unsigned __int8 *a1, int a2, unsigned __int8 a3, unsigned __int8 a4, unsigned __int8 a5, unsigned __int8 a6, unsigned __int8 a7, unsigned __int8 a8)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x1B)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 527179;
    *((_WORD *)a1 + 2) = 115;
    a1[10] = a3;
    a1[11] = a4;
    a1[12] = a5;
    a1[13] = a6;
    a1[14] = a7;
    a1[15] = a8;
    uint64_t v17 = a1[6];
    unsigned __int16 v18 = crc_16_l_table[v17 ^ 0x1C];
    unsigned __int16 v19 = crc_16_l_table[a1[7] ^ 0x5F ^ v18];
    unsigned __int16 v20 = crc_16_l_table[(a1[8] ^ v19 ^ HIBYTE(v18))];
    unsigned __int16 v21 = crc_16_l_table[(a1[9] ^ v20 ^ HIBYTE(v19))];
    unsigned __int16 v22 = crc_16_l_table[(a3 ^ v21 ^ HIBYTE(v20))];
    unsigned __int16 v23 = crc_16_l_table[(a4 ^ v22 ^ HIBYTE(v21))];
    unsigned __int16 v24 = crc_16_l_table[(a5 ^ v23 ^ HIBYTE(v22))];
    unsigned __int16 v25 = crc_16_l_table[(a6 ^ v24 ^ HIBYTE(v23))];
    unsigned int v26 = crc_16_l_table[(a7 ^ v25 ^ HIBYTE(v24))];
    int v27 = crc_16_l_table[(v26 ^ HIBYTE(v25) ^ a8)];
    int v28 = v27 ^ ~(v26 >> 8);
    *((_WORD *)a1 + 8) = v27 ^ ~(unsigned __int16)(v26 >> 8);
    if (a2 >= 36)
    {
      bzero(__src, 0x800uLL);
      int v29 = *a1;
      if ((v29 - 125) > 1)
      {
        unsigned int v30 = 0;
      }
      else
      {
        __src[0] = 125;
        LOBYTE(v29) = v29 ^ 0x20;
        unsigned int v30 = 1;
      }
      __src[v30] = v29;
      uint64_t v31 = v30 + 1;
      int v32 = a1[1];
      if ((v32 - 125) <= 1)
      {
        __src[v31] = 125;
        LODWORD(v31) = v30 | 2;
        LOBYTE(v32) = v32 ^ 0x20;
      }
      __src[v31] = v32;
      uint64_t v33 = v31 + 1;
      int v34 = a1[2];
      if ((v34 - 125) <= 1)
      {
        __src[v33] = 125;
        LOBYTE(v34) = v34 ^ 0x20;
        LODWORD(v33) = v31 + 2;
      }
      __src[v33] = v34;
      uint64_t v35 = v33 + 1;
      int v36 = a1[3];
      if ((v36 - 125) <= 1)
      {
        __src[v35] = 125;
        LODWORD(v35) = v33 + 2;
        LOBYTE(v36) = v36 ^ 0x20;
      }
      __src[v35] = v36;
      uint64_t v37 = v35 + 1;
      int v38 = a1[4];
      if ((v38 - 125) <= 1)
      {
        __src[v37] = 125;
        LOBYTE(v38) = v38 ^ 0x20;
        LODWORD(v37) = v35 + 2;
      }
      __src[v37] = v38;
      uint64_t v39 = v37 + 1;
      int v40 = a1[5];
      if ((v40 - 125) <= 1)
      {
        __src[v39] = 125;
        LODWORD(v39) = v37 + 2;
        LOBYTE(v40) = v40 ^ 0x20;
      }
      __src[v39] = v40;
      uint64_t v41 = v39 + 1;
      if ((v17 - 125) <= 1)
      {
        __src[v41] = 125;
        LOBYTE(v17) = v17 ^ 0x20;
        LODWORD(v41) = v39 + 2;
      }
      __src[v41] = v17;
      uint64_t v42 = v41 + 1;
      int v43 = a1[7];
      if ((v43 - 125) <= 1)
      {
        __src[v42] = 125;
        LODWORD(v42) = v41 + 2;
        LOBYTE(v43) = v43 ^ 0x20;
      }
      __src[v42] = v43;
      uint64_t v44 = v42 + 1;
      int v45 = a1[8];
      if ((v45 - 125) <= 1)
      {
        __src[v44] = 125;
        LOBYTE(v45) = v45 ^ 0x20;
        LODWORD(v44) = v42 + 2;
      }
      __src[v44] = v45;
      uint64_t v46 = v44 + 1;
      int v47 = a1[9];
      if ((v47 - 125) <= 1)
      {
        __src[v46] = 125;
        LODWORD(v46) = v44 + 2;
        LOBYTE(v47) = v47 ^ 0x20;
      }
      __src[v46] = v47;
      uint64_t v48 = v46 + 1;
      int v49 = a1[10];
      if ((v49 - 125) <= 1)
      {
        __src[v48] = 125;
        LOBYTE(v49) = v49 ^ 0x20;
        LODWORD(v48) = v46 + 2;
      }
      __src[v48] = v49;
      uint64_t v50 = v48 + 1;
      int v51 = a1[11];
      if ((v51 - 125) <= 1)
      {
        __src[v50] = 125;
        LODWORD(v50) = v48 + 2;
        LOBYTE(v51) = v51 ^ 0x20;
      }
      __src[v50] = v51;
      uint64_t v52 = v50 + 1;
      int v53 = a1[12];
      if ((v53 - 125) <= 1)
      {
        __src[v52] = 125;
        LOBYTE(v53) = v53 ^ 0x20;
        LODWORD(v52) = v50 + 2;
      }
      __src[v52] = v53;
      uint64_t v54 = v52 + 1;
      int v55 = a1[13];
      if ((v55 - 125) <= 1)
      {
        __src[v54] = 125;
        LODWORD(v54) = v52 + 2;
        LOBYTE(v55) = v55 ^ 0x20;
      }
      __src[v54] = v55;
      uint64_t v56 = v54 + 1;
      int v57 = a1[14];
      if ((v57 - 125) <= 1)
      {
        __src[v56] = 125;
        LOBYTE(v57) = v57 ^ 0x20;
        LODWORD(v56) = v54 + 2;
      }
      int v58 = ~(v27 ^ BYTE1(v26));
      __src[v56] = v57;
      uint64_t v59 = v56 + 1;
      int v60 = a1[15];
      if ((v60 - 125) <= 1)
      {
        __src[v59] = 125;
        LOBYTE(v60) = v60 ^ 0x20;
        LODWORD(v59) = v56 + 2;
      }
      char v61 = (unsigned __int16)(v27 ^ ~(unsigned __int16)(v26 >> 8)) >> 8;
      __src[v59] = v60;
      uint64_t v62 = v59 + 1;
      if ((v58 - 125) <= 1)
      {
        __src[v62] = 125;
        LOBYTE(v58) = v58 ^ 0x20;
        LODWORD(v62) = v59 + 2;
      }
      __src[v62] = v58;
      uint64_t v63 = v62 + 1;
      if (BYTE1(v28) - 125 <= 1)
      {
        __src[v63] = 125;
        char v61 = BYTE1(v28) ^ 0x20;
        LODWORD(v63) = v62 + 2;
      }
      __src[v63] = v61;
      memcpy(a1, __src, v63 + 1);
      uint64_t result = (v63 + 2);
      a1[v63 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_EVDO_MOD_ACC(char *a1, int a2, int a3, int a4, int a5, int a6, int a7, char a8, char a9, char a10, char a11, char a12, char a13)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x2F)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 527179;
    *((_WORD *)a1 + 2) = 116;
    *(_DWORD *)(a1 + 10) = a3;
    *(_DWORD *)(a1 + 14) = a4;
    *(_DWORD *)(a1 + 18) = a5;
    *(_DWORD *)(a1 + 22) = a6;
    *(_DWORD *)(a1 + 26) = a7;
    a1[30] = a8;
    a1[31] = a9;
    a1[32] = a10;
    a1[33] = a11;
    a1[34] = a12;
    a1[35] = a13;
    unsigned __int16 v21 = crc_16_l_table[a1[6] ^ 0x14];
    unsigned __int16 v22 = crc_16_l_table[a1[7] ^ 0x12 ^ v21];
    unsigned __int16 v23 = crc_16_l_table[(a1[8] ^ v22 ^ HIBYTE(v21))];
    unsigned __int16 v24 = crc_16_l_table[(a1[9] ^ v23 ^ HIBYTE(v22))];
    unsigned __int16 v25 = crc_16_l_table[(a1[10] ^ v24 ^ HIBYTE(v23))];
    unsigned __int16 v26 = crc_16_l_table[(a1[11] ^ v25 ^ HIBYTE(v24))];
    unsigned __int16 v27 = crc_16_l_table[(a1[12] ^ v26 ^ HIBYTE(v25))];
    unsigned __int16 v28 = crc_16_l_table[(a1[13] ^ v27 ^ HIBYTE(v26))];
    unsigned __int16 v29 = crc_16_l_table[(a1[14] ^ v28 ^ HIBYTE(v27))];
    unsigned __int16 v30 = crc_16_l_table[(a1[15] ^ v29 ^ HIBYTE(v28))];
    unsigned __int16 v31 = crc_16_l_table[(a1[16] ^ v30 ^ HIBYTE(v29))];
    unsigned __int16 v32 = crc_16_l_table[(HIBYTE(a4) ^ v31 ^ HIBYTE(v30))];
    unsigned __int16 v33 = crc_16_l_table[(a5 ^ v32 ^ HIBYTE(v31))];
    unsigned __int16 v34 = crc_16_l_table[(BYTE1(a5) ^ v33 ^ HIBYTE(v32))];
    unsigned __int16 v35 = crc_16_l_table[(BYTE2(a5) ^ v34 ^ HIBYTE(v33))];
    unsigned __int16 v36 = crc_16_l_table[(HIBYTE(a5) ^ v35 ^ HIBYTE(v34))];
    unsigned __int16 v37 = crc_16_l_table[(a6 ^ v36 ^ HIBYTE(v35))];
    unsigned __int16 v38 = crc_16_l_table[(BYTE1(a6) ^ v37 ^ HIBYTE(v36))];
    unsigned __int16 v39 = crc_16_l_table[(BYTE2(a6) ^ v38 ^ HIBYTE(v37))];
    unsigned __int16 v40 = crc_16_l_table[(HIBYTE(a6) ^ v39 ^ HIBYTE(v38))];
    unsigned __int16 v41 = crc_16_l_table[(a7 ^ v40 ^ HIBYTE(v39))];
    unsigned __int16 v42 = crc_16_l_table[(BYTE1(a7) ^ v41 ^ HIBYTE(v40))];
    unsigned __int16 v43 = crc_16_l_table[(BYTE2(a7) ^ v42 ^ HIBYTE(v41))];
    unsigned __int16 v44 = crc_16_l_table[(HIBYTE(a7) ^ v43 ^ HIBYTE(v42))];
    unsigned __int16 v45 = crc_16_l_table[(a8 ^ v44 ^ HIBYTE(v43))];
    unsigned __int16 v46 = crc_16_l_table[(a9 ^ v45 ^ HIBYTE(v44))];
    unsigned __int16 v47 = crc_16_l_table[(a10 ^ v46 ^ HIBYTE(v45))];
    unsigned __int16 v48 = crc_16_l_table[(a11 ^ v47 ^ HIBYTE(v46))];
    unsigned int v49 = crc_16_l_table[(a12 ^ v48 ^ HIBYTE(v47))];
    *((_WORD *)a1 + 18) = crc_16_l_table[(v49 ^ HIBYTE(v48) ^ a13)] ^ ~(unsigned __int16)(v49 >> 8);
    if (a2 >= 76)
    {
      bzero(__src, 0x800uLL);
      uint64_t v50 = 0;
      LODWORD(v51) = 0;
      do
      {
        while (1)
        {
          int v53 = a1[v50];
          if ((v53 - 125) > 1) {
            break;
          }
          int v52 = v51 + 1;
          __src[(int)v51] = 125;
          __src[(int)v51 + 1] = v53 ^ 0x20;
          size_t v51 = (int)v51 + 1 + 1;
          if (++v50 == 38) {
            goto LABEL_9;
          }
        }
        int v52 = v51;
        __src[(int)v51] = v53;
        size_t v51 = (int)v51 + 1;
        ++v50;
      }
      while (v50 != 38);
LABEL_9:
      memcpy(a1, __src, v51);
      uint64_t result = (v52 + 2);
      a1[v51] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_EVDO_REV_A_CONF_MAC_FOR_FWD_CC_MAC_FTC(unsigned __int8 *a1, int a2, int a3, int a4)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x1B)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 527179;
    *((_WORD *)a1 + 2) = 124;
    a1[10] = a3;
    a1[11] = a4;
    uint64_t v9 = a1[6];
    unsigned __int16 v10 = crc_16_l_table[v9 ^ 0xD4];
    unsigned __int16 v11 = crc_16_l_table[a1[7] ^ 0xDC ^ v10];
    unsigned __int16 v12 = crc_16_l_table[(a1[8] ^ v11 ^ HIBYTE(v10))];
    unsigned __int16 v13 = crc_16_l_table[(a1[9] ^ v12 ^ HIBYTE(v11))];
    unsigned int v14 = crc_16_l_table[(a3 ^ v13 ^ HIBYTE(v12))];
    int v15 = crc_16_l_table[(v14 ^ HIBYTE(v13)) ^ a4];
    int v16 = v15 ^ ~(v14 >> 8);
    *((_WORD *)a1 + 6) = v15 ^ ~HIBYTE(crc_16_l_table[(a3 ^ v13 ^ HIBYTE(v12))]);
    if (a2 >= 28)
    {
      bzero(v32, 0x7FAuLL);
      int __src = 527179;
      __int16 v31 = 124;
      if ((v9 - 125) > 1)
      {
        unsigned int v17 = 6;
      }
      else
      {
        v32[0] = 125;
        LOBYTE(v9) = v9 ^ 0x20;
        unsigned int v17 = 7;
      }
      *((unsigned char *)&__src + v17) = v9;
      uint64_t v18 = v17 + 1;
      int v19 = a1[7];
      if ((v19 - 125) <= 1)
      {
        *((unsigned char *)&__src + v18) = 125;
        LODWORD(v18) = v17 + 2;
        LOBYTE(v19) = v19 ^ 0x20;
      }
      *((unsigned char *)&__src + v18) = v19;
      uint64_t v20 = v18 + 1;
      int v21 = a1[8];
      if ((v21 - 125) <= 1)
      {
        *((unsigned char *)&__src + v20) = 125;
        LOBYTE(v21) = v21 ^ 0x20;
        LODWORD(v20) = v18 + 2;
      }
      *((unsigned char *)&__src + v20) = v21;
      uint64_t v22 = v20 + 1;
      int v23 = a1[9];
      if ((v23 - 125) <= 1)
      {
        *((unsigned char *)&__src + v22) = 125;
        LODWORD(v22) = v20 + 2;
        LOBYTE(v23) = v23 ^ 0x20;
      }
      *((unsigned char *)&__src + v22) = v23;
      uint64_t v24 = v22 + 1;
      if ((a3 - 125) <= 1)
      {
        *((unsigned char *)&__src + v24) = 125;
        LOBYTE(a3) = a3 ^ 0x20;
        LODWORD(v24) = v22 + 2;
      }
      int v25 = ~(v15 ^ BYTE1(v14));
      *((unsigned char *)&__src + v24) = a3;
      uint64_t v26 = v24 + 1;
      if ((a4 - 125) <= 1)
      {
        *((unsigned char *)&__src + v26) = 125;
        LOBYTE(a4) = a4 ^ 0x20;
        LODWORD(v26) = v24 + 2;
      }
      char v27 = (unsigned __int16)(v15 ^ ~(unsigned __int16)(v14 >> 8)) >> 8;
      *((unsigned char *)&__src + v26) = a4;
      uint64_t v28 = v26 + 1;
      if ((v25 - 125) <= 1)
      {
        *((unsigned char *)&__src + v28) = 125;
        LODWORD(v28) = v26 + 2;
        LOBYTE(v25) = v25 ^ 0x20;
      }
      *((unsigned char *)&__src + v28) = v25;
      uint64_t v29 = v28 + 1;
      if (BYTE1(v16) - 125 <= 1)
      {
        *((unsigned char *)&__src + v29) = 125;
        char v27 = BYTE1(v16) ^ 0x20;
        LODWORD(v29) = v28 + 2;
      }
      *((unsigned char *)&__src + v29) = v27;
      memcpy(a1, &__src, v29 + 1);
      uint64_t result = (v29 + 2);
      a1[v29 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_EVDO_REV_A_MOD_ACC(char *a1, int a2, int a3, int a4, int a5, int a6, int a7, char a8, char a9, char a10, char a11, char a12, char a13, char a14, char a15, char a16, char a17, char a18)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x35)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 527179;
    *((_WORD *)a1 + 2) = 125;
    *(_DWORD *)(a1 + 10) = a3;
    *(_DWORD *)(a1 + 14) = a4;
    *(_DWORD *)(a1 + 18) = a5;
    *(_DWORD *)(a1 + 22) = a6;
    *(_DWORD *)(a1 + 26) = a7;
    a1[30] = a8;
    a1[31] = a9;
    a1[32] = a10;
    a1[33] = a11;
    a1[34] = a12;
    a1[35] = a13;
    a1[36] = a14;
    a1[37] = a15;
    a1[38] = a16;
    a1[39] = a17;
    a1[40] = a18;
    unsigned __int16 v26 = crc_16_l_table[~*a1];
    unsigned __int16 v27 = crc_16_l_table[(a1[1] ^ ~(_BYTE)v26)];
    unsigned __int16 v28 = crc_16_l_table[(a1[2] ^ v27 ^ HIBYTE(v26))];
    unsigned __int16 v29 = crc_16_l_table[(a1[3] ^ v28 ^ HIBYTE(v27))];
    unsigned __int16 v30 = crc_16_l_table[(a1[4] ^ v29 ^ HIBYTE(v28))];
    unsigned __int16 v31 = crc_16_l_table[(a1[5] ^ v30 ^ HIBYTE(v29))];
    unsigned __int16 v32 = crc_16_l_table[(a1[6] ^ v31 ^ HIBYTE(v30))];
    unsigned __int16 v33 = crc_16_l_table[(a1[7] ^ v32 ^ HIBYTE(v31))];
    unsigned __int16 v34 = crc_16_l_table[(a1[8] ^ v33 ^ HIBYTE(v32))];
    unsigned __int16 v35 = crc_16_l_table[(a1[9] ^ v34 ^ HIBYTE(v33))];
    unsigned __int16 v36 = crc_16_l_table[(a1[10] ^ v35 ^ HIBYTE(v34))];
    unsigned __int16 v37 = crc_16_l_table[(a1[11] ^ v36 ^ HIBYTE(v35))];
    unsigned __int16 v38 = crc_16_l_table[(a1[12] ^ v37 ^ HIBYTE(v36))];
    unsigned __int16 v39 = crc_16_l_table[(a1[13] ^ v38 ^ HIBYTE(v37))];
    unsigned __int16 v40 = crc_16_l_table[(a1[14] ^ v39 ^ HIBYTE(v38))];
    unsigned __int16 v41 = crc_16_l_table[(a1[15] ^ v40 ^ HIBYTE(v39))];
    unsigned __int16 v42 = crc_16_l_table[(a1[16] ^ v41 ^ HIBYTE(v40))];
    unsigned __int16 v43 = crc_16_l_table[(a1[17] ^ v42 ^ HIBYTE(v41))];
    unsigned __int16 v44 = crc_16_l_table[(a1[18] ^ v43 ^ HIBYTE(v42))];
    unsigned __int16 v45 = crc_16_l_table[(a1[19] ^ v44 ^ HIBYTE(v43))];
    unsigned __int16 v46 = crc_16_l_table[(a1[20] ^ v45 ^ HIBYTE(v44))];
    unsigned __int16 v47 = crc_16_l_table[(a1[21] ^ v46 ^ HIBYTE(v45))];
    unsigned __int16 v48 = crc_16_l_table[(a6 ^ v47 ^ HIBYTE(v46))];
    unsigned __int16 v49 = crc_16_l_table[(BYTE1(a6) ^ v48 ^ HIBYTE(v47))];
    unsigned __int16 v50 = crc_16_l_table[(BYTE2(a6) ^ v49 ^ HIBYTE(v48))];
    unsigned __int16 v51 = crc_16_l_table[(HIBYTE(a6) ^ v50 ^ HIBYTE(v49))];
    unsigned __int16 v52 = crc_16_l_table[(a7 ^ v51 ^ HIBYTE(v50))];
    unsigned __int16 v53 = crc_16_l_table[(BYTE1(a7) ^ v52 ^ HIBYTE(v51))];
    unsigned __int16 v54 = crc_16_l_table[(BYTE2(a7) ^ v53 ^ HIBYTE(v52))];
    unsigned __int16 v55 = crc_16_l_table[(HIBYTE(a7) ^ v54 ^ HIBYTE(v53))];
    unsigned __int16 v56 = crc_16_l_table[(a8 ^ v55 ^ HIBYTE(v54))];
    unsigned __int16 v57 = crc_16_l_table[(a9 ^ v56 ^ HIBYTE(v55))];
    unsigned __int16 v58 = crc_16_l_table[(a10 ^ v57 ^ HIBYTE(v56))];
    unsigned __int16 v59 = crc_16_l_table[(a11 ^ v58 ^ HIBYTE(v57))];
    unsigned __int16 v60 = crc_16_l_table[(a12 ^ v59 ^ HIBYTE(v58))];
    unsigned __int16 v61 = crc_16_l_table[(a13 ^ v60 ^ HIBYTE(v59))];
    unsigned __int16 v62 = crc_16_l_table[(a14 ^ v61 ^ HIBYTE(v60))];
    unsigned __int16 v63 = crc_16_l_table[(a15 ^ v62 ^ HIBYTE(v61))];
    unsigned __int16 v64 = crc_16_l_table[(a16 ^ v63 ^ HIBYTE(v62))];
    unsigned int v65 = crc_16_l_table[(a17 ^ v64 ^ HIBYTE(v63))];
    *(_WORD *)(a1 + 41) = crc_16_l_table[(v65 ^ HIBYTE(v64) ^ a18)] ^ ~(unsigned __int16)(v65 >> 8);
    if (a2 >= 86)
    {
      bzero(__src, 0x800uLL);
      uint64_t v66 = 0;
      LODWORD(v67) = 0;
      do
      {
        while (1)
        {
          int v69 = a1[v66];
          if ((v69 - 125) > 1) {
            break;
          }
          int v68 = v67 + 1;
          __src[(int)v67] = 125;
          __src[(int)v67 + 1] = v69 ^ 0x20;
          size_t v67 = (int)v67 + 1 + 1;
          if (++v66 == 43) {
            goto LABEL_9;
          }
        }
        int v68 = v67;
        __src[(int)v67] = v69;
        size_t v67 = (int)v67 + 1;
        ++v66;
      }
      while (v66 != 43);
LABEL_9:
      memcpy(a1, __src, v67);
      uint64_t result = (v68 + 2);
      a1[v67] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_EVDO_REV_A_DEMOD_FWD_WITH_NO_REV(unsigned __int8 *a1, int a2, unsigned __int8 a3, unsigned __int8 a4, unsigned __int8 a5, unsigned __int8 a6, unsigned __int8 a7, unsigned __int8 a8, char a9, char a10, char a11)
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x35)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 527179;
    *((_WORD *)a1 + 2) = 127;
    a1[10] = a3;
    a1[11] = a4;
    a1[12] = a5;
    a1[13] = a6;
    a1[14] = a7;
    a1[15] = a8;
    a1[16] = a9;
    a1[17] = a10;
    a1[18] = a11;
    unsigned __int16 v20 = crc_16_l_table[a1[6] ^ 0xBCLL];
    unsigned __int16 v21 = crc_16_l_table[a1[7] ^ 0xF6 ^ v20];
    unsigned __int16 v22 = crc_16_l_table[(a1[8] ^ v21 ^ HIBYTE(v20))];
    unsigned __int16 v23 = crc_16_l_table[(a1[9] ^ v22 ^ HIBYTE(v21))];
    unsigned __int16 v24 = crc_16_l_table[(a3 ^ v23 ^ HIBYTE(v22))];
    unsigned __int16 v25 = crc_16_l_table[(a4 ^ v24 ^ HIBYTE(v23))];
    unsigned __int16 v26 = crc_16_l_table[(a5 ^ v25 ^ HIBYTE(v24))];
    unsigned __int16 v27 = crc_16_l_table[(a6 ^ v26 ^ HIBYTE(v25))];
    unsigned __int16 v28 = crc_16_l_table[(a7 ^ v27 ^ HIBYTE(v26))];
    unsigned __int16 v29 = crc_16_l_table[(a8 ^ v28 ^ HIBYTE(v27))];
    unsigned __int16 v30 = crc_16_l_table[(a9 ^ v29 ^ HIBYTE(v28))];
    uint64_t v31 = (a10 ^ v30 ^ HIBYTE(v29));
    unsigned int v32 = crc_16_l_table[v31];
    unsigned __int16 v33 = crc_16_l_table[(v32 ^ HIBYTE(v30) ^ a11)];
    *(_WORD *)(a1 + 19) = v33 ^ ~HIBYTE(crc_16_l_table[v31]);
    if (a2 >= 42)
    {
      bzero(__src, 0x800uLL);
      int v34 = *a1;
      if ((v34 - 125) > 1)
      {
        unsigned int v35 = 0;
      }
      else
      {
        __src[0] = 125;
        LOBYTE(v34) = v34 ^ 0x20;
        unsigned int v35 = 1;
      }
      __src[v35] = v34;
      uint64_t v36 = v35 + 1;
      int v37 = a1[1];
      if ((v37 - 125) <= 1)
      {
        __src[v36] = 125;
        LODWORD(v36) = v35 | 2;
        LOBYTE(v37) = v37 ^ 0x20;
      }
      __src[v36] = v37;
      uint64_t v38 = v36 + 1;
      int v39 = a1[2];
      if ((v39 - 125) <= 1)
      {
        __src[v38] = 125;
        LOBYTE(v39) = v39 ^ 0x20;
        LODWORD(v38) = v36 + 2;
      }
      __src[v38] = v39;
      uint64_t v40 = v38 + 1;
      int v41 = a1[3];
      if ((v41 - 125) <= 1)
      {
        __src[v40] = 125;
        LODWORD(v40) = v38 + 2;
        LOBYTE(v41) = v41 ^ 0x20;
      }
      __src[v40] = v41;
      uint64_t v42 = v40 + 1;
      int v43 = a1[4];
      if ((v43 - 125) <= 1)
      {
        __src[v42] = 125;
        LOBYTE(v43) = v43 ^ 0x20;
        LODWORD(v42) = v40 + 2;
      }
      __src[v42] = v43;
      uint64_t v44 = v42 + 1;
      int v45 = a1[5];
      if ((v45 - 125) <= 1)
      {
        __src[v44] = 125;
        LODWORD(v44) = v42 + 2;
        LOBYTE(v45) = v45 ^ 0x20;
      }
      __src[v44] = v45;
      uint64_t v46 = v44 + 1;
      int v47 = a1[6];
      if ((v47 - 125) <= 1)
      {
        __src[v46] = 125;
        LOBYTE(v47) = v47 ^ 0x20;
        LODWORD(v46) = v44 + 2;
      }
      __src[v46] = v47;
      uint64_t v48 = v46 + 1;
      int v49 = a1[7];
      if ((v49 - 125) <= 1)
      {
        __src[v48] = 125;
        LODWORD(v48) = v46 + 2;
        LOBYTE(v49) = v49 ^ 0x20;
      }
      __src[v48] = v49;
      uint64_t v50 = v48 + 1;
      int v51 = a1[8];
      if ((v51 - 125) <= 1)
      {
        __src[v50] = 125;
        LOBYTE(v51) = v51 ^ 0x20;
        LODWORD(v50) = v48 + 2;
      }
      __src[v50] = v51;
      uint64_t v52 = v50 + 1;
      int v53 = a1[9];
      if ((v53 - 125) <= 1)
      {
        __src[v52] = 125;
        LODWORD(v52) = v50 + 2;
        LOBYTE(v53) = v53 ^ 0x20;
      }
      __src[v52] = v53;
      uint64_t v54 = v52 + 1;
      int v55 = a1[10];
      if ((v55 - 125) <= 1)
      {
        __src[v54] = 125;
        LOBYTE(v55) = v55 ^ 0x20;
        LODWORD(v54) = v52 + 2;
      }
      __src[v54] = v55;
      uint64_t v56 = v54 + 1;
      int v57 = a1[11];
      if ((v57 - 125) <= 1)
      {
        __src[v56] = 125;
        LODWORD(v56) = v54 + 2;
        LOBYTE(v57) = v57 ^ 0x20;
      }
      __src[v56] = v57;
      uint64_t v58 = v56 + 1;
      int v59 = a1[12];
      if ((v59 - 125) <= 1)
      {
        __src[v58] = 125;
        LOBYTE(v59) = v59 ^ 0x20;
        LODWORD(v58) = v56 + 2;
      }
      __src[v58] = v59;
      uint64_t v60 = v58 + 1;
      int v61 = a1[13];
      if ((v61 - 125) <= 1)
      {
        __src[v60] = 125;
        LODWORD(v60) = v58 + 2;
        LOBYTE(v61) = v61 ^ 0x20;
      }
      __src[v60] = v61;
      uint64_t v62 = v60 + 1;
      int v63 = a1[14];
      if ((v63 - 125) <= 1)
      {
        __src[v62] = 125;
        LOBYTE(v63) = v63 ^ 0x20;
        LODWORD(v62) = v60 + 2;
      }
      __src[v62] = v63;
      uint64_t v64 = v62 + 1;
      int v65 = a1[15];
      if ((v65 - 125) <= 1)
      {
        __src[v64] = 125;
        LODWORD(v64) = v62 + 2;
        LOBYTE(v65) = v65 ^ 0x20;
      }
      __src[v64] = v65;
      uint64_t v66 = v64 + 1;
      int v67 = a1[16];
      if ((v67 - 125) <= 1)
      {
        __src[v66] = 125;
        LODWORD(v66) = v64 + 2;
        LOBYTE(v67) = v67 ^ 0x20;
      }
      __src[v66] = v67;
      uint64_t v68 = v66 + 1;
      int v69 = a1[17];
      if ((v69 - 125) <= 1)
      {
        __src[v68] = 125;
        LOBYTE(v69) = v69 ^ 0x20;
        LODWORD(v68) = v66 + 2;
      }
      int v70 = ~(v33 ^ BYTE1(v32));
      __src[v68] = v69;
      uint64_t v71 = v68 + 1;
      int v72 = a1[18];
      if ((v72 - 125) <= 1)
      {
        __src[v71] = 125;
        LOBYTE(v72) = v72 ^ 0x20;
        LODWORD(v71) = v68 + 2;
      }
      int v73 = ((unsigned __int16)(v33 ^ ~(unsigned __int16)(v32 >> 8)) >> 8);
      __src[v71] = v72;
      uint64_t v74 = v71 + 1;
      if ((v70 - 125) <= 1)
      {
        __src[v74] = 125;
        LOBYTE(v70) = v70 ^ 0x20;
        LODWORD(v74) = v71 + 2;
      }
      __src[v74] = v70;
      uint64_t v75 = v74 + 1;
      if ((v73 - 125) <= 1)
      {
        __src[v75] = 125;
        LOBYTE(v73) = v73 ^ 0x20;
        LODWORD(v75) = v74 + 2;
      }
      __src[v75] = v73;
      memcpy(a1, __src, v75 + 1);
      uint64_t result = (v75 + 2);
      a1[v75 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_EVDO_DEMOD_FWD_WITH_NO_REV(unsigned __int8 *a1, int a2, unsigned __int8 a3, unsigned __int8 a4, unsigned __int8 a5, unsigned __int8 a6, unsigned __int8 a7, unsigned __int8 a8, char a9, char a10)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x35)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 527179;
    *((_WORD *)a1 + 2) = 122;
    a1[10] = a3;
    a1[11] = a4;
    a1[12] = a5;
    a1[13] = a6;
    a1[14] = a7;
    a1[15] = a8;
    a1[16] = a9;
    a1[17] = a10;
    unsigned __int16 v19 = crc_16_l_table[a1[6] ^ 4];
    unsigned __int16 v20 = crc_16_l_table[(a1[7] ^ v19) ^ 0x88];
    unsigned __int16 v21 = crc_16_l_table[(a1[8] ^ v20 ^ HIBYTE(v19))];
    unsigned __int16 v22 = crc_16_l_table[(a1[9] ^ v21 ^ HIBYTE(v20))];
    unsigned __int16 v23 = crc_16_l_table[(a3 ^ v22 ^ HIBYTE(v21))];
    unsigned __int16 v24 = crc_16_l_table[(a4 ^ v23 ^ HIBYTE(v22))];
    unsigned __int16 v25 = crc_16_l_table[(a5 ^ v24 ^ HIBYTE(v23))];
    unsigned __int16 v26 = crc_16_l_table[(a6 ^ v25 ^ HIBYTE(v24))];
    unsigned __int16 v27 = crc_16_l_table[(a7 ^ v26 ^ HIBYTE(v25))];
    unsigned __int16 v28 = crc_16_l_table[(a8 ^ v27 ^ HIBYTE(v26))];
    unsigned int v29 = crc_16_l_table[(a9 ^ v28 ^ HIBYTE(v27))];
    unsigned __int16 v30 = crc_16_l_table[(v29 ^ HIBYTE(v28) ^ a10)];
    *((_WORD *)a1 + 9) = v30 ^ ~HIBYTE(crc_16_l_table[(a9 ^ v28 ^ HIBYTE(v27))]);
    if (a2 >= 40)
    {
      bzero(v71, 0x800uLL);
      int v31 = *a1;
      if ((v31 - 125) > 1)
      {
        unsigned int v32 = 0;
      }
      else
      {
        v71[0] = 125;
        LOBYTE(v31) = v31 ^ 0x20;
        unsigned int v32 = 1;
      }
      v71[v32] = v31;
      uint64_t v33 = v32 + 1;
      int v34 = a1[1];
      if ((v34 - 125) <= 1)
      {
        v71[v33] = 125;
        LODWORD(v33) = v32 | 2;
        LOBYTE(v34) = v34 ^ 0x20;
      }
      v71[v33] = v34;
      uint64_t v35 = v33 + 1;
      int v36 = a1[2];
      if ((v36 - 125) <= 1)
      {
        v71[v35] = 125;
        LOBYTE(v36) = v36 ^ 0x20;
        LODWORD(v35) = v33 + 2;
      }
      v71[v35] = v36;
      uint64_t v37 = v35 + 1;
      int v38 = a1[3];
      if ((v38 - 125) <= 1)
      {
        v71[v37] = 125;
        LODWORD(v37) = v35 + 2;
        LOBYTE(v38) = v38 ^ 0x20;
      }
      v71[v37] = v38;
      uint64_t v39 = v37 + 1;
      int v40 = a1[4];
      if ((v40 - 125) <= 1)
      {
        v71[v39] = 125;
        LOBYTE(v40) = v40 ^ 0x20;
        LODWORD(v39) = v37 + 2;
      }
      v71[v39] = v40;
      uint64_t v41 = v39 + 1;
      int v42 = a1[5];
      if ((v42 - 125) <= 1)
      {
        v71[v41] = 125;
        LODWORD(v41) = v39 + 2;
        LOBYTE(v42) = v42 ^ 0x20;
      }
      v71[v41] = v42;
      uint64_t v43 = v41 + 1;
      int v44 = a1[6];
      if ((v44 - 125) <= 1)
      {
        v71[v43] = 125;
        LOBYTE(v44) = v44 ^ 0x20;
        LODWORD(v43) = v41 + 2;
      }
      v71[v43] = v44;
      uint64_t v45 = v43 + 1;
      int v46 = a1[7];
      if ((v46 - 125) <= 1)
      {
        v71[v45] = 125;
        LODWORD(v45) = v43 + 2;
        LOBYTE(v46) = v46 ^ 0x20;
      }
      v71[v45] = v46;
      uint64_t v47 = v45 + 1;
      int v48 = a1[8];
      if ((v48 - 125) <= 1)
      {
        v71[v47] = 125;
        LOBYTE(v48) = v48 ^ 0x20;
        LODWORD(v47) = v45 + 2;
      }
      v71[v47] = v48;
      uint64_t v49 = v47 + 1;
      int v50 = a1[9];
      if ((v50 - 125) <= 1)
      {
        v71[v49] = 125;
        LODWORD(v49) = v47 + 2;
        LOBYTE(v50) = v50 ^ 0x20;
      }
      v71[v49] = v50;
      uint64_t v51 = v49 + 1;
      int v52 = a1[10];
      if ((v52 - 125) <= 1)
      {
        v71[v51] = 125;
        LOBYTE(v52) = v52 ^ 0x20;
        LODWORD(v51) = v49 + 2;
      }
      v71[v51] = v52;
      uint64_t v53 = v51 + 1;
      int v54 = a1[11];
      if ((v54 - 125) <= 1)
      {
        v71[v53] = 125;
        LODWORD(v53) = v51 + 2;
        LOBYTE(v54) = v54 ^ 0x20;
      }
      v71[v53] = v54;
      uint64_t v55 = v53 + 1;
      int v56 = a1[12];
      if ((v56 - 125) <= 1)
      {
        v71[v55] = 125;
        LOBYTE(v56) = v56 ^ 0x20;
        LODWORD(v55) = v53 + 2;
      }
      v71[v55] = v56;
      uint64_t v57 = v55 + 1;
      int v58 = a1[13];
      if ((v58 - 125) <= 1)
      {
        v71[v57] = 125;
        LODWORD(v57) = v55 + 2;
        LOBYTE(v58) = v58 ^ 0x20;
      }
      v71[v57] = v58;
      uint64_t v59 = v57 + 1;
      int v60 = a1[14];
      if ((v60 - 125) <= 1)
      {
        v71[v59] = 125;
        LOBYTE(v60) = v60 ^ 0x20;
        LODWORD(v59) = v57 + 2;
      }
      v71[v59] = v60;
      uint64_t v61 = v59 + 1;
      int v62 = a1[15];
      if ((v62 - 125) <= 1)
      {
        v71[v61] = 125;
        LODWORD(v61) = v59 + 2;
        LOBYTE(v62) = v62 ^ 0x20;
      }
      v71[v61] = v62;
      uint64_t v63 = v61 + 1;
      int v64 = a1[16];
      if ((v64 - 125) <= 1)
      {
        v71[v63] = 125;
        LOBYTE(v64) = v64 ^ 0x20;
        LODWORD(v63) = v61 + 2;
      }
      int v65 = ~(v30 ^ BYTE1(v29));
      v71[v63] = v64;
      uint64_t v66 = v63 + 1;
      int v67 = a1[17];
      if ((v67 - 125) <= 1)
      {
        v71[v66] = 125;
        LOBYTE(v67) = v67 ^ 0x20;
        LODWORD(v66) = v63 + 2;
      }
      int v68 = ((unsigned __int16)(v30 ^ ~(unsigned __int16)(v29 >> 8)) >> 8);
      v71[v66] = v67;
      uint64_t v69 = v66 + 1;
      if ((v65 - 125) <= 1)
      {
        v71[v69] = 125;
        LOBYTE(v65) = v65 ^ 0x20;
        LODWORD(v69) = v66 + 2;
      }
      v71[v69] = v65;
      uint64_t v70 = v69 + 1;
      if ((v68 - 125) <= 1)
      {
        v71[v70] = 125;
        LOBYTE(v68) = v68 ^ 0x20;
        LODWORD(v70) = v69 + 2;
      }
      v71[v70] = v68;
      memcpy(a1, v71, v70 + 1);
      uint64_t result = (v70 + 2);
      a1[v70 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_EVDO_REV_A_MOD_TRA(char *a1, int a2, char a3, char a4, char a5, char a6, char a7, char a8, char a9, char a10, char a11, char a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,char a21,char a22,char a23,char a24,char a25,char a26,char a27,char a28,char a29,char a30)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x3D)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 527179;
    *((_WORD *)a1 + 2) = 126;
    a1[6] = 42;
    a1[10] = a3;
    a1[11] = a4;
    a1[12] = a5;
    a1[13] = a6;
    a1[14] = a7;
    a1[15] = a8;
    a1[16] = a9;
    a1[17] = a10;
    a1[18] = a11;
    a1[19] = a12;
    a1[20] = a13;
    a1[21] = a14;
    *(_DWORD *)(a1 + 22) = a15;
    *(_DWORD *)(a1 + 26) = a16;
    *(_DWORD *)(a1 + 30) = a17;
    *(_DWORD *)(a1 + 34) = a18;
    *(_DWORD *)(a1 + 38) = a19;
    a1[42] = a20;
    a1[43] = a21;
    a1[44] = a22;
    a1[45] = a23;
    a1[46] = a24;
    a1[47] = a25;
    a1[48] = a26;
    a1[49] = a27;
    a1[50] = a28;
    a1[51] = a29;
    int v38 = 424;
    a1[52] = a30;
    LOWORD(v39) = -1;
    int v40 = a1;
    do
    {
      char v41 = *v40++;
      int v39 = crc_16_l_table[(v41 ^ v39)] ^ ((unsigned __int16)(v39 & 0xFF00) >> 8);
      v38 -= 8;
    }
    while ((_WORD)v38);
    *(_WORD *)(a1 + 53) = ~(_WORD)v39;
    if (a2 >= 110)
    {
      bzero(__src, 0x800uLL);
      uint64_t v42 = 0;
      LODWORD(v43) = 0;
      do
      {
        while (1)
        {
          int v45 = a1[v42];
          if ((v45 - 125) > 1) {
            break;
          }
          int v44 = v43 + 1;
          __src[(int)v43] = 125;
          __src[(int)v43 + 1] = v45 ^ 0x20;
          size_t v43 = (int)v43 + 1 + 1;
          if (++v42 == 55) {
            goto LABEL_11;
          }
        }
        int v44 = v43;
        __src[(int)v43] = v45;
        size_t v43 = (int)v43 + 1;
        ++v42;
      }
      while (v42 != 55);
LABEL_11:
      memcpy(a1, __src, v43);
      uint64_t result = (v44 + 2);
      a1[v43] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_EVDO_MOD_REVERSE_TRA(char *a1, int a2, char a3, char a4, char a5, char a6, char a7, char a8, char a9, char a10, char a11, char a12, char a13, char a14, char a15, char a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,char a25)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x3B)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 527179;
    *((_WORD *)a1 + 2) = 117;
    a1[6] = 47;
    a1[10] = a3;
    a1[11] = a4;
    a1[12] = a5;
    a1[13] = a6;
    a1[14] = a7;
    a1[15] = a8;
    a1[16] = a9;
    a1[17] = a10;
    a1[18] = a11;
    a1[19] = a12;
    a1[20] = a13;
    a1[21] = a14;
    a1[22] = a15;
    a1[23] = a16;
    a1[24] = a17;
    a1[25] = a18;
    *(_DWORD *)(a1 + 26) = a19;
    *(_DWORD *)(a1 + 30) = a20;
    *(_DWORD *)(a1 + 34) = a21;
    *(_DWORD *)(a1 + 38) = a22;
    *(_DWORD *)(a1 + 42) = a23;
    a1[46] = a24;
    int v33 = 384;
    a1[47] = a25;
    LOWORD(v34) = -1;
    uint64_t v35 = a1;
    do
    {
      char v36 = *v35++;
      int v34 = crc_16_l_table[(v36 ^ v34)] ^ ((unsigned __int16)(v34 & 0xFF00) >> 8);
      v33 -= 8;
    }
    while ((_WORD)v33);
    *((_WORD *)a1 + 24) = ~(_WORD)v34;
    if (a2 >= 100)
    {
      bzero(__src, 0x800uLL);
      uint64_t v37 = 0;
      LODWORD(v38) = 0;
      do
      {
        while (1)
        {
          int v40 = a1[v37];
          if ((v40 - 125) > 1) {
            break;
          }
          int v39 = v38 + 1;
          __src[(int)v38] = 125;
          __src[(int)v38 + 1] = v40 ^ 0x20;
          size_t v38 = (int)v38 + 1 + 1;
          if (++v37 == 50) {
            goto LABEL_11;
          }
        }
        int v39 = v38;
        __src[(int)v38] = v40;
        size_t v38 = (int)v38 + 1;
        ++v37;
      }
      while (v37 != 50);
LABEL_11:
      memcpy(a1, __src, v38);
      uint64_t result = (v39 + 2);
      a1[v38] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_EVDO_CMD_RELEASE(unsigned __int8 *a1, int a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x33)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 527179;
    a1[4] = 118;
    a1[6] = 10;
    uint64_t v5 = a1[5];
    unsigned __int16 v6 = crc_16_l_table[crc_16_l_table[v5 ^ 0x20] ^ 0xAC];
    unsigned __int16 v7 = crc_16_l_table[(a1[7] ^ v6 ^ HIBYTE(crc_16_l_table[v5 ^ 0x20]))];
    unsigned int v8 = crc_16_l_table[(a1[8] ^ v7 ^ HIBYTE(v6))];
    unsigned __int16 v9 = crc_16_l_table[(a1[9] ^ v8 ^ HIBYTE(v7))];
    *((_WORD *)a1 + 5) = v9 ^ ~HIBYTE(crc_16_l_table[(a1[8] ^ v7 ^ HIBYTE(v6))]);
    if (a2 >= 24)
    {
      bzero(v24, 0x7FBuLL);
      int __src = 527179;
      char v23 = 118;
      if ((v5 - 125) > 1)
      {
        unsigned int v10 = 5;
      }
      else
      {
        v24[0] = 125;
        unsigned int v10 = 6;
        LOBYTE(v5) = v5 ^ 0x20;
      }
      unsigned __int16 v11 = (char *)&__src + v10;
      *unsigned __int16 v11 = v5;
      v11[1] = 10;
      uint64_t v12 = v10 + 2;
      int v13 = a1[7];
      if ((v13 - 125) <= 1)
      {
        *((unsigned char *)&__src + v12) = 125;
        LODWORD(v12) = v10 + 3;
        LOBYTE(v13) = v13 ^ 0x20;
      }
      *((unsigned char *)&__src + v12) = v13;
      uint64_t v14 = v12 + 1;
      int v15 = a1[8];
      if ((v15 - 125) <= 1)
      {
        *((unsigned char *)&__src + v14) = 125;
        LOBYTE(v15) = v15 ^ 0x20;
        LODWORD(v14) = v12 + 2;
      }
      int v16 = ~(v9 ^ BYTE1(v8));
      *((unsigned char *)&__src + v14) = v15;
      uint64_t v17 = v14 + 1;
      int v18 = a1[9];
      if ((v18 - 125) <= 1)
      {
        *((unsigned char *)&__src + v17) = 125;
        LOBYTE(v18) = v18 ^ 0x20;
        LODWORD(v17) = v14 + 2;
      }
      int v19 = ((unsigned __int16)(v9 ^ ~(unsigned __int16)(v8 >> 8)) >> 8);
      *((unsigned char *)&__src + v17) = v18;
      uint64_t v20 = v17 + 1;
      if ((v16 - 125) <= 1)
      {
        *((unsigned char *)&__src + v20) = 125;
        LOBYTE(v16) = v16 ^ 0x20;
        LODWORD(v20) = v17 + 2;
      }
      *((unsigned char *)&__src + v20) = v16;
      uint64_t v21 = v20 + 1;
      if ((v19 - 125) <= 1)
      {
        *((unsigned char *)&__src + v21) = 125;
        LOBYTE(v19) = v19 ^ 0x20;
        LODWORD(v21) = v20 + 2;
      }
      *((unsigned char *)&__src + v21) = v19;
      memcpy(a1, &__src, v21 + 1);
      uint64_t result = (v21 + 2);
      a1[v21 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_SetPA_DCDC_Levels(unsigned __int8 *a1, int a2, __int16 a3, __int16 a4)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x11)
  {
    bzero(a1, a2);
    *(_WORD *)a1 = 2891;
    int v9 = gModeId;
    a1[2] = gModeId;
    int v10 = HIBYTE(gModeId);
    a1[3] = HIBYTE(gModeId);
    *((_WORD *)a1 + 2) = 183;
    *((_WORD *)a1 + 3) = a3;
    char v11 = HIBYTE(a3);
    *((_WORD *)a1 + 4) = a4;
    char v12 = HIBYTE(a4);
    int v13 = crc_16_l_table[crc_16_l_table[v9 ^ 0xA5] ^ v10 ^ 0xEC];
    unsigned __int16 v14 = crc_16_l_table[crc_16_l_table[v13 ^ HIBYTE(crc_16_l_table[v9 ^ 0xA5]) ^ 0xB7] ^ HIBYTE(crc_16_l_table[crc_16_l_table[v9 ^ 0xA5] ^ v10 ^ 0xEC])];
    unsigned __int16 v15 = crc_16_l_table[(v14 ^ HIBYTE(crc_16_l_table[v13 ^ HIBYTE(crc_16_l_table[v9 ^ 0xA5]) ^ 0xB7]) ^ a3)];
    unsigned int v16 = crc_16_l_table[(HIBYTE(a3) ^ v15 ^ HIBYTE(v14))];
    unsigned int v17 = crc_16_l_table[(a4 ^ v16 ^ HIBYTE(v15))];
    int v18 = crc_16_l_table[HIBYTE(a4) ^ crc_16_l_table[(a4 ^ v16 ^ HIBYTE(v15))] ^ (v16 >> 8)];
    *((_WORD *)a1 + 5) = v18 ^ ~HIBYTE(crc_16_l_table[(a4 ^ v16 ^ HIBYTE(v15))]);
    if (a2 >= 24)
    {
      int v36 = v18 ^ ~(v17 >> 8);
      bzero(__src, 0x800uLL);
      int v19 = *a1;
      if ((v19 - 125) > 1)
      {
        unsigned int v20 = 0;
      }
      else
      {
        __src[0] = 125;
        LOBYTE(v19) = v19 ^ 0x20;
        unsigned int v20 = 1;
      }
      __src[v20] = v19;
      uint64_t v21 = v20 + 1;
      int v22 = a1[1];
      if ((v22 - 125) <= 1)
      {
        __src[v21] = 125;
        LODWORD(v21) = v20 | 2;
        LOBYTE(v22) = v22 ^ 0x20;
      }
      __src[v21] = v22;
      uint64_t v23 = v21 + 1;
      if ((v9 - 125) <= 1)
      {
        __src[v23] = 125;
        LOBYTE(v9) = v9 ^ 0x20;
        LODWORD(v23) = v21 + 2;
      }
      char v24 = a3;
      __src[v23] = v9;
      uint64_t v25 = v23 + 1;
      if ((v10 - 125) <= 1)
      {
        __src[v25] = 125;
        LODWORD(v25) = v23 + 2;
        LOBYTE(v10) = v10 ^ 0x20;
      }
      unsigned __int16 v26 = &__src[v25];
      *unsigned __int16 v26 = v10;
      *(_WORD *)(v26 + 1) = 183;
      uint64_t v27 = v25 + 3;
      if (a3 - 125 <= 1)
      {
        __src[v27] = 125;
        char v24 = a3 ^ 0x20;
        LODWORD(v27) = v25 + 4;
      }
      char v28 = a4;
      __src[v27] = v24;
      uint64_t v29 = v27 + 1;
      if (HIBYTE(a3) - 125 <= 1)
      {
        __src[v29] = 125;
        LODWORD(v29) = v27 + 2;
        char v11 = HIBYTE(a3) ^ 0x20;
      }
      __src[v29] = v11;
      uint64_t v30 = v29 + 1;
      if (a4 - 125 <= 1)
      {
        __src[v30] = 125;
        char v28 = a4 ^ 0x20;
        LODWORD(v30) = v29 + 2;
      }
      int v31 = ~(v18 ^ BYTE1(v17));
      __src[v30] = v28;
      uint64_t v32 = v30 + 1;
      if (HIBYTE(a4) - 125 <= 1)
      {
        __src[v32] = 125;
        char v12 = HIBYTE(a4) ^ 0x20;
        LODWORD(v32) = v30 + 2;
      }
      char v33 = (unsigned __int16)(v18 ^ ~(unsigned __int16)(v17 >> 8)) >> 8;
      __src[v32] = v12;
      uint64_t v34 = v32 + 1;
      if ((v31 - 125) <= 1)
      {
        __src[v34] = 125;
        LOBYTE(v31) = v31 ^ 0x20;
        LODWORD(v34) = v32 + 2;
      }
      __src[v34] = v31;
      uint64_t v35 = v34 + 1;
      if (BYTE1(v36) - 125 <= 1)
      {
        __src[v35] = 125;
        char v33 = BYTE1(v36) ^ 0x20;
        LODWORD(v35) = v34 + 2;
      }
      __src[v35] = v33;
      memcpy(a1, __src, v35 + 1);
      uint64_t result = (v35 + 2);
      a1[v35 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_TX_RX_FREQ_CAL_SWEEP(char *a1, int a2, char *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0x5D2) {
    return result;
  }
  bzero(a1, a2);
  *(void *)a1 = 0xA8008200140B4BLL;
  *((_WORD *)a1 + 4) = 12;
  a1[10] = *a3;
  a1[11] = a3[1];
  a1[12] = a3[2];
  a1[13] = a3[3];
  a1[14] = a3[4];
  a1[15] = a3[5];
  if (a3[2])
  {
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    do
    {
      uint64_t v9 = (uint64_t)&a3[2 * v8 + 6];
      int v10 = &a1[v7];
      v10[16] = *(_WORD *)v9;
      v10[17] = *(unsigned char *)(v9 + 1);
      ++v8;
      v7 += 2;
    }
    while (v8 < a3[2]);
    LODWORD(v11) = v7 + 16;
    if (!a3[3]) {
      goto LABEL_26;
    }
LABEL_9:
    unint64_t v12 = 0;
    uint64_t v11 = v11;
    uint64_t v13 = ((v11 + 2) & 0x1FFFFFFFELL) - 1;
    uint64_t v14 = v11 | 1;
    do
    {
      uint64_t v15 = (uint64_t)&a3[2 * v12 + 38];
      a1[v11] = *(_WORD *)v15;
      a1[v14] = *(unsigned char *)(v15 + 1);
      v11 += 2;
      ++v12;
      v13 += 2;
      v14 += 2;
    }
    while (v12 < a3[3]);
    if (a3[3])
    {
      unint64_t v16 = 0;
      do
      {
        uint64_t v17 = (uint64_t)&a3[2 * v16 + 78];
        a1[v11] = *(_WORD *)v17;
        v11 += 2;
        a1[v13] = *(unsigned char *)(v17 + 1);
        ++v16;
        v13 += 2;
      }
      while (v16 < a3[3]);
      if (a3[3])
      {
        unint64_t v18 = 0;
        int v19 = &a1[v11];
        do
        {
          *v19++ = a3[v18++ + 118];
          LODWORD(v11) = v11 + 1;
        }
        while (v18 < a3[3]);
        if (a3[3])
        {
          unint64_t v20 = 0;
          do
          {
            *v19++ = a3[v20++ + 138];
            LODWORD(v11) = v11 + 1;
          }
          while (v20 < a3[3]);
          if (a3[3])
          {
            unint64_t v21 = 0;
            do
            {
              *v19++ = a3[v21++ + 158];
              LODWORD(v11) = v11 + 1;
            }
            while (v21 < a3[3]);
            if (a3[3])
            {
              unint64_t v22 = 0;
              do
              {
                *v19++ = a3[v22++ + 178];
                LODWORD(v11) = v11 + 1;
              }
              while (v22 < a3[3]);
            }
          }
        }
      }
    }
    goto LABEL_26;
  }
  LODWORD(v11) = 16;
  if (a3[3]) {
    goto LABEL_9;
  }
LABEL_26:
  int v23 = 8 * v11;
  if (((8 * v11) & 0xFFF8) != 0)
  {
    LOWORD(v24) = -1;
    uint64_t v25 = a1;
    do
    {
      char v26 = *v25++;
      int v24 = crc_16_l_table[(v26 ^ v24)] ^ ((unsigned __int16)(v24 & 0xFF00) >> 8);
      v23 -= 8;
    }
    while ((_WORD)v23);
    *(_WORD *)&a1[(int)v11] = ~(_WORD)v24;
    uint64_t result = 0xFFFFFFFFLL;
    if ((int)v11 > 1022) {
      return result;
    }
  }
  else
  {
    uint64_t v27 = &a1[(int)v11];
    *uint64_t v27 = 0;
    v27[1] = 0;
    uint64_t result = 0xFFFFFFFFLL;
    if ((int)v11 > 1022) {
      return result;
    }
  }
  uint64_t v28 = (v11 + 2);
  if (2 * (int)v28 <= a2)
  {
    bzero(__src, 0x800uLL);
    if ((int)v11 < -1)
    {
      int v29 = 0;
    }
    else
    {
      int v29 = 0;
      uint64_t v30 = (unsigned __int8 *)a1;
      do
      {
        int v32 = *v30++;
        char v31 = v32;
        if ((v32 - 125) <= 1)
        {
          __src[v29] = 125;
          v31 ^= 0x20u;
          ++v29;
        }
        __src[v29++] = v31;
        --v28;
      }
      while (v28);
    }
    memcpy(a1, __src, v29);
    uint64_t result = (v29 + 1);
    a1[v29] = 126;
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_TX_RX_FREQ_CAL_SWEEP_PARSE(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(unsigned __int8 *)(a3 + 2);
  int v4 = *(unsigned __int8 *)(a3 + 3);
  if (*(unsigned char *)(a3 + 2)) {
    _ZF = v4 == 0;
  }
  else {
    _ZF = 1;
  }
  if (!_ZF)
  {
    uint64_t v6 = 0;
    int v7 = 2 * v4;
    if ((2 * v4) <= 2) {
      unsigned int v8 = 2;
    }
    else {
      unsigned int v8 = 2 * v4;
    }
    uint64_t v9 = ((v8 - 1) >> 1) + 1;
    int v10 = 6 * v4 + (v7 + 2) * v3;
    unsigned int v11 = v10 + 22;
    int v12 = 2 * v4;
    unint64_t v13 = (((v8 - 1) >> 1) + 1) & 0xF;
    if (((((v8 - 1) >> 1) + 1) & 0xF) == 0) {
      unint64_t v13 = 16;
    }
    if (((((v8 - 1) >> 1) + 1) & 7) != 0) {
      uint64_t v14 = (((v8 - 1) >> 1) + 1) & 7;
    }
    else {
      uint64_t v14 = 8;
    }
    uint64_t v15 = v9 - v14;
    uint64_t v16 = 2 * (v9 - v14);
    int v17 = v10 + 23;
    unint64_t v18 = ~(((unint64_t)(v8 - 2) + 1) >> 1);
    unint64_t v19 = v18 + v14;
    unint64_t v20 = (int8x16_t *)(a3 + 838);
    unsigned int v21 = v11;
    do
    {
      if (v8 >= 0x11)
      {
        uint64_t v22 = 0;
        uint64_t v24 = a3 + 838 + 40 * v6 - a1;
        if (v24 - (unint64_t)(v11 + v12 * v6) < 0x20)
        {
          uint64_t v23 = 0;
        }
        else
        {
          unint64_t v25 = v24 - ((v11 | 1) + v12 * v6);
          uint64_t v23 = 0;
          if (v25 >= 0x20)
          {
            if (v8 >= 0x21)
            {
              unint64_t v27 = v18 + v13;
              int v28 = v17;
              int v29 = v20;
              uint64_t v30 = (const char *)(a1 + v21);
              do
              {
                char v31 = (const char *)(a1 + v28);
                _Q0 = (unsigned __int128)vld2q_s8(v31);
                unsigned long long v33 = (unsigned __int128)vld2q_s8(v30);
                v30 += 32;
                __asm { SHLL2           V4.8H, V0.16B, #8 }
                int8x16_t *v29 = vorrq_s8((int8x16_t)vshll_n_s8(*(int8x8_t *)&_Q0, 8uLL), (int8x16_t)vmovl_u8(*(uint8x8_t *)&v33));
                v29[1] = vorrq_s8(_Q4, (int8x16_t)vmovl_high_u8((uint8x16_t)v33));
                v29 += 2;
                v28 += 32;
                v27 += 16;
              }
              while (v27);
              uint64_t v26 = v9 - v13;
              uint64_t v22 = 2 * (v9 - v13);
              uint64_t v23 = v9 - v13;
              if (v13 < 9) {
                goto LABEL_27;
              }
            }
            else
            {
              uint64_t v26 = 0;
            }
            uint64_t v38 = 2 * v26;
            uint64_t v39 = v19 + v26;
            int v40 = v17 + 2 * v26;
            do
            {
              char v41 = (const char *)(a1 + v40);
              int8x8_t v42 = (int8x8_t)*(_OWORD *)vld2_s8(v41).val;
              uint64_t v43 = (const char *)(a1 + v21 + v38);
              uint8x8_t v44 = (uint8x8_t)*(_OWORD *)vld2_s8(v43).val;
              *(int8x16_t *)((char *)v20 + v38) = vorrq_s8((int8x16_t)vshll_n_s8(v42, 8uLL), (int8x16_t)vmovl_u8(v44));
              v38 += 16;
              v40 += 16;
              v39 += 8;
            }
            while (v39);
            uint64_t v22 = v16;
            uint64_t v23 = v15;
          }
        }
      }
      else
      {
        uint64_t v22 = 0;
        uint64_t v23 = 0;
      }
LABEL_27:
      int v45 = (unsigned __int8 *)(a1 + v22 + v21);
      int v46 = v17 + v22;
      do
      {
        __int16 v47 = *v45;
        v45 += 2;
        v20->i16[v23] = v47 | (*(unsigned __int8 *)(a1 + v46) << 8);
        v46 += 2;
        ++v23;
      }
      while (v9 != v23);
      ++v6;
      v21 += v7;
      unint64_t v20 = (int8x16_t *)((char *)v20 + 40);
      v17 += v7;
    }
    while (v6 != v3);
  }
  return 0;
}

uint64_t APPLIB_DIAG_Get_TX_Power_Channel(_DWORD *a1, int a2, __int16 a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 9)
  {
    bzero(a1, a2);
    *a1 = 589131;
    int v7 = a3;
    *((_WORD *)a1 + 2) = a3;
    int v8 = HIBYTE(a3);
    unsigned int v9 = crc_16_l_table[a3 ^ 8];
    int v10 = crc_16_l_table[crc_16_l_table[a3 ^ 8] ^ HIBYTE(a3) ^ 0x68];
    int v11 = v10 ^ ~(v9 >> 8);
    *((unsigned char *)a1 + 6) = v10 ^ ~(v9 >> 8);
    int v12 = BYTE1(v11);
    *((unsigned char *)a1 + 7) = BYTE1(v11);
    if (a2 >= 0x10)
    {
      int v13 = v10 ^ (v9 >> 8);
      bzero(v20, 0x7FCuLL);
      int __src = 589131;
      if ((v7 - 125) > 1)
      {
        unsigned int v14 = 4;
      }
      else
      {
        v20[0] = 125;
        LOBYTE(v7) = v7 ^ 0x20;
        unsigned int v14 = 5;
      }
      int v15 = ~(_BYTE)v13;
      v20[v14 - 4] = v7;
      uint64_t v16 = v14 + 1;
      if ((v8 - 125) <= 1)
      {
        v20[v16 - 4] = 125;
        LODWORD(v16) = v14 | 2;
        LOBYTE(v8) = v8 ^ 0x20;
      }
      v20[v16 - 4] = v8;
      uint64_t v17 = v16 + 1;
      if ((v15 - 125) <= 1)
      {
        v20[v17 - 4] = 125;
        LOBYTE(v15) = v15 ^ 0x20;
        LODWORD(v17) = v16 + 2;
      }
      v20[v17 - 4] = v15;
      uint64_t v18 = v17 + 1;
      if ((v12 - 125) <= 1)
      {
        v20[v18 - 4] = 125;
        LOBYTE(v12) = v12 ^ 0x20;
        LODWORD(v18) = v17 + 2;
      }
      v20[v18 - 4] = v12;
      memcpy(a1, &__src, v18 + 1);
      uint64_t result = (v18 + 2);
      *((unsigned char *)a1 + v18 + 1) = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_GetPmicTherm(_DWORD *a1, int a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 5)
  {
    bzero(a1, a2);
    *a1 = 64843;
    *((_WORD *)a1 + 2) = 22839;
    if (a2 >= 0xC)
    {
      *a1 = 64843;
      *((_WORD *)a1 + 2) = 22839;
      *((unsigned char *)a1 + 6) = 126;
      return 7;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_CDMA2000_FTM_SET_REVERSE_LINK_POWER(char *a1, int a2, int a3, int a4)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x1F)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 461643;
    *((_WORD *)a1 + 2) = 140;
    *(_DWORD *)(a1 + 11) = a4;
    a1[10] = a3;
    uint64_t v9 = a1[6];
    unsigned __int16 v10 = crc_16_l_table[v9 ^ 0x25];
    unsigned __int16 v11 = crc_16_l_table[a1[7] ^ 0x12 ^ v10];
    unsigned __int16 v12 = crc_16_l_table[(a1[8] ^ v11 ^ HIBYTE(v10))];
    unsigned __int16 v13 = crc_16_l_table[(a1[9] ^ v12 ^ HIBYTE(v11))];
    unsigned __int16 v14 = crc_16_l_table[(v13 ^ HIBYTE(v12)) ^ a3];
    unsigned __int16 v15 = crc_16_l_table[(a4 ^ v14 ^ HIBYTE(v13))];
    unsigned __int16 v16 = crc_16_l_table[(a1[12] ^ v15 ^ HIBYTE(v14))];
    unsigned int v17 = crc_16_l_table[(a1[13] ^ v16 ^ HIBYTE(v15))];
    int v18 = crc_16_l_table[(a1[14] ^ v17 ^ HIBYTE(v16))];
    int v19 = v18 ^ ~(v17 >> 8);
    *(_WORD *)(a1 + 15) = v18 ^ ~HIBYTE(crc_16_l_table[(a1[13] ^ v16 ^ HIBYTE(v15))]);
    if (a2 >= 34)
    {
      bzero(__src, 0x800uLL);
      int v20 = *a1;
      if ((v20 - 125) > 1)
      {
        unsigned int v21 = 0;
      }
      else
      {
        __src[0] = 125;
        LOBYTE(v20) = v20 ^ 0x20;
        unsigned int v21 = 1;
      }
      __src[v21] = v20;
      uint64_t v22 = v21 + 1;
      int v23 = a1[1];
      if ((v23 - 125) <= 1)
      {
        __src[v22] = 125;
        LODWORD(v22) = v21 | 2;
        LOBYTE(v23) = v23 ^ 0x20;
      }
      __src[v22] = v23;
      uint64_t v24 = v22 + 1;
      int v25 = a1[2];
      if ((v25 - 125) <= 1)
      {
        __src[v24] = 125;
        LOBYTE(v25) = v25 ^ 0x20;
        LODWORD(v24) = v22 + 2;
      }
      __src[v24] = v25;
      uint64_t v26 = v24 + 1;
      int v27 = a1[3];
      if ((v27 - 125) <= 1)
      {
        __src[v26] = 125;
        LODWORD(v26) = v24 + 2;
        LOBYTE(v27) = v27 ^ 0x20;
      }
      __src[v26] = v27;
      uint64_t v28 = v26 + 1;
      int v29 = a1[4];
      if ((v29 - 125) <= 1)
      {
        __src[v28] = 125;
        LODWORD(v28) = v26 + 2;
        LOBYTE(v29) = v29 ^ 0x20;
      }
      uint64_t v30 = &__src[v28];
      *uint64_t v30 = v29;
      v30[1] = 0;
      uint64_t v31 = v28 + 2;
      if ((v9 - 125) <= 1)
      {
        __src[v31] = 125;
        LOBYTE(v9) = v9 ^ 0x20;
        LODWORD(v31) = v28 + 3;
      }
      __src[v31] = v9;
      uint64_t v32 = v31 + 1;
      int v33 = a1[7];
      if ((v33 - 125) <= 1)
      {
        __src[v32] = 125;
        LODWORD(v32) = v31 + 2;
        LOBYTE(v33) = v33 ^ 0x20;
      }
      __src[v32] = v33;
      uint64_t v34 = v32 + 1;
      int v35 = a1[8];
      if ((v35 - 125) <= 1)
      {
        __src[v34] = 125;
        LOBYTE(v35) = v35 ^ 0x20;
        LODWORD(v34) = v32 + 2;
      }
      __src[v34] = v35;
      uint64_t v36 = v34 + 1;
      int v37 = a1[9];
      if ((v37 - 125) <= 1)
      {
        __src[v36] = 125;
        LODWORD(v36) = v34 + 2;
        LOBYTE(v37) = v37 ^ 0x20;
      }
      char v38 = a4;
      __src[v36] = v37;
      uint64_t v39 = v36 + 1;
      if ((a3 - 125) <= 1)
      {
        __src[v39] = 125;
        LOBYTE(a3) = a3 ^ 0x20;
        LODWORD(v39) = v36 + 2;
      }
      char v40 = BYTE1(a4);
      __src[v39] = a3;
      uint64_t v41 = v39 + 1;
      if (a4 - 125 <= 1)
      {
        __src[v41] = 125;
        char v38 = a4 ^ 0x20;
        LODWORD(v41) = v39 + 2;
      }
      char v42 = BYTE2(a4);
      __src[v41] = v38;
      uint64_t v43 = v41 + 1;
      if (BYTE1(a4) - 125 <= 1)
      {
        __src[v43] = 125;
        LODWORD(v43) = v41 + 2;
        char v40 = BYTE1(a4) ^ 0x20;
      }
      __src[v43] = v40;
      uint64_t v44 = v43 + 1;
      if (BYTE2(a4) - 125 <= 1)
      {
        __src[v44] = 125;
        char v42 = BYTE2(a4) ^ 0x20;
        LODWORD(v44) = v43 + 2;
      }
      int v45 = ~(v18 ^ BYTE1(v17));
      __src[v44] = v42;
      uint64_t v46 = v44 + 1;
      int v47 = a1[14];
      if ((v47 - 125) <= 1)
      {
        __src[v46] = 125;
        LOBYTE(v47) = v47 ^ 0x20;
        LODWORD(v46) = v44 + 2;
      }
      char v48 = (unsigned __int16)(v18 ^ ~(unsigned __int16)(v17 >> 8)) >> 8;
      __src[v46] = v47;
      uint64_t v49 = v46 + 1;
      if ((v45 - 125) <= 1)
      {
        __src[v49] = 125;
        LOBYTE(v45) = v45 ^ 0x20;
        LODWORD(v49) = v46 + 2;
      }
      __src[v49] = v45;
      uint64_t v50 = v49 + 1;
      if (BYTE1(v19) - 125 <= 1)
      {
        __src[v50] = 125;
        char v48 = BYTE1(v19) ^ 0x20;
        LODWORD(v50) = v49 + 2;
      }
      __src[v50] = v48;
      memcpy(a1, __src, v50 + 1);
      uint64_t result = (v50 + 2);
      a1[v50 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t ETLDMCParserInit(void *a1, uint64_t a2)
{
  *a1 = a2;
  a1[1] = 0;
  return 1;
}

uint64_t ETLDMCParserGetToken(uint64_t a1, unsigned __int8 a2, char *__dst, unsigned int a4)
{
  int v5 = a2;
  uint64_t v6 = *(unsigned int *)(a1 + 8);
  int v7 = (const char *)(*(void *)a1 + v6);
  int v8 = *(unsigned __int8 *)v7;
  int v9 = *(_DWORD *)(a1 + 8);
  if (v8 == v5)
  {
LABEL_6:
    int v11 = v9 + 1;
    unsigned int v10 = v9 + 1 - v6;
    if (!v10) {
      return 0;
    }
  }
  else
  {
    unsigned int v10 = 1;
    while (v8)
    {
      int v8 = *(unsigned __int8 *)(*(void *)a1 + v6 + v10++);
      if (v8 == v5)
      {
        int v9 = v6 + v10 - 1;
        goto LABEL_6;
      }
    }
    if (v10 == 1) {
      return 0;
    }
    int v11 = v6 + v10 - 1;
    if (!v10) {
      return 0;
    }
  }
  if (v10 >= a4) {
    size_t v12 = a4;
  }
  else {
    size_t v12 = v10;
  }
  strlcpy(__dst, v7, v12);
  *(_DWORD *)(a1 + 8) = v11;
  return 1;
}

uint64_t ETLDMCParserReset(uint64_t a1)
{
  *(_DWORD *)(a1 + 8) = 0;
  return 1;
}

uint64_t ETLDMCParserCountTokens(char **a1, int a2)
{
  uint64_t v3 = strchr(*a1, a2);
  for (uint64_t i = 1; v3; uint64_t i = (i + 1))
    uint64_t v3 = strchr(v3 + 1, a2);
  return i;
}

uint64_t ETLEVENTCreateSetMaskCommand(uint64_t a1, uint64_t a2, unsigned int a3)
{
  _ETLDebugPrint();
  if (a3 > 0x1000 || !ETLRequireFreeSpace()) {
    return 0;
  }
  HDLCFrameInjectUnsignedChar();
  HDLCFrameInjectUnsignedChar();
  HDLCFrameInjectUnsignedShort();
  HDLCFrameInjectUnsignedShort();
  HDLCFrameInject();

  return HDLCFrameInjectUnsignedChar();
}

uint64_t ETLEVENTParseSetMaskResponse(uint64_t *a1, _DWORD *a2, void *a3, unsigned int *a4)
{
  unsigned int v4 = *((_DWORD *)a1 + 2);
  if (v4 <= 5) {
    goto LABEL_6;
  }
  uint64_t v8 = *a1;
  uint64_t result = ETLExpectResponseCode();
  if (!result) {
    return result;
  }
  int v10 = *(unsigned __int8 *)(v8 + 1);
  *a2 = v10;
  if (!v10)
  {
    unsigned int v11 = *(unsigned __int16 *)(v8 + 4);
    *a4 = v11;
    size_t v12 = (v11 + 7) >> 3;
    if (v11 <= 0x1000 && v12 <= v4 - 6)
    {
      memcpy(a3, (const void *)(v8 + 6), v12);
      return 1;
    }
LABEL_6:
    _ETLDebugPrint();
    return 0;
  }
  return 0;
}

uint64_t ETLEVENTCreateGetMaskCommand()
{
  uint64_t result = ETLRequireFreeSpace();
  if (result)
  {
    HDLCFrameInjectUnsignedChar();
    HDLCFrameInjectUnsignedChar();
    return HDLCFrameInjectUnsignedShort();
  }
  return result;
}

uint64_t ETLEVENTParseGetMaskResponse(uint64_t *a1, _DWORD *a2, void *a3, unsigned int *a4)
{
  unsigned int v4 = *((_DWORD *)a1 + 2);
  if (v4 <= 5) {
    goto LABEL_6;
  }
  uint64_t v8 = *a1;
  uint64_t result = ETLExpectResponseCode();
  if (!result) {
    return result;
  }
  int v10 = *(unsigned __int8 *)(v8 + 1);
  *a2 = v10;
  if (!v10)
  {
    unsigned int v11 = *(unsigned __int16 *)(v8 + 4);
    *a4 = v11;
    size_t v12 = (v11 + 7) >> 3;
    if (v11 <= 0x1000 && v12 <= v4 - 6)
    {
      memcpy(a3, (const void *)(v8 + 6), v12);
      return 1;
    }
LABEL_6:
    _ETLDebugPrint();
    return 0;
  }
  return 0;
}

uint64_t ETLEVENTCreateEnableCommand()
{
  uint64_t result = ETLRequireFreeSpace();
  if (result)
  {
    HDLCFrameInjectUnsignedChar();
    return HDLCFrameInjectUnsignedChar();
  }
  return result;
}

uint64_t ETLEVENTParseEnableResponse()
{
  return 1;
}

uint64_t ETLEVENTSetMask(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v39 = v5;
  long long v40 = v5;
  long long v37 = v5;
  long long v38 = v5;
  long long v35 = v5;
  long long v36 = v5;
  long long v33 = v5;
  long long v34 = v5;
  long long v31 = v5;
  long long v32 = v5;
  long long v29 = v5;
  long long v30 = v5;
  long long v27 = v5;
  long long v28 = v5;
  long long v25 = v5;
  long long v26 = v5;
  long long v23 = v5;
  long long v24 = v5;
  long long v21 = v5;
  long long v22 = v5;
  long long v19 = v5;
  long long v20 = v5;
  long long v17 = v5;
  long long v18 = v5;
  long long v15 = v5;
  long long v16 = v5;
  long long v13 = v5;
  long long v14 = v5;
  long long v11 = v5;
  long long v12 = v5;
  long long __s2 = v5;
  long long v10 = v5;
  uint64_t v8 = 0;
  memset(v7, 0, sizeof(v7));
  if ((ETLFrameCreateUplink() & 1) == 0
    || ETLEVENTCreateSetMaskCommand((uint64_t)v7, a2, a3)
    && ETLSendCommand()
    && ETLFindMatchingResponse())
  {
    _ETLDebugPrint();
  }
  HDLCFrameFree();
  HDLCFrameFree();
  return 0;
}

uint64_t ETLEVENTGetMask()
{
  if ((ETLFrameCreateUplink() & 1) == 0
    || ETLRequireFreeSpace()
    && (HDLCFrameInjectUnsignedChar(), HDLCFrameInjectUnsignedChar(), HDLCFrameInjectUnsignedShort())
    && ETLSendCommand()
    && ETLFindMatchingResponse())
  {
    _ETLDebugPrint();
  }
  HDLCFrameFree();
  HDLCFrameFree();
  return 0;
}

uint64_t ETLEVENTEnable()
{
  _ETLDebugPrint();
  if ((ETLFrameCreateUplink() & 1) == 0)
  {
    _ETLDebugPrint();
LABEL_7:
    uint64_t v0 = 0;
    goto LABEL_8;
  }
  if (!ETLRequireFreeSpace()) {
    goto LABEL_7;
  }
  HDLCFrameInjectUnsignedChar();
  if (!HDLCFrameInjectUnsignedChar() || !ETLSendCommand()) {
    goto LABEL_7;
  }
  uint64_t v0 = ETLFindMatchingResponse();
LABEL_8:
  HDLCFrameFree();
  HDLCFrameFree();
  return v0;
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

uint64_t ETLCheckPayloadLength()
{
  return MEMORY[0x1F417A4C8]();
}

uint64_t ETLExpectResponseCode()
{
  return MEMORY[0x1F417A4D8]();
}

uint64_t ETLFindMatchingResponse()
{
  return MEMORY[0x1F417A4E0]();
}

uint64_t ETLFlushResponseFull()
{
  return MEMORY[0x1F417A4E8]();
}

uint64_t ETLFrameCreateUplink()
{
  return MEMORY[0x1F417A4F0]();
}

uint64_t ETLRequireFreeSpace()
{
  return MEMORY[0x1F417A4F8]();
}

uint64_t ETLSendCommand()
{
  return MEMORY[0x1F417A500]();
}

uint64_t ETLSubsysAddHeader()
{
  return MEMORY[0x1F417A508]();
}

uint64_t ETLSubsysFindMatchingResponse()
{
  return MEMORY[0x1F417A510]();
}

uint64_t ETLSubsysParseHeader()
{
  return MEMORY[0x1F417A518]();
}

uint64_t HDLCFrameFree()
{
  return MEMORY[0x1F417A5F8]();
}

uint64_t HDLCFrameInject()
{
  return MEMORY[0x1F417A608]();
}

uint64_t HDLCFrameInjectUnsignedChar()
{
  return MEMORY[0x1F417A610]();
}

uint64_t HDLCFrameInjectUnsignedInt()
{
  return MEMORY[0x1F417A618]();
}

uint64_t HDLCFrameInjectUnsignedShort()
{
  return MEMORY[0x1F417A620]();
}

uint64_t TelephonyCapabilitiesGetHardwareModel()
{
  return MEMORY[0x1F417D8A8]();
}

uint64_t TelephonyUtilBinToHex()
{
  return MEMORY[0x1F417D8B8]();
}

uint64_t TelephonyUtilUnblockableReadToCompletionWithTimeout()
{
  return MEMORY[0x1F417D948]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1F40D90D0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1F40D90E8]();
}

uint64_t _ETLDebugPrint()
{
  return MEMORY[0x1F417A520]();
}

uint64_t _ETLDebugPrintBinary()
{
  return MEMORY[0x1F417A528]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1F417E408](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1F417E418](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1F417E848]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1F417E850]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1F417E860]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1F417E8A0]();
}

{
  return MEMORY[0x1F417E8C0]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1F417E978]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1F417E980]();
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
  return MEMORY[0x1F417EE40]();
}

void std::terminate(void)
{
}

void operator delete[](void *__p)
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1F40CC8F8](*(void *)&a1, a2, *(void *)&a3);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1F40CDAC8](a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1F40CE138](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE150](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2E0](__str, __endptr, *(void *)&__base);
}

xmlDocPtr xmlCtxtReadMemory(xmlParserCtxtPtr ctxt, const char *buffer, int size, const char *URL, const char *encoding, int options)
{
  return (xmlDocPtr)MEMORY[0x1F4182638](ctxt, buffer, *(void *)&size, URL, encoding, *(void *)&options);
}

xmlNodePtr xmlDocGetRootElement(const xmlDoc *doc)
{
  return (xmlNodePtr)MEMORY[0x1F4182678](doc);
}

void xmlFreeDoc(xmlDocPtr cur)
{
}

void xmlFreeParserCtxt(xmlParserCtxtPtr ctxt)
{
}