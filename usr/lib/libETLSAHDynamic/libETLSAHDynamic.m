BOOL ETLSAHGetRecordEx(uint64_t a1, void (**a2)(void), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, size_t __size)
{
  unsigned int v7;
  unsigned int v12;
  int v13;
  unsigned int v14;
  capabilities::coredump *v15;
  capabilities::coredump *v16;
  unsigned int v17;
  unsigned int v18;
  int v19;
  unint64_t v20;
  unsigned int (*v21)(uint64_t, capabilities::coredump *, uint64_t, CFNumberRef *, uint64_t, uint64_t, void);
  int v22;
  BOOL v23;
  unsigned int (*v24)(uint64_t, capabilities::coredump *, unint64_t, CFNumberRef *, uint64_t, uint64_t, void);
  unsigned int (*v25)(uint64_t, void, CFNumberRef *);
  unsigned int v27;
  int v28;
  CFNumberRef number;
  unsigned int valuePtr;
  uint64_t v33;
  int v34;
  int v35;
  unint64_t v36;

  v7 = __size;
  v13 = *(_DWORD *)(a3 + 4);
  v12 = *(_DWORD *)(a3 + 8);
  if (v12 <= 0x40000000) {
    v14 = *(_DWORD *)(a3 + 8);
  }
  else {
    v14 = 0;
  }
  v36 = 0xAAAAAAAAAAAAAAAALL;
  v33 = *(void *)(a4 + 8);
  v34 = v13;
  v35 = v13 + v14;
  v15 = (capabilities::coredump *)malloc(__size);
  if (!v15) {
    return 0;
  }
  v16 = v15;
  valuePtr = 0;
  v28 = capabilities::coredump::coredumpInterface(v15);
  if (v28 == 8)
  {
    v17 = *(_DWORD *)(a4 + 16) * (v14 / v7);
  }
  else
  {
    number = (CFNumberRef)0xAAAAAAAAAAAAAAAALL;
    v25 = *(unsigned int (**)(uint64_t, void, CFNumberRef *))(a1 + 72);
    if (!v25
      || !v25(a1, *MEMORY[0x263F8BDE0], &number)
      || !CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr)
      || !valuePtr)
    {
      free(v16);
      return 0;
    }
    v17 = (v14 % v7 / valuePtr + v14 / v7) * *(_DWORD *)(a4 + 16);
  }
  if (v17 < 0x64) {
    v18 = 1;
  }
  else {
    v18 = v17 / 0x64;
  }
  if (v14)
  {
    if (v7 >= 0x10)
    {
      v27 = v18;
      v19 = 1;
      while (1)
      {
        if (v12 >= v7) {
          v20 = v7;
        }
        else {
          v20 = v12;
        }
        if (v28 != 8) {
          v20 = (__PAIR64__(v20, v20 % valuePtr) - 1) >> 32;
        }
        *(void *)v16 = 0x100000000ALL;
        *((_DWORD *)v16 + 2) = v13;
        *((_DWORD *)v16 + 3) = v20;
        v21 = *(unsigned int (**)(uint64_t, capabilities::coredump *, uint64_t, CFNumberRef *, uint64_t, uint64_t, void))a1;
        if (!*(void *)a1) {
          break;
        }
        LODWORD(number) = -1431655766;
        if (!v21(a1, v16, 16, &number, 1, a6, 0)) {
          break;
        }
        v22 = *((_DWORD *)v16 + 1);
        v23 = number == v22;
        if (number != v22) {
          goto LABEL_39;
        }
        LODWORD(number) = 0;
        v24 = *(unsigned int (**)(uint64_t, capabilities::coredump *, unint64_t, CFNumberRef *, uint64_t, uint64_t, void))(a1 + 8);
        if (!v24 || !v24(a1, v16, v20, &number, 1, a6, 0) || v20 != number)
        {
          _ETLDebugPrint();
          break;
        }
        if (*a2)
        {
          (*a2)();
          LODWORD(v20) = number;
        }
        v13 += v20;
        if (!--v19)
        {
          LODWORD(v36) = v13;
          (*(void (**)(uint64_t, uint64_t *, uint64_t))(a5 + 16))(a5, &v33, a3);
          v19 = v27;
        }
        v12 -= v20;
        if (!v12) {
          goto LABEL_39;
        }
      }
    }
    v23 = 0;
  }
  else
  {
    v23 = 1;
  }
