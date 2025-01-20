void sub_262F5B268(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_262F5C7E8()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262F5C81C(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

uint64_t sub_262F5D920()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262F5D954(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

void sub_262F6125C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_262F64920(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v7 = objc_msgSend_width(v3, v4, v5, v6);
  uint64_t v11 = objc_msgSend_height(v3, v8, v9, v10) * v7;
  uint64_t v15 = v11 * objc_msgSend_depth(v3, v12, v13, v14);
  v16 = (float *)malloc_type_malloc(4 * v15, 0x100004052888210uLL);
  uint64_t v20 = 4 * objc_msgSend_width(v3, v17, v18, v19);
  uint64_t v24 = objc_msgSend_width(v3, v21, v22, v23);
  uint64_t v28 = 4 * v24 * objc_msgSend_height(v3, v25, v26, v27);
  memset(v47, 0, 24);
  v47[3] = objc_msgSend_width(v3, v29, v30, v31);
  v47[4] = objc_msgSend_height(v3, v32, v33, v34);
  v47[5] = objc_msgSend_depth(v3, v35, v36, v37);
  objc_msgSend_getBytes_bytesPerRow_bytesPerImage_fromRegion_mipmapLevel_slice_(v3, v38, (uint64_t)v16, v20, v28, v47, 0, 0);
  double v39 = 0.0;
  if (v15)
  {
    float v40 = 3.4028e38;
    float v41 = 1.1755e-38;
    v42 = v16;
    do
    {
      float v43 = *v42++;
      float v44 = v43;
      if (v43 < v40) {
        float v40 = v44;
      }
      if (v44 > v41) {
        float v41 = v44;
      }
      double v39 = v39 + v44;
      --v15;
    }
    while (v15);
    double v45 = v40;
    double v46 = v41;
  }
  else
  {
    double v46 = 1.17549435e-38;
    double v45 = 3.40282347e38;
  }
  NSLog(&cfstr_SFFG.isa, a2, *(void *)&v45, *(void *)&v46, *(void *)&v39);
  free(v16);
}

void sub_262F674E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_262F6B0A4(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend_GPUEndTime(v2, v3, v4, v5);
  objc_msgSend_GPUStartTime(v2, v6, v7, v8);

  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
  }
}

void sub_262F6B144(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

void sub_262F6CB24(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend_GPUEndTime(v2, v3, v4, v5);
  objc_msgSend_GPUStartTime(v2, v6, v7, v8);

  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
  }
}

void sub_262F6CBC4(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

void sub_262F6EFD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,void *a36)
{
  _Unwind_Resume(a1);
}

void sub_262F6F030(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

void sub_262F70884(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend_GPUEndTime(v2, v3, v4, v5);
  objc_msgSend_GPUStartTime(v2, v6, v7, v8);

  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
  }
}

void sub_262F70924(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

void sub_262F709E0(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend_GPUEndTime(v2, v3, v4, v5);
  objc_msgSend_GPUStartTime(v2, v6, v7, v8);

  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
  }
}

void sub_262F70A80(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

void sub_262F724C4(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend_GPUEndTime(v2, v3, v4, v5);
  objc_msgSend_GPUStartTime(v2, v6, v7, v8);

  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
  }
}

void sub_262F72564(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

void sub_262F7694C(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend_GPUEndTime(v2, v3, v4, v5);
  objc_msgSend_GPUStartTime(v2, v6, v7, v8);

  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
  }
}

void sub_262F769EC(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

void sub_262F77BA8(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend_GPUEndTime(v2, v3, v4, v5);
  objc_msgSend_GPUStartTime(v2, v6, v7, v8);

  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
  }
}

void sub_262F77C48(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

void sub_262F7883C(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend_GPUEndTime(v2, v3, v4, v5);
  objc_msgSend_GPUStartTime(v2, v6, v7, v8);

  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
  }
}

void sub_262F788DC(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

void sub_262F796CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_262F7A294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  for (uint64_t i = 264; i != -24; i -= 24)
    sub_262F7A2C8((uint64_t)(&a44 + i));
  _Unwind_Resume(a1);
}

void sub_262F7A2C8(uint64_t a1)
{
  id v2 = *(void **)(a1 + 8);
}

void sub_262F7A840(_Unwind_Exception *a1)
{
  for (uint64_t i = 216; i != -24; i -= 24)
    sub_262F7A2C8((uint64_t)&STACK[0x218] + i);
  _Unwind_Resume(a1);
}

void sub_262F7AE10(_Unwind_Exception *a1)
{
  for (uint64_t i = 216; i != -24; i -= 24)
    sub_262F7A2C8((uint64_t)&STACK[0x218] + i);
  _Unwind_Resume(a1);
}

uint64_t sub_262F7C9F4(void *a1)
{
  id v1 = a1;
  uint64_t v5 = objc_msgSend_device(v1, v2, v3, v4, 0, 0, 0, 0);
  objc_msgSend_pixelFormat(v1, v6, v7, v8);

  MTLPixelFormatGetInfoForDevice();
  return 0;
}

void sub_262F8515C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,void *a58,void *a59)
{
  _Unwind_Resume(a1);
}

uint64_t sub_262F857EC(float32x2_t *a1, void *a2, uint64_t a3, int a4)
{
  uint64_t v7 = a2;
  int isEqualToString = objc_msgSend_isEqualToString_(v7[5], v8, @"2019_LowLight", v9);
  uint64_t v11 = 36;
  if (!isEqualToString) {
    uint64_t v11 = 0;
  }
  float v12 = *(float *)(a3 + v11);
  uint64_t v15 = v7;
  v16 = v15[5];
  if (v16 && !objc_msgSend_isEqualToString_(v16, v13, @"2019_DF", v14))
  {
    if (!objc_msgSend_isEqualToString_(v15[5], v17, @"2019_LowLight", v18)) {
      goto LABEL_17;
    }
    float v37 = powf(*((float *)v15 + 3), (float)a4);
    float v24 = (float)(v37 * powf(v12, *((float *)v15 + 6))) * *((float *)v15 + 8);
  }
  else
  {
    float v19 = ldexpf(1.0, -a4);
    float v20 = powf(v12, v19 / *((float *)v15 + 3));
    float v21 = exp2f((float)-a4 / v20);
    float v24 = powf(v12, *((float *)v15 + 6)) * v21;
  }
  float v25 = (float)(1.0 / sqrtf((float)(1 << a4))) * 0.0039216;
  a1->f32[0] = (float)(v25 * v24) / *((float *)v15 + 4);
  float v26 = *((float *)v15 + 7);
  if (v12 > 8.0) {
    float v26 = v26 + v26;
  }
  a1->f32[1] = v24 / v26;
  a1[1].f32[0] = v25 * v24;
  uint64_t v27 = v15[5];
  if (!v27 || objc_msgSend_isEqualToString_(v27, v22, @"2019_DF", v23))
  {
    float v30 = (float)((float)((float)a4 + 1.0) * (float)((float)a4 + 1.0))
        * powf(*((float *)v15 + 2), (float)((float)a4 + 1.0) / -1.9);
    *(float *)&long long v31 = v30 * (float)(v25 * powf(v12 * *(float *)(a3 + 8), *((float *)v15 + 5)));
    long long v41 = v31;
    a1[2].i32[0] = v31;
    float v34 = v30 * (float)(v25 * powf(v12 * *(float *)(a3 + 4), *((float *)v15 + 5)));
    goto LABEL_11;
  }
  if (!objc_msgSend_isEqualToString_(v15[5], v28, @"2019_LowLight", v29))
  {
LABEL_17:
    uint64_t v35 = FigSignalErrorAt();
    goto LABEL_18;
  }
  float v38 = powf(*((float *)v15 + 2), (float)a4);
  *(float *)&long long v39 = *((float *)v15 + 9)
                 * (float)(v38 * (float)(v25 * powf(v12 * *(float *)(a3 + 8), *((float *)v15 + 5))));
  long long v41 = v39;
  a1[2].i32[0] = v39;
  float v34 = *((float *)v15 + 9) * (float)(v38 * (float)(v25 * powf(v12 * *(float *)(a3 + 4), *((float *)v15 + 5))));
LABEL_11:
  a1[2] = (float32x2_t)__PAIR64__(LODWORD(v34), v41);
  uint64_t v35 = 0;
  if (objc_msgSend_isEqualToString_(v15[5], v32, @"2019_DF", v33, v41))
  {
    float32x2_t v36 = (float32x2_t)vdup_n_s32(0x437F0000u);
    a1[1].f32[0] = a1[1].f32[0] * 255.0;
    *a1 = vmul_f32(*a1, v36);
    a1[2] = vmul_f32(a1[2], v36);
  }
LABEL_18:

  return v35;
}

float32x2_t sub_262F85B78(float32x2_t *a1, float a2)
{
  a1->f32[0] = a1->f32[0] * a2;
  a1[1].f32[0] = a1[1].f32[0] * a2;
  float32x2_t result = vmul_n_f32(a1[2], a2);
  a1[2] = result;
  return result;
}

void sub_262F85FB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

float sub_262F86BCC(float *a1, float *a2, unsigned int a3, int a4)
{
  if (a3)
  {
    int v8 = 0;
    unsigned int v9 = 0;
    float v57 = (float)a3;
    float v10 = 0.0;
    uint64_t v11 = a3;
    float v12 = 0.0;
    uint64_t v56 = a3;
    while (1)
    {
      unsigned int v13 = 0;
      do
      {
        unsigned int v14 = 747796405 * v9 - 1403630843;
        unsigned int v15 = 277803737 * ((v9 >> ((v9 >> 28) + 4)) ^ v9);
        unsigned int v16 = (v15 ^ (v15 >> 22)) % a3;
        float v17 = a1[v16];
        float v18 = a2[v16];
        unsigned int v19 = 277803737 * ((v14 >> ((v14 >> 28) + 4)) ^ v14);
        unsigned int v20 = (v19 ^ (v19 >> 22)) % a3;
        float v21 = a1[v20];
        float v22 = a2[v20];
        float v23 = v17 + v21;
        if (a4)
        {
          float v24 = fminf((float)((float)(v18 + v22) - v23) * 0.5, 0.00048828);
          if (v24 < -0.00048828) {
            float v24 = -0.00048828;
          }
          float v25 = 1.0;
        }
        else
        {
          float v26 = (float)(v21 * v21) + (float)(v17 * v17);
          float v27 = (float)(v26 * 2.0) - (float)(v23 * v23);
          if (v27 <= 0.00000095367)
          {
            float v25 = 1.0;
            float v24 = 0.0;
          }
          else
          {
            float v28 = (float)(v21 * v22) + (float)(v17 * v18);
            float v29 = v18 + v22;
            float v24 = (float)((float)(v28 * (float)-v23) + (float)(v29 * v26)) / v27;
            float v25 = (float)((float)(v28 * 2.0) - (float)(v29 * v23)) / v27;
          }
        }
        unsigned int v9 = 747796405 * v14 - 1403630843;
      }
      while (v24 == 0.0 && v13++ < 9);
      if (v24 != 0.0)
      {
        float v31 = sqrtf((float)(v25 * v25) + 1.0);
        float v32 = 0.0;
        uint64_t v33 = v11;
        float v34 = a2;
        uint64_t v35 = a1;
        float v36 = 0.0;
        float v37 = 0.0;
        float v38 = 0.0;
        float v39 = 0.0;
        do
        {
          float v40 = *v35;
          float v41 = *v34;
          if ((float)(vabds_f32(v24 + (float)(v25 * *v35), *v34) / v31) < 0.00097656)
          {
            float v39 = v39 + 1.0;
            float v38 = v38 + v40;
            float v37 = v37 + (float)(v40 * v40);
            float v36 = v36 + v41;
            float v32 = v32 + (float)(v40 * v41);
          }
          ++v35;
          ++v34;
          --v33;
        }
        while (v33);
        if (v39 == 0.0) {
          return v10;
        }
        if (a4)
        {
          float v42 = fminf((float)(v36 - v38) / v39, 0.00048828);
          if (v42 >= -0.00048828) {
            float v43 = v42;
          }
          else {
            float v43 = -0.00048828;
          }
          float v44 = 1.0;
        }
        else
        {
          float v45 = (float)(v39 * v37) - (float)(v38 * v38);
          if (v45 <= 0.00000095367)
          {
            float v44 = 1.0;
            float v43 = 0.0;
          }
          else
          {
            float v43 = (float)((float)(v32 * (float)-v38) + (float)(v36 * v37)) / v45;
            float v44 = (float)((float)(v39 * v32) - (float)(v36 * v38)) / v45;
          }
        }
        unsigned int v46 = 0;
        float v47 = sqrtf((float)(v44 * v44) + 1.0);
        float v48 = 0.0;
        uint64_t v49 = v11;
        v50 = a2;
        v51 = a1;
        do
        {
          float v52 = vabds_f32(v43 + (float)(v44 * *v51), *v50) / v47;
          if (v52 < 0.00073242)
          {
            ++v46;
            float v48 = v48 + (float)((float)(1.0 - *v51) * (float)((float)(v52 * -1024.0) + 1.0));
          }
          ++v51;
          ++v50;
          --v49;
        }
        while (v49);
        if (v48 > v12)
        {
          float v53 = logf(1.0 - (float)((float)((float)v46 / v57) * (float)((float)v46 / v57)));
          uint64_t v11 = v56;
          BOOL v54 = (float)(-6.9078 / v53) > (float)v8;
          float v10 = v43;
          float v12 = v48;
          if (!v54) {
            return v43;
          }
        }
      }
      ++v8;
      float v43 = v10;
      if (v8 == 500) {
        return v43;
      }
    }
  }
  return 0.0;
}

void sub_262F8752C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_262F883C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_262F883EC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_262F883FC(uint64_t a1)
{
}

void sub_262F88404(void *a1, void *a2)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(*(void *)(a1[5] + 8) + 40);
  uint64_t v4 = *(void *)(*(void *)(a1[6] + 8) + 40);
  id v8 = a2;
  objc_msgSend_calculateAdjustmentParametersWithParamsBuffer_statsBuffer_(v2, v5, v3, v4);
  objc_msgSend_setSignaledValue_(v8, v6, 2, v7);
}

uint64_t sub_262F88480()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262F884B4(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

uint64_t sub_262F890A8()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262F890DC(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

uint64_t sub_262F894F0()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262F89524(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

uint64_t sub_262F8997C()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262F899B0(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

uint64_t sub_262F89E68()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262F89E9C(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

CGFloat sub_262F8A92C@<D0>(int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v3 = MEMORY[0x263F000D0];
  long long v15 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  long long v16 = *MEMORY[0x263F000D0];
  *(_OWORD *)a2 = *MEMORY[0x263F000D0];
  *(_OWORD *)(a2 + 16) = v15;
  long long v14 = *(_OWORD *)(v3 + 32);
  *(_OWORD *)(a2 + 32) = v14;
  CGFloat v4 = 0.0;
  switch(a1)
  {
    case 2:
      int v5 = 0;
      goto LABEL_9;
    case 3:
      int v6 = 0;
      int v5 = 1;
      CGFloat v4 = 3.14159265;
      break;
    case 4:
      int v5 = 1;
      CGFloat v4 = 3.14159265;
      goto LABEL_9;
    case 5:
      int v5 = 1;
      CGFloat v4 = 1.57079633;
      goto LABEL_9;
    case 6:
      int v6 = 0;
      int v5 = 1;
      CGFloat v4 = 1.57079633;
      break;
    case 7:
      int v5 = 1;
      CGFloat v4 = 4.71238898;
LABEL_9:
      int v6 = 1;
      break;
    case 8:
      int v6 = 0;
      int v5 = 1;
      CGFloat v4 = 4.71238898;
      break;
    default:
      int v5 = 0;
      int v6 = 0;
      break;
  }
  CGAffineTransformMakeTranslation(&t2, -0.5, -0.5);
  *(_OWORD *)&t1.a = v16;
  *(_OWORD *)&t1.c = v15;
  *(_OWORD *)&t1.tx = v14;
  CGAffineTransformConcat((CGAffineTransform *)a2, &t1, &t2);
  if (v6)
  {
    CGAffineTransformMakeScale(&v20, -1.0, 1.0);
    long long v7 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)&v19.a = *(_OWORD *)a2;
    *(_OWORD *)&v19.c = v7;
    *(_OWORD *)&v19.tx = *(_OWORD *)(a2 + 32);
    CGAffineTransformConcat(&t1, &v19, &v20);
    long long v8 = *(_OWORD *)&t1.c;
    *(_OWORD *)a2 = *(_OWORD *)&t1.a;
    *(_OWORD *)(a2 + 16) = v8;
    *(_OWORD *)(a2 + 32) = *(_OWORD *)&t1.tx;
  }
  if (v5)
  {
    CGAffineTransformMakeRotation(&v18, v4);
    long long v9 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)&v19.a = *(_OWORD *)a2;
    *(_OWORD *)&v19.c = v9;
    *(_OWORD *)&v19.tx = *(_OWORD *)(a2 + 32);
    CGAffineTransformConcat(&t1, &v19, &v18);
    long long v10 = *(_OWORD *)&t1.c;
    *(_OWORD *)a2 = *(_OWORD *)&t1.a;
    *(_OWORD *)(a2 + 16) = v10;
    *(_OWORD *)(a2 + 32) = *(_OWORD *)&t1.tx;
  }
  CGAffineTransformMakeTranslation(&v17, 0.5, 0.5);
  long long v11 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&v19.a = *(_OWORD *)a2;
  *(_OWORD *)&v19.c = v11;
  *(_OWORD *)&v19.tx = *(_OWORD *)(a2 + 32);
  CGAffineTransformConcat(&t1, &v19, &v17);
  long long v12 = *(_OWORD *)&t1.c;
  *(_OWORD *)a2 = *(_OWORD *)&t1.a;
  *(_OWORD *)(a2 + 16) = v12;
  CGFloat result = t1.tx;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&t1.tx;
  return result;
}

id sub_262F8AB48(void *a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v6 = objc_msgSend_count(v1, v3, v4, v5);
  long long v9 = objc_msgSend_initWithCapacity_(v2, v7, v6, v8);
  if (v1)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = v1;
    uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v24, (uint64_t)v33, 16);
    if (v15)
    {
      uint64_t v16 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v10);
          }
          CGAffineTransform v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v29 = 0;
          float v30 = &v29;
          uint64_t v31 = 0x2050000000;
          CGAffineTransform v19 = (void *)qword_26A99A520;
          uint64_t v32 = qword_26A99A520;
          if (!qword_26A99A520)
          {
            v28[0] = MEMORY[0x263EF8330];
            v28[1] = 3221225472;
            v28[2] = sub_262F8AD88;
            v28[3] = &unk_2655C3358;
            v28[4] = &v29;
            sub_262F8AD88((uint64_t)v28, v12, v13, v14);
            CGAffineTransform v19 = (void *)v30[3];
          }
          id v20 = v19;
          _Block_object_dispose(&v29, 8);
          if (objc_opt_isKindOfClass())
          {
            float v21 = objc_msgSend_landmarks(v18, v12, v13, v14);
            BOOL v22 = v21 == 0;

            if (!v22) {
              objc_msgSend_addObject_(v9, v12, (uint64_t)v18, v14);
            }
          }
        }
        uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v12, (uint64_t)&v24, (uint64_t)v33, 16);
      }
      while (v15);
    }
  }

  return v9;
}

