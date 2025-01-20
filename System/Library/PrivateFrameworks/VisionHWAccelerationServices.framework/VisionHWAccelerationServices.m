double sub_226DB74B4(uint64_t a1, uint64_t a2)
{
  double result;

  result = 2.50320809e-308;
  *(_OWORD *)(a1 + 8) = xmmword_226DD3CD0;
  *(void *)a1 = &unk_26DAEF410;
  *(void *)(a1 + 24) = a2;
  return result;
}

double sub_226DB74E4(uint64_t a1, uint64_t a2)
{
  double result = 2.50320809e-308;
  *(_OWORD *)(a1 + 8) = xmmword_226DD3CD0;
  *(void *)a1 = &unk_26DAEF440;
  *(void *)(a1 + 24) = a2;
  return result;
}

double sub_226DB7514(uint64_t a1, uint64_t a2)
{
  double result = 2.50320809e-308;
  *(_OWORD *)(a1 + 8) = xmmword_226DD3CD0;
  *(void *)a1 = &unk_26DAEF470;
  *(void *)(a1 + 24) = a2;
  return result;
}

BOOL sub_226DB7544(uint64_t a1, _DWORD *a2, uint64_t a3, unsigned int a4, int a5, unsigned int a6, int a7)
{
  uint64_t v7 = a3 + *(unsigned int *)(a3 + 4);
  uint64_t v8 = *(unsigned int *)(v7 + 144);
  if (v8 == 20)
  {
    *(_OWORD *)(v7 + 220) = 0u;
    *(_OWORD *)(v7 + 204) = 0u;
    *(_OWORD *)(v7 + 188) = 0u;
    *(_OWORD *)(v7 + 172) = 0u;
    *(_OWORD *)(v7 + 156) = 0u;
    *(_OWORD *)(v7 + 1248) = 0u;
    *(_OWORD *)(v7 + 1264) = 0u;
    *(_OWORD *)(v7 + 1280) = 0u;
    *(_OWORD *)(v7 + 1296) = 0u;
    *(_OWORD *)(v7 + 1312) = 0u;
    *(_DWORD *)(v7 + 152) = 0x7FFFFFFF;
    *(_DWORD *)(v7 + 1244) = 0x7FFFFFFF;
    if (a4)
    {
      *(_DWORD *)(v7 + 152) = 0;
      *(_WORD *)(v7 + 160) = 64;
      *(_WORD *)(v7 + 162) = a4 >> 6;
      *(_DWORD *)(v7 + 164) = 524352;
    }
    if (a6)
    {
      *(void *)(v7 + 1244) = 1;
      *(_WORD *)(v7 + 1252) = 64;
      *(_WORD *)(v7 + 1254) = a6 >> 6;
      *(_DWORD *)(v7 + 1256) = 524352;
    }
    if (*a2)
    {
      v9 = (_DWORD *)((char *)a2 + a2[1]);
      uint64_t v10 = v9[3];
      if (v10 == 3776)
      {
        if (v9[1] == 21)
        {
          if (a4)
          {
            v9[926] = a4;
            uint64_t v11 = *(void *)(a1 + 24);
            v9[925] = HIDWORD(v11);
            v9[924] = v11 + a5;
            unsigned int v12 = v9[5] & 0xFFFFFFF3 | 4;
            v9[5] = v12;
            if (a6)
            {
LABEL_11:
              v9[929] = a6;
              uint64_t v13 = *(void *)(a1 + 24);
              v9[928] = HIDWORD(v13);
              v9[927] = v13 + a7;
              unsigned int v14 = v12 & 0xFFFFFFCF | 0x10;
LABEL_22:
              int32x4_t v37 = (int32x4_t)vandq_s8((int8x16_t)vdupq_n_s32(v14), (int8x16_t)xmmword_226DD3CE0);
              BOOL v38 = (v14 & 0xC000) == 0x8000;
              BOOL v39 = (v14 & 0x30000) == 0x20000;
              unsigned int v40 = v14 & 0xFFFFFFFC;
              BOOL result = 1;
              if (((vmaxv_u16((uint16x4_t)vmovn_s32(vceqq_s32(v37, (int32x4_t)xmmword_226DD3CF0))) | v38) | v39)) {
                int v41 = 2;
              }
              else {
                int v41 = 1;
              }
              v9[5] = v40 | v41;
              return result;
            }
          }
          else
          {
            v9[926] = 0;
            *((void *)v9 + 462) = 0;
            unsigned int v12 = v9[5] & 0xFFFFFFF3;
            v9[5] = v12;
            if (a6) {
              goto LABEL_11;
            }
          }
          *((void *)v9 + 464) = 0;
          v9[927] = 0;
          unsigned int v14 = v12 & 0xFFFFFFCF;
          goto LABEL_22;
        }
        BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (result)
        {
          sub_226DD1B6C();
          return 0;
        }
      }
      else
      {
        BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (result)
        {
          sub_226DD1BE4(v10, v30, v31, v32, v33, v34, v35, v36);
          return 0;
        }
      }
    }
    else
    {
      BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (result)
      {
        sub_226DD1AF8(result, v23, v24, v25, v26, v27, v28, v29);
        return 0;
      }
    }
  }
  else
  {
    BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_226DD1C68(v8, v16, v17, v18, v19, v20, v21, v22);
      return 0;
    }
  }
  return result;
}

BOOL sub_226DB77C0(uint64_t a1, _DWORD *a2, uint64_t a3, unsigned int a4, int a5, unsigned int a6, int a7)
{
  uint64_t v7 = a3 + *(unsigned int *)(a3 + 4);
  uint64_t v8 = *(unsigned int *)(v7 + 144);
  if (v8 == 18)
  {
    *(_OWORD *)(v7 + 220) = 0u;
    *(_OWORD *)(v7 + 204) = 0u;
    *(_OWORD *)(v7 + 188) = 0u;
    *(_OWORD *)(v7 + 172) = 0u;
    *(_OWORD *)(v7 + 156) = 0u;
    *(_OWORD *)(v7 + 1080) = 0u;
    *(_OWORD *)(v7 + 1096) = 0u;
    *(_OWORD *)(v7 + 1112) = 0u;
    *(_OWORD *)(v7 + 1128) = 0u;
    *(_OWORD *)(v7 + 1144) = 0u;
    *(_DWORD *)(v7 + 152) = 0x7FFFFFFF;
    *(_DWORD *)(v7 + 1076) = 0x7FFFFFFF;
    if (a4)
    {
      *(_DWORD *)(v7 + 152) = 0;
      *(_WORD *)(v7 + 160) = 64;
      *(_WORD *)(v7 + 162) = a4 >> 6;
      *(_DWORD *)(v7 + 164) = 524352;
    }
    if (a6)
    {
      *(void *)(v7 + 1076) = 1;
      *(_WORD *)(v7 + 1084) = 64;
      *(_WORD *)(v7 + 1086) = a6 >> 6;
      *(_DWORD *)(v7 + 1088) = 524352;
    }
    if (*a2)
    {
      v9 = (_DWORD *)((char *)a2 + a2[1]);
      if (v9[3] == 6528)
      {
        if (v9[1] == 26)
        {
          if (a4)
          {
            v9[1600] = a4;
            uint64_t v10 = *(void *)(a1 + 24);
            v9[1599] = HIDWORD(v10);
            v9[1598] = v10 + a5;
            unsigned int v11 = v9[5] & 0xFFFFFFF3 | 4;
            v9[5] = v11;
            if (a6)
            {
LABEL_11:
              v9[1603] = a6;
              uint64_t v12 = *(void *)(a1 + 24);
              v9[1602] = HIDWORD(v12);
              v9[1601] = v12 + a7;
              unsigned int v13 = v11 & 0xFFFFFFCF | 0x10;
LABEL_22:
              int32x4_t v29 = (int32x4_t)vandq_s8((int8x16_t)vdupq_n_s32(v13), (int8x16_t)xmmword_226DD3CE0);
              BOOL v30 = (v13 & 0xC000) == 0x8000;
              BOOL v31 = (v13 & 0x30000) == 0x20000;
              unsigned int v32 = v13 & 0xFFFFFFFC;
              BOOL result = 1;
              if (((vmaxv_u16((uint16x4_t)vmovn_s32(vceqq_s32(v29, (int32x4_t)xmmword_226DD3CF0))) | v30) | v31)) {
                int v33 = 2;
              }
              else {
                int v33 = 1;
              }
              v9[5] = v32 | v33;
              return result;
            }
          }
          else
          {
            v9[1600] = 0;
            *((void *)v9 + 799) = 0;
            unsigned int v11 = v9[5] & 0xFFFFFFF3;
            v9[5] = v11;
            if (a6) {
              goto LABEL_11;
            }
          }
          *((void *)v9 + 801) = 0;
          unsigned int v13 = v11 & 0xFFFFFFCF;
          v9[1601] = 0;
          goto LABEL_22;
        }
        BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (result)
        {
          sub_226DD1CDC();
          return 0;
        }
      }
      else
      {
        BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (result)
        {
          sub_226DD1D54();
          return 0;
        }
      }
    }
    else
    {
      BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (result)
      {
        sub_226DD1AF8(result, v22, v23, v24, v25, v26, v27, v28);
        return 0;
      }
    }
  }
  else
  {
    BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_226DD1C68(v8, v15, v16, v17, v18, v19, v20, v21);
      return 0;
    }
  }
  return result;
}

BOOL sub_226DB7A34(uint64_t a1, _DWORD *a2, uint64_t a3, unsigned int a4, int a5, unsigned int a6, int a7)
{
  uint64_t v7 = a3 + *(unsigned int *)(a3 + 4);
  uint64_t v8 = *(unsigned int *)(v7 + 144);
  if (v8 == 18)
  {
    *(_OWORD *)(v7 + 220) = 0u;
    *(_OWORD *)(v7 + 204) = 0u;
    *(_OWORD *)(v7 + 188) = 0u;
    *(_OWORD *)(v7 + 172) = 0u;
    *(_OWORD *)(v7 + 156) = 0u;
    *(_OWORD *)(v7 + 1080) = 0u;
    *(_OWORD *)(v7 + 1096) = 0u;
    *(_OWORD *)(v7 + 1112) = 0u;
    *(_OWORD *)(v7 + 1128) = 0u;
    *(_OWORD *)(v7 + 1144) = 0u;
    *(_DWORD *)(v7 + 152) = 0x7FFFFFFF;
    *(_DWORD *)(v7 + 1076) = 0x7FFFFFFF;
    if (a4)
    {
      *(_DWORD *)(v7 + 152) = 0;
      *(_WORD *)(v7 + 160) = 64;
      *(_WORD *)(v7 + 162) = a4 >> 6;
      *(_DWORD *)(v7 + 164) = 524352;
    }
    if (a6)
    {
      *(void *)(v7 + 1076) = 1;
      *(_WORD *)(v7 + 1084) = 64;
      *(_WORD *)(v7 + 1086) = a6 >> 6;
      *(_DWORD *)(v7 + 1088) = 524352;
    }
    if (*a2)
    {
      v9 = (_DWORD *)((char *)a2 + a2[1]);
      if (v9[3] == 6528)
      {
        if (v9[1] == 29)
        {
          if (a4)
          {
            v9[1600] = a4;
            uint64_t v10 = *(void *)(a1 + 24);
            v9[1599] = HIDWORD(v10);
            v9[1598] = v10 + a5;
            unsigned int v11 = v9[5] & 0xFFFFFFF3 | 4;
            v9[5] = v11;
            if (a6)
            {
LABEL_11:
              v9[1603] = a6;
              uint64_t v12 = *(void *)(a1 + 24);
              v9[1602] = HIDWORD(v12);
              v9[1601] = v12 + a7;
              unsigned int v13 = v11 & 0xFFFFFFCF | 0x10;
LABEL_22:
              int32x4_t v29 = (int32x4_t)vandq_s8((int8x16_t)vdupq_n_s32(v13), (int8x16_t)xmmword_226DD3CE0);
              BOOL v30 = (v13 & 0xC000) == 0x8000;
              BOOL v31 = (v13 & 0x30000) == 0x20000;
              unsigned int v32 = v13 & 0xFFFFFFFC;
              BOOL result = 1;
              if (((vmaxv_u16((uint16x4_t)vmovn_s32(vceqq_s32(v29, (int32x4_t)xmmword_226DD3CF0))) | v30) | v31)) {
                int v33 = 2;
              }
              else {
                int v33 = 1;
              }
              v9[5] = v32 | v33;
              return result;
            }
          }
          else
          {
            v9[1600] = 0;
            *((void *)v9 + 799) = 0;
            unsigned int v11 = v9[5] & 0xFFFFFFF3;
            v9[5] = v11;
            if (a6) {
              goto LABEL_11;
            }
          }
          *((void *)v9 + 801) = 0;
          unsigned int v13 = v11 & 0xFFFFFFCF;
          v9[1601] = 0;
          goto LABEL_22;
        }
        BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (result)
        {
          sub_226DD1DC4();
          return 0;
        }
      }
      else
      {
        BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (result)
        {
          sub_226DD1D54();
          return 0;
        }
      }
    }
    else
    {
      BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (result)
      {
        sub_226DD1AF8(result, v22, v23, v24, v25, v26, v27, v28);
        return 0;
      }
    }
  }
  else
  {
    BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_226DD1C68(v8, v15, v16, v17, v18, v19, v20, v21);
      return 0;
    }
  }
  return result;
}

void sub_226DB7CAC()
{
}

uint64_t sub_226DB7CC0()
{
  return 1;
}

void sub_226DB7CCC()
{
}

uint64_t sub_226DB7CE0()
{
  return 2;
}

void sub_226DB7CEC()
{
}

uint64_t sub_226DB7D00()
{
  return 2;
}

void sub_226DB7D08(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_226DB7D54(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xEu);
}

void sub_226DB7D70(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t sub_226DB7D8C(uint64_t a1, CVPixelBufferRef pixelBuffer, uint64_t a3)
{
  *(void *)a1 = &unk_26DAEF4F8;
  *(void *)(a1 + 8) = pixelBuffer;
  *(void *)(a1 + 16) = a3;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(void *)(a1 + 72) = 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 80) = -1;
  *(void *)(a1 + 84) = 0;
  *(void *)(a1 + 100) = 0;
  *(void *)(a1 + 92) = 0;
  *(_DWORD *)(a1 + 108) = 0;
  *(void *)(a1 + 88) = CVPixelBufferGetBaseAddress(pixelBuffer);
  *(void *)(a1 + 96) = CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(a1 + 16));
  if (sub_226DB74A4()) {
    operator new();
  }
  if (sub_226DB74A8()) {
    operator new();
  }
  if (sub_226DB74AC()) {
    operator new();
  }
  if (sub_226DB74B0()) {
    operator new();
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_226DD1E3C();
    uint64_t v6 = *(void *)(a1 + 104);
    *(void *)(a1 + 104) = 0;
    if (!v6) {
      return a1;
    }
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 104);
    *(void *)(a1 + 104) = 0;
    if (!v6) {
      return a1;
    }
  }
  (*(void (**)(uint64_t, __n128))(*(void *)v6 + 8))(v6, v5);
  return a1;
}

void sub_226DB7F58(_Unwind_Exception *a1)
{
  uint64_t v4 = v2;
  MEMORY[0x22A669B00](v4, 0x1081C40ABB4582ELL);
  uint64_t v6 = v1[13];
  v1[13] = 0;
  if (v6)
  {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
    uint64_t v7 = (void *)v1[6];
    if (!v7)
    {
LABEL_3:
      uint64_t v8 = *v3;
      if (!*v3) {
        goto LABEL_4;
      }
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v7 = (void *)v1[6];
    if (!v7) {
      goto LABEL_3;
    }
  }
  v1[7] = v7;
  operator delete(v7);
  uint64_t v8 = *v3;
  if (!*v3) {
LABEL_4:
  }
    _Unwind_Resume(a1);
LABEL_7:
  v1[4] = v8;
  operator delete(v8);
  _Unwind_Resume(a1);
}

void *sub_226DB8000(void *a1)
{
  *a1 = &unk_26DAEF4F8;
  uint64_t v2 = a1[13];
  a1[13] = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  v3 = (void *)a1[6];
  if (v3)
  {
    a1[7] = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)a1[3];
  if (v4)
  {
    a1[4] = v4;
    operator delete(v4);
  }
  return a1;
}

void sub_226DB8090(void *a1)
{
  *a1 = &unk_26DAEF4F8;
  uint64_t v2 = a1[13];
  a1[13] = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  v3 = (void *)a1[6];
  if (v3)
  {
    a1[7] = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)a1[3];
  if (v4)
  {
    a1[4] = v4;
    operator delete(v4);
  }

  JUMPOUT(0x22A669B00);
}

BOOL sub_226DB8140(uint64_t a1, int a2)
{
  return (*(unsigned int (**)(void))(**(void **)(a1 + 104) + 24))(*(void *)(a1 + 104)) == a2;
}

BOOL sub_226DB8190(uint64_t a1)
{
  return *(void *)(a1 + 104) != 0;
}

void *sub_226DB81A0(void *result)
{
  result[4] = result[3];
  result[7] = result[6];
  uint64_t v1 = result[13];
  result[9] = *(unsigned int *)(v1 + 12);
  result[10] = *(unsigned int *)(v1 + 20);
  return result;
}

BOOL sub_226DB81C8(uint64_t a1, int a2, unsigned int a3, unsigned int a4, void *__src, int a6)
{
  if (!__src || !*(void *)(a1 + 96)) {
    return 0;
  }
  unsigned int v9 = *(_DWORD *)(*(void *)(a1 + 104) + 20);
  BOOL result = v9 > a3;
  if (a4 && v9 > a3)
  {
    BOOL v13 = a3 != a6;
    uint64_t v15 = *(char **)(a1 + 56);
    unint64_t v14 = *(void *)(a1 + 64);
    if ((unint64_t)v15 >= v14)
    {
      uint64_t v17 = (char **)(a1 + 48);
      uint64_t v18 = *(char **)(a1 + 48);
      uint64_t v19 = (v15 - v18) >> 4;
      unint64_t v20 = v19 + 1;
      if ((unint64_t)(v19 + 1) >> 60) {
        sub_226DB87BC();
      }
      uint64_t v21 = v14 - (void)v18;
      if (v21 >> 3 > v20) {
        unint64_t v20 = v21 >> 3;
      }
      if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v22 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v22 = v20;
      }
      if (v22)
      {
        if (v22 >> 60) {
          sub_226DB8864();
        }
        uint64_t v23 = (char *)operator new(16 * v22);
        uint64_t v17 = (char **)(a1 + 48);
      }
      else
      {
        uint64_t v23 = 0;
      }
      uint64_t v24 = &v23[16 * v19];
      *(_DWORD *)uint64_t v24 = a3;
      *((_DWORD *)v24 + 1) = a6;
      *((_DWORD *)v24 + 2) = a4;
      v24[12] = v13;
      uint64_t v16 = v24 + 16;
      if (v15 != v18)
      {
        do
        {
          *((_OWORD *)v24 - 1) = *((_OWORD *)v15 - 1);
          v24 -= 16;
          v15 -= 16;
        }
        while (v15 != v18);
        uint64_t v15 = *v17;
      }
      *(void *)(a1 + 48) = v24;
      *(void *)(a1 + 56) = v16;
      *(void *)(a1 + 64) = &v23[16 * v22];
      if (v15) {
        operator delete(v15);
      }
    }
    else
    {
      *(_DWORD *)uint64_t v15 = a3;
      *((_DWORD *)v15 + 1) = a6;
      *((_DWORD *)v15 + 2) = a4;
      uint64_t v16 = v15 + 16;
      v15[12] = v13;
    }
    *(void *)(a1 + 56) = v16;
    unsigned int v25 = *(_DWORD *)(a1 + 80);
    unsigned int v26 = *(_DWORD *)(a1 + 84);
    if (v25 >= a3) {
      unsigned int v25 = a3;
    }
    if (v26 <= a4 + a3) {
      unsigned int v26 = a4 + a3;
    }
    *(_DWORD *)(a1 + 80) = v25;
    *(_DWORD *)(a1 + 84) = v26;
    memmove((void *)(*(void *)(a1 + 96) + a3), __src, a4);
    return 1;
  }
  return result;
}

uint64_t sub_226DB836C(void *a1, int a2, unsigned int a3, size_t __len, void *__src, unsigned int a6)
{
  if (!__src) {
    return 0;
  }
  if (!a1[11]) {
    return 0;
  }
  uint64_t v8 = a1[13];
  unsigned int v9 = *(_DWORD *)(v8 + 8);
  if (v9 > a3) {
    return 0;
  }
  unsigned int v11 = *(_DWORD *)(v8 + 12);
  if (v9 > a6 || v11 <= a3) {
    return 0;
  }
  if (__len)
  {
    uint64_t v16 = (char *)a1[3];
    uint64_t v18 = (char *)a1[4];
    uint64_t v17 = (void **)(a1 + 3);
    BOOL v19 = a3 != a6;
    unint64_t v20 = v16;
    if (a3 == a6)
    {
      if (v16 != v18)
      {
        unint64_t v20 = (char *)a1[3];
        while (*(_DWORD *)v20 != a3)
        {
          v20 += 16;
          if (v20 == v18) {
            goto LABEL_25;
          }
        }
      }
      if (v20 != v18) {
        BOOL v19 = 1;
      }
    }
    else
    {
      if (v16 != v18)
      {
        unint64_t v20 = (char *)a1[3];
        while (*(_DWORD *)v20 != a3)
        {
          v20 += 16;
          if (v20 == v18) {
            goto LABEL_25;
          }
        }
      }
      if (v20 != v18) {
        v20[12] = 1;
      }
    }
LABEL_25:
    unint64_t v21 = a1[5];
    if ((unint64_t)v18 >= v21)
    {
      uint64_t v23 = (v18 - v16) >> 4;
      unint64_t v24 = v23 + 1;
      if ((unint64_t)(v23 + 1) >> 60) {
        sub_226DB87BC();
      }
      uint64_t v25 = v21 - (void)v16;
      if (v25 >> 3 > v24) {
        unint64_t v24 = v25 >> 3;
      }
      if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v26 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v26 = v24;
      }
      if (v26)
      {
        BOOL v29 = v19;
        if (v26 >> 60) {
          sub_226DB8864();
        }
        uint64_t v27 = (char *)operator new(16 * v26);
        BOOL v19 = v29;
      }
      else
      {
        uint64_t v27 = 0;
      }
      uint64_t v28 = &v27[16 * v23];
      *(_DWORD *)uint64_t v28 = a3;
      *((_DWORD *)v28 + 1) = a6;
      *((_DWORD *)v28 + 2) = __len;
      v28[12] = v19;
      unint64_t v22 = v28 + 16;
      if (v16 != v18)
      {
        do
        {
          *((_OWORD *)v28 - 1) = *((_OWORD *)v18 - 1);
          v28 -= 16;
          v18 -= 16;
        }
        while (v18 != v16);
        uint64_t v16 = (char *)*v17;
      }
      a1[3] = v28;
      a1[4] = v22;
      a1[5] = &v27[16 * v26];
      if (v16) {
        operator delete(v16);
      }
    }
    else
    {
      *(_DWORD *)uint64_t v18 = a3;
      *((_DWORD *)v18 + 1) = a6;
      *((_DWORD *)v18 + 2) = __len;
      unint64_t v22 = v18 + 16;
      v18[12] = v19;
    }
    a1[4] = v22;
    if (__len) {
      memmove((void *)(a1[11] + a6 - *(_DWORD *)(a1[13] + 8)), __src, __len);
    }
  }
  return 1;
}

uint64_t sub_226DB8584(uint64_t a1, int a2, uint64_t a3, size_t a4)
{
  uint64_t v4 = *(void *)(a1 + 96);
  if (!v4 || *(_DWORD *)(*(void *)(a1 + 104) + 20) <= a3) {
    return 0;
  }
  if (a4) {
    bzero((void *)(v4 + a3), a4);
  }
  return 1;
}

uint64_t sub_226DB85D0()
{
  return 1;
}

uint64_t sub_226DB85D8()
{
  return 1;
}

uint64_t sub_226DB85E0()
{
  return 1;
}

uint64_t sub_226DB85E8(uint64_t a1, uint64_t a2)
{
  BaseAddress = CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(a2 + 16));
  __n128 v5 = CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(a2 + 24));
  if (BaseAddress) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_226DD1E84();
    }
    return 0;
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 24);
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8 == v9)
    {
      *(void *)(a1 + 72) = 0;
    }
    else
    {
      uint64_t v10 = v9 + 8;
      char v11 = 1;
      do
      {
        uint64_t v12 = v10 - 8;
        unsigned int v13 = *(_DWORD *)(v10 - 8);
        if (!*(unsigned char *)(v10 + 4))
        {
          unsigned int v14 = *(_DWORD *)v10 + v13;
          if ((v11 & 1) == 0)
          {
            if (v13 >= *(_DWORD *)(a1 + 72)) {
              unsigned int v13 = *(_DWORD *)(a1 + 72);
            }
            if (*(_DWORD *)(a1 + 76) > v14) {
              unsigned int v14 = *(_DWORD *)(a1 + 76);
            }
          }
          char v11 = 0;
          *(_DWORD *)(a1 + 72) = v13;
          *(_DWORD *)(a1 + 76) = v14;
        }
        v10 += 16;
      }
      while (v12 + 16 != v8);
    }
    uint64_t v16 = *(void *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 56);
    if (v15 == v16)
    {
      unsigned int v23 = 0;
      unsigned int v22 = 0;
    }
    else
    {
      uint64_t v17 = v16 + 8;
      char v18 = 1;
      do
      {
        uint64_t v19 = v17 - 8;
        unsigned int v20 = *(_DWORD *)(v17 - 8);
        if (!*(unsigned char *)(v17 + 4))
        {
          unsigned int v21 = *(_DWORD *)v17 + v20;
          if ((v18 & 1) == 0)
          {
            if (v20 >= *(_DWORD *)(a1 + 80)) {
              unsigned int v20 = *(_DWORD *)(a1 + 80);
            }
            if (*(_DWORD *)(a1 + 84) > v21) {
              unsigned int v21 = *(_DWORD *)(a1 + 84);
            }
          }
          char v18 = 0;
          *(_DWORD *)(a1 + 80) = v20;
          *(_DWORD *)(a1 + 84) = v21;
        }
        v17 += 16;
      }
      while (v19 + 16 != v15);
      unsigned int v22 = *(_DWORD *)(a1 + 80) & 0xFFFFFFC0;
      unsigned int v23 = (*(_DWORD *)(a1 + 84) + 63) & 0xFFFFFFC0;
    }
    unsigned int v24 = (*(_DWORD *)(a1 + 76) + 63) & 0xFFFFFFC0;
    *(_DWORD *)(a1 + 72) &= 0xFFFFFFC0;
    *(_DWORD *)(a1 + 76) = v24;
    *(_DWORD *)(a1 + 80) = v22;
    *(_DWORD *)(a1 + 84) = v23;
    uint64_t v25 = *(uint64_t (**)(void))(**(void **)(a1 + 104) + 16);
    return v25();
  }
}

void sub_226DB87BC()
{
}

void sub_226DB87D4(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_226DB8830(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2647E6A98, MEMORY[0x263F8C060]);
}

void sub_226DB881C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_226DB8830(std::logic_error *a1, const char *a2)
{
  BOOL result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void sub_226DB8864()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void sub_226DB8898(uint64_t a1)
{
  *(unsigned char *)(a1 + 88) = 1;
  uint64_t v2 = (std::mutex *)(a1 + 280);
  std::mutex::lock((std::mutex *)(a1 + 280));
  if (atomic_exchange((atomic_uchar *volatile)(a1 + 204), 0)) {
    dispatch_suspend(*(dispatch_object_t *)(a1 + 208));
  }
  dispatch_time_t v3 = dispatch_time(0, 5000000);
  dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 208), v3, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
  if ((atomic_exchange((atomic_uchar *volatile)(a1 + 204), 1u) & 1) == 0) {
    dispatch_resume(*(dispatch_object_t *)(a1 + 208));
  }

  std::mutex::unlock(v2);
}

void sub_226DB8934(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    uint64_t v4 = *(__CVBuffer **)(a2 + 24);
    if (v4)
    {
      CVPixelBufferUnlockBaseAddress(v4, 0);
      CVPixelBufferRelease(*(CVPixelBufferRef *)(a2 + 24));
      *(void *)(a2 + 24) = 0;
    }
    __n128 v5 = *(__CVBuffer **)(a2 + 16);
    if (v5)
    {
      CVPixelBufferUnlockBaseAddress(v5, 0);
      CVPixelBufferRelease(*(CVPixelBufferRef *)(a2 + 16));
      *(void *)(a2 + 16) = 0;
    }
    BOOL v6 = *(__CVBuffer **)(a2 + 32);
    if (v6)
    {
      CVPixelBufferUnlockBaseAddress(v6, 0);
      CVPixelBufferRelease(*(CVPixelBufferRef *)(a2 + 32));
      *(void *)(a2 + 32) = 0;
    }
    uint64_t v7 = *(__CVBuffer **)(a2 + 40);
    if (v7)
    {
      CVPixelBufferUnlockBaseAddress(v7, 0);
      CVPixelBufferRelease(*(CVPixelBufferRef *)(a2 + 40));
      *(void *)(a2 + 40) = 0;
    }
    uint64_t v8 = *(__CVBuffer **)(a2 + 48);
    if (v8)
    {
      CVPixelBufferUnlockBaseAddress(v8, 0);
      CVPixelBufferRelease(*(CVPixelBufferRef *)(a2 + 48));
      *(void *)(a2 + 48) = 0;
    }
  }
  uint64_t v9 = *(void *)(a2 + 64) - *(void *)(a2 + 56);
  if (v9)
  {
    uint64_t v10 = 0;
    unint64_t v11 = v9 >> 3;
    if (v11 <= 1) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = v11;
    }
    do
    {
      uint64_t v13 = *(void *)(a2 + 56);
      unsigned int v14 = *(__CVBuffer **)(v13 + 8 * v10);
      if (v14)
      {
        CVPixelBufferUnlockBaseAddress(v14, 0);
        CVPixelBufferRelease(*(CVPixelBufferRef *)(v13 + 8 * v10));
        *(void *)(v13 + 8 * v10) = 0;
      }
      ++v10;
    }
    while (v12 != v10);
  }
}

__IOSurface *sub_226DB8A48(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
  __n128 v5 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  unint64_t v7 = a1 + a2 - 1;
  uint64_t v8 = (const void *)*MEMORY[0x263F0EF50];
  uint32_t valuePtr = a2;
  unint64_t v9 = v7 / a2;
  CFNumberRef v10 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(Mutable, v8, v10);
  CFRelease(v10);
  unint64_t v11 = (const void *)*MEMORY[0x263F0EDF8];
  uint32_t valuePtr = v9;
  CFNumberRef v12 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(Mutable, v11, v12);
  CFRelease(v12);
  uint64_t v13 = (const void *)*MEMORY[0x263F0ED50];
  uint32_t valuePtr = a2;
  CFNumberRef v14 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(Mutable, v13, v14);
  CFRelease(v14);
  uint64_t v15 = (const void *)*MEMORY[0x263F0EE48];
  uint32_t valuePtr = 1278226488;
  CFNumberRef v16 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(Mutable, v15, v16);
  CFRelease(v16);
  uint64_t v17 = CFArrayCreateMutable(0, 1, MEMORY[0x263EFFF70]);
  char v18 = CFDictionaryCreateMutable(0, 0, v4, v5);
  uint64_t v19 = (const void *)*MEMORY[0x263F0EF20];
  uint32_t valuePtr = a2;
  CFNumberRef v20 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(v18, v19, v20);
  CFRelease(v20);
  unsigned int v21 = (const void *)*MEMORY[0x263F0EEE8];
  uint32_t valuePtr = v9;
  CFNumberRef v22 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(v18, v21, v22);
  CFRelease(v22);
  unsigned int v23 = (const void *)*MEMORY[0x263F0EE70];
  uint32_t valuePtr = a2;
  CFNumberRef v24 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(v18, v23, v24);
  CFRelease(v24);
  CFArrayAppendValue(v17, v18);
  CFRelease(v18);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F0EF00], v17);
  CFRelease(v17);
  uint64_t v25 = IOSurfaceCreate(Mutable);
  CFRelease(Mutable);
  uint32_t valuePtr = 0;
  IOSurfaceLock(v25, 1u, &valuePtr);
  return v25;
}

BOOL sub_226DB8CFC(void *a1, CVPixelBufferRef *a2, char *key)
{
  if (*a2) {
    return 1;
  }
  xpc_object_t value = xpc_dictionary_get_value(a1, key);
  if (value)
  {
    BOOL v6 = IOSurfaceLookupFromXPCObject(value);
    if (v6)
    {
      unint64_t v7 = v6;
      if (!CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x263EFFB08], v6, 0, a2))
      {
        if (CVPixelBufferLockBaseAddress(*a2, 0))
        {
          BOOL v8 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          if (v8) {
            sub_226DD1FAC(v8, v9, v10, v11, v12, v13, v14, v15);
          }
        }
        CFRelease(v7);
        return 1;
      }
      CFRelease(v7);
      BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (result)
      {
        sub_226DD1FE8();
        return 0;
      }
    }
    else
    {
      BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (result)
      {
        sub_226DD1F3C();
        return 0;
      }
    }
  }
  else
  {
    BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_226DD1ECC();
      return 0;
    }
  }
  return result;
}

void sub_226DB8E3C(uint64_t *a1)
{
}

void sub_226DB9044(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5)
{
  if ((a3 || a4 < 1 || !a5) && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    sub_226DD2058(a5, a3, a4);
  }
}

uint64_t sub_226DB90B8(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  kdebug_trace();
  kdebug_trace();
  std::mutex::lock((std::mutex *)(a1 + 216));
  uint64_t v2 = *(const void ***)(a1 + 16);
  if (v2)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(void *)(a1 + 16) = 0;
LABEL_4:
      sub_226DC7B9C(*v2);
      MEMORY[0x22A669B00](v2, 0x20C4093837F09);
      goto LABEL_5;
    }
    LOWORD(v25[0]) = 0;
    _os_log_error_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_ERROR, "VisionHWAServer: createDeviceAndSession called while active_session exists", (uint8_t *)v25, 2u);
    uint64_t v2 = *(const void ***)(a1 + 16);
    *(void *)(a1 + 16) = 0;
    if (v2) {
      goto LABEL_4;
    }
  }
LABEL_5:
  if (*(void *)a1)
  {
    BOOL v3 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_226DD212C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
    uint64_t v11 = *(std::__shared_weak_count **)(a1 + 8);
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
    if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  sub_226DC72EC(1, v25);
  long long v12 = *(_OWORD *)v25;
  *(_OWORD *)uint64_t v25 = 0uLL;
  uint64_t v13 = *(std::__shared_weak_count **)(a1 + 8);
  *(_OWORD *)a1 = v12;
  if (v13 && !atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
  uint64_t v14 = (std::__shared_weak_count *)v25[1];
  if (v25[1] && !atomic_fetch_add((atomic_ullong *volatile)(v25[1] + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
    std::__shared_weak_count::__release_weak(v14);
    uint64_t v15 = *(void **)a1;
    if (*(void *)a1)
    {
LABEL_17:
      v26[0] = &unk_26DAEF5E0;
      v26[1] = a1;
      uint64_t v27 = v26;
      sub_226DC779C(v15, v26);
      if (v27 == v26)
      {
        (*(void (**)(void *))(v26[0] + 32))(v26);
      }
      else if (v27)
      {
        (*(void (**)(void *))(*v27 + 40))(v27);
      }
      sub_226DB8E3C((uint64_t *)a1);
    }
  }
  else
  {
    uint64_t v15 = *(void **)a1;
    if (*(void *)a1) {
      goto LABEL_17;
    }
  }
  BOOL v16 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (v16) {
    sub_226DD20F0(v16, v17, v18, v19, v20, v21, v22, v23);
  }
  std::mutex::unlock((std::mutex *)(a1 + 216));
  kdebug_trace();
  return 6;
}

void sub_226DB9430(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  sub_226DBC39C(exception_object);
}

void sub_226DB9488(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void *sub_226DB949C(void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
    return a1;
  }
  else
  {
    if (v2) {
      (*(void (**)(void *))(*v2 + 40))(v2);
    }
    return a1;
  }
}

uint64_t sub_226DB952C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t *a5)
{
  kdebug_trace();
  if (!a2 && (BOOL v10 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)))
  {
    sub_226DD21AC(v10, v11, v12, v13, v14, v15, v16, v17);
    if (a3) {
      goto LABEL_6;
    }
  }
  else if (a3)
  {
    goto LABEL_6;
  }
  BOOL v18 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (v18) {
    sub_226DD21AC(v18, v19, v20, v21, v22, v23, v24, v25);
  }
LABEL_6:
  if (!a4 && (BOOL v26 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)))
  {
    sub_226DD21AC(v26, v27, v28, v29, v30, v31, v32, v33);
    uint64_t v34 = (void *)*a5;
    uint64_t v35 = (void *)a5[1];
    if ((void *)*a5 == v35) {
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v34 = (void *)*a5;
    uint64_t v35 = (void *)a5[1];
    if ((void *)*a5 == v35) {
      goto LABEL_17;
    }
  }
  uint64_t v36 = &_os_log_internal;
  do
  {
    if (!*v34 && os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_226DD2168(&v40, v41);
    }
    ++v34;
  }
  while (v34 != v35);
LABEL_17:
  std::mutex::lock((std::mutex *)(a1 + 216));
  int32x4_t v37 = *(uint64_t **)(a1 + 16);
  if (v37)
  {
    if (sub_226DC80E8(*(void *)a1, *v37, a2, a3, a4, a5, 1u)) {
      uint64_t v38 = 0;
    }
    else {
      uint64_t v38 = 14;
    }
  }
  else
  {
    uint64_t v38 = 2;
  }
  std::mutex::unlock((std::mutex *)(a1 + 216));
  kdebug_trace();
  return v38;
}

void sub_226DB96CC(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_226DB96E8(uint64_t a1, void *a2, int a3)
{
  kdebug_trace();
  kdebug_trace();
  unsigned int uint64 = xpc_dictionary_get_uint64(a2, "ClientId");
  unint64_t v7 = *(void *)(a1 + 48);
  if (!v7) {
    goto LABEL_21;
  }
  uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
  v8.i16[0] = vaddlv_u8(v8);
  if (v8.u32[0] > 1uLL)
  {
    unint64_t v9 = uint64;
    if (v7 <= uint64) {
      unint64_t v9 = uint64 % v7;
    }
  }
  else
  {
    unint64_t v9 = (v7 - 1) & uint64;
  }
  BOOL v10 = *(uint64_t ***)(*(void *)(a1 + 40) + 8 * v9);
  if (v10)
  {
    uint64_t v11 = *v10;
    if (*v10)
    {
      if (v8.u32[0] < 2uLL)
      {
        unint64_t v12 = v7 - 1;
        while (1)
        {
          uint64_t v14 = v11[1];
          if (v14 == uint64)
          {
            if (*((_DWORD *)v11 + 4) == uint64) {
              goto LABEL_22;
            }
          }
          else if ((v14 & v12) != v9)
          {
            goto LABEL_21;
          }
          uint64_t v11 = (uint64_t *)*v11;
          if (!v11) {
            goto LABEL_22;
          }
        }
      }
      do
      {
        unint64_t v13 = v11[1];
        if (v13 == uint64)
        {
          if (*((_DWORD *)v11 + 4) == uint64) {
            break;
          }
        }
        else
        {
          if (v13 >= v7) {
            v13 %= v7;
          }
          if (v13 != v9) {
            goto LABEL_21;
          }
        }
        uint64_t v11 = (uint64_t *)*v11;
      }
      while (v11);
    }
  }
  else
  {
LABEL_21:
    uint64_t v11 = 0;
  }
LABEL_22:
  int v15 = *((unsigned __int8 *)v11 + 32);
  uint64_t v16 = xpc_dictionary_get_uint64(a2, "IOBufListSize");
  unint64_t v17 = v16;
  if (a3)
  {
    if (v16)
    {
      BOOL v18 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v18) {
        sub_226DD21E8(v18, v19, v20, v21, v22, v23, v24, v25);
      }
      return 10;
    }
LABEL_48:
    __p[0] = 0;
    __p[1] = 0;
    int64_t v45 = 0;
    if (*((unsigned char *)v11 + 33) && *((unsigned char *)v11 + 32))
    {
      sub_226DBC6F8(__p, ((v11[11] - v11[10]) >> 3) + 2);
      *(void *)__p[0] = v11[8];
      *((void *)__p[0] + 1) = v11[9];
      uint64_t v35 = 2;
      uint64_t v36 = (uint64_t *)v11[10];
      int32x4_t v37 = (uint64_t *)v11[11];
      if (v36 == v37) {
        goto LABEL_58;
      }
    }
    else
    {
      uint64_t v38 = v11[11] - v11[10];
      if (v38) {
        sub_226DBC6F8(__p, v38 >> 3);
      }
      uint64_t v35 = 0;
      uint64_t v36 = (uint64_t *)v11[10];
      int32x4_t v37 = (uint64_t *)v11[11];
      if (v36 == v37)
      {
LABEL_58:
        if (*((unsigned char *)v11 + 33) && !*((unsigned char *)v11 + 144))
        {
          uint64_t v26 = 12;
          int v41 = __p[0];
          if (!__p[0]) {
            return v26;
          }
        }
        else
        {
          kdebug_trace();
          uint64_t v26 = sub_226DB952C(a1, v11[5], v11[6], v11[7], (unint64_t *)__p);
          kdebug_trace();
          int v41 = __p[0];
          if (!__p[0]) {
            return v26;
          }
        }
        __p[1] = v41;
        operator delete(v41);
        return v26;
      }
    }
    uint64_t v39 = 8 * v35;
    do
    {
      uint64_t v40 = *v36++;
      *(void *)((char *)__p[0] + v39) = v40;
      v39 += 8;
    }
    while (v36 != v37);
    goto LABEL_58;
  }
  sub_226DB8934(v16, (uint64_t)(v11 + 3), v15 == 0);
  if (!v17)
  {
    if (!v15) {
      return 10;
    }
LABEL_30:
    if (sub_226DB8CFC(a2, (CVPixelBufferRef *)v11 + 6, "ActionBuf")
      && sub_226DB8CFC(a2, (CVPixelBufferRef *)v11 + 5, "OperationBuf")
      && sub_226DB8CFC(a2, (CVPixelBufferRef *)v11 + 7, "StatsBuf"))
    {
      uint64_t v27 = v11[10];
      unint64_t v28 = (v11[11] - v27) >> 3;
      if (v17 <= v28)
      {
        if (v17 < v28) {
          v11[11] = v27 + 8 * v17;
        }
        if (!v17) {
          goto LABEL_48;
        }
      }
      else
      {
        sub_226DBC6F8((void **)v11 + 10, v17 - v28);
      }
      uint64_t v29 = 0;
      unint64_t v30 = 0;
      while (1)
      {
        std::to_string(&v43, v30);
        uint64_t v31 = std::string::insert(&v43, 0, "IOBufList");
        long long v32 = *(_OWORD *)&v31->__r_.__value_.__l.__data_;
        int64_t v45 = v31->__r_.__value_.__r.__words[2];
        *(_OWORD *)__p = v32;
        v31->__r_.__value_.__l.__size_ = 0;
        v31->__r_.__value_.__r.__words[2] = 0;
        v31->__r_.__value_.__r.__words[0] = 0;
        if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v43.__r_.__value_.__l.__data_);
        }
        if (v45 >= 0) {
          uint64_t v33 = (char *)__p;
        }
        else {
          uint64_t v33 = (char *)__p[0];
        }
        BOOL v34 = sub_226DB8CFC(a2, (CVPixelBufferRef *)(v11[10] + v29), v33);
        if (SHIBYTE(v45) < 0) {
          operator delete(__p[0]);
        }
        if (!v34) {
          break;
        }
        ++v30;
        v29 += 8;
        if (v17 == v30) {
          goto LABEL_48;
        }
      }
    }
    return 11;
  }
  if (v17 <= 0xA) {
    goto LABEL_30;
  }
  return 10;
}

void sub_226DB9B04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_226DB9B58(uint64_t a1)
{
  uint64_t v2 = (std::mutex *)(a1 + 216);
  std::mutex::lock((std::mutex *)(a1 + 216));
  BOOL v3 = *(const void ***)(a1 + 16);
  if (v3)
  {
    *(void *)(a1 + 16) = 0;
    sub_226DC7B9C(*v3);
    MEMORY[0x22A669B00](v3, 0x20C4093837F09);
  }
  if (!*(void *)a1
    || (uint64_t v4 = *(std::__shared_weak_count **)(a1 + 8), *(void *)a1 = 0, *(void *)(a1 + 8) = 0, !v4)
    || atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    uint64_t v5 = *(void **)(a1 + 24);
    if (!v5) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
  std::__shared_weak_count::__release_weak(v4);
  uint64_t v5 = *(void **)(a1 + 24);
  if (v5)
  {
LABEL_7:
    os_release(v5);
    *(void *)(a1 + 24) = 0;
  }
LABEL_8:

  std::mutex::unlock(v2);
}

void sub_226DB9C3C(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_226DB9C54(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  unsigned int uint64 = xpc_dictionary_get_uint64(xdict, "ClientId");
  unint64_t v5 = *(void *)(a1 + 48);
  if (!v5) {
    goto LABEL_21;
  }
  uint8x8_t v6 = (uint8x8_t)vcnt_s8((int8x8_t)v5);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    unint64_t v7 = uint64;
    if (v5 <= uint64) {
      unint64_t v7 = uint64 % v5;
    }
  }
  else
  {
    unint64_t v7 = (v5 - 1) & uint64;
  }
  uint8x8_t v8 = *(uint64_t ***)(*(void *)(a1 + 40) + 8 * v7);
  if (v8)
  {
    unint64_t v9 = *v8;
    if (*v8)
    {
      if (v6.u32[0] < 2uLL)
      {
        unint64_t v10 = v5 - 1;
        while (1)
        {
          uint64_t v12 = v9[1];
          if (v12 == uint64)
          {
            if (*((_DWORD *)v9 + 4) == uint64) {
              goto LABEL_22;
            }
          }
          else if ((v12 & v10) != v7)
          {
            goto LABEL_21;
          }
          unint64_t v9 = (uint64_t *)*v9;
          if (!v9) {
            goto LABEL_22;
          }
        }
      }
      do
      {
        unint64_t v11 = v9[1];
        if (v11 == uint64)
        {
          if (*((_DWORD *)v9 + 4) == uint64) {
            break;
          }
        }
        else
        {
          if (v11 >= v5) {
            v11 %= v5;
          }
          if (v11 != v7) {
            goto LABEL_21;
          }
        }
        unint64_t v9 = (uint64_t *)*v9;
      }
      while (v9);
    }
  }
  else
  {
LABEL_21:
    unint64_t v9 = 0;
  }
LABEL_22:
  string = (std::string *)xpc_dictionary_get_string(xdict, "BinaryPath");
  if (!string) {
    return 15;
  }
  *((unsigned char *)v9 + 33) = 1;
  memset(&v47, 0, sizeof(v47));
  uint64_t v14 = (std::string *)((char *)string - 1);
  do
  {
    int v15 = v14->__r_.__value_.__s.__data_[1];
    uint64_t v14 = (std::string *)((char *)v14 + 1);
  }
  while (v15);
  sub_226DBC8AC(&v47.__pn_, string, v14);
  if (!std::__fs::filesystem::path::__root_directory(&v47).__size_)
  {
    uint64_t v16 = 16;
    BOOL v17 = 1;
    if (SHIBYTE(v47.__pn_.__r_.__value_.__r.__words[2]) < 0) {
      goto LABEL_37;
    }
    goto LABEL_33;
  }
  __ec.__val_ = 0;
  __ec.__cat_ = std::system_category();
  std::__fs::filesystem::__canonical(&v45, &v47, &__ec);
  if (__ec.__val_)
  {
    if (__ec.__val_ == 2) {
      uint64_t v16 = 17;
    }
    else {
      uint64_t v16 = 18;
    }
    BOOL v17 = 1;
    goto LABEL_31;
  }
  if (SHIBYTE(v45.__pn_.__r_.__value_.__r.__words[2]) < 0) {
    sub_226DBC2E4(&__str, v45.__pn_.__r_.__value_.__l.__data_, v45.__pn_.__r_.__value_.__l.__size_);
  }
  else {
    std::string __str = v45.__pn_;
  }
  if (*(unsigned char *)(a1 + 408))
  {
    uint64_t v24 = operator new(0x28uLL);
    uint64_t v25 = v24;
    v24[16] = 115;
    uint64_t v26 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
    BOOL v27 = (__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0;
    std::string::size_type size = __str.__r_.__value_.__l.__size_;
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_str = &__str;
    }
    else {
      p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
    }
    qmemcpy(v24, "/System/Library/PrivateFramework", 32);
    if (v27) {
      uint64_t v26 = size;
    }
    if (v26 >= 33)
    {
      unint64_t v30 = (std::string *)((char *)p_str + v26);
      uint64_t v31 = p_str;
      do
      {
        long long v32 = (std::string *)memchr(v31, 47, v26 - 32);
        if (!v32) {
          break;
        }
        if (v32->__r_.__value_.__r.__words[0] == *v25
          && v32->__r_.__value_.__l.__size_ == v25[1]
          && v32->__r_.__value_.__r.__words[2] == v25[2]
          && v32[1].__r_.__value_.__r.__words[0] == v25[3]
          && v32[1].__r_.__value_.__s.__data_[8] == (unint64_t)*((unsigned __int8 *)v25 + 32))
        {
          if (v32 != v30 && v32 == p_str)
          {
            operator delete(v25);
            goto LABEL_90;
          }
          break;
        }
        uint64_t v31 = (std::string *)((char *)&v32->__r_.__value_.__l.__data_ + 1);
        uint64_t v26 = (char *)v30 - (char *)v31;
      }
      while ((char *)v30 - (char *)v31 >= 33);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_226DD2224();
    }
    operator delete(v25);
    uint64_t v16 = 19;
    BOOL v17 = 1;
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
      goto LABEL_113;
    }
    goto LABEL_31;
  }
LABEL_90:
  std::string::operator=((std::string *)(v9 + 13), &__str);
  sub_226DC16A8((uint64_t)&v42);
  if (*((unsigned __int8 *)v9 + 144) == v43)
  {
    if (!*((unsigned char *)v9 + 144)) {
      goto LABEL_109;
    }
    long long v37 = v42;
    long long v42 = 0uLL;
    uint64_t v38 = (std::__shared_weak_count *)v9[17];
    *((_OWORD *)v9 + 8) = v37;
    if (v38 && !atomic_fetch_add(&v38->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
      std::__shared_weak_count::__release_weak(v38);
    }
  }
  else if (*((unsigned char *)v9 + 144))
  {
    uint64_t v39 = (std::__shared_weak_count *)v9[17];
    if (v39 && !atomic_fetch_add(&v39->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
      std::__shared_weak_count::__release_weak(v39);
    }
    *((unsigned char *)v9 + 144) = 0;
  }
  else
  {
    *((_OWORD *)v9 + 8) = v42;
    long long v42 = 0uLL;
    *((unsigned char *)v9 + 144) = 1;
  }
  if (v43)
  {
    uint64_t v40 = (std::__shared_weak_count *)*((void *)&v42 + 1);
    if (*((void *)&v42 + 1))
    {
      if (!atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v42 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
        std::__shared_weak_count::__release_weak(v40);
      }
    }
  }
LABEL_109:
  BOOL v17 = *((unsigned char *)v9 + 144) == 0;
  if (*((unsigned char *)v9 + 144)) {
    uint64_t v16 = 19;
  }
  else {
    uint64_t v16 = 17;
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
LABEL_113:
  }
    operator delete(__str.__r_.__value_.__l.__data_);
LABEL_31:
  if (SHIBYTE(v45.__pn_.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v45.__pn_.__r_.__value_.__l.__data_);
    if (SHIBYTE(v47.__pn_.__r_.__value_.__r.__words[2]) < 0) {
      goto LABEL_37;
    }
LABEL_33:
    if (v17) {
      return v16;
    }
    goto LABEL_38;
  }
  if ((SHIBYTE(v47.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
    goto LABEL_33;
  }
LABEL_37:
  operator delete(v47.__pn_.__r_.__value_.__l.__data_);
  if (v17) {
    return v16;
  }
LABEL_38:
  if (!*((unsigned char *)v9 + 144)) {
    sub_226DBC3B0();
  }
  size_t v18 = sub_226DC29C8((uint64_t)(v9 + 16));
  uint64_t v20 = (CVPixelBufferRef *)(v9 + 8);
  uint64_t v19 = (__CVBuffer *)v9[8];
  if (v19 && v18 <= CVPixelBufferGetDataSize(v19)) {
    goto LABEL_84;
  }
  uint64_t v21 = sub_226DB8A48(v18, 0x400uLL);
  uint64_t v22 = v21;
  if (!v21) {
    return 20;
  }
  v47.__pn_.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_26DAEF670;
  v47.__pn_.__r_.__value_.__l.__size_ = MEMORY[0x263EFF3B0];
  v47.__pn_.__r_.__value_.__r.__words[2] = (std::string::size_type)v21;
  v48 = &v47;
  if (*v20)
  {
    CVPixelBufferUnlockBaseAddress(*v20, 0);
    CVPixelBufferRelease(*v20);
    *uint64_t v20 = 0;
  }
  CVReturn v23 = CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x263EFFB08], v22, 0, (CVPixelBufferRef *)v9 + 8);
  if (v23)
  {
    *uint64_t v20 = 0;
    uint64_t v16 = 21;
  }
  else
  {
    CVPixelBufferLockBaseAddress(*v20, 0);
  }
  if (!v48) {
    sub_226DBC3FC();
  }
  (*(void (**)(std::__fs::filesystem::path *))(v48->__pn_.__r_.__value_.__r.__words[0] + 48))(v48);
  if (v48 == &v47)
  {
    (*(void (**)(std::__fs::filesystem::path *))(v47.__pn_.__r_.__value_.__r.__words[0] + 32))(&v47);
    if (v23) {
      return v16;
    }
    goto LABEL_84;
  }
  if (v48) {
    (*(void (**)(std::__fs::filesystem::path *))(v48->__pn_.__r_.__value_.__r.__words[0] + 40))(v48);
  }
  if (!v23)
  {
LABEL_84:
    if (v9[9]) {
      operator new();
    }
    return 22;
  }
  return v16;
}

void sub_226DBA384(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a25 < 0)
  {
    operator delete(__p);
    if ((*(char *)(v25 - 65) & 0x80000000) == 0) {
      goto LABEL_6;
    }
  }
  else if ((*(char *)(v25 - 65) & 0x80000000) == 0)
  {
LABEL_6:
    _Unwind_Resume(exception_object);
  }
  operator delete(*(void **)(v25 - 88));
  _Unwind_Resume(exception_object);
}

void *sub_226DBA46C(void *a1)
{
  uint64_t v2 = a1[3];
  if (!v2) {
    sub_226DBC3FC();
  }
  (*(void (**)(uint64_t))(*(void *)v2 + 48))(v2);
  BOOL v3 = (void *)a1[3];
  if (v3 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
    return a1;
  }
  else
  {
    if (v3) {
      (*(void (**)(void *))(*v3 + 40))(v3);
    }
    return a1;
  }
}

uint64_t sub_226DBA534(uint64_t a1, xpc_object_t xdict, void *a3)
{
  unsigned int uint64 = xpc_dictionary_get_uint64(xdict, "ClientId");
  unint64_t v7 = *(void *)(a1 + 48);
  if (!v7) {
    goto LABEL_21;
  }
  uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
  v8.i16[0] = vaddlv_u8(v8);
  if (v8.u32[0] > 1uLL)
  {
    unint64_t v9 = uint64;
    if (v7 <= uint64) {
      unint64_t v9 = uint64 % v7;
    }
  }
  else
  {
    unint64_t v9 = (v7 - 1) & uint64;
  }
  unint64_t v10 = *(uint64_t ***)(*(void *)(a1 + 40) + 8 * v9);
  if (v10)
  {
    unint64_t v11 = *v10;
    if (*v10)
    {
      if (v8.u32[0] < 2uLL)
      {
        unint64_t v12 = v7 - 1;
        while (1)
        {
          uint64_t v14 = v11[1];
          if (v14 == uint64)
          {
            if (*((_DWORD *)v11 + 4) == uint64) {
              goto LABEL_22;
            }
          }
          else if ((v14 & v12) != v9)
          {
            goto LABEL_21;
          }
          unint64_t v11 = (uint64_t *)*v11;
          if (!v11) {
            goto LABEL_22;
          }
        }
      }
      do
      {
        unint64_t v13 = v11[1];
        if (v13 == uint64)
        {
          if (*((_DWORD *)v11 + 4) == uint64) {
            break;
          }
        }
        else
        {
          if (v13 >= v7) {
            v13 %= v7;
          }
          if (v13 != v9) {
            goto LABEL_21;
          }
        }
        unint64_t v11 = (uint64_t *)*v11;
      }
      while (v11);
    }
  }
  else
  {
LABEL_21:
    unint64_t v11 = 0;
  }
LABEL_22:
  string = xpc_dictionary_get_string(xdict, "SymbolString");
  if (!string || !*((unsigned char *)v11 + 144)) {
    return 25;
  }
  uint64_t v16 = string;
  BOOL v17 = v11 + 16;
  size_t v18 = strlen(string);
  uint64_t v19 = sub_226DC2BD4(v11 + 16, (uint64_t)v16, v18);
  if (!*((unsigned char *)v11 + 144)) {
    sub_226DBC3B0();
  }
  if (v20) {
    unsigned int v21 = 0;
  }
  else {
    unsigned int v21 = 23;
  }
  if (v20) {
    uint64_t v22 = v19;
  }
  else {
    uint64_t v22 = 0;
  }
  size_t v23 = strlen(v16);
  uint64_t v24 = sub_226DC2AB0(v17, (uint64_t)v16, v23);
  if (v25) {
    uint64_t v26 = v24;
  }
  else {
    uint64_t v26 = 0;
  }
  if (v25) {
    uint64_t v27 = v21;
  }
  else {
    uint64_t v27 = 24;
  }
  xpc_dictionary_set_uint64(a3, "SymbolAddr", v22);
  xpc_dictionary_set_uint64(a3, "SymbolSize", v26);
  return v27;
}

uint64_t sub_226DBA714(uint64_t a1)
{
  if (*(void *)(a1 + 16)) {
    return 0;
  }
  if (*(unsigned char *)(a1 + 88))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "VisionHWAServer: ISP is unrecoverable, try to restore device and session", buf, 2u);
    }
    uint64_t result = sub_226DB90B8(a1);
    if (result) {
      *(unsigned char *)(a1 + 88) = 0;
    }
  }
  else if (atomic_load((unsigned int *)(a1 + 200)))
  {
    return sub_226DB90B8(a1);
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "VisionHWAServer: App is not foregrounded", v4, 2u);
    }
    return 6;
  }
  return result;
}

void sub_226DBA834(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v32 = a2;
  xpc_connection_get_audit_token();
  int v30 = v31;
  uint8x8_t v6 = (void *)(a1 + 160);
  unint64_t v7 = *(void *)(a1 + 168);
  if (!v7) {
    goto LABEL_21;
  }
  uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
  v8.i16[0] = vaddlv_u8(v8);
  if (v8.u32[0] > 1uLL)
  {
    unint64_t v9 = v31;
    if (v7 <= v31) {
      unint64_t v9 = v31 % v7;
    }
  }
  else
  {
    unint64_t v9 = (v7 - 1) & v31;
  }
  unint64_t v10 = *(uint64_t ***)(*v6 + 8 * v9);
  if (!v10 || (unint64_t v11 = *v10) == 0)
  {
LABEL_21:
    if (a3)
    {
      BOOL v15 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v15) {
        sub_226DD2294(v15, v16, v17, v18, v19, v20, v21, v22);
      }
    }
    else
    {
      size_t v23 = operator new(8uLL);
      *size_t v23 = a2;
      uint64_t v24 = v23 + 1;
      uint64_t v33 = &v30;
      char v25 = sub_226DBCC28((uint64_t)v6, &v30, (uint64_t)&unk_226DD3E89, &v33);
      uint64_t v26 = (void *)v25[3];
      if (v26)
      {
        v25[4] = v26;
        operator delete(v26);
        uint64_t v25[3] = 0;
        v25[4] = 0;
        v25[5] = 0;
      }
      uint64_t v25[3] = v23;
      v25[4] = v24;
      v25[5] = v24;
    }
    return;
  }
  if (v8.u32[0] < 2uLL)
  {
    unint64_t v12 = v7 - 1;
    while (1)
    {
      uint64_t v14 = v11[1];
      if (v14 == v31)
      {
        if (*((_DWORD *)v11 + 4) == v31) {
          goto LABEL_27;
        }
      }
      else if ((v14 & v12) != v9)
      {
        goto LABEL_21;
      }
      unint64_t v11 = (uint64_t *)*v11;
      if (!v11) {
        goto LABEL_21;
      }
    }
  }
  while (1)
  {
    unint64_t v13 = v11[1];
    if (v13 == v31) {
      break;
    }
    if (v13 >= v7) {
      v13 %= v7;
    }
    if (v13 != v9) {
      goto LABEL_21;
    }
LABEL_11:
    unint64_t v11 = (uint64_t *)*v11;
    if (!v11) {
      goto LABEL_21;
    }
  }
  if (*((_DWORD *)v11 + 4) != v31) {
    goto LABEL_11;
  }
LABEL_27:
  unint64_t v28 = (char *)v11[3];
  uint64_t v27 = (char *)v11[4];
  if (v28 != v27)
  {
    while (*(void *)v28 != a2)
    {
      v28 += 8;
      if (v28 == v27)
      {
        unint64_t v28 = (char *)v11[4];
        break;
      }
    }
  }
  if (v28 == v27)
  {
    if ((a3 & 1) == 0) {
      sub_226DBAA9C((unint64_t *)v11 + 3, v28, (char *)&v32);
    }
  }
  else if (a3)
  {
    int64_t v29 = v27 - (v28 + 8);
    if (v27 != v28 + 8) {
      memmove(v28, v28 + 8, v27 - (v28 + 8));
    }
    v11[4] = (uint64_t)&v28[v29];
  }
}

void sub_226DBAA88(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

char *sub_226DBAA9C(unint64_t *a1, void *a2, char *a3)
{
  BOOL v3 = a3;
  unint64_t v6 = *a1;
  unint64_t v5 = a1[1];
  uint64_t v7 = (uint64_t)a2 - *a1;
  uint64_t v8 = v7 >> 3;
  unint64_t v9 = (char *)(*a1 + (v7 & 0xFFFFFFFFFFFFFFF8));
  unint64_t v10 = a1[2];
  if (v5 < v10)
  {
    if (v9 == (char *)v5)
    {
      *(void *)unint64_t v9 = *(void *)a3;
      a1[1] = (unint64_t)(v9 + 8);
      return v9;
    }
    int64_t v11 = v5 - (void)(v9 + 8);
    uint64_t v12 = v11 >> 3;
    unint64_t v13 = (uint64_t *)(v5 - 8);
    if (v5 < 8)
    {
      uint64_t v19 = (void *)a1[1];
    }
    else
    {
      unint64_t v14 = (v7 & 0xFFFFFFFFFFFFFFF8) + v11;
      BOOL v15 = (char *)(v14 + v6);
      unint64_t v16 = v14 + v6 + 8;
      if (v5 > v16) {
        unint64_t v16 = a1[1];
      }
      unint64_t v17 = v16 + ~v6 - v14;
      if (v17 < 0x58)
      {
        uint64_t v19 = (void *)a1[1];
      }
      else
      {
        unint64_t v18 = v5 - (void)v15;
        uint64_t v19 = (void *)a1[1];
        if (v18 >= 0x20)
        {
          uint64_t v20 = (v17 >> 3) + 1;
          uint64_t v21 = 8 * (v20 & 0x3FFFFFFFFFFFFFFCLL);
          unint64_t v13 = (uint64_t *)((char *)v13 + v21);
          uint64_t v19 = (void *)(v5 + v21);
          uint64_t v22 = (_OWORD *)(v5 + 16);
          size_t v23 = (long long *)(8 * v12 + 8 * v8 + v6 + 16);
          uint64_t v24 = v20 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            long long v25 = *v23;
            *(v22 - 1) = *(v23 - 1);
            *uint64_t v22 = v25;
            v22 += 2;
            v23 += 2;
            v24 -= 4;
          }
          while (v24);
          if (v20 == (v20 & 0x3FFFFFFFFFFFFFFCLL)) {
            goto LABEL_50;
          }
        }
      }
      do
      {
        uint64_t v56 = *v13++;
        *v19++ = v56;
      }
      while ((unint64_t)v13 < v5);
    }
LABEL_50:
    a1[1] = (unint64_t)v19;
    if ((char *)v5 != v9 + 8) {
      memmove((void *)(v5 - 8 * v12), v9, v11);
    }
    if (v9 <= v3) {
      v3 += 8 * (a1[1] > (unint64_t)v3);
    }
    *(void *)unint64_t v9 = *(void *)v3;
    return v9;
  }
  unint64_t v26 = ((uint64_t)(v5 - v6) >> 3) + 1;
  if (v26 >> 61) {
    sub_226DB87BC();
  }
  uint64_t v28 = v10 - v6;
  if (v28 >> 2 > v26) {
    unint64_t v26 = v28 >> 2;
  }
  if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v29 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v29 = v26;
  }
  if (v29)
  {
    if (v29 >> 61) {
      sub_226DB8864();
    }
    int v30 = (char *)operator new(8 * v29);
    int v31 = &v30[8 * v8];
    uint64_t v32 = &v30[8 * v29];
    if (v8 != v29) {
      goto LABEL_28;
    }
  }
  else
  {
    int v30 = 0;
    int v31 = (char *)(8 * v8);
    uint64_t v32 = 0;
    if (v8) {
      goto LABEL_28;
    }
  }
  if (v7 < 1)
  {
    if ((void *)v6 == a2) {
      unint64_t v53 = 1;
    }
    else {
      unint64_t v53 = v7 >> 2;
    }
    if (v53 >> 61) {
      sub_226DB8864();
    }
    v54 = (char *)operator new(8 * v53);
    int v31 = &v54[8 * (v53 >> 2)];
    uint64_t v32 = &v54[8 * v53];
    if (v30)
    {
      v55 = &v54[8 * v53];
      operator delete(v30);
      uint64_t v32 = v55;
      BOOL v34 = (char *)*a1;
      *(void *)int v31 = *(void *)v3;
      uint64_t v35 = v31 + 8;
      uint64_t v36 = v31;
      if (v34 != v9) {
        goto LABEL_29;
      }
      goto LABEL_35;
    }
  }
  else
  {
    unint64_t v33 = v8 + 2;
    if (v8 >= -1) {
      unint64_t v33 = v8 + 1;
    }
    v31 -= 8 * (v33 >> 1);
  }
LABEL_28:
  BOOL v34 = (char *)v6;
  *(void *)int v31 = *(void *)v3;
  uint64_t v35 = v31 + 8;
  uint64_t v36 = v31;
  if ((char *)v6 != v9)
  {
LABEL_29:
    long long v37 = (char *)((v7 & 0xFFFFFFFFFFFFFFF8) + v6);
    unint64_t v38 = v37 - v34 - 8;
    uint64_t v39 = v9;
    uint64_t v36 = v31;
    if (v38 < 0x58) {
      goto LABEL_61;
    }
    uint64_t v39 = v9;
    uint64_t v36 = v31;
    if ((unint64_t)(v37 - v31) < 0x20) {
      goto LABEL_61;
    }
    uint64_t v40 = (v38 >> 3) + 1;
    uint64_t v41 = 8 * (v40 & 0x3FFFFFFFFFFFFFFCLL);
    uint64_t v39 = &v9[-v41];
    uint64_t v36 = &v31[-v41];
    long long v42 = v31 - 16;
    unsigned __int8 v43 = (long long *)(v6 + 8 * v8 - 16);
    uint64_t v44 = v40 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v45 = *v43;
      *((_OWORD *)v42 - 1) = *(v43 - 1);
      *(_OWORD *)long long v42 = v45;
      v42 -= 32;
      v43 -= 2;
      v44 -= 4;
    }
    while (v44);
    if (v40 != (v40 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_61:
      do
      {
        uint64_t v46 = *((void *)v39 - 1);
        v39 -= 8;
        *((void *)v36 - 1) = v46;
        v36 -= 8;
      }
      while (v39 != v34);
    }
  }
LABEL_35:
  std::__fs::filesystem::path v47 = (char *)a1[1];
  int64_t v48 = v47 - v9;
  if (v47 != v9)
  {
    uint64_t v49 = v9;
    size_t v50 = v47 - v9;
    v51 = v32;
    memmove(v35, v49, v50);
    uint64_t v32 = v51;
  }
  v52 = (void *)*a1;
  *a1 = (unint64_t)v36;
  a1[1] = (unint64_t)&v35[v48];
  a1[2] = (unint64_t)v32;
  if (v52) {
    operator delete(v52);
  }
  return v31;
}

void sub_226DBAE0C(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_226DBAE24(uint64_t a1, xpc_object_t xdict)
{
  uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "Command");
  xpc_object_t reply = xpc_dictionary_create_reply(xdict);
  remote_connection = xpc_dictionary_get_remote_connection(xdict);
  if ((uint64 & 0xFFFFFFFFFFFFFFFBLL) == 0x7D0)
  {
    unsigned int v7 = 0;
LABEL_3:
    if (uint64 != 2002 && uint64 <= 0x7D6)
    {
      unsigned int v8 = sub_226DBA714(a1);
      if (v8) {
        goto LABEL_83;
      }
    }
    switch(uint64)
    {
      case 0x7D0uLL:
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "VisionHWAServer: Handle Create Request", buf, 2u);
        }
        ++*(_DWORD *)(a1 + 32);
        xpc_dictionary_set_uint64(reply, "ClientId", *(void *)(a1 + 80));
        *(_WORD *)&buf[8] = 0;
        char v72 = 0;
        uint64_t v73 = 0;
        long long v68 = 0u;
        long long v69 = 0u;
        memset(v70, 0, sizeof(v70));
        memset(__p, 0, 25);
        uint64_t v9 = *(void *)(a1 + 80);
        *(void *)(a1 + 80) = v9 + 1;
        unsigned int v66 = v9;
        *(void *)buf = remote_connection;
        v74 = &v66;
        unint64_t v10 = sub_226DBD160(a1 + 40, &v66, (uint64_t)&unk_226DD3E89, &v74);
        int64_t v11 = v70[0];
        long long v12 = v69;
        long long v13 = *(_OWORD *)buf;
        *(_OWORD *)(v10 + 40) = v68;
        *(_OWORD *)(v10 + 24) = v13;
        *(_OWORD *)(v10 + 56) = v12;
        *((void *)v10 + 9) = v11;
        BOOL v15 = v10 + 80;
        unint64_t v14 = (void *)*((void *)v10 + 10);
        if (v14)
        {
          *((void *)v10 + 11) = v14;
          operator delete(v14);
          *BOOL v15 = 0;
          *((void *)v10 + 11) = 0;
          *((void *)v10 + 12) = 0;
        }
        *BOOL v15 = 0;
        *((void *)v10 + 11) = 0;
        *((void *)v10 + 12) = 0;
        memset(&v70[1], 0, 24);
        unint64_t v16 = (void **)(v10 + 104);
        if (v10[127] < 0) {
          operator delete(*v16);
        }
        *((void *)v10 + 15) = *(void *)&__p[16];
        *(_OWORD *)unint64_t v16 = *(_OWORD *)__p;
        __p[23] = 0;
        __p[0] = 0;
        if (v10[144])
        {
          unint64_t v17 = (std::__shared_weak_count *)*((void *)v10 + 17);
          if (v17 && !atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
            std::__shared_weak_count::__release_weak(v17);
          }
          v10[144] = 0;
          uint64_t v18 = v73;
        }
        else
        {
          uint64_t v18 = 0;
        }
        uint64_t v73 = 0;
        uint64_t v47 = *((void *)v10 + 19);
        *((void *)v10 + 19) = v18;
        if (v47) {
          (*(void (**)(uint64_t))(*(void *)v47 + 72))(v47);
        }
        sub_226DBA834(a1, (uint64_t)remote_connection, 0);
        uint64_t v73 = 0;
        if (v72)
        {
          int64_t v48 = *(std::__shared_weak_count **)&__p[32];
          if (*(void *)&__p[32])
          {
            if (!atomic_fetch_add((atomic_ullong *volatile)(*(void *)&__p[32] + 8), 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
              std::__shared_weak_count::__release_weak(v48);
            }
          }
        }
        if ((__p[23] & 0x80000000) != 0) {
          operator delete(*(void **)__p);
        }
        if (v70[1]) {
          operator delete(v70[1]);
        }
        goto LABEL_123;
      case 0x7D1uLL:
        unsigned int v8 = sub_226DB96E8(a1, xdict, 0);
        kdebug_trace();
        goto LABEL_82;
      case 0x7D2uLL:
        BOOL v28 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
        if (v28)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "VisionHWAServer: Handle Release CMD", buf, 2u);
        }
        unint64_t v29 = *(void *)(a1 + 48);
        if (!v29) {
          goto LABEL_119;
        }
        uint8x8_t v30 = (uint8x8_t)vcnt_s8((int8x8_t)v29);
        v30.i16[0] = vaddlv_u8(v30);
        if (v30.u32[0] > 1uLL)
        {
          unint64_t v31 = v7;
          if (v29 <= v7) {
            unint64_t v31 = v7 % v29;
          }
        }
        else
        {
          unint64_t v31 = (v29 - 1) & v7;
        }
        uint64_t v49 = *(uint64_t ***)(*(void *)(a1 + 40) + 8 * v31);
        if (!v49) {
          goto LABEL_119;
        }
        size_t v50 = *v49;
        if (!v50) {
          goto LABEL_119;
        }
        if (v30.u32[0] < 2uLL)
        {
          unint64_t v51 = v29 - 1;
          while (1)
          {
            uint64_t v53 = v50[1];
            if (v53 == v7)
            {
              if (*((_DWORD *)v50 + 4) == v7) {
                goto LABEL_118;
              }
            }
            else if ((v53 & v51) != v31)
            {
              goto LABEL_119;
            }
            size_t v50 = (uint64_t *)*v50;
            if (!v50) {
              goto LABEL_119;
            }
          }
        }
        while (2)
        {
          unint64_t v52 = v50[1];
          if (v52 == v7)
          {
            if (*((_DWORD *)v50 + 4) == v7)
            {
LABEL_118:
              sub_226DB8934(v28, (uint64_t)(v50 + 3), 1);
              goto LABEL_119;
            }
          }
          else
          {
            if (v52 >= v29) {
              v52 %= v29;
            }
            if (v52 != v31)
            {
LABEL_119:
              *(_DWORD *)buf = v7;
              sub_226DBD5C0((void *)(a1 + 40), (unsigned int *)buf);
              sub_226DBA834(a1, (uint64_t)remote_connection, 1);
              int v54 = *(_DWORD *)(a1 + 32);
              if (v54)
              {
                unsigned int v8 = 0;
                *(_DWORD *)(a1 + 32) = v54 - 1;
              }
              else
              {
                BOOL v55 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
                if (v55) {
                  sub_226DD2350(v55, v56, v57, v58, v59, v60, v61, v62);
                }
LABEL_123:
                unsigned int v8 = 0;
              }
LABEL_124:
              BOOL v45 = 1;
              goto LABEL_85;
            }
          }
          size_t v50 = (uint64_t *)*v50;
          if (!v50) {
            goto LABEL_119;
          }
          continue;
        }
      case 0x7D3uLL:
        unsigned int v8 = sub_226DB96E8(a1, xdict, 1);
        kdebug_trace();
        goto LABEL_82;
      case 0x7D4uLL:
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "VisionHWAServer: Handle Create with Bufs CMD", buf, 2u);
        }
        xpc_dictionary_set_uint64(reply, "ClientId", *(void *)(a1 + 80));
        *(_WORD *)&buf[8] = 0;
        char v72 = 0;
        uint64_t v73 = 0;
        long long v68 = 0u;
        long long v69 = 0u;
        memset(v70, 0, sizeof(v70));
        memset(__p, 0, 25);
        uint64_t v32 = *(void *)(a1 + 80);
        *(void *)(a1 + 80) = v32 + 1;
        unsigned int v66 = v32;
        *(void *)buf = remote_connection;
        BOOL v33 = sub_226DB8CFC(xdict, (CVPixelBufferRef *)&v68 + 1, "ActionBuf");
        if (v33
          && (BOOL v33 = sub_226DB8CFC(xdict, (CVPixelBufferRef *)&v68, "OperationBuf"))
          && (BOOL v33 = sub_226DB8CFC(xdict, (CVPixelBufferRef *)&v69, "StatsBuf"))
          && (!xpc_dictionary_get_value(xdict, "DtcmMetaBuf")
           || (BOOL v33 = sub_226DB8CFC(xdict, (CVPixelBufferRef *)v70, "DtcmMetaBuf"))))
        {
          buf[8] = 1;
          v74 = &v66;
          BOOL v34 = sub_226DBD160(a1 + 40, &v66, (uint64_t)&unk_226DD3E89, &v74);
          uint64_t v35 = v70[0];
          long long v36 = v69;
          long long v37 = *(_OWORD *)buf;
          *(_OWORD *)(v34 + 40) = v68;
          *(_OWORD *)(v34 + 24) = v37;
          *(_OWORD *)(v34 + 56) = v36;
          *((void *)v34 + 9) = v35;
          unint64_t v38 = (void *)*((void *)v34 + 10);
          if (v38)
          {
            *((void *)v34 + 11) = v38;
            operator delete(v38);
            *((void *)v34 + 10) = 0;
            *((void *)v34 + 11) = 0;
            *((void *)v34 + 12) = 0;
          }
          *((_OWORD *)v34 + 5) = *(_OWORD *)&v70[1];
          *((void **)v34 + 12) = v70[3];
          memset(&v70[1], 0, 24);
          uint64_t v39 = (void **)(v34 + 104);
          if (v34[127] < 0) {
            operator delete(*v39);
          }
          *((void *)v34 + 15) = *(void *)&__p[16];
          *(_OWORD *)uint64_t v39 = *(_OWORD *)__p;
          __p[23] = 0;
          __p[0] = 0;
          if (v34[144] == v72)
          {
            if (v34[144])
            {
              long long v40 = *(_OWORD *)&__p[24];
              *(_OWORD *)&__p[24] = 0uLL;
              uint64_t v41 = (std::__shared_weak_count *)*((void *)v34 + 17);
              *((_OWORD *)v34 + 8) = v40;
              if (v41)
              {
                if (!atomic_fetch_add(&v41->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                {
                  ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
                  std::__shared_weak_count::__release_weak(v41);
                }
              }
            }
          }
          else if (v34[144])
          {
            v63 = (std::__shared_weak_count *)*((void *)v34 + 17);
            if (v63 && !atomic_fetch_add(&v63->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v63->__on_zero_shared)(v63);
              std::__shared_weak_count::__release_weak(v63);
            }
            v34[144] = 0;
          }
          else
          {
            *((_OWORD *)v34 + 8) = *(_OWORD *)&__p[24];
            *(_OWORD *)&__p[24] = 0uLL;
            v34[144] = 1;
          }
          uint64_t v64 = v73;
          uint64_t v73 = 0;
          uint64_t v65 = *((void *)v34 + 19);
          *((void *)v34 + 19) = v64;
          if (v65) {
            (*(void (**)(uint64_t))(*(void *)v65 + 72))(v65);
          }
          sub_226DBA834(a1, (uint64_t)remote_connection, 0);
          unsigned int v8 = 0;
          ++*(_DWORD *)(a1 + 32);
          uint64_t v43 = v73;
          uint64_t v73 = 0;
          if (!v43)
          {
LABEL_74:
            if (v72)
            {
              uint64_t v44 = *(std::__shared_weak_count **)&__p[32];
              if (*(void *)&__p[32])
              {
                if (!atomic_fetch_add((atomic_ullong *volatile)(*(void *)&__p[32] + 8), 0xFFFFFFFFFFFFFFFFLL))
                {
                  ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
                  std::__shared_weak_count::__release_weak(v44);
                }
              }
            }
            if ((__p[23] & 0x80000000) != 0) {
              operator delete(*(void **)__p);
            }
            if (v70[1])
            {
              v70[2] = v70[1];
              operator delete(v70[1]);
            }
LABEL_82:
            if (!v8) {
              goto LABEL_124;
            }
LABEL_83:
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              goto LABEL_39;
            }
            goto LABEL_84;
          }
        }
        else
        {
          sub_226DB8934(v33, (uint64_t)buf, 1);
          unsigned int v8 = 11;
          uint64_t v43 = v73;
          uint64_t v73 = 0;
          if (!v43) {
            goto LABEL_74;
          }
        }
        (*(void (**)(uint64_t))(*(void *)v43 + 72))(v43);
        goto LABEL_74;
      case 0x7D5uLL:
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "VisionHWAServer: Handle Load Program CMD", buf, 2u);
        }
        unsigned int v42 = sub_226DB9C54(a1, xdict);
        goto LABEL_71;
      case 0x7D6uLL:
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "VisionHWAServer: Handle Lookup Symbol CMD", buf, 2u);
        }
        unsigned int v42 = sub_226DBA534(a1, xdict, reply);
LABEL_71:
        unsigned int v8 = v42;
        goto LABEL_82;
      default:
        unsigned int v8 = 5;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_39;
        }
        goto LABEL_84;
    }
  }
  unsigned int v19 = xpc_dictionary_get_uint64(xdict, "ClientId");
  unint64_t v20 = *(void *)(a1 + 48);
  if (!v20) {
    goto LABEL_38;
  }
  unsigned int v7 = v19;
  uint8x8_t v21 = (uint8x8_t)vcnt_s8((int8x8_t)v20);
  v21.i16[0] = vaddlv_u8(v21);
  if (v21.u32[0] > 1uLL)
  {
    unint64_t v22 = v19;
    if (v20 <= v19) {
      unint64_t v22 = v19 % v20;
    }
  }
  else
  {
    unint64_t v22 = (v20 - 1) & v19;
  }
  size_t v23 = *(uint64_t ***)(*(void *)(a1 + 40) + 8 * v22);
  if (!v23 || (uint64_t v24 = *v23) == 0)
  {
LABEL_38:
    unsigned int v8 = 3;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    goto LABEL_84;
  }
  if (v21.u32[0] < 2uLL)
  {
    unint64_t v25 = v20 - 1;
    while (1)
    {
      uint64_t v27 = v24[1];
      if (v27 == v19)
      {
        if (*((_DWORD *)v24 + 4) == v19) {
          goto LABEL_86;
        }
      }
      else if ((v27 & v25) != v22)
      {
        goto LABEL_38;
      }
      uint64_t v24 = (uint64_t *)*v24;
      if (!v24) {
        goto LABEL_38;
      }
    }
  }
  while (1)
  {
    unint64_t v26 = v24[1];
    if (v26 == v19) {
      break;
    }
    if (v26 >= v20) {
      v26 %= v20;
    }
    if (v26 != v22) {
      goto LABEL_38;
    }
LABEL_28:
    uint64_t v24 = (uint64_t *)*v24;
    if (!v24) {
      goto LABEL_38;
    }
  }
  if (*((_DWORD *)v24 + 4) != v19) {
    goto LABEL_28;
  }
LABEL_86:
  if (remote_connection == (_xpc_connection_s *)v24[3]) {
    goto LABEL_3;
  }
  unsigned int v8 = 4;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
LABEL_39:
  }
    sub_226DD22D0(v8);
LABEL_84:
  BOOL v45 = 0;
LABEL_85:
  kdebug_trace();
  xpc_dictionary_set_BOOL(reply, "Status", v45);
  xpc_dictionary_set_uint64(reply, "Error", v8);
  xpc_connection_send_message(remote_connection, reply);
  xpc_release(reply);
  return v45;
}

void sub_226DBB964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_226DBB9AC((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_226DBB978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_226DBB9AC((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_226DBB9AC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 128);
  *(void *)(a1 + 128) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 72))(v2);
  }
  if (!*(unsigned char *)(a1 + 120)
    || (BOOL v3 = *(std::__shared_weak_count **)(a1 + 112)) == 0
    || atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    if ((*(char *)(a1 + 103) & 0x80000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
  std::__shared_weak_count::__release_weak(v3);
  if (*(char *)(a1 + 103) < 0) {
LABEL_7:
  }
    operator delete(*(void **)(a1 + 80));
LABEL_8:
  uint64_t v4 = *(void **)(a1 + 56);
  if (v4)
  {
    *(void *)(a1 + 64) = v4;
    operator delete(v4);
  }
  return a1;
}

void sub_226DBBA7C()
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  size_t v14 = 0;
  int v0 = sysctlbyname("kern.bootargs", 0, &v14, 0, 0);
  if (v0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_226DD23C8(v0);
    }
    return;
  }
  *(_OWORD *)__p = 0u;
  long long v17 = 0u;
  *(_OWORD *)__dst = 0u;
  sub_226DBC178((uint64_t)&v12, (uint64_t)__dst, 1);
  if (SHIBYTE(v17) < 0)
  {
    operator delete(__p[1]);
    if ((SHIBYTE(__p[0]) & 0x80000000) == 0)
    {
LABEL_6:
      if (v14 >= 0x7D1) {
        goto LABEL_7;
      }
LABEL_12:
      operator new[]();
    }
  }
  else if ((SHIBYTE(__p[0]) & 0x80000000) == 0)
  {
    goto LABEL_6;
  }
  operator delete(__dst[0]);
  if (v14 < 0x7D1) {
    goto LABEL_12;
  }
LABEL_7:
  BOOL v1 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (v1) {
    sub_226DD238C(v1, v2, v3, v4, v5, v6, v7, v8);
  }
  uint64_t v9 = (void **)v13;
  if (v13)
  {
    do
    {
      int64_t v11 = (void **)*v9;
      if (*((char *)v9 + 63) < 0)
      {
        operator delete(v9[5]);
        if (*((char *)v9 + 39) < 0) {
LABEL_23:
        }
          operator delete(v9[2]);
      }
      else if (*((char *)v9 + 39) < 0)
      {
        goto LABEL_23;
      }
      operator delete(v9);
      uint64_t v9 = v11;
    }
    while (v11);
  }
  unint64_t v10 = v12;
  long long v12 = 0;
  if (v10) {
    operator delete(v10);
  }
}

void sub_226DBC0C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a29 < 0) {
    operator delete(__p);
  }
  sub_226DBC25C((uint64_t)&a16);
  MEMORY[0x22A669AE0](v29, 0x1000C8077774924);
  _Unwind_Resume(a1);
}

uint64_t sub_226DBC178(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    uint64_t v5 = 48 * a3;
    do
    {
      sub_226DBD820(a1, a2, a2);
      a2 += 48;
      v5 -= 48;
    }
    while (v5);
  }
  return a1;
}

void sub_226DBC1E0(_Unwind_Exception *a1)
{
  uint64_t v3 = *(void ***)(v1 + 16);
  if (v3) {
    sub_226DD2460(v3);
  }
  sub_226DD2448((void **)v1);
  _Unwind_Resume(a1);
}

uint64_t sub_226DBC200(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
  {
    operator delete(*(void **)(a1 + 24));
    if ((*(char *)(a1 + 23) & 0x80000000) == 0) {
      return a1;
    }
  }
  else if ((*(char *)(a1 + 23) & 0x80000000) == 0)
  {
    return a1;
  }
  operator delete(*(void **)a1);
  return a1;
}

uint64_t sub_226DBC25C(uint64_t a1)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v5 = (void **)*v2;
      if (*((char *)v2 + 63) < 0)
      {
        operator delete(v2[5]);
        if (*((char *)v2 + 39) < 0) {
LABEL_10:
        }
          operator delete(v2[2]);
      }
      else if (*((char *)v2 + 39) < 0)
      {
        goto LABEL_10;
      }
      operator delete(v2);
      uint64_t v2 = v5;
    }
    while (v5);
  }
  uint64_t v3 = *(void **)a1;
  *(void *)a1 = 0;
  if (v3) {
    operator delete(v3);
  }
  return a1;
}

void *sub_226DBC2E4(unsigned char *__dst, void *__src, unint64_t a3)
{
  uint64_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_226DBC384();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    uint64_t v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    *uint64_t v5 = v8;
    uint64_t v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }

  return memmove(v5, __src, a3 + 1);
}

void sub_226DBC384()
{
}

void sub_226DBC39C(void *a1)
{
}

void sub_226DBC3B0()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C3B0] + 16;
  __cxa_throw(exception, MEMORY[0x263F8C200], MEMORY[0x263F8C088]);
}

void sub_226DBC3FC()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = &unk_26DAEF5B8;
  __cxa_throw(exception, (struct type_info *)&unk_26DAEF590, (void (*)(void *))std::exception::~exception);
}

void sub_226DBC44C(std::exception *a1)
{
  std::exception::~exception(a1);

  JUMPOUT(0x22A669B00);
}

void sub_226DBC484(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_226DBC4E0(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2647E6AA0, MEMORY[0x263F8C068]);
}

void sub_226DBC4CC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_226DBC4E0(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

void sub_226DBC518()
{
}

void *sub_226DBC52C(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_26DAEF5E0;
  result[1] = v3;
  return result;
}

uint64_t sub_226DBC574(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26DAEF5E0;
  a2[1] = v2;
  return result;
}

void sub_226DBC5A0(uint64_t a1, int *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 8);
  int v3 = *a2;
  if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    if ((v3 - 1) > 1) {
      return;
    }
LABEL_5:
    sub_226DB8898(v2);
    return;
  }
  v4[0] = 67109120;
  v4[1] = v3;
  _os_log_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "VisionHWAServer: ***************************** Device Status Callback: received status change notification = %d", (uint8_t *)v4, 8u);
  if ((v3 - 1) <= 1) {
    goto LABEL_5;
  }
}

uint64_t sub_226DBC67C(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN23VisionHWAClientServices22createDeviceAndSessionEvE3$_0") {
    return a1 + 8;
  }
  if (((v3 & (unint64_t)"ZN23VisionHWAClientServices22createDeviceAndSessionEvE3$_0" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN23VisionHWAClientServices22createDeviceAndSessionEvE3$_0")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN23VisionHWAClientServices22createDeviceAndSessionEvE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8; {
  return 0;
  }
}

void *sub_226DBC6EC()
{
  return &unk_26DAEF650;
}

void sub_226DBC6F8(void **a1, unint64_t a2)
{
  uint64_t v5 = (char *)a1[1];
  uint64_t v4 = a1[2];
  uint64_t v6 = v5;
  if (a2 <= (v4 - v5) >> 3)
  {
    if (a2)
    {
      bzero(v5, 8 * a2);
      uint64_t v6 = &v5[8 * a2];
    }
    a1[1] = v6;
  }
  else
  {
    uint64_t v7 = (char *)*a1;
    uint64_t v8 = v5 - (unsigned char *)*a1;
    uint64_t v9 = v8 >> 3;
    unint64_t v10 = (v8 >> 3) + a2;
    if (v10 >> 61) {
      sub_226DB87BC();
    }
    uint64_t v11 = v4 - v7;
    if (v11 >> 2 > v10) {
      unint64_t v10 = v11 >> 2;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      if (v12 >> 61) {
        sub_226DB8864();
      }
      long long v13 = operator new(8 * v12);
    }
    else
    {
      long long v13 = 0;
    }
    size_t v14 = &v13[8 * v9];
    size_t v15 = 8 * a2;
    unint64_t v16 = &v13[8 * v12];
    bzero(v14, v15);
    long long v17 = &v14[v15];
    if (v5 != v7)
    {
      unint64_t v18 = v5 - v7 - 8;
      if (v18 < 0x58) {
        goto LABEL_32;
      }
      if ((unint64_t)(v5 - v13 - v8) < 0x20) {
        goto LABEL_32;
      }
      uint64_t v19 = (v18 >> 3) + 1;
      uint64_t v20 = 8 * (v19 & 0x3FFFFFFFFFFFFFFCLL);
      uint64_t v6 = &v5[-v20];
      v14 -= v20;
      uint8x8_t v21 = &v13[8 * v9 - 16];
      unint64_t v22 = v5 - 16;
      uint64_t v23 = v19 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v24 = *(_OWORD *)v22;
        *(v21 - 1) = *((_OWORD *)v22 - 1);
        *uint8x8_t v21 = v24;
        v21 -= 2;
        v22 -= 32;
        v23 -= 4;
      }
      while (v23);
      if (v19 != (v19 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_32:
        do
        {
          uint64_t v25 = *((void *)v6 - 1);
          v6 -= 8;
          *((void *)v14 - 1) = v25;
          v14 -= 8;
        }
        while (v6 != v7);
      }
      uint64_t v6 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v17;
    a1[2] = v16;
    if (v6)
    {
      operator delete(v6);
    }
  }
}

std::string *sub_226DBC8AC(std::string *this, std::string *__src, std::string *a3)
{
  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  size_t v7 = (char *)a3 - (char *)__src;
  if ((v6 & 0x80000000) != 0)
  {
    if (a3 == __src) {
      return this;
    }
    std::string::size_type size = this->__r_.__value_.__l.__size_;
    unint64_t v11 = this->__r_.__value_.__r.__words[2];
    std::string::size_type v9 = (v11 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    unint64_t v10 = (std::string *)this->__r_.__value_.__r.__words[0];
    unint64_t v6 = HIBYTE(v11);
    if (this->__r_.__value_.__r.__words[0] > (unint64_t)__src) {
      goto LABEL_12;
    }
  }
  else
  {
    if (a3 == __src) {
      return this;
    }
    std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    std::string::size_type v9 = 22;
    unint64_t v10 = this;
    if (this > __src)
    {
LABEL_12:
      if (v9 - size < v7)
      {
        std::string::__grow_by(this, v9, size - v9 + v7, size, size, 0, 0);
        this->__r_.__value_.__l.__size_ = size;
        long long v13 = this;
        if ((*((unsigned char *)&this->__r_.__value_.__s + 23) & 0x80) == 0)
        {
LABEL_14:
          size_t v14 = (char *)v13 + size;
          if (a3 == __src) {
            goto LABEL_38;
          }
          goto LABEL_18;
        }
      }
      else
      {
        long long v13 = this;
        if ((v6 & 0x80) == 0) {
          goto LABEL_14;
        }
      }
      long long v13 = (std::string *)this->__r_.__value_.__r.__words[0];
      size_t v14 = (std::string::value_type *)(this->__r_.__value_.__r.__words[0] + size);
      if (a3 == __src) {
        goto LABEL_38;
      }
LABEL_18:
      if (v7 >= 0x20)
      {
        uint64_t v20 = (char *)v13 + size;
        if ((unint64_t)((char *)v13 + size - (char *)__src) >= 0x20)
        {
          size_t v15 = (std::string *)((char *)__src + (v7 & 0xFFFFFFFFFFFFFFE0));
          v14 += v7 & 0xFFFFFFFFFFFFFFE0;
          uint8x8_t v21 = v20 + 16;
          unint64_t v22 = &__src->__r_.__value_.__r.__words[2];
          unint64_t v23 = v7 & 0xFFFFFFFFFFFFFFE0;
          do
          {
            long long v24 = *(_OWORD *)v22;
            *(v21 - 1) = *((_OWORD *)v22 - 1);
            *uint8x8_t v21 = v24;
            v21 += 2;
            v22 += 4;
            v23 -= 32;
          }
          while (v23);
          if (v7 == (v7 & 0xFFFFFFFFFFFFFFE0)) {
            goto LABEL_38;
          }
        }
        else
        {
          size_t v15 = __src;
        }
      }
      else
      {
        size_t v15 = __src;
      }
      do
      {
        std::string::value_type v25 = v15->__r_.__value_.__s.__data_[0];
        size_t v15 = (std::string *)((char *)v15 + 1);
        *v14++ = v25;
      }
      while (v15 != a3);
LABEL_38:
      *size_t v14 = 0;
      std::string::size_type v26 = v7 + size;
      if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
        this->__r_.__value_.__l.__size_ = v26;
      }
      else {
        *((unsigned char *)&this->__r_.__value_.__s + 23) = v26 & 0x7F;
      }
      return this;
    }
  }
  if ((std::string *)((char *)&v10->__r_.__value_.__l.__data_ + size + 1) <= __src) {
    goto LABEL_12;
  }
  if (v7 >= 0x7FFFFFFFFFFFFFF8) {
    sub_226DBC384();
  }
  if (v7 > 0x16)
  {
    uint64_t v16 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v7 | 7) != 0x17) {
      uint64_t v16 = v7 | 7;
    }
    uint64_t v17 = v16 + 1;
    p_dst = (void **)operator new(v16 + 1);
    size_t v29 = v7;
    int64_t v30 = v17 | 0x8000000000000000;
    __dst = p_dst;
    if (a3 == __src) {
      goto LABEL_24;
    }
  }
  else
  {
    HIBYTE(v30) = v7;
    p_dst = (void **)&__dst;
    if (a3 == __src) {
      goto LABEL_24;
    }
  }
  memcpy(p_dst, __src, v7);
  p_dst = (void **)((char *)p_dst + v7);
LABEL_24:
  *(unsigned char *)p_dst = 0;
  if (v30 >= 0) {
    unint64_t v18 = (const std::string::value_type *)&__dst;
  }
  else {
    unint64_t v18 = (const std::string::value_type *)__dst;
  }
  if (v30 >= 0) {
    std::string::size_type v19 = HIBYTE(v30);
  }
  else {
    std::string::size_type v19 = v29;
  }
  std::string::append(this, v18, v19);
  if (SHIBYTE(v30) < 0) {
    operator delete(__dst);
  }
  return this;
}

void sub_226DBCAF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_226DBCB14()
{
}

__n128 sub_226DBCB28(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26DAEF670;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_226DBCB74(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26DAEF670;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_226DBCBA4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 8))(*(void *)(a1 + 16));
}

uint64_t sub_226DBCBAC(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "N4cv3d3esn5Defer11BindWrapperINSt3__16__bindIRPFvPKvEJRP11__IOSurfaceEEEEE") {
    return a1 + 8;
  }
  if (((v3 & (unint64_t)"N4cv3d3esn5Defer11BindWrapperINSt3__16__bindIRPFvPKvEJRP11__IOSurfaceEEEEE" & 0x8000000000000000) != 0) == __OFSUB__(v3, "N4cv3d3esn5Defer11BindWrapperINSt3__16__bindIRPFvPKvEJRP11__IOSurfaceEEEEE")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"N4cv3d3esn5Defer11BindWrapperINSt3__16__bindIRPFvPKvEJRP11__IOSurfaceEEEEE" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8; {
  return 0;
  }
}

void *sub_226DBCC1C()
{
  return &unk_26DAEF6E0;
}

void *sub_226DBCC28(uint64_t a1, int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    unint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      unint64_t v11 = *v10;
      if (*v10)
      {
        if (v9.u32[0] < 2uLL)
        {
          while (1)
          {
            uint64_t v13 = v11[1];
            if (v13 == v7)
            {
              if (*((_DWORD *)v11 + 4) == v7) {
                return v11;
              }
            }
            else if ((v13 & (v8 - 1)) != v4)
            {
              goto LABEL_23;
            }
            unint64_t v11 = (void *)*v11;
            if (!v11) {
              goto LABEL_23;
            }
          }
        }
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == v7) {
              return v11;
            }
          }
          else
          {
            if (v12 >= v8) {
              v12 %= v8;
            }
            if (v12 != v4) {
              break;
            }
          }
          unint64_t v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
LABEL_23:
  size_t v14 = (void *)(a1 + 16);
  unint64_t v11 = operator new(0x30uLL);
  *unint64_t v11 = 0;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  v11[4] = 0;
  v11[5] = 0;
  v11[3] = 0;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (v8 && (float)(v16 * (float)v8) >= v15)
  {
    uint64_t v17 = *(void *)a1;
    unint64_t v18 = *(void **)(*(void *)a1 + 8 * v4);
    if (v18)
    {
LABEL_26:
      *unint64_t v11 = *v18;
LABEL_61:
      *unint64_t v18 = v11;
      goto LABEL_62;
    }
  }
  else
  {
    BOOL v19 = 1;
    if (v8 >= 3) {
      BOOL v19 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v8);
    unint64_t v21 = vcvtps_u32_f32(v15 / v16);
    if (v20 <= v21) {
      size_t prime = v21;
    }
    else {
      size_t prime = v20;
    }
    if (prime == 1)
    {
      size_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      size_t prime = std::__next_prime(prime);
      unint64_t v8 = *(void *)(a1 + 8);
    }
    if (prime > v8) {
      goto LABEL_37;
    }
    if (prime < v8)
    {
      unint64_t v23 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (v8 < 3 || (uint8x8_t v24 = (uint8x8_t)vcnt_s8((int8x8_t)v8), v24.i16[0] = vaddlv_u8(v24), v24.u32[0] > 1uLL))
      {
        unint64_t v23 = std::__next_prime(v23);
      }
      else
      {
        uint64_t v25 = 1 << -(char)__clz(v23 - 1);
        if (v23 >= 2) {
          unint64_t v23 = v25;
        }
      }
      if (prime <= v23) {
        size_t prime = v23;
      }
      if (prime < v8) {
LABEL_37:
      }
        sub_226DBCFB0(a1, prime);
    }
    unint64_t v8 = *(void *)(a1 + 8);
    unint64_t v26 = v8 - 1;
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7)
      {
        unint64_t v4 = v7 % v8;
        uint64_t v17 = *(void *)a1;
        unint64_t v18 = *(void **)(*(void *)a1 + 8 * (v7 % v8));
        if (v18) {
          goto LABEL_26;
        }
      }
      else
      {
        unint64_t v4 = v7;
        uint64_t v17 = *(void *)a1;
        unint64_t v18 = *(void **)(*(void *)a1 + 8 * v7);
        if (v18) {
          goto LABEL_26;
        }
      }
    }
    else
    {
      unint64_t v4 = v26 & v7;
      uint64_t v17 = *(void *)a1;
      unint64_t v18 = *(void **)(*(void *)a1 + 8 * (v26 & v7));
      if (v18) {
        goto LABEL_26;
      }
    }
  }
  *unint64_t v11 = *v14;
  *size_t v14 = v11;
  *(void *)(v17 + 8 * v4) = v14;
  if (*v11)
  {
    unint64_t v27 = *(void *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v27 >= v8) {
        v27 %= v8;
      }
    }
    else
    {
      v27 &= v8 - 1;
    }
    unint64_t v18 = (void *)(*(void *)a1 + 8 * v27);
    goto LABEL_61;
  }
LABEL_62:
  ++*(void *)(a1 + 24);
  return v11;
}

void sub_226DBCF4C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_226DBCF60((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_226DBCF60(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16))
    {
      unint64_t v3 = (void *)v2[3];
      if (v3)
      {
        v2[4] = v3;
        operator delete(v3);
      }
    }
    operator delete(v2);
  }
  return a1;
}

void sub_226DBCFB0(uint64_t a1, unint64_t a2)
{
  if (!a2)
  {
    float v15 = *(void **)a1;
    *(void *)a1 = 0;
    if (v15) {
      operator delete(v15);
    }
    *(void *)(a1 + 8) = 0;
    return;
  }
  if (a2 >> 61) {
    sub_226DB8864();
  }
  unint64_t v4 = operator new(8 * a2);
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = v4;
  if (v5) {
    operator delete(v5);
  }
  uint64_t v6 = 0;
  *(void *)(a1 + 8) = a2;
  do
    *(void *)(*(void *)a1 + 8 * v6++) = 0;
  while (a2 != v6);
  uint64_t v8 = a1 + 16;
  unint64_t v7 = *(void **)(a1 + 16);
  if (v7)
  {
    unint64_t v9 = v7[1];
    unint64_t v10 = a2 - 1;
    if ((a2 & (a2 - 1)) == 0)
    {
      uint64_t v11 = v9 & v10;
      *(void *)(*(void *)a1 + 8 * v11) = v8;
      while (1)
      {
        unint64_t v12 = (void *)*v7;
        if (!*v7) {
          break;
        }
        uint64_t v13 = v12[1] & v10;
        if (v13 == v11)
        {
          unint64_t v7 = (void *)*v7;
        }
        else if (*(void *)(*(void *)a1 + 8 * v13))
        {
          *unint64_t v7 = *v12;
          uint64_t v14 = 8 * v13;
          *unint64_t v12 = **(void **)(*(void *)a1 + v14);
          **(void **)(*(void *)a1 + v14) = v12;
        }
        else
        {
          *(void *)(*(void *)a1 + 8 * v13) = v7;
          unint64_t v7 = v12;
          uint64_t v11 = v13;
        }
      }
      return;
    }
    if (v9 >= a2) {
      v9 %= a2;
    }
    *(void *)(*(void *)a1 + 8 * v9) = v8;
    float v16 = (void *)*v7;
    if (*v7)
    {
      while (1)
      {
        unint64_t v18 = v16[1];
        if (v18 >= a2) {
          v18 %= a2;
        }
        if (v18 == v9) {
          goto LABEL_25;
        }
        if (*(void *)(*(void *)a1 + 8 * v18))
        {
          *unint64_t v7 = *v16;
          uint64_t v17 = 8 * v18;
          *float v16 = **(void **)(*(void *)a1 + v17);
          **(void **)(*(void *)a1 + v17) = v16;
          float v16 = v7;
LABEL_25:
          unint64_t v7 = v16;
          float v16 = (void *)*v16;
          if (!v16) {
            return;
          }
        }
        else
        {
          *(void *)(*(void *)a1 + 8 * v18) = v7;
          unint64_t v7 = v16;
          float v16 = (void *)*v16;
          unint64_t v9 = v18;
          if (!v16) {
            return;
          }
        }
      }
    }
  }
}

char *sub_226DBD160(uint64_t a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    unint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      uint64_t v11 = (char *)*v10;
      if (*v10)
      {
        if (v9.u32[0] < 2uLL)
        {
          while (1)
          {
            uint64_t v13 = *((void *)v11 + 1);
            if (v13 == v7)
            {
              if (*((_DWORD *)v11 + 4) == v7) {
                return v11;
              }
            }
            else if ((v13 & (v8 - 1)) != v4)
            {
              goto LABEL_23;
            }
            uint64_t v11 = *(char **)v11;
            if (!v11) {
              goto LABEL_23;
            }
          }
        }
        do
        {
          unint64_t v12 = *((void *)v11 + 1);
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == v7) {
              return v11;
            }
          }
          else
          {
            if (v12 >= v8) {
              v12 %= v8;
            }
            if (v12 != v4) {
              break;
            }
          }
          uint64_t v11 = *(char **)v11;
        }
        while (v11);
      }
    }
  }
LABEL_23:
  uint64_t v14 = (void *)(a1 + 16);
  uint64_t v11 = (char *)operator new(0xA0uLL);
  *(void *)uint64_t v11 = 0;
  *((void *)v11 + 1) = v7;
  *((_DWORD *)v11 + 4) = **a4;
  *((void *)v11 + 19) = 0;
  *(_OWORD *)(v11 + 136) = 0u;
  *(_OWORD *)(v11 + 120) = 0u;
  *(_OWORD *)(v11 + 104) = 0u;
  *(_OWORD *)(v11 + 88) = 0u;
  *(_OWORD *)(v11 + 72) = 0u;
  *(_OWORD *)(v11 + 56) = 0u;
  *(_OWORD *)(v11 + 40) = 0u;
  *(_OWORD *)(v11 + 24) = 0u;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (v8 && (float)(v16 * (float)v8) >= v15)
  {
    unint64_t v7 = v4;
  }
  else
  {
    BOOL v17 = 1;
    if (v8 >= 3) {
      BOOL v17 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v8);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t prime = v19;
    }
    else {
      size_t prime = v18;
    }
    if (prime == 1)
    {
      size_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      size_t prime = std::__next_prime(prime);
      unint64_t v8 = *(void *)(a1 + 8);
    }
    if (prime > v8) {
      goto LABEL_36;
    }
    if (prime < v8)
    {
      unint64_t v21 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (v8 < 3 || (uint8x8_t v22 = (uint8x8_t)vcnt_s8((int8x8_t)v8), v22.i16[0] = vaddlv_u8(v22), v22.u32[0] > 1uLL))
      {
        unint64_t v21 = std::__next_prime(v21);
      }
      else
      {
        uint64_t v23 = 1 << -(char)__clz(v21 - 1);
        if (v21 >= 2) {
          unint64_t v21 = v23;
        }
      }
      if (prime <= v21) {
        size_t prime = v21;
      }
      if (prime < v8) {
LABEL_36:
      }
        sub_226DBCFB0(a1, prime);
    }
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7) {
        v7 %= v8;
      }
    }
    else
    {
      unint64_t v7 = (v8 - 1) & v7;
    }
  }
  uint64_t v24 = *(void *)a1;
  uint64_t v25 = *(void **)(*(void *)a1 + 8 * v7);
  if (v25)
  {
    *(void *)uint64_t v11 = *v25;
LABEL_59:
    *uint64_t v25 = v11;
    goto LABEL_60;
  }
  *(void *)uint64_t v11 = *v14;
  *uint64_t v14 = v11;
  *(void *)(v24 + 8 * v7) = v14;
  if (*(void *)v11)
  {
    unint64_t v26 = *(void *)(*(void *)v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v26 >= v8) {
        v26 %= v8;
      }
    }
    else
    {
      v26 &= v8 - 1;
    }
    uint64_t v25 = (void *)(*(void *)a1 + 8 * v26);
    goto LABEL_59;
  }
LABEL_60:
  ++*(void *)(a1 + 24);
  return v11;
}

void sub_226DBD48C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  sub_226DBD4A8(v11, v10);
  _Unwind_Resume(a1);
}

void sub_226DBD4A8(uint64_t a1, char *__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    uint64_t v3 = *((void *)__p + 19);
    *((void *)__p + 19) = 0;
    if (v3) {
      (*(void (**)(uint64_t))(*(void *)v3 + 72))(v3);
    }
    if (__p[144]
      && (unint64_t v4 = (std::__shared_weak_count *)*((void *)__p + 17)) != 0
      && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
      if ((__p[127] & 0x80000000) == 0)
      {
LABEL_9:
        uint64_t v5 = (void *)*((void *)__p + 10);
        if (v5)
        {
          *((void *)__p + 11) = v5;
          operator delete(v5);
          uint64_t v6 = __p;
LABEL_12:
          operator delete(v6);
          return;
        }
LABEL_14:
        uint64_t v6 = __p;
        goto LABEL_12;
      }
    }
    else if ((__p[127] & 0x80000000) == 0)
    {
      goto LABEL_9;
    }
    operator delete(*((void **)__p + 13));
    goto LABEL_9;
  }
  if (__p) {
    goto LABEL_14;
  }
}

uint64_t sub_226DBD5C0(void *a1, unsigned int *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (*(void *)&v2 <= v3) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (v2.i32[0] - 1) & v3;
  }
  uint64_t v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  unint64_t v7 = *v6;
  if (!*v6) {
    return 0;
  }
  if (v4.u32[0] < 2uLL)
  {
    uint64_t v8 = *(void *)&v2 - 1;
    while (1)
    {
      uint64_t v10 = v7[1];
      if (v10 == v3)
      {
        if (*((_DWORD *)v7 + 4) == v3) {
          goto LABEL_22;
        }
      }
      else if ((v10 & v8) != v5)
      {
        return 0;
      }
      unint64_t v7 = (uint64_t *)*v7;
      if (!v7) {
        return 0;
      }
    }
  }
  while (1)
  {
    unint64_t v9 = v7[1];
    if (v9 == v3) {
      break;
    }
    if (v9 >= *(void *)&v2) {
      v9 %= *(void *)&v2;
    }
    if (v9 != v5) {
      return 0;
    }
LABEL_11:
    unint64_t v7 = (uint64_t *)*v7;
    if (!v7) {
      return 0;
    }
  }
  if (*((_DWORD *)v7 + 4) != v3) {
    goto LABEL_11;
  }
LABEL_22:
  sub_226DBD6EC(a1, v7, (uint64_t)&__p);
  unint64_t v12 = (char *)__p;
  __p = 0;
  if (v12) {
    sub_226DBD4A8((uint64_t)&v14, v12);
  }
  return 1;
}

void *sub_226DBD6EC@<X0>(void *result@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  int8x8_t v3 = (int8x8_t)result[1];
  unint64_t v4 = a2[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(void *)&v3) {
      v4 %= *(void *)&v3;
    }
  }
  else
  {
    v4 &= *(void *)&v3 - 1;
  }
  uint64_t v6 = *(void **)(*result + 8 * v4);
  do
  {
    unint64_t v7 = v6;
    uint64_t v6 = (void *)*v6;
  }
  while (v6 != a2);
  if (v7 == result + 2) {
    goto LABEL_18;
  }
  unint64_t v8 = v7[1];
  if (v5.u32[0] > 1uLL)
  {
    if (v8 >= *(void *)&v3) {
      v8 %= *(void *)&v3;
    }
  }
  else
  {
    v8 &= *(void *)&v3 - 1;
  }
  if (v8 != v4)
  {
LABEL_18:
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v9 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v9 >= *(void *)&v3) {
        v9 %= *(void *)&v3;
      }
    }
    else
    {
      v9 &= *(void *)&v3 - 1;
    }
    if (v9 != v4) {
LABEL_19:
    }
      *(void *)(*result + 8 * v4) = 0;
  }
  uint64_t v10 = *a2;
  if (*a2)
  {
    unint64_t v11 = *(void *)(v10 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v11 >= *(void *)&v3) {
        v11 %= *(void *)&v3;
      }
    }
    else
    {
      v11 &= *(void *)&v3 - 1;
    }
    if (v11 != v4)
    {
      *(void *)(*result + 8 * v11) = v7;
      uint64_t v10 = *a2;
    }
  }
  *unint64_t v7 = v10;
  *a2 = 0;
  --result[3];
  *(void *)a3 = a2;
  *(void *)(a3 + 8) = result + 2;
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

uint64_t *sub_226DBD820(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8x8_t v5 = (unsigned char *)a2;
  unint64_t v7 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v8 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v8 = v7;
  }
  unint64_t v9 = sub_226DBDD98((uint64_t)v39, (uint64_t *)a2, v8);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v3 = v9;
      if (v9 >= v11) {
        unint64_t v3 = v9 % v11;
      }
    }
    else
    {
      unint64_t v3 = (v11 - 1) & v9;
    }
    uint64_t v13 = *(uint64_t ***)(*(void *)a1 + 8 * v3);
    if (v13)
    {
      uint64_t v14 = *v13;
      if (*v13)
      {
        char v15 = v5[23];
        if (v15 >= 0) {
          uint64_t v16 = v5[23];
        }
        else {
          uint64_t v16 = *((void *)v5 + 1);
        }
        if (v15 < 0) {
          uint8x8_t v5 = *(unsigned char **)v5;
        }
        if (v12.u32[0] < 2uLL)
        {
          while (1)
          {
            uint64_t v21 = v14[1];
            if (v21 == v10)
            {
              uint64_t v22 = *((unsigned __int8 *)v14 + 39);
              if ((v22 & 0x80u) == 0) {
                uint64_t v23 = *((unsigned __int8 *)v14 + 39);
              }
              else {
                uint64_t v23 = v14[3];
              }
              if (v23 == v16)
              {
                if ((v22 & 0x80) != 0)
                {
                  if (!memcmp((const void *)v14[2], v5, v14[3])) {
                    return v14;
                  }
                }
                else
                {
                  if (!*((unsigned char *)v14 + 39)) {
                    return v14;
                  }
                  uint64_t v24 = 0;
                  while (*((unsigned __int8 *)v14 + v24 + 16) == v5[v24])
                  {
                    if (v22 == ++v24) {
                      return v14;
                    }
                  }
                }
              }
            }
            else if ((v21 & (v11 - 1)) != v3)
            {
              goto LABEL_51;
            }
            uint64_t v14 = (uint64_t *)*v14;
            if (!v14) {
              goto LABEL_51;
            }
          }
        }
        do
        {
          unint64_t v17 = v14[1];
          if (v17 == v10)
          {
            uint64_t v18 = *((unsigned __int8 *)v14 + 39);
            if ((v18 & 0x80u) == 0) {
              uint64_t v19 = *((unsigned __int8 *)v14 + 39);
            }
            else {
              uint64_t v19 = v14[3];
            }
            if (v19 == v16)
            {
              if ((v18 & 0x80) != 0)
              {
                if (!memcmp((const void *)v14[2], v5, v14[3])) {
                  return v14;
                }
              }
              else
              {
                if (!*((unsigned char *)v14 + 39)) {
                  return v14;
                }
                uint64_t v20 = 0;
                while (*((unsigned __int8 *)v14 + v20 + 16) == v5[v20])
                {
                  if (v18 == ++v20) {
                    return v14;
                  }
                }
              }
            }
          }
          else
          {
            if (v17 >= v11) {
              v17 %= v11;
            }
            if (v17 != v3) {
              break;
            }
          }
          uint64_t v14 = (uint64_t *)*v14;
        }
        while (v14);
      }
    }
  }
LABEL_51:
  sub_226DBDC40(a1, v10, a3, (uint64_t)v39);
  float v25 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v26 = *(float *)(a1 + 32);
  if (!v11 || (float)(v26 * (float)v11) < v25)
  {
    BOOL v28 = 1;
    if (v11 >= 3) {
      BOOL v28 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v29 = v28 | (2 * v11);
    unint64_t v30 = vcvtps_u32_f32(v25 / v26);
    if (v29 <= v30) {
      size_t prime = v30;
    }
    else {
      size_t prime = v29;
    }
    if (prime == 1)
    {
      size_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      size_t prime = std::__next_prime(prime);
    }
    int8x8_t v32 = *(int8x8_t *)(a1 + 8);
    if (prime > *(void *)&v32) {
      goto LABEL_65;
    }
    if (prime < *(void *)&v32)
    {
      unint64_t v33 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (*(void *)&v32 < 3uLL || (uint8x8_t v34 = (uint8x8_t)vcnt_s8(v32), v34.i16[0] = vaddlv_u8(v34), v34.u32[0] > 1uLL))
      {
        unint64_t v33 = std::__next_prime(v33);
      }
      else
      {
        uint64_t v35 = 1 << -(char)__clz(v33 - 1);
        if (v33 >= 2) {
          unint64_t v33 = v35;
        }
      }
      if (prime <= v33) {
        size_t prime = v33;
      }
      if (prime < *(void *)&v32) {
LABEL_65:
      }
        sub_226DBCFB0(a1, prime);
    }
    unint64_t v11 = *(void *)(a1 + 8);
    unint64_t v36 = v11 - 1;
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
      {
        unint64_t v3 = v10 % v11;
        unint64_t v27 = *(void **)(*(void *)a1 + 8 * (v10 % v11));
        if (v27) {
          goto LABEL_54;
        }
      }
      else
      {
        unint64_t v3 = v10;
        unint64_t v27 = *(void **)(*(void *)a1 + 8 * v10);
        if (v27) {
          goto LABEL_54;
        }
      }
    }
    else
    {
      unint64_t v3 = v36 & v10;
      unint64_t v27 = *(void **)(*(void *)a1 + 8 * (v36 & v10));
      if (v27) {
        goto LABEL_54;
      }
    }
LABEL_78:
    *(void *)v39[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v39[0];
    *(void *)(*(void *)a1 + 8 * v3) = a1 + 16;
    if (*(void *)v39[0])
    {
      unint64_t v37 = *(void *)(*(void *)v39[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v37 >= v11) {
          v37 %= v11;
        }
      }
      else
      {
        v37 &= v11 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v37) = v39[0];
    }
    goto LABEL_89;
  }
  unint64_t v27 = *(void **)(*(void *)a1 + 8 * v3);
  if (!v27) {
    goto LABEL_78;
  }
LABEL_54:
  *(void *)v39[0] = *v27;
  *unint64_t v27 = v39[0];
LABEL_89:
  uint64_t v14 = (uint64_t *)v39[0];
  ++*(void *)(a1 + 24);
  return v14;
}

void sub_226DBDC28(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_226DBDD2C((uint64_t *)va);
  _Unwind_Resume(a1);
}

unsigned char *sub_226DBDC40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unint64_t v8 = operator new(0x40uLL);
  unint64_t v9 = v8;
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  *unint64_t v8 = 0;
  v8[1] = a2;
  if (*(char *)(a3 + 23) < 0)
  {
    sub_226DBC2E4((unsigned char *)v8 + 16, *(void **)a3, *(void *)(a3 + 8));
  }
  else
  {
    *((_OWORD *)v8 + 1) = *(_OWORD *)a3;
    v8[4] = *(void *)(a3 + 16);
  }
  __n128 result = v9 + 5;
  if (*(char *)(a3 + 47) < 0)
  {
    __n128 result = sub_226DBC2E4(result, *(void **)(a3 + 24), *(void *)(a3 + 32));
  }
  else
  {
    *(_OWORD *)__n128 result = *(_OWORD *)(a3 + 24);
    v9[7] = *(void *)(a3 + 40);
  }
  *(unsigned char *)(a4 + 16) = 1;
  return result;
}

void sub_226DBDCF4(_Unwind_Exception *a1)
{
  if (*(char *)(v2 + 39) < 0)
  {
    operator delete(*v3);
    sub_226DBDD2C(v1);
    _Unwind_Resume(a1);
  }
  sub_226DBDD2C(v1);
  _Unwind_Resume(a1);
}

uint64_t *sub_226DBDD2C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if (*((unsigned char *)a1 + 16))
    {
      if (*(char *)(v2 + 63) < 0)
      {
        operator delete(*(void **)(v2 + 40));
        if ((*(char *)(v2 + 39) & 0x80000000) == 0) {
          goto LABEL_5;
        }
      }
      else if ((*(char *)(v2 + 39) & 0x80000000) == 0)
      {
        goto LABEL_5;
      }
      operator delete(*(void **)(v2 + 16));
    }
LABEL_5:
    operator delete((void *)v2);
  }
  return a1;
}

unint64_t sub_226DBDD98(uint64_t a1, uint64_t *a2, unint64_t a3)
{
  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      uint64_t v23 = *(uint64_t *)((char *)a2 + a3 - 48);
      uint64_t v24 = *(uint64_t *)((char *)a2 + a3 - 40);
      uint64_t v25 = *(uint64_t *)((char *)a2 + a3 - 24);
      uint64_t v27 = *(uint64_t *)((char *)a2 + a3 - 64);
      uint64_t v26 = *(uint64_t *)((char *)a2 + a3 - 56);
      uint64_t v28 = *(uint64_t *)((char *)a2 + a3 - 16);
      uint64_t v29 = *(uint64_t *)((char *)a2 + a3 - 8);
      unint64_t v30 = v26 + v28;
      unint64_t v31 = 0x9DDFEA08EB382D69
          * (v25 ^ ((0x9DDFEA08EB382D69 * (v25 ^ (v23 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v25 ^ (v23 + a3))));
      unint64_t v32 = 0x9DDFEA08EB382D69 * (v31 ^ (v31 >> 47));
      unint64_t v33 = v27 + a3 + v26 + v23;
      uint64_t v34 = v33 + v24;
      unint64_t v35 = __ROR8__(v33, 44) + v27 + a3 + __ROR8__(v24 + v27 + a3 - 0x622015F714C7D297 * (v31 ^ (v31 >> 47)), 21);
      uint64_t v36 = v26 + v28 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v37 = v36 + v25 + v28;
      uint64_t v38 = __ROR8__(v37, 44);
      uint64_t v39 = v37 + v29;
      uint64_t v40 = v38 + v36 + __ROR8__(v36 + v24 + v29, 21);
      uint64_t v42 = *a2;
      uint64_t v41 = a2 + 4;
      unint64_t v43 = v42 - 0x4B6D499041670D8DLL * v24;
      uint64_t v44 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        uint64_t v45 = *(v41 - 3);
        uint64_t v46 = v43 + v34 + v30 + v45;
        uint64_t v47 = v41[2];
        uint64_t v48 = v41[3];
        uint64_t v49 = v41[1];
        unint64_t v30 = v49 + v34 - 0x4B6D499041670D8DLL * __ROR8__(v30 + v35 + v47, 42);
        uint64_t v50 = v32 + v39;
        uint64_t v51 = *(v41 - 2);
        uint64_t v52 = *(v41 - 1);
        uint64_t v53 = *(v41 - 4) - 0x4B6D499041670D8DLL * v35;
        uint64_t v54 = v53 + v39 + v52;
        uint64_t v55 = v53 + v45 + v51;
        uint64_t v34 = v55 + v52;
        uint64_t v56 = __ROR8__(v55, 44) + v53;
        unint64_t v57 = (0xB492B66FBE98F273 * __ROR8__(v46, 37)) ^ v40;
        unint64_t v43 = 0xB492B66FBE98F273 * __ROR8__(v50, 33);
        unint64_t v35 = v56 + __ROR8__(v54 + v57, 21);
        unint64_t v58 = v43 + v40 + *v41;
        uint64_t v39 = v58 + v49 + v47 + v48;
        uint64_t v40 = __ROR8__(v58 + v49 + v47, 44) + v58 + __ROR8__(v30 + v51 + v58 + v48, 21);
        v41 += 8;
        unint64_t v32 = v57;
        v44 += 64;
      }
      while (v44);
      unint64_t v59 = v43
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v40 ^ ((0x9DDFEA08EB382D69 * (v40 ^ v35)) >> 47) ^ (0x9DDFEA08EB382D69 * (v40 ^ v35)))) ^ ((0x9DDFEA08EB382D69 * (v40 ^ ((0x9DDFEA08EB382D69 * (v40 ^ v35)) >> 47) ^ (0x9DDFEA08EB382D69 * (v40 ^ v35)))) >> 47));
      unint64_t v60 = 0x9DDFEA08EB382D69
          * (v59 ^ (v57
                  - 0x4B6D499041670D8DLL * (v30 ^ (v30 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v39 ^ ((0x9DDFEA08EB382D69 * (v39 ^ v34)) >> 47) ^ (0x9DDFEA08EB382D69 * (v39 ^ v34)))) ^ ((0x9DDFEA08EB382D69 * (v39 ^ ((0x9DDFEA08EB382D69 * (v39 ^ v34)) >> 47) ^ (0x9DDFEA08EB382D69 * (v39 ^ v34)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v59 ^ (v60 >> 47) ^ v60)) ^ ((0x9DDFEA08EB382D69 * (v59 ^ (v60 >> 47) ^ v60)) >> 47));
    }
    else
    {
      uint64_t v6 = *(uint64_t *)((char *)a2 + a3 - 16);
      uint64_t v7 = *a2 - 0x3C5A37A36834CED9 * (v6 + a3);
      uint64_t v9 = a2[2];
      uint64_t v8 = a2[3];
      uint64_t v10 = __ROR8__(v7 + v8, 52);
      uint64_t v11 = v7 + a2[1];
      uint64_t v12 = __ROR8__(v11, 7);
      uint64_t v13 = v11 + v9;
      uint64_t v14 = *(uint64_t *)((char *)a2 + a3 - 32) + v9;
      uint64_t v15 = v12 + __ROR8__(*a2 - 0x3C5A37A36834CED9 * (v6 + a3), 37) + v10 + __ROR8__(v13, 31);
      uint64_t v16 = *(uint64_t *)((char *)a2 + a3 - 24) + v14 + v6;
      unint64_t v17 = 0xC3A5C85C97CB3127 * (v16 + *(uint64_t *)((char *)a2 + a3 - 8) + v8 + v15)
          - 0x651E95C4D06FBFB1
          * (v13
           + v8
           + __ROR8__(v14, 37)
           + __ROR8__(*(uint64_t *)((char *)a2 + a3 - 24) + v14, 7)
           + __ROR8__(*(uint64_t *)((char *)a2 + a3 - 8) + v8 + v14, 52)
           + __ROR8__(v16, 31));
      return 0x9AE16A3B2F90404FLL
           * ((v15 - 0x3C5A37A36834CED9 * (v17 ^ (v17 >> 47))) ^ ((v15 - 0x3C5A37A36834CED9 * (v17 ^ (v17 >> 47))) >> 47));
    }
  }
  else if (a3 > 0x10)
  {
    uint64_t v18 = a2[1];
    unint64_t v19 = 0xB492B66FBE98F273 * *a2;
    uint64_t v20 = __ROR8__(0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a2 + a3 - 8), 30) + __ROR8__(v19 - v18, 43);
    unint64_t v21 = v19 + a3 + __ROR8__(v18 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a2 + a3 - 8);
    unint64_t v22 = 0x9DDFEA08EB382D69 * ((v20 - 0x3C5A37A36834CED9 * *(uint64_t *)((char *)a2 + a3 - 16)) ^ v21);
    return 0x9DDFEA08EB382D69
         * ((0x9DDFEA08EB382D69 * (v21 ^ (v22 >> 47) ^ v22)) ^ ((0x9DDFEA08EB382D69 * (v21 ^ (v22 >> 47) ^ v22)) >> 47));
  }
  else if (a3 < 9)
  {
    if (a3 < 4)
    {
      unint64_t result = 0x9AE16A3B2F90404FLL;
      if (a3)
      {
        unint64_t v63 = (0xC949D7C7509E6557 * (a3 + 4 * *((unsigned __int8 *)a2 + a3 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                       * (*(unsigned __int8 *)a2 | ((unint64_t)*((unsigned __int8 *)a2 + (a3 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v63 ^ (v63 >> 47));
      }
    }
    else
    {
      uint64_t v61 = *(unsigned int *)((char *)a2 + a3 - 4);
      unint64_t v62 = 0x9DDFEA08EB382D69 * (((8 * *(_DWORD *)a2) + a3) ^ v61);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v61 ^ (v62 >> 47) ^ v62)) ^ ((0x9DDFEA08EB382D69 * (v61 ^ (v62 >> 47) ^ v62)) >> 47));
    }
  }
  else
  {
    uint64_t v3 = *(uint64_t *)((char *)a2 + a3 - 8);
    uint64_t v4 = __ROR8__(v3 + a3, a3);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *a2)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *a2)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *a2)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *a2)))) >> 47))) ^ v3;
  }
  return result;
}

uint64_t *sub_226DBE1E4(uint64_t a1, uint64_t a2, uint64_t a3, long long **a4)
{
  uint64_t v6 = (unsigned char *)a2;
  unint64_t v8 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v9 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v9 = v8;
  }
  unint64_t v10 = sub_226DBDD98((uint64_t)v45, (uint64_t *)a2, v9);
  unint64_t v11 = v10;
  unint64_t v12 = *(void *)(a1 + 8);
  if (v12)
  {
    uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    if (v13.u32[0] > 1uLL)
    {
      unint64_t v4 = v10;
      if (v10 >= v12) {
        unint64_t v4 = v10 % v12;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v10;
    }
    uint64_t v14 = *(uint64_t ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      uint64_t v15 = *v14;
      if (*v14)
      {
        char v16 = v6[23];
        if (v16 >= 0) {
          uint64_t v17 = v6[23];
        }
        else {
          uint64_t v17 = *((void *)v6 + 1);
        }
        if (v16 < 0) {
          uint64_t v6 = *(unsigned char **)v6;
        }
        if (v13.u32[0] < 2uLL)
        {
          while (1)
          {
            uint64_t v22 = v15[1];
            if (v22 == v11)
            {
              uint64_t v23 = *((unsigned __int8 *)v15 + 39);
              if ((v23 & 0x80u) == 0) {
                uint64_t v24 = *((unsigned __int8 *)v15 + 39);
              }
              else {
                uint64_t v24 = v15[3];
              }
              if (v24 == v17)
              {
                if ((v23 & 0x80) != 0)
                {
                  if (!memcmp((const void *)v15[2], v6, v15[3])) {
                    return v15;
                  }
                }
                else
                {
                  if (!*((unsigned char *)v15 + 39)) {
                    return v15;
                  }
                  uint64_t v25 = 0;
                  while (*((unsigned __int8 *)v15 + v25 + 16) == v6[v25])
                  {
                    if (v23 == ++v25) {
                      return v15;
                    }
                  }
                }
              }
            }
            else if ((v22 & (v12 - 1)) != v4)
            {
              goto LABEL_51;
            }
            uint64_t v15 = (uint64_t *)*v15;
            if (!v15) {
              goto LABEL_51;
            }
          }
        }
        do
        {
          unint64_t v18 = v15[1];
          if (v18 == v11)
          {
            uint64_t v19 = *((unsigned __int8 *)v15 + 39);
            if ((v19 & 0x80u) == 0) {
              uint64_t v20 = *((unsigned __int8 *)v15 + 39);
            }
            else {
              uint64_t v20 = v15[3];
            }
            if (v20 == v17)
            {
              if ((v19 & 0x80) != 0)
              {
                if (!memcmp((const void *)v15[2], v6, v15[3])) {
                  return v15;
                }
              }
              else
              {
                if (!*((unsigned char *)v15 + 39)) {
                  return v15;
                }
                uint64_t v21 = 0;
                while (*((unsigned __int8 *)v15 + v21 + 16) == v6[v21])
                {
                  if (v19 == ++v21) {
                    return v15;
                  }
                }
              }
            }
          }
          else
          {
            if (v18 >= v12) {
              v18 %= v12;
            }
            if (v18 != v4) {
              break;
            }
          }
          uint64_t v15 = (uint64_t *)*v15;
        }
        while (v15);
      }
    }
  }
LABEL_51:
  uint64_t v26 = operator new(0x40uLL);
  v45[0] = v26;
  v45[1] = a1 + 16;
  char v46 = 0;
  *uint64_t v26 = 0;
  v26[1] = v11;
  uint64_t v27 = v26 + 2;
  uint64_t v28 = *a4;
  if (*((char *)*a4 + 23) < 0)
  {
    sub_226DBC2E4(v27, *(void **)v28, *((void *)v28 + 1));
  }
  else
  {
    long long v29 = *v28;
    v26[4] = *((void *)v28 + 2);
    *(_OWORD *)uint64_t v27 = v29;
  }
  v26[5] = 0;
  v26[6] = 0;
  v26[7] = 0;
  char v46 = 1;
  float v30 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v31 = *(float *)(a1 + 32);
  if (!v12 || (float)(v31 * (float)v12) < v30)
  {
    BOOL v34 = 1;
    if (v12 >= 3) {
      BOOL v34 = (v12 & (v12 - 1)) != 0;
    }
    unint64_t v35 = v34 | (2 * v12);
    unint64_t v36 = vcvtps_u32_f32(v30 / v31);
    if (v35 <= v36) {
      size_t prime = v36;
    }
    else {
      size_t prime = v35;
    }
    if (prime == 1)
    {
      size_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      size_t prime = std::__next_prime(prime);
    }
    int8x8_t v38 = *(int8x8_t *)(a1 + 8);
    if (prime > *(void *)&v38) {
      goto LABEL_68;
    }
    if (prime < *(void *)&v38)
    {
      unint64_t v39 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (*(void *)&v38 < 3uLL || (uint8x8_t v40 = (uint8x8_t)vcnt_s8(v38), v40.i16[0] = vaddlv_u8(v40), v40.u32[0] > 1uLL))
      {
        unint64_t v39 = std::__next_prime(v39);
      }
      else
      {
        uint64_t v41 = 1 << -(char)__clz(v39 - 1);
        if (v39 >= 2) {
          unint64_t v39 = v41;
        }
      }
      if (prime <= v39) {
        size_t prime = v39;
      }
      if (prime < *(void *)&v38) {
LABEL_68:
      }
        sub_226DBCFB0(a1, prime);
    }
    unint64_t v12 = *(void *)(a1 + 8);
    unint64_t v42 = v12 - 1;
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12)
      {
        unint64_t v4 = v11 % v12;
        unint64_t v32 = *(void **)(*(void *)a1 + 8 * (v11 % v12));
        unint64_t v33 = (void *)v45[0];
        if (v32) {
          goto LABEL_57;
        }
      }
      else
      {
        unint64_t v4 = v11;
        unint64_t v32 = *(void **)(*(void *)a1 + 8 * v11);
        unint64_t v33 = (void *)v45[0];
        if (v32) {
          goto LABEL_57;
        }
      }
    }
    else
    {
      unint64_t v4 = v42 & v11;
      unint64_t v32 = *(void **)(*(void *)a1 + 8 * (v42 & v11));
      unint64_t v33 = (void *)v45[0];
      if (v32) {
        goto LABEL_57;
      }
    }
LABEL_81:
    *unint64_t v33 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v45[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v45[0])
    {
      unint64_t v43 = *(void *)(*(void *)v45[0] + 8);
      if ((v12 & (v12 - 1)) != 0)
      {
        if (v43 >= v12) {
          v43 %= v12;
        }
      }
      else
      {
        v43 &= v12 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v43) = v45[0];
    }
    goto LABEL_92;
  }
  unint64_t v32 = *(void **)(*(void *)a1 + 8 * v4);
  unint64_t v33 = (void *)v45[0];
  if (!v32) {
    goto LABEL_81;
  }
LABEL_57:
  *unint64_t v33 = *v32;
  *unint64_t v32 = v45[0];
LABEL_92:
  uint64_t v15 = (uint64_t *)v45[0];
  ++*(void *)(a1 + 24);
  return v15;
}

void sub_226DBE630(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_226DBDD2C((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_226DBE644(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_226DBDD2C((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t *sub_226DBE65C(void *a1, uint64_t a2)
{
  uint64_t v2 = (unsigned char *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v5 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v5 = v4;
  }
  unint64_t v6 = sub_226DBDD98((uint64_t)&v25, (uint64_t *)a2, v5);
  int8x8_t v7 = (int8x8_t)a1[1];
  if (!*(void *)&v7) {
    return 0;
  }
  unint64_t v8 = v6;
  uint8x8_t v9 = (uint8x8_t)vcnt_s8(v7);
  v9.i16[0] = vaddlv_u8(v9);
  if (v9.u32[0] > 1uLL)
  {
    unint64_t v10 = v6;
    if (v6 >= *(void *)&v7) {
      unint64_t v10 = v6 % *(void *)&v7;
    }
  }
  else
  {
    unint64_t v10 = (*(void *)&v7 - 1) & v6;
  }
  unint64_t v12 = *(uint64_t ***)(*a1 + 8 * v10);
  if (v12)
  {
    uint8x8_t v13 = *v12;
    if (*v12)
    {
      char v14 = v2[23];
      if (v14 >= 0) {
        uint64_t v15 = v2[23];
      }
      else {
        uint64_t v15 = *((void *)v2 + 1);
      }
      if (v14 < 0) {
        uint64_t v2 = *(unsigned char **)v2;
      }
      if (v9.u32[0] < 2uLL)
      {
        uint64_t v16 = *(void *)&v7 - 1;
        while (1)
        {
          uint64_t v21 = v13[1];
          if (v21 == v8)
          {
            uint64_t v22 = *((unsigned __int8 *)v13 + 39);
            if ((v22 & 0x80u) == 0) {
              uint64_t v23 = *((unsigned __int8 *)v13 + 39);
            }
            else {
              uint64_t v23 = v13[3];
            }
            if (v23 == v15)
            {
              if ((v22 & 0x80) != 0)
              {
                if (!memcmp((const void *)v13[2], v2, v13[3])) {
                  return v13;
                }
              }
              else
              {
                if (!*((unsigned char *)v13 + 39)) {
                  return v13;
                }
                uint64_t v24 = 0;
                while (*((unsigned __int8 *)v13 + v24 + 16) == v2[v24])
                {
                  if (v22 == ++v24) {
                    return v13;
                  }
                }
              }
            }
          }
          else if ((v21 & v16) != v10)
          {
            return 0;
          }
          unint64_t result = 0;
          uint8x8_t v13 = (uint64_t *)*v13;
          if (!v13) {
            return result;
          }
        }
      }
      while (1)
      {
        unint64_t v17 = v13[1];
        if (v17 == v8)
        {
          uint64_t v18 = *((unsigned __int8 *)v13 + 39);
          if ((v18 & 0x80u) == 0) {
            uint64_t v19 = *((unsigned __int8 *)v13 + 39);
          }
          else {
            uint64_t v19 = v13[3];
          }
          if (v19 == v15)
          {
            if ((v18 & 0x80) != 0)
            {
              if (!memcmp((const void *)v13[2], v2, v13[3])) {
                return v13;
              }
            }
            else
            {
              if (!*((unsigned char *)v13 + 39)) {
                return v13;
              }
              uint64_t v20 = 0;
              while (*((unsigned __int8 *)v13 + v20 + 16) == v2[v20])
              {
                if (v18 == ++v20) {
                  return v13;
                }
              }
            }
          }
        }
        else
        {
          if (v17 >= *(void *)&v7) {
            v17 %= *(void *)&v7;
          }
          if (v17 != v10) {
            return 0;
          }
        }
        unint64_t result = 0;
        uint8x8_t v13 = (uint64_t *)*v13;
        if (!v13) {
          return result;
        }
      }
    }
  }
  return 0;
}

void sub_226DBE88C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_226DBE8A8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_226DBE8D0(uint64_t a1, uint64_t a2, std::__shared_weak_count *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  unint64_t v6 = (std::mutex *)(a2 + 344);
  std::mutex::lock((std::mutex *)(a2 + 344));
  unint64_t v7 = *(void *)(a2 + 104);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v9 = (int)a1;
      if (v7 <= (int)a1) {
        unint64_t v9 = (int)a1 % v7;
      }
    }
    else
    {
      unint64_t v9 = (v7 - 1) & (int)a1;
    }
    unint64_t v10 = *(uint64_t ***)(*(void *)(a2 + 96) + 8 * v9);
    if (v10)
    {
      unint64_t v11 = *v10;
      if (v11)
      {
        if (v8.u32[0] < 2uLL)
        {
          unint64_t v12 = v7 - 1;
          while (1)
          {
            uint64_t v14 = v11[1];
            if (v14 == (int)a1)
            {
              if (*((_DWORD *)v11 + 4) == a1) {
                goto LABEL_31;
              }
            }
            else if ((v14 & v12) != v9)
            {
              goto LABEL_21;
            }
            unint64_t v11 = (uint64_t *)*v11;
            if (!v11) {
              goto LABEL_21;
            }
          }
        }
        do
        {
          unint64_t v13 = v11[1];
          if (v13 == (int)a1)
          {
            if (*((_DWORD *)v11 + 4) == a1) {
              goto LABEL_31;
            }
          }
          else
          {
            if (v13 >= v7) {
              v13 %= v7;
            }
            if (v13 != v9) {
              break;
            }
          }
          unint64_t v11 = (uint64_t *)*v11;
        }
        while (v11);
      }
    }
  }
LABEL_21:
  uint64_t v15 = (std::__shared_weak_count *)operator new(0x48uLL);
  v15->__shared_owners_ = 0;
  v15->__shared_weak_owners_ = 0;
  v15->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DAEF700;
  unint64_t v17 = (void (**)(void **))&unk_26DAEF750;
  uint64_t v18 = (std::__shared_weak_count *)a2;
  uint64_t v19 = a3;
  uint64_t v20 = (void **)&v17;
  sub_226DC95A0(&v15[1], a1, &v17);
  if (v20 == (void **)&v17)
  {
    v17[4]((void **)&v17);
  }
  else if (v20)
  {
    (*((void (**)(void))*v20 + 5))();
  }
  LODWORD(v17) = a1;
  uint64_t v18 = v15 + 1;
  uint64_t v19 = v15;
  atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
  sub_226DC1364(a2 + 96, (int *)&v17, (uint64_t)&v17);
  uint64_t v16 = v19;
  if (v19 && !atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
    std::__shared_weak_count::__release_weak(v16);
  }
  if (v15 && !atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
    std::__shared_weak_count::__release_weak(v15);
  }
LABEL_31:
  std::mutex::unlock(v6);
  atomic_exchange((atomic_uint *volatile)(a2 + 200), a1);
}

void sub_226DBEBB4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v4 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  sub_226DBEC50((uint64_t)va1);
  sub_226DBECCC((uint64_t)va);
  std::mutex::unlock(v2);
  _Unwind_Resume(a1);
}

void sub_226DBEBD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  if (a15 == v17) {
    (*(void (**)(uint64_t *))(a12 + 32))(&a12);
  }
  else {
    sub_226DD24B4(a15);
  }
  std::__shared_weak_count::~__shared_weak_count(v16);
  operator delete(v19);
  std::mutex::unlock(v15);
  _Unwind_Resume(a1);
}

void sub_226DBEC3C(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_226DBEC50(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(std::__shared_weak_count **)(result + 16);
  if (v2)
  {
    if (!atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      return v1;
    }
  }
  return result;
}

uint64_t sub_226DBECCC(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(std::__shared_weak_count **)(result + 8);
  if (v2)
  {
    if (!atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      return v1;
    }
  }
  return result;
}

void sub_226DBED48(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  kdebug_trace();
  uint64_t v2 = dispatch_queue_create("com.apple.cvhwa.xpc.listener", 0);
  int v3 = _os_feature_enabled_impl();
  BOOL v4 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (!v4) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    unint64_t v5 = &_os_log_internal;
    uint64_t v6 = "VisionHWAccelerationServices framework launched via visionhwserverd";
  }
  else
  {
    if (!v4) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    unint64_t v5 = &_os_log_internal;
    uint64_t v6 = "VisionHWAccelerationServices framework launched via mediaserverd";
  }
  _os_log_impl(&dword_226DAE000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
LABEL_7:
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = *(_DWORD *)(a1 + 32);
    *(_DWORD *)buf = 67109120;
    int v30 = v7;
    _os_log_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "VisionHWAServer: At Start: num client: %d ", buf, 8u);
  }
  uint64_t v8 = *(void *)(a1 + 16);
  BOOL v9 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (!v9) {
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    unint64_t v10 = &_os_log_internal;
    unint64_t v11 = "VisionHWAServer: An active Session exists";
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    unint64_t v10 = &_os_log_internal;
    unint64_t v11 = "VisionHWAServer: No active Session created Yet";
  }
  _os_log_impl(&dword_226DAE000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
LABEL_15:
  dispatch_semaphore_t v12 = dispatch_semaphore_create(1);
  mach_service = xpc_connection_create_mach_service("com.apple.cvhwa.xpc", v2, 1uLL);
  dispatch_source_t v14 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v2);
  uint64_t v15 = v14;
  if (v14)
  {
    *(void *)(a1 + 208) = v14;
    dispatch_time_t v16 = dispatch_time(0, 5000000000);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 0x40000000;
    handler[2] = sub_226DBF0C4;
    handler[3] = &unk_2647E6BE8;
    handler[4] = a1;
    handler[5] = v15;
    handler[6] = v16;
    long long v28 = xmmword_226DD3FC0;
    dispatch_source_set_event_handler(v15, handler);
    dispatch_source_set_timer(v15, v16, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
    dispatch_activate(v15);
    atomic_exchange((atomic_uchar *volatile)(a1 + 204), 1u);
  }
  else
  {
    BOOL v17 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v17) {
      sub_226DD24F4(v17, v18, v19, v20, v21, v22, v23, v24);
    }
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 0x40000000;
  v26[2] = sub_226DBF2AC;
  void v26[3] = &unk_2647E6C28;
  v26[4] = a1;
  v26[5] = v15;
  v26[6] = v12;
  xpc_connection_set_event_handler(mach_service, v26);
  char v25 = dispatch_queue_create("com.apple.cvhwa.xpc.msg", 0);
  xpc_connection_set_target_queue(mach_service, v25);
  xpc_connection_resume(mach_service);
  xpc_release(v2);
  xpc_release(v25);
}

void sub_226DBF0B8(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    sub_226DBC39C(a1);
  }
  _Unwind_Resume(a1);
}

void sub_226DBF0C4(uint64_t a1)
{
  uint64_t v2 = (std::mutex *)(*(void *)(a1 + 32) + 280);
  std::mutex::lock(v2);
  if (atomic_exchange((atomic_uchar *volatile)(*(void *)(a1 + 32) + 204), 0))
  {
    dispatch_suspend(*(dispatch_object_t *)(a1 + 40));
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "VisionHWAServer: count down 5s finish!", buf, 2u);
    }
    dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64));
    sub_226DB9B58(*(void *)(a1 + 32));
    uint64_t v3 = *(void *)(a1 + 32);
    if (*(_DWORD *)(v3 + 32))
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)BOOL v9 = 0;
        _os_log_error_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_ERROR, "VisionHWAServer: outstanding client exists!", v9, 2u);
        uint64_t v3 = *(void *)(a1 + 32);
      }
      *(_DWORD *)(v3 + 32) = 0;
    }
    if (*(void *)(v3 + 64))
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_error_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_ERROR, "VisionHWAServer: client map not empty!", v8, 2u);
        uint64_t v3 = *(void *)(a1 + 32);
      }
      for (i = (void *)(v3 + 56); ; sub_226DB8934(*(void *)(a1 + 32), (uint64_t)(i + 3), 1))
      {
        i = (void *)*i;
        if (!i) {
          break;
        }
      }
      uint64_t v5 = *(void *)(a1 + 32);
      if (*(void *)(v5 + 64))
      {
        sub_226DC034C(v5 + 40, *(char **)(v5 + 56));
        *(void *)(v5 + 56) = 0;
        uint64_t v6 = *(void *)(v5 + 48);
        if (v6)
        {
          for (uint64_t j = 0; j != v6; ++j)
            *(void *)(*(void *)(v5 + 40) + 8 * j) = 0;
        }
        *(void *)(v5 + 64) = 0;
      }
    }
  }
  std::mutex::unlock(v2);
}

void sub_226DBF284(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_226DBF298(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_226DBF2AC(uint64_t a1, _xpc_connection_s *a2)
{
  if (MEMORY[0x22A66A260](a2) != MEMORY[0x263EF8720])
  {
    if (MEMORY[0x22A66A260](a2) != MEMORY[0x263EF86F0])
    {
      BOOL v4 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v4) {
        sub_226DD2620(v4, v5, v6, v7, v8, v9, v10, v11);
      }
      return;
    }
LABEL_9:
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 0x40000000;
    v44[2] = sub_226DBF47C;
    v44[3] = &unk_2647E6C08;
    v44[4] = a2;
    long long v45 = *(_OWORD *)(a1 + 32);
    uint64_t v46 = *(void *)(a1 + 48);
    xpc_connection_set_event_handler(a2, v44);
    xpc_connection_resume(a2);
    return;
  }
  BOOL v12 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (!v12)
  {
    if (a2 != (_xpc_connection_s *)MEMORY[0x263EF86A0]) {
      goto LABEL_7;
    }
LABEL_16:
    BOOL v36 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v36) {
      sub_226DD2530(v36, v37, v38, v39, v40, v41, v42, v43);
    }
    return;
  }
  sub_226DD25E4(v12, v13, v14, v15, v16, v17, v18, v19);
  if (a2 == (_xpc_connection_s *)MEMORY[0x263EF86A0]) {
    goto LABEL_16;
  }
LABEL_7:
  if (a2 == (_xpc_connection_s *)MEMORY[0x263EF86C0])
  {
    BOOL v20 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v20) {
      sub_226DD256C(v20, v21, v22, v23, v24, v25, v26, v27);
    }
  }
  else
  {
    if (a2 != (_xpc_connection_s *)MEMORY[0x263EF86A8]) {
      goto LABEL_9;
    }
    BOOL v28 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v28) {
      sub_226DD25A8(v28, v29, v30, v31, v32, v33, v34, v35);
    }
  }
}

void sub_226DBF47C(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (MEMORY[0x22A66A260](a2) == MEMORY[0x263EF8720])
  {
    if (a2 == (void *)MEMORY[0x263EF86A8])
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      LOWORD(v29) = 0;
      uint64_t v9 = &_os_log_internal;
      uint64_t v10 = "VisionHWAServer (connection event handler): XPC_ERROR_CONNECTION_INVALID";
    }
    else if (a2 == (void *)MEMORY[0x263EF86A0])
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      LOWORD(v29) = 0;
      uint64_t v9 = &_os_log_internal;
      uint64_t v10 = "VisionHWAServer (connection event handler): XPC_ERROR_CONNECTION_INTERRUPTED";
    }
    else
    {
      uint64_t v7 = (void *)MEMORY[0x263EF86C0];
      BOOL v8 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
      if (a2 == v7)
      {
        if (!v8) {
          return;
        }
        LOWORD(v29) = 0;
        uint64_t v9 = &_os_log_internal;
        uint64_t v10 = "VisionHWAServer (connection event handler): XPC_ERROR_TERMINENT_IMMINENT";
      }
      else
      {
        if (!v8) {
          return;
        }
        LOWORD(v29) = 0;
        uint64_t v9 = &_os_log_internal;
        uint64_t v10 = "VisionHWAServer (connection event handler): Unknown XPC error";
      }
    }
    _os_log_impl(&dword_226DAE000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v29, 2u);
  }
  else
  {
    uint64_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
    if (pid)
    {
      unsigned int v5 = atomic_load((unsigned int *)(*(void *)(a1 + 40) + 200));
      if (v5 != pid) {
        sub_226DBE8D0(pid, *(void *)(a1 + 40), *(std::__shared_weak_count **)(a1 + 48));
      }
      unsigned int v6 = atomic_load((unsigned int *)(*(void *)(a1 + 40) + 200));
      if (v6 && (atomic_exchange((atomic_uchar *volatile)(*(void *)(a1 + 40) + 204), 0) & 1) != 0)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v29) = 0;
          _os_log_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "VisionHWAServer: count down 5s stop!", (uint8_t *)&v29, 2u);
        }
        dispatch_suspend(*(dispatch_object_t *)(a1 + 48));
      }
      if (a2 == (void *)MEMORY[0x263EF86A8])
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = *(void *)(a1 + 32);
          int v29 = 134217984;
          uint64_t v30 = v19;
          _os_log_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "XPC_ERROR_CONNECTION_INVALID w/ client_connection = %p", (uint8_t *)&v29, 0xCu);
        }
      }
      else if (MEMORY[0x22A66A260](a2) == MEMORY[0x263EF8708] {
             && !dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 56), 0xFFFFFFFFFFFFFFFFLL))
      }
      {
        sub_226DBAE24(*(void *)(a1 + 40), a2);
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
      }
      BOOL v20 = (std::mutex *)(*(void *)(a1 + 40) + 344);
      std::mutex::lock(v20);
      for (i = *(uint64_t **)(*(void *)(a1 + 40) + 136);
            i != *(uint64_t **)(*(void *)(a1 + 40) + 144);
            *(void *)(v22 + 144) = v25)
      {
        while (!sub_226DC9870(*i))
        {
          i += 2;
          if (i == *(uint64_t **)(*(void *)(a1 + 40) + 144)) {
            goto LABEL_40;
          }
        }
        uint64_t v22 = *(void *)(a1 + 40);
        uint64_t v23 = i + 2;
        uint64_t v24 = *(uint64_t **)(v22 + 144);
        if (i + 2 == v24)
        {
          uint64_t v25 = i;
        }
        else
        {
          do
          {
            long long v26 = *(_OWORD *)v23;
            *uint64_t v23 = 0;
            v23[1] = 0;
            uint64_t v27 = (std::__shared_weak_count *)*(v23 - 1);
            *((_OWORD *)v23 - 1) = v26;
            if (v27 && !atomic_fetch_add(&v27->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
              std::__shared_weak_count::__release_weak(v27);
            }
            v23 += 2;
          }
          while (v23 != v24);
          uint64_t v25 = v23 - 2;
          uint64_t v23 = *(uint64_t **)(v22 + 144);
        }
        while (v23 != v25)
        {
          BOOL v28 = (std::__shared_weak_count *)*(v23 - 1);
          if (v28)
          {
            if (!atomic_fetch_add(&v28->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
              std::__shared_weak_count::__release_weak(v28);
            }
          }
          v23 -= 2;
        }
      }
LABEL_40:
      std::mutex::unlock(v20);
    }
    else
    {
      BOOL v11 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v11) {
        sub_226DD265C(v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }
  }
}

void sub_226DBF898(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void VisionHWAccelerationServicesStart()
{
  if (!_os_feature_enabled_impl())
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD663E8, memory_order_acquire) & 1) == 0)
    {
      if (__cxa_guard_acquire(&qword_26AD663E8))
      {
        sub_226DBFEC0((uint64_t)&unk_26AD66228);
        __cxa_atexit((void (*)(void *))sub_226DBFEBC, &unk_26AD66228, &dword_226DAE000);
        __cxa_guard_release(&qword_26AD663E8);
      }
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "**************** VisionHWAServer: **********************************.", v3, 2u);
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
LABEL_9:
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_10;
        }
        goto LABEL_17;
      }
    }
    else if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      goto LABEL_9;
    }
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "VisionHWAServer: VisionHWAccelerationServicesStart is invoked.", v2, 2u);
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
LABEL_10:
      dword_26AD66248 = 0;
      int v0 = (const void **)off_26AD66238;
      off_26AD66238 = 0;
      if (!v0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
LABEL_17:
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "**************** VisionHWAServer: **********************************.", v1, 2u);
    dword_26AD66248 = 0;
    int v0 = (const void **)off_26AD66238;
    off_26AD66238 = 0;
    if (!v0)
    {
LABEL_19:
      sub_226DBED48((uint64_t)&unk_26AD66228);
      return;
    }
LABEL_18:
    sub_226DC7B9C(*v0);
    MEMORY[0x22A669B00](v0, 0x20C4093837F09);
    goto LABEL_19;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "**************** VisionHWAServer: **********************************.", buf, 2u);
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
LABEL_4:
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
LABEL_14:
      *(_WORD *)BOOL v4 = 0;
      _os_log_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "**************** VisionHWAServer: **********************************.", v4, 2u);
      return;
    }
  }
  else if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    goto LABEL_4;
  }
  *(_WORD *)unsigned int v5 = 0;
  _os_log_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "**************** VisionHWAServer has been disabled in mediaserverd", v5, 2u);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_14;
  }
}

void sub_226DBFB98(_Unwind_Exception *a1)
{
}

void VisionHWServerStart()
{
  if (_os_feature_enabled_impl())
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AD663E8, memory_order_acquire) & 1) == 0)
    {
      if (__cxa_guard_acquire(&qword_26AD663E8))
      {
        sub_226DBFEC0((uint64_t)&unk_26AD66228);
        __cxa_atexit((void (*)(void *))sub_226DBFEBC, &unk_26AD66228, &dword_226DAE000);
        __cxa_guard_release(&qword_26AD663E8);
      }
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v6 = 0;
      _os_log_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "**************** VisionHWAServer: **********************************.", v6, 2u);
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
LABEL_5:
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_6;
        }
        goto LABEL_17;
      }
    }
    else if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      goto LABEL_5;
    }
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "VisionHWAServer: VisionHWAccelerationServicesStart is invoked.", v5, 2u);
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
LABEL_6:
      dword_26AD66248 = 0;
      int v0 = (const void **)off_26AD66238;
      off_26AD66238 = 0;
      if (!v0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
LABEL_17:
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "**************** VisionHWAServer: **********************************.", v4, 2u);
    dword_26AD66248 = 0;
    int v0 = (const void **)off_26AD66238;
    off_26AD66238 = 0;
    if (!v0)
    {
LABEL_19:
      sub_226DBED48((uint64_t)&unk_26AD66228);
      return;
    }
LABEL_18:
    sub_226DC7B9C(*v0);
    MEMORY[0x22A669B00](v0, 0x20C4093837F09);
    goto LABEL_19;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "**************** VisionHWAServer: **********************************.", buf, 2u);
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
LABEL_10:
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
LABEL_14:
      *(_WORD *)uint64_t v1 = 0;
      _os_log_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "**************** VisionHWAServer: **********************************.", v1, 2u);
      return;
    }
  }
  else if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    goto LABEL_10;
  }
  *(_WORD *)uint64_t v2 = 0;
  _os_log_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "**************** VisionHWAServer has been disabled in visionserverd", v2, 2u);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_14;
  }
}

void sub_226DBFEA0(_Unwind_Exception *a1)
{
}

uint64_t sub_226DBFEC0(uint64_t a1)
{
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 0;
  *(_DWORD *)(a1 + 72) = 1065353216;
  *(void *)(a1 + 80) = 1;
  *(unsigned char *)(a1 + 88) = 0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_DWORD *)(a1 + 128) = 1065353216;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 168) = 0u;
  *(void *)(a1 + 184) = 0;
  *(_DWORD *)(a1 + 192) = 1065353216;
  *(_DWORD *)(a1 + 200) = 0;
  *(unsigned char *)(a1 + 204) = 1;
  *(void *)(a1 + 208) = 0;
  *(void *)(a1 + 216) = 850045863;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(void *)(a1 + 272) = 0;
  *(void *)(a1 + 280) = 850045863;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 320) = 0u;
  *(void *)(a1 + 336) = 0;
  *(void *)(a1 + 344) = 850045863;
  *(_OWORD *)(a1 + 352) = 0u;
  *(_OWORD *)(a1 + 368) = 0u;
  *(_OWORD *)(a1 + 384) = 0u;
  *(void *)(a1 + 400) = 0;
  *(unsigned char *)(a1 + 408) = 1;
  *(void *)(a1 + 440) = 0;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "VisionHWAServer: Constructor invoked\n", v3, 2u);
  }
  sub_226DBBA7C();
  return a1;
}

void sub_226DBFFF8(_Unwind_Exception *a1)
{
  sub_226DC005C((void *)(v1 + 416));
  std::mutex::~mutex(v7);
  std::mutex::~mutex(v6);
  std::mutex::~mutex(v5);
  sub_226DC00EC(v1 + 160);
  sub_226DC0158(v4);
  sub_226DC020C(v3);
  sub_226DC02BC(v2);
  sub_226DC02F8((const void ***)(v1 + 16));
  sub_226DBECCC(v1);
  _Unwind_Resume(a1);
}

void *sub_226DC005C(void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
    return a1;
  }
  else
  {
    if (v2) {
      (*(void (**)(void *))(*v2 + 40))(v2);
    }
    return a1;
  }
}

uint64_t sub_226DC00EC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      unsigned int v5 = (void *)*v2;
      unsigned int v6 = (void *)v2[3];
      if (v6)
      {
        v2[4] = v6;
        operator delete(v6);
      }
      operator delete(v2);
      uint64_t v2 = v5;
    }
    while (v5);
  }
  uint64_t v3 = *(void **)a1;
  *(void *)a1 = 0;
  if (v3) {
    operator delete(v3);
  }
  return a1;
}

void **sub_226DC0158(void **a1)
{
  uint64_t v2 = (char *)*a1;
  if (*a1)
  {
    uint64_t v3 = (char *)a1[1];
    BOOL v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        unsigned int v5 = (std::__shared_weak_count *)*((void *)v3 - 1);
        if (v5 && !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
          std::__shared_weak_count::__release_weak(v5);
        }
        v3 -= 16;
      }
      while (v3 != v2);
      BOOL v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

uint64_t sub_226DC020C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  while (v2)
  {
    uint64_t v3 = v2;
    uint64_t v2 = (void *)*v2;
    BOOL v4 = (std::__shared_weak_count *)v3[4];
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    operator delete(v3);
  }
  unsigned int v5 = *(void **)a1;
  *(void *)a1 = 0;
  if (v5) {
    operator delete(v5);
  }
  return a1;
}

uint64_t sub_226DC02BC(uint64_t a1)
{
  sub_226DC034C(a1, *(char **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

const void ***sub_226DC02F8(const void ***a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    sub_226DC7B9C(*v2);
    MEMORY[0x22A669B00](v2, 0x20C4093837F09);
  }
  return a1;
}

void sub_226DC034C(int a1, char *__p)
{
  if (__p)
  {
    uint64_t v2 = __p;
    do
    {
      uint64_t v3 = *(char **)v2;
      uint64_t v4 = *((void *)v2 + 19);
      *((void *)v2 + 19) = 0;
      if (v4) {
        (*(void (**)(uint64_t))(*(void *)v4 + 72))(v4);
      }
      if (v2[144]
        && (unsigned int v5 = (std::__shared_weak_count *)*((void *)v2 + 17)) != 0
        && !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
        if ((v2[127] & 0x80000000) == 0)
        {
LABEL_10:
          unsigned int v6 = (void *)*((void *)v2 + 10);
          if (!v6) {
            goto LABEL_3;
          }
LABEL_14:
          *((void *)v2 + 11) = v6;
          operator delete(v6);
          goto LABEL_3;
        }
      }
      else if ((v2[127] & 0x80000000) == 0)
      {
        goto LABEL_10;
      }
      operator delete(*((void **)v2 + 13));
      unsigned int v6 = (void *)*((void *)v2 + 10);
      if (v6) {
        goto LABEL_14;
      }
LABEL_3:
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

uint64_t sub_226DC044C(uint64_t a1)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "VisionHWAServer: Destructor invoked\n", buf, 2u);
  }
  if (*(void *)(a1 + 64))
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      sub_226DD2698(v2, v3, v4, v5, v6, v7, v8, v9);
    }
    for (i = (void *)(a1 + 56); ; sub_226DB8934(a1, (uint64_t)(i + 3), 1))
    {
      i = (void *)*i;
      if (!i) {
        break;
      }
    }
    if (*(void *)(a1 + 64))
    {
      sub_226DC034C(a1 + 40, *(char **)(a1 + 56));
      *(void *)(a1 + 56) = 0;
      uint64_t v11 = *(void *)(a1 + 48);
      if (v11)
      {
        for (uint64_t j = 0; j != v11; ++j)
          *(void *)(*(void *)(a1 + 40) + 8 * j) = 0;
      }
      *(void *)(a1 + 64) = 0;
    }
  }
  uint64_t v13 = *(const void ***)(a1 + 16);
  if (v13)
  {
    *(void *)(a1 + 16) = 0;
    sub_226DC7B9C(*v13);
    MEMORY[0x22A669B00](v13, 0x20C4093837F09);
  }
  if (*(void *)a1
    && (uint64_t v14 = *(std::__shared_weak_count **)(a1 + 8), *(void *)a1 = 0, *(void *)(a1 + 8) = 0, v14)
    && !atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
    std::__shared_weak_count::__release_weak(v14);
    uint64_t v15 = *(void **)(a1 + 24);
    if (!v15) {
      goto LABEL_23;
    }
  }
  else
  {
    uint64_t v15 = *(void **)(a1 + 24);
    if (!v15) {
      goto LABEL_23;
    }
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v33 = 0;
    _os_log_error_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Releasing os_transaction inside DTOR -- visionhwserverd is TERMINATING", v33, 2u);
    uint64_t v15 = *(void **)(a1 + 24);
  }
  os_release(v15);
LABEL_23:
  uint64_t v16 = *(void *)(a1 + 440);
  if (v16 == a1 + 416)
  {
    (*(void (**)(uint64_t))(*(void *)(a1 + 416) + 32))(a1 + 416);
  }
  else if (v16)
  {
    (*(void (**)(uint64_t))(*(void *)v16 + 40))(v16);
  }
  std::mutex::~mutex((std::mutex *)(a1 + 344));
  std::mutex::~mutex((std::mutex *)(a1 + 280));
  std::mutex::~mutex((std::mutex *)(a1 + 216));
  uint64_t v17 = *(void **)(a1 + 176);
  if (v17)
  {
    do
    {
      uint64_t v22 = (void *)*v17;
      uint64_t v23 = (void *)v17[3];
      if (v23)
      {
        v17[4] = v23;
        operator delete(v23);
      }
      operator delete(v17);
      uint64_t v17 = v22;
    }
    while (v22);
  }
  uint64_t v18 = *(void **)(a1 + 160);
  *(void *)(a1 + 160) = 0;
  if (v18) {
    operator delete(v18);
  }
  uint64_t v19 = *(void *)(a1 + 136);
  if (v19)
  {
    uint64_t v20 = *(void *)(a1 + 144);
    uint64_t v21 = *(void **)(a1 + 136);
    if (v20 != v19)
    {
      do
      {
        uint64_t v24 = *(std::__shared_weak_count **)(v20 - 8);
        if (v24 && !atomic_fetch_add(&v24->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
          std::__shared_weak_count::__release_weak(v24);
        }
        v20 -= 16;
      }
      while (v20 != v19);
      uint64_t v21 = *(void **)(a1 + 136);
    }
    *(void *)(a1 + 144) = v19;
    operator delete(v21);
  }
  uint64_t v25 = *(void **)(a1 + 112);
  while (v25)
  {
    long long v26 = v25;
    uint64_t v25 = (void *)*v25;
    uint64_t v27 = (std::__shared_weak_count *)v26[4];
    if (v27 && !atomic_fetch_add(&v27->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
    operator delete(v26);
  }
  BOOL v28 = *(void **)(a1 + 96);
  *(void *)(a1 + 96) = 0;
  if (v28) {
    operator delete(v28);
  }
  sub_226DC034C(a1 + 40, *(char **)(a1 + 56));
  int v29 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = 0;
  if (v29) {
    operator delete(v29);
  }
  uint64_t v30 = *(const void ***)(a1 + 16);
  *(void *)(a1 + 16) = 0;
  if (v30)
  {
    sub_226DC7B9C(*v30);
    MEMORY[0x22A669B00](v30, 0x20C4093837F09);
  }
  uint64_t v31 = *(std::__shared_weak_count **)(a1 + 8);
  if (v31 && !atomic_fetch_add(&v31->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
    std::__shared_weak_count::__release_weak(v31);
  }
  return a1;
}

void sub_226DC0888(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DAEF700;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_226DC08A8(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DAEF700;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x22A669B00);
}

uint64_t sub_226DC08FC(uint64_t a1)
{
  return sub_226DC96B0(a1 + 24);
}

void sub_226DC090C()
{
}

__n128 sub_226DC0920(uint64_t a1)
{
  BOOL v2 = (char *)operator new(0x18uLL);
  *(void *)BOOL v2 = &unk_26DAEF750;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_226DC096C(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26DAEF750;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void sub_226DC099C(uint64_t a1, int *a2, unsigned __int8 *a3)
{
  int v4 = *a3;
  int v47 = *a2;
  atomic_exchange((atomic_uint *volatile)(*(void *)(a1 + 8) + 200), 0);
  uint64_t v5 = *(void **)(a1 + 8);
  unint64_t v6 = v5[21];
  if (!v6) {
    goto LABEL_45;
  }
  uint8x8_t v7 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v7.i16[0] = vaddlv_u8(v7);
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v8 = v47;
    if (v6 <= v47) {
      unint64_t v8 = v47 % v6;
    }
  }
  else
  {
    unint64_t v8 = (v6 - 1) & v47;
  }
  uint64_t v9 = *(uint64_t ***)(v5[20] + 8 * v8);
  if (!v9) {
    goto LABEL_45;
  }
  uint64_t v10 = *v9;
  if (!v10) {
    goto LABEL_45;
  }
  if (v7.u32[0] < 2uLL)
  {
    unint64_t v11 = v6 - 1;
    while (1)
    {
      uint64_t v13 = v10[1];
      if (v13 == v47)
      {
        if (*((_DWORD *)v10 + 4) == v47) {
          goto LABEL_22;
        }
      }
      else if ((v13 & v11) != v8)
      {
        goto LABEL_45;
      }
      uint64_t v10 = (uint64_t *)*v10;
      if (!v10) {
        goto LABEL_45;
      }
    }
  }
  while (1)
  {
    unint64_t v12 = v10[1];
    if (v12 == v47) {
      break;
    }
    if (v12 >= v6) {
      v12 %= v6;
    }
    if (v12 != v8) {
      goto LABEL_45;
    }
LABEL_11:
    uint64_t v10 = (uint64_t *)*v10;
    if (!v10) {
      goto LABEL_45;
    }
  }
  if (*((_DWORD *)v10 + 4) != v47) {
    goto LABEL_11;
  }
LABEL_22:
  uint64_t v44 = 0;
  long long v45 = 0;
  uint64_t v46 = 0;
  uint64_t v15 = (unsigned char *)v10[3];
  uint64_t v14 = (unsigned char *)v10[4];
  int64_t v16 = v14 - v15;
  if (v14 == v15)
  {
    uint64_t v17 = 0;
    uint64_t v18 = (void *)v5[7];
    if (!v18) {
      goto LABEL_42;
    }
  }
  else
  {
    if (v16 < 0) {
      sub_226DB87BC();
    }
    uint64_t v17 = (char *)operator new(v14 - v15);
    uint64_t v44 = v17;
    uint64_t v46 = &v17[8 * (v16 >> 3)];
    memcpy(v17, v15, v16);
    long long v45 = v46;
    uint64_t v18 = (void *)v5[7];
    if (!v18) {
      goto LABEL_42;
    }
  }
  uint64_t v19 = &_os_log_internal;
  do
  {
    uint64_t v21 = v18 + 3;
    uint64_t v22 = v44;
    if (v44 != v45)
    {
      while (*(void *)v22 != *v21)
      {
        v22 += 8;
        if (v22 == v45)
        {
          uint64_t v22 = v45;
          break;
        }
      }
    }
    if (v22 == v45)
    {
      uint64_t v20 = (void *)*v18;
    }
    else
    {
      sub_226DB8934(*(void *)(a1 + 8), (uint64_t)v21, 1);
      uint64_t v20 = (void *)*v18;
      sub_226DBD6EC((void *)(*(void *)(a1 + 8) + 40), v18, (uint64_t)buf);
      uint64_t v23 = *(char **)buf;
      *(void *)buf = 0;
      if (v23) {
        sub_226DBD4A8((uint64_t)&v49, v23);
      }
      uint64_t v24 = *(void *)(a1 + 8);
      int v25 = *(_DWORD *)(v24 + 32);
      if (v25)
      {
        *(_DWORD *)(v24 + 32) = v25 - 1;
      }
      else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        sub_226DD26D4(&v42, v43);
      }
    }
    uint64_t v18 = v20;
  }
  while (v20);
  uint64_t v17 = v44;
LABEL_42:
  if (v17)
  {
    long long v45 = v17;
    operator delete(v17);
  }
  uint64_t v5 = *(void **)(a1 + 8);
LABEL_45:
  sub_226DC0EC0(v5 + 20, &v47);
  if (v4)
  {
    long long v26 = (std::mutex *)(*(void *)(a1 + 8) + 344);
    std::mutex::lock(v26);
    uint64_t v27 = *(void *)(a1 + 8);
    unint64_t v28 = *(void *)(v27 + 104);
    if (v28)
    {
      uint8x8_t v29 = (uint8x8_t)vcnt_s8((int8x8_t)v28);
      v29.i16[0] = vaddlv_u8(v29);
      if (v29.u32[0] > 1uLL)
      {
        unint64_t v30 = v47;
        if (v28 <= v47) {
          unint64_t v30 = v47 % v28;
        }
      }
      else
      {
        unint64_t v30 = (v28 - 1) & v47;
      }
      uint64_t v31 = *(uint64_t ***)(*(void *)(v27 + 96) + 8 * v30);
      if (v31)
      {
        uint64_t v32 = *v31;
        if (v32)
        {
          if (v29.u32[0] < 2uLL)
          {
            unint64_t v33 = v28 - 1;
            while (1)
            {
              uint64_t v35 = v32[1];
              if (v35 == v47)
              {
                if (*((_DWORD *)v32 + 4) == v47) {
                  goto LABEL_67;
                }
              }
              else if ((v35 & v33) != v30)
              {
                goto LABEL_71;
              }
              uint64_t v32 = (uint64_t *)*v32;
              if (!v32) {
                goto LABEL_71;
              }
            }
          }
          do
          {
            unint64_t v34 = v32[1];
            if (v34 == v47)
            {
              if (*((_DWORD *)v32 + 4) == v47)
              {
LABEL_67:
                BOOL v36 = v32 + 3;
                uint64_t v37 = *(_OWORD **)(v27 + 144);
                if ((unint64_t)v37 >= *(void *)(v27 + 152))
                {
                  uint64_t v38 = sub_226DC1000((char **)(v27 + 136), (uint64_t)v36);
                }
                else
                {
                  *uint64_t v37 = *v36;
                  uint64_t v38 = (char *)(v37 + 1);
                  *(void *)BOOL v36 = 0;
                  v32[4] = 0;
                }
                *(void *)(v27 + 144) = v38;
                sub_226DC115C((void *)(*(void *)(a1 + 8) + 96), &v47);
                break;
              }
            }
            else
            {
              if (v34 >= v28) {
                v34 %= v28;
              }
              if (v34 != v30) {
                break;
              }
            }
            uint64_t v32 = (uint64_t *)*v32;
          }
          while (v32);
        }
      }
    }
LABEL_71:
    std::mutex::unlock(v26);
  }
  uint64_t v39 = *(void *)(a1 + 8);
  if (!*(_DWORD *)(v39 + 32))
  {
    uint64_t v40 = (std::mutex *)(v39 + 280);
    std::mutex::lock((std::mutex *)(v39 + 280));
    if ((atomic_exchange((atomic_uchar *volatile)(*(void *)(a1 + 8) + 204), 1u) & 1) == 0)
    {
      dispatch_time_t v41 = dispatch_time(0, 5000000000);
      dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 16), v41, 0x12A05F200uLL, 0x9502F900uLL);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "VisionHWAServer: count down 5s start!", buf, 2u);
      }
      dispatch_resume(*(dispatch_object_t *)(a1 + 16));
    }
    std::mutex::unlock(v40);
  }
}

void sub_226DC0E04(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_226DC0E18(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_226DC0E44(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "Z43VisionHWAccelerationServicesSetupAppMonitoriR23VisionHWAClientServicesP17dispatch_source_sE3$_0") {
    return a1 + 8;
  }
  if (((v3 & (unint64_t)"Z43VisionHWAccelerationServicesSetupAppMonitoriR23VisionHWAClientServicesP17dispatch_source_sE3$_0" & 0x8000000000000000) != 0) == __OFSUB__(v3, "Z43VisionHWAccelerationServicesSetupAppMonitoriR23VisionHWAClientServicesP17dispatch_source_sE3$_0"))return 0; {
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"Z43VisionHWAccelerationServicesSetupAppMonitoriR23VisionHWAClientServicesP17dispatch_source_sE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8;
  }
  return 0;
}

void *sub_226DC0EB4()
{
  return &unk_26DAEF7C0;
}

uint64_t sub_226DC0EC0(void *a1, int *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (*(void *)&v2 <= v3) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v2 - 1) & v3;
  }
  unint64_t v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  uint8x8_t v7 = *v6;
  if (!*v6) {
    return 0;
  }
  if (v4.u32[0] < 2uLL)
  {
    uint64_t v8 = *(void *)&v2 - 1;
    while (1)
    {
      uint64_t v10 = v7[1];
      if (v10 == v3)
      {
        if (*((_DWORD *)v7 + 4) == v3) {
          goto LABEL_22;
        }
      }
      else if ((v10 & v8) != v5)
      {
        return 0;
      }
      uint8x8_t v7 = (uint64_t *)*v7;
      if (!v7) {
        return 0;
      }
    }
  }
  while (1)
  {
    unint64_t v9 = v7[1];
    if (v9 == v3) {
      break;
    }
    if (v9 >= *(void *)&v2) {
      v9 %= *(void *)&v2;
    }
    if (v9 != v5) {
      return 0;
    }
LABEL_11:
    uint8x8_t v7 = (uint64_t *)*v7;
    if (!v7) {
      return 0;
    }
  }
  if (*((_DWORD *)v7 + 4) != v3) {
    goto LABEL_11;
  }
LABEL_22:
  sub_226DBD6EC(a1, v7, (uint64_t)&__p);
  unint64_t v12 = __p;
  __p = 0;
  if (v12)
  {
    if (v15)
    {
      uint64_t v13 = (void *)v12[3];
      if (v13)
      {
        v12[4] = v13;
        operator delete(v13);
      }
    }
    operator delete(v12);
  }
  return 1;
}

char *sub_226DC1000(char **a1, uint64_t a2)
{
  uint64_t v3 = (a1[1] - *a1) >> 4;
  unint64_t v4 = v3 + 1;
  if ((unint64_t)(v3 + 1) >> 60) {
    sub_226DB87BC();
  }
  uint64_t v5 = a1[2] - *a1;
  if (v5 >> 3 > v4) {
    unint64_t v4 = v5 >> 3;
  }
  BOOL v6 = (unint64_t)v5 >= 0x7FFFFFFFFFFFFFF0;
  unint64_t v7 = 0xFFFFFFFFFFFFFFFLL;
  if (!v6) {
    unint64_t v7 = v4;
  }
  if (v7 >> 60) {
    sub_226DB8864();
  }
  uint64_t v9 = 16 * v7;
  uint64_t v10 = (char *)operator new(16 * v7);
  unint64_t v11 = &v10[16 * v3];
  *(_OWORD *)unint64_t v11 = *(_OWORD *)a2;
  unint64_t v12 = v11 + 16;
  uint64_t v13 = &v10[v9];
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  uint64_t v14 = *a1;
  char v15 = a1[1];
  if (v15 == *a1)
  {
    *a1 = v11;
    a1[1] = v12;
    a1[2] = v13;
    if (!v15) {
      return v12;
    }
    goto LABEL_17;
  }
  do
  {
    long long v16 = *((_OWORD *)v15 - 1);
    v15 -= 16;
    *((_OWORD *)v11 - 1) = v16;
    v11 -= 16;
    *(void *)char v15 = 0;
    *((void *)v15 + 1) = 0;
  }
  while (v15 != v14);
  uint64_t v17 = *a1;
  char v15 = a1[1];
  *a1 = v11;
  a1[1] = v12;
  a1[2] = v13;
  if (v15 != v17)
  {
    do
    {
      uint64_t v18 = (std::__shared_weak_count *)*((void *)v15 - 1);
      if (v18 && !atomic_fetch_add(&v18->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
      v15 -= 16;
    }
    while (v15 != v17);
    char v15 = v17;
  }
  if (v15) {
LABEL_17:
  }
    operator delete(v15);
  return v12;
}

uint64_t sub_226DC115C(void *a1, int *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (*(void *)&v2 <= v3) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v2 - 1) & v3;
  }
  BOOL v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  unint64_t v7 = *v6;
  if (!*v6) {
    return 0;
  }
  if (v4.u32[0] < 2uLL)
  {
    uint64_t v8 = *(void *)&v2 - 1;
    while (1)
    {
      uint64_t v10 = v7[1];
      if (v10 == v3)
      {
        if (*((_DWORD *)v7 + 4) == v3) {
          goto LABEL_22;
        }
      }
      else if ((v10 & v8) != v5)
      {
        return 0;
      }
      unint64_t v7 = (uint64_t *)*v7;
      if (!v7) {
        return 0;
      }
    }
  }
  while (1)
  {
    unint64_t v9 = v7[1];
    if (v9 == v3) {
      break;
    }
    if (v9 >= *(void *)&v2) {
      v9 %= *(void *)&v2;
    }
    if (v9 != v5) {
      return 0;
    }
LABEL_11:
    unint64_t v7 = (uint64_t *)*v7;
    if (!v7) {
      return 0;
    }
  }
  if (*((_DWORD *)v7 + 4) != v3) {
    goto LABEL_11;
  }
LABEL_22:
  sub_226DBD6EC(a1, v7, (uint64_t)&__p);
  unint64_t v12 = __p;
  __p = 0;
  if (v12)
  {
    if (v15)
    {
      uint64_t v13 = (std::__shared_weak_count *)v12[4];
      if (v13)
      {
        if (!atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
          std::__shared_weak_count::__release_weak(v13);
        }
      }
    }
    operator delete(v12);
  }
  return 1;
}

uint64_t sub_226DC12D4(uint64_t a1)
{
  int8x8_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16))
    {
      unint64_t v3 = (std::__shared_weak_count *)v2[4];
      if (v3)
      {
        if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
          std::__shared_weak_count::__release_weak(v3);
        }
      }
    }
    operator delete(v2);
  }
  return a1;
}

void *sub_226DC1364(uint64_t a1, int *a2, uint64_t a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    unint64_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      uint64_t v10 = *v9;
      if (*v9)
      {
        if (v8.u32[0] < 2uLL)
        {
          while (1)
          {
            uint64_t v12 = v10[1];
            if (v12 == v6)
            {
              if (*((_DWORD *)v10 + 4) == v6) {
                return v10;
              }
            }
            else if ((v12 & (v7 - 1)) != v3)
            {
              goto LABEL_23;
            }
            uint64_t v10 = (void *)*v10;
            if (!v10) {
              goto LABEL_23;
            }
          }
        }
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == v6)
          {
            if (*((_DWORD *)v10 + 4) == v6) {
              return v10;
            }
          }
          else
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
            if (v11 != v3) {
              break;
            }
          }
          uint64_t v10 = (void *)*v10;
        }
        while (v10);
      }
    }
  }
LABEL_23:
  uint64_t v13 = (void *)(a1 + 16);
  uint64_t v10 = operator new(0x28uLL);
  *uint64_t v10 = 0;
  v10[1] = v6;
  *((_DWORD *)v10 + 4) = *(_DWORD *)a3;
  uint64_t v14 = *(void *)(a3 + 16);
  v10[3] = *(void *)(a3 + 8);
  v10[4] = v14;
  if (v14) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v14 + 8), 1uLL, memory_order_relaxed);
  }
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (v7 && (float)(v16 * (float)v7) >= v15)
  {
    uint64_t v17 = *(void *)a1;
    uint64_t v18 = *(void **)(*(void *)a1 + 8 * v3);
    if (v18)
    {
LABEL_28:
      *uint64_t v10 = *v18;
LABEL_63:
      *uint64_t v18 = v10;
      goto LABEL_64;
    }
  }
  else
  {
    BOOL v19 = 1;
    if (v7 >= 3) {
      BOOL v19 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v7);
    unint64_t v21 = vcvtps_u32_f32(v15 / v16);
    if (v20 <= v21) {
      size_t prime = v21;
    }
    else {
      size_t prime = v20;
    }
    if (prime == 1)
    {
      size_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      size_t prime = std::__next_prime(prime);
    }
    int8x8_t v23 = *(int8x8_t *)(a1 + 8);
    if (prime > *(void *)&v23) {
      goto LABEL_39;
    }
    if (prime < *(void *)&v23)
    {
      unint64_t v24 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (*(void *)&v23 < 3uLL || (uint8x8_t v25 = (uint8x8_t)vcnt_s8(v23), v25.i16[0] = vaddlv_u8(v25), v25.u32[0] > 1uLL))
      {
        unint64_t v24 = std::__next_prime(v24);
      }
      else
      {
        uint64_t v26 = 1 << -(char)__clz(v24 - 1);
        if (v24 >= 2) {
          unint64_t v24 = v26;
        }
      }
      if (prime <= v24) {
        size_t prime = v24;
      }
      if (prime < *(void *)&v23) {
LABEL_39:
      }
        sub_226DBCFB0(a1, prime);
    }
    unint64_t v7 = *(void *)(a1 + 8);
    unint64_t v27 = v7 - 1;
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6)
      {
        unint64_t v3 = v6 % v7;
        uint64_t v17 = *(void *)a1;
        uint64_t v18 = *(void **)(*(void *)a1 + 8 * (v6 % v7));
        if (v18) {
          goto LABEL_28;
        }
      }
      else
      {
        unint64_t v3 = v6;
        uint64_t v17 = *(void *)a1;
        uint64_t v18 = *(void **)(*(void *)a1 + 8 * v6);
        if (v18) {
          goto LABEL_28;
        }
      }
    }
    else
    {
      unint64_t v3 = v27 & v6;
      uint64_t v17 = *(void *)a1;
      uint64_t v18 = *(void **)(*(void *)a1 + 8 * (v27 & v6));
      if (v18) {
        goto LABEL_28;
      }
    }
  }
  *uint64_t v10 = *v13;
  *uint64_t v13 = v10;
  *(void *)(v17 + 8 * v3) = v13;
  if (*v10)
  {
    unint64_t v28 = *(void *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v28 >= v7) {
        v28 %= v7;
      }
    }
    else
    {
      v28 &= v7 - 1;
    }
    uint64_t v18 = (void *)(*(void *)a1 + 8 * v28);
    goto LABEL_63;
  }
LABEL_64:
  ++*(void *)(a1 + 24);
  return v10;
}

void sub_226DC1694(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_226DC12D4((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_226DC16A8(uint64_t a1@<X8>)
{
  int8x8_t v2 = (std::__shared_weak_count *)operator new(0x50uLL);
  v2->__shared_owners_ = 0;
  p_shared_owners = &v2->__shared_owners_;
  v2->__shared_weak_owners_ = 0;
  v2[1].std::__shared_count = 0u;
  v2->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DAEF818;
  *(_OWORD *)&v2[1].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v2[2].__shared_owners_ = 0u;
  v2[3].__vftable = 0;
  v8[1] = v2 + 1;
  v8[2] = v2;
  sub_226DC18A8((uint64_t)&v2[1], v8);
  if (!v8[0])
  {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
    *(void *)a1 = v2 + 1;
    *(void *)(a1 + 8) = v2;
    *(unsigned char *)(a1 + 16) = 1;
    if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
      return;
    }
LABEL_9:
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    return;
  }
  uint64_t v7 = v8[0];
  v8[0] = 0;
  uint8x8_t v4 = sub_226DD1254();
  __int16 v6 = 257;
  sub_226DCB280(&v7, (uint64_t)v4, v5);
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
  *(unsigned char *)a1 = 0;
  *(unsigned char *)(a1 + 16) = 0;
  if (v8[0]) {
    (*(void (**)(void))(*(void *)v8[0] + 8))(v8[0]);
  }
  if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
    goto LABEL_9;
  }
}

void sub_226DC1848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  sub_226DBECCC((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_226DC185C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  if (a8) {
    sub_226DD2718();
  }
  if (a9) {
    (*(void (**)(uint64_t))(*(void *)a9 + 8))(a9);
  }
  sub_226DBECCC((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_226DC18A8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 24))
  {
    unint64_t v11 = "only one call to .open() supported";
    __int16 v12 = 259;
    operator new();
  }
  __int16 v12 = 260;
  unint64_t v11 = (const char *)MEMORY[0x22A6698C0]();
  sub_226DCCD54((unsigned __int8 *)&v11, 1, 0, 0, (uint64_t)&v15);
  if (v16)
  {
    uint64_t result = sub_226DCB674(v15, a2);
  }
  else
  {
    uint64_t v4 = v15;
    uint64_t v15 = 0;
    uint64_t v5 = *(void *)(a1 + 24);
    *(void *)(a1 + 24) = v4;
    if (v5)
    {
      (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
      uint64_t v4 = *(void *)(a1 + 24);
    }
    uint64_t v6 = *(void *)(v4 + 8);
    unint64_t v7 = *(void *)(v4 + 16) - v6;
    if (v7 < 0x10 || (*(unsigned char *)(v6 + 4) == 1 ? (BOOL v8 = *(unsigned char *)(v6 + 5) == 1) : (BOOL v8 = 0), !v8)) {
      operator new();
    }
    uint64_t result = sub_226DC2CF8(v6, v7, (uint64_t)&v13);
    if (v14)
    {
      *a2 = v13;
    }
    else
    {
      int v10 = *(unsigned __int8 *)(a1 + 48);
      *(_OWORD *)(a1 + 32) = v13;
      if (!v10) {
        *(unsigned char *)(a1 + 48) = 1;
      }
      if (**(_DWORD **)(a1 + 32) != 1179403647) {
        operator new();
      }
      *a2 = 0;
    }
  }
  if ((v16 & 1) == 0)
  {
    uint64_t result = v15;
    uint64_t v15 = 0;
    if (result) {
      return (*(uint64_t (**)(uint64_t))(*(void *)result + 8))(result);
    }
  }
  return result;
}

void sub_226DC1C0C(_Unwind_Exception *a1)
{
  MEMORY[0x22A669B00](v1, 0x10F3C401C2224D9);
  if (*(unsigned char *)(v2 - 56))
  {
    uint64_t v4 = *(void *)(v2 - 72);
    *(void *)(v2 - 72) = 0;
    if (v4) {
      (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
    }
  }
  if ((*(unsigned char *)(v2 - 32) & 1) == 0)
  {
    uint64_t v5 = *(void *)(v2 - 48);
    *(void *)(v2 - 48) = 0;
    if (v5)
    {
      (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
      _Unwind_Resume(a1);
    }
  }
  _Unwind_Resume(a1);
}

BOOL sub_226DC1D20(const void ***a1, uint64_t a2)
{
  sub_226DC1DF8(*a1, a2, &v8);
  uint64_t v2 = v8;
  if (v8)
  {
    uint64_t v7 = v8;
    uint64_t v8 = 0;
    unint64_t v3 = sub_226DD1254();
    __int16 v6 = 257;
    sub_226DCB280(&v7, (uint64_t)v3, v5);
    if (v7) {
      (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
    }
    if (v8) {
      (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
    }
  }
  return v2 == 0;
}

void sub_226DC1DD8(_Unwind_Exception *a1)
{
  if (*(void *)(v1 - 32)) {
    sub_226DD2718();
  }
  sub_226DD274C((uint64_t *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_226DC1DF8(const void **a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  if (!*((unsigned char *)a1 + 48))
  {
    __dst = (void **)"call .open() before trying to .load()";
    __int16 v70 = 259;
    operator new();
  }
  __int16 v6 = a1 + 4;
  (**(void (***)(uint64_t))a2)(a2);
  sub_226DC2E24(v6, (uint64_t)&v80);
  if (v82)
  {
    int v46 = 0;
    uint64_t v47 = v80;
    uint64_t v80 = 0;
    *a3 = v47;
    if (v82) {
      goto LABEL_108;
    }
    goto LABEL_110;
  }
  if (!v81)
  {
LABEL_100:
    int v46 = 1;
    if (v82) {
      goto LABEL_108;
    }
    goto LABEL_110;
  }
  uint64_t v7 = v80;
  uint64_t v8 = v80 + 40 * v81;
  uint64_t v61 = a3;
  uint64_t v62 = v8;
  while (1)
  {
    __dst = (void **)sub_226DC3210;
    sub_226DC3020(v6, (unsigned int *)v7, (void (*)(uint64_t *__return_ptr, uint64_t, void ***))sub_226DC5538, (uint64_t)&__dst, (uint64_t)&__src);
    if (v79)
    {
      uint64_t v48 = __src;
      __src = 0;
      goto LABEL_103;
    }
    if ((*(unsigned char *)(v7 + 8) & 2) != 0) {
      break;
    }
LABEL_94:
    if (v79)
    {
      long long v45 = __src;
      __src = 0;
      if (v45) {
        (*(void (**)(void *))(*(void *)v45 + 8))(v45);
      }
    }
    v7 += 40;
    if (v7 == v8) {
      goto LABEL_100;
    }
  }
  int v9 = *(_DWORD *)(v7 + 4);
  if (v9 == 8)
  {
    int v10 = __src;
    if (!__src)
    {
      __dst = 0;
      size_t v67 = 0;
      p_dst = &__dst;
      int64_t v68 = 0;
LABEL_23:
      char v16 = (*(uint64_t (**)(uint64_t, void ***, void, void))(*(void *)a2 + 24))(a2, p_dst, *(unsigned int *)(v7 + 12), *(unsigned int *)(v7 + 20));
      if (SHIBYTE(v68) < 0) {
        operator delete(__dst);
      }
      if ((v16 & 1) == 0)
      {
        int v54 = *((char *)a1 + 23);
        if (v54 >= 0) {
          size_t v55 = *((unsigned __int8 *)a1 + 23);
        }
        else {
          size_t v55 = (size_t)a1[1];
        }
        unint64_t v56 = v55 + 24;
        if (v55 + 24 > 0x7FFFFFFFFFFFFFF7) {
          sub_226DBC384();
        }
        if (v56 <= 0x16)
        {
          size_t v75 = 0;
          unint64_t v76 = 0;
          v74 = 0;
          unint64_t v57 = &v74;
          HIBYTE(v76) = v55 + 24;
          goto LABEL_129;
        }
        uint64_t v58 = (v56 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v56 | 7) != 0x17) {
          uint64_t v58 = v56 | 7;
        }
        uint64_t v59 = v58 + 1;
        unint64_t v57 = operator new(v58 + 1);
        size_t v75 = v55 + 24;
        unint64_t v76 = v59 | 0x8000000000000000;
        v74 = v57;
        if (v55)
        {
LABEL_129:
          if (v54 >= 0) {
            unint64_t v60 = a1;
          }
          else {
            unint64_t v60 = *a1;
          }
          memmove(v57, v60, v55);
        }
        strcpy((char *)v57 + v55, ": error loading section ");
        __dst = &v74;
        int64_t v68 = (int64_t)__src;
        size_t v69 = __len;
        __int16 v70 = 1284;
        operator new();
      }
      int v9 = *(_DWORD *)(v7 + 4);
      goto LABEL_27;
    }
    size_t v11 = __len;
    if (__len > 0x7FFFFFFFFFFFFFF7) {
      sub_226DBC384();
    }
    if (__len >= 0x17)
    {
      size_t v14 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((__len | 7) != 0x17) {
        size_t v14 = __len | 7;
      }
      size_t v15 = v14 + 1;
      __int16 v12 = (void ***)operator new(v14 + 1);
      size_t v67 = v11;
      int64_t v68 = v15 | 0x8000000000000000;
      __dst = (void **)v12;
      a3 = v61;
    }
    else
    {
      HIBYTE(v68) = __len;
      __int16 v12 = &__dst;
      if (!__len) {
        goto LABEL_19;
      }
    }
    memmove(v12, v10, v11);
LABEL_19:
    *((unsigned char *)v12 + v11) = 0;
    if (v68 >= 0) {
      p_dst = &__dst;
    }
    else {
      p_dst = (void ***)__dst;
    }
    uint64_t v8 = v62;
    goto LABEL_23;
  }
LABEL_27:
  if (v9 != 1) {
    goto LABEL_94;
  }
  sub_226DC5544(v6, v7, (uint64_t)&v74);
  if ((v76 & 1) == 0)
  {
    sub_226DC329C(v6, (uint64_t)&v71);
    if (v73)
    {
      char v24 = 0;
      uint64_t v25 = v71;
      uint64_t v71 = 0;
      *a3 = v25;
      if ((v73 & 1) == 0) {
        goto LABEL_90;
      }
      goto LABEL_88;
    }
    unsigned int v17 = *(_DWORD *)(v7 + 12);
    if (v72)
    {
      uint64_t v18 = 0;
      while (1)
      {
        if (*(_DWORD *)(v71 + v18) == 1 && *(_DWORD *)(v71 + v18 + 4) == *(_DWORD *)(v7 + 16))
        {
          unsigned int v19 = *(_DWORD *)(v71 + v18 + 8);
          if (v17 >= v19 && *(_DWORD *)(v71 + v18 + 20) + v19 > v17) {
            break;
          }
        }
        v18 += 32;
        if (32 * v72 == v18) {
          goto LABEL_38;
        }
      }
      unsigned int v17 = v17 - v19 + *(_DWORD *)(v71 + v18 + 12);
    }
LABEL_38:
    uint64_t v20 = v17;
    if ((*(unsigned char *)(v7 + 8) & 4) == 0)
    {
      unint64_t v21 = __src;
      if (!__src)
      {
        __dst = 0;
        size_t v67 = 0;
        uint8x8_t v29 = &__dst;
        int64_t v68 = 0;
        uint64_t v8 = v62;
        goto LABEL_61;
      }
      size_t v22 = __len;
      if (__len > 0x7FFFFFFFFFFFFFF7) {
        sub_226DBC384();
      }
      if (__len >= 0x17)
      {
        size_t v31 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((__len | 7) != 0x17) {
          size_t v31 = __len | 7;
        }
        size_t v32 = v31 + 1;
        int8x8_t v23 = (void ***)operator new(v31 + 1);
        size_t v67 = v22;
        int64_t v68 = v32 | 0x8000000000000000;
        __dst = (void **)v23;
      }
      else
      {
        HIBYTE(v68) = __len;
        int8x8_t v23 = &__dst;
        if (!__len) {
          goto LABEL_57;
        }
      }
      memmove(v23, v21, v22);
LABEL_57:
      *((unsigned char *)v23 + v22) = 0;
      if (v68 >= 0) {
        uint8x8_t v29 = &__dst;
      }
      else {
        uint8x8_t v29 = (void ***)__dst;
      }
      a3 = v61;
      uint64_t v8 = v62;
LABEL_61:
      char v33 = (*(uint64_t (**)(uint64_t, void ***, void, size_t, void *, uint64_t))(*(void *)a2 + 8))(a2, v29, *(unsigned int *)(v7 + 12), v75, v74, v20);
      if (SHIBYTE(v68) < 0) {
        goto LABEL_62;
      }
      goto LABEL_86;
    }
    uint64_t v26 = __src;
    if (!__src)
    {
      __dst = 0;
      size_t v67 = 0;
      unint64_t v30 = &__dst;
      int64_t v68 = 0;
      uint64_t v8 = v62;
      goto LABEL_85;
    }
    size_t v27 = __len;
    if (__len > 0x7FFFFFFFFFFFFFF7) {
      sub_226DBC384();
    }
    if (__len >= 0x17)
    {
      size_t v41 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((__len | 7) != 0x17) {
        size_t v41 = __len | 7;
      }
      size_t v42 = v41 + 1;
      unint64_t v28 = (void ***)operator new(v41 + 1);
      size_t v67 = v27;
      int64_t v68 = v42 | 0x8000000000000000;
      __dst = (void **)v28;
    }
    else
    {
      HIBYTE(v68) = __len;
      unint64_t v28 = &__dst;
      if (!__len) {
        goto LABEL_81;
      }
    }
    memmove(v28, v26, v27);
LABEL_81:
    *((unsigned char *)v28 + v27) = 0;
    if (v68 >= 0) {
      unint64_t v30 = &__dst;
    }
    else {
      unint64_t v30 = (void ***)__dst;
    }
    a3 = v61;
    uint64_t v8 = v62;
LABEL_85:
    char v33 = (*(uint64_t (**)(uint64_t, void ***, void, size_t, void *, uint64_t))(*(void *)a2 + 16))(a2, v30, *(unsigned int *)(v7 + 12), v75, v74, v20);
    if (SHIBYTE(v68) < 0)
    {
LABEL_62:
      operator delete(__dst);
      if ((v33 & 1) == 0) {
        goto LABEL_63;
      }
      goto LABEL_87;
    }
LABEL_86:
    if ((v33 & 1) == 0)
    {
LABEL_63:
      int v34 = *((char *)a1 + 23);
      if (v34 >= 0) {
        size_t v35 = *((unsigned __int8 *)a1 + 23);
      }
      else {
        size_t v35 = (size_t)a1[1];
      }
      unint64_t v36 = v35 + 24;
      if (v35 + 24 > 0x7FFFFFFFFFFFFFF7) {
        sub_226DBC384();
      }
      if (v36 <= 0x16)
      {
        size_t v64 = 0;
        unint64_t v65 = 0;
        __p = 0;
        p_p = &__p;
        HIBYTE(v65) = v35 + 24;
        goto LABEL_72;
      }
      uint64_t v38 = (v36 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v36 | 7) != 0x17) {
        uint64_t v38 = v36 | 7;
      }
      uint64_t v39 = v38 + 1;
      p_p = operator new(v38 + 1);
      size_t v64 = v35 + 24;
      unint64_t v65 = v39 | 0x8000000000000000;
      __p = p_p;
      if (v35)
      {
LABEL_72:
        if (v34 >= 0) {
          uint64_t v40 = a1;
        }
        else {
          uint64_t v40 = *a1;
        }
        memmove(p_p, v40, v35);
      }
      strcpy((char *)p_p + v35, ": error loading section ");
      __dst = &__p;
      int64_t v68 = (int64_t)__src;
      size_t v69 = __len;
      __int16 v70 = 1284;
      operator new();
    }
LABEL_87:
    char v24 = 1;
    if ((v73 & 1) == 0) {
      goto LABEL_90;
    }
LABEL_88:
    uint64_t v43 = v71;
    uint64_t v71 = 0;
    if (v43) {
      (*(void (**)(uint64_t))(*(void *)v43 + 8))(v43);
    }
LABEL_90:
    if (v76)
    {
      uint64_t v44 = v74;
      v74 = 0;
      if (v44) {
        (*(void (**)(void *))(*(void *)v44 + 8))(v44);
      }
    }
    if ((v24 & 1) == 0) {
      goto LABEL_104;
    }
    goto LABEL_94;
  }
  uint64_t v48 = v74;
LABEL_103:
  *a3 = (uint64_t)v48;
LABEL_104:
  if (v79)
  {
    uint64_t v49 = __src;
    __src = 0;
    if (v49) {
      (*(void (**)(void *))(*(void *)v49 + 8))(v49);
    }
  }
  int v46 = 0;
  if (v82)
  {
LABEL_108:
    uint64_t v50 = v80;
    uint64_t v80 = 0;
    if (v50) {
      (*(void (**)(uint64_t))(*(void *)v50 + 8))(v50);
    }
  }
LABEL_110:
  if (v46)
  {
    uint64_t v51 = *(unsigned int *)(*v6 + 36);
    if (v51 != 1 && v51 != 2)
    {
      uint64_t v52 = sub_226DD1254();
      uint64_t v53 = (void *)v52[4];
      if (v52[3] - (void)v53 > 0x60uLL)
      {
        qmemcpy(v53, "Warning: running old, un-versioned binary on new simulator. Defaulting to simulator LACC V1 ISA.\n", 97);
        v52[4] += 97;
      }
      else
      {
        sub_226DD0534((uint64_t)v52, "Warning: running old, un-versioned binary on new simulator. Defaulting to simulator LACC V1 ISA.\n", 0x61uLL);
      }
      uint64_t v51 = 1;
    }
    (*(void (**)(uint64_t, uint64_t))(*(void *)a2 + 56))(a2, v51);
    *a3 = 0;
  }
}

void sub_226DC27B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *__p,uint64_t a29,char a30,int a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  MEMORY[0x22A669B00](v35, 0x10F3C401C2224D9);
  if (SHIBYTE(a31) < 0) {
    operator delete(__p);
  }
  if ((a34 & 1) != 0 && a32) {
    (*(void (**)(uint64_t))(*(void *)a32 + 8))(a32);
  }
  if (*(unsigned char *)(v36 - 104))
  {
    uint64_t v38 = *(void *)(v36 - 120);
    *(void *)(v36 - 120) = 0;
    if (v38)
    {
      (*(void (**)(uint64_t))(*(void *)v38 + 8))(v38);
      _Unwind_Resume(a1);
    }
  }
  _Unwind_Resume(a1);
}

uint64_t sub_226DC29B8(uint64_t a1)
{
  return *(unsigned int *)(*(void *)(*(void *)a1 + 32) + 36);
}

uint64_t sub_226DC29C8(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(*(void *)a1 + 48)) {
    return 0;
  }
  sub_226DC329C((void *)(*(void *)a1 + 32), (uint64_t)&v5);
  uint64_t v1 = v5;
  if (v7)
  {
    uint64_t v5 = 0;
    if (v1) {
      (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
    }
    return 0;
  }
  if (!v6) {
    return 0;
  }
  uint64_t result = 0;
  unint64_t v3 = (unsigned char *)(v5 + 24);
  uint64_t v4 = 32 * v6;
  do
  {
    if (*((_DWORD *)v3 - 6) == 1 && (*v3 & 1) != 0) {
      result += *((unsigned int *)v3 - 1);
    }
    v3 += 32;
    v4 -= 32;
  }
  while (v4);
  return result;
}

uint64_t sub_226DC2AB0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  v9[0] = a2;
  v9[1] = a3;
  sub_226DC59DC(v3, v9, (uint64_t)&v10);
  if ((v12 & 1) == 0) {
    return v11;
  }
  uint64_t v8 = v10;
  uint64_t v5 = sub_226DD1254();
  __int16 v7 = 257;
  sub_226DCB280(&v8, (uint64_t)v5, v6);
  uint64_t result = v8;
  if (v8)
  {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
    return 0;
  }
  return result;
}

void sub_226DC2BB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  if (a14) {
    sub_226DD2718();
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_226DC2BD4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  v9[0] = a2;
  v9[1] = a3;
  sub_226DC59DC(v3, v9, (uint64_t)&v10);
  if ((v11 & 1) == 0) {
    return HIDWORD(v10);
  }
  uint64_t v8 = v10;
  uint64_t v5 = sub_226DD1254();
  __int16 v7 = 257;
  sub_226DCB280(&v8, (uint64_t)v5, v6);
  uint64_t result = v8;
  if (v8)
  {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
    return 0;
  }
  return result;
}

void sub_226DC2CD8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  if (a14) {
    sub_226DD2718();
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_226DC2CF8@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (a2 <= 0x33)
  {
    unint64_t v4 = a2;
    v5[0] = "invalid buffer: the size (";
    v5[2] = &v4;
    __int16 v6 = 2563;
    v7[0] = v5;
    v7[2] = ") is smaller than an ELF header (";
    __int16 v8 = 770;
    uint64_t v3 = 52;
    v9[0] = v7;
    void v9[2] = &v3;
    __int16 v10 = 2562;
    char v11 = v9;
    uint64_t v12 = ")";
    __int16 v13 = 770;
    operator new();
  }
  *(unsigned char *)(a3 + 16) &= ~1u;
  *(void *)a3 = result;
  *(void *)(a3 + 8) = a2;
  return result;
}

void sub_226DC2DFC(_Unwind_Exception *a1)
{
  MEMORY[0x22A669B00](v1, 0x10F3C401C2224D9);
  _Unwind_Resume(a1);
}

void *sub_226DC2E24@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *(unsigned int *)(*result + 32);
  if (v4)
  {
    uint64_t v5 = (uint64_t *)*(unsigned __int16 *)(v3 + 46);
    if (v5 != (uint64_t *)40)
    {
      char v11 = "invalid e_shentsize in ELF header: ";
      uint64_t v12 = v5;
      __int16 v13 = 2307;
      operator new();
    }
    unint64_t v6 = result[1];
    if (v4 > 0xFFFFFFD7 || v4 + 40 > v6)
    {
      uint64_t v10 = *(unsigned int *)(*result + 32);
      char v11 = "section header table goes past the end of the file: e_shoff = 0x";
      uint64_t v12 = &v10;
      __int16 v13 = 3587;
      operator new();
    }
    uint64_t v8 = v3 + v4;
    unsigned int v9 = *(unsigned __int16 *)(v3 + 48);
    if (v9)
    {
      if (v4 + 40 * (unint64_t)v9 > v6) {
        goto LABEL_13;
      }
    }
    else
    {
      unsigned int v9 = *(_DWORD *)(v8 + 20);
      if (v4 + 40 * (unint64_t)v9 > v6)
      {
LABEL_13:
        char v11 = "section table goes past the end of file";
        __int16 v13 = 259;
        operator new();
      }
    }
    *(unsigned char *)(a2 + 16) &= ~1u;
    *(void *)a2 = v8;
    *(void *)(a2 + 8) = v9;
  }
  else
  {
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(unsigned char *)(a2 + 16) &= ~1u;
  }
  return result;
}

void sub_226DC2FE8(_Unwind_Exception *a1)
{
  MEMORY[0x22A669B00](v1, 0x10F3C401C2224D9);
  _Unwind_Resume(a1);
}

void *sub_226DC3020@<X0>(void *a1@<X0>, unsigned int *a2@<X1>, void (*a3)(uint64_t *__return_ptr, uint64_t, void ***)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  sub_226DC2E24(a1, (uint64_t)v15);
  if (v16)
  {
    uint64_t v11 = v15[0];
    v15[0] = 0;
    *(unsigned char *)(a5 + 16) |= 1u;
    *(void *)a5 = v11;
    uint64_t result = 0;
    v15[0] = 0;
  }
  else
  {
    sub_226DC3490(a1, v15[0], v15[1], a3, a4, (uint64_t)v13);
    if (v14)
    {
      uint64_t v12 = v13[0];
      v13[0] = 0;
      *(unsigned char *)(a5 + 16) |= 1u;
      *(void *)a5 = v12;
      uint64_t result = 0;
      v13[0] = 0;
    }
    else
    {
      uint64_t result = sub_226DC3638(a1, a2, v13[0], v13[1], a5);
      if (v14)
      {
        uint64_t result = (void *)v13[0];
        v13[0] = 0;
        if (result) {
          uint64_t result = (void *)(*(uint64_t (**)(void *))(*result + 8))(result);
        }
      }
    }
    if (v16)
    {
      uint64_t result = (void *)v15[0];
      v15[0] = 0;
      if (result) {
        return (void *)(*(uint64_t (**)(void *))(*result + 8))(result);
      }
    }
  }
  return result;
}

void sub_226DC3198(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, char a17)
{
  uint64_t v17 = exception_object;
  if (a14)
  {
    sub_226DD278C(&a12, (uint64_t)exception_object, a2, (uint64_t)&a10);
    uint64_t v17 = a10;
  }
  if (a17)
  {
    uint64_t v18 = a15;
    a15 = 0;
    if (v18)
    {
      (*(void (**)(uint64_t))(*(void *)v18 + 8))(v18);
      _Unwind_Resume(v17);
    }
  }
  _Unwind_Resume(v17);
}

void sub_226DC3210()
{
}

void sub_226DC3274(_Unwind_Exception *a1)
{
  MEMORY[0x22A669B00](v1, 0x10F3C401C2224D9);
  _Unwind_Resume(a1);
}

void *sub_226DC329C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *(unsigned __int16 *)(*result + 44);
  if (*(_WORD *)(*result + 44))
  {
    uint64_t v5 = *(unsigned __int16 *)(v3 + 42);
    if (v5 != 32)
    {
      size_t v22 = "invalid e_phentsize: ";
      uint64_t v23 = v5;
      __int16 v24 = 2307;
      operator new();
    }
  }
  else
  {
    uint64_t v5 = *(unsigned __int16 *)(v3 + 42);
  }
  uint64_t v6 = *(unsigned int *)(v3 + 28);
  unint64_t v7 = result[1];
  if (v6 + v5 * (unint64_t)*(unsigned __int16 *)(*result + 44) > v7)
  {
    uint64_t v8 = *(unsigned int *)(v3 + 28);
    unint64_t v9 = v7;
    v10[0] = "program headers are longer than binary of size ";
    v10[2] = &v9;
    __int16 v11 = 2563;
    v12[0] = v10;
    v12[2] = ": e_phoff = 0x";
    __int16 v13 = 770;
    v14[0] = v12;
    v14[2] = &v8;
    __int16 v15 = 3586;
    v16[0] = v14;
    v16[2] = ", e_phnum = ";
    __int16 v17 = 770;
    v18[0] = v16;
    v18[2] = v4;
    __int16 v19 = 2306;
    v20[0] = v18;
    v20[2] = ", e_phentstd::string::size_type size = ";
    __int16 v21 = 770;
    size_t v22 = (const char *)v20;
    uint64_t v23 = v5;
    __int16 v24 = 2306;
    operator new();
  }
  *(unsigned char *)(a2 + 16) &= ~1u;
  *(void *)a2 = v3 + v6;
  *(void *)(a2 + 8) = v4;
  return result;
}

void sub_226DC3460(_Unwind_Exception *a1)
{
  MEMORY[0x22A669B00](v1, 0x10F3C401C2224D9);
  _Unwind_Resume(a1);
}

void sub_226DC3490(void *a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, void (*a4)(uint64_t *__return_ptr, uint64_t, void ***)@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  unsigned int v7 = *(unsigned __int16 *)(*a1 + 50);
  if (v7 == 0xFFFF)
  {
    if (!a3)
    {
      __int16 v11 = "e_shstrndx == SHN_XINDEX, but the section header table is empty";
      __int16 v13 = 259;
      operator new();
    }
    unsigned int v7 = *(_DWORD *)(a2 + 24);
    if (v7) {
      goto LABEL_3;
    }
LABEL_9:
    *(unsigned char *)(a6 + 16) &= ~1u;
    *(void *)a6 = "";
    *(void *)(a6 + 8) = 0;
    return;
  }
  if (!*(_WORD *)(*a1 + 50)) {
    goto LABEL_9;
  }
LABEL_3:
  if (a3 <= v7)
  {
    v9[0] = "section header string table index ";
    void v9[2] = v7;
    __int16 v10 = 2051;
    __int16 v11 = (const char *)v9;
    uint64_t v12 = " does not exist";
    __int16 v13 = 770;
    operator new();
  }
  uint64_t v8 = a2 + 40 * v7;

  sub_226DC3870(a1, v8, a4, a5, a6);
}

void sub_226DC3608(_Unwind_Exception *a1)
{
  MEMORY[0x22A669B00](v1, 0x10F3C401C2224D9);
  _Unwind_Resume(a1);
}

void *sub_226DC3638@<X0>(void *result@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  unint64_t v6 = *a2;
  if (v6)
  {
    if (a4 <= v6)
    {
      sub_226DC3E34(result, (uint64_t)a2, (char *)&v13);
      uint64_t v8 = std::string::insert(&v13, 0, "a section ");
      long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
      v14.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v14.__r_.__value_.__l.__data_ = v9;
      v8->__r_.__value_.__l.__size_ = 0;
      v8->__r_.__value_.__r.__words[2] = 0;
      v8->__r_.__value_.__r.__words[0] = 0;
      __int16 v10 = std::string::append(&v14, " has an invalid sh_name (0x");
      long long v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
      std::string::size_type v16 = v10->__r_.__value_.__r.__words[2];
      *(_OWORD *)__p = v11;
      v10->__r_.__value_.__l.__size_ = 0;
      v10->__r_.__value_.__r.__words[2] = 0;
      v10->__r_.__value_.__r.__words[0] = 0;
      unint64_t v12 = v6;
      v17[0] = __p;
      v17[2] = &v12;
      __int16 v18 = 3588;
      __int16 v19 = v17;
      uint64_t v20 = ") offset which goes past the end of the section name string table";
      __int16 v21 = 770;
      operator new();
    }
    unsigned int v7 = (const char *)(a3 + v6);
    uint64_t result = (void *)strlen(v7);
    *(unsigned char *)(a5 + 16) &= ~1u;
    *(void *)a5 = v7;
    *(void *)(a5 + 8) = result;
  }
  else
  {
    *(void *)a5 = 0;
    *(void *)(a5 + 8) = 0;
    *(unsigned char *)(a5 + 16) &= ~1u;
  }
  return result;
}

void sub_226DC37D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  MEMORY[0x22A669B00](v28, 0x10F3C401C2224D9);
  if (a28 < 0)
  {
    operator delete(__p);
    if ((a21 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a15 & 0x80000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_7;
    }
  }
  else if ((a21 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a16);
  if ((a15 & 0x80000000) == 0) {
LABEL_4:
  }
    _Unwind_Resume(a1);
LABEL_7:
  operator delete(a10);
  _Unwind_Resume(a1);
}

void sub_226DC3870(void *a1@<X0>, uint64_t a2@<X1>, void (*a3)(uint64_t *__return_ptr, uint64_t, void ***)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  if (*(_DWORD *)(a2 + 4) == 3) {
    goto LABEL_19;
  }
  sub_226DC3E34(a1, a2, (char *)&v30);
  __int16 v10 = std::string::insert(&v30, 0, "invalid sh_type for string table section ");
  long long v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
  v31.__r_.__value_.__r.__words[2] = v10->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v31.__r_.__value_.__l.__data_ = v11;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  unint64_t v12 = std::string::append(&v31, ": expected SHT_STRTAB, but got ");
  long long v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
  std::string::size_type v33 = v12->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v13;
  v12->__r_.__value_.__l.__size_ = 0;
  v12->__r_.__value_.__r.__words[2] = 0;
  v12->__r_.__value_.__r.__words[0] = 0;
  __int16 v43 = 260;
  uint64_t v40 = __p;
  std::string v14 = sub_226DC9C34(*(unsigned __int16 *)(*a1 + 18), *(_DWORD *)(a2 + 4));
  char v16 = v43;
  if (v43 == 1)
  {
    int v34 = (void **)v14;
    uint64_t v35 = v15;
    __int16 v38 = 261;
  }
  else if ((_BYTE)v43)
  {
    if (HIBYTE(v43) != 1) {
      char v16 = 2;
    }
    __int16 v17 = &v40;
    if (HIBYTE(v43) == 1) {
      __int16 v17 = (void ***)v40;
    }
    int v34 = (void **)v17;
    uint64_t v35 = v41;
    uint64_t v36 = v14;
    uint64_t v37 = v15;
    LOBYTE(v38) = v16;
    HIBYTE(v38) = 5;
  }
  else
  {
    __int16 v38 = 256;
  }
  a3(&v39, a4, &v34);
  if (SHIBYTE(v33) < 0)
  {
    operator delete(__p[0]);
    if ((SHIBYTE(v31.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_13:
      if ((SHIBYTE(v30.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_14;
      }
LABEL_18:
      operator delete(v30.__r_.__value_.__l.__data_);
      uint64_t v18 = v39;
      if (v39) {
        goto LABEL_15;
      }
      goto LABEL_19;
    }
  }
  else if ((SHIBYTE(v31.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_13;
  }
  operator delete(v31.__r_.__value_.__l.__data_);
  if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_18;
  }
LABEL_14:
  uint64_t v18 = v39;
  if (v39)
  {
LABEL_15:
    *(unsigned char *)(a5 + 16) |= 1u;
    *(void *)a5 = v18;
    return;
  }
LABEL_19:
  sub_226DC4088(a1, a2, (uint64_t)&v40);
  __int16 v19 = v40;
  if (v42)
  {
    uint64_t v40 = 0;
    *(unsigned char *)(a5 + 16) |= 1u;
    *(void *)a5 = v19;
    if ((v42 & 1) == 0) {
      return;
    }
    goto LABEL_26;
  }
  uint64_t v20 = v41;
  if (!v41)
  {
    sub_226DC3E34(a1, a2, (char *)&v30);
    uint64_t v25 = std::string::insert(&v30, 0, "SHT_STRTAB string table section ");
    long long v26 = *(_OWORD *)&v25->__r_.__value_.__l.__data_;
    v31.__r_.__value_.__r.__words[2] = v25->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v31.__r_.__value_.__l.__data_ = v26;
    v25->__r_.__value_.__l.__size_ = 0;
    v25->__r_.__value_.__r.__words[2] = 0;
    v25->__r_.__value_.__r.__words[0] = 0;
    size_t v27 = std::string::append(&v31, " is empty");
    long long v28 = *(_OWORD *)&v27->__r_.__value_.__l.__data_;
    std::string::size_type v33 = v27->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v28;
    v27->__r_.__value_.__l.__size_ = 0;
    v27->__r_.__value_.__r.__words[2] = 0;
    v27->__r_.__value_.__r.__words[0] = 0;
    __int16 v38 = 260;
    int v34 = __p;
    operator new();
  }
  if (*((unsigned char *)v40 + v41 - 1))
  {
    sub_226DC3E34(a1, a2, (char *)&v30);
    __int16 v21 = std::string::insert(&v30, 0, "SHT_STRTAB string table section ");
    long long v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
    v31.__r_.__value_.__r.__words[2] = v21->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v31.__r_.__value_.__l.__data_ = v22;
    v21->__r_.__value_.__l.__size_ = 0;
    v21->__r_.__value_.__r.__words[2] = 0;
    v21->__r_.__value_.__r.__words[0] = 0;
    uint64_t v23 = std::string::append(&v31, " is non-null terminated");
    long long v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
    std::string::size_type v33 = v23->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v24;
    v23->__r_.__value_.__l.__size_ = 0;
    v23->__r_.__value_.__r.__words[2] = 0;
    v23->__r_.__value_.__r.__words[0] = 0;
    __int16 v38 = 260;
    int v34 = __p;
    operator new();
  }
  *(unsigned char *)(a5 + 16) &= ~1u;
  *(void *)a5 = v19;
  *(void *)(a5 + 8) = v20;
  if (v42)
  {
LABEL_26:
    uint8x8_t v29 = v40;
    uint64_t v40 = 0;
    if (v29) {
      (*((void (**)(void **))*v29 + 1))(v29);
    }
  }
}

void sub_226DC3C98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  MEMORY[0x22A669B00](v28, 0x10F3C401C2224D9);
  if (a28 < 0)
  {
    operator delete(__p);
    if ((a21 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a15 & 0x80000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else if ((a21 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a16);
  if ((a15 & 0x80000000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)(v29 - 80) & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
LABEL_8:
  operator delete(a10);
  if ((*(unsigned char *)(v29 - 80) & 1) == 0) {
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v31 = *(void *)(v29 - 96);
  *(void *)(v29 - 96) = 0;
  if (v31)
  {
    (*(void (**)(uint64_t))(*(void *)v31 + 8))(v31);
    _Unwind_Resume(a1);
  }
LABEL_11:
  _Unwind_Resume(a1);
}

void sub_226DC3E34(void *a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  sub_226DC2E24(a1, (uint64_t)v12);
  if ((v13 & 1) == 0)
  {
    std::to_string(&v10, 0xCCCCCCCCCCCCCCCDLL * ((int64_t)(a2 - v12[0]) >> 3));
    uint64_t v5 = std::string::insert(&v10, 0, "[index ");
    long long v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
    v11.__r_.__value_.__r.__words[2] = v5->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v11.__r_.__value_.__l.__data_ = v6;
    v5->__r_.__value_.__l.__size_ = 0;
    v5->__r_.__value_.__r.__words[2] = 0;
    v5->__r_.__value_.__r.__words[0] = 0;
    unsigned int v7 = std::string::append(&v11, "]");
    *(std::string *)a3 = *v7;
    v7->__r_.__value_.__l.__size_ = 0;
    v7->__r_.__value_.__r.__words[2] = 0;
    v7->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v11.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v10.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_4:
        if ((v13 & 1) == 0) {
          return;
        }
        goto LABEL_12;
      }
    }
    else if ((SHIBYTE(v10.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_4;
    }
    operator delete(v10.__r_.__value_.__l.__data_);
    if ((v13 & 1) == 0) {
      return;
    }
LABEL_12:
    std::string::size_type v9 = v12[0];
    v12[0] = 0;
    if (v9) {
      (*(void (**)(std::string::size_type))(*(void *)v9 + 8))(v9);
    }
    return;
  }
  std::string::size_type v8 = v12[0];
  v12[0] = 0;
  v10.__r_.__value_.__r.__words[0] = v8;
  sub_226DC4520(&v10, &v11);
  if (v10.__r_.__value_.__r.__words[0]) {
    (*(void (**)(std::string::size_type))(*(void *)v10.__r_.__value_.__l.__data_ + 8))(v10.__r_.__value_.__r.__words[0]);
  }
  a3[23] = 15;
  strcpy(a3, "[unknown index]");
  if (v13) {
    goto LABEL_12;
  }
}

void sub_226DC3FF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a10) {
    sub_226DD2718();
  }
  if (*(unsigned char *)(v21 - 32))
  {
    uint64_t v23 = *(void *)(v21 - 48);
    *(void *)(v21 - 48) = 0;
    if (v23)
    {
      (*(void (**)(uint64_t))(*(void *)v23 + 8))(v23);
      _Unwind_Resume(exception_object);
    }
  }
  _Unwind_Resume(exception_object);
}

void *sub_226DC4088@<X0>(void *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3 = result;
  std::string::size_type v6 = *(unsigned int *)(a2 + 16);
  std::string::size_type v5 = *(unsigned int *)(a2 + 20);
  if (__CFADD__(v6, v5))
  {
    sub_226DC3E34(result, a2, (char *)&v26);
    unsigned int v7 = std::string::insert(&v26, 0, "section ");
    long long v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    v21.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v21.__r_.__value_.__l.__data_ = v8;
    v7->__r_.__value_.__l.__size_ = 0;
    v7->__r_.__value_.__r.__words[2] = 0;
    v7->__r_.__value_.__r.__words[0] = 0;
    std::string::size_type v9 = std::string::append(&v21, " has a sh_offset (0x");
    long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
    long long v24 = (const char *)v9->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v10;
    v9->__r_.__value_.__l.__size_ = 0;
    v9->__r_.__value_.__r.__words[2] = 0;
    v9->__r_.__value_.__r.__words[0] = 0;
    v20.__r_.__value_.__r.__words[0] = v6;
    v27[0] = __p;
    uint64_t v28 = &v20;
    __int16 v29 = 3588;
    v30[0] = v27;
    uint64_t v31 = ") + sh_size (0x";
    __int16 v32 = 770;
    v19.__r_.__value_.__r.__words[0] = v5;
    v33[0] = v30;
    int v34 = &v19;
    __int16 v35 = 3586;
    uint64_t v36 = v33;
    uint64_t v37 = ") that cannot be represented";
    __int16 v38 = 770;
    operator new();
  }
  if (result[1] < (unint64_t)(v5 + v6))
  {
    sub_226DC3E34(result, a2, (char *)&v19);
    std::string v11 = std::string::insert(&v19, 0, "section ");
    long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
    v20.__r_.__value_.__r.__words[2] = v11->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v20.__r_.__value_.__l.__data_ = v12;
    v11->__r_.__value_.__l.__size_ = 0;
    v11->__r_.__value_.__r.__words[2] = 0;
    v11->__r_.__value_.__r.__words[0] = 0;
    char v13 = std::string::append(&v20, " has a sh_offset (0x");
    long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
    v26.__r_.__value_.__r.__words[2] = v13->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v26.__r_.__value_.__l.__data_ = v14;
    v13->__r_.__value_.__l.__size_ = 0;
    v13->__r_.__value_.__r.__words[2] = 0;
    v13->__r_.__value_.__r.__words[0] = 0;
    std::string::size_type v17 = v5;
    std::string::size_type v18 = v6;
    v21.__r_.__value_.__r.__words[0] = (std::string::size_type)&v26;
    v21.__r_.__value_.__r.__words[2] = (std::string::size_type)&v18;
    __int16 v22 = 3588;
    __p[0] = &v21;
    long long v24 = ") + sh_size (0x";
    __int16 v25 = 770;
    v27[0] = __p;
    uint64_t v28 = (std::string *)&v17;
    __int16 v29 = 3586;
    v30[0] = v27;
    uint64_t v31 = ") that is greater than the file size (0x";
    __int16 v32 = 770;
    uint64_t v16 = v3[1];
    v33[0] = v30;
    int v34 = (std::string *)&v16;
    __int16 v35 = 3586;
    uint64_t v36 = v33;
    uint64_t v37 = ")";
    __int16 v38 = 770;
    operator new();
  }
  std::string::size_type v15 = *result + v6;
  *(unsigned char *)(a3 + 16) &= ~1u;
  *(void *)a3 = v15;
  *(void *)(a3 + 8) = v5;
  return result;
}

void sub_226DC4400(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,void *__p,uint64_t a44,int a45,__int16 a46,char a47,char a48)
{
  MEMORY[0x22A669B00](v48, 0x10F3C401C2224D9);
  if (a48 < 0)
  {
    operator delete(__p);
    if (a23 < 0)
    {
LABEL_5:
      operator delete(a18);
      if ((a17 & 0x80000000) == 0) {
LABEL_9:
      }
        _Unwind_Resume(a1);
LABEL_8:
      operator delete(a12);
      goto LABEL_9;
    }
  }
  else if (a23 < 0)
  {
    goto LABEL_5;
  }
  if ((a17 & 0x80000000) == 0) {
    goto LABEL_9;
  }
  goto LABEL_8;
}

void **sub_226DC4520@<X0>(void **result@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *result;
  if (*result)
  {
    *uint64_t result = 0;
    if ((*(unsigned int (**)(void *, void *))(*v3 + 48))(v3, &unk_26815DD31))
    {
      *a2 = 0;
      uint64_t v4 = (uint64_t **)v3[1];
      std::string::size_type v5 = (uint64_t **)v3[2];
      if (v4 != v5)
      {
        std::string::size_type v6 = 0;
        do
        {
          long long v10 = v6;
          *a2 = 0;
          unsigned int v7 = *v4;
          *uint64_t v4 = 0;
          if ((*(unsigned int (**)(uint64_t *, void *))(*v7 + 48))(v7, &unk_26815DD30))
          {
            (*(void (**)(uint64_t *))(*v7 + 8))(v7);
            unsigned int v7 = 0;
          }
          std::string::size_type v9 = v7;
          sub_226DC4820(&v10, &v9, &v11);
          std::string::size_type v6 = v11;
          *a2 = v11;
          std::string v11 = 0;
          if (v9) {
            (*(void (**)(uint64_t *))(*v9 + 8))(v9);
          }
          if (v10) {
            (*(void (**)(uint64_t *))(*v10 + 8))(v10);
          }
          ++v4;
        }
        while (v4 != v5);
      }
      return (void **)(*(uint64_t (**)(void *))(*v3 + 8))(v3);
    }
    else
    {
      uint64_t result = (void **)(*(uint64_t (**)(void *, void *))(*v3 + 48))(v3, &unk_26815DD30);
      if (result)
      {
        *a2 = 0;
        long long v8 = *(uint64_t (**)(void *))(*v3 + 8);
        return (void **)v8(v3);
      }
      else
      {
        *a2 = v3;
      }
    }
  }
  else
  {
    *a2 = 0;
  }
  return result;
}

void sub_226DC477C(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

uint64_t *sub_226DC4820@<X0>(uint64_t **a1@<X0>, uint64_t **a2@<X1>, uint64_t **a3@<X8>)
{
  uint64_t result = *a1;
  unsigned int v7 = *a2;
  if (!result) {
    goto LABEL_18;
  }
  if (v7)
  {
    if ((*(unsigned int (**)(uint64_t *, void *))(*result + 48))(result, &unk_26815DD31))
    {
      long long v8 = *a1;
      uint64_t result = *a2;
      if (*a2)
      {
        uint64_t result = (uint64_t *)(*(uint64_t (**)(uint64_t *, void *))(*result + 48))(result, &unk_26815DD31);
        std::string::size_type v9 = *a2;
        if (result)
        {
          *a2 = 0;
          long long v10 = (uint64_t *)v9[1];
          std::string v11 = (uint64_t *)v9[2];
          if (v10 == v11) {
            goto LABEL_26;
          }
          uint64_t result = (uint64_t *)v8[2];
          do
          {
            if ((unint64_t)result < v8[3])
            {
              uint64_t v12 = *v10;
              *long long v10 = 0;
              *result++ = v12;
            }
            else
            {
              uint64_t result = sub_226DC50AC(v8 + 1, v10);
            }
            v8[2] = (uint64_t)result;
            ++v10;
          }
          while (v10 != v11);
          if (v9) {
LABEL_26:
          }
            uint64_t result = (uint64_t *)(*(uint64_t (**)(uint64_t *))(*v9 + 8))(v9);
LABEL_27:
          *a3 = *a1;
          goto LABEL_28;
        }
      }
      else
      {
        std::string::size_type v9 = 0;
      }
      std::string::size_type v17 = v9;
      *a2 = 0;
      std::string::size_type v15 = (uint64_t **)v8[2];
      if ((unint64_t)v15 >= v8[3])
      {
        uint64_t v16 = sub_226DC50AC(v8 + 1, (uint64_t *)&v17);
        uint64_t result = v17;
        v8[2] = (uint64_t)v16;
        std::string::size_type v17 = 0;
        if (result) {
          uint64_t result = (uint64_t *)(*(uint64_t (**)(uint64_t *))(*result + 8))(result);
        }
      }
      else
      {
        *std::string::size_type v15 = v9;
        v8[2] = (uint64_t)(v15 + 1);
      }
      goto LABEL_27;
    }
    if (!*a2 || !(*(unsigned int (**)(uint64_t *, void *))(**a2 + 48))(*a2, &unk_26815DD31)) {
      operator new();
    }
    char v13 = (char **)(*a2 + 1);
    long long v14 = *v13;
    std::string::size_type v17 = *a1;
    *a1 = 0;
    sub_226DC4BF4(v13, (uint64_t)v14, (uint64_t *)&v17);
    uint64_t result = v17;
    std::string::size_type v17 = 0;
    if (result) {
      uint64_t result = (uint64_t *)(*(uint64_t (**)(uint64_t *))(*result + 8))(result);
    }
    unsigned int v7 = *a2;
LABEL_18:
    *a3 = v7;
    *a2 = 0;
    return result;
  }
  *a3 = result;
LABEL_28:
  *a1 = 0;
  return result;
}

void sub_226DC4B74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, int a11, __int16 a12, char a13, char a14, uint64_t a15)
{
  if (a15)
  {
    sub_226DD2718();
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_226DC4BDC(_Unwind_Exception *a1)
{
  if (v1)
  {
    sub_226DD27EC();
    _Unwind_Resume(a1);
  }
  JUMPOUT(0x226DC4BD4);
}

char *sub_226DC4BF4(char **a1, uint64_t a2, uint64_t *a3)
{
  std::string::size_type v6 = *a1;
  unint64_t v5 = (unint64_t)a1[1];
  uint64_t v7 = a2 - (void)*a1;
  uint64_t v8 = v7 >> 3;
  std::string::size_type v9 = &(*a1)[v7 & 0xFFFFFFFFFFFFFFF8];
  unint64_t v10 = (unint64_t)a1[2];
  if (v5 < v10)
  {
    if (v9 == (char *)v5)
    {
      uint64_t v23 = *a3;
      *a3 = 0;
      *(void *)std::string::size_type v9 = v23;
      a1[1] = v9 + 8;
      return v9;
    }
    uint64_t v11 = v5 - (void)(v9 + 8);
    uint64_t v12 = v11 >> 3;
    char v13 = (uint64_t *)(v5 - 8);
    if (v5 < 8)
    {
      std::string::size_type v18 = a1[1];
    }
    else
    {
      unint64_t v14 = (v7 & 0xFFFFFFFFFFFFFFF8) + v11;
      unint64_t v15 = (unint64_t)&v6[v14 + 8];
      if (v5 > v15) {
        unint64_t v15 = (unint64_t)a1[1];
      }
      unint64_t v16 = v15 + ~(unint64_t)v6 - v14;
      if (v16 >= 0xE8)
      {
        BOOL v56 = (unint64_t)v13 >= (v16 & 0xFFFFFFFFFFFFFFF8) + v5 + 8
           || v5 >= (unint64_t)&v6[v14 + 8 + (v16 & 0xFFFFFFFFFFFFFFF8)];
        std::string::size_type v17 = (uint64_t *)(v5 - 8);
        std::string::size_type v18 = a1[1];
        if (v56)
        {
          uint64_t v57 = (v16 >> 3) + 1;
          uint64_t v58 = v57 & 0x3FFFFFFFFFFFFFFCLL;
          std::string::size_type v17 = &v13[v58];
          std::string::size_type v18 = (char *)(v5 + v58 * 8);
          uint64_t v59 = (_OWORD *)(v5 + 16);
          unint64_t v60 = &v6[8 * v12 + 16 + 8 * v8];
          uint64_t v61 = v57 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            long long v62 = *((_OWORD *)v60 - 1);
            long long v63 = *(_OWORD *)v60;
            *((_OWORD *)v60 - 1) = 0uLL;
            *(_OWORD *)unint64_t v60 = 0uLL;
            *(v59 - 1) = v62;
            *uint64_t v59 = v63;
            v59 += 2;
            v60 += 32;
            v61 -= 4;
          }
          while (v61);
          if (v57 == (v57 & 0x3FFFFFFFFFFFFFFCLL)) {
            goto LABEL_61;
          }
        }
      }
      else
      {
        std::string::size_type v17 = (uint64_t *)(v5 - 8);
        std::string::size_type v18 = a1[1];
      }
      do
      {
        uint64_t v64 = *v17;
        *v17++ = 0;
        *(void *)std::string::size_type v18 = v64;
        v18 += 8;
      }
      while ((unint64_t)v17 < v5);
    }
LABEL_61:
    a1[1] = v18;
    if ((char *)v5 != v9 + 8)
    {
      uint64_t v65 = 8 * v12;
      uint64_t v66 = (uint64_t)&v6[8 * v8 - 8];
      do
      {
        uint64_t v67 = *(void *)(v66 + v65);
        *(void *)(v66 + v65) = 0;
        uint64_t v68 = *v13;
        *char v13 = v67;
        if (v68) {
          (*(void (**)(uint64_t))(*(void *)v68 + 8))(v68);
        }
        --v13;
        v65 -= 8;
      }
      while (v65);
    }
    uint64_t v69 = *a3;
    *a3 = 0;
    uint64_t v70 = *(void *)v9;
    *(void *)std::string::size_type v9 = v69;
    if (v70) {
      (*(void (**)(uint64_t))(*(void *)v70 + 8))(v70);
    }
    return v9;
  }
  unint64_t v19 = ((uint64_t)(v5 - (void)v6) >> 3) + 1;
  if (v19 >> 61) {
    sub_226DB87BC();
  }
  uint64_t v20 = v10 - (void)v6;
  if (v20 >> 2 > v19) {
    unint64_t v19 = v20 >> 2;
  }
  if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v21 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v21 = v19;
  }
  unint64_t v76 = a1 + 2;
  if (v21)
  {
    if (v21 >> 61) {
      sub_226DB8864();
    }
    __int16 v22 = (char *)operator new(8 * v21);
  }
  else
  {
    __int16 v22 = 0;
  }
  uint64_t v72 = v22;
  unint64_t v73 = (unint64_t)&v22[8 * v8];
  v74 = (char *)v73;
  size_t v75 = &v22[8 * v21];
  sub_226DC52FC(&v72, a3);
  unint64_t v24 = v73;
  __int16 v25 = *a1;
  unint64_t v26 = v73;
  if (*a1 != v9)
  {
    unint64_t v27 = &v6[v7 & 0xFFFFFFFFFFFFFFF8] - v25 - 8;
    unint64_t v26 = v73;
    uint64_t v28 = v9;
    if (v27 < 0x88) {
      goto LABEL_74;
    }
    BOOL v29 = (unint64_t)&v6[(v7 & 0xFFFFFFFFFFFFFFF8) - (v27 & 0xFFFFFFFFFFFFFFF8) - 8] >= v73
       || v73 - (v27 & 0xFFFFFFFFFFFFFFF8) - 8 >= (unint64_t)v9;
    unint64_t v26 = v73;
    uint64_t v28 = v9;
    if (!v29) {
      goto LABEL_74;
    }
    uint64_t v30 = (v27 >> 3) + 1;
    uint64_t v31 = 8 * (v30 & 0x3FFFFFFFFFFFFFFCLL);
    unint64_t v26 = v73 - v31;
    uint64_t v28 = &v9[-v31];
    __int16 v32 = &v6[8 * v8 - 16];
    std::string::size_type v33 = (_OWORD *)(v73 - 16);
    uint64_t v34 = v30 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v36 = *((_OWORD *)v32 - 1);
      long long v35 = *(_OWORD *)v32;
      *((_OWORD *)v32 - 1) = 0uLL;
      *(_OWORD *)__int16 v32 = 0uLL;
      *(v33 - 1) = v36;
      *std::string::size_type v33 = v35;
      v32 -= 32;
      v33 -= 2;
      v34 -= 4;
    }
    while (v34);
    if (v30 != (v30 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_74:
      do
      {
        uint64_t v37 = *((void *)v28 - 1);
        v28 -= 8;
        *(void *)uint64_t v28 = 0;
        *(void *)(v26 - 8) = v37;
        v26 -= 8;
      }
      while (v28 != v25);
    }
  }
  unint64_t v73 = v26;
  __int16 v38 = a1[1];
  uint64_t v39 = v74;
  if (v38 != v9)
  {
    uint64_t v40 = &v6[v7 & 0xFFFFFFFFFFFFFFF8];
    unint64_t v41 = v38 - v40 - 8;
    if (v41 < 0x88) {
      goto LABEL_40;
    }
    unint64_t v42 = (unint64_t)&v40[(v41 & 0xFFFFFFFFFFFFFFF8) + 8];
    if (v9 < &v74[(v41 & 0xFFFFFFFFFFFFFFF8) + 8] && (unint64_t)v74 < v42) {
      goto LABEL_40;
    }
    uint64_t v44 = (v41 >> 3) + 1;
    uint64_t v45 = 8 * (v44 & 0x3FFFFFFFFFFFFFFCLL);
    v9 += v45;
    int v46 = &v74[v45];
    uint64_t v47 = v74 + 16;
    uint64_t v48 = &v6[8 * v8 + 16];
    uint64_t v49 = v44 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v50 = *((_OWORD *)v48 - 1);
      long long v51 = *(_OWORD *)v48;
      *((_OWORD *)v48 - 1) = 0uLL;
      *(_OWORD *)uint64_t v48 = 0uLL;
      *(v47 - 1) = v50;
      *uint64_t v47 = v51;
      v47 += 2;
      v48 += 32;
      v49 -= 4;
    }
    while (v49);
    uint64_t v39 = v46;
    if (v44 != (v44 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_40:
      int v46 = v39;
      do
      {
        uint64_t v52 = *(void *)v9;
        *(void *)std::string::size_type v9 = 0;
        v9 += 8;
        *(void *)int v46 = v52;
        v46 += 8;
      }
      while (v9 != v38);
    }
    unint64_t v26 = v73;
    std::string::size_type v9 = a1[1];
    uint64_t v39 = v46;
  }
  uint64_t v53 = *a1;
  *a1 = (char *)v26;
  a1[1] = v39;
  int v54 = a1[2];
  a1[2] = v75;
  v74 = v9;
  size_t v75 = v54;
  uint64_t v72 = v53;
  unint64_t v73 = (unint64_t)v53;
  if (v9 == v53)
  {
    if (!v9) {
      return (char *)v24;
    }
    goto LABEL_50;
  }
  do
  {
    v74 = v9 - 8;
    uint64_t v55 = *((void *)v9 - 1);
    *((void *)v9 - 1) = 0;
    if (v55) {
      (*(void (**)(uint64_t))(*(void *)v55 + 8))(v55);
    }
    std::string::size_type v9 = v74;
  }
  while (v74 != v53);
  std::string::size_type v9 = v72;
  if (v72) {
LABEL_50:
  }
    operator delete(v9);
  return (char *)v24;
}

void sub_226DC5098(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_226DC527C((uint64_t)va);
  _Unwind_Resume(a1);
}

void *sub_226DC50AC(void *a1, uint64_t *a2)
{
  uint64_t v3 = a1[1] - *a1;
  uint64_t v4 = v3 >> 3;
  unint64_t v5 = (v3 >> 3) + 1;
  if (v5 >> 61) {
    sub_226DB87BC();
  }
  uint64_t v7 = a1[2] - *a1;
  if (v7 >> 2 > v5) {
    unint64_t v5 = v7 >> 2;
  }
  if ((unint64_t)v7 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v8 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v8 = v5;
  }
  if (v8)
  {
    if (v8 >> 61) {
      sub_226DB8864();
    }
    std::string::size_type v9 = (char *)operator new(8 * v8);
  }
  else
  {
    std::string::size_type v9 = 0;
  }
  unint64_t v10 = &v9[8 * v4];
  uint64_t v11 = &v9[8 * v8];
  uint64_t v12 = *a2;
  *a2 = 0;
  *(void *)unint64_t v10 = v12;
  char v13 = v10 + 8;
  unint64_t v14 = (char *)*a1;
  unint64_t v15 = (char *)a1[1];
  if (v15 == (char *)*a1)
  {
    *a1 = v10;
    a1[1] = v13;
    a1[2] = v11;
    if (!v15) {
      return v13;
    }
    goto LABEL_26;
  }
  unint64_t v16 = (unint64_t)&v15[-*a1 - 8];
  if (v16 < 0x78 || &v15[-(v16 & 0xFFFFFFFFFFFFFFF8) - 8] < v10 && &v9[v3 - (v16 & 0xFFFFFFFFFFFFFFF8) - 8] < v15) {
    goto LABEL_34;
  }
  uint64_t v17 = (v16 >> 3) + 1;
  uint64_t v18 = 8 * (v17 & 0x3FFFFFFFFFFFFFFCLL);
  v10 -= v18;
  unint64_t v19 = &v15[-v18];
  uint64_t v20 = v15 - 16;
  unint64_t v21 = &v9[8 * v4 - 16];
  uint64_t v22 = v17 & 0x3FFFFFFFFFFFFFFCLL;
  do
  {
    long long v24 = *((_OWORD *)v20 - 1);
    long long v23 = *(_OWORD *)v20;
    *((_OWORD *)v20 - 1) = 0uLL;
    *(_OWORD *)uint64_t v20 = 0uLL;
    *((_OWORD *)v21 - 1) = v24;
    *(_OWORD *)unint64_t v21 = v23;
    v20 -= 32;
    v21 -= 32;
    v22 -= 4;
  }
  while (v22);
  unint64_t v15 = v19;
  if (v17 != (v17 & 0x3FFFFFFFFFFFFFFCLL))
  {
LABEL_34:
    do
    {
      uint64_t v25 = *((void *)v15 - 1);
      v15 -= 8;
      *(void *)unint64_t v15 = 0;
      *((void *)v10 - 1) = v25;
      v10 -= 8;
    }
    while (v15 != v14);
  }
  unint64_t v26 = (char *)*a1;
  unint64_t v15 = (char *)a1[1];
  *a1 = v10;
  a1[1] = v13;
  a1[2] = v11;
  if (v15 != v26)
  {
    do
    {
      uint64_t v28 = *((void *)v15 - 1);
      v15 -= 8;
      uint64_t v27 = v28;
      *(void *)unint64_t v15 = 0;
      if (v28) {
        (*(void (**)(uint64_t))(*(void *)v27 + 8))(v27);
      }
    }
    while (v15 != v26);
    unint64_t v15 = v26;
  }
  if (v15) {
LABEL_26:
  }
    operator delete(v15);
  return v13;
}

uint64_t sub_226DC527C(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
    uint64_t v4 = *(void *)(i - 8);
    *(void *)(i - 8) = 0;
    if (v4) {
      (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
    }
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_226DC52FC(char **a1, uint64_t *a2)
{
  uint64_t v4 = a1[2];
  if (v4 != a1[3]) {
    goto LABEL_24;
  }
  unint64_t v5 = *a1;
  std::string::size_type v6 = a1[1];
  if (v6 > *a1)
  {
    uint64_t v7 = (v6 - *a1) >> 3;
    if (v7 >= -1) {
      uint64_t v8 = v7 + 1;
    }
    else {
      uint64_t v8 = v7 + 2;
    }
    uint64_t v9 = v8 >> 1;
    uint64_t v10 = -v9;
    if (v6 == v4)
    {
      long long v23 = &v6[-8 * v9];
    }
    else
    {
      do
      {
        uint64_t v11 = *(void *)v6;
        *(void *)std::string::size_type v6 = 0;
        uint64_t v12 = *(void *)&v6[8 * v10];
        *(void *)&v6[8 * v10] = v11;
        if (v12) {
          (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
        }
        v6 += 8;
      }
      while (v6 != v4);
      uint64_t v4 = a1[1];
      long long v23 = &v6[8 * v10];
    }
    a1[1] = &v4[8 * v10];
    a1[2] = v23;
    uint64_t v4 = v23;
    goto LABEL_24;
  }
  unint64_t v13 = (v4 - v5) >> 2;
  if (v4 == v5) {
    unint64_t v13 = 1;
  }
  if (v13 >> 61) {
    sub_226DB8864();
  }
  unint64_t v14 = v13 >> 2;
  uint64_t v15 = 8 * v13;
  unint64_t v16 = (char *)operator new(8 * v13);
  uint64_t v17 = &v16[8 * v14];
  uint64_t v18 = &v16[v15];
  int64_t v19 = v4 - v6;
  if (v4 != v6)
  {
    uint64_t v20 = &v17[v19 & 0xFFFFFFFFFFFFFFF8];
    unint64_t v21 = v19 - 8;
    if ((unint64_t)(v19 - 8) >= 0x78)
    {
      unint64_t v25 = v19 & 0xFFFFFFFFFFFFFFF8;
      BOOL v26 = v6 >= &v16[8 * v14 + v25] || v17 >= &v6[v25];
      uint64_t v22 = &v16[8 * v14];
      if (v26)
      {
        uint64_t v27 = (v21 >> 3) + 1;
        uint64_t v28 = 8 * (v27 & 0x3FFFFFFFFFFFFFFCLL);
        uint64_t v22 = &v17[v28];
        BOOL v29 = &v6[v28];
        uint64_t v30 = (long long *)(v6 + 16);
        uint64_t v31 = &v16[8 * v14 + 16];
        uint64_t v32 = v27 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v33 = *(v30 - 1);
          long long v34 = *v30;
          *(v30 - 1) = 0uLL;
          *uint64_t v30 = 0uLL;
          *((_OWORD *)v31 - 1) = v33;
          *(_OWORD *)uint64_t v31 = v34;
          v30 += 2;
          v31 += 32;
          v32 -= 4;
        }
        while (v32);
        std::string::size_type v6 = v29;
        if (v27 == (v27 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_34:
          unint64_t v5 = *a1;
          long long v36 = a1[1];
          uint64_t v37 = a1[2];
          *a1 = v16;
          a1[1] = v17;
          a1[2] = v20;
          a1[3] = v18;
          while (v37 != v36)
          {
            uint64_t v39 = *((void *)v37 - 1);
            v37 -= 8;
            uint64_t v38 = v39;
            *(void *)uint64_t v37 = 0;
            if (v39) {
              (*(void (**)(uint64_t))(*(void *)v38 + 8))(v38);
            }
          }
          goto LABEL_21;
        }
      }
    }
    else
    {
      uint64_t v22 = &v16[8 * v14];
    }
    do
    {
      uint64_t v35 = *(void *)v6;
      *(void *)std::string::size_type v6 = 0;
      v6 += 8;
      *(void *)uint64_t v22 = v35;
      v22 += 8;
    }
    while (v22 != v20);
    goto LABEL_34;
  }
  *a1 = v16;
  a1[1] = v17;
  a1[2] = v17;
  a1[3] = v18;
LABEL_21:
  if (v5) {
    operator delete(v5);
  }
  uint64_t v4 = a1[2];
LABEL_24:
  uint64_t v24 = *a2;
  *a2 = 0;
  *(void *)uint64_t v4 = v24;
  a1[2] += 8;
}

uint64_t sub_226DC5538(uint64_t (**a1)(uint64_t), uint64_t a2)
{
  return (*a1)(a2);
}

void *sub_226DC5544@<X0>(void *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3 = result;
  std::string::size_type v6 = *(unsigned int *)(a2 + 16);
  std::string::size_type v5 = *(unsigned int *)(a2 + 20);
  if (__CFADD__(v6, v5))
  {
    sub_226DC3E34(result, a2, (char *)&v26);
    uint64_t v7 = std::string::insert(&v26, 0, "section ");
    long long v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    v21.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v21.__r_.__value_.__l.__data_ = v8;
    v7->__r_.__value_.__l.__size_ = 0;
    v7->__r_.__value_.__r.__words[2] = 0;
    v7->__r_.__value_.__r.__words[0] = 0;
    uint64_t v9 = std::string::append(&v21, " has a sh_offset (0x");
    long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
    uint64_t v24 = (const char *)v9->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v10;
    v9->__r_.__value_.__l.__size_ = 0;
    v9->__r_.__value_.__r.__words[2] = 0;
    v9->__r_.__value_.__r.__words[0] = 0;
    v20.__r_.__value_.__r.__words[0] = v6;
    v27[0] = __p;
    uint64_t v28 = &v20;
    __int16 v29 = 3588;
    v30[0] = v27;
    uint64_t v31 = ") + sh_size (0x";
    __int16 v32 = 770;
    v19.__r_.__value_.__r.__words[0] = v5;
    v33[0] = v30;
    long long v34 = &v19;
    __int16 v35 = 3586;
    long long v36 = v33;
    uint64_t v37 = ") that cannot be represented";
    __int16 v38 = 770;
    operator new();
  }
  if (result[1] < (unint64_t)(v5 + v6))
  {
    sub_226DC3E34(result, a2, (char *)&v19);
    uint64_t v11 = std::string::insert(&v19, 0, "section ");
    long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
    v20.__r_.__value_.__r.__words[2] = v11->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v20.__r_.__value_.__l.__data_ = v12;
    v11->__r_.__value_.__l.__size_ = 0;
    v11->__r_.__value_.__r.__words[2] = 0;
    v11->__r_.__value_.__r.__words[0] = 0;
    unint64_t v13 = std::string::append(&v20, " has a sh_offset (0x");
    long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
    v26.__r_.__value_.__r.__words[2] = v13->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v26.__r_.__value_.__l.__data_ = v14;
    v13->__r_.__value_.__l.__size_ = 0;
    v13->__r_.__value_.__r.__words[2] = 0;
    v13->__r_.__value_.__r.__words[0] = 0;
    std::string::size_type v17 = v5;
    std::string::size_type v18 = v6;
    v21.__r_.__value_.__r.__words[0] = (std::string::size_type)&v26;
    v21.__r_.__value_.__r.__words[2] = (std::string::size_type)&v18;
    __int16 v22 = 3588;
    __p[0] = &v21;
    uint64_t v24 = ") + sh_size (0x";
    __int16 v25 = 770;
    v27[0] = __p;
    uint64_t v28 = (std::string *)&v17;
    __int16 v29 = 3586;
    v30[0] = v27;
    uint64_t v31 = ") that is greater than the file size (0x";
    __int16 v32 = 770;
    uint64_t v16 = v3[1];
    v33[0] = v30;
    long long v34 = (std::string *)&v16;
    __int16 v35 = 3586;
    long long v36 = v33;
    uint64_t v37 = ")";
    __int16 v38 = 770;
    operator new();
  }
  std::string::size_type v15 = *result + v6;
  *(unsigned char *)(a3 + 16) &= ~1u;
  *(void *)a3 = v15;
  *(void *)(a3 + 8) = v5;
  return result;
}

void sub_226DC58BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,void *__p,uint64_t a44,int a45,__int16 a46,char a47,char a48)
{
  MEMORY[0x22A669B00](v48, 0x10F3C401C2224D9);
  if (a48 < 0)
  {
    operator delete(__p);
    if (a23 < 0)
    {
LABEL_5:
      operator delete(a18);
      if ((a17 & 0x80000000) == 0) {
LABEL_9:
      }
        _Unwind_Resume(a1);
LABEL_8:
      operator delete(a12);
      goto LABEL_9;
    }
  }
  else if (a23 < 0)
  {
    goto LABEL_5;
  }
  if ((a17 & 0x80000000) == 0) {
    goto LABEL_9;
  }
  goto LABEL_8;
}

void sub_226DC59DC(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = (const void **)a1;
  uint64_t v50 = *MEMORY[0x263EF8340];
  std::string::size_type v6 = (void *)(a1 + 32);
  sub_226DC2E24((void *)(a1 + 32), (uint64_t)&v39);
  uint64_t v7 = v39;
  if (v41)
  {
    int v21 = 0;
    uint64_t v39 = 0;
    *(unsigned char *)(a3 + 16) |= 1u;
    *(void *)a3 = v7;
    goto LABEL_32;
  }
  if (!v40) {
    goto LABEL_41;
  }
  long long v8 = &v39[10 * v40];
  int v9 = *(unsigned __int8 *)(a3 + 16);
  __int16 v35 = a2;
  uint64_t v36 = a3;
  long long v33 = v8;
  long long v34 = v4;
  while (v7[1] != 2)
  {
LABEL_5:
    v7 += 10;
    if (v7 == v8)
    {
      int v21 = 1;
      if (v41) {
        goto LABEL_32;
      }
      goto LABEL_40;
    }
  }
  sub_226DC5F30(v6, (uint64_t)v7, (uint64_t)&__dst);
  if (v49)
  {
    int v21 = 0;
    long long v23 = __dst;
    *(unsigned char *)(a3 + 16) |= 1u;
    *(void *)a3 = v23;
    if (v41) {
      goto LABEL_32;
    }
LABEL_40:
    if (!v21) {
      return;
    }
LABEL_41:
    int v24 = *((char *)v4 + 23);
    if (v24 >= 0) {
      size_t v25 = *((unsigned __int8 *)v4 + 23);
    }
    else {
      size_t v25 = (size_t)v4[1];
    }
    unint64_t v26 = v25 + 22;
    if (v25 + 22 >= 0x7FFFFFFFFFFFFFF8) {
      sub_226DBC384();
    }
    if (v26 >= 0x17)
    {
      uint64_t v28 = (v26 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v26 | 7) != 0x17) {
        uint64_t v28 = v26 | 7;
      }
      uint64_t v29 = v28 + 1;
      p_dst = operator new(v28 + 1);
      unint64_t v48 = v25 + 22;
      unint64_t v49 = v29 | 0x8000000000000000;
      __dst = p_dst;
    }
    else
    {
      unint64_t v48 = 0;
      unint64_t v49 = 0;
      __dst = 0;
      p_dst = &__dst;
      HIBYTE(v49) = v25 + 22;
      if (!v25) {
        goto LABEL_55;
      }
    }
    if (v24 >= 0) {
      uint64_t v30 = v4;
    }
    else {
      uint64_t v30 = *v4;
    }
    memmove(p_dst, v30, v25);
LABEL_55:
    strcpy((char *)p_dst + v25, ": function not found: ");
    uint64_t v31 = (const void *)*a2;
    uint64_t v32 = a2[1];
    uint64_t v39 = (unsigned int *)&__dst;
    unint64_t v41 = v31;
    uint64_t v42 = v32;
    __int16 v43 = 1284;
    operator new();
  }
  sub_226DC619C(v6, v7, (uint64_t)&v44);
  long long v10 = v44;
  if (v46)
  {
    char v17 = 0;
    uint64_t v44 = 0;
    v9 |= 1u;
    *(unsigned char *)(a3 + 16) = v9;
    *(void *)a3 = v10;
    if ((v46 & 1) == 0) {
      goto LABEL_28;
    }
    goto LABEL_26;
  }
  if (!v45)
  {
    char v17 = 1;
    if ((v46 & 1) == 0) {
      goto LABEL_28;
    }
    goto LABEL_26;
  }
  long long v12 = (const char *)__dst;
  unint64_t v11 = v48;
  uint64_t v13 = 16 * v45;
  long long v14 = (const void *)*a2;
  uint64_t v15 = a2[1];
  do
  {
    v38[0] = *v10;
    if (v11 <= v38[0])
    {
      uint64_t v18 = sub_226DCA1EC();
      unint64_t v37 = v11;
      sub_226DC694C(3, v18, (uint64_t)"st_name (0x%x) is past the end of the string table of size 0x%zx", (int *)v38, (uint64_t *)&v37);
    }
    if (v12)
    {
      size_t v16 = strlen(&v12[v38[0]]);
      if (v16 == v15 && (!v16 || !memcmp(&v12[v38[0]], v14, v16)))
      {
LABEL_18:
        char v17 = 0;
        v9 &= ~1u;
        a3 = v36;
        *(unsigned char *)(v36 + 16) = v9;
        *(_OWORD *)uint64_t v36 = *(_OWORD *)v10;
        goto LABEL_25;
      }
    }
    else if (!v15)
    {
      goto LABEL_18;
    }
    v10 += 4;
    v13 -= 16;
  }
  while (v13);
  char v17 = 1;
  a3 = v36;
LABEL_25:
  uint64_t v4 = v34;
  a2 = v35;
  long long v8 = v33;
  if (v46)
  {
LABEL_26:
    std::string v19 = v44;
    uint64_t v44 = 0;
    if (v19) {
      (*(void (**)(int *))(*(void *)v19 + 8))(v19);
    }
  }
LABEL_28:
  if (v49)
  {
    std::string v20 = __dst;
    __dst = 0;
    if (v20) {
      (*(void (**)(void *))(*v20 + 8))(v20);
    }
  }
  if (v17) {
    goto LABEL_5;
  }
  int v21 = 0;
  if ((v41 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_32:
  __int16 v22 = v39;
  uint64_t v39 = 0;
  if (!v22) {
    goto LABEL_40;
  }
  (*(void (**)(unsigned int *))(*(void *)v22 + 8))(v22);
  if (v21) {
    goto LABEL_41;
  }
}

void sub_226DC5E28(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, _Unwind_Exception *a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  unint64_t v26 = exception_object;
  if (a25)
  {
    sub_226DD278C(&a23, (uint64_t)exception_object, a2, (uint64_t)&a16);
    unint64_t v26 = a16;
  }
  if (*(unsigned char *)(v25 - 104))
  {
    uint64_t v27 = *(void *)(v25 - 120);
    *(void *)(v25 - 120) = 0;
    if (v27) {
      (*(void (**)(uint64_t))(*(void *)v27 + 8))(v27);
    }
  }
  if (a20)
  {
    uint64_t v28 = a18;
    a18 = 0;
    if (v28)
    {
      (*(void (**)(uint64_t))(*(void *)v28 + 8))(v28);
      _Unwind_Resume(v26);
    }
  }
  _Unwind_Resume(v26);
}

void sub_226DC5F30(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  sub_226DC2E24(a1, (uint64_t)v8);
  if (v9)
  {
    uint64_t v7 = v8[0];
    v8[0] = 0;
    *(unsigned char *)(a3 + 16) |= 1u;
    *(void *)a3 = v7;
  }
  else
  {
    sub_226DC603C(a1, a2, v8[0], v8[1], a3);
    if (v9)
    {
      uint64_t v6 = v8[0];
      v8[0] = 0;
      if (v6) {
        (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
      }
    }
  }
}

void sub_226DC6018(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  if (a11) {
    sub_226DD2924(&a9);
  }
  _Unwind_Resume(exception_object);
}

void sub_226DC603C(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  int v6 = *(_DWORD *)(a2 + 4);
  if (v6 != 2 && v6 != 11)
  {
    v9[0] = "invalid sh_type for symbol table, expected SHT_SYMTAB or SHT_DYNSYM";
    __int16 v10 = 259;
    operator new();
  }
  unint64_t v8 = *(unsigned int *)(a2 + 24);
  if (a4 <= v8)
  {
    v9[0] = "invalid section index: ";
    void v9[2] = v8;
    __int16 v10 = 2051;
    operator new();
  }
  v9[0] = sub_226DC3210;
  sub_226DC3870(a1, a3 + 40 * v8, (void (*)(uint64_t *__return_ptr, uint64_t, void ***))sub_226DC5538, (uint64_t)v9, a5);
}

void sub_226DC616C(_Unwind_Exception *a1)
{
  MEMORY[0x22A669B00](v1, 0x10F3C401C2224D9);
  _Unwind_Resume(a1);
}

void *sub_226DC619C@<X0>(void *result@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = result;
  if (a2[9] != 16)
  {
    sub_226DC3E34(result, (uint64_t)a2, (char *)&v32);
    long long v12 = std::string::insert(&v32, 0, "section ");
    long long v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
    v34.__r_.__value_.__r.__words[2] = v12->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v34.__r_.__value_.__l.__data_ = v13;
    v12->__r_.__value_.__l.__size_ = 0;
    v12->__r_.__value_.__r.__words[2] = 0;
    v12->__r_.__value_.__r.__words[0] = 0;
    long long v14 = std::string::append(&v34, " has invalid sh_entsize: expected ");
    long long v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
    __int16 v38 = (std::string *)v14->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v15;
    v14->__r_.__value_.__l.__size_ = 0;
    v14->__r_.__value_.__r.__words[2] = 0;
    v14->__r_.__value_.__r.__words[0] = 0;
    v36.__r_.__value_.__r.__words[0] = 16;
    v40[0] = __p;
    unint64_t v41 = &v36;
    __int16 v42 = 2564;
    v43[0] = v40;
    uint64_t v44 = (std::string *)", but got ";
    __int16 v45 = 770;
    size_t v16 = (const char *)a2[9];
    char v46 = v43;
    uint64_t v47 = v16;
    __int16 v48 = 2050;
    operator new();
  }
  std::string::size_type v6 = a2[5];
  if ((v6 & 0xF) != 0)
  {
    sub_226DC3E34(result, (uint64_t)a2, (char *)&v36);
    uint64_t v7 = std::string::insert(&v36, 0, "section ");
    long long v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    v32.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v32.__r_.__value_.__l.__data_ = v8;
    v7->__r_.__value_.__l.__size_ = 0;
    v7->__r_.__value_.__r.__words[2] = 0;
    v7->__r_.__value_.__r.__words[0] = 0;
    char v9 = std::string::append(&v32, " has an invalid sh_size (");
    long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
    v34.__r_.__value_.__r.__words[2] = v9->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v34.__r_.__value_.__l.__data_ = v10;
    v9->__r_.__value_.__l.__size_ = 0;
    v9->__r_.__value_.__r.__words[2] = 0;
    v9->__r_.__value_.__r.__words[0] = 0;
    __p[0] = &v34;
    __int16 v38 = (std::string *)v6;
    __int16 v39 = 2052;
    v40[0] = __p;
    unint64_t v41 = (std::string *)") which is not a multiple of its sh_entsize (";
    __int16 v42 = 770;
    unint64_t v11 = (std::string *)a2[9];
    v43[0] = v40;
    uint64_t v44 = v11;
    __int16 v45 = 2050;
    char v46 = v43;
    uint64_t v47 = ")";
    __int16 v48 = 770;
    operator new();
  }
  std::string::size_type v17 = a2[4];
  if (__CFADD__(v17, v6))
  {
    sub_226DC3E34(result, (uint64_t)a2, (char *)&v36);
    uint64_t v18 = std::string::insert(&v36, 0, "section ");
    long long v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
    v32.__r_.__value_.__r.__words[2] = v18->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v32.__r_.__value_.__l.__data_ = v19;
    v18->__r_.__value_.__l.__size_ = 0;
    v18->__r_.__value_.__r.__words[2] = 0;
    v18->__r_.__value_.__r.__words[0] = 0;
    std::string v20 = std::string::append(&v32, " has a sh_offset (0x");
    long long v21 = *(_OWORD *)&v20->__r_.__value_.__l.__data_;
    v34.__r_.__value_.__r.__words[2] = v20->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v34.__r_.__value_.__l.__data_ = v21;
    v20->__r_.__value_.__l.__size_ = 0;
    v20->__r_.__value_.__r.__words[2] = 0;
    v20->__r_.__value_.__r.__words[0] = 0;
    v31.__r_.__value_.__r.__words[0] = v17;
    __p[0] = &v34;
    __int16 v38 = &v31;
    __int16 v39 = 3588;
    v40[0] = __p;
    unint64_t v41 = (std::string *)") + sh_size (0x";
    __int16 v42 = 770;
    v30.__r_.__value_.__r.__words[0] = v6;
    v43[0] = v40;
    uint64_t v44 = &v30;
    __int16 v45 = 3586;
    char v46 = v43;
    uint64_t v47 = ") that cannot be represented";
    __int16 v48 = 770;
    operator new();
  }
  if (result[1] < (unint64_t)(v6 + v17))
  {
    sub_226DC3E34(result, (uint64_t)a2, (char *)&v30);
    __int16 v22 = std::string::insert(&v30, 0, "section ");
    long long v23 = *(_OWORD *)&v22->__r_.__value_.__l.__data_;
    v31.__r_.__value_.__r.__words[2] = v22->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v31.__r_.__value_.__l.__data_ = v23;
    v22->__r_.__value_.__l.__size_ = 0;
    v22->__r_.__value_.__r.__words[2] = 0;
    v22->__r_.__value_.__r.__words[0] = 0;
    int v24 = std::string::append(&v31, " has a sh_offset (0x");
    long long v25 = *(_OWORD *)&v24->__r_.__value_.__l.__data_;
    v36.__r_.__value_.__r.__words[2] = v24->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v36.__r_.__value_.__l.__data_ = v25;
    v24->__r_.__value_.__l.__size_ = 0;
    v24->__r_.__value_.__r.__words[2] = 0;
    v24->__r_.__value_.__r.__words[0] = 0;
    std::string::size_type v28 = v6;
    std::string::size_type v29 = v17;
    v32.__r_.__value_.__r.__words[0] = (std::string::size_type)&v36;
    v32.__r_.__value_.__r.__words[2] = (std::string::size_type)&v29;
    __int16 v33 = 3588;
    v34.__r_.__value_.__r.__words[0] = (std::string::size_type)&v32;
    v34.__r_.__value_.__r.__words[2] = (std::string::size_type)") + sh_size (0x";
    __int16 v35 = 770;
    __p[0] = &v34;
    __int16 v38 = (std::string *)&v28;
    __int16 v39 = 3586;
    v40[0] = __p;
    unint64_t v41 = (std::string *)") that is greater than the file size (0x";
    __int16 v42 = 770;
    uint64_t v27 = v4[1];
    v43[0] = v40;
    uint64_t v44 = (std::string *)&v27;
    __int16 v45 = 3586;
    char v46 = v43;
    uint64_t v47 = ")";
    __int16 v48 = 770;
    operator new();
  }
  std::string::size_type v26 = *result + v17;
  *(unsigned char *)(a3 + 16) &= ~1u;
  *(void *)a3 = v26;
  *(void *)(a3 + 8) = v6 >> 4;
  return result;
}

void sub_226DC6774(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,void *__p,uint64_t a44,int a45,__int16 a46,char a47,char a48,uint64_t a49,void *a50,uint64_t a51,int a52,__int16 a53,char a54,char a55)
{
  MEMORY[0x22A669B00](v55, 0x10F3C401C2224D9);
  if (a48 < 0)
  {
    operator delete(__p);
    if (a23 < 0)
    {
LABEL_5:
      operator delete(a18);
      if ((a17 & 0x80000000) == 0) {
LABEL_9:
      }
        _Unwind_Resume(a1);
LABEL_8:
      operator delete(a12);
      goto LABEL_9;
    }
  }
  else if (a23 < 0)
  {
    goto LABEL_5;
  }
  if ((a17 & 0x80000000) == 0) {
    goto LABEL_9;
  }
  goto LABEL_8;
}

void sub_226DC693C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    JUMPOUT(0x226DC692CLL);
  }
  JUMPOUT(0x226DC6934);
}

void sub_226DC694C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t *a5)
{
  memset(__p, 0, sizeof(__p));
  int v11 = 0;
  char v15 = 0;
  uint64_t v16 = 0;
  int v17 = 1;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v12 = 0;
  long long v10 = &unk_26DAEFD10;
  uint64_t v18 = __p;
  sub_226DD0120((uint64_t)&v10, 0, 0, 0);
  int v8 = *a4;
  uint64_t v9 = *a5;
  v20[0] = &unk_26DAEF7E0;
  v20[1] = a3;
  int v21 = v8;
  uint64_t v22 = v9;
  sub_226DD0220((uint64_t)&v10, (uint64_t)v20);
  operator new();
}

void sub_226DC6AA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  MEMORY[0x22A669B00](v24, 0x10F3C401C2224D9);
  sub_226DCFF84((uint64_t)&a10);
  if (a24 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_226DC6AF0(uint64_t a1, char *__str, size_t __size)
{
  return snprintf(__str, __size, *(const char **)(a1 + 8), *(unsigned int *)(a1 + 16), *(void *)(a1 + 24));
}

void sub_226DC6B2C(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DAEF818;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_226DC6B4C(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DAEF818;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x22A669B00);
}

void sub_226DC6BA0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  *(void *)(a1 + 48) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  if (*(char *)(a1 + 47) < 0)
  {
    uint64_t v3 = *(void **)(a1 + 24);
    operator delete(v3);
  }
}

uint64_t sub_226DC6C28(uint64_t *a1)
{
  uint64_t result = *a1;
  *a1 = 0;
  return result;
}

uint64_t sub_226DC6C38(uint64_t a1)
{
  if (**(void **)(a1 + 32))
  {
    uint64_t FigBaseObject = FigCaptureDeviceGetFigBaseObject();
    if (FigBaseObject)
    {
      uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v3)
      {
        uint64_t v4 = *(void (**)(uint64_t))(v3 + 24);
        if (!v4) {
          goto LABEL_9;
        }
LABEL_7:
        if (v4) {
          v4(FigBaseObject);
        }
        goto LABEL_9;
      }
      uint64_t v4 = (void (*)(uint64_t))MEMORY[0x18];
      if (MEMORY[0x18]) {
        goto LABEL_7;
      }
    }
LABEL_9:
    CFRelease(**(CFTypeRef **)(a1 + 32));
    **(void **)(a1 + 32) = 0;
  }
  CMNotificationCenterGetDefaultLocalCenter();
  if (!CMNotificationCenterRemoveListener()
    || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(void *)(a1 + 32) = 0;
    if (!v5) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  sub_226DD2960();
  uint64_t v5 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = 0;
  if (v5) {
LABEL_13:
  }
    MEMORY[0x22A669B00](v5, 0x1020C403A5D3213);
LABEL_14:
  uint64_t v6 = *(void *)(a1 + 24);
  if (v6 == a1)
  {
    (*(void (**)(uint64_t))(*(void *)a1 + 32))(a1);
    return a1;
  }
  else
  {
    if (v6) {
      (*(void (**)(uint64_t))(*(void *)v6 + 40))(v6);
    }
    return a1;
  }
}

void sub_226DC6DF8(int a1, uint64_t a2, CFTypeRef cf2)
{
  if (CFEqual((CFTypeRef)*MEMORY[0x263F2C128], cf2))
  {
    int v23 = 1;
    uint64_t v5 = *(void *)(a2 + 24);
    if (v5)
    {
      (*(void (**)(uint64_t, int *))(*(void *)v5 + 48))(v5, &v23);
      return;
    }
    BOOL v7 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v7) {
LABEL_13:
    }
      sub_226DD2A10(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  else if (CFEqual((CFTypeRef)*MEMORY[0x263F2C120], cf2))
  {
    int v24 = 2;
    uint64_t v6 = *(void *)(a2 + 24);
    if (v6)
    {
      (*(void (**)(uint64_t, int *))(*(void *)v6 + 48))(v6, &v24);
      return;
    }
    BOOL v7 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v7) {
      goto LABEL_13;
    }
  }
  else
  {
    BOOL v15 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v15) {
      sub_226DD29D4(v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
}

BOOL sub_226DC6F4C(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  mach_port_t v2 = *MEMORY[0x263F0EC88];
  int v3 = 4;
  uint64_t v4 = *MEMORY[0x263EFFB08];
  uint64_t v5 = &_os_log_internal;
  while (1)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    CFTypeRef cf = 0;
    CFDictionaryRef v7 = IOServiceMatching("AppleH16CamIn");
    if (IOServiceGetMatchingService(v2, v7))
    {
      uint64_t v8 = dlopen("/System/Library/MediaCapture/H16ISP.mediacapture", 4);
      if (v8
        && (uint64_t v9 = (uint64_t (*)(uint64_t, void, CFTypeRef *))dlsym(v8, "H16ISPCaptureDeviceCreate")) != 0)
      {
        int v10 = v9(v4, 0, &cf);
        CFTypeRef v11 = cf;
        if (cf) {
          goto LABEL_8;
        }
      }
      else
      {
        int v10 = 0;
        CFTypeRef v11 = cf;
        if (cf)
        {
LABEL_8:
          uint64_t v12 = 0;
          goto LABEL_30;
        }
      }
    }
    else
    {
      int v10 = 0;
    }
    CFDictionaryRef v13 = IOServiceMatching("AppleH13CamIn");
    if (IOServiceGetMatchingService(v2, v13))
    {
      uint64_t v14 = dlopen("/System/Library/MediaCapture/H13ISP.mediacapture", 4);
      if (v14
        && (BOOL v15 = (uint64_t (*)(uint64_t, void, CFTypeRef *))dlsym(v14, "H13ISPCaptureDeviceCreate")) != 0)
      {
        int v10 = v15(v4, 0, &cf);
        CFTypeRef v11 = cf;
        if (cf) {
          goto LABEL_25;
        }
      }
      else
      {
        int v10 = 0;
        CFTypeRef v11 = cf;
        if (cf)
        {
LABEL_25:
          uint64_t v12 = 1;
          goto LABEL_30;
        }
      }
    }
    CFDictionaryRef v16 = IOServiceMatching("AppleH10CamIn");
    if (IOServiceGetMatchingService(v2, v16))
    {
      uint64_t v17 = dlopen("/System/Library/MediaCapture/H10ISP.mediacapture", 4);
      if (v17
        && (uint64_t v18 = (uint64_t (*)(uint64_t, void, CFTypeRef *))dlsym(v17, "H10ISPCaptureDeviceCreate")) != 0)
      {
        int v10 = v18(v4, 0, &cf);
        CFTypeRef v11 = cf;
        if (cf) {
          goto LABEL_27;
        }
      }
      else
      {
        int v10 = 0;
        CFTypeRef v11 = cf;
        if (cf)
        {
LABEL_27:
          uint64_t v12 = 2;
          goto LABEL_30;
        }
      }
    }
    CFDictionaryRef v19 = IOServiceMatching("AppleH9CamIn");
    if (IOServiceGetMatchingService(v2, v19))
    {
      uint64_t v20 = dlopen("/System/Library/MediaCapture/H9ISP.mediacapture", 4);
      if (v20
        && (uint64_t v21 = (uint64_t (*)(uint64_t, void, CFTypeRef *))dlsym(v20, "H9ISPCaptureDeviceCreate")) != 0)
      {
        int v10 = v21(v4, 0, &cf);
        CFTypeRef v11 = cf;
        if (!cf)
        {
LABEL_22:
          if (!v6) {
            goto LABEL_32;
          }
          CFTypeRef v11 = 0;
          goto LABEL_31;
        }
      }
      else
      {
        int v10 = 0;
        CFTypeRef v11 = cf;
        if (!cf) {
          goto LABEL_22;
        }
      }
      uint64_t v12 = 3;
LABEL_30:
      *(_DWORD *)(v6 + 8) = off_2647E6C70[4 * v12 + 3];
LABEL_31:
      *(void *)uint64_t v6 = v11;
      goto LABEL_32;
    }
    CFTypeRef v11 = cf;
    if (v6) {
      goto LABEL_31;
    }
    if (cf) {
      CFRelease(cf);
    }
LABEL_32:
    if (v10 != -536870186) {
      break;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      sub_226DD2ABC(v24, v3 - 2, &v25);
      if (--v3 <= 1) {
        goto LABEL_43;
      }
    }
    else if (--v3 <= 1)
    {
      goto LABEL_43;
    }
  }
  if (!v10)
  {
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener();
    return **(void **)(a1 + 32) != 0;
  }
LABEL_43:
  BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
  if (result)
  {
    sub_226DD2A4C();
    return 0;
  }
  return result;
}

void sub_226DC72EC(int a1@<W0>, uint64_t *a2@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26815DB30, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26815DB30))
  {
    __cxa_atexit((void (*)(void *))sub_226DC7608, &qword_26815DB38, &dword_226DAE000);
    __cxa_guard_release(&qword_26815DB30);
  }
  if (!qword_26815DB40
    || (uint64_t v4 = std::__shared_weak_count::lock((std::__shared_weak_count *)qword_26815DB40)) == 0
    || (uint64_t v5 = qword_26815DB38) == 0)
  {
    operator new();
  }
  uint64_t v6 = v4;
  if (**(void **)(qword_26815DB38 + 32)) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = a1 == 0;
  }
  if (v7 || sub_226DC6F4C(qword_26815DB38))
  {
    *a2 = v5;
    a2[1] = (uint64_t)v6;
  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

void sub_226DC756C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_226DBECCC((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_226DC7580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
}

void sub_226DC759C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  uint64_t v5 = sub_226DC6C38(v3);
  MEMORY[0x22A669B00](v5, 0x1020C40BD065CB0);
  sub_226DBECCC((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_226DC75F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_226DBECCC((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_226DC7608(uint64_t a1)
{
  mach_port_t v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  return a1;
}

uint64_t sub_226DC7638(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v7 = 0;
  if (!**(void **)(a1 + 32)) {
    return 0;
  }
  uint64_t v8 = *MEMORY[0x263F2C1B8];
  v9[0] = &unk_26DAF0488;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  uint64_t v3 = **(void **)(a1 + 32);
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4)
  {
    uint64_t v5 = *(unsigned int (**)(uint64_t, void, uint64_t, uint64_t *))(v4 + 8);
    if (!v5) {
      return 0;
    }
  }
  else
  {
    uint64_t v5 = (unsigned int (*)(uint64_t, void, uint64_t, uint64_t *))MEMORY[8];
    if (!MEMORY[8]) {
      return 0;
    }
  }
  if (!v5) {
    return 0;
  }
  if (v5(v3, *MEMORY[0x263EFFB08], v2, &v7)) {
    return 0;
  }
  else {
    return v7;
  }
}

uint64_t sub_226DC779C(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)a2[3];
  if (v3)
  {
    if (v3 == a2)
    {
      uint64_t v6 = v5;
      (*(void (**)(void *, void *))(*a2 + 24))(a2, v5);
    }
    else
    {
      uint64_t v6 = (void *)(*(uint64_t (**)(void *))(*v3 + 16))(v3);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  sub_226DC854C(v5, a1);
  uint64_t result = (uint64_t)v6;
  if (v6 == v5) {
    return (*(uint64_t (**)(void *))(v5[0] + 32))(v5);
  }
  if (v6) {
    return (*(uint64_t (**)(void))(*v6 + 40))();
  }
  return result;
}

BOOL sub_226DC78DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4)
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t, void, id))(v4 + 56);
    if (!v5) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v5 = (uint64_t (*)(uint64_t, void, id))MEMORY[0x38];
    if (!MEMORY[0x38])
    {
LABEL_7:
      int v6 = -12782;
      goto LABEL_8;
    }
  }
  if (!v5) {
    goto LABEL_7;
  }
  int v6 = v5(a1, *MEMORY[0x263F2C220], v3);
LABEL_8:
  BOOL v7 = v6 == 0;

  return v7;
}

void sub_226DC79B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_226DC79C4(uint64_t a1)
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v16 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_226DC7B88;
  v10[3] = &unk_2647E6C50;
  uint64_t v12 = &v13;
  id v3 = v2;
  CFTypeRef v11 = v3;
  uint64_t v4 = v10;
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5)
  {
    int v6 = *(uint64_t (**)(uint64_t, void *))(v5 + 8);
    if (!v6) {
      goto LABEL_9;
    }
  }
  else
  {
    int v6 = (uint64_t (*)(uint64_t, void *))MEMORY[8];
    if (!MEMORY[8])
    {
LABEL_9:

LABEL_10:
      BOOL v8 = 0;
      goto LABEL_11;
    }
  }
  if (!v6) {
    goto LABEL_9;
  }
  int v7 = v6(a1, v4);

  if (v7 == -12780)
  {
    BOOL v8 = 1;
    goto LABEL_11;
  }
  if (v7) {
    goto LABEL_10;
  }
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  BOOL v8 = *((_DWORD *)v14 + 6) == 0;
LABEL_11:

  _Block_object_dispose(&v13, 8);
  return v8;
}

void sub_226DC7B60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_226DC7B88(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_226DC7B9C(const void *a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v2)
  {
    id v3 = *(unsigned int (**)(const void *))(v2 + 24);
    if (!v3) {
      goto LABEL_12;
    }
  }
  else
  {
    id v3 = (unsigned int (*)(const void *))MEMORY[0x18];
    if (!MEMORY[0x18]) {
      goto LABEL_12;
    }
  }
  if (v3 && !v3(a1))
  {
    uint64_t v5 = 1;
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      goto LABEL_14;
    }
    goto LABEL_10;
  }
LABEL_12:
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_226DD2BC4();
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6)
    {
LABEL_14:
      int v7 = *(unsigned int (**)(const void *))(v6 + 24);
      if (!v7) {
        goto LABEL_20;
      }
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      goto LABEL_14;
    }
  }
LABEL_10:
  int v7 = (unsigned int (*)(const void *))MEMORY[0x18];
  if (!MEMORY[0x18])
  {
LABEL_20:
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    goto LABEL_21;
  }
LABEL_15:
  if (!v7) {
    goto LABEL_20;
  }
  if (v7(a1))
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
LABEL_18:
      uint64_t v5 = 0;
      goto LABEL_19;
    }
LABEL_21:
    sub_226DD2B50();
    goto LABEL_18;
  }
LABEL_19:
  CFRelease(a1);
  return v5;
}

BOOL sub_226DC7D94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  kdebug_trace();
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7)
  {
    BOOL v8 = *(uint64_t (**)(uint64_t, void, void, uint64_t, uint64_t, void))(v7 + 16);
    if (!v8) {
      goto LABEL_29;
    }
  }
  else
  {
    BOOL v8 = (uint64_t (*)(uint64_t, void, void, uint64_t, uint64_t, void))MEMORY[0x10];
    if (!MEMORY[0x10]) {
      goto LABEL_29;
    }
  }
  if (v8)
  {
    int v9 = v8(a2, 0, 0, a3, a4, 0);
    kdebug_trace();
    if (v9)
    {
      kdebug_trace();
      if ((v9 + 12788) <= 8)
      {
        if (((1 << (v9 - 12)) & 0x1DB) != 0) {
          goto LABEL_30;
        }
        unsigned int v10 = 0;
        CFTypeRef v11 = &_os_log_internal;
        while (1)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            sub_226DD2D18(v17, v9, &v18);
            usleep(0x3E8u);
            uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 16);
            if (v12)
            {
LABEL_12:
              uint64_t v13 = *(uint64_t (**)(uint64_t, void, void, uint64_t, uint64_t, void))(v12 + 16);
              if (!v13) {
                goto LABEL_18;
              }
              goto LABEL_16;
            }
          }
          else
          {
            usleep(0x3E8u);
            uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 16);
            if (v12) {
              goto LABEL_12;
            }
          }
          uint64_t v13 = (uint64_t (*)(uint64_t, void, void, uint64_t, uint64_t, void))MEMORY[0x10];
          if (!MEMORY[0x10]) {
            goto LABEL_18;
          }
LABEL_16:
          if (!v13)
          {
LABEL_18:
            int v9 = -12782;
            goto LABEL_19;
          }
          int v9 = v13(a2, 0, 0, a3, a4, 0);
LABEL_19:
          if ((v9 == -12786 || v9 == -12783) && v10++ < 9) {
            continue;
          }
          break;
        }
      }
      kdebug_trace();
      if (v9)
      {
        BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
        if (!result) {
          return result;
        }
        sub_226DD2CA8();
        return 0;
      }
    }
    return 1;
  }
LABEL_29:
  kdebug_trace();
  kdebug_trace();
LABEL_30:
  BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
  if (result)
  {
    sub_226DD2C38();
    return 0;
  }
  return result;
}

BOOL sub_226DC80E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t *a6, unsigned int a7)
{
  kdebug_trace();
  unint64_t v13 = *a6;
  unint64_t v14 = a6[1] - *a6;
  unint64_t v15 = v14 >> 3;
  int v16 = (v14 >> 3) + 3;
  uint64_t v17 = v16;
  if ((v14 >> 3) == -3)
  {
    int v18 = 0;
    goto LABEL_19;
  }
  if ((int)v15 <= -4) {
    sub_226DB87BC();
  }
  int v18 = (double *)operator new(16 * v16);
  bzero(v18, 16 * v17);
  if ((int)v15 >= 1)
  {
    unint64_t v19 = *MEMORY[0x263F2C1E0];
    unint64_t v20 = (v14 >> 3);
    if (v20 < 8)
    {
      unint64_t v21 = 0;
      goto LABEL_16;
    }
    BOOL v22 = (unint64_t)v18 >= v13 + 8 * v20 || v13 >= (unint64_t)&v18[2 * v20];
    if (!v22)
    {
      unint64_t v21 = 0;
LABEL_16:
      std::string v30 = &v18[2 * v21 + 1];
      std::string v31 = (uint64_t *)(v13 + 8 * v21);
      unint64_t v32 = v21 - v20;
      do
      {
        *((void *)v30 - 1) = v19;
        uint64_t v33 = *v31++;
        *(void *)std::string v30 = v33;
        v30 += 2;
        BOOL v22 = __CFADD__(v32++, 1);
      }
      while (!v22);
      goto LABEL_19;
    }
    uint64_t v23 = (v14 >> 3) & 3;
    unint64_t v21 = v20 - v23;
    int64x2_t v24 = vdupq_n_s64(v19);
    int v25 = v18 + 4;
    uint64_t v26 = (long long *)(v13 + 16);
    unint64_t v27 = v20 - v23;
    do
    {
      v43.val[1] = (float64x2_t)*(v26 - 1);
      long long v28 = *v26;
      std::string::size_type v29 = v25 - 4;
      v43.val[0] = (float64x2_t)v24;
      vst2q_f64(v29, v43);
      vst2q_f64(v25, *(float64x2x2_t *)v24.i8);
      v25 += 8;
      v26 += 2;
      v27 -= 4;
    }
    while (v27);
    if (v23) {
      goto LABEL_16;
    }
  }
LABEL_19:
  std::string v34 = (void *)((char *)v18 + ((uint64_t)(v14 << 29) >> 28));
  *std::string v34 = @"OperationsList";
  v34[1] = a3;
  __int16 v35 = (void *)((char *)v18 + ((uint64_t)((v14 << 29) + 0x100000000) >> 28));
  *__int16 v35 = @"ActionsList";
  v35[1] = a4;
  std::string v36 = (void *)((char *)v18 + ((uint64_t)((v14 << 29) + 0x200000000) >> 28));
  *std::string v36 = @"StatsBuffer";
  v36[1] = a5;
  uint64_t v37 = kdebug_trace();
  BOOL v38 = sub_226DC7D94(v37, a2, v17, (uint64_t)v18);
  if (!(v38 & a7)) {
    goto LABEL_32;
  }
  kdebug_trace();
  uint64_t v39 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v39)
  {
    uint64_t v40 = *(uint64_t (**)(uint64_t))(v39 + 24);
    if (!v40) {
      goto LABEL_26;
    }
  }
  else
  {
    uint64_t v40 = (uint64_t (*)(uint64_t))MEMORY[0x18];
    if (!MEMORY[0x18]) {
      goto LABEL_26;
    }
  }
  if (v40)
  {
    int v41 = v40(a2);
    goto LABEL_27;
  }
LABEL_26:
  int v41 = -12782;
LABEL_27:
  kdebug_trace();
  if (v41)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      sub_226DD2D5C();
    }
    BOOL v38 = 0;
  }
  else
  {
    BOOL v38 = 1;
  }
LABEL_32:
  operator delete(v18);
  return v38;
}

void sub_226DC842C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_226DC8458(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x22A669B00);
}

uint64_t sub_226DC8490(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result)
  {
    sub_226DC6C38(result);
    JUMPOUT(0x22A669B00);
  }
  return result;
}

uint64_t sub_226DC84D8(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "NSt3__110shared_ptrIN3isp11HxISPDeviceEE27__shared_ptr_default_deleteIS2_S2_EE") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"NSt3__110shared_ptrIN3isp11HxISPDeviceEE27__shared_ptr_default_deleteIS2_S2_EE" & 0x8000000000000000) != 0) == __OFSUB__(v3, "NSt3__110shared_ptrIN3isp11HxISPDeviceEE27__shared_ptr_default_deleteIS2_S2_EE")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"NSt3__110shared_ptrIN3isp11HxISPDeviceEE27__shared_ptr_default_deleteIS2_S2_EE" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

void *sub_226DC854C(void *result, void *a2)
{
  v6[3] = *MEMORY[0x263EF8340];
  if (a2 != result)
  {
    unint64_t v3 = result;
    uint64_t v4 = (void *)result[3];
    uint64_t v5 = (void *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(void *, void *))(*result + 24))(result, v6);
        (*(void (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(void, void *))(*(void *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(void))(*(void *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(void *, void *))(v6[0] + 24))(v6, a2);
        uint64_t result = (void *)(*(uint64_t (**)(void *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(void *, void *))(*result + 24))(result, a2);
        uint64_t result = (void *)(*(uint64_t (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(void *, void *))(*a2 + 24))(a2, result);
      uint64_t result = (void *)(*(uint64_t (**)(void))(*(void *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

void sub_226DC87D8(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  sub_226DBC39C(a1);
}

void sub_226DC87F0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 8u);
}

void sub_226DC880C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

void sub_226DC8A0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v19);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226DC8A60(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x263F645E8] descriptor];
  [v4 setValues:1];
  [v3 setStateDescriptor:v4];
  uint64_t v5 = [MEMORY[0x263F645D8] predicateMatchingIdentifier:*(void *)(a1 + 32)];
  if (!v5 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    sub_226DD2E94();
  }
  v9[0] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  [v3 setPredicates:v6];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_226DC8C1C;
  v7[3] = &unk_2647E6D20;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  [v3 setUpdateHandler:v7];
  objc_destroyWeak(&v8);
}

void sub_226DC8BCC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);

  _Unwind_Resume(a1);
}

void sub_226DC8C1C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _process:v7 didUpdateState:v6];
}

void sub_226DC8C94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_226DC8CF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  unsigned int v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)AppStateMonitor;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_226DC8FD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  objc_destroyWeak(&a9);
  _Unwind_Resume(a1);
}

void *sub_226DC903C(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (!v1) {
    return v2;
  }
  switch([v1 taskState])
  {
    case 1u:
      return v2;
    case 2u:
    case 4u:
      id v3 = [v2 endowmentNamespaces];
      [v3 containsObject:@"com.apple.frontboard.visibility"];

      uint64_t result = v2;
      break;
    case 3u:
      uint64_t result = v2;
      break;
    default:
      uint64_t result = v2;
      break;
  }
  return result;
}

void sub_226DC911C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226DC9130(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226DC91DC(uint64_t a1)
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  *(void *)(a1 + 24) = 0;
  operator new();
}

void sub_226DC93D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  objc_destroyWeak(&a9);
  sub_226DC9510(v9);
  _Unwind_Resume(a1);
}

uint64_t sub_226DC9408(int a1, uint64_t a2, CFTypeRef cf2)
{
  if (CFEqual(@"AppIsSuspended", cf2)) {
    sub_226DC96B4(a2);
  }
  uint64_t result = [**(id **)(a2 + 40) currentAppState];
  switch((int)result)
  {
    case 0:
      *(_DWORD *)(*(void *)(a2 + 40) + 8) = 0;
      break;
    case 1:
      uint64_t v6 = *(void *)(a2 + 40);
      *(_DWORD *)(v6 + 8) = 1;
      *(unsigned char *)(v6 + 32) = 1;
      break;
    case 2:
      *(_DWORD *)(*(void *)(a2 + 40) + 8) = 2;
      break;
    case 3:
    case 4:
      *(_DWORD *)(*(void *)(a2 + 40) + 8) = 3;
      break;
    default:
      uint64_t v5 = *(void *)(a2 + 40);
      if (*(_DWORD *)(v5 + 8) == 1) {
        *(unsigned char *)(v5 + 32) = 1;
      }
      break;
  }
  return result;
}

void *sub_226DC9510(void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
    return a1;
  }
  else
  {
    if (v2) {
      (*(void (**)(void *))(*v2 + 40))(v2);
    }
    return a1;
  }
}

void *sub_226DC95A4(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2)
  {
    id v3 = *(std::__shared_weak_count **)(v2 + 24);
    if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }

    MEMORY[0x22A669B00](v2, 0x10A0C40ACFE8555);
  }
  uint64_t v4 = (void *)a1[3];
  if (v4 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
    return a1;
  }
  else
  {
    if (v4) {
      (*(void (**)(void *))(*v4 + 40))(v4);
    }
    return a1;
  }
}

void sub_226DC96B4(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  unsigned int v2 = [**(id **)(a1 + 40) currentAppState];
  if (v2 < 3)
  {
    unsigned int v3 = v2;
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)(v4 + 8) = v2;
LABEL_3:
    uint64_t v5 = *(void *)(a1 + 24);
    if (v5)
    {
      if (v3 == 1)
      {
        CMNotificationCenterGetDefaultLocalCenter();
        int v6 = CMNotificationCenterRemoveListener();
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
        {
          int v7 = *(_DWORD *)(a1 + 32);
          *(_DWORD *)buf = 67109376;
          int v12 = v7;
          __int16 v13 = 1024;
          int v14 = v6;
          _os_log_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_INFO, "Application PID=%d terminated with status %d", buf, 0xEu);
        }
        uint64_t v4 = *(void *)(a1 + 40);
        uint64_t v5 = *(void *)(a1 + 24);
      }
      BOOL v8 = *(_DWORD *)(v4 + 8) == 1;
      *(_DWORD *)buf = *(_DWORD *)(a1 + 32);
      BOOL v10 = v8;
      if (!v5) {
        sub_226DBC3FC();
      }
      (*(void (**)(uint64_t, uint8_t *, BOOL *))(*(void *)v5 + 48))(v5, buf, &v10);
      uint64_t v9 = *(void *)(a1 + 40);
      if (*(_DWORD *)(v9 + 8) == 1) {
        [*(id *)v9 invalidate];
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      sub_226DD2EDC();
    }
    return;
  }
  if (v2 - 3 <= 1)
  {
    *(_DWORD *)(*(void *)(a1 + 40) + 8) = 3;
    return;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  unsigned int v3 = *(_DWORD *)(v4 + 8);
  if (v3 != 3) {
    goto LABEL_3;
  }
}

uint64_t sub_226DC9870(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 40) + 32);
}

void *sub_226DC987C(void *result, void *a2)
{
  v6[3] = *MEMORY[0x263EF8340];
  if (a2 != result)
  {
    unsigned int v3 = result;
    uint64_t v4 = (void *)result[3];
    uint64_t v5 = (void *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(void *, void *))(*result + 24))(result, v6);
        (*(void (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(void, void *))(*(void *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(void))(*(void *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(void *, void *))(v6[0] + 24))(v6, a2);
        uint64_t result = (void *)(*(uint64_t (**)(void *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(void *, void *))(*result + 24))(result, a2);
        uint64_t result = (void *)(*(uint64_t (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(void *, void *))(*a2 + 24))(a2, result);
      uint64_t result = (void *)(*(uint64_t (**)(void))(*(void *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

void sub_226DC9B08(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  sub_226DBC39C(a1);
}

uint64_t sub_226DC9B14()
{
  int64x2_t v0 = vdupq_n_s64(MGGetProductType());
  return vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v0, (int64x2_t)xmmword_226DD42A0), (int32x4_t)vceqq_s64(v0, (int64x2_t)xmmword_226DD42B0)))) & 1;
}

uint64_t sub_226DC9B5C()
{
  int64x2_t v0 = vdupq_n_s64(MGGetProductType());
  return vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v0, (int64x2_t)xmmword_226DD42C0), (int32x4_t)vceqq_s64(v0, (int64x2_t)xmmword_226DD42D0)))) & 1;
}

uint64_t sub_226DC9BA4()
{
  int64x2_t v0 = vdupq_n_s64(MGGetProductType());
  return vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v0, (int64x2_t)xmmword_226DD42E0), (int32x4_t)vceqq_s64(v0, (int64x2_t)xmmword_226DD42F0)))) & 1;
}

uint64_t sub_226DC9BEC()
{
  int64x2_t v0 = vdupq_n_s64(MGGetProductType());
  return vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v0, (int64x2_t)xmmword_226DD4300), (int32x4_t)vceqq_s64(v0, (int64x2_t)xmmword_226DD4310)))) & 1;
}

const char *sub_226DC9C34(int a1, int a2)
{
  if (a1 > 61)
  {
    if (a1 > 163)
    {
      if (a1 == 164)
      {
        if (a2 == 1879048192) {
          return "SHT_HEX_ORDERED";
        }
      }
      else if (a1 == 243 && a2 == 1879048195)
      {
        return "SHT_RISCV_ATTRIBUTES";
      }
    }
    else if (a1 == 62)
    {
      if (a2 == 1879048193) {
        return "SHT_X86_64_UNWIND";
      }
    }
    else if (a1 == 105 && a2 == 1879048195)
    {
      return "SHT_MSP430_ATTRIBUTES";
    }
    goto LABEL_21;
  }
  if (a1 != 8 && a1 != 10)
  {
    if (a1 == 40 && (a2 - 1879048193) < 5) {
      return off_2647E6D68[a2 - 1879048193];
    }
LABEL_21:
    if (a2 > 1879002111)
    {
      switch(a2)
      {
        case 1879002112:
          uint64_t result = "SHT_LLVM_ODRTAB";
          break;
        case 1879002113:
          uint64_t result = "SHT_LLVM_LINKER_OPTIONS";
          break;
        case 1879002114:
LABEL_48:
          uint64_t result = "Unknown";
          break;
        case 1879002115:
          uint64_t result = "SHT_LLVM_ADDRSIG";
          break;
        case 1879002116:
          uint64_t result = "SHT_LLVM_DEPENDENT_LIBRARIES";
          break;
        case 1879002117:
          uint64_t result = "SHT_LLVM_SYMPART";
          break;
        case 1879002118:
          uint64_t result = "SHT_LLVM_PART_EHDR";
          break;
        case 1879002119:
          uint64_t result = "SHT_LLVM_PART_PHDR";
          break;
        case 1879002120:
          uint64_t result = "SHT_LLVM_BB_ADDR_MAP";
          break;
        case 1879002121:
          uint64_t result = "SHT_LLVM_CALL_GRAPH_PROFILE";
          break;
        default:
          switch(a2)
          {
            case 1879048181:
              uint64_t result = "SHT_GNU_ATTRIBUTES";
              break;
            case 1879048182:
              uint64_t result = "SHT_GNU_HASH";
              break;
            case 1879048183:
            case 1879048184:
            case 1879048185:
            case 1879048186:
            case 1879048187:
            case 1879048188:
              goto LABEL_48;
            case 1879048189:
              uint64_t result = "SHT_GNU_verdef";
              break;
            case 1879048190:
              uint64_t result = "SHT_GNU_verneed";
              break;
            case 1879048191:
              uint64_t result = "SHT_GNU_versym";
              break;
            default:
              if (a2 != 1879047936) {
                goto LABEL_48;
              }
              uint64_t result = "SHT_ANDROID_RELR";
              break;
          }
          break;
      }
    }
    else
    {
      uint64_t result = "SHT_NULL";
      switch(a2)
      {
        case 0:
          return result;
        case 1:
          return "SHT_PROGBITS";
        case 2:
          return "SHT_SYMTAB";
        case 3:
          return "SHT_STRTAB";
        case 4:
          return "SHT_RELA";
        case 5:
          return "SHT_HASH";
        case 6:
          return "SHT_DYNAMIC";
        case 7:
          return "SHT_NOTE";
        case 8:
          return "SHT_NOBITS";
        case 9:
          return "SHT_REL";
        case 10:
          return "SHT_SHLIB";
        case 11:
          return "SHT_DYNSYM";
        case 12:
        case 13:
          goto LABEL_48;
        case 14:
          return "SHT_INIT_ARRAY";
        case 15:
          return "SHT_FINI_ARRAY";
        case 16:
          return "SHT_PREINIT_ARRAY";
        case 17:
          return "SHT_GROUP";
        case 18:
          return "SHT_SYMTAB_SHNDX";
        case 19:
          return "SHT_RELR";
        default:
          if (a2 == 1610612737)
          {
            uint64_t result = "SHT_ANDROID_REL";
          }
          else
          {
            if (a2 != 1610612738) {
              goto LABEL_48;
            }
            uint64_t result = "SHT_ANDROID_RELA";
          }
          break;
      }
    }
    return result;
  }
  uint64_t result = "SHT_MIPS_REGINFO";
  switch(a2)
  {
    case 1879048198:
      return result;
    case 1879048205:
      uint64_t result = "SHT_MIPS_OPTIONS";
      break;
    case 1879048222:
      uint64_t result = "SHT_MIPS_DWARF";
      break;
    case 1879048234:
      uint64_t result = "SHT_MIPS_ABIFLAGS";
      break;
    default:
      goto LABEL_21;
  }
  return result;
}

uint64_t sub_226DCA1EC()
{
  if (!atomic_load_explicit(&qword_26815DB48, memory_order_acquire)) {
    sub_226DCCA94((unint64_t *)&qword_26815DB48, (uint64_t (*)(void))sub_226DCA428, (unint64_t)sub_226DCA470);
  }
  return qword_26815DB48;
}

void sub_226DCA254(uint64_t a1, uint64_t a2)
{
  std::error_code::message(&v5, (const std::error_code *)(a1 + 8));
  if ((v5.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    unsigned int v3 = &v5;
  }
  else {
    unsigned int v3 = (std::string *)v5.__r_.__value_.__r.__words[0];
  }
  if ((v5.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    size_t size = HIBYTE(v5.__r_.__value_.__r.__words[2]);
  }
  else {
    size_t size = v5.__r_.__value_.__l.__size_;
  }
  sub_226DD0534(a2, v3, size);
  if (SHIBYTE(v5.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v5.__r_.__value_.__l.__data_);
  }
}

void sub_226DCA2CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_226DCA2E8(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v14[0] = 0;
  v14[1] = 0;
  uint64_t v15 = 0;
  int v6 = 0;
  char v10 = 0;
  uint64_t v11 = 0;
  int v12 = 1;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v7 = 0;
  std::string v5 = &unk_26DAEFD10;
  __int16 v13 = v14;
  sub_226DD0120((uint64_t)&v5, 0, 0, 0);
  (*(void (**)(uint64_t, void **))(*(void *)a1 + 16))(a1, &v5);
  if (*((char *)v13 + 23) < 0)
  {
    sub_226DBC2E4((unsigned char *)a2, *v13, (unint64_t)v13[1]);
  }
  else
  {
    long long v4 = *(_OWORD *)v13;
    *(void *)(a2 + 16) = v13[2];
    *(_OWORD *)a2 = v4;
  }
  sub_226DCFF84((uint64_t)&v5);
  if (SHIBYTE(v15) < 0) {
    operator delete(v14[0]);
  }
}

void sub_226DCA3F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_226DCFF84((uint64_t)&a9);
  if (*(char *)(v9 - 17) < 0) {
    operator delete(*(void **)(v9 - 40));
  }
  _Unwind_Resume(a1);
}

uint64_t sub_226DCA41C(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

void sub_226DCA428()
{
}

uint64_t sub_226DCA470(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void sub_226DCA4A0(std::error_category *a1)
{
  std::error_category::~error_category(a1);

  JUMPOUT(0x22A669B00);
}

const char *sub_226DCA4D8()
{
  return "llvm.object";
}

double sub_226DCA4E4@<D0>(int a1@<W1>, uint64_t a2@<X8>)
{
  switch(a1)
  {
    case 2:
      std::string v5 = (char *)operator new(0x38uLL);
      *(void *)a2 = v5;
      *(_OWORD *)(a2 + 8) = xmmword_226DD43B0;
      strcpy(v5, "The file was not recognized as a valid object file");
      double result = *(double *)" valid object file";
      break;
    case 3:
      int v6 = (char *)operator new(0x38uLL);
      *(void *)a2 = v6;
      *(_OWORD *)(a2 + 8) = xmmword_226DD43A0;
      strcpy(v6, "Invalid data was encountered while parsing the file");
      double result = *(double *)"le parsing the file";
      break;
    case 4:
      uint64_t v7 = (char *)operator new(0x38uLL);
      *(void *)a2 = v7;
      *(_OWORD *)(a2 + 8) = xmmword_226DD4390;
      strcpy(v7, "The end of the file was unexpectedly encountered");
      double result = *(double *)"edly encountered";
      break;
    case 5:
      uint64_t v8 = (char *)operator new(0x30uLL);
      *(void *)a2 = v8;
      *(_OWORD *)(a2 + 8) = xmmword_226DD4380;
      strcpy(v8, "String table must end with a null terminator");
      double result = *(double *)" null terminator";
      break;
    case 6:
      *(unsigned char *)(a2 + 23) = 21;
      double result = *(double *)"Invalid section index";
      strcpy((char *)a2, "Invalid section index");
      break;
    case 7:
      uint64_t v9 = (char *)operator new(0x30uLL);
      *(void *)a2 = v9;
      *(_OWORD *)(a2 + 8) = xmmword_226DD4370;
      double result = *(double *)"Bitcode section not found in object file";
      strcpy(v9, "Bitcode section not found in object file");
      break;
    case 8:
      *(unsigned char *)(a2 + 23) = 20;
      double result = *(double *)"Invalid symbol index";
      strcpy((char *)a2, "Invalid symbol index");
      break;
    default:
      unsigned int v3 = (char *)operator new(0x30uLL);
      *(void *)a2 = v3;
      *(_OWORD *)(a2 + 8) = xmmword_226DD43C0;
      strcpy(v3, "No object file for requested architecture");
      double result = *(double *)"ted architecture";
      break;
  }
  return result;
}

void sub_226DCA734(const char *a1, uint64_t a2, const char *a3, void (*a4)(void *))
{
  sub_226DCAAB8((uint64_t)v17);
  sub_226DCAED4(v18, (uint64_t)"Assert: ", 8);
  size_t v7 = strlen(a1);
  uint64_t v8 = sub_226DCAED4(v18, (uint64_t)a1, v7);
  sub_226DCAED4(v8, (uint64_t)":", 1);
  uint64_t v9 = (void *)std::ostream::operator<<();
  char v10 = sub_226DCAED4(v9, (uint64_t)" : ", 3);
  size_t v11 = strlen(a3);
  int v12 = sub_226DCAED4(v10, (uint64_t)a3, v11);
  sub_226DCAED4(v12, (uint64_t)"\n", 1);
  std::stringbuf::str();
  v17[0] = *MEMORY[0x263F8C2B8];
  uint64_t v13 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)v17 + *(void *)(v17[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  v18[0] = v13;
  v18[1] = MEMORY[0x263F8C318] + 16;
  if (v19 < 0) {
    operator delete((void *)v18[9]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x22A669A80](&v20);
  if (v16 >= 0) {
    int v14 = &v15;
  }
  else {
    int v14 = v15;
  }
  a4(v14);
  if (v16 < 0) {
    operator delete(v15);
  }
}

void sub_226DCA964(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (a14 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_226DCA994(char *__src)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  strncpy(__dst, __src, 0x400uLL);
  qword_26815DAF8 = (uint64_t)__dst;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26815DB68, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26815DB68))
  {
    qword_26815DB60 = (uint64_t)os_log_create("CVHWA", "");
    __cxa_guard_release(&qword_26815DB68);
  }
  unsigned int v2 = qword_26815DB60;
  if (os_log_type_enabled((os_log_t)qword_26815DB60, OS_LOG_TYPE_FAULT))
  {
    int v4 = 136446210;
    std::string v5 = __src;
    _os_log_impl(&dword_226DAE000, v2, OS_LOG_TYPE_FAULT, "%{public}s", (uint8_t *)&v4, 0xCu);
  }
  return fputs(__src, (FILE *)*MEMORY[0x263EF8348]);
}

uint64_t sub_226DCAAB8(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C328] + 104;
  *(void *)(a1 + 128) = MEMORY[0x263F8C328] + 104;
  uint64_t v3 = a1 + 16;
  uint64_t v4 = MEMORY[0x263F8C328] + 64;
  *(void *)(a1 + 16) = MEMORY[0x263F8C328] + 64;
  std::string v5 = (void *)MEMORY[0x263F8C2B8];
  uint64_t v6 = *(void *)(MEMORY[0x263F8C2B8] + 24);
  uint64_t v7 = *(void *)(MEMORY[0x263F8C2B8] + 16);
  *(void *)a1 = v7;
  *(void *)(a1 + *(void *)(v7 - 24)) = v6;
  *(void *)(a1 + 8) = 0;
  uint64_t v8 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v8, (void *)(a1 + 24));
  uint64_t v9 = MEMORY[0x263F8C328] + 24;
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  uint64_t v10 = v5[5];
  uint64_t v11 = v5[4];
  *(void *)(a1 + 16) = v11;
  *(void *)(v3 + *(void *)(v11 - 24)) = v10;
  uint64_t v12 = v5[1];
  *(void *)a1 = v12;
  *(void *)(a1 + *(void *)(v12 - 24)) = v5[6];
  *(void *)a1 = v9;
  *(void *)(a1 + 128) = v2;
  *(void *)(a1 + 16) = v4;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 24) = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_226DCAD68(_Unwind_Exception *a1)
{
  std::iostream::~basic_iostream();
  MEMORY[0x22A669A80](v1);
  _Unwind_Resume(a1);
}

uint64_t sub_226DCAD9C(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2B8];
  uint64_t v3 = *MEMORY[0x263F8C2B8];
  *(void *)a1 = *MEMORY[0x263F8C2B8];
  uint64_t v4 = *(void *)(v2 + 72);
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 64);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x22A669A80](a1 + 128);
  return a1;
}

void *sub_226DCAED4(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x22A669910](v13, a1);
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      uint64_t v10 = std::locale::use_facet(&v14, MEMORY[0x263F8C108]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!sub_226DCB078(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x22A669920](v13);
  return a1;
}

void sub_226DCB010(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x22A669920](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x226DCAFF0);
}

void sub_226DCB064(_Unwind_Exception *a1)
{
}

uint64_t sub_226DCB078(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      size_t v12 = 0;
    }
    else {
      size_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if ((uint64_t)v12 >= 1)
    {
      if (v12 >= 0x7FFFFFFFFFFFFFF8) {
        sub_226DBC384();
      }
      if (v12 >= 0x17)
      {
        uint64_t v14 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17) {
          uint64_t v14 = v12 | 7;
        }
        uint64_t v15 = v14 + 1;
        uint64_t v13 = (void **)operator new(v14 + 1);
        __b[1] = (void *)v12;
        int64_t v22 = v15 | 0x8000000000000000;
        __b[0] = v13;
      }
      else
      {
        HIBYTE(v22) = v12;
        uint64_t v13 = __b;
      }
      memset(v13, __c, v12);
      *((unsigned char *)v13 + v12) = 0;
      if (v22 >= 0) {
        char v16 = __b;
      }
      else {
        char v16 = (void **)__b[0];
      }
      uint64_t v17 = (*(uint64_t (**)(uint64_t, void **, size_t))(*(void *)v6 + 96))(v6, v16, v12);
      uint64_t v18 = v17;
      if (SHIBYTE(v22) < 0)
      {
        operator delete(__b[0]);
        if (v18 != v12) {
          return 0;
        }
      }
      else if (v17 != v12)
      {
        return 0;
      }
    }
    uint64_t v19 = a4 - a3;
    if (v19 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v19) == v19)
    {
      *(void *)(a5 + 24) = 0;
      return v6;
    }
    return 0;
  }
  return v6;
}

void sub_226DCB24C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_226DCB268()
{
}

void *sub_226DCB280(void *result, uint64_t a2, unsigned __int8 *a3)
{
  if (*result)
  {
    uint64_t v4 = (void **)result;
    double result = sub_226DCFB58(a3, a2);
    std::string v5 = *v4;
    *uint64_t v4 = 0;
    if (v5)
    {
      if ((*(unsigned int (**)(void *, void *))(*v5 + 48))(v5, &unk_26815DD31))
      {
        uint64_t v6 = (uint64_t **)v5[1];
        uint64_t v7 = (uint64_t **)v5[2];
        if (v6 != v7)
        {
          int v8 = 0;
          do
          {
            uint64_t v13 = v8;
            int v9 = *v6;
            *uint64_t v6 = 0;
            if ((*(unsigned int (**)(uint64_t *, void *))(*v9 + 48))(v9, &unk_26815DD30))
            {
              (*(void (**)(uint64_t *, uint64_t))(*v9 + 16))(v9, a2);
              uint64_t v10 = *(unsigned char **)(a2 + 32);
              if (*(unsigned char **)(a2 + 24) == v10)
              {
                sub_226DD0534(a2, "\n", 1uLL);
              }
              else
              {
                *uint64_t v10 = 10;
                ++*(void *)(a2 + 32);
              }
              size_t v12 = 0;
              (*(void (**)(uint64_t *))(*v9 + 8))(v9);
            }
            else
            {
              size_t v12 = v9;
            }
            sub_226DC4820(&v13, &v12, &v14);
            int v8 = v14;
            uint64_t v14 = 0;
            if (v12) {
              (*(void (**)(uint64_t *))(*v12 + 8))(v12);
            }
            if (v13) {
              (*(void (**)(uint64_t *))(*v13 + 8))(v13);
            }
            ++v6;
          }
          while (v6 != v7);
        }
      }
      else
      {
        double result = (void *)(*(uint64_t (**)(void *, void *))(*v5 + 48))(v5, &unk_26815DD30);
        if (!result) {
          return result;
        }
        (*(void (**)(void *, uint64_t))(*v5 + 16))(v5, a2);
        uint64_t v11 = *(unsigned char **)(a2 + 32);
        if (*(unsigned char **)(a2 + 24) == v11)
        {
          sub_226DD0534(a2, "\n", 1uLL);
        }
        else
        {
          *uint64_t v11 = 10;
          ++*(void *)(a2 + 32);
        }
      }
      return (void *)(*(uint64_t (**)(void *))(*v5 + 8))(v5);
    }
  }
  return result;
}

void sub_226DCB558(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_226DCB604()
{
  if (!atomic_load_explicit(qword_26815DB70, memory_order_acquire)) {
    sub_226DCCA94((unint64_t *)qword_26815DB70, (uint64_t (*)(void))sub_226DCC04C, (unint64_t)sub_226DCC094);
  }
  return 1;
}

uint64_t sub_226DCB674@<X0>(int a1@<W0>, void *a2@<X8>)
{
  if (a1) {
    operator new();
  }
  uint64_t result = 0;
  *a2 = 0;
  return result;
}

uint64_t sub_226DCB720(void **a1)
{
  v14.__val_ = 0;
  v14.__cat_ = std::system_category();
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if ((*(unsigned int (**)(void *, void *))(*v2 + 48))(v2, &unk_26815DD31))
    {
      uint64_t v3 = (uint64_t **)v2[1];
      uint64_t v4 = (uint64_t **)v2[2];
      if (v3 != v4)
      {
        std::string v5 = 0;
        do
        {
          v11.__r_.__value_.__r.__words[0] = (std::string::size_type)v5;
          uint64_t v6 = *v3;
          char *v3 = 0;
          if ((*(unsigned int (**)(uint64_t *, void *))(*v6 + 48))(v6, &unk_26815DD30))
          {
            *(void *)&v14.__val_ = (*(uint64_t (**)(uint64_t *))(*v6 + 32))(v6);
            v14.__cat_ = v7;
            uint64_t v15 = 0;
            (*(void (**)(uint64_t *))(*v6 + 8))(v6);
          }
          else
          {
            uint64_t v15 = v6;
          }
          sub_226DC4820((uint64_t **)&v11, &v15, (uint64_t **)&v12);
          std::string v5 = v12;
          size_t v12 = 0;
          if (v15) {
            (*(void (**)(uint64_t *))(*v15 + 8))(v15);
          }
          if (v11.__r_.__value_.__r.__words[0]) {
            (*(void (**)(std::string::size_type))(*(void *)v11.__r_.__value_.__l.__data_ + 8))(v11.__r_.__value_.__r.__words[0]);
          }
          ++v3;
        }
        while (v3 != v4);
      }
    }
    else
    {
      if (!(*(unsigned int (**)(void *, void *))(*v2 + 48))(v2, &unk_26815DD30)) {
        goto LABEL_16;
      }
      *(void *)&v14.__val_ = (*(uint64_t (**)(void *))(*v2 + 32))(v2);
      v14.__cat_ = v8;
    }
    (*(void (**)(void *))(*v2 + 8))(v2);
  }
LABEL_16:
  if (!atomic_load_explicit(qword_26815DB70, memory_order_acquire)) {
    sub_226DCCA94((unint64_t *)qword_26815DB70, (uint64_t (*)(void))sub_226DCC04C, (unint64_t)sub_226DCC094);
  }
  if (v14.__cat_ == (const std::error_category *)qword_26815DB70[0] && v14.__val_ == 3)
  {
    std::error_code::message(&v11, &v14);
    __int16 v13 = 260;
    size_t v12 = &v11;
    sub_226DCB268();
  }
  return *(void *)&v14.__val_;
}

void sub_226DCB9F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  (*(void (**)(uint64_t))(*(void *)v15 + 8))(v15);
  _Unwind_Resume(a1);
}

uint64_t sub_226DCBABC(uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  *(void *)a1 = &unk_26DAEF938;
  sub_226DCF6E8(a2, (void *)(a1 + 8));
  *(void *)(a1 + 32) = a3;
  *(void *)(a1 + 40) = a4;
  *(unsigned char *)(a1 + 48) = 1;
  return a1;
}

void sub_226DCBB24(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 48))
  {
    int v4 = *(char *)(a1 + 31);
    if (v4 >= 0) {
      std::string v5 = (unsigned char *)(a1 + 8);
    }
    else {
      std::string v5 = *(unsigned char **)(a1 + 8);
    }
    if (v4 >= 0) {
      size_t v6 = *(unsigned __int8 *)(a1 + 31);
    }
    else {
      size_t v6 = *(void *)(a1 + 16);
    }
    sub_226DD0534(a2, v5, v6);
    return;
  }
  std::error_code::message(&v12, (const std::error_code *)(a1 + 32));
  if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v7 = &v12;
  }
  else {
    uint64_t v7 = (std::string *)v12.__r_.__value_.__r.__words[0];
  }
  if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    size_t size = HIBYTE(v12.__r_.__value_.__r.__words[2]);
  }
  else {
    size_t size = v12.__r_.__value_.__l.__size_;
  }
  sub_226DD0534(a2, v7, size);
  if ((SHIBYTE(v12.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    int v9 = *(char *)(a1 + 31);
    if ((v9 & 0x80000000) == 0) {
      goto LABEL_19;
    }
LABEL_22:
    if (!*(void *)(a1 + 16)) {
      return;
    }
    goto LABEL_23;
  }
  operator delete(v12.__r_.__value_.__l.__data_);
  int v9 = *(char *)(a1 + 31);
  if (v9 < 0) {
    goto LABEL_22;
  }
LABEL_19:
  if (!(_BYTE)v9) {
    return;
  }
LABEL_23:
  std::operator+<char>();
  if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v10 = &v12;
  }
  else {
    uint64_t v10 = (std::string *)v12.__r_.__value_.__r.__words[0];
  }
  if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    size_t v11 = HIBYTE(v12.__r_.__value_.__r.__words[2]);
  }
  else {
    size_t v11 = v12.__r_.__value_.__l.__size_;
  }
  sub_226DD0534(a2, v10, v11);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v12.__r_.__value_.__l.__data_);
  }
}

void sub_226DCBC60(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_226DCBC80(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t sub_226DCBC8C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = *(void **)(a1 + 16);
    int v4 = *(void **)(a1 + 8);
    if (v3 != v2)
    {
      do
      {
        uint64_t v6 = *--v3;
        uint64_t v5 = v6;
        void *v3 = 0;
        if (v6) {
          (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
        }
      }
      while (v3 != v2);
      int v4 = *(void **)(a1 + 8);
    }
    *(void *)(a1 + 16) = v2;
    operator delete(v4);
  }
  return a1;
}

void sub_226DCBD1C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = *(void **)(a1 + 16);
    int v4 = *(void **)(a1 + 8);
    if (v3 != v2)
    {
      do
      {
        uint64_t v6 = *--v3;
        uint64_t v5 = v6;
        void *v3 = 0;
        if (v6) {
          (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
        }
      }
      while (v3 != v2);
      int v4 = *(void **)(a1 + 8);
    }
    *(void *)(a1 + 16) = v2;
    operator delete(v4);
  }

  JUMPOUT(0x22A669B00);
}

uint64_t sub_226DCBDCC(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  uint64_t v4 = *(void *)(a2 + 32);
  if ((unint64_t)(*(void *)(a2 + 24) - v4) > 0x10)
  {
    *(unsigned char *)(v4 + 16) = 10;
    *(_OWORD *)uint64_t v4 = *(_OWORD *)"Multiple errors:\n";
    *(void *)(a2 + 32) += 17;
    uint64_t v5 = *(void **)(result + 8);
    for (uint64_t i = *(void **)(result + 16); v5 != i; ++v5)
    {
LABEL_7:
      while (1)
      {
        uint64_t result = (*(uint64_t (**)(void, uint64_t))(*(void *)*v5 + 16))(*v5, a2);
        uint64_t v7 = *(unsigned char **)(a2 + 32);
        if (*(unsigned char **)(a2 + 24) == v7) {
          break;
        }
        *uint64_t v7 = 10;
        ++*(void *)(a2 + 32);
        if (++v5 == i) {
          return result;
        }
      }
      uint64_t result = sub_226DD0534(a2, "\n", 1uLL);
    }
  }
  else
  {
    uint64_t result = sub_226DD0534(a2, "Multiple errors:\n", 0x11uLL);
    uint64_t v5 = *(void **)(v3 + 8);
    uint64_t i = *(void **)(v3 + 16);
    if (v5 != i) {
      goto LABEL_7;
    }
  }
  return result;
}

void *sub_226DCBEE4()
{
  return &unk_26815DD31;
}

BOOL sub_226DCBEF0(uint64_t a1, void *a2)
{
  return a2 == &unk_26815DD31 || a2 == &unk_26815DD30;
}

void sub_226DCBF10()
{
}

void *sub_226DCBF24()
{
  return &unk_26815DD32;
}

BOOL sub_226DCBF30(uint64_t a1, void *a2)
{
  return a2 == &unk_26815DD32 || a2 == &unk_26815DD30;
}

uint64_t sub_226DCBF50(uint64_t result)
{
  uint64_t v1 = result;
  *(void *)uint64_t result = &unk_26DAEF938;
  if (*(char *)(result + 31) < 0)
  {
    operator delete(*(void **)(result + 8));
    return v1;
  }
  return result;
}

void sub_226DCBFB0(uint64_t a1)
{
  *(void *)a1 = &unk_26DAEF938;
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }

  JUMPOUT(0x22A669B00);
}

void *sub_226DCC020()
{
  return &unk_26815DD33;
}

BOOL sub_226DCC02C(uint64_t a1, void *a2)
{
  return a2 == &unk_26815DD33 || a2 == &unk_26815DD30;
}

void sub_226DCC04C()
{
}

uint64_t sub_226DCC094(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void sub_226DCC0C4(std::error_category *a1)
{
  std::error_category::~error_category(a1);

  JUMPOUT(0x22A669B00);
}

const char *sub_226DCC0FC()
{
  return "Error";
}

void sub_226DCC108(int a1@<W1>, uint64_t a2@<X8>)
{
  if (a1 == 3)
  {
    uint64_t v3 = (char *)operator new(0x80uLL);
    *(void *)a2 = v3;
    *(_OWORD *)(a2 + 8) = xmmword_226DD4420;
    strcpy(v3, "Inconvertible error value. An error has occurred that could not be converted to a known std::error_code. Please file a bug.");
  }
  else if (a1 == 2)
  {
    strcpy((char *)a2, "A file error occurred.");
    *(unsigned char *)(a2 + 23) = 22;
  }
  else
  {
    *(unsigned char *)(a2 + 23) = 15;
    strcpy((char *)a2, "Multiple errors");
  }
}

uint64_t sub_226DCC1E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  *(void *)&long long v54 = a1;
  *((void *)&v54 + 1) = a2;
  unint64_t v4 = sub_226DCF3BC(&v54, "{}", 2, 0);
  if (v4 >= *((void *)&v54 + 1)) {
    unint64_t v5 = *((void *)&v54 + 1);
  }
  else {
    unint64_t v5 = v4;
  }
  unint64_t v6 = *((void *)&v54 + 1) - v5;
  *(void *)&v56[0] = v54 + v5;
  *((void *)&v56[0] + 1) = *((void *)&v54 + 1) - v5;
  uint64_t v7 = sub_226DCF43C(v56, "{}", 2, 0xFFFFFFFFFFFFFFFFLL);
  unint64_t v8 = *((void *)&v56[0] + 1);
  if ((unint64_t)(v7 + 1) < *((void *)&v56[0] + 1)) {
    uint64_t v9 = v7 + 1;
  }
  else {
    uint64_t v9 = *((void *)&v56[0] + 1);
  }
  unint64_t v10 = *((void *)&v56[0] + 1) - v6 + v9;
  if (*((void *)&v56[0] + 1) >= v10) {
    unint64_t v8 = v10;
  }
  uint64_t v52 = *(unsigned __int8 **)&v56[0];
  unint64_t v53 = v8;
  unint64_t v11 = sub_226DCF3BC(&v52, " \t\n\v\f\r", 6, 0);
  if (v11 >= v53) {
    unint64_t v12 = v53;
  }
  else {
    unint64_t v12 = v11;
  }
  unint64_t v13 = v53 - v12;
  *(void *)&v56[0] = &v52[v12];
  *((void *)&v56[0] + 1) = v53 - v12;
  uint64_t v14 = sub_226DCF43C(v56, " \t\n\v\f\r", 6, 0xFFFFFFFFFFFFFFFFLL);
  unint64_t v15 = *((void *)&v56[0] + 1);
  if ((unint64_t)(v14 + 1) < *((void *)&v56[0] + 1)) {
    uint64_t v16 = v14 + 1;
  }
  else {
    uint64_t v16 = *((void *)&v56[0] + 1);
  }
  unint64_t v17 = *((void *)&v56[0] + 1) - v13 + v16;
  uint64_t v52 = *(unsigned __int8 **)&v56[0];
  if (*((void *)&v56[0] + 1) >= v17) {
    unint64_t v15 = v17;
  }
  unint64_t v53 = v15;
  *(void *)&v56[0] = 0;
  uint64_t result = sub_226DCF4CC(&v52, 0, (unint64_t *)v56);
  if (result)
  {
    memset(v56, 0, sizeof(v56));
    *(_OWORD *)(a3 + 8) = 0u;
    memset(v55, 0, sizeof(v55));
    *(void *)a3 = 0;
    *(_OWORD *)(a3 + 24) = 0u;
    *(_DWORD *)(a3 + 40) = 2;
    *(unsigned char *)(a3 + 44) = 0;
    *(_DWORD *)(a3 + 60) = 0;
    *(_OWORD *)(a3 + 45) = *(_OWORD *)v55;
    goto LABEL_71;
  }
  uint64_t v19 = *(void *)&v56[0];
  unint64_t v20 = sub_226DCF3BC(&v52, " \t\n\v\f\r", 6, 0);
  if (v20 >= v53) {
    unint64_t v21 = v53;
  }
  else {
    unint64_t v21 = v20;
  }
  unint64_t v22 = v53 - v21;
  *(void *)&v56[0] = &v52[v21];
  *((void *)&v56[0] + 1) = v53 - v21;
  uint64_t v23 = sub_226DCF43C(v56, " \t\n\v\f\r", 6, 0xFFFFFFFFFFFFFFFFLL);
  if ((unint64_t)(v23 + 1) < *((void *)&v56[0] + 1)) {
    uint64_t v24 = v23 + 1;
  }
  else {
    uint64_t v24 = *((void *)&v56[0] + 1);
  }
  unint64_t v25 = *((void *)&v56[0] + 1) - v22 + v24;
  if (*((void *)&v56[0] + 1) < v25) {
    unint64_t v25 = *((void *)&v56[0] + 1);
  }
  uint64_t v52 = *(unsigned __int8 **)&v56[0];
  unint64_t v53 = v25;
  if (!v25 || **(unsigned char **)&v56[0] != 44)
  {
    uint64_t v33 = 0;
    char v27 = 32;
    int v28 = 2;
    goto LABEL_46;
  }
  uint64_t v26 = (char *)(*(void *)&v56[0] + 1);
  char v27 = 32;
  int v28 = 2;
  unint64_t v29 = v25 - 1;
  uint64_t v52 = (unsigned __int8 *)(*(void *)&v56[0] + 1);
  unint64_t v53 = v25 - 1;
  if (v25 == 1)
  {
    uint64_t v33 = 0;
    goto LABEL_46;
  }
  unint64_t v30 = v25 - 2;
  if (v30)
  {
    std::string v31 = (unsigned __int8 *)(*(void *)&v56[0] + 2);
    int v32 = *(char *)(*(void *)&v56[0] + 2);
    switch(v32)
    {
      case '+':
LABEL_38:
        char v27 = *v26;
        if (v29 >= 2) {
          uint64_t v34 = 2;
        }
        else {
          uint64_t v34 = v29;
        }
        std::string v31 = (unsigned __int8 *)&v26[v34];
        unint64_t v30 = v29 - v34;
        goto LABEL_42;
      case '-':
        int v28 = 0;
        goto LABEL_38;
      case '=':
        int v28 = 1;
        goto LABEL_38;
    }
    int v51 = *v26;
    switch(v51)
    {
      case '+':
LABEL_42:
        uint64_t v52 = v31;
        unint64_t v53 = v30;
        break;
      case '-':
        int v28 = 0;
        goto LABEL_42;
      case '=':
        int v28 = 1;
        goto LABEL_42;
    }
  }
  *(void *)&v56[0] = 0;
  if (sub_226DCF4CC(&v52, 0, (unint64_t *)v56)) {
    uint64_t v33 = 0;
  }
  else {
    uint64_t v33 = *(void *)&v56[0];
  }
LABEL_46:
  unint64_t v35 = sub_226DCF3BC(&v52, " \t\n\v\f\r", 6, 0);
  if (v35 >= v53) {
    unint64_t v36 = v53;
  }
  else {
    unint64_t v36 = v35;
  }
  unint64_t v37 = v53 - v36;
  *(void *)&v56[0] = &v52[v36];
  *((void *)&v56[0] + 1) = v53 - v36;
  uint64_t v38 = sub_226DCF43C(v56, " \t\n\v\f\r", 6, 0xFFFFFFFFFFFFFFFFLL);
  if ((unint64_t)(v38 + 1) < *((void *)&v56[0] + 1)) {
    uint64_t v39 = v38 + 1;
  }
  else {
    uint64_t v39 = *((void *)&v56[0] + 1);
  }
  unint64_t v40 = *((void *)&v56[0] + 1) - v37 + v39;
  if (*((void *)&v56[0] + 1) < v40) {
    unint64_t v40 = *((void *)&v56[0] + 1);
  }
  uint64_t v52 = *(unsigned __int8 **)&v56[0];
  unint64_t v53 = v40;
  if (v40 && **(unsigned char **)&v56[0] == 58)
  {
    *(void *)uint64_t v55 = *(void *)&v56[0] + 1;
    *(void *)&v55[8] = v40 - 1;
    unint64_t v41 = sub_226DCF3BC(v55, " \t\n\v\f\r", 6, 0);
    if (v41 >= *(void *)&v55[8]) {
      unint64_t v42 = *(void *)&v55[8];
    }
    else {
      unint64_t v42 = v41;
    }
    unint64_t v43 = *(void *)&v55[8] - v42;
    *(void *)&v56[0] = *(void *)v55 + v42;
    *((void *)&v56[0] + 1) = *(void *)&v55[8] - v42;
    uint64_t v44 = sub_226DCF43C(v56, " \t\n\v\f\r", 6, 0xFFFFFFFFFFFFFFFFLL);
    if ((unint64_t)(v44 + 1) < *((void *)&v56[0] + 1)) {
      uint64_t v45 = v44 + 1;
    }
    else {
      uint64_t v45 = *((void *)&v56[0] + 1);
    }
    unint64_t v46 = *((void *)&v56[0] + 1) - v43 + v45;
    uint64_t v47 = *(void *)&v56[0];
    if (*((void *)&v56[0] + 1) >= v46) {
      unint64_t v48 = v46;
    }
    else {
      unint64_t v48 = *((void *)&v56[0] + 1);
    }
    uint64_t v52 = 0;
    unint64_t v53 = 0;
  }
  else
  {
    unint64_t v48 = 0;
    uint64_t v47 = 0;
  }
  unint64_t v49 = sub_226DCF3BC(&v52, " \t\n\v\f\r", 6, 0);
  if (v49 >= v53) {
    unint64_t v50 = v53;
  }
  else {
    unint64_t v50 = v49;
  }
  *(void *)&v56[0] = &v52[v50];
  *((void *)&v56[0] + 1) = v53 - v50;
  uint64_t result = sub_226DCF43C(v56, " \t\n\v\f\r", 6, 0xFFFFFFFFFFFFFFFFLL);
  *(_DWORD *)a3 = 1;
  *(_OWORD *)(a3 + 8) = v54;
  *(void *)(a3 + 24) = v19;
  *(void *)(a3 + 32) = v33;
  *(_DWORD *)(a3 + 40) = v28;
  *(unsigned char *)(a3 + 44) = v27;
  *(void *)(a3 + 48) = v47;
  *(void *)(a3 + 56) = v48;
LABEL_71:
  *(unsigned char *)(a3 + 64) = 1;
  return result;
}

double sub_226DCC6BC@<D0>(char *__s@<X0>, size_t __n@<X1>, uint64_t a3@<X8>)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (__n)
  {
    size_t v5 = __n;
    while (2)
    {
      if (*__s == 123)
      {
        uint64_t v6 = 1;
        do
        {
          if (v5 == v6)
          {
            unint64_t v8 = -1;
            if (v5 != -1) {
              unint64_t v8 = v5;
            }
            if (v8 >= 2) {
              goto LABEL_37;
            }
            goto LABEL_14;
          }
          int v7 = __s[v6++];
        }
        while (v7 == 123);
        unint64_t v8 = v6 - 1;
        if (v5 < v8) {
          unint64_t v8 = v5;
        }
        if (v8 >= 2)
        {
LABEL_37:
          unint64_t v19 = v8 >> 1;
          if (v5 < v8 >> 1) {
            unint64_t v19 = v5;
          }
          *(void *)(a3 + 24) = 0;
          *(void *)(a3 + 32) = 0;
          unint64_t v20 = v8 & 0xFFFFFFFFFFFFFFFELL;
          *(void *)&v23[11] = 0;
          if (v5 < v20) {
            unint64_t v20 = v5;
          }
          *(void *)&v23[3] = 0;
          *(_DWORD *)a3 = 2;
          *(void *)(a3 + 8) = __s;
          *(void *)(a3 + 16) = v19;
          *(_DWORD *)(a3 + 40) = 2;
          *(unsigned char *)(a3 + 44) = 0;
          double result = *(double *)v23;
          *(_OWORD *)(a3 + 45) = *(_OWORD *)v23;
          *(_DWORD *)(a3 + 60) = 0;
          *(void *)(a3 + 64) = &__s[v20];
          *(void *)(a3 + 72) = v5 - v20;
          return result;
        }
LABEL_14:
        uint64_t v9 = memchr(__s, 125, v5);
        if (!v9 || (unint64_t v10 = v9 - __s, v9 - __s == -1))
        {
          *(void *)(a3 + 24) = 0;
          *(void *)(a3 + 32) = 0;
          *(void *)&v23[11] = 0;
          *(void *)&v23[3] = 0;
          *(void *)(a3 + 64) = 0;
          *(void *)(a3 + 72) = 0;
          *(_DWORD *)a3 = 2;
          *(void *)(a3 + 8) = __s;
          *(void *)(a3 + 16) = v5;
          goto LABEL_31;
        }
        if (v5 < 2 || (unint64_t v11 = memchr(__s + 1, 123, v5 - 1)) == 0 || (v12 = v11 - __s, v11 - __s >= v10))
        {
          if (v10 <= 1) {
            unint64_t v13 = 1;
          }
          else {
            unint64_t v13 = v10;
          }
          if (v5 < v13) {
            unint64_t v13 = v5;
          }
          uint64_t v14 = __s + 1;
          uint64_t v15 = v13 - 1;
          if (v5 >= v10 + 1) {
            size_t v16 = v10 + 1;
          }
          else {
            size_t v16 = v5;
          }
          __s += v16;
          v5 -= v16;
          sub_226DCC1E0((uint64_t)v14, v15, (uint64_t)v23);
          if (v26)
          {
            long long v21 = *(_OWORD *)&v23[16];
            *(_OWORD *)a3 = *(_OWORD *)v23;
            *(_OWORD *)(a3 + 16) = v21;
            double result = *(double *)&v24;
            long long v22 = v25;
            *(_OWORD *)(a3 + 32) = v24;
            *(_OWORD *)(a3 + 48) = v22;
            *(void *)(a3 + 64) = __s;
            *(void *)(a3 + 72) = v5;
            return result;
          }
          if (v5) {
            continue;
          }
          goto LABEL_29;
        }
        if (v5 < v12) {
          unint64_t v12 = v5;
        }
        *(void *)(a3 + 24) = 0;
        *(void *)(a3 + 32) = 0;
        *(void *)&v23[11] = 0;
      }
      else
      {
        uint64_t v18 = memchr(__s, 123, v5);
        unint64_t v12 = v18 - __s;
        *(void *)(a3 + 24) = 0;
        *(void *)(a3 + 32) = 0;
        if (!v18) {
          unint64_t v12 = -1;
        }
        *(void *)&v23[11] = 0;
        if (v5 < v12) {
          unint64_t v12 = v5;
        }
      }
      break;
    }
    *(void *)&v23[3] = 0;
    *(_DWORD *)a3 = 2;
    *(void *)(a3 + 8) = __s;
    *(void *)(a3 + 16) = v12;
    *(_DWORD *)(a3 + 40) = 2;
    *(unsigned char *)(a3 + 44) = 0;
    double result = *(double *)v23;
    *(_OWORD *)(a3 + 45) = *(_OWORD *)v23;
    *(_DWORD *)(a3 + 60) = *(_DWORD *)&v23[15];
    *(void *)(a3 + 64) = &__s[v12];
    *(void *)(a3 + 72) = v5 - v12;
    return result;
  }
LABEL_29:
  *(void *)&v23[11] = 0;
  *(void *)&v23[3] = 0;
  *(void *)(a3 + 64) = 0;
  *(void *)(a3 + 72) = 0;
  *(_DWORD *)a3 = 2;
  *(void *)(a3 + 24) = 0;
  *(void *)(a3 + 32) = 0;
  *(void *)(a3 + 8) = __s;
  *(void *)(a3 + 16) = 0;
LABEL_31:
  *(_DWORD *)(a3 + 40) = 2;
  *(unsigned char *)(a3 + 44) = 0;
  double result = *(double *)v23;
  *(_OWORD *)(a3 + 45) = *(_OWORD *)v23;
  *(_DWORD *)(a3 + 60) = *(_DWORD *)&v23[15];
  return result;
}

double sub_226DCC93C@<D0>(char *__s@<X0>, size_t __n@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = a3 + 16;
  *(void *)a3 = a3 + 16;
  *(void *)(a3 + 8) = 0x200000000;
  *(_DWORD *)uint64_t v23 = 0;
  *(void *)&long long v5 = 0;
  memset(&v23[8], 0, 32);
  *(_DWORD *)&v23[40] = 2;
  v23[44] = 0;
  long long v24 = 0uLL;
  if (__n)
  {
    size_t v6 = __n;
    do
    {
      sub_226DCC6BC(__s, v6, (uint64_t)v18);
      *(_OWORD *)uint64_t v23 = v18[0];
      *(_OWORD *)&v23[16] = v18[1];
      *(void *)&long long v5 = v19;
      *(_OWORD *)&unsigned char v23[32] = v19;
      long long v24 = v20;
      __s = v21;
      size_t v6 = v22;
      if (!LODWORD(v18[0])) {
        continue;
      }
      uint64_t v13 = *(unsigned int *)(a3 + 8);
      unint64_t v8 = *(void *)a3;
      if (v13 >= *(_DWORD *)(a3 + 12))
      {
        unint64_t v14 = v13 + 1;
        BOOL v15 = v8 + (v13 << 6) > (unint64_t)v23;
        if (v8 <= (unint64_t)v23 && v15)
        {
          sub_226DCEE0C(a3, v4, v14, 64);
          size_t v16 = &v23[-v8];
          unint64_t v8 = *(void *)a3;
          uint64_t v9 = (long long *)&v16[*(void *)a3];
          goto LABEL_5;
        }
        sub_226DCEE0C(a3, v4, v14, 64);
        unint64_t v8 = *(void *)a3;
      }
      uint64_t v9 = (long long *)v23;
LABEL_5:
      unint64_t v10 = (_OWORD *)(v8 + ((unint64_t)*(unsigned int *)(a3 + 8) << 6));
      long long v5 = *v9;
      long long v11 = v9[1];
      long long v12 = v9[3];
      v10[2] = v9[2];
      v10[3] = v12;
      *unint64_t v10 = v5;
      v10[1] = v11;
      ++*(_DWORD *)(a3 + 8);
    }
    while (v6);
  }
  return *(double *)&v5;
}

void sub_226DCCA74(_Unwind_Exception *exception_object)
{
  if (*v2 != v1) {
    free(*v2);
  }
  _Unwind_Resume(exception_object);
}

void sub_226DCCA94(unint64_t *a1, uint64_t (*a2)(void), unint64_t a3)
{
  if (sub_226DCF6E0())
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26815DB90, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_26815DB90))
    {
      MEMORY[0x22A6699A0](&stru_26815DB98);
      __cxa_atexit(MEMORY[0x263F8C0E0], &stru_26815DB98, &dword_226DAE000);
      __cxa_guard_release(&qword_26815DB90);
    }
    std::recursive_mutex::lock(&stru_26815DB98);
    if (!*a1)
    {
      atomic_store(a2(), a1);
      uint64_t v6 = qword_26815DB88;
      a1[1] = a3;
      a1[2] = v6;
      qword_26815DB88 = (uint64_t)a1;
    }
    std::recursive_mutex::unlock(&stru_26815DB98);
  }
  else
  {
    atomic_store(a2(), a1);
    uint64_t v7 = qword_26815DB88;
    a1[1] = a3;
    a1[2] = v7;
    qword_26815DB88 = (uint64_t)a1;
  }
}

void sub_226DCCB94(_Unwind_Exception *a1)
{
}

void sub_226DCCBAC(_Unwind_Exception *a1)
{
}

char *sub_226DCCBC4(uint64_t a1, uint64_t a2)
{
  v12[32] = *MEMORY[0x263EF8340];
  unint64_t v10 = v12;
  long long v11 = xmmword_226DD4410;
  if (*(unsigned char *)(a2 + 33) == 1)
  {
    size_t v3 = 0;
    uint64_t v4 = 0;
    switch(*(unsigned char *)(a2 + 32))
    {
      case 1:
        break;
      case 3:
        uint64_t v4 = *(const void **)a2;
        if (*(void *)a2) {
          size_t v3 = strlen(*(const char **)a2);
        }
        else {
          size_t v3 = 0;
        }
        break;
      case 4:
        unint64_t v8 = *(const char **)a2;
        int v9 = *(char *)(*(void *)a2 + 23);
        if (v9 >= 0) {
          uint64_t v4 = *(const void **)a2;
        }
        else {
          uint64_t v4 = *(const void **)v8;
        }
        if (v9 >= 0) {
          size_t v3 = *(unsigned __int8 *)(*(void *)a2 + 23);
        }
        else {
          size_t v3 = *((void *)v8 + 1);
        }
        break;
      case 5:
        uint64_t v4 = *(const void **)a2;
        size_t v3 = *(void *)(a2 + 8);
        break;
      default:
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    sub_226DCFA8C(a2, (uint64_t)&v10);
    uint64_t v4 = v10;
    size_t v3 = v11;
  }
  long long v5 = (char *)operator new(a1 + v3 + 1);
  uint64_t v6 = &v5[a1];
  if (v3) {
    memcpy(v6, v4, v3);
  }
  v6[v3] = 0;
  if (v10 != v12) {
    free(v10);
  }
  return v5;
}

void sub_226DCCD20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9)
{
  if (a9 != v9) {
    free(a9);
  }
  _Unwind_Resume(exception_object);
}

void *sub_226DCCD54@<X0>(unsigned __int8 *a1@<X0>, int a2@<W1>, int a3@<W2>, char a4@<W3>, uint64_t a5@<X8>)
{
  return sub_226DCCD74(a5, a1, 0xFFFFFFFFFFFFFFFFLL, 0, a2, a3, a4);
}

void *sub_226DCCD74(uint64_t a1, unsigned __int8 *a2, size_t a3, off_t a4, int a5, int a6, char a7)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (a5) {
    int v13 = 3;
  }
  else {
    int v13 = 0;
  }
  sub_226DCE75C(a2, v13, 0, (uint64_t)&v20);
  if (v21)
  {
    BOOL v15 = v20;
    long long v20 = 0;
    long long v19 = v15;
    uint64_t v16 = sub_226DCB720(&v19);
    *(unsigned char *)(a1 + 16) |= 1u;
    *(void *)a1 = v16;
    *(void *)(a1 + 8) = v17;
    double result = v19;
    if (v19) {
      double result = (void *)(*(uint64_t (**)(void *))(*v19 + 8))(v19);
    }
  }
  else
  {
    int v18 = (int)v20;
    sub_226DCD148(a1, (int)v20, (uint64_t)a2, 0xFFFFFFFFFFFFFFFFLL, a3, a4, a6, a7);
    double result = (void *)sub_226DCE8A0(&v18);
  }
  if (v21)
  {
    double result = v20;
    long long v20 = 0;
    if (result) {
      return (void *)(*(uint64_t (**)(void *))(*result + 8))(result);
    }
  }
  return result;
}

void sub_226DCCECC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _Unwind_Exception *a12, uint64_t a13, uint64_t a14, char a15)
{
  if ((*(unsigned char *)(v15 + 16) & 1) == 0)
  {
    sub_226DD2F24((uint64_t *)v15);
    exception_object = a12;
  }
  if (a15)
  {
    if (a14)
    {
      (*(void (**)(uint64_t))(*(void *)a14 + 8))(a14);
      _Unwind_Resume(exception_object);
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226DCCF58(size_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  v17[32] = *MEMORY[0x263EF8340];
  uint64_t v15 = v17;
  long long v16 = xmmword_226DD4410;
  if (*(unsigned char *)(a2 + 33) == 1)
  {
    size_t v5 = 0;
    uint64_t v6 = 0;
    switch(*(unsigned char *)(a2 + 32))
    {
      case 1:
        break;
      case 3:
        uint64_t v6 = *(const void **)a2;
        if (*(void *)a2) {
          size_t v5 = strlen(*(const char **)a2);
        }
        else {
          size_t v5 = 0;
        }
        break;
      case 4:
        int v13 = *(const char **)a2;
        int v14 = *(char *)(*(void *)a2 + 23);
        if (v14 >= 0) {
          uint64_t v6 = *(const void **)a2;
        }
        else {
          uint64_t v6 = *(const void **)v13;
        }
        if (v14 >= 0) {
          size_t v5 = *(unsigned __int8 *)(*(void *)a2 + 23);
        }
        else {
          size_t v5 = *((void *)v13 + 1);
        }
        break;
      case 5:
        uint64_t v6 = *(const void **)a2;
        size_t v5 = *(void *)(a2 + 8);
        break;
      default:
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    sub_226DCFA8C(a2, (uint64_t)&v15);
    uint64_t v6 = v15;
    size_t v5 = v16;
  }
  unint64_t v7 = (v5 + 40) & 0xFFFFFFFFFFFFFFF0;
  size_t v8 = a1 + v7 + 1;
  if (v8 <= a1)
  {
    unint64_t v10 = 0;
  }
  else
  {
    int v9 = operator new(v8, MEMORY[0x263F8C180]);
    unint64_t v10 = v9;
    if (v9)
    {
      long long v11 = (char *)(v9 + 3);
      if (v5) {
        memcpy(v9 + 3, v6, v5);
      }
      v11[v5] = 0;
      long long v12 = (char *)v10 + v7 + a1;
      *long long v12 = 0;
      *unint64_t v10 = &unk_26DAEFB50;
      v10[1] = (char *)v10 + v7;
      v10[2] = v12;
    }
  }
  *a3 = v10;
  if (v15 != v17) {
    free(v15);
  }
}

void sub_226DCD118(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9)
{
  if (a9 != v9) {
    free(a9);
  }
  _Unwind_Resume(exception_object);
}

void sub_226DCD148(uint64_t a1, int a2, uint64_t a3, size_t a4, size_t a5, off_t a6, int a7, char a8)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26815DBE8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26815DBE8))
  {
    dword_26815DBDC = sub_226DCD8BC();
    __cxa_guard_release(&qword_26815DBE8);
  }
  if (a5 == -1 && (a5 = a4, a4 == -1))
  {
    long long v39 = 0u;
    memset(v40, 0, sizeof(v40));
    uint64_t v41 = 0xFFFFLL;
    __int16 v42 = 0;
    uint64_t v43 = 0;
    uint64_t v24 = sub_226DCE488(a2, (uint64_t)&v39);
    if (v24)
    {
      *(unsigned char *)(a1 + 16) |= 1u;
      *(void *)a1 = v24;
      *(void *)(a1 + 8) = v25;
      return;
    }
    if (*(_DWORD *)&v40[24] != 2 && *(_DWORD *)&v40[24] != 5)
    {
      sub_226DCD698();
      char v34 = *(unsigned char *)(a1 + 16);
      if (v46)
      {
        char v35 = v34 | 1;
        unint64_t v36 = v44;
        *(void *)(a1 + 8) = v45;
      }
      else
      {
        char v35 = v34 & 0xFE;
        unint64_t v36 = v44;
      }
      *(unsigned char *)(a1 + 16) = v35;
      *(void *)a1 = v36;
      return;
    }
    a5 = *(void *)&v40[16];
    a4 = *(void *)&v40[16];
    size_t v16 = dword_26815DBDC;
    if (a7)
    {
LABEL_5:
      if (a8) {
        goto LABEL_27;
      }
    }
  }
  else
  {
    size_t v16 = dword_26815DBDC;
    if (a7) {
      goto LABEL_5;
    }
  }
  BOOL v17 = a5 >= 0x4000 && a5 >= v16;
  char v18 = !v17;
  if (v17 && a7)
  {
    if (a4 == -1)
    {
      long long v39 = 0u;
      memset(v40, 0, sizeof(v40));
      uint64_t v41 = 0xFFFFLL;
      __int16 v42 = 0;
      uint64_t v43 = 0;
      if (sub_226DCE488(a2, (uint64_t)&v39)) {
        goto LABEL_27;
      }
      a4 = *(void *)&v40[16];
      if (a5 + a6 != *(void *)&v40[16]) {
        goto LABEL_27;
      }
LABEL_17:
      if ((a4 & ((int)v16 - 1)) == 0) {
        goto LABEL_27;
      }
LABEL_20:
      LODWORD(v39) = 0;
      *((void *)&v39 + 1) = std::system_category();
      long long v19 = sub_226DCCBC4(48, a3);
      *(void *)long long v19 = &unk_26DAEFBA0;
      int v20 = sub_226DCE5AC();
      int v21 = sub_226DCE5AC();
      sub_226DCE4C4((uint64_t)(v19 + 24), a2, 0, ((v20 - 1) & (unint64_t)a6) + a5, -v21 & (unint64_t)a6, &v39);
      if (!v39)
      {
        uint64_t v22 = sub_226DCE200((uint64_t)(v19 + 24));
        unint64_t v23 = v22 + ((int)(sub_226DCE5AC() - 1) & (unint64_t)a6);
        *((void *)v19 + 1) = v23;
        *((void *)v19 + 2) = v23 + a5;
        if (!v39)
        {
          *(unsigned char *)(a1 + 16) &= ~1u;
          *(void *)a1 = v19;
          return;
        }
      }
      (*(void (**)(char *))(*(void *)v19 + 8))(v19);
      goto LABEL_27;
    }
    if (a5 + a6 == a4) {
      goto LABEL_17;
    }
  }
  else if ((v18 & 1) == 0)
  {
    goto LABEL_20;
  }
LABEL_27:
  sub_226DCCF58(a5, a3, &v38);
  if (!v38)
  {
    uint64_t v33 = std::generic_category();
    *(unsigned char *)(a1 + 16) |= 1u;
    *(void *)a1 = 12;
    *(void *)(a1 + 8) = v33;
    return;
  }
  char v26 = (char *)v38[1];
  unint64_t v27 = v38[2] - (void)v26;
  do
  {
    if (!v27) {
      goto LABEL_44;
    }
    sub_226DCE7DC(a2, v26, v27, a6, (uint64_t)&v44);
    if (v45)
    {
      unint64_t v29 = v44;
      uint64_t v44 = 0;
      unint64_t v37 = v29;
      uint64_t v30 = sub_226DCB720(&v37);
      *(unsigned char *)(a1 + 16) |= 1u;
      *(void *)a1 = v30;
      *(void *)(a1 + 8) = v31;
      if (v37)
      {
        (*(void (**)(void *))(*v37 + 8))(v37);
        int v28 = 1;
        if ((v45 & 1) == 0) {
          continue;
        }
      }
      else
      {
        int v28 = 1;
        if ((v45 & 1) == 0) {
          continue;
        }
      }
    }
    else if (v44)
    {
      int v28 = 0;
      v27 -= (unint64_t)v44;
      char v26 = (char *)v44 + (void)v26;
      a6 += (off_t)v44;
      if ((v45 & 1) == 0) {
        continue;
      }
    }
    else
    {
      bzero(v26, v27);
      int v28 = 3;
      if ((v45 & 1) == 0) {
        continue;
      }
    }
    int v32 = v44;
    uint64_t v44 = 0;
    if (v32) {
      (*(void (**)(void *))(*v32 + 8))(v32);
    }
  }
  while (!v28);
  if (v28 == 3)
  {
LABEL_44:
    *(unsigned char *)(a1 + 16) &= ~1u;
    *(void *)a1 = v38;
    return;
  }
  if (v38) {
    (*(void (**)(void *))(*v38 + 8))(v38);
  }
}

void sub_226DCD5E4(_Unwind_Exception *a1)
{
}

void sub_226DCD5FC(_Unwind_Exception *a1)
{
  sub_226DCE578(v1);
  _Unwind_Resume(a1);
}

void sub_226DCD698()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  uint64_t v2 = v1;
  uint64_t v3 = v0;
  v16[2048] = *MEMORY[0x263EF8340];
  int v14 = v16;
  long long v15 = xmmword_226DD4550;
  sub_226DCE208(v4, &v14, 0x4000uLL, &v13);
  if (v13)
  {
    long long v12 = (void *)v13;
    uint64_t v13 = 0;
    uint64_t v5 = sub_226DCB720(&v12);
    *(unsigned char *)(v3 + 16) |= 1u;
    *(void *)uint64_t v3 = v5;
    *(void *)(v3 + 8) = v6;
    if (v12) {
      (*(void (**)(void *))(*v12 + 8))(v12);
    }
    if (v13)
    {
      (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
      unint64_t v7 = v14;
      if (v14 == v16) {
        return;
      }
      goto LABEL_10;
    }
LABEL_9:
    unint64_t v7 = v14;
    if (v14 == v16) {
      return;
    }
    goto LABEL_10;
  }
  size_t v8 = v14;
  size_t v9 = v15;
  sub_226DCCF58(v15, v2, &v13);
  uint64_t v10 = v13;
  if (v13)
  {
    memcpy(*(void **)(v13 + 8), v8, v9);
    *(unsigned char *)(v3 + 16) &= ~1u;
    *(void *)uint64_t v3 = v10;
    goto LABEL_9;
  }
  long long v11 = std::generic_category();
  *(unsigned char *)(v3 + 16) |= 1u;
  *(void *)uint64_t v3 = 12;
  *(void *)(v3 + 8) = v11;
  unint64_t v7 = v14;
  if (v14 == v16) {
    return;
  }
LABEL_10:
  free(v7);
}

void sub_226DCD84C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11)
{
  if (a11 == v11) {
    _Unwind_Resume(exception_object);
  }
  free(a11);
  _Unwind_Resume(exception_object);
}

uint64_t sub_226DCD8BC()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  sub_226DCE8B4((uint64_t)&v5);
  if ((v6 & 1) == 0) {
    return v5;
  }
  uint64_t v1 = v5;
  uint64_t v5 = 0;
  uint64_t v3 = v1;
  sub_226DC4520(&v3, &v4);
  if (v3) {
    (*(void (**)(void *))(*v3 + 8))(v3);
  }
  if (v6)
  {
    uint64_t v2 = v5;
    uint64_t v5 = 0;
    if (v2) {
      (*(void (**)(void *))(*v2 + 8))(v2);
    }
  }
  return 4096;
}

void sub_226DCD9A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, __int16 a10, char a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  if (a13) {
    sub_226DD2718();
  }
  sub_226DD2FD0((uint64_t)&a12, &a16, &a15);
  _Unwind_Resume(a1);
}

uint64_t sub_226DCD9E4(uint64_t a1)
{
  uint64_t v1 = a1 + 24;
  strlen((const char *)(a1 + 24));
  return v1;
}

uint64_t sub_226DCDA14()
{
  return 0;
}

void *sub_226DCDA1C(void *a1)
{
  *a1 = &unk_26DAEFBA0;
  sub_226DCE578(a1 + 3);
  return a1;
}

void sub_226DCDA64(size_t *a1)
{
  *a1 = (size_t)&unk_26DAEFBA0;
  sub_226DCE578(a1 + 3);

  operator delete(a1);
}

uint64_t sub_226DCDABC(uint64_t a1)
{
  uint64_t v1 = a1 + 48;
  strlen((const char *)(a1 + 48));
  return v1;
}

void *sub_226DCDAEC(uint64_t a1)
{
  return sub_226DCE590((size_t *)(a1 + 24));
}

uint64_t sub_226DCDAF4()
{
  return 1;
}

uint64_t sub_226DCDAFC(uint64_t *a1)
{
  uint64_t result = *a1;
  *a1 = 0;
  return result;
}

void sub_226DCDB18()
{
  *(void *)uint64_t v0 = v2;
  *(_DWORD *)(v0 + 8) = v1;
}

uint64_t sub_226DCDB38(uint64_t a1, unint64_t a2, size_t a3, int a4)
{
  return sub_226DCDB40(a1, a2, a3, a4, 0);
}

uint64_t sub_226DCDB40(uint64_t a1, unint64_t a2, size_t a3, int a4, int a5)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (!HIDWORD(a2))
  {
    return sub_226DCDECC(a1, a2, a3, a4, a5);
  }
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  *(void *)&long long v11 = 0x3030303030303030;
  *((void *)&v11 + 1) = 0x3030303030303030;
  v23[6] = v11;
  v23[7] = v11;
  v23[4] = v11;
  v23[5] = v11;
  v23[2] = v11;
  v23[3] = v11;
  v23[0] = v11;
  v23[1] = v11;
  do
  {
    *((unsigned char *)&v23[7] + v10-- + 15) = (a2 % 0xA) | 0x30;
    v9 += 0x100000000;
    BOOL v12 = a2 > 9;
    a2 /= 0xAuLL;
  }
  while (v12);
  size_t v13 = v9 >> 32;
  if (!a5)
  {
LABEL_10:
    if (a4 != 1) {
      goto LABEL_11;
    }
    goto LABEL_16;
  }
  int v14 = *(unsigned char **)(a1 + 32);
  if ((unint64_t)v14 < *(void *)(a1 + 24))
  {
    *(void *)(a1 + 32) = v14 + 1;
    *int v14 = 45;
    goto LABEL_10;
  }
  sub_226DD0484(a1, 45);
  if (a4 != 1)
  {
LABEL_11:
    if (v13 < a3)
    {
      size_t v15 = v13;
      do
      {
        while (1)
        {
          size_t v16 = *(unsigned char **)(a1 + 32);
          if ((unint64_t)v16 >= *(void *)(a1 + 24)) {
            break;
          }
          *(void *)(a1 + 32) = v16 + 1;
          *size_t v16 = 48;
          if (++v15 >= a3) {
            goto LABEL_16;
          }
        }
        sub_226DD0484(a1, 48);
        ++v15;
      }
      while (v15 < a3);
    }
  }
LABEL_16:
  BOOL v17 = &v24[-v13];
  if (a4 != 1) {
    return sub_226DD0534(a1, v17, v13);
  }
  unint64_t v18 = (v13 - 1) % 3;
  size_t v19 = v13 - (v18 + 1);
  if (v13 >= v18 + 1) {
    size_t v20 = v18 + 1;
  }
  else {
    size_t v20 = v13;
  }
  uint64_t result = sub_226DD0534(a1, v17, v20);
  if (v19)
  {
    unint64_t v21 = -3 * ((-(int)v10 - 1) / 3uLL);
    do
    {
      uint64_t v22 = *(unsigned char **)(a1 + 32);
      if ((unint64_t)v22 < *(void *)(a1 + 24))
      {
        *(void *)(a1 + 32) = v22 + 1;
        *uint64_t v22 = 44;
      }
      else
      {
        sub_226DD0484(a1, 44);
      }
      uint64_t result = sub_226DD0534(a1, &v24[v21], 3uLL);
      v21 += 3;
    }
    while (v21);
  }
  return result;
}

uint64_t sub_226DCDDAC(uint64_t a1, unint64_t a2, size_t a3, int a4)
{
  if ((a2 & 0x8000000000000000) != 0)
  {
    a2 = -(uint64_t)a2;
    int v4 = 1;
  }
  else
  {
    int v4 = 0;
  }
  return sub_226DCDB40(a1, a2, a3, a4, v4);
}

uint64_t sub_226DCDDC4(uint64_t a1, unint64_t a2, int a3, unint64_t a4, char a5)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a5)
  {
    if (a4 > 0x7F) {
      LODWORD(a4) = 128;
    }
  }
  else
  {
    LODWORD(a4) = 0;
  }
  unsigned int v5 = (67 - __clz(a2)) >> 2;
  if (v5 <= 1) {
    unsigned int v5 = 1;
  }
  *(void *)&long long v6 = 0x3030303030303030;
  *((void *)&v6 + 1) = 0x3030303030303030;
  v11[6] = v6;
  v11[7] = v6;
  v11[4] = v6;
  v11[5] = v6;
  LODWORD(v7) = v5 + 2 * ((a3 & 0xFFFFFFFE) == 2);
  v11[2] = v6;
  v11[3] = v6;
  if (v7 <= a4) {
    size_t v7 = a4;
  }
  else {
    size_t v7 = v7;
  }
  v11[0] = v6;
  v11[1] = v6;
  if ((a3 & 0xFFFFFFFE) == 2) {
    BYTE1(v11[0]) = 120;
  }
  if (a2)
  {
    size_t v8 = (char *)&v11[-1] + v7 + 15;
    do
    {
      *v8-- = a0123456789abcd[a2 & 0xF] | (32 * ((a3 & 0xFFFFFFFD) != 0));
      BOOL v9 = a2 > 0xF;
      a2 >>= 4;
    }
    while (v9);
  }
  return sub_226DD0534(a1, v11, v7);
}

uint64_t sub_226DCDECC(uint64_t a1, unsigned int a2, size_t a3, int a4, int a5)
{
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v25 = *MEMORY[0x263EF8340];
  *(void *)&long long v10 = 0x3030303030303030;
  *((void *)&v10 + 1) = 0x3030303030303030;
  v23[6] = v10;
  v23[7] = v10;
  v23[4] = v10;
  v23[5] = v10;
  v23[2] = v10;
  v23[3] = v10;
  v23[0] = v10;
  v23[1] = v10;
  do
  {
    *((unsigned char *)&v23[7] + v9-- + 15) = (a2 % 0xA) | 0x30;
    v8 += 0x100000000;
    BOOL v11 = a2 > 9;
    a2 /= 0xAu;
  }
  while (v11);
  size_t v12 = v8 >> 32;
  if (!a5)
  {
LABEL_6:
    if (a4 == 1) {
      goto LABEL_14;
    }
    goto LABEL_9;
  }
  size_t v13 = *(unsigned char **)(a1 + 32);
  if ((unint64_t)v13 < *(void *)(a1 + 24))
  {
    *(void *)(a1 + 32) = v13 + 1;
    *size_t v13 = 45;
    goto LABEL_6;
  }
  sub_226DD0484(a1, 45);
  if (a4 == 1) {
    goto LABEL_14;
  }
LABEL_9:
  if (v12 < a3)
  {
    size_t v14 = v12;
    do
    {
      while (1)
      {
        size_t v15 = *(unsigned char **)(a1 + 32);
        if ((unint64_t)v15 >= *(void *)(a1 + 24)) {
          break;
        }
        *(void *)(a1 + 32) = v15 + 1;
        *size_t v15 = 48;
        if (++v14 >= a3) {
          goto LABEL_14;
        }
      }
      sub_226DD0484(a1, 48);
      ++v14;
    }
    while (v14 < a3);
  }
LABEL_14:
  size_t v16 = &v24[-v12];
  if (a4 != 1) {
    return sub_226DD0534(a1, v16, v12);
  }
  unint64_t v17 = (v12 - 1) % 3;
  size_t v18 = v12 - (v17 + 1);
  if (v12 >= v17 + 1) {
    size_t v19 = v17 + 1;
  }
  else {
    size_t v19 = v12;
  }
  uint64_t result = sub_226DD0534(a1, v16, v19);
  if (v18)
  {
    unint64_t v21 = -3 * ((-(int)v9 - 1) / 3uLL);
    do
    {
      uint64_t v22 = *(unsigned char **)(a1 + 32);
      if ((unint64_t)v22 < *(void *)(a1 + 24))
      {
        *(void *)(a1 + 32) = v22 + 1;
        *uint64_t v22 = 44;
      }
      else
      {
        sub_226DD0484(a1, 44);
      }
      uint64_t result = sub_226DD0534(a1, &v24[v21], 3uLL);
      v21 += 3;
    }
    while (v21);
  }
  return result;
}

unint64_t sub_226DCE0E0(unsigned __int8 *a1, int *a2, int a3, void *a4)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v6 = sub_226DCE5B0(a1, a2, 2, 1, a3, 438);
  uint64_t v7 = v6;
  if (v6)
  {
    unint64_t v8 = v6 & 0xFFFFFFFF00000000;
  }
  else
  {
    if (a4)
    {
      a4[1] = 0;
      if (fcntl(*a2, 50, __s) != -1)
      {
        size_t v10 = strlen(__s);
        uint64_t v11 = a4[1];
        if (a4[2] < v11 + v10)
        {
          sub_226DCEF28((uint64_t)a4, a4 + 3, v11 + v10, 1);
          uint64_t v11 = a4[1];
        }
        if (v10)
        {
          memcpy((void *)(*a4 + v11), __s, v10);
          uint64_t v11 = a4[1];
        }
        a4[1] = v11 + v10;
      }
    }
    std::system_category();
    unint64_t v8 = 0;
  }
  return v8 | v7;
}

uint64_t sub_226DCE200(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

ssize_t sub_226DCE208@<X0>(int a1@<W0>, void *a2@<X1>, unint64_t a3@<X2>, void *a4@<X8>)
{
  unint64_t v8 = a2[1];
  uint64_t v9 = a2 + 3;
  if (a3 >= 0x7FFFFFFF) {
    size_t v10 = 0x7FFFFFFFLL;
  }
  else {
    size_t v10 = a3;
  }
  uint64_t v11 = a2[1];
  unint64_t v12 = v8 + a3;
  BOOL v13 = v8 > v8 + a3;
  if (v8 != v8 + a3)
  {
LABEL_5:
    if (!v13 && a2[2] < v12) {
      sub_226DCEF28((uint64_t)a2, v9, v12, 1);
    }
    a2[1] = v12;
  }
  while (1)
  {
    size_t v14 = (void *)(*a2 + v11);
    while (1)
    {
      *__error() = 0;
      ssize_t result = read(a1, v14, v10);
      if (result != -1) {
        break;
      }
      if (*__error() != 4)
      {
        int v17 = *__error();
        std::generic_category();
        ssize_t result = sub_226DCB674(v17, &v19);
        uint64_t v18 = v19;
        goto LABEL_16;
      }
    }
    if (!result) {
      break;
    }
    v11 += result;
    unint64_t v16 = a2[1];
    unint64_t v12 = v11 + a3;
    BOOL v13 = v16 > v11 + a3;
    if (v16 != v11 + a3) {
      goto LABEL_5;
    }
  }
  uint64_t v18 = 0;
LABEL_16:
  *a4 = v18;
  a2[1] = v11;
  return result;
}

void sub_226DCE328(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_226DCE330(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_226DCE338(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t sub_226DCE340(int a1, int *a2, uint64_t a3)
{
  if (a1)
  {
    uint64_t v4 = *__error();
    unsigned int v5 = std::generic_category();
    if (v5 == std::generic_category() && v4 == 2)
    {
      *(void *)(a3 + 32) = 0;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      *(void *)(a3 + 40) = 0xFFFF00000001;
      *(_DWORD *)(a3 + 48) = 0;
      *(_WORD *)(a3 + 52) = 0;
      *(void *)(a3 + 56) = 0;
      return 2;
    }
    else
    {
      *(_OWORD *)(a3 + 28) = 0u;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      *(void *)(a3 + 44) = 0xFFFFLL;
      *(_WORD *)(a3 + 52) = 0;
      *(void *)(a3 + 56) = 0;
      return v4;
    }
  }
  else
  {
    int v7 = a2[10];
    int v8 = a2[14];
    unint64_t v9 = *((unsigned __int16 *)a2 + 2);
    int v10 = v9 & 0xFFF;
    uint64_t v11 = (v9 >> 12) ^ 8;
    if (v11 == 15) {
      int v12 = 9;
    }
    else {
      int v12 = dword_226DD4638[v11];
    }
    int v13 = *a2;
    __int16 v14 = *((_WORD *)a2 + 3);
    uint64_t v15 = *((void *)a2 + 1);
    uint64_t v16 = *((void *)a2 + 6);
    uint64_t v17 = *((void *)a2 + 12);
    uint64_t v18 = *((void *)a2 + 2);
    *(void *)a3 = *((void *)a2 + 4);
    *(void *)(a3 + 8) = v16;
    *(_DWORD *)(a3 + 16) = v7;
    *(_DWORD *)(a3 + 20) = v8;
    *(void *)(a3 + 24) = v18;
    *(void *)(a3 + 32) = v17;
    *(_DWORD *)(a3 + 40) = v12;
    *(_DWORD *)(a3 + 44) = v10;
    *(_DWORD *)(a3 + 48) = v13;
    *(_WORD *)(a3 + 52) = v14;
    *(void *)(a3 + 56) = v15;
    std::system_category();
    return 0;
  }
}

uint64_t sub_226DCE488(int a1, uint64_t a2)
{
  int v3 = fstat(a1, &v5);
  return sub_226DCE340(v3, &v5.st_dev, a2);
}

uint64_t sub_226DCE4C4(uint64_t a1, int a2, int a3, size_t a4, off_t a5, void *a6)
{
  *(void *)a1 = a4;
  *(void *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 16) = a3;
  if (a3 == 1) {
    int v9 = 65;
  }
  else {
    int v9 = 66;
  }
  BOOL v10 = a3 == 0;
  if (a3) {
    int v11 = 3;
  }
  else {
    int v11 = 1;
  }
  if (v10) {
    int v12 = 24642;
  }
  else {
    int v12 = v9;
  }
  int v13 = mmap(0, a4, v11, v12, a2, a5);
  *(void *)(a1 + 8) = v13;
  if (v13 != (void *)-1)
  {
    __int16 v14 = std::system_category();
    *a6 = 0;
    a6[1] = v14;
    return a1;
  }
  uint64_t v16 = *__error();
  uint64_t v17 = std::generic_category();
  *a6 = v16;
  a6[1] = v17;
  if (!v16) {
    return a1;
  }
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 16) = 0;
  return a1;
}

void *sub_226DCE578(size_t *a1)
{
  ssize_t result = (void *)a1[1];
  if (result) {
    return (void *)munmap(result, *a1);
  }
  return result;
}

void *sub_226DCE590(size_t *a1)
{
  ssize_t result = (void *)a1[1];
  if (result) {
    return (void *)posix_madvise(result, *a1, 4);
  }
  return result;
}

uint64_t sub_226DCE5B0(unsigned __int8 *a1, int *a2, int a3, int a4, int a5, uint64_t a6)
{
  v23[16] = *MEMORY[0x263EF8340];
  int v9 = 2 * (a4 == 3);
  if (a4 == 2) {
    int v9 = 1;
  }
  if (a4 == 1) {
    int v9 = 0;
  }
  int v10 = a5 & 4;
  if ((a5 & 4) != 0) {
    a3 = 3;
  }
  int v12 = v9 | 0x600;
  int v13 = v9 | 0x200;
  if (a3 == 1) {
    v9 |= 0xA00u;
  }
  if (a3 == 3) {
    int v9 = v13;
  }
  if (a3) {
    int v14 = v9;
  }
  else {
    int v14 = v12;
  }
  unint64_t v21 = v23;
  long long v22 = xmmword_226DD4620;
  uint64_t v15 = (const char *)sub_226DCFBA4(a1, (uint64_t)&v21);
  int v16 = v14 | ((a5 << 20) & 0x1000000 | (2 * v10)) ^ 0x1000000;
  while (1)
  {
    *__error() = 0;
    int v17 = open(v15, v16, a6);
    if (v17 != -1) {
      break;
    }
    if (*__error() != 4)
    {
      *a2 = -1;
      goto LABEL_22;
    }
  }
  *a2 = v17;
  if ((v17 & 0x80000000) == 0)
  {
    std::system_category();
    uint64_t v18 = 0;
    uint64_t v19 = v21;
    if (v21 == v23) {
      return v18;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v18 = *__error();
  std::generic_category();
  uint64_t v19 = v21;
  if (v21 == v23) {
    return v18;
  }
LABEL_23:
  free(v19);
  return v18;
}

void sub_226DCE738(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11)
{
  if (a11 != v11) {
    free(a11);
  }
  _Unwind_Resume(exception_object);
}

unint64_t sub_226DCE75C@<X0>(unsigned __int8 *a1@<X0>, int a2@<W1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  int v7 = 0;
  unint64_t result = sub_226DCE0E0(a1, &v7, a2, a3);
  if (result)
  {
    unint64_t result = sub_226DCB674(result, &v6);
    *(unsigned char *)(a4 + 8) |= 1u;
    *(void *)a4 = v6;
  }
  else
  {
    *(unsigned char *)(a4 + 8) &= ~1u;
    *(_DWORD *)a4 = v7;
  }
  return result;
}

ssize_t sub_226DCE7DC@<X0>(int a1@<W0>, void *a2@<X1>, unint64_t a3@<X2>, off_t a4@<X3>, uint64_t a5@<X8>)
{
  if (a3 >= 0x7FFFFFFF) {
    size_t v9 = 0x7FFFFFFFLL;
  }
  else {
    size_t v9 = a3;
  }
  while (1)
  {
    *__error() = 0;
    ssize_t result = pread(a1, a2, v9, a4);
    if (result != -1) {
      break;
    }
    if (*__error() != 4)
    {
      int v11 = *__error();
      std::generic_category();
      sub_226DCB674(v11, &v12);
      *(unsigned char *)(a5 + 8) |= 1u;
      ssize_t result = v12;
      goto LABEL_8;
    }
  }
  *(unsigned char *)(a5 + 8) &= ~1u;
LABEL_8:
  *(void *)a5 = result;
  return result;
}

uint64_t sub_226DCE8A0(int *a1)
{
  int v1 = *a1;
  *a1 = -1;
  return sub_226DCE978(v1);
}

void sub_226DCE8B4(uint64_t a1@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)qword_26815DC10, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(qword_26815DC10))
  {
    dword_26815DC08 = getpagesize();
    __cxa_guard_release(qword_26815DC10);
  }
  int v2 = dword_26815DC08;
  if (dword_26815DC08 == -1)
  {
    int v3 = *__error();
    std::generic_category();
    sub_226DCB674(v3, &v4);
    *(unsigned char *)(a1 + 8) |= 1u;
    *(void *)a1 = v4;
  }
  else
  {
    *(unsigned char *)(a1 + 8) &= ~1u;
    *(_DWORD *)a1 = v2;
  }
}

uint64_t sub_226DCE978(int a1)
{
  sigset_t v5 = -1;
  sigset_t v6 = -1;
  unsigned int v2 = pthread_sigmask(3, &v6, &v5);
  if (!v2)
  {
    if ((close(a1) & 0x80000000) == 0)
    {
      int v3 = pthread_sigmask(3, &v5, 0);
LABEL_5:
      unsigned int v2 = v3;
      goto LABEL_6;
    }
    unsigned int v2 = *__error();
    int v3 = pthread_sigmask(3, &v5, 0);
    if (!v2) {
      goto LABEL_5;
    }
  }
LABEL_6:
  std::generic_category();
  return v2;
}

BOOL sub_226DCEA0C(int a1)
{
  return isatty(a1) != 0;
}

BOOL sub_226DCEA2C()
{
  uint64_t v0 = getenv("TERM");
  int v1 = v0;
  if (!v0) {
    return 0;
  }
  size_t v2 = strlen(v0);
  if (v2 == 6)
  {
    if (*(_DWORD *)v1 == 2003269987 && *((_WORD *)v1 + 2) == 28265) {
      return v1 != 0;
    }
LABEL_22:
    if (*(_DWORD *)v1 == 1701995379 && *((_WORD *)v1 + 2) == 28261) {
      return v1 != 0;
    }
LABEL_26:
    if (*(_DWORD *)v1 == 1919251576 && v1[4] == 109) {
      return v1 != 0;
    }
    BOOL v8 = *(_DWORD *)v1 == 808547446 && v1[4] == 48;
    if (v8 || *(_DWORD *)v1 == 1953921138) {
      return v1 != 0;
    }
    if (*(_DWORD *)&v1[v2 - 5] == 1869377379 && v1[v2 - 1] == 114) {
      return v1 != 0;
    }
    return 0;
  }
  if (v2 == 5)
  {
    if (*(_DWORD *)v1 == 1970170220 && v1[4] == 120) {
      return v1 != 0;
    }
    goto LABEL_26;
  }
  if (v2 != 4)
  {
    if (v2 < 6) {
      return 0;
    }
    goto LABEL_22;
  }
  if (*(_DWORD *)v1 != 1769172577 && *(_DWORD *)v1 != 1953921138) {
    return 0;
  }
  return v1 != 0;
}

BOOL sub_226DCEBD4(int a1)
{
  if (!isatty(a1)) {
    return 0;
  }
  if (!atomic_load_explicit(qword_26815DBF0, memory_order_acquire)) {
    sub_226DCCA94((unint64_t *)qword_26815DBF0, (uint64_t (*)(void))sub_226DCED80, (unint64_t)sub_226DCEDCC);
  }
  size_t v2 = (std::mutex *)qword_26815DBF0[0];
  std::mutex::lock((std::mutex *)qword_26815DBF0[0]);
  int v3 = set_curterm(0);
  int v8 = 0;
  if (setupterm(0, a1, &v8))
  {
    BOOL v4 = 0;
  }
  else
  {
    int v6 = tigetnum("colors");
    if (v6 < 0) {
      BOOL v4 = sub_226DCEA2C();
    }
    else {
      BOOL v4 = v6 != 0;
    }
    int v7 = set_curterm(v3);
    del_curterm(v7);
  }
  std::mutex::unlock(v2);
  return v4;
}

void sub_226DCECDC(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_226DCECF0(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_226DCED04(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_226DCED18(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_226DCED2C()
{
  return 0;
}

char *sub_226DCED34(char a1, int a2, int a3)
{
  return &a030m[160 * a3 + 80 * a2 + 10 * (a1 & 7)];
}

const char *sub_226DCED5C()
{
  return "\x1B[1m";
}

const char *sub_226DCED68()
{
  return "\x1B[7m";
}

const char *sub_226DCED74()
{
  return "\x1B[0m";
}

void sub_226DCED80()
{
}

std::mutex *sub_226DCEDCC(std::mutex *result)
{
  if (result)
  {
    std::mutex::~mutex(result);
    JUMPOUT(0x22A669B00);
  }
  return result;
}

void *sub_226DCEE0C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (HIDWORD(a3)) {
    sub_226DCF024(a3);
  }
  uint64_t v5 = *(unsigned int *)(a1 + 12);
  if (v5 == -1) {
    sub_226DCF2BC(0xFFFFFFFFuLL);
  }
  unint64_t v7 = (2 * v5) | 1;
  if (v7 <= a3) {
    unint64_t v7 = a3;
  }
  if (v7 >= 0xFFFFFFFF) {
    uint64_t v8 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v8 = v7;
  }
  size_t v9 = *(void **)a1;
  uint64_t v10 = v8 * a4;
  if (*(void *)a1 == a2)
  {
    ssize_t v12 = malloc_type_malloc(v8 * a4, 0x4065EBACuLL);
    if (!v12 && (v10 || (ssize_t v12 = malloc_type_malloc(1uLL, 0x4065EBACuLL)) == 0)) {
LABEL_20:
    }
      sub_226DCB268();
    ssize_t result = memcpy(v12, *(const void **)a1, *(unsigned int *)(a1 + 8) * a4);
  }
  else
  {
    ssize_t result = malloc_type_realloc(v9, v8 * a4, 0x1DB68EDCuLL);
    ssize_t v12 = result;
    if (!result)
    {
      if (v10) {
        goto LABEL_20;
      }
      ssize_t result = malloc_type_malloc(1uLL, 0x4065EBACuLL);
      ssize_t v12 = result;
      if (!result) {
        goto LABEL_20;
      }
    }
  }
  *(void *)a1 = v12;
  *(_DWORD *)(a1 + 12) = v8;
  return result;
}

void *sub_226DCEF28(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4 == -1) {
    sub_226DCF2BC(0xFFFFFFFFFFFFFFFFLL);
  }
  unint64_t v7 = (2 * v4) | 1;
  if (v7 <= a3) {
    unint64_t v8 = a3;
  }
  else {
    unint64_t v8 = v7;
  }
  size_t v9 = *(void **)a1;
  unint64_t v10 = v8 * a4;
  if (v9 == a2)
  {
    ssize_t v12 = malloc_type_malloc(v8 * a4, 0x4065EBACuLL);
    if (!v12 && (v10 || (ssize_t v12 = malloc_type_malloc(1uLL, 0x4065EBACuLL)) == 0)) {
LABEL_16:
    }
      sub_226DCB268();
    ssize_t result = memcpy(v12, *(const void **)a1, *(void *)(a1 + 8) * a4);
  }
  else
  {
    ssize_t result = malloc_type_realloc(v9, v8 * a4, 0x1DB68EDCuLL);
    ssize_t v12 = result;
    if (!result)
    {
      if (v10) {
        goto LABEL_16;
      }
      ssize_t result = malloc_type_malloc(1uLL, 0x4065EBACuLL);
      ssize_t v12 = result;
      if (!result) {
        goto LABEL_16;
      }
    }
  }
  *(void *)a1 = v12;
  *(void *)(a1 + 16) = v8;
  return result;
}

void sub_226DCF024(unint64_t a1)
{
  std::to_string(&v13, a1);
  int v1 = std::string::insert(&v13, 0, "SmallVector unable to grow. Requested capacity (");
  long long v2 = *(_OWORD *)&v1->__r_.__value_.__l.__data_;
  v14.__r_.__value_.__r.__words[2] = v1->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v14.__r_.__value_.__l.__data_ = v2;
  v1->__r_.__value_.__l.__size_ = 0;
  v1->__r_.__value_.__r.__words[2] = 0;
  v1->__r_.__value_.__r.__words[0] = 0;
  int v3 = std::string::append(&v14, ") is larger than maximum value for size type (");
  long long v4 = *(_OWORD *)&v3->__r_.__value_.__l.__data_;
  v15.__r_.__value_.__r.__words[2] = v3->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v15.__r_.__value_.__l.__data_ = v4;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&__p, 0xFFFFFFFFuLL);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
  }
  unint64_t v7 = std::string::append(&v15, (const std::string::value_type *)p_p, size);
  long long v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
  v16.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v16.__r_.__value_.__l.__data_ = v8;
  v7->__r_.__value_.__l.__size_ = 0;
  v7->__r_.__value_.__r.__words[2] = 0;
  v7->__r_.__value_.__r.__words[0] = 0;
  size_t v9 = std::string::append(&v16, ")");
  long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  v17.__r_.__value_.__r.__words[2] = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v16.__r_.__value_.__l.__data_);
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_9:
      if ((SHIBYTE(v15.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_10;
      }
      goto LABEL_16;
    }
  }
  else if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_9;
  }
  operator delete(__p.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v15.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_10:
    if ((SHIBYTE(v14.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_17;
  }
LABEL_16:
  operator delete(v15.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v14.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_11:
    if ((SHIBYTE(v13.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_17:
  operator delete(v14.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v13.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_13:
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, &v17);
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
    __cxa_throw(exception, (struct type_info *)off_2647E6A98, MEMORY[0x263F8C060]);
  }
LABEL_12:
  operator delete(v13.__r_.__value_.__l.__data_);
  goto LABEL_13;
}

void sub_226DCF1CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (*(char *)(v33 - 25) < 0)
  {
    operator delete(*(void **)(v33 - 48));
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_226DCF240(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    JUMPOUT(0x226DCF24CLL);
  }
  JUMPOUT(0x226DCF20CLL);
}

void sub_226DCF260(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    JUMPOUT(0x226DCF26CLL);
  }
  JUMPOUT(0x226DCF214);
}

void sub_226DCF280(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    JUMPOUT(0x226DCF28CLL);
  }
  JUMPOUT(0x226DCF21CLL);
}

void sub_226DCF2A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    JUMPOUT(0x226DCF2ACLL);
  }
  JUMPOUT(0x226DCF224);
}

void sub_226DCF2BC(unint64_t a1)
{
  std::to_string(&v4, a1);
  int v1 = std::string::insert(&v4, 0, "SmallVector capacity unable to grow. Already at maximum size ");
  long long v2 = *(_OWORD *)&v1->__r_.__value_.__l.__data_;
  v5.__r_.__value_.__r.__words[2] = v1->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v5.__r_.__value_.__l.__data_ = v2;
  v1->__r_.__value_.__l.__size_ = 0;
  v1->__r_.__value_.__r.__words[2] = 0;
  v1->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v4.__r_.__value_.__l.__data_);
  }
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::logic_error::logic_error(exception, &v5);
  exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  __cxa_throw(exception, (struct type_info *)off_2647E6A98, MEMORY[0x263F8C060]);
}

void sub_226DCF368(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if ((a18 & 0x80000000) == 0) {
    _Unwind_Resume(exception_object);
  }
  operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_226DCF3A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(a1);
  }
  JUMPOUT(0x226DCF374);
}

uint64_t sub_226DCF3BC(void *a1, unsigned __int8 *a2, uint64_t a3, unint64_t a4)
{
  for (; a3; --a3)
  {
    unsigned int v4 = *a2++;
    *(void *)((char *)&v7 + (((unint64_t)v4 >> 3) & 0x18)) |= 1 << v4;
  }
  unint64_t v5 = a1[1];
  if (v5 <= a4) {
    return -1;
  }
  while (((*(void *)((char *)&v7 + (((unint64_t)*(unsigned __int8 *)(*a1 + a4) >> 3) & 0x18)) >> *(unsigned char *)(*a1 + a4)) & 1) != 0)
  {
    if (v5 == ++a4) {
      return -1;
    }
  }
  return a4;
}

uint64_t sub_226DCF43C(void *a1, unsigned __int8 *a2, uint64_t a3, unint64_t a4)
{
  for (; a3; --a3)
  {
    unsigned int v4 = *a2++;
    *(void *)((char *)&v10 + (((unint64_t)v4 >> 3) & 0x18)) |= 1 << v4;
  }
  if (a1[1] >= a4) {
    unint64_t v5 = a4;
  }
  else {
    unint64_t v5 = a1[1];
  }
  while (v5)
  {
    unint64_t v6 = v5 - 1;
    unint64_t v7 = *(unsigned __int8 *)(*a1 + v5 - 1);
    uint64_t v8 = *(void *)((char *)&v10 + ((v7 >> 3) & 0x18)) >> v7;
    unint64_t v5 = v6;
    if ((v8 & 1) == 0) {
      return v6;
    }
  }
  return -1;
}

uint64_t sub_226DCF4CC(unsigned __int8 **a1, unsigned int a2, unint64_t *a3)
{
  if (a2)
  {
    unint64_t v5 = a1[1];
    if (!v5) {
      return 1;
    }
  }
  else
  {
    a2 = sub_226DCF5DC((uint64_t)a1);
    unint64_t v5 = a1[1];
    if (!v5) {
      return 1;
    }
  }
  unint64_t v6 = 0;
  unint64_t v7 = *a1;
  *a3 = 0;
  uint64_t v8 = v5;
  do
  {
    if ((char)*v7 < 48) {
      break;
    }
    unsigned int v9 = *v7;
    if (v9 >= 0x3A)
    {
      if (v9 < 0x61)
      {
        if (v9 - 65 > 0x19) {
          break;
        }
        unsigned int v10 = v9 - 55;
        if (v10 >= a2) {
          break;
        }
      }
      else
      {
        if (v9 >= 0x7B) {
          break;
        }
        unsigned int v10 = v9 - 87;
        if (v10 >= a2) {
          break;
        }
      }
    }
    else
    {
      unsigned int v10 = v9 - 48;
      if (v10 >= a2) {
        break;
      }
    }
    unint64_t v11 = v6 * a2 + v10;
    *a3 = v11;
    if (v11 / a2 < v6) {
      return 1;
    }
    ++v7;
    unint64_t v6 = v11;
    --v8;
  }
  while (v8);
  if (v5 == v8) {
    return 1;
  }
  uint64_t result = 0;
  *a1 = v7;
  a1[1] = v8;
  return result;
}

uint64_t sub_226DCF5DC(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 < 2) {
    return 10;
  }
  int v3 = *(unsigned char **)a1;
  if (**(_WORD **)a1 == 30768 || *(_WORD *)v3 == 22576)
  {
    *(void *)a1 = v3 + 2;
    *(void *)(a1 + 8) = v1 - 2;
    return 16;
  }
  else if (*(_WORD *)v3 == 25136 || *(_WORD *)v3 == 16944)
  {
    *(void *)a1 = v3 + 2;
    *(void *)(a1 + 8) = v1 - 2;
    return 2;
  }
  else if (*(_WORD *)v3 == 28464)
  {
    *(void *)a1 = v3 + 2;
    *(void *)(a1 + 8) = v1 - 2;
    return 8;
  }
  else
  {
    if (*v3 != 48) {
      return 10;
    }
    int v5 = v3[1];
    unsigned int v4 = v3 + 1;
    if ((v5 - 48) > 9) {
      return 10;
    }
    *(void *)a1 = v4;
    *(void *)(a1 + 8) = v1 - 1;
    return 8;
  }
}

uint64_t sub_226DCF6E0()
{
  return 1;
}

void sub_226DCF6E8(unsigned __int8 *a1@<X0>, void *a2@<X8>)
{
  long long v2 = (void **)a1;
  v18[32] = *MEMORY[0x263EF8340];
  int v4 = a1[32];
  if (v4 != 6)
  {
    if (v4 != 4)
    {
      int v8 = a1[33];
      std::string v16 = v18;
      long long v17 = xmmword_226DD4410;
      if (v8 == 1)
      {
        switch(v4)
        {
          case 1:
            goto LABEL_22;
          case 3:
            long long v2 = *(void ***)a1;
            if (!*(void *)a1) {
              goto LABEL_22;
            }
            size_t v9 = strlen((const char *)v2);
            goto LABEL_18;
          case 4:
            long long v2 = *(void ***)a1;
            if (*(char *)(*(void *)a1 + 23) < 0) {
              goto LABEL_16;
            }
            size_t v9 = *(unsigned __int8 *)(*(void *)a1 + 23);
            if (v9 >= 0x17) {
              goto LABEL_29;
            }
            goto LABEL_20;
          case 5:
            goto LABEL_16;
          default:
            break;
        }
      }
LABEL_15:
      sub_226DCFA8C((uint64_t)a1, (uint64_t)&v16);
      long long v2 = &v16;
LABEL_16:
      if (!*v2)
      {
LABEL_22:
        *a2 = 0;
        a2[1] = 0;
        a2[2] = 0;
        unsigned int v10 = v16;
        if (v16 == v18) {
          return;
        }
LABEL_34:
        free(v10);
        return;
      }
      size_t v9 = (size_t)v2[1];
      long long v2 = (void **)*v2;
LABEL_18:
      if (v9 >= 0x7FFFFFFFFFFFFFF8) {
        sub_226DBC384();
      }
      if (v9 >= 0x17)
      {
LABEL_29:
        uint64_t v13 = (v9 & 0x7FFFFFFFFFFFFFF8) + 8;
        if ((v9 | 7) != 0x17) {
          uint64_t v13 = v9 | 7;
        }
        uint64_t v14 = v13 + 1;
        std::string v15 = operator new(v13 + 1);
        a2[1] = v9;
        a2[2] = v14 | 0x8000000000000000;
        *a2 = v15;
        a2 = v15;
      }
      else
      {
LABEL_20:
        *((unsigned char *)a2 + 23) = v9;
        if (!v9)
        {
LABEL_33:
          *((unsigned char *)a2 + v9) = 0;
          unsigned int v10 = v16;
          if (v16 == v18) {
            return;
          }
          goto LABEL_34;
        }
      }
      memmove(a2, v2, v9);
      goto LABEL_33;
    }
    if (a1[33] == 1)
    {
      int v5 = *(void ***)a1;
      if (*(char *)(*(void *)a1 + 23) < 0)
      {
        unint64_t v11 = *v5;
        unint64_t v12 = (unint64_t)v5[1];
        sub_226DBC2E4(a2, v11, v12);
      }
      else
      {
        long long v6 = *(_OWORD *)v5;
        a2[2] = v5[2];
        *(_OWORD *)a2 = v6;
      }
      return;
    }
LABEL_10:
    std::string v16 = v18;
    long long v17 = xmmword_226DD4410;
    goto LABEL_15;
  }
  if (a1[33] != 1) {
    goto LABEL_10;
  }
  uint64_t v7 = *(void *)a1;

  sub_226DCF9B0(v7, a2);
}

void sub_226DCF980(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9)
{
  if (a9 != v9) {
    free(a9);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_226DCF9B0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  int v5 = 0;
  char v9 = 0;
  uint64_t v10 = 0;
  int v11 = 1;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v6 = 0;
  int v4 = &unk_26DAEFD10;
  unint64_t v12 = a2;
  sub_226DD0120((uint64_t)&v4, 0, 0, 0);
  sub_226DD07B8((uint64_t)&v4, a1);
  if (v8 != v6) {
    sub_226DD03E4(&v4);
  }
  return sub_226DCFF84((uint64_t)&v4);
}

void sub_226DCFA64(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_226DCFF84((uint64_t)va);
  if (*(char *)(v2 + 23) < 0) {
    operator delete(*(void **)v2);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_226DCFA8C(uint64_t a1, uint64_t a2)
{
  int v7 = 0;
  char v11 = 0;
  uint64_t v12 = 0;
  int v13 = 1;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v8 = 0;
  uint64_t v6 = &unk_26DAEFDA0;
  uint64_t v14 = a2;
  int v3 = (void *)sub_226DD0120((uint64_t)&v6, 0, 0, 0);
  int v4 = sub_226DCFC84(v3, (uint64_t)&v6, *(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 32));
  sub_226DCFC84(v4, (uint64_t)&v6, *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 33));
  return sub_226DCFF84((uint64_t)&v6);
}

void sub_226DCFB30(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_226DCFF84((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_226DCFB44(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_226DCFF84((uint64_t)va);
  _Unwind_Resume(a1);
}

void *sub_226DCFB58(unsigned __int8 *a1, uint64_t a2)
{
  int v4 = sub_226DCFC84(a1, a2, *(void *)a1, *((void *)a1 + 1), a1[32]);
  uint64_t v5 = *((void *)a1 + 2);
  size_t v6 = *((void *)a1 + 3);
  unsigned __int8 v7 = a1[33];

  return sub_226DCFC84(v4, a2, v5, v6, v7);
}

void *sub_226DCFBA4(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = (void *)a2;
  if (a1[33] != 1) {
    goto LABEL_7;
  }
  unsigned int v3 = a1[32];
  if (v3 < 2) {
    goto LABEL_7;
  }
  if (v3 == 4)
  {
    uint64_t v2 = *(void **)a1;
    if ((*(char *)(*(void *)a1 + 23) & 0x80000000) == 0) {
      return *(void **)a1;
    }
    return (void *)*v2;
  }
  if (v3 != 3)
  {
LABEL_7:
    sub_226DCFA8C((uint64_t)a1, a2);
    uint64_t v6 = v2[1];
    if ((unint64_t)(v6 + 1) > v2[2])
    {
      sub_226DCEF28((uint64_t)v2, v2 + 3, v6 + 1, 1);
      uint64_t v6 = v2[1];
    }
    *(unsigned char *)(*v2 + v6) = 0;
    return (void *)*v2;
  }
  uint64_t v4 = *(void *)a1;
  if (!*(void *)a1) {
    return 0;
  }
  strlen(*(const char **)a1);
  return (void *)v4;
}

void *sub_226DCFC84(void *result, uint64_t a2, uint64_t a3, size_t a4, unsigned __int8 a5)
{
  int v8 = a5;
  if (a5 == 2)
  {
    do
    {
      uint64_t result = (void *)sub_226DCFC84(result, a2, *(void *)a3, *(void *)(a3 + 8), *(unsigned __int8 *)(a3 + 32));
      unsigned __int8 v9 = *(unsigned char *)(a3 + 33);
      uint64_t v10 = a3 + 16;
      a3 = *(void *)(a3 + 16);
      a4 = *(void *)(v10 + 8);
      int v8 = v9;
    }
    while (v9 == 2);
  }
  switch(v8)
  {
    case 3:
      if (a3)
      {
        a4 = strlen((const char *)a3);
        uint64_t result = *(void **)(a2 + 32);
        if (a4 > *(void *)(a2 + 24) - (void)result) {
          goto LABEL_18;
        }
        goto LABEL_6;
      }
      return result;
    case 4:
      int v11 = *(char *)(a3 + 23);
      if (v11 >= 0) {
        uint64_t v12 = (unsigned char *)a3;
      }
      else {
        uint64_t v12 = *(unsigned char **)a3;
      }
      if (v11 >= 0) {
        size_t v13 = *(unsigned __int8 *)(a3 + 23);
      }
      else {
        size_t v13 = *(void *)(a3 + 8);
      }
      uint64_t v14 = a2;
      return (void *)sub_226DD0534(v14, v12, v13);
    case 5:
      uint64_t result = *(void **)(a2 + 32);
      if (a4 <= *(void *)(a2 + 24) - (void)result)
      {
LABEL_6:
        if (a4)
        {
          uint64_t result = memcpy(result, (const void *)a3, a4);
          *(void *)(a2 + 32) += a4;
        }
      }
      else
      {
LABEL_18:
        uint64_t v14 = a2;
        uint64_t v12 = (unsigned char *)a3;
        size_t v13 = a4;
        return (void *)sub_226DD0534(v14, v12, v13);
      }
      return result;
    case 6:
      return (void *)sub_226DD07B8(a2, a3);
    case 7:
      std::string v15 = *(unsigned char **)(a2 + 32);
      if ((unint64_t)v15 >= *(void *)(a2 + 24))
      {
        return (void *)sub_226DD0484(a2, a3);
      }
      else
      {
        *(void *)(a2 + 32) = v15 + 1;
        *std::string v15 = a3;
      }
      return result;
    case 8:
      unint64_t v16 = a3;
      uint64_t v17 = a2;
      goto LABEL_29;
    case 9:
      unint64_t v18 = (int)a3;
      uint64_t v19 = a2;
      goto LABEL_32;
    case 10:
      unint64_t v16 = *(void *)a3;
      uint64_t v17 = a2;
      goto LABEL_29;
    case 11:
      unint64_t v18 = *(void *)a3;
      uint64_t v19 = a2;
      goto LABEL_32;
    case 12:
      unint64_t v16 = *(void *)a3;
      uint64_t v17 = a2;
LABEL_29:
      uint64_t result = (void *)sub_226DD018C(v17, v16);
      break;
    case 13:
      unint64_t v18 = *(void *)a3;
      uint64_t v19 = a2;
LABEL_32:
      uint64_t result = (void *)sub_226DD01BC(v19, v18);
      break;
    case 14:
      unint64_t v20 = *(void *)a3;
      uint64_t result = (void *)sub_226DD01EC(a2, v20);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_226DCFF84(uint64_t a1)
{
  *(void *)a1 = &unk_26DAEFBF0;
  if (*(_DWORD *)(a1 + 56) == 1)
  {
    uint64_t v2 = *(void *)(a1 + 16);
    if (v2) {
      MEMORY[0x22A669AE0](v2, 0x1000C8077774924);
    }
  }
  return a1;
}

uint64_t sub_226DCFFF4()
{
  return 1024;
}

uint64_t sub_226DCFFFC(uint64_t *a1)
{
  uint64_t result = (*(uint64_t (**)(uint64_t *))(*a1 + 88))(a1);
  uint64_t v4 = a1 + 2;
  uint64_t v3 = a1[2];
  uint64_t v5 = a1[4];
  if (result)
  {
    if (v5 != v3)
    {
      a1[4] = v3;
      sub_226DD03F8(a1, v3, v5 - v3);
    }
    operator new[]();
  }
  uint64_t v6 = v5 - v3;
  if (v5 != v3)
  {
    a1[4] = v3;
    uint64_t result = sub_226DD03F8(a1, v3, v6);
  }
  if (*((_DWORD *)a1 + 14) == 1)
  {
    uint64_t result = *v4;
    if (*v4) {
      uint64_t result = MEMORY[0x22A669AE0](result, 0x1000C8077774924, v6);
    }
  }
  *((_DWORD *)a1 + 14) = 0;
  a1[3] = 0;
  a1[4] = 0;
  *uint64_t v4 = 0;
  return result;
}

uint64_t sub_226DD0120(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v7 = result;
  if (*(_DWORD *)(result + 56) == 1)
  {
    uint64_t result = *(void *)(result + 16);
    if (result) {
      uint64_t result = MEMORY[0x22A669AE0](result, 0x1000C8077774924);
    }
  }
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a2 + a3;
  *(void *)(v7 + 32) = a2;
  *(_DWORD *)(v7 + 56) = a4;
  return result;
}

uint64_t sub_226DD018C(uint64_t a1, unint64_t a2)
{
  return a1;
}

uint64_t sub_226DD01BC(uint64_t a1, unint64_t a2)
{
  return a1;
}

uint64_t sub_226DD01EC(uint64_t a1, unint64_t a2)
{
  return a1;
}

uint64_t sub_226DD0220(uint64_t a1, uint64_t a2)
{
  v16[16] = *MEMORY[0x263EF8340];
  unint64_t v4 = *(void *)(a1 + 24) - *(void *)(a1 + 32);
  if (v4 <= 3)
  {
    unint64_t v7 = 127;
  }
  else
  {
    int v5 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 8))(a2);
    if (v5 < v4) {
      unsigned int v6 = v5;
    }
    else {
      unsigned int v6 = v5 + 1;
    }
    if (v5 >= 0) {
      unint64_t v7 = v6;
    }
    else {
      unint64_t v7 = (2 * v4);
    }
    if (v4 >= v7)
    {
      *(void *)(a1 + 32) += v7;
      return a1;
    }
  }
  uint64_t v14 = v16;
  long long v15 = xmmword_226DD4620;
  do
  {
    uint64_t v8 = v15;
    if ((void)v15 != v7)
    {
      if ((unint64_t)v15 <= v7)
      {
        if (*((void *)&v15 + 1) < v7)
        {
          sub_226DCEF28((uint64_t)&v14, v16, v7, 1);
          uint64_t v8 = v15;
        }
        if (v7 != v8) {
          bzero((char *)v14 + v8, v7 - v8);
        }
      }
      *(void *)&long long v15 = v7;
    }
    int v9 = (*(uint64_t (**)(uint64_t, void *, unint64_t))(*(void *)a2 + 8))(a2, v14, v7);
    if (v9 < v7) {
      unsigned int v10 = v9;
    }
    else {
      unsigned int v10 = v9 + 1;
    }
    if (v9 >= 0) {
      size_t v11 = v10;
    }
    else {
      size_t v11 = (2 * v7);
    }
    BOOL v12 = v7 >= v11;
    unint64_t v7 = v11;
  }
  while (!v12);
  sub_226DD0534(a1, v14, v11);
  if (v14 != v16) {
    free(v14);
  }
  return a1;
}

void sub_226DD03C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9)
{
  if (a9 != v9) {
    free(a9);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_226DD03E4(void *a1)
{
  uint64_t v1 = a1[2];
  uint64_t v2 = a1[4] - v1;
  a1[4] = v1;
  return sub_226DD03F8(a1, v1, v2);
}

uint64_t sub_226DD03F8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = a1[6];
  if (v6)
  {
    uint64_t v7 = *(void *)(v6 + 16);
    if (*(void *)(v6 + 32) != v7)
    {
      *(void *)(v6 + 32) = v7;
      sub_226DD03F8();
    }
  }
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*a1 + 72);

  return v8(a1, a2, a3);
}

uint64_t sub_226DD0484(uint64_t a1, char a2)
{
  unint64_t v4 = *(unsigned char **)(a1 + 32);
  if ((unint64_t)v4 >= *(void *)(a1 + 24))
  {
    while (1)
    {
      uint64_t v6 = *(void *)(a1 + 16);
      if (v6)
      {
        *(void *)(a1 + 32) = v6;
        sub_226DD03F8((void *)a1, v6, (uint64_t)&v4[-v6]);
        unint64_t v4 = *(unsigned char **)(a1 + 32);
        goto LABEL_2;
      }
      if (!*(_DWORD *)(a1 + 56)) {
        break;
      }
      sub_226DCFFFC((uint64_t *)a1);
      unint64_t v4 = *(unsigned char **)(a1 + 32);
      if ((unint64_t)v4 < *(void *)(a1 + 24)) {
        goto LABEL_2;
      }
    }
    char v7 = a2;
    sub_226DD03F8((void *)a1, (uint64_t)&v7, 1);
    return a1;
  }
  else
  {
LABEL_2:
    *(void *)(a1 + 32) = v4 + 1;
    *unint64_t v4 = a2;
    return a1;
  }
}

uint64_t sub_226DD0534(uint64_t a1, unsigned char *a2, size_t __n)
{
  size_t v3 = __n;
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v6 = *(unsigned char **)(a1 + 32);
  size_t v8 = v7 - (void)v6;
  if (v7 - (uint64_t)v6 < __n)
  {
    while (1)
    {
      while (1)
      {
        size_t v11 = *(unsigned char **)(a1 + 16);
        if (!v11) {
          break;
        }
        if (v6 == v11)
        {
          v8 *= v3 / v8;
          v3 -= v8;
          sub_226DD03F8((void *)a1, (uint64_t)a2, v8);
          uint64_t v6 = *(unsigned char **)(a1 + 32);
          size_t v10 = *(void *)(a1 + 24) - (void)v6;
          if (v3 <= v10)
          {
            sub_226DD06F4((void **)a1, &a2[v8], v3);
            return a1;
          }
        }
        else
        {
          sub_226DD06F4((void **)a1, a2, v8);
          uint64_t v12 = *(void *)(a1 + 16);
          uint64_t v13 = *(void *)(a1 + 32) - v12;
          *(void *)(a1 + 32) = v12;
          sub_226DD03F8((void *)a1, v12, v13);
          v3 -= v8;
          uint64_t v6 = *(unsigned char **)(a1 + 32);
          size_t v10 = *(void *)(a1 + 24) - (void)v6;
        }
        a2 += v8;
        size_t v8 = v10;
        if (v10 >= v3) {
          goto LABEL_2;
        }
      }
      if (!*(_DWORD *)(a1 + 56)) {
        break;
      }
      sub_226DCFFFC((uint64_t *)a1);
      uint64_t v6 = *(unsigned char **)(a1 + 32);
      size_t v8 = *(void *)(a1 + 24) - (void)v6;
      if (v8 >= v3) {
        goto LABEL_2;
      }
    }
    sub_226DD03F8((void *)a1, (uint64_t)a2, v3);
    return a1;
  }
  else
  {
LABEL_2:
    switch(v3)
    {
      case 0uLL:
        break;
      case 1uLL:
        goto LABEL_6;
      case 2uLL:
        goto LABEL_5;
      case 3uLL:
        goto LABEL_4;
      case 4uLL:
        v6[3] = a2[3];
        uint64_t v6 = *(unsigned char **)(a1 + 32);
LABEL_4:
        v6[2] = a2[2];
        uint64_t v6 = *(unsigned char **)(a1 + 32);
LABEL_5:
        v6[1] = a2[1];
        uint64_t v6 = *(unsigned char **)(a1 + 32);
LABEL_6:
        *uint64_t v6 = *a2;
        break;
      default:
        memcpy(v6, a2, v3);
        break;
    }
    *(void *)(a1 + 32) += v3;
    return a1;
  }
}

void **sub_226DD06F4(void **result, unsigned char *a2, size_t __n)
{
  unint64_t v4 = result;
  switch(__n)
  {
    case 0uLL:
      goto LABEL_6;
    case 1uLL:
      goto LABEL_5;
    case 2uLL:
      goto LABEL_4;
    case 3uLL:
      goto LABEL_3;
    case 4uLL:
      *((unsigned char *)result[4] + 3) = a2[3];
LABEL_3:
      *((unsigned char *)result[4] + 2) = a2[2];
LABEL_4:
      *((unsigned char *)result[4] + 1) = a2[1];
LABEL_5:
      *(unsigned char *)result[4] = *a2;
LABEL_6:
      result[4] = (char *)result[4] + __n;
      break;
    default:
      uint64_t result = (void **)memcpy(result[4], a2, __n);
      v4[4] = (char *)v4[4] + __n;
      break;
  }
  return result;
}

uint64_t sub_226DD07B8(uint64_t a1, uint64_t a2)
{
  return a1;
}

void sub_226DD07E8(uint64_t a1, uint64_t a2)
{
  v21[16] = *MEMORY[0x263EF8340];
  sub_226DCC93C(*(char **)a1, *(void *)(a1 + 8), (uint64_t)&v19);
  unint64_t v4 = v19;
  if (v20)
  {
    int v5 = (char *)v19 + 32;
    unint64_t v6 = (unint64_t)v20 << 6;
    do
    {
      int v7 = *((_DWORD *)v5 - 8);
      if (v7)
      {
        if (v7 == 2 || (unint64_t v8 = *((void *)v5 - 1), v8 >= *(void *)(a1 + 24)))
        {
          uint64_t v12 = (unsigned char *)*((void *)v5 - 3);
          unint64_t v13 = *((void *)v5 - 2);
          uint64_t v14 = *(void **)(a2 + 32);
          if (v13 > *(void *)(a2 + 24) - (void)v14)
          {
            sub_226DD0534(a2, v12, *((void *)v5 - 2));
          }
          else if (v13)
          {
            memcpy(v14, v12, *((void *)v5 - 2));
            *(void *)(a2 + 32) += v13;
          }
        }
        else
        {
          int v9 = *((_DWORD *)v5 + 2);
          uint64_t v10 = *(void *)v5;
          char v11 = v5[12];
          uint64_t v15 = *(void *)(*(void *)(a1 + 16) + 8 * v8);
          int v16 = v9;
          uint64_t v17 = v10;
          char v18 = v11;
          sub_226DD169C(&v15, a2);
        }
      }
      v5 += 64;
      v6 -= 64;
    }
    while (v6);
    unint64_t v4 = v19;
  }
  if (v4 != v21) {
    free(v4);
  }
}

void sub_226DD0934(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t *a14, uint64_t a15, uint64_t a16)
{
  if (a14 == &a16) {
    _Unwind_Resume(exception_object);
  }
  free(a14);
  _Unwind_Resume(exception_object);
}

uint64_t sub_226DD0964(uint64_t a1)
{
  *(void *)a1 = &unk_26DAEFBF0;
  if (*(_DWORD *)(a1 + 56) == 1)
  {
    uint64_t v2 = *(void *)(a1 + 16);
    if (v2) {
      MEMORY[0x22A669AE0](v2, 0x1000C8077774924);
    }
  }
  return a1;
}

uint64_t sub_226DD09CC(uint64_t a1, int a2, int a3, int a4)
{
  if (*(unsigned char *)(a1 + 40)
    && (!sub_226DCED2C() || (*(unsigned int (**)(uint64_t))(*(void *)a1 + 48))(a1)))
  {
    if (sub_226DCED2C())
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 16);
      if (v8 != v9)
      {
        *(void *)(a1 + 32) = v9;
        sub_226DD03F8((void *)a1, v9, v8 - v9);
      }
    }
    if (a2 == 8)
    {
      uint64_t v10 = (char *)sub_226DCED5C();
      if (!v10) {
        return a1;
      }
      goto LABEL_11;
    }
    uint64_t v10 = sub_226DCED34(a2, a3, a4);
    if (v10)
    {
LABEL_11:
      size_t v11 = strlen(v10);
      sub_226DD0534(a1, v10, v11);
    }
  }
  return a1;
}

uint64_t sub_226DD0AB0(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)
    && (!sub_226DCED2C() || (*(unsigned int (**)(uint64_t))(*(void *)a1 + 48))(a1)))
  {
    if (sub_226DCED2C())
    {
      uint64_t v2 = *(void *)(a1 + 32);
      uint64_t v3 = *(void *)(a1 + 16);
      if (v2 != v3)
      {
        *(void *)(a1 + 32) = v3;
        sub_226DD03F8((void *)a1, v3, v2 - v3);
      }
    }
    unint64_t v4 = sub_226DCED74();
    if (v4)
    {
      int v5 = (char *)v4;
      size_t v6 = strlen(v4);
      sub_226DD0534(a1, v5, v6);
    }
  }
  return a1;
}

uint64_t sub_226DD0B54(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)
    && (!sub_226DCED2C() || (*(unsigned int (**)(uint64_t))(*(void *)a1 + 48))(a1)))
  {
    if (sub_226DCED2C())
    {
      uint64_t v2 = *(void *)(a1 + 32);
      uint64_t v3 = *(void *)(a1 + 16);
      if (v2 != v3)
      {
        *(void *)(a1 + 32) = v3;
        sub_226DD03F8((void *)a1, v3, v2 - v3);
      }
    }
    unint64_t v4 = sub_226DCED68();
    if (v4)
    {
      int v5 = (char *)v4;
      size_t v6 = strlen(v4);
      sub_226DD0534(a1, v5, v6);
    }
  }
  return a1;
}

uint64_t sub_226DD0C00(uint64_t a1, int a2, char a3, int a4, int a5)
{
  *(_DWORD *)(a1 + 8) = a5;
  *(unsigned char *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(_DWORD *)(a1 + 56) = a4 ^ 1;
  *(_DWORD *)(a1 + 60) = a2;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = &unk_26DAEFC68;
  *(unsigned char *)(a1 + 64) = a3;
  *(_DWORD *)(a1 + 72) = 0;
  *(_DWORD *)(a1 + 65) = 0;
  *(void *)(a1 + 80) = std::system_category();
  *(void *)(a1 + 88) = 0;
  if ((*(_DWORD *)(a1 + 60) & 0x80000000) != 0)
  {
    *(unsigned char *)(a1 + 64) = 0;
    return a1;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 64))(a1, 1);
    int v6 = *(_DWORD *)(a1 + 60);
    if (v6 <= 2) {
      *(unsigned char *)(a1 + 64) = 0;
    }
    off_t v7 = lseek(v6, 0, 1);
    memset(v11, 0, sizeof(v11));
    uint64_t v12 = 0xFFFFLL;
    __int16 v13 = 0;
    uint64_t v14 = 0;
    int v8 = sub_226DCE488(*(_DWORD *)(a1 + 60), (uint64_t)v11);
    *(unsigned char *)(a1 + 66) = *(_DWORD *)&v11[40] == 2;
    *(unsigned char *)(a1 + 65) = v8 == 0 && v7 != -1;
    if (v8 == 0 && v7 != -1) {
      off_t v9 = v7;
    }
    else {
      off_t v9 = 0;
    }
    *(void *)(a1 + 88) = v9;
    return a1;
  }
}

void sub_226DD0D3C(_Unwind_Exception *a1)
{
  sub_226DCFF84(v1);
  _Unwind_Resume(a1);
}

void sub_226DD0D50(_Unwind_Exception *a1)
{
  sub_226DCFF84(v1);
  _Unwind_Resume(a1);
}

void sub_226DD0D64(_Unwind_Exception *a1)
{
  sub_226DCFF84(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_226DD0D78(uint64_t a1)
{
  *(void *)a1 = &unk_26DAEFC68;
  if ((*(_DWORD *)(a1 + 60) & 0x80000000) == 0)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 16);
    if (v2 != v3)
    {
      *(void *)(a1 + 32) = v3;
      sub_226DD03F8((void *)a1, v3, v2 - v3);
    }
    if (*(unsigned char *)(a1 + 64))
    {
      uint64_t v4 = sub_226DCE978(*(_DWORD *)(a1 + 60));
      if (v4)
      {
        *(void *)(a1 + 72) = v4;
        *(void *)(a1 + 80) = v5;
      }
    }
  }
  if (*(_DWORD *)(a1 + 72))
  {
    uint64_t v12 = "IO failure on output stream: ";
    __int16 v13 = 259;
    std::error_code v8 = *(std::error_code *)(a1 + 72);
    std::error_code::message(&v9, &v8);
    __int16 v11 = 260;
    uint64_t v10 = &v9;
    sub_226DD0EA4((uint64_t *)&v12, (uint64_t *)&v10, (uint64_t)v14);
    sub_226DCB268();
  }
  *(void *)a1 = &unk_26DAEFBF0;
  if (*(_DWORD *)(a1 + 56) == 1)
  {
    uint64_t v6 = *(void *)(a1 + 16);
    if (v6) {
      MEMORY[0x22A669AE0](v6, 0x1000C8077774924);
    }
  }
  return a1;
}

uint64_t *sub_226DD0EA4@<X0>(uint64_t *result@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  int v3 = *((unsigned __int8 *)result + 32);
  if (*((unsigned char *)result + 32) && (int v4 = *((unsigned __int8 *)a2 + 32), *((unsigned char *)a2 + 32)))
  {
    if (v3 == 1)
    {
      long long v5 = *((_OWORD *)a2 + 1);
      *(_OWORD *)a3 = *(_OWORD *)a2;
      *(_OWORD *)(a3 + 16) = v5;
      *(void *)(a3 + 32) = a2[4];
    }
    else if (v4 == 1)
    {
      long long v6 = *((_OWORD *)result + 1);
      *(_OWORD *)a3 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = v6;
      *(void *)(a3 + 32) = result[4];
    }
    else
    {
      off_t v7 = (uint64_t *)*result;
      uint64_t v8 = result[1];
      if (*((unsigned char *)result + 33) != 1)
      {
        LOBYTE(v3) = 2;
        off_t v7 = result;
      }
      uint64_t v9 = a2[1];
      if (*((unsigned char *)a2 + 33) == 1)
      {
        uint64_t v10 = (uint64_t *)*a2;
      }
      else
      {
        LOBYTE(v4) = 2;
        uint64_t v10 = a2;
      }
      *(void *)a3 = v7;
      *(void *)(a3 + 8) = v8;
      *(void *)(a3 + 16) = v10;
      *(void *)(a3 + 24) = v9;
      *(unsigned char *)(a3 + 32) = v3;
      *(unsigned char *)(a3 + 33) = v4;
    }
  }
  else
  {
    *(_WORD *)(a3 + 32) = 256;
  }
  return result;
}

void sub_226DD0F3C(uint64_t a1)
{
  sub_226DD0D78(a1);

  JUMPOUT(0x22A669B00);
}

uint64_t sub_226DD0F74(uint64_t a1, char *__buf, unint64_t a3)
{
  unint64_t v3 = a3;
  *(void *)(a1 + 88) += a3;
  while (1)
  {
    size_t v6 = v3 >= 0x7FFFFFFF ? 0x7FFFFFFFLL : v3;
    uint64_t result = write(*(_DWORD *)(a1 + 60), __buf, v6);
    if (result < 0) {
      break;
    }
    __buf += result;
    v3 -= result;
LABEL_3:
    if (!v3) {
      return result;
    }
  }
  uint64_t result = (uint64_t)__error();
  if (*(_DWORD *)result == 4) {
    goto LABEL_3;
  }
  uint64_t result = (uint64_t)__error();
  if (*(_DWORD *)result == 35) {
    goto LABEL_3;
  }
  uint64_t result = (uint64_t)__error();
  if (*(_DWORD *)result == 35) {
    goto LABEL_3;
  }
  uint64_t v8 = *__error();
  uint64_t result = (uint64_t)std::generic_category();
  *(void *)(a1 + 72) = v8;
  *(void *)(a1 + 80) = result;
  return result;
}

off_t sub_226DD101C(int *a1, unsigned char *a2, size_t a3, off_t a4)
{
  uint64_t v8 = (*(uint64_t (**)(int *))(*(void *)a1 + 80))(a1);
  uint64_t v9 = *((void *)a1 + 4);
  uint64_t v10 = *((void *)a1 + 2);
  uint64_t v11 = v8 + v9;
  if (v9 != v10)
  {
    *((void *)a1 + 4) = v10;
    sub_226DD03F8(a1, v10, v9 - v10);
  }
  off_t v12 = v11 - v10;
  off_t v13 = lseek(a1[15], a4, 0);
  *((void *)a1 + 11) = v13;
  if (v13 == -1)
  {
    uint64_t v14 = *__error();
    uint64_t v15 = std::generic_category();
    *((void *)a1 + 9) = v14;
    *((void *)a1 + 10) = v15;
  }
  sub_226DD0534((uint64_t)a1, a2, a3);
  uint64_t v16 = *((void *)a1 + 4);
  uint64_t v17 = *((void *)a1 + 2);
  if (v16 != v17)
  {
    *((void *)a1 + 4) = v17;
    sub_226DD03F8(a1, v17, v16 - v17);
  }
  off_t result = lseek(a1[15], v12, 0);
  *((void *)a1 + 11) = result;
  if (result == -1)
  {
    uint64_t v19 = *__error();
    off_t result = (off_t)std::generic_category();
    *((void *)a1 + 9) = v19;
    *((void *)a1 + 10) = result;
  }
  return result;
}

uint64_t sub_226DD113C(int *a1)
{
  if (fstat(a1[15], &v3)) {
    return 0;
  }
  if (v3.st_mode & 0xF000) == 0x2000 && ((*(uint64_t (**)(int *))(*(void *)a1 + 48))(a1)) {
    return 0;
  }
  return v3.st_blksize;
}

BOOL sub_226DD11DC(uint64_t a1)
{
  return sub_226DCEA0C(*(_DWORD *)(a1 + 60));
}

BOOL sub_226DD11E4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 68)) {
    return *(unsigned char *)(a1 + 67) != 0;
  }
  BOOL result = sub_226DCEBD4(*(_DWORD *)(a1 + 60));
  if (!*(unsigned char *)(a1 + 68)) {
    *(unsigned char *)(a1 + 68) = 1;
  }
  *(unsigned char *)(a1 + 67) = result;
  return result;
}

void *sub_226DD1254()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)qword_26815DC20, memory_order_acquire) & 1) != 0
    || !__cxa_guard_acquire(qword_26815DC20))
  {
    return &unk_26815DCD0;
  }
  sub_226DD0C00((uint64_t)&unk_26815DCD0, 2, 0, 1, 0);
  __cxa_atexit((void (*)(void *))sub_226DD0F38, &unk_26815DCD0, &dword_226DAE000);
  __cxa_guard_release(qword_26815DC20);
  return &unk_26815DCD0;
}

void sub_226DD12F4(_Unwind_Exception *a1)
{
}

std::string *sub_226DD130C(uint64_t a1, const std::string::value_type *a2, std::string::size_type a3)
{
  return std::string::append(*(std::string **)(a1 + 64), a2, a3);
}

uint64_t sub_226DD1314(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 64) + 8);
}

void *sub_226DD1320(void *result, void *__src, size_t __n)
{
  long long v5 = (void *)result[8];
  uint64_t v6 = v5[1];
  unint64_t v7 = v6 + __n;
  if (v5[2] < v7)
  {
    BOOL result = sub_226DCEF28(result[8], v5 + 3, v7, 1);
    uint64_t v6 = v5[1];
  }
  if (__n)
  {
    BOOL result = memcpy((void *)(*v5 + v6), __src, __n);
    uint64_t v6 = v5[1];
  }
  v5[1] = v6 + __n;
  return result;
}

void *sub_226DD1398(uint64_t a1, const void *a2, size_t a3, uint64_t a4)
{
  return memcpy((void *)(**(void **)(a1 + 64) + a4), a2, a3);
}

uint64_t sub_226DD13B0()
{
  return 0;
}

uint64_t sub_226DD13B8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 48))();
}

uint64_t sub_226DD13DC(uint64_t result, char a2)
{
  *(unsigned char *)(result + 40) = a2;
  return result;
}

uint64_t sub_226DD13E4(uint64_t a1)
{
  *(void *)a1 = &unk_26DAEFBF0;
  if (*(_DWORD *)(a1 + 56) == 1)
  {
    uint64_t v2 = *(void *)(a1 + 16);
    if (v2) {
      MEMORY[0x22A669AE0](v2, 0x1000C8077774924);
    }
  }
  return a1;
}

void sub_226DD144C(uint64_t a1)
{
  *(void *)a1 = &unk_26DAEFBF0;
  if (*(_DWORD *)(a1 + 56) == 1)
  {
    uint64_t v1 = *(void *)(a1 + 16);
    if (v1) {
      MEMORY[0x22A669AE0](v1, 0x1000C8077774924);
    }
  }

  JUMPOUT(0x22A669B00);
}

void sub_226DD14D4(void *a1, uint64_t a2)
{
  uint64_t v2 = (std::string *)a1[8];
  std::string::size_type v3 = (*(uint64_t (**)(void *))(*a1 + 80))(a1) + a2 + a1[4] - a1[2];

  std::string::reserve(v2, v3);
}

uint64_t sub_226DD1550(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 64);
  if (*(char *)(v1 + 23) < 0) {
    return *(void *)(v1 + 8);
  }
  else {
    return *(unsigned __int8 *)(v1 + 23);
  }
}

void sub_226DD156C(uint64_t a1)
{
  *(void *)a1 = &unk_26DAEFBF0;
  if (*(_DWORD *)(a1 + 56) == 1)
  {
    uint64_t v1 = *(void *)(a1 + 16);
    if (v1) {
      MEMORY[0x22A669AE0](v1, 0x1000C8077774924);
    }
  }

  JUMPOUT(0x22A669B00);
}

void *sub_226DD15F4(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[8];
  BOOL result = (void *)(*(uint64_t (**)(void *))(*a1 + 80))(a1);
  unint64_t v6 = (unint64_t)result + a2 + a1[4] - a1[2];
  if (*(void *)(v4 + 16) < v6)
  {
    return sub_226DCEF28(v4, (void *)(v4 + 24), v6, 1);
  }
  return result;
}

uint64_t sub_226DD1694(uint64_t a1)
{
  return *(void *)(a1 + 88);
}

void sub_226DD169C(void *a1, uint64_t a2)
{
  v39[8] = *MEMORY[0x263EF8340];
  if (a1[2])
  {
    unint64_t v37 = v39;
    *(_OWORD *)__n = xmmword_226DD47C0;
    int v28 = 0;
    char v32 = 0;
    uint64_t v33 = 0;
    char v35 = &v37;
    int v34 = 0;
    unint64_t v27 = &unk_26DAEFDA0;
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    uint64_t v31 = 0;
    (*(void (**)(void, void **))(*(void *)*a1 + 24))(*a1, &v27);
    unint64_t v4 = a1[2];
    size_t v5 = __n[0];
    size_t v6 = v4 - __n[0];
    if (v4 > __n[0])
    {
      int v7 = *((_DWORD *)a1 + 2);
      if (!v7)
      {
        sub_226DD0534(a2, v37, __n[0]);
        if (v6)
        {
          int v14 = 0;
          do
          {
            char v15 = *((unsigned char *)a1 + 24);
            while (1)
            {
              uint64_t v16 = *(unsigned char **)(a2 + 32);
              if ((unint64_t)v16 < *(void *)(a2 + 24)) {
                goto LABEL_29;
              }
              uint64_t v17 = *(void *)(a2 + 16);
              if (v17)
              {
                *(void *)(a2 + 32) = v17;
                sub_226DD03F8((void *)a2, v17, (uint64_t)&v16[-v17]);
                uint64_t v16 = *(unsigned char **)(a2 + 32);
LABEL_29:
                *(void *)(a2 + 32) = v16 + 1;
                *uint64_t v16 = v15;
                goto LABEL_30;
              }
              if (!*(_DWORD *)(a2 + 56)) {
                break;
              }
              sub_226DCFFFC((uint64_t *)a2);
            }
            char v36 = v15;
            sub_226DD03F8((void *)a2, (uint64_t)&v36, 1);
LABEL_30:
            ++v14;
          }
          while (v14 != v6);
        }
        goto LABEL_58;
      }
      if (v7 == 1)
      {
        size_t v8 = v6 >> 1;
        if ((v6 >> 1))
        {
          int v9 = 0;
          do
          {
            char v10 = *((unsigned char *)a1 + 24);
            while (1)
            {
              uint64_t v11 = *(unsigned char **)(a2 + 32);
              if ((unint64_t)v11 < *(void *)(a2 + 24)) {
                goto LABEL_13;
              }
              uint64_t v12 = *(void *)(a2 + 16);
              if (v12)
              {
                *(void *)(a2 + 32) = v12;
                sub_226DD03F8((void *)a2, v12, (uint64_t)&v11[-v12]);
                uint64_t v11 = *(unsigned char **)(a2 + 32);
LABEL_13:
                *(void *)(a2 + 32) = v11 + 1;
                *uint64_t v11 = v10;
                goto LABEL_14;
              }
              if (!*(_DWORD *)(a2 + 56)) {
                break;
              }
              sub_226DCFFFC((uint64_t *)a2);
            }
            char v36 = v10;
            sub_226DD03F8((void *)a2, (uint64_t)&v36, 1);
LABEL_14:
            ++v9;
          }
          while (v9 != v8);
          size_t v5 = __n[0];
        }
        sub_226DD0534(a2, v37, v5);
        int v22 = v6 - v8;
        if (v22)
        {
          for (int i = 0; i != v22; ++i)
          {
            char v24 = *((unsigned char *)a1 + 24);
            while (1)
            {
              uint64_t v25 = *(unsigned char **)(a2 + 32);
              if ((unint64_t)v25 < *(void *)(a2 + 24)) {
                goto LABEL_53;
              }
              uint64_t v26 = *(void *)(a2 + 16);
              if (v26)
              {
                *(void *)(a2 + 32) = v26;
                sub_226DD03F8((void *)a2, v26, (uint64_t)&v25[-v26]);
                uint64_t v25 = *(unsigned char **)(a2 + 32);
LABEL_53:
                *(void *)(a2 + 32) = v25 + 1;
                *uint64_t v25 = v24;
                goto LABEL_54;
              }
              if (!*(_DWORD *)(a2 + 56)) {
                break;
              }
              sub_226DCFFFC((uint64_t *)a2);
            }
            char v36 = v24;
            sub_226DD03F8((void *)a2, (uint64_t)&v36, 1);
LABEL_54:
            ;
          }
        }
        goto LABEL_58;
      }
      if (v6)
      {
        int v18 = 0;
        do
        {
          char v19 = *((unsigned char *)a1 + 24);
          while (1)
          {
            unsigned int v20 = *(unsigned char **)(a2 + 32);
            if ((unint64_t)v20 < *(void *)(a2 + 24)) {
              goto LABEL_41;
            }
            uint64_t v21 = *(void *)(a2 + 16);
            if (v21)
            {
              *(void *)(a2 + 32) = v21;
              sub_226DD03F8((void *)a2, v21, (uint64_t)&v20[-v21]);
              unsigned int v20 = *(unsigned char **)(a2 + 32);
LABEL_41:
              *(void *)(a2 + 32) = v20 + 1;
              *unsigned int v20 = v19;
              goto LABEL_42;
            }
            if (!*(_DWORD *)(a2 + 56)) {
              break;
            }
            sub_226DCFFFC((uint64_t *)a2);
          }
          char v36 = v19;
          sub_226DD03F8((void *)a2, (uint64_t)&v36, 1);
LABEL_42:
          ++v18;
        }
        while (v18 != v6);
        size_t v5 = __n[0];
      }
    }
    sub_226DD0534(a2, v37, v5);
LABEL_58:
    unint64_t v27 = &unk_26DAEFBF0;
    if (v34 == 1 && v29) {
      MEMORY[0x22A669AE0](v29, 0x1000C8077774924);
    }
    if (v37 != v39) {
      free(v37);
    }
    return;
  }
  off_t v13 = *(void (**)(void))(*(void *)*a1 + 24);

  v13();
}

void sub_226DD1AAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  sub_226DD0964((uint64_t)&a9);
  if (a19 != v19) {
    free(a19);
  }
  _Unwind_Resume(a1);
}

void sub_226DD1AF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_226DD1B6C()
{
  sub_226DB7D24();
  sub_226DB7D54(&dword_226DAE000, &_os_log_internal, v0, "VisionHWAProgramLoader: operation buffer primitive ID %d is different from expected ID %u", v1, v2, v3, v4, v5);
}

void sub_226DD1BE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_226DD1C68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_226DD1CDC()
{
  sub_226DB7D24();
  sub_226DB7D54(&dword_226DAE000, &_os_log_internal, v0, "VisionHWAProgramLoader: operation buffer primitive ID %d is different from expected ID %u", v1, v2, v3, v4, v5);
}

void sub_226DD1D54()
{
  sub_226DB7D38();
  sub_226DB7D70(&dword_226DAE000, &_os_log_internal, v0, "VisionHWAProgramLoader: operation buffer item size of config %d is different from expected size %zu", v1, v2, v3, v4, v5);
}

void sub_226DD1DC4()
{
  sub_226DB7D24();
  sub_226DB7D54(&dword_226DAE000, &_os_log_internal, v0, "VisionHWAProgramLoader: operation buffer primitive ID %d is different from expected ID %u", v1, v2, v3, v4, v5);
}

void sub_226DD1E3C()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_ERROR, "VisionHWAProgramLoader: platform not detected", v0, 2u);
}

void sub_226DD1E84()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_ERROR, "VisionHWAServer: Unable to access action/operation buffer", v0, 2u);
}

void sub_226DD1ECC()
{
  sub_226DBE8C4();
  sub_226DBE8A8(&dword_226DAE000, &_os_log_internal, v0, "VisionHWAServer: no value for key %s", v1, v2, v3, v4, v5);
}

void sub_226DD1F3C()
{
  sub_226DBE8C4();
  sub_226DBE8A8(&dword_226DAE000, &_os_log_internal, v0, "VisionHWAServer: no IOSurface ID found for key %s", v1, v2, v3, v4, v5);
}

void sub_226DD1FAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_226DD1FE8()
{
  sub_226DBE8C4();
  sub_226DBE8A8(&dword_226DAE000, &_os_log_internal, v0, "VisionHWAServer: unable to create CVPixelBufferRef from IOSurface for key %s", v1, v2, v3, v4, v5);
}

void sub_226DD2058(uint64_t a1, int a2, int a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3[0] = 67109632;
  v3[1] = a2;
  __int16 v4 = 1024;
  int v5 = a3;
  __int16 v6 = 2048;
  uint64_t v7 = a1;
  _os_log_error_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_ERROR, "VisionHWAServer: Error in ISP completion callback: status=%d, outputCount=%d, outputDescriptor=%p", (uint8_t *)v3, 0x18u);
}

void sub_226DD20F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_226DD212C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_226DD2168(uint8_t *buf, unsigned char *a2)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_ERROR, "VisionHWAServer: Invalid CVPixelBuffer", buf, 2u);
}

void sub_226DD21AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_226DD21E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_226DD2224()
{
  sub_226DBE8C4();
  sub_226DBE8A8(&dword_226DAE000, &_os_log_internal, v0, "VisionHWAServer: ELF file not on System Volume %s", v1, v2, v3, v4, v5);
}

void sub_226DD2294(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_226DD22D0(int a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_ERROR, "VisionHWAServer: error code %d", (uint8_t *)v1, 8u);
}

void sub_226DD2350(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_226DD238C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_226DD23C8(int a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_ERROR, "VisionHWAServer: error while retrieving boot-args: %d", (uint8_t *)v1, 8u);
}

void sub_226DD2448(void **a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2) {
    operator delete(v2);
  }
}

void sub_226DD2460(void **__p)
{
  do
  {
    uint64_t v2 = (void **)*__p;
    if (*((char *)__p + 63) < 0) {
      operator delete(__p[5]);
    }
    if (*((char *)__p + 39) < 0) {
      operator delete(__p[2]);
    }
    operator delete(__p);
    std::string __p = v2;
  }
  while (v2);
}

uint64_t sub_226DD24B4(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 40))(result);
  }
  return result;
}

void sub_226DD24F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_226DD2530(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_226DD256C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_226DD25A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_226DD25E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_226DD2620(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_226DD265C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_226DD2698(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_226DD26D4(uint8_t *buf, unsigned char *a2)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_ERROR, "VisionHWAServer: numClients is zero!!", buf, 2u);
}

uint64_t sub_226DD2718()
{
  sub_226DC6C1C();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_226DD274C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 8))(result);
  }
  return result;
}

uint64_t sub_226DD278C(uint64_t *a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_226DC6C28(a1);
  if (result)
  {
    sub_226DC6C1C();
    uint64_t result = (*(uint64_t (**)(void))(v8 + 8))();
  }
  *(void *)a4 = a2;
  *(_DWORD *)(a4 + 8) = a3;
  return result;
}

uint64_t sub_226DD27EC()
{
  sub_226DC6C1C();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_226DD2814(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  if (sub_226DC6C28(a1))
  {
    sub_226DC6C1C();
    (*(void (**)(void))(v5 + 8))();
  }
  uint64_t v6 = *a2;
  *a2 = 0;
  if (v6)
  {
    sub_226DC6C1C();
    (*(void (**)(void))(v7 + 8))();
  }
  return MEMORY[0x22A669B00](a3, 0xA1C4030951706);
}

void sub_226DD28A4(void **a1, void *a2, void **a3)
{
  uint64_t v5 = *a1;
  uint64_t v6 = a2;
  if (v5 != a2)
  {
    do
    {
      uint64_t v8 = *--v5;
      *uint64_t v5 = 0;
      if (v8)
      {
        sub_226DC6C1C();
        (*(void (**)(void))(v9 + 8))();
      }
    }
    while (v5 != a2);
    uint64_t v6 = *a3;
  }
  *a1 = a2;
  operator delete(v6);
}

uint64_t sub_226DD2924(uint64_t *a1)
{
  uint64_t result = sub_226DC6C28(a1);
  if (result)
  {
    sub_226DC6C1C();
    return (*(uint64_t (**)(void))(v2 + 8))();
  }
  return result;
}

void sub_226DD2960()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  sub_226DC87E4();
  sub_226DC880C(&dword_226DAE000, &_os_log_internal, v0, "Unable to unregister the device notification callback. Status returned: %d", v1);
}

void sub_226DD29D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_226DD2A10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_226DD2A4C()
{
  sub_226DC87E4();
  sub_226DC87F0(&dword_226DAE000, &_os_log_internal, v0, "HxISPDevice unable to create a device (error code 0x%08x)", v1, v2, v3, v4, v5);
}

void sub_226DD2ABC(uint8_t *a1, int a2, _DWORD *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a3 = a2;
  sub_226DC880C(&dword_226DAE000, &_os_log_internal, (uint64_t)a3, "HxISPDevice createDevice() timed out -- %d retries remaining.", a1);
}

uint64_t sub_226DD2B00(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 32))();
}

uint64_t sub_226DD2B24(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 40))();
  }
  return result;
}

void sub_226DD2B50()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  sub_226DC87E4();
  sub_226DC880C(&dword_226DAE000, &_os_log_internal, v0, "Error: Failed to successfully invalidate session %d", v1);
}

void sub_226DD2BC4()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  sub_226DC87E4();
  sub_226DC880C(&dword_226DAE000, &_os_log_internal, v0, "Failed to successfully complete outstanding requests %d", v1);
}

void sub_226DD2C38()
{
  sub_226DC87E4();
  sub_226DC87F0(&dword_226DAE000, &_os_log_internal, v0, "ISP driver reported error %d for processing buffer.", v1, v2, v3, v4, v5);
}

void sub_226DD2CA8()
{
  sub_226DC87E4();
  sub_226DC87F0(&dword_226DAE000, &_os_log_internal, v0, "ISP driver reported error %d for processing buffer. Max number of retries reached.", v1, v2, v3, v4, v5);
}

void sub_226DD2D18(uint8_t *a1, int a2, _DWORD *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a3 = a2;
  sub_226DC880C(&dword_226DAE000, &_os_log_internal, (uint64_t)a3, "ISP temporarily unavailable -- retrying. Driver reported code %d.", a1);
}

void sub_226DD2D5C()
{
  sub_226DC87E4();
  sub_226DC87F0(&dword_226DAE000, &_os_log_internal, v0, "CompleteBuffers failed with error code %d", v1, v2, v3, v4, v5);
}

void sub_226DD2DCC()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_ERROR, "visionhwserverd [AppStateMonitor initWithPID] failed to create process monitor", v0, 2u);
}

void sub_226DD2E14(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_ERROR, "VisionHWAServer: [AppStateMonitor] error creating handle for identifier. Error: %@", (uint8_t *)&v1, 0xCu);
}

void sub_226DD2E94()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_ERROR, "visionhwserverd [AppStateMonitor initWithPID] failed to create process predicate", v0, 2u);
}

void sub_226DD2EDC()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_226DAE000, &_os_log_internal, OS_LOG_TYPE_ERROR, "VisionHWAServer: [AppStateMonitor] callback was not set up", v0, 2u);
}

void sub_226DD2F24(uint64_t *a1)
{
  if (sub_226DCDAFC(a1))
  {
    sub_226DC6C1C();
    (*(void (**)(void))(v1 + 8))();
  }
  sub_226DCDB18();
}

void sub_226DD2F74()
{
  sub_226DCDB24();
  if (v1)
  {
    uint64_t v2 = *v0;
    *uint64_t v0 = 0;
    if (v2)
    {
      sub_226DC6C1C();
      (*(void (**)(void))(v3 + 8))();
    }
  }
  sub_226DCDB18();
}

uint64_t sub_226DD2FD0(uint64_t a1, unsigned char *a2, uint64_t *a3)
{
  if (*a2)
  {
    uint64_t result = *a3;
    *a3 = 0;
    if (result)
    {
      sub_226DC6C1C();
      return (*(uint64_t (**)(void))(v4 + 8))();
    }
  }
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CMBaseObjectGetVTable()
{
  return MEMORY[0x270EE79D0]();
}

uint64_t CMNotificationCenterAddListener()
{
  return MEMORY[0x270EE7B80]();
}

uint64_t CMNotificationCenterGetDefaultLocalCenter()
{
  return MEMORY[0x270EE7B88]();
}

uint64_t CMNotificationCenterPostNotification()
{
  return MEMORY[0x270EE7B90]();
}

uint64_t CMNotificationCenterRemoveListener()
{
  return MEMORY[0x270EE7BA0]();
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA170](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x270EEA190](pixelBuffer);
}

size_t CVPixelBufferGetDataSize(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1D0](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

uint64_t FigCaptureDeviceGetFigBaseObject()
{
  return MEMORY[0x270F12C50]();
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x270EF4C28](properties);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x270EF4E18](buffer, *(void *)&options, seed);
}

IOSurfaceRef IOSurfaceLookupFromXPCObject(xpc_object_t xobj)
{
  return (IOSurfaceRef)MEMORY[0x270EF4E38](xobj);
}

uint64_t MGGetProductType()
{
  return MEMORY[0x270F95FD8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::string *__cdecl std::error_code::message(std::string *__return_ptr retstr, const std::error_code *this)
{
  return (std::string *)MEMORY[0x270F98210](retstr, this);
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x270F98248](this, __s);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x270F98268]();
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__root_directory(const std::__fs::filesystem::path *this)
{
  char v1 = (const std::string_view::value_type *)MEMORY[0x270F982A0](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::string *a2)
{
  return (std::logic_error *)MEMORY[0x270F98338](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98498](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984B8](this, __s);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984C0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984E0](this, __pos, __s);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F987A8]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x270F98870]();
}

void std::error_category::~error_category(std::error_category *this)
{
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
}

void std::recursive_mutex::lock(std::recursive_mutex *this)
{
}

void std::recursive_mutex::unlock(std::recursive_mutex *this)
{
}

std::recursive_mutex *__cdecl std::recursive_mutex::recursive_mutex(std::recursive_mutex *this)
{
  return (std::recursive_mutex *)MEMORY[0x270F98900](this);
}

const std::error_category *std::system_category(void)
{
  return (const std::error_category *)MEMORY[0x270F98910]();
}

const std::error_category *std::generic_category(void)
{
  return (const std::error_category *)MEMORY[0x270F98918]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x270F989E8](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::__fs::filesystem::path *__cdecl std::__fs::filesystem::__canonical(std::__fs::filesystem::path *__return_ptr retstr, const std::__fs::filesystem::path *a2, std::error_code *__ec)
{
  return (std::__fs::filesystem::path *)MEMORY[0x270F98A40](retstr, a2, __ec);
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
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
  return MEMORY[0x270F98DE8]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, uint64_t __val)
{
  return (std::string *)MEMORY[0x270F98E18](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x270F98E20](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x270F98E38]();
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x270ED7DA0](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int del_curterm(TERMINAL *a1)
{
  return MEMORY[0x270F9A0C0](a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x270ED9A20](a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

int getpagesize(void)
{
  return MEMORY[0x270ED9CC8]();
}

int isatty(int a1)
{
  return MEMORY[0x270ED9EF0](*(void *)&a1);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x270EDA118](*(void *)&a1, a2, *(void *)&a3);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
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

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_release(void *object)
{
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int posix_madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x270EDAC50](a1, a2, *(void *)&a3);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x270EDAD10](*(void *)&__fd, __buf, __nbyte, a4);
}

int pthread_sigmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  return MEMORY[0x270EDB058](*(void *)&a1, a2, a3);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

TERMINAL *__cdecl set_curterm(TERMINAL *a1)
{
  return (TERMINAL *)MEMORY[0x270F9A0F0](a1);
}

int setupterm(char *a1, int a2, int *a3)
{
  return MEMORY[0x270F9A100](a1, *(void *)&a2, a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

int tigetnum(char *a1)
{
  return MEMORY[0x270F9A130](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDBC30](*(void *)&__fd, __buf, __nbyte);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x270EDBE70]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x270EDBEA0](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x270EDC020](original);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x270EDC098](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

void xpc_release(xpc_object_t object)
{
}