double sub_263533E78(double a1)
{
  return fmax(fmin(a1, 1.0), 0.0);
}

double sub_263533E8C(float64x2_t *a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, float64x2_t a5)
{
  a4.f64[0] = a2.f64[0] + a4.f64[0];
  a5.f64[0] = a3.f64[0] + a5.f64[0];
  return fmin(vdivq_f64(vaddq_f64(a1[4], vmlaq_n_f64(vmulq_n_f64(*a1, a2.f64[0]), a1[2], a3.f64[0])), (float64x2_t)vdupq_lane_s64(*(_OWORD *)&vaddq_f64(a1[5], vmlaq_f64(vmulq_f64(a2, a1[1]), a3, a1[3])), 0)).f64[0], vdivq_f64(vaddq_f64(a1[4], vmlaq_n_f64(vmulq_n_f64(*a1, a4.f64[0]), a1[2], a5.f64[0])), (float64x2_t)vdupq_lane_s64(*(_OWORD *)&vaddq_f64(a1[5], vmlaq_f64(vmulq_f64(a4, a1[1]), a5, a1[3])), 0)).f64[0]);
}

__n128 sub_263533EFC@<Q0>(int a1@<W0>, _OWORD *a2@<X8>, __n128 result@<Q0>, double a4@<D1>, double a5@<D2>, double a6@<D3>, double a7@<D4>, double a8@<D5>)
{
  long long v8 = 0uLL;
  a2[4] = 0u;
  a2[5] = 0u;
  a2[2] = 0u;
  a2[3] = 0u;
  *a2 = 0u;
  a2[1] = 0u;
  switch(a1)
  {
    case 1:
      *a2 = result.n128_u64[0];
      a2[1] = 0uLL;
      a2[3] = 0uLL;
      *((double *)&v8 + 1) = a4;
      a2[2] = v8;
      double v9 = a5 - a7 * result.n128_f64[0];
      double v10 = -a8;
      goto LABEL_6;
    case 3:
      *(void *)&long long v11 = 0;
      *a2 = COERCE_UNSIGNED_INT64(-result.n128_f64[0]);
      a2[1] = 0u;
      a2[3] = 0u;
      *((double *)&v11 + 1) = -a4;
      a2[2] = v11;
      double v9 = a5 + a7 * result.n128_f64[0];
      double v10 = a8;
      goto LABEL_6;
    case 6:
      *(void *)&long long v12 = 0;
      *((double *)&v12 + 1) = a4;
      *a2 = v12;
      a2[1] = 0uLL;
      a2[3] = 0uLL;
      *(double *)&long long v8 = -result.n128_f64[0];
      a2[2] = v8;
      double v9 = a5 + a8 * result.n128_f64[0];
      double v10 = -a7;
      goto LABEL_6;
    case 8:
      *(void *)&long long v13 = 0;
      *((double *)&v13 + 1) = -a4;
      *a2 = v13;
      a2[1] = 0u;
      a2[3] = 0u;
      a2[2] = result.n128_u64[0];
      double v9 = a5 - a8 * result.n128_f64[0];
      double v10 = a7;
LABEL_6:
      result.n128_f64[0] = v9 + a7;
      result.n128_f64[1] = a6 + v10 * a4 + a8;
      __asm { FMOV            V1.2D, #1.0 }
      a2[4] = result;
      a2[5] = _Q1;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2635341F8()
{
  v0 = [SDOFResources alloc];
  qword_26B431268 = objc_msgSend_initInstance(v0, v1, v2, v3);

  return MEMORY[0x270F9A758]();
}

void sub_263535FA4(uint64_t a1@<X0>, int a2@<W1>, float64x2_t *a3@<X2>, float64x2_t *a4@<X8>, float64_t a5@<D0>, float64_t a6@<D1>, float64_t a7@<D2>, float64_t a8@<D3>, double a9@<D4>, double a10@<D5>, uint64_t a11, uint64_t a12, float64x2_t a13, float64x2_t a14, float64x2_t a15, float64x2_t a16, float64x2_t a17, float64x2_t a18, float64x2_t a19, float64x2_t a20,float64x2_t a21,float64x2_t a22,float64x2_t a23,float64x2_t a24)
{
  v25.n128_u64[1] = 0;
  a4[4] = 0u;
  a4[5] = 0u;
  a4[2] = 0u;
  a4[3] = 0u;
  *a4 = 0u;
  a4[1] = 0u;
  if (a1)
  {
    v25.n128_f64[0] = a9;
    sub_263533EFC(a2, a4, v25, a10, 0.0, 0.0, 0.5, 0.5);
    float64x2_t v31 = a4[3];
    a21 = a4[2];
    a22 = v31;
    float64x2_t v32 = a4[5];
    a23 = a4[4];
    a24 = v32;
    float64x2_t v34 = a4[1];
    a19 = *a4;
    v33.f64[1] = a19.f64[1];
    a20 = v34;
    v33.f64[0] = a5;
    v34.f64[0] = a6;
    v35.f64[0] = a7;
    v36.f64[0] = a8;
    double v37 = -sub_263533E8C(&a19, v33, v34, v35, v36);
    a17 = 0u;
    a18 = 0u;
    a15 = 0u;
    a16 = 0u;
    a13 = 0u;
    a14 = 0u;
    sub_263533EFC(1, &a13, (__n128)COERCE_UNSIGNED_INT64(1.0), 1.0, v37, -v38, 0.5, 0.5);
    uint64_t v39 = 0;
    float64x2_t v46 = a13;
    float64x2_t v40 = a14;
    float64x2_t v47 = a15;
    float64x2_t v41 = a16;
    float64x2_t v48 = a17;
    float64x2_t v42 = a18;
    float64x2_t v43 = a4[3];
    float64x2_t v62 = a4[2];
    float64x2_t v63 = v43;
    float64x2_t v44 = a4[5];
    float64x2_t vars0 = a4[4];
    float64x2_t v65 = v44;
    float64x2_t v45 = a4[1];
    float64x2_t v60 = *a4;
    float64x2_t v61 = v45;
    a19 = 0u;
    a20 = 0u;
    a21 = 0u;
    a22 = 0u;
    a23 = 0u;
    a24 = 0u;
    *(void *)&v46.f64[1] = vextq_s8((int8x16_t)v46, (int8x16_t)v46, 8uLL).u64[0];
    *(void *)&v47.f64[1] = vextq_s8((int8x16_t)v47, (int8x16_t)v47, 8uLL).u64[0];
    *(void *)&v48.f64[1] = vextq_s8((int8x16_t)v48, (int8x16_t)v48, 8uLL).u64[0];
    do
    {
      float64x2_t v50 = *(float64x2_t *)((char *)&v60 + v39);
      float64x2_t v49 = *(float64x2_t *)((char *)&v60 + v39 + 16);
      v51 = (float64x2_t *)((char *)&a19 + v39);
      float64x2_t *v51 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v46, v50.f64[0]), v47, v50, 1), v48, v49.f64[0]);
      v51[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v40, v50), v41, v50, 1), v49, v42);
      v39 += 32;
    }
    while (v39 != 96);
    float64x2_t v52 = a22;
    a4[2] = a21;
    a4[3] = v52;
    float64x2_t v53 = a24;
    a4[4] = a23;
    a4[5] = v53;
    float64x2_t v54 = a20;
    *a4 = a19;
    a4[1] = v54;
    if (a3)
    {
      float64x2_t v55 = a4[3];
      a21 = a4[2];
      a22 = v55;
      float64x2_t v56 = a4[5];
      a23 = a4[4];
      a24 = v56;
      float64x2_t v57 = a4[1];
      a19 = *a4;
      a20 = v57;
      __invert_d3();
      float64x2_t v58 = v63;
      a3[2] = v62;
      a3[3] = v58;
      a3[4] = vars0;
      a3[5] = v65;
      float64x2_t v59 = v61;
      *a3 = v60;
      a3[1] = v59;
    }
  }
}