void sub_262F8AD68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_262F8AD88(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v9[0] = 0;
  if (!qword_26B429628)
  {
    v9[1] = (void *)MEMORY[0x263EF8330];
    v9[2] = (void *)3221225472;
    v9[3] = sub_262F8AEB4;
    v9[4] = &unk_2655C3390;
    v9[5] = v9;
    long long v10 = xmmword_2655C3378;
    uint64_t v11 = 0;
    qword_26B429628 = _sl_dlopen();
  }
  if (!qword_26B429628) {
    sub_263011600(v9, a2, a3, a4);
  }
  if (v9[0]) {
    free(v9[0]);
  }
  Class result = objc_getClass("VNFaceObservation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_263011680((uint64_t)result, v6, v7, v8);
  }
  qword_26A99A520 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_262F8AEB4()
{
  uint64_t result = _sl_dlopen();
  qword_26B429628 = result;
  return result;
}

void sub_262F8B96C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_262F8E4B0(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend_GPUEndTime(v2, v3, v4, v5);
  objc_msgSend_GPUStartTime(v2, v6, v7, v8);

  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
  }
}

void sub_262F8E550(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

void sub_262F8F6A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double sub_262F8FE24(uint64_t a1, float32x4_t *a2, float32x4_t *a3)
{
  uint64_t v3 = 0;
  float32x4_t v4 = *a2;
  float32x4_t v5 = a2[1];
  float32x4_t v6 = a2[2];
  long long v16 = *(_OWORD *)(a1 + 32);
  float32x4_t v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v17 + v3 * 16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(v15[v3])), v5, *(float32x2_t *)&v15[v3], 1), v6, (float32x4_t)v15[v3], 2);
    ++v3;
  }
  while (v3 != 3);
  uint64_t v7 = 0;
  float32x4_t v10 = v17;
  long long v8 = v18;
  long long v9 = v19;
  v10.i32[3] = 0;
  HIDWORD(v8) = 0;
  HIDWORD(v9) = 0;
  float32x4_t v11 = *a3;
  float32x4_t v12 = a3[1];
  float32x4_t v13 = a3[2];
  v15[0] = v10;
  v15[1] = v8;
  long long v16 = v9;
  float32x4_t v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v17 + v7 * 16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v11, COERCE_FLOAT(v15[v7])), v12, *(float32x2_t *)&v15[v7], 1), v13, (float32x4_t)v15[v7], 2);
    ++v7;
  }
  while (v7 != 3);
  if (fabsf(*((float *)&v19 + 2)) > 0.00000001) {
    v10.i64[0] = vmulq_n_f32(v17, 1.0 / *((float *)&v19 + 2)).u64[0];
  }
  return *(double *)v10.i64;
}

uint64_t sub_262F945AC(void *a1, float *a2, float *a3)
{
  id v5 = a1;
  long long v8 = objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x263F2F530], v7);
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v5, v9, *MEMORY[0x263F2F540], v10);
  float32x4_t v12 = (void *)v11;
  if (v11) {
    float32x4_t v13 = (void *)v11;
  }
  else {
    float32x4_t v13 = v8;
  }
  id v14 = v13;

  float32x4_t v17 = objc_msgSend_objectForKeyedSubscript_(v5, v15, *MEMORY[0x263F2F4E8], v16);
  uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v5, v18, *MEMORY[0x263F2F4D8], v19);
  long long v24 = (void *)v20;
  if (v8) {
    BOOL v25 = v20 == 0;
  }
  else {
    BOOL v25 = 1;
  }
  if (v25 || v17 == 0)
  {
    FigDebugAssert3();
    uint64_t v84 = 4294954512;
    goto LABEL_22;
  }
  if ((unint64_t)objc_msgSend_length(v14, v21, v22, v23) > 0x1B018
    || (long long v27 = v24,
        id v28 = v14,
        uint64_t v32 = (const void *)objc_msgSend_bytes(v28, v29, v30, v31),
        uint64_t v33 = v28,
        long long v24 = v27,
        size_t v37 = objc_msgSend_length(v33, v34, v35, v36),
        memcpy(a3 + 27654, v32, v37),
        (unint64_t)objc_msgSend_length(v27, v38, v39, v40) >= 0x205))
  {
    FigDebugAssert3();
    uint64_t v84 = 4294954516;
    goto LABEL_22;
  }
  float v41 = a3 + 55308;
  id v42 = v27;
  unsigned int v46 = (const void *)objc_msgSend_bytes(v42, v43, v44, v45);
  size_t v50 = objc_msgSend_length(v42, v47, v48, v49);
  memcpy(a3 + 55308, v46, v50);
  if ((unint64_t)objc_msgSend_length(v17, v51, v52, v53) >= 0x205)
  {
    FigDebugAssert3();
    uint64_t v84 = 4294954516;
LABEL_27:
    long long v24 = v27;
    goto LABEL_22;
  }
  BOOL v54 = v17;
  id v55 = v14;
  v86 = v54;
  id v56 = v54;
  v60 = (const void *)objc_msgSend_bytes(v56, v57, v58, v59);
  size_t v64 = objc_msgSend_length(v56, v61, v62, v63);
  memcpy(a3 + 55437, v60, v64);
  if ((unint64_t)objc_msgSend_length(v8, v65, v66, v67) > 0x1B018)
  {
    FigDebugAssert3();
    uint64_t v84 = 4294954516;
    id v14 = v55;
    float32x4_t v17 = v86;
    goto LABEL_27;
  }
  id v68 = v8;
  v72 = (const void *)objc_msgSend_bytes(v68, v69, v70, v71);
  size_t v76 = objc_msgSend_length(v68, v73, v74, v75);
  memcpy(a3, v72, v76);
  unint64_t v77 = sub_262FBABDC(a3);
  unint64_t v78 = sub_262FBAC44(a3);
  long long v24 = v27;
  if (v77 != 8 || v78 != 6)
  {
    FigDebugAssert3();
    uint64_t v84 = 0;
    id v14 = v55;
LABEL_30:
    float32x4_t v17 = v86;
    goto LABEL_22;
  }
  id v14 = v55;
  if (sub_262FBAE0C(a3))
  {
    FigDebugAssert3();
    uint64_t v84 = 0;
    goto LABEL_30;
  }
  float v79 = (float)(*a2 / a2[9]) / a2[10];
  a3[55566] = v79;
  uint64_t v80 = (unsigned __int16)*v41;
  float32x4_t v17 = v86;
  if (*v41)
  {
    v81 = (_WORD *)a3 + 110617;
    LOWORD(v79) = v41[v80];
    HIWORD(v82) = 18303;
    float v83 = (float)LODWORD(v79) / 65535.0;
    do
    {
      LOWORD(v82) = *v81;
      float v82 = (float)LODWORD(v82) / v83;
      *v81++ = (int)v82;
      --v80;
    }
    while (v80);
  }
  uint64_t v84 = 0;
LABEL_22:

  return v84;
}

void sub_262F95E40(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend_GPUEndTime(v2, v3, v4, v5);
  objc_msgSend_GPUStartTime(v2, v6, v7, v8);

  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
  }
}

void sub_262F95EE0(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

void sub_262F964E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_262F972C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_262F97C9C(uint64_t result, int a2, int *a3, uint64_t a4, unint64_t a5, unint64_t *a6, float a7, float a8, float a9, float a10, float a11, double a12)
{
  uint64_t v12 = result + 40 * a2;
  LOWORD(a12) = *(_WORD *)(v12 + 34);
  unsigned int v13 = (unsigned __int16)(int)(round((double)*(unint64_t *)&a12 / 90.0) * 90.0) % 0x168u;
  switch(v13)
  {
    case 0x10Eu:
      a7 = (float)(1.0 - a7) - a9;
      float v14 = a8;
      goto LABEL_6;
    case 0xB4u:
      float v14 = (float)(1.0 - a7) - a9;
      a7 = (float)(1.0 - a8) - a10;
      break;
    case 0x5Au:
      float v14 = (float)(1.0 - a8) - a10;
LABEL_6:
      float v15 = a10;
      goto LABEL_10;
    default:
      float v14 = a7;
      a7 = a8;
      break;
  }
  float v15 = a9;
  a9 = a10;
LABEL_10:
  double v16 = v14;
  double v17 = *(double *)(v12 + 16);
  double v18 = *(double *)(v12 + 24);
  v19.f64[0] = *(double *)v12 + v16 * v17;
  v20.f64[0] = v17 * v15;
  v19.f64[1] = *(double *)(v12 + 8) + a7 * v18;
  v20.f64[1] = v18 * a9;
  *(float32x4_t *)(a4 + 16 * *a3 + 16) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v19), v20);
  uint64_t v21 = *a3;
  *(float *)(a4 + 4 * v21 + 336) = a11;
  unint64_t v22 = vcvtps_u32_f32(vmuls_lane_f32((float)a5, vcvt_f32_f64(v20), 1));
  unint64_t v23 = v22 >> (v22 > 0xC8) >> (v22 >> (v22 > 0xC8) > 0xC8);
  if (v23 >= 0xC9) {
    return FigDebugAssert3();
  }
  if (*a6 > v23) {
    unint64_t v23 = *a6;
  }
  *a6 = v23;
  *a3 = v21 + 1;
  return result;
}

void sub_262F97E90(void *a1, float32x2_t *a2)
{
  id v3 = a1;
  uint64_t v6 = (uint64_t *)MEMORY[0x263F2F2E0];
  id v222 = v3;
  if (!v3)
  {
    BOOL v13 = 0;
    LOBYTE(v14) = 0;
    __asm { FMOV            V0.2S, #1.0 }
    float32x2_t v208 = _D0;
    __int32 v214 = 0;
    float v20 = 1.0;
    int v219 = 4096;
    int v221 = 256;
    float v215 = 1.0;
    int v21 = 2139095040;
    float v22 = 0.0;
    float v212 = 0.0;
    float v213 = 0.02;
    float v23 = 0.0;
    int v217 = 4096;
    int v218 = 256;
    int v216 = 4096;
    int v24 = 4096;
    int v25 = 4096;
    int v26 = 4096;
    __int32 v211 = 0;
    float v209 = 1.0;
    float v210 = 1.0;
    __int32 v27 = 0;
    float v28 = 1.0;
    __int32 v29 = 0;
    int v220 = 256;
    objc_msgSend_objectForKeyedSubscript_(0, v4, *MEMORY[0x263F2F2E0], v5);
    goto LABEL_81;
  }
  uint64_t v7 = objc_msgSend_objectForKeyedSubscript_(v3, v4, *MEMORY[0x263F2F468], v5);
  id v11 = v7;
  if (v7) {
    objc_msgSend_floatValue(v7, v8, v9, v10);
  }
  else {
    *(float *)&int v12 = 0.02;
  }
  float v213 = *(float *)&v12;
  uint64_t v30 = objc_msgSend_objectForKeyedSubscript_(v222, v8, *MEMORY[0x263F2F2C0], v10);

  if (v30) {
    int v220 = objc_msgSend_intValue(v30, v31, v32, v33);
  }
  else {
    int v220 = 256;
  }
  uint64_t v34 = objc_msgSend_objectForKeyedSubscript_(v222, v31, *MEMORY[0x263F2F700], v33);

  if (v34) {
    int v221 = objc_msgSend_intValue(v34, v35, v36, v37);
  }
  else {
    int v221 = 256;
  }
  float v38 = objc_msgSend_objectForKeyedSubscript_(v222, v35, *MEMORY[0x263F2F6E8], v37);

  if (v38) {
    int v218 = objc_msgSend_intValue(v38, v39, v40, v41);
  }
  else {
    int v218 = 256;
  }
  id v42 = objc_msgSend_objectForKeyedSubscript_(v222, v39, *MEMORY[0x263F2F300], v41);

  if (v42) {
    int v219 = objc_msgSend_intValue(v42, v43, v44, v45);
  }
  else {
    int v219 = 4096;
  }
  unsigned int v46 = objc_msgSend_objectForKeyedSubscript_(v222, v43, *MEMORY[0x263F2F308], v45);

  if (v46) {
    int v217 = objc_msgSend_intValue(v46, v47, v48, v49);
  }
  else {
    int v217 = 4096;
  }
  size_t v50 = objc_msgSend_objectForKeyedSubscript_(v222, v47, *MEMORY[0x263F2F2C8], v49);

  if (v50) {
    int v216 = objc_msgSend_intValue(v50, v51, v52, v53);
  }
  else {
    int v216 = 4096;
  }
  uint64_t v54 = *v6;
  id v55 = objc_msgSend_objectForKeyedSubscript_(v222, v51, *v6, v53);

  if (v55) {
    int v25 = objc_msgSend_intValue(v55, v56, v57, v58);
  }
  else {
    int v25 = 4096;
  }
  uint64_t v59 = objc_msgSend_objectForKeyedSubscript_(v222, v56, *MEMORY[0x263F2F2D8], v58);

  if (v59) {
    int v24 = objc_msgSend_intValue(v59, v60, v61, v62);
  }
  else {
    int v24 = 4096;
  }
  uint64_t v63 = objc_msgSend_objectForKeyedSubscript_(v222, v60, *MEMORY[0x263F2F2D0], v62);

  if (v63) {
    int v26 = objc_msgSend_intValue(v63, v64, v65, v66);
  }
  else {
    int v26 = 4096;
  }
  uint64_t v67 = objc_msgSend_objectForKeyedSubscript_(v222, v64, *MEMORY[0x263F2F6F8], v66);

  if (v67) {
    int v71 = objc_msgSend_intValue(v67, v68, v69, v70);
  }
  else {
    int v71 = 256;
  }
  v72 = objc_msgSend_objectForKeyedSubscript_(v222, v68, *MEMORY[0x263F2F4F8], v70);

  if (v72) {
    int v76 = objc_msgSend_intValue(v72, v73, v74, v75);
  }
  else {
    int v76 = 4096;
  }
  unint64_t v77 = objc_msgSend_objectForKeyedSubscript_(v222, v73, *MEMORY[0x263F2F378], v75);

  if (v77) {
    float v81 = (float)(unint64_t)objc_msgSend_unsignedLongLongValue(v77, v78, v79, v80);
  }
  else {
    float v81 = 1.0;
  }
  float v215 = v81;
  float v82 = objc_msgSend_objectForKeyedSubscript_(v222, v78, *MEMORY[0x263F2F460], v80);

  float v22 = 0.0;
  __int32 v86 = 0;
  if (v82) {
    objc_msgSend_floatValue(v82, v83, v84, v85, 0.0);
  }
  __int32 v214 = v86;
  v87 = objc_msgSend_objectForKeyedSubscript_(v222, v83, *MEMORY[0x263F2F608], v85);

  if (v87)
  {
    objc_msgSend_floatValue(v87, v88, v89, v90);
    float v22 = v91 * 0.000015259;
  }
  v92 = objc_msgSend_objectForKeyedSubscript_(v222, v88, *MEMORY[0x263F2F610], v90);

  float v23 = 0.0;
  float v96 = 0.0;
  if (v92)
  {
    objc_msgSend_floatValue(v92, v93, v94, v95, 0.0);
    float v96 = v97 * 0.000015259;
  }
  float v212 = v96;
  v98 = objc_msgSend_objectForKeyedSubscript_(v222, v93, *MEMORY[0x263F2F408], v95);

  if (v98)
  {
    objc_msgSend_floatValue(v98, v99, v100, v101);
    float v23 = v102 * 0.000015259;
  }
  v103 = objc_msgSend_objectForKeyedSubscript_(v222, v99, *MEMORY[0x263F2F648], v101);

  if (v103) {
    objc_msgSend_floatValue(v103, v104, v105, v106);
  }
  else {
    __int32 v107 = 0;
  }
  __int32 v211 = v107;
  v108 = objc_msgSend_objectForKeyedSubscript_(v222, v104, *MEMORY[0x263F2F538], v106);

  float v28 = 1.0;
  LODWORD(v112) = 1.0;
  if (v108) {
    objc_msgSend_floatValue(v108, v109, v110, v111, v112);
  }
  float v210 = *(float *)&v112;
  v113 = objc_msgSend_objectForKeyedSubscript_(v222, v109, *MEMORY[0x263F2F2B8], v111);

  if (v113)
  {
    objc_msgSend_floatValue(v113, v114, v115, v116);
    float v28 = v117;
  }
  v118 = objc_msgSend_objectForKeyedSubscript_(v222, v114, *MEMORY[0x263F2F2A8], v116);

  float v20 = 1.0;
  LODWORD(v122) = 1.0;
  if (v118) {
    objc_msgSend_floatValue(v118, v119, v120, v121, v122);
  }
  float v209 = *(float *)&v122;
  v123 = objc_msgSend_objectForKeyedSubscript_(v222, v119, *MEMORY[0x263F2F6F0], v121);

  if (v123)
  {
    objc_msgSend_floatValue(v123, v124, v125, v126);
    float v20 = v127;
  }
  v128 = objc_msgSend_objectForKeyedSubscript_(v222, v124, *MEMORY[0x263F2F5A8], v126);

  if (v128)
  {
    objc_msgSend_floatValue(v128, v129, v130, v131);
    int v21 = v132;
  }
  else
  {
    int v21 = 2139095040;
  }
  v133 = objc_msgSend_objectForKeyedSubscript_(v222, v129, *MEMORY[0x263F2F1E0], v131);

  if (v133) {
    BOOL v13 = objc_msgSend_intValue(v133, v134, v135, v136) == 1;
  }
  else {
    BOOL v13 = 0;
  }
  v137 = objc_msgSend_objectForKeyedSubscript_(v222, v134, *MEMORY[0x263F2F558], v136);

  if (v137)
  {
    objc_msgSend_floatValue(v137, v138, v139, v140);
    __int32 v29 = v141;
  }
  else
  {
    __int32 v29 = 0;
  }

  uint64_t v142 = *MEMORY[0x263F2F748];
  v145 = objc_msgSend_objectForKeyedSubscript_(v222, v143, *MEMORY[0x263F2F748], v144);

  if (v145)
  {
    objc_msgSend_objectForKeyedSubscript_(v222, v146, v142, v147);
  }
  else
  {
    float v14 = objc_msgSend_objectForKeyedSubscript_(v222, v146, @"HREnabled", v147);

    if (!v14) {
      goto LABEL_77;
    }
    objc_msgSend_objectForKeyedSubscript_(v222, v148, @"HREnabled", v149);
  v150 = };
  v152 = v150;
  if (v150)
  {
    LOBYTE(v14) = objc_msgSend_BOOLValue(v150, v148, v151, v149);
  }
  else
  {
    LOBYTE(v14) = 0;
  }
LABEL_77:
  v153 = objc_msgSend_objectForKeyedSubscript_(v222, v148, *MEMORY[0x263F2F3D8], v149);
  v157 = v153;
  if (v153)
  {
    objc_msgSend_floatValue(v153, v154, v155, v156);
    __int32 v27 = v158;
  }
  else
  {
    __int32 v27 = 0;
  }

  float32x2_t v208 = vmul_f32(vcvt_f32_s32((int32x2_t)__PAIR64__(v76, v71)), (float32x2_t)0x398000003B800000);
  objc_msgSend_objectForKeyedSubscript_(v222, v159, v54, v160);
LABEL_81:

  v163 = objc_msgSend_objectForKeyedSubscript_(v222, v161, *MEMORY[0x263F2F498], v162);
  v167 = v163;
  if (v163)
  {
    __int32 v168 = v29;
    float v169 = v23;
    float v170 = v22;
    objc_msgSend_floatValue(v163, v164, v165, v166);
    __int32 v174 = v173;
  }
  else
  {
    v175 = objc_msgSend_objectForKeyedSubscript_(v222, v164, @"ExperimentalMetadata", v166);
    v178 = objc_msgSend_objectForKeyedSubscript_(v175, v176, @"SRL", v177);
    v181 = objc_msgSend_objectForKeyedSubscript_(v178, v179, @"faceExpRatio", v180);

    __int32 v168 = v29;
    float v169 = v23;
    float v170 = v22;
    if (v181)
    {
      v182 = objc_msgSend_objectForKeyedSubscript_(v222, v171, @"ExperimentalMetadata", v172);
      v185 = objc_msgSend_objectForKeyedSubscript_(v182, v183, @"SRL", v184);
      v188 = objc_msgSend_objectForKeyedSubscript_(v185, v186, @"faceExpRatio", v187);

      objc_msgSend_floatValue(v188, v189, v190, v191);
      __int32 v174 = v192;
    }
    else
    {
      __int32 v174 = 0;
    }
  }
  float v193 = (float)v220 * 0.0039062;
  float v194 = (float)v218 / (float)(v20 * 256.0);
  float v195 = v194 * (float)((float)((float)v221 * 0.0039062) * v193);
  float v196 = 0.066667;
  if (v213 <= 0.066667) {
    float v196 = v213;
  }
  a2[12].i32[1] = v174;
  a2->f32[0] = v195;
  a2->f32[1] = (float)v217 / (float)v219;
  a2[1].f32[0] = (float)v216 / (float)v219;
  a2[1].f32[1] = (float)v25 / (float)v24;
  a2[2].f32[0] = (float)v26 / (float)v24;
  a2[2].f32[1] = v193;
  a2[3].f32[0] = v194;
  a2[4].f32[1] = v195 / v194;
  a2[5] = v208;
  a2[6].f32[0] = v213;
  a2[6].f32[1] = v215;
  a2[7].i32[0] = v21;
  a2[7].i32[1] = v214;
  a2[8].f32[0] = v170;
  a2[8].f32[1] = v212;
  a2[9].f32[0] = v169;
  a2[9].i32[1] = v211;
  a2[10].f32[0] = v210;
  a2[10].i8[4] = v13;
  float32_t v197 = (float)(v28 * (float)(v213 * v195)) / (float)(v209 * v196);
  v198 = objc_msgSend_objectForKeyedSubscript_(v222, v171, *MEMORY[0x263F2F2B0], v172);
  a2[10].i8[5] = objc_msgSend_BOOLValue(v198, v199, v200, v201);

  v204 = objc_msgSend_objectForKeyedSubscript_(v222, v202, *MEMORY[0x263F2F528], v203);
  a2[11].i8[4] = objc_msgSend_BOOLValue(v204, v205, v206, v207);

  a2[12].f32[0] = v197;
  a2[11].i32[0] = v168;
  a2[10].i8[6] = (char)v14;
  a2[13].i32[0] = v27;
}

uint64_t sub_262F98868(uint64_t a1, double *a2, unint64_t a3, unint64_t a4)
{
  *(_OWORD *)a2 = 0u;
  *((_OWORD *)a2 + 1) = 0u;
  if (!FigCFDictionaryGetCGRectIfPresent()
    || (double v7 = *a2, *a2 == 0.0) && a2[1] == 0.0 && a2[2] == 0.0 && a2[3] == 0.0)
  {
    *a2 = 0.0;
    a2[1] = 0.0;
    a2[2] = (double)a3;
    a2[3] = (double)a4;
    double v7 = 0.0;
  }
  double v8 = (double)a3;
  if (v7 < 0.0 || v7 > v8) {
    return 4294954516;
  }
  double v10 = a2[1];
  double v11 = (double)a4;
  if (v10 < 0.0 || v10 > v11) {
    return 4294954516;
  }
  double v13 = a2[2];
  if (v13 < 0.0 || v13 > v8) {
    return 4294954516;
  }
  double v16 = a2[3];
  uint64_t result = 4294954516;
  if (v16 >= 0.0)
  {
    if (v16 > v11) {
      return 4294954516;
    }
    else {
      return 0;
    }
  }
  return result;
}

float sub_262F98950(uint64_t a1, uint64_t a2, int a3)
{
  if ((a3 - 1) >= 2)
  {
    float result = 1.0;
    if (!a3) {
      return (float)(*(float *)a1 * *(float *)(a1 + 48)) / (float)(*(float *)a2 * *(float *)(a2 + 48));
    }
  }
  else
  {
    float v3 = 1.0;
    float v4 = 1.0;
    if (*(unsigned char *)(a1 + 86)) {
      float v4 = *(float *)(a1 + 44);
    }
    if (*(unsigned char *)(a2 + 86)) {
      float v3 = *(float *)(a2 + 44);
    }
    float result = (float)((float)(*(float *)(a1 + 36) * *(float *)(a1 + 48)) / v4)
           / (float)((float)(*(float *)(a2 + 36) * *(float *)(a2 + 48)) / v3);
    float v6 = sqrtf(result);
    if (a3 == 1) {
      return v6;
    }
  }
  return result;
}

float sub_262F989D8(uint64_t a1, uint64_t a2)
{
  float result = 1.0;
  if (a1 && a2)
  {
    float v3 = *(float *)(a2 + 48);
    if (v3 != 0.0) {
      return *(float *)(a1 + 48) / v3;
    }
  }
  return result;
}

float sub_262F98A00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(a3 + 223936);
  if (v3 == 2)
  {
    if (*(unsigned char *)(a3 + 224144)) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }
  else
  {
    int v4 = v3 == 1;
  }
  return sub_262F98950(a1, a2, v4);
}