LABEL_39:
  free(v16);
  return v23;
}

uint64_t ETLSAHCommandReceive(uint64_t a1, uint64_t a2, _DWORD *a3, unsigned int a4)
{
  if (a4 < 8) {
    return 0;
  }
  unint64_t v7 = a4 - 8;
  while (1)
  {
    unsigned int Size = TelephonyUtilRingBufferGetSize();
    unsigned int Remaining = TelephonyUtilRingBufferGetLinearReadRemaining();
    if (Size >= 8) {
      break;
    }
LABEL_4:
    if ((int)TelephonyUtilRingBufferInsertTransport() <= 0) {
      return 0;
    }
  }
  if (Remaining <= 7)
  {
    uint64_t result = TelephonyUtilRingBufferLinearize();
    if (!result) {
      return result;
    }
  }
  v10 = (_DWORD *)(*(void *)a2 + *(unsigned int *)(a2 + 16));
  unint64_t v11 = v10[1];
  *a3 = *v10;
  a3[1] = v11;
  if (v11 >= 8 && v7 >= v11)
  {
    if (v11 <= Size)
    {
      memcpy(a3 + 2, v10 + 2, (v11 - 8));
      TelephonyUtilRingBufferSkip();
      return 1;
    }
    goto LABEL_4;
  }
  _ETLDebugPrint();
  _ETLDebugPrintBinary();
  return 0;
}

uint64_t ETLSAHCommandSend(uint64_t (**a1)(void), uint64_t a2)
{
  v2 = *a1;
  if (!*a1) {
    return 0;
  }
  int v5 = -1431655766;
  uint64_t result = v2();
  if (result) {
    return v5 == *(_DWORD *)(a2 + 4);
  }
  return result;
}

uint64_t ETLSAHGetDebugRecordCount(void *a1, uint64_t a2, _DWORD *a3, unsigned int a4, unsigned int *a5, uint64_t a6)
{
  if (!ETLSAHCommandReceive((uint64_t)a1, a2, a3, a4)) {
    goto LABEL_10;
  }
  if (*a3 != 9)
  {
    _ETLDebugPrint();
    _ETLDebugPrintBinary();
    goto LABEL_12;
  }
  if ((a3[1] & 0xFFFFFFF8) == 8)
  {
LABEL_12:
    uint64_t v13 = 0;
LABEL_13:
    *a5 = 0;
    _ETLDebugPrint();
    return v13;
  }
  unsigned int v11 = a3[3];
  if (!v11)
  {
    uint64_t v13 = 1;
    goto LABEL_13;
  }
  if (a4 < 0x10
    || (*(void *)a3 = 0x100000000ALL,
        (v12 = (uint64_t (*)(void *, _DWORD *, uint64_t, int *, uint64_t, uint64_t, void))*a1) == 0)
    || (int v15 = -1431655766, (v12(a1, a3, 16, &v15, 1, a6, 0) & 1) == 0)
    || v15 != a3[1])
  {
LABEL_10:
    _ETLDebugPrint();
    return 0;
  }
  *a5 = v11 / 0x34;
  return 1;
}

uint64_t ETLSAHGetDebugTable(uint64_t a1, uint64_t *a2, uint64_t a3, unsigned int a4)
{
  TelephonyUtilRingBufferReset();
  if ((int)TelephonyUtilRingBufferInsertTransport() >= 1
    && (uint64_t v7 = *a2) != 0
    && (uint64_t v8 = *((unsigned int *)a2 + 4), 52 * a4 == TelephonyUtilRingBufferGetLinearReadRemaining()))
  {
    if (a4)
    {
      uint64_t v9 = a4;
      v10 = (long long *)(v7 + v8);
      do
      {
        long long v11 = *v10;
        long long v12 = v10[1];
        long long v13 = v10[2];
        int v14 = *((_DWORD *)v10 + 12);
        v10 = (long long *)((char *)v10 + 52);
        *(_DWORD *)(a3 + 48) = v14;
        *(_OWORD *)(a3 + 16) = v12;
        *(_OWORD *)(a3 + 32) = v13;
        *(_OWORD *)a3 = v11;
        a3 += 52;
        --v9;
      }
      while (v9);
    }
    return 1;
  }
  else
  {
    _ETLDebugPrint();
    return 0;
  }
}