uint64_t sub_263536834(uint64_t a1, __int16 *a2, __int16 *a3)
{
  return (*a2 - *a3);
}

BOOL sub_263537014(void *a1, uint64_t a2, _DWORD *a3)
{
  BOOL result = 0;
  if (a1 && a2 && a3)
  {
    v7 = NSString;
    id v8 = a1;
    objc_msgSend_stringWithUTF8String_(v7, v9, a2, v10);
    int Int32IfPresent = FigCFDictionaryGetInt32IfPresent();

    BOOL result = Int32IfPresent != 0;
    if (Int32IfPresent) {
      *a3 = 0;
    }
  }
  return result;
}

float sub_2635370AC(void *a1, uint64_t a2, _DWORD *a3)
{
  if (a1 && a2 && a3)
  {
    v5 = NSString;
    id v6 = a1;
    objc_msgSend_stringWithUTF8String_(v5, v7, a2, v8);
    int Float32IfPresent = FigCFDictionaryGetFloat32IfPresent();

    if (Float32IfPresent)
    {
      float result = 0.0;
      *a3 = 0;
    }
  }
  return result;
}

uint64_t sub_26353728C(void *a1, uint64_t a2, _OWORD *a3)
{
  id v7 = a1;
  if (!a2) {
    goto LABEL_13;
  }
  if (!a3) {
    goto LABEL_13;
  }
  objc_msgSend_stringWithFormat_(NSString, v5, @"%s.brightLightExposureLevel", v6, a2);
  if (!FigCFDictionaryGetFloat32IfPresent()) {
    goto LABEL_13;
  }
  objc_msgSend_stringWithFormat_(NSString, v8, @"%s.lowLightExposureLevel", v9, a2);
  if (FigCFDictionaryGetFloat32IfPresent()
    && (objc_msgSend_stringWithFormat_(NSString, v10, @"%s.nearSubjectDistanceRatio", v11, a2),
        FigCFDictionaryGetFloat32IfPresent())
    && (objc_msgSend_stringWithFormat_(NSString, v12, @"%s.farSubjectDistanceRatio", v13, a2),
        FigCFDictionaryGetFloat32IfPresent())
    && (objc_msgSend_stringWithFormat_(NSString, v14, @"%s.brightLightNearValue", v15, a2),
        FigCFDictionaryGetFloat32IfPresent())
    && (objc_msgSend_stringWithFormat_(NSString, v16, @"%s.brightLightFarValue", v17, a2),
        FigCFDictionaryGetFloat32IfPresent())
    && (objc_msgSend_stringWithFormat_(NSString, v18, @"%s.lowLightNearValue", v19, a2),
        FigCFDictionaryGetFloat32IfPresent())
    && (objc_msgSend_stringWithFormat_(NSString, v20, @"%s.lowLightFarValue", v21, a2),
        FigCFDictionaryGetFloat32IfPresent()))
  {
    *a3 = 0u;
    a3[1] = 0u;
    uint64_t v22 = 1;
  }
  else
  {
LABEL_13:
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v22 = 0;
  }

  return v22;
}