uint64_t sub_262F98A38(void *a1, uint64_t a2, unint64_t a3, unint64_t a4, int a5)
{
  uint64_t v8 = a2;
  uint64_t v9 = a2 + 223008;
  id v10 = a1;
  long long v11 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
  long long v169 = *MEMORY[0x263EF89A0];
  long long v170 = v11;
  long long v171 = *(_OWORD *)(MEMORY[0x263EF89A0] + 32);
  float v14 = objc_msgSend_objectForKeyedSubscript_(v10, v12, *MEMORY[0x263F2F3F0], v13);
  double v17 = objc_msgSend_objectForKeyedSubscript_(v10, v15, @"SensorID", v16);
  *(_DWORD *)uint64_t v8 = objc_msgSend_intValue(v17, v18, v19, v20);

  float v23 = objc_msgSend_objectForKeyedSubscript_(v10, v21, *MEMORY[0x263F2F1D0], v22);
  *(unsigned char *)uint64_t v9 = objc_msgSend_BOOLValue(v23, v24, v25, v26);

  sub_262F97E90(v10, (float32x2_t *)(v8 + 16));
  uint64_t v27 = sub_262F98868((uint64_t)v10, (double *)(v8 + 128), a3, a4);
  if (v27)
  {
    FigDebugAssert3();
    goto LABEL_47;
  }
  *(unsigned char *)(v8 + 164) = sub_262F945AC(v10, (float *)(v8 + 16), (float *)(v8 + 168)) == 0;
  uint64_t v30 = objc_msgSend_objectForKeyedSubscript_(v10, v28, *MEMORY[0x263F2EFA8], v29);
  *(_DWORD *)(v8 + 160) = objc_msgSend_intValue(v30, v31, v32, v33);

  if (a5)
  {
    uint64_t v36 = objc_msgSend_objectForKeyedSubscript_(v10, v34, *MEMORY[0x263F2F5D8], v35);
    *(unsigned char *)(v8 + 4) = objc_msgSend_BOOLValue(v36, v37, v38, v39);

    id v42 = objc_msgSend_objectForKeyedSubscript_(v10, v40, *MEMORY[0x263F2F378], v41);
    *(void *)(v8 + 8) = objc_msgSend_longLongValue(v42, v43, v44, v45);

    uint64_t v48 = objc_msgSend_objectForKeyedSubscript_(v10, v46, *MEMORY[0x263F2F638], v47);
    if (objc_msgSend_BOOLValue(v48, v49, v50, v51))
    {
      *(unsigned char *)(v8 + 5) = 1;
    }
    else
    {
      uint64_t v54 = objc_msgSend_objectForKeyedSubscript_(v10, v52, *MEMORY[0x263F2F170], v53);
      objc_msgSend_floatValue(v54, v55, v56, v57);
      *(unsigned char *)(v8 + 5) = v58 < 0.0;
    }
    *(unsigned char *)(v8 + 6) = *(unsigned char *)(v8 + 100);
  }
  if (v14)
  {
    id v59 = v14;
    uint64_t v63 = (int *)objc_msgSend_bytes(v59, v60, v61, v62);
    uint64_t v67 = objc_msgSend_length(v59, v64, v65, v66);
    if (v63)
    {
      if (v67 == 36)
      {
        for (uint64_t i = 0; i != 3; ++i)
        {
          uint64_t v69 = 0;
          uint64_t v70 = &v169 + i;
          long long v71 = *v70;
          do
          {
            int v72 = *v63++;
            long long v168 = v71;
            *(_DWORD *)((unint64_t)&v168 & 0xFFFFFFFFFFFFFFF3 | (4 * (v69 & 3))) = v72;
            long long v71 = v168;
            *((_DWORD *)v70 + 2) = DWORD2(v168);
            *(void *)uint64_t v70 = v71;
            ++v69;
          }
          while (v69 != 3);
        }
      }
    }
  }
  long long v73 = v170;
  *(_OWORD *)(v8 + 222960) = v169;
  *(_OWORD *)(v8 + 222976) = v73;
  *(_OWORD *)(v8 + 222992) = v171;
  *(unsigned char *)(v9 + 1) = v14 != 0;
  uint64_t v74 = objc_msgSend_objectForKeyedSubscript_(v10, v34, @"DetectedObjectsInfo", v35);
  unint64_t v77 = v74;
  if (v74)
  {
    uint64_t v167 = v9;
    unint64_t v78 = objc_msgSend_objectForKeyedSubscript_(v74, v75, @"HumanFaces", v76);
    float v81 = v78;
    v163 = v14;
    uint64_t v166 = v8;
    unsigned int v162 = v27;
    uint64_t v160 = v78;
    v161 = v77;
    if (!v78) {
      goto LABEL_32;
    }
    id v159 = v10;
    float v82 = objc_msgSend_objectForKeyedSubscript_(v78, v79, @"ObjectsArray", v80);
    __int32 v86 = v82;
    if (!v82)
    {
LABEL_31:

      id v10 = v159;
      float v81 = v160;
      float v14 = v163;
      uint64_t v8 = v166;
      uint64_t v27 = v162;
      unint64_t v77 = v161;
LABEL_32:
      int v132 = objc_msgSend_objectForKeyedSubscript_(v77, v79, @"HumanBodies", v80);
      if (!v132)
      {
LABEL_45:

        uint64_t v9 = v167;
        goto LABEL_46;
      }
      uint64_t v165 = v132;
      uint64_t v135 = objc_msgSend_objectForKeyedSubscript_(v132, v133, @"ObjectsArray", v134);
      uint64_t v139 = v135;
      if (v135)
      {
        if ((unint64_t)objc_msgSend_count(v135, v136, v137, v138) >= 0xA)
        {
          uint64_t v144 = (int *)(v167 + 408);
          *(_DWORD *)(v167 + 408) = 10;
LABEL_38:
          uint64_t v145 = 0;
          uint64_t v146 = v166 + 223424;
          do
          {
            uint64_t v147 = objc_msgSend_objectAtIndexedSubscript_(v139, v140, v145, v142);
            objc_msgSend_objectForKeyedSubscript_(v147, v148, @"Rect", v149);
            CFDictionaryRef v150 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
            uint64_t v153 = objc_msgSend_objectForKeyedSubscript_(v147, v151, @"ConfidenceLevel", v152);
            v154 = (void *)v153;
            if (v150 && v153 && CGRectMakeWithDictionaryRepresentation(v150, (CGRect *)v146)) {
              *(_WORD *)(v146 + 32) = objc_msgSend_shortValue(v154, v155, v156, v157);
            }

            ++v145;
            v146 += 40;
          }
          while (v145 < *v144);
          goto LABEL_44;
        }
        int v143 = objc_msgSend_count(v139, v140, v141, v142);
        *(_DWORD *)(v167 + 408) = v143;
        if (v143 >= 1)
        {
          uint64_t v144 = (int *)(v167 + 408);
          goto LABEL_38;
        }
      }
LABEL_44:

      float v14 = v163;
      int v132 = v165;
      uint64_t v8 = v166;
      uint64_t v27 = v162;
      float v81 = v160;
      unint64_t v77 = v161;
      goto LABEL_45;
    }
    if ((unint64_t)objc_msgSend_count(v82, v83, v84, v85) >= 0xA)
    {
      *(_DWORD *)(v9 + 4) = 10;
      float v91 = (int *)(v9 + 4);
    }
    else
    {
      int v90 = objc_msgSend_count(v86, v87, v88, v89);
      *(_DWORD *)(v9 + 4) = v90;
      float v91 = (int *)(v9 + 4);
      if (v90 < 1) {
        goto LABEL_31;
      }
    }
    uint64_t v92 = 0;
    uint64_t v93 = v8 + 223016;
    uint64_t v94 = @"Rect";
    uint64_t v95 = @"ConfidenceLevel";
    v164 = v91;
    while (1)
    {
      float v96 = objc_msgSend_objectAtIndexedSubscript_(v86, v87, v92, v89);
      objc_msgSend_objectForKeyedSubscript_(v96, v97, (uint64_t)v94, v98);
      CFDictionaryRef v99 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CFDictionaryRef v100 = v99;
      if (!v99) {
        goto LABEL_30;
      }
      if (!CGRectMakeWithDictionaryRepresentation(v99, (CGRect *)v93)) {
        goto LABEL_30;
      }
      uint64_t v103 = objc_msgSend_objectForKeyedSubscript_(v96, v101, (uint64_t)v95, v102);
      if (!v103) {
        goto LABEL_30;
      }
      uint64_t v106 = (void *)v103;
      __int32 v107 = v86;
      v108 = v94;
      v109 = v95;
      uint64_t v110 = objc_msgSend_objectForKeyedSubscript_(v96, v104, @"AngleInfoRoll", v105);
      if (!v110) {
        break;
      }
      v113 = (void *)v110;
      v114 = objc_msgSend_objectForKeyedSubscript_(v96, v111, @"AngleInfoYaw", v112);

      uint64_t v95 = v109;
      uint64_t v94 = v108;
      __int32 v86 = v107;
      float v91 = v164;
      if (v114)
      {
        float v117 = objc_msgSend_objectForKeyedSubscript_(v96, v115, (uint64_t)v95, v116);
        *(_WORD *)(v93 + 32) = objc_msgSend_shortValue(v117, v118, v119, v120);

        v123 = objc_msgSend_objectForKeyedSubscript_(v96, v121, @"AngleInfoRoll", v122);
        *(_WORD *)(v93 + 34) = objc_msgSend_shortValue(v123, v124, v125, v126);

        uint64_t v106 = objc_msgSend_objectForKeyedSubscript_(v96, v127, @"AngleInfoYaw", v128);
        *(_WORD *)(v93 + 36) = objc_msgSend_shortValue(v106, v129, v130, v131);
LABEL_29:
      }
LABEL_30:

      ++v92;
      v93 += 40;
      if (v92 >= *v91) {
        goto LABEL_31;
      }
    }
    uint64_t v94 = v108;
    __int32 v86 = v107;
    float v91 = v164;
    goto LABEL_29;
  }
LABEL_46:

  *(unsigned char *)(v9 + 816) = sub_262F9C304(v10, v8 + 223832) == 0;
LABEL_47:

  return v27;
}

void sub_262F99898(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_262F9C11C(int a1, int *a2, void *a3)
{
  id v5 = a3;
  if (a1 == 1)
  {
    uint64_t v8 = @"GreenGhostBrightLight";
  }
  else
  {
    if (a1 != 2) {
      goto LABEL_31;
    }
    uint64_t v8 = @"GreenGhostLowLight";
  }
  id v62 = v5;
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)v8, v7);
  int v12 = v9;
  if (v9)
  {
    uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v9, v10, @"isEnabled", v11);
    int v17 = objc_msgSend_BOOLValue(v13, v14, v15, v16);

    uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v12, v18, @"isRunning", v19);
    int v24 = objc_msgSend_BOOLValue(v20, v21, v22, v23);

    if (v24) {
      int v27 = v17 | 2;
    }
    else {
      int v27 = v17;
    }
    float v28 = objc_msgSend_objectForKeyedSubscript_(v12, v25, @"foundFacesOrBodies", v26);
    int v32 = objc_msgSend_BOOLValue(v28, v29, v30, v31);

    if (v32) {
      int v35 = v27 | 4;
    }
    else {
      int v35 = v27;
    }
    BOOL v36 = a1 == 1;
    if (a1 == 1) {
      uint64_t v37 = @"isBrightScene";
    }
    else {
      uint64_t v37 = @"exceedsMaxMaskAverage";
    }
    if (a1 == 1) {
      uint64_t v38 = @"roiIsComputed";
    }
    else {
      uint64_t v38 = @"skipRepair";
    }
    if (v36) {
      uint64_t v39 = @"hasValidClippingData";
    }
    else {
      uint64_t v39 = @"tripodMode";
    }
    uint64_t v40 = objc_msgSend_objectForKeyedSubscript_(v12, v33, (uint64_t)v37, v34);
    int v44 = objc_msgSend_BOOLValue(v40, v41, v42, v43);

    if (v44) {
      int v47 = v35 | 8;
    }
    else {
      int v47 = v35;
    }
    uint64_t v48 = objc_msgSend_objectForKeyedSubscript_(v12, v45, (uint64_t)v38, v46);
    int v52 = objc_msgSend_BOOLValue(v48, v49, v50, v51);

    if (v52) {
      int v55 = v47 | 0x10;
    }
    else {
      int v55 = v47;
    }
    uint64_t v56 = objc_msgSend_objectForKeyedSubscript_(v12, v53, (uint64_t)v39, v54);
    int v60 = objc_msgSend_BOOLValue(v56, v57, v58, v59);

    int v61 = v55 | 0x20;
    if (!v60) {
      int v61 = v55;
    }
  }
  else
  {
    int v61 = 0;
  }
  *a2 = v61;

  id v5 = v62;
LABEL_31:
}

