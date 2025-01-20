uint64_t ETLDLOADCommandCreateMemoryDebugReadRequestPrivate(uint64_t a1, int a2)
{
  uint64_t vars8;

  *(_DWORD *)(a1 + 40) = a2;
  if (!HDLCFrameCreateUplink()
    || !HDLCFrameInjectUnsignedChar()
    || !HDLCFrameInjectUnsignedInt())
  {
    return 0;
  }

  return HDLCFrameInjectUnsignedShort();
}

uint64_t ETLDLOADCommandSend(uint64_t a1, uint64_t (**a2)(void, uint64_t, uint64_t, int *, uint64_t, uint64_t, void), uint64_t a3)
{
  uint64_t result = HDLCFrameEncodeAndCache();
  if (result)
  {
    uint64_t v7 = *(void *)(a1 + 24);
    uint64_t v8 = *(unsigned int *)(a1 + 32);
    int v9 = -1431655766;
    if (*a2)
    {
      uint64_t result = (*a2)(a2, v7, v8, &v9, 1, a3, 0);
      if (result) {
        return result;
      }
      if (*a2)
      {
        uint64_t result = (*a2)(a2, v7, v8, &v9, 1, a3, 0);
        if (result) {
          return result;
        }
      }
      if (*a2) {
        return (*a2)(a2, v7, v8, &v9, 1, a3, 0);
      }
    }
    return 0;
  }
  return result;
}

uint64_t ETLDLOADCommandReceiveSmallWithFlags(unsigned __int8 **a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  memset(__b, 170, sizeof(__b));
  TelephonyUtilRingBufferInitialize();
  uint64_t result = ETLFrameReadFromTransport();
  if (result)
  {
    if (*((_DWORD *)a1 + 2))
    {
      *((_DWORD *)a1 + 10) = **a1;
      return 1;
    }
    else
    {
      HDLCFrameFree();
      return 0;
    }
  }
  return result;
}

uint64_t ETLDLOADCommandReceiveWithBufferAndFlags(unsigned __int8 **a1)
{
  uint64_t result = ETLFrameReadFromTransport();
  if (result)
  {
    if (*((_DWORD *)a1 + 2))
    {
      *((_DWORD *)a1 + 10) = **a1;
      return 1;
    }
    else
    {
      HDLCFrameFree();
      return 0;
    }
  }
  return result;
}

uint64_t ETLDLOADCommandCreateParametersRequest(uint64_t a1)
{
  *(_DWORD *)(a1 + 40) = 7;
  uint64_t result = HDLCFrameCreateUplink();
  if (result)
  {
    return HDLCFrameInjectUnsignedChar();
  }
  return result;
}

uint64_t ETLDLOADCommandParseParametersResponse(_DWORD *a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 3) = 0;
  *(_DWORD *)a2 = 0;
  if (a1[10] == 8)
  {
    if (a1[2] >= 8u)
    {
      unsigned int v2 = *(_DWORD *)(*(void *)a1 + 1);
      *(_DWORD *)(a2 + 3) = *(_DWORD *)(*(void *)a1 + 4);
      *(_DWORD *)a2 = v2;
      *(_WORD *)(a2 + 2) = bswap32(HIWORD(v2)) >> 16;
      return 1;
    }
  }
  else
  {
    _ETLDebugPrint();
  }
  return 0;
}

uint64_t ETLDLOADCommandCreateVersionRequest(uint64_t a1)
{
  *(_DWORD *)(a1 + 40) = 12;
  uint64_t result = HDLCFrameCreateUplink();
  if (result)
  {
    return HDLCFrameInjectUnsignedChar();
  }
  return result;
}