double sub_26353BBAC@<D0>(_OWORD *a1@<X8>)
{
  a1[10] = xmmword_263544960;
  a1[11] = unk_263544970;
  *(_OWORD *)((char *)a1 + 188) = unk_26354497C;
  a1[6] = xmmword_263544920;
  a1[7] = unk_263544930;
  a1[8] = xmmword_263544940;
  a1[9] = unk_263544950;
  a1[2] = xmmword_2635448E0;
  a1[3] = unk_2635448F0;
  a1[4] = xmmword_263544900;
  a1[5] = unk_263544910;
  double result = dbl_2635448D0[0];
  *a1 = xmmword_2635448C0;
  a1[1] = *(_OWORD *)dbl_2635448D0;
  return result;
}

double sub_26353BBF0@<D0>(_OWORD *a1@<X8>)
{
  a1[2] = xmmword_2635449B8;
  a1[3] = unk_2635449C8;
  a1[4] = xmmword_2635449D8;
  double result = dbl_2635449A8[0];
  *a1 = xmmword_263544998;
  a1[1] = *(_OWORD *)dbl_2635449A8;
  return result;
}

uint64_t sub_26353C4A8()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_26353C4DC(uint64_t a1, void *a2)
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

id sub_26353D270()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_26B431258;
  uint64_t v7 = qword_26B431258;
  if (!qword_26B431258)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = sub_2635419A4;
    v3[3] = &unk_2655D0698;
    v3[4] = &v4;
    sub_2635419A4((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_26353D33C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_26353E074(__CVBuffer *a1)
{
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  uint64_t v2 = 1;
  if (PixelFormatType <= 792225327)
  {
    if (PixelFormatType == 641230384) {
      return v2;
    }
    int v3 = 758670896;
  }
  else
  {
    if (PixelFormatType == 792225328 || PixelFormatType == 875704422) {
      return v2;
    }
    int v3 = 2084070960;
  }
  if (PixelFormatType != v3)
  {
    uint64_t v4 = CVPixelBufferGetAttributes();
    uint64_t v7 = v4;
    if (v4)
    {
      uint64_t v2 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"PixelFormatDescription", v6);
      if (!v2)
      {
LABEL_13:

        return v2;
      }
      uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v7, v8, @"PixelFormatDescription", v9);
      uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v10, v11, @"EquivalentUncompressedPixelFormat", v12);

      if (v13)
      {
        v16 = objc_msgSend_objectForKeyedSubscript_(v7, v14, @"PixelFormatDescription", v15);
        uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v16, v17, @"EquivalentUncompressedPixelFormat", v18);
        int v23 = objc_msgSend_unsignedIntValue(v19, v20, v21, v22);

        uint64_t v2 = v23 == 875704422;
        goto LABEL_13;
      }
    }
    uint64_t v2 = 0;
    goto LABEL_13;
  }
  return v2;
}