uint64_t sub_262F9C304(void *a1, uint64_t a2)
{
  id v3 = a1;
  long long v27 = *MEMORY[0x263F001A8];
  if (!FigCFDictionaryGetCGRectIfPresent())
  {
    FigDebugAssert3();
    id v10 = 0;
    goto LABEL_24;
  }
  float v6 = objc_msgSend_objectForKeyedSubscript_(v3, v4, *MEMORY[0x263F2F548], v5);
  id v10 = v6;
  if (!v6)
  {
LABEL_24:
    uint64_t v25 = 0xFFFFFFFFLL;
    goto LABEL_25;
  }
  if ((unint64_t)objc_msgSend_length(v6, v7, v8, v9) <= 7) {
    goto LABEL_23;
  }
  id v10 = v10;
  float v14 = (_DWORD *)objc_msgSend_bytes(v10, v11, v12, v13);
  unint64_t v18 = objc_msgSend_length(v10, v15, v16, v17);
  unint64_t v19 = v14[1];
  if (v18 < v19) {
    goto LABEL_23;
  }
  if (*v14 != 1)
  {
    uint64_t v25 = 0;
    goto LABEL_25;
  }
  if (v19 <= 0x2B) {
    goto LABEL_23;
  }
  id v10 = v10;
  uint64_t v23 = (_WORD *)objc_msgSend_bytes(v10, v20, v21, v22);
  if ((__int16)v23[19] == -1)
  {
    FigDebugAssert3();
    uint64_t v25 = FigSignalErrorAt();
    goto LABEL_25;
  }
  if ((__int16)v23[17] == -1) {
    int v24 = 1;
  }
  else {
    int v24 = 2;
  }
  if ((__int16)v23[20] != -1) {
    ++v24;
  }
  if ((__int16)v23[21] != -1) {
    ++v24;
  }
  if (2 * (unsigned __int16)v23[11] * (unsigned __int16)v23[10] * v24 + 44 != v14[1])
  {
LABEL_23:
    FigDebugAssert3();
    goto LABEL_24;
  }
  uint64_t v25 = 0;
  v23[4] = (int)((double)(__int16)v23[4] - *(double *)&v27);
  v23[5] = (int)((double)(__int16)v23[5] - *((double *)&v27 + 1));
  *(_WORD *)a2 = 1;
  *(_DWORD *)(a2 + 4) = v24;
  *(void *)(a2 + 8) = v23;
LABEL_25:

  return v25;
}

uint64_t sub_262F9C69C(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*(_WORD *)a1 != 1) {
    return 0;
  }
  uint64_t v5 = a5;
  uint64_t v6 = a1;
  v53.i64[0] = a3;
  v53.i64[1] = a4;
  uint64_t v7 = *(void *)(a1 + 8);
  int v51 = *(__int16 *)(v7 + 8);
  int v52 = *(__int16 *)(v7 + 10);
  v48.i32[0] = *(unsigned __int16 *)(v7 + 12);
  v48.i32[1] = *(unsigned __int16 *)(v7 + 14);
  int v49 = *(unsigned __int16 *)(v7 + 16);
  int v50 = *(unsigned __int16 *)(v7 + 18);
  unsigned int v8 = *(_DWORD *)(v7 + 28);
  int v55 = *(unsigned __int16 *)(v7 + 22);
  if (*(_WORD *)(v7 + 22))
  {
    int v9 = 0;
    int v10 = 0;
    unsigned int v11 = 0;
    unsigned int v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = *(unsigned __int16 *)(v7 + 20);
    unsigned int v15 = *(unsigned __int16 *)(v7 + 38);
    float v16 = (float)v8;
    do
    {
      uint64_t v17 = objc_msgSend_string(MEMORY[0x263F089D8], a2, a3, a4);
      if (v14)
      {
        int v20 = 0;
        do
        {
          int v57 = v10;
          int v58 = v9;
          int v21 = *(unsigned __int16 *)(v7 + 2 * v15 + 44);
          __int16 v22 = *(_WORD *)(v7 + 24);
          uint64_t v23 = v14;
          uint64_t v24 = v7;
          uint64_t v25 = v13;
          uint64_t v26 = v6;
          unsigned int v27 = v21 << v22;
          float v28 = v17;
          objc_msgSend_appendFormat_(v17, v18, @"[ %5u ] ", v19, (v21 << v22));
          uint64_t v17 = v28;
          if ((float)((float)v27 / v16) > *(float *)(a5 + 8)) {
            ++v12;
          }
          BOOL v29 = v27 > v11;
          if (v27 > v11) {
            unsigned int v11 = v27;
          }
          uint64_t v6 = v26;
          uint64_t v13 = v25;
          uint64_t v7 = v24;
          uint64_t v14 = v23;
          int v10 = v57;
          int v9 = v58;
          if (v29)
          {
            int v10 = v13;
            int v9 = v20;
          }
          v15 += *(_DWORD *)(v6 + 4);
          ++v20;
        }
        while (v14 != v20);
      }

      uint64_t v13 = (v13 + 1);
    }
    while (v13 != v55);
    uint64_t v5 = a5;
  }
  else
  {
    unsigned int v12 = 0;
    unsigned int v11 = 0;
    int v10 = 0;
    int v9 = 0;
    float v16 = (float)v8;
  }
  if ((float)((float)v11 / v16) < *(float *)(v5 + 4))
  {
    if (!dword_26B429788) {
      return 0;
    }
LABEL_18:
    uint64_t v30 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    return 0;
  }
  if (v12 > *(_DWORD *)(v5 + 12))
  {
    if (!dword_26B429788) {
      return 0;
    }
    goto LABEL_18;
  }
  float32x2_t v31 = vcvt_f32_u32(v48);
  if (dword_26B429788)
  {
    float32x2_t v59 = v31;
    int v32 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    float32x2_t v31 = v59;
  }
  v34.f32[0] = v31.f32[0] + (float)(v51 + v9 * v49);
  v34.f32[1] = v31.f32[1] + (float)(v52 + v10 * v50);
  __asm { FMOV            V1.2S, #-1.0 }
  float32x2_t v40 = vadd_f32(v34, _D1);
  __asm { FMOV            V1.2D, #-1.0 }
  _Q1 = vaddq_f64(vcvtq_f64_u64(v53), _Q1);
  float32x2_t v43 = vcvt_f32_f64(vsubq_f64(_Q1, vcvtq_f64_f32(v40)));
  float32x2_t v44 = vmul_n_f32(v31, *(float *)v5);
  *(float32x2_t *)v45.f32 = vmaxnm_f32(vsub_f32(v43, v44), 0);
  float32x2_t v46 = vadd_f32(vadd_f32(v31, v43), v44);
  float32x2_t v47 = vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vmovn_s64(vcgtq_f64(vcvtq_f64_f32(v46), _Q1)), (int8x8_t)vcvt_f32_f64(_Q1), (int8x8_t)v46), *(float32x2_t *)v45.f32);
  __asm { FMOV            V1.2S, #1.0 }
  *(float32x2_t *)&v45.u32[2] = vadd_f32(v47, *(float32x2_t *)&_Q1.f64[0]);
  *(uint32x4_t *)a2 = vcvtq_u32_f32(v45);
  return 1;
}

uint64_t sub_262F9E698(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  int v9 = objc_msgSend_device(v5, v6, v7, v8);
  unint64_t v12 = objc_msgSend_minimumLinearTextureAlignmentForPixelFormat_(v9, v10, a2, v11);

  uint64_t PixelSizeInBytes = objc_msgSend_getPixelSizeInBytes_(v5, v13, a2, v14);
  unint64_t v16 = PixelSizeInBytes * a1 % v12;
  if (v16) {
    return PixelSizeInBytes * a1 + v12 - v16;
  }
  else {
    return PixelSizeInBytes * a1;
  }
}