BOOL ETLSAHCommandCreateReset(void *a1, unsigned int a2)
{
  if (a2 >= 8) {
    *a1 = 0x800000007;
  }
  return a2 > 7;
}

char *ETLSAHReturnAsString(int a1)
{
  return (&ETLSAHReturnAsString::ETLSAHReturnStrings)[a1];
}

const char *ETLSAHModeAsString(int a1)
{
  uint64_t result = "ETLSAHModePending";
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = "ETLSAHModeComplete";
      break;
    case 2:
      uint64_t result = "ETLSAHModeMemoryDebug";
      break;
    case 3:
      uint64_t result = "ETLSAHModeCommand";
      break;
    default:
      if (a1 == 256) {
        uint64_t result = "ETLSAHModeMaverick";
      }
      else {
        uint64_t result = "Unknown";
      }
      break;
  }
  return result;
}

const char *ETLSAHExecutionCommandIDAsString(unsigned int a1)
{
  if (a1 > 9) {
    return "Unknown";
  }
  else {
    return (&off_2649055A8)[a1];
  }
}

uint64_t ETLSAHSendReadData(uint64_t (**a1)(void), uint64_t a2, int a3)
{
  if (!*a1) {
    return 0;
  }
  LODWORD(result) = (*a1)();
  if (a3 == -1431655766) {
    return result;
  }
  else {
    return 0;
  }
}

uint64_t ETLSAHCommandExecute(_DWORD *a1, unsigned int a2, void *a3, uint64_t a4, int a5, uint64_t a6, unint64_t a7, unint64_t *a8, unsigned int a9)
{
  *a8 = 0;
  if (a2 < 0xC || !a1)
  {
    _ETLDebugPrint();
LABEL_10:
    _ETLDebugPrint();
    return 2;
  }
  *(void *)a1 = 0xC0000000DLL;
  a1[2] = a5;
  long long v12 = (uint64_t (*)(void *, _DWORD *, uint64_t, int *, uint64_t, void, void))*a3;
  if (!*a3) {
    goto LABEL_25;
  }
  int v24 = -1431655766;
  if ((v12(a3, a1, 12, &v24, 1, a9, 0) & 1) == 0
    || v24 != a1[1]
    || (ETLSAHCommandReceive((uint64_t)a3, a4, a1, a2) & 1) == 0)
  {
    goto LABEL_25;
  }
  if ((a1[1] & 0xFFFFFFF8) == 8) {
    goto LABEL_16;
  }
  if (*a1 != 14)
  {
    _ETLDebugPrint();
    _ETLDebugPrintBinary();
LABEL_16:
    _ETLDebugPrint();
    goto LABEL_10;
  }
  int v19 = a1[2];
  unint64_t v20 = a1[3];
  *a8 = v20;
  if (v19 != a5)
  {
    _ETLDebugPrint();
    return 5;
  }
  if (v20 > a7)
  {
    _ETLDebugPrint();
    return 3;
  }
  *(void *)a1 = 0xC0000000FLL;
  a1[2] = a5;
  v21 = (uint64_t (*)(void *, _DWORD *, uint64_t, int *, uint64_t, void, void))*a3;
  if (*a3)
  {
    int v25 = -1431655766;
    if ((v21(a3, a1, 12, &v25, 1, a9, 0) & 1) != 0 && v25 == a1[1])
    {
      int v23 = 0;
      v22 = (unsigned int (*)(void *, uint64_t, void, int *, uint64_t, void, void))a3[1];
      if (v22)
      {
        if (v22(a3, a6, *(unsigned int *)a8, &v23, 1, a9, 0) && *a8 == v23) {
          return 0;
        }
      }
    }
  }
LABEL_25:
  _ETLDebugPrint();
  return 4;
}

uint64_t ETLSAHCommandExecuteCreate(uint64_t a1, int a2, unint64_t a3)
{
  if (a3 > 0xB && a1)
  {
    *(void *)a1 = 0xC0000000DLL;
    *(_DWORD *)(a1 + 8) = a2;
    return 1;
  }
  else
  {
    _ETLDebugPrint();
    return 0;
  }
}

