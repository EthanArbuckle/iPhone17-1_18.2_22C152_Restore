double HDLCFrameFree(uint64_t a1)
{
  void *v2;
  double result;

  v2 = *(void **)(a1 + 24);
  if (v2) {
    free(v2);
  }
  if (*(void *)a1) {
    free(*(void **)a1);
  }
  *(void *)(a1 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

double HDLCFrameCreateDownlink(uint64_t a1, uint64_t a2, int a3, _DWORD *a4, uint64_t a5, unsigned int a6, int a7, char a8)
{
  *(void *)(a1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *a4 = 0;
  if (a3)
  {
    uint64_t v13 = 0;
    while (1)
    {
      int v14 = *(unsigned __int8 *)(a2 + v13);
      if (v14 != 126) {
        break;
      }
      *a4 = ++v13;
      if (a3 == v13) {
        return result;
      }
    }
    uint64_t v15 = 0;
    LODWORD(v16) = 0;
    v17 = (char *)(a2 + v13);
    int v18 = 1;
    while (a3 - v13 != v18)
    {
      if (v14 == 125) {
        size_t v16 = v16;
      }
      else {
        size_t v16 = (v16 + 1);
      }
      int v14 = *(unsigned __int8 *)(a2 + v15 + v13 + 1);
      ++v18;
      ++v15;
      if (v14 == 126)
      {
        *a4 = v13 + v15 + 1;
        if (!((v18 - 2) >> 15))
        {
          v19 = malloc(v16);
          *(void *)a1 = v19;
          if (v19)
          {
            BOOL v20 = 0;
            int v21 = -(int)v15;
            int v22 = v16;
            do
            {
              if (!v22)
              {
                *(_DWORD *)(a1 + 8) = 0;
LABEL_26:
                v27 = *(void **)(a1 + 24);
                if (v27) {
                  free(v27);
                }
                if (*(void *)a1) {
                  free(*(void **)a1);
                }
                *(void *)(a1 + 32) = 0;
                double result = 0.0;
                *(_OWORD *)a1 = 0u;
                *(_OWORD *)(a1 + 16) = 0u;
                return result;
              }
              int v24 = *v17;
              if (v24 != 125)
              {
                if (v20) {
                  char v25 = v24 | 0x20;
                }
                else {
                  char v25 = *v17;
                }
                *v19++ = v25;
                --v22;
              }
              ++v17;
              BOOL v20 = v24 == 125;
            }
            while (!__CFADD__(v21++, 1));
            unsigned int v26 = v16 - v22;
            *(_DWORD *)(a1 + 8) = v16 - v22;
            if (v22 || v26 <= 1) {
              goto LABEL_26;
            }
            v28 = *(unsigned __int8 **)a1;
            unsigned int v29 = v26;
            do
            {
              int v30 = *v28++;
              a6 = FCSTable[v30 ^ a6] ^ (a6 >> 8);
              --v29;
            }
            while (v29);
            *(_WORD *)(a1 + 16) = a6;
            *(_DWORD *)(a1 + 8) = v26 - 2;
            *(_DWORD *)(a1 + 12) = v16;
            if ((a8 & 1) != 0 && a6 != a7) {
              return HDLCFrameFree(a1);
            }
          }
        }
        return result;
      }
    }
  }
  return result;
}

BOOL HDLCFrameCreateDownlinkFake(uint64_t a1, const void *a2, size_t __size)
{
  int v3 = __size;
  *(void *)(a1 + 32) = 0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  size_t v6 = __size;
  v7 = malloc(__size);
  v8 = v7;
  *(void *)a1 = v7;
  if (v7)
  {
    *(_WORD *)(a1 + 16) = 0;
    *(_DWORD *)(a1 + 8) = v3;
    *(_DWORD *)(a1 + 12) = v3;
    memcpy(v7, a2, v6);
  }
  return v8 != 0;
}

BOOL HDLCFrameCreateUplink(uint64_t a1, size_t __size, __int16 a3)
{
  int v4 = __size;
  *(void *)(a1 + 32) = 0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  size_t v6 = malloc(__size);
  *(void *)a1 = v6;
  if (v6)
  {
    *(_DWORD *)(a1 + 12) = v4;
    *(_WORD *)(a1 + 16) = a3;
  }
  return v6 != 0;
}

BOOL HDLCFrameInject(uint64_t a1, char *a2, size_t __n)
{
  unsigned int v3 = __n;
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  unsigned int v5 = *(_DWORD *)(a1 + 12) - v4;
  if (v5 >= __n)
  {
    LOWORD(v7) = *(_WORD *)(a1 + 16);
    if (__n)
    {
      v8 = a2;
      int v9 = __n;
      do
      {
        char v10 = *v8++;
        int v7 = FCSTable[(v10 ^ v7)] ^ ((unsigned __int16)(v7 & 0xFF00) >> 8);
        --v9;
      }
      while (v9);
    }
    *(_WORD *)(a1 + 16) = v7;
    memcpy((void *)(*(void *)a1 + v4), a2, __n);
    *(_DWORD *)(a1 + 8) += v3;
  }
  return v5 >= v3;
}

uint64_t HDLCFrameGetFreeSpace(uint64_t a1)
{
  return (*(_DWORD *)(a1 + 12) - *(_DWORD *)(a1 + 8));
}

uint64_t HDLCFrameEncode(uint64_t *a1, unsigned char *__b, unsigned int a3, size_t __len)
{
  uint64_t result = 0;
  unsigned int v6 = a3 - __len;
  if (a3 >= __len)
  {
    uint64_t v7 = *a1;
    if (*a1)
    {
      int v9 = __b;
      if (__len)
      {
        uint64_t v10 = __len;
        memset(__b, 126, __len);
        v9 += v10;
        uint64_t v7 = *a1;
        unint64_t v11 = *((unsigned int *)a1 + 2);
        if (v11)
        {
LABEL_5:
          uint64_t v12 = 0;
          BOOL v13 = 0;
          int v14 = v9;
          while (1)
          {
            int v15 = *(unsigned __int8 *)(v7 + v12);
            if ((v15 - 125) <= 1)
            {
              if (!v6) {
                break;
              }
              *v14++ = 125;
              LOBYTE(v15) = v15 & 0xDF;
              --v6;
            }
            if (!v6) {
              break;
            }
            *v14++ = v15;
            --v6;
            BOOL v13 = ++v12 >= v11;
            if (v11 == v12) {
              goto LABEL_13;
            }
          }
          unsigned int v6 = 0;
          uint64_t result = 0;
          int v14 = v9;
          if (!v13) {
            return result;
          }
LABEL_13:
          unsigned int v16 = *((unsigned __int16 *)a1 + 8);
          char v17 = ~(_BYTE)v16;
          if ((v16 + 127) <= 1u)
          {
LABEL_14:
            if (!v6) {
              return 0;
            }
            *v14++ = 125;
            v17 &= ~0x20u;
            if (!--v6) {
              return 0;
            }
LABEL_20:
            int v18 = ~(v16 >> 8);
            unsigned int v19 = v16 >> 8;
            *int v14 = v17;
            BOOL v20 = v14 + 1;
            unsigned int v21 = v6 - 1;
            if ((v19 + 127) <= 1u)
            {
              if (v6 == 1) {
                return 0;
              }
              v14[1] = 125;
              LOBYTE(v18) = v18 & 0xDF;
              BOOL v20 = v14 + 2;
              unsigned int v21 = v6 - 2;
            }
            if (v21)
            {
              *BOOL v20 = v18;
              if (v21 == 1) {
                return 0;
              }
              v20[1] = 126;
              return a3 - v21 + 2;
            }
            return 0;
          }
LABEL_19:
          if (!v6) {
            return 0;
          }
          goto LABEL_20;
        }
      }
      else
      {
        unsigned int v6 = a3;
        unint64_t v11 = *((unsigned int *)a1 + 2);
        if (v11) {
          goto LABEL_5;
        }
      }
      int v14 = v9;
      unsigned int v16 = *((unsigned __int16 *)a1 + 8);
      char v17 = ~(_BYTE)v16;
      if ((v16 + 127) <= 1u) {
        goto LABEL_14;
      }
      goto LABEL_19;
    }
  }
  return result;
}

uint64_t HDLCFrameGetMaxEncodedLength(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 8);
  if (!v1) {
    return 6;
  }
  v2 = *(int8x16_t **)a1;
  if (v1 < 8)
  {
    uint64_t v3 = 0;
    unsigned int v4 = 2;
    goto LABEL_14;
  }
  if (v1 >= 0x20)
  {
    uint64_t v3 = v1 & 0xFFFFFFE0;
    int32x4_t v6 = 0uLL;
    v7.i64[0] = 0x8383838383838383;
    v7.i64[1] = 0x8383838383838383;
    v8.i64[0] = 0x202020202020202;
    v8.i64[1] = 0x202020202020202;
    int32x4_t v9 = (int32x4_t)xmmword_219293F60;
    v10.i64[0] = 0x100000001;
    v10.i64[1] = 0x100000001;
    unint64_t v11 = v2 + 1;
    uint64_t v12 = v3;
    int32x4_t v13 = 0uLL;
    int32x4_t v14 = 0uLL;
    int32x4_t v15 = 0uLL;
    int32x4_t v16 = 0uLL;
    int32x4_t v17 = 0uLL;
    int32x4_t v18 = 0uLL;
    do
    {
      uint8x16_t v19 = vcgtq_u8(v8, (uint8x16_t)vaddq_s8(v11[-1], v7));
      uint16x8_t v20 = vmovl_u8(*(uint8x8_t *)v19.i8);
      uint16x8_t v21 = vmovl_high_u8(v19);
      uint8x16_t v22 = vcgtq_u8(v8, (uint8x16_t)vaddq_s8(*v11, v7));
      uint16x8_t v23 = vmovl_u8(*(uint8x8_t *)v22.i8);
      uint16x8_t v24 = vmovl_high_u8(v22);
      int32x4_t v14 = vaddq_s32(v14, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v21), v10));
      int32x4_t v13 = vaddq_s32(v13, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v21.i8), v10));
      int32x4_t v6 = vaddq_s32(v6, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v20), v10));
      int32x4_t v9 = vaddq_s32(v9, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v20.i8), v10));
      int32x4_t v18 = vaddq_s32(v18, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v24), v10));
      int32x4_t v17 = vaddq_s32(v17, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v24.i8), v10));
      int32x4_t v16 = vaddq_s32(v16, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v23), v10));
      int32x4_t v15 = vaddq_s32(v15, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v23.i8), v10));
      v11 += 2;
      v12 -= 32;
    }
    while (v12);
    unsigned int v4 = vaddvq_s32(vaddq_s32(vaddq_s32(vaddq_s32(v15, v9), vaddq_s32(v17, v13)), vaddq_s32(vaddq_s32(v16, v6), vaddq_s32(v18, v14))));
    if (v3 == v1) {
      return v4 + 4 + v1;
    }
    if ((v1 & 0x18) == 0) {
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v3 = 0;
    unsigned int v4 = 2;
  }
  uint64_t v25 = v3;
  uint64_t v3 = v1 & 0xFFFFFFF8;
  int32x4_t v26 = (int32x4_t)v4;
  int32x4_t v27 = 0uLL;
  v28 = (int8x8_t *)&v2->i8[v25];
  uint64_t v29 = v25 - v3;
  v30.i64[0] = 0x100000001;
  v30.i64[1] = 0x100000001;
  do
  {
    int8x8_t v31 = *v28++;
    uint16x8_t v32 = vmovl_u8(vcgt_u8((uint8x8_t)0x202020202020202, (uint8x8_t)vadd_s8(v31, (int8x8_t)0x8383838383838383)));
    int32x4_t v27 = vaddq_s32(v27, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v32), v30));
    int32x4_t v26 = vaddq_s32(v26, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v32.i8), v30));
    v29 += 8;
  }
  while (v29);
  unsigned int v4 = vaddvq_s32(vaddq_s32(v26, v27));
  if (v3 != v1)
  {
LABEL_14:
    uint64_t v33 = v1 - v3;
    v34 = &v2->u8[v3];
    do
    {
      int v35 = *v34++;
      if ((v35 - 125) < 2) {
        ++v4;
      }
      --v33;
    }
    while (v33);
  }
  return v4 + 4 + v1;
}