uint64_t ETLDLOADCommandParseVersionResponse(_DWORD *a1, unsigned char *__dst, int a3)
{
  *__dst = 0;
  if (a1[10] == 13 && (v3 = a1[2], v3 >= 2) && (unsigned int v4 = *(unsigned __int8 *)(*(void *)a1 + 1), v3 + 2 >= v4))
  {
    if (a3 - 1 >= v4) {
      size_t v7 = *(unsigned __int8 *)(*(void *)a1 + 1);
    }
    else {
      size_t v7 = (a3 - 1);
    }
    memcpy(__dst, (const void *)(*(void *)a1 + 2), v7);
    __dst[v7] = 0;
    return 1;
  }
  else
  {
    _ETLDebugPrint();
    return 0;
  }
}

uint64_t ETLDLOADCommandCreateSerialNumberRequest(capabilities::radio *a1)
{
  capabilities::radio::mavLegacy(a1);
  *((_DWORD *)a1 + 10) = 22;
  if (!HDLCFrameCreateUplink() || !HDLCFrameInjectUnsignedChar()) {
    return 0;
  }

  return HDLCFrameInjectUnsignedChar();
}

uint64_t ETLDLOADCommandParseSerialNumberResponse(_DWORD *a1, void *__dst, uint64_t a3, unsigned int *a4)
{
  *a4 = 0;
  if (a1[10] != 22)
  {
    _ETLDebugPrint();
    return 0;
  }
  unsigned int v4 = a1[2];
  if (v4 < 3) {
    return 0;
  }
  uint64_t v5 = *(void *)a1;
  unsigned int v6 = v4 - 2;
  unsigned int v7 = *(unsigned __int8 *)(*(void *)a1 + 1);
  *a4 = v7;
  if (8 * (v4 - 2) >= v7) {
    unsigned int v6 = (v7 + 7) >> 3;
  }
  else {
    *a4 = 8 * v6;
  }
  memcpy(__dst, (const void *)(v5 + 2), v6);
  return 1;
}

uint64_t ETLDLOADCommandCreateChipIDRequest(uint64_t a1)
{
  *(_DWORD *)(a1 + 40) = 23;
  uint64_t result = HDLCFrameCreateUplink();
  if (result)
  {
    return HDLCFrameInjectUnsignedChar();
  }
  return result;
}

uint64_t ETLDLOADCommandParseChipIDResponse(_DWORD *a1, _DWORD *a2, _DWORD *a3)
{
  if (a1[10] == 23)
  {
    if (a1[2] >= 3u)
    {
      uint64_t v3 = *(void *)a1;
      *a2 = *(_DWORD *)(*(void *)a1 + 3);
      *a3 = *(_DWORD *)(v3 + 7);
      return 1;
    }
  }
  else
  {
    _ETLDebugPrint();
  }
  return 0;
}

uint64_t ETLDLOADCommandCreatePkHashRequest(uint64_t a1)
{
  *(_DWORD *)(a1 + 40) = 24;
  uint64_t result = HDLCFrameCreateUplink();
  if (result)
  {
    return HDLCFrameInjectUnsignedChar();
  }
  return result;
}

uint64_t ETLDLOADCommandParsePkHashResponse(_DWORD *a1, void *__dst, uint64_t a3, unsigned int *a4)
{
  *a4 = 0;
  if (a1[10] != 24)
  {
    _ETLDebugPrint();
    return 0;
  }
  unsigned int v4 = a1[2];
  if (v4 < 3) {
    return 0;
  }
  uint64_t v5 = *(void *)a1;
  unsigned int v6 = v4 - 2;
  unsigned int v7 = __rev16(*(unsigned __int16 *)(*(void *)a1 + 1));
  *a4 = v7;
  if (8 * (v4 - 2) >= v7) {
    unsigned int v6 = (v7 + 7) >> 3;
  }
  else {
    *a4 = 8 * v6;
  }
  memcpy(__dst, (const void *)(v5 + 3), v6);
  return 1;
}

uint64_t ETLDLOADCommandCreateWriteRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_DWORD *)(a1 + 40) = 15;
  if (!HDLCFrameCreateUplink()
    || !HDLCFrameInjectUnsignedChar()
    || !HDLCFrameInjectUnsignedInt()
    || !HDLCFrameInjectUnsignedShort())
  {
    return 0;
  }

  return MEMORY[0x270F92028](a1, a4, a3);
}