void sub_26353F7FC(_Unwind_Exception *a1)
{
}

void sub_26353FE84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_263541724(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

id sub_26354173C()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_26A99E520;
  uint64_t v7 = qword_26A99E520;
  if (!qword_26A99E520)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = sub_263541C74;
    v3[3] = &unk_2655D0698;
    v3[4] = &v4;
    sub_263541C74((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_263541808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_2635419A4(uint64_t a1)
{
  sub_2635419FC();
  Class result = objc_getClass("CCMakeBlurMap");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_263543A80();
  }
  qword_26B431258 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_2635419FC()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!qword_26B431248)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = sub_263541AF8;
    v1[4] = &unk_2655D06B8;
    v1[5] = v1;
    long long v2 = xmmword_2655D0738;
    uint64_t v3 = 0;
    qword_26B431248 = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!qword_26B431248)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_263541AF8()
{
  uint64_t result = _sl_dlopen();
  qword_26B431248 = result;
  return result;
}

Class sub_263541B6C(uint64_t a1)
{
  sub_2635419FC();
  Class result = objc_getClass("CCFacePoints");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_263543AA8();
  }
  qword_26A99E510 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_263541BC4(uint64_t a1)
{
  sub_2635419FC();
  Class result = objc_getClass("CCMakeBlurMapArgs");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_263543AD0();
  }
  qword_26A99E518 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_263541C1C(uint64_t a1)
{
  sub_2635419FC();
  Class result = objc_getClass("CCApplyBlurMap");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_263543AF8();
  }
  qword_26B431250 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_263541C74(uint64_t a1)
{
  sub_2635419FC();
  Class result = objc_getClass("CCSDOFMetadata");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_263543B20();
  }
  qword_26A99E520 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_263541CCC(uint64_t a1)
{
  sub_2635419FC();
  Class result = objc_getClass("CCApplyBlurMapArgs");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_263543B48();
  }
  qword_26A99E528 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

BOOL sub_263541D24(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, *MEMORY[0x263F2C5E8], a4);
  uint64_t v9 = v5;
  if (v5) {
    *(_DWORD *)a2 = objc_msgSend_intValue(v5, v6, v7, v8);
  }

  return v9 != 0;
}