uint64_t ETLSAHCommandExecuteParseResponse(_DWORD *a1, _DWORD *a2, void *a3)
{
  if (a1 && a2 && a3 && (a1[1] & 0xFFFFFFF8) != 8)
  {
    if (*a1 == 14)
    {
      uint64_t v4 = a1[3];
      *a2 = a1[2];
      *a3 = v4;
      return 1;
    }
    else
    {
      _ETLDebugPrint();
      _ETLDebugPrintBinary();
      _ETLDebugPrint();
      return 0;
    }
  }
  else
  {
    _ETLDebugPrint();
    return 0;
  }
}

uint64_t ETLSAHCommandExecuteDataCreate(uint64_t a1, int a2, unint64_t a3)
{
  if (a3 > 0xB && a1)
  {
    *(void *)a1 = 0xC0000000FLL;
    *(_DWORD *)(a1 + 8) = a2;
    return 1;
  }
  else
  {
    _ETLDebugPrint();
    return 0;
  }
}

uint64_t ETLSAHCommandParseHello(_DWORD *a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5, void *a6, _DWORD *a7)
{
  int v7 = a1[1];
  if (*a1 != 1)
  {
    _ETLDebugPrint();
    _ETLDebugPrintBinary();
    return 0;
  }
  if ((v7 - 24) > 0xFFFFFFEF) {
    return 0;
  }
  *a2 = a1[2];
  *a3 = a1[3];
  *a4 = a1[4];
  *a5 = a1[5];
  if (a6) {
    *a6 = a1 + 6;
  }
  if (a7) {
    *a7 = v7 - 24;
  }
  return 1;
}

BOOL ETLSAHCommandCreateHelloResponse(uint64_t a1, unsigned int a2, int a3, int a4, int a5, int a6)
{
  if (a2 >= 0x30)
  {
    *(void *)a1 = 0x3000000002;
    *(_DWORD *)(a1 + 8) = a3;
    *(_DWORD *)(a1 + 12) = a4;
    *(_DWORD *)(a1 + 16) = a5;
    *(_DWORD *)(a1 + 20) = a6;
    *(void *)(a1 + 32) = 0;
    *(void *)(a1 + 40) = 0;
    *(void *)(a1 + 24) = 0;
  }
  return a2 > 0x2F;
}

uint64_t ETLSAHCommandCreateHelloResponseExt(uint64_t a1, unsigned int a2, int a3, int a4, int a5, int a6, void *__src, size_t __n)
{
  if (a2 < 0x30) {
    return 0;
  }
  *(void *)a1 = 0x3000000002;
  *(_DWORD *)(a1 + 8) = a3;
  *(_DWORD *)(a1 + 12) = a4;
  *(_DWORD *)(a1 + 16) = a5;
  *(_DWORD *)(a1 + 20) = a6;
  uint64_t v8 = (void *)(a1 + 24);
  if (__src)
  {
    if (__n > 0x18)
    {
      return 0;
    }
    else
    {
      memcpy(v8, __src, __n);
      return 1;
    }
  }
  else
  {
    *uint64_t v8 = 0;
    v8[1] = 0;
    v8[2] = 0;
    return 1;
  }
}

uint64_t ETLSAHCommandParseMemoryDebug(_DWORD *a1, _DWORD *a2, _DWORD *a3)
{
  if (*a1 == 9)
  {
    if ((a1[1] & 0xFFFFFFF8) == 8)
    {
      return 0;
    }
    else
    {
      *a2 = a1[2];
      *a3 = a1[3];
      return 1;
    }
  }
  else
  {
    _ETLDebugPrint();
    _ETLDebugPrintBinary();
    return 0;
  }
}

BOOL ETLSAHCommandCreateMemoryRead(uint64_t a1, unsigned int a2, int a3, int a4)
{
  if (a2 >= 0x10)
  {
    *(void *)a1 = 0x100000000ALL;
    *(_DWORD *)(a1 + 8) = a3;
    *(_DWORD *)(a1 + 12) = a4;
  }
  return a2 > 0xF;
}

uint64_t ETLSAHCommandParseReadData(_DWORD *a1, _DWORD *a2, _DWORD *a3, _DWORD *a4)
{
  if (*a1 == 3)
  {
    if ((a1[1] - 20) <= 0xFFFFFFF3)
    {
      *a2 = a1[2];
      *a3 = a1[3];
      *a4 = a1[4];
      return 1;
    }
  }
  else
  {
    _ETLDebugPrint();
    _ETLDebugPrintBinary();
  }
  return 0;
}