void sub_262FA00EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_262FA1AA4()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262FA1AD8(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

uint64_t sub_262FA1B8C()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262FA1BC0(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

void sub_262FA4160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

float32x2_t sub_262FA4178(double a1, double a2, double a3, double a4, double a5, double a6, float a7)
{
  float v7 = a1 + a3;
  float v8 = a1;
  float v9 = a3 * a7 * 0.5;
  *(float *)&a1 = v8 - v9;
  if (*(float *)&a1 < 0.0) {
    *(float *)&a1 = 0.0;
  }
  float v10 = v7 + v9;
  if (v10 > 1.0) {
    float v10 = 1.0;
  }
  float v11 = a5;
  *((float *)&a1 + 1) = v10;
  return vmul_n_f32(*(float32x2_t *)&a1, v11);
}

Class sub_262FA5CBC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v9[0] = 0;
  if (!qword_26B429630)
  {
    v9[1] = (void *)MEMORY[0x263EF8330];
    v9[2] = (void *)3221225472;
    v9[3] = sub_262FA5DE8;
    v9[4] = &unk_2655C3390;
    v9[5] = v9;
    long long v10 = xmmword_2655C3428;
    uint64_t v11 = 0;
    qword_26B429630 = _sl_dlopen();
  }
  if (!qword_26B429630) {
    sub_263011600(v9, a2, a3, a4);
  }
  if (v9[0]) {
    free(v9[0]);
  }
  Class result = objc_getClass("VNFaceObservation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_263011680((uint64_t)result, v6, v7, v8);
  }
  qword_26A99A528 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_262FA5DE8()
{
  uint64_t result = _sl_dlopen();
  qword_26B429630 = result;
  return result;
}

void sub_262FA620C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_262FA7338(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_262FA87A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_262FA9394(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend_GPUEndTime(v2, v3, v4, v5);
  objc_msgSend_GPUStartTime(v2, v6, v7, v8);

  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
  }
}

void sub_262FA9434(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

void sub_262FAA5D4(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend_GPUEndTime(v2, v3, v4, v5);
  objc_msgSend_GPUStartTime(v2, v6, v7, v8);

  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
  }
}

void sub_262FAA674(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

void sub_262FAAFB0(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend_GPUEndTime(v2, v3, v4, v5);
  objc_msgSend_GPUStartTime(v2, v6, v7, v8);

  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
  }
}

void sub_262FAB050(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

void sub_262FAB758(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend_GPUEndTime(v2, v3, v4, v5);
  objc_msgSend_GPUStartTime(v2, v6, v7, v8);

  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
  }
}

void sub_262FAB7F8(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

void sub_262FABFB0(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend_GPUEndTime(v2, v3, v4, v5);
  objc_msgSend_GPUStartTime(v2, v6, v7, v8);

  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
  }
}

void sub_262FAC050(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

uint64_t sub_262FB4EB4()
{
  qword_26B4296E0 = objc_alloc_init(SyntheticLongShared);

  return MEMORY[0x270F9A758]();
}

uint64_t sub_262FB57B4()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262FB57E8(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

void sub_262FB7B28(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend_GPUEndTime(v2, v3, v4, v5);
  objc_msgSend_GPUStartTime(v2, v6, v7, v8);

  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
  }
}

void sub_262FB7BC8(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

void sub_262FB97E8(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend_GPUEndTime(v2, v3, v4, v5);
  objc_msgSend_GPUStartTime(v2, v6, v7, v8);

  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
  }
}

void sub_262FB9888(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

unint64_t sub_262FBABDC(_WORD *a1)
{
  switch(*a1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
      return (unsigned __int16)a1[1] - ((unsigned __int16)a1[7] + (unint64_t)(unsigned __int16)a1[8]);
    default:
      if (*a1 == 1001) {
        return (unsigned __int16)a1[1] - ((unsigned __int16)a1[7] + (unint64_t)(unsigned __int16)a1[8]);
      }
      else {
        return 0;
      }
  }
}

unint64_t sub_262FBAC44(_WORD *a1)
{
  switch(*a1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
      return (unsigned __int16)a1[2] - ((unsigned __int16)a1[5] + (unint64_t)(unsigned __int16)a1[6]);
    default:
      if (*a1 == 1001) {
        return (unsigned __int16)a1[2] - ((unsigned __int16)a1[5] + (unint64_t)(unsigned __int16)a1[6]);
      }
      else {
        return 0;
      }
  }
}

uint64_t sub_262FBACAC(_WORD *a1)
{
  switch(*a1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
      return (unsigned __int16)a1[7];
    default:
      if (*a1 == 1001) {
        return (unsigned __int16)a1[7];
      }
      else {
        return 0;
      }
  }
}

uint64_t sub_262FBAD04(_WORD *a1)
{
  switch(*a1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
      return (unsigned __int16)a1[5];
    default:
      if (*a1 == 1001) {
        return (unsigned __int16)a1[5];
      }
      else {
        return 0;
      }
  }
}

uint64_t sub_262FBAD5C(_WORD *a1)
{
  switch(*a1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
      return (unsigned __int16)a1[9];
    default:
      if (*a1 == 1001) {
        return (unsigned __int16)a1[9];
      }
      else {
        return 0;
      }
  }
}

uint64_t sub_262FBADB4(_WORD *a1)
{
  switch(*a1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
      return (unsigned __int16)a1[10];
    default:
      if (*a1 == 1001) {
        return (unsigned __int16)a1[10];
      }
      else {
        return 0;
      }
  }
}

uint64_t sub_262FBAE0C(_WORD *a1)
{
  switch(*a1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
      return (unsigned __int16)a1[3];
    default:
      if (*a1 == 1001) {
        return (unsigned __int16)a1[3];
      }
      else {
        return 0;
      }
  }
}

uint64_t sub_262FBAE64(_WORD *a1)
{
  switch(*a1)
  {
    case 1:
    case 2:
      uint64_t result = 2 * (unsigned __int16)a1[4];
      break;
    case 3:
    case 4:
      goto LABEL_4;
    default:
      if (*a1 == 1001) {
LABEL_4:
      }
        uint64_t result = (unsigned __int16)a1[4];
      else {
        uint64_t result = 0;
      }
      break;
  }
  return result;
}

uint64_t sub_262FBAEC8(_WORD *a1)
{
  uint64_t v2 = 0;
  sub_262FBAEF8(a1, &v2, 0);
  return v2;
}

_WORD *sub_262FBAEF8(_WORD *result, void *a2, uint64_t *a3)
{
  switch(*result)
  {
    case 1:
      int v3 = (unsigned __int16)result[4];
      if (v3 == 33) {
        int v4 = 33;
      }
      else {
        int v4 = 0;
      }
      if (v3 == 60) {
        unsigned int v5 = 33;
      }
      else {
        unsigned int v5 = v4;
      }
      if (v3 == 60) {
        uint64_t v6 = 27;
      }
      else {
        uint64_t v6 = 0;
      }
      if (a2) {
        goto LABEL_39;
      }
      break;
    case 2:
      int v7 = (unsigned __int16)result[4];
      uint64_t v8 = 27;
      if (v7 == 92) {
        unsigned int v5 = 65;
      }
      else {
        unsigned int v5 = 0;
      }
      if (v7 != 92) {
        uint64_t v8 = 0;
      }
      if (v7 == 65)
      {
        unsigned int v5 = 65;
        uint64_t v8 = 0;
      }
      uint64_t v9 = 27;
      if (v7 == 60) {
        int v10 = 33;
      }
      else {
        int v10 = 0;
      }
      if (v7 != 60) {
        uint64_t v9 = 0;
      }
      if (v7 == 33)
      {
        int v10 = 33;
        uint64_t v9 = 0;
      }
      if ((unsigned __int16)result[4] > 0x40u)
      {
        uint64_t v6 = v8;
      }
      else
      {
        unsigned int v5 = v10;
        uint64_t v6 = v9;
      }
      if (a2) {
        goto LABEL_39;
      }
      break;
    case 3:
      unsigned int v5 = (unsigned __int16)result[11];
      uint64_t v6 = (unsigned __int16)result[12];
      if (a2) {
        goto LABEL_39;
      }
      break;
    case 4:
      uint64_t v6 = 0;
      unsigned int v5 = (unsigned __int16)result[11];
      if (a2) {
        goto LABEL_39;
      }
      break;
    default:
      uint64_t v6 = 27;
      unsigned int v5 = 0;
      if (*result != 1001) {
        uint64_t v6 = 0;
      }
      if (a2) {
LABEL_39:
      }
        *a2 = v5;
      break;
  }
  if (a3) {
    *a3 = v6;
  }
  return result;
}

_WORD *sub_262FBB008(_WORD *result)
{
  uint64_t v1 = 0;
  if (result)
  {
    sub_262FBAEF8(result, 0, &v1);
    return (_WORD *)v1;
  }
  return result;
}

uint64_t sub_262FBB03C(_WORD *a1, uint64_t a2)
{
  switch(*a1)
  {
    case 1:
    case 2:
      uint64_t result = (uint64_t)&a1[a2 + 11];
      break;
    case 3:
      uint64_t result = (uint64_t)&a1[a2 + 13];
      break;
    case 4:
      uint64_t result = (uint64_t)&a1[a2 + 12];
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

double sub_262FBB0A8(unsigned __int16 *a1, uint64_t a2, uint64_t a3, int a4)
{
  long long v19 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
  long long v20 = *MEMORY[0x263EF89A0];
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  sub_262FBAEF8(a1, &v22, &v21);
  if (!v21) {
    return *(double *)&v20;
  }
  int v8 = *a1;
  switch(*a1)
  {
    case 1u:
    case 2u:
    case 3u:
    case 4u:
      goto LABEL_3;
    default:
      if (v8 == 1001) {
LABEL_3:
      }
        uint64_t v9 = a1[7];
      else {
        uint64_t v9 = 0;
      }
      uint64_t v10 = v9 + a2;
      switch(*a1)
      {
        case 1u:
        case 2u:
        case 3u:
        case 4u:
          goto LABEL_5;
        default:
          if (v8 == 1001) {
LABEL_5:
          }
            uint64_t v11 = a1[5];
          else {
            uint64_t v11 = 0;
          }
          break;
      }
      break;
  }
  uint64_t v12 = v11 + a3;
  uint64_t v13 = sub_262FBAE64(a1);
  v15.i32[3] = HIDWORD(v19);
  double result = *(double *)&v20;
  switch(v8)
  {
    case 1:
    case 2:
    case 3:
    case 4:
      goto LABEL_7;
    default:
      v15.i32[3] = HIDWORD(v19);
      double result = *(double *)&v20;
      if (v8 == 1001) {
LABEL_7:
      }
        uint64_t v16 = a1[3];
      else {
        uint64_t v16 = 0;
      }
      if (v8 <= 2)
      {
        if (v8 != 1 && v8 != 2) {
          return result;
        }
        uint64_t v17 = (__int16 *)&a1[v22 + 11 + ((unint64_t)(v13 * v10 + v16 * v12) >> 1)];
        goto LABEL_23;
      }
      if (v8 == 3)
      {
        uint64_t v17 = (__int16 *)&a1[v22 + 13 + ((unint64_t)(v13 * v10 + v16 * v12) >> 1)];
LABEL_23:
        float v18 = 0.00024414;
        goto LABEL_24;
      }
      if (v8 != 1001) {
        return result;
      }
      uint64_t v17 = (__int16 *)&a1[v22 + 12 + ((unint64_t)(v13 * v10 + v16 * v12) >> 1)];
      float v18 = 1.0 / (float)(__int16)a1[11];
LABEL_24:
      if (a4 == 2)
      {
        v15.f32[0] = (float)v17[2];
        v15.f32[1] = (float)v17[5];
        v15.f32[2] = (float)v17[8];
      }
      else if (a4 == 1)
      {
        v15.f32[0] = (float)v17[1];
        v15.f32[1] = (float)v17[4];
        v15.f32[2] = (float)v17[7];
      }
      else
      {
        if (a4) {
          return result;
        }
        v15.f32[0] = (float)*v17;
        v15.f32[1] = (float)v17[3];
        v15.f32[2] = (float)v17[6];
      }
      *(void *)&double result = vmulq_n_f32(v15, v18).u64[0];
      break;
  }
  return result;
}

uint64_t sub_262FBB3E8(unsigned __int16 *a1)
{
  unsigned int v1 = *a1;
  if (v1 > 3)
  {
    if (v1 == 4 || v1 == 1001)
    {
      uint64_t v2 = 24;
LABEL_15:
      unsigned int v5 = a1[2];
      goto LABEL_16;
    }
  }
  else
  {
    if (v1 - 1 < 2)
    {
      uint64_t v2 = 22;
      goto LABEL_10;
    }
    if (v1 == 3)
    {
      uint64_t v2 = 26;
      goto LABEL_15;
    }
  }
  uint64_t v2 = 0;
LABEL_10:
  if (v1 == 2 || v1 == 1) {
    goto LABEL_15;
  }
  unsigned int v5 = 0;
LABEL_16:
  switch(*a1)
  {
    case 1u:
    case 2u:
    case 3u:
    case 4u:
      goto LABEL_17;
    default:
      if (v1 == 1001) {
LABEL_17:
      }
        unsigned int v4 = a1[3];
      else {
        unsigned int v4 = 0;
      }
      return MEMORY[0x270F9A6D0](MEMORY[0x263EFF8F8], sel_dataWithBytes_length_, a1, v2 + v4 * (unint64_t)v5);
  }
}

uint64_t sub_262FBB4B8(unsigned __int16 *a1)
{
  return MEMORY[0x270F9A6D0](MEMORY[0x263EFF8F8], sel_dataWithBytes_length_, a1, 2 * *a1 + 2);
}

void sub_262FCACB4(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v30 = a2;
  id v7 = a3;
  *a4 = 0;
  if (objc_msgSend_isEqualToString_(v30, v8, @"Bias", v9))
  {
    objc_msgSend_doubleValue(v7, v10, v11, v12);
    **(void **)(a1 + 32) = v13;
  }
  else if (objc_msgSend_isEqualToString_(v30, v10, @"CornerWeight", v12))
  {
    objc_msgSend_doubleValue(v7, v14, v15, v16);
    *(void *)(*(void *)(a1 + 32) + 16) = v17;
  }
  else if (objc_msgSend_isEqualToString_(v30, v14, @"FocusWeight", v16))
  {
    objc_msgSend_doubleValue(v7, v18, v19, v20);
    *(void *)(*(void *)(a1 + 32) + 24) = v21;
  }
  else if (objc_msgSend_isEqualToString_(v30, v18, @"MotionWeight", v20))
  {
    objc_msgSend_doubleValue(v7, v22, v23, v24);
    *(void *)(*(void *)(a1 + 32) + 32) = v25;
  }
  else if (objc_msgSend_isEqualToString_(v30, v22, @"GyroWeight", v24))
  {
    objc_msgSend_doubleValue(v7, v26, v27, v28);
    *(void *)(*(void *)(a1 + 32) + 8) = v29;
  }
}

uint64_t sub_262FCB960(void *a1, void *a2, void *a3, void *a4, int a5)
{
  uint64_t v384 = *MEMORY[0x263EF8340];
  id v8 = a1;
  id v330 = a2;
  id v335 = a3;
  id v334 = a4;
  v383[0] = 0;
  v329 = v8;
  uint64_t v11 = objc_msgSend_scannerWithString_(MEMORY[0x263F08B08], v9, (uint64_t)v8, v10);
  LOBYTE(a3) = objc_msgSend_scanHexInt_(v11, v12, (uint64_t)v383, v13);

  if ((a3 & 1) == 0
    || (objc_msgSend_numberWithUnsignedInt_(NSNumber, v14, v383[0], v15),
        (uint64_t v16 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    FigDebugAssert3();
    uint64_t v325 = FigSignalErrorAt();
    goto LABEL_161;
  }
  uint64_t v17 = (void *)v16;
  unint64_t v18 = 0x263EFF000uLL;
  id v19 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v350 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v365 = 0u;
  long long v366 = 0u;
  long long v367 = 0u;
  long long v368 = 0u;
  id obj = v330;
  uint64_t v336 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v365, (uint64_t)v378, 16);
  if (!v336) {
    goto LABEL_159;
  }
  uint64_t v332 = *(void *)v366;
  uint64_t v333 = (uint64_t)v17;
  p_vtable = RegPyrFusionShared.vtable;
  id v345 = v19;
  do
  {
    uint64_t v24 = 0;
    do
    {
      if (*(void *)v366 != v332)
      {
        uint64_t v25 = v24;
        objc_enumerationMutation(obj);
        uint64_t v24 = v25;
      }
      uint64_t v343 = v24;
      v349 = *(void **)(*((void *)&v365 + 1) + 8 * v24);
      uint64_t v26 = objc_msgSend_objectForKeyedSubscript_(obj, v21, (uint64_t)v349, v22, v327, v328);
      long long v361 = 0u;
      long long v362 = 0u;
      long long v363 = 0u;
      long long v364 = 0u;
      id v353 = v26;
      uint64_t v348 = objc_msgSend_countByEnumeratingWithState_objects_count_(v353, v27, (uint64_t)&v361, (uint64_t)v377, 16);
      if (v348)
      {
        uint64_t v347 = *(void *)v362;
        do
        {
          uint64_t v28 = 0;
          do
          {
            if (*(void *)v362 != v347) {
              objc_enumerationMutation(v353);
            }
            uint64_t v29 = *(void **)(*((void *)&v361 + 1) + 8 * v28);
            context = (void *)MEMORY[0x263E63C40]();
            int v32 = objc_msgSend_objectForKeyedSubscript_(v353, v30, (uint64_t)v29, v31);
            if (!v32)
            {
              goto LABEL_154;
            }
            id v33 = v32;
            id v359 = v29;
            id v34 = v349;
            id v35 = v19;
            id v36 = v350;
            v360 = v33;
            v357 = v35;
            uint64_t v358 = (uint64_t)v34;
            uint64_t v354 = v28;
            v355 = v36;
            if (objc_msgSend_isEqualToString_(v34, v37, @"DenoiseAndSharpening", v38))
            {
              uint64_t v41 = objc_opt_new();
              int Plist = objc_msgSend_readPlist_(v41, v42, (uint64_t)v33, v43);
              if (Plist)
              {
                uint64_t v328 = v331;
                LODWORD(v327) = Plist;
                goto LABEL_137;
              }
              goto LABEL_19;
            }
            if (objc_msgSend_isEqualToString_(v34, v39, @"NoiseModel", v40))
            {
              uint64_t v41 = objc_opt_new();
              int v49 = objc_msgSend_readPlist_(v41, v47, (uint64_t)v33, v48);
              if (v49)
              {
                uint64_t v328 = v331;
                LODWORD(v327) = v49;
                goto LABEL_137;
              }
              goto LABEL_19;
            }
            if (!objc_msgSend_isEqualToString_(v34, v45, @"Fusion", v46))
            {
              if (!objc_msgSend_isEqualToString_(v34, v78, @"ToneMapping", v79))
              {
                if (objc_msgSend_isEqualToString_(v34, v169, @"SyntheticLong", v170))
                {
                  uint64_t v41 = objc_opt_new();
                  v178 = objc_msgSend_objectForKeyedSubscript_(v33, v176, @"StaticSceneMotionThreshold", v177);
                  objc_msgSend_setObject_forKeyedSubscript_(v41, v179, (uint64_t)v178, @"StaticSceneMotionThreshold");

                  id v180 = objc_alloc((Class)(p_vtable + 367));
                  v183 = objc_msgSend_objectForKeyedSubscript_(v33, v181, @"SyntheticLongPedestal", v182);
                  v186 = objc_msgSend_initWithArray_(v180, v184, (uint64_t)v183, v185);

                  if (objc_msgSend_isValid(v186, v187, v188, v189))
                  {
                    long long v381 = 0u;
                    long long v382 = 0u;
                    long long v379 = 0u;
                    long long v380 = 0u;
                    uint64_t v191 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_270E50988, v190, (uint64_t)&v379, (uint64_t)v383, 16);
                    if (!v191) {
                      goto LABEL_92;
                    }
                    uint64_t v192 = v191;
                    uint64_t v193 = *(void *)v380;
                    while (1)
                    {
                      for (uint64_t i = 0; i != v192; ++i)
                      {
                        if (*(void *)v380 != v193) {
                          objc_enumerationMutation(&unk_270E50988);
                        }
                        uint64_t v195 = *(void *)(*((void *)&v379 + 1) + 8 * i);
                        float v196 = (id *)objc_opt_new();
                        v199 = objc_msgSend_objectForKeyedSubscript_(v360, v197, v195, v198);
                        int v202 = objc_msgSend_readPlist_(v196, v200, (uint64_t)v199, v201);

                        objc_storeStrong(v196 + 8, v186);
                        if (v202)
                        {
                          uint64_t v328 = v331;
                          LODWORD(v327) = v202;
                          FigDebugAssert3();
                          int v76 = FigSignalErrorAt();

                          unint64_t v18 = 0x263EFF000;
                          p_vtable = (void **)(RegPyrFusionShared + 24);
                          id v36 = v355;
                          id v19 = v345;
LABEL_105:

                          goto LABEL_24;
                        }
                        objc_msgSend_setObject_forKeyedSubscript_(v41, v203, (uint64_t)v196, v195);
                      }
                      uint64_t v192 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_270E50988, v204, (uint64_t)&v379, (uint64_t)v383, 16);
                      if (!v192)
                      {
LABEL_92:

                        unint64_t v18 = 0x263EFF000;
                        p_vtable = (void **)(RegPyrFusionShared + 24);
                        id v19 = v345;
                        goto LABEL_19;
                      }
                    }
                  }
                  uint64_t v328 = v331;
                  LODWORD(v327) = 0;
                  FigDebugAssert3();
                  int v76 = -1;
                  goto LABEL_105;
                }
                if (objc_msgSend_isEqualToString_(v34, v174, @"SyntheticReference", v175))
                {
                  uint64_t v41 = objc_opt_new();
                  int v210 = objc_msgSend_readPlist_(v41, v208, (uint64_t)v33, v209);
                  if (!v210) {
                    goto LABEL_19;
                  }
                  uint64_t v328 = v331;
                  LODWORD(v327) = v210;
                }
                else if (objc_msgSend_isEqualToString_(v34, v206, @"FrameSelection", v207))
                {
                  uint64_t v41 = objc_opt_new();
                  int v215 = objc_msgSend_readPlist_(v41, v213, (uint64_t)v33, v214);
                  if (!v215) {
                    goto LABEL_19;
                  }
                  uint64_t v328 = v331;
                  LODWORD(v327) = v215;
                }
                else if (objc_msgSend_isEqualToString_(v34, v211, @"GainMap", v212))
                {
                  uint64_t v41 = objc_opt_new();
                  int v220 = objc_msgSend_readPlist_(v41, v218, (uint64_t)v33, v219);
                  if (!v220) {
                    goto LABEL_19;
                  }
                  uint64_t v328 = v331;
                  LODWORD(v327) = v220;
                }
                else if (objc_msgSend_isEqualToString_(v34, v216, @"SemanticStyles", v217))
                {
                  uint64_t v41 = objc_opt_new();
                  int v225 = objc_msgSend_readPlist_(v41, v223, (uint64_t)v33, v224);
                  if (!v225) {
                    goto LABEL_19;
                  }
                  uint64_t v328 = v331;
                  LODWORD(v327) = v225;
                }
                else
                {
                  if (!objc_msgSend_isEqualToString_(v34, v221, @"BrightLightGreenGhost", v222))
                  {
                    if (!objc_msgSend_isEqualToString_(v34, v226, @"LowLightGreenGhost", v227))
                    {
                      int v76 = 0;
                      goto LABEL_27;
                    }
                    uint64_t v41 = objc_opt_new();
                    int v233 = objc_msgSend_readPlist_(v41, v231, (uint64_t)v33, v232);
                    if (v233)
                    {
                      uint64_t v328 = v331;
                      LODWORD(v327) = v233;
                      goto LABEL_137;
                    }
                    goto LABEL_19;
                  }
                  uint64_t v41 = objc_opt_new();
                  int v230 = objc_msgSend_readPlist_(v41, v228, (uint64_t)v33, v229);
                  if (!v230) {
                    goto LABEL_19;
                  }
                  uint64_t v328 = v331;
                  LODWORD(v327) = v230;
                }
LABEL_137:
                FigDebugAssert3();
                int v76 = FigSignalErrorAt();
                goto LABEL_24;
              }
              uint64_t v41 = objc_opt_new();
              int v173 = objc_msgSend_readPlist_(v41, v171, (uint64_t)v33, v172);
              if (v173)
              {
                uint64_t v328 = v331;
                LODWORD(v327) = v173;
                goto LABEL_137;
              }
LABEL_19:
              uint64_t v50 = (uint64_t)v41;
              if (v41) {
                goto LABEL_20;
              }
              int v76 = 0;
              uint64_t v28 = v354;
              id v36 = v355;
              goto LABEL_26;
            }
            v346 = (void **)(id)objc_opt_new();
            float v82 = objc_msgSend_valueForKey_(v33, v80, @"Bands", v81);
            float v83 = v82;
            if (!v82)
            {
              int v168 = FigSignalErrorAt();
              goto LABEL_119;
            }
            long long v375 = 0u;
            long long v376 = 0u;
            long long v373 = 0u;
            long long v374 = 0u;
            id v344 = v82;
            uint64_t v338 = objc_msgSend_countByEnumeratingWithState_objects_count_(v344, v84, (uint64_t)&v373, (uint64_t)v383, 16);
            if (!v338)
            {
              int v168 = 0;
              goto LABEL_118;
            }
            v340 = v83;
            uint64_t v341 = *(void *)v374;
LABEL_34:
            uint64_t v85 = 0;
            while (1)
            {
              if (*(void *)v374 != v341) {
                objc_enumerationMutation(v344);
              }
              uint64_t v342 = v85;
              __int32 v86 = *(void **)(*((void *)&v373 + 1) + 8 * v85);
              v87 = (void **)objc_opt_new();
              long long v369 = 0u;
              long long v370 = 0u;
              long long v371 = 0u;
              long long v372 = 0u;
              id v88 = v86;
              uint64_t v90 = objc_msgSend_countByEnumeratingWithState_objects_count_(v88, v89, (uint64_t)&v369, (uint64_t)&v379, 16);
              if (v90)
              {
                uint64_t v93 = v90;
                uint64_t v94 = *(void *)v370;
                do
                {
                  uint64_t v95 = 0;
                  do
                  {
                    if (*(void *)v370 != v94) {
                      objc_enumerationMutation(v88);
                    }
                    float v96 = *(void **)(*((void *)&v369 + 1) + 8 * v95);
                    float v97 = objc_msgSend_objectForKeyedSubscript_(v88, v91, (uint64_t)v96, v92, v327);
                    if (objc_msgSend_isEqualToString_(v96, v98, @"AdaptiveBlur", v99))
                    {
                      id v102 = objc_alloc((Class)(p_vtable + 367));
                      uint64_t v105 = objc_msgSend_initWithArray_(v102, v103, (uint64_t)v97, v104);
                      uint64_t v106 = v87[1];
                      v87[1] = (void *)v105;

                      if (!v105)
                      {
                        uint64_t v328 = v331;
                        LODWORD(v327) = 0;
LABEL_116:
                        FigDebugAssert3();
                        v205 = v345;
                        unint64_t v18 = 0x263EFF000;
                        id v33 = v360;
                        float v83 = v340;

                        goto LABEL_117;
                      }
                      goto LABEL_53;
                    }
                    if (objc_msgSend_isEqualToString_(v96, v100, @"LumaBlackThreshold", v101))
                    {
                      id v109 = objc_alloc((Class)(p_vtable + 367));
                      uint64_t v112 = objc_msgSend_initWithArray_(v109, v110, (uint64_t)v97, v111);
                      v113 = v87[2];
                      v87[2] = (void *)v112;

                      if (!v112)
                      {
                        uint64_t v328 = v331;
                        LODWORD(v327) = 0;
                        goto LABEL_116;
                      }
                      goto LABEL_53;
                    }
                    if (objc_msgSend_isEqualToString_(v96, v107, @"ChromaBlackThreshold", v108))
                    {
                      id v116 = objc_alloc((Class)(p_vtable + 367));
                      uint64_t v119 = objc_msgSend_initWithArray_(v116, v117, (uint64_t)v97, v118);
                      uint64_t v120 = v87[3];
                      v87[3] = (void *)v119;

                      if (!v119)
                      {
                        uint64_t v328 = v331;
                        LODWORD(v327) = 0;
                        goto LABEL_116;
                      }
                      goto LABEL_53;
                    }
                    if (objc_msgSend_isEqualToString_(v96, v114, @"DecayEdgeBoost", v115))
                    {
                      id v123 = objc_alloc((Class)(p_vtable + 367));
                      uint64_t v126 = objc_msgSend_initWithArray_(v123, v124, (uint64_t)v97, v125);
                      float v127 = v87[4];
                      v87[4] = (void *)v126;

                      if (!v126)
                      {
                        uint64_t v328 = v331;
                        LODWORD(v327) = 0;
                        goto LABEL_116;
                      }
LABEL_53:

                      goto LABEL_54;
                    }
                    uint64_t v130 = v87 + 5;
                    if ((objc_msgSend_isEqualToString_(v96, v121, @"DiffWeight", v122) & 1) == 0)
                    {
                      uint64_t v130 = v87 + 6;
                      if ((objc_msgSend_isEqualToString_(v96, v128, @"LumaFusionStrength", v129) & 1) == 0)
                      {
                        uint64_t v130 = v87 + 7;
                        if ((objc_msgSend_isEqualToString_(v96, v128, @"ChromaFusionStrength", v129) & 1) == 0) {
                          goto LABEL_53;
                        }
                      }
                    }
                    uint64_t v131 = objc_msgSend_objectForKeyedSubscript_(v88, v128, (uint64_t)v96, v129);
                    int v132 = *v130;
                    id v133 = v131;
                    uint64_t v134 = v132;
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v135 = v133;
                      uint64_t v138 = objc_msgSend_objectForKeyedSubscript_(v135, v136, @"EV0Reference", v137);
                      v351 = v135;
                      uint64_t v141 = objc_msgSend_objectForKeyedSubscript_(v135, v139, @"EVMReference", v140);
                      v352 = v138;
                      int v142 = sub_262FCDAB8(v138, v134[1]);
                      if (v142)
                      {
                        int v144 = v142;
                        uint64_t v328 = v331;
                        LODWORD(v327) = v142;
                      }
                      else
                      {
                        int v143 = sub_262FCDAB8(v141, v134[2]);
                        int v144 = v143;
                        if (!v143)
                        {
LABEL_62:

                          goto LABEL_64;
                        }
                        uint64_t v328 = v331;
                        LODWORD(v327) = v143;
                      }
                      FigDebugAssert3();
                      goto LABEL_62;
                    }
                    int v144 = -1;
LABEL_64:

                    p_vtable = (void **)(RegPyrFusionShared + 24);
                    if (v144)
                    {

                      v205 = v345;
                      unint64_t v18 = 0x263EFF000;
                      id v33 = v360;
                      float v83 = v340;
                      goto LABEL_117;
                    }
LABEL_54:
                    ++v95;
                  }
                  while (v93 != v95);
                  uint64_t v145 = objc_msgSend_countByEnumeratingWithState_objects_count_(v88, v91, (uint64_t)&v369, (uint64_t)&v379, 16);
                  uint64_t v93 = v145;
                }
                while (v145);
              }

              uint64_t v148 = objc_msgSend_objectForKey_(v88, v146, @"LumaBlackThreshold", v147);
              v205 = v345;
              unint64_t v18 = 0x263EFF000;
              float v83 = v340;
              if (v148)
              {
                uint64_t v151 = (void *)v148;
                uint64_t v152 = objc_msgSend_objectForKey_(v88, v149, @"ChromaBlackThreshold", v150);

                if (!v152)
                {
                  uint64_t v153 = objc_msgSend_objectForKeyedSubscript_(v88, v149, @"LumaBlackThreshold", v150);
                  id v154 = objc_alloc((Class)(p_vtable + 367));
                  uint64_t v157 = objc_msgSend_initWithArray_(v154, v155, (uint64_t)v153, v156);
                  __int32 v158 = v87[3];
                  v87[3] = (void *)v157;

                  if (!v157)
                  {
                    uint64_t v328 = v331;
                    LODWORD(v327) = 0;
                    FigDebugAssert3();

                    goto LABEL_150;
                  }
                }
              }
              id v159 = objc_msgSend_objectForKey_(v88, v149, @"DecayEdgeBoost", v150, v327);

              if (!v159)
              {
                id v162 = objc_alloc((Class)(p_vtable + 367));
                uint64_t v165 = objc_msgSend_initWithArray_(v162, v163, (uint64_t)&unk_270E509A0, v164);
                uint64_t v166 = v87[4];
                v87[4] = (void *)v165;

                if (!v165) {
                  break;
                }
              }
              objc_msgSend_addObject_(v346[1], v160, (uint64_t)v87, v161);

              uint64_t v85 = v342 + 1;
              id v33 = v360;
              if (v342 + 1 == v338)
              {
                id v19 = v345;
                int v168 = 0;
                id v36 = v355;
                uint64_t v338 = objc_msgSend_countByEnumeratingWithState_objects_count_(v344, v167, (uint64_t)&v373, (uint64_t)v383, 16);
                if (!v338) {
                  goto LABEL_118;
                }
                goto LABEL_34;
              }
            }
            uint64_t v328 = v331;
            LODWORD(v327) = 0;
            FigDebugAssert3();
LABEL_150:
            id v33 = v360;
LABEL_117:

            int v168 = -1;
            id v36 = v355;
            id v19 = v205;
LABEL_118:

LABEL_119:
            if (v168)
            {
              uint64_t v328 = v331;
              LODWORD(v327) = v168;
              FigDebugAssert3();
              int v76 = 0;
              uint64_t v41 = v346;
              goto LABEL_24;
            }
            *((unsigned char *)v346 + 24) = objc_msgSend_cmi_BOOLValueForKey_defaultValue_found_(v33, v234, @"PreWarpInputs", 0, 0);
            objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v33, v235, @"GrayGhostingCutoff", 0, 0.0);
            *((_DWORD *)v346 + 7) = v236;
            objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v33, v237, @"GrayGhostingEV0EVMDifferenceThreshold", 0, 0.0);
            *((_DWORD *)v346 + 8) = v238;
            objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v33, v239, @"GrayGhostingEV0WeightThreshold", 0, 0.0);
            *((_DWORD *)v346 + 9) = v240;
            objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v33, v241, @"GrayGhostingClippingThreshold", 0, 0.0);
            *((_DWORD *)v346 + 10) = v242;
            objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v33, v243, @"MotionDetectionClippingCutoffHigh", 0, 0.0);
            *((_DWORD *)v346 + 12) = v244;
            objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v33, v245, @"MotionDetectionClippingCutoffLow", 0, 0.0);
            *((_DWORD *)v346 + 13) = v246;
            objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v33, v247, @"MotionDetectionSifrEitCutoffHigh", 0, 0.0);
            *((_DWORD *)v346 + 14) = v248;
            objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v33, v249, @"MotionDetectionSifrEitCutoffLow", 0, 0.0);
            *((_DWORD *)v346 + 15) = v250;
            objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v33, v251, @"MotionDetectionGradientCutoffHigh", 0, 0.0);
            *((_DWORD *)v346 + 16) = v252;
            objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v33, v253, @"MotionDetectionGamma", 0, 0.0);
            *((_DWORD *)v346 + 17) = v254;
            objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v33, v255, @"MotionDetectionMotionThreshold", 0, 0.0);
            *((_DWORD *)v346 + 18) = v256;
            objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v33, v257, @"MotionDetectionMotionThresholdStaticScene", 0, 0.0);
            *((_DWORD *)v346 + 19) = v258;
            *((unsigned char *)v346 + 44) = objc_msgSend_cmi_BOOLValueForKey_defaultValue_found_(v33, v259, @"EnableMotionDetection", 0, 0);
            objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v33, v260, @"BlackAdaptiveBlurBoost", 0, 0.0);
            *((_DWORD *)v346 + 34) = v261;
            v264 = objc_msgSend_objectForKeyedSubscript_(v33, v262, @"GrayGhostingDepthOverrides", v263);
            uint64_t v41 = v264;
            uint64_t v50 = (uint64_t)v346;
            if (a5 && v264)
            {
              LODWORD(v267) = *((_DWORD *)v346 + 8);
              objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v264, v265, @"GrayGhostingEV0EVMDifferenceThreshold", 0, v267);
              *((_DWORD *)v346 + 8) = v268;
              LODWORD(v269) = *((_DWORD *)v346 + 10);
              objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v41, v270, @"GrayGhostingClippingThreshold", 0, v269);
              *((_DWORD *)v346 + 10) = v271;
            }
            v272 = objc_msgSend_objectForKeyedSubscript_(v33, v265, @"LensShadingFactor", v266, v327);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v273 = objc_alloc((Class)(p_vtable + 367));
              uint64_t v276 = objc_msgSend_initWithArray_(v273, v274, (uint64_t)v272, v275);
              v277 = v346[11];
              v346[11] = (void *)v276;

              if (!v346[11])
              {
                uint64_t v328 = v331;
                LODWORD(v327) = 0;
                goto LABEL_141;
              }
            }
            else
            {
              v279 = v346[11];
              v346[11] = 0;

              objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v33, v280, @"LensShadingFactor", 0, 0.0);
              *((_DWORD *)v346 + 20) = v281;
            }
            *((_DWORD *)v346 + 24) = objc_msgSend_cmi_intValueForKey_defaultValue_found_(v33, v278, @"HybridRegistrationMode", 0, 0);
            id v282 = objc_alloc((Class)(p_vtable + 367));
            objc_msgSend_valueForKey_(v33, v283, @"ShadowDenseBlendStrength", v284);
            v286 = v285 = v33;
            uint64_t v289 = objc_msgSend_initWithArray_(v282, v287, (uint64_t)v286, v288);
            v290 = v346[13];
            v346[13] = (void *)v289;

            if (!v346[13])
            {
              uint64_t v328 = v331;
              LODWORD(v327) = 0;
              goto LABEL_141;
            }
            id v291 = objc_alloc((Class)(p_vtable + 367));
            v294 = objc_msgSend_valueForKey_(v285, v292, @"NonShadowDenseBlendStrength", v293);
            uint64_t v297 = objc_msgSend_initWithArray_(v291, v295, (uint64_t)v294, v296);
            v298 = v346[14];
            v346[14] = (void *)v297;

            if (!v346[14])
            {
              uint64_t v328 = v331;
              LODWORD(v327) = 0;
LABEL_141:
              FigDebugAssert3();
              int v76 = FigSignalErrorAt();
LABEL_146:

              id v36 = v355;
              id v19 = v345;
              goto LABEL_24;
            }
            int v300 = objc_msgSend_cmi_BOOLValueForKey_defaultValue_found_(v285, v299, @"EnablePatchBasedFusion", 0, 0);
            *((unsigned char *)v346 + 120) = v300;
            v303 = v285;
            if (!v300) {
              goto LABEL_134;
            }
            v304 = objc_msgSend_objectForKeyedSubscript_(v285, v301, @"PatchBasedFusionParameters", v302);
            if (!v304)
            {
              uint64_t v328 = v331;
              LODWORD(v327) = 0;
              FigDebugAssert3();
              int v76 = FigSignalErrorAt();
LABEL_145:

              goto LABEL_146;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              uint64_t v328 = v331;
              LODWORD(v327) = 0;
              FigDebugAssert3();
              int v76 = -1;
              goto LABEL_145;
            }
            v305 = objc_opt_new();
            int v308 = objc_msgSend_readPlist_(v305, v306, (uint64_t)v304, v307);
            if (v308)
            {
              uint64_t v328 = v331;
              LODWORD(v327) = v308;
              FigDebugAssert3();
              int v76 = FigSignalErrorAt();

              goto LABEL_145;
            }
            v309 = v346[16];
            v346[16] = v305;