uint64_t HDLCFrameEncodeAndCache(uint64_t a1, size_t a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  if (v4)
  {
    uint64_t v5 = *(void *)a1;
    if (v4 < 8)
    {
      uint64_t v6 = 0;
      unsigned int v7 = 2;
      goto LABEL_17;
    }
    if (v4 >= 0x20)
    {
      uint64_t v6 = v4 & 0xFFFFFFE0;
      int32x4_t v11 = 0uLL;
      v12.i64[0] = 0x8383838383838383;
      v12.i64[1] = 0x8383838383838383;
      v13.i64[0] = 0x202020202020202;
      v13.i64[1] = 0x202020202020202;
      int32x4_t v14 = (int32x4_t)xmmword_219293F60;
      v15.i64[0] = 0x100000001;
      v15.i64[1] = 0x100000001;
      int32x4_t v16 = (int8x16_t *)(v5 + 16);
      uint64_t v17 = v6;
      int32x4_t v18 = 0uLL;
      int32x4_t v19 = 0uLL;
      int32x4_t v20 = 0uLL;
      int32x4_t v21 = 0uLL;
      int32x4_t v22 = 0uLL;
      int32x4_t v23 = 0uLL;
      do
      {
        uint8x16_t v24 = vcgtq_u8(v13, (uint8x16_t)vaddq_s8(v16[-1], v12));
        uint16x8_t v25 = vmovl_u8(*(uint8x8_t *)v24.i8);
        uint16x8_t v26 = vmovl_high_u8(v24);
        uint8x16_t v27 = vcgtq_u8(v13, (uint8x16_t)vaddq_s8(*v16, v12));
        uint16x8_t v28 = vmovl_u8(*(uint8x8_t *)v27.i8);
        uint16x8_t v29 = vmovl_high_u8(v27);
        int32x4_t v19 = vaddq_s32(v19, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v26), v15));
        int32x4_t v18 = vaddq_s32(v18, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v26.i8), v15));
        int32x4_t v11 = vaddq_s32(v11, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v25), v15));
        int32x4_t v14 = vaddq_s32(v14, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v25.i8), v15));
        int32x4_t v23 = vaddq_s32(v23, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v29), v15));
        int32x4_t v22 = vaddq_s32(v22, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v29.i8), v15));
        int32x4_t v21 = vaddq_s32(v21, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v28), v15));
        int32x4_t v20 = vaddq_s32(v20, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v28.i8), v15));
        v16 += 2;
        v17 -= 32;
      }
      while (v17);
      unsigned int v7 = vaddvq_s32(vaddq_s32(vaddq_s32(vaddq_s32(v20, v14), vaddq_s32(v22, v18)), vaddq_s32(vaddq_s32(v21, v11), vaddq_s32(v23, v19))));
      if (v6 == v4) {
        goto LABEL_21;
      }
      if ((v4 & 0x18) == 0)
      {
LABEL_17:
        uint64_t v38 = v4 - v6;
        v39 = (unsigned __int8 *)(v5 + v6);
        do
        {
          int v40 = *v39++;
          if ((v40 - 125) < 2) {
            ++v7;
          }
          --v38;
        }
        while (v38);
LABEL_21:
        int v8 = v7 + 4;
        if (*(void *)(a1 + 24)) {
          return 0;
        }
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v6 = 0;
      unsigned int v7 = 2;
    }
    uint64_t v30 = v6;
    uint64_t v6 = v4 & 0xFFFFFFF8;
    int32x4_t v31 = (int32x4_t)v7;
    int32x4_t v32 = 0uLL;
    uint64_t v33 = (int8x8_t *)(v5 + v30);
    uint64_t v34 = v30 - v6;
    v35.i64[0] = 0x100000001;
    v35.i64[1] = 0x100000001;
    do
    {
      int8x8_t v36 = *v33++;
      uint16x8_t v37 = vmovl_u8(vcgt_u8((uint8x8_t)0x202020202020202, (uint8x8_t)vadd_s8(v36, (int8x8_t)0x8383838383838383)));
      int32x4_t v32 = vaddq_s32(v32, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v37), v35));
      int32x4_t v31 = vaddq_s32(v31, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v37.i8), v35));
      v34 += 8;
    }
    while (v34);
    unsigned int v7 = vaddvq_s32(vaddq_s32(v31, v32));
    if (v6 == v4) {
      goto LABEL_21;
    }
    goto LABEL_17;
  }
  int v8 = 6;
  if (*(void *)(a1 + 24)) {
    return 0;
  }