uint64_t ETLDLOADCommandParseACKNAKResponse(_DWORD *a1, unsigned char *a2, _WORD *a3)
{
  if (a1[10] == 2)
  {
    LOWORD(v5) = 0;
    *a2 = 1;
LABEL_6:
    *a3 = v5;
    return 1;
  }
  _ETLDebugPrint();
  if (a1[10] != 3)
  {
    _ETLDebugPrint();
    return 0;
  }
  uint64_t result = 0;
  *a2 = 0;
  if (a1[2] >= 3u)
  {
    unsigned int v5 = bswap32(*(unsigned __int16 *)(*(void *)a1 + 1)) >> 16;
    goto LABEL_6;
  }
  return result;
}

uint64_t ETLDLOADCommandCreateGoRequest(uint64_t a1)
{
  *(_DWORD *)(a1 + 40) = 5;
  if (!HDLCFrameCreateUplink()
    || !HDLCFrameInjectUnsignedChar()
    || !HDLCFrameInjectUnsignedShort())
  {
    return 0;
  }

  return HDLCFrameInjectUnsignedShort();
}

const char *ETLDLOADGetNAKReasonAsString(unsigned int a1)
{
  if (a1 > 0xF) {
    return "Unrecognized reason";
  }
  else {
    return (&off_264897400)[(__int16)a1];
  }
}

uint64_t ETLDLOADCommandPowerCreateResetRequest(uint64_t a1)
{
  *(_DWORD *)(a1 + 40) = 10;
  uint64_t result = HDLCFrameCreateUplink();
  if (result)
  {
    return HDLCFrameInjectUnsignedChar();
  }
  return result;
}

uint64_t ETLDLOADCommandPowerCreatePowerDownRequest(uint64_t a1)
{
  *(_DWORD *)(a1 + 40) = 14;
  uint64_t result = HDLCFrameCreateUplink();
  if (result)
  {
    return HDLCFrameInjectUnsignedChar();
  }
  return result;
}

uint64_t ETLDLOADCommandCreateMemoryDebugInfoRequest(uint64_t a1)
{
  *(_DWORD *)(a1 + 40) = 16;
  uint64_t result = HDLCFrameCreateUplink();
  if (result)
  {
    return HDLCFrameInjectUnsignedChar();
  }
  return result;
}

uint64_t ETLDLOADCommandParseMemoryDebugInfoResponse(_DWORD *a1, void *__dst)
{
  __dst[64] = 0;
  if (a1[10] == 17 && (unsigned int v2 = a1[2], v3 = v2 - 3, v2 >= 3))
  {
    unsigned int v5 = bswap32(*(unsigned __int16 *)(*(void *)a1 + 1)) >> 16;
    unsigned int v6 = (const void *)(*(void *)a1 + 3);
    if (v3 < v5)
    {
      _ETLDebugPrint();
      unsigned int v5 = v3;
    }
    if (v5 >= 0x200) {
      size_t v7 = 512;
    }
    else {
      size_t v7 = v5;
    }
    memcpy(__dst, v6, v7);
    *((_DWORD *)__dst + 128) = v7;
    return 1;
  }
  else
  {
    _ETLDebugPrint();
    return 0;
  }
}