uint64_t ETLSAHCommandParseEndOfImageTransfer(_DWORD *a1, _DWORD *a2, _DWORD *a3)
{
  if (*a1 == 4)
  {
    if ((a1[1] & 0xFFFFFFF8) == 8)
    {
      return 0;
    }
    else
    {
      *a2 = a1[2];
      *a3 = a1[3];
      return 1;
    }
  }
  else
  {
    _ETLDebugPrint();
    _ETLDebugPrintBinary();
    return 0;
  }
}

BOOL ETLSAHCommandCreateDone(void *a1, unsigned int a2)
{
  if (a2 >= 8) {
    *a1 = 0x800000005;
  }
  return a2 > 7;
}

uint64_t ETLSAHCommandParseDoneResponse(_DWORD *a1, _DWORD *a2)
{
  if (*a1 == 6)
  {
    if ((a1[1] & 0xFFFFFFFC) == 8)
    {
      return 0;
    }
    else
    {
      *a2 = a1[2];
      return 1;
    }
  }
  else
  {
    _ETLDebugPrint();
    _ETLDebugPrintBinary();
    return 0;
  }
}

BOOL ETLSAHCommandParseResetResponse(int *a1)
{
  int v1 = *a1;
  if (*a1 != 8)
  {
    _ETLDebugPrint();
    _ETLDebugPrintBinary();
  }
  return v1 == 8;
}

BOOL ETLSAHCommandParseCommandReady(int *a1)
{
  int v1 = *a1;
  if (*a1 != 11)
  {
    _ETLDebugPrint();
    _ETLDebugPrintBinary();
  }
  return v1 == 11;
}

uint64_t ETLSAHCommandCreateSwitchMode(uint64_t a1, int a2, unint64_t a3)
{
  if (a3 > 0xB && a1)
  {
    *(void *)a1 = 0xC0000000CLL;
    *(_DWORD *)(a1 + 8) = a2;
    return 1;
  }
  else
  {
    _ETLDebugPrint();
    return 0;
  }
}

uint64_t ETLSAHCommandParseMaverickEraseQuery(_DWORD *a1, void *a2, _DWORD *a3)
{
  uint64_t result = 0;
  if (a2 && a3)
  {
    if (*a1 == 160)
    {
      *a3 = a1[1] - 8;
      *a2 = a1 + 2;
      return 1;
    }
    else
    {
      _ETLDebugPrint();
      _ETLDebugPrintBinary();
      return 0;
    }
  }
  return result;
}

BOOL ETLSAHCommandCreateMaverickEraseResponse(_DWORD *a1, unsigned int a2, int a3, char a4)
{
  if (a4) {
    unsigned int v4 = 16;
  }
  else {
    unsigned int v4 = 12;
  }
  if (v4 <= a2)
  {
    *a1 = 161;
    a1[1] = v4;
    a1[2] = a3;
    if (a4) {
      a1[3] = 1213417795;
    }
  }
  return v4 <= a2;
}