uint64_t sub_263541D7C(int a1, _DWORD *a2)
{
  if (a2) {
    BOOL v2 = (a1 - 1) >= 8;
  }
  else {
    BOOL v2 = 1;
  }
  uint64_t v3 = !v2;
  if (v3 == 1) {
    *a2 = a1;
  }
  return v3;
}

BOOL sub_263541DA0(void *a1, unsigned int a2, int a3, uint64_t a4, int *a5)
{
  id v7 = a1;
  uint64_t v11 = objc_msgSend_count(v7, v8, v9, v10);
  uint64_t v14 = v11;
  int v129 = a3;
  if ((int)v11 > a3)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    v126 = a5;
    *a5 = 0;
    if (v11)
    {
      uint64_t v15 = 0;
      do
      {
        v16 = objc_msgSend_objectAtIndexedSubscript_(v7, v12, v15, v13);
        v20 = objc_msgSend_landmarks(v16, v17, v18, v19);
        v24 = objc_msgSend_leftEye(v20, v21, v22, v23);

        v28 = objc_msgSend_landmarks(v16, v25, v26, v27);
        float64x2_t v32 = objc_msgSend_rightEye(v28, v29, v30, v31);

        float64x2_t v36 = objc_msgSend_landmarks(v16, v33, v34, v35);
        float64x2_t v40 = objc_msgSend_nose(v36, v37, v38, v39);

        float64x2_t v44 = objc_msgSend_landmarks(v16, v41, v42, v43);
        float64x2_t v48 = objc_msgSend_allPoints(v44, v45, v46, v47);

        if (v24)
        {
          if (v32)
          {
            if (v40)
            {
              if (objc_msgSend_pointCount(v24, v49, v50, v51))
              {
                if (objc_msgSend_pointCount(v32, v52, v53, v54))
                {
                  if (objc_msgSend_pointCount(v40, v55, v56, v57))
                  {
                    if (objc_msgSend_pointCount(v48, v58, v59, v60) == 65)
                    {
                      id v61 = v24;
                      if (objc_msgSend_normalizedPoints(v61, v62, v63, v64))
                      {
                        id v125 = v32;
                        if (objc_msgSend_normalizedPoints(v125, v65, v66, v67))
                        {
                          id v124 = v40;
                          if (objc_msgSend_normalizedPoints(v124, v68, v69, v70))
                          {
                            id v71 = v48;
                            if (objc_msgSend_normalizedPoints(v71, v72, v73, v74))
                            {
                              id v123 = v71;
                              v131.f64[0] = 0.0;
                              objc_msgSend_boundingBox(v16, v75, v76, v77);
                              v130[0] = v78;
                              v130[1] = v79;
                              v130[2] = v80;
                              v130[3] = v81;
                              id v82 = v61;
                              v86 = (float64x2_t *)objc_msgSend_normalizedPoints(v82, v83, v84, v85);
                              int v90 = objc_msgSend_pointCount(v82, v87, v88, v89);
                              float64x2_t v91 = 0uLL;
                              if (v90 >= 1)
                              {
                                uint64_t v92 = v90;
                                do
                                {
                                  float64x2_t v93 = *v86++;
                                  float64x2_t v91 = vaddq_f64(v91, v93);
                                  --v92;
                                }
                                while (v92);
                              }
                              float64x2_t v131 = vdivq_f64(v91, (float64x2_t)vdupq_lane_s64(COERCE__INT64((float)v90), 0));
                              sub_263542184(a2, v131.f64, v130, (double *)(a4 + ((uint64_t)*v126 << 6) + 16));
                              id v94 = v125;
                              v98 = (float64x2_t *)objc_msgSend_normalizedPoints(v94, v95, v96, v97);
                              int v102 = objc_msgSend_pointCount(v94, v99, v100, v101);
                              float64x2_t v103 = 0uLL;
                              if (v102 >= 1)
                              {
                                uint64_t v104 = v102;
                                do
                                {
                                  float64x2_t v105 = *v98++;
                                  float64x2_t v103 = vaddq_f64(v103, v105);
                                  --v104;
                                }
                                while (v104);
                              }
                              float64x2_t v131 = vdivq_f64(v103, (float64x2_t)vdupq_lane_s64(COERCE__INT64((float)v102), 0));
                              sub_263542184(a2, v131.f64, v130, (double *)(a4 + ((uint64_t)*v126 << 6) + 32));
                              id v106 = v124;
                              v110 = (float64x2_t *)objc_msgSend_normalizedPoints(v106, v107, v108, v109);
                              int v114 = objc_msgSend_pointCount(v106, v111, v112, v113);
                              if (v114 < 1)
                              {
                                float64x2_t v116 = 0uLL;
                              }
                              else
                              {
                                uint64_t v115 = v114;
                                float64x2_t v116 = 0uLL;
                                do
                                {
                                  float64x2_t v117 = *v110++;
                                  float64x2_t v116 = vaddq_f64(v116, v117);
                                  --v115;
                                }
                                while (v115);
                              }
                              float64x2_t v131 = vdivq_f64(v116, (float64x2_t)vdupq_lane_s64(COERCE__INT64((float)v114), 0));
                              sub_263542184(a2, v131.f64, v130, (double *)(a4 + ((uint64_t)*v126 << 6)));
                              id v118 = v123;
                              float64x2_t v131 = *(float64x2_t *)(objc_msgSend_normalizedPoints(v118, v119, v120, v121) + 736);
                              sub_263542184(a2, v131.f64, v130, (double *)(a4 + ((uint64_t)*v126 << 6) + 48));
                              ++*v126;
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

        ++v15;
      }
      while (v15 != v14);
    }
  }

  return (int)v14 <= v129;
}

uint64_t sub_263542184(uint64_t result, double *a2, double *a3, double *a4)
{
  double v4 = *a3 + *a2 * a3[2];
  double v5 = 1.0 - (a3[1] + a2[1] * a3[3]);
  *a4 = v4;
  a4[1] = v5;
  switch((int)result)
  {
    case 2:
      *a4 = 1.0 - v4;
      return result;
    case 3:
      *a4 = 1.0 - v4;
      a4[1] = 1.0 - v5;
      return result;
    case 4:
      a4[1] = 1.0 - v5;
      return result;
    case 5:
      float v6 = v4;
      goto LABEL_10;
    case 6:
      float v7 = v4;
      goto LABEL_8;
    case 7:
      float v7 = v4;
      double v5 = 1.0 - v5;
LABEL_8:
      float v6 = 1.0 - v7;
      goto LABEL_10;
    case 8:
      float v6 = v4;
      double v5 = 1.0 - v5;
LABEL_10:
      *a4 = v5;
      a4[1] = v6;
      break;
    default:
      return result;
  }
  return result;
}

int32x4_t sub_263542254@<Q0>(uint64_t a1@<X8>, int32x2_t a2@<D0>)
{
  *(_DWORD *)a1 = 0;
  *(void *)(a1 + 4) = 1065353216;
  *(_DWORD *)(a1 + 12) = 1065353216;
  int32x4_t result = vdupq_lane_s32(a2, 0);
  *(int32x4_t *)(a1 + 16) = result;
  return result;
}

float sub_263542278(float *a1, float *a2)
{
  if (a1 && a2)
  {
    float v2 = a1[1] - *a1;
    float v3 = 0.0;
    float v4 = 0.0;
    if (v2 != 0.0) {
      float v4 = fminf(fmaxf((float)(*a2 - *a1) / v2, 0.0), 1.0);
    }
    float v5 = a1[2];
    float v6 = a1[3] - v5;
    if (v6 != 0.0) {
      float v3 = fminf(fmaxf((float)(a2[1] - v5) / v6, 0.0), 1.0);
    }
    return (float)((float)((float)((float)(v4 * (float)(1.0 - v3)) * a1[6]) + (float)((float)(v4 * v3) * a1[7]))
                 + (float)((float)((float)(1.0 - v4) * v3) * a1[5]))
         + (float)((float)((float)(1.0 - v4) * (float)(1.0 - v3)) * a1[4]);
  }
  else
  {
    FigDebugAssert3();
    return NAN;
  }
}

double sub_2635423C4@<D0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 + 16) = 1053609165;
  double result = 4.62592898e-18;
  *(_OWORD *)a1 = xmmword_2635449F0;
  return result;
}

double sub_2635423E4@<D0>(_OWORD *a1@<X8>)
{
  *a1 = xmmword_263544A04;
  a1[1] = *(_OWORD *)algn_263544A14;
  double result = 9.68038197e-22;
  a1[2] = xmmword_263544A24;
  a1[3] = unk_263544A34;
  return result;
}

double sub_263542400@<D0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 + 32) = 0;
  double result = 4915.20021;
  *(_OWORD *)a1 = xmmword_263544A44;
  *(_OWORD *)(a1 + 16) = unk_263544A54;
  return result;
}

uint64_t sub_263543138()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_26354316C(uint64_t a1, void *a2)
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

uint64_t sub_2635434C4()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_2635434F8(uint64_t a1, void *a2)
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

void sub_263543A80()
{
  uint64_t v0 = abort_report_np();
  sub_263543AA8(v0);
}

void sub_263543AA8()
{
  uint64_t v0 = abort_report_np();
  sub_263543AD0(v0);
}

void sub_263543AD0()
{
  uint64_t v0 = abort_report_np();
  sub_263543AF8(v0);
}

void sub_263543AF8()
{
  uint64_t v0 = abort_report_np();
  sub_263543B20(v0);
}

void sub_263543B20()
{
  uint64_t v0 = abort_report_np();
  sub_263543B48(v0);
}

void sub_263543B48()
{
  CFDictionaryRef v0 = (const __CFDictionary *)abort_report_np();
  CFDictionaryGetValue(v0, v1);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

CFDictionaryRef CGPointCreateDictionaryRepresentation(CGPoint point)
{
  return (CFDictionaryRef)MEMORY[0x270EE7150]((__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x270EE7278](dict, rect);
}

BOOL CGSizeMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGSize *size)
{
  return MEMORY[0x270EE7350](dict, size);
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x270EE7B30](target, key, attachmentModeOut);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x270EE7C48](sbuf);
}

void CMSetAttachment(CMAttachmentBearerRef target, CFStringRef key, CFTypeRef value, CMAttachmentMode attachmentMode)
{
}

uint64_t CVPixelBufferGetAttributes()
{
  return MEMORY[0x270EEA188]();
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA218](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

uint64_t CreatePixelBuffer()
{
  return MEMORY[0x270F12DB8]();
}

uint64_t FigCFDictionaryGetFloat32IfPresent()
{
  return MEMORY[0x270EE8060]();
}

uint64_t FigCFDictionaryGetInt32IfPresent()
{
  return MEMORY[0x270EE8068]();
}

uint64_t FigCFNumberGetFloat32()
{
  return MEMORY[0x270EE80F8]();
}

uint64_t FigCFNumberGetSInt32()
{
  return MEMORY[0x270EE8100]();
}

uint64_t FigDebugAssert3()
{
  return MEMORY[0x270EE8178]();
}

uint64_t FigGetCFPreferenceNumberWithDefault()
{
  return MEMORY[0x270EE8248]();
}

uint64_t FigSignalErrorAt()
{
  return MEMORY[0x270EE8378]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __invert_d3()
{
  return MEMORY[0x270ED7E00]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t fig_log_get_emitter()
{
  return MEMORY[0x270EE84C8]();
}

void free(void *a1)
{
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
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

void objc_storeStrong(id *location, id obj)
{
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x270EDB158](__ptr, __size);
}