uint64_t ETLDLOADCommandCopyDebugDataField(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  *a3 = 0;
  *(_OWORD *)(a2 + 60) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  uint64_t v3 = *(unsigned int *)(a1 + 516);
  unsigned int v4 = *(_DWORD *)(a1 + 512);
  if (v4 < v3)
  {
LABEL_18:
    _ETLDebugPrint();
    return 0;
  }
  int v5 = v4 - v3;
  if (v4 - v3 < 0xA)
  {
    if (v4 == v3)
    {
      uint64_t result = 1;
      *a3 = 1;
      return result;
    }
    goto LABEL_18;
  }
  uint64_t v8 = (unsigned __int8 *)(a1 + v3);
  *(_DWORD *)a2 = *v8;
  *(_DWORD *)(a2 + 4) = bswap32(*(_DWORD *)(v8 + 1));
  *(_DWORD *)(a2 + 8) = bswap32(*(_DWORD *)(v8 + 5));
  int v9 = v8 + 9;
  unsigned int v10 = v5 - 9;
  if ((v5 - 9) >= 0x20) {
    unint64_t v11 = 32;
  }
  else {
    unint64_t v11 = v10;
  }
  uint64_t v12 = __strlcpy_chk();
  if (v12 + 1 < v11) {
    unint64_t v13 = v12 + 1;
  }
  else {
    unint64_t v13 = v11;
  }
  unsigned int v14 = v10 - v13;
  v15 = (const char *)&v9[v13];
  if (v10 - v13 >= 0x20) {
    size_t v16 = 32;
  }
  else {
    size_t v16 = v14;
  }
  size_t v17 = strlcpy((char *)(a2 + 44), v15, v16);
  if (v17 + 1 < v16) {
    int v18 = v17 + 1;
  }
  else {
    int v18 = v16;
  }
  *(_DWORD *)(a1 + 516) = *(_DWORD *)(a1 + 516) + v5 - v14 + v18;
  return 1;
}

uint64_t ETLDLOADCommandCreateMemoryDebugReadRequest(uint64_t a1)
{
  *(_DWORD *)(a1 + 40) = 18;
  if (!HDLCFrameCreateUplink()
    || !HDLCFrameInjectUnsignedChar()
    || !HDLCFrameInjectUnsignedInt())
  {
    return 0;
  }

  return HDLCFrameInjectUnsignedShort();
}

uint64_t ETLDLOADCommandParseMemoryDebugReadResponse(_DWORD *a1, _DWORD *a2, _WORD *a3, void *a4)
{
  if (a1[10] == 19
    && (unsigned int v4 = a1[2], v5 = v4 - 7, v4 >= 7)
    && (uint64_t v6 = *(void *)a1,
        *a2 = bswap32(*(_DWORD *)(*(void *)a1 + 1)),
        unsigned int v7 = bswap32(*(unsigned __int16 *)(v6 + 5)) >> 16,
        *a3 = v7,
        v5 >= v7))
  {
    *a4 = v6 + 7;
    return 1;
  }
  else
  {
    _ETLDebugPrint();
    return 0;
  }
}

uint64_t ETLDLOADCommandCreateMemoryDebugFastReadRequest(uint64_t a1)
{
  *(_DWORD *)(a1 + 40) = 32;
  if (!HDLCFrameCreateUplink()
    || !HDLCFrameInjectUnsignedChar()
    || !HDLCFrameInjectUnsignedInt())
  {
    return 0;
  }

  return HDLCFrameInjectUnsignedShort();
}

uint64_t ETLDLOADCommandReadMemoryDebugFastReadResponse(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = *(uint64_t (**)(void))(a1 + 8);
  if (!v3) {
    return 0;
  }
  uint64_t result = v3();
  if (!result) {
    return result;
  }
  if (a3 != -1431655766)
  {
    _ETLDebugPrint();
    return 0;
  }
  return 1;
}