uint64_t ETLSAHCommandParseMaverickSendHashesQuery(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a1 != 165)
  {
    _ETLDebugPrint();
    _ETLDebugPrintBinary();
    return 0;
  }
  unsigned int v4 = *(_DWORD *)(a1 + 4) - 8;
  int v5 = (_OWORD *)(a1 + 8);
  int v6 = ETLDLOADGetProtocolVersion();
  if (v6)
  {
    if (v6 == 1)
    {
      _ETLDebugPrint();
      if (v4 >= 0x140)
      {
        long long v23 = *(_OWORD *)(a1 + 24);
        *(_OWORD *)a2 = *v5;
        *(_OWORD *)(a2 + 16) = v23;
        long long v24 = *(_OWORD *)(a1 + 56);
        *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 40);
        *(_OWORD *)(a2 + 48) = v24;
        long long v25 = *(_OWORD *)(a1 + 88);
        *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 72);
        *(_OWORD *)(a2 + 80) = v25;
        long long v26 = *(_OWORD *)(a1 + 120);
        *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 104);
        *(_OWORD *)(a2 + 112) = v26;
        long long v27 = *(_OWORD *)(a1 + 152);
        *(_OWORD *)(a2 + 128) = *(_OWORD *)(a1 + 136);
        *(_OWORD *)(a2 + 144) = v27;
        long long v28 = *(_OWORD *)(a1 + 184);
        *(_OWORD *)(a2 + 160) = *(_OWORD *)(a1 + 168);
        *(_OWORD *)(a2 + 176) = v28;
        long long v29 = *(_OWORD *)(a1 + 216);
        *(_OWORD *)(a2 + 192) = *(_OWORD *)(a1 + 200);
        *(_OWORD *)(a2 + 208) = v29;
        long long v30 = *(_OWORD *)(a1 + 248);
        *(_OWORD *)(a2 + 224) = *(_OWORD *)(a1 + 232);
        *(_OWORD *)(a2 + 240) = v30;
        long long v31 = *(_OWORD *)(a1 + 280);
        *(_OWORD *)(a2 + 256) = *(_OWORD *)(a1 + 264);
        *(_OWORD *)(a2 + 272) = v31;
        long long v32 = *(_OWORD *)(a1 + 312);
        *(_OWORD *)(a2 + 288) = *(_OWORD *)(a1 + 296);
        *(_OWORD *)(a2 + 304) = v32;
        return 1;
      }
    }
    else if (v6 == 2)
    {
      _ETLDebugPrint();
      if (v4 >= 0xC0)
      {
        long long v7 = *v5;
        long long v8 = *(_OWORD *)(a1 + 40);
        *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 24);
        *(_OWORD *)(a2 + 32) = v8;
        *(_OWORD *)a2 = v7;
        long long v9 = *(_OWORD *)(a1 + 56);
        long long v10 = *(_OWORD *)(a1 + 88);
        *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 72);
        *(_OWORD *)(a2 + 80) = v10;
        *(_OWORD *)(a2 + 48) = v9;
        long long v11 = *(_OWORD *)(a1 + 104);
        long long v12 = *(_OWORD *)(a1 + 136);
        *(_OWORD *)(a2 + 112) = *(_OWORD *)(a1 + 120);
        *(_OWORD *)(a2 + 128) = v12;
        *(_OWORD *)(a2 + 96) = v11;
        long long v13 = *(_OWORD *)(a1 + 152);
        long long v14 = *(_OWORD *)(a1 + 184);
        *(_OWORD *)(a2 + 160) = *(_OWORD *)(a1 + 168);
        *(_OWORD *)(a2 + 176) = v14;
        *(_OWORD *)(a2 + 144) = v13;
        return 1;
      }
    }
    else if (v4 >= 0x3C)
    {
      long long v33 = *v5;
      *(_DWORD *)(a2 + 16) = *(_DWORD *)(a1 + 24);
      *(_OWORD *)a2 = v33;
      long long v34 = *(_OWORD *)(a1 + 28);
      *(_DWORD *)(a2 + 36) = *(_DWORD *)(a1 + 44);
      *(_OWORD *)(a2 + 20) = v34;
      long long v35 = *(_OWORD *)(a1 + 48);
      *(_DWORD *)(a2 + 56) = *(_DWORD *)(a1 + 64);
      *(_OWORD *)(a2 + 40) = v35;
      return 1;
    }
  }
  else
  {
    _ETLDebugPrint();
    if (v4 >= 0x8C)
    {
      long long v16 = *v5;
      *(_DWORD *)(a2 + 16) = *(_DWORD *)(a1 + 24);
      *(_OWORD *)a2 = v16;
      long long v17 = *(_OWORD *)(a1 + 28);
      *(_DWORD *)(a2 + 36) = *(_DWORD *)(a1 + 44);
      *(_OWORD *)(a2 + 20) = v17;
      long long v18 = *(_OWORD *)(a1 + 48);
      *(_DWORD *)(a2 + 56) = *(_DWORD *)(a1 + 64);
      *(_OWORD *)(a2 + 40) = v18;
      long long v19 = *(_OWORD *)(a1 + 68);
      *(_DWORD *)(a2 + 76) = *(_DWORD *)(a1 + 84);
      *(_OWORD *)(a2 + 60) = v19;
      long long v20 = *(_OWORD *)(a1 + 88);
      *(_DWORD *)(a2 + 96) = *(_DWORD *)(a1 + 104);
      *(_OWORD *)(a2 + 80) = v20;
      long long v21 = *(_OWORD *)(a1 + 108);
      *(_DWORD *)(a2 + 116) = *(_DWORD *)(a1 + 124);
      *(_OWORD *)(a2 + 100) = v21;
      long long v22 = *(_OWORD *)(a1 + 128);
      *(_DWORD *)(a2 + 136) = *(_DWORD *)(a1 + 144);
      *(_OWORD *)(a2 + 120) = v22;
      return 1;
    }
  }
  return 0;
}

