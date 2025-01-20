void sub_2FB8(id a1, MTLCommandBuffer *a2)
{
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
}

void sub_2FEC(id a1, MTLCommandBuffer *a2)
{
  v2 = a2;
  if ([(MTLCommandBuffer *)v2 status] == &dword_4)
  {
    [(MTLCommandBuffer *)v2 GPUEndTime];
    [(MTLCommandBuffer *)v2 GPUStartTime];
  }
  else
  {
    [(MTLCommandBuffer *)v2 status];
  }
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
}

void sub_5AF8(id a1, MTLCommandBuffer *a2)
{
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
}

void sub_5B2C(id a1, MTLCommandBuffer *a2)
{
  v2 = a2;
  if ([(MTLCommandBuffer *)v2 status] == &dword_4)
  {
    [(MTLCommandBuffer *)v2 GPUEndTime];
    [(MTLCommandBuffer *)v2 GPUStartTime];
  }
  else
  {
    [(MTLCommandBuffer *)v2 status];
  }
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
}

void sub_60C8(id a1, MTLCommandBuffer *a2)
{
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
}

void sub_60FC(id a1, MTLCommandBuffer *a2)
{
  v2 = a2;
  if ([(MTLCommandBuffer *)v2 status] == &dword_4)
  {
    [(MTLCommandBuffer *)v2 GPUEndTime];
    [(MTLCommandBuffer *)v2 GPUStartTime];
  }
  else
  {
    [(MTLCommandBuffer *)v2 status];
  }
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
}

void sub_933C(id a1, MTLCommandBuffer *a2)
{
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
}

void sub_9370(id a1, MTLCommandBuffer *a2)
{
  v2 = a2;
  if ([(MTLCommandBuffer *)v2 status] == &dword_4)
  {
    [(MTLCommandBuffer *)v2 GPUEndTime];
    [(MTLCommandBuffer *)v2 GPUStartTime];
  }
  else
  {
    [(MTLCommandBuffer *)v2 status];
  }
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
}

void sub_9A10(id a1, MTLCommandBuffer *a2)
{
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
}

void sub_9A44(id a1, MTLCommandBuffer *a2)
{
  v2 = a2;
  if ([(MTLCommandBuffer *)v2 status] == &dword_4)
  {
    [(MTLCommandBuffer *)v2 GPUEndTime];
    [(MTLCommandBuffer *)v2 GPUStartTime];
  }
  else
  {
    [(MTLCommandBuffer *)v2 status];
  }
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
}

void sub_A0AC(id a1, MTLCommandBuffer *a2)
{
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
}

void sub_A0E0(id a1, MTLCommandBuffer *a2)
{
  v2 = a2;
  if ([(MTLCommandBuffer *)v2 status] == &dword_4)
  {
    [(MTLCommandBuffer *)v2 GPUEndTime];
    [(MTLCommandBuffer *)v2 GPUStartTime];
  }
  else
  {
    [(MTLCommandBuffer *)v2 status];
  }
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
}

void sub_A864(id a1, MTLCommandBuffer *a2)
{
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
}

void sub_A898(id a1, MTLCommandBuffer *a2)
{
  v2 = a2;
  if ([(MTLCommandBuffer *)v2 status] == &dword_4)
  {
    [(MTLCommandBuffer *)v2 GPUEndTime];
    [(MTLCommandBuffer *)v2 GPUStartTime];
  }
  else
  {
    [(MTLCommandBuffer *)v2 status];
  }
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
}

void sub_AC1C(id a1, MTLCommandBuffer *a2)
{
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
}

void sub_AC50(id a1, MTLCommandBuffer *a2)
{
  v2 = a2;
  if ([(MTLCommandBuffer *)v2 status] == &dword_4)
  {
    [(MTLCommandBuffer *)v2 GPUEndTime];
    [(MTLCommandBuffer *)v2 GPUStartTime];
  }
  else
  {
    [(MTLCommandBuffer *)v2 status];
  }
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
}

void sub_C064(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 status] == &dword_4)
  {
    [v2 GPUEndTime];
    [v2 GPUStartTime];
  }
  else
  {
    [v2 status];
  }
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
}

uint64_t sub_DACC(void *a1, float *a2, double *a3, double *a4, double a5, double a6)
{
  id v11 = a1;
  CGPoint origin = CGRectNull.origin;
  *(CGPoint *)v90 = CGRectNull.origin;
  CGSize size = CGRectNull.size;
  *(CGSize *)&v90[16] = size;
  FigCFDictionaryGetCGRectIfPresent();
  v94.CGPoint origin = *(CGPoint *)v90;
  v94.CGSize size = size;
  if (CGRectIsEmpty(v94)) {
    goto LABEL_60;
  }
  uint64_t v12 = kFigCaptureStreamMetadata_RawSensorWidth;
  v13 = [v11 objectForKeyedSubscript:kFigCaptureStreamMetadata_RawSensorWidth];
  int v14 = [v13 intValue];

  uint64_t v15 = kFigCaptureStreamMetadata_RawSensorHeight;
  v16 = [v11 objectForKeyedSubscript:kFigCaptureStreamMetadata_RawSensorHeight];
  int v17 = [v16 intValue];

  if (v14 < 1 || v17 < 1) {
    goto LABEL_60;
  }
  v85 = a2;
  id v19 = v11;
  if (!v19
    || (v91.CGPoint origin = origin,
        v91.CGSize size = size,
        FigCFDictionaryGetCGRectIfPresent(),
        v95.CGPoint origin = origin,
        v95.CGSize size = size,
        CGRectIsEmpty(v95)))
  {
    id v24 = 0;
LABEL_59:

LABEL_60:
    uint64_t v83 = 0;
    goto LABEL_61;
  }
  v89 = a3;
  v20 = [v19 objectForKeyedSubscript:v12];
  int v21 = [v20 intValue];

  v22 = [v19 objectForKeyedSubscript:v15];
  int v23 = [v22 intValue];

  id v24 = 0;
  if (v21 < 1) {
    goto LABEL_59;
  }
  if (v23 < 1) {
    goto LABEL_59;
  }
  v25 = [v19 objectForKeyedSubscript:kFigCaptureStreamMetadata_LocalHistogramClippingData];
  id v24 = v25;
  if (!v25) {
    goto LABEL_59;
  }
  if ((unint64_t)[v25 length] < 8) {
    goto LABEL_59;
  }
  id v24 = v24;
  v26 = [v24 bytes];
  id v27 = [v24 length];
  unint64_t v28 = v26[1];
  if ((unint64_t)v27 < v28) {
    goto LABEL_59;
  }
  if (v28 < 0x2C) {
    goto LABEL_59;
  }
  if (*v26 != 1) {
    goto LABEL_59;
  }
  id v24 = v24;
  v29 = (unsigned int *)[v24 bytes];
  if (*((__int16 *)v29 + 19) == -1) {
    goto LABEL_59;
  }
  v30 = v29;
  v87 = a4;
  if (*((__int16 *)v29 + 17) == -1) {
    int v31 = 1;
  }
  else {
    int v31 = 2;
  }
  if (*((__int16 *)v29 + 20) != -1) {
    ++v31;
  }
  int v32 = *((__int16 *)v29 + 21) == -1 ? v31 : v31 + 1;
  int v33 = *((unsigned __int16 *)v29 + 10);
  int v34 = *((unsigned __int16 *)v29 + 11);
  if (2 * (v34 * v33 * v32) + 44 != v26[1]) {
    goto LABEL_59;
  }
  int v35 = *((__int16 *)v29 + 4);
  if (v35 < 0) {
    goto LABEL_59;
  }
  int v36 = *((__int16 *)v29 + 5);
  if (v36 < 0) {
    goto LABEL_59;
  }
  int v37 = v35 + (__int16)(*((_WORD *)v29 + 6) - *((_WORD *)v29 + 8) + *((_WORD *)v29 + 8) * v33);
  if (v37 > v21) {
    goto LABEL_59;
  }
  int v38 = v36 + (__int16)(*((_WORD *)v29 + 7) - *((_WORD *)v29 + 9) + *((_WORD *)v29 + 9) * v34);
  if (v38 > v23) {
    goto LABEL_59;
  }
  v92.double x = (double)v35;
  v92.double y = (double)v36;
  double v39 = (double)(__int16)(v37 - 1);
  double v40 = (double)(__int16)(v38 - 1);
  if (!CGRectContainsPoint(v91, v92))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  v93.double x = v39;
  v93.double y = v40;
  if (!CGRectContainsPoint(v91, v93))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }

  if (*((_WORD *)v30 + 11))
  {
    int v41 = 0;
    int v42 = 0;
    unsigned int v43 = 0;
    int v44 = 0;
    unsigned int v45 = *((unsigned __int16 *)v30 + 19);
    v46 = v89;
    v47 = v85;
    do
    {
      if (*((_WORD *)v30 + 10))
      {
        int v48 = 0;
        __int16 v49 = *((_WORD *)v30 + 12);
        do
        {
          if (*((unsigned __int16 *)v30 + v45 + 22) << v49 > v43)
          {
            unsigned int v43 = *((unsigned __int16 *)v30 + v45 + 22) << v49;
            int v42 = v44;
            int v41 = v48;
          }
          v45 += v32;
          ++v48;
        }
        while (*((unsigned __int16 *)v30 + 10) != v48);
      }
      ++v44;
    }
    while (v44 != *((unsigned __int16 *)v30 + 11));
  }
  else
  {
    unsigned int v43 = 0;
    int v42 = 0;
    int v41 = 0;
    v46 = v89;
    v47 = v85;
  }
  float v50 = (float)v43 / (float)v30[7];
  float v51 = v47[1];
  if (v50 < v51) {
    goto LABEL_60;
  }
  LOWORD(v50) = *((_WORD *)v30 + 6);
  LOWORD(v51) = *((_WORD *)v30 + 7);
  float v52 = (float)LODWORD(v50);
  float v53 = (float)LODWORD(v51);
  double v54 = (double)(uint64_t)llroundf((float)(*((__int16 *)v30 + 4) + v41 * *((unsigned __int16 *)v30 + 8)));
  double v55 = (double)(uint64_t)llroundf((float)(*((__int16 *)v30 + 5) + v42 * *((unsigned __int16 *)v30 + 9)));
  double v56 = (double)(uint64_t)llroundf((float)LODWORD(v50));
  double v57 = (double)(uint64_t)llroundf((float)LODWORD(v51));
  v100.origin.double x = v54;
  v100.origin.double y = v55;
  v100.size.double width = v56;
  v100.size.double height = v57;
  if (!CGRectIntersectsRect(*(CGRect *)v90, v100)) {
    goto LABEL_60;
  }
  v101.origin.double x = v54;
  v101.origin.double y = v55;
  v101.size.double width = v56;
  v101.size.double height = v57;
  if (!CGRectContainsRect(*(CGRect *)v90, v101))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  v96.origin.double x = v54;
  v96.origin.double y = v55;
  v96.size.double width = v56;
  v96.size.double height = v57;
  CGRect v97 = CGRectIntersection(v96, *(CGRect *)v90);
  double x = v97.origin.x;
  double y = v97.origin.y;
  double width = v97.size.width;
  double height = v97.size.height;
  if (CGRectIsEmpty(v97)) {
    goto LABEL_60;
  }
  float v62 = x + width + -1.0;
  float v63 = y + height + -1.0;
  float v64 = a5 * (float)((float)v14 + -1.0);
  float v65 = a6 * (float)((float)v17 + -1.0);
  float v66 = (float)(v64 - v62) + v64;
  float v67 = (float)(v65 - v63) + v65;
  float v68 = (float)(uint64_t)llroundf(*v47 * v52);
  uint64_t v69 = llroundf(*v47 * v53);
  float v70 = fmaxf(v66 - v68, 0.0);
  float v71 = fmaxf(v67 - (float)v69, 0.0);
  double v72 = width + v66 + v68;
  if ((double)v14 + -1.0 < v72) {
    double v72 = (double)v14 + -1.0;
  }
  float v73 = v72;
  double v74 = (double)v17 + -1.0;
  double v75 = height + v67 + (float)v69;
  if (v74 >= v75) {
    double v74 = v75;
  }
  float v76 = v74;
  float v77 = (float)(v73 - v70) + 1.0;
  float v78 = (float)(v76 - v71) + 1.0;
  v98.origin.double x = v70;
  v98.origin.double y = v71;
  v98.size.double width = v77;
  v98.size.double height = v78;
  CGRect v99 = CGRectIntersection(v98, *(CGRect *)v90);
  double v79 = v99.origin.x;
  double v80 = v99.origin.y;
  CGFloat v81 = v99.size.width;
  CGFloat v82 = v99.size.height;
  if (CGRectIsEmpty(v99))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_60;
  }
  if (v46)
  {
    double *v46 = x - *(double *)v90;
    v46[1] = y - *(double *)&v90[8];
    v46[2] = width;
    v46[3] = height;
  }
  if (v87)
  {
    double *v87 = v79 - *(double *)v90;
    v87[1] = v80 - *(double *)&v90[8];
    v87[2] = v81;
    v87[3] = v82;
  }
  uint64_t v83 = 1;
LABEL_61:

  return v83;
}

uint64_t sub_E240(const __CFData *a1, const UInt8 **a2)
{
  if (a2
    && (unint64_t Length = CFDataGetLength(a1), Length > 7)
    && (unint64_t v5 = Length, (BytePtr = CFDataGetBytePtr(a1)) != 0)
    && v5 == 40 * *((int *)BytePtr + 1) + 8
    && !*(_DWORD *)BytePtr)
  {
    *a2 = BytePtr;
    return 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

uint64_t sub_E4E0(const __CFDictionary *a1, int width, uint64_t a3, int a4, uint64_t a5, float *a6)
{
  if (a1 && a6)
  {
    CGSize size = CGRectZero.size;
    uint64_t v10 = sub_E81C(a1);
    if (v10)
    {
      uint64_t v13 = v10;
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      if (CFDictionaryContainsKey(a1, kFigCaptureStreamMetadata_ValidBufferRect))
      {
        FigCFDictionaryGetCGRectIfPresent();
        if (size.height > 0.0 && size.width > 0.0) {
          double width = (int)size.width;
        }
      }
      float v12 = size.width;
      if (v12 <= 0.0 || a4 <= 0)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        return FigSignalErrorAt();
      }
      else
      {
        uint64_t v13 = 0;
        *a6 = (float)width / (float)((float)a4 * v12);
      }
    }
    return v13;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

uint64_t sub_E81C(const __CFDictionary *a1)
{
  if ((CFDictionaryContainsKey(a1, kFigCaptureStreamMetadata_SensorRawValidBufferRect)
     || CFDictionaryContainsKey(a1, kFigCaptureStreamMetadata_TotalSensorCropRect)
     || CFDictionaryContainsKey(a1, kFigCaptureStreamMetadata_RawCropRect))
    && FigCFDictionaryGetCGRectIfPresent())
  {
    return 0;
  }

  return FigSignalErrorAt();
}

uint64_t sub_E8F0(const __CFDictionary *a1, double *a2)
{
  int v12 = 0;
  if (a1)
  {
    if (a2)
    {
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, kFigCaptureStreamMetadata_RollingShutterSkew);
      if (Value)
      {
        int valuePtr = 0;
        CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
        CFNumberRef v5 = (const __CFNumber *)CFDictionaryGetValue(a1, kFigCaptureStreamMetadata_RawSensorHeight);
        if (v5)
        {
          CFNumberGetValue(v5, kCFNumberSInt32Type, &v12);
          if (v12 > 0)
          {
            CGPoint origin = CGRectZero.origin;
            CGPoint v11 = CGRectZero.origin;
            uint64_t v6 = sub_E81C(a1);
            if (v6)
            {
              uint64_t v8 = v6;
              fig_log_get_emitter();
              FigDebugAssert3();
              return v8;
            }
            if (!CFDictionaryContainsKey(a1, kFigCaptureStreamMetadata_SensorReadoutRect))
            {
              double y = 0.0;
              goto LABEL_11;
            }
            if (FigCFDictionaryGetCGRectIfPresent())
            {
              double y = origin.y;
LABEL_11:
              uint64_t v8 = 0;
              *a2 = (v11.y - y) * (double)valuePtr / ((double)v12 * 1000000.0);
              return v8;
            }
          }
          fig_log_get_emitter();
        }
        else
        {
          fig_log_get_emitter();
        }
        FigDebugAssert3();
        return FigSignalErrorAt();
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();

  return FigSignalErrorAt();
}

uint64_t sub_ECD8(CFDictionaryRef theDict, float64x2_t *a2, uint64_t a3, int a4, int *a5, float32x2_t *a6, uint64_t a7, int a8, int *a9)
{
  if (theDict)
  {
    if (a2 && a5)
    {
      CFDataRef Value = (const __CFData *)CFDictionaryGetValue(theDict, kFigCaptureStreamMetadata_ISPMotionData);
      if (Value)
      {
        int v38 = a6;
        int v41 = 0;
        uint64_t v18 = sub_E240(Value, &v41);
        if (v18)
        {
          uint64_t v34 = v18;
          fig_log_get_emitter();
          FigDebugAssert3();
          fig_log_get_emitter();
          goto LABEL_30;
        }
        LODWORD(v20) = *((_DWORD *)v41 + 1);
        if ((int)v20 >= a4) {
          LODWORD(v20) = a4;
        }
        *a5 = v20;
        if ((int)v20 < 1)
        {
          float32x2_t v24 = 0;
          float v25 = 0.0;
        }
        else
        {
          int v37 = a8;
          uint64_t v21 = 0;
          v22 = (float *)(a3 + 8);
          int v23 = a2 + 1;
          float32x2_t v24 = 0;
          float v25 = 0.0;
          uint64_t v26 = 44;
          float64x2_t v39 = (float64x2_t)vdupq_n_s64(0x3E10000000000000uLL);
          float32x2_t v27 = (float32x2_t)vdup_n_s32(0x37800000u);
          do
          {
            int64_t v28 = FigHostTimeToNanoseconds();
            CMTimeMake(&time, v28, 1000000000);
            v23[-1].f64[1] = CMTimeGetSeconds(&time);
            v29 = (int *)&v41[v26];
            uint64_t v30 = *(void *)&v41[v26 - 24];
            v31.i64[0] = (int)v30;
            v31.i64[1] = SHIDWORD(v30);
            *int v23 = vmulq_f64(vcvtq_f64_s64(v31), v39);
            uint64_t v32 = *((void *)v29 - 2);
            v31.i64[0] = (int)v32;
            v31.i64[1] = SHIDWORD(v32);
            v23[1] = vmulq_f64(vcvtq_f64_s64(v31), v39);
            float32x2_t v19 = vmul_f32(vcvt_f32_s32(*(int32x2_t *)(v29 - 2)), v27);
            float v33 = (float)*v29 * 0.000015259;
            if (a3)
            {
              *((float32x2_t *)v22 - 1) = v19;
              float *v22 = v33;
            }
            float32x2_t v24 = vadd_f32(v24, v19);
            float v25 = v25 + v33;
            ++v21;
            uint64_t v20 = *a5;
            v22 += 3;
            v23 += 3;
            v26 += 40;
          }
          while (v21 < v20);
          a8 = v37;
        }
        if (v38 && v20)
        {
          v19.f32[0] = (float)(int)v20;
          *int v38 = vdiv_f32(v24, (float32x2_t)vdup_lane_s32((int32x2_t)v19, 0));
          v38[1].f32[0] = v25 / (float)(int)v20;
        }
      }
      else
      {
        *a5 = 0;
      }
    }
    uint64_t v34 = 0;
    if (!a7 || !a9) {
      return v34;
    }
    CFDataRef v35 = (const __CFData *)CFDictionaryGetValue(theDict, kFigCaptureStreamMetadata_ISPHallData);
    if (v35)
    {
      uint64_t v34 = sub_F0D4(v35, a7, a9, a8);
      if (v34)
      {
        fig_log_get_emitter();
LABEL_30:
        FigDebugAssert3();
      }
    }
    else
    {
      uint64_t v34 = 0;
      *a9 = 0;
    }
    return v34;
  }
  fig_log_get_emitter();
  FigDebugAssert3();

  return FigSignalErrorAt();
}

uint64_t sub_F0D4(const __CFData *a1, uint64_t a2, int *a3, int a4)
{
  unint64_t Length = CFDataGetLength(a1);
  if (Length <= 7) {
    goto LABEL_28;
  }
  unint64_t v9 = Length;
  BytePtr = CFDataGetBytePtr(a1);
  if (*(_DWORD *)BytePtr >= 2u) {
    goto LABEL_28;
  }
  int v11 = 16;
  if (*(_DWORD *)BytePtr == 1) {
    int v11 = 24;
  }
  if (v9 != v11 * (uint64_t)*((int *)BytePtr + 1) + 8)
  {
LABEL_28:
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v23 = FigSignalErrorAt();
    BytePtr = 0;
    if (v23)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return v23;
    }
  }
  if (a3)
  {
    int v12 = *((_DWORD *)BytePtr + 1);
    if (v12 >= a4) {
      int v12 = a4;
    }
    *a3 = v12;
    if (*(_DWORD *)BytePtr == 1)
    {
      if (v12 >= 1)
      {
        uint64_t v18 = 0;
        float32x2_t v19 = (float *)(a2 + 12);
        uint64_t v20 = (int *)(BytePtr + 28);
        do
        {
          int64_t v21 = FigHostTimeToNanoseconds();
          CMTimeMake(&v26, v21, 1000000000);
          *(Float64 *)(v19 - 3) = CMTimeGetSeconds(&v26);
          *(v19 - 1) = (float)*(v20 - 3) * 0.0039062;
          *float32x2_t v19 = (float)*(v20 - 2) * 0.0039062;
          v19[1] = (float)*(v20 - 1) * 0.0039062;
          int v22 = *v20;
          v20 += 6;
          v19[2] = (float)v22 * 0.0039062;
          ++v18;
          v19 += 6;
        }
        while (v18 < *a3);
      }
    }
    else
    {
      if (*(_DWORD *)BytePtr) {
        return 4294954515;
      }
      if (v12 >= 1)
      {
        uint64_t v13 = 0;
        int v14 = (Float64 *)(a2 + 16);
        uint64_t v15 = (int *)(BytePtr + 20);
        do
        {
          int64_t v16 = FigHostTimeToNanoseconds();
          CMTimeMake(&time, v16, 1000000000);
          *(v14 - 2) = CMTimeGetSeconds(&time);
          *((float *)v14 - 2) = (float)*(v15 - 1) * 0.0039062;
          int v17 = *v15;
          v15 += 4;
          *((float *)v14 - 1) = (float)v17 * 0.0039062;
          *int v14 = 0.0;
          v14 += 3;
          ++v13;
        }
        while (v13 < *a3);
      }
    }
    return 0;
  }
  fig_log_get_emitter();
  FigDebugAssert3();

  return FigSignalErrorAt();
}

uint64_t sub_F4FC(const __CFDictionary *a1, double *a2, float a3)
{
  if (a1 && a2)
  {
    double v13 = 0.0;
    if (!FigCFDictionaryGetDoubleIfPresent()) {
      return FigSignalErrorAt();
    }
    double v12 = 0.0;
    if (!FigCFDictionaryGetDoubleIfPresent()) {
      return FigSignalErrorAt();
    }
    double v12 = v12 / 1000000.0;
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a1, kFigCaptureSampleBufferAttachmentKey_OriginalPresentationTimeStamp);
    if (!Value) {
      return FigSignalErrorAt();
    }
    CMTimeMakeFromDictionary(&time, Value);
    double Seconds = CMTimeGetSeconds(&time);
    double v10 = 0.0;
    uint64_t v8 = sub_E8F0(a1, &v10);
    if (v8)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      *a2 = Seconds + v10 + v13 * -0.5 + a3 * v12;
    }
    return v8;
  }
  else
  {
    return FigSignalErrorAt();
  }
}

double sub_F6E4(double *a1, uint64_t *a2)
{
  double v3 = *(double *)a2;
  float64x2_t v4 = vnegq_f64(*(float64x2_t *)(a2 + 1));
  double v5 = -*((double *)a2 + 3);
  return sub_FAB4(&v3, a1);
}

uint64_t sub_F730(void *a1)
{
  if (!a1) {
    return 4294954516;
  }
  uint64_t result = 0;
  *a1 = 0x3FF0000000000000;
  a1[1] = 0;
  a1[2] = 0;
  a1[3] = 0;
  return result;
}

uint64_t sub_F754()
{
  FigGetUpTime();
  uint64_t result = FigHostTimeToNanoseconds();
  if (qword_343C8) {
    BOOL v1 = (unint64_t)(result - qword_343C8) >= 0x3B9ACA00;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1)
  {
    if (dword_343D0) {
      dword_343D0 = 0;
    }
    qword_343C8 = result;
  }
  else
  {
    ++dword_343D0;
  }
  return result;
}

void sub_F7B0(uint64_t a1, double *a2, float a3)
{
  long double cosval = *(double *)a1;
  float64x2_t v19 = vnegq_f64(*(float64x2_t *)(a1 + 8));
  double v20 = -*(double *)(a1 + 24);
  long double v5 = sub_FAB4(&cosval, a2);
  double v8 = v7;
  double v10 = v9;
  if (fabs(v5) <= 1.0)
  {
    double v11 = v6;
    long double cosval = 0.0;
    float64x2_t v19 = 0uLL;
    long double v12 = acos(v5);
    double v13 = sin(v12);
    double v14 = a3;
    double v15 = v12 * v14;
    if (v13 <= 0.00000001)
    {
      long double cosval = cos(v15);
      v19.f64[0] = v8 * v14;
      v19.f64[1] = v10 * v14;
      double v17 = v11 * v14;
    }
    else
    {
      __double2 v16 = __sincos_stret(v15);
      long double cosval = v16.__cosval;
      v19.f64[0] = v16.__sinval / v13 * v8;
      v19.f64[1] = v16.__sinval / v13 * v10;
      double v17 = v16.__sinval / v13 * v11;
    }
    double v20 = v17;
    sub_FAB4((double *)a1, &cosval);
  }
}

double sub_F8BC(uint64_t a1, int8x16_t a2, int32x4_t a3, float a4, float a5, int8x16_t a6)
{
  a6.i32[0] = *(_DWORD *)(a1 + 24);
  int32x4_t v6 = a3;
  *(float *)&v6.i32[1] = a5;
  float32x4_t v7 = (float32x4_t)vzip1q_s32(v6, v6);
  v7.i32[2] = a3.i32[0];
  int32x4_t v8 = (int32x4_t)a2;
  *(float *)&v8.i32[1] = a4;
  float32x4_t v9 = (float32x4_t)vzip1q_s32(v8, v8);
  v9.i32[2] = a2.i32[0];
  a2.i64[0] = *(void *)(a1 + 28);
  float32x4_t v10 = (float32x4_t)vextq_s8(vextq_s8(a6, a6, 4uLL), a2, 0xCuLL);
  v10.i32[3] = v10.i32[0];
  *(float32x4_t *)a1 = vmlaq_f32(vmulq_f32(v10, v7), *(float32x4_t *)a1, v9);
  *(float32x2_t *)a2.i8 = vmla_n_f32(vmul_n_f32(*(float32x2_t *)a2.i8, a5), *(float32x2_t *)(a1 + 16), a4);
  *(void *)(a1 + 16) = a2.i64[0];
  return *(double *)a2.i64;
}

float sub_F914(float *a1, float a2, float a3, float a4, float a5)
{
  float v5 = *a1;
  float v6 = a1[1];
  float v7 = a1[3];
  float v8 = a1[4];
  float v9 = a1[6];
  float v10 = a1[7];
  float v11 = (float)(a1[2] + (float)(a5 * v6)) + (float)(a3 * *a1);
  float v12 = (float)(a1[5] + (float)(a5 * v8)) + (float)(a3 * v7);
  a1[8] = (float)(a1[8] + (float)(a5 * v10)) + (float)(a3 * v9);
  float v13 = v5 * a2;
  a1[2] = v11;
  a1[3] = v7 * a2;
  float result = v9 * a2;
  *a1 = v13;
  a1[1] = v6 * a4;
  a1[4] = v8 * a4;
  a1[5] = v12;
  a1[6] = result;
  a1[7] = v10 * a4;
  return result;
}

double sub_F970(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4)
{
  long long v6 = *a3;
  long long v7 = a3[1];
  *(_DWORD *)(a4 + 32) = *((_DWORD *)a3 + 8);
  *(_OWORD *)a4 = v6;
  *(_OWORD *)(a4 + 16) = v7;
  *(float *)&long long v7 = *(double *)(a2 + 8);
  float v8 = *(double *)(a2 + 16);
  sub_F914((float *)a4, 1.0 / *(float *)a2, (float)-*(float *)&v7 / *(float *)a2, 1.0 / *(float *)a2, (float)-v8 / *(float *)a2);
  v10.i32[0] = *(_DWORD *)a1;
  v11.i64[0] = *(void *)(a1 + 8);
  *(float *)v11.i32 = *(double *)v11.i64;
  float v12 = *(double *)(a1 + 16);
  float v13 = *(float *)a1;

  return sub_F8BC(a4, v10, v11, v13, v12, v9);
}

float sub_FA00(double *a1, int a2, float *a3)
{
  double v3 = a1[1];
  double v4 = a1[2];
  double v5 = *a1;
  if (a2)
  {
    double v3 = -v3;
    double v6 = -a1[3];
  }
  else
  {
    double v6 = a1[3];
  }
  float v7 = v4 + v4;
  float v8 = v3 + v3;
  float v9 = v6 + v6;
  float v10 = v4;
  float v11 = v3;
  float v12 = v6;
  float v13 = v12 * v9;
  float v14 = (float)(1.0 - (float)(v11 * v8)) - v13;
  float v15 = 1.0 - (float)(v10 * v7);
  float v16 = v15 - v13;
  a3[8] = v15 - (float)(v11 * v8);
  float v17 = v11 * v9;
  float v18 = v5;
  float v19 = v18 * v7;
  float v20 = v17 - v19;
  a3[4] = v16;
  a3[5] = v19 + v17;
  float v21 = (float)(v10 * v8) - (float)(v18 * v9);
  *a3 = v14;
  a3[1] = (float)(v10 * v8) + (float)(v18 * v9);
  float v22 = v18 * v8;
  a3[2] = (float)(v10 * v9) - v22;
  a3[3] = v21;
  float result = v22 + (float)(v10 * v9);
  a3[6] = result;
  a3[7] = v20;
  return result;
}

double sub_FAB4(double *a1, double *a2)
{
  double v2 = *a1;
  double v3 = a1[1];
  double v5 = *a2;
  double v4 = a2[1];
  double v6 = a1[2];
  double v7 = a1[3];
  double v9 = a2[2];
  double v8 = a2[3];
  double v10 = *a2 * v7 + *a1 * v8 + v3 * v9 - v6 * v4;
  v12[2] = *a2 * v6 + *a1 * v9 + v7 * v4 - v3 * v8;
  v12[3] = v10;
  v12[0] = v2 * v5 - v3 * v4 - v6 * v9 - v7 * v8;
  v12[1] = v3 * v5 + v2 * v4 + v6 * v8 - v7 * v9;
  sub_FB38(v12);
  return v12[0];
}

uint64_t sub_FB38(double *a1)
{
  if (a1
    && (double v2 = *a1, v1 = a1[1], v3 = a1[2], v4 = a1[3], v5 = sqrt(v1 * v1 + v2 * v2 + v3 * v3 + v4 * v4), v5 > 0.00000001))
  {
    double v6 = 1.0 / v5;
    *a1 = v2 * v6;
    a1[1] = v1 * v6;
    a1[2] = v3 * v6;
    a1[3] = v4 * v6;
    return 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

uint64_t sub_FCB4()
{
  CFDictionaryRef v0 = (const __CFDictionary *)__chkstk_darwin();
  double v2 = v1;
  double v4 = v3;
  CFDictionaryRef v5 = v0;
  int v24 = 0;
  double valuePtr = 0.0;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v0, kFigCaptureStreamMetadata_ExposureTime);
  if (Value)
  {
    CFNumberGetValue(Value, kCFNumberFloat64Type, &valuePtr);
    CFNumberRef v7 = (const __CFNumber *)CFDictionaryGetValue(v5, kFigCaptureStreamMetadata_FrameRollingShutterSkew);
    if (v7)
    {
      CFNumberGetValue(v7, kCFNumberSInt32Type, &v24);
      int v8 = v24;
      double v9 = valuePtr;
      float32x2_t *v2 = 0;
      unsigned int v25 = 0;
      float32x2_t *v2 = 0;
      CFDataRef v10 = (const __CFData *)CFDictionaryGetValue(v5, kFigCaptureStreamMetadata_ISPHallData);
      if (v10)
      {
        uint64_t v11 = sub_F0D4(v10, (uint64_t)v26, (int *)&v25, 510);
        if (v11)
        {
          uint64_t v21 = v11;
          fig_log_get_emitter();
          FigDebugAssert3();
          fig_log_get_emitter();
          FigDebugAssert3();
          return v21;
        }
        unsigned int v12 = v25;
        if ((int)v25 >= 1)
        {
          unint64_t v13 = 0;
          int v14 = 0;
          double v15 = v4 + v9 * -0.5;
          double v16 = (double)v8 / 1000000.0 + v15;
          uint64_t v17 = 24 * v25;
          do
          {
            double v18 = v26[v13 / 8];
            if (v18 >= v15 && v18 <= v16)
            {
              float32x2_t *v2 = vadd_f32(*(float32x2_t *)&v26[v13 / 8 + 1], *v2);
              ++v14;
            }
            v13 += 24;
          }
          while (v17 != v13);
          if (v14)
          {
            *(float *)&double v16 = (float)v14;
            float32x2_t *v2 = vdiv_f32(*v2, (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v16, 0));
          }
          else
          {
            unsigned int v20 = v12 - 1;
            if (v26[0] > v16) {
              unsigned int v20 = 0;
            }
            float32x2_t *v2 = *(float32x2_t *)&v26[3 * v20 + 1];
            sub_F754();
          }
        }
      }
      return 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return FigSignalErrorAt();
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();

  return FigSignalErrorAt();
}

uint64_t sub_100A4(uint64_t a1, float64x2_t *a2, float a3, float a4)
{
  if (a1)
  {
    uint64_t v7 = sub_FCB4();
    if (v7)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      *a2 = vaddq_f64(*a2, vcvtq_f64_f32(vmul_n_f32(0, a3 * a4)));
    }
    return v7;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

uint64_t sub_10228(const __CFDictionary *a1, int a2, int a3, int a4, int a5, int a6, float64x2_t *a7, float a8, float a9)
{
  value = 0;
  CGPoint v19 = CGPointZero;
  CGPoint point = v19;
  if (a1 && a7)
  {
    double v16 = ((double)a2 + -1.0) * 0.5;
    double v17 = ((double)a3 + -1.0) * 0.5;
    v22.f64[0] = v16;
    v22.f64[1] = v17;
    if (CFDictionaryGetValueIfPresent(a1, kFigCaptureStreamMetadata_OpticalCenter, (const void **)&value)
      && CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)value, &point)
      && sub_1041C(a1, (float64x2_t *)&v19))
    {
      v22.f64[0] = v16 + (point.x - v19.x) * a9 * (double)a4;
      v22.f64[1] = v17 + (point.y - v19.y) * a9 * (double)a5;
    }
    if (!a6 || (uint64_t result = sub_100A4((uint64_t)a1, &v22, a8, a9), !result))
    {
      uint64_t result = 0;
      *a7 = v22;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  return result;
}

BOOL sub_1041C(const __CFDictionary *a1, float64x2_t *a2)
{
  CGPoint origin = CGRectZero.origin;
  CGSize size = CGRectZero.size;
  int v3 = sub_E81C(a1);
  if (!v3)
  {
    __asm { FMOV            V2.2D, #-1.0 }
    float64x2_t v9 = vaddq_f64((float64x2_t)size, _Q2);
    __asm { FMOV            V2.2D, #0.5 }
    *a2 = vmlaq_f64((float64x2_t)origin, _Q2, v9);
  }
  return v3 == 0;
}

float sub_10480(float *a1, float *a2, float *a3, float a4, float a5)
{
  float v5 = (float)(a1[8] + (float)(a1[7] * a5)) + (float)(a1[6] * a4);
  if (fabsf(v5) > 0.00000001) {
    float v5 = 1.0 / v5;
  }
  *a2 = (float)((float)(a1[2] + (float)(a1[1] * a5)) + (float)(*a1 * a4)) * v5;
  float result = v5 * (float)((float)(a1[5] + (float)(a1[4] * a5)) + (float)(a1[3] * a4));
  *a3 = result;
  return result;
}

void sub_16AB0(id a1, MTLCommandBuffer *a2)
{
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
}

void sub_16AE4(id a1, MTLCommandBuffer *a2)
{
  double v2 = a2;
  if ([(MTLCommandBuffer *)v2 status] == &dword_4)
  {
    [(MTLCommandBuffer *)v2 GPUEndTime];
    [(MTLCommandBuffer *)v2 GPUStartTime];
  }
  else
  {
    [(MTLCommandBuffer *)v2 status];
  }
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
}

void sub_16E84(id a1, MTLCommandBuffer *a2)
{
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
}

void sub_16EB8(id a1, MTLCommandBuffer *a2)
{
  double v2 = a2;
  if ([(MTLCommandBuffer *)v2 status] == &dword_4)
  {
    [(MTLCommandBuffer *)v2 GPUEndTime];
    [(MTLCommandBuffer *)v2 GPUStartTime];
  }
  else
  {
    [(MTLCommandBuffer *)v2 status];
  }
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
}

void sub_175B8(id a1, MTLCommandBuffer *a2)
{
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
}

void sub_175EC(id a1, MTLCommandBuffer *a2)
{
  double v2 = a2;
  if ([(MTLCommandBuffer *)v2 status] == &dword_4)
  {
    [(MTLCommandBuffer *)v2 GPUEndTime];
    [(MTLCommandBuffer *)v2 GPUStartTime];
  }
  else
  {
    [(MTLCommandBuffer *)v2 status];
  }
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
}

FILE *sub_18680(const char *a1)
{
  double v2 = +[NSString stringWithFormat:@"%s", a1];
  int v3 = [v2 stringByDeletingLastPathComponent];
  double v4 = +[NSFileManager defaultManager];
  id v10 = 0;
  unsigned __int8 v5 = [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v10];
  id v6 = v10;
  uint64_t v7 = v6;
  if (v5)
  {
    int v8 = fopen(a1, "wb");
  }
  else
  {
    NSLog(@"Failed to create directory \"%@\". Error: %@", v3, v6);
    int v8 = 0;
  }

  return v8;
}

FILE *sub_18C0C(unsigned int a1, int a2, unsigned int a3, unsigned char *a4, const char *a5)
{
  float result = sub_18680(a5);
  if (result)
  {
    id v10 = result;
    uint64_t v11 = malloc_type_malloc(3 * a1, 0x208AAB68uLL);
    if (v11)
    {
      unsigned int v12 = v11;
      fprintf(v10, "P6 %u %u 255\n", a1, a2);
      if (a2)
      {
        int v13 = 0;
        do
        {
          unsigned int v14 = a1;
          double v15 = v12;
          for (i = a4; v14; --v14)
          {
            *double v15 = *i;
            v15[1] = i[1];
            v15[2] = i[2];
            i += 4;
            v15 += 3;
          }
          fwrite(v12, 3uLL, a1, v10);
          a4 += a3;
          ++v13;
        }
        while (v13 != a2);
      }
      free(v12);
    }
    return (FILE *)fclose(v10);
  }
  return result;
}

float *sub_1CF90(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, float a9)
{
  double v17 = (float *)malloc_type_malloc(0x18uLL, 0x10200405AF6BDC9uLL);
  if (a2 < 0) {
    sub_1F6B4();
  }
  if (a3 < 0) {
    sub_1F6E0();
  }
  if (a4 < 0) {
    sub_1F70C();
  }
  if (a5 < 0) {
    sub_1F738();
  }
  if (a6 < 0) {
    sub_1F764();
  }
  if (a7 < 0) {
    sub_1F790();
  }
  int v18 = a2 * a1;
  uint64_t v19 = (a2 * a1 / 100);
  int v20 = a3 * a1;
  int v21 = a3 * a1 / 100;
  v104[0] = v19;
  v104[1] = v21;
  int v22 = a4 * a1;
  int v23 = a4 * a1 / 100;
  int v24 = a5 * a1;
  int v25 = a5 * a1 / 100;
  v104[2] = v23;
  v104[3] = v25;
  int v26 = a6 * a1;
  int v27 = a6 * a1 / 100;
  int v28 = a7 * a1;
  int v29 = a7 * a1 / 100;
  v104[4] = v27;
  v104[5] = v29;
  int v30 = v21 + v19 + v23 + v25;
  if ((v30 + v27 + v29 < 0) ^ __OFADD__(v30, v27 + v29) | (v30 + v27 + v29 == 0)) {
    sub_1F7BC();
  }
  int64x2_t v31 = v17;
  int v101 = v24;
  int v102 = v22;
  int v99 = v28;
  int v100 = v26;
  *((_DWORD *)v17 + 2) = v30 + v27 + v29;
  unsigned int v32 = v30 + v27 + v29;
  *(void *)double v17 = malloc_type_malloc(3 * v32, 0x100004033FC2DF1uLL);
  *((_DWORD *)v31 + 3) = a8;
  if (v18 < 100)
  {
    unsigned int v38 = 0;
    int v36 = v32;
  }
  else
  {
    int v33 = 0;
    uint64_t v34 = 0;
    uint64_t v35 = 1;
    int v36 = v32;
    do
    {
      if (v34 >= *((int *)v31 + 2)) {
        sub_1F7E8();
      }
      ++v34;
      int v37 = (unsigned char *)(*(void *)v31 + v35);
      *(v37 - 1) = 0;
      *int v37 = v33 / (int)v19;
      v37[1] = -1;
      v35 += 3;
      v33 += 255;
    }
    while (v19 != v34);
    unsigned int v38 = v18 / 100;
  }
  if (v20 >= 100)
  {
    int v39 = 0;
    uint64_t v40 = 0;
    uint64_t v41 = v38;
    uint64_t v42 = 3 * v38;
    do
    {
      if (v41 + v40 >= *((int *)v31 + 2)) {
        sub_1F7E8();
      }
      uint64_t v43 = *(void *)v31 + v42;
      *(_WORD *)uint64_t v43 = -256;
      *(unsigned char *)(v43 + 2) = ~(v39 / v21);
      v42 += 3;
      ++v40;
      v39 += 255;
    }
    while (v21 != v40);
    unsigned int v38 = v41 + v40;
  }
  if (v102 >= 100)
  {
    int v44 = 0;
    int v45 = 0;
    uint64_t v46 = 3 * v38;
    do
    {
      if (*((_DWORD *)v31 + 2) <= (signed int)(v38 + v45)) {
        sub_1F7E8();
      }
      uint64_t v47 = *(void *)v31 + v46;
      *(unsigned char *)uint64_t v47 = v44 / v23;
      *(_WORD *)(v47 + 1) = 255;
      ++v45;
      v46 += 3;
      v44 += 255;
    }
    while (v23 != v45);
    v38 += v45;
  }
  if (v101 >= 100)
  {
    int v48 = 0;
    int v49 = 0;
    uint64_t v50 = 3 * v38;
    do
    {
      if (*((_DWORD *)v31 + 2) <= (signed int)(v38 + v49)) {
        sub_1F7E8();
      }
      uint64_t v51 = *(void *)v31 + v50;
      *(unsigned char *)uint64_t v51 = -1;
      *(_WORD *)(v51 + 1) = ~(v48 / v25);
      ++v49;
      v50 += 3;
      v48 += 255;
    }
    while (v25 != v49);
    v38 += v49;
  }
  if (v100 >= 100)
  {
    int v52 = 0;
    int v53 = 0;
    uint64_t v54 = 3 * v38;
    do
    {
      if (*((_DWORD *)v31 + 2) <= (signed int)(v38 + v53)) {
        sub_1F7E8();
      }
      uint64_t v55 = *(void *)v31 + v54;
      *(_WORD *)uint64_t v55 = 255;
      *(unsigned char *)(v55 + 2) = v52 / v27;
      ++v53;
      v54 += 3;
      v52 += 255;
    }
    while (v27 != v53);
    v38 += v53;
  }
  if (v99 >= 100)
  {
    int v56 = 0;
    int v57 = 0;
    uint64_t v58 = 3 * v38;
    do
    {
      if (*((_DWORD *)v31 + 2) <= (signed int)(v38 + v57)) {
        sub_1F7E8();
      }
      uint64_t v59 = *(void *)v31 + v58;
      *(unsigned char *)uint64_t v59 = ~(v56 / v29);
      *(_WORD *)(v59 + 1) = -256;
      ++v57;
      v58 += 3;
      v56 += 255;
    }
    while (v29 != v57);
  }
  if (a8 < 0 && v36 > 1)
  {
    uint64_t v60 = 0;
    uint64_t v61 = v36 >> 1;
    int v62 = v19 + v21 + v23 + v25 + v27 + v29 - 1;
    do
    {
      float v63 = (__int16 *)(*(void *)v31 + v60);
      uint64_t v64 = *(void *)v31 + 3 * v62;
      char v65 = *((unsigned char *)v63 + 2);
      __int16 v66 = *v63;
      char v67 = *(unsigned char *)(v64 + 2);
      *float v63 = *(_WORD *)v64;
      *((unsigned char *)v63 + 2) = v67;
      *(_WORD *)uint64_t v64 = v66;
      *(unsigned char *)(v64 + 2) = v65;
      --v62;
      v60 += 3;
      --v61;
    }
    while (v61);
  }
  if (a8 >= 0) {
    int v68 = a8;
  }
  else {
    int v68 = -a8;
  }
  unsigned int v69 = v68 - 1;
  LODWORD(v70) = 6 - v68;
  if (a8 >= 0) {
    uint64_t v70 = v69;
  }
  else {
    uint64_t v70 = v70;
  }
  if ((int)v70 >= 1)
  {
    int v71 = 0;
    double v72 = v104;
    do
    {
      int v73 = v71;
      int v75 = *v72++;
      int v74 = v75;
      v71 += v75;
      --v70;
    }
    while (v70);
    if (v71 > 0)
    {
      float v76 = *(__int16 **)v31;
      int v77 = v36 - 1;
      if (v71 != 1)
      {
        int v78 = 0;
        double v79 = (__int16 *)((char *)v76 + 3 * (v71 - 1));
        int v80 = v73 + v74 - 2;
        CGFloat v81 = *(__int16 **)v31;
        do
        {
          char v82 = *((unsigned char *)v81 + 2);
          __int16 v83 = *v81;
          char v84 = *((unsigned char *)v79 + 2);
          *CGFloat v81 = *v79;
          *((unsigned char *)v81 + 2) = v84;
          *double v79 = v83;
          *((unsigned char *)v79 + 2) = v82;
          CGFloat v81 = (__int16 *)((char *)v81 + 3);
          double v79 = (__int16 *)((char *)v79 - 3);
          BOOL v85 = ++v78 < v80--;
        }
        while (v85);
      }
      if (v71 < v77)
      {
        v86 = (__int16 *)((char *)v76 + 3 * v77);
        v87 = (__int16 *)((char *)v76 + 3 * v71);
        int v88 = v19 + v21 + v23 + v25 + v27 + v29 - 2;
        do
        {
          char v89 = *((unsigned char *)v87 + 2);
          __int16 v90 = *v87;
          char v91 = *((unsigned char *)v86 + 2);
          __int16 *v87 = *v86;
          *((unsigned char *)v87 + 2) = v91;
          __int16 *v86 = v90;
          *((unsigned char *)v86 + 2) = v89;
          v87 = (__int16 *)((char *)v87 + 3);
          v86 = (__int16 *)((char *)v86 - 3);
          BOOL v85 = ++v71 < v88--;
        }
        while (v85);
      }
      if (v36 >= 2)
      {
        int v92 = 0;
        CGPoint v93 = (__int16 *)((char *)v76 + 3 * (v36 - 1));
        int v94 = v19 + v21 + v23 + v25 + v27 + v29 - 2;
        do
        {
          char v95 = *((unsigned char *)v76 + 2);
          __int16 v96 = *v76;
          char v97 = *((unsigned char *)v93 + 2);
          *float v76 = *v93;
          *((unsigned char *)v76 + 2) = v97;
          *CGPoint v93 = v96;
          *((unsigned char *)v93 + 2) = v95;
          float v76 = (__int16 *)((char *)v76 + 3);
          CGPoint v93 = (__int16 *)((char *)v93 - 3);
          BOOL v85 = ++v92 < v94--;
        }
        while (v85);
      }
    }
  }
  v31[4] = a9;
  return v31;
}

void sub_1D5C0(void ***a1)
{
  if (a1)
  {
    free(**a1);
    free(*a1);
    *a1 = 0;
  }
}

uint64_t sub_1D600(uint64_t a1, int a2, float a3, double a4, double a5, float a6)
{
  if (a3 < 0.0 || a3 > 1.0) {
    sub_1F814();
  }
  int v7 = *(_DWORD *)(a1 + 8);
  float v8 = *(float *)(a1 + 16);
  if (v8 != 0.0)
  {
    float v9 = v8 / 6.28318531;
    a3 = v9 + a3;
    float v10 = 1.0;
    if (a3 < 0.0)
    {
LABEL_9:
      a3 = a3 + v10;
      goto LABEL_10;
    }
    if (a3 > 1.0)
    {
      float v10 = -1.0;
      goto LABEL_9;
    }
  }
LABEL_10:
  float v11 = a3 * (float)(v7 - 1);
  int v12 = (int)v11;
  int v13 = ((int)v11 + 1) % v7;
  *(float *)&unsigned int v14 = (float)(int)v11;
  float v15 = v11 - *(float *)&v14;
  LOBYTE(v14) = *(unsigned char *)(*(void *)a1 + 3 * v12 + a2);
  LOBYTE(a6) = *(unsigned char *)(*(void *)a1 + 3 * v13 + a2);
  return (int)(float)((float)((float)(v15 * (float)((float)LODWORD(a6) / 255.0))
                                          + (float)((float)(1.0 - v15) * (float)((float)v14 / 255.0)))
                                  * 255.0);
}

uint64_t sub_1D6E8(uint64_t result, int a2, int a3, float *a4, int a5, int a6, uint64_t a7, int a8, double a9, double a10, double a11, float a12, int a13)
{
  if (a3 >= 1)
  {
    int v13 = a4;
    uint64_t v14 = result;
    uint64_t v15 = 0;
    uint64_t v16 = a6;
    float v17 = 1.1755e-38;
    float v18 = 3.4028e38;
    uint64_t v19 = a4;
    uint64_t v20 = a2;
    do
    {
      uint64_t v21 = a2;
      int v22 = v19;
      if (a2 >= 1)
      {
        do
        {
          *(float *)&a10 = *v22;
          if (*v22 < v18) {
            float v18 = *v22;
          }
          if (*(float *)&a10 > v17) {
            float v17 = *v22;
          }
          int v22 = (float *)((char *)v22 + a6);
          --v21;
        }
        while (v21);
      }
      ++v15;
      uint64_t v19 = (float *)((char *)v19 + a5);
    }
    while (v15 != a3);
    uint64_t v23 = 0;
    float v24 = v17 - v18;
    uint64_t v35 = a8;
    int v25 = (unsigned char *)(a7 + 1);
    uint64_t v36 = a3;
    uint64_t v37 = a5;
    do
    {
      int v26 = v13;
      int v27 = v25;
      if (a2 >= 1)
      {
        do
        {
          float v28 = fmaxf(fminf((float)(*v26 - v18) / v24, 1.0), 0.0);
          *(v27 - 1) = sub_1D600(v14, 0, v28, a10, a11, a12);
          *int v27 = sub_1D600(v14, 1, v28, v29, v30, v31);
          float result = sub_1D600(v14, 2, v28, v32, v33, v34);
          v27[1] = result;
          v27[2] = -1;
          v27 += a13;
          int v26 = (float *)((char *)v26 + v16);
          --v20;
        }
        while (v20);
      }
      ++v23;
      uint64_t v20 = a2;
      v25 += v35;
      int v13 = (float *)((char *)v13 + v37);
    }
    while (v23 != v36);
  }
  return result;
}

void sub_1F6B4()
{
  __assert_rtn("createColorsWheel_", "FigColorsWheel.c", 83, "rangeBC >= 0");
}

void sub_1F6E0()
{
  __assert_rtn("createColorsWheel_", "FigColorsWheel.c", 84, "rangeCG >= 0");
}

void sub_1F70C()
{
  __assert_rtn("createColorsWheel_", "FigColorsWheel.c", 85, "rangeGY >= 0");
}

void sub_1F738()
{
  __assert_rtn("createColorsWheel_", "FigColorsWheel.c", 86, "rangeYR >= 0");
}

void sub_1F764()
{
  __assert_rtn("createColorsWheel_", "FigColorsWheel.c", 87, "rangeRM >= 0");
}

void sub_1F790()
{
  __assert_rtn("createColorsWheel_", "FigColorsWheel.c", 88, "rangeMB >= 0");
}

void sub_1F7BC()
{
}

void sub_1F7E8()
{
  __assert_rtn("setColorsWheelComponent_", "FigColorsWheel.c", 75, "(k >= 0) && (k < ColorsWheelContext_countColorsTransitions(ctx))");
}

void sub_1F814()
{
  __assert_rtn("ColorsWheelContext_computeColorComponent", "FigColorsWheel.c", 159, "(v >= 0.f) && (v <= 1.f)");
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryContainsKey(theDict, key);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return _CFDictionaryGetValueIfPresent(theDict, key, value);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

BOOL CGPointMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGPoint *point)
{
  return _CGPointMakeWithDictionaryRepresentation(dict, point);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectContainsRect(rect1, rect2);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return _CGRectCreateDictionaryRepresentation(a1);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  return _CGRectIntersection(r1, r2);
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectIntersectsRect(rect1, rect2);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return _CGRectMakeWithDictionaryRepresentation(dict, rect);
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return _CMGetAttachment(target, key, attachmentModeOut);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return _CMSampleBufferGetImageBuffer(sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return _CMSampleBufferGetPresentationTimeStamp(retstr, sbuf);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  return _CMTimeGetSeconds(time);
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return _CMTimeMake(retstr, value, timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return _CMTimeMakeFromDictionary(retstr, dictionaryRepresentation);
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return _CVMetalTextureCacheCreate(allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return _CVMetalTextureCacheCreateTextureFromImage(allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex, textureOut);
}

void CVMetalTextureCacheFlush(CVMetalTextureCacheRef textureCache, CVOptionFlags options)
{
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return _CVMetalTextureGetTexture(image);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return _CVPixelBufferCreate(allocator, width, height, pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetBaseAddress(pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return _CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetBytesPerRow(pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return _CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetHeight(pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return _CVPixelBufferGetHeightOfPlane(pixelBuffer, planeIndex);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetPixelFormatType(pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetWidth(pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return _CVPixelBufferGetWidthOfPlane(pixelBuffer, planeIndex);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return _CVPixelBufferLockBaseAddress(pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return _CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags);
}

uint64_t CreatePixelBuffer()
{
  return _CreatePixelBuffer();
}

uint64_t FigCFDictionaryGetCGRectIfPresent()
{
  return _FigCFDictionaryGetCGRectIfPresent();
}

uint64_t FigCFDictionaryGetDoubleIfPresent()
{
  return _FigCFDictionaryGetDoubleIfPresent();
}

uint64_t FigCaptureGetModelSpecificName()
{
  return _FigCaptureGetModelSpecificName();
}

uint64_t FigCapturePlatformGetVariant()
{
  return _FigCapturePlatformGetVariant();
}

uint64_t FigCapturePlatformIdentifierString()
{
  return _FigCapturePlatformIdentifierString();
}

uint64_t FigDebugAssert3()
{
  return _FigDebugAssert3();
}

uint64_t FigGetCFPreferenceBooleanWithDefault()
{
  return _FigGetCFPreferenceBooleanWithDefault();
}

uint64_t FigGetCFPreferenceDoubleWithDefault()
{
  return _FigGetCFPreferenceDoubleWithDefault();
}

uint64_t FigGetCFPreferenceNumberWithDefault()
{
  return _FigGetCFPreferenceNumberWithDefault();
}

uint64_t FigGetUpTime()
{
  return _FigGetUpTime();
}

uint64_t FigHostTimeToNanoseconds()
{
  return _FigHostTimeToNanoseconds();
}

uint64_t FigMetalDecRef()
{
  return _FigMetalDecRef();
}

uint64_t FigSignalErrorAt()
{
  return _FigSignalErrorAt();
}

void NSLog(NSString *format, ...)
{
}

uint64_t WritePixelBufferToFile()
{
  return _WritePixelBufferToFile();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

__double2 __sincos_stret(double a1)
{
  __double2 v3 = ___sincos_stret(a1);
  double cosval = v3.__cosval;
  double sinval = v3.__sinval;
  result.__double cosval = cosval;
  result.__double sinval = sinval;
  return result;
}

long double acos(long double __x)
{
  return _acos(__x);
}

void bzero(void *a1, size_t a2)
{
}

long double cos(long double __x)
{
  return _cos(__x);
}

uint64_t espresso_context_destroy()
{
  return _espresso_context_destroy();
}

uint64_t espresso_create_context()
{
  return _espresso_create_context();
}

uint64_t espresso_create_plan()
{
  return _espresso_create_plan();
}

uint64_t espresso_network_bind_direct_cvpixelbuffer()
{
  return _espresso_network_bind_direct_cvpixelbuffer();
}

uint64_t espresso_network_unbind_buffer()
{
  return _espresso_network_unbind_buffer();
}

uint64_t espresso_plan_add_network()
{
  return _espresso_plan_add_network();
}

uint64_t espresso_plan_build()
{
  return _espresso_plan_build();
}

uint64_t espresso_plan_destroy()
{
  return _espresso_plan_destroy();
}

uint64_t espresso_plan_execute_sync()
{
  return _espresso_plan_execute_sync();
}

float expf(float a1)
{
  return _expf(a1);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

uint64_t fig_log_get_emitter()
{
  return _fig_log_get_emitter();
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return _fputc(a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

float powf(float a1, float a2)
{
  return _powf(a1, a2);
}

long double sin(long double __x)
{
  return _sin(__x);
}

id objc_msgSend_GPUEndTime(void *a1, const char *a2, ...)
{
  return [a1 GPUEndTime];
}

id objc_msgSend_GPUStartTime(void *a1, const char *a2, ...)
{
  return [a1 GPUStartTime];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__compileDilateVerticalShaders(void *a1, const char *a2, ...)
{
  return [a1 _compileDilateVerticalShaders];
}

id objc_msgSend__compileShaders(void *a1, const char *a2, ...)
{
  return [a1 _compileShaders];
}

id objc_msgSend__extractCalibrationData(void *a1, const char *a2, ...)
{
  return [a1 _extractCalibrationData];
}

id objc_msgSend__extractCameraInfo(void *a1, const char *a2, ...)
{
  return [a1 _extractCameraInfo];
}

id objc_msgSend__longTrackFailedForLastFrame(void *a1, const char *a2, ...)
{
  return [a1 _longTrackFailedForLastFrame];
}

id objc_msgSend_allocator(void *a1, const char *a2, ...)
{
  return [a1 allocator];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_bias(void *a1, const char *a2, ...)
{
  return [a1 bias];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bufferBytesPerRow(void *a1, const char *a2, ...)
{
  return [a1 bufferBytesPerRow];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_commandBuffer(void *a1, const char *a2, ...)
{
  return [a1 commandBuffer];
}

id objc_msgSend_commandQueue(void *a1, const char *a2, ...)
{
  return [a1 commandQueue];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_computeCommandEncoder(void *a1, const char *a2, ...)
{
  return [a1 computeCommandEncoder];
}

id objc_msgSend_confidence(void *a1, const char *a2, ...)
{
  return [a1 confidence];
}

id objc_msgSend_contents(void *a1, const char *a2, ...)
{
  return [a1 contents];
}

id objc_msgSend_contextScore(void *a1, const char *a2, ...)
{
  return [a1 contextScore];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_desc(void *a1, const char *a2, ...)
{
  return [a1 desc];
}

id objc_msgSend_detectAndTrack(void *a1, const char *a2, ...)
{
  return [a1 detectAndTrack];
}

id objc_msgSend_detectedGhostBoundingBoxes(void *a1, const char *a2, ...)
{
  return [a1 detectedGhostBoundingBoxes];
}

id objc_msgSend_detectionResult(void *a1, const char *a2, ...)
{
  return [a1 detectionResult];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_endEncoding(void *a1, const char *a2, ...)
{
  return [a1 endEncoding];
}

id objc_msgSend_finishProcessing(void *a1, const char *a2, ...)
{
  return [a1 finishProcessing];
}

id objc_msgSend_firstElement(void *a1, const char *a2, ...)
{
  return [a1 firstElement];
}

id objc_msgSend_firstElementIndex(void *a1, const char *a2, ...)
{
  return [a1 firstElementIndex];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return [a1 height];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_lastElement(void *a1, const char *a2, ...)
{
  return [a1 lastElement];
}

id objc_msgSend_lastElementIndex(void *a1, const char *a2, ...)
{
  return [a1 lastElementIndex];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_maxSize(void *a1, const char *a2, ...)
{
  return [a1 maxSize];
}

id objc_msgSend_maxTotalThreadsPerThreadgroup(void *a1, const char *a2, ...)
{
  return [a1 maxTotalThreadsPerThreadgroup];
}

id objc_msgSend_newBufferDescriptor(void *a1, const char *a2, ...)
{
  return [a1 newBufferDescriptor];
}

id objc_msgSend_newTextureDescriptor(void *a1, const char *a2, ...)
{
  return [a1 newTextureDescriptor];
}

id objc_msgSend_pixelFormat(void *a1, const char *a2, ...)
{
  return [a1 pixelFormat];
}

id objc_msgSend_process(void *a1, const char *a2, ...)
{
  return [a1 process];
}

id objc_msgSend_purgeResources(void *a1, const char *a2, ...)
{
  return [a1 purgeResources];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_resetState(void *a1, const char *a2, ...)
{
  return [a1 resetState];
}

id objc_msgSend_setDefaultTuningParams(void *a1, const char *a2, ...)
{
  return [a1 setDefaultTuningParams];
}

id objc_msgSend_setup(void *a1, const char *a2, ...)
{
  return [a1 setup];
}

id objc_msgSend_shapeScore(void *a1, const char *a2, ...)
{
  return [a1 shapeScore];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_threadExecutionWidth(void *a1, const char *a2, ...)
{
  return [a1 threadExecutionWidth];
}

id objc_msgSend_tuningParams(void *a1, const char *a2, ...)
{
  return [a1 tuningParams];
}

id objc_msgSend_waitForIdle(void *a1, const char *a2, ...)
{
  return [a1 waitForIdle];
}

id objc_msgSend_waitUntilCompleted(void *a1, const char *a2, ...)
{
  return [a1 waitUntilCompleted];
}

id objc_msgSend_waitUntilScheduled(void *a1, const char *a2, ...)
{
  return [a1 waitUntilScheduled];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return [a1 width];
}