uint64_t ETLDLOADDetectProtocolVersion(void *a1, unsigned char *a2, int *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (!a2
    || !a3
    || (*(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL,
        *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL,
        long long v13 = v6,
        !HDLCFrameCreateUplink())
    || !HDLCFrameInjectUnsignedChar())
  {
    _ETLDebugPrint();
    return 0;
  }
  if ((HDLCFrameEncodeAndCache() & 1) == 0) {
    goto LABEL_22;
  }
  __b[0] = -1431655766;
  if (!*a1) {
    goto LABEL_22;
  }
  if (((uint64_t (*)(void *, unint64_t, uint64_t, _DWORD *, uint64_t, uint64_t, void))*a1)(a1, 0xAAAAAAAAAAAAAAAALL, 2863311530, __b, 1, 1000, 0))
  {
LABEL_10:
    HDLCFrameFree();
    goto LABEL_11;
  }
  if (!*a1) {
    goto LABEL_22;
  }
  if (((uint64_t (*)(void *, unint64_t, uint64_t, _DWORD *, uint64_t, uint64_t, void))*a1)(a1, 0xAAAAAAAAAAAAAAAALL, 2863311530, __b, 1, 1000, 0))goto LABEL_10; {
  if (!*a1)
  }
  {
LABEL_22:
    HDLCFrameFree();
    return 0;
  }
  int v10 = ((uint64_t (*)(void *, unint64_t, uint64_t, _DWORD *, uint64_t, uint64_t, void))*a1)(a1, 0xAAAAAAAAAAAAAAAALL, 2863311530, __b, 1, 1000, 0);
  HDLCFrameFree();
  if (!v10) {
    return 0;
  }
LABEL_11:
  memset(__b, 170, sizeof(__b));
  TelephonyUtilRingBufferInitialize();
  if (!ETLFrameReadFromTransport())
  {
LABEL_25:
    _ETLDebugPrint();
    return 0;
  }
  if (!DWORD2(v13))
  {
    HDLCFrameFree();
    goto LABEL_25;
  }
  int v7 = *(unsigned __int8 *)v13;
  int v8 = *a3;
  *a2 = 0;
  if (v7 != 13 || DWORD2(v13) < 2 || (unsigned int v9 = *(unsigned __int8 *)(v13 + 1), DWORD2(v13) + 2 < v9))
  {
    _ETLDebugPrint();
    HDLCFrameFree();
    _ETLDebugPrintBinary();
    return 0;
  }
  if (v8 - 1 >= v9) {
    size_t v12 = *(unsigned __int8 *)(v13 + 1);
  }
  else {
    size_t v12 = (v8 - 1);
  }
  memcpy(a2, (const void *)(v13 + 2), v12);
  a2[v12] = 0;
  HDLCFrameFree();
  return 1;
}

uint64_t ETLDLOADCommandDumpCommand()
{
  return _ETLDebugPrintBinary();
}

uint64_t ETLDLOADCreateCommandForSend(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 40) = a2;
  uint64_t result = HDLCFrameCreateUplink();
  if (result)
  {
    return HDLCFrameInjectUnsignedChar();
  }
  return result;
}

BOOL ETLDLOADExpectCommandType(uint64_t a1, int a2)
{
  int v3 = *(_DWORD *)(a1 + 40);
  if (v3 != a2) {
    _ETLDebugPrint();
  }
  return v3 == a2;
}

uint64_t ETLDLOADGetProtocolVersion(capabilities::radio *a1)
{
  if (capabilities::radio::mavLegacy(a1)) {
    return 1;
  }
  else {
    return 2;
  }
}

uint64_t ETLFrameReadFromTransport()
{
  return MEMORY[0x270F91AF0]();
}

uint64_t HDLCFrameCreateUplink()
{
  return MEMORY[0x270F92010]();
}

uint64_t HDLCFrameEncodeAndCache()
{
  return MEMORY[0x270F92018]();
}

uint64_t HDLCFrameFree()
{
  return MEMORY[0x270F92020]();
}

uint64_t HDLCFrameInjectUnsignedChar()
{
  return MEMORY[0x270F92030]();
}

uint64_t HDLCFrameInjectUnsignedInt()
{
  return MEMORY[0x270F92038]();
}

uint64_t HDLCFrameInjectUnsignedShort()
{
  return MEMORY[0x270F92040]();
}

uint64_t TelephonyUtilRingBufferInitialize()
{
  return MEMORY[0x270F971D8]();
}

uint64_t _ETLDebugPrint()
{
  return MEMORY[0x270F91C00]();
}

uint64_t _ETLDebugPrintBinary()
{
  return MEMORY[0x270F91C08]();
}

uint64_t capabilities::radio::mavLegacy(capabilities::radio *this)
{
  return MEMORY[0x270F96D48](this);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}