uint64_t ETLSAHCommandParseMaverickConfigQuery(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a1 == 169)
  {
    if ((*(_DWORD *)(a1 + 4) - 280) <= 0xFFFFFEEF)
    {
      *(_DWORD *)a2 = *(_DWORD *)(a1 + 8);
      *(_DWORD *)(a2 + 4) = *(_DWORD *)(a1 + 12);
      *(_DWORD *)(a2 + 8) = *(_DWORD *)(a1 + 16);
      *(_DWORD *)(a2 + 12) = *(_DWORD *)(a1 + 20);
      long long v2 = *(_OWORD *)(a1 + 24);
      long long v3 = *(_OWORD *)(a1 + 40);
      long long v4 = *(_OWORD *)(a1 + 72);
      *(_OWORD *)(a2 + 48) = *(_OWORD *)(a1 + 56);
      *(_OWORD *)(a2 + 64) = v4;
      *(_OWORD *)(a2 + 16) = v2;
      *(_OWORD *)(a2 + 32) = v3;
      long long v5 = *(_OWORD *)(a1 + 88);
      long long v6 = *(_OWORD *)(a1 + 104);
      long long v7 = *(_OWORD *)(a1 + 136);
      *(_OWORD *)(a2 + 112) = *(_OWORD *)(a1 + 120);
      *(_OWORD *)(a2 + 128) = v7;
      *(_OWORD *)(a2 + 80) = v5;
      *(_OWORD *)(a2 + 96) = v6;
      long long v8 = *(_OWORD *)(a1 + 152);
      long long v9 = *(_OWORD *)(a1 + 168);
      long long v10 = *(_OWORD *)(a1 + 200);
      *(_OWORD *)(a2 + 176) = *(_OWORD *)(a1 + 184);
      *(_OWORD *)(a2 + 192) = v10;
      *(_OWORD *)(a2 + 144) = v8;
      *(_OWORD *)(a2 + 160) = v9;
      long long v11 = *(_OWORD *)(a1 + 216);
      long long v12 = *(_OWORD *)(a1 + 232);
      long long v13 = *(_OWORD *)(a1 + 264);
      *(_OWORD *)(a2 + 240) = *(_OWORD *)(a1 + 248);
      *(_OWORD *)(a2 + 256) = v13;
      *(_OWORD *)(a2 + 208) = v11;
      *(_OWORD *)(a2 + 224) = v12;
      *(unsigned char *)(a2 + 271) = 0;
      return 1;
    }
  }
  else
  {
    _ETLDebugPrint();
    _ETLDebugPrintBinary();
  }
  return 0;
}

uint64_t ETLSAHCommandCreateMaverickConfigResponse(uint64_t a1, int a2, int a3, uint64_t a4, unsigned int a5)
{
  if (a5 > 0x17 && a1)
  {
    *(void *)a1 = 0x18000000AALL;
    *(_DWORD *)(a1 + 8) = a2;
    *(_DWORD *)(a1 + 12) = a3;
    *(void *)(a1 + 16) = a4;
    return 1;
  }
  else
  {
    _ETLDebugPrint();
    return 0;
  }
}

BOOL ETLSAHCommandCreateMaverickHashResponse(uint64_t a1, unsigned int a2, int a3)
{
  if (a2 >= 0xC)
  {
    *(void *)a1 = 0xC000000A6;
    *(_DWORD *)(a1 + 8) = a3;
  }
  return a2 > 0xB;
}

uint64_t ETLSAHCommandParseChipID(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  if (a1 && a3 && a2 > 7)
  {
    *a3 = *(_DWORD *)(a1 + 4);
    return 1;
  }
  else
  {
    _ETLDebugPrint();
    return 0;
  }
}

uint64_t ETLSAHCommandParseMaverickRootManifestQuery(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a1 != 162)
  {
    _ETLDebugPrint();
    _ETLDebugPrintBinary();
    return 0;
  }
  unsigned int v4 = *(_DWORD *)(a1 + 4) - 8;
  unsigned int v5 = ETLDLOADGetProtocolVersion();
  if (v5 >= 2)
  {
    if (v5 == 2)
    {
      _ETLDebugPrint();
      if (v4 >= 0x50)
      {
        *(_DWORD *)a2 = *(_DWORD *)(a1 + 8);
        long long v10 = *(_OWORD *)(a1 + 12);
        *(_DWORD *)(a2 + 20) = *(_DWORD *)(a1 + 28);
        *(_OWORD *)(a2 + 4) = v10;
        *(_DWORD *)(a2 + 24) = *(_DWORD *)(a1 + 32);
        *(_DWORD *)(a2 + 28) = *(_DWORD *)(a1 + 36);
        long long v7 = *(_OWORD *)(a1 + 40);
        long long v8 = *(_OWORD *)(a1 + 56);
        *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 72);
        goto LABEL_9;
      }
    }
    else if (v4 >= 0x20)
    {
      *(_DWORD *)a2 = *(_DWORD *)(a1 + 8);
      long long v11 = *(_OWORD *)(a1 + 12);
      *(_DWORD *)(a2 + 20) = *(_DWORD *)(a1 + 28);
      *(_OWORD *)(a2 + 4) = v11;
      *(_DWORD *)(a2 + 24) = *(_DWORD *)(a1 + 32);
      *(_DWORD *)(a2 + 28) = *(_DWORD *)(a1 + 36);
      return 1;
    }
  }
  else
  {
    _ETLDebugPrint();
    if (v4 >= 0x40)
    {
      *(_DWORD *)a2 = *(_DWORD *)(a1 + 8);
      long long v6 = *(_OWORD *)(a1 + 12);
      *(_DWORD *)(a2 + 20) = *(_DWORD *)(a1 + 28);
      *(_OWORD *)(a2 + 4) = v6;
      *(_DWORD *)(a2 + 24) = *(_DWORD *)(a1 + 32);
      *(_DWORD *)(a2 + 28) = *(_DWORD *)(a1 + 36);
      long long v7 = *(_OWORD *)(a1 + 40);
      long long v8 = *(_OWORD *)(a1 + 56);
LABEL_9:
      *(_OWORD *)(a2 + 32) = v7;
      *(_OWORD *)(a2 + 48) = v8;
      return 1;
    }
  }
  return 0;
}

BOOL ETLSAHCommandCreateMaverickRootManifestResponse(_DWORD *a1, unsigned int a2, void *__src, size_t __n)
{
  unsigned int v5 = __n + 8;
  if ((int)__n + 8 <= a2)
  {
    *a1 = 163;
    a1[1] = v5;
    memcpy(a1 + 2, __src, __n);
  }
  return v5 <= a2;
}

BOOL ETLSAHCommandMaverickParseEnd(int *a1)
{
  int v1 = *a1;
  if (*a1 != 164)
  {
    _ETLDebugPrint();
    _ETLDebugPrintBinary();
  }
  return v1 == 164;
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

uint64_t ETLDLOADGetProtocolVersion()
{
  return MEMORY[0x270F919D0]();
}

uint64_t TelephonyUtilRingBufferGetLinearReadRemaining()
{
  return MEMORY[0x270F971C8]();
}

uint64_t TelephonyUtilRingBufferGetSize()
{
  return MEMORY[0x270F971D0]();
}

uint64_t TelephonyUtilRingBufferInsertTransport()
{
  return MEMORY[0x270F971E0]();
}

uint64_t TelephonyUtilRingBufferLinearize()
{
  return MEMORY[0x270F971E8]();
}

uint64_t TelephonyUtilRingBufferReset()
{
  return MEMORY[0x270F971F0]();
}

uint64_t TelephonyUtilRingBufferSkip()
{
  return MEMORY[0x270F971F8]();
}

uint64_t _ETLDebugPrint()
{
  return MEMORY[0x270F91C00]();
}

uint64_t _ETLDebugPrintBinary()
{
  return MEMORY[0x270F91C08]();
}

uint64_t capabilities::coredump::coredumpInterface(capabilities::coredump *this)
{
  return MEMORY[0x270F97090](this);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}