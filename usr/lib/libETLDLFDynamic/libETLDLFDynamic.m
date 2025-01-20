double ETLDLFAddVersionReport(uint64_t a1, unsigned int a2, _DWORD *a3, __int16 a4, __int16 a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, __int16 a10, unsigned __int8 a11)
{
  double result;
  unsigned char v14[149];

  *a3 = 0;
  if (a2 >= 0xA1)
  {
    memset(&v14[4], 0, 145);
    *(_WORD *)v14 = a4;
    *(_WORD *)&v14[2] = a5;
    __strlcpy_chk();
    __strlcpy_chk();
    __strlcpy_chk();
    *(_DWORD *)&v14[69] = a9;
    *(_WORD *)&v14[73] = a10;
    *(_WORD *)&v14[75] = a11;
    *a3 = 161;
    *(_OWORD *)(a1 + 108) = *(_OWORD *)&v14[96];
    *(_OWORD *)(a1 + 124) = *(_OWORD *)&v14[112];
    *(_OWORD *)(a1 + 140) = *(_OWORD *)&v14[128];
    *(_OWORD *)(a1 + 44) = *(_OWORD *)&v14[32];
    *(_OWORD *)(a1 + 60) = *(_OWORD *)&v14[48];
    *(_OWORD *)(a1 + 92) = *(_OWORD *)&v14[80];
    result = *(double *)v14;
    *(_OWORD *)(a1 + 12) = *(_OWORD *)v14;
    *(_OWORD *)(a1 + 28) = *(_OWORD *)&v14[16];
    *(_DWORD *)a1 = 536674465;
    *(void *)(a1 + 4) = 0;
    *(void *)(a1 + 153) = *(void *)&v14[141];
    *(_OWORD *)(a1 + 76) = *(_OWORD *)&v14[64];
  }
  return result;
}

uint64_t ETLDLFParse(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  if (a2 < 0xC) {
    return 0;
  }
  unsigned int v4 = *a1;
  if (v4 > a2) {
    return 0;
  }
  int v5 = a1[1];
  *(_WORD *)a3 = v5;
  *(_DWORD *)(a3 + 24) = v4;
  *(_DWORD *)(a3 + 28) = v4 - 12;
  *(void *)(a3 + 8) = a1;
  *(void *)(a3 + 16) = a1 + 6;
  uint64_t result = 4;
  switch(v5)
  {
    case 8171:
      uint64_t result = 2;
      break;
    case 8187:
      uint64_t result = 3;
      break;
    case 8189:
      return result;
    default:
      uint64_t result = 1;
      break;
  }
  return result;
}