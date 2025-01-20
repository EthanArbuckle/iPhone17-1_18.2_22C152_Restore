void sub_100002F74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

int main(int argc, const char **argv, const char **envp)
{
  v3 = objc_opt_new();
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

void sub_100003010(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double pPreProc(int a1, _t_zn_IMAGEPARAMS *a2, void *a3)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100038740();
  }
  a2[1].aColorComponents[3] = a1;
  v5 = *(char **)&a2[1].aColorComponents[1];
  int nYDotsPerInch = a2[1].nYDotsPerInch;
  int ColorModel = a2[1].ColorModel;
  int v8 = nYDotsPerInch + 7;
  if (nYDotsPerInch < -7) {
    int v8 = nYDotsPerInch + 14;
  }
  int v9 = v8 >> 3;
  unsigned int unSize = a2[1].unSize;
  int bAlphaChannel = a2[1].bAlphaChannel;
  int nBitsPerPixelPerColor = a2[1].nBitsPerPixelPerColor;
  a2->unsigned int unSize = 184;
  a2->nWidth = unSize;
  a2->nHeight = bAlphaChannel;
  *(void *)&a2->nXDotsPerInch = *(void *)&a2[1].nHeight;
  *(void *)&a2->int ColorModel = 0x100000002;
  a2->int nBitsPerPixelPerColor = nYDotsPerInch;
  a2->DataType = 0;
  *(_OWORD *)a2->aColorComponents = xmmword_1000391D0;
  a2->aColorComponents[4] = -1;
  *(void *)&a2->Paletteint ColorModel = 0;
  a2->pPaletteData = 0;
  *(void *)&a2->bInverted = 0;
  a2->nXStride = 4 * v9;
  a2->nYStride = ColorModel;
  a2->apLogical00[0] = v5;
  a2->apLogical00[1] = &v5[v9];
  a2->apLogical00[2] = &v5[2 * v9];
  a2->apLogical00[3] = &v5[3 * v9];
  a2->apLogical00[4] = 0;
  a2->nTileCount = 0;
  double result = 0.0;
  *(_OWORD *)((char *)&a2->pUnlockTileProc + 4) = 0u;
  *(_OWORD *)&a2->pLockTileParam = 0u;
  *(_OWORD *)&a2->pTileRects = 0u;
  a2->nYOffset = nBitsPerPixelPerColor;
  if (LOBYTE(a2[1].DataType))
  {
    *(void *)&double result = 0x400000010;
    *(void *)&a2->int nBitsPerPixelPerColor = 0x400000010;
  }
  return result;
}

void pPostProc(int a1, _DWORD *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_1000387C8();
  }
  a2[58] = a1;
  *((unsigned char *)a2 + 236) = 1;
}

void pNotifyProc(unsigned int a1, unsigned char *a2)
{
  BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v3) {
    sub_100038850(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  a2[236] = 0;
}

uint64_t pAcknowledgeProc(unsigned int a1, void *a2)
{
  return 0;
}

void sub_100003254(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000032D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)PrintBandService;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_100003304(void *a1)
{
}

uint64_t initZn(void **a1, uint64_t a2)
{
  v7[0] = 48;
  v7[1] = a2;
  v7[2] = 0;
  v7[3] = a2;
  v7[4] = 0;
  v7[5] = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_1000389DC(a2);
  }
  *a1 = 0;
  uint64_t v4 = znStartup(0);
  if (!v4) {
    uint64_t v4 = znInitialize(v7, 1, 0, a1);
  }
  uint64_t v5 = v4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100038948(v5);
  }
  return v5;
}

void sub_10000366C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000036B8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1000036D4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void sub_1000036F0()
{
  qword_100074A38 = 0x159CF53DBuLL;
  *(void *)&xmmword_100074A40 = 0x17CF1CD5AuLL;
  *((void *)&xmmword_100074A40 + 1) = 0x160AA6E8BuLL;
  qword_100074A50 = 0x1743AF5C0uLL;
  qword_100074A58 = 0x165301351uLL;
  qword_100074A60 = 0x15D3554AAuLL;
  unk_100074A68 = 0xFFFFFFFFLL;
}

uint64_t Madusa::FrequencyTransform::Fft(float32x2_t *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = 0;
  uint64_t v42 = (uint64_t)&a1[8647];
  uint64_t v6 = a1 + 8582;
  uint64_t v7 = a1 + 132;
  v40 = a1 + 132;
  do
  {
    sub_100003A3C(v42, (float *)(*a2 + 4 * v5 + 8), 128, v6);
    uint64_t v8 = 0;
    uint64_t v9 = v7;
    do
    {
      *uint64_t v9 = v6[v8++];
      v9 += 128;
    }
    while (v8 != 65);
    ++v5;
    ++v7;
  }
  while (v5 != 128);
  uint64_t v10 = 0;
  unint64_t v11 = (unint64_t)&a1[3];
  v12 = a1 + 8453;
  v13 = a1;
  uint64_t v14 = a3;
  uint64_t v15 = a3 + 33296;
  uint64_t v16 = a3 + 66584;
  unint64_t v17 = (unint64_t)&v13[67];
  unint64_t v38 = (unint64_t)&v13[131];
  v39 = v12;
  uint64_t v18 = a3 + 33552;
  uint64_t v19 = a3 + 66840;
  v36 = (float *)&v13[67] + 1;
  v37 = (float *)&v13[3] + 1;
  do
  {
    uint64_t v20 = a3 + (v10 << 9);
    uint64_t result = ((uint64_t (*)(uint64_t, float32x2_t *, unint64_t, float32x2_t *))loc_100003B6C)(v42, &v40[128 * v10], v11, v39);
    if (v20 + 264 >= v17 || v11 >= v20 + 67096)
    {
      uint64_t v26 = 0;
      uint64_t v27 = v14;
      do
      {
        v28 = (const float *)(v11 + v26);
        float32x4x2_t v43 = vld2q_f32(v28);
        *(float32x4_t *)(v27 + 264) = v43.val[0];
        *(float32x4_t *)(v27 + 33552) = v43.val[1];
        *(float32x4_t *)(v27 + 66840) = vsqrtq_f32(vmlaq_f32(vmulq_f32(v43.val[0], v43.val[0]), v43.val[1], v43.val[1]));
        v27 += 16;
        v26 += 32;
      }
      while (v26 != 512);
    }
    else
    {
      uint64_t v22 = 0;
      v23 = v37;
      do
      {
        float v24 = *(v23 - 1);
        float v25 = *v23;
        *(float *)(v14 + v22 + 264) = v24;
        *(float *)(v18 + v22) = v25;
        *(float *)(v19 + v22) = sqrtf((float)(v24 * v24) + (float)(v25 * v25));
        v22 += 4;
        v23 += 2;
      }
      while (v22 != 256);
    }
    if (v20 + 8 >= v38 || v17 >= v20 + 66840)
    {
      uint64_t v33 = 0;
      v34 = (const float *)v17;
      do
      {
        float32x4x2_t v44 = vld2q_f32(v34);
        v34 += 8;
        uint64_t v35 = v14 + v33;
        *(float32x4_t *)(v35 + 8) = v44.val[0];
        *(float32x4_t *)(v35 + 33296) = v44.val[1];
        *(float32x4_t *)(v16 + v33) = vsqrtq_f32(vmlaq_f32(vmulq_f32(v44.val[0], v44.val[0]), v44.val[1], v44.val[1]));
        v33 += 16;
      }
      while (v33 != 256);
    }
    else
    {
      uint64_t v29 = 0;
      v30 = v36;
      do
      {
        float v31 = *(v30 - 1);
        float v32 = *v30;
        *(float *)(v14 + v29 + 8) = v31;
        *(float *)(v15 + v29) = v32;
        *(float *)(v16 + v29) = sqrtf((float)(v31 * v31) + (float)(v32 * v32));
        v29 += 4;
        v30 += 2;
      }
      while (v29 != 256);
    }
    ++v10;
    v14 += 512;
    v19 += 512;
    v18 += 512;
    v16 += 512;
    v15 += 512;
  }
  while (v10 != 65);
  return result;
}

void sub_100003A3C(uint64_t a1, float *a2, int a3, float32x2_t *a4)
{
  sub_1000051DC(a1, a2, a3, a4);
  int v5 = 32;
  for (uint64_t i = 1; i != 63; ++i)
  {
    if (i < v5)
    {
      uint64_t v7 = v5;
      float32x2_t v8 = a4[i];
      a4[i] = a4[v7];
      a4[v7] = v8;
    }
    for (int j = 32; j <= v5; j /= 2)
      v5 -= j;
    v5 += j;
  }
  unint64_t v10 = 0;
  float v11 = a4->f32[1];
  float32_t v12 = a4->f32[0] - v11;
  a4->f32[0] = v11 + a4->f32[0];
  a4->i32[1] = 0;
  a4[64].f32[0] = v12;
  a4[64].i32[1] = 0;
  v13 = (float *)&a4[63] + 1;
  uint64_t v14 = (float *)&a4[1] + 1;
  uint64_t v15 = (float *)&unk_1000392A4;
  do
  {
    float v16 = *(v15 - 1);
    float v17 = *v15;
    float v18 = *(v14 - 1);
    float v19 = *(v13 - 1);
    float v20 = v18 - v19;
    float v21 = v19 + v18;
    float v22 = *v14 - *v13;
    float v23 = *v13 + *v14;
    float v24 = v21 - (float)((float)(v20 * *v15) - (float)(v23 * v16));
    float v25 = v21 - (float)-(float)((float)(v20 * *v15) - (float)(v23 * v16));
    *(v14 - 1) = v24 * 0.5;
    *(v13 - 1) = v25 * 0.5;
    float v26 = (float)(v20 * v16) + (float)(v23 * v17);
    *uint64_t v14 = (float)(v22 - v26) * 0.5;
    v14 += 2;
    v10 += 2;
    float *v13 = (float)(v26 + v22) * -0.5;
    v13 -= 2;
    v15 += 2;
  }
  while (v10 < 0x3F);
}

uint64_t Madusa::FrequencyTransform::_Fft(float32x2_t *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = 0;
  int v5 = 0;
  if (QuickCodec::mask == -70947757) {
    int v6 = 2425815;
  }
  else {
    int v6 = 98136;
  }
  uint64_t v7 = 1;
  int v8 = 1641968;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v11 = v7;
        if (v8 <= 1642038) {
          break;
        }
        if (v8 == 1642039)
        {
          if ((*v4 & 0x1F) != 0
            || v4[2] > 0x3Fu
            || (uint64_t v7 = 1,
                int v8 = 98136,
                v4[3] != ((QuickCodec::mask ^ v5) / 0x222786)))
          {
            int v8 = 98190;
            uint64_t v7 = v11;
          }
        }
        else if (v8 == 1740087)
        {
          uint64_t v4 = (unsigned char *)v3;
          int v8 = 1641985;
        }
        else
        {
          BOOL v12 = v8 == 2425815;
          int v8 = 1642039;
          if (v12) {
            int v5 = -410134869;
          }
        }
      }
      if (v8 <= 1641967) {
        break;
      }
      unsigned int v9 = (QuickCodec::mask != -70947757) | v7;
      if (v8 == 1641985) {
        int v10 = v6;
      }
      else {
        int v10 = v8;
      }
      if (v8 == 1641985) {
        LODWORD(v11) = v9;
      }
      BOOL v12 = v8 == 1641968;
      if (v8 == 1641968) {
        int v8 = 98136;
      }
      else {
        int v8 = v10;
      }
      if (v12) {
        uint64_t v7 = 0;
      }
      else {
        uint64_t v7 = v11;
      }
    }
    if (v8 != 98136) {
      break;
    }
    int v8 = 98190;
    if ((v7 & 1) == 0) {
      int v8 = 1740087;
    }
  }
  if (v7) {
    ++QuickCodec::mask;
  }
  return Madusa::FrequencyTransform::Fft(a1, a2, a3);
}

float32_t sub_1000051DC(uint64_t a1, float *a2, int a3, float32x2_t *a4)
{
  uint64_t v6 = 33 * a3;
  float v7 = a2[v6];
  uint64_t v8 = (uint64_t)a3 << 8;
  float v9 = *(float *)((char *)a2 + v8);
  uint64_t v10 = 97 * a3;
  float v11 = a2[v10];
  float32_t v12 = (float)(*a2 - (float)(v7 + v9)) + v11;
  uint64_t v13 = a3;
  float v14 = a2[v13];
  uint64_t v15 = (uint64_t)a3 << 7;
  float v16 = *(float *)((char *)a2 + v15);
  uint64_t v17 = 65 * a3;
  float v18 = a2[v17];
  uint64_t v19 = 96 * a3;
  float v20 = a2[v19];
  float v21 = v9 + *a2;
  float32_t v22 = (float)(v7 + *a2) - (float)(v9 + v11);
  a4->f32[0] = (float)(v16 + v20) + v21;
  a4->f32[1] = (float)(a2[v6] + a2[v13]) + (float)(a2[v17] + a2[v10]);
  a4[32].f32[0] = v22;
  a4[32].f32[1] = (float)(v14 - (float)(v16 + v18)) + v20;
  a4[16].f32[0] = v21 - (float)(v16 + v20);
  float v23 = a4 + 16;
  a4[16].f32[1] = (float)(v14 - (float)(v7 + v11)) + v18;
  a4[48].f32[0] = v12;
  a4[48].f32[1] = (float)(v16 + v14) - (float)(v18 + v20);
  float v24 = &a2[2 * a3];
  float v25 = v24[v6];
  float v26 = *(float *)((char *)v24 + v8);
  float v27 = v24[v10];
  float v28 = (float)(*v24 - (float)(v25 + v26)) + v27;
  float v29 = v24[v13];
  float v30 = *(float *)((char *)v24 + v15);
  float v31 = v24[v17];
  float v32 = v24[v19];
  v4.f32[0] = (float)(v30 + v29) - (float)(v31 + v32);
  float v33 = v26 + *v24;
  float v34 = v33 - (float)(v30 + v32);
  float v35 = (float)(v29 - (float)(v25 + v27)) + v31;
  float v36 = (float)(v25 + *v24) - (float)(v26 + v27);
  a4[1].f32[0] = (float)(v30 + v32) + v33;
  a4[1].f32[1] = (float)(v24[v6] + v24[v13]) + (float)(v24[v17] + v24[v10]);
  float32x2_t v37 = vmul_n_f32((float32x2_t)0x3F7EC41E3DC8BD23, (float)(v29 - (float)(v30 + v31)) + v32);
  float32x2_t v38 = vmul_n_f32((float32x2_t)0x3DC8BD233F7EC41ELL, v36);
  v39.i32[0] = vadd_f32(v37, v38).u32[0];
  v39.i32[1] = vsub_f32(v37, v38).i32[1];
  a4[33] = v39;
  a4[17].f32[0] = (float)(v35 * 0.19509) + (float)(v34 * 0.98079);
  a4[17].f32[1] = (float)(v34 * -0.19509) + (float)(v35 * 0.98079);
  a4[49].f32[0] = (float)(v28 * 0.95694) + (float)(v4.f32[0] * 0.29028);
  a4[49].f32[1] = (float)(v28 * -0.29028) + (float)(v4.f32[0] * 0.95694);
  v40 = &a2[4 * a3];
  v38.f32[0] = v40[v6];
  v37.f32[0] = *(float *)((char *)v40 + v8);
  v39.f32[0] = v40[v10];
  float v41 = v40[v13];
  float v42 = *(float *)((char *)v40 + v15);
  float v43 = v40[v17];
  v4.f32[0] = v40[v19];
  float v44 = (float)(*v40 - (float)(v38.f32[0] + v37.f32[0])) + v39.f32[0];
  float v45 = (float)(v42 + v41) - (float)(v43 + v4.f32[0]);
  float v46 = v37.f32[0] + *v40;
  float v47 = v46 - (float)(v42 + v4.f32[0]);
  float v48 = (float)(v41 - (float)(v38.f32[0] + v39.f32[0])) + v43;
  float v49 = (float)(v38.f32[0] + *v40) - (float)(v37.f32[0] + v39.f32[0]);
  a4[2].f32[0] = (float)(v42 + v4.f32[0]) + v46;
  a4[2].f32[1] = (float)(v40[v6] + v40[v13]) + (float)(v40[v17] + v40[v10]);
  float32x2_t v50 = vmul_n_f32((float32x2_t)0x3F7B150E3E47C5ACLL, (float)(v41 - (float)(v42 + v43)) + v4.f32[0]);
  float32x2_t v51 = vmul_n_f32((float32x2_t)0x3E47C5AC3F7B150ELL, v49);
  v52.i32[0] = vadd_f32(v50, v51).u32[0];
  v52.i32[1] = vsub_f32(v50, v51).i32[1];
  a4[34] = v52;
  a4[18].f32[0] = (float)(v48 * 0.38268) + (float)(v47 * 0.92388);
  a4[18].f32[1] = (float)(v47 * -0.38268) + (float)(v48 * 0.92388);
  a4[50].f32[0] = (float)(v44 * 0.83147) + (float)(v45 * 0.55557);
  a4[50].f32[1] = (float)(v44 * -0.55557) + (float)(v45 * 0.83147);
  v53 = &a2[6 * a3];
  v50.f32[0] = v53[v6];
  v4.f32[0] = *(float *)((char *)v53 + v8);
  float v54 = v53[v10];
  float v55 = v53[v13];
  float v56 = *(float *)((char *)v53 + v15);
  float v57 = v53[v17];
  float v58 = v53[v19];
  float v59 = (float)(*v53 - (float)(v50.f32[0] + v4.f32[0])) + v54;
  float v60 = (float)(v56 + v55) - (float)(v57 + v58);
  float v61 = v4.f32[0] + *v53;
  float v62 = v61 - (float)(v56 + v58);
  float v63 = (float)(v55 - (float)(v50.f32[0] + v54)) + v57;
  v51.f32[0] = (float)(v50.f32[0] + *v53) - (float)(v4.f32[0] + v54);
  a4[3].f32[0] = (float)(v56 + v58) + v61;
  a4[3].f32[1] = (float)(v53[v6] + v53[v13]) + (float)(v53[v17] + v53[v10]);
  float32x2_t v64 = vmul_n_f32((float32x2_t)0x3F74FA053E949F95, (float)(v55 - (float)(v56 + v57)) + v58);
  float32x2_t v65 = vmul_n_f32((float32x2_t)0x3E949F953F74FA05, v51.f32[0]);
  v66.i32[0] = vadd_f32(v64, v65).u32[0];
  v66.i32[1] = vsub_f32(v64, v65).i32[1];
  a4[35] = v66;
  a4[19].f32[0] = (float)(v63 * 0.55557) + (float)(v62 * 0.83147);
  a4[19].f32[1] = (float)(v62 * -0.55557) + (float)(v63 * 0.83147);
  a4[51].f32[0] = (float)(v59 * 0.63439) + (float)(v60 * 0.77301);
  a4[51].f32[1] = (float)(v59 * -0.77301) + (float)(v60 * 0.63439);
  v67 = &a2[8 * a3];
  v65.f32[0] = v67[v6];
  float v68 = *(float *)((char *)v67 + v8);
  float v69 = v67[v10];
  float v70 = (float)(*v67 - (float)(v65.f32[0] + v68)) + v69;
  float v71 = v67[v13];
  float v72 = *(float *)((char *)v67 + v15);
  float v73 = v67[v17];
  float v74 = v67[v19];
  float v75 = (float)(v72 + v71) - (float)(v73 + v74);
  float v76 = v68 + *v67;
  float v77 = v76 - (float)(v72 + v74);
  float v78 = (float)(v71 - (float)(v65.f32[0] + v69)) + v73;
  v65.f32[0] = (float)(v65.f32[0] + *v67) - (float)(v68 + v69);
  a4[4].f32[0] = (float)(v72 + v74) + v76;
  a4[4].f32[1] = (float)(v67[v6] + v67[v13]) + (float)(v67[v17] + v67[v10]);
  float32x2_t v79 = vmul_n_f32((float32x2_t)0x3F6C83663EC3EEA2, (float)(v71 - (float)(v72 + v73)) + v74);
  float32x2_t v80 = vmul_n_f32((float32x2_t)0x3EC3EEA23F6C8366, v65.f32[0]);
  v81.i32[0] = vadd_f32(v79, v80).u32[0];
  v81.i32[1] = vsub_f32(v79, v80).i32[1];
  a4[36] = v81;
  a4[20].f32[0] = (float)(v77 + v78) * 0.70711;
  a4[20].f32[1] = (float)(v78 - v77) * 0.70711;
  a4[52].f32[0] = (float)(v70 * 0.38268) + (float)(v75 * 0.92388);
  a4[52].f32[1] = (float)(v70 * -0.92388) + (float)(v75 * 0.38268);
  v82 = &a2[10 * a3];
  v80.f32[0] = v82[v6];
  float v83 = *(float *)((char *)v82 + v8);
  float v84 = v82[v10];
  float v85 = (float)(*v82 - (float)(v80.f32[0] + v83)) + v84;
  float v86 = v82[v13];
  float v87 = *(float *)((char *)v82 + v15);
  float v88 = v82[v17];
  float v89 = v82[v19];
  float v90 = (float)(v87 + v86) - (float)(v88 + v89);
  float v91 = v83 + *v82;
  v79.f32[0] = (float)(v80.f32[0] + *v82) - (float)(v83 + v84);
  float v92 = v91 - (float)(v87 + v89);
  v80.f32[0] = (float)(v86 - (float)(v80.f32[0] + v84)) + v88;
  a4[5].f32[0] = (float)(v87 + v89) + v91;
  float32x2_t v93 = vmul_n_f32((float32x2_t)0x3F61C5823EF15B57, (float)(v86 - (float)(v87 + v88)) + v89);
  float32x2_t v94 = vmul_n_f32((float32x2_t)0x3EF15B573F61C582, v79.f32[0]);
  v95.i32[0] = vadd_f32(v93, v94).u32[0];
  v95.i32[1] = vsub_f32(v93, v94).i32[1];
  a4[5].f32[1] = (float)(v82[v6] + v82[v13]) + (float)(v82[v17] + v82[v10]);
  a4[37] = v95;
  a4[21].f32[0] = (float)(v80.f32[0] * 0.83147) + (float)(v92 * 0.55557);
  a4[21].f32[1] = (float)(v92 * -0.83147) + (float)(v80.f32[0] * 0.55557);
  a4[53].f32[0] = (float)(v85 * 0.098017) + (float)(v90 * 0.99518);
  a4[53].f32[1] = (float)(v85 * -0.99518) + (float)(v90 * 0.098017);
  v96 = &a2[12 * a3];
  v50.f32[0] = v96[v13];
  v94.f32[0] = *(float *)((char *)v96 + v15);
  float v97 = v96[v17];
  float v98 = v96[v19];
  float v99 = (float)(v94.f32[0] + v50.f32[0]) - (float)(v97 + v98);
  float v100 = v96[v6];
  float v101 = *(float *)((char *)v96 + v8);
  v80.f32[0] = v96[v10];
  v39.f32[0] = (float)(*v96 - (float)(v100 + v101)) + v80.f32[0];
  v37.f32[0] = v101 + *v96;
  float v102 = v100 + *v96;
  float v103 = v100 + v80.f32[0];
  v80.f32[0] = v102 - (float)(v101 + v80.f32[0]);
  float v104 = (float)(v50.f32[0] - v103) + v97;
  v50.f32[0] = v50.f32[0] - (float)(v94.f32[0] + v97);
  v94.f32[0] = v94.f32[0] + v98;
  float v105 = v37.f32[0] - v94.f32[0];
  a4[6].f32[0] = v94.f32[0] + v37.f32[0];
  a4[6].f32[1] = (float)(v96[v6] + v96[v13]) + (float)(v96[v17] + v96[v10]);
  float32x2_t v106 = vmul_n_f32((float32x2_t)0x3F54DB383F0E39D6, v50.f32[0] + v98);
  float32x2_t v107 = vmul_n_f32((float32x2_t)0x3F0E39D63F54DB38, v80.f32[0]);
  v37.i32[0] = vadd_f32(v106, v107).u32[0];
  v37.i32[1] = vsub_f32(v106, v107).i32[1];
  a4[38] = v37;
  a4[22].f32[0] = (float)(v104 * 0.92388) + (float)(v105 * 0.38268);
  a4[22].f32[1] = (float)(v105 * -0.92388) + (float)(v104 * 0.38268);
  a4[54].f32[0] = (float)(v39.f32[0] * -0.19509) + (float)(v99 * 0.98079);
  a4[54].f32[1] = (float)(v99 * -0.19509) + (float)(v39.f32[0] * -0.98079);
  v108 = &a2[14 * a3];
  v39.f32[0] = v108[v13];
  float v109 = *(float *)((char *)v108 + v15);
  v106.f32[0] = v108[v17];
  v37.f32[0] = v108[v19];
  float v110 = (float)(v109 + v39.f32[0]) - (float)(v106.f32[0] + v37.f32[0]);
  float v111 = v108[v6];
  float v112 = *(float *)((char *)v108 + v8);
  v107.f32[0] = v108[v10];
  v4.f32[0] = (float)(*v108 - (float)(v111 + v112)) + v107.f32[0];
  v52.f32[0] = v112 + *v108;
  float v113 = v111 + *v108;
  float v114 = v111 + v107.f32[0];
  v107.f32[0] = v113 - (float)(v112 + v107.f32[0]);
  float v115 = (float)(v39.f32[0] - v114) + v106.f32[0];
  v106.f32[0] = v39.f32[0] - (float)(v109 + v106.f32[0]);
  float v116 = v109 + v37.f32[0];
  v106.f32[0] = v106.f32[0] + v37.f32[0];
  v37.f32[0] = v52.f32[0] - v116;
  a4[7].f32[0] = v116 + v52.f32[0];
  a4[7].f32[1] = (float)(v108[v6] + v108[v13]) + (float)(v108[v17] + v108[v10]);
  float32x2_t v117 = vmul_n_f32((float32x2_t)0x3F45E3FC3F226762, v106.f32[0]);
  float32x2_t v118 = vmul_n_f32((float32x2_t)0x3F2267623F45E3FCLL, v107.f32[0]);
  v106.i32[0] = vadd_f32(v117, v118).u32[0];
  v106.i32[1] = vsub_f32(v117, v118).i32[1];
  a4[39] = v106;
  a4[23].f32[0] = (float)(v115 * 0.98079) + (float)(v37.f32[0] * 0.19509);
  a4[23].f32[1] = (float)(v37.f32[0] * -0.98079) + (float)(v115 * 0.19509);
  a4[55].f32[0] = (float)(v4.f32[0] * -0.4714) + (float)(v110 * 0.88192);
  a4[55].f32[1] = (float)(v110 * -0.4714) + (float)(v4.f32[0] * -0.88192);
  v119 = &a2[16 * (uint64_t)a3];
  float v120 = v119[v6];
  v66.f32[0] = v119[v10];
  float v121 = v119[v13];
  float v122 = v119[v17];
  v64.f32[0] = (float)(v121 - (float)(v120 + v66.f32[0])) + v122;
  v4.f32[0] = *(float *)((char *)v119 + v8);
  v118.f32[0] = *(float *)((char *)v119 + v15);
  v117.f32[0] = v119[v19];
  v52.f32[0] = v4.f32[0] + *v119;
  v39.f32[0] = v118.f32[0] + v117.f32[0];
  v37.f32[0] = v52.f32[0] - (float)(v118.f32[0] + v117.f32[0]);
  float32_t v123 = v64.f32[0] + (float)(v37.f32[0] * 0.0000000437);
  v106.f32[0] = -(float)(v37.f32[0] - (float)(v64.f32[0] * 0.0000000437));
  v37.f32[0] = (float)(v118.f32[0] + v121) - (float)(v122 + v117.f32[0]);
  v64.f32[0] = (float)(*v119 - (float)(v120 + v4.f32[0])) + v66.f32[0];
  float v124 = (float)(v120 + *v119) - (float)(v4.f32[0] + v66.f32[0]);
  v118.f32[0] = (float)(v121 - (float)(v118.f32[0] + v122)) + v117.f32[0];
  a4[8].f32[0] = v39.f32[0] + v52.f32[0];
  a4[8].f32[1] = (float)(v119[v6] + v119[v13]) + (float)(v119[v17] + v119[v10]);
  a4[40].f32[0] = (float)(v118.f32[0] + v124) * 0.70711;
  a4[40].f32[1] = (float)(v118.f32[0] - v124) * 0.70711;
  a4[24].f32[0] = v123;
  a4[24].i32[1] = v106.i32[0];
  a4[56].f32[0] = (float)(v64.f32[0] * -0.70711) - (float)(v37.f32[0] * -0.70711);
  a4[56].f32[1] = (float)(v37.f32[0] * -0.70711) + (float)(v64.f32[0] * -0.70711);
  v125 = &a2[18 * a3];
  v118.f32[0] = v125[v13];
  v117.f32[0] = *(float *)((char *)v125 + v15);
  v106.f32[0] = v125[v17];
  v37.f32[0] = v125[v19];
  v39.f32[0] = (float)(v117.f32[0] + v118.f32[0]) - (float)(v106.f32[0] + v37.f32[0]);
  float v126 = v125[v6];
  float v127 = *(float *)((char *)v125 + v8);
  v4.f32[0] = v125[v10];
  float v128 = (float)(*v125 - (float)(v126 + v127)) + v4.f32[0];
  v64.f32[0] = v127 + *v125;
  v52.f32[0] = v126 + *v125;
  float v129 = (float)(v118.f32[0] - (float)(v126 + v4.f32[0])) + v106.f32[0];
  v118.f32[0] = v118.f32[0] - (float)(v117.f32[0] + v106.f32[0]);
  v117.f32[0] = v117.f32[0] + v37.f32[0];
  v106.f32[0] = v64.f32[0] - v117.f32[0];
  a4[9].f32[0] = v117.f32[0] + v64.f32[0];
  a4[9].f32[1] = (float)(v125[v6] + v125[v13]) + (float)(v125[v17] + v125[v10]);
  float32x2_t v130 = vmul_n_f32((float32x2_t)0x3F2267623F45E3FCLL, v118.f32[0] + v37.f32[0]);
  float32x2_t v131 = vmul_n_f32((float32x2_t)0x3F45E3FC3F226762, v52.f32[0] - (float)(v127 + v4.f32[0]));
  v37.i32[0] = vadd_f32(v130, v131).u32[0];
  v37.i32[1] = vsub_f32(v130, v131).i32[1];
  a4[41] = v37;
  a4[25].f32[0] = (float)(v129 * 0.98079) + (float)(v106.f32[0] * -0.19509);
  a4[25].f32[1] = (float)(v106.f32[0] * -0.98079) + (float)(v129 * -0.19509);
  a4[57].f32[0] = (float)(v128 * -0.88192) + (float)(v39.f32[0] * 0.4714);
  a4[57].f32[1] = (float)(v39.f32[0] * -0.88192) + (float)(v128 * -0.4714);
  v132 = &a2[20 * a3];
  v130.f32[0] = v132[v13];
  v131.f32[0] = *(float *)((char *)v132 + v15);
  v106.f32[0] = v132[v17];
  v37.f32[0] = v132[v19];
  v39.f32[0] = (float)(v131.f32[0] + v130.f32[0]) - (float)(v106.f32[0] + v37.f32[0]);
  v52.f32[0] = v132[v6];
  float v133 = *(float *)((char *)v132 + v8);
  float v134 = v132[v10];
  v4.f32[0] = (float)(*v132 - (float)(v52.f32[0] + v133)) + v134;
  v64.f32[0] = v133 + *v132;
  float v135 = v52.f32[0] + *v132;
  v52.f32[0] = (float)(v130.f32[0] - (float)(v52.f32[0] + v134)) + v106.f32[0];
  v130.f32[0] = v130.f32[0] - (float)(v131.f32[0] + v106.f32[0]);
  v131.f32[0] = v131.f32[0] + v37.f32[0];
  v106.f32[0] = v64.f32[0] - v131.f32[0];
  a4[10].f32[0] = v131.f32[0] + v64.f32[0];
  a4[10].f32[1] = (float)(v132[v6] + v132[v13]) + (float)(v132[v17] + v132[v10]);
  float32x2_t v136 = vmul_n_f32((float32x2_t)0x3F54DB383F0E39D6, v135 - (float)(v133 + v134));
  float32x2_t v137 = vmul_n_f32((float32x2_t)0x3F0E39D63F54DB38, v130.f32[0] + v37.f32[0]);
  v37.i32[0] = vadd_f32(v137, v136).u32[0];
  v37.i32[1] = vsub_f32(v137, v136).i32[1];
  a4[42] = v37;
  a4[26].f32[0] = (float)(v52.f32[0] * 0.92388) + (float)(v106.f32[0] * -0.38268);
  a4[26].f32[1] = (float)(v106.f32[0] * -0.92388) + (float)(v52.f32[0] * -0.38268);
  a4[58].f32[0] = (float)(v4.f32[0] * -0.98079) + (float)(v39.f32[0] * 0.19509);
  a4[58].f32[1] = (float)(v39.f32[0] * -0.98079) + (float)(v4.f32[0] * -0.19509);
  v138 = &a2[22 * a3];
  v136.f32[0] = v138[v6];
  v106.f32[0] = *(float *)((char *)v138 + v8);
  v37.f32[0] = v138[v13];
  v39.f32[0] = *(float *)((char *)v138 + v15);
  v52.f32[0] = v138[v17];
  float v139 = v138[v19];
  float v140 = (float)(v39.f32[0] + v37.f32[0]) - (float)(v52.f32[0] + v139);
  v4.f32[0] = v138[v10];
  float v141 = (float)(*v138 - (float)(v136.f32[0] + v106.f32[0])) + v4.f32[0];
  v64.f32[0] = v106.f32[0] + *v138;
  v137.f32[0] = (float)(v136.f32[0] + *v138) - (float)(v106.f32[0] + v4.f32[0]);
  v136.f32[0] = (float)(v37.f32[0] - (float)(v136.f32[0] + v4.f32[0])) + v52.f32[0];
  v106.f32[0] = v39.f32[0] + v52.f32[0];
  v39.f32[0] = v39.f32[0] + v139;
  v106.f32[0] = v37.f32[0] - v106.f32[0];
  v37.f32[0] = v64.f32[0] - v39.f32[0];
  a4[11].f32[0] = v39.f32[0] + v64.f32[0];
  a4[11].f32[1] = (float)(v138[v6] + v138[v13]) + (float)(v138[v17] + v138[v10]);
  float32x2_t v142 = vmul_n_f32((float32x2_t)0x3EF15B573F61C582, v106.f32[0] + v139);
  float32x2_t v143 = vmul_n_f32((float32x2_t)0x3F61C5823EF15B57, v137.f32[0]);
  v39.i32[0] = vadd_f32(v142, v143).u32[0];
  v39.i32[1] = vsub_f32(v142, v143).i32[1];
  a4[43] = v39;
  a4[27].f32[0] = (float)(v136.f32[0] * 0.83147) + (float)(v37.f32[0] * -0.55557);
  a4[27].f32[1] = (float)(v37.f32[0] * -0.83147) + (float)(v136.f32[0] * -0.55557);
  a4[59].f32[0] = -(float)((float)(v140 * 0.098017) - (float)(v141 * -0.99518));
  a4[59].f32[1] = (float)(v140 * -0.99518) + (float)(v141 * 0.098017);
  v144 = &a2[24 * a3];
  v143.f32[0] = v144[v6];
  v136.f32[0] = *(float *)((char *)v144 + v8);
  v37.f32[0] = v144[v10];
  v39.f32[0] = (float)(*v144 - (float)(v143.f32[0] + v136.f32[0])) + v37.f32[0];
  v52.f32[0] = v144[v13];
  float v145 = *(float *)((char *)v144 + v15);
  float v146 = v144[v17];
  float v147 = v144[v19];
  v4.f32[0] = (float)(v145 + v52.f32[0]) - (float)(v146 + v147);
  v64.f32[0] = v136.f32[0] + *v144;
  v136.f32[0] = (float)(v143.f32[0] + *v144) - (float)(v136.f32[0] + v37.f32[0]);
  v143.f32[0] = (float)(v52.f32[0] - (float)(v143.f32[0] + v37.f32[0])) + v146;
  v142.f32[0] = v52.f32[0] - (float)(v145 + v146);
  v52.f32[0] = v64.f32[0] - (float)(v145 + v147);
  a4[12].f32[0] = (float)(v145 + v147) + v64.f32[0];
  float32x2_t v148 = vmul_n_f32((float32x2_t)0x3EC3EEA23F6C8366, v142.f32[0] + v147);
  float32x2_t v149 = vmul_n_f32((float32x2_t)0x3F6C83663EC3EEA2, v136.f32[0]);
  v150.i32[0] = vadd_f32(v148, v149).u32[0];
  v150.i32[1] = vsub_f32(v148, v149).i32[1];
  a4[12].f32[1] = (float)(v144[v6] + v144[v13]) + (float)(v144[v17] + v144[v10]);
  a4[44] = v150;
  v143.f32[0] = v143.f32[0] * -0.70711;
  a4[28].f32[0] = (float)(v52.f32[0] * -0.70711) - v143.f32[0];
  a4[28].f32[1] = (float)(v52.f32[0] * -0.70711) + v143.f32[0];
  a4[60].f32[0] = (float)(v4.f32[0] * -0.38268) + (float)(v39.f32[0] * -0.92388);
  a4[60].f32[1] = (float)(v4.f32[0] * -0.92388) + (float)(v39.f32[0] * 0.38268);
  v151 = &a2[26 * a3];
  v143.f32[0] = v151[v6];
  v148.f32[0] = *(float *)((char *)v151 + v8);
  v37.f32[0] = v151[v10];
  v39.f32[0] = (float)(*v151 - (float)(v143.f32[0] + v148.f32[0])) + v37.f32[0];
  v52.f32[0] = v151[v13];
  v150.f32[0] = *(float *)((char *)v151 + v15);
  float v152 = v151[v17];
  float v153 = v151[v19];
  v4.f32[0] = (float)(v150.f32[0] + v52.f32[0]) - (float)(v152 + v153);
  v64.f32[0] = v148.f32[0] + *v151;
  v149.f32[0] = (float)(v143.f32[0] + *v151) - (float)(v148.f32[0] + v37.f32[0]);
  v143.f32[0] = (float)(v52.f32[0] - (float)(v143.f32[0] + v37.f32[0])) + v152;
  v148.f32[0] = v52.f32[0] - (float)(v150.f32[0] + v152);
  v52.f32[0] = v64.f32[0] - (float)(v150.f32[0] + v153);
  a4[13].f32[0] = (float)(v150.f32[0] + v153) + v64.f32[0];
  a4[13].f32[1] = (float)(v151[v6] + v151[v13]) + (float)(v151[v17] + v151[v10]);
  float32x2_t v154 = vmul_n_f32((float32x2_t)0x3E949F953F74FA05, v148.f32[0] + v153);
  float32x2_t v155 = vmul_n_f32((float32x2_t)0x3F74FA053E949F95, v149.f32[0]);
  v37.i32[0] = vadd_f32(v154, v155).u32[0];
  v37.i32[1] = vsub_f32(v154, v155).i32[1];
  a4[45] = v37;
  a4[29].f32[0] = (float)(v143.f32[0] * 0.55557) + (float)(v52.f32[0] * -0.83147);
  a4[29].f32[1] = (float)(v52.f32[0] * -0.55557) + (float)(v143.f32[0] * -0.83147);
  a4[61].f32[0] = -(float)((float)(v4.f32[0] * 0.63439) - (float)(v39.f32[0] * -0.77301));
  a4[61].f32[1] = (float)(v4.f32[0] * -0.77301) + (float)(v39.f32[0] * 0.63439);
  v156 = &a2[28 * a3];
  v143.f32[0] = v156[v6];
  v155.f32[0] = *(float *)((char *)v156 + v8);
  v154.f32[0] = v156[v10];
  v39.f32[0] = (float)(*v156 - (float)(v143.f32[0] + v155.f32[0])) + v154.f32[0];
  v52.f32[0] = v156[v13];
  v150.f32[0] = *(float *)((char *)v156 + v15);
  float v157 = v156[v17];
  float v158 = v156[v19];
  v4.f32[0] = (float)(v150.f32[0] + v52.f32[0]) - (float)(v157 + v158);
  v64.f32[0] = v155.f32[0] + *v156;
  v155.f32[0] = (float)(v143.f32[0] + *v156) - (float)(v155.f32[0] + v154.f32[0]);
  v143.f32[0] = (float)(v52.f32[0] - (float)(v143.f32[0] + v154.f32[0])) + v157;
  a4[14].f32[0] = (float)(v150.f32[0] + v158) + v64.f32[0];
  a4[14].f32[1] = (float)(v156[v6] + v156[v13]) + (float)(v156[v17] + v156[v10]);
  float32x2_t v159 = vmul_n_f32((float32x2_t)0x3E47C5AC3F7B150ELL, (float)(v52.f32[0] - (float)(v150.f32[0] + v157)) + v158);
  float32x2_t v160 = vmul_n_f32((float32x2_t)0x3F7B150E3E47C5ACLL, v155.f32[0]);
  v37.i32[0] = vadd_f32(v159, v160).u32[0];
  v37.i32[1] = vsub_f32(v159, v160).i32[1];
  a4[46] = v37;
  float32x2_t v161 = vmul_n_f32((float32x2_t)0xBF6C83663EC3EEA2, v143.f32[0]);
  float32x2_t v162 = vmul_n_f32((float32x2_t)0x3EC3EEA2BF6C8366, v64.f32[0] - (float)(v150.f32[0] + v158));
  v159.i32[0] = vadd_f32(v161, v162).u32[0];
  v159.i32[1] = vsub_f32(v161, v162).i32[1];
  a4[30] = v159;
  a4[62] = vmls_lane_f32(vmul_n_f32((float32x2_t)0x3F54DB38BF0E39D6, v39.f32[0]), (float32x2_t)0x3F0E39D63F54DB38, v4, 0);
  v163 = &a2[30 * a3];
  v161.f32[0] = v163[v6];
  v162.f32[0] = *(float *)((char *)v163 + v8);
  v159.f32[0] = v163[v10];
  v39.f32[0] = (float)(*v163 - (float)(v161.f32[0] + v162.f32[0])) + v159.f32[0];
  v52.f32[0] = v163[v13];
  v150.f32[0] = *(float *)((char *)v163 + v15);
  float v164 = v163[v17];
  float v165 = v163[v19];
  v4.f32[0] = (float)(v150.f32[0] + v52.f32[0]) - (float)(v164 + v165);
  v64.f32[0] = v162.f32[0] + *v163;
  v162.f32[0] = (float)(v161.f32[0] + *v163) - (float)(v162.f32[0] + v159.f32[0]);
  v161.f32[0] = (float)(v52.f32[0] - (float)(v161.f32[0] + v159.f32[0])) + v164;
  a4[15].f32[0] = (float)(v150.f32[0] + v165) + v64.f32[0];
  a4[15].f32[1] = (float)(v163[v6] + v163[v13]) + (float)(v163[v17] + v163[v10]);
  float32x2_t v166 = vmul_n_f32((float32x2_t)0x3DC8BD233F7EC41ELL, (float)(v52.f32[0] - (float)(v150.f32[0] + v164)) + v165);
  float32x2_t v167 = vmul_n_f32((float32x2_t)0x3F7EC41E3DC8BD23, v162.f32[0]);
  v37.i32[0] = vadd_f32(v166, v167).u32[0];
  v37.i32[1] = vsub_f32(v166, v167).i32[1];
  a4[47] = v37;
  float32x2_t v168 = vmul_n_f32((float32x2_t)0xBF7B150E3E47C5ACLL, v161.f32[0]);
  float32x2_t v169 = vmul_n_f32((float32x2_t)0x3E47C5ACBF7B150ELL, v64.f32[0] - (float)(v150.f32[0] + v165));
  v166.i32[0] = vadd_f32(v168, v169).u32[0];
  v166.i32[1] = vsub_f32(v168, v169).i32[1];
  a4[31] = v166;
  a4[63] = vmls_lane_f32(vmul_n_f32((float32x2_t)0x3F74FA05BE949F95, v39.f32[0]), (float32x2_t)0x3E949F953F74FA05, v4, 0);
  v170 = a4 + 32;
  v171 = a4 + 48;
  sub_100006298(a1, (uint64_t)a4, a4);
  sub_100006298(a1, (uint64_t)v23, v23);
  sub_100006298(a1, (uint64_t)v170, v170);

  return sub_100006298(a1, (uint64_t)v171, v171);
}

float32_t sub_100006298(uint64_t a1, uint64_t a2, float32x2_t *a3)
{
  float v5 = *(float *)(a2 + 32);
  float v4 = *(float *)(a2 + 36);
  float v6 = *(float *)(a2 + 64);
  float v7 = *(float *)(a2 + 68);
  float v8 = *(float *)(a2 + 4);
  float v10 = *(float *)(a2 + 96);
  float v9 = *(float *)(a2 + 100);
  float32_t v11 = (float)(*(float *)a2 - (float)(v4 + v6)) + v9;
  float32_t v12 = (float)(v5 + v8) - (float)(v7 + v10);
  float v13 = v6 + *(float *)a2;
  float32_t v14 = v13 - (float)(v5 + v10);
  float32_t v15 = (float)(v8 - (float)(v4 + v9)) + v7;
  float32_t v16 = (float)(v4 + *(float *)a2) - (float)(v6 + v9);
  float32_t v17 = (float)(v8 - (float)(v5 + v7)) + v10;
  float32_t v18 = (float)(v5 + v10) + v13;
  a3->f32[0] = v18;
  float32_t v19 = (float)(*(float *)(a2 + 36) + *(float *)(a2 + 4)) + (float)(*(float *)(a2 + 68) + *(float *)(a2 + 100));
  a3->f32[1] = v19;
  a3[8].f32[0] = v16;
  a3[8].f32[1] = v17;
  a3[4].f32[0] = v14;
  a3[4].f32[1] = v15;
  a3[12].f32[0] = v11;
  a3[12].f32[1] = v12;
  float v21 = *(float *)(a2 + 40);
  float v20 = *(float *)(a2 + 44);
  float v22 = *(float *)(a2 + 72);
  float v23 = *(float *)(a2 + 76);
  float v24 = *(float *)(a2 + 8);
  float v25 = *(float *)(a2 + 12);
  float v27 = *(float *)(a2 + 104);
  float v26 = *(float *)(a2 + 108);
  float v28 = (float)(v24 - (float)(v20 + v22)) + v26;
  float v29 = (float)(v21 + v25) - (float)(v23 + v27);
  float v30 = v22 + v24;
  float v31 = (float)(v22 + v24) - (float)(v21 + v27);
  v3.f32[0] = (float)(v25 - (float)(v20 + v26)) + v23;
  float v32 = (float)(v20 + v24) - (float)(v22 + v26);
  float32_t v33 = (float)(v21 + v27) + v30;
  a3[1].f32[0] = v33;
  a3[1].f32[1] = (float)(*(float *)(a2 + 44) + *(float *)(a2 + 12))
               + (float)(*(float *)(a2 + 76) + *(float *)(a2 + 108));
  float32x2_t v34 = vmul_n_f32((float32x2_t)0x3F6C83663EC3EEA2, (float)(v25 - (float)(v21 + v23)) + v27);
  float32x2_t v35 = vmul_n_f32((float32x2_t)0x3EC3EEA23F6C8366, v32);
  v36.i32[0] = vadd_f32(v34, v35).u32[0];
  v36.i32[1] = vsub_f32(v34, v35).i32[1];
  a3[9] = v36;
  a3[5].f32[0] = (float)(v31 + v3.f32[0]) * 0.70711;
  a3[5].f32[1] = (float)(v3.f32[0] - v31) * 0.70711;
  float32x2_t v37 = vmul_n_f32((float32x2_t)0x3EC3EEA23F6C8366, v29);
  float32x2_t v38 = vmul_n_f32((float32x2_t)0x3F6C83663EC3EEA2, v28);
  v39.i32[0] = vadd_f32(v37, v38).u32[0];
  v39.i32[1] = vsub_f32(v37, v38).i32[1];
  a3[13] = v39;
  v38.i32[0] = *(_DWORD *)(a2 + 48);
  v37.i32[0] = *(_DWORD *)(a2 + 52);
  v39.i32[0] = *(_DWORD *)(a2 + 80);
  float v40 = *(float *)(a2 + 84);
  float v41 = *(float *)(a2 + 16);
  float v42 = *(float *)(a2 + 20);
  float v44 = *(float *)(a2 + 112);
  float v43 = *(float *)(a2 + 116);
  float v45 = (float)(v41 - (float)(v37.f32[0] + v39.f32[0])) + v43;
  float v46 = (float)(v38.f32[0] + v42) - (float)(v40 + v44);
  v3.f32[0] = v39.f32[0] + v41;
  float v47 = (float)(v39.f32[0] + v41) - (float)(v38.f32[0] + v44);
  float v48 = (float)(v42 - (float)(v37.f32[0] + v43)) + v40;
  v37.f32[0] = (float)(v37.f32[0] + v41) - (float)(v39.f32[0] + v43);
  v39.f32[0] = (float)(v42 - (float)(v38.f32[0] + v40)) + v44;
  v38.f32[0] = (float)(v38.f32[0] + v44) + v3.f32[0];
  a3[2].i32[0] = v38.i32[0];
  a3[2].f32[1] = (float)(*(float *)(a2 + 52) + *(float *)(a2 + 20))
               + (float)(*(float *)(a2 + 84) + *(float *)(a2 + 116));
  a3[10].f32[0] = (float)(v39.f32[0] + v37.f32[0]) * 0.70711;
  a3[10].f32[1] = (float)(v39.f32[0] - v37.f32[0]) * 0.70711;
  a3[6].f32[0] = v48 + (float)(v47 * 0.0000000437);
  a3[6].f32[1] = -(float)(v47 - (float)(v48 * 0.0000000437));
  a3[14].f32[0] = (float)(v45 * -0.70711) - (float)(v46 * -0.70711);
  a3[14].f32[1] = (float)(v46 * -0.70711) + (float)(v45 * -0.70711);
  v39.i32[0] = *(_DWORD *)(a2 + 56);
  v37.i32[0] = *(_DWORD *)(a2 + 60);
  v36.i32[0] = *(_DWORD *)(a2 + 88);
  float v49 = *(float *)(a2 + 92);
  float v50 = *(float *)(a2 + 24);
  float v51 = *(float *)(a2 + 28);
  float v53 = *(float *)(a2 + 120);
  float v52 = *(float *)(a2 + 124);
  float v54 = (float)(v50 - (float)(v37.f32[0] + v36.f32[0])) + v52;
  v3.f32[0] = (float)(v39.f32[0] + v51) - (float)(v49 + v53);
  float v55 = v36.f32[0] + v50;
  float v56 = v39.f32[0] + v53;
  float v57 = (float)(v36.f32[0] + v50) - (float)(v39.f32[0] + v53);
  float v58 = (float)(v51 - (float)(v37.f32[0] + v52)) + v49;
  v36.f32[0] = (float)(v37.f32[0] + v50) - (float)(v36.f32[0] + v52);
  v39.f32[0] = (float)(v51 - (float)(v39.f32[0] + v49)) + v53;
  a3[3].f32[0] = v56 + v55;
  float v59 = (float)(*(float *)(a2 + 60) + *(float *)(a2 + 28)) + (float)(*(float *)(a2 + 92) + *(float *)(a2 + 124));
  v37.f32[0] = (float)(v36.f32[0] * 0.38268) + (float)(v39.f32[0] * 0.92388);
  v39.f32[0] = (float)(v36.f32[0] * -0.92388) + (float)(v39.f32[0] * 0.38268);
  float v60 = (float)(v57 * -0.70711) - (float)(v58 * -0.70711);
  v36.f32[0] = (float)(v57 * -0.70711) + (float)(v58 * -0.70711);
  a3[15] = vmls_lane_f32(vmul_n_f32((float32x2_t)0x3EC3EEA2BF6C8366, v54), (float32x2_t)0x3F6C83663EC3EEA2, v3, 0);
  float v61 = a3[1].f32[1];
  float v62 = a3[2].f32[1];
  float v63 = (float)(v56 + v55) + v33;
  a3->f32[0] = v63 + (float)(v38.f32[0] + v18);
  a3->f32[1] = (float)(v61 + v59) + (float)(v19 + v62);
  a3[2].f32[0] = (float)(v18 + v61) - (float)(v38.f32[0] + v59);
  a3[2].f32[1] = (float)(v19 + (float)(v56 + v55)) - (float)(v33 + v62);
  a3[1].f32[0] = (float)(v38.f32[0] + v18) - v63;
  a3[1].f32[1] = (float)(v19 - (float)(v61 + v59)) + v62;
  a3[3].f32[0] = (float)(v18 - (float)(v38.f32[0] + v61)) + v59;
  a3[3].f32[1] = (float)(v33 + v19) - (float)((float)(v56 + v55) + v62);
  float v64 = a3[5].f32[1];
  float v65 = a3[6].f32[0];
  float v66 = a3[4].f32[1];
  v38.i32[0] = a3[5].i32[0];
  float v67 = a3[6].f32[1];
  a3[4].f32[0] = (float)(v60 + v38.f32[0]) + (float)(v65 + v14);
  a3[4].f32[1] = (float)(v64 + v36.f32[0]) + (float)(v66 + v67);
  a3[6].f32[0] = (float)(v64 + v14) - (float)(v65 + v36.f32[0]);
  a3[6].f32[1] = (float)(v66 - (float)(v38.f32[0] + v67)) + v60;
  a3[5].f32[0] = (float)(v65 + v14) - (float)(v60 + v38.f32[0]);
  a3[5].f32[1] = (float)(v66 - (float)(v64 + v36.f32[0])) + v67;
  a3[7].f32[0] = (float)(v14 - (float)(v64 + v65)) + v36.f32[0];
  a3[7].f32[1] = (float)(v38.f32[0] + v66) - (float)(v67 + v60);
  float v68 = a3[9].f32[1];
  float v69 = a3[10].f32[0];
  float v70 = a3[8].f32[1];
  float v71 = a3[9].f32[0];
  v38.i32[0] = a3[10].i32[1];
  a3[8].f32[0] = (float)(v37.f32[0] + v71) + (float)(v69 + v16);
  a3[8].f32[1] = (float)(v68 + v39.f32[0]) + (float)(v70 + v38.f32[0]);
  a3[10].f32[0] = (float)(v68 + v16) - (float)(v69 + v39.f32[0]);
  a3[10].f32[1] = (float)(v70 - (float)(v71 + v38.f32[0])) + v37.f32[0];
  a3[9].f32[0] = (float)(v69 + v16) - (float)(v37.f32[0] + v71);
  a3[9].f32[1] = (float)(v70 - (float)(v68 + v39.f32[0])) + v38.f32[0];
  a3[11].f32[0] = (float)(v16 - (float)(v68 + v69)) + v39.f32[0];
  a3[11].f32[1] = (float)(v71 + v70) - (float)(v38.f32[0] + v37.f32[0]);
  float v72 = a3[13].f32[1];
  float v73 = a3[14].f32[0];
  v38.i32[0] = a3[15].i32[0];
  float v74 = a3[15].f32[1];
  float32_t v75 = (float)(v11 - (float)(v72 + v73)) + v74;
  float v76 = a3[12].f32[1];
  float v77 = a3[13].f32[0];
  v37.i32[0] = a3[14].i32[1];
  a3[12].f32[0] = (float)(v38.f32[0] + v77) + (float)(v73 + v11);
  a3[12].f32[1] = (float)(v72 + v74) + (float)(v76 + v37.f32[0]);
  a3[14].f32[0] = (float)(v72 + v11) - (float)(v73 + v74);
  a3[14].f32[1] = (float)(v76 - (float)(v77 + v37.f32[0])) + v38.f32[0];
  a3[13].f32[0] = (float)(v73 + v11) - (float)(v38.f32[0] + v77);
  a3[13].f32[1] = (float)(v76 - (float)(v72 + v74)) + v37.f32[0];
  float32_t result = (float)(v77 + v76) - (float)(v37.f32[0] + v38.f32[0]);
  a3[15].f32[0] = v75;
  a3[15].f32[1] = result;
  return result;
}

void Madusa::AffineTransform::PadAndFold(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = *a3 + 8;
  uint64_t v5 = *a2 + 264;
  uint64_t v6 = v5;
  do
  {
    uint64_t v7 = 0;
    float v8 = (float *)v5;
    do
    {
      *(float *)(v4 + v7) = *v8 + *(float *)(v6 + v7);
      v7 += 4;
      v8 += 128;
    }
    while (v7 != 256);
    ++v3;
    v6 += 512;
    v5 -= 4;
    v4 += 256;
  }
  while (v3 != 64);
}

void Madusa::AffineTransform::_PadAndFold(uint64_t a1, void *a2, void *a3, int8x8_t a4)
{
  a4.i32[0] = *v4 | 0xFFFFFFE0;
  a4.i8[4] = v4[3];
  *(int8x8_t *)v5.i8 = vand_s8(a4, (int8x8_t)0xFF000000FFLL);
  v5.i64[1] = v5.i64[0];
  float32x4_t v6 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v5, (int32x4_t)xmmword_1000394A0));
  v7.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_1000394B0, v6)).u32[0];
  v7.i32[1] = vmovn_s32(vcgtq_f32(v6, (float32x4_t)xmmword_1000394B0)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v7, 0xFuLL))) & ((v4[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    ++QuickCodec::mask;
  }
  Madusa::AffineTransform::PadAndFold(a1, a2, a3);
}

void *Madusa::ImageParamsAdjuster::ImageParamsAdjuster(void *this, _t_zn_IMAGEPARAMS *a2)
{
  *this = a2;
  return this;
}

uint64_t Madusa::ImageParamsAdjuster::Adjust(uint64_t this)
{
  v1 = *(_DWORD **)this;
  int v2 = *(_DWORD *)(*(void *)this + 76);
  if (v2)
  {
    if (v2 == 1) {
      return this;
    }
    unsigned int v3 = v1[5];
  }
  else
  {
    unsigned int v3 = v1[5];
    if (v3) {
      BOOL v4 = 0;
    }
    else {
      BOOL v4 = v1[7] <= 7;
    }
    if (v4)
    {
      v1[20] = 0;
      unsigned int v5 = 1;
      int v6 = v1[6];
      goto LABEL_16;
    }
  }
  if (v3 > 9)
  {
    unsigned int v5 = 0;
    int v6 = v1[6];
  }
  else
  {
    unsigned int v5 = dword_1000394E0[v3];
    int v6 = v1[6];
    if (v6) {
      unsigned int v7 = v5 + 1;
    }
    else {
      unsigned int v7 = v5;
    }
    if (v7 > 4) {
      return this;
    }
  }
LABEL_16:
  BOOL v8 = v6 == 0;
  uint64_t v9 = v5;
  if (!v8) {
    uint64_t v9 = v5 + 1;
  }
  uint64_t v10 = v9 + 11;
  do
    *(void *)(*(void *)this + 8 * v10++) = 0;
  while (v10 != 16);
  return this;
}

void *Madusa::ImageParamsValidator::ImageParamsValidator(void *result, uint64_t a2, uint64_t a3)
{
  *float32_t result = off_1000701B0;
  result[1] = a2;
  result[2] = a3;
  return result;
}

float Madusa::ImageParamsValidator::GetDimensionInInches(Madusa::ImageParamsValidator *this, int a2, int a3)
{
  if (a3) {
    return (float)a2 / (float)a3;
  }
  else {
    return 3.4028e38;
  }
}

BOOL Madusa::ImageParamsValidator::ColorComponentArrayMatchesColorModel(Madusa::ImageParamsValidator *this)
{
  uint64_t v1 = *((void *)this + 1);
  uint64_t v2 = *(int *)(v1 + 20);
  if (v2 > 9) {
    LODWORD(v3) = 0;
  }
  else {
    LODWORD(v3) = dword_1000394E0[v2];
  }
  int v4 = *(_DWORD *)(v1 + 24);
  BOOL v5 = v2 == -1 || v4 == 0;
  int v23 = -1;
  if (v5) {
    unint64_t v3 = v3;
  }
  else {
    unint64_t v3 = (v3 + 1);
  }
  *(void *)&long long v22 = -1;
  *((void *)&v22 + 1) = -1;
  switch((int)v2)
  {
    case 0:
      LODWORD(v22) = 1;
      if (v4) {
        BOOL v6 = v3 == 0;
      }
      else {
        BOOL v6 = 1;
      }
      if (v6) {
        goto LABEL_48;
      }
      goto LABEL_56;
    case 1:
      LODWORD(v22) = 2;
      if (v4) {
        BOOL v7 = v3 == 0;
      }
      else {
        BOOL v7 = 1;
      }
      if (!v7) {
        goto LABEL_56;
      }
      goto LABEL_48;
    case 2:
      DWORD2(v22) = 5;
      *(void *)&long long v22 = 0x400000003;
      if (v4) {
        BOOL v8 = v3 == 0;
      }
      else {
        BOOL v8 = 1;
      }
      if (!v8) {
        goto LABEL_56;
      }
      goto LABEL_48;
    case 3:
      DWORD2(v22) = 8;
      *(void *)&long long v22 = 0x700000006;
      if (v4) {
        BOOL v9 = v3 == 0;
      }
      else {
        BOOL v9 = 1;
      }
      if (!v9) {
        goto LABEL_56;
      }
      goto LABEL_48;
    case 4:
      long long v10 = xmmword_1000394C0;
      goto LABEL_52;
    case 5:
      DWORD2(v22) = 12;
      *(void *)&long long v22 = 0xB0000000ALL;
      if (v4) {
        BOOL v11 = v3 == 0;
      }
      else {
        BOOL v11 = 1;
      }
      if (!v11) {
        goto LABEL_56;
      }
      goto LABEL_48;
    case 6:
      DWORD2(v22) = 15;
      *(void *)&long long v22 = 0xE0000000DLL;
      if (v4) {
        BOOL v12 = v3 == 0;
      }
      else {
        BOOL v12 = 1;
      }
      if (!v12) {
        goto LABEL_56;
      }
      goto LABEL_48;
    case 7:
      DWORD2(v22) = 17;
      *(void *)&long long v22 = 0x100000000ALL;
      goto LABEL_43;
    case 9:
      long long v10 = xmmword_1000394D0;
LABEL_52:
      long long v22 = v10;
      if (v4) {
        BOOL v16 = v3 == 0;
      }
      else {
        BOOL v16 = 1;
      }
      if (!v16) {
        goto LABEL_56;
      }
      goto LABEL_48;
    default:
LABEL_43:
      if (v4) {
        BOOL v13 = v3 == 0;
      }
      else {
        BOOL v13 = 1;
      }
      if (v13)
      {
LABEL_48:
        if (!v3) {
          return 1;
        }
      }
      else
      {
LABEL_56:
        *((_DWORD *)&v22 + (v3 - 1)) = 0;
      }
      uint64_t v17 = 0;
      BOOL v14 = 0;
      uint64_t v18 = v1 + 36;
      break;
  }
LABEL_58:
  float32_t v19 = &v22;
  unint64_t v20 = v3;
  do
  {
    int v21 = *(_DWORD *)v19;
    float32_t v19 = (long long *)((char *)v19 + 4);
    if (*(_DWORD *)(v18 + 4 * v17) == v21)
    {
      BOOL v14 = ++v17 >= v3;
      if (v17 == v3) {
        return 1;
      }
      goto LABEL_58;
    }
    --v20;
  }
  while (v20);
  return v14;
}

uint64_t Madusa::ImageParamsValidator::ImageDataPointersArePresentAndFrontLoaded(Madusa::ImageParamsValidator *this, int16x8_t a2)
{
  uint64_t v2 = *((void *)this + 1);
  uint64_t v3 = *(int *)(v2 + 20);
  if (v3 > 9) {
    unsigned int v4 = 0;
  }
  else {
    unsigned int v4 = dword_1000394E0[v3];
  }
  int v5 = *(_DWORD *)(v2 + 24);
  BOOL v6 = v3 == -1 || v5 == 0;
  int v7 = !v6;
  if (v6) {
    uint64_t v8 = v4;
  }
  else {
    uint64_t v8 = v4 + 1;
  }
  if ((v8 - 1) > 4) {
    return 0;
  }
  if (v8 >= 4)
  {
    uint64_t v9 = v8 & 0xC;
    BOOL v12 = (int64x2_t *)(v2 + 88);
    a2.i32[0] = 65537;
    a2.i16[2] = 1;
    a2.i16[3] = 1;
    uint64_t v13 = v9;
    do
    {
      int64x2_t v14 = *v12;
      int64x2_t v15 = v12[1];
      v12 += 2;
      *(int8x8_t *)a2.i8 = vbic_s8(*(int8x8_t *)a2.i8, (int8x8_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqzq_s64(v14), (int32x4_t)vceqzq_s64(v15))));
      v13 -= 4;
    }
    while (v13);
    unsigned int v10 = vmovn_s16(a2).u32[0] == 16843009;
    if (v9 == v8) {
      goto LABEL_26;
    }
  }
  else
  {
    uint64_t v9 = 0;
    unsigned int v10 = 1;
  }
  unint64_t v16 = v3 != -1;
  uint64_t v17 = (void *)(v2 + 8 * v9 + 88);
  if ((v5 != 0) < v16) {
    unint64_t v16 = v5 != 0;
  }
  unint64_t v18 = v16 + v4 - v9;
  do
  {
    if (!*v17++) {
      unsigned int v10 = 0;
    }
    --v18;
  }
  while (v18);
LABEL_26:
  if (v8 <= 4)
  {
    BOOL v20 = v3 != -1;
    unsigned int v21 = v5 != 0;
    if (v21 >= v20) {
      uint64_t v22 = v20;
    }
    else {
      uint64_t v22 = v21;
    }
    uint64_t v23 = v4;
    uint64_t v24 = v22 + v4;
    if (v22) {
      int v25 = 6;
    }
    else {
      int v25 = 5;
    }
    uint64_t v26 = v25 + ~v4 - v7 - v22;
    if (v26 < 7)
    {
      LOBYTE(v27) = v10;
      goto LABEL_53;
    }
    uint64_t v28 = v26 + 1;
    if (v26 >= 0x1F)
    {
      uint64_t v30 = 0;
      uint64_t v29 = v28 & 0x1FFFFFFE0;
      int8x16_t v31 = vdupq_n_s8(v10);
      int8x16_t v32 = v31;
      int8x16_t v33 = v31;
      do
      {
        float32x2_t v34 = (int64x2_t *)(v2 + 88 + 8 * (v24 | v30));
        int8x16_t v32 = vandq_s8(v32, vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqzq_s64(*v34), (int32x4_t)vceqzq_s64(v34[1])), (int16x8_t)vuzp1q_s32((int32x4_t)vceqzq_s64(v34[2]), (int32x4_t)vceqzq_s64(v34[3]))), (int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqzq_s64(v34[4]), (int32x4_t)vceqzq_s64(v34[5])), (int16x8_t)vuzp1q_s32((int32x4_t)vceqzq_s64(v34[6]), (int32x4_t)vceqzq_s64(v34[7])))));
        int8x16_t v33 = vandq_s8(v33, vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqzq_s64(v34[8]), (int32x4_t)vceqzq_s64(v34[9])), (int16x8_t)vuzp1q_s32((int32x4_t)vceqzq_s64(v34[10]), (int32x4_t)vceqzq_s64(v34[11]))), (int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqzq_s64(v34[12]), (int32x4_t)vceqzq_s64(v34[13])), (int16x8_t)vuzp1q_s32((int32x4_t)vceqzq_s64(v34[14]), (int32x4_t)vceqzq_s64(v34[15])))));
        v30 += 32;
      }
      while (v29 != v30);
      if (vmaxvq_u8((uint8x16_t)vornq_s8(vmvnq_s8(vceqq_s8(v32, v31)), vceqq_s8(v33, v31)))) {
        unsigned int v27 = 0;
      }
      else {
        unsigned int v27 = v10;
      }
      if (v28 == v29) {
        return v27 & 1;
      }
      if ((v28 & 0x18) == 0)
      {
        v24 |= v29;
        goto LABEL_53;
      }
    }
    else
    {
      uint64_t v29 = 0;
      unsigned int v27 = v10;
    }
    int8x8_t v35 = vdup_n_s8(v27);
    v24 += v28 & 0x1FFFFFFF8;
    uint64_t v36 = v29 - (v28 & 0x1FFFFFFF8);
    float32x2_t v37 = (int64x2_t *)(v2 + 8 * (v29 + v23 + v22) + 88);
    do
    {
      int8x8_t v35 = vand_s8(v35, vmovn_s16(vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqzq_s64(*v37), (int32x4_t)vceqzq_s64(v37[1])), (int16x8_t)vuzp1q_s32((int32x4_t)vceqzq_s64(v37[2]), (int32x4_t)vceqzq_s64(v37[3])))));
      v37 += 4;
      v36 += 8;
    }
    while (v36);
    if (*(void *)&v35 == vdup_n_s8(v10)) {
      LOBYTE(v27) = v10;
    }
    else {
      LOBYTE(v27) = 0;
    }
    LOBYTE(v10) = v27;
    if (v28 == (v28 & 0x1FFFFFFF8)) {
      return v10 & 1;
    }
LABEL_53:
    float32x2_t v38 = (void *)(v2 + 8 * v24 + 88);
    int v39 = v7 + v24 - v25;
    LOBYTE(v10) = v27;
    do
    {
      if (*v38++) {
        LOBYTE(v10) = 0;
      }
    }
    while (!__CFADD__(v39++, 1));
  }
  return v10 & 1;
}

uint64_t Madusa::ImageParamsValidator::XStrideIsValid(Madusa::ImageParamsValidator *this)
{
  uint64_t v1 = *((void *)this + 1);
  BOOL v2 = *(_DWORD *)(v1 + 80) == 0;
  unsigned int v3 = !v2;
  if (*(int *)(v1 + 28) >= 8) {
    return v3;
  }
  else {
    return v2;
  }
}

BOOL Madusa::ImageParamsValidator::DataAccessFormatIsWhole(Madusa::ImageParamsValidator *this)
{
  return *(_DWORD *)(*((void *)this + 1) + 76) == 0;
}

BOOL Madusa::ImageParamsValidator::PaletteParametersAreValid(Madusa::ImageParamsValidator *this)
{
  uint64_t v1 = *((void *)this + 1);
  int v2 = *(_DWORD *)(v1 + 20);
  if (v2)
  {
    unsigned int v3 = *(_DWORD *)(v1 + 32) & 0x8000FFFF;
    if (v3 == 4 || v3 == 2)
    {
      int v5 = *(_DWORD *)(v1 + 28);
      if (v5 == 32 || v5 == 16) {
        return v2 == 2;
      }
    }
    else if (!v3)
    {
      unsigned int v16 = *(_DWORD *)(v1 + 28);
      if (v16 < 0x11) {
        return (0x10102u >> v16) & 1;
      }
    }
  }
  else if (!*(_DWORD *)(v1 + 24))
  {
    int v8 = *(_DWORD *)(v1 + 56);
    if ((v8 - 1) < 4 || v8 == 8)
    {
      int v10 = *(_DWORD *)(v1 + 60);
      if (v10 == 16 || v10 == 8)
      {
        unsigned int v12 = *(_DWORD *)(v1 + 28);
        BOOL v13 = v12 > 8;
        int v14 = (1 << v12) & 0x116;
        if (!v13 && v14 != 0) {
          return *(void *)(v1 + 64) != 0;
        }
      }
    }
  }
  return 0;
}

BOOL Madusa::ImageParamsValidator::ApproximateBufferSizeOverflows(Madusa::ImageParamsValidator *this)
{
  uint64_t v1 = *(int *)(*((void *)this + 1) + 84) * (uint64_t)*(int *)(*((void *)this + 1) + 8);
  return v1 != (int)v1;
}

uint64_t Madusa::ImageParamsValidator::ParametersAreValid(Madusa::ImageParamsValidator *this)
{
  uint64_t v1 = *((void *)this + 1);
  v2.i64[0] = 0x100000001;
  v2.i64[1] = 0x100000001;
  if (vmaxv_u16((uint16x4_t)vmovn_s32(vcgtq_s32(v2, *(int32x4_t *)(v1 + 4))))) {
    return 0;
  }
  uint64_t v5 = *(int *)(v1 + 20);
  if (v5 > 9)
  {
    unsigned int v6 = 0;
    int v7 = *(_DWORD *)(v1 + 24);
    BOOL v14 = v5 == -1 || v7 == 0;
    BOOL v8 = !v14;
    uint64_t v9 = !v14;
    if (v9) {
      goto LABEL_9;
    }
LABEL_25:
    unsigned int v11 = 1;
    goto LABEL_26;
  }
  unsigned int v6 = dword_1000394E0[v5];
  int v7 = *(_DWORD *)(v1 + 24);
  BOOL v8 = v7 != 0;
  if (v7) {
    uint64_t v9 = v6 + 1;
  }
  else {
    uint64_t v9 = v6;
  }
  if (!v9) {
    goto LABEL_25;
  }
LABEL_9:
  int v10 = (unsigned int *)(v1 + 36);
  unsigned int v11 = 1;
  uint64_t v12 = v9;
  do
  {
    unsigned int v13 = *v10++;
    if (v13 >= 0x13) {
      unsigned int v11 = 0;
    }
    --v12;
  }
  while (v12);
  if (v9 > 4) {
    goto LABEL_57;
  }
LABEL_26:
  unsigned int v15 = v7 != 0;
  if (v15 >= (v5 != -1)) {
    uint64_t v16 = v5 != -1;
  }
  else {
    uint64_t v16 = v15;
  }
  uint64_t v17 = v6;
  uint64_t v18 = v16 + v6;
  if (v16) {
    int v19 = 6;
  }
  else {
    int v19 = 5;
  }
  uint64_t v20 = v19 + ~v6 - v8 - v16;
  if (v20 < 7)
  {
    LOBYTE(v21) = v11;
    goto LABEL_52;
  }
  uint64_t v22 = v20 + 1;
  if (v20 >= 0x1F)
  {
    uint64_t v24 = 0;
    uint64_t v23 = v22 & 0x1FFFFFFE0;
    int8x16_t v25 = vdupq_n_s8(v11);
    v26.i64[0] = -1;
    v26.i64[1] = -1;
    int8x16_t v27 = v25;
    int8x16_t v28 = v25;
    do
    {
      uint64_t v29 = (int32x4_t *)(v1 + 36 + 4 * (v18 | v24));
      int8x16_t v27 = vandq_s8(v27, vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vceqq_s32(*v29, v26), (int16x8_t)vceqq_s32(v29[1], v26)), (int8x16_t)vuzp1q_s16((int16x8_t)vceqq_s32(v29[2], v26), (int16x8_t)vceqq_s32(v29[3], v26))));
      int8x16_t v28 = vandq_s8(v28, vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vceqq_s32(v29[4], v26), (int16x8_t)vceqq_s32(v29[5], v26)), (int8x16_t)vuzp1q_s16((int16x8_t)vceqq_s32(v29[6], v26), (int16x8_t)vceqq_s32(v29[7], v26))));
      v24 += 32;
    }
    while (v23 != v24);
    if (vmaxvq_u8((uint8x16_t)vornq_s8(vmvnq_s8(vceqq_s8(v27, v25)), vceqq_s8(v28, v25)))) {
      unsigned int v21 = 0;
    }
    else {
      unsigned int v21 = v11;
    }
    if (v22 == v23)
    {
      LOBYTE(v11) = v21;
      goto LABEL_57;
    }
    if ((v22 & 0x18) == 0)
    {
      v18 |= v23;
      goto LABEL_52;
    }
  }
  else
  {
    uint64_t v23 = 0;
    unsigned int v21 = v11;
  }
  v18 += v22 & 0x1FFFFFFF8;
  int8x8_t v30 = vdup_n_s8(v21);
  uint64_t v31 = v23 - (v22 & 0x1FFFFFFF8);
  int8x16_t v32 = (int32x4_t *)(v1 + 4 * (v23 + v17 + v16) + 36);
  v33.i64[0] = -1;
  v33.i64[1] = -1;
  do
  {
    int32x4_t v34 = *v32;
    int32x4_t v35 = v32[1];
    v32 += 2;
    int8x8_t v30 = vand_s8(v30, vmovn_s16(vuzp1q_s16((int16x8_t)vceqq_s32(v34, v33), (int16x8_t)vceqq_s32(v35, v33))));
    v31 += 8;
  }
  while (v31);
  if (*(void *)&v30 == vdup_n_s8(v11)) {
    LOBYTE(v21) = v11;
  }
  else {
    LOBYTE(v21) = 0;
  }
  LOBYTE(v11) = v21;
  if (v22 != (v22 & 0x1FFFFFFF8))
  {
LABEL_52:
    uint64_t v36 = (int *)(v1 + 4 * v18 + 36);
    int v37 = v8 + v18 - v19;
    LOBYTE(v11) = v21;
    do
    {
      int v38 = *v36++;
      if (v38 != -1) {
        LOBYTE(v11) = 0;
      }
    }
    while (!__CFADD__(v37++, 1));
  }
LABEL_57:
  if ((v11 & 1) == 0) {
    return 0;
  }
  BOOL v40 = Madusa::ImageParamsValidator::ColorComponentArrayMatchesColorModel(this);
  uint64_t result = 0;
  if (v5 <= 9 && v40)
  {
    unsigned int v41 = *(_DWORD *)(v1 + 32);
    if ((v41 & 0x8000FFFD) == 0 || (v41 & 0x8000FFFF) == 4)
    {
      if (v41 < 0x10000 || (v41 & 0xFFFD0000) == 0x10000)
      {
        uint64_t result = Madusa::ImageParamsValidator::PaletteParametersAreValid(this);
        if (result)
        {
          uint64_t result = (*(uint64_t (**)(Madusa::ImageParamsValidator *))(*(void *)this + 24))(this);
          if (result)
          {
            float v42 = (_DWORD *)*((void *)this + 1);
            return v42[5] != 9 || (v42[6] | v42[18]) == 0;
          }
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

uint64_t Madusa::ImageParamsValidator::Validate(Madusa::ImageParamsValidator *this)
{
  if (!Madusa::ImageParamsValidator::ParametersAreValid(this)) {
    return 4294967293;
  }
  int32x4_t v2 = (_DWORD *)*((void *)this + 1);
  if (v2[5] && v2[7] == 1 && (v2[8] & 0x8000FFFF) == 0) {
    return 4294967292;
  }
  int v3 = v2[3];
  if (v3 < 3) {
    return 4294967292;
  }
  unsigned int v4 = v2[4] - 12801;
  if (v3 > 0x3200 || v4 < 0xFFFFCE02) {
    return 4294967292;
  }
  uint64_t result = (*(uint64_t (**)(Madusa::ImageParamsValidator *))(*(void *)this + 16))(this);
  if (result) {
    return 4294967292;
  }
  return result;
}

void *Madusa::PayloadPipe::PayloadPipe(void *a1, uint64_t a2)
{
  *a1 = off_1000701E8;
  a1[1] = a2;
  Madusa::Demod::Demod((uint64_t)(a1 + 2), a2);
  Madusa::Decode::Decode(a1 + 10914, a2);
  return a1;
}

uint64_t Madusa::PayloadPipe::Execute@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v11 = a1 + 16;
  func = (uint64_t (*)(uint64_t, uint64_t, uint64_t))__find_func(0xDFDF5FBFE080E050, 828678250);
  uint64_t v13 = func(v11, a2, a3);
  float v14 = *(float *)(a2 + 4);
  unsigned int v15 = (uint64_t (*)(uint64_t, uint64_t, float))__find_func(0xF1F9FBF6020A0C0, -509321110);
  uint64_t v16 = v15(a1 + 87312, v13, v14);
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)*a4 + 24))(*a4, v13, v16, a1 + 87312);
  uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 8) + 24))(*(void *)(a1 + 8), v13, a5);
  v18.i8[4] = v5[3];
  v18.i32[0] = *v5 | 0xFFFFFFE0;
  *(int8x8_t *)v19.i8 = vand_s8(v18, (int8x8_t)0xFF000000FFLL);
  v19.i64[1] = v19.i64[0];
  float32x4_t v20 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v19, (int32x4_t)xmmword_100039510));
  v21.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_100039520, v20)).u32[0];
  v21.i32[1] = vmovn_s32(vcgtq_f32(v20, (float32x4_t)xmmword_100039520)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v21, 0xFuLL))) & ((v5[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    QuickCodec::mask = FunctionTable::ft ^ 0x157E9386;
    fegetenv(&v22);
    v22.__fpcr &= QuickCodec::mask + 70947740;
    return fesetenv(&v22);
  }
  return result;
}

uint64_t Madusa::PayloadPipe::_Execute@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X8>)
{
  unsigned int v6 = 0;
  int v7 = 0;
  if (QuickCodec::mask == -70947757) {
    int v8 = 7246291;
  }
  else {
    int v8 = 484886;
  }
  uint64_t v9 = 1;
  int v10 = 2321328;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v13 = v9;
        if (v10 <= 2321398) {
          break;
        }
        if (v10 == 2321399)
        {
          if ((*v6 & 0x1F) != 0
            || v6[2] > 0x3Fu
            || (uint64_t v9 = 1,
                int v10 = 484886,
                v6[3] != ((QuickCodec::mask ^ v7) / 0xC9364)))
          {
            int v10 = 484940;
            uint64_t v9 = v13;
          }
        }
        else if (v10 == 2806197)
        {
          unsigned int v6 = (unsigned char *)v5;
          int v10 = 2321345;
        }
        else
        {
          BOOL v14 = v10 == 7246291;
          int v10 = 2321399;
          if (v14) {
            int v7 = -240164221;
          }
        }
      }
      if (v10 <= 2321327) {
        break;
      }
      unsigned int v11 = (QuickCodec::mask != -70947757) | v9;
      if (v10 == 2321345) {
        int v12 = v8;
      }
      else {
        int v12 = v10;
      }
      if (v10 == 2321345) {
        LODWORD(v13) = v11;
      }
      BOOL v14 = v10 == 2321328;
      if (v10 == 2321328) {
        int v10 = 484886;
      }
      else {
        int v10 = v12;
      }
      if (v14) {
        uint64_t v9 = 0;
      }
      else {
        uint64_t v9 = v13;
      }
    }
    if (v10 != 484886) {
      break;
    }
    int v10 = 484940;
    if ((v9 & 1) == 0) {
      int v10 = 2806197;
    }
  }
  if (v9) {
    ++QuickCodec::mask;
  }
  return Madusa::PayloadPipe::Execute(a1, a2, a3, a4, a5);
}

void Madusa::PayloadPipe::_Execute_Alt(uint64_t a1@<X8>, int8x8_t a2@<D0>)
{
  a2.i32[0] = *v2 | 0xFFFFFFE0;
  a2.i8[4] = v2[3];
  *(int8x8_t *)v3.i8 = vand_s8(a2, (int8x8_t)0xFF000000FFLL);
  v3.i64[1] = v3.i64[0];
  float32x4_t v4 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v3, (int32x4_t)xmmword_100039530));
  v5.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_100039540, v4)).u32[0];
  v5.i32[1] = vmovn_s32(vcgtq_f32(v4, (float32x4_t)xmmword_100039540)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v5, 0xFuLL))) & ((v2[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    ++QuickCodec::mask;
  }
  Madusa::PayloadPipe::Execute_Alt(a1);
}

void Madusa::PayloadPipe::Execute_Alt(uint64_t a1@<X8>)
{
  *(_WORD *)a1 = 0;
  *(void *)(a1 + 4) = 0;
  *(void *)(a1 + 20) = 0;
  *(void *)(a1 + 12) = 0;
  *(_DWORD *)(a1 + 28) = -1;
}

void sub_100007910()
{
}

uint64_t Madusa::IteratorBoundsComputer::IteratorBoundsComputer(uint64_t a1, int a2, int a3, unsigned int a4, Madusa::PixelTraversalInformation *this)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
  *(void *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 24) = 1;
  if (a4 != -1)
  {
    BOOL IsValid = Madusa::PixelTraversalInformation::IsValid(this);
    uint64_t v12 = *(int *)this;
    uint64_t v11 = *((int *)this + 1);
    if (a4 <= 0x20 && ((1 << a4) & 0x100010100) != 0)
    {
      if (v11) {
        BOOL v13 = v12 == 0;
      }
      else {
        BOOL v13 = 1;
      }
      if (!v13 && IsValid)
      {
LABEL_11:
        uint64_t v16 = *((void *)this + 1);
        uint64_t v15 = *((void *)this + 2);
        uint64_t v42 = v16;
        uint64_t v43 = v15;
        uint64_t v17 = a2 - 1;
        BOOL v18 = 1;
        v41[0] = v17;
        v41[1] = 1;
        v40[0] = a3 - 1;
        v40[1] = 1;
        uint64_t v19 = 1 - a3;
        if (v40[0] >= 0) {
          uint64_t v19 = a3 - 1;
        }
        if (v12 >= 0) {
          uint64_t v20 = v12;
        }
        else {
          uint64_t v20 = -v12;
        }
        uint64_t v21 = v20 * v19;
        if (v40[0] >> 63 == (unint64_t)v12 >> 63) {
          uint64_t v22 = v21;
        }
        else {
          uint64_t v22 = -v21;
        }
        if (v11 >= 0) {
          uint64_t v23 = v11;
        }
        else {
          uint64_t v23 = -v11;
        }
        uint64_t v24 = 1 - a2;
        if (v17 >= 0) {
          uint64_t v24 = a2 - 1;
        }
        uint64_t v25 = v23 * v24;
        if ((unint64_t)v17 >> 63 == (unint64_t)v11 >> 63) {
          uint64_t v26 = v25;
        }
        else {
          uint64_t v26 = -v25;
        }
        if (!v11)
        {
          if ((v16 & 0xFF00000000) != 0) {
            int v27 = v16;
          }
          else {
            int v27 = 1;
          }
          if ((v15 & 0xFF00000000) != 0) {
            unsigned int v28 = v15;
          }
          else {
            unsigned int v28 = 0;
          }
          Madusa::SafeSubBytePixelIndexer::SafeSubBytePixelIndexer((uint64_t)v37, a4, v27, v28);
          Madusa::SafeSubBytePixelIndexer::operator+=(v37, (uint64_t)v41);
          if (v39) {
            uint64_t v26 = v38;
          }
          else {
            uint64_t v26 = 0;
          }
          BOOL v18 = Madusa::SafeSubBytePixelIndexer::IsValid((Madusa::SafeSubBytePixelIndexer *)v37)
             && Madusa::SubBytePixelDirectionAndOffset::IsValid((Madusa::SubBytePixelDirectionAndOffset *)&v42);
        }
        if (v12
          || (!BYTE4(v42) ? (int v30 = 1) : (int v30 = v42),
              BYTE4(v43) ? (unsigned int v31 = v43) : (unsigned int v31 = 0),
              (Madusa::SafeSubBytePixelIndexer::SafeSubBytePixelIndexer((uint64_t)v37, a4, v30, v31),
               Madusa::SafeSubBytePixelIndexer::operator+=(v37, (uint64_t)v40),
               v39)
            ? (uint64_t v22 = v38)
            : (uint64_t v22 = 0),
              Madusa::SafeSubBytePixelIndexer::IsValid((Madusa::SafeSubBytePixelIndexer *)v37)
           && Madusa::SubBytePixelDirectionAndOffset::IsValid((Madusa::SubBytePixelDirectionAndOffset *)&v42)))
        {
          int v29 = 1;
          if (!v18) {
            goto LABEL_65;
          }
        }
        else
        {
          int v29 = 0;
          if (!v18) {
            goto LABEL_65;
          }
        }
        if (v29)
        {
          uint64_t v32 = v22 + v26;
          if (v26 < 0)
          {
            if ((v22 & 0x8000000000000000) == 0 || v32 <= v26)
            {
LABEL_66:
              if (v26 >= v22) {
                uint64_t v34 = v22;
              }
              else {
                uint64_t v34 = v26;
              }
              if (v26 <= v22) {
                uint64_t v35 = v22;
              }
              else {
                uint64_t v35 = v26;
              }
              if (v34 >= v32) {
                uint64_t v34 = v22 + v26;
              }
              *(void *)a1 = v34 & (v34 >> 63);
              char v33 = 1;
              *(unsigned char *)(a1 + 8) = 1;
              if (v35 > v32) {
                uint64_t v32 = v35;
              }
              *(void *)(a1 + 16) = (v32 & ~(v32 >> 63)) + 1;
              goto LABEL_77;
            }
          }
          else if (v22 < 0 || v32 >= v26)
          {
            goto LABEL_66;
          }
        }
LABEL_65:
        char v33 = 0;
        *(void *)a1 = 0;
        *(void *)(a1 + 16) = 0;
        *(unsigned char *)(a1 + 8) = 0;
LABEL_77:
        *(unsigned char *)(a1 + 24) = v33;
        return a1;
      }
    }
    else if (IsValid)
    {
      goto LABEL_11;
    }
  }
  *(unsigned char *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 24) = 0;
  return a1;
}

BOOL Madusa::IteratorBoundsComputer::IsValid(Madusa::IteratorBoundsComputer *this)
{
  return *((unsigned char *)this + 8) && *((unsigned char *)this + 24) != 0;
}

uint64_t Madusa::IteratorBoundsComputer::SetBoundsForGivenBaseAddress(Madusa::IteratorBoundsComputer *this, uint64_t a2, unsigned __int8 **a3, unsigned __int8 **a4)
{
  *a3 = (unsigned __int8 *)a2;
  *a4 = (unsigned __int8 *)a2;
  if (*((unsigned char *)this + 8) && *((unsigned char *)this + 24))
  {
    float32x4_t v4 = (unsigned __int8 *)(*(void *)this + a2);
    uint64_t v5 = *((void *)this + 2);
    unsigned int v6 = (unsigned __int8 *)(v5 + a2);
    if (a2 < 0)
    {
      BOOL v8 = *(uint64_t *)this >= 0 || (uint64_t)v4 <= a2;
      if (!v8) {
        float32x4_t v4 = 0;
      }
      if (v5 < 0 && (uint64_t)v6 > a2) {
        return 0;
      }
    }
    else
    {
      BOOL v8 = *(uint64_t *)this < 0 || (uint64_t)v4 >= a2;
      if (!v8) {
        float32x4_t v4 = 0;
      }
      if ((v5 & 0x8000000000000000) == 0 && (uint64_t)v6 < a2) {
        return 0;
      }
    }
    if (v8)
    {
      *a3 = v4;
      *a4 = v6;
      return 1;
    }
  }
  return 0;
}

BOOL Madusa::IteratorBoundsComputer::ValidateForImageProperties(Madusa::IteratorBoundsComputer *this, const Madusa::ImageProperties *a2)
{
  Madusa::SubBytePixelDirectionAndOffset::SubBytePixelDirectionAndOffset((uint64_t)&v53);
  int v3 = *(_DWORD *)Madusa::ImageProperties::GetBitsPerPixelPerColor(this);
  BitsPerPixelPerColor = (unsigned int *)Madusa::ImageProperties::GetBitsPerPixelPerColor(this);
  unsigned int v5 = Madusa::ImageProperties::ConvertBitsPerPixel((Madusa::ImageProperties *)*BitsPerPixelPerColor);
  Madusa::SubBytePixelDirectionAndOffset::Reset((uint64_t)&v53, v5, 1, 0);
  if (v3 <= 7) {
    Madusa::SubBytePixelDirectionAndOffset::Reset((uint64_t)&v53, v5, 1, 8 - v3);
  }
  int v6 = *(_DWORD *)Madusa::ImageProperties::GetXStride(this);
  YStride = (int *)Madusa::ImageProperties::GetYStride(this);
  Madusa::PixelTraversalInformation::PixelTraversalInformation((uint64_t)v52, v6, *YStride, &v53);
  Madusa::ImageProperties::GetBounds(this);
  Madusa::IteratorBoundsComputer::IteratorBoundsComputer((uint64_t)&v48, v9, v8, v5, (Madusa::PixelTraversalInformation *)v52);
  Madusa::ImageProperties::GetPixelData(this, (uint64_t)&v43);
  if (v51) {
    BOOL v10 = v49 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10) {
    return 0;
  }
  BOOL v12 = v43 != 0;
  if ((v50 & 0x8000000000000000) == 0)
  {
    if (v43)
    {
      uint64_t v13 = v48 + v43;
      if (v43 < 0)
      {
        if (v48 < 0 && v13 > v43) {
          return 0;
        }
      }
      else
      {
        BOOL result = 0;
        BOOL v15 = v48 < 0 || v13 >= v43;
        if (v50 + v43 < v43 || !v15) {
          return result;
        }
      }
    }
    if (v44)
    {
      uint64_t v17 = v48 + v44;
      if (v44 < 0)
      {
        BOOL v12 = 1;
        if (v48 < 0 && v17 > v44) {
          return 0;
        }
      }
      else
      {
        BOOL result = 0;
        BOOL v19 = v48 < 0 || v17 >= v44;
        if (v50 + v44 < v44 || !v19) {
          return result;
        }
        BOOL v12 = 1;
      }
    }
    if (v45)
    {
      uint64_t v20 = v48 + v45;
      if (v45 < 0)
      {
        BOOL v12 = 1;
        if (v48 < 0 && v20 > v45) {
          return 0;
        }
      }
      else
      {
        BOOL result = 0;
        BOOL v22 = v48 < 0 || v20 >= v45;
        if (v50 + v45 < v45 || !v22) {
          return result;
        }
        BOOL v12 = 1;
      }
    }
    if (v46)
    {
      uint64_t v26 = v48 + v46;
      if (v46 < 0)
      {
        BOOL v12 = 1;
        if (v48 < 0 && v26 > v46) {
          return 0;
        }
      }
      else
      {
        BOOL result = 0;
        BOOL v28 = v48 < 0 || v26 >= v46;
        if (v50 + v46 < v46 || !v28) {
          return result;
        }
        BOOL v12 = 1;
      }
    }
    if (v47)
    {
      uint64_t v32 = v48 + v47;
      if ((v47 & 0x8000000000000000) == 0)
      {
        BOOL result = 0;
        BOOL v34 = v48 < 0 || v32 >= v47;
        if (v50 + v47 < v47 || !v34) {
          return result;
        }
        return 1;
      }
      BOOL v12 = 1;
      if ((v48 & 0x8000000000000000) == 0 || v32 <= v47) {
        return v12;
      }
      return 0;
    }
    return v12;
  }
  if (v43)
  {
    uint64_t v16 = v48 + v43;
    if (v43 < 0)
    {
      BOOL result = 0;
      BOOL v24 = v48 >= 0 || v16 <= v43;
      if (v50 + v43 > v43 || !v24) {
        return result;
      }
    }
    else if ((v48 & 0x8000000000000000) == 0 && v16 < v43)
    {
      return 0;
    }
  }
  if (v44)
  {
    uint64_t v25 = v48 + v44;
    if (v44 < 0)
    {
      BOOL result = 0;
      BOOL v30 = v48 >= 0 || v25 <= v44;
      if (v50 + v44 > v44 || !v30) {
        return result;
      }
      BOOL v12 = 1;
    }
    else
    {
      BOOL v12 = 1;
      if ((v48 & 0x8000000000000000) == 0 && v25 < v44) {
        return 0;
      }
    }
  }
  if (v45)
  {
    uint64_t v31 = v48 + v45;
    if (v45 < 0)
    {
      BOOL result = 0;
      BOOL v36 = v48 >= 0 || v31 <= v45;
      if (v50 + v45 > v45 || !v36) {
        return result;
      }
      BOOL v12 = 1;
    }
    else
    {
      BOOL v12 = 1;
      if ((v48 & 0x8000000000000000) == 0 && v31 < v45) {
        return 0;
      }
    }
  }
  if (v46)
  {
    uint64_t v37 = v48 + v46;
    if (v46 < 0)
    {
      BOOL result = 0;
      BOOL v39 = v48 >= 0 || v37 <= v46;
      if (v50 + v46 > v46 || !v39) {
        return result;
      }
      BOOL v12 = 1;
    }
    else
    {
      BOOL v12 = 1;
      if ((v48 & 0x8000000000000000) == 0 && v37 < v46) {
        return 0;
      }
    }
  }
  if (!v47) {
    return v12;
  }
  uint64_t v40 = v48 + v47;
  if ((v47 & 0x8000000000000000) == 0)
  {
    BOOL v12 = 1;
    if (v48 < 0 || v40 >= v47) {
      return v12;
    }
    return 0;
  }
  BOOL result = 0;
  BOOL v42 = v48 >= 0 || v40 <= v47;
  if (v50 + v47 <= v47 && v42) {
    return 1;
  }
  return result;
}

uint64_t Madusa::ZnTimer::Reset(uint64_t this)
{
  *(void *)(this + 8) = 0;
  *(_DWORD *)(this + 16) = 0;
  return this;
}

uint64_t Madusa::ZnTimer::ZnTimer(uint64_t this, int a2)
{
  *(void *)(this + 8) = 0;
  *(void *)(this + 16) = 0;
  *(void *)(this + 24) = 0x6402255100;
  if (a2
    && (uint32x4_t v2 = (uint32x4_t)vdupq_n_s32(a2 ^ 0x9A573CB5),
        int8x16_t v3 = (int8x16_t)vshlq_u32(v2, (uint32x4_t)xmmword_100039560),
        v3.i32[3] = vshlq_u32(v2, (uint32x4_t)xmmword_100039570).i32[3],
        vaddvq_s32((int32x4_t)vandq_s8(v3, (int8x16_t)xmmword_100039580)) + ((a2 ^ 0x9A573CB5) >> 28) - 36000001 >= 0xFDDAAF63))
  {
    *(unsigned char *)this = 1;
    *(_DWORD *)(this + 20) = a2;
  }
  else
  {
    *(unsigned char *)this = 0;
  }
  return this;
}

unsigned char *Madusa::ZnTimer::Start(unsigned char *this)
{
  if (*this)
  {
    uint64_t v1 = this;
    this = (unsigned char *)clock();
    *((void *)v1 + 1) = this;
  }
  return this;
}

unsigned char *Madusa::ZnTimer::Stop(unsigned char *this)
{
  if (*this)
  {
    uint64_t v1 = this;
    this = (unsigned char *)clock();
    *((_DWORD *)v1 + 4) += (unint64_t)&this[-*((void *)v1 + 1)] / 0x3E8;
  }
  return this;
}

BOOL Madusa::ZnTimer::Expired(Madusa::ZnTimer *this)
{
  return *(unsigned char *)this
      && *((_DWORD *)this + 4) >= (((*((_DWORD *)this + 5) ^ 0x9A573CB5) >> 16) & 0xFF0 | ((*((_DWORD *)this + 5) ^ 0x9A573CB5) >> 28) & 0xFFF | ((*((unsigned char *)this + 20) ^ 0xB5) << 12) & 0xFFFFF | (((*((_DWORD *)this + 5) ^ 0x9A573CB5) >> 12) << 20) & 0xFFFFFFF | (((unsigned __int16)(*((_WORD *)this + 10) ^ 0x3CB5) >> 8) << 28));
}

unint64_t _find_func_wrapper(uint64_t a1)
{
  uint64_t v2 = a1;
  return sub_10000824C((uint64_t)&FunctionTable::ft, &v2);
}

unint64_t sub_10000824C(uint64_t a1, uint64_t *a2)
{
  int8x16_t v2 = (int8x16_t)vdupq_lane_s64(*a2, 0);
  int8x16_t v3 = vorrq_s8(vorrq_s8(vorrq_s8(vorrq_s8(vorrq_s8(vbicq_s8((int8x16_t)xmmword_1000435B0, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043530))), vbicq_s8((int8x16_t)xmmword_100043460, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1000433E0)))), vorrq_s8(vbicq_s8((int8x16_t)xmmword_1000433B0, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043330))), vbicq_s8((int8x16_t)xmmword_1000432B0, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043230))))), vorrq_s8(vorrq_s8(
                 vbicq_s8((int8x16_t)xmmword_1000435C0, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043540))), vbicq_s8((int8x16_t)xmmword_100043450, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1000433D0)))), vorrq_s8(vbicq_s8((int8x16_t)xmmword_1000433C0, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043340))), vbicq_s8((int8x16_t)xmmword_1000432C0, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043240)))))), vorrq_s8(vorrq_s8(vorrq_s8(vbicq_s8((int8x16_t)xmmword_100043590, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043510))), vbicq_s8(
                   (int8x16_t)xmmword_100043480,
                   (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043400)))),
               vorrq_s8(vbicq_s8((int8x16_t)xmmword_100043390, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043310))), vbicq_s8((int8x16_t)xmmword_100043290, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043210))))), vorrq_s8(vorrq_s8(vbicq_s8((int8x16_t)xmmword_1000435A0, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043520))), vbicq_s8((int8x16_t)xmmword_100043470, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1000433F0)))), vorrq_s8(vbicq_s8((int8x16_t)xmmword_1000433A0, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043320))), vbicq_s8(
                   (int8x16_t)xmmword_1000432A0,
                   (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043220))))))),
         vorrq_s8(vorrq_s8(vorrq_s8(vorrq_s8(vbicq_s8((int8x16_t)xmmword_100043570, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1000434F0))), vbicq_s8((int8x16_t)xmmword_1000434A0, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043420)))), vorrq_s8(vbicq_s8((int8x16_t)xmmword_100043370, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1000432F0))), vbicq_s8((int8x16_t)xmmword_100043270, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1000431F0))))), vorrq_s8(vorrq_s8(vbicq_s8(
                   (int8x16_t)xmmword_100043580,
                   (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043500))),
                 vbicq_s8((int8x16_t)xmmword_100043490, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043410)))), vorrq_s8(vbicq_s8((int8x16_t)xmmword_100043380, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043300))), vbicq_s8((int8x16_t)xmmword_100043280, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043200)))))), vorrq_s8(vorrq_s8(vorrq_s8(vbicq_s8((int8x16_t)xmmword_100043550, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1000434D0))), vbicq_s8((int8x16_t)xmmword_1000434C0, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043440)))), vorrq_s8(
                 vbicq_s8((int8x16_t)xmmword_100043350, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1000432D0))), vbicq_s8((int8x16_t)xmmword_100043250, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1000431D0))))), vorrq_s8(vorrq_s8(vbicq_s8((int8x16_t)xmmword_100043560, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1000434E0))), vbicq_s8((int8x16_t)xmmword_1000434B0, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043430)))), vorrq_s8(vbicq_s8((int8x16_t)xmmword_100043360, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1000432E0))), vbicq_s8((int8x16_t)xmmword_100043260,
                   (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1000431E0))))))));
  uint64_t v8 = 0;
  uint64_t v8 = *(void *)(a1
                 + 8
                 * ((*(void *)&vorr_s8(*(int8x8_t *)v3.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v3, v3, 8uLL)) ^ 0xAAAAAAAAAAAAAAAALL)
                  % 0x81)
                 + 8);
  float32x4_t v4 = (const double *)&v8;
  int8x16_t v5 = (int8x16_t)vld1q_dup_f64(v4);
  int8x16_t v6 = vorrq_s8(vorrq_s8(vorrq_s8(vorrq_s8(vorrq_s8(vbicq_s8((int8x16_t)xmmword_1000435B0, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_100043530))), vbicq_s8((int8x16_t)xmmword_100043460, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_1000433E0)))), vorrq_s8(vbicq_s8((int8x16_t)xmmword_1000433B0, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_100043330))), vbicq_s8((int8x16_t)xmmword_1000432B0, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_100043230))))), vorrq_s8(vorrq_s8(
                 vbicq_s8((int8x16_t)xmmword_1000435C0, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_100043540))), vbicq_s8((int8x16_t)xmmword_100043450, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_1000433D0)))), vorrq_s8(vbicq_s8((int8x16_t)xmmword_1000433C0, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_100043340))), vbicq_s8((int8x16_t)xmmword_1000432C0, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_100043240)))))), vorrq_s8(vorrq_s8(vorrq_s8(vbicq_s8((int8x16_t)xmmword_100043590, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_100043510))), vbicq_s8(
                   (int8x16_t)xmmword_100043480,
                   (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_100043400)))),
               vorrq_s8(vbicq_s8((int8x16_t)xmmword_100043390, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_100043310))), vbicq_s8((int8x16_t)xmmword_100043290, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_100043210))))), vorrq_s8(vorrq_s8(vbicq_s8((int8x16_t)xmmword_1000435A0, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_100043520))), vbicq_s8((int8x16_t)xmmword_100043470, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_1000433F0)))), vorrq_s8(vbicq_s8((int8x16_t)xmmword_1000433A0, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_100043320))), vbicq_s8(
                   (int8x16_t)xmmword_1000432A0,
                   (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_100043220))))))),
         vorrq_s8(vorrq_s8(vorrq_s8(vorrq_s8(vbicq_s8((int8x16_t)xmmword_100043570, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_1000434F0))), vbicq_s8((int8x16_t)xmmword_1000434A0, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_100043420)))), vorrq_s8(vbicq_s8((int8x16_t)xmmword_100043370, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_1000432F0))), vbicq_s8((int8x16_t)xmmword_100043270, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_1000431F0))))), vorrq_s8(vorrq_s8(vbicq_s8(
                   (int8x16_t)xmmword_100043580,
                   (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_100043500))),
                 vbicq_s8((int8x16_t)xmmword_100043490, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_100043410)))), vorrq_s8(vbicq_s8((int8x16_t)xmmword_100043380, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_100043300))), vbicq_s8((int8x16_t)xmmword_100043280, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_100043200)))))), vorrq_s8(vorrq_s8(vorrq_s8(vbicq_s8((int8x16_t)xmmword_100043550, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_1000434D0))), vbicq_s8((int8x16_t)xmmword_1000434C0, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_100043440)))), vorrq_s8(
                 vbicq_s8((int8x16_t)xmmword_100043350, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_1000432D0))), vbicq_s8((int8x16_t)xmmword_100043250, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_1000431D0))))), vorrq_s8(vorrq_s8(vbicq_s8((int8x16_t)xmmword_100043560, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_1000434E0))), vbicq_s8((int8x16_t)xmmword_1000434B0, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_100043430)))), vorrq_s8(vbicq_s8((int8x16_t)xmmword_100043360, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_1000432E0))), vbicq_s8((int8x16_t)xmmword_100043260,
                   (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_1000431E0))))))));
  return *(void *)&vorr_s8(*(int8x8_t *)v6.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL)) ^ 0xAAAAAAAAAAAAAAAALL;
}

uint64_t __find_func(uint64_t a1, int a2)
{
  int8x16_t v2 = (uint64_t (*)(uint64_t))(FunctionTable::ff_wrapper - (HIDWORD(a1) ^ a2 ^ 0xCCCCCCCC));
  if (!a2) {
    a1 += 16;
  }
  return v2(a1);
}

float RoundRobinBPA::RR_Func1(uint64_t this, uint64_t a2)
{
  uint64_t v2 = a2;
  if (a2 == 104)
  {
    uint64_t vars0 = 0;
  }
  else
  {
    float v4 = 0.0;
    if (a2 < 0x65) {
      goto LABEL_7;
    }
  }
  float v4 = 0.0;
  do
  {
    int8x16_t v5 = (float (*)(uint64_t, uint64_t))((uint64_t (*)(uint64_t))(FunctionTable::ff_wrapper - 578237209))(0x4F5F3FFFA060A0A0);
    float v4 = v5(0x10000, v2) + v4;
    uint64_t v2 = (v2 - 1);
  }
  while (v2 > 0x64);
  uint64_t v2 = 100;
LABEL_7:
  switch(this)
  {
    case 0:
      this = 1;
      unint64_t v6 = 0xDFBF3FDF406000E0;
      goto LABEL_13;
    case 0x100:
      unint64_t v6 = 0x7F9FBFBF408020A0;
      goto LABEL_13;
    case 0x10:
      unint64_t v6 = 0xFF5FFF1FA06040C0;
LABEL_13:
      int v7 = (float (*)(uint64_t, uint64_t))((uint64_t (*)(unint64_t))(FunctionTable::ff_wrapper
                                                                                             - 578237209))(v6);
      return v4 - v7(this, v2);
  }
  return v4;
}

float RoundRobinBPA::RR_Func2(RoundRobinBPA *this, uint64_t a2)
{
  if (this == 1)
  {
    unint64_t v6 = (void (*)(uint64_t, uint64_t))((uint64_t (*)(unint64_t))(FunctionTable::ff_wrapper
                                                                                          - 578237209))(0xDFBFDFDF20800010);
    v6(1, a2);
    float v5 = 1.4142;
  }
  else if (this == 256)
  {
    int v7 = (void (*)(uint64_t, uint64_t))((uint64_t (*)(unint64_t))(FunctionTable::ff_wrapper
                                                                                          - 578237209))(0xFF3F1F5F00E0C0F0);
    v7(256, a2);
    float v5 = 1.7321;
  }
  else
  {
    float result = 0.0;
    if (this != 0x10000) {
      return result;
    }
    float v4 = (float)(a2 % 5);
    float v5 = 3.1416;
  }
  return v4 * v5;
}

float RoundRobinBPA::RR_Func3(RoundRobinBPA *this, uint64_t a2)
{
  uint64_t v4 = 0;
  float v5 = 0.0;
  do
  {
    unint64_t v6 = (float (*)(uint64_t, uint64_t))((uint64_t (*)(uint64_t))(FunctionTable::ff_wrapper - 578237209))(0x4F7FBFBF606020A0);
    float v5 = v6(0x10000, v4) + v5;
    uint64_t v4 = (v4 + 1);
  }
  while (v4 != 64);
  int v7 = (float (*)(RoundRobinBPA *, uint64_t))((uint64_t (*)(unint64_t))(FunctionTable::ff_wrapper
                                                                                                 - 578237209))(0xCF7FBF1F60200040);
  return v5 - v7(this, a2);
}

void RoundRobinBPA::RR_Func4(RoundRobinBPA *this)
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t))((uint64_t (*)(unint64_t))(FunctionTable::ff_wrapper
                                                                                        - 578237209))(0x9F5F5F9F406020C0);
  v1(0x10000, 0x10000);
  uint64_t v2 = (void (*)(uint64_t, uint64_t))((uint64_t (*)(uint64_t))(FunctionTable::ff_wrapper - 578237209))(0xF9F5F9FE000A060);
  v2(0x10000, 0x10000);
  int8x16_t v3 = (float (*)(void, uint64_t))((uint64_t (*)(unint64_t))(FunctionTable::ff_wrapper
                                                                                        - 578237209))(0xBFFF7F7F20A0E0E0);
  v3(0, 0x10000);
}

void sub_100008E34(uint64_t a1, float *a2, float *a3, int a4)
{
  float v4 = 1.0;
  if (a4 >= 1)
  {
    uint64_t v9 = 0;
    int v10 = 0;
    uint64_t v11 = a4;
    do
    {
      float v12 = *(float *)(a1 + 4 * v9) * 3.1416;
      uint64_t v13 = v11;
      BOOL v14 = a2;
      do
      {
        if (v12 == *v14)
        {
          float v4 = cosf(*v14) + v4;
          ++v10;
        }
        ++v14;
        --v13;
      }
      while (v13);
      ++v9;
    }
    while (v9 != v11);
    if (v10 >= 1)
    {
      if (v10 <= a4)
      {
        uint64_t v15 = v10;
        do
        {
          *a3++ = v4;
          float v4 = v4 * (float)(1.0 / (float)v10);
          --v15;
        }
        while (v15);
      }
      else
      {
        *a3 = v4;
      }
    }
  }
}

void *sub_100008F88()
{
  unint64_t v0 = 0;
  qword_100074F00 = 0;
  float result = &unk_100043000;
  do
  {
    int8x16_t v2 = (int8x16_t)vdupq_n_s64((unint64_t)off_1000701F8[v0 / 2] ^ 0xAAAAAAAAAAAAAAAALL);
    int8x16_t v3 = vorrq_s8(vorrq_s8(vorrq_s8(vorrq_s8(vorrq_s8(vbicq_s8((int8x16_t)xmmword_1000435B0, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1000437B0))), vbicq_s8((int8x16_t)xmmword_100043460, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1000436E0)))), vorrq_s8(vbicq_s8((int8x16_t)xmmword_1000433B0, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1000436B0))), vbicq_s8((int8x16_t)xmmword_1000432B0, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043630))))), vorrq_s8(vorrq_s8(
                   vbicq_s8((int8x16_t)xmmword_1000435C0, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1000437C0))), vbicq_s8((int8x16_t)xmmword_100043450, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1000436D0)))), vorrq_s8(vbicq_s8((int8x16_t)xmmword_1000433C0, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1000436C0))), vbicq_s8((int8x16_t)xmmword_1000432C0, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043640)))))), vorrq_s8(vorrq_s8(vorrq_s8(vbicq_s8((int8x16_t)xmmword_100043590, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043790))), vbicq_s8(
                     (int8x16_t)xmmword_100043480,
                     (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043700)))),
                 vorrq_s8(vbicq_s8((int8x16_t)xmmword_100043390, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043690))), vbicq_s8((int8x16_t)xmmword_100043290, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043610))))), vorrq_s8(vorrq_s8(vbicq_s8((int8x16_t)xmmword_1000435A0, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1000437A0))), vbicq_s8((int8x16_t)xmmword_100043470, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1000436F0)))), vorrq_s8(vbicq_s8((int8x16_t)xmmword_1000433A0, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1000436A0))), vbicq_s8(
                     (int8x16_t)xmmword_1000432A0,
                     (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043620))))))),
           vorrq_s8(vorrq_s8(vorrq_s8(vorrq_s8(vbicq_s8((int8x16_t)xmmword_100043570, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043770))), vbicq_s8((int8x16_t)xmmword_1000434A0, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043720)))), vorrq_s8(vbicq_s8((int8x16_t)xmmword_100043370, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043670))), vbicq_s8((int8x16_t)xmmword_100043270, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1000435F0))))), vorrq_s8(vorrq_s8(vbicq_s8(
                     (int8x16_t)xmmword_100043580,
                     (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043780))),
                   vbicq_s8((int8x16_t)xmmword_100043490, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043710)))), vorrq_s8(vbicq_s8((int8x16_t)xmmword_100043380, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043680))), vbicq_s8((int8x16_t)xmmword_100043280, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043600)))))), vorrq_s8(vorrq_s8(vorrq_s8(vbicq_s8((int8x16_t)xmmword_100043550, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043750))), vbicq_s8((int8x16_t)xmmword_1000434C0, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043740)))), vorrq_s8(
                   vbicq_s8((int8x16_t)xmmword_100043350, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043650))), vbicq_s8((int8x16_t)xmmword_100043250, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1000435D0))))), vorrq_s8(vorrq_s8(vbicq_s8((int8x16_t)xmmword_100043560, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043760))), vbicq_s8((int8x16_t)xmmword_1000434B0, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043730)))), vorrq_s8(vbicq_s8((int8x16_t)xmmword_100043360, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_100043660))), vbicq_s8((int8x16_t)xmmword_100043260,
                     (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v2, (int8x16_t)xmmword_1000435E0))))))));
    *(int8x8_t *)&FunctionTable::ft[v0 + 2] = vorr_s8(*(int8x8_t *)v3.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v3, v3, 8uLL));
    v0 += 2;
  }
  while (v0 != 258);
  FunctionTable::ft[0] = -289669163;
  FunctionTable::ff_wrapper = 0x12277B4ADuLL;
  return result;
}

uint64_t Madusa::TransformPipe::TransformPipe(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + 395672;
  *(void *)a1 = off_100070610;
  *(void *)(a1 + 8) = a2;
  *(void *)(a1 + 16) = a1 + 24;
  *(void *)(a1 + 24) = off_100070630;
  bzero((void *)(a1 + 32), 0x10000uLL);
  Madusa::FrequencyTransform::FrequencyTransform((void *)(a1 + 65568), a2);
  Madusa::AffineTransform::AffineTransform(a1 + 234616, a2);
  bzero((void *)(a1 + 388224), 0x1D18uLL);
  *(_DWORD *)uint64_t v4 = 1;
  *(_WORD *)(v4 + 4) = 0;
  *(_OWORD *)(a1 + 395680) = 0u;
  *(_OWORD *)(a1 + 395696) = 0u;
  *(void *)(a1 + 395709) = 0;
  return a1;
}

uint64_t Madusa::TransformPipe::Execute(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  func = (uint64_t (*)(uint64_t, uint64_t))__find_func(0xAF1F1F7FC0E0E060, 1101324458);
  uint64_t v8 = func(a1, a2);
  uint64_t v9 = (float (*)(uint64_t, uint64_t))__find_func(0xF9FBF9FE0400040, -517717942);
  float v10 = v9(a1, v8);
  if (v10 <= 6000.0)
  {
    *a3 = 0;
    uint64_t v25 = *(void *)(a1 + 8);
    uint64_t v26 = a1 + 388224;
    uint64_t v14 = a1 + 395648;
    uint64_t v27 = 1;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, float))(*(void *)v25 + 16))(v25, v26, v14, 1, v10);
    BOOL v28 = 0;
    int v29 = 0;
    if (QuickCodec::mask == -70947757) {
      int v30 = 11190755;
    }
    else {
      int v30 = 4921834;
    }
    int v31 = 918886;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          uint64_t v32 = v27;
          if (v31 > 4921833) {
            break;
          }
          if (v31 == 918886)
          {
            uint64_t v27 = 0;
            int v31 = 4921834;
          }
          else if (v31 == 918903)
          {
            uint64_t v27 = (QuickCodec::mask != -70947757) | v27;
            int v31 = v30;
          }
          else if ((*v28 & 0x1F) != 0 {
                 || v28[2] > 0x3Fu
          }
                 || (uint64_t v27 = 1,
                     int v31 = 4921834,
                     v28[3] != ((QuickCodec::mask ^ v29) / 0x4EF2E3)))
          {
            int v31 = 4921888;
            uint64_t v27 = v32;
          }
        }
        if (v31 <= 5840702) {
          break;
        }
        if (v31 == 5840703)
        {
          BOOL v28 = v3;
          int v31 = 918903;
        }
        else
        {
          BOOL v22 = v31 == 11190755;
          int v31 = 918957;
          if (v22) {
            int v29 = -1163636817;
          }
        }
      }
      if (v31 != 4921834) {
        break;
      }
      int v31 = 4921888;
      if ((v27 & 1) == 0) {
        int v31 = 5840703;
      }
    }
    if (v27)
    {
      unint64_t v33 = 0;
      int v34 = FunctionTable::ft[0] ^ 0x157E9386;
      QuickCodec::mask = FunctionTable::ft[0] ^ 0x157E9386;
      int v35 = -1;
      do
      {
        qword_100074AF8[v35
                      + 1
                      + ((FunctionTable::swapTable[v33] ^ v34) / 0x9D28AF)] = qword_100074AF8[v35 + ((FunctionTable::swapTable[v33 + 1] ^ v34) / 0x9D28AF)];
        v35 -= 2;
        BOOL v36 = v33 >= 0x20;
        v33 += 2;
      }
      while (!v36);
    }
  }
  else
  {
    uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))__find_func(0x1F9F7F7F4000E080, -249266006);
    uint64_t v12 = v11(a1 + 65568, v8);
    uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, _DWORD *))__find_func(0x5F1FDF1F60E02050, -1314643766);
    uint64_t v14 = v13(a1 + 234616, v12, a3);
    uint64_t v15 = (uint64_t (*)(uint64_t))__find_func(0x8FFF3FDFA0208060, 1631895562);
    uint64_t v16 = v15(a1 + 234616);
    (*(void (**)(void, uint64_t, uint64_t, void, float))(**(void **)(a1 + 8) + 16))(*(void *)(a1 + 8), v16, v14, *a3, v10);
    uint64_t v17 = 0;
    int v18 = 0;
    if (QuickCodec::mask == -70947757) {
      int v19 = 3243527;
    }
    else {
      int v19 = 3131413;
    }
    uint64_t v20 = 1;
    int v21 = 56654;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          uint64_t v23 = v20;
          if (v21 > 3131412) {
            break;
          }
          if (v21 == 56654)
          {
            uint64_t v20 = 0;
            int v21 = 3131413;
          }
          else if (v21 == 56671)
          {
            uint64_t v20 = (QuickCodec::mask != -70947757) | v20;
            int v21 = v19;
          }
          else if ((*v17 & 0x1F) != 0 {
                 || v17[2] > 0x3Fu
          }
                 || (uint64_t v20 = 1,
                     int v21 = 3131413,
                     v17[3] != ((QuickCodec::mask ^ v18) / 0x30E625)))
          {
            int v21 = 3131467;
            uint64_t v20 = v23;
          }
        }
        if (v21 <= 3188049) {
          break;
        }
        if (v21 == 3188050)
        {
          uint64_t v17 = v3;
          int v21 = 56671;
        }
        else
        {
          BOOL v22 = v21 == 3243527;
          int v21 = 56725;
          if (v22) {
            int v18 = -742655241;
          }
        }
      }
      if (v21 != 3131413) {
        break;
      }
      if (v20) {
        int v21 = 3131467;
      }
      else {
        int v21 = 3188050;
      }
    }
    if (v20)
    {
      QuickCodec::mask = FunctionTable::ft[0] ^ 0x157E9386;
      BOOL v24 = (void (*)(void, uint64_t))__find_func(0xBFBF1F1FC0C00040, 1359274186);
      v24(0, 104);
    }
  }
  return v14;
}

uint64_t Madusa::TransformPipe::_Execute(uint64_t a1, uint64_t a2, _DWORD *a3, int8x8_t a4)
{
  a4.i32[0] = *v4 | 0xFFFFFFE0;
  a4.i8[4] = v4[3];
  *(int8x8_t *)v5.i8 = vand_s8(a4, (int8x8_t)0xFF000000FFLL);
  v5.i64[1] = v5.i64[0];
  float32x4_t v6 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v5, (int32x4_t)xmmword_100043860));
  v7.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_100043870, v6)).u32[0];
  v7.i32[1] = vmovn_s32(vcgtq_f32(v6, (float32x4_t)xmmword_100043870)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v7, 0xFuLL))) & ((v4[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    ++QuickCodec::mask;
  }
  return Madusa::TransformPipe::Execute(a1, a2, a3);
}

uint64_t Madusa::TransformPipe::_Execute_Alt(uint64_t a1, uint64_t a2, _DWORD *a3, int8x8_t a4)
{
  a4.i32[0] = *v4 | 0xFFFFFFE0;
  a4.i8[4] = v4[3];
  *(int8x8_t *)v5.i8 = vand_s8(a4, (int8x8_t)0xFF000000FFLL);
  v5.i64[1] = v5.i64[0];
  float32x4_t v6 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v5, (int32x4_t)xmmword_100043880));
  v7.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_100043890, v6)).u32[0];
  v7.i32[1] = vmovn_s32(vcgtq_f32(v6, (float32x4_t)xmmword_100043890)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v7, 0xFuLL))) & ((v4[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    ++QuickCodec::mask;
  }
  return Madusa::TransformPipe::Execute_Alt(a1, a2, a3);
}

uint64_t Madusa::TransformPipe::Execute_Alt(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 0;
  return a1 + 395648;
}

uint64_t Madusa::TransformPipe::OctAxisExecute(uint64_t a1, uint64_t a2)
{
  Madusa::ProfileTimer::ProfileTimer(v11, (uint64_t)&unk_10006F6CB, *(void *)(a1 + 8));
  func = (void (*)(uint64_t, uint64_t, uint64_t))__find_func(0xBF3FBF7FC040E060, 1367621802);
  func(a1, a2, a1 + 16);
  v6.i8[4] = v2[3];
  v6.i32[0] = *v2 | 0xFFFFFFE0;
  *(int8x8_t *)v7.i8 = vand_s8(v6, (int8x8_t)0xFF000000FFLL);
  v7.i64[1] = v7.i64[0];
  float32x4_t v8 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v7, (int32x4_t)xmmword_1000438A0));
  v9.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_1000438B0, v8)).u32[0];
  v9.i32[1] = vmovn_s32(vcgtq_f32(v8, (float32x4_t)xmmword_1000438B0)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v9, 0xFuLL))) & ((v2[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    QuickCodec::mask = FunctionTable::ft[0] ^ 0x157E9386;
    fegetenv(&v12);
    v12.__fpcr &= QuickCodec::mask + 70947740;
    fesetenv(&v12);
  }
  Madusa::ProfileTimer::~ProfileTimer((Madusa::ProfileTimer *)v11);
  return a1 + 16;
}

uint64_t Madusa::TransformPipe::_OctAxisExecute(uint64_t a1, uint64_t a2, int8x8_t a3)
{
  a3.i32[0] = *v3 | 0xFFFFFFE0;
  a3.i8[4] = v3[3];
  *(int8x8_t *)v4.i8 = vand_s8(a3, (int8x8_t)0xFF000000FFLL);
  v4.i64[1] = v4.i64[0];
  float32x4_t v5 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v4, (int32x4_t)xmmword_1000438C0));
  v6.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_1000438D0, v5)).u32[0];
  v6.i32[1] = vmovn_s32(vcgtq_f32(v5, (float32x4_t)xmmword_1000438D0)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v6, 0xFuLL))) & ((v3[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    ++QuickCodec::mask;
  }
  return Madusa::TransformPipe::OctAxisExecute(a1, a2);
}

float Madusa::TransformPipe::FlatBlockFilterExecute(uint64_t a1, uint64_t a2)
{
  Madusa::ProfileTimer::ProfileTimer(var48, (uint64_t)&unk_10006F6CB, *(void *)(a1 + 8));
  func = (float (*)(uint64_t, uint64_t))__find_func(0x1F3F9F1FA04060E0, -242982710);
  float v6 = func(a1, a2);
  v7.i8[4] = v2[3];
  v7.i32[0] = *v2 | 0xFFFFFFE0;
  *(int8x8_t *)v8.i8 = vand_s8(v7, (int8x8_t)0xFF000000FFLL);
  v8.i64[1] = v8.i64[0];
  float32x4_t v9 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v8, (int32x4_t)xmmword_1000438E0));
  v10.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_1000438F0, v9)).u32[0];
  v10.i32[1] = vmovn_s32(vcgtq_f32(v9, (float32x4_t)xmmword_1000438F0)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v10, 0xFuLL))) & ((v2[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    QuickCodec::mask = FunctionTable::ft[0] ^ 0x157E9386;
    uint64_t v11 = __find_func(0xDF9FDF1FC0E04070, 824451274);
    uint64_t v12 = 0;
    while (*(unsigned __int8 *)(v11 + v12) != ((QuickCodec::mask ^ 0xC12A2DF3) / 0x9D28AF)
         || *(unsigned __int8 *)(v11 + v12 + 1) != ((QuickCodec::mask ^ 0xFBC56C53) / 0x9D28AF)
         || *(unsigned __int8 *)(v11 + v12 + 2) != ((QuickCodec::mask ^ 0xDDCAB631) / 0x9D28AF)
         || *(unsigned __int8 *)(v11 + v12 + 3) != ((QuickCodec::mask ^ 0x79E0DCBFu) / 0x9D28AF))
    {
      v12 += 4;
      if (v12 == 2400) {
        goto LABEL_10;
      }
    }
    var48[9] = v11 + v12;
    long long vars8 = 0u;
LABEL_10:
    QuickCodec::mask += 16;
  }
  Madusa::ProfileTimer::~ProfileTimer((Madusa::ProfileTimer *)var48);
  return v6;
}

float Madusa::TransformPipe::_FlatBlockFilterExecute(uint64_t a1, uint64_t a2)
{
  int8x16_t v3 = 0;
  int v4 = 0;
  if (QuickCodec::mask == -70947757) {
    int v5 = 14543306;
  }
  else {
    int v5 = 6135462;
  }
  uint64_t v6 = 1;
  int v7 = 1676363;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v9 = v6;
        if (v7 > 6135461) {
          break;
        }
        if (v7 == 1676363)
        {
          uint64_t v6 = 0;
          int v7 = 6135462;
        }
        else if (v7 == 1676380)
        {
          uint64_t v6 = (QuickCodec::mask != -70947757) | v6;
          int v7 = v5;
        }
        else if ((*v3 & 0x1F) != 0 {
               || v3[2] > 0x3Fu
        }
               || (uint64_t v6 = 1,
                   int v7 = 6135462,
                   v3[3] != ((QuickCodec::mask ^ v4) / 0x89BAF0)))
        {
          int v7 = 6135516;
          uint64_t v6 = v9;
        }
      }
      if (v7 <= 7811807) {
        break;
      }
      if (v7 == 7811808)
      {
        int8x16_t v3 = (unsigned char *)v2;
        int v7 = 1676380;
      }
      else
      {
        BOOL v8 = v7 == 14543306;
        int v7 = 1676434;
        if (v8) {
          int v4 = -1983143277;
        }
      }
    }
    if (v7 != 6135462) {
      break;
    }
    int v7 = 6135516;
    if ((v6 & 1) == 0) {
      int v7 = 7811808;
    }
  }
  if (v6) {
    ++QuickCodec::mask;
  }
  return Madusa::TransformPipe::FlatBlockFilterExecute(a1, a2);
}

void sub_10000A3E8()
{
}

void sub_10000A3FC()
{
}

double Madusa::BlockPicker::BlockPicker(Madusa::BlockPicker *this)
{
  *(void *)&double result = 0x4000000000;
  *(void *)this = 0x4000000000;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 1) = 0;
  return result;
}

uint64_t Madusa::BlockPicker::SetCanvasSize(Madusa::BlockPicker *this, unsigned int a2, int a3, int8x8_t a4)
{
  uint64_t v5 = 0;
  *(_DWORD *)this = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 1) = 0;
  if (a2 - 2147483520 >= 0x80000081 && a3 >= 1)
  {
    if ((unint64_t)a2 - 2147483456 < 0xFFFFFFFF00000000
      || (unint64_t)((int)(a2 + 192) - 2147483649) < 0xFFFFFFFF00000000)
    {
      goto LABEL_14;
    }
    int v7 = a2 + 191;
    if ((int)(a2 + 191) < 0) {
      int v7 = a2 + 318;
    }
    if (a3 > 0x7FFFFF7F
      || (unsigned int v8 = (a2 + 127) >> 7, (((a3 + 127) >> 7) * (unint64_t)v8) >> 31))
    {
LABEL_14:
      uint64_t v5 = 0;
    }
    else
    {
      *(_DWORD *)this = a3;
      int v10 = v7 >> 7;
      *((_DWORD *)this + 2) = v8;
      *((_DWORD *)this + 3) = v7 >> 7;
      int NumberOfBlocksOnRow = Madusa::BlockPicker::GetNumberOfBlocksOnRow(this, 1);
      *((_DWORD *)this + 4) = NumberOfBlocksOnRow;
      int v12 = Madusa::BlockPicker::GetNumberOfBlocksOnRow(this, 0);
      uint64_t v5 = 0;
      *((_DWORD *)this + 5) = v12;
      uint64_t v13 = (int)v8 * (uint64_t)NumberOfBlocksOnRow;
      if (v13 == (int)v13 && !((unint64_t)(v12 * (uint64_t)v10 + 0x80000000) >> 32))
      {
        *((_DWORD *)this + 6) = v13;
        *((_DWORD *)this + 7) = v12 * v10;
        uint64_t v5 = 1;
      }
    }
  }
  a4.i8[4] = v4[3];
  a4.i32[0] = *v4 | 0xFFFFFFE0;
  *(int8x8_t *)v14.i8 = vand_s8(a4, (int8x8_t)0xFF000000FFLL);
  v14.i64[1] = v14.i64[0];
  float32x4_t v15 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v14, (int32x4_t)xmmword_100043910));
  v16.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_100043920, v15)).u32[0];
  v16.i32[1] = vmovn_s32(vcgtq_f32(v15, (float32x4_t)xmmword_100043920)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v16, 0xFuLL))) & ((v4[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    QuickCodec::mask = FunctionTable::ft[0] ^ 0x157E9386;
    fegetenv(&v18);
    v18.__fpcr &= QuickCodec::mask + 70947740;
    fesetenv(&v18);
  }
  return v5;
}

uint64_t Madusa::BlockPicker::GetNumberOfBlocksOnRow(Madusa::BlockPicker *this, int a2)
{
  if (*(int *)this < 1) {
    return 0;
  }
  int v2 = (a2 + 1) & 1;
  if (a2 < -1) {
    int v2 = -v2;
  }
  int v3 = *(_DWORD *)this + (v2 << 6);
  int v4 = v3 + 127;
  int v5 = v3 + 254;
  if (v4 >= 0) {
    int v5 = v4;
  }
  return (v5 >> 7);
}

uint64_t Madusa::BlockPicker::_SetCanvasSize(Madusa::BlockPicker *this, unsigned int a2, int a3, int8x8_t a4)
{
  if ((*v4 & 0x1F) != 0 || v4[2] > 0x3Fu)
  {
    int v5 = QuickCodec::mask;
    if (QuickCodec::mask != -70947757) {
LABEL_10:
    }
      QuickCodec::mask = v5 + 1;
  }
  else
  {
    int v5 = QuickCodec::mask;
    if (v4[3] == 212 || QuickCodec::mask != -70947757) {
      goto LABEL_10;
    }
  }
  return Madusa::BlockPicker::SetCanvasSize(this, a2, a3, a4);
}

uint64_t Madusa::BlockPicker::GetNumberOfBaseBlocks(Madusa::BlockPicker *this)
{
  return *((unsigned int *)this + 6);
}

uint64_t Madusa::BlockPicker::_GetNumberOfBaseBlocks(Madusa::BlockPicker *this, const Madusa::BlockPicker *a2)
{
  int v3 = 0;
  int v4 = 0;
  if (QuickCodec::mask == -70947757) {
    int v5 = 7462941;
  }
  else {
    int v5 = 3627749;
  }
  uint64_t v6 = 1;
  int v7 = 2298023;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v9 = v6;
        if (v7 > 3627748) {
          break;
        }
        if (v7 == 2298023)
        {
          uint64_t v6 = 0;
          int v7 = 3627749;
        }
        else if (v7 == 2298040)
        {
          uint64_t v6 = (QuickCodec::mask != -70947757) | v6;
          int v7 = v5;
        }
        else if ((*v3 & 0x1F) != 0 {
               || v3[2] > 0x3Fu
        }
               || (uint64_t v6 = 1,
                   int v7 = 3627749,
                   v3[3] != ((QuickCodec::mask ^ v4) / 0x3CC11D)))
        {
          int v7 = 3627803;
          uint64_t v6 = v9;
        }
      }
      if (v7 <= 5925754) {
        break;
      }
      if (v7 == 5925755)
      {
        int v3 = (unsigned char *)v2;
        int v7 = 2298040;
      }
      else
      {
        BOOL v8 = v7 == 7462941;
        int v7 = 2298094;
        if (v8) {
          int v4 = -913670057;
        }
      }
    }
    if (v7 != 3627749) {
      break;
    }
    int v7 = 3627803;
    if ((v6 & 1) == 0) {
      int v7 = 5925755;
    }
  }
  if (v6) {
    ++QuickCodec::mask;
  }
  return Madusa::BlockPicker::GetNumberOfBaseBlocks(this);
}

uint64_t Madusa::BlockPicker::GetNumberOfOverBlocks(Madusa::BlockPicker *this)
{
  int v3 = 0;
  int v4 = 0;
  if (QuickCodec::mask == -70947757) {
    int v5 = 8797811;
  }
  else {
    int v5 = 5048434;
  }
  uint64_t v6 = 1;
  int v7 = 3595487;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v8 = v6;
        if (v7 > 5048433) {
          break;
        }
        if (v7 == 3595487)
        {
          uint64_t v6 = 0;
          int v7 = 5048434;
        }
        else if (v7 == 3595504)
        {
          uint64_t v6 = (QuickCodec::mask != -70947757) | v6;
          int v7 = v5;
        }
        else if ((*v3 & 0x1F) != 0 {
               || v3[2] > 0x3Fu
        }
               || (uint64_t v6 = 1,
                   int v7 = 5048434,
                   v3[3] != ((QuickCodec::mask ^ v4) / 0x77D279)))
        {
          int v7 = 5048488;
          uint64_t v6 = v8;
        }
      }
      if (v7 <= 8643903) {
        break;
      }
      if (v7 == 8643904)
      {
        int v3 = v1;
        int v7 = 3595504;
      }
      else
      {
        BOOL v9 = v7 == 8797811;
        int v7 = 3595558;
        if (v9) {
          int v4 = -1728110489;
        }
      }
    }
    if (v7 != 5048434) {
      break;
    }
    if (v6) {
      int v7 = 5048488;
    }
    else {
      int v7 = 8643904;
    }
  }
  if (v6)
  {
    QuickCodec::mask = FunctionTable::ft[0] ^ 0x157E9386;
    uint64_t func = __find_func(0xDF9FDF1FC0E04070, 824451274);
    uint64_t v11 = 0;
    while (*(unsigned __int8 *)(func + v11) != ((QuickCodec::mask ^ 0xC12A2DF3) / 0x9D28AF)
         || *(unsigned __int8 *)(func + v11 + 1) != ((QuickCodec::mask ^ 0xFBC56C53) / 0x9D28AF)
         || *(unsigned __int8 *)(func + v11 + 2) != ((QuickCodec::mask ^ 0xDDCAB631) / 0x9D28AF)
         || *(unsigned __int8 *)(func + v11 + 3) != ((QuickCodec::mask ^ 0x79E0DCBFu) / 0x9D28AF))
    {
      v11 += 4;
      if (v11 == 2400) {
        goto LABEL_32;
      }
    }
    uint64_t vars0 = func + v11;
    long long vars8 = 0u;
LABEL_32:
    QuickCodec::mask += 16;
  }
  return *((unsigned int *)this + 7);
}

uint64_t Madusa::BlockPicker::_GetNumberOfOverBlocks(Madusa::BlockPicker *this, const Madusa::BlockPicker *a2)
{
  if ((*v2 & 0x1F) != 0 || v2[2] > 0x3Fu)
  {
    int v3 = QuickCodec::mask;
    if (QuickCodec::mask == -70947757) {
      return Madusa::BlockPicker::GetNumberOfOverBlocks(this);
    }
LABEL_7:
    QuickCodec::mask = v3 + 1;
    return Madusa::BlockPicker::GetNumberOfOverBlocks(this);
  }
  int v5 = 2325535 * v2[3];
  int v3 = QuickCodec::mask;
  if ((v5 ^ 0x1D62C9AC | v5 & 0x1D62C9AC) - (v5 + 493013420) + ~(v5 ^ 0x1D62C9AC | ~(v5 | 0x1D62C9AC)) == ~(~(~(~(v5 | 0x1D6008AC) | v5 & 0x1D6008AC) | 0x2C100) | ~(~(v5 | 0x1D6008AC) | v5 & 0x1D6008AC) & 0x2C100)
    || QuickCodec::mask != -70947757)
  {
    goto LABEL_7;
  }
  return Madusa::BlockPicker::GetNumberOfOverBlocks(this);
}

uint64_t Madusa::BlockPicker::_GetNumberOfBlocksOnRow(Madusa::BlockPicker *this, const Madusa::BlockPicker *a2)
{
  int v3 = 0;
  int v4 = 0;
  if (QuickCodec::mask == -70947757) {
    int v5 = 13883966;
  }
  else {
    int v5 = 3632302;
  }
  uint64_t v6 = 1;
  int v7 = 9230270;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v10 = v6;
        if (v7 <= 9230340) {
          break;
        }
        if (v7 == 9230341)
        {
          if ((*v3 & 0x1F) != 0
            || v3[2] > 0x3Fu
            || (uint64_t v6 = 1,
                int v7 = 3632302,
                v3[3] != ((QuickCodec::mask ^ v4) / 0x3A3C8A)))
          {
            int v7 = 3632356;
            uint64_t v6 = v10;
          }
        }
        else if (v7 == 12862555)
        {
          int v3 = (unsigned char *)v2;
          int v7 = 9230287;
        }
        else
        {
          BOOL v11 = v7 == 13883966;
          int v7 = 9230341;
          if (v11) {
            int v4 = -872460773;
          }
        }
      }
      if (v7 <= 9230269) {
        break;
      }
      unsigned int v8 = (QuickCodec::mask != -70947757) | v6;
      if (v7 == 9230287) {
        int v9 = v5;
      }
      else {
        int v9 = v7;
      }
      if (v7 == 9230287) {
        LODWORD(v10) = v8;
      }
      BOOL v11 = v7 == 9230270;
      if (v7 == 9230270) {
        int v7 = 3632302;
      }
      else {
        int v7 = v9;
      }
      if (v11) {
        uint64_t v6 = 0;
      }
      else {
        uint64_t v6 = v10;
      }
    }
    if (v7 != 3632302) {
      break;
    }
    int v7 = 3632356;
    if ((v6 & 1) == 0) {
      int v7 = 12862555;
    }
  }
  if (v6) {
    ++QuickCodec::mask;
  }
  return Madusa::BlockPicker::GetNumberOfBlocksOnRow(this, (int)a2);
}

unint64_t Madusa::BlockPicker::GetBlockPositionByIndex(Madusa::BlockPicker *this, int a2)
{
  int NumberOfBaseBlocks = Madusa::BlockPicker::GetNumberOfBaseBlocks(this);
  if (NumberOfBaseBlocks < 1)
  {
    uint64_t v5 = 0;
    unsigned int v13 = 0;
    return v13 | (unint64_t)(v5 << 32);
  }
  if (NumberOfBaseBlocks <= a2) {
    LODWORD(v5) = -64;
  }
  else {
    LODWORD(v5) = 0;
  }
  uint64_t v6 = 20;
  if (NumberOfBaseBlocks <= a2)
  {
    int v7 = NumberOfBaseBlocks;
  }
  else
  {
    uint64_t v6 = 16;
    int v7 = 0;
  }
  int v8 = *(_DWORD *)((char *)this + v6);
  if (!v8) {
    return 0;
  }
  uint64_t v9 = (a2 - v7);
  if (!v9)
  {
    uint64_t v10 = v9;
    if (v8 != -1)
    {
LABEL_13:
      uint64_t v11 = (int)v9 % v8;
      if (v10 != (int)v10) {
        goto LABEL_14;
      }
      goto LABEL_25;
    }
LABEL_24:
    uint64_t v11 = 0;
    if (v10 != (int)v10)
    {
LABEL_14:
      BOOL v12 = 0;
      unsigned int v13 = v5;
      if (v11 << 7 == v11 << 7) {
        goto LABEL_15;
      }
      return 0;
    }
LABEL_25:
    uint64_t v16 = v10 + (int)v5;
    unsigned int v17 = v10 + v5;
    BOOL v12 = v16 == v16;
    if ((int)v16 == v16) {
      unsigned int v13 = v17;
    }
    else {
      unsigned int v13 = v5;
    }
    if (v11 << 7 == v11 << 7)
    {
LABEL_15:
      uint64_t v14 = (int)(v11 << 7) + (uint64_t)(int)v5;
      if (v14 == (int)v14) {
        uint64_t v5 = v14;
      }
      else {
        uint64_t v5 = v5;
      }
      if (v12)
      {
        if ((unint64_t)(v14 + 0x80000000) >> 32) {
          return 0;
        }
        return v13 | (unint64_t)(v5 << 32);
      }
      return 0;
    }
    return 0;
  }
  if (v9 != 0x80000000 || v8 != -1)
  {
    uint64_t v10 = (uint64_t)((int)v9 / v8) << 7;
    if (v8 != -1) {
      goto LABEL_13;
    }
    goto LABEL_24;
  }
  return 0;
}

uint64_t Madusa::BlockPicker::DoesBlockIntersetRegion(Madusa::BlockPicker *a1, int32x2_t *a2, int a3)
{
  unint64_t BlockPositionByIndex = Madusa::BlockPicker::GetBlockPositionByIndex(a1, a3);
  uint32x2_t v5 = vcgt_u32((uint32x2_t)0x8000000080000000, (uint32x2_t)vsub_s32(vmin_s32(vadd_s32(vadd_s32(*a2, a2[1]), (int32x2_t)-1), vadd_s32((int32x2_t)BlockPositionByIndex, (int32x2_t)0x7F0000007FLL)), vmax_s32(*a2, (int32x2_t)BlockPositionByIndex)));
  return v5.i32[0] & v5.i32[1] & 1;
}

uint64_t Madusa::BlockPicker::_DoesBlockIntersetRegion(Madusa::BlockPicker *a1, int32x2_t *a2, int a3)
{
  if ((*v3 & 0x1F) != 0 || v3[2] > 0x3Fu)
  {
    int v4 = QuickCodec::mask;
    if (QuickCodec::mask != -70947757) {
LABEL_10:
    }
      QuickCodec::mask = v4 + 1;
  }
  else
  {
    int v4 = QuickCodec::mask;
    if (v3[3] == 212 || QuickCodec::mask != -70947757) {
      goto LABEL_10;
    }
  }
  return Madusa::BlockPicker::DoesBlockIntersetRegion(a1, a2, a3);
}

unint64_t Madusa::BlockPicker::GetBlockPositionByRowColumn(Madusa::BlockPicker *this, int a2, int a3)
{
  int v7 = 0;
  int v8 = 0;
  if (QuickCodec::mask == -70947757) {
    int v9 = 7578122;
  }
  else {
    int v9 = 193227;
  }
  uint64_t v10 = 1;
  int v11 = 3590255;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v14 = v10;
        if (v11 <= 3590325) {
          break;
        }
        if (v11 == 3590326)
        {
          if ((*v7 & 0x1F) != 0
            || v7[2] > 0x3Fu
            || (uint64_t v10 = 1,
                int v11 = 193227,
                v7[3] != ((QuickCodec::mask ^ v8) / 0x1DDBB1)))
          {
            int v11 = 193281;
            uint64_t v10 = v14;
          }
        }
        else if (v11 == 3783465)
        {
          int v7 = v3;
          int v11 = 3590272;
        }
        else
        {
          BOOL v15 = v11 == 7578122;
          int v11 = 3590326;
          if (v15) {
            int v8 = -478379321;
          }
        }
      }
      if (v11 <= 3590254) {
        break;
      }
      unsigned int v12 = (QuickCodec::mask != -70947757) | v10;
      if (v11 == 3590272) {
        int v13 = v9;
      }
      else {
        int v13 = v11;
      }
      if (v11 == 3590272) {
        LODWORD(v14) = v12;
      }
      BOOL v15 = v11 == 3590255;
      if (v11 == 3590255) {
        int v11 = 193227;
      }
      else {
        int v11 = v13;
      }
      if (v15) {
        uint64_t v10 = 0;
      }
      else {
        uint64_t v10 = v14;
      }
    }
    if (v11 != 193227) {
      break;
    }
    int v11 = 193281;
    if ((v10 & 1) == 0) {
      int v11 = 3783465;
    }
  }
  if (v10)
  {
    QuickCodec::mask = FunctionTable::ft[0] ^ 0x157E9386;
    uint64_t func = (void (*)(void, uint64_t))__find_func(0xBFBF1F1FC0C00040, 1359274186);
    func(0, 104);
  }
  int v17 = (a2 + 1) & 1;
  if (a2 < -1) {
    int v17 = -v17;
  }
  return (*((_DWORD *)this + 1) * a2 - 64) | ((unint64_t)(((a3 << 7) - (v17 << 6)) >> 6) << 38);
}

unint64_t Madusa::BlockPicker::GetRowBoundingBox(Madusa::BlockPicker *this, int a2)
{
  int v4 = *((_DWORD *)this + 1);
  Madusa::BlockPicker::GetNumberOfBlocksOnRow(this, a2);
  uint32x2_t v5 = 0;
  int v6 = 0;
  if (QuickCodec::mask == -70947757) {
    int v7 = 5777065;
  }
  else {
    int v7 = 1843993;
  }
  uint64_t v8 = 1;
  int v9 = 1519579;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v11 = v8;
        if (v9 > 1843992) {
          break;
        }
        if (v9 == 1519579)
        {
          uint64_t v8 = 0;
          int v9 = 1843993;
        }
        else if (v9 == 1519596)
        {
          uint64_t v8 = (QuickCodec::mask != -70947757) | v8;
          int v9 = v7;
        }
        else if ((*v5 & 0x1F) != 0 {
               || v5[2] > 0x3Fu
        }
               || (uint64_t v8 = 1,
                   int v9 = 1843993,
                   v5[3] != ((QuickCodec::mask ^ v6) / 0x555113)))
        {
          int v9 = 1844047;
          uint64_t v8 = v11;
        }
      }
      if (v9 <= 3363554) {
        break;
      }
      if (v9 == 3363555)
      {
        uint32x2_t v5 = v2;
        int v9 = 1519596;
      }
      else
      {
        BOOL v10 = v9 == 5777065;
        int v9 = 1519650;
        if (v10) {
          int v6 = -1117630481;
        }
      }
    }
    if (v9 != 1843993) {
      break;
    }
    int v9 = 1844047;
    if ((v8 & 1) == 0) {
      int v9 = 3363555;
    }
  }
  if (v8)
  {
    unint64_t v12 = 0;
    int v13 = FunctionTable::ft[0] ^ 0x157E9386;
    QuickCodec::mask = FunctionTable::ft[0] ^ 0x157E9386;
    int v14 = -1;
    do
    {
      qword_100074AF8[v14
                    + 1
                    + ((FunctionTable::swapTable[v12] ^ v13) / 0x9D28AF)] = qword_100074AF8[v14 + ((FunctionTable::swapTable[v12 + 1] ^ v13) / 0x9D28AF)];
      v14 -= 2;
      BOOL v15 = v12 >= 0x20;
      v12 += 2;
    }
    while (!v15);
  }
  int v16 = (a2 + 1) & 1;
  if (a2 < -1) {
    int v16 = -v16;
  }
  return (v4 * a2 - 64) | ((unint64_t)((0x3FFFFFF * v16) & 0x3FFFFFF) << 38);
}

unint64_t Madusa::BlockPicker::_GetRowBoundingBox(Madusa::BlockPicker *this, int a2)
{
  if ((*v2 & 0x1F) != 0 || v2[2] > 0x3Fu)
  {
    int v3 = QuickCodec::mask;
    if (QuickCodec::mask != -70947757) {
LABEL_10:
    }
      QuickCodec::mask = v3 + 1;
  }
  else
  {
    int v3 = QuickCodec::mask;
    if (v2[3] == 212 || QuickCodec::mask != -70947757) {
      goto LABEL_10;
    }
  }
  return Madusa::BlockPicker::GetRowBoundingBox(this, a2);
}

uint64_t Madusa::BlockPicker::ShouldProcessBandBlock(Madusa::BlockPicker *this, int a2, int a3)
{
  int v4 = (a2 + 1) & 1;
  if (a2 < -1) {
    int v4 = -v4;
  }
  uint64_t v5 = (a3 << 7) - (v4 << 6) - (uint64_t)(128 - (v4 << 6));
  BOOL v6 = (v5 & 0x40) == 0 && v5 == (int)v5;
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = 0;
    int v9 = 0;
    if (QuickCodec::mask == -70947757) {
      int v10 = 3855801;
    }
    else {
      int v10 = 1083418;
    }
    uint64_t v11 = 1;
    int v12 = 1513181;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          uint64_t v15 = v11;
          if (v12 <= 1513251) {
            break;
          }
          if (v12 == 1513252)
          {
            if ((*v8 & 0x1F) != 0
              || v8[2] > 0x3Fu
              || (uint64_t v11 = 1,
                  int v12 = 1083418,
                  v8[3] != ((QuickCodec::mask ^ v9) / 0x11ACF2)))
            {
              int v12 = 1083472;
              uint64_t v11 = v15;
            }
          }
          else if (v12 == 2596582)
          {
            uint64_t v8 = v3;
            int v12 = 1513198;
          }
          else
          {
            BOOL v6 = v12 == 3855801;
            int v12 = 1513252;
            if (v6) {
              int v9 = -177843141;
            }
          }
        }
        if (v12 <= 1513180) {
          break;
        }
        unsigned int v13 = (QuickCodec::mask != -70947757) | v11;
        if (v12 == 1513198) {
          int v14 = v10;
        }
        else {
          int v14 = v12;
        }
        if (v12 == 1513198) {
          LODWORD(v15) = v13;
        }
        BOOL v16 = v12 == 1513181;
        if (v12 == 1513181) {
          int v12 = 1083418;
        }
        else {
          int v12 = v14;
        }
        if (v16) {
          uint64_t v11 = 0;
        }
        else {
          uint64_t v11 = v15;
        }
      }
      if (v12 != 1083418) {
        break;
      }
      int v12 = 1083472;
      if ((v11 & 1) == 0) {
        int v12 = 2596582;
      }
    }
    if (v11)
    {
      QuickCodec::mask = FunctionTable::ft[0] ^ 0x157E9386;
      fegetenv(&v20);
      v20.__fpcr &= QuickCodec::mask + 70947740;
      fesetenv(&v20);
    }
    return v7;
  }
  if (((*v3 & 0x1F) != 0 || v3[2] > 0x3Fu || v3[3] != 212)
    && QuickCodec::mask == -70947757)
  {
    return v7;
  }
  QuickCodec::mask = FunctionTable::ft[0] ^ 0x157E9386;
  uint64_t func = __find_func(0xDF9FDF1FC0E04070, 824451274);
  uint64_t v19 = 0;
  while (*(unsigned __int8 *)(func + v19) != ((QuickCodec::mask ^ 0xC12A2DF3) / 0x9D28AF)
       || *(unsigned __int8 *)(func + v19 + 1) != ((QuickCodec::mask ^ 0xFBC56C53) / 0x9D28AF)
       || *(unsigned __int8 *)(func + v19 + 2) != ((QuickCodec::mask ^ 0xDDCAB631) / 0x9D28AF)
       || *(unsigned __int8 *)(func + v19 + 3) != ((QuickCodec::mask ^ 0x79E0DCBFu) / 0x9D28AF))
  {
    v19 += 4;
    if (v19 == 2400) {
      goto LABEL_56;
    }
  }
  uint64_t vars0 = func + v19;
  long long vars8 = 0u;
LABEL_56:
  QuickCodec::mask += 16;
  return v7;
}

uint64_t Madusa::BlockPicker::_ShouldProcessBandBlock(Madusa::BlockPicker *this, const Madusa::BlockPicker *a2, int a3, int8x8_t a4)
{
  a4.i32[0] = *v4 | 0xFFFFFFE0;
  a4.i8[4] = v4[3];
  *(int8x8_t *)v5.i8 = vand_s8(a4, (int8x8_t)0xFF000000FFLL);
  v5.i64[1] = v5.i64[0];
  float32x4_t v6 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v5, (int32x4_t)xmmword_100043930));
  v7.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_100043940, v6)).u32[0];
  v7.i32[1] = vmovn_s32(vcgtq_f32(v6, (float32x4_t)xmmword_100043940)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v7, 0xFuLL))) & ((v4[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    ++QuickCodec::mask;
  }
  return Madusa::BlockPicker::ShouldProcessBandBlock(this, (int)a2, a3);
}

uint64_t Madusa::BlockPicker::ShouldProcessTileBlock(Madusa::BlockPicker *this, int a2)
{
  int NumberOfBaseBlocks = Madusa::BlockPicker::GetNumberOfBaseBlocks(this);
  if (NumberOfBaseBlocks < 1)
  {
    unsigned int v10 = 0;
    int v14 = 0;
    goto LABEL_30;
  }
  int16x4_t v7 = (char *)this + 20;
  if (a2 < NumberOfBaseBlocks) {
    int v8 = 0;
  }
  else {
    int v8 = -64;
  }
  if (a2 >= NumberOfBaseBlocks)
  {
    uint64_t v9 = (a2 - NumberOfBaseBlocks);
  }
  else
  {
    int16x4_t v7 = (char *)this + 16;
    uint64_t v9 = a2;
  }
  if (a2 < NumberOfBaseBlocks) {
    unsigned int v10 = 0;
  }
  else {
    unsigned int v10 = 64;
  }
  int v11 = *(_DWORD *)v7;
  if (!*(_DWORD *)v7) {
    goto LABEL_23;
  }
  if (v9)
  {
    if (v9 == 0x80000000 && v11 == -1)
    {
      LODWORD(v13) = 0;
      BOOL v15 = 0;
      goto LABEL_25;
    }
    uint64_t v12 = (uint64_t)((int)v9 / v11) << 7;
    if (v11 != -1) {
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v12 = v9;
    if (v11 != -1)
    {
LABEL_16:
      uint64_t v13 = (int)v9 % v11;
      goto LABEL_20;
    }
  }
  uint64_t v13 = 0;
LABEL_20:
  BOOL v15 = (unint64_t)(v12 + v8 + 0x80000000) >> 32 == 0;
  if (v12 != (int)v12) {
    BOOL v15 = 0;
  }
  if (v13 << 7 != v13 << 7)
  {
LABEL_23:
    int v14 = 0;
    goto LABEL_30;
  }
LABEL_25:
  int v14 = 0;
  uint64_t v16 = (int)(v13 << 7) + (uint64_t)v8;
  if (v16 == (int)v16) {
    int v8 = v16;
  }
  if (v15 && !((unint64_t)(v16 + 0x80000000) >> 32)) {
    int v14 = v8;
  }
LABEL_30:
  unint64_t v17 = v14 - (unint64_t)v10;
  BOOL v18 = (v17 & 0x7F) == 0 && v17 == (int)v17;
  uint64_t v19 = v18;
  if (!v18)
  {
    if ((*v2 & 0x1F) == 0 && v2[2] <= 0x3Fu && v2[3] == 212 || QuickCodec::mask != -70947757)
    {
      unint64_t v24 = 0;
      int v25 = FunctionTable::ft[0] ^ 0x157E9386;
      QuickCodec::mask = FunctionTable::ft[0] ^ 0x157E9386;
      int v26 = -1;
      do
      {
        qword_100074AF8[v26
                      + 1
                      + ((FunctionTable::swapTable[v24] ^ v25) / 0x9D28AF)] = qword_100074AF8[v26 + ((FunctionTable::swapTable[v24 + 1] ^ v25) / 0x9D28AF)];
        v26 -= 2;
        BOOL v27 = v24 >= 0x20;
        v24 += 2;
      }
      while (!v27);
    }
    return v19;
  }
  v6.i32[0] = *v2 | 0xFFFFFFE0;
  v6.i8[4] = v2[3];
  *(int8x8_t *)v20.i8 = vand_s8(v6, (int8x8_t)0xFF000000FFLL);
  v20.i64[1] = v20.i64[0];
  float32x4_t v21 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v20, (int32x4_t)xmmword_100043950));
  v22.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_100043960, v21)).u32[0];
  v22.i32[1] = vmovn_s32(vcgtq_f32(v21, (float32x4_t)xmmword_100043960)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v22, 0xFuLL))) & ((v2[2] & 0xE0) == 32)) == 0
    && QuickCodec::mask == -70947757)
  {
    return v19;
  }
  QuickCodec::mask = FunctionTable::ft[0] ^ 0x157E9386;
  uint64_t func = (void (*)(void, uint64_t))__find_func(0xBFBF1F1FC0C00040, 1359274186);
  func(0, 104);
  return v19;
}

uint64_t Madusa::BlockPicker::_ShouldProcessTileBlock(Madusa::BlockPicker *this, const Madusa::BlockPicker *a2)
{
  if ((*v2 & 0x1F) != 0 || v2[2] > 0x3Fu)
  {
    int v3 = QuickCodec::mask;
    if (QuickCodec::mask != -70947757) {
LABEL_10:
    }
      QuickCodec::mask = v3 + 1;
  }
  else
  {
    int v3 = QuickCodec::mask;
    if (v2[3] == 212 || QuickCodec::mask != -70947757) {
      goto LABEL_10;
    }
  }
  return Madusa::BlockPicker::ShouldProcessTileBlock(this, (int)a2);
}

uint64_t Madusa::BlockPicker::SetBandRowOfBlocksAdvance(uint64_t this, int a2)
{
  *(_DWORD *)(this + 4) = a2;
  return this;
}

__n128 Madusa::PixelTraversalInformation::PixelTraversalInformation(uint64_t a1, int a2, int a3, __n128 *a4)
{
  *(_DWORD *)a1 = a3;
  *(_DWORD *)(a1 + 4) = a2;
  __n128 result = *a4;
  *(__n128 *)(a1 + 8) = *a4;
  return result;
}

BOOL Madusa::PixelTraversalInformation::IsValid(Madusa::PixelTraversalInformation *this)
{
  BOOL result = Madusa::SubBytePixelDirectionAndOffset::IsValid((Madusa::PixelTraversalInformation *)((char *)this + 8));
  if (result) {
    return *((_DWORD *)this + 1) || *(_DWORD *)this != 0;
  }
  return result;
}

void *Madusa::FrequencyTransform::FrequencyTransform(void *a1, uint64_t a2)
{
  int v3 = a1 + 16970;
  int v4 = a1 + 12809;
  int32x4_t v5 = a1 + 8648;
  int8x8_t v6 = a1 + 8581;
  int16x4_t v7 = a1 + 8452;
  *a1 = off_100070650;
  a1[1] = a2;
  a1[2] = off_100070690;
  bzero(a1 + 3, 0x400uLL);
  a1[131] = off_1000706B0;
  bzero(a1 + 132, 0x10400uLL);
  *int16x4_t v7 = off_100070690;
  bzero(a1 + 8453, 0x400uLL);
  *int8x8_t v6 = off_1000706D0;
  bzero(a1 + 8582, 0x208uLL);
  void *v5 = off_100070670;
  void *v4 = off_100070670;
  void *v3 = off_100070670;
  bzero(a1 + 8649, 0x8200uLL);
  bzero(a1 + 12810, 0x8200uLL);
  bzero(a1 + 16971, 0x8200uLL);
  return a1;
}

uint64_t Madusa::FrequencyTransform::Execute(uint64_t a1, uint64_t a2)
{
  Madusa::ProfileTimer::ProfileTimer(v13, (uint64_t)&unk_10006F6CB, *(void *)(a1 + 8));
  uint64_t func = (void (*)(uint64_t, uint64_t))__find_func(0xDF1FFF5FE0C080D0, 832831626);
  func(a1, a2);
  Madusa::ProfileTimer::~ProfileTimer((Madusa::ProfileTimer *)v13);
  int8x8_t v6 = (void (*)(uint64_t, uint64_t))__find_func(0x3F7F5F5F8040E010, -775642998);
  v6(a1, a2);
  v7.i8[4] = v2[3];
  v7.i32[0] = *v2 | 0xFFFFFFE0;
  *(int8x8_t *)v8.i8 = vand_s8(v7, (int8x8_t)0xFF000000FFLL);
  v8.i64[1] = v8.i64[0];
  float32x4_t v9 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v8, (int32x4_t)xmmword_100043970));
  v10.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_100043980, v9)).u32[0];
  v10.i32[1] = vmovn_s32(vcgtq_f32(v9, (float32x4_t)xmmword_100043980)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v10, 0xFuLL))) & ((v2[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    QuickCodec::mask = FunctionTable::ft[0] ^ 0x157E9386;
    int v11 = (void (*)(void, uint64_t))__find_func(0xBFBF1F1FC0C00040, 1359274186);
    v11(0, 104);
  }
  return a1 + 69184;
}

uint64_t Madusa::FrequencyTransform::_Execute(uint64_t a1, uint64_t a2)
{
  int v3 = 0;
  int v4 = 0;
  if (QuickCodec::mask == -70947757) {
    int v5 = 10246650;
  }
  else {
    int v5 = 1097923;
  }
  uint64_t v6 = 1;
  int v7 = 6207485;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v10 = v6;
        if (v7 <= 6207555) {
          break;
        }
        if (v7 == 6207556)
        {
          if ((*v3 & 0x1F) != 0
            || v3[2] > 0x3Fu
            || (uint64_t v6 = 1,
                int v7 = 1097923,
                v3[3] != ((QuickCodec::mask ^ v4) / 0x2143AD)))
          {
            int v7 = 1097977;
            uint64_t v6 = v10;
          }
        }
        else if (v7 == 7305391)
        {
          int v3 = (unsigned char *)v2;
          int v7 = 6207502;
        }
        else
        {
          BOOL v11 = v7 == 10246650;
          int v7 = 6207556;
          if (v11) {
            int v4 = -532060393;
          }
        }
      }
      if (v7 <= 6207484) {
        break;
      }
      unsigned int v8 = (QuickCodec::mask != -70947757) | v6;
      if (v7 == 6207502) {
        int v9 = v5;
      }
      else {
        int v9 = v7;
      }
      if (v7 == 6207502) {
        LODWORD(v10) = v8;
      }
      BOOL v11 = v7 == 6207485;
      if (v7 == 6207485) {
        int v7 = 1097923;
      }
      else {
        int v7 = v9;
      }
      if (v11) {
        uint64_t v6 = 0;
      }
      else {
        uint64_t v6 = v10;
      }
    }
    if (v7 != 1097923) {
      break;
    }
    int v7 = 1097977;
    if ((v6 & 1) == 0) {
      int v7 = 7305391;
    }
  }
  if (v6) {
    ++QuickCodec::mask;
  }
  return Madusa::FrequencyTransform::Execute(a1, a2);
}

uint64_t Madusa::FrequencyTransform::FftExecute(uint64_t a1, uint64_t a2)
{
  Madusa::ProfileTimer::ProfileTimer(v15, (uint64_t)&unk_10006F6CB, *(void *)(a1 + 8));
  uint64_t func = (void (*)(uint64_t, uint64_t, uint64_t))__find_func(0xBF5F1F7F80C0A000, 1373954218);
  func(a1, a2, a1 + 69184);
  v6.i8[4] = v2[3];
  v6.i32[0] = *v2 | 0xFFFFFFE0;
  *(int8x8_t *)v7.i8 = vand_s8(v6, (int8x8_t)0xFF000000FFLL);
  v7.i64[1] = v7.i64[0];
  float32x4_t v8 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v7, (int32x4_t)xmmword_100043990));
  v9.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_1000439A0, v8)).u32[0];
  v9.i32[1] = vmovn_s32(vcgtq_f32(v8, (float32x4_t)xmmword_1000439A0)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v9, 0xFuLL))) & ((v2[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    unint64_t v10 = 0;
    int v11 = FunctionTable::ft[0] ^ 0x157E9386;
    QuickCodec::mask = FunctionTable::ft[0] ^ 0x157E9386;
    int v12 = -1;
    do
    {
      qword_100074AF8[v12
                    + 1
                    + ((FunctionTable::swapTable[v10] ^ v11) / 0x9D28AF)] = qword_100074AF8[v12 + ((FunctionTable::swapTable[v10 + 1] ^ v11) / 0x9D28AF)];
      v12 -= 2;
      BOOL v13 = v10 >= 0x20;
      v10 += 2;
    }
    while (!v13);
  }
  Madusa::ProfileTimer::~ProfileTimer((Madusa::ProfileTimer *)v15);
  return a1 + 69184;
}

uint64_t Madusa::FrequencyTransform::_FftExecute(uint64_t a1, uint64_t a2)
{
  if ((*v2 & 0x1F) != 0 || v2[2] > 0x3Fu)
  {
    int v3 = QuickCodec::mask;
    if (QuickCodec::mask != -70947757) {
LABEL_10:
    }
      QuickCodec::mask = v3 + 1;
  }
  else
  {
    int v3 = QuickCodec::mask;
    if (v2[3] == 212 || QuickCodec::mask != -70947757) {
      goto LABEL_10;
    }
  }
  return Madusa::FrequencyTransform::FftExecute(a1, a2);
}

uint64_t Madusa::FrequencyTransform::_FftExecute_Alt(uint64_t a1)
{
  unint64_t v2 = 0;
  int v3 = 0;
  if (QuickCodec::mask == -70947757) {
    int v4 = 6672672;
  }
  else {
    int v4 = 2367812;
  }
  uint64_t v5 = 1;
  int v6 = 3901364;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v9 = v5;
        if (v6 <= 3901434) {
          break;
        }
        if (v6 == 3901435)
        {
          if ((*v2 & 0x1F) != 0
            || v2[2] > 0x3Fu
            || (uint64_t v5 = 1,
                int v6 = 2367812,
                v2[3] != ((QuickCodec::mask ^ v3) / 0x3816F7)))
          {
            int v6 = 2367866;
            uint64_t v5 = v9;
          }
        }
        else if (v6 == 6269159)
        {
          unint64_t v2 = (unsigned char *)v1;
          int v6 = 3901381;
        }
        else
        {
          BOOL v10 = v6 == 6672672;
          int v6 = 3901435;
          if (v10) {
            int v3 = -709465889;
          }
        }
      }
      if (v6 <= 3901363) {
        break;
      }
      unsigned int v7 = (QuickCodec::mask != -70947757) | v5;
      if (v6 == 3901381) {
        int v8 = v4;
      }
      else {
        int v8 = v6;
      }
      if (v6 == 3901381) {
        LODWORD(v9) = v7;
      }
      BOOL v10 = v6 == 3901364;
      if (v6 == 3901364) {
        int v6 = 2367812;
      }
      else {
        int v6 = v8;
      }
      if (v10) {
        uint64_t v5 = 0;
      }
      else {
        uint64_t v5 = v9;
      }
    }
    if (v6 != 2367812) {
      break;
    }
    int v6 = 2367866;
    if ((v5 & 1) == 0) {
      int v6 = 6269159;
    }
  }
  if (v5) {
    ++QuickCodec::mask;
  }
  return Madusa::FrequencyTransform::FftExecute_Alt(a1);
}

uint64_t Madusa::FrequencyTransform::FftExecute_Alt(uint64_t a1)
{
  return a1 + 69184;
}

void sub_10000C7C8()
{
}

void sub_10000C7DC()
{
}

void sub_10000C7F0()
{
}

void sub_10000C804()
{
}

void sub_10000C818()
{
}

int32x4_t ConvertPageParams@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned int v2 = *(_DWORD *)(a1 + 20);
  if (v2 >= 4) {
    unsigned int v2 = 0;
  }
  *(_DWORD *)a2 = v2;
  int32x4_t result = *(int32x4_t *)(a1 + 4);
  *(void *)&long long v4 = vrev64q_s32(result).u64[0];
  *((void *)&v4 + 1) = *(void *)(a1 + 12);
  *(_OWORD *)(a2 + 4) = v4;
  return result;
}

uint64_t ConvertImageParams@<X0>(const _t_zn_IMAGEPARAMS *a1@<X0>, Madusa::ImageProperties *a2@<X8>)
{
  Madusa::ImageProperties::ImageProperties(a2);
  Madusa::ImageProperties::SetDimensions((uint64_t)a2, a1->nHeight, a1->nWidth);
  if ((a1->aColorComponents[0] + 1) >= 0x14) {
    int v4 = -1;
  }
  else {
    int v4 = a1->aColorComponents[0];
  }
  Madusa::ImageProperties::SetColorComponent((uint64_t)a2, 0, v4);
  if ((a1->aColorComponents[1] + 1) >= 0x14) {
    int v5 = -1;
  }
  else {
    int v5 = a1->aColorComponents[1];
  }
  Madusa::ImageProperties::SetColorComponent((uint64_t)a2, 1u, v5);
  if ((a1->aColorComponents[2] + 1) >= 0x14) {
    int v6 = -1;
  }
  else {
    int v6 = a1->aColorComponents[2];
  }
  Madusa::ImageProperties::SetColorComponent((uint64_t)a2, 2u, v6);
  if ((a1->aColorComponents[3] + 1) >= 0x14) {
    int v7 = -1;
  }
  else {
    int v7 = a1->aColorComponents[3];
  }
  Madusa::ImageProperties::SetColorComponent((uint64_t)a2, 3u, v7);
  if ((a1->aColorComponents[4] + 1) >= 0x14) {
    int v8 = -1;
  }
  else {
    int v8 = a1->aColorComponents[4];
  }
  Madusa::ImageProperties::SetColorComponent((uint64_t)a2, 4u, v8);
  Madusa::ImageProperties::SetPaletteData((uint64_t)a2, a1->pPaletteData);
  int nXDotsPerInch = a1->nXDotsPerInch;
  int nYDotsPerInch = a1->nYDotsPerInch;
  Madusa::ImageProperties::SetOffset((uint64_t)a2, (double)a1->nXOffset, (double)a1->nYOffset);
  int v11 = 0;
  int DataType = a1->DataType;
  if ((DataType & 0x8000FFFF) <= 4) {
    int v11 = dword_1000439B0[DataType & 0x8000FFFF];
  }
  unsigned int v13 = DataType & 0xFFFF0000;
  if (!v13)
  {
LABEL_22:
    int v14 = 0;
    goto LABEL_24;
  }
  if (v13 != 196608)
  {
    if (v13 == 0x10000)
    {
      int v14 = 1;
      goto LABEL_24;
    }
    goto LABEL_22;
  }
  int v14 = 2;
LABEL_24:
  if ((a1->ColorModel + 1) >= 0xB) {
    int ColorModel = -1;
  }
  else {
    int ColorModel = a1->ColorModel;
  }
  if ((a1->PaletteColorModel + 1) >= 0xB) {
    Paletteint ColorModel = -1;
  }
  else {
    Paletteint ColorModel = a1->PaletteColorModel;
  }
  return Madusa::ImageProperties::SetBasicProperties((uint64_t)a2, a1->bAlphaChannel != 0, a1->bInverted != 0, ColorModel, a1->nBitsPerPixelPerColor, v11, v14, PaletteColorModel, (double)nXDotsPerInch, (double)nYDotsPerInch, a1->nPaletteBitsPerPixelPerColor, (uint64_t)a1->apLogical00, a1->nXStride, a1->nYStride);
}

int8x16_t CreateProcessImageProperties@<Q0>(const _t_zn_IMAGEPARAMS *a1@<X0>, uint64_t a2@<X8>)
{
  *(unsigned char *)a2 = a1->DataAccessFormat == 0;
  *(_DWORD *)(a2 + 4) = a1->nTileCount;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)&a1->pTileRects;
  int8x16_t result = vextq_s8(*(int8x16_t *)&a1->pLockTileParam, *(int8x16_t *)&a1->pLockTileParam, 8uLL);
  *(int8x16_t *)(a2 + 24) = result;
  *(void *)(a2 + 40) = a1->pUnlockTileParam;
  return result;
}

uint64_t ConvertResult(int *a1)
{
  uint64_t v1 = *a1;
  if (v1 > 3) {
    return 0xFFFFFFFFLL;
  }
  else {
    return dword_1000439D0[v1];
  }
}

uint64_t ConvertResult(const int *a1)
{
  uint64_t result = *(unsigned int *)a1;
  if ((int)result > -2)
  {
    if (!result) {
      return result;
    }
  }
  else
  {
    if (result == -101) {
      return 3;
    }
    if (result == -3) {
      return 2;
    }
  }
  return 1;
}

void *Madusa::ImpulseMatchedFilter::ImpulseMatchedFilter(void *result, uint64_t a2, uint64_t a3)
{
  *uint64_t result = a2;
  result[1] = a3;
  return result;
}

int *Madusa::ImpulseMatchedFilter::Execute(uint64_t **this, float a2)
{
  bzero((void *)(*this[1] + 8), 0x85A8uLL);
  *(void *)float v83 = 0;
  uint64_t result = Madusa::AffineTransform::GetScaleRangeLimits(&v83[1], v83, v4);
  uint64_t v7 = v83[1];
  uint64_t v82 = v83[0];
  if (v83[1] <= v83[0])
  {
    uint64_t v45 = 0;
    uint64_t v46 = 376 * v83[1];
    uint64_t v47 = v46 + 24;
    int v48 = v83[1] - 45;
    uint64_t result = Madusa::ImpulseMatchedFilter::mGridCols;
    uint64_t v49 = v83[1];
    do
    {
      uint64_t v50 = 0;
      int v51 = v49 - 45;
      do
      {
        int v52 = Madusa::ImpulseMatchedFilter::mGridRows[v50];
        unsigned int v53 = v51 + v52;
        if ((v51 + v52) > 0x5A) {
          goto LABEL_12;
        }
        int v54 = Madusa::ImpulseMatchedFilter::mGridCols[v50];
        uint64_t v55 = *this[1];
        float v56 = (float *)(v55 + 376 * v49 + 8);
        uint64_t v57 = **this;
        float v58 = (float *)(v57 + 376 * v53 + 8);
        if (v54 > 93) {
          goto LABEL_29;
        }
        float v59 = &v58[v54];
        uint64_t v60 = (93 - v54);
        if (v60 < 0xB)
        {
          int v61 = Madusa::ImpulseMatchedFilter::mGridCols[v50];
LABEL_25:
          int v69 = v61 - 94;
          do
          {
            float v70 = *v59++;
            *float v56 = *v56 + v70;
            ++v56;
            BOOL v63 = __CFADD__(v69++, 1);
          }
          while (!v63);
          goto LABEL_28;
        }
        uint64_t v62 = 4 * v54;
        BOOL v63 = (unint64_t)v56 >= v57 + 4 * v60 + v62 + 376 * (unint64_t)v53 + 12
           || (unint64_t)v59 >= v55 + v46 + 376 * v45 + 4 * v60 + 12;
        int v61 = Madusa::ImpulseMatchedFilter::mGridCols[v50];
        if (!v63) {
          goto LABEL_25;
        }
        uint64_t v64 = v60 + 1;
        int v61 = v54 + (v64 & 0xFFFFFFF8);
        uint64_t v65 = 4 * (v64 & 0x1FFFFFFF8);
        float v59 = (float *)((char *)v59 + v65);
        float v56 = (float *)((char *)v56 + v65);
        float v66 = (float32x4_t *)(v55 + v47);
        float v67 = (float32x4_t *)(v57 + v62 + 376 * (v48 + v52) + 24);
        uint64_t v68 = v64 & 0x1FFFFFFF8;
        do
        {
          float32x4_t v6 = vaddq_f32(*v66, *v67);
          v66[-1] = vaddq_f32(v66[-1], v67[-1]);
          *float v66 = v6;
          v66 += 2;
          v67 += 2;
          v68 -= 8;
        }
        while (v68);
        if (v64 != (v64 & 0x1FFFFFFF8)) {
          goto LABEL_25;
        }
LABEL_28:
        if (v54 < 1) {
          goto LABEL_12;
        }
LABEL_29:
        int v71 = 94 - v54;
        uint64_t v72 = (v54 - 1);
        if (v72 < 7
          || ((unint64_t)v56 < v57 + 4 * v72 + 376 * (unint64_t)v53 + 12
            ? (BOOL v73 = v58 >= &v56[v72 + 1])
            : (BOOL v73 = 1),
              !v73))
        {
          float v76 = v56;
LABEL_40:
          int v80 = v71 - 94;
          do
          {
            float v81 = *v58++;
            *float v76 = *v76 + v81;
            ++v76;
            BOOL v63 = __CFADD__(v80++, 1);
          }
          while (!v63);
          goto LABEL_12;
        }
        uint64_t v74 = v72 + 1;
        uint64_t v75 = (v72 + 1) & 0x1FFFFFFF8;
        v71 += v75;
        v58 += v75;
        float v76 = &v56[v75];
        float v77 = (float32x4_t *)(v56 + 4);
        float v78 = (float32x4_t *)(v57 + 376 * (v48 + v52) + 24);
        uint64_t v79 = v75;
        do
        {
          float32x4_t v6 = vaddq_f32(*v77, *v78);
          v77[-1] = vaddq_f32(v77[-1], v78[-1]);
          *float v77 = v6;
          v77 += 2;
          v78 += 2;
          v79 -= 8;
        }
        while (v79);
        if (v74 != v75) {
          goto LABEL_40;
        }
LABEL_12:
        ++v50;
      }
      while (v50 != 28);
      ++v49;
      ++v45;
      v47 += 376;
      ++v48;
    }
    while (v82 + 1 != v49);
  }
  if ((int)v7 <= 13)
  {
    int v8 = (float32x4_t *)(*this[1] + 376 * (int)v7 + 200);
    do
    {
      float v9 = Madusa::ImpulseMatchedFilter::mNormalizationScaleTable[v7];
      v6.f32[0] = Madusa::ImpulseMatchedFilter::mNormalizationOffsetTable[v7] * a2;
      float32x4_t v10 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v6.f32, 0);
      float32x4_t v11 = vmlaq_n_f32(v10, v8[-11], v9);
      v8[-12] = vmlaq_n_f32(v10, v8[-12], v9);
      v8[-11] = v11;
      float32x4_t v12 = vmlaq_n_f32(v10, v8[-9], v9);
      v8[-10] = vmlaq_n_f32(v10, v8[-10], v9);
      v8[-9] = v12;
      float32x4_t v13 = vmlaq_n_f32(v10, v8[-7], v9);
      v8[-8] = vmlaq_n_f32(v10, v8[-8], v9);
      v8[-7] = v13;
      float32x4_t v14 = vmlaq_n_f32(v10, v8[-5], v9);
      v8[-6] = vmlaq_n_f32(v10, v8[-6], v9);
      v8[-5] = v14;
      float32x4_t v15 = vmlaq_n_f32(v10, v8[-3], v9);
      v8[-4] = vmlaq_n_f32(v10, v8[-4], v9);
      v8[-3] = v15;
      float32x4_t v16 = vmlaq_n_f32(v10, v8[-1], v9);
      v8[-2] = vmlaq_n_f32(v10, v8[-2], v9);
      v8[-1] = v16;
      float32x4_t v17 = vmlaq_n_f32(v10, v8[1], v9);
      *int v8 = vmlaq_n_f32(v10, *v8, v9);
      v8[1] = v17;
      float32x4_t v18 = vmlaq_n_f32(v10, v8[3], v9);
      v8[2] = vmlaq_n_f32(v10, v8[2], v9);
      v8[3] = v18;
      float32x4_t v19 = vmlaq_n_f32(v10, v8[5], v9);
      v8[4] = vmlaq_n_f32(v10, v8[4], v9);
      v8[5] = v19;
      float32x4_t v20 = vmlaq_n_f32(v10, v8[7], v9);
      v8[6] = vmlaq_n_f32(v10, v8[6], v9);
      v8[7] = v20;
      float32x4_t v21 = vmlaq_n_f32(v10, v8[8], v9);
      float32x4_t v22 = vmlaq_n_f32(v10, v8[9], v9);
      v8[8] = v21;
      v8[9] = v22;
      v20.f32[0] = v6.f32[0] + (float)(v8[10].f32[1] * v9);
      v8[10].f32[0] = v6.f32[0] + (float)(v8[10].f32[0] * v9);
      v8[10].i32[1] = v20.i32[0];
      v20.f32[0] = v6.f32[0] + (float)(v8[10].f32[3] * v9);
      v8[10].f32[2] = v6.f32[0] + (float)(v8[10].f32[2] * v9);
      v8[10].i32[3] = v20.i32[0];
      v22.f32[0] = v6.f32[0] + (float)(v8[11].f32[0] * v9);
      float32_t v23 = v6.f32[0] + (float)(v8[11].f32[1] * v9);
      ++v7;
      v8[11].i32[0] = v22.i32[0];
      v8[11].f32[1] = v23;
      int v8 = (float32x4_t *)((char *)v8 + 376);
    }
    while (v7 != 14);
  }
  if ((int)v82 >= 54)
  {
    unint64_t v24 = (float32x4_t *)(*this[1] + 20312);
    uint64_t v25 = v82 - 53;
    int v26 = &dword_100043B98;
    BOOL v27 = (float *)&dword_100043D04;
    do
    {
      float v28 = *(float *)v26++;
      float v29 = v28;
      float v30 = *v27++;
      v6.f32[0] = v30 * a2;
      float32x4_t v31 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v6.f32, 0);
      float32x4_t v32 = vmlaq_n_f32(v31, v24[1], v29);
      *unint64_t v24 = vmlaq_n_f32(v31, *v24, v29);
      v24[1] = v32;
      float32x4_t v33 = vmlaq_n_f32(v31, v24[3], v29);
      v24[2] = vmlaq_n_f32(v31, v24[2], v29);
      v24[3] = v33;
      float32x4_t v34 = vmlaq_n_f32(v31, v24[5], v29);
      v24[4] = vmlaq_n_f32(v31, v24[4], v29);
      v24[5] = v34;
      float32x4_t v35 = vmlaq_n_f32(v31, v24[7], v29);
      v24[6] = vmlaq_n_f32(v31, v24[6], v29);
      v24[7] = v35;
      float32x4_t v36 = vmlaq_n_f32(v31, v24[9], v29);
      v24[8] = vmlaq_n_f32(v31, v24[8], v29);
      v24[9] = v36;
      float32x4_t v37 = vmlaq_n_f32(v31, v24[11], v29);
      v24[10] = vmlaq_n_f32(v31, v24[10], v29);
      v24[11] = v37;
      float32x4_t v38 = vmlaq_n_f32(v31, v24[13], v29);
      v24[12] = vmlaq_n_f32(v31, v24[12], v29);
      v24[13] = v38;
      float32x4_t v39 = vmlaq_n_f32(v31, v24[15], v29);
      v24[14] = vmlaq_n_f32(v31, v24[14], v29);
      v24[15] = v39;
      float32x4_t v40 = vmlaq_n_f32(v31, v24[17], v29);
      v24[16] = vmlaq_n_f32(v31, v24[16], v29);
      v24[17] = v40;
      float32x4_t v41 = vmlaq_n_f32(v31, v24[19], v29);
      v24[18] = vmlaq_n_f32(v31, v24[18], v29);
      v24[19] = v41;
      float32x4_t v42 = vmlaq_n_f32(v31, v24[20], v29);
      float32x4_t v43 = vmlaq_n_f32(v31, v24[21], v29);
      v24[20] = v42;
      v24[21] = v43;
      v24[22].f32[0] = (float)(v30 * a2) + (float)(v24[22].f32[0] * v29);
      v24[22].f32[1] = (float)(v30 * a2) + (float)(v24[22].f32[1] * v29);
      v24[22].f32[2] = (float)(v30 * a2) + (float)(v24[22].f32[2] * v29);
      v24[22].f32[3] = (float)(v30 * a2) + (float)(v24[22].f32[3] * v29);
      v43.f32[0] = (float)(v30 * a2) + (float)(v24[23].f32[0] * v29);
      float32_t v44 = (float)(v30 * a2) + (float)(v24[23].f32[1] * v29);
      v24[23].i32[0] = v43.i32[0];
      v24[23].f32[1] = v44;
      unint64_t v24 = (float32x4_t *)((char *)v24 + 376);
      --v25;
    }
    while (v25);
  }
  return result;
}

int *Madusa::ImpulseMatchedFilter::_Execute(uint64_t **this, Madusa::ImpulseMatchedFilter *x1_0, float a2)
{
  if ((*v3 & 0x1F) != 0 || v3[2] > 0x3Fu)
  {
    int v4 = QuickCodec::mask;
    if (QuickCodec::mask == -70947757) {
      return Madusa::ImpulseMatchedFilter::Execute(this, a2);
    }
LABEL_7:
    QuickCodec::mask = v4 + 1;
    return Madusa::ImpulseMatchedFilter::Execute(this, a2);
  }
  int v6 = 998989 * v3[3];
  int v4 = QuickCodec::mask;
  if ((v6 ^ 0xC9F97C4 | v6 & 0xC9F97C4) - (v6 + 211785668) + ~(v6 ^ 0xC9F97C4 | ~(v6 | 0xC9F97C4)) == ~(~(~(~(v6 | 0xC880100) | v6 & 0xC880100) | 0x1796C4) | ~(~(v6 | 0xC880100) | v6 & 0xC880100) & 0x1796C4)
    || QuickCodec::mask != -70947757)
  {
    goto LABEL_7;
  }
  return Madusa::ImpulseMatchedFilter::Execute(this, a2);
}

void Madusa::SessionCallbacks::~SessionCallbacks(Madusa::SessionCallbacks *this)
{
}

uint64_t Madusa::SessionCallbacks::ParallelFor(Madusa::SessionCallbacks *this, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  if (HIDWORD(a4)) {
    return 1;
  }
  float32x4_t v10 = (CConfigFPU *)*((void *)this + 4);
  if (v10) {
    CConfigFPU::ConfigForUserCode(v10);
  }
  int v14 = (*((uint64_t (**)(uint64_t, uint64_t, unint64_t, void *, void))this + 1))(a2, a3, a4, a5, *((void *)this + 2));
  uint64_t v11 = ConvertResult(&v14);
  float32x4_t v12 = (CConfigFPU *)*((void *)this + 4);
  if (v12) {
    CConfigFPU::ConfigForSDKCode(v12);
  }
  return v11;
}

Madusa::Session *Madusa::Session::Session(Madusa::Session *this, Madusa::MemoryMaster *a2, int a3)
{
  *(void *)this = off_100070718;
  int v5 = Madusa::Session::gSessionKey1;
  *((_DWORD *)this + 2) = Madusa::Session::gSessionKey0;
  *((_DWORD *)this + 3) = v5;
  int v6 = Madusa::Session::gSessionKey3;
  *((_DWORD *)this + 4) = Madusa::Session::gSessionKey2;
  *((_DWORD *)this + 5) = v6;
  *((void *)this + 3) = &unk_100043DE0;
  *((void *)this + 4) = a2;
  *((void *)this + 5) = 0;
  Madusa::MemoryMaster::MemoryMaster((Madusa::Session *)((char *)this + 48), 0);
  *((void *)this + 11) = off_1000706F0;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((unsigned char *)this + 128) = 1;
  *(_OWORD *)((char *)this + 132) = 0u;
  Madusa::RandomNumGenerator::RandomNumGenerator((Madusa::Session *)((char *)this + 152));
  Madusa::SequenceManager::SequenceManager((Madusa::Session *)((char *)this + 2664));
  *((_DWORD *)this + 1164) = 0;
  *((_OWORD *)this + 290) = 0u;
  *((void *)this + 583) = 0;
  Madusa::ZnTimer::ZnTimer((uint64_t)this + 4672, a3);
  *((_DWORD *)this + 1176) = 0;
  *(void *)((char *)this + 4724) = 0;
  *((void *)this + 589) = 0;
  *(_DWORD *)((char *)this + 4719) = 0;
  *(void *)((char *)this + 4748) = 0;
  *((void *)this + 592) = 0;
  *(_DWORD *)((char *)this + 4743) = 0;
  *(void *)((char *)this + 4772) = 0;
  *((void *)this + 595) = 0;
  *(_DWORD *)((char *)this + 4767) = 0;
  *(void *)((char *)this + 4796) = 0;
  *((void *)this + 598) = 0;
  *(_DWORD *)((char *)this + 4791) = 0;
  *(void *)((char *)this + 4820) = 0;
  *(_DWORD *)((char *)this + 4815) = 0;
  *((void *)this + 601) = 0;
  *((_DWORD *)this + 1211) = 0;
  *(_DWORD *)((char *)this + 4839) = 0;
  *((void *)this + 604) = 0;
  *((_DWORD *)this + 1212) = 0;
  *(void *)((char *)this + 4868) = 0;
  *((void *)this + 607) = 0;
  *(_DWORD *)((char *)this + 4863) = 0;
  *(void *)((char *)this + 4892) = 0;
  *(_DWORD *)((char *)this + 4887) = 0;
  *((void *)this + 610) = 0;
  *(void *)((char *)this + 4916) = 0;
  *(_DWORD *)((char *)this + 4911) = 0;
  *(void *)((char *)this + 4940) = 0;
  *((void *)this + 613) = 0;
  *(_DWORD *)((char *)this + 4935) = 0;
  *((void *)this + 616) = 0;
  *(void *)((char *)this + 4964) = 0;
  *(_DWORD *)((char *)this + 4959) = 0;
  *((void *)this + 619) = 0;
  *((_DWORD *)this + 1247) = 0;
  *(_DWORD *)((char *)this + 4983) = 0;
  *((void *)this + 622) = 0;
  *((_DWORD *)this + 1248) = 0;
  *(void *)((char *)this + 5012) = 0;
  *((void *)this + 625) = 0;
  *(_DWORD *)((char *)this + 5007) = 0;
  *((_DWORD *)this + 1259) = 0;
  *(_DWORD *)((char *)this + 5031) = 0;
  *((void *)this + 628) = 0;
  *((unsigned char *)this + 5040) = 0;
  *((_DWORD *)this + 1164) = 0;
  *((_OWORD *)this + 290) = 0u;
  return this;
}

void Madusa::Session::DestroyDetector(Madusa::Session *this)
{
  unsigned int v2 = (void (***)(void))*((void *)this + 5);
  if (v2)
  {
    (**v2)(v2);
    Madusa::MemoryMaster::DeAllocateBuffer(*((void *)this + 5), v3);
    *((void *)this + 5) = 0;
  }

  Madusa::MemoryMaster::Deallocate((void **)this + 6);
}

void Madusa::Session::~Session(Madusa::Session *this)
{
  *(void *)this = off_100070718;
  unsigned int v2 = (void (***)(void))*((void *)this + 5);
  if (v2)
  {
    (**v2)(v2);
    Madusa::MemoryMaster::DeAllocateBuffer(*((void *)this + 5), v3);
    *((void *)this + 5) = 0;
  }
  Madusa::MemoryMaster::Deallocate((void **)this + 6);
  Madusa::MemoryMaster::~MemoryMaster((void **)this + 6);
}

{
  void (***v2)(void);
  void *v3;
  uint64_t vars8;

  *(void *)this = off_100070718;
  unsigned int v2 = (void (***)(void))*((void *)this + 5);
  if (v2)
  {
    (**v2)(v2);
    Madusa::MemoryMaster::DeAllocateBuffer(*((void *)this + 5), v3);
    *((void *)this + 5) = 0;
  }
  Madusa::MemoryMaster::Deallocate((void **)this + 6);
  Madusa::MemoryMaster::~MemoryMaster((void **)this + 6);

  operator delete();
}

uint64_t Madusa::Session::GetSessionMemory(Madusa::Session *this)
{
  return *((void *)this + 4);
}

uint64_t Madusa::Session::_GetSessionMemory(Madusa::Session *this, const Madusa::Session *a2)
{
  if ((*v2 & 0x1F) != 0 || v2[2] > 0x3Fu)
  {
    int v3 = QuickCodec::mask;
    if (QuickCodec::mask == -70947757) {
      return Madusa::Session::GetSessionMemory(this);
    }
LABEL_7:
    QuickCodec::mask = v3 + 1;
    return Madusa::Session::GetSessionMemory(this);
  }
  int v5 = 426315 * v2[3];
  int v3 = QuickCodec::mask;
  if ((v5 ^ 0x563121C | v5 & 0x563121C) - (v5 + 90378780) + ~(v5 ^ 0x563121C | ~(v5 | 0x563121C)) == ~(~(~(~(v5 | 0x520120C) | v5 & 0x520120C) | 0x430010) | ~(~(v5 | 0x520120C) | v5 & 0x520120C) & 0x430010)
    || QuickCodec::mask != -70947757)
  {
    goto LABEL_7;
  }
  return Madusa::Session::GetSessionMemory(this);
}

uint64_t Madusa::Session::UnscrambleSessionPointer(uint64_t this, void *a2)
{
  if (this)
  {
    if (Madusa::Session::gSessionOffset == this) {
      this = Madusa::Session::gSessionOffset;
    }
    else {
      this ^= Madusa::Session::gSessionOffset;
    }
    if (*(_DWORD *)(this + 8) != Madusa::Session::gSessionKey0
      || *(_DWORD *)(this + 12) != Madusa::Session::gSessionKey1
      || *(_DWORD *)(this + 16) != Madusa::Session::gSessionKey2
      || *(_DWORD *)(this + 20) != Madusa::Session::gSessionKey3)
    {
      return 0;
    }
  }
  return this;
}

unint64_t Madusa::Session::ScrambleSessionPointer(unint64_t this)
{
  if (Madusa::Session::gSessionOffset != this) {
    return Madusa::Session::gSessionOffset ^ this;
  }
  else {
    return Madusa::Session::gSessionOffset;
  }
}

uint64_t Madusa::Session::CreateBandModeDetector(Madusa::Session *this, Madusa::ImageProperties *a2)
{
  Madusa::ImageProperties::SetDimensions((uint64_t)a2, *((_DWORD *)this + 1161), *((_DWORD *)this + 1162));
  uint64_t v22 = 0;
  memset(v21, 0, sizeof(v21));
  int v5 = *(_DWORD *)Madusa::ImageProperties::GetXStride(a2);
  YStride = (unsigned int *)Madusa::ImageProperties::GetYStride(a2);
  Madusa::ImageProperties::SetPixelData((uint64_t)a2, v21, v5, *YStride);
  unint64_t ExtraWorkingMemorySize = Madusa::BandModeDetector::GetExtraWorkingMemorySize((uint64_t)a2, *((_DWORD *)this + 1160));
  if (!v9
    || ExtraWorkingMemorySize > 0xFFFFFFFFFFFF57B7
    || !Madusa::MemoryMaster::Reset((void **)this + 6, ExtraWorkingMemorySize + 43080))
  {
    goto LABEL_9;
  }
  uint64_t v10 = (*(uint64_t (**)(char *, uint64_t))(*((void *)this + 6) + 16))((char *)this + 48, 43080);
  if (!v10)
  {
    *((void *)this + 5) = 0;
    Madusa::MemoryMaster::Deallocate((void **)this + 6);
LABEL_9:
    uint64_t result = 4294967294;
    goto LABEL_10;
  }
  uint64_t v11 = v10;
  *((void *)this + 5) = Madusa::BandModeDetector::BandModeDetector(v10, (uint64_t)this);
  uint64_t func = (void (*)(uint64_t, void))__find_func(0x9F3F1FBF8000A0E0, 1904533610);
  func(v11, *((unsigned int *)this + 1160));
  if ((*(unsigned int (**)(void, Madusa::ImageProperties *, char *))(**((void **)this + 5) + 16))(*((void *)this + 5), a2, (char *)this + 48))
  {
    uint64_t result = 0;
  }
  else
  {
    uint64_t result = 4294967293;
  }
LABEL_10:
  v8.i8[4] = v2[3];
  v8.i32[0] = *v2 | 0xFFFFFFE0;
  *(int8x8_t *)v14.i8 = vand_s8(v8, (int8x8_t)0xFF000000FFLL);
  v14.i64[1] = v14.i64[0];
  float32x4_t v15 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v14, (int32x4_t)xmmword_100043DA0));
  v16.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_100043DB0, v15)).u32[0];
  v16.i32[1] = vmovn_s32(vcgtq_f32(v15, (float32x4_t)xmmword_100043DB0)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v16, 0xFuLL))) & ((v2[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    unint64_t v17 = 0;
    int v18 = FunctionTable::ft[0] ^ 0x157E9386;
    QuickCodec::mask = FunctionTable::ft[0] ^ 0x157E9386;
    int v19 = -1;
    do
    {
      qword_100074AF8[v19
                    + 1
                    + ((FunctionTable::swapTable[v17] ^ v18) / 0x9D28AF)] = qword_100074AF8[v19 + ((FunctionTable::swapTable[v17 + 1] ^ v18) / 0x9D28AF)];
      v19 -= 2;
      BOOL v20 = v17 >= 0x20;
      v17 += 2;
    }
    while (!v20);
  }
  return result;
}

uint64_t Madusa::Session::_CreateBandModeDetector(Madusa::Session *this, Madusa::Session *a2, Madusa::ImageProperties *a3)
{
  int v4 = 0;
  int v5 = 0;
  if (QuickCodec::mask == -70947757) {
    int v6 = 302496;
  }
  else {
    int v6 = 83040;
  }
  uint64_t v7 = 1;
  int v8 = 88307;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v11 = v7;
        if (v8 <= 88377) {
          break;
        }
        if (v8 == 88378)
        {
          if ((*v4 & 0x1F) != 0
            || v4[2] > 0x3Fu
            || (uint64_t v7 = 1,
                int v8 = 83040,
                v4[3] != ((QuickCodec::mask ^ v5) / 0x1957F)))
          {
            int v8 = 83094;
            uint64_t v7 = v11;
          }
        }
        else if (v8 == 171330)
        {
          int v4 = (unsigned char *)v3;
          int v8 = 88324;
        }
        else
        {
          BOOL v12 = v8 == 302496;
          int v8 = 88378;
          if (v12) {
            int v5 = -91577985;
          }
        }
      }
      if (v8 <= 88306) {
        break;
      }
      unsigned int v9 = (QuickCodec::mask != -70947757) | v7;
      if (v8 == 88324) {
        int v10 = v6;
      }
      else {
        int v10 = v8;
      }
      if (v8 == 88324) {
        LODWORD(v11) = v9;
      }
      BOOL v12 = v8 == 88307;
      if (v8 == 88307) {
        int v8 = 83040;
      }
      else {
        int v8 = v10;
      }
      if (v12) {
        uint64_t v7 = 0;
      }
      else {
        uint64_t v7 = v11;
      }
    }
    if (v8 != 83040) {
      break;
    }
    int v8 = 83094;
    if ((v7 & 1) == 0) {
      int v8 = 171330;
    }
  }
  if (v7) {
    ++QuickCodec::mask;
  }
  return Madusa::Session::CreateBandModeDetector(this, a2);
}

uint64_t Madusa::Session::CreateDetectorAndDetect(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 120);
  *(void *)(a1 + 120) = a4;
  uint64_t v7 = (unsigned char *)(a1 + 4672);
  if (Madusa::ZnTimer::Expired((Madusa::ZnTimer *)(a1 + 4672))) {
    return 0;
  }
  Madusa::ZnTimer::Start(v7);
  long long v9 = *(_OWORD *)(a2 + 80);
  v23[4] = *(_OWORD *)(a2 + 64);
  v23[5] = v9;
  long long v10 = *(_OWORD *)(a2 + 48);
  v23[2] = *(_OWORD *)(a2 + 32);
  v23[3] = v10;
  long long v11 = *(_OWORD *)(a2 + 144);
  v23[8] = *(_OWORD *)(a2 + 128);
  v23[9] = v11;
  long long v12 = *(_OWORD *)(a2 + 112);
  v23[6] = *(_OWORD *)(a2 + 96);
  v23[7] = v12;
  uint64_t v24 = *(void *)(a2 + 224);
  long long v13 = *(_OWORD *)(a2 + 208);
  v23[12] = *(_OWORD *)(a2 + 192);
  v23[13] = v13;
  long long v14 = *(_OWORD *)(a2 + 176);
  v23[10] = *(_OWORD *)(a2 + 160);
  v23[11] = v14;
  long long v15 = *(_OWORD *)(a2 + 16);
  v23[0] = *(_OWORD *)a2;
  v23[1] = v15;
  if (*(_DWORD *)(Madusa::System::mpSystem + 32) == 1)
  {
    uint64_t v16 = *(void *)(a1 + 40);
    if (v16) {
      goto LABEL_5;
    }
    uint64_t func = (uint64_t (*)(uint64_t, _OWORD *))__find_func(0x2FFFBFFF20800080, -1052491734);
    unsigned int v18 = func(a1, v23);
    if (v18)
    {
LABEL_8:
      if (v18 == -101) {
        *(unsigned char *)(a1 + 128) = 0;
      }
      goto LABEL_10;
    }
    uint64_t v16 = *(void *)(a1 + 40);
    if (v16)
    {
LABEL_5:
      unint64_t v17 = (uint64_t (*)(uint64_t, uint64_t))__find_func(0xBF1F7FFF2000E0D0, 1369735210);
      int v22 = v17(v16, a2);
      unsigned int v18 = ConvertResult(&v22);
      int v19 = (uint64_t (*)(uint64_t))__find_func(0x1F9F9F7F20A06000, -249274198);
      *(unsigned char *)(a1 + 5040) = v19(v16);
      goto LABEL_8;
    }
    unsigned int v18 = -2;
  }
  else
  {
    unsigned int v18 = -4;
  }
LABEL_10:
  if (*(unsigned char *)(a1 + 128)) {
    uint64_t v8 = v18;
  }
  else {
    uint64_t v8 = 4294967195;
  }
  *(void *)(a1 + 120) = v6;
  Madusa::ZnTimer::Stop(v7);
  return v8;
}

uint64_t Madusa::Session::_CreateDetectorAndDetect(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if ((*v4 & 0x1F) != 0 || v4[2] > 0x3Fu)
  {
    int v5 = QuickCodec::mask;
    if (QuickCodec::mask != -70947757) {
LABEL_10:
    }
      QuickCodec::mask = v5 + 1;
  }
  else
  {
    int v5 = QuickCodec::mask;
    if (v4[3] == 212 || QuickCodec::mask != -70947757) {
      goto LABEL_10;
    }
  }
  return Madusa::Session::CreateDetectorAndDetect(a1, a2, a3, a4);
}

uint64_t Madusa::Session::SetParallelFor(uint64_t this, int (*a2)(int, int, unsigned int, void *, void *), void *a3)
{
  *(void *)(this + 96) = a2;
  *(void *)(this + 104) = a3;
  return this;
}

uint64_t Madusa::Session::ParallelFor(unint64_t this, uint64_t a2, uint64_t a3, unint64_t a4, Madusa::DetectorBase *a5)
{
  if (*(Madusa::DetectorBase **)(this + 40) != a5) {
    return 1;
  }
  unint64_t v5 = -40 - a4;
  if (a4 > 0xFFFFFFFFFFFFFFD8) {
    unint64_t v5 = 0;
  }
  if (a4 > 0xFFFFFFFFFFFFFFD7) {
    return 1;
  }
  unint64_t v7 = -(uint64_t)v5;
  unint64_t v8 = Madusa::Session::gSessionOffset != this
     ? Madusa::Session::gSessionOffset ^ this
     : Madusa::Session::gSessionOffset;
  if (HIDWORD(v7)) {
    return 1;
  }
  long long v11 = *(CConfigFPU **)(this + 120);
  if (v11) {
    CConfigFPU::ConfigForUserCode(v11);
  }
  int v15 = (*(uint64_t (**)(uint64_t, uint64_t, unint64_t, unint64_t, void))(this + 96))(a2, a3, v7, v8, *(void *)(this + 104));
  uint64_t v12 = ConvertResult(&v15);
  long long v13 = *(CConfigFPU **)(this + 120);
  if (v13) {
    CConfigFPU::ConfigForSDKCode(v13);
  }
  return v12;
}

uint64_t Madusa::Session::ProcessRange(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  if (!a4) {
    return 0xFFFFFFFFLL;
  }
  *(void *)a4 = off_1000706F0;
  uint64_t v6 = *(void *)(a1 + 112);
  *(_OWORD *)(a4 + 8) = *(_OWORD *)(a1 + 96);
  *(void *)(a4 + 24) = v6;
  *(void *)(a4 + 32) = a5;
  if (a4 > 0xFFFFFFFFFFFFFFD7) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t func = (uint64_t (*)(uint64_t, uint64_t, uint64_t, unint64_t, unint64_t))__find_func(0xFF5F7FBF40400000, 300187754);
  int v12 = func(v9, a2, a3, a4 + 40, a4);
  return ConvertResult(&v12);
}

uint64_t Madusa::Session::IsWatermarkFound(Madusa::Session *this)
{
  unint64_t v3 = 0;
  int v4 = 0;
  if (QuickCodec::mask == -70947757) {
    int v5 = 5184771;
  }
  else {
    int v5 = 1229710;
  }
  uint64_t v6 = 1;
  int v7 = 1641539;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v10 = v6;
        if (v7 <= 1641609) {
          break;
        }
        if (v7 == 1641610)
        {
          if ((*v3 & 0x1F) != 0
            || v3[2] > 0x3Fu
            || (uint64_t v6 = 1,
                int v7 = 1229710,
                v3[3] != ((QuickCodec::mask ^ v4) / 0x38E091)))
          {
            int v7 = 1229764;
            uint64_t v6 = v10;
          }
        }
        else if (v7 == 2871232)
        {
          unint64_t v3 = v1;
          int v7 = 1641556;
        }
        else
        {
          BOOL v11 = v7 == 5184771;
          int v7 = 1641610;
          if (v11) {
            int v4 = -723741625;
          }
        }
      }
      if (v7 <= 1641538) {
        break;
      }
      unsigned int v8 = (QuickCodec::mask != -70947757) | v6;
      if (v7 == 1641556) {
        int v9 = v5;
      }
      else {
        int v9 = v7;
      }
      if (v7 == 1641556) {
        LODWORD(v10) = v8;
      }
      BOOL v11 = v7 == 1641539;
      if (v7 == 1641539) {
        int v7 = 1229710;
      }
      else {
        int v7 = v9;
      }
      if (v11) {
        uint64_t v6 = 0;
      }
      else {
        uint64_t v6 = v10;
      }
    }
    if (v7 != 1229710) {
      break;
    }
    int v7 = 1229764;
    if ((v6 & 1) == 0) {
      int v7 = 2871232;
    }
  }
  if (v6)
  {
    QuickCodec::mask = FunctionTable::ft[0] ^ 0x157E9386;
    fegetenv(&v13);
    v13.__fpcr &= QuickCodec::mask + 70947740;
    fesetenv(&v13);
  }
  return *((unsigned __int8 *)this + 5040);
}

uint64_t Madusa::Session::_IsWatermarkFound(Madusa::Session *this, const Madusa::Session *a2, int8x8_t a3)
{
  a3.i32[0] = *v3 | 0xFFFFFFE0;
  a3.i8[4] = v3[3];
  *(int8x8_t *)v4.i8 = vand_s8(a3, (int8x8_t)0xFF000000FFLL);
  v4.i64[1] = v4.i64[0];
  float32x4_t v5 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v4, (int32x4_t)xmmword_100043DC0));
  v6.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_100043DD0, v5)).u32[0];
  v6.i32[1] = vmovn_s32(vcgtq_f32(v5, (float32x4_t)xmmword_100043DD0)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v6, 0xFuLL))) & ((v3[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    ++QuickCodec::mask;
  }
  return Madusa::Session::IsWatermarkFound(this);
}

void Madusa::Session::FinishPage(Madusa::Session *this)
{
  unsigned int v2 = (Madusa::DetectorBase *)*((void *)this + 5);
  if (v2)
  {
    Madusa::DetectorBase::WriteReadstats(v2);
    unint64_t v3 = (void (***)(void))*((void *)this + 5);
    if (v3)
    {
      (**v3)(v3);
      Madusa::MemoryMaster::DeAllocateBuffer(*((void *)this + 5), v4);
      *((void *)this + 5) = 0;
    }
  }

  Madusa::MemoryMaster::Deallocate((void **)this + 6);
}

uint64_t Madusa::Session::SetProcessParams(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    *(void *)(result + 112) = *(void *)(a2 + 40);
    *(void *)(result + 4664) = *(void *)(a2 + 24);
  }
  return result;
}

uint64_t Madusa::Session::GetStatusParam(Madusa::Session *this)
{
  return *((void *)this + 583);
}

uint64_t Madusa::Session::GetNotificationParam(Madusa::Session *this)
{
  return *((void *)this + 14);
}

uint64_t Madusa::Session::UnlockSecureParams(uint64_t this)
{
  int v1 = *(_DWORD *)(this + 132);
  if (*(_DWORD *)(this + 4748) == v1)
  {
    *(unsigned char *)(this + 4746) = 0;
    if (*(_DWORD *)(this + 4724) != v1)
    {
LABEL_3:
      if (*(_DWORD *)(this + 4772) != v1) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if (*(_DWORD *)(this + 4724) != v1)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(this + 4722) = 0;
  if (*(_DWORD *)(this + 4772) != v1)
  {
LABEL_4:
    if (*(_DWORD *)(this + 4796) != v1) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  *(unsigned char *)(this + 4770) = 0;
  if (*(_DWORD *)(this + 4796) != v1)
  {
LABEL_5:
    if (*(_DWORD *)(this + 4820) != v1) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  *(unsigned char *)(this + 4794) = 0;
  if (*(_DWORD *)(this + 4820) != v1)
  {
LABEL_6:
    if (*(_DWORD *)(this + 4844) != v1) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  *(unsigned char *)(this + 4818) = 0;
  if (*(_DWORD *)(this + 4844) != v1)
  {
LABEL_7:
    if (*(_DWORD *)(this + 4868) != v1) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  *(unsigned char *)(this + 4842) = 0;
  if (*(_DWORD *)(this + 4868) != v1)
  {
LABEL_8:
    if (*(_DWORD *)(this + 4892) != v1) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  *(unsigned char *)(this + 4866) = 0;
  if (*(_DWORD *)(this + 4892) != v1)
  {
LABEL_9:
    if (*(_DWORD *)(this + 4916) != v1) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  *(unsigned char *)(this + 4890) = 0;
  if (*(_DWORD *)(this + 4916) != v1)
  {
LABEL_10:
    if (*(_DWORD *)(this + 4940) != v1) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  *(unsigned char *)(this + 4914) = 0;
  if (*(_DWORD *)(this + 4940) != v1)
  {
LABEL_11:
    if (*(_DWORD *)(this + 4988) != v1) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  *(unsigned char *)(this + 4938) = 0;
  if (*(_DWORD *)(this + 4988) != v1)
  {
LABEL_12:
    if (*(_DWORD *)(this + 5012) != v1) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
LABEL_26:
  *(unsigned char *)(this + 4986) = 0;
  if (*(_DWORD *)(this + 5012) != v1)
  {
LABEL_13:
    if (*(_DWORD *)(this + 5036) != v1) {
      goto LABEL_14;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(unsigned char *)(this + 5010) = 0;
  if (*(_DWORD *)(this + 5036) != v1)
  {
LABEL_14:
    if (*(_DWORD *)(this + 4964) != v1) {
      return this;
    }
LABEL_29:
    *(unsigned char *)(this + 4962) = 0;
    return this;
  }
LABEL_28:
  *(unsigned char *)(this + 5034) = 0;
  if (*(_DWORD *)(this + 4964) == v1) {
    goto LABEL_29;
  }
  return this;
}

uint64_t Madusa::Session::IncrementLevel(uint64_t this)
{
  int v1 = *(_DWORD *)(this + 132);
  if (v1 != -1) {
    *(_DWORD *)(this + 132) = v1 + 1;
  }
  return this;
}

uint64_t Madusa::Session::DecrementLevel(uint64_t this)
{
  unint64_t v1 = *(unsigned int *)(this + 132) - 1;
  if (!HIDWORD(v1)) {
    *(_DWORD *)(this + 132) = v1;
  }
  return this;
}

uint64_t Madusa::Session::ValidateSecureParams(uint64_t this, _t_zn_IMAGEPARAMS *a2)
{
  if (a2)
  {
    if (*(unsigned char *)(this + 4744))
    {
      int v2 = *(_DWORD *)(this + 4728);
      if (v2 == a2->nHeight)
      {
        unint64_t v3 = *(_DWORD **)(this + 4736);
        if (!v3 || *v3 == v2)
        {
LABEL_6:
          int v4 = 0;
          float32x4_t v5 = *(int **)(this + 4736);
          if (!v5)
          {
LABEL_11:
            if (*(unsigned char *)(this + 4720))
            {
              int v6 = *(_DWORD *)(this + 4704);
              if (v6 == a2->nWidth)
              {
                int v7 = *(_DWORD **)(this + 4712);
                if (!v7 || *v7 == v6)
                {
LABEL_15:
                  int v8 = 0;
                  int v9 = *(int **)(this + 4712);
                  if (!v9)
                  {
LABEL_20:
                    if (*(unsigned char *)(this + 4768))
                    {
                      int v10 = *(_DWORD *)(this + 4752);
                      if (v10 == a2->nXDotsPerInch)
                      {
                        BOOL v11 = *(_DWORD **)(this + 4760);
                        if (!v11 || *v11 == v10)
                        {
LABEL_24:
                          int v12 = 0;
                          fenv_t v13 = *(int **)(this + 4760);
                          if (!v13)
                          {
LABEL_29:
                            if (*(unsigned char *)(this + 4792))
                            {
                              int v14 = *(_DWORD *)(this + 4776);
                              if (v14 == a2->nYDotsPerInch)
                              {
                                int v15 = *(_DWORD **)(this + 4784);
                                if (!v15 || *v15 == v14)
                                {
LABEL_33:
                                  int v16 = 0;
                                  unint64_t v17 = *(int **)(this + 4784);
                                  if (!v17)
                                  {
LABEL_38:
                                    if (*(unsigned char *)(this + 4816))
                                    {
                                      int v18 = *(_DWORD *)(this + 4800);
                                      if (v18 == a2->ColorModel)
                                      {
                                        int v19 = *(_DWORD **)(this + 4808);
                                        if (!v19 || *v19 == v18)
                                        {
LABEL_42:
                                          int v20 = 0;
                                          float32x4_t v21 = *(int **)(this + 4808);
                                          if (!v21)
                                          {
LABEL_47:
                                            if (*(unsigned char *)(this + 4840))
                                            {
                                              int v22 = *(_DWORD *)(this + 4824);
                                              if (v22 == a2->bAlphaChannel)
                                              {
                                                float32_t v23 = *(_DWORD **)(this + 4832);
                                                if (!v23 || *v23 == v22)
                                                {
LABEL_51:
                                                  int v24 = 0;
                                                  uint64_t v25 = *(int **)(this + 4832);
                                                  if (!v25)
                                                  {
LABEL_56:
                                                    if (*(unsigned char *)(this + 4864))
                                                    {
                                                      int v26 = *(_DWORD *)(this + 4848);
                                                      if (v26 == a2->nBitsPerPixelPerColor)
                                                      {
                                                        BOOL v27 = *(_DWORD **)(this + 4856);
                                                        if (!v27 || *v27 == v26)
                                                        {
LABEL_60:
                                                          int v28 = 0;
                                                          float v29 = *(int **)(this + 4856);
                                                          if (!v29)
                                                          {
LABEL_65:
                                                            if (*(unsigned char *)(this + 4888))
                                                            {
                                                              int v30 = *(_DWORD *)(this + 4872);
                                                              if (v30 == a2->DataType)
                                                              {
                                                                float32x4_t v31 = *(_DWORD **)(this + 4880);
                                                                if (!v31 || *v31 == v30)
                                                                {
LABEL_69:
                                                                  int v32 = 0;
                                                                  float32x4_t v33 = *(int **)(this + 4880);
                                                                  if (!v33)
                                                                  {
LABEL_74:
                                                                    int v34 = v8 + v4;
                                                                    if (*(unsigned char *)(this + 4912))
                                                                    {
                                                                      int v35 = *(_DWORD *)(this + 4896);
                                                                      if (v35 == a2->PaletteColorModel)
                                                                      {
                                                                        float32x4_t v36 = *(_DWORD **)(this + 4904);
                                                                        if (!v36 || *v36 == v35)
                                                                        {
LABEL_78:
                                                                          int v37 = 0;
                                                                          int v38 = v34 + v12;
                                                                          float32x4_t v39 = *(int **)(this + 4904);
                                                                          if (!v39)
                                                                          {
LABEL_83:
                                                                            int v40 = v38 + v16;
                                                                            if (*(unsigned char *)(this + 4936))
                                                                            {
                                                                              int v41 = *(_DWORD *)(this + 4920);
                                                                              if (v41 == a2->nPaletteBitsPerPixelPerColor)
                                                                              {
                                                                                float32x4_t v42 = *(_DWORD **)(this + 4928);
                                                                                if (!v42 || *v42 == v41)
                                                                                {
LABEL_87:
                                                                                  int v43 = 0;
                                                                                  int v44 = v40 + v20;
                                                                                  uint64_t v45 = *(int **)(this + 4928);
                                                                                  if (!v45)
                                                                                  {
LABEL_92:
                                                                                    int v46 = v44 + v24;
                                                                                    if (*(unsigned char *)(this + 4984))
                                                                                    {
                                                                                      int v47 = *(_DWORD *)(this + 4968);
                                                                                      if (v47 == a2->DataAccessFormat)
                                                                                      {
                                                                                        int v48 = *(_DWORD **)(this + 4976);
                                                                                        if (!v48 || *v48 == v47)
                                                                                        {
LABEL_96:
                                                                                          int v49 = 0;
                                                                                          int v50 = v46 + v28;
                                                                                          int v51 = *(int **)(this + 4976);
                                                                                          if (!v51)
                                                                                          {
LABEL_101:
                                                                                            int v52 = v50 + v32;
                                                                                            if (*(unsigned char *)(this + 5008))
                                                                                            {
                                                                                              int v53 = *(_DWORD *)(this + 4992);
                                                                                              if (v53 == a2->nXStride)
                                                                                              {
                                                                                                int v54 = *(_DWORD **)(this + 5000);
                                                                                                if (!v54 || *v54 == v53)
                                                                                                {
LABEL_105:
                                                                                                  int v55 = 0;
                                                                                                  int v56 = v52 + v37;
                                                                                                  uint64_t v57 = *(int **)(this + 5000);
                                                                                                  if (!v57)
                                                                                                  {
LABEL_110:
                                                                                                    int v58 = v56 + v43;
                                                                                                    if (*(unsigned char *)(this + 5032))
                                                                                                    {
                                                                                                      int v59 = *(_DWORD *)(this + 5016);
                                                                                                      if (v59 == a2->nYStride)
                                                                                                      {
                                                                                                        uint64_t v60 = *(_DWORD **)(this + 5024);
                                                                                                        if (!v60 || *v60 == v59)
                                                                                                        {
LABEL_114:
                                                                                                          int v61 = 0;
                                                                                                          int v62 = v58 + v49;
                                                                                                          BOOL v63 = *(int **)(this + 5024);
                                                                                                          if (!v63)
                                                                                                          {
LABEL_119:
                                                                                                            int v64 = v62 + v55;
                                                                                                            if (*(unsigned char *)(this + 4960))
                                                                                                            {
                                                                                                              int v65 = *(_DWORD *)(this + 4944);
                                                                                                              if (v65 == a2->bInverted)
                                                                                                              {
                                                                                                                float v66 = *(_DWORD **)(this + 4952);
                                                                                                                if (!v66 || *v66 == v65)
                                                                                                                {
LABEL_123:
                                                                                                                  int v67 = 0;
                                                                                                                  int v68 = v64 + v61;
                                                                                                                  int v69 = *(int **)(this + 4952);
                                                                                                                  if (!v69)
                                                                                                                  {
LABEL_128:
                                                                                                                    if (v68 == v67) {
                                                                                                                      return this;
                                                                                                                    }
                                                                                                                    goto LABEL_129;
                                                                                                                  }
LABEL_127:
                                                                                                                  *int v69 = a2->bInverted;
                                                                                                                  goto LABEL_128;
                                                                                                                }
                                                                                                              }
                                                                                                            }
                                                                                                            else if (!*(unsigned char *)(this + 4961))
                                                                                                            {
                                                                                                              goto LABEL_123;
                                                                                                            }
                                                                                                            int v67 = -1;
                                                                                                            int v68 = v64 + v61;
                                                                                                            int v69 = *(int **)(this + 4952);
                                                                                                            if (!v69) {
                                                                                                              goto LABEL_128;
                                                                                                            }
                                                                                                            goto LABEL_127;
                                                                                                          }
LABEL_118:
                                                                                                          *BOOL v63 = a2->nYStride;
                                                                                                          goto LABEL_119;
                                                                                                        }
                                                                                                      }
                                                                                                    }
                                                                                                    else if (!*(unsigned char *)(this + 5033))
                                                                                                    {
                                                                                                      goto LABEL_114;
                                                                                                    }
                                                                                                    int v61 = 1;
                                                                                                    int v62 = v58 + v49;
                                                                                                    BOOL v63 = *(int **)(this + 5024);
                                                                                                    if (!v63) {
                                                                                                      goto LABEL_119;
                                                                                                    }
                                                                                                    goto LABEL_118;
                                                                                                  }
LABEL_109:
                                                                                                  *uint64_t v57 = a2->nXStride;
                                                                                                  goto LABEL_110;
                                                                                                }
                                                                                              }
                                                                                            }
                                                                                            else if (!*(unsigned char *)(this + 5009))
                                                                                            {
                                                                                              goto LABEL_105;
                                                                                            }
                                                                                            int v55 = 1;
                                                                                            int v56 = v52 + v37;
                                                                                            uint64_t v57 = *(int **)(this + 5000);
                                                                                            if (!v57) {
                                                                                              goto LABEL_110;
                                                                                            }
                                                                                            goto LABEL_109;
                                                                                          }
LABEL_100:
                                                                                          *int v51 = a2->DataAccessFormat;
                                                                                          goto LABEL_101;
                                                                                        }
                                                                                      }
                                                                                    }
                                                                                    else if (!*(unsigned char *)(this + 4985))
                                                                                    {
                                                                                      goto LABEL_96;
                                                                                    }
                                                                                    int v49 = 1;
                                                                                    int v50 = v46 + v28;
                                                                                    int v51 = *(int **)(this + 4976);
                                                                                    if (!v51) {
                                                                                      goto LABEL_101;
                                                                                    }
                                                                                    goto LABEL_100;
                                                                                  }
LABEL_91:
                                                                                  *uint64_t v45 = a2->nPaletteBitsPerPixelPerColor;
                                                                                  goto LABEL_92;
                                                                                }
                                                                              }
                                                                            }
                                                                            else if (!*(unsigned char *)(this + 4937))
                                                                            {
                                                                              goto LABEL_87;
                                                                            }
                                                                            int v43 = 1;
                                                                            int v44 = v40 + v20;
                                                                            uint64_t v45 = *(int **)(this + 4928);
                                                                            if (!v45) {
                                                                              goto LABEL_92;
                                                                            }
                                                                            goto LABEL_91;
                                                                          }
LABEL_82:
                                                                          int *v39 = a2->PaletteColorModel;
                                                                          goto LABEL_83;
                                                                        }
                                                                      }
                                                                    }
                                                                    else if (!*(unsigned char *)(this + 4913))
                                                                    {
                                                                      goto LABEL_78;
                                                                    }
                                                                    int v37 = 1;
                                                                    int v38 = v34 + v12;
                                                                    float32x4_t v39 = *(int **)(this + 4904);
                                                                    if (!v39) {
                                                                      goto LABEL_83;
                                                                    }
                                                                    goto LABEL_82;
                                                                  }
LABEL_73:
                                                                  *float32x4_t v33 = a2->DataType;
                                                                  goto LABEL_74;
                                                                }
                                                              }
                                                            }
                                                            else if (!*(unsigned char *)(this + 4889))
                                                            {
                                                              goto LABEL_69;
                                                            }
                                                            int v32 = 1;
                                                            float32x4_t v33 = *(int **)(this + 4880);
                                                            if (!v33) {
                                                              goto LABEL_74;
                                                            }
                                                            goto LABEL_73;
                                                          }
LABEL_64:
                                                          *float v29 = a2->nBitsPerPixelPerColor;
                                                          goto LABEL_65;
                                                        }
                                                      }
                                                    }
                                                    else if (!*(unsigned char *)(this + 4865))
                                                    {
                                                      goto LABEL_60;
                                                    }
                                                    int v28 = 1;
                                                    float v29 = *(int **)(this + 4856);
                                                    if (!v29) {
                                                      goto LABEL_65;
                                                    }
                                                    goto LABEL_64;
                                                  }
LABEL_55:
                                                  *uint64_t v25 = a2->bAlphaChannel;
                                                  goto LABEL_56;
                                                }
                                              }
                                            }
                                            else if (!*(unsigned char *)(this + 4841))
                                            {
                                              goto LABEL_51;
                                            }
                                            int v24 = 1;
                                            uint64_t v25 = *(int **)(this + 4832);
                                            if (!v25) {
                                              goto LABEL_56;
                                            }
                                            goto LABEL_55;
                                          }
LABEL_46:
                                          *float32x4_t v21 = a2->ColorModel;
                                          goto LABEL_47;
                                        }
                                      }
                                    }
                                    else if (!*(unsigned char *)(this + 4817))
                                    {
                                      goto LABEL_42;
                                    }
                                    int v20 = 1;
                                    float32x4_t v21 = *(int **)(this + 4808);
                                    if (!v21) {
                                      goto LABEL_47;
                                    }
                                    goto LABEL_46;
                                  }
LABEL_37:
                                  *unint64_t v17 = a2->nYDotsPerInch;
                                  goto LABEL_38;
                                }
                              }
                            }
                            else if (!*(unsigned char *)(this + 4793))
                            {
                              goto LABEL_33;
                            }
                            int v16 = 1;
                            unint64_t v17 = *(int **)(this + 4784);
                            if (!v17) {
                              goto LABEL_38;
                            }
                            goto LABEL_37;
                          }
LABEL_28:
                          int *v13 = a2->nXDotsPerInch;
                          goto LABEL_29;
                        }
                      }
                    }
                    else if (!*(unsigned char *)(this + 4769))
                    {
                      goto LABEL_24;
                    }
                    int v12 = 1;
                    fenv_t v13 = *(int **)(this + 4760);
                    if (!v13) {
                      goto LABEL_29;
                    }
                    goto LABEL_28;
                  }
LABEL_19:
                  *int v9 = a2->nWidth;
                  goto LABEL_20;
                }
              }
            }
            else if (!*(unsigned char *)(this + 4721))
            {
              goto LABEL_15;
            }
            int v8 = 1;
            int v9 = *(int **)(this + 4712);
            if (!v9) {
              goto LABEL_20;
            }
            goto LABEL_19;
          }
LABEL_10:
          int *v5 = a2->nHeight;
          goto LABEL_11;
        }
      }
    }
    else if (!*(unsigned char *)(this + 4745))
    {
      goto LABEL_6;
    }
    int v4 = 1;
    float32x4_t v5 = *(int **)(this + 4736);
    if (!v5) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_129:
  *(unsigned char *)(this + 128) = 0;
  return this;
}

uint64_t Madusa::Session::ValidateSequence(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 + 2664;
  uint64_t func = (uint64_t (*)(uint64_t, uint64_t))__find_func(0xEFBFFFDF60602080, 17039370);

  return func(v3, a2);
}

uint64_t Madusa::Session::_ValidateSequence(uint64_t a1, uint64_t a2)
{
  if ((*v2 & 0x1F) != 0 || v2[2] > 0x3Fu)
  {
    int v3 = QuickCodec::mask;
    if (QuickCodec::mask != -70947757) {
LABEL_10:
    }
      QuickCodec::mask = v3 + 1;
  }
  else
  {
    int v3 = QuickCodec::mask;
    if (v2[3] == 212 || QuickCodec::mask != -70947757) {
      goto LABEL_10;
    }
  }
  return Madusa::Session::ValidateSequence(a1, a2);
}

uint64_t Madusa::Session::Acknowledge(Madusa::Session *this, int a2, void (*a3)(unsigned int, void *), void *a4)
{
  CConfigFPU::CConfigFPU((CConfigFPU *)&v15);
  unsigned int v14 = 0;
  uint64_t func = (uint64_t (*)(char *, unsigned int *))__find_func(0xBF9FFFDF40C0A000, 1361313802);
  uint64_t v9 = func((char *)this + 2664, &v14);
  if (!v9)
  {
    int v10 = (unsigned int (*)(char *))__find_func(0x5FBF5FBF404020D0, -1325096854);
    if (v10((char *)this + 136) != a2) {
      *((unsigned char *)this + 128) = 0;
    }
    if (a3)
    {
      CConfigFPU::ConfigForUserCode((CConfigFPU *)&v15);
      BOOL v11 = (uint64_t (*)(char *, void))__find_func(0x7F3F1FDFC0C00030, -1853562870);
      uint64_t v12 = v11((char *)this + 136, v14);
      a3(v12, a4);
      CConfigFPU::ConfigForSDKCode((CConfigFPU *)&v15);
    }
    if (*((unsigned char *)this + 128)) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = 4294967195;
    }
  }
  CConfigFPU::~CConfigFPU((CConfigFPU *)&v15);
  return v9;
}

unsigned char *Madusa::Session::SetStorageRequirements(unsigned char *this, int a2)
{
  if ((a2 & 0x80000000) == 0) {
    this[4721] = 1;
  }
  if ((a2 & 0x40000000) != 0)
  {
    if ((a2 & 0x20000000) != 0) {
      goto LABEL_5;
    }
  }
  else
  {
    this[4745] = 1;
    if ((a2 & 0x20000000) != 0)
    {
LABEL_5:
      if ((a2 & 0x10000000) != 0) {
        goto LABEL_6;
      }
      goto LABEL_19;
    }
  }
  this[4769] = 1;
  if ((a2 & 0x10000000) != 0)
  {
LABEL_6:
    if ((a2 & 0x8000000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  this[4793] = 1;
  if ((a2 & 0x8000000) != 0)
  {
LABEL_7:
    if ((a2 & 0x4000000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  this[4817] = 1;
  if ((a2 & 0x4000000) != 0)
  {
LABEL_8:
    if ((a2 & 0x2000000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  this[4841] = 1;
  if ((a2 & 0x2000000) != 0)
  {
LABEL_9:
    if ((a2 & 0x1000000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  this[4865] = 1;
  if ((a2 & 0x1000000) != 0)
  {
LABEL_10:
    if ((a2 & 0x800000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  this[4889] = 1;
  if ((a2 & 0x800000) != 0)
  {
LABEL_11:
    if ((a2 & 0x400000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  this[4913] = 1;
  if ((a2 & 0x400000) != 0)
  {
LABEL_12:
    if ((a2 & 0x200000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_26;
  }
LABEL_25:
  this[4937] = 1;
  if ((a2 & 0x200000) != 0)
  {
LABEL_13:
    if ((a2 & 0x100000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_27;
  }
LABEL_26:
  this[4961] = 1;
  if ((a2 & 0x100000) != 0)
  {
LABEL_14:
    if ((a2 & 0x80000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_28;
  }
LABEL_27:
  this[4985] = 1;
  if ((a2 & 0x80000) != 0)
  {
LABEL_15:
    if ((a2 & 0x40000) != 0) {
      return this;
    }
LABEL_29:
    this[5033] = 1;
    return this;
  }
LABEL_28:
  this[5009] = 1;
  if ((a2 & 0x40000) == 0) {
    goto LABEL_29;
  }
  return this;
}

uint64_t Madusa::Session::StoreWidth(Madusa::Session *this, uint64_t a2)
{
  int v2 = *((_DWORD *)this + 33);
  if (*((unsigned char *)this + 4720) && *((unsigned char *)this + 4722)) {
    return *((unsigned int *)this + 1176);
  }
  *((_WORD *)this + 2360) = 257;
  *((_DWORD *)this + 1176) = a2;
  *((unsigned char *)this + 4722) = 1;
  *((_DWORD *)this + 1181) = v2;
  return a2;
}

uint64_t Madusa::Session::StoreHeight(Madusa::Session *this, uint64_t a2)
{
  int v2 = *((_DWORD *)this + 33);
  if (*((unsigned char *)this + 4744) && *((unsigned char *)this + 4746)) {
    return *((unsigned int *)this + 1182);
  }
  *((_WORD *)this + 2372) = 257;
  *((_DWORD *)this + 1182) = a2;
  *((unsigned char *)this + 4746) = 1;
  *((_DWORD *)this + 1187) = v2;
  return a2;
}

uint64_t Madusa::Session::StoreXDotsPerInch(Madusa::Session *this, uint64_t a2)
{
  int v2 = *((_DWORD *)this + 33);
  if (*((unsigned char *)this + 4768) && *((unsigned char *)this + 4770)) {
    return *((unsigned int *)this + 1188);
  }
  *((_WORD *)this + 2384) = 257;
  *((_DWORD *)this + 1188) = a2;
  *((unsigned char *)this + 4770) = 1;
  *((_DWORD *)this + 1193) = v2;
  return a2;
}

uint64_t Madusa::Session::StoreYDotsPerInch(Madusa::Session *this, uint64_t a2)
{
  int v2 = *((_DWORD *)this + 33);
  if (*((unsigned char *)this + 4792) && *((unsigned char *)this + 4794)) {
    return *((unsigned int *)this + 1194);
  }
  *((_WORD *)this + 2396) = 257;
  *((_DWORD *)this + 1194) = a2;
  *((unsigned char *)this + 4794) = 1;
  *((_DWORD *)this + 1199) = v2;
  return a2;
}

uint64_t Madusa::Session::StoreColorModel(Madusa::Session *this, uint64_t a2)
{
  int v2 = *((_DWORD *)this + 33);
  if (*((unsigned char *)this + 4816) && *((unsigned char *)this + 4818)) {
    return *((unsigned int *)this + 1200);
  }
  *((_WORD *)this + 2408) = 257;
  *((_DWORD *)this + 1200) = a2;
  *((unsigned char *)this + 4818) = 1;
  *((_DWORD *)this + 1205) = v2;
  return a2;
}

uint64_t Madusa::Session::StoreAlphaChannel(Madusa::Session *this, uint64_t a2)
{
  int v2 = *((_DWORD *)this + 33);
  if (*((unsigned char *)this + 4840) && *((unsigned char *)this + 4842)) {
    return *((unsigned int *)this + 1206);
  }
  *((_WORD *)this + 2420) = 257;
  *((_DWORD *)this + 1206) = a2;
  *((unsigned char *)this + 4842) = 1;
  *((_DWORD *)this + 1211) = v2;
  return a2;
}

uint64_t Madusa::Session::StoreBitsPerPixelPerColor(Madusa::Session *this, uint64_t a2)
{
  int v2 = *((_DWORD *)this + 33);
  if (*((unsigned char *)this + 4864) && *((unsigned char *)this + 4866)) {
    return *((unsigned int *)this + 1212);
  }
  *((_WORD *)this + 2432) = 257;
  *((_DWORD *)this + 1212) = a2;
  *((unsigned char *)this + 4866) = 1;
  *((_DWORD *)this + 1217) = v2;
  return a2;
}

uint64_t Madusa::Session::StoreDataType(Madusa::Session *this, uint64_t a2)
{
  int v2 = *((_DWORD *)this + 33);
  if (*((unsigned char *)this + 4888) && *((unsigned char *)this + 4890)) {
    return *((unsigned int *)this + 1218);
  }
  *((_WORD *)this + 2444) = 257;
  *((_DWORD *)this + 1218) = a2;
  *((unsigned char *)this + 4890) = 1;
  *((_DWORD *)this + 1223) = v2;
  return a2;
}

uint64_t Madusa::Session::StorePaletteColorModel(Madusa::Session *this, uint64_t a2)
{
  int v2 = *((_DWORD *)this + 33);
  if (*((unsigned char *)this + 4912) && *((unsigned char *)this + 4914)) {
    return *((unsigned int *)this + 1224);
  }
  *((_WORD *)this + 2456) = 257;
  *((_DWORD *)this + 1224) = a2;
  *((unsigned char *)this + 4914) = 1;
  *((_DWORD *)this + 1229) = v2;
  return a2;
}

uint64_t Madusa::Session::StorePaletteBitsPerPixelPerColor(Madusa::Session *this, uint64_t a2)
{
  int v2 = *((_DWORD *)this + 33);
  if (*((unsigned char *)this + 4936) && *((unsigned char *)this + 4938)) {
    return *((unsigned int *)this + 1230);
  }
  *((_WORD *)this + 2468) = 257;
  *((_DWORD *)this + 1230) = a2;
  *((unsigned char *)this + 4938) = 1;
  *((_DWORD *)this + 1235) = v2;
  return a2;
}

uint64_t Madusa::Session::StoreInverted(Madusa::Session *this, uint64_t a2)
{
  int v2 = *((_DWORD *)this + 33);
  if (*((unsigned char *)this + 4960) && *((unsigned char *)this + 4962)) {
    return *((unsigned int *)this + 1236);
  }
  *((_WORD *)this + 2480) = 257;
  *((_DWORD *)this + 1236) = a2;
  *((unsigned char *)this + 4962) = 1;
  *((_DWORD *)this + 1241) = v2;
  return a2;
}

uint64_t Madusa::Session::StoreDataAccessFormat(Madusa::Session *this, uint64_t a2)
{
  int v2 = *((_DWORD *)this + 33);
  if (*((unsigned char *)this + 4984) && *((unsigned char *)this + 4986)) {
    return *((unsigned int *)this + 1242);
  }
  *((_WORD *)this + 2492) = 257;
  *((_DWORD *)this + 1242) = a2;
  *((unsigned char *)this + 4986) = 1;
  *((_DWORD *)this + 1247) = v2;
  return a2;
}

uint64_t Madusa::Session::StoreXStride(Madusa::Session *this, uint64_t a2)
{
  int v2 = *((_DWORD *)this + 33);
  if (*((unsigned char *)this + 5008) && *((unsigned char *)this + 5010)) {
    return *((unsigned int *)this + 1248);
  }
  *((_WORD *)this + 2504) = 257;
  *((_DWORD *)this + 1248) = a2;
  *((unsigned char *)this + 5010) = 1;
  *((_DWORD *)this + 1253) = v2;
  return a2;
}

uint64_t Madusa::Session::StoreYStride(Madusa::Session *this, uint64_t a2)
{
  int v2 = *((_DWORD *)this + 33);
  if (*((unsigned char *)this + 5032) && *((unsigned char *)this + 5034)) {
    return *((unsigned int *)this + 1254);
  }
  *((_WORD *)this + 2516) = 257;
  *((_DWORD *)this + 1254) = a2;
  *((unsigned char *)this + 5034) = 1;
  *((_DWORD *)this + 1259) = v2;
  return a2;
}

uint64_t Madusa::Session::AssignWidth(uint64_t this, int *a2, int a3)
{
  int v3 = (_WORD *)(this + 4720);
  int v4 = *(_DWORD *)(this + 132);
  *(void *)(this + 4712) = a2;
  if (a2)
  {
    if (*(unsigned char *)(this + 4720) && *(unsigned char *)(this + 4722))
    {
      *a2 = *(_DWORD *)(this + 4704);
    }
    else
    {
      _WORD *v3 = 257;
      *(_DWORD *)(this + 4704) = a3;
      *(unsigned char *)(this + 4722) = 1;
      *(_DWORD *)(this + 4724) = v4;
      *a2 = a3;
    }
  }
  else if (!*(unsigned char *)(this + 4720) || !*(unsigned char *)(this + 4722))
  {
    _WORD *v3 = 257;
    *(_DWORD *)(this + 4704) = a3;
    *(unsigned char *)(this + 4722) = 1;
    *(_DWORD *)(this + 4724) = v4;
  }
  return this;
}

uint64_t Madusa::Session::AssignHeight(uint64_t this, int *a2, int a3)
{
  int v3 = (_WORD *)(this + 4744);
  int v4 = *(_DWORD *)(this + 132);
  *(void *)(this + 4736) = a2;
  if (a2)
  {
    if (*(unsigned char *)(this + 4744) && *(unsigned char *)(this + 4746))
    {
      *a2 = *(_DWORD *)(this + 4728);
    }
    else
    {
      _WORD *v3 = 257;
      *(_DWORD *)(this + 4728) = a3;
      *(unsigned char *)(this + 4746) = 1;
      *(_DWORD *)(this + 4748) = v4;
      *a2 = a3;
    }
  }
  else if (!*(unsigned char *)(this + 4744) || !*(unsigned char *)(this + 4746))
  {
    _WORD *v3 = 257;
    *(_DWORD *)(this + 4728) = a3;
    *(unsigned char *)(this + 4746) = 1;
    *(_DWORD *)(this + 4748) = v4;
  }
  return this;
}

uint64_t Madusa::Session::AssignXDotsPerInch(uint64_t this, int *a2, int a3)
{
  int v3 = (_WORD *)(this + 4768);
  int v4 = *(_DWORD *)(this + 132);
  *(void *)(this + 4760) = a2;
  if (a2)
  {
    if (*(unsigned char *)(this + 4768) && *(unsigned char *)(this + 4770))
    {
      *a2 = *(_DWORD *)(this + 4752);
    }
    else
    {
      _WORD *v3 = 257;
      *(_DWORD *)(this + 4752) = a3;
      *(unsigned char *)(this + 4770) = 1;
      *(_DWORD *)(this + 4772) = v4;
      *a2 = a3;
    }
  }
  else if (!*(unsigned char *)(this + 4768) || !*(unsigned char *)(this + 4770))
  {
    _WORD *v3 = 257;
    *(_DWORD *)(this + 4752) = a3;
    *(unsigned char *)(this + 4770) = 1;
    *(_DWORD *)(this + 4772) = v4;
  }
  return this;
}

uint64_t Madusa::Session::AssignYDotsPerInch(uint64_t this, int *a2, int a3)
{
  int v3 = (_WORD *)(this + 4792);
  int v4 = *(_DWORD *)(this + 132);
  *(void *)(this + 4784) = a2;
  if (a2)
  {
    if (*(unsigned char *)(this + 4792) && *(unsigned char *)(this + 4794))
    {
      *a2 = *(_DWORD *)(this + 4776);
    }
    else
    {
      _WORD *v3 = 257;
      *(_DWORD *)(this + 4776) = a3;
      *(unsigned char *)(this + 4794) = 1;
      *(_DWORD *)(this + 4796) = v4;
      *a2 = a3;
    }
  }
  else if (!*(unsigned char *)(this + 4792) || !*(unsigned char *)(this + 4794))
  {
    _WORD *v3 = 257;
    *(_DWORD *)(this + 4776) = a3;
    *(unsigned char *)(this + 4794) = 1;
    *(_DWORD *)(this + 4796) = v4;
  }
  return this;
}

uint64_t Madusa::Session::AssignColorModel(uint64_t this, int *a2, int a3)
{
  int v3 = (_WORD *)(this + 4816);
  int v4 = *(_DWORD *)(this + 132);
  *(void *)(this + 4808) = a2;
  if (a2)
  {
    if (*(unsigned char *)(this + 4816) && *(unsigned char *)(this + 4818))
    {
      *a2 = *(_DWORD *)(this + 4800);
    }
    else
    {
      _WORD *v3 = 257;
      *(_DWORD *)(this + 4800) = a3;
      *(unsigned char *)(this + 4818) = 1;
      *(_DWORD *)(this + 4820) = v4;
      *a2 = a3;
    }
  }
  else if (!*(unsigned char *)(this + 4816) || !*(unsigned char *)(this + 4818))
  {
    _WORD *v3 = 257;
    *(_DWORD *)(this + 4800) = a3;
    *(unsigned char *)(this + 4818) = 1;
    *(_DWORD *)(this + 4820) = v4;
  }
  return this;
}

uint64_t Madusa::Session::AssignAlphaChannel(uint64_t this, int *a2, int a3)
{
  int v3 = (_WORD *)(this + 4840);
  int v4 = *(_DWORD *)(this + 132);
  *(void *)(this + 4832) = a2;
  if (a2)
  {
    if (*(unsigned char *)(this + 4840) && *(unsigned char *)(this + 4842))
    {
      *a2 = *(_DWORD *)(this + 4824);
    }
    else
    {
      _WORD *v3 = 257;
      *(_DWORD *)(this + 4824) = a3;
      *(unsigned char *)(this + 4842) = 1;
      *(_DWORD *)(this + 4844) = v4;
      *a2 = a3;
    }
  }
  else if (!*(unsigned char *)(this + 4840) || !*(unsigned char *)(this + 4842))
  {
    _WORD *v3 = 257;
    *(_DWORD *)(this + 4824) = a3;
    *(unsigned char *)(this + 4842) = 1;
    *(_DWORD *)(this + 4844) = v4;
  }
  return this;
}

uint64_t Madusa::Session::AssignBitsPerPixelPerColor(uint64_t this, int *a2, int a3)
{
  int v3 = (_WORD *)(this + 4864);
  int v4 = *(_DWORD *)(this + 132);
  *(void *)(this + 4856) = a2;
  if (a2)
  {
    if (*(unsigned char *)(this + 4864) && *(unsigned char *)(this + 4866))
    {
      *a2 = *(_DWORD *)(this + 4848);
    }
    else
    {
      _WORD *v3 = 257;
      *(_DWORD *)(this + 4848) = a3;
      *(unsigned char *)(this + 4866) = 1;
      *(_DWORD *)(this + 4868) = v4;
      *a2 = a3;
    }
  }
  else if (!*(unsigned char *)(this + 4864) || !*(unsigned char *)(this + 4866))
  {
    _WORD *v3 = 257;
    *(_DWORD *)(this + 4848) = a3;
    *(unsigned char *)(this + 4866) = 1;
    *(_DWORD *)(this + 4868) = v4;
  }
  return this;
}

uint64_t Madusa::Session::AssignDataType(uint64_t this, int *a2, int a3)
{
  int v3 = (_WORD *)(this + 4888);
  int v4 = *(_DWORD *)(this + 132);
  *(void *)(this + 4880) = a2;
  if (a2)
  {
    if (*(unsigned char *)(this + 4888) && *(unsigned char *)(this + 4890))
    {
      *a2 = *(_DWORD *)(this + 4872);
    }
    else
    {
      _WORD *v3 = 257;
      *(_DWORD *)(this + 4872) = a3;
      *(unsigned char *)(this + 4890) = 1;
      *(_DWORD *)(this + 4892) = v4;
      *a2 = a3;
    }
  }
  else if (!*(unsigned char *)(this + 4888) || !*(unsigned char *)(this + 4890))
  {
    _WORD *v3 = 257;
    *(_DWORD *)(this + 4872) = a3;
    *(unsigned char *)(this + 4890) = 1;
    *(_DWORD *)(this + 4892) = v4;
  }
  return this;
}

uint64_t Madusa::Session::AssignPaletteColorModel(uint64_t this, int *a2, int a3)
{
  int v3 = (_WORD *)(this + 4912);
  int v4 = *(_DWORD *)(this + 132);
  *(void *)(this + 4904) = a2;
  if (a2)
  {
    if (*(unsigned char *)(this + 4912) && *(unsigned char *)(this + 4914))
    {
      *a2 = *(_DWORD *)(this + 4896);
    }
    else
    {
      _WORD *v3 = 257;
      *(_DWORD *)(this + 4896) = a3;
      *(unsigned char *)(this + 4914) = 1;
      *(_DWORD *)(this + 4916) = v4;
      *a2 = a3;
    }
  }
  else if (!*(unsigned char *)(this + 4912) || !*(unsigned char *)(this + 4914))
  {
    _WORD *v3 = 257;
    *(_DWORD *)(this + 4896) = a3;
    *(unsigned char *)(this + 4914) = 1;
    *(_DWORD *)(this + 4916) = v4;
  }
  return this;
}

uint64_t Madusa::Session::AssignPaletteBitsPerPixelPerColor(uint64_t this, int *a2, int a3)
{
  int v3 = (_WORD *)(this + 4936);
  int v4 = *(_DWORD *)(this + 132);
  *(void *)(this + 4928) = a2;
  if (a2)
  {
    if (*(unsigned char *)(this + 4936) && *(unsigned char *)(this + 4938))
    {
      *a2 = *(_DWORD *)(this + 4920);
    }
    else
    {
      _WORD *v3 = 257;
      *(_DWORD *)(this + 4920) = a3;
      *(unsigned char *)(this + 4938) = 1;
      *(_DWORD *)(this + 4940) = v4;
      *a2 = a3;
    }
  }
  else if (!*(unsigned char *)(this + 4936) || !*(unsigned char *)(this + 4938))
  {
    _WORD *v3 = 257;
    *(_DWORD *)(this + 4920) = a3;
    *(unsigned char *)(this + 4938) = 1;
    *(_DWORD *)(this + 4940) = v4;
  }
  return this;
}

uint64_t Madusa::Session::AssignInverted(uint64_t this, int *a2, int a3)
{
  int v3 = (_WORD *)(this + 4960);
  int v4 = *(_DWORD *)(this + 132);
  *(void *)(this + 4952) = a2;
  if (a2)
  {
    if (*(unsigned char *)(this + 4960) && *(unsigned char *)(this + 4962))
    {
      *a2 = *(_DWORD *)(this + 4944);
    }
    else
    {
      _WORD *v3 = 257;
      *(_DWORD *)(this + 4944) = a3;
      *(unsigned char *)(this + 4962) = 1;
      *(_DWORD *)(this + 4964) = v4;
      *a2 = a3;
    }
  }
  else if (!*(unsigned char *)(this + 4960) || !*(unsigned char *)(this + 4962))
  {
    _WORD *v3 = 257;
    *(_DWORD *)(this + 4944) = a3;
    *(unsigned char *)(this + 4962) = 1;
    *(_DWORD *)(this + 4964) = v4;
  }
  return this;
}

uint64_t Madusa::Session::AssignDataAccessFormat(uint64_t this, int *a2, int a3)
{
  int v3 = (_WORD *)(this + 4984);
  int v4 = *(_DWORD *)(this + 132);
  *(void *)(this + 4976) = a2;
  if (a2)
  {
    if (*(unsigned char *)(this + 4984) && *(unsigned char *)(this + 4986))
    {
      *a2 = *(_DWORD *)(this + 4968);
    }
    else
    {
      _WORD *v3 = 257;
      *(_DWORD *)(this + 4968) = a3;
      *(unsigned char *)(this + 4986) = 1;
      *(_DWORD *)(this + 4988) = v4;
      *a2 = a3;
    }
  }
  else if (!*(unsigned char *)(this + 4984) || !*(unsigned char *)(this + 4986))
  {
    _WORD *v3 = 257;
    *(_DWORD *)(this + 4968) = a3;
    *(unsigned char *)(this + 4986) = 1;
    *(_DWORD *)(this + 4988) = v4;
  }
  return this;
}

uint64_t Madusa::Session::AssignXStride(uint64_t this, int *a2, int a3)
{
  int v3 = (_WORD *)(this + 5008);
  int v4 = *(_DWORD *)(this + 132);
  *(void *)(this + 5000) = a2;
  if (a2)
  {
    if (*(unsigned char *)(this + 5008) && *(unsigned char *)(this + 5010))
    {
      *a2 = *(_DWORD *)(this + 4992);
    }
    else
    {
      _WORD *v3 = 257;
      *(_DWORD *)(this + 4992) = a3;
      *(unsigned char *)(this + 5010) = 1;
      *(_DWORD *)(this + 5012) = v4;
      *a2 = a3;
    }
  }
  else if (!*(unsigned char *)(this + 5008) || !*(unsigned char *)(this + 5010))
  {
    _WORD *v3 = 257;
    *(_DWORD *)(this + 4992) = a3;
    *(unsigned char *)(this + 5010) = 1;
    *(_DWORD *)(this + 5012) = v4;
  }
  return this;
}

uint64_t Madusa::Session::AssignYStride(uint64_t this, int *a2, int a3)
{
  int v3 = (_WORD *)(this + 5032);
  int v4 = *(_DWORD *)(this + 132);
  *(void *)(this + 5024) = a2;
  if (a2)
  {
    if (*(unsigned char *)(this + 5032) && *(unsigned char *)(this + 5034))
    {
      *a2 = *(_DWORD *)(this + 5016);
    }
    else
    {
      _WORD *v3 = 257;
      *(_DWORD *)(this + 5016) = a3;
      *(unsigned char *)(this + 5034) = 1;
      *(_DWORD *)(this + 5036) = v4;
      *a2 = a3;
    }
  }
  else if (!*(unsigned char *)(this + 5032) || !*(unsigned char *)(this + 5034))
  {
    _WORD *v3 = 257;
    *(_DWORD *)(this + 5016) = a3;
    *(unsigned char *)(this + 5034) = 1;
    *(_DWORD *)(this + 5036) = v4;
  }
  return this;
}

float32x4_t Madusa::TransformPipe::FlatBlockFilter(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = 0;
  uint64_t v4 = *a2;
  result.i32[0] = 0;
  do
  {
    float32x4_t v6 = vaddq_f32(vaddq_f32(vabsq_f32(*(float32x4_t *)(v4 + v3 + 488)), vaddq_f32(vabsq_f32(*(float32x4_t *)(v4 + v3 + 424)), vaddq_f32(vabsq_f32(*(float32x4_t *)(v4 + v3 + 360)), vaddq_f32(vabsq_f32(*(float32x4_t *)(v4 + v3 + 296)), vaddq_f32(vabsq_f32(*(float32x4_t *)(v4 + v3 + 232)), vaddq_f32(vabsq_f32(*(float32x4_t *)(v4 + v3 + 168)), vaddq_f32(vabsq_f32(*(float32x4_t *)(v4 + v3 + 104)), vaddq_f32(vabsq_f32(*(float32x4_t *)(v4 + v3 + 40)), vabsq_f32(*(float32x4_t *)(v4 + v3 + 8)))))))))), vaddq_f32(vabsq_f32(*(float32x4_t *)(v4 + v3 + 456)), vaddq_f32(vabsq_f32(*(float32x4_t *)(v4 + v3 + 392)),
               vaddq_f32(vabsq_f32(*(float32x4_t *)(v4 + v3 + 328)), vaddq_f32(vabsq_f32(*(float32x4_t *)(v4 + v3 + 264)), vaddq_f32(vabsq_f32(*(float32x4_t *)(v4 + v3 + 200)), vaddq_f32(vabsq_f32(*(float32x4_t *)(v4 + v3 + 136)), vaddq_f32(vabsq_f32(*(float32x4_t *)(v4 + v3 + 72)), (float32x4_t)result.u32[0]))))))));
    float32x4_t v7 = vaddq_f32(vaddq_f32(vaddq_f32(vabsq_f32(*(float32x4_t *)(v4 + v3 + 504)), vaddq_f32(vabsq_f32(*(float32x4_t *)(v4 + v3 + 440)), vaddq_f32(vabsq_f32(*(float32x4_t *)(v4 + v3 + 376)), vaddq_f32(vaddq_f32(vabsq_f32(*(float32x4_t *)(v4 + v3 + 216)), vaddq_f32(vabsq_f32(*(float32x4_t *)(v4 + v3 + 184)), vabsq_f32(*(float32x4_t *)(v4 + v3 + 152)))), vaddq_f32(vaddq_f32(vabsq_f32(*(float32x4_t *)(v4 + v3 + 120)), vabsq_f32(*(float32x4_t *)(v4 + v3 + 88))), vaddq_f32(vabsq_f32(*(float32x4_t *)(v4 + v3 + 56)), vabsq_f32(*(float32x4_t *)(v4 + v3 + 24)))))))), vaddq_f32(vabsq_f32(*(float32x4_t *)(v4 + v3 + 472)), vaddq_f32(vabsq_f32(*(float32x4_t *)(v4 + v3 + 408)), vaddq_f32(
                   vabsq_f32(*(float32x4_t *)(v4 + v3 + 344)),
                   vaddq_f32(vabsq_f32(*(float32x4_t *)(v4 + v3 + 312)), vaddq_f32(vabsq_f32(*(float32x4_t *)(v4 + v3 + 280)), vabsq_f32(*(float32x4_t *)(v4 + v3 + 248)))))))), v6);
    float32x4_t result = vpaddq_f32(v7, v7);
    result.f32[0] = vaddv_f32(*(float32x2_t *)result.f32);
    v3 += 512;
  }
  while (v3 != 0x10000);
  if ((*v2 & 0x1F) == 0 && v2[2] <= 0x3Fu && v2[3] == 212
    || QuickCodec::mask != -70947757)
  {
    QuickCodec::mask = FunctionTable::ft[0] ^ 0x157E9386;
    float32x4_t v8 = result;
    fegetenv(&v9);
    v9.__fpcr &= QuickCodec::mask + 70947740;
    fesetenv(&v9);
    return v8;
  }
  return result;
}

double Madusa::TransformPipe::_FlatBlockFilter(uint64_t a1, uint64_t *a2)
{
  if ((*v2 & 0x1F) != 0 || v2[2] > 0x3Fu)
  {
    int v3 = QuickCodec::mask;
    if (QuickCodec::mask != -70947757) {
LABEL_10:
    }
      QuickCodec::mask = v3 + 1;
  }
  else
  {
    int v3 = QuickCodec::mask;
    if (v2[3] == 212 || QuickCodec::mask != -70947757) {
      goto LABEL_10;
    }
  }
  *(void *)&double result = Madusa::TransformPipe::FlatBlockFilter(a1, a2).u64[0];
  return result;
}

void *Madusa::Decode::Decode(void *result, uint64_t a2)
{
  *double result = off_100070740;
  result[1] = a2;
  result[2] = 0;
  result[3] = 0;
  result[4] = 0xFFFFFFFF00000000;
  return result;
}

uint64_t Madusa::Decode::LookUpIa(Madusa::Decode *this, unsigned int a2, __int16 a3, int8x8_t a4)
{
  if (a2 <= 0x17)
  {
    if ((*v4 & 0x1F) != 0 || v4[2] > 0x3Fu)
    {
      if (QuickCodec::mask == -70947757) {
        return Madusa::Decode::kAuthCode[a2];
      }
    }
    else
    {
      BOOL v6 = v4[3] != 212 && QuickCodec::mask == -70947757;
      if (v6) {
        return Madusa::Decode::kAuthCode[a2];
      }
    }
    QuickCodec::mask = FunctionTable::ft[0] ^ 0x157E9386;
    uint64_t func = (void (*)(void, uint64_t))__find_func(0xBFBF1F1FC0C00040, 1359274186);
    func(0, 104);
    return Madusa::Decode::kAuthCode[a2];
  }
  if (a2 == 24)
  {
    float32x4_t v7 = 0;
    int v8 = 0;
    if (QuickCodec::mask == -70947757) {
      int v9 = 12660569;
    }
    else {
      int v9 = 3628006;
    }
    uint64_t v10 = 1;
    int v11 = 5223611;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          uint64_t v14 = v10;
          if (v11 <= 5223681) {
            break;
          }
          if (v11 == 5223682)
          {
            if ((*v7 & 0x1F) != 0
              || v7[2] > 0x3Fu
              || (uint64_t v10 = 1,
                  int v11 = 3628006,
                  v7[3] != ((QuickCodec::mask ^ v8) / 0x8DC5CC)))
            {
              int v11 = 3628060;
              uint64_t v10 = v14;
            }
          }
          else if (v11 == 8851600)
          {
            float32x4_t v7 = v4;
            int v11 = 5223628;
          }
          else
          {
            BOOL v6 = v11 == 12660569;
            int v11 = 5223682;
            if (v6) {
              int v8 = -1901944669;
            }
          }
        }
        if (v11 <= 5223610) {
          break;
        }
        unsigned int v12 = (QuickCodec::mask != -70947757) | v10;
        if (v11 == 5223628) {
          int v13 = v9;
        }
        else {
          int v13 = v11;
        }
        if (v11 == 5223628) {
          LODWORD(v14) = v12;
        }
        BOOL v15 = v11 == 5223611;
        if (v11 == 5223611) {
          int v11 = 3628006;
        }
        else {
          int v11 = v13;
        }
        if (v15) {
          uint64_t v10 = 0;
        }
        else {
          uint64_t v10 = v14;
        }
      }
      if (v11 != 3628006) {
        break;
      }
      if (v10) {
        int v11 = 3628060;
      }
      else {
        int v11 = 8851600;
      }
    }
    if (v10)
    {
      unint64_t v16 = 0;
      int v17 = FunctionTable::ft[0] ^ 0x157E9386;
      QuickCodec::mask = FunctionTable::ft[0] ^ 0x157E9386;
      int v18 = -1;
      do
      {
        qword_100074AF8[v18
                      + 1
                      + ((FunctionTable::swapTable[v16] ^ v17) / 0x9D28AF)] = qword_100074AF8[v18 + ((FunctionTable::swapTable[v16 + 1] ^ v17) / 0x9D28AF)];
        v18 -= 2;
        BOOL v19 = v16 >= 0x20;
        v16 += 2;
      }
      while (!v19);
    }
    return (__int16)(a3 + 1001);
  }
  else
  {
    a4.i8[4] = v4[3];
    a4.i32[0] = *v4 | 0xFFFFFFE0;
    *(int8x8_t *)v22.i8 = vand_s8(a4, (int8x8_t)0xFF000000FFLL);
    v22.i64[1] = v22.i64[0];
    float32x4_t v23 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v22, (int32x4_t)xmmword_100043DF0));
    v24.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_100043E00, v23)).u32[0];
    v24.i32[1] = vmovn_s32(vcgtq_f32(v23, (float32x4_t)xmmword_100043E00)).i32[1];
    if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v24, 0xFuLL))) & ((v4[2] & 0xE0) == 32)) != 0
      || QuickCodec::mask != -70947757)
    {
      QuickCodec::mask = FunctionTable::ft[0] ^ 0x157E9386;
      uint64_t v25 = __find_func(0xDF9FDF1FC0E04070, 824451274);
      uint64_t v26 = 0;
      while (*(unsigned __int8 *)(v25 + v26) != ((QuickCodec::mask ^ 0xC12A2DF3) / 0x9D28AF)
           || *(unsigned __int8 *)(v25 + v26 + 1) != ((QuickCodec::mask ^ 0xFBC56C53) / 0x9D28AF)
           || *(unsigned __int8 *)(v25 + v26 + 2) != ((QuickCodec::mask ^ 0xDDCAB631) / 0x9D28AF)
           || *(unsigned __int8 *)(v25 + v26 + 3) != ((QuickCodec::mask ^ 0x79E0DCBFu) / 0x9D28AF))
      {
        v26 += 4;
        if (v26 == 2400) {
          goto LABEL_60;
        }
      }
      uint64_t vars0 = v25 + v26;
      long long vars8 = 0u;
LABEL_60:
      QuickCodec::mask += 16;
      return 0;
    }
    else
    {
      return 0;
    }
  }
}

uint64_t Madusa::Decode::_LookUpIa(Madusa::Decode *this, Madusa::Decode *a2, __int16 a3, int8x8_t a4)
{
  float32x4_t v5 = 0;
  int v6 = 0;
  if (QuickCodec::mask == -70947757) {
    int v7 = 1724915;
  }
  else {
    int v7 = 173842;
  }
  uint64_t v8 = 1;
  int v9 = 696305;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v12 = v8;
        if (v9 <= 696375) {
          break;
        }
        if (v9 == 696376)
        {
          if ((*v5 & 0x1F) != 0
            || v5[2] > 0x3Fu
            || (uint64_t v8 = 1,
                int v9 = 173842,
                v5[3] != ((QuickCodec::mask ^ v6) / 0x2F2DA)))
          {
            int v9 = 173896;
            uint64_t v8 = v12;
          }
        }
        else if (v9 == 870130)
        {
          float32x4_t v5 = (unsigned char *)v4;
          int v9 = 696322;
        }
        else
        {
          BOOL v13 = v9 == 1724915;
          int v9 = 696376;
          if (v13) {
            int v6 = -105615141;
          }
        }
      }
      if (v9 <= 696304) {
        break;
      }
      unsigned int v10 = (QuickCodec::mask != -70947757) | v8;
      if (v9 == 696322) {
        int v11 = v7;
      }
      else {
        int v11 = v9;
      }
      if (v9 == 696322) {
        LODWORD(v12) = v10;
      }
      BOOL v13 = v9 == 696305;
      if (v9 == 696305) {
        int v9 = 173842;
      }
      else {
        int v9 = v11;
      }
      if (v13) {
        uint64_t v8 = 0;
      }
      else {
        uint64_t v8 = v12;
      }
    }
    if (v9 != 173842) {
      break;
    }
    int v9 = 173896;
    if ((v8 & 1) == 0) {
      int v9 = 870130;
    }
  }
  if (v8) {
    ++QuickCodec::mask;
  }
  return Madusa::Decode::LookUpIa((Madusa::Decode *)0xA9FF0, a2, a3, a4);
}

uint64_t Madusa::Decode::Execute(uint64_t a1, uint64_t a2, float a3)
{
  Madusa::ProfileTimer::ProfileTimer(v16, (uint64_t)&unk_10006F6CB, *(void *)(a1 + 8));
  uint64_t func = (uint64_t (*)(uint64_t, uint64_t))__find_func(0xCF5FDFFF400080C0, 568598570);
  uint64_t v8 = func(a1, a2);
  uint64_t v9 = *(void *)(v8 + 16);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)v8;
  *(void *)(a1 + 32) = v9;
  unsigned int v10 = (void (*)(uint64_t, uint64_t, float))__find_func(0x9F7F5FBFC02040C0, 1908711530);
  v10(a1, a2, a3);
  v11.i8[4] = v3[3];
  v11.i32[0] = *v3 | 0xFFFFFFE0;
  *(int8x8_t *)v12.i8 = vand_s8(v11, (int8x8_t)0xFF000000FFLL);
  v12.i64[1] = v12.i64[0];
  float32x4_t v13 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v12, (int32x4_t)xmmword_100043E10));
  v14.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_100043E20, v13)).u32[0];
  v14.i32[1] = vmovn_s32(vcgtq_f32(v13, (float32x4_t)xmmword_100043E20)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v14, 0xFuLL))) & ((v3[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    QuickCodec::mask = FunctionTable::ft[0] ^ 0x157E9386;
    fegetenv(&v17);
    v17.__fpcr &= QuickCodec::mask + 70947740;
    fesetenv(&v17);
  }
  Madusa::ProfileTimer::~ProfileTimer((Madusa::ProfileTimer *)v16);
  return a1 + 16;
}

uint64_t Madusa::Decode::_Execute(uint64_t a1, uint64_t a2, float a3, int8x8_t a4)
{
  a4.i32[0] = *v4 | 0xFFFFFFE0;
  a4.i8[4] = v4[3];
  *(int8x8_t *)v5.i8 = vand_s8(a4, (int8x8_t)0xFF000000FFLL);
  v5.i64[1] = v5.i64[0];
  float32x4_t v6 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v5, (int32x4_t)xmmword_100043E30));
  v7.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_100043E40, v6)).u32[0];
  v7.i32[1] = vmovn_s32(vcgtq_f32(v6, (float32x4_t)xmmword_100043E40)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v7, 0xFuLL))) & ((v4[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    ++QuickCodec::mask;
  }
  return Madusa::Decode::Execute(a1, a2, a3);
}

uint64_t Madusa::Decode::_Execute_Alt(uint64_t a1)
{
  if ((*v1 & 0x1F) != 0 || v1[2] > 0x3Fu)
  {
    int v2 = QuickCodec::mask;
    if (QuickCodec::mask != -70947757) {
LABEL_10:
    }
      QuickCodec::mask = v2 + 1;
  }
  else
  {
    int v2 = QuickCodec::mask;
    if (v1[3] == 212 || QuickCodec::mask != -70947757) {
      goto LABEL_10;
    }
  }
  return Madusa::Decode::Execute_Alt(a1);
}

uint64_t Madusa::Decode::Execute_Alt(uint64_t a1)
{
  return a1 + 16;
}

uint64_t Madusa::Decode::ErsDecode(uint64_t a1, uint64_t a2, double a3)
{
  int16x8_t v4 = *(int16x8_t *)(a2 + 288);
  int16x8_t v5 = *(int16x8_t *)(a2 + 304);
  int16x8_t v6 = *(int16x8_t *)(a2 + 256);
  int16x8_t v7 = *(int16x8_t *)(a2 + 272);
  int16x8_t v8 = *(int16x8_t *)(a2 + 224);
  int16x8_t v9 = *(int16x8_t *)(a2 + 240);
  int16x8_t v10 = *(int16x8_t *)(a2 + 192);
  int16x8_t v11 = *(int16x8_t *)(a2 + 208);
  int16x8_t v12 = *(int16x8_t *)(a2 + 160);
  int16x8_t v13 = *(int16x8_t *)(a2 + 176);
  int16x8_t v14 = *(int16x8_t *)(a2 + 128);
  int16x8_t v15 = *(int16x8_t *)(a2 + 144);
  int16x8_t v16 = *(int16x8_t *)(a2 + 96);
  int16x8_t v17 = *(int16x8_t *)(a2 + 112);
  int16x8_t v18 = *(int16x8_t *)(a2 + 64);
  int16x8_t v19 = *(int16x8_t *)(a2 + 80);
  int16x8_t v20 = *(int16x8_t *)(a2 + 32);
  int16x8_t v21 = *(int16x8_t *)(a2 + 48);
  int16x8_t v22 = *(int16x8_t *)a2;
  int16x8_t v23 = *(int16x8_t *)(a2 + 16);
  int v24 = *(__int16 *)(a2 + 320);
  int v25 = *(__int16 *)(a2 + 322);
  int v26 = *(__int16 *)(a2 + 324);
  int v27 = *(__int16 *)(a2 + 326);
  int v28 = *(__int16 *)(a2 + 328);
  int v29 = *(__int16 *)(a2 + 330);
  int v30 = *(__int16 *)(a2 + 332);
  int v31 = *(__int16 *)(a2 + 334);
  int v32 = *(__int16 *)(a2 + 496);
  int v33 = *(__int16 *)(a2 + 498);
  int v34 = *(__int16 *)(a2 + 508);
  int v35 = *(__int16 *)(a2 + 510);
  int v36 = *(__int16 *)(a2 + 512);
  int v37 = *(__int16 *)(a2 + 514);
  int v38 = *(__int16 *)(a2 + 516);
  int v39 = *(__int16 *)(a2 + 518);
  int v40 = *(__int16 *)(a2 + 520);
  int v41 = *(__int16 *)(a2 + 522);
  int v42 = vaddvq_s32(vmull_s16(*(int16x4_t *)(a2 + 500), *(int16x4_t *)(a2 + 500)))
      + v41 * v41
      + v39 * v39
      + v40 * v40
      + v37 * v37
      + v38 * v38
      + v35 * v35
      + v36 * v36
      + v33 * v33
      + v34 * v34
      + vaddvq_s32(vmlal_high_s16(vmull_s16(*(int16x4_t *)(a2 + 480), *(int16x4_t *)(a2 + 480)), *(int16x8_t *)(a2 + 480), *(int16x8_t *)(a2 + 480)))+ v32 * v32+ vaddvq_s32(vmlal_high_s16(vmull_s16(*(int16x4_t *)(a2 + 524), *(int16x4_t *)(a2 + 524)), *(int16x8_t *)(a2 + 524), *(int16x8_t *)(a2 + 524)))+ vaddvq_s32(vaddq_s32(vaddq_s32(vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(
                          vmlal_s16(vmlal_s16(vmlal_s16(vmull_s16(*(int16x4_t *)v21.i8, *(int16x4_t *)v21.i8), *(int16x4_t *)v23.i8, *(int16x4_t *)v23.i8), *(int16x4_t *)v19.i8, *(int16x4_t *)v19.i8), *(int16x4_t *)v17.i8, *(int16x4_t *)v17.i8), *(int16x4_t *)v15.i8, *(int16x4_t *)v15.i8), *(int16x4_t *)v13.i8, *(int16x4_t *)v13.i8), *(int16x4_t *)v11.i8, *(int16x4_t *)v11.i8), *(int16x4_t *)v9.i8, *(int16x4_t *)v9.i8), *(int16x4_t *)v7.i8, *(int16x4_t *)v7.i8),
                *(int16x4_t *)v5.i8,
                *(int16x4_t *)v5.i8),
              vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(vmull_s16(*(int16x4_t *)v20.i8, *(int16x4_t *)v20.i8), *(int16x4_t *)v22.i8, *(int16x4_t *)v22.i8), *(int16x4_t *)v18.i8, *(int16x4_t *)v18.i8), *(int16x4_t *)v16.i8, *(int16x4_t *)v16.i8), *(int16x4_t *)v14.i8, *(int16x4_t *)v14.i8), *(int16x4_t *)v12.i8, *(int16x4_t *)v12.i8),
                      *(int16x4_t *)v10.i8,
                      *(int16x4_t *)v10.i8),
                    *(int16x4_t *)v8.i8,
                    *(int16x4_t *)v8.i8),
                  *(int16x4_t *)v6.i8,
                  *(int16x4_t *)v6.i8),
                *(int16x4_t *)v4.i8,
                *(int16x4_t *)v4.i8)),
            vaddq_s32(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmull_high_s16(v21, v21), v23, v23), v19, v19), v17, v17), v15, v15), v13, v13), v11, v11), v9, v9), v7,
                  v7),
                v5,
                v5),
              vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmull_high_s16(v20, v20), v22, v22), v18, v18), v16, v16), v14, v14), v12, v12), v10, v10), v8, v8), v6, v6),
                v4,
                v4))))
      + v24 * v24
      + v25 * v25
      + v26 * v26
      + v27 * v27
      + v28 * v28
      + v29 * v29
      + v30 * v30
      + v31 * v31;
  if (v42)
  {
    int16x8_t v43 = vmovl_s8((int8x8_t)-1);
    int16x8_t v44 = vmovl_s8((int8x8_t)0xFFFFFF01010101FFLL);
    int16x8_t v45 = vmovl_s8((int8x8_t)-16711169);
    int16x8_t v46 = vmovl_s8((int8x8_t)0xFFFFFF01FFFF01FFLL);
    int32x4_t v47 = vmull_high_s16(v46, v21);
    int32x4_t v48 = vmull_s16(*(int16x4_t *)v46.i8, *(int16x4_t *)v21.i8);
    int16x8_t v49 = vmovl_s8((int8x8_t)0x1FFFF01FFFF01FFLL);
    int32x4_t v50 = vmlal_s16(v48, *(int16x4_t *)v49.i8, *(int16x4_t *)v23.i8);
    int32x4_t v51 = vmlal_high_s16(v47, v49, v23);
    int16x8_t v52 = vmovl_s8((int8x8_t)0x1FF01010101FFFFLL);
    int32x4_t v53 = vmlal_high_s16(v51, v52, v19);
    int32x4_t v54 = vmlal_s16(v50, *(int16x4_t *)v52.i8, *(int16x4_t *)v19.i8);
    int16x8_t v55 = vmovl_s8((int8x8_t)0xFFFFFF0101010101);
    int32x4_t v56 = vmlal_s16(v54, *(int16x4_t *)v55.i8, *(int16x4_t *)v17.i8);
    int32x4_t v57 = vmlal_high_s16(v53, v55, v17);
    int16x8_t v58 = vmovl_s8((int8x8_t)0xFF01010101FF01FFLL);
    int32x4_t v59 = vmlal_high_s16(v57, v58, v15);
    int32x4_t v60 = vmlal_s16(v56, *(int16x4_t *)v58.i8, *(int16x4_t *)v15.i8);
    int16x8_t v61 = vmovl_s8((int8x8_t)0x1FF0101010101FFLL);
    int32x4_t v62 = vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(v60, *(int16x4_t *)v61.i8, *(int16x4_t *)v13.i8), *(int16x4_t *)v58.i8, *(int16x4_t *)v11.i8), *(int16x4_t *)v45.i8, *(int16x4_t *)v9.i8), *(int16x4_t *)v44.i8, *(int16x4_t *)v7.i8), *(int16x4_t *)v43.i8, *(int16x4_t *)v5.i8);
    int32x4_t v63 = vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(v59, v61, v13), v58, v11), v45, v9), v44, v7), v43, v5);
    int16x8_t v64 = v43;
    int16x8_t v65 = vmovl_s8((int8x8_t)0xFF01FF0101FF0101);
    int16x8_t v66 = vmovl_s8((int8x8_t)0x1FFFF01FF010101);
    int16x8_t v67 = vmovl_s8((int8x8_t)0xFF01FF0101FFFF01);
    int16x8_t v68 = vmovl_s8((int8x8_t)0xFFFFFF0101FFFFFFLL);
    int16x8_t v69 = vmovl_s8((int8x8_t)0x1FF010101FF01FFLL);
    int16x8_t v70 = vmovl_s8((int8x8_t)0xFF01FFFF0101FFFFLL);
    int16x8_t v71 = vmovl_s8((int8x8_t)0x1FFFF01FFFF0101);
    int16x8_t v72 = vmovl_s8((int8x8_t)0xFF01FF010101FFFFLL);
    int32x4_t v73 = vmull_high_s16(v72, v20);
    int32x4_t v74 = vmull_s16(*(int16x4_t *)v72.i8, *(int16x4_t *)v20.i8);
    int16x8_t v75 = vmovl_s8((int8x8_t)0x1010101FF010101);
    float v76 = (float)(-*(__int16 *)(a2 + 536)
                - *(__int16 *)(a2 + 538)
                + -v40
                - v41
                - *(__int16 *)(a2 + 524)
                - *(__int16 *)(a2 + 526)
                - *(__int16 *)(a2 + 528)
                - *(__int16 *)(a2 + 530)
                - *(__int16 *)(a2 + 532)
                - *(__int16 *)(a2 + 534)
                + -*(__int16 *)(a2 + 506)
                - v34
                - v35
                - v36
                - v37
                - v38
                - v39
                + -*(__int16 *)(a2 + 494)
                - v32
                - v33
                - *(__int16 *)(a2 + 500)
                - *(__int16 *)(a2 + 502)
                - *(__int16 *)(a2 + 504)
                + -*(__int16 *)(a2 + 484)
                - *(__int16 *)(a2 + 486)
                - *(__int16 *)(a2 + 488)
                - *(__int16 *)(a2 + 490)
                - *(__int16 *)(a2 + 492)
                + -*(__int16 *)(a2 + 482)
                - *(__int16 *)(a2 + 480)
                + vaddvq_s32(vaddq_s32(vaddq_s32(v62, vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(v74, *(int16x4_t *)v75.i8, *(int16x4_t *)v22.i8), *(int16x4_t *)v71.i8, *(int16x4_t *)v18.i8), *(int16x4_t *)v70.i8, *(int16x4_t *)v16.i8), *(int16x4_t *)v69.i8, *(int16x4_t *)v14.i8), *(int16x4_t *)v68.i8,
                                  *(int16x4_t *)v12.i8),
                                *(int16x4_t *)v67.i8,
                                *(int16x4_t *)v10.i8),
                              *(int16x4_t *)v66.i8,
                              *(int16x4_t *)v8.i8),
                            *(int16x4_t *)v65.i8,
                            *(int16x4_t *)v6.i8),
                          *(int16x4_t *)v64.i8,
                          *(int16x4_t *)v4.i8)),
                      vaddq_s32(v63, vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(v73, v75, v22), v71, v18), v70, v16), v69, v14), v68, v12), v67, v10), v66, v8), v65, v6), v64,
                          v4))))
                - v24
                - v25
                - v26
                - v27
                - v28
                - v29
                - v30
                - v31);
    float v77 = v76 / sqrtf((float)v42);
  }
  else
  {
    float v77 = 1.1755e-38;
  }
  *(float *)(a1 + 28) = v77;
  *(float *)(a1 + 32) = (float)((float)(*(float *)&a3 * 0.2797) + -13.985) + (float)(v77 * 0.7448);
  BYTE4(a3) = v3[3];
  LODWORD(a3) = *v3 | 0xFFFFFFE0;
  *(int8x8_t *)v78.i8 = vand_s8(*(int8x8_t *)&a3, (int8x8_t)0xFF000000FFLL);
  v78.i64[1] = v78.i64[0];
  float32x4_t v79 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v78, (int32x4_t)xmmword_100043E50));
  v80.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_100043E60, v79)).u32[0];
  v80.i32[1] = vmovn_s32(vcgtq_f32(v79, (float32x4_t)xmmword_100043E60)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v80, 0xFuLL))) & ((v3[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    QuickCodec::mask = FunctionTable::ft[0] ^ 0x157E9386;
    uint64_t func = __find_func(0xDF9FDF1FC0E04070, 824451274);
    uint64_t v82 = 0;
    while (*(unsigned __int8 *)(func + v82) != ((QuickCodec::mask ^ 0xC12A2DF3) / 0x9D28AF)
         || *(unsigned __int8 *)(func + v82 + 1) != ((QuickCodec::mask ^ 0xFBC56C53) / 0x9D28AF)
         || *(unsigned __int8 *)(func + v82 + 2) != ((QuickCodec::mask ^ 0xDDCAB631) / 0x9D28AF)
         || *(unsigned __int8 *)(func + v82 + 3) != ((QuickCodec::mask ^ 0x79E0DCBFu) / 0x9D28AF))
    {
      v82 += 4;
      if (v82 == 2400) {
        goto LABEL_13;
      }
    }
    uint64_t vars0 = func + v82;
    long long vars8 = 0u;
LABEL_13:
    QuickCodec::mask += 16;
  }
  return a1 + 16;
}

uint64_t Madusa::Decode::_ErsDecode(uint64_t a1, uint64_t a2, double a3)
{
  if ((*v3 & 0x1F) != 0 || v3[2] > 0x3Fu)
  {
    int v4 = QuickCodec::mask;
    if (QuickCodec::mask != -70947757) {
LABEL_10:
    }
      QuickCodec::mask = v4 + 1;
  }
  else
  {
    int v4 = QuickCodec::mask;
    if (v3[3] == 212 || QuickCodec::mask != -70947757) {
      goto LABEL_10;
    }
  }
  return Madusa::Decode::ErsDecode(a1, a2, a3);
}

uint64_t Madusa::Decode::CpmDecode(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 0;
  int v5 = 0;
  signed __int32 v6 = 0;
  __int16 v7 = 0;
  unsigned int v338 = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  uint64_t v337 = a1 + 16;
  *(void *)(a1 + 32) = 0xFFFFFFFF00000000;
  int16x8_t v8 = vmovl_s8((int8x8_t)0xFFFFFF0101010101);
  int16x8_t v9 = vmovl_s8((int8x8_t)0x1FF01010101FFFFLL);
  int16x8_t v10 = vmovl_s8((int8x8_t)0xFFFFFF01FFFF01FFLL);
  int16x8_t v11 = *(int16x8_t *)(a2 + 48);
  int32x4_t v12 = vmull_high_s16(v10, v11);
  int32x4_t v13 = vmull_s16(*(int16x4_t *)v10.i8, *(int16x4_t *)v11.i8);
  int16x8_t v14 = vmovl_s8((int8x8_t)0x1FFFF01FFFF01FFLL);
  int16x8_t v15 = *(int16x8_t *)(a2 + 16);
  int32x4_t v16 = vmlal_s16(v13, *(int16x4_t *)v14.i8, *(int16x4_t *)v15.i8);
  int32x4_t v17 = vmlal_high_s16(v12, v14, v15);
  int16x8_t v18 = *(int16x8_t *)(a2 + 80);
  int32x4_t v19 = vmlal_high_s16(v17, v9, v18);
  int32x4_t v20 = vmlal_s16(v16, *(int16x4_t *)v9.i8, *(int16x4_t *)v18.i8);
  int16x8_t v21 = *(int16x8_t *)(a2 + 112);
  int32x4_t v22 = vmlal_s16(v20, *(int16x4_t *)v8.i8, *(int16x4_t *)v21.i8);
  int32x4_t v23 = vmlal_high_s16(v19, v8, v21);
  int16x8_t v24 = vmovl_s8((int8x8_t)0xFF01FF010101FFFFLL);
  uint64_t v25 = a2 + 278;
  int16x8_t v26 = vmovl_s8((int8x8_t)0xFF01FFFF0101FFFFLL);
  int16x8_t v27 = vmovl_s8((int8x8_t)0x1FFFF01FFFF0101);
  int16x8_t v28 = vmovl_s8((int8x8_t)0x1010101FF010101);
  int v333 = vaddvq_s32(vaddq_s32(vaddq_s32(v22, vmlal_s16(vmlal_s16(vmlal_s16(vmull_s16(*(int16x4_t *)v24.i8, *(int16x4_t *)(a2 + 32)), *(int16x4_t *)v28.i8, *(int16x4_t *)a2), *(int16x4_t *)v27.i8, *(int16x4_t *)(a2 + 64)), *(int16x4_t *)v26.i8, *(int16x4_t *)(a2 + 96))), vaddq_s32(v23, vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmull_high_s16(v24, *(int16x8_t *)(a2 + 32)), v28, *(int16x8_t *)a2), v27,
                   *(int16x8_t *)(a2 + 64)),
                 v26,
                 *(int16x8_t *)(a2 + 96)))))
       - *(__int16 *)(a2 + 128)
       + *(__int16 *)(a2 + 130)
       - *(__int16 *)(a2 + 132)
       + *(__int16 *)(a2 + 134)
       + *(__int16 *)(a2 + 136)
       + *(__int16 *)(a2 + 138)
       - *(__int16 *)(a2 + 140)
       + *(__int16 *)(a2 + 142)
       - *(__int16 *)(a2 + 144)
       + *(__int16 *)(a2 + 146)
       - *(__int16 *)(a2 + 148);
  do
  {
    uint64_t v29 = 0;
    int v30 = (int8x16_t *)&Madusa::Decode::kAuthArray[45 * v4];
    int16x8_t v31 = *(int16x8_t *)(a2 + 166);
    int8x16_t v32 = v30[1];
    int16x8_t v33 = vmovl_s8(*(int8x8_t *)v32.i8);
    int16x8_t v34 = vmovl_high_s8(v32);
    int16x8_t v35 = vmovl_high_s8(*v30);
    int16x8_t v36 = vmovl_s8(*(int8x8_t *)v30->i8);
    int32x4_t v37 = vmull_s16(*(int16x4_t *)v35.i8, *(int16x4_t *)v31.i8);
    int32x4_t v38 = vmull_high_s16(v35, v31);
    int16x8_t v39 = vmovl_s8(*(int8x8_t *)v30[2].i8);
    v2.i32[0] = v30[2].i32[2];
    int v40 = vaddvq_s32(vmlal_s16(vaddq_s32(vaddq_s32(vaddq_s32(vmlal_s16(vmull_s16(*(int16x4_t *)v36.i8, *(int16x4_t *)(a2 + 150)), *(int16x4_t *)v33.i8, *(int16x4_t *)(a2 + 182)), vmlal_s16(v37, *(int16x4_t *)v34.i8, *(int16x4_t *)(a2 + 198))), vaddq_s32(vmlal_high_s16(vmull_high_s16(v36, *(int16x8_t *)(a2 + 150)), v33, *(int16x8_t *)(a2 + 182)), vmlal_high_s16(v38, v34, *(int16x8_t *)(a2 + 198)))), vmlal_high_s16(vmull_s16(*(int16x4_t *)v39.i8, *(int16x4_t *)(a2 + 214)), v39, *(int16x8_t *)(a2 + 214))), (int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)v2.i8), *(int16x4_t *)(a2 + 230)))+ v30[2].i8[12] * *(__int16 *)(a2 + 238);
    unsigned int v41 = v338;
    if (v40 > v5) {
      unsigned int v41 = v4;
    }
    unsigned int v338 = v41;
    int v42 = &Madusa::Decode::kNotesArray;
    do
    {
      if (sub_1000120C4(&Madusa::Decode::kAuthArray[45 * v4], (unsigned __int8 *)v42))
      {
        v43.i32[0] = *((char *)v42 + 192);
        v43.i32[1] = *((char *)v42 + 193);
        v44.i32[0] = *(__int16 *)(v25 + 256);
        v44.i32[1] = *(__int16 *)(v25 + 258);
        int8x16_t v46 = (int8x16_t)v42[10];
        int8x16_t v45 = (int8x16_t)v42[11];
        int16x8_t v47 = vmovl_high_s8(v45);
        int16x8_t v48 = vmovl_s8(*(int8x8_t *)v45.i8);
        int16x8_t v49 = *(int16x8_t *)(v25 + 224);
        int16x8_t v50 = *(int16x8_t *)(v25 + 240);
        int8x16_t v52 = (int8x16_t)v42[8];
        int8x16_t v51 = (int8x16_t)v42[9];
        int16x8_t v53 = vmovl_s8(*(int8x8_t *)v51.i8);
        int16x8_t v54 = vmovl_high_s8(v51);
        int16x8_t v56 = *(int16x8_t *)(v25 + 160);
        int16x8_t v55 = *(int16x8_t *)(v25 + 176);
        int8x16_t v58 = (int8x16_t)v42[6];
        int8x16_t v57 = (int8x16_t)v42[7];
        int16x8_t v59 = vmovl_high_s8(v57);
        int16x8_t v60 = vmovl_s8(*(int8x8_t *)v57.i8);
        int16x8_t v61 = *(int16x8_t *)(v25 + 96);
        int16x8_t v62 = *(int16x8_t *)(v25 + 112);
        int8x16_t v64 = (int8x16_t)v42[4];
        int8x16_t v63 = (int8x16_t)v42[5];
        int16x8_t v65 = vmovl_s8(*(int8x8_t *)v63.i8);
        int16x8_t v66 = vmovl_high_s8(v63);
        int8x16_t v68 = (int8x16_t)v42[2];
        int8x16_t v67 = (int8x16_t)v42[3];
        int16x8_t v69 = vmovl_s8(*(int8x8_t *)v67.i8);
        int16x8_t v70 = *(int16x8_t *)(a2 + 246);
        int16x8_t v71 = vmovl_high_s8(v67);
        int16x8_t v72 = *(int16x8_t *)(a2 + 262);
        int32x4_t v73 = vmull_s16(*(int16x4_t *)v71.i8, *(int16x4_t *)v72.i8);
        int32x4_t v74 = vmull_s16(*(int16x4_t *)v69.i8, *(int16x4_t *)v70.i8);
        int32x4_t v75 = vmull_high_s16(v69, v70);
        int8x16_t v76 = (int8x16_t)v42[1];
        int16x8_t v77 = vmovl_s8(*(int8x8_t *)v76.i8);
        int16x8_t v78 = *(int16x8_t *)(a2 + 182);
        int16x8_t v79 = *(int16x8_t *)(a2 + 198);
        int32x4_t v80 = vmlal_high_s16(v75, v77, v78);
        int32x4_t v81 = vmlal_s16(v74, *(int16x4_t *)v77.i8, *(int16x4_t *)v78.i8);
        int16x8_t v83 = *(int16x8_t *)(v25 + 32);
        int16x8_t v82 = *(int16x8_t *)(v25 + 48);
        int16x8_t v84 = vmovl_high_s8(v76);
        int32x4_t v85 = vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(v80, v65, v83), v60, v61), v53, v56), v48, v49);
        int32x4_t v86 = vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmull_high_s16(v71, v72), v84, v79), v66, v82), v59, v62), v54, v55), v47, v50);
        int32x4_t v87 = vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(v81, *(int16x4_t *)v65.i8, *(int16x4_t *)v83.i8), *(int16x4_t *)v60.i8, *(int16x4_t *)v61.i8), *(int16x4_t *)v53.i8, *(int16x4_t *)v56.i8), *(int16x4_t *)v48.i8, *(int16x4_t *)v49.i8);
        int32x4_t v88 = vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(v73, *(int16x4_t *)v84.i8, *(int16x4_t *)v79.i8), *(int16x4_t *)v66.i8, *(int16x4_t *)v82.i8), *(int16x4_t *)v59.i8, *(int16x4_t *)v62.i8), *(int16x4_t *)v54.i8, *(int16x4_t *)v55.i8), *(int16x4_t *)v47.i8, *(int16x4_t *)v50.i8);
        int16x8_t v89 = vmovl_high_s8(v46);
        int16x8_t v90 = vmovl_s8(*(int8x8_t *)v46.i8);
        int16x8_t v91 = vmovl_s8(*(int8x8_t *)v52.i8);
        int16x8_t v92 = vmovl_high_s8(v52);
        int16x8_t v93 = vmovl_high_s8(v58);
        int16x8_t v94 = vmovl_s8(*(int8x8_t *)v58.i8);
        int16x8_t v2 = *(int16x8_t *)(v25 + 64);
        int16x8_t v95 = vmovl_s8(*(int8x8_t *)v64.i8);
        int16x8_t v96 = vmovl_high_s8(v64);
        int16x8_t v97 = vmovl_s8(*(int8x8_t *)v68.i8);
        int16x8_t v98 = vmovl_high_s8(v68);
        int16x8_t v100 = *(int16x8_t *)(a2 + 214);
        int16x8_t v99 = *(int16x8_t *)(a2 + 230);
        int32x4_t v101 = vmull_s16(*(int16x4_t *)v98.i8, *(int16x4_t *)v99.i8);
        int32x4_t v102 = vmull_s16(*(int16x4_t *)v97.i8, *(int16x4_t *)v100.i8);
        int32x4_t v103 = vmull_high_s16(v98, v99);
        int32x4_t v104 = vmull_high_s16(v97, v100);
        int16x8_t v105 = vmovl_high_s8(*(int8x16_t *)v42);
        int16x8_t v106 = vmovl_s8(*(int8x8_t *)v42);
        int16x8_t v107 = *(int16x8_t *)(a2 + 166);
        *(int32x2_t *)v90.i8 = vmla_s32((int32x2_t)vaddvq_s32(vaddq_s32(vaddq_s32(vaddq_s32(v87, vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(v102, *(int16x4_t *)v106.i8, *(int16x4_t *)(a2 + 150)), *(int16x4_t *)v95.i8, *(int16x4_t *)v25), *(int16x4_t *)v94.i8, *(int16x4_t *)v2.i8), *(int16x4_t *)v91.i8, *(int16x4_t *)(v25 + 128)),
                                                                    *(int16x4_t *)v90.i8,
                                                                    *(int16x4_t *)(v25 + 192))),
                                                                vaddq_s32(v88, vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(v101, *(int16x4_t *)v105.i8, *(int16x4_t *)v107.i8), *(int16x4_t *)v96.i8, *(int16x4_t *)(v25 + 16)), *(int16x4_t *)v93.i8, *(int16x4_t *)(v25 + 80)), *(int16x4_t *)v92.i8, *(int16x4_t *)(v25 + 144)), *(int16x4_t *)v89.i8, *(int16x4_t *)(v25 + 208)))), vaddq_s32(vaddq_s32(
                                                                  v85,
                                                                  vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(v104, v106, *(int16x8_t *)(a2 + 150)), v95, *(int16x8_t *)v25), v94, v2), v91, *(int16x8_t *)(v25 + 128)), v90, *(int16x8_t *)(v25 + 192))), vaddq_s32(v86, vmlal_high_s16(vmlal_high_s16(
                                                                      vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(v103, v105, v107), v96, *(int16x8_t *)(v25 + 16)), v93, *(int16x8_t *)(v25 + 80)), v92, *(int16x8_t *)(v25 + 144)), v89, *(int16x8_t *)(v25 + 208)))))), v43, v44);
        signed __int32 v108 = vpadd_s32(*(int32x2_t *)v90.i8, *(int32x2_t *)v90.i8).u32[0]
             + *((char *)v42 + 194) * *(__int16 *)(a2 + 538);
        if (v108 > v6)
        {
          __int16 v7 = v29;
          signed __int32 v6 = v108;
        }
      }
      ++v29;
      int v42 = (long long *)((char *)v42 + 195);
    }
    while (v29 != 103);
    if (v40 > v5) {
      int v5 = v40;
    }
    ++v4;
  }
  while (v4 != 25);
  int16x8_t v110 = *(int16x8_t *)(a2 + 32);
  int16x8_t v109 = *(int16x8_t *)(a2 + 48);
  int32x4_t v111 = vmull_s16(*(int16x4_t *)v109.i8, *(int16x4_t *)v109.i8);
  int16x8_t v113 = *(int16x8_t *)a2;
  int16x8_t v112 = *(int16x8_t *)(a2 + 16);
  int32x4_t v114 = vmlal_high_s16(vmull_high_s16(v109, v109), v112, v112);
  int32x4_t v115 = vmlal_s16(v111, *(int16x4_t *)v112.i8, *(int16x4_t *)v112.i8);
  int16x8_t v117 = *(int16x8_t *)(a2 + 64);
  int16x8_t v116 = *(int16x8_t *)(a2 + 80);
  int32x4_t v118 = vmlal_s16(v115, *(int16x4_t *)v116.i8, *(int16x4_t *)v116.i8);
  int32x4_t v119 = vmlal_high_s16(v114, v116, v116);
  int16x8_t v121 = *(int16x8_t *)(a2 + 96);
  int16x8_t v120 = *(int16x8_t *)(a2 + 112);
  int32x4_t v122 = vmlal_high_s16(v119, v120, v120);
  int32x4_t v123 = vmlal_s16(v118, *(int16x4_t *)v120.i8, *(int16x4_t *)v120.i8);
  int16x8_t v125 = *(int16x8_t *)(a2 + 128);
  int16x8_t v124 = *(int16x8_t *)(a2 + 144);
  int32x4_t v126 = vmlal_s16(v123, *(int16x4_t *)v124.i8, *(int16x4_t *)v124.i8);
  int32x4_t v127 = vmlal_high_s16(v122, v124, v124);
  int16x8_t v129 = *(int16x8_t *)(a2 + 160);
  int16x8_t v128 = *(int16x8_t *)(a2 + 176);
  int16x8_t v130 = *(int16x8_t *)(a2 + 192);
  int v131 = *(__int16 *)(a2 + 238);
  int v132 = vaddvq_s32(vaddq_s32(vaddq_s32(vmlal_s16(vmlal_s16(v126, *(int16x4_t *)v128.i8, *(int16x4_t *)v128.i8), *(int16x4_t *)(a2 + 208), *(int16x4_t *)(a2 + 208)), vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(vmull_s16(*(int16x4_t *)v110.i8, *(int16x4_t *)v110.i8), *(int16x4_t *)v113.i8, *(int16x4_t *)v113.i8), *(int16x4_t *)v117.i8, *(int16x4_t *)v117.i8), *(int16x4_t *)v121.i8, *(int16x4_t *)v121.i8),
                     *(int16x4_t *)v125.i8,
                     *(int16x4_t *)v125.i8),
                   *(int16x4_t *)v129.i8,
                   *(int16x4_t *)v129.i8),
                 *(int16x4_t *)v130.i8,
                 *(int16x4_t *)v130.i8)),
             vaddq_s32(vmlal_high_s16(vmlal_high_s16(v127, v128, v128), *(int16x8_t *)(a2 + 208), *(int16x8_t *)(a2 + 208)), vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmull_high_s16(v110, v110), v113, v113), v117, v117), v121, v121), v125, v125), v129, v129), v130, v130))))+ *(__int16 *)(a2 + 224) * *(__int16 *)(a2 + 224)+ *(__int16 *)(a2 + 226) * *(__int16 *)(a2 + 226)+ *(__int16 *)(a2 + 228) * *(__int16 *)(a2 + 228)+ *(__int16 *)(a2 + 230) * *(__int16 *)(a2 + 230)+ *(__int16 *)(a2 + 232) * *(__int16 *)(a2 + 232)
       + *(__int16 *)(a2 + 234) * *(__int16 *)(a2 + 234)
       + *(__int16 *)(a2 + 236) * *(__int16 *)(a2 + 236)
       + v131 * v131;
  if (v132)
  {
    int v133 = v333;
    float v134 = (float)(v5 + v333) / sqrtf((float)v132);
  }
  else
  {
    float v134 = 1.1755e-38;
    int v133 = v333;
  }
  int16x8_t v136 = *(int16x8_t *)(a2 + 32);
  int16x8_t v135 = *(int16x8_t *)(a2 + 48);
  int32x4_t v137 = vmull_high_s16(v135, v135);
  int16x8_t v139 = *(int16x8_t *)a2;
  int16x8_t v138 = *(int16x8_t *)(a2 + 16);
  int32x4_t v140 = vmlal_s16(vmull_s16(*(int16x4_t *)v135.i8, *(int16x4_t *)v135.i8), *(int16x4_t *)v138.i8, *(int16x4_t *)v138.i8);
  int32x4_t v141 = vmlal_high_s16(v137, v138, v138);
  int16x8_t v143 = *(int16x8_t *)(a2 + 64);
  int16x8_t v142 = *(int16x8_t *)(a2 + 80);
  int32x4_t v144 = vmlal_high_s16(v141, v142, v142);
  int32x4_t v145 = vmlal_s16(v140, *(int16x4_t *)v142.i8, *(int16x4_t *)v142.i8);
  int16x8_t v147 = *(int16x8_t *)(a2 + 96);
  int16x8_t v146 = *(int16x8_t *)(a2 + 112);
  int32x4_t v148 = vmlal_s16(v145, *(int16x4_t *)v146.i8, *(int16x4_t *)v146.i8);
  int32x4_t v149 = vmlal_high_s16(v144, v146, v146);
  int16x8_t v151 = *(int16x8_t *)(a2 + 128);
  int16x8_t v150 = *(int16x8_t *)(a2 + 144);
  int32x4_t v152 = vmlal_high_s16(v149, v150, v150);
  int32x4_t v153 = vmlal_s16(v148, *(int16x4_t *)v150.i8, *(int16x4_t *)v150.i8);
  int16x8_t v155 = *(int16x8_t *)(a2 + 160);
  int16x8_t v154 = *(int16x8_t *)(a2 + 176);
  int32x4_t v156 = vmlal_s16(v153, *(int16x4_t *)v154.i8, *(int16x4_t *)v154.i8);
  int32x4_t v157 = vmlal_high_s16(v152, v154, v154);
  int16x8_t v159 = *(int16x8_t *)(a2 + 192);
  int16x8_t v158 = *(int16x8_t *)(a2 + 208);
  int32x4_t v160 = vmlal_high_s16(v157, v158, v158);
  int32x4_t v161 = vmlal_s16(v156, *(int16x4_t *)v158.i8, *(int16x4_t *)v158.i8);
  int16x8_t v163 = *(int16x8_t *)(a2 + 224);
  int16x8_t v162 = *(int16x8_t *)(a2 + 240);
  int32x4_t v164 = vmlal_s16(v161, *(int16x4_t *)v162.i8, *(int16x4_t *)v162.i8);
  int32x4_t v165 = vmlal_high_s16(v160, v162, v162);
  int16x8_t v167 = *(int16x8_t *)(a2 + 256);
  int16x8_t v166 = *(int16x8_t *)(a2 + 272);
  int32x4_t v168 = vmlal_high_s16(v165, v166, v166);
  int32x4_t v169 = vmlal_s16(v164, *(int16x4_t *)v166.i8, *(int16x4_t *)v166.i8);
  int16x8_t v171 = *(int16x8_t *)(a2 + 288);
  int16x8_t v170 = *(int16x8_t *)(a2 + 304);
  int32x4_t v172 = vmlal_s16(v169, *(int16x4_t *)v170.i8, *(int16x4_t *)v170.i8);
  int32x4_t v173 = vmlal_high_s16(v168, v170, v170);
  int16x8_t v175 = *(int16x8_t *)(a2 + 320);
  int16x8_t v174 = *(int16x8_t *)(a2 + 336);
  int32x4_t v176 = vmlal_high_s16(v173, v174, v174);
  int32x4_t v177 = vmlal_s16(v172, *(int16x4_t *)v174.i8, *(int16x4_t *)v174.i8);
  int16x8_t v179 = *(int16x8_t *)(a2 + 352);
  int16x8_t v178 = *(int16x8_t *)(a2 + 368);
  int32x4_t v180 = vmlal_s16(v177, *(int16x4_t *)v178.i8, *(int16x4_t *)v178.i8);
  int32x4_t v181 = vmlal_high_s16(v176, v178, v178);
  int16x8_t v183 = *(int16x8_t *)(a2 + 384);
  int16x8_t v182 = *(int16x8_t *)(a2 + 400);
  int32x4_t v184 = vmlal_high_s16(v181, v182, v182);
  int32x4_t v185 = vmlal_s16(v180, *(int16x4_t *)v182.i8, *(int16x4_t *)v182.i8);
  int16x8_t v187 = *(int16x8_t *)(a2 + 416);
  int16x8_t v186 = *(int16x8_t *)(a2 + 432);
  int32x4_t v188 = vmlal_s16(v185, *(int16x4_t *)v186.i8, *(int16x4_t *)v186.i8);
  int32x4_t v189 = vmlal_high_s16(v184, v186, v186);
  int16x8_t v191 = *(int16x8_t *)(a2 + 448);
  int16x8_t v190 = *(int16x8_t *)(a2 + 464);
  int32x4_t v192 = vmlal_high_s16(v189, v190, v190);
  int32x4_t v193 = vmlal_s16(v188, *(int16x4_t *)v190.i8, *(int16x4_t *)v190.i8);
  int16x8_t v195 = *(int16x8_t *)(a2 + 480);
  int16x8_t v194 = *(int16x8_t *)(a2 + 496);
  v193.i32[0] = vaddvq_s32(vaddq_s32(vaddq_s32(vmlal_s16(v193, *(int16x4_t *)v194.i8, *(int16x4_t *)v194.i8), vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(vmull_s16(*(int16x4_t *)v136.i8, *(int16x4_t *)v136.i8),
                                                    *(int16x4_t *)v139.i8,
                                                    *(int16x4_t *)v139.i8),
                                                  *(int16x4_t *)v143.i8,
                                                  *(int16x4_t *)v143.i8),
                                                *(int16x4_t *)v147.i8,
                                                *(int16x4_t *)v147.i8),
                                              *(int16x4_t *)v151.i8,
                                              *(int16x4_t *)v151.i8),
                                            *(int16x4_t *)v155.i8,
                                            *(int16x4_t *)v155.i8),
                                          *(int16x4_t *)v159.i8,
                                          *(int16x4_t *)v159.i8),
                                        *(int16x4_t *)v163.i8,
                                        *(int16x4_t *)v163.i8),
                                      *(int16x4_t *)v167.i8,
                                      *(int16x4_t *)v167.i8),
                                    *(int16x4_t *)v171.i8,
                                    *(int16x4_t *)v171.i8),
                                  *(int16x4_t *)v175.i8,
                                  *(int16x4_t *)v175.i8),
                                *(int16x4_t *)v179.i8,
                                *(int16x4_t *)v179.i8),
                              *(int16x4_t *)v183.i8,
                              *(int16x4_t *)v183.i8),
                            *(int16x4_t *)v187.i8,
                            *(int16x4_t *)v187.i8),
                          *(int16x4_t *)v191.i8,
                          *(int16x4_t *)v191.i8),
                        *(int16x4_t *)v195.i8,
                        *(int16x4_t *)v195.i8)),
                    vaddq_s32(vmlal_high_s16(v192, v194, v194), vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmull_high_s16(v136, v136), v139, v139), v143, v143), v147,
                                                v147),
                                              v151,
                                              v151),
                                            v155,
                                            v155),
                                          v159,
                                          v159),
                                        v163,
                                        v163),
                                      v167,
                                      v167),
                                    v171,
                                    v171),
                                  v175,
                                  v175),
                                v179,
                                v179),
                              v183,
                              v183),
                            v187,
                            v187),
                          v191,
                          v191),
                        v195,
                        v195))));
  int v196 = *(__int16 *)(a2 + 538);
  int v197 = v193.i32[0]
       + *(__int16 *)(a2 + 512) * *(__int16 *)(a2 + 512)
       + *(__int16 *)(a2 + 514) * *(__int16 *)(a2 + 514)
       + *(__int16 *)(a2 + 516) * *(__int16 *)(a2 + 516)
       + *(__int16 *)(a2 + 518) * *(__int16 *)(a2 + 518)
       + *(__int16 *)(a2 + 520) * *(__int16 *)(a2 + 520)
       + *(__int16 *)(a2 + 522) * *(__int16 *)(a2 + 522)
       + *(__int16 *)(a2 + 524) * *(__int16 *)(a2 + 524)
       + *(__int16 *)(a2 + 526) * *(__int16 *)(a2 + 526)
       + *(__int16 *)(a2 + 528) * *(__int16 *)(a2 + 528)
       + *(__int16 *)(a2 + 530) * *(__int16 *)(a2 + 530)
       + *(__int16 *)(a2 + 532) * *(__int16 *)(a2 + 532)
       + *(__int16 *)(a2 + 534) * *(__int16 *)(a2 + 534)
       + *(__int16 *)(a2 + 536) * *(__int16 *)(a2 + 536)
       + v196 * v196;
  if (v197) {
    float v198 = (float)(v6 + v133) / sqrtf((float)v197);
  }
  else {
    float v198 = 1.1755e-38;
  }
  uint64_t v199 = 0;
  int v200 = 0;
  LODWORD(v201) = 0;
  int16x8_t v202 = vmovl_s8((int8x8_t)-1);
  int16x8_t v203 = vmovl_s8((int8x8_t)0xFFFFFF01010101FFLL);
  int16x8_t v204 = vmovl_s8((int8x8_t)-16711169);
  int16x8_t v205 = vmovl_s8((int8x8_t)0xFF01010101FF01FFLL);
  int16x8_t v206 = vmovl_s8((int8x8_t)0x1FF0101010101FFLL);
  int16x8_t v207 = vmovl_s8((int8x8_t)0xFFFFFF0101010101);
  int16x8_t v208 = vmovl_s8((int8x8_t)0x1FF01010101FFFFLL);
  int16x8_t v209 = vmovl_s8((int8x8_t)0xFFFFFF01FFFF01FFLL);
  int16x8_t v211 = *(int16x8_t *)(a2 + 32);
  int16x8_t v210 = *(int16x8_t *)(a2 + 48);
  int32x4_t v212 = vmull_high_s16(v209, v210);
  int32x4_t v213 = vmull_s16(*(int16x4_t *)v209.i8, *(int16x4_t *)v210.i8);
  int16x8_t v214 = vmovl_s8((int8x8_t)0x1FFFF01FFFF01FFLL);
  int16x8_t v215 = *(int16x8_t *)(a2 + 16);
  int32x4_t v216 = vmlal_s16(v213, *(int16x4_t *)v214.i8, *(int16x4_t *)v215.i8);
  int32x4_t v217 = vmlal_high_s16(v212, v214, v215);
  int16x8_t v218 = *(int16x8_t *)(a2 + 64);
  int16x8_t v219 = *(int16x8_t *)(a2 + 80);
  int32x4_t v220 = vmlal_high_s16(v217, v208, v219);
  int32x4_t v221 = vmlal_s16(v216, *(int16x4_t *)v208.i8, *(int16x4_t *)v219.i8);
  int16x8_t v222 = *(int16x8_t *)(a2 + 112);
  int32x4_t v223 = vmlal_s16(v221, *(int16x4_t *)v207.i8, *(int16x4_t *)v222.i8);
  int32x4_t v224 = vmlal_high_s16(v220, v207, v222);
  int16x8_t v225 = *(int16x8_t *)(a2 + 144);
  int16x8_t v226 = *(int16x8_t *)(a2 + 176);
  int32x4_t v227 = vmlal_s16(vmlal_s16(v223, *(int16x4_t *)v205.i8, *(int16x4_t *)v225.i8), *(int16x4_t *)v206.i8, *(int16x4_t *)v226.i8);
  int32x4_t v228 = vmlal_high_s16(vmlal_high_s16(v224, v205, v225), v206, v226);
  int16x8_t v229 = *(int16x8_t *)(a2 + 208);
  int32x4_t v230 = vmlal_high_s16(v228, v205, v229);
  int32x4_t v231 = vmlal_s16(v227, *(int16x4_t *)v205.i8, *(int16x4_t *)v229.i8);
  int16x8_t v232 = *(int16x8_t *)(a2 + 240);
  int32x4_t v233 = vmlal_s16(v231, *(int16x4_t *)v204.i8, *(int16x4_t *)v232.i8);
  int32x4_t v234 = vmlal_high_s16(v230, v204, v232);
  int16x8_t v235 = *(int16x8_t *)(a2 + 272);
  int32x4_t v236 = vmlal_high_s16(v234, v203, v235);
  int32x4_t v237 = vmlal_s16(v233, *(int16x4_t *)v203.i8, *(int16x4_t *)v235.i8);
  int16x8_t v238 = *(int16x8_t *)(a2 + 304);
  int32x4_t v239 = vmlal_s16(v237, *(int16x4_t *)v202.i8, *(int16x4_t *)v238.i8);
  int32x4_t v240 = vmlal_high_s16(v236, v202, v238);
  int16x8_t v241 = vmovl_s8((int8x8_t)0xFF01FF010101FFFFLL);
  int16x8_t v242 = vmovl_s8((int8x8_t)-1);
  int16x8_t v243 = vmovl_s8((int8x8_t)0xFF01FF0101FF0101);
  int16x8_t v244 = vmovl_s8((int8x8_t)0x1FFFF01FF010101);
  int16x8_t v245 = vmovl_s8((int8x8_t)0xFF01FF0101FFFF01);
  int16x8_t v246 = vmovl_s8((int8x8_t)0xFFFFFF0101FFFFFFLL);
  int16x8_t v247 = vmovl_s8((int8x8_t)0x1FF010101FF01FFLL);
  int16x8_t v248 = vmovl_s8((int8x8_t)0xFF01FFFF0101FFFFLL);
  int16x8_t v249 = vmovl_s8((int8x8_t)0x1FFFF01FFFF0101);
  int16x8_t v250 = vmovl_s8((int8x8_t)0x1010101FF010101);
  int v332 = -*(__int16 *)(a2 + 482);
  int v334 = vaddvq_s32(vaddq_s32(vaddq_s32(v239, vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(vmlal_s16(vmull_s16(*(int16x4_t *)v241.i8, *(int16x4_t *)v211.i8), *(int16x4_t *)v250.i8, *(int16x4_t *)a2), *(int16x4_t *)v249.i8, *(int16x4_t *)v218.i8), *(int16x4_t *)v248.i8, *(int16x4_t *)(a2 + 96)),
                           *(int16x4_t *)v247.i8,
                           *(int16x4_t *)(a2 + 128)),
                         *(int16x4_t *)v246.i8,
                         *(int16x4_t *)(a2 + 160)),
                       *(int16x4_t *)v245.i8,
                       *(int16x4_t *)(a2 + 192)),
                     *(int16x4_t *)v244.i8,
                     *(int16x4_t *)(a2 + 224)),
                   *(int16x4_t *)v243.i8,
                   *(int16x4_t *)(a2 + 256)),
                 *(int16x4_t *)v242.i8,
                 *(int16x4_t *)(a2 + 288))),
             vaddq_s32(v240, vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmlal_high_s16(vmull_high_s16(v241, v211), v250, *(int16x8_t *)a2), v249, v218), v248, *(int16x8_t *)(a2 + 96)), v247, *(int16x8_t *)(a2 + 128)), v246, *(int16x8_t *)(a2 + 160)), v245,
                       *(int16x8_t *)(a2 + 192)),
                     v244,
                     *(int16x8_t *)(a2 + 224)),
                   v243,
                   *(int16x8_t *)(a2 + 256)),
                 v242,
                 *(int16x8_t *)(a2 + 288)))))
       - *(__int16 *)(a2 + 320)
       - *(__int16 *)(a2 + 322)
       - *(__int16 *)(a2 + 324)
       - *(__int16 *)(a2 + 326)
       - *(__int16 *)(a2 + 328)
       - *(__int16 *)(a2 + 330)
       - *(__int16 *)(a2 + 332)
       - *(__int16 *)(a2 + 334);
  int v330 = -*(__int16 *)(a2 + 486);
  int v331 = -*(__int16 *)(a2 + 484);
  int v328 = -*(__int16 *)(a2 + 490);
  int v329 = -*(__int16 *)(a2 + 488);
  int v326 = -*(__int16 *)(a2 + 494);
  int v327 = -*(__int16 *)(a2 + 492);
  int v324 = -*(__int16 *)(a2 + 498);
  int v325 = -*(__int16 *)(a2 + 496);
  int v322 = -*(__int16 *)(a2 + 502);
  int v323 = -*(__int16 *)(a2 + 500);
  int v320 = -*(__int16 *)(a2 + 506);
  int v321 = -*(__int16 *)(a2 + 504);
  int v318 = -*(__int16 *)(a2 + 510);
  int v319 = -*(__int16 *)(a2 + 508);
  int v316 = -*(__int16 *)(a2 + 514);
  int v317 = -*(__int16 *)(a2 + 512);
  int v315 = -*(__int16 *)(a2 + 516);
  int v251 = -*(__int16 *)(a2 + 518);
  int v252 = -*(__int16 *)(a2 + 520);
  int v253 = -*(__int16 *)(a2 + 522);
  int v254 = -*(__int16 *)(a2 + 524);
  int v255 = -*(__int16 *)(a2 + 526);
  int v256 = -*(__int16 *)(a2 + 528);
  int v257 = -*(__int16 *)(a2 + 530);
  int v258 = -*(__int16 *)(a2 + 532);
  int v259 = -*(__int16 *)(a2 + 534);
  int v260 = -*(__int16 *)(a2 + 536);
  int v261 = -*(__int16 *)(a2 + 538);
  int16x8_t v263 = *(int16x8_t *)(a2 + 432);
  int16x8_t v262 = *(int16x8_t *)(a2 + 448);
  int32x4_t v264 = vmovl_high_s16(v262);
  int32x4_t v265 = vmovl_s16(*(int16x4_t *)v262.i8);
  int16x8_t v267 = *(int16x8_t *)(a2 + 400);
  int16x8_t v266 = *(int16x8_t *)(a2 + 416);
  int32x4_t v268 = vmovl_high_s16(v266);
  int32x4_t v269 = vmovl_s16(*(int16x4_t *)v266.i8);
  int16x8_t v271 = *(int16x8_t *)(a2 + 368);
  int16x8_t v270 = *(int16x8_t *)(a2 + 384);
  int32x4_t v272 = vmovl_high_s16(v270);
  int32x4_t v273 = vmovl_s16(*(int16x4_t *)v270.i8);
  int16x8_t v275 = *(int16x8_t *)(a2 + 336);
  int16x8_t v274 = *(int16x8_t *)(a2 + 352);
  int32x4_t v276 = vmovl_high_s16(v274);
  int32x4_t v277 = vmovl_s16(*(int16x4_t *)v274.i8);
  int32x4_t v278 = vmovl_high_s16(v263);
  int32x4_t v279 = vmovl_s16(*(int16x4_t *)v263.i8);
  int32x4_t v280 = vmovl_high_s16(v267);
  int32x4_t v281 = vmovl_s16(*(int16x4_t *)v267.i8);
  int32x4_t v282 = vmovl_high_s16(v271);
  int32x4_t v283 = vmovl_s16(*(int16x4_t *)v271.i8);
  int32x4_t v284 = vmovl_high_s16(v275);
  int32x4_t v285 = vmovl_s16(*(int16x4_t *)v275.i8);
  int v286 = *(__int16 *)(a2 + 480);
  int v287 = *(__int16 *)(a2 + 464);
  int v288 = *(__int16 *)(a2 + 466);
  int v289 = *(__int16 *)(a2 + 468);
  int v290 = *(__int16 *)(a2 + 470);
  int v291 = *(__int16 *)(a2 + 472);
  int v292 = *(__int16 *)(a2 + 474);
  int v293 = *(__int16 *)(a2 + 476);
  int v294 = *(__int16 *)(a2 + 478);
  v295 = &byte_100039730;
  do
  {
    int16x8_t v296 = vmovl_s8(*(int8x8_t *)(v295 - 15));
    int16x8_t v297 = vmovl_s8(*(int8x8_t *)(v295 - 31));
    int16x8_t v298 = vmovl_s8(*(int8x8_t *)(v295 - 47));
    int16x8_t v299 = vmovl_s8(*(int8x8_t *)(v295 - 63));
    int32x4_t v300 = vmlaq_s32(vmulq_s32(vmovl_s16(*(int16x4_t *)v299.i8), v277), vmovl_s16(*(int16x4_t *)v298.i8), v273);
    int32x4_t v301 = vmlaq_s32(vmulq_s32(vmovl_high_s16(v299), v276), vmovl_high_s16(v298), v272);
    int16x8_t v302 = vmovl_s8(*(int8x8_t *)(v295 - 23));
    int16x8_t v303 = vmovl_s8(*(int8x8_t *)(v295 - 39));
    int16x8_t v304 = vmovl_s8(*(int8x8_t *)(v295 - 55));
    int16x8_t v305 = vmovl_s8(*(int8x8_t *)(v295 - 71));
    int v306 = vaddvq_s32(vaddq_s32(vaddq_s32(vmlaq_s32(vmlaq_s32(v300, vmovl_s16(*(int16x4_t *)v297.i8), v269), vmovl_s16(*(int16x4_t *)v296.i8), v265), vmlaq_s32(vmlaq_s32(vmlaq_s32(vmulq_s32(vmovl_s16(*(int16x4_t *)v305.i8), v285), vmovl_s16(*(int16x4_t *)v304.i8), v283), vmovl_s16(*(int16x4_t *)v303.i8), v281), vmovl_s16(*(int16x4_t *)v302.i8), v279)), vaddq_s32(vmlaq_s32(vmlaq_s32(v301, vmovl_high_s16(v297), v268), vmovl_high_s16(v296), v264), vmlaq_s32(
                   vmlaq_s32(vmlaq_s32(vmulq_s32(vmovl_high_s16(v305), v284), vmovl_high_s16(v304), v282), vmovl_high_s16(v303), v280), vmovl_high_s16(v302), v278))))+ *(v295 - 7) * v287+ *(v295 - 6) * v288+ *(v295 - 5) * v289+ *(v295 - 4) * v290+ *(v295 - 3) * v291+ *(v295 - 2) * v292+ *(v295 - 1) * v293+ *v295 * v294;
    if (v306 <= v200) {
      uint64_t v201 = v201;
    }
    else {
      uint64_t v201 = v199;
    }
    if (v306 > v200) {
      int v200 = v306;
    }
    ++v199;
    v295 += 72;
  }
  while (v199 != 256);
  if (v197) {
    float v307 = (float)(v261
  }
                 + v260
                 + v334
                 + v259
                 + v258
                 + v257
                 + v256
                 + v255
                 + v254
                 + v253
                 + v252
                 + v251
                 + v315
                 + v316
                 + v317
                 + v318
                 + v319
                 + v320
                 + v321
                 + v322
                 + v323
                 + v324
                 + v325
                 + v326
                 + v327
                 + v328
                 + v329
                 + v330
                 + v331
                 + v332
                 - v286
                 + v200)
         / sqrtf((float)v197);
  else {
    float v307 = 1.1755e-38;
  }
  *(float *)(a1 + 16) = v134;
  *(float *)(a1 + 20) = v198;
  *(float *)(a1 + 24) = v307;
  uint64_t func = (uint64_t (*)(uint64_t, void, uint64_t))__find_func(0xDFDF1FBF40802010, 828694634);
  *(_WORD *)(a1 + 36) = func(a1, v338, v201);
  *(_WORD *)(a1 + 38) = v7;
  v309.i8[4] = v336[3];
  v309.i32[0] = *v336 | 0xFFFFFFE0;
  *(int8x8_t *)v310.i8 = vand_s8(v309, (int8x8_t)0xFF000000FFLL);
  v310.i64[1] = v310.i64[0];
  float32x4_t v311 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v310, (int32x4_t)xmmword_100043E70));
  v312.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_100043E80, v311)).u32[0];
  v312.i32[1] = vmovn_s32(vcgtq_f32(v311, (float32x4_t)xmmword_100043E80)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v312, 0xFuLL))) & ((v336[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    QuickCodec::mask = FunctionTable::ft[0] ^ 0x157E9386;
    v313 = (void (*)(void, uint64_t))__find_func(0xBFBF1F1FC0C00040, 1359274186);
    v313(0, 104);
  }
  return v337;
}

uint64_t Madusa::Decode::_CpmDecode(uint64_t a1, uint64_t a2, int8x8_t a3)
{
  a3.i32[0] = *v3 | 0xFFFFFFE0;
  a3.i8[4] = v3[3];
  *(int8x8_t *)v4.i8 = vand_s8(a3, (int8x8_t)0xFF000000FFLL);
  v4.i64[1] = v4.i64[0];
  float32x4_t v5 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v4, (int32x4_t)xmmword_100043E90));
  v6.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_100043EA0, v5)).u32[0];
  v6.i32[1] = vmovn_s32(vcgtq_f32(v5, (float32x4_t)xmmword_100043EA0)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v6, 0xFuLL))) & ((v3[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    ++QuickCodec::mask;
  }
  return Madusa::Decode::CpmDecode(a1, a2);
}

uint64_t Madusa::Decode::_CpmDecode_Alt(uint64_t a1)
{
  if ((*v1 & 0x1F) != 0 || v1[2] > 0x3Fu)
  {
    int v2 = QuickCodec::mask;
    if (QuickCodec::mask == -70947757) {
      return Madusa::Decode::CpmDecode_Alt(a1);
    }
LABEL_7:
    QuickCodec::mask = v2 + 1;
    return Madusa::Decode::CpmDecode_Alt(a1);
  }
  int v4 = 182790 * v1[3];
  int v2 = QuickCodec::mask;
  if ((v4 ^ 0x24F4CF8 | v4 & 0x24F4CF8) - (v4 + 38751480) + ~(v4 ^ 0x24F4CF8 | ~(v4 | 0x24F4CF8)) == ~(~(~(~(v4 | 0x2460CF0) | v4 & 0x2460CF0) | 0x94008) | ~(~(v4 | 0x2460CF0) | v4 & 0x2460CF0) & 0x94008)
    || QuickCodec::mask != -70947757)
  {
    goto LABEL_7;
  }
  return Madusa::Decode::CpmDecode_Alt(a1);
}

uint64_t Madusa::Decode::CpmDecode_Alt(uint64_t a1)
{
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  uint64_t result = a1 + 16;
  *(void *)(result + 16) = 0xFFFFFFFF00000000;
  return result;
}

void sub_1000120B0()
{
}

BOOL sub_1000120C4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2
      && a1[1] == a2[1]
      && a1[2] == a2[2]
      && a1[3] == a2[3]
      && a1[4] == a2[4]
      && a1[5] == a2[5]
      && a1[6] == a2[6]
      && a1[7] == a2[7]
      && a1[8] == a2[8]
      && a1[9] == a2[9]
      && a1[10] == a2[10]
      && a1[11] == a2[11]
      && a1[12] == a2[12]
      && a1[13] == a2[13]
      && a1[14] == a2[14]
      && a1[15] == a2[15]
      && a1[16] == a2[16]
      && a1[17] == a2[17]
      && a1[18] == a2[18]
      && a1[19] == a2[19]
      && a1[20] == a2[20]
      && a1[21] == a2[21]
      && a1[22] == a2[22]
      && a1[23] == a2[23]
      && a1[24] == a2[24]
      && a1[25] == a2[25]
      && a1[26] == a2[26]
      && a1[27] == a2[27]
      && a1[28] == a2[28]
      && a1[29] == a2[29]
      && a1[30] == a2[30]
      && a1[31] == a2[31]
      && a1[32] == a2[32]
      && a1[33] == a2[33]
      && a1[34] == a2[34]
      && a1[35] == a2[35]
      && a1[36] == a2[36]
      && a1[37] == a2[37]
      && a1[38] == a2[38]
      && a1[39] == a2[39]
      && a1[40] == a2[40]
      && a1[41] == a2[41]
      && a1[42] == a2[42]
      && a1[43] == a2[43]
      && a1[44] == a2[44];
}

int32x4_t *Madusa::PhaseDeviation::PhaseDeviation(int32x4_t *this)
{
  int v2 = this + 14;
  bzero(this, 0xEB0uLL);
  this[87].i32[0] = -1;
  this[105].i32[2] = -1;
  this[124].i32[0] = -1;
  this[142].i32[2] = -1;
  this[161].i32[0] = -1;
  this[179].i32[2] = -1;
  this[198].i32[0] = -1;
  this[216].i32[2] = -1;
  bzero(&this[235], 0x400uLL);
  int v3 = this + 84;
  BOOL v5 = v2 < (int32x4_t *)&Madusa::AffineTransform::mGridPointV
    && v3 > (int32x4_t *)&Madusa::AffineTransform::mGridPointU;
  if ((v3 <= (int32x4_t *)&Madusa::AffineTransform::mGridPointV
     || v2 >= (int32x4_t *)&Madusa::AffineTransform::mGridPointPhaseInRadians)
    && !v5)
  {
    float32x4_t v11 = (float32x4_t)vdupq_n_s32(0x4622F983u);
    v12.i64[0] = 0x3F0000003F000000;
    v12.i64[1] = 0x3F0000003F000000;
    this[70] = vshlq_n_s32((int32x4_t)Madusa::AffineTransform::mGridPointU, 9uLL);
    v13.i64[0] = 0x3F0000003F000000;
    v13.i64[1] = 0x3F0000003F000000;
    this[14] = vcvtq_s32_f32(vmlaq_f32(v12, (float32x4_t)Madusa::AffineTransform::mGridPointPhaseInRadians, v11));
    this[15] = vcvtq_s32_f32(vmlaq_f32(v13, unk_10006E340, v11));
    this[56] = vshlq_n_s32((int32x4_t)Madusa::AffineTransform::mGridPointV, 9uLL);
    this[57] = vshlq_n_s32(unk_10006E260, 9uLL);
    this[71] = vshlq_n_s32(unk_10006E180, 9uLL);
    v12.i64[0] = 0x3F0000003F000000;
    v12.i64[1] = 0x3F0000003F000000;
    this[72] = vshlq_n_s32((int32x4_t)xmmword_10006E190, 9uLL);
    v13.i64[0] = 0x3F0000003F000000;
    v13.i64[1] = 0x3F0000003F000000;
    this[16] = vcvtq_s32_f32(vmlaq_f32(v12, (float32x4_t)xmmword_10006E350, v11));
    this[17] = vcvtq_s32_f32(vmlaq_f32(v13, unk_10006E360, v11));
    this[58] = vshlq_n_s32((int32x4_t)xmmword_10006E270, 9uLL);
    this[59] = vshlq_n_s32(unk_10006E280, 9uLL);
    this[73] = vshlq_n_s32(unk_10006E1A0, 9uLL);
    v12.i64[0] = 0x3F0000003F000000;
    v12.i64[1] = 0x3F0000003F000000;
    this[74] = vshlq_n_s32((int32x4_t)xmmword_10006E1B0, 9uLL);
    v13.i64[0] = 0x3F0000003F000000;
    v13.i64[1] = 0x3F0000003F000000;
    this[18] = vcvtq_s32_f32(vmlaq_f32(v12, (float32x4_t)xmmword_10006E370, v11));
    this[19] = vcvtq_s32_f32(vmlaq_f32(v13, unk_10006E380, v11));
    this[60] = vshlq_n_s32((int32x4_t)xmmword_10006E290, 9uLL);
    this[61] = vshlq_n_s32(unk_10006E2A0, 9uLL);
    this[75] = vshlq_n_s32(unk_10006E1C0, 9uLL);
    v12.i64[0] = 0x3F0000003F000000;
    v12.i64[1] = 0x3F0000003F000000;
    this[76] = vshlq_n_s32((int32x4_t)xmmword_10006E1D0, 9uLL);
    v13.i64[0] = 0x3F0000003F000000;
    v13.i64[1] = 0x3F0000003F000000;
    this[20] = vcvtq_s32_f32(vmlaq_f32(v12, (float32x4_t)xmmword_10006E390, v11));
    this[21] = vcvtq_s32_f32(vmlaq_f32(v13, unk_10006E3A0, v11));
    this[62] = vshlq_n_s32((int32x4_t)xmmword_10006E2B0, 9uLL);
    this[63] = vshlq_n_s32(unk_10006E2C0, 9uLL);
    this[77] = vshlq_n_s32(unk_10006E1E0, 9uLL);
    v12.i64[0] = 0x3F0000003F000000;
    v12.i64[1] = 0x3F0000003F000000;
    this[64] = vshlq_n_s32((int32x4_t)xmmword_10006E2D0, 9uLL);
    this[78] = vshlq_n_s32((int32x4_t)xmmword_10006E1F0, 9uLL);
    v13.i64[0] = 0x3F0000003F000000;
    v13.i64[1] = 0x3F0000003F000000;
    this[22] = vcvtq_s32_f32(vmlaq_f32(v12, (float32x4_t)xmmword_10006E3B0, v11));
    this[23] = vcvtq_s32_f32(vmlaq_f32(v13, unk_10006E3C0, v11));
    this[65] = vshlq_n_s32(unk_10006E2E0, 9uLL);
    this[79] = vshlq_n_s32(unk_10006E200, 9uLL);
    v12.i64[0] = 0x3F0000003F000000;
    v12.i64[1] = 0x3F0000003F000000;
    this[66] = vshlq_n_s32((int32x4_t)xmmword_10006E2F0, 9uLL);
    this[80] = vshlq_n_s32((int32x4_t)xmmword_10006E210, 9uLL);
    v13.i64[0] = 0x3F0000003F000000;
    v13.i64[1] = 0x3F0000003F000000;
    this[24] = vcvtq_s32_f32(vmlaq_f32(v12, (float32x4_t)xmmword_10006E3D0, v11));
    this[25] = vcvtq_s32_f32(vmlaq_f32(v13, unk_10006E3E0, v11));
    this[67] = vshlq_n_s32(unk_10006E300, 9uLL);
    this[81] = vshlq_n_s32(unk_10006E220, 9uLL);
    v12.i64[0] = 0x3F0000003F000000;
    v12.i64[1] = 0x3F0000003F000000;
    this[68] = vshlq_n_s32((int32x4_t)xmmword_10006E310, 9uLL);
    v13.i64[0] = 0x3F0000003F000000;
    v13.i64[1] = 0x3F0000003F000000;
    this[82] = vshlq_n_s32((int32x4_t)xmmword_10006E230, 9uLL);
    this[26] = vcvtq_s32_f32(vmlaq_f32(v12, (float32x4_t)xmmword_10006E3F0, v11));
    this[27] = vcvtq_s32_f32(vmlaq_f32(v13, unk_10006E400, v11));
    this[69] = vshlq_n_s32(unk_10006E320, 9uLL);
    this[83] = vshlq_n_s32(unk_10006E240, 9uLL);
    return this;
  }
  else
  {
    for (uint64_t i = 0; i != 56; ++i)
    {
      int16x8_t v9 = &this->i32[i];
      v9[56] = (int)(float)((float)(*(float *)((char *)&Madusa::AffineTransform::mGridPointPhaseInRadians + i * 4)
                                  * 10430.0)
                          + 0.5);
      v9[224] = *(_DWORD *)((char *)&Madusa::AffineTransform::mGridPointV + i * 4) << 9;
      v9[280] = *(_DWORD *)((char *)&Madusa::AffineTransform::mGridPointU + i * 4) << 9;
    }
    return this;
  }
}

uint64_t Madusa::PhaseDeviation::Execute(int32x4_t *a1, uint64_t a2, int a3, char a4, uint64_t a5)
{
  uint64_t v8 = 0;
  uint64_t v9 = 44;
  do
  {
    while (!*(unsigned char *)(a2 + v9))
    {
      int16x8_t v10 = &a1->i8[v8 * 4];
      *((_DWORD *)v10 + 224) = 0;
      *((_DWORD *)v10 + 280) = 0;
      a1->i32[v8] = a1[14].i32[v8] + 0x4000;
      ++v8;
      v9 += 16;
      if (v8 == 56) {
        goto LABEL_5;
      }
    }
    float32x4_t v11 = &a1->i8[v8 * 4];
    *((_DWORD *)v11 + 224) = *(_DWORD *)((char *)&Madusa::AffineTransform::mGridPointV + v8 * 4) << 9;
    *((_DWORD *)v11 + 280) = *(_DWORD *)((char *)&Madusa::AffineTransform::mGridPointU + v8 * 4) << 9;
    a1->i32[v8] = vcvts_n_s32_f32(*(float *)(a2 + 1 * v8 + 40), 0x10uLL);
    ++v8;
    v9 += 16;
  }
  while (v8 != 56);
LABEL_5:
  float32x4_t v12 = a1 + 87;
  Madusa::PhaseDeviation::OrientPhases((uint64_t)a1, a1->i32, a1 + 28, 1);
  v13.i64[0] = 0xFFFF0000FFFFLL;
  v13.i64[1] = 0xFFFF0000FFFFLL;
  int8x16_t v14 = vandq_s8((int8x16_t)vsubq_s32(a1[29], a1[15]), v13);
  a1[28] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[28], a1[14]), v13);
  a1[29] = (int32x4_t)v14;
  int8x16_t v15 = vandq_s8((int8x16_t)vsubq_s32(a1[31], a1[17]), v13);
  a1[30] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[30], a1[16]), v13);
  a1[31] = (int32x4_t)v15;
  int8x16_t v16 = vandq_s8((int8x16_t)vsubq_s32(a1[33], a1[19]), v13);
  a1[32] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[32], a1[18]), v13);
  a1[33] = (int32x4_t)v16;
  int8x16_t v17 = vandq_s8((int8x16_t)vsubq_s32(a1[35], a1[21]), v13);
  a1[34] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[34], a1[20]), v13);
  a1[35] = (int32x4_t)v17;
  int8x16_t v18 = vandq_s8((int8x16_t)vsubq_s32(a1[37], a1[23]), v13);
  a1[36] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[36], a1[22]), v13);
  a1[37] = (int32x4_t)v18;
  int8x16_t v19 = vandq_s8((int8x16_t)vsubq_s32(a1[39], a1[25]), v13);
  a1[38] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[38], a1[24]), v13);
  a1[39] = (int32x4_t)v19;
  int8x16_t v20 = vandq_s8((int8x16_t)vsubq_s32(a1[41], a1[27]), v13);
  a1[40] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[40], a1[26]), v13);
  a1[41] = (int32x4_t)v20;
  __src[0] = -1;
  LOWORD(__src[1]) = 0;
  uint64_t func = (void (*)(int32x4_t *, int32x4_t *, _DWORD *))__find_func(0x1F7F7F7FC0404020, -238780246);
  func(a1, a1 + 28, __src);
  int32x4_t v22 = memcpy(&a1[87], __src, 0x128uLL);
  a1[87].i32[0] = 1;
  a1[87].i16[2] = 0;
  Madusa::PhaseDeviation::OrientPhases((uint64_t)v22, a1->i32, a1 + 28, 2);
  v23.i64[0] = 0xFFFF0000FFFFLL;
  v23.i64[1] = 0xFFFF0000FFFFLL;
  int8x16_t v24 = vandq_s8((int8x16_t)vsubq_s32(a1[29], a1[15]), v23);
  a1[28] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[28], a1[14]), v23);
  a1[29] = (int32x4_t)v24;
  int8x16_t v25 = vandq_s8((int8x16_t)vsubq_s32(a1[31], a1[17]), v23);
  a1[30] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[30], a1[16]), v23);
  a1[31] = (int32x4_t)v25;
  int8x16_t v26 = vandq_s8((int8x16_t)vsubq_s32(a1[33], a1[19]), v23);
  a1[32] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[32], a1[18]), v23);
  a1[33] = (int32x4_t)v26;
  int8x16_t v27 = vandq_s8((int8x16_t)vsubq_s32(a1[35], a1[21]), v23);
  a1[34] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[34], a1[20]), v23);
  a1[35] = (int32x4_t)v27;
  int8x16_t v28 = vandq_s8((int8x16_t)vsubq_s32(a1[37], a1[23]), v23);
  a1[36] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[36], a1[22]), v23);
  a1[37] = (int32x4_t)v28;
  int8x16_t v29 = vandq_s8((int8x16_t)vsubq_s32(a1[39], a1[25]), v23);
  a1[38] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[38], a1[24]), v23);
  a1[39] = (int32x4_t)v29;
  int8x16_t v30 = vandq_s8((int8x16_t)vsubq_s32(a1[41], a1[27]), v23);
  a1[40] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[40], a1[26]), v23);
  a1[41] = (int32x4_t)v30;
  __src[0] = -1;
  LOWORD(__src[1]) = 0;
  int16x8_t v31 = (void (*)(int32x4_t *, int32x4_t *, _DWORD *))__find_func(0x1F7F7F7FC0404020, -238780246);
  v31(a1, a1 + 28, __src);
  int8x16_t v32 = memcpy(&a1[105].u64[1], __src, 0x128uLL);
  a1[105].i32[2] = 2;
  a1[105].i16[6] = 0;
  Madusa::PhaseDeviation::OrientPhases((uint64_t)v32, a1->i32, a1 + 28, 3);
  v33.i64[0] = 0xFFFF0000FFFFLL;
  v33.i64[1] = 0xFFFF0000FFFFLL;
  int8x16_t v34 = vandq_s8((int8x16_t)vsubq_s32(a1[29], a1[15]), v33);
  a1[28] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[28], a1[14]), v33);
  a1[29] = (int32x4_t)v34;
  int8x16_t v35 = vandq_s8((int8x16_t)vsubq_s32(a1[31], a1[17]), v33);
  a1[30] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[30], a1[16]), v33);
  a1[31] = (int32x4_t)v35;
  int8x16_t v36 = vandq_s8((int8x16_t)vsubq_s32(a1[33], a1[19]), v33);
  a1[32] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[32], a1[18]), v33);
  a1[33] = (int32x4_t)v36;
  int8x16_t v37 = vandq_s8((int8x16_t)vsubq_s32(a1[35], a1[21]), v33);
  a1[34] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[34], a1[20]), v33);
  a1[35] = (int32x4_t)v37;
  int8x16_t v38 = vandq_s8((int8x16_t)vsubq_s32(a1[37], a1[23]), v33);
  a1[36] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[36], a1[22]), v33);
  a1[37] = (int32x4_t)v38;
  int8x16_t v39 = vandq_s8((int8x16_t)vsubq_s32(a1[39], a1[25]), v33);
  a1[38] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[38], a1[24]), v33);
  a1[39] = (int32x4_t)v39;
  int8x16_t v40 = vandq_s8((int8x16_t)vsubq_s32(a1[41], a1[27]), v33);
  a1[40] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[40], a1[26]), v33);
  a1[41] = (int32x4_t)v40;
  __src[0] = -1;
  LOWORD(__src[1]) = 0;
  unsigned int v41 = (void (*)(int32x4_t *, int32x4_t *, _DWORD *))__find_func(0x1F7F7F7FC0404020, -238780246);
  v41(a1, a1 + 28, __src);
  int v42 = memcpy(&a1[124], __src, 0x128uLL);
  a1[124].i32[0] = 3;
  a1[124].i16[2] = 0;
  unint64_t v43 = 4;
  Madusa::PhaseDeviation::OrientPhases((uint64_t)v42, a1->i32, a1 + 28, 4);
  v44.i64[0] = 0xFFFF0000FFFFLL;
  v44.i64[1] = 0xFFFF0000FFFFLL;
  int8x16_t v45 = vandq_s8((int8x16_t)vsubq_s32(a1[29], a1[15]), v44);
  a1[28] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[28], a1[14]), v44);
  a1[29] = (int32x4_t)v45;
  int8x16_t v46 = vandq_s8((int8x16_t)vsubq_s32(a1[31], a1[17]), v44);
  a1[30] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[30], a1[16]), v44);
  a1[31] = (int32x4_t)v46;
  int8x16_t v47 = vandq_s8((int8x16_t)vsubq_s32(a1[33], a1[19]), v44);
  a1[32] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[32], a1[18]), v44);
  a1[33] = (int32x4_t)v47;
  int8x16_t v48 = vandq_s8((int8x16_t)vsubq_s32(a1[35], a1[21]), v44);
  a1[34] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[34], a1[20]), v44);
  a1[35] = (int32x4_t)v48;
  int8x16_t v49 = vandq_s8((int8x16_t)vsubq_s32(a1[37], a1[23]), v44);
  a1[36] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[36], a1[22]), v44);
  a1[37] = (int32x4_t)v49;
  int8x16_t v50 = vandq_s8((int8x16_t)vsubq_s32(a1[39], a1[25]), v44);
  a1[38] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[38], a1[24]), v44);
  a1[39] = (int32x4_t)v50;
  int8x16_t v51 = vandq_s8((int8x16_t)vsubq_s32(a1[41], a1[27]), v44);
  a1[40] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[40], a1[26]), v44);
  a1[41] = (int32x4_t)v51;
  __src[0] = -1;
  LOWORD(__src[1]) = 0;
  int8x16_t v52 = (void (*)(int32x4_t *, int32x4_t *, _DWORD *))__find_func(0x1F7F7F7FC0404020, -238780246);
  v52(a1, a1 + 28, __src);
  int16x8_t v53 = memcpy(&a1[142].u64[1], __src, 0x128uLL);
  uint64_t v266 = 4;
  a1[142].i32[2] = 4;
  a1[142].i16[6] = 0;
  if (a4)
  {
    int16x8_t v54 = (uint64_t (*)(int32x4_t *, int32x4_t *))__find_func(0x6F7F5FDFA0004020, -2117820406);
    int16x8_t v53 = (void *)v54(a1, a1 + 87);
    uint64_t v266 = 8;
  }
  uint64_t v55 = 0;
  int v56 = 0;
  int8x16_t v57 = &a1[87].i8[8];
  unint64_t v58 = 0xFFFFFFFFLL;
  do
  {
    uint64_t v59 = 0;
    uint64_t v268 = v55;
    int16x8_t v60 = (unsigned int *)v12 + 74 * v55;
    do
    {
      unint64_t v61 = *(void *)&v57[v59];
      Madusa::PhaseDeviation::OrientPhases((uint64_t)v53, a1->i32, a1 + 28, *(void *)v60);
      v62.i64[0] = 0xFFFF0000FFFFLL;
      v62.i64[1] = 0xFFFF0000FFFFLL;
      int8x16_t v63 = vandq_s8((int8x16_t)vsubq_s32(a1[29], a1[15]), v62);
      int8x16_t v64 = vandq_s8((int8x16_t)vsubq_s32(a1[30], a1[16]), v62);
      int8x16_t v65 = vandq_s8((int8x16_t)vsubq_s32(a1[31], a1[17]), v62);
      int8x16_t v66 = vandq_s8((int8x16_t)vsubq_s32(a1[32], a1[18]), v62);
      int8x16_t v67 = vandq_s8((int8x16_t)vsubq_s32(a1[33], a1[19]), v62);
      int8x16_t v68 = vandq_s8((int8x16_t)vsubq_s32(a1[34], a1[20]), v62);
      int8x16_t v69 = vandq_s8((int8x16_t)vsubq_s32(a1[35], a1[21]), v62);
      int32x4_t v70 = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[36], a1[22]), v62);
      int32x4_t v71 = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[37], a1[23]), v62);
      int32x4_t v72 = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[38], a1[24]), v62);
      int32x4_t v73 = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[39], a1[25]), v62);
      int32x4_t v74 = vsubq_s32(a1[41], a1[27]);
      int32x4_t v75 = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[40], a1[26]), v62);
      int32x4_t v76 = vdupq_n_s32(HIDWORD(v61));
      int32x4_t v77 = vdupq_n_s32(v61);
      uint32x4_t v78 = (uint32x4_t)vmlaq_s32(vmulq_s32(a1[56], v77), a1[70], v76);
      uint32x4_t v79 = (uint32x4_t)vmlaq_s32(vmulq_s32(a1[57], v77), a1[71], v76);
      a1[28] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[28], a1[14]), v62);
      a1[29] = (int32x4_t)v63;
      int32x4_t v80 = vshlq_n_s32(vsraq_n_s32(a1[28], (int32x4_t)vsraq_n_u32(v78, v78, 0x1FuLL), 1uLL), 0x10uLL);
      int32x4_t v81 = vshlq_n_s32(vsraq_n_s32(a1[29], (int32x4_t)vsraq_n_u32(v79, v79, 0x1FuLL), 1uLL), 0x10uLL);
      int8x16_t v82 = (int8x16_t)vshrq_n_s32(v80, 0x10uLL);
      int32x4_t v83 = vcltzq_s32(v80);
      int32x4_t v84 = (int32x4_t)veorq_s8(v82, (int8x16_t)v83);
      int32x4_t v85 = a1[59];
      uint32x4_t v86 = (uint32x4_t)vmlaq_s32(vmulq_s32(a1[58], v77), a1[72], v76);
      a1[30] = (int32x4_t)v64;
      a1[31] = (int32x4_t)v65;
      int32x4_t v87 = a1[31];
      int32x4_t v88 = vshlq_n_s32(vsraq_n_s32(a1[30], (int32x4_t)vsraq_n_u32(v86, v86, 0x1FuLL), 1uLL), 0x10uLL);
      int32x4_t v89 = vsraq_n_s32(v83, v88, 0x1FuLL);
      a1[32] = (int32x4_t)v66;
      a1[33] = (int32x4_t)v67;
      uint32x4_t v90 = (uint32x4_t)vmlaq_s32(vmulq_s32(v85, v77), a1[73], v76);
      int32x4_t v91 = vshlq_n_s32(vsraq_n_s32(v87, (int32x4_t)vsraq_n_u32(v90, v90, 0x1FuLL), 1uLL), 0x10uLL);
      int32x4_t v92 = (int32x4_t)veorq_s8((int8x16_t)vshrq_n_s32(v88, 0x10uLL), (int8x16_t)vcltzq_s32(v88));
      int32x4_t v93 = a1[61];
      uint32x4_t v94 = (uint32x4_t)vmlaq_s32(vmulq_s32(a1[60], v77), a1[74], v76);
      int32x4_t v95 = a1[33];
      int32x4_t v96 = vsraq_n_s32(a1[32], (int32x4_t)vsraq_n_u32(v94, v94, 0x1FuLL), 1uLL);
      int32x4_t v97 = vcltzq_s32(v81);
      int32x4_t v98 = (int32x4_t)veorq_s8((int8x16_t)vshrq_n_s32(v81, 0x10uLL), (int8x16_t)v97);
      a1[34] = (int32x4_t)v68;
      a1[35] = (int32x4_t)v69;
      int32x4_t v99 = vshlq_n_s32(v96, 0x10uLL);
      int32x4_t v100 = vaddq_s32(v84, v92);
      int32x4_t v101 = vsraq_n_s32(v97, v91, 0x1FuLL);
      a1[36] = v70;
      a1[37] = v71;
      int32x4_t v102 = vaddq_s32(v98, (int32x4_t)veorq_s8((int8x16_t)vshrq_n_s32(v91, 0x10uLL), (int8x16_t)vcltzq_s32(v91)));
      uint32x4_t v103 = (uint32x4_t)vmlaq_s32(vmulq_s32(v93, v77), a1[75], v76);
      int32x4_t v104 = vshlq_n_s32(vsraq_n_s32(v95, (int32x4_t)vsraq_n_u32(v103, v103, 0x1FuLL), 1uLL), 0x10uLL);
      int32x4_t v105 = (int32x4_t)veorq_s8((int8x16_t)vshrq_n_s32(v104, 0x10uLL), (int8x16_t)vcltzq_s32(v104));
      int32x4_t v106 = a1[63];
      uint32x4_t v107 = (uint32x4_t)vmlaq_s32(vmulq_s32(a1[62], v77), a1[76], v76);
      int32x4_t v108 = a1[35];
      int32x4_t v109 = vsraq_n_s32(a1[34], (int32x4_t)vsraq_n_u32(v107, v107, 0x1FuLL), 1uLL);
      a1[38] = v72;
      a1[39] = v73;
      int32x4_t v110 = vshlq_n_s32(v109, 0x10uLL);
      int32x4_t v111 = vsraq_n_s32(vsraq_n_s32(v89, v99, 0x1FuLL), v110, 0x1FuLL);
      int32x4_t v112 = vsraq_n_s32(v101, v104, 0x1FuLL);
      a1[40] = v75;
      a1[41] = (int32x4_t)vandq_s8((int8x16_t)v74, v62);
      uint32x4_t v113 = (uint32x4_t)vmlaq_s32(vmulq_s32(v106, v77), a1[77], v76);
      int32x4_t v114 = vshlq_n_s32(vsraq_n_s32(v108, (int32x4_t)vsraq_n_u32(v113, v113, 0x1FuLL), 1uLL), 0x10uLL);
      int32x4_t v115 = (int32x4_t)veorq_s8((int8x16_t)vshrq_n_s32(v110, 0x10uLL), (int8x16_t)vcltzq_s32(v110));
      uint32x4_t v116 = (uint32x4_t)vmlaq_s32(vmulq_s32(a1[64], v77), a1[78], v76);
      int32x4_t v117 = vshlq_n_s32(vsraq_n_s32(v70, (int32x4_t)vsraq_n_u32(v116, v116, 0x1FuLL), 1uLL), 0x10uLL);
      int32x4_t v118 = vaddq_s32(v100, vaddq_s32((int32x4_t)veorq_s8((int8x16_t)vshrq_n_s32(v99, 0x10uLL), (int8x16_t)vcltzq_s32(v99)), v115));
      int32x4_t v119 = vsraq_n_s32(v112, v114, 0x1FuLL);
      int32x4_t v120 = vaddq_s32(v102, vaddq_s32(v105, (int32x4_t)veorq_s8((int8x16_t)vshrq_n_s32(v114, 0x10uLL), (int8x16_t)vcltzq_s32(v114))));
      uint32x4_t v121 = (uint32x4_t)vmlaq_s32(vmulq_s32(a1[65], v77), a1[79], v76);
      int32x4_t v122 = vshlq_n_s32(vsraq_n_s32(v71, (int32x4_t)vsraq_n_u32(v121, v121, 0x1FuLL), 1uLL), 0x10uLL);
      int32x4_t v123 = (int32x4_t)veorq_s8((int8x16_t)vshrq_n_s32(v122, 0x10uLL), (int8x16_t)vcltzq_s32(v122));
      uint32x4_t v124 = (uint32x4_t)vmlaq_s32(vmulq_s32(a1[66], v77), a1[80], v76);
      int32x4_t v125 = vshlq_n_s32(vsraq_n_s32(v72, (int32x4_t)vsraq_n_u32(v124, v124, 0x1FuLL), 1uLL), 0x10uLL);
      int32x4_t v126 = vsraq_n_s32(v119, v122, 0x1FuLL);
      uint32x4_t v127 = (uint32x4_t)vmlaq_s32(vmulq_s32(a1[67], v77), a1[81], v76);
      int32x4_t v128 = vshlq_n_s32(vsraq_n_s32(v73, (int32x4_t)vsraq_n_u32(v127, v127, 0x1FuLL), 1uLL), 0x10uLL);
      uint32x4_t v129 = (uint32x4_t)vmlaq_s32(vmulq_s32(a1[68], v77), a1[82], v76);
      int32x4_t v130 = vshlq_n_s32(vsraq_n_s32(v75, (int32x4_t)vsraq_n_u32(v129, v129, 0x1FuLL), 1uLL), 0x10uLL);
      uint32x4_t v131 = (uint32x4_t)vmlaq_s32(vmulq_s32(a1[69], v77), a1[83], v76);
      int32x4_t v132 = vshlq_n_s32(vsraq_n_s32(v74, (int32x4_t)vsraq_n_u32(v131, v131, 0x1FuLL), 1uLL), 0x10uLL);
      int v133 = vaddvq_s32(vaddq_s32(vaddq_s32(vsubq_s32(vsraq_n_s32(vsraq_n_s32(vsraq_n_s32(v111, v117, 0x1FuLL), v125, 0x1FuLL), v130, 0x1FuLL), vaddq_s32(v118, vaddq_s32(vaddq_s32((int32x4_t)veorq_s8((int8x16_t)vshrq_n_s32(v117, 0x10uLL), (int8x16_t)vcltzq_s32(v117)), (int32x4_t)veorq_s8((int8x16_t)vshrq_n_s32(v125, 0x10uLL), (int8x16_t)vcltzq_s32(v125))), (int32x4_t)veorq_s8((int8x16_t)vshrq_n_s32(v130, 0x10uLL), (int8x16_t)vcltzq_s32(v130))))), vsubq_s32(vsraq_n_s32(vsraq_n_s32(v126, v128, 0x1FuLL), v132, 0x1FuLL), vaddq_s32(v120, vaddq_s32(vaddq_s32(v123, (int32x4_t)veorq_s8((int8x16_t)vshrq_n_s32(v128, 0x10uLL), (int8x16_t)vcltzq_s32(v128))),
                         (int32x4_t)veorq_s8((int8x16_t)vshrq_n_s32(v132, 0x10uLL), (int8x16_t)vcltzq_s32(v132)))))),
                 (int32x4_t)xmmword_100043F00));
      if (v133 > v56)
      {
        unint64_t v58 = *v60 | ((unint64_t)*((unsigned __int16 *)v60 + 2) << 32);
        unint64_t v43 = v61;
        int v56 = v133;
      }
      if (a3 && 1835008 - v133 > v56)
      {
        unint64_t v58 = *v60 | ((unint64_t)*((unsigned __int8 *)v60 + 4) << 32) | 0x10000000000;
        unint64_t v43 = v61;
        int v56 = 1835008 - v133;
      }
      v59 += 8;
    }
    while (v59 != 288);
    uint64_t v55 = v268 + 1;
    v57 += 296;
    float32x4_t v12 = a1 + 87;
  }
  while (v268 + 1 != v266);
  Madusa::PhaseDeviation::OrientPhases((uint64_t)v53, a1->i32, a1 + 28, v58);
  v134.i64[0] = 0xFFFF0000FFFFLL;
  v134.i64[1] = 0xFFFF0000FFFFLL;
  int8x16_t v135 = vandq_s8((int8x16_t)vsubq_s32(a1[29], a1[15]), v134);
  a1[28] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[28], a1[14]), v134);
  a1[29] = (int32x4_t)v135;
  int8x16_t v136 = vandq_s8((int8x16_t)vsubq_s32(a1[31], a1[17]), v134);
  a1[30] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[30], a1[16]), v134);
  a1[31] = (int32x4_t)v136;
  int8x16_t v137 = vandq_s8((int8x16_t)vsubq_s32(a1[33], a1[19]), v134);
  a1[32] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[32], a1[18]), v134);
  a1[33] = (int32x4_t)v137;
  int8x16_t v138 = vandq_s8((int8x16_t)vsubq_s32(a1[35], a1[21]), v134);
  a1[34] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[34], a1[20]), v134);
  a1[35] = (int32x4_t)v138;
  int32x4_t v139 = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[37], a1[23]), v134);
  int32x4_t v253 = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[36], a1[22]), v134);
  a1[36] = v253;
  a1[37] = v139;
  int8x16_t v140 = vandq_s8((int8x16_t)vsubq_s32(a1[38], a1[24]), v134);
  int32x4_t v141 = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[39], a1[25]), v134);
  a1[38] = (int32x4_t)v140;
  a1[39] = v141;
  int32x4_t v142 = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[40], a1[26]), v134);
  int32x4_t v143 = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[41], a1[27]), v134);
  a1[40] = v142;
  a1[41] = v143;
  unint64_t v144 = (8 * v43) | ((unint64_t)HIDWORD(v43) << 35);
  int32x4_t v145 = a1[28];
  int32x4_t v146 = a1[29];
  int32x4_t v147 = a1[70];
  int32x4_t v148 = a1[71];
  int32x4_t v150 = a1[30];
  int32x4_t v149 = a1[31];
  int32x4_t v151 = a1[72];
  int32x4_t v152 = a1[73];
  int32x4_t v153 = a1[75];
  int v154 = -7;
  int32x4_t v155 = a1[79];
  int32x4_t v156 = a1[80];
  do
  {
    uint64_t v157 = (v154 + 8 * v43);
    int32x4_t v158 = vdupq_n_s32(v157);
    int32x4_t v267 = vmulq_s32(a1[57], v158);
    int32x4_t v269 = vmulq_s32(a1[56], v158);
    int32x4_t v264 = vmulq_s32(a1[59], v158);
    int32x4_t v265 = vmulq_s32(a1[58], v158);
    int32x4_t v262 = vmulq_s32(a1[61], v158);
    int32x4_t v263 = vmulq_s32(a1[60], v158);
    int32x4_t v260 = vmulq_s32(a1[63], v158);
    int32x4_t v261 = vmulq_s32(a1[62], v158);
    int32x4_t v258 = vmulq_s32(a1[65], v158);
    int32x4_t v259 = vmulq_s32(a1[64], v158);
    int32x4_t v256 = vmulq_s32(a1[67], v158);
    int32x4_t v257 = vmulq_s32(a1[66], v158);
    int32x4_t v254 = vmulq_s32(a1[69], v158);
    int32x4_t v255 = vmulq_s32(a1[68], v158);
    for (int i = -7; i != 8; ++i)
    {
      uint64_t v160 = ((v43 >> 29) & 0xFFFFFFF8) + i;
      int32x4_t v161 = vdupq_n_s32(v160);
      int32x4_t v162 = vmlaq_s32(v269, v147, v161);
      int32x4_t v163 = vmlaq_s32(v267, v148, v161);
      int32x4_t v164 = vsraq_n_s32(v145, (int32x4_t)vsraq_n_u32((uint32x4_t)v162, (uint32x4_t)vcltzq_s32(v162), 0x1CuLL), 4uLL);
      int32x4_t v165 = vsraq_n_s32(v146, (int32x4_t)vsraq_n_u32((uint32x4_t)v163, (uint32x4_t)vcltzq_s32(v163), 0x1CuLL), 4uLL);
      int32x4_t v166 = vshlq_n_s32(v164, 0x10uLL);
      int32x4_t v167 = vshlq_n_s32(v165, 0x10uLL);
      int8x16_t v168 = (int8x16_t)vshrq_n_s32(v166, 0x10uLL);
      int8x16_t v169 = (int8x16_t)vshrq_n_s32(v167, 0x10uLL);
      int32x4_t v170 = vcltzq_s32(v166);
      int32x4_t v171 = vmlaq_s32(v265, v151, v161);
      int32x4_t v172 = vcltzq_s32(v167);
      int32x4_t v173 = vshlq_n_s32(vsraq_n_s32(v150, (int32x4_t)vsraq_n_u32((uint32x4_t)v171, (uint32x4_t)vcltzq_s32(v171), 0x1CuLL), 4uLL), 0x10uLL);
      int32x4_t v174 = (int32x4_t)veorq_s8(v168, (int8x16_t)v170);
      int32x4_t v175 = vmlaq_s32(v264, v152, v161);
      int32x4_t v176 = (int32x4_t)veorq_s8(v169, (int8x16_t)v172);
      int32x4_t v177 = vshlq_n_s32(vsraq_n_s32(v149, (int32x4_t)vsraq_n_u32((uint32x4_t)v175, (uint32x4_t)vcltzq_s32(v175), 0x1CuLL), 4uLL), 0x10uLL);
      int32x4_t v178 = v156;
      int32x4_t v179 = v155;
      int32x4_t v180 = v143;
      int32x4_t v181 = v142;
      int32x4_t v182 = v141;
      int32x4_t v183 = v139;
      int32x4_t v184 = vsraq_n_s32(v170, v173, 0x1FuLL);
      int32x4_t v185 = vmlaq_s32(v263, a1[74], v161);
      int32x4_t v186 = (int32x4_t)v140;
      int32x4_t v187 = (int32x4_t)veorq_s8((int8x16_t)vshrq_n_s32(v173, 0x10uLL), (int8x16_t)vcltzq_s32(v173));
      int32x4_t v188 = vshlq_n_s32(vsraq_n_s32(a1[32], (int32x4_t)vsraq_n_u32((uint32x4_t)v185, (uint32x4_t)vcltzq_s32(v185), 0x1CuLL), 4uLL), 0x10uLL);
      int32x4_t v189 = vmlaq_s32(v262, v153, v161);
      int32x4_t v190 = (int32x4_t)veorq_s8((int8x16_t)vshrq_n_s32(v177, 0x10uLL), (int8x16_t)vcltzq_s32(v177));
      int32x4_t v191 = vshlq_n_s32(vsraq_n_s32(a1[33], (int32x4_t)vsraq_n_u32((uint32x4_t)v189, (uint32x4_t)vcltzq_s32(v189), 0x1CuLL), 4uLL), 0x10uLL);
      int32x4_t v192 = vsraq_n_s32(v172, v177, 0x1FuLL);
      int32x4_t v193 = v152;
      int32x4_t v194 = v151;
      int32x4_t v195 = v149;
      int32x4_t v196 = v150;
      int32x4_t v197 = v148;
      int32x4_t v198 = v147;
      int32x4_t v199 = (int32x4_t)veorq_s8((int8x16_t)vshrq_n_s32(v188, 0x10uLL), (int8x16_t)vcltzq_s32(v188));
      int32x4_t v200 = vmlaq_s32(v261, a1[76], v161);
      int32x4_t v201 = vshlq_n_s32(vsraq_n_s32(a1[34], (int32x4_t)vsraq_n_u32((uint32x4_t)v200, (uint32x4_t)vcltzq_s32(v200), 0x1CuLL), 4uLL), 0x10uLL);
      int32x4_t v202 = vmlaq_s32(v260, a1[77], v161);
      int32x4_t v203 = vsraq_n_s32(v184, v188, 0x1FuLL);
      int32x4_t v204 = vshlq_n_s32(vsraq_n_s32(a1[35], (int32x4_t)vsraq_n_u32((uint32x4_t)v202, (uint32x4_t)vcltzq_s32(v202), 0x1CuLL), 4uLL), 0x10uLL);
      int32x4_t v205 = vaddq_s32(v176, v190);
      int32x4_t v206 = vmlaq_s32(v259, a1[78], v161);
      int32x4_t v207 = vsraq_n_s32(v253, (int32x4_t)vsraq_n_u32((uint32x4_t)v206, (uint32x4_t)vcltzq_s32(v206), 0x1CuLL), 4uLL);
      int8x16_t v140 = (int8x16_t)v186;
      int32x4_t v208 = vsraq_n_s32(v192, v191, 0x1FuLL);
      int32x4_t v209 = vshlq_n_s32(v207, 0x10uLL);
      int32x4_t v210 = vaddq_s32(v199, (int32x4_t)veorq_s8((int8x16_t)vshrq_n_s32(v201, 0x10uLL), (int8x16_t)vcltzq_s32(v201)));
      int32x4_t v211 = vaddq_s32((int32x4_t)veorq_s8((int8x16_t)vshrq_n_s32(v191, 0x10uLL), (int8x16_t)vcltzq_s32(v191)), (int32x4_t)veorq_s8((int8x16_t)vshrq_n_s32(v204, 0x10uLL), (int8x16_t)vcltzq_s32(v204)));
      int32x4_t v139 = v183;
      int32x4_t v141 = v182;
      int32x4_t v142 = v181;
      int32x4_t v143 = v180;
      int32x4_t v155 = v179;
      int32x4_t v156 = v178;
      int32x4_t v212 = vmlaq_s32(v258, v155, v161);
      int32x4_t v213 = vsraq_n_s32(v203, v201, 0x1FuLL);
      int32x4_t v214 = vshlq_n_s32(vsraq_n_s32(v139, (int32x4_t)vsraq_n_u32((uint32x4_t)v212, (uint32x4_t)vcltzq_s32(v212), 0x1CuLL), 4uLL), 0x10uLL);
      int32x4_t v215 = vaddq_s32(vaddq_s32(v174, v187), v210);
      int32x4_t v216 = (int32x4_t)veorq_s8((int8x16_t)vshrq_n_s32(v209, 0x10uLL), (int8x16_t)vcltzq_s32(v209));
      int32x4_t v217 = vsraq_n_s32(v208, v204, 0x1FuLL);
      int32x4_t v218 = (int32x4_t)veorq_s8((int8x16_t)vshrq_n_s32(v214, 0x10uLL), (int8x16_t)vcltzq_s32(v214));
      int32x4_t v219 = vmlaq_s32(v257, v178, v161);
      int32x4_t v220 = vaddq_s32(v205, v211);
      int32x4_t v221 = vshlq_n_s32(vsraq_n_s32(v186, (int32x4_t)vsraq_n_u32((uint32x4_t)v219, (uint32x4_t)vcltzq_s32(v219), 0x1CuLL), 4uLL), 0x10uLL);
      int32x4_t v222 = vmlaq_s32(v256, a1[81], v161);
      int32x4_t v223 = vsraq_n_s32(v213, v209, 0x1FuLL);
      int32x4_t v224 = vshlq_n_s32(vsraq_n_s32(v141, (int32x4_t)vsraq_n_u32((uint32x4_t)v222, (uint32x4_t)vcltzq_s32(v222), 0x1CuLL), 4uLL), 0x10uLL);
      int32x4_t v225 = vsraq_n_s32(v217, v214, 0x1FuLL);
      int32x4_t v226 = vsraq_n_s32(v223, v221, 0x1FuLL);
      int32x4_t v227 = vmlaq_s32(v255, a1[82], v161);
      int32x4_t v228 = vaddq_s32(v216, (int32x4_t)veorq_s8((int8x16_t)vshrq_n_s32(v221, 0x10uLL), (int8x16_t)vcltzq_s32(v221)));
      int32x4_t v229 = vshlq_n_s32(vsraq_n_s32(v142, (int32x4_t)vsraq_n_u32((uint32x4_t)v227, (uint32x4_t)vcltzq_s32(v227), 0x1CuLL), 4uLL), 0x10uLL);
      int32x4_t v230 = vmlaq_s32(v254, a1[83], v161);
      int32x4_t v231 = vshlq_n_s32(vsraq_n_s32(v143, (int32x4_t)vsraq_n_u32((uint32x4_t)v230, (uint32x4_t)vcltzq_s32(v230), 0x1CuLL), 4uLL), 0x10uLL);
      int32x4_t v232 = vaddq_s32(v220, vaddq_s32(vaddq_s32(v218, (int32x4_t)veorq_s8((int8x16_t)vshrq_n_s32(v224, 0x10uLL), (int8x16_t)vcltzq_s32(v224))), (int32x4_t)veorq_s8((int8x16_t)vshrq_n_s32(v231, 0x10uLL), (int8x16_t)vcltzq_s32(v231))));
      int32x4_t v147 = v198;
      int32x4_t v148 = v197;
      int32x4_t v233 = vaddq_s32(vsubq_s32(vsraq_n_s32(v226, v229, 0x1FuLL), vaddq_s32(v215, vaddq_s32(v228, (int32x4_t)veorq_s8((int8x16_t)vshrq_n_s32(v229, 0x10uLL), (int8x16_t)vcltzq_s32(v229))))), vsubq_s32(vsraq_n_s32(vsraq_n_s32(v225, v224, 0x1FuLL), v231, 0x1FuLL), v232));
      int32x4_t v150 = v196;
      int32x4_t v149 = v195;
      int32x4_t v151 = v194;
      int32x4_t v152 = v193;
      int32x4_t v153 = a1[75];
      int32x4_t v146 = a1[29];
      int v234 = vaddvq_s32(vaddq_s32(v233, (int32x4_t)xmmword_100043F00));
      int32x4_t v145 = a1[28];
      unint64_t v235 = v157 | (v160 << 32);
      if (v234 > v56)
      {
        unint64_t v144 = v235;
        int v56 = v234;
      }
    }
    ++v154;
  }
  while (v154 != 8);
  float v236 = (float)v56 * 0.000015259;
  *(float *)(a5 + 8) = (float)(int)v144 * 0.0625;
  *(float *)(a5 + 12) = (float)SHIDWORD(v144) * 0.0625;
  *(float *)a5 = v236;
  *(_DWORD *)(a5 + 24) = v58;
  *(_WORD *)(a5 + 28) = WORD2(v58);
  *(void *)(a5 + 16) = *(void *)(a5 + 8);
  float v237 = *(float *)(a2 + 4);
  float v239 = *(float *)(a2 + 8);
  float v238 = *(float *)(a2 + 12);
  float v240 = -(float)((float)(v239 * v237) - (float)(v238 * *(float *)a2));
  if (v240 == 0.0)
  {
    float v242 = 0.0;
    float v244 = 0.0;
    float v245 = 0.0;
    float v243 = 0.0;
  }
  else
  {
    float v241 = 1.0 / v240;
    float v242 = (float)(1.0 / v240) * v238;
    float v243 = (float)(1.0 / v240) * *(float *)a2;
    float v244 = -(float)(v239 * v241);
    float v245 = -(float)(v237 * v241);
  }
  int v246 = *(_DWORD *)(a2 + 20);
  *(float *)(a5 + 32) = v242;
  *(float *)(a5 + 36) = v244;
  *(float *)(a5 + 40) = v245;
  *(float *)(a5 + 44) = v243;
  *(_DWORD *)(a5 + 64) = v246;
  *(unsigned char *)(a5 + 68) = v236 > 21.484;
  switch(v58)
  {
    case 4:
      float v242 = -v242;
      *(float *)(a5 + 48) = v244;
      *(float *)(a5 + 52) = v242;
      float v245 = -v245;
      *(float *)(a5 + 56) = v243;
      *(float *)(a5 + 60) = v245;
      if ((v58 & 0xFF00000000) == 0) {
        goto LABEL_36;
      }
      goto LABEL_35;
    case 3:
      float v247 = -v242;
      float v242 = -v244;
      *(float *)(a5 + 48) = v247;
      *(float *)(a5 + 52) = -v244;
      float v248 = -v245;
      float v245 = -v243;
      *(float *)(a5 + 56) = v248;
      *(float *)(a5 + 60) = -v243;
      if ((v58 & 0xFF00000000) == 0) {
        goto LABEL_36;
      }
      goto LABEL_35;
    case 2:
      *(float *)(a5 + 48) = -v244;
      *(float *)(a5 + 52) = v242;
      *(float *)(a5 + 56) = -v243;
      *(float *)(a5 + 60) = v245;
      if ((v58 & 0xFF00000000) == 0) {
        goto LABEL_36;
      }
      goto LABEL_35;
  }
  *(float *)(a5 + 48) = v242;
  *(float *)(a5 + 56) = v245;
  float v245 = v243;
  float v242 = v244;
  *(float *)(a5 + 52) = v244;
  *(float *)(a5 + 60) = v243;
  if ((v58 & 0xFF00000000) != 0)
  {
LABEL_35:
    *(float *)(a5 + 52) = -v242;
    *(float *)(a5 + 60) = -v245;
  }
LABEL_36:
  int16x8_t v249 = (uint64_t (*)(int32x4_t *, uint64_t))__find_func(0xBF3F1F3F20004060, 1367662826);
  return v249(a1, a5);
}

int32x4_t Madusa::PhaseDeviation::OrientPhases(uint64_t a1, __int32 *a2, int32x4_t *a3, uint64_t a4)
{
  switch((int)a4)
  {
    case 1:
      a3->i32[0] = *a2;
      a3->i32[1] = a2[1];
      a3->i32[2] = a2[2];
      a3->i32[3] = a2[3];
      a3[1].i32[0] = a2[4];
      a3[1].i32[1] = a2[5];
      a3[1].i32[2] = a2[6];
      a3[1].i32[3] = a2[7];
      a3[2].i32[0] = a2[8];
      a3[2].i32[1] = a2[9];
      a3[2].i32[2] = a2[10];
      a3[2].i32[3] = a2[11];
      a3[3].i32[0] = a2[12];
      a3[3].i32[1] = a2[13];
      a3[3].i32[2] = a2[14];
      a3[3].i32[3] = a2[15];
      a3[4].i32[0] = a2[16];
      a3[4].i32[1] = a2[17];
      a3[4].i32[2] = a2[18];
      a3[4].i32[3] = a2[19];
      a3[5].i32[0] = a2[20];
      a3[5].i32[1] = a2[21];
      a3[5].i32[2] = a2[22];
      a3[5].i32[3] = a2[23];
      a3[6].i32[0] = a2[24];
      a3[6].i32[1] = a2[25];
      a3[6].i32[2] = a2[26];
      a3[6].i32[3] = a2[27];
      a3[7].i32[0] = a2[28];
      a3[7].i32[1] = a2[29];
      a3[7].i32[2] = a2[30];
      a3[7].i32[3] = a2[31];
      a3[8].i32[0] = a2[32];
      a3[8].i32[1] = a2[33];
      a3[8].i32[2] = a2[34];
      a3[8].i32[3] = a2[35];
      a3[9].i32[0] = a2[36];
      a3[9].i32[1] = a2[37];
      a3[9].i32[2] = a2[38];
      a3[9].i32[3] = a2[39];
      a3[10].i32[0] = a2[40];
      a3[10].i32[1] = a2[41];
      a3[10].i32[2] = a2[42];
      a3[10].i32[3] = a2[43];
      a3[11].i32[0] = a2[44];
      a3[11].i32[1] = a2[45];
      a3[11].i32[2] = a2[46];
      a3[11].i32[3] = a2[47];
      a3[12].i32[0] = a2[48];
      a3[12].i32[1] = a2[49];
      a3[12].i32[2] = a2[50];
      a3[12].i32[3] = a2[51];
      a3[13].i32[0] = a2[52];
      a3[13].i32[1] = a2[53];
      a3[13].i32[2] = a2[54];
      int v4 = a2[55];
      goto LABEL_6;
    case 2:
      a3->i32[0] = a2[3];
      a3->i32[1] = -a2[2];
      a3->i32[2] = a2[1];
      a3->i32[3] = -*a2;
      a3[1].i32[0] = a2[7];
      a3[1].i32[1] = -a2[6];
      a3[1].i32[2] = a2[5];
      a3[1].i32[3] = -a2[4];
      a3[2].i32[0] = a2[11];
      a3[2].i32[1] = -a2[10];
      a3[2].i32[2] = a2[9];
      a3[2].i32[3] = -a2[8];
      a3[3].i32[0] = a2[15];
      a3[3].i32[1] = -a2[14];
      a3[3].i32[2] = a2[13];
      a3[3].i32[3] = -a2[12];
      a3[4].i32[0] = a2[19];
      a3[4].i32[1] = -a2[18];
      a3[4].i32[2] = a2[17];
      a3[4].i32[3] = -a2[16];
      a3[5].i32[0] = a2[23];
      a3[5].i32[1] = -a2[22];
      a3[5].i32[2] = a2[21];
      a3[5].i32[3] = -a2[20];
      a3[6].i32[0] = a2[27];
      a3[6].i32[1] = -a2[26];
      a3[6].i32[2] = a2[25];
      a3[6].i32[3] = -a2[24];
      a3[7].i32[0] = a2[31];
      a3[7].i32[1] = -a2[30];
      a3[7].i32[2] = a2[29];
      a3[7].i32[3] = -a2[28];
      a3[8].i32[0] = a2[35];
      a3[8].i32[1] = -a2[34];
      a3[8].i32[2] = a2[33];
      a3[8].i32[3] = -a2[32];
      a3[9].i32[0] = a2[39];
      a3[9].i32[1] = -a2[38];
      a3[9].i32[2] = a2[37];
      a3[9].i32[3] = -a2[36];
      a3[10].i32[0] = a2[43];
      a3[10].i32[1] = -a2[42];
      a3[10].i32[2] = a2[41];
      a3[10].i32[3] = -a2[40];
      a3[11].i32[0] = a2[47];
      a3[11].i32[1] = -a2[46];
      a3[11].i32[2] = a2[45];
      a3[11].i32[3] = -a2[44];
      a3[12].i32[0] = a2[51];
      a3[12].i32[1] = -a2[50];
      a3[12].i32[2] = a2[49];
      a3[12].i32[3] = -a2[48];
      a3[13].i32[0] = a2[55];
      a3[13].i32[1] = -a2[54];
      a3[13].i32[2] = a2[53];
      int v4 = -a2[52];
      goto LABEL_6;
    case 3:
      a3->i32[0] = -*a2;
      a3->i32[1] = -a2[1];
      a3->i32[2] = -a2[2];
      a3->i32[3] = -a2[3];
      a3[1].i32[0] = -a2[4];
      a3[1].i32[1] = -a2[5];
      a3[1].i32[2] = -a2[6];
      a3[1].i32[3] = -a2[7];
      a3[2].i32[0] = -a2[8];
      a3[2].i32[1] = -a2[9];
      a3[2].i32[2] = -a2[10];
      a3[2].i32[3] = -a2[11];
      a3[3].i32[0] = -a2[12];
      a3[3].i32[1] = -a2[13];
      a3[3].i32[2] = -a2[14];
      a3[3].i32[3] = -a2[15];
      a3[4].i32[0] = -a2[16];
      a3[4].i32[1] = -a2[17];
      a3[4].i32[2] = -a2[18];
      a3[4].i32[3] = -a2[19];
      a3[5].i32[0] = -a2[20];
      a3[5].i32[1] = -a2[21];
      a3[5].i32[2] = -a2[22];
      a3[5].i32[3] = -a2[23];
      a3[6].i32[0] = -a2[24];
      a3[6].i32[1] = -a2[25];
      a3[6].i32[2] = -a2[26];
      a3[6].i32[3] = -a2[27];
      a3[7].i32[0] = -a2[28];
      a3[7].i32[1] = -a2[29];
      a3[7].i32[2] = -a2[30];
      a3[7].i32[3] = -a2[31];
      a3[8].i32[0] = -a2[32];
      a3[8].i32[1] = -a2[33];
      a3[8].i32[2] = -a2[34];
      a3[8].i32[3] = -a2[35];
      a3[9].i32[0] = -a2[36];
      a3[9].i32[1] = -a2[37];
      a3[9].i32[2] = -a2[38];
      a3[9].i32[3] = -a2[39];
      a3[10].i32[0] = -a2[40];
      a3[10].i32[1] = -a2[41];
      a3[10].i32[2] = -a2[42];
      a3[10].i32[3] = -a2[43];
      a3[11].i32[0] = -a2[44];
      a3[11].i32[1] = -a2[45];
      a3[11].i32[2] = -a2[46];
      a3[11].i32[3] = -a2[47];
      a3[12].i32[0] = -a2[48];
      a3[12].i32[1] = -a2[49];
      a3[12].i32[2] = -a2[50];
      a3[12].i32[3] = -a2[51];
      a3[13].i32[0] = -a2[52];
      a3[13].i32[1] = -a2[53];
      a3[13].i32[2] = -a2[54];
      int v4 = -a2[55];
      goto LABEL_6;
    case 4:
      a3->i32[0] = -a2[3];
      a3->i32[1] = a2[2];
      a3->i32[2] = -a2[1];
      a3->i32[3] = *a2;
      a3[1].i32[0] = -a2[7];
      a3[1].i32[1] = a2[6];
      a3[1].i32[2] = -a2[5];
      a3[1].i32[3] = a2[4];
      a3[2].i32[0] = -a2[11];
      a3[2].i32[1] = a2[10];
      a3[2].i32[2] = -a2[9];
      a3[2].i32[3] = a2[8];
      a3[3].i32[0] = -a2[15];
      a3[3].i32[1] = a2[14];
      a3[3].i32[2] = -a2[13];
      a3[3].i32[3] = a2[12];
      a3[4].i32[0] = -a2[19];
      a3[4].i32[1] = a2[18];
      a3[4].i32[2] = -a2[17];
      a3[4].i32[3] = a2[16];
      a3[5].i32[0] = -a2[23];
      a3[5].i32[1] = a2[22];
      a3[5].i32[2] = -a2[21];
      a3[5].i32[3] = a2[20];
      a3[6].i32[0] = -a2[27];
      a3[6].i32[1] = a2[26];
      a3[6].i32[2] = -a2[25];
      a3[6].i32[3] = a2[24];
      a3[7].i32[0] = -a2[31];
      a3[7].i32[1] = a2[30];
      a3[7].i32[2] = -a2[29];
      a3[7].i32[3] = a2[28];
      a3[8].i32[0] = -a2[35];
      a3[8].i32[1] = a2[34];
      a3[8].i32[2] = -a2[33];
      a3[8].i32[3] = a2[32];
      a3[9].i32[0] = -a2[39];
      a3[9].i32[1] = a2[38];
      a3[9].i32[2] = -a2[37];
      a3[9].i32[3] = a2[36];
      a3[10].i32[0] = -a2[43];
      a3[10].i32[1] = a2[42];
      a3[10].i32[2] = -a2[41];
      a3[10].i32[3] = a2[40];
      a3[11].i32[0] = -a2[47];
      a3[11].i32[1] = a2[46];
      a3[11].i32[2] = -a2[45];
      a3[11].i32[3] = a2[44];
      a3[12].i32[0] = -a2[51];
      a3[12].i32[1] = a2[50];
      a3[12].i32[2] = -a2[49];
      a3[12].i32[3] = a2[48];
      a3[13].i32[0] = -a2[55];
      a3[13].i32[1] = a2[54];
      a3[13].i32[2] = -a2[53];
      int v4 = a2[52];
LABEL_6:
      a3[13].i32[3] = v4;
      break;
    default:
      break;
  }
  if ((a4 & 0xFF00000000) != 0)
  {
    int32x4_t v5 = vrev64q_s32(a3[1]);
    *a3 = vrev64q_s32(*a3);
    a3[1] = v5;
    int32x4_t v6 = vrev64q_s32(a3[3]);
    a3[2] = vrev64q_s32(a3[2]);
    a3[3] = v6;
    int32x4_t v7 = vrev64q_s32(a3[5]);
    a3[4] = vrev64q_s32(a3[4]);
    a3[5] = v7;
    int32x4_t v8 = vrev64q_s32(a3[7]);
    a3[6] = vrev64q_s32(a3[6]);
    a3[7] = v8;
    int32x4_t v9 = vrev64q_s32(a3[9]);
    a3[8] = vrev64q_s32(a3[8]);
    a3[9] = v9;
    int32x4_t v10 = vrev64q_s32(a3[11]);
    a3[10] = vrev64q_s32(a3[10]);
    a3[11] = v10;
    int32x4_t result = vrev64q_s32(a3[12]);
    int32x4_t v12 = vrev64q_s32(a3[13]);
    a3[12] = result;
    a3[13] = v12;
  }
  if ((a4 & 0xFF0000000000) != 0)
  {
    v13.i64[0] = 0x800000008000;
    v13.i64[1] = 0x800000008000;
    int32x4_t v14 = vaddq_s32(a3[1], v13);
    *a3 = vaddq_s32(*a3, v13);
    a3[1] = v14;
    int32x4_t v15 = vaddq_s32(a3[3], v13);
    a3[2] = vaddq_s32(a3[2], v13);
    a3[3] = v15;
    int32x4_t v16 = vaddq_s32(a3[5], v13);
    a3[4] = vaddq_s32(a3[4], v13);
    a3[5] = v16;
    int32x4_t v17 = vaddq_s32(a3[7], v13);
    a3[6] = vaddq_s32(a3[6], v13);
    a3[7] = v17;
    int32x4_t v18 = vaddq_s32(a3[9], v13);
    a3[8] = vaddq_s32(a3[8], v13);
    a3[9] = v18;
    int32x4_t v19 = vaddq_s32(a3[11], v13);
    a3[10] = vaddq_s32(a3[10], v13);
    a3[11] = v19;
    int32x4_t v20 = vaddq_s32(a3[12], v13);
    int32x4_t result = vaddq_s32(a3[13], v13);
    a3[12] = v20;
    a3[13] = result;
  }
  return result;
}

uint64_t Madusa::PhaseDeviation::_Execute(int32x4_t *a1, uint64_t a2, int a3, char a4, uint64_t a5)
{
  int32x4_t v6 = 0;
  int v7 = 0;
  if (QuickCodec::mask == -70947757) {
    int v8 = 9091897;
  }
  else {
    int v8 = 589822;
  }
  uint64_t v9 = 1;
  int v10 = 3516032;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v13 = v9;
        if (v10 <= 3516102) {
          break;
        }
        if (v10 == 3516103)
        {
          if ((*v6 & 0x1F) != 0
            || v6[2] > 0x3Fu
            || (uint64_t v9 = 1,
                int v10 = 589822,
                v6[3] != ((QuickCodec::mask ^ v7) / 0x41D093)))
          {
            int v10 = 589876;
            uint64_t v9 = v13;
          }
        }
        else if (v10 == 4105837)
        {
          int32x4_t v6 = (unsigned char *)v5;
          int v10 = 3516049;
        }
        else
        {
          BOOL v14 = v10 == 9091897;
          int v10 = 3516103;
          if (v14) {
            int v7 = -851061265;
          }
        }
      }
      if (v10 <= 3516031) {
        break;
      }
      unsigned int v11 = (QuickCodec::mask != -70947757) | v9;
      if (v10 == 3516049) {
        int v12 = v8;
      }
      else {
        int v12 = v10;
      }
      if (v10 == 3516049) {
        LODWORD(v13) = v11;
      }
      BOOL v14 = v10 == 3516032;
      if (v10 == 3516032) {
        int v10 = 589822;
      }
      else {
        int v10 = v12;
      }
      if (v14) {
        uint64_t v9 = 0;
      }
      else {
        uint64_t v9 = v13;
      }
    }
    if (v10 != 589822) {
      break;
    }
    int v10 = 589876;
    if ((v9 & 1) == 0) {
      int v10 = 4105837;
    }
  }
  if (v9) {
    ++QuickCodec::mask;
  }
  return Madusa::PhaseDeviation::Execute(a1, a2, a3, a4, a5);
}

void Madusa::PhaseDeviation::_Execute_Alt(int8x8_t a1)
{
  a1.i32[0] = *v1 | 0xFFFFFFE0;
  a1.i8[4] = v1[3];
  *(int8x8_t *)v2.i8 = vand_s8(a1, (int8x8_t)0xFF000000FFLL);
  v2.i64[1] = v2.i64[0];
  float32x4_t v3 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v2, (int32x4_t)xmmword_100043F10));
  v4.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_100043F20, v3)).u32[0];
  v4.i32[1] = vmovn_s32(vcgtq_f32(v3, (float32x4_t)xmmword_100043F20)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v4, 0xFuLL))) & ((v1[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    ++QuickCodec::mask;
  }
}

uint64_t Madusa::PhaseDeviation::FindTranslationCandidates1D(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = a1 + 3760;
  uint64_t v7 = a1 + 4272;
  uint64_t func = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))__find_func(0xCFBF9FBFC0A02080, 553934954);
  uint64_t v9 = func(a1, a2, v6, v7);
  Madusa::PhaseDeviation::FindHighest1DTranslations(v9, v6, (int *)(a1 + 1344));
  Madusa::PhaseDeviation::FindHighest1DTranslations(v10, v7, (int *)(a1 + 1368));
  unsigned int v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))__find_func(0xCFBF7F5F60A0C040, 553943178);

  return v11(a1, a1 + 1344, a1 + 1368, a3);
}

void Madusa::PhaseDeviation::FindHighest1DTranslations(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3 = 0;
  int v4 = 0;
  int v5 = 0;
  *(void *)a3 = 0;
  *((void *)a3 + 1) = 0;
  *((void *)a3 + 2) = 0;
  uint64_t v25 = 0;
  memset(v24, 0, sizeof(v24));
  do
  {
    int v8 = *(_DWORD *)(a2 + 4 * v3);
    if (v8 > v5)
    {
      LODWORD(v6) = v4;
      if (v4 >= 1)
      {
        uint64_t v6 = 0;
        uint64_t v9 = (int *)v24 + 1;
        while (1)
        {
          int v10 = *v9;
          v9 += 2;
          if (v8 > v10) {
            break;
          }
          if (v4 == ++v6)
          {
            LODWORD(v6) = v4;
            break;
          }
        }
      }
      if (v4 >= 13) {
        LODWORD(v11) = 13;
      }
      else {
        LODWORD(v11) = v4;
      }
      if ((int)v11 < (int)v6)
      {
        uint64_t v6 = (int)v6;
      }
      else
      {
        uint64_t v11 = (int)v11;
        uint64_t v6 = (int)v6;
        do
          *((void *)v24 + v11 + 1) = *((void *)v24 + v11);
        while (v11-- > (int)v6);
      }
      if (v4 < 15) {
        ++v4;
      }
      uint64_t v7 = 8 * v6;
      *(_DWORD *)((char *)v24 + v7 + 4) = v8;
      *(_DWORD *)((char *)v24 + v7) = v3;
      int v5 = HIDWORD(v25);
    }
    ++v3;
  }
  while (v3 != 128);
  *(void *)a3 = *(void *)&v24[0];
  uint64_t v13 = 1;
  int v14 = 1;
  do
  {
    if (v14 <= 0)
    {
      *(void *)&a3[2 * v14] = *((void *)v24 + v13);
      goto LABEL_23;
    }
    int32x4_t v15 = (int *)v24 + 2 * v13;
    int v16 = *v15;
    unint64_t v17 = 1;
    int32x4_t v18 = a3;
    LOBYTE(v19) = 1;
    do
    {
      int v20 = *v18;
      v18 += 2;
      int v21 = v16 - v20;
      if (v16 - v20 < 0) {
        int v21 = -v21;
      }
      unsigned int v22 = v21 - 4;
      int v19 = (v22 < 0x79) & v19;
    }
    while (v22 <= 0x78 && v17++ < v14);
    if (!v19) {
      goto LABEL_24;
    }
    *(void *)&a3[2 * v14] = *(void *)v15;
    if (v14 > 1) {
      break;
    }
LABEL_23:
    ++v14;
LABEL_24:
    ++v13;
  }
  while (v13 != 15);
}

uint64_t Madusa::PhaseDeviation::_FindTranslationCandidates1D(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((*v3 & 0x1F) != 0 || v3[2] > 0x3Fu)
  {
    int v4 = QuickCodec::mask;
    if (QuickCodec::mask == -70947757) {
      return Madusa::PhaseDeviation::FindTranslationCandidates1D(a1, a2, a3);
    }
LABEL_7:
    QuickCodec::mask = v4 + 1;
    return Madusa::PhaseDeviation::FindTranslationCandidates1D(a1, a2, a3);
  }
  int v6 = 3941217 * v3[3];
  int v4 = QuickCodec::mask;
  if ((~(~(v6 & 0x31CC4C44) & (v6 | 0x31CC4C44) & 0x10010) & (~(v6 & 0x31CC4C44) & (v6 | 0x31CC4C44) | 0x10010)) == (v6 ^ 0x31CD4C54 | v6 & 0x31CD4C54) - (v6 + 835538004) + ~(v6 ^ 0x31CD4C54 | ~(v6 | 0x31CD4C54))
    || QuickCodec::mask != -70947757)
  {
    goto LABEL_7;
  }
  return Madusa::PhaseDeviation::FindTranslationCandidates1D(a1, a2, a3);
}

int32x4_t *Madusa::PhaseDeviation::Search1DAngles(int32x4_t *result, const float *a2, uint64_t a3, uint64_t a4)
{
  int v4 = result + 49;
  int v5 = result + 42;
  if (&result[42] >= (int32x4_t *)a2 + 14 || &result[56] <= (int32x4_t *)a2)
  {
    float32x4x2_t v27 = vld2q_f32(a2);
    result[49] = vsubq_s32((int32x4_t)v27.val[0], (int32x4_t)v27.val[1]);
    uint64_t v9 = a2;
    float32x4x2_t v28 = vld2q_f32(v9);
    v9 += 8;
    result[42] = vaddq_s32((int32x4_t)v28.val[1], (int32x4_t)v28.val[0]);
    float32x4x2_t v29 = vld2q_f32(v9);
    result[50] = vsubq_s32((int32x4_t)v29.val[0], (int32x4_t)v29.val[1]);
    float32x4x2_t v30 = vld2q_f32(v9);
    result[43] = vaddq_s32((int32x4_t)v30.val[1], (int32x4_t)v30.val[0]);
    int v10 = a2 + 16;
    float32x4x2_t v31 = vld2q_f32(v10);
    result[51] = vsubq_s32((int32x4_t)v31.val[0], (int32x4_t)v31.val[1]);
    float32x4x2_t v32 = vld2q_f32(v10);
    result[44] = vaddq_s32((int32x4_t)v32.val[1], (int32x4_t)v32.val[0]);
    uint64_t v11 = a2 + 24;
    float32x4x2_t v33 = vld2q_f32(v11);
    result[52] = vsubq_s32((int32x4_t)v33.val[0], (int32x4_t)v33.val[1]);
    float32x4x2_t v34 = vld2q_f32(v11);
    result[45] = vaddq_s32((int32x4_t)v34.val[1], (int32x4_t)v34.val[0]);
    int v12 = a2 + 32;
    float32x4x2_t v35 = vld2q_f32(v12);
    result[53] = vsubq_s32((int32x4_t)v35.val[0], (int32x4_t)v35.val[1]);
    float32x4x2_t v36 = vld2q_f32(v12);
    result[46] = vaddq_s32((int32x4_t)v36.val[1], (int32x4_t)v36.val[0]);
    uint64_t v13 = a2 + 40;
    float32x4x2_t v37 = vld2q_f32(v13);
    result[54] = vsubq_s32((int32x4_t)v37.val[0], (int32x4_t)v37.val[1]);
    float32x4x2_t v38 = vld2q_f32(v13);
    result[47] = vaddq_s32((int32x4_t)v38.val[1], (int32x4_t)v38.val[0]);
    int v14 = a2 + 48;
    float32x4x2_t v39 = vld2q_f32(v14);
    result[55] = vsubq_s32((int32x4_t)v39.val[0], (int32x4_t)v39.val[1]);
    float32x4x2_t v40 = vld2q_f32(v14);
    result[48] = vaddq_s32((int32x4_t)v40.val[1], (int32x4_t)v40.val[0]);
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = a2 + 1;
    do
    {
      int v8 = &v4->i32[v6];
      *int v8 = *(v7 - 1) - *v7;
      *(v8 - 28) = *v7 + *(v7 - 1);
      v7 += 2;
      ++v6;
    }
    while (v6 != 28);
  }
  for (uint64_t i = 0; i != 128; ++i)
  {
    uint64_t v16 = 0;
    int v17 = 1835008;
    int32x4_t v18 = result + 56;
    do
    {
      __int32 v19 = v5->i32[v16];
      __int32 v20 = v18->i32[0];
      int32x4_t v18 = (int32x4_t *)((char *)v18 + 8);
      int v17 = ((__int16)v19 >> 15) + v17 - ((__int16)v19 ^ ((__int16)v19 >> 15));
      v5->i32[v16++] = v20 + v19;
    }
    while (v16 != 28);
    *(_DWORD *)(a3 + 4 * i) = v17;
  }
  for (uint64_t j = 0; j != 128; ++j)
  {
    uint64_t v22 = 0;
    int v23 = 1835008;
    int8x16_t v24 = result + 70;
    do
    {
      __int32 v25 = v4->i32[v22];
      __int32 v26 = v24->i32[0];
      int8x16_t v24 = (int32x4_t *)((char *)v24 + 8);
      int v23 = ((__int16)v25 >> 15) + v23 - ((__int16)v25 ^ ((__int16)v25 >> 15));
      v4->i32[v22++] = v26 + v25;
    }
    while (v22 != 28);
    *(_DWORD *)(a4 + 4 * j) = v23;
  }
  return result;
}

int32x4_t *Madusa::PhaseDeviation::_Search1DAngles(int32x4_t *result, const float *a2, uint64_t a3, uint64_t a4)
{
  int v5 = 0;
  int v6 = 0;
  if (QuickCodec::mask == -70947757) {
    int v7 = 8597108;
  }
  else {
    int v7 = 95910;
  }
  uint64_t v8 = 1;
  int v9 = 6723923;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v12 = v8;
        if (v9 <= 6723993) {
          break;
        }
        if (v9 == 6723994)
        {
          if ((*v5 & 0x1F) != 0
            || v5[2] > 0x3Fu
            || (uint64_t v8 = 1,
                int v9 = 95910,
                v5[3] != ((QuickCodec::mask ^ v6) / 0x163C4A)))
          {
            int v9 = 95964;
            uint64_t v8 = v12;
          }
        }
        else if (v9 == 6819816)
        {
          int v5 = (unsigned char *)v4;
          int v9 = 6723940;
        }
        else
        {
          BOOL v13 = v9 == 8597108;
          int v9 = 6723994;
          if (v13) {
            int v6 = -374570725;
          }
        }
      }
      if (v9 <= 6723922) {
        break;
      }
      unsigned int v10 = (QuickCodec::mask != -70947757) | v8;
      if (v9 == 6723940) {
        int v11 = v7;
      }
      else {
        int v11 = v9;
      }
      if (v9 == 6723940) {
        LODWORD(v12) = v10;
      }
      BOOL v13 = v9 == 6723923;
      if (v9 == 6723923) {
        int v9 = 95910;
      }
      else {
        int v9 = v11;
      }
      if (v13) {
        uint64_t v8 = 0;
      }
      else {
        uint64_t v8 = v12;
      }
    }
    if (v9 != 95910) {
      break;
    }
    int v9 = 95964;
    if ((v8 & 1) == 0) {
      int v9 = 6819816;
    }
  }
  if (v8) {
    ++QuickCodec::mask;
  }
  return Madusa::PhaseDeviation::Search1DAngles(result, a2, a3, a4);
}

void Madusa::PhaseDeviation::Make1DPhaseDeviationCombinations(uint64_t a1, int *a2, int *a3, _DWORD *a4)
{
  int v4 = *a3;
  int v5 = *a2;
  int v6 = *a3 + 128;
  a4[2] = *a2;
  a4[3] = v4;
  a4[4] = v5;
  a4[5] = v6;
  a4[6] = v5 + 128;
  a4[7] = v4;
  a4[8] = v5 + 128;
  a4[9] = v6;
  int v7 = a2[2];
  a4[10] = v7;
  a4[11] = v4;
  a4[12] = v7;
  a4[13] = v6;
  a4[14] = v7 + 128;
  a4[15] = v4;
  a4[16] = v7 + 128;
  a4[17] = v6;
  int v8 = a2[4];
  a4[18] = v8;
  a4[19] = v4;
  a4[20] = v8;
  a4[21] = v6;
  a4[22] = v8 + 128;
  a4[23] = v4;
  a4[24] = v8 + 128;
  a4[25] = v6;
  int v9 = a3[2];
  a4[26] = v5;
  a4[27] = v9;
  a4[28] = v5;
  a4[29] = v9 + 128;
  a4[30] = v5 + 128;
  a4[31] = v9;
  a4[32] = v5 + 128;
  a4[33] = v9 + 128;
  a4[34] = v7;
  a4[35] = v9;
  a4[36] = v7;
  a4[37] = v9 + 128;
  a4[38] = v7 + 128;
  a4[39] = v9;
  a4[40] = v7 + 128;
  a4[41] = v9 + 128;
  a4[42] = v8;
  a4[43] = v9;
  a4[44] = v8;
  a4[45] = v9 + 128;
  a4[46] = v8 + 128;
  a4[47] = v9;
  a4[48] = v8 + 128;
  a4[49] = v9 + 128;
  int v10 = a3[4];
  int v11 = *a2;
  a4[50] = *a2;
  a4[51] = v10;
  a4[52] = v11;
  a4[53] = v10 + 128;
  v11 += 128;
  a4[54] = v11;
  a4[55] = v10;
  a4[56] = v11;
  a4[57] = v10 + 128;
  int v12 = a2[2];
  a4[58] = v12;
  a4[59] = v10;
  a4[60] = v12;
  a4[61] = v10 + 128;
  v12 += 128;
  a4[62] = v12;
  a4[63] = v10;
  a4[64] = v12;
  a4[65] = v10 + 128;
  int v13 = a2[4];
  a4[66] = v13;
  a4[67] = v10;
  a4[68] = v13;
  a4[69] = v10 + 128;
  v13 += 128;
  a4[70] = v13;
  a4[71] = v10;
  a4[72] = v13;
  a4[73] = v10 + 128;
}

void Madusa::PhaseDeviation::_Make1DPhaseDeviationCombinations(uint64_t a1, int *a2, int *a3, _DWORD *a4)
{
  if ((*v4 & 0x1F) != 0 || v4[2] > 0x3Fu)
  {
    int v5 = QuickCodec::mask;
    if (QuickCodec::mask != -70947757) {
LABEL_10:
    }
      QuickCodec::mask = v5 + 1;
  }
  else
  {
    int v5 = QuickCodec::mask;
    if (v4[3] == 212 || QuickCodec::mask != -70947757) {
      goto LABEL_10;
    }
  }
  Madusa::PhaseDeviation::Make1DPhaseDeviationCombinations(a1, a2, a3, a4);
}

float Madusa::PhaseDeviation::TranslationCorrection(uint64_t a1, float *a2)
{
  float v3 = a2[12];
  float v2 = a2[13];
  float v4 = a2[14];
  float v5 = a2[15];
  float v6 = -(float)((float)(v4 * v2) - (float)(v5 * v3));
  if (v6 != 0.0)
  {
    float v7 = 1.0 / v6;
    float v8 = v7 * v5;
    float v2 = -(float)(v7 * v2);
    float v4 = -(float)(v7 * v4);
    float v5 = v7 * v3;
    float v3 = v8;
  }
  float result = a2[3] + (float)((float)(v5 + v4) * 64.0);
  a2[2] = a2[2] + (float)((float)(v3 + v2) * 64.0);
  a2[3] = result;
  return result;
}

float Madusa::PhaseDeviation::_TranslationCorrection(uint64_t a1, float *a2)
{
  float v3 = 0;
  int v4 = 0;
  if (QuickCodec::mask == -70947757) {
    int v5 = 10299084;
  }
  else {
    int v5 = 1582599;
  }
  uint64_t v6 = 1;
  int v7 = 1272272;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v9 = v6;
        if (v7 > 1582598) {
          break;
        }
        if (v7 == 1272272)
        {
          uint64_t v6 = 0;
          int v7 = 1582599;
        }
        else if (v7 == 1272289)
        {
          uint64_t v6 = (QuickCodec::mask != -70947757) | v6;
          int v7 = v5;
        }
        else if ((*v3 & 0x1F) != 0 {
               || v3[2] > 0x3Fu
        }
               || (uint64_t v6 = 1,
                   int v7 = 1582599,
                   v3[3] != ((QuickCodec::mask ^ v4) / 0x47EEB5)))
        {
          int v7 = 1582653;
          uint64_t v6 = v9;
        }
      }
      if (v7 <= 2854853) {
        break;
      }
      if (v7 == 2854854)
      {
        float v3 = (unsigned char *)v2;
        int v7 = 1272289;
      }
      else
      {
        BOOL v8 = v7 == 10299084;
        int v7 = 1272343;
        if (v8) {
          int v4 = -1068187209;
        }
      }
    }
    if (v7 != 1582599) {
      break;
    }
    int v7 = 1582653;
    if ((v6 & 1) == 0) {
      int v7 = 2854854;
    }
  }
  if (v6) {
    ++QuickCodec::mask;
  }
  return Madusa::PhaseDeviation::TranslationCorrection(1272289, a2);
}

uint64_t Madusa::PhaseDeviation::GetPhaseInformation(uint64_t this, int a2, int *a3, int *a4, int *a5)
{
  int v5 = (_DWORD *)(this + 4 * a2);
  *a3 = v5[224];
  *a4 = v5[280];
  *a5 = *v5 - v5[56];
  return this;
}

uint64_t Madusa::PhaseDeviation::_GetPhaseInformation(uint64_t this, int a2, int *a3, int *a4, int *a5, int *a6, int8x8_t a7)
{
  a7.i32[0] = *v7 | 0xFFFFFFE0;
  a7.i8[4] = v7[3];
  *(int8x8_t *)v8.i8 = vand_s8(a7, (int8x8_t)0xFF000000FFLL);
  v8.i64[1] = v8.i64[0];
  float32x4_t v9 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v8, (int32x4_t)xmmword_100043F30));
  v10.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_100043F40, v9)).u32[0];
  v10.i32[1] = vmovn_s32(vcgtq_f32(v9, (float32x4_t)xmmword_100043F40)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v10, 0xFuLL))) & ((v7[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    ++QuickCodec::mask;
  }
  return Madusa::PhaseDeviation::GetPhaseInformation(this, a2, a3, a4, a5);
}

const float *Madusa::PhaseDeviation::AddFlipTranslationCases(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = (const float *)(a2 + 8);
  v98.val[0] = (float32x4_t)vld2q_f32(v2);
  float v3 = (const float *)(a2 + 604);
  v98.val[1] = (float32x4_t)vld2q_f32(v3);
  int v4 = (const float *)(a2 + 40);
  v99.val[0] = (float32x4_t)vld2q_f32(v4);
  int v5 = (const float *)(a2 + 636);
  v99.val[1] = (float32x4_t)vld2q_f32(v5);
  uint64_t v6 = (float *)(a2 + 1192);
  vst2q_f32(v6, v98);
  int v7 = (float *)(a2 + 1224);
  vst2q_f32(v7, v99);
  int32x4_t v8 = (const float *)(a2 + 72);
  v98.val[0] = (float32x4_t)vld2q_f32(v8);
  float32x4_t v9 = (const float *)(a2 + 668);
  v98.val[1] = (float32x4_t)vld2q_f32(v9);
  int16x4_t v10 = (const float *)(a2 + 104);
  v99.val[0] = (float32x4_t)vld2q_f32(v10);
  int v11 = (const float *)(a2 + 700);
  v99.val[1] = (float32x4_t)vld2q_f32(v11);
  int v12 = (float *)(a2 + 1256);
  vst2q_f32(v12, v98);
  int v13 = (float *)(a2 + 1288);
  vst2q_f32(v13, v99);
  int v14 = (const float *)(a2 + 136);
  v98.val[0] = (float32x4_t)vld2q_f32(v14);
  int32x4_t v15 = (const float *)(a2 + 732);
  v98.val[1] = (float32x4_t)vld2q_f32(v15);
  uint64_t v16 = (const float *)(a2 + 168);
  v99.val[0] = (float32x4_t)vld2q_f32(v16);
  int v17 = (const float *)(a2 + 764);
  v99.val[1] = (float32x4_t)vld2q_f32(v17);
  int32x4_t v18 = (float *)(a2 + 1320);
  vst2q_f32(v18, v98);
  __int32 v19 = (float *)(a2 + 1352);
  vst2q_f32(v19, v99);
  __int32 v20 = (const float *)(a2 + 200);
  v98.val[0] = (float32x4_t)vld2q_f32(v20);
  int v21 = (const float *)(a2 + 796);
  v98.val[1] = (float32x4_t)vld2q_f32(v21);
  uint64_t v22 = (const float *)(a2 + 232);
  v99.val[0] = (float32x4_t)vld2q_f32(v22);
  int v23 = (const float *)(a2 + 828);
  v99.val[1] = (float32x4_t)vld2q_f32(v23);
  int8x16_t v24 = (float *)(a2 + 1384);
  vst2q_f32(v24, v98);
  __int32 v25 = (float *)(a2 + 1416);
  vst2q_f32(v25, v99);
  __int32 v26 = (const float *)(a2 + 304);
  v98.val[0] = (float32x4_t)vld2q_f32(v26);
  float32x4x2_t v27 = (const float *)(a2 + 900);
  v98.val[1] = (float32x4_t)vld2q_f32(v27);
  float32x4x2_t v28 = (const float *)(a2 + 336);
  v99.val[0] = (float32x4_t)vld2q_f32(v28);
  float32x4x2_t v29 = (const float *)(a2 + 932);
  v99.val[1] = (float32x4_t)vld2q_f32(v29);
  float32x4x2_t v30 = (float *)(a2 + 1488);
  vst2q_f32(v30, v98);
  float32x4x2_t v31 = (float *)(a2 + 1520);
  vst2q_f32(v31, v99);
  float32x4x2_t v32 = (const float *)(a2 + 368);
  v98.val[0] = (float32x4_t)vld2q_f32(v32);
  float32x4x2_t v33 = (const float *)(a2 + 964);
  v98.val[1] = (float32x4_t)vld2q_f32(v33);
  float32x4x2_t v34 = (const float *)(a2 + 400);
  v99.val[0] = (float32x4_t)vld2q_f32(v34);
  float32x4x2_t v35 = (const float *)(a2 + 600);
  float32x4x2_t v36 = (const float *)(a2 + 996);
  v99.val[1] = (float32x4_t)vld2q_f32(v36);
  float32x4x2_t v37 = (const float *)(a2 + 632);
  float32x4x2_t v38 = (float *)(a2 + 1552);
  vst2q_f32(v38, v98);
  float32x4x2_t v39 = (const float *)(a2 + 664);
  float32x4x2_t v40 = (float *)(a2 + 1584);
  vst2q_f32(v40, v99);
  unsigned int v41 = (const float *)(a2 + 696);
  int v42 = (const float *)(a2 + 432);
  v98.val[0] = (float32x4_t)vld2q_f32(v42);
  unint64_t v43 = (const float *)(a2 + 728);
  int8x16_t v44 = (const float *)(a2 + 1028);
  v98.val[1] = (float32x4_t)vld2q_f32(v44);
  int8x16_t v45 = (const float *)(a2 + 760);
  int8x16_t v46 = (const float *)(a2 + 464);
  v99.val[0] = (float32x4_t)vld2q_f32(v46);
  int8x16_t v47 = (const float *)(a2 + 792);
  int8x16_t v48 = (const float *)(a2 + 1060);
  v99.val[1] = (float32x4_t)vld2q_f32(v48);
  int8x16_t v49 = (const float *)(a2 + 824);
  int8x16_t v50 = (float *)(a2 + 1616);
  vst2q_f32(v50, v98);
  LODWORD(v50) = *(_DWORD *)(a2 + 264);
  int8x16_t v51 = (float *)(a2 + 1648);
  vst2q_f32(v51, v99);
  *(_DWORD *)(a2 + 1448) = v50;
  int8x16_t v52 = (const float *)(a2 + 496);
  v98.val[0] = (float32x4_t)vld2q_f32(v52);
  int16x8_t v53 = (const float *)(a2 + 1092);
  v98.val[1] = (float32x4_t)vld2q_f32(v53);
  *(_DWORD *)(a2 + 1452) = *(_DWORD *)(a2 + 860);
  int16x8_t v54 = (const float *)(a2 + 528);
  v99.val[0] = (float32x4_t)vld2q_f32(v54);
  uint64_t v55 = (const float *)(a2 + 1124);
  v99.val[1] = (float32x4_t)vld2q_f32(v55);
  *(_DWORD *)(a2 + 1456) = *(_DWORD *)(a2 + 272);
  int v56 = (float *)(a2 + 1680);
  vst2q_f32(v56, v98);
  LODWORD(v56) = *(_DWORD *)(a2 + 868);
  int8x16_t v57 = (float *)(a2 + 1712);
  vst2q_f32(v57, v99);
  *(_DWORD *)(a2 + 1460) = v56;
  v98.val[0] = (float32x4_t)vld2q_f32(v35);
  *(_DWORD *)(a2 + 1464) = *(_DWORD *)(a2 + 280);
  unint64_t v58 = (const float *)(a2 + 12);
  v98.val[1] = (float32x4_t)vld2q_f32(v58);
  *(_DWORD *)(a2 + 1468) = *(_DWORD *)(a2 + 876);
  v99.val[0] = (float32x4_t)vld2q_f32(v37);
  LODWORD(v58) = *(_DWORD *)(a2 + 288);
  uint64_t v59 = (const float *)(a2 + 44);
  v99.val[1] = (float32x4_t)vld2q_f32(v59);
  int16x8_t v60 = (float *)(a2 + 1784);
  vst2q_f32(v60, v98);
  *(_DWORD *)(a2 + 1472) = v58;
  unint64_t v61 = (float *)(a2 + 1816);
  vst2q_f32(v61, v99);
  *(_DWORD *)(a2 + 1476) = *(_DWORD *)(a2 + 884);
  v98.val[0] = (float32x4_t)vld2q_f32(v39);
  int8x16_t v62 = (const float *)(a2 + 76);
  v98.val[1] = (float32x4_t)vld2q_f32(v62);
  LOBYTE(v62) = *(unsigned char *)(a2 + 5);
  *(_DWORD *)(a2 + 1184) = *(_DWORD *)a2;
  v99.val[0] = (float32x4_t)vld2q_f32(v41);
  int8x16_t v63 = (const float *)(a2 + 108);
  v99.val[1] = (float32x4_t)vld2q_f32(v63);
  *(unsigned char *)(a2 + 1188) = 1;
  int8x16_t v64 = (float *)(a2 + 1848);
  vst2q_f32(v64, v98);
  *(unsigned char *)(a2 + 1189) = (_BYTE)v62;
  int8x16_t v65 = (float *)(a2 + 1880);
  vst2q_f32(v65, v99);
  int8x16_t v66 = (const float *)(a2 + 896);
  int8x16_t v67 = (const float *)(a2 + 928);
  v98.val[0] = (float32x4_t)vld2q_f32(v43);
  int8x16_t v68 = (const float *)(a2 + 960);
  int8x16_t v69 = (const float *)(a2 + 140);
  v98.val[1] = (float32x4_t)vld2q_f32(v69);
  int32x4_t v70 = (const float *)(a2 + 992);
  int32x4_t v71 = (const float *)(a2 + 1024);
  v99.val[0] = (float32x4_t)vld2q_f32(v45);
  int32x4_t v72 = (const float *)(a2 + 1056);
  int32x4_t v73 = (const float *)(a2 + 172);
  v99.val[1] = (float32x4_t)vld2q_f32(v73);
  int32x4_t v74 = (const float *)(a2 + 1088);
  int32x4_t v75 = (float *)(a2 + 1912);
  vst2q_f32(v75, v98);
  int32x4_t v76 = (const float *)(a2 + 1120);
  int32x4_t v77 = (float *)(a2 + 1944);
  vst2q_f32(v77, v99);
  *(_DWORD *)(a2 + 1744) = *(_DWORD *)(a2 + 560);
  v98.val[0] = (float32x4_t)vld2q_f32(v47);
  uint32x4_t v78 = (const float *)(a2 + 204);
  v98.val[1] = (float32x4_t)vld2q_f32(v78);
  *(_DWORD *)(a2 + 1748) = *(_DWORD *)(a2 + 1156);
  v99.val[0] = (float32x4_t)vld2q_f32(v49);
  *(_DWORD *)(a2 + 1752) = *(_DWORD *)(a2 + 568);
  uint32x4_t v79 = (const float *)(a2 + 236);
  v99.val[1] = (float32x4_t)vld2q_f32(v79);
  LODWORD(v79) = *(_DWORD *)(a2 + 1164);
  int32x4_t v80 = (float *)(a2 + 1976);
  vst2q_f32(v80, v98);
  *(_DWORD *)(a2 + 1756) = v79;
  int32x4_t v81 = (float *)(a2 + 2008);
  vst2q_f32(v81, v99);
  float result = (const float *)(a2 + 340);
  int32x4_t v83 = (const float *)(a2 + 372);
  int32x4_t v84 = (const float *)(a2 + 404);
  int32x4_t v85 = (const float *)(a2 + 436);
  uint32x4_t v86 = (const float *)(a2 + 468);
  int32x4_t v87 = (const float *)(a2 + 500);
  int32x4_t v88 = (const float *)(a2 + 532);
  v98.val[0] = (float32x4_t)vld2q_f32(v66);
  int32x4_t v89 = (const float *)(a2 + 308);
  LODWORD(v66) = *(_DWORD *)(a2 + 296);
  v98.val[1] = (float32x4_t)vld2q_f32(v89);
  *(_DWORD *)(a2 + 1760) = *(_DWORD *)(a2 + 576);
  v99.val[0] = (float32x4_t)vld2q_f32(v67);
  *(_DWORD *)(a2 + 1764) = *(_DWORD *)(a2 + 1172);
  v99.val[1] = (float32x4_t)vld2q_f32(result);
  LODWORD(v89) = *(_DWORD *)(a2 + 584);
  uint32x4_t v90 = (float *)(a2 + 2080);
  vst2q_f32(v90, v98);
  *(_DWORD *)(a2 + 1768) = v89;
  int32x4_t v91 = (float *)(a2 + 2112);
  vst2q_f32(v91, v99);
  *(_DWORD *)(a2 + 1772) = *(_DWORD *)(a2 + 1180);
  v98.val[0] = (float32x4_t)vld2q_f32(v68);
  LOBYTE(v91) = *(unsigned char *)(a2 + 301);
  *(_DWORD *)(a2 + 1480) = v66;
  v98.val[1] = (float32x4_t)vld2q_f32(v83);
  *(unsigned char *)(a2 + 1484) = 1;
  *(unsigned char *)(a2 + 1485) = (_BYTE)v91;
  v99.val[0] = (float32x4_t)vld2q_f32(v70);
  *(_DWORD *)(a2 + 2040) = *(_DWORD *)(a2 + 856);
  v99.val[1] = (float32x4_t)vld2q_f32(v84);
  LODWORD(v91) = *(_DWORD *)(a2 + 268);
  int32x4_t v92 = (float *)(a2 + 2144);
  vst2q_f32(v92, v98);
  *(_DWORD *)(a2 + 2044) = v91;
  int32x4_t v93 = (float *)(a2 + 2176);
  vst2q_f32(v93, v99);
  *(_DWORD *)(a2 + 2048) = *(_DWORD *)(a2 + 864);
  v98.val[0] = (float32x4_t)vld2q_f32(v71);
  *(_DWORD *)(a2 + 2052) = *(_DWORD *)(a2 + 276);
  v98.val[1] = (float32x4_t)vld2q_f32(v85);
  *(_DWORD *)(a2 + 2056) = *(_DWORD *)(a2 + 872);
  v99.val[0] = (float32x4_t)vld2q_f32(v72);
  *(_DWORD *)(a2 + 2060) = *(_DWORD *)(a2 + 284);
  v99.val[1] = (float32x4_t)vld2q_f32(v86);
  LODWORD(v93) = *(_DWORD *)(a2 + 880);
  uint32x4_t v94 = (float *)(a2 + 2208);
  vst2q_f32(v94, v98);
  *(_DWORD *)(a2 + 2064) = v93;
  int32x4_t v95 = (float *)(a2 + 2240);
  vst2q_f32(v95, v99);
  *(_DWORD *)(a2 + 2068) = *(_DWORD *)(a2 + 292);
  v98.val[0] = (float32x4_t)vld2q_f32(v74);
  LOBYTE(v74) = *(unsigned char *)(a2 + 597);
  v98.val[1] = (float32x4_t)vld2q_f32(v87);
  *(_DWORD *)(a2 + 1776) = *(_DWORD *)(a2 + 592);
  *(unsigned char *)(a2 + 1780) = 1;
  v99.val[0] = (float32x4_t)vld2q_f32(v76);
  *(unsigned char *)(a2 + 1781) = (_BYTE)v74;
  v99.val[1] = (float32x4_t)vld2q_f32(v88);
  int32x4_t v96 = (float *)(a2 + 2272);
  int32x4_t v97 = (float *)(a2 + 2304);
  vst2q_f32(v96, v98);
  *(_DWORD *)(a2 + 2336) = *(_DWORD *)(a2 + 1152);
  *(_DWORD *)(a2 + 2340) = *(_DWORD *)(a2 + 564);
  *(_DWORD *)(a2 + 2344) = *(_DWORD *)(a2 + 1160);
  *(_DWORD *)(a2 + 2348) = *(_DWORD *)(a2 + 572);
  *(_DWORD *)(a2 + 2352) = *(_DWORD *)(a2 + 1168);
  *(_DWORD *)(a2 + 2356) = *(_DWORD *)(a2 + 580);
  *(_DWORD *)(a2 + 2360) = *(_DWORD *)(a2 + 1176);
  *(_DWORD *)(a2 + 2364) = *(_DWORD *)(a2 + 588);
  LOBYTE(v94) = *(unsigned char *)(a2 + 893);
  *(_DWORD *)(a2 + 2072) = *(_DWORD *)(a2 + 888);
  *(unsigned char *)(a2 + 2076) = 1;
  *(unsigned char *)(a2 + 2077) = (_BYTE)v94;
  vst2q_f32(v97, v99);
  return result;
}

const float *Madusa::PhaseDeviation::_AddFlipTranslationCases(uint64_t a1, uint64_t a2, int8x8_t a3)
{
  a3.i32[0] = *v3 | 0xFFFFFFE0;
  a3.i8[4] = v3[3];
  *(int8x8_t *)v4.i8 = vand_s8(a3, (int8x8_t)0xFF000000FFLL);
  v4.i64[1] = v4.i64[0];
  float32x4_t v5 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v4, (int32x4_t)xmmword_100043F50));
  v6.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_100043F60, v5)).u32[0];
  v6.i32[1] = vmovn_s32(vcgtq_f32(v5, (float32x4_t)xmmword_100043F60)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v6, 0xFuLL))) & ((v3[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    ++QuickCodec::mask;
  }
  return Madusa::PhaseDeviation::AddFlipTranslationCases(a1, a2);
}

uint64_t Madusa::Token::GetNextToken(unsigned int *a1, uint64_t a2)
{
  unsigned int v5 = *a1 + 1;
  *a1 = v5;
  if (v5 >= 0x400)
  {
    int v6 = a1[1] + 1;
    *a1 = 1;
    a1[1] = v6;
  }
  a1[2] = 0;
  uint64_t func = (void (*)(unsigned int *, uint64_t))__find_func(0xBF1FBFFFC0C0C020, 1369718826);
  func(a1, a2);
  int32x4_t v8 = (void (*)(unsigned int *, void))__find_func(0xFF7F9F1FC0000080, 298082506);
  v8(a1, *a1);
  float32x4_t v9 = (void (*)(unsigned int *))__find_func(0xCFBF9FDF60400020, 553934858);
  v9(a1);
  int16x4_t v10 = (void (*)(unsigned int *))__find_func(0x1F3F7FDF60C000C0, -242974710);
  v10(a1);
  int v11 = 0;
  int v12 = 0;
  if (QuickCodec::mask == -70947757) {
    int v13 = 1093901;
  }
  else {
    int v13 = 24650;
  }
  uint64_t v14 = 1;
  int v15 = 376218;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v18 = v14;
        if (v15 <= 376288) {
          break;
        }
        if (v15 == 376289)
        {
          if ((*v11 & 0x1F) != 0
            || v11[2] > 0x3Fu
            || (uint64_t v14 = 1,
                int v15 = 24650,
                v11[3] != ((QuickCodec::mask ^ v12) / 0x7665)))
          {
            int v15 = 24704;
            uint64_t v14 = v18;
          }
        }
        else if (v15 == 400851)
        {
          int v11 = v2;
          int v15 = 376235;
        }
        else
        {
          BOOL v19 = v15 == 1093901;
          int v15 = 376289;
          if (v19) {
            int v12 = -72914953;
          }
        }
      }
      if (v15 <= 376217) {
        break;
      }
      unsigned int v16 = (QuickCodec::mask != -70947757) | v14;
      if (v15 == 376235) {
        int v17 = v13;
      }
      else {
        int v17 = v15;
      }
      if (v15 == 376235) {
        LODWORD(v18) = v16;
      }
      BOOL v19 = v15 == 376218;
      if (v15 == 376218) {
        int v15 = 24650;
      }
      else {
        int v15 = v17;
      }
      if (v19) {
        uint64_t v14 = 0;
      }
      else {
        uint64_t v14 = v18;
      }
    }
    if (v15 != 24650) {
      break;
    }
    if (v14) {
      int v15 = 24704;
    }
    else {
      int v15 = 400851;
    }
  }
  if (v14)
  {
    QuickCodec::mask = FunctionTable::ft[0] ^ 0x157E9386;
    uint64_t v20 = __find_func(0xDF9FDF1FC0E04070, 824451274);
    uint64_t v21 = 0;
    while (*(unsigned __int8 *)(v20 + v21) != ((QuickCodec::mask ^ 0xC12A2DF3) / 0x9D28AF)
         || *(unsigned __int8 *)(v20 + v21 + 1) != ((QuickCodec::mask ^ 0xFBC56C53) / 0x9D28AF)
         || *(unsigned __int8 *)(v20 + v21 + 2) != ((QuickCodec::mask ^ 0xDDCAB631) / 0x9D28AF)
         || *(unsigned __int8 *)(v20 + v21 + 3) != ((QuickCodec::mask ^ 0x79E0DCBFu) / 0x9D28AF))
    {
      v21 += 4;
      if (v21 == 2400) {
        goto LABEL_42;
      }
    }
    uint64_t vars0 = v20 + v21;
    long long vars8 = 0u;
LABEL_42:
    QuickCodec::mask += 16;
  }
  return a1[2];
}

uint64_t Madusa::Token::_GetNextToken(unsigned int *a1, uint64_t a2)
{
  if ((*v2 & 0x1F) != 0 || v2[2] > 0x3Fu)
  {
    int v3 = QuickCodec::mask;
    if (QuickCodec::mask != -70947757) {
LABEL_10:
    }
      QuickCodec::mask = v3 + 1;
  }
  else
  {
    int v3 = QuickCodec::mask;
    if (v2[3] == 212 || QuickCodec::mask != -70947757) {
      goto LABEL_10;
    }
  }
  return Madusa::Token::GetNextToken(a1, a2);
}

uint64_t Madusa::Token::GetCurrentToken(Madusa::Token *this)
{
  if ((*v1 & 0x1F) != 0 || v1[2] > 0x3Fu)
  {
    if (QuickCodec::mask != -70947757)
    {
LABEL_10:
      QuickCodec::mask = FunctionTable::ft[0] ^ 0x157E9386;
      uint64_t func = (void (*)(void, uint64_t))__find_func(0xBFBF1F1FC0C00040, 1359274186);
      func(0, 104);
    }
  }
  else if (v1[3] == 212 || QuickCodec::mask != -70947757)
  {
    goto LABEL_10;
  }
  return *((unsigned int *)this + 2);
}

uint64_t Madusa::Token::_GetCurrentToken(Madusa::Token *this, const Madusa::Token *a2)
{
  if ((*v2 & 0x1F) != 0 || v2[2] > 0x3Fu)
  {
    int v3 = QuickCodec::mask;
    if (QuickCodec::mask != -70947757) {
LABEL_10:
    }
      QuickCodec::mask = v3 + 1;
  }
  else
  {
    int v3 = QuickCodec::mask;
    if (v2[3] == 212 || QuickCodec::mask != -70947757) {
      goto LABEL_10;
    }
  }
  return Madusa::Token::GetCurrentToken(this);
}

uint64_t Madusa::Token::ExtractFunctionID(Madusa::Token *this, int a2)
{
  int v4 = *((_DWORD *)this + 2);
  *((_DWORD *)this + 2) = a2;
  uint64_t func = (void (*)(Madusa::Token *))__find_func(0x7F7F3F7F6080E020, -1849376598);
  func(this);
  int v6 = (uint64_t (*)(Madusa::Token *))__find_func(0xEFFFDF7F4080E040, 21242026);
  uint64_t result = v6(this);
  int32x4_t v8 = 0;
  int v9 = 0;
  int v10 = QuickCodec::mask;
  BOOL v11 = QuickCodec::mask == -70947757;
  *((_DWORD *)this + 2) = v4;
  if (v11) {
    int v12 = 14088433;
  }
  else {
    int v12 = 8873502;
  }
  uint64_t v13 = 1;
  int v14 = 3649289;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v15 = v13;
        if (v14 > 8873501) {
          break;
        }
        if (v14 == 3649289)
        {
          uint64_t v13 = 0;
          int v14 = 8873502;
        }
        else if (v14 == 3649306)
        {
          uint64_t v13 = (v10 != -70947757) | v13;
          int v14 = v12;
        }
        else if ((*v8 & 0x1F) != 0 {
               || v8[2] > 0x3Fu
        }
               || (uint64_t v13 = 1,
                   int v14 = 8873502,
                   v8[3] != ((v10 ^ v9) / 0x9B6358)))
        {
          int v14 = 8873556;
          uint64_t v13 = v15;
        }
      }
      if (v14 <= 12522773) {
        break;
      }
      if (v14 == 12522774)
      {
        int32x4_t v8 = v2;
        int v14 = 3649306;
      }
      else
      {
        BOOL v11 = v14 == 14088433;
        int v14 = 3649360;
        if (v11) {
          int v9 = 2070620339;
        }
      }
    }
    if (v14 != 8873502) {
      break;
    }
    int v14 = 8873556;
    if ((v13 & 1) == 0) {
      int v14 = 12522774;
    }
  }
  if (v13)
  {
    unint64_t v16 = 0;
    int v17 = FunctionTable::ft[0] ^ 0x157E9386;
    QuickCodec::mask = FunctionTable::ft[0] ^ 0x157E9386;
    int v18 = -1;
    do
    {
      qword_100074AF8[v18
                    + 1
                    + ((FunctionTable::swapTable[v16] ^ v17) / 0x9D28AF)] = qword_100074AF8[v18 + ((FunctionTable::swapTable[v16 + 1] ^ v17) / 0x9D28AF)];
      v18 -= 2;
      BOOL v19 = v16 >= 0x20;
      v16 += 2;
    }
    while (!v19);
  }
  return result;
}

uint64_t Madusa::Token::_ExtractFunctionID(Madusa::Token *this, int a2)
{
  int v3 = 0;
  int v4 = 0;
  if (QuickCodec::mask == -70947757) {
    int v5 = 7172575;
  }
  else {
    int v5 = 2948713;
  }
  uint64_t v6 = 1;
  int v7 = 2709614;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v9 = v6;
        if (v7 > 2948712) {
          break;
        }
        if (v7 == 2709614)
        {
          uint64_t v6 = 0;
          int v7 = 2948713;
        }
        else if (v7 == 2709631)
        {
          uint64_t v6 = (QuickCodec::mask != -70947757) | v6;
          int v7 = v5;
        }
        else if ((*v3 & 0x1F) != 0 {
               || v3[2] > 0x3Fu
        }
               || (uint64_t v6 = 1,
                   int v7 = 2948713,
                   v3[3] != ((QuickCodec::mask ^ v4) / 0x4E72EE)))
        {
          int v7 = 2948767;
          uint64_t v6 = v9;
        }
      }
      if (v7 <= 5658309) {
        break;
      }
      if (v7 == 5658310)
      {
        int v3 = (unsigned char *)v2;
        int v7 = 2709631;
      }
      else
      {
        BOOL v8 = v7 == 7172575;
        int v7 = 2709685;
        if (v8) {
          int v4 = -1154334389;
        }
      }
    }
    if (v7 != 2948713) {
      break;
    }
    int v7 = 2948767;
    if ((v6 & 1) == 0) {
      int v7 = 5658310;
    }
  }
  if (v6) {
    ++QuickCodec::mask;
  }
  return Madusa::Token::ExtractFunctionID(this, a2);
}

uint64_t Madusa::Token::GetCurrentTokenFunctionID(Madusa::Token *this, int8x8_t a2)
{
  a2.i8[4] = v2[3];
  a2.i32[0] = *v2 | 0xFFFFFFE0;
  *(int8x8_t *)v4.i8 = vand_s8(a2, (int8x8_t)0xFF000000FFLL);
  v4.i64[1] = v4.i64[0];
  float32x4_t v5 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v4, (int32x4_t)xmmword_100043F70));
  v6.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_100043F80, v5)).u32[0];
  v6.i32[1] = vmovn_s32(vcgtq_f32(v5, (float32x4_t)xmmword_100043F80)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v6, 0xFuLL))) & ((v2[2] & 0xE0) == 32)) == 0
    && QuickCodec::mask == -70947757)
  {
    return *((_DWORD *)this + 2) >> 17;
  }
  QuickCodec::mask = FunctionTable::ft[0] ^ 0x157E9386;
  fegetenv(&v8);
  v8.__fpcr &= QuickCodec::mask + 70947740;
  fesetenv(&v8);
  return *((_DWORD *)this + 2) >> 17;
}

uint64_t Madusa::Token::_GetCurrentTokenFunctionID(Madusa::Token *this, const Madusa::Token *x1_0, int8x8_t a2)
{
  int32x4_t v4 = 0;
  int v5 = 0;
  if (QuickCodec::mask == -70947757) {
    int v6 = 11558839;
  }
  else {
    int v6 = 7222385;
  }
  uint64_t v7 = 1;
  int v8 = 4112024;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v10 = v7;
        if (v8 > 7222384) {
          break;
        }
        if (v8 == 4112024)
        {
          uint64_t v7 = 0;
          int v8 = 7222385;
        }
        else if (v8 == 4112041)
        {
          uint64_t v7 = (QuickCodec::mask != -70947757) | v7;
          int v8 = v6;
        }
        else if ((*v4 & 0x1F) != 0 {
               || v4[2] > 0x3Fu
        }
               || (uint64_t v7 = 1,
                   int v8 = 7222385,
                   v4[3] != ((QuickCodec::mask ^ v5) / 0x86FBC3)))
        {
          int v8 = 7222439;
          uint64_t v7 = v10;
        }
      }
      if (v8 <= 11334391) {
        break;
      }
      if (v8 == 11334392)
      {
        int32x4_t v4 = (unsigned char *)v3;
        int v8 = 4112041;
      }
      else
      {
        BOOL v9 = v8 == 11558839;
        int v8 = 4112095;
        if (v9) {
          int v5 = -1811082961;
        }
      }
    }
    if (v8 != 7222385) {
      break;
    }
    int v8 = 7222439;
    if ((v7 & 1) == 0) {
      int v8 = 11334392;
    }
  }
  if (v7) {
    ++QuickCodec::mask;
  }
  return Madusa::Token::GetCurrentTokenFunctionID(this, a2);
}

uint64_t Madusa::Token::GetCurrentTokenCounter(Madusa::Token *this)
{
  unsigned int v2 = *((_DWORD *)this + 2);
  if ((*v1 & 0x1F) != 0 || v1[2] > 0x3Fu)
  {
    if (QuickCodec::mask != -70947757) {
      goto LABEL_10;
    }
    return (32 * (*((_DWORD *)this + 2) & 0x1F)) | (*((_DWORD *)this + 2) >> 12) & 0x1Fu;
  }
  if (v1[3] != 212 && QuickCodec::mask == -70947757) {
    return (32 * (*((_DWORD *)this + 2) & 0x1F)) | (*((_DWORD *)this + 2) >> 12) & 0x1Fu;
  }
LABEL_10:
  QuickCodec::mask = FunctionTable::ft[0] ^ 0x157E9386;
  uint64_t func = __find_func(0xDF9FDF1FC0E04070, 824451274);
  uint64_t v6 = 0;
  while (*(unsigned __int8 *)(func + v6) != ((QuickCodec::mask ^ 0xC12A2DF3) / 0x9D28AF)
       || *(unsigned __int8 *)(func + v6 + 1) != ((QuickCodec::mask ^ 0xFBC56C53) / 0x9D28AF)
       || *(unsigned __int8 *)(func + v6 + 2) != ((QuickCodec::mask ^ 0xDDCAB631) / 0x9D28AF)
       || *(unsigned __int8 *)(func + v6 + 3) != ((QuickCodec::mask ^ 0x79E0DCBFu) / 0x9D28AF))
  {
    v6 += 4;
    if (v6 == 2400) {
      goto LABEL_17;
    }
  }
  uint64_t vars0 = func + v6;
  long long vars8 = 0u;
LABEL_17:
  QuickCodec::mask += 16;
  return (32 * (v2 & 0x1F)) | (v2 >> 12) & 0x1F;
}

uint64_t Madusa::Token::_GetCurrentTokenCounter(Madusa::Token *this, const Madusa::Token *a2, int8x8_t a3)
{
  a3.i32[0] = *v3 | 0xFFFFFFE0;
  a3.i8[4] = v3[3];
  *(int8x8_t *)v4.i8 = vand_s8(a3, (int8x8_t)0xFF000000FFLL);
  v4.i64[1] = v4.i64[0];
  float32x4_t v5 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v4, (int32x4_t)xmmword_100043F90));
  v6.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_100043FA0, v5)).u32[0];
  v6.i32[1] = vmovn_s32(vcgtq_f32(v5, (float32x4_t)xmmword_100043FA0)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v6, 0xFuLL))) & ((v3[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    ++QuickCodec::mask;
  }
  return Madusa::Token::GetCurrentTokenCounter(this);
}

uint64_t Madusa::Token::GetScrambleFunction(Madusa::Token *this, int8x8_t a2)
{
  a2.i8[4] = v2[3];
  a2.i32[0] = *v2 | 0xFFFFFFE0;
  *(int8x8_t *)v4.i8 = vand_s8(a2, (int8x8_t)0xFF000000FFLL);
  v4.i64[1] = v4.i64[0];
  float32x4_t v5 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v4, (int32x4_t)xmmword_100043FB0));
  v6.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_100043FC0, v5)).u32[0];
  v6.i32[1] = vmovn_s32(vcgtq_f32(v5, (float32x4_t)xmmword_100043FC0)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v6, 0xFuLL))) & ((v2[2] & 0xE0) == 32)) == 0
    && QuickCodec::mask == -70947757)
  {
    return (*((_DWORD *)this + 2) >> 5) & 0x7F;
  }
  QuickCodec::mask = FunctionTable::ft[0] ^ 0x157E9386;
  uint64_t func = (void (*)(void, uint64_t))__find_func(0xBFBF1F1FC0C00040, 1359274186);
  func(0, 104);
  return (*((_DWORD *)this + 2) >> 5) & 0x7F;
}

uint64_t Madusa::Token::_GetScrambleFunction(Madusa::Token *this, const Madusa::Token *x1_0, int8x8_t a2)
{
  if ((*v3 & 0x1F) != 0 || v3[2] > 0x3Fu)
  {
    int v4 = QuickCodec::mask;
    if (QuickCodec::mask == -70947757) {
      return Madusa::Token::GetScrambleFunction(this, a2);
    }
LABEL_7:
    QuickCodec::mask = v4 + 1;
    return Madusa::Token::GetScrambleFunction(this, a2);
  }
  int v6 = 3173313 * v3[3];
  int v4 = QuickCodec::mask;
  if ((v6 ^ 0x28193BD4 | v6 & 0x28193BD4) - (v6 + 672742356) + ~(v6 ^ 0x28193BD4 | ~(v6 | 0x28193BD4)) == ~(~(~(~(v6 | 0x28001844) | v6 & 0x28001844) | 0x192390) | ~(~(v6 | 0x28001844) | v6 & 0x28001844) & 0x192390)
    || QuickCodec::mask != -70947757)
  {
    goto LABEL_7;
  }
  return Madusa::Token::GetScrambleFunction(this, a2);
}

uint64_t Madusa::Token::ApplyKeyToCurrentToken(Madusa::Token *this)
{
  uint64_t func = (uint64_t (*)(Madusa::Token *))__find_func(0xBF9F9FBF00E0E060, 1361338474);
  int v3 = func(this);
  int v4 = (unsigned int (*)(Madusa::Token *))__find_func(0x2F1F5F5F004080A0, -1046175606);
  uint64_t v5 = ((v3 << 8) | (2 * v3)) ^ v4(this);
  int v6 = (void (*)(Madusa::Token *, uint64_t))__find_func(0xBF7FFF7F40804090, 1371799722);
  v6(this, v5);
  uint64_t v7 = (unsigned int (*)(Madusa::Token *))__find_func(0x8FFF5F5F8020C080, 1631887498);
  uint64_t v8 = v7(this) ^ (v3 & 7 | (8 * v3));
  BOOL v9 = (uint64_t (*)(Madusa::Token *, uint64_t))__find_func(0xF9FBFFF80C0A030, -517717974);

  return v9(this, v8);
}

uint64_t Madusa::Token::_ApplyKeyToCurrentToken(Madusa::Token *this, Madusa::Token *a2)
{
  if ((*v2 & 0x1F) != 0 || v2[2] > 0x3Fu)
  {
    int v3 = QuickCodec::mask;
    if (QuickCodec::mask != -70947757) {
LABEL_10:
    }
      QuickCodec::mask = v3 + 1;
  }
  else
  {
    int v3 = QuickCodec::mask;
    if (v2[3] == 212 || QuickCodec::mask != -70947757) {
      goto LABEL_10;
    }
  }
  return Madusa::Token::ApplyKeyToCurrentToken(this);
}

uint64_t Madusa::Token::AssignFunctionIDToCurrentToken(uint64_t this, unsigned __int16 a2)
{
  *(_DWORD *)(this + 8) = *(_DWORD *)(this + 8) & 0x1FFFF | (a2 << 17);
  return this;
}

uint64_t Madusa::Token::_AssignFunctionIDToCurrentToken(uint64_t this, unsigned __int16 a2)
{
  if ((*v2 & 0x1F) != 0 || v2[2] > 0x3Fu)
  {
    int v3 = QuickCodec::mask;
    if (QuickCodec::mask != -70947757) {
LABEL_10:
    }
      QuickCodec::mask = v3 + 1;
  }
  else
  {
    int v3 = QuickCodec::mask;
    if (v2[3] == 212 || QuickCodec::mask != -70947757) {
      goto LABEL_10;
    }
  }
  return Madusa::Token::AssignFunctionIDToCurrentToken(this, a2);
}

uint64_t Madusa::Token::AssignCounterToCurrentToken(uint64_t this, unsigned int a2)
{
  *(_DWORD *)(this + 8) = (a2 >> 5) & 0x1F | ((a2 & 0x1F) << 12) | *(_DWORD *)(this + 8) & 0xFFFE0FE0;
  return this;
}

uint64_t Madusa::Token::_AssignCounterToCurrentToken(uint64_t this, unsigned int a2, int8x8_t a3)
{
  a3.i32[0] = *v3 | 0xFFFFFFE0;
  a3.i8[4] = v3[3];
  *(int8x8_t *)v4.i8 = vand_s8(a3, (int8x8_t)0xFF000000FFLL);
  v4.i64[1] = v4.i64[0];
  float32x4_t v5 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v4, (int32x4_t)xmmword_100043FD0));
  v6.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_100043FE0, v5)).u32[0];
  v6.i32[1] = vmovn_s32(vcgtq_f32(v5, (float32x4_t)xmmword_100043FE0)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v6, 0xFuLL))) & ((v3[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    ++QuickCodec::mask;
  }
  return Madusa::Token::AssignCounterToCurrentToken(this, a2);
}

uint64_t Madusa::Token::AssignScrambleFunctionToCurrentToken(Madusa::Token *this)
{
  uint64_t result = Madusa::RandomNumGenerator::GetNextNumber((Madusa::Token *)((char *)this + 16));
  if ((result & 0x7F) != 0)
  {
    int v3 = 32 * (result & 0x7F);
  }
  else
  {
    unsigned int v4 = result >> 7;
    int v5 = result & 0x3F80;
    unsigned int v6 = result >> 14;
    int v7 = result & 0x1FC000;
    BOOL v8 = (result & 0x1FC000) == 0;
    unsigned int v9 = result >> 21;
    int v10 = result & 0xFE00000;
    BOOL v11 = (result & 0xFE00000) == 0;
    unsigned int v12 = result >> 28;
    uint64_t result = result >> 28 == 0;
    if (v10)
    {
      int v13 = v11;
    }
    else
    {
      LOBYTE(v9) = v12;
      int v13 = result;
    }
    if (v7)
    {
      BOOL v14 = v8;
    }
    else
    {
      LOBYTE(v6) = v9;
      BOOL v14 = v13;
    }
    if (v5)
    {
      BOOL v15 = 0;
    }
    else
    {
      LOBYTE(v4) = v6;
      BOOL v15 = v14;
    }
    int v3 = 32 * (v4 & 0x7F);
    if (v15) {
      int v3 = 3360;
    }
  }
  *((_DWORD *)this + 2) = *((_DWORD *)this + 2) & 0xFFFFF01F | v3;
  return result;
}

uint64_t Madusa::Token::_AssignScrambleFunctionToCurrentToken(Madusa::Token *this, Madusa::Token *a2)
{
  if ((*v2 & 0x1F) != 0 || v2[2] > 0x3Fu)
  {
    int v3 = QuickCodec::mask;
    if (QuickCodec::mask != -70947757) {
LABEL_10:
    }
      QuickCodec::mask = v3 + 1;
  }
  else
  {
    int v3 = QuickCodec::mask;
    if (v2[3] == 212 || QuickCodec::mask != -70947757) {
      goto LABEL_10;
    }
  }
  return Madusa::Token::AssignScrambleFunctionToCurrentToken(this);
}

uint64_t (***Madusa::System::GetReadstatsHandle(Madusa::System *this))()
{
  return Madusa::System::mpReadstatsHandle;
}

void *Madusa::BandModeImageParamsValidator::BandModeImageParamsValidator(Madusa::BandModeImageParamsValidator *this, const _t_zn_IMAGEPARAMS *a2, const Madusa::Session *a3)
{
  uint64_t result = Madusa::ImageParamsValidator::ImageParamsValidator(this, (uint64_t)a2, (uint64_t)a3);
  *uint64_t result = off_100070760;
  return result;
}

uint64_t Madusa::BandModeImageParamsValidator::ModeSpecificParametersAreValid(Madusa::BandModeImageParamsValidator *this)
{
  uint64_t result = Madusa::ImageParamsValidator::DataAccessFormatIsWhole(this);
  if (result)
  {
    uint64_t result = Madusa::ImageParamsValidator::ImageDataPointersArePresentAndFrontLoaded(this, v3);
    if (result)
    {
      uint64_t result = (*(uint64_t (**)(Madusa::BandModeImageParamsValidator *))(*(void *)this + 32))(this);
      if (result)
      {
        unsigned int v4 = *(_DWORD *)(*((void *)this + 2) + 4640);
        if (v4 - 2 < 2)
        {
          int v5 = *(_DWORD *)(*((void *)this + 1) + 180);
        }
        else
        {
          if (v4 > 1) {
            return 0;
          }
          int v5 = *(_DWORD *)(*((void *)this + 1) + 176);
        }
        return v5 == 0;
      }
    }
  }
  return result;
}

uint64_t Madusa::BandModeImageParamsValidator::ModeSpecificParametersShouldCauseSilentNoDetection(Madusa::BandModeImageParamsValidator *this)
{
  unsigned int v2 = (_DWORD *)*((void *)this + 1);
  if (*(_DWORD *)(*((void *)this + 2) + 4640) > 1u)
  {
    int v3 = v2[2];
    int v4 = v2[4];
  }
  else
  {
    int v3 = v2[1];
    int v4 = v2[3];
  }
  float DimensionInInches = Madusa::ImageParamsValidator::GetDimensionInInches(this, v3, v4);
  uint64_t v6 = *((void *)this + 2);
  uint64_t v7 = 4648;
  if (*(_DWORD *)(v6 + 4640) < 2u) {
    uint64_t v7 = 4644;
  }
  uint64_t v8 = 4652;
  if (*(_DWORD *)(v6 + 4640) < 2u) {
    uint64_t v8 = 4656;
  }
  float v9 = Madusa::ImageParamsValidator::GetDimensionInInches(this, *(_DWORD *)(v6 + v7), *(_DWORD *)(v6 + v8));
  BOOL v10 = Madusa::ImageParamsValidator::ApproximateBufferSizeOverflows(this);
  unsigned int v11 = DimensionInInches > 22.0 || v10;
  if (DimensionInInches < 0.5) {
    unsigned int v11 = 1;
  }
  if (v9 < 0.5) {
    return 1;
  }
  else {
    return v11;
  }
}

void sub_100016D8C()
{
}

void Madusa::PhaseEstimation::EstimatePhaseAtPoint(uint64_t a1, float32x2_t *a2, uint64_t a3)
{
  int v4 = a2->i32[0];
  if (a2->i32[0] < -64 || v4 > 62 || (uint64_t v5 = a2->u32[1], (v5 & 0x80000000) != 0) || (int)v5 > 63)
  {
    *(void *)(a3 + 5) = 0;
    *(void *)a3 = 0;
  }
  else
  {
    unsigned int v90 = v4 + 64;
    *(unsigned char *)(a3 + 12) = 1;
    int32x2_t v6 = vmax_s32(vmin_s32(vcvt_n_s32_f32(a2[1], 6uLL), (int32x2_t)0x3F0000003FLL), 0);
    uint64_t v7 = (float *)((char *)&unk_100043FF0 + 4 * v6.u32[0]);
    uint64_t v8 = (float *)((char *)&unk_100043FF0 + 4 * v6.u32[1]);
    int32x4_t v89 = v8;
    float v9 = (float *)((char *)&unk_1000441F0 + 4 * v6.u32[0]);
    BOOL v10 = (float *)((char *)&unk_1000441F0 + 4 * v6.u32[1]);
    uint64_t v11 = a1 + 8;
    uint64_t v12 = a1 + 33296;
    uint64_t v13 = a1 + 66584;
    int v14 = a2[3].u8[0];
    float v15 = *v8;
    float v16 = *v10;
    uint64_t v17 = v5 << 7;
    uint64_t v18 = (v4 + 64 + (v5 << 7));
    float v19 = *v7;
    float v20 = *v9;
    uint64_t v21 = 4 * v18;
    float v22 = *(float *)(a1 + 8 + v21);
    float v23 = *(float *)(a1 + 33296 + v21);
    float v24 = fabsf(v23);
    float v25 = -v24;
    if (v22 < 0.0) {
      float v25 = v24;
    }
    float v26 = v25 + v22;
    float v27 = -v22;
    if (v22 >= 0.0) {
      float v27 = *(float *)(a1 + 8 + 4 * v18);
    }
    float v28 = v24 + v27;
    float v29 = 2.3562;
    if (v22 >= 0.0) {
      float v29 = 0.7854;
    }
    float v30 = v29 - (float)((float)(v26 * 0.7854) / v28);
    if (v23 < 0.0) {
      float v30 = -v30;
    }
    BOOL v46 = v22 < 0.0;
    float v31 = 3.1416;
    if (!v46) {
      float v31 = 0.0;
    }
    if (v23 != 0.0) {
      float v31 = v30;
    }
    uint64_t v32 = 4 * v18;
    float v33 = (float)(*v8 + *v7) + (float)(v31 * 0.15915);
    if (a2[3].i8[0]) {
      float v33 = -v33;
    }
    float v34 = (float)(*v10 * *v9) * *(float *)(v13 + 4 * v18);
    __float2 v35 = __sincosf_stret(v33 * 6.2832);
    float v36 = v35.__cosval * v34;
    float v37 = v35.__sinval * v34;
    float v38 = v7[64];
    float v39 = v15 + v38;
    float v40 = v9[64];
    float v41 = *(float *)(v11 + v32 + 4);
    float v42 = *(float *)(v12 + v32 + 4);
    float v43 = 3.1416;
    if (v41 >= 0.0) {
      float v43 = 0.0;
    }
    float v44 = fabsf(v42);
    float v45 = -v44;
    BOOL v46 = v41 < 0.0;
    if (v41 < 0.0) {
      float v45 = v44;
    }
    float v47 = v45 + v41;
    if (v41 < 0.0) {
      float v41 = -v41;
    }
    float v48 = v44 + v41;
    float v49 = 2.3562;
    if (!v46) {
      float v49 = 0.7854;
    }
    float v50 = v49 - (float)((float)(v47 * 0.7854) / v48);
    if (v42 < 0.0) {
      float v50 = -v50;
    }
    if (v42 == 0.0) {
      float v50 = v43;
    }
    float v51 = v39 + (float)(v50 * 0.15915);
    if (v14) {
      float v51 = -v51;
    }
    float v52 = (float)(v16 * v40) * *(float *)(v13 + v32 + 4);
    __float2 v53 = __sincosf_stret(v51 * 6.2832);
    float v54 = v36 + (float)(v53.__cosval * v52);
    float v55 = v37 + (float)(v53.__sinval * v52);
    float v56 = v89[64];
    float v57 = v10[64];
    uint64_t v58 = 4 * (v17 + v90);
    float v59 = *(float *)(v11 + v58 + 512);
    float v60 = *(float *)(v12 + v58 + 512);
    float v61 = 3.1416;
    if (v59 >= 0.0) {
      float v61 = 0.0;
    }
    float v62 = fabsf(v60);
    float v63 = -v62;
    BOOL v64 = v59 < 0.0;
    if (v59 < 0.0) {
      float v63 = v62;
    }
    float v65 = v63 + v59;
    if (v59 < 0.0) {
      float v59 = -v59;
    }
    float v66 = v62 + v59;
    float v67 = 2.3562;
    if (!v64) {
      float v67 = 0.7854;
    }
    float v68 = v67 - (float)((float)(v65 * 0.7854) / v66);
    if (v60 < 0.0) {
      float v68 = -v68;
    }
    if (v60 == 0.0) {
      float v68 = v61;
    }
    float v69 = (float)(v56 + v19) + (float)(v68 * 0.15915);
    if (v14) {
      float v69 = -v69;
    }
    float v70 = (float)(v57 * v20) * *(float *)(v13 + v58 + 512);
    __float2 v71 = __sincosf_stret(v69 * 6.2832);
    float v72 = v54 + (float)(v71.__cosval * v70);
    float v73 = v55 + (float)(v71.__sinval * v70);
    float v74 = *(float *)(v11 + v58 + 4 + 512);
    float v75 = *(float *)(v12 + v58 + 4 + 512);
    float v76 = 3.1416;
    if (v74 >= 0.0) {
      float v76 = 0.0;
    }
    float v77 = fabsf(v75);
    float v78 = -v77;
    BOOL v79 = v74 < 0.0;
    if (v74 < 0.0) {
      float v78 = v77;
    }
    float v80 = v78 + v74;
    if (v74 < 0.0) {
      float v74 = -v74;
    }
    float v81 = v77 + v74;
    float v82 = 2.3562;
    if (!v79) {
      float v82 = 0.7854;
    }
    float v83 = v82 - (float)((float)(v80 * 0.7854) / v81);
    if (v75 < 0.0) {
      float v83 = -v83;
    }
    if (v75 == 0.0) {
      float v83 = v76;
    }
    float v84 = (float)(v56 + v38) + (float)(v83 * 0.15915);
    if (v14) {
      float v84 = -v84;
    }
    float v85 = (float)(v57 * v40) * *(float *)(v13 + v58 + 4 + 512);
    __float2 v86 = __sincosf_stret(v84 * 6.2832);
    float v87 = v72 + (float)(v86.__cosval * v85);
    float v88 = v73 + (float)(v86.__sinval * v85);
    *(float *)a3 = v87;
    *(float *)(a3 + 4) = v88;
    *(float *)(a3 + 8) = atan2f(v88, v87) * 0.15915;
  }
}

void Madusa::PhaseEstimation::Execute(float32x2_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t func = (void (*)(uint64_t, float32x2_t *))__find_func(0x9F3F9FFF20C0A0E0, 1904500778);
  func(a3, a1);
  for (uint64_t i = 32; i != 928; i += 16)
  {
    Madusa::PhaseEstimation::EstimatePhaseAtPoint(a2, a1, a3 + i);
    a1 = (float32x2_t *)((char *)a1 + 28);
  }
}

void Madusa::PhaseEstimation::_Execute(float32x2_t *a1, uint64_t a2, uint64_t a3)
{
  int v4 = 0;
  int v5 = 0;
  if (QuickCodec::mask == -70947757) {
    int v6 = 6798182;
  }
  else {
    int v6 = 2778956;
  }
  uint64_t v7 = 1;
  int v8 = 804650;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v10 = v7;
        if (v8 > 2778955) {
          break;
        }
        if (v8 == 804650)
        {
          uint64_t v7 = 0;
          int v8 = 2778956;
        }
        else if (v8 == 804667)
        {
          uint64_t v7 = (QuickCodec::mask != -70947757) | v7;
          int v8 = v6;
        }
        else if ((*v4 & 0x1F) != 0 {
               || v4[2] > 0x3Fu
        }
               || (uint64_t v7 = 1,
                   int v8 = 2778956,
                   v4[3] != ((QuickCodec::mask ^ v5) / 0x74A1D3)))
        {
          int v8 = 2779010;
          uint64_t v7 = v10;
        }
      }
      if (v8 <= 3583588) {
        break;
      }
      if (v8 == 3583589)
      {
        int v4 = (unsigned char *)v3;
        int v8 = 804667;
      }
      else
      {
        BOOL v9 = v8 == 6798182;
        int v8 = 804721;
        if (v9) {
          int v5 = -1689030929;
        }
      }
    }
    if (v8 != 2778956) {
      break;
    }
    int v8 = 2779010;
    if ((v7 & 1) == 0) {
      int v8 = 3583589;
    }
  }
  if (v7) {
    ++QuickCodec::mask;
  }
  Madusa::PhaseEstimation::Execute(a1, a2, a3);
}

float Madusa::PhaseEstimation::_Execute_Alt(uint64_t a1, uint64_t a2, float *a3)
{
  if ((*v3 & 0x1F) != 0 || v3[2] > 0x3Fu)
  {
    int v4 = QuickCodec::mask;
    if (QuickCodec::mask == -70947757) {
      return Madusa::PhaseEstimation::Execute_Alt(a1, a2, a3);
    }
LABEL_7:
    QuickCodec::mask = v4 + 1;
    return Madusa::PhaseEstimation::Execute_Alt(a1, a2, a3);
  }
  int v6 = 938547 * v3[3];
  int v4 = QuickCodec::mask;
  if ((v6 ^ 0xBDC123C | v6 & 0xBDC123C) - (v6 + 198971964) + ~(v6 ^ 0xBDC123C | ~(v6 | 0xBDC123C)) == ~(~(~(~(v6 | 0xB801204) | v6 & 0xB801204) | 0x5C0038) | ~(~(v6 | 0xB801204) | v6 & 0xB801204) & 0x5C0038)
    || QuickCodec::mask != -70947757)
  {
    goto LABEL_7;
  }
  return Madusa::PhaseEstimation::Execute_Alt(a1, a2, a3);
}

float Madusa::PhaseEstimation::Execute_Alt(uint64_t a1, uint64_t a2, float *a3)
{
  return Madusa::RefineCandidates::TransformRefSignalCoords(a3, a1);
}

Madusa::SigComboBoost *Madusa::SigComboBoost::SigComboBoost(Madusa::SigComboBoost *this)
{
  unsigned int v2 = (char *)this + 33092;
  *(void *)this = off_100070798;
  Madusa::Decode::Decode((void *)this + 1, (uint64_t)this + 48);
  *((void *)this + 6) = off_1000707D0;
  *((void *)this + 7) = off_100070828;
  *((_DWORD *)this + 16) = 0;
  *((_OWORD *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 2252) = 0u;
  *(_OWORD *)((char *)this + 3352) = 0u;
  *(_OWORD *)((char *)this + 4452) = 0u;
  *((_OWORD *)this + 347) = 0u;
  *(_OWORD *)((char *)this + 6652) = 0u;
  *(_OWORD *)((char *)this + 8852) = 0u;
  *(_OWORD *)((char *)this + 7752) = 0u;
  *((_OWORD *)this + 622) = 0u;
  *(_OWORD *)((char *)this + 11052) = 0u;
  *(_OWORD *)((char *)this + 12152) = 0u;
  *(_OWORD *)((char *)this + 13252) = 0u;
  *(_OWORD *)((char *)this + 15452) = 0u;
  *((_OWORD *)this + 897) = 0u;
  *(_OWORD *)((char *)this + 16552) = 0u;
  *(_OWORD *)((char *)this + 17652) = 0u;
  *((_OWORD *)this + 1172) = 0u;
  *(_OWORD *)((char *)this + 19852) = 0u;
  *(_OWORD *)((char *)this + 22052) = 0u;
  *(_OWORD *)((char *)this + 20952) = 0u;
  *((_OWORD *)this + 1447) = 0u;
  *(_OWORD *)((char *)this + 24252) = 0u;
  *(_OWORD *)((char *)this + 25352) = 0u;
  *(_OWORD *)((char *)this + 26452) = 0u;
  *(_OWORD *)((char *)this + 28652) = 0u;
  *((_OWORD *)this + 1722) = 0u;
  *(_OWORD *)((char *)this + 29752) = 0u;
  *(_OWORD *)((char *)this + 30852) = 0u;
  *((_OWORD *)this + 1997) = 0u;
  *(_OWORD *)((char *)this + 33052) = 0u;
  *((_OWORD *)this + 2067) = 0u;
  *((void *)this + 4136) = 0xFFFFFFFF00000000;
  *(_OWORD *)((char *)this + 33096) = 0u;
  *((_DWORD *)this + 8278) = 0;
  *((_DWORD *)v2 + 6) = -1;
  *((_DWORD *)this + 8284) = 0;
  *((_OWORD *)this + 2070) = 0u;
  *((_DWORD *)v2 + 12) = -1;
  *((_DWORD *)this + 8290) = 0;
  *(_OWORD *)((char *)this + 33144) = 0u;
  *((_DWORD *)v2 + 18) = -1;
  *((_DWORD *)this + 8296) = 0;
  *((_OWORD *)this + 2073) = 0u;
  *((_DWORD *)v2 + 24) = -1;
  *((_DWORD *)this + 8302) = 0;
  *(_OWORD *)((char *)this + 33192) = 0u;
  *((_DWORD *)v2 + 30) = -1;
  *((_DWORD *)this + 8308) = 0;
  *((_OWORD *)this + 2076) = 0u;
  *((_DWORD *)v2 + 36) = -1;
  *((_DWORD *)this + 8314) = 0;
  *(_OWORD *)((char *)this + 33240) = 0u;
  *((_DWORD *)v2 + 42) = -1;
  *((_DWORD *)this + 8320) = 0;
  *((_OWORD *)this + 2079) = 0u;
  *((_DWORD *)v2 + 48) = -1;
  *((_DWORD *)this + 8326) = 0;
  *(_OWORD *)((char *)this + 33288) = 0u;
  *((_DWORD *)v2 + 54) = -1;
  *((_DWORD *)this + 8332) = 0;
  *((_OWORD *)this + 2082) = 0u;
  *((_DWORD *)v2 + 60) = -1;
  *(_OWORD *)((char *)this + 33336) = 0u;
  *((_DWORD *)this + 8338) = 0;
  *((_DWORD *)v2 + 66) = -1;
  *((_DWORD *)this + 8344) = 0;
  *((_OWORD *)this + 2085) = 0u;
  *((_DWORD *)v2 + 72) = -1;
  *(_OWORD *)((char *)this + 33384) = 0u;
  *((_DWORD *)this + 8350) = 0;
  *((_DWORD *)v2 + 78) = -1;
  *((_DWORD *)this + 8356) = 0;
  *((_OWORD *)this + 2088) = 0u;
  *((_DWORD *)v2 + 84) = -1;
  *(_OWORD *)((char *)this + 33432) = 0u;
  *((_DWORD *)this + 8362) = 0;
  *((_DWORD *)v2 + 90) = -1;
  *((_DWORD *)this + 8368) = 0;
  *((_OWORD *)this + 2091) = 0u;
  *((_DWORD *)v2 + 96) = -1;
  *(_OWORD *)((char *)this + 33480) = 0u;
  *((_DWORD *)this + 8374) = 0;
  *((_DWORD *)v2 + 102) = -1;
  *((_DWORD *)this + 8380) = 0;
  *((_OWORD *)this + 2094) = 0u;
  *((_DWORD *)v2 + 108) = -1;
  *(_OWORD *)((char *)this + 33528) = 0u;
  *((_DWORD *)this + 8386) = 0;
  *((_DWORD *)v2 + 114) = -1;
  *((_DWORD *)this + 8392) = 0;
  *((_OWORD *)this + 2097) = 0u;
  *((_DWORD *)v2 + 120) = -1;
  *(_OWORD *)((char *)this + 33576) = 0u;
  *((_DWORD *)this + 8398) = 0;
  *((_DWORD *)v2 + 126) = -1;
  *((_DWORD *)this + 8404) = 0;
  *((_OWORD *)this + 2100) = 0u;
  *((_DWORD *)v2 + 132) = -1;
  *(_OWORD *)((char *)this + 33624) = 0u;
  *((_DWORD *)this + 8410) = 0;
  *((_DWORD *)v2 + 138) = -1;
  *((_DWORD *)this + 8416) = 0;
  *((_OWORD *)this + 2103) = 0u;
  *((_DWORD *)v2 + 144) = -1;
  *(_OWORD *)((char *)this + 33672) = 0u;
  *((_DWORD *)this + 8422) = 0;
  *((_DWORD *)v2 + 150) = -1;
  *((_DWORD *)this + 8428) = 0;
  *((_OWORD *)this + 2106) = 0u;
  *((_DWORD *)v2 + 156) = -1;
  *(_OWORD *)((char *)this + 33720) = 0u;
  *((_DWORD *)this + 8434) = 0;
  *((_DWORD *)v2 + 162) = -1;
  *((_DWORD *)this + 8440) = 0;
  *((_OWORD *)this + 2109) = 0u;
  *((_DWORD *)v2 + 168) = -1;
  *(_OWORD *)((char *)this + 33768) = 0u;
  *((_DWORD *)this + 8446) = 0;
  *((_DWORD *)v2 + 174) = -1;
  *(void *)(v2 + 700) = 0;
  *((_OWORD *)this + 2180) = 0u;
  *(_OWORD *)((char *)this + 35980) = 0u;
  *(_OWORD *)((char *)this + 37080) = 0u;
  *(_OWORD *)((char *)this + 38180) = 0u;
  *((_OWORD *)this + 2455) = 0u;
  *(_OWORD *)((char *)this + 40380) = 0u;
  *(_OWORD *)((char *)this + 41480) = 0u;
  *(_OWORD *)((char *)this + 42580) = 0u;
  *((void *)this + 5329) = 0;
  *(_OWORD *)((char *)this + 42600) = 0u;
  *(_OWORD *)((char *)this + 42616) = 0u;
  *((void *)this + 5332) = 0x600000005;
  *((_OWORD *)this + 2665) = xmmword_1000443F0;
  *((_DWORD *)v2 + 2393) = 7;
  atomic_store(0, (unsigned int *)v2 + 176);
  *((_DWORD *)v2 + 175) = 0;
  return this;
}

double Madusa::SigComboBoost::Clear(Madusa::SigComboBoost *this)
{
  *(_OWORD *)((char *)this + 42600) = 0u;
  *(_OWORD *)((char *)this + 42616) = 0u;
  *(_OWORD *)((char *)this + 42648) = xmmword_100044400;
  *((_DWORD *)this + 10666) = 7;
  double result = 0.0;
  *(_OWORD *)((char *)this + 42632) = xmmword_100044410;
  atomic_store(0, (unsigned int *)this + 8449);
  *((_DWORD *)this + 8448) = 0;
  return result;
}

_DWORD *Madusa::SigComboBoost::SetSignature(_DWORD *result, const void *a2, float *a3)
{
  float v3 = fmaxf(a3[2], fmaxf(*a3, a3[1]));
  if (v3 > 2.0)
  {
    int v4 = result + 10658;
    int v6 = result + 10666;
    int v5 = result[10666];
    uint64_t v7 = (char *)(result + 10650);
    if (v3 > *(float *)&result[v5 + 10650])
    {
      double result = memcpy(&result[275 * v5 + 8450], a2, 0x44CuLL);
      *(float *)&v7[4 * v5] = v3;
      int v8 = v4 + 1;
      float v9 = *(float *)&v7[4 * v4[1]];
      if (v3 <= v9 && (int v8 = v4 + 2, v3 <= *(float *)&v7[4 * v4[2]]))
      {
        int v8 = v4 + 3;
        if (v3 <= *(float *)&v7[4 * v4[3]])
        {
          int v8 = v4 + 4;
          if (v3 <= *(float *)&v7[4 * v4[4]])
          {
            int v8 = v4 + 5;
            if (v3 <= *(float *)&v7[4 * v4[5]])
            {
              int v8 = v4 + 6;
              if (v3 <= *(float *)&v7[4 * v4[6]])
              {
                int v8 = v4 + 7;
                if (v3 <= *(float *)&v7[4 * v4[7]])
                {
                  if (v3 <= *(float *)&v7[4 * *v6]) {
                    goto LABEL_25;
                  }
                  goto LABEL_24;
                }
                int v10 = 0;
                int v11 = 0;
                int v12 = 0;
                int v13 = 0;
                int v14 = 0;
              }
              else
              {
                int v11 = 0;
                int v12 = 0;
                int v13 = 0;
                int v14 = 0;
                int v10 = 1;
              }
            }
            else
            {
              int v12 = 0;
              int v13 = 0;
              int v14 = 0;
              int v10 = 1;
              int v11 = 1;
            }
          }
          else
          {
            int v13 = 0;
            int v14 = 0;
            int v10 = 1;
            int v11 = 1;
            int v12 = 1;
          }
        }
        else
        {
          int v14 = 0;
          int v10 = 1;
          int v11 = 1;
          int v12 = 1;
          int v13 = 1;
        }
      }
      else
      {
        int v10 = 1;
        int v11 = 1;
        int v12 = 1;
        int v13 = 1;
        int v14 = 1;
      }
      int v6 = v8;
      v4[8] = v4[7];
      if (v10)
      {
        v4[7] = v4[6];
        if (v11)
        {
          v4[6] = v4[5];
          if (v12)
          {
            v4[5] = v4[4];
            if (v13)
            {
              v4[4] = v4[3];
              if (v14)
              {
                v4[3] = v4[2];
                if (v3 > v9) {
                  v4[2] = v4[1];
                }
              }
            }
          }
        }
      }
LABEL_24:
      *int v6 = v5;
LABEL_25:
      if (*v4 <= 7) {
        ++*v4;
      }
    }
  }
  return result;
}

_DWORD *Madusa::SigComboBoost::_SetSignature(_DWORD *result, const void *a2, float *a3)
{
  if ((*v3 & 0x1F) != 0 || v3[2] > 0x3Fu)
  {
    int v4 = QuickCodec::mask;
    if (QuickCodec::mask == -70947757) {
      return Madusa::SigComboBoost::SetSignature(result, a2, a3);
    }
LABEL_7:
    QuickCodec::mask = v4 + 1;
    return Madusa::SigComboBoost::SetSignature(result, a2, a3);
  }
  int v6 = 148375 * v3[3];
  int v4 = QuickCodec::mask;
  if ((v6 ^ 0x1DFF90C | v6 & 0x1DFF90C) - (v6 + 31455500) + ~(v6 ^ 0x1DFF90C | ~(v6 | 0x1DFF90C)) == ~(~(~(~(v6 | 0x1C72000) | v6 & 0x1C72000) | 0x18D90C) | ~(~(v6 | 0x1C72000) | v6 & 0x1C72000) & 0x18D90C)
    || QuickCodec::mask != -70947757)
  {
    goto LABEL_7;
  }
  return Madusa::SigComboBoost::SetSignature(result, a2, a3);
}

uint64_t Madusa::SigComboBoost::GetBoostedSignature(uint64_t a1, char *__dst, float *__src)
{
  memcpy(__dst, __src, 0x44CuLL);
  LODWORD(v7) = *(_DWORD *)(a1 + 42632);
  if ((int)v7 < 1)
  {
    char v9 = 0;
  }
  else
  {
    uint64_t v8 = 0;
    char v9 = 0;
    if ((int)v7 >= 8) {
      uint64_t v7 = 8;
    }
    else {
      uint64_t v7 = v7;
    }
    int v10 = 1;
    do
    {
      int v11 = *(_DWORD *)(a1 + 42636 + 4 * v8);
      unint64_t v12 = a1 + 33800 + 1100 * v11;
      if (vabds_f32(*(float *)(v12 + 1080), __src[270]) < 0.13)
      {
        float v13 = vabds_f32(*(float *)(v12 + 1088), __src[272]);
        BOOL v14 = vabds_f32(*(float *)(v12 + 1084), __src[271]) < 0.13 && v13 < 0.13;
        float v15 = vabds_f32(*(float *)(v12 + 1092), __src[273]);
        if (v14 && v15 < 0.13)
        {
          if (a1 + 34880 + 1100 * v11 <= (unint64_t)__dst || v12 >= (unint64_t)(__dst + 1080))
          {
            int16x8_t v18 = vaddq_s16(*((int16x8_t *)__dst + 1), *(int16x8_t *)(v12 + 16));
            *(int16x8_t *)__dst = vaddq_s16(*(int16x8_t *)__dst, *(int16x8_t *)v12);
            *((int16x8_t *)__dst + 1) = v18;
            int16x8_t v19 = vaddq_s16(*(int16x8_t *)(__dst + 556), *(int16x8_t *)(v12 + 556));
            *(int16x8_t *)(__dst + 540) = vaddq_s16(*(int16x8_t *)(__dst + 540), *(int16x8_t *)(v12 + 540));
            *(int16x8_t *)(__dst + 556) = v19;
            int16x8_t v20 = vaddq_s16(*((int16x8_t *)__dst + 3), *(int16x8_t *)(v12 + 48));
            *((int16x8_t *)__dst + 2) = vaddq_s16(*((int16x8_t *)__dst + 2), *(int16x8_t *)(v12 + 32));
            *((int16x8_t *)__dst + 3) = v20;
            int16x8_t v21 = vaddq_s16(*(int16x8_t *)(__dst + 588), *(int16x8_t *)(v12 + 588));
            *(int16x8_t *)(__dst + 572) = vaddq_s16(*(int16x8_t *)(__dst + 572), *(int16x8_t *)(v12 + 572));
            *(int16x8_t *)(__dst + 588) = v21;
            int16x8_t v22 = vaddq_s16(*((int16x8_t *)__dst + 5), *(int16x8_t *)(v12 + 80));
            *((int16x8_t *)__dst + 4) = vaddq_s16(*((int16x8_t *)__dst + 4), *(int16x8_t *)(v12 + 64));
            *((int16x8_t *)__dst + 5) = v22;
            int16x8_t v23 = vaddq_s16(*(int16x8_t *)(__dst + 620), *(int16x8_t *)(v12 + 620));
            *(int16x8_t *)(__dst + 604) = vaddq_s16(*(int16x8_t *)(__dst + 604), *(int16x8_t *)(v12 + 604));
            *(int16x8_t *)(__dst + 620) = v23;
            int16x8_t v24 = vaddq_s16(*((int16x8_t *)__dst + 7), *(int16x8_t *)(v12 + 112));
            *((int16x8_t *)__dst + 6) = vaddq_s16(*((int16x8_t *)__dst + 6), *(int16x8_t *)(v12 + 96));
            *((int16x8_t *)__dst + 7) = v24;
            int16x8_t v25 = vaddq_s16(*(int16x8_t *)(__dst + 652), *(int16x8_t *)(v12 + 652));
            *(int16x8_t *)(__dst + 636) = vaddq_s16(*(int16x8_t *)(__dst + 636), *(int16x8_t *)(v12 + 636));
            *(int16x8_t *)(__dst + 652) = v25;
            int16x8_t v26 = vaddq_s16(*((int16x8_t *)__dst + 9), *(int16x8_t *)(v12 + 144));
            *((int16x8_t *)__dst + 8) = vaddq_s16(*((int16x8_t *)__dst + 8), *(int16x8_t *)(v12 + 128));
            *((int16x8_t *)__dst + 9) = v26;
            int16x8_t v27 = vaddq_s16(*(int16x8_t *)(__dst + 684), *(int16x8_t *)(v12 + 684));
            *(int16x8_t *)(__dst + 668) = vaddq_s16(*(int16x8_t *)(__dst + 668), *(int16x8_t *)(v12 + 668));
            *(int16x8_t *)(__dst + 684) = v27;
            int16x8_t v28 = vaddq_s16(*((int16x8_t *)__dst + 11), *(int16x8_t *)(v12 + 176));
            *((int16x8_t *)__dst + 10) = vaddq_s16(*((int16x8_t *)__dst + 10), *(int16x8_t *)(v12 + 160));
            *((int16x8_t *)__dst + 11) = v28;
            int16x8_t v29 = vaddq_s16(*(int16x8_t *)(__dst + 716), *(int16x8_t *)(v12 + 716));
            *(int16x8_t *)(__dst + 700) = vaddq_s16(*(int16x8_t *)(__dst + 700), *(int16x8_t *)(v12 + 700));
            *(int16x8_t *)(__dst + 716) = v29;
            int16x8_t v30 = vaddq_s16(*((int16x8_t *)__dst + 13), *(int16x8_t *)(v12 + 208));
            *((int16x8_t *)__dst + 12) = vaddq_s16(*((int16x8_t *)__dst + 12), *(int16x8_t *)(v12 + 192));
            *((int16x8_t *)__dst + 13) = v30;
            int16x8_t v31 = vaddq_s16(*(int16x8_t *)(__dst + 748), *(int16x8_t *)(v12 + 748));
            *(int16x8_t *)(__dst + 732) = vaddq_s16(*(int16x8_t *)(__dst + 732), *(int16x8_t *)(v12 + 732));
            *(int16x8_t *)(__dst + 748) = v31;
            int16x8_t v32 = vaddq_s16(*((int16x8_t *)__dst + 15), *(int16x8_t *)(v12 + 240));
            *((int16x8_t *)__dst + 14) = vaddq_s16(*((int16x8_t *)__dst + 14), *(int16x8_t *)(v12 + 224));
            *((int16x8_t *)__dst + 15) = v32;
            int16x8_t v33 = vaddq_s16(*(int16x8_t *)(__dst + 780), *(int16x8_t *)(v12 + 780));
            *(int16x8_t *)(__dst + 764) = vaddq_s16(*(int16x8_t *)(__dst + 764), *(int16x8_t *)(v12 + 764));
            *(int16x8_t *)(__dst + 780) = v33;
            int16x8_t v34 = vaddq_s16(*((int16x8_t *)__dst + 17), *(int16x8_t *)(v12 + 272));
            *((int16x8_t *)__dst + 16) = vaddq_s16(*((int16x8_t *)__dst + 16), *(int16x8_t *)(v12 + 256));
            *((int16x8_t *)__dst + 17) = v34;
            int16x8_t v35 = vaddq_s16(*(int16x8_t *)(__dst + 812), *(int16x8_t *)(v12 + 812));
            *(int16x8_t *)(__dst + 796) = vaddq_s16(*(int16x8_t *)(__dst + 796), *(int16x8_t *)(v12 + 796));
            *(int16x8_t *)(__dst + 812) = v35;
            int16x8_t v36 = vaddq_s16(*((int16x8_t *)__dst + 19), *(int16x8_t *)(v12 + 304));
            *((int16x8_t *)__dst + 18) = vaddq_s16(*((int16x8_t *)__dst + 18), *(int16x8_t *)(v12 + 288));
            *((int16x8_t *)__dst + 19) = v36;
            int16x8_t v37 = vaddq_s16(*(int16x8_t *)(__dst + 844), *(int16x8_t *)(v12 + 844));
            *(int16x8_t *)(__dst + 828) = vaddq_s16(*(int16x8_t *)(__dst + 828), *(int16x8_t *)(v12 + 828));
            *(int16x8_t *)(__dst + 844) = v37;
            int16x8_t v38 = vaddq_s16(*((int16x8_t *)__dst + 21), *(int16x8_t *)(v12 + 336));
            *((int16x8_t *)__dst + 20) = vaddq_s16(*((int16x8_t *)__dst + 20), *(int16x8_t *)(v12 + 320));
            *((int16x8_t *)__dst + 21) = v38;
            int16x8_t v39 = vaddq_s16(*(int16x8_t *)(__dst + 876), *(int16x8_t *)(v12 + 876));
            *(int16x8_t *)(__dst + 860) = vaddq_s16(*(int16x8_t *)(__dst + 860), *(int16x8_t *)(v12 + 860));
            *(int16x8_t *)(__dst + 876) = v39;
            int16x8_t v40 = vaddq_s16(*((int16x8_t *)__dst + 23), *(int16x8_t *)(v12 + 368));
            *((int16x8_t *)__dst + 22) = vaddq_s16(*((int16x8_t *)__dst + 22), *(int16x8_t *)(v12 + 352));
            *((int16x8_t *)__dst + 23) = v40;
            int16x8_t v41 = vaddq_s16(*(int16x8_t *)(__dst + 908), *(int16x8_t *)(v12 + 908));
            *(int16x8_t *)(__dst + 892) = vaddq_s16(*(int16x8_t *)(__dst + 892), *(int16x8_t *)(v12 + 892));
            *(int16x8_t *)(__dst + 908) = v41;
            int16x8_t v42 = vaddq_s16(*((int16x8_t *)__dst + 25), *(int16x8_t *)(v12 + 400));
            *((int16x8_t *)__dst + 24) = vaddq_s16(*((int16x8_t *)__dst + 24), *(int16x8_t *)(v12 + 384));
            *((int16x8_t *)__dst + 25) = v42;
            int16x8_t v43 = vaddq_s16(*(int16x8_t *)(__dst + 940), *(int16x8_t *)(v12 + 940));
            *(int16x8_t *)(__dst + 924) = vaddq_s16(*(int16x8_t *)(__dst + 924), *(int16x8_t *)(v12 + 924));
            *(int16x8_t *)(__dst + 940) = v43;
            int16x8_t v44 = vaddq_s16(*((int16x8_t *)__dst + 27), *(int16x8_t *)(v12 + 432));
            *((int16x8_t *)__dst + 26) = vaddq_s16(*((int16x8_t *)__dst + 26), *(int16x8_t *)(v12 + 416));
            *((int16x8_t *)__dst + 27) = v44;
            int16x8_t v45 = vaddq_s16(*(int16x8_t *)(__dst + 972), *(int16x8_t *)(v12 + 972));
            *(int16x8_t *)(__dst + 956) = vaddq_s16(*(int16x8_t *)(__dst + 956), *(int16x8_t *)(v12 + 956));
            *(int16x8_t *)(__dst + 972) = v45;
            int16x8_t v46 = vaddq_s16(*((int16x8_t *)__dst + 29), *(int16x8_t *)(v12 + 464));
            *((int16x8_t *)__dst + 28) = vaddq_s16(*((int16x8_t *)__dst + 28), *(int16x8_t *)(v12 + 448));
            *((int16x8_t *)__dst + 29) = v46;
            int16x8_t v47 = vaddq_s16(*(int16x8_t *)(__dst + 1004), *(int16x8_t *)(v12 + 1004));
            *(int16x8_t *)(__dst + 988) = vaddq_s16(*(int16x8_t *)(__dst + 988), *(int16x8_t *)(v12 + 988));
            *(int16x8_t *)(__dst + 1004) = v47;
            int16x8_t v48 = vaddq_s16(*((int16x8_t *)__dst + 31), *(int16x8_t *)(v12 + 496));
            *((int16x8_t *)__dst + 30) = vaddq_s16(*((int16x8_t *)__dst + 30), *(int16x8_t *)(v12 + 480));
            *((int16x8_t *)__dst + 31) = v48;
            int16x8_t v49 = vaddq_s16(*(int16x8_t *)(__dst + 1036), *(int16x8_t *)(v12 + 1036));
            *(int16x8_t *)(__dst + 1020) = vaddq_s16(*(int16x8_t *)(__dst + 1020), *(int16x8_t *)(v12 + 1020));
            *(int16x8_t *)(__dst + 1036) = v49;
            uint64_t v50 = 256;
          }
          else
          {
            uint64_t v50 = 0;
          }
          uint64_t v51 = 2 * v50;
          do
          {
            float v52 = &__dst[v51];
            *(_WORD *)float v52 = *(_WORD *)&__dst[v51] + *(_WORD *)(v12 + v51);
            *((_WORD *)v52 + 270) = *(_WORD *)&__dst[v51 + 540] + *(_WORD *)(v12 + v51 + 540);
            v51 += 2;
          }
          while (v51 != 540);
          ++v10;
          char v9 = 1;
          if (v10 == 3) {
            break;
          }
        }
      }
      ++v8;
    }
    while (v8 != v7);
  }
  __float2 v53 = 0;
  int v54 = 0;
  if (QuickCodec::mask == -70947757) {
    int v55 = 9986301;
  }
  else {
    int v55 = 2208459;
  }
  uint64_t v56 = 1;
  int v57 = 4755335;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v60 = v56;
        if (v57 <= 4755405) {
          break;
        }
        if (v57 == 4755406)
        {
          if ((*v53 & 0x1F) != 0
            || v53[2] > 0x3Fu
            || (uint64_t v56 = 1,
                int v57 = 2208459,
                v53[3] != ((QuickCodec::mask ^ v54) / 0x23FAC3)))
          {
            int v57 = 2208513;
            uint64_t v56 = v60;
          }
        }
        else if (v57 == 6963777)
        {
          __float2 v53 = v3;
          int v57 = 4755352;
        }
        else
        {
          BOOL v61 = v57 == 9986301;
          int v57 = 4755406;
          if (v61) {
            int v54 = -435239633;
          }
        }
      }
      if (v57 <= 4755334) {
        break;
      }
      unsigned int v58 = (QuickCodec::mask != -70947757) | v56;
      if (v57 == 4755352) {
        int v59 = v55;
      }
      else {
        int v59 = v57;
      }
      if (v57 == 4755352) {
        LODWORD(v60) = v58;
      }
      BOOL v61 = v57 == 4755335;
      if (v57 == 4755335) {
        int v57 = 2208459;
      }
      else {
        int v57 = v59;
      }
      if (v61) {
        uint64_t v56 = 0;
      }
      else {
        uint64_t v56 = v60;
      }
    }
    if (v57 != 2208459) {
      break;
    }
    if (v56) {
      int v57 = 2208513;
    }
    else {
      int v57 = 6963777;
    }
  }
  if (v56)
  {
    QuickCodec::mask = FunctionTable::ft[0] ^ 0x157E9386;
    fegetenv(&v63);
    v63.__fpcr &= QuickCodec::mask + 70947740;
    fesetenv(&v63);
  }
  return v9 & 1;
}

uint64_t Madusa::SigComboBoost::_GetBoostedSignature(uint64_t a1, char *__dst, float *__src)
{
  int v4 = 0;
  int v5 = 0;
  if (QuickCodec::mask == -70947757) {
    int v6 = 9100262;
  }
  else {
    int v6 = 659953;
  }
  uint64_t v7 = 1;
  int v8 = 2141803;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v11 = v7;
        if (v8 <= 2141873) {
          break;
        }
        if (v8 == 2141874)
        {
          if ((*v4 & 0x1F) != 0
            || v4[2] > 0x3Fu
            || (uint64_t v7 = 1,
                int v8 = 659953,
                v4[3] != ((QuickCodec::mask ^ v5) / 0x8F9D3A)))
          {
            int v8 = 660007;
            uint64_t v7 = v11;
          }
        }
        else if (v8 == 2801739)
        {
          int v4 = (unsigned char *)v3;
          int v8 = 2141820;
        }
        else
        {
          BOOL v12 = v8 == 9100262;
          int v8 = 2141874;
          if (v12) {
            int v5 = -1926539173;
          }
        }
      }
      if (v8 <= 2141802) {
        break;
      }
      unsigned int v9 = (QuickCodec::mask != -70947757) | v7;
      if (v8 == 2141820) {
        int v10 = v6;
      }
      else {
        int v10 = v8;
      }
      if (v8 == 2141820) {
        LODWORD(v11) = v9;
      }
      BOOL v12 = v8 == 2141803;
      if (v8 == 2141803) {
        int v8 = 659953;
      }
      else {
        int v8 = v10;
      }
      if (v12) {
        uint64_t v7 = 0;
      }
      else {
        uint64_t v7 = v11;
      }
    }
    if (v8 != 659953) {
      break;
    }
    int v8 = 660007;
    if ((v7 & 1) == 0) {
      int v8 = 2801739;
    }
  }
  if (v7) {
    ++QuickCodec::mask;
  }
  return Madusa::SigComboBoost::GetBoostedSignature(a1, __dst, __src);
}

atomic_uint *Madusa::SigComboBoost::AddSignature@<X0>(atomic_uint *result@<X0>, const void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  *(_WORD *)a4 = 0;
  *(_DWORD *)(a4 + 4) = 0;
  *(_OWORD *)(a4 + 8) = *(_OWORD *)a3;
  *(void *)(a4 + 24) = *(void *)(a3 + 16);
  if (*(float *)a3 >= 6.4376
    || *(float *)(a3 + 4) >= 6.6757
    || *(float *)(a3 + 8) >= 6.797
    || *(float *)(a3 + 16) >= 6.2191)
  {
    *(unsigned char *)(a4 + 1) = 1;
  }
  else
  {
    int v5 = result;
    int add = atomic_fetch_add(result + 8449, 1u);
    if (add <= 29)
    {
      double result = (atomic_uint *)memcpy(&result[275 * add + 18], a2, 0x44CuLL);
      uint64_t v7 = &v5[6 * add];
      uint64_t v8 = *(void *)(a3 + 16);
      *((_OWORD *)v7 + 2067) = *(_OWORD *)a3;
      *((void *)v7 + 4136) = v8;
    }
  }
  return result;
}

void Madusa::SigComboBoost::SortSignatures(uint64_t a1, uint64_t a2, int a3, int32x4_t *a4)
{
  if (a3 < 1) {
    return;
  }
  if (a3 < 8)
  {
    for (uint64_t i = 0; i != a3; ++i)
LABEL_7:
      a4->i32[i] = i;
    goto LABEL_8;
  }
  uint64_t i = a3 & 0x7FFFFFF8;
  int32x4_t v5 = (int32x4_t)xmmword_100044420;
  int v6 = a4 + 1;
  v7.i64[0] = 0x400000004;
  v7.i64[1] = 0x400000004;
  v8.i64[0] = 0x800000008;
  v8.i64[1] = 0x800000008;
  uint64_t v9 = a3 & 0xFFFFFFF8;
  do
  {
    v6[-1] = v5;
    *int v6 = vaddq_s32(v5, v7);
    int32x4_t v5 = vaddq_s32(v5, v8);
    v6 += 2;
    v9 -= 8;
  }
  while (v9);
  if (i != a3) {
    goto LABEL_7;
  }
LABEL_8:
  if (a3 >= 2)
  {
    for (uint64_t j = 1; j != a3; ++j)
    {
      __int32 v11 = a4->i32[j];
      float v12 = *(float *)(a2 + 24 * v11);
      uint64_t v13 = j;
      while (1)
      {
        uint64_t v14 = v13 - 1;
        __int32 v15 = a4->i32[(v13 - 1)];
        if (v12 <= *(float *)(a2 + 24 * v15)) {
          break;
        }
        a4->i32[v13--] = v15;
        if (v14 + 1 <= 1)
        {
          LODWORD(v13) = 0;
          break;
        }
      }
      a4->i32[(int)v13] = v11;
    }
  }
}

void Madusa::SigComboBoost::_SortSignatures(uint64_t a1, uint64_t a2, int a3, int32x4_t *a4)
{
  if ((*v4 & 0x1F) != 0 || v4[2] > 0x3Fu)
  {
    int v5 = QuickCodec::mask;
    if (QuickCodec::mask != -70947757) {
LABEL_10:
    }
      QuickCodec::mask = v5 + 1;
  }
  else
  {
    int v5 = QuickCodec::mask;
    if (v4[3] == 212 || QuickCodec::mask != -70947757) {
      goto LABEL_10;
    }
  }
  Madusa::SigComboBoost::SortSignatures(a1, a2, a3, a4);
}

uint64_t Madusa::SigComboBoost::Evaluate@<X0>(Madusa::SigComboBoost *this@<X0>, uint64_t a2@<X8>)
{
  unint64_t v3 = (_DWORD *)((char *)this + 33792);
  *(void *)(a2 + 4) = 0;
  int16x8_t v21 = (_DWORD *)(a2 + 4);
  *(_WORD *)a2 = 0;
  *(void *)(a2 + 20) = 0;
  *(void *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 28) = -1;
  int16x8_t v20 = (unsigned int *)((char *)this + 33796);
  int v4 = atomic_load((unsigned int *)this + 8449);
  if (v4 >= 30) {
    uint64_t v5 = 30;
  }
  else {
    uint64_t v5 = v4;
  }
  int v6 = (char *)this + 33072;
  uint64_t func = (uint64_t (*)(Madusa::SigComboBoost *, char *, uint64_t, unsigned char *))__find_func(0x5F9FFFDF80A00060, -1323040758);
  uint64_t result = func(this, v6, v5, v26);
  if (v4 >= 1)
  {
    if ((int)v5 <= 1) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v5;
    }
    int v10 = (int *)v26;
    while (1)
    {
      int v13 = *v10++;
      int v12 = v13;
      uint64_t v14 = (char *)this + 1100 * v13 + 72;
      uint64_t v24 = 0;
      uint64_t v25 = 0;
      ++*v3;
      if ((int)v3[2210] >= 1)
      {
        __int32 v15 = (unsigned int (*)(Madusa::SigComboBoost *, unsigned char *, char *))__find_func(0x3F3FBF5F000000D0, -779861878);
        if (v15(this, v23, v14))
        {
          float v16 = (uint64_t (*)(char *, unsigned char *, float))__find_func(0x5FFF9F3F00A0E0F0, -1320918806);
          uint64_t result = v16((char *)this + 8, v23, 50.0);
          *(unsigned char *)a2 = 1;
          *(_OWORD *)(a2 + 8) = *(_OWORD *)result;
          *(void *)(a2 + 24) = *(void *)(result + 16);
          BOOL v17 = *(float *)result < 6.4376 && *(float *)(result + 4) < 6.6757;
          if (!v17 || *(float *)(result + 8) >= 6.797) {
            break;
          }
        }
      }
      __int32 v11 = (uint64_t (*)(Madusa::SigComboBoost *, char *, char *))__find_func(0x5F7F7FBFA0E080E0, -1312522134);
      uint64_t result = v11(this, v14, &v6[24 * v12]);
      if (!--v9) {
        goto LABEL_20;
      }
    }
    *(unsigned char *)(a2 + 1) = 1;
  }
LABEL_20:
  int16x8_t v19 = v21;
  atomic_store(0, v20);
  *int16x8_t v19 = *v3;
  return result;
}

void sub_100018B90()
{
}

void sub_100018BA4()
{
}

uint64_t sub_100018BB8(uint64_t a1)
{
  return a1 + 8;
}

void sub_100018BC0()
{
}

void *Madusa::ProfileTimer::ProfileTimer(void *a1, uint64_t a2, uint64_t a3)
{
  *a1 = off_100070848;
  a1[1] = a2;
  a1[2] = a3;
  (*(void (**)(uint64_t, void *))(*(void *)a3 + 56))(a3, a1);
  return a1;
}

void Madusa::ProfileTimer::~ProfileTimer(Madusa::ProfileTimer *this)
{
  *(void *)this = off_100070848;
  (*(void (**)(void, Madusa::ProfileTimer *))(**((void **)this + 2) + 64))(*((void *)this + 2), this);
}

{
  uint64_t vars8;

  *(void *)this = off_100070848;
  (*(void (**)(void, Madusa::ProfileTimer *))(**((void **)this + 2) + 64))(*((void *)this + 2), this);

  operator delete();
}

uint64_t sub_100018D3C()
{
  return 1;
}

void Madusa::FrequencyTransform::Window(uint64_t a1, void *a2)
{
  uint64_t v2 = 0;
  unint64_t v3 = (float32x4_t *)(*a2 + 8);
  uint64_t v4 = *a2 + 520;
  do
  {
    float v22 = *((float *)&Madusa::FrequencyTransform::mWindowCoeffs + v2);
    int16x8_t v23 = (long long *)(v4 + (v2 << 9));
    if (v3 < (float32x4_t *)&Madusa::gReadstatsHandle)
    {
      BOOL v24 = v23 >= &Madusa::FrequencyTransform::mWindowCoeffs;
      BOOL v25 = v23 == &Madusa::FrequencyTransform::mWindowCoeffs;
    }
    else
    {
      BOOL v24 = 0;
      BOOL v25 = 0;
    }
    if (!v25 && v24)
    {
      for (uint64_t i = 0; i != 128; ++i)
        v3->f32[i] = *(float *)((char *)&Madusa::FrequencyTransform::mWindowCoeffs + i * 4) * (float)(v22 * v3->f32[i]);
    }
    else
    {
      float32x4_t v5 = vmulq_f32(vmulq_n_f32(unk_100074830, v22), v3[1]);
      float32x4_t *v3 = vmulq_f32(vmulq_n_f32((float32x4_t)Madusa::FrequencyTransform::mWindowCoeffs, v22), *v3);
      v3[1] = v5;
      float32x4_t v6 = vmulq_f32(vmulq_n_f32(unk_100074850, v22), v3[3]);
      v3[2] = vmulq_f32(vmulq_n_f32((float32x4_t)xmmword_100074840, v22), v3[2]);
      v3[3] = v6;
      float32x4_t v7 = vmulq_f32(vmulq_n_f32(unk_100074870, v22), v3[5]);
      v3[4] = vmulq_f32(vmulq_n_f32((float32x4_t)xmmword_100074860, v22), v3[4]);
      v3[5] = v7;
      float32x4_t v8 = vmulq_f32(vmulq_n_f32(unk_100074890, v22), v3[7]);
      v3[6] = vmulq_f32(vmulq_n_f32((float32x4_t)xmmword_100074880, v22), v3[6]);
      v3[7] = v8;
      float32x4_t v9 = vmulq_f32(vmulq_n_f32(unk_1000748B0, v22), v3[9]);
      v3[8] = vmulq_f32(vmulq_n_f32((float32x4_t)xmmword_1000748A0, v22), v3[8]);
      v3[9] = v9;
      float32x4_t v10 = vmulq_f32(vmulq_n_f32(unk_1000748D0, v22), v3[11]);
      v3[10] = vmulq_f32(vmulq_n_f32((float32x4_t)xmmword_1000748C0, v22), v3[10]);
      v3[11] = v10;
      float32x4_t v11 = vmulq_f32(vmulq_n_f32(unk_1000748F0, v22), v3[13]);
      v3[12] = vmulq_f32(vmulq_n_f32((float32x4_t)xmmword_1000748E0, v22), v3[12]);
      v3[13] = v11;
      float32x4_t v12 = vmulq_f32(vmulq_n_f32(unk_100074910, v22), v3[15]);
      v3[14] = vmulq_f32(vmulq_n_f32((float32x4_t)xmmword_100074900, v22), v3[14]);
      v3[15] = v12;
      float32x4_t v13 = vmulq_f32(vmulq_n_f32(unk_100074930, v22), v3[17]);
      v3[16] = vmulq_f32(vmulq_n_f32((float32x4_t)xmmword_100074920, v22), v3[16]);
      v3[17] = v13;
      float32x4_t v14 = vmulq_f32(vmulq_n_f32(unk_100074950, v22), v3[19]);
      v3[18] = vmulq_f32(vmulq_n_f32((float32x4_t)xmmword_100074940, v22), v3[18]);
      v3[19] = v14;
      float32x4_t v15 = vmulq_f32(vmulq_n_f32(unk_100074970, v22), v3[21]);
      v3[20] = vmulq_f32(vmulq_n_f32((float32x4_t)xmmword_100074960, v22), v3[20]);
      v3[21] = v15;
      float32x4_t v16 = vmulq_f32(vmulq_n_f32(unk_100074990, v22), v3[23]);
      v3[22] = vmulq_f32(vmulq_n_f32((float32x4_t)xmmword_100074980, v22), v3[22]);
      v3[23] = v16;
      float32x4_t v17 = vmulq_f32(vmulq_n_f32(unk_1000749B0, v22), v3[25]);
      v3[24] = vmulq_f32(vmulq_n_f32((float32x4_t)xmmword_1000749A0, v22), v3[24]);
      v3[25] = v17;
      float32x4_t v18 = vmulq_f32(vmulq_n_f32(unk_1000749D0, v22), v3[27]);
      v3[26] = vmulq_f32(vmulq_n_f32((float32x4_t)xmmword_1000749C0, v22), v3[26]);
      v3[27] = v18;
      float32x4_t v19 = vmulq_f32(vmulq_n_f32(unk_1000749F0, v22), v3[29]);
      v3[28] = vmulq_f32(vmulq_n_f32((float32x4_t)xmmword_1000749E0, v22), v3[28]);
      v3[29] = v19;
      float32x4_t v20 = vmulq_n_f32((float32x4_t)xmmword_100074A00, v22);
      float32x4_t v21 = vmulq_f32(vmulq_n_f32(unk_100074A10, v22), v3[31]);
      v3[30] = vmulq_f32(v20, v3[30]);
      v3[31] = v21;
    }
    v3 += 32;
    ++v2;
  }
  while (v2 != 128);
}

void Madusa::FrequencyTransform::_Window(uint64_t a1, void *a2, int8x8_t a3)
{
  a3.i32[0] = *v3 | 0xFFFFFFE0;
  a3.i8[4] = v3[3];
  *(int8x8_t *)v4.i8 = vand_s8(a3, (int8x8_t)0xFF000000FFLL);
  v4.i64[1] = v4.i64[0];
  float32x4_t v5 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v4, (int32x4_t)xmmword_100044440));
  v6.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_100044450, v5)).u32[0];
  v6.i32[1] = vmovn_s32(vcgtq_f32(v5, (float32x4_t)xmmword_100044450)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v6, 0xFuLL))) & ((v3[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    ++QuickCodec::mask;
  }
  Madusa::FrequencyTransform::Window(a1, a2);
}

BOOL Madusa::VirtualRotator::Rotate180(uint64_t a1, uint64_t a2, Madusa::ImageProperties *this)
{
  Madusa::ImageProperties::GetSafeBounds(this, &v60);
  uint64_t v6 = *(int *)Madusa::ImageProperties::GetYStride(this);
  XStride = (int *)Madusa::ImageProperties::GetXStride(this);
  if (!v62 || (unint64_t)(v61 - 2147483649) < 0xFFFFFFFF00000000)
  {
    uint64_t v8 = 0;
    char v9 = 1;
    uint64_t v10 = *XStride;
    if (v64) {
      goto LABEL_4;
    }
LABEL_26:
    uint64_t v16 = 0;
    BOOL v17 = 0;
    float32x4_t v18 = (Madusa::ImageProperties *)*(unsigned int *)Madusa::ImageProperties::GetBitsPerPixelPerColor(this);
    if ((int)v18 >= 8) {
      goto LABEL_15;
    }
    goto LABEL_27;
  }
  char v9 = 0;
  uint64_t v20 = v61 - 1;
  unint64_t v21 = (unint64_t)v20 >> 63;
  if (v20 < 0) {
    uint64_t v20 = -v20;
  }
  if (v6 >= 0) {
    uint64_t v22 = v6;
  }
  else {
    uint64_t v22 = -v6;
  }
  uint64_t v23 = v20 * v22;
  if (v21 == (unint64_t)v6 >> 63) {
    uint64_t v8 = v23;
  }
  else {
    uint64_t v8 = -v23;
  }
  uint64_t v10 = *XStride;
  if (!v64) {
    goto LABEL_26;
  }
LABEL_4:
  unint64_t v11 = v63 - 2147483649;
  uint64_t v12 = v63 - 1;
  unint64_t v13 = (unint64_t)v12 >> 63;
  if (v12 < 0) {
    uint64_t v12 = -v12;
  }
  if (v10 >= 0) {
    uint64_t v14 = v10;
  }
  else {
    uint64_t v14 = -v10;
  }
  uint64_t v15 = v12 * v14;
  if (v13 != (unint64_t)v10 >> 63) {
    uint64_t v15 = -v15;
  }
  if (v11 >= 0xFFFFFFFF00000000) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = 0;
  }
  BOOL v17 = v11 >= 0xFFFFFFFF00000000;
  float32x4_t v18 = (Madusa::ImageProperties *)*(unsigned int *)Madusa::ImageProperties::GetBitsPerPixelPerColor(this);
  if ((int)v18 >= 8)
  {
LABEL_15:
    Madusa::SubBytePixelDirectionAndOffset::Reset(a1, 8, 1, 0);
    BitsPerPixelPerColor = (unsigned int *)Madusa::ImageProperties::GetBitsPerPixelPerColor(this);
    if (v10) {
      goto LABEL_41;
    }
    goto LABEL_28;
  }
LABEL_27:
  int v24 = Madusa::ImageProperties::ConvertBitsPerPixel(v18);
  Madusa::SubBytePixelDirectionAndOffset::Reset(a1, v24, 1, 8 - v18);
  BitsPerPixelPerColor = (unsigned int *)Madusa::ImageProperties::GetBitsPerPixelPerColor(this);
  if (v10) {
    goto LABEL_41;
  }
LABEL_28:
  BOOL v25 = (Madusa::ImageProperties *)*BitsPerPixelPerColor;
  if ((int)v25 <= 7)
  {
    int v26 = Madusa::ImageProperties::ConvertBitsPerPixel(v25);
    char v27 = v64;
    uint64_t v52 = a1;
    if (v64)
    {
      char v28 = v9;
      uint64_t v29 = a2;
      uint64_t v58 = 0;
      if ((unint64_t)(v63 - 2147483649) >= 0xFFFFFFFF00000000)
      {
        uint64_t v58 = v63 - 1;
        char v27 = 1;
      }
      else
      {
        char v27 = 0;
      }
    }
    else
    {
      char v28 = v9;
      uint64_t v29 = a2;
      uint64_t v58 = 0;
    }
    char v59 = v27;
    Madusa::SafeSubBytePixelIndexer::SafeSubBytePixelIndexer((uint64_t)&v53, v26, 1);
    Madusa::SafeSubBytePixelIndexer::operator+=((int *)&v53, (uint64_t)&v58);
    uint64_t v16 = *((void *)&v54 + 1);
    int v30 = v55;
    int v31 = v57;
    unsigned int v32 = v56;
    BOOL IsValid = Madusa::SafeSubBytePixelIndexer::IsValid((Madusa::SafeSubBytePixelIndexer *)&v53);
    BOOL v17 = 0;
    if (v30 && IsValid)
    {
      if (v31) {
        unsigned int v34 = v32;
      }
      else {
        unsigned int v34 = 0;
      }
      Madusa::SubBytePixelDirectionAndOffset::Reset(v52, v26, -1, v34);
      BOOL v17 = 1;
    }
    a2 = v29;
    char v9 = v28;
  }
LABEL_41:
  if (v17) {
    char v35 = v9;
  }
  else {
    char v35 = 1;
  }
  if (v35) {
    goto LABEL_51;
  }
  uint64_t v36 = v16 + v8;
  if (v8 < 0)
  {
    if ((v16 & 0x8000000000000000) == 0 || v36 <= v8) {
      goto LABEL_52;
    }
LABEL_51:
    uint64_t v36 = 0;
    char v37 = 1;
    goto LABEL_53;
  }
  if ((v16 & 0x8000000000000000) == 0 && v36 < v8) {
    goto LABEL_51;
  }
LABEL_52:
  char v37 = 0;
LABEL_53:
  unint64_t v55 = 0;
  long long v53 = 0u;
  long long v54 = 0u;
  Madusa::ImageProperties::GetPixelData(this, (uint64_t)&v53);
  if (v37) {
    return 0;
  }
  if (v36 < 0)
  {
    unint64_t v41 = -v36;
    if ((void)v53)
    {
      if ((unint64_t)v53 < v41) {
        return 0;
      }
      *(void *)&long long v53 = v53 + v36;
    }
    if (*((void *)&v53 + 1))
    {
      if (*((void *)&v53 + 1) < v41) {
        return 0;
      }
      *((void *)&v53 + 1) += v36;
    }
    if ((void)v54)
    {
      if ((unint64_t)v54 < v41) {
        return 0;
      }
      *(void *)&long long v54 = v54 + v36;
    }
    if (*((void *)&v54 + 1))
    {
      if (*((void *)&v54 + 1) < v41) {
        return 0;
      }
      *((void *)&v54 + 1) += v36;
    }
    if (v55)
    {
      if (v55 < v41) {
        return 0;
      }
      unint64_t v40 = v55 + v36;
LABEL_87:
      unint64_t v55 = v40;
    }
  }
  else
  {
    if ((void)v53)
    {
      if (__CFADD__((void)v53, v36)) {
        return 0;
      }
      *(void *)&long long v53 = v53 + v36;
    }
    if (*((void *)&v53 + 1))
    {
      if (__CFADD__(*((void *)&v53 + 1), v36)) {
        return 0;
      }
      *((void *)&v53 + 1) += v36;
    }
    if ((void)v54)
    {
      if (__CFADD__((void)v54, v36)) {
        return 0;
      }
      *(void *)&long long v54 = v54 + v36;
    }
    if (*((void *)&v54 + 1))
    {
      if (__CFADD__(*((void *)&v54 + 1), v36)) {
        return 0;
      }
      *((void *)&v54 + 1) += v36;
    }
    if (v55)
    {
      unint64_t v40 = v55 + v36;
      if (__CFADD__(v55, v36)) {
        return 0;
      }
      goto LABEL_87;
    }
  }
  double v42 = (double)*(int *)(a2 + 12);
  double v43 = (double)v63;
  double v44 = (double)*(int *)(a2 + 8);
  double v45 = (double)v61;
  Madusa::ImageProperties::GetOffsetBounds(this);
  double v47 = v46;
  double OffsetBounds = Madusa::ImageProperties::GetOffsetBounds(this);
  Madusa::ImageProperties::SetOffset((uint64_t)this, v42 - (v47 + v43), v44 - (OffsetBounds + v45));
  BOOL v49 = v47 <= 2147483650.0;
  if (v47 < -2147483650.0) {
    BOOL v49 = 0;
  }
  if (OffsetBounds > 2147483650.0) {
    BOOL v49 = 0;
  }
  BOOL v38 = OffsetBounds >= -2147483650.0 && v49;
  int v50 = *(_DWORD *)Madusa::ImageProperties::GetXStride(this);
  YStride = (_DWORD *)Madusa::ImageProperties::GetYStride(this);
  Madusa::ImageProperties::UpdatePixelData((uint64_t)this, (uint64_t)&v53, -v50, -*YStride);
  Madusa::ImageProperties::CheckForOptimizedImagePipe((uint64_t)this);
  return v38;
}

BOOL Madusa::VirtualRotator::Rotate90CW(uint64_t a1, uint64_t a2, Madusa::ImageProperties *this)
{
  Madusa::ImageProperties::GetSafeBounds(this, &v30);
  uint64_t v6 = *(int *)Madusa::ImageProperties::GetYStride(this);
  int v7 = *(_DWORD *)Madusa::ImageProperties::GetXStride(this);
  double OffsetBounds = Madusa::ImageProperties::GetOffsetBounds(this);
  Madusa::ImageProperties::GetOffsetBounds(this);
  double v10 = v9;
  int v11 = v32;
  if (v32)
  {
    uint64_t v12 = v31;
    uint64_t v13 = v31 - 1;
    unint64_t v14 = (unint64_t)v13 >> 63;
    if (v13 < 0) {
      uint64_t v13 = 1 - v31;
    }
    if (v6 >= 0) {
      uint64_t v15 = v6;
    }
    else {
      uint64_t v15 = -v6;
    }
    uint64_t v16 = v13 * v15;
    if (v14 == (unint64_t)v6 >> 63) {
      uint64_t v17 = v16;
    }
    else {
      uint64_t v17 = -v16;
    }
    float32x4_t v18 = (Madusa::ImageProperties *)*(unsigned int *)Madusa::ImageProperties::GetBitsPerPixelPerColor(this);
    if ((int)v18 >= 8) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v17 = 0;
    float32x4_t v18 = (Madusa::ImageProperties *)*(unsigned int *)Madusa::ImageProperties::GetBitsPerPixelPerColor(this);
    if ((int)v18 >= 8)
    {
LABEL_11:
      uint64_t v19 = a1;
      int v20 = 8;
      unsigned int v21 = 0;
      goto LABEL_14;
    }
  }
  int v20 = Madusa::ImageProperties::ConvertBitsPerPixel(v18);
  unsigned int v21 = 8 - v18;
  uint64_t v19 = a1;
LABEL_14:
  Madusa::SubBytePixelDirectionAndOffset::Reset(v19, v20, 1, v21);
  unint64_t v29 = 0;
  long long v27 = 0u;
  long long v28 = 0u;
  Madusa::ImageProperties::GetPixelData(this, (uint64_t)&v27);
  if (!v11) {
    return 0;
  }
  if (v17 < 0)
  {
    unint64_t v23 = -v17;
    if ((void)v27)
    {
      if ((unint64_t)v27 < v23) {
        return 0;
      }
      *(void *)&long long v27 = v27 + v17;
    }
    if (*((void *)&v27 + 1))
    {
      if (*((void *)&v27 + 1) < v23) {
        return 0;
      }
      *((void *)&v27 + 1) += v17;
    }
    if ((void)v28)
    {
      if ((unint64_t)v28 < v23) {
        return 0;
      }
      *(void *)&long long v28 = v28 + v17;
    }
    if (*((void *)&v28 + 1))
    {
      if (*((void *)&v28 + 1) < v23) {
        return 0;
      }
      *((void *)&v28 + 1) += v17;
    }
    if (v29)
    {
      if (v29 >= v23)
      {
        unint64_t v22 = v29 + v17;
LABEL_48:
        unint64_t v29 = v22;
        goto LABEL_49;
      }
      return 0;
    }
  }
  else
  {
    if ((void)v27)
    {
      if (__CFADD__((void)v27, v17)) {
        return 0;
      }
      *(void *)&long long v27 = v27 + v17;
    }
    if (*((void *)&v27 + 1))
    {
      if (__CFADD__(*((void *)&v27 + 1), v17)) {
        return 0;
      }
      *((void *)&v27 + 1) += v17;
    }
    if ((void)v28)
    {
      if (__CFADD__((void)v28, v17)) {
        return 0;
      }
      *(void *)&long long v28 = v28 + v17;
    }
    if (*((void *)&v28 + 1))
    {
      if (__CFADD__(*((void *)&v28 + 1), v17)) {
        return 0;
      }
      *((void *)&v28 + 1) += v17;
    }
    if (v29)
    {
      unint64_t v22 = v29 + v17;
      if (!__CFADD__(v29, v17)) {
        goto LABEL_48;
      }
      return 0;
    }
  }
LABEL_49:
  double v26 = (double)*(int *)(a2 + 12) - (OffsetBounds + (double)v12);
  BOOL v24 = v26 >= -2147483650.0 && v26 <= 2147483650.0;
  Madusa::ImageProperties::SetOffset((uint64_t)this, v26, v10);
  Madusa::ImageProperties::SwapWidthAndHeight(this);
  Madusa::ImageProperties::UpdatePixelData((uint64_t)this, (uint64_t)&v27, -(int)v6, v7);
  Madusa::ImageProperties::CheckForOptimizedImagePipe((uint64_t)this);
  return v24;
}

BOOL Madusa::VirtualRotator::Rotate90CCW(uint64_t a1, uint64_t a2, Madusa::ImageProperties *this)
{
  Madusa::ImageProperties::GetSafeBounds(this, &v43);
  int v6 = *(_DWORD *)Madusa::ImageProperties::GetYStride(this);
  uint64_t v7 = *(int *)Madusa::ImageProperties::GetXStride(this);
  double OffsetBounds = Madusa::ImageProperties::GetOffsetBounds(this);
  Madusa::ImageProperties::GetOffsetBounds(this);
  double v10 = v9;
  uint64_t v11 = v45;
  if (v45)
  {
    uint64_t v12 = v44;
    uint64_t v13 = v44 - 1;
    unint64_t v14 = (unint64_t)v13 >> 63;
    uint64_t v15 = 1;
    if (v13 < 0) {
      uint64_t v13 = 1 - v44;
    }
    if (v7 >= 0) {
      uint64_t v16 = v7;
    }
    else {
      uint64_t v16 = -v7;
    }
    uint64_t v17 = v13 * v16;
    if (v14 == (unint64_t)v7 >> 63) {
      uint64_t v18 = v17;
    }
    else {
      uint64_t v18 = -v17;
    }
    uint64_t v19 = (Madusa::ImageProperties *)*(unsigned int *)Madusa::ImageProperties::GetBitsPerPixelPerColor(this);
    if ((int)v19 >= 8)
    {
LABEL_11:
      Madusa::SubBytePixelDirectionAndOffset::Reset(a1, 8, 1, 0);
      BitsPerPixelPerColor = (unsigned int *)Madusa::ImageProperties::GetBitsPerPixelPerColor(this);
      if (v7) {
        goto LABEL_25;
      }
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v18 = 0;
    uint64_t v15 = 0;
    uint64_t v19 = (Madusa::ImageProperties *)*(unsigned int *)Madusa::ImageProperties::GetBitsPerPixelPerColor(this);
    if ((int)v19 >= 8) {
      goto LABEL_11;
    }
  }
  int v21 = Madusa::ImageProperties::ConvertBitsPerPixel(v19);
  Madusa::SubBytePixelDirectionAndOffset::Reset(a1, v21, 1, 8 - v19);
  BitsPerPixelPerColor = (unsigned int *)Madusa::ImageProperties::GetBitsPerPixelPerColor(this);
  if (v7) {
    goto LABEL_25;
  }
LABEL_15:
  unint64_t v22 = (Madusa::ImageProperties *)*BitsPerPixelPerColor;
  if ((int)v22 <= 7)
  {
    uint64_t v36 = a2;
    int v23 = v6;
    int v24 = Madusa::ImageProperties::ConvertBitsPerPixel(v22);
    uint64_t v25 = v12 - 1;
    if (!v11) {
      uint64_t v25 = 0;
    }
    v42[0] = v25;
    v42[1] = v11;
    Madusa::SafeSubBytePixelIndexer::SafeSubBytePixelIndexer((uint64_t)&v37, v24, 1);
    Madusa::SafeSubBytePixelIndexer::operator+=((int *)&v37, (uint64_t)v42);
    uint64_t v18 = *((void *)&v38 + 1);
    int v26 = v39;
    int v27 = v41;
    unsigned int v28 = v40;
    BOOL IsValid = Madusa::SafeSubBytePixelIndexer::IsValid((Madusa::SafeSubBytePixelIndexer *)&v37);
    uint64_t v15 = 0;
    if (v26 && IsValid)
    {
      if (v27) {
        unsigned int v30 = v28;
      }
      else {
        unsigned int v30 = 0;
      }
      Madusa::SubBytePixelDirectionAndOffset::Reset(a1, v24, -1, v30);
      uint64_t v15 = 1;
    }
    int v6 = v23;
    a2 = v36;
  }
LABEL_25:
  unint64_t v39 = 0;
  long long v37 = 0u;
  long long v38 = 0u;
  Madusa::ImageProperties::GetPixelData(this, (uint64_t)&v37);
  if (!v15) {
    return 0;
  }
  if (v18 < 0)
  {
    unint64_t v32 = -v18;
    if ((void)v37)
    {
      if ((unint64_t)v37 < v32) {
        return 0;
      }
      *(void *)&long long v37 = v37 + v18;
    }
    if (*((void *)&v37 + 1))
    {
      if (*((void *)&v37 + 1) < v32) {
        return 0;
      }
      *((void *)&v37 + 1) += v18;
    }
    if ((void)v38)
    {
      if ((unint64_t)v38 < v32) {
        return 0;
      }
      *(void *)&long long v38 = v38 + v18;
    }
    if (*((void *)&v38 + 1))
    {
      if (*((void *)&v38 + 1) < v32) {
        return 0;
      }
      *((void *)&v38 + 1) += v18;
    }
    if (v39)
    {
      if (v39 >= v32)
      {
        unint64_t v31 = v39 + v18;
LABEL_59:
        unint64_t v39 = v31;
        goto LABEL_60;
      }
      return 0;
    }
  }
  else
  {
    if ((void)v37)
    {
      if (__CFADD__((void)v37, v18)) {
        return 0;
      }
      *(void *)&long long v37 = v37 + v18;
    }
    if (*((void *)&v37 + 1))
    {
      if (__CFADD__(*((void *)&v37 + 1), v18)) {
        return 0;
      }
      *((void *)&v37 + 1) += v18;
    }
    if ((void)v38)
    {
      if (__CFADD__((void)v38, v18)) {
        return 0;
      }
      *(void *)&long long v38 = v38 + v18;
    }
    if (*((void *)&v38 + 1))
    {
      if (__CFADD__(*((void *)&v38 + 1), v18)) {
        return 0;
      }
      *((void *)&v38 + 1) += v18;
    }
    if (v39)
    {
      unint64_t v31 = v39 + v18;
      if (!__CFADD__(v39, v18)) {
        goto LABEL_59;
      }
      return 0;
    }
  }
LABEL_60:
  double v35 = (double)*(int *)(a2 + 8) - (v10 + (double)v44);
  BOOL v33 = v35 >= -2147483650.0 && v35 <= 2147483650.0;
  Madusa::ImageProperties::SetOffset((uint64_t)this, OffsetBounds, v35);
  Madusa::ImageProperties::SwapWidthAndHeight(this);
  Madusa::ImageProperties::UpdatePixelData((uint64_t)this, (uint64_t)&v37, v6, -(int)v7);
  Madusa::ImageProperties::CheckForOptimizedImagePipe((uint64_t)this);
  return v33;
}

double Madusa::Ratio::GetRatio(Madusa::Ratio *this)
{
  int v1 = *((_DWORD *)this + 1);
  if (!v1) {
    return 0.0;
  }
  *(float *)&double result = (float)*(int *)this / (float)v1;
  return result;
}

unint64_t Madusa::Ratio::ReduceFraction(Madusa::Ratio *this)
{
  signed int v1 = *(_DWORD *)this;
  uint64_t v2 = *((int *)this + 1);
  for (int i = *(_DWORD *)this / 100; !((v1 - 100 * i) | ((int)v2 % 100)); int i = v1 / 100)
  {
    v1 /= 100;
    uint64_t v2 = ((int)v2 / 100);
  }
  for (; !((v1 % 50) | ((int)v2 % 50)); uint64_t v2 = ((int)v2 / 50))
    v1 /= 50;
  for (int j = v1 / 25; !((v1 - 25 * j) | ((int)v2 % 25)); int j = v1 / 25)
  {
    v1 /= 25;
    uint64_t v2 = ((int)v2 / 25);
  }
  for (int k = v1 / 10; !((v1 - 10 * k) | ((int)v2 % 10)); int k = v1 / 10)
  {
    v1 /= 10;
    uint64_t v2 = ((int)v2 / 10);
  }
  for (; !((v1 % 5) | ((int)v2 % 5)); uint64_t v2 = ((int)v2 / 5))
    v1 /= 5;
  while (!((v1 % 3) | ((int)v2 % 3)))
  {
    v1 /= 3;
    uint64_t v2 = ((int)v2 / 3);
  }
  while (((v1 | v2) & 1) == 0)
  {
    v1 /= 2;
    uint64_t v2 = ((int)v2 / 2);
  }
  return v1 | (unint64_t)(v2 << 32);
}

uint64_t Madusa::RandomNumGenerator::GetNextNumber(Madusa::RandomNumGenerator *this)
{
  uint64_t v1 = *((void *)this + 312);
  if (!v1)
  {
    unint64_t v2 = 0;
    do
    {
      uint64_t v3 = 4 * v2;
      unsigned int v4 = *((_DWORD *)this + v2) & 0x80000000;
      if (v2 == 623) {
        unint64_t v5 = 0;
      }
      else {
        unint64_t v5 = v2 + 1;
      }
      if (v2 >= 0xE3) {
        uint64_t v6 = -227;
      }
      else {
        uint64_t v6 = 397;
      }
      unint64_t v7 = v6 + v2;
      unint64_t v8 = v2 + 1;
      int v9 = *((_DWORD *)this + v5);
      unsigned int v10 = *((_DWORD *)this + v7) ^ ((v9 & 0x7FFFFFFE | v4) >> 1);
      if (v9) {
        unsigned int v11 = v10 ^ 0x9908B0DF;
      }
      else {
        unsigned int v11 = v10;
      }
      *(_DWORD *)((char *)this + v3) = v11;
      unint64_t v2 = v8;
    }
    while (v8 != 624);
  }
  int v12 = *((_DWORD *)this + v1) ^ (*((_DWORD *)this + v1) >> 11);
  unsigned int v13 = (((v12 << 7) & 0x9D2C5680 ^ v12) << 15) & 0xEFC60000 ^ (v12 << 7) & 0x9D2C5680 ^ v12;
  *((void *)this + 312) = (v1 + 1) % 0x270uLL;
  return v13 ^ (v13 >> 18);
}

Madusa::RandomNumGenerator *Madusa::RandomNumGenerator::RandomNumGenerator(Madusa::RandomNumGenerator *this)
{
  *((void *)this + 312) = 0;
  unsigned int __ptr = 0;
  unint64_t v2 = fopen("/dev/urandom", "rb");
  if (v2 && (uint64_t v3 = v2, v4 = fread(&__ptr, 1uLL, 4uLL, v2), fclose(v3), v4 == 4))
  {
    unsigned int v5 = __ptr;
  }
  else
  {
    int v6 = clock();
    unsigned int v5 = v6 ^ (time(0) << 16);
  }
  *((_DWORD *)this + 626) = v5;
  *(_DWORD *)this = v5;
  for (uint64_t i = 1; i != 624; ++i)
  {
    unsigned int v5 = i + 1812433253 * ((v5 >> 30) ^ v5);
    *((_DWORD *)this + i) = v5;
  }
  return this;
}

void *Madusa::LogPolarRemap::Execute(uint64_t a1, void *a2, void *a3, float *a4)
{
  int v6 = 0;
  uint64_t v7 = *a3 + 8;
  uint64_t v8 = *a2 + 8;
  uint64_t v9 = *a2 + 12;
  float v10 = 0.0;
  unsigned int v11 = &dword_100044488;
  do
  {
    uint64_t v12 = 0;
    unsigned int v13 = (float *)v11;
    do
    {
      uint64_t v14 = *((int *)v13 - 2);
      uint64_t v15 = *((int *)v13 - 1);
      if ((int)v14 >= 62) {
        int v16 = 62;
      }
      else {
        int v16 = *((_DWORD *)v13 - 2);
      }
      uint64_t v17 = v8 + 4 * v15;
      uint64_t v18 = v14 << 8;
      if ((int)v15 >= 62) {
        LODWORD(v15) = 62;
      }
      float v20 = *v13;
      float v21 = v13[1];
      v13 += 4;
      float v19 = *(float *)(v17 + v18);
      float v22 = (float)(v19 + (float)((float)(*(float *)(v9 + 4 * (int)v15 + v18) - v19) * v21))
          + (float)((float)((float)(*(float *)(v17 + ((uint64_t)(v16 + 1) << 8))
                                  - (float)(v19 + (float)((float)(*(float *)(v9 + 4 * (int)v15 + v18) - v19) * v21)))
                          + (float)((float)(*(float *)(v9 + 4 * (int)v15 + ((uint64_t)(v16 + 1) << 8))
                                          - *(float *)(v17 + ((uint64_t)(v16 + 1) << 8)))
                                  * v21))
                  * v20);
      float v10 = v22 + v10;
      *(float *)(v7 + v12) = v22;
      v12 += 4;
    }
    while (v12 != 376);
    v7 += 376;
    ++v6;
    v11 += 376;
  }
  while (v6 != 91);
  *a4 = v10 * 0.0001169;
  if (((*v4 & 0x1F) != 0 || v4[2] > 0x3Fu || v4[3] != 212)
    && QuickCodec::mask == -70947757)
  {
    return a3;
  }
  QuickCodec::masint k = FunctionTable::ft[0] ^ 0x157E9386;
  uint64_t func = (void (*)(void, uint64_t))__find_func(0xBFBF1F1FC0C00040, 1359274186);
  func(0, 104);
  return a3;
}

void *Madusa::LogPolarRemap::_Execute(uint64_t a1, void *a2, void *a3, float *a4, int8x8_t a5)
{
  a5.i32[0] = *v5 | 0xFFFFFFE0;
  a5.i8[4] = v5[3];
  *(int8x8_t *)v6.i8 = vand_s8(a5, (int8x8_t)0xFF000000FFLL);
  v6.i64[1] = v6.i64[0];
  float32x4_t v7 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v6, (int32x4_t)xmmword_100044460));
  v8.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_100044470, v7)).u32[0];
  v8.i32[1] = vmovn_s32(vcgtq_f32(v7, (float32x4_t)xmmword_100044470)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v8, 0xFuLL))) & ((v5[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    ++QuickCodec::mask;
  }
  return Madusa::LogPolarRemap::Execute(a1, a2, a3, a4);
}

uint8x16_t *Madusa::TransformPipe::OctAxis(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t v6 = *a3 + 8;
  uint64_t v7 = 1;
  uint64_t v8 = *a2;
  do
  {
    uint64_t v9 = v4 + 130 * v3;
    unint64_t v10 = v9 + 398;
    unint64_t v11 = v9 + 8;
    uint64_t v12 = v5 + (v3 << 9);
    BOOL v13 = v12 + 8 >= v10 || v11 >= v12 + 520;
    if (v13)
    {
      uint64_t v14 = 0;
      uint64_t v15 = (float32x4_t *)v6;
      do
      {
        uint8x16_t v16 = *(uint8x16_t *)(v8 + v14 + 139);
        double result = (uint8x16_t *)(v8 + v14 + 269);
        uint8x16_t v18 = *(uint8x16_t *)(v8 + v14 + 140);
        uint8x16_t v19 = *(uint8x16_t *)(v8 + v14 + 270);
        int8x16_t v20 = vaddq_s8(vsubq_s8(vaddq_s8(vsubq_s8(vaddq_s8(vsubq_s8(vaddq_s8(vsubq_s8(vaddq_s8(vsubq_s8(vaddq_s8(vsubq_s8(vaddq_s8(vsubq_s8(vsubq_s8((int8x16_t)vcgtq_u8(*(uint8x16_t *)(v8 + v14 + 8), v16), (int8x16_t)vcgtq_u8(v16, *(uint8x16_t *)(v8 + v14 + 8))), (int8x16_t)vcgtq_u8(v16, *(uint8x16_t *)(v8 + v14 + 138))), (int8x16_t)vcgtq_u8(*(uint8x16_t *)(v8 + v14 + 138), v16)), (int8x16_t)vcgtq_u8(v16, *(uint8x16_t *)(v8 + v14 + 268))),
                                    (int8x16_t)vcgtq_u8(*(uint8x16_t *)(v8 + v14 + 268), v16)),
                                  (int8x16_t)vcgtq_u8(v16, *(uint8x16_t *)(v8 + v14 + 9))),
                                (int8x16_t)vcgtq_u8(*(uint8x16_t *)(v8 + v14 + 9), v16)),
                              (int8x16_t)vcgtq_u8(v16, *result)),
                            (int8x16_t)vcgtq_u8(*result, v16)),
                          (int8x16_t)vcgtq_u8(v16, *(uint8x16_t *)(v8 + v14 + 10))),
                        (int8x16_t)vcgtq_u8(*(uint8x16_t *)(v8 + v14 + 10), v16)),
                      (int8x16_t)vcgtq_u8(v16, v18)),
                    (int8x16_t)vcgtq_u8(v18, v16)),
                  (int8x16_t)vcgtq_u8(v16, v19)),
                (int8x16_t)vcgtq_u8(v19, v16));
        int8x8_t v21 = (int8x8_t)vextq_s8(v20, v20, 8uLL).u64[0];
        *uint64_t v15 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(*(int8x8_t *)v20.i8, *(int8x8_t *)v20.i8), 8uLL), 8uLL)));
        v15[1] = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(*(int8x8_t *)v20.i8, *(int8x8_t *)v20.i8), 8uLL), 8uLL)));
        v15[2] = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(v21, *(int8x8_t *)v20.i8), 8uLL), 8uLL)));
        void v15[3] = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(v21, *(int8x8_t *)v20.i8), 8uLL), 8uLL)));
        v14 += 16;
        v15 += 4;
      }
      while (v14 != 128);
    }
    else
    {
      for (uint64_t i = 0; i != 128; ++i)
      {
        int v23 = (unsigned __int8 *)(v8 + i);
        unsigned int v24 = *(unsigned __int8 *)(v8 + i + 139);
        unsigned int v25 = *(unsigned __int8 *)(v8 + i + 8);
        BOOL v13 = v24 >= v25;
        BOOL v26 = v24 > v25;
        int v27 = !v13;
        unsigned int v28 = v23[138];
        int v29 = v26 - v27;
        BOOL v30 = v24 > v28;
        BOOL v31 = v24 < v28;
        unsigned int v32 = v23[268];
        if (v30) {
          ++v29;
        }
        int v33 = v29 - v31;
        BOOL v30 = v24 > v32;
        BOOL v34 = v24 < v32;
        unsigned int v35 = v23[9];
        if (v30) {
          ++v33;
        }
        int v36 = v33 - v34;
        BOOL v30 = v24 > v35;
        BOOL v37 = v24 < v35;
        unsigned int v38 = v23[269];
        if (v30) {
          ++v36;
        }
        int v39 = v36 - v37;
        BOOL v30 = v24 > v38;
        BOOL v40 = v24 < v38;
        unsigned int v41 = v23[10];
        if (v30) {
          ++v39;
        }
        int v42 = v39 - v40;
        BOOL v30 = v24 > v41;
        BOOL v43 = v24 < v41;
        unsigned int v44 = v23[140];
        if (v30) {
          ++v42;
        }
        unsigned int v45 = v42 - v43;
        unsigned int v46 = v23[270];
        if (v24 > v44) {
          ++v45;
        }
        double result = (uint8x16_t *)((__PAIR64__(v45, v24) - v44) >> 32);
        BOOL v30 = v24 > v46;
        BOOL v47 = v24 < v46;
        if (v30) {
          char v48 = (_BYTE)result + 1;
        }
        else {
          char v48 = (char)result;
        }
        *(float *)(v6 + 4 * i) = (float)(char)(v48 - v47);
      }
    }
    ++v7;
    ++v3;
    v8 += 130;
    v6 += 512;
  }
  while (v7 != 129);
  return result;
}

uint8x16_t *Madusa::TransformPipe::_OctAxis(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  if ((*v3 & 0x1F) != 0 || v3[2] > 0x3Fu)
  {
    int v4 = QuickCodec::mask;
    if (QuickCodec::mask != -70947757) {
LABEL_10:
    }
      QuickCodec::masint k = v4 + 1;
  }
  else
  {
    int v4 = QuickCodec::mask;
    if (v3[3] == 212 || QuickCodec::mask != -70947757) {
      goto LABEL_10;
    }
  }
  return Madusa::TransformPipe::OctAxis(a1, a2, a3);
}

uint64_t Madusa::MemoryMaster::Reset(void **this, size_t a2)
{
  Madusa::MemoryMaster::Deallocate(this);
  if (!a2) {
    return 0;
  }
  if (Madusa::MemoryMaster::pMemoryAllocator)
  {
    this[1] = (void *)a2;
LABEL_8:
    ReadstatsHandle = Madusa::System::GetReadstatsHandle((Madusa::System *)result);
    ((void (*)(uint64_t (***)(), void **, size_t))(*ReadstatsHandle)[6])(ReadstatsHandle, this, a2);
    return 1;
  }
  uint64_t result = (uint64_t)malloc_type_calloc(a2, 1uLL, 0x23DFE497uLL);
  this[3] = (void *)result;
  if (result)
  {
    this[1] = (void *)a2;
    *((unsigned char *)this + 33) = 1;
    goto LABEL_8;
  }
  return result;
}

Madusa::MemoryMaster *Madusa::MemoryMaster::MemoryMaster(Madusa::MemoryMaster *this, size_t a2)
{
  *(void *)this = off_100070870;
  *((void *)this + 1) = 0;
  int v4 = (size_t *)((char *)this + 8);
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((_WORD *)this + 16) = 0;
  Madusa::MemoryMaster::Deallocate((void **)this);
  if (a2)
  {
    if (Madusa::MemoryMaster::pMemoryAllocator)
    {
      size_t *v4 = a2;
LABEL_6:
      ReadstatsHandle = Madusa::System::GetReadstatsHandle(v5);
      ((void (*)(uint64_t (***)(), Madusa::MemoryMaster *, size_t))(*ReadstatsHandle)[6])(ReadstatsHandle, this, a2);
      return this;
    }
    uint64_t v5 = (Madusa::System *)malloc_type_calloc(a2, 1uLL, 0x23DFE497uLL);
    *((void *)this + 3) = v5;
    if (v5)
    {
      *((void *)this + 1) = a2;
      *((unsigned char *)this + 33) = 1;
      goto LABEL_6;
    }
  }
  return this;
}

void Madusa::MemoryMaster::Deallocate(void **this)
{
  if (this[3] && (*((unsigned char *)this + 33) & 1) != 0)
  {
    unint64_t v2 = *Madusa::System::GetReadstatsHandle((Madusa::System *)this);
    v2[7]();
    Madusa::MemoryMaster::MemoryRelease(this[3]);
  }
  this[3] = 0;
  this[1] = 0;
  this[2] = 0;
  *((unsigned char *)this + 33) = 0;
  *((unsigned char *)this + 32) = 0;
}

void Madusa::MemoryMaster::~MemoryMaster(void **this)
{
  *this = off_100070870;
  Madusa::MemoryMaster::Deallocate(this);
}

{
  uint64_t vars8;

  *this = off_100070870;
  Madusa::MemoryMaster::Deallocate(this);

  operator delete();
}

uint64_t Madusa::MemoryMaster::MemoryMaster(uint64_t this, uint64_t a2, void *a3)
{
  *(void *)this = off_100070870;
  *(void *)(this + 8) = a2;
  *(void *)(this + 16) = 0;
  *(void *)(this + 24) = a3;
  *(_WORD *)(this + 32) = 0;
  if (a3)
  {
    if (!Madusa::MemoryMaster::pMemoryAllocator) {
      return this;
    }
  }
  else
  {
    *(void *)(this + 8) = 0;
    if (!Madusa::MemoryMaster::pMemoryAllocator) {
      return this;
    }
  }
  *(void *)(this + 24) = 0;
  return this;
}

unint64_t Madusa::MemoryMaster::AllocateBuffer(Madusa::MemoryMaster *this, unint64_t a2)
{
  if (*((unsigned char *)this + 32)) {
    return 0;
  }
  *((unsigned char *)this + 32) = 1;
  if (!a2) {
    return 0;
  }
  unint64_t v6 = *((void *)this + 1);
  unint64_t v5 = *((void *)this + 2);
  BOOL v7 = v6 > v5;
  unint64_t v8 = v6 - v5;
  if (!v7 || v8 < a2) {
    return 0;
  }
  if (Madusa::MemoryMaster::pMemoryAllocator)
  {
    unint64_t result = Madusa::MemoryMaster::pMemoryAllocator(a2, Madusa::MemoryMaster::pMemoryAllocatorParam);
    unint64_t v5 = *((void *)this + 2);
  }
  else
  {
    unint64_t result = v5 + *((void *)this + 3);
  }
  *((void *)this + 2) = v5 + a2;
  *((unsigned char *)this + 32) = result == 0;
  return result;
}

uint64_t Madusa::MemoryMaster::DeAllocateBuffer(uint64_t this, void *a2)
{
  if (this)
  {
    if (Madusa::MemoryMaster::pMemoryDeallocator) {
      return Madusa::MemoryMaster::pMemoryDeallocator();
    }
  }
  return this;
}

void *Madusa::MemoryMaster::Create(Madusa::MemoryMaster *this)
{
  if (Madusa::MemoryMaster::pMemoryAllocator)
  {
    unint64_t v2 = (void *)Madusa::MemoryMaster::pMemoryAllocator(40, Madusa::MemoryMaster::pMemoryAllocatorParam);
    if (!v2) {
      return v2;
    }
  }
  else
  {
    unint64_t v2 = malloc_type_calloc(0x28uLL, 1uLL, 0x23DFE497uLL);
    if (!v2) {
      return v2;
    }
  }
  void *v2 = off_100070870;
  v2[1] = 0;
  v2[2] = 0;
  v2[3] = 0;
  *((_WORD *)v2 + 16) = 0;
  Madusa::MemoryMaster::Deallocate((void **)v2);
  if (!this) {
    return v2;
  }
  if (Madusa::MemoryMaster::pMemoryAllocator)
  {
    v2[1] = this;
  }
  else
  {
    int v4 = (Madusa::System *)malloc_type_calloc((size_t)this, 1uLL, 0x23DFE497uLL);
    v2[3] = v4;
    if (!v4) {
      return v2;
    }
    v2[1] = this;
    *((unsigned char *)v2 + 33) = 1;
  }
  ReadstatsHandle = Madusa::System::GetReadstatsHandle(v4);
  ((void (*)(uint64_t (***)(), void *, Madusa::MemoryMaster *))(*ReadstatsHandle)[6])(ReadstatsHandle, v2, this);
  return v2;
}

void Madusa::MemoryMaster::Destroy(Madusa::MemoryMaster *this, Madusa::MemoryMaster *a2)
{
  (**(void (***)(Madusa::MemoryMaster *, Madusa::MemoryMaster *))this)(this, a2);
  uint64_t v3 = Madusa::MemoryMaster::pMemoryDeallocator;
  if (Madusa::MemoryMaster::pMemoryDeallocator)
  {
    uint64_t v4 = Madusa::MemoryMaster::pMemoryDeallocatorParam;
    ((void (*)(Madusa::MemoryMaster *, uint64_t))v3)(this, v4);
  }
  else
  {
    free(this);
  }
}

uint64_t (*Madusa::MemoryMaster::SetMemoryAllocatorAndDeallocator(uint64_t (*this)(void, void), void *(*a2)(unint64_t, void *), uint64_t (*a3)(void), void (*a4)(void *, void *), void *a5))(void, void)
{
  Madusa::MemoryMaster::pMemoryAllocator = this;
  Madusa::MemoryMaster::pMemoryAllocatorParam = (uint64_t)a2;
  Madusa::MemoryMaster::pMemoryDeallocator = a3;
  Madusa::MemoryMaster::pMemoryDeallocatorParam = (uint64_t)a4;
  return this;
}

BOOL Madusa::MemoryMaster::Valid(Madusa::MemoryMaster *this)
{
  if (!(*((void *)this + 3) | (unint64_t)Madusa::MemoryMaster::pMemoryAllocator)) {
    return 0;
  }
  if (*((unsigned char *)this + 32)) {
    BOOL v2 = 1;
  }
  else {
    BOOL v2 = *((void *)this + 1) == 0;
  }
  return !v2;
}

double Madusa::FindPeaks::FindPeaks(void *a1, uint64_t a2)
{
  *a1 = a2;
  *(void *)&double result = 0x350000000ELL;
  a1[1] = 0x350000000ELL;
  return result;
}

uint64_t Madusa::FindPeaks::SubPixelResolutionCandidateList(uint64_t **a1, uint64_t a2, int a3, uint64_t a4)
{
  if (a3 < 1)
  {
    uint64_t v5 = 0;
    unint64_t v22 = 0;
    goto LABEL_25;
  }
  uint64_t v5 = 0;
  if (a3 >= 8) {
    uint64_t v6 = 8;
  }
  else {
    uint64_t v6 = a3;
  }
  BOOL v7 = (float *)(a2 + 4);
  do
  {
    float v17 = *(v7 - 1);
    if (v17 > 0.0)
    {
      unsigned int v18 = *((_DWORD *)v7 + 1);
      if (v18 - 1 <= 0x58)
      {
        uint64_t v19 = *(int *)v7;
        uint64_t v20 = **a1;
        uint64_t v21 = v20 + 8;
        if ((int)v19 <= 0)
        {
          uint64_t v8 = 94 * v18;
          float v9 = *(float *)(v20 + 376 * v18 + 380);
        }
        else
        {
          uint64_t v8 = 94 * v18;
          float v9 = *(float *)(v21 + 4 * (v19 - 1) + 376 * v18);
          if (v19 > 0x5C)
          {
            unint64_t v10 = (float *)(v21 + 376 * v18);
            goto LABEL_8;
          }
        }
        unint64_t v10 = (float *)(v21 + 4 * v19 + 4 * v8 + 4);
LABEL_8:
        uint64_t v11 = v21 + 4 * v19;
        float v12 = *(float *)(v11 + 376 * v18 + 376);
        float v13 = *(float *)(v11 + 4 * v8);
        float v14 = (float)((float)(v12 - *(float *)(v11 + 376 * (v18 - 1)))
                    / (float)((float)((float)((float)(*(float *)(v11 + 376 * (v18 - 1)) + 0.0001) + v12) + v13)
                            + (float)(fminf(v13, fminf(*(float *)(v11 + 376 * (v18 - 1)), v12)) * -3.0)))
            + (float)(int)v18;
        uint64_t v15 = (float *)(a4 + 12 * (int)v5);
        float v16 = (float)((float)(*v10 - v9)
                    / (float)((float)((float)((float)(v9 + 0.0001) + *v10) + v13)
                            + (float)(fminf(v13, fminf(v9, *v10)) * -3.0)))
            + (float)(int)v19;
        *uint64_t v15 = v17;
        v15[1] = v16;
        v15[2] = v14;
        uint64_t v5 = (v5 + 1);
      }
    }
    v7 += 3;
    --v6;
  }
  while (v6);
  if ((int)v5 > 0) {
    goto LABEL_29;
  }
  unint64_t v22 = (int)v5;
  uint64_t v23 = (v5 + 1);
  uint64_t v24 = 2 - v23;
  if ((unint64_t)(2 - v23) < 8 || (unint64_t v25 = 1 - v23, -2 - (int)v5 < v25) || HIDWORD(v25))
  {
LABEL_25:
    unint64_t v26 = v22;
    goto LABEL_26;
  }
  unint64_t v26 = (v24 & 0xFFFFFFFFFFFFFFF8) + (int)v5;
  int v27 = (_OWORD *)(a4 + 12 * (int)v5);
  unint64_t v28 = v24 & 0xFFFFFFFFFFFFFFF8;
  do
  {
    *int v27 = xmmword_10006DB50;
    v27[1] = xmmword_10006DB40;
    v27[4] = xmmword_10006DB40;
    v27[5] = xmmword_10006DB30;
    v27[2] = xmmword_10006DB30;
    v27[3] = xmmword_10006DB50;
    v27 += 6;
    v28 -= 8;
  }
  while (v28);
  if (v24 != (v24 & 0xFFFFFFFFFFFFFFF8))
  {
LABEL_26:
    uint64_t v29 = a4 + 12 * v26;
    unint64_t v30 = v26 + 1;
    do
    {
      *(_DWORD *)(v29 + 8) = 1110704128;
      *(void *)uint64_t v29 = 0x423C000000000000;
      v29 += 12;
      BOOL v31 = v30++ == 1;
    }
    while (!v31);
  }
LABEL_29:
  if ((*v4 & 0x1F) != 0 || v4[2] > 0x3Fu)
  {
    if (QuickCodec::mask != -70947757) {
      goto LABEL_38;
    }
  }
  else
  {
    BOOL v31 = v4[3] != 212 && QuickCodec::mask == -70947757;
    if (!v31)
    {
LABEL_38:
      QuickCodec::masint k = FunctionTable::ft[0] ^ 0x157E9386;
      fegetenv(&v33);
      v33.__fpcr &= QuickCodec::mask + 70947740;
      fesetenv(&v33);
    }
  }
  return v5;
}

uint64_t Madusa::FindPeaks::_SubPixelResolutionCandidateList(uint64_t **a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = 0;
  int v6 = 0;
  if (QuickCodec::mask == -70947757) {
    int v7 = 4722003;
  }
  else {
    int v7 = 1125686;
  }
  uint64_t v8 = 1;
  int v9 = 2275031;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v12 = v8;
        if (v9 <= 2275101) {
          break;
        }
        if (v9 == 2275102)
        {
          if ((*v5 & 0x1F) != 0
            || v5[2] > 0x3Fu
            || (uint64_t v8 = 1,
                int v9 = 1125686,
                v5[3] != ((QuickCodec::mask ^ v6) / 0x132AFB)))
          {
            int v9 = 1125740;
            uint64_t v8 = v12;
          }
        }
        else if (v9 == 3400700)
        {
          uint64_t v5 = (unsigned char *)v4;
          int v9 = 2275048;
        }
        else
        {
          BOOL v13 = v9 == 4722003;
          int v9 = 2275102;
          if (v13) {
            int v6 = -199558257;
          }
        }
      }
      if (v9 <= 2275030) {
        break;
      }
      unsigned int v10 = (QuickCodec::mask != -70947757) | v8;
      if (v9 == 2275048) {
        int v11 = v7;
      }
      else {
        int v11 = v9;
      }
      if (v9 == 2275048) {
        LODWORD(v12) = v10;
      }
      BOOL v13 = v9 == 2275031;
      if (v9 == 2275031) {
        int v9 = 1125686;
      }
      else {
        int v9 = v11;
      }
      if (v13) {
        uint64_t v8 = 0;
      }
      else {
        uint64_t v8 = v12;
      }
    }
    if (v9 != 1125686) {
      break;
    }
    int v9 = 1125740;
    if ((v8 & 1) == 0) {
      int v9 = 3400700;
    }
  }
  if (v8) {
    ++QuickCodec::mask;
  }
  return Madusa::FindPeaks::SubPixelResolutionCandidateList(a1, a2, a3, a4);
}

uint64_t Madusa::FindPeaks::FindHighestCandidatesSplit(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)int32x4_t v118 = 0;
  Madusa::AffineTransform::GetScaleRangeLimits(&v118[1], v118, a3);
  int v6 = v118[1];
  if (v118[1] <= 0)
  {
    int v6 = 1;
    v118[1] = 1;
    int v7 = v118[0];
    if (v118[0] < 90) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  int v7 = v118[0];
  if (v118[0] >= 90)
  {
LABEL_3:
    int v7 = 89;
    v118[0] = 89;
  }
LABEL_4:
  int v8 = 0;
  int v9 = 0;
  *(void *)&v112[4] = 0x5A00000000;
  *(void *)&v114[4] = 0x5A00000000;
  *(_OWORD *)&v116[4] = xmmword_10006DB70;
  int v110 = -1;
  *(_DWORD *)int32x4_t v112 = 0;
  *(_DWORD *)uint32x4_t v113 = 0;
  *(void *)&v113[4] = 0x5A00000000;
  *(_DWORD *)int32x4_t v114 = 0;
  *(_DWORD *)int32x4_t v115 = 0;
  *(void *)&v115[4] = 0x5A00000000;
  *(_DWORD *)uint32x4_t v116 = 0;
  char v117 = 0;
  *(_DWORD *)int32x4_t v106 = 0;
  *(void *)&v106[4] = 0x5A00000000;
  *(_DWORD *)uint32x4_t v107 = 0;
  *(void *)&v107[4] = 0x5A00000000;
  *(_DWORD *)int32x4_t v108 = 0;
  *(void *)&v108[4] = 0x5A00000000;
  if (v6 > v7) {
    goto LABEL_58;
  }
  int v9 = 0;
  int v10 = 0;
  int v8 = 0;
  int v11 = 0;
  uint64_t v12 = **(void **)a1 + 376 * v6 - 368;
  int v13 = *(_DWORD *)(a1 + 8);
  while (2)
  {
    if (v6 < v13 || v6 > *(_DWORD *)(a1 + 12))
    {
      uint64_t v14 = 0;
      uint64_t v15 = (float *)v12;
      while (1)
      {
        float v17 = v15[94] + (float)((float)(v15[188] + *v15) * 0.2);
        if (v9 <= 2)
        {
          int v10 = 0;
          float v16 = &v106[12 * v9];
          *(float *)float v16 = v17;
          *((_DWORD *)v16 + 1) = v14;
          *((_DWORD *)v16 + 2) = v6;
          ++v9;
        }
        else
        {
          if (!v10)
          {
            int v19 = 0;
            int v110 = 0;
            float v20 = *(float *)v106;
            if (*(float *)v107 < *(float *)v106)
            {
              int v19 = 1;
              int v110 = 1;
              float v20 = *(float *)v107;
            }
            if (*(float *)v108 < v20)
            {
              int v19 = 2;
              int v110 = 2;
            }
            int v10 = 1;
            unsigned int v18 = &v106[12 * v19];
            if (v17 <= *(float *)v18) {
              goto LABEL_11;
            }
LABEL_21:
            int v10 = 0;
            *(float *)unsigned int v18 = v17;
            *((_DWORD *)v18 + 1) = v14;
            *((_DWORD *)v18 + 2) = v6;
            goto LABEL_11;
          }
          unsigned int v18 = &v106[12 * v110];
          if (v17 > *(float *)v18) {
            goto LABEL_21;
          }
        }
LABEL_11:
        ++v14;
        ++v15;
        if (v14 == 94) {
          goto LABEL_6;
        }
      }
    }
    uint64_t v21 = 0;
    unint64_t v22 = (float *)v12;
    do
    {
      float v24 = v22[94] + (float)((float)(v22[188] + *v22) * 0.2);
      if (v8 < 5)
      {
        uint64_t v23 = &v112[12 * v8];
        *(float *)uint64_t v23 = v24;
        *((_DWORD *)v23 + 1) = v21;
        *((_DWORD *)v23 + 2) = v6;
        *(_DWORD *)&v116[12] = ++v8;
LABEL_24:
        int v11 = 0;
        char v117 = 0;
        goto LABEL_25;
      }
      if (v11)
      {
        unint64_t v25 = &v112[12 * *(int *)&v116[16]];
        if (v24 > *(float *)v25) {
          goto LABEL_36;
        }
        goto LABEL_25;
      }
      int v26 = 0;
      *(_DWORD *)&v116[16] = 0;
      float v27 = *(float *)v112;
      if (*(float *)v113 < *(float *)v112)
      {
        int v26 = 1;
        *(_DWORD *)&v116[16] = 1;
        float v27 = *(float *)v113;
        float v28 = *(float *)v114;
        if (*(float *)v114 >= *(float *)v113)
        {
LABEL_32:
          float v29 = *(float *)v115;
          if (*(float *)v115 >= v27) {
            goto LABEL_33;
          }
          goto LABEL_39;
        }
      }
      else
      {
        float v28 = *(float *)v114;
        if (*(float *)v114 >= *(float *)v112) {
          goto LABEL_32;
        }
      }
      int v26 = 2;
      *(_DWORD *)&v116[16] = 2;
      float v27 = v28;
      float v29 = *(float *)v115;
      if (*(float *)v115 >= v27)
      {
LABEL_33:
        if (*(float *)v116 >= v27) {
          goto LABEL_35;
        }
LABEL_34:
        int v26 = 4;
        *(_DWORD *)&v116[16] = 4;
        goto LABEL_35;
      }
LABEL_39:
      int v26 = 3;
      *(_DWORD *)&v116[16] = 3;
      if (*(float *)v116 < v29) {
        goto LABEL_34;
      }
LABEL_35:
      int v11 = 1;
      char v117 = 1;
      unint64_t v25 = &v112[12 * v26];
      if (v24 > *(float *)v25)
      {
LABEL_36:
        *(float *)unint64_t v25 = v24;
        *((_DWORD *)v25 + 1) = v21;
        *((_DWORD *)v25 + 2) = v6;
        goto LABEL_24;
      }
LABEL_25:
      ++v21;
      ++v22;
    }
    while (v21 != 94);
LABEL_6:
    v12 += 376;
    BOOL v64 = v6++ == v7;
    if (!v64) {
      continue;
    }
    break;
  }
  int v109 = v9;
  char v111 = v10;
  if (v9 < 1) {
    goto LABEL_46;
  }
  if (*(float *)v107 <= *(float *)v106)
  {
    float v30 = *(float *)v108;
    if (*(float *)v108 <= *(float *)v106) {
      goto LABEL_44;
    }
LABEL_95:
    int v70 = *(_DWORD *)&v106[8];
    uint64_t v71 = *(void *)v106;
    *(void *)int32x4_t v106 = *(void *)v108;
    *(_DWORD *)&v106[8] = *(_DWORD *)&v108[8];
    *(void *)int32x4_t v108 = v71;
    *(_DWORD *)&v108[8] = v70;
    if (*(float *)&v71 <= *(float *)v107) {
      goto LABEL_46;
    }
LABEL_45:
    int v31 = *(_DWORD *)&v107[8];
    uint64_t v32 = *(void *)v107;
    *(void *)uint32x4_t v107 = *(void *)v108;
    *(_DWORD *)&v107[8] = *(_DWORD *)&v108[8];
    *(void *)int32x4_t v108 = v32;
    *(_DWORD *)&v108[8] = v31;
    goto LABEL_46;
  }
  int v68 = *(_DWORD *)&v106[8];
  uint64_t v69 = *(void *)v106;
  *(void *)int32x4_t v106 = *(void *)v107;
  *(_DWORD *)&v106[8] = *(_DWORD *)&v107[8];
  *(void *)uint32x4_t v107 = v69;
  *(_DWORD *)&v107[8] = v68;
  float v30 = *(float *)v108;
  if (*(float *)v108 > *(float *)v106) {
    goto LABEL_95;
  }
LABEL_44:
  if (v30 > *(float *)v107) {
    goto LABEL_45;
  }
LABEL_46:
  if (v8 >= 1)
  {
    float v33 = *(float *)v112;
    if (*(float *)v113 > *(float *)v112)
    {
      int v72 = *(_DWORD *)&v112[8];
      uint64_t v73 = *(void *)v112;
      *(void *)int32x4_t v112 = *(void *)v113;
      *(_DWORD *)&v112[8] = *(_DWORD *)&v113[8];
      *(void *)uint32x4_t v113 = v73;
      *(_DWORD *)&v113[8] = v72;
      float v33 = *(float *)v112;
      if (*(float *)v114 > *(float *)v112) {
        goto LABEL_98;
      }
LABEL_49:
      if (*(float *)v115 <= v33) {
        goto LABEL_50;
      }
LABEL_99:
      int v76 = *(_DWORD *)&v112[8];
      uint64_t v77 = *(void *)v112;
      *(void *)int32x4_t v112 = *(void *)v115;
      *(_DWORD *)&v112[8] = *(_DWORD *)&v115[8];
      *(void *)int32x4_t v115 = v77;
      *(_DWORD *)&v115[8] = v76;
      if (*(float *)v116 > *(float *)v112) {
        goto LABEL_100;
      }
LABEL_51:
      float v34 = *(float *)v113;
      if (*(float *)v114 <= *(float *)v113) {
        goto LABEL_52;
      }
LABEL_101:
      int v80 = *(_DWORD *)&v113[8];
      uint64_t v81 = *(void *)v113;
      *(_DWORD *)&v113[8] = *(_DWORD *)&v114[8];
      *(void *)uint32x4_t v113 = *(void *)v114;
      *(void *)int32x4_t v114 = v81;
      *(_DWORD *)&v114[8] = v80;
      float v34 = *(float *)v113;
      if (*(float *)v115 > *(float *)v113) {
        goto LABEL_102;
      }
LABEL_53:
      if (*(float *)v116 <= v34) {
        goto LABEL_54;
      }
LABEL_103:
      int v84 = *(_DWORD *)&v113[8];
      uint64_t v85 = *(void *)v113;
      *(void *)uint32x4_t v113 = *(void *)v116;
      *(_DWORD *)&v113[8] = *(_DWORD *)&v116[8];
      *(void *)uint32x4_t v116 = v85;
      *(_DWORD *)&v116[8] = v84;
      float v35 = *(float *)v114;
      if (*(float *)v115 > *(float *)v114) {
        goto LABEL_104;
      }
LABEL_55:
      float v36 = *(float *)v116;
      if (*(float *)v116 <= v35) {
        goto LABEL_56;
      }
LABEL_105:
      int v88 = *(_DWORD *)&v114[8];
      uint64_t v89 = *(void *)v114;
      *(void *)int32x4_t v114 = *(void *)v116;
      *(_DWORD *)&v114[8] = *(_DWORD *)&v116[8];
      *(void *)uint32x4_t v116 = v89;
      *(_DWORD *)&v116[8] = v88;
      if (*(float *)&v89 > *(float *)v115)
      {
LABEL_57:
        int v37 = *(_DWORD *)&v115[8];
        uint64_t v38 = *(void *)v115;
        *(void *)int32x4_t v115 = *(void *)v116;
        *(_DWORD *)&v115[8] = *(_DWORD *)&v116[8];
        *(void *)uint32x4_t v116 = v38;
        *(_DWORD *)&v116[8] = v37;
      }
    }
    else
    {
      if (*(float *)v114 <= *(float *)v112) {
        goto LABEL_49;
      }
LABEL_98:
      int v74 = *(_DWORD *)&v112[8];
      uint64_t v75 = *(void *)v112;
      *(void *)int32x4_t v112 = *(void *)v114;
      *(_DWORD *)&v112[8] = *(_DWORD *)&v114[8];
      *(void *)int32x4_t v114 = v75;
      *(_DWORD *)&v114[8] = v74;
      float v33 = *(float *)v112;
      if (*(float *)v115 > *(float *)v112) {
        goto LABEL_99;
      }
LABEL_50:
      if (*(float *)v116 <= v33) {
        goto LABEL_51;
      }
LABEL_100:
      int v78 = *(_DWORD *)&v112[8];
      uint64_t v79 = *(void *)v112;
      *(void *)int32x4_t v112 = *(void *)v116;
      *(_DWORD *)&v112[8] = *(_DWORD *)&v116[8];
      *(void *)uint32x4_t v116 = v79;
      *(_DWORD *)&v116[8] = v78;
      float v34 = *(float *)v113;
      if (*(float *)v114 > *(float *)v113) {
        goto LABEL_101;
      }
LABEL_52:
      if (*(float *)v115 <= v34) {
        goto LABEL_53;
      }
LABEL_102:
      int v82 = *(_DWORD *)&v113[8];
      uint64_t v83 = *(void *)v113;
      *(_DWORD *)&v113[8] = *(_DWORD *)&v115[8];
      *(void *)uint32x4_t v113 = *(void *)v115;
      *(void *)int32x4_t v115 = v83;
      *(_DWORD *)&v115[8] = v82;
      if (*(float *)v116 > *(float *)v113) {
        goto LABEL_103;
      }
LABEL_54:
      float v35 = *(float *)v114;
      if (*(float *)v115 <= *(float *)v114) {
        goto LABEL_55;
      }
LABEL_104:
      int v86 = *(_DWORD *)&v114[8];
      uint64_t v87 = *(void *)v114;
      *(_DWORD *)&v114[8] = *(_DWORD *)&v115[8];
      *(void *)int32x4_t v114 = *(void *)v115;
      *(void *)int32x4_t v115 = v87;
      *(_DWORD *)&v115[8] = v86;
      float v36 = *(float *)v116;
      if (*(float *)v116 > *(float *)v114) {
        goto LABEL_105;
      }
LABEL_56:
      if (v36 > *(float *)v115) {
        goto LABEL_57;
      }
    }
  }
LABEL_58:
  int v90 = 0;
  uint64_t v91 = 0x5A00000000;
  int v92 = 0;
  uint64_t v93 = 0x5A00000000;
  int v94 = 0;
  uint64_t v95 = 0x5A00000000;
  int v96 = 0;
  uint64_t v97 = 0x5A00000000;
  int v98 = 0;
  uint64_t v99 = 0x5A00000000;
  int v100 = 0;
  uint64_t v101 = 0x5A00000000;
  int v102 = 0;
  uint64_t v103 = 0x5A00000000;
  int v104 = 0;
  uint64_t v105 = 0x5A00000000;
  if (v8 >= 1)
  {
    if (v8 < 8)
    {
      uint64_t v39 = 0;
      goto LABEL_66;
    }
    uint64_t v39 = v8 & 0xFFFFFFF8;
    BOOL v40 = (float *)&v90;
    unsigned int v41 = (const float *)v112;
    uint64_t v42 = v39;
    do
    {
      BOOL v43 = v41;
      float32x4x3_t v121 = vld3q_f32(v43);
      v43 += 12;
      float32x4x3_t v123 = vld3q_f32(v43);
      unsigned int v44 = v40 + 24;
      vst3q_f32(v40, v121);
      unsigned int v45 = v40 + 12;
      vst3q_f32(v45, v123);
      v41 += 24;
      BOOL v40 = v44;
      v42 -= 8;
    }
    while (v42);
    if (v39 != v8)
    {
LABEL_66:
      unsigned int v46 = &v90 + 3 * v39 + 1;
      BOOL v47 = &v112[12 * v39 + 4];
      uint64_t v48 = v8 - v39;
      do
      {
        *(v46 - 1) = *((_DWORD *)v47 - 1);
        uint64_t v49 = *v47;
        BOOL v47 = (void *)((char *)v47 + 12);
        *(void *)unsigned int v46 = v49;
        v46 += 3;
        --v48;
      }
      while (v48);
    }
  }
  if (v9 >= 1)
  {
    if (v9 < 8)
    {
      uint64_t v50 = 0;
      goto LABEL_74;
    }
    uint64_t v50 = v9 & 0xFFFFFFF8;
    uint64_t v51 = (float *)(&v90 + 3 * v8);
    uint64_t v52 = (const float *)v106;
    uint64_t v53 = v50;
    do
    {
      long long v54 = v52;
      float32x4x3_t v122 = vld3q_f32(v54);
      v54 += 12;
      float32x4x3_t v124 = vld3q_f32(v54);
      unint64_t v55 = v51 + 24;
      vst3q_f32(v51, v122);
      unsigned int v56 = v51 + 12;
      vst3q_f32(v56, v124);
      v52 += 24;
      uint64_t v51 = v55;
      v53 -= 8;
    }
    while (v53);
    if (v50 != v9)
    {
LABEL_74:
      unsigned __int8 v57 = &v106[12 * v50 + 4];
      uint64_t v58 = &v90 + 3 * v50 + 3 * v8 + 1;
      uint64_t v59 = v9 - v50;
      do
      {
        *(v58 - 1) = *((_DWORD *)v57 - 1);
        uint64_t v60 = *v57;
        unsigned __int8 v57 = (void *)((char *)v57 + 12);
        *(void *)uint64_t v58 = v60;
        v58 += 3;
        --v59;
      }
      while (v59);
    }
  }
  uint64_t v61 = (v8 + v9);
  uint64_t func = (uint64_t (*)(uint64_t, int *, uint64_t, uint64_t))__find_func(0x4F3FFFDF200020A0, -1585184758);
  int v63 = func(a1, &v90, v61, a2);
  if ((*v3 & 0x1F) != 0 || v3[2] > 0x3Fu)
  {
    if (QuickCodec::mask != -70947757)
    {
LABEL_85:
      QuickCodec::masint k = FunctionTable::ft ^ 0x157E9386;
      uint64_t v65 = __find_func(0xDF9FDF1FC0E04070, 824451274);
      uint64_t v66 = 0;
      while (*(unsigned __int8 *)(v65 + v66) != ((QuickCodec::mask ^ 0xC12A2DF3) / 0x9D28AF)
           || *(unsigned __int8 *)(v65 + v66 + 1) != ((QuickCodec::mask ^ 0xFBC56C53) / 0x9D28AF)
           || *(unsigned __int8 *)(v65 + v66 + 2) != ((QuickCodec::mask ^ 0xDDCAB631) / 0x9D28AF)
           || *(unsigned __int8 *)(v65 + v66 + 3) != ((QuickCodec::mask ^ 0x79E0DCBFu) / 0x9D28AF))
      {
        v66 += 4;
        if (v66 == 2400) {
          goto LABEL_92;
        }
      }
      uint64_t vars0 = v65 + v66;
      long long vars8 = 0u;
LABEL_92:
      QuickCodec::mask += 16;
    }
  }
  else
  {
    BOOL v64 = v3[3] != 212 && QuickCodec::mask == -70947757;
    if (!v64) {
      goto LABEL_85;
    }
  }
  return v63 & ~(v63 >> 31);
}

uint64_t Madusa::FindPeaks::_FindHighestCandidatesSplit(uint64_t a1, uint64_t a2, int *a3)
{
  if ((*v3 & 0x1F) != 0 || v3[2] > 0x3Fu)
  {
    int v4 = QuickCodec::mask;
    if (QuickCodec::mask == -70947757) {
      return Madusa::FindPeaks::FindHighestCandidatesSplit(a1, a2, a3);
    }
LABEL_7:
    QuickCodec::masint k = v4 + 1;
    return Madusa::FindPeaks::FindHighestCandidatesSplit(a1, a2, a3);
  }
  int v6 = 727176 * v3[3];
  int v4 = QuickCodec::mask;
  if ((v6 ^ 0x93050A0 | v6 & 0x93050A0) - (v6 + 154161312) + ~(v6 ^ 0x93050A0 | ~(v6 | 0x93050A0)) == ~(~(~(~(v6 | 0x9005000) | v6 & 0x9005000) | 0x3000A0) | ~(~(v6 | 0x9005000) | v6 & 0x9005000) & 0x3000A0)
    || QuickCodec::mask != -70947757)
  {
    goto LABEL_7;
  }
  return Madusa::FindPeaks::FindHighestCandidatesSplit(a1, a2, a3);
}

void Madusa::AffineTransform::CreateTransform(uint64_t a1, int a2, uint64_t a3)
{
  if (a2 < 1) {
    goto LABEL_14;
  }
  uint64_t v6 = a2 >= 8 ? 8 : a2;
  int v7 = (float *)(a1 + 8);
  int v8 = (float *)(a3 + 8);
  do
  {
    int v9 = (int)*v7;
    float v10 = truncf(*v7);
    if (v9 >= 89) {
      int v9 = 89;
    }
    int v11 = (float *)((char *)&Madusa::AffineTransform::mLpSpaceScale + 4 * (v9 & ~(v9 >> 31)));
    float v12 = *v11 + (float)((float)(*v7 - v10) * (float)(v11[1] - *v11));
    float v13 = *(v7 - 1);
    float v14 = v13 + -94.0;
    if (v13 < 94.0) {
      float v14 = *(v7 - 1);
    }
    if (v14 < 0.0) {
      float v14 = v14 + 94.0;
    }
    v8[2] = *(v7 - 2);
    __float2 v16 = __sincosf_stret(v14 * 0.016711);
    *(v8 - 2) = v16.__cosval * v12;
    *(v8 - 1) = v16.__sinval * v12;
    *int v8 = -(float)(v16.__sinval * v12);
    v8[1] = v16.__cosval * v12;
    v7 += 3;
    v8 += 232;
    --v6;
  }
  while (v6);
  if (a2 <= 7)
  {
LABEL_14:
    uint64_t v17 = (a2 + 1);
    uint64_t v18 = 9 - v17;
    if ((unint64_t)(9 - v17) < 2 || (unint64_t v19 = 8 - v17, -2 - a2 < v19) || HIDWORD(v19))
    {
      unint64_t v20 = a2;
    }
    else
    {
      unint64_t v20 = (v18 & 0xFFFFFFFFFFFFFFFELL) + a2;
      uint64_t v21 = a3 + 928 * a2;
      v15.i32[1] = 0;
      unint64_t v22 = v18 & 0xFFFFFFFFFFFFFFFELL;
      do
      {
        *(_DWORD *)(v21 + 16) = 0;
        *(_DWORD *)(v21 + 944) = 0;
        *(_OWORD *)uint64_t v21 = xmmword_10006DB80;
        *(_OWORD *)(v21 + 928) = xmmword_10006DB80;
        v21 += 1856;
        v22 -= 2;
      }
      while (v22);
      if (v18 == (v18 & 0xFFFFFFFFFFFFFFFELL)) {
        goto LABEL_25;
      }
    }
    uint64_t v23 = (_DWORD *)(a3 + 928 * v20 + 16);
    unint64_t v24 = v20 + 1;
    v15.i32[1] = 0;
    do
    {
      _DWORD *v23 = 0;
      *((_OWORD *)v23 - 1) = xmmword_10006DB80;
      v23 += 232;
    }
    while (v24++ != 8);
  }
LABEL_25:
  v15.i8[4] = v3[3];
  v15.i32[0] = *v3 | 0xFFFFFFE0;
  *(int8x8_t *)v26.i8 = vand_s8(v15, (int8x8_t)0xFF000000FFLL);
  v26.i64[1] = v26.i64[0];
  float32x4_t v27 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v26, (int32x4_t)xmmword_10006DB90));
  v28.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_10006DBA0, v27)).u32[0];
  v28.i32[1] = vmovn_s32(vcgtq_f32(v27, (float32x4_t)xmmword_10006DBA0)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v28, 0xFuLL))) & ((v3[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    QuickCodec::masint k = FunctionTable::ft[0] ^ 0x157E9386;
    uint64_t func = __find_func(0xDF9FDF1FC0E04070, 824451274);
    uint64_t v30 = 0;
    while (*(unsigned __int8 *)(func + v30) != ((QuickCodec::mask ^ 0xC12A2DF3) / 0x9D28AF)
         || *(unsigned __int8 *)(func + v30 + 1) != ((QuickCodec::mask ^ 0xFBC56C53) / 0x9D28AF)
         || *(unsigned __int8 *)(func + v30 + 2) != ((QuickCodec::mask ^ 0xDDCAB631) / 0x9D28AF)
         || *(unsigned __int8 *)(func + v30 + 3) != ((QuickCodec::mask ^ 0x79E0DCBFu) / 0x9D28AF))
    {
      v30 += 4;
      if (v30 == 2400) {
        goto LABEL_34;
      }
    }
    uint64_t vars0 = func + v30;
    long long vars8 = 0u;
LABEL_34:
    QuickCodec::mask += 16;
  }
}

double Madusa::ImageProperties::ImageProperties(Madusa::ImageProperties *this)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((unsigned char *)this + 16) = 1;
  *(void *)((char *)this + 28) = 0;
  *(void *)((char *)this + 20) = 0;
  *((_WORD *)this + 18) = 0;
  *(_OWORD *)((char *)this + 40) = xmmword_10006DD20;
  *((_DWORD *)this + 14) = 0;
  double result = 0.0;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((void *)this + 12) = 0x64FFFFFFFFLL;
  *(void *)&long long v2 = 0x100000001;
  *((void *)&v2 + 1) = 0x100000001;
  *(_OWORD *)((char *)this + 184) = v2;
  *((void *)this + 25) = 0;
  *((void *)this + 26) = -1;
  *((void *)this + 27) = -1;
  *((_DWORD *)this + 56) = -1;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  return result;
}

uint64_t Madusa::ImageProperties::RecordImageDetails(Madusa::ImageProperties *this, int a2, int a3)
{
  char v14 = *((unsigned char *)this + 16);
  int v3 = *((_DWORD *)this + 24);
  int v9 = *((_DWORD *)this + 25);
  int v4 = *((_DWORD *)this + 11);
  BOOL v13 = v4 == 16;
  BOOL v15 = (*((_DWORD *)this + 13) - 1) < 2;
  char v16 = *((unsigned char *)this + 37);
  long long v8 = *(_OWORD *)this;
  int v11 = v3;
  int v12 = v4;
  int8x16_t v10 = vextq_s8(*(int8x16_t *)((char *)this + 184), *(int8x16_t *)((char *)this + 184), 8uLL);
  v7[0] = a2;
  v7[1] = a3;
  long long v17 = *((_OWORD *)this + 13);
  int v18 = *((_DWORD *)this + 56);
  ReadstatsHandle = Madusa::System::GetReadstatsHandle(this);
  return ((uint64_t (*)(uint64_t (***)(), _DWORD *))(*ReadstatsHandle)[3])(ReadstatsHandle, v7);
}

uint64_t Madusa::ImageProperties::GetResolutionBucket(Madusa::ImageProperties *this)
{
  return *((unsigned int *)this + 25);
}

_DWORD *Madusa::ImageProperties::GetDownsampleRatios(_DWORD *this, Madusa::Ratio *a2, Madusa::Ratio *a3)
{
  *(_DWORD *)a2 = this[46];
  *((_DWORD *)a2 + 1) = this[47];
  *(_DWORD *)a3 = this[48];
  *((_DWORD *)a3 + 1) = this[49];
  return this;
}

uint64_t Madusa::ImageProperties::SetBasicProperties(uint64_t a1, char a2, char a3, int a4, int a5, int a6, int a7, int a8, double a9, double a10, int a11, uint64_t a12, int a13, signed int a14)
{
  *(double *)a1 = a9;
  *(double *)(a1 + 8) = a10;
  Madusa::ImageProperties::SetResolutionBucket((Madusa::ImageProperties *)a1);
  int v20 = *(_DWORD *)(a1 + 28);
  if (v20 < 0) {
    int v20 = -v20;
  }
  if (a14 >= 0) {
    unsigned int v21 = a14;
  }
  else {
    unsigned int v21 = -a14;
  }
  *(void *)(a1 + 88) = v20 * (unint64_t)v21;
  *(unsigned char *)(a1 + 37) = a3;
  *(unsigned char *)(a1 + 36) = a2;
  *(_DWORD *)(a1 + 96) = a4;
  *(_DWORD *)(a1 + 52) = a6;
  *(_DWORD *)(a1 + 56) = a7;
  *(_DWORD *)(a1 + 44) = a5;
  *(_DWORD *)(a1 + 48) = a11;
  *(_DWORD *)(a1 + 40) = a8;
  long long v22 = *(_OWORD *)(a12 + 16);
  v26[0] = *(_OWORD *)a12;
  v26[1] = v22;
  uint64_t v27 = *(void *)(a12 + 32);
  return Madusa::ImageProperties::SetPixelData(a1, v26, a13, a14);
}

uint64_t Madusa::ImageProperties::SetPixelData(uint64_t result, long long *a2, int a3, unsigned int a4)
{
  int v4 = (unint64_t *)(result + 104);
  long long v5 = *a2;
  long long v6 = a2[1];
  *(void *)(result + 136) = *((void *)a2 + 4);
  *(_OWORD *)(result + 120) = v6;
  *(_OWORD *)(result + 104) = v5;
  if (a3 >= 0) {
    int v7 = a4;
  }
  else {
    int v7 = a3;
  }
  if ((a4 & 0x80000000) != 0)
  {
    uint64_t v10 = -v7;
    unint64_t v11 = *v4;
    if (!v11) {
      goto LABEL_18;
    }
    unint64_t v12 = v11 + v10;
    unint64_t v13 = *(void *)(result + 88);
    unint64_t v14 = v11 + v10 - v13;
    if (v11 + v10 < v13) {
      unint64_t v14 = 0;
    }
    BOOL v15 = v12 >= v11;
    unint64_t v11 = v12 < v11 ? 0 : v14;
    if (v15 && v12 >= v13) {
LABEL_18:
    }
      *(void *)(result + 144) = v11;
    unint64_t v17 = *(void *)(result + 112);
    if (!v17) {
      goto LABEL_28;
    }
    unint64_t v18 = v17 + v10;
    unint64_t v19 = *(void *)(result + 88);
    unint64_t v20 = v17 + v10 - v19;
    if (v17 + v10 < v19) {
      unint64_t v20 = 0;
    }
    BOOL v21 = v18 >= v17;
    unint64_t v17 = v18 < v17 ? 0 : v20;
    if (v21 && v18 >= v19) {
LABEL_28:
    }
      *(void *)(result + 152) = v17;
    unint64_t v22 = *(void *)(result + 120);
    if (!v22) {
      goto LABEL_38;
    }
    unint64_t v23 = v22 + v10;
    unint64_t v24 = *(void *)(result + 88);
    unint64_t v25 = v22 + v10 - v24;
    if (v22 + v10 < v24) {
      unint64_t v25 = 0;
    }
    BOOL v26 = v23 >= v22;
    unint64_t v22 = v23 < v22 ? 0 : v25;
    if (v26 && v23 >= v24) {
LABEL_38:
    }
      *(void *)(result + 160) = v22;
    unint64_t v27 = *(void *)(result + 128);
    if (!v27) {
      goto LABEL_48;
    }
    unint64_t v28 = v27 + v10;
    unint64_t v29 = *(void *)(result + 88);
    unint64_t v30 = v27 + v10 - v29;
    if (v27 + v10 < v29) {
      unint64_t v30 = 0;
    }
    BOOL v31 = v28 >= v27;
    unint64_t v27 = v28 < v27 ? 0 : v30;
    if (v31 && v28 >= v29) {
LABEL_48:
    }
      *(void *)(result + 168) = v27;
    unint64_t v32 = *(void *)(result + 136);
    if (v32)
    {
      unint64_t v33 = v32 + v10;
      unint64_t v34 = *(void *)(result + 88);
      BOOL v15 = v32 + v10 >= v34;
      unint64_t v35 = v32 + v10 - v34;
      if (!v15) {
        unint64_t v35 = 0;
      }
      if (v33 >= v32 && v33 >= v34)
      {
        *(void *)(result + 176) = v35;
        *(_DWORD *)(result + 20) = a3;
        *(_DWORD *)(result + 24) = a4;
        return result;
      }
      goto LABEL_93;
    }
    goto LABEL_94;
  }
  unint64_t v8 = *v4;
  if ((a3 & 0x80000000) == 0)
  {
    *(void *)(result + 144) = v8;
    *(_OWORD *)(result + 152) = *(_OWORD *)(result + 112);
    uint64_t v9 = *(void *)(result + 136);
    *(void *)(result + 168) = *(void *)(result + 128);
    *(void *)(result + 176) = v9;
    *(_DWORD *)(result + 20) = a3;
    *(_DWORD *)(result + 24) = a4;
    return result;
  }
  uint64_t v36 = -a3;
  if (!v8) {
    goto LABEL_62;
  }
  BOOL v15 = __CFADD__(v8, v36);
  unint64_t v37 = v8 + v36;
  if (!v15)
  {
    uint64_t v38 = v37 >= a4 ? a4 : 0;
    if (v37 >= a4)
    {
      unint64_t v8 = v37 - v38;
LABEL_62:
      *(void *)(result + 144) = v8;
    }
  }
  uint64_t v39 = *(void *)(result + 112);
  if (!v39)
  {
LABEL_70:
    *(void *)(result + 152) = v39;
    goto LABEL_71;
  }
  BOOL v15 = __CFADD__(v39, v36);
  unint64_t v40 = v39 + v36;
  if (!v15)
  {
    uint64_t v41 = v40 >= a4 ? a4 : 0;
    if (v40 >= a4)
    {
      uint64_t v39 = v40 - v41;
      goto LABEL_70;
    }
  }
LABEL_71:
  uint64_t v42 = *(void *)(result + 120);
  if (!v42)
  {
LABEL_78:
    *(void *)(result + 160) = v42;
    goto LABEL_79;
  }
  BOOL v15 = __CFADD__(v42, v36);
  unint64_t v43 = v42 + v36;
  if (!v15)
  {
    uint64_t v44 = v43 >= a4 ? a4 : 0;
    if (v43 >= a4)
    {
      uint64_t v42 = v43 - v44;
      goto LABEL_78;
    }
  }
LABEL_79:
  uint64_t v45 = *(void *)(result + 128);
  if (!v45)
  {
LABEL_86:
    *(void *)(result + 168) = v45;
    goto LABEL_87;
  }
  BOOL v15 = __CFADD__(v45, v36);
  unint64_t v46 = v45 + v36;
  if (!v15)
  {
    uint64_t v47 = v46 >= a4 ? a4 : 0;
    if (v46 >= a4)
    {
      uint64_t v45 = v46 - v47;
      goto LABEL_86;
    }
  }
LABEL_87:
  uint64_t v48 = *(void *)(result + 136);
  if (!v48)
  {
LABEL_94:
    *(void *)(result + 176) = 0;
    *(_DWORD *)(result + 20) = a3;
    *(_DWORD *)(result + 24) = a4;
    return result;
  }
  BOOL v15 = __CFADD__(v48, v36);
  unint64_t v49 = v48 + v36;
  if (v15 || (v49 >= a4 ? (uint64_t v50 = a4) : (uint64_t v50 = 0), v49 < a4))
  {
LABEL_93:
    *(_DWORD *)(result + 20) = a3;
    *(_DWORD *)(result + 24) = a4;
    return result;
  }
  *(void *)(result + 176) = v49 - v50;
  *(_DWORD *)(result + 20) = a3;
  *(_DWORD *)(result + 24) = a4;
  return result;
}

uint64_t Madusa::ImageProperties::SetPaletteData(uint64_t this, void *a2)
{
  *(void *)(this + 200) = a2;
  return this;
}

uint64_t Madusa::ImageProperties::SetColorComponent(uint64_t result, unsigned int a2, int a3)
{
  if (a2 <= 4) {
    *(_DWORD *)(result + 4 * a2 + 208) = a3;
  }
  return result;
}

__n128 Madusa::ImageProperties::UpdatePixelData(uint64_t a1, uint64_t a2, int a3, int a4)
{
  __n128 result = *(__n128 *)a2;
  long long v5 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 136) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 120) = v5;
  *(__n128 *)(a1 + 104) = result;
  *(_DWORD *)(a1 + 20) = a3;
  *(_DWORD *)(a1 + 24) = a4;
  return result;
}

__n128 Madusa::ImageProperties::GetPixelData@<Q0>(Madusa::ImageProperties *this@<X0>, uint64_t a2@<X8>)
{
  __n128 result = *(__n128 *)((char *)this + 104);
  long long v3 = *(_OWORD *)((char *)this + 120);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  *(void *)(a2 + 32) = *((void *)this + 17);
  return result;
}

__n128 Madusa::ImageProperties::GetPixelDataBaseAddrs@<Q0>(__n128 *this@<X0>, __n128 *a2@<X8>)
{
  __n128 result = this[9];
  __n128 v3 = this[10];
  *a2 = result;
  a2[1] = v3;
  a2[2].n128_u64[0] = this[11].n128_u64[0];
  return result;
}

double Madusa::ImageProperties::SetResolutionBucket(Madusa::ImageProperties *this)
{
  double v3 = *(double *)this;
  *(void *)&long long v2 = *((void *)this + 1);
  unsigned int v4 = (int)(fmin(*(double *)&v2, *(double *)this) + 0.5);
  if ((int)v4 >= 120)
  {
    if (v4 >= 0x91)
    {
      if (v4 >= 0xB4)
      {
        if (v4 >= 0xF0)
        {
          if (v4 >= 0x10E)
          {
            if (v4 >= 0x154)
            {
              if (v4 >= 0x177)
              {
                if (v4 >= 0x1E0)
                {
                  if (v4 >= 0x24E) {
                    int v5 = 100 * ((int)(v4 + 10) / 100);
                  }
                  else {
                    int v5 = 500;
                  }
                }
                else
                {
                  int v5 = 400;
                }
              }
              else
              {
                int v5 = 350;
              }
            }
            else
            {
              int v5 = 300;
            }
          }
          else
          {
            int v5 = 250;
          }
        }
        else
        {
          int v5 = 200;
        }
      }
      else
      {
        int v5 = 150;
      }
    }
    else
    {
      int v5 = 125;
    }
  }
  else
  {
    int v5 = 100;
  }
  *((_DWORD *)this + 25) = v5;
  if (*(double *)&v2 == v3)
  {
    if (v5 > 350)
    {
      v14[0] = v5;
      v14[1] = 300;
      unint64_t v10 = Madusa::Ratio::ReduceFraction((Madusa::Ratio *)v14);
      *((void *)this + 23) = v10;
      *((void *)this + 24) = v10;
    }
    else
    {
      *(void *)&long long v2 = 0x100000001;
      *((void *)&v2 + 1) = 0x100000001;
      *(_OWORD *)((char *)this + 184) = v2;
    }
  }
  else
  {
    double v6 = v3 + 0.5;
    double v7 = *(double *)&v2 + 0.5;
    if (v5 < 351)
    {
      if (v3 >= *(double *)&v2)
      {
        int v11 = (int)v6;
        if ((int)v6 <= 1) {
          int v11 = 1;
        }
        int v12 = (int)v7;
        if ((int)v7 <= 1) {
          int v12 = 1;
        }
        *((_DWORD *)this + 46) = v11;
        *((_DWORD *)this + 47) = v12;
        *(void *)&long long v2 = 0x100000001;
        *((void *)this + 24) = 0x100000001;
      }
      else
      {
        *(void *)&long long v2 = 0x100000001;
        *((void *)this + 23) = 0x100000001;
        int v8 = (int)v7;
        if ((int)v7 <= 1) {
          int v8 = 1;
        }
        int v9 = (int)v6;
        if ((int)v6 <= 1) {
          int v9 = 1;
        }
        *((_DWORD *)this + 48) = v8;
        *((_DWORD *)this + 49) = v9;
      }
    }
    else
    {
      *((_DWORD *)this + 46) = (int)v6;
      *((_DWORD *)this + 47) = 300;
      *((_DWORD *)this + 48) = (int)v7;
      *((_DWORD *)this + 49) = 300;
    }
  }
  return *(double *)&v2;
}

uint64_t Madusa::ImageProperties::SetDimensions(uint64_t this, int a2, int a3)
{
  *(_DWORD *)(this + 28) = a2;
  *(_DWORD *)(this + 32) = a3;
  return this;
}

uint64_t Madusa::ImageProperties::GetImagePlaneSize(Madusa::ImageProperties *this)
{
  return (uint64_t)this + 88;
}

uint64_t Madusa::ImageProperties::SetOffset(uint64_t this, double a2, double a3)
{
  *(double *)(this + 64) = a2;
  *(double *)(this + 72) = a3;
  return this;
}

uint64_t Madusa::ImageProperties::IsInverted(Madusa::ImageProperties *this)
{
  return *((unsigned __int8 *)this + 37);
}

uint64_t Madusa::ImageProperties::GetBounds(Madusa::ImageProperties *this)
{
  return 0;
}

int64x2_t Madusa::ImageProperties::GetSafeBounds@<Q0>(Madusa::ImageProperties *this@<X0>, int64x2_t *a2@<X8>)
{
  unint64_t v2 = *((unsigned int *)this + 7) | (unint64_t)&_mh_execute_header;
  int64x2_t result = vdupq_n_s64((unint64_t)&_mh_execute_header);
  unint64_t v4 = *((unsigned int *)this + 8) | (unint64_t)&_mh_execute_header;
  *a2 = result;
  a2[1].i64[0] = v2;
  a2[1].i64[1] = v4;
  return result;
}

double Madusa::ImageProperties::GetOffsetBounds(Madusa::ImageProperties *this)
{
  return *((double *)this + 9);
}

unint64_t Madusa::ImageProperties::GetIntegerOffsetBounds(Madusa::ImageProperties *this)
{
  return (int)(*((double *)this + 9) + 0.5) | ((unint64_t)(int)(*((double *)this + 8)
                                                                                                 + 0.5) << 32);
}

uint64_t Madusa::ImageProperties::GetXStride(Madusa::ImageProperties *this)
{
  return (uint64_t)this + 20;
}

uint64_t Madusa::ImageProperties::GetYStride(Madusa::ImageProperties *this)
{
  return (uint64_t)this + 24;
}

uint64_t Madusa::ImageProperties::GetColorModel(Madusa::ImageProperties *this)
{
  return (uint64_t)this + 96;
}

uint64_t Madusa::ImageProperties::GetDataType(Madusa::ImageProperties *this)
{
  return (uint64_t)this + 52;
}

uint64_t Madusa::ImageProperties::GetBitsPerPixelPerColor(Madusa::ImageProperties *this)
{
  return (uint64_t)this + 44;
}

double Madusa::ImageProperties::SwapWidthAndHeight(Madusa::ImageProperties *this)
{
  *(int32x2_t *)((char *)this + 28) = vrev64_s32(*(int32x2_t *)((char *)this + 28));
  *(int8x16_t *)this = vextq_s8(*(int8x16_t *)this, *(int8x16_t *)this, 8uLL);
  return Madusa::ImageProperties::SetResolutionBucket(this);
}

uint64_t Madusa::ImageProperties::ConvertBitsPerPixel(Madusa::ImageProperties *this)
{
  uint64_t result = 0xFFFFFFFFLL;
  switch((int)this)
  {
    case 1:
    case 2:
    case 4:
    case 8:
    case 16:
    case 32:
      uint64_t result = (uint64_t)this;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t Madusa::ImageProperties::CheckForOptimizedImagePipe(uint64_t this)
{
  *(unsigned char *)(this + 16) = 0;
  int v1 = *(_DWORD *)(this + 52);
  if ((v1 - 1) >= 2)
  {
    if (!v1)
    {
      int v5 = *(_DWORD *)(this + 44);
      if (v5 == 8 || v5 == 16)
      {
LABEL_4:
        int v3 = *(_DWORD *)(this + 96);
        int v4 = v3 - 2;
        if ((v3 - 2) >= 8) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
    }
  }
  else
  {
    int v2 = *(_DWORD *)(this + 44);
    if (v2 == 16 || v2 == 32) {
      goto LABEL_4;
    }
  }
  *(unsigned char *)(this + 16) = 1;
  int v3 = *(_DWORD *)(this + 96);
  int v4 = v3 - 2;
  if ((v3 - 2) >= 8)
  {
LABEL_13:
    unsigned int v7 = 0;
    *(unsigned char *)(this + 16) = 1;
    goto LABEL_15;
  }
LABEL_12:
  if (((0x87u >> v4) & 1) == 0) {
    goto LABEL_13;
  }
  unsigned int v7 = dword_10006DD38[v4];
LABEL_15:
  uint64_t v8 = *(unsigned __int8 *)(this + 36);
  unint64_t v9 = v7 + v8;
  int v10 = *(_DWORD *)(this + 44) / 8;
  if (*(_DWORD *)(this + 20) != v10 * v9) {
    *(unsigned char *)(this + 16) = 1;
  }
  if (v8)
  {
    unint64_t v11 = 0;
    unsigned int v12 = -1;
    do
    {
      if (!*(_DWORD *)(this + 208 + 4 * v11)) {
        unsigned int v12 = v11;
      }
      ++v11;
    }
    while (v11 < v9 && (v12 & 0x80000000) != 0);
    if ((v12 & 0x80000000) != 0)
    {
      unsigned int v12 = 0;
      *(unsigned char *)(this + 16) = 1;
    }
    if (v9 <= 1) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = v9;
    }
    unint64_t v14 = (void *)(this + 104);
    uint64_t v15 = v12;
    do
    {
      if (v15 && *v14 >= *(void *)(this + 104 + 8 * v12)) {
        *(unsigned char *)(this + 16) = 1;
      }
      --v15;
      ++v14;
      --v13;
    }
    while (v13);
  }
  if (v3 != 4)
  {
    if (v3 != 9) {
      goto LABEL_71;
    }
    if (v9)
    {
      uint64_t v16 = 0;
      unsigned int v17 = -1;
      LODWORD(v18) = v7 + v8;
      do
      {
        int v19 = *(_DWORD *)(this + 208 + 4 * v16);
        if (v19 == 18) {
          unsigned int v17 = v16;
        }
        if (v19) {
          uint64_t v18 = v18;
        }
        else {
          uint64_t v18 = v16;
        }
        ++v16;
      }
      while (v9 != v16);
      if ((v17 & 0x80000000) == 0)
      {
LABEL_57:
        uint64_t v24 = v7 + v8;
        unint64_t v25 = (void *)(this + 104);
        uint64_t v26 = v17;
        do
        {
          if (v26 && v18 && *v25 >= *(void *)(this + 104 + 8 * v17)) {
            *(unsigned char *)(this + 16) = 1;
          }
          --v26;
          --v18;
          ++v25;
          --v24;
        }
        while (v24);
        goto LABEL_71;
      }
    }
    else
    {
      uint64_t v18 = 0;
    }
    unsigned int v17 = 0;
    *(unsigned char *)(this + 16) = 1;
    if (!v9) {
      return this;
    }
    goto LABEL_57;
  }
  if (!v9)
  {
    uint64_t v22 = 0;
    goto LABEL_64;
  }
  uint64_t v20 = 0;
  unsigned int v21 = -1;
  LODWORD(v22) = v7 + v8;
  do
  {
    int v23 = *(_DWORD *)(this + 208 + 4 * v20);
    if (v23 == 9) {
      unsigned int v21 = v20;
    }
    if (v23) {
      uint64_t v22 = v22;
    }
    else {
      uint64_t v22 = v20;
    }
    ++v20;
  }
  while (v9 != v20);
  if ((v21 & 0x80000000) != 0)
  {
LABEL_64:
    unsigned int v21 = 0;
    *(unsigned char *)(this + 16) = 1;
    if (!v9) {
      return this;
    }
  }
  uint64_t v27 = v7 + v8;
  unint64_t v28 = (void *)(this + 104);
  uint64_t v29 = v21;
  do
  {
    if (v29 && v22 && *v28 >= *(void *)(this + 104 + 8 * v21)) {
      *(unsigned char *)(this + 16) = 1;
    }
    --v29;
    --v22;
    ++v28;
    --v27;
  }
  while (v27);
LABEL_71:
  long long v30 = *(_OWORD *)(this + 120);
  long long v51 = *(_OWORD *)(this + 104);
  long long v52 = v30;
  uint64_t v53 = *(void *)(this + 136);
  if (v9 < 2) {
    return this;
  }
  uint64_t v31 = v7 + v8;
  do
  {
    if ((unint64_t)v31 < 2) {
      break;
    }
    uint64_t v33 = 0;
    uint64_t v34 = v31 - 1;
    unint64_t v35 = v51;
    do
    {
      while (1)
      {
        uint64_t v36 = (char *)&v51 + 8 * v33;
        unint64_t v37 = *((void *)v36 + 1);
        if (v35 <= v37) {
          break;
        }
        *((void *)&v51 + v33) = v37;
        *((void *)v36 + 1) = v35;
        if (++v33 >= v34) {
          goto LABEL_73;
        }
      }
      unint64_t v35 = *((void *)v36 + 1);
      ++v33;
    }
    while (v33 < v34);
LABEL_73:
    ;
  }
  while (v31-- >= 3);
  uint64_t v38 = v51;
  unint64_t v39 = v7 + v8 - 1;
  if (v39 < 4)
  {
    unint64_t v40 = 1;
    goto LABEL_89;
  }
  int8x16_t v41 = (int8x16_t)vdupq_n_s64(v51);
  unint64_t v40 = v39 & 0xFFFFFFFFFFFFFFFCLL | 1;
  int64x2_t v42 = vdupq_n_s64(v10);
  unint64_t v43 = (int64x2_t *)((char *)&v52 + 8);
  unint64_t v44 = v39 & 0xFFFFFFFFFFFFFFFCLL;
  do
  {
    int64x2_t v45 = v43[-1];
    int64x2_t v46 = (int64x2_t)vextq_s8(v41, (int8x16_t)v45, 8uLL);
    int8x16_t v41 = *(int8x16_t *)v43;
    *(int32x2_t *)v45.i8 = vmovn_s64((int64x2_t)vornq_s8(vmvnq_s8((int8x16_t)vceqq_s64(vsubq_s64(v45, v46), v42)), (int8x16_t)vceqq_s64(vsubq_s64(*v43, (int64x2_t)vextq_s8((int8x16_t)v45, *(int8x16_t *)v43, 8uLL)), v42)));
    if (vorr_s8(*(int8x8_t *)v45.i8, (int8x8_t)vdup_lane_s32(*(int32x2_t *)v45.i8, 1)).u8[0]) {
      *(unsigned char *)(this + 16) = 1;
    }
    v43 += 2;
    v44 -= 4;
  }
  while (v44);
  if (v39 != (v39 & 0xFFFFFFFFFFFFFFFCLL))
  {
    uint64_t v38 = v41.i64[1];
LABEL_89:
    uint64_t v47 = (uint64_t *)&v51 + v40;
    unint64_t v48 = v7 + v8 - v40;
    do
    {
      uint64_t v50 = *v47++;
      uint64_t v49 = v50;
      if (v50 - v38 != v10) {
        *(unsigned char *)(this + 16) = 1;
      }
      uint64_t v38 = v49;
      --v48;
    }
    while (v48);
  }
  return this;
}

BOOL Madusa::ImageProperties::ShouldDownsample(Madusa::ImageProperties *this)
{
  double Ratio = Madusa::Ratio::GetRatio((Madusa::ImageProperties *)((char *)this + 184));
  if (*(float *)&Ratio > 1.0) {
    return 1;
  }
  double v4 = Madusa::Ratio::GetRatio((Madusa::ImageProperties *)((char *)this + 192));
  return *(float *)&v4 > 1.0;
}

uint64_t Madusa::ImageProperties::HasValidColorComponents(Madusa::ImageProperties *this)
{
  uint64_t v1 = *((int *)this + 24);
  if v1 <= 9 && ((0x2FFu >> v1))
  {
    uint64_t v4 = qword_10006DD58[v1];
    int v5 = (void *)((char *)this + 144);
    char v2 = 1;
    do
    {
      if (!*(v5 - 5) || !*v5) {
        char v2 = 0;
      }
      ++v5;
      --v4;
    }
    while (v4);
  }
  else
  {
    char v2 = 1;
  }
  return v2 & 1;
}

uint64_t Madusa::ImageProperties::CanonicalizeColorComponents(uint64_t this)
{
  switch(*(_DWORD *)(this + 96))
  {
    case 0:
      if (*(_DWORD *)(this + 208) == 1) {
        goto LABEL_35;
      }
      if (*(_DWORD *)(this + 212) == 1) {
        goto LABEL_82;
      }
      if (*(_DWORD *)(this + 216) == 1)
      {
        uint64_t v2 = *(void *)(this + 120);
        goto LABEL_407;
      }
      if (*(_DWORD *)(this + 220) == 1)
      {
        uint64_t v2 = *(void *)(this + 128);
        if (*(_DWORD *)(this + 216) == 1) {
          goto LABEL_407;
        }
      }
      else if (*(_DWORD *)(this + 224) == 1)
      {
        uint64_t v2 = *(void *)(this + 136);
        if (*(_DWORD *)(this + 216) == 1) {
          goto LABEL_407;
        }
      }
      else
      {
        uint64_t v2 = 0;
        if (*(_DWORD *)(this + 216) == 1) {
          goto LABEL_407;
        }
      }
      if (*(_DWORD *)(this + 220) == 1) {
        goto LABEL_409;
      }
      if (*(_DWORD *)(this + 224) == 1) {
        goto LABEL_271;
      }
      goto LABEL_350;
    case 1:
      if (*(_DWORD *)(this + 208) == 2) {
        goto LABEL_35;
      }
      if (*(_DWORD *)(this + 212) == 2) {
        goto LABEL_82;
      }
      if (*(_DWORD *)(this + 216) == 2)
      {
        uint64_t v2 = *(void *)(this + 120);
        goto LABEL_407;
      }
      if (*(_DWORD *)(this + 220) == 2)
      {
        uint64_t v2 = *(void *)(this + 128);
        if (*(_DWORD *)(this + 216) == 2) {
          goto LABEL_407;
        }
      }
      else if (*(_DWORD *)(this + 224) == 2)
      {
        uint64_t v2 = *(void *)(this + 136);
        if (*(_DWORD *)(this + 216) == 2) {
          goto LABEL_407;
        }
      }
      else
      {
        uint64_t v2 = 0;
        if (*(_DWORD *)(this + 216) == 2) {
          goto LABEL_407;
        }
      }
      if (*(_DWORD *)(this + 220) == 2) {
        goto LABEL_409;
      }
      if (*(_DWORD *)(this + 224) != 2) {
        goto LABEL_350;
      }
      goto LABEL_271;
    case 2:
      int v3 = *(_DWORD *)(this + 208);
      if (v3 == 3)
      {
        uint64_t v4 = *(void *)(this + 104);
        goto LABEL_46;
      }
      if (*(_DWORD *)(this + 212) == 3)
      {
        uint64_t v4 = *(void *)(this + 112);
        if (v3 != 4) {
          goto LABEL_46;
        }
LABEL_16:
        uint64_t v5 = *(void *)(this + 104);
        goto LABEL_48;
      }
      if (*(_DWORD *)(this + 216) == 3)
      {
        uint64_t v4 = *(void *)(this + 120);
        if (v3 == 4) {
          goto LABEL_16;
        }
      }
      else if (*(_DWORD *)(this + 220) == 3)
      {
        uint64_t v4 = *(void *)(this + 128);
        if (v3 == 4) {
          goto LABEL_16;
        }
      }
      else if (*(_DWORD *)(this + 224) == 3)
      {
        uint64_t v4 = *(void *)(this + 136);
        if (v3 == 4) {
          goto LABEL_16;
        }
      }
      else
      {
        uint64_t v4 = 0;
        if (v3 == 4) {
          goto LABEL_16;
        }
      }
LABEL_46:
      if (*(_DWORD *)(this + 212) == 4)
      {
        uint64_t v5 = *(void *)(this + 112);
        if (v3 != 5) {
          goto LABEL_48;
        }
LABEL_17:
        uint64_t v6 = *(void *)(this + 104);
        goto LABEL_50;
      }
      if (*(_DWORD *)(this + 216) == 4)
      {
        uint64_t v5 = *(void *)(this + 120);
        if (v3 == 5) {
          goto LABEL_17;
        }
      }
      else if (*(_DWORD *)(this + 220) == 4)
      {
        uint64_t v5 = *(void *)(this + 128);
        if (v3 == 5) {
          goto LABEL_17;
        }
      }
      else if (*(_DWORD *)(this + 224) == 4)
      {
        uint64_t v5 = *(void *)(this + 136);
        if (v3 == 5) {
          goto LABEL_17;
        }
      }
      else
      {
        uint64_t v5 = 0;
        if (v3 == 5) {
          goto LABEL_17;
        }
      }
LABEL_48:
      if (*(_DWORD *)(this + 212) == 5)
      {
        uint64_t v6 = *(void *)(this + 112);
        if (v3 != 3) {
          goto LABEL_50;
        }
LABEL_18:
        uint64_t v7 = *(void *)(this + 144);
        goto LABEL_52;
      }
      if (*(_DWORD *)(this + 216) == 5)
      {
        uint64_t v6 = *(void *)(this + 120);
        if (v3 == 3) {
          goto LABEL_18;
        }
      }
      else if (*(_DWORD *)(this + 220) == 5)
      {
        uint64_t v6 = *(void *)(this + 128);
        if (v3 == 3) {
          goto LABEL_18;
        }
      }
      else if (*(_DWORD *)(this + 224) == 5)
      {
        uint64_t v6 = *(void *)(this + 136);
        if (v3 == 3) {
          goto LABEL_18;
        }
      }
      else
      {
        uint64_t v6 = 0;
        if (v3 == 3) {
          goto LABEL_18;
        }
      }
LABEL_50:
      if (*(_DWORD *)(this + 212) == 3)
      {
        uint64_t v7 = *(void *)(this + 152);
        if (v3 != 4) {
          goto LABEL_52;
        }
LABEL_19:
        uint64_t v8 = *(void *)(this + 144);
        goto LABEL_364;
      }
      if (*(_DWORD *)(this + 216) == 3)
      {
        uint64_t v7 = *(void *)(this + 160);
        if (v3 == 4) {
          goto LABEL_19;
        }
      }
      else if (*(_DWORD *)(this + 220) == 3)
      {
        uint64_t v7 = *(void *)(this + 168);
        if (v3 == 4) {
          goto LABEL_19;
        }
      }
      else if (*(_DWORD *)(this + 224) == 3)
      {
        uint64_t v7 = *(void *)(this + 176);
        if (v3 == 4) {
          goto LABEL_19;
        }
      }
      else
      {
        uint64_t v7 = 0;
        if (v3 == 4) {
          goto LABEL_19;
        }
      }
LABEL_52:
      if (*(_DWORD *)(this + 212) == 4)
      {
        uint64_t v8 = *(void *)(this + 152);
        if (v3 == 5) {
          goto LABEL_378;
        }
      }
      else if (*(_DWORD *)(this + 216) == 4)
      {
        uint64_t v8 = *(void *)(this + 160);
        if (v3 == 5) {
          goto LABEL_378;
        }
      }
      else if (*(_DWORD *)(this + 220) == 4)
      {
        uint64_t v8 = *(void *)(this + 168);
        if (v3 == 5) {
          goto LABEL_378;
        }
      }
      else if (*(_DWORD *)(this + 224) == 4)
      {
        uint64_t v8 = *(void *)(this + 176);
        if (v3 == 5) {
          goto LABEL_378;
        }
      }
      else
      {
        uint64_t v8 = 0;
        if (v3 == 5) {
          goto LABEL_378;
        }
      }
LABEL_364:
      if (*(_DWORD *)(this + 212) != 5)
      {
        if (*(_DWORD *)(this + 216) != 5)
        {
          if (*(_DWORD *)(this + 220) != 5)
          {
            uint64_t v12 = *(unsigned int *)(this + 224);
            if (v12 == 5)
            {
LABEL_368:
              uint64_t v19 = 4;
LABEL_385:
              uint64_t v12 = this + 8 * v19;
              uint64_t v14 = *(void *)(v12 + 144);
              char v20 = 1;
              *(void *)(this + 104) = v4;
              *(void *)(this + 144) = v7;
              goto LABEL_433;
            }
            goto LABEL_387;
          }
          goto LABEL_384;
        }
        goto LABEL_382;
      }
      goto LABEL_380;
    case 3:
      int v9 = *(_DWORD *)(this + 208);
      if (v9 == 6)
      {
        uint64_t v4 = *(void *)(this + 104);
        goto LABEL_57;
      }
      if (*(_DWORD *)(this + 212) == 6)
      {
        uint64_t v4 = *(void *)(this + 112);
        if (v9 != 7) {
          goto LABEL_57;
        }
LABEL_22:
        uint64_t v5 = *(void *)(this + 104);
        goto LABEL_59;
      }
      if (*(_DWORD *)(this + 216) == 6)
      {
        uint64_t v4 = *(void *)(this + 120);
        if (v9 == 7) {
          goto LABEL_22;
        }
      }
      else if (*(_DWORD *)(this + 220) == 6)
      {
        uint64_t v4 = *(void *)(this + 128);
        if (v9 == 7) {
          goto LABEL_22;
        }
      }
      else if (*(_DWORD *)(this + 224) == 6)
      {
        uint64_t v4 = *(void *)(this + 136);
        if (v9 == 7) {
          goto LABEL_22;
        }
      }
      else
      {
        uint64_t v4 = 0;
        if (v9 == 7) {
          goto LABEL_22;
        }
      }
LABEL_57:
      if (*(_DWORD *)(this + 212) == 7)
      {
        uint64_t v5 = *(void *)(this + 112);
        if (v9 != 8) {
          goto LABEL_59;
        }
LABEL_23:
        uint64_t v6 = *(void *)(this + 104);
        goto LABEL_61;
      }
      if (*(_DWORD *)(this + 216) == 7)
      {
        uint64_t v5 = *(void *)(this + 120);
        if (v9 == 8) {
          goto LABEL_23;
        }
      }
      else if (*(_DWORD *)(this + 220) == 7)
      {
        uint64_t v5 = *(void *)(this + 128);
        if (v9 == 8) {
          goto LABEL_23;
        }
      }
      else if (*(_DWORD *)(this + 224) == 7)
      {
        uint64_t v5 = *(void *)(this + 136);
        if (v9 == 8) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t v5 = 0;
        if (v9 == 8) {
          goto LABEL_23;
        }
      }
LABEL_59:
      if (*(_DWORD *)(this + 212) == 8)
      {
        uint64_t v6 = *(void *)(this + 112);
        if (v9 != 6) {
          goto LABEL_61;
        }
LABEL_24:
        uint64_t v7 = *(void *)(this + 144);
        goto LABEL_63;
      }
      if (*(_DWORD *)(this + 216) == 8)
      {
        uint64_t v6 = *(void *)(this + 120);
        if (v9 == 6) {
          goto LABEL_24;
        }
      }
      else if (*(_DWORD *)(this + 220) == 8)
      {
        uint64_t v6 = *(void *)(this + 128);
        if (v9 == 6) {
          goto LABEL_24;
        }
      }
      else if (*(_DWORD *)(this + 224) == 8)
      {
        uint64_t v6 = *(void *)(this + 136);
        if (v9 == 6) {
          goto LABEL_24;
        }
      }
      else
      {
        uint64_t v6 = 0;
        if (v9 == 6) {
          goto LABEL_24;
        }
      }
LABEL_61:
      if (*(_DWORD *)(this + 212) == 6)
      {
        uint64_t v7 = *(void *)(this + 152);
        if (v9 != 7) {
          goto LABEL_63;
        }
LABEL_25:
        uint64_t v8 = *(void *)(this + 144);
        goto LABEL_379;
      }
      if (*(_DWORD *)(this + 216) == 6)
      {
        uint64_t v7 = *(void *)(this + 160);
        if (v9 == 7) {
          goto LABEL_25;
        }
      }
      else if (*(_DWORD *)(this + 220) == 6)
      {
        uint64_t v7 = *(void *)(this + 168);
        if (v9 == 7) {
          goto LABEL_25;
        }
      }
      else if (*(_DWORD *)(this + 224) == 6)
      {
        uint64_t v7 = *(void *)(this + 176);
        if (v9 == 7) {
          goto LABEL_25;
        }
      }
      else
      {
        uint64_t v7 = 0;
        if (v9 == 7) {
          goto LABEL_25;
        }
      }
LABEL_63:
      if (*(_DWORD *)(this + 212) == 7)
      {
        uint64_t v8 = *(void *)(this + 152);
        if (v9 == 8) {
          goto LABEL_378;
        }
      }
      else if (*(_DWORD *)(this + 216) == 7)
      {
        uint64_t v8 = *(void *)(this + 160);
        if (v9 == 8) {
          goto LABEL_378;
        }
      }
      else
      {
        if (*(_DWORD *)(this + 220) != 7)
        {
          if (*(_DWORD *)(this + 224) == 7)
          {
            uint64_t v8 = *(void *)(this + 176);
            if (v9 != 8) {
              goto LABEL_379;
            }
          }
          else
          {
            uint64_t v8 = 0;
            if (v9 != 8) {
              goto LABEL_379;
            }
          }
LABEL_378:
          uint64_t v19 = 0;
          goto LABEL_385;
        }
        uint64_t v8 = *(void *)(this + 168);
        if (v9 == 8) {
          goto LABEL_378;
        }
      }
LABEL_379:
      if (*(_DWORD *)(this + 212) != 8)
      {
        if (*(_DWORD *)(this + 216) != 8)
        {
          if (*(_DWORD *)(this + 220) != 8)
          {
            uint64_t v12 = *(unsigned int *)(this + 224);
            if (v12 == 8) {
              goto LABEL_368;
            }
LABEL_387:
            uint64_t v14 = 0;
            char v20 = 1;
            *(void *)(this + 104) = v4;
            *(void *)(this + 144) = v7;
            goto LABEL_433;
          }
LABEL_384:
          uint64_t v19 = 3;
          goto LABEL_385;
        }
LABEL_382:
        uint64_t v19 = 2;
        goto LABEL_385;
      }
LABEL_380:
      uint64_t v19 = 1;
      goto LABEL_385;
    case 4:
      int v10 = *(_DWORD *)(this + 208);
      if (v10 == 6)
      {
        uint64_t v11 = *(void *)(this + 104);
        goto LABEL_68;
      }
      if (*(_DWORD *)(this + 212) == 6)
      {
        uint64_t v11 = *(void *)(this + 112);
        if (v10 != 7) {
          goto LABEL_68;
        }
LABEL_28:
        uint64_t v5 = *(void *)(this + 104);
        goto LABEL_70;
      }
      if (*(_DWORD *)(this + 216) == 6)
      {
        uint64_t v11 = *(void *)(this + 120);
        if (v10 == 7) {
          goto LABEL_28;
        }
      }
      else if (*(_DWORD *)(this + 220) == 6)
      {
        uint64_t v11 = *(void *)(this + 128);
        if (v10 == 7) {
          goto LABEL_28;
        }
      }
      else if (*(_DWORD *)(this + 224) == 6)
      {
        uint64_t v11 = *(void *)(this + 136);
        if (v10 == 7) {
          goto LABEL_28;
        }
      }
      else
      {
        uint64_t v11 = 0;
        if (v10 == 7) {
          goto LABEL_28;
        }
      }
LABEL_68:
      if (*(_DWORD *)(this + 212) == 7)
      {
        uint64_t v5 = *(void *)(this + 112);
        if (v10 != 8) {
          goto LABEL_70;
        }
LABEL_29:
        uint64_t v6 = *(void *)(this + 104);
        goto LABEL_72;
      }
      if (*(_DWORD *)(this + 216) == 7)
      {
        uint64_t v5 = *(void *)(this + 120);
        if (v10 == 8) {
          goto LABEL_29;
        }
      }
      else if (*(_DWORD *)(this + 220) == 7)
      {
        uint64_t v5 = *(void *)(this + 128);
        if (v10 == 8) {
          goto LABEL_29;
        }
      }
      else if (*(_DWORD *)(this + 224) == 7)
      {
        uint64_t v5 = *(void *)(this + 136);
        if (v10 == 8) {
          goto LABEL_29;
        }
      }
      else
      {
        uint64_t v5 = 0;
        if (v10 == 8) {
          goto LABEL_29;
        }
      }
LABEL_70:
      if (*(_DWORD *)(this + 212) == 8)
      {
        uint64_t v6 = *(void *)(this + 112);
        if (v10 != 9) {
          goto LABEL_72;
        }
LABEL_30:
        uint64_t v12 = *(void *)(this + 104);
        goto LABEL_74;
      }
      if (*(_DWORD *)(this + 216) == 8)
      {
        uint64_t v6 = *(void *)(this + 120);
        if (v10 == 9) {
          goto LABEL_30;
        }
      }
      else if (*(_DWORD *)(this + 220) == 8)
      {
        uint64_t v6 = *(void *)(this + 128);
        if (v10 == 9) {
          goto LABEL_30;
        }
      }
      else if (*(_DWORD *)(this + 224) == 8)
      {
        uint64_t v6 = *(void *)(this + 136);
        if (v10 == 9) {
          goto LABEL_30;
        }
      }
      else
      {
        uint64_t v6 = 0;
        if (v10 == 9) {
          goto LABEL_30;
        }
      }
LABEL_72:
      if (*(_DWORD *)(this + 212) == 9)
      {
        uint64_t v12 = *(void *)(this + 112);
        if (v10 != 6) {
          goto LABEL_74;
        }
LABEL_31:
        uint64_t v13 = *(void *)(this + 144);
        goto LABEL_76;
      }
      if (*(_DWORD *)(this + 216) == 9)
      {
        uint64_t v12 = *(void *)(this + 120);
        if (v10 == 6) {
          goto LABEL_31;
        }
      }
      else if (*(_DWORD *)(this + 220) == 9)
      {
        uint64_t v12 = *(void *)(this + 128);
        if (v10 == 6) {
          goto LABEL_31;
        }
      }
      else if (*(_DWORD *)(this + 224) == 9)
      {
        uint64_t v12 = *(void *)(this + 136);
        if (v10 == 6) {
          goto LABEL_31;
        }
      }
      else
      {
        uint64_t v12 = 0;
        if (v10 == 6) {
          goto LABEL_31;
        }
      }
LABEL_74:
      if (*(_DWORD *)(this + 212) == 6)
      {
        uint64_t v13 = *(void *)(this + 152);
        if (v10 != 7) {
          goto LABEL_76;
        }
LABEL_32:
        uint64_t v8 = *(void *)(this + 144);
        goto LABEL_78;
      }
      if (*(_DWORD *)(this + 216) == 6)
      {
        uint64_t v13 = *(void *)(this + 160);
        if (v10 == 7) {
          goto LABEL_32;
        }
      }
      else if (*(_DWORD *)(this + 220) == 6)
      {
        uint64_t v13 = *(void *)(this + 168);
        if (v10 == 7) {
          goto LABEL_32;
        }
      }
      else if (*(_DWORD *)(this + 224) == 6)
      {
        uint64_t v13 = *(void *)(this + 176);
        if (v10 == 7) {
          goto LABEL_32;
        }
      }
      else
      {
        uint64_t v13 = 0;
        if (v10 == 7) {
          goto LABEL_32;
        }
      }
LABEL_76:
      if (*(_DWORD *)(this + 212) == 7)
      {
        uint64_t v8 = *(void *)(this + 152);
        if (v10 != 8) {
          goto LABEL_78;
        }
LABEL_33:
        uint64_t v14 = *(void *)(this + 144);
        goto LABEL_401;
      }
      if (*(_DWORD *)(this + 216) == 7)
      {
        uint64_t v8 = *(void *)(this + 160);
        if (v10 == 8) {
          goto LABEL_33;
        }
      }
      else if (*(_DWORD *)(this + 220) == 7)
      {
        uint64_t v8 = *(void *)(this + 168);
        if (v10 == 8) {
          goto LABEL_33;
        }
      }
      else if (*(_DWORD *)(this + 224) == 7)
      {
        uint64_t v8 = *(void *)(this + 176);
        if (v10 == 8) {
          goto LABEL_33;
        }
      }
      else
      {
        uint64_t v8 = 0;
        if (v10 == 8) {
          goto LABEL_33;
        }
      }
LABEL_78:
      if (*(_DWORD *)(this + 212) == 8)
      {
        uint64_t v14 = *(void *)(this + 152);
        if (v10 == 9) {
          goto LABEL_425;
        }
      }
      else if (*(_DWORD *)(this + 216) == 8)
      {
        uint64_t v14 = *(void *)(this + 160);
        if (v10 == 9) {
          goto LABEL_425;
        }
      }
      else if (*(_DWORD *)(this + 220) == 8)
      {
        uint64_t v14 = *(void *)(this + 168);
        if (v10 == 9) {
          goto LABEL_425;
        }
      }
      else if (*(_DWORD *)(this + 224) == 8)
      {
        uint64_t v14 = *(void *)(this + 176);
        if (v10 == 9) {
          goto LABEL_425;
        }
      }
      else
      {
        uint64_t v14 = 0;
        if (v10 == 9) {
          goto LABEL_425;
        }
      }
LABEL_401:
      if (*(_DWORD *)(this + 212) != 9)
      {
        if (*(_DWORD *)(this + 216) != 9)
        {
          if (*(_DWORD *)(this + 220) != 9)
          {
            if (*(_DWORD *)(this + 224) == 9)
            {
LABEL_405:
              uint64_t v21 = 4;
LABEL_432:
              char v20 = 0;
              uint64_t v1 = *(void *)(this + 8 * v21 + 144);
              *(void *)(this + 104) = v11;
              *(void *)(this + 144) = v13;
              goto LABEL_433;
            }
LABEL_437:
            uint64_t v1 = 0;
            char v20 = 0;
            *(void *)(this + 104) = v11;
            *(void *)(this + 144) = v13;
LABEL_433:
            *(void *)(this + 112) = v5;
            *(void *)(this + 120) = v6;
            *(void *)(this + 152) = v8;
            *(void *)(this + 160) = v14;
            if ((v20 & 1) == 0)
            {
              *(void *)(this + 128) = v12;
              *(void *)(this + 168) = v1;
            }
            return this;
          }
          goto LABEL_431;
        }
        goto LABEL_429;
      }
      goto LABEL_427;
    case 5:
    case 7:
      if (*(_DWORD *)(this + 208) == 10) {
        goto LABEL_35;
      }
      if (*(_DWORD *)(this + 212) == 10) {
        goto LABEL_82;
      }
      if (*(_DWORD *)(this + 216) == 10)
      {
        uint64_t v2 = *(void *)(this + 120);
        goto LABEL_407;
      }
      if (*(_DWORD *)(this + 220) == 10)
      {
        uint64_t v2 = *(void *)(this + 128);
        if (*(_DWORD *)(this + 216) == 10) {
          goto LABEL_407;
        }
      }
      else if (*(_DWORD *)(this + 224) == 10)
      {
        uint64_t v2 = *(void *)(this + 136);
        if (*(_DWORD *)(this + 216) == 10) {
          goto LABEL_407;
        }
      }
      else
      {
        uint64_t v2 = 0;
        if (*(_DWORD *)(this + 216) == 10) {
          goto LABEL_407;
        }
      }
      if (*(_DWORD *)(this + 220) == 10) {
        goto LABEL_409;
      }
      if (*(_DWORD *)(this + 224) == 10) {
        goto LABEL_271;
      }
      goto LABEL_350;
    case 6:
      if (*(_DWORD *)(this + 208) == 13)
      {
LABEL_35:
        uint64_t v15 = 0;
        uint64_t v16 = (uint64_t *)(this + 104);
LABEL_83:
        uint64_t v2 = *v16;
LABEL_84:
        uint64_t v18 = *(void *)(this + 8 * v15 + 144);
        goto LABEL_85;
      }
      if (*(_DWORD *)(this + 212) == 13)
      {
LABEL_82:
        uint64_t v16 = (uint64_t *)(this + 112);
        uint64_t v15 = 1;
        goto LABEL_83;
      }
      if (*(_DWORD *)(this + 216) == 13)
      {
        uint64_t v2 = *(void *)(this + 120);
LABEL_407:
        uint64_t v15 = 2;
        goto LABEL_84;
      }
      if (*(_DWORD *)(this + 220) == 13)
      {
        uint64_t v2 = *(void *)(this + 128);
        if (*(_DWORD *)(this + 216) == 13) {
          goto LABEL_407;
        }
      }
      else if (*(_DWORD *)(this + 224) == 13)
      {
        uint64_t v2 = *(void *)(this + 136);
        if (*(_DWORD *)(this + 216) == 13) {
          goto LABEL_407;
        }
      }
      else
      {
        uint64_t v2 = 0;
        if (*(_DWORD *)(this + 216) == 13) {
          goto LABEL_407;
        }
      }
      if (*(_DWORD *)(this + 220) == 13)
      {
LABEL_409:
        uint64_t v15 = 3;
        goto LABEL_84;
      }
      if (*(_DWORD *)(this + 224) == 13)
      {
LABEL_271:
        uint64_t v15 = 4;
        goto LABEL_84;
      }
LABEL_350:
      uint64_t v18 = 0;
LABEL_85:
      *(void *)(this + 104) = v2;
      *(void *)(this + 144) = v18;
      return this;
    case 9:
      int v17 = *(_DWORD *)(this + 208);
      if (v17 == 3)
      {
        uint64_t v11 = *(void *)(this + 104);
        goto LABEL_88;
      }
      if (*(_DWORD *)(this + 212) == 3)
      {
        uint64_t v11 = *(void *)(this + 112);
        if (v17 != 4) {
          goto LABEL_88;
        }
LABEL_38:
        uint64_t v5 = *(void *)(this + 104);
        goto LABEL_90;
      }
      if (*(_DWORD *)(this + 216) == 3)
      {
        uint64_t v11 = *(void *)(this + 120);
        if (v17 == 4) {
          goto LABEL_38;
        }
      }
      else if (*(_DWORD *)(this + 220) == 3)
      {
        uint64_t v11 = *(void *)(this + 128);
        if (v17 == 4) {
          goto LABEL_38;
        }
      }
      else if (*(_DWORD *)(this + 224) == 3)
      {
        uint64_t v11 = *(void *)(this + 136);
        if (v17 == 4) {
          goto LABEL_38;
        }
      }
      else
      {
        uint64_t v11 = 0;
        if (v17 == 4) {
          goto LABEL_38;
        }
      }
LABEL_88:
      if (*(_DWORD *)(this + 212) == 4)
      {
        uint64_t v5 = *(void *)(this + 112);
        if (v17 != 5) {
          goto LABEL_90;
        }
LABEL_39:
        uint64_t v6 = *(void *)(this + 104);
        goto LABEL_92;
      }
      if (*(_DWORD *)(this + 216) == 4)
      {
        uint64_t v5 = *(void *)(this + 120);
        if (v17 == 5) {
          goto LABEL_39;
        }
      }
      else if (*(_DWORD *)(this + 220) == 4)
      {
        uint64_t v5 = *(void *)(this + 128);
        if (v17 == 5) {
          goto LABEL_39;
        }
      }
      else if (*(_DWORD *)(this + 224) == 4)
      {
        uint64_t v5 = *(void *)(this + 136);
        if (v17 == 5) {
          goto LABEL_39;
        }
      }
      else
      {
        uint64_t v5 = 0;
        if (v17 == 5) {
          goto LABEL_39;
        }
      }
LABEL_90:
      if (*(_DWORD *)(this + 212) == 5)
      {
        uint64_t v6 = *(void *)(this + 112);
        if (v17 != 18) {
          goto LABEL_92;
        }
LABEL_40:
        uint64_t v12 = *(void *)(this + 104);
        goto LABEL_94;
      }
      if (*(_DWORD *)(this + 216) == 5)
      {
        uint64_t v6 = *(void *)(this + 120);
        if (v17 == 18) {
          goto LABEL_40;
        }
      }
      else if (*(_DWORD *)(this + 220) == 5)
      {
        uint64_t v6 = *(void *)(this + 128);
        if (v17 == 18) {
          goto LABEL_40;
        }
      }
      else if (*(_DWORD *)(this + 224) == 5)
      {
        uint64_t v6 = *(void *)(this + 136);
        if (v17 == 18) {
          goto LABEL_40;
        }
      }
      else
      {
        uint64_t v6 = 0;
        if (v17 == 18) {
          goto LABEL_40;
        }
      }
LABEL_92:
      if (*(_DWORD *)(this + 212) == 18)
      {
        uint64_t v12 = *(void *)(this + 112);
        if (v17 != 3) {
          goto LABEL_94;
        }
LABEL_41:
        uint64_t v13 = *(void *)(this + 144);
        goto LABEL_96;
      }
      if (*(_DWORD *)(this + 216) == 18)
      {
        uint64_t v12 = *(void *)(this + 120);
        if (v17 == 3) {
          goto LABEL_41;
        }
      }
      else if (*(_DWORD *)(this + 220) == 18)
      {
        uint64_t v12 = *(void *)(this + 128);
        if (v17 == 3) {
          goto LABEL_41;
        }
      }
      else if (*(_DWORD *)(this + 224) == 18)
      {
        uint64_t v12 = *(void *)(this + 136);
        if (v17 == 3) {
          goto LABEL_41;
        }
      }
      else
      {
        uint64_t v12 = 0;
        if (v17 == 3) {
          goto LABEL_41;
        }
      }
LABEL_94:
      if (*(_DWORD *)(this + 212) == 3)
      {
        uint64_t v13 = *(void *)(this + 152);
        if (v17 != 4) {
          goto LABEL_96;
        }
LABEL_42:
        uint64_t v8 = *(void *)(this + 144);
        goto LABEL_98;
      }
      if (*(_DWORD *)(this + 216) == 3)
      {
        uint64_t v13 = *(void *)(this + 160);
        if (v17 == 4) {
          goto LABEL_42;
        }
      }
      else if (*(_DWORD *)(this + 220) == 3)
      {
        uint64_t v13 = *(void *)(this + 168);
        if (v17 == 4) {
          goto LABEL_42;
        }
      }
      else if (*(_DWORD *)(this + 224) == 3)
      {
        uint64_t v13 = *(void *)(this + 176);
        if (v17 == 4) {
          goto LABEL_42;
        }
      }
      else
      {
        uint64_t v13 = 0;
        if (v17 == 4) {
          goto LABEL_42;
        }
      }
LABEL_96:
      if (*(_DWORD *)(this + 212) == 4)
      {
        uint64_t v8 = *(void *)(this + 152);
        if (v17 != 5) {
          goto LABEL_98;
        }
LABEL_43:
        uint64_t v14 = *(void *)(this + 144);
        goto LABEL_426;
      }
      if (*(_DWORD *)(this + 216) == 4)
      {
        uint64_t v8 = *(void *)(this + 160);
        if (v17 == 5) {
          goto LABEL_43;
        }
      }
      else if (*(_DWORD *)(this + 220) == 4)
      {
        uint64_t v8 = *(void *)(this + 168);
        if (v17 == 5) {
          goto LABEL_43;
        }
      }
      else if (*(_DWORD *)(this + 224) == 4)
      {
        uint64_t v8 = *(void *)(this + 176);
        if (v17 == 5) {
          goto LABEL_43;
        }
      }
      else
      {
        uint64_t v8 = 0;
        if (v17 == 5) {
          goto LABEL_43;
        }
      }
LABEL_98:
      if (*(_DWORD *)(this + 212) == 5)
      {
        uint64_t v14 = *(void *)(this + 152);
        if (v17 == 18) {
          goto LABEL_425;
        }
      }
      else if (*(_DWORD *)(this + 216) == 5)
      {
        uint64_t v14 = *(void *)(this + 160);
        if (v17 == 18) {
          goto LABEL_425;
        }
      }
      else
      {
        if (*(_DWORD *)(this + 220) != 5)
        {
          if (*(_DWORD *)(this + 224) == 5)
          {
            uint64_t v14 = *(void *)(this + 176);
            if (v17 != 18) {
              goto LABEL_426;
            }
          }
          else
          {
            uint64_t v14 = 0;
            if (v17 != 18) {
              goto LABEL_426;
            }
          }
LABEL_425:
          uint64_t v21 = 0;
          goto LABEL_432;
        }
        uint64_t v14 = *(void *)(this + 168);
        if (v17 == 18) {
          goto LABEL_425;
        }
      }
LABEL_426:
      if (*(_DWORD *)(this + 212) != 18)
      {
        if (*(_DWORD *)(this + 216) != 18)
        {
          if (*(_DWORD *)(this + 220) != 18)
          {
            if (*(_DWORD *)(this + 224) == 18) {
              goto LABEL_405;
            }
            goto LABEL_437;
          }
LABEL_431:
          uint64_t v21 = 3;
          goto LABEL_432;
        }
LABEL_429:
        uint64_t v21 = 2;
        goto LABEL_432;
      }
LABEL_427:
      uint64_t v21 = 1;
      goto LABEL_432;
    default:
      return this;
  }
}

uint64_t Madusa::Demod::Demod(uint64_t a1, uint64_t a2)
{
  int v3 = (void *)(a1 + 68728);
  *(void *)a1 = off_100070898;
  *(void *)(a1 + 8) = a2;
  *(_OWORD *)(a1 + 1096) = 0u;
  uint64_t v4 = a1 + 1120;
  *(void *)(a1 + 1120) = off_1000708B8;
  bzero((void *)(a1 + 1128), 0x10810uLL);
  void *v3 = v4;
  v3[1] = off_1000708D8;
  bzero((void *)(a1 + 68744), 0x4000uLL);
  v3[2050] = v3 + 1;
  uint64_t func = (void (*)(uint64_t))__find_func(0xEFDFBFFFA000E040, 23347242);
  func(a1);
  return a1;
}

void Madusa::Demod::Initialize(Madusa::Demod *this)
{
  *((_DWORD *)this + 278) = 0;
  *(_OWORD *)((char *)this + 1096) = 0u;
  sub_10001E340((int16x8_t *)this + 1, 0);
  sub_10001E340((int16x8_t *)((char *)this + 556), 0);

  bzero((char *)this + 85136, 0x870uLL);
}

int16x8_t sub_10001E340(int16x8_t *a1, unsigned int a2)
{
  int16x8_t result = vdupq_n_s16(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = result;
  a1[3] = result;
  a1[4] = result;
  a1[5] = result;
  a1[6] = result;
  a1[7] = result;
  a1[8] = result;
  a1[9] = result;
  a1[10] = result;
  a1[11] = result;
  a1[12] = result;
  a1[13] = result;
  a1[14] = result;
  a1[15] = result;
  a1[16] = result;
  a1[17] = result;
  a1[18] = result;
  a1[19] = result;
  a1[20] = result;
  a1[21] = result;
  a1[22] = result;
  a1[23] = result;
  a1[24] = result;
  a1[25] = result;
  a1[26] = result;
  a1[27] = result;
  a1[28] = result;
  a1[29] = result;
  a1[30] = result;
  a1[31] = result;
  a1[32] = result;
  a1[33].i64[0] = result.i64[0];
  a1[33].i16[4] = a2;
  a1[33].i16[5] = a2;
  return result;
}

void Madusa::Demod::_Initialize(Madusa::Demod *this, Madusa::Demod *a2, int8x8_t a3)
{
  a3.i32[0] = *v3 | 0xFFFFFFE0;
  a3.i8[4] = v3[3];
  *(int8x8_t *)v4.i8 = vand_s8(a3, (int8x8_t)0xFF000000FFLL);
  v4.i64[1] = v4.i64[0];
  float32x4_t v5 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v4, (int32x4_t)xmmword_10006DDB0));
  v6.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_10006DDC0, v5)).u32[0];
  v6.i32[1] = vmovn_s32(vcgtq_f32(v5, (float32x4_t)xmmword_10006DDC0)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v6, 0xFuLL))) & ((v3[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    ++QuickCodec::mask;
  }
  Madusa::Demod::Initialize(this);
}

uint64_t Madusa::Demod::Execute(uint64_t a1, uint64_t a2, uint64_t a3)
{
  Madusa::ProfileTimer::ProfileTimer(v14, (uint64_t)&unk_10006F6CB, *(void *)(a1 + 8));
  uint64_t func = (void (*)(uint64_t, uint64_t, uint64_t))__find_func(0x3F1FDF3F6000E090, -777772822);
  func(a1, a2, a3);
  if ((*v3 & 0x1F) != 0 || v3[2] > 0x3Fu)
  {
    if (QuickCodec::mask == -70947757) {
      goto LABEL_13;
    }
    goto LABEL_10;
  }
  if (v3[3] == 212 || QuickCodec::mask != -70947757)
  {
LABEL_10:
    unint64_t v9 = 0;
    int v10 = FunctionTable::ft[0] ^ 0x157E9386;
    QuickCodec::masint k = FunctionTable::ft[0] ^ 0x157E9386;
    int v11 = -1;
    do
    {
      qword_100074AF8[v11
                    + 1
                    + ((FunctionTable::swapTable[v9] ^ v10) / 0x9D28AF)] = qword_100074AF8[v11 + ((FunctionTable::swapTable[v9 + 1] ^ v10) / 0x9D28AF)];
      v11 -= 2;
      BOOL v12 = v9 >= 0x20;
      v9 += 2;
    }
    while (!v12);
  }
LABEL_13:
  Madusa::ProfileTimer::~ProfileTimer((Madusa::ProfileTimer *)v14);
  return a1 + 16;
}

uint64_t Madusa::Demod::_Execute(uint64_t a1, uint64_t a2, uint64_t a3, int8x8_t a4)
{
  a4.i32[0] = *v4 | 0xFFFFFFE0;
  a4.i8[4] = v4[3];
  *(int8x8_t *)v5.i8 = vand_s8(a4, (int8x8_t)0xFF000000FFLL);
  v5.i64[1] = v5.i64[0];
  float32x4_t v6 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v5, (int32x4_t)xmmword_10006DDD0));
  v7.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_10006DDE0, v6)).u32[0];
  v7.i32[1] = vmovn_s32(vcgtq_f32(v6, (float32x4_t)xmmword_10006DDE0)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v7, 0xFuLL))) & ((v4[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    ++QuickCodec::mask;
  }
  return Madusa::Demod::Execute(a1, a2, a3);
}

uint64_t Madusa::Demod::_Execute_Alt(uint64_t a1, int8x8_t a2)
{
  a2.i32[0] = *v2 | 0xFFFFFFE0;
  a2.i8[4] = v2[3];
  *(int8x8_t *)v3.i8 = vand_s8(a2, (int8x8_t)0xFF000000FFLL);
  v3.i64[1] = v3.i64[0];
  float32x4_t v4 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v3, (int32x4_t)xmmword_10006DDF0));
  v5.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_10006DE00, v4)).u32[0];
  v5.i32[1] = vmovn_s32(vcgtq_f32(v4, (float32x4_t)xmmword_10006DE00)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v5, 0xFuLL))) & ((v2[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    ++QuickCodec::mask;
  }
  return Madusa::Demod::Execute_Alt(a1);
}

uint64_t Madusa::Demod::Execute_Alt(uint64_t a1)
{
  return a1 + 16;
}

uint64_t Madusa::Demod::ExecuteDemod(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t func = (void (*)(uint64_t))__find_func(0xCF9FBF1F202020A0, 556024010);
  func(a1);
  v8.i32[0] = *(_DWORD *)(a2 + 48);
  float32x2_t v9 = *(float32x2_t *)(a2 + 52);
  v10.i32[1] = v9.i32[1];
  v10.i32[0] = *(_DWORD *)(a2 + 60);
  float32x2_t v11 = vmul_f32(v10, *(float32x2_t *)(a2 + 48));
  float v12 = vsub_f32(v11, (float32x2_t)vdup_lane_s32((int32x2_t)v11, 1)).f32[0];
  if (v12 == 0.0)
  {
    v8.i32[1] = *(_DWORD *)(a2 + 60);
  }
  else
  {
    float v13 = 1.0 / v12;
    float32x2_t v9 = vmul_n_f32(v9, -v13);
    v14.i32[1] = *(_DWORD *)(a2 + 48);
    v14.i32[0] = *(_DWORD *)(a2 + 60);
    float32x2_t v8 = vmul_n_f32(v14, v13);
  }
  *(float32x2_t *)v15.i8 = v8;
  v15.u64[1] = (unint64_t)v9;
  int32x4_t v35 = vuzp1q_s32(v15, (int32x4_t)vextq_s8((int8x16_t)v15, (int8x16_t)v15, 0xCuLL));
  float32x2_t v16 = vadd_f32(vmla_f32((float32x2_t)vdup_n_s32(0xC2810000), vadd_f32(v8, v9), (float32x2_t)0x3F0000003F000000), *(float32x2_t *)(a2 + 8));
  float32x2_t v17 = vmla_f32(v16, vrndm_f32(vmul_f32(v16, (float32x2_t)0x3C0000003C000000)), (float32x2_t)0xC3000000C3000000);
  float32x2_t v18 = vadd_f32(v17, (float32x2_t)0x3F0000003F000000);
  float32x2_t v33 = vsub_f32(vrnd_f32(v18), v17);
  int32x2_t v34 = vcvt_s32_f32(v18);
  uint64_t v19 = (unsigned int (*)(uint64_t, int32x4_t *))__find_func(0x1F5FFF9FC0E00020, -236715958);
  if (v19(a1, &v35))
  {
    char v20 = (unsigned int (*)(uint64_t, int32x4_t *))__find_func(0xCF3F5F7F208000E0, 562340010);
    if (v20(a1, &v35)) {
      uint64_t v21 = 9;
    }
    else {
      uint64_t v21 = 5;
    }
  }
  else
  {
    uint64_t v21 = 1;
  }
  uint64_t v22 = (char *)&Madusa::Demod::mDemodBlockOffsets;
  do
  {
    int v23 = (void (*)(uint64_t, uint64_t, uint64_t, float32x2_t *, char *, uint64_t))__find_func(0x5F9FDF3FE02000E0, -1323032342);
    v23(a1, a3, a2, &v33, v22, a1 + 68728);
    uint64_t v24 = (void (*)(uint64_t, uint64_t, uint64_t))__find_func(0xBF7FDFFFA04040E0, 1371807786);
    v24(a1, a1 + 68728, a1 + 85128);
    unint64_t v25 = (void (*)(uint64_t, uint64_t, int32x2_t *, uint64_t, uint64_t))__find_func(0x8F1F9F5FC0604040, 1638162570);
    v25(a1, a1 + 85128, &v34, a1 + 85136, a1 + 86216);
    v22 += 8;
    --v21;
  }
  while (v21);
  uint64_t v26 = *(unsigned __int8 *)(a2 + 29);
  uint64_t v27 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))__find_func(0xCFFFDF7FC0C040C0, 558112938);
  unint64_t v28 = (const void *)v27(a1, a1 + 85136, a1 + 86216, v26);
  memcpy((void *)(a1 + 16), v28, 0x44CuLL);
  int32x4_t v29 = *(int32x4_t *)(a2 + 32);
  *(int32x4_t *)(a1 + 1096) = v29;
  v29.i8[4] = v3[3];
  v29.i32[0] = *v3 | 0xFFFFFFE0;
  *(int8x8_t *)v29.i8 = vand_s8(*(int8x8_t *)v29.i8, (int8x8_t)0xFF000000FFLL);
  v29.i64[1] = v29.i64[0];
  float32x4_t v30 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v29, (int32x4_t)xmmword_10006DE10));
  v31.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_10006DE20, v30)).u32[0];
  v31.i32[1] = vmovn_s32(vcgtq_f32(v30, (float32x4_t)xmmword_10006DE20)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v31, 0xFuLL))) & ((v3[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    QuickCodec::masint k = FunctionTable::ft[0] ^ 0x157E9386;
    fegetenv(&v36);
    v36.__fpcr &= QuickCodec::mask + 70947740;
    fesetenv(&v36);
  }
  return a1 + 16;
}

uint64_t Madusa::Demod::_ExecuteDemod(uint64_t a1, uint64_t a2, uint64_t a3)
{
  float32x4_t v4 = 0;
  int v5 = 0;
  if (QuickCodec::mask == -70947757) {
    int v6 = 4714206;
  }
  else {
    int v6 = 330764;
  }
  uint64_t v7 = 1;
  int v8 = 2004762;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v11 = v7;
        if (v8 <= 2004832) {
          break;
        }
        if (v8 == 2004833)
        {
          if ((*v4 & 0x1F) != 0
            || v4[2] > 0x3Fu
            || (uint64_t v7 = 1,
                int v8 = 330764,
                v4[3] != ((QuickCodec::mask ^ v5) / 0x4F6C12)))
          {
            int v8 = 330818;
            uint64_t v7 = v11;
          }
        }
        else if (v8 == 2335509)
        {
          float32x4_t v4 = (unsigned char *)v3;
          int v8 = 2004779;
        }
        else
        {
          BOOL v12 = v8 == 4714206;
          int v8 = 2004833;
          if (v12) {
            int v5 = -1174400325;
          }
        }
      }
      if (v8 <= 2004761) {
        break;
      }
      unsigned int v9 = (QuickCodec::mask != -70947757) | v7;
      if (v8 == 2004779) {
        int v10 = v6;
      }
      else {
        int v10 = v8;
      }
      if (v8 == 2004779) {
        LODWORD(v11) = v9;
      }
      BOOL v12 = v8 == 2004762;
      if (v8 == 2004762) {
        int v8 = 330764;
      }
      else {
        int v8 = v10;
      }
      if (v12) {
        uint64_t v7 = 0;
      }
      else {
        uint64_t v7 = v11;
      }
    }
    if (v8 != 330764) {
      break;
    }
    int v8 = 330818;
    if ((v7 & 1) == 0) {
      int v8 = 2335509;
    }
  }
  if (v7) {
    ++QuickCodec::mask;
  }
  return Madusa::Demod::ExecuteDemod(a1, a2, a3);
}

uint64_t Madusa::Demod::_ExecuteDemod_Alt(uint64_t a1)
{
  uint64_t v2 = 0;
  int v3 = 0;
  if (QuickCodec::mask == -70947757) {
    int v4 = 6659055;
  }
  else {
    int v4 = 1653543;
  }
  uint64_t v5 = 1;
  int v6 = 2864541;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v9 = v5;
        if (v6 <= 2864611) {
          break;
        }
        if (v6 == 2864612)
        {
          if ((*v2 & 0x1F) != 0
            || v2[2] > 0x3Fu
            || (uint64_t v5 = 1,
                int v6 = 1653543,
                v2[3] != ((QuickCodec::mask ^ v3) / 0x27540B)))
          {
            int v6 = 1653597;
            uint64_t v5 = v9;
          }
        }
        else if (v6 == 4518067)
        {
          uint64_t v2 = (unsigned char *)v1;
          int v6 = 2864558;
        }
        else
        {
          BOOL v10 = v6 == 6659055;
          int v6 = 2864612;
          if (v10) {
            int v3 = -615189169;
          }
        }
      }
      if (v6 <= 2864540) {
        break;
      }
      unsigned int v7 = (QuickCodec::mask != -70947757) | v5;
      if (v6 == 2864558) {
        int v8 = v4;
      }
      else {
        int v8 = v6;
      }
      if (v6 == 2864558) {
        LODWORD(v9) = v7;
      }
      BOOL v10 = v6 == 2864541;
      if (v6 == 2864541) {
        int v6 = 1653543;
      }
      else {
        int v6 = v8;
      }
      if (v10) {
        uint64_t v5 = 0;
      }
      else {
        uint64_t v5 = v9;
      }
    }
    if (v6 != 1653543) {
      break;
    }
    int v6 = 1653597;
    if ((v5 & 1) == 0) {
      int v6 = 4518067;
    }
  }
  if (v5) {
    ++QuickCodec::mask;
  }
  return Madusa::Demod::ExecuteDemod_Alt(a1);
}

uint64_t Madusa::Demod::ExecuteDemod_Alt(uint64_t a1)
{
  return a1 + 16;
}

float32x4_t *Madusa::Demod::CrissCrossFilter(uint64_t a1, float **a2, void *a3)
{
  uint64_t v3 = 0;
  unint64_t v4 = *a3 + 8;
  uint64_t v5 = *a2;
  uint64_t v6 = *a3 + 136;
  int v7 = 1;
  int v8 = *a2;
  do
  {
    uint64_t v9 = &v5[130 * v3];
    unint64_t v10 = (unint64_t)(v9 + 391);
    unint64_t v11 = (unint64_t)(v9 + 3);
    if (v4 >= v10 || v11 >= v6 + (v3 << 7))
    {
      uint64_t v13 = 0;
      uint64_t v14 = 0x3FFFFFFFFFFFFF80;
      do
      {
        float32x4_t v15 = vaddq_f32(*(float32x4_t *)&v8[v14 + 273], *(float32x4_t *)&v8[v14 + 273]);
        float32x4_t v16 = vaddq_f32(*(float32x4_t *)&v8[v14 + 269], *(float32x4_t *)&v8[v14 + 269]);
        float32x4_t v17 = vaddq_f32(*(float32x4_t *)&v8[v14 + 265], *(float32x4_t *)&v8[v14 + 265]);
        float32x4_t v18 = vaddq_f32(*(float32x4_t *)&v8[v14 + 261], *(float32x4_t *)&v8[v14 + 261]);
        float32x4_t v19 = vsubq_f32(v18, vaddq_f32(*(float32x4_t *)&v8[v14 + 260], *(float32x4_t *)&v8[v14 + 262]));
        float32x4_t v20 = vsubq_f32(v17, vaddq_f32(*(float32x4_t *)&v8[v14 + 264], *(float32x4_t *)&v8[v14 + 266]));
        float32x4_t v21 = vsubq_f32(v16, vaddq_f32(*(float32x4_t *)&v8[v14 + 268], *(float32x4_t *)&v8[v14 + 270]));
        float32x4_t v22 = vsubq_f32(v15, vaddq_f32(*(float32x4_t *)&v8[v14 + 272], *(float32x4_t *)&v8[v14 + 274]));
        int16x8_t result = (float32x4_t *)&v8[v14 + 131];
        float32x4_t v24 = vsubq_f32(v18, vaddq_f32(*result, *(float32x4_t *)&v8[v14 + 391]));
        float32x4_t v25 = vsubq_f32(v17, vaddq_f32(*(float32x4_t *)&v8[v14 + 135], *(float32x4_t *)&v8[v14 + 395]));
        float32x4_t v26 = vsubq_f32(v16, vaddq_f32(*(float32x4_t *)&v8[v14 + 139], *(float32x4_t *)&v8[v14 + 399]));
        float32x4_t v27 = vsubq_f32(v15, vaddq_f32(*(float32x4_t *)&v8[v14 + 143], *(float32x4_t *)&v8[v14 + 403]));
        *(int8x16_t *)(v4 + v13) = vaddq_s8(vsubq_s8(vsubq_s8(vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcltzq_f32(v19), (int16x8_t)vcltzq_f32(v20)), (int8x16_t)vuzp1q_s16((int16x8_t)vcltzq_f32(v21), (int16x8_t)vcltzq_f32(v22))), vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcgtzq_f32(v19), (int16x8_t)vcgtzq_f32(v20)), (int8x16_t)vuzp1q_s16((int16x8_t)vcgtzq_f32(v21), (int16x8_t)vcgtzq_f32(v22)))), vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcgtzq_f32(v24), (int16x8_t)vcgtzq_f32(v25)), (int8x16_t)vuzp1q_s16((int16x8_t)vcgtzq_f32(v26), (int16x8_t)vcgtzq_f32(v27)))), vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcltzq_f32(v24), (int16x8_t)vcltzq_f32(v25)), (int8x16_t)vuzp1q_s16((int16x8_t)vcltzq_f32(v26), (int16x8_t)vcltzq_f32(v27))));
        v13 += 16;
        v14 += 16;
      }
      while (v14 * 4);
    }
    else
    {
      uint64_t v28 = 0;
      int32x4_t v29 = v8;
      do
      {
        float v30 = v29[133] + v29[133];
        *(float *)&unsigned int v31 = v30 - (float)(v29[132] + v29[134]);
        float v32 = v30 - (float)(v29[3] + v29[263]);
        int v33 = (__PAIR64__(*(float *)&v31 > 0.0, v31) - COERCE_UNSIGNED_INT(0.0)) >> 32;
        int16x8_t result = (float32x4_t *)(v32 < 0.0);
        if (v32 > 0.0) {
          LOBYTE(v33) = v33 + 1;
        }
        *(unsigned char *)(v4 + v28++) = v33 - (_BYTE)result;
        ++v29;
      }
      while (v28 != 128);
    }
    v4 += 128;
    ++v7;
    ++v3;
    v8 += 130;
  }
  while (v7 != 129);
  return result;
}

float32x4_t *Madusa::Demod::_CrissCrossFilter(uint64_t a1, float **a2, void *a3, int8x8_t a4)
{
  a4.i32[0] = *v4 | 0xFFFFFFE0;
  a4.i8[4] = v4[3];
  *(int8x8_t *)v5.i8 = vand_s8(a4, (int8x8_t)0xFF000000FFLL);
  v5.i64[1] = v5.i64[0];
  float32x4_t v6 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v5, (int32x4_t)xmmword_10006DE30));
  v7.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_10006DE40, v6)).u32[0];
  v7.i32[1] = vmovn_s32(vcgtq_f32(v6, (float32x4_t)xmmword_10006DE40)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v7, 0xFuLL))) & ((v4[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    ++QuickCodec::mask;
  }
  return Madusa::Demod::CrissCrossFilter(a1, a2, a3);
}

uint64_t Madusa::Demod::DescrambleAndAccumulateChips(uint64_t a1, void *a2, int *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = 0;
  int v6 = *a3;
  int v7 = a3[1];
  if (*a3 <= 0) {
    int v8 = -(-*a3 & 0x7F);
  }
  else {
    int v8 = *a3 & 0x7F;
  }
  int v9 = v8 + (v8 < 0 ? 0x80 : 0);
  if (v6 >= 0x80) {
    int v6 = v9;
  }
  if (v7 <= 0) {
    int v10 = -(-v7 & 0x7F);
  }
  else {
    int v10 = a3[1] & 0x7F;
  }
  int v11 = v10 + (v10 < 0 ? 0x80 : 0);
  if (v7 >= 0x80) {
    int v7 = v11;
  }
  uint64_t v12 = *a2 + 8;
  uint64_t v13 = (char *)&Madusa::Demod::mDescrambleLUT;
  do
  {
    uint64_t v14 = 0;
    uint64_t v15 = v12 + ((uint64_t)v6 << 7);
    int v16 = v7;
    do
    {
      uint64_t v17 = 2 * *(__int16 *)&v13[v14];
      *(_WORD *)(a4 + v17) += *(char *)(v15 + v16);
      int v18 = *(char *)(v15 + v16);
      if (v18 < 0) {
        int v18 = -v18;
      }
      uint64_t result = *(unsigned __int16 *)(a5 + v17);
      *(_WORD *)(a5 + v17) = result + v18;
      if (v16 <= 126) {
        ++v16;
      }
      else {
        int v16 = 0;
      }
      v14 += 2;
    }
    while (v14 != 256);
    if (v6 <= 126) {
      ++v6;
    }
    else {
      int v6 = 0;
    }
    ++v5;
    v13 += 256;
  }
  while (v5 != 128);
  return result;
}

uint64_t Madusa::Demod::_DescrambleAndAccumulateChips(uint64_t a1, void *a2, int *a3, uint64_t a4, uint64_t a5, int8x8_t a6)
{
  a6.i32[0] = *v6 | 0xFFFFFFE0;
  a6.i8[4] = v6[3];
  *(int8x8_t *)v7.i8 = vand_s8(a6, (int8x8_t)0xFF000000FFLL);
  v7.i64[1] = v7.i64[0];
  float32x4_t v8 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v7, (int32x4_t)xmmword_10006DE50));
  v9.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_10006DE60, v8)).u32[0];
  v9.i32[1] = vmovn_s32(vcgtq_f32(v8, (float32x4_t)xmmword_10006DE60)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v9, 0xFuLL))) & ((v6[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    ++QuickCodec::mask;
  }
  return Madusa::Demod::DescrambleAndAccumulateChips(a1, a2, a3, a4, a5);
}

unint64_t Madusa::Demod::XNor(uint64_t a1, unint64_t a2, unint64_t a3, char a4)
{
  unint64_t v5 = a1 + 16;
  unint64_t v6 = a1 + 1096;
  BOOL v8 = a1 + 16 < a2 + 1080 && v6 > a2;
  char v10 = v5 < a3 + 1080 && v6 > a3 || v8;
  if (a4)
  {
    if (v10)
    {
      uint64_t v11 = 0;
    }
    else
    {
      uint64_t v13 = -528;
      uint64_t v11 = 264;
      do
      {
        *(int16x8_t *)(a1 + v13 + 544) = vsubq_s16(*(int16x8_t *)(a2 + v13 + 528), *(int16x8_t *)(a2 + v13 + 1068));
        *(int16x8_t *)(a1 + v13 + 1084) = vaddq_s16(*(int16x8_t *)(a3 + v13 + 528), *(int16x8_t *)(a3 + v13 + 1068));
        v13 += 16;
      }
      while (v13);
    }
    uint64_t v14 = 2 * v11;
    do
    {
      uint64_t v15 = a1 + v14;
      *(_WORD *)(v15 + 16) = *(_WORD *)(a2 + v14) - *(_WORD *)(a2 + v14 + 540);
      *(_WORD *)(v15 + 556) = *(_WORD *)(a3 + v14) + *(_WORD *)(a3 + v14 + 540);
      v14 += 2;
    }
    while (v14 != 540);
  }
  else
  {
    if (v10)
    {
      uint64_t v12 = 0;
    }
    else
    {
      uint64_t v16 = -528;
      uint64_t v12 = 264;
      do
      {
        *(int16x8_t *)(a1 + v16 + 544) = vsubq_s16(*(int16x8_t *)(a2 + v16 + 1068), *(int16x8_t *)(a2 + v16 + 528));
        *(int16x8_t *)(a1 + v16 + 1084) = vaddq_s16(*(int16x8_t *)(a3 + v16 + 528), *(int16x8_t *)(a3 + v16 + 1068));
        v16 += 16;
      }
      while (v16);
    }
    uint64_t v17 = 2 * v12;
    do
    {
      uint64_t v18 = a1 + v17;
      *(_WORD *)(v18 + 16) = *(_WORD *)(a2 + v17 + 540) - *(_WORD *)(a2 + v17);
      *(_WORD *)(v18 + 556) = *(_WORD *)(a3 + v17) + *(_WORD *)(a3 + v17 + 540);
      v17 += 2;
    }
    while (v17 != 540);
  }
  if ((*v4 & 0x1F) != 0 || v4[2] > 0x3Fu)
  {
    if (QuickCodec::mask != -70947757) {
      goto LABEL_36;
    }
    return a1 + 16;
  }
  if (v4[3] != 212 && QuickCodec::mask == -70947757) {
    return a1 + 16;
  }
LABEL_36:
  QuickCodec::masint k = FunctionTable::ft[0] ^ 0x157E9386;
  uint64_t func = __find_func(0xDF9FDF1FC0E04070, 824451274);
  uint64_t v22 = 0;
  while (*(unsigned __int8 *)(func + v22) != ((QuickCodec::mask ^ 0xC12A2DF3) / 0x9D28AF)
       || *(unsigned __int8 *)(func + v22 + 1) != ((QuickCodec::mask ^ 0xFBC56C53) / 0x9D28AF)
       || *(unsigned __int8 *)(func + v22 + 2) != ((QuickCodec::mask ^ 0xDDCAB631) / 0x9D28AF)
       || *(unsigned __int8 *)(func + v22 + 3) != ((QuickCodec::mask ^ 0x79E0DCBFu) / 0x9D28AF))
  {
    v22 += 4;
    if (v22 == 2400) {
      goto LABEL_43;
    }
  }
  uint64_t vars0 = func + v22;
  long long vars8 = 0u;
LABEL_43:
  QuickCodec::mask += 16;
  return v5;
}

unint64_t Madusa::Demod::_XNor(uint64_t a1, unint64_t a2, unint64_t a3, char a4)
{
  unint64_t v5 = 0;
  int v6 = 0;
  if (QuickCodec::mask == -70947757) {
    int v7 = 10172244;
  }
  else {
    int v7 = 349014;
  }
  uint64_t v8 = 1;
  int v9 = 8484510;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v12 = v8;
        if (v9 <= 8484580) {
          break;
        }
        if (v9 == 8484581)
        {
          if ((*v5 & 0x1F) != 0
            || v5[2] > 0x3Fu
            || (uint64_t v8 = 1,
                int v9 = 349014,
                v5[3] != ((QuickCodec::mask ^ v6) / 0xC9D94)))
          {
            int v9 = 349068;
            uint64_t v8 = v12;
          }
        }
        else if (v9 == 8833507)
        {
          unint64_t v5 = (unsigned char *)v4;
          int v9 = 8484527;
        }
        else
        {
          BOOL v13 = v9 == 10172244;
          int v9 = 8484581;
          if (v13) {
            int v6 = -239660349;
          }
        }
      }
      if (v9 <= 8484509) {
        break;
      }
      unsigned int v10 = (QuickCodec::mask != -70947757) | v8;
      if (v9 == 8484527) {
        int v11 = v7;
      }
      else {
        int v11 = v9;
      }
      if (v9 == 8484527) {
        LODWORD(v12) = v10;
      }
      BOOL v13 = v9 == 8484510;
      if (v9 == 8484510) {
        int v9 = 349014;
      }
      else {
        int v9 = v11;
      }
      if (v13) {
        uint64_t v8 = 0;
      }
      else {
        uint64_t v8 = v12;
      }
    }
    if (v9 != 349014) {
      break;
    }
    int v9 = 349068;
    if ((v8 & 1) == 0) {
      int v9 = 8833507;
    }
  }
  if (v8) {
    ++QuickCodec::mask;
  }
  return Madusa::Demod::XNor(a1, a2, a3, a4);
}

BOOL Madusa::Demod::CornerBlocksNeeded(int8x8_t a1, uint64_t a2, float *a3)
{
  float v4 = *a3;
  float v5 = a3[1];
  float v6 = a3[2];
  float v7 = a3[3];
  a1.i8[4] = v3[3];
  a1.i32[0] = *v3 | 0xFFFFFFE0;
  *(int8x8_t *)v8.i8 = vand_s8(a1, (int8x8_t)0xFF000000FFLL);
  v8.i64[1] = v8.i64[0];
  float32x4_t v9 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v8, (int32x4_t)xmmword_10006DE70));
  v10.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_10006DE80, v9)).u32[0];
  v10.i32[1] = vmovn_s32(vcgtq_f32(v9, (float32x4_t)xmmword_10006DE80)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v10, 0xFuLL))) & ((v3[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    QuickCodec::masint k = FunctionTable::ft[0] ^ 0x157E9386;
    uint64_t func = (void (*)(void, uint64_t))__find_func(0xBFBF1F1FC0C00040, 1359274186);
    func(0, 104);
  }
  float v12 = atan2f(v4, v6);
  float v13 = sinf(v12 + v12);
  float v14 = (float)(v5 * v5) + (float)(v7 * v7);
  float v15 = (float)(v4 * v4) + (float)(v6 * v6);
  float v16 = sqrtf((float)(sqrtf(fmaxf((float)((float)-(float)((float)(v14 * v15)- (float)((float)((float)(v5 * v4) + (float)(v7 * v6))* (float)((float)(v5 * v4) + (float)(v7 * v6))))* 4.0)+ (float)((float)(v14 + v15) * (float)(v14 + v15)), 0.0))+ (float)(v14 + v15))* 0.5);
  return (float)(v16 + (float)(v16 * (float)(-0.29289 * fabsf(v13)))) > 1.0;
}

BOOL Madusa::Demod::_CornerBlocksNeeded(int8x8_t a1, uint64_t a2, float *a3)
{
  if ((*v3 & 0x1F) != 0 || v3[2] > 0x3Fu)
  {
    int v4 = QuickCodec::mask;
    if (QuickCodec::mask != -70947757) {
LABEL_10:
    }
      QuickCodec::masint k = v4 + 1;
  }
  else
  {
    int v4 = QuickCodec::mask;
    if (v3[3] == 212 || QuickCodec::mask != -70947757) {
      goto LABEL_10;
    }
  }
  return Madusa::Demod::CornerBlocksNeeded(a1, a2, a3);
}

BOOL Madusa::Demod::SideBlocksNeeded(uint64_t a1, float *a2)
{
  float v3 = *a2;
  float v4 = a2[1];
  float v5 = a2[2];
  float v6 = a2[3];
  if ((*v2 & 0x1F) != 0 || v2[2] > 0x3Fu)
  {
    if (QuickCodec::mask == -70947757) {
      goto LABEL_13;
    }
    goto LABEL_10;
  }
  if (v2[3] == 212 || QuickCodec::mask != -70947757)
  {
LABEL_10:
    unint64_t v8 = 0;
    int v9 = FunctionTable::ft[0] ^ 0x157E9386;
    QuickCodec::masint k = FunctionTable::ft[0] ^ 0x157E9386;
    int v10 = -1;
    do
    {
      qword_100074AF8[v10
                    + 1
                    + ((FunctionTable::swapTable[v8] ^ v9) / 0x9D28AF)] = qword_100074AF8[v10 + ((FunctionTable::swapTable[v8 + 1] ^ v9) / 0x9D28AF)];
      v10 -= 2;
      BOOL v11 = v8 >= 0x20;
      v8 += 2;
    }
    while (!v11);
  }
LABEL_13:
  float v12 = atan2f(v3, v5);
  float v13 = sinf(v12 + v12);
  float v14 = (float)(v4 * v4) + (float)(v6 * v6);
  float v15 = (float)(v3 * v3) + (float)(v5 * v5);
  float v16 = sqrtf((float)(sqrtf(fmaxf((float)((float)-(float)((float)(v14 * v15)- (float)((float)((float)(v4 * v3) + (float)(v6 * v5))* (float)((float)(v4 * v3) + (float)(v6 * v5))))* 4.0)+ (float)((float)(v14 + v15) * (float)(v14 + v15)), 0.0))+ (float)(v14 + v15))* 0.5);
  return (float)(v16 + (float)(v16 * (float)(0.4142 * fabsf(v13)))) > 0.97692;
}

BOOL Madusa::Demod::_SideBlocksNeeded(uint64_t a1, float *a2)
{
  if ((*v2 & 0x1F) != 0 || v2[2] > 0x3Fu)
  {
    int v3 = QuickCodec::mask;
    if (QuickCodec::mask != -70947757) {
LABEL_10:
    }
      QuickCodec::masint k = v3 + 1;
  }
  else
  {
    int v3 = QuickCodec::mask;
    if (v2[3] == 212 || QuickCodec::mask != -70947757) {
      goto LABEL_10;
    }
  }
  return Madusa::Demod::SideBlocksNeeded(a1, a2);
}

void sub_10001FAB4()
{
}

void sub_10001FAC8()
{
}

void sub_10001FADC()
{
}

uint64_t Madusa::SubBytePixelDirectionAndOffset::Reset(uint64_t result, int a2, int a3, unsigned int a4)
{
  *(_DWORD *)uint64_t result = a3;
  *(unsigned char *)(result + 4) = 1;
  *(_DWORD *)(result + 8) = a4;
  *(unsigned char *)(result + 12) = 1;
  if ((a2 - 1) <= 6)
  {
    if (a4 <= 7 && !(a4 % a2)) {
      return result;
    }
LABEL_7:
    *(unsigned char *)(result + 12) = 0;
    *(unsigned char *)(result + 4) = 0;
    return result;
  }
  if (a2 == -1 || a4) {
    goto LABEL_7;
  }
  return result;
}

uint64_t Madusa::SubBytePixelDirectionAndOffset::SubBytePixelDirectionAndOffset(uint64_t this)
{
  *(_DWORD *)this = 1;
  *(unsigned char *)(this + 4) = 1;
  *(_DWORD *)(this + 8) = 0;
  *(unsigned char *)(this + 12) = 1;
  return this;
}

BOOL Madusa::SubBytePixelDirectionAndOffset::IsValid(Madusa::SubBytePixelDirectionAndOffset *this)
{
  return *((unsigned char *)this + 12) && *((unsigned char *)this + 4) != 0;
}

void *Madusa::FilterFMag::FilterFMag(void *a1, uint64_t a2)
{
  *a1 = a2;
  bzero(a1 + 1, 0x220uLL);
  return a1;
}

float *Madusa::FilterFMag::Execute(float *a1, uint64_t a2)
{
  float v4 = a1 + 34;
  float v5 = *(uint64_t **)a1;
  bzero((void *)(**(void **)a1 + 8), 0x8200uLL);
  float v6 = a1 + 2;
  float v7 = a1 + 66;
  unint64_t v8 = a1 + 98;
  unint64_t v9 = a2 + 66584;
  if ((unint64_t)v4 >= a2 + 68632 || v9 >= (unint64_t)(a1 + 130))
  {
    uint64_t v28 = 0;
    int32x4_t v29 = (const float *)(a2 + 66584);
    do
    {
      float32x4x4_t v95 = vld4q_f32(v29);
      v29 += 16;
      float v30 = (const float *)(v9 + 512);
      float32x4x4_t v97 = vld4q_f32(v30);
      unsigned int v31 = (const float *)(v9 + 1024);
      float32x4x4_t v99 = vld4q_f32(v31);
      float v32 = (const float *)(v9 + 1536);
      float32x4x4_t v101 = vld4q_f32(v32);
      int v33 = (float32x4_t *)&v8[v28];
      v33[-16] = vminnmq_f32(vminnmq_f32(vminnmq_f32(vminnmq_f32(v95.val[0], vminnmq_f32(v95.val[1], vminnmq_f32(v95.val[2], v95.val[3]))), vminnmq_f32(v97.val[0], vminnmq_f32(v97.val[1], vminnmq_f32(v97.val[2], v97.val[3])))), vminnmq_f32(v99.val[0], vminnmq_f32(v99.val[1], vminnmq_f32(v99.val[2], v99.val[3])))), vminnmq_f32(v101.val[0], vminnmq_f32(v101.val[1], vminnmq_f32(v101.val[2], v101.val[3]))));
      *int v33 = vmaxnmq_f32(vmaxnmq_f32(vmaxnmq_f32(vmaxnmq_f32(v95.val[0], vmaxnmq_f32(v95.val[1], vmaxnmq_f32(v95.val[2], v95.val[3]))), vmaxnmq_f32(v97.val[0], vmaxnmq_f32(v97.val[1], vmaxnmq_f32(v97.val[2], v97.val[3])))), vmaxnmq_f32(v99.val[0], vmaxnmq_f32(v99.val[1], vmaxnmq_f32(v99.val[2], v99.val[3])))), vmaxnmq_f32(v101.val[0], vmaxnmq_f32(v101.val[1], vmaxnmq_f32(v101.val[2], v101.val[3]))));
      v28 += 4;
      unint64_t v9 = (unint64_t)v29;
    }
    while (v28 != 32);
  }
  else
  {
    for (uint64_t i = 0; i != 32; ++i)
    {
      float v11 = *(float *)(v9 + 4);
      float v12 = *(float *)(v9 + 8);
      float v13 = *(float *)(v9 + 12);
      float v14 = *(float *)(v9 + 512);
      float v15 = *(float *)(v9 + 516);
      float v16 = *(float *)(v9 + 520);
      float v17 = *(float *)(v9 + 524);
      float v18 = *(float *)(v9 + 1024);
      float v19 = *(float *)(v9 + 1028);
      float v20 = *(float *)(v9 + 1032);
      float v21 = *(float *)(v9 + 1036);
      float v22 = *(float *)(v9 + 1536);
      float v23 = *(float *)(v9 + 1540);
      float v24 = *(float *)(v9 + 1544);
      float v25 = *(float *)(v9 + 1548);
      float v26 = fmaxf(fmaxf(fmaxf(fmaxf(*(float *)v9, fmaxf(v11, fmaxf(v12, v13))), fmaxf(v14, fmaxf(v15, fmaxf(v16, v17)))), fmaxf(v18, fmaxf(v19, fmaxf(v20, v21)))), fmaxf(v22, fmaxf(v23, fmaxf(v24, v25))));
      float32x4_t v27 = &v8[i];
      *(v27 - 64) = fminf(fminf(fminf(fminf(*(float *)v9, fminf(v11, fminf(v12, v13))), fminf(v14, fminf(v15, fminf(v16, v17)))), fminf(v18, fminf(v19, fminf(v20, v21)))), fminf(v22, fminf(v23, fminf(v24, v25))));
      *float32x4_t v27 = v26;
      v9 += 16;
    }
  }
  uint64_t v34 = 0;
  unint64_t v35 = 0;
  fenv_t v36 = (const float *)(a2 + 68632);
  uint64_t v37 = a2 + 66600;
  uint64_t v38 = 36;
  unint64_t v39 = a1 + 98;
  uint64_t result = a1 + 66;
  unint64_t v41 = (unint64_t)v4;
  unint64_t v42 = (unint64_t)(a1 + 2);
  do
  {
    unint64_t v43 = v41;
    unint64_t v44 = v39;
    *((void *)a1 + 65) = v43;
    *((void *)a1 + 66) = v42;
    *((void *)a1 + 67) = v39;
    *((void *)a1 + 68) = result;
    uint64_t v45 = a2 + (v34 << 11);
    unint64_t v46 = v45 + 70680;
    unint64_t v47 = v45 + 68632;
    unint64_t v48 = v42 + 128;
    unint64_t v49 = (unint64_t)(result + 32);
    BOOL v50 = v45 + 70680 <= v42 || v47 >= v48;
    char v51 = !v50;
    BOOL v53 = v46 > (unint64_t)result && v47 < v49;
    BOOL v54 = v48 > (unint64_t)result && v49 > v42;
    if (v54 || (v51 & 1) != 0 || v53)
    {
      uint64_t v61 = 0;
      char v62 = result;
      int v63 = (float *)v42;
      do
      {
        int8x16_t v64 = (int8x16_t)vrev64q_s32(*(int32x4_t *)&v36[v61 + 128]);
        float32x4_t v65 = (float32x4_t)vextq_s8(v64, v64, 8uLL);
        int8x16_t v66 = (int8x16_t)vrev64q_s32(*(int32x4_t *)&v36[v61]);
        float32x4_t v67 = (float32x4_t)vextq_s8(v66, v66, 8uLL);
        int8x16_t v68 = (int8x16_t)vrev64q_s32(*(int32x4_t *)&v36[v61 + 384]);
        float32x4_t v69 = (float32x4_t)vextq_s8(v68, v68, 8uLL);
        int8x16_t v70 = (int8x16_t)vrev64q_s32(*(int32x4_t *)&v36[v61 + 256]);
        float32x4_t v71 = (float32x4_t)vextq_s8(v70, v70, 8uLL);
        *v63++ = vminnmvq_f32(vminnmq_f32(vminnmq_f32(v69, v65), vminnmq_f32(v71, v67)));
        *v62++ = vmaxnmvq_f32(vmaxnmq_f32(vmaxnmq_f32(v67, v65), vmaxnmq_f32(v71, v69)));
        v61 += 4;
      }
      while (v61 != 128);
    }
    else
    {
      uint64_t v55 = 0;
      unsigned int v56 = v36;
      unsigned __int8 v57 = v36;
      do
      {
        float32x4x4_t v96 = vld4q_f32(v57);
        v57 += 16;
        uint64_t v58 = v56 + 128;
        float32x4x4_t v98 = vld4q_f32(v58);
        uint64_t v59 = v56 + 256;
        float32x4x4_t v100 = vld4q_f32(v59);
        uint64_t v60 = v56 + 384;
        float32x4x4_t v102 = vld4q_f32(v60);
        *(float32x4_t *)(v42 + v55 * 4) = vminnmq_f32(vminnmq_f32(vminnmq_f32(vminnmq_f32(v96.val[0], vminnmq_f32(v96.val[1], vminnmq_f32(v96.val[2], v96.val[3]))), vminnmq_f32(v98.val[0], vminnmq_f32(v98.val[1], vminnmq_f32(v98.val[2], v98.val[3])))), vminnmq_f32(v100.val[0], vminnmq_f32(v100.val[1], vminnmq_f32(v100.val[2], v100.val[3])))), vminnmq_f32(v102.val[0], vminnmq_f32(v102.val[1], vminnmq_f32(v102.val[2], v102.val[3]))));
        *(float32x4_t *)&result[v55] = vmaxnmq_f32(vmaxnmq_f32(vmaxnmq_f32(vmaxnmq_f32(v96.val[0], vmaxnmq_f32(v96.val[1], vmaxnmq_f32(v96.val[2], v96.val[3]))), vmaxnmq_f32(v98.val[0], vmaxnmq_f32(v98.val[1], vmaxnmq_f32(v98.val[2], v98.val[3])))), vmaxnmq_f32(v100.val[0], vmaxnmq_f32(v100.val[1], vmaxnmq_f32(v100.val[2], v100.val[3])))), vmaxnmq_f32(v102.val[0], vmaxnmq_f32(v102.val[1], vmaxnmq_f32(v102.val[2], v102.val[3]))));
        v55 += 4;
        unsigned int v56 = v57;
      }
      while (v55 != 32);
    }
    float v72 = fminf(*v6, *v4);
    float v73 = fmaxf(*v7, *v8);
    uint64_t v74 = *v5;
    uint64_t v75 = *v5 + v38;
    uint64_t v76 = v37;
    for (uint64_t j = 1; j != 32; ++j)
    {
      float v78 = v73;
      float v79 = v72;
      float v72 = fminf(v6[j], v4[j]);
      float v73 = fmaxf(v7[j], v8[j]);
      float v80 = fminf(v79, v72);
      float v81 = fmaxf(v78, v73);
      float v82 = 0.0;
      if (v81 > v80) {
        float v82 = 1.0 / (float)(v81 - v80);
      }
      uint64_t v83 = 0;
      do
      {
        int v84 = (float *)(v75 + v83);
        float v85 = *(float *)(v75 + v83 - 24);
        *(v84 - 7) = *(float *)(v75 + v83 - 28) + (float)((float)(*(float *)(v76 + v83 - 16) - v80) * v82);
        *(v84 - 6) = v85 + (float)((float)(*(float *)(v76 + v83 - 12) - v80) * v82);
        float v86 = *(float *)(v75 + v83 - 16);
        *(v84 - 5) = *(float *)(v75 + v83 - 20) + (float)((float)(*(float *)(v76 + v83 - 8) - v80) * v82);
        *(v84 - 4) = v86 + (float)((float)(*(float *)(v76 + v83 - 4) - v80) * v82);
        float v87 = *(float *)(v75 + v83 - 8);
        *(v84 - 3) = *(float *)(v75 + v83 - 12) + (float)((float)(*(float *)(v76 + v83) - v80) * v82);
        *(v84 - 2) = v87 + (float)((float)(*(float *)(v76 + v83 + 4) - v80) * v82);
        *(v84 - 1) = *(float *)(v75 + v83 - 4) + (float)((float)(*(float *)(v76 + v83 + 8) - v80) * v82);
        *int v84 = *(float *)(v75 + v83) + (float)((float)(*(float *)(v76 + v83 + 12) - v80) * v82);
        v83 += 512;
      }
      while (v83 != 4096);
      v75 += 16;
      v76 += 16;
    }
    ++v34;
    v36 += 512;
    v38 += 2048;
    v37 += 2048;
    unint64_t v39 = result;
    uint64_t result = v44;
    unint64_t v41 = v42;
    unint64_t v42 = v43;
    BOOL v50 = v35 >= 0x36;
    v35 += 4;
  }
  while (!v50);
  uint64_t v88 = -33280;
  float32x4_t v89 = (float32x4_t)vdupq_n_s32(0x3FB50481u);
  do
  {
    uint64_t v90 = v74 + v88;
    *(float32x4_t *)(v90 + 33288) = vmulq_f32(*(float32x4_t *)(v74 + v88 + 33288), v89);
    *(float32x4_t *)(v90 + 33784) = vmulq_f32(*(float32x4_t *)(v74 + v88 + 33784), v89);
    v88 += 512;
  }
  while (v88);
  uint64_t v91 = v74 + 30728;
  float32x4_t v92 = (float32x4_t)vdupq_n_s32(0x3FB50481u);
  do
  {
    *(float32x4_t *)(v74 + v88 + 8) = vmulq_f32(*(float32x4_t *)(v74 + v88 + 8), v92);
    uint64_t v93 = (float32x4_t *)(v91 + v88);
    v93[96] = vmulq_f32(*(float32x4_t *)(v91 + v88 + 1536), v92);
    *(float32x4_t *)(v74 + v88 + 520) = vmulq_f32(*(float32x4_t *)(v74 + v88 + 520), v92);
    v93[64] = vmulq_f32(*(float32x4_t *)(v91 + v88 + 1024), v92);
    *(float32x4_t *)(v74 + v88 + 1032) = vmulq_f32(*(float32x4_t *)(v74 + v88 + 1032), v92);
    v93[32] = vmulq_f32(*(float32x4_t *)(v91 + v88 + 512), v92);
    float32x4_t v94 = *(float32x4_t *)(v91 + v88);
    *(float32x4_t *)(v74 + v88 + 1544) = vmulq_f32(*(float32x4_t *)(v74 + v88 + 1544), v92);
    *(float32x4_t *)(v91 + v88) = vmulq_f32(v94, v92);
    v88 += 16;
  }
  while (v88 != 512);
  return result;
}

float *Madusa::FilterFMag::_Execute(float *a1, uint64_t a2, int8x8_t a3)
{
  a3.i32[0] = *v3 | 0xFFFFFFE0;
  a3.i8[4] = v3[3];
  *(int8x8_t *)v4.i8 = vand_s8(a3, (int8x8_t)0xFF000000FFLL);
  v4.i64[1] = v4.i64[0];
  float32x4_t v5 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v4, (int32x4_t)xmmword_10006DEE0));
  v6.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_10006DEF0, v5)).u32[0];
  v6.i32[1] = vmovn_s32(vcgtq_f32(v5, (float32x4_t)xmmword_10006DEF0)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v6, 0xFuLL))) & ((v3[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    ++QuickCodec::mask;
  }
  return Madusa::FilterFMag::Execute(a1, a2);
}

void Madusa::FilterFMag::_Execute_Alt(uint64_t a1, int8x8_t a2)
{
  a2.i32[0] = *v2 | 0xFFFFFFE0;
  a2.i8[4] = v2[3];
  *(int8x8_t *)v3.i8 = vand_s8(a2, (int8x8_t)0xFF000000FFLL);
  v3.i64[1] = v3.i64[0];
  float32x4_t v4 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v3, (int32x4_t)xmmword_10006DF00));
  v5.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_10006DF10, v4)).u32[0];
  v5.i32[1] = vmovn_s32(vcgtq_f32(v4, (float32x4_t)xmmword_10006DF10)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v5, 0xFuLL))) & ((v2[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    ++QuickCodec::mask;
  }
  Madusa::FilterFMag::Execute_Alt(a1);
}

void Madusa::FilterFMag::Execute_Alt(uint64_t a1)
{
}

float Madusa::RefineCandidates::TransformSinglePoint(float *a1, uint64_t a2, float a3, float a4)
{
  float v4 = (float)(*a1 * a3) + (float)(a1[1] * a4);
  float v5 = (float)(a1[2] * a3) + (float)(a1[3] * a4);
  *(float *)(a2 + 16) = v5;
  *(float *)(a2 + 20) = v4;
  float v6 = -v4;
  if (v4 >= 0.0) {
    float v6 = v4;
  }
  else {
    float v5 = -v5;
  }
  *(unsigned char *)(a2 + 24) = v4 < 0.0;
  float v7 = fminf(fmaxf(v5, -999.0), 999.0);
  int v8 = (int)(float)(v7 + 1000.0) - 1000;
  *(_DWORD *)a2 = v8;
  *(_DWORD *)(a2 + 4) = (int)v6;
  float result = v7 - (float)v8;
  *(float *)(a2 + 8) = result;
  *(float *)(a2 + 12) = v6 - truncf(v6);
  return result;
}

void Madusa::RefineCandidates::Execute(uint64_t a1, long long *a2, void *a3, float *a4, int *a5)
{
  *a5 = 0;
  long long v15 = *a2;
  sub_1000204F0(a1, (float *)&v15, a3, a4, a5);
  if (&v15 != (long long *)a4) {
    long long v15 = *(_OWORD *)a4;
  }
  sub_100020944(a1, (float *)&v15, a3, a4, a5);
  if ((*v5 & 0x1F) != 0 || v5[2] > 0x3Fu)
  {
    if (QuickCodec::mask == -70947757) {
      return;
    }
    goto LABEL_12;
  }
  if (v5[3] == 212 || QuickCodec::mask != -70947757)
  {
LABEL_12:
    unint64_t v11 = 0;
    int v12 = FunctionTable::ft[0] ^ 0x157E9386;
    QuickCodec::masint k = FunctionTable::ft[0] ^ 0x157E9386;
    int v13 = -1;
    do
    {
      qword_100074AF8[v13
                    + 1
                    + ((FunctionTable::swapTable[v11] ^ v12) / 0x9D28AF)] = qword_100074AF8[v13 + ((FunctionTable::swapTable[v11 + 1] ^ v12) / 0x9D28AF)];
      v13 -= 2;
      BOOL v14 = v11 >= 0x20;
      v11 += 2;
    }
    while (!v14);
  }
}

float sub_1000204F0(uint64_t a1, float *a2, void *a3, float *a4, int *a5)
{
  int v9 = 5 * *a5;
  if (a4 != a2) {
    *(_OWORD *)a4 = *(_OWORD *)a2;
  }
  int v10 = 2 * v9;
  float v11 = sub_1000211F4(a1, a3, a4);
  long long v46 = *(_OWORD *)a4;
  if (&v46 == (long long *)a4)
  {
    float v15 = sub_10002135C(a1, a3, a4);
    if (v15 > v11)
    {
      *a5 = v10 | 1;
      float v11 = v15;
      float v16 = sub_10002135C(a1, a3, a4);
      if (v16 <= v11)
      {
LABEL_10:
        float v17 = sub_10002135C(a1, a3, a4);
        if (v17 <= v11) {
          return v11;
        }
LABEL_24:
        float v32 = v17;
        *a5 = v10 + 3;
        float v33 = sub_10002135C(a1, a3, a4);
        float v11 = v32;
        if (v33 > v32)
        {
          float v34 = v33;
          *a5 = v10 + 4;
          float v35 = sub_10002135C(a1, a3, a4);
          float v11 = v34;
          if (v35 > v34)
          {
            float v36 = v35;
            *a5 = v10 + 5;
            float v37 = sub_10002135C(a1, a3, a4);
            float v11 = v36;
            if (v37 > v36)
            {
              float v38 = v37;
              *a5 = v10 + 6;
              float v39 = sub_10002135C(a1, a3, a4);
              float v11 = v38;
              if (v39 > v38)
              {
                float v40 = v39;
                *a5 = v10 + 7;
                float v41 = sub_10002135C(a1, a3, a4);
                float v11 = v40;
                if (v41 > v40)
                {
                  float v42 = v41;
                  *a5 = v10 + 8;
                  float v43 = sub_10002135C(a1, a3, a4);
                  float v11 = v42;
                  if (v43 > v42)
                  {
                    float v44 = v43;
                    *a5 = v10 + 9;
                    float v31 = sub_10002135C(a1, a3, a4);
                    float v11 = v44;
                    if (v31 > v44) {
                      goto LABEL_31;
                    }
                  }
                }
              }
            }
          }
        }
        return v11;
      }
    }
    else
    {
      float v16 = sub_10002135C(a1, a3, a4);
      if (v16 <= v11) {
        goto LABEL_10;
      }
    }
    *a5 = v10 + 2;
    float v11 = v16;
    float v17 = sub_10002135C(a1, a3, a4);
    if (v17 <= v11) {
      return v11;
    }
    goto LABEL_24;
  }
  float v12 = sub_10002135C(a1, a3, (float *)&v46);
  if (v12 <= v11)
  {
    float v13 = sub_10002135C(a1, a3, (float *)&v46);
    if (v13 <= v11) {
      goto LABEL_6;
    }
LABEL_13:
    *(_OWORD *)a4 = v46;
    *a5 = v10 + 2;
    float v11 = v13;
    float v14 = sub_10002135C(a1, a3, (float *)&v46);
    if (v14 <= v11) {
      return v11;
    }
    goto LABEL_14;
  }
  *(_OWORD *)a4 = v46;
  *a5 = v10 | 1;
  float v11 = v12;
  float v13 = sub_10002135C(a1, a3, (float *)&v46);
  if (v13 > v11) {
    goto LABEL_13;
  }
LABEL_6:
  float v14 = sub_10002135C(a1, a3, (float *)&v46);
  if (v14 <= v11) {
    return v11;
  }
LABEL_14:
  float v18 = v14;
  *(_OWORD *)a4 = v46;
  *a5 = v10 + 3;
  float v19 = sub_10002135C(a1, a3, (float *)&v46);
  float v11 = v18;
  if (v19 > v18)
  {
    float v20 = v19;
    *(_OWORD *)a4 = v46;
    *a5 = v10 + 4;
    float v21 = sub_10002135C(a1, a3, (float *)&v46);
    float v11 = v20;
    if (v21 > v20)
    {
      float v22 = v21;
      *(_OWORD *)a4 = v46;
      *a5 = v10 + 5;
      float v23 = sub_10002135C(a1, a3, (float *)&v46);
      float v11 = v22;
      if (v23 > v22)
      {
        float v24 = v23;
        *(_OWORD *)a4 = v46;
        *a5 = v10 + 6;
        float v25 = sub_10002135C(a1, a3, (float *)&v46);
        float v11 = v24;
        if (v25 > v24)
        {
          float v26 = v25;
          *(_OWORD *)a4 = v46;
          *a5 = v10 + 7;
          float v27 = sub_10002135C(a1, a3, (float *)&v46);
          float v11 = v26;
          if (v27 > v26)
          {
            float v28 = v27;
            *(_OWORD *)a4 = v46;
            *a5 = v10 + 8;
            float v29 = sub_10002135C(a1, a3, (float *)&v46);
            float v11 = v28;
            if (v29 > v28)
            {
              float v30 = v29;
              *(_OWORD *)a4 = v46;
              *a5 = v10 + 9;
              float v31 = sub_10002135C(a1, a3, (float *)&v46);
              float v11 = v30;
              if (v31 > v30)
              {
                *(_OWORD *)a4 = v46;
LABEL_31:
                *a5 = v10 + 10;
                return v31;
              }
            }
          }
        }
      }
    }
  }
  return v11;
}

float sub_100020944(uint64_t a1, float *a2, void *a3, float *a4, int *a5)
{
  int v9 = 5 * *a5;
  if (a4 != a2) {
    *(_OWORD *)a4 = *(_OWORD *)a2;
  }
  int v10 = 2 * v9;
  float v11 = sub_100021488(a1, a3, a4);
  long long v46 = *(_OWORD *)a4;
  if (&v46 == (long long *)a4)
  {
    float v15 = sub_1000215F0(a1, a3, a4);
    if (v15 > v11)
    {
      *a5 = v10 | 1;
      float v11 = v15;
      float v16 = sub_1000215F0(a1, a3, a4);
      if (v16 <= v11)
      {
LABEL_10:
        float v17 = sub_1000215F0(a1, a3, a4);
        if (v17 <= v11) {
          return v11;
        }
LABEL_24:
        float v32 = v17;
        *a5 = v10 + 3;
        float v33 = sub_1000215F0(a1, a3, a4);
        float v11 = v32;
        if (v33 > v32)
        {
          float v34 = v33;
          *a5 = v10 + 4;
          float v35 = sub_1000215F0(a1, a3, a4);
          float v11 = v34;
          if (v35 > v34)
          {
            float v36 = v35;
            *a5 = v10 + 5;
            float v37 = sub_1000215F0(a1, a3, a4);
            float v11 = v36;
            if (v37 > v36)
            {
              float v38 = v37;
              *a5 = v10 + 6;
              float v39 = sub_1000215F0(a1, a3, a4);
              float v11 = v38;
              if (v39 > v38)
              {
                float v40 = v39;
                *a5 = v10 + 7;
                float v41 = sub_1000215F0(a1, a3, a4);
                float v11 = v40;
                if (v41 > v40)
                {
                  float v42 = v41;
                  *a5 = v10 + 8;
                  float v43 = sub_1000215F0(a1, a3, a4);
                  float v11 = v42;
                  if (v43 > v42)
                  {
                    float v44 = v43;
                    *a5 = v10 + 9;
                    float v31 = sub_1000215F0(a1, a3, a4);
                    float v11 = v44;
                    if (v31 > v44) {
                      goto LABEL_31;
                    }
                  }
                }
              }
            }
          }
        }
        return v11;
      }
    }
    else
    {
      float v16 = sub_1000215F0(a1, a3, a4);
      if (v16 <= v11) {
        goto LABEL_10;
      }
    }
    *a5 = v10 + 2;
    float v11 = v16;
    float v17 = sub_1000215F0(a1, a3, a4);
    if (v17 <= v11) {
      return v11;
    }
    goto LABEL_24;
  }
  float v12 = sub_1000215F0(a1, a3, (float *)&v46);
  if (v12 <= v11)
  {
    float v13 = sub_1000215F0(a1, a3, (float *)&v46);
    if (v13 <= v11) {
      goto LABEL_6;
    }
LABEL_13:
    *(_OWORD *)a4 = v46;
    *a5 = v10 + 2;
    float v11 = v13;
    float v14 = sub_1000215F0(a1, a3, (float *)&v46);
    if (v14 <= v11) {
      return v11;
    }
    goto LABEL_14;
  }
  *(_OWORD *)a4 = v46;
  *a5 = v10 | 1;
  float v11 = v12;
  float v13 = sub_1000215F0(a1, a3, (float *)&v46);
  if (v13 > v11) {
    goto LABEL_13;
  }
LABEL_6:
  float v14 = sub_1000215F0(a1, a3, (float *)&v46);
  if (v14 <= v11) {
    return v11;
  }
LABEL_14:
  float v18 = v14;
  *(_OWORD *)a4 = v46;
  *a5 = v10 + 3;
  float v19 = sub_1000215F0(a1, a3, (float *)&v46);
  float v11 = v18;
  if (v19 > v18)
  {
    float v20 = v19;
    *(_OWORD *)a4 = v46;
    *a5 = v10 + 4;
    float v21 = sub_1000215F0(a1, a3, (float *)&v46);
    float v11 = v20;
    if (v21 > v20)
    {
      float v22 = v21;
      *(_OWORD *)a4 = v46;
      *a5 = v10 + 5;
      float v23 = sub_1000215F0(a1, a3, (float *)&v46);
      float v11 = v22;
      if (v23 > v22)
      {
        float v24 = v23;
        *(_OWORD *)a4 = v46;
        *a5 = v10 + 6;
        float v25 = sub_1000215F0(a1, a3, (float *)&v46);
        float v11 = v24;
        if (v25 > v24)
        {
          float v26 = v25;
          *(_OWORD *)a4 = v46;
          *a5 = v10 + 7;
          float v27 = sub_1000215F0(a1, a3, (float *)&v46);
          float v11 = v26;
          if (v27 > v26)
          {
            float v28 = v27;
            *(_OWORD *)a4 = v46;
            *a5 = v10 + 8;
            float v29 = sub_1000215F0(a1, a3, (float *)&v46);
            float v11 = v28;
            if (v29 > v28)
            {
              float v30 = v29;
              *(_OWORD *)a4 = v46;
              *a5 = v10 + 9;
              float v31 = sub_1000215F0(a1, a3, (float *)&v46);
              float v11 = v30;
              if (v31 > v30)
              {
                *(_OWORD *)a4 = v46;
LABEL_31:
                *a5 = v10 + 10;
                return v31;
              }
            }
          }
        }
      }
    }
  }
  return v11;
}

void Madusa::RefineCandidates::_Execute(uint64_t a1, long long *a2, void *a3, float *a4, int *a5)
{
  float v6 = 0;
  int v7 = 0;
  if (QuickCodec::mask == -70947757) {
    int v8 = 8968641;
  }
  else {
    int v8 = 167620;
  }
  uint64_t v9 = 1;
  int v10 = 1235656;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v13 = v9;
        if (v10 <= 1235726) {
          break;
        }
        if (v10 == 1235727)
        {
          if ((*v6 & 0x1F) != 0
            || v6[2] > 0x3Fu
            || (uint64_t v9 = 1,
                int v10 = 167620,
                v6[3] != ((QuickCodec::mask ^ v7) / 0x27228F)))
          {
            int v10 = 167674;
            uint64_t v9 = v13;
          }
        }
        else if (v10 == 1403259)
        {
          float v6 = (unsigned char *)v5;
          int v10 = 1235673;
        }
        else
        {
          BOOL v14 = v10 == 8968641;
          int v10 = 1235727;
          if (v14) {
            int v7 = -609357249;
          }
        }
      }
      if (v10 <= 1235655) {
        break;
      }
      unsigned int v11 = (QuickCodec::mask != -70947757) | v9;
      if (v10 == 1235673) {
        int v12 = v8;
      }
      else {
        int v12 = v10;
      }
      if (v10 == 1235673) {
        LODWORD(v13) = v11;
      }
      BOOL v14 = v10 == 1235656;
      if (v10 == 1235656) {
        int v10 = 167620;
      }
      else {
        int v10 = v12;
      }
      if (v14) {
        uint64_t v9 = 0;
      }
      else {
        uint64_t v9 = v13;
      }
    }
    if (v10 != 167620) {
      break;
    }
    int v10 = 167674;
    if ((v9 & 1) == 0) {
      int v10 = 1403259;
    }
  }
  if (v9) {
    ++QuickCodec::mask;
  }
  Madusa::RefineCandidates::Execute(a1, a2, a3, a4, a5);
}

float Madusa::RefineCandidates::_Execute_Alt(uint64_t a1, _OWORD *a2, uint64_t a3, _OWORD *a4)
{
  unint64_t v5 = 0;
  int v6 = 0;
  if (QuickCodec::mask == -70947757) {
    int v7 = 8588659;
  }
  else {
    int v7 = 7301804;
  }
  uint64_t v8 = 1;
  int v9 = 1015293;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v11 = v8;
        if (v9 > 7301803) {
          break;
        }
        if (v9 == 1015293)
        {
          uint64_t v8 = 0;
          int v9 = 7301804;
        }
        else if (v9 == 1015310)
        {
          uint64_t v8 = (QuickCodec::mask != -70947757) | v8;
          int v9 = v7;
        }
        else if ((*v5 & 0x1F) != 0 {
               || v5[2] > 0x3Fu
        }
               || (uint64_t v8 = 1,
                   int v9 = 7301804,
                   v5[3] != ((QuickCodec::mask ^ v6) / 0x9CFF3F)))
        {
          int v9 = 7301858;
          uint64_t v8 = v11;
        }
      }
      if (v9 <= 8317079) {
        break;
      }
      if (v9 == 8317080)
      {
        unint64_t v5 = v4;
        int v9 = 1015310;
      }
      else
      {
        BOOL v10 = v9 == 8588659;
        int v9 = 1015364;
        if (v10) {
          int v6 = 2043022463;
        }
      }
    }
    if (v9 != 7301804) {
      break;
    }
    int v9 = 7301858;
    if ((v8 & 1) == 0) {
      int v9 = 8317080;
    }
  }
  if (v8) {
    ++QuickCodec::mask;
  }
  Madusa::RefineCandidates::Execute_Alt(1015310, a2, 1015364, a4);
  return 6.2832;
}

float Madusa::RefineCandidates::Execute_Alt(uint64_t a1, _OWORD *a2, uint64_t a3, _OWORD *a4)
{
  *a4 = *a2;
  return 6.2832;
}

float Madusa::RefineCandidates::TransformRefSignalCoords(float *a1, uint64_t a2)
{
  uint64_t v2 = 0;
  uint64_t v3 = a2 + 12;
  do
  {
    float v4 = (float)*(int *)((char *)&Madusa::AffineTransform::mGridPointV + v2);
    float v5 = (float)*(int *)((char *)&Madusa::AffineTransform::mGridPointU + v2);
    float v6 = (float)(*a1 * v4) + (float)(a1[1] * v5);
    float v7 = (float)(a1[2] * v4) + (float)(a1[3] * v5);
    *(float *)(v3 + 4) = v7;
    *(float *)(v3 + 8) = v6;
    float v8 = -v6;
    float v9 = -v7;
    if (v6 < 0.0)
    {
      char v10 = 1;
    }
    else
    {
      float v9 = v7;
      float v8 = v6;
      char v10 = 0;
    }
    float v11 = fminf(fmaxf(v9, -999.0), 999.0);
    *(unsigned char *)(v3 + 12) = v10;
    int v12 = (int)(float)(v11 + 1000.0) - 1000;
    *(_DWORD *)(v3 - 12) = v12;
    *(_DWORD *)(v3 - 8) = (int)v8;
    float result = v11 - (float)v12;
    *(float *)(v3 - 4) = result;
    *(float *)uint64_t v3 = v8 - truncf(v8);
    v2 += 4;
    v3 += 28;
  }
  while (v2 != 224);
  return result;
}

float sub_1000211F4(uint64_t a1, void *a2, float *a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = a1 + 12;
  unsigned int v5 = 28;
  float result = 0.0;
  do
  {
    while (1)
    {
      float v7 = (float)*(int *)((char *)&Madusa::AffineTransform::mGridPointU + v3);
      float v8 = (float)*(int *)((char *)&Madusa::AffineTransform::mGridPointV + v3);
      float v9 = (float)(*a3 * v8) + (float)(a3[1] * v7);
      float v10 = (float)(a3[2] * v8) + (float)(a3[3] * v7);
      *(float *)(v4 + 8) = v9;
      float v11 = -v9;
      float v12 = -v10;
      if (v9 >= 0.0)
      {
        float v12 = v10;
        float v11 = v9;
      }
      *(unsigned char *)(v4 + 12) = v9 < 0.0;
      float v13 = fminf(fmaxf(v12, -999.0), 999.0);
      unsigned int v14 = (int)v11;
      int v15 = (int)(float)(v13 + 1000.0);
      *(_DWORD *)(v4 - 12) = v15 - 1000;
      *(_DWORD *)(v4 - 8) = (int)v11;
      float v16 = v11 - truncf(v11);
      *(float *)uint64_t v4 = v16;
      *(float *)(v4 + 4) = v10;
      float v17 = v13 - (float)(v15 - 1000);
      *(float *)(v4 - 4) = v17;
      if (v14 <= 0x3F && v15 >= 936 && v15 <= 1062) {
        break;
      }
      --v5;
      v3 += 4;
      v4 += 28;
      if (v3 == 112) {
        goto LABEL_9;
      }
    }
    unsigned int v18 = v14 + 1;
    uint64_t v19 = *a2 + 8;
    uint64_t v20 = v19 + 4 * (v15 - 936);
    unint64_t v21 = (unint64_t)v14 << 9;
    float v22 = *(float *)(v20 + v21);
    float result = (float)((float)(v22 + (float)((float)(*(float *)(v19 + 4 * (v15 - 935) + v21) - v22) * v17))
                   + result)
           + (float)((float)((float)(*(float *)(v20 + ((unint64_t)v18 << 9))
                                   - (float)(v22
                                           + (float)((float)(*(float *)(v19 + 4 * (v15 - 935) + v21)
                                                           - v22)
                                                   * v17)))
                           + (float)((float)(*(float *)(v19
                                                      + 4 * (v15 - 935)
                                                      + ((unint64_t)v18 << 9))
                                           - *(float *)(v20 + ((unint64_t)v18 << 9)))
                                   * v17))
                   * v16);
    v3 += 4;
    v4 += 28;
  }
  while (v3 != 112);
LABEL_9:
  if (v5 - 1 < 0x37) {
    return Madusa::RefineCandidates::mCorrScale[v5] * result;
  }
  return result;
}

float sub_10002135C(uint64_t a1, void *a2, float *a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = *a2 + 8;
  float v5 = 0.0;
  float v6 = &Madusa::AffineTransform::mGridPointV;
  float v7 = &Madusa::AffineTransform::mGridPointU;
  float v8 = 0.0;
  float v9 = 0.0;
  float v10 = 0.0;
  do
  {
    uint64_t v16 = a1 + v3;
    uint64_t v17 = *(unsigned int *)(a1 + v3 + 4);
    if (v17 > 0x3F || (int v18 = *(_DWORD *)v16, *(int *)v16 < -64) || v18 >= 63)
    {
      float v12 = *(float *)(v16 + 16);
      float v11 = *(float *)(v16 + 20);
    }
    else
    {
      int v19 = v18 + 64;
      uint64_t v20 = v4 + 4 * (v18 + 64);
      float v21 = *(float *)(v20 + (v17 << 9));
      unsigned int v22 = v18 + 65;
      uint64_t v23 = v4 + 4 * v22;
      float v24 = *(float *)(v23 + (v17 << 9));
      float v25 = fmaxf(v24, v21);
      if (v24 <= v21) {
        int v26 = v19;
      }
      else {
        int v26 = v22;
      }
      uint64_t v27 = (v17 + 1) << 9;
      float v28 = *(float *)(v20 + v27);
      if (v28 <= v25) {
        float v29 = v25;
      }
      else {
        float v29 = *(float *)(v20 + v27);
      }
      if (v28 <= v25) {
        int v19 = v26;
      }
      if (*(float *)(v23 + v27) <= v29)
      {
        BOOL v30 = v28 <= v25;
      }
      else
      {
        int v19 = v22;
        BOOL v30 = 0;
      }
      if (!v30) {
        LODWORD(v17) = v17 + 1;
      }
      int v31 = v19 - 64;
      int v32 = 64 - v19;
      if (*(unsigned char *)(a1 + v3 + 24)) {
        LODWORD(v17) = -(int)v17;
      }
      else {
        int v32 = v31;
      }
      float v11 = (float)(int)v17;
      float v12 = (float)v32;
    }
    int v13 = *(_DWORD *)v7;
    float v7 = (long long *)((char *)v7 + 4);
    float v14 = (float)v13;
    int v15 = *(_DWORD *)v6;
    float v6 = (long long *)((char *)v6 + 4);
    float v5 = v5 + (float)(v12 * v14);
    float v8 = v8 + (float)(v11 * (float)v15);
    float v9 = v9 + (float)(v11 * v14);
    float v10 = v10 + (float)(v12 * (float)v15);
    v3 += 28;
  }
  while (v3 != 784);
  *a3 = v8 * 0.000079177;
  a3[1] = v9 * 0.000079177;
  a3[2] = v10 * 0.000079177;
  a3[3] = v5 * 0.000079177;
  return sub_1000211F4(a1, a2, a3);
}

float sub_100021488(uint64_t a1, void *a2, float *a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = a1 + 12;
  int v5 = 56;
  float result = 0.0;
  do
  {
    while (1)
    {
      float v7 = (float)*(int *)((char *)&Madusa::AffineTransform::mGridPointU + v3);
      float v8 = (float)*(int *)((char *)&Madusa::AffineTransform::mGridPointV + v3);
      float v9 = (float)(*a3 * v8) + (float)(a3[1] * v7);
      float v10 = (float)(a3[2] * v8) + (float)(a3[3] * v7);
      *(float *)(v4 + 8) = v9;
      float v11 = -v9;
      float v12 = -v10;
      if (v9 >= 0.0)
      {
        float v12 = v10;
        float v11 = v9;
      }
      *(unsigned char *)(v4 + 12) = v9 < 0.0;
      float v13 = fminf(fmaxf(v12, -999.0), 999.0);
      unsigned int v14 = (int)v11;
      int v15 = (int)(float)(v13 + 1000.0);
      *(_DWORD *)(v4 - 12) = v15 - 1000;
      *(_DWORD *)(v4 - 8) = (int)v11;
      float v16 = v11 - truncf(v11);
      *(float *)uint64_t v4 = v16;
      *(float *)(v4 + 4) = v10;
      float v17 = v13 - (float)(v15 - 1000);
      *(float *)(v4 - 4) = v17;
      if (v14 <= 0x3F && v15 >= 936 && v15 <= 1062) {
        break;
      }
      --v5;
      v3 += 4;
      v4 += 28;
      if (v3 == 224) {
        goto LABEL_9;
      }
    }
    unsigned int v18 = v14 + 1;
    uint64_t v19 = *a2 + 8;
    uint64_t v20 = v19 + 4 * (v15 - 936);
    unint64_t v21 = (unint64_t)v14 << 9;
    float v22 = *(float *)(v20 + v21);
    float result = (float)((float)(v22 + (float)((float)(*(float *)(v19 + 4 * (v15 - 935) + v21) - v22) * v17))
                   + result)
           + (float)((float)((float)(*(float *)(v20 + ((unint64_t)v18 << 9))
                                   - (float)(v22
                                           + (float)((float)(*(float *)(v19 + 4 * (v15 - 935) + v21)
                                                           - v22)
                                                   * v17)))
                           + (float)((float)(*(float *)(v19
                                                      + 4 * (v15 - 935)
                                                      + ((unint64_t)v18 << 9))
                                           - *(float *)(v20 + ((unint64_t)v18 << 9)))
                                   * v17))
                   * v16);
    v3 += 4;
    v4 += 28;
  }
  while (v3 != 224);
LABEL_9:
  if ((v5 - 1) < 0x37) {
    return Madusa::RefineCandidates::mCorrScale[v5] * result;
  }
  return result;
}

float sub_1000215F0(uint64_t a1, void *a2, float *a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = *a2 + 8;
  float v5 = 0.0;
  float v6 = &Madusa::AffineTransform::mGridPointV;
  float v7 = &Madusa::AffineTransform::mGridPointU;
  float v8 = 0.0;
  float v9 = 0.0;
  float v10 = 0.0;
  do
  {
    uint64_t v16 = a1 + v3;
    uint64_t v17 = *(unsigned int *)(a1 + v3 + 4);
    if (v17 > 0x3F || (int v18 = *(_DWORD *)v16, *(int *)v16 < -64) || v18 >= 63)
    {
      float v12 = *(float *)(v16 + 16);
      float v11 = *(float *)(v16 + 20);
    }
    else
    {
      int v19 = v18 + 64;
      uint64_t v20 = v4 + 4 * (v18 + 64);
      float v21 = *(float *)(v20 + (v17 << 9));
      unsigned int v22 = v18 + 65;
      uint64_t v23 = v4 + 4 * v22;
      float v24 = *(float *)(v23 + (v17 << 9));
      float v25 = fmaxf(v24, v21);
      if (v24 <= v21) {
        int v26 = v19;
      }
      else {
        int v26 = v22;
      }
      uint64_t v27 = (v17 + 1) << 9;
      float v28 = *(float *)(v20 + v27);
      if (v28 <= v25) {
        float v29 = v25;
      }
      else {
        float v29 = *(float *)(v20 + v27);
      }
      if (v28 <= v25) {
        int v19 = v26;
      }
      if (*(float *)(v23 + v27) <= v29)
      {
        BOOL v30 = v28 <= v25;
      }
      else
      {
        int v19 = v22;
        BOOL v30 = 0;
      }
      if (!v30) {
        LODWORD(v17) = v17 + 1;
      }
      int v31 = v19 - 64;
      int v32 = 64 - v19;
      if (*(unsigned char *)(a1 + v3 + 24)) {
        LODWORD(v17) = -(int)v17;
      }
      else {
        int v32 = v31;
      }
      float v11 = (float)(int)v17;
      float v12 = (float)v32;
    }
    int v13 = *(_DWORD *)v7;
    float v7 = (long long *)((char *)v7 + 4);
    float v14 = (float)v13;
    int v15 = *(_DWORD *)v6;
    float v6 = (long long *)((char *)v6 + 4);
    float v5 = v5 + (float)(v12 * v14);
    float v8 = v8 + (float)(v11 * (float)v15);
    float v9 = v9 + (float)(v11 * v14);
    float v10 = v10 + (float)(v12 * (float)v15);
    v3 += 28;
  }
  while (v3 != 1568);
  *a3 = v8 * 0.00002307;
  a3[1] = v9 * 0.00002307;
  a3[2] = v10 * 0.00002307;
  a3[3] = v5 * 0.00002307;
  return sub_100021488(a1, a2, a3);
}

uint64_t Madusa::DetectorBase::DetectorBase(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = off_1000708F8;
  Madusa::BlockPicker::BlockPicker((Madusa::BlockPicker *)(a1 + 8));
  *(unsigned char *)(a1 + 40) = 0;
  Madusa::ImageProperties::ImageProperties((Madusa::ImageProperties *)(a1 + 48));
  *(_WORD *)(a1 + 280) = 0;
  *(void *)(a1 + 288) = 0;
  *(void *)(a1 + 296) = Madusa::SigComboBoost::SigComboBoost((Madusa::SigComboBoost *)(a1 + 304));
  *(void *)(a1 + 42984) = a2;
  (*(void (**)(void))(*(void *)(a1 + 304) + 16))();
  return a1;
}

void Madusa::DetectorBase::Initialize(Madusa::DetectorBase *this)
{
}

void Madusa::DetectorBase::_Initialize(Madusa::DetectorBase *this, Madusa::DetectorBase *a2, int8x8_t a3)
{
  a3.i32[0] = *v3 | 0xFFFFFFE0;
  a3.i8[4] = v3[3];
  *(int8x8_t *)v4.i8 = vand_s8(a3, (int8x8_t)0xFF000000FFLL);
  v4.i64[1] = v4.i64[0];
  float32x4_t v5 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v4, (int32x4_t)xmmword_10006E010));
  v6.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_10006E020, v5)).u32[0];
  v6.i32[1] = vmovn_s32(vcgtq_f32(v5, (float32x4_t)xmmword_10006E020)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v6, 0xFuLL))) & ((v3[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    ++QuickCodec::mask;
  }
  Madusa::DetectorBase::Initialize(this);
}

uint64_t Madusa::DetectorBase::ProcessBlock(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v29 = (*(uint64_t (**)(unsigned __int8 *, uint64_t))(*(void *)a1 + 56))(a1, a3);
  uint64_t v28 = (*(uint64_t (**)(uint64_t))(*(void *)a4 + 32))(a4);
  uint64_t v8 = (*(uint64_t (**)(uint64_t))(*(void *)a4 + 24))(a4);
  Madusa::ProfileTimer::ProfileTimer(v25, (uint64_t)&unk_10006F6CB, v8);
  unsigned int v9 = (*(uint64_t (**)(unsigned __int8 *, uint64_t *, uint64_t *, uint64_t))(*(void *)a1 + 32))(a1, &v29, &v28, a2);
  Madusa::ProfileTimer::~ProfileTimer((Madusa::ProfileTimer *)v25);
  if (v9)
  {
    if (v9 == 5) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = v9;
    }
  }
  else
  {
    float v10 = (Madusa::System *)(*(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t *))(*(void *)a1 + 40))(a1, a3, &v28);
    if (v10)
    {
      uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)a4 + 24))(a4);
      (*(void (**)(uint64_t, uint64_t, void, void, uint64_t, uint64_t, uint64_t))(*(void *)v12 + 40))(v12, v28 + 8, v29, HIDWORD(v29), 130, 130, 130);
      float v10 = (Madusa::System *)(*(void *(**)(void *__return_ptr, uint64_t, uint64_t *, uint64_t *))(*(void *)a4 + 16))(v25, a4, &v28, &v29);
      unint64_t v13 = v27;
      if (v27 >= 1)
      {
        if (v26[1]) {
          goto LABEL_12;
        }
        float v14 = (unsigned __int8 *)&v27 + 1;
        uint64_t v15 = 1;
        do
        {
          unint64_t v16 = v15;
          if (v27 == v15) {
            break;
          }
          int v17 = *v14;
          v14 += 32;
          ++v15;
        }
        while (!v17);
        if (v16 < v27) {
LABEL_12:
        }
          atomic_store(1u, a1 + 281);
        if (*(float *)v25 > 20.3) {
          goto LABEL_18;
        }
        int v18 = (float *)v26;
        uint64_t v19 = 1;
        do
        {
          unint64_t v20 = v19;
          if (v13 == v19) {
            break;
          }
          float v21 = *v18;
          v18 += 18;
          ++v19;
        }
        while (v21 <= 20.3);
        if (v20 < v13) {
LABEL_18:
        }
          atomic_store(1u, a1 + 280);
      }
    }
    uint64_t v11 = 0;
  }
  ReadstatsHandle = Madusa::System::GetReadstatsHandle(v10);
  uint64_t v23 = (*(uint64_t (**)(uint64_t))(*(void *)a4 + 24))(a4);
  ((void (*)(uint64_t (***)(), uint64_t))(*ReadstatsHandle)[8])(ReadstatsHandle, v23);
  return v11;
}

uint64_t Madusa::DetectorBase::_ProcessBlock(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  float32x4_t v5 = 0;
  int v6 = 0;
  if (QuickCodec::mask == -70947757) {
    int v7 = 2212752;
  }
  else {
    int v7 = 1970885;
  }
  uint64_t v8 = 1;
  int v9 = 18986;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v11 = v8;
        if (v9 > 1970884) {
          break;
        }
        if (v9 == 18986)
        {
          uint64_t v8 = 0;
          int v9 = 1970885;
        }
        else if (v9 == 19003)
        {
          uint64_t v8 = (QuickCodec::mask != -70947757) | v8;
          int v9 = v7;
        }
        else if ((*v5 & 0x1F) != 0 {
               || v5[2] > 0x3Fu
        }
               || (uint64_t v8 = 1,
                   int v9 = 1970885,
                   v5[3] != ((QuickCodec::mask ^ v6) / 0x1EEB94)))
        {
          int v9 = 1970939;
          uint64_t v8 = v11;
        }
      }
      if (v9 <= 1989853) {
        break;
      }
      if (v9 == 1989854)
      {
        float32x4_t v5 = (unsigned char *)v4;
        int v9 = 19003;
      }
      else
      {
        BOOL v10 = v9 == 2212752;
        int v9 = 19057;
        if (v10) {
          int v6 = -497124669;
        }
      }
    }
    if (v9 != 1970885) {
      break;
    }
    int v9 = 1970939;
    if ((v8 & 1) == 0) {
      int v9 = 1989854;
    }
  }
  if (v8) {
    ++QuickCodec::mask;
  }
  return Madusa::DetectorBase::ProcessBlock(a1, a2, a3, a4);
}

uint64_t Madusa::DetectorBase::WriteReadstats(Madusa::DetectorBase *this)
{
  ReadstatsHandle = Madusa::System::GetReadstatsHandle(this);
  uint64_t v2 = (Madusa::System *)((uint64_t (*)(uint64_t (***)()))(*ReadstatsHandle)[9])(ReadstatsHandle);
  uint64_t v3 = (*Madusa::System::GetReadstatsHandle(v2))[11];

  return v3();
}

uint64_t Madusa::DetectorBase::ShouldDoSecondPass(Madusa::DetectorBase *this)
{
  ReadstatsHandle = Madusa::System::GetReadstatsHandle(this);
  if (((unsigned int (*)(uint64_t (***)()))(*ReadstatsHandle)[12])(ReadstatsHandle))
  {
    if ((*v1 & 0x1F) != 0 || v1[2] > 0x3Fu)
    {
      if (QuickCodec::mask == -70947757) {
        return 1;
      }
    }
    else if (v1[3] != 212 && QuickCodec::mask == -70947757)
    {
      return 1;
    }
    QuickCodec::masint k = FunctionTable::ft[0] ^ 0x157E9386;
    fegetenv(&v16);
    v16.__fpcr &= QuickCodec::mask + 70947740;
    fesetenv(&v16);
    return 1;
  }
  else
  {
    v4.i32[0] = *v1 | 0xFFFFFFE0;
    v4.i8[4] = v1[3];
    *(int8x8_t *)v7.i8 = vand_s8(v4, (int8x8_t)0xFF000000FFLL);
    v7.i64[1] = v7.i64[0];
    float32x4_t v8 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v7, (int32x4_t)xmmword_10006E030));
    v9.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_10006E040, v8)).u32[0];
    v9.i32[1] = vmovn_s32(vcgtq_f32(v8, (float32x4_t)xmmword_10006E040)).i32[1];
    if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v9, 0xFuLL))) & ((v1[2] & 0xE0) == 32)) != 0
      || QuickCodec::mask != -70947757)
    {
      unint64_t v10 = 0;
      int v11 = FunctionTable::ft[0] ^ 0x157E9386;
      QuickCodec::masint k = FunctionTable::ft[0] ^ 0x157E9386;
      int v12 = -1;
      do
      {
        qword_100074AF8[v12
                      + 1
                      + ((FunctionTable::swapTable[v10] ^ v11) / 0x9D28AF)] = qword_100074AF8[v12 + ((FunctionTable::swapTable[v10 + 1] ^ v11) / 0x9D28AF)];
        v12 -= 2;
        BOOL v13 = v10 >= 0x20;
        v10 += 2;
      }
      while (!v13);
    }
    unsigned __int8 v14 = atomic_load((unsigned __int8 *)this + 281);
    if (v14)
    {
      return 0;
    }
    else
    {
      unsigned __int8 v15 = atomic_load((unsigned __int8 *)this + 280);
      return v15 & 1;
    }
  }
}

uint64_t Madusa::DetectorBase::_ShouldDoSecondPass(Madusa::DetectorBase *this, Madusa::DetectorBase *a2)
{
  if ((*v2 & 0x1F) != 0 || v2[2] > 0x3Fu)
  {
    int v3 = QuickCodec::mask;
    if (QuickCodec::mask != -70947757) {
LABEL_10:
    }
      QuickCodec::masint k = v3 + 1;
  }
  else
  {
    int v3 = QuickCodec::mask;
    if (v2[3] == 212 || QuickCodec::mask != -70947757) {
      goto LABEL_10;
    }
  }
  return Madusa::DetectorBase::ShouldDoSecondPass(this);
}

uint64_t Madusa::DetectorBase::SetImageProperties(Madusa::DetectorBase *this, const Madusa::ImageProperties *a2, Madusa::MemoryMaster *a3)
{
  int v6 = (char *)this + 48;
  long long v7 = *(_OWORD *)a2;
  long long v8 = *((_OWORD *)a2 + 1);
  long long v9 = *((_OWORD *)a2 + 3);
  *((_OWORD *)this + 5) = *((_OWORD *)a2 + 2);
  *((_OWORD *)this + 6) = v9;
  *((_OWORD *)this + 3) = v7;
  *((_OWORD *)this + 4) = v8;
  long long v10 = *((_OWORD *)a2 + 4);
  long long v11 = *((_OWORD *)a2 + 5);
  long long v12 = *((_OWORD *)a2 + 7);
  *((_OWORD *)this + 9) = *((_OWORD *)a2 + 6);
  *((_OWORD *)this + 10) = v12;
  *((_OWORD *)this + 7) = v10;
  *((_OWORD *)this + 8) = v11;
  long long v13 = *((_OWORD *)a2 + 8);
  long long v14 = *((_OWORD *)a2 + 9);
  long long v15 = *((_OWORD *)a2 + 10);
  *((void *)this + 28) = *((void *)a2 + 22);
  *((_OWORD *)this + 12) = v14;
  *((_OWORD *)this + 13) = v15;
  *((_OWORD *)this + 11) = v13;
  *((_DWORD *)this + 58) = *((_DWORD *)a2 + 46);
  *((_DWORD *)this + 59) = *((_DWORD *)a2 + 47);
  *((_DWORD *)this + 60) = *((_DWORD *)a2 + 48);
  *((_DWORD *)this + 61) = *((_DWORD *)a2 + 49);
  long long v16 = *(_OWORD *)((char *)a2 + 200);
  *(_OWORD *)(v6 + 212) = *(_OWORD *)((char *)a2 + 212);
  *(_OWORD *)((char *)this + 248) = v16;
  sub_100022C04((Madusa::ImageProperties *)v6, &v24);
  BOOL v17 = 0;
  if (BYTE4(v24) && v25 && v27) {
    BOOL v17 = v29 != 0;
  }
  uint64_t v18 = v26;
  uint64_t v19 = v28;
  uint64_t func = (uint64_t (*)(char *, uint64_t, uint64_t))__find_func(0x9FFFBF5F00A080F0, 1900298378);
  int v21 = func((char *)this + 8, v18, v19);
  Madusa::ImageProperties::RecordImageDetails(a2, v18, v19);
  unsigned int v22 = (*(uint64_t (**)(Madusa::DetectorBase *, Madusa::MemoryMaster *))(*(void *)this + 24))(this, a3);
  (*(void (**)(void))(**((void **)this + 37) + 16))(*((void *)this + 37));
  return v17 & v21 & v22;
}

uint64_t Madusa::DetectorBase::_SetImageProperties(Madusa::DetectorBase *this, Madusa::DetectorBase *a2, const Madusa::ImageProperties *a3, Madusa::MemoryMaster *a4, int8x8_t a5)
{
  a5.i32[0] = *v5 | 0xFFFFFFE0;
  a5.i8[4] = v5[3];
  *(int8x8_t *)v6.i8 = vand_s8(a5, (int8x8_t)0xFF000000FFLL);
  v6.i64[1] = v6.i64[0];
  float32x4_t v7 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v6, (int32x4_t)xmmword_10006E050));
  v8.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_10006E060, v7)).u32[0];
  v8.i32[1] = vmovn_s32(vcgtq_f32(v7, (float32x4_t)xmmword_10006E060)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v8, 0xFuLL))) & ((v5[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    ++QuickCodec::mask;
  }
  return Madusa::DetectorBase::SetImageProperties(this, a2, a3);
}

Madusa::System *Madusa::DetectorBase::ProcessBlocksLoop(Madusa::System *a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  if ((int)a2 < a3)
  {
    uint64_t v9 = a2;
    long long v10 = (unsigned __int8 *)a1;
    do
    {
      ReadstatsHandle = Madusa::System::GetReadstatsHandle(a1);
      if ((((uint64_t (*)(uint64_t (***)()))(*ReadstatsHandle)[12])(ReadstatsHandle) & 1) == 0)
      {
        uint64_t func = (uint64_t (*)(unsigned __int8 *))__find_func(0xBF1F5F3F0040A060, 1369743594);
        if (func(v10)) {
          break;
        }
      }
      a1 = (Madusa::System *)Madusa::DetectorBase::ProcessBlock(v10, a4, v9, a5);
      if (a1)
      {
        long long v13 = a1;
        goto LABEL_9;
      }
      uint64_t v9 = (v9 + 1);
    }
    while (a3 != v9);
  }
  long long v13 = 0;
LABEL_9:
  if ((*v5 & 0x1F) != 0 || v5[2] > 0x3Fu)
  {
    if (QuickCodec::mask == -70947757) {
      return v13;
    }
  }
  else if (v5[3] != 212 && QuickCodec::mask == -70947757)
  {
    return v13;
  }
  QuickCodec::masint k = FunctionTable::ft[0] ^ 0x157E9386;
  uint64_t v15 = __find_func(0xDF9FDF1FC0E04070, 824451274);
  uint64_t v16 = 0;
  while (*(unsigned __int8 *)(v15 + v16) != ((QuickCodec::mask ^ 0xC12A2DF3) / 0x9D28AF)
       || *(unsigned __int8 *)(v15 + v16 + 1) != ((QuickCodec::mask ^ 0xFBC56C53) / 0x9D28AF)
       || *(unsigned __int8 *)(v15 + v16 + 2) != ((QuickCodec::mask ^ 0xDDCAB631) / 0x9D28AF)
       || *(unsigned __int8 *)(v15 + v16 + 3) != ((QuickCodec::mask ^ 0x79E0DCBFu) / 0x9D28AF))
  {
    v16 += 4;
    if (v16 == 2400) {
      goto LABEL_25;
    }
  }
  uint64_t vars0 = v15 + v16;
  long long vars8 = 0u;
LABEL_25:
  QuickCodec::mask += 16;
  return v13;
}

Madusa::System *Madusa::DetectorBase::_ProcessBlocksLoop(Madusa::System *a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  if ((*v5 & 0x1F) != 0 || v5[2] > 0x3Fu)
  {
    int v6 = QuickCodec::mask;
    if (QuickCodec::mask != -70947757) {
LABEL_10:
    }
      QuickCodec::masint k = v6 + 1;
  }
  else
  {
    int v6 = QuickCodec::mask;
    if (v5[3] == 212 || QuickCodec::mask != -70947757) {
      goto LABEL_10;
    }
  }
  return Madusa::DetectorBase::ProcessBlocksLoop(a1, a2, a3, a4, a5);
}

uint64_t Madusa::DetectorBase::ProcessBlocks(Madusa::DetectorBase *this, uint64_t a2, uint64_t a3, void *a4, Madusa::SessionCallbacks *a5)
{
  atomic_fetch_add((atomic_uint *volatile)this + 10744, ((int)a2 + (int)a3 - 1) * ((int)a3 - (int)a2) / 2);
  Madusa::MemoryMaster::MemoryMaster((uint64_t)v29, *((void *)this + 36), a4);
  if (Madusa::MemoryMaster::Valid((Madusa::MemoryMaster *)v29)
    && (uint64_t DetectorPipe = Madusa::System::CreateDetectorPipe((uint64_t)v29, (uint64_t)this + 296)) != 0
    && (long long v11 = (void (***)(void))DetectorPipe, Madusa::MemoryMaster::Valid((Madusa::MemoryMaster *)v29)))
  {
    uint64_t v12 = (*(uint64_t (**)(Madusa::DetectorBase *, void **, Madusa::SessionCallbacks *))(*(void *)this + 48))(this, v29, a5);
    if (v12)
    {
      long long v13 = (void (***)(void))v12;
      uint64_t func = (uint64_t (*)(Madusa::DetectorBase *, uint64_t, uint64_t, void (***)(void), void (***)(void)))__find_func(0xBFDF7F9FC020C090, 1365540938);
      uint64_t v15 = func(this, a2, a3, v13, v11);
      (**v13)(v13);
      Madusa::MemoryMaster::DeAllocateBuffer((uint64_t)v13, v16);
    }
    else
    {
      uint64_t v15 = 1;
    }
    (**v11)(v11);
    Madusa::MemoryMaster::DeAllocateBuffer((uint64_t)v11, v28);
  }
  else
  {
    uint64_t v15 = 1;
  }
  BOOL v17 = 0;
  int v18 = 0;
  if (QuickCodec::mask == -70947757) {
    int v19 = 6629195;
  }
  else {
    int v19 = 923358;
  }
  uint64_t v20 = 1;
  int v21 = 1661126;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v24 = v20;
        if (v21 <= 1661196) {
          break;
        }
        if (v21 == 1661197)
        {
          if ((*v17 & 0x1F) != 0
            || v17[2] > 0x3Fu
            || (uint64_t v20 = 1,
                int v21 = 923358,
                v17[3] != ((QuickCodec::mask ^ v18) / 0x60B4C8)))
          {
            int v21 = 923412;
            uint64_t v20 = v24;
          }
        }
        else if (v21 == 2584467)
        {
          BOOL v17 = v5;
          int v21 = 1661143;
        }
        else
        {
          BOOL v25 = v21 == 6629195;
          int v21 = 1661197;
          if (v25) {
            int v18 = -1412376077;
          }
        }
      }
      if (v21 <= 1661125) {
        break;
      }
      unsigned int v22 = (QuickCodec::mask != -70947757) | v20;
      if (v21 == 1661143) {
        int v23 = v19;
      }
      else {
        int v23 = v21;
      }
      if (v21 == 1661143) {
        LODWORD(v24) = v22;
      }
      BOOL v25 = v21 == 1661126;
      if (v21 == 1661126) {
        int v21 = 923358;
      }
      else {
        int v21 = v23;
      }
      if (v25) {
        uint64_t v20 = 0;
      }
      else {
        uint64_t v20 = v24;
      }
    }
    if (v21 != 923358) {
      break;
    }
    if (v20) {
      int v21 = 923412;
    }
    else {
      int v21 = 2584467;
    }
  }
  if (v20)
  {
    QuickCodec::masint k = FunctionTable::ft[0] ^ 0x157E9386;
    unsigned int v26 = (void (*)(void, uint64_t))__find_func(0xBFBF1F1FC0C00040, 1359274186);
    v26(0, 104);
  }
  Madusa::MemoryMaster::~MemoryMaster(v29);
  return v15;
}

uint64_t Madusa::DetectorBase::_ProcessBlocks(Madusa::DetectorBase *this, uint64_t a2, uint64_t a3, void *a4, Madusa::SessionCallbacks *a5, Madusa::SessionCallbacks *a6, int8x8_t a7)
{
  a7.i32[0] = *v7 | 0xFFFFFFE0;
  a7.i8[4] = v7[3];
  *(int8x8_t *)v8.i8 = vand_s8(a7, (int8x8_t)0xFF000000FFLL);
  v8.i64[1] = v8.i64[0];
  float32x4_t v9 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v8, (int32x4_t)xmmword_10006E070));
  v10.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_10006E080, v9)).u32[0];
  v10.i32[1] = vmovn_s32(vcgtq_f32(v9, (float32x4_t)xmmword_10006E080)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v10, 0xFuLL))) & ((v7[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    ++QuickCodec::mask;
  }
  return Madusa::DetectorBase::ProcessBlocks(this, a2, a3, a4, a5);
}

uint64_t Madusa::DetectorBase::ProcessTwoPasses(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  if (!a3) {
    return 1;
  }
  int v6 = a4;
  *(void *)(a1 + 288) = a2;
  uint64_t v8 = a1 + 42976;
  *(unsigned char *)(a1 + 40) = 0;
  atomic_store(0, (unsigned int *)(a1 + 42976));
  int v9 = a4 - 1;
  if ((int)a4 < 1)
  {
    uint64_t v15 = 0;
  }
  else
  {
    unsigned int v10 = (*(uint64_t (**)(void, void, uint64_t, uint64_t, uint64_t))(**(void **)(a1 + 42984) + 16))(*(void *)(a1 + 42984), 0, a4, a2, a1);
    if (!v10)
    {
      unsigned __int8 v11 = atomic_load((unsigned __int8 *)(a1 + 281));
      if ((v11 & 1) == 0)
      {
        uint64_t v12 = (Madusa::System *)(*(void *(**)(void *__return_ptr))(**(void **)(a1 + 296) + 32))(v23);
        ReadstatsHandle = Madusa::System::GetReadstatsHandle(v12);
        ((void (*)(uint64_t (***)(), void *))(*ReadstatsHandle)[5])(ReadstatsHandle, v23);
        atomic_store(BYTE1(v23[0]), (unsigned __int8 *)(a1 + 281));
      }
    }
    unsigned int v14 = atomic_load((unsigned int *)v8);
    if (v14 == v9 * v6 / 2) {
      uint64_t v15 = v10;
    }
    else {
      uint64_t v15 = 3;
    }
  }
  uint64_t func = (uint64_t (*)(uint64_t))__find_func(0xBF1F5F5F008040F0, 1369743498);
  int v17 = func(a1);
  if (!v15 && v17)
  {
    *(unsigned char *)(a1 + 40) = 1;
    atomic_store(0, (unsigned int *)v8);
    if ((int)a5 < 1)
    {
      return 0;
    }
    else
    {
      LODWORD(v15) = (*(uint64_t (**)(void, void, uint64_t, void, uint64_t))(**(void **)(v8 + 8) + 16))(*(void *)(v8 + 8), 0, a5, *(void *)(a1 + 288), a1);
      if (!v15)
      {
        unsigned __int8 v18 = atomic_load((unsigned __int8 *)(a1 + 281));
        if ((v18 & 1) == 0)
        {
          int v19 = (Madusa::System *)(*(void *(**)(void *__return_ptr))(**(void **)(a1 + 296) + 32))(v23);
          uint64_t v20 = Madusa::System::GetReadstatsHandle(v19);
          ((void (*)(uint64_t (***)(), void *))(*v20)[5])(v20, v23);
          atomic_store(BYTE1(v23[0]), (unsigned __int8 *)(a1 + 281));
        }
      }
      unsigned int v21 = atomic_load((unsigned int *)v8);
      if (v21 == ((int)a5 - 1) * (int)a5 / 2) {
        return v15;
      }
      else {
        return 3;
      }
    }
  }
  return v15;
}

unint64_t sub_100022C04@<X0>(Madusa::ImageProperties *a1@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v14 = 0x100000001;
  uint64_t v15 = 0x100000001;
  Madusa::ImageProperties::GetDownsampleRatios(a1, (Madusa::Ratio *)&v15, (Madusa::Ratio *)&v14);
  Integerdouble OffsetBounds = Madusa::ImageProperties::GetIntegerOffsetBounds(a1);
  v13[0] = (unint64_t)&_mh_execute_header & 0xFFFFFFFF00000000 | IntegerOffsetBounds;
  v13[1] = (unint64_t)&_mh_execute_header & 0xFFFFFFFF00000000 | HIDWORD(IntegerOffsetBounds);
  v13[2] = (unint64_t)&_mh_execute_header & 0xFFFFFFFF00000000 | v5;
  void v13[3] = (unint64_t)&_mh_execute_header & 0xFFFFFFFF00000000 | v6;
  sub_10002327C((int *)v13, (int *)&v15, (int *)&v14, v12);
  int ResolutionBucket = Madusa::ImageProperties::GetResolutionBucket(a1);
  if (ResolutionBucket <= 350) {
    int v8 = ResolutionBucket;
  }
  else {
    int v8 = 300;
  }
  uint64_t v9 = 0x100000001;
  if (v8 <= 199)
  {
    switch(v8)
    {
      case 100:
        unsigned int v10 = (char *)&unk_10006E090;
        goto LABEL_20;
      case 125:
        unsigned int v10 = (char *)&unk_10006E0A0;
        goto LABEL_20;
      case 150:
        unsigned int v10 = (char *)&unk_10006E0B0;
        goto LABEL_20;
    }
  }
  else if (v8 > 299)
  {
    if (v8 == 300)
    {
      unsigned int v10 = (char *)&unk_10006E0E0;
      goto LABEL_20;
    }
    if (v8 == 350)
    {
      unsigned int v10 = (char *)&unk_10006E0F0;
      goto LABEL_20;
    }
  }
  else
  {
    if (v8 == 200)
    {
      unsigned int v10 = (char *)&unk_10006E0C0;
      goto LABEL_20;
    }
    if (v8 == 250)
    {
      unsigned int v10 = (char *)&unk_10006E0D0;
LABEL_20:
      uint64_t v9 = *(void *)(v10 + 4);
    }
  }
  v13[0] = v9;
  return sub_10002327C((int *)v12, (int *)v13, (int *)v13, a2);
}

BOOL Madusa::DetectorBase::Is100DPI(Madusa::DetectorBase *this)
{
  return Madusa::ImageProperties::GetResolutionBucket((Madusa::DetectorBase *)((char *)this + 48)) == 100;
}

BOOL Madusa::DetectorBase::_Is100DPI(Madusa::DetectorBase *this, Madusa::DetectorBase *a2)
{
  if ((*v2 & 0x1F) != 0 || v2[2] > 0x3Fu)
  {
    int v3 = QuickCodec::mask;
    if (QuickCodec::mask != -70947757) {
LABEL_10:
    }
      QuickCodec::masint k = v3 + 1;
  }
  else
  {
    int v3 = QuickCodec::mask;
    if (v2[3] == 212 || QuickCodec::mask != -70947757) {
      goto LABEL_10;
    }
  }
  return Madusa::DetectorBase::Is100DPI(this);
}

uint64_t Madusa::DetectorBase::GetResolutionBucket(Madusa::DetectorBase *this)
{
  return Madusa::ImageProperties::GetResolutionBucket((Madusa::DetectorBase *)((char *)this + 48));
}

uint64_t Madusa::DetectorBase::GetImageParams(Madusa::DetectorBase *this)
{
  return (uint64_t)this + 48;
}

uint64_t Madusa::DetectorBase::IsWatermarkFound(Madusa::DetectorBase *this)
{
  uint64_t v2 = 0;
  int v3 = 0;
  if (QuickCodec::mask == -70947757) {
    int v4 = 7729295;
  }
  else {
    int v4 = 7094750;
  }
  uint64_t v5 = 1;
  int v6 = 5873;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v8 = v5;
        if (v6 > 7094749) {
          break;
        }
        if (v6 == 5873)
        {
          uint64_t v5 = 0;
          int v6 = 7094750;
        }
        else if (v6 == 5890)
        {
          uint64_t v5 = (QuickCodec::mask != -70947757) | v5;
          int v6 = v4;
        }
        else if ((*v2 & 0x1F) != 0 {
               || v2[2] > 0x3Fu
        }
               || (uint64_t v5 = 1,
                   int v6 = 7094750,
                   v2[3] != ((QuickCodec::mask ^ v3) / 0x994241)))
        {
          int v6 = 7094804;
          uint64_t v5 = v8;
        }
      }
      if (v6 <= 7100605) {
        break;
      }
      if (v6 == 7100606)
      {
        uint64_t v2 = v1;
        int v6 = 5890;
      }
      else
      {
        BOOL v7 = v6 == 7729295;
        int v6 = 5944;
        if (v7) {
          int v3 = -2060471929;
        }
      }
    }
    if (v6 != 7094750) {
      break;
    }
    int v6 = 7094804;
    if ((v5 & 1) == 0) {
      int v6 = 7100606;
    }
  }
  if (v5)
  {
    unint64_t v9 = 0;
    int v10 = FunctionTable::ft ^ 0x157E9386;
    QuickCodec::masint k = FunctionTable::ft ^ 0x157E9386;
    int v11 = -1;
    do
    {
      qword_100074AF8[v11
                    + 1
                    + ((FunctionTable::swapTable[v9] ^ v10) / 0x9D28AF)] = qword_100074AF8[v11 + ((FunctionTable::swapTable[v9 + 1] ^ v10) / 0x9D28AF)];
      v11 -= 2;
      BOOL v12 = v9 >= 0x20;
      v9 += 2;
    }
    while (!v12);
  }
  unsigned __int8 v13 = atomic_load((unsigned __int8 *)this + 281);
  return v13 & 1;
}

uint64_t Madusa::DetectorBase::_IsWatermarkFound(Madusa::DetectorBase *this, const Madusa::DetectorBase *a2)
{
  if ((*v2 & 0x1F) != 0 || v2[2] > 0x3Fu)
  {
    int v3 = QuickCodec::mask;
    if (QuickCodec::mask == -70947757) {
      return Madusa::DetectorBase::IsWatermarkFound(this);
    }
LABEL_7:
    QuickCodec::masint k = v3 + 1;
    return Madusa::DetectorBase::IsWatermarkFound(this);
  }
  int v5 = 90122 * v2[3];
  int v3 = QuickCodec::mask;
  if ((v5 ^ 0x1238848 | v5 & 0x1238848) - (v5 + 19105864) + ~(v5 ^ 0x1238848 | ~(v5 | 0x1238848)) == ~(~(~(~(v5 | 0x1218000) | v5 & 0x1218000) | 0x20848) | ~(~(v5 | 0x1218000) | v5 & 0x1218000) & 0x20848)
    || QuickCodec::mask != -70947757)
  {
    goto LABEL_7;
  }
  return Madusa::DetectorBase::IsWatermarkFound(this);
}

unint64_t sub_10002327C@<X0>(int *a1@<X0>, int *a2@<X1>, int *a3@<X2>, unint64_t *a4@<X8>)
{
  uint64_t v8 = a3[1] * (uint64_t)*a1;
  if (v8 == (int)v8)
  {
    uint64_t v11 = 2 * v8;
    uint64_t v10 = *a3;
    BOOL v12 = v11 == (int)v11 && (unint64_t)(v10 - 2147483649) >= 0xFFFFFFFF00000000;
    if (!v12 || (v13 = __OFADD__(v11, v10 - 1), uint64_t v14 = (v11 + v10 - 1), v13)) {
      unint64_t v9 = 0;
    }
    else {
      unint64_t v9 = v14 | (unint64_t)&_mh_execute_header;
    }
  }
  else
  {
    unint64_t v9 = 0;
    uint64_t v10 = *a3;
  }
  unint64_t v46 = v9;
  if (2 * v10 == 2 * v10) {
    unint64_t v15 = (unint64_t)&_mh_execute_header & 0xFFFFFFFF00000001 | (2 * (v10 & 0x7FFFFFFF));
  }
  else {
    unint64_t v15 = 0;
  }
  unint64_t v45 = v15;
  unint64_t v16 = sub_100023608((unsigned int *)&v46, (int *)&v45);
  uint64_t v17 = a2[1] * (uint64_t)a1[2];
  if (v17 == (int)v17)
  {
    uint64_t v20 = 2 * v17;
    uint64_t v19 = *a2;
    BOOL v21 = v20 == (int)v20 && (unint64_t)(v19 - 2147483649) >= 0xFFFFFFFF00000000;
    if (!v21 || (v13 = __OFADD__(v20, v19 - 1), uint64_t v22 = (v20 + v19 - 1), v13)) {
      unint64_t v18 = 0;
    }
    else {
      unint64_t v18 = v22 | (unint64_t)&_mh_execute_header;
    }
  }
  else
  {
    unint64_t v18 = 0;
    uint64_t v19 = *a2;
  }
  unint64_t v46 = v18;
  if (2 * v19 == 2 * v19) {
    unint64_t v23 = (unint64_t)&_mh_execute_header & 0xFFFFFFFF00000001 | (2 * (v19 & 0x7FFFFFFF));
  }
  else {
    unint64_t v23 = 0;
  }
  unint64_t v45 = v23;
  unint64_t v24 = sub_100023608((unsigned int *)&v46, (int *)&v45);
  uint64_t v25 = a3[1] * (a1[4] + (uint64_t)*a1);
  if (v25 == (int)v25 && 2 * v25 == 2 * v25)
  {
    uint64_t v28 = v25 << 33;
    unint64_t v29 = 2 * (int)v25 - 2147483649;
    int v27 = *a3;
    if (v29 >= 0xFFFFFFFF00000000
      && ((v28 - 0x100000000) >> 32) - v27 == (int)(((unint64_t)(v28 - 0x100000000) >> 32) - v27))
    {
      unint64_t v26 = (unint64_t)&_mh_execute_header & 0xFFFFFFFF00000000 | (((unint64_t)(v28 - 0x100000000) >> 32)
                                                                                        - v27);
    }
    else
    {
      unint64_t v26 = 0;
    }
  }
  else
  {
    unint64_t v26 = 0;
    int v27 = *a3;
  }
  unint64_t v46 = v26;
  if (2 * v27 == 2 * v27) {
    unint64_t v30 = (unint64_t)&_mh_execute_header & 0xFFFFFFFF00000001 | (2 * (v27 & 0x7FFFFFFF));
  }
  else {
    unint64_t v30 = 0;
  }
  unint64_t v45 = v30;
  unint64_t v31 = sub_100023608((unsigned int *)&v46, (int *)&v45);
  uint64_t v32 = a2[1] * (a1[6] + (uint64_t)a1[2]);
  if (v32 == (int)v32 && 2 * v32 == 2 * v32)
  {
    uint64_t v35 = v32 << 33;
    unint64_t v36 = 2 * (int)v32 - 2147483649;
    int v34 = *a2;
    if (v36 >= 0xFFFFFFFF00000000
      && ((v35 - 0x100000000) >> 32) - v34 == (int)(((unint64_t)(v35 - 0x100000000) >> 32) - v34))
    {
      unint64_t v33 = (unint64_t)&_mh_execute_header & 0xFFFFFFFF00000000 | (((unint64_t)(v35 - 0x100000000) >> 32)
                                                                                        - v34);
    }
    else
    {
      unint64_t v33 = 0;
    }
  }
  else
  {
    unint64_t v33 = 0;
    int v34 = *a2;
  }
  unint64_t v46 = v33;
  if (2 * v34 == 2 * v34) {
    unint64_t v37 = (unint64_t)&_mh_execute_header & 0xFFFFFFFF00000001 | (2 * (v34 & 0x7FFFFFFF));
  }
  else {
    unint64_t v37 = 0;
  }
  unint64_t v45 = v37;
  unint64_t result = sub_100023608((unsigned int *)&v46, (int *)&v45);
  unint64_t v39 = 0;
  if (!*((unsigned char *)a1 + 12) || !*((unsigned char *)a1 + 4) || !*((unsigned char *)a1 + 28))
  {
    LOBYTE(v40) = 0;
    LOBYTE(v41) = 0;
    unint64_t v42 = 0;
    goto LABEL_68;
  }
  LOBYTE(v40) = 0;
  LOBYTE(v41) = 0;
  unint64_t v42 = 0;
  if (*((unsigned char *)a1 + 20))
  {
    unint64_t v39 = 0;
    unint64_t v41 = HIDWORD(v16);
    unint64_t v40 = HIDWORD(v24);
    if ((v31 & 0xFF00000000) == 0 || (v16 & 0xFF00000000) == 0)
    {
LABEL_55:
      unint64_t v42 = 0;
      if ((result & 0xFF00000000) == 0) {
        goto LABEL_68;
      }
      goto LABEL_56;
    }
    uint64_t v43 = (int)v31 - (uint64_t)(int)v16;
    if (v43 != (int)v43)
    {
      unint64_t v39 = 0;
      goto LABEL_55;
    }
    if ((unint64_t)(v43 + 2147483649) >> 32) {
      unint64_t v39 = 0;
    }
    else {
      unint64_t v39 = (v43 + 1) | (unint64_t)&_mh_execute_header;
    }
    unint64_t v42 = 0;
    if ((result & 0xFF00000000) != 0)
    {
LABEL_56:
      if ((v24 & 0xFF00000000) != 0)
      {
        uint64_t v44 = (int)result - (uint64_t)(int)v24;
        if (v44 == (int)v44)
        {
          if ((unint64_t)(v44 + 2147483649) >> 32) {
            unint64_t v42 = 0;
          }
          else {
            unint64_t v42 = (v44 + 1) | (unint64_t)&_mh_execute_header;
          }
        }
        else
        {
          unint64_t v42 = 0;
        }
      }
    }
  }
LABEL_68:
  *a4 = v16 & 0xFFFFFF00FFFFFFFFLL | ((unint64_t)v41 << 32);
  a4[1] = v24 & 0xFFFFFF00FFFFFFFFLL | ((unint64_t)v40 << 32);
  a4[2] = v39;
  a4[3] = v42;
  return result;
}

unint64_t sub_100023608(unsigned int *a1, int *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  if ((v2 & 0x80000000) != 0)
  {
    if ((v3 & 0x80000000) == 0)
    {
      if (v2 != 0x80000000 && *((unsigned char *)a1 + 4) != 0 && *((unsigned char *)a2 + 4) != 0)
      {
        int v13 = -(int)v2;
        BOOL v14 = __OFADD__(v3, v13);
        int v15 = v3 + v13;
        if (!v14 && (unint64_t)(v15 - 2147483649) >= 0xFFFFFFFF00000000 && v3 != 0)
        {
          int v17 = v15 - 1;
          if (v17) {
            int v18 = v17 / (int)v3;
          }
          else {
            int v18 = 0;
          }
          return ((unint64_t)(v18 != 0x80000000) << 32) | -v18;
        }
      }
      return 0;
    }
LABEL_38:
    if (*((unsigned char *)a1 + 4)) {
      BOOL v19 = *((unsigned char *)a2 + 4) == 0;
    }
    else {
      BOOL v19 = 1;
    }
    if (!v19 && v3 != 0)
    {
      if (!v2) {
        return (unint64_t)&_mh_execute_header | v2;
      }
      if (v2 != 0x80000000 || v3 != -1) {
        return (unint64_t)&_mh_execute_header | ((int)v2 / (int)v3);
      }
    }
    return 0;
  }
  if ((v3 & 0x80000000) == 0) {
    goto LABEL_38;
  }
  unint64_t v4 = 0;
  uint64_t v5 = v2 - v3;
  if (v5 == (int)v5) {
    unint64_t v6 = (v5 - 1) | (unint64_t)&_mh_execute_header;
  }
  else {
    unint64_t v6 = 0;
  }
  if (*((unsigned char *)a1 + 4)) {
    BOOL v7 = *((unsigned char *)a2 + 4) == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7) {
    unint64_t v6 = 0;
  }
  if (*((unsigned char *)a2 + 4)) {
    int v8 = -(int)v3;
  }
  else {
    int v8 = *a2;
  }
  if ((v6 & 0x100000000) != 0 && *((unsigned char *)a2 + 4))
  {
    uint64_t v9 = 0;
    if (v3 == 0x80000000) {
      return v4 | v9;
    }
    if (!v6)
    {
LABEL_21:
      uint64_t v9 = -(int)v6;
      unint64_t v4 = (unint64_t)(v6 != 0x80000000) << 32;
      return v4 | v9;
    }
    if (v6 != 0x80000000 || v8 != -1)
    {
      LODWORD(v6) = (int)v6 / v8;
      goto LABEL_21;
    }
    return 0;
  }
  return 0;
}

uint64_t Madusa::AffineTransform::AffineTransform(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 + 133016;
  unint64_t v4 = (void *)(a1 + 98784);
  uint64_t v5 = (void *)(a1 + 64552);
  *(void *)a1 = off_100070948;
  *(void *)(a1 + 8) = a2;
  bzero((void *)(a1 + 16), 0x3A00uLL);
  *(void *)(a1 + 14864) = off_100070968;
  bzero((void *)(a1 + 14872), 0x4000uLL);
  *(void *)(a1 + 31256) = a1 + 14864;
  *(void *)(a1 + 31264) = off_100070670;
  bzero((void *)(a1 + 31272), 0x8200uLL);
  void *v5 = a1 + 31264;
  v5[1] = off_100070988;
  bzero((void *)(a1 + 64568), 0x85A8uLL);
  void *v4 = v5 + 1;
  v4[1] = off_100070988;
  bzero((void *)(a1 + 98800), 0x85A8uLL);
  *(void *)uint64_t v3 = v4 + 1;
  *(void *)(a1 + 133032) = 0;
  *(void *)(a1 + 133040) = 0;
  *(void *)(a1 + 133024) = 0;
  *(_DWORD *)(v3 + 32) = 1;
  *(_WORD *)(v3 + 36) = 0;
  *(_OWORD *)(a1 + 133056) = 0u;
  *(_OWORD *)(a1 + 133072) = 0u;
  *(void *)(a1 + 133085) = 0;
  Madusa::FilterFMag::FilterFMag((void *)(a1 + 133096), (uint64_t)v5);
  Madusa::ImpulseMatchedFilter::ImpulseMatchedFilter((void *)(a1 + 133656), (uint64_t)v4, v3);
  Madusa::FindPeaks::FindPeaks((void *)(a1 + 133672), v3);
  bzero((void *)(a1 + 133688), 0xC40uLL);
  Madusa::PhaseDeviation::PhaseDeviation((int32x4_t *)(a1 + 136824));
  bzero((void *)(a1 + 141608), 0x2260uLL);
  return a1;
}

uint64_t Madusa::AffineTransform::Execute(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v7 = a1 + 133028;
  Madusa::ProfileTimer::ProfileTimer(v35, (uint64_t)&unk_10006F6CB, *(void *)(a1 + 8));
  uint64_t func = (uint64_t (*)(uint64_t, uint64_t))__find_func(0xCF5F3F5F00A06060, 568639626);
  uint64_t v9 = func(a1, a2);
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t))__find_func(0x1F3FBF7F00802010, -242990934);
  uint64_t v11 = v10(a1, v9);
  float v34 = 0.0;
  BOOL v12 = (uint64_t (*)(uint64_t, uint64_t, float *))__find_func(0xFF7FFF1FA0002020, 298057930);
  uint64_t v13 = v12(a1, v11, &v34);
  BOOL v14 = (void (*)(uint64_t, uint64_t, float))__find_func(0x9FFFDF1FC06000D0, 1900290250);
  v14(a1, v13, v34);
  v33[0] = xmmword_10006E100;
  v33[1] = xmmword_10006E110;
  v33[2] = xmmword_10006E120;
  v33[3] = xmmword_10006E100;
  v33[4] = xmmword_10006E110;
  v33[5] = xmmword_10006E120;
  int v15 = (uint64_t (*)(uint64_t, _OWORD *))__find_func(0xDF3F7F5F602080F0, 830767242);
  uint64_t v16 = v15(a1, v33);
  int v17 = (void (*)(_OWORD *, uint64_t, uint64_t))__find_func(0x3F3F1FFFE0A04060, -779821014);
  v17(v33, v16, a1 + 16);
  int v18 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))__find_func(0xFF5F5FFFA0A02050, 300195882);
  v18(a1, a1 + 16, v9, v16);
  if ((int)v16 >= 2)
  {
    int v19 = 0;
    float v20 = *(float *)(a1 + 7460);
    BOOL v21 = (float *)(a1 + 8388);
    uint64_t v22 = 1;
    do
    {
      BOOL v23 = *v21 <= v20;
      float v20 = fmaxf(*v21, v20);
      if (!v23) {
        int v19 = v22;
      }
      ++v22;
      v21 += 232;
    }
    while (v16 != v22);
    if (v19 > 0)
    {
      memcpy(__dst, (const void *)(a1 + 7456), sizeof(__dst));
      unint64_t v24 = (_OWORD *)(a1 + 7440 + 928 * v19);
      memcpy((void *)(a1 + 7456), v24 + 1, 0x390uLL);
      long long v25 = *(_OWORD *)(a1 + 7440);
      *(_OWORD *)(a1 + 7440) = *v24;
      *unint64_t v24 = v25;
      memcpy(v24 + 1, __dst, 0x390uLL);
    }
  }
  unint64_t v26 = (void (*)(uint64_t, uint64_t, uint64_t))__find_func(0x9F7F9F5FA040C070, 1908695178);
  v26(a1, a2, a1 + 7440);
  int v27 = (void (*)(uint64_t, uint64_t, uint64_t))__find_func(0xBFDF1FDF40C040F0, 1365565450);
  v27(a1, a1 + 7440, a1 + 133024);
  if (*(unsigned char *)(v7 + 64))
  {
    uint64_t v28 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))__find_func(0x9F7F5F5F80C0E0F0, 1908711562);
    v28(a1, a2, a1 + 7440, a1 + 133024);
  }
  else
  {
    int v29 = 0;
  }
  *(_DWORD *)uint64_t v7 = v29;
  *a3 = 1;
  if ((*v3 & 0x1F) == 0 && v3[2] <= 0x3Fu && v3[3] == 212
    || QuickCodec::mask != -70947757)
  {
    QuickCodec::masint k = FunctionTable::ft[0] ^ 0x157E9386;
    uint64_t v30 = __find_func(0xDF9FDF1FC0E04070, 824451274);
    uint64_t v31 = 0;
    while (*(unsigned __int8 *)(v30 + v31) != ((QuickCodec::mask ^ 0xC12A2DF3) / 0x9D28AF)
         || *(unsigned __int8 *)(v30 + v31 + 1) != ((QuickCodec::mask ^ 0xFBC56C53) / 0x9D28AF)
         || *(unsigned __int8 *)(v30 + v31 + 2) != ((QuickCodec::mask ^ 0xDDCAB631) / 0x9D28AF)
         || *(unsigned __int8 *)(v30 + v31 + 3) != ((QuickCodec::mask ^ 0x79E0DCBFu) / 0x9D28AF))
    {
      v31 += 4;
      if (v31 == 2400) {
        goto LABEL_22;
      }
    }
    uint64_t vars0 = v30 + v31;
    long long vars8 = 0u;
LABEL_22:
    QuickCodec::mask += 16;
  }
  Madusa::ProfileTimer::~ProfileTimer((Madusa::ProfileTimer *)v35);
  return a1 + 133024;
}

uint64_t Madusa::AffineTransform::_Execute(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if ((*v3 & 0x1F) != 0 || v3[2] > 0x3Fu)
  {
    int v4 = QuickCodec::mask;
    if (QuickCodec::mask == -70947757) {
      return Madusa::AffineTransform::Execute(a1, a2, a3);
    }
LABEL_7:
    QuickCodec::masint k = v4 + 1;
    return Madusa::AffineTransform::Execute(a1, a2, a3);
  }
  int v6 = 3146524 * v3[3];
  int v4 = QuickCodec::mask;
  if ((v6 ^ 0x27C29330 | v6 & 0x27C29330) - (v6 + 667063088) + ~(v6 ^ 0x27C29330 | ~(v6 | 0x27C29330)) == ~(~(~(~(v6 | 0x27C08120) | v6 & 0x27C08120) | 0x21210) | ~(~(v6 | 0x27C08120) | v6 & 0x27C08120) & 0x21210)
    || QuickCodec::mask != -70947757)
  {
    goto LABEL_7;
  }
  return Madusa::AffineTransform::Execute(a1, a2, a3);
}

uint64_t Madusa::AffineTransform::_Execute_Alt(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  int v4 = 0;
  int v5 = 0;
  if (QuickCodec::mask == -70947757) {
    int v6 = 3297410;
  }
  else {
    int v6 = 3198538;
  }
  uint64_t v7 = 1;
  int v8 = 3486;
  do
  {
    while (1)
    {
      while (1)
      {
        while (1)
        {
          uint64_t v9 = v7;
          if (v8 > 3198537) {
            break;
          }
          switch(v8)
          {
            case 3486:
              uint64_t v7 = 0;
              int v8 = 3198538;
              break;
            case 3503:
              uint64_t v7 = (QuickCodec::mask != -70947757) | v7;
              int v8 = v6;
              break;
            case 3557:
              if ((*v4 & 0x1F) != 0
                || v4[2] > 0x3Fu
                || (uint64_t v7 = 1,
                    int v8 = 3198538,
                    v4[3] != ((QuickCodec::mask ^ v5) / 0x3B851F)))
              {
                int v8 = 3198592;
                uint64_t v7 = v9;
              }
              break;
          }
        }
        if (v8 <= 3202006) {
          break;
        }
        if (v8 == 3202007)
        {
          int v4 = (unsigned char *)v3;
          int v8 = 3503;
        }
        else if (v8 == 3297410)
        {
          int v8 = 3557;
          int v5 = -896577025;
        }
      }
      if (v8 != 3198538) {
        break;
      }
      if (v7) {
        int v10 = 54;
      }
      else {
        int v10 = 3469;
      }
      int v8 = v10 + 3198538;
    }
  }
  while (v8 != 3198592);
  if (v7) {
    ++QuickCodec::mask;
  }
  return Madusa::AffineTransform::Execute_Alt(a1, 3202006, a3);
}

uint64_t Madusa::AffineTransform::Execute_Alt(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 1;
  return a1 + 133024;
}

float Madusa::AffineTransform::ERSExecute(uint64_t a1, uint64_t a2, _OWORD *a3, _OWORD *a4)
{
  Madusa::ProfileTimer::ProfileTimer(v16, (uint64_t)&unk_10006F6CB, *(void *)(a1 + 8));
  long long v9 = a4[1];
  v14[1] = *a4;
  long long v15 = v9;
  v14[0] = *a3;
  if ((*v4 & 0x1F) == 0 && v4[2] <= 0x3Fu && v4[3] == 212
    || QuickCodec::mask != -70947757)
  {
    QuickCodec::masint k = FunctionTable::ft[0] ^ 0x157E9386;
    uint64_t func = (void (*)(void, uint64_t))__find_func(0xBFBF1F1FC0C00040, 1359274186);
    func(0, 104);
  }
  uint64_t v11 = (float (*)(uint64_t, uint64_t, _OWORD *, long long *, char *))__find_func(0xAFBF9FFF80C00020, 1090805802);
  float v12 = v11(a1 + 141608, a2, v14, &v15, (char *)&v15 + 8);
  Madusa::ProfileTimer::~ProfileTimer((Madusa::ProfileTimer *)v16);
  return v12;
}

float Madusa::AffineTransform::_ERSExecute(uint64_t a1, uint64_t a2, _OWORD *a3, _OWORD *a4)
{
  int v5 = 0;
  int v6 = 0;
  if (QuickCodec::mask == -70947757) {
    int v7 = 7197505;
  }
  else {
    int v7 = 2709429;
  }
  uint64_t v8 = 1;
  int v9 = 2466348;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v11 = v8;
        if (v9 > 2709428) {
          break;
        }
        if (v9 == 2466348)
        {
          uint64_t v8 = 0;
          int v9 = 2709429;
        }
        else if (v9 == 2466365)
        {
          uint64_t v8 = (QuickCodec::mask != -70947757) | v8;
          int v9 = v7;
        }
        else if ((*v5 & 0x1F) != 0 {
               || v5[2] > 0x3Fu
        }
               || (uint64_t v8 = 1,
                   int v9 = 2709429,
                   v5[3] != ((QuickCodec::mask ^ v6) / 0x409C40)))
        {
          int v9 = 2709483;
          uint64_t v8 = v11;
        }
      }
      if (v9 <= 5175759) {
        break;
      }
      if (v9 == 5175760)
      {
        int v5 = (unsigned char *)v4;
        int v9 = 2466365;
      }
      else
      {
        BOOL v10 = v9 == 7197505;
        int v9 = 2466419;
        if (v10) {
          int v6 = -834401965;
        }
      }
    }
    if (v9 != 2709429) {
      break;
    }
    int v9 = 2709483;
    if ((v8 & 1) == 0) {
      int v9 = 5175760;
    }
  }
  if (v8) {
    ++QuickCodec::mask;
  }
  return Madusa::AffineTransform::ERSExecute(a1, a2, a3, a4);
}

uint64_t Madusa::AffineTransform::GetUnrefinedLinearTransform(Madusa::AffineTransform *this)
{
  uint64_t v2 = 0;
  int v3 = 0;
  if (QuickCodec::mask == -70947757) {
    int v4 = 17880902;
  }
  else {
    int v4 = 7872420;
  }
  uint64_t v5 = 1;
  int v6 = 8937272;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v9 = v5;
        if (v6 <= 8937342) {
          break;
        }
        if (v6 == 8937343)
        {
          if ((*v2 & 0x1F) != 0
            || v2[2] > 0x3Fu
            || (uint64_t v5 = 1,
                int v6 = 7872420,
                v2[3] != ((QuickCodec::mask ^ v3) / 0x969885)))
          {
            int v6 = 7872474;
            uint64_t v5 = v9;
          }
        }
        else if (v6 == 16809675)
        {
          uint64_t v2 = v1;
          int v6 = 8937289;
        }
        else
        {
          BOOL v10 = v6 == 17880902;
          int v6 = 8937343;
          if (v10) {
            int v3 = -2022497673;
          }
        }
      }
      if (v6 <= 8937271) {
        break;
      }
      unsigned int v7 = (QuickCodec::mask != -70947757) | v5;
      if (v6 == 8937289) {
        int v8 = v4;
      }
      else {
        int v8 = v6;
      }
      if (v6 == 8937289) {
        LODWORD(v9) = v7;
      }
      BOOL v10 = v6 == 8937272;
      if (v6 == 8937272) {
        int v6 = 7872420;
      }
      else {
        int v6 = v8;
      }
      if (v10) {
        uint64_t v5 = 0;
      }
      else {
        uint64_t v5 = v9;
      }
    }
    if (v6 != 7872420) {
      break;
    }
    int v6 = 7872474;
    if ((v5 & 1) == 0) {
      int v6 = 16809675;
    }
  }
  if (v5)
  {
    unint64_t v11 = 0;
    int v12 = FunctionTable::ft ^ 0x157E9386;
    QuickCodec::masint k = FunctionTable::ft ^ 0x157E9386;
    int v13 = -1;
    do
    {
      qword_100074AF8[v13
                    + 1
                    + ((FunctionTable::swapTable[v11] ^ v12) / 0x9D28AF)] = qword_100074AF8[v13 + ((FunctionTable::swapTable[v11 + 1] ^ v12) / 0x9D28AF)];
      v13 -= 2;
      BOOL v14 = v11 >= 0x20;
      v11 += 2;
    }
    while (!v14);
  }
  return (uint64_t)this + 16;
}

uint64_t Madusa::AffineTransform::_GetUnrefinedLinearTransform(Madusa::AffineTransform *this, const Madusa::AffineTransform *a2)
{
  int v3 = 0;
  int v4 = 0;
  if (QuickCodec::mask == -70947757) {
    int v5 = 12631176;
  }
  else {
    int v5 = 3118957;
  }
  uint64_t v6 = 1;
  int v7 = 97198;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v9 = v6;
        if (v7 > 3118956) {
          break;
        }
        if (v7 == 97198)
        {
          uint64_t v6 = 0;
          int v7 = 3118957;
        }
        else if (v7 == 97215)
        {
          uint64_t v6 = (QuickCodec::mask != -70947757) | v6;
          int v7 = v5;
        }
        else if ((*v3 & 0x1F) != 0 {
               || v3[2] > 0x3Fu
        }
               || (uint64_t v6 = 1,
                   int v7 = 3118957,
                   v3[3] != ((QuickCodec::mask ^ v4) / 0x605DC0)))
        {
          int v7 = 3119011;
          uint64_t v6 = v9;
        }
      }
      if (v7 <= 3216137) {
        break;
      }
      if (v7 == 3216138)
      {
        int v3 = (unsigned char *)v2;
        int v7 = 97215;
      }
      else
      {
        BOOL v8 = v7 == 12631176;
        int v7 = 97269;
        if (v8) {
          int v4 = -1274491053;
        }
      }
    }
    if (v7 != 3118957) {
      break;
    }
    int v7 = 3119011;
    if ((v6 & 1) == 0) {
      int v7 = 3216138;
    }
  }
  if (v6) {
    ++QuickCodec::mask;
  }
  return Madusa::AffineTransform::GetUnrefinedLinearTransform(this);
}

uint64_t Madusa::AffineTransform::FilterFMagExecute(uint64_t a1, uint64_t a2)
{
  Madusa::ProfileTimer::ProfileTimer(v8, (uint64_t)&unk_10006F6CB, *(void *)(a1 + 8));
  uint64_t func = (void (*)(uint64_t, uint64_t))__find_func(0xFF3F9F3F40C0A080, 293888234);
  func(a1 + 133096, a2);
  if ((*v2 & 0x1F) != 0 || v2[2] > 0x3Fu)
  {
    if (QuickCodec::mask != -70947757)
    {
LABEL_10:
      QuickCodec::masint k = FunctionTable::ft[0] ^ 0x157E9386;
      fegetenv(&v9);
      v9.__fpcr &= QuickCodec::mask + 70947740;
      fesetenv(&v9);
    }
  }
  else if (v2[3] == 212 || QuickCodec::mask != -70947757)
  {
    goto LABEL_10;
  }
  Madusa::ProfileTimer::~ProfileTimer((Madusa::ProfileTimer *)v8);
  return a1 + 64552;
}

uint64_t Madusa::AffineTransform::_FilterFMagExecute(uint64_t a1, uint64_t a2)
{
  int v3 = 0;
  int v4 = 0;
  if (QuickCodec::mask == -70947757) {
    int v5 = 841040;
  }
  else {
    int v5 = 8230;
  }
  uint64_t v6 = 1;
  int v7 = 273774;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v10 = v6;
        if (v7 <= 273844) {
          break;
        }
        if (v7 == 273845)
        {
          if ((*v3 & 0x1F) != 0
            || v3[2] > 0x3Fu
            || (uint64_t v6 = 1,
                int v7 = 8230,
                v3[3] != ((QuickCodec::mask ^ v4) / 0x42FE)))
          {
            int v7 = 8284;
            uint64_t v6 = v10;
          }
        }
        else if (v7 == 281987)
        {
          int v3 = (unsigned char *)v2;
          int v7 = 273791;
        }
        else
        {
          BOOL v11 = v7 == 841040;
          int v7 = 273845;
          if (v11) {
            int v4 = -68020725;
          }
        }
      }
      if (v7 <= 273773) {
        break;
      }
      unsigned int v8 = (QuickCodec::mask != -70947757) | v6;
      if (v7 == 273791) {
        int v9 = v5;
      }
      else {
        int v9 = v7;
      }
      if (v7 == 273791) {
        LODWORD(v10) = v8;
      }
      BOOL v11 = v7 == 273774;
      if (v7 == 273774) {
        int v7 = 8230;
      }
      else {
        int v7 = v9;
      }
      if (v11) {
        uint64_t v6 = 0;
      }
      else {
        uint64_t v6 = v10;
      }
    }
    if (v7 != 8230) {
      break;
    }
    if (v6) {
      int v7 = 8284;
    }
    else {
      int v7 = 281987;
    }
  }
  if (v6) {
    ++QuickCodec::mask;
  }
  return Madusa::AffineTransform::FilterFMagExecute(a1, a2);
}

uint64_t Madusa::AffineTransform::_FilterFMagExecute_Alt(uint64_t a1)
{
  if ((*v1 & 0x1F) != 0 || v1[2] > 0x3Fu)
  {
    int v2 = QuickCodec::mask;
    if (QuickCodec::mask != -70947757) {
LABEL_10:
    }
      QuickCodec::masint k = v2 + 1;
  }
  else
  {
    int v2 = QuickCodec::mask;
    if (v1[3] == 212 || QuickCodec::mask != -70947757) {
      goto LABEL_10;
    }
  }
  return Madusa::AffineTransform::FilterFMagExecute_Alt(a1);
}

uint64_t Madusa::AffineTransform::FilterFMagExecute_Alt(uint64_t a1)
{
  return a1 + 64552;
}

uint64_t Madusa::AffineTransform::PadAndFoldExecute(uint64_t a1, uint64_t a2)
{
  Madusa::ProfileTimer::ProfileTimer(var58, (uint64_t)&unk_10006F6CB, *(void *)(a1 + 8));
  uint64_t func = (void (*)(uint64_t, uint64_t, uint64_t))__find_func(0xFFFFBFFF6060C0E0, 289685546);
  func(a1, a2, a1 + 31256);
  uint64_t v6 = 0;
  int v7 = 0;
  if (QuickCodec::mask == -70947757) {
    int v8 = 7540977;
  }
  else {
    int v8 = 5340247;
  }
  uint64_t v9 = 1;
  int v10 = 357018;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v11 = v9;
        if (v10 > 5340246) {
          break;
        }
        if (v10 == 357018)
        {
          uint64_t v9 = 0;
          int v10 = 5340247;
        }
        else if (v10 == 357035)
        {
          uint64_t v9 = (QuickCodec::mask != -70947757) | v9;
          int v10 = v8;
        }
        else if ((*v6 & 0x1F) != 0 {
               || v6[2] > 0x3Fu
        }
               || (uint64_t v9 = 1,
                   int v10 = 5340247,
                   v6[3] != ((QuickCodec::mask ^ v7) / 0x998B6B)))
        {
          int v10 = 5340301;
          uint64_t v9 = v11;
        }
      }
      if (v10 <= 5697247) {
        break;
      }
      if (v10 == 5697248)
      {
        uint64_t v6 = v2;
        int v10 = 357035;
      }
      else
      {
        BOOL v12 = v10 == 7540977;
        int v10 = 357089;
        if (v12) {
          int v7 = -2065557297;
        }
      }
    }
    if (v10 != 5340247) {
      break;
    }
    if (v9) {
      int v10 = 5340301;
    }
    else {
      int v10 = 5697248;
    }
  }
  if (v9)
  {
    QuickCodec::masint k = FunctionTable::ft[0] ^ 0x157E9386;
    uint64_t v13 = __find_func(0xDF9FDF1FC0E04070, 824451274);
    uint64_t v14 = 0;
    while (*(unsigned __int8 *)(v13 + v14) != ((QuickCodec::mask ^ 0xC12A2DF3) / 0x9D28AF)
         || *(unsigned __int8 *)(v13 + v14 + 1) != ((QuickCodec::mask ^ 0xFBC56C53) / 0x9D28AF)
         || *(unsigned __int8 *)(v13 + v14 + 2) != ((QuickCodec::mask ^ 0xDDCAB631) / 0x9D28AF)
         || *(unsigned __int8 *)(v13 + v14 + 3) != ((QuickCodec::mask ^ 0x79E0DCBFu) / 0x9D28AF))
    {
      v14 += 4;
      if (v14 == 2400) {
        goto LABEL_32;
      }
    }
    var58[11] = v13 + v14;
    long long vars8 = 0u;
LABEL_32:
    QuickCodec::mask += 16;
  }
  Madusa::ProfileTimer::~ProfileTimer((Madusa::ProfileTimer *)var58);
  return a1 + 31256;
}

uint64_t Madusa::AffineTransform::_PadAndFoldExecute(uint64_t a1, uint64_t a2)
{
  int v3 = 0;
  int v4 = 0;
  if (QuickCodec::mask == -70947757) {
    int v5 = 2662966;
  }
  else {
    int v5 = 73826;
  }
  uint64_t v6 = 1;
  int v7 = 2238422;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v10 = v6;
        if (v7 <= 2238492) {
          break;
        }
        if (v7 == 2238493)
        {
          if ((*v3 & 0x1F) != 0
            || v3[2] > 0x3Fu
            || (uint64_t v6 = 1,
                int v7 = 73826,
                v3[3] != ((QuickCodec::mask ^ v4) / 0x81596)))
          {
            int v7 = 73880;
            uint64_t v6 = v10;
          }
        }
        else if (v7 == 2312231)
        {
          int v3 = (unsigned char *)v2;
          int v7 = 2238439;
        }
        else
        {
          BOOL v11 = v7 == 2662966;
          int v7 = 2238493;
          if (v11) {
            int v4 = -42693525;
          }
        }
      }
      if (v7 <= 2238421) {
        break;
      }
      unsigned int v8 = (QuickCodec::mask != -70947757) | v6;
      if (v7 == 2238439) {
        int v9 = v5;
      }
      else {
        int v9 = v7;
      }
      if (v7 == 2238439) {
        LODWORD(v10) = v8;
      }
      BOOL v11 = v7 == 2238422;
      if (v7 == 2238422) {
        int v7 = 73826;
      }
      else {
        int v7 = v9;
      }
      if (v11) {
        uint64_t v6 = 0;
      }
      else {
        uint64_t v6 = v10;
      }
    }
    if (v7 != 73826) {
      break;
    }
    int v7 = 73880;
    if ((v6 & 1) == 0) {
      int v7 = 2312231;
    }
  }
  if (v6) {
    ++QuickCodec::mask;
  }
  return Madusa::AffineTransform::PadAndFoldExecute(a1, a2);
}

uint64_t Madusa::AffineTransform::LogPolarRemapExecute(uint64_t a1, uint64_t a2, uint64_t a3)
{
  Madusa::ProfileTimer::ProfileTimer(v13, (uint64_t)&unk_10006F6CB, *(void *)(a1 + 8));
  uint64_t v7 = a1 + 133648;
  uint64_t v8 = a1 + 98784;
  uint64_t func = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))__find_func(0x9F1FDF7F20E080F0, 1906581674);
  func(v7, a2, v8, a3);
  if ((*v3 & 0x1F) != 0 || v3[2] > 0x3Fu)
  {
    if (QuickCodec::mask != -70947757)
    {
LABEL_10:
      QuickCodec::masint k = FunctionTable::ft[0] ^ 0x157E9386;
      BOOL v11 = (void (*)(void, uint64_t))__find_func(0xBFBF1F1FC0C00040, 1359274186);
      v11(0, 104);
    }
  }
  else if (v3[3] == 212 || QuickCodec::mask != -70947757)
  {
    goto LABEL_10;
  }
  Madusa::ProfileTimer::~ProfileTimer((Madusa::ProfileTimer *)v13);
  return v8;
}

uint64_t Madusa::AffineTransform::_LogPolarRemapExecute(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((*v3 & 0x1F) != 0 || v3[2] > 0x3Fu)
  {
    int v4 = QuickCodec::mask;
    if (QuickCodec::mask != -70947757) {
LABEL_10:
    }
      QuickCodec::masint k = v4 + 1;
  }
  else
  {
    int v4 = QuickCodec::mask;
    if (v3[3] == 212 || QuickCodec::mask != -70947757) {
      goto LABEL_10;
    }
  }
  return Madusa::AffineTransform::LogPolarRemapExecute(a1, a2, a3);
}

uint64_t Madusa::AffineTransform::_LogPolarRemapExecute_Alt(uint64_t a1)
{
  if ((*v1 & 0x1F) != 0 || v1[2] > 0x3Fu)
  {
    int v2 = QuickCodec::mask;
    if (QuickCodec::mask != -70947757) {
LABEL_10:
    }
      QuickCodec::masint k = v2 + 1;
  }
  else
  {
    int v2 = QuickCodec::mask;
    if (v1[3] == 212 || QuickCodec::mask != -70947757) {
      goto LABEL_10;
    }
  }
  return Madusa::AffineTransform::LogPolarRemapExecute_Alt(a1);
}

uint64_t Madusa::AffineTransform::LogPolarRemapExecute_Alt(uint64_t a1)
{
  return a1 + 98784;
}

uint64_t Madusa::AffineTransform::ImpulseMatchedFilterExecute(uint64_t a1, float a2)
{
  Madusa::ProfileTimer::ProfileTimer(v20, (uint64_t)&unk_10006F6CB, *(void *)(a1 + 8));
  uint64_t func = (void (*)(uint64_t, float))__find_func(0x5F7FDFDF8000C0C0, -1312546806);
  func(a1 + 133656, a2);
  uint64_t v6 = 0;
  int v7 = 0;
  if (QuickCodec::mask == -70947757) {
    int v8 = 9343236;
  }
  else {
    int v8 = 3592819;
  }
  uint64_t v9 = 1;
  int v10 = 4038623;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v13 = v9;
        if (v10 <= 4038693) {
          break;
        }
        if (v10 == 4038694)
        {
          if ((*v6 & 0x1F) != 0
            || v6[2] > 0x3Fu
            || (uint64_t v9 = 1,
                int v10 = 3592819,
                v6[3] != ((QuickCodec::mask ^ v7) / 0x3E244C)))
          {
            int v10 = 3592873;
            uint64_t v9 = v13;
          }
        }
        else if (v10 == 7631425)
        {
          uint64_t v6 = v2;
          int v10 = 4038640;
        }
        else
        {
          BOOL v14 = v10 == 9343236;
          int v10 = 4038694;
          if (v14) {
            int v7 = -927767901;
          }
        }
      }
      if (v10 <= 4038622) {
        break;
      }
      unsigned int v11 = (QuickCodec::mask != -70947757) | v9;
      if (v10 == 4038640) {
        int v12 = v8;
      }
      else {
        int v12 = v10;
      }
      if (v10 == 4038640) {
        LODWORD(v13) = v11;
      }
      BOOL v14 = v10 == 4038623;
      if (v10 == 4038623) {
        int v10 = 3592819;
      }
      else {
        int v10 = v12;
      }
      if (v14) {
        uint64_t v9 = 0;
      }
      else {
        uint64_t v9 = v13;
      }
    }
    if (v10 != 3592819) {
      break;
    }
    if (v9) {
      int v10 = 3592873;
    }
    else {
      int v10 = 7631425;
    }
  }
  if (v9)
  {
    unint64_t v15 = 0;
    int v16 = FunctionTable::ft[0] ^ 0x157E9386;
    QuickCodec::masint k = FunctionTable::ft[0] ^ 0x157E9386;
    int v17 = -1;
    do
    {
      qword_100074AF8[v17
                    + 1
                    + ((FunctionTable::swapTable[v15] ^ v16) / 0x9D28AF)] = qword_100074AF8[v17 + ((FunctionTable::swapTable[v15 + 1] ^ v16) / 0x9D28AF)];
      v17 -= 2;
      BOOL v18 = v15 >= 0x20;
      v15 += 2;
    }
    while (!v18);
  }
  Madusa::ProfileTimer::~ProfileTimer((Madusa::ProfileTimer *)v20);
  return a1 + 133016;
}

uint64_t Madusa::AffineTransform::_ImpulseMatchedFilterExecute(uint64_t a1, float a2)
{
  if ((*v2 & 0x1F) != 0 || v2[2] > 0x3Fu)
  {
    int v3 = QuickCodec::mask;
    if (QuickCodec::mask != -70947757) {
LABEL_10:
    }
      QuickCodec::masint k = v3 + 1;
  }
  else
  {
    int v3 = QuickCodec::mask;
    if (v2[3] == 212 || QuickCodec::mask != -70947757) {
      goto LABEL_10;
    }
  }
  return Madusa::AffineTransform::ImpulseMatchedFilterExecute(a1, a2);
}

uint64_t Madusa::AffineTransform::_ImpulseMatchedFilterExecute_Alt(uint64_t a1, int8x8_t a2)
{
  a2.i32[0] = *v2 | 0xFFFFFFE0;
  a2.i8[4] = v2[3];
  *(int8x8_t *)v3.i8 = vand_s8(a2, (int8x8_t)0xFF000000FFLL);
  v3.i64[1] = v3.i64[0];
  float32x4_t v4 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v3, (int32x4_t)xmmword_10006E130));
  v5.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_10006E140, v4)).u32[0];
  v5.i32[1] = vmovn_s32(vcgtq_f32(v4, (float32x4_t)xmmword_10006E140)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v5, 0xFuLL))) & ((v2[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    ++QuickCodec::mask;
  }
  return Madusa::AffineTransform::ImpulseMatchedFilterExecute_Alt(a1);
}

uint64_t Madusa::AffineTransform::ImpulseMatchedFilterExecute_Alt(uint64_t a1)
{
  return a1 + 133016;
}

uint64_t Madusa::AffineTransform::FindPeaksExecute(uint64_t a1, uint64_t a2)
{
  Madusa::ProfileTimer::ProfileTimer(v15, (uint64_t)&unk_10006F6CB, *(void *)(a1 + 8));
  int16x4_t v5 = 0;
  int v6 = 0;
  if (QuickCodec::mask == -70947757) {
    int v7 = 8651612;
  }
  else {
    int v7 = 1388973;
  }
  uint64_t v8 = 1;
  int v9 = 553583;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v11 = v8;
        if (v9 > 1388972) {
          break;
        }
        if (v9 == 553583)
        {
          uint64_t v8 = 0;
          int v9 = 1388973;
        }
        else if (v9 == 553600)
        {
          uint64_t v8 = (QuickCodec::mask != -70947757) | v8;
          int v9 = v7;
        }
        else if ((*v5 & 0x1F) != 0 {
               || v5[2] > 0x3Fu
        }
               || (uint64_t v8 = 1,
                   int v9 = 1388973,
                   v5[3] != ((QuickCodec::mask ^ v6) / 0x16D66C)))
        {
          int v9 = 1389027;
          uint64_t v8 = v11;
        }
      }
      if (v9 <= 1942538) {
        break;
      }
      if (v9 == 1942539)
      {
        int16x4_t v5 = v2;
        int v9 = 553600;
      }
      else
      {
        BOOL v10 = v9 == 8651612;
        int v9 = 553654;
        if (v10) {
          int v6 = -382927581;
        }
      }
    }
    if (v9 != 1388973) {
      break;
    }
    if (v8) {
      int v9 = 1389027;
    }
    else {
      int v9 = 1942539;
    }
  }
  if (v8)
  {
    QuickCodec::masint k = FunctionTable::ft[0] ^ 0x157E9386;
    fegetenv(&v16);
    v16.__fpcr &= QuickCodec::mask + 70947740;
    fesetenv(&v16);
  }
  uint64_t func = (uint64_t (*)(uint64_t, uint64_t))__find_func(0xFF9F5F1F2020A0E0, 287613130);
  uint64_t v13 = func(a1 + 133672, a2);
  Madusa::ProfileTimer::~ProfileTimer((Madusa::ProfileTimer *)v15);
  return v13;
}

uint64_t Madusa::AffineTransform::_FindPeaksExecute(uint64_t a1, uint64_t a2)
{
  if ((*v2 & 0x1F) != 0 || v2[2] > 0x3Fu)
  {
    int v3 = QuickCodec::mask;
    if (QuickCodec::mask != -70947757) {
LABEL_10:
    }
      QuickCodec::masint k = v3 + 1;
  }
  else
  {
    int v3 = QuickCodec::mask;
    if (v2[3] == 212 || QuickCodec::mask != -70947757) {
      goto LABEL_10;
    }
  }
  return Madusa::AffineTransform::FindPeaksExecute(a1, a2);
}

uint64_t Madusa::AffineTransform::RefineCandidateList(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  Madusa::ProfileTimer::ProfileTimer(var68, (uint64_t)&unk_10006F6CB, *(void *)(a1 + 8));
  long long v25 = 0uLL;
  if (a4 >= 1)
  {
    int v8 = 0;
    uint64_t v9 = 0;
    do
    {
      int v24 = 0;
      uint64_t func = (void (*)(uint64_t, uint64_t, uint64_t, long long *, int *))__find_func(0x2FDF5F3F2000A000, -1050369814);
      func(a1 + 133688, a2 + v9, a3, &v25, &v24);
      uint64_t v12 = a1 + v9;
      if ((long long *)(a1 + 7440 + v9) != &v25) {
        *(_OWORD *)(v12 + 7440) = v25;
      }
      *(_DWORD *)(v12 + 7468) = v8;
      *(_DWORD *)(v12 + 7464) = v24;
      *(_DWORD *)(v12 + 7456) = *(_DWORD *)(a2 + v9 + 16);
      *(_DWORD *)(v12 + 7460) = v11;
      v9 += 928;
      ++v8;
    }
    while (928 * a4 != v9);
  }
  uint64_t v13 = 0;
  int v14 = 0;
  if (QuickCodec::mask == -70947757) {
    int v15 = 5602011;
  }
  else {
    int v15 = 4770158;
  }
  uint64_t v16 = 1;
  int v17 = 619522;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v18 = v16;
        if (v17 > 4770157) {
          break;
        }
        if (v17 == 619522)
        {
          uint64_t v16 = 0;
          int v17 = 4770158;
        }
        else if (v17 == 619539)
        {
          uint64_t v16 = (QuickCodec::mask != -70947757) | v16;
          int v17 = v15;
        }
        else if ((*v13 & 0x1F) != 0 {
               || v13[2] > 0x3Fu
        }
               || (uint64_t v16 = 1,
                   int v17 = 4770158,
                   v13[3] != ((QuickCodec::mask ^ v14) / 0x7611E8)))
        {
          int v17 = 4770212;
          uint64_t v16 = v18;
        }
      }
      if (v17 <= 5389662) {
        break;
      }
      if (v17 == 5389663)
      {
        uint64_t v13 = v4;
        int v17 = 619539;
      }
      else
      {
        BOOL v19 = v17 == 5602011;
        int v17 = 619593;
        if (v19) {
          int v14 = -1711032205;
        }
      }
    }
    if (v17 != 4770158) {
      break;
    }
    if (v16) {
      int v17 = 4770212;
    }
    else {
      int v17 = 5389663;
    }
  }
  if (v16)
  {
    QuickCodec::masint k = FunctionTable::ft[0] ^ 0x157E9386;
    uint64_t v20 = __find_func(0xDF9FDF1FC0E04070, 824451274);
    uint64_t v21 = 0;
    while (*(unsigned __int8 *)(v20 + v21) != ((QuickCodec::mask ^ 0xC12A2DF3) / 0x9D28AF)
         || *(unsigned __int8 *)(v20 + v21 + 1) != ((QuickCodec::mask ^ 0xFBC56C53) / 0x9D28AF)
         || *(unsigned __int8 *)(v20 + v21 + 2) != ((QuickCodec::mask ^ 0xDDCAB631) / 0x9D28AF)
         || *(unsigned __int8 *)(v20 + v21 + 3) != ((QuickCodec::mask ^ 0x79E0DCBFu) / 0x9D28AF))
    {
      v21 += 4;
      if (v21 == 2400) {
        goto LABEL_37;
      }
    }
    var68[13] = v20 + v21;
    long long vars8 = 0u;
LABEL_37:
    QuickCodec::mask += 16;
  }
  Madusa::ProfileTimer::~ProfileTimer((Madusa::ProfileTimer *)var68);
  return a1 + 7440;
}

uint64_t Madusa::AffineTransform::_RefineCandidateList(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int16x4_t v5 = 0;
  int v6 = 0;
  if (QuickCodec::mask == -70947757) {
    int v7 = 4617796;
  }
  else {
    int v7 = 3586358;
  }
  uint64_t v8 = 1;
  int v9 = 216246;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v11 = v8;
        if (v9 > 3586357) {
          break;
        }
        if (v9 == 216246)
        {
          uint64_t v8 = 0;
          int v9 = 3586358;
        }
        else if (v9 == 216263)
        {
          uint64_t v8 = (QuickCodec::mask != -70947757) | v8;
          int v9 = v7;
        }
        else if ((*v5 & 0x1F) != 0 {
               || v5[2] > 0x3Fu
        }
               || (uint64_t v8 = 1,
                   int v9 = 3586358,
                   v5[3] != ((QuickCodec::mask ^ v6) / 0x3F52FB)))
        {
          int v9 = 3586412;
          uint64_t v8 = v11;
        }
      }
      if (v9 <= 3802586) {
        break;
      }
      if (v9 == 3802587)
      {
        int16x4_t v5 = (unsigned char *)v4;
        int v9 = 216263;
      }
      else
      {
        BOOL v10 = v9 == 4617796;
        int v9 = 216317;
        if (v10) {
          int v6 = -810165361;
        }
      }
    }
    if (v9 != 3586358) {
      break;
    }
    int v9 = 3586412;
    if ((v8 & 1) == 0) {
      int v9 = 3802587;
    }
  }
  if (v8) {
    ++QuickCodec::mask;
  }
  return Madusa::AffineTransform::RefineCandidateList(a1, a2, a3, a4);
}

void Madusa::AffineTransform::PhaseEstimateExecute(uint64_t a1, uint64_t a2, uint64_t a3)
{
  Madusa::ProfileTimer::ProfileTimer(v7, (uint64_t)&unk_10006F6CB, *(void *)(a1 + 8));
  uint64_t func = (void (*)(uint64_t, uint64_t, uint64_t))__find_func(0x1F5F5F5F0000C040, -236674934);
  func(a1 + 135256, a2, a3);
  Madusa::ProfileTimer::~ProfileTimer((Madusa::ProfileTimer *)v7);
}

void Madusa::AffineTransform::_PhaseEstimateExecute(uint64_t a1, uint64_t a2, uint64_t a3, int8x8_t a4)
{
  a4.i32[0] = *v4 | 0xFFFFFFE0;
  a4.i8[4] = v4[3];
  *(int8x8_t *)v5.i8 = vand_s8(a4, (int8x8_t)0xFF000000FFLL);
  v5.i64[1] = v5.i64[0];
  float32x4_t v6 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v5, (int32x4_t)xmmword_10006E150));
  v7.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_10006E160, v6)).u32[0];
  v7.i32[1] = vmovn_s32(vcgtq_f32(v6, (float32x4_t)xmmword_10006E160)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v7, 0xFuLL))) & ((v4[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    ++QuickCodec::mask;
  }
  Madusa::AffineTransform::PhaseEstimateExecute(a1, a2, a3);
}

void Madusa::AffineTransform::PhaseDeviationExecute(uint64_t a1, uint64_t a2, uint64_t a3)
{
  Madusa::ProfileTimer::ProfileTimer(v8, (uint64_t)&unk_10006F6CB, *(void *)(a1 + 8));
  BOOL v6 = *(_DWORD *)Madusa::System::mpSystem == 2;
  uint64_t func = (void (*)(uint64_t, uint64_t, BOOL, BOOL, uint64_t))__find_func(0x4F1FFF1F00E06060, -1583087414);
  func(a1 + 136824, a2, v6, v6, a3);
  Madusa::ProfileTimer::~ProfileTimer((Madusa::ProfileTimer *)v8);
}

void Madusa::AffineTransform::_PhaseDeviationExecute(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((*v3 & 0x1F) != 0 || v3[2] > 0x3Fu)
  {
    int v4 = QuickCodec::mask;
    if (QuickCodec::mask == -70947757) {
      goto LABEL_5;
    }
LABEL_7:
    QuickCodec::masint k = v4 + 1;
    goto LABEL_5;
  }
  int v5 = 3503919 * v3[3];
  int v4 = QuickCodec::mask;
  if ((v5 ^ 0x2C46B2EC | v5 & 0x2C46B2EC) - (v5 + 742830828) + ~(v5 ^ 0x2C46B2EC | ~(v5 | 0x2C46B2EC)) == ~(~(~(~(v5 | 0x2C0682E4) | v5 & 0x2C0682E4) | 0x403008) | ~(~(v5 | 0x2C0682E4) | v5 & 0x2C0682E4) & 0x403008)
    || QuickCodec::mask != -70947757)
  {
    goto LABEL_7;
  }
LABEL_5:
  Madusa::AffineTransform::PhaseDeviationExecute(a1, a2, a3);
}

int *Madusa::AffineTransform::GetScaleRangeLimits(int *this, int *a2, int *a3)
{
  if (*(_DWORD *)Madusa::System::mpSystem == 2) {
    int v3 = 0;
  }
  else {
    int v3 = 20;
  }
  if (*(_DWORD *)Madusa::System::mpSystem == 2) {
    int v4 = 90;
  }
  else {
    int v4 = 64;
  }
  *this = v3;
  *a2 = v4;
  return this;
}

void sub_1000264E0()
{
}

void sub_1000264F4()
{
}

uint64_t Madusa::SafeSubBytePixelIndexer::SafeSubBytePixelIndexer(uint64_t result, int a2, int a3, unsigned int a4)
{
  *(_DWORD *)unint64_t result = a2;
  *(unsigned char *)(result + 4) = 1;
  *(void *)(result + 8) = 0;
  *(unsigned char *)(result + 16) = 1;
  *(void *)(result + 24) = 0;
  *(unsigned char *)(result + 32) = 1;
  *(_DWORD *)(result + 40) = a4;
  *(unsigned char *)(result + 44) = 1;
  *(unsigned char *)(result + 52) = 1;
  *(_DWORD *)(result + 48) = a3;
  if ((a2 + 1) <= 0x21 && ((1 << (a2 + 1)) & 0x200020001) != 0)
  {
    a2 = 8;
    *(_DWORD *)unint64_t result = 8;
    *(unsigned char *)(result + 4) = 0;
  }
  if (a3)
  {
    if (a4 > 7) {
      goto LABEL_9;
    }
LABEL_8:
    if (!((int)a4 % a2)) {
      return result;
    }
    goto LABEL_9;
  }
  *(unsigned char *)(result + 52) = 0;
  if (a4 <= 7) {
    goto LABEL_8;
  }
LABEL_9:
  *(unsigned char *)(result + 44) = 0;
  return result;
}

uint64_t Madusa::SafeSubBytePixelIndexer::SafeSubBytePixelIndexer(uint64_t result, int a2, int a3)
{
  *(_DWORD *)unint64_t result = a2;
  *(unsigned char *)(result + 4) = 1;
  *(void *)(result + 8) = 0;
  unsigned int v3 = 8 - a2;
  *(unsigned char *)(result + 16) = 1;
  *(void *)(result + 24) = 0;
  *(unsigned char *)(result + 32) = 1;
  *(_DWORD *)(result + 40) = 8 - a2;
  *(unsigned char *)(result + 44) = 1;
  *(unsigned char *)(result + 52) = 1;
  *(_DWORD *)(result + 48) = a3;
  if ((a2 + 1) <= 0x21 && ((1 << (a2 + 1)) & 0x200020001) != 0)
  {
    a2 = 8;
    *(_DWORD *)unint64_t result = 8;
    *(unsigned char *)(result + 4) = 0;
  }
  if (a3)
  {
    if (v3 > 7) {
      goto LABEL_9;
    }
LABEL_8:
    if (!((int)v3 % a2)) {
      return result;
    }
    goto LABEL_9;
  }
  *(unsigned char *)(result + 52) = 0;
  if (v3 <= 7) {
    goto LABEL_8;
  }
LABEL_9:
  *(unsigned char *)(result + 44) = 0;
  return result;
}

int *Madusa::SafeSubBytePixelIndexer::operator+=(int *result, uint64_t a2)
{
  if (!*(unsigned char *)(a2 + 8))
  {
    *((unsigned char *)result + 16) = 0;
    *((unsigned char *)result + 32) = 0;
    *((unsigned char *)result + 44) = 0;
    return result;
  }
  uint64_t v2 = *(void *)a2;
  if (!*(void *)a2) {
    return result;
  }
  if (!*((unsigned char *)result + 16)) {
    goto LABEL_15;
  }
  uint64_t v3 = *((void *)result + 1);
  uint64_t v4 = v3 + v2;
  if (v3 < 0)
  {
    if ((v2 & 0x8000000000000000) == 0 || v4 <= v3)
    {
LABEL_14:
      *((void *)result + 1) = v4;
      *((unsigned char *)result + 16) = 1;
      if (!*(unsigned char *)(a2 + 8)) {
        goto LABEL_50;
      }
      goto LABEL_15;
    }
  }
  else if (v2 < 0 || v4 >= v3)
  {
    goto LABEL_14;
  }
  *((unsigned char *)result + 16) = 0;
  if (!*(unsigned char *)(a2 + 8)) {
    goto LABEL_50;
  }
LABEL_15:
  uint64_t v5 = *(void *)a2;
  uint64_t v6 = result[12];
  unint64_t v7 = (unint64_t)v6 >> 63;
  uint64_t v8 = *result;
  unint64_t v9 = (unint64_t)v8 >> 63;
  if (v8 >= 0) {
    uint64_t v10 = *result;
  }
  else {
    uint64_t v10 = -v8;
  }
  if (v6 < 0) {
    uint64_t v6 = -v6;
  }
  if (v5 >= 0) {
    unint64_t v11 = *(void *)a2;
  }
  else {
    unint64_t v11 = -v5;
  }
  BOOL v13 = v7 == v9;
  unint64_t v12 = v10 * v6;
  BOOL v13 = v13 || v12 == 0;
  int v14 = !v13;
  unint64_t v15 = HIDWORD(v11);
  unint64_t v16 = HIDWORD(v12);
  if (!HIDWORD(v11))
  {
    if (v16)
    {
      unint64_t v17 = v16 * v11;
      if (v17) {
        goto LABEL_32;
      }
    }
LABEL_44:
    unint64_t v20 = v12 * (unint64_t)v11;
    if ((unint64_t)v5 >> 63 == v14) {
      goto LABEL_35;
    }
    goto LABEL_45;
  }
  if (v16) {
    goto LABEL_50;
  }
  unint64_t v17 = v12 * v15;
  if (!(v12 * v15)) {
    goto LABEL_44;
  }
LABEL_32:
  if (HIDWORD(v17)) {
    goto LABEL_50;
  }
  unint64_t v18 = v12 * (unint64_t)v11;
  BOOL v19 = __CFADD__(v18, v17 << 32);
  unint64_t v20 = v18 + (v17 << 32);
  if (v19) {
    goto LABEL_50;
  }
  if ((unint64_t)v5 >> 63 == v14)
  {
LABEL_35:
    if ((v20 & 0x8000000000000000) == 0)
    {
      if (v20) {
        goto LABEL_37;
      }
      goto LABEL_47;
    }
LABEL_50:
    BOOL v23 = (BOOL *)(result + 8);
    long long v25 = (uint64_t *)(result + 6);
    if (!*((unsigned char *)result + 32))
    {
      int v29 = result + 11;
      int v24 = *((unsigned __int8 *)result + 44);
      if (*((unsigned char *)result + 44))
      {
        *int v29 = 0;
        return result;
      }
      uint64_t v30 = (unsigned int *)(result + 10);
      BOOL v33 = 0;
      unsigned int v31 = result[10];
      if ((v31 & 0x80000000) == 0) {
        goto LABEL_80;
      }
      goto LABEL_56;
    }
    int v28 = 0;
    int v24 = 0;
    unsigned int v22 = 0;
    BOOL *v23 = 0;
    int v29 = result + 11;
    uint64_t v30 = (unsigned int *)(result + 10);
    if (!*((unsigned char *)result + 44)) {
      goto LABEL_79;
    }
LABEL_52:
    *int v29 = v28;
    unsigned int v31 = *v30;
    if (v28)
    {
      unint64_t v32 = (int)v31 - (unint64_t)v22;
      if (v32 == (int)v32)
      {
        unsigned int *v30 = v32;
        unsigned int v31 = v32;
      }
      BOOL v33 = (v32 + 0x80000000) >> 32 == 0;
      *int v29 = v33;
      if ((v31 & 0x80000000) == 0) {
        goto LABEL_80;
      }
    }
    else
    {
      BOOL v33 = 0;
      if ((v31 & 0x80000000) == 0) {
        goto LABEL_80;
      }
    }
    goto LABEL_56;
  }
LABEL_45:
  if (v20 > 0x8000000000000000) {
    goto LABEL_50;
  }
  unint64_t v20 = -(uint64_t)v20;
  if (v20)
  {
LABEL_37:
    uint64_t v21 = (uint64_t)v20 / 8;
    unsigned int v22 = v20 - (v5 & 0xFFFFFFF8);
    BOOL v23 = (BOOL *)(result + 8);
    int v24 = *((unsigned __int8 *)result + 32);
    long long v25 = (uint64_t *)(result + 6);
    if (*((unsigned char *)result + 32)) {
      goto LABEL_38;
    }
LABEL_48:
    if ((v22 & 0x80000000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_77;
  }
LABEL_47:
  unsigned int v22 = 0;
  uint64_t v21 = 0;
  BOOL v23 = (BOOL *)(result + 8);
  int v24 = *((unsigned __int8 *)result + 32);
  long long v25 = (uint64_t *)(result + 6);
  if (!*((unsigned char *)result + 32)) {
    goto LABEL_48;
  }
LABEL_38:
  uint64_t v26 = *v25;
  uint64_t v27 = *v25 + v21;
  if (*v25 < 0)
  {
    if ((v21 & 0x8000000000000000) == 0 || v27 <= v26) {
      goto LABEL_71;
    }
  }
  else if (v21 < 0 || v27 >= v26)
  {
LABEL_71:
    *long long v25 = v27;
    int v24 = 1;
    goto LABEL_72;
  }
  int v24 = 0;
LABEL_72:
  BOOL *v23 = v24;
  if ((v22 & 0x80000000) == 0) {
    goto LABEL_78;
  }
  if (v24)
  {
    uint64_t v35 = *v25;
    if (*v25 != 0x8000000000000000) {
      *long long v25 = v35 - 1;
    }
    int v24 = v35 != 0x8000000000000000;
    BOOL *v23 = v24;
  }
LABEL_77:
  v22 += 8;
LABEL_78:
  int v28 = 1;
  int v29 = result + 11;
  uint64_t v30 = (unsigned int *)(result + 10);
  if (*((unsigned char *)result + 44)) {
    goto LABEL_52;
  }
LABEL_79:
  BOOL v33 = 0;
  unsigned int v31 = *v30;
  if ((*v30 & 0x80000000) == 0)
  {
LABEL_80:
    BOOL v19 = v31 >= 8;
    unsigned int v36 = v31 - 8;
    if (v19)
    {
      if (v24)
      {
        uint64_t v37 = *v25;
        if (*v25 != 0x8000000000000000) {
          *long long v25 = v37 - 1;
        }
        BOOL *v23 = v37 != 0x8000000000000000;
      }
      if (v33)
      {
        unsigned int *v30 = v36;
        *int v29 = 1;
      }
    }
    return result;
  }
LABEL_56:
  if (v24)
  {
    uint64_t v34 = *v25;
    if (*v25 != 0x7FFFFFFFFFFFFFFFLL) {
      *long long v25 = v34 + 1;
    }
    BOOL *v23 = v34 != 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v33)
  {
    unsigned int *v30 = v31 + 8;
    *int v29 = 1;
  }
  return result;
}

BOOL Madusa::SafeSubBytePixelIndexer::IsValid(Madusa::SafeSubBytePixelIndexer *this)
{
  return *((unsigned char *)this + 4)
      && *((unsigned char *)this + 16)
      && *((unsigned char *)this + 32)
      && *((unsigned char *)this + 44)
      && *((unsigned char *)this + 52) != 0;
}

float Madusa::EnhancedReferenceSignal::Execute(uint64_t a1, uint64_t a2, float *a3, uint64_t a4, int *a5)
{
  float v10 = *a3;
  float v11 = a3[1];
  float v12 = a3[2];
  float v13 = a3[3];
  int v14 = *a5;
  if (*a5 == 4)
  {
    float v10 = -v10;
    float v26 = a3[1];
    float v27 = v10;
    float v12 = -v12;
    float v28 = v13;
    float v29 = v12;
    if (!*((unsigned char *)a5 + 4)) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (v14 == 3)
  {
    float v15 = -v10;
    float v10 = -v11;
    float v26 = v15;
    float v27 = -v11;
    float v16 = -v12;
    float v12 = -v13;
    float v28 = v16;
    float v29 = -v13;
    if (!*((unsigned char *)a5 + 4)) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (v14 == 2)
  {
    float v26 = -v11;
    float v27 = v10;
    float v28 = -v13;
    float v29 = v12;
    if (!*((unsigned char *)a5 + 4)) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  float v27 = a3[1];
  float v28 = v12;
  float v12 = v13;
  float v26 = v10;
  float v10 = v11;
  float v29 = v13;
  if (*((unsigned char *)a5 + 4))
  {
LABEL_11:
    float v27 = -v10;
    float v29 = -v12;
  }
LABEL_12:
  uint64_t func = (void (*)(uint64_t, uint64_t, float *))__find_func(0xBF5FBFBFA0E0C080, 1373913194);
  func(a1, a2, &v26);
  unint64_t v18 = (float (*)(uint64_t, uint64_t, int *))__find_func(0x2FBFDF9F40C000A0, -1056694198);
  float v19 = v18(a1, a4, a5);
  v20.i8[4] = v5[3];
  v20.i32[0] = *v5 | 0xFFFFFFE0;
  *(int8x8_t *)v21.i8 = vand_s8(v20, (int8x8_t)0xFF000000FFLL);
  v21.i64[1] = v21.i64[0];
  float32x4_t v22 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v21, (int32x4_t)xmmword_10006E410));
  v23.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_10006E420, v22)).u32[0];
  v23.i32[1] = vmovn_s32(vcgtq_f32(v22, (float32x4_t)xmmword_10006E420)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v23, 0xFuLL))) & ((v5[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    QuickCodec::masint k = FunctionTable::ft[0] ^ 0x157E9386;
    int v24 = (void (*)(void, uint64_t))__find_func(0xBFBF1F1FC0C00040, 1359274186);
    v24(0, 104);
  }
  return v19;
}

float Madusa::EnhancedReferenceSignal::_Execute(uint64_t a1, uint64_t a2, float *a3, uint64_t a4, int *a5, int8x8_t a6)
{
  a6.i32[0] = *v6 | 0xFFFFFFE0;
  a6.i8[4] = v6[3];
  *(int8x8_t *)v7.i8 = vand_s8(a6, (int8x8_t)0xFF000000FFLL);
  v7.i64[1] = v7.i64[0];
  float32x4_t v8 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v7, (int32x4_t)xmmword_10006E430));
  v9.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_10006E440, v8)).u32[0];
  v9.i32[1] = vmovn_s32(vcgtq_f32(v8, (float32x4_t)xmmword_10006E440)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v9, 0xFuLL))) & ((v6[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    ++QuickCodec::mask;
  }
  return Madusa::EnhancedReferenceSignal::Execute(a1, a2, a3, a4, a5);
}

float Madusa::EnhancedReferenceSignal::_Execute_Alt()
{
  if ((*v0 & 0x1F) != 0 || v0[2] > 0x3Fu)
  {
    int v1 = QuickCodec::mask;
    if (QuickCodec::mask == -70947757) {
      return 50.0;
    }
  }
  else
  {
    int v3 = 204589 * v0[3];
    int v1 = QuickCodec::mask;
    if ((v3 ^ 0x295D144 | v3 & 0x295D144) - (v3 + 43372868) + ~(v3 ^ 0x295D144 | ~(v3 | 0x295D144)) != ~(~(~(~(v3 | 0x2814140) | v3 & 0x2814140) | 0x149004) | ~(~(v3 | 0x2814140) | v3 & 0x2814140) & 0x149004)
      && QuickCodec::mask == -70947757)
    {
      return 50.0;
    }
  }
  QuickCodec::masint k = v1 + 1;
  return 50.0;
}

void Madusa::EnhancedReferenceSignal::PhaseEstimationExecute(float32x2_t *a1, uint64_t a2, float *a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = 0;
  uint64_t v7 = (uint64_t)a1;
  do
  {
    Madusa::RefineCandidates::TransformSinglePoint(a3, v7, (float)Madusa::EnhancedReferenceSignal::kGridPointV[v6], (float)Madusa::EnhancedReferenceSignal::kGridPointU[v6]);
    ++v6;
    v7 += 28;
  }
  while (v6 != 200);
  uint64_t v8 = 0;
  int16x4_t v9 = v5 + 700;
  do
  {
    Madusa::PhaseEstimation::EstimatePhaseAtPoint(a2, v5, (uint64_t)&v9[v8]);
    v8 += 2;
    uint64_t v5 = (float32x2_t *)((char *)v5 + 28);
  }
  while (v8 != 400);
}

void Madusa::EnhancedReferenceSignal::_PhaseEstimationExecute(float32x2_t *a1, uint64_t a2, float *a3)
{
  uint64_t v4 = 0;
  int v5 = 0;
  if (QuickCodec::mask == -70947757) {
    int v6 = 13627805;
  }
  else {
    int v6 = 5750966;
  }
  uint64_t v7 = 1;
  int v8 = 2545615;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v10 = v7;
        if (v8 > 5750965) {
          break;
        }
        if (v8 == 2545615)
        {
          uint64_t v7 = 0;
          int v8 = 5750966;
        }
        else if (v8 == 2545632)
        {
          uint64_t v7 = (QuickCodec::mask != -70947757) | v7;
          int v8 = v6;
        }
        else if ((*v4 & 0x1F) != 0 {
               || v4[2] > 0x3Fu
        }
               || (uint64_t v7 = 1,
                   int v8 = 5750966,
                   v4[3] != ((QuickCodec::mask ^ v5) / 0x65570F)))
        {
          int v8 = 5751020;
          uint64_t v7 = v10;
        }
      }
      if (v8 <= 8296563) {
        break;
      }
      if (v8 == 8296564)
      {
        uint64_t v4 = (unsigned char *)v3;
        int v8 = 2545632;
      }
      else
      {
        BOOL v9 = v8 == 13627805;
        int v8 = 2545686;
        if (v9) {
          int v5 = -1473678273;
        }
      }
    }
    if (v8 != 5750966) {
      break;
    }
    int v8 = 5751020;
    if ((v7 & 1) == 0) {
      int v8 = 8296564;
    }
  }
  if (v7) {
    ++QuickCodec::mask;
  }
  Madusa::EnhancedReferenceSignal::PhaseEstimationExecute(a1, a2, a3);
}

float Madusa::EnhancedReferenceSignal::PhaseDeviationExecute(int32x4_t *a1, float *a2, uint64_t a3)
{
  uint64_t v4 = 0;
  int v5 = a1 + 550;
  int v6 = (float *)&a1[350].i32[3];
  do
  {
    int v10 = (int)(float)((float)(*(float *)&Madusa::EnhancedReferenceSignal::kGridPointPhaseInRadians[v4] * 10430.0) + 0.5);
    a1[600].i32[v4] = v10;
    int v11 = *(unsigned __int8 *)v6;
    if (*(unsigned char *)v6)
    {
      int v11 = Madusa::EnhancedReferenceSignal::kGridPointV[v4] << 9;
      int v7 = Madusa::EnhancedReferenceSignal::kGridPointU[v4] << 9;
      unsigned int v8 = vcvts_n_s32_f32(*(v6 - 1), 0x10uLL);
    }
    else
    {
      int v7 = 0;
      unsigned int v8 = v10 + 0x4000;
    }
    BOOL v9 = &a1->i32[v4];
    v9[2600] = v11;
    v9[2800] = v7;
    v9[2200] = v8;
    v6 += 4;
    ++v4;
  }
  while (v4 != 200);
  uint64_t v12 = 0;
  v13.i64[0] = 0xFFFF0000FFFFLL;
  v13.i64[1] = 0xFFFF0000FFFFLL;
  int8x16_t v14 = vandq_s8((int8x16_t)vsubq_s32(a1[551], a1[601]), v13);
  a1[550] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[550], a1[600]), v13);
  a1[551] = (int32x4_t)v14;
  int8x16_t v15 = vandq_s8((int8x16_t)vsubq_s32(a1[553], a1[603]), v13);
  a1[552] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[552], a1[602]), v13);
  a1[553] = (int32x4_t)v15;
  int8x16_t v16 = vandq_s8((int8x16_t)vsubq_s32(a1[555], a1[605]), v13);
  a1[554] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[554], a1[604]), v13);
  a1[555] = (int32x4_t)v16;
  int8x16_t v17 = vandq_s8((int8x16_t)vsubq_s32(a1[557], a1[607]), v13);
  a1[556] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[556], a1[606]), v13);
  a1[557] = (int32x4_t)v17;
  int8x16_t v18 = vandq_s8((int8x16_t)vsubq_s32(a1[559], a1[609]), v13);
  a1[558] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[558], a1[608]), v13);
  a1[559] = (int32x4_t)v18;
  int8x16_t v19 = vandq_s8((int8x16_t)vsubq_s32(a1[561], a1[611]), v13);
  a1[560] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[560], a1[610]), v13);
  a1[561] = (int32x4_t)v19;
  int8x16_t v20 = vandq_s8((int8x16_t)vsubq_s32(a1[563], a1[613]), v13);
  a1[562] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[562], a1[612]), v13);
  a1[563] = (int32x4_t)v20;
  int8x16_t v21 = vandq_s8((int8x16_t)vsubq_s32(a1[565], a1[615]), v13);
  a1[564] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[564], a1[614]), v13);
  a1[565] = (int32x4_t)v21;
  int8x16_t v22 = vandq_s8((int8x16_t)vsubq_s32(a1[567], a1[617]), v13);
  a1[566] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[566], a1[616]), v13);
  a1[567] = (int32x4_t)v22;
  int8x16_t v23 = vandq_s8((int8x16_t)vsubq_s32(a1[569], a1[619]), v13);
  a1[568] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[568], a1[618]), v13);
  a1[569] = (int32x4_t)v23;
  int8x16_t v24 = vandq_s8((int8x16_t)vsubq_s32(a1[571], a1[621]), v13);
  a1[570] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[570], a1[620]), v13);
  a1[571] = (int32x4_t)v24;
  int8x16_t v25 = vandq_s8((int8x16_t)vsubq_s32(a1[573], a1[623]), v13);
  a1[572] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[572], a1[622]), v13);
  a1[573] = (int32x4_t)v25;
  int8x16_t v26 = vandq_s8((int8x16_t)vsubq_s32(a1[575], a1[625]), v13);
  a1[574] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[574], a1[624]), v13);
  a1[575] = (int32x4_t)v26;
  int8x16_t v27 = vandq_s8((int8x16_t)vsubq_s32(a1[577], a1[627]), v13);
  a1[576] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[576], a1[626]), v13);
  a1[577] = (int32x4_t)v27;
  int8x16_t v28 = vandq_s8((int8x16_t)vsubq_s32(a1[579], a1[629]), v13);
  a1[578] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[578], a1[628]), v13);
  a1[579] = (int32x4_t)v28;
  int8x16_t v29 = vandq_s8((int8x16_t)vsubq_s32(a1[581], a1[631]), v13);
  a1[580] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[580], a1[630]), v13);
  a1[581] = (int32x4_t)v29;
  int8x16_t v30 = vandq_s8((int8x16_t)vsubq_s32(a1[583], a1[633]), v13);
  a1[582] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[582], a1[632]), v13);
  a1[583] = (int32x4_t)v30;
  int8x16_t v31 = vandq_s8((int8x16_t)vsubq_s32(a1[585], a1[635]), v13);
  a1[584] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[584], a1[634]), v13);
  a1[585] = (int32x4_t)v31;
  int8x16_t v32 = vandq_s8((int8x16_t)vsubq_s32(a1[587], a1[637]), v13);
  a1[586] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[586], a1[636]), v13);
  a1[587] = (int32x4_t)v32;
  int8x16_t v33 = vandq_s8((int8x16_t)vsubq_s32(a1[589], a1[639]), v13);
  a1[588] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[588], a1[638]), v13);
  a1[589] = (int32x4_t)v33;
  int8x16_t v34 = vandq_s8((int8x16_t)vsubq_s32(a1[591], a1[641]), v13);
  a1[590] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[590], a1[640]), v13);
  a1[591] = (int32x4_t)v34;
  int8x16_t v35 = vandq_s8((int8x16_t)vsubq_s32(a1[593], a1[643]), v13);
  a1[592] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[592], a1[642]), v13);
  a1[593] = (int32x4_t)v35;
  int8x16_t v36 = vandq_s8((int8x16_t)vsubq_s32(a1[595], a1[645]), v13);
  a1[594] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[594], a1[644]), v13);
  a1[595] = (int32x4_t)v36;
  int8x16_t v37 = vandq_s8((int8x16_t)vsubq_s32(a1[597], a1[647]), v13);
  a1[596] = (int32x4_t)vandq_s8((int8x16_t)vsubq_s32(a1[596], a1[646]), v13);
  a1[597] = (int32x4_t)v37;
  int8x16_t v38 = vandq_s8((int8x16_t)vsubq_s32(a1[598], a1[648]), v13);
  int8x16_t v39 = vandq_s8((int8x16_t)vsubq_s32(a1[599], a1[649]), v13);
  a1[598] = (int32x4_t)v38;
  a1[599] = (int32x4_t)v39;
  int32x4_t v40 = vdupq_n_s32(vcvts_n_s32_f32(*a2, 4uLL));
  int32x4_t v41 = (int32x4_t)xmmword_10006E450;
  int32x4_t v42 = 0uLL;
  int32x4_t v43 = vdupq_n_s32(vcvts_n_s32_f32(a2[1], 4uLL));
  do
  {
    int32x4_t v44 = vmlaq_s32(vmulq_s32(v5[v12 + 100], v40), v5[v12 + 150], v43);
    int32x4_t v45 = vmlaq_s32(vmulq_s32(v5[v12 + 101], v40), v5[v12 + 151], v43);
    int32x4_t v46 = vshlq_n_s32(vsraq_n_s32(v5[v12], (int32x4_t)vsraq_n_u32((uint32x4_t)v44, (uint32x4_t)vcltzq_s32(v44), 0x1CuLL), 4uLL), 0x10uLL);
    int32x4_t v47 = vshlq_n_s32(vsraq_n_s32(v5[v12 + 1], (int32x4_t)vsraq_n_u32((uint32x4_t)v45, (uint32x4_t)vcltzq_s32(v45), 0x1CuLL), 4uLL), 0x10uLL);
    int32x4_t v41 = vsubq_s32(vsraq_n_s32(v41, v46, 0x1FuLL), (int32x4_t)veorq_s8((int8x16_t)vshrq_n_s32(v46, 0x10uLL), (int8x16_t)vcltzq_s32(v46)));
    int32x4_t v42 = vsubq_s32(vsraq_n_s32(v42, v47, 0x1FuLL), (int32x4_t)veorq_s8((int8x16_t)vshrq_n_s32(v47, 0x10uLL), (int8x16_t)vcltzq_s32(v47)));
    v12 += 2;
  }
  while (v12 != 50);
  int v48 = *(unsigned __int8 *)(a3 + 5);
  v40.i8[4] = v3[3];
  v40.i32[0] = *v3 | 0xFFFFFFE0;
  *(int8x8_t *)v49.i8 = vand_s8(*(int8x8_t *)v40.i8, (int8x8_t)0xFF000000FFLL);
  v49.i64[1] = v49.i64[0];
  float32x4_t v50 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v49, (int32x4_t)xmmword_10006E460));
  v51.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_10006E470, v50)).u32[0];
  v51.i32[1] = vmovn_s32(vcgtq_f32(v50, (float32x4_t)xmmword_10006E470)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v51, 0xFuLL))) & ((v3[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    unint64_t v52 = 0;
    int v53 = FunctionTable::ft ^ 0x157E9386;
    QuickCodec::masint k = FunctionTable::ft ^ 0x157E9386;
    int v54 = -1;
    do
    {
      qword_100074AF8[v54
                    + 1
                    + ((FunctionTable::swapTable[v52] ^ v53) / 0x9D28AF)] = qword_100074AF8[v54 + ((FunctionTable::swapTable[v52 + 1] ^ v53) / 0x9D28AF)];
      v54 -= 2;
      BOOL v55 = v52 >= 0x20;
      v52 += 2;
    }
    while (!v55);
  }
  int v56 = vaddvq_s32(vaddq_s32(v42, v41));
  int v57 = 6553600 - v56;
  if (6553600 - v56 <= v56) {
    int v57 = v56;
  }
  if (v48) {
    int v58 = v57;
  }
  else {
    int v58 = v56;
  }
  return (float)v58 * 0.000015259;
}

float Madusa::EnhancedReferenceSignal::_PhaseDeviationExecute(int32x4_t *a1, float *a2, uint64_t a3, int8x8_t a4)
{
  a4.i32[0] = *v4 | 0xFFFFFFE0;
  a4.i8[4] = v4[3];
  *(int8x8_t *)v5.i8 = vand_s8(a4, (int8x8_t)0xFF000000FFLL);
  v5.i64[1] = v5.i64[0];
  float32x4_t v6 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v5, (int32x4_t)xmmword_10006E480));
  v7.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_10006E490, v6)).u32[0];
  v7.i32[1] = vmovn_s32(vcgtq_f32(v6, (float32x4_t)xmmword_10006E490)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v7, 0xFuLL))) & ((v4[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    ++QuickCodec::mask;
  }
  return Madusa::EnhancedReferenceSignal::PhaseDeviationExecute(a1, a2, a3);
}

Madusa::SequenceManager *Madusa::SequenceManager::SequenceManager(Madusa::SequenceManager *this)
{
  *(_DWORD *)this = 0;
  *((unsigned char *)this + 4) = 1;
  uint64_t v2 = (void *)((char *)this + 8);
  bzero((char *)this + 8, 0x7ACuLL);
  *((_DWORD *)this + 23) = -1282469977;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_DWORD *)this + 32) = 0;
  *(_OWORD *)((char *)this + 140) = 0u;
  *(_OWORD *)((char *)this + 156) = 0u;
  *(void *)((char *)this + 132) = 0xB38F0FA7B6B35D69;
  *(_OWORD *)((char *)this + 172) = xmmword_10006EE10;
  *(void *)((char *)this + 188) = 0;
  *(void *)((char *)this + 196) = 0;
  *(_OWORD *)((char *)this + 212) = xmmword_10006EE20;
  *(void *)((char *)this + 228) = 0;
  *(void *)((char *)this + 236) = 0;
  *((void *)this + 34) = 0;
  *((void *)this + 35) = 0;
  *((void *)this + 33) = 0;
  *((_DWORD *)this + 72) = 0;
  *(void *)((char *)this + 252) = 0xCD87C0F5E59B85ALL;
  *((_DWORD *)this + 65) = 1582938202;
  *(_OWORD *)((char *)this + 292) = xmmword_10006EE30;
  *(void *)((char *)this + 308) = 0;
  *(void *)((char *)this + 316) = 0;
  *(_OWORD *)((char *)this + 332) = xmmword_10006EE40;
  *(void *)((char *)this + 348) = 0;
  *(void *)((char *)this + 356) = 0;
  *(void *)((char *)this + 372) = 0xCD87C0F8D7BB55ALL;
  *(_OWORD *)((char *)this + 380) = 0u;
  *(_OWORD *)((char *)this + 396) = 0u;
  *(void *)((char *)this + 412) = 0x5E59B85A4B4B5274;
  *(_OWORD *)((char *)this + 420) = 0u;
  *(_OWORD *)((char *)this + 436) = 0u;
  long long v3 = *(_OWORD *)((char *)this + 92);
  *(_OWORD *)((char *)this + 468) = *(_OWORD *)((char *)this + 108);
  *(_OWORD *)((char *)this + 452) = v3;
  long long v4 = *(_OWORD *)((char *)this + 148);
  *(_OWORD *)((char *)this + 492) = *(_OWORD *)((char *)this + 132);
  *(_OWORD *)((char *)this + 508) = v4;
  long long v5 = *(_OWORD *)((char *)this + 188);
  *(_OWORD *)((char *)this + 532) = *(_OWORD *)((char *)this + 172);
  *(_OWORD *)((char *)this + 548) = v5;
  long long v6 = *(_OWORD *)((char *)this + 228);
  *(_OWORD *)((char *)this + 572) = *(_OWORD *)((char *)this + 212);
  *(_OWORD *)((char *)this + 588) = v6;
  long long v7 = *(_OWORD *)((char *)this + 388);
  long long v8 = *(_OWORD *)((char *)this + 372);
  *(_OWORD *)((char *)this + 612) = v8;
  *(_OWORD *)((char *)this + 628) = v7;
  long long v9 = *(_OWORD *)((char *)this + 268);
  long long v10 = *(_OWORD *)((char *)this + 252);
  *(_OWORD *)((char *)this + 652) = v10;
  *(_OWORD *)((char *)this + 668) = v9;
  long long v11 = *(_OWORD *)((char *)this + 428);
  long long v12 = *(_OWORD *)((char *)this + 412);
  *(_OWORD *)((char *)this + 692) = v12;
  *(_OWORD *)((char *)this + 708) = v11;
  long long v13 = *(_OWORD *)((char *)this + 308);
  *(_OWORD *)((char *)this + 732) = *(_OWORD *)((char *)this + 292);
  *(_OWORD *)((char *)this + 748) = v13;
  long long v14 = *(_OWORD *)((char *)this + 348);
  *(_OWORD *)((char *)this + 772) = *(_OWORD *)((char *)this + 332);
  *(_OWORD *)((char *)this + 788) = v14;
  long long v15 = *(_OWORD *)((char *)this + 68);
  *(_OWORD *)((char *)this + 812) = *(_OWORD *)((char *)this + 52);
  *(_OWORD *)((char *)this + 828) = v15;
  *(_OWORD *)((char *)this + 852) = xmmword_10006EE50;
  *((_DWORD *)this + 217) = 1263227508;
  *((void *)this + 110) = 0;
  *((void *)this + 109) = 0;
  *(_OWORD *)((char *)this + 892) = xmmword_10006EE60;
  *((_DWORD *)this + 227) = 1263227508;
  *((void *)this + 115) = 0;
  *((void *)this + 114) = 0;
  long long v16 = *(_OWORD *)((char *)this + 108);
  *(_OWORD *)((char *)this + 932) = *(_OWORD *)((char *)this + 92);
  *(_OWORD *)((char *)this + 948) = v16;
  long long v17 = *(_OWORD *)((char *)this + 148);
  *(_OWORD *)((char *)this + 972) = *(_OWORD *)((char *)this + 132);
  *(_OWORD *)((char *)this + 988) = v17;
  long long v18 = *(_OWORD *)((char *)this + 868);
  *(_OWORD *)((char *)this + 1012) = *(_OWORD *)((char *)this + 852);
  *(_OWORD *)((char *)this + 1028) = v18;
  long long v19 = *(_OWORD *)((char *)this + 388);
  *(_OWORD *)((char *)this + 1052) = *(_OWORD *)((char *)this + 372);
  *(_OWORD *)((char *)this + 1068) = v19;
  long long v20 = *(_OWORD *)((char *)this + 268);
  *(_OWORD *)((char *)this + 1092) = v10;
  *(_OWORD *)((char *)this + 1108) = v20;
  long long v21 = *(_OWORD *)((char *)this + 428);
  *(_OWORD *)((char *)this + 1132) = *(_OWORD *)((char *)this + 412);
  *(_OWORD *)((char *)this + 1148) = v21;
  long long v22 = *(_OWORD *)((char *)this + 908);
  *(_OWORD *)((char *)this + 1172) = *(_OWORD *)((char *)this + 892);
  *(_OWORD *)((char *)this + 1188) = v22;
  long long v23 = *(_OWORD *)((char *)this + 68);
  *(_OWORD *)((char *)this + 1212) = *(_OWORD *)((char *)this + 52);
  *(_OWORD *)((char *)this + 1228) = v23;
  long long v24 = *(_OWORD *)((char *)this + 68);
  *(_OWORD *)((char *)this + 1252) = *(_OWORD *)((char *)this + 52);
  *(_OWORD *)((char *)this + 1268) = v24;
  long long v25 = *(_OWORD *)((char *)this + 52);
  *(_OWORD *)((char *)this + 1308) = *(_OWORD *)((char *)this + 68);
  *(_OWORD *)((char *)this + 1292) = v25;
  *(_OWORD *)((char *)this + 1352) = unk_10006EF00;
  *(void *)((char *)this + 204) = 0;
  *(void *)((char *)this + 244) = 0;
  *(void *)((char *)this + 324) = 0;
  *(void *)((char *)this + 364) = 0;
  *(void *)((char *)this + 484) = *(void *)((char *)this + 124);
  *(void *)((char *)this + 524) = *(void *)((char *)this + 164);
  *(void *)((char *)this + 564) = 0;
  *(void *)((char *)this + 604) = 0;
  *(void *)((char *)this + 644) = *(void *)((char *)this + 404);
  *(void *)((char *)this + 684) = *(void *)((char *)this + 284);
  *(void *)((char *)this + 724) = *(void *)((char *)this + 444);
  *(void *)((char *)this + 764) = 0;
  *(void *)((char *)this + 804) = *(void *)((char *)this + 364);
  *(void *)((char *)this + 844) = *(void *)((char *)this + 84);
  *((_DWORD *)this + 222) = 0;
  *((_DWORD *)this + 232) = 0;
  *(void *)((char *)this + 964) = *(void *)((char *)this + 124);
  *(void *)((char *)this + 1004) = *(void *)((char *)this + 164);
  *(void *)((char *)this + 1044) = *(void *)((char *)this + 884);
  *(void *)((char *)this + 1084) = *(void *)((char *)this + 404);
  *(void *)((char *)this + 1124) = *(void *)((char *)this + 284);
  *(void *)((char *)this + 1164) = *(void *)((char *)this + 444);
  *(void *)((char *)this + 1204) = *(void *)((char *)this + 924);
  *(void *)((char *)this + 1244) = *(void *)((char *)this + 84);
  *(void *)((char *)this + 1284) = *(void *)((char *)this + 84);
  *(void *)((char *)this + 1324) = *(void *)((char *)this + 84);
  *((_DWORD *)this + 333) = -695048647;
  *((_DWORD *)this + 342) = 0;
  *(_OWORD *)((char *)this + 1336) = xmmword_10006EEF0;
  *(_OWORD *)((char *)this + 1372) = xmmword_10006EE70;
  *(void *)((char *)this + 1396) = 0;
  *(void *)((char *)this + 1388) = 0;
  *(void *)((char *)this + 1404) = 0;
  *(_OWORD *)((char *)this + 1412) = xmmword_10006EE80;
  *(void *)((char *)this + 1436) = 0;
  *(void *)((char *)this + 1428) = 0;
  *(void *)((char *)this + 1444) = 0;
  *(_OWORD *)((char *)this + 1452) = xmmword_10006EE90;
  *(void *)((char *)this + 1476) = 0;
  *(void *)((char *)this + 1468) = 0;
  *(void *)((char *)this + 1484) = 0;
  *(_OWORD *)((char *)this + 1492) = xmmword_10006EEA0;
  *((_DWORD *)this + 377) = 1582938202;
  *((void *)this + 190) = 0;
  *((void *)this + 189) = 0;
  *((_DWORD *)this + 382) = 0;
  *((_DWORD *)this + 383) = -1897370444;
  *(_OWORD *)((char *)this + 1556) = 0u;
  *(_OWORD *)((char *)this + 1540) = 0u;
  *((_DWORD *)this + 384) = -962818267;
  long long v26 = *(_OWORD *)((char *)this + 108);
  long long v27 = *(_OWORD *)((char *)this + 92);
  *(void *)((char *)this + 1604) = *(void *)((char *)this + 124);
  *(_OWORD *)((char *)this + 1572) = v27;
  *(_OWORD *)((char *)this + 1588) = v26;
  long long v28 = *(_OWORD *)((char *)this + 148);
  long long v29 = *(_OWORD *)((char *)this + 132);
  *(void *)((char *)this + 1644) = *(void *)((char *)this + 164);
  *(_OWORD *)((char *)this + 1628) = v28;
  *(_OWORD *)((char *)this + 1612) = v29;
  long long v30 = *(_OWORD *)((char *)this + 1332);
  long long v31 = *(_OWORD *)((char *)this + 1348);
  *(void *)((char *)this + 1684) = *(void *)((char *)this + 1364);
  *(_OWORD *)((char *)this + 1652) = v30;
  *(_OWORD *)((char *)this + 1668) = v31;
  *(_OWORD *)((char *)this + 1708) = *(_OWORD *)((char *)this + 1388);
  long long v32 = *(_OWORD *)((char *)this + 1372);
  *(void *)((char *)this + 1724) = *(void *)((char *)this + 1404);
  *(_OWORD *)((char *)this + 1692) = v32;
  long long v33 = *(_OWORD *)((char *)this + 388);
  *(void *)((char *)this + 1764) = *(void *)((char *)this + 404);
  *(_OWORD *)((char *)this + 1732) = v8;
  *(_OWORD *)((char *)this + 1748) = v33;
  long long v34 = *(_OWORD *)((char *)this + 1412);
  long long v35 = *(_OWORD *)((char *)this + 1428);
  *(void *)((char *)this + 1804) = *(void *)((char *)this + 1444);
  *(_OWORD *)((char *)this + 1788) = v35;
  *(_OWORD *)((char *)this + 1772) = v34;
  long long v36 = *(_OWORD *)((char *)this + 428);
  *(void *)((char *)this + 1844) = *(void *)((char *)this + 444);
  *(_OWORD *)((char *)this + 1812) = v12;
  *(_OWORD *)((char *)this + 1828) = v36;
  long long v37 = *(_OWORD *)((char *)this + 1452);
  long long v38 = *(_OWORD *)((char *)this + 1468);
  *(void *)((char *)this + 1884) = *(void *)((char *)this + 1484);
  *(_OWORD *)((char *)this + 1868) = v38;
  *(_OWORD *)((char *)this + 1852) = v37;
  long long v39 = *(_OWORD *)((char *)this + 1532);
  long long v40 = *(_OWORD *)((char *)this + 1548);
  *(void *)((char *)this + 1924) = *(void *)((char *)this + 1564);
  *(_OWORD *)((char *)this + 1892) = v39;
  *(_OWORD *)((char *)this + 1908) = v40;
  long long v41 = *(_OWORD *)((char *)this + 1492);
  long long v42 = *(_OWORD *)((char *)this + 1508);
  *(void *)((char *)this + 1964) = *(void *)((char *)this + 1524);
  *(_OWORD *)((char *)this + 1948) = v42;
  *(_OWORD *)((char *)this + 1932) = v41;
  switch(*(_DWORD *)(Madusa::System::mpSystem + 32))
  {
    case 0:
    case 3:
      void *v2 = (char *)this + 932;
      unint64_t result = this;
      break;
    case 1:
      void *v2 = (char *)this + 452;
      unint64_t result = this;
      break;
    case 2:
      void *v2 = (char *)this + 1572;
      unint64_t result = this;
      break;
    default:
      atomic_store(0, (unsigned __int8 *)this + 4);
      unint64_t result = this;
      break;
  }
  return result;
}

uint64_t Madusa::SequenceManager::ValidateSequence(uint64_t a1, unsigned int a2)
{
  if (!*(void *)(a1 + 8))
  {
    unsigned __int8 v4 = 0;
    atomic_store(0, (unsigned __int8 *)(a1 + 4));
    goto LABEL_5;
  }
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)(a1 + 4));
  if ((v3 & 1) == 0)
  {
LABEL_3:
    unsigned __int8 v4 = 0;
LABEL_5:
    uint64_t v5 = 4294967292;
    goto LABEL_23;
  }
  unsigned int v6 = atomic_load((unsigned int *)a1);
  unsigned int v15 = v6;
  long long v7 = *(_DWORD **)(a1 + 8);
  if (*v7 != a2)
  {
    long long v8 = v7 + 10;
    if (v7[10] == a2
      || (long long v8 = v7 + 20, v7[20] == a2)
      || (long long v8 = v7 + 30, v7[30] == a2)
      || (long long v8 = v7 + 40, v7[40] == a2)
      || (long long v8 = v7 + 50, v7[50] == a2)
      || (long long v8 = v7 + 60, v7[60] == a2))
    {
      long long v7 = v8;
    }
    else if (v7[70] == a2)
    {
      v7 += 70;
    }
    else if (v7[80] == a2)
    {
      v7 += 80;
    }
    else
    {
      if (v7[90] != a2) {
        goto LABEL_3;
      }
      v7 += 90;
    }
  }
  if (v15 == v7[1]
    || v15 == v7[2]
    || v15 == v7[3]
    || v15 == v7[4]
    || v15 == v7[5]
    || v15 == v7[6]
    || v15 == v7[7]
    || v15 == v7[8])
  {
    uint64_t v5 = 0;
    unsigned __int8 v4 = 1;
  }
  else
  {
    unsigned __int8 v4 = v15 == v7[9];
    if (v15 == v7[9]) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = 4294967292;
    }
  }
LABEL_23:
  atomic_store(a2, (unsigned int *)a1);
  atomic_store(v4, (unsigned __int8 *)(a1 + 4));
  if ((*v2 & 0x1F) != 0 || v2[2] > 0x3Fu)
  {
    if (QuickCodec::mask == -70947757) {
      return v5;
    }
    goto LABEL_32;
  }
  if (v2[3] == 212 || QuickCodec::mask != -70947757)
  {
LABEL_32:
    unint64_t v10 = 0;
    int v11 = FunctionTable::ft ^ 0x157E9386;
    QuickCodec::masint k = FunctionTable::ft ^ 0x157E9386;
    int v12 = -1;
    do
    {
      qword_100074AF8[v12
                    + 1
                    + ((FunctionTable::swapTable[v10] ^ v11) / 0x9D28AF)] = qword_100074AF8[v12 + ((FunctionTable::swapTable[v10 + 1] ^ v11) / 0x9D28AF)];
      v12 -= 2;
      BOOL v13 = v10 >= 0x20;
      v10 += 2;
    }
    while (!v13);
  }
  return v5;
}

uint64_t Madusa::SequenceManager::_ValidateSequence(uint64_t a1, unsigned int a2)
{
  unsigned __int8 v3 = 0;
  int v4 = 0;
  if (QuickCodec::mask == -70947757) {
    int v5 = 11712086;
  }
  else {
    int v5 = 1964791;
  }
  uint64_t v6 = 1;
  int v7 = 2233123;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v10 = v6;
        if (v7 <= 2233193) {
          break;
        }
        if (v7 == 2233194)
        {
          if ((*v3 & 0x1F) != 0
            || v3[2] > 0x3Fu
            || (uint64_t v6 = 1,
                int v7 = 1964791,
                v3[3] != ((QuickCodec::mask ^ v4) / 0x1E0C62)))
          {
            int v7 = 1964845;
            uint64_t v6 = v10;
          }
        }
        else if (v7 == 4197897)
        {
          unsigned __int8 v3 = (unsigned char *)v2;
          int v7 = 2233140;
        }
        else
        {
          BOOL v11 = v7 == 11712086;
          int v7 = 2233194;
          if (v11) {
            int v4 = -483971717;
          }
        }
      }
      if (v7 <= 2233122) {
        break;
      }
      unsigned int v8 = (QuickCodec::mask != -70947757) | v6;
      if (v7 == 2233140) {
        int v9 = v5;
      }
      else {
        int v9 = v7;
      }
      if (v7 == 2233140) {
        LODWORD(v10) = v8;
      }
      BOOL v11 = v7 == 2233123;
      if (v7 == 2233123) {
        int v7 = 1964791;
      }
      else {
        int v7 = v9;
      }
      if (v11) {
        uint64_t v6 = 0;
      }
      else {
        uint64_t v6 = v10;
      }
    }
    if (v7 != 1964791) {
      break;
    }
    int v7 = 1964845;
    if ((v6 & 1) == 0) {
      int v7 = 4197897;
    }
  }
  if (v6) {
    ++QuickCodec::mask;
  }
  return Madusa::SequenceManager::ValidateSequence(a1, a2);
}

uint64_t Madusa::SequenceManager::ValidateAcknowledge(unsigned int *a1, int *a2, int8x8_t a3)
{
  *a2 = 0;
  unsigned int v6 = atomic_load(a1);
  switch(v6)
  {
    case 0xC69C8F25:
      int v7 = -1897370444;
      goto LABEL_7;
    case 0x5E59B85Au:
      int v7 = 1263227508;
      goto LABEL_7;
    case 0xCD87C0Fu:
      int v7 = -1921272486;
LABEL_7:
      *a2 = v7;
      break;
  }
  a3.i8[4] = v3[3];
  a3.i32[0] = *v3 | 0xFFFFFFE0;
  *(int8x8_t *)v8.i8 = vand_s8(a3, (int8x8_t)0xFF000000FFLL);
  v8.i64[1] = v8.i64[0];
  float32x4_t v9 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v8, (int32x4_t)xmmword_10006EEB0));
  v10.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_10006EEC0, v9)).u32[0];
  v10.i32[1] = vmovn_s32(vcgtq_f32(v9, (float32x4_t)xmmword_10006EEC0)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v10, 0xFuLL))) & ((v3[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    QuickCodec::masint k = FunctionTable::ft[0] ^ 0x157E9386;
    fegetenv(&v13);
    v13.__fpcr &= QuickCodec::mask + 70947740;
    fesetenv(&v13);
  }
  uint64_t func = (uint64_t (*)(unsigned int *, void))__find_func(0xFF3F5F5F00C0A050, 293904522);
  return func(a1, *a2);
}

uint64_t Madusa::SequenceManager::_ValidateAcknowledge(unsigned int *a1, int *a2, int8x8_t a3)
{
  a3.i32[0] = *v3 | 0xFFFFFFE0;
  a3.i8[4] = v3[3];
  *(int8x8_t *)v4.i8 = vand_s8(a3, (int8x8_t)0xFF000000FFLL);
  v4.i64[1] = v4.i64[0];
  float32x4_t v5 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v4, (int32x4_t)xmmword_10006EED0));
  v6.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_10006EEE0, v5)).u32[0];
  v6.i32[1] = vmovn_s32(vcgtq_f32(v5, (float32x4_t)xmmword_10006EEE0)).i32[1];
  int8x8_t v7 = (int8x8_t)vcltz_s16(vshl_n_s16(v6, 0xFuLL));
  v7.i16[0] = vminv_u16((uint16x4_t)v7);
  if ((v7.i8[0] & ((v3[2] & 0xE0) == 32)) != 0 || QuickCodec::mask != -70947757) {
    ++QuickCodec::mask;
  }
  return Madusa::SequenceManager::ValidateAcknowledge(a1, a2, v7);
}

uint64_t SDKStartup(uint64_t a1)
{
  CConfigFPU::CConfigFPU((CConfigFPU *)&v17);
  Madusa::RandomNumGenerator::RandomNumGenerator((Madusa::RandomNumGenerator *)v16);
  Madusa::Session::gSessionOffset = Madusa::RandomNumGenerator::GetNextNumber((Madusa::RandomNumGenerator *)v16);
  Madusa::Session::gSessionKey0 = Madusa::RandomNumGenerator::GetNextNumber((Madusa::RandomNumGenerator *)v16);
  Madusa::Session::gSessionKey1 = Madusa::RandomNumGenerator::GetNextNumber((Madusa::RandomNumGenerator *)v16);
  Madusa::Session::gSessionKey2 = Madusa::RandomNumGenerator::GetNextNumber((Madusa::RandomNumGenerator *)v16);
  Madusa::Session::gSessionKey3 = Madusa::RandomNumGenerator::GetNextNumber((Madusa::RandomNumGenerator *)v16);
  *(_OWORD *)&off_100074A78 = 0u;
  *(_OWORD *)&off_100074A88 = 0u;
  *(_OWORD *)&qword_100074A98 = 0u;
  dword_100074A70 = -1;
  if (!a1)
  {
    uint64_t v7 = 4294967194;
    goto LABEL_44;
  }
  int v3 = *(_DWORD *)(a1 + 16);
  if (v3 == 512) {
    goto LABEL_13;
  }
  if (v3 == 256)
  {
    if (*(_DWORD *)a1 != 56) {
      goto LABEL_43;
    }
    off_100074AA8 = *(uint64_t (**)(void))(a1 + 24);
    off_100074AB0 = *(uint64_t (**)(void))(a1 + 40);
    Madusa::MemoryMaster::SetMemoryAllocatorAndDeallocator((uint64_t (*)(void, void))sub_100029F34, *(void *(**)(unint64_t, void *))(a1 + 32), sub_100029F50, *(void (**)(void *, void *))(a1 + 48), v2);
LABEL_13:
    BOOL v5 = 0;
    uint64_t v6 = *(void *)(a1 + 8);
    if (!v6) {
      goto LABEL_34;
    }
    goto LABEL_14;
  }
  if (v3 != 157 || *(_DWORD *)a1 != 32) {
    goto LABEL_43;
  }
  uint64_t v4 = *(void *)(a1 + 24);
  if (v4 != 51348)
  {
    off_100074A78 = (_UNKNOWN *)(*(void *)(v4 - 51348) - 1506747311);
    off_100074A80 = (_UNKNOWN *)(*(void *)(v4 - 51340) - 2096209194);
    off_100074A88 = (_UNKNOWN *)(*(void *)(v4 - 51332) - 1621769547);
    off_100074A90 = (_UNKNOWN *)(*(void *)(v4 - 51324) - 1950008364);
    qword_100074A98 = *(void *)(v4 - 51316) - 1697636733;
    off_100074AA0 = (_UNKNOWN *)(*(void *)(v4 - 51308) - 1563763406);
    dword_100074A70 = *(void *)(v4 - 51300);
  }
  BOOL v5 = v4 != 51348;
  uint64_t v6 = *(void *)(a1 + 8);
  if (!v6) {
    goto LABEL_34;
  }
LABEL_14:
  int v8 = *(_DWORD *)(v6 + 16);
  if (v8 == 157)
  {
    if (*(_DWORD *)v6 != 32) {
      goto LABEL_43;
    }
    if (!v5)
    {
      uint64_t v9 = *(void *)(v6 + 24);
      if (v9 != 51348)
      {
        off_100074A78 = (_UNKNOWN *)(*(void *)(v9 - 51348) - 1506747311);
        off_100074A80 = (_UNKNOWN *)(*(void *)(v9 - 51340) - 2096209194);
        off_100074A88 = (_UNKNOWN *)(*(void *)(v9 - 51332) - 1621769547);
        off_100074A90 = (_UNKNOWN *)(*(void *)(v9 - 51324) - 1950008364);
        qword_100074A98 = *(void *)(v9 - 51316) - 1697636733;
        off_100074AA0 = (_UNKNOWN *)(*(void *)(v9 - 51308) - 1563763406);
        dword_100074A70 = *(void *)(v9 - 51300);
      }
      BOOL v5 = v9 != 51348;
    }
  }
  else if (v8 != 512)
  {
    if (v8 != 256 || *(_DWORD *)v6 != 56) {
      goto LABEL_43;
    }
    off_100074AA8 = *(uint64_t (**)(void))(v6 + 24);
    off_100074AB0 = *(uint64_t (**)(void))(v6 + 40);
    Madusa::MemoryMaster::SetMemoryAllocatorAndDeallocator((uint64_t (*)(void, void))sub_100029F34, *(void *(**)(unint64_t, void *))(v6 + 32), sub_100029F50, *(void (**)(void *, void *))(v6 + 48), v2);
  }
  uint64_t v10 = *(void *)(v6 + 8);
  if (v10)
  {
    int v11 = *(_DWORD *)(v10 + 16);
    if (v11 == 157)
    {
      if (*(_DWORD *)v10 == 32)
      {
        if (!v5)
        {
          uint64_t v12 = *(void *)(v10 + 24);
          if (v12 != 51348)
          {
            off_100074A78 = (_UNKNOWN *)(*(void *)(v12 - 51348) - 1506747311);
            off_100074A80 = (_UNKNOWN *)(*(void *)(v12 - 51340) - 2096209194);
            off_100074A88 = (_UNKNOWN *)(*(void *)(v12 - 51332) - 1621769547);
            off_100074A90 = (_UNKNOWN *)(*(void *)(v12 - 51324) - 1950008364);
            qword_100074A98 = *(void *)(v12 - 51316) - 1697636733;
            off_100074AA0 = (_UNKNOWN *)(*(void *)(v12 - 51308) - 1563763406);
            dword_100074A70 = *(void *)(v12 - 51300);
          }
        }
        goto LABEL_34;
      }
      goto LABEL_43;
    }
    if (v11 != 512)
    {
      if (v11 == 256 && *(_DWORD *)v10 == 56)
      {
        off_100074AA8 = *(uint64_t (**)(void))(v10 + 24);
        off_100074AB0 = *(uint64_t (**)(void))(v10 + 40);
        Madusa::MemoryMaster::SetMemoryAllocatorAndDeallocator((uint64_t (*)(void, void))sub_100029F34, *(void *(**)(unint64_t, void *))(v10 + 32), sub_100029F50, *(void (**)(void *, void *))(v10 + 48), v2);
        goto LABEL_34;
      }
LABEL_43:
      uint64_t v7 = 4294967293;
      goto LABEL_44;
    }
  }
LABEL_34:
  if (off_100074A90) {
    BOOL v13 = off_100074A88 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13 || off_100074A80 == 0) {
    uint64_t v7 = 4294967194;
  }
  else {
    uint64_t v7 = 0;
  }
LABEL_44:
  CConfigFPU::~CConfigFPU((CConfigFPU *)&v17);
  return v7;
}

uint64_t SDKCleanup(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  return 0;
}

uint64_t SDKAcknowledge(int a1, void *a2, Madusa::Session *this)
{
  BOOL v5 = (Madusa::Session *)Madusa::Session::UnscrambleSessionPointer((uint64_t)this, a2);
  if (!v5) {
    return 4294967293;
  }
  uint64_t v6 = (void (*)(unsigned int, void *))qword_100074A98;

  return Madusa::Session::Acknowledge(v5, a1, v6, a2);
}

uint64_t SDKInitialize(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t *a4)
{
  if (!a4) {
    return 4294967293;
  }
  CConfigFPU::CConfigFPU((CConfigFPU *)&v18);
  uint64_t v7 = (Madusa::MemoryMaster *)Madusa::MemoryMaster::Create((Madusa::MemoryMaster *)0x13B8);
  if (*(_DWORD *)Madusa::System::mpSystem == 3) {
    unsigned int v8 = a2;
  }
  else {
    unsigned int v8 = 0;
  }
  if (v7
    && (uint64_t v9 = v7,
        (uint64_t v10 = (Madusa::Session *)(*(uint64_t (**)(Madusa::MemoryMaster *, uint64_t))(*(void *)v7 + 16))(v7, 5048)) != 0))
  {
    int v11 = v10;
    unint64_t v12 = Madusa::Session::Session(v10, v9, v8);
    *a4 = Madusa::Session::ScrambleSessionPointer(v12);
    Madusa::Session::SetParallelFor((uint64_t)v11, (int (*)(int, int, unsigned int, void *, void *))sub_100028B18, 0);
    Madusa::Session::SetProcessParams((uint64_t)v11, a1);
    Madusa::Session::SetStorageRequirements(v11, dword_100074A70);
    if (off_100074A78)
    {
      if (a1) {
        a1 = *(void *)(a1 + 8);
      }
      CConfigFPU::ConfigForUserCode((CConfigFPU *)&v18);
      BOOL v13 = (void (*)(uint64_t, uint64_t))off_100074A78;
      uint64_t func = (uint64_t (*)(char *, uint64_t))__find_func(0xDFBF3F7FE0406020, 822395050);
      uint64_t v15 = func((char *)v11 + 136, 3012497319);
      v13(v15, a1);
      CConfigFPU::ConfigForSDKCode((CConfigFPU *)&v18);
    }
    uint64_t v16 = Madusa::Session::ValidateSequence((uint64_t)v11, 3012497319);
  }
  else
  {
    uint64_t v16 = 4294967294;
  }
  CConfigFPU::~CConfigFPU((CConfigFPU *)&v18);
  return v16;
}

uint64_t sub_100028B18(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  unint64_t v7 = a3;
  Madusa::MemoryMaster::MemoryMaster((Madusa::MemoryMaster *)v15, a3);
  if (Madusa::MemoryMaster::Valid((Madusa::MemoryMaster *)v15))
  {
    unint64_t Buffer = Madusa::MemoryMaster::AllocateBuffer((Madusa::MemoryMaster *)v15, v7);
    if (Buffer)
    {
      CConfigFPU::CConfigFPU((CConfigFPU *)&v16);
      uint64_t v11 = Madusa::Session::UnscrambleSessionPointer(a4, v10);
      uint64_t v12 = 4294967293;
      if ((int)a1 <= (int)a2)
      {
        uint64_t v13 = v11;
        if (v11)
        {
          uint64_t v12 = Madusa::Session::ValidateSequence(v11, 1582938202);
          if (!v12)
          {
            uint64_t v12 = Madusa::Session::ProcessRange(v13, a1, a2, Buffer, (uint64_t)&v16);
            if (!v12)
            {
              if (*(unsigned char *)(v13 + 128)) {
                uint64_t v12 = 0;
              }
              else {
                uint64_t v12 = 4294967195;
              }
            }
          }
        }
      }
      CConfigFPU::~CConfigFPU((CConfigFPU *)&v16);
    }
    else
    {
      uint64_t v12 = 4294967294;
    }
    Madusa::MemoryMaster::DeAllocateBuffer(Buffer, v8);
  }
  else
  {
    uint64_t v12 = 4294967294;
  }
  Madusa::MemoryMaster::Deallocate(v15);
  Madusa::MemoryMaster::~MemoryMaster(v15);
  return v12;
}

uint64_t SDKProcessImageData(uint64_t a1, _DWORD *a2)
{
  uint64_t v3 = Madusa::Session::UnscrambleSessionPointer(a1, a2);
  uint64_t DetectorAndDetect = 4294967293;
  if (a2)
  {
    BOOL v5 = (const Madusa::Session *)v3;
    if (v3)
    {
      uint64_t DetectorAndDetect = Madusa::Session::ValidateSequence(v3, 215514127);
      if (!DetectorAndDetect)
      {
        *(_OWORD *)(a2 + 1) = 0u;
        *(_OWORD *)(a2 + 5) = 0u;
        *(void *)(a2 + 9) = -1;
        *(void *)(a2 + 11) = -1;
        a2[13] = -1;
        *(_OWORD *)(a2 + 14) = 0u;
        *(_OWORD *)(a2 + 18) = 0u;
        *(_OWORD *)(a2 + 22) = 0u;
        *(_OWORD *)(a2 + 26) = 0u;
        *(_OWORD *)(a2 + 29) = 0u;
        *(_OWORD *)(a2 + 34) = 0u;
        *(_OWORD *)(a2 + 38) = 0u;
        *(_OWORD *)(a2 + 42) = 0u;
        *a2 = 184;
        uint64_t v6 = CConfigFPU::CConfigFPU((CConfigFPU *)&v32);
        CConfigFPU::ConfigForUserCode(v6);
        unint64_t v7 = off_100074A80;
        if (!off_100074A80)
        {
          uint64_t DetectorAndDetect = 4294967194;
LABEL_43:
          CConfigFPU::~CConfigFPU((CConfigFPU *)&v32);
          return DetectorAndDetect;
        }
        uint64_t func = (uint64_t (*)(char *, uint64_t))__find_func(0xDFDF7F5FA0000060, 828670090);
        uint64_t v9 = func((char *)v5 + 136, 3857773005);
        ((void (*)(uint64_t, _DWORD *, _DWORD *))v7)(v9, a2, a2 + 46);
        CConfigFPU::ConfigForSDKCode((CConfigFPU *)&v32);
        if (*a2 == 184)
        {
          Madusa::Session::ValidateSecureParams((uint64_t)v5, (_t_zn_IMAGEPARAMS *)a2);
          if (*(_DWORD *)(Madusa::System::mpSystem + 32) != 1)
          {
            int v10 = a2[3];
            int v11 = a2[4];
            goto LABEL_14;
          }
          int v10 = *((_DWORD *)v5 + 1163);
          if (v10 != a2[3]) {
            goto LABEL_42;
          }
          int v11 = *((_DWORD *)v5 + 1164);
          if (v11 != a2[4]) {
            goto LABEL_42;
          }
          if (*((_DWORD *)v5 + 1160) <= 1u)
          {
            if (*((_DWORD *)v5 + 1162) != a2[1]) {
              goto LABEL_42;
            }
LABEL_14:
            if (v10 <= v11) {
              int v12 = v11;
            }
            else {
              int v12 = v10;
            }
            if (v10 >= v11) {
              int v10 = v11;
            }
            if (v10 >= 1 && (float)((float)v12 / (float)v10) <= 1.03)
            {
              a2[3] = v12;
              a2[4] = v12;
            }
            Madusa::ImageParamsAdjuster::ImageParamsAdjuster(v30, (_t_zn_IMAGEPARAMS *)a2);
            Madusa::ImageParamsAdjuster::Adjust((uint64_t)v30);
            if (*(_DWORD *)(Madusa::System::mpSystem + 32) == 1)
            {
              Madusa::BandModeImageParamsValidator::BandModeImageParamsValidator((Madusa::BandModeImageParamsValidator *)v31, (const _t_zn_IMAGEPARAMS *)a2, v5);
              uint64_t v13 = Madusa::ImageParamsValidator::Validate((Madusa::ImageParamsValidator *)v31);
              if (v13 == -4)
              {
                CConfigFPU::ConfigForUserCode((CConfigFPU *)&v32);
                long long v25 = (void (*)(uint64_t, uint64_t))off_100074A88;
                if (off_100074A88 && *(_DWORD *)(Madusa::System::mpSystem + 32) != 2)
                {
                  long long v26 = (uint64_t (*)(char *, uint64_t))__find_func(0xBFFFDFFF0000E0F0, 1363419178);
                  uint64_t v27 = v26((char *)v5 + 136, 3445273946);
                  uint64_t NotificationParam = Madusa::Session::GetNotificationParam(v5);
                  v25(v27, NotificationParam);
                }
                CConfigFPU::ConfigForSDKCode((CConfigFPU *)&v32);
                Madusa::Session::UnlockSecureParams((uint64_t)v5);
                uint64_t DetectorAndDetect = 0;
              }
              else
              {
                uint64_t DetectorAndDetect = v13;
                if (!v13)
                {
                  ConvertImageParams((const _t_zn_IMAGEPARAMS *)a2, (Madusa::ImageProperties *)v31);
                  CreateProcessImageProperties((const _t_zn_IMAGEPARAMS *)a2, (uint64_t)v30);
                  uint64_t DetectorAndDetect = Madusa::Session::CreateDetectorAndDetect((uint64_t)v5, (uint64_t)v31, (uint64_t)v30, (uint64_t)&v32);
                  if (!DetectorAndDetect)
                  {
                    long long v14 = (uint64_t (*)(const Madusa::Session *))__find_func(0xFF1F1FDF00202070, 296017930);
                    int v15 = v14(v5);
                    if (v15 && off_100074A90)
                    {
                      CConfigFPU::ConfigForUserCode((CConfigFPU *)&v32);
                      char v16 = (void (*)(uint64_t, uint64_t))off_100074A90;
                      char v17 = (uint64_t (*)(char *, uint64_t))__find_func(0x1F3FBF5F60A0C040, -242990966);
                      uint64_t v18 = v17((char *)v5 + 136, 2621311653);
                      uint64_t v19 = Madusa::Session::GetNotificationParam(v5);
                      v16(v18, v19);
                      CConfigFPU::ConfigForSDKCode((CConfigFPU *)&v32);
                    }
                    if (off_100074A88) {
                      char v20 = v15;
                    }
                    else {
                      char v20 = 1;
                    }
                    if ((v20 & 1) == 0 && *(_DWORD *)(Madusa::System::mpSystem + 32) != 2)
                    {
                      CConfigFPU::ConfigForUserCode((CConfigFPU *)&v32);
                      long long v21 = (void (*)(uint64_t, uint64_t))off_100074A88;
                      long long v22 = (uint64_t (*)(char *, uint64_t))__find_func(0x8F5F1FDFC020E0C0, 1642389514);
                      uint64_t v23 = v22((char *)v5 + 136, 3445273946);
                      uint64_t v24 = Madusa::Session::GetNotificationParam(v5);
                      v21(v23, v24);
                      CConfigFPU::ConfigForSDKCode((CConfigFPU *)&v32);
                    }
                  }
                  Madusa::Session::UnlockSecureParams((uint64_t)v5);
                }
              }
            }
            else
            {
              uint64_t DetectorAndDetect = 0xFFFFFFFFLL;
            }
            goto LABEL_43;
          }
          if (*((_DWORD *)v5 + 1161) == a2[2]) {
            goto LABEL_14;
          }
        }
LABEL_42:
        uint64_t DetectorAndDetect = 4294967293;
        goto LABEL_43;
      }
    }
  }
  return DetectorAndDetect;
}

uint64_t SDKInitializeBanding(uint64_t a1, uint64_t a2)
{
  CConfigFPU::CConfigFPU((CConfigFPU *)&v14);
  if (*(_DWORD *)(Madusa::System::mpSystem + 32) == 1)
  {
    uint64_t v5 = Madusa::Session::UnscrambleSessionPointer(a1, v4);
    uint64_t v6 = 4294967293;
    if (a2)
    {
      uint64_t v7 = v5;
      if (v5)
      {
        if (*(_DWORD *)a2 == 24)
        {
          v8.i64[0] = 0x100000001;
          v8.i64[1] = 0x100000001;
          if ((vmaxv_u16((uint16x4_t)vmovn_s32(vcgtq_s32(v8, *(int32x4_t *)(a2 + 4)))) & 1) == 0
            && *(_DWORD *)(a2 + 20) <= 3u)
          {
            uint64_t v6 = Madusa::Session::ValidateSequence(v5, 2042132827);
            if (!v6)
            {
              long long v12 = 0uLL;
              int v13 = 0;
              ConvertPageParams(a2, (uint64_t)&v12);
              long long v10 = v12;
              int v11 = v13;
              Madusa::ZnTimer::Reset(v7 + 4672);
              *(_OWORD *)(v7 + 4640) = v10;
              *(_DWORD *)(v7 + 4656) = v11;
              Madusa::Session::DestroyDetector((Madusa::Session *)v7);
              *(unsigned char *)(v7 + 5040) = 0;
              if (*(unsigned char *)(v7 + 128)) {
                uint64_t v6 = 0;
              }
              else {
                uint64_t v6 = 4294967195;
              }
              Madusa::Session::IncrementLevel(v7);
            }
          }
        }
      }
    }
  }
  else
  {
    uint64_t v6 = 4294967292;
  }
  CConfigFPU::~CConfigFPU((CConfigFPU *)&v14);
  return v6;
}

uint64_t SDKTerminate(uint64_t a1)
{
  CConfigFPU::CConfigFPU((CConfigFPU *)&v15);
  uint64_t v3 = Madusa::Session::UnscrambleSessionPointer(a1, v2);
  if (v3)
  {
    uint64_t v4 = (unsigned __int8 *)v3;
    uint64_t v5 = Madusa::Session::ValidateSequence(v3, 4116428122);
    if (!v5)
    {
      if (off_100074AA0)
      {
        CConfigFPU::ConfigForUserCode((CConfigFPU *)&v15);
        uint64_t v6 = (void (*)(uint64_t, uint64_t))off_100074AA0;
        uint64_t func = (uint64_t (*)(unsigned __int8 *, uint64_t))__find_func(0x1F1FBF9FE0A0A020, -240893878);
        uint64_t v8 = func(v4 + 136, 4116428122);
        uint64_t StatusParam = Madusa::Session::GetStatusParam((Madusa::Session *)v4);
        v6(v8, StatusParam);
        CConfigFPU::ConfigForSDKCode((CConfigFPU *)&v15);
      }
      int v10 = v4[128];
      SessionMemory = (void **)Madusa::Session::GetSessionMemory((Madusa::Session *)v4);
      (**(void (***)(unsigned __int8 *))v4)(v4);
      Madusa::MemoryMaster::DeAllocateBuffer((uint64_t)v4, v12);
      Madusa::MemoryMaster::Deallocate(SessionMemory);
      Madusa::MemoryMaster::Destroy((Madusa::MemoryMaster *)SessionMemory, v13);
      if (v10) {
        uint64_t v5 = 0;
      }
      else {
        uint64_t v5 = 4294967195;
      }
    }
  }
  else
  {
    uint64_t v5 = 4294967293;
  }
  CConfigFPU::~CConfigFPU((CConfigFPU *)&v15);
  return v5;
}

uint64_t SDKTerminateBanding(uint64_t a1)
{
  CConfigFPU::CConfigFPU((CConfigFPU *)&v7);
  if (*(_DWORD *)(Madusa::System::mpSystem + 32) == 1)
  {
    uint64_t v3 = Madusa::Session::UnscrambleSessionPointer(a1, v2);
    if (v3)
    {
      uint64_t v4 = (Madusa::Session *)v3;
      uint64_t v5 = Madusa::Session::ValidateSequence(v3, 3915733459);
      if (!v5)
      {
        if (*((unsigned char *)v4 + 128)) {
          uint64_t v5 = 0;
        }
        else {
          uint64_t v5 = 4294967195;
        }
        Madusa::Session::DecrementLevel((uint64_t)v4);
        Madusa::Session::UnlockSecureParams((uint64_t)v4);
        Madusa::Session::FinishPage(v4);
      }
    }
    else
    {
      uint64_t v5 = 4294967293;
    }
  }
  else
  {
    uint64_t v5 = 4294967292;
  }
  CConfigFPU::~CConfigFPU((CConfigFPU *)&v7);
  return v5;
}

uint64_t SDKInitializeParallel(uint64_t a1, int (*a2)(int, int, unsigned int, void *, void *), void *a3)
{
  CConfigFPU::CConfigFPU((CConfigFPU *)&v11);
  uint64_t v7 = Madusa::Session::UnscrambleSessionPointer(a1, v6);
  uint64_t v8 = 4294967293;
  if (a2)
  {
    uint64_t v9 = v7;
    if (v7)
    {
      if (Madusa::Session::ValidateSequence(v7, 3065208169))
      {
        uint64_t v8 = 4294967292;
      }
      else
      {
        Madusa::Session::SetParallelFor(v9, a2, a3);
        if (*(unsigned char *)(v9 + 128)) {
          uint64_t v8 = 0;
        }
        else {
          uint64_t v8 = 4294967195;
        }
      }
    }
  }
  CConfigFPU::~CConfigFPU((CConfigFPU *)&v11);
  return v8;
}

uint64_t SDKProcessRange(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  CConfigFPU::CConfigFPU((CConfigFPU *)&v13);
  uint64_t v9 = Madusa::Session::UnscrambleSessionPointer(a4, v8);
  uint64_t v10 = 4294967293;
  if ((int)a1 <= (int)a2)
  {
    uint64_t v11 = v9;
    if (v9)
    {
      uint64_t v10 = Madusa::Session::ValidateSequence(v9, 1582938202);
      if (!v10)
      {
        uint64_t v10 = Madusa::Session::ProcessRange(v11, a1, a2, a3, (uint64_t)&v13);
        if (!v10)
        {
          if (*(unsigned char *)(v11 + 128)) {
            uint64_t v10 = 0;
          }
          else {
            uint64_t v10 = 4294967195;
          }
        }
      }
    }
  }
  CConfigFPU::~CConfigFPU((CConfigFPU *)&v13);
  return v10;
}

uint64_t SDKStoreWidth(uint64_t a1, uint64_t a2)
{
  CConfigFPU::CConfigFPU((CConfigFPU *)&v8);
  uint64_t v5 = (Madusa::Session *)Madusa::Session::UnscrambleSessionPointer(a1, v4);
  if (v5) {
    uint64_t v6 = Madusa::Session::StoreWidth(v5, a2);
  }
  else {
    uint64_t v6 = 0;
  }
  CConfigFPU::~CConfigFPU((CConfigFPU *)&v8);
  return v6;
}

uint64_t SDKStoreHeight(uint64_t a1, uint64_t a2)
{
  CConfigFPU::CConfigFPU((CConfigFPU *)&v8);
  uint64_t v5 = (Madusa::Session *)Madusa::Session::UnscrambleSessionPointer(a1, v4);
  if (v5) {
    uint64_t v6 = Madusa::Session::StoreHeight(v5, a2);
  }
  else {
    uint64_t v6 = 0;
  }
  CConfigFPU::~CConfigFPU((CConfigFPU *)&v8);
  return v6;
}

uint64_t SDKStoreXDotsPerInch(uint64_t a1, uint64_t a2)
{
  CConfigFPU::CConfigFPU((CConfigFPU *)&v8);
  uint64_t v5 = (Madusa::Session *)Madusa::Session::UnscrambleSessionPointer(a1, v4);
  if (v5) {
    uint64_t v6 = Madusa::Session::StoreXDotsPerInch(v5, a2);
  }
  else {
    uint64_t v6 = 0;
  }
  CConfigFPU::~CConfigFPU((CConfigFPU *)&v8);
  return v6;
}

uint64_t SDKStoreYDotsPerInch(uint64_t a1, uint64_t a2)
{
  CConfigFPU::CConfigFPU((CConfigFPU *)&v8);
  uint64_t v5 = (Madusa::Session *)Madusa::Session::UnscrambleSessionPointer(a1, v4);
  if (v5) {
    uint64_t v6 = Madusa::Session::StoreYDotsPerInch(v5, a2);
  }
  else {
    uint64_t v6 = 0;
  }
  CConfigFPU::~CConfigFPU((CConfigFPU *)&v8);
  return v6;
}

uint64_t SDKStoreColorModel(uint64_t a1, uint64_t a2)
{
  CConfigFPU::CConfigFPU((CConfigFPU *)&v8);
  uint64_t v5 = (Madusa::Session *)Madusa::Session::UnscrambleSessionPointer(a1, v4);
  if (v5) {
    uint64_t v6 = Madusa::Session::StoreColorModel(v5, a2);
  }
  else {
    uint64_t v6 = 0;
  }
  CConfigFPU::~CConfigFPU((CConfigFPU *)&v8);
  return v6;
}

uint64_t SDKStoreAlphaChannel(uint64_t a1, uint64_t a2)
{
  CConfigFPU::CConfigFPU((CConfigFPU *)&v8);
  uint64_t v5 = (Madusa::Session *)Madusa::Session::UnscrambleSessionPointer(a1, v4);
  if (v5) {
    uint64_t v6 = Madusa::Session::StoreAlphaChannel(v5, a2);
  }
  else {
    uint64_t v6 = 0;
  }
  CConfigFPU::~CConfigFPU((CConfigFPU *)&v8);
  return v6;
}

uint64_t SDKStoreBitsPerPixelPerColor(uint64_t a1, uint64_t a2)
{
  CConfigFPU::CConfigFPU((CConfigFPU *)&v8);
  uint64_t v5 = (Madusa::Session *)Madusa::Session::UnscrambleSessionPointer(a1, v4);
  if (v5) {
    uint64_t v6 = Madusa::Session::StoreBitsPerPixelPerColor(v5, a2);
  }
  else {
    uint64_t v6 = 0;
  }
  CConfigFPU::~CConfigFPU((CConfigFPU *)&v8);
  return v6;
}

uint64_t SDKStoreDataType(uint64_t a1, uint64_t a2)
{
  CConfigFPU::CConfigFPU((CConfigFPU *)&v8);
  uint64_t v5 = (Madusa::Session *)Madusa::Session::UnscrambleSessionPointer(a1, v4);
  if (v5) {
    uint64_t v6 = Madusa::Session::StoreDataType(v5, a2);
  }
  else {
    uint64_t v6 = 0;
  }
  CConfigFPU::~CConfigFPU((CConfigFPU *)&v8);
  return v6;
}

uint64_t SDKStorePaletteColorModel(uint64_t a1, uint64_t a2)
{
  CConfigFPU::CConfigFPU((CConfigFPU *)&v8);
  uint64_t v5 = (Madusa::Session *)Madusa::Session::UnscrambleSessionPointer(a1, v4);
  if (v5) {
    uint64_t v6 = Madusa::Session::StorePaletteColorModel(v5, a2);
  }
  else {
    uint64_t v6 = 0;
  }
  CConfigFPU::~CConfigFPU((CConfigFPU *)&v8);
  return v6;
}

uint64_t SDKStorePaletteBitsPerPixelPerColor(uint64_t a1, uint64_t a2)
{
  CConfigFPU::CConfigFPU((CConfigFPU *)&v8);
  uint64_t v5 = (Madusa::Session *)Madusa::Session::UnscrambleSessionPointer(a1, v4);
  if (v5) {
    uint64_t v6 = Madusa::Session::StorePaletteBitsPerPixelPerColor(v5, a2);
  }
  else {
    uint64_t v6 = 0;
  }
  CConfigFPU::~CConfigFPU((CConfigFPU *)&v8);
  return v6;
}

uint64_t SDKStoreInverted(uint64_t a1, uint64_t a2)
{
  CConfigFPU::CConfigFPU((CConfigFPU *)&v8);
  uint64_t v5 = (Madusa::Session *)Madusa::Session::UnscrambleSessionPointer(a1, v4);
  if (v5) {
    uint64_t v6 = Madusa::Session::StoreInverted(v5, a2);
  }
  else {
    uint64_t v6 = 0;
  }
  CConfigFPU::~CConfigFPU((CConfigFPU *)&v8);
  return v6;
}

uint64_t SDKStoreDataAccessFormat(uint64_t a1, uint64_t a2)
{
  CConfigFPU::CConfigFPU((CConfigFPU *)&v8);
  uint64_t v5 = (Madusa::Session *)Madusa::Session::UnscrambleSessionPointer(a1, v4);
  if (v5) {
    uint64_t v6 = Madusa::Session::StoreDataAccessFormat(v5, a2);
  }
  else {
    uint64_t v6 = 0;
  }
  CConfigFPU::~CConfigFPU((CConfigFPU *)&v8);
  return v6;
}

uint64_t SDKStoreXStride(uint64_t a1, uint64_t a2)
{
  CConfigFPU::CConfigFPU((CConfigFPU *)&v8);
  uint64_t v5 = (Madusa::Session *)Madusa::Session::UnscrambleSessionPointer(a1, v4);
  if (v5) {
    uint64_t v6 = Madusa::Session::StoreXStride(v5, a2);
  }
  else {
    uint64_t v6 = 0;
  }
  CConfigFPU::~CConfigFPU((CConfigFPU *)&v8);
  return v6;
}

uint64_t SDKStoreYStride(uint64_t a1, uint64_t a2)
{
  CConfigFPU::CConfigFPU((CConfigFPU *)&v8);
  uint64_t v5 = (Madusa::Session *)Madusa::Session::UnscrambleSessionPointer(a1, v4);
  if (v5) {
    uint64_t v6 = Madusa::Session::StoreYStride(v5, a2);
  }
  else {
    uint64_t v6 = 0;
  }
  CConfigFPU::~CConfigFPU((CConfigFPU *)&v8);
  return v6;
}

void SDKAssignWidth(uint64_t a1, int *a2, int a3)
{
  CConfigFPU::CConfigFPU((CConfigFPU *)&v8);
  uint64_t v7 = Madusa::Session::UnscrambleSessionPointer(a1, v6);
  if (v7) {
    Madusa::Session::AssignWidth(v7, a2, a3);
  }
  CConfigFPU::~CConfigFPU((CConfigFPU *)&v8);
}

void SDKAssignHeight(uint64_t a1, int *a2, int a3)
{
  CConfigFPU::CConfigFPU((CConfigFPU *)&v8);
  uint64_t v7 = Madusa::Session::UnscrambleSessionPointer(a1, v6);
  if (v7) {
    Madusa::Session::AssignHeight(v7, a2, a3);
  }
  CConfigFPU::~CConfigFPU((CConfigFPU *)&v8);
}

void SDKAssignXDotsPerInch(uint64_t a1, int *a2, int a3)
{
  CConfigFPU::CConfigFPU((CConfigFPU *)&v8);
  uint64_t v7 = Madusa::Session::UnscrambleSessionPointer(a1, v6);
  if (v7) {
    Madusa::Session::AssignXDotsPerInch(v7, a2, a3);
  }
  CConfigFPU::~CConfigFPU((CConfigFPU *)&v8);
}

void SDKAssignYDotsPerInch(uint64_t a1, int *a2, int a3)
{
  CConfigFPU::CConfigFPU((CConfigFPU *)&v8);
  uint64_t v7 = Madusa::Session::UnscrambleSessionPointer(a1, v6);
  if (v7) {
    Madusa::Session::AssignYDotsPerInch(v7, a2, a3);
  }
  CConfigFPU::~CConfigFPU((CConfigFPU *)&v8);
}

void SDKAssignColorModel(uint64_t a1, int *a2, int a3)
{
  CConfigFPU::CConfigFPU((CConfigFPU *)&v8);
  uint64_t v7 = Madusa::Session::UnscrambleSessionPointer(a1, v6);
  if (v7) {
    Madusa::Session::AssignColorModel(v7, a2, a3);
  }
  CConfigFPU::~CConfigFPU((CConfigFPU *)&v8);
}

void SDKAssignAlphaChannel(uint64_t a1, int *a2, int a3)
{
  CConfigFPU::CConfigFPU((CConfigFPU *)&v8);
  uint64_t v7 = Madusa::Session::UnscrambleSessionPointer(a1, v6);
  if (v7) {
    Madusa::Session::AssignAlphaChannel(v7, a2, a3);
  }
  CConfigFPU::~CConfigFPU((CConfigFPU *)&v8);
}

void SDKAssignBitsPerPixelPerColor(uint64_t a1, int *a2, int a3)
{
  CConfigFPU::CConfigFPU((CConfigFPU *)&v8);
  uint64_t v7 = Madusa::Session::UnscrambleSessionPointer(a1, v6);
  if (v7) {
    Madusa::Session::AssignBitsPerPixelPerColor(v7, a2, a3);
  }
  CConfigFPU::~CConfigFPU((CConfigFPU *)&v8);
}

void SDKAssignDataType(uint64_t a1, int *a2, int a3)
{
  CConfigFPU::CConfigFPU((CConfigFPU *)&v8);
  uint64_t v7 = Madusa::Session::UnscrambleSessionPointer(a1, v6);
  if (v7) {
    Madusa::Session::AssignDataType(v7, a2, a3);
  }
  CConfigFPU::~CConfigFPU((CConfigFPU *)&v8);
}

void SDKAssignPaletteColorModel(uint64_t a1, int *a2, int a3)
{
  CConfigFPU::CConfigFPU((CConfigFPU *)&v8);
  uint64_t v7 = Madusa::Session::UnscrambleSessionPointer(a1, v6);
  if (v7) {
    Madusa::Session::AssignPaletteColorModel(v7, a2, a3);
  }
  CConfigFPU::~CConfigFPU((CConfigFPU *)&v8);
}

void SDKAssignPaletteBitsPerPixelPerColor(uint64_t a1, int *a2, int a3)
{
  CConfigFPU::CConfigFPU((CConfigFPU *)&v8);
  uint64_t v7 = Madusa::Session::UnscrambleSessionPointer(a1, v6);
  if (v7) {
    Madusa::Session::AssignPaletteBitsPerPixelPerColor(v7, a2, a3);
  }
  CConfigFPU::~CConfigFPU((CConfigFPU *)&v8);
}

void SDKAssignInverted(uint64_t a1, int *a2, int a3)
{
  CConfigFPU::CConfigFPU((CConfigFPU *)&v8);
  uint64_t v7 = Madusa::Session::UnscrambleSessionPointer(a1, v6);
  if (v7) {
    Madusa::Session::AssignInverted(v7, a2, a3);
  }
  CConfigFPU::~CConfigFPU((CConfigFPU *)&v8);
}

void SDKAssignDataAccessFormat(uint64_t a1, int *a2, int a3)
{
  CConfigFPU::CConfigFPU((CConfigFPU *)&v8);
  uint64_t v7 = Madusa::Session::UnscrambleSessionPointer(a1, v6);
  if (v7) {
    Madusa::Session::AssignDataAccessFormat(v7, a2, a3);
  }
  CConfigFPU::~CConfigFPU((CConfigFPU *)&v8);
}

void SDKAssignXStride(uint64_t a1, int *a2, int a3)
{
  CConfigFPU::CConfigFPU((CConfigFPU *)&v8);
  uint64_t v7 = Madusa::Session::UnscrambleSessionPointer(a1, v6);
  if (v7) {
    Madusa::Session::AssignXStride(v7, a2, a3);
  }
  CConfigFPU::~CConfigFPU((CConfigFPU *)&v8);
}

void SDKAssignYStride(uint64_t a1, int *a2, int a3)
{
  CConfigFPU::CConfigFPU((CConfigFPU *)&v8);
  uint64_t v7 = Madusa::Session::UnscrambleSessionPointer(a1, v6);
  if (v7) {
    Madusa::Session::AssignYStride(v7, a2, a3);
  }
  CConfigFPU::~CConfigFPU((CConfigFPU *)&v8);
}

uint64_t sub_100029F34(unint64_t a1)
{
  if (HIDWORD(a1)) {
    return 0;
  }
  else {
    return off_100074AA8();
  }
}

uint64_t sub_100029F50()
{
  return off_100074AB0();
}

uint64_t Madusa::BandModeDetector::BandModeDetector(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 + 42992;
  uint64_t v4 = (Madusa::System *)Madusa::DetectorBase::DetectorBase(a1, a2);
  *(void *)uint64_t v4 = off_1000709A8;
  uint64_t v5 = (uint64_t)v4 + 8;
  *(void *)uint64_t v3 = 0;
  *(unsigned char *)(v3 + 8) = 1;
  *(_DWORD *)(v3 + 12) = 0;
  *(unsigned char *)(v3 + 16) = 1;
  *(_DWORD *)(v3 + 20) = 0;
  *(unsigned char *)(v3 + 24) = 1;
  *(_DWORD *)(v3 + 28) = 0;
  *(unsigned char *)(v3 + 32) = 1;
  *(_DWORD *)(v3 + 36) = 0;
  *(unsigned char *)(v3 + 40) = 1;
  *(_DWORD *)(v3 + 44) = 0;
  *(unsigned char *)(v3 + 48) = 1;
  *(_DWORD *)(v3 + 52) = 0;
  *(unsigned char *)(v3 + 56) = 1;
  *(_DWORD *)(v3 + 60) = 0;
  *(unsigned char *)(v3 + 64) = 1;
  *(unsigned char *)(v3 + 68) = 1;
  *(void *)(v3 + 72) = 0;
  *(void *)(v3 + 80) = 0;
  *(void *)(v3 + 72) = Madusa::System::CreateBandModeUtil(v4);
  Madusa::BlockPicker::SetBandRowOfBlocksAdvance(v5, 64);
  return a1;
}

void Madusa::BandModeDetector::~BandModeDetector(Madusa::BandModeDetector *this)
{
  unint64_t v2 = (void *)((char *)this + 43064);
  *(void *)this = off_1000709A8;
  uint64_t v3 = *((void *)this + 5384);
  if (v3)
  {
    uint64_t v4 = (void (***)(void))(*(uint64_t (**)(uint64_t))(*(void *)v3 + 48))(v3);
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      (**v4)(v4);
      Madusa::MemoryMaster::DeAllocateBuffer(v5, v6);
    }
    uint64_t v7 = (void (***)(void))v2[1];
    if (v7)
    {
      (**v7)(v7);
      Madusa::MemoryMaster::DeAllocateBuffer(v2[1], v8);
      v2[1] = 0;
    }
  }
  Madusa::System::DisposeBandModeUtil(*v2);

  Madusa::DetectorBase::~DetectorBase(this);
}

{
  uint64_t vars8;

  Madusa::BandModeDetector::~BandModeDetector(this);

  operator delete();
}

uint64_t Madusa::BandModeDetector::GetExtraWorkingMemorySize(uint64_t a1, int a2)
{
  long long v2 = *(_OWORD *)(a1 + 208);
  v13[12] = *(_OWORD *)(a1 + 192);
  v13[13] = v2;
  uint64_t v14 = *(void *)(a1 + 224);
  long long v3 = *(_OWORD *)(a1 + 144);
  v13[8] = *(_OWORD *)(a1 + 128);
  v13[9] = v3;
  long long v4 = *(_OWORD *)(a1 + 176);
  v13[10] = *(_OWORD *)(a1 + 160);
  v13[11] = v4;
  long long v5 = *(_OWORD *)(a1 + 80);
  void v13[4] = *(_OWORD *)(a1 + 64);
  v13[5] = v5;
  long long v6 = *(_OWORD *)(a1 + 112);
  v13[6] = *(_OWORD *)(a1 + 96);
  v13[7] = v6;
  long long v7 = *(_OWORD *)(a1 + 16);
  v13[0] = *(_OWORD *)a1;
  v13[1] = v7;
  long long v8 = *(_OWORD *)(a1 + 48);
  v13[2] = *(_OWORD *)(a1 + 32);
  void v13[3] = v8;
  Madusa::BandModeDetector::AdjustImageDataForBandOrder(a2, (Madusa::ImageProperties *)v13, (Madusa::ImageProperties *)a1);
  Madusa::MemoryMaster::MemoryMaster((Madusa::MemoryMaster *)v15, 0);
  unint64_t v9 = sub_10002D8A0((Madusa::ImageProperties *)v13);
  Madusa::MemoryMaster::~MemoryMaster(v15);
  unint64_t v10 = sub_10002D710((Madusa::ImageProperties *)v13);
  if (!v11 || v10 > 0xFFFFFFFFFFFFFF77) {
    return 0;
  }
  if (v9 + v10 + 136 < v9) {
    return 0;
  }
  return v9 + v10 + 136;
}

BOOL Madusa::BandModeDetector::AdjustImageDataForBandOrder(int a1, Madusa::ImageProperties *a2, Madusa::ImageProperties *a3)
{
  Madusa::VirtualRotator::VirtualRotator((Madusa::VirtualRotator *)v12);
  switch(a1)
  {
    case 0:
      if ((*(_DWORD *)Madusa::ImageProperties::GetYStride(a2) & 0x80000000) != 0) {
        goto LABEL_5;
      }
      goto LABEL_3;
    case 1:
      if ((*(_DWORD *)Madusa::ImageProperties::GetYStride(a2) & 0x80000000) != 0) {
        goto LABEL_3;
      }
LABEL_5:
      uint64_t Bounds = Madusa::ImageProperties::GetBounds(a3);
      uint64_t v11 = v7;
      BOOL result = Madusa::VirtualRotator::Rotate180((uint64_t)v12, (uint64_t)&Bounds, a2);
      break;
    case 2:
      uint64_t Bounds = Madusa::ImageProperties::GetBounds(a3);
      uint64_t v11 = v8;
      return Madusa::VirtualRotator::Rotate90CW((uint64_t)v12, (uint64_t)&Bounds, a2);
    case 3:
      uint64_t Bounds = Madusa::ImageProperties::GetBounds(a3);
      uint64_t v11 = v9;
      return Madusa::VirtualRotator::Rotate90CCW((uint64_t)v12, (uint64_t)&Bounds, a2);
    default:
LABEL_3:
      BOOL result = 1;
      break;
  }
  return result;
}

BOOL Madusa::BandModeDetector::SetExtraWorkingMemory(Madusa::BandModeDetector *this, Madusa::MemoryMaster *a2)
{
  long long v5 = (int64x2_t *)((char *)this + 43028);
  uint64_t ImageParams = Madusa::DetectorBase::GetImageParams(this);
  long long v8 = *(_OWORD *)(ImageParams + 16);
  long long v7 = *(_OWORD *)(ImageParams + 32);
  v31[0] = *(_OWORD *)ImageParams;
  v31[1] = v8;
  v31[2] = v7;
  long long v9 = *(_OWORD *)(ImageParams + 96);
  long long v11 = *(_OWORD *)(ImageParams + 48);
  long long v10 = *(_OWORD *)(ImageParams + 64);
  v31[5] = *(_OWORD *)(ImageParams + 80);
  v31[6] = v9;
  v31[3] = v11;
  v31[4] = v10;
  long long v12 = *(_OWORD *)(ImageParams + 160);
  long long v14 = *(_OWORD *)(ImageParams + 112);
  long long v13 = *(_OWORD *)(ImageParams + 128);
  v31[9] = *(_OWORD *)(ImageParams + 144);
  v31[10] = v12;
  v31[7] = v14;
  v31[8] = v13;
  long long v16 = *(_OWORD *)(ImageParams + 192);
  long long v15 = *(_OWORD *)(ImageParams + 208);
  long long v17 = *(_OWORD *)(ImageParams + 176);
  uint64_t v32 = *(void *)(ImageParams + 224);
  v31[12] = v16;
  v31[13] = v15;
  v31[11] = v17;
  uint64_t v18 = sub_10002A710((Madusa::ImageProperties *)v31, (uint64_t)a2);
  *(uint64_t *)((char *)&v5[2].i64[1] + 4) = v18;
  if (v18)
  {
    (*(void (**)(uint64_t, _OWORD *))(*(void *)v18 + 16))(v18, v31);
    Madusa::ImageProperties::GetSafeBounds((Madusa::ImageProperties *)v31, &v26);
    if (v5 != &v26)
    {
      v5->i32[0] = v26.i32[0];
      v5->i8[4] = v26.i8[4];
      v5->i32[2] = v26.i32[2];
      v5->i8[12] = v26.i8[12];
      v5[1].i32[0] = v27;
      v5[1].i8[4] = v28;
      v5[1].i32[2] = v29;
      v5[1].i8[12] = v30;
    }
    if (Madusa::ImageProperties::ShouldDownsample((Madusa::ImageProperties *)v31))
    {
      uint64_t v24 = 0x100000001;
      uint64_t v25 = 0x100000001;
      Madusa::ImageProperties::GetDownsampleRatios(v31, (Madusa::Ratio *)&v25, (Madusa::Ratio *)&v24);
      sub_10002327C(v5->i32, (int *)&v25, (int *)&v24, (unint64_t *)&v26);
      if (v5 != &v26)
      {
        v5->i32[0] = v26.i32[0];
        v5->i8[4] = v26.i8[4];
        v5->i32[2] = v26.i32[2];
        v5->i8[12] = v26.i8[12];
        v5[1].i32[0] = v27;
        v5[1].i8[4] = v28;
        v5[1].i32[2] = v29;
        v5[1].i8[12] = v30;
      }
    }
    BOOL v19 = 0;
    if (v5->i8[4] && v5->i8[12] && v5[1].i8[4]) {
      BOOL v19 = v5[1].i8[12] != 0;
    }
    uint64_t func = (void (*)(Madusa::BandModeDetector *))__find_func(0x3F9F5F5F80A080B0, -786128758);
    func(this);
  }
  else
  {
    BOOL v19 = 0;
  }
  if ((*v2 & 0x1F) == 0 && v2[2] <= 0x3Fu && v2[3] == 212
    || QuickCodec::mask != -70947757)
  {
    QuickCodec::masint k = FunctionTable::ft[0] ^ 0x157E9386;
    uint64_t v21 = __find_func(0xDF9FDF1FC0E04070, 824451274);
    uint64_t v22 = 0;
    while (*(unsigned __int8 *)(v21 + v22) != ((QuickCodec::mask ^ 0xC12A2DF3) / 0x9D28AF)
         || *(unsigned __int8 *)(v21 + v22 + 1) != ((QuickCodec::mask ^ 0xFBC56C53) / 0x9D28AF)
         || *(unsigned __int8 *)(v21 + v22 + 2) != ((QuickCodec::mask ^ 0xDDCAB631) / 0x9D28AF)
         || *(unsigned __int8 *)(v21 + v22 + 3) != ((QuickCodec::mask ^ 0x79E0DCBFu) / 0x9D28AF))
    {
      v22 += 4;
      if (v22 == 2400) {
        goto LABEL_24;
      }
    }
    uint64_t vars0 = v21 + v22;
    long long vars8 = 0u;
LABEL_24:
    QuickCodec::mask += 16;
  }
  return v19;
}

uint64_t sub_10002A710(Madusa::ImageProperties *a1, uint64_t a2)
{
  int ResolutionBucket = Madusa::ImageProperties::GetResolutionBucket(a1);
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 16))(a2, 136);
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  *(void *)(v5 + 24) = 0;
  *(unsigned char *)(v5 + 32) = 1;
  *(void *)(v5 + 120) = a2;
  *(_DWORD *)(v5 + 128) = ResolutionBucket;
  *(void *)(v5 + 40) = 0;
  *(unsigned char *)(v5 + 48) = 1;
  *(_DWORD *)(v5 + 56) = 0;
  *(unsigned char *)(v5 + 60) = 1;
  *(unsigned char *)(v5 + 64) = 0;
  *(void *)(v5 + 72) = 0;
  *(unsigned char *)(v5 + 80) = 1;
  *(void *)uint64_t v5 = off_1000709F8;
  *(void *)(v5 + 8) = 0;
  *(unsigned char *)(v5 + 16) = 1;
  *(void *)(v5 + 88) = 0;
  *(unsigned char *)(v5 + 96) = 1;
  *(void *)(v5 + 104) = 0;
  *(unsigned char *)(v5 + 112) = 1;
  unint64_t v7 = sub_10002D710(a1);
  char v9 = v8;
  Madusa::ImageProperties::GetSafeBounds(a1, &v17);
  if (Madusa::ImageProperties::ShouldDownsample(a1))
  {
    uint64_t v23 = 0x100000001;
    uint64_t v24 = 0x100000001;
    Madusa::ImageProperties::GetDownsampleRatios(a1, (Madusa::Ratio *)&v24, (Madusa::Ratio *)&v23);
    sub_10002327C(v17.i32, (int *)&v24, (int *)&v23, v20);
    int v10 = v21;
    int v11 = v22;
    uint64_t v12 = 0;
    if (!v9) {
      return v12;
    }
  }
  else
  {
    int v11 = v19;
    int v10 = v18;
    uint64_t v12 = 0;
    if (!v9) {
      return v12;
    }
  }
  if (v11)
  {
    if (v10 >= 0) {
      uint64_t v13 = v10;
    }
    else {
      uint64_t v13 = -v10;
    }
    (*(void (**)(uint64_t, int64x2_t *, int64x2_t *, unint64_t, uint64_t))(*(void *)v6 + 16))(v6, &v17, &v17, v7, v13);
    sub_10002E324(a1, a2, v6);
    uint64_t v12 = v14;
    if (!v14)
    {
      (**(void (***)(uint64_t))v6)(v6);
      Madusa::MemoryMaster::DeAllocateBuffer(v6, v15);
    }
  }
  return v12;
}

uint64_t Madusa::BandModeDetector::_SetExtraWorkingMemory(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 24))();
}

uint64_t Madusa::BandModeDetector::SetBandOrder(uint64_t result, int a2)
{
  *(_DWORD *)(result + 42992) = a2;
  return result;
}

uint64_t Madusa::BandModeDetector::_SetBandOrder(uint64_t result, int a2, int8x8_t a3)
{
  a3.i32[0] = *v3 | 0xFFFFFFE0;
  a3.i8[4] = v3[3];
  *(int8x8_t *)v4.i8 = vand_s8(a3, (int8x8_t)0xFF000000FFLL);
  v4.i64[1] = v4.i64[0];
  float32x4_t v5 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v4, (int32x4_t)xmmword_10006EF20));
  v6.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_10006EF30, v5)).u32[0];
  v6.i32[1] = vmovn_s32(vcgtq_f32(v5, (float32x4_t)xmmword_10006EF30)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v6, 0xFuLL))) & ((v3[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    ++QuickCodec::mask;
  }
  return Madusa::BandModeDetector::SetBandOrder(result, a2);
}

uint64_t Madusa::BandModeDetector::SetImageParams(Madusa::BandModeDetector *this, const Madusa::ImageProperties *a2, Madusa::MemoryMaster *a3)
{
  long long v5 = *((_OWORD *)a2 + 13);
  v14[12] = *((_OWORD *)a2 + 12);
  v14[13] = v5;
  uint64_t v15 = *((void *)a2 + 28);
  long long v6 = *((_OWORD *)a2 + 9);
  v14[8] = *((_OWORD *)a2 + 8);
  v14[9] = v6;
  long long v7 = *((_OWORD *)a2 + 11);
  v14[10] = *((_OWORD *)a2 + 10);
  v14[11] = v7;
  long long v8 = *((_OWORD *)a2 + 5);
  v14[4] = *((_OWORD *)a2 + 4);
  v14[5] = v8;
  long long v9 = *((_OWORD *)a2 + 7);
  v14[6] = *((_OWORD *)a2 + 6);
  v14[7] = v9;
  long long v10 = *((_OWORD *)a2 + 1);
  v14[0] = *(_OWORD *)a2;
  v14[1] = v10;
  long long v11 = *((_OWORD *)a2 + 3);
  _OWORD v14[2] = *((_OWORD *)a2 + 2);
  void v14[3] = v11;
  BOOL v12 = Madusa::BandModeDetector::AdjustImageDataForBandOrder(*((_DWORD *)this + 10748), (Madusa::ImageProperties *)v14, a2);
  return Madusa::DetectorBase::SetImageProperties(this, (const Madusa::ImageProperties *)v14, a3) & v12;
}

uint64_t Madusa::BandModeDetector::ProcessBand(Madusa::BandModeDetector *this, Madusa::ImageProperties *a2)
{
  long long v3 = (char *)this + 42992;
  if (!*((void *)this + 5384))
  {
    if ((*v2 & 0x1F) != 0 || v2[2] > 0x3Fu)
    {
      if (QuickCodec::mask == -70947757) {
        return 2;
      }
    }
    else
    {
      BOOL v26 = v2[3] != 212 && QuickCodec::mask == -70947757;
      if (v26) {
        return 2;
      }
    }
    unint64_t v37 = 0;
    int v38 = FunctionTable::ft[0] ^ 0x157E9386;
    QuickCodec::masint k = FunctionTable::ft[0] ^ 0x157E9386;
    int v39 = -1;
    do
    {
      qword_100074AF8[v39
                    + 1
                    + ((FunctionTable::swapTable[v37] ^ v38) / 0x9D28AF)] = qword_100074AF8[v39 + ((FunctionTable::swapTable[v37 + 1] ^ v38) / 0x9D28AF)];
      v39 -= 2;
      BOOL v25 = v37 >= 0x20;
      v37 += 2;
    }
    while (!v25);
    return 2;
  }
  uint64_t ImageParams = (Madusa::ImageProperties *)Madusa::DetectorBase::GetImageParams(this);
  Madusa::ImageProperties::GetBounds(ImageParams);
  uint64_t v8 = v7;
  Madusa::ImageProperties::CanonicalizeColorComponents((uint64_t)a2);
  if ((Madusa::ImageProperties::HasValidColorComponents(a2) & 1) == 0)
  {
    __int32 v27 = 0;
    int v28 = 0;
    if (QuickCodec::mask == -70947757) {
      int v29 = 9006445;
    }
    else {
      int v29 = 1043884;
    }
    uint64_t v30 = 1;
    int v31 = 1811173;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          uint64_t v34 = v30;
          if (v31 <= 1811243) {
            break;
          }
          if (v31 == 1811244)
          {
            if ((*v27 & 0x1F) != 0
              || v27[2] > 0x3Fu
              || (uint64_t v30 = 1,
                  int v31 = 1043884,
                  v27[3] != ((QuickCodec::mask ^ v28) / 0x10EB02)))
            {
              int v31 = 1043938;
              uint64_t v30 = v34;
            }
          }
          else if (v31 == 2855040)
          {
            __int32 v27 = v2;
            int v31 = 1811190;
          }
          else
          {
            BOOL v26 = v31 == 9006445;
            int v31 = 1811244;
            if (v26) {
              int v28 = -171445765;
            }
          }
        }
        if (v31 <= 1811172) {
          break;
        }
        unsigned int v32 = (QuickCodec::mask != -70947757) | v30;
        if (v31 == 1811190) {
          int v33 = v29;
        }
        else {
          int v33 = v31;
        }
        if (v31 == 1811190) {
          LODWORD(v34) = v32;
        }
        BOOL v35 = v31 == 1811173;
        if (v31 == 1811173) {
          int v31 = 1043884;
        }
        else {
          int v31 = v33;
        }
        if (v35) {
          uint64_t v30 = 0;
        }
        else {
          uint64_t v30 = v34;
        }
      }
      if (v31 != 1043884) {
        break;
      }
      int v31 = 1043938;
      if ((v30 & 1) == 0) {
        int v31 = 2855040;
      }
    }
    if (v30)
    {
      QuickCodec::masint k = FunctionTable::ft[0] ^ 0x157E9386;
      fegetenv(&v136);
      int v36 = QuickCodec::mask;
LABEL_59:
      v136.__fpcr &= v36 + 70947740;
      fesetenv(&v136);
    }
    return 2;
  }
  int v9 = *(_DWORD *)v3;
  long long v10 = (Madusa::ImageProperties *)Madusa::DetectorBase::GetImageParams(this);
  if (!Madusa::BandModeDetector::AdjustImageDataForBandOrder(v9, a2, v10))
  {
    long long v40 = 0;
    int v41 = 0;
    if (QuickCodec::mask == -70947757) {
      int v42 = 10737763;
    }
    else {
      int v42 = 516474;
    }
    uint64_t v43 = 1;
    int v44 = 402585;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          uint64_t v45 = v43;
          if (v44 > 516473) {
            break;
          }
          if (v44 == 402585)
          {
            uint64_t v43 = 0;
            int v44 = 516474;
          }
          else if (v44 == 402602)
          {
            uint64_t v43 = (QuickCodec::mask != -70947757) | v43;
            int v44 = v42;
          }
          else if ((*v40 & 0x1F) != 0 {
                 || v40[2] > 0x3Fu
          }
                 || (uint64_t v43 = 1,
                     int v44 = 516474,
                     v40[3] != ((QuickCodec::mask ^ v41) / 0x29000D)))
          {
            int v44 = 516528;
            uint64_t v43 = v45;
          }
        }
        if (v44 <= 919041) {
          break;
        }
        if (v44 == 919042)
        {
          long long v40 = v2;
          int v44 = 402602;
        }
        else
        {
          BOOL v26 = v44 == 10737763;
          int v44 = 402656;
          if (v26) {
            int v41 = -634296681;
          }
        }
      }
      if (v44 != 516474) {
        break;
      }
      if (v43) {
        int v44 = 516528;
      }
      else {
        int v44 = 919042;
      }
    }
    if ((v43 & 1) == 0) {
      return 2;
    }
    QuickCodec::masint k = FunctionTable::ft[0] ^ 0x157E9386;
    uint64_t func = __find_func(0xDF9FDF1FC0E04070, 824451274);
    uint64_t v47 = 0;
    while (*(unsigned __int8 *)(func + v47) != ((QuickCodec::mask ^ 0xC12A2DF3) / 0x9D28AF)
         || *(unsigned __int8 *)(func + v47 + 1) != ((QuickCodec::mask ^ 0xFBC56C53) / 0x9D28AF)
         || *(unsigned __int8 *)(func + v47 + 2) != ((QuickCodec::mask ^ 0xDDCAB631) / 0x9D28AF)
         || *(unsigned __int8 *)(func + v47 + 3) != ((QuickCodec::mask ^ 0x79E0DCBFu) / 0x9D28AF))
    {
      v47 += 4;
      if (v47 == 2400) {
        goto LABEL_95;
      }
    }
    uint64_t vars0 = func + v47;
    long long vars8 = 0u;
LABEL_95:
    QuickCodec::mask += 16;
    return 2;
  }
  if (Madusa::IteratorBoundsComputer::ValidateForImageProperties(a2, v11))
  {
    Integerdouble OffsetBounds = Madusa::ImageProperties::GetIntegerOffsetBounds(a2);
    unint64_t v15 = IntegerOffsetBounds;
    uint64_t v16 = (int)v13 + (uint64_t)(int)IntegerOffsetBounds;
    uint64_t v17 = v16 + 0x80000000;
    if (v16 != (int)v16) {
      LODWORD(v16) = 0;
    }
    if ((v17 | IntegerOffsetBounds) >> 32
      || (uint64_t v18 = v13, HIDWORD(v13) != HIDWORD(v8))
      || (int)v13 < 1
      || *((_DWORD *)v3 + 1) > (int)IntegerOffsetBounds
      || (int)v16 > (int)v8)
    {
      v14.i8[4] = v2[3];
      v14.i32[0] = *v2 | 0xFFFFFFE0;
      *(int8x8_t *)v19.i8 = vand_s8(v14, (int8x8_t)0xFF000000FFLL);
      v19.i64[1] = v19.i64[0];
      float32x4_t v20 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v19, (int32x4_t)xmmword_10006EF40));
      v21.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_10006EF50, v20)).u32[0];
      v21.i32[1] = vmovn_s32(vcgtq_f32(v20, (float32x4_t)xmmword_10006EF50)).i32[1];
      if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v21, 0xFuLL))) & ((v2[2] & 0xE0) == 32)) != 0
        || QuickCodec::mask != -70947757)
      {
        unint64_t v22 = 0;
        int v23 = FunctionTable::ft[0] ^ 0x157E9386;
        QuickCodec::masint k = FunctionTable::ft[0] ^ 0x157E9386;
        int v24 = -1;
        do
        {
          qword_100074AF8[v24
                        + 1
                        + ((FunctionTable::swapTable[v22] ^ v23) / 0x9D28AF)] = qword_100074AF8[v24 + ((FunctionTable::swapTable[v22 + 1] ^ v23) / 0x9D28AF)];
          v24 -= 2;
          BOOL v25 = v22 >= 0x20;
          v22 += 2;
        }
        while (!v25);
      }
      return 2;
    }
    int v115 = v13;
    if (!Madusa::ImageProperties::ShouldDownsample(a2))
    {
      unsigned int fpcr = 0;
      char v123 = 1;
      int fpsr = v15;
      uint64_t v53 = 1;
      uint64_t v54 = 1;
      int v51 = v18;
      unint64_t v117 = (unint64_t)&_mh_execute_header & 0xFFFFFFFF00000000 | HIDWORD(v18);
      unint64_t v118 = v117;
      goto LABEL_108;
    }
    sub_10002C148(a2, &v136.__fpsr);
    int v51 = v137;
    if ((int)v137 >= 1)
    {
      int fpsr = v136.__fpsr;
      char v123 = BYTE4(v136.__fpsr);
      unsigned int fpcr = v136.__fpcr;
      uint64_t v53 = BYTE4(v136.__fpcr);
      uint64_t v54 = BYTE4(v137);
      unint64_t v117 = v138 | ((unint64_t)BYTE4(v138) << 32);
      unint64_t v118 = (unint64_t)&_mh_execute_header & 0xFFFFFFFF00000000 | HIDWORD(v18);
LABEL_108:
      BOOL v121 = 1;
      unsigned int v119 = v15;
      BOOL v122 = 1;
      unsigned int v120 = v18;
      unint64_t v116 = fpcr | (unint64_t)(v53 << 32);
      while (1)
      {
        uint64_t v56 = *((int *)v3 + 5);
        if (fpsr <= (int)v56) {
          goto LABEL_131;
        }
        unint64_t v57 = 0;
        if (v123 && v3[24])
        {
          uint64_t v58 = fpsr - v56;
          unint64_t v59 = (unint64_t)&_mh_execute_header & 0xFFFFFFFF00000000 | (fpsr - v56);
          if (v58 == (int)v58) {
            unint64_t v57 = v59;
          }
          else {
            unint64_t v57 = 0;
          }
        }
        unint64_t v60 = *(void *)(v3 + 28);
        v136.__int fpsr = v57;
        unint64_t v132 = v60;
        uint64_t v61 = v54;
        if ((int)v57 <= (int)v60)
        {
          char v62 = &v136;
          if ((v60 & 0xFF00000000) == 0) {
LABEL_122:
          }
            BYTE4(v62->__fpsr) = 0;
        }
        else
        {
          char v62 = (fenv_t *)&v132;
          if ((v57 & 0x100000000) == 0) {
            goto LABEL_122;
          }
        }
        unint64_t v63 = v62->__fpsr;
        unint64_t v64 = *(void *)(v3 + 44);
        unint64_t v65 = *(void *)(v3 + 60);
        v136.__int fpsr = *(void *)(v3 + 20);
        v136.__unsigned int fpcr = v64;
        unint64_t v137 = v63;
        unint64_t v138 = v65;
        (*(void (**)(void, fenv_t *))(**((void **)v3 + 10) + 32))(*((void *)v3 + 10), &v136);
        uint64_t v54 = v61;
        if (v3[24])
        {
          uint64_t v66 = *((int *)v3 + 5) + (uint64_t)(int)v63;
          if (v66 == (int)v66) {
            *((_DWORD *)v3 + 5) = v66;
          }
          v3[24] = (unint64_t)(v66 + 0x80000000) >> 32 == 0;
        }
        if (v3[32])
        {
          uint64_t v67 = *((int *)v3 + 7) - (uint64_t)(int)v63;
          if (v67 == (int)v67) {
            *((_DWORD *)v3 + 7) = v67;
          }
          v3[32] = (unint64_t)(v67 + 0x80000000) >> 32 == 0;
        }
LABEL_131:
        unint64_t v68 = *(void *)(v3 + 28);
        LODWORD(v136.__fpsr) = v51;
        HIDWORD(v136.__fpsr) = v54;
        unint64_t v132 = v68;
        if (v51 <= (int)v68)
        {
          float32x4_t v69 = &v136;
          if ((v68 & 0xFF00000000) != 0) {
            goto LABEL_136;
          }
        }
        else
        {
          float32x4_t v69 = (fenv_t *)&v132;
          if ((_BYTE)v54) {
            goto LABEL_136;
          }
        }
        BYTE4(v69->__fpsr) = 0;
LABEL_136:
        unint64_t v70 = v69->__fpsr;
        if ((v69->__fpsr & 0xFF00000000) == 0)
        {
          if ((*v2 & 0x1F) == 0 && v2[2] <= 0x3Fu && v2[3] == 212 || QuickCodec::mask != -70947757)
          {
            QuickCodec::masint k = FunctionTable::ft[0] ^ 0x157E9386;
            fegetenv(&v136);
            int v36 = QuickCodec::mask;
            goto LABEL_59;
          }
          return 2;
        }
        if ((int)v70 < 1)
        {
          uint64_t v75 = HIDWORD(v68);
          goto LABEL_193;
        }
        LODWORD(v136.__fpsr) = fpsr;
        BYTE4(v136.__fpsr) = v123;
        v136.__unsigned int fpcr = v116;
        unint64_t v137 = v70;
        unint64_t v138 = v117;
        unint64_t v132 = v119 | ((unint64_t)v121 << 32);
        unint64_t v133 = HIDWORD(v15) | (unint64_t)&_mh_execute_header;
        unint64_t v134 = v120 | ((unint64_t)v122 << 32);
        unint64_t v135 = v118;
        if (v51 != v70)
        {
          if (!v122 || (uint64_t v71 = v70 * (uint64_t)(int)v120, v70 * v120 != v71) || !(_BYTE)v54)
          {
            if ((*v2 & 0x1F) == 0 && v2[2] <= 0x3Fu && v2[3] == 212 || QuickCodec::mask != -70947757)
            {
              QuickCodec::masint k = FunctionTable::ft[0] ^ 0x157E9386;
              uint64_t v104 = __find_func(0xDF9FDF1FC0E04070, 824451274);
              uint64_t v105 = 0;
              while (*(unsigned __int8 *)(v104 + v105) != ((QuickCodec::mask ^ 0xC12A2DF3) / 0x9D28AF)
                   || *(unsigned __int8 *)(v104 + v105 + 1) != ((QuickCodec::mask ^ 0xFBC56C53)
                                                                               / 0x9D28AF)
                   || *(unsigned __int8 *)(v104 + v105 + 2) != ((QuickCodec::mask ^ 0xDDCAB631)
                                                                               / 0x9D28AF)
                   || *(unsigned __int8 *)(v104 + v105 + 3) != ((QuickCodec::mask ^ 0x79E0DCBFu)
                                                                               / 0x9D28AF))
              {
                v105 += 4;
                if (v105 == 2400) {
                  goto LABEL_282;
                }
              }
              uint64_t vars0 = v104 + v105;
              long long vars8 = 0u;
LABEL_282:
              QuickCodec::mask += 16;
            }
            return 2;
          }
          if (v70 * v120) {
            LODWORD(v71) = (int)(v70 * v120) / v51;
          }
          LODWORD(v134) = v71;
          BYTE4(v134) = 1;
        }
        char v72 = v54;
        sub_10002C1D0(&v136.__fpsr, (_DWORD *)this + 10757, &v125);
        BOOL v73 = 0;
        LODWORD(v136.__fpsr) = v125;
        BYTE4(v136.__fpsr) = BYTE4(v125);
        LODWORD(v136.__fpcr) = v126;
        BYTE4(v136.__fpcr) = v127;
        LODWORD(v137) = v128;
        BYTE4(v137) = v129;
        LODWORD(v138) = v130;
        BYTE4(v138) = v131;
        if (!BYTE4(v125) || !v127)
        {
LABEL_159:
          int v74 = 0;
          goto LABEL_160;
        }
        int v74 = 0;
        if (v129 && v131)
        {
          BOOL v73 = 0;
          if (!BYTE4(v132) || !BYTE4(v133) || !BYTE4(v134) || !BYTE4(v135)) {
            goto LABEL_159;
          }
          int v74 = 0;
          if (v128 >= 1 && v130 >= 1)
          {
            (*(void (**)(void, Madusa::ImageProperties *, unint64_t *, fenv_t *))(**((void **)v3 + 10) + 24))(*((void *)v3 + 10), a2, &v132, &v136);
            BOOL v73 = BYTE4(v134) == 0;
            if (BYTE4(v134)) {
              int v74 = v134;
            }
            else {
              int v74 = 0;
            }
          }
        }
LABEL_160:
        LOBYTE(v75) = v3[32];
        if ((_BYTE)v75)
        {
          uint64_t v75 = *((int *)v3 + 7) - (uint64_t)(int)v70;
          if (v75 == (int)v75) {
            *((_DWORD *)v3 + 7) = v75;
          }
          LOBYTE(v75) = (unint64_t)(v75 + 0x80000000) >> 32 == 0;
          v3[32] = v75;
        }
        if (v3[24])
        {
          uint64_t v76 = *((int *)v3 + 5) + (uint64_t)(int)v70;
          if (v76 == (int)v76) {
            *((_DWORD *)v3 + 5) = v76;
          }
          v3[24] = (unint64_t)(v76 + 0x80000000) >> 32 == 0;
        }
        if (v123)
        {
          char v123 = v70 + fpsr == (int)v70 + (uint64_t)fpsr;
          if (v70 + fpsr == (int)v70 + (uint64_t)fpsr) {
            int v77 = v70 + fpsr;
          }
          else {
            int v77 = fpsr;
          }
          int fpsr = v77;
          if (!v72)
          {
LABEL_177:
            uint64_t v54 = 0;
            goto LABEL_178;
          }
        }
        else
        {
          char v123 = 0;
          if (!v72) {
            goto LABEL_177;
          }
        }
        uint64_t v78 = v51 - (uint64_t)(int)v70;
        uint64_t v54 = (int)v78 == v78;
        if ((int)v78 == v78) {
          v51 -= v70;
        }
LABEL_178:
        if (!v121)
        {
          if (!v122) {
            BOOL v73 = 1;
          }
          if (!v73)
          {
            BOOL v121 = 0;
            uint64_t v79 = v74;
LABEL_188:
            uint64_t v82 = (int)v120 - v79;
            BOOL v122 = (int)v82 == v82;
            if ((int)v82 == v82) {
              unsigned int v83 = v82;
            }
            else {
              unsigned int v83 = v120;
            }
            unsigned int v120 = v83;
            goto LABEL_192;
          }
LABEL_184:
          BOOL v121 = 0;
          BOOL v122 = 0;
          goto LABEL_192;
        }
        if (v73) {
          goto LABEL_184;
        }
        uint64_t v79 = v74;
        unsigned int v80 = v119;
        uint64_t v81 = v74 + (uint64_t)(int)v119;
        BOOL v121 = (int)v81 == v81;
        if ((int)v81 == v81) {
          unsigned int v80 = v81;
        }
        unsigned int v119 = v80;
        if (v122) {
          goto LABEL_188;
        }
        BOOL v122 = 0;
LABEL_192:
        LODWORD(v68) = *((_DWORD *)v3 + 7);
LABEL_193:
        if ((v68 & 0x80000000) != 0)
        {
          float32x4_t v89 = 0;
          int v90 = 0;
          if (QuickCodec::mask == -70947757) {
            int v91 = 5821782;
          }
          else {
            int v91 = 4583242;
          }
          uint64_t v92 = 1;
          int v93 = 145381;
          while (1)
          {
            while (1)
            {
              while (1)
              {
                uint64_t v94 = v92;
                if (v93 > 4583241) {
                  break;
                }
                if (v93 == 145381)
                {
                  uint64_t v92 = 0;
                  int v93 = 4583242;
                }
                else if (v93 == 145398)
                {
                  uint64_t v92 = (QuickCodec::mask != -70947757) | v92;
                  int v93 = v91;
                }
                else if ((*v89 & 0x1F) != 0 {
                       || v89[2] > 0x3Fu
                }
                       || (uint64_t v92 = 1,
                           int v93 = 4583242,
                           v89[3] != ((QuickCodec::mask ^ v90) / 0x6A92BD)))
                {
                  int v93 = 4583296;
                  uint64_t v92 = v94;
                }
              }
              if (v93 <= 4728605) {
                break;
              }
              if (v93 == 4728606)
              {
                float32x4_t v89 = v2;
                int v93 = 145398;
              }
              else
              {
                BOOL v26 = v93 == 5821782;
                int v93 = 145452;
                if (v26) {
                  int v90 = -1551570729;
                }
              }
            }
            if (v93 != 4583242) {
              break;
            }
            if (v92) {
              int v93 = 4583296;
            }
            else {
              int v93 = 4728606;
            }
          }
          if (v92)
          {
            QuickCodec::masint k = FunctionTable::ft[0] ^ 0x157E9386;
            goto LABEL_101;
          }
          return 2;
        }
        if ((_BYTE)v75) {
          BOOL v84 = v68 == 0;
        }
        else {
          BOOL v84 = 0;
        }
        char v85 = v84;
        if (v84)
        {
          uint64_t v86 = v54;
          float v87 = (uint64_t (*)(Madusa::BandModeDetector *))__find_func(0x1F1F3FBFA0C02090, -240861078);
          uint64_t v49 = v87(this);
          (*(void (**)(void))(**((void **)v3 + 10) + 56))(*((void *)v3 + 10));
          if (v49)
          {
            int32x4_t v106 = 0;
            int v107 = 0;
            if (QuickCodec::mask == -70947757) {
              int v108 = 5668669;
            }
            else {
              int v108 = 1641169;
            }
            uint64_t v109 = 1;
            int v110 = 744085;
            while (1)
            {
              while (1)
              {
                while (1)
                {
                  uint64_t v111 = v109;
                  if (v110 > 1641168) {
                    break;
                  }
                  if (v110 == 744085)
                  {
                    uint64_t v109 = 0;
                    int v110 = 1641169;
                  }
                  else if (v110 == 744102)
                  {
                    uint64_t v109 = (QuickCodec::mask != -70947757) | v109;
                    int v110 = v108;
                  }
                  else if ((*v106 & 0x1F) != 0 {
                         || v106[2] > 0x3Fu
                  }
                         || (uint64_t v109 = 1,
                             int v110 = 1641169,
                             v106[3] != ((QuickCodec::mask ^ v107)
                                                                         / 0x2BE8D3)))
                  {
                    int v110 = 1641223;
                    uint64_t v109 = v111;
                  }
                }
                if (v110 <= 2385236) {
                  break;
                }
                if (v110 == 2385237)
                {
                  int32x4_t v106 = v2;
                  int v110 = 744102;
                }
                else
                {
                  BOOL v26 = v110 == 5668669;
                  int v110 = 744156;
                  if (v26) {
                    int v107 = -543579409;
                  }
                }
              }
              if (v110 != 1641169) {
                break;
              }
              if (v109) {
                int v110 = 1641223;
              }
              else {
                int v110 = 2385237;
              }
            }
            if (v109)
            {
              unint64_t v112 = 0;
              int v113 = FunctionTable::ft[0] ^ 0x157E9386;
              QuickCodec::masint k = FunctionTable::ft[0] ^ 0x157E9386;
              int v114 = -1;
              do
              {
                qword_100074AF8[v114
                              + 1
                              + ((FunctionTable::swapTable[v112] ^ v113)
                                                              / 0x9D28AF)] = qword_100074AF8[v114
                                                                                           + ((FunctionTable::swapTable[v112 + 1] ^ v113) / 0x9D28AF)];
                v114 -= 2;
                BOOL v25 = v112 >= 0x20;
                v112 += 2;
              }
              while (!v25);
            }
            return v49;
          }
          if (!v3[16] || (int v88 = *((_DWORD *)v3 + 3), v88 == 0x7FFFFFFF)) {
            v3[16] = 0;
          }
          else {
            *((_DWORD *)v3 + 3) = v88 + 1;
          }
          BOOL v55 = (void (*)(Madusa::BandModeDetector *))__find_func(0xEF7FDF1F60208080, 29630666);
          v55(this);
          uint64_t v54 = v86;
        }
        if (v51 <= 0) {
          goto LABEL_237;
        }
      }
    }
    char v85 = 0;
LABEL_237:
    *((_DWORD *)v3 + 1) = v15 + v115;
    v3[8] = 1;
    if ((int)v15 + v115 < (int)v8
      || (v85 & 1) != 0
      || (float32x4x4_t v95 = (uint64_t (*)(Madusa::BandModeDetector *))__find_func(0x3FDF7F1F20804050, -781942582),
          uint64_t v96 = v95(this),
          !v96))
    {
      float32x4x4_t v97 = 0;
      int v98 = 0;
      if (QuickCodec::mask == -70947757) {
        int v99 = 5700082;
      }
      else {
        int v99 = 4326472;
      }
      uint64_t v100 = 1;
      int v101 = 597004;
      while (1)
      {
        while (1)
        {
          while (1)
          {
            uint64_t v102 = v100;
            if (v101 > 4326471) {
              break;
            }
            if (v101 == 597004)
            {
              uint64_t v100 = 0;
              int v101 = 4326472;
            }
            else if (v101 == 597021)
            {
              uint64_t v100 = (QuickCodec::mask != -70947757) | v100;
              int v101 = v99;
            }
            else if ((*v97 & 0x1F) != 0 {
                   || v97[2] > 0x3Fu
            }
                   || (uint64_t v100 = 1,
                       int v101 = 4326472,
                       v97[3] != ((QuickCodec::mask ^ v98) / 0x8010B0)))
            {
              int v101 = 4326526;
              uint64_t v100 = v102;
            }
          }
          if (v101 <= 4923458) {
            break;
          }
          if (v101 == 4923459)
          {
            float32x4x4_t v97 = v2;
            int v101 = 597021;
          }
          else
          {
            BOOL v26 = v101 == 5700082;
            int v101 = 597075;
            if (v26) {
              int v98 = -1849115245;
            }
          }
        }
        if (v101 != 4326472) {
          break;
        }
        if (v100) {
          int v101 = 4326526;
        }
        else {
          int v101 = 4923459;
        }
      }
      if (v100)
      {
        QuickCodec::masint k = FunctionTable::ft[0] ^ 0x157E9386;
        uint64_t v103 = (void (*)(void, uint64_t))__find_func(0xBFBF1F1FC0C00040, 1359274186);
        v103(0, 104);
      }
      return 0;
    }
    else
    {
      uint64_t v49 = v96;
      if ((*v2 & 0x1F) == 0 && v2[2] <= 0x3Fu && v2[3] == 212 || QuickCodec::mask != -70947757)
      {
        QuickCodec::masint k = FunctionTable::ft[0] ^ 0x157E9386;
        fegetenv(&v136);
        v136.__fpcr &= QuickCodec::mask + 70947740;
        fesetenv(&v136);
      }
    }
  }
  else
  {
    if ((*v2 & 0x1F) == 0 && v2[2] <= 0x3Fu && v2[3] == 212 || QuickCodec::mask != -70947757)
    {
      QuickCodec::masint k = FunctionTable::ft[0] ^ 0x157E9386;
LABEL_101:
      int v48 = (void (*)(void, uint64_t))__find_func(0xBFBF1F1FC0C00040, 1359274186);
      v48(0, 104);
    }
    return 2;
  }
  return v49;
}

unint64_t sub_10002C148@<X0>(Madusa::ImageProperties *a1@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v10 = 0x100000001;
  uint64_t v9 = 0x100000001;
  Madusa::ImageProperties::GetDownsampleRatios(a1, (Madusa::Ratio *)&v10, (Madusa::Ratio *)&v9);
  Integerdouble OffsetBounds = Madusa::ImageProperties::GetIntegerOffsetBounds(a1);
  v8[0] = (unint64_t)&_mh_execute_header & 0xFFFFFFFF00000000 | IntegerOffsetBounds;
  v8[1] = (unint64_t)&_mh_execute_header & 0xFFFFFFFF00000000 | HIDWORD(IntegerOffsetBounds);
  v8[2] = (unint64_t)&_mh_execute_header & 0xFFFFFFFF00000000 | v5;
  void v8[3] = (unint64_t)&_mh_execute_header & 0xFFFFFFFF00000000 | v6;
  return sub_10002327C((int *)v8, (int *)&v10, (int *)&v9, a2);
}

unint64_t *sub_10002C1D0@<X0>(unint64_t *result@<X0>, _DWORD *a2@<X1>, unint64_t *a3@<X8>)
{
  if (*((unsigned char *)result + 4)) {
    BOOL v3 = *((unsigned char *)result + 20) == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3 || (int v4 = *((_DWORD *)result + 4), v5 = v4 + *(_DWORD *)result, __OFADD__(v4, *(_DWORD *)result)))
  {
    unint64_t v6 = 0;
    if (*((unsigned char *)result + 12)) {
      BOOL v7 = *((unsigned char *)result + 28) == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7) {
      goto LABEL_21;
    }
  }
  else
  {
    if ((unint64_t)(v5 + 0x7FFFFFFFLL) >> 32) {
      unint64_t v6 = 0;
    }
    else {
      unint64_t v6 = (v5 - 1) | (unint64_t)&_mh_execute_header;
    }
    if (*((unsigned char *)result + 12)) {
      BOOL v8 = *((unsigned char *)result + 28) == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8) {
      goto LABEL_21;
    }
  }
  int v9 = *((_DWORD *)result + 2);
  int v10 = *((_DWORD *)result + 6);
  BOOL v11 = __OFADD__(v10, v9);
  int v12 = v10 + v9;
  if (!v11)
  {
    if ((unint64_t)(v12 + 0x7FFFFFFFLL) >> 32) {
      unint64_t v13 = 0;
    }
    else {
      unint64_t v13 = (v12 - 1) | (unint64_t)&_mh_execute_header;
    }
    if (*((unsigned char *)a2 + 4)) {
      BOOL v15 = *((unsigned char *)a2 + 20) == 0;
    }
    else {
      BOOL v15 = 1;
    }
    if (!v15) {
      goto LABEL_34;
    }
LABEL_36:
    unint64_t v18 = 0;
    unint64_t v19 = 0;
    if (*((unsigned char *)a2 + 12)) {
      goto LABEL_42;
    }
LABEL_46:
    unint64_t v23 = *result;
    unint64_t v24 = *(void *)a2;
    unint64_t v40 = v24;
    unint64_t v41 = v23;
    if ((int)v23 >= (int)v24) {
      goto LABEL_59;
    }
LABEL_47:
    BOOL v25 = &v40;
    if ((v23 & 0xFF00000000) == 0) {
      goto LABEL_60;
    }
LABEL_48:
    unint64_t v26 = *v25;
    unint64_t v27 = result[1];
    unint64_t v28 = *((void *)a2 + 1);
    unint64_t v40 = v28;
    unint64_t v41 = v27;
    if ((int)v27 >= (int)v28) {
      goto LABEL_61;
    }
LABEL_49:
    int v29 = &v40;
    if ((v27 & 0xFF00000000) == 0) {
      goto LABEL_62;
    }
LABEL_50:
    unint64_t v30 = *v29;
    unint64_t v40 = v18;
    unint64_t v41 = v6;
    if ((int)v6 <= (int)v18) {
      goto LABEL_63;
    }
LABEL_51:
    int v31 = &v40;
    if ((v6 & 0x100000000) == 0) {
      goto LABEL_64;
    }
LABEL_52:
    unint64_t v32 = *v31;
    unint64_t v40 = v19;
    unint64_t v41 = v13;
    if ((int)v13 <= (int)v19) {
      goto LABEL_65;
    }
LABEL_53:
    int v33 = &v40;
    if ((v13 & 0x100000000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_67;
  }
LABEL_21:
  unint64_t v13 = 0;
  if (*((unsigned char *)a2 + 4)) {
    BOOL v14 = *((unsigned char *)a2 + 20) == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14) {
    goto LABEL_36;
  }
LABEL_34:
  int v16 = a2[4];
  int v17 = v16 + *a2;
  if (__OFADD__(v16, *a2)) {
    goto LABEL_36;
  }
  if ((unint64_t)(v17 + 0x7FFFFFFFLL) >> 32) {
    unint64_t v18 = 0;
  }
  else {
    unint64_t v18 = (v17 - 1) | (unint64_t)&_mh_execute_header;
  }
  unint64_t v19 = 0;
  if (!*((unsigned char *)a2 + 12)) {
    goto LABEL_46;
  }
LABEL_42:
  if (!*((unsigned char *)a2 + 28)) {
    goto LABEL_46;
  }
  int v20 = a2[2];
  int v21 = a2[6];
  BOOL v11 = __OFADD__(v21, v20);
  int v22 = v21 + v20;
  if (v11)
  {
    unint64_t v19 = 0;
    goto LABEL_46;
  }
  if ((unint64_t)(v22 + 0x7FFFFFFFLL) >> 32) {
    unint64_t v19 = 0;
  }
  else {
    unint64_t v19 = (v22 - 1) | (unint64_t)&_mh_execute_header;
  }
  unint64_t v23 = *result;
  unint64_t v24 = *(void *)a2;
  unint64_t v40 = v24;
  unint64_t v41 = v23;
  if ((int)v23 < (int)v24) {
    goto LABEL_47;
  }
LABEL_59:
  BOOL v25 = &v41;
  if ((v24 & 0xFF00000000) != 0) {
    goto LABEL_48;
  }
LABEL_60:
  *((unsigned char *)v25 + 4) = 0;
  unint64_t v26 = *v25;
  unint64_t v27 = result[1];
  unint64_t v28 = *((void *)a2 + 1);
  unint64_t v40 = v28;
  unint64_t v41 = v27;
  if ((int)v27 < (int)v28) {
    goto LABEL_49;
  }
LABEL_61:
  int v29 = &v41;
  if ((v28 & 0xFF00000000) != 0) {
    goto LABEL_50;
  }
LABEL_62:
  *((unsigned char *)v29 + 4) = 0;
  unint64_t v30 = *v29;
  unint64_t v40 = v18;
  unint64_t v41 = v6;
  if ((int)v6 > (int)v18) {
    goto LABEL_51;
  }
LABEL_63:
  int v31 = &v41;
  if ((v18 & 0x100000000) != 0) {
    goto LABEL_52;
  }
LABEL_64:
  *((unsigned char *)v31 + 4) = 0;
  unint64_t v32 = *v31;
  unint64_t v40 = v19;
  unint64_t v41 = v13;
  if ((int)v13 > (int)v19) {
    goto LABEL_53;
  }
LABEL_65:
  int v33 = &v41;
  if ((v19 & 0x100000000) == 0) {
LABEL_66:
  }
    *((unsigned char *)v33 + 4) = 0;
LABEL_67:
  unint64_t v34 = 0;
  unint64_t v35 = *v33;
  if ((v32 & 0xFF00000000) != 0 && (v26 & 0xFF00000000) != 0)
  {
    uint64_t v36 = (int)v32 - (uint64_t)(int)v26;
    unint64_t v37 = (v36 + 1) | (unint64_t)&_mh_execute_header;
    if ((unint64_t)(v36 + 2147483649) >> 32) {
      unint64_t v37 = 0;
    }
    if (v36 == (int)v36) {
      unint64_t v34 = v37;
    }
    else {
      unint64_t v34 = 0;
    }
  }
  unint64_t v38 = 0;
  if ((v35 & 0xFF00000000) != 0 && (v30 & 0xFF00000000) != 0)
  {
    uint64_t v39 = (int)v35 - (uint64_t)(int)v30;
    unint64_t v38 = (v39 + 1) | (unint64_t)&_mh_execute_header;
    if ((unint64_t)(v39 + 2147483649) >> 32) {
      unint64_t v38 = 0;
    }
    if (v39 != (int)v39) {
      unint64_t v38 = 0;
    }
  }
  *a3 = v26;
  a3[1] = v30;
  a3[2] = v34;
  a3[3] = v38;
  return result;
}

uint64_t Madusa::BandModeDetector::_ProcessBand(Madusa::BandModeDetector *this, Madusa::BandModeDetector *a2, Madusa::ImageProperties *a3)
{
  if ((*v3 & 0x1F) != 0 || v3[2] > 0x3Fu)
  {
    int v4 = QuickCodec::mask;
    if (QuickCodec::mask != -70947757) {
LABEL_10:
    }
      QuickCodec::masint k = v4 + 1;
  }
  else
  {
    int v4 = QuickCodec::mask;
    if (v3[3] == 212 || QuickCodec::mask != -70947757) {
      goto LABEL_10;
    }
  }
  return Madusa::BandModeDetector::ProcessBand(this, a2);
}

uint64_t Madusa::BandModeDetector::_ProcessBand_Alt(Madusa::BandModeDetector *this, Madusa::BandModeDetector *a2, Madusa::ImageProperties *a3)
{
  int v4 = 0;
  int v5 = 0;
  if (QuickCodec::mask == -70947757) {
    int v6 = 8784594;
  }
  else {
    int v6 = 754238;
  }
  uint64_t v7 = 1;
  int v8 = 2299796;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v11 = v7;
        if (v8 <= 2299866) {
          break;
        }
        if (v8 == 2299867)
        {
          if ((*v4 & 0x1F) != 0
            || v4[2] > 0x3Fu
            || (uint64_t v7 = 1,
                int v8 = 754238,
                v4[3] != ((QuickCodec::mask ^ v5) / 0x2DB7B6)))
          {
            int v8 = 754292;
            uint64_t v7 = v11;
          }
        }
        else if (v8 == 3054017)
        {
          int v4 = (unsigned char *)v3;
          int v8 = 2299813;
        }
        else
        {
          BOOL v12 = v8 == 8784594;
          int v8 = 2299867;
          if (v12) {
            int v5 = -568766741;
          }
        }
      }
      if (v8 <= 2299795) {
        break;
      }
      unsigned int v9 = (QuickCodec::mask != -70947757) | v7;
      if (v8 == 2299813) {
        int v10 = v6;
      }
      else {
        int v10 = v8;
      }
      if (v8 == 2299813) {
        LODWORD(v11) = v9;
      }
      BOOL v12 = v8 == 2299796;
      if (v8 == 2299796) {
        int v8 = 754238;
      }
      else {
        int v8 = v10;
      }
      if (v12) {
        uint64_t v7 = 0;
      }
      else {
        uint64_t v7 = v11;
      }
    }
    if (v8 != 754238) {
      break;
    }
    int v8 = 754292;
    if ((v7 & 1) == 0) {
      int v8 = 3054017;
    }
  }
  if (v7) {
    ++QuickCodec::mask;
  }
  return Madusa::BandModeDetector::ProcessBand_Alt(this, a2);
}

uint64_t Madusa::BandModeDetector::ProcessBand_Alt(Madusa::BandModeDetector *this, Madusa::ImageProperties *a2)
{
  int v4 = (int *)((char *)this + 42992);
  uint64_t ImageParams = (Madusa::ImageProperties *)Madusa::DetectorBase::GetImageParams(this);
  Madusa::ImageProperties::GetBounds(ImageParams);
  uint64_t v7 = v6;
  Madusa::ImageProperties::CanonicalizeColorComponents((uint64_t)a2);
  int HasValidColorComponents = Madusa::ImageProperties::HasValidColorComponents(a2);
  int v9 = *v4;
  int v10 = (Madusa::ImageProperties *)Madusa::DetectorBase::GetImageParams(this);
  BOOL v11 = Madusa::BandModeDetector::AdjustImageDataForBandOrder(v9, a2, v10);
  Integerdouble OffsetBounds = Madusa::ImageProperties::GetIntegerOffsetBounds(a2);
  int v15 = IntegerOffsetBounds;
  uint64_t v16 = v13 + (uint64_t)(int)IntegerOffsetBounds;
  unint64_t v17 = ((v16 + 0x80000000) | IntegerOffsetBounds) >> 32;
  uint64_t result = 2;
  if (v17) {
    BOOL v19 = 0;
  }
  else {
    BOOL v19 = v14 == HIDWORD(v7);
  }
  if (v19 && v13 >= 1 && v4[1] <= v15 && (int)v16 <= (int)v7)
  {
    if ((v11 & HasValidColorComponents) != 0) {
      return 0;
    }
    else {
      return 2;
    }
  }
  return result;
}

uint64_t Madusa::BandModeDetector::GetBlockPosition(Madusa::BandModeDetector *this, uint64_t a2)
{
  if (*((unsigned char *)this + 43008)) {
    uint64_t v3 = *((unsigned int *)this + 10751);
  }
  else {
    uint64_t v3 = 0;
  }
  int v4 = (char *)this + 8;
  uint64_t func = (uint64_t (*)(char *, uint64_t, uint64_t))__find_func(0x2F7F1F1FA0C02020, -1044062006);

  return func(v4, v3, a2);
}

uint64_t Madusa::BandModeDetector::GetBlock(int8x8_t a1, uint64_t a2, int *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *a3;
  uint64_t v7 = a3[1];
  if ((unint64_t)(v6 + 0x7FFFFFFF) >> 32) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = (unint64_t)(v7 + 0x7FFFFFFF) >> 32 == 0;
  }
  if (v8 && (v16[0] = v6 - 1, v16[1] = v7 - 1, a5))
  {
    (*(void (**)(uint64_t, uint64_t, _DWORD *))(*(void *)a5 + 40))(a5, a4, v16);
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = 1;
  }
  a1.i8[4] = v5[3];
  a1.i32[0] = *v5 | 0xFFFFFFE0;
  *(int8x8_t *)v10.i8 = vand_s8(a1, (int8x8_t)0xFF000000FFLL);
  v10.i64[1] = v10.i64[0];
  float32x4_t v11 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v10, (int32x4_t)xmmword_10006EF60));
  v12.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_10006EF70, v11)).u32[0];
  v12.i32[1] = vmovn_s32(vcgtq_f32(v11, (float32x4_t)xmmword_10006EF70)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v12, 0xFuLL))) & ((v5[2] & 0xE0) == 32)) == 0
    && QuickCodec::mask == -70947757)
  {
    return v9;
  }
  QuickCodec::masint k = FunctionTable::ft[0] ^ 0x157E9386;
  uint64_t func = __find_func(0xDF9FDF1FC0E04070, 824451274);
  uint64_t v15 = 0;
  while (*(unsigned __int8 *)(func + v15) != ((QuickCodec::mask ^ 0xC12A2DF3) / 0x9D28AF)
       || *(unsigned __int8 *)(func + v15 + 1) != ((QuickCodec::mask ^ 0xFBC56C53) / 0x9D28AF)
       || *(unsigned __int8 *)(func + v15 + 2) != ((QuickCodec::mask ^ 0xDDCAB631) / 0x9D28AF)
       || *(unsigned __int8 *)(func + v15 + 3) != ((QuickCodec::mask ^ 0x79E0DCBFu) / 0x9D28AF))
  {
    v15 += 4;
    if (v15 == 2400) {
      goto LABEL_19;
    }
  }
  uint64_t vars0 = func + v15;
  long long vars8 = 0u;
LABEL_19:
  QuickCodec::mask += 16;
  return v9;
}

uint64_t Madusa::BandModeDetector::_GetBlock(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 32))();
}

uint64_t Madusa::BandModeDetector::Detect(Madusa::BandModeDetector *this)
{
  uint64_t v3 = (char *)this + 43004;
  uint64_t ImageParams = (Madusa::ImageProperties *)Madusa::DetectorBase::GetImageParams(this);
  int v5 = (Madusa::System *)sub_10002CC94(ImageParams);
  char v7 = v6;
  uint64_t DetectorPipeWorkingMemorySize = Madusa::System::GetDetectorPipeWorkingMemorySize(v5);
  BOOL v9 = v7 != 0;
  if (!v10) {
    BOOL v9 = 0;
  }
  float32x4_t v11 = (char *)v5 + DetectorPipeWorkingMemorySize;
  BOOL v12 = (Madusa::System *)((char *)v5 + DetectorPipeWorkingMemorySize) >= v5;
  char v13 = v9 && v12;
  if (v9 && v12) {
    uint64_t v14 = (uint64_t)v11;
  }
  else {
    uint64_t v14 = 0;
  }
  if (v3[4]) {
    uint64_t NumberOfBlocksOnRow = Madusa::BlockPicker::GetNumberOfBlocksOnRow((Madusa::BandModeDetector *)((char *)this + 8), *(_DWORD *)v3);
  }
  else {
    uint64_t NumberOfBlocksOnRow = 0;
  }
  uint64_t result = Madusa::DetectorBase::ProcessTwoPasses((uint64_t)this, v14, v13, NumberOfBlocksOnRow, 0);
  uint64_t v17 = result;
  v18.i8[4] = v1[3];
  v18.i32[0] = *v1 | 0xFFFFFFE0;
  *(int8x8_t *)v19.i8 = vand_s8(v18, (int8x8_t)0xFF000000FFLL);
  v19.i64[1] = v19.i64[0];
  float32x4_t v20 = vcvtq_f32_u32((uint32x4_t)vmulq_s32(v19, (int32x4_t)xmmword_10006EF80));
  v21.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_10006EF90, v20)).u32[0];
  v21.i32[1] = vmovn_s32(vcgtq_f32(v20, (float32x4_t)xmmword_10006EF90)).i32[1];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v21, 0xFuLL))) & ((v1[2] & 0xE0) == 32)) != 0
    || QuickCodec::mask != -70947757)
  {
    QuickCodec::masint k = FunctionTable::ft[0] ^ 0x157E9386;
    uint64_t func = (void (*)(void, uint64_t))__find_func(0xBFBF1F1FC0C00040, 1359274186);
    func(0, 104);
    return v17;
  }
  return result;
}

unint64_t sub_10002CC94(Madusa::ImageProperties *a1)
{
  int ResolutionBucket = Madusa::ImageProperties::GetResolutionBucket(a1);
  if (ResolutionBucket <= 350) {
    int v3 = ResolutionBucket;
  }
  else {
    int v3 = 300;
  }
  unsigned int v4 = 394;
  if (v3 <= 199)
  {
    switch(v3)
    {
      case 100:
        unsigned int v4 = 132;
        break;
      case 125:
        unsigned int v4 = 166;
        break;
      case 150:
        unsigned int v4 = 200;
        break;
    }
  }
  else if (v3 > 299)
  {
    if (v3 == 300)
    {
      unsigned int v4 = 394;
    }
    else if (v3 == 350)
    {
      unsigned int v4 = 462;
    }
  }
  else if (v3 == 200)
  {
    unsigned int v4 = 264;
  }
  else if (v3 == 250)
  {
    unsigned int v4 = 330;
  }
  src.data = 0;
  src.height = v4;
  src.width = v4;
  src.rowBytes = v4;
  dest.data = 0;
  *(int64x2_t *)&dest.height = vdupq_n_s64(0x82uLL);
  dest.rowBytes = 130;
  vImage_Error v5 = vImageScale_Planar8(&src, &dest, 0, 0x80u);
  uint64_t v6 = v5 & ~(v5 >> 63);
  Madusa::MemoryMaster::MemoryMaster((Madusa::MemoryMaster *)&src, 0);
  unint64_t v7 = sub_10002D8A0(a1);
  Madusa::MemoryMaster::~MemoryMaster(&src.data);
  if (v7 + v6 < v7) {
    return 0;
  }
  else {
    return v7 + v6;
  }
}

uint64_t Madusa::BandModeDetector::_Detect(Madusa::BandModeDetector *this, Madusa::BandModeDetector *a2)
{
  if ((*v2 & 0x1F) != 0 || v2[2] > 0x3Fu)
  {
    int v3 = QuickCodec::mask;
    if (QuickCodec::mask == -70947757) {
      return Madusa::BandModeDetector::Detect(this);
    }
LABEL_7:
    QuickCodec::masint k = v3 + 1;
    return Madusa::BandModeDetector::Detect(this);
  }
  int v5 = 767526 * v2[3];
  int v3 = QuickCodec::mask;
  if ((v5 ^ 0x9B2D778 | v5 & 0x9B2D778) - (v5 + 162715512) + ~(v5 ^ 0x9B2D778 | ~(v5 | 0x9B2D778)) == ~(~(~(~(v5 | 0x9824178) | v5 & 0x9824178) | 0x309600) | ~(~(v5 | 0x9824178) | v5 & 0x9824178) & 0x309600)
    || QuickCodec::mask != -70947757)
  {
    goto LABEL_7;
  }
  return Madusa::BandModeDetector::Detect(this);
}

uint64_t Madusa::BandModeDetector::GetRowOfBlocks(Madusa::BandModeDetector *this)
{
  int v1 = (char *)this + 43020;
  uint64_t result = Madusa::DetectorBase::GetResolutionBucket(this);
  if ((int)result <= 350) {
    int v3 = result;
  }
  else {
    int v3 = 300;
  }
  uint64_t v4 = 0x100000001;
  if (v3 <= 199)
  {
    switch(v3)
    {
      case 100:
        int v5 = (char *)&unk_10006EFA0;
        break;
      case 125:
        int v5 = (char *)&unk_10006EFB0;
        break;
      case 150:
        int v5 = (char *)&unk_10006EFC0;
        break;
      default:
        goto LABEL_21;
    }
  }
  else if (v3 > 299)
  {
    if (v3 == 300)
    {
      int v5 = (char *)&unk_10006EFF0;
    }
    else
    {
      if (v3 != 350) {
        goto LABEL_21;
      }
      int v5 = (char *)&unk_10006F000;
    }
  }
  else if (v3 == 200)
  {
    int v5 = (char *)&unk_10006EFD0;
  }
  else
  {
    if (v3 != 250) {
      goto LABEL_21;
    }
    int v5 = (char *)&unk_10006EFE0;
  }
  uint64_t v4 = *(void *)(v5 + 4);
LABEL_21:
  int v6 = 0;
  uint64_t v7 = (uint64_t)(int)v4 << 7;
  unint64_t v8 = v7 - 0x80000000;
  if (v7 != (int)v7) {
    LODWORD(v7) = 0;
  }
  uint64_t v9 = v4 >> 31;
  uint64_t v10 = (v4 >> 31) & 0xFFFFFFFELL;
  if (v9 == (int)v9 && v10 != 0 && v7 != 0 && v8 >= 0xFFFFFFFF00000000) {
    int v6 = (int)v7 / (int)v10;
  }
  *(_DWORD *)int v1 = v6;
  v1[4] = 1;
  if (v1[40])
  {
    int v14 = 1;
    int v15 = 1;
    if (v3 <= 199)
    {
      switch(v3)
      {
        case 100:
          int v14 = 1;
          int v15 = 1;
          break;
        case 125:
          int v14 = 5;
          int v15 = 4;
          break;
        case 150:
          int v14 = 3;
          int v15 = 2;
          break;
      }
    }
    else if (v3 > 299)
    {
      if (v3 == 300)
      {
        int v14 = 3;
        int v15 = 1;
      }
      else if (v3 == 350)
      {
        int v14 = 7;
        int v15 = 2;
      }
    }
    else if (v3 == 200)
    {
      int v14 = 2;
      int v15 = 1;
    }
    else if (v3 == 250)
    {
      int v14 = 5;
      int v15 = 2;
    }
    uint64_t v16 = (int)llroundf((float)v14 / (float)v15) + (uint64_t)v6;
    if (v16 == (int)v16) {
      *(_DWORD *)int v1 = v16;
    }
    v1[4] = (unint64_t)(v16 + 0x80000000) >> 32 == 0;
    v1[40] = 0;
  }
  return result;
}

uint64_t Madusa::BandModeDetector::_GetRowOfBlocks(Madusa::BandModeDetector *this, Madusa::BandModeDetector *a2)
{
  if ((*v2 & 0x1F) != 0 || v2[2] > 0x3Fu)
  {
    int v3 = QuickCodec::mask;
    if (QuickCodec::mask == -70947757) {
      return Madusa::BandModeDetector::GetRowOfBlocks(this);
    }
LABEL_7:
    QuickCodec::masint k = v3 + 1;
    return Madusa::BandModeDetector::GetRowOfBlocks(this);
  }
  int v5 = 594942 * v2[3];
  int v3 = QuickCodec::mask;
  if ((v5 ^ 0x7848E58 | v5 & 0x7848E58) - (v5 + 126127704) + ~(v5 ^ 0x7848E58 | ~(v5 | 0x7848E58)) == ~(~(~(~(v5 | 0x7800A18) | v5 & 0x7800A18) | 0x48440) | ~(~(v5 | 0x7800A18) | v5 & 0x7800A18) & 0x48440)
    || QuickCodec::mask != -70947757)
  {
    goto LABEL_7;
  }
  return Madusa::BandModeDetector::GetRowOfBlocks(this);
}

BOOL Madusa::BandModeDetector::ShouldRunDetectionOnBlock(uint64_t a1, uint64_t a2)
{
  long long v2 = (unsigned int *)(a1 + 43004);
  BOOL result = 0;
  if (*(unsigned char *)(a1 + 43008))
  {
    uint64_t v4 = a1 + 8;
    uint64_t func = (uint64_t (*)(uint64_t, void, uint64_t))__find_func(0xCF1F3F9F406060C0, 564445258);
    if (func(v4, *v2, a2)) {
      return 1;
    }
  }
  return result;
}

uint64_t Madusa::BandModeDetector::CreateImagePipe(Madusa::BandModeDetector *this, Madusa::MemoryMaster *a2, Madusa::SessionCallbacks *a3)
{
  uint64_t v4 = *((void *)this + 5384);
  if (!v4) {
    return 0;
  }
  uint64_t v6 = (*(uint64_t (**)(uint64_t, Madusa::MemoryMaster *, Madusa::SessionCallbacks *))(*(void *)v4 + 48))(v4, a2, a3);
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t ImageParams = (Madusa::ImageProperties *)Madusa::DetectorBase::GetImageParams(this);
  sub_10002E324(ImageParams, (uint64_t)a2, v7);
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = Madusa::DetectorBase::GetImageParams(this);
    (*(void (**)(uint64_t, uint64_t))(*(void *)v10 + 16))(v10, v11);
  }
  return v10;
}

unint64_t sub_10002D710(Madusa::ImageProperties *a1)
{
  Madusa::ImageProperties::GetSafeBounds(a1, &v13);
  if (Madusa::ImageProperties::ShouldDownsample(a1))
  {
    uint64_t v11 = 0x100000001;
    uint64_t v12 = 0x100000001;
    Madusa::ImageProperties::GetDownsampleRatios(a1, (Madusa::Ratio *)&v12, (Madusa::Ratio *)&v11);
    sub_10002327C(v13.i32, (int *)&v12, (int *)&v11, v8);
    int v2 = v9;
    if (!v10) {
      return 0;
    }
  }
  else
  {
    int v2 = v14;
    if (!v15) {
      return 0;
    }
  }
  if (v2 >= 0) {
    unsigned int v3 = v2;
  }
  else {
    unsigned int v3 = -v2;
  }
  int ResolutionBucket = Madusa::ImageProperties::GetResolutionBucket(a1);
  if (ResolutionBucket <= 350) {
    int v5 = ResolutionBucket;
  }
  else {
    int v5 = 300;
  }
  unsigned int v6 = 394;
  if (v5 <= 199)
  {
    switch(v5)
    {
      case 100:
        unsigned int v6 = 132;
        break;
      case 125:
        unsigned int v6 = 166;
        break;
      case 150:
        unsigned int v6 = 200;
        break;
    }
  }
  else if (v5 > 299)
  {
    if (v5 == 300)
    {
      unsigned int v6 = 394;
    }
    else if (v5 == 350)
    {
      unsigned int v6 = 462;
    }
  }
  else if (v5 == 200)
  {
    unsigned int v6 = 264;
  }
  else if (v5 == 250)
  {
    unsigned int v6 = 330;
  }
  return v6 * (unint64_t)v3;
}

uint64_t sub_10002D8A0(Madusa::ImageProperties *a1)
{
  int v2 = *(_DWORD *)Madusa::ImageProperties::GetColorModel(a1);
  int DataType = (_DWORD *)Madusa::ImageProperties::GetDataType(a1);
  switch(v2)
  {
    case 1:
    case 5:
    case 6:
    case 7:
      char IsInverted = Madusa::ImageProperties::IsInverted(a1);
      int v5 = *(_DWORD *)Madusa::ImageProperties::GetBitsPerPixelPerColor(a1);
      if (IsInverted)
      {
        if (v5 == 8)
        {
          uint64_t result = 184;
        }
        else
        {
          if (*(_DWORD *)Madusa::ImageProperties::GetBitsPerPixelPerColor(a1) != 16) {
            goto LABEL_40;
          }
          uint64_t result = 184;
        }
      }
      else if (v5 == 8)
      {
        uint64_t result = 184;
      }
      else
      {
        if (*(_DWORD *)Madusa::ImageProperties::GetBitsPerPixelPerColor(a1) != 16) {
          goto LABEL_40;
        }
        uint64_t result = 184;
      }
      break;
    case 2:
      if (*DataType == 1)
      {
        if (*(_DWORD *)Madusa::ImageProperties::GetBitsPerPixelPerColor(a1) == 16)
        {
          uint64_t result = 184;
        }
        else
        {
          if (*(_DWORD *)Madusa::ImageProperties::GetBitsPerPixelPerColor(a1) != 32) {
            goto LABEL_40;
          }
          uint64_t result = 184;
        }
      }
      else if (*DataType == 2)
      {
        if (*(_DWORD *)Madusa::ImageProperties::GetBitsPerPixelPerColor(a1) == 16)
        {
          uint64_t result = 184;
        }
        else
        {
          if (*(_DWORD *)Madusa::ImageProperties::GetBitsPerPixelPerColor(a1) != 32) {
            goto LABEL_40;
          }
          uint64_t result = 184;
        }
      }
      else
      {
        uint64_t v10 = 0x100000001;
        uint64_t v11 = 0x100000001;
        Madusa::ImageProperties::GetDownsampleRatios(a1, (Madusa::Ratio *)&v11, (Madusa::Ratio *)&v10);
        int v7 = HIDWORD(v10);
        int v8 = HIDWORD(v11);
        int v9 = *(_DWORD *)Madusa::ImageProperties::GetBitsPerPixelPerColor(a1);
        if (v7 == 1 && v8 == 1)
        {
          if (v9 == 8)
          {
            uint64_t result = 184;
          }
          else
          {
            if (*(_DWORD *)Madusa::ImageProperties::GetBitsPerPixelPerColor(a1) != 16) {
              goto LABEL_40;
            }
            uint64_t result = 184;
          }
        }
        else if (v9 == 8)
        {
          uint64_t result = 184;
        }
        else
        {
          if (*(_DWORD *)Madusa::ImageProperties::GetBitsPerPixelPerColor(a1) != 16) {
            goto LABEL_40;
          }
          uint64_t result = 184;
        }
      }
      break;
    case 4:
      if (Madusa::ImageProperties::IsInverted(a1)) {
        goto LABEL_16;
      }
      if ((Madusa::ImageProperties::IsInverted(a1) & 1) != 0
        || *(_DWORD *)Madusa::ImageProperties::GetBitsPerPixelPerColor(a1) != 8)
      {
        goto LABEL_40;
      }
      uint64_t result = 184;
      break;
    case 9:
      if (Madusa::ImageProperties::IsInverted(a1)) {
        goto LABEL_40;
      }
LABEL_16:
      if (*(_DWORD *)Madusa::ImageProperties::GetBitsPerPixelPerColor(a1) == 8)
      {
        uint64_t result = 184;
      }
      else
      {
        if (*(_DWORD *)Madusa::ImageProperties::GetBitsPerPixelPerColor(a1) != 16) {
          goto LABEL_40;
        }
        uint64_t result = 184;
      }
      break;
    default:
LABEL_40:
      uint64_t result = 16;
      break;
  }
  return result;
}

unint64_t sub_10002DC24(uint64_t *a1, uint64_t *a2)
{
  if (*((unsigned char *)a1 + 8)) {
    BOOL v2 = *((unsigned char *)a2 + 8) == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2) {
    return 0;
  }
  uint64_t v4 = *a1;
  uint64_t v5 = *a2;
  unint64_t v6 = HIDWORD(*a1);
  unint64_t v7 = HIDWORD(*a2);
  if (!v6)
  {
    if (v7)
    {
      unint64_t result = v7 * v4;
      if (v7 * v4) {
        goto LABEL_10;
      }
    }
    return v5 * (unint64_t)v4;
  }
  if (v7) {
    return 0;
  }
  unint64_t result = v5 * v6;
  if (!(v5 * v6)) {
    return v5 * (unint64_t)v4;
  }
LABEL_10:
  if (!HIDWORD(result)) {
    return (result << 32) + v5 * (unint64_t)v4;
  }
  return result;
}

uint64_t sub_10002DCAC(uint64_t a1, void *a2)
{
  *(void *)(a1 + 40) = 0;
  *(unsigned char *)(a1 + 48) = 1;
  *(_DWORD *)(a1 + 56) = 0;
  *(unsigned char *)(a1 + 60) = 1;
  *(unsigned char *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(unsigned char *)(a1 + 80) = 1;
  *(void *)a1 = off_1000709F8;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(void *)(a1 + 88) = 0;
  *(unsigned char *)(a1 + 96) = 1;
  *(void *)(a1 + 104) = 0;
  *(unsigned char *)(a1 + 112) = 1;
  uint64_t v3 = *(void *)(a1 + 24);
  if (v3)
  {
    Madusa::MemoryMaster::DeAllocateBuffer(v3, a2);
    *(void *)(a1 + 24) = 0;
    *(unsigned char *)(a1 + 32) = 1;
  }
  return a1;
}

void sub_10002DD34(uint64_t a1, void *a2)
{
  *(void *)(a1 + 40) = 0;
  *(unsigned char *)(a1 + 48) = 1;
  *(_DWORD *)(a1 + 56) = 0;
  *(unsigned char *)(a1 + 60) = 1;
  *(unsigned char *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(unsigned char *)(a1 + 80) = 1;
  *(void *)a1 = off_1000709F8;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(void *)(a1 + 88) = 0;
  *(unsigned char *)(a1 + 96) = 1;
  *(void *)(a1 + 104) = 0;
  *(unsigned char *)(a1 + 112) = 1;
  uint64_t v3 = *(void *)(a1 + 24);
  if (v3)
  {
    Madusa::MemoryMaster::DeAllocateBuffer(v3, a2);
    *(void *)(a1 + 24) = 0;
    *(unsigned char *)(a1 + 32) = 1;
  }

  operator delete();
}

unint64_t sub_10002DDDC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, int a5)
{
  unint64_t result = *(void *)(a1 + 24);
  if (result)
  {
    *(void *)(a1 + 40) = 0;
    *(unsigned char *)(a1 + 48) = 1;
    *(_DWORD *)(a1 + 56) = 0;
    *(unsigned char *)(a1 + 60) = 1;
    *(unsigned char *)(a1 + 64) = 0;
    *(void *)(a1 + 72) = 0;
    *(unsigned char *)(a1 + 80) = 1;
    *(void *)(a1 + 8) = 0;
    *(unsigned char *)(a1 + 16) = 1;
    *(void *)(a1 + 88) = 0;
    *(unsigned char *)(a1 + 96) = 1;
    *(void *)(a1 + 104) = 0;
    *(unsigned char *)(a1 + 112) = 1;
    unint64_t result = Madusa::MemoryMaster::DeAllocateBuffer(result, a2);
    *(void *)(a1 + 24) = 0;
    unint64_t v7 = (unsigned char *)(a1 + 32);
LABEL_12:
    *unint64_t v7 = 1;
    return result;
  }
  if (a5 < 0)
  {
    *(void *)(a1 + 40) = 0;
LABEL_11:
    *(unsigned char *)(a1 + 48) = 1;
    *(_DWORD *)(a1 + 56) = 0;
    *(unsigned char *)(a1 + 60) = 1;
    *(unsigned char *)(a1 + 64) = 0;
    *(void *)(a1 + 72) = 0;
    *(unsigned char *)(a1 + 80) = 1;
    *(void *)(a1 + 8) = 0;
    *(unsigned char *)(a1 + 16) = 1;
    *(void *)(a1 + 88) = 0;
    *(unsigned char *)(a1 + 96) = 1;
    unint64_t v7 = (unsigned char *)(a1 + 112);
    *(void *)(a1 + 104) = 0;
    goto LABEL_12;
  }
  unint64_t result = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 120) + 16))(*(void *)(a1 + 120), a4);
  *(unsigned char *)(a1 + 32) = 1;
  unint64_t v7 = (unsigned char *)(a1 + 32);
  *(void *)(a1 + 24) = result;
  if (!result)
  {
    *(void *)(a1 + 40) = 0;
    goto LABEL_11;
  }
  *(void *)(a1 + 40) = a4;
  *(unsigned char *)(a1 + 48) = 1;
  *(_DWORD *)(a1 + 56) = a5;
  *(unsigned char *)(a1 + 60) = 1;
  *(void *)(a1 + 72) = a4;
  *(unsigned char *)(a1 + 80) = 1;
  *(void *)(a1 + 88) = result;
  *(unsigned char *)(a1 + 96) = 1;
  uint64_t v11 = result + a4;
  if (result + a4 < result) {
    uint64_t v11 = 0;
  }
  *(void *)(a1 + 8) = v11;
  *(unsigned char *)(a1 + 16) = result + a4 >= result;
  if (result + a4 < result)
  {
    *(void *)(a1 + 40) = 0;
    *(_DWORD *)(a1 + 56) = 0;
    *(unsigned char *)(a1 + 64) = 0;
    *(void *)(a1 + 72) = 0;
    *(void *)(a1 + 8) = 0;
    *(unsigned char *)(a1 + 16) = 1;
    *(void *)(a1 + 88) = 0;
    *(void *)(a1 + 104) = 0;
    *(unsigned char *)(a1 + 112) = 1;
    unint64_t result = Madusa::MemoryMaster::DeAllocateBuffer(result, v10);
    *(void *)(a1 + 24) = 0;
    goto LABEL_12;
  }
  return result;
}

char *sub_10002DF58(char *result)
{
  int v1 = result;
  if (!result[64])
  {
    result[64] = 1;
    *((void *)result + 13) = *((void *)result + 11);
    result[112] = result[96];
    return result;
  }
  if (*((int *)result + 32) <= 350) {
    int v2 = *((_DWORD *)result + 32);
  }
  else {
    int v2 = 300;
  }
  unint64_t v3 = 0x100000001;
  if (v2 <= 199)
  {
    switch(v2)
    {
      case 100:
        uint64_t v4 = (char *)&unk_10006EFA0;
        break;
      case 125:
        uint64_t v4 = (char *)&unk_10006EFB0;
        break;
      case 150:
        uint64_t v4 = (char *)&unk_10006EFC0;
        break;
      default:
        goto LABEL_24;
    }
  }
  else if (v2 > 299)
  {
    if (v2 == 300)
    {
      uint64_t v4 = (char *)&unk_10006EFF0;
    }
    else
    {
      if (v2 != 350) {
        goto LABEL_24;
      }
      uint64_t v4 = (char *)&unk_10006F000;
    }
  }
  else if (v2 == 200)
  {
    uint64_t v4 = (char *)&unk_10006EFD0;
  }
  else
  {
    if (v2 != 250) {
      goto LABEL_24;
    }
    uint64_t v4 = (char *)&unk_10006EFE0;
  }
  unint64_t v3 = *(void *)(v4 + 4);
LABEL_24:
  unint64_t v5 = HIDWORD(v3);
  uint64_t v6 = v3 << 32;
  if (v5) {
    BOOL v7 = (unint64_t)((v6 >> 31) + 0x80000000) >> 32 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7)
  {
    unsigned int v8 = 0;
    int v9 = *((_DWORD *)result + 14);
    if (v9 >= 0) {
      unsigned int v10 = *((_DWORD *)result + 14);
    }
    else {
      unsigned int v10 = -v9;
    }
LABEL_34:
    unint64_t v12 = v8 * (unint64_t)v10;
    BOOL v13 = 1;
    goto LABEL_35;
  }
  int v11 = llroundf((float)(int)((unint64_t)v6 >> 31) / (float)(int)v5);
  unsigned int v8 = v11;
  unsigned int v10 = *((_DWORD *)result + 14);
  if ((v10 & 0x80000000) != 0) {
    unsigned int v10 = -v10;
  }
  if ((v11 & 0x80000000) == 0) {
    goto LABEL_34;
  }
  unint64_t v12 = (v11 >> 31) * (unint64_t)v10;
  if (!v12) {
    goto LABEL_34;
  }
  if (HIDWORD(v12))
  {
    BOOL v13 = 0;
  }
  else
  {
    unint64_t v25 = v8 * (unint64_t)v10;
    unint64_t v12 = (v12 << 32) + v25;
    BOOL v13 = v12 >= v25;
  }
LABEL_35:
  size_t v14 = 0;
  BOOL v15 = 0;
  if (result[96] && result[112])
  {
    unint64_t v16 = *((void *)result + 13);
    unint64_t v17 = *((void *)result + 11);
    if (v17 >= v16) {
      size_t v14 = v17 - v16;
    }
    else {
      size_t v14 = 0;
    }
    if (v16 <= v17)
    {
      if (!v13)
      {
        BOOL v15 = 0;
        goto LABEL_62;
      }
      BOOL v15 = v14 + v12 >= v14;
      if (v14 + v12 > v14) {
        v14 += v12;
      }
      goto LABEL_43;
    }
    BOOL v15 = 0;
  }
  if (!result[112])
  {
LABEL_62:
    BOOL v21 = 0;
    int32x4_t v19 = 0;
    goto LABEL_63;
  }
LABEL_43:
  if (!v13) {
    goto LABEL_62;
  }
  unint64_t v18 = *((void *)result + 13);
  if (v18 >= v12) {
    int32x4_t v19 = (char *)(v18 - v12);
  }
  else {
    int32x4_t v19 = 0;
  }
  BOOL v20 = v12 > v18;
  BOOL v21 = v12 <= v18;
  if (!v20 && v15)
  {
    unint64_t v23 = &v19[v14];
    BOOL v24 = &v19[v14] >= v19;
    if (&v19[v14] < v19) {
      unint64_t v23 = 0;
    }
    BOOL v15 = 1;
    BOOL v21 = 1;
    goto LABEL_64;
  }
LABEL_63:
  unint64_t v23 = 0;
  BOOL v24 = 0;
LABEL_64:
  unint64_t result = (char *)*((void *)result + 3);
  if (result <= v19 && v21 && v1[32] && v24 && v1[16] && v15 && (unint64_t)v23 <= *((void *)v1 + 1))
  {
    unint64_t result = (char *)memmove(result, v19, v14);
    BOOL v26 = 0;
    size_t v27 = 0;
    if (v1[32])
    {
      size_t v28 = *((void *)v1 + 3);
      size_t v27 = v14 + v28;
      BOOL v26 = v14 + v28 >= v28;
      if (!v26) {
        size_t v27 = 0;
      }
    }
    *((void *)v1 + 13) = v27;
    v1[112] = v26;
    *((void *)v1 + 11) = v27;
    v1[96] = v26;
    *((void *)v1 + 9) = v14;
    v1[80] = v15;
  }
  return result;
}

double sub_10002E220@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, unint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  if (!*(unsigned char *)(a1 + 80) || *(void *)(a1 + 72) < a2) {
    goto LABEL_14;
  }
  uint64_t v4 = *(void *)(a1 + 88);
  *a3 = a2;
  if (!*(unsigned char *)(a1 + 96))
  {
    unint64_t v11 = *(void *)(a1 + 72);
    BOOL v8 = v11 >= a2;
    unint64_t v12 = v11 - a2;
    if (v8)
    {
      *(void *)(a1 + 72) = v12;
      char v13 = 1;
      goto LABEL_13;
    }
LABEL_11:
    char v13 = 0;
LABEL_13:
    *(unsigned char *)(a1 + 80) = v13;
    goto LABEL_14;
  }
  unint64_t v5 = *(void *)(a1 + 88);
  unint64_t v6 = v5 + a2;
  if (v5 + a2 >= v5) {
    *(void *)(a1 + 88) = v6;
  }
  *(unsigned char *)(a1 + 96) = v6 >= v5;
  unint64_t v7 = *(void *)(a1 + 72);
  BOOL v8 = v7 >= a2;
  unint64_t v9 = v7 - a2;
  if (!v8) {
    goto LABEL_11;
  }
  *(void *)(a1 + 72) = v9;
  *(unsigned char *)(a1 + 80) = 1;
  if (v6 >= v5)
  {
    *(void *)a4 = v4;
    double result = 0.0;
    *(_OWORD *)(a4 + 8) = 0u;
    *(_OWORD *)(a4 + 24) = 0u;
    return result;
  }
LABEL_14:
  *a3 = 0;
  *(void *)a4 = 0;
  double result = 0.0;
  *(_OWORD *)(a4 + 8) = 0u;
  *(_OWORD *)(a4 + 24) = 0u;
  return result;
}

uint64_t sub_10002E2D4(uint64_t a1)
{
  return *(void *)(a1 + 24);
}

uint64_t sub_10002E2DC(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 60)) {
    return *(unsigned int *)(a1 + 56);
  }
  else {
    return 0;
  }
}

uint64_t sub_10002E2F4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    return *(void *)(a1 + 40);
  }
  else {
    return 0;
  }
}

uint64_t sub_10002E30C(uint64_t a1)
{
  return *(void *)(a1 + 24);
}

uint64_t sub_10002E318(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

void sub_10002E324(Madusa::ImageProperties *a1, uint64_t a2, uint64_t a3)
{
  int v6 = *(_DWORD *)Madusa::ImageProperties::GetColorModel(a1);
  int DataType = (_DWORD *)Madusa::ImageProperties::GetDataType(a1);
  switch(v6)
  {
    case 1:
    case 5:
    case 6:
    case 7:
      char IsInverted = Madusa::ImageProperties::IsInverted(a1);
      int v9 = *(_DWORD *)Madusa::ImageProperties::GetBitsPerPixelPerColor(a1);
      if (IsInverted)
      {
        if (v9 == 8)
        {
          uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 16))(a2, 184);
          if (v10)
          {
            unint64_t v11 = off_100071100;
            goto LABEL_36;
          }
        }
        else
        {
          if (*(_DWORD *)Madusa::ImageProperties::GetBitsPerPixelPerColor(a1) != 16) {
            goto LABEL_56;
          }
          uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 16))(a2, 184);
          if (v10)
          {
            unint64_t v11 = off_100071188;
            goto LABEL_36;
          }
        }
      }
      else if (v9 == 8)
      {
        uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 16))(a2, 184);
        if (v10)
        {
          unint64_t v11 = off_100070FF0;
          goto LABEL_36;
        }
      }
      else
      {
        if (*(_DWORD *)Madusa::ImageProperties::GetBitsPerPixelPerColor(a1) != 16) {
          goto LABEL_56;
        }
        uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 16))(a2, 184);
        if (v10)
        {
          unint64_t v11 = off_100071078;
          goto LABEL_36;
        }
      }
      return;
    case 2:
      if (*DataType == 1)
      {
        if (*(_DWORD *)Madusa::ImageProperties::GetBitsPerPixelPerColor(a1) == 16)
        {
          uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 16))(a2, 184);
          if (v10)
          {
            unint64_t v11 = off_100070CC0;
            goto LABEL_36;
          }
        }
        else
        {
          if (*(_DWORD *)Madusa::ImageProperties::GetBitsPerPixelPerColor(a1) != 32) {
            goto LABEL_56;
          }
          sub_10002EA88(a3, a2);
        }
      }
      else if (*DataType == 2)
      {
        if (*(_DWORD *)Madusa::ImageProperties::GetBitsPerPixelPerColor(a1) == 16)
        {
          uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 16))(a2, 184);
          if (v10)
          {
            unint64_t v11 = off_100070A58;
            goto LABEL_36;
          }
        }
        else
        {
          if (*(_DWORD *)Madusa::ImageProperties::GetBitsPerPixelPerColor(a1) != 32) {
            goto LABEL_56;
          }
          sub_10002E9A4(a3, a2);
        }
      }
      else
      {
        uint64_t v16 = 0x100000001;
        uint64_t v17 = 0x100000001;
        Madusa::ImageProperties::GetDownsampleRatios(a1, (Madusa::Ratio *)&v17, (Madusa::Ratio *)&v16);
        int v12 = HIDWORD(v16);
        int v13 = HIDWORD(v17);
        int v14 = *(_DWORD *)Madusa::ImageProperties::GetBitsPerPixelPerColor(a1);
        if (v12 == 1 && v13 == 1)
        {
          if (v14 == 8)
          {
            sub_10002EB6C(a3, a2);
          }
          else
          {
            if (*(_DWORD *)Madusa::ImageProperties::GetBitsPerPixelPerColor(a1) != 16) {
              goto LABEL_56;
            }
            sub_10002EC50(a3, a2);
          }
        }
        else if (v14 == 8)
        {
          sub_10002ED34(a3, a2);
        }
        else
        {
          if (*(_DWORD *)Madusa::ImageProperties::GetBitsPerPixelPerColor(a1) != 16) {
            goto LABEL_56;
          }
          sub_10002EE18(a3, a2);
        }
      }
      return;
    case 4:
      if (Madusa::ImageProperties::IsInverted(a1)) {
        goto LABEL_21;
      }
      if ((Madusa::ImageProperties::IsInverted(a1) & 1) != 0
        || *(_DWORD *)Madusa::ImageProperties::GetBitsPerPixelPerColor(a1) != 8)
      {
        goto LABEL_56;
      }
      sub_10002EEFC(a3, a2);
      return;
    case 9:
      if (Madusa::ImageProperties::IsInverted(a1)) {
        goto LABEL_56;
      }
LABEL_21:
      if (*(_DWORD *)Madusa::ImageProperties::GetBitsPerPixelPerColor(a1) == 8)
      {
        uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 16))(a2, 184);
        if (!v10) {
          return;
        }
        unint64_t v11 = off_100071210;
        goto LABEL_36;
      }
      if (*(_DWORD *)Madusa::ImageProperties::GetBitsPerPixelPerColor(a1) != 16) {
        goto LABEL_56;
      }
      uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 16))(a2, 184);
      if (v10)
      {
        unint64_t v11 = off_100071298;
LABEL_36:
        *(void *)uint64_t v10 = v11;
        *(void *)(v10 + 8) = a3;
        *(void *)(v10 + 56) = 0;
        *(unsigned char *)(v10 + 64) = 1;
        *(_DWORD *)(v10 + 72) = 0;
        *(unsigned char *)(v10 + 76) = 1;
        *(void *)(v10 + 40) = 0;
        *(unsigned char *)(v10 + 48) = 1;
        *(void *)(v10 + 16) = off_100070AA8;
        *(void *)(v10 + 24) = 0;
        *(unsigned char *)(v10 + 32) = 1;
        *(_OWORD *)(v10 + 80) = 0u;
        *(_OWORD *)(v10 + 96) = 0u;
        *(_OWORD *)(v10 + 112) = 0u;
        *(_OWORD *)(v10 + 124) = 0u;
        *(unsigned char *)(v10 + 140) = 1;
        *(_DWORD *)(v10 + 144) = 0;
        *(unsigned char *)(v10 + 148) = 1;
        *(_DWORD *)(v10 + 152) = 0;
        *(unsigned char *)(v10 + 156) = 1;
        *(_DWORD *)(v10 + 160) = 0;
        *(unsigned char *)(v10 + 164) = 1;
        *(_DWORD *)(v10 + 168) = 0;
        *(void *)(v10 + 176) = a2;
      }
      return;
    default:
LABEL_56:
      BOOL v15 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 16))(a2, 16);
      if (v15)
      {
        *BOOL v15 = off_1000713A8;
        v15[1] = a3;
      }
      return;
  }
}

double sub_10002E9A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 16))(a2, 184);
  if (v4)
  {
    *(void *)uint64_t v4 = off_100070BD8;
    *(void *)(v4 + 8) = a1;
    *(void *)(v4 + 56) = 0;
    *(unsigned char *)(v4 + 64) = 1;
    *(_DWORD *)(v4 + 72) = 0;
    *(unsigned char *)(v4 + 76) = 1;
    *(void *)(v4 + 40) = 0;
    *(unsigned char *)(v4 + 48) = 1;
    *(void *)(v4 + 16) = off_100070AA8;
    *(void *)(v4 + 24) = 0;
    *(unsigned char *)(v4 + 32) = 1;
    double result = 0.0;
    *(_OWORD *)(v4 + 80) = 0u;
    *(_OWORD *)(v4 + 96) = 0u;
    *(_OWORD *)(v4 + 112) = 0u;
    *(_OWORD *)(v4 + 124) = 0u;
    *(unsigned char *)(v4 + 140) = 1;
    *(_DWORD *)(v4 + 144) = 0;
    *(unsigned char *)(v4 + 148) = 1;
    *(_DWORD *)(v4 + 152) = 0;
    *(unsigned char *)(v4 + 156) = 1;
    *(_DWORD *)(v4 + 160) = 0;
    *(unsigned char *)(v4 + 164) = 1;
    *(_DWORD *)(v4 + 168) = 0;
    *(void *)(v4 + 176) = a2;
  }
  return result;
}

double sub_10002EA88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 16))(a2, 184);
  if (v4)
  {
    *(void *)uint64_t v4 = off_100070D48;
    *(void *)(v4 + 8) = a1;
    *(void *)(v4 + 56) = 0;
    *(unsigned char *)(v4 + 64) = 1;
    *(_DWORD *)(v4 + 72) = 0;
    *(unsigned char *)(v4 + 76) = 1;
    *(void *)(v4 + 40) = 0;
    *(unsigned char *)(v4 + 48) = 1;
    *(void *)(v4 + 16) = off_100070AA8;
    *(void *)(v4 + 24) = 0;
    *(unsigned char *)(v4 + 32) = 1;
    double result = 0.0;
    *(_OWORD *)(v4 + 80) = 0u;
    *(_OWORD *)(v4 + 96) = 0u;
    *(_OWORD *)(v4 + 112) = 0u;
    *(_OWORD *)(v4 + 124) = 0u;
    *(unsigned char *)(v4 + 140) = 1;
    *(_DWORD *)(v4 + 144) = 0;
    *(unsigned char *)(v4 + 148) = 1;
    *(_DWORD *)(v4 + 152) = 0;
    *(unsigned char *)(v4 + 156) = 1;
    *(_DWORD *)(v4 + 160) = 0;
    *(unsigned char *)(v4 + 164) = 1;
    *(_DWORD *)(v4 + 168) = 0;
    *(void *)(v4 + 176) = a2;
  }
  return result;
}

double sub_10002EB6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 16))(a2, 184);
  if (v4)
  {
    *(void *)uint64_t v4 = off_100070DD0;
    *(void *)(v4 + 8) = a1;
    *(void *)(v4 + 56) = 0;
    *(unsigned char *)(v4 + 64) = 1;
    *(_DWORD *)(v4 + 72) = 0;
    *(unsigned char *)(v4 + 76) = 1;
    *(void *)(v4 + 40) = 0;
    *(unsigned char *)(v4 + 48) = 1;
    *(void *)(v4 + 16) = off_100070AA8;
    *(void *)(v4 + 24) = 0;
    *(unsigned char *)(v4 + 32) = 1;
    double result = 0.0;
    *(_OWORD *)(v4 + 80) = 0u;
    *(_OWORD *)(v4 + 96) = 0u;
    *(_OWORD *)(v4 + 112) = 0u;
    *(_OWORD *)(v4 + 124) = 0u;
    *(unsigned char *)(v4 + 140) = 1;
    *(_DWORD *)(v4 + 144) = 0;
    *(unsigned char *)(v4 + 148) = 1;
    *(_DWORD *)(v4 + 152) = 0;
    *(unsigned char *)(v4 + 156) = 1;
    *(_DWORD *)(v4 + 160) = 0;
    *(unsigned char *)(v4 + 164) = 1;
    *(_DWORD *)(v4 + 168) = 0;
    *(void *)(v4 + 176) = a2;
  }
  return result;
}

double sub_10002EC50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 16))(a2, 184);
  if (v4)
  {
    *(void *)uint64_t v4 = off_100070E58;
    *(void *)(v4 + 8) = a1;
    *(void *)(v4 + 56) = 0;
    *(unsigned char *)(v4 + 64) = 1;
    *(_DWORD *)(v4 + 72) = 0;
    *(unsigned char *)(v4 + 76) = 1;
    *(void *)(v4 + 40) = 0;
    *(unsigned char *)(v4 + 48) = 1;
    *(void *)(v4 + 16) = off_100070AA8;
    *(void *)(v4 + 24) = 0;
    *(unsigned char *)(v4 + 32) = 1;
    double result = 0.0;
    *(_OWORD *)(v4 + 80) = 0u;
    *(_OWORD *)(v4 + 96) = 0u;
    *(_OWORD *)(v4 + 112) = 0u;
    *(_OWORD *)(v4 + 124) = 0u;
    *(unsigned char *)(v4 + 140) = 1;
    *(_DWORD *)(v4 + 144) = 0;
    *(unsigned char *)(v4 + 148) = 1;
    *(_DWORD *)(v4 + 152) = 0;
    *(unsigned char *)(v4 + 156) = 1;
    *(_DWORD *)(v4 + 160) = 0;
    *(unsigned char *)(v4 + 164) = 1;
    *(_DWORD *)(v4 + 168) = 0;
    *(void *)(v4 + 176) = a2;
  }
  return result;
}

double sub_10002ED34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 16))(a2, 184);
  if (v4)
  {
    *(void *)uint64_t v4 = off_100070EE0;
    *(void *)(v4 + 8) = a1;
    *(void *)(v4 + 56) = 0;
    *(unsigned char *)(v4 + 64) = 1;
    *(_DWORD *)(v4 + 72) = 0;
    *(unsigned char *)(v4 + 76) = 1;
    *(void *)(v4 + 40) = 0;
    *(unsigned char *)(v4 + 48) = 1;
    *(void *)(v4 + 16) = off_100070AA8;
    *(void *)(v4 + 24) = 0;
    *(unsigned char *)(v4 + 32) = 1;
    double result = 0.0;
    *(_OWORD *)(v4 + 80) = 0u;
    *(_OWORD *)(v4 + 96) = 0u;
    *(_OWORD *)(v4 + 112) = 0u;
    *(_OWORD *)(v4 + 124) = 0u;
    *(unsigned char *)(v4 + 140) = 1;
    *(_DWORD *)(v4 + 144) = 0;
    *(unsigned char *)(v4 + 148) = 1;
    *(_DWORD *)(v4 + 152) = 0;
    *(unsigned char *)(v4 + 156) = 1;
    *(_DWORD *)(v4 + 160) = 0;
    *(unsigned char *)(v4 + 164) = 1;
    *(_DWORD *)(v4 + 168) = 0;
    *(void *)(v4 + 176) = a2;
  }
  return result;
}

double sub_10002EE18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 16))(a2, 184);
  if (v4)
  {
    *(void *)uint64_t v4 = off_100070F68;
    *(void *)(v4 + 8) = a1;
    *(void *)(v4 + 56) = 0;
    *(unsigned char *)(v4 + 64) = 1;
    *(_DWORD *)(v4 + 72) = 0;
    *(unsigned char *)(v4 + 76) = 1;
    *(void *)(v4 + 40) = 0;
    *(unsigned char *)(v4 + 48) = 1;
    *(void *)(v4 + 16) = off_100070AA8;
    *(void *)(v4 + 24) = 0;
    *(unsigned char *)(v4 + 32) = 1;
    double result = 0.0;
    *(_OWORD *)(v4 + 80) = 0u;
    *(_OWORD *)(v4 + 96) = 0u;
    *(_OWORD *)(v4 + 112) = 0u;
    *(_OWORD *)(v4 + 124) = 0u;
    *(unsigned char *)(v4 + 140) = 1;
    *(_DWORD *)(v4 + 144) = 0;
    *(unsigned char *)(v4 + 148) = 1;
    *(_DWORD *)(v4 + 152) = 0;
    *(unsigned char *)(v4 + 156) = 1;
    *(_DWORD *)(v4 + 160) = 0;
    *(unsigned char *)(v4 + 164) = 1;
    *(_DWORD *)(v4 + 168) = 0;
    *(void *)(v4 + 176) = a2;
  }
  return result;
}

double sub_10002EEFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 16))(a2, 184);
  if (v4)
  {
    *(void *)uint64_t v4 = off_100071320;
    *(void *)(v4 + 8) = a1;
    *(void *)(v4 + 56) = 0;
    *(unsigned char *)(v4 + 64) = 1;
    *(_DWORD *)(v4 + 72) = 0;
    *(unsigned char *)(v4 + 76) = 1;
    *(void *)(v4 + 40) = 0;
    *(unsigned char *)(v4 + 48) = 1;
    *(void *)(v4 + 16) = off_100070AA8;
    *(void *)(v4 + 24) = 0;
    *(unsigned char *)(v4 + 32) = 1;
    double result = 0.0;
    *(_OWORD *)(v4 + 80) = 0u;
    *(_OWORD *)(v4 + 96) = 0u;
    *(_OWORD *)(v4 + 112) = 0u;
    *(_OWORD *)(v4 + 124) = 0u;
    *(unsigned char *)(v4 + 140) = 1;
    *(_DWORD *)(v4 + 144) = 0;
    *(unsigned char *)(v4 + 148) = 1;
    *(_DWORD *)(v4 + 152) = 0;
    *(unsigned char *)(v4 + 156) = 1;
    *(_DWORD *)(v4 + 160) = 0;
    *(unsigned char *)(v4 + 164) = 1;
    *(_DWORD *)(v4 + 168) = 0;
    *(void *)(v4 + 176) = a2;
  }
  return result;
}

uint64_t sub_10002EFE0(uint64_t a1, void *a2)
{
  *(void *)a1 = off_100070A58;
  if (*(unsigned char *)(a1 + 64))
  {
    if (*(void *)(a1 + 56))
    {
      uint64_t v3 = *(void *)(a1 + 80);
      if (v3)
      {
        Madusa::MemoryMaster::DeAllocateBuffer(v3, a2);
        uint64_t v6 = 0;
        memset(v5, 0, sizeof(v5));
        sub_10002F98C(a1 + 16, (unint64_t *)v5, (unint64_t *)v5, 0, 0);
      }
    }
  }
  return a1;
}

void sub_10002F06C(uint64_t a1, void *a2)
{
  *(void *)a1 = off_100070A58;
  if (*(unsigned char *)(a1 + 64) && *(void *)(a1 + 56))
  {
    uint64_t v3 = *(void *)(a1 + 80);
    if (v3)
    {
      Madusa::MemoryMaster::DeAllocateBuffer(v3, a2);
      uint64_t v5 = 0;
      memset(v4, 0, sizeof(v4));
      sub_10002F98C(a1 + 16, (unint64_t *)v4, (unint64_t *)v4, 0, 0);
    }
  }
  operator delete();
}

uint64_t sub_10002F10C(uint64_t a1, Madusa::ImageProperties *this)
{
  *(void *)(a1 + 120) = Madusa::ImageProperties::GetBounds(this);
  *(void *)(a1 + 128) = v4;
  sub_100022C04(this, v6);
  if ((unint64_t *)(a1 + 136) != v6)
  {
    *(_DWORD *)(a1 + 152) = v7;
    *(unsigned char *)(a1 + 156) = v8;
    *(_DWORD *)(a1 + 160) = v9;
    *(unsigned char *)(a1 + 164) = v10;
  }
  *(_DWORD *)(a1 + 136) = 0;
  *(unsigned char *)(a1 + 140) = 1;
  *(_DWORD *)(a1 + 144) = 0;
  *(unsigned char *)(a1 + 148) = 1;
  uint64_t result = Madusa::ImageProperties::GetResolutionBucket(this);
  *(_DWORD *)(a1 + 168) = result;
  return result;
}

void *sub_10002F1A8(uint64_t a1, Madusa::ImageProperties *this, long long *a3, int *a4)
{
  uint64_t result = (void *)Madusa::ImageProperties::HasValidColorComponents(this);
  if (result)
  {
    uint64_t v44 = 0;
    char v45 = 1;
    int v46 = 0;
    char v47 = 1;
    uint64_t v42 = 0;
    char v43 = 1;
    v40[0] = off_100070B08;
    v40[1] = 0;
    char v41 = 1;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v50 = 0;
    Madusa::ImageProperties::GetPixelDataBaseAddrs((__n128 *)this, &v22);
    Madusa::ImageProperties::GetPixelData(this, (uint64_t)&v38);
    uint64_t v9 = *(void *)Madusa::ImageProperties::GetImagePlaneSize(this);
    YStride = (int *)Madusa::ImageProperties::GetYStride(this);
    sub_10002F98C((uint64_t)v40, v22.n128_u64, (unint64_t *)&v38, v9, *YStride);
    v22.n128_u32[2] = 0;
    v22.n128_u8[12] = 1;
    int v23 = 0;
    char v24 = 1;
    int v25 = 0;
    char v26 = 1;
    int v27 = 0;
    char v28 = 1;
    int v29 = 0;
    char v30 = 1;
    int v31 = 0;
    char v32 = 1;
    int v33 = 0;
    char v34 = 1;
    int v35 = 0;
    char v36 = 1;
    *(void *)&long long v11 = 0x100000001;
    *((void *)&v11 + 1) = 0x100000001;
    long long v37 = v11;
    long long v12 = a3[1];
    long long v38 = *a3;
    v22.n128_u64[0] = (unint64_t)off_100070B68;
    long long v39 = v12;
    if (Madusa::ImageProperties::ShouldDownsample(this))
    {
      uint64_t v20 = 0x100000001;
      uint64_t v21 = 0x100000001;
      Madusa::ImageProperties::GetDownsampleRatios(this, (Madusa::Ratio *)&v20, (Madusa::Ratio *)&v21);
      sub_10002FBFC(a4, (int *)&v20, (int *)&v21, &v13);
      LODWORD(v38) = v13;
      BYTE4(v38) = BYTE4(v13);
      DWORD2(v38) = v14;
      BYTE12(v38) = v15;
      LODWORD(v39) = v16;
      BYTE4(v39) = v17;
      DWORD2(v39) = v18;
      BYTE12(v39) = v19;
    }
    sub_10002FEF4((uint64_t)&v22, this, (uint64_t)&v38, (uint64_t)a4);
    return sub_10003005C(&v22, (uint64_t)v40, *(void *)(a1 + 8));
  }
  return result;
}

void sub_10002F3B4(uint64_t a1, _DWORD *a2)
{
  if (*((unsigned char *)a2 + 4)) {
    BOOL v2 = *((unsigned char *)a2 + 12) == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (!v2 && *((unsigned char *)a2 + 20) != 0 && *((unsigned char *)a2 + 28) != 0)
  {
    int v6 = a2[4];
    int v7 = *a2;
    int v8 = *a2 + v6;
    BOOL v9 = __OFADD__(*a2, v6);
    int v10 = (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 48))(*(void *)(a1 + 8));
    if ((v7 & 0x80000000) == 0 || !v9)
    {
      if (v7 >= 0 || v9) {
        int v12 = v6;
      }
      else {
        int v12 = v8;
      }
      if (v10 >= 0) {
        uint64_t v13 = v10;
      }
      else {
        uint64_t v13 = -v10;
      }
      uint64_t v14 = v13 * v12;
      uint64_t v15 = (int)v14;
      if ((int)v14 == v14) {
        size_t v16 = v14;
      }
      else {
        size_t v16 = 0;
      }
      if ((int)v14 == v14 && (int)v16 >= 1)
      {
        uint64_t v19 = 0;
        (*(void (**)(void **__return_ptr))(**(void **)(a1 + 8) + 32))(&v18);
        if (v19 == v15) {
          bzero(v18, v16);
        }
      }
    }
  }
}

void sub_10002F4EC(uint64_t a1, uint64_t a2, int *a3)
{
  bzero((void *)(*(void *)a2 + 8), 0x4204uLL);
  int width = 130;
  BOOL v6 = 1;
  char v67 = 1;
  int rowBytes = 130;
  char v69 = 1;
  int v7 = *a3;
  int v8 = a3[1];
  LODWORD(v63) = *a3;
  BYTE4(v63) = 1;
  int height = v8;
  char v65 = 1;
  unint64_t v9 = *(void *)a2 + 8;
  if (v8 >= 0) {
    unint64_t v10 = v8;
  }
  else {
    unint64_t v10 = -v8;
  }
  if (v7 >= 0) {
    uint64_t v11 = v7;
  }
  else {
    uint64_t v11 = -v7;
  }
  if (v8 < 0)
  {
    if (v10 > 0x81) {
      return;
    }
    unint64_t v12 = v10 + v9;
    BOOL v6 = v10 + v9 >= v9;
    if (v10 + v9 <= v9) {
      unint64_t v12 = v9;
    }
    if ((v7 & 0x80000000) == 0) {
      goto LABEL_9;
    }
LABEL_23:
    if (v11 > 0x81) {
      return;
    }
    v10 += 130 * v11;
    if (!v6 || 130 * v11 > ~v12) {
      return;
    }
    goto LABEL_10;
  }
  unint64_t v10 = 0;
  unint64_t v12 = v9;
  if (v7 < 0) {
    goto LABEL_23;
  }
LABEL_9:
  if (!v6) {
    return;
  }
LABEL_10:
  sub_10002C1D0(&v63, (_DWORD *)(a1 + 136), (unint64_t *)v24);
  LODWORD(v63) = v24[0].data;
  BYTE4(v63) = BYTE4(v24[0].data);
  int height = v24[0].height;
  char v65 = BYTE4(v24[0].height);
  int width = v24[0].width;
  char v67 = BYTE4(v24[0].width);
  int rowBytes = v24[0].rowBytes;
  char v69 = BYTE4(v24[0].rowBytes);
  if (v10 <= 0x4204)
  {
    long long v62 = 0u;
    long long v61 = 0u;
    uint64_t v59 = 0;
    unint64_t v60 = v9 + v10;
    uint64_t v53 = 0;
    char v54 = 1;
    int v55 = 0;
    char v56 = 1;
    uint64_t v51 = 0;
    char v52 = 1;
    v49[0] = off_100070AA8;
    v49[1] = 0;
    char v50 = 1;
    long long v57 = 0u;
    long long v58 = 0u;
    sub_10002F98C((uint64_t)v49, &v60, &v60, 16900 - v10, 130);
    sub_100030AFC((int *)&v63, *(_DWORD *)(a1 + 168), &v42);
    int v25 = off_100070BA0;
    int v26 = 0;
    char v27 = 1;
    int v28 = 0;
    char v29 = 1;
    int v30 = 0;
    char v31 = 1;
    int v32 = 0;
    char v33 = 1;
    int v34 = 0;
    char v35 = 1;
    int v36 = 0;
    char v37 = 1;
    int v38 = 0;
    char v39 = 1;
    int v13 = *(_DWORD *)(a1 + 168);
    int v40 = 0;
    if (v13 <= 350) {
      int v14 = v13;
    }
    else {
      int v14 = 300;
    }
    unsigned int v15 = 394;
    char v41 = 1;
    if (v14 <= 199)
    {
      switch(v14)
      {
        case 100:
          size_t v16 = &unk_10006EFA0;
          break;
        case 125:
          size_t v16 = &unk_10006EFB0;
          break;
        case 150:
          size_t v16 = &unk_10006EFC0;
          break;
        default:
          goto LABEL_44;
      }
    }
    else if (v14 > 299)
    {
      if (v14 == 300)
      {
        size_t v16 = &unk_10006EFF0;
      }
      else
      {
        if (v14 != 350) {
          goto LABEL_44;
        }
        size_t v16 = &unk_10006F000;
      }
    }
    else if (v14 == 200)
    {
      size_t v16 = &unk_10006EFD0;
    }
    else
    {
      if (v14 != 250) {
        goto LABEL_44;
      }
      size_t v16 = &unk_10006EFE0;
    }
    unsigned int v15 = v16[3];
    if ((int)v15 < 1)
    {
      uint64_t v20 = 0;
      uint64_t v21 = a1 + 16;
      if (*(unsigned char *)(a1 + 64))
      {
LABEL_45:
        BOOL v22 = *(void *)(a1 + 56) == 0;
        if (!v20) {
          goto LABEL_52;
        }
        goto LABEL_49;
      }
LABEL_48:
      BOOL v22 = 1;
      if (!v20)
      {
LABEL_52:
        Madusa::ImageProperties::ImageProperties((Madusa::ImageProperties *)v24);
        int v26 = v42;
        char v27 = BYTE4(v42);
        int v28 = v43;
        char v29 = v44;
        int v30 = v45;
        char v31 = v46;
        int v32 = v47;
        char v33 = v48;
        int v34 = v63;
        char v35 = BYTE4(v63);
        int v36 = height;
        char v37 = v65;
        int v38 = width;
        char v39 = v67;
        int v40 = rowBytes;
        char v41 = v69;
        sub_100030E18(&v25, *(void *)(a1 + 8), (uint64_t)v49, v21);
        return;
      }
LABEL_49:
      if (v22)
      {
        int v23 = (void *)(*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 176) + 16))(*(void *)(a1 + 176), v20);
        if (v23)
        {
          v24[0].data = v23;
          sub_10002F98C(v21, (unint64_t *)v24, (unint64_t *)v24, v20, 0);
        }
      }
      goto LABEL_52;
    }
LABEL_44:
    v24[0].data = 0;
    v24[0].int height = v15;
    v24[0].int width = v15;
    v24[0].int rowBytes = v15;
    *(int64x2_t *)&dest.int height = vdupq_n_s64(0x82uLL);
    dest.data = 0;
    dest.int rowBytes = 130;
    vImage_Error v19 = vImageScale_Planar8(v24, &dest, 0, 0x80u);
    uint64_t v20 = v19 & ~(v19 >> 63);
    uint64_t v21 = a1 + 16;
    if (*(unsigned char *)(a1 + 64)) {
      goto LABEL_45;
    }
    goto LABEL_48;
  }
}

uint64_t sub_10002F948(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t sub_10002F950(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 24))();
}

void sub_10002F978()
{
}

uint64_t sub_10002F98C(uint64_t result, unint64_t *a2, unint64_t *a3, uint64_t a4, int a5)
{
  unint64_t v5 = 0;
  unint64_t v6 = 0;
  *(_OWORD *)(result + 64) = 0u;
  int v7 = (unint64_t *)(result + 64);
  *(void *)(result + 24) = 0;
  *(unsigned char *)(result + 32) = 1;
  *(void *)(result + 8) = 0;
  *(unsigned char *)(result + 16) = 1;
  *(void *)(result + 96) = 0;
  *(_OWORD *)(result + 80) = 0u;
  *(_DWORD *)(result + 56) = a5;
  *(unsigned char *)(result + 60) = 1;
  *(void *)(result + 40) = a4;
  *(unsigned char *)(result + 48) = 1;
  unint64_t v8 = *a2;
  unint64_t v9 = *a2 + a4;
  BOOL v10 = v9 >= *a2;
  if (v9 >= *a2)
  {
    unint64_t v5 = 0;
    unint64_t v11 = *a3;
    unint64_t v6 = 0;
    if (*a3 < v9 && v11 >= v8)
    {
      *int v7 = v11;
      if (v8) {
        *(void *)(result + 24) = v8;
      }
      *(void *)(result + 8) = v9;
      *(unsigned char *)(result + 16) = v10;
      unint64_t v5 = v9;
      unint64_t v6 = v8;
    }
  }
  unint64_t v12 = a2[1];
  unint64_t v13 = v12 + a4;
  if (v12 + a4 >= v12)
  {
    unint64_t v14 = a3[1];
    if (v14 < v13 && v14 >= v12)
    {
      *(void *)(result + 72) = v14;
      if (v12 - 1 < v6 - 1)
      {
        *(void *)(result + 24) = v12;
        *(unsigned char *)(result + 32) = 1;
        unint64_t v6 = v12;
      }
      if (v13 > v5)
      {
        *(void *)(result + 8) = v13;
        *(unsigned char *)(result + 16) = v12 + a4 >= v12;
        unint64_t v5 = v12 + a4;
      }
    }
  }
  unint64_t v15 = a2[2];
  unint64_t v16 = v15 + a4;
  if (v15 + a4 >= v15)
  {
    unint64_t v17 = a3[2];
    if (v17 < v16 && v17 >= v15)
    {
      *(void *)(result + 80) = v17;
      if (v15 - 1 < v6 - 1)
      {
        *(void *)(result + 24) = v15;
        *(unsigned char *)(result + 32) = 1;
        unint64_t v6 = v15;
      }
      if (v16 > v5)
      {
        *(void *)(result + 8) = v16;
        *(unsigned char *)(result + 16) = v15 + a4 >= v15;
        unint64_t v5 = v15 + a4;
      }
    }
  }
  unint64_t v18 = a2[3];
  unint64_t v19 = v18 + a4;
  if (v18 + a4 >= v18)
  {
    unint64_t v20 = a3[3];
    if (v20 < v19 && v20 >= v18)
    {
      *(void *)(result + 88) = v20;
      if (v18 - 1 < v6 - 1)
      {
        *(void *)(result + 24) = v18;
        *(unsigned char *)(result + 32) = 1;
        unint64_t v6 = v18;
      }
      if (v19 > v5)
      {
        *(void *)(result + 8) = v19;
        *(unsigned char *)(result + 16) = v18 + a4 >= v18;
        unint64_t v5 = v18 + a4;
      }
    }
  }
  unint64_t v21 = a2[4];
  unint64_t v22 = v21 + a4;
  if (v21 + a4 >= v21)
  {
    unint64_t v23 = a3[4];
    if (v23 < v22 && v23 >= v21)
    {
      *(void *)(result + 96) = v23;
      if (v21 - 1 < v6 - 1)
      {
        *(void *)(result + 24) = v21;
        *(unsigned char *)(result + 32) = 1;
        unint64_t v6 = v21;
      }
      if (v22 > v5)
      {
        *(void *)(result + 8) = v22;
        *(unsigned char *)(result + 16) = v21 + a4 >= v21;
        unint64_t v5 = v21 + a4;
      }
    }
  }
  if (v6 > v5)
  {
    *(void *)(result + 40) = 0;
    *(unsigned char *)(result + 48) = 1;
    *(_DWORD *)(result + 56) = 0;
    *(unsigned char *)(result + 60) = 1;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 1;
    *(void *)(result + 8) = 0;
    *(unsigned char *)(result + 16) = 1;
    *(_OWORD *)int v7 = 0uLL;
    *(_OWORD *)(result + 80) = 0uLL;
    *(void *)(result + 96) = 0;
  }
  return result;
}

__n128 sub_10002FBD0@<Q0>(uint64_t a1@<X0>, unint64_t a2@<X1>, unint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  if (*(void *)(a1 + 40) < a2 || *(unsigned char *)(a1 + 48) == 0) {
    unint64_t v5 = *(void *)(a1 + 40);
  }
  else {
    unint64_t v5 = a2;
  }
  *a3 = v5;
  __n128 result = *(__n128 *)(a1 + 64);
  long long v7 = *(_OWORD *)(a1 + 80);
  *(__n128 *)a4 = result;
  *(_OWORD *)(a4 + 16) = v7;
  *(void *)(a4 + 32) = *(void *)(a1 + 96);
  return result;
}

unint64_t sub_10002FBFC@<X0>(int *a1@<X0>, int *a2@<X1>, int *a3@<X2>, unint64_t *a4@<X8>)
{
  int v8 = *a3;
  uint64_t v9 = *a3 * (uint64_t)*a1;
  if (v9 == (int)v9
    && 2 * v9 == 2 * v9
    && (BOOL v10 = __OFADD__(v8, 2 * v9), v11 = (v8 + 2 * v9), !v10))
  {
    unint64_t v18 = v11 | (unint64_t)&_mh_execute_header;
  }
  else
  {
    unint64_t v18 = 0;
  }
  unint64_t v43 = v18;
  uint64_t v12 = a3[1];
  if (2 * v12 == 2 * v12) {
    unint64_t v13 = (unint64_t)&_mh_execute_header & 0xFFFFFFFF00000001 | (2 * (v12 & 0x7FFFFFFF));
  }
  else {
    unint64_t v13 = 0;
  }
  unint64_t v42 = v13;
  unint64_t v14 = sub_100023608((unsigned int *)&v43, (int *)&v42);
  unint64_t v15 = 0;
  int v16 = *a2;
  uint64_t v17 = *a2 * (uint64_t)a1[2];
  if (v17 == (int)v17)
  {
    if (2 * v17 != 2 * v17 || __OFADD__(v16, 2 * v17)) {
      unint64_t v15 = 0;
    }
    else {
      unint64_t v15 = (v16 + 2 * v17) | (unint64_t)&_mh_execute_header;
    }
  }
  unint64_t v43 = v15;
  uint64_t v19 = a2[1];
  if (2 * v19 == 2 * v19) {
    unint64_t v20 = (unint64_t)&_mh_execute_header & 0xFFFFFFFF00000001 | (2 * (v19 & 0x7FFFFFFF));
  }
  else {
    unint64_t v20 = 0;
  }
  unint64_t v42 = v20;
  unint64_t v21 = sub_100023608((unsigned int *)&v43, (int *)&v42);
  unint64_t v22 = 0;
  int v23 = *a3;
  uint64_t v24 = *a3 * (uint64_t)(*a1 + a1[4] - 1);
  if (v24 == (int)v24)
  {
    if (2 * v24 == 2 * v24)
    {
      uint64_t v25 = (v23 + 2 * v24);
      BOOL v26 = __OFADD__(v23, 2 * v24);
      unint64_t v22 = v25 | (unint64_t)&_mh_execute_header;
      if (v26) {
        unint64_t v22 = 0;
      }
    }
    else
    {
      unint64_t v22 = 0;
    }
  }
  unint64_t v43 = v22;
  uint64_t v27 = a3[1];
  if (2 * v27 == 2 * v27) {
    unint64_t v28 = (unint64_t)&_mh_execute_header & 0xFFFFFFFF00000001 | (2 * (v27 & 0x7FFFFFFF));
  }
  else {
    unint64_t v28 = 0;
  }
  unint64_t v42 = v28;
  unint64_t v29 = sub_100023608((unsigned int *)&v43, (int *)&v42);
  unint64_t v30 = 0;
  int v31 = *a2;
  uint64_t v32 = *a2 * (uint64_t)(a1[2] + a1[6] - 1);
  if (v32 == (int)v32)
  {
    if (2 * v32 != 2 * v32 || __OFADD__(v31, 2 * v32)) {
      unint64_t v30 = 0;
    }
    else {
      unint64_t v30 = (v31 + 2 * v32) | (unint64_t)&_mh_execute_header;
    }
  }
  unint64_t v43 = v30;
  uint64_t v33 = a2[1];
  if (2 * v33 == 2 * v33) {
    unint64_t v34 = (unint64_t)&_mh_execute_header & 0xFFFFFFFF00000001 | (2 * (v33 & 0x7FFFFFFF));
  }
  else {
    unint64_t v34 = 0;
  }
  unint64_t v42 = v34;
  unint64_t result = sub_100023608((unsigned int *)&v43, (int *)&v42);
  unint64_t v36 = 0;
  if (!*((unsigned char *)a1 + 12) || !*((unsigned char *)a1 + 4) || !*((unsigned char *)a1 + 28))
  {
    LOBYTE(v37) = 0;
    LOBYTE(v38) = 0;
    unint64_t v39 = 0;
    goto LABEL_57;
  }
  LOBYTE(v37) = 0;
  LOBYTE(v38) = 0;
  unint64_t v39 = 0;
  if (*((unsigned char *)a1 + 20))
  {
    unint64_t v36 = 0;
    unint64_t v38 = HIDWORD(v14);
    unint64_t v37 = HIDWORD(v21);
    if ((v29 & 0xFF00000000) == 0 || (v14 & 0xFF00000000) == 0)
    {
LABEL_44:
      unint64_t v39 = 0;
      if ((result & 0xFF00000000) == 0) {
        goto LABEL_57;
      }
      goto LABEL_51;
    }
    uint64_t v40 = (int)v29 - (uint64_t)(int)v14;
    if (v40 != (int)v40)
    {
      unint64_t v36 = 0;
      goto LABEL_44;
    }
    if ((unint64_t)(v40 + 2147483649) >> 32) {
      unint64_t v36 = 0;
    }
    else {
      unint64_t v36 = (v40 + 1) | (unint64_t)&_mh_execute_header;
    }
    unint64_t v39 = 0;
    if ((result & 0xFF00000000) != 0)
    {
LABEL_51:
      if ((v21 & 0xFF00000000) != 0)
      {
        uint64_t v41 = (int)result - (uint64_t)(int)v21;
        if (v41 == (int)v41)
        {
          if ((unint64_t)(v41 + 2147483649) >> 32) {
            unint64_t v39 = 0;
          }
          else {
            unint64_t v39 = (v41 + 1) | (unint64_t)&_mh_execute_header;
          }
        }
        else
        {
          unint64_t v39 = 0;
        }
      }
    }
  }
LABEL_57:
  *a4 = v14 & 0xFFFFFF00FFFFFFFFLL | ((unint64_t)v38 << 32);
  a4[1] = v21 & 0xFFFFFF00FFFFFFFFLL | ((unint64_t)v37 << 32);
  a4[2] = v36;
  a4[3] = v39;
  return result;
}

_DWORD *sub_10002FEF4(uint64_t a1, Madusa::ImageProperties *this, uint64_t a3, uint64_t a4)
{
  if (a1 + 40 != a4)
  {
    *(_DWORD *)(a1 + 40) = *(_DWORD *)a4;
    *(unsigned char *)(a1 + 44) = *(unsigned char *)(a4 + 4);
    *(_DWORD *)(a1 + 48) = *(_DWORD *)(a4 + 8);
    *(unsigned char *)(a1 + 52) = *(unsigned char *)(a4 + 12);
    *(_DWORD *)(a1 + 56) = *(_DWORD *)(a4 + 16);
    *(unsigned char *)(a1 + 60) = *(unsigned char *)(a4 + 20);
    *(_DWORD *)(a1 + 64) = *(_DWORD *)(a4 + 24);
    *(unsigned char *)(a1 + 68) = *(unsigned char *)(a4 + 28);
  }
  if (a1 + 8 != a3)
  {
    *(_DWORD *)(a1 + 8) = *(_DWORD *)a3;
    *(unsigned char *)(a1 + 12) = *(unsigned char *)(a3 + 4);
    *(_DWORD *)(a1 + 16) = *(_DWORD *)(a3 + 8);
    *(unsigned char *)(a1 + 20) = *(unsigned char *)(a3 + 12);
    *(_DWORD *)(a1 + 24) = *(_DWORD *)(a3 + 16);
    *(unsigned char *)(a1 + 28) = *(unsigned char *)(a3 + 20);
    *(_DWORD *)(a1 + 32) = *(_DWORD *)(a3 + 24);
    *(unsigned char *)(a1 + 36) = *(unsigned char *)(a3 + 28);
  }
  *(_DWORD *)(a1 + 72) = *(_DWORD *)Madusa::ImageProperties::GetYStride(this);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)Madusa::ImageProperties::GetXStride(this);
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v7 = *(void *)(a1 + 16);
  Integerdouble OffsetBounds = Madusa::ImageProperties::GetIntegerOffsetBounds(this);
  int v9 = Madusa::ImageProperties::GetIntegerOffsetBounds(this);
  if ((int)v7 - (IntegerOffsetBounds >> 32) == v7 - HIDWORD(IntegerOffsetBounds)) {
    unint64_t v10 = (unint64_t)&_mh_execute_header & 0xFFFFFFFF00000000 | (v7 - HIDWORD(IntegerOffsetBounds));
  }
  else {
    unint64_t v10 = 0;
  }
  if ((v7 & 0xFF00000000) == 0) {
    unint64_t v10 = 0;
  }
  if ((v6 & 0xFF00000000) != 0 && (v10 & 0x100000000) != 0)
  {
    uint64_t v11 = (int)v6 - (uint64_t)v9;
    if (!((unint64_t)(v11 + 0x80000000) >> 32))
    {
      *(_DWORD *)(a1 + 80) = v11;
      *(_DWORD *)(a1 + 84) = v10;
    }
  }

  return Madusa::ImageProperties::GetDownsampleRatios(this, (Madusa::Ratio *)(a1 + 88), (Madusa::Ratio *)(a1 + 96));
}

void *sub_10003005C(void *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (uint64_t)(result + 1);
  if ((result[1] & 0x80000000) == 0)
  {
    int v4 = *((_DWORD *)result + 6);
    int v5 = *((_DWORD *)result + 8);
    if (v4 >= 1 && v5 >= 1)
    {
      uint64_t v7 = result;
      if ((result[2] & 0x80000000) == 0
        && *((unsigned char *)result + 12)
        && *((unsigned char *)result + 28)
        && *((unsigned char *)result + 36)
        && *((unsigned char *)result + 20)
        && (result[5] & 0x80000000) == 0
        && *((int *)result + 14) >= 1
        && *((int *)result + 16) >= 1
        && (result[6] & 0x80000000) == 0
        && *((unsigned char *)result + 44)
        && *((unsigned char *)result + 60)
        && *((unsigned char *)result + 68)
        && *((unsigned char *)result + 52)
        && *((int *)result + 22) >= 1
        && *((int *)result + 23) >= 1
        && *((int *)result + 24) >= 1
        && *((int *)result + 25) >= 1)
      {
        int v11 = *((_DWORD *)result + 18);
        int v10 = *((_DWORD *)result + 19);
        if (v10 < 0) {
          int v10 = -v10;
        }
        unint64_t v12 = v5 * (unint64_t)v10;
        if (v11 >= 0) {
          unsigned int v13 = *((_DWORD *)result + 18);
        }
        else {
          unsigned int v13 = -v11;
        }
        unint64_t v14 = v4 * (unint64_t)v13;
        if (v12 <= v14) {
          unint64_t v15 = v14;
        }
        else {
          unint64_t v15 = v12;
        }
        uint64_t v41 = 0;
        unint64_t result = (*(void *(**)(uint64_t *__return_ptr, uint64_t, unint64_t, uint64_t *))(*(void *)a2 + 32))(v40, a2, v15, &v41);
        if (v41 == v15)
        {
          sub_100030710(v7, v40);
          uint64_t v38 = 0;
          int v16 = v7[14];
          if ((v16 & 0x80000000) == 0) {
            uint64_t v38 = v7[14];
          }
          BOOL v39 = v16 >= 0;
          uint64_t v17 = (*(uint64_t (**)(uint64_t))(*(void *)a3 + 48))(a3);
          uint64_t v18 = v17;
          if ((int)v17 >= 0) {
            uint64_t v19 = v17;
          }
          else {
            uint64_t v19 = -(int)v17;
          }
          uint64_t v36 = v19;
          char v37 = 1;
          unint64_t result = (void *)sub_10002DC24(&v38, &v36);
          if (v20)
          {
            unint64_t v21 = result;
            char v35 = 0;
            unint64_t result = (*(void *(**)(uint64_t *__return_ptr, uint64_t, void *, void **))(*(void *)a3 + 32))(v34, a3, result, &v35);
            if (v21 == v35)
            {
              uint64_t v33 = v34[0];
              int v23 = v7[18];
              int v22 = v7[19];
              uint64_t v31 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 64))(a2);
              uint64_t v32 = v24;
              uint64_t v29 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 72))(a2);
              uint64_t v30 = v25;
              int v26 = sub_1000308B8((int)v7, v40, v22, v23, v3, (Madusa::ImageProperties *)0x10, &v31, &v29);
              uint64_t v31 = (*(uint64_t (**)(uint64_t))(*(void *)a3 + 64))(a3);
              uint64_t v32 = v27;
              uint64_t v29 = (*(uint64_t (**)(uint64_t))(*(void *)a3 + 72))(a3);
              uint64_t v30 = v28;
              unint64_t result = (void *)sub_1000308B8((int)v7, v34, 1, v18, (uint64_t)(v7 + 10), (Madusa::ImageProperties *)8, &v31, &v29);
              if (v26)
              {
                if (result) {
                  return (void *)(*(uint64_t (**)(_DWORD *, uint64_t, uint64_t, uint64_t *, uint64_t *))(*(void *)v7 + 32))(v7, v38, v18, &v33, v40);
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_1000303E4()
{
}

_DWORD *sub_1000303F8(_DWORD *result, uint64_t a2, int a3, void *a4, void *a5)
{
  if (a2)
  {
    unint64_t v5 = 0;
    unint64_t v6 = 0;
    int v7 = result[19] / 2;
    int v8 = result[18];
    uint64_t v9 = result[16];
    if (v8 >= 0) {
      int v10 = result[18];
    }
    else {
      int v10 = v8 + 1;
    }
    uint64_t v11 = (uint64_t)v10 >> 1;
    while (1)
    {
      if ((int)v9 >= 1)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          int v16 = result[22] * (int)i / result[23] * v7;
          unsigned int v17 = *(unsigned __int16 *)(*a5 + 2 * v16);
          int v18 = (v17 << 13) & 0xF800000;
          float v19 = COERCE_FLOAT(((v17 << 13) & 0xFFFE000) + 947912704) + -0.000061035;
          if (v18) {
            LODWORD(v19) = ((v17 << 13) & 0xFFFE000) + 939524096;
          }
          int v20 = (v17 << 13) | 0x70000000;
          if (v18 != 260046848) {
            int v20 = LODWORD(v19);
          }
          LODWORD(v21) = v20 | (v17 >> 15 << 31);
          if (v17 == 0x7FFF) {
            float v21 = 0.0;
          }
          unsigned int v22 = *(unsigned __int16 *)(a5[1] + 2 * v16);
          float v23 = 0.0;
          float v24 = 0.0;
          if (v22 != 0x7FFF)
          {
            int v25 = (v22 << 13) & 0xF800000;
            float v26 = COERCE_FLOAT(((v22 << 13) & 0xFFFE000) + 947912704) + -0.000061035;
            if (v25) {
              LODWORD(v26) = ((v22 << 13) & 0xFFFE000) + 939524096;
            }
            int v27 = (v22 << 13) | 0x70000000;
            if (v25 != 260046848) {
              int v27 = LODWORD(v26);
            }
            LODWORD(v24) = v27 | (v22 >> 15 << 31);
          }
          unsigned int v28 = *(unsigned __int16 *)(a5[2] + 2 * v16);
          if (v28 != 0x7FFF)
          {
            int v29 = (v28 << 13) & 0xF800000;
            float v30 = COERCE_FLOAT(((v28 << 13) & 0xFFFE000) + 947912704) + -0.000061035;
            if (v29) {
              LODWORD(v30) = ((v28 << 13) & 0xFFFE000) + 939524096;
            }
            int v31 = (v28 << 13) | 0x70000000;
            if (v29 != 260046848) {
              int v31 = LODWORD(v30);
            }
            LODWORD(v23) = v31 | (v28 >> 15 << 31);
          }
          float v13 = fminf((float)((float)(v24 + v21) + v23) * 85.0, 255.0);
          if (v13 <= 0.0) {
            float v14 = 0.5;
          }
          else {
            float v14 = v13 + 0.5;
          }
          int v15 = (int)v14;
          if ((int)v14 >= 255) {
            int v15 = 255;
          }
          *(unsigned char *)(*a4 + i) = dword_10006F010[v15 & ~(v15 >> 31)];
        }
      }
      *a4 += a3;
      unint64_t v33 = (int)result[24];
      unint64_t v32 = (int)result[25];
      unint64_t v34 = v5 + 1;
      if ((v33 & 0x80000000) != 0)
      {
        if (v5 > 0xFFFFFFFE) {
          return result;
        }
        unint64_t v35 = HIDWORD(v33) * v34;
        if (v35)
        {
LABEL_36:
          if (HIDWORD(v35)) {
            return result;
          }
          unint64_t v36 = v33 * (unint64_t)v34;
          BOOL v37 = __CFADD__(v36, v35 << 32);
          unint64_t v38 = v36 + (v35 << 32);
          if (v37) {
            return result;
          }
          goto LABEL_43;
        }
      }
      else if (v5 >= 0xFFFFFFFF)
      {
        unint64_t v35 = HIDWORD(v34) * v33;
        if (v35) {
          goto LABEL_36;
        }
      }
      unint64_t v38 = v33 * (unint64_t)v34;
LABEL_43:
      if (!v32) {
        return result;
      }
      if (v38)
      {
        unint64_t v39 = v38 / v32;
        if (v6 > v39) {
          return result;
        }
      }
      else
      {
        unint64_t v39 = 0;
        if (v6) {
          return result;
        }
      }
      BOOL v37 = v39 >= v6;
      int v40 = v39 - v6;
      if (!v37) {
        int v40 = 0;
      }
      uint64_t v41 = v40 * (uint64_t)(int)v11;
      if (v41 == (int)v41)
      {
        if (*a5) {
          *a5 += 2 * v41;
        }
        uint64_t v42 = a5[1];
        if (v42) {
          a5[1] = v42 + 2 * v41;
        }
        uint64_t v43 = a5[2];
        if (v43) {
          a5[2] = v43 + 2 * v41;
        }
        uint64_t v44 = a5[3];
        if (v44) {
          a5[3] = v44 + 2 * v41;
        }
        uint64_t v45 = a5[4];
        if (v45) {
          a5[4] = v45 + 2 * v41;
        }
        unint64_t v5 = v34;
        unint64_t v6 = v39;
        if (v34 != a2) {
          continue;
        }
      }
      return result;
    }
  }
  return result;
}

_DWORD *sub_100030710(_DWORD *result, void *a2)
{
  if (*a2)
  {
    uint64_t v2 = (int)result[21] * (uint64_t)(result[19] / 2);
    if (v2 != (int)v2) {
      return result;
    }
    uint64_t v3 = (int)result[20] * (uint64_t)(result[18] / 2);
    if (v3 != (int)v3) {
      return result;
    }
    *a2 += 2 * v2 + 2 * v3;
  }
  uint64_t v4 = a2[1];
  if (v4)
  {
    uint64_t v5 = (int)result[21] * (uint64_t)(result[19] / 2);
    if (v5 != (int)v5) {
      return result;
    }
    uint64_t v6 = (int)result[20] * (uint64_t)(result[18] / 2);
    if (v6 != (int)v6) {
      return result;
    }
    a2[1] = v4 + 2 * v5 + 2 * v6;
  }
  uint64_t v7 = a2[2];
  if (v7)
  {
    uint64_t v8 = (int)result[21] * (uint64_t)(result[19] / 2);
    if (v8 != (int)v8) {
      return result;
    }
    uint64_t v9 = (int)result[20] * (uint64_t)(result[18] / 2);
    if (v9 != (int)v9) {
      return result;
    }
    a2[2] = v7 + 2 * v8 + 2 * v9;
  }
  uint64_t v10 = a2[3];
  if (v10)
  {
    uint64_t v11 = (int)result[21] * (uint64_t)(result[19] / 2);
    if (v11 != (int)v11) {
      return result;
    }
    uint64_t v12 = (int)result[20] * (uint64_t)(result[18] / 2);
    if (v12 != (int)v12) {
      return result;
    }
    a2[3] = v10 + 2 * v11 + 2 * v12;
  }
  uint64_t v13 = a2[4];
  if (v13)
  {
    uint64_t v14 = (int)result[21] * (uint64_t)(result[19] / 2);
    if (v14 == (int)v14)
    {
      uint64_t v15 = (int)result[20] * (uint64_t)(result[18] / 2);
      if (v15 == (int)v15) {
        a2[4] = v13 + 2 * v14 + 2 * v15;
      }
    }
  }
  return result;
}

uint64_t sub_1000308B8(int a1, uint64_t *a2, int a3, int a4, uint64_t a5, Madusa::ImageProperties *this, void *a7, void *a8)
{
  uint64_t v14 = Madusa::ImageProperties::ConvertBitsPerPixel(this);
  Madusa::SubBytePixelDirectionAndOffset::SubBytePixelDirectionAndOffset((uint64_t)&v36);
  Madusa::SubBytePixelDirectionAndOffset::Reset((uint64_t)&v36, v14, 1, 0);
  __n128 v15 = Madusa::PixelTraversalInformation::PixelTraversalInformation((uint64_t)v35, a3, a4, &v36);
  Madusa::IteratorBoundsComputer::IteratorBoundsComputer(v34, *(unsigned int *)(a5 + 24), *(unsigned int *)(a5 + 16), v14, v35, v15);
  uint64_t v16 = *a2;
  if (*a2)
  {
    unint64_t v32 = 0;
    unint64_t v33 = 0;
    if (!Madusa::IteratorBoundsComputer::SetBoundsForGivenBaseAddress((Madusa::IteratorBoundsComputer *)v34, v16, &v33, &v32))return 0; {
    unsigned int v17 = v32;
    }
    int v18 = v33;
    if (!Madusa::IteratorBoundsComputer::IsValid((Madusa::IteratorBoundsComputer *)v34)
      || v18 > v17
      || *a7 > (unint64_t)v18
      || *a8 < (unint64_t)v17)
    {
      return 0;
    }
  }
  uint64_t v19 = a2[1];
  if (v19)
  {
    unint64_t v32 = 0;
    unint64_t v33 = 0;
    if (!Madusa::IteratorBoundsComputer::SetBoundsForGivenBaseAddress((Madusa::IteratorBoundsComputer *)v34, v19, &v33, &v32))return 0; {
    int v20 = v32;
    }
    float v21 = v33;
    if (!Madusa::IteratorBoundsComputer::IsValid((Madusa::IteratorBoundsComputer *)v34)
      || v21 > v20
      || *a7 > (unint64_t)v21
      || *a8 < (unint64_t)v20)
    {
      return 0;
    }
  }
  uint64_t v22 = a2[2];
  if (v22)
  {
    unint64_t v32 = 0;
    unint64_t v33 = 0;
    if (!Madusa::IteratorBoundsComputer::SetBoundsForGivenBaseAddress((Madusa::IteratorBoundsComputer *)v34, v22, &v33, &v32))return 0; {
    float v23 = v32;
    }
    float v24 = v33;
    if (!Madusa::IteratorBoundsComputer::IsValid((Madusa::IteratorBoundsComputer *)v34)
      || v24 > v23
      || *a7 > (unint64_t)v24
      || *a8 < (unint64_t)v23)
    {
      return 0;
    }
  }
  uint64_t v25 = a2[3];
  if (v25)
  {
    unint64_t v32 = 0;
    unint64_t v33 = 0;
    if (!Madusa::IteratorBoundsComputer::SetBoundsForGivenBaseAddress((Madusa::IteratorBoundsComputer *)v34, v25, &v33, &v32))return 0; {
    float v26 = v32;
    }
    int v27 = v33;
    if (!Madusa::IteratorBoundsComputer::IsValid((Madusa::IteratorBoundsComputer *)v34)
      || v27 > v26
      || *a7 > (unint64_t)v27
      || *a8 < (unint64_t)v26)
    {
      return 0;
    }
  }
  uint64_t v28 = a2[4];
  if (!v28) {
    return 1;
  }
  unint64_t v32 = 0;
  unint64_t v33 = 0;
  if (Madusa::IteratorBoundsComputer::SetBoundsForGivenBaseAddress((Madusa::IteratorBoundsComputer *)v34, v28, &v33, &v32)&& (int v29 = v32, v30 = v33, Madusa::IteratorBoundsComputer::IsValid((Madusa::IteratorBoundsComputer *)v34))&& v30 <= v29&& *a7 <= (unint64_t)v30&& *a8 >= (unint64_t)v29)
  {
    return 1;
  }
  else
  {
    return 0;
  }
}

int *sub_100030AFC@<X0>(int *result@<X0>, int a2@<W1>, unint64_t *a3@<X8>)
{
  if (a2 <= 350) {
    int v3 = a2;
  }
  else {
    int v3 = 300;
  }
  unint64_t v4 = 0x100000001;
  if (v3 <= 199)
  {
    switch(v3)
    {
      case 100:
        uint64_t v5 = (char *)&unk_10006EFA0;
        break;
      case 125:
        uint64_t v5 = (char *)&unk_10006EFB0;
        break;
      case 150:
        uint64_t v5 = (char *)&unk_10006EFC0;
        break;
      default:
        goto LABEL_21;
    }
  }
  else if (v3 > 299)
  {
    if (v3 == 300)
    {
      uint64_t v5 = (char *)&unk_10006EFF0;
    }
    else
    {
      if (v3 != 350) {
        goto LABEL_21;
      }
      uint64_t v5 = (char *)&unk_10006F000;
    }
  }
  else if (v3 == 200)
  {
    uint64_t v5 = (char *)&unk_10006EFD0;
  }
  else
  {
    if (v3 != 250) {
      goto LABEL_21;
    }
    uint64_t v5 = (char *)&unk_10006EFE0;
  }
  unint64_t v4 = *(void *)(v5 + 4);
LABEL_21:
  unint64_t v6 = HIDWORD(v4);
  int v7 = v4;
  uint64_t v8 = 0;
  if (*((unsigned char *)result + 4))
  {
    uint64_t v9 = v7 * (uint64_t)*result;
    if (v9 == (int)v9) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    BOOL v11 = v6 == 0;
    if (v6)
    {
      uint64_t v12 = 0;
      if ((unint64_t)(v7 * (uint64_t)*result - 0x80000000) >= 0xFFFFFFFF00000000)
      {
        if (v10)
        {
          BOOL v11 = 0;
          if (v10 == 0x80000000 && v6 == -1)
          {
            uint64_t v8 = 0;
            uint64_t v12 = 0;
            if (!*((unsigned char *)result + 12)) {
              goto LABEL_47;
            }
          }
          else
          {
            uint64_t v12 = &_mh_execute_header;
            uint64_t v8 = ((int)v10 / (int)v6);
            if (!*((unsigned char *)result + 12)) {
              goto LABEL_47;
            }
          }
          goto LABEL_40;
        }
        BOOL v11 = 0;
        uint64_t v12 = &_mh_execute_header;
        uint64_t v8 = v10;
      }
      if (!*((unsigned char *)result + 12)) {
        goto LABEL_47;
      }
      goto LABEL_40;
    }
    uint64_t v12 = 0;
    if (!*((unsigned char *)result + 12)) {
      goto LABEL_47;
    }
  }
  else
  {
    uint64_t v12 = 0;
    BOOL v11 = v6 == 0;
    if (!*((unsigned char *)result + 12)) {
      goto LABEL_47;
    }
  }
LABEL_40:
  uint64_t v14 = v7 * (uint64_t)result[2];
  BOOL v15 = (int)v14 == v14;
  if ((int)v14 == v14) {
    uint64_t v14 = v14;
  }
  else {
    uint64_t v14 = 0;
  }
  char v16 = !v15 || v11;
  if ((v16 & 1) == 0)
  {
    if (!v14)
    {
      unsigned int v17 = &_mh_execute_header;
      goto LABEL_48;
    }
    if (v14 != 0x80000000 || v6 != -1)
    {
      unsigned int v17 = &_mh_execute_header;
      uint64_t v14 = ((int)v14 / (int)v6);
      goto LABEL_48;
    }
  }
LABEL_47:
  uint64_t v14 = 0;
  unsigned int v17 = 0;
LABEL_48:
  if (!*((unsigned char *)result + 20)) {
    goto LABEL_56;
  }
  uint64_t v18 = v7 * (uint64_t)result[4];
  BOOL v19 = (int)v18 == v18;
  uint64_t v18 = (int)v18 == v18 ? v18 : 0;
  if (!v19 || v11) {
    goto LABEL_56;
  }
  if (v18)
  {
    if (v18 == 0x80000000 && v6 == -1)
    {
LABEL_56:
      uint64_t v18 = 0;
      float v21 = 0;
      goto LABEL_57;
    }
    float v21 = &_mh_execute_header;
    uint64_t v18 = ((int)v18 / (int)v6);
  }
  else
  {
    float v21 = &_mh_execute_header;
  }
LABEL_57:
  if (!*((unsigned char *)result + 28)) {
    goto LABEL_64;
  }
  uint64_t v22 = v7 * (uint64_t)result[6];
  unint64_t result = (int *)(int)v22;
  BOOL v23 = (int)v22 == v22;
  if ((int)v22 == v22) {
    uint64_t v22 = v22;
  }
  else {
    uint64_t v22 = 0;
  }
  if (!v23) {
    BOOL v11 = 1;
  }
  if (v11) {
    goto LABEL_64;
  }
  if (!v22)
  {
    float v24 = &_mh_execute_header;
    goto LABEL_65;
  }
  if (v22 == 0x80000000 && v6 == -1)
  {
LABEL_64:
    uint64_t v22 = 0;
    float v24 = 0;
  }
  else
  {
    float v24 = &_mh_execute_header;
    uint64_t v22 = ((int)v22 / (int)v6);
  }
LABEL_65:
  *a3 = (unint64_t)v12 | v8;
  a3[1] = (unint64_t)v17 | v14;
  a3[2] = (unint64_t)v21 | v18;
  a3[3] = (unint64_t)v24 | v22;
  return result;
}

uint64_t sub_100030D7C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (result + 8 != a3)
  {
    *(_DWORD *)(result + 8) = *(_DWORD *)a3;
    *(unsigned char *)(result + 12) = *(unsigned char *)(a3 + 4);
    *(_DWORD *)(result + 16) = *(_DWORD *)(a3 + 8);
    *(unsigned char *)(result + 20) = *(unsigned char *)(a3 + 12);
    *(_DWORD *)(result + 24) = *(_DWORD *)(a3 + 16);
    *(unsigned char *)(result + 28) = *(unsigned char *)(a3 + 20);
    *(_DWORD *)(result + 32) = *(_DWORD *)(a3 + 24);
    *(unsigned char *)(result + 36) = *(unsigned char *)(a3 + 28);
  }
  if (result + 40 != a4)
  {
    *(_DWORD *)(result + 40) = *(_DWORD *)a4;
    *(unsigned char *)(result + 44) = *(unsigned char *)(a4 + 4);
    *(_DWORD *)(result + 48) = *(_DWORD *)(a4 + 8);
    *(unsigned char *)(result + 52) = *(unsigned char *)(a4 + 12);
    *(_DWORD *)(result + 56) = *(_DWORD *)(a4 + 16);
    *(unsigned char *)(result + 60) = *(unsigned char *)(a4 + 20);
    *(_DWORD *)(result + 64) = *(_DWORD *)(a4 + 24);
    *(unsigned char *)(result + 68) = *(unsigned char *)(a4 + 28);
  }
  return result;
}

void *sub_100030E18(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if ((result[1] & 0x80000000) == 0)
  {
    unint64_t v4 = result;
    if (*((int *)result + 6) >= 1 && *((_DWORD *)result + 8) >= 1 && (result[2] & 0x80000000) == 0)
    {
      if (*((unsigned char *)result + 12))
      {
        if (*((unsigned char *)result + 28))
        {
          if (*((unsigned char *)result + 36))
          {
            if (*((unsigned char *)result + 20))
            {
              if ((result[5] & 0x80000000) == 0
                && *((int *)result + 14) >= 1
                && *((int *)result + 16) >= 1
                && (result[6] & 0x80000000) == 0)
              {
                if (*((unsigned char *)result + 44))
                {
                  if (*((unsigned char *)result + 60))
                  {
                    if (*((unsigned char *)result + 68))
                    {
                      if (a4)
                      {
                        if (*((unsigned char *)result + 52))
                        {
                          uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)a4 + 56))(a4);
                          uint64_t v51 = 0;
                          unint64_t result = (*(void *(**)(uint64_t *__return_ptr, uint64_t, uint64_t, uint64_t *))(*(void *)a4 + 32))(v50, a4, v9, &v51);
                          if (v51)
                          {
                            if (v51 == v9)
                            {
                              uint64_t v10 = v50[0];
                              unint64_t v11 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 40))(a2);
                              uint64_t v12 = (int)v4[4];
                              unint64_t result = (void *)(*(uint64_t (**)(uint64_t))(*(void *)a2 + 56))(a2);
                              uint64_t v13 = (unint64_t)result + v11 >= v11 ? (char *)result + v11 : 0;
                              unint64_t v14 = v11 + v12;
                              BOOL v15 = v11 + v12 >= v11 && v14 > (unint64_t)v13;
                              BOOL v16 = !v15;
                              if (v11 - 1 < (unint64_t)result + v11 && v14 >= v11 && v16)
                              {
                                uint64_t v17 = (int)v4[4];
                                unint64_t result = (void *)(*(uint64_t (**)(uint64_t))(*(void *)a2 + 48))(a2);
                                unsigned int v18 = v4[6];
                                if ((v18 & 0x80000000) == 0)
                                {
                                  unint64_t v19 = v11 + v17;
                                  unsigned int v20 = (int)result >= 0 ? result : -(int)result;
                                  unint64_t result = (void *)(*(uint64_t (**)(uint64_t))(*(void *)a2 + 56))(a2);
                                  float v21 = (unint64_t)result + v19 < v19 ? 0 : (char *)result + v19;
                                  unint64_t v22 = v19 + v18 * (unint64_t)v20;
                                  BOOL v23 = v22 > (unint64_t)v21 && v22 >= v19;
                                  BOOL v24 = !v23;
                                  if ((unint64_t)result + v19 >= v19 && v22 >= v19 && v24)
                                  {
                                    uint64_t v25 = (int)v4[6];
                                    v49[0] = v19;
                                    v49[1] = v25;
                                    void v49[2] = (int)v4[8];
                                    v49[3] = (*(int (**)(uint64_t))(*(void *)a2 + 48))(a2);
                                    uint64_t v47 = 0;
                                    int v26 = v4[14];
                                    if ((v26 & 0x80000000) == 0) {
                                      uint64_t v47 = v4[14];
                                    }
                                    BOOL v48 = v26 >= 0;
                                    int v27 = (*(uint64_t (**)(uint64_t))(*(void *)a3 + 48))(a3);
                                    if (v27 >= 0) {
                                      uint64_t v28 = v27;
                                    }
                                    else {
                                      uint64_t v28 = -v27;
                                    }
                                    uint64_t v45 = v28;
                                    char v46 = 1;
                                    uint64_t v29 = v4[16];
                                    if ((v29 & 0x80000000) != 0)
                                    {
                                      int v31 = 0;
                                      unint64_t v30 = v28 + -(int)v29;
                                    }
                                    else if (v28 >= v29)
                                    {
                                      int v31 = 0;
                                      unint64_t v30 = v28 - v29;
                                    }
                                    else
                                    {
                                      unint64_t v30 = 0;
                                      int v31 = 1;
                                    }
                                    unint64_t result = (void *)sub_10002DC24(&v47, &v45);
                                    if (v32) {
                                      int v33 = v31;
                                    }
                                    else {
                                      int v33 = 1;
                                    }
                                    unint64_t v34 = (char *)result - v30;
                                    if ((unint64_t)result < v30) {
                                      unint64_t v34 = 0;
                                    }
                                    if (v33) {
                                      unint64_t v35 = 0;
                                    }
                                    else {
                                      unint64_t v35 = v34;
                                    }
                                    if (v48)
                                    {
                                      if (v46)
                                      {
                                        if (!v33 && v30 <= (unint64_t)result)
                                        {
                                          uint64_t v44 = 0;
                                          unint64_t result = (*(void *(**)(unint64_t *__return_ptr, uint64_t, char *, char **))(*(void *)a3 + 32))(v43, a3, v35, &v44);
                                          if (v35 == v44)
                                          {
                                            unint64_t v36 = v43[0];
                                            unint64_t result = (void *)(*(uint64_t (**)(uint64_t))(*(void *)a3 + 56))(a3);
                                            if ((unint64_t)result + v36 >= v36) {
                                              BOOL v37 = (char *)result + v36;
                                            }
                                            else {
                                              BOOL v37 = 0;
                                            }
                                            unint64_t v38 = (unint64_t)&v35[v36];
                                            BOOL v40 = (unint64_t)&v35[v36] < v36 || v38 <= (unint64_t)v37;
                                            if (v36 - 1 < (unint64_t)result + v36 && v38 >= v36 && v40)
                                            {
                                              uint64_t v41 = (int)v4[14];
                                              v42[0] = v36;
                                              v42[1] = v41;
                                              void v42[2] = (int)v4[16];
                                              v42[3] = v45;
                                              return (void *)(*(uint64_t (**)(_DWORD *, void *, void *, uint64_t))(*(void *)v4 + 32))(v4, v49, v42, v10);
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_100031288()
{
}

BOOL sub_10003129C(int a1, vImage_Buffer *src, vImage_Buffer *dest, void *tempBuffer)
{
  return vImageScale_Planar8(src, dest, tempBuffer, 0x10u) == 0;
}

uint64_t sub_1000312CC(uint64_t a1, void *a2)
{
  *(void *)a1 = off_100070BD8;
  if (*(unsigned char *)(a1 + 64))
  {
    if (*(void *)(a1 + 56))
    {
      uint64_t v3 = *(void *)(a1 + 80);
      if (v3)
      {
        Madusa::MemoryMaster::DeAllocateBuffer(v3, a2);
        uint64_t v6 = 0;
        memset(v5, 0, sizeof(v5));
        sub_10002F98C(a1 + 16, (unint64_t *)v5, (unint64_t *)v5, 0, 0);
      }
    }
  }
  return a1;
}

void sub_100031358(uint64_t a1, void *a2)
{
  *(void *)a1 = off_100070BD8;
  if (*(unsigned char *)(a1 + 64) && *(void *)(a1 + 56))
  {
    uint64_t v3 = *(void *)(a1 + 80);
    if (v3)
    {
      Madusa::MemoryMaster::DeAllocateBuffer(v3, a2);
      uint64_t v5 = 0;
      memset(v4, 0, sizeof(v4));
      sub_10002F98C(a1 + 16, (unint64_t *)v4, (unint64_t *)v4, 0, 0);
    }
  }
  operator delete();
}

void *sub_1000313F8(uint64_t a1, Madusa::ImageProperties *this, long long *a3, int *a4)
{
  unint64_t result = (void *)Madusa::ImageProperties::HasValidColorComponents(this);
  if (result)
  {
    uint64_t v44 = 0;
    char v45 = 1;
    int v46 = 0;
    char v47 = 1;
    uint64_t v42 = 0;
    char v43 = 1;
    v40[0] = off_100070C28;
    v40[1] = 0;
    char v41 = 1;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v50 = 0;
    Madusa::ImageProperties::GetPixelDataBaseAddrs((__n128 *)this, &v22);
    Madusa::ImageProperties::GetPixelData(this, (uint64_t)&v38);
    uint64_t v9 = *(void *)Madusa::ImageProperties::GetImagePlaneSize(this);
    YStride = (int *)Madusa::ImageProperties::GetYStride(this);
    sub_10002F98C((uint64_t)v40, v22.n128_u64, (unint64_t *)&v38, v9, *YStride);
    v22.n128_u32[2] = 0;
    v22.n128_u8[12] = 1;
    int v23 = 0;
    char v24 = 1;
    int v25 = 0;
    char v26 = 1;
    int v27 = 0;
    char v28 = 1;
    int v29 = 0;
    char v30 = 1;
    int v31 = 0;
    char v32 = 1;
    int v33 = 0;
    char v34 = 1;
    int v35 = 0;
    char v36 = 1;
    *(void *)&long long v11 = 0x100000001;
    *((void *)&v11 + 1) = 0x100000001;
    long long v37 = v11;
    long long v12 = a3[1];
    long long v38 = *a3;
    v22.n128_u64[0] = (unint64_t)off_100070C88;
    long long v39 = v12;
    if (Madusa::ImageProperties::ShouldDownsample(this))
    {
      uint64_t v20 = 0x100000001;
      uint64_t v21 = 0x100000001;
      Madusa::ImageProperties::GetDownsampleRatios(this, (Madusa::Ratio *)&v20, (Madusa::Ratio *)&v21);
      sub_10002FBFC(a4, (int *)&v20, (int *)&v21, &v13);
      LODWORD(v38) = v13;
      BYTE4(v38) = BYTE4(v13);
      DWORD2(v38) = v14;
      BYTE12(v38) = v15;
      LODWORD(v39) = v16;
      BYTE4(v39) = v17;
      DWORD2(v39) = v18;
      BYTE12(v39) = v19;
    }
    sub_10002FEF4((uint64_t)&v22, this, (uint64_t)&v38, (uint64_t)a4);
    return sub_100031604(&v22, (uint64_t)v40, *(void *)(a1 + 8));
  }
  return result;
}

void *sub_100031604(void *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (uint64_t)(result + 1);
  if ((result[1] & 0x80000000) == 0)
  {
    int v4 = *((_DWORD *)result + 6);
    int v5 = *((_DWORD *)result + 8);
    if (v4 >= 1 && v5 >= 1)
    {
      int v7 = result;
      if ((result[2] & 0x80000000) == 0
        && *((unsigned char *)result + 12)
        && *((unsigned char *)result + 28)
        && *((unsigned char *)result + 36)
        && *((unsigned char *)result + 20)
        && (result[5] & 0x80000000) == 0
        && *((int *)result + 14) >= 1
        && *((int *)result + 16) >= 1
        && (result[6] & 0x80000000) == 0
        && *((unsigned char *)result + 44)
        && *((unsigned char *)result + 60)
        && *((unsigned char *)result + 68)
        && *((unsigned char *)result + 52)
        && *((int *)result + 22) >= 1
        && *((int *)result + 23) >= 1
        && *((int *)result + 24) >= 1
        && *((int *)result + 25) >= 1)
      {
        int v11 = *((_DWORD *)result + 18);
        int v10 = *((_DWORD *)result + 19);
        if (v10 < 0) {
          int v10 = -v10;
        }
        unint64_t v12 = v5 * (unint64_t)v10;
        if (v11 >= 0) {
          unsigned int v13 = *((_DWORD *)result + 18);
        }
        else {
          unsigned int v13 = -v11;
        }
        unint64_t v14 = v4 * (unint64_t)v13;
        if (v12 <= v14) {
          unint64_t v15 = v14;
        }
        else {
          unint64_t v15 = v12;
        }
        uint64_t v41 = 0;
        unint64_t result = (*(void *(**)(uint64_t *__return_ptr, uint64_t, unint64_t, uint64_t *))(*(void *)a2 + 32))(v40, a2, v15, &v41);
        if (v41 == v15)
        {
          sub_100031B88(v7, v40);
          uint64_t v38 = 0;
          int v16 = v7[14];
          if ((v16 & 0x80000000) == 0) {
            uint64_t v38 = v7[14];
          }
          BOOL v39 = v16 >= 0;
          uint64_t v17 = (*(uint64_t (**)(uint64_t))(*(void *)a3 + 48))(a3);
          uint64_t v18 = v17;
          if ((int)v17 >= 0) {
            uint64_t v19 = v17;
          }
          else {
            uint64_t v19 = -(int)v17;
          }
          uint64_t v36 = v19;
          char v37 = 1;
          unint64_t result = (void *)sub_10002DC24(&v38, &v36);
          if (v20)
          {
            uint64_t v21 = result;
            int v35 = 0;
            unint64_t result = (*(void *(**)(uint64_t *__return_ptr, uint64_t, void *, void **))(*(void *)a3 + 32))(v34, a3, result, &v35);
            if (v21 == v35)
            {
              uint64_t v33 = v34[0];
              int v23 = v7[18];
              int v22 = v7[19];
              uint64_t v31 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 64))(a2);
              uint64_t v32 = v24;
              uint64_t v29 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 72))(a2);
              uint64_t v30 = v25;
              int v26 = sub_1000308B8((int)v7, v40, v22, v23, v3, (Madusa::ImageProperties *)0x20, &v31, &v29);
              uint64_t v31 = (*(uint64_t (**)(uint64_t))(*(void *)a3 + 64))(a3);
              uint64_t v32 = v27;
              uint64_t v29 = (*(uint64_t (**)(uint64_t))(*(void *)a3 + 72))(a3);
              uint64_t v30 = v28;
              unint64_t result = (void *)sub_1000308B8((int)v7, v34, 1, v18, (uint64_t)(v7 + 10), (Madusa::ImageProperties *)8, &v31, &v29);
              if (v26)
              {
                if (result) {
                  return (void *)(*(uint64_t (**)(_DWORD *, uint64_t, uint64_t, uint64_t *, uint64_t *))(*(void *)v7 + 32))(v7, v38, v18, &v33, v40);
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_10003198C()
{
}

_DWORD *sub_1000319A0(_DWORD *result, uint64_t a2, int a3, void *a4, void *a5)
{
  if (a2)
  {
    unint64_t v5 = 0;
    unint64_t v6 = 0;
    int v7 = result[19] / 4;
    uint64_t v8 = result[16];
    int v9 = result[18];
    int v10 = v9 + 3;
    if (v9 >= 0) {
      int v10 = result[18];
    }
    uint64_t v11 = a3;
    uint64_t v12 = (uint64_t)v10 >> 2;
    while (1)
    {
      if ((int)v8 >= 1)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          uint64_t v14 = 4 * result[22] * (int)i / result[23] * v7;
          float v15 = fminf((float)((float)(*(float *)(a5[1] + v14) + *(float *)(*a5 + v14)) + *(float *)(a5[2] + v14)) * 85.0, 255.0);
          if (v15 <= 0.0) {
            float v16 = 0.5;
          }
          else {
            float v16 = v15 + 0.5;
          }
          int v17 = (int)v16;
          if ((int)v16 >= 255) {
            int v17 = 255;
          }
          *(unsigned char *)(*a4 + i) = dword_10006F010[v17 & ~(v17 >> 31)];
        }
      }
      *a4 += v11;
      unint64_t v19 = (int)result[24];
      unint64_t v18 = (int)result[25];
      unint64_t v20 = v5 + 1;
      if ((v19 & 0x80000000) != 0)
      {
        if (v5 > 0xFFFFFFFE) {
          return result;
        }
        unint64_t v21 = HIDWORD(v19) * v20;
        if (v21)
        {
LABEL_17:
          if (HIDWORD(v21)) {
            return result;
          }
          unint64_t v22 = v19 * (unint64_t)v20;
          BOOL v23 = __CFADD__(v22, v21 << 32);
          unint64_t v24 = v22 + (v21 << 32);
          if (v23) {
            return result;
          }
          goto LABEL_24;
        }
      }
      else if (v5 >= 0xFFFFFFFF)
      {
        unint64_t v21 = HIDWORD(v20) * v19;
        if (v21) {
          goto LABEL_17;
        }
      }
      unint64_t v24 = v19 * (unint64_t)v20;
LABEL_24:
      if (!v18) {
        return result;
      }
      if (v24)
      {
        unint64_t v25 = v24 / v18;
        if (v6 > v25) {
          return result;
        }
      }
      else
      {
        unint64_t v25 = 0;
        if (v6) {
          return result;
        }
      }
      BOOL v23 = v25 >= v6;
      int v26 = v25 - v6;
      if (!v23) {
        int v26 = 0;
      }
      uint64_t v27 = v26 * (uint64_t)(int)v12;
      if (v27 == (int)v27)
      {
        if (*a5) {
          *a5 += 4 * v27;
        }
        uint64_t v28 = a5[1];
        if (v28) {
          a5[1] = v28 + 4 * v27;
        }
        uint64_t v29 = a5[2];
        if (v29) {
          a5[2] = v29 + 4 * v27;
        }
        uint64_t v30 = a5[3];
        if (v30) {
          a5[3] = v30 + 4 * v27;
        }
        uint64_t v31 = a5[4];
        if (v31) {
          a5[4] = v31 + 4 * v27;
        }
        unint64_t v5 = v20;
        unint64_t v6 = v25;
        if (v20 != a2) {
          continue;
        }
      }
      return result;
    }
  }
  return result;
}

_DWORD *sub_100031B88(_DWORD *result, void *a2)
{
  if (*a2)
  {
    uint64_t v2 = (int)result[21] * (uint64_t)(result[19] / 4);
    if (v2 != (int)v2) {
      return result;
    }
    uint64_t v3 = (int)result[20] * (uint64_t)(result[18] / 4);
    if (v3 != (int)v3) {
      return result;
    }
    *a2 += 4 * v2 + 4 * v3;
  }
  uint64_t v4 = a2[1];
  if (v4)
  {
    uint64_t v5 = (int)result[21] * (uint64_t)(result[19] / 4);
    if (v5 != (int)v5) {
      return result;
    }
    uint64_t v6 = (int)result[20] * (uint64_t)(result[18] / 4);
    if (v6 != (int)v6) {
      return result;
    }
    a2[1] = v4 + 4 * v5 + 4 * v6;
  }
  uint64_t v7 = a2[2];
  if (v7)
  {
    uint64_t v8 = (int)result[21] * (uint64_t)(result[19] / 4);
    if (v8 != (int)v8) {
      return result;
    }
    uint64_t v9 = (int)result[20] * (uint64_t)(result[18] / 4);
    if (v9 != (int)v9) {
      return result;
    }
    a2[2] = v7 + 4 * v8 + 4 * v9;
  }
  uint64_t v10 = a2[3];
  if (v10)
  {
    uint64_t v11 = (int)result[21] * (uint64_t)(result[19] / 4);
    if (v11 != (int)v11) {
      return result;
    }
    uint64_t v12 = (int)result[20] * (uint64_t)(result[18] / 4);
    if (v12 != (int)v12) {
      return result;
    }
    a2[3] = v10 + 4 * v11 + 4 * v12;
  }
  uint64_t v13 = a2[4];
  if (v13)
  {
    uint64_t v14 = (int)result[21] * (uint64_t)(result[19] / 4);
    if (v14 == (int)v14)
    {
      uint64_t v15 = (int)result[20] * (uint64_t)(result[18] / 4);
      if (v15 == (int)v15) {
        a2[4] = v13 + 4 * v14 + 4 * v15;
      }
    }
  }
  return result;
}

uint64_t sub_100031D58(uint64_t a1, void *a2)
{
  *(void *)a1 = off_100070CC0;
  if (*(unsigned char *)(a1 + 64))
  {
    if (*(void *)(a1 + 56))
    {
      uint64_t v3 = *(void *)(a1 + 80);
      if (v3)
      {
        Madusa::MemoryMaster::DeAllocateBuffer(v3, a2);
        uint64_t v6 = 0;
        memset(v5, 0, sizeof(v5));
        sub_10002F98C(a1 + 16, (unint64_t *)v5, (unint64_t *)v5, 0, 0);
      }
    }
  }
  return a1;
}

void sub_100031DE4(uint64_t a1, void *a2)
{
  *(void *)a1 = off_100070CC0;
  if (*(unsigned char *)(a1 + 64) && *(void *)(a1 + 56))
  {
    uint64_t v3 = *(void *)(a1 + 80);
    if (v3)
    {
      Madusa::MemoryMaster::DeAllocateBuffer(v3, a2);
      uint64_t v5 = 0;
      memset(v4, 0, sizeof(v4));
      sub_10002F98C(a1 + 16, (unint64_t *)v4, (unint64_t *)v4, 0, 0);
    }
  }
  operator delete();
}

void *sub_100031E84(uint64_t a1, Madusa::ImageProperties *this, long long *a3, int *a4)
{
  unint64_t result = (void *)Madusa::ImageProperties::HasValidColorComponents(this);
  if (result)
  {
    uint64_t v44 = 0;
    char v45 = 1;
    int v46 = 0;
    char v47 = 1;
    uint64_t v42 = 0;
    char v43 = 1;
    v40[0] = off_100070B08;
    v40[1] = 0;
    char v41 = 1;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v50 = 0;
    Madusa::ImageProperties::GetPixelDataBaseAddrs((__n128 *)this, &v22);
    Madusa::ImageProperties::GetPixelData(this, (uint64_t)&v38);
    uint64_t v9 = *(void *)Madusa::ImageProperties::GetImagePlaneSize(this);
    YStride = (int *)Madusa::ImageProperties::GetYStride(this);
    sub_10002F98C((uint64_t)v40, v22.n128_u64, (unint64_t *)&v38, v9, *YStride);
    v22.n128_u32[2] = 0;
    v22.n128_u8[12] = 1;
    int v23 = 0;
    char v24 = 1;
    int v25 = 0;
    char v26 = 1;
    int v27 = 0;
    char v28 = 1;
    int v29 = 0;
    char v30 = 1;
    int v31 = 0;
    char v32 = 1;
    int v33 = 0;
    char v34 = 1;
    int v35 = 0;
    char v36 = 1;
    *(void *)&long long v11 = 0x100000001;
    *((void *)&v11 + 1) = 0x100000001;
    long long v37 = v11;
    long long v12 = a3[1];
    long long v38 = *a3;
    v22.n128_u64[0] = (unint64_t)off_100070D10;
    long long v39 = v12;
    if (Madusa::ImageProperties::ShouldDownsample(this))
    {
      uint64_t v20 = 0x100000001;
      uint64_t v21 = 0x100000001;
      Madusa::ImageProperties::GetDownsampleRatios(this, (Madusa::Ratio *)&v20, (Madusa::Ratio *)&v21);
      sub_10002FBFC(a4, (int *)&v20, (int *)&v21, &v13);
      LODWORD(v38) = v13;
      BYTE4(v38) = BYTE4(v13);
      DWORD2(v38) = v14;
      BYTE12(v38) = v15;
      LODWORD(v39) = v16;
      BYTE4(v39) = v17;
      DWORD2(v39) = v18;
      BYTE12(v39) = v19;
    }
    sub_10002FEF4((uint64_t)&v22, this, (uint64_t)&v38, (uint64_t)a4);
    return sub_10003005C(&v22, (uint64_t)v40, *(void *)(a1 + 8));
  }
  return result;
}

_DWORD *sub_100032090(_DWORD *result, uint64_t a2, int a3, void *a4, void *a5)
{
  if (a2)
  {
    unint64_t v5 = 0;
    unint64_t v6 = 0;
    int v7 = result[19] / 2;
    int v8 = result[18];
    uint64_t v9 = result[16];
    if (v8 >= 0) {
      int v10 = result[18];
    }
    else {
      int v10 = v8 + 1;
    }
    uint64_t v11 = (uint64_t)v10 >> 1;
    while (1)
    {
      if ((int)v9 >= 1)
      {
        for (uint64_t i = 0; v9 != i; ++i)
        {
          LODWORD(v15) = result[22] * (int)i / result[23] * v7;
          unsigned int v16 = *(unsigned __int16 *)(*a5 + 2 * (int)v15);
          float v17 = 0.0;
          float v18 = 0.0;
          if (v16 == 0x7FFF)
          {
            uint64_t v15 = (int)v15;
            unsigned int v19 = *(unsigned __int16 *)(a5[1] + 2 * (int)v15);
            if (v19 != 0x7FFF) {
              goto LABEL_22;
            }
          }
          else
          {
            int v22 = (v16 << 13) & 0xF800000;
            float v23 = COERCE_FLOAT(((v16 << 13) & 0xFFFE000) + 947912704) + -0.000061035;
            if (v22) {
              LODWORD(v23) = ((v16 << 13) & 0xFFFE000) + 939524096;
            }
            int v24 = (v16 << 13) | 0x70000000;
            if (v22 != 260046848) {
              int v24 = LODWORD(v23);
            }
            LODWORD(v18) = v24 | (v16 >> 15 << 31);
            uint64_t v15 = (int)v15;
            unsigned int v19 = *(unsigned __int16 *)(a5[1] + 2 * (int)v15);
            if (v19 != 0x7FFF)
            {
LABEL_22:
              int v25 = (v19 << 13) & 0xF800000;
              float v26 = COERCE_FLOAT(((v19 << 13) & 0xFFFE000) + 947912704) + -0.000061035;
              if (v25) {
                LODWORD(v26) = ((v19 << 13) & 0xFFFE000) + 939524096;
              }
              int v27 = (v19 << 13) | 0x70000000;
              if (v25 != 260046848) {
                int v27 = LODWORD(v26);
              }
              LODWORD(v17) = v27 | (v19 >> 15 << 31);
              unsigned int v20 = *(unsigned __int16 *)(a5[2] + 2 * v15);
              float v21 = 0.0;
              if (v20 == 0x7FFF) {
                goto LABEL_9;
              }
LABEL_27:
              int v28 = (v20 << 13) & 0xF800000;
              float v29 = COERCE_FLOAT(((v20 << 13) & 0xFFFE000) + 947912704) + -0.000061035;
              if (v28) {
                LODWORD(v29) = ((v20 << 13) & 0xFFFE000) + 939524096;
              }
              int v30 = (v20 << 13) | 0x70000000;
              if (v28 != 260046848) {
                int v30 = LODWORD(v29);
              }
              LODWORD(v21) = v30 | (v20 >> 15 << 31);
              goto LABEL_9;
            }
          }
          unsigned int v20 = *(unsigned __int16 *)(a5[2] + 2 * v15);
          float v21 = 0.0;
          if (v20 != 0x7FFF) {
            goto LABEL_27;
          }
LABEL_9:
          float v13 = fminf((float)((float)(v17 + v18) + v21) * 85.0, 255.0);
          if (v13 <= 0.0) {
            float v14 = 0.5;
          }
          else {
            float v14 = v13 + 0.5;
          }
          *(unsigned char *)(*a4 + i) = (int)v14;
        }
      }
      *a4 += a3;
      unint64_t v32 = (int)result[24];
      unint64_t v31 = (int)result[25];
      unint64_t v33 = v5 + 1;
      if ((v32 & 0x80000000) != 0)
      {
        if (v5 > 0xFFFFFFFE) {
          return result;
        }
        unint64_t v34 = HIDWORD(v32) * v33;
        if (v34)
        {
LABEL_35:
          if (HIDWORD(v34)) {
            return result;
          }
          unint64_t v35 = v32 * (unint64_t)v33;
          BOOL v36 = __CFADD__(v35, v34 << 32);
          unint64_t v37 = v35 + (v34 << 32);
          if (v36) {
            return result;
          }
          goto LABEL_42;
        }
      }
      else if (v5 >= 0xFFFFFFFF)
      {
        unint64_t v34 = HIDWORD(v33) * v32;
        if (v34) {
          goto LABEL_35;
        }
      }
      unint64_t v37 = v32 * (unint64_t)v33;
LABEL_42:
      if (!v31) {
        return result;
      }
      if (v37)
      {
        unint64_t v38 = v37 / v31;
        if (v6 > v38) {
          return result;
        }
      }
      else
      {
        unint64_t v38 = 0;
        if (v6) {
          return result;
        }
      }
      BOOL v36 = v38 >= v6;
      int v39 = v38 - v6;
      if (!v36) {
        int v39 = 0;
      }
      uint64_t v40 = v39 * (uint64_t)(int)v11;
      if (v40 == (int)v40)
      {
        if (*a5) {
          *a5 += 2 * v40;
        }
        uint64_t v41 = a5[1];
        if (v41) {
          a5[1] = v41 + 2 * v40;
        }
        uint64_t v42 = a5[2];
        if (v42) {
          a5[2] = v42 + 2 * v40;
        }
        uint64_t v43 = a5[3];
        if (v43) {
          a5[3] = v43 + 2 * v40;
        }
        uint64_t v44 = a5[4];
        if (v44) {
          a5[4] = v44 + 2 * v40;
        }
        unint64_t v5 = v33;
        unint64_t v6 = v38;
        if (v33 != a2) {
          continue;
        }
      }
      return result;
    }
  }
  return result;
}

uint64_t sub_1000323A8(uint64_t a1, void *a2)
{
  *(void *)a1 = off_100070D48;
  if (*(unsigned char *)(a1 + 64))
  {
    if (*(void *)(a1 + 56))
    {
      uint64_t v3 = *(void *)(a1 + 80);
      if (v3)
      {
        Madusa::MemoryMaster::DeAllocateBuffer(v3, a2);
        uint64_t v6 = 0;
        memset(v5, 0, sizeof(v5));
        sub_10002F98C(a1 + 16, (unint64_t *)v5, (unint64_t *)v5, 0, 0);
      }
    }
  }
  return a1;
}

void sub_100032434(uint64_t a1, void *a2)
{
  *(void *)a1 = off_100070D48;
  if (*(unsigned char *)(a1 + 64) && *(void *)(a1 + 56))
  {
    uint64_t v3 = *(void *)(a1 + 80);
    if (v3)
    {
      Madusa::MemoryMaster::DeAllocateBuffer(v3, a2);
      uint64_t v5 = 0;
      memset(v4, 0, sizeof(v4));
      sub_10002F98C(a1 + 16, (unint64_t *)v4, (unint64_t *)v4, 0, 0);
    }
  }
  operator delete();
}

void *sub_1000324D4(uint64_t a1, Madusa::ImageProperties *this, long long *a3, int *a4)
{
  unint64_t result = (void *)Madusa::ImageProperties::HasValidColorComponents(this);
  if (result)
  {
    uint64_t v44 = 0;
    char v45 = 1;
    int v46 = 0;
    char v47 = 1;
    uint64_t v42 = 0;
    char v43 = 1;
    v40[0] = off_100070C28;
    v40[1] = 0;
    char v41 = 1;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v50 = 0;
    Madusa::ImageProperties::GetPixelDataBaseAddrs((__n128 *)this, &v22);
    Madusa::ImageProperties::GetPixelData(this, (uint64_t)&v38);
    uint64_t v9 = *(void *)Madusa::ImageProperties::GetImagePlaneSize(this);
    YStride = (int *)Madusa::ImageProperties::GetYStride(this);
    sub_10002F98C((uint64_t)v40, v22.n128_u64, (unint64_t *)&v38, v9, *YStride);
    v22.n128_u32[2] = 0;
    v22.n128_u8[12] = 1;
    int v23 = 0;
    char v24 = 1;
    int v25 = 0;
    char v26 = 1;
    int v27 = 0;
    char v28 = 1;
    int v29 = 0;
    char v30 = 1;
    int v31 = 0;
    char v32 = 1;
    int v33 = 0;
    char v34 = 1;
    int v35 = 0;
    char v36 = 1;
    *(void *)&long long v11 = 0x100000001;
    *((void *)&v11 + 1) = 0x100000001;
    long long v37 = v11;
    long long v12 = a3[1];
    long long v38 = *a3;
    v22.n128_u64[0] = (unint64_t)off_100070D98;
    long long v39 = v12;
    if (Madusa::ImageProperties::ShouldDownsample(this))
    {
      uint64_t v20 = 0x100000001;
      uint64_t v21 = 0x100000001;
      Madusa::ImageProperties::GetDownsampleRatios(this, (Madusa::Ratio *)&v20, (Madusa::Ratio *)&v21);
      sub_10002FBFC(a4, (int *)&v20, (int *)&v21, &v13);
      LODWORD(v38) = v13;
      BYTE4(v38) = BYTE4(v13);
      DWORD2(v38) = v14;
      BYTE12(v38) = v15;
      LODWORD(v39) = v16;
      BYTE4(v39) = v17;
      DWORD2(v39) = v18;
      BYTE12(v39) = v19;
    }
    sub_10002FEF4((uint64_t)&v22, this, (uint64_t)&v38, (uint64_t)a4);
    return sub_100031604(&v22, (uint64_t)v40, *(void *)(a1 + 8));
  }
  return result;
}

_DWORD *sub_1000326E0(_DWORD *result, uint64_t a2, int a3, void *a4, void *a5)
{
  if (a2)
  {
    unint64_t v5 = 0;
    unint64_t v6 = 0;
    int v7 = result[19] / 4;
    uint64_t v8 = result[16];
    int v9 = result[18];
    int v10 = v9 + 3;
    if (v9 >= 0) {
      int v10 = result[18];
    }
    uint64_t v11 = a3;
    uint64_t v12 = (uint64_t)v10 >> 2;
    while (1)
    {
      if ((int)v8 >= 1)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          uint64_t v14 = 4 * result[22] * (int)i / result[23] * v7;
          float v15 = fminf((float)((float)(*(float *)(a5[1] + v14) + *(float *)(*a5 + v14)) + *(float *)(a5[2] + v14)) * 85.0, 255.0);
          if (v15 <= 0.0) {
            float v16 = 0.5;
          }
          else {
            float v16 = v15 + 0.5;
          }
          *(unsigned char *)(*a4 + i) = (int)v16;
        }
      }
      *a4 += v11;
      unint64_t v18 = (int)result[24];
      unint64_t v17 = (int)result[25];
      unint64_t v19 = v5 + 1;
      if ((v18 & 0x80000000) != 0)
      {
        if (v5 > 0xFFFFFFFE) {
          return result;
        }
        unint64_t v20 = HIDWORD(v18) * v19;
        if (v20)
        {
LABEL_15:
          if (HIDWORD(v20)) {
            return result;
          }
          unint64_t v21 = v18 * (unint64_t)v19;
          BOOL v22 = __CFADD__(v21, v20 << 32);
          unint64_t v23 = v21 + (v20 << 32);
          if (v22) {
            return result;
          }
          goto LABEL_22;
        }
      }
      else if (v5 >= 0xFFFFFFFF)
      {
        unint64_t v20 = HIDWORD(v19) * v18;
        if (v20) {
          goto LABEL_15;
        }
      }
      unint64_t v23 = v18 * (unint64_t)v19;
LABEL_22:
      if (!v17) {
        return result;
      }
      if (v23)
      {
        unint64_t v24 = v23 / v17;
        if (v6 > v24) {
          return result;
        }
      }
      else
      {
        unint64_t v24 = 0;
        if (v6) {
          return result;
        }
      }
      BOOL v22 = v24 >= v6;
      int v25 = v24 - v6;
      if (!v22) {
        int v25 = 0;
      }
      uint64_t v26 = v25 * (uint64_t)(int)v12;
      if (v26 == (int)v26)
      {
        if (*a5) {
          *a5 += 4 * v26;
        }
        uint64_t v27 = a5[1];
        if (v27) {
          a5[1] = v27 + 4 * v26;
        }
        uint64_t v28 = a5[2];
        if (v28) {
          a5[2] = v28 + 4 * v26;
        }
        uint64_t v29 = a5[3];
        if (v29) {
          a5[3] = v29 + 4 * v26;
        }
        uint64_t v30 = a5[4];
        if (v30) {
          a5[4] = v30 + 4 * v26;
        }
        unint64_t v5 = v19;
        unint64_t v6 = v24;
        if (v19 != a2) {
          continue;
        }
      }
      return result;
    }
  }
  return result;
}

uint64_t sub_1000328A4(uint64_t a1, void *a2)
{
  *(void *)a1 = off_100070DD0;
  if (*(unsigned char *)(a1 + 64))
  {
    if (*(void *)(a1 + 56))
    {
      uint64_t v3 = *(void *)(a1 + 80);
      if (v3)
      {
        Madusa::MemoryMaster::DeAllocateBuffer(v3, a2);
        uint64_t v6 = 0;
        memset(v5, 0, sizeof(v5));
        sub_10002F98C(a1 + 16, (unint64_t *)v5, (unint64_t *)v5, 0, 0);
      }
    }
  }
  return a1;
}

void sub_100032930(uint64_t a1, void *a2)
{
  *(void *)a1 = off_100070DD0;
  if (*(unsigned char *)(a1 + 64) && *(void *)(a1 + 56))
  {
    uint64_t v3 = *(void *)(a1 + 80);
    if (v3)
    {
      Madusa::MemoryMaster::DeAllocateBuffer(v3, a2);
      uint64_t v5 = 0;
      memset(v4, 0, sizeof(v4));
      sub_10002F98C(a1 + 16, (unint64_t *)v4, (unint64_t *)v4, 0, 0);
    }
  }
  operator delete();
}

void *sub_1000329D0(uint64_t a1, Madusa::ImageProperties *this, long long *a3, int *a4)
{
  unint64_t result = (void *)Madusa::ImageProperties::HasValidColorComponents(this);
  if (result)
  {
    uint64_t v44 = 0;
    char v45 = 1;
    int v46 = 0;
    char v47 = 1;
    uint64_t v42 = 0;
    char v43 = 1;
    v40[0] = off_100070AA8;
    v40[1] = 0;
    char v41 = 1;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v50 = 0;
    Madusa::ImageProperties::GetPixelDataBaseAddrs((__n128 *)this, &v22);
    Madusa::ImageProperties::GetPixelData(this, (uint64_t)&v38);
    uint64_t v9 = *(void *)Madusa::ImageProperties::GetImagePlaneSize(this);
    YStride = (int *)Madusa::ImageProperties::GetYStride(this);
    sub_10002F98C((uint64_t)v40, v22.n128_u64, (unint64_t *)&v38, v9, *YStride);
    v22.n128_u32[2] = 0;
    v22.n128_u8[12] = 1;
    int v23 = 0;
    char v24 = 1;
    int v25 = 0;
    char v26 = 1;
    int v27 = 0;
    char v28 = 1;
    int v29 = 0;
    char v30 = 1;
    int v31 = 0;
    char v32 = 1;
    int v33 = 0;
    char v34 = 1;
    int v35 = 0;
    char v36 = 1;
    *(void *)&long long v11 = 0x100000001;
    *((void *)&v11 + 1) = 0x100000001;
    long long v37 = v11;
    long long v12 = a3[1];
    long long v38 = *a3;
    v22.n128_u64[0] = (unint64_t)off_100070E20;
    long long v39 = v12;
    if (Madusa::ImageProperties::ShouldDownsample(this))
    {
      uint64_t v20 = 0x100000001;
      uint64_t v21 = 0x100000001;
      Madusa::ImageProperties::GetDownsampleRatios(this, (Madusa::Ratio *)&v20, (Madusa::Ratio *)&v21);
      sub_10002FBFC(a4, (int *)&v20, (int *)&v21, &v13);
      LODWORD(v38) = v13;
      BYTE4(v38) = BYTE4(v13);
      DWORD2(v38) = v14;
      BYTE12(v38) = v15;
      LODWORD(v39) = v16;
      BYTE4(v39) = v17;
      DWORD2(v39) = v18;
      BYTE12(v39) = v19;
    }
    sub_10002FEF4((uint64_t)&v22, this, (uint64_t)&v38, (uint64_t)a4);
    return sub_100032BDC(&v22, (uint64_t)v40, *(void *)(a1 + 8));
  }
  return result;
}

void *sub_100032BDC(void *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (uint64_t)(result + 1);
  if ((result[1] & 0x80000000) == 0)
  {
    int v4 = *((_DWORD *)result + 6);
    int v5 = *((_DWORD *)result + 8);
    if (v4 >= 1 && v5 >= 1)
    {
      int v7 = (int *)result;
      if ((result[2] & 0x80000000) == 0
        && *((unsigned char *)result + 12)
        && *((unsigned char *)result + 28)
        && *((unsigned char *)result + 36)
        && *((unsigned char *)result + 20)
        && (result[5] & 0x80000000) == 0
        && *((int *)result + 14) >= 1
        && *((int *)result + 16) >= 1
        && (result[6] & 0x80000000) == 0
        && *((unsigned char *)result + 44)
        && *((unsigned char *)result + 60)
        && *((unsigned char *)result + 68)
        && *((unsigned char *)result + 52)
        && *((int *)result + 22) >= 1
        && *((int *)result + 23) >= 1
        && *((int *)result + 24) >= 1
        && *((int *)result + 25) >= 1)
      {
        int v11 = *((_DWORD *)result + 18);
        int v10 = *((_DWORD *)result + 19);
        if (v10 < 0) {
          int v10 = -v10;
        }
        unint64_t v12 = v5 * (unint64_t)v10;
        if (v11 >= 0) {
          unsigned int v13 = *((_DWORD *)result + 18);
        }
        else {
          unsigned int v13 = -v11;
        }
        unint64_t v14 = v4 * (unint64_t)v13;
        if (v12 <= v14) {
          unint64_t v15 = v14;
        }
        else {
          unint64_t v15 = v12;
        }
        uint64_t v41 = 0;
        unint64_t result = (*(void *(**)(uint64_t *__return_ptr, uint64_t, unint64_t, uint64_t *))(*(void *)a2 + 32))(v40, a2, v15, &v41);
        if (v41 == v15)
        {
          sub_1000330E8(v7, v40);
          uint64_t v38 = 0;
          int v16 = v7[14];
          if ((v16 & 0x80000000) == 0) {
            uint64_t v38 = v7[14];
          }
          BOOL v39 = v16 >= 0;
          uint64_t v17 = (*(uint64_t (**)(uint64_t))(*(void *)a3 + 48))(a3);
          uint64_t v18 = v17;
          if ((int)v17 >= 0) {
            uint64_t v19 = v17;
          }
          else {
            uint64_t v19 = -(int)v17;
          }
          uint64_t v36 = v19;
          char v37 = 1;
          unint64_t result = (void *)sub_10002DC24(&v38, &v36);
          if (v20)
          {
            uint64_t v21 = result;
            int v35 = 0;
            unint64_t result = (*(void *(**)(uint64_t *__return_ptr, uint64_t, void *, void **))(*(void *)a3 + 32))(v34, a3, result, &v35);
            if (v21 == v35)
            {
              uint64_t v33 = v34[0];
              int v23 = v7[18];
              int v22 = v7[19];
              uint64_t v31 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 64))(a2);
              uint64_t v32 = v24;
              uint64_t v29 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 72))(a2);
              uint64_t v30 = v25;
              int v26 = sub_1000308B8((int)v7, v40, v22, v23, v3, (Madusa::ImageProperties *)8, &v31, &v29);
              uint64_t v31 = (*(uint64_t (**)(uint64_t))(*(void *)a3 + 64))(a3);
              uint64_t v32 = v27;
              uint64_t v29 = (*(uint64_t (**)(uint64_t))(*(void *)a3 + 72))(a3);
              uint64_t v30 = v28;
              unint64_t result = (void *)sub_1000308B8((int)v7, v34, 1, v18, (uint64_t)(v7 + 10), (Madusa::ImageProperties *)8, &v31, &v29);
              if (v26)
              {
                if (result) {
                  return (void *)(*(uint64_t (**)(int *, uint64_t, uint64_t, uint64_t *, uint64_t *))(*(void *)v7 + 32))(v7, v38, v18, &v33, v40);
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

_DWORD *sub_100032F64(_DWORD *result, uint64_t a2, int a3, void *a4, void *a5)
{
  if (a2)
  {
    unint64_t v5 = 0;
    unint64_t v6 = 0;
    uint64_t v7 = result[16];
    uint64_t v8 = a3;
    int v9 = result[19];
    int v10 = result[18];
    while (1)
    {
      if ((int)v7 >= 1)
      {
        int v11 = 0;
        for (uint64_t i = 0; i != v7; ++i)
        {
          *(unsigned char *)(*a4 + i) = (341
                               * (*(unsigned __int8 *)(a5[1] + v11 * result[22])
                                + *(unsigned __int8 *)(*a5 + v11 * result[22])
                                + *(unsigned __int8 *)(a5[2] + v11 * result[22]))) >> 10;
          v11 += v9;
        }
      }
      *a4 += v8;
      unint64_t v13 = (int)result[24];
      unint64_t v14 = v5 + 1;
      if ((v13 & 0x80000000) != 0)
      {
        if (v5 > 0xFFFFFFFE) {
          return result;
        }
        unint64_t v15 = HIDWORD(v13) * v14;
        if (v15)
        {
LABEL_13:
          if (HIDWORD(v15)) {
            return result;
          }
          unint64_t v17 = v13 * (unint64_t)v14;
          unint64_t v16 = (v15 << 32) + v17;
          if (v16 < v17) {
            return result;
          }
          goto LABEL_15;
        }
      }
      else if (v5 >= 0xFFFFFFFF)
      {
        unint64_t v15 = HIDWORD(v14) * v13;
        if (v15) {
          goto LABEL_13;
        }
      }
      unint64_t v16 = v13 * (unint64_t)v14;
LABEL_15:
      if (v6 <= v16)
      {
        uint64_t v18 = ((int)v16 - (int)v6) * (uint64_t)v10;
        if (v18 == (int)v18)
        {
          if (*a5) {
            *a5 += v18;
          }
          uint64_t v19 = a5[1];
          if (v19) {
            a5[1] = v19 + v18;
          }
          uint64_t v20 = a5[2];
          if (v20) {
            a5[2] = v20 + v18;
          }
          uint64_t v21 = a5[3];
          if (v21) {
            a5[3] = v21 + v18;
          }
          uint64_t v22 = a5[4];
          if (v22) {
            a5[4] = v22 + v18;
          }
          unint64_t v5 = v14;
          unint64_t v6 = v16;
          if (v14 != a2) {
            continue;
          }
        }
      }
      return result;
    }
  }
  return result;
}

int *sub_1000330E8(int *result, void *a2)
{
  if (*a2)
  {
    uint64_t v2 = result[21] * (uint64_t)result[19];
    if (v2 != (int)v2) {
      return result;
    }
    uint64_t v3 = result[20] * (uint64_t)result[18];
    if (v3 != (int)v3) {
      return result;
    }
    *a2 += v2 + v3;
  }
  uint64_t v4 = a2[1];
  if (v4)
  {
    uint64_t v5 = result[21] * (uint64_t)result[19];
    if (v5 != (int)v5) {
      return result;
    }
    uint64_t v6 = result[20] * (uint64_t)result[18];
    if (v6 != (int)v6) {
      return result;
    }
    a2[1] = v4 + v5 + v6;
  }
  uint64_t v7 = a2[2];
  if (v7)
  {
    uint64_t v8 = result[21] * (uint64_t)result[19];
    if (v8 != (int)v8) {
      return result;
    }
    uint64_t v9 = result[20] * (uint64_t)result[18];
    if (v9 != (int)v9) {
      return result;
    }
    a2[2] = v7 + v8 + v9;
  }
  uint64_t v10 = a2[3];
  if (v10)
  {
    uint64_t v11 = result[21] * (uint64_t)result[19];
    if (v11 != (int)v11) {
      return result;
    }
    uint64_t v12 = result[20] * (uint64_t)result[18];
    if (v12 != (int)v12) {
      return result;
    }
    a2[3] = v10 + v11 + v12;
  }
  uint64_t v13 = a2[4];
  if (v13)
  {
    uint64_t v14 = result[21] * (uint64_t)result[19];
    if (v14 == (int)v14)
    {
      uint64_t v15 = result[20] * (uint64_t)result[18];
      if (v15 == (int)v15) {
        a2[4] = v13 + v14 + v15;
      }
    }
  }
  return result;
}

uint64_t sub_100033218(uint64_t a1, void *a2)
{
  *(void *)a1 = off_100070E58;
  if (*(unsigned char *)(a1 + 64))
  {
    if (*(void *)(a1 + 56))
    {
      uint64_t v3 = *(void *)(a1 + 80);
      if (v3)
      {
        Madusa::MemoryMaster::DeAllocateBuffer(v3, a2);
        uint64_t v6 = 0;
        memset(v5, 0, sizeof(v5));
        sub_10002F98C(a1 + 16, (unint64_t *)v5, (unint64_t *)v5, 0, 0);
      }
    }
  }
  return a1;
}

void sub_1000332A4(uint64_t a1, void *a2)
{
  *(void *)a1 = off_100070E58;
  if (*(unsigned char *)(a1 + 64) && *(void *)(a1 + 56))
  {
    uint64_t v3 = *(void *)(a1 + 80);
    if (v3)
    {
      Madusa::MemoryMaster::DeAllocateBuffer(v3, a2);
      uint64_t v5 = 0;
      memset(v4, 0, sizeof(v4));
      sub_10002F98C(a1 + 16, (unint64_t *)v4, (unint64_t *)v4, 0, 0);
    }
  }
  operator delete();
}

void *sub_100033344(uint64_t a1, Madusa::ImageProperties *this, long long *a3, int *a4)
{
  unint64_t result = (void *)Madusa::ImageProperties::HasValidColorComponents(this);
  if (result)
  {
    uint64_t v44 = 0;
    char v45 = 1;
    int v46 = 0;
    char v47 = 1;
    uint64_t v42 = 0;
    char v43 = 1;
    v40[0] = off_100070B08;
    v40[1] = 0;
    char v41 = 1;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v50 = 0;
    Madusa::ImageProperties::GetPixelDataBaseAddrs((__n128 *)this, &v22);
    Madusa::ImageProperties::GetPixelData(this, (uint64_t)&v38);
    uint64_t v9 = *(void *)Madusa::ImageProperties::GetImagePlaneSize(this);
    YStride = (int *)Madusa::ImageProperties::GetYStride(this);
    sub_10002F98C((uint64_t)v40, v22.n128_u64, (unint64_t *)&v38, v9, *YStride);
    v22.n128_u32[2] = 0;
    v22.n128_u8[12] = 1;
    int v23 = 0;
    char v24 = 1;
    int v25 = 0;
    char v26 = 1;
    int v27 = 0;
    char v28 = 1;
    int v29 = 0;
    char v30 = 1;
    int v31 = 0;
    char v32 = 1;
    int v33 = 0;
    char v34 = 1;
    int v35 = 0;
    char v36 = 1;
    *(void *)&long long v11 = 0x100000001;
    *((void *)&v11 + 1) = 0x100000001;
    long long v37 = v11;
    long long v12 = a3[1];
    long long v38 = *a3;
    v22.n128_u64[0] = (unint64_t)off_100070EA8;
    long long v39 = v12;
    if (Madusa::ImageProperties::ShouldDownsample(this))
    {
      uint64_t v20 = 0x100000001;
      uint64_t v21 = 0x100000001;
      Madusa::ImageProperties::GetDownsampleRatios(this, (Madusa::Ratio *)&v20, (Madusa::Ratio *)&v21);
      sub_10002FBFC(a4, (int *)&v20, (int *)&v21, &v13);
      LODWORD(v38) = v13;
      BYTE4(v38) = BYTE4(v13);
      DWORD2(v38) = v14;
      BYTE12(v38) = v15;
      LODWORD(v39) = v16;
      BYTE4(v39) = v17;
      DWORD2(v39) = v18;
      BYTE12(v39) = v19;
    }
    sub_10002FEF4((uint64_t)&v22, this, (uint64_t)&v38, (uint64_t)a4);
    return sub_10003005C(&v22, (uint64_t)v40, *(void *)(a1 + 8));
  }
  return result;
}

_DWORD *sub_100033550(_DWORD *result, uint64_t a2, int a3, void *a4, void *a5)
{
  if (a2)
  {
    unint64_t v5 = 0;
    unint64_t v6 = 0;
    int v7 = result[19] / 2;
    uint64_t v8 = result[16];
    int v9 = result[18];
    if (v9 >= 0) {
      int v10 = result[18];
    }
    else {
      int v10 = v9 + 1;
    }
    uint64_t v11 = a3;
    uint64_t v12 = (uint64_t)v10 >> 1;
    while (1)
    {
      if ((int)v8 >= 1)
      {
        int v13 = 0;
        for (uint64_t i = 0; i != v8; ++i)
        {
          uint64_t v15 = 2 * v13 * result[22];
          *(unsigned char *)(*a4 + i) = (341
                               * (*(unsigned __int16 *)(a5[1] + v15)
                                + *(unsigned __int16 *)(*a5 + v15)
                                + *(unsigned __int16 *)(a5[2] + v15))) >> 18;
          v13 += v7;
        }
      }
      *a4 += v11;
      unint64_t v16 = (int)result[24];
      unint64_t v17 = v5 + 1;
      if ((v16 & 0x80000000) != 0)
      {
        if (v5 > 0xFFFFFFFE) {
          return result;
        }
        unint64_t v18 = HIDWORD(v16) * v17;
        if (v18)
        {
LABEL_16:
          if (HIDWORD(v18)) {
            return result;
          }
          unint64_t v20 = v16 * (unint64_t)v17;
          unint64_t v19 = (v18 << 32) + v20;
          if (v19 < v20) {
            return result;
          }
          goto LABEL_18;
        }
      }
      else if (v5 >= 0xFFFFFFFF)
      {
        unint64_t v18 = HIDWORD(v17) * v16;
        if (v18) {
          goto LABEL_16;
        }
      }
      unint64_t v19 = v16 * (unint64_t)v17;
LABEL_18:
      if (v6 <= v19)
      {
        uint64_t v21 = ((int)v19 - (int)v6) * (uint64_t)(int)v12;
        if (v21 == (int)v21)
        {
          if (*a5) {
            *a5 += 2 * v21;
          }
          uint64_t v22 = a5[1];
          if (v22) {
            a5[1] = v22 + 2 * v21;
          }
          uint64_t v23 = a5[2];
          if (v23) {
            a5[2] = v23 + 2 * v21;
          }
          uint64_t v24 = a5[3];
          if (v24) {
            a5[3] = v24 + 2 * v21;
          }
          uint64_t v25 = a5[4];
          if (v25) {
            a5[4] = v25 + 2 * v21;
          }
          unint64_t v5 = v17;
          unint64_t v6 = v19;
          if (v17 != a2) {
            continue;
          }
        }
      }
      return result;
    }
  }
  return result;
}

uint64_t sub_1000336EC(uint64_t a1, void *a2)
{
  *(void *)a1 = off_100070EE0;
  if (*(unsigned char *)(a1 + 64))
  {
    if (*(void *)(a1 + 56))
    {
      uint64_t v3 = *(void *)(a1 + 80);
      if (v3)
      {
        Madusa::MemoryMaster::DeAllocateBuffer(v3, a2);
        uint64_t v6 = 0;
        memset(v5, 0, sizeof(v5));
        sub_10002F98C(a1 + 16, (unint64_t *)v5, (unint64_t *)v5, 0, 0);
      }
    }
  }
  return a1;
}

void sub_100033778(uint64_t a1, void *a2)
{
  *(void *)a1 = off_100070EE0;
  if (*(unsigned char *)(a1 + 64) && *(void *)(a1 + 56))
  {
    uint64_t v3 = *(void *)(a1 + 80);
    if (v3)
    {
      Madusa::MemoryMaster::DeAllocateBuffer(v3, a2);
      uint64_t v5 = 0;
      memset(v4, 0, sizeof(v4));
      sub_10002F98C(a1 + 16, (unint64_t *)v4, (unint64_t *)v4, 0, 0);
    }
  }
  operator delete();
}

void *sub_100033818(uint64_t a1, Madusa::ImageProperties *this, long long *a3, int *a4)
{
  unint64_t result = (void *)Madusa::ImageProperties::HasValidColorComponents(this);
  if (result)
  {
    uint64_t v44 = 0;
    char v45 = 1;
    int v46 = 0;
    char v47 = 1;
    uint64_t v42 = 0;
    char v43 = 1;
    v40[0] = off_100070AA8;
    v40[1] = 0;
    char v41 = 1;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v50 = 0;
    Madusa::ImageProperties::GetPixelDataBaseAddrs((__n128 *)this, &v22);
    Madusa::ImageProperties::GetPixelData(this, (uint64_t)&v38);
    uint64_t v9 = *(void *)Madusa::ImageProperties::GetImagePlaneSize(this);
    YStride = (int *)Madusa::ImageProperties::GetYStride(this);
    sub_10002F98C((uint64_t)v40, v22.n128_u64, (unint64_t *)&v38, v9, *YStride);
    v22.n128_u32[2] = 0;
    v22.n128_u8[12] = 1;
    int v23 = 0;
    char v24 = 1;
    int v25 = 0;
    char v26 = 1;
    int v27 = 0;
    char v28 = 1;
    int v29 = 0;
    char v30 = 1;
    int v31 = 0;
    char v32 = 1;
    int v33 = 0;
    char v34 = 1;
    int v35 = 0;
    char v36 = 1;
    *(void *)&long long v11 = 0x100000001;
    *((void *)&v11 + 1) = 0x100000001;
    long long v37 = v11;
    long long v12 = a3[1];
    long long v38 = *a3;
    v22.n128_u64[0] = (unint64_t)off_100070F30;
    long long v39 = v12;
    if (Madusa::ImageProperties::ShouldDownsample(this))
    {
      uint64_t v20 = 0x100000001;
      uint64_t v21 = 0x100000001;
      Madusa::ImageProperties::GetDownsampleRatios(this, (Madusa::Ratio *)&v20, (Madusa::Ratio *)&v21);
      sub_10002FBFC(a4, (int *)&v20, (int *)&v21, &v13);
      LODWORD(v38) = v13;
      BYTE4(v38) = BYTE4(v13);
      DWORD2(v38) = v14;
      BYTE12(v38) = v15;
      LODWORD(v39) = v16;
      BYTE4(v39) = v17;
      DWORD2(v39) = v18;
      BYTE12(v39) = v19;
    }
    sub_10002FEF4((uint64_t)&v22, this, (uint64_t)&v38, (uint64_t)a4);
    return sub_100032BDC(&v22, (uint64_t)v40, *(void *)(a1 + 8));
  }
  return result;
}

_DWORD *sub_100033A24(_DWORD *result, uint64_t a2, int a3, void *a4, void *a5)
{
  if (a2)
  {
    unint64_t v5 = 0;
    unint64_t v6 = 0;
    uint64_t v7 = result[16];
    uint64_t v8 = a3;
    int v10 = result[18];
    int v9 = result[19];
    while (1)
    {
      if ((int)v7 >= 1)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          uint64_t v12 = v9 * (uint64_t)(result[22] * (int)i / result[23]);
          *(unsigned char *)(*a4 + i) = (341
                               * (*(unsigned __int8 *)(a5[1] + v12)
                                + *(unsigned __int8 *)(*a5 + v12)
                                + *(unsigned __int8 *)(a5[2] + v12))) >> 10;
        }
      }
      *a4 += v8;
      unint64_t v14 = (int)result[24];
      unint64_t v13 = (int)result[25];
      unint64_t v15 = v5 + 1;
      if ((v14 & 0x80000000) != 0)
      {
        if (v5 > 0xFFFFFFFE) {
          return result;
        }
        unint64_t v16 = HIDWORD(v14) * v15;
        if (v16)
        {
LABEL_10:
          if (HIDWORD(v16)) {
            return result;
          }
          unint64_t v17 = v14 * (unint64_t)v15;
          BOOL v18 = __CFADD__(v17, v16 << 32);
          unint64_t v19 = v17 + (v16 << 32);
          if (v18) {
            return result;
          }
          goto LABEL_17;
        }
      }
      else if (v5 >= 0xFFFFFFFF)
      {
        unint64_t v16 = HIDWORD(v15) * v14;
        if (v16) {
          goto LABEL_10;
        }
      }
      unint64_t v19 = v14 * (unint64_t)v15;
LABEL_17:
      if (!v13) {
        return result;
      }
      if (v19)
      {
        unint64_t v20 = v19 / v13;
        if (v6 > v20) {
          return result;
        }
      }
      else
      {
        unint64_t v20 = 0;
        if (v6) {
          return result;
        }
      }
      BOOL v18 = v20 >= v6;
      int v21 = v20 - v6;
      if (!v18) {
        int v21 = 0;
      }
      uint64_t v22 = v21 * (uint64_t)v10;
      if (v22 == (int)v22)
      {
        if (*a5) {
          *a5 += v22;
        }
        uint64_t v23 = a5[1];
        if (v23) {
          a5[1] = v23 + v22;
        }
        uint64_t v24 = a5[2];
        if (v24) {
          a5[2] = v24 + v22;
        }
        uint64_t v25 = a5[3];
        if (v25) {
          a5[3] = v25 + v22;
        }
        uint64_t v26 = a5[4];
        if (v26) {
          a5[4] = v26 + v22;
        }
        unint64_t v5 = v15;
        unint64_t v6 = v20;
        if (v15 != a2) {
          continue;
        }
      }
      return result;
    }
  }
  return result;
}

uint64_t sub_100033BA0(uint64_t a1, void *a2)
{
  *(void *)a1 = off_100070F68;
  if (*(unsigned char *)(a1 + 64))
  {
    if (*(void *)(a1 + 56))
    {
      uint64_t v3 = *(void *)(a1 + 80);
      if (v3)
      {
        Madusa::MemoryMaster::DeAllocateBuffer(v3, a2);
        uint64_t v6 = 0;
        memset(v5, 0, sizeof(v5));
        sub_10002F98C(a1 + 16, (unint64_t *)v5, (unint64_t *)v5, 0, 0);
      }
    }
  }
  return a1;
}

void sub_100033C2C(uint64_t a1, void *a2)
{
  *(void *)a1 = off_100070F68;
  if (*(unsigned char *)(a1 + 64) && *(void *)(a1 + 56))
  {
    uint64_t v3 = *(void *)(a1 + 80);
    if (v3)
    {
      Madusa::MemoryMaster::DeAllocateBuffer(v3, a2);
      uint64_t v5 = 0;
      memset(v4, 0, sizeof(v4));
      sub_10002F98C(a1 + 16, (unint64_t *)v4, (unint64_t *)v4, 0, 0);
    }
  }
  operator delete();
}

void *sub_100033CCC(uint64_t a1, Madusa::ImageProperties *this, long long *a3, int *a4)
{
  unint64_t result = (void *)Madusa::ImageProperties::HasValidColorComponents(this);
  if (result)
  {
    uint64_t v44 = 0;
    char v45 = 1;
    int v46 = 0;
    char v47 = 1;
    uint64_t v42 = 0;
    char v43 = 1;
    v40[0] = off_100070B08;
    v40[1] = 0;
    char v41 = 1;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v50 = 0;
    Madusa::ImageProperties::GetPixelDataBaseAddrs((__n128 *)this, &v22);
    Madusa::ImageProperties::GetPixelData(this, (uint64_t)&v38);
    uint64_t v9 = *(void *)Madusa::ImageProperties::GetImagePlaneSize(this);
    YStride = (int *)Madusa::ImageProperties::GetYStride(this);
    sub_10002F98C((uint64_t)v40, v22.n128_u64, (unint64_t *)&v38, v9, *YStride);
    v22.n128_u32[2] = 0;
    v22.n128_u8[12] = 1;
    int v23 = 0;
    char v24 = 1;
    int v25 = 0;
    char v26 = 1;
    int v27 = 0;
    char v28 = 1;
    int v29 = 0;
    char v30 = 1;
    int v31 = 0;
    char v32 = 1;
    int v33 = 0;
    char v34 = 1;
    int v35 = 0;
    char v36 = 1;
    *(void *)&long long v11 = 0x100000001;
    *((void *)&v11 + 1) = 0x100000001;
    long long v37 = v11;
    long long v12 = a3[1];
    long long v38 = *a3;
    v22.n128_u64[0] = (unint64_t)off_100070FB8;
    long long v39 = v12;
    if (Madusa::ImageProperties::ShouldDownsample(this))
    {
      uint64_t v20 = 0x100000001;
      uint64_t v21 = 0x100000001;
      Madusa::ImageProperties::GetDownsampleRatios(this, (Madusa::Ratio *)&v20, (Madusa::Ratio *)&v21);
      sub_10002FBFC(a4, (int *)&v20, (int *)&v21, &v13);
      LODWORD(v38) = v13;
      BYTE4(v38) = BYTE4(v13);
      DWORD2(v38) = v14;
      BYTE12(v38) = v15;
      LODWORD(v39) = v16;
      BYTE4(v39) = v17;
      DWORD2(v39) = v18;
      BYTE12(v39) = v19;
    }
    sub_10002FEF4((uint64_t)&v22, this, (uint64_t)&v38, (uint64_t)a4);
    return sub_10003005C(&v22, (uint64_t)v40, *(void *)(a1 + 8));
  }
  return result;
}

_DWORD *sub_100033ED8(_DWORD *result, uint64_t a2, int a3, void *a4, void *a5)
{
  if (a2)
  {
    unint64_t v5 = 0;
    unint64_t v6 = 0;
    int v7 = result[19] / 2;
    uint64_t v8 = result[16];
    int v9 = result[18];
    if (v9 >= 0) {
      int v10 = result[18];
    }
    else {
      int v10 = v9 + 1;
    }
    uint64_t v11 = a3;
    uint64_t v12 = (uint64_t)v10 >> 1;
    while (1)
    {
      if ((int)v8 >= 1)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          uint64_t v14 = 2 * result[22] * (int)i / result[23] * v7;
          *(unsigned char *)(*a4 + i) = (341
                               * (*(unsigned __int16 *)(a5[1] + v14)
                                + *(unsigned __int16 *)(*a5 + v14)
                                + *(unsigned __int16 *)(a5[2] + v14))) >> 18;
        }
      }
      *a4 += v11;
      unint64_t v16 = (int)result[24];
      unint64_t v15 = (int)result[25];
      unint64_t v17 = v5 + 1;
      if ((v16 & 0x80000000) != 0)
      {
        if (v5 > 0xFFFFFFFE) {
          return result;
        }
        unint64_t v18 = HIDWORD(v16) * v17;
        if (v18)
        {
LABEL_13:
          if (HIDWORD(v18)) {
            return result;
          }
          unint64_t v19 = v16 * (unint64_t)v17;
          BOOL v20 = __CFADD__(v19, v18 << 32);
          unint64_t v21 = v19 + (v18 << 32);
          if (v20) {
            return result;
          }
          goto LABEL_20;
        }
      }
      else if (v5 >= 0xFFFFFFFF)
      {
        unint64_t v18 = HIDWORD(v17) * v16;
        if (v18) {
          goto LABEL_13;
        }
      }
      unint64_t v21 = v16 * (unint64_t)v17;
LABEL_20:
      if (!v15) {
        return result;
      }
      if (v21)
      {
        unint64_t v22 = v21 / v15;
        if (v6 > v22) {
          return result;
        }
      }
      else
      {
        unint64_t v22 = 0;
        if (v6) {
          return result;
        }
      }
      BOOL v20 = v22 >= v6;
      int v23 = v22 - v6;
      if (!v20) {
        int v23 = 0;
      }
      uint64_t v24 = v23 * (uint64_t)(int)v12;
      if (v24 == (int)v24)
      {
        if (*a5) {
          *a5 += 2 * v24;
        }
        uint64_t v25 = a5[1];
        if (v25) {
          a5[1] = v25 + 2 * v24;
        }
        uint64_t v26 = a5[2];
        if (v26) {
          a5[2] = v26 + 2 * v24;
        }
        uint64_t v27 = a5[3];
        if (v27) {
          a5[3] = v27 + 2 * v24;
        }
        uint64_t v28 = a5[4];
        if (v28) {
          a5[4] = v28 + 2 * v24;
        }
        unint64_t v5 = v17;
        unint64_t v6 = v22;
        if (v17 != a2) {
          continue;
        }
      }
      return result;
    }
  }
  return result;
}

uint64_t sub_100034074(uint64_t a1, void *a2)
{
  *(void *)a1 = off_100070FF0;
  if (*(unsigned char *)(a1 + 64))
  {
    if (*(void *)(a1 + 56))
    {
      uint64_t v3 = *(void *)(a1 + 80);
      if (v3)
      {
        Madusa::MemoryMaster::DeAllocateBuffer(v3, a2);
        uint64_t v6 = 0;
        memset(v5, 0, sizeof(v5));
        sub_10002F98C(a1 + 16, (unint64_t *)v5, (unint64_t *)v5, 0, 0);
      }
    }
  }
  return a1;
}

void sub_100034100(uint64_t a1, void *a2)
{
  *(void *)a1 = off_100070FF0;
  if (*(unsigned char *)(a1 + 64) && *(void *)(a1 + 56))
  {
    uint64_t v3 = *(void *)(a1 + 80);
    if (v3)
    {
      Madusa::MemoryMaster::DeAllocateBuffer(v3, a2);
      uint64_t v5 = 0;
      memset(v4, 0, sizeof(v4));
      sub_10002F98C(a1 + 16, (unint64_t *)v4, (unint64_t *)v4, 0, 0);
    }
  }
  operator delete();
}

void *sub_1000341A0(uint64_t a1, Madusa::ImageProperties *this, long long *a3, int *a4)
{
  unint64_t result = (void *)Madusa::ImageProperties::HasValidColorComponents(this);
  if (result)
  {
    uint64_t v44 = 0;
    char v45 = 1;
    int v46 = 0;
    char v47 = 1;
    uint64_t v42 = 0;
    char v43 = 1;
    v40[0] = off_100070AA8;
    v40[1] = 0;
    char v41 = 1;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v50 = 0;
    Madusa::ImageProperties::GetPixelDataBaseAddrs((__n128 *)this, &v22);
    Madusa::ImageProperties::GetPixelData(this, (uint64_t)&v38);
    uint64_t v9 = *(void *)Madusa::ImageProperties::GetImagePlaneSize(this);
    YStride = (int *)Madusa::ImageProperties::GetYStride(this);
    sub_10002F98C((uint64_t)v40, v22.n128_u64, (unint64_t *)&v38, v9, *YStride);
    v22.n128_u32[2] = 0;
    v22.n128_u8[12] = 1;
    int v23 = 0;
    char v24 = 1;
    int v25 = 0;
    char v26 = 1;
    int v27 = 0;
    char v28 = 1;
    int v29 = 0;
    char v30 = 1;
    int v31 = 0;
    char v32 = 1;
    int v33 = 0;
    char v34 = 1;
    int v35 = 0;
    char v36 = 1;
    *(void *)&long long v11 = 0x100000001;
    *((void *)&v11 + 1) = 0x100000001;
    long long v37 = v11;
    long long v12 = a3[1];
    long long v38 = *a3;
    v22.n128_u64[0] = (unint64_t)off_100071040;
    long long v39 = v12;
    if (Madusa::ImageProperties::ShouldDownsample(this))
    {
      uint64_t v20 = 0x100000001;
      uint64_t v21 = 0x100000001;
      Madusa::ImageProperties::GetDownsampleRatios(this, (Madusa::Ratio *)&v20, (Madusa::Ratio *)&v21);
      sub_10002FBFC(a4, (int *)&v20, (int *)&v21, &v13);
      LODWORD(v38) = v13;
      BYTE4(v38) = BYTE4(v13);
      DWORD2(v38) = v14;
      BYTE12(v38) = v15;
      LODWORD(v39) = v16;
      BYTE4(v39) = v17;
      DWORD2(v39) = v18;
      BYTE12(v39) = v19;
    }
    sub_10002FEF4((uint64_t)&v22, this, (uint64_t)&v38, (uint64_t)a4);
    return sub_100032BDC(&v22, (uint64_t)v40, *(void *)(a1 + 8));
  }
  return result;
}

_DWORD *sub_1000343AC(_DWORD *result, uint64_t a2, int a3, void *a4, void *a5)
{
  if (a2)
  {
    unint64_t v5 = 0;
    unint64_t v6 = 0;
    uint64_t v7 = result[16];
    uint64_t v8 = a3;
    int v10 = result[18];
    int v9 = result[19];
    while (1)
    {
      if ((int)v7 >= 1)
      {
        for (uint64_t i = 0; i != v7; ++i)
          *(unsigned char *)(*a4 + i) = *(unsigned char *)(*a5 + v9 * (uint64_t)(result[22] * (int)i / result[23]));
      }
      *a4 += v8;
      unint64_t v12 = (int)result[24];
      unint64_t v13 = (int)result[25];
      unint64_t v14 = v5 + 1;
      if ((v12 & 0x80000000) != 0)
      {
        if (v5 > 0xFFFFFFFE) {
          return result;
        }
        unint64_t v15 = HIDWORD(v12) * v14;
        if (v15)
        {
LABEL_10:
          if (HIDWORD(v15)) {
            return result;
          }
          unint64_t v16 = v12 * (unint64_t)v14;
          BOOL v17 = __CFADD__(v16, v15 << 32);
          unint64_t v18 = v16 + (v15 << 32);
          if (v17) {
            return result;
          }
          goto LABEL_17;
        }
      }
      else if (v5 >= 0xFFFFFFFF)
      {
        unint64_t v15 = HIDWORD(v14) * v12;
        if (v15) {
          goto LABEL_10;
        }
      }
      unint64_t v18 = v12 * (unint64_t)v14;
LABEL_17:
      if (!v13) {
        return result;
      }
      if (v18)
      {
        unint64_t v19 = v18 / v13;
        if (v6 > v19) {
          return result;
        }
      }
      else
      {
        unint64_t v19 = 0;
        if (v6) {
          return result;
        }
      }
      BOOL v17 = v19 >= v6;
      int v20 = v19 - v6;
      if (!v17) {
        int v20 = 0;
      }
      uint64_t v21 = v20 * (uint64_t)v10;
      if (v21 == (int)v21)
      {
        if (*a5) {
          *a5 += v21;
        }
        uint64_t v22 = a5[1];
        if (v22) {
          a5[1] = v22 + v21;
        }
        uint64_t v23 = a5[2];
        if (v23) {
          a5[2] = v23 + v21;
        }
        uint64_t v24 = a5[3];
        if (v24) {
          a5[3] = v24 + v21;
        }
        uint64_t v25 = a5[4];
        if (v25) {
          a5[4] = v25 + v21;
        }
        unint64_t v5 = v14;
        unint64_t v6 = v19;
        if (v14 != a2) {
          continue;
        }
      }
      return result;
    }
  }
  return result;
}

uint64_t sub_100034508(uint64_t a1, void *a2)
{
  *(void *)a1 = off_100071078;
  if (*(unsigned char *)(a1 + 64))
  {
    if (*(void *)(a1 + 56))
    {
      uint64_t v3 = *(void *)(a1 + 80);
      if (v3)
      {
        Madusa::MemoryMaster::DeAllocateBuffer(v3, a2);
        uint64_t v6 = 0;
        memset(v5, 0, sizeof(v5));
        sub_10002F98C(a1 + 16, (unint64_t *)v5, (unint64_t *)v5, 0, 0);
      }
    }
  }
  return a1;
}

void sub_100034594(uint64_t a1, void *a2)
{
  *(void *)a1 = off_100071078;
  if (*(unsigned char *)(a1 + 64) && *(void *)(a1 + 56))
  {
    uint64_t v3 = *(void *)(a1 + 80);
    if (v3)
    {
      Madusa::MemoryMaster::DeAllocateBuffer(v3, a2);
      uint64_t v5 = 0;
      memset(v4, 0, sizeof(v4));
      sub_10002F98C(a1 + 16, (unint64_t *)v4, (unint64_t *)v4, 0, 0);
    }
  }
  operator delete();
}

void *sub_100034634(uint64_t a1, Madusa::ImageProperties *this, long long *a3, int *a4)
{
  unint64_t result = (void *)Madusa::ImageProperties::HasValidColorComponents(this);
  if (result)
  {
    uint64_t v44 = 0;
    char v45 = 1;
    int v46 = 0;
    char v47 = 1;
    uint64_t v42 = 0;
    char v43 = 1;
    v40[0] = off_100070B08;
    v40[1] = 0;
    char v41 = 1;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v50 = 0;
    Madusa::ImageProperties::GetPixelDataBaseAddrs((__n128 *)this, &v22);
    Madusa::ImageProperties::GetPixelData(this, (uint64_t)&v38);
    uint64_t v9 = *(void *)Madusa::ImageProperties::GetImagePlaneSize(this);
    YStride = (int *)Madusa::ImageProperties::GetYStride(this);
    sub_10002F98C((uint64_t)v40, v22.n128_u64, (unint64_t *)&v38, v9, *YStride);
    v22.n128_u32[2] = 0;
    v22.n128_u8[12] = 1;
    int v23 = 0;
    char v24 = 1;
    int v25 = 0;
    char v26 = 1;
    int v27 = 0;
    char v28 = 1;
    int v29 = 0;
    char v30 = 1;
    int v31 = 0;
    char v32 = 1;
    int v33 = 0;
    char v34 = 1;
    int v35 = 0;
    char v36 = 1;
    *(void *)&long long v11 = 0x100000001;
    *((void *)&v11 + 1) = 0x100000001;
    long long v37 = v11;
    long long v12 = a3[1];
    long long v38 = *a3;
    v22.n128_u64[0] = (unint64_t)off_1000710C8;
    long long v39 = v12;
    if (Madusa::ImageProperties::ShouldDownsample(this))
    {
      uint64_t v20 = 0x100000001;
      uint64_t v21 = 0x100000001;
      Madusa::ImageProperties::GetDownsampleRatios(this, (Madusa::Ratio *)&v20, (Madusa::Ratio *)&v21);
      sub_10002FBFC(a4, (int *)&v20, (int *)&v21, &v13);
      LODWORD(v38) = v13;
      BYTE4(v38) = BYTE4(v13);
      DWORD2(v38) = v14;
      BYTE12(v38) = v15;
      LODWORD(v39) = v16;
      BYTE4(v39) = v17;
      DWORD2(v39) = v18;
      BYTE12(v39) = v19;
    }
    sub_10002FEF4((uint64_t)&v22, this, (uint64_t)&v38, (uint64_t)a4);
    return sub_10003005C(&v22, (uint64_t)v40, *(void *)(a1 + 8));
  }
  return result;
}

_DWORD *sub_100034840(_DWORD *result, uint64_t a2, int a3, void *a4, void *a5)
{
  if (a2)
  {
    unint64_t v5 = 0;
    unint64_t v6 = 0;
    int v7 = result[19] / 2;
    uint64_t v8 = result[16];
    int v9 = result[18];
    if (v9 >= 0) {
      int v10 = result[18];
    }
    else {
      int v10 = v9 + 1;
    }
    uint64_t v11 = a3;
    uint64_t v12 = (uint64_t)v10 >> 1;
    while (1)
    {
      if ((int)v8 >= 1)
      {
        for (uint64_t i = 0; i != v8; ++i)
          *(unsigned char *)(*a4 + i) = *(unsigned char *)(*a5 + 2 * result[22] * (int)i / result[23] * v7 + 1);
      }
      *a4 += v11;
      unint64_t v14 = (int)result[24];
      unint64_t v15 = (int)result[25];
      unint64_t v16 = v5 + 1;
      if ((v14 & 0x80000000) != 0)
      {
        if (v5 > 0xFFFFFFFE) {
          return result;
        }
        unint64_t v17 = HIDWORD(v14) * v16;
        if (v17)
        {
LABEL_13:
          if (HIDWORD(v17)) {
            return result;
          }
          unint64_t v18 = v14 * (unint64_t)v16;
          BOOL v19 = __CFADD__(v18, v17 << 32);
          unint64_t v20 = v18 + (v17 << 32);
          if (v19) {
            return result;
          }
          goto LABEL_20;
        }
      }
      else if (v5 >= 0xFFFFFFFF)
      {
        unint64_t v17 = HIDWORD(v16) * v14;
        if (v17) {
          goto LABEL_13;
        }
      }
      unint64_t v20 = v14 * (unint64_t)v16;
LABEL_20:
      if (!v15) {
        return result;
      }
      if (v20)
      {
        unint64_t v21 = v20 / v15;
        if (v6 > v21) {
          return result;
        }
      }
      else
      {
        unint64_t v21 = 0;
        if (v6) {
          return result;
        }
      }
      BOOL v19 = v21 >= v6;
      int v22 = v21 - v6;
      if (!v19) {
        int v22 = 0;
      }
      uint64_t v23 = v22 * (uint64_t)(int)v12;
      if (v23 == (int)v23)
      {
        if (*a5) {
          *a5 += 2 * v23;
        }
        uint64_t v24 = a5[1];
        if (v24) {
          a5[1] = v24 + 2 * v23;
        }
        uint64_t v25 = a5[2];
        if (v25) {
          a5[2] = v25 + 2 * v23;
        }
        uint64_t v26 = a5[3];
        if (v26) {
          a5[3] = v26 + 2 * v23;
        }
        uint64_t v27 = a5[4];
        if (v27) {
          a5[4] = v27 + 2 * v23;
        }
        unint64_t v5 = v16;
        unint64_t v6 = v21;
        if (v16 != a2) {
          continue;
        }
      }
      return result;
    }
  }
  return result;
}

uint64_t sub_1000349BC(uint64_t a1, void *a2)
{
  *(void *)a1 = off_100071100;
  if (*(unsigned char *)(a1 + 64))
  {
    if (*(void *)(a1 + 56))
    {
      uint64_t v3 = *(void *)(a1 + 80);
      if (v3)
      {
        Madusa::MemoryMaster::DeAllocateBuffer(v3, a2);
        uint64_t v6 = 0;
        memset(v5, 0, sizeof(v5));
        sub_10002F98C(a1 + 16, (unint64_t *)v5, (unint64_t *)v5, 0, 0);
      }
    }
  }
  return a1;
}

void sub_100034A48(uint64_t a1, void *a2)
{
  *(void *)a1 = off_100071100;
  if (*(unsigned char *)(a1 + 64) && *(void *)(a1 + 56))
  {
    uint64_t v3 = *(void *)(a1 + 80);
    if (v3)
    {
      Madusa::MemoryMaster::DeAllocateBuffer(v3, a2);
      uint64_t v5 = 0;
      memset(v4, 0, sizeof(v4));
      sub_10002F98C(a1 + 16, (unint64_t *)v4, (unint64_t *)v4, 0, 0);
    }
  }
  operator delete();
}

void *sub_100034AE8(uint64_t a1, Madusa::ImageProperties *this, long long *a3, int *a4)
{
  unint64_t result = (void *)Madusa::ImageProperties::HasValidColorComponents(this);
  if (result)
  {
    uint64_t v44 = 0;
    char v45 = 1;
    int v46 = 0;
    char v47 = 1;
    uint64_t v42 = 0;
    char v43 = 1;
    v40[0] = off_100070AA8;
    v40[1] = 0;
    char v41 = 1;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v50 = 0;
    Madusa::ImageProperties::GetPixelDataBaseAddrs((__n128 *)this, &v22);
    Madusa::ImageProperties::GetPixelData(this, (uint64_t)&v38);
    uint64_t v9 = *(void *)Madusa::ImageProperties::GetImagePlaneSize(this);
    YStride = (int *)Madusa::ImageProperties::GetYStride(this);
    sub_10002F98C((uint64_t)v40, v22.n128_u64, (unint64_t *)&v38, v9, *YStride);
    v22.n128_u32[2] = 0;
    v22.n128_u8[12] = 1;
    int v23 = 0;
    char v24 = 1;
    int v25 = 0;
    char v26 = 1;
    int v27 = 0;
    char v28 = 1;
    int v29 = 0;
    char v30 = 1;
    int v31 = 0;
    char v32 = 1;
    int v33 = 0;
    char v34 = 1;
    int v35 = 0;
    char v36 = 1;
    *(void *)&long long v11 = 0x100000001;
    *((void *)&v11 + 1) = 0x100000001;
    long long v37 = v11;
    long long v12 = a3[1];
    long long v38 = *a3;
    v22.n128_u64[0] = (unint64_t)off_100071150;
    long long v39 = v12;
    if (Madusa::ImageProperties::ShouldDownsample(this))
    {
      uint64_t v20 = 0x100000001;
      uint64_t v21 = 0x100000001;
      Madusa::ImageProperties::GetDownsampleRatios(this, (Madusa::Ratio *)&v20, (Madusa::Ratio *)&v21);
      sub_10002FBFC(a4, (int *)&v20, (int *)&v21, &v13);
      LODWORD(v38) = v13;
      BYTE4(v38) = BYTE4(v13);
      DWORD2(v38) = v14;
      BYTE12(v38) = v15;
      LODWORD(v39) = v16;
      BYTE4(v39) = v17;
      DWORD2(v39) = v18;
      BYTE12(v39) = v19;
    }
    sub_10002FEF4((uint64_t)&v22, this, (uint64_t)&v38, (uint64_t)a4);
    return sub_100032BDC(&v22, (uint64_t)v40, *(void *)(a1 + 8));
  }
  return result;
}

_DWORD *sub_100034CF4(_DWORD *result, uint64_t a2, int a3, void *a4, void *a5)
{
  if (a2)
  {
    unint64_t v5 = 0;
    unint64_t v6 = 0;
    uint64_t v7 = result[16];
    uint64_t v8 = a3;
    int v10 = result[18];
    int v9 = result[19];
    while (1)
    {
      if ((int)v7 >= 1)
      {
        for (uint64_t i = 0; i != v7; ++i)
          *(unsigned char *)(*a4 + i) = ~*(unsigned char *)(*a5 + v9 * (uint64_t)(result[22] * (int)i / result[23]));
      }
      *a4 += v8;
      unint64_t v12 = (int)result[24];
      unint64_t v13 = (int)result[25];
      unint64_t v14 = v5 + 1;
      if ((v12 & 0x80000000) != 0)
      {
        if (v5 > 0xFFFFFFFE) {
          return result;
        }
        unint64_t v15 = HIDWORD(v12) * v14;
        if (v15)
        {
LABEL_10:
          if (HIDWORD(v15)) {
            return result;
          }
          unint64_t v16 = v12 * (unint64_t)v14;
          BOOL v17 = __CFADD__(v16, v15 << 32);
          unint64_t v18 = v16 + (v15 << 32);
          if (v17) {
            return result;
          }
          goto LABEL_17;
        }
      }
      else if (v5 >= 0xFFFFFFFF)
      {
        unint64_t v15 = HIDWORD(v14) * v12;
        if (v15) {
          goto LABEL_10;
        }
      }
      unint64_t v18 = v12 * (unint64_t)v14;
LABEL_17:
      if (!v13) {
        return result;
      }
      if (v18)
      {
        unint64_t v19 = v18 / v13;
        if (v6 > v19) {
          return result;
        }
      }
      else
      {
        unint64_t v19 = 0;
        if (v6) {
          return result;
        }
      }
      BOOL v17 = v19 >= v6;
      int v20 = v19 - v6;
      if (!v17) {
        int v20 = 0;
      }
      uint64_t v21 = v20 * (uint64_t)v10;
      if (v21 == (int)v21)
      {
        if (*a5) {
          *a5 += v21;
        }
        uint64_t v22 = a5[1];
        if (v22) {
          a5[1] = v22 + v21;
        }
        uint64_t v23 = a5[2];
        if (v23) {
          a5[2] = v23 + v21;
        }
        uint64_t v24 = a5[3];
        if (v24) {
          a5[3] = v24 + v21;
        }
        uint64_t v25 = a5[4];
        if (v25) {
          a5[4] = v25 + v21;
        }
        unint64_t v5 = v14;
        unint64_t v6 = v19;
        if (v14 != a2) {
          continue;
        }
      }
      return result;
    }
  }
  return result;
}

uint64_t sub_100034E54(uint64_t a1, void *a2)
{
  *(void *)a1 = off_100071188;
  if (*(unsigned char *)(a1 + 64))
  {
    if (*(void *)(a1 + 56))
    {
      uint64_t v3 = *(void *)(a1 + 80);
      if (v3)
      {
        Madusa::MemoryMaster::DeAllocateBuffer(v3, a2);
        uint64_t v6 = 0;
        memset(v5, 0, sizeof(v5));
        sub_10002F98C(a1 + 16, (unint64_t *)v5, (unint64_t *)v5, 0, 0);
      }
    }
  }
  return a1;
}

void sub_100034EE0(uint64_t a1, void *a2)
{
  *(void *)a1 = off_100071188;
  if (*(unsigned char *)(a1 + 64) && *(void *)(a1 + 56))
  {
    uint64_t v3 = *(void *)(a1 + 80);
    if (v3)
    {
      Madusa::MemoryMaster::DeAllocateBuffer(v3, a2);
      uint64_t v5 = 0;
      memset(v4, 0, sizeof(v4));
      sub_10002F98C(a1 + 16, (unint64_t *)v4, (unint64_t *)v4, 0, 0);
    }
  }
  operator delete();
}

void *sub_100034F80(uint64_t a1, Madusa::ImageProperties *this, long long *a3, int *a4)
{
  unint64_t result = (void *)Madusa::ImageProperties::HasValidColorComponents(this);
  if (result)
  {
    uint64_t v44 = 0;
    char v45 = 1;
    int v46 = 0;
    char v47 = 1;
    uint64_t v42 = 0;
    char v43 = 1;
    v40[0] = off_100070B08;
    v40[1] = 0;
    char v41 = 1;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v50 = 0;
    Madusa::ImageProperties::GetPixelDataBaseAddrs((__n128 *)this, &v22);
    Madusa::ImageProperties::GetPixelData(this, (uint64_t)&v38);
    uint64_t v9 = *(void *)Madusa::ImageProperties::GetImagePlaneSize(this);
    YStride = (int *)Madusa::ImageProperties::GetYStride(this);
    sub_10002F98C((uint64_t)v40, v22.n128_u64, (unint64_t *)&v38, v9, *YStride);
    v22.n128_u32[2] = 0;
    v22.n128_u8[12] = 1;
    int v23 = 0;
    char v24 = 1;
    int v25 = 0;
    char v26 = 1;
    int v27 = 0;
    char v28 = 1;
    int v29 = 0;
    char v30 = 1;
    int v31 = 0;
    char v32 = 1;
    int v33 = 0;
    char v34 = 1;
    int v35 = 0;
    char v36 = 1;
    *(void *)&long long v11 = 0x100000001;
    *((void *)&v11 + 1) = 0x100000001;
    long long v37 = v11;
    long long v12 = a3[1];
    long long v38 = *a3;
    v22.n128_u64[0] = (unint64_t)off_1000711D8;
    long long v39 = v12;
    if (Madusa::ImageProperties::ShouldDownsample(this))
    {
      uint64_t v20 = 0x100000001;
      uint64_t v21 = 0x100000001;
      Madusa::ImageProperties::GetDownsampleRatios(this, (Madusa::Ratio *)&v20, (Madusa::Ratio *)&v21);
      sub_10002FBFC(a4, (int *)&v20, (int *)&v21, &v13);
      LODWORD(v38) = v13;
      BYTE4(v38) = BYTE4(v13);
      DWORD2(v38) = v14;
      BYTE12(v38) = v15;
      LODWORD(v39) = v16;
      BYTE4(v39) = v17;
      DWORD2(v39) = v18;
      BYTE12(v39) = v19;
    }
    sub_10002FEF4((uint64_t)&v22, this, (uint64_t)&v38, (uint64_t)a4);
    return sub_10003005C(&v22, (uint64_t)v40, *(void *)(a1 + 8));
  }
  return result;
}

_DWORD *sub_10003518C(_DWORD *result, uint64_t a2, int a3, void *a4, void *a5)
{
  if (a2)
  {
    unint64_t v5 = 0;
    unint64_t v6 = 0;
    int v7 = result[19] / 2;
    uint64_t v8 = result[16];
    int v9 = result[18];
    if (v9 >= 0) {
      int v10 = result[18];
    }
    else {
      int v10 = v9 + 1;
    }
    uint64_t v11 = a3;
    uint64_t v12 = (uint64_t)v10 >> 1;
    while (1)
    {
      if ((int)v8 >= 1)
      {
        for (uint64_t i = 0; i != v8; ++i)
          *(unsigned char *)(*a4 + i) = (unsigned __int16)~*(_WORD *)(*a5 + 2 * result[22] * (int)i / result[23] * v7) >> 8;
      }
      *a4 += v11;
      unint64_t v14 = (int)result[24];
      unint64_t v15 = (int)result[25];
      unint64_t v16 = v5 + 1;
      if ((v14 & 0x80000000) != 0)
      {
        if (v5 > 0xFFFFFFFE) {
          return result;
        }
        unint64_t v17 = HIDWORD(v14) * v16;
        if (v17)
        {
LABEL_13:
          if (HIDWORD(v17)) {
            return result;
          }
          unint64_t v18 = v14 * (unint64_t)v16;
          BOOL v19 = __CFADD__(v18, v17 << 32);
          unint64_t v20 = v18 + (v17 << 32);
          if (v19) {
            return result;
          }
          goto LABEL_20;
        }
      }
      else if (v5 >= 0xFFFFFFFF)
      {
        unint64_t v17 = HIDWORD(v16) * v14;
        if (v17) {
          goto LABEL_13;
        }
      }
      unint64_t v20 = v14 * (unint64_t)v16;
LABEL_20:
      if (!v15) {
        return result;
      }
      if (v20)
      {
        unint64_t v21 = v20 / v15;
        if (v6 > v21) {
          return result;
        }
      }
      else
      {
        unint64_t v21 = 0;
        if (v6) {
          return result;
        }
      }
      BOOL v19 = v21 >= v6;
      int v22 = v21 - v6;
      if (!v19) {
        int v22 = 0;
      }
      uint64_t v23 = v22 * (uint64_t)(int)v12;
      if (v23 == (int)v23)
      {
        if (*a5) {
          *a5 += 2 * v23;
        }
        uint64_t v24 = a5[1];
        if (v24) {
          a5[1] = v24 + 2 * v23;
        }
        uint64_t v25 = a5[2];
        if (v25) {
          a5[2] = v25 + 2 * v23;
        }
        uint64_t v26 = a5[3];
        if (v26) {
          a5[3] = v26 + 2 * v23;
        }
        uint64_t v27 = a5[4];
        if (v27) {
          a5[4] = v27 + 2 * v23;
        }
        unint64_t v5 = v16;
        unint64_t v6 = v21;
        if (v16 != a2) {
          continue;
        }
      }
      return result;
    }
  }
  return result;
}

uint64_t sub_10003530C(uint64_t a1, void *a2)
{
  *(void *)a1 = off_100071210;
  if (*(unsigned char *)(a1 + 64))
  {
    if (*(void *)(a1 + 56))
    {
      uint64_t v3 = *(void *)(a1 + 80);
      if (v3)
      {
        Madusa::MemoryMaster::DeAllocateBuffer(v3, a2);
        uint64_t v6 = 0;
        memset(v5, 0, sizeof(v5));
        sub_10002F98C(a1 + 16, (unint64_t *)v5, (unint64_t *)v5, 0, 0);
      }
    }
  }
  return a1;
}

void sub_100035398(uint64_t a1, void *a2)
{
  *(void *)a1 = off_100071210;
  if (*(unsigned char *)(a1 + 64) && *(void *)(a1 + 56))
  {
    uint64_t v3 = *(void *)(a1 + 80);
    if (v3)
    {
      Madusa::MemoryMaster::DeAllocateBuffer(v3, a2);
      uint64_t v5 = 0;
      memset(v4, 0, sizeof(v4));
      sub_10002F98C(a1 + 16, (unint64_t *)v4, (unint64_t *)v4, 0, 0);
    }
  }
  operator delete();
}

void *sub_100035438(uint64_t a1, Madusa::ImageProperties *this, long long *a3, int *a4)
{
  unint64_t result = (void *)Madusa::ImageProperties::HasValidColorComponents(this);
  if (result)
  {
    uint64_t v44 = 0;
    char v45 = 1;
    int v46 = 0;
    char v47 = 1;
    uint64_t v42 = 0;
    char v43 = 1;
    v40[0] = off_100070AA8;
    v40[1] = 0;
    char v41 = 1;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v50 = 0;
    Madusa::ImageProperties::GetPixelDataBaseAddrs((__n128 *)this, &v22);
    Madusa::ImageProperties::GetPixelData(this, (uint64_t)&v38);
    uint64_t v9 = *(void *)Madusa::ImageProperties::GetImagePlaneSize(this);
    YStride = (int *)Madusa::ImageProperties::GetYStride(this);
    sub_10002F98C((uint64_t)v40, v22.n128_u64, (unint64_t *)&v38, v9, *YStride);
    v22.n128_u32[2] = 0;
    v22.n128_u8[12] = 1;
    int v23 = 0;
    char v24 = 1;
    int v25 = 0;
    char v26 = 1;
    int v27 = 0;
    char v28 = 1;
    int v29 = 0;
    char v30 = 1;
    int v31 = 0;
    char v32 = 1;
    int v33 = 0;
    char v34 = 1;
    int v35 = 0;
    char v36 = 1;
    *(void *)&long long v11 = 0x100000001;
    *((void *)&v11 + 1) = 0x100000001;
    long long v37 = v11;
    long long v12 = a3[1];
    long long v38 = *a3;
    v22.n128_u64[0] = (unint64_t)off_100071260;
    long long v39 = v12;
    if (Madusa::ImageProperties::ShouldDownsample(this))
    {
      uint64_t v20 = 0x100000001;
      uint64_t v21 = 0x100000001;
      Madusa::ImageProperties::GetDownsampleRatios(this, (Madusa::Ratio *)&v20, (Madusa::Ratio *)&v21);
      sub_10002FBFC(a4, (int *)&v20, (int *)&v21, &v13);
      LODWORD(v38) = v13;
      BYTE4(v38) = BYTE4(v13);
      DWORD2(v38) = v14;
      BYTE12(v38) = v15;
      LODWORD(v39) = v16;
      BYTE4(v39) = v17;
      DWORD2(v39) = v18;
      BYTE12(v39) = v19;
    }
    sub_10002FEF4((uint64_t)&v22, this, (uint64_t)&v38, (uint64_t)a4);
    return sub_100032BDC(&v22, (uint64_t)v40, *(void *)(a1 + 8));
  }
  return result;
}

_DWORD *sub_100035644(_DWORD *result, uint64_t a2, int a3, void *a4, void *a5)
{
  if (a2)
  {
    unint64_t v5 = 0;
    unint64_t v6 = 0;
    uint64_t v7 = result[16];
    uint64_t v8 = a3;
    int v10 = result[18];
    int v9 = result[19];
    while (1)
    {
      if ((int)v7 >= 1)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          uint64_t v12 = v9 * (uint64_t)(result[22] * (int)i / result[23]);
          *(unsigned char *)(*a4 + i) = (5614337
                               * (unint64_t)((*(unsigned __int8 *)(a5[1] + v12)
                                                   + *(unsigned __int8 *)(*a5 + v12)
                                                   + *(unsigned __int8 *)(a5[2] + v12))
                                                  * *(unsigned __int8 *)(a5[3] + v12))) >> 32;
        }
      }
      *a4 += v8;
      unint64_t v14 = (int)result[24];
      unint64_t v13 = (int)result[25];
      unint64_t v15 = v5 + 1;
      if ((v14 & 0x80000000) != 0)
      {
        if (v5 > 0xFFFFFFFE) {
          return result;
        }
        unint64_t v16 = HIDWORD(v14) * v15;
        if (v16)
        {
LABEL_10:
          if (HIDWORD(v16)) {
            return result;
          }
          unint64_t v17 = v14 * (unint64_t)v15;
          BOOL v18 = __CFADD__(v17, v16 << 32);
          unint64_t v19 = v17 + (v16 << 32);
          if (v18) {
            return result;
          }
          goto LABEL_17;
        }
      }
      else if (v5 >= 0xFFFFFFFF)
      {
        unint64_t v16 = HIDWORD(v15) * v14;
        if (v16) {
          goto LABEL_10;
        }
      }
      unint64_t v19 = v14 * (unint64_t)v15;
LABEL_17:
      if (!v13) {
        return result;
      }
      if (v19)
      {
        unint64_t v20 = v19 / v13;
        if (v6 > v20) {
          return result;
        }
      }
      else
      {
        unint64_t v20 = 0;
        if (v6) {
          return result;
        }
      }
      BOOL v18 = v20 >= v6;
      int v21 = v20 - v6;
      if (!v18) {
        int v21 = 0;
      }
      uint64_t v22 = v21 * (uint64_t)v10;
      if (v22 == (int)v22)
      {
        if (*a5) {
          *a5 += v22;
        }
        uint64_t v23 = a5[1];
        if (v23) {
          a5[1] = v23 + v22;
        }
        uint64_t v24 = a5[2];
        if (v24) {
          a5[2] = v24 + v22;
        }
        uint64_t v25 = a5[3];
        if (v25) {
          a5[3] = v25 + v22;
        }
        uint64_t v26 = a5[4];
        if (v26) {
          a5[4] = v26 + v22;
        }
        unint64_t v5 = v15;
        unint64_t v6 = v20;
        if (v15 != a2) {
          continue;
        }
      }
      return result;
    }
  }
  return result;
}

uint64_t sub_1000357D4(uint64_t a1, void *a2)
{
  *(void *)a1 = off_100071298;
  if (*(unsigned char *)(a1 + 64))
  {
    if (*(void *)(a1 + 56))
    {
      uint64_t v3 = *(void *)(a1 + 80);
      if (v3)
      {
        Madusa::MemoryMaster::DeAllocateBuffer(v3, a2);
        uint64_t v6 = 0;
        memset(v5, 0, sizeof(v5));
        sub_10002F98C(a1 + 16, (unint64_t *)v5, (unint64_t *)v5, 0, 0);
      }
    }
  }
  return a1;
}

void sub_100035860(uint64_t a1, void *a2)
{
  *(void *)a1 = off_100071298;
  if (*(unsigned char *)(a1 + 64) && *(void *)(a1 + 56))
  {
    uint64_t v3 = *(void *)(a1 + 80);
    if (v3)
    {
      Madusa::MemoryMaster::DeAllocateBuffer(v3, a2);
      uint64_t v5 = 0;
      memset(v4, 0, sizeof(v4));
      sub_10002F98C(a1 + 16, (unint64_t *)v4, (unint64_t *)v4, 0, 0);
    }
  }
  operator delete();
}

void *sub_100035900(uint64_t a1, Madusa::ImageProperties *this, long long *a3, int *a4)
{
  unint64_t result = (void *)Madusa::ImageProperties::HasValidColorComponents(this);
  if (result)
  {
    uint64_t v44 = 0;
    char v45 = 1;
    int v46 = 0;
    char v47 = 1;
    uint64_t v42 = 0;
    char v43 = 1;
    v40[0] = off_100070B08;
    v40[1] = 0;
    char v41 = 1;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v50 = 0;
    Madusa::ImageProperties::GetPixelDataBaseAddrs((__n128 *)this, &v22);
    Madusa::ImageProperties::GetPixelData(this, (uint64_t)&v38);
    uint64_t v9 = *(void *)Madusa::ImageProperties::GetImagePlaneSize(this);
    YStride = (int *)Madusa::ImageProperties::GetYStride(this);
    sub_10002F98C((uint64_t)v40, v22.n128_u64, (unint64_t *)&v38, v9, *YStride);
    v22.n128_u32[2] = 0;
    v22.n128_u8[12] = 1;
    int v23 = 0;
    char v24 = 1;
    int v25 = 0;
    char v26 = 1;
    int v27 = 0;
    char v28 = 1;
    int v29 = 0;
    char v30 = 1;
    int v31 = 0;
    char v32 = 1;
    int v33 = 0;
    char v34 = 1;
    int v35 = 0;
    char v36 = 1;
    *(void *)&long long v11 = 0x100000001;
    *((void *)&v11 + 1) = 0x100000001;
    long long v37 = v11;
    long long v12 = a3[1];
    long long v38 = *a3;
    v22.n128_u64[0] = (unint64_t)off_1000712E8;
    long long v39 = v12;
    if (Madusa::ImageProperties::ShouldDownsample(this))
    {
      uint64_t v20 = 0x100000001;
      uint64_t v21 = 0x100000001;
      Madusa::ImageProperties::GetDownsampleRatios(this, (Madusa::Ratio *)&v20, (Madusa::Ratio *)&v21);
      sub_10002FBFC(a4, (int *)&v20, (int *)&v21, &v13);
      LODWORD(v38) = v13;
      BYTE4(v38) = BYTE4(v13);
      DWORD2(v38) = v14;
      BYTE12(v38) = v15;
      LODWORD(v39) = v16;
      BYTE4(v39) = v17;
      DWORD2(v39) = v18;
      BYTE12(v39) = v19;
    }
    sub_10002FEF4((uint64_t)&v22, this, (uint64_t)&v38, (uint64_t)a4);
    return sub_10003005C(&v22, (uint64_t)v40, *(void *)(a1 + 8));
  }
  return result;
}

_DWORD *sub_100035B0C(_DWORD *result, uint64_t a2, int a3, void *a4, void *a5)
{
  if (a2)
  {
    unint64_t v5 = 0;
    unint64_t v6 = 0;
    int v7 = result[19] / 2;
    uint64_t v8 = result[16];
    int v9 = result[18];
    if (v9 >= 0) {
      int v10 = result[18];
    }
    else {
      int v10 = v9 + 1;
    }
    uint64_t v11 = a3;
    uint64_t v12 = (uint64_t)v10 >> 1;
    while (1)
    {
      if ((int)v8 >= 1)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          uint64_t v14 = 2 * result[22] * (int)i / result[23] * v7;
          *(unsigned char *)(*a4 + i) = (5614337
                               * (unint64_t)(*(unsigned __int8 *)(a5[3] + v14 + 1)
                                                  * (*(unsigned __int8 *)(a5[1] + v14 + 1)
                                                   + *(unsigned __int8 *)(*a5 + v14 + 1)
                                                   + *(unsigned __int8 *)(a5[2] + v14 + 1)))) >> 32;
        }
      }
      *a4 += v11;
      unint64_t v16 = (int)result[24];
      unint64_t v15 = (int)result[25];
      unint64_t v17 = v5 + 1;
      if ((v16 & 0x80000000) != 0)
      {
        if (v5 > 0xFFFFFFFE) {
          return result;
        }
        unint64_t v18 = HIDWORD(v16) * v17;
        if (v18)
        {
LABEL_13:
          if (HIDWORD(v18)) {
            return result;
          }
          unint64_t v19 = v16 * (unint64_t)v17;
          BOOL v20 = __CFADD__(v19, v18 << 32);
          unint64_t v21 = v19 + (v18 << 32);
          if (v20) {
            return result;
          }
          goto LABEL_20;
        }
      }
      else if (v5 >= 0xFFFFFFFF)
      {
        unint64_t v18 = HIDWORD(v17) * v16;
        if (v18) {
          goto LABEL_13;
        }
      }
      unint64_t v21 = v16 * (unint64_t)v17;
LABEL_20:
      if (!v15) {
        return result;
      }
      if (v21)
      {
        unint64_t v22 = v21 / v15;
        if (v6 > v22) {
          return result;
        }
      }
      else
      {
        unint64_t v22 = 0;
        if (v6) {
          return result;
        }
      }
      BOOL v20 = v22 >= v6;
      int v23 = v22 - v6;
      if (!v20) {
        int v23 = 0;
      }
      uint64_t v24 = v23 * (uint64_t)(int)v12;
      if (v24 == (int)v24)
      {
        if (*a5) {
          *a5 += 2 * v24;
        }
        uint64_t v25 = a5[1];
        if (v25) {
          a5[1] = v25 + 2 * v24;
        }
        uint64_t v26 = a5[2];
        if (v26) {
          a5[2] = v26 + 2 * v24;
        }
        uint64_t v27 = a5[3];
        if (v27) {
          a5[3] = v27 + 2 * v24;
        }
        uint64_t v28 = a5[4];
        if (v28) {
          a5[4] = v28 + 2 * v24;
        }
        unint64_t v5 = v17;
        unint64_t v6 = v22;
        if (v17 != a2) {
          continue;
        }
      }
      return result;
    }
  }
  return result;
}

uint64_t sub_100035CC4(uint64_t a1, void *a2)
{
  *(void *)a1 = off_100071320;
  if (*(unsigned char *)(a1 + 64))
  {
    if (*(void *)(a1 + 56))
    {
      uint64_t v3 = *(void *)(a1 + 80);
      if (v3)
      {
        Madusa::MemoryMaster::DeAllocateBuffer(v3, a2);
        uint64_t v6 = 0;
        memset(v5, 0, sizeof(v5));
        sub_10002F98C(a1 + 16, (unint64_t *)v5, (unint64_t *)v5, 0, 0);
      }
    }
  }
  return a1;
}

void sub_100035D50(uint64_t a1, void *a2)
{
  *(void *)a1 = off_100071320;
  if (*(unsigned char *)(a1 + 64) && *(void *)(a1 + 56))
  {
    uint64_t v3 = *(void *)(a1 + 80);
    if (v3)
    {
      Madusa::MemoryMaster::DeAllocateBuffer(v3, a2);
      uint64_t v5 = 0;
      memset(v4, 0, sizeof(v4));
      sub_10002F98C(a1 + 16, (unint64_t *)v4, (unint64_t *)v4, 0, 0);
    }
  }
  operator delete();
}

void *sub_100035DF0(uint64_t a1, Madusa::ImageProperties *this, long long *a3, int *a4)
{
  unint64_t result = (void *)Madusa::ImageProperties::HasValidColorComponents(this);
  if (result)
  {
    uint64_t v44 = 0;
    char v45 = 1;
    int v46 = 0;
    char v47 = 1;
    uint64_t v42 = 0;
    char v43 = 1;
    v40[0] = off_100070AA8;
    v40[1] = 0;
    char v41 = 1;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v50 = 0;
    Madusa::ImageProperties::GetPixelDataBaseAddrs((__n128 *)this, &v22);
    Madusa::ImageProperties::GetPixelData(this, (uint64_t)&v38);
    uint64_t v9 = *(void *)Madusa::ImageProperties::GetImagePlaneSize(this);
    YStride = (int *)Madusa::ImageProperties::GetYStride(this);
    sub_10002F98C((uint64_t)v40, v22.n128_u64, (unint64_t *)&v38, v9, *YStride);
    v22.n128_u32[2] = 0;
    v22.n128_u8[12] = 1;
    int v23 = 0;
    char v24 = 1;
    int v25 = 0;
    char v26 = 1;
    int v27 = 0;
    char v28 = 1;
    int v29 = 0;
    char v30 = 1;
    int v31 = 0;
    char v32 = 1;
    int v33 = 0;
    char v34 = 1;
    int v35 = 0;
    char v36 = 1;
    *(void *)&long long v11 = 0x100000001;
    *((void *)&v11 + 1) = 0x100000001;
    long long v37 = v11;
    long long v12 = a3[1];
    long long v38 = *a3;
    v22.n128_u64[0] = (unint64_t)off_100071370;
    long long v39 = v12;
    if (Madusa::ImageProperties::ShouldDownsample(this))
    {
      uint64_t v20 = 0x100000001;
      uint64_t v21 = 0x100000001;
      Madusa::ImageProperties::GetDownsampleRatios(this, (Madusa::Ratio *)&v20, (Madusa::Ratio *)&v21);
      sub_10002FBFC(a4, (int *)&v20, (int *)&v21, &v13);
      LODWORD(v38) = v13;
      BYTE4(v38) = BYTE4(v13);
      DWORD2(v38) = v14;
      BYTE12(v38) = v15;
      LODWORD(v39) = v16;
      BYTE4(v39) = v17;
      DWORD2(v39) = v18;
      BYTE12(v39) = v19;
    }
    sub_10002FEF4((uint64_t)&v22, this, (uint64_t)&v38, (uint64_t)a4);
    return sub_100032BDC(&v22, (uint64_t)v40, *(void *)(a1 + 8));
  }
  return result;
}

_DWORD *sub_100035FFC(_DWORD *result, uint64_t a2, int a3, void *a4, void *a5)
{
  if (a2)
  {
    unint64_t v5 = 0;
    unint64_t v6 = 0;
    uint64_t v7 = result[16];
    uint64_t v8 = a3;
    int v10 = result[18];
    int v9 = result[19];
    while (1)
    {
      if ((int)v7 >= 1)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          uint64_t v12 = v9 * (uint64_t)(result[22] * (int)i / result[23]);
          *(unsigned char *)(*a4 + i) = (765
                               - *(unsigned __int8 *)(a5[2] + v12)
                               - (*(unsigned __int8 *)(*a5 + v12)
                                + *(unsigned __int8 *)(a5[1] + v12)))
                              * (*(unsigned __int8 *)(a5[3] + v12) ^ 0xFFu)
                              / 0x2FD;
        }
      }
      *a4 += v8;
      unint64_t v14 = (int)result[24];
      unint64_t v13 = (int)result[25];
      unint64_t v15 = v5 + 1;
      if ((v14 & 0x80000000) != 0)
      {
        if (v5 > 0xFFFFFFFE) {
          return result;
        }
        unint64_t v16 = HIDWORD(v14) * v15;
        if (v16)
        {
LABEL_10:
          if (HIDWORD(v16)) {
            return result;
          }
          unint64_t v17 = v14 * (unint64_t)v15;
          BOOL v18 = __CFADD__(v17, v16 << 32);
          unint64_t v19 = v17 + (v16 << 32);
          if (v18) {
            return result;
          }
          goto LABEL_17;
        }
      }
      else if (v5 >= 0xFFFFFFFF)
      {
        unint64_t v16 = HIDWORD(v15) * v14;
        if (v16) {
          goto LABEL_10;
        }
      }
      unint64_t v19 = v14 * (unint64_t)v15;
LABEL_17:
      if (!v13) {
        return result;
      }
      if (v19)
      {
        unint64_t v20 = v19 / v13;
        if (v6 > v20) {
          return result;
        }
      }
      else
      {
        unint64_t v20 = 0;
        if (v6) {
          return result;
        }
      }
      BOOL v18 = v20 >= v6;
      int v21 = v20 - v6;
      if (!v18) {
        int v21 = 0;
      }
      uint64_t v22 = v21 * (uint64_t)v10;
      if (v22 == (int)v22)
      {
        if (*a5) {
          *a5 += v22;
        }
        uint64_t v23 = a5[1];
        if (v23) {
          a5[1] = v23 + v22;
        }
        uint64_t v24 = a5[2];
        if (v24) {
          a5[2] = v24 + v22;
        }
        uint64_t v25 = a5[3];
        if (v25) {
          a5[3] = v25 + v22;
        }
        uint64_t v26 = a5[4];
        if (v26) {
          a5[4] = v26 + v22;
        }
        unint64_t v5 = v15;
        unint64_t v6 = v20;
        if (v15 != a2) {
          continue;
        }
      }
      return result;
    }
  }
  return result;
}

void sub_100036198()
{
}

void sub_1000361AC(uint64_t a1, uint64_t a2)
{
}

void Madusa::Demod::InverseAffineTransform(uint64_t a1, void *a2, float *a3, float *a4, float *a5, void *a6)
{
  int v10 = (char *)(*a6 + 8);
  bzero(v10, 0x10810uLL);
  int v14 = 0;
  float v15 = a3[12];
  float v16 = a3[13];
  float v17 = a3[14];
  float v18 = a3[15];
  float v19 = (float)(*a4 + 64.5) + *a5;
  float v20 = (float)(a4[1] + 64.5) + a5[1];
  float v21 = -(float)(v15 * v19);
  float v22 = -(float)(v17 * v19);
  float v23 = -(float)(v16 * v20);
  float v24 = -(float)(v18 * v20);
  do
  {
    uint64_t v25 = 0;
    float v26 = v21 + 64.5;
    uint64_t v27 = *a2 + 8;
    uint64_t v28 = *a2 + 9;
    float v29 = v24;
    float v30 = v23;
    do
    {
      float v31 = v26 + v30;
      float v32 = (float)(v22 + 64.5) + v29;
      if ((float)(v26 + v30) >= 1.0 && v31 < 129.0 && v32 >= 1.0 && v32 < 129.0)
      {
        int v36 = (int)v31;
        float v37 = v31 - truncf(v31);
        int v38 = (int)v32;
        float v39 = truncf(v32);
        float v40 = v32 - v39;
        if (v36 >= 128) {
          int v41 = 128;
        }
        else {
          int v41 = v36;
        }
        int v42 = v41 + 1;
        if (v38 >= 128) {
          int v43 = 128;
        }
        else {
          int v43 = v38;
        }
        uint64_t v44 = v27 + v38;
        uint64_t v45 = 130 * v36;
        LOBYTE(v39) = *(unsigned char *)(v44 + v45);
        uint64_t v46 = v28 + v43;
        LOBYTE(v11) = *(unsigned char *)(v46 + v45);
        uint64_t v47 = 130 * v42;
        LOBYTE(v12) = *(unsigned char *)(v44 + v47);
        float v48 = (float)LODWORD(v12);
        LOBYTE(v13) = *(unsigned char *)(v46 + v47);
        float v13 = (float)LODWORD(v13);
        float v49 = (float)LODWORD(v39) + (float)((float)((float)LODWORD(v11) - (float)LODWORD(v39)) * v40);
        float v11 = v13 - v48;
        float v12 = v48 - v49;
        *(float *)&v10[v25] = v49 + (float)((float)(v12 + (float)(v11 * v40)) * v37);
      }
      float v30 = v30 + v16;
      float v29 = v29 + v18;
      v25 += 4;
    }
    while (v25 != 520);
    float v21 = v21 + v15;
    float v22 = v22 + v17;
    v10 += 520;
    ++v14;
  }
  while (v14 != 130);
}

void Madusa::Demod::_InverseAffineTransform(uint64_t a1, void *a2, float *a3, float *a4, float *a5, void *a6)
{
  if ((*v6 & 0x1F) != 0 || v6[2] > 0x3Fu)
  {
    int v7 = QuickCodec::mask;
    if (QuickCodec::mask != -70947757) {
LABEL_10:
    }
      QuickCodec::masint k = v7 + 1;
  }
  else
  {
    int v7 = QuickCodec::mask;
    if (v6[3] == 212 || QuickCodec::mask != -70947757) {
      goto LABEL_10;
    }
  }
  Madusa::Demod::InverseAffineTransform(a1, a2, a3, a4, a5, a6);
}

uint64_t Madusa::System::CreateDetectorPipe(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 16))(a1, 500040);
  uint64_t v4 = v3;
  if (v3)
  {
    *(void *)(v3 + 8) = off_100071538;
    *(void *)(v3 + 16) = v3 + 24;
    *(void *)uint64_t v3 = off_100071500;
    *(void *)(v3 + 24) = off_1000707D0;
    *(void *)(v3 + 32) = off_100070828;
    *(_DWORD *)(v3 + 40) = 0;
    *(void *)(v3 + 48) = off_100071558;
    bzero((void *)(v3 + 56), 0x4204uLL);
    Madusa::TransformPipe::TransformPipe(v4 + 16960, v4 + 24);
    Madusa::PayloadPipe::PayloadPipe((void *)(v4 + 412680), v4 + 24);
    *(void *)(v4 + 500032) = a2;
  }
  return v4;
}

uint64_t Madusa::System::GetDetectorPipeWorkingMemorySize(Madusa::System *this)
{
  return 500040;
}

uint64_t *Madusa::System::CreateBandModeUtil(Madusa::System *this)
{
  return &Madusa::gBandModeUtilRuntime;
}

void sub_10003650C()
{
}

uint64_t sub_100036520()
{
  return 0;
}

uint64_t sub_100036528(uint64_t result, unsigned char *a2)
{
  *(void *)unint64_t result = 0;
  *(void *)(result + 8) = 0;
  *(void *)(result + 16) = 0;
  if (a2)
  {
    *(unsigned char *)unint64_t result = *a2;
    if (*a2)
    {
      *(void *)(result + 16) = 1;
      *(unsigned char *)(result + 1) = a2[1];
      if (a2[1])
      {
        *(void *)(result + 16) = 2;
        *(unsigned char *)(result + 2) = a2[2];
        if (a2[2])
        {
          *(void *)(result + 16) = 3;
          *(unsigned char *)(result + 3) = a2[3];
          if (a2[3])
          {
            *(void *)(result + 16) = 4;
            *(unsigned char *)(result + 4) = a2[4];
            if (a2[4])
            {
              *(void *)(result + 16) = 5;
              *(unsigned char *)(result + 5) = a2[5];
              if (a2[5])
              {
                *(void *)(result + 16) = 6;
                *(unsigned char *)(result + 6) = a2[6];
                if (a2[6])
                {
                  *(void *)(result + 16) = 7;
                  *(unsigned char *)(result + 7) = a2[7];
                  if (a2[7])
                  {
                    *(void *)(result + 16) = 8;
                    *(unsigned char *)(result + 8) = a2[8];
                    if (a2[8])
                    {
                      *(void *)(result + 16) = 9;
                      *(unsigned char *)(result + 9) = a2[9];
                      if (a2[9])
                      {
                        *(void *)(result + 16) = 10;
                        *(unsigned char *)(result + 10) = a2[10];
                        if (a2[10])
                        {
                          *(void *)(result + 16) = 11;
                          *(unsigned char *)(result + 11) = a2[11];
                          if (a2[11])
                          {
                            *(void *)(result + 16) = 12;
                            *(unsigned char *)(result + 12) = a2[12];
                            if (a2[12])
                            {
                              *(void *)(result + 16) = 13;
                              *(unsigned char *)(result + 13) = a2[13];
                              if (a2[13])
                              {
                                *(void *)(result + 16) = 14;
                                *(unsigned char *)(result + 14) = a2[14];
                                if (a2[14]) {
                                  *(void *)(result + 16) = 15;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  *(unsigned char *)(result + 15) = 0;
  return result;
}

void sub_1000366A4()
{
}

double sub_1000366B8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  void (*v18)(_OWORD *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t);
  long long v19;
  long long v20;
  long long v21;
  double result;
  long long v23;
  _OWORD v24[2];
  unsigned char v25[32];
  int v26;

  float v26 = 1;
  uint64_t v6 = a1 + 16960;
  uint64_t func = (uint64_t (*)(uint64_t, uint64_t, int *))__find_func(0x4F9F1F9FE0E0E040, -1591418806);
  uint64_t v8 = func(v6, a2, &v26);
  uint64_t v9 = v8;
  *(_WORD *)uint64_t v25 = 0;
  memset(&v25[4], 0, 24);
  *(_DWORD *)&v25[28] = -1;
  int v10 = v26;
  if (v26 >= 1)
  {
    uint64_t v11 = a1 + 412680;
    float v12 = (uint64_t *)(a1 + 500032);
    float v13 = &v25[4];
    uint64_t v14 = 1;
    uint64_t v15 = v8;
    do
    {
      *(_WORD *)uint64_t v25 = 0;
      *(void *)float v13 = 0;
      *((void *)v13 + 1) = 0;
      *((void *)v13 + 2) = 0;
      *(_DWORD *)&v25[28] = -1;
      char v16 = *(unsigned char *)(v15 + 68);
      if (v16)
      {
        uint64_t v17 = *v12;
        float v18 = (void (*)(_OWORD *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t))__find_func(0xFF3FDFDF40C00000, 293871626);
        v18(v24, v11, v15, a2, v17);
        float v19 = v24[0];
        *(_OWORD *)(v13 + 12) = v24[1];
        *(_OWORD *)(v13 - 4) = v19;
        char v16 = v25[1] != 0;
        int v10 = v26;
      }
      if (v14 >= v10) {
        break;
      }
      v15 += 72;
      v13 += 32;
      ++v14;
    }
    while ((v16 & 1) == 0);
  }
  float v20 = *(_OWORD *)(v9 + 48);
  *(_OWORD *)(a3 + 32) = *(_OWORD *)(v9 + 32);
  *(_OWORD *)(a3 + 48) = v20;
  float v21 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)a3 = *(_OWORD *)v9;
  *(_OWORD *)(a3 + 16) = v21;
  unint64_t result = *(double *)v25;
  float v23 = *(_OWORD *)&v25[16];
  *(_OWORD *)(a3 + 72) = *(_OWORD *)v25;
  *(void *)(a3 + 64) = *(void *)(v9 + 64);
  *(_OWORD *)(a3 + 88) = v23;
  *(_DWORD *)(a3 + 104) = v10;
  return result;
}

uint64_t sub_100036840(uint64_t a1)
{
  return a1 + 24;
}

uint64_t sub_100036848(uint64_t a1)
{
  return a1 + 48;
}

void sub_100036850()
{
}

void sub_100036868()
{
}

double sub_10003687C()
{
  Madusa::gBandModeUtilRuntime = (uint64_t)off_1000707D0;
  qword_100074F40 = (uint64_t)off_100070828;
  dword_100074F48 = 0;
  __cxa_atexit((void (*)(void *))nullsub_1, &Madusa::gBandModeUtilRuntime, (void *)&_mh_execute_header);
  __cxa_atexit((void (*)(void *))nullsub_1, &Madusa::gReadstatsHandle, (void *)&_mh_execute_header);
  sub_100036528((uint64_t)&v1, "apple-raster");
  Madusa::gSystem = 0;
  double result = *(double *)&v1;
  unk_100074F58 = v1;
  qword_100074F68 = v2;
  dword_100074F70 = 1;
  Madusa::System::mpSystem = (uint64_t)&Madusa::gSystem;
  return result;
}

uint64_t sub_100036994(uint64_t result)
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

void DelegateAPIAdapter::setAPIUsed(uint64_t *a1)
{
  if (qword_100074AB8 == *(void *)((char *)h5001x - 51348))
  {
    if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64((int64x2_t)xmmword_100074AC0, *(int64x2_t *)((char *)h5001x - 51340)), (int32x4_t)vceqq_s64(*(int64x2_t *)&qword_100074AD0, *(int64x2_t *)((char *)h5001x - 51324)))), 0xFuLL))) & (qword_100074AE0 == *(void *)((char *)h5001x - 51308))) != 0)int v2 = 38; {
    else
    }
      int v2 = 502;
    DelegateAPIAdapter::mWhichAPI = v2;
    uint64_t v1 = *a1;
    if (!*a1) {
      return;
    }
  }
  else
  {
    DelegateAPIAdapter::mWhichAPI = 502;
    uint64_t v1 = *a1;
    if (!*a1) {
      return;
    }
  }
  uint64_t v3 = a1[1];
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v4 = (std::__shared_weak_count *)qword_100074F88;
  DelegateAPIAdapter::mAdaptee = v1;
  qword_100074F88 = v3;
  if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
}

uint64_t DelegateAPIAdapter::Initialize(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a4 || !DelegateAPIAdapter::mAdaptee) {
    return 4294967293;
  }
  if (DelegateAPIAdapter::mWhichAPI != 502) {
    operator new();
  }
  uint64_t v8 = DelegateAPIAdapter::mAdaptee;
  uint64_t v9 = qword_100074F88;
  if (qword_100074F88) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(qword_100074F88 + 8), 1uLL, memory_order_relaxed);
  }
  Adapter502_52::Adapter502_52(v10, &v8);
  uint64_t v4 = (std::__shared_weak_count *)v9;
  if (v9 && !atomic_fetch_add((atomic_ullong *volatile)(v9 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
  uint64_t v5 = Adapter502_52::Initialize((uint64_t)v10);
  v10[0] = off_1000715B0;
  uint64_t v6 = v11;
  if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
  return v5;
}

uint64_t DelegateAPIAdapter::InitializeBanding(uint64_t a1)
{
  if (!a1 || !DelegateAPIAdapter::mAdaptee) {
    return 4294967293;
  }
  if (DelegateAPIAdapter::mWhichAPI == 502)
  {
    uint64_t v6 = DelegateAPIAdapter::mAdaptee;
    uint64_t v7 = qword_100074F88;
    if (qword_100074F88) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(qword_100074F88 + 8), 1uLL, memory_order_relaxed);
    }
    Adapter502_52::Adapter502_52(v8, &v6);
    uint64_t v1 = (std::__shared_weak_count *)v7;
    if (v7 && !atomic_fetch_add((atomic_ullong *volatile)(v7 + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
    uint64_t result = Adapter502_52::InitializeBanding((uint64_t)v8);
    uint64_t v3 = result;
    v8[0] = off_1000715B0;
    uint64_t v4 = v9;
    if (v9)
    {
      if (!atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
        return v3;
      }
    }
  }
  else
  {
    uint64_t v5 = *(uint64_t (**)(void))(*(void *)a1 + 24);
    return v5();
  }
  return result;
}

uint64_t DelegateAPIAdapter::ProcessImageData(DelegateAPIAdapter *this, _t_zn_IMAGEPARAMS *a2, _t_zn_IMAGEPARAMS *a3, void (*a4)(_t_zn_IMAGEPARAMS *))
{
  if (!this || !DelegateAPIAdapter::mAdaptee) {
    return 4294967293;
  }
  if (DelegateAPIAdapter::mWhichAPI == 502)
  {
    uint64_t v12 = DelegateAPIAdapter::mAdaptee;
    uint64_t v13 = qword_100074F88;
    if (qword_100074F88) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(qword_100074F88 + 8), 1uLL, memory_order_relaxed);
    }
    Adapter502_52::Adapter502_52(v14, &v12);
    uint64_t v7 = (std::__shared_weak_count *)v13;
    if (v13 && !atomic_fetch_add((atomic_ullong *volatile)(v13 + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
    uint64_t v8 = Adapter502_52::ProcessImageData((Adapter502_52 *)v14, this, a2, (void (*)(_t_zn_IMAGEPARAMS *))a3);
    v14[0] = off_1000715B0;
    uint64_t v9 = v15;
    if (v15)
    {
      if (!atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
    return v8;
  }
  uint64_t v11 = *(uint64_t (**)(void))(*(void *)this + 32);

  return v11();
}

uint64_t DelegateAPIAdapter::Acknowledge(DelegateAPIAdapter *this, void *a2, void *a3, void *a4)
{
  if (!a3 || !DelegateAPIAdapter::mAdaptee) {
    return 4294967293;
  }
  if (DelegateAPIAdapter::mWhichAPI != 502) {
    return 4294967292;
  }
  uint64_t v11 = DelegateAPIAdapter::mAdaptee;
  uint64_t v12 = qword_100074F88;
  if (qword_100074F88) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(qword_100074F88 + 8), 1uLL, memory_order_relaxed);
  }
  Adapter502_52::Adapter502_52(v13, &v11);
  uint64_t v7 = (std::__shared_weak_count *)v12;
  if (v12 && !atomic_fetch_add((atomic_ullong *volatile)(v12 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
  uint64_t v8 = Adapter502_52::Acknowledge((Adapter502_52 *)v13, (uint64_t)this, a2, a3);
  v13[0] = off_1000715B0;
  uint64_t v9 = v14;
  if (v14 && !atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
  }
  return v8;
}

uint64_t DelegateAPIAdapter::TerminateBanding(DelegateAPIAdapter *this, void *a2)
{
  if (!this || !DelegateAPIAdapter::mAdaptee) {
    return 4294967293;
  }
  if (DelegateAPIAdapter::mWhichAPI == 502)
  {
    uint64_t v8 = DelegateAPIAdapter::mAdaptee;
    uint64_t v9 = qword_100074F88;
    if (qword_100074F88) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(qword_100074F88 + 8), 1uLL, memory_order_relaxed);
    }
    Adapter502_52::Adapter502_52(v10, &v8);
    uint64_t v3 = (std::__shared_weak_count *)v9;
    if (v9 && !atomic_fetch_add((atomic_ullong *volatile)(v9 + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
    uint64_t result = Adapter502_52::TerminateBanding((Adapter502_52 *)v10, this);
    uint64_t v5 = result;
    v10[0] = off_1000715B0;
    uint64_t v6 = v11;
    if (v11)
    {
      if (!atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
        return v5;
      }
    }
  }
  else
  {
    uint64_t v7 = *(uint64_t (**)(void))(*(void *)this + 40);
    return v7();
  }
  return result;
}

uint64_t DelegateAPIAdapter::Terminate(DelegateAPIAdapter *this, void *a2)
{
  if (!this) {
    return 4294967293;
  }
  if (!DelegateAPIAdapter::mAdaptee) {
    return 4294967293;
  }
  if (DelegateAPIAdapter::mWhichAPI == 502)
  {
    uint64_t v8 = DelegateAPIAdapter::mAdaptee;
    uint64_t v9 = qword_100074F88;
    if (qword_100074F88) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(qword_100074F88 + 8), 1uLL, memory_order_relaxed);
    }
    Adapter502_52::Adapter502_52(v10, &v8);
    uint64_t v3 = (std::__shared_weak_count *)v9;
    if (v9 && !atomic_fetch_add((atomic_ullong *volatile)(v9 + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
    uint64_t v4 = Adapter502_52::Terminate((Adapter502_52 *)v10, this);
    v10[0] = off_1000715B0;
    uint64_t v5 = v11;
    if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
      return v4;
    }
    return v4;
  }
  uint64_t v7 = (*(uint64_t (**)(DelegateAPIAdapter *, void *))(*(void *)this + 48))(this, a2);
  (*(void (**)(DelegateAPIAdapter *))(*(void *)this + 8))(this);
  return v7;
}

uint64_t sub_1000375F0()
{
  qword_100074AB8 = 1506747311;
  *(void *)&xmmword_100074AC0 = 0x17CF513BAuLL;
  *((void *)&xmmword_100074AC0 + 1) = 0x160ADB3F7uLL;
  qword_100074AD0 = 0x1743E3AF0uLL;
  unk_100074AD8 = xmmword_10006F410;
  qword_100074AE8 = 0xFFFFFFFFLL;
  return __cxa_atexit((void (*)(void *))sub_100036994, &DelegateAPIAdapter::mAdaptee, (void *)&_mh_execute_header);
}

double pPreProc38(int a1, _t_zn_IMAGEPARAMS *a2, Adapter38_52 **a3)
{
  if (a3) {
    *(void *)&double result = Adapter38_52::CallShimPreProc(*a3, a1, a2).n128_u64[0];
  }
  return result;
}

uint64_t pPostProc38(uint64_t result, Adapter38_52 *this)
{
  if (this) {
    return Adapter38_52::CallShimPostProc((uint64_t)this, result);
  }
  return result;
}

uint64_t pNotifyProc38(uint64_t result, Adapter38_52 *this)
{
  if (this) {
    return Adapter38_52::CallShimNotifyProc((uint64_t)this, result);
  }
  return result;
}

uint64_t znStartup(uint64_t a1)
{
  int v2 = (std::__shared_weak_count *)operator new(0x20uLL);
  v2->__shared_owners_ = 0;
  v2->__vftable = (std::__shared_weak_count_vtbl *)off_100071578;
  v2->__shared_weak_owners_ = 0;
  v2[1].__vftable = (std::__shared_weak_count_vtbl *)off_1000716F0;
  uint64_t v6 = v2 + 1;
  uint64_t v7 = v2;
  atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  DelegateAPIAdapter::setAPIUsed((uint64_t *)&v6);
  uint64_t v3 = v7;
  if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
  uint64_t v4 = StartupCleanupAdapter::Startup(a1);
  if (!atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
  }
  return v4;
}

uint64_t znCleanup()
{
  return StartupCleanupAdapter::Cleanup(0);
}

void sub_100037834(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_100071578;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_100037854(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_100071578;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

uint64_t sub_1000378A8(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void *Adapter502_52::Adapter502_52(void *result, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v2 = a2[1];
  *double result = off_1000715B0;
  result[1] = v3;
  result[2] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t Adapter502_52::Initialize(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 16))();
}

uint64_t Adapter502_52::InitializeBanding(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 24))();
}

uint64_t Adapter502_52::ProcessImageData(Adapter502_52 *this, void *a2, _t_zn_IMAGEPARAMS *a3, void (*a4)(_t_zn_IMAGEPARAMS *))
{
  return (*(uint64_t (**)(void, void *, _t_zn_IMAGEPARAMS *, void (*)(_t_zn_IMAGEPARAMS *)))(**((void **)this + 1) + 40))(*((void *)this + 1), a2, a3, a4);
}

uint64_t Adapter502_52::Acknowledge(Adapter502_52 *this, uint64_t a2, void *a3, void *a4)
{
  return (*(uint64_t (**)(void, uint64_t, void *, void *))(**((void **)this + 1) + 32))(*((void *)this + 1), a2, a3, a4);
}

uint64_t Adapter502_52::TerminateBanding(Adapter502_52 *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 48))(*((void *)this + 1), a2);
}

uint64_t Adapter502_52::Terminate(Adapter502_52 *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 56))(*((void *)this + 1), a2);
}

uint64_t Adapter502_52::ProcessRange(Adapter502_52 *this, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t, void *, void *))(**((void **)this + 1) + 64))(*((void *)this + 1), a2, a3, a4, a5);
}

uint64_t Adapter502_52::InitializeParallel(Adapter502_52 *this, void *a2, int (*a3)(int, int, unsigned int, void *, void *), void *a4)
{
  return (*(uint64_t (**)(void, void *, int (*)(int, int, unsigned int, void *, void *), void *))(**((void **)this + 1) + 72))(*((void *)this + 1), a2, a3, a4);
}

uint64_t Adapter502_52::AssignWidth(Adapter502_52 *this, void *a2, int *a3)
{
  return (*(uint64_t (**)(void, void *, int *))(**((void **)this + 1) + 80))(*((void *)this + 1), a2, a3);
}

uint64_t Adapter502_52::AssignXDotsPerInch(Adapter502_52 *this, void *a2, int *a3)
{
  return (*(uint64_t (**)(void, void *, int *))(**((void **)this + 1) + 88))(*((void *)this + 1), a2, a3);
}

uint64_t Adapter502_52::AssignYDotsPerInch(Adapter502_52 *this, void *a2, int *a3)
{
  return (*(uint64_t (**)(void, void *, int *))(**((void **)this + 1) + 96))(*((void *)this + 1), a2, a3);
}

uint64_t Adapter502_52::AssignAlphaChannel(Adapter502_52 *this, void *a2, int *a3)
{
  return (*(uint64_t (**)(void, void *, int *))(**((void **)this + 1) + 104))(*((void *)this + 1), a2, a3);
}

uint64_t Adapter502_52::AssignBitsPerPixelPerColor(Adapter502_52 *this, void *a2, int *a3)
{
  return (*(uint64_t (**)(void, void *, int *))(**((void **)this + 1) + 112))(*((void *)this + 1), a2, a3);
}

uint64_t Adapter502_52::AssignXStride(Adapter502_52 *this, void *a2, int *a3)
{
  return (*(uint64_t (**)(void, void *, int *))(**((void **)this + 1) + 120))(*((void *)this + 1), a2, a3);
}

uint64_t Adapter502_52::AssignYStride(Adapter502_52 *this, void *a2, int *a3)
{
  return (*(uint64_t (**)(void, void *, int *))(**((void **)this + 1) + 128))(*((void *)this + 1), a2, a3);
}

uint64_t Adapter502_52::AssignHeight(Adapter502_52 *this, void *a2, int *a3)
{
  return (*(uint64_t (**)(void, void *, int *))(**((void **)this + 1) + 136))(*((void *)this + 1), a2, a3);
}

uint64_t Adapter502_52::AssignColorModel(Adapter502_52 *this, void *a2, int *a3)
{
  return (*(uint64_t (**)(void, void *, int *))(**((void **)this + 1) + 144))(*((void *)this + 1), a2, a3);
}

uint64_t Adapter502_52::AssignDataType(Adapter502_52 *this, void *a2, int *a3)
{
  return (*(uint64_t (**)(void, void *, int *))(**((void **)this + 1) + 152))(*((void *)this + 1), a2, a3);
}

uint64_t Adapter502_52::AssignPaletteColorModel(Adapter502_52 *this, void *a2, int *a3)
{
  return (*(uint64_t (**)(void, void *, int *))(**((void **)this + 1) + 160))(*((void *)this + 1), a2, a3);
}

uint64_t Adapter502_52::AssignPaletteBitsPerPixelPerColor(Adapter502_52 *this, void *a2, int *a3)
{
  return (*(uint64_t (**)(void, void *, int *))(**((void **)this + 1) + 168))(*((void *)this + 1), a2, a3);
}

uint64_t Adapter502_52::AssignInverted(Adapter502_52 *this, void *a2, int *a3)
{
  return (*(uint64_t (**)(void, void *, int *))(**((void **)this + 1) + 176))(*((void *)this + 1), a2, a3);
}

uint64_t Adapter502_52::AssignDataAccessFormat(Adapter502_52 *this, void *a2, int *a3)
{
  return (*(uint64_t (**)(void, void *, int *))(**((void **)this + 1) + 184))(*((void *)this + 1), a2, a3);
}

uint64_t Adapter502_52::StoreHeight(Adapter502_52 *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 200))(*((void *)this + 1), a2);
}

uint64_t Adapter502_52::StoreWidth(Adapter502_52 *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 192))(*((void *)this + 1), a2);
}

uint64_t Adapter502_52::StoreXDotsPerInch(Adapter502_52 *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 208))(*((void *)this + 1), a2);
}

uint64_t Adapter502_52::StoreYDotsPerInch(Adapter502_52 *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 216))(*((void *)this + 1), a2);
}

uint64_t Adapter502_52::StoreColorModel(Adapter502_52 *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 224))(*((void *)this + 1), a2);
}

uint64_t Adapter502_52::StoreAlphaChannel(Adapter502_52 *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 232))(*((void *)this + 1), a2);
}

uint64_t Adapter502_52::StoreBitsPerPixelPerColor(Adapter502_52 *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 240))(*((void *)this + 1), a2);
}

uint64_t Adapter502_52::StoreDataType(Adapter502_52 *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 248))(*((void *)this + 1), a2);
}

uint64_t Adapter502_52::StorePaletteColorModel(Adapter502_52 *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 256))(*((void *)this + 1), a2);
}

uint64_t Adapter502_52::StorePaletteBitsPerPixelPerColor(Adapter502_52 *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 264))(*((void *)this + 1), a2);
}

uint64_t Adapter502_52::StoreInverted(Adapter502_52 *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 272))(*((void *)this + 1), a2);
}

uint64_t Adapter502_52::StoreDataAccessFormat(Adapter502_52 *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 280))(*((void *)this + 1), a2);
}

uint64_t Adapter502_52::StoreXStride(Adapter502_52 *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 288))(*((void *)this + 1), a2);
}

uint64_t Adapter502_52::StoreYStride(Adapter502_52 *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 296))(*((void *)this + 1), a2);
}

void *sub_100037ED8(void *result)
{
  uint64_t v1 = result;
  *double result = off_1000715B0;
  uint64_t v2 = (std::__shared_weak_count *)result[2];
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

void sub_100037F70(void *a1)
{
  *a1 = off_1000715B0;
  uint64_t v1 = (std::__shared_weak_count *)a1[2];
  if (v1 && !atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
    std::__shared_weak_count::__release_weak(v1);
  }

  operator delete();
}

uint64_t SDK52API::Initialize(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, unint64_t *a5)
{
  return SDKInitialize(a2, a3, a4, a5);
}

uint64_t SDK52API::InitializeBanding(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return SDKInitializeBanding(a2, a3);
}

uint64_t SDK52API::Acknowledge(SDK52API *this, int a2, void *a3, Madusa::Session *a4)
{
  return SDKAcknowledge(a2, a3, a4);
}

uint64_t SDK52API::ProcessImageData(SDK52API *this, uint64_t a2, _t_zn_IMAGEPARAMS *a3, void (*a4)(_t_zn_IMAGEPARAMS *))
{
  return SDKProcessImageData(a2, a3);
}

uint64_t SDK52API::TerminateBanding(SDK52API *this, uint64_t a2)
{
  return SDKTerminateBanding(a2);
}

uint64_t SDK52API::Terminate(SDK52API *this, uint64_t a2)
{
  return SDKTerminate(a2);
}

uint64_t SDK52API::ProcessRange(SDK52API *this, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  return SDKProcessRange(a2, a3, a4, a5);
}

uint64_t SDK52API::InitializeParallel(SDK52API *this, uint64_t a2, int (*a3)(int, int, unsigned int, void *, void *), void *a4)
{
  return SDKInitializeParallel(a2, a3, a4);
}

void SDK52API::AssignWidth(SDK52API *this, uint64_t a2, int *a3, int a4)
{
}

void SDK52API::AssignXDotsPerInch(SDK52API *this, uint64_t a2, int *a3, int a4)
{
}

void SDK52API::AssignYDotsPerInch(SDK52API *this, uint64_t a2, int *a3, int a4)
{
}

void SDK52API::AssignAlphaChannel(SDK52API *this, uint64_t a2, int *a3, int a4)
{
}

void SDK52API::AssignBitsPerPixelPerColor(SDK52API *this, uint64_t a2, int *a3, int a4)
{
}

void SDK52API::AssignXStride(SDK52API *this, uint64_t a2, int *a3, int a4)
{
}

void SDK52API::AssignYStride(SDK52API *this, uint64_t a2, int *a3, int a4)
{
}

void SDK52API::AssignHeight(SDK52API *this, uint64_t a2, int *a3, int a4)
{
}

void SDK52API::AssignColorModel(SDK52API *this, uint64_t a2, int *a3, int a4)
{
}

void SDK52API::AssignDataType(SDK52API *this, uint64_t a2, int *a3, int a4)
{
}

void SDK52API::AssignPaletteColorModel(SDK52API *this, uint64_t a2, int *a3, int a4)
{
}

void SDK52API::AssignPaletteBitsPerPixelPerColor(SDK52API *this, uint64_t a2, int *a3, int a4)
{
}

void SDK52API::AssignInverted(SDK52API *this, uint64_t a2, int *a3, int a4)
{
}

void SDK52API::AssignDataAccessFormat(SDK52API *this, uint64_t a2, int *a3, int a4)
{
}

uint64_t SDK52API::StoreHeight(SDK52API *this, uint64_t a2, uint64_t a3)
{
  return SDKStoreHeight(a2, a3);
}

uint64_t SDK52API::StoreWidth(SDK52API *this, uint64_t a2, uint64_t a3)
{
  return SDKStoreWidth(a2, a3);
}

uint64_t SDK52API::StoreXDotsPerInch(SDK52API *this, uint64_t a2, uint64_t a3)
{
  return SDKStoreXDotsPerInch(a2, a3);
}

uint64_t SDK52API::StoreYDotsPerInch(SDK52API *this, uint64_t a2, uint64_t a3)
{
  return SDKStoreYDotsPerInch(a2, a3);
}

uint64_t SDK52API::StoreColorModel(SDK52API *this, uint64_t a2, uint64_t a3)
{
  return SDKStoreColorModel(a2, a3);
}

uint64_t SDK52API::StoreAlphaChannel(SDK52API *this, uint64_t a2, uint64_t a3)
{
  return SDKStoreAlphaChannel(a2, a3);
}

uint64_t SDK52API::StoreBitsPerPixelPerColor(SDK52API *this, uint64_t a2, uint64_t a3)
{
  return SDKStoreBitsPerPixelPerColor(a2, a3);
}

uint64_t SDK52API::StoreDataType(SDK52API *this, uint64_t a2, uint64_t a3)
{
  return SDKStoreDataType(a2, a3);
}

uint64_t SDK52API::StorePaletteColorModel(SDK52API *this, uint64_t a2, uint64_t a3)
{
  return SDKStorePaletteColorModel(a2, a3);
}

uint64_t SDK52API::StorePaletteBitsPerPixelPerColor(SDK52API *this, uint64_t a2, uint64_t a3)
{
  return SDKStorePaletteBitsPerPixelPerColor(a2, a3);
}

uint64_t SDK52API::StoreInverted(SDK52API *this, uint64_t a2, uint64_t a3)
{
  return SDKStoreInverted(a2, a3);
}

uint64_t SDK52API::StoreDataAccessFormat(SDK52API *this, uint64_t a2, uint64_t a3)
{
  return SDKStoreDataAccessFormat(a2, a3);
}

uint64_t SDK52API::StoreXStride(SDK52API *this, uint64_t a2, uint64_t a3)
{
  return SDKStoreXStride(a2, a3);
}

uint64_t SDK52API::StoreYStride(SDK52API *this, uint64_t a2, uint64_t a3)
{
  return SDKStoreYStride(a2, a3);
}

uint64_t StartupCleanupAdapter::Startup(uint64_t a1)
{
  v9[12] = xmmword_10006F4F0;
  v9[13] = unk_10006F500;
  v9[14] = xmmword_10006F510;
  v9[15] = unk_10006F520;
  v9[8] = xmmword_10006F4B0;
  v9[9] = unk_10006F4C0;
  v9[10] = xmmword_10006F4D0;
  v9[11] = unk_10006F4E0;
  v9[4] = xmmword_10006F470;
  v9[5] = unk_10006F480;
  v9[6] = xmmword_10006F490;
  v9[7] = unk_10006F4A0;
  v9[0] = xmmword_10006F430;
  v9[1] = unk_10006F440;
  v9[2] = xmmword_10006F450;
  v9[3] = unk_10006F460;
  uint64_t v7 = v9;
  uint64_t v8 = 32;
  int v6 = 512;
  v5[1] = a1;
  v5[0] = 0x200000028;
  v2[0] = 0x200000020;
  int v3 = 157;
  v2[1] = v5;
  uint64_t v4 = h5001x;
  return API52::Startup(v2);
}

double Adapter38_52::Adapter38_52(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v2 = a2[1];
  *(void *)a1 = off_100071830;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  *(_DWORD *)(a1 + 24) = -1;
  *(void *)(a1 + 32) = 0;
  *(_DWORD *)(a1 + 40) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_DWORD *)(a1 + 304) = 1;
  return result;
}

__n128 Adapter38_52::CallShimPreProc(Adapter38_52 *this, int a2, _t_zn_IMAGEPARAMS *a3)
{
  *((_DWORD *)this + 6) = a2;
  uint64_t v5 = *((void *)this + 13);
  long long v6 = *(_OWORD *)&a3->unSize;
  long long v7 = *(_OWORD *)&a3->nYDotsPerInch;
  long long v8 = *(_OWORD *)&a3->aColorComponents[3];
  *(_OWORD *)(v5 + 32) = *(_OWORD *)&a3->DataType;
  *(_OWORD *)(v5 + 48) = v8;
  *(_OWORD *)(v5 + 16) = v7;
  long long v9 = *(_OWORD *)&a3->pPaletteData;
  long long v10 = *(_OWORD *)&a3->nXStride;
  long long v11 = *(_OWORD *)&a3->apLogical00[3];
  *(_OWORD *)(v5 + 96) = *(_OWORD *)&a3->apLogical00[1];
  *(_OWORD *)(v5 + 112) = v11;
  *(_OWORD *)(v5 + 64) = v9;
  *(_OWORD *)(v5 + 80) = v10;
  long long v12 = *(_OWORD *)&a3->nTileCount;
  long long v13 = *(_OWORD *)&a3->pLockTileProc;
  long long v14 = *(_OWORD *)&a3->pUnlockTileProc;
  *(void *)(v5 + 176) = *(void *)&a3->nXOffset;
  *(_OWORD *)(v5 + 144) = v13;
  *(_OWORD *)(v5 + 160) = v14;
  *(_OWORD *)(v5 + 128) = v12;
  *(_OWORD *)uint64_t v5 = v6;
  (*((void (**)(void))this + 4))(*((void *)this + 13));
  uint64_t v15 = (long long *)*((void *)this + 13);
  long long v16 = *v15;
  long long v17 = v15[1];
  long long v18 = v15[3];
  *(_OWORD *)&a3->int DataType = v15[2];
  *(_OWORD *)&a3->aColorComponents[3] = v18;
  *(_OWORD *)&a3->unsigned int unSize = v16;
  *(_OWORD *)&a3->int nYDotsPerInch = v17;
  long long v19 = v15[4];
  long long v20 = v15[5];
  long long v21 = v15[7];
  *(_OWORD *)&a3->apLogical00[1] = v15[6];
  *(_OWORD *)&a3->apLogical00[3] = v21;
  *(_OWORD *)&a3->pPaletteData = v19;
  *(_OWORD *)&a3->nXStride = v20;
  __n128 result = (__n128)v15[8];
  long long v23 = v15[9];
  long long v24 = v15[10];
  *(void *)&a3->nXOffset = *((void *)v15 + 22);
  *(_OWORD *)&a3->pLockTileProc = v23;
  *(_OWORD *)&a3->pUnlockTileProc = v24;
  *(__n128 *)&a3->nTileCount = result;
  return result;
}

uint64_t Adapter38_52::CallShimPostProc(uint64_t this, int a2)
{
  *(_DWORD *)(this + 24) = a2;
  return this;
}

uint64_t Adapter38_52::CallShimNotifyProc(uint64_t this, int a2)
{
  *(_DWORD *)(this + 24) = a2;
  *(_DWORD *)(this + 40) = 1;
  return this;
}

uint64_t Adapter38_52::Initialize(Adapter38_52 *this, uint64_t a2, unsigned int *a3)
{
  *((_OWORD *)this + 4) = 0u;
  *((void *)this + 10) = 0;
  *((void *)this + 11) = this;
  uint64_t v3 = *((void *)this + 1);
  *((_OWORD *)this + 3) = 0u;
  return (*(uint64_t (**)(uint64_t, char *, uint64_t, unsigned int *, char *))(*(void *)v3 + 16))(v3, (char *)this + 48, a2, a3, (char *)this + 96);
}

uint64_t Adapter38_52::InitializeBanding(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 40) = 0;
  return (*(uint64_t (**)(void, void, uint64_t))(**(void **)(a1 + 8) + 24))(*(void *)(a1 + 8), *(void *)(a1 + 96), a2);
}

uint64_t Adapter38_52::ProcessImageData(Adapter38_52 *this, _t_zn_IMAGEPARAMS *a2, void (*a3)(_t_zn_IMAGEPARAMS *))
{
  *((void *)this + 4) = a3;
  *((void *)this + 37) = this;
  *((void *)this + 13) = a2;
  uint64_t result = (*(uint64_t (**)(void, void, char *, void))(**((void **)this + 1) + 40))(*((void *)this + 1), *((void *)this + 12), (char *)this + 112, 0);
  if (!result)
  {
    uint64_t v5 = *(uint64_t (**)(void))(**((void **)this + 1) + 32);
    return v5();
  }
  return result;
}

uint64_t Adapter38_52::CheckLevels(Adapter38_52 *this, unsigned int *a2)
{
  *a2 = *((_DWORD *)this + 10);
  return 0;
}

uint64_t Adapter38_52::LevelsReached(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)(a3 + 4) = *(_DWORD *)(a1 + 304);
  return 0;
}

uint64_t Adapter38_52::TerminateBanding(Adapter38_52 *this)
{
  return (*(uint64_t (**)(void, void))(**((void **)this + 1) + 48))(*((void *)this + 1), *((void *)this + 12));
}

uint64_t Adapter38_52::Terminate(Adapter38_52 *this)
{
  return (*(uint64_t (**)(void, void))(**((void **)this + 1) + 56))(*((void *)this + 1), *((void *)this + 12));
}

void *sub_100038600(void *result)
{
  uint64_t v1 = result;
  *uint64_t result = off_100071830;
  uint64_t v2 = (std::__shared_weak_count *)result[2];
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

void sub_100038698(void *a1)
{
  *a1 = off_100071830;
  uint64_t v1 = (std::__shared_weak_count *)a1[2];
  if (v1 && !atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
    std::__shared_weak_count::__release_weak(v1);
  }

  operator delete();
}

void sub_100038740()
{
  v0[0] = 136315650;
  sub_100003698();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s: enter pUserData=%p token=%u", (uint8_t *)v0, 0x1Cu);
}

void sub_1000387C8()
{
  v0[0] = 136315650;
  sub_100003698();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s: enter pUserData=%p token=%u", (uint8_t *)v0, 0x1Cu);
}

void sub_100038850(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000388CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100038948(int a1)
{
  int v1 = 136315394;
  uint64_t v2 = "initZn";
  __int16 v3 = 1024;
  int v4 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s: result=%d", (uint8_t *)&v1, 0x12u);
}

void sub_1000389DC(uint64_t a1)
{
  int v1 = 136315394;
  uint64_t v2 = "initZn";
  __int16 v3 = 2048;
  uint64_t v4 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s: userContext=%p", (uint8_t *)&v1, 0x16u);
}

void sub_100038A70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100038AE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100038B5C(int *a1, int a2)
{
  int v2 = *a1;
  v3[0] = 67109376;
  v3[1] = a2;
  __int16 v4 = 1024;
  int v5 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "result from znAcknowledge is %d, token is %d", (uint8_t *)v3, 0xEu);
}

void sub_100038BEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100038C60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::terminate(void)
{
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

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return ___cxa_atexit(lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

__float2 __sincosf_stret(float a1)
{
  __float2 v3 = ___sincosf_stret(a1);
  float cosval = v3.__cosval;
  float sinval = v3.__sinval;
  result.__float cosval = cosval;
  result.__float sinval = sinval;
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

float atan2f(float a1, float a2)
{
  return _atan2f(a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

clock_t clock(void)
{
  return _clock();
}

float cosf(float a1)
{
  return _cosf(a1);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fegetenv(fenv_t *a1)
{
  return _fegetenv(a1);
}

int fesetenv(const fenv_t *a1)
{
  return _fesetenv(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fread(__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

float sinf(float a1)
{
  return _sinf(a1);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

vImage_Error vImageScale_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return _vImageScale_Planar8(src, dest, tempBuffer, flags);
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}