LABEL_5:
  unsigned int v9 = v8 + v4;
  uint64_t result = (uint64_t)malloc((v8 + v4));
  *(void *)(a1 + 24) = result;
  if (result)
  {
    *(_DWORD *)(a1 + 32) = HDLCFrameEncode((uint64_t *)a1, (unsigned char *)result, v9, a2);
    return 1;
  }
  return result;
}

uint64_t HDLCFrameCloneDownlink(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    if (*(void *)a2)
    {
      if (*(_DWORD *)(a2 + 12) >= *(_DWORD *)(a2 + 8))
      {
        *(void *)(a1 + 32) = 0;
        *(_OWORD *)a1 = 0u;
        *(_OWORD *)(a1 + 16) = 0u;
        *(void *)(a1 + 8) = *(void *)(a2 + 8);
        *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
        uint64_t result = (uint64_t)malloc(*(unsigned int *)(a2 + 12));
        *(void *)a1 = result;
        if (result)
        {
          memcpy((void *)result, *(const void **)a2, *(unsigned int *)(a2 + 8));
          return 1;
        }
      }
      else
      {
        return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

BOOL HDLCFrameInjectUnsignedInt(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = *(unsigned int *)(a1 + 8);
  unsigned int v3 = *(_DWORD *)(a1 + 12) - v2;
  if (v3 >= 4)
  {
    unsigned __int16 v4 = FCSTable[(*(_WORD *)(a1 + 16) ^ a2)];
    unsigned int v5 = FCSTable[(v4 ^ ((unsigned __int16)(*(_WORD *)(a1 + 16) ^ a2) >> 8))];
    unsigned int v6 = FCSTable[(v5 ^ HIBYTE(v4) ^ BYTE2(a2))];
    *(_WORD *)(a1 + 16) = FCSTable[v6 ^ (v5 >> 8) ^ HIBYTE(a2)] ^ (v6 >> 8);
    *(_DWORD *)(*(void *)a1 + v2) = a2;
    *(_DWORD *)(a1 + 8) += 4;
  }
  return v3 > 3;
}

BOOL HDLCFrameInjectUnsignedShort(uint64_t a1, __int16 a2)
{
  uint64_t v2 = *(unsigned int *)(a1 + 8);
  unsigned int v3 = *(_DWORD *)(a1 + 12) - v2;
  if (v3 >= 2)
  {
    *(_WORD *)(a1 + 16) = FCSTable[FCSTable[(*(unsigned char *)(a1 + 16) ^ a2)] ^ ((unsigned __int16)((*(_WORD *)(a1 + 16) ^ a2) & 0xFF00) >> 8)] ^ HIBYTE(FCSTable[(*(unsigned char *)(a1 + 16) ^ a2)]);
    *(_WORD *)(*(void *)a1 + v2) = a2;
    *(_DWORD *)(a1 + 8) += 2;
  }
  return v3 > 1;
}

BOOL HDLCFrameInjectUnsignedChar(uint64_t a1, char a2)
{
  uint64_t v3 = *(unsigned int *)(a1 + 8);
  int v2 = *(_DWORD *)(a1 + 12);
  if (v2 != v3)
  {
    *(_WORD *)(a1 + 16) = FCSTable[(*(_WORD *)(a1 + 16) ^ a2)] ^ HIBYTE(*(_WORD *)(a1 + 16));
    *(unsigned char *)(*(void *)a1 + v3) = a2;
    ++*(_DWORD *)(a1 + 8);
  }
  return v2 != v3;
}

uint64_t CRCCCITT(uint64_t result, char *a2, int a3)
{
  for (; a3; --a3)
  {
    char v3 = *a2++;
    LODWORD(result) = FCSTable[(v3 ^ result)] ^ ((unsigned __int16)(result & 0xFF00) >> 8);
  }
  return (unsigned __int16)result;
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}