LABEL_134:
            *((unsigned char *)v346 + 140) = objc_msgSend_cmi_BOOLValueForKey_defaultValue_found_(v303, v301, @"EnableStationaryFusion", 0, 0);

            id v19 = v345;
LABEL_20:
            int v51 = p_vtable;
            id v52 = objc_alloc_init(*(Class *)(v18 + 2464));
            unint64_t v53 = v18;
            id v54 = objc_alloc_init(*(Class *)(v18 + 2464));
            int v55 = (void *)v50;
            objc_msgSend_setObject_forKeyedSubscript_(v52, v56, v50, (uint64_t)v359);
            objc_msgSend_setObject_forKeyedSubscript_(v54, v57, (uint64_t)v360, (uint64_t)v359);
            int v61 = objc_msgSend_allKeys(v357, v58, v59, v60);
            int v64 = objc_msgSend_containsObject_(v61, v62, v358, v63);

            if (v64)
            {
              uint64_t v67 = objc_msgSend_objectForKeyedSubscript_(v357, v65, v358, v66);
              objc_msgSend_addEntriesFromDictionary_(v67, v68, (uint64_t)v52, v69);

              id v36 = v355;
              int v72 = objc_msgSend_objectForKeyedSubscript_(v355, v70, v358, v71);
              objc_msgSend_addEntriesFromDictionary_(v72, v73, (uint64_t)v54, v74);
            }
            else
            {
              objc_msgSend_setObject_forKeyedSubscript_(v357, v65, (uint64_t)v52, v358);
              id v36 = v355;
              objc_msgSend_setObject_forKeyedSubscript_(v355, v75, (uint64_t)v54, v358);
            }

            int v76 = 0;
            uint64_t v41 = v55;
            unint64_t v18 = v53;
            p_vtable = v51;
LABEL_24:

            uint64_t v28 = v354;
LABEL_26:
            id v35 = v357;
            id v34 = (id)v358;
LABEL_27:

            if (v76) {
              goto LABEL_154;
            }
            ++v28;
          }
          while (v28 != v348);
          uint64_t v310 = objc_msgSend_countByEnumeratingWithState_objects_count_(v353, v77, (uint64_t)&v361, (uint64_t)v377, 16);
          uint64_t v348 = v310;
        }
        while (v310);
      }
LABEL_154:

      uint64_t v17 = (void *)v333;
      v313 = objc_msgSend_objectForKeyedSubscript_(v19, v311, v333, v312);

      if (v313)
      {
        v316 = objc_msgSend_objectForKeyedSubscript_(v335, v314, v333, v315);
        objc_msgSend_addEntriesFromDictionary_(v316, v317, (uint64_t)v19, v318);

        v321 = objc_msgSend_objectForKeyedSubscript_(v334, v319, v333, v320);
        objc_msgSend_addEntriesFromDictionary_(v321, v322, (uint64_t)v350, v323);
      }
      else
      {
        objc_msgSend_setObject_forKeyedSubscript_(v335, v314, (uint64_t)v19, v333);
        objc_msgSend_setObject_forKeyedSubscript_(v334, v324, (uint64_t)v350, v333);
      }

      uint64_t v24 = v343 + 1;
    }
    while (v343 + 1 != v336);
    uint64_t v336 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v365, (uint64_t)v378, 16);
  }
  while (v336);
LABEL_159:

  uint64_t v325 = 0;
LABEL_161:

  return v325;
}

float sub_262FCDA18(uint64_t a1, float a2)
{
  int v2 = *(_DWORD *)(a1 + 8);
  uint64_t v3 = (v2 - 1);
  if (v2 < 1) {
    return NAN;
  }
  unsigned int v4 = *(float **)(a1 + 16);
  if (*v4 >= a2) {
    return v4[1];
  }
  if (v4[2 * (v2 - 1)] <= a2) {
    return v4[2 * v3 + 1];
  }
  if (v2 < 2) {
    return NAN;
  }
  for (uint64_t i = v4 + 2; ; i += 2)
  {
    float v6 = *(i - 2);
    if (v6 <= a2 && *i > a2) {
      break;
    }
    if (!--v3) {
      return NAN;
    }
  }
  return *(i - 1) + (float)((float)((float)(a2 - v6) * (float)(i[1] - *(i - 1))) / (float)(*i - v6));
}

uint64_t sub_262FCDAB8(void *a1, void *a2)
{
  id v3 = a1;
  unsigned int v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v3;
    id v8 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"SparseFrameParameters", v7);
    uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v5, v9, @"SparseFrameParametersStaticScene", v10);
    uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v5, v12, @"DenseFrameParameters", v13);
    uint64_t v15 = [GainValueArray alloc];
    uint64_t v18 = objc_msgSend_initWithArray_(v15, v16, (uint64_t)v8, v17);
    id v19 = (void *)v4[1];
    v4[1] = v18;

    if (!v18) {
      goto LABEL_12;
    }
    uint64_t v20 = [GainValueArray alloc];
    uint64_t v23 = objc_msgSend_initWithArray_(v20, v21, (uint64_t)v11, v22);
    uint64_t v24 = (void *)v4[2];
    v4[2] = v23;

    if (!v23) {
      goto LABEL_12;
    }
    uint64_t v25 = [GainValueArray alloc];
    uint64_t v28 = objc_msgSend_initWithArray_(v25, v26, (uint64_t)v14, v27);
    uint64_t v29 = (void *)v4[3];
    v4[3] = v28;

    if (v28)
    {
      uint64_t v30 = 0;
    }
    else
    {
LABEL_12:
      FigDebugAssert3();
      uint64_t v30 = 0xFFFFFFFFLL;
    }
  }
  else
  {
    uint64_t v31 = [GainValueArray alloc];
    uint64_t v34 = objc_msgSend_initWithArray_(v31, v32, (uint64_t)v3, v33);
    id v35 = (void *)v4[1];
    v4[1] = v34;

    if (!v34) {
      goto LABEL_13;
    }
    id v36 = [GainValueArray alloc];
    uint64_t v39 = objc_msgSend_initWithArray_(v36, v37, (uint64_t)v3, v38);
    uint64_t v40 = (void *)v4[2];
    v4[2] = v39;

    if (!v39) {
      goto LABEL_13;
    }
    uint64_t v41 = [GainValueArray alloc];
    uint64_t v44 = objc_msgSend_initWithArray_(v41, v42, (uint64_t)v3, v43);
    float32x4_t v45 = (void *)v4[3];
    v4[3] = v44;

    if (v44)
    {
      uint64_t v30 = 0;
    }
    else
    {
LABEL_13:
      FigDebugAssert3();
      uint64_t v30 = 0xFFFFFFFFLL;
    }
  }

  return v30;
}

void sub_262FCE26C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_262FD0D3C()
{
  qword_26B429658 = objc_alloc_init(NRFMonitor);

  return MEMORY[0x270F9A758]();
}

void sub_262FD0F9C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_releaseAllNRFSingletons(WeakRetained, v1, v2, v3);
}

void sub_262FD5690(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

void sub_262FD6464(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id location)
{
  objc_destroyWeak(v35);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_262FD64B4(uint64_t a1)
{
  unsigned int v1 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend_didFinishProcessingWithCompletionStatus_(v1, v2, (uint64_t)WeakRetained, v3);
}

uint64_t sub_262FD9098(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_processorGetInferenceResults_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), a4);
}

uint64_t sub_262FDBF10()
{
  mach_msg_type_number_t host_info_outCnt = 0;
  vm_size_t v34 = 0;
  memset(host_info_out, 0, 60);
  uint64_t v32 = 0;
  memset(task_info_out, 0, sizeof(task_info_out));
  mach_msg_type_number_t task_info_outCnt = 10;
  v29[0] = 0;
  v29[1] = 0;
  mach_msg_type_number_t v28 = 4;
  int v27 = 0;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  *(_OWORD *)uint64_t v4 = 0u;
  long long v5 = 0u;
  mach_msg_type_number_t v3 = 93;
  v0 = (task_name_t *)MEMORY[0x263EF8960];
  if (task_info(*MEMORY[0x263EF8960], 0x12u, (task_info_t)task_info_out, &task_info_outCnt)
    || task_info(*v0, 3u, (task_info_t)v29, &v28)
    || task_info(*v0, 0x16u, v4, &v3)
    || (host_t v1 = MEMORY[0x263E63B90](),
        mach_msg_type_number_t host_info_outCnt = 15,
        host_page_size(v1, &v34),
        uint64_t result = host_statistics(v1, 2, (host_info_t)host_info_out, &host_info_outCnt),
        result))
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  return result;
}

uint64_t sub_262FDF024(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_processorGetInferenceResults_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), a4);
}

void sub_262FDF030(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v15, (uint64_t)v19, 16);
  if (v4)
  {
    uint64_t v8 = v4;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v2);
        }
        long long v11 = *(void **)(a1 + 40);
        uint64_t v12 = *(void *)(a1 + 48);
        uint64_t v13 = objc_msgSend_unsignedIntValue(*(void **)(*((void *)&v15 + 1) + 8 * v10), v5, v6, v7, (void)v15);
        objc_msgSend_processor_didCompleteProcessingForSurfaceID_(v11, v14, v12, v13);
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v5, (uint64_t)&v15, (uint64_t)v19, 16);
    }
    while (v8);
  }
}

void sub_262FE0278(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend_GPUEndTime(v2, v3, v4, v5);
  objc_msgSend_GPUStartTime(v2, v6, v7, v8);

  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
  }
}

void sub_262FE0318(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

void sub_262FE3D08(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend_GPUEndTime(v2, v3, v4, v5);
  objc_msgSend_GPUStartTime(v2, v6, v7, v8);

  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
  }
}

void sub_262FE3DA8(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

unint64_t sub_262FE5BC0(float *a1, float *a2)
{
  return (__PAIR64__(*a1 < *a2, *a2) - COERCE_UNSIGNED_INT(*a1)) >> 32;
}

unint64_t sub_262FE5BDC(float *a1, float *a2)
{
  return (__PAIR64__(*a1 < *a2, *a2) - COERCE_UNSIGNED_INT(*a1)) >> 32;
}

uint64_t sub_262FE5BF8()
{
  uint64_t result = _sl_dlopen();
  qword_26B429638 = result;
  return result;
}

void sub_262FEA3F0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  v579[3] = *MEMORY[0x263EF8340];
  objc_msgSend_defaultRadialParams_(VideoDefringingTuningParameters, a2, 1, a4);
  objc_msgSend_defaultLUTParams_(VideoDefringingTuningParameters, v4, 1, v5);
  int v7 = v6;
  int v9 = v8;
  int v11 = v10;
  v579[0] = MEMORY[0x263EFFA88];
  v578[0] = @"CorrectionEnabled";
  v578[1] = @"RadialParameters";
  v576[0] = @"a0";
  LODWORD(v12) = 0;
  v553 = objc_msgSend_numberWithFloat_(NSNumber, v13, v14, v15, v12);
  v577[0] = v553;
  v576[1] = @"a1";
  LODWORD(v16) = 0;
  v550 = objc_msgSend_numberWithFloat_(NSNumber, v17, v18, v19, v16);
  v577[1] = v550;
  v576[2] = @"a2";
  LODWORD(v20) = 0;
  long long v24 = objc_msgSend_numberWithFloat_(NSNumber, v21, v22, v23, v20);
  v577[2] = v24;
  v576[3] = @"a3";
  LODWORD(v25) = 0;
  uint64_t v29 = objc_msgSend_numberWithFloat_(NSNumber, v26, v27, v28, v25);
  v577[3] = v29;
  v576[4] = @"MinCoefficient";
  LODWORD(v30) = 0;
  vm_size_t v34 = objc_msgSend_numberWithFloat_(NSNumber, v31, v32, v33, v30);
  v577[4] = v34;
  id v36 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v35, (uint64_t)v577, (uint64_t)v576, 5);
  v579[1] = v36;
  v578[2] = @"DesaturateParameters";
  v574[0] = @"Amount";
  LODWORD(v37) = v7;
  uint64_t v41 = objc_msgSend_numberWithFloat_(NSNumber, v38, v39, v40, v37);
  v575[0] = v41;
  v574[1] = @"Angle";
  LODWORD(v42) = v9;
  uint64_t v46 = objc_msgSend_numberWithFloat_(NSNumber, v43, v44, v45, v42);
  v575[1] = v46;
  v574[2] = @"Cutoff";
  LODWORD(v47) = v11;
  int v51 = objc_msgSend_numberWithFloat_(NSNumber, v48, v49, v50, v47);
  v575[2] = v51;
  unint64_t v53 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v52, (uint64_t)v575, (uint64_t)v574, 3);
  v579[2] = v53;
  v555 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v54, (uint64_t)v579, (uint64_t)v578, 3);

  objc_msgSend_defaultCorrectionParams_(VideoDefringingTuningParameters, v55, 2, v56);
  objc_msgSend_defaultRadialParams_(VideoDefringingTuningParameters, v57, 2, v58);
  objc_msgSend_defaultLUTParams_(VideoDefringingTuningParameters, v59, 2, v60);
  int v62 = v61;
  int v64 = v63;
  int v66 = v65;
  v573[0] = MEMORY[0x263EFFA88];
  v572[0] = @"CorrectionEnabled";
  v572[1] = @"RadialParameters";
  v570[0] = @"a0";
  LODWORD(v67) = 0;
  v551 = objc_msgSend_numberWithFloat_(NSNumber, v68, v69, v70, v67);
  v571[0] = v551;
  v570[1] = @"a1";
  LODWORD(v71) = 0;
  v548 = objc_msgSend_numberWithFloat_(NSNumber, v72, v73, v74, v71);
  v571[1] = v548;
  v570[2] = @"a2";
  LODWORD(v75) = 0;
  v546 = objc_msgSend_numberWithFloat_(NSNumber, v76, v77, v78, v75);
  v571[2] = v546;
  v570[3] = @"a3";
  LODWORD(v79) = 0;
  v544 = objc_msgSend_numberWithFloat_(NSNumber, v80, v81, v82, v79);
  v571[3] = v544;
  v570[4] = @"MinCoefficient";
  LODWORD(v83) = 0;
  v542 = objc_msgSend_numberWithFloat_(NSNumber, v84, v85, v86, v83);
  v571[4] = v542;
  v540 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v87, (uint64_t)v571, (uint64_t)v570, 5);
  v573[1] = v540;
  v572[2] = @"DesaturateParameters";
  v568[0] = @"Amount";
  LODWORD(v88) = v62;
  v538 = objc_msgSend_numberWithFloat_(NSNumber, v89, v90, v91, v88);
  v569[0] = v538;
  v568[1] = @"Angle";
  LODWORD(v92) = v64;
  v536 = objc_msgSend_numberWithFloat_(NSNumber, v93, v94, v95, v92);
  v569[1] = v536;
  v568[2] = @"Cutoff";
  LODWORD(v96) = v66;
  v534 = objc_msgSend_numberWithFloat_(NSNumber, v97, v98, v99, v96);
  v569[2] = v534;
  v532 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v100, (uint64_t)v569, (uint64_t)v568, 3);
  v573[2] = v532;
  v572[3] = @"CorrectionParameters";
  v566[0] = @"MaxChroma";
  LODWORD(v101) = 0;
  v530 = objc_msgSend_numberWithFloat_(NSNumber, v102, v103, v104, v101);
  v567[0] = v530;
  v566[1] = @"BlueTh0";
  LODWORD(v105) = 0;
  v528 = objc_msgSend_numberWithFloat_(NSNumber, v106, v107, v108, v105);
  v567[1] = v528;
  v566[2] = @"BlueTh1";
  LODWORD(v109) = 0;
  v526 = objc_msgSend_numberWithFloat_(NSNumber, v110, v111, v112, v109);
  v567[2] = v526;
  v566[3] = @"BlueCrTh0";
  LODWORD(v113) = 0;
  v524 = objc_msgSend_numberWithFloat_(NSNumber, v114, v115, v116, v113);
  v567[3] = v524;
  v566[4] = @"ContrastTh0";
  LODWORD(v117) = 0;
  v522 = objc_msgSend_numberWithFloat_(NSNumber, v118, v119, v120, v117);
  v567[4] = v522;
  v566[5] = @"ContrastTh1";
  LODWORD(v121) = 0;
  v520 = objc_msgSend_numberWithFloat_(NSNumber, v122, v123, v124, v121);
  v567[5] = v520;
  v566[6] = @"DarknessTh0";
  LODWORD(v125) = 0;
  v518 = objc_msgSend_numberWithFloat_(NSNumber, v126, v127, v128, v125);
  v567[6] = v518;
  v566[7] = @"DarknessTh1";
  LODWORD(v129) = 0;
  v516 = objc_msgSend_numberWithFloat_(NSNumber, v130, v131, v132, v129);
  v567[7] = v516;
  v566[8] = @"PbrightnessTh0";
  LODWORD(v133) = 0;
  v514 = objc_msgSend_numberWithFloat_(NSNumber, v134, v135, v136, v133);
  v567[8] = v514;
  v566[9] = @"PbrightnessTh1";
  LODWORD(v137) = 0;
  v512 = objc_msgSend_numberWithFloat_(NSNumber, v138, v139, v140, v137);
  v567[9] = v512;
  v566[10] = @"BlueBrightThr0";
  LODWORD(v141) = 0;
  v510 = objc_msgSend_numberWithFloat_(NSNumber, v142, v143, v144, v141);
  v567[10] = v510;
  v566[11] = @"BlueBrightThr1";
  LODWORD(v145) = 0;
  v508 = objc_msgSend_numberWithFloat_(NSNumber, v146, v147, v148, v145);
  v567[11] = v508;
  v566[12] = @"ColorfullThr0";
  LODWORD(v149) = 0;
  v506 = objc_msgSend_numberWithFloat_(NSNumber, v150, v151, v152, v149);
  v567[12] = v506;
  v566[13] = @"ColorfullThr1";
  LODWORD(v153) = 0;
  v504 = objc_msgSend_numberWithFloat_(NSNumber, v154, v155, v156, v153);
  v567[13] = v504;
  v566[14] = @"ColorfullPThr0";
  LODWORD(v157) = 0;
  v502 = objc_msgSend_numberWithFloat_(NSNumber, v158, v159, v160, v157);
  v567[14] = v502;
  v566[15] = @"ColorfullPThr1";
  LODWORD(v161) = 0;
  v500 = objc_msgSend_numberWithFloat_(NSNumber, v162, v163, v164, v161);
  v567[15] = v500;
  v566[16] = @"BlueCrThr0";
  LODWORD(v165) = 0;
  v498 = objc_msgSend_numberWithFloat_(NSNumber, v166, v167, v168, v165);
  v567[16] = v498;
  v566[17] = @"BlueCrThr1";
  LODWORD(v169) = 0;
  v496 = objc_msgSend_numberWithFloat_(NSNumber, v170, v171, v172, v169);
  v567[17] = v496;
  v566[18] = @"DarkBlueCbThr0";
  LODWORD(v173) = 0;
  v494 = objc_msgSend_numberWithFloat_(NSNumber, v174, v175, v176, v173);
  v567[18] = v494;
  v566[19] = @"DarkBlueCbThr1";
  LODWORD(v177) = 0;
  v492 = objc_msgSend_numberWithFloat_(NSNumber, v178, v179, v180, v177);
  v567[19] = v492;
  v566[20] = @"SkyBlueYThr0";
  LODWORD(v181) = 0;
  uint64_t v185 = objc_msgSend_numberWithFloat_(NSNumber, v182, v183, v184, v181);
  v567[20] = v185;
  v566[21] = @"SkyBlueYThr1";
  LODWORD(v186) = 0;
  uint64_t v190 = objc_msgSend_numberWithFloat_(NSNumber, v187, v188, v189, v186);
  v567[21] = v190;
  v566[22] = @"SkyBlueCbThr0";
  LODWORD(v191) = 0;
  uint64_t v195 = objc_msgSend_numberWithFloat_(NSNumber, v192, v193, v194, v191);
  v567[22] = v195;
  v566[23] = @"SkyBlueCbThr1";
  LODWORD(v196) = 0;
  uint64_t v200 = objc_msgSend_numberWithFloat_(NSNumber, v197, v198, v199, v196);
  v567[23] = v200;
  v566[24] = @"SkyBluePThr0";
  LODWORD(v201) = 0;
  v205 = objc_msgSend_numberWithFloat_(NSNumber, v202, v203, v204, v201);
  v567[24] = v205;
  v566[25] = @"SkyBluePThr1";
  LODWORD(v206) = 0;
  int v210 = objc_msgSend_numberWithFloat_(NSNumber, v207, v208, v209, v206);
  v567[25] = v210;
  v566[26] = @"FiltThr";
  LODWORD(v211) = 0;
  int v215 = objc_msgSend_numberWithFloat_(NSNumber, v212, v213, v214, v211);
  v567[26] = v215;
  uint64_t v217 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v216, (uint64_t)v567, (uint64_t)v566, 27);
  v573[3] = v217;
  v554 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v218, (uint64_t)v573, (uint64_t)v572, 4);

  objc_msgSend_defaultCorrectionParams_(VideoDefringingTuningParameters, v219, 2, v220);
  objc_msgSend_defaultRadialParams_(VideoDefringingTuningParameters, v221, 2, v222);
  objc_msgSend_defaultLUTParams_(VideoDefringingTuningParameters, v223, 2, v224);
  int v226 = v225;
  int v228 = v227;
  int v230 = v229;
  v565[0] = MEMORY[0x263EFFA88];
  v564[0] = @"CorrectionEnabled";
  v564[1] = @"RadialParameters";
  v562[0] = @"a0";
  LODWORD(v231) = 0;
  v552 = objc_msgSend_numberWithFloat_(NSNumber, v232, v233, v234, v231);
  v563[0] = v552;
  v562[1] = @"a1";
  LODWORD(v235) = 0;
  v549 = objc_msgSend_numberWithFloat_(NSNumber, v236, v237, v238, v235);
  v563[1] = v549;
  v562[2] = @"a2";
  LODWORD(v239) = 0;
  v547 = objc_msgSend_numberWithFloat_(NSNumber, v240, v241, v242, v239);
  v563[2] = v547;
  v562[3] = @"a3";
  LODWORD(v243) = 0;
  v545 = objc_msgSend_numberWithFloat_(NSNumber, v244, v245, v246, v243);
  v563[3] = v545;
  v562[4] = @"MinCoefficient";
  LODWORD(v247) = 0;
  v543 = objc_msgSend_numberWithFloat_(NSNumber, v248, v249, v250, v247);
  v563[4] = v543;
  v541 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v251, (uint64_t)v563, (uint64_t)v562, 5);
  v565[1] = v541;
  v564[2] = @"DesaturateParameters";
  v560[0] = @"Amount";
  LODWORD(v252) = v226;
  v539 = objc_msgSend_numberWithFloat_(NSNumber, v253, v254, v255, v252);
  v561[0] = v539;
  v560[1] = @"Angle";
  LODWORD(v256) = v228;
  v537 = objc_msgSend_numberWithFloat_(NSNumber, v257, v258, v259, v256);
  v561[1] = v537;
  v560[2] = @"Cutoff";
  LODWORD(v260) = v230;
  v535 = objc_msgSend_numberWithFloat_(NSNumber, v261, v262, v263, v260);
  v561[2] = v535;
  v533 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v264, (uint64_t)v561, (uint64_t)v560, 3);
  v565[2] = v533;
  v564[3] = @"CorrectionParameters";
  v558[0] = @"RadialScale";
  LODWORD(v265) = 0;
  v531 = objc_msgSend_numberWithFloat_(NSNumber, v266, v267, v268, v265);
  v559[0] = v531;
  v558[1] = @"RadialR0";
  LODWORD(v269) = 0;
  v529 = objc_msgSend_numberWithFloat_(NSNumber, v270, v271, v272, v269);
  v559[1] = v529;
  v558[2] = @"RadialR1";
  LODWORD(v273) = 0;
  v527 = objc_msgSend_numberWithFloat_(NSNumber, v274, v275, v276, v273);
  v559[2] = v527;
  v558[3] = @"RadialF0";
  LODWORD(v277) = 0;
  v525 = objc_msgSend_numberWithFloat_(NSNumber, v278, v279, v280, v277);
  v559[3] = v525;
  v558[4] = @"RadialF1";
  LODWORD(v281) = 0;
  v523 = objc_msgSend_numberWithFloat_(NSNumber, v282, v283, v284, v281);
  v559[4] = v523;
  v558[5] = @"RadialF2";
  LODWORD(v285) = 0;
  v521 = objc_msgSend_numberWithFloat_(NSNumber, v286, v287, v288, v285);
  v559[5] = v521;
  v558[6] = @"MaxChroma";
  LODWORD(v289) = 0;
  v519 = objc_msgSend_numberWithFloat_(NSNumber, v290, v291, v292, v289);
  v559[6] = v519;
  v558[7] = @"BlueTh0";
  LODWORD(v293) = 0;
  v517 = objc_msgSend_numberWithFloat_(NSNumber, v294, v295, v296, v293);
  v559[7] = v517;
  v558[8] = @"BlueTh1";
  LODWORD(v297) = 0;
  v515 = objc_msgSend_numberWithFloat_(NSNumber, v298, v299, v300, v297);
  v559[8] = v515;
  v558[9] = @"BlueCrTh0";
  LODWORD(v301) = 0;
  v513 = objc_msgSend_numberWithFloat_(NSNumber, v302, v303, v304, v301);
  v559[9] = v513;
  v558[10] = @"BrightnessTh0";
  LODWORD(v305) = 0;
  v511 = objc_msgSend_numberWithFloat_(NSNumber, v306, v307, v308, v305);
  v559[10] = v511;
  v558[11] = @"BrightnessTh1";
  LODWORD(v309) = 0;
  v509 = objc_msgSend_numberWithFloat_(NSNumber, v310, v311, v312, v309);
  v559[11] = v509;
  v558[12] = @"ContrastTh0";
  LODWORD(v313) = 0;
  v507 = objc_msgSend_numberWithFloat_(NSNumber, v314, v315, v316, v313);
  v559[12] = v507;
  v558[13] = @"ContrastTh1";
  LODWORD(v317) = 0;
  v505 = objc_msgSend_numberWithFloat_(NSNumber, v318, v319, v320, v317);
  v559[13] = v505;
  v558[14] = @"DarknessTh0";
  LODWORD(v321) = 0;
  v503 = objc_msgSend_numberWithFloat_(NSNumber, v322, v323, v324, v321);
  v559[14] = v503;
  v558[15] = @"DarknessTh1";
  LODWORD(v325) = 0;
  v501 = objc_msgSend_numberWithFloat_(NSNumber, v326, v327, v328, v325);
  v559[15] = v501;
  v558[16] = @"LumaKnee";
  LODWORD(v329) = 0;
  v499 = objc_msgSend_numberWithFloat_(NSNumber, v330, v331, v332, v329);
  v559[16] = v499;
  v558[17] = @"LumaAmp";
  LODWORD(v333) = 0;
  v497 = objc_msgSend_numberWithFloat_(NSNumber, v334, v335, v336, v333);
  v559[17] = v497;
  v558[18] = @"PbrightnessTh0";
  LODWORD(v337) = 0;
  v495 = objc_msgSend_numberWithFloat_(NSNumber, v338, v339, v340, v337);
  v559[18] = v495;
  v558[19] = @"PbrightnessTh1";
  LODWORD(v341) = 0;
  v493 = objc_msgSend_numberWithFloat_(NSNumber, v342, v343, v344, v341);
  v559[19] = v493;
  v558[20] = @"BlueBrightThr0";
  LODWORD(v345) = 0;
  v491 = objc_msgSend_numberWithFloat_(NSNumber, v346, v347, v348, v345);
  v559[20] = v491;
  v558[21] = @"BlueBrightThr1";
  LODWORD(v349) = 0;
  v490 = objc_msgSend_numberWithFloat_(NSNumber, v350, v351, v352, v349);
  v559[21] = v490;
  v558[22] = @"ColorfullThr0";
  LODWORD(v353) = 0;
  v489 = objc_msgSend_numberWithFloat_(NSNumber, v354, v355, v356, v353);
  v559[22] = v489;
  v558[23] = @"ColorfullThr1";
  LODWORD(v357) = 0;
  v488 = objc_msgSend_numberWithFloat_(NSNumber, v358, v359, v360, v357);
  v559[23] = v488;
  v558[24] = @"ColorfullPThr0";
  LODWORD(v361) = 0;
  v487 = objc_msgSend_numberWithFloat_(NSNumber, v362, v363, v364, v361);
  v559[24] = v487;
  v558[25] = @"ColorfullPThr1";
  LODWORD(v365) = 0;
  v486 = objc_msgSend_numberWithFloat_(NSNumber, v366, v367, v368, v365);
  v559[25] = v486;
  v558[26] = @"BlueCrThr0";
  LODWORD(v369) = 0;
  v485 = objc_msgSend_numberWithFloat_(NSNumber, v370, v371, v372, v369);
  v559[26] = v485;
  v558[27] = @"BlueCrThr1";
  LODWORD(v373) = 0;
  v484 = objc_msgSend_numberWithFloat_(NSNumber, v374, v375, v376, v373);
  v559[27] = v484;
  v558[28] = @"DarkAchromThr0";
  LODWORD(v377) = 0;
  v483 = objc_msgSend_numberWithFloat_(NSNumber, v378, v379, v380, v377);
  v559[28] = v483;
  v558[29] = @"DarkAchromThr1";
  LODWORD(v381) = 0;
  v482 = objc_msgSend_numberWithFloat_(NSNumber, v382, v383, v384, v381);
  v559[29] = v482;
  v558[30] = @"DarkAchromCThr";
  LODWORD(v385) = 0;
  v481 = objc_msgSend_numberWithFloat_(NSNumber, v386, v387, v388, v385);
  v559[30] = v481;
  v558[31] = @"DarkAchromYThr";
  LODWORD(v389) = 0;
  v480 = objc_msgSend_numberWithFloat_(NSNumber, v390, v391, v392, v389);
  v559[31] = v480;
  v558[32] = @"DarkBlueYThr0";
  LODWORD(v393) = 0;
  v479 = objc_msgSend_numberWithFloat_(NSNumber, v394, v395, v396, v393);
  v559[32] = v479;
  v558[33] = @"DarkBlueYThr1";
  LODWORD(v397) = 0;
  v478 = objc_msgSend_numberWithFloat_(NSNumber, v398, v399, v400, v397);
  v559[33] = v478;
  v558[34] = @"DarkBlueCbThr0";
  LODWORD(v401) = 0;
  v477 = objc_msgSend_numberWithFloat_(NSNumber, v402, v403, v404, v401);
  v559[34] = v477;
  v558[35] = @"DarkBlueCbThr1";
  LODWORD(v405) = 0;
  v476 = objc_msgSend_numberWithFloat_(NSNumber, v406, v407, v408, v405);
  v559[35] = v476;
  v558[36] = @"SkyBlueYThr0";
  LODWORD(v409) = 0;
  v475 = objc_msgSend_numberWithFloat_(NSNumber, v410, v411, v412, v409);
  v559[36] = v475;
  v558[37] = @"SkyBlueYThr1";
  LODWORD(v413) = 0;
  v474 = objc_msgSend_numberWithFloat_(NSNumber, v414, v415, v416, v413);
  v559[37] = v474;
  v558[38] = @"SkyBlueCbThr0";
  LODWORD(v417) = 0;
  v473 = objc_msgSend_numberWithFloat_(NSNumber, v418, v419, v420, v417);
  v559[38] = v473;
  v558[39] = @"SkyBlueCbThr1";
  LODWORD(v421) = 0;
  v472 = objc_msgSend_numberWithFloat_(NSNumber, v422, v423, v424, v421);
  v559[39] = v472;
  v558[40] = @"SkyBluePThr0";
  LODWORD(v425) = 0;
  v429 = objc_msgSend_numberWithFloat_(NSNumber, v426, v427, v428, v425);
  v559[40] = v429;
  v558[41] = @"SkyBluePThr1";
  LODWORD(v430) = 0;
  v434 = objc_msgSend_numberWithFloat_(NSNumber, v431, v432, v433, v430);
  v559[41] = v434;
  v558[42] = @"FiltThr";
  LODWORD(v435) = 0;
  v439 = objc_msgSend_numberWithFloat_(NSNumber, v436, v437, v438, v435);
  v559[42] = v439;
  v558[43] = @"MixFiltLUT";
  LODWORD(v440) = 0;
  v444 = objc_msgSend_numberWithFloat_(NSNumber, v441, v442, v443, v440);
  v559[43] = v444;
  v558[44] = @"EITThr0";
  LODWORD(v445) = 0;
  v449 = objc_msgSend_numberWithFloat_(NSNumber, v446, v447, v448, v445);
  v559[44] = v449;
  v558[45] = @"EITThr1";
  LODWORD(v450) = 0;
  v454 = objc_msgSend_numberWithFloat_(NSNumber, v451, v452, v453, v450);
  v559[45] = v454;
  v558[46] = @"AwbRatioThr0";
  LODWORD(v455) = 0;
  v459 = objc_msgSend_numberWithFloat_(NSNumber, v456, v457, v458, v455);
  v559[46] = v459;
  v558[47] = @"AwbRatioThr1";
  LODWORD(v460) = 0;
  v464 = objc_msgSend_numberWithFloat_(NSNumber, v461, v462, v463, v460);
  v559[47] = v464;
  v466 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v465, (uint64_t)v559, (uint64_t)v558, 48);
  v565[3] = v466;
  v468 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v467, (uint64_t)v565, (uint64_t)v564, 4);

  v556[0] = @"Slomo";
  v556[1] = @"Video";
  v557[0] = v555;
  v557[1] = v554;
  v556[2] = @"Still";
  v557[2] = v468;
  uint64_t v470 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v469, (uint64_t)v557, (uint64_t)v556, 3);
  v471 = (void *)qword_26B429738;
  qword_26B429738 = v470;
}

void sub_262FED980(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_262FEE0D0()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262FEE104(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

void sub_262FEEF14(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_262FEF724()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262FEF758(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

uint64_t sub_262FEFAA0()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262FEFAD4(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

uint64_t sub_262FEFEC8()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262FEFEFC(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

uint64_t sub_262FF0784()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262FF07B8(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

id sub_262FF1D4C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2050000000;
  uint64_t v4 = (void *)qword_26A99A530;
  uint64_t v11 = qword_26A99A530;
  if (!qword_26A99A530)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = sub_262FF60A0;
    v7[3] = &unk_2655C3358;
    v7[4] = &v8;
    sub_262FF60A0((uint64_t)v7, a2, a3, a4);
    uint64_t v4 = (void *)v9[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v8, 8);

  return v5;
}

void sub_262FF1E18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_262FF1E30()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262FF1E64(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

uint64_t sub_262FF3074()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262FF30A8(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

uint64_t sub_262FF4154()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262FF4188(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

Class sub_262FF60A0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v9[0] = 0;
  if (!qword_26B429640)
  {
    v9[1] = (void *)MEMORY[0x263EF8330];
    v9[2] = (void *)3221225472;
    v9[3] = sub_262FF61CC;
    v9[4] = &unk_2655C3390;
    v9[5] = v9;
    long long v10 = xmmword_2655C38E0;
    uint64_t v11 = 0;
    qword_26B429640 = _sl_dlopen();
  }
  if (!qword_26B429640) {
    sub_263011600(v9, a2, a3, a4);
  }
  if (v9[0]) {
    free(v9[0]);
  }
  Class result = objc_getClass("VNObservation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_26301177C((uint64_t)result, v6, v7, v8);
  }
  qword_26A99A530 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_262FF61CC()
{
  uint64_t result = _sl_dlopen();
  qword_26B429640 = result;
  return result;
}

float64_t sub_262FF6240(float64x2_t a1, float64_t a2)
{
  a1.f64[1] = a2;
  *(float32x2_t *)&a1.f64[0] = vcvt_f32_f64(a1);
  return a1.f64[0];
}

void sub_262FF9200(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend_GPUEndTime(v2, v3, v4, v5);
  objc_msgSend_GPUStartTime(v2, v6, v7, v8);

  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
  }
}

void sub_262FF92A0(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

void sub_262FF9A2C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_262FFAFA8(unsigned int a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (a1 <= 3)
  {
    v4[0] = xmmword_2655C38F8;
    v4[1] = *(_OWORD *)off_2655C3908;
    id v1 = *((id *)v4 + a1);
    for (uint64_t i = 24; i != -8; i -= 8)
  }
  else
  {
    id v1 = 0;
  }

  return v1;
}

void sub_262FFB61C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_262FFBE38()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262FFBE6C(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

uint64_t sub_262FFC6B4()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262FFC6E8(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

void sub_262FFE830(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_263002DF0()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_263002E24(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend_status(v11, v2, v3, v4) == 4)
  {
    objc_msgSend_GPUEndTime(v11, v5, v6, v7);
    objc_msgSend_GPUStartTime(v11, v8, v9, v10);
  }
  else
  {
    objc_msgSend_status(v11, v5, v6, v7);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

uint64_t sub_263002EF4(void *a1, unint64_t a2, unint64_t a3, void *a4, int a5, int a6)
{
  id v11 = a1;
  id v12 = a4;
  double v16 = objc_msgSend_allocator(v12, v13, v14, v15);
  double v20 = objc_msgSend_newTextureDescriptor(v16, v17, v18, v19);

  if (!v20) {
    goto LABEL_14;
  }
  long long v24 = objc_msgSend_desc(v20, v21, v22, v23);
  objc_msgSend_setUsage_(v24, v25, 7, v26);

  double v30 = objc_msgSend_desc(v20, v27, v28, v29);
  objc_msgSend_setWidth_(v30, v31, a2, v32);

  id v36 = objc_msgSend_desc(v20, v33, v34, v35);
  objc_msgSend_setHeight_(v36, v37, a3, v38);

  double v42 = objc_msgSend_desc(v20, v39, v40, v41);
  objc_msgSend_setPixelFormat_(v42, v43, 25, v44);

  if (a5)
  {
    if ((FigMetalIsValid() & 1) == 0)
    {
      objc_msgSend_setLabel_(v20, v48, 0, v49);
      unint64_t v53 = objc_msgSend_allocator(v12, v50, v51, v52);
      uint64_t v56 = objc_msgSend_newTextureWithDescriptor_(v53, v54, (uint64_t)v20, v55);
      int v57 = (void *)v11[4];
      v11[4] = v56;

      if (!v11[4]) {
        goto LABEL_14;
      }
    }
    if ((FigMetalIsValid() & 1) == 0)
    {
      objc_msgSend_setLabel_(v20, v45, 0, v47);
      int v61 = objc_msgSend_allocator(v12, v58, v59, v60);
      uint64_t v64 = objc_msgSend_newTextureWithDescriptor_(v61, v62, (uint64_t)v20, v63);
      int v65 = (void *)v11[2];
      v11[2] = v64;

      if (!v11[2]) {
        goto LABEL_14;
      }
    }
  }
  int v66 = objc_msgSend_desc(v20, v45, v46, v47);
  objc_msgSend_setWidth_(v66, v67, a2 >> 1, v68);

  int v72 = objc_msgSend_desc(v20, v69, v70, v71);
  objc_msgSend_setHeight_(v72, v73, a3 >> 1, v74);

  uint64_t v78 = objc_msgSend_desc(v20, v75, v76, v77);
  objc_msgSend_setPixelFormat_(v78, v79, 65, v80);

  if (!a6) {
    goto LABEL_12;
  }
  if ((FigMetalIsValid() & 1) == 0)
  {
    objc_msgSend_setLabel_(v20, v81, 0, v82);
    uint64_t v86 = objc_msgSend_allocator(v12, v83, v84, v85);
    uint64_t v89 = objc_msgSend_newTextureWithDescriptor_(v86, v87, (uint64_t)v20, v88);
    uint64_t v90 = (void *)v11[5];
    v11[5] = v89;

    if (!v11[5]) {
      goto LABEL_14;
    }
  }
  if (FigMetalIsValid()) {
    goto LABEL_12;
  }
  objc_msgSend_setLabel_(v20, v91, 0, v92);
  double v96 = objc_msgSend_allocator(v12, v93, v94, v95);
  uint64_t v99 = objc_msgSend_newTextureWithDescriptor_(v96, v97, (uint64_t)v20, v98);
  CFDictionaryRef v100 = (void *)v11[3];
  v11[3] = v99;

  if (v11[3])
  {
LABEL_12:
    uint64_t v101 = 0;
  }
  else
  {
LABEL_14:
    FigDebugAssert3();
    uint64_t v101 = FigSignalErrorAt();
  }

  return v101;
}

void sub_263005100(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_263008090(void *a1, const char *a2, _DWORD *a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, (uint64_t)a2, a4);
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    *a3 = 25;
  }

  return v5;
}

void sub_26300A614(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_26300B6F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_26300EC34(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_26300ED20(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_26300F060(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_26301157C()
{
}

void sub_2630115A8()
{
}

void sub_2630115D4()
{
}

void sub_263011600(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_currentHandler(MEMORY[0x263F08690], a2, a3, a4);
  uint64_t v8 = objc_msgSend_stringWithUTF8String_(NSString, v6, (uint64_t)"void *VisionLibrary(void)", v7);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v9, (uint64_t)v8, @"utl_visionSoftLinking.h", 38, @"%s", *a1);

  __break(1u);
}

void sub_263011680(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_currentHandler(MEMORY[0x263F08690], a2, a3, a4);
  uint64_t v7 = objc_msgSend_stringWithUTF8String_(NSString, v5, (uint64_t)"Class getVNFaceObservationClass(void)_block_invoke", v6);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v4, v8, (uint64_t)v7, @"utl_visionSoftLinking.h", 42, @"Unable to find class %s", "VNFaceObservation");

  __break(1u);
}

void sub_2630116FC(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_currentHandler(MEMORY[0x263F08690], a2, a3, a4);
  uint64_t v8 = objc_msgSend_stringWithUTF8String_(NSString, v6, (uint64_t)"void *VisionLibrary(void)", v7);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v9, (uint64_t)v8, @"NRFProcessorV2.m", 3259, @"%s", *a1);

  __break(1u);
}

void sub_26301177C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_currentHandler(MEMORY[0x263F08690], a2, a3, a4);
  uint64_t v7 = objc_msgSend_stringWithUTF8String_(NSString, v5, (uint64_t)"Class getVNObservationClass(void)_block_invoke", v6);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v4, v8, (uint64_t)v7, @"utl_visionSoftLinking.h", 46, @"Unable to find class %s", "VNObservation");

  __break(1u);
}

void sub_2630117F8()
{
}

void sub_263011824()
{
  __assert_rtn("-[DenoiseRemixStage run:skinMask:skyMask:maskExtent:]", "DenoiseRemixStageV2.m", 722, "chroma_level >= 0");
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x270EE7188]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x270EE7278](dict, rect);
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x270EE7B30](target, key, attachmentModeOut);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x270EE7C48](sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x270EE7C78](retstr, sbuf);
}

void CVBufferPropagateAttachments(CVBufferRef sourceBuffer, CVBufferRef destinationBuffer)
{
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA150](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA170](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x270EEA190](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1B0](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1C8](pixelBuffer, planeIndex);
}

void CVPixelBufferGetExtendedPixels(CVPixelBufferRef pixelBuffer, size_t *extraColumnsOnLeft, size_t *extraColumnsOnRight, size_t *extraRowsOnTop, size_t *extraRowsOnBottom)
{
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1F8](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x270EEA200](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA218](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA220](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA250](pixelBuffer, planeIndex);
}

Boolean CVPixelBufferIsPlanar(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA258](pixelBuffer);
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

uint64_t CreatePixelBuffer()
{
  return MEMORY[0x270F12DB8]();
}

uint64_t CreatePixelBufferWithWiringAssertion()
{
  return MEMORY[0x270F12DC8]();
}

uint64_t FigCFDictionaryGetCGRectIfPresent()
{
  return MEMORY[0x270EE8038]();
}

uint64_t FigCaptureCFCreatePropertyList()
{
  return MEMORY[0x270F12C40]();
}

uint64_t FigCaptureGetModelSpecificName()
{
  return MEMORY[0x270F12C68]();
}

uint64_t FigCapturePlatformChipRevisionIdentifier()
{
  return MEMORY[0x270F12CA8]();
}

uint64_t FigCapturePlatformIdentifier()
{
  return MEMORY[0x270F12CC0]();
}

uint64_t FigCapturePlatformIdentifierString()
{
  return MEMORY[0x270F12CC8]();
}

uint64_t FigCapturePlatformSupportsUniversalLossyCompression()
{
  return MEMORY[0x270F12CD0]();
}

uint64_t FigDebugAssert3()
{
  return MEMORY[0x270EE8178]();
}

uint64_t FigDispatchQueueCreateTargetingPThreadRootQueueWithPriority()
{
  return MEMORY[0x270EE8198]();
}

uint64_t FigGetCFPreferenceNumberWithDefault()
{
  return MEMORY[0x270EE8248]();
}

uint64_t FigMetalDecRef()
{
  return MEMORY[0x270F12DE0]();
}

uint64_t FigMetalIncRef()
{
  return MEMORY[0x270F12DF0]();
}

uint64_t FigMetalIsValid()
{
  return MEMORY[0x270F12DF8]();
}

uint64_t FigMotionComputeBlurScores()
{
  return MEMORY[0x270F12D40]();
}

uint64_t FigNote_AllowInternalDefaultLogs()
{
  return MEMORY[0x270EE82F8]();
}

uint64_t FigOSTransactionCreate()
{
  return MEMORY[0x270EE8310]();
}

uint64_t FigSignalErrorAt()
{
  return MEMORY[0x270EE8378]();
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x270EF4C28](properties);
}

void *__cdecl IOSurfaceGetBaseAddressOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return (void *)MEMORY[0x270EF4C80](buffer, planeIndex);
}

uint64_t IOSurfaceGetBulkAttachments()
{
  return MEMORY[0x270EF4C90]();
}

uint64_t IOSurfaceGetCompressionFootprintOfPlane()
{
  return MEMORY[0x270EF4CF0]();
}

uint64_t IOSurfaceGetCompressionTypeOfPlane()
{
  return MEMORY[0x270EF4CF8]();
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D48](buffer);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D68](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4DE0](buffer);
}

uint64_t IOSurfaceSetBulkAttachments2()
{
  return MEMORY[0x270EF4E40]();
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return MEMORY[0x270EF5EE0]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t WritePixelBufferToFile()
{
  return MEMORY[0x270F12E00]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

float __exp10f(float a1)
{
  MEMORY[0x270ED7DD0](a1);
  return result;
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  MEMORY[0x270ED7E18]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  MEMORY[0x270ED7E20]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
  result.columns[3].i64[1] = v8;
  result.columns[3].i64[0] = v7;
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x270ED80B0]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9278](flags, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x270F27EE0]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x270F27F08]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x270F27F20]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x270F27F78]();
}

uint64_t espresso_network_bind_direct_cvpixelbuffer()
{
  return MEMORY[0x270F27FA0]();
}

uint64_t espresso_network_get_version()
{
  return MEMORY[0x270F28020]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x270F28068]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x270F28070]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x270F28090]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x270F280A0]();
}

uint64_t espresso_plan_get_error_info()
{
  return MEMORY[0x270F280A8]();
}

uint64_t espresso_plan_submit()
{
  return MEMORY[0x270F280C8]();
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

long double exp2(long double __x)
{
  MEMORY[0x270ED9860](__x);
  return result;
}

float exp2f(float a1)
{
  MEMORY[0x270ED9868](a1);
  return result;
}

uint64_t fig_log_call_emit_and_clean_up_after_send_and_compose()
{
  return MEMORY[0x270EE84B8]();
}

uint64_t fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type()
{
  return MEMORY[0x270EE84C0]();
}

uint64_t fig_log_get_emitter()
{
  return MEMORY[0x270EE84C8]();
}

uint64_t fig_note_initialize_category_with_default_work_cf()
{
  return MEMORY[0x270EE84D8]();
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

kern_return_t host_page_size(host_t a1, vm_size_t *a2)
{
  return MEMORY[0x270ED9E20](*(void *)&a1, a2);
}

kern_return_t host_statistics(host_t host_priv, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return MEMORY[0x270ED9E40](*(void *)&host_priv, *(void *)&flavor, host_info_out, host_info_outCnt);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

float ldexpf(float a1, int a2)
{
  MEMORY[0x270EDA030](*(void *)&a2, a1);
  return result;
}

uint64_t loadDefaultsWritesWithPrefix()
{
  return MEMORY[0x270F12D60]();
}

long double log2(long double __x)
{
  MEMORY[0x270EDA0D8](__x);
  return result;
}

float log2f(float a1)
{
  MEMORY[0x270EDA0E0](a1);
  return result;
}

float logf(float a1)
{
  MEMORY[0x270EDA0F8](a1);
  return result;
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x270EDA178]();
}

uint64_t makeChromaROI()
{
  return MEMORY[0x270F12D68]();
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

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
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

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t portIndexFromPortType()
{
  return MEMORY[0x270F12D90]();
}

float powf(float a1, float a2)
{
  MEMORY[0x270EDAD00](a1, a2);
  return result;
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x270EDB868](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}