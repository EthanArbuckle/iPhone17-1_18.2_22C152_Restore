uint64_t GVSExtractGDCPolynomialFromCameraInfoByPortType(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  char *v16;
  id v17;
  char *v18;
  float v19;
  uint64_t i;
  float *v21;
  uint64_t v22;

  v5 = a1;
  v6 = a2;
  v7 = v6;
  if (v5 && v6 && a3)
  {
    v8 = [v6 objectForKeyedSubscript:kFigCaptureStreamMetadata_PortType];
    v9 = [v5 objectForKeyedSubscript:v8];
    v10 = [v9 objectForKeyedSubscript:kFigCaptureCameraInfoKey_GeometricDistortionCoefficients];
    v11 = v10;
    if (v9 && v10)
    {
      v12 = [v10 objectForKeyedSubscript:kFigCaptureStreamGDCCoefficientsKey_BasePolynomial];
      v13 = [v11 objectForKeyedSubscript:kFigCaptureStreamGDCCoefficientsKey_DynamicPolynomial];
      v14 = [v7 objectForKeyedSubscript:kFigCaptureStreamMetadata_DynamicDistortionFactor];
      if (([v8 isEqualToString:kFigCapturePortType_BackFacingCamera] & 1) == 0) {
        [v8 isEqualToString:kFigCapturePortType_BackFacingTelephotoCamera];
      }

      if ([v12 length] == &stru_20.vmsize && objc_msgSend(v13, "length") == &stru_20.vmsize)
      {
        v15 = v12;
        v16 = (char *)[v15 bytes];
        v17 = v13;
        v18 = (char *)[v17 bytes];
        [v14 floatValue];
        for (i = 0; i != 32; i += 4)
        {
          v21 = (float *)(a3 + 32 + i);
          *(v21 - 8) = *(float *)&v16[i] + (float)(v19 * *(float *)&v18[i]);
          *v21 = *(float *)&v16[i + 32] + (float)(v19 * *(float *)&v18[i + 32]);
        }

        v22 = 0;
      }
      else
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        v22 = FigSignalErrorAt();
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v22 = FigSignalErrorAt();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v22 = FigSignalErrorAt();
  }

  return v22;
}

uint64_t GVSApplyDistortionToTransforms(int32x2_t *a1, id *a2, uint64_t a3)
{
  if (!a1 || !a2 || !a3)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v34 = FigSignalErrorAt();
    v7 = 0;
    id v5 = 0;
    goto LABEL_22;
  }
  id v5 = *a2;
  id v6 = a2[1];
  v7 = v6;
  if (v6)
  {
    unsigned int v8 = [v6 isValid];
    if (v5)
    {
LABEL_6:
      unsigned int v9 = [v5 isValid];
      goto LABEL_9;
    }
  }
  else
  {
    unsigned int v8 = 0;
    if (v5) {
      goto LABEL_6;
    }
  }
  unsigned int v9 = 0;
LABEL_9:
  if ((v8 | v9) == 1)
  {
    [v7 distortionCenter];
    float v40 = v10;
    [v7 distortionCenter];
    float v36 = v11;
    [v5 distortionCenter];
    long long v37 = v12;
    [v5 distortionCenter];
    int v14 = a1[7].i32[0];
    if (v14 >= 1)
    {
      int v15 = 0;
      int v16 = 0;
      int32x2_t v17 = vadd_s32(vadd_s32(a1[1], a1[2]), (int32x2_t)-1);
      double v18 = v40;
      *((void *)&v19 + 1) = *((void *)&v37 + 1);
      double v20 = v13;
      int v21 = a1[6].i32[1];
      unsigned int v38 = HIDWORD(*(void *)&a1[1]);
      unsigned int v22 = a1[1];
      do
      {
        if (v21 >= 1)
        {
          int v23 = 0;
          int32x2_t v24 = (int32x2_t)__PAIR64__(v38, v22);
          v25 = (float *)(a3 + 36 * v16);
          do
          {
            *(int32x2_t *)&long long v19 = vmin_s32(v24, v17);
            long long v41 = v19;
            if (v8)
            {
              [v7 computeInverseScalingAtPoint:COERCE_DOUBLE(vcvt_f32_s32(*(int32x2_t *)&v19))];
              *(double *)v26.i64 = v18;
              FigMotionApplyDigitalZoomToTransform(1, v25, v27, v26, v36, v28, v29);
              long long v19 = v41;
            }
            if (v9)
            {
              float v42 = (float)SDWORD1(v19);
              float v43 = (float)(int)v19;
              GVSComputePerspectiveProjectedPoint(v25, &v43, &v42, (float)(int)v19, (float)SDWORD1(v19));
              objc_msgSend(v5, "computeScalingAtPoint:", COERCE_DOUBLE(__PAIR64__(LODWORD(v42), LODWORD(v43))));
              *(double *)v30.i64 = *(float *)&v37;
              FigMotionApplyDigitalZoomToTransform(0, v25, v31, v30, v20, v32, v33);
              long long v19 = v41;
            }
            ++v23;
            int v21 = a1[6].i32[1];
            v24.i32[0] = v19;
            v24.i32[1] = a1[7].i32[1] + DWORD1(v19);
            v25 += 9;
          }
          while (v23 < v21);
          v16 += v23;
          int v14 = a1[7].i32[0];
          unsigned int v22 = v19;
        }
        ++v15;
        v22 += a1[8].u32[0];
      }
      while (v15 < v14);
    }
  }
  uint64_t v34 = 0;
LABEL_22:

  return v34;
}

uint64_t GVSCheckDistortedTransformFits(float *a1, double *a2, int *a3, uint64_t a4, char a5, BOOL *a6)
{
  if (a1 && a2 && a3 && a4 && a6)
  {
    __asm { FMOV            V0.4S, #1.0 }
    float32x4_t v67 = _Q0;
    if (!*(unsigned char *)(a4 + 208))
    {
      uint64_t v15 = 0;
      float v16 = (float)*a3;
      float v17 = (float)a3[1];
      float v18 = (float)(v16 + (float)a3[2]) + -1.0;
      float v19 = (float)(v17 + (float)a3[3]) + -1.0;
      float v20 = (float)(v18 - v16) / 6.0;
      float v21 = (float)(v19 - v17) / 6.0;
      unsigned int v22 = (_OWORD *)(a4 + 32);
      do
      {
        *(float *)&long long v23 = v16 + (float)(v20 * (float)(int)v15);
        *((float *)&v23 + 1) = v18;
        *((float *)&v23 + 2) = v16;
        *(float *)&long long v24 = v17;
        *((float *)&v23 + 3) = v18 + (float)((float)-v20 * (float)(int)v15);
        *((float *)&v24 + 1) = v17 + (float)(v21 * (float)(int)v15);
        *((float *)&v24 + 2) = v19 + (float)((float)-v21 * (float)(int)v15);
        *((float *)&v24 + 3) = v19;
        *(v22 - 1) = v23;
        *unsigned int v22 = v24;
        ++v15;
        v22 += 2;
      }
      while (v15 != 6);
      if ([*(id *)(a4 + 8) isValid])
      {
        for (uint64_t i = 0; i != 192; i += 32)
        {
          int32x4_t v26 = (float32x4_t *)(a4 + i);
          objc_msgSend(*(id *)(a4 + 8), "computeScalingAtPointsQuad:", *(double *)(a4 + i + 16), *(double *)(a4 + i + 32));
          float32x4_t v70 = v27;
          float32x4_t v72 = vsubq_f32(v67, v27);
          [*(id *)(a4 + 8) distortionCenter];
          float32x4_t v68 = vmulq_n_f32(v72, v28);
          [*(id *)(a4 + 8) distortionCenter];
          float32x4_t v30 = *(float32x4_t *)(a4 + i + 32);
          v26[1] = vmlaq_f32(v68, v70, v26[1]);
          v26[2] = vmlaq_f32(vmulq_lane_f32(v72, v29, 1), v70, v30);
        }
      }
      *(unsigned char *)(a4 + 208) = 1;
    }
    v31.i64[0] = 0x3F0000003F000000;
    v31.i64[1] = 0x3F0000003F000000;
    float32x4_t v32 = vaddq_f32(*(float32x4_t *)(a4 + 224), v31);
    double v33 = a2[1];
    float v34 = *a2;
    float v35 = v32.f32[3] + v34;
    v31.f32[0] = *a2 + a2[2];
    float v36 = (float)(v31.f32[0] + -1.0) - v32.f32[1];
    v31.f32[0] = v33;
    float v37 = v32.f32[0] + v31.f32[0];
    v31.f32[0] = v33 + a2[3];
    float v38 = (float)(v31.f32[0] + -1.0) - v32.f32[2];
    [*(id *)a4 distortionCenter];
    float v66 = v39;
    [*(id *)a4 distortionCenter];
    float32x2_t v65 = v40;
    unint64_t v41 = 0;
    float v42 = (float32x4_t *)(a4 + 32);
    float32x4_t v69 = (float32x4_t)vdupq_n_s32(0x322BCC77u);
    while (1)
    {
      float32x4_t v43 = v42[-1];
      v44 = a1 + 8;
      float32x4_t v45 = vld1q_dup_f32(v44);
      float32x4_t v46 = vmlaq_n_f32(vmlaq_n_f32(v45, *v42, a1[7]), v43, a1[6]);
      v47.i64[0] = 0x8000000080000000;
      v47.i64[1] = 0x8000000080000000;
      float32x4_t v48 = (float32x4_t)vbslq_s8(v47, (int8x16_t)v46, (int8x16_t)vmaxnmq_f32(vabsq_f32(v46), v69));
      float32x4_t v49 = vrecpeq_f32(v48);
      float32x4_t v50 = vmulq_f32(v49, vrecpsq_f32(v48, v49));
      float32x4_t v51 = vmulq_f32(v50, vrecpsq_f32(v48, v50));
      v52 = a1 + 2;
      float32x4_t v53 = vld1q_dup_f32(v52);
      float32x4_t v54 = vmulq_f32(v51, vmlaq_n_f32(vmlaq_n_f32(v53, *v42, a1[1]), v43, *a1));
      v55 = a1 + 5;
      float32x4_t v56 = vld1q_dup_f32(v55);
      float32x4_t v71 = vmulq_f32(v51, vmlaq_n_f32(vmlaq_n_f32(v56, *v42, a1[4]), v43, a1[3]));
      float32x4_t v73 = v54;
      if ([*(id *)a4 isValid])
      {
        objc_msgSend(*(id *)a4, "computeScalingAtPointsQuad:", *(double *)v73.i64, *(double *)v71.i64);
        float32x4_t v58 = vsubq_f32(v67, v57);
        float32x4_t v59 = vmlaq_f32(vmulq_n_f32(v58, v66), v57, v73);
        float32x4_t v60 = vmlaq_f32(vmulq_lane_f32(v58, v65, 1), v57, v71);
      }
      else
      {
        float32x4_t v60 = v71;
        float32x4_t v59 = v73;
      }
      float v61 = vmaxvq_f32(v59);
      if (v35 >= vminvq_f32(v59) || v61 >= v36) {
        break;
      }
      BOOL v63 = v37 < vminvq_f32(v60);
      if (vmaxvq_f32(v60) >= v38) {
        BOOL v63 = 0;
      }
      *a6 = v63;
      if (v63 && v41 <= 4)
      {
        ++v41;
        v42 += 2;
        if ((a5 & 1) == 0) {
          continue;
        }
      }
      return 0;
    }
    *a6 = 0;
    return 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

uint64_t GVSEstimatePaddingForDistortedTransformFits(void *a1, double *a2, float32x4_t *a3)
{
  id v5 = a1;
  id v6 = v5;
  if (v5 && a2 && a3 && ([v5 isValid] & 1) != 0)
  {
    uint64_t v7 = 0;
    double v8 = a2[2];
    double v9 = a2[3];
    *(float *)&unsigned int v10 = (v8 + -1.0) / 36.0;
    double v11 = (v9 + -1.0) / 36.0;
    double v12 = a2[1];
    *(float *)&unsigned int v13 = *a2;
    *(float *)&double v12 = v12;
    *(float *)&double v8 = v8 + *(float *)&v13 + -1.0;
    double v14 = v9 + *(float *)&v12 + -1.0;
    *(float *)&double v14 = v14;
    v15.i64[0] = __PAIR64__(LODWORD(v8), v13);
    v15.i64[1] = __PAIR64__(v13, LODWORD(v8));
    float32x4_t v38 = v15;
    *(int32x2_t *)v15.f32 = vdup_lane_s32(*(int32x2_t *)&v12, 0);
    *(float *)&double v8 = v11;
    *(int32x2_t *)&v15.u32[2] = vdup_lane_s32(*(int32x2_t *)&v14, 0);
    float32x4_t v37 = v15;
    v15.i32[0] = 0;
    v15.i32[2] = 0;
    v16.i32[3] = 0;
    v16.i64[0] = v10;
    v16.f32[2] = -*(float *)&v10;
    v15.i32[1] = LODWORD(v8);
    v15.f32[3] = -*(float *)&v8;
    float32x4_t v35 = v16;
    float32x4_t v36 = v15;
    float v17 = (float32x4_t *)&v42;
    do
    {
      objc_msgSend(v6, "computeScalingAtPointsQuad:");
      float32x4_t v39 = (float32x4_t)v18;
      v40[v7] = v18;
      [v6 distortionCenter];
      v17[-1] = vmulq_f32(v39, vsubq_f32(vaddq_f32(v38, vmulq_n_f32(v35, (float)(int)v7)), (float32x4_t)vdupq_lane_s32(v19, 0)));
      [v6 distortionCenter];
      *float v17 = vmulq_f32(v39, vsubq_f32(vaddq_f32(v37, vmulq_n_f32(v36, (float)(int)v7)), (float32x4_t)vdupq_lane_s32(v20, 1)));
      v17 += 2;
      ++v7;
    }
    while (v7 != 36);
    uint64_t v21 = 0;
    v40[36] = vextq_s8(v40[0], v40[0], 4uLL);
    v43[65] = vextq_s8(v41, v41, 4uLL);
    v43[66] = vextq_s8(v42, v42, 4uLL);
    unsigned int v22 = (float32x4_t *)v43;
    float32x4_t v23 = 0uLL;
    do
    {
      float32x4_t v24 = v22[-7];
      float32x4_t v25 = v22[-6];
      float32x4_t v26 = vsubq_f32(v22[5], v24);
      float32x4_t v27 = vsubq_f32(v22[6], v25);
      float32x4_t v28 = vmlaq_f32(vmulq_f32(v27, v27), v26, v26);
      float32x4_t v29 = vmlaq_f32(vmulq_f32(vsubq_f32(v22[-1], v24), vnegq_f32(v27)), vsubq_f32(*v22, v25), v26);
      float32x4_t v30 = vrsqrteq_f32(v28);
      float32x4_t v31 = (float32x4_t)v40[v21 + 3];
      float32x4_t v32 = vrecpeq_f32(v31);
      float32x4_t v23 = vmaxnmq_f32(v23, vmulq_f32(vmulq_f32(v29, vmulq_f32(v30, vrsqrtsq_f32(v28, vmulq_f32(v30, v30)))), vmulq_f32(v32, vrecpsq_f32(v31, v32))));
      ++v21;
      v22 += 2;
    }
    while (v21 != 31);
    uint64_t v33 = 0;
    *a3 = v23;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v33 = FigSignalErrorAt();
  }

  return v33;
}

double GVSComputeGaussianAverageQuaternion(uint64_t a1, int a2, int a3, int a4, unint64_t a5, unint64_t a6, float a7, float a8)
{
  double v8 = (void *)a6;
  double v9 = (void *)a5;
  uint64_t v11 = *(void *)(a1 + 8);
  uint64_t v12 = *(void *)(*(void *)a1 + 8 * a2);
  uint64_t v13 = *(int *)(a1 + 68);
  int v14 = *(_DWORD *)(a1 + 64) + a3;
  if (v14 <= (int)v13) {
    int v14 = *(_DWORD *)(a1 + 68);
  }
  int v15 = *(_DWORD *)(a1 + 76);
  uint64_t v16 = *(int *)(a1 + 72);
  if (v14 >= (int)v16) {
    int v14 = *(_DWORD *)(a1 + 72);
  }
  uint64_t v17 = v14;
  int8x16_t v18 = (long long *)(v12 + 32 * v14);
  long long v19 = v18[1];
  long long v94 = *v18;
  long long v95 = v19;
  v20.i64[0] = *(void *)(*(void *)(a1 + 16) + 8 * v14);
  v20.i64[1] = *(void *)(v11 + 8 * v14);
  float32x4_t v91 = v20;
  BOOL v86 = (a5 | a6) != 0;
  if (v15 > 1)
  {
    float v21 = a7 * 3.0;
    if ((float)(a7 * 3.0) > 0.01)
    {
      uint64_t v87 = v12;
      int v24 = *(_DWORD *)(a1 + 84);
      if (v24 >= v14) {
        int v25 = v14;
      }
      else {
        int v25 = *(_DWORD *)(a1 + 84);
      }
      if ((int)v16 - v14 >= v24) {
        int v26 = *(_DWORD *)(a1 + 84);
      }
      else {
        int v26 = v16 - v14;
      }
      uint64_t v27 = *(void *)(a1 + 40);
      double v92 = *(double *)(v27 + 8 * v14);
      float v28 = 0.0;
      float v29 = 0.0;
      float v30 = a7;
      if (v24 > v14 && v25 + 1 <= v24)
      {
        float v31 = *(float *)(*(void *)(a1 + 48) + 4 * v13);
        float v32 = v92 - *(double *)(v27 + 8 * v13);
        int v33 = v24 - v25;
        do
        {
          float v32 = v31 + v32;
          if ((float)(v32 * 30.0) > v21) {
            break;
          }
          float v34 = expf((float)((float)(v32 * 30.0) / a7) * (float)((float)((float)(v32 * 30.0) / a7) * -0.5));
          a7 = v30;
          float v35 = v31 * v34;
          if (v35 < 0.0000001) {
            float v35 = -0.0;
          }
          float v29 = v29 + v35;
          --v33;
        }
        while (v33);
      }
      int v36 = -v25;
      int v37 = v26;
      double v8 = (void *)a6;
      if ((int)v16 - (int)v17 < v24)
      {
        float v38 = *(double *)(v27 + 8 * v16) - v92;
        float v39 = *(float *)(*(void *)(a1 + 48) + 4 * v16);
        int v40 = v24 - v37;
        float v28 = 0.0;
        do
        {
          float v38 = v39 + v38;
          if ((float)(v38 * 30.0) > v21) {
            break;
          }
          float v41 = expf((float)((float)(v38 * 30.0) / a7) * (float)((float)((float)(v38 * 30.0) / a7) * -0.5));
          a7 = v30;
          float v42 = v39 * v41;
          if (v42 < 0.0000001) {
            float v42 = -0.0;
          }
          float v28 = v28 + v42;
          --v40;
        }
        while (v40);
      }
      uint64_t v43 = *(void *)(a1 + 56);
      v44 = (float *)(v43 + 80 * (int)v17);
      if (a7 == a8) {
        int v45 = a4;
      }
      else {
        int v45 = 0;
      }
      float v46 = 0.0;
      if (v45 == 1)
      {
        float v47 = *v44;
        if (*v44 > 0.0)
        {
          uint64_t v48 = v43 + 80 * (int)v17;
          int v36 = *(_DWORD *)(v48 + 64) + 1;
          long long v49 = *(_OWORD *)(v48 + 24);
          long long v94 = *(_OWORD *)(v48 + 8);
          long long v95 = v49;
          float32x4_t v91 = *(float32x4_t *)(v48 + 48);
          float v29 = 0.0;
          float v46 = v47;
        }
      }
      char v93 = 0;
      if (v36 <= v37)
      {
        v85 = (float *)(v43 + 80 * (int)v17);
        uint64_t v50 = 0;
        if (v46 >= 0.0) {
          float v51 = v46;
        }
        else {
          float v51 = 0.0;
        }
        int v52 = v37 - 2;
        uint64_t v53 = v43 + 80 * (int)v17;
        int v54 = v37;
        v55 = (_OWORD *)(v53 + 8);
        v82 = (_DWORD *)(v53 + 64);
        v83 = (float32x4_t *)(v53 + 48);
        int v84 = v52;
        uint64_t v56 = v54 - (uint64_t)v36;
        uint64_t v57 = v52 - (uint64_t)v36;
        uint64_t v58 = 8 * v17 + 8 * v36;
        uint64_t v59 = v17 + v36;
        uint64_t v60 = 4 * v17;
        int v61 = v54 - v36 + 1;
        float v62 = -0.5;
        uint64_t v89 = v60 + 4 * v36;
        BOOL v63 = (long long *)(v87 + 32 * v59);
        float v64 = 30.0 / a7;
        do
        {
          float v65 = *(double *)(*(void *)(a1 + 40) + v58 + 8 * v50) - v92;
          if (fabsf(v64 * v65) < 3.0)
          {
            float v66 = expf((float)(v64 * v65) * (float)((float)(v64 * v65) * v62));
            if (*(unsigned char *)(*(void *)(a1 + 24) + v59 + v50)) {
              float v66 = v66
            }
                  * (float)((float)(expf((float)((float)(v65 * 30.0) / (float)(a8 * 0.5))* (float)((float)((float)(v65 * 30.0) / (float)(a8 * 0.5)) * -0.5))* 7.0)+ 1.0);
            if (v50) {
              float v67 = -0.0;
            }
            else {
              float v67 = v29;
            }
            if (v56 == v50) {
              float v68 = v28;
            }
            else {
              float v68 = -0.0;
            }
            if (*(unsigned char *)(*(void *)(a1 + 32) + v59 + v50))
            {
              float v69 = v68 + (float)(v67 + (float)(v66 * *(float *)(*(void *)(a1 + 48) + v89 + 4 * v50)));
              if (v69 >= 0.0000001)
              {
                float v70 = v51 + v69;
                float v71 = v51 / (float)(v51 + v69);
                float v88 = v71;
                if (v71 <= 0.0)
                {
                  long long v75 = v63[1];
                  long long v94 = *v63;
                  long long v95 = v75;
                }
                else
                {
                  *(void *)&long long v94 = GVSInterpolateQuaternionsLERP((uint64_t)v63, (uint64_t)&v94, 0, &v93, v71);
                  *((void *)&v94 + 1) = v72;
                  *(void *)&long long v95 = v73;
                  *((void *)&v95 + 1) = v74;
                }
                if (v86)
                {
                  v76.i64[0] = *(void *)(*(void *)(a1 + 16) + v58 + 8 * v50);
                  v76.i64[1] = *(void *)(*(void *)(a1 + 8) + v58 + 8 * v50);
                  float32x4_t v91 = vmlaq_n_f32(vmulq_n_f32(v91, v88), v76, 1.0 - v88);
                }
                float v51 = v70;
              }
            }
            float v62 = -0.5;
          }
          if (v57 == v50) {
            int v77 = v45;
          }
          else {
            int v77 = 0;
          }
          if (v77 == 1 && *(_DWORD *)(a1 + 80) == *(_DWORD *)(a1 + 76))
          {
            long long v78 = v95;
            _OWORD *v55 = v94;
            v55[1] = v78;
            float32x4_t *v83 = v91;
            float *v85 = v51;
            _DWORD *v82 = v84;
          }
          ++v50;
          v63 += 2;
        }
        while (v61 != v50);
        double v9 = (void *)a5;
        double v8 = (void *)a6;
        if (v93)
        {
LABEL_65:
          if (!v9) {
            goto LABEL_67;
          }
          goto LABEL_66;
        }
      }
      else
      {
        double v9 = (void *)a5;
      }
      FigMotionNormalizeQuaternion((double *)&v94);
      goto LABEL_65;
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  if (v9) {
LABEL_66:
  }
    *double v9 = vextq_s8((int8x16_t)v91, (int8x16_t)v91, 8uLL).u64[0];
LABEL_67:
  if (v8) {
    *double v8 = v91.i64[0];
  }
  return *(double *)&v94;
}

double GVSComputeSmoothedHorizonQuaternion(uint64_t a1, int a2, float a3)
{
  int v3 = *(_DWORD *)(a1 + 60);
  if (*(_DWORD *)(a1 + 56) + a2 <= v3) {
    int v4 = *(_DWORD *)(a1 + 60);
  }
  else {
    int v4 = *(_DWORD *)(a1 + 56) + a2;
  }
  int v5 = *(_DWORD *)(a1 + 64);
  if (v4 >= v5) {
    int v4 = *(_DWORD *)(a1 + 64);
  }
  float32x4_t v6 = *(float32x4_t *)(*(void *)a1 + 16 * v4);
  if (*(int *)(a1 + 68) <= 1 || a3 <= 0.001)
  {
    float32x4_t v44 = *(float32x4_t *)(*(void *)a1 + 16 * v4);
    fig_log_get_emitter();
    FigDebugAssert3();
    float32x4_t v6 = v44;
  }
  else
  {
    int v8 = v4;
    uint64_t v9 = *(void *)(a1 + 40);
    double v10 = *(double *)(v9 + 8 * v4);
    int v11 = *(_DWORD *)(a1 + 72);
    int v12 = v4 - v11;
    int v13 = v11 + v8;
    float v42 = 0.0;
    float v43 = 0.0;
    int v14 = v12;
    if (v12 < v3)
    {
      float v15 = v10 - *(double *)(v9 + 8 * v3);
      float v16 = fminf(fmaxf((float)(v15 + (float)(*(float *)(*(void *)(a1 + 48) + 4 * v3) * 0.5)) / a3, 0.0), 1.0);
      float v42 = (float)(0.6
                  - (float)((float)(v16 - (float)((float)(v16 * v16) * (float)(v16 * v16)))
                          + (float)((float)(v16 * (float)((float)(v16 * v16) * (float)(v16 * v16))) * 0.6)))
          * a3;
      int v14 = *(_DWORD *)(a1 + 60);
    }
    if (v13 > v5)
    {
      float v17 = *(double *)(v9 + 8 * v5) - v10;
      float v18 = fminf(fmaxf((float)(v17 + (float)(*(float *)(*(void *)(a1 + 48) + 4 * v5) * 0.5)) / a3, 0.0), 1.0);
      float v43 = (float)(0.6
                  - (float)((float)(v18 - (float)((float)(v18 * v18) * (float)(v18 * v18)))
                          + (float)((float)(v18 * (float)((float)(v18 * v18) * (float)(v18 * v18))) * 0.6)))
          * a3;
      int v13 = *(_DWORD *)(a1 + 64);
    }
    if (v14 <= v13)
    {
      uint64_t v19 = 0;
      if (v3 <= v12) {
        int v3 = v12;
      }
      uint64_t v20 = v3;
      int v21 = v13 - v3;
      uint64_t v22 = 8 * v3;
      uint64_t v23 = 4 * v3;
      uint64_t v24 = 16 * v3;
      int v25 = v13 - v3 + 1;
      float v26 = 0.0;
      float v27 = 1.0 / a3;
      do
      {
        float v28 = *(double *)(*(void *)(a1 + 40) + v22 + 8 * v19) - v10;
        float v29 = v27 * v28;
        float v30 = fabsf(v29);
        if (v30 < 1.0)
        {
          float v31 = (float)((float)((float)((float)(v29 * v29) * v30) * -4.0) + 1.0)
              + (float)((float)((float)(v29 * v29) * (float)(v29 * v29)) * 3.0);
          if (v31 >= 0.0000001)
          {
            if (*(unsigned char *)(*(void *)(a1 + 32) + v20 + v19))
            {
              float v32 = v31 * *(float *)(*(void *)(a1 + 48) + v23 + 4 * v19);
              float v33 = v42;
              if (v19) {
                float v33 = -0.0;
              }
              float v34 = v33 + v32;
              float v35 = v43;
              if (v21 != v19) {
                float v35 = -0.0;
              }
              float v36 = v26 + (float)(v35 + v34);
              *(double *)v37.i64 = GVSInterpolateQuatfNLERP(*(float32x4_t *)(*(void *)a1 + v24 + 16 * v19), v6, v26 / v36);
              float32x4_t v6 = v37;
              float v26 = v36;
            }
          }
        }
        ++v19;
      }
      while (v25 != v19);
    }
  }
  int8x16_t v38 = (int8x16_t)vmulq_f32(v6, v6);
  *(float32x2_t *)v38.i8 = vadd_f32(*(float32x2_t *)v38.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v38, v38, 8uLL));
  v38.i32[0] = vadd_f32(*(float32x2_t *)v38.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v38.i8, 1)).u32[0];
  float32x2_t v39 = vrsqrte_f32((float32x2_t)v38.u32[0]);
  float32x2_t v40 = vmul_f32(v39, vrsqrts_f32((float32x2_t)v38.u32[0], vmul_f32(v39, v39)));
  *(void *)&double result = vmulq_n_f32(v6, vmul_f32(v40, vrsqrts_f32((float32x2_t)v38.u32[0], vmul_f32(v40, v40))).f32[0]).u64[0];
  return result;
}

void GVSComputeSmoothRamp(float a1, float a2, float a3)
{
  if (a3 < a2)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else if (a3 > a2)
  {
    powf(fminf(fmaxf(a1, 0.0), a3) / a3, a3 / (float)(a3 - a2));
  }
}

float GVSComputeSmoothedDigitalZoomFactor(uint64_t a1, int a2, float a3)
{
  int v3 = *(_DWORD *)(a1 + 28);
  int v4 = *(_DWORD *)(a1 + 24) + a2;
  if (v4 <= v3) {
    int v4 = *(_DWORD *)(a1 + 28);
  }
  int v5 = *(_DWORD *)(a1 + 32);
  if (v4 >= v5) {
    int v6 = *(_DWORD *)(a1 + 32);
  }
  else {
    int v6 = v4;
  }
  uint64_t v7 = (float *)(*(void *)a1 + 20 * v6);
  float v8 = v7[1];
  if (*(int *)(a1 + 36) <= 1 || (float)(a3 * 3.0) <= 0.01)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    float v26 = v7[1];
    float v9 = *v7;
    int v10 = *(_DWORD *)(a1 + 40);
    if (v6 - v10 > v3) {
      int v3 = v6 - v10;
    }
    int v11 = v10 + v6;
    if (v11 < v5) {
      int v5 = v11;
    }
    float v12 = 0.0;
    float v13 = v9;
    if (v3 <= v5)
    {
      uint64_t v14 = *(void *)(a1 + 8);
      double v15 = *(double *)(v14 + 8 * v6);
      float v16 = (double *)(v14 + 8 * v3);
      float v17 = (float *)(*(void *)a1 + 20 * v3);
      int v18 = v5 - v3 + 1;
      float v19 = 30.0 / a3;
      float v13 = v9;
      do
      {
        float v20 = *v16 - v15;
        float v21 = v19 * v20;
        if (fabsf(v21) < 3.0)
        {
          float v22 = expf(v21 * (float)(v21 * -0.5));
          if (v22 >= 0.0000001)
          {
            if (v12 <= 0.0) {
              float v13 = v22 * *v17;
            }
            else {
              float v13 = v13 + (float)(*v17 * v22);
            }
            float v23 = -0.0;
            if (v12 > 0.0) {
              float v23 = v12;
            }
            float v12 = v23 + v22;
          }
        }
        ++v16;
        v17 += 5;
        --v18;
      }
      while (v18);
    }
    float v24 = 1.0;
    if (v12 >= 0.0000001) {
      float v24 = v12;
    }
    return v26 * expf((float)(v13 / v24) - v9);
  }
  return v8;
}

float GVSComputeDilatedTotalZoomFactor(uint64_t a1, int a2, int a3)
{
  int v3 = *(_DWORD *)(a1 + 28);
  if (*(_DWORD *)(a1 + 24) + a3 <= v3) {
    int v4 = *(_DWORD *)(a1 + 28);
  }
  else {
    int v4 = *(_DWORD *)(a1 + 24) + a3;
  }
  int v5 = *(_DWORD *)(a1 + 32);
  if (v4 >= v5) {
    int v6 = *(_DWORD *)(a1 + 32);
  }
  else {
    int v6 = v4;
  }
  float v7 = *(float *)(*(void *)a1 + 20 * v6 + 12);
  if (*(int *)(a1 + 36) <= 1 || a2 < 1)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    int v8 = v6 - a2;
    if (v6 - a2 <= v3) {
      int v8 = *(_DWORD *)(a1 + 28);
    }
    if (v6 + a2 < v5) {
      int v5 = v6 + a2;
    }
    if (v8 <= v5)
    {
      float v9 = (float *)(*(void *)a1 + 20 * v8 + 12);
      int v10 = v5 - v8 + 1;
      do
      {
        float v11 = *v9;
        v9 += 5;
        float v7 = fmaxf(v7, v11);
        --v10;
      }
      while (v10);
    }
  }
  return v7;
}

float GVSComputeSmoothedDilatedDigitalZoomFactor(uint64_t a1, int a2, int a3)
{
  int v5 = *(_DWORD *)(a1 + 28);
  int v4 = *(_DWORD *)(a1 + 32);
  int v6 = *(_DWORD *)(a1 + 24) + a3;
  if (v6 <= v5) {
    int v6 = *(_DWORD *)(a1 + 28);
  }
  if (v6 >= v4) {
    int v7 = *(_DWORD *)(a1 + 32);
  }
  else {
    int v7 = v6;
  }
  int v8 = v7;
  uint64_t v9 = *(void *)a1 + 20 * v7;
  float v10 = *(float *)(v9 + 4);
  float v11 = *(float *)(v9 + 16);
  if (a2 < 1 || *(int *)(a1 + 36) <= 1)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    if (v8 - a2 > v5) {
      int v5 = v8 - a2;
    }
    if (v8 + a2 < v4) {
      int v4 = v8 + a2;
    }
    float v12 = 0.0;
    if (v5 <= v4)
    {
      float v13 = 1.0 / (float)((float)a2 / 3.0);
      int v14 = v5 - v8;
      double v15 = (float *)(*(void *)a1 + 20 * v5 + 16);
      int v16 = v4 - v5 + 1;
      do
      {
        float v17 = expf((float)(v13 * (float)v14) * (float)((float)(v13 * (float)v14) * -0.5));
        if (v17 >= 0.0000001)
        {
          if (v12 <= 0.0) {
            float v11 = v17 * *v15;
          }
          else {
            float v11 = v11 + (float)(*v15 * v17);
          }
          if (v12 <= 0.0) {
            float v18 = -0.0;
          }
          else {
            float v18 = v12;
          }
          float v12 = v18 + v17;
        }
        ++v14;
        v15 += 5;
        --v16;
      }
      while (v16);
    }
    if (v12 >= 0.0000001) {
      float v19 = v12;
    }
    else {
      float v19 = 1.0;
    }
    float v11 = v11 / v19;
  }
  return v10 * expf(v11 - *(float *)(*(void *)a1 + 20 * v8));
}

uint64_t sbp_gvs_invalidate()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!*(unsigned char *)(DerivedStorage + 24))
  {
    uint64_t v1 = DerivedStorage;
    *(unsigned char *)(DerivedStorage + 24) = 1;
    *(void *)uint64_t DerivedStorage = 0;
    *(void *)(DerivedStorage + 8) = 0;
    v2 = *(void **)(DerivedStorage + 88);
    if (v2)
    {
      AffineTransformFinish(v2);
      AffineTransformContextRelease(*(CFTypeRef *)(v1 + 88));
      *(void *)(v1 + 88) = 0;
      if (*(_DWORD *)(v1 + 228))
      {
        unint64_t v3 = 0;
        do
        {
          unint64_t v4 = v1 + 8 * v3;
          int v5 = *(const void **)(v4 + 256);
          if (v5)
          {
            CFRelease(v5);
            *(void *)(v4 + 256) = 0;
          }
          int v6 = *(const void **)(v4 + 288);
          if (v6)
          {
            CFRelease(v6);
            *(void *)(v4 + 288) = 0;
          }
          ++v3;
        }
        while (v3 < *(unsigned int *)(v1 + 228));
      }
    }
    int v7 = *(void **)(v1 + 112);
    if (v7)
    {
      [v7 finishProcessing];
      [*(id *)(v1 + 112) purgeResources];
      int v8 = *(void **)(v1 + 112);
      *(void *)(v1 + 112) = 0;
    }
    uint64_t v9 = *(void **)(v1 + 29712);
    if (v9)
    {
      *(void *)(v1 + 29712) = 0;
      free(v9);
    }
    float v10 = *(void **)(v1 + 96);
    *(void *)(v1 + 96) = 0;

    float v11 = *(void **)(v1 + 400);
    *(void *)(v1 + 400) = 0;

    float v12 = *(void **)(v1 + 27128);
    *(void *)(v1 + 27128) = 0;

    float v13 = *(void **)(v1 + 29552);
    *(void *)(v1 + 29552) = 0;

    int v14 = *(void **)(v1 + 28880);
    *(void *)(v1 + 28880) = 0;

    double v15 = *(void **)(v1 + 28888);
    *(void *)(v1 + 28888) = 0;

    int v16 = *(void **)(v1 + 29120);
    *(void *)(v1 + 29120) = 0;

    float v17 = *(void **)(v1 + 29728);
    *(void *)(v1 + 29728) = 0;

    float v18 = *(void **)(v1 + 29736);
    *(void *)(v1 + 29736) = 0;

    [*(id *)(v1 + 48) removeAllObjects];
    [*(id *)(v1 + 64) removeAllObjects];
    [*(id *)(v1 + 56) removeAllObjects];
    float v19 = *(void **)(v1 + 48);
    *(void *)(v1 + 48) = 0;

    float v20 = *(void **)(v1 + 64);
    *(void *)(v1 + 64) = 0;

    float v21 = *(void **)(v1 + 56);
    *(void *)(v1 + 56) = 0;

    float v22 = *(const void **)(v1 + 72);
    if (v22)
    {
      CFRelease(v22);
      float v23 = *(void **)(v1 + 72);
      *(void *)(v1 + 72) = 0;
    }
    float v24 = *(const void **)(v1 + 416);
    if (v24)
    {
      CFRelease(v24);
      *(void *)(v1 + 416) = 0;
    }
    int v25 = *(const void **)(v1 + 28856);
    if (v25)
    {
      CFRelease(v25);
      *(void *)(v1 + 28856) = 0;
    }
    if ((*(_DWORD *)(v1 + 27148) - 1) <= 2) {
      _cinematic_freeRingBuffers((void *)v1);
    }
    sbp_gvs_freeDerivedVectorsAndSphereLensMovements(v1);
    if (*(_DWORD *)(v1 + 29596))
    {
      sbp_ltm_deallocateLtcCorrectionTexture(v1);
      [*(id *)(v1 + 29632) purgeResources];
      float v26 = *(void **)(v1 + 29632);
      *(void *)(v1 + 29632) = 0;
    }
    float v27 = *(void **)(v1 + 30040);
    *(void *)(v1 + 30040) = 0;

    float v28 = *(void **)(v1 + 30056);
    *(void *)(v1 + 30056) = 0;

    float v29 = *(void **)(v1 + 30048);
    *(void *)(v1 + 30048) = 0;

    float v30 = *(void **)(v1 + 30072);
    *(void *)(v1 + 30072) = 0;

    float v31 = *(void **)(v1 + 30080);
    *(void *)(v1 + 30080) = 0;

    float v32 = *(void **)(v1 + 30088);
    *(void *)(v1 + 30088) = 0;

    float v33 = *(void **)(v1 + 30096);
    *(void *)(v1 + 30096) = 0;

    *(void *)(v1 + 30144) = 2143289344;
    __asm { FMOV            V0.2S, #1.0 }
    *(void *)(v1 + 30152) = _D0;
    *(_OWORD *)(v1 + 30160) = *(_OWORD *)&kCMTimeInvalid.value;
    *(void *)(v1 + 30176) = kCMTimeInvalid.epoch;
  }
  return 0;
}

uint64_t FigSampleBufferProcessorCreateForGyroVideoStabilization(const __CFDictionary *a1, void *a2)
{
  uint64_t v276 = 0;
  int valuePtr = 0;
  if (!a2) {
    goto LABEL_357;
  }
  FigSampleBufferProcessorGetClassID();
  uint64_t v3 = CMDerivedObjectCreate();
  if (v3)
  {
    uint64_t v93 = v3;
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_104;
  }
  v261 = a2;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  int v6 = *(void **)(DerivedStorage + 48);
  *(void *)(DerivedStorage + 48) = v5;

  if (!*(void *)(DerivedStorage + 48)) {
    goto LABEL_357;
  }
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  int v8 = *(void **)(DerivedStorage + 56);
  *(void *)(DerivedStorage + 56) = v7;

  if (!*(void *)(DerivedStorage + 56)
    || (id v9 = objc_alloc_init((Class)NSMutableDictionary),
        float v10 = *(void **)(DerivedStorage + 64),
        *(void *)(DerivedStorage + 64) = v9,
        v10,
        !*(void *)(DerivedStorage + 64)))
  {
LABEL_357:
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_358;
  }
  float v11 = (BOOL *)(DerivedStorage + 10680);
  *(_DWORD *)(DerivedStorage + 44) = 0;
  *(_DWORD *)(DerivedStorage + 28) = 1028443341;
  *(_DWORD *)(DerivedStorage + 212) = 1;
  *(unsigned char *)(DerivedStorage + 28137) = 0;
  *(unsigned char *)(DerivedStorage + 10684) = 0;
  float v12 = objc_alloc_init(GVSGravityDataContext);
  float v13 = *(void **)(DerivedStorage + 27128);
  *(void *)(DerivedStorage + 27128) = v12;

  int v14 = *(void **)(DerivedStorage + 27128);
  if (!v14)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    CFDictionaryRef v94 = 0;
    uint64_t v93 = 4294954510;
    goto LABEL_319;
  }
  uint64_t v15 = DerivedStorage + 30032;
  uint64_t v16 = DerivedStorage + 29528;
  uint64_t v17 = DerivedStorage + 28864;
  float v18 = (unsigned __int8 *)(DerivedStorage + 28280);
  v266 = (unsigned char *)(DerivedStorage + 28137);
  [v14 setExtractGravityData:0];
  LODWORD(v19) = 10.0;
  [*(id *)(DerivedStorage + 27128) setGravityFilterTimescale:v19];
  *(_DWORD *)(DerivedStorage + 40) = 0;
  *(_DWORD *)(DerivedStorage + 29140) = 1061675650;
  *(unsigned char *)(DerivedStorage + 84) = 0;
  *(void *)(DerivedStorage + 27416) = 0x3FEFAE147AE147AELL;
  *(_DWORD *)(DerivedStorage + 28132) = -1;
  *(unsigned char *)(DerivedStorage + 329) = 0;
  v263 = (unsigned char *)(DerivedStorage + 392);
  *(_WORD *)(DerivedStorage + 392) = 256;
  *(void *)(DerivedStorage + 168) = 3;
  *(unsigned char *)(DerivedStorage + 200) = 1;
  *(unsigned char *)(DerivedStorage + 203) = 0;
  *(_DWORD *)(DerivedStorage + 176) = 6;
  *(_DWORD *)(DerivedStorage + 188) = 32;
  *(_DWORD *)(DerivedStorage + 196) = 1065353216;
  *(_DWORD *)(DerivedStorage + 28804) = -1082130432;
  *(_DWORD *)(DerivedStorage + 27148) = 0;
  v269 = (int *)(DerivedStorage + 27148);
  v265 = (float *)(DerivedStorage + 29444);
  *(void *)(DerivedStorage + 29444) = 0xF3F000000;
  v267 = (int *)(DerivedStorage + 29520);
  v268 = (int *)(DerivedStorage + 29448);
  *(void *)(DerivedStorage + 29520) = 0x4000000000000000;
  +[GVSMotionBlurFilter defaultSettings];
  CGPoint origin = rect.origin;
  *(CGFloat *)(DerivedStorage + 29544) = rect.size.width;
  *(CGPoint *)(DerivedStorage + 29528) = origin;
  *(_DWORD *)(DerivedStorage + 29156) = 1053609165;
  *(void *)(DerivedStorage + 29168) = 0x3F36B3CC4EE655AALL;
  *(unsigned char *)(DerivedStorage + 216) = 0;
  *(_DWORD *)(DerivedStorage + 27108) = 1065252553;
  *(_WORD *)(DerivedStorage + 29760) = 0;
  *(unsigned char *)(DerivedStorage + 28796) = 1;
  CFDictionaryRef v21 = a1;
  if (!a1)
  {
LABEL_96:
    if ((*(_DWORD *)(DerivedStorage + 172) - 1) <= 2) {
      *(void *)(DerivedStorage + 120) = CFDictionaryGetValue(v21, kFigVideoStabilizationSampleBufferProcessorOption_IspProcessingSession);
    }
    int v92 = *v267;
    if (*v267)
    {
      if (v92 == 1)
      {
        *(_DWORD *)(v17 + 660) = 1148846080;
        *(unsigned char *)uint64_t v16 = 1;
        *(_DWORD *)(v16 + 16) = 0;
        goto LABEL_111;
      }
      BOOL v95 = v92 <= 9;
    }
    else
    {
      BOOL v95 = *v265 <= 0.999;
    }
    char v96 = !v95;
    *(unsigned char *)uint64_t v16 = v96;
LABEL_111:
    *float v11 = FigMotionHardwareAvailable() == 0;
    *(_DWORD *)(DerivedStorage + 27140) = -1;
    *(_DWORD *)float v18 = *v18;
    float v97 = 0.0 * 0.0174532925;
    *(float *)(v16 + 192) = v97;
    if (*(int *)(v16 + 64) >= 1 && *(_DWORD *)(v16 + 68))
    {
      *(unsigned char *)(v16 + 97) = 1;
      *(_DWORD *)(v16 + 100) = 0;
    }
    v18[529] = v18[529] == 1;
    v18[530] = v18[530] == 1;
    *(unsigned char *)(DerivedStorage + 203) = *(unsigned char *)(DerivedStorage + 203) == 1;
    *(_DWORD *)uint64_t v17 = -1;
    if ([*(id *)(DerivedStorage + 29120) count]) {
      BOOL v98 = 1;
    }
    else {
      BOOL v98 = *(_DWORD *)v17 > 0;
    }
    *(unsigned char *)(v17 + 272) = v98;
    if (*v11) {
      *(unsigned char *)(DerivedStorage + 84) = 1;
    }
    *(_DWORD *)(v16 + 248) = 0;
    CFDictionaryGetValue(v21, kFigVideoStabilizationSampleBufferProcessorOption_VideoGreenGhostMitigationParameters);
    CFDictionaryRef v99 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CFDictionaryRef v94 = v99;
    if (!v99)
    {
      *(unsigned char *)uint64_t v15 = 0;
      v102 = *(void **)(DerivedStorage + 30040);
      *(void *)(DerivedStorage + 30040) = 0;
      goto LABEL_130;
    }
    uint64_t v101 = v276;
    uint64_t v100 = HIDWORD(v276);
    v102 = [(__CFDictionary *)v99 objectForKeyedSubscript:@"BrightLightMitigationParameters"];
    v103 = [(__CFDictionary *)v94 objectForKeyedSubscript:@"LowLightMitigationParameters"];
    *(unsigned char *)uint64_t v15 = 1;
    *(_DWORD *)(v15 + 4) = 0;
    if (!v102) {
      goto LABEL_122;
    }
    v104 = *(void **)(DerivedStorage + 28856);
    v105 = [*(id *)(DerivedStorage + 96) commandQueue];
    v106 = v104;
    float v18 = (unsigned __int8 *)(DerivedStorage + 28280);
    uint64_t v107 = _loadAndConfigureVideoDeghosting(v106, v105, v102, v100 | (v101 << 32));
    v108 = *(void **)(DerivedStorage + 30048);
    *(void *)(DerivedStorage + 30048) = v107;

    if (!*(void *)(DerivedStorage + 30048))
    {
      fig_log_get_emitter();
      uint64_t v259 = v262;
      LODWORD(v258) = 0;
      FigDebugAssert3();
      FigSignalErrorAt();
      if (v103)
      {
LABEL_123:
        v109 = objc_msgSend(v103, "objectForKeyedSubscript:", @"LuxLevelThresholdOFF", v258, v259);
        [v109 floatValue];
        *(_DWORD *)(v15 + 4) = v110;

        v111 = *(void **)(DerivedStorage + 28856);
        v112 = [*(id *)(DerivedStorage + 96) commandQueue];
        v113 = v111;
        float v18 = (unsigned __int8 *)(DerivedStorage + 28280);
        uint64_t v114 = _loadAndConfigureVideoDeghosting(v113, v112, v103, v100 | (v101 << 32));
        v115 = *(void **)(DerivedStorage + 30056);
        *(void *)(DerivedStorage + 30056) = v114;

        if (!*(void *)(DerivedStorage + 30056))
        {
          fig_log_get_emitter();
          uint64_t v259 = v262;
          LODWORD(v258) = 0;
          FigDebugAssert3();
          FigSignalErrorAt();
        }
      }
    }
    else
    {
LABEL_122:
      if (v103) {
        goto LABEL_123;
      }
    }
    LODWORD(rect.origin.x) = 0;
    LODWORD(v280) = 0;
    if (FigCFDictionaryGetIntIfPresent() && FigCFDictionaryGetIntIfPresent())
    {
      [*(id *)(DerivedStorage + 30056) setSensorBinningFactorHorizontal:LODWORD(rect.origin.x)];
      [*(id *)(DerivedStorage + 30056) setSensorBinningFactorVertical:v280];
      [*(id *)(DerivedStorage + 30048) setSensorBinningFactorHorizontal:LODWORD(rect.origin.x)];
      [*(id *)(DerivedStorage + 30048) setSensorBinningFactorVertical:v280];
    }

    uint64_t v17 = DerivedStorage + 28864;
LABEL_130:

    _resetFirstFrameParameters(DerivedStorage);
    int v117 = v276;
    int v116 = HIDWORD(v276);
    int v118 = *v269;
    if (*v269 == 5)
    {
      if (*(_DWORD *)(DerivedStorage + 172) || *(unsigned char *)(DerivedStorage + 29704)) {
        goto LABEL_148;
      }
      if (v18[529]) {
        v18[529] = 0;
      }
      if (v18[530]) {
        v18[530] = 0;
      }
    }
    if (v118 != 4 && *(unsigned char *)(DerivedStorage + 27144)
      || (*(unsigned char *)(v17 + 600) || *(unsigned char *)(DerivedStorage + 224)) && *(_DWORD *)(DerivedStorage + 172)
      || (v118 - 1) >= 3 && *(unsigned char *)(DerivedStorage + 28128)
      || (long long v279 = 0uLL,
          long long v278 = 0uLL,
          sbp_configureOverscanParameters(DerivedStorage, v116, v117, (uint64_t)&v278, (uint64_t *)&v279),
          DWORD2(v279) + 2 * v279 != v116)
      || HIDWORD(v279) + 2 * DWORD1(v279) != v117)
    {
LABEL_148:
      fig_log_get_emitter();
      uint64_t v259 = v262;
      LODWORD(v258) = 0;
      FigDebugAssert3();
      uint64_t v93 = FigSignalErrorAt();
      if (v93)
      {
LABEL_318:
        fig_log_get_emitter();
        FigDebugAssert3();
        goto LABEL_319;
      }
      goto LABEL_149;
    }
    *(_DWORD *)(DerivedStorage + 128) = v116;
    *(_DWORD *)(DerivedStorage + 132) = v117;
    *(_OWORD *)(DerivedStorage + 136) = v279;
    *(_OWORD *)(DerivedStorage + 152) = v278;
    int v119 = *(_DWORD *)(DerivedStorage + 168);
    if ((v119 - 1) > 1)
    {
      if (v119 == 4) {
        *(_DWORD *)(DerivedStorage + 188) = 1;
      }
    }
    else
    {
      *(_DWORD *)(DerivedStorage + 176) = 1;
      *(unsigned char *)(DerivedStorage + 27136) = 0;
    }
    int v154 = *(_DWORD *)(DerivedStorage + 172);
    if (v154 != 3 && v154)
    {
      int v155 = *(_DWORD *)(DerivedStorage + 176);
      if (v155 != 1)
      {
        int v156 = *(_DWORD *)(DerivedStorage + 148);
        int v157 = *(_DWORD *)(DerivedStorage + 188);
        goto LABEL_186;
      }
    }
    else
    {
      int v155 = *(_DWORD *)(DerivedStorage + 176);
      if (v155 != 1)
      {
        int v156 = *(_DWORD *)(DerivedStorage + 148);
        int v157 = *(_DWORD *)(DerivedStorage + 188);
        if (v155 >= 2)
        {
          int v158 = (v156 - 2) / v157 + 2;
          goto LABEL_187;
        }
LABEL_186:
        int v158 = (v156 + v157 - 1) / v157;
LABEL_187:
        *(_DWORD *)(DerivedStorage + 180) = v158;
        if (*(unsigned char *)(v17 + 272))
        {
          int v159 = (*(_DWORD *)(DerivedStorage + 144) - 2) / v157 + 2;
        }
        else
        {
          int v157 = 0;
          int v159 = 1;
        }
        *(_DWORD *)(DerivedStorage + 192) = v157;
        *(_DWORD *)(DerivedStorage + 184) = v159;
        if (v155 > 6)
        {
          uint64_t v93 = 4294954514;
          goto LABEL_318;
        }
LABEL_192:
        if (*(unsigned char *)(DerivedStorage + 29704) || *v269 == 5)
        {
          v160 = malloc_type_malloc(36 * v159 * v158 + 36, 0x56894B57uLL);
          *(void *)(DerivedStorage + 29712) = v160;
          if (!v160)
          {
            fig_log_get_emitter();
            FigDebugAssert3();
            uint64_t v93 = 4294954510;
            goto LABEL_318;
          }
          if (*(unsigned char *)(DerivedStorage + 29704)) {
            goto LABEL_212;
          }
          int v154 = *(_DWORD *)(DerivedStorage + 172);
        }
        if ((v154 - 1) < 3)
        {
          *(void *)&long long v284 = &off_49A50;
          *((void *)&v284 + 1) = &off_49A80;
          *(void *)&long long v288 = &off_49A68;
          *((void *)&v288 + 1) = &off_49A98;
          *(void *)&long long v285 = &off_49AB0;
          *(void *)&long long v289 = &off_49AC8;
          v161 = +[NSDictionary dictionaryWithObjects:&v288 forKeys:&v284 count:3];
          v162 = [VISISPRendererV2 alloc];
          uint64_t v163 = *(void *)(DerivedStorage + 120);
          v164 = [*(id *)(DerivedStorage + 96) commandQueue];
          v165 = [(VISISPRendererV2 *)v162 initWithISPProcessingSession:v163 metalContext:0 metalCommandQueue:v164];
          v166 = *(void **)(DerivedStorage + 112);
          *(void *)(DerivedStorage + 112) = v165;

          v167 = *(void **)(DerivedStorage + 112);
          if (v167)
          {
            HIWORD(v274) = v117;
            LOWORD(v274) = v116;
            [v167 setInputSize:v274];
            HIWORD(v273) = WORD2(*(void *)(DerivedStorage + 29672));
            LOWORD(v273) = *(void *)(DerivedStorage + 29672);
            [*(id *)(DerivedStorage + 112) setOutputSize:v273];
            int32x2_t v168 = vrev64_s32(*(int32x2_t *)(DerivedStorage + 188));
            HIWORD(v272) = v168.i16[2];
            LOWORD(v272) = v168.i16[0];
            [*(id *)(DerivedStorage + 112) setGridSize:v272];
            [*(id *)(DerivedStorage + 112) setExtendedOutputRowsToFill:*(unsigned int *)(DerivedStorage + 44)];
            v169 = *(void **)(DerivedStorage + 112);
            v170 = +[NSNumber numberWithInt:*(unsigned int *)(DerivedStorage + 172)];
            v171 = [v161 objectForKeyedSubscript:v170];
            uint64_t v93 = (uint64_t)objc_msgSend(v169, "prepareToProcess:", objc_msgSend(v171, "unsignedIntValue"));

            if (!v93)
            {

              uint64_t v17 = DerivedStorage + 28864;
              float v18 = (unsigned __int8 *)(DerivedStorage + 28280);
              goto LABEL_212;
            }
            fig_log_get_emitter();
            uint64_t v259 = v262;
            LODWORD(v258) = v93;
            FigDebugAssert3();
          }
          else
          {
            fig_log_get_emitter();
            uint64_t v259 = v262;
            LODWORD(v258) = 0;
            FigDebugAssert3();
            uint64_t v93 = FigSignalErrorAt();
          }

          uint64_t v15 = DerivedStorage + 30032;
          if (v93) {
            goto LABEL_318;
          }
          goto LABEL_149;
        }
        if (!v154)
        {
          v172 = [*(id *)(DerivedStorage + 96) commandQueue];
          *(void *)(DerivedStorage + 88) = AffineTransformContextAlloc(v172);

          v173 = *(void **)(DerivedStorage + 88);
          if (!v173) {
            goto LABEL_148;
          }
          AffineTransformSetOptions(v173, (const char *)(*(_DWORD *)(DerivedStorage + 44) > 0));
          sbp_initializeGPUWithRenderMethod(DerivedStorage);
          if (*(unsigned char *)(DerivedStorage + 224))
          {
            LODWORD(rect.origin.x) = 0;
            LODWORD(v280) = 0;
            AffineTransformGetBlurBuffersDimensions(*(void **)(DerivedStorage + 88), *(_DWORD *)(DerivedStorage + 29672), *(_DWORD *)(DerivedStorage + 29676), (int *)&rect, (int *)&v280);
            uint64_t v174 = 0;
            *(_DWORD *)(DerivedStorage + 228) = 4;
            while (1)
            {
              uint64_t PixelBuffer = CreatePixelBuffer();
              *(void *)(DerivedStorage + 8 * v174 + 256) = PixelBuffer;
              if (!PixelBuffer) {
                goto LABEL_148;
              }
              if (*(unsigned char *)(v15 + 33))
              {
                uint64_t v176 = CreatePixelBuffer();
                *(void *)(DerivedStorage + 8 * v174 + 288) = v176;
                if (!v176) {
                  goto LABEL_148;
                }
              }
              if (++v174 >= *(int *)(DerivedStorage + 228))
              {
                *(int32x2_t *)(DerivedStorage + 232) = vmovn_s64(vcvtq_s64_f64(*(float64x2_t *)(DerivedStorage + 29472)));
                *(void *)&long long v177 = *(void *)(DerivedStorage + 152);
                *((void *)&v177 + 1) = *(void *)(DerivedStorage + 29672);
                *(_OWORD *)(DerivedStorage + 240) = v177;
                break;
              }
            }
          }
          AffineTransformConfigureBlurBorderPixels(*(void **)(DerivedStorage + 88), (const char *)(DerivedStorage + 224));
          float v18 = (unsigned __int8 *)(DerivedStorage + 28280);
          if (*v269 == 3) {
            goto LABEL_213;
          }
          AffineTransformSetOverscanFill(*(void **)(DerivedStorage + 88), (const char *)*(unsigned int *)(DerivedStorage + 136), *(unsigned int *)(DerivedStorage + 140));
        }
LABEL_212:
        if (*v269 != 3)
        {
          CFDictionaryRef v180 = *(const __CFDictionary **)(DerivedStorage + 28856);
          uint64_t v179 = DerivedStorage + 29528;
          if (v180
            && (CFDictionaryGetValue(v180, kFigCapturePortType_BackFacingTelephotoCamera)
             || CFDictionaryGetValue(*(CFDictionaryRef *)(DerivedStorage + 28856), kFigCapturePortType_BackFacingSuperWideCamera))&& !FigMotionGetBravoDataFromDictionary(*(const __CFDictionary **)(DerivedStorage + 28856), (uint64_t)v18))
          {
            if (!*(_DWORD *)v18) {
              *(_DWORD *)float v18 = 6;
            }
            FigMotionAdjustBravoDataForReferenceCamera((uint64_t)v18);
          }
          int v178 = *(_DWORD *)v18;
          if (*(_DWORD *)v18) {
            unsigned char *v266 = 1;
          }
LABEL_225:
          if (v18[516] && ((v178 & 4) == 0 || (*v269 - 4) <= 0xFFFFFFFC)) {
            v18[516] = 0;
          }
          if (*v263)
          {
            if ((*v269 - 1) > 3)
            {
              unsigned char *v263 = 0;
            }
            else
            {
              v181 = *(void **)(DerivedStorage + 28856);
              id v277 = 0;
              uint64_t v93 = GVSExtractCameraGeometryFromCameraInfoByPortType(v181, &v277);
              id v182 = v277;
              id v183 = v277;
              if (v93)
              {
                fig_log_get_emitter();
                FigDebugAssert3();

                goto LABEL_318;
              }
              objc_storeStrong((id *)(DerivedStorage + 400), v182);
              if ((*(_DWORD *)v18 & 2) != 0) {
                *(_DWORD *)v18 &= ~2u;
              }
              unsigned char *v266 = 1;

              uint64_t v179 = DerivedStorage + 29528;
            }
          }
          if (*(float *)(v179 + 192) > 0.0)
          {
            [*(id *)(DerivedStorage + 27128) setExtractGravityData:1];
            if (!*v266) {
              unsigned char *v266 = 1;
            }
          }
          if (*(unsigned char *)(v179 + 260))
          {
            *(float *)(v179 + 268) = fminf(fmaxf(*(float *)(v179 + 268), 0.0), 1.0);
            *(float *)(v179 + 272) = fmaxf(*(float *)(v179 + 272), 1.0);
            float v184 = (float)*v268;
            float v185 = (float)(v184 / *v265) / 30.0;
            int v186 = vcvtms_s32_f32(v185 * (float)*(int *)(v179 + 276));
            int v187 = v186 & ~(v186 >> 31);
            if (v187 >= (int)(float)(v184 + (float)((float)(v185 * -3.0) * *(float *)(v179 + 264)))) {
              int v187 = (int)(float)(v184 + (float)((float)(v185 * -3.0) * *(float *)(v179 + 264)));
            }
            *(_DWORD *)(v179 + 276) = v187;
          }
          int v188 = *(_DWORD *)v17;
          if (*(int *)v17 < 1)
          {
            if (v188)
            {
LABEL_250:
              long long v283 = 0u;
              long long v281 = 0u;
              long long v282 = 0u;
              long long v280 = 0u;
              id v196 = *(id *)(DerivedStorage + 29120);
              id v197 = [v196 countByEnumeratingWithState:&v280 objects:&rect count:16];
              if (v197)
              {
                id v198 = v197;
                int v199 = 0;
                uint64_t v200 = *(void *)v281;
                do
                {
                  for (uint64_t i = 0; i != v198; uint64_t i = (char *)i + 1)
                  {
                    if (*(void *)v281 != v200) {
                      objc_enumerationMutation(v196);
                    }
                    v202 = objc_msgSend(*(id *)(DerivedStorage + 29120), "objectForKeyedSubscript:", *(void *)(*((void *)&v280 + 1) + 8 * i), v258, v259);
                    v199 |= [v202 unsignedIntValue];
                  }
                  id v198 = [v196 countByEnumeratingWithState:&v280 objects:&rect count:16];
                }
                while (v198);

                if (v199)
                {
                  v203 = objc_alloc_init(GVSDistortionModelEven14);
                  v204 = *(void **)(DerivedStorage + 28880);
                  *(void *)(DerivedStorage + 28880) = v203;
                }
                uint64_t v17 = DerivedStorage + 28864;
                uint64_t v205 = DerivedStorage + 29528;
                if ((v199 & 2) == 0) {
                  goto LABEL_263;
                }
                v206 = objc_alloc_init(GVSDistortionModelEven14);
                id v196 = *(id *)(DerivedStorage + 28888);
                *(void *)(DerivedStorage + 28888) = v206;
              }
              else
              {
                uint64_t v205 = DerivedStorage + 29528;
              }

LABEL_263:
              if (!*v266 && (*(void *)(DerivedStorage + 28880) || *(void *)(DerivedStorage + 28888))) {
                unsigned char *v266 = 1;
              }
              if (!*(unsigned char *)v205)
              {
LABEL_271:
                size_t v212 = *(unsigned int *)(DerivedStorage + 180);
                if ((int)v212 < 1 || (int v213 = *(_DWORD *)(DerivedStorage + 184), v213 < 1))
                {
                  fig_log_get_emitter();
                  uint64_t v259 = v262;
                  LODWORD(v258) = 0;
                  FigDebugAssert3();
                  uint64_t v257 = FigSignalErrorAt();
                  if (!v257) {
                    goto LABEL_277;
                  }
                  uint64_t v93 = v257;
LABEL_375:
                  sbp_gvs_freeDerivedVectorsAndSphereLensMovements(DerivedStorage);
                  fig_log_get_emitter();
                  goto LABEL_317;
                }
                if (*v266)
                {
                  v214 = malloc_type_calloc(v212, 8uLL, 0x100004000313F17uLL);
                  *(void *)(DerivedStorage + 28144) = v214;
                  if (!v214)
                  {
LABEL_374:
                    fig_log_get_emitter();
                    FigDebugAssert3();
                    uint64_t v93 = 4294954510;
                    goto LABEL_375;
                  }
                  LODWORD(v212) = *(_DWORD *)(DerivedStorage + 180);
                  int v213 = *(_DWORD *)(DerivedStorage + 184);
                }
                v215 = malloc_type_calloc((int)v212 * (uint64_t)v213, 0x24uLL, 0x10000408AA14F5FuLL);
                *(void *)(DerivedStorage + 27408) = v215;
                if (v215)
                {
LABEL_277:
                  int v216 = *(_DWORD *)(DerivedStorage + 152);
                  if (v216 <= *(_DWORD *)(DerivedStorage + 156)) {
                    int v216 = *(_DWORD *)(DerivedStorage + 156);
                  }
                  *(float *)(v17 + 296) = (float)((float)v216 * 0.5) / 10.0;
                  if ((*v269 - 1) > 2) {
                    goto LABEL_149;
                  }
                  if (*v269 == 2) {
                    uint64_t v217 = 1;
                  }
                  else {
                    uint64_t v217 = (*v268 + 1);
                  }
                  *(_DWORD *)(v17 + 516) = v217;
                  if (*(_DWORD *)(v205 + 68))
                  {
                    float v218 = (float)*v268 / *v265;
                    uint64_t v219 = 80;
                    if (v218 < 50.0) {
                      uint64_t v219 = 76;
                    }
                    uint64_t v220 = (float)((float)(*(float *)(v205 + v219) * v218) * 0.5);
                    uint64_t v221 = *(unsigned int *)(DerivedStorage + 29592);
                    v222 = objc_msgSend(*(id *)(DerivedStorage + 96), "commandQueue", v258, v259);
                    uint64_t v223 = v220;
                    uint64_t v205 = DerivedStorage + 29528;
                    uint64_t v224 = +[STFIBPProvider STFVideoProcessorForVersion:v221 ringBufferSize:v217 historySize:v223 cmdQueue:v222];
                    v225 = *(void **)(DerivedStorage + 29632);
                    *(void *)(DerivedStorage + 29632) = v224;

                    uint64_t v17 = DerivedStorage + 28864;
                    v226 = *(void **)(DerivedStorage + 29632);
                    if (v226
                      || (fig_log_get_emitter(),
                          uint64_t v259 = v262,
                          LODWORD(v258) = 0,
                          FigDebugAssert3(),
                          (v226 = *(void **)(DerivedStorage + 29632)) != 0))
                    {
                      objc_msgSend(v226, "setLtmStabilizationMode:", *(unsigned int *)(DerivedStorage + 29596), v258, v259);
                      [*(id *)(DerivedStorage + 29632) setTcrMode:*(unsigned int *)(DerivedStorage + 29600)];
                      LODWORD(v227) = *(_DWORD *)(DerivedStorage + 29616);
                      [*(id *)(DerivedStorage + 29632) setTcrSkyMaskStrength:v227];
                      LODWORD(v228) = *(_DWORD *)(DerivedStorage + 29612);
                      [*(id *)(DerivedStorage + 29632) setTcrGlobalStrength:v228];
                      LODWORD(v229) = *(_DWORD *)(DerivedStorage + 29620);
                      [*(id *)(DerivedStorage + 29632) setTcrExtraMaskStrength:v229];
                      LODWORD(v230) = *(_DWORD *)(DerivedStorage + 29604);
                      [*(id *)(DerivedStorage + 29632) setTemporalWindowTimeDefault:v230];
                    }
                  }
                  int v231 = *(_DWORD *)(v17 + 516);
                  if (!*(_DWORD *)(v205 + 248)) {
                    *(_DWORD *)(v205 + 248) = v231;
                  }
                  uint64_t v232 = *(int *)(v17 + 584);
                  *(_DWORD *)(v17 + 572) = v232 + 1;
                  v233 = malloc_type_calloc(v231, 8uLL, 0x2004093837F09uLL);
                  *(void *)(DerivedStorage + 29352) = v233;
                  if (v233)
                  {
                    if (*(unsigned char *)v15)
                    {
                      v234 = malloc_type_calloc(*(int *)(v17 + 516), 0x18uLL, 0x10A00403F27F3CFuLL);
                      *(void *)(DerivedStorage + 29360) = v234;
                      if (!v234)
                      {
                        id v252 = (id)FigSignalErrorAt();
                        goto LABEL_315;
                      }
                    }
                    *(void *)(DerivedStorage + 29392) = 0;
                    *(void *)(DerivedStorage + 29400) = 0;
                    if (!*v266)
                    {
LABEL_314:
                      v250 = objc_alloc_init(GVSSmoothingBuffers);
                      v251 = *(void **)(DerivedStorage + 29384);
                      *(void *)(DerivedStorage + 29384) = v250;

                      id v252 = [*(id *)(DerivedStorage + 29384) allocateBufferWithSize:(2 * v232) | 1 allocateForRollSmoothing:*(float *)(DerivedStorage + 29720) > 0.0];
LABEL_315:
                      uint64_t v93 = (uint64_t)v252;
                      if (v252)
                      {
LABEL_316:
                        _cinematic_freeRingBuffers((void *)DerivedStorage);
                        fig_log_get_emitter();
LABEL_317:
                        FigDebugAssert3();
                        goto LABEL_318;
                      }
                      if ((*v269 & 0xFFFFFFFE) == 2) {
                        *(unsigned char *)(DerivedStorage + 10681) = 1;
                      }
                      if (*(unsigned char *)v15)
                      {
                        if ((v254 = *(void **)(DerivedStorage + 30048)) != 0
                          && (id v255 = [v254 initGhostInformationLookAheadForSize:*(unsigned int *)(v17 + 516)], v255)|| (v256 = *(void **)(DerivedStorage + 30056)) != 0&& (id v255 = objc_msgSend(v256, "initGhostInformationLookAheadForSize:", *(unsigned int *)(v17 + 516)), v255))
                        {
                          uint64_t v93 = (uint64_t)v255;
                          fig_log_get_emitter();
                          goto LABEL_317;
                        }
                      }
LABEL_149:
                      if (!*(unsigned char *)(v15 + 32) && !*(unsigned char *)(v15 + 33))
                      {
LABEL_175:
                        uint64_t v93 = 0;
                        void *v261 = 0;
                        goto LABEL_319;
                      }
                      CFDictionaryRef theDicta = v94;
                      objc_msgSend(*(id *)(DerivedStorage + 96), "commandQueue", v258, v259);
                      id v120 = (id)objc_claimAutoreleasedReturnValue();
                      v121 = +[NSString stringWithFormat:@"%@V%d", @"SmartStyle", 1];
                      v122 = +[NSString stringWithFormat:@"%@/%@.bundle", @"/System/Library/VideoProcessors", v121];
                      v123 = +[NSString stringWithFormat:@"CMI%@V%d", @"SmartStyleProcessor", 1];
                      v124 = +[NSBundle bundleWithPath:v122];
                      if (!v124)
                      {
                        v125 = +[NSString stringWithFormat:@"/AppleInternal/VideoProcessors/%@.bundle", v121];
                        v124 = +[NSBundle bundleWithPath:v125];

                        if (!v124)
                        {
                          fig_log_get_emitter();
                          FigDebugAssert3();
                          uint64_t v93 = FigSignalErrorAt();
                          v145 = 0;
                          id v135 = 0;
                          goto LABEL_174;
                        }
                      }
                      if ([v124 loadAndReturnError:0])
                      {
                        v126 = +[NSString stringWithFormat:@"CMISmartStyleProcessorInputOutputV%d", 1];
                        *(void *)(DerivedStorage + 30104) = [v124 classNamed:v126];

                        if (*(void *)(DerivedStorage + 30104))
                        {
                          uint64_t v127 = *(void *)(DerivedStorage + 30184);
                          id v128 = objc_alloc((Class)FigMetalAllocatorBackend);
                          v129 = +[FigMetalContext metalDevice];
                          id v130 = [v128 initWithDevice:v129 allocatorType:2];

                          if (v130 && (v131 = objc_opt_new()) != 0)
                          {
                            v132 = v131;
                            [v131 setMemSize:5242880];
                            [v132 setWireMemory:1];
                            [v132 setLabel:@"VIS-SmartStyle-FigMetalAllocatorBackend"];
                            [v132 setMemoryPoolId:v127];
                            if (![v130 setupWithDescriptor:v132])
                            {
                              v133 = objc_opt_new();
                              if (v133)
                              {
                                v134 = v133;
                                [v133 setAllocatorBackend:v130];
                                id v135 = v134;

                                id v136 = objc_msgSend(objc_alloc((Class)objc_msgSend(v124, "classNamed:", v123)), "initWithOptionalMetalCommandQueue:", v120);
                                v137 = *(void **)(DerivedStorage + 30072);
                                *(void *)(DerivedStorage + 30072) = v136;

                                v138 = *(void **)(DerivedStorage + 30072);
                                if (!v138) {
                                  goto LABEL_329;
                                }
                                [v138 setInstanceLabel:@"VIS-Integrate"];
                                v139 = objc_msgSend(objc_msgSend(v124, "classNamed:", v123), "getDefaultProcessorConfigurationForStreaming");
                                [*(id *)(DerivedStorage + 30072) setConfiguration:v139];

                                v140 = [*(id *)(DerivedStorage + 30072) configuration];

                                if (!v140) {
                                  goto LABEL_329;
                                }
                                [*(id *)(DerivedStorage + 30072) setExternalMemoryResource:v135];
                                id v141 = [*(id *)(DerivedStorage + 30072) setup];
                                if (v141
                                  || (id v141 = [*(id *)(DerivedStorage + 30072) prepareToProcess:2],
                                      v141))
                                {
                                  uint64_t v93 = (uint64_t)v141;
                                  fig_log_get_emitter();
                                  FigDebugAssert3();
                                  v145 = 0;
                                  goto LABEL_174;
                                }
                                id v142 = objc_msgSend(objc_alloc((Class)objc_msgSend(v124, "classNamed:", v123)), "initWithOptionalMetalCommandQueue:", v120);
                                v143 = *(void **)(DerivedStorage + 30080);
                                *(void *)(DerivedStorage + 30080) = v142;

                                v144 = *(void **)(DerivedStorage + 30080);
                                if (v144)
                                {
                                  [v144 setInstanceLabel:@"VIS-Apply"];
                                  v145 = objc_msgSend(objc_msgSend(v124, "classNamed:", v123), "getDefaultProcessorConfigurationForStreaming");
                                  if (v145)
                                  {
                                    [*(id *)(DerivedStorage + 30080) setExternalMemoryResource:v135];
                                    unsigned int v146 = *(_DWORD *)(DerivedStorage + 30112);
                                    if (v146 <= objc_msgSend(objc_msgSend(v124, "classNamed:", v123), "getRequiredInputBufferSizeForFilterType:", 3))id v147 = objc_msgSend(objc_msgSend(v124, "classNamed:", v123), "getRequiredInputBufferSizeForFilterType:", 3); {
                                    else
                                    }
                                      id v147 = (id)*(unsigned int *)(DerivedStorage + 30112);
                                    [v145 setTemporalFilterInputBufferSize:v147];
                                    [*(id *)(DerivedStorage + 30080) setConfiguration:v145];
                                    id v148 = [*(id *)(DerivedStorage + 30080) setup];
                                    if (!v148)
                                    {
                                      id v148 = [*(id *)(DerivedStorage + 30080) prepareToProcess:4];
                                      if (!v148)
                                      {
                                        uint64_t v149 = 2 * (FigGetCFPreferenceBooleanWithDefault() != 0);
                                        id v150 = [objc_alloc((Class)CMISmartStyleUtilitiesV1) initWithOptionalMetalCommandQueue:v120 useCase:v149 processingType:1 optionalExternalMemoryResource:v135];
                                        v151 = *(void **)(DerivedStorage + 30088);
                                        *(void *)(DerivedStorage + 30088) = v150;

                                        if (*(void *)(DerivedStorage + 30088))
                                        {
                                          if (!*(unsigned char *)(DerivedStorage + 30067)
                                            || (id v152 = [objc_alloc((Class)CMISmartStyleUtilitiesV1) initWithOptionalMetalCommandQueue:v120 useCase:v149 processingType:0 optionalExternalMemoryResource:v135], v153 = *(void **)(DerivedStorage + 30096), *(void *)(DerivedStorage + 30096) = v152, v153, *(void *)(DerivedStorage + 30096)))
                                          {
                                            uint64_t v93 = 0;
                                            goto LABEL_174;
                                          }
                                        }
                                        goto LABEL_349;
                                      }
                                    }
                                    uint64_t v93 = (uint64_t)v148;
                                    fig_log_get_emitter();
                                    FigDebugAssert3();
LABEL_174:

                                    CFDictionaryRef v94 = theDicta;
                                    if (v93) {
                                      goto LABEL_318;
                                    }
                                    goto LABEL_175;
                                  }
                                }
                                else
                                {
LABEL_329:
                                  v145 = 0;
                                }
LABEL_349:
                                uint64_t v93 = 4294954510;
                                goto LABEL_174;
                              }
                            }
                            fig_log_get_emitter();
                            FigDebugAssert3();
                          }
                          else
                          {
                            fig_log_get_emitter();
                            FigDebugAssert3();
                          }
                        }
                      }
                      v145 = 0;
                      id v135 = 0;
                      goto LABEL_349;
                    }
                    v235 = malloc_type_calloc(*(int *)(v17 + 572), 8uLL, 0x2004093837F09uLL);
                    *(void *)(DerivedStorage + 29392) = v235;
                    if (v235)
                    {
                      v236 = malloc_type_calloc(*(int *)(v17 + 572), 8uLL, 0x2004093837F09uLL);
                      *(void *)(DerivedStorage + 29400) = v236;
                      if (v236)
                      {
                        LODWORD(v237) = *(_DWORD *)(v17 + 572);
                        if ((int)v237 >= 1)
                        {
                          uint64_t v238 = 0;
                          do
                          {
                            *(void *)(*(void *)(DerivedStorage + 29392) + 8 * v238) = malloc_type_malloc(8* *(int *)(DerivedStorage + 180), 0x100004000313F17uLL);
                            if (!*(void *)(*(void *)(DerivedStorage + 29392) + 8 * v238)) {
                              goto LABEL_354;
                            }
                            *(void *)(*(void *)(DerivedStorage + 29400) + 8 * v238) = malloc_type_malloc(0x38uLL, 0x100004000313F17uLL);
                            if (!*(void *)(*(void *)(DerivedStorage + 29400) + 8 * v238)) {
                              goto LABEL_354;
                            }
                            ++v238;
                            uint64_t v237 = *(int *)(v17 + 572);
                          }
                          while (v238 < v237);
                        }
                        uint64_t v239 = DerivedStorage + 29528;
                        if (*(void *)(DerivedStorage + 28880) || *(void *)(DerivedStorage + 28888))
                        {
                          v240 = malloc_type_calloc((int)v237, 0xF0uLL, 0x10800406B7F651AuLL);
                          *(void *)(DerivedStorage + 29408) = v240;
                          if (!v240) {
                            goto LABEL_354;
                          }
                          LODWORD(v237) = *(_DWORD *)(v17 + 572);
                          if ((int)v237 >= 1)
                          {
                            uint64_t v241 = 0;
                            uint64_t v242 = 0;
                            do
                            {
                              if (*(void *)(DerivedStorage + 28880))
                              {
                                v243 = objc_alloc_init(GVSDistortionModelEven14);
                                uint64_t v244 = *(void *)(DerivedStorage + 29408);
                                v245 = *(void **)(v244 + v241);
                                *(void *)(v244 + v241) = v243;

                                if (!*(void *)(*(void *)(DerivedStorage + 29408) + v241)) {
                                  goto LABEL_354;
                                }
                              }
                              if (*(void *)(DerivedStorage + 28888))
                              {
                                v246 = objc_alloc_init(GVSDistortionModelEven14);
                                uint64_t v247 = *(void *)(DerivedStorage + 29408) + v241;
                                v248 = *(void **)(v247 + 8);
                                *(void *)(v247 + 8) = v246;

                                if (!*(void *)(*(void *)(DerivedStorage + 29408) + v241 + 8)) {
                                  goto LABEL_354;
                                }
                              }
                              ++v242;
                              uint64_t v237 = *(int *)(v17 + 572);
                              v241 += 240;
                            }
                            while (v242 < v237);
                          }
                          uint64_t v239 = DerivedStorage + 29528;
                        }
                        if (*(float *)(v239 + 192) <= 0.0) {
                          goto LABEL_314;
                        }
                        v249 = malloc_type_calloc((int)v237, 0xCuLL, 0x10000403E1C8BA9uLL);
                        *(void *)(DerivedStorage + 29416) = v249;
                        if (v249) {
                          goto LABEL_314;
                        }
                      }
                    }
                  }
LABEL_354:
                  fig_log_get_emitter();
                  FigDebugAssert3();
                  uint64_t v93 = 4294954510;
                  goto LABEL_316;
                }
                goto LABEL_374;
              }
              v207 = [GVSMotionBlurFilter alloc];
              CGPoint v208 = *(CGPoint *)v205;
              rect.size.width = *(CGFloat *)(v205 + 16);
              rect.CGPoint origin = v208;
              v209 = [(GVSMotionBlurFilter *)v207 initWithSettings:&rect];
              v210 = *(void **)(DerivedStorage + 29552);
              *(void *)(DerivedStorage + 29552) = v209;

              v211 = *(void **)(DerivedStorage + 29552);
              if (v211)
              {
                if (*v267 == 11) {
                  [v211 suspend];
                }
                goto LABEL_271;
              }
              goto LABEL_148;
            }
            id v190 = objc_alloc_init((Class)NSDictionary);
          }
          else
          {
            uint64_t v189 = v188 & 3;
            id v190 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:*(void *)(DerivedStorage + 29120)];
            id v191 = [objc_alloc((Class)NSNumber) initWithUnsignedInt:v189];
            [v190 setObject:v191 forKeyedSubscript:kFigCapturePortType_BackFacingCamera];

            int v192 = *(_DWORD *)v17;
            if ((*(_DWORD *)v17 & 4) != 0)
            {
              id v193 = [objc_alloc((Class)NSNumber) initWithUnsignedInt:v189];
              [v190 setObject:v193 forKeyedSubscript:kFigCapturePortType_BackFacingTelephotoCamera];

              int v192 = *(_DWORD *)v17;
            }
            if ((v192 & 8) != 0)
            {
              id v194 = [objc_alloc((Class)NSNumber) initWithUnsignedInt:v189];
              [v190 setObject:v194 forKeyedSubscript:kFigCapturePortType_BackFacingSuperWideCamera];
            }
          }
          v195 = *(void **)(DerivedStorage + 29120);
          *(void *)(DerivedStorage + 29120) = v190;

          goto LABEL_250;
        }
LABEL_213:
        int v178 = *(_DWORD *)v18;
        if (*(_DWORD *)v18)
        {
          LOBYTE(v178) = 0;
          *(_DWORD *)float v18 = 0;
        }
        uint64_t v179 = DerivedStorage + 29528;
        goto LABEL_225;
      }
    }
    *(_OWORD *)(DerivedStorage + 180) = xmmword_47250;
    int v158 = 1;
    int v159 = 1;
    goto LABEL_192;
  }
  Value = CFDictionaryGetValue(a1, kFigCaptureSampleBufferProcessorOption_SensorIDDictionary);
  if (Value) {
    Value = CFRetain(Value);
  }
  *(void *)(DerivedStorage + 416) = Value;
  float v23 = (void *)CFDictionaryGetValue(a1, kFigVideoStabilizationSampleBufferProcessorOption_DistortionCompensationEnabledPortTypes);
  float v24 = (void *)CFDictionaryGetValue(a1, kFigVideoStabilizationSampleBufferProcessorOption_DistortionCorrectionEnabledPortTypes);
  id v25 = v23;
  id v264 = v24;
  id v26 = objc_alloc_init((Class)NSMutableDictionary);
  if (v26)
  {
    long long v290 = 0u;
    long long v291 = 0u;
    long long v288 = 0u;
    long long v289 = 0u;
    id v260 = v25;
    id v27 = v25;
    id v28 = [v27 countByEnumeratingWithState:&v288 objects:&rect count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v289;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v289 != v30) {
            objc_enumerationMutation(v27);
          }
          [v26 setObject:&off_49A20 forKeyedSubscript:*(void *)(*((void *)&v288 + 1) + 8 * (void)j)];
        }
        id v29 = [v27 countByEnumeratingWithState:&v288 objects:&rect count:16];
      }
      while (v29);
    }

    long long v286 = 0u;
    long long v287 = 0u;
    long long v284 = 0u;
    long long v285 = 0u;
    id v32 = v264;
    id v33 = [v32 countByEnumeratingWithState:&v284 objects:&v280 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v285;
      while (2)
      {
        for (k = 0; k != v34; k = (char *)k + 1)
        {
          if (*(void *)v285 != v35) {
            objc_enumerationMutation(v32);
          }
          uint64_t v37 = *(void *)(*((void *)&v284 + 1) + 8 * (void)k);
          int8x16_t v38 = [v26 allKeys];
          unsigned __int8 v39 = [v38 containsObject:v37];

          if (v39)
          {
            fig_log_get_emitter();
            uint64_t v259 = v262;
            LODWORD(v258) = 0;
            FigDebugAssert3();

            id v40 = 0;
            goto LABEL_28;
          }
          [v26 setObject:&off_49A38 forKeyedSubscript:v37];
        }
        id v34 = [v32 countByEnumeratingWithState:&v284 objects:&v280 count:16];
        if (v34) {
          continue;
        }
        break;
      }
    }

    id v40 = v26;
LABEL_28:
    uint64_t v15 = DerivedStorage + 30032;
    uint64_t v17 = DerivedStorage + 28864;
    uint64_t v16 = DerivedStorage + 29528;
    CFDictionaryRef v21 = a1;
    id v25 = v260;
  }
  else
  {
    fig_log_get_emitter();
    uint64_t v259 = v262;
    LODWORD(v258) = 0;
    FigDebugAssert3();
    id v40 = 0;
  }

  float v41 = *(void **)(DerivedStorage + 29120);
  *(void *)(DerivedStorage + 29120) = v40;

  if (!*(void *)(DerivedStorage + 29120))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_358:
    uint64_t v93 = FigSignalErrorAt();
    goto LABEL_104;
  }
  FigCFDictionaryGetInt32IfPresent();
  float v42 = [(__CFDictionary *)v21 objectForKeyedSubscript:kFigCaptureSampleBufferProcessorOption_MetalCommandQueue];
  FigCFDictionaryGetInt32IfPresent();
  id v43 = [objc_alloc((Class)FigMetalContext) initWithoutLibraryUsingOptionalCommandQueue:v42];
  float32x4_t v44 = *(void **)(DerivedStorage + 96);
  *(void *)(DerivedStorage + 96) = v43;

  int v45 = *(void **)(DerivedStorage + 96);
  if (!v45) {
    goto LABEL_362;
  }
  if (*(_DWORD *)(DerivedStorage + 108))
  {
    uint64_t v46 = FigDispatchQueueCreateWithPriority();
    float v11 = (BOOL *)(DerivedStorage + 10680);
    if (!v46) {
      goto LABEL_362;
    }
    float v47 = (void *)v46;
    uint64_t v48 = [*(id *)(DerivedStorage + 96) commandQueue];
    [v48 setSubmissionQueue:v47];
    [v48 setCompletionQueue:v47];

    int v45 = *(void **)(DerivedStorage + 96);
  }
  else
  {
    float v11 = (BOOL *)(DerivedStorage + 10680);
  }
  objc_msgSend(v45, "setQueuePriority:", *(unsigned int *)(DerivedStorage + 104), v258, v259);
  FigCFDictionaryGetFloatIfPresent();
  FigCFDictionaryGetInt32IfPresent();
  FigCFDictionaryGetInt32IfPresent();
  FigCFDictionaryGetInt32IfPresent();
  FigCFDictionaryGetFloatIfPresent();
  FigCFDictionaryGetBooleanIfPresent();
  FigCFDictionaryGetBooleanIfPresent();
  FigCFDictionaryGetBooleanIfPresent();
  FigCFDictionaryGetBooleanIfPresent();
  FigCFDictionaryGetBooleanIfPresent();
  *(unsigned char *)(DerivedStorage + 328) = *(unsigned char *)(DerivedStorage + 224);
  FigCFDictionaryGetBooleanIfPresent();
  LOBYTE(rect.origin.x) = 0;
  if (FigCFDictionaryGetBooleanIfPresent() && LOBYTE(rect.origin.x))
  {
    if (*v269 != 4) {
      goto LABEL_362;
    }
    *(unsigned char *)(DerivedStorage + 200) = 0;
  }
  FigCFDictionaryGetBooleanIfPresent();
  CFDictionaryRef v49 = (const __CFDictionary *)CFDictionaryGetValue(v21, kFigVideoStabilizationSampleBufferProcessorOption_LivePhotoCleanOutputRect);
  if (!v49) {
    goto LABEL_42;
  }
  CGSize size = CGRectZero.size;
  rect.CGPoint origin = CGRectZero.origin;
  rect.CGSize size = size;
  if (!CGRectMakeWithDictionaryRepresentation(v49, &rect))
  {
LABEL_362:
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v93 = FigSignalErrorAt();
    goto LABEL_103;
  }
  CGSize v51 = rect.size;
  *(CGPoint *)(DerivedStorage + 29472) = rect.origin;
  *(CGSize *)(DerivedStorage + 29488) = v51;
  *(unsigned char *)(v17 + 600) = 1;
LABEL_42:
  FigCFDictionaryGetBooleanIfPresent();
  FigCFDictionaryGetBooleanIfPresent();
  int v52 = CFDictionaryGetValue(v21, kFigCaptureSampleBufferProcessorOption_CameraInfoByPortType);
  uint64_t v53 = *(const void **)(DerivedStorage + 28856);
  *(void *)(DerivedStorage + 28856) = v52;
  if (v52) {
    CFRetain(v52);
  }
  if (v53) {
    CFRelease(v53);
  }
  FigCFDictionaryGetFloatIfPresent();
  FigCFDictionaryGetInt32IfPresent();
  FigCFDictionaryGetInt32IfPresent();
  FigCFDictionaryGetBooleanIfPresent();
  FigCFDictionaryGetBooleanIfPresent();
  FigCFDictionaryGetBooleanIfPresent();
  FigCFDictionaryGetInt64IfPresent();
  *(unsigned char *)(v15 + 34) = 0;
  if (*(unsigned char *)(v15 + 33) && !*(unsigned char *)(v15 + 32)) {
    goto LABEL_362;
  }
  *(_WORD *)(v15 + 35) = 257;
  *(_DWORD *)(v15 + 80) = *v268 + 1;
  *(_OWORD *)(v15 + 84) = xmmword_47240;
  *(_OWORD *)(DerivedStorage + 30160) = *(_OWORD *)&kCMTimeNegativeInfinity.value;
  *(void *)(DerivedStorage + 30176) = kCMTimeNegativeInfinity.epoch;
  *(void *)(DerivedStorage + 29592) = 0;
  int v54 = CFDictionaryGetValue(v21, kFigVideoStabilizationSampleBufferProcessorOption_VideoSTFParameters);
  v55 = [v54 objectForKeyedSubscript:@"Version"];
  *(_DWORD *)(v16 + 64) = [v55 intValue];

  if (*(int *)(v16 + 64) >= 1)
  {
    uint64_t v56 = [v54 objectForKeyedSubscript:@"LTMStabilizationMode"];
    if (v56)
    {
      uint64_t v57 = [v54 objectForKeyedSubscript:@"LTMStabilizationMode"];
      *(_DWORD *)(v16 + 68) = [v57 unsignedIntValue];
    }
    else
    {
      *(_DWORD *)(v16 + 68) = 3;
    }

    uint64_t v58 = [v54 objectForKeyedSubscript:@"TCRMode"];
    if (v58)
    {
      uint64_t v59 = [v54 objectForKeyedSubscript:@"TCRMode"];
      *(_DWORD *)(v16 + 72) = [v59 unsignedIntValue];
    }
    else
    {
      *(_DWORD *)(v16 + 72) = 1;
    }

    uint64_t v60 = [v54 objectForKeyedSubscript:@"TCRGlobalStrength"];
    if (v60)
    {
      int v61 = [v54 objectForKeyedSubscript:@"TCRGlobalStrength"];
      [v61 floatValue];
      *(_DWORD *)(v16 + 84) = v62;
    }
    else
    {
      *(_DWORD *)(v16 + 84) = 1050253722;
    }

    BOOL v63 = [v54 objectForKeyedSubscript:@"TCRSkyMaskStrength"];
    if (v63)
    {
      float v64 = [v54 objectForKeyedSubscript:@"TCRSkyMaskStrength"];
      [v64 floatValue];
      *(_DWORD *)(v16 + 88) = v65;
    }
    else
    {
      *(_DWORD *)(v16 + 88) = 1058642330;
    }

    float v66 = [v54 objectForKeyedSubscript:@"TCRExtraMaskStrength"];
    if (v66)
    {
      float v67 = [v54 objectForKeyedSubscript:@"TCRExtraMaskStrength"];
      [v67 floatValue];
      *(_DWORD *)(v16 + 92) = v68;
    }
    else
    {
      *(_DWORD *)(v16 + 92) = 1058642330;
    }

    float v69 = [v54 objectForKeyedSubscript:@"TemporalFilterWindowTime"];
    if (v69)
    {
      float v70 = [v54 objectForKeyedSubscript:@"TemporalFilterWindowTime"];
      [v70 floatValue];
      *(_DWORD *)(v16 + 76) = v71;
    }
    else
    {
      *(_DWORD *)(v16 + 76) = 1065353216;
    }

    uint64_t v72 = [v54 objectForKeyedSubscript:@"TemporalFilterWindowTime60Fps"];
    if (v72)
    {
      uint64_t v73 = [v54 objectForKeyedSubscript:@"TemporalFilterWindowTime60Fps"];
      [v73 floatValue];
      *(_DWORD *)(v16 + 80) = v74;
    }
    else
    {
      *(_DWORD *)(v16 + 80) = 1061997773;
    }

    long long v75 = [v54 objectForKeyedSubscript:@"EnableCvisLtcCorrectionLutCompression"];
    *(unsigned char *)(v16 + 96) = [v75 BOOLValue];

    float32x4_t v76 = [v54 objectForKeyedSubscript:@"EnableCvisLtmWithGlobalToneMapping"];
    if (v76)
    {
      int v77 = [v54 objectForKeyedSubscript:@"EnableCvisLtmWithGlobalToneMapping"];
      *(unsigned char *)(v16 + 128) = [v77 BOOLValue];
    }
    else
    {
      *(unsigned char *)(v16 + 128) = 0;
    }
  }
  FigCFDictionaryGetBooleanIfPresent();
  *(unsigned char *)(v16 + 260) = 0;
  *(void *)(v16 + 272) = 1066192077;
  *(void *)(DerivedStorage + 29792) = 0x3F00000040200000;
  CFDictionaryRef v78 = (const __CFDictionary *)CFDictionaryGetValue(v21, kFigVideoStabilizationSampleBufferProcessorOption_InputPixelBufferAttributes);
  if (!v78) {
    goto LABEL_369;
  }
  CFDictionaryRef v79 = v78;
  if (!FigCFDictionaryGetInt32IfPresent()) {
    goto LABEL_369;
  }
  if (!FigCFDictionaryGetInt32IfPresent()) {
    goto LABEL_369;
  }
  CFNumberRef v80 = (const __CFNumber *)CFDictionaryGetValue(v79, kCVPixelBufferPixelFormatTypeKey);
  if (!v80) {
    goto LABEL_369;
  }
  CFNumberRef v81 = v80;
  CFTypeID v82 = CFGetTypeID(v80);
  if (v82 == CFNumberGetTypeID())
  {
    CFNumberGetValue(v81, kCFNumberSInt32Type, &valuePtr);
    CFDictionaryRef v83 = a1;
    goto LABEL_83;
  }
  CFTypeID v84 = CFGetTypeID(v81);
  if (v84 == CFArrayGetTypeID())
  {
    CFDictionaryRef v83 = a1;
    if (CFArrayGetCount(v81) >= 1)
    {
      CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v81, 0);
      CFNumberGetValue(ValueAtIndex, kCFNumberSInt32Type, &valuePtr);
LABEL_83:
      if (CFDictionaryGetValue(v83, kFigVideoStabilizationSampleBufferProcessorOption_OutputPixelBufferAttributes)
        && FigCFDictionaryGetInt32IfPresent()
        && FigCFDictionaryGetInt32IfPresent())
      {
        if (*(int *)(v16 + 148) >= 1440) {
          *(_DWORD *)(DerivedStorage + 188) = 42;
        }
        uint64_t v17 = DerivedStorage + 28864;
        CFDictionaryRef v21 = a1;
        if (*(int *)(v16 + 144) >= 1921) {
          *(_DWORD *)(DerivedStorage + 188) = 64;
        }
        uint64_t v86 = CFDictionaryGetValue(a1, kFigCaptureSampleBufferProcessorProperty_PixelBufferPoolAllocationSemaphore);
        uint64_t v87 = *(void **)(DerivedStorage + 72);
        *(void *)(DerivedStorage + 72) = v86;

        float v88 = *(const void **)(DerivedStorage + 72);
        float v18 = (unsigned __int8 *)(DerivedStorage + 28280);
        if (v88) {
          CFRetain(v88);
        }
        CFNumberRef v89 = (const __CFNumber *)CFDictionaryGetValue(a1, kFigVideoStabilizationSampleBufferProcessorOption_TransformPlatform);
        if (!v89) {
          goto LABEL_95;
        }
        CFNumberRef v90 = v89;
        LODWORD(rect.origin.x) = -1;
        CFNumberType Type = CFNumberGetType(v89);
        CFNumberGetValue(v90, Type, &rect);
        if (LODWORD(rect.origin.x) <= 3)
        {
          *(_DWORD *)(DerivedStorage + 172) = LODWORD(rect.origin.x);
LABEL_95:

          goto LABEL_96;
        }
        goto LABEL_101;
      }
      fig_log_get_emitter();
LABEL_370:
      FigDebugAssert3();
      uint64_t v93 = FigSignalErrorAt();
      goto LABEL_102;
    }
LABEL_369:
    fig_log_get_emitter();
    goto LABEL_370;
  }
LABEL_101:
  uint64_t v93 = 4294954516;
LABEL_102:

LABEL_103:
LABEL_104:
  CFDictionaryRef v94 = 0;
LABEL_319:

  return v93;
}

void _sampleBufferImagePreStabilizationCallback(void *a1, uint64_t a2, opaqueCMSampleBuffer *a3)
{
  id v5 = a1;
  id v7 = v5;
  if (a3)
  {
    CMSampleBufferGetImageBuffer(a3);
  }
  else if (!a2)
  {
    goto LABEL_5;
  }
  id WeakRetained = objc_loadWeakRetained(v7 + 9);
  [WeakRetained willStartProcessingBuffer:a3 withStatus:a2];

  id v5 = v7;
LABEL_5:
}

uint64_t sbp_gvs_setPostOutputCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(unsigned char *)(DerivedStorage + 24))
  {
    return FigSignalErrorAt();
  }
  else
  {
    *(void *)(DerivedStorage + 8) = a2;
    *(void *)(DerivedStorage + 16) = a3;
    [*(id *)(DerivedStorage + 112) setDelegate:a3];
    return 0;
  }
}

void _sampleBufferImageReadyCallback(void *a1, uint64_t a2, opaqueCMSampleBuffer *a3)
{
  id v5 = a1;
  uint64_t v16 = v5;
  if (a3)
  {
    CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
    id v5 = v16;
  }
  else
  {
    CVImageBufferRef ImageBuffer = 0;
  }
  if ([v5[8] transformPlatform] == 1
    || [v16[8] transformPlatform] == 2)
  {
    BOOL v7 = 1;
    if (a2) {
      goto LABEL_27;
    }
  }
  else
  {
    BOOL v7 = [v16[8] transformPlatform] == 3;
    if (a2) {
      goto LABEL_27;
    }
  }
  if (v7)
  {
    if (a3)
    {
      FigSimpleMutexLock();
      if ([v16[4] containsObject:ImageBuffer])
      {
        [v16[4] removeObject:ImageBuffer];
        FigSimpleMutexUnlock();
        id WeakRetained = objc_loadWeakRetained(v16 + 9);
        [WeakRetained didCompleteProcessingOfBuffer:a3 withStatus:0];
      }
      else
      {
        [v16[5] addObject:ImageBuffer];
        [v16[6] addObject:a3];
        FigSimpleMutexUnlock();
      }
      goto LABEL_31;
    }
    if (*((unsigned char *)v16 + 17))
    {
      FigSimpleMutexLock();
      unsigned int v9 = [v16[5] count];
      FigSimpleMutexUnlock();
      if (!v9) {
        goto LABEL_31;
      }
      unsigned int v10 = 0;
      unsigned int v11 = v9;
      while (1)
      {
        unsigned int v12 = v11;
        unsigned int v11 = v9;
        usleep(0x3E8u);
        if (v12 == v9) {
          v10 += 1000;
        }
        else {
          unsigned int v10 = 0;
        }
        if (v10 < 0x493E0) {
          goto LABEL_25;
        }
        FigSimpleMutexLock();
        if (![v16[5] count]) {
          goto LABEL_24;
        }
        float v13 = [v16[6] objectAtIndexedSubscript:0];

        [v16[5] objectAtIndexedSubscript:0];
        if (!v13) {
          break;
        }
        CFRetain(v13);
        [v16[6] removeObjectAtIndex:0];
        [v16[5] removeObjectAtIndex:0];
        FigSimpleMutexUnlock();
        id v14 = objc_loadWeakRetained(v16 + 9);
        [v14 didCompleteProcessingOfBuffer:v13 withStatus:4294954514];

        CFRelease(v13);
LABEL_25:
        FigSimpleMutexLock();
        unsigned int v9 = [v16[5] count];
        FigSimpleMutexUnlock();
        if (!v9) {
          goto LABEL_31;
        }
      }
      [v16[6] removeObjectAtIndex:0];
      [v16[5] removeObjectAtIndex:0];
LABEL_24:
      FigSimpleMutexUnlock();
      goto LABEL_25;
    }
  }
LABEL_27:
  if (a2 || a3)
  {
    id v15 = objc_loadWeakRetained(v16 + 9);
    [v15 didCompleteProcessingOfBuffer:a3 withStatus:a2];
  }
LABEL_31:
}

uint64_t sbp_gvs_setProperty(uint64_t a1, const void *a2, void *a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(unsigned char *)(DerivedStorage + 24)) {
    goto LABEL_51;
  }
  uint64_t v6 = DerivedStorage;
  if (!CFEqual(a2, kFigVideoStabilizationSampleBufferProcessorProperty_VideoStabilizationDisabled))
  {
    if (CFEqual(a2, kFigVideoStabilizationSampleBufferProcessorProperty_SphereVideoEnabled))
    {
      if (!a3) {
        goto LABEL_51;
      }
      CFTypeID TypeID = CFBooleanGetTypeID();
      if (TypeID != CFGetTypeID(a3)) {
        goto LABEL_51;
      }
      int Value = CFBooleanGetValue((CFBooleanRef)a3);
      if (*(unsigned char *)(v6 + 32) && (!Value || *(unsigned char *)(v6 + 28137)))
      {
        a3 = 0;
        *(unsigned char *)(v6 + 28136) = Value;
        return (uint64_t)a3;
      }
      goto LABEL_50;
    }
    if (CFEqual(a2, kFigVideoStabilizationSampleBufferProcessorProperty_FrameRateConversionEnabled))
    {
      if (a3)
      {
        CFTypeID v11 = CFBooleanGetTypeID();
        if (v11 == CFGetTypeID(a3) && (int v12 = CFBooleanGetValue((CFBooleanRef)a3)) != 0 && *(_DWORD *)(v6 + 27148) == 1)
        {
          a3 = 0;
          *(unsigned char *)(v6 + 29762) = v12;
          *(_DWORD *)(v6 + 29772) = 0;
          *(void *)(v6 + 29764) = 0xFFFFFFFFLL;
          *(_WORD *)(v6 + 29780) = 1;
        }
        else
        {
          return 0;
        }
      }
      return (uint64_t)a3;
    }
    if (CFEqual(a2, kFigVideoStabilizationSampleBufferProcessorProperty_LongPressModeEnabled))
    {
      if (!a3) {
        goto LABEL_50;
      }
      CFTypeID v13 = CFBooleanGetTypeID();
      if (v13 != CFGetTypeID(a3)
        || !*(unsigned char *)(v6 + 32)
        || !*(unsigned char *)(v6 + 328)
        || *(double *)(v6 + 29488) <= 0.0
        || *(double *)(v6 + 29496) <= 0.0)
      {
        goto LABEL_50;
      }
      BOOL v14 = CFBooleanGetValue((CFBooleanRef)a3) != 0;
      a3 = (void *)sbp_enableLongPressMode(v6, v14);
      if (!a3) {
        return (uint64_t)a3;
      }
    }
    else if (CFEqual(a2, kFigVideoStabilizationSampleBufferProcessorProperty_P3ToBT2020ConversionEnabled) {
           && !*(_DWORD *)(v6 + 172))
    }
    {
      if (!a3) {
        goto LABEL_50;
      }
      CFTypeID v19 = CFBooleanGetTypeID();
      if (v19 != CFGetTypeID(a3) || !*(unsigned char *)(v6 + 32)) {
        goto LABEL_50;
      }
      BOOL v20 = CFBooleanGetValue((CFBooleanRef)a3) != 0;
      a3 = (void *)sbp_enableP3ToBT2020Conversion(v6, (const char *)v20);
      if (!a3) {
        return (uint64_t)a3;
      }
    }
    else
    {
      if (CFEqual(a2, kFigVideoStabilizationSampleBufferProcessorProperty_FlipHorizontalOrientation))
      {
        if (a3)
        {
          CFTypeID v16 = CFBooleanGetTypeID();
          if (v16 == CFGetTypeID(a3))
          {
            int v17 = CFBooleanGetValue((CFBooleanRef)a3);
            if (!v17 || !*(_DWORD *)(v6 + 172))
            {
              a3 = 0;
              *(unsigned char *)(v6 + 203) = v17;
              return (uint64_t)a3;
            }
          }
        }
        goto LABEL_50;
      }
      if (!CFEqual(a2, kFigVideoStabilizationSampleBufferProcessorProperty_IMUToCameraExtrinsic)) {
        return 4294954512;
      }
      if (!a3 || (CFTypeID v18 = CFDataGetTypeID(), v18 != CFGetTypeID(a3)) || !*(unsigned char *)(v6 + 32))
      {
LABEL_50:
        fig_log_get_emitter();
        FigDebugAssert3();
        goto LABEL_51;
      }
      a3 = (void *)sbp_setCameraExtrinsicAlignment(v6, a3);
      if (!a3) {
        return (uint64_t)a3;
      }
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    return (uint64_t)a3;
  }
  if (a3)
  {
    CFTypeID v7 = CFBooleanGetTypeID();
    if (v7 == CFGetTypeID(a3))
    {
      Boolean v8 = CFBooleanGetValue((CFBooleanRef)a3);
      a3 = 0;
      *(unsigned char *)(v6 + 84) = v8;
      return (uint64_t)a3;
    }
  }
LABEL_51:

  return FigSignalErrorAt();
}

uint64_t sbp_gvs_processSampleBuffer(uint64_t a1, opaqueCMSampleBuffer *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a2);
  if (*(unsigned char *)(DerivedStorage + 24))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t StabilizedSampleBuffer = FigSignalErrorAt();
    CFTypeRef v49 = 0;
    goto LABEL_409;
  }
  uint64_t v6 = ImageBuffer;
  if (!ImageBuffer)
  {
    fig_log_get_emitter();
    uint64_t v278 = v282;
    LODWORD(v276) = 0;
    FigDebugAssert3();
  }
  if (!*(unsigned char *)(DerivedStorage + 29704) && !sbp_gvs_verifyInputBuffer(v6))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    CFTypeRef v49 = 0;
    uint64_t StabilizedSampleBuffer = 4294954514;
    goto LABEL_409;
  }
  uint64_t v292 = a1;
  if (gGMFigKTraceEnabled == 1)
  {
    _getPresentationTimeStampForSampleBuffer(a2, 0, (uint64_t)&v300);
    time[0] = v300;
    *(void *)&time[1] = v301;
    CMTimeGetSeconds((CMTime *)time);
    kdebug_trace();
  }
  if (CMGetAttachment(a2, kFigVideoStabilizationSampleBufferAttachmentKey_DepthSampleBuffer, 0))
  {
    CFTypeID v7 = CMSampleBufferGetImageBuffer(a2);
    if (!sbp_gvs_verifyInputBuffer(v7))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      CFTypeRef v49 = 0;
      uint64_t StabilizedSampleBuffer = 4294954514;
      goto LABEL_409;
    }
    if (*(unsigned char *)(DerivedStorage + 32) && !*(_DWORD *)(DerivedStorage + 29520))
    {
      *(unsigned char *)(DerivedStorage + 29528) = 0;
      Boolean v8 = *(void **)(DerivedStorage + 29552);
      *(void *)(DerivedStorage + 29552) = 0;
    }
  }
  CFDictionaryRef MetadataDictionary = (const __CFDictionary *)_getMetadataDictionary(a2);
  if (!MetadataDictionary) {
    goto LABEL_424;
  }
  CFDictionaryRef v10 = MetadataDictionary;
  int v11 = *(_DWORD *)(DerivedStorage + 27148);
  if (v11 != 5 && v11 != 2) {
    goto LABEL_28;
  }
  CFStringRef v12 = (const __CFString *)kFigCaptureSampleBufferAttachmentKey_SmartStyleFutureLearnedCoefficientsArray;
  CFTypeRef v13 = CMGetAttachment(a2, kFigCaptureSampleBufferAttachmentKey_SmartStyleFutureLearnedCoefficientsArray, 0);
  if (v13)
  {
    *(void *)(DerivedStorage + 30136) = CFRetain(v13);
    int v14 = *(_DWORD *)(DerivedStorage + 27148);
    if (v14 != 5) {
      goto LABEL_20;
    }
    CMRemoveAttachment(a2, v12);
  }
  int v14 = *(_DWORD *)(DerivedStorage + 27148);
LABEL_20:
  if (v14 == 2)
  {
    CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(v10, kFigCaptureVideoStabilizationMetadata_CinematicFutureMetadataInitializationArray);
    CFArrayRef v16 = Value;
    if (*(unsigned char *)(DerivedStorage + 32))
    {
      if (!Value || (int)CFArrayGetCount(Value) <= 0) {
        goto LABEL_424;
      }
      *(void *)(DerivedStorage + 29456) = CFRetain(v16);
    }
    else
    {
      if (Value) {
        goto LABEL_424;
      }
      unsigned int v17 = [*(id *)(DerivedStorage + 29384) centerIndex];
      if (v17 == [*(id *)(DerivedStorage + 29384) inputIndex]) {
        goto LABEL_424;
      }
    }
    CFDictionaryRef v10 = (const __CFDictionary *)CFDictionaryGetValue(v10, kFigCaptureVideoStabilizationMetadata_CinematicFutureMetadata);
  }
LABEL_28:
  if (*(unsigned char *)(DerivedStorage + 32))
  {
    CFDictionaryRef ValueAtIndex = v10;
    if (*(void *)(DerivedStorage + 29456)) {
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)(DerivedStorage + 29456), 0);
    }
    CFTypeID v19 = CFDictionaryGetValue(ValueAtIndex, kFigCaptureStreamMetadata_PortType);
    if (*(_DWORD *)(DerivedStorage + 28280))
    {
      uint64_t v20 = bravoTransitionCameraIndexFromPortType(v19, (int *)(DerivedStorage + 28720));
      if (v20)
      {
        uint64_t StabilizedSampleBuffer = v20;
        fig_log_get_emitter();
        FigDebugAssert3();
        goto LABEL_425;
      }
    }
    uint64_t v21 = *(void *)(DerivedStorage + 128);
    v22.i64[0] = (int)v21;
    v22.i64[1] = SHIDWORD(v21);
    __asm { FMOV            V1.2D, #-1.0 }
    float64x2_t v27 = vaddq_f64(vcvtq_f64_s64(v22), _Q1);
    __asm { FMOV            V1.2D, #0.5 }
    *(float64x2_t *)(DerivedStorage + 336) = vmulq_f64(v27, _Q1);
    if (FigCFEqual()) {
      int v29 = 1;
    }
    else {
      int v29 = FigCFEqual() != 0;
    }
    *(unsigned char *)(DerivedStorage + 352) = v29;
    if (!*(unsigned char *)(DerivedStorage + 329))
    {
      *(double *)(DerivedStorage + 360) = GVSGetDefaultExtrinsicToIMU(v29);
      *(void *)(DerivedStorage + 368) = v30;
      *(void *)(DerivedStorage + 376) = v31;
      *(void *)(DerivedStorage + 384) = v32;
      int v29 = *(unsigned __int8 *)(DerivedStorage + 352);
    }
    int v33 = *(_DWORD *)(DerivedStorage + 27148);
    BOOL v35 = (v33 - 1) < 3 && v29 == 0;
    *(unsigned char *)(DerivedStorage + 27136) = v35;
    unsigned int v36 = *(_DWORD *)(DerivedStorage + 27140);
    if (v36 <= 1) {
      *(unsigned char *)(DerivedStorage + 27136) = v36 == 1;
    }
    if (*(unsigned char *)(DerivedStorage + 28136)) {
      BOOL v37 = 1;
    }
    else {
      BOOL v37 = v33 == 3;
    }
    char v38 = v37;
    *(unsigned char *)(DerivedStorage + 27106) = v38;
  }
  *(void *)&time[0] = 0;
  if (!_getMetadataDictionary(a2))
  {
LABEL_424:
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t StabilizedSampleBuffer = FigSignalErrorAt();
LABEL_425:
    CFTypeRef v49 = 0;
    goto LABEL_409;
  }
  FigCFDictionaryGetInt64IfPresent();
  target = a2;
  CMSampleBufferGetPresentationTimeStamp(&v299, a2);
  *(Float64 *)(DerivedStorage + 29744) = CMTimeGetSeconds(&v299);
  *(void *)(DerivedStorage + 29752) = *(void *)&time[0];
  if (!*(unsigned char *)(DerivedStorage + 29762)) {
    goto LABEL_62;
  }
  int FrameRateConversionStatus = _getFrameRateConversionStatus(a2);
  if (!FrameRateConversionStatus) {
    goto LABEL_62;
  }
  int v40 = FrameRateConversionStatus;
  if (!*(unsigned char *)(DerivedStorage + 32))
  {
    int v66 = *(_DWORD *)(DerivedStorage + 29768);
    if (FrameRateConversionStatus != *(_DWORD *)(DerivedStorage + 29784))
    {
      if (!v66) {
        *(_DWORD *)(DerivedStorage + 29764) = *(_DWORD *)(DerivedStorage + 29372);
      }
      *(_DWORD *)(DerivedStorage + 29768) = ++v66;
    }
    if (v66 == 2)
    {
      int v104 = *(_DWORD *)(DerivedStorage + 29764);
      if (v104 == *(_DWORD *)(DerivedStorage + 29372))
      {
        char v41 = 0;
      }
      else
      {
        CFStringRef v116 = (const __CFString *)kFigCaptureSampleBufferAttachmentKey_MetadataDictionary;
        do
        {
          int v117 = *(const void **)(*(void *)(DerivedStorage + 29352) + 8 * v104);
          if (v117)
          {
            if (CMGetAttachment(v117, v116, 0))
            {
              FigCFDictionarySetInt32();
            }
            else
            {
              fig_log_get_emitter();
              uint64_t v278 = v282;
              LODWORD(v276) = 0;
              FigDebugAssert3();
            }
          }
          int v118 = *(_DWORD *)(DerivedStorage + 29380);
          v104 += v118 + 1;
          do
            v104 -= v118;
          while (v104 >= v118);
        }
        while (*(_DWORD *)(DerivedStorage + 29372) != v104);
        char v41 = 0;
      }
      goto LABEL_58;
    }
    if (v66 == 1) {
      ++*(_DWORD *)(DerivedStorage + 29772);
    }
  }
  char v41 = 1;
LABEL_58:
  if (*(_DWORD *)(DerivedStorage + 29764) == *(_DWORD *)(DerivedStorage + 29368)
    || *(_DWORD *)(DerivedStorage + 29772) == *(_DWORD *)(DerivedStorage + 29776))
  {
    *(_DWORD *)(DerivedStorage + 29784) = v40;
LABEL_61:
    *(_DWORD *)(DerivedStorage + 29772) = 0;
    *(void *)(DerivedStorage + 29764) = 0xFFFFFFFFLL;
    goto LABEL_62;
  }
  *(_DWORD *)(DerivedStorage + 29784) = v40;
  if ((v41 & 1) == 0) {
    goto LABEL_61;
  }
LABEL_62:
  int v42 = *(_DWORD *)(DerivedStorage + 27148);
  if ((v42 - 1) < 3)
  {
    uint64_t v286 = DerivedStorage;
    uint64_t v43 = CMBaseObjectGetDerivedStorage();
    uint64_t v44 = v43;
    uint64_t v45 = v43 + 27148;
    CFTypeRef v311 = 0;
    int v46 = *(_DWORD *)(v43 + 29380);
    if (!*(unsigned char *)(v43 + 32)) {
      goto LABEL_180;
    }
    int v47 = *(_DWORD *)v45;
    if (*(_DWORD *)v45 == 3)
    {
      int v48 = 1071644672;
    }
    else
    {
      if (v47 == 2)
      {
        *(_DWORD *)(v43 + 29512) = 1050253722;
        CFArrayRef v67 = *(const __CFArray **)(v43 + 29456);
        if (v67 && (int Count = CFArrayGetCount(*(CFArrayRef *)(v43 + 29456)), Count > 0))
        {
          if (*(_DWORD *)(v45 + 2300) >= Count)
          {
            CFIndex v69 = 0;
            uint64_t v70 = Count;
            while (1)
            {
              CFDictionaryRef v71 = (const __CFDictionary *)CFArrayGetValueAtIndex(v67, v69);
              if (!v71) {
                break;
              }
              uint64_t v72 = sbp_gvs_cinematicAddMetadataToQuaternionAndSphereRingBuffers(v44, v71);
              if (v72)
              {
                uint64_t StabilizedSampleBuffer = v72;
                fig_log_get_emitter();
                uint64_t v278 = v282;
                LODWORD(v276) = StabilizedSampleBuffer;
                FigDebugAssert3();
                goto LABEL_104;
              }
              if (v70 == ++v69)
              {
                uint64_t StabilizedSampleBuffer = 0;
                goto LABEL_104;
              }
            }
          }
          fig_log_get_emitter();
          uint64_t v278 = v282;
          LODWORD(v276) = 0;
          FigDebugAssert3();
          uint64_t StabilizedSampleBuffer = FigSignalErrorAt();
LABEL_104:
          a1 = v292;
        }
        else
        {
          fig_log_get_emitter();
          uint64_t v278 = v282;
          LODWORD(v276) = 0;
          FigDebugAssert3();
          uint64_t StabilizedSampleBuffer = FigSignalErrorAt();
        }
        uint64_t v73 = *(const void **)(v44 + 29456);
        if (v73)
        {
          CFRelease(v73);
          *(void *)(v44 + 29456) = 0;
        }
        if (StabilizedSampleBuffer)
        {
          fig_log_get_emitter();
          goto LABEL_115;
        }
        int v74 = *(void **)(v44 + 29384);
        if (v74)
        {
          [v74 getSmoothingAnalysisArrays];
          float v75 = 1.0;
          if (SHIDWORD(v317) < (int)v318)
          {
            double v76 = *(double *)(v315 + 8 * (int)v318) - *(double *)(v315 + 8 * SHIDWORD(v317));
            if (v76 <= 0.0)
            {
              fig_log_get_emitter();
              uint64_t v278 = v282;
              LODWORD(v276) = 0;
              FigDebugAssert3();
            }
            else
            {
              float v75 = (*(double *)(*((void *)&time[1] + 1) + 144 * (int)v318 + 72)
                   - *(double *)(*((void *)&time[1] + 1) + 144 * SHIDWORD(v317) + 72))
                  / v76;
            }
          }
        }
        else
        {
          long long v317 = 0u;
          long long v318 = 0u;
          long long v315 = 0u;
          long long v316 = 0u;
          memset(time, 0, sizeof(time));
          float v75 = 1.0;
        }
        int v113 = v75 > 2.0;
        *(unsigned char *)(v45 + 2356) = v113;
        if (*(void *)(v44 + 88))
        {
          uint64_t v114 = *(void **)(v44 + 96);
          if (v75 <= 2.0)
          {
            [v114 setQueuePriority:*(unsigned int *)(v44 + 104)];
            uint64_t v115 = *(unsigned int *)(v44 + 104);
          }
          else
          {
            [v114 setQueuePriority:0];
            uint64_t v115 = 0;
          }
          AffineTransformContextSetPriority(*(void **)(v44 + 88), v115);
          int v113 = *(unsigned __int8 *)(v45 + 2356);
        }
        if (!v113 && !*(void *)(v44 + 416))
        {
          fig_log_get_emitter();
          uint64_t v278 = v282;
          LODWORD(v276) = 0;
          FigDebugAssert3();
        }
        goto LABEL_174;
      }
      if (v47 != 1)
      {
        fig_log_get_emitter();
        uint64_t StabilizedSampleBuffer = 4294954515;
LABEL_115:
        FigDebugAssert3();
        CFTypeRef v49 = 0;
LABEL_199:
        uint64_t DerivedStorage = v286;
        goto LABEL_407;
      }
      int v48 = 1050253722;
    }
    *(_DWORD *)(v43 + 29512) = v48;
    float v75 = 1.0;
LABEL_174:
    float v119 = *(float *)(v45 + 2364);
    float v120 = *(float *)(v45 + 2296);
    float v121 = 16.0;
    if (v120 < 1.0)
    {
      float v121 = 20.0;
      if (v120 > 0.5) {
        float v121 = (float)((float)(v120 + -0.5) * -8.0) + 20.0;
      }
    }
    float v122 = fmaxf(v119, v120 * v121);
    if (v75 > 30.0) {
      float v122 = fmaxf(v119, v122 + (float)((float)((float)(v122 - v119) / -190.0) * (float)(v75 + -30.0)));
    }
    *(float *)(v45 + 2360) = v122;
    *(float *)(v45 + 2292) = v122;
LABEL_180:
    if (*(_DWORD *)v45 != 1) {
      goto LABEL_186;
    }
    if (target)
    {
      v123 = CMGetAttachment(target, kFigVideoStabilizationSampleBufferAttachmentKey_OutputBiasRotationQuaternion, 0);
      if (v123)
      {
        v124 = v123;
        if ([v123 length] == &dword_10)
        {
          id v125 = v124;
          v126 = (float *)[v125 bytes];
          *(double *)(v44 + 28256) = *v126;
          *(double *)(v44 + 28264) = v126[1];
          *(double *)(v44 + 28272) = v126[2];
          *(double *)(v44 + 28248) = v126[3];

          char v127 = 1;
LABEL_185:
          *(unsigned char *)(v45 + 1092) = v127;
LABEL_186:
          if (v10)
          {
            uint64_t v128 = sbp_gvs_cinematicAddMetadataToQuaternionAndSphereRingBuffers(v44, v10);
            if (v128)
            {
LABEL_259:
              uint64_t StabilizedSampleBuffer = v128;
              fig_log_get_emitter();
              goto LABEL_115;
            }
            if (!*(_DWORD *)(v45 + 2448)) {
              goto LABEL_242;
            }
            if (*(unsigned char *)(v45 + 2477) && !*(unsigned char *)(v45 + 2510))
            {
              v129 = CMGetAttachment(target, kFigVideoStabilizationSampleBufferProcessorOption_SystemPressure, 0);
              signed int v130 = [v129 intValue];
              *(_DWORD *)(v45 + 2480) = v130;
              *(unsigned char *)(v45 + 2510) |= v130 > 2;
            }
            if (*(unsigned char *)(v45 + 2511)) {
              goto LABEL_229;
            }
            if (CFDictionaryContainsKey(v10, kFigCaptureStreamMetadata_LTMLookUpTables))
            {
              unsigned int v131 = [*(id *)(v44 + 29632) prepareToProcessWithMetadata:v10];
              if (v131)
              {
                unsigned int v274 = v131;
                fig_log_get_emitter();
                uint64_t v278 = v282;
                LODWORD(v276) = v274;
                FigDebugAssert3();
              }
              *(unsigned char *)(v45 + 2511) = 1;
              goto LABEL_229;
            }
            int v150 = *(_DWORD *)(v45 + 2516);
            *(_DWORD *)(v45 + 2516) = v150 + 1;
            if (v150 < 3)
            {
LABEL_229:
              if (!*(void *)(v44 + 29640) && !*(_DWORD *)(v45 + 2516) && *(unsigned char *)(v45 + 2511))
              {
                uint64_t v151 = objc_msgSend(*(id *)(v44 + 29632), "allocateLTCsCorrectionTex:forISPProcessing:", *(unsigned __int8 *)(v45 + 2476), *(_DWORD *)(v44 + 172) == 3, v276, v278);
                id v152 = *(void **)(v44 + 29640);
                *(void *)(v44 + 29640) = v151;

                if (!*(void *)(v44 + 29640))
                {
                  fig_log_get_emitter();
                  uint64_t v278 = v282;
                  LODWORD(v276) = 0;
                  FigDebugAssert3();
                  FigSignalErrorAt();
                }
                int v153 = sbp_ltm_checkPerVideoDisablement(v44, v10);
                if (v153)
                {
                  int v275 = v153;
                  fig_log_get_emitter();
                  uint64_t v278 = v282;
                  LODWORD(v276) = v275;
                  FigDebugAssert3();
                }
              }
              if (*(unsigned char *)(v45 + 2510) || !*(unsigned char *)(v45 + 2511))
              {
                if (*(int *)(v45 + 2480) >= 3) {
                  *(_DWORD *)(v45 + 2520) = 0;
                }
                if (*(unsigned char *)(v45 + 2509)) {
                  *(_DWORD *)(v45 + 2520) = 1;
                }
                *(unsigned char *)(v45 + 2512) = 0;
              }
              else
              {
                if (!*(void *)(v44 + 29632))
                {
                  fig_log_get_emitter();
                  uint64_t v278 = v282;
                  LODWORD(v276) = 0;
                  FigDebugAssert3();
                  sbp_ltm_deallocateLtcCorrectionTexture(v44);
                }
                if (gGMFigKTraceEnabled == 1)
                {
                  _getPresentationTimeStampForSampleBuffer(target, 0, (uint64_t)cf);
                  *(_OWORD *)v302 = *(_OWORD *)cf;
                  *(void *)&v302[16] = v313;
                  CMTimeGetSeconds((CMTime *)v302);
                  kdebug_trace();
                }
                if (objc_msgSend(*(id *)(v44 + 29632), "bufferFrame:", target, v276, v278))
                {
                  fig_log_get_emitter();
                  FigDebugAssert3();
                  sbp_ltm_deallocateLtcCorrectionTexture(v44);
                }
                if (gGMFigKTraceEnabled == 1) {
                  kdebug_trace();
                }
              }
              goto LABEL_242;
            }
          }
          else if (!*(_DWORD *)(v45 + 2448))
          {
LABEL_242:
            int v154 = (void *)(v44 + 29352);
            _setAttachedMediaToSampleBuffer(target, kFigCaptureStreamMetadataOutputKey_PreLTMThumbnail, 0);
            CFTypeRef v155 = CFRetain(target);
            uint64_t v156 = *(int *)(v45 + 2224);
            *(void *)(*(void *)(v44 + 29352) + 8 * v156) = v155;
            do
            {
              int v157 = v156 - v46;
              int v158 = v156 + 1;
              LODWORD(v156) = v156 - v46;
            }
            while (v158 >= v46);
            *(_DWORD *)(v45 + 2224) = v46 + v157 + 1;
            int v159 = *(_DWORD *)(v45 + 2228);
            if (v159 < v46) {
              *(_DWORD *)(v45 + 2228) = ++v159;
            }
            if (*(unsigned char *)(v44 + 30032))
            {
              int v160 = (v46 + v157 + *(_DWORD *)(v45 + 2232)) % v46;
              if (*(unsigned char *)(v44 + 32))
              {
                *(void *)v302 = 0;
                FigCFDictionaryGetDoubleIfPresent();
                if (*(double *)v302 > *(float *)(v44 + 30036) && (v161 = *(void **)(v44 + 30048)) != 0
                  || (v161 = *(void **)(v44 + 30056)) != 0)
                {
                  id v162 = v161;
                  uint64_t v163 = *(void **)(v44 + 30040);
                  *(void *)(v44 + 30040) = v162;
                }
                int v159 = *(_DWORD *)(v45 + 2228);
              }
              *(unsigned char *)(*(void *)(v44 + 29360) + 24 * v160 + 16) = 0;
              if (v159 >= 3) {
                _runVideoDeghostingDetection(*(void **)(v44 + 30040), v44 + 29352);
              }
            }
            if (!*(unsigned char *)(v44 + 30064)) {
              goto LABEL_283;
            }
            if (_shouldBypassSmartStyle(target))
            {
              if (*(_DWORD *)v45 != 2)
              {
                uint64_t v128 = _removeSmartStyleAttachments(v44, target);
                if (v128) {
                  goto LABEL_259;
                }
              }
              goto LABEL_283;
            }
            if (!*(unsigned char *)(v44 + 30068))
            {
              if (*(_DWORD *)(v44 + 172) == 3)
              {
                uint64_t v128 = _runSmartStyleApplyOnUnstabilizedImage(v44, target);
                if (v128) {
                  goto LABEL_259;
                }
              }
              goto LABEL_283;
            }
            if (*(_DWORD *)v45 != 2)
            {
              uint64_t v128 = _enqueueCoefficientsForSmartStyleFilterForwardLearning(v44, target);
              if (v128) {
                goto LABEL_259;
              }
            }
            if (*(_DWORD *)(v44 + 172) != 3) {
              goto LABEL_283;
            }
            unsigned int v164 = *(_DWORD *)(v44 + 30128);
            if (*(_DWORD *)(v44 + 30120) < *(_DWORD *)(v44 + 30116) && v164 < *(_DWORD *)(v44 + 30124))
            {
              *(_DWORD *)(v44 + 30128) = v164 + 1;
LABEL_283:
              if (*(_DWORD *)(v45 + 2228) < v46)
              {
                v167 = *(void **)(v44 + 88);
                uint64_t DerivedStorage = v286;
                if (v167)
                {
                  int32x2_t v168 = (const char *)CMSampleBufferGetImageBuffer(target);
                  AffineTransformCacheSourcePixelBuffer(v167, v168);
                }
                CFTypeRef v49 = 0;
                uint64_t StabilizedSampleBuffer = 0;
                goto LABEL_407;
              }
              uint64_t StabilizedSampleBuffer = sbp_gvs_gaussianAverageGetStabilizedSampleBuffer(v44, &v311);
              uint64_t DerivedStorage = v286;
              if (!StabilizedSampleBuffer)
              {
                CFTypeRef v49 = v311;
                goto LABEL_407;
              }
              fig_log_get_emitter();
              FigDebugAssert3();
              if (v311) {
                CFRelease(v311);
              }
              goto LABEL_450;
            }
            signed int v165 = (*(_DWORD *)(v45 + 2224) + *(_DWORD *)(v45 + 2232) + ~v164) % *(_DWORD *)(v45 + 2232);
            v166 = *(void **)(*v154 + 8 * v165);
            if (v166)
            {
              if (_runSmartStyleFilterForwardLearning(v44, *(void **)(*v154 + 8 * v165)))
              {
                fig_log_get_emitter();
                FigDebugAssert3();
              }
              uint64_t v128 = _runSmartStyleApplyOnUnstabilizedImage(v44, v166);
              a1 = v292;
              if (v128) {
                goto LABEL_259;
              }
              goto LABEL_283;
            }
            fig_log_get_emitter();
            FigDebugAssert3();
            CFTypeRef v49 = 0;
            uint64_t StabilizedSampleBuffer = 4294954516;
            goto LABEL_226;
          }
          sbp_ltm_deallocateLtcCorrectionTexture(v44);
          CFTypeRef v49 = 0;
          uint64_t StabilizedSampleBuffer = 0;
          goto LABEL_199;
        }
        fig_log_get_emitter();
        uint64_t v278 = v282;
        LODWORD(v276) = 0;
        FigDebugAssert3();
      }
    }
    else
    {
      fig_log_get_emitter();
      uint64_t v278 = v282;
      LODWORD(v276) = 0;
      FigDebugAssert3();
    }
    char v127 = 0;
    goto LABEL_185;
  }
  if (v42 == 4)
  {
    uint64_t v53 = CMBaseObjectGetDerivedStorage();
    uint64_t v54 = v53;
    v55 = (unsigned char *)(v53 + 27144);
    CFTypeRef v310 = 0;
    CFTypeRef v311 = 0;
    uint64_t v56 = *(int *)(v53 + 176);
    memset(v302, 0, sizeof(v302));
    long long v303 = 0u;
    long long v304 = 0u;
    long long v305 = 0u;
    long long v306 = 0u;
    long long v307 = 0u;
    long long v308 = 0u;
    long long v309 = 0u;
    uint64_t v57 = v53 + 10688;
    if (*(unsigned char *)(v53 + 28137)) {
      uint64_t v58 = v53 + 10688;
    }
    else {
      uint64_t v58 = 0;
    }
    v294 = (int32x2_t *)(v53 + 128);
    v297 = (float64x2_t *)(v53 + 336);
    if (*(unsigned char *)(v53 + 28137)) {
      uint64_t v59 = *(float32x2_t **)(v53 + 28144);
    }
    else {
      uint64_t v59 = 0;
    }
    uint64_t v77 = GVSExtractMetadataFromTopToBottomRows(v10, v53 + 424, *(void **)(v53 + 27128), v58, (uint64_t)v297, v294, (uint64_t)v302, time, 0, (float32x2_t *)&v310, v59, 0, v56);
    if (v77)
    {
      uint64_t StabilizedSampleBuffer = v77;
      fig_log_get_emitter();
      FigDebugAssert3();
      CFTypeRef v49 = 0;
      goto LABEL_227;
    }
    CFDictionaryRef v78 = (unsigned char *)(v54 + 10682);
    *(float32x2_t *)(v54 + 28232) = vdiv_f32(vneg_f32((float32x2_t)v310), (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v302[4], 0));
    if (*v55)
    {
      CFDictionaryRef v79 = &time[2 * v56];
      long long v80 = *v79;
      *(_OWORD *)(v54 + 28112) = v79[1];
      *(_OWORD *)(v54 + 28096) = v80;
      if (v55[993])
      {
        if (v302[12])
        {
          cf[0] = 0;
          int v81 = FigMotionComputeLensMovementForTimeStamp(v57, (float32x2_t *)cf, DWORD2(v309), *((double *)&v305 + 1), *(float *)&v302[16]);
          *(float32x2_t *)(v54 + 28232) = vsub_f32(*(float32x2_t *)(v54 + 28232), vdiv_f32((float32x2_t)cf[0], (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v302[4], 0)));
          if (v81) {
            goto LABEL_207;
          }
        }
      }
      goto LABEL_204;
    }
    if (!*(unsigned char *)(v54 + 392))
    {
      if (!target
        || (v132 = (const __CFData *)CMGetAttachment(target, kFigVideoStabilizationSampleBufferAttachmentKey_StabilizedOutputCenterQuaternion, 0)) == 0|| (v133 = v132, BytePtr = CFDataGetBytePtr(v132), CFDataGetLength(v133) != 32)|| (long long v135 = *((_OWORD *)BytePtr + 1), *(_OWORD *)(v54 + 28096) = *(_OWORD *)BytePtr, *(_OWORD *)(v54 + 28112) = v135, FigMotionGetQuaternionLength((double *)(v54 + 28096)) <= 0.00000001))
      {
        fig_log_get_emitter();
        uint64_t v279 = v282;
        LODWORD(v277) = 0;
        FigDebugAssert3();
        int v92 = FigSignalErrorAt();
        if (v92) {
          goto LABEL_138;
        }
      }
      goto LABEL_204;
    }
    *(_OWORD *)cf = 0u;
    long long v313 = 0u;
    if (target)
    {
      uint64_t v87 = CMGetAttachment(target, kFigVideoStabilizationSampleBufferAttachmentKey_StabilizedOutputCameraGeometry, 0);
      float v88 = v87;
      if (v87 && [v87 length] == &stru_20.segname[8])
      {
        id v89 = v88;
        CFNumberRef v90 = (char *)[v89 bytes];
        *(_OWORD *)cf = *(_OWORD *)v90;
        long long v313 = *((_OWORD *)v90 + 1);
        float32x2_t v91 = *(float32x2_t *)(v90 + 32);

        int v92 = 0;
        goto LABEL_137;
      }
      fig_log_get_emitter();
      uint64_t v279 = v282;
      LODWORD(v277) = 0;
      FigDebugAssert3();
      int v92 = FigSignalErrorAt();
    }
    else
    {
      fig_log_get_emitter();
      uint64_t v279 = v282;
      LODWORD(v277) = 0;
      FigDebugAssert3();
      int v92 = 0;
    }
    float32x2_t v91 = 0;
LABEL_137:
    long long v93 = v313;
    *(_OWORD *)(v54 + 28096) = *(_OWORD *)cf;
    *(_OWORD *)(v54 + 28112) = v93;
    *(float32x2_t *)(v54 + 28232) = vneg_f32(v91);
    if (v92)
    {
LABEL_138:
      fig_log_get_emitter();
      uint64_t v279 = v282;
      LODWORD(v277) = v92;
      FigDebugAssert3();
      goto LABEL_207;
    }
LABEL_204:
    if (*v78)
    {
      int v136 = *(unsigned __int8 *)(v54 + 84);
      *(unsigned char *)(v54 + 202) = *(unsigned char *)(v54 + 84) != 0;
      if (!v136)
      {
LABEL_209:
        if (v55[993]) {
          sbp_gvs_computeBaseSphereLensMovements(*(unsigned int *)(v54 + 176), *(_DWORD *)(v54 + 180), *(void **)(v54 + 28144), (void *)(v54 + 28152));
        }
        uint64_t v286 = DerivedStorage;
        v139 = *(void **)(v54 + 28880);
        if (v139 || *(void *)(v54 + 28888))
        {
          objc_msgSend(v139, "reset", v277, v279);
          [*(id *)(v54 + 28888) reset];
          sbp_gvs_extractDistortionData(*(void **)(v54 + 28856), v10, (uint64_t)v302, *(void **)(v54 + 29120), v54 + 28880, vsubq_f64(*(float64x2_t *)(v54 + 336), vcvtq_f64_f32(vmul_n_f32(*(float32x2_t *)(v54 + 28232), *(float *)&v302[4]))));
        }
        if (*v78
          && (cf[0] = (CFTypeRef)vmul_n_f32(*(float32x2_t *)(v54 + 28232), *(float *)&v302[4]),
              *(_DWORD *)(v54 + 196) = 1065353216,
              (int)v56 >= 1))
        {
          uint64_t v140 = v56;
          id v141 = (float *)(v54 + 27152);
          uint64_t v142 = v54 + 28152;
          uint64_t v143 = v54 + 27872;
          v144 = (uint64_t *)time;
          while (1)
          {
            *(double *)uint64_t v143 = FigMotionMultiplyByInverseOfQuaternion((double *)(v54 + 28096), v144);
            *(void *)(v143 + 8) = v145;
            *(void *)(v143 + 16) = v146;
            *(void *)(v143 + 24) = v147;
            id v148 = v55[993] ? (float32x2_t *)v142 : 0;
            uint64_t v149 = GVSComputeTransformFromCameraMotion((double *)v143, v297, (uint64_t)v302, v148, (float32x2_t *)cf, v141);
            if (v149) {
              break;
            }
            if (*(unsigned char *)(v54 + 200)) {
              limitTransformToOverscan((uint64_t)v294, (double *)&v307 + 1, (uint64_t)v141, *(float *)&v302[20]);
            }
            v141 += 9;
            v142 += 8;
            v144 += 4;
            v143 += 32;
            if (!--v140) {
              goto LABEL_224;
            }
          }
          uint64_t StabilizedSampleBuffer = v149;
          fig_log_get_emitter();
          FigDebugAssert3();
        }
        else
        {
LABEL_224:
          uint64_t StabilizedSampleBuffer = sbp_gvs_createStabilizedSampleBuffer(v54, target, (uint64_t)v302, &v311);
          if (!StabilizedSampleBuffer)
          {
            CFTypeRef v49 = v311;
LABEL_226:
            uint64_t DerivedStorage = v286;
LABEL_227:
            a1 = v292;
            goto LABEL_407;
          }
          fig_log_get_emitter();
          FigDebugAssert3();
          if (v311) {
            CFRelease(v311);
          }
        }
        CFTypeRef v49 = 0;
        goto LABEL_226;
      }
LABEL_208:
      v137 = &time[2 * ((uint64_t)(*(_DWORD *)(v54 + 176) + (*(int *)(v54 + 176) < 0)) >> 1)];
      long long v138 = v137[1];
      *(_OWORD *)(v54 + 28096) = *v137;
      *(_OWORD *)(v54 + 28112) = v138;
      goto LABEL_209;
    }
LABEL_207:
    *(unsigned char *)(v54 + 202) = 1;
    goto LABEL_208;
  }
  if (v42 != 5)
  {
    uint64_t v60 = CMBaseObjectGetDerivedStorage();
    uint64_t v283 = v60 + 28280;
    int v61 = (unsigned char *)(v60 + 27136);
    int v62 = (unsigned __int8 *)(v60 + 10682);
    CFTypeRef v310 = 0;
    long long v308 = 0u;
    long long v309 = 0u;
    long long v306 = 0u;
    long long v307 = 0u;
    long long v304 = 0u;
    long long v305 = 0u;
    long long v303 = 0u;
    memset(v302, 0, sizeof(v302));
    long long v285 = (int32x2_t *)(v60 + 128);
    uint64_t v63 = *(int *)(v60 + 176);
    if (*(unsigned char *)(v60 + 28137)) {
      uint64_t v64 = v60 + 10688;
    }
    else {
      uint64_t v64 = 0;
    }
    long long v291 = (float64x2_t *)(v60 + 336);
    uint64_t v298 = v60;
    if (*(unsigned char *)(v60 + 28137)) {
      int v65 = *(float32x2_t **)(v60 + 28144);
    }
    else {
      int v65 = 0;
    }
    if (*(_DWORD *)v283) {
      uint64_t v82 = v60 + 28280;
    }
    else {
      uint64_t v82 = 0;
    }
    uint64_t v83 = GVSExtractMetadataFromTopToBottomRows(v10, v60 + 424, *(void **)(v60 + 27128), v64, (uint64_t)v291, v285, (uint64_t)v302, time, 0, 0, v65, v82, v63);
    if (v83)
    {
      uint64_t StabilizedSampleBuffer = v83;
      fig_log_get_emitter();
      FigDebugAssert3();
      CFTypeRef v49 = 0;
      uint64_t v85 = v298;
LABEL_406:
      v62[1] = *v62;
      *(void *)(v85 + 29344) = *((void *)&v305 + 1);
      goto LABEL_407;
    }
    int v84 = *v62;
    uint64_t v85 = v298;
    if (*v62)
    {
      *(unsigned char *)(v298 + 202) = *(unsigned char *)(v298 + 84) != 0;
      long long v280 = (unsigned char *)(v298 + 202);
      uint64_t v86 = (unsigned char *)(v298 + 32);
      if (!*(unsigned char *)(v298 + 32) && v62[1]) {
        goto LABEL_143;
      }
    }
    else
    {
      uint64_t v86 = (unsigned char *)(v298 + 32);
      int v94 = *(unsigned __int8 *)(v298 + 32);
      *(unsigned char *)(v298 + 202) = 1;
      long long v280 = (unsigned char *)(v298 + 202);
      if (!v94) {
        goto LABEL_143;
      }
    }
    BOOL v95 = &time[2 * v63];
    long long v96 = *v95;
    *(_OWORD *)(v298 + 28112) = v95[1];
    *(_OWORD *)(v298 + 28096) = v96;
    if ((int)v63 >= 1)
    {
      uint64_t v97 = v63;
      BOOL v98 = (_OWORD *)(v298 + 27648);
      CFDictionaryRef v99 = time;
      do
      {
        long long v100 = v99[1];
        *(v98 - 14) = *v99;
        *(v98 - 13) = v100;
        long long v101 = *v99;
        long long v102 = v99[1];
        v99 += 2;
        *BOOL v98 = v101;
        v98[1] = v102;
        v98 += 2;
        --v97;
      }
      while (v97);
    }
LABEL_143:
    uint64_t v287 = DerivedStorage;
    long long v290 = v61;
    long long v281 = v62;
    if (v61[1001])
    {
      sbp_gvs_computeBaseSphereLensMovements(*(unsigned int *)(v298 + 176), *(_DWORD *)(v298 + 180), *(void **)(v298 + 28144), (void *)(v298 + 28152));
      int v84 = *v62;
    }
    if (!v84)
    {
LABEL_402:
      if (*v280)
      {
        v270 = &time[2 * ((uint64_t)(*(_DWORD *)(v85 + 176) + (*(int *)(v85 + 176) < 0)) >> 1)];
        long long v271 = v270[1];
        *(_OWORD *)(v85 + 28096) = *v270;
        *(_OWORD *)(v85 + 28112) = v271;
      }
      uint64_t StabilizedSampleBuffer = sbp_gvs_createStabilizedSampleBuffer(v85, target, (uint64_t)v302, &v310);
      uint64_t DerivedStorage = v287;
      a1 = v292;
      int v62 = v281;
      if (StabilizedSampleBuffer)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        if (v310) {
          CFRelease(v310);
        }
        CFTypeRef v49 = 0;
      }
      else
      {
        CFTypeRef v49 = v310;
      }
      goto LABEL_406;
    }
    if (*v86)
    {
      float v103 = *(float *)(v283 + 860);
      goto LABEL_391;
    }
    double v105 = *((double *)&v305 + 1) - *(double *)(v298 + 29344);
    if (v105 <= 0.0) {
      double v106 = 1.0;
    }
    else {
      double v106 = 0.0333333333 / v105;
    }
    *(double *)(v298 + 29336) = v106;
    uint64_t v107 = *(unsigned int *)(v298 + 176);
    double v108 = v106 * 0.0192 + 0.7808;
    if (v302[12])
    {
      v109 = v290;
      float v110 = v108;
      float v111 = v106 * 0.005 + 0.945;
      if (v290[1000])
      {
        float v111 = v111 + 0.02;
        float v110 = v110 + 0.1;
        int v112 = 1;
      }
      else
      {
        int v112 = 0;
      }
    }
    else
    {
      int v112 = 0;
      float v110 = v108;
      float v111 = v106 * 0.005 + 0.945;
      v109 = v290;
    }
    float v169 = fminf(v110, 0.999);
    float v288 = fminf(v111, 0.999);
    double v170 = (float)(v288 - v169);
    float v171 = v169;
    if (*(_DWORD *)(v298 + 29240)) {
      float v171 = *(float *)(v283 + 860);
    }
    float v295 = v171;
    double v172 = fmin(v108, 0.999);
    double v173 = v170 / (v106 * 30.0);
    double v174 = v170 / (v106 * 10.0);
    if ((int)v107 < 1)
    {
      double v176 = 0.0;
      double v180 = 2.0;
      double v177 = 2.0;
    }
    else
    {
      *(_OWORD *)cf = 0u;
      long long v313 = 0u;
      v175 = (uint64_t *)(v298 + 27648);
      double v176 = 0.0;
      double v177 = 2.0;
      int v178 = (double *)time;
      uint64_t v179 = v107;
      double v180 = 2.0;
      do
      {
        cf[0] = COERCE_CFTYPEREF(FigMotionMultiplyByInverseOfQuaternion(v178, v175 - 28));
        cf[1] = v181;
        *(void *)&long long v313 = v182;
        *((void *)&v313 + 1) = v183;
        double v184 = fabs(*(double *)cf);
        if (v184 < v177) {
          double v177 = v184;
        }
        cf[0] = COERCE_CFTYPEREF(FigMotionMultiplyByInverseOfQuaternion(v178, v175));
        cf[1] = v185;
        *(void *)&long long v313 = v186;
        *((void *)&v313 + 1) = v187;
        double v188 = fabs(*(double *)cf);
        if (v188 < v180) {
          double v180 = v188;
        }
        CFTypeRef v311 = 0;
        GVSComputeTranslationFromCameraMotion((double *)cf, (float32x2_t *)&v311, *(float *)&v302[4]);
        HIDWORD(v108) = HIDWORD(v311);
        double v176 = COERCE_DOUBLE(vadd_f32(*(float32x2_t *)&v176, (float32x2_t)v311));
        v175 += 4;
        v178 += 4;
        --v179;
      }
      while (v179);
    }
    float v189 = v172;
    *(float *)&double v108 = v173;
    float v284 = *(float *)&v108;
    float v190 = v174;
    *(float *)&double v108 = (float)(int)v107;
    id v191 = (unsigned char *)(v298 + 29176);
    double v192 = COERCE_DOUBLE(vdiv_f32(*(float32x2_t *)&v176, (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v108, 0)));
    if (v107) {
      double v193 = v192;
    }
    else {
      double v193 = v176;
    }
    double v194 = acos(v180);
    uint64_t v85 = v298;
    double v195 = *(double *)(v298 + 29336);
    double v196 = acos(v177);
    double v197 = sqrt(v195);
    uint64_t v198 = *(int *)(v298 + 29324);
    *(double *)(v298 + 29244 + 8 * v198) = v193;
    int v199 = *(_DWORD *)(v298 + 29328);
    if (v199 <= 9) {
      *(_DWORD *)(v298 + 29328) = ++v199;
    }
    double v200 = v194 * v195;
    double v201 = v196 * v197;
    LOWORD(cf[0]) = 0;
    if (v199 == 10)
    {
      uint64_t v202 = 0;
      double v203 = 0.0;
      char v204 = 1;
      do
      {
        int v205 = 0;
        char v206 = v204;
        int v207 = 10;
        float v208 = 0.0;
        int v209 = v198;
        do
        {
          float v210 = *(float *)(v298 + 29244 + 8 * v209 + 4 * v202);
          float v208 = v208 + v210;
          if (v210 >= 0.0) {
            ++v205;
          }
          else {
            --v205;
          }
          int v209 = (v209 + 9) % 10;
          --v207;
        }
        while (v207);
        if (v205 < 0) {
          int v205 = -v205;
        }
        if (v205 == 10)
        {
          float v211 = fabsf(v208) / 10.0;
          if (v211 >= 0.75)
          {
            *((unsigned char *)cf + v202) = 1;
            *(float *)&double v203 = fmaxf(*(float *)&v203, v211);
          }
        }
        char v204 = 0;
        uint64_t v202 = 1;
      }
      while ((v206 & 1) != 0);
      int v212 = LOBYTE(cf[0]);
      int v213 = BYTE1(cf[0]);
    }
    else
    {
      int v213 = 0;
      int v212 = 0;
      double v203 = 0.0;
    }
    *(unsigned char *)(v298 + 29146) = (v212 | v213) != 0;
    BOOL v214 = v200 <= 0.00447213968;
    *(unsigned char *)(v298 + 29145) = v200 <= 0.00447213968;
    *(unsigned char *)(v298 + 29144) = v201 <= 0.0109545059;
    uint64_t v215 = *(int *)(v298 + 29236);
    if (v201 > 0.0109545059) {
      BOOL v214 = 0;
    }
    v191[v215] = v214;
    int v216 = *(_DWORD *)(v298 + 29240);
    if (v216 > 59)
    {
      unsigned int v217 = *(_DWORD *)(v298 + 29240);
      float v218 = v288;
    }
    else
    {
      unsigned int v217 = v216 + 1;
      *(_DWORD *)(v298 + 29240) = v216 + 1;
      float v218 = v288;
      if (v216 < 0) {
        goto LABEL_326;
      }
    }
    if (!*v191)
    {
      *(unsigned char *)(v298 + 29147) = 0;
LABEL_336:
      if (v112)
      {
        if (*(unsigned char *)(v298 + 29146) && *(unsigned char *)(v298 + 201))
        {
          float v223 = v295 - v190;
        }
        else
        {
          float v223 = fminf(v169, v295 + v284);
          float v224 = fmaxf(v169, v295 - v190);
          if (v295 > v169) {
            float v223 = v224;
          }
        }
        goto LABEL_345;
      }
      float v222 = v295 - v190;
      goto LABEL_341;
    }
    unint64_t v219 = 0;
    while (v217 - 1 != v219)
    {
      if (!*(unsigned __int8 *)(v298 + 29177 + v219++))
      {
        *(unsigned char *)(v298 + 29147) = v219 >= v217;
        if (v219 < v217) {
          goto LABEL_336;
        }
        goto LABEL_333;
      }
    }
LABEL_326:
    *(unsigned char *)(v298 + 29147) = 1;
LABEL_333:
    if (!*(unsigned char *)(v298 + 29146))
    {
      float v223 = v295 + v284;
      goto LABEL_345;
    }
    float v221 = fminf(*(float *)&v203 / *(float *)(v298 + 29160), 1.0);
    float v222 = v295 - (float)((float)(v221 * (float)(v221 * v221)) * v190);
LABEL_341:
    float v223 = fmaxf(v169, v222);
LABEL_345:
    float v225 = fminf(v218, fmaxf(v189, v223));
    *(_DWORD *)(v298 + 29324) = ((int)v198 + 1) % 10;
    *(_DWORD *)(v298 + 29236) = ((int)v215 + 1) % 60;
    if (v200 >= *(double *)(v298 + 29168))
    {
      float v230 = 0.08 / v106 + v295;
      *(float *)&double v203 = fminf(v225, v230);
      *(_DWORD *)(v298 + 29148) = 0;
      float v231 = 0.005 / v106;
      *(float *)(v298 + 29152) = v231;
    }
    else
    {
      int v226 = *(_DWORD *)(v298 + 29148);
      int v227 = llround(v106);
      if (v227 <= 1) {
        int v227 = 1;
      }
      if (v226 < v227 || v200 >= 0.00019999999)
      {
        *(float *)&double v203 = fminf(v225, v295);
      }
      else
      {
        float v228 = *(float *)(v298 + 29156);
        float v229 = fminf(*(float *)(v298 + 29152) * 1.3, 1.0);
        *(float *)(v298 + 29152) = v229;
        double v203 = v295 - v229 / v106;
        *(float *)&double v203 = v203;
        *(float *)&double v203 = fmaxf(v228, *(float *)&v203);
      }
      *(_DWORD *)(v298 + 29148) = v226 + 1;
    }
    if (*v109)
    {
      sbp_gvs_UpdateSmoothParameter((uint64_t *)&time[2 * (int)v107], (double *)(v298 + 28096), v203, *(long double *)(v298 + 27416));
      float v103 = v232;
    }
    else
    {
      if ((int)v107 < 1)
      {
        float v103 = 1.0;
      }
      else
      {
        v233 = (double *)(v298 + 27424);
        float v103 = 1.0;
        v234 = (uint64_t *)time;
        do
        {
          sbp_gvs_UpdateSmoothParameter(v234, v233, v203, *(long double *)(v298 + 27416));
          if (*(float *)&v203 < v103) {
            float v103 = *(float *)&v203;
          }
          v233 += 4;
          v234 += 4;
          --v107;
        }
        while (v107);
      }
      char v235 = v112 ^ 1;
      if (!*(unsigned char *)(v298 + 200)) {
        char v235 = 1;
      }
      if ((v235 & 1) == 0 && v103 > 0.7808)
      {
        LOBYTE(v311) = 1;
        uint64_t v236 = *(unsigned int *)(v298 + 176);
        *(unsigned char *)(v298 + 201) = 0;
        if ((int)v236 < 1)
        {
          float v242 = v103;
LABEL_388:
          float v103 = v242;
        }
        else
        {
          uint64_t v237 = v236;
          uint64_t v238 = 0;
          uint64_t v239 = v298 + 27424;
          float v240 = v103;
          while (1)
          {
            uint64_t v241 = v290[1001] ? (float32x2_t *)(v298 + 28152 + 8 * v238) : 0;
            if (sbp_gvs_iir_ComputeCorrection(v298, (uint64_t *)&time[2 * v238], (double *)(v239 + 32 * v238), (uint64_t)v302, v241, (BOOL *)&v311, v240))break; {
            if ((_BYTE)v311)
            }
            {
              float v242 = v240;
            }
            else
            {
              *(unsigned char *)(v298 + 201) = 1;
              if (v240 < 0.7808)
              {
                fig_log_get_emitter();
                FigDebugAssert3();
                float v242 = 0.7808;
                if (FigSignalErrorAt()) {
                  break;
                }
              }
              else
              {
                float v242 = 0.7808;
                if ((float)(v240 + -0.7808) > 0.01)
                {
                  float v242 = 0.7808;
                  while (1)
                  {
                    LOBYTE(cf[0]) = 0;
                    if (sbp_gvs_iir_ComputeCorrection(v298, (uint64_t *)&time[2 * v238], (double *)(v239 + 32 * v238), (uint64_t)v302, v241, (BOOL *)cf, (float)(v242 + v240) * 0.5))break; {
                    if (LOBYTE(cf[0]))
                    }
                      float v242 = (float)(v242 + v240) * 0.5;
                    else {
                      float v240 = (float)(v242 + v240) * 0.5;
                    }
                    if ((float)(v240 - v242) <= 0.01) {
                      goto LABEL_383;
                    }
                  }
                  fig_log_get_emitter();
                  FigDebugAssert3();
                  break;
                }
              }
            }
LABEL_383:
            ++v238;
            float v240 = v242;
            if (v238 == v237) {
              goto LABEL_388;
            }
          }
          fig_log_get_emitter();
          FigDebugAssert3();
        }
        uint64_t v85 = v298;
      }
    }
    *(float *)(v283 + 860) = v103;
LABEL_391:
    uint64_t v289 = v85 + 28096;
    FigMotionInterpolateQuaternionsByAngle((uint64_t)&time[2 * v63], (double *)(v85 + 28096), v103);
    *(void *)(v85 + 28096) = v243;
    *(void *)(v85 + 28104) = v244;
    *(void *)(v85 + 28112) = v245;
    *(void *)(v85 + 28120) = v246;
    *(_DWORD *)(v85 + 196) = 1065353216;
    if ((int)v63 >= 1)
    {
      uint64_t v247 = v63;
      v248 = (uint64_t *)time;
      uint64_t v249 = 27872;
      uint64_t v250 = 28152;
      uint64_t v251 = 27152;
      uint64_t v252 = 27648;
      uint64_t v253 = 27424;
      while (1)
      {
        uint64_t v296 = v247;
        uint64_t v254 = v289;
        if (!*v290)
        {
          uint64_t v254 = v85 + v253;
          FigMotionInterpolateQuaternionsByAngle((uint64_t)v248, (double *)(v85 + v253), *(float *)(v283 + 860));
          *(void *)uint64_t v254 = v255;
          *(void *)(v254 + 8) = v256;
          *(void *)(v254 + 16) = v257;
          *(void *)(v254 + 24) = v258;
          FigMotionInterpolateQuaternionsByAngle((uint64_t)v248, (double *)(v85 + v252), 0.05);
          *(void *)(v254 + 224) = v259;
          *(void *)(v254 + 232) = v260;
          *(void *)(v254 + 240) = v261;
          *(void *)(v254 + 248) = v262;
        }
        v263 = (double *)(v85 + v249);
        uint64_t v264 = v298 + v253;
        *(double *)(v264 + 448) = FigMotionMultiplyByInverseOfQuaternion((double *)v254, v248);
        *(void *)(v264 + 456) = v265;
        *(void *)(v264 + 464) = v266;
        *(void *)(v264 + 472) = v267;
        uint64_t v85 = v298;
        v268 = v290[1001] ? (float32x2_t *)(v298 + v250) : 0;
        uint64_t v269 = GVSComputeTransformFromCameraMotion(v263, v291, (uint64_t)v302, v268, 0, (float *)(v298 + v251));
        if (v269) {
          break;
        }
        if (*(unsigned char *)(v298 + 200)) {
          limitTransformToOverscan((uint64_t)v285, (double *)&v307 + 1, v298 + v251, *(float *)&v302[20]);
        }
        v248 += 4;
        v249 += 32;
        v250 += 8;
        v251 += 36;
        v252 += 32;
        v253 += 32;
        uint64_t v247 = v296 - 1;
        if (v296 == 1) {
          goto LABEL_402;
        }
      }
      uint64_t StabilizedSampleBuffer = v269;
      fig_log_get_emitter();
      FigDebugAssert3();
      CFTypeRef v49 = 0;
      uint64_t DerivedStorage = v287;
      a1 = v292;
      int v62 = v281;
      goto LABEL_406;
    }
    goto LABEL_402;
  }
  cf[0] = 0;
  CFTypeRef v49 = target;
  if (!target)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t StabilizedSampleBuffer = FigSignalErrorAt();
    goto LABEL_407;
  }
  if (a1)
  {
    uint64_t v50 = CMBaseObjectGetDerivedStorage();
    long long v320 = 0u;
    long long v321 = 0u;
    memset(time, 0, sizeof(time));
    long long v315 = 0u;
    long long v316 = 0u;
    long long v317 = 0u;
    long long v318 = 0u;
    long long v319 = 0u;
    *(void *)&long long v319 = *(void *)(v50 + 128);
    if (*(unsigned char *)(v50 + 224))
    {
      CMGetAttachment(target, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0);
      CGSize size = CGRectZero.size;
      *(CGPoint *)v302 = CGRectZero.origin;
      *(CGSize *)&v302[16] = size;
      if (FigCFDictionaryGetCGRectIfPresent())
      {
        DWORD2(v318) = llround(*(double *)v302);
        HIDWORD(v318) = llround(*(double *)&v302[8]);
        LODWORD(v319) = llround(*(double *)&v302[16]);
        DWORD1(v319) = llround(*(double *)&v302[24]);
      }
    }
    uint64_t StabilizedSampleBuffer = sbp_gvs_createStabilizedSampleBuffer(v50, target, (uint64_t)time, cf);
    if (!StabilizedSampleBuffer)
    {
      CFTypeRef v49 = cf[0];
      goto LABEL_407;
    }
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t StabilizedSampleBuffer = FigSignalErrorAt();
  }
LABEL_450:
  CFTypeRef v49 = 0;
LABEL_407:
  if (StabilizedSampleBuffer)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    ++*(_DWORD *)(DerivedStorage + 36);
    *(unsigned char *)(DerivedStorage + 32) = 0;
  }
LABEL_409:
  if (*(void *)(DerivedStorage + 8))
  {
    sbp_emitPendingFrames(a1, StabilizedSampleBuffer, (uint64_t)v49);
    uint64_t StabilizedSampleBuffer = 0;
  }
  if (v49) {
    CFRelease(v49);
  }
  unsigned int v272 = *(const void **)(DerivedStorage + 30136);
  if (v272)
  {
    CFRelease(v272);
    *(void *)(DerivedStorage + 30136) = 0;
  }
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
  return StabilizedSampleBuffer;
}

uint64_t sbp_gvs_finishPendingProcessing(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(unsigned char *)(DerivedStorage + 24)) {
    return 0;
  }
  uint64_t v3 = DerivedStorage;
  uint64_t v4 = DerivedStorage + 29376;
  *(unsigned char *)(DerivedStorage + 25) = 1;
  int v5 = *(_DWORD *)(DerivedStorage + 29376);
  int v6 = v5 - 1;
  if (v5 < 1)
  {
    uint64_t StabilizedSampleBuffer = 0;
  }
  else
  {
    int v7 = 0;
    uint64_t v53 = DerivedStorage + 29808;
    uint64_t v8 = DerivedStorage + 29976;
    uint64_t v48 = kFigCaptureVideoStabilizationOverscanAnalyticsKey_AverageLuxValue;
    uint64_t v56 = kFigCaptureVideoStabilizationOverscanAnalyticsKey_PortIndex;
    uint64_t v55 = kFigCaptureVideoStabilizationOverscanAnalyticsKey_QuadraBinningFactor;
    uint64_t v54 = kFigCaptureVideoStabilizationOverscanAnalyticsKey_OverscanHistogram;
    uint64_t v43 = kFigCaptureVideoStabilizationOverscanAnalyticsKey_OverscanArray;
    uint64_t v57 = DerivedStorage + 30008;
    CFStringRef key = (const __CFString *)kFigVideoStabilizationSampleBufferAttachmentKey_OverscanAnalytics;
    uint64_t v46 = a1;
    uint64_t v47 = DerivedStorage + 29376;
    int v44 = v5 - 1;
    int v45 = *(_DWORD *)(DerivedStorage + 29376);
    do
    {
      CFTypeRef v58 = 0;
      uint64_t StabilizedSampleBuffer = sbp_gvs_gaussianAverageGetStabilizedSampleBuffer(v3, &v58);
      if (v7 == v6)
      {
        uint64_t v10 = 0;
        int v11 = 0;
        uint64_t v12 = v53;
        do
        {
          if (*(_DWORD *)(v3 + 4 * v10 + 30008))
          {
            uint64_t v13 = 0;
            int v14 = 0;
            do
            {
              int v14 = (int)(float)(*(float *)(v12 + v13) + (float)v14);
              v13 += 4;
            }
            while (v13 != 28);
            if (v14 >= 1)
            {
              for (uint64_t i = 0; i != 28; i += 4)
                *(float *)(v12 + i) = *(float *)(v12 + i) / (float)v14;
              v11 += v14;
            }
          }
          ++v10;
          v12 += 28;
        }
        while (v10 != 6);
        if (v11 >= 1)
        {
          uint64_t v16 = 0;
          float v17 = (float)v11;
          do
          {
            *(float *)(v8 + v16) = *(float *)(v8 + v16) / v17;
            v16 += 4;
          }
          while (v16 != 28);
          *(float *)(v4 + 628) = *(float *)(v4 + 628) / v17;
        }
        CFTypeRef v18 = v58;
        CFTypeID v19 = +[NSMutableDictionary dictionary];
        if (v19)
        {
          CMAttachmentBearerRef target = v18;
          int v52 = v7;
          uint64_t v20 = v19;
          CGSize v51 = _createNSArray(v3 + 29976);
          objc_msgSend(v20, "setObject:forKeyedSubscript:");
          uint64_t v21 = +[NSNumber numberWithUnsignedInt:*(float *)(v4 + 628)];
          [v20 setObject:v21 forKeyedSubscript:v48];

          int64x2_t v22 = +[NSMutableArray array];
          if (v22)
          {
            unsigned int v49 = StabilizedSampleBuffer;
            uint64_t v23 = 0;
            uint64_t v24 = v53;
            uint64_t v25 = v57;
            do
            {
              int v26 = *(_DWORD *)(v25 + v23);
              if (v26)
              {
                float64x2_t v27 = +[NSMutableDictionary dictionary];
                if (v27)
                {
                  uint64_t v28 = (v26 >> 16);
                  int v29 = +[NSNumber numberWithInt:(unsigned __int16)v26];
                  [v27 setObject:v29 forKeyedSubscript:v56];

                  uint64_t v30 = +[NSNumber numberWithInt:v28];
                  [v27 setObject:v30 forKeyedSubscript:v55];

                  uint64_t v31 = _createNSArray(v24);
                  [v27 setObject:v31 forKeyedSubscript:v54];
                  [v22 addObject:v27];

                  uint64_t v25 = v57;
                }
              }
              v23 += 4;
              v24 += 28;
            }
            while (v23 != 24);
            a1 = v46;
            uint64_t v4 = v47;
            uint64_t StabilizedSampleBuffer = v49;
            int v6 = v44;
            int v5 = v45;
            if ([v22 count])
            {
              [v20 setObject:v22 forKeyedSubscript:v43];
              CMSetAttachment(target, key, v20, 1u);
            }
          }

          int v7 = v52;
          CFTypeID v19 = v20;
        }
      }
      if (*(void *)(v3 + 8))
      {
        sbp_emitPendingFrames(a1, StabilizedSampleBuffer, (uint64_t)v58);
        uint64_t StabilizedSampleBuffer = 0;
      }
      if (v58) {
        CFRelease(v58);
      }
      ++*(_DWORD *)(v3 + 36);
      ++v7;
    }
    while (v7 != v5);
  }
  uint64_t v32 = *(void **)(v3 + 88);
  if (v32) {
    AffineTransformFinish(v32);
  }
  int v33 = *(void **)(v3 + 112);
  if (v33) {
    [v33 finishProcessing];
  }
  id v34 = *(void **)(v3 + 30040);
  if (v34) {
    [v34 finishProcessing];
  }
  BOOL v35 = *(void **)(v3 + 30072);
  if (v35) {
    [v35 finishProcessing];
  }
  unsigned int v36 = *(void **)(v3 + 30080);
  if (v36) {
    [v36 finishProcessing];
  }
  if (*(void *)(v3 + 8)) {
    sbp_emitPendingFrames(a1, 0, 0);
  }
  if (*(_DWORD *)v4)
  {
    int v37 = *(_DWORD *)(v4 + 4);
    if (v37 >= 1)
    {
      for (uint64_t j = 0; j < v37; ++j)
      {
        unsigned __int8 v39 = *(const void **)(*(void *)(v3 + 29352) + 8 * j);
        if (v39)
        {
          CFRelease(v39);
          *(void *)(*(void *)(v3 + 29352) + 8 * j) = 0;
          int v37 = *(_DWORD *)(v4 + 4);
        }
      }
    }
  }
  _resetFirstFrameParameters(v3);
  *(unsigned char *)(v3 + 25) = 0;
  int v40 = *(FILE **)(v3 + 29680);
  if (v40)
  {
    fclose(v40);
    *(void *)(v3 + 29680) = 0;
  }
  return StabilizedSampleBuffer;
}

uint64_t sbp_enableLongPressMode(uint64_t a1, int a2)
{
  uint64_t v4 = (unsigned char *)(a1 + 30064);
  int v5 = (unsigned char *)(a1 + 29464);
  *(unsigned char *)(a1 + 29504) = 0;
  char v6 = a2 ^ 1;
  if (*(unsigned char *)(a1 + 30065)) {
    *(unsigned char *)(a1 + 30066) = v6;
  }
  *(unsigned char *)(a1 + 320) = *v4;
  *int v5 = v6;
  long long v19 = 0uLL;
  long long v18 = 0uLL;
  uint64_t v7 = sbp_configureOverscanParameters(a1, *(_DWORD *)(a1 + 128), *(_DWORD *)(a1 + 132), (uint64_t)&v18, (uint64_t *)&v19);
  if (v7)
  {
    uint64_t v16 = v7;
    fig_log_get_emitter();
    FigDebugAssert3();
    return v16;
  }
  if (*(_DWORD *)(a1 + 136) == v19
    && *(void *)(a1 + 140) == *(void *)((char *)&v19 + 4)
    && *(_DWORD *)(a1 + 148) == HIDWORD(v19))
  {
    *(_OWORD *)(a1 + 152) = v18;
    if (v5[240]) {
      return 0;
    }
    uint64_t v8 = *(unsigned int *)(a1 + 228);
    if ((int)v8 >= 1)
    {
      unsigned int v9 = (void *)(a1 + 288);
      BOOL v10 = 1;
      do
      {
        if (v10)
        {
          uint64_t v11 = *(v9 - 4);
          if (v4[2]) {
            BOOL v12 = 1;
          }
          else {
            BOOL v12 = v11 == 0;
          }
          BOOL v10 = !v12;
          if (v4[2]) {
            BOOL v13 = v11 == 0;
          }
          else {
            BOOL v13 = 1;
          }
          if (!v13) {
            BOOL v10 = *v9 != 0;
          }
        }
        else
        {
          BOOL v10 = 0;
        }
        ++v9;
        --v8;
      }
      while (v8);
      if (v10)
      {
        *(unsigned char *)(a1 + 224) = v6;
        AffineTransformConfigureBlurBorderPixels(*(void **)(a1 + 88), (const char *)(a1 + 224));
        if (a2)
        {
          int v14 = (const char *)*(unsigned int *)(a1 + 136);
          uint64_t v15 = *(unsigned int *)(a1 + 140);
        }
        else
        {
          int v14 = 0;
          uint64_t v15 = 0;
        }
        AffineTransformSetOverscanFill(*(void **)(a1 + 88), v14, v15);
        return 0;
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();

  return FigSignalErrorAt();
}

uint64_t sbp_enableP3ToBT2020Conversion(uint64_t a1, const char *a2)
{
  if (*(_DWORD *)(a1 + 172))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  else
  {
    char v2 = (char)a2;
    AffineTransformConfigureP3ToBT2020conversion(*(void **)(a1 + 88), a2);
    *(unsigned char *)(a1 + 29760) = v2;
    return 0;
  }
}

void _cinematic_freeRingBuffers(void *a1)
{
  char v2 = a1 + 3754;
  uint64_t v3 = (int *)a1 + 7345;
  uint64_t v4 = (void *)a1[3669];
  if (v4)
  {
    a1[3669] = 0;
    free(v4);
  }
  if (*v2)
  {
    int v5 = (char *)a1[3670];
    if (*v3 >= 1)
    {
      uint64_t v6 = 0;
      uint64_t v7 = 0;
      do
      {
        uint64_t v8 = *(void **)&v5[v6 + 8];
        *(void *)&v5[v6 + 8] = 0;

        int v5 = (char *)a1[3670];
        *(void *)&v5[v6] = 0;
        ++v7;
        v6 += 24;
      }
      while (v7 < *v3);
      goto LABEL_9;
    }
    if (v5)
    {
LABEL_9:
      a1[3670] = 0;
      free(v5);
    }
  }
  unsigned int v9 = (void *)a1[3674];
  if (v9)
  {
    int v10 = v3[14];
    if (v10 < 1) {
      goto LABEL_17;
    }
    for (uint64_t i = 0; i < v10; ++i)
    {
      uint64_t v12 = a1[3674];
      BOOL v13 = *(void **)(v12 + 8 * i);
      if (v13)
      {
        *(void *)(v12 + 8 * i) = 0;
        free(v13);
        int v10 = v3[14];
      }
    }
    unsigned int v9 = (void *)a1[3674];
    if (v9)
    {
LABEL_17:
      a1[3674] = 0;
      free(v9);
    }
  }
  int v14 = (void *)a1[3675];
  if (v14)
  {
    int v15 = v3[14];
    if (v15 < 1) {
      goto LABEL_25;
    }
    for (uint64_t j = 0; j < v15; ++j)
    {
      uint64_t v17 = a1[3675];
      long long v18 = *(void **)(v17 + 8 * j);
      if (v18)
      {
        *(void *)(v17 + 8 * j) = 0;
        free(v18);
        int v15 = v3[14];
      }
    }
    int v14 = (void *)a1[3675];
    if (v14)
    {
LABEL_25:
      a1[3675] = 0;
      free(v14);
    }
  }
  long long v19 = (void *)a1[3676];
  if (v19)
  {
    if (v3[14] < 1) {
      goto LABEL_31;
    }
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    do
    {
      uint64_t v22 = a1[3676];
      uint64_t v23 = *(void **)(v22 + v20);
      *(void *)(v22 + v20) = 0;

      uint64_t v24 = a1[3676] + v20;
      uint64_t v25 = *(void **)(v24 + 8);
      *(void *)(v24 + 8) = 0;

      ++v21;
      v20 += 240;
    }
    while (v21 < v3[14]);
    long long v19 = (void *)a1[3676];
    if (v19)
    {
LABEL_31:
      a1[3676] = 0;
      free(v19);
    }
  }
  int v26 = (void *)a1[3677];
  if (v26)
  {
    a1[3677] = 0;
    free(v26);
  }
  float64x2_t v27 = (void *)a1[3673];
  a1[3673] = 0;
}

void sbp_gvs_freeDerivedVectorsAndSphereLensMovements(uint64_t a1)
{
  char v2 = *(void **)(a1 + 28144);
  if (v2)
  {
    *(void *)(a1 + 28144) = 0;
    free(v2);
  }
  uint64_t v3 = *(void **)(a1 + 27408);
  if (v3)
  {
    *(void *)(a1 + 27408) = 0;
    free(v3);
  }
}

void sbp_ltm_deallocateLtcCorrectionTexture(uint64_t a1)
{
  uint64_t v2 = a1 + 29628;
  FigMetalDecRef();
  uint64_t v3 = *(void **)(a1 + 29640);
  *(void *)(a1 + 29640) = 0;

  *(unsigned char *)(v2 + 30) = 1;
  if (*(int *)v2 >= 3) {
    int v4 = 0;
  }
  else {
    int v4 = 3;
  }
  *(_DWORD *)(v2 + 40) = v4;
  *(unsigned char *)(v2 + 32) = 0;
}

id _loadAndConfigureVideoDeghosting(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v24 = a1;
  id v7 = a2;
  id v8 = a3;
  unsigned int v9 = [v8 objectForKeyedSubscript:@"Version"];
  id v10 = [v9 intValue];

  uint64_t v11 = +[NSString stringWithFormat:@"%@V%d", @"VideoDeghosting", v10];
  if ((int)a4 < 1 || a4 <= 0)
  {
    FigSignalErrorAt();
    int v14 = 0;
    uint64_t v12 = 0;
    BOOL v13 = 0;
LABEL_15:
    uint64_t v20 = 0;
    id v18 = 0;
    goto LABEL_16;
  }
  uint64_t v12 = +[NSString stringWithFormat:@"%@/%@.bundle", @"/System/Library/VideoProcessors", v11];
  BOOL v13 = +[NSString stringWithFormat:@"CMI%@V%d", @"VideoDeghosting", v10];
  int v14 = +[NSBundle bundleWithPath:v12];
  if (v14) {
    goto LABEL_6;
  }
  int v15 = +[NSString stringWithFormat:@"./%@.bundle", v11];
  uint64_t v16 = +[NSBundle bundleWithPath:v15];
  if (!v16)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    int v14 = 0;
    goto LABEL_15;
  }
  int v14 = (void *)v16;

LABEL_6:
  id v25 = 0;
  unsigned int v17 = [v14 loadAndReturnError:&v25];
  id v18 = v25;
  if (!v17)
  {
    uint64_t v20 = 0;
LABEL_16:
    uint64_t v21 = v24;
    goto LABEL_10;
  }
  id v19 = [objc_alloc(NSClassFromString(v13)) initWithCommandQueue:v7 imageDimensions:a4 tuningParameters:v8];
  uint64_t v20 = v19;
  uint64_t v21 = v24;
  if (!v19 || [v19 prepareToProcess:0]) {
    FigSignalErrorAt();
  }
  else {
    [v20 setCameraInfoByPortType:v24];
  }
LABEL_10:
  id v22 = v20;

  return v22;
}

double _resetFirstFrameParameters(uint64_t a1)
{
  uint64_t v2 = a1 + 29764;
  uint64_t v3 = a1 + 28808;
  uint64_t v4 = a1 + 27104;
  *(unsigned char *)(a1 + 32) = 1;
  *(_DWORD *)(a1 + 36) = 0;
  int v5 = *(void **)(a1 + 27128);
  *(_WORD *)(a1 + 10682) = 257;
  [v5 reset];
  *(_WORD *)uint64_t v4 = 257;
  *(void *)(a1 + 29336) = 0x3FF0000000000000;
  FigMotionInitializeQuaternion((void *)(a1 + 28096));
  FigMotionInitializeQuaternion((void *)(a1 + 28248));
  *(unsigned char *)(v4 + 1136) = 0;
  *(void *)(a1 + 29148) = 0x3BA3D70A00000000;
  *(void *)(a1 + 29324) = 0;
  *(void *)(a1 + 29236) = 0;
  uint64_t v6 = (void *)(a1 + 27424);
  uint64_t v7 = 7;
  do
  {
    FigMotionInitializeQuaternion(v6);
    FigMotionInitializeQuaternion(v6 + 28);
    FigMotionInitializeQuaternion(v6 + 56);
    v6 += 4;
    --v7;
  }
  while (v7);
  int v8 = *(_DWORD *)(v4 + 44);
  if ((v8 - 1) < 3)
  {
    *(unsigned char *)(v3 + 696) = v8 == 2;
    if (*(_DWORD *)(v3 + 788)) {
      [*(id *)(a1 + 29632) reset];
    }
    FigMetalDecRef();
    unsigned int v9 = *(void **)(a1 + 29640);
    *(void *)(a1 + 29640) = 0;

    *(_DWORD *)(v3 + 849) = 0x1000000;
    *(void *)(a1 + 29664) = 0x300000000;
    *(_DWORD *)(v3 + 820) = 0;
    *(_DWORD *)(v3 + 568) = 0;
    *(void *)(a1 + 29368) = 0;
    if (*(unsigned char *)(v3 + 954))
    {
      *(_DWORD *)(v2 + 8) = 0;
      *(void *)uint64_t v2 = 0xFFFFFFFFLL;
      *(_WORD *)(v2 + 16) = 1;
    }
    *(_DWORD *)(v3 + 624) = 0;
    *(void *)(a1 + 29424) = 0;
    [*(id *)(a1 + 29384) reset];
    id v10 = [*(id *)(a1 + 30080) utilities];
    [v10 resetCoefficientsFilter];

    uint64_t v11 = *(void **)(a1 + 29384);
    if (v11) {
      objc_msgSend(v11, "getQuaternionSmoothingArrays", (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, 0);
    }
    int v8 = *(_DWORD *)(v4 + 44);
  }
  if (v8 == 5)
  {
    uint64_t v12 = [*(id *)(a1 + 30080) utilities];
    [v12 resetCoefficientsFilter];
  }
  BOOL v13 = *(void **)(a1 + 29552);
  if (v13) {
    [v13 reset];
  }
  int v14 = *(void **)(a1 + 29728);
  if (v14) {
    [v14 reset];
  }
  int v15 = *(void **)(a1 + 30040);
  if (v15)
  {
    [v15 resetState];
    uint64_t v16 = *(void **)(a1 + 30040);
    *(void *)(a1 + 30040) = 0;
  }
  *(unsigned char *)uint64_t v3 = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 29744) = 0u;
  *(void *)(a1 + 28728) = 0;
  *(_DWORD *)(v4 + 1700) = -1082130432;
  *(_OWORD *)(a1 + 29808) = 0u;
  *(_OWORD *)(a1 + 29824) = 0u;
  *(_OWORD *)(a1 + 29840) = 0u;
  *(_OWORD *)(a1 + 29856) = 0u;
  *(_OWORD *)(a1 + 29872) = 0u;
  *(_OWORD *)(a1 + 29888) = 0u;
  *(_OWORD *)(a1 + 29904) = 0u;
  *(_OWORD *)(a1 + 29920) = 0u;
  *(_OWORD *)(a1 + 29936) = 0u;
  *(_OWORD *)(a1 + 29952) = 0u;
  *(_OWORD *)(a1 + 29968) = 0u;
  *(_OWORD *)(a1 + 29984) = 0u;
  *(_OWORD *)(a1 + 30000) = 0u;
  *(_OWORD *)(a1 + 30016) = 0u;
  return result;
}

__CFString *sbp_gvs_copyDebugDescription(uint64_t a1)
{
  CMBaseObjectGetDerivedStorage();
  Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  CFStringAppendFormat(Mutable, 0, @"<FigSampleBufferProcessor_GyroVideoStabilization %p>", a1);
  return Mutable;
}

uint64_t sbp_gvs_copyProperty(uint64_t a1, const void *a2, uint64_t a3, __CFDictionary **a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(unsigned char *)(DerivedStorage + 24) || !a4)
  {
    return FigSignalErrorAt();
  }
  else
  {
    uint64_t v8 = DerivedStorage;
    if (CFEqual(a2, kFigSampleBufferProcessorProperty_SourcePixelBufferAttributes))
    {
      Mutable = CFDictionaryCreateMutable(0, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      qmemcpy(v21, "v024f024024x02fx024p02fp0v8&0f8&0vx&0fx&0v8-0f8-0v8/0f8/0v8|0f8|0vx-0fx-0vx/0fx/0vx|0fx|", sizeof(v21));
      IOSurfacePropertiesDictionary = (const void *)FigCreateIOSurfacePropertiesDictionary();
      int valuePtr = 0;
      uint64_t v11 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
      for (uint64_t i = 0; i != 88; i += 4)
      {
        int v13 = *(_DWORD *)(v8 + 40);
        if (!v13 || v13 == *(_DWORD *)&v21[i])
        {
          CFNumberRef v14 = CFNumberCreate(0, kCFNumberSInt32Type, &v21[i]);
          CFArrayAppendValue(v11, v14);
          CFRelease(v14);
        }
      }
      CFDictionaryAddValue(Mutable, kCVPixelBufferPixelFormatTypeKey, v11);
      CFRelease(v11);
      CFDictionaryAddValue(Mutable, kCVPixelBufferIOSurfacePropertiesKey, IOSurfacePropertiesDictionary);
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)IOSurfacePropertiesDictionary, kIOSurfaceCacheMode);
      if (Value)
      {
        CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
        PixelBufferCacheModeArray = (const void *)FigCreatePixelBufferCacheModeArray();
        CFDictionaryAddValue(Mutable, kCVPixelBufferCacheModeKey, PixelBufferCacheModeArray);
        CFRelease(PixelBufferCacheModeArray);
      }
      CFRelease(IOSurfacePropertiesDictionary);
      uint64_t result = 0;
      *a4 = Mutable;
    }
    else
    {
      if (CFEqual(a2, kFigVideoStabilizationSampleBufferProcessorProperty_VideoStabilizationDisabled))
      {
        unsigned int v17 = (CFTypeRef *)&kCFBooleanTrue;
        int v18 = *(unsigned __int8 *)(v8 + 84);
      }
      else
      {
        if (!CFEqual(a2, kFigVideoStabilizationSampleBufferProcessorProperty_FlipHorizontalOrientation)) {
          return 4294954512;
        }
        unsigned int v17 = (CFTypeRef *)&kCFBooleanTrue;
        int v18 = *(unsigned __int8 *)(v8 + 203);
      }
      if (!v18) {
        unsigned int v17 = (CFTypeRef *)&kCFBooleanFalse;
      }
      id v19 = (__CFDictionary *)CFRetain(*v17);
      uint64_t result = 0;
      *a4 = v19;
    }
  }
  return result;
}

uint64_t sbp_configureOverscanParameters(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t *a5)
{
  int v5 = a2 - *(_DWORD *)(a1 + 29672);
  if ((v5 & 0x80000000) == 0)
  {
    int v7 = a3 - *(_DWORD *)(a1 + 29676);
    if ((v7 & 0x80000000) == 0)
    {
      uint64_t v10 = (v5 >> 1);
      uint64_t v11 = (v7 >> 1);
      unint64_t v12 = (a2 - (v5 & 0xFFFFFFFE)) | ((unint64_t)(a3 - (v7 & 0xFFFFFFFE)) << 32);
      uint64_t v13 = v10 | (v11 << 32);
      *a5 = v13;
      a5[1] = v12;
      *(_OWORD *)a4 = *(_OWORD *)a5;
      if (*(unsigned char *)(a1 + 29464))
      {
        int v16 = *(_DWORD *)(a1 + 29672);
        int v15 = *(_DWORD *)(a1 + 29676);
        double v17 = *(double *)(a1 + 29472);
        double v18 = *(double *)(a1 + 29480);
        double v19 = *(double *)(a1 + 29488);
        double v20 = *(double *)(a1 + 29496);
        v29.origin.x = v17;
        v29.origin.y = v18;
        v29.size.width = v19;
        v29.size.height = v20;
        if (CGRectIsEmpty(v29)
          || (int v21 = (int)v19, v16 < (int)v19)
          || (int v22 = (int)v20, v15 < (int)v20)
          || (int v23 = (int)v17, ((int)v17 & 1) != 0)
          || (int v24 = (int)v18, ((int)v18 & 1) != 0)
          || ((v21 + v23) & 1) != 0
          || ((v22 + v24) & 1) != 0
          || v21 + 2 * v23 != v16
          || v22 + 2 * v24 != v15)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          uint64_t v27 = FigSignalErrorAt();
          if (v27)
          {
            uint64_t v25 = v27;
            fig_log_get_emitter();
            FigDebugAssert3();
            return v25;
          }
        }
        uint64_t v10 = (v10 + (int)*(double *)(a1 + 29472));
        uint64_t v11 = (v11 + (int)*(double *)(a1 + 29480));
        uint64_t v13 = v10 | (v11 << 32);
      }
      uint64_t v25 = 0;
      *(void *)a4 = v13;
      *(void *)(a4 + 8) = (a2 - 2 * v10) | ((unint64_t)(a3 - 2 * v11) << 32);
      return v25;
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();

  return FigSignalErrorAt();
}

id sbp_initializeGPUWithRenderMethod(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 216))
  {
    if (*(void *)(a1 + 416))
    {
      FigCFDictionaryGetIntIfPresent();
    }
    else if (*(_DWORD *)(a1 + 27148) == 2)
    {
      *(_DWORD *)(a1 + 212) = 1;
    }
  }
  uint64_t v2 = *(void **)(a1 + 88);
  uint64_t v3 = (const char *)*(unsigned int *)(a1 + 212);

  return AffineTransformSetRenderMethod(v2, v3);
}

uint64_t sbp_setCameraExtrinsicAlignment(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 length] == &stru_20.fileoff)
  {
    id v4 = [v3 bytes];
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v11 = GVSQuaternionFromRotationMatrix((uint64_t)v4, (double *)&v14, (float64x2_t)0, v5, v6, v7, v8, v9, v10);
    if (!v11)
    {
      long long v12 = v15;
      *(_OWORD *)(a1 + 360) = v14;
      *(_OWORD *)(a1 + 376) = v12;
      *(unsigned char *)(a1 + 329) = 1;
    }
  }
  else
  {
    uint64_t v11 = FigSignalErrorAt();
  }

  return v11;
}

BOOL sbp_gvs_verifyInputBuffer(__CVBuffer *a1)
{
  PixelFormatCFNumberType Type = CVPixelBufferGetPixelFormatType(a1);
  IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(a1);
  size_t Width = CVPixelBufferGetWidth(a1);
  if ((Width & 3) != 0) {
    return 0;
  }
  size_t v6 = Width;
  BOOL result = 0;
  if (PixelFormatType > 1534621231)
  {
    if (PixelFormatType <= 2033463855)
    {
      if (PixelFormatType > 1885745711)
      {
        if (PixelFormatType > 2016686641)
        {
          if (PixelFormatType == 2016686642 || PixelFormatType == 2019963440) {
            goto LABEL_69;
          }
          int v7 = 2019963442;
        }
        else
        {
          if (PixelFormatType == 1885745712 || PixelFormatType == 1885745714) {
            goto LABEL_69;
          }
          int v7 = 2016686640;
        }
        goto LABEL_68;
      }
      if (PixelFormatType > 1751411058)
      {
        if (PixelFormatType != 1751411059)
        {
          if (PixelFormatType == 1882468912) {
            goto LABEL_69;
          }
          int v7 = 1882468914;
          goto LABEL_68;
        }
        return IOSurface || CVPixelBufferGetBytesPerRowOfPlane(a1, 0) == v6;
      }
      if (PixelFormatType == 1534621232) {
        goto LABEL_69;
      }
      if (PixelFormatType != 1714696752) {
        return result;
      }
    }
    else
    {
      if (PixelFormatType > 2088269359)
      {
        if (PixelFormatType > 2100852271)
        {
          if (PixelFormatType == 2100852272 || PixelFormatType == 2105046576) {
            goto LABEL_69;
          }
          int v7 = 2105042480;
        }
        else
        {
          if (PixelFormatType == 2088269360 || PixelFormatType == 2088269362) {
            goto LABEL_69;
          }
          int v7 = 2100848176;
        }
        goto LABEL_68;
      }
      if (PixelFormatType > 2084075055)
      {
        if (PixelFormatType == 2084075056 || PixelFormatType == 2088265264) {
          goto LABEL_69;
        }
        int v7 = 2088265266;
        goto LABEL_68;
      }
      if (PixelFormatType != 2033463856 && PixelFormatType != 2037741171)
      {
        int v7 = 2084070960;
        goto LABEL_68;
      }
    }
    if (IOSurface) {
      return 1;
    }
    size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a1, 0);
    size_t v9 = CVPixelBufferGetBytesPerRowOfPlane(a1, 1uLL);
    size_t v10 = CVPixelBufferGetBytesPerRowOfPlane(a1, 2uLL);
    if (BytesPerRowOfPlane == v6)
    {
      size_t v11 = v10;
      BOOL result = 0;
      if (v9 == v6 >> 1 && v11 == v6 >> 1) {
        return 1;
      }
      return result;
    }
    return 0;
  }
  if (PixelFormatType > 762869297)
  {
    if (PixelFormatType <= 796423727)
    {
      if (PixelFormatType <= 792229423)
      {
        if (PixelFormatType == 762869298) {
          goto LABEL_69;
        }
        int v7 = 792225328;
      }
      else
      {
        if (PixelFormatType == 792229424 || PixelFormatType == 796419632) {
          goto LABEL_69;
        }
        int v7 = 796419634;
      }
    }
    else if (PixelFormatType > 875704437)
    {
      if (PixelFormatType == 875704438 || PixelFormatType == 1530422832) {
        goto LABEL_69;
      }
      int v7 = 1530426928;
    }
    else
    {
      if (PixelFormatType == 796423728 || PixelFormatType == 796423730) {
        goto LABEL_69;
      }
      int v7 = 875704422;
    }
  }
  else if (PixelFormatType <= 645428785)
  {
    if (PixelFormatType <= 645424687)
    {
      if (PixelFormatType == 641230384) {
        goto LABEL_69;
      }
      int v7 = 641234480;
    }
    else
    {
      if (PixelFormatType == 645424688 || PixelFormatType == 645424690) {
        goto LABEL_69;
      }
      int v7 = 645428784;
    }
  }
  else if (PixelFormatType > 762865199)
  {
    if (PixelFormatType == 762865200 || PixelFormatType == 762865202) {
      goto LABEL_69;
    }
    int v7 = 762869296;
  }
  else
  {
    if (PixelFormatType == 645428786 || PixelFormatType == 758670896) {
      goto LABEL_69;
    }
    int v7 = 758674992;
  }
LABEL_68:
  if (PixelFormatType != v7) {
    return result;
  }
LABEL_69:
  if (IOSurface) {
    return 1;
  }
  size_t v12 = CVPixelBufferGetBytesPerRowOfPlane(a1, 0);
  size_t v13 = CVPixelBufferGetBytesPerRowOfPlane(a1, 1uLL);
  BOOL result = 0;
  if (v12 == v6 && v13 == v6) {
    return 1;
  }
  return result;
}

void _getPresentationTimeStampForSampleBuffer(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v5 = a2;
  *(_OWORD *)a3 = *(_OWORD *)&kCMTimeInvalid.value;
  *(void *)(a3 + 16) = kCMTimeInvalid.epoch;
  if (a1)
  {
    uint64_t v6 = kFigCaptureSampleBufferAttachmentKey_OriginalPresentationTimeStamp;
    CFDictionaryRef v7 = (const __CFDictionary *)CMGetAttachment(a1, kFigCaptureSampleBufferAttachmentKey_OriginalPresentationTimeStamp, 0);
    id v8 = v5;
    if (!v8) {
      id v8 = (id)CMGetAttachment(a1, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0);
    }
    size_t v9 = [v8 objectForKeyedSubscript:v6];

    if (v9)
    {
      CFDictionaryRef v10 = [v8 objectForKeyedSubscript:v6];
      CMTimeMakeFromDictionary(&v11, v10);
      *(CMTime *)a3 = v11;
    }
    else
    {
      if (v7) {
        CMTimeMakeFromDictionary(&v11, v7);
      }
      else {
        CMSampleBufferGetPresentationTimeStamp(&v11, (CMSampleBufferRef)a1);
      }
      *(CMTime *)a3 = v11;
    }
  }
}

CFTypeRef _getMetadataDictionary(const void *a1)
{
  if (a1)
  {
    CFStringRef v1 = (const __CFString *)kFigCaptureSampleBufferAttachmentKey_MetadataDictionary;
    return CMGetAttachment(a1, v1, 0);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
}

uint64_t sbp_emitPendingFrames(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = CMBaseObjectGetDerivedStorage();
  if (*(unsigned char *)(result + 29704))
  {
    if (!a2 && !a3) {
      return result;
    }
    goto LABEL_18;
  }
  if (a2) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = *(unsigned char *)(result + 29762) == 0;
  }
  char v8 = !v6 && a3 == 0;
  if (a2 || a3 || (v8 & 1) != 0 || *(unsigned char *)(result + 25))
  {
LABEL_18:
    CFDictionaryRef v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 8);
    uint64_t v9 = *(void *)(result + 16);
    return v10(v9, a2, a3);
  }
  return result;
}

uint64_t _getFrameRateConversionStatus(const void *a1)
{
  if (_getMetadataDictionary(a1))
  {
    FigCFDictionaryGetInt32IfPresent();
    return 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
}

uint64_t sbp_gvs_cinematicAddMetadataToQuaternionAndSphereRingBuffers(uint64_t a1, const __CFDictionary *a2)
{
  uint64_t v4 = a1 + 28280;
  uint64_t v5 = a1 + 27148;
  uint64_t v6 = *(unsigned int *)(a1 + 176);
  id v7 = *(id *)(a1 + 29384);
  int v182 = 0;
  uint64_t v181 = 0;
  float32x2_t v180 = 0;
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
  char v8 = (void *)(a1 + 128);
  long long v178 = 0u;
  long long v179 = 0u;
  long long v183 = 0u;
  long long v184 = 0u;
  long long v185 = 0u;
  long long v186 = 0u;
  long long v187 = 0u;
  long long v188 = 0u;
  long long v189 = 0u;
  long long v190 = 0u;
  uint64_t v9 = a1 + 424;
  long long v191 = 0u;
  if (*(unsigned char *)(v5 + 989)) {
    uint64_t v10 = a1 + 10688;
  }
  else {
    uint64_t v10 = 0;
  }
  if (*(unsigned char *)(v5 + 989)) {
    CMTime v11 = *(float32x2_t **)(*(void *)(a1 + 29392) + 8 * *(int *)(v4 + 1148));
  }
  else {
    CMTime v11 = 0;
  }
  if (*(_DWORD *)v4) {
    uint64_t v12 = v4;
  }
  else {
    uint64_t v12 = 0;
  }
  int v13 = GVSExtractMetadataFromTopToBottomRows(a2, a1 + 424, *(void **)(a1 + 27128), v10, a1 + 336, (int32x2_t *)(a1 + 128), (uint64_t)&v183, v201, (uint64_t)&v181, &v180, v11, v12, v6);
  uint64_t v162 = v13;
  if (v13)
  {
    fig_log_get_emitter();
    uint64_t v156 = v162;
    FigDebugAssert3();
    goto LABEL_126;
  }
  double v15 = 0.0;
  if (*(_DWORD *)v4 && *(unsigned char *)(v4 + 516))
  {
    LODWORD(v14) = *(_DWORD *)(v4 + 452);
    v16.f32[0] = FigMotionAdjustParallaxShiftForScalingFactor(*(float *)(v4 + 448), v14, *(float *)(v4 + 524), *(float *)&v184);
    v16.i32[1] = v17;
    double v15 = COERCE_DOUBLE(vdiv_f32(v16, (float32x2_t)vdup_lane_s32(*(int32x2_t *)((char *)&v183 + 4), 0)));
  }
  uint64_t v18 = (int)v6;
  float32x2_t v19 = v180;
  if (!*(unsigned char *)(v4 + 1508)) {
    goto LABEL_22;
  }
  LODWORD(point[0].x) = 1065353216;
  if (!FigCFDictionaryGetFloatIfPresent())
  {
    *(unsigned char *)(v4 + 1508) = 0;
LABEL_22:
    float v25 = 0.0;
    float v20 = 0.0;
    float v161 = 0.0;
    goto LABEL_23;
  }
  *(_DWORD *)double v194 = DWORD1(v184);
  FigCFDictionaryGetFloatIfPresent();
  float v20 = *((float *)&v184 + 1);
  float v21 = *(float *)&point[0].x;
  if (*((float *)&v184 + 1) != *(float *)v194)
  {
    float v21 = (float)(*((float *)&v184 + 1) / *(float *)v194) * *(float *)&point[0].x;
    *(float *)&point[0].double x = v21;
  }
  float v161 = logf(v21);
  float v22 = *(float *)(v4 + 1516);
  float v23 = *(float *)(v4 + 1520);
  float v24 = GVSComputeMinimumZoomFactor((float64x2_t *)((char *)&v190 + 8), (int32x2_t *)(a1 + 152));
  float v25 = fminf(fmaxf(v24 * powf(v20 / v24, 1.0 - fminf(fmaxf(v22, 0.0), 1.0)), v24), v23 * v24);
LABEL_23:
  if (*(unsigned char *)(v5 + 989))
  {
    sbp_gvs_computeBaseSphereLensMovements(v6, *(_DWORD *)(a1 + 180), *(void **)(*(void *)(a1 + 29392) + 8 * *(int *)(v4 + 1148)), *(void **)(*(void *)(a1 + 29400) + 8 * *(int *)(v4 + 1148)));
    uint64_t v160 = v5;
    if (*(unsigned char *)(v5 + 988) || *(_DWORD *)v5 == 3 || *(_DWORD *)v4)
    {
      uint64_t v27 = a1 + 424;
      if ((int)v6 < 1)
      {
        float32x2_t v29 = 0;
      }
      else
      {
        uint64_t v28 = *(float32x2_t **)(*(void *)(a1 + 29400) + 8 * *(int *)(v4 + 1148));
        float32x2_t v29 = 0;
        do
        {
          float32x2_t v30 = *v28++;
          v26.i32[1] = v30.i32[1];
          float32x2_t v29 = vadd_f32(v29, v30);
          --v6;
        }
        while (v6);
      }
      uint64_t v33 = v18;
      *(float *)v26.i32 = (float)(int)v18;
      float32x2_t v32 = vsub_f32(vdiv_f32(v29, (float32x2_t)vdup_lane_s32(v26, 0)), v19);
      int v31 = 1;
    }
    else
    {
      uint64_t v27 = a1 + 424;
      uint64_t v33 = (int)v6;
      int v31 = 0;
      float32x2_t v32 = 0;
    }
    CFDictionaryRef v34 = a2;
    uint64_t v35 = *(void *)(a1 + 29408);
    int v36 = *(_DWORD *)(v4 + 1148);
    if (v35)
    {
      int v37 = *(_DWORD *)(v4 + 1148);
      char v38 = (id *)(v35 + 240 * v36);
      if (*v38 || *(void *)(v35 + 240 * v36 + 8))
      {
        float32x2_t v163 = v32;
        [*v38 reset];
        [*(id *)(v35 + 240 * v37 + 8) reset];
        sbp_gvs_extractDistortionData(*(void **)(a1 + 28856), v34, (uint64_t)&v183, *(void **)(a1 + 29120), (uint64_t)v38, *(float64x2_t *)(a1 + 336));
        float32x2_t v32 = v163;
        int v36 = *(_DWORD *)(v4 + 1148);
      }
    }
    uint64_t v39 = *(void *)(a1 + 29416);
    if (v39)
    {
      uint64_t v40 = v39 + 12 * v36;
      uint64_t v41 = v181;
      *(_DWORD *)(v40 + 8) = v182;
      *(void *)uint64_t v40 = v41;
      int v36 = *(_DWORD *)(v4 + 1148);
    }
    a2 = v34;
    uint64_t v9 = v27;
    int v42 = *(_DWORD *)(v4 + 1156);
    int v43 = v36 + v42 + 1;
    uint64_t v18 = v33;
    uint64_t v5 = v160;
    do
      v43 -= v42;
    while (v43 >= v42);
    *(_DWORD *)(v4 + 1148) = v43;
    int v44 = *(_DWORD *)(v4 + 1152);
    char v8 = (void *)(a1 + 128);
    if (v44 < v42) {
      *(_DWORD *)(v4 + 1152) = v44 + 1;
    }
  }
  else
  {
    int v31 = 0;
    float32x2_t v32 = 0;
  }
  if (*(_DWORD *)v5 == 3
    && (float32x2_t v164 = v32,
        Value = (const __CFDictionary *)CFDictionaryGetValue(a2, kFigVideoStabilizationSampleBufferProcessorMetadata_InputFrameCropOffset), float32x2_t v32 = v164, Value))
  {
    point[0].y = 0.0;
    point[0].double x = 0.0;
    CGPointMakeWithDictionaryRepresentation(Value, point);
    v46.i64[0] = (int)*v8;
    v46.i64[1] = (int)HIDWORD(*v8);
    float32x2_t v32 = vsub_f32(v164, vcvt_f32_f64(vmulq_f64((float64x2_t)point[0], vcvtq_f64_s64(v46))));
    *((void *)&v184 + 1) = 0;
  }
  else
  {
    float32x2_t v19 = vsub_f32(v19, *(float32x2_t *)((char *)&v184 + 8));
    if (!v31)
    {
      FigMotionInitializeQuaternion(&v178);
      goto LABEL_50;
    }
  }
  float v165 = v32.f32[0];
  float v47 = *((float *)&v183 + 1);
  LODWORD(point[0].x) = atanf(v32.f32[1] / *((float *)&v183 + 1));
  *((float *)&point[0].x + 1) = -atanf(v165 / v47);
  LODWORD(point[0].y) = 0;
  FigMotionQuaternionFromDeltaRotation((float *)point);
  *(void *)&long long v178 = v48;
  *((void *)&v178 + 1) = v49;
  *(void *)&long long v179 = v50;
  *((void *)&v179 + 1) = v51;
LABEL_50:
  if (*(unsigned char *)(v5 + 1092))
  {
    *(void *)&long long v178 = FigMotionMultiplyQuaternions((double *)&v178, (double *)(a1 + 28248));
    *((void *)&v178 + 1) = v52;
    *(void *)&long long v179 = v53;
    *((void *)&v179 + 1) = v54;
  }
  if (*(float *)(v4 + 1440) <= 0.0)
  {
    float v72 = 0.0;
    float v65 = INFINITY;
    float v73 = NAN;
    float v63 = NAN;
  }
  else
  {
    uint64_t v55 = &v201[4 * v18];
    long long v56 = v55[1];
    *(_OWORD *)double v194 = *v55;
    *(_OWORD *)&v194[16] = v56;
    point[0].double x = FigMotionInverseOfQuaternion((uint64_t)v194);
    point[0].y = v57;
    point[1].double x = v58;
    point[1].y = v59;
    LODWORD(v192) = GVSRotateVectorByQuaternion((float *)&v181, (uint64_t)point).u32[0];
    *(void *)((char *)&v192 + 4) = __PAIR64__(v61, v60);
    GVSComputeRollPitchFromGravity((float *)&v192);
    float v63 = v62;
    float v65 = v64;
    int v66 = *(void **)(a1 + 29728);
    if (v66)
    {
      double v67 = *((double *)&v187 + 1);
      id v68 = v66;
      *(float *)&double v69 = v63;
      *(float *)&double v70 = v65;
      [v68 updateRoll:v69 pitch:v70 atTime:v67];
      [v68 filteredRoll];
      float v72 = v71;
    }
    else
    {
      float v72 = (float)(fmodf(roundf(v62 / 1.5708) + -2.0, 4.0) + 2.0) * 1.5708;
    }
    float v73 = _computeAdjustedRollForHorizonCorrection(v63, v65, v72, *(float *)(v4 + 1440));
  }
  char v177 = 0;
  if (*(_DWORD *)v5 == 3)
  {
    FigCFDictionaryGetBooleanIfPresent();
    FigCFDictionaryGetBooleanIfPresent();
  }
  long long v175 = 0u;
  long long v176 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  int v74 = *(void **)(a1 + 29552);
  if (v74)
  {
    int v75 = *(_DWORD *)(v4 + 1240);
    if (v75 == 11)
    {
      if (*(double *)&v186 <= 0.00435000006)
      {
        objc_msgSend(v74, "suspend", *(double *)&v186);
      }
      else if (*(double *)&v186 >= 0.00499999989)
      {
        objc_msgSend(v74, "resume", *(double *)&v186);
      }
      int v75 = *(_DWORD *)(v4 + 1240);
    }
    float v158 = v73;
    float v159 = v63;
    float32x2_t v76 = v19;
    float v77 = v65;
    float v78 = v72;
    float v79 = v20;
    float v80 = v25;
    double v81 = v15;
    if (v75 == 12)
    {
      point[0].double x = 0.0;
      GVSComputeMotionBlur(v9, 0, (uint64_t)&v183, (double *)(a1 + 360), point);
      double x = point[0].x;
    }
    else
    {
      double x = *(double *)&v188;
    }
    [*(id *)(a1 + 29552) updateBlurVector:x atTime:*((double *)&v187 + 1)];
    float32x2_t v166 = v83;
    [*(id *)(a1 + 29552) accumulationFilterPole];
    float v85 = v84;
    float v86 = (float)(v84 + 1.0) / (float)((float)(v85 + v85) * *((float *)&v183 + 1));
    v195[0] = -atanf(vmuls_lane_f32(v86, v166, 1));
    v195[1] = atanf(v86 * v166.f32[0]);
    v195[2] = 0.0;
    FigMotionQuaternionFromDeltaRotation(v195);
    *(void *)double v194 = v87;
    *(void *)&v194[8] = v88;
    *(void *)&v194[16] = v89;
    *(void *)&v194[24] = v90;
    long long v192 = 0u;
    long long v193 = 0u;
    FigMotionInitializeQuaternion(&v192);
    if (*(unsigned char *)(a1 + 32))
    {
      long long v91 = v193;
      *(_OWORD *)(a1 + 29560) = v192;
      *(_OWORD *)(a1 + 29576) = v91;
    }
    point[0].double x = FigMotionMultiplyQuaternions((double *)(a1 + 29560), (double *)v194);
    point[0].y = v92;
    point[1].double x = v93;
    point[1].y = v94;
    FigMotionInterpolateQuaternionsByAngle((uint64_t)&v192, &point[0].x, v85);
    point[0].double x = v95;
    point[0].y = v96;
    point[1].double x = v97;
    point[1].y = v98;
    CGPoint v99 = point[1];
    *(CGPoint *)(a1 + 29560) = point[0];
    *(CGPoint *)(a1 + 29576) = v99;
    *(CGFloat *)&long long v175 = v95;
    *((CGFloat *)&v175 + 1) = v96;
    *(CGFloat *)&long long v176 = v97;
    *((CGFloat *)&v176 + 1) = v98;
    long long v100 = &v201[4 * *(int *)(a1 + 176)];
    CGPoint v101 = (CGPoint)*((_OWORD *)v100 + 1);
    point[0] = *(CGPoint *)v100;
    point[1] = v101;
    *(float64x2_t *)&v194[8] = vnegq_f64(*(float64x2_t *)&point[0].y);
    *(CGFloat *)double v194 = point[0].x;
    *(double *)&v194[24] = -v101.y;
    *(void *)&long long v173 = FigMotionMultiplyQuaternions(&point[0].x, (double *)&v175);
    *((void *)&v173 + 1) = v102;
    *(void *)&long long v174 = v103;
    *((void *)&v174 + 1) = v104;
    *(void *)&long long v173 = FigMotionMultiplyQuaternions((double *)&v173, (double *)v194);
    *((void *)&v173 + 1) = v105;
    *(void *)&long long v174 = v106;
    *((void *)&v174 + 1) = v107;
    double v15 = v81;
    float v20 = v79;
    float v25 = v80;
    float v72 = v78;
    float v65 = v77;
    float32x2_t v19 = v76;
    float v73 = v158;
    float v63 = v159;
  }
  else
  {
    FigMotionInitializeQuaternion(&v175);
    FigMotionInitializeQuaternion(&v173);
  }
  uint64_t v172 = 0;
  FigCFDictionaryGetInt64IfPresent();
  [v7 openForNewData];
  *(float *)double v170 = v161;
  *(float *)&v170[1] = v20;
  *(float *)&v170[2] = v25;
  uint64_t v171 = 0;
  [v7 setZoomSmoothingMetadataInput:v170];
  v169[6] = v189;
  v169[7] = v190;
  v169[8] = v191;
  v169[2] = v185;
  v169[3] = v186;
  v169[4] = v187;
  v169[5] = v188;
  v169[0] = v183;
  v169[1] = v184;
  [v7 setCameraMetadataInput:v169];
  [v7 setDidHaveMotionDataInput:*(unsigned char *)(a1 + 10682) != 0];
  objc_msgSend(v7, "setAppliedCenterAdjustmentInput:", v178, v179);
  objc_msgSend(v7, "setMotionBlurAdjustmentInput:", v173, v174);
  [v7 setIsLivePhotoKeyFrameInput:v177 != 0];
  [v7 setSerialNumberInput:v172];
  objc_msgSend(v7, "setNormalizedOutputShiftInput:", COERCE_DOUBLE(vdiv_f32(vneg_f32(v19), (float32x2_t)vdup_lane_s32(*(int32x2_t *)((char *)&v183 + 4), 0))));
  [v7 setNormalizedInputShiftInput:v15];
  if ((v18 & 0x80000000) == 0)
  {
    uint64_t v110 = 0;
    do
    {
      float v111 = (char *)[v7 originalQuaternionsInput] + v110 * 8;
      long long v112 = *(_OWORD *)&v201[v110 + 2];
      _OWORD *v111 = *(_OWORD *)&v201[v110];
      v111[1] = v112;
      memset(point, 0, sizeof(point));
      point[0].double x = FigMotionMultiplyByInverseOfQuaternion((double *)&v178, (uint64_t *)&v175);
      point[0].y = v113;
      point[1].double x = v114;
      point[1].y = v115;
      CFStringRef v116 = (double *)((char *)[v7 quaternionsInput] + v110 * 8);
      double v108 = FigMotionMultiplyQuaternions((double *)&v201[v110], &point[0].x);
      *CFStringRef v116 = v108;
      v116[1] = v109;
      *((void *)v116 + 2) = v117;
      *((void *)v116 + 3) = v118;
      v110 += 4;
    }
    while (4 * (v18 + 1) != v110);
  }
  if (*(float *)(v4 + 1440) > 0.0)
  {
    *(float *)&double v108 = v63;
    *(float *)&double v109 = v65;
    objc_msgSend(v7, "setRollPitchInput:", v108, v109);
    *(float *)&double v119 = v72;
    [v7 setRollHorizonTargetInput:v119];
    float v120 = (double *)[v7 quaternionsInput];
    objc_msgSend(v7, "setHorizonQuaternionsInput:", _adjustQuaternionForRollCorrection(&v120[4 * v18], v73 - v63, v121, v122, v123, v124));
  }
  double v125 = *((double *)&v187 + 1);
  double v168 = *((double *)&v187 + 1);
  if (*(_DWORD *)v5 == 2)
  {
    FigCFDictionaryGetDoubleIfPresent();
    double v125 = v168;
  }
  [v7 setOutputFrameTimeInput:v125];
  if ((int)[v7 count] < 1) {
    goto LABEL_92;
  }
  long long v199 = 0u;
  long long v200 = 0u;
  long long v197 = 0u;
  long long v198 = 0u;
  memset(point, 0, sizeof(point));
  if (v7) {
    [v7 getSmoothingAnalysisArrays];
  }
  [v7 outputFrameTimeInput];
  double v127 = v126 - *(double *)(v197 + 8 * (int)v200);
  float v128 = v127;
  *(float *)&double v127 = v128;
  [v7 setFrameDurationInput:v127];
  if ((int)[v7 count] >= 2)
  {
    [v7 frameDurationPrevious];
    float v128 = (float)(*(float *)&v129 + v128) * 0.5;
  }
  if (((*(float *)&double v129 = v128, [v7 setFrameDurationPrevious:v129], *(_DWORD *)v4)
     || *(unsigned char *)(a1 + 392))
    && ((int v130 = *(_DWORD *)(*(void *)&point[1].y + 144 * (int)v200 + 136), !v7)
      ? (int v131 = 0)
      : ([v7 cameraMetadataInput], int v131 = v167),
        v131 != v130))
  {
    BOOL v136 = 0;
  }
  else
  {
LABEL_92:
    double v132 = *(double *)&v187;
    id v133 = *(id *)(a1 + 29384);
    if ((int)[v133 count] <= 1)
    {
      int v135 = 1;
    }
    else
    {
      long long v199 = 0u;
      long long v200 = 0u;
      long long v197 = 0u;
      long long v198 = 0u;
      memset(point, 0, sizeof(point));
      if (v133)
      {
        [v133 getSmoothingAnalysisArrays];
        uint64_t v134 = (int)v200;
      }
      else
      {
        uint64_t v134 = 0;
      }
      [v133 outputFrameTimeInput];
      double v138 = v137 - *(double *)(v197 + 8 * v134);
      double v139 = 1.0;
      if (v138 > 0.0 && !*(unsigned char *)(v4 + 1224)) {
        double v139 = 0.0333333333 / v138;
      }
      *(double *)(a1 + 29336) = v139;
      double v140 = cos(0.000246 / v139);
      if (*(int *)(a1 + 176) < 1)
      {
        BOOL v146 = 1;
LABEL_107:
        int v135 = 1;
      }
      else
      {
        double v141 = v140;
        uint64_t v142 = 0;
        uint64_t v143 = 0;
        while (1)
        {
          v144 = (char *)[v133 originalQuaternionsInput];
          double v145 = fabs(FigMotionMultiplyByInverseOfQuaternion((double *)&v144[v142], (uint64_t *)(*(void *)(*(void *)&point[0].x + 8 * v143) + 32 * v134)));
          BOOL v146 = v145 >= v141;
          if (v145 < v141) {
            break;
          }
          ++v143;
          v142 += 32;
          if (v143 >= *(int *)(a1 + 176)) {
            goto LABEL_107;
          }
        }
        int v135 = 0;
      }
      if (*(unsigned char *)(v4 + 1224))
      {
        *(_DWORD *)double v194 = 0;
        if (FigCFDictionaryGetFloat32IfPresent()) {
          BOOL v147 = fabsf(*(float *)v194) > 0.6;
        }
        else {
          BOOL v147 = 0;
        }
        if (v132 <= 0.0) {
          double v148 = 0.00006324555;
        }
        else {
          double v148 = 0.00006324555 / (0.023223 / v132);
        }
        double v149 = cos(v148);
        if (*(int *)(a1 + 176) >= 2)
        {
          double v151 = v149;
          uint64_t v152 = 1;
          uint64_t v153 = 32;
          do
          {
            double v154 = fabs(FigMotionMultiplyByInverseOfQuaternion((double *)((char *)[v133 originalQuaternionsInput] + v153 - 32), (uint64_t *)((char *)objc_msgSend(v133, "originalQuaternionsInput") + v153)));
            BOOL v150 = v154 >= v151;
            if (v154 < v151) {
              break;
            }
            ++v152;
            v153 += 32;
          }
          while (v152 < *(int *)(a1 + 176));
        }
        else
        {
          BOOL v150 = 1;
        }
        int v155 = v146 || v150;
        if (v147) {
          int v135 = 1;
        }
        else {
          int v135 = v155;
        }
      }
    }

    BOOL v136 = v135 != 0;
  }
  [v7 setIsPhysicalTripodInput:v136];
  [*(id *)(a1 + 29384) commitData];
  uint64_t v156 = v162;
LABEL_126:
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }

  return v156;
}

uint64_t sbp_ltm_checkPerVideoDisablement(uint64_t a1, CFDictionaryRef theDict)
{
  id v3 = (unsigned __int8 *)(a1 + 29624);
  *(unsigned char *)(a1 + 29657) = 0;
  if (theDict)
  {
    uint64_t v5 = (const void *)kFigCaptureStreamMetadata_LTMCurve;
    if (CFDictionaryContainsKey(theDict, kFigCaptureStreamMetadata_LTMCurve))
    {
      uint64_t v6 = CFDictionaryGetValue(theDict, v5);
      v3[33] = [v6 intValue] == 2;
    }
    int v7 = v3[33];
    if (v3[33]) {
      int v7 = v3[32] ^ 1;
    }
  }
  else
  {
    int v7 = 0;
  }
  int v8 = v7 | v3[34];
  v3[34] = v8 != 0;
  uint64_t v9 = *(void *)(a1 + 29640);
  if (v9) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = v8 == 0;
  }
  if (!v10)
  {
    if (!v9 || !v8) {
      return 0;
    }
LABEL_13:
    sbp_ltm_deallocateLtcCorrectionTexture(a1);
    return 0;
  }
  uint64_t v12 = [*(id *)(a1 + 29632) allocateLTCsCorrectionTex:*v3 forISPProcessing:*(_DWORD *)(a1 + 172) == 3];
  int v13 = *(void **)(a1 + 29640);
  *(void *)(a1 + 29640) = v12;

  if (*(void *)(a1 + 29640))
  {
    if (!v3[34]) {
      return 0;
    }
    goto LABEL_13;
  }
  fig_log_get_emitter();
  FigDebugAssert3();

  return FigSignalErrorAt();
}

void _setAttachedMediaToSampleBuffer(const void *a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (a1 && v10)
  {
    CFStringRef v6 = (const __CFString *)kFigSampleBufferAttachmentKey_AttachedMedia;
    int v7 = CMGetAttachment(a1, kFigSampleBufferAttachmentKey_AttachedMedia, 0);
    id v8 = [v7 mutableCopy];
    if (!v8) {
      id v8 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:1];
    }
    [v8 setObject:v5 forKeyedSubscript:v10];
    if ([v8 count])
    {
      id v9 = [v8 copy];
      CMSetAttachment(a1, v6, v9, 1u);
    }
    else
    {
      CMRemoveAttachment(a1, v6);
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

void _runVideoDeghostingDetection(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (v3)
  {
    int v4 = *(_DWORD *)(a2 + 16);
    while (1)
    {
      uint64_t v5 = v4;
      if (!*(unsigned char *)(*(void *)(a2 + 8) + 24 * v4 + 16)) {
        break;
      }
      int v6 = *(_DWORD *)(a2 + 28);
      v4 += v6 + 1;
      do
        v4 -= v6;
      while (v4 >= v6);
      if (*(_DWORD *)(a2 + 20) == v4) {
        goto LABEL_11;
      }
    }
    id v15 = v3;
    _updateVideoDeghostingGhostInformationLookAhead((uint64_t)[v3 ghostInformationLookAheadPointer], a2, v4, *(_DWORD *)(a2 + 20));
    uint64_t v7 = *(void *)(*(void *)a2 + 8 * v5);
    [v15 setSampleBuffer:v7];
    if ([v15 detectAndTrack])
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    uint64_t v8 = 3 * v5;
    uint64_t v9 = *(void *)(a2 + 8) + 24 * v5;
    *(unsigned char *)(v9 + 16) = 1;
    *(void *)uint64_t v9 = v7;
    id v10 = objc_alloc((Class)NSDictionary);
    CMTime v11 = [v15 detectionResult];
    id v12 = [v10 initWithDictionary:v11];
    uint64_t v13 = *(void *)(a2 + 8) + 8 * v8;
    double v14 = *(void **)(v13 + 8);
    *(void *)(v13 + 8) = v12;

    id v3 = v15;
  }
LABEL_11:
}

id _shouldBypassSmartStyle(const void *a1)
{
  if (!a1)
  {
    id v3 = 0;
    uint64_t v2 = 0;
    goto LABEL_10;
  }
  CFStringRef v1 = CMGetAttachment(a1, kFigSampleBufferAttachmentKey_AttachedMedia, 0);
  uint64_t v2 = v1;
  if (!v1)
  {
    id v3 = 0;
    goto LABEL_10;
  }
  id v3 = [v1 objectForKeyedSubscript:kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingLearnedCoefficients];

  if (!v3)
  {
LABEL_10:
    id v6 = &dword_0 + 1;
    goto LABEL_7;
  }
  int v4 = CMGetAttachment(v3, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0);
  id v3 = v4;
  if (v4)
  {
    uint64_t v5 = [v4 objectForKeyedSubscript:kFigCaptureSampleBufferMetadata_SmartStyleIsIdentityCoefficients];
    id v6 = [v5 BOOLValue];
  }
  else
  {
    id v6 = 0;
  }
LABEL_7:

  return v6;
}

uint64_t _enqueueCoefficientsForSmartStyleFilterForwardLearning(uint64_t a1, CMAttachmentBearerRef target)
{
  if (!a1)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v2 = 0;
LABEL_15:
    int v4 = 0;
LABEL_18:
    uint64_t v7 = 4294954516;
    goto LABEL_10;
  }
  uint64_t v2 = (void *)target;
  if (!target)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_15;
  }
  int v4 = CMGetAttachment(target, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0);
  if (!v4)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v2 = 0;
    goto LABEL_18;
  }
  if (gGMFigKTraceEnabled == 1)
  {
    _getPresentationTimeStampForSampleBuffer(v2, 0, (uint64_t)&time);
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }
  uint64_t v5 = CMGetAttachment(v2, kFigSampleBufferAttachmentKey_AttachedMedia, 0);
  uint64_t v2 = v5;
  if (!v5
    || ([v5 objectForKeyedSubscript:kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingLearnedCoefficients], id v6 = objc_claimAutoreleasedReturnValue(), v6, !v6))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_18;
  }
  uint64_t v7 = _enqueueCoefficientsForSmartStyleFilterForwardLearningFromCoefficientsSampleBuffer(a1, v6, v4);
  if (v7)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
LABEL_10:
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }

  return v7;
}

uint64_t _runSmartStyleFilterForwardLearning(uint64_t a1, void *target)
{
  memset(&timingArrayOut, 0, sizeof(timingArrayOut));
  CFTypeRef v30 = 0;
  CFTypeRef cf = 0;
  if (!a1 || !target)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v6 = 0;
LABEL_48:
    uint64_t PixelBufferFromPool = 4294954516;
    goto LABEL_35;
  }
  int v4 = (int *)(a1 + 27148);
  if (!*(unsigned char *)(a1 + 30068))
  {
    uint64_t PixelBufferFromPool = 0;
    id v6 = 0;
    goto LABEL_35;
  }
  if (gGMFigKTraceEnabled == 1)
  {
    _getPresentationTimeStampForSampleBuffer(target, 0, (uint64_t)&v29);
    CMTime time = v29;
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }
  uint64_t v5 = CMGetAttachment(target, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0);
  id v6 = v5;
  if (!v5)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_48;
  }
  uint64_t v7 = kFigCaptureSampleBufferMetadata_SmartStyleLearnedCoefficientsAreFiltered;
  uint64_t v8 = [v5 objectForKeyedSubscript:kFigCaptureSampleBufferMetadata_SmartStyleLearnedCoefficientsAreFiltered];
  unsigned __int8 v9 = [v8 BOOLValue];

  if (v9)
  {
    uint64_t PixelBufferFromPool = 0;
    goto LABEL_35;
  }
  int v10 = *v4;
  if (!*v4)
  {
    uint64_t v16 = _enqueueCoefficientsForSmartStyleFilterForwardLearning(a1, target);
    if (v16)
    {
LABEL_43:
      uint64_t PixelBufferFromPool = v16;
      fig_log_get_emitter();
      goto LABEL_44;
    }
    uint64_t v18 = 3;
LABEL_22:
    if (*(unsigned char *)(a1 + 25))
    {
      if (*v4 == 2) {
        int v19 = 66000;
      }
      else {
        int v19 = 0;
      }
      if ((*v4 | 2) == 3) {
        unsigned int v20 = 66000;
      }
      else {
        unsigned int v20 = v19;
      }
    }
    else
    {
      unsigned int v20 = 0;
    }
    float v21 = (void *)kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingLearnedCoefficients;
    float v22 = [*(id *)(a1 + 48) objectForKeyedSubscript:kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingLearnedCoefficients];
    CFDictionaryRef v23 = [*(id *)(a1 + 56) objectForKeyedSubscript:v21];
    uint64_t PixelBufferFromPool = sbp_gvs_getPixelBufferFromPool(v22, v23, 0, v20, 0, 0, (CVPixelBufferRef *)&v30);

    if (PixelBufferFromPool)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      goto LABEL_35;
    }
    float v25 = [*(id *)(a1 + 30080) utilities];
    _getPresentationTimeStampForSampleBuffer(target, v6, (uint64_t)v28);
    uint64_t PixelBufferFromPool = (uint64_t)[v25 filterCoefficientsForFrameWithMetadata:v6 pts:v28 filterType:v18 toPixelBuffer:v30];

    if (!PixelBufferFromPool)
    {
      uint64_t SampleTimingInfoArray = CMSampleBufferGetSampleTimingInfoArray((CMSampleBufferRef)target, 1, &timingArrayOut, 0);
      if (SampleTimingInfoArray)
      {
        uint64_t PixelBufferFromPool = SampleTimingInfoArray;
        fig_log_get_emitter();
        goto LABEL_44;
      }
      uint64_t PixelBufferFromPool = sbp_internalCreateSampleBufferWithNewPixelBuffer((__CVBuffer *)v30, *(void **)(a1 + 64), v21, &timingArrayOut, (CMSampleBufferRef *)&cf);
      if (!PixelBufferFromPool)
      {
        [v6 setObject:&__kCFBooleanTrue forKeyedSubscript:v7];
        _setAttachedMediaToSampleBuffer(target, v21, (void *)cf);
        goto LABEL_35;
      }
    }
    fig_log_get_emitter();
LABEL_44:
    FigDebugAssert3();
    goto LABEL_35;
  }
  if (v10 != 5 && v10 != 2 || (CFArrayRef v11 = *(const __CFArray **)(a1 + 30136)) == 0)
  {
LABEL_19:
    uint64_t v18 = 1;
    goto LABEL_22;
  }
  int Count = CFArrayGetCount(v11);
  if (Count < 1)
  {
LABEL_17:
    __int32 v17 = *(const void **)(a1 + 30136);
    if (v17)
    {
      CFRelease(v17);
      *(void *)(a1 + 30136) = 0;
    }
    goto LABEL_19;
  }
  CFIndex v13 = 0;
  uint64_t v14 = Count;
  while (1)
  {
    CFDictionaryRef ValueAtIndex = (void *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 30136), v13);
    if (!ValueAtIndex) {
      break;
    }
    uint64_t v16 = _enqueueCoefficientsForSmartStyleFilterForwardLearningFromCoefficientsSampleBuffer(a1, ValueAtIndex, v6);
    if (v16) {
      goto LABEL_43;
    }
    if (v14 == ++v13) {
      goto LABEL_17;
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  uint64_t PixelBufferFromPool = FigSignalErrorAt();
LABEL_35:
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v30) {
    CFRelease(v30);
  }

  return PixelBufferFromPool;
}

uint64_t _runSmartStyleApplyOnUnstabilizedImage(uint64_t a1, void *target)
{
  if (!a1 || !target)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v27 = 0;
    id v6 = 0;
LABEL_33:
    int v10 = 0;
    goto LABEL_34;
  }
  uint64_t v4 = a1 + 30064;
  if (gGMFigKTraceEnabled == 1)
  {
    _getPresentationTimeStampForSampleBuffer(target, 0, (uint64_t)&v28);
    CMTime time = v28;
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }
  if (!*(unsigned char *)v4)
  {
    uint64_t v24 = 0;
    uint64_t v27 = 0;
    id v6 = 0;
LABEL_30:
    int v10 = 0;
    float v21 = 0;
    goto LABEL_23;
  }
  uint64_t v5 = CMGetAttachment(target, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0);
  id v6 = v5;
  if (!v5)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v27 = 0;
    goto LABEL_33;
  }
  uint64_t v7 = kFigCaptureSampleBufferMetadata_SmartStyleAppliedOnThisFrame;
  uint64_t v8 = [v5 objectForKeyedSubscript:kFigCaptureSampleBufferMetadata_SmartStyleAppliedOnThisFrame];
  unsigned __int8 v9 = [v8 BOOLValue];

  if (v9)
  {
    uint64_t v24 = 0;
    uint64_t v27 = 0;
    goto LABEL_30;
  }
  int v10 = CMGetAttachment(target, kFigSampleBufferAttachmentKey_AttachedMedia, 0);
  if (!v10)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v27 = 0;
LABEL_34:
    float v21 = 0;
    uint64_t v24 = 4294954516;
    goto LABEL_23;
  }
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)target);
  uint64_t v27 = v10;
  if (!ImageBuffer
    || (CVImageBufferRef v12 = ImageBuffer,
        [v10 objectForKeyedSubscript:kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingUnstyledThumbnail], CFIndex v13 = objc_claimAutoreleasedReturnValue(), v13, !v13))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_33;
  }
  int32x2_t v26 = v6;
  CVImageBufferRef v14 = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v13);
  if (!v14
    || (CVImageBufferRef v15 = v14,
        [v10 objectForKeyedSubscript:kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingLearnedCoefficients], uint64_t v16 = objc_claimAutoreleasedReturnValue(), v16, !v16)|| (v17 = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v16)) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v10 = 0;
    float v21 = 0;
    uint64_t v24 = 4294954516;
LABEL_37:
    id v6 = v26;
    goto LABEL_23;
  }
  CVImageBufferRef v18 = v17;
  CFStringRef v19 = (const __CFString *)kFigCaptureSampleBufferAttachmentKey_SmartStyleMetalEvent;
  int v10 = CMGetAttachment(target, kFigCaptureSampleBufferAttachmentKey_SmartStyleMetalEvent, 0);
  id v20 = objc_alloc_init(*(Class *)(a1 + 30104));
  float v21 = v20;
  if (!v20)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v24 = 4294954510;
    goto LABEL_37;
  }
  [v20 setMetalSharedEvent:v10];
  [v21 setInputUnstyledPixelBuffer:v12];
  [v21 setInputUnstyledThumbnailPixelBuffer:v15];
  id v6 = v26;
  [v21 setInputMetadataDict:v26];
  [v21 setInputStyleCoefficientsPixelBuffer:v18];
  [v21 setOutputStyledPixelBuffer:v12];
  id updated = (id)_updateSmartStyleGlobalMixFactor((float32x2_t *)a1, v26);
  if (updated
    || (LODWORD(v23) = *(_DWORD *)(v4 + 92),
        [v21 setGlobalLinearSystemMixFactor:v23],
        [*(id *)(a1 + 30080) setInputOutput:v21],
        id updated = [*(id *)(a1 + 30080) process],
        updated)
    || (id updated = [*(id *)(a1 + 30080) finishProcessing], updated)
    || ([v26 setObject:&__kCFBooleanTrue forKeyedSubscript:v7], !*(unsigned char *)(v4 + 2))
    && (id updated = (id)_removeSmartStyleAttachments(a1, target), updated))
  {
    uint64_t v24 = (uint64_t)updated;
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    if (v10) {
      CMRemoveAttachment(target, v19);
    }
    uint64_t v24 = 0;
  }
LABEL_23:
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }

  return v24;
}

uint64_t _removeSmartStyleAttachments(uint64_t a1, CMAttachmentBearerRef target)
{
  if (a1 && target)
  {
    uint64_t result = CMGetAttachment(target, kFigSampleBufferAttachmentKey_AttachedMedia, 0);
    if (result)
    {
      uint64_t v4 = (void *)result;
      v15[0] = kFigCaptureStreamMetadataOutputKey_HumanFullBodiesMask;
      v15[1] = kFigCaptureStreamMetadataOutputKey_HumanSkinsMask;
      v15[2] = kFigCaptureStreamMetadataOutputKey_HumanHairMask;
      v15[3] = kFigCaptureStreamMetadataOutputKey_SkyMask;
      v15[4] = kFigCaptureStreamMetadataOutputKey_PreLTMThumbnail;
      v15[5] = kFigCaptureStreamMetadataOutputKey_PostColorProcessingThumbnail;
      v15[6] = kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingLinearThumbnail;
      v15[7] = kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingUnstyledThumbnail;
      v15[8] = kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingStyledThumbnail;
      v15[9] = kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingLearnedCoefficients;
      v15[10] = kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingReverseLearnedCoefficients;
      +[NSArray arrayWithObjects:v15 count:11];
      long long v10 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v11;
        do
        {
          for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(v5);
            }
            _setAttachedMediaToSampleBuffer(target, *(void **)(*((void *)&v10 + 1) + 8 * i), 0);
          }
          id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v7);
      }

      return 0;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 4294954516;
  }
  return result;
}

uint64_t sbp_gvs_gaussianAverageGetStabilizedSampleBuffer(uint64_t a1, void *a2)
{
  uint64_t v4 = a1 + 27148;
  CFTypeRef cf = 0;
  id v5 = (void *)(a1 + 29352);
  id v6 = *(void **)(a1 + 29384);
  if (v6
    && ([v6 getQuaternionSmoothingArrays],
        id v7 = *(void **)(a1 + 29384),
        long long v242 = 0u,
        long long v241 = 0u,
        long long v240 = 0u,
        v7))
  {
    [v7 getSmoothingAnalysisArrays];
  }
  else
  {
    DWORD2(v242) = 0;
    *((void *)&v241 + 1) = 0;
    *((void *)&v240 + 1) = 0;
  }
  if (!a2)
  {
    fig_log_get_emitter();
    uint64_t v224 = v225;
    LODWORD(v223) = 0;
    FigDebugAssert3();
    char v116 = 0;
    uint64_t v117 = 4294954516;
    goto LABEL_248;
  }
  if (*(void *)a1) {
    (*(void (**)(void, void, void))a1)(*(void *)(a1 + 16), 0, *(void *)(*(void *)(a1 + 29352) + 8 * *(int *)(v4 + 2220)));
  }
  CMSampleBufferRef sbuf = *(CMSampleBufferRef *)(*(void *)(a1 + 29352) + 8 * *(int *)(v4 + 2220));
  if (*(unsigned char *)(v4 + 989))
  {
    memcpy(*(void **)(a1 + 28144), *(const void **)(*(void *)(a1 + 29392) + 8 * *(int *)(v4 + 2276)), 8 * *(int *)(a1 + 180));
    memcpy((void *)(a1 + 28152), *(const void **)(*(void *)(a1 + 29400) + 8 * *(int *)(v4 + 2276)), 8 * *(int *)(a1 + 176));
    *(void *)(a1 + 28208) = 0x100000CFEEDFACFLL;
    *(void *)(a1 + 28216) = 0x100000CFEEDFACFLL;
    uint64_t v8 = *(void *)(a1 + 29408);
    if (v8) {
      __copy_assignment_16_16_s0_s8_t16w224(a1 + 28880, v8 + 240 * *(int *)(v4 + 2276));
    }
  }
  uint64_t v263 = 0;
  long long v9 = 0uLL;
  long long v261 = 0u;
  long long v262 = 0u;
  long long v259 = 0u;
  long long v260 = 0u;
  long long v258 = 0u;
  long long v10 = *(void **)(a1 + 29384);
  if (!v10) {
    goto LABEL_15;
  }
  [v10 getQuaternionSmoothingArrays];
  long long v11 = *(void **)(a1 + 29384);
  long long v9 = 0uLL;
  long long v256 = 0u;
  long long v257 = 0u;
  long long v254 = 0u;
  long long v255 = 0u;
  long long v253 = 0u;
  if (v11)
  {
    [v11 getRollSmoothingArraysForBaseTransform:*(unsigned int *)(a1 + 176)];
    long long v12 = *(void **)(a1 + 29384);
    long long v9 = 0uLL;
    long long v251 = 0u;
    long long v252 = 0u;
    long long v249 = 0u;
    long long v250 = 0u;
    long long v247 = 0u;
    long long v248 = 0u;
    if (v12)
    {
      [v12 getSmoothingAnalysisArrays];
      goto LABEL_17;
    }
  }
  else
  {
LABEL_15:
    long long v256 = v9;
    long long v257 = v9;
    long long v254 = v9;
    long long v255 = v9;
    long long v253 = v9;
  }
  long long v251 = v9;
  long long v252 = v9;
  long long v249 = v9;
  long long v250 = v9;
  long long v247 = v9;
  long long v248 = v9;
LABEL_17:
  float v228 = a2;
  uint64_t v229 = (uint64_t)v5;
  char v246 = 1;
  float v13 = *(float *)(v4 + 2292);
  long long v244 = 0u;
  long long v245 = 0u;
  float v14 = *(float *)(v4 + 2364);
  int v230 = DWORD1(v262);
  int v231 = v262;
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
  if (*(unsigned char *)(v4 + 2640))
  {
    CVImageBufferRef v15 = *(void **)(a1 + 29384);
    if (v15)
    {
      long long v276 = 0u;
      long long v277 = 0u;
      long long v274 = 0u;
      long long v275 = 0u;
      long long v272 = 0u;
      long long v273 = 0u;
      [v15 getSmoothingAnalysisArrays];
      int v16 = llroundf((float)1 * 0.8);
      if (v16 <= 1) {
        uint64_t v17 = 1;
      }
      else {
        uint64_t v17 = v16;
      }
      int v18 = v17 - 1;
      double v19 = *(double *)(v274 + 8 * SDWORD2(v276));
      if (v19 <= v19 + 1.01)
      {
        id v20 = (double *)(v274 + 8 * SDWORD2(v276) + 8);
        uint64_t v21 = v17 - 1;
        int v22 = -1;
        while (v21)
        {
          double v23 = *v20++;
          ++v22;
          --v21;
          if (v23 > v19 + 1.01) {
            goto LABEL_30;
          }
        }
      }
      int v22 = v18;
LABEL_30:
      if (*(int *)(v4 + 2656) <= 0) {
        int v24 = v22;
      }
      else {
        int v24 = 0;
      }
      uint64_t v25 = *((void *)&v273 + 1);
      long long v287 = 0u;
      long long v288 = 0u;
      long long v289 = 0u;
      int32x2_t v26 = *(void **)(a1 + 29384);
      if (v26) {
        [v26 getZoomSmoothingArrays];
      }
      if ((v24 & 0x80000000) == 0)
      {
        for (int i = 0; ; ++i)
        {
          int v28 = i + DWORD2(v288);
          float v29 = GVSComputeSmoothedDigitalZoomFactor((uint64_t)&v287, i, *(float *)(v4 + 2644));
          float v30 = *(float *)(v287 + 20 * v28 + 4);
          if (v29 < v30) {
            GVSComputeSmoothRamp(v29, *(float *)(v287 + 20 * v28 + 8), v30);
          }
          if (*(int *)(v4 + 2656) < 1)
          {
            *(float *)(v25 + 144 * v28 + 20) = v29;
            if (v24 == i) {
              goto LABEL_52;
            }
          }
          else
          {
            int v31 = (float *)(v287 + 20 * v28);
            float v32 = *v31;
            v31[3] = v32 + logf(v29 / v31[1]);
            if (v24 == i)
            {
              int v33 = 0;
              do
              {
                int v34 = v33 + DWORD2(v288);
                float v35 = GVSComputeDilatedTotalZoomFactor((uint64_t)&v287, *(_DWORD *)(v4 + 2656), v33);
                *(float *)(v287 + 20 * v34 + 16) = v35;
                ++v33;
              }
              while (v24 + 1 != v33);
              goto LABEL_47;
            }
          }
        }
      }
      if (*(int *)(v4 + 2656) >= 1)
      {
LABEL_47:
        if ((v22 & 0x80000000) == 0)
        {
          int v36 = 0;
          do
          {
            int v37 = v36 + DWORD2(v288);
            float v38 = GVSComputeSmoothedDilatedDigitalZoomFactor((uint64_t)&v287, *(_DWORD *)(v4 + 2656), v36);
            uint64_t v39 = v287 + 20 * v37;
            if (v38 < *(float *)(v39 + 8)) {
              float v38 = *(float *)(v39 + 8);
            }
            *(float *)(v25 + 144 * v37 + 20) = v38;
            ++v36;
          }
          while (v22 + 1 != v36);
        }
      }
    }
    else
    {
      fig_log_get_emitter();
      uint64_t v224 = v225;
      LODWORD(v223) = 0;
      FigDebugAssert3();
      int v118 = FigSignalErrorAt();
      if (v118)
      {
        int v119 = v118;
        fig_log_get_emitter();
        uint64_t v224 = v225;
        LODWORD(v223) = v119;
LABEL_272:
        FigDebugAssert3();
        goto LABEL_222;
      }
    }
  }
LABEL_52:
  int v40 = HIDWORD(v251);
  int v41 = v252;
  if (SHIDWORD(v251) > (int)v252)
  {
LABEL_56:
    if (SDWORD1(v252) >= 2)
    {
      if (SHIDWORD(v251) <= DWORD2(v251) - DWORD2(v252)) {
        int v40 = DWORD2(v251) - DWORD2(v252);
      }
      if ((int)v252 >= DWORD2(v251) + DWORD2(v252)) {
        int v41 = DWORD2(v251) + DWORD2(v252);
      }
      uint64_t v45 = v40;
      int64x2_t v46 = (uint64_t *)(*((void *)&v247 + 1) + 32 * v40);
      uint64_t v47 = v41;
      uint64_t v48 = 32 * v40 + 32;
      uint64_t v49 = v45 - 1;
      while (++v49 < v47)
      {
        uint64_t v50 = v48 + 32;
        uint64_t v51 = (uint64_t *)(*((void *)&v247 + 1) + v48);
        double v52 = FigMotionMultiplyByInverseOfQuaternion((double *)(*((void *)&v247 + 1) + v48), v46);
        uint64_t v48 = v50;
        int64x2_t v46 = v51;
        if (fabs(v52) < 0.999999244)
        {
          if (*(int *)(v4 + 2000) >= 1) {
            *(_DWORD *)(v4 + 2292) = *(_DWORD *)(v4 + 2360);
          }
          goto LABEL_66;
        }
      }
    }
    *(_DWORD *)(v4 + 2292) = 1050253722;
    int v53 = *(_DWORD *)(v4 + 2000);
    if (v53 < 255) {
      int v54 = v53 + 1;
    }
    else {
      int v54 = 255;
    }
    *(_DWORD *)(v4 + 2000) = v54;
    float v14 = 0.3;
  }
  else
  {
    int v42 = v252 - HIDWORD(v251) + 1;
    int v43 = (unsigned __int8 *)(*((void *)&v249 + 1) + SHIDWORD(v251));
    while (*v43++)
    {
      if (!--v42) {
        goto LABEL_56;
      }
    }
LABEL_66:
    *(_DWORD *)(v4 + 2000) = 0;
  }
  float v55 = *(float *)(v4 + 2572);
  float v226 = v14;
  if (v55 > 0.0)
  {
    if (*(void *)(a1 + 29728))
    {
      long long v56 = *(void **)(a1 + 29736);
      if (v56)
      {
        float v233 = v13;
        id v57 = v56;
        [v57 reset];
        uint64_t v58 = (int)v257;
        uint64_t v59 = SHIDWORD(v256);
        if ((int)v257 >= SHIDWORD(v256))
        {
          float k = *(float *)(*((void *)&v254 + 1) + 4 * (int)v257);
          double v61 = *(double *)(*((void *)&v255 + 1) + 8 * (int)v257);
          HIDWORD(v62) = -1073143301;
          do
          {
            for (float j = *(float *)(*((void *)&v254 + 1) + 4 * v58); ; float j = j + -6.2832)
            {
              float v64 = k + 3.14159265;
              if (j <= v64) {
                break;
              }
            }
            float v65 = k + -3.14159265;
            for (float k = j; k < v65; float k = k + 6.2832)
              ;
            double v66 = *(double *)(*((void *)&v255 + 1) + 8 * v58);
            double v67 = v61 - v66;
            *(float *)&double v67 = v67;
            *(float *)&double v62 = 0.3 / (float)(*(float *)&v67 + 0.3);
            *(float *)&double v67 = k;
            objc_msgSend(v57, "updateValue:withPole:", v67, v62, v223, v224);
            float v69 = v68;
            uint64_t v70 = v254;
            if (*(float *)(v254 + 8 * v58 + 4) >= 1.0472)
            {
              [v57 reset];
              uint64_t v70 = v254;
            }
            float v71 = (float *)(v70 + 8 * v58);
            float v72 = *v71;
            float v73 = _computeAdjustedRollForHorizonCorrection(*v71, v71[1], v69, v55);
            *(double *)&long long v78 = _adjustQuaternionForRollCorrection((double *)(*((void *)&v253 + 1) + 32 * v58), v73 - v72, v74, v75, v76, v77);
            *(_OWORD *)(v253 + 16 * v58) = v78;
            double v61 = v66;
            BOOL v106 = v58-- <= v59;
          }
          while (!v106);
        }

        float v13 = v233;
      }
    }
  }
  if (!*(void *)(a1 + 29552))
  {
    if ((uint64_t)v252 <= 0)
    {
      fig_log_get_emitter();
      uint64_t v224 = v225;
      LODWORD(v223) = 0;
      FigDebugAssert3();
    }
    else
    {
      int v79 = v252;
      uint64_t v80 = SHIDWORD(v251);
      int v81 = v252 - 4;
      if (SDWORD2(v251) > (int)v252 - 4) {
        int v81 = DWORD2(v251);
      }
      if (DWORD2(v251) == HIDWORD(v251)) {
        LODWORD(v82) = HIDWORD(v251);
      }
      else {
        LODWORD(v82) = v81;
      }
      if ((int)v82 <= (int)v252)
      {
        int v83 = v82 - 4;
        uint64_t v84 = *((void *)&v248 + 1);
        uint64_t v85 = v251;
        uint64_t v82 = (int)v82;
        int v86 = v252 + 1;
        uint64_t v87 = *((void *)&v248 + 1) + 84;
        do
        {
          if (v80 <= v83) {
            uint64_t v88 = v83;
          }
          else {
            uint64_t v88 = v80;
          }
          int v89 = v82 - 4;
          if ((int)v82 - 4 <= (int)v80) {
            int v89 = v80;
          }
          if ((int)v82 + 4 >= v79) {
            int v90 = v79;
          }
          else {
            int v90 = v82 + 4;
          }
          float v91 = 0.0;
          float v92 = 0.0;
          BOOL v93 = __OFSUB__(v90, v89);
          int v94 = v90 - v89;
          if (v94 < 0 == v93)
          {
            uint64_t v95 = v88 - 1;
            CGFloat v96 = (float *)(v87 + 144 * v88);
            do
            {
              float v91 = v91 + *(v96 - 1);
              float v97 = *v96;
              v96 += 36;
              float v92 = v92 + v97;
              ++v95;
            }
            while (v95 < v90);
          }
          float v98 = (float)(v94 + 1);
          *(float *)(v85 + 4 * v82) = sqrtf((float)((float)(*(float *)(v84 + 144 * v82 + 84) - (float)(v92 / v98))* (float)(*(float *)(v84 + 144 * v82 + 84) - (float)(v92 / v98)))+ (float)((float)(*(float *)(v84 + 144 * v82 + 80) - (float)(v91 / v98))* (float)(*(float *)(v84 + 144 * v82 + 80) - (float)(v91 / v98))));
          ++v82;
          ++v83;
        }
        while (v86 != v82);
      }
    }
  }
  if (SDWORD1(v252) < 1) {
    goto LABEL_144;
  }
  double v99 = *(double *)(v249 + 8 * SDWORD2(v251)) + 0.75;
  if ((int)v252 - DWORD2(v251) >= 15) {
    int v100 = 15;
  }
  else {
    int v100 = v252 - DWORD2(v251);
  }
  if (*(double *)(v249 + 8 * (SDWORD2(v251) + (uint64_t)v100)) <= v99)
  {
    int v101 = v100;
    uint64_t v102 = (double *)(v249 + 8 * (v100 + (uint64_t)SDWORD2(v251)) + 8);
    while (v252 - DWORD2(v251) != v101)
    {
      double v103 = *v102++;
      ++v101;
      if (v103 > v99)
      {
        int v100 = v101 - 1;
        goto LABEL_117;
      }
    }
    int v100 = v252 - DWORD2(v251);
  }
LABEL_117:
  float v104 = *(float *)(v4 + 2292);
  float v105 = 1.0;
  if (*(unsigned char *)(a1 + 352)) {
    BOOL v106 = (int)v252 <= SHIDWORD(v251);
  }
  else {
    BOOL v106 = 1;
  }
  if (v106)
  {
LABEL_123:
    float v109 = (float)(1920.0 / (float)*(int *)(a1 + 144)) * v105;
    if ((v100 & 0x80000000) == 0) {
      goto LABEL_124;
    }
    goto LABEL_141;
  }
  double v107 = *(double *)(v249 + 8 * (int)v252) - *(double *)(v249 + 8 * SHIDWORD(v251));
  if (v107 > 0.0)
  {
    float v108 = v107;
    float v105 = fminf(fmaxf((float)((float)((float)(v252 - HIDWORD(v251)) / v108) * 0.042088) + -1.5505, 1.0), 3.5);
    goto LABEL_123;
  }
  fig_log_get_emitter();
  uint64_t v224 = v225;
  LODWORD(v223) = 0;
  FigDebugAssert3();
  float v109 = 1.0;
  if ((v100 & 0x80000000) == 0)
  {
LABEL_124:
    uint64_t v110 = 0;
    float v111 = (unsigned char *)(*((void *)&v248 + 1) + 144 * SDWORD2(v251) + 12);
    float v112 = 0.0;
    float v113 = v104;
    do
    {
      float v114 = (float)(*(float *)(v251 + 4 * SDWORD2(v251) + 4 * v110) * v109) - *(float *)(v4 + 2376);
      if (v114 <= 0.0
        || (!*(unsigned char *)(v4 + 988) ? (float v115 = 2.0) : *v111 ? (float v115 = 0.5) : (float v115 = 2.0),
            float v104 = fmaxf(fminf(*(float *)(v4 + 2360), 10.0) - (float)(v115 * v114), 1.75),
            v104 >= v113))
      {
        float v104 = v113;
      }
      else
      {
        float v112 = fmaxf(v112, vabds_f32(*(float *)(v4 + 2292), v104) / (float)(v110 + 1));
      }
      v111 += 144;
      ++v110;
      float v113 = v104;
    }
    while (v100 + 1 != v110);
    goto LABEL_142;
  }
LABEL_141:
  float v112 = 0.0;
LABEL_142:
  if (v231 != v230) {
    goto LABEL_145;
  }
  *(float *)(v4 + 2292) = fmaxf(v14, fminf(*(float *)(v4 + 2292), v104));
LABEL_144:
  float v112 = 0.0;
LABEL_145:
  int v120 = llroundf((float)(v252 - DWORD2(v251) + 1) * 0.8);
  if (v120 <= 1) {
    uint64_t v121 = 1;
  }
  else {
    uint64_t v121 = v120;
  }
  unsigned int v122 = v121 - 1;
  double v123 = *(double *)(v249 + 8 * SDWORD2(v251));
  if (v123 > v123 + 1.01)
  {
LABEL_154:
    unsigned int v237 = 0;
    unsigned int v128 = 0;
    char v129 = 0;
    uint64_t v130 = 0;
    float v131 = v13;
    float v132 = 1.0;
    uint64_t v133 = 0;
    char v134 = 1;
    unsigned int v227 = v122;
LABEL_155:
    char v232 = v134;
    char v234 = v129;
    float v238 = v131;
    float v239 = v112;
    float v135 = -v112;
    if (v128 <= v122) {
      unsigned int v136 = v122;
    }
    else {
      unsigned int v136 = v128;
    }
    unsigned int v137 = v136 + 1;
    do
    {
      LOBYTE(v264[0]) = 1;
      unsigned int v138 = v128 + 1;
      float v139 = fmaxf(v14, fminf(*(float *)(v4 + 2360), *(float *)(v4 + 2292) + (float)(v135 * (float)(int)(v128 + 1))));
      int v140 = sbp_gvs_gaussianAverageComputeCorrection(a1, v128, 1, v264, v139);
      if (v140) {
        goto LABEL_277;
      }
      if (!LOBYTE(v264[0]))
      {
        float v235 = v13;
        if (v139 < v14)
        {
          fig_log_get_emitter();
          uint64_t v159 = v225;
          uint64_t v224 = v225;
          LODWORD(v223) = 0;
          FigDebugAssert3();
          int v160 = FigSignalErrorAt();
          float v156 = 0.0;
          if (v160)
          {
            int v119 = v160;
LABEL_271:
            fig_log_get_emitter();
            uint64_t v224 = v159;
            LODWORD(v223) = v119;
            goto LABEL_272;
          }
        }
        else
        {
          float v156 = v14;
          float v157 = fminf(fmaxf((float)(int)v128 * 0.4, 1.0), 10.0) * fmaxf(*(float *)(v4 + 2292) * 0.035, 0.1);
          while ((float)(v139 - v156) > v157)
          {
            LOBYTE(v266) = 0;
            int v158 = sbp_gvs_gaussianAverageComputeCorrection(a1, v128, 1, &v266, (float)(v156 + v139) * 0.5);
            if (v158)
            {
              int v119 = v158;
              fig_log_get_emitter();
              uint64_t v159 = v225;
              FigDebugAssert3();
              goto LABEL_271;
            }
            if ((_BYTE)v266) {
              float v156 = (float)(v156 + v139) * 0.5;
            }
            else {
              float v139 = (float)(v156 + v139) * 0.5;
            }
          }
        }
        float v161 = *(float *)(v4 + 2292);
        float v112 = fmaxf(v239, vabds_f32(v161, v156) / (float)(int)(v128 + 1));
        float v131 = fminf(v238, v156);
        unsigned int v122 = v227;
        float v13 = v235;
        float v14 = v226;
        if (v128 >= v227 || (v134 = 0, ++v128, v129 = 1, BOOL v162 = v237 >= 4, ++v237, v162))
        {
          char v246 = 0;
          goto LABEL_179;
        }
        goto LABEL_155;
      }
      if (!v128)
      {
        float v132 = *(float *)(a1 + 196);
        long long v141 = *(_OWORD *)(a1 + 28112);
        long long v244 = *(_OWORD *)(a1 + 28096);
        long long v245 = v141;
        uint64_t v133 = *(void *)(a1 + 28224);
        uint64_t v130 = *(void *)(a1 + 28232);
        long long v142 = *(_OWORD *)(a1 + 27360);
        long long v284 = *(_OWORD *)(a1 + 27344);
        long long v285 = v142;
        v286[0] = *(_OWORD *)(a1 + 27376);
        *(_OWORD *)((char *)v286 + 12) = *(_OWORD *)(a1 + 27388);
        long long v143 = *(_OWORD *)(a1 + 27296);
        long long v280 = *(_OWORD *)(a1 + 27280);
        long long v281 = v143;
        long long v144 = *(_OWORD *)(a1 + 27328);
        long long v282 = *(_OWORD *)(a1 + 27312);
        long long v283 = v144;
        long long v145 = *(_OWORD *)(a1 + 27232);
        long long v276 = *(_OWORD *)(a1 + 27216);
        long long v277 = v145;
        long long v146 = *(_OWORD *)(a1 + 27264);
        long long v278 = *(_OWORD *)(a1 + 27248);
        long long v279 = v146;
        long long v147 = *(_OWORD *)(a1 + 27168);
        long long v272 = *(_OWORD *)(a1 + 27152);
        long long v273 = v147;
        long long v148 = *(_OWORD *)(a1 + 27200);
        long long v274 = *(_OWORD *)(a1 + 27184);
        long long v275 = v148;
        long long v149 = *(_OWORD *)(a1 + 28048);
        long long v297 = *(_OWORD *)(a1 + 28032);
        long long v298 = v149;
        long long v150 = *(_OWORD *)(a1 + 28080);
        long long v299 = *(_OWORD *)(a1 + 28064);
        long long v300 = v150;
        long long v151 = *(_OWORD *)(a1 + 27984);
        long long v293 = *(_OWORD *)(a1 + 27968);
        long long v294 = v151;
        long long v152 = *(_OWORD *)(a1 + 28016);
        long long v295 = *(_OWORD *)(a1 + 28000);
        long long v296 = v152;
        long long v153 = *(_OWORD *)(a1 + 27920);
        long long v289 = *(_OWORD *)(a1 + 27904);
        long long v290 = v153;
        long long v154 = *(_OWORD *)(a1 + 27952);
        long long v291 = *(_OWORD *)(a1 + 27936);
        long long v292 = v154;
        long long v155 = *(_OWORD *)(a1 + 27888);
        float v13 = v139;
        long long v287 = *(_OWORD *)(a1 + 27872);
        long long v288 = v155;
      }
      ++v128;
    }
    while (v137 != v138);
    char v246 = v232;
    if ((v234 & 1) == 0)
    {
      int v126 = v227;
      uint64_t v167 = v130;
      float v168 = v132;
      float v112 = v239;
      goto LABEL_191;
    }
    float v161 = *(float *)(v4 + 2292);
    float v112 = v239;
    float v131 = v238;
LABEL_179:
    float v163 = fmaxf(v14, fminf(*(float *)(v4 + 2360), v161 - v112));
    float v164 = fminf(v163, fmaxf(v131, 1.75));
    if (v231 == v230) {
      float v13 = v164;
    }
    else {
      float v13 = v163;
    }
    int v140 = sbp_gvs_gaussianAverageComputeCorrection(a1, 0, 0, &v246, v13);
    if (!v140)
    {
      if (v246)
      {
LABEL_187:
        float v166 = fmaxf(*(float *)(v4 + 2364), v13);
        goto LABEL_221;
      }
      uint64_t v165 = *(void *)(a1 + 29408);
      if (!v165)
      {
LABEL_276:
        fig_log_get_emitter();
        uint64_t v224 = v225;
        LODWORD(v223) = 0;
        FigDebugAssert3();
        goto LABEL_187;
      }
      [*(id *)(v165 + 240 * *(int *)(v4 + 2276)) reset];
      [*(id *)(*(void *)(a1 + 29408) + 240 * *(int *)(v4 + 2276) + 8) reset];
      int v140 = sbp_gvs_gaussianAverageComputeCorrection(a1, 0, 0, &v246, v13);
      if (!v140)
      {
        if (v246) {
          goto LABEL_187;
        }
        goto LABEL_276;
      }
    }
LABEL_277:
    int v119 = v140;
    fig_log_get_emitter();
    uint64_t v224 = v225;
    LODWORD(v223) = v119;
    goto LABEL_272;
  }
  __n128 v124 = (double *)(v249 + 8 * SDWORD2(v251) + 8);
  uint64_t v125 = v121 - 1;
  int v126 = -1;
  do
  {
    if (!v125)
    {
      int v126 = v122;
      if ((v122 & 0x80000000) == 0) {
        goto LABEL_153;
      }
      goto LABEL_190;
    }
    double v127 = *v124++;
    ++v126;
    --v125;
  }
  while (v127 <= v123 + 1.01);
  if ((v126 & 0x80000000) == 0)
  {
LABEL_153:
    unsigned int v122 = v126;
    goto LABEL_154;
  }
LABEL_190:
  uint64_t v167 = 0;
  float v168 = 1.0;
  uint64_t v133 = 0;
LABEL_191:
  float v166 = v13;
  if (v112 == 0.0)
  {
    signed int v169 = 10 * llroundf((float)((float)*(int *)(v4 + 2300) / *(float *)(v4 + 2296)) / 30.0);
    if (v169 >= v126) {
      int v170 = v126;
    }
    else {
      int v170 = v169;
    }
    long long v270 = 0u;
    long long v271 = 0u;
    long long v268 = 0u;
    long long v269 = 0u;
    long long v266 = 0u;
    long long v267 = 0u;
    uint64_t v171 = *(void **)(a1 + 29384);
    float v172 = 0.03337;
    if (v171)
    {
      [v171 getSmoothingAnalysisArrays];
      int v173 = DWORD2(v270);
      if (SDWORD2(v270) < (int)v271) {
        float v172 = *(double *)(v268 + 8 * (DWORD2(v270) + 1)) - *(double *)(v268 + 8 * SDWORD2(v270));
      }
    }
    else
    {
      int v173 = 0;
    }
    float v174 = fmaxf(*(float *)(v4 + 2364), v13);
    if (*(_DWORD *)v4 == 3)
    {
      float v175 = 1.81;
      if ((v173 & 0x80000000) == 0)
      {
        uint64_t v176 = v173;
        double v177 = *(double *)(*((void *)&v267 + 1) + 144 * v173 + 72) + -0.5;
        uint64_t v178 = (v173 + 1);
        long long v179 = (unsigned char *)(v269 + v176);
        float32x2_t v180 = (double *)(*((void *)&v267 + 1) + 144 * (int)v176 + 72);
        while (*v180 >= v177)
        {
          if (*v179)
          {
            float v175 = 28.4;
            break;
          }
          --v179;
          v180 -= 18;
          if (!--v178) {
            break;
          }
        }
      }
      float v166 = fminf(*(float *)(v4 + 2360), fmaxf(v174 * powf(v175, v172), v174 + 0.05));
    }
    else
    {
      float v166 = fminf(*(float *)(v4 + 2360), v174 + (float)(v172 * 6.0));
      if (v166 <= v13)
      {
LABEL_258:
        if (v170 >= 1 && v166 > v13)
        {
          float v218 = v166 * 1.1;
          int v219 = 1;
          do
          {
            LOBYTE(v264[0]) = 1;
            int v220 = sbp_gvs_gaussianAverageComputeCorrection(a1, v219, 1, v264, v218);
            if (v220)
            {
              fig_log_get_emitter();
              uint64_t v224 = v225;
              LODWORD(v223) = v220;
              FigDebugAssert3();
            }
            if (!(v220 | LOBYTE(v264[0]))) {
              float v166 = v13;
            }
            if (v170 == v219) {
              break;
            }
            if (v220) {
              break;
            }
            ++v219;
          }
          while (LOBYTE(v264[0]));
        }
      }
      else
      {
        unsigned int v181 = 0;
        double v182 = 10.0 / v13 * (v172 * 30.0) * 0.000436332313;
        while (1)
        {
          char v265 = 0;
          int v183 = sbp_gvs_gaussianAverageComputeCorrection(a1, 0, 1, &v265, v166);
          if (v183) {
            break;
          }
          long long v184 = *(_OWORD *)(a1 + 28112);
          v264[0] = *(_OWORD *)(a1 + 28096);
          v264[1] = v184;
          double v185 = FigMotionMultiplyByInverseOfQuaternion((double *)&v244, (uint64_t *)v264);
          long double v186 = acos(v185);
          if (fabs(v186 + v186) <= v182 && v265 != 0) {
            goto LABEL_258;
          }
          if (v181 > 3 || (float)(v166 - v13) < 0.01)
          {
            float v166 = v13;
            goto LABEL_258;
          }
          float v166 = (float)(v13 + v166) * 0.5;
          ++v181;
          if (v166 <= v13) {
            goto LABEL_258;
          }
        }
        int v221 = v183;
        fig_log_get_emitter();
        uint64_t v224 = v225;
        LODWORD(v223) = v221;
        FigDebugAssert3();
      }
    }
  }
  *(float *)(a1 + 196) = v168;
  long long v188 = v245;
  *(_OWORD *)(a1 + 28096) = v244;
  *(_OWORD *)(a1 + 28112) = v188;
  *(void *)(a1 + 28224) = v133;
  *(void *)(a1 + 28232) = v167;
  long long v189 = v285;
  *(_OWORD *)(a1 + 27344) = v284;
  *(_OWORD *)(a1 + 27360) = v189;
  *(_OWORD *)(a1 + 27376) = v286[0];
  long long v190 = v281;
  *(_OWORD *)(a1 + 27280) = v280;
  *(_OWORD *)(a1 + 27296) = v190;
  long long v191 = v283;
  *(_OWORD *)(a1 + 27312) = v282;
  *(_OWORD *)(a1 + 27328) = v191;
  long long v192 = v277;
  *(_OWORD *)(a1 + 27216) = v276;
  *(_OWORD *)(a1 + 27232) = v192;
  long long v193 = v279;
  *(_OWORD *)(a1 + 27248) = v278;
  *(_OWORD *)(a1 + 27264) = v193;
  long long v194 = v273;
  *(_OWORD *)(a1 + 27152) = v272;
  *(_OWORD *)(a1 + 27168) = v194;
  long long v195 = v275;
  *(_OWORD *)(a1 + 27184) = v274;
  *(_OWORD *)(a1 + 27200) = v195;
  *(_OWORD *)(a1 + 27388) = *(_OWORD *)((char *)v286 + 12);
  long long v196 = v298;
  *(_OWORD *)(a1 + 28032) = v297;
  *(_OWORD *)(a1 + 28048) = v196;
  long long v197 = v300;
  *(_OWORD *)(a1 + 28064) = v299;
  *(_OWORD *)(a1 + 28080) = v197;
  long long v198 = v294;
  *(_OWORD *)(a1 + 27968) = v293;
  *(_OWORD *)(a1 + 27984) = v198;
  long long v199 = v296;
  *(_OWORD *)(a1 + 28000) = v295;
  *(_OWORD *)(a1 + 28016) = v199;
  long long v200 = v290;
  *(_OWORD *)(a1 + 27904) = v289;
  *(_OWORD *)(a1 + 27920) = v200;
  long long v201 = v292;
  *(_OWORD *)(a1 + 27936) = v291;
  *(_OWORD *)(a1 + 27952) = v201;
  long long v202 = v288;
  *(_OWORD *)(a1 + 27872) = v287;
  *(_OWORD *)(a1 + 27888) = v202;
LABEL_221:
  int v119 = 0;
  *(float *)(v4 + 2292) = v166;
  *(float *)(v4 + 2368) = v13;
LABEL_222:
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
  if (v119)
  {
    fig_log_get_emitter();
    uint64_t v224 = v225;
    LODWORD(v223) = v119;
    FigDebugAssert3();
  }
  if (*(_DWORD *)v4 == 2 && *(void *)(*((void *)&v241 + 1) + 8 * SDWORD2(v242)) != *(void *)(a1 + 29752))
  {
    *(_DWORD *)(*((void *)&v240 + 1) + 144 * SDWORD2(v242) + 20) = 1065353216;
    if (_getMetadataDictionary(sbuf)) {
      FigCFDictionaryGetFloatIfPresent();
    }
    char v203 = 1;
  }
  else
  {
    char v203 = 0;
  }
  if (v119)
  {
    *(unsigned char *)(a1 + 202) = 1;
  }
  else
  {
    if (*(unsigned char *)(a1 + 84)) {
      char v203 = 1;
    }
    *(unsigned char *)(a1 + 202) = v203;
    if ((v203 & 1) == 0) {
      goto LABEL_239;
    }
  }
  char v204 = (_OWORD *)(*(void *)(8 * (*(_DWORD *)(a1 + 176) / 2)) + 32 * SDWORD2(v242));
  long long v205 = v204[1];
  *(_OWORD *)(a1 + 28096) = *v204;
  *(_OWORD *)(a1 + 28112) = v205;
LABEL_239:
  char v206 = *(void **)(a1 + 30040);
  id v5 = (void *)v229;
  if (v206)
  {
    id v207 = v206;
    float v208 = v207;
    if (*(unsigned char *)(a1 + 25)) {
      _runVideoDeghostingDetection(v207, v229);
    }
    _updateVideoDeghostingGhostInformationLookAhead((uint64_t)objc_msgSend(v208, "ghostInformationLookAheadPointer", v223, v224), v229, *(_DWORD *)(v4 + 2220), *(_DWORD *)(v4 + 2224));
    [v208 setRepairInputSampleBuffer:sbuf];
    [v208 setRepairInputDetectionResult:*(void *)(*(void *)(a1 + 29360) + 24 * *(int *)(v4 + 2220) + 8)];
    unsigned int v209 = [v208 repair];
    if (v209)
    {
      unsigned int v222 = v209;
      fig_log_get_emitter();
      uint64_t v224 = v225;
      LODWORD(v223) = v222;
      FigDebugAssert3();
    }
  }
  uint64_t v117 = sbp_gvs_createStabilizedSampleBuffer(a1, sbuf, *((void *)&v240 + 1) + 144 * SDWORD2(v242), &cf);
  if (v117)
  {
    fig_log_get_emitter();
    uint64_t v224 = v225;
    LODWORD(v223) = v117;
    FigDebugAssert3();
    CFTypeRef v210 = cf;
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef v210 = 0;
    }
  }
  else
  {
    CFTypeRef v210 = cf;
  }
  char v116 = 1;
  *float v228 = v210;
LABEL_248:
  uint64_t v211 = *(int *)(v4 + 2220);
  int v212 = *(const void **)(*(void *)(a1 + 29352) + 8 * v211);
  if (v212)
  {
    CFRelease(v212);
    uint64_t v211 = *(int *)(v4 + 2220);
    *(void *)(*v5 + 8 * v211) = 0;
  }
  int v213 = *(_DWORD *)(v4 + 2232);
  int v214 = v211 + v213 + 1;
  do
    v214 -= v213;
  while (v214 >= v213);
  *(_DWORD *)(v4 + 2220) = v214;
  --*(_DWORD *)(v4 + 2228);
  if (*(unsigned char *)(v4 + 989))
  {
    int v215 = *(_DWORD *)(v4 + 2288);
    int v216 = *(_DWORD *)(v4 + 2276) + v215 + 1;
    do
      v216 -= v215;
    while (v216 >= v215);
    *(_DWORD *)(v4 + 2276) = v216;
    --*(_DWORD *)(v4 + 2284);
  }
  dword_0 = 0;
  objc_msgSend(*(id *)(a1 + 29384), "incrementCenter", v223, v224);
  *(unsigned char *)(a1 + 10683) = v116;
  return v117;
}

uint64_t sbp_gvs_computeBaseSphereLensMovements(uint64_t result, int a2, void *a3, void *a4)
{
  if (result == 1)
  {
    *a4 = *a3;
  }
  else if ((int)result >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      a4[v4] = a3[(float)((float)((float)(a2 - 1) * (float)(int)v4) / (float)(result - 1))];
      ++v4;
    }
    while (result != v4);
  }
  return result;
}

void sbp_gvs_extractDistortionData(void *a1, void *a2, uint64_t a3, void *a4, uint64_t a5, float64x2_t a6)
{
  id v10 = a1;
  id v11 = a2;
  id v12 = a4;
  float v13 = v12;
  if (!a5 || !v10 || !v11 || !a3 || !v12)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    int v22 = 0;
    double v19 = 0;
    float v14 = 0;
    goto LABEL_37;
  }
  float v14 = [v11 objectForKeyedSubscript:kFigCaptureStreamMetadata_PortType];
  *(unsigned char *)(a5 + 208) = 0;
  *(void *)(a5 + 224) = 0;
  *(void *)(a5 + 232) = 0;
  CVImageBufferRef v15 = [v13 allKeys];
  unsigned int v16 = [v15 containsObject:v14];

  if (!v16 || !*(void *)a5 && !*(void *)(a5 + 8))
  {
LABEL_40:
    int v22 = 0;
    double v19 = 0;
    goto LABEL_37;
  }
  if (([v14 isEqualToString:kFigCapturePortType_BackFacingSuperWideCamera] & 1) != 0
    || [v14 isEqualToString:kFigCapturePortType_FrontFacingSuperWideCamera])
  {
    *(float *)v17.i32 = (float)((float)*(int *)(a3 + 96) * 12.0) / 2464.0;
    *(int32x4_t *)(a5 + 224) = vdupq_lane_s32(v17, 0);
    int v18 = 1;
  }
  else
  {
    int v18 = 0;
  }
  memset(v49, 0, 32);
  memset(v48, 0, sizeof(v48));
  if (GVSExtractGDCPolynomialFromCameraInfoByPortType(v10, v11, (uint64_t)v48))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_40;
  }
  double v19 = [v11 objectForKeyedSubscript:kFigMotionAttachmentsSampleBufferProcessorMetadata_SphereScalingFactor];
  [v19 floatValue];
  if (v19 && (float v21 = v20, v20 > 0.0))
  {
    int v22 = [v11 objectForKeyedSubscript:kFigMotionAttachmentsSampleBufferProcessorMetadata_ScalingFactor];
    [v22 floatValue];
    if (v22 && (float v24 = v23, v23 > 0.0))
    {
      uint64_t v45 = v19;
      uint64_t v25 = v13;
      id v26 = v10;
      float v27 = 0.001 / v21;
      int v28 = v14;
      float v29 = v25;
      float v30 = v28;
      int v31 = objc_msgSend(v25, "objectForKeyedSubscript:");
      unsigned __int8 v32 = [v31 unsignedIntValue];

      int v34 = *(void **)(a5 + 8);
      if (v34 && (v32 & 2) != 0)
      {
        LODWORD(v33) = *(_DWORD *)(a3 + 20);
        if (*(float *)&v33 <= 0.0) {
          *(float *)&double v33 = 1.0;
        }
        *(float *)&double v33 = v27 / *(float *)&v33;
        [v34 updateWithCoefficients:v48 pixelSizeMm:v33 center:COERCE_DOUBLE(vcvt_f32_f64(a6))];
      }
      id v10 = v26;
      if (*(void *)a5 && (v32 & 1) != 0)
      {
        int v43 = v22;
        float64x2_t v47 = 0uLL;
        float v35 = v21 / v24;
        int v36 = [v11 objectForKeyedSubscript:kFigCaptureStreamMetadata_QuadraBinningFactor];
        int v37 = [v36 intValue];

        if (v37 <= 1) {
          uint64_t v38 = 1;
        }
        else {
          uint64_t v38 = v37;
        }
        if (FigMotionComputeOpticalCenterInBuffer((const __CFDictionary *)v11, *(void *)(a3 + 96), v38, v38, 1, &v47, v35))
        {
          float64x2_t v39 = a6;
          float64x2_t v47 = a6;
        }
        else
        {
          float64x2_t v39 = v47;
        }
        double v40 = COERCE_DOUBLE(vcvt_f32_f64(v39));
        *(float *)v39.f64 = v27;
        [*(id *)a5 updateWithCoefficients:v49 pixelSizeMm:v39.f64[0] center:v40];
        int v41 = v26;
        float v13 = v29;
        float v14 = v30;
        double v19 = v45;
        if (v18)
        {
          int v42 = objc_alloc_init(GVSDistortionModelEven14);
          [(GVSDistortionModelEven14 *)v42 updateWithCoefficients:v48 pixelSizeMm:COERCE_DOUBLE(__PAIR64__(HIDWORD(v47.f64[0]), LODWORD(v27))) center:COERCE_DOUBLE(vcvt_f32_f64(v47))];
          float32x4_t v46 = 0uLL;
          if (!GVSEstimatePaddingForDistortedTransformFits(v42, (double *)(a3 + 104), &v46)) {
            *(float32x4_t *)(a5 + 224) = v46;
          }
        }
        id v10 = v41;
        int v22 = v43;
      }
      else
      {
        float v13 = v29;
        float v14 = v30;
        double v19 = v45;
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      FigSignalErrorAt();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    int v22 = 0;
  }
LABEL_37:
}

float _computeAdjustedRollForHorizonCorrection(float result, float a2, float a3, float a4)
{
  if (a4 > 0.0 && a2 < 1.0472)
  {
    for (float i = result - a3; i > 3.1416; float i = i + -6.2832)
      ;
    for (; i < -3.1416; float i = i + 6.2832)
      ;
    if (i < 0.0) {
      a4 = -a4;
    }
    float v5 = i / a4;
    float v6 = 0.0;
    if (v5 > 0.0)
    {
      if (v5 >= 1.0)
      {
        float v6 = v5;
      }
      else
      {
        float v7 = fminf(fmaxf((float)(1.0472 - a2) / 0.2618, 0.0), 1.0);
        float v6 = (float)((float)((float)((float)(v5 * v5) * 0.0) + (float)((float)(1.0 - v7) * v5))
                   + (float)((float)((float)((float)(1.0 - v7) * -3.0) + 3.0) * (float)(v5 * (float)(v5 * v5))))
           + (float)((float)((float)((float)((float)(1.0 - v7) * 2.0) + -2.0) + 0.0)
                   * (float)(v5 * (float)(v5 * (float)(v5 * v5))));
      }
    }
    return (float)(a4 * v6) + a3;
  }
  return result;
}

double _adjustQuaternionForRollCorrection(double *a1, float a2, double a3, double a4, double a5, __n128 a6)
{
  a6.n128_f32[0] = a1[1];
  float v6 = a1[2];
  float v7 = a1[3];
  float32_t v8 = *a1;
  __n128 v9 = a6;
  v9.n128_f32[1] = v6;
  __n128 v10 = v9;
  v10.n128_f32[2] = v7;
  float32x4_t v11 = (float32x4_t)v10;
  v11.f32[3] = v8;
  if (a2 != 0.0)
  {
    float32x4_t v21 = (float32x4_t)v10;
    float v19 = a1[1];
    float32x4_t v20 = v11;
    float32x2_t v18 = (float32x2_t)v9.n128_u64[0];
    __float2 v12 = __sincosf_stret(a2 * 0.5);
    float32x4_t v13 = vmulq_n_f32((float32x4_t)xmmword_47260, v12.__sinval);
    v13.i32[3] = LODWORD(v12.__cosval);
    int32x4_t v14 = (int32x4_t)vnegq_f32(v13);
    int8x16_t v15 = (int8x16_t)vtrn2q_s32((int32x4_t)v13, vtrn1q_s32((int32x4_t)v13, v14));
    float32x4_t v16 = (float32x4_t)vrev64q_s32((int32x4_t)v13);
    v16.i32[0] = v14.i32[1];
    v16.i32[3] = v14.i32[2];
    v11.i64[0] = vaddq_f32(vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v13, (int8x16_t)v14, 8uLL), v18, 1), (float32x4_t)vextq_s8(v15, v15, 8uLL), v19), vmlaq_laneq_f32(vmulq_laneq_f32(v13, v20, 3), v16, v21, 2)).u64[0];
  }
  return *(double *)v11.i64;
}

int *_updateVideoDeghostingGhostInformationLookAhead(uint64_t a1, uint64_t a2, int a3, int a4)
{
  if (a2 && a1 && *(void *)a1)
  {
    if (*(_DWORD *)(a1 + 8) < *(_DWORD *)(a2 + 24))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    int v8 = 0;
    int v16 = a3;
    *(_DWORD *)(a1 + 12) = 0;
    do
    {
      if (v8 < *(_DWORD *)(a1 + 8))
      {
        uint64_t v9 = *(void *)(a2 + 8);
        if (*(unsigned char *)(v9 + 24 * a3 + 16))
        {
          uint64_t v10 = v9 + 24 * a3;
          uint64_t v11 = *(void *)a1 + 24 * v8;
          *(void *)uint64_t v11 = *(void *)v10;
          objc_storeStrong((id *)(v11 + 8), *(id *)(v10 + 8));
          *(unsigned char *)(v11 + 16) = *(unsigned char *)(v10 + 16);
        }
        else
        {
          uint64_t v12 = *(void *)(*(void *)a2 + 8 * a3);
          uint64_t v13 = *(void *)a1 + 24 * v8;
          *(unsigned char *)(v13 + 16) = 0;
          int32x4_t v14 = *(void **)(v13 + 8);
          *(void *)uint64_t v13 = v12;
          *(void *)(v13 + 8) = 0;
        }
      }
      uint64_t result = FigMotionIncreaseRingIndex(&v16, *(_DWORD *)(a2 + 28));
      int v8 = *(_DWORD *)(a1 + 12) + 1;
      *(_DWORD *)(a1 + 12) = v8;
      a3 = v16;
    }
    while (v16 != a4);
  }
  else
  {
    fig_log_get_emitter();
    return (int *)FigDebugAssert3();
  }
  return result;
}

uint64_t _enqueueCoefficientsForSmartStyleFilterForwardLearningFromCoefficientsSampleBuffer(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  float v6 = CMGetAttachment(a2, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0);
  memset(&v17, 0, sizeof(v17));
  _getPresentationTimeStampForSampleBuffer(a2, v6, (uint64_t)&v17);
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)a2);
  if (ImageBuffer)
  {
    CVImageBufferRef v8 = ImageBuffer;
    CMTime time1 = v17;
    CMTime time2 = *(CMTime *)(a1 + 30160);
    if (CMTimeCompare(&time1, &time2) < 1)
    {
      uint64_t v11 = 0;
    }
    else
    {
      uint64_t v9 = CMGetAttachment(a2, kFigCaptureSampleBufferAttachmentKey_SmartStyleCoefficientStyle, 0);
      uint64_t v10 = [*(id *)(a1 + 30080) utilities];
      CMTime time1 = v17;
      uint64_t v11 = (uint64_t)[v10 enqueueCoefficientsForFiltering:v8 withMetadata:v5 pts:&time1 learnedStyle:v9];

      if (v11)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
      }
      else
      {
        int v12 = *(_DWORD *)(a1 + 30120);
        if ((v12 + 1) < *(_DWORD *)(a1 + 30116)) {
          int v13 = v12 + 1;
        }
        else {
          int v13 = *(_DWORD *)(a1 + 30116);
        }
        *(_DWORD *)(a1 + 30120) = v13;
        *(CMTime *)(a1 + 30160) = v17;
      }
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v11 = 4294954516;
  }

  return v11;
}

uint64_t sbp_gvs_getPixelBufferFromPool(__CVPixelBufferPool *a1, const __CFDictionary *a2, void *a3, unsigned int a4, _DWORD *a5, int a6, CVPixelBufferRef *a7)
{
  int v13 = a3;
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
  if (v13 && a6)
  {
    dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
    ++*a5;
  }
  CVReturn PixelBufferWithAuxAttributes = CVPixelBufferPoolCreatePixelBufferWithAuxAttributes(kCFAllocatorDefault, a1, a2, a7);
  if (a4 && PixelBufferWithAuxAttributes == -6689)
  {
    unsigned int v15 = 1000;
    do
    {
      usleep(0x3E8u);
      CVReturn PixelBufferWithAuxAttributes = CVPixelBufferPoolCreatePixelBufferWithAuxAttributes(kCFAllocatorDefault, a1, a2, a7);
      if (PixelBufferWithAuxAttributes != -6689) {
        break;
      }
      BOOL v16 = v15 > a4;
      v15 += 1000;
    }
    while (!v16);
  }
  uint64_t v17 = PixelBufferWithAuxAttributes;
  if (PixelBufferWithAuxAttributes)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    if (*a7)
    {
      CFRelease(*a7);
      *a7 = 0;
    }
  }
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }

  return v17;
}

uint64_t sbp_internalCreateSampleBufferWithNewPixelBuffer(__CVBuffer *a1, void *a2, void *a3, const CMSampleTimingInfo *a4, CMSampleBufferRef *a5)
{
  id v9 = a2;
  id v10 = a3;
  uint64_t v11 = [v9 objectForKeyedSubscript:v10];

  CMVideoFormatDescriptionRef formatDescriptionOut = (CMVideoFormatDescriptionRef)v11;
  if (!v11) {
    goto LABEL_12;
  }
  id v26 = a4;
  float v27 = a5;
  int v28 = v9;
  id v29 = v10;
  int v12 = CMFormatDescriptionGetExtensions((CMFormatDescriptionRef)v11);
  CFStringRef v13 = kCVImageBufferColorPrimariesKey;
  int32x4_t v14 = [v12 objectForKeyedSubscript:kCVImageBufferColorPrimariesKey];
  CFStringRef v15 = kCVImageBufferTransferFunctionKey;
  float v30 = [v12 objectForKeyedSubscript:kCVImageBufferTransferFunctionKey];
  CFStringRef v16 = kCVImageBufferYCbCrMatrixKey;
  uint64_t v17 = [v12 objectForKeyedSubscript:kCVImageBufferYCbCrMatrixKey];
  float32x2_t v18 = (void *)CVBufferCopyAttachment(a1, v13, 0);
  float v19 = (void *)CVBufferCopyAttachment(a1, v15, 0);
  float32x4_t v20 = (void *)CVBufferCopyAttachment(a1, v16, 0);
  if (v14 == v18) {
    unsigned int v21 = 1;
  }
  else {
    unsigned int v21 = [v14 isEqual:v18];
  }
  id v9 = v28;
  if (v30 != v19) {
    v21 &= [v30 isEqual:v19];
  }
  if (v17 != v20)
  {
    if (v21 & [v17 isEqual:v20]) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if ((v21 & 1) == 0)
  {
LABEL_9:
    CMVideoFormatDescriptionRef formatDescriptionOut = 0;
    [v28 setObject:0 forKeyedSubscript:v29];
    uint64_t v11 = 0;
  }
LABEL_10:

  id v10 = v29;
  a4 = v26;
  a5 = v27;
  if (v11)
  {
    CFAllocatorRef v22 = kCFAllocatorDefault;
    goto LABEL_18;
  }
LABEL_12:
  CFAllocatorRef v22 = kCFAllocatorDefault;
  uint64_t v23 = CMVideoFormatDescriptionCreateForImageBuffer(kCFAllocatorDefault, a1, &formatDescriptionOut);
  if (v23)
  {
    uint64_t v24 = v23;
    fig_log_get_emitter();
    goto LABEL_22;
  }
  [v9 setObject:formatDescriptionOut forKeyedSubscript:v10];
  if (formatDescriptionOut)
  {
    CFRelease(formatDescriptionOut);
    uint64_t v11 = formatDescriptionOut;
  }
  else
  {
    uint64_t v11 = 0;
  }
LABEL_18:
  uint64_t v24 = CMSampleBufferCreateForImageBuffer(v22, a1, 1u, 0, 0, (CMVideoFormatDescriptionRef)v11, a4, a5);
  if (v24)
  {
    fig_log_get_emitter();
LABEL_22:
    FigDebugAssert3();
  }

  return v24;
}

uint64_t _updateSmartStyleGlobalMixFactor(float32x2_t *a1, void *a2)
{
  rect.origin.double x = 0.0;
  rect.origin.y = 0.0;
  __asm { FMOV            V0.2D, #1.0 }
  rect.CGSize size = _Q0;
  CFDictionaryRef v8 = [a2 objectForKeyedSubscript:kFigCaptureSampleBufferMetadata_FinalCropRectFromSource];
  CFDictionaryRef v9 = v8;
  if (v8 && !CGRectMakeWithDictionaryRepresentation(v8, &rect))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v20 = 4294954516;
  }
  else
  {
    float32x2_t v10 = a1[3768];
    uint32x2_t v11 = (uint32x2_t)vmvn_s8(vorr_s8((int8x8_t)vcltz_f32(v10), (int8x8_t)vcgez_f32(v10)));
    if ((vpmax_u32(v11, v11).u32[0] & 0x80000000) != 0)
    {
      uint64_t v20 = 0;
    }
    else
    {
      int v12 = a1 + 3769;
      CGFloat MidX = CGRectGetMidX(rect);
      CGFloat MidY = CGRectGetMidY(rect);
      v14.f64[0] = MidX;
      v14.f64[1] = MidY;
      float32x2_t v15 = vcvt_f32_f64(v14);
      CFStringRef v16 = [*(id *)&a1[3760] configuration];
      uint64_t v17 = [v16 styleEngineConfiguration];
      [v17 globalLinearSystemMixFactor];
      float v19 = v18;

      uint64_t v20 = 0;
      float32x2_t v21 = vsub_f32(v10, v15);
      float v22 = fminf(fmaxf(sqrtf(vaddv_f32(vmul_f32(v21, v21))) / 0.16667, 0.0), 1.0);
      float32_t v23 = v19 + (float)((float)((float)(v22 * v22) * (float)((float)(v22 * -2.0) + 3.0)) * (float)(1.0 - v19));
      v21.i32[0] = v12->i32[1];
      v12->f32[0] = v23;
      v12->f32[1] = v21.f32[0] + (float)((float)(v23 - v21.f32[0]) * 0.1);
    }
  }

  return v20;
}

__n128 __copy_assignment_16_16_s0_s8_t16w224(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)a1, *(id *)a2);
  objc_storeStrong((id *)(a1 + 8), *(id *)(a2 + 8));
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  long long v5 = *(_OWORD *)(a2 + 48);
  long long v6 = *(_OWORD *)(a2 + 64);
  long long v7 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v7;
  *(_OWORD *)(a1 + 48) = v5;
  *(_OWORD *)(a1 + 64) = v6;
  long long v8 = *(_OWORD *)(a2 + 112);
  long long v9 = *(_OWORD *)(a2 + 128);
  long long v10 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 160) = v10;
  *(_OWORD *)(a1 + 112) = v8;
  *(_OWORD *)(a1 + 128) = v9;
  __n128 result = *(__n128 *)(a2 + 176);
  long long v12 = *(_OWORD *)(a2 + 192);
  long long v13 = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a1 + 208) = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 224) = v13;
  *(__n128 *)(a1 + 176) = result;
  *(_OWORD *)(a1 + 192) = v12;
  return result;
}

uint64_t sbp_gvs_createStabilizedSampleBuffer(uint64_t a1, CMSampleBufferRef sbuf, uint64_t a3, void *a4)
{
  CMSampleBufferRef v5 = sbuf;
  uint64_t v7 = a1 + 28808;
  sourceBuffer = CMSampleBufferGetImageBuffer(sbuf);
  CMAttachmentBearerRef destination = 0;
  CVBufferRef destinationBuffer = 0;
  int FrameRateConversionStatus = _getFrameRateConversionStatus(v5);
  if (gGMFigKTraceEnabled == 1)
  {
    _getPresentationTimeStampForSampleBuffer(v5, 0, (uint64_t)&v206);
    *(_OWORD *)&time.duration.value = v206;
    time.duration.epoch = v207;
    CMTimeGetSeconds(&time.duration);
    kdebug_trace();
  }
  if (*(unsigned char *)(v7 + 954))
  {
    if (FrameRateConversionStatus == 1 && !*(unsigned char *)(v7 + 972))
    {
      uint64_t PixelBufferFromPool = 0;
      BOOL v53 = 1;
      *(unsigned char *)(v7 + 972) = 1;
      int v54 = a4;
LABEL_273:
      *(unsigned char *)(v7 + 973) = v53;
      goto LABEL_274;
    }
    *(unsigned char *)(v7 + 972) = 0;
  }
  char v204 = (int *)(a1 + 27148);
  CMAttachmentBearerRef target = v5;
  int v198 = FrameRateConversionStatus;
  long long v200 = (_DWORD *)(a1 + 128);
  if (*(_DWORD *)(a1 + 27148) != 5)
  {
    uint64_t v19 = *(void *)(a1 + 27408);
    unsigned int v20 = *(_DWORD *)(a1 + 172);
    if (gGMFigKTraceEnabled == 1) {
      kdebug_trace();
    }
    if (v20 <= 3 && *(_DWORD *)(a1 + 176) == 1)
    {
      long long v21 = *(_OWORD *)(a1 + 27152);
      long long v22 = *(_OWORD *)(a1 + 27168);
      *(_DWORD *)(v19 + 32) = *(_DWORD *)(a1 + 27184);
      *(_OWORD *)uint64_t v19 = v21;
      *(_OWORD *)(v19 + 16) = v22;
    }
    float v23 = *(float *)(a3 + 4);
    float32x2_t v24 = vmul_n_f32(vsub_f32(*(float32x2_t *)(a1 + 28208), *(float32x2_t *)(a1 + 28224)), v23);
    double v26 = *(double *)(a1 + 28232);
    float32x2_t v25 = vmul_n_f32(*(float32x2_t *)&v26, v23);
    LODWORD(v26) = v25.i32[1];
    if (*(unsigned char *)(a1 + 28137)) {
      uint64_t v27 = *(void *)(a1 + 28144);
    }
    else {
      uint64_t v27 = 0;
    }
    uint64_t v28 = GVSComputeTransforms(a1 + 128, a1 + 336, a3, a1 + 27872, v27, (_OWORD *)v19, v24.f32[0], v24.f32[1], v25.f32[0], v26, v9);
    if (v28
      || (uint64_t v28 = GVSApplyDistortionToTransforms((int32x2_t *)(a1 + 128), (id *)(a1 + 28880), v19), v28))
    {
      uint64_t PixelBufferFromPool = v28;
      fig_log_get_emitter();
      uint64_t v196 = v197;
      LODWORD(v195) = PixelBufferFromPool;
      FigDebugAssert3();
    }
    else
    {
      if (!*(unsigned char *)(v7 + 880))
      {
LABEL_42:
        uint64_t PixelBufferFromPool = 0;
        goto LABEL_43;
      }
      id v29 = *(FILE **)(a1 + 29680);
      if (v29)
      {
LABEL_36:
        int v31 = *(_DWORD *)(v7 + 572);
        if (v31 > 0) {
          int v32 = *(_DWORD *)(a1 + 36) - v31 + 1;
        }
        else {
          int v32 = *(_DWORD *)(a1 + 36);
        }
        if (!v32)
        {
          fprintf(v29, "gvsLogVersion         = %d\n", 1);
          fprintf(*(FILE **)(a1 + 29680), "inputWidth            = %d\n", *(_DWORD *)(a1 + 128));
          fprintf(*(FILE **)(a1 + 29680), "inputHeight           = %d\n", *(_DWORD *)(a1 + 132));
          fprintf(*(FILE **)(a1 + 29680), "overscanWidth         = %d\n", *(_DWORD *)(a1 + 152));
          fprintf(*(FILE **)(a1 + 29680), "overscanHeight        = %d\n", *(_DWORD *)(a1 + 156));
          fprintf(*(FILE **)(a1 + 29680), "croppedOutputWidth    = %d\n", *(_DWORD *)(a1 + 144));
          fprintf(*(FILE **)(a1 + 29680), "croppedOutputHeight   = %d\n", *(_DWORD *)(a1 + 148));
          fprintf(*(FILE **)(a1 + 29680), "derivedTransformStepX = %d\n", *(_DWORD *)(a1 + 192));
          fprintf(*(FILE **)(a1 + 29680), "derivedTransformStepY = %d\n", *(_DWORD *)(a1 + 188));
          fprintf(*(FILE **)(a1 + 29680), "derivedTransformRows  = %d\n", *(_DWORD *)(a1 + 180));
          fprintf(*(FILE **)(a1 + 29680), "derivedTransformCols  = %d\n", *(_DWORD *)(a1 + 184));
          id v29 = *(FILE **)(a1 + 29680);
        }
        GVSLogTransform(v29, v32, v19, *(_DWORD *)(a1 + 180), *(_DWORD *)(a1 + 184));
        goto LABEL_42;
      }
      float v30 = *(void **)(a1 + 29696);
      if (v30)
      {
        id v29 = fopen((const char *)[v30 UTF8String], "w");
        *(void *)(a1 + 29680) = v29;
        if (v29) {
          goto LABEL_36;
        }
      }
      else
      {
        id v55 = +[NSString stringWithFormat:@"/var/mobile/Media/DCIM/transformLog_0x%p.txt", a1];
        *(void *)(a1 + 29680) = fopen((const char *)[v55 UTF8String], "w");

        id v29 = *(FILE **)(a1 + 29680);
        if (v29) {
          goto LABEL_36;
        }
      }
      fig_log_get_emitter();
      uint64_t v196 = v197;
      LODWORD(v195) = 0;
      FigDebugAssert3();
      uint64_t PixelBufferFromPool = 4294954514;
    }
LABEL_43:
    if (gGMFigKTraceEnabled == 1) {
      kdebug_trace();
    }
    if (PixelBufferFromPool) {
      goto LABEL_291;
    }
    goto LABEL_46;
  }
  if (v5
    && (long long v10 = *(_DWORD **)(a1 + 29712)) != 0
    && (uint32x2_t v11 = *(void **)(a1 + 27408),
        CFStringRef v12 = (const __CFString *)kFigVideoStabilizationSampleBufferAttachmentKey_GPUTransformsParameters,
        (CFDataRef v13 = (const __CFData *)CMGetAttachment(v5, kFigVideoStabilizationSampleBufferAttachmentKey_GPUTransformsParameters, 0)) != 0))
  {
    CFDataRef v14 = v13;
    CFIndex Length = CFDataGetLength(v13);
    size_t v16 = 36 * *(int *)(a1 + 180) * (uint64_t)*(int *)(a1 + 184);
    if (Length == v16 + 36)
    {
      size_t v17 = Length;
      BytePtr = CFDataGetBytePtr(v14);
      memcpy(v10, BytePtr, v17);
      if (*v200 == *v10
        && *(_DWORD *)(a1 + 132) == v10[1]
        && *(_DWORD *)(a1 + 152) == v10[2]
        && *(_DWORD *)(a1 + 156) == v10[3]
        && *(_DWORD *)(a1 + 144) == v10[4]
        && *(_DWORD *)(a1 + 148) == v10[5]
        && *(_DWORD *)(a1 + 180) == v10[7]
        && *(_DWORD *)(a1 + 184) == v10[8]
        && *(_DWORD *)(a1 + 188) == v10[6])
      {
        memcpy(v11, v10 + 9, v16);
        CMSampleBufferRef v5 = target;
        CMRemoveAttachment(target, v12);
        goto LABEL_46;
      }
    }
    fig_log_get_emitter();
    uint64_t v196 = v197;
    LODWORD(v195) = 0;
    FigDebugAssert3();
    CMSampleBufferRef v5 = target;
  }
  else
  {
    fig_log_get_emitter();
    uint64_t v196 = v197;
    LODWORD(v195) = 0;
    FigDebugAssert3();
  }
  uint64_t SampleTimingInfoArray = FigSignalErrorAt();
  if (SampleTimingInfoArray) {
    goto LABEL_71;
  }
LABEL_46:
  long long v201 = (unsigned char *)(a1 + 30064);
  if (!*(unsigned char *)(v7 + 896))
  {
    if (*(unsigned char *)(a1 + 25) && (*v204 - 1) <= 2)
    {
      if (*(void *)(a1 + 72)) {
        unsigned int v45 = 0;
      }
      else {
        unsigned int v45 = 66000;
      }
    }
    else
    {
      unsigned int v45 = 0;
    }
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", @"OutputBufferPrimary", v195, v196);
    float32x4_t v46 = (__CVPixelBufferPool *)objc_claimAutoreleasedReturnValue();
    CFDictionaryRef v47 = [*(id *)(a1 + 56) objectForKeyedSubscript:@"OutputBufferPrimary"];
    uint64_t PixelBufferFromPool = sbp_gvs_getPixelBufferFromPool(v46, v47, *(void **)(a1 + 72), v45, (_DWORD *)(a1 + 80), 1, &destinationBuffer);

    if (!PixelBufferFromPool)
    {
      if (!*(unsigned char *)(v7 + 952)) {
        CVBufferPropagateAttachments(sourceBuffer, destinationBuffer);
      }
      memset(&time, 0, sizeof(time));
      uint64_t SampleTimingInfoArray = CMSampleBufferGetSampleTimingInfoArray(v5, 1, &time, 0);
      if (SampleTimingInfoArray) {
        goto LABEL_71;
      }
      uint64_t SampleTimingInfoArray = sbp_internalCreateSampleBufferWithNewPixelBuffer(destinationBuffer, *(void **)(a1 + 64), @"OutputBufferPrimary", &time, (CMSampleBufferRef *)&destination);
      if (SampleTimingInfoArray) {
        goto LABEL_71;
      }
      CMPropagateAttachments(v5, destination);
      unsigned int v49 = _shouldBypassSmartStyle(v5);
      if (v49)
      {
        _setAttachedMediaToSampleBuffer(v5, kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingLearnedCoefficients, 0);
        uint64_t v50 = (void *)kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingUnstyledThumbnail;
        _setAttachedMediaToSampleBuffer(v5, kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingUnstyledThumbnail, 0);
        _setAttachedMediaToSampleBuffer(destination, v50, 0);
        uint64_t v51 = a1 + 30064;
        if (*v201)
        {
          if (!*(unsigned char *)(a1 + 30066))
          {
LABEL_96:
            uint64_t SampleTimingInfoArray = _removeSmartStyleAttachments(a1, destination);
            if (SampleTimingInfoArray) {
              goto LABEL_71;
            }
            goto LABEL_103;
          }
LABEL_94:
          uint64_t SampleTimingInfoArray = sbp_gvs_createStabilizedAttachmentsPixelBuffers(a1, v5, (opaqueCMSampleBuffer *)destination, (_OWORD *)(a3 + 88));
          if (SampleTimingInfoArray)
          {
LABEL_71:
            uint64_t PixelBufferFromPool = SampleTimingInfoArray;
            fig_log_get_emitter();
LABEL_72:
            FigDebugAssert3();
LABEL_238:
            int v54 = a4;
            goto LABEL_268;
          }
LABEL_103:
          CFStringRef v56 = (const __CFString *)kFigVideoStabilizationSampleBufferAttachmentKey_DepthSampleBuffer;
          id v57 = (opaqueCMSampleBuffer *)CMGetAttachment(v5, kFigVideoStabilizationSampleBufferAttachmentKey_DepthSampleBuffer, 0);
          uint64_t v58 = v57;
          if (v57)
          {
            CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(v57);
            CMSetAttachment(sourceBuffer, @"InputDepthPixelBuffer", ImageBuffer, 0);
          }
          CMSampleBufferGetPresentationTimeStamp(&v205, v5);
          *(Float64 *)(a1 + 29648) = CMTimeGetSeconds(&v205);
          Stabilizeduint64_t PixelBuffer = sbp_gvs_createStabilizedPixelBuffer(a1, v5, (_OWORD *)(a3 + 88), destinationBuffer);
          if (StabilizedPixelBuffer) {
            goto LABEL_315;
          }
          CMAttachmentBearerRef v61 = destination;
          CMSampleBufferRef v62 = v5;
          CFStringRef v63 = (const __CFString *)kFigVideoStabilizationSampleBufferAttachmentKey_VideoSTFAnalytics;
          CFTypeRef v64 = CMGetAttachment(v62, kFigVideoStabilizationSampleBufferAttachmentKey_VideoSTFAnalytics, 0);
          CMSetAttachment(v61, v63, v64, 1u);
          if (v58)
          {
            float v65 = (__CVBuffer *)CMGetAttachment(sourceBuffer, @"OutputDepthPixelBuffer", 0);
            if (v65)
            {
              double v66 = v65;
              memset(&timingArrayOut, 0, sizeof(timingArrayOut));
              Stabilizeduint64_t PixelBuffer = CMSampleBufferGetSampleTimingInfoArray(v58, 1, &timingArrayOut, 0);
              if (StabilizedPixelBuffer) {
                goto LABEL_315;
              }
              *(void *)bytes = 0;
              Stabilizeduint64_t PixelBuffer = sbp_internalCreateSampleBufferWithNewPixelBuffer(v66, *(void **)(a1 + 64), @"OutputBufferDepth", &timingArrayOut, (CMSampleBufferRef *)bytes);
              if (StabilizedPixelBuffer) {
                goto LABEL_315;
              }
              CMPropagateAttachments(v58, *(CMAttachmentBearerRef *)bytes);
              CMSetAttachment(destination, v56, *(CFTypeRef *)bytes, 1u);
              CMRemoveAttachment(sourceBuffer, @"InputDepthPixelBuffer");
              CMRemoveAttachment(sourceBuffer, @"OutputDepthPixelBuffer");
              if (*(void *)bytes) {
                CFRelease(*(CFTypeRef *)bytes);
              }
            }
          }
          if (*(_DWORD *)(a1 + 172)) {
            char v67 = 1;
          }
          else {
            char v67 = v49;
          }
          CMSampleBufferRef v5 = target;
          if (v67) {
            goto LABEL_128;
          }
          if (*v201)
          {
            float v68 = CMGetAttachment(destination, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0);
            [v68 setObject:&__kCFBooleanTrue forKeyedSubscript:kFigCaptureSampleBufferMetadata_SmartStyleAppliedOnThisFrame];
          }
          if (*(unsigned char *)(a1 + 30066))
          {
            if (*(unsigned char *)(a1 + 30067))
            {
              Stabilizeduint64_t PixelBuffer = _runSmartStyleReverseLearningAndComputeDeltaMap(a1, target, (opaqueCMSampleBuffer *)destination);
              if (StabilizedPixelBuffer) {
                goto LABEL_315;
              }
            }
            float v69 = (__CVBuffer *)CMGetAttachment(sourceBuffer, @"OutputSmartStyleDeltaMapPixelBuffer", 0);
            if (v69)
            {
              uint64_t v70 = v69;
              memset(&timingArrayOut, 0, sizeof(timingArrayOut));
              Stabilizeduint64_t PixelBuffer = CMSampleBufferGetSampleTimingInfoArray(target, 1, &timingArrayOut, 0);
              if (!StabilizedPixelBuffer)
              {
                *(void *)bytes = 0;
                Stabilizeduint64_t PixelBuffer = sbp_internalCreateSampleBufferWithNewPixelBuffer(v70, *(void **)(a1 + 64), kFigVideoStabilizationSampleBufferAttachmentKey_OutputSmartStyleDeltaMapSampleBuffer, &timingArrayOut, (CMSampleBufferRef *)bytes);
                if (!StabilizedPixelBuffer)
                {
                  _setAttachedMediaToSampleBuffer(destination, kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingDeltaMap, *(void **)bytes);
                  CMRemoveAttachment(sourceBuffer, @"OutputSmartStyleDeltaMapPixelBuffer");
                  if (*(void *)bytes) {
                    CFRelease(*(CFTypeRef *)bytes);
                  }
                  goto LABEL_126;
                }
              }
LABEL_315:
              uint64_t PixelBufferFromPool = StabilizedPixelBuffer;
              fig_log_get_emitter();
              goto LABEL_72;
            }
          }
LABEL_126:
          if (CMGetAttachment(sourceBuffer, @"OutputSmartStyleUnstyledPixelBuffer", 0)) {
            CMRemoveAttachment(sourceBuffer, @"OutputSmartStyleUnstyledPixelBuffer");
          }
          goto LABEL_128;
        }
      }
      else
      {
        uint64_t v51 = a1 + 30064;
        if (*v201)
        {
          int v52 = *(_DWORD *)(a1 + 172);
          if (v52 == 3)
          {
            if ((*v204 - 1) > 2 || *(unsigned char *)(a1 + 25))
            {
              if (*(unsigned char *)(a1 + 30068) && _runSmartStyleFilterForwardLearning(a1, v5))
              {
                fig_log_get_emitter();
                FigDebugAssert3();
              }
              uint64_t SampleTimingInfoArray = _runSmartStyleApplyOnUnstabilizedImage(a1, v5);
              if (SampleTimingInfoArray) {
                goto LABEL_71;
              }
            }
          }
          else if (!v52)
          {
            if (*(unsigned char *)(a1 + 30068) && _runSmartStyleFilterForwardLearning(a1, v5))
            {
              fig_log_get_emitter();
              FigDebugAssert3();
            }
            uint64_t SampleTimingInfoArray = _runSmartStyleIntegrate(a1, v5);
            if (SampleTimingInfoArray) {
              goto LABEL_71;
            }
          }
LABEL_92:
          if (!*(unsigned char *)(a1 + 30066)) {
            goto LABEL_96;
          }
          if ((v49 & 1) == 0)
          {
            if (!*(unsigned char *)(a1 + 30067))
            {
              uint64_t SampleTimingInfoArray = _runSmartStyleApplyOnUnstabilizedThumbnail(a1, v5);
              if (SampleTimingInfoArray) {
                goto LABEL_71;
              }
            }
            uint64_t SampleTimingInfoArray = sbp_gvs_createStabilizedAttachmentsPixelBuffers(a1, v5, (opaqueCMSampleBuffer *)destination, (_OWORD *)(a3 + 88));
            if (SampleTimingInfoArray) {
              goto LABEL_71;
            }
            if (!*(unsigned char *)(a1 + 30067))
            {
              uint64_t SampleTimingInfoArray = _runSmartStyleReverseLearning(a1, v5, (void *)destination);
              if (SampleTimingInfoArray) {
                goto LABEL_71;
              }
            }
            goto LABEL_103;
          }
          goto LABEL_94;
        }
      }
      if (!*(unsigned char *)(v51 + 2)) {
        goto LABEL_103;
      }
      goto LABEL_92;
    }
LABEL_291:
    fig_log_get_emitter();
    goto LABEL_72;
  }
  if (!v5)
  {
    CMAttachmentBearerRef destination = 0;
    if (*(_DWORD *)(a1 + 172)) {
      goto LABEL_128;
    }
LABEL_70:
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t SampleTimingInfoArray = FigSignalErrorAt();
    if (!SampleTimingInfoArray) {
      goto LABEL_128;
    }
    goto LABEL_71;
  }
  CFTypeRef v34 = CFRetain(v5);
  CMAttachmentBearerRef destination = v34;
  if (!*(_DWORD *)(a1 + 172))
  {
    float v35 = v34;
    if (v34)
    {
      int v36 = *(const void **)(a1 + 27408);
      if (v36)
      {
        uint64_t v37 = *(void *)(a1 + 29712);
        if (v37)
        {
          *(void *)&long long v38 = *(void *)(a1 + 128);
          *((void *)&v38 + 1) = *(void *)(a1 + 152);
          *(_OWORD *)uint64_t v37 = v38;
          *(void *)(v37 + 16) = *(void *)(a1 + 144);
          *(_DWORD *)(v37 + 24) = *(_DWORD *)(a1 + 188);
          int v39 = *(_DWORD *)(a1 + 180);
          *(_DWORD *)(v37 + 28) = v39;
          int v40 = *(_DWORD *)(a1 + 184);
          *(_DWORD *)(v37 + 32) = v40;
          size_t v41 = 36 * v39 * (uint64_t)v40;
          CFIndex v42 = v41 + 36;
          memcpy((void *)(v37 + 36), v36, v41);
          CFDataRef v43 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)v37, v42);
          if (v43)
          {
            CFDataRef v44 = v43;
            CMSetAttachment(v35, kFigVideoStabilizationSampleBufferAttachmentKey_GPUTransformsParameters, v43, 1u);
            CFRelease(v44);
            goto LABEL_128;
          }
        }
      }
    }
    goto LABEL_70;
  }
LABEL_128:
  uint64_t v71 = 0;
  CMAttachmentBearerRef v72 = destination;
  int v73 = *(_DWORD *)(a1 + 180);
  int v74 = *(_DWORD *)(a1 + 184);
  int v75 = (v74 >> 1) * v73;
  int v76 = v73 + (v73 < 0);
  if (v74 <= 1) {
    int v77 = 0;
  }
  else {
    int v77 = v75;
  }
  uint64_t v78 = *(void *)(a1 + 27408) + 36 * (v77 + (v76 >> 1));
  do
  {
    *(_DWORD *)((char *)&time.duration.value + v71) = *(_DWORD *)(v78 + v71);
    v71 += 4;
  }
  while (v71 != 36);
  CFNumberRef v79 = (const __CFNumber *)CMGetAttachment(v72, kFigVideoStabilizationSampleBufferAttachmentKey_RemainingDigitalZoomAfterVIS, 0);
  if (v79)
  {
    LODWORD(timingArrayOut.duration.value) = 1065353216;
    CFNumberGetValue(v79, kCFNumberFloatType, &timingArrayOut);
    v80.i32[0] = timingArrayOut.duration.value;
    FigMotionApplyDigitalZoomToTransform(1, (float *)&time, v80, *(int32x4_t *)(a1 + 336), *(double *)(a1 + 344), v81, v82);
  }
  invert3x3Matrix((uint64_t)&time, (float *)&timingArrayOut);
  *(_OWORD *)bytes = *(_OWORD *)&timingArrayOut.duration.value;
  *(_OWORD *)&bytes[16] = *(_OWORD *)&timingArrayOut.duration.epoch;
  CMTimeScale timescale = timingArrayOut.presentationTimeStamp.timescale;
  CFDataRef v83 = CFDataCreate(kCFAllocatorDefault, bytes, 36);
  CMSetAttachment(v72, kFigVideoStabilizationSampleBufferAttachmentKey_CenterStabilizationInvertedTransform, v83, 1u);
  if (v83) {
    CFRelease(v83);
  }
  if (!a1) {
    goto LABEL_282;
  }
  CMAttachmentBearerRef v84 = destination;
  if (!destination || !a3) {
    goto LABEL_282;
  }
  if (!*(unsigned char *)(v7 + 1) && !*(unsigned char *)(v7 + 2)) {
    goto LABEL_166;
  }
  if (*(float *)(a3 + 4) <= 0.0
    || *(float *)(a3 + 20) <= 0.0
    || (uint64_t v85 = (_OWORD *)(a1 + 28096), FigMotionGetQuaternionLength((double *)(a1 + 28096)) <= 0.00000001))
  {
LABEL_282:
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_166;
  }
  if (!*(unsigned char *)v7)
  {
    long long v86 = *(_OWORD *)(a1 + 28112);
    *(_OWORD *)(a1 + 28816) = *v85;
    *(_OWORD *)(a1 + 28832) = v86;
    *(void *)(a1 + 28848) = 0;
    *(unsigned char *)uint64_t v7 = 1;
  }
  if (*(unsigned char *)(v7 + 1))
  {
    uint64_t v87 = (__CFDictionary *)CMGetAttachment(v84, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0);
    if (!v87
      || (uint64_t v88 = v87,
          time.duration.value = FigMotionMultiplyByInverseOfQuaternion((double *)(a1 + 28096), (uint64_t *)(a1 + 28816)),
          *(void *)&time.duration.CMTimeScale timescale = v89,
          time.duration.epoch = v90,
          time.presentationTimeStamp.value = v91,
          timingArrayOut.duration.value = 0,
          GVSComputeTranslationFromCameraMotion((double *)&time.duration.value, (float32x2_t *)&timingArrayOut, *(float *)(a3 + 4))))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      CMSampleBufferRef v5 = target;
      goto LABEL_166;
    }
    v92.f32[0] = -*(float *)(a3 + 20);
    if (!*(unsigned char *)(a1 + 203)) {
      v92.i32[0] = *(_DWORD *)(a3 + 20);
    }
    v92.i32[1] = *(_DWORD *)(a3 + 20);
    *(float32x2_t *)(a1 + 28848) = vmla_f32(*(float32x2_t *)(a1 + 28848), v92, (float32x2_t)timingArrayOut.duration.value);
    *(float32x2_t *)bytes = vmul_f32(v92, *(float32x2_t *)(a3 + 80));
    CFDataRef v93 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)(a1 + 28848), 8);
    if (!v93 || (CFDataRef v94 = CFDataCreate(kCFAllocatorDefault, bytes, 8)) == 0)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      CMSampleBufferRef v5 = target;
      goto LABEL_164;
    }
    CFDataRef v95 = v94;
    CFDictionarySetValue(v88, kFigVideoStabilizationSampleBufferAttachmentKey_EstimatedCenterMotionVector, v93);
    CFDictionarySetValue(v88, kFigVideoStabilizationSampleBufferAttachmentKey_EstimatedMotionBlurVector, v95);
    CMSampleBufferRef v5 = target;
  }
  else
  {
    CFDataRef v93 = 0;
    CFDataRef v95 = 0;
  }
  if (!*(unsigned char *)(v7 + 2)) {
    goto LABEL_162;
  }
  time.duration.flags = 0;
  *(CMTimeValue *)((char *)&time.duration.value + 4) = 0;
  *(CMTimeEpoch *)((char *)&time.duration.epoch + 4) = 0;
  *(CMTimeValue *)((char *)&time.presentationTimeStamp.value + 4) = 0x3F80000000000000;
  LODWORD(time.duration.value) = 1065353216;
  LODWORD(time.duration.epoch) = 1065353216;
  uint64_t v96 = *(void *)(a1 + 28096);
  *(float64x2_t *)&bytes[8] = vnegq_f64(*(float64x2_t *)(a1 + 28104));
  double v97 = -*(double *)(a1 + 28120);
  *(void *)bytes = v96;
  *(double *)&bytes[24] = v97;
  *(float *)&uint64_t v96 = (float)*(int *)(v7 + 864) * 0.75;
  float64x2_t v98 = *(float64x2_t *)(a1 + 336);
  uint64_t v217 = COERCE_UNSIGNED_INT(*(float *)(a3 + 4) * *(float *)(a3 + 20));
  uint64_t v99 = *(void *)(a1 + 136);
  v100.i64[0] = (int)v99;
  v100.i64[1] = SHIDWORD(v99);
  float64x2_t v218 = vsubq_f64(v98, vcvtq_f64_s64(v100));
  uint64_t v211 = v96;
  float64x2_t v212 = v218;
  GVSInverseRotationMatrixFromQuaternion((double *)bytes, (uint64_t)&timingArrayOut);
  *(double *)v101.i64 = FigMotionComputeTransformFromRotation((uint64_t)&v217, (uint64_t)&v211, (long long *)&timingArrayOut.duration.value, (uint64_t)&time);
  if (*(unsigned char *)(a1 + 203))
  {
    *(float *)v102.i32 = (float)*(int *)(a1 + 144);
    v101.i32[0] = -1.0;
    FigMotionPreMultiplyScalingTranslationToTransform((uint64_t)&time, v101, v102, 1.0, 0.0, v103);
  }
  unint64_t valuePtr = (unint64_t)(*(double *)(a3 + 72) * 1000000000.0);
  CFDataRef v104 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)&time, 36);
  if (v104)
  {
    CFDataRef v105 = v104;
    CMSetAttachment(v84, kFigVideoStabilizationSampleBufferAttachmentKey_StabilizedTrajectoryHomography, v104, 1u);
    CFRelease(v105);
    CFNumberRef v106 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
    if (v106)
    {
      CFNumberRef v107 = v106;
      CMSetAttachment(v84, kFigVideoStabilizationSampleBufferAttachmentKey_StabilizedTrajectoryHomographyTimestamp, v106, 1u);
      CFRelease(v107);
      CMSampleBufferRef v5 = target;
LABEL_162:
      long long v108 = *(_OWORD *)(a1 + 28112);
      *(_OWORD *)(a1 + 28816) = *v85;
      *(_OWORD *)(a1 + 28832) = v108;
      if (!v95) {
        goto LABEL_164;
      }
      goto LABEL_163;
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  CMSampleBufferRef v5 = target;
  if (v95) {
LABEL_163:
  }
    CFRelease(v95);
LABEL_164:
  if (v93) {
    CFRelease(v93);
  }
LABEL_166:
  if (*v204 != 3 && *v204 != 5)
  {
    float v109 = (__CFDictionary *)CMGetAttachment(destination, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0);
    if (v109)
    {
      uint64_t v110 = v109;
      LOBYTE(timingArrayOut.duration.value) = 0;
      FigCFDictionaryGetBooleanIfPresent();
      if (LOBYTE(timingArrayOut.duration.value))
      {
        int v113 = *(_DWORD *)(a1 + 180);
        int v114 = *(_DWORD *)(a1 + 184);
        if (v113 >= 0) {
          int v115 = *(_DWORD *)(a1 + 180);
        }
        else {
          int v115 = v113 + 1;
        }
        int v116 = (v114 >> 1) * v113;
        if (v114 <= 1) {
          int v116 = 0;
        }
        uint64_t v117 = *(void *)(a1 + 27408) + 36 * (v116 + (v115 >> 1));
        CMTimeScale v118 = *(_DWORD *)(v117 + 32);
        int8x16_t v119 = *(int8x16_t *)(v117 + 16);
        *(_OWORD *)&time.duration.value = *(_OWORD *)v117;
        *(int8x16_t *)&time.duration.epoch = v119;
        time.presentationTimeStamp.CMTimeScale timescale = v118;
        v119.i32[0] = *(_DWORD *)(a3 + 20);
        if (*(float *)v119.i32 > 0.0) {
          FigMotionApplyDigitalZoomToTransform(0, (float *)&time, v119, *(int32x4_t *)(a1 + 336), *(double *)(a1 + 344), v111, v112);
        }
        float v120 = (float)(*(_DWORD *)(a1 + 128) - *(_DWORD *)(v7 + 864));
        float v121 = (float)((float)(*(_DWORD *)(a1 + 132) - *(_DWORD *)(v7 + 868)) * 0.5) + (float)*(int *)(v7 + 868);
        FigMotionPostMultiplyScalingTranslationToTransform((float *)&time, 1.0, v120 * 0.5, -1.0, v121);
        *(float *)v122.i32 = -(float)(v120 * 0.5);
        v123.i32[0] = 1.0;
        FigMotionPreMultiplyScalingTranslationToTransform((uint64_t)&time, v123, v122, -1.0, v121, v124);
        CFDataRef v125 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)&time, 36);
        if (v125)
        {
          CFDataRef v126 = v125;
          CFDictionarySetValue(v110, kFigVideoStabilizationSampleBufferProcessorMetadata_VitalityTransformMatrix, v125);
          CFRelease(v126);
        }
        else
        {
          fig_log_get_emitter();
          FigDebugAssert3();
        }
      }
    }
  }
  int v127 = *v204;
  if ((*v204 - 1) <= 2)
  {
    if (*(unsigned char *)(a1 + 28128))
    {
      CMAttachmentBearerRef v128 = destination;
      if (*(unsigned char *)(a1 + 392))
      {
        if (a1)
        {
          if (a3)
          {
            if (destination)
            {
              long long v129 = *(_OWORD *)(a1 + 28112);
              *(_OWORD *)&time.duration.value = *(_OWORD *)(a1 + 28096);
              *(_OWORD *)&time.duration.epoch = v129;
              *(_OWORD *)&time.presentationTimeStamp.CMTimeScale timescale = (unint64_t)vneg_f32(*(float32x2_t *)(a1 + 28232));
              *(float *)&time.presentationTimeStamp.epoch = *(float *)(a3 + 4) * *(float *)(a3 + 20);
              uint64_t v130 = +[NSData dataWithBytes:&time length:48];
              if (v130)
              {
                float v131 = v130;
                CMSetAttachment(v128, kFigVideoStabilizationSampleBufferAttachmentKey_StabilizedOutputCameraGeometry, v130, 1u);

                goto LABEL_190;
              }
            }
          }
        }
      }
      else if (destination)
      {
        CFDataRef v132 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)(a1 + 28096), 32);
        if (v132)
        {
          CFDataRef v133 = v132;
          CMSetAttachment(v128, kFigVideoStabilizationSampleBufferAttachmentKey_StabilizedOutputCenterQuaternion, v132, 1u);
          CFRelease(v133);
          goto LABEL_190;
        }
      }
      fig_log_get_emitter();
      FigDebugAssert3();
    }
LABEL_190:
    int v127 = *v204;
  }
  if (v127 != 5) {
    goto LABEL_227;
  }
  uint64_t v134 = *(void *)(a1 + 27408);
  CFDictionaryRef v135 = (const __CFDictionary *)CMGetAttachment(destination, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0);
  if (!v135)
  {
LABEL_300:
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t PixelBufferFromPool = FigSignalErrorAt();
    goto LABEL_310;
  }
  unsigned int v136 = v135;
  LOBYTE(v211) = 1;
  int v137 = CFDictionaryContainsKey(v135, kFigMotionAttachmentsSampleBufferProcessorMetadata_StereoStitchingNarrowBufferRect);
  int BooleanIfPresent = FigCFDictionaryGetBooleanIfPresent();
  BOOL v139 = v211;
  if (!BooleanIfPresent) {
    BOOL v139 = v137 == 0;
  }
  double v140 = (double)*(int *)(a1 + 144);
  double v141 = (double)*(int *)(a1 + 148);
  double v142 = 0.0;
  if (v139)
  {
    double v143 = 0.0;
    goto LABEL_225;
  }
  if (*(int *)(a1 + 180) > 0)
  {
    if (v137)
    {
      CGSize size = CGRectNull.size;
      *(CGPoint *)&timingArrayOut.duration.value = CGRectNull.origin;
      *(CGSize *)&timingArrayOut.duration.epoch = size;
      FigCFDictionaryGetCGRectIfPresent();
      if (*(double *)&timingArrayOut.presentationTimeStamp.value > 0.0)
      {
        int v145 = *(_DWORD *)(a1 + 180);
        float v146 = *(double *)&timingArrayOut.duration.value;
        int v147 = (int)(*(double *)&timingArrayOut.presentationTimeStamp.value
                   + *(double *)&timingArrayOut.duration.timescale);
        float v148 = *(double *)&timingArrayOut.duration.value + *(double *)&timingArrayOut.duration.epoch + -1.0;
        *(float *)&uint64_t v217 = v146;
        *(float *)v218.f64 = v148;
        int v149 = (int)*(double *)&timingArrayOut.duration.timescale;
        if ((int)*(double *)&timingArrayOut.duration.timescale >= v147)
        {
          double v153 = 3.40282347e38;
          double v154 = 0.0;
          double v152 = 0.0;
        }
        else
        {
          uint64_t v150 = 0;
          int v151 = (int)(*(double *)&timingArrayOut.presentationTimeStamp.value / (double)v145);
          double v152 = 0.0;
          double v153 = 3.40282347e38;
          double v154 = 0.0;
          do
          {
            *((float *)v218.f64 + 1) = (float)v149;
            *((float *)&v217 + 1) = (float)v149;
            invert3x3Matrix(v134, (float *)&time);
            _computeProjectedPoints((float *)&time, (uint64_t)&v217, (uint64_t)bytes);
            double v155 = *(double *)&bytes[8];
            if (*(double *)&bytes[8] <= *(double *)&bytes[24]) {
              double v155 = *(double *)&bytes[24];
            }
            if (!v150) {
              double v154 = v155;
            }
            if (v152 <= *(double *)bytes) {
              double v152 = *(double *)bytes;
            }
            if (v153 >= *(double *)&bytes[16]) {
              double v153 = *(double *)&bytes[16];
            }
            v149 += v151;
            --v150;
            v134 += 36;
          }
          while (v149 < v147);
        }
        *((float *)v218.f64 + 1) = (float)(v147 - 1);
        *((float *)&v217 + 1) = *((float *)v218.f64 + 1);
        _computeProjectedPoints((float *)&time, (uint64_t)&v217, (uint64_t)bytes);
        double v156 = (double)*(int *)(a1 + 136);
        double v157 = *(double *)&bytes[24];
        double v158 = *(double *)&bytes[16];
        if (*(double *)&bytes[8] < *(double *)&bytes[24]) {
          double v157 = *(double *)&bytes[8];
        }
        if (v152 <= *(double *)bytes) {
          double v159 = *(double *)bytes;
        }
        else {
          double v159 = v152;
        }
        double v160 = (double)*(int *)(a1 + 140);
        if (v153 < *(double *)&bytes[16]) {
          double v158 = v153;
        }
        double v142 = fmax(v154 - v160, 0.0);
        double v143 = fmax(v159 - v156, 0.0);
        double v161 = v158 - v156;
        if (v161 >= v140 + -1.0) {
          double v161 = v140 + -1.0;
        }
        double v162 = v157 - v160;
        if (v162 >= v141 + -1.0) {
          double v162 = v141 + -1.0;
        }
        double v140 = v161 - v143 + 1.0;
        double v141 = v162 - v142 + 1.0;
LABEL_225:
        double v163 = v140;
        double v164 = v141;
        CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(*(CGRect *)(&v142 - 1));
        CMSampleBufferRef v5 = target;
        if (DictionaryRepresentation)
        {
          CFDictionaryRef v166 = DictionaryRepresentation;
          CFDictionarySetValue(v136, kFigVideoStabilizationSampleBufferProcessorMetadata_StitchingCleanApertureRect, DictionaryRepresentation);
          CFRelease(v166);
          goto LABEL_227;
        }
        goto LABEL_300;
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  uint64_t PixelBufferFromPool = FigSignalErrorAt();
  CMSampleBufferRef v5 = target;
LABEL_310:
  if (PixelBufferFromPool)
  {
    fig_log_get_emitter();
    goto LABEL_72;
  }
LABEL_227:
  if (!*(unsigned char *)(a1 + 30065))
  {
    uint64_t v167 = *(void *)(a1 + 27408);
    if (v167)
    {
      __asm { FMOV            V2.2S, #-1.0 }
      float32x2_t v173 = vmla_f32(vcvt_f32_s32(*(int32x2_t *)(a1 + 152)), (float32x2_t)0x3F0000003F000000, vadd_f32(vcvt_f32_s32(*(int32x2_t *)(a1 + 160)), _D2));
      int v174 = *(_DWORD *)(a1 + 180);
      int v175 = *(_DWORD *)(a1 + 184);
      if (v174 >= 0) {
        int v176 = *(_DWORD *)(a1 + 180);
      }
      else {
        int v176 = v174 + 1;
      }
      int v177 = (v175 >> 1) * v174;
      if (v175 <= 1) {
        int v177 = 0;
      }
      LODWORD(time.duration.value) = 0;
      LODWORD(timingArrayOut.duration.value) = 0;
      GVSComputePerspectiveProjectedPoint((float *)(v167 + 36 * (v177 + (v176 >> 1))), (float *)&time, (float *)&timingArrayOut, v173.f32[0], v173.f32[1]);
      float32x2_t v178 = (float32x2_t)__PAIR64__(timingArrayOut.duration.value, time.duration.value);
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      float32x2_t v178 = 0;
    }
    *(float32x2_t *)(a1 + 30144) = vdiv_f32(v178, vcvt_f32_s32(*(int32x2_t *)(a1 + 128)));
  }
  if (*v204 == 5)
  {
    uint64_t PixelBufferFromPool = 0;
    goto LABEL_238;
  }
  if (!a1 || !v5 || !a3) {
    goto LABEL_299;
  }
  LODWORD(v179) = GVSComputeOverscanUsage(v200, (float64x2_t *)(a3 + 104), *(void *)(a1 + 27408)).u32[0];
  uint64_t v181 = *(unsigned int *)(a3 + 136);
  int v182 = *(_DWORD *)(a3 + 140);
  unsigned int v183 = v182 - 1;
  if (v182 <= 0) {
    unsigned int v183 = 0;
  }
  uint64_t v184 = OverscanHistogramIndexMapping[2 * v181 + v183];
  if ((v184 & 0x80000000) == 0)
  {
    float v185 = (float)*(int *)(a3 + 100);
    if (v180 >= v185) {
      float v186 = 1.0;
    }
    else {
      float v186 = v180 / v185;
    }
    float v187 = (float)*(int *)(a3 + 96);
    if (v179 >= v187) {
      float v188 = 1.0;
    }
    else {
      float v188 = v179 / v187;
    }
    double v189 = fminf(v188, v186);
    if (v189 >= 0.02)
    {
      int v54 = a4;
      if (v189 >= 0.04)
      {
        if (v189 >= 0.06)
        {
          if (v189 >= 0.11)
          {
            if (v189 >= 0.16)
            {
              uint64_t v190 = 6;
              if (v189 < 0.21) {
                uint64_t v190 = 5;
              }
            }
            else
            {
              uint64_t v190 = 4;
            }
          }
          else
          {
            uint64_t v190 = 3;
          }
        }
        else
        {
          uint64_t v190 = 2;
        }
      }
      else
      {
        uint64_t v190 = 1;
      }
    }
    else
    {
      uint64_t v190 = 0;
      int v54 = a4;
    }
    *(_DWORD *)(a1 + 29808 + 4 * v184 + 200) = v181 | (v182 << 16);
    *(float *)(a1 + 29808 + 28 * v184 + 4 * v190) = *(float *)(a1
                                                                             + 29808
                                                                             + 28 * v184
                                                                             + 4 * v190)
                                                                  + 1.0;
    float v191 = *(float *)(v7 + 700);
    if (v191 > 0.0)
    {
      uint64_t v192 = a1 + 4 * (int)vcvtms_s32_f32((float)(*(float *)(v7 + 708) / v191) * 6.0);
      *(float *)(v192 + 29976) = *(float *)(v192 + 29976) + 1.0;
    }
    LODWORD(time.duration.value) = 0;
    if (CMGetAttachment(v5, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0))
    {
      FigCFDictionaryGetInt32IfPresent();
      *(float *)(v7 + 1196) = *(float *)(v7 + 1196) + (float)SLODWORD(time.duration.value);
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
  else
  {
LABEL_299:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v54 = a4;
  }
  uint64_t PixelBufferFromPool = 0;
LABEL_268:
  if (*(unsigned char *)(v7 + 954))
  {
    BOOL v53 = v198 == 1 && *(unsigned char *)(v7 + 972);
    goto LABEL_273;
  }
LABEL_274:
  CMRemoveAttachment(sourceBuffer, @"InputDepthPixelBuffer");
  CMRemoveAttachment(sourceBuffer, @"OutputDepthPixelBuffer");
  CMAttachmentBearerRef v193 = destination;
  if (PixelBufferFromPool && destination)
  {
    CFRelease(destination);
    CMAttachmentBearerRef v193 = 0;
    CMAttachmentBearerRef destination = 0;
  }
  *int v54 = v193;
  if (destinationBuffer) {
    CFRelease(destinationBuffer);
  }
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
  return PixelBufferFromPool;
}

uint64_t sbp_gvs_gaussianAverageComputeCorrection(uint64_t a1, int a2, int a3, unsigned char *a4, float a5)
{
  uint64_t v8 = a1;
  float64x2_t v256 = 0u;
  float64x2_t v257 = 0u;
  float32x2_t v255 = 0;
  float32x2_t v254 = 0;
  int8x16_t v9 = (float *)(a1 + 27136);
  BOOL v253 = 1;
  long long v251 = 0u;
  long long v252 = 0u;
  long long v249 = 0u;
  long long v250 = 0u;
  long long v247 = 0u;
  long long v248 = 0u;
  [*(id *)(a1 + 29384) getSmoothingAnalysisArrays];
  long long v10 = v9;
  uint64_t v11 = a2;
  if (*((unsigned char *)v10 + 1001))
  {
    int v12 = *((_DWORD *)v10 + 575);
    int v13 = *((_DWORD *)v10 + 572) + v12 + a2;
    do
      v13 -= v12;
    while (v13 >= v12);
    CFDataRef v14 = (void *)(v8 + 29392);
  }
  else
  {
    int v13 = 0;
    CFDataRef v14 = 0;
  }
  double v15 = *(double *)(v249 + 8 * a2);
  double v16 = *(double *)(v249 + 8 * SDWORD2(v251));
  size_t v17 = (long long *)(*((void *)&v248 + 1) + 144 * a2);
  long long v240 = *v17;
  long long v18 = v17[4];
  long long v20 = v17[1];
  long long v19 = v17[2];
  long long v243 = v17[3];
  long long v244 = v18;
  long long v241 = v20;
  long long v242 = v19;
  long long v21 = v17[8];
  long long v23 = v17[5];
  long long v22 = v17[6];
  v246[1] = v17[7];
  v246[2] = v21;
  long long v245 = v23;
  v246[0] = v22;
  int v24 = *(unsigned __int8 *)v10;
  uint64_t v239 = 0;
  long long v237 = 0u;
  long long v238 = 0u;
  long long v235 = 0u;
  long long v236 = 0u;
  long long v234 = 0u;
  float32x2_t v25 = *(void **)(v8 + 29384);
  float v228 = v10;
  uint64_t v217 = a4;
  if (v25)
  {
    [v25 getQuaternionSmoothingArrays];
    long long v10 = v228;
    int v26 = *(unsigned __int8 *)v228;
  }
  else
  {
    int v26 = v24;
  }
  *(_DWORD *)(v8 + 196) = 1065353216;
  if (v26)
  {
    if (*(unsigned char *)(v8 + 204)) {
      BOOL v27 = 1;
    }
    else {
      BOOL v27 = *(unsigned char *)(v8 + 392) != 0;
    }
    if (*((unsigned char *)v10 + 1660)) {
      uint64_t v28 = &v255;
    }
    else {
      uint64_t v28 = 0;
    }
    if (v27) {
      id v29 = &v254;
    }
    else {
      id v29 = 0;
    }
    v256.f64[0] = GVSComputeGaussianAverageQuaternion((uint64_t)&v234, *(_DWORD *)(v8 + 176), a2, v24 != 0, (unint64_t)v28, (unint64_t)v29, a5, v10[593]);
    v256.f64[1] = v30;
    v257.f64[0] = v31;
    v257.f64[1] = v32;
    if (*(void *)(v8 + 29552))
    {
      v256.f64[0] = FigMotionMultiplyQuaternions((double *)(v248 + 32 * a2), v256.f64);
      v256.f64[1] = v33;
      v257.f64[0] = v34;
      v257.f64[1] = v35;
    }
    long long v10 = v228;
    if (v228[646] > 0.0)
    {
      long long v232 = 0u;
      long long v233 = 0u;
      float64x2_t v230 = 0u;
      long long v231 = 0u;
      float64x2_t v229 = 0u;
      int v36 = *(void **)(v8 + 29384);
      if (v36)
      {
        [v36 getRollSmoothingArraysForBaseTransform:*(unsigned int *)(v8 + 176)];
        long long v10 = v228;
      }
      if (v14)
      {
        uint64_t v37 = v14[3];
        if (v37)
        {
          long long v38 = (float *)(v37 + 12 * v13);
          *(double *)v39.i64 = GVSComputeSmoothedHorizonQuaternion((uint64_t)&v229, a2, fminf((float)(a5 / 30.0) * 4.0, v10[577]));
          float32x4_t v212 = v39;
          double v260 = FigMotionInverseOfQuaternion((uint64_t)&v256);
          uint64_t v261 = v40;
          uint64_t v262 = v41;
          uint64_t v263 = v42;
          v43.i32[0] = GVSRotateVectorByQuaternion(v38, (uint64_t)&v260).u32[0];
          v259[0] = v43.f32[0];
          v259[1] = v44;
          float v218 = v45;
          v259[2] = v45;
          float v224 = v43.f32[0];
          v43.f32[1] = v44;
          float32x2_t v215 = *(float32x2_t *)v43.f32;
          float v46 = sqrtf(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v43, v43)));
          float v47 = 0.0;
          if (v46 > 0.0000001) {
            float v47 = atan2f(v224, v44) * 0.5;
          }
          __float2 v48 = __sincosf_stret(v47);
          float32x4_t v49 = vmulq_n_f32((float32x4_t)xmmword_47260, v48.__sinval);
          float32x4_t v50 = v49;
          v50.i32[3] = LODWORD(v48.__cosval);
          float32x4_t v51 = vmulq_f32(v50, (float32x4_t)xmmword_47270);
          int32x4_t v52 = (int32x4_t)vnegq_f32(v51);
          int8x16_t v53 = (int8x16_t)vtrn2q_s32((int32x4_t)v51, vtrn1q_s32((int32x4_t)v51, v52));
          float32x4_t v54 = vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v51, (int8x16_t)v52, 8uLL), v215, 1);
          float32x4_t v55 = (float32x4_t)vrev64q_s32((int32x4_t)v51);
          v55.i32[0] = v52.i32[1];
          v55.i32[3] = v52.i32[2];
          float32x4_t v56 = vmlaq_n_f32(vmlaq_n_f32(v54, (float32x4_t)vextq_s8(v53, v53, 8uLL), v224), v55, v218);
          int32x4_t v57 = (int32x4_t)vnegq_f32(v56);
          int8x16_t v58 = (int8x16_t)vtrn2q_s32((int32x4_t)v56, vtrn1q_s32((int32x4_t)v56, v57));
          float32x4_t v59 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v56, (int8x16_t)v57, 8uLL), *(float32x2_t *)v49.f32, 1), (float32x4_t)vextq_s8(v58, v58, 8uLL), v49.f32[0]);
          float32x4_t v60 = (float32x4_t)vrev64q_s32((int32x4_t)v56);
          v60.i32[0] = v57.i32[1];
          v60.i32[3] = v57.i32[2];
          float32x4_t v61 = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v56, v50, 3), v60, v49, 2), v59);
          float32x4_t v62 = vmulq_f32(v61, (float32x4_t)xmmword_47280);
          float32x4_t v221 = v50;
          if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v62, 2), vaddq_f32(v62, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v62.f32, 1))).f32[0] >= 0.0)
          {
            float32x4_t v92 = vaddq_f32(v61, (float32x4_t)xmmword_47280);
            int32x4_t v93 = (int32x4_t)vmulq_f32(v92, v92);
            v93.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v93, 2), vadd_f32(*(float32x2_t *)v93.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v93.i8, 1))).u32[0];
            float32x2_t v94 = vrsqrte_f32((float32x2_t)v93.u32[0]);
            float32x2_t v95 = vmul_f32(v94, vrsqrts_f32((float32x2_t)v93.u32[0], vmul_f32(v94, v94)));
            float32x4_t v96 = vmulq_n_f32(v92, vmul_f32(v95, vrsqrts_f32((float32x2_t)v93.u32[0], vmul_f32(v95, v95))).f32[0]);
            int32x4_t v97 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v96, (int32x4_t)v96), (int8x16_t)v96, 0xCuLL), vnegq_f32(v61)), v96, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v61, (int32x4_t)v61), (int8x16_t)v61, 0xCuLL));
            int8x16_t v98 = vextq_s8((int8x16_t)vuzp1q_s32(v97, v97), (int8x16_t)v97, 0xCuLL);
            float32x4_t v99 = vmulq_f32(v61, v96);
            v98.i32[3] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v99, 2), vaddq_f32(v99, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v99.f32, 1))).u32[0];
            float32x4_t v216 = (float32x4_t)v98;
          }
          else
          {
            int32x4_t v63 = (int32x4_t)vmulq_f32(v61, v61);
            v63.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v63, 2), vadd_f32(*(float32x2_t *)v63.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v63.i8, 1))).u32[0];
            float32x2_t v64 = vrsqrte_f32((float32x2_t)v63.u32[0]);
            float32x2_t v65 = vmul_f32(v64, vrsqrts_f32((float32x2_t)v63.u32[0], vmul_f32(v64, v64)));
            float32x2_t v66 = vrsqrte_f32((float32x2_t)1065353216);
            float32x2_t v67 = vmul_f32(v66, vrsqrts_f32((float32x2_t)1065353216, vmul_f32(v66, v66)));
            float32x4_t v68 = vaddq_f32(vmulq_n_f32(v61, vmul_f32(v65, vrsqrts_f32((float32x2_t)v63.u32[0], vmul_f32(v65, v65))).f32[0]), vmulq_n_f32((float32x4_t)xmmword_47280, vmul_f32(v67, vrsqrts_f32((float32x2_t)1065353216, vmul_f32(v67, v67))).f32[0]));
            float32x4_t v69 = vmulq_f32(v68, v68);
            float v70 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v69, 2), vaddq_f32(v69, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v69.f32, 1))).f32[0];
            if (v70 <= 1.4211e-14)
            {
              float32x4_t v100 = vabsq_f32(v61);
              float v101 = v100.f32[1];
              float v102 = v100.f32[2];
              if (v100.f32[0] > v100.f32[1] || v100.f32[0] > v100.f32[2])
              {
                float32x4_t v104 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v61, (int32x4_t)v61), (int8x16_t)v61, 0xCuLL);
                if (v101 <= v102) {
                  float32x4_t v105 = vmlaq_f32(vmulq_f32(v61, (float32x4_t)xmmword_472B0), (float32x4_t)xmmword_47280, v104);
                }
                else {
                  float32x4_t v105 = vmlaq_f32(vmulq_f32(v61, (float32x4_t)xmmword_472C0), (float32x4_t)xmmword_47260, v104);
                }
              }
              else
              {
                float32x4_t v105 = vmlaq_f32(vmulq_f32(v61, (float32x4_t)xmmword_47290), (float32x4_t)xmmword_472A0, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v61, (int32x4_t)v61), (int8x16_t)v61, 0xCuLL));
              }
              float32x4_t v106 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v105, (int32x4_t)v105), (int8x16_t)v105, 0xCuLL);
              int32x4_t v107 = (int32x4_t)vmulq_f32(v105, v105);
              v107.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v107.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v107, 2), *(float32x2_t *)v107.i8)).u32[0];
              float32x2_t v108 = vrsqrte_f32((float32x2_t)v107.u32[0]);
              float32x2_t v109 = vmul_f32(v108, vrsqrts_f32((float32x2_t)v107.u32[0], vmul_f32(v108, v108)));
              float32x4_t v91 = vmulq_n_f32(v106, vmul_f32(v109, vrsqrts_f32((float32x2_t)v107.u32[0], vmul_f32(v109, v109))).f32[0]);
              v91.i32[3] = 0;
            }
            else
            {
              float v71 = v70;
              float32x2_t v72 = vrsqrte_f32((float32x2_t)LODWORD(v70));
              float32x2_t v73 = vmul_f32(v72, vrsqrts_f32((float32x2_t)LODWORD(v71), vmul_f32(v72, v72)));
              float32x4_t v74 = vmulq_n_f32(v68, vmul_f32(v73, vrsqrts_f32((float32x2_t)LODWORD(v71), vmul_f32(v73, v73))).f32[0]);
              float32x4_t v75 = vaddq_f32(v61, v74);
              int32x4_t v76 = (int32x4_t)vmulq_f32(v75, v75);
              v76.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v76, 2), vadd_f32(*(float32x2_t *)v76.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v76.i8, 1))).u32[0];
              float32x2_t v77 = vrsqrte_f32((float32x2_t)v76.u32[0]);
              float32x2_t v78 = vmul_f32(v77, vrsqrts_f32((float32x2_t)v76.u32[0], vmul_f32(v77, v77)));
              float32x4_t v79 = vmulq_n_f32(v75, vmul_f32(v78, vrsqrts_f32((float32x2_t)v76.u32[0], vmul_f32(v78, v78))).f32[0]);
              float32x4_t v80 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v79, (int32x4_t)v79), (int8x16_t)v79, 0xCuLL), vnegq_f32(v61)), v79, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v61, (int32x4_t)v61), (int8x16_t)v61, 0xCuLL));
              float32x4_t v81 = vmulq_f32(v61, v79);
              float32x4_t v82 = vaddq_f32(v74, (float32x4_t)xmmword_47280);
              int32x4_t v83 = (int32x4_t)vmulq_f32(v82, v82);
              v83.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v83, 2), vadd_f32(*(float32x2_t *)v83.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v83.i8, 1))).u32[0];
              *(float32x2_t *)v79.f32 = vrsqrte_f32((float32x2_t)v83.u32[0]);
              *(float32x2_t *)v79.f32 = vmul_f32(*(float32x2_t *)v79.f32, vrsqrts_f32((float32x2_t)v83.u32[0], vmul_f32(*(float32x2_t *)v79.f32, *(float32x2_t *)v79.f32)));
              float32x4_t v84 = vmulq_n_f32(v82, vmul_f32(*(float32x2_t *)v79.f32, vrsqrts_f32((float32x2_t)v83.u32[0], vmul_f32(*(float32x2_t *)v79.f32, *(float32x2_t *)v79.f32))).f32[0]);
              int32x4_t v85 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v84, (int32x4_t)v84), (int8x16_t)v84, 0xCuLL), vnegq_f32(v74)), v84, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v74, (int32x4_t)v74), (int8x16_t)v74, 0xCuLL));
              float32x4_t v86 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v85, v85), (int8x16_t)v85, 0xCuLL);
              float32x4_t v87 = vmulq_f32(v74, v84);
              v86.i32[3] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v87, 2), vaddq_f32(v87, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v87.f32, 1))).u32[0];
              int32x4_t v88 = (int32x4_t)vnegq_f32(v86);
              int8x16_t v89 = (int8x16_t)vtrn2q_s32((int32x4_t)v86, vtrn1q_s32((int32x4_t)v86, v88));
              float32x4_t v90 = (float32x4_t)vrev64q_s32((int32x4_t)v86);
              v90.i32[0] = v88.i32[1];
              v90.i32[3] = v88.i32[2];
              float32x4_t v91 = vaddq_f32(vmlaq_lane_f32(vmulq_n_f32(v86, vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v81, 2), vaddq_f32(v81, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v81.f32, 1))).f32[0]), v90, *(float32x2_t *)v80.f32, 1), vmlaq_laneq_f32(vmulq_n_f32((float32x4_t)vextq_s8((int8x16_t)v86, (int8x16_t)v88, 8uLL), v80.f32[0]), (float32x4_t)vextq_s8(v89, v89, 8uLL), v80, 2));
            }
            float32x4_t v216 = v91;
          }
          float32x4_t v110 = vmulq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v256), v257), (float32x4_t)xmmword_472D0);
          int32x4_t v111 = (int32x4_t)vnegq_f32(v212);
          int8x16_t v112 = (int8x16_t)vtrn2q_s32((int32x4_t)v212, vtrn1q_s32((int32x4_t)v212, v111));
          float32x4_t v113 = (float32x4_t)vrev64q_s32((int32x4_t)v212);
          v113.i32[0] = v111.i32[1];
          v113.i32[3] = v111.i32[2];
          float32x4_t v225 = vaddq_f32(vmlaq_lane_f32(vmulq_laneq_f32((float32x4_t)vextq_s8((int8x16_t)v212, (int8x16_t)v111, 8uLL), v110, 2), (float32x4_t)vextq_s8(v112, v112, 8uLL), *(float32x2_t *)v110.f32, 1), vmlaq_laneq_f32(vmulq_n_f32(v212, v110.f32[0]), v113, v110, 3));
          GVSComputeRollPitchFromGravity(v259);
          float v115 = (float)(1.5533 - v114) / 0.50615;
          v116.i64[0] = 0;
          float v117 = 1.0;
          float v118 = fminf(fmaxf(v115, 0.0), 1.0);
          float32x4_t v119 = vmulq_f32(v225, (float32x4_t)xmmword_472E0);
          *(float32x2_t *)v119.f32 = vadd_f32(*(float32x2_t *)v119.f32, (float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v119, (int8x16_t)v119, 8uLL));
          v119.f32[0] = vaddv_f32(*(float32x2_t *)v119.f32);
          float32x4_t v120 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vmvnq_s8((int8x16_t)vcgeq_f32(v119, v116)), 0), (int8x16_t)vnegq_f32(v225), (int8x16_t)v225);
          float v121 = 1.0 - v118;
          float32x4_t v122 = vsubq_f32((float32x4_t)xmmword_472E0, v120);
          int8x16_t v123 = (int8x16_t)vmulq_f32(v122, v122);
          float32x4_t v219 = v120;
          float32x4_t v124 = vaddq_f32(v120, (float32x4_t)xmmword_472E0);
          int8x16_t v125 = (int8x16_t)vmulq_f32(v124, v124);
          float v126 = atan2f(sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v123.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v123, v123, 8uLL)))), sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v125.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v125, v125, 8uLL)))));
          float v127 = v126 + v126;
          _ZF = (float)(v126 + v126) == 0.0;
          float v129 = 1.0;
          if (!_ZF) {
            float v129 = sinf(v127) / v127;
          }
          float v130 = v129;
          float32x2_t v131 = vrecpe_f32((float32x2_t)LODWORD(v129));
          float32x2_t v132 = vmul_f32(v131, vrecps_f32((float32x2_t)LODWORD(v130), v131));
          LODWORD(v133) = vmul_f32(v132, vrecps_f32((float32x2_t)LODWORD(v130), v132)).u32[0];
          if ((float)(v127 * v121) != 0.0)
          {
            float v213 = v133;
            v132.f32[0] = sinf(v127 * v121);
            float v133 = v213;
            float v117 = v132.f32[0] / (float)(v127 * v121);
          }
          v132.f32[0] = v121 * (float)(v133 * v117);
          float32x4_t v134 = (float32x4_t)vdupq_lane_s32((int32x2_t)v132, 0);
          float v135 = v127 * v118;
          float v136 = 1.0;
          if (v135 != 0.0)
          {
            float32x4_t v211 = v134;
            float v214 = v133;
            float v137 = sinf(v135);
            float32x4_t v134 = v211;
            float v133 = v214;
            float v136 = v137 / v135;
          }
          float32x4_t v138 = (float32x4_t)xmmword_472E0;
          float32x4_t v139 = vmlaq_f32(vmulq_n_f32(v219, v118 * (float)(v133 * v136)), (float32x4_t)xmmword_472E0, v134);
          int8x16_t v140 = (int8x16_t)vmulq_f32(v139, v139);
          float32x2_t v141 = vadd_f32(*(float32x2_t *)v140.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v140, v140, 8uLL));
          if (vaddv_f32(v141) != 0.0)
          {
            unsigned __int32 v142 = vadd_f32(v141, (float32x2_t)vdup_lane_s32((int32x2_t)v141, 1)).u32[0];
            float32x2_t v143 = vrsqrte_f32((float32x2_t)v142);
            float32x2_t v144 = vmul_f32(v143, vrsqrts_f32((float32x2_t)v142, vmul_f32(v143, v143)));
            float32x4_t v138 = vmulq_n_f32(v139, vmul_f32(v144, vrsqrts_f32((float32x2_t)v142, vmul_f32(v144, v144))).f32[0]);
          }
          int32x4_t v145 = (int32x4_t)vnegq_f32(v221);
          int8x16_t v146 = (int8x16_t)vtrn2q_s32((int32x4_t)v221, vtrn1q_s32((int32x4_t)v221, v145));
          float32x4_t v147 = (float32x4_t)vrev64q_s32((int32x4_t)v221);
          v147.i32[0] = v145.i32[1];
          v147.i32[3] = v145.i32[2];
          float32x4_t v148 = vaddq_f32(vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v221, (int8x16_t)v145, 8uLL), *(float32x2_t *)v216.f32, 1), (float32x4_t)vextq_s8(v146, v146, 8uLL), v216.f32[0]), vmlaq_laneq_f32(vmulq_laneq_f32(v221, v216, 3), v147, v216, 2));
          float32x4_t v149 = vmulq_f32(v148, (float32x4_t)xmmword_47270);
          int32x4_t v150 = (int32x4_t)vnegq_f32(v149);
          int8x16_t v151 = (int8x16_t)vtrn2q_s32((int32x4_t)v149, vtrn1q_s32((int32x4_t)v149, v150));
          float32x4_t v152 = (float32x4_t)vrev64q_s32((int32x4_t)v149);
          v152.i32[0] = v150.i32[1];
          v152.i32[3] = v150.i32[2];
          _Q1 = vaddq_f32(vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v149, (int8x16_t)v150, 8uLL), *(float32x2_t *)v138.f32, 1), (float32x4_t)vextq_s8(v151, v151, 8uLL), v138.f32[0]), vmlaq_laneq_f32(vmulq_laneq_f32(v149, v138, 3), v152, v138, 2));
          int32x4_t v154 = (int32x4_t)vnegq_f32(_Q1);
          int8x16_t v155 = (int8x16_t)vtrn2q_s32((int32x4_t)_Q1, vtrn1q_s32((int32x4_t)_Q1, v154));
          _Q4 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)_Q1, (int8x16_t)v154, 8uLL), *(float32x2_t *)v148.f32, 1), (float32x4_t)vextq_s8(v155, v155, 8uLL), v148.f32[0]);
          _Q3 = (float32x4_t)vrev64q_s32((int32x4_t)_Q1);
          _Q3.i32[0] = v154.i32[1];
          _Q3.i32[3] = v154.i32[2];
          _Q2 = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(_Q1, v148, 3), _Q3, v148, 2), _Q4);
          _Q3.i32[0] = _Q2.i32[1];
          _Q4.i32[0] = _Q2.i32[3];
          v148.f32[0] = vmlas_n_f32(vmuls_lane_f32(_Q2.f32[2], _Q2, 3), _Q2.f32[1], _Q2.f32[0]);
          __asm
          {
            FMLA            S1, S3, V2.S[1]
            FMLA            S1, S4, V2.S[3]
            FMLS            S1, S2, V2.S[0]; float
          }
          float v162 = atan2f(v148.f32[0] + v148.f32[0], _Q1.f32[0]);
          v258[1] = 0;
          v258[2] = 0;
          __double2 v163 = __sincos_stret(v162 * 0.5);
          v258[3] = *(float32x2_t *)&v163.__sinval;
          v258[0] = *(float32x2_t *)&v163.__cosval;
          v256.f64[0] = FigMotionMultiplyQuaternions(v256.f64, (double *)v258);
          v256.f64[1] = v164;
          v257.f64[0] = v165;
          v257.f64[1] = v166;
          long long v10 = v228;
        }
      }
    }
  }
  int v220 = v24;
  int v222 = a2;
  float32x2_t v167 = *(float32x2_t *)(*((void *)&v234 + 1) + 8 * a2);
  v258[0] = vmul_n_f32(v254, *((float *)&v240 + 1));
  if (*(int *)(v8 + 176) < 1)
  {
LABEL_75:
    if (!*(unsigned char *)v10)
    {
      int v193 = *(_DWORD *)(v8 + 176);
      if (v193 >= 1) {
        int v194 = v193 - 1;
      }
      else {
        int v194 = *(_DWORD *)(v8 + 176);
      }
      int v195 = v193 / 2;
      v229.f64[0] = FigMotionMultiplyQuaternions((double *)(*(void *)(v247 + 8 * (v194 >> 1)) + 32 * v11), (double *)(v8 + 32 * ((uint64_t)v194 >> 1) + 27872));
      v229.f64[1] = v196;
      v230.f64[0] = v197;
      v230.f64[1] = v198;
      if (v195 == v194 >> 1)
      {
        float64x2_t v256 = v229;
        float64x2_t v257 = v230;
      }
      else
      {
        double v260 = FigMotionMultiplyQuaternions((double *)(*(void *)(v247 + 8 * v195) + 32 * v11), (double *)(v8 + 32 * v195 + 27872));
        uint64_t v261 = v199;
        uint64_t v262 = v200;
        uint64_t v263 = v201;
        v256.f64[0] = GVSInterpolateQuaternionsLERP((uint64_t)&v260, (uint64_t)&v229, 1, 0, 0.5);
        v256.f64[1] = v202;
        v257.f64[0] = v203;
        v257.f64[1] = v204;
      }
    }
    float64x2_t v205 = v257;
    *(float64x2_t *)(v8 + 28096) = v256;
    *(float64x2_t *)(v8 + 28112) = v205;
    *(float32x2_t *)(v8 + 28224) = v255;
    *(float32x2_t *)(v8 + 28232) = v254;
    if (*(unsigned char *)(*((void *)&v235 + 1) + v11))
    {
      v229.f64[0] = FigMotionMultiplyByInverseOfQuaternion(v256.f64, (uint64_t *)(*(void *)(v234 + 8 * *(int *)(v8 + 176)) + 32 * v11));
      v229.f64[1] = v206;
      v230.f64[0] = v207;
      v230.f64[1] = v208;
      double v260 = 0.0;
      GVSComputeTranslationFromCameraMotion(v229.f64, (float32x2_t *)&v260, *((float *)&v240 + 1));
      if (fmaxf(fabsf(*(float *)&v260), fabsf(*((float *)&v260 + 1))) > 1.0) {
        BOOL v253 = 0;
      }
    }
    uint64_t v209 = 0;
    *uint64_t v217 = v253;
  }
  else
  {
    uint64_t v168 = 0;
    uint64_t v226 = v8 + 128;
    float v169 = v15 - v16;
    float32x2_t v170 = vmul_n_f32(vsub_f32(v167, v255), *((float *)&v240 + 1));
    uint64_t v171 = v13;
    float v172 = (float64x2_t *)(v8 + 336);
    double v173 = v169;
    uint64_t v223 = (int *)(v8 + 136);
    uint64_t v174 = v8 + 27872;
    int v175 = (float *)(v8 + 27152);
    uint64_t v176 = v8;
    while (1)
    {
      if (*((int *)v10 + 503) < 1)
      {
        if (*(unsigned char *)v10)
        {
          float v179 = (uint64_t *)(*(void *)(v247 + 8 * v168) + 32 * v11);
          float v180 = &v256;
        }
        else
        {
          float64x2_t v229 = 0u;
          float64x2_t v230 = 0u;
          v229.f64[0] = GVSComputeGaussianAverageQuaternion((uint64_t)&v234, v168, v222, v220 != 0, 0, 0, a5, v10[593]);
          v229.f64[1] = v181;
          v230.f64[0] = v182;
          v230.f64[1] = v183;
          if (*(void *)(v8 + 29552))
          {
            v229.f64[0] = FigMotionMultiplyQuaternions((double *)(v248 + 32 * v11), v229.f64);
            v229.f64[1] = v184;
            v230.f64[0] = v185;
            v230.f64[1] = v186;
          }
          float v179 = (uint64_t *)(*(void *)(v247 + 8 * v168) + 32 * v11);
          float v180 = &v229;
        }
        *(double *)uint64_t v174 = FigMotionMultiplyByInverseOfQuaternion(v180->f64, v179);
        *(void *)(v174 + 8) = v187;
        *(void *)(v174 + 16) = v188;
        *(void *)(v174 + 24) = v189;
      }
      else
      {
        int v177 = (_OWORD *)(*((void *)&v247 + 1) + 32 * v11);
        long long v178 = v177[1];
        *(_OWORD *)uint64_t v174 = *v177;
        *(_OWORD *)(v174 + 16) = v178;
      }
      *(float32x2_t *)&v229.f64[0] = v170;
      if (v14) {
        *(float32x2_t *)&v229.f64[0] = vadd_f32(v170, *(float32x2_t *)(*(void *)(v14[1] + 8 * v171) + 8 * v168));
      }
      uint64_t v190 = GVSComputeTransformFromCameraMotion((double *)v174, v172, (uint64_t)&v240, (float32x2_t *)&v229, v258, v175);
      if (v190) {
        break;
      }
      if (v14
        && (uint64_t v191 = v14[2]) != 0
        && (([*(id *)(v191 + 240 * (int)v171) isValid] & 1) != 0
         || [*(id *)(v14[2] + 240 * (int)v171 + 8) isValid]))
      {
        uint64_t v190 = GVSCheckDistortedTransformFits(v175, (double *)v246 + 1, v223, v14[2] + 240 * (int)v171, v173 > 0.2468, &v253);
        if (v190) {
          break;
        }
        BOOL v192 = v253;
      }
      else
      {
        uint64_t v190 = limitTransformToOverscan(v226, (double *)v246 + 1, (uint64_t)v175, *((float *)&v241 + 1));
        if (v190) {
          break;
        }
        BOOL v192 = *(float *)(v176 + 196) >= 1.0;
        BOOL v253 = *(float *)(v176 + 196) >= 1.0;
      }
      uint64_t v8 = v176;
      long long v10 = v228;
      if (!a3 || v192)
      {
        ++v168;
        v174 += 32;
        v175 += 9;
        if (v168 < *(int *)(v176 + 176)) {
          continue;
        }
      }
      goto LABEL_75;
    }
    uint64_t v209 = v190;
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v209;
}

uint64_t limitTransformToOverscan(uint64_t a1, double *a2, uint64_t a3, float a4)
{
  float v6 = 1.0;
  if (*(_DWORD *)(a1 + 40) <= 2u)
  {
    *(void *)(a3 + 24) = 0;
    *(_DWORD *)(a3 + 32) = 1065353216;
  }
  uint64_t result = GVSFindBestPerspectiveTransform((float *)a3, a2, (int *)(a1 + 24), &v6, a4);
  if (result)
  {
    *(unsigned char *)(a1 + 74) = 1;
  }
  else if (v6 < *(float *)(a1 + 68))
  {
    *(float *)(a1 + 68) = v6;
  }
  return result;
}

uint64_t _runSmartStyleIntegrate(uint64_t a1, void *target)
{
  rect.origin.double x = 0.0;
  rect.origin.y = 0.0;
  __asm { FMOV            V0.2D, #1.0 }
  rect.CGSize size = _Q0;
  if (!a1 || !target)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    long long v22 = 0;
    double v15 = 0;
    int v12 = 0;
    int v13 = 0;
    uint64_t v11 = 0;
    goto LABEL_39;
  }
  CGSize v31 = _Q0;
  if (gGMFigKTraceEnabled == 1)
  {
    _getPresentationTimeStampForSampleBuffer(target, 0, (uint64_t)&time);
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }
  long long v10 = CMGetAttachment(target, kFigSampleBufferAttachmentKey_AttachedMedia, 0);
  uint64_t v11 = v10;
  if (!v10)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    long long v22 = 0;
    double v15 = 0;
    int v12 = 0;
LABEL_33:
    int v13 = 0;
    goto LABEL_39;
  }
  int v12 = [v10 objectForKeyedSubscript:kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingUnstyledThumbnail];

  if (!v12)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    long long v22 = 0;
    double v15 = 0;
    goto LABEL_33;
  }
  int v13 = CMGetAttachment(target, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0);
  if (!v13) {
    goto LABEL_36;
  }
  CFDataRef v14 = (void *)kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingLearnedCoefficients;
  double v15 = [v11 objectForKeyedSubscript:kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingLearnedCoefficients];

  if (!v15)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    long long v22 = 0;
LABEL_37:
    int v12 = 0;
    goto LABEL_39;
  }
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v12);
  if (!ImageBuffer)
  {
LABEL_36:
    fig_log_get_emitter();
    FigDebugAssert3();
    long long v22 = 0;
    double v15 = 0;
    goto LABEL_37;
  }
  CVImageBufferRef v17 = ImageBuffer;
  int v12 = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v15);
  if (v12)
  {
    float64_t v32 = v11;
    int v18 = *(unsigned __int8 *)(a1 + 30065);
    float64_t v33 = v13;
    long long v19 = [v13 objectForKeyedSubscript:kFigCaptureSampleBufferMetadata_SmartStyleLearnedRect];

    if (v19 && v18 && !CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)v19, &rect))
    {
      fig_log_get_emitter();
      uint64_t v30 = v2;
      LODWORD(v29) = 0;
      FigDebugAssert3();
      rect.origin.double x = 0.0;
      rect.origin.y = 0.0;
      rect.CGSize size = v31;
    }
    CFStringRef v20 = (const __CFString *)kFigCaptureSampleBufferAttachmentKey_SmartStyleMetalEvent;
    double v15 = CMGetAttachment(target, kFigCaptureSampleBufferAttachmentKey_SmartStyleMetalEvent, 0);
    id v21 = objc_alloc_init(*(Class *)(a1 + 30104));
    long long v22 = v21;
    if (!v21)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v12 = 0;
      uint64_t v27 = 4294954510;
LABEL_26:
      uint64_t v11 = v32;
      int v13 = v33;
      goto LABEL_27;
    }
    [v21 setMetalSharedEvent:v15];
    [v22 setInputMetadataDict:v33];
    [v22 setInputUnstyledThumbnailPixelBuffer:v17];
    [v22 setInputStyleCoefficientsPixelBuffer:v12];
    objc_msgSend(v22, "setPrimaryCaptureRect:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    if (v18)
    {
      long long v23 = [*(id *)(a1 + 30072) configuration];
      int v24 = [v23 styleEngineConfiguration];
      [v24 globalLinearSystemMixFactor];
      objc_msgSend(v22, "setGlobalLinearSystemMixFactor:");
    }
    else
    {
      id updated = (id)_updateSmartStyleGlobalMixFactor((float32x2_t *)a1, v33);
      if (updated)
      {
LABEL_41:
        uint64_t v27 = (uint64_t)updated;
        fig_log_get_emitter();
        FigDebugAssert3();
        int v12 = 0;
        goto LABEL_26;
      }
      LODWORD(v26) = *(_DWORD *)(a1 + 30156);
      [v22 setGlobalLinearSystemMixFactor:v26];
    }
    objc_msgSend(*(id *)(a1 + 30072), "setInputOutput:", v22, v29, v30);
    id updated = [*(id *)(a1 + 30072) process];
    if (!updated)
    {
      int v12 = [*(id *)(a1 + 30072) outputIntegratedStyleCoefficientsTexture];
      if (!*(unsigned char *)(a1 + 30066)) {
        _setAttachedMediaToSampleBuffer(target, v14, 0);
      }
      _setAttachedMediaToSampleBuffer(target, kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingIntegratedForwardLearnedCoefficients, v12);
      if (v15) {
        CMRemoveAttachment(target, v20);
      }
      uint64_t v27 = 0;
      goto LABEL_26;
    }
    goto LABEL_41;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  long long v22 = 0;
  double v15 = 0;
LABEL_39:
  uint64_t v27 = 4294954516;
LABEL_27:
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }

  return v27;
}

uint64_t _runSmartStyleApplyOnUnstabilizedThumbnail(uint64_t a1, void *target)
{
  memset(&timingArrayOut, 0, sizeof(timingArrayOut));
  CVBufferRef destinationBuffer = 0;
  CFTypeRef cf = 0;
  if (!a1 || !target)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    long long v4 = 0;
LABEL_38:
    CMSampleBufferRef v5 = 0;
LABEL_40:
    id v21 = 0;
    long long v23 = 0;
    uint64_t PixelBufferFromPool = 4294954516;
    goto LABEL_29;
  }
  if (gGMFigKTraceEnabled == 1)
  {
    _getPresentationTimeStampForSampleBuffer(target, 0, (uint64_t)&v28);
    CMTime time = v28;
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }
  long long v4 = CMGetAttachment(target, kFigSampleBufferAttachmentKey_AttachedMedia, 0);
  if (!v4)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_38;
  }
  CMSampleBufferRef v5 = CMGetAttachment(target, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0);
  if (!v5
    || ([v4 objectForKeyedSubscript:kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingUnstyledThumbnail], float v6 = objc_claimAutoreleasedReturnValue(), v6, !v6))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_40;
  }
  uint64_t v27 = v5;
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v6);
  if (!ImageBuffer
    || (uint64_t v8 = ImageBuffer,
        [v4 objectForKeyedSubscript:kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingLearnedCoefficients], int8x16_t v9 = objc_claimAutoreleasedReturnValue(), v9, !v9)|| (v10 = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v9)) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v21 = 0;
    long long v23 = 0;
    uint64_t PixelBufferFromPool = 4294954516;
    CMSampleBufferRef v5 = v27;
    goto LABEL_29;
  }
  CVImageBufferRef v11 = v10;
  double v26 = v4;
  if (*(unsigned char *)(a1 + 25))
  {
    int v12 = *(_DWORD *)(a1 + 27148);
    int v13 = v12 | 2;
    if (v12 == 2) {
      int v14 = 66000;
    }
    else {
      int v14 = 0;
    }
    if (v13 == 3) {
      unsigned int v15 = 66000;
    }
    else {
      unsigned int v15 = v14;
    }
  }
  else
  {
    unsigned int v15 = 0;
  }
  double v16 = (void *)kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingStyledThumbnail;
  CVImageBufferRef v17 = [*(id *)(a1 + 48) objectForKeyedSubscript:kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingStyledThumbnail];
  CFDictionaryRef v18 = [*(id *)(a1 + 56) objectForKeyedSubscript:v16];
  uint64_t PixelBufferFromPool = sbp_gvs_getPixelBufferFromPool(v17, v18, 0, v15, 0, 0, &destinationBuffer);

  if (PixelBufferFromPool)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v21 = 0;
    long long v23 = 0;
LABEL_44:
    long long v4 = v26;
    CMSampleBufferRef v5 = v27;
    goto LABEL_29;
  }
  CVBufferPropagateAttachments(v8, destinationBuffer);
  CFStringRef v20 = (const __CFString *)kFigCaptureSampleBufferAttachmentKey_SmartStyleMetalEvent;
  id v21 = CMGetAttachment(target, kFigCaptureSampleBufferAttachmentKey_SmartStyleMetalEvent, 0);
  id v22 = objc_alloc_init(*(Class *)(a1 + 30104));
  long long v23 = v22;
  if (!v22)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t PixelBufferFromPool = 4294954510;
    goto LABEL_44;
  }
  [v22 setMetalSharedEvent:v21];
  [v23 setInputUnstyledPixelBuffer:v8];
  CMSampleBufferRef v5 = v27;
  [v23 setInputMetadataDict:v27];
  [v23 setInputStyleCoefficientsPixelBuffer:v11];
  [v23 setOutputStyledPixelBuffer:destinationBuffer];
  [*(id *)(a1 + 30080) setInputOutput:v23];
  uint64_t SampleTimingInfoArray = (uint64_t)[*(id *)(a1 + 30080) process];
  if (SampleTimingInfoArray
    || (uint64_t SampleTimingInfoArray = (uint64_t)[*(id *)(a1 + 30080) finishProcessing],
        SampleTimingInfoArray)
    || (uint64_t SampleTimingInfoArray = CMSampleBufferGetSampleTimingInfoArray((CMSampleBufferRef)v6, 1, &timingArrayOut, 0),
        SampleTimingInfoArray)
    || (uint64_t SampleTimingInfoArray = sbp_internalCreateSampleBufferWithNewPixelBuffer(destinationBuffer, *(void **)(a1 + 64), v16, &timingArrayOut, (CMSampleBufferRef *)&cf), SampleTimingInfoArray))
  {
    uint64_t PixelBufferFromPool = SampleTimingInfoArray;
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    _setAttachedMediaToSampleBuffer(target, v16, (void *)cf);
    if (v21) {
      CMRemoveAttachment(target, v20);
    }
    uint64_t PixelBufferFromPool = 0;
  }
  long long v4 = v26;
LABEL_29:
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
  if (cf) {
    CFRelease(cf);
  }
  if (destinationBuffer) {
    CFRelease(destinationBuffer);
  }

  return PixelBufferFromPool;
}

uint64_t sbp_gvs_createStabilizedAttachmentsPixelBuffers(uint64_t a1, void *target, opaqueCMSampleBuffer *a3, _OWORD *a4)
{
  CFTypeRef cf = 0;
  CVBufferRef destinationBuffer = 0;
  if (!a1 || !target || !a3 || *(_DWORD *)(a1 + 172))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v10 = 0;
LABEL_45:
    uint64_t PixelBufferFromPool = 4294954516;
    goto LABEL_41;
  }
  uint64_t v6 = *(unsigned int *)(a1 + 128);
  int v7 = *(_DWORD *)(a1 + 132);
  float64x2_t v44 = 0uLL;
  v45.f64[0] = (double)(int)v6;
  v45.f64[1] = (double)v7;
  if (*(unsigned char *)(a1 + 224))
  {
    *(_OWORD *)&timingArrayOut.duration.value = *a4;
    ensureValidBufferRectIsCompatibleWithGPU(v6, v7, (int *)&timingArrayOut);
    v8.i64[0] = SLODWORD(timingArrayOut.duration.value);
    v8.i64[1] = SHIDWORD(timingArrayOut.duration.value);
    float64x2_t v9 = vcvtq_f64_s64(v8);
    v8.i64[0] = timingArrayOut.duration.timescale;
    v8.i64[1] = (int)timingArrayOut.duration.flags;
    float64x2_t v44 = v9;
    float64x2_t v45 = vcvtq_f64_s64(v8);
  }
  CMGetAttachment(target, kFigSampleBufferAttachmentKey_AttachedMedia, 0);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    uint64_t PixelBufferFromPool = 0;
    goto LABEL_41;
  }
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (!ImageBuffer)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_45;
  }
  int v12 = ImageBuffer;
  targeta = (opaqueCMSampleBuffer *)target;
  unsigned int Width = CVPixelBufferGetWidth(ImageBuffer);
  unsigned int Height = CVPixelBufferGetHeight(v12);
  v50[0] = kFigCaptureStreamMetadataOutputKey_HumanFullBodiesMask;
  v50[1] = kFigCaptureStreamMetadataOutputKey_HumanSkinsMask;
  v50[2] = kFigCaptureStreamMetadataOutputKey_HumanHairMask;
  v50[3] = kFigCaptureStreamMetadataOutputKey_SkyMask;
  uint64_t v36 = kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingLinearThumbnail;
  v50[4] = kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingLinearThumbnail;
  unsigned int v15 = +[NSArray arrayWithObjects:v50 count:5];
  double v16 = +[NSMutableArray arrayWithArray:v15];

  if (v16)
  {
    if (!*(unsigned char *)(a1 + 30067))
    {
      v49[0] = kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingUnstyledThumbnail;
      v49[1] = kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingStyledThumbnail;
      CVImageBufferRef v17 = +[NSArray arrayWithObjects:v49 count:2];
      [v16 addObjectsFromArray:v17];

      CFDictionaryRef v18 = CMGetAttachment(target, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0);
      [v18 setObject:0 forKeyedSubscript:kFigVideoStabilizationSampleBufferAttachmentKey_OutputSmartStyleUnstyledEnabled];
    }
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v10 = v10;
    id v19 = [v10 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v41;
      CFStringRef key = kCVImageBufferTransferFunctionKey;
      double v34 = COERCE_DOUBLE(__PAIR64__(Height, Width));
      id v35 = v10;
      uint64_t v33 = *(void *)v41;
      while (2)
      {
        for (float i = 0; i != v20; float i = (char *)i + 1)
        {
          if (*(void *)v41 != v21) {
            objc_enumerationMutation(v10);
          }
          long long v23 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          if ([v16 containsObject:v23])
          {
            memset(&timingArrayOut, 0, sizeof(timingArrayOut));
            int v24 = [v10 objectForKeyedSubscript:v23];

            float32x2_t v25 = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v24);
            if (*(unsigned char *)(a1 + 25))
            {
              if ((*(_DWORD *)(a1 + 27148) - 1) >= 3) {
                unsigned int v26 = 0;
              }
              else {
                unsigned int v26 = 66000;
              }
            }
            else
            {
              unsigned int v26 = 0;
            }
            uint64_t v27 = [*(id *)(a1 + 48) objectForKeyedSubscript:v23];
            CFDictionaryRef v28 = [*(id *)(a1 + 56) objectForKeyedSubscript:v23];
            uint64_t PixelBufferFromPool = sbp_gvs_getPixelBufferFromPool(v27, v28, 0, v26, 0, 0, &destinationBuffer);

            if (PixelBufferFromPool)
            {
              fig_log_get_emitter();
              FigDebugAssert3();
              id v10 = v35;
              goto LABEL_39;
            }
            CVBufferPropagateAttachments(v25, destinationBuffer);
            if ([v23 isEqual:v36]) {
              CVBufferRemoveAttachment(destinationBuffer, key);
            }
            uint64_t SampleTimingInfoArray = AffineTransformArrayApplyOnAttachment(*(void **)(a1 + 88), targeta, v23, (uint64_t)destinationBuffer, *(void *)(a1 + 27408), (uint64_t)&v44, COERCE_DOUBLE(vrev64_s32(*(int32x2_t *)(a1 + 180))), COERCE_DOUBLE(vrev64_s32(*(int32x2_t *)(a1 + 188))), v34);
            id v10 = v35;
            if (SampleTimingInfoArray
              || (uint64_t SampleTimingInfoArray = CMSampleBufferGetSampleTimingInfoArray((CMSampleBufferRef)v24, 1, &timingArrayOut, 0), SampleTimingInfoArray)|| (uint64_t SampleTimingInfoArray = sbp_internalCreateSampleBufferWithNewPixelBuffer(destinationBuffer, *(void **)(a1 + 64), v23, &timingArrayOut, (CMSampleBufferRef *)&cf), SampleTimingInfoArray))
            {
              uint64_t PixelBufferFromPool = SampleTimingInfoArray;
              fig_log_get_emitter();
              FigDebugAssert3();
              goto LABEL_39;
            }
            _setAttachedMediaToSampleBuffer(a3, v23, (void *)cf);
            _setAttachedMediaToSampleBuffer(targeta, v23, 0);
            if (destinationBuffer)
            {
              CFRelease(destinationBuffer);
              CVBufferRef destinationBuffer = 0;
            }
            uint64_t v21 = v33;
            if (cf)
            {
              CFRelease(cf);
              CFTypeRef cf = 0;
            }
          }
        }
        id v20 = [v10 countByEnumeratingWithState:&v40 objects:v48 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }
    uint64_t PixelBufferFromPool = 0;
LABEL_39:

    if (destinationBuffer)
    {
      CFRelease(destinationBuffer);
      CVBufferRef destinationBuffer = 0;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t PixelBufferFromPool = 4294954510;
  }
LABEL_41:
  if (cf) {
    CFRelease(cf);
  }

  return PixelBufferFromPool;
}

uint64_t _runSmartStyleReverseLearning(uint64_t a1, void *a2, void *target)
{
  memset(&timingArrayOut, 0, sizeof(timingArrayOut));
  CFTypeRef v29 = 0;
  CFTypeRef cf = 0;
  CFDictionaryRef v28 = 0;
  if (!a1 || !a2 || !target)
  {
    fig_log_get_emitter();
LABEL_34:
    FigDebugAssert3();
LABEL_36:
    uint64_t PixelBufferFromPool = 4294954516;
    goto LABEL_25;
  }
  if (gGMFigKTraceEnabled == 1)
  {
    _getPresentationTimeStampForSampleBuffer(a2, 0, (uint64_t)&time);
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }
  uint64_t v6 = CMGetAttachment(target, kFigSampleBufferAttachmentKey_AttachedMedia, 0);
  if (!v6)
  {
    fig_log_get_emitter();
    goto LABEL_34;
  }
  int v7 = v6;
  int64x2_t v8 = (void *)kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingStyledThumbnail;
  float64x2_t v9 = [v6 objectForKeyedSubscript:kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingStyledThumbnail];

  if (!v9
    || (CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v9)) == 0
    || (CVImageBufferRef v11 = ImageBuffer,
        int v12 = (void *)kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingUnstyledThumbnail,
        [v7 objectForKeyedSubscript:kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingUnstyledThumbnail], int v13 = objc_claimAutoreleasedReturnValue(), v13, !v13)|| (v14 = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v13)) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    goto LABEL_36;
  }
  CVImageBufferRef v15 = v14;
  uint64_t v27 = v7;
  unsigned int v26 = v8;
  if (*(unsigned char *)(a1 + 25))
  {
    int v16 = *(_DWORD *)(a1 + 27148);
    int v17 = v16 | 2;
    if (v16 == 2) {
      int v18 = 66000;
    }
    else {
      int v18 = 0;
    }
    if (v17 == 3) {
      unsigned int v19 = 66000;
    }
    else {
      unsigned int v19 = v18;
    }
  }
  else
  {
    unsigned int v19 = 0;
  }
  id v20 = (void *)kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingReverseLearnedCoefficients;
  uint64_t v21 = [*(id *)(a1 + 48) objectForKeyedSubscript:kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingReverseLearnedCoefficients];
  CFDictionaryRef v22 = [*(id *)(a1 + 56) objectForKeyedSubscript:v20];
  uint64_t PixelBufferFromPool = sbp_gvs_getPixelBufferFromPool(v21, v22, 0, v19, 0, 0, (CVPixelBufferRef *)&v29);

  if (!PixelBufferFromPool)
  {
    uint64_t SampleTimingInfoArray = (uint64_t)[*(id *)(a1 + 30088) learnTransformFrom:v11 to:v15 outputCoefficients:v29 outputIntegratedCoefficients:&v28];
    if (SampleTimingInfoArray
      || (uint64_t SampleTimingInfoArray = CMSampleBufferGetSampleTimingInfoArray((CMSampleBufferRef)target, 1, &timingArrayOut, 0), SampleTimingInfoArray))
    {
      uint64_t PixelBufferFromPool = SampleTimingInfoArray;
      fig_log_get_emitter();
    }
    else
    {
      uint64_t PixelBufferFromPool = sbp_internalCreateSampleBufferWithNewPixelBuffer((__CVBuffer *)v29, *(void **)(a1 + 64), v20, &timingArrayOut, (CMSampleBufferRef *)&cf);
      if (!PixelBufferFromPool)
      {
        _setAttachedMediaToSampleBuffer(a2, kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingIntegratedReverseLearnedCoefficients, v28);
        _setAttachedMediaToSampleBuffer(target, v20, (void *)cf);
        _setAttachedMediaToSampleBuffer(target, kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingLearnedCoefficients, 0);
        _setAttachedMediaToSampleBuffer(target, v26, 0);
        _setAttachedMediaToSampleBuffer(target, v12, 0);
LABEL_24:

        goto LABEL_25;
      }
      fig_log_get_emitter();
    }
    FigDebugAssert3();
    goto LABEL_24;
  }
  fig_log_get_emitter();
  FigDebugAssert3();

LABEL_25:
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v29) {
    CFRelease(v29);
  }

  return PixelBufferFromPool;
}

uint64_t sbp_gvs_createStabilizedPixelBuffer(uint64_t a1, CMSampleBufferRef sbuf, _OWORD *a3, __CVBuffer *a4)
{
  if (!a1 || !sbuf || !a4 || (CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(sbuf)) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 4294954516;
  }
  CVImageBufferRef v10 = ImageBuffer;
  uint64_t v11 = a1 + 27148;
  if (CMGetAttachment(ImageBuffer, @"InputDepthPixelBuffer", 0))
  {
    value[0] = 0;
    if (*(unsigned char *)(a1 + 25))
    {
      if ((*(_DWORD *)v11 - 1) >= 3) {
        unsigned int v12 = 0;
      }
      else {
        unsigned int v12 = 66000;
      }
    }
    else
    {
      unsigned int v12 = 0;
    }
    int v13 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"OutputBufferDepth"];
    CFDictionaryRef v14 = [*(id *)(a1 + 56) objectForKeyedSubscript:@"OutputBufferDepth"];
    uint64_t PixelBufferFromPool = sbp_gvs_getPixelBufferFromPool(v13, v14, 0, v12, 0, 0, (CVPixelBufferRef *)value);

    if (PixelBufferFromPool) {
      goto LABEL_63;
    }
    CMSetAttachment(v10, @"OutputDepthPixelBuffer", value[0], 0);
    if (value[0]) {
      CFRelease(value[0]);
    }
  }
  if (!*(_DWORD *)(a1 + 172) && *(unsigned char *)(a1 + 30066))
  {
    value[0] = 0;
    if (*(unsigned char *)(a1 + 25))
    {
      if (*(_DWORD *)v11 == 2) {
        int v20 = 66000;
      }
      else {
        int v20 = 0;
      }
      if ((*(_DWORD *)v11 | 2) == 3) {
        unsigned int v21 = 66000;
      }
      else {
        unsigned int v21 = v20;
      }
    }
    else
    {
      unsigned int v21 = 0;
    }
    uint64_t v61 = kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingDeltaMap;
    float32x4_t v62 = [*(id *)(a1 + 48) objectForKeyedSubscript:kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingDeltaMap];
    CFDictionaryRef v63 = [*(id *)(a1 + 56) objectForKeyedSubscript:v61];
    uint64_t PixelBufferFromPool = sbp_gvs_getPixelBufferFromPool(v62, v63, 0, v21, 0, 0, (CVPixelBufferRef *)value);

    if (PixelBufferFromPool) {
      goto LABEL_63;
    }
    CMSetAttachment(v10, @"OutputSmartStyleDeltaMapPixelBuffer", value[0], 0);
    if (value[0]) {
      CFRelease(value[0]);
    }
  }
  uint64_t v16 = kFigCaptureSampleBufferAttachmentKey_LowResImageUsedByVideoEncoder;
  int v17 = [*(id *)(a1 + 48) objectForKeyedSubscript:kFigCaptureSampleBufferAttachmentKey_LowResImageUsedByVideoEncoder];

  if (v17)
  {
    value[0] = 0;
    if (*(unsigned char *)(a1 + 25))
    {
      if (*(_DWORD *)v11 == 2) {
        int v18 = 66000;
      }
      else {
        int v18 = 0;
      }
      if ((*(_DWORD *)v11 | 2) == 3) {
        unsigned int v19 = 66000;
      }
      else {
        unsigned int v19 = v18;
      }
    }
    else
    {
      unsigned int v19 = 0;
    }
    CFDictionaryRef v22 = [*(id *)(a1 + 48) objectForKeyedSubscript:v16];
    CFDictionaryRef v23 = [*(id *)(a1 + 56) objectForKeyedSubscript:v16];
    uint64_t PixelBufferFromPool = sbp_gvs_getPixelBufferFromPool(v22, v23, 0, v19, 0, 0, (CVPixelBufferRef *)value);

    if (PixelBufferFromPool) {
      goto LABEL_63;
    }
    CMSetAttachment(v10, @"LowResolutionImageUsedByVideoEncoder", value[0], 0);
    if (value[0]) {
      CFRelease(value[0]);
    }
  }
  int v24 = *(_DWORD *)(a1 + 172);
  uint64_t v25 = *(void *)(a1 + 27408);
  if ((v24 - 1) >= 2)
  {
    if (v24 != 3 && v24)
    {
      uint64_t PixelBufferFromPool = 4294954516;
LABEL_63:
      fig_log_get_emitter();
      FigDebugAssert3();
      return PixelBufferFromPool;
    }
    uint64_t v26 = *(unsigned int *)(a1 + 128);
    int v27 = *(_DWORD *)(a1 + 132);
    value[0] = 0;
    value[1] = 0;
    v68.f64[0] = (double)(int)v26;
    v68.f64[1] = (double)v27;
    if (*(unsigned char *)(a1 + 224))
    {
      *(_OWORD *)&time.value = *a3;
      ensureValidBufferRectIsCompatibleWithGPU(v26, v27, (int *)&time);
      v28.i64[0] = SLODWORD(time.value);
      v28.i64[1] = SHIDWORD(time.value);
      float64x2_t v29 = vcvtq_f64_s64(v28);
      v28.i64[0] = time.timescale;
      v28.i64[1] = (int)time.flags;
      *(float64x2_t *)value = v29;
      float64x2_t v68 = vcvtq_f64_s64(v28);
    }
    if (*(_DWORD *)(a1 + 29596) && (uint64_t v30 = *(void *)(a1 + 29640)) != 0 && *(unsigned char *)(a1 + 29659))
    {
      if (gGMFigKTraceEnabled == 1)
      {
        _getPresentationTimeStampForSampleBuffer(sbuf, 0, (uint64_t)&time);
        CMTimeGetSeconds(&time);
        kdebug_trace();
        uint64_t v30 = *(void *)(a1 + 29640);
      }
      unsigned int v31 = [*(id *)(a1 + 29632) computeLTCsCorrection:v30 forPTS:*(_DWORD *)(a1 + 29628) > 2 shouldShutdown:*(unsigned char *)(a1 + 29781) != 0 skipFrame:*(double *)(a1 + 29648)];
      if (v31)
      {
        unsigned int v64 = v31;
        fig_log_get_emitter();
        uint64_t v66 = v4;
        LODWORD(v65) = v64;
        FigDebugAssert3();
        sbp_ltm_deallocateLtcCorrectionTexture(a1);
      }
      if (gGMFigKTraceEnabled == 1) {
        kdebug_trace();
      }
    }
    else
    {
      int v33 = *(_DWORD *)(a1 + 29664);
      BOOL v34 = __OFSUB__(v33, 1);
      int v35 = v33 - 1;
      if (v35 < 0 == v34) {
        *(_DWORD *)(a1 + 29664) = v35;
      }
    }
    id v32 = sbp_gvs_transformImageRender(a1, sbuf, a4, (uint64_t)value, a1 + 128, v25, *(void **)(a1 + 29640));
    if (!v32)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (Mutable)
      {
        uint64_t v37 = Mutable;
        long long v38 = (const void *)kFigCaptureVideoSTFAnalyticsKey_VideoSTFLTMApplied;
        float32x4_t v39 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 29660)];
        CFDictionarySetValue(v37, v38, v39);

        long long v40 = (const void *)kFigCaptureVideoSTFAnalyticsKey_CancellationReason;
        long long v41 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 29668)];
        CFDictionarySetValue(v37, v40, v41);

        long long v42 = (const void *)kFigCaptureVideoSTFAnalyticsKey_AnalyticsVersion;
        long long v43 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [*(id *)(a1 + 29632) videoSTFAnalyticsVersion]);
        CFDictionarySetValue(v37, v42, v43);

        if (*(unsigned char *)(a1 + 29660))
        {
          unint64_t v45 = (unint64_t)[*(id *)(a1 + 29632) getAnalyticsData:*(double *)(a1 + 29648)];
          if (v45)
          {
            fig_log_get_emitter();
            FigDebugAssert3();
          }
          else
          {
            int v46 = v44;
            float v47 = (const void *)kFigCaptureVideoSTFAnalyticsKey_MeanCorrectionLevel;
            __float2 v48 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", HIDWORD(v45), v65, v66);
            CFDictionarySetValue(v37, v47, v48);

            float32x4_t v49 = (const void *)kFigCaptureVideoSTFAnalyticsKey_MaxCorrectionLevel;
            LODWORD(v50) = v46;
            float32x4_t v51 = +[NSNumber numberWithFloat:v50];
            CFDictionarySetValue(v37, v49, v51);
          }
        }
        CMSetAttachment(sbuf, kFigVideoStabilizationSampleBufferAttachmentKey_VideoSTFAnalytics, v37, 1u);
        CFRelease(v37);
      }
      else
      {
        fig_log_get_emitter();
        FigDebugAssert3();
      }
      goto LABEL_59;
    }
LABEL_75:
    uint64_t PixelBufferFromPool = (uint64_t)v32;
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_63;
  }
  id v32 = sbp_gvs_transformImageRender(a1, sbuf, a4, 0, a1 + 128, *(void *)(a1 + 27408), 0);
  if (v32) {
    goto LABEL_75;
  }
LABEL_59:
  if (*(unsigned char *)(v11 + 2612))
  {
    CFDictionaryRef v52 = CVBufferCopyAttachments(a4, kCVAttachmentMode_ShouldPropagate);
    if (v52) {
      CFDictionaryRef v53 = (const __CFDictionary *)CFAutorelease(v52);
    }
    else {
      CFDictionaryRef v53 = 0;
    }
    CFStringRef v54 = kCVImageBufferColorPrimariesKey;
    float32x4_t v55 = CFDictionaryGetValue(v53, kCVImageBufferColorPrimariesKey);
    CFStringRef v56 = kCVImageBufferTransferFunctionKey;
    int32x4_t v57 = CFDictionaryGetValue(v53, kCVImageBufferTransferFunctionKey);
    CFStringRef v58 = kCVImageBufferYCbCrMatrixKey;
    float32x4_t v59 = CFDictionaryGetValue(v53, kCVImageBufferYCbCrMatrixKey);
    CVBufferPropagateAttachments(v10, a4);
    CVBufferSetAttachment(a4, v54, v55, kCVAttachmentMode_ShouldPropagate);
    CVBufferSetAttachment(a4, v56, v57, kCVAttachmentMode_ShouldPropagate);
    CVBufferSetAttachment(a4, v58, v59, kCVAttachmentMode_ShouldPropagate);
  }
  return 0;
}

uint64_t _runSmartStyleReverseLearningAndComputeDeltaMap(uint64_t a1, CMSampleBufferRef sbuf, opaqueCMSampleBuffer *a3)
{
  memset(&timingArrayOut, 0, sizeof(timingArrayOut));
  CFTypeRef v24 = 0;
  CFTypeRef cf = 0;
  if (!a1 || !sbuf || !a3)
  {
    fig_log_get_emitter();
LABEL_33:
    FigDebugAssert3();
    uint64_t PixelBufferFromPool = 4294954516;
    goto LABEL_24;
  }
  if (gGMFigKTraceEnabled == 1)
  {
    _getPresentationTimeStampForSampleBuffer(sbuf, 0, (uint64_t)&time);
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
  if (!ImageBuffer
    || (v7 = ImageBuffer, (CVImageBufferRef v8 = CMSampleBufferGetImageBuffer(a3)) == 0)
    || (CVImageBufferRef v9 = v8, (v10 = CMGetAttachment(v7, @"OutputSmartStyleUnstyledPixelBuffer", 0)) == 0)
    || (CFTypeRef v11 = v10, (v12 = CMGetAttachment(v7, @"OutputSmartStyleDeltaMapPixelBuffer", 0)) == 0))
  {
    fig_log_get_emitter();
    goto LABEL_33;
  }
  CFTypeRef v13 = v12;
  if (*(unsigned char *)(a1 + 25))
  {
    int v14 = *(_DWORD *)(a1 + 27148);
    int v15 = v14 | 2;
    if (v14 == 2) {
      int v16 = 66000;
    }
    else {
      int v16 = 0;
    }
    if (v15 == 3) {
      unsigned int v17 = 66000;
    }
    else {
      unsigned int v17 = v16;
    }
  }
  else
  {
    unsigned int v17 = 0;
  }
  int v18 = (void *)kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingReverseLearnedCoefficients;
  unsigned int v19 = [*(id *)(a1 + 48) objectForKeyedSubscript:kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingReverseLearnedCoefficients];
  CFDictionaryRef v20 = [*(id *)(a1 + 56) objectForKeyedSubscript:v18];
  uint64_t PixelBufferFromPool = sbp_gvs_getPixelBufferFromPool(v19, v20, 0, v17, 0, 0, (CVPixelBufferRef *)&v24);

  if (PixelBufferFromPool)
  {
LABEL_36:
    fig_log_get_emitter();
    goto LABEL_37;
  }
  uint64_t SampleTimingInfoArray = (uint64_t)[*(id *)(a1 + 30088) learnTransformFrom:v9 to:v11 outputCoefficients:v24 outputIntegratedCoefficients:0];
  if (!SampleTimingInfoArray)
  {
    uint64_t SampleTimingInfoArray = CMSampleBufferGetSampleTimingInfoArray(a3, 1, &timingArrayOut, 0);
    if (!SampleTimingInfoArray)
    {
      uint64_t SampleTimingInfoArray = sbp_internalCreateSampleBufferWithNewPixelBuffer((__CVBuffer *)v24, *(void **)(a1 + 64), v18, &timingArrayOut, (CMSampleBufferRef *)&cf);
      if (!SampleTimingInfoArray)
      {
        uint64_t PixelBufferFromPool = (uint64_t)[*(id *)(a1 + 30096) computeDeltaMapForSourcePixelBuffer:v11 targetPixelBuffer:v9 coefficients:v24 outputDeltaMapPixelBuffer:v13];
        if (!PixelBufferFromPool)
        {
          _setAttachedMediaToSampleBuffer(a3, v18, (void *)cf);
          _setAttachedMediaToSampleBuffer(a3, kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingLearnedCoefficients, 0);
          _setAttachedMediaToSampleBuffer(a3, kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingStyledThumbnail, 0);
          _setAttachedMediaToSampleBuffer(a3, kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingUnstyledThumbnail, 0);
          goto LABEL_24;
        }
        goto LABEL_36;
      }
    }
  }
  uint64_t PixelBufferFromPool = SampleTimingInfoArray;
  fig_log_get_emitter();
LABEL_37:
  FigDebugAssert3();
LABEL_24:
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v24) {
    CFRelease(v24);
  }
  return PixelBufferFromPool;
}

uint64_t ensureValidBufferRectIsCompatibleWithGPU(uint64_t result, int a2, int *a3)
{
  if (a3)
  {
    int v4 = a3[2];
    int v3 = a3[3];
    BOOL v7 = v3 >= 1 && v3 <= a2 && v4 >= 1 && v4 <= (int)result;
    if (!v7
      || (int v8 = a3[1], v8 < 0)
      || v8 >= a2
      || (int v9 = *a3, *a3 < 0)
      || v9 >= (int)result
      || (int v10 = v4 + v9, v10 < 1)
      || v10 > (int)result
      || (int v11 = v3 + v8, v3 + v8 < 1)
      || v11 > a2)
    {
      *(void *)a3 = 0;
      a3[2] = result;
      a3[3] = a2;
    }
    else
    {
      if (v8)
      {
        int v12 = a2 - 1;
        if (v8 == a2 - 1) {
          int v13 = v8 - 1;
        }
        else {
          int v13 = v8 + 1;
        }
        if (v13 < a2) {
          int v12 = v13;
        }
        a3[1] = v12;
        int v3 = v11 - v12;
        a3[3] = v3;
      }
      if (v3)
      {
        if (v3 <= 0) {
          int v14 = 0;
        }
        else {
          int v14 = v3 - 1;
        }
        a3[3] = v14;
      }
    }
  }
  else
  {
    fig_log_get_emitter();
    return FigDebugAssert3();
  }
  return result;
}

id sbp_gvs_transformImageRender(uint64_t a1, opaqueCMSampleBuffer *a2, __CVBuffer *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v13 = a7;
  double v14 = COERCE_DOUBLE(vrev64_s32(*(int32x2_t *)(a5 + 60)));
  int v15 = *(_DWORD *)(a1 + 172);
  if ((v15 - 1) >= 3)
  {
    if (v15) {
      id v18 = 0;
    }
    else {
      id v18 = (id)AffineTransformArrayApply(*(void **)(a1 + 88), a2, a3, a6, a4, v13, COERCE_DOUBLE(vrev64_s32(*(int32x2_t *)(a5 + 52))), v14);
    }
  }
  else
  {
    id v16 = *(id *)(a1 + 112);
    CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a2);
    id v18 = objc_msgSend(v16, "enqueuePixelBufferForRendering:inputValidBufferRect:metadata:ltmLUT:outputPixelBuffer:transformCounts:transforms3x3:transformStrides:", ImageBuffer, a4, CMGetAttachment(a2, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0), v13, a3, a6, COERCE_DOUBLE(vrev64_s32(*(int32x2_t *)(a5 + 52))), v14);
  }
  return v18;
}

void invert3x3Matrix(uint64_t a1, float *a2)
{
  uint64_t v4 = 0;
  float v5 = 1.0;
  float v6 = 0.0;
  do
  {
    uint64_t v7 = 0;
    int v8 = 0;
    int v9 = 0;
    int v10 = &v29;
    uint64_t v11 = a1;
    do
    {
      for (uint64_t i = 0; i != 3; ++i)
      {
        v10[i] = 0.0;
        if (v7 && v4 != i)
        {
          *(&v29 + 3 * v9 + v8) = *(float *)(v11 + 4 * i);
          if (v8 > 0) {
            ++v9;
          }
          int v8 = v8 < 1;
        }
      }
      ++v7;
      v11 += 12;
      v10 += 3;
    }
    while (v7 != 3);
    float v6 = v6 + (float)(v5 * (float)(*(float *)(a1 + 4 * v4) * (float)((float)(v29 * v32) - (float)(v30 * v31))));
    float v5 = -v5;
    ++v4;
  }
  while (v4 != 3);
  if (v6 == 0.0)
  {
    puts("\nMATRIX IS NOT INVERSIBLE");
  }
  else
  {
    for (uint64_t j = 0; j != 3; ++j)
    {
      for (uint64_t k = 0; k != 3; ++k)
      {
        uint64_t v15 = 0;
        int v16 = 0;
        int v17 = 0;
        id v18 = &v29;
        uint64_t v19 = a1;
        do
        {
          for (uint64_t m = 0; m != 3; ++m)
          {
            v18[m] = 0.0;
            if (v15 != j && k != m)
            {
              *(&v29 + 3 * v17 + v16) = *(float *)(v19 + 4 * m);
              if (v16 > 0) {
                ++v17;
              }
              int v16 = v16 < 1;
            }
          }
          ++v15;
          v19 += 12;
          v18 += 3;
        }
        while (v15 != 3);
        float v21 = powf(-1.0, (float)(k + j));
        float v22 = v21 * (float)((float)(v29 * v32) - (float)(v30 * v31));
        if (v22 == 0.0) {
          float v22 = 0.0;
        }
        v28[3 * j + k] = v22;
      }
    }
    float v23 = v28[1];
    float v24 = v28[2];
    float v25 = v28[3] / v6;
    *a2 = v28[0] / v6;
    a2[1] = v25;
    float v26 = v28[7];
    a2[2] = v28[6] / v6;
    a2[3] = v23 / v6;
    float v27 = v28[5];
    a2[4] = v28[4] / v6;
    a2[5] = v26 / v6;
    a2[6] = v24 / v6;
    a2[7] = v27 / v6;
    a2[8] = v28[8] / v6;
  }
}

float64x2_t _computeProjectedPoints(float *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = 0;
  uint64_t v10 = 0;
  char v7 = 1;
  do
  {
    char v8 = v7;
    GVSComputePerspectiveProjectedPoint(a1, (float *)&v10 + 1, (float *)&v10, *(float *)(a2 + 8 * v6), *(float *)(a2 + 8 * v6 + 4));
    char v7 = 0;
    float64x2_t result = vcvtq_f64_f32((float32x2_t)__PAIR64__(v10, HIDWORD(v10)));
    *(float64x2_t *)(a3 + 16 * v6) = result;
    uint64_t v6 = 1;
  }
  while ((v8 & 1) != 0);
  return result;
}

void sbp_gvs_UpdateSmoothParameter(uint64_t *a1, double *a2, double a3, long double a4)
{
  double v5 = fabs(FigMotionMultiplyByInverseOfQuaternion(a2, a1));
  if (v5 < a4)
  {
    acos(a4);
    acos(v5);
  }
}

uint64_t sbp_gvs_iir_ComputeCorrection(uint64_t a1, uint64_t *a2, double *a3, uint64_t a4, float32x2_t *a5, BOOL *a6, float a7)
{
  FigMotionInterpolateQuaternionsByAngle((uint64_t)a2, a3, a7);
  v24[0] = v12;
  v24[1] = v13;
  v24[2] = v14;
  v24[3] = v15;
  v23[0] = FigMotionMultiplyByInverseOfQuaternion(v24, a2);
  v23[1] = v16;
  v23[2] = v17;
  v23[3] = v18;
  uint64_t v19 = GVSComputeTransformFromCameraMotion(v23, (float64x2_t *)(a1 + 336), a4, a5, 0, v25);
  if (v19)
  {
    uint64_t v20 = v19;
    fig_log_get_emitter();
LABEL_7:
    FigDebugAssert3();
    BOOL v21 = 1;
    goto LABEL_4;
  }
  *(_DWORD *)(a1 + 196) = 1065353216;
  uint64_t v20 = limitTransformToOverscan(a1 + 128, (double *)(a4 + 104), (uint64_t)v25, *(float *)(a4 + 20));
  if (v20)
  {
    fig_log_get_emitter();
    goto LABEL_7;
  }
  BOOL v21 = *(float *)(a1 + 196) >= 1.0;
LABEL_4:
  *a6 = v21;
  return v20;
}

id _createNSArray(uint64_t a1)
{
  uint64_t v2 = +[NSMutableArray array];
  for (uint64_t i = 0; i != 28; i += 4)
  {
    LODWORD(v3) = *(_DWORD *)(a1 + i);
    double v5 = +[NSNumber numberWithFloat:v3];
    [v2 addObject:v5];
  }

  return v2;
}

uint64_t GVSComputeTransforms(uint64_t a1, uint64_t a2, uint64_t __n, uint64_t a4, uint64_t a5, _OWORD *__src, float a7, float a8, float a9, double a10, int8x16_t a11)
{
  uint64_t v11 = __src;
  unint64_t v42 = __PAIR64__(LODWORD(a10), LODWORD(a9));
  unsigned int v16 = *(_DWORD *)(a1 + 40);
  if (*(unsigned char *)(a1 + 74))
  {
    int8x16_t v17 = (int8x16_t)xmmword_472A0;
    *__src = xmmword_472A0;
    __src[1] = xmmword_472A0;
    *((_DWORD *)__src + 8) = 1065353216;
    v17.i32[0] = *(_DWORD *)(__n + 20);
    FigMotionApplyDigitalZoomToTransform(1, (float *)__src, v17, *(int32x4_t *)a2, *(double *)(a2 + 8), a10, a11);
  }
  if (*(int *)(a1 + 60) < 1)
  {
    GVSApplyTransformLimit(a1, (double *)(__n + 104), v16 < 3, (uint64_t)v11, *(float *)(__n + 20));
  }
  else
  {
    uint64_t v18 = *(int *)(a1 + 52);
    if ((int)v18 > 0)
    {
      uint64_t v37 = (float64x2_t *)a2;
      uint64_t v19 = 0;
      int v20 = *(_DWORD *)(a1 + 12);
      int v21 = v20 + *(_DWORD *)(a1 + 20) - 1;
      uint64_t v22 = (uint64_t)v11;
      int v36 = v20;
      do
      {
        if (*(unsigned char *)(a1 + 74))
        {
          if (v19)
          {
            long long v23 = *v11;
            long long v24 = v11[1];
            *(_DWORD *)(v22 + 32) = *((_DWORD *)v11 + 8);
            *(_OWORD *)uint64_t v22 = v23;
            *(_OWORD *)(v22 + 16) = v24;
          }
        }
        else
        {
          if (v20 >= v21) {
            int v20 = v21;
          }
          unint64_t v41 = __PAIR64__(LODWORD(a8), LODWORD(a7));
          if (a5) {
            unint64_t v41 = (unint64_t)vadd_f32((float32x2_t)__PAIR64__(LODWORD(a8), LODWORD(a7)), *(float32x2_t *)(a5 + 8 * v19));
          }
          float v25 = (float)((*(_DWORD *)(a1 + 48) - 1) * (v20 - v36)) / (float)((float)*(int *)(a1 + 20) + -1.0);
          uint64_t v26 = a4 + 32 * (int)vcvtms_s32_f32(v25);
          FigMotionInterpolateQuaternionsByAngle(v26, (double *)(v26 + 32), v25 - (float)(int)floorf(v25));
          v43[0] = v27;
          v43[1] = v28;
          v43[2] = v29;
          v43[3] = v30;
          GVSComputeTransformFromCameraMotion(v43, v37, __n, (float32x2_t *)&v41, (float32x2_t *)&v42, (float *)v22);
        }
        GVSApplyTransformLimit(a1, (double *)(__n + 104), v16 < 3, v22, *(float *)(__n + 20));
        ++v19;
        v20 += *(_DWORD *)(a1 + 60);
        uint64_t v18 = *(int *)(a1 + 52);
        v22 += 36;
      }
      while (v19 < v18);
    }
    if (*(int *)(a1 + 56) >= 2)
    {
      size_t v31 = 36 * v18;
      int v32 = 1;
      do
        memcpy((char *)v11 + 36 * *(_DWORD *)(a1 + 52) * v32++, v11, v31);
      while (v32 < *(_DWORD *)(a1 + 56));
    }
  }
  if (*(unsigned char *)(a1 + 75) && *(_DWORD *)(a1 + 56) * *(_DWORD *)(a1 + 52) >= 1)
  {
    uint64_t v33 = 0;
    float v34 = (float)(*(_DWORD *)(a1 + 16) + 2 * *(_DWORD *)(a1 + 8));
    do
    {
      FigMotionPostMultiplyScalingTranslationToTransform((float *)v11, -1.0, v34, 1.0, 0.0);
      ++v33;
      uint64_t v11 = (_OWORD *)((char *)v11 + 36);
    }
    while (v33 < *(int *)(a1 + 56) * (uint64_t)*(int *)(a1 + 52));
  }
  return 0;
}

float GVSApplyTransformLimit(uint64_t a1, double *a2, int a3, uint64_t a4, float result)
{
  int v6 = *(_DWORD *)(a1 + 24);
  int v5 = *(_DWORD *)(a1 + 28);
  int v8 = *(_DWORD *)(a1 + 32);
  int v7 = *(_DWORD *)(a1 + 36);
  if (a3)
  {
    *(void *)(a4 + 24) = 0;
    *(_DWORD *)(a4 + 32) = 1065353216;
  }
  if (*(_DWORD *)(a1 + 40) == 4)
  {
    *(void *)a4 = 1065353216;
    *(void *)(a4 + 12) = 0x3F80000000000000;
    *(void *)(a4 + 24) = 0;
    *(_DWORD *)(a4 + 32) = 1065353216;
  }
  if (*(unsigned char *)(a1 + 72) && *(float *)(a1 + 68) < 1.0)
  {
    double v9 = *a2 + (a2[2] + -1.0) * 0.5;
    if (result <= 0.0) {
      float v10 = 1.0;
    }
    else {
      float v10 = 1.0 / result;
    }
    float v13 = a2[1] + (a2[3] + -1.0) * 0.5;
    float v14 = (double)v5 + ((double)v7 + -1.0) * 0.5;
    if (a3)
    {
      *(void *)(a4 + 24) = 0;
      *(_DWORD *)(a4 + 32) = 1065353216;
    }
    uint64_t v15 = 0;
    float v11 = v9;
    float v12 = (double)v6 + ((double)v8 + -1.0) * 0.5;
    float v16 = v11 - (float)(v10 * v12);
    do
    {
      *(float *)(a4 + v15) = *(float *)(a1 + 68) * *(float *)(a4 + v15);
      v15 += 4;
    }
    while (v15 != 36);
    *(float *)a4 = *(float *)a4 + (float)((float)(1.0 - *(float *)(a1 + 68)) * v10);
    *(float *)(a4 + 8) = *(float *)(a4 + 8) + (float)((float)(1.0 - *(float *)(a1 + 68)) * v16);
    float v17 = *(float *)(a4 + 20);
    *(float *)(a4 + 16) = *(float *)(a4 + 16) + (float)((float)(1.0 - *(float *)(a1 + 68)) * v10);
    *(float *)(a4 + 20) = v17 + (float)((float)(1.0 - *(float *)(a1 + 68)) * (float)(v13 - (float)(v10 * v14)));
    float64x2_t result = *(float *)(a4 + 32) + (float)(1.0 - *(float *)(a1 + 68));
    *(float *)(a4 + 32) = result;
  }
  return result;
}

uint64_t GVSComputeTransformFromCameraMotion(double *a1, float64x2_t *a2, uint64_t a3, float32x2_t *a4, float32x2_t *a5, float *a6)
{
  float64x2_t v8 = 0uLL;
  float64x2_t v9 = 0uLL;
  if (a4) {
    float64x2_t v9 = vcvtq_f64_f32(*a4);
  }
  unsigned int v10 = *(_DWORD *)(a3 + 4);
  float64x2_t v11 = *a2;
  if (a5) {
    float64x2_t v8 = vcvtq_f64_f32(*a5);
  }
  uint64_t v19 = v10;
  float64x2_t v20 = vaddq_f64(v11, v9);
  uint64_t v17 = v10;
  float64x2_t v18 = vsubq_f64(v11, v8);
  int32x4_t v16 = (int32x4_t)v11;
  GVSInverseRotationMatrixFromQuaternion(a1, (uint64_t)v21);
  *(double *)v12.i64 = FigMotionComputeTransformFromRotation((uint64_t)&v19, (uint64_t)&v17, v21, (uint64_t)a6);
  v12.i32[0] = *(_DWORD *)(a3 + 20);
  FigMotionApplyDigitalZoomToTransform(1, a6, v12, v16, *(double *)&v16.i64[1], v13, v14);
  return 0;
}

float GVSInverseRotationMatrixFromQuaternion(double *a1, uint64_t a2)
{
  double v3 = *a1;
  double v2 = a1[1];
  float v4 = v2 + v2;
  double v5 = a1[2];
  double v6 = a1[3];
  float v7 = v5 + v5;
  float v8 = v6 + v6;
  *(float *)&double v2 = v2;
  *(float *)&double v5 = v5;
  *(float *)&double v6 = v6;
  *(float *)&double v6 = *(float *)&v6 * v8;
  float v9 = 1.0 - (float)(*(float *)&v2 * v4);
  float v10 = (float)(1.0 - (float)(*(float *)&v5 * v7)) - *(float *)&v6;
  *(float *)(a2 + 32) = v9 - (float)(*(float *)&v5 * v7);
  *(float *)&double v5 = *(float *)&v5 * v8;
  *(float *)&double v3 = v3;
  float v11 = v4 * *(float *)&v3;
  *(float *)(a2 + 16) = v9 - *(float *)&v6;
  *(float *)(a2 + 20) = *(float *)&v5 - v11;
  *(float *)&double v6 = (float)(*(float *)&v2 * v7) + (float)(v8 * *(float *)&v3);
  *(float *)a2 = v10;
  *(float *)(a2 + 4) = (float)(*(float *)&v2 * v7) - (float)(v8 * *(float *)&v3);
  *(float *)&double v2 = *(float *)&v2 * v8;
  *(float *)&double v3 = v7 * *(float *)&v3;
  *(float *)(a2 + 8) = *(float *)&v2 + *(float *)&v3;
  *(_DWORD *)(a2 + 12) = LODWORD(v6);
  float result = *(float *)&v2 - *(float *)&v3;
  *(float *)(a2 + 24) = result;
  *(float *)(a2 + 28) = *(float *)&v5 + v11;
  return result;
}

uint64_t GVSComputeTranslationFromCameraMotion(double *a1, float32x2_t *a2, float a3)
{
  GVSInverseRotationMatrixFromQuaternion(a1, (uint64_t)v6);
  if (fabsf(v9) <= 0.00000001)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 4294967291;
  }
  else
  {
    uint64_t result = 0;
    *a2 = vmul_n_f32((float32x2_t)__PAIR64__(v8, v7), a3 / v9);
  }
  return result;
}

float GVSComputePerspectiveProjectedPoint(float *a1, float *a2, float *a3, float a4, float a5)
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

float32_t GVSComputeMinimumZoomFactor(float64x2_t *a1, int32x2_t *a2)
{
  __asm { FMOV            V1.2S, #-1.0 }
  float32x2_t v7 = vdiv_f32(vadd_f32(vcvt_f32_s32(a2[1]), _D1), vadd_f32(vadd_f32(vcvt_f32_f64(*a1), _D1), (float32x2_t)vdup_n_s32(0xBF804189)));
  if (v7.f32[0] <= v7.f32[1]) {
    v7.f32[0] = v7.f32[1];
  }
  return v7.f32[0];
}

uint64_t GVSFindBestPerspectiveTransform(float *a1, double *a2, int *a3, float *a4, float a5)
{
  uint64_t v6 = 0;
  int v7 = *a3;
  int v8 = a3[1];
  int v9 = a3[2];
  int v10 = a3[3];
  if (a5 <= 0.0) {
    float v11 = 1.0;
  }
  else {
    float v11 = 1.0 / a5;
  }
  float v12 = *a2;
  float v13 = a2[2];
  float v14 = a2[1];
  float v15 = a2[3];
  float v16 = (double)v7 + ((double)v9 + -1.0) * 0.5;
  float v17 = (float)(v12 + (float)((float)(v13 + -1.0) * 0.5)) - (float)(v11 * v16);
  float v18 = (double)v8 + ((double)v10 + -1.0) * 0.5;
  float v19 = (float)(v14 + (float)((float)(v15 + -1.0) * 0.5)) - (float)(v11 * v18);
  float v66 = (float)v7;
  float v67 = (float)v8;
  float v68 = (float)(v7 + v9 - 1);
  float v69 = (float)v8;
  float v70 = (float)v7;
  float v71 = (float)(v8 + v10 - 1);
  float v72 = v68;
  float v73 = v71;
  float v20 = (float)(v14 + v15) + -1.0;
  float v21 = a1[6];
  float v22 = a1[7];
  float v23 = a1[8];
  float v24 = a1[1];
  float v25 = a1[2];
  float v26 = a1[3];
  float v27 = a1[4];
  float v28 = a1[5];
  float v29 = v12 + 0.5;
  float v30 = v14 + 0.5;
  float v65 = (float)(v12 + v13) + -1.0;
  float v31 = v65 + -0.5;
  float v32 = *a1 - v11;
  float v33 = v23 + -1.0;
  float v34 = v20 + -0.5;
  float v35 = v27 - v11;
  float v36 = 3.4028e38;
  do
  {
    float v38 = *(float *)((char *)&v66 + v6);
    float v37 = *(float *)((char *)&v66 + v6 + 4);
    float v39 = (float)(v23 + (float)(v22 * v37)) + (float)(v21 * v38);
    if (fabsf(v39) <= 0.00000001) {
      float v40 = (float)(v23 + (float)(v22 * v37)) + (float)(v21 * v38);
    }
    else {
      float v40 = 1.0 / v39;
    }
    float v41 = (float)((float)(v25 + (float)(v24 * v37)) + (float)(*a1 * v38)) * v40;
    if (v41 < v29)
    {
      float v42 = (float)((float)(v25 + (float)((float)(v37 * v24) + (float)(v32 * v38))) - v17)
          - (float)((float)((float)((float)(v37 * v22) + (float)(v21 * v38)) + v33) * v29);
      float v43 = -1.0;
      if (fabsf(v42) < 0.00000001) {
        goto LABEL_15;
      }
      float v44 = v29 - (float)(v38 * v11);
      goto LABEL_14;
    }
    float v43 = 1.0;
    if (v41 > v31)
    {
      float v42 = (float)((float)(v25 + (float)((float)(v37 * v24) + (float)(v32 * v38))) - v17)
          - (float)((float)((float)((float)(v37 * v22) + (float)(v21 * v38)) + v33) * v31);
      float v43 = -1.0;
      if (fabsf(v42) >= 0.00000001)
      {
        float v44 = v31 - (float)(v38 * v11);
LABEL_14:
        float v43 = (float)(v44 - v17) / v42;
      }
    }
LABEL_15:
    float v45 = v40 * (float)((float)(v28 + (float)(v27 * v37)) + (float)(v26 * v38));
    if (v45 >= v30)
    {
      float v47 = 1.0;
      if (v45 <= v34) {
        goto LABEL_22;
      }
      float v46 = (float)((float)(v28 + (float)((float)(v37 * v35) + (float)(v26 * v38))) - v19)
          - (float)((float)((float)((float)(v37 * v22) + (float)(v21 * v38)) + v33) * v34);
      float v47 = -2.0;
      if (fabsf(v46) < 0.00000001) {
        goto LABEL_22;
      }
      float v48 = v34 - (float)(v37 * v11);
    }
    else
    {
      float v46 = (float)((float)(v28 + (float)((float)(v37 * v35) + (float)(v26 * v38))) - v19)
          - (float)((float)((float)((float)(v37 * v22) + (float)(v21 * v38)) + v33) * v30);
      float v47 = -2.0;
      if (fabsf(v46) < 0.00000001) {
        goto LABEL_22;
      }
      float v48 = v30 - (float)(v37 * v11);
    }
    float v47 = (float)(v48 - v19) / v46;
LABEL_22:
    if (v43 >= v47) {
      float v49 = v47;
    }
    else {
      float v49 = v43;
    }
    if (v36 >= v49) {
      float v36 = v49;
    }
    v6 += 8;
  }
  while (v6 != 32);
  if (v36 >= 0.0 && v36 <= 1.0)
  {
    if (a4) {
      *a4 = v36;
    }
    if (v36 < 1.0)
    {
      for (uint64_t i = 0; i != 9; ++i)
        a1[i] = v36 * a1[i];
      uint64_t v53 = 0;
      *a1 = *a1 + (float)((float)(1.0 - v36) * v11);
      a1[2] = a1[2] + (float)((float)(1.0 - v36) * v17);
      float v54 = a1[5] + (float)((float)(1.0 - v36) * v19);
      a1[4] = a1[4] + (float)((float)(1.0 - v36) * v11);
      a1[5] = v54;
      a1[8] = (float)(1.0 - v36) + a1[8];
      float32x4_t v55 = &v67;
      do
      {
        float v56 = *(v55 - 1);
        float v57 = *v55;
        float v58 = (float)(a1[8] + (float)(a1[7] * *v55)) + (float)(a1[6] * v56);
        if (fabsf(v58) <= 0.00000001) {
          float v59 = (float)(a1[8] + (float)(a1[7] * *v55)) + (float)(a1[6] * v56);
        }
        else {
          float v59 = 1.0 / v58;
        }
        float v60 = (float)((float)(a1[2] + (float)(a1[1] * v57)) + (float)(*a1 * v56)) * v59;
        float v61 = v59 * (float)((float)(a1[5] + (float)(a1[4] * v57)) + (float)(a1[3] * v56));
        if (v60 < v12 || v60 > v65 || v61 < v14 || v61 > v20) {
          fprintf(__stderrp, "Warning! Corner[%d] =(%f ; %f) is still outside of boundary: output position =(%f ; %f)\n",
        }
            v53,
            v56,
            v57,
            v60,
            v61);
        ++v53;
        v55 += 2;
      }
      while (v53 != 4);
    }
    return 0;
  }
  else
  {
    fprintf(__stderrp, "Error in LimitPerspectiveTransform, minLimitFactor %f\n", v36);
    return 0xFFFFFFFFLL;
  }
}

float32x2_t GVSRotateVectorByQuaternion(float *a1, uint64_t a2)
{
  v2.f64[0] = *(float64_t *)(a2 + 24);
  v2.f64[1] = *(float64_t *)a2;
  float64x2_t v3 = *(float64x2_t *)(a2 + 8);
  double v4 = *a1;
  double v5 = a1[1];
  double v6 = a1[2];
  int8x16_t v7 = (int8x16_t)vnegq_f64(v3);
  float64x2_t v8 = vmulq_f64(v2, (float64x2_t)xmmword_47430);
  float64x2_t v9 = (float64x2_t)vextq_s8((int8x16_t)v8, (int8x16_t)vnegq_f64(v8), 8uLL);
  float64x2_t v10 = vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(v8, v5), v9, v4), (float64x2_t)vextq_s8((int8x16_t)v3, v7, 8uLL), v6);
  float64x2_t v11 = vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(v3, v5), (float64x2_t)vextq_s8(v7, (int8x16_t)v3, 8uLL), v4), v9, v6);
  return vcvt_f32_f64(vaddq_f64(vmlaq_n_f64(vmulq_n_f64(v10, *(double *)a2), (float64x2_t)vextq_s8((int8x16_t)vnegq_f64(v10), (int8x16_t)v10, 8uLL), *(double *)(a2 + 24)), vmlaq_n_f64(vmulq_n_f64(v11, v3.f64[1]), (float64x2_t)vextq_s8((int8x16_t)v11, (int8x16_t)vnegq_f64(v11), 8uLL), v3.f64[0])));
}

double GVSInterpolateQuaternionsLERP(uint64_t a1, uint64_t a2, int a3, char *a4, float a5)
{
  double v27 = 1.0 - a5;
  double v28 = a5;
  double v10 = FigMotionQuaternionDotProduct((double *)a1, (double *)a2);
  double v11 = *(double *)a1;
  double v12 = *(double *)a2;
  if (v10 >= 0.0)
  {
    double v13 = v12 * v28 + v11 * v27;
    float64x2_t v14 = vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 8), v28), *(float64x2_t *)(a1 + 8), v27);
    double v15 = *(double *)(a1 + 24);
    double v16 = *(double *)(a2 + 24) * v28;
  }
  else
  {
    double v13 = v11 * v27 - v12 * v28;
    float64x2_t v14 = vmlaq_n_f64(vmulq_n_f64(vnegq_f64(*(float64x2_t *)(a2 + 8)), v28), *(float64x2_t *)(a1 + 8), v27);
    double v15 = *(double *)(a1 + 24);
    double v16 = -(*(double *)(a2 + 24) * v28);
  }
  *(double *)float v31 = v13;
  *(float64x2_t *)&v31[8] = v14;
  *(double *)&v31[24] = v16 + v15 * v27;
  double v17 = FigMotionQuaternionDotProduct((double *)v31, (double *)v31);
  if (!a3 && v17 >= 0.5)
  {
    char v18 = 0;
    if (!a4) {
      return *(double *)v31;
    }
    goto LABEL_12;
  }
  if (v17 >= 0.04)
  {
    double v25 = 1.0 / sqrt(v17);
    *(float64x2_t *)float v31 = vmulq_n_f64(*(float64x2_t *)v31, v25);
    *(float64x2_t *)&v31[16] = vmulq_n_f64(*(float64x2_t *)&v31[16], v25);
  }
  else
  {
    long long v19 = *(_OWORD *)(a1 + 16);
    v30[0] = *(_OWORD *)a1;
    v30[1] = v19;
    long long v20 = *(_OWORD *)(a2 + 16);
    v29[0] = *(_OWORD *)a2;
    v29[1] = v20;
    FigMotionNormalizeQuaternion((double *)v30);
    FigMotionNormalizeQuaternion((double *)v29);
    FigMotionInterpolateQuaternionsByAngle((uint64_t)v30, (double *)v29, a5);
    *(void *)float v31 = v21;
    *(void *)&v31[8] = v22;
    *(void *)&v31[16] = v23;
    *(void *)&v31[24] = v24;
  }
  char v18 = 1;
  if (a4) {
LABEL_12:
  }
    *a4 = v18;
  return *(double *)v31;
}

double GVSInterpolateQuatfNLERP(float32x4_t a1, float32x4_t a2, float a3)
{
  float32x4_t v3 = vmulq_f32(a1, a2);
  float32x4_t v4 = (float32x4_t)vextq_s8((int8x16_t)v3, (int8x16_t)v3, 8uLL);
  *(float32x2_t *)v3.f32 = vadd_f32(*(float32x2_t *)v3.f32, *(float32x2_t *)v4.f32);
  v3.f32[0] = vaddv_f32(*(float32x2_t *)v3.f32);
  v4.i64[0] = 0;
  float32x4_t v5 = vmlaq_n_f32(a1, vsubq_f32((float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_f32(v4, v3), 0), (int8x16_t)vnegq_f32(a2), (int8x16_t)a2), a1), a3);
  int8x16_t v6 = (int8x16_t)vmulq_f32(v5, v5);
  float32x2_t v7 = vadd_f32(*(float32x2_t *)v6.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL));
  if (vaddv_f32(v7) == 0.0) {
    return *(double *)&_PromotedConst;
  }
  unsigned __int32 v9 = vadd_f32(v7, (float32x2_t)vdup_lane_s32((int32x2_t)v7, 1)).u32[0];
  float32x2_t v10 = vrsqrte_f32((float32x2_t)v9);
  float32x2_t v11 = vmul_f32(v10, vrsqrts_f32((float32x2_t)v9, vmul_f32(v10, v10)));
  *(void *)&double result = vmulq_n_f32(v5, vmul_f32(v11, vrsqrts_f32((float32x2_t)v9, vmul_f32(v11, v11))).f32[0]).u64[0];
  return result;
}

double GVSGetDefaultExtrinsicToIMU(int a1)
{
  double result = 0.707106781;
  if (!a1) {
    return 0.0;
  }
  return result;
}

uint64_t GVSQuaternionFromRotationMatrix(uint64_t a1, double *a2, float64x2_t a3, __n128 a4, double a5, double a6, float64x2_t a7, double a8, float64x2_t a9)
{
  if (a1 && a2)
  {
    uint64_t v9 = 0;
    int64x2_t v10 = *(int64x2_t *)a1;
    a3.f64[0] = *(float64_t *)(a1 + 16);
    float64x2_t v11 = *(float64x2_t *)(a1 + 24);
    a7.f64[0] = *(float64_t *)(a1 + 40);
    a4.n128_u64[0] = *(void *)(a1 + 48);
    uint64_t v12 = *(uint64_t *)(a1 + 56);
    a9.f64[0] = *(float64_t *)(a1 + 64);
    int64x2_t v13 = vzip2q_s64(*(int64x2_t *)a1, (int64x2_t)v11);
    *(float64_t *)&long long v14 = a3.f64[0];
    *((void *)&v14 + 1) = *(void *)&a7.f64[0];
    v53[0] = vzip1q_s64(*(int64x2_t *)a1, (int64x2_t)v11);
    v53[1] = a4;
    v53[2] = v13;
    v53[3] = vdupq_lane_s64(v12, 0);
    v53[4] = v14;
    v53[5] = a9;
    float64x2_t v54 = 0u;
    float64x2_t v55 = 0u;
    float64x2_t v56 = 0u;
    float64x2_t v57 = 0u;
    float64x2_t v58 = 0u;
    float64x2_t v59 = 0u;
    *(void *)&v15.f64[0] = v10.i64[0];
    *(void *)&v15.f64[1] = vextq_s8((int8x16_t)v10, (int8x16_t)v10, 8uLL).u64[0];
    v16.f64[0] = v11.f64[0];
    *(void *)&v16.f64[1] = vextq_s8((int8x16_t)v11, (int8x16_t)v11, 8uLL).u64[0];
    *(void *)&v17.f64[0] = a4.n128_u64[0];
    *(void *)&v17.f64[1] = v12;
    do
    {
      float64x2_t v19 = (float64x2_t)v53[v9];
      float64x2_t v18 = (float64x2_t)v53[v9 + 1];
      long long v20 = (float64x2_t *)((char *)&v54 + v9 * 16);
      *long long v20 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v15, v19.f64[0]), v16, v19, 1), v17, v18.f64[0]);
      v20[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(a3, v19), a7, v19, 1), v18, a9);
      v9 += 2;
    }
    while (v9 != 6);
    float64x2_t v21 = *(float64x2_t *)&matrix_identity_double3x3.columns[0].f64[2];
    float64x2_t v22 = vabdq_f64(v55, v21);
    v21.f64[0] = 0.000001;
    float64x2_t v23 = (float64x2_t)vdupq_n_s64(0x3EB0C6F7A0B5ED8DuLL);
    int64x2_t v24 = (int64x2_t)vandq_s8(vandq_s8((int8x16_t)vcgeq_f64(v23, vabdq_f64(v56, *(float64x2_t *)matrix_identity_double3x3.columns[1].f64)), (int8x16_t)vcgeq_f64(v23, vabdq_f64(v54, *(float64x2_t *)matrix_identity_double3x3.columns[0].f64))), (int8x16_t)vcgeq_f64(v23, vabdq_f64(v58, *(float64x2_t *)matrix_identity_double3x3.columns[2].f64)));
    if ((vandq_s8((int8x16_t)vdupq_laneq_s64(v24, 1), vandq_s8(vandq_s8(vandq_s8((int8x16_t)vcgeq_f64(v21, vabdq_f64(v57, *(float64x2_t *)&matrix_identity_double3x3.columns[1].f64[2])), (int8x16_t)vcgeq_f64(v21, v22)), (int8x16_t)vcgeq_f64(v21, vabdq_f64(v59, *(float64x2_t *)&matrix_identity_double3x3.columns[2].f64[2]))), (int8x16_t)v24)).u64[0] & 0x8000000000000000) != 0)
    {
      double v25 = *(double *)v10.i64 + v11.f64[1] + a9.f64[0];
      if (v25 >= 0.0)
      {
        double v33 = sqrt(v25 + 1.0);
        double v34 = v33 + v33;
        double v35 = 1.0 / (v33 + v33);
        double v29 = (a7.f64[0] - *(double *)&v12) * v35;
        double v30 = (a4.n128_f64[0] - a3.f64[0]) * v35;
        double v31 = v35 * vsubq_f64((float64x2_t)vdupq_laneq_s64(v10, 1), v11).f64[0];
        double v32 = v34 * 0.25;
      }
      else if (*(double *)v10.i64 < v11.f64[1] || *(double *)v10.i64 < a9.f64[0])
      {
        double v36 = 1.0 - *(double *)v10.i64;
        BOOL v37 = v11.f64[1] < a9.f64[0];
        double v38 = sqrt(1.0 - *(double *)v10.i64 - v11.f64[1] + a9.f64[0]);
        double v39 = v38 + v38;
        double v40 = 1.0 / v39;
        double v41 = (a3.f64[0] + a4.n128_f64[0]) * (1.0 / v39);
        float64_t v42 = a7.f64[0] + *(double *)&v12;
        double v43 = v42 * (1.0 / v39);
        float64x2_t v44 = (float64x2_t)vdupq_laneq_s64(v10, 1);
        double v45 = v39 * 0.25;
        double v46 = v40 * vsubq_f64(v44, v11).f64[0];
        double v47 = sqrt(v11.f64[1] + v36 - a9.f64[0]);
        double v48 = v47 + v47;
        double v49 = 1.0 / v48 * vaddq_f64(v44, v11).f64[0];
        double v50 = v48 * 0.25;
        double v51 = v42 * (1.0 / v48);
        double v32 = (a4.n128_f64[0] - a3.f64[0]) * (1.0 / v48);
        if (v37) {
          double v29 = v41;
        }
        else {
          double v29 = v49;
        }
        if (v37) {
          double v30 = v43;
        }
        else {
          double v30 = v50;
        }
        if (v37) {
          double v31 = v45;
        }
        else {
          double v31 = v51;
        }
        if (v37) {
          double v32 = v46;
        }
      }
      else
      {
        double v26 = sqrt(*(double *)v10.i64 + 1.0 - v11.f64[1] - a9.f64[0]);
        double v27 = v26 + v26;
        double v28 = 1.0 / v27;
        double v29 = v27 * 0.25;
        double v30 = v28 * vaddq_f64((float64x2_t)vdupq_laneq_s64(v10, 1), v11).f64[0];
        double v31 = (a3.f64[0] + a4.n128_f64[0]) * v28;
        double v32 = (a7.f64[0] - *(double *)&v12) * v28;
      }
      a2[2] = v30;
      a2[3] = v31;
      *a2 = v32;
      a2[1] = v29;
      return 0;
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

void GVSComputeRollPitchFromGravity(float *a1)
{
  if (a1)
  {
    float v1 = *a1;
    float v2 = a1[1];
    float v3 = a1[2];
    float v4 = sqrtf((float)((float)(v2 * v2) + (float)(v1 * v1)) + (float)(v3 * v3));
    if (v4 > 0.99 && asinf(fabsf(v3 / v4)) < 1.5533) {
      atan2f(v1, v2);
    }
  }
}

uint64_t GVSExtractMetadataFromTopToBottomRows(const __CFDictionary *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, int32x2_t *a6, uint64_t a7, void *a8, uint64_t a9, float32x2_t *a10, float32x2_t *a11, uint64_t a12, int a13)
{
  id v19 = a3;
  float64_t v164 = v19;
  if (!a6 || !a2 || !a1 || !a7)
  {
    fig_log_get_emitter();
    goto LABEL_196;
  }
  id v169 = v19;
  int valuePtr = 0;
  uint64_t v187 = 0;
  int v186 = 0;
  uint64_t v185 = 0;
  *(_OWORD *)a7 = 0u;
  *(_OWORD *)(a7 + 16) = 0u;
  *(_OWORD *)(a7 + 32) = 0u;
  *(_OWORD *)(a7 + 48) = 0u;
  *(_OWORD *)(a7 + 64) = 0u;
  *(_OWORD *)(a7 + 80) = 0u;
  *(_OWORD *)(a7 + 96) = 0u;
  *(_OWORD *)(a7 + 112) = 0u;
  *(_OWORD *)(a7 + 128) = 0u;
  *(void *)(a7 + 88) = 0;
  *(void *)(a7 + 96) = 0;
  CGSize size = CGRectZero.size;
  CGPoint origin = CGRectZero.origin;
  *(CGPoint *)buffer = CGRectZero.origin;
  CGSize v190 = size;
  if (FigCFDictionaryGetCGRectIfPresent())
  {
    int v20 = llround(*(double *)&buffer[8]);
    *(_DWORD *)(a7 + 88) = llround(*(double *)buffer);
    *(_DWORD *)(a7 + 92) = v20;
    int v21 = llround(v190.height);
    *(_DWORD *)(a7 + 96) = llround(v190.width);
    *(_DWORD *)(a7 + 100) = v21;
  }
  *(CGPoint *)(a7 + 104) = origin;
  *(CGSize *)(a7 + 120) = size;
  FigCFDictionaryGetCGRectIfPresent();
  *(_DWORD *)(a7 + 20) = 1065353216;
  FigCFDictionaryGetFloatIfPresent();
  __double2 v163 = (_DWORD *)(a7 + 20);
  *(unsigned char *)(a7 + 12) = CFDictionaryContainsKey(a1, kFigCaptureStreamMetadata_SphereMode);
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, kFigCaptureStreamMetadata_CurrentFocusPosition);
  float64_t v165 = a6;
  uint64_t v166 = a7;
  uint64_t v167 = a5;
  long long v178 = (int *)a2;
  double v161 = (void *)(a7 + 104);
  float v162 = (char *)(a2 + 10258);
  if (!Value)
  {
    fig_log_get_emitter();
    goto LABEL_193;
  }
  CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
  *(_DWORD *)a7 = valuePtr;
  FigCFDictionaryGetFloatIfPresent();
  CFNumberRef v23 = (const __CFNumber *)CFDictionaryGetValue(a1, kFigCaptureStreamMetadata_ExposureTime);
  if (!v23)
  {
    fig_log_get_emitter();
    goto LABEL_193;
  }
  CFNumberGetValue(v23, kCFNumberFloat64Type, &v187);
  *(void *)(a7 + 48) = v187;
  CFNumberRef v24 = (const __CFNumber *)CFDictionaryGetValue(a1, kFigCaptureStreamMetadata_FrameRollingShutterSkew);
  if (!v24)
  {
    CFNumberRef v24 = (const __CFNumber *)CFDictionaryGetValue(a1, kFigCaptureStreamMetadata_RollingShutterSkew);
    if (!v24)
    {
      fig_log_get_emitter();
LABEL_193:
      FigDebugAssert3();
      uint64_t v151 = FigSignalErrorAt();

      if (!v151) {
        goto LABEL_71;
      }
LABEL_189:
      fig_log_get_emitter();
      goto LABEL_190;
    }
  }
  CFNumberGetValue(v24, kCFNumberSInt32Type, &v186);
  *(double *)(a7 + 56) = (double)v186 / 1000000.0;
  CFNumberRef v25 = (const __CFNumber *)CFDictionaryGetValue(a1, kFigMotionAttachmentsSampleBufferProcessorMetadata_FramePTSSeconds);
  if (!v25)
  {
    fig_log_get_emitter();
    goto LABEL_193;
  }
  CFNumberGetValue(v25, kCFNumberDoubleType, &v185);
  *(void *)(a7 + 32) = v185;
  double v26 = (const void **)&kFigMotionAttachmentsSampleBufferProcessorMetadata_MotionData;
  if (*(unsigned char *)(a2 + 10260)) {
    double v26 = (const void **)&kFigMotionAttachmentsSampleBufferProcessorMetadata_MotionAttachmentsISPMotionData;
  }
  CFDictionaryRef v27 = (const __CFDictionary *)CFDictionaryGetValue(a1, *v26);
  if (!v27)
  {
    fig_log_get_emitter();
    goto LABEL_193;
  }
  CFDictionaryRef v28 = v27;
  CFArrayRef v29 = (const __CFArray *)CFDictionaryGetValue(v27, kFigMotionAttachmentsSampleBufferProcessorMetadata_FusedMotion);
  CFDictionaryRef v171 = a1;
  if (v29)
  {
    CFArrayRef v30 = v29;
    int v31 = CFDictionaryContainsKey(v28, kFigMotionAttachmentsSampleBufferProcessorMetadata_GroupDelayCompensationApplied);
    id v32 = v169;
    int Count = CFArrayGetCount(v30);
    if (v31) {
      double v34 = *(double *)(a2 + 10248);
    }
    else {
      double v34 = *(double *)(a2 + 10248) + -0.005;
    }
    if (Count >= 1)
    {
      CFIndex v35 = 0;
      uint64_t v36 = Count;
      while (1)
      {
        CFArrayRef ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(v30, v35);
        if (!ValueAtIndex) {
          goto LABEL_31;
        }
        CFArrayRef v38 = ValueAtIndex;
        int v39 = CFArrayGetCount(ValueAtIndex);
        if (v39 < 1) {
          goto LABEL_31;
        }
        uint64_t v40 = *v178;
        double v41 = (double *)&v178[2 * v40 + 2];
        if (!FigCFArrayGetDoubleAtIndex()) {
          goto LABEL_31;
        }
        *double v41 = v34 + *v41;
        CFDataRef v42 = (const __CFData *)CFArrayGetValueAtIndex(v38, 2);
        if (!v42) {
          goto LABEL_31;
        }
        CFDataRef v43 = v42;
        v192.length = CFDataGetLength(v42);
        float64x2_t v44 = (UInt8 *)&v178[8 * v40 + 514];
        v192.location = 0;
        CFDataGetBytes(v43, v192, v44);
        if (!v32) {
          goto LABEL_30;
        }
        unsigned int v45 = [v32 extractGravityData];
        if (v39 < 4 || !v45) {
          goto LABEL_30;
        }
        CFDataRef v46 = (const __CFData *)CFArrayGetValueAtIndex(v38, 3);
        if (v46) {
          break;
        }
LABEL_31:
        if (v36 == ++v35) {
          goto LABEL_32;
        }
      }
      CFDataRef v47 = v46;
      *(_DWORD *)&buffer[8] = 0;
      *(void *)buffer = 0;
      v193.length = CFDataGetLength(v46);
      v193.location = 0;
      CFDataGetBytes(v47, v193, buffer);
      [v32 pushSample:buffer withPose:v44 atTime:*v41];
LABEL_30:
      *long long v178 = (*v178 + 1);
      goto LABEL_31;
    }
LABEL_32:

    a6 = v165;
    a7 = v166;
    a1 = v171;
    a2 = (uint64_t)v178;
  }
  if (a4)
  {
    CFArrayRef v48 = (const __CFArray *)CFDictionaryGetValue(a1, kFigMotionAttachmentsSampleBufferProcessorMetadata_MotionAttachmentsISPHallData);
    if (v48)
    {
      CFArrayRef v49 = v48;
      double v50 = (unsigned char *)(a4 + 16418);
      float v173 = *(float *)(a4 + 16420);
      int v51 = CFArrayGetCount(v48);
      if (v51 > 2)
      {
        fig_log_get_emitter();
LABEL_179:
        FigDebugAssert3();
        uint64_t v151 = FigSignalErrorAt();
        if (v151)
        {
          fig_log_get_emitter();
LABEL_188:
          FigDebugAssert3();

          goto LABEL_189;
        }
      }
      else if (v51 >= 1)
      {
        CFIndex v52 = 0;
        uint64_t v175 = v51;
        float64x2_t v172 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(1.0 - v173), 0);
        uint64_t v53 = a4 + 16416;
        CFArrayRef v168 = v49;
        do
        {
          CFArrayRef v54 = (const __CFArray *)CFArrayGetValueAtIndex(v49, v52);
          if (v54)
          {
            CFArrayRef v55 = v54;
            v191[0] = 0;
            CFNumberRef v56 = (const __CFNumber *)CFArrayGetValueAtIndex(v54, 0);
            if (v56) {
              CFNumberGetValue(v56, kCFNumberIntType, v191);
            }
            uint64_t v57 = v191[0];
            if ((int)v191[0] > 1)
            {
              fig_log_get_emitter();
              goto LABEL_179;
            }
            CFArrayRef v58 = (const __CFArray *)CFArrayGetValueAtIndex(v55, 1);
            if (v58)
            {
              CFArrayRef v59 = v58;
              int v60 = CFArrayGetCount(v58);
              if (v60 >= 1)
              {
                CFIndex v61 = 0;
                uint64_t v62 = a4 + (v57 << 12) + 8;
                uint64_t v63 = v60;
                do
                {
                  *(void *)buffer = 0;
                  *(void *)float v180 = 0;
                  CFArrayRef v64 = (const __CFArray *)CFArrayGetValueAtIndex(v59, v61);
                  CFNumberRef v65 = (const __CFNumber *)CFArrayGetValueAtIndex(v64, 0);
                  CFDataRef v66 = (const __CFData *)CFArrayGetValueAtIndex(v64, 1);
                  if (v65)
                  {
                    CFDataRef v67 = v66;
                    if (v66)
                    {
                      if (CFDataGetLength(v66) == 8)
                      {
                        CFNumberGetValue(v65, kCFNumberDoubleType, buffer);
                        v194.location = 0;
                        v194.length = 8;
                        CFDataGetBytes(v67, v194, v180);
                        uint64_t v68 = v191[0];
                        uint64_t v69 = *(int *)(a4 + 4 * v191[0]);
                        *(_DWORD *)(a4 + 4 * v191[0]) = ((_WORD)v69 + 1) & 0x1FF;
                        *(double *)(v62 + 8 * v69) = *(double *)buffer + *(double *)(a4 + 16408);
                        if (*(unsigned char *)(v53 + v68))
                        {
                          if (!*v50) {
                            *(void *)(a4 + 8 * v68 + 16424) = *(void *)v180;
                          }
                          *(unsigned char *)(v53 + v68) = 0;
                        }
                        float v70 = (void *)(a4 + (v68 << 12) + 8 * v69 + 8200);
                        if (*v50)
                        {
                          *float v70 = *(void *)v180;
                        }
                        else
                        {
                          float v71 = (float32x2_t *)(a4 + 8 * v68);
                          float32x2_t v72 = *(float32x2_t *)v180;
                          *float v70 = vsub_f32(*(float32x2_t *)v180, v71[2053]);
                          v71[2053] = vcvt_f32_f64(vmlaq_f64(vcvtq_f64_f32(vmul_n_f32(v71[2053], v173)), v172, vcvtq_f64_f32(v72)));
                        }
                      }
                    }
                  }
                  ++v61;
                }
                while (v63 != v61);
              }
              a1 = v171;
              a2 = (uint64_t)v178;
              CFArrayRef v49 = v168;
            }
          }
          ++v52;
        }
        while (v52 != v175);
      }
    }
    CFNumberRef v73 = (const __CFNumber *)CFDictionaryGetValue(a1, kFigMotionAttachmentsSampleBufferProcessorMetadata_SphereScalingFactor);
    if (v73)
    {
      a7 = v166;
      CFNumberGetValue(v73, kCFNumberFloatType, (void *)(v166 + 16));
      a6 = v165;
    }
    else
    {
      CFNumberRef v74 = (const __CFNumber *)CFDictionaryGetValue(a1, kFigMotionAttachmentsSampleBufferProcessorMetadata_ScalingFactor);
      a6 = v165;
      a7 = v166;
      if (v74)
      {
        *(_DWORD *)buffer = 0;
        CFNumberGetValue(v74, kCFNumberFloatType, buffer);
        *(float *)(v166 + 16) = *(float *)buffer / 1.5;
      }
      else
      {
        *(_DWORD *)(v166 + 16) = 1065353216;
      }
    }
  }
  float32x4_t v75 = CFDictionaryGetValue(a1, kFigCaptureStreamMetadata_PortType);
  if (v75)
  {
    uint64_t v76 = portIndexFromPortType(v75, (int *)(a7 + 136));
    if (v76)
    {
      uint64_t v151 = v76;
      fig_log_get_emitter();
      goto LABEL_188;
    }
  }
  float32x2_t v77 = (int *)(a7 + 140);
  if (FigCFDictionaryGetInt32IfPresent()) {
    int v78 = *v77;
  }
  else {
    int v78 = 1;
  }
  if (v78 <= 1) {
    int v78 = 1;
  }
  *float32x2_t v77 = v78;

LABEL_71:
  uint64_t v183 = 0;
  uint64_t v184 = 0;
  if (*(_OWORD *)(a7 + 88) == 0)
  {
    int v79 = a6->i32[0];
    int v80 = a6->i32[1];
    *(_DWORD *)(a7 + 96) = a6->i32[0];
    *(_DWORD *)(a7 + 100) = v80;
  }
  else
  {
    int v79 = *(_DWORD *)(a7 + 96);
    int v80 = *(_DWORD *)(a7 + 100);
  }
  float32x4_t v81 = (float64x2_t *)v167;
  double v82 = (double)*(int *)(a7 + 88);
  double v83 = (double)*(int *)(a7 + 92);
  double v84 = (double)v79;
  double v85 = (double)v80;
  if (CGRectIsEmpty(*(CGRect *)(a7 + 104))
    || (v197.origin.double x = v82,
        v197.origin.y = v83,
        v197.size.width = v84,
        v197.size.height = v85,
        CGRect v195 = CGRectIntersection(*(CGRect *)(a7 + 104), v197),
        *(CGRect *)(a7 + 104) = v195,
        CGRectIsNull(v195)))
  {
    *(double *)(a7 + 104) = v82;
    *(double *)(a7 + 112) = v83;
    *(double *)(a7 + 120) = v84;
    *(double *)(a7 + 128) = v85;
  }
  else
  {
    double v82 = *(double *)(a7 + 104);
    double v83 = *(double *)(a7 + 112);
    double v84 = *(double *)(a7 + 120);
    double v85 = *(double *)(a7 + 128);
  }
  v196.origin.double x = v82;
  v196.origin.y = v83;
  v196.size.width = v84;
  v196.size.height = v85;
  if (CGRectIsEmpty(v196))
  {
    v87.i64[0] = a6->i32[0];
    v87.i64[1] = (int)HIDWORD(*(unint64_t *)a6);
    float64x2_t v86 = vcvtq_f64_s64(v87);
    void *v161 = 0;
    v161[1] = 0;
    *(float64x2_t *)(a7 + 120) = v86;
  }
  if (a6[9].i8[4])
  {
    CFDictionaryRef v88 = (const __CFDictionary *)CFDictionaryGetValue(a1, kFigVideoStabilizationSampleBufferProcessorMetadata_InputFrameCropOffset);
    if (v88)
    {
      memset(buffer, 0, sizeof(buffer));
      CGPointMakeWithDictionaryRepresentation(v88, (CGPoint *)buffer);
      v89.i64[0] = a6->i32[0];
      v89.i64[1] = (int)HIDWORD(*(unint64_t *)a6);
      *(float32x2_t *)&v86.f64[0] = vcvt_f32_f64(vmulq_f64(*(float64x2_t *)buffer, vcvtq_f64_s64(v89)));
      *(float64_t *)(a7 + 24) = v86.f64[0];
    }
  }
  LODWORD(v86.f64[0]) = *v163;
  if (a6[9].i8[0])
  {
    float32x2_t v90 = vcvt_f32_s32(a6[4]);
    float32x2_t v91 = vcvt_f32_f64(*(float64x2_t *)(a7 + 120));
    __asm { FMOV            V3.2S, #-1.0 }
    float32x2_t v97 = vadd_f32(v90, _D3);
    float32x2_t v98 = vadd_f32(v91, _D3);
    float32x2_t v99 = vdiv_f32(v97, vadd_f32(v98, (float32x2_t)vdup_n_s32(0xBF804189)));
    if (v99.f32[0] <= v99.f32[1]) {
      v99.f32[0] = v99.f32[1];
    }
    if (*(float *)v86.f64 < v99.f32[0])
    {
      *__double2 v163 = v99.i32[0];
      LODWORD(v86.f64[0]) = v99.i32[0];
    }
    float32x2_t v100 = vsub_f32(vmla_f32(vcvt_f32_f64(*(float64x2_t *)(a7 + 104)), (float32x2_t)0x3F0000003F000000, v98), vmla_f32(vcvt_f32_s32(a6[3]), (float32x2_t)0x3F0000003F000000, v97));
    float32x2_t v101 = vmul_f32(vsub_f32(v91, vdiv_f32(v90, (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v86.f64[0], 0))), (float32x2_t)0x3F0000003F000000);
    __asm { FMOV            V2.2S, #0.75 }
    float32x2_t v103 = vmaxnm_f32(vmla_f32((float32x2_t)0xBF000000BF000000, _D2, v101), 0);
    float32x2_t v104 = vminnm_f32(vmaxnm_f32(*(float32x2_t *)(a7 + 24), vsub_f32(v100, v103)), vadd_f32(v103, v100));
    *(float32x2_t *)(a7 + 24) = v104;
    float v105 = v104.f32[1];
  }
  else
  {
    float v105 = *(float *)(a7 + 28);
  }
  int v106 = a6[2].i32[1];
  float v107 = (float)v106;
  if (*(float *)v86.f64 <= 0.0) {
    *(float *)v86.f64 = 1.0;
  }
  float v108 = v107 / *(float *)v86.f64;
  double v109 = *(double *)(a7 + 48);
  double v110 = *(double *)(a7 + 56) / (double)*(int *)(a7 + 100);
  double v111 = *(double *)(a7 + 32)
       + v110
       * (float)((float)(v105 + (float)((float)((float)(v107 * 0.5) + (float)a6[1].i32[1]) - (float)(v108 * 0.5)))
               - (float)*(int *)(a7 + 92));
  *(double *)(a7 + 40) = v111;
  double v112 = v110 * v108;
  double v113 = v111 - v109 * 0.5;
  double v114 = v113 + v112 * (((double)v106 + -1.0) / (double)v106 * 0.5);
  *(double *)(a7 + 64) = v112;
  *(double *)(a7 + 72) = v114;
  long long v115 = *(_OWORD *)(v167 + 40);
  long long v181 = *(_OWORD *)(v167 + 24);
  long long v182 = v115;
  if (*(unsigned char *)(v167 + 56))
  {
    float32x4_t v116 = CFDictionaryGetValue(a1, kFigCaptureStreamMetadata_PortType);
    float v117 = [*(id *)(v167 + 64) objectForKeyedSubscript:v116];
    float v118 = v117;
    float32x2_t v119 = 0;
    if (v117 && [v117 length] == stru_20.segname)
    {
      float32x4_t v120 = (char *)[v118 bytes];
      *(void *)&long long v181 = FigMotionMultiplyQuaternions((double *)&v181, (double *)v120);
      *((void *)&v181 + 1) = v121;
      *(void *)&long long v182 = v122;
      *((void *)&v182 + 1) = v123;
      LODWORD(v187) = 1065353216;
      FigCFDictionaryGetFloatIfPresent();
      uint64_t v124 = *(unsigned int *)(a7 + 140);
      uint64_t v125 = (uint64_t)*a6;
      CGPoint v176 = CGPointZero;
      *(CGPoint *)buffer = CGPointZero;
      if (FigMotionComputeRawSensorCenterInBuffer((uint64_t)a1, v125, v124, v124, (uint64_t)buffer))
      {
        float v126 = *(float *)(a7 + 16);
        float32x2_t v119 = vmul_n_f32(*(float32x2_t *)(v120 + 32), v126);
        uint64_t v127 = v167;
      }
      else
      {
        float v126 = *(float *)(a7 + 16);
        uint64_t v127 = v167;
        float32x2_t v119 = vsub_f32(vmla_n_f32(vcvt_f32_f64(*(float64x2_t *)buffer), *(float32x2_t *)(v120 + 32), v126), vcvt_f32_f64(*(float64x2_t *)v167));
      }
      if (!*(unsigned char *)(v127 + 57))
      {
        unint64_t v128 = (unint64_t)*a6;
        *(CGPoint *)float v180 = v176;
        if (!FigMotionComputeOpticalCenterInBuffer(a1, v128, v124, v124, 0, (float64x2_t *)v180, v126 / *(float *)&v187))float32x2_t v119 = vcvt_f32_f64(vsubq_f64(*(float64x2_t *)v180, *(float64x2_t *)v167)); {
      }
        }
      a2 = (uint64_t)v178;
    }

    float32x4_t v81 = (float64x2_t *)v167;
  }
  else
  {
    float32x2_t v119 = 0;
  }
  if (a10) {
    *a10 = v119;
  }
  double v129 = v112 + v113;
  GVSComputeMotionBlur(a2, a4, a7, (double *)&v181, (void *)(a7 + 80));
  if (a8)
  {
    if (a13 == 1)
    {
      FigMotionComputeQuaternionForTimeStamp(a2, a8, v162, v114);
      if (*v162)
      {
        unsigned int v130 = 1;
        goto LABEL_115;
      }
      fig_log_get_emitter();
LABEL_196:
      FigDebugAssert3();
      uint64_t v151 = FigSignalErrorAt();
      goto LABEL_177;
    }
    buffer[0] = 0;
    char *v162 = 1;
    if (a13 >= 1)
    {
      uint64_t v131 = 0;
      float32x2_t v132 = a8;
      do
      {
        FigMotionComputeQuaternionForTimeStamp(a2, v132, (char *)buffer, v113 + (double)(int)v131 * ((v129 - v113) / ((double)a13 + -1.0)));
        *v162 &= buffer[0];
        ++v131;
        v132 += 4;
      }
      while (a13 != v131);
    }
    FigMotionComputeQuaternionForTimeStamp(a2, &a8[4 * a13], (char *)buffer, v114);
    *v162 &= buffer[0];
    if ((a13 & 0x80000000) == 0)
    {
      unsigned int v130 = a13 + 1;
LABEL_115:
      uint64_t v133 = v130;
      float32x4_t v134 = (double *)a8;
      do
      {
        double *v134 = FigMotionMultiplyQuaternions(v134, (double *)&v181);
        *((void *)v134 + 1) = v135;
        *((void *)v134 + 2) = v136;
        *((void *)v134 + 3) = v137;
        v134 += 4;
        --v133;
      }
      while (v133);
    }
  }
  float32x4_t v138 = a11;
  if (a9)
  {
    if (v169 && (unsigned int v139 = [v169 extractGravityData], a8) && v139)
    {
      [v169 computeGravity:a9 forTimestamp:v114];
    }
    else
    {
      *(void *)a9 = 0;
      *(_DWORD *)(a9 + 8) = 0;
    }
  }
  float32x2_t v179 = 0;
  if (a12)
  {
    int v140 = *(_DWORD *)a12;
    uint64_t v141 = *(unsigned int *)(a7 + 136);
    FigMotionStashQuadraBinningFactor((uint64_t)a1, a12);
    FigMotionUpdateBaseZoomFactorAdjustment((uint64_t)a1, a12);
    if ((v140 & 2) != 0 && v141 != *(_DWORD *)(a12 + 440))
    {
      *(_DWORD *)float v180 = 0;
      LODWORD(v187) = 0;
      if (!FigCFDictionaryGetFloat32IfPresent() || !FigCFDictionaryGetFloat32IfPresent())
      {
        FigGetUpTime();
        uint64_t v158 = FigHostTimeToNanoseconds();
        if (low_freq_error_logging_last_log && (unint64_t)(v158 - low_freq_error_logging_last_log) < 0x3B9ACA00)
        {
          ++low_freq_error_logging_filtered;
          if ((v140 & 4) == 0) {
            goto LABEL_145;
          }
        }
        else
        {
          if (low_freq_error_logging_filtered) {
            low_freq_error_logging_filtered = 0;
          }
          low_freq_error_logging_last_log = v158;
          if ((v140 & 4) == 0)
          {
LABEL_145:
            uint64_t v151 = 0;
            *(_DWORD *)(a12 + 444) = v141;
            if (a4)
            {
              a7 = v166;
              if (a11)
              {
                float32x2_t v152 = vadd_f32(v119, v179);
                double v153 = v165;
                if (!*(unsigned char *)(v166 + 12)) {
                  goto LABEL_168;
                }
LABEL_153:
                if (a13 != 1)
                {
                  if (v153[6].i32[1] >= 1)
                  {
                    uint64_t v154 = 0;
                    int v155 = 0;
                    double v156 = v107;
                    do
                    {
                      if (v155 >= v106 - 1) {
                        int v157 = v106 - 1;
                      }
                      else {
                        int v157 = v155;
                      }
                      FigMotionComputeLensMovementForTimeStamp(a4, v138, *(_DWORD *)(a7 + 136), v113 + (v129 - v113) * (double)v157 / v156, *(float *)(a7 + 16));
                      float32x2_t *v138 = vadd_f32(v152, *v138);
                      ++v138;
                      ++v154;
                      int v155 = v153[7].i32[1] + v157;
                    }
                    while (v154 < v153[6].i32[1]);
                  }
                  goto LABEL_176;
                }
                uint64_t v151 = FigMotionComputeLensMovementForTimeStamp(a4, a11, *(_DWORD *)(a7 + 136), v114, *(float *)(a7 + 16));
                if (!v151)
                {
                  *a11 = vadd_f32(v152, *a11);
                  goto LABEL_177;
                }
                fig_log_get_emitter();
LABEL_190:
                FigDebugAssert3();
                goto LABEL_177;
              }
            }
            goto LABEL_177;
          }
        }
LABEL_130:
        unsigned int v144 = *(_DWORD *)(a12 + 440);
        if (v141 != v144)
        {
          int v145 = *(_DWORD *)(a12 + 444);
          if (v141 != v145)
          {
            BOOL v146 = 0;
            int v147 = BravoCurrentToReferenceMapping[3 * v144 + v141];
            if (v144 == 2 && v145 != 2)
            {
              *(_DWORD *)buffer = 4;
              FigCFDictionaryGetInt32IfPresent();
              BOOL v146 = *(_DWORD *)buffer != 4;
            }
            int v148 = v141 == 2 || v146;
            FigMotionComputeParallaxShift(*(float *)(a12 + 48 * v147 + 116), *(float *)(a12 + 48 * v147 + 132), *(float *)(v166 + 16), (uint64_t)a1, a12, v141, v148, a12 + 448);
            *(_DWORD *)(a12 + 524) = *(_DWORD *)(v166 + 16);
          }
          if (!*(unsigned char *)(a12 + 516))
          {
            LODWORD(v142) = *(_DWORD *)(a12 + 452);
            float v149 = FigMotionAdjustParallaxShiftForScalingFactor(*(float *)(a12 + 448), v142, *(float *)(a12 + 524), *(float *)(v166 + 16));
            v179.f32[0] = v179.f32[0] + v149;
            v179.f32[1] = v150 + v179.f32[1];
          }
        }
        if (v141 != *(_DWORD *)(a12 + 444))
        {
          FigMotionClearFocalLengthData(a12);
          if (v141 == *(_DWORD *)(a12 + 440)) {
            *(void *)(a12 + 448) = 0;
          }
        }
        FigMotionStashFocalLengthData((uint64_t)a1, a12);
        goto LABEL_145;
      }
      *(float32x2_t *)buffer = vcvt_f32_f64(*v81);
      uint64_t v143 = FigMotionComputeBravoTranslation(*(float *)v180, *(float *)&v187, (uint64_t)a1, a12, v141, (float *)buffer, (float *)&v179);
      if (v143)
      {
        uint64_t v151 = v143;
        fig_log_get_emitter();
        goto LABEL_190;
      }
    }
    if ((v140 & 4) == 0) {
      goto LABEL_145;
    }
    goto LABEL_130;
  }
  uint64_t v151 = 0;
  if (a4 && a11)
  {
    float32x2_t v152 = vadd_f32(v119, 0);
    if (!*(unsigned char *)(a7 + 12))
    {
      double v153 = v165;
      if (!*(unsigned char *)(v167 + 56))
      {
        bzero(a11, 8 * v165[6].i32[1]);
LABEL_176:
        uint64_t v151 = 0;
        goto LABEL_177;
      }
LABEL_168:
      uint64_t v159 = v153[6].u32[1];
      if ((int)v159 >= 1)
      {
        do
        {
          *v138++ = v152;
          --v159;
        }
        while (v159);
      }
      goto LABEL_176;
    }
    double v153 = v165;
    goto LABEL_153;
  }
LABEL_177:

  return v151;
}

uint64_t GVSComputeMotionBlur(uint64_t a1, uint64_t a2, uint64_t a3, double *a4, void *a5)
{
  if (a5 && a1 && a3 && a4)
  {
    *a5 = 0;
    double v10 = *(double *)(a3 + 72);
    double v11 = *(double *)(a3 + 48) * 0.5;
    double v12 = v10 - v11;
    double v13 = v10 + v11;
    char v35 = 1;
    char v34 = 1;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    FigMotionComputeQuaternionForTimeStamp(a1, &v32, &v35, v10 - v11);
    FigMotionComputeQuaternionForTimeStamp(a1, &v30, &v34, v13);
    if (v35 && v34)
    {
      *(void *)&long long v32 = FigMotionMultiplyQuaternions((double *)&v32, a4);
      *((void *)&v32 + 1) = v14;
      *(void *)&long long v33 = v15;
      *((void *)&v33 + 1) = v16;
      *(void *)&long long v30 = FigMotionMultiplyQuaternions((double *)&v30, a4);
      *((void *)&v30 + 1) = v17;
      *(void *)&long long v31 = v18;
      *((void *)&v31 + 1) = v19;
      float32x2_t v29 = 0;
      v28[0] = FigMotionMultiplyByInverseOfQuaternion((double *)&v30, (uint64_t *)&v32);
      v28[1] = v20;
      v28[2] = v21;
      v28[3] = v22;
      uint64_t v23 = GVSComputeTranslationFromCameraMotion(v28, &v29, *(float *)(a3 + 4));
      if (v23)
      {
        uint64_t v24 = v23;
        fig_log_get_emitter();
        FigDebugAssert3();
      }
      else
      {
        if (a2)
        {
          if (*(unsigned char *)(a3 + 12))
          {
            float32x2_t v26 = 0;
            float32x2_t v27 = 0;
            FigMotionComputeLensMovementForTimeStamp(a2, &v27, *(_DWORD *)(a3 + 136), v12, *(float *)(a3 + 16));
            FigMotionComputeLensMovementForTimeStamp(a2, &v26, *(_DWORD *)(a3 + 136), v13, *(float *)(a3 + 16));
            float32x2_t v29 = vsub_f32(v29, vsub_f32(v26, v27));
          }
        }
        uint64_t v24 = 0;
        *a5 = v29;
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return 0xFFFFFFFFLL;
    }
    return v24;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

uint64_t GVSExtractCameraGeometryFromCameraInfoByPortType(void *a1, void *a2)
{
  id v4 = a1;
  uint64_t v5 = +[NSMutableDictionary dictionary];
  int8x16_t v6 = (void *)v5;
  float64x2_t v44 = v4;
  if (v4 && a2)
  {
    BOOL v37 = a2;
    id v43 = (id)v5;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    obuint64_t j = [v4 allKeys];
    id v7 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v41 = kFigCaptureCameraInfoKey_PixelSize;
      uint64_t v42 = *(void *)v50;
      uint64_t v40 = kFigCaptureCameraInfoKey_OpticalCenterOffsetInPhysicalSensorDimensions;
      uint64_t v38 = kFigCaptureCameraInfoKey_OpticalCenterOffset;
      uint64_t v9 = kFigCaptureCameraInfoKey_CameraPoseMatrix;
      do
      {
        double v10 = 0;
        do
        {
          if (*(void *)v50 != v42) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v49 + 1) + 8 * (void)v10);
          double v12 = objc_msgSend(v44, "objectForKeyedSubscript:", v11, v35, v36);
          uint64_t v13 = [v12 objectForKeyedSubscript:v41];
          if (!v13)
          {
            fig_log_get_emitter();
            FigDebugAssert3();

            uint64_t v30 = 4294954516;
LABEL_31:

            int8x16_t v6 = v43;
            goto LABEL_32;
          }
          uint64_t v14 = (void *)v13;
          CFDictionaryRef v15 = [v12 objectForKeyedSubscript:v40];
          if (v15
            || ([v12 objectForKeyedSubscript:v38],
                (CFDictionaryRef v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            point.double x = 0.0;
            point.y = 0.0;
            CGPointMakeWithDictionaryRepresentation(v15, &point);
            uint64_t v16 = [v12 objectForKeyedSubscript:v9];
            uint64_t v17 = v16;
            if (v16 && [v16 length] == &stru_20.segname[8])
            {
              uint64_t v18 = (float *)[v17 bytes];
              float32x2_t v47 = 0;
              long long v45 = 0u;
              long long v46 = 0u;
              float32x2_t v19 = vcvt_f32_f64((float64x2_t)point);
              [v14 floatValue];
              uint64_t v27 = 0;
              float32x2_t v47 = vmul_n_f32(v19, *(float *)v20.f64);
              CFDictionaryRef v28 = v53;
              do
              {
                for (uint64_t i = 0; i != 3; ++i)
                {
                  v20.f64[0] = v18[i];
                  *(float64_t *)&v28[8 * i] = v20.f64[0];
                }
                ++v27;
                v28 += 24;
                v18 += 4;
              }
              while (v27 != 3);
              uint64_t v30 = GVSQuaternionFromRotationMatrix((uint64_t)v53, (double *)&v45, v20, v21, v22, v23, v24, v25, v26);
              if (v30)
              {
                int v32 = 4;
              }
              else
              {
                *((double *)&v46 + 1) = -*((double *)&v46 + 1);
                id v31 = [objc_alloc((Class)NSData) initWithBytes:&v45 length:40];
                [v43 setObject:v31 forKeyedSubscript:v11];

                int v32 = 0;
              }
            }
            else
            {
              fig_log_get_emitter();
              uint64_t v36 = v2;
              LODWORD(v35) = 0;
              FigDebugAssert3();
              int v32 = 4;
              uint64_t v30 = 4294954516;
            }
          }
          else
          {
            fig_log_get_emitter();
            uint64_t v36 = v2;
            LODWORD(v35) = 0;
            FigDebugAssert3();
            int v32 = 4;
            uint64_t v30 = 4294954516;
          }

          if (v32) {
            goto LABEL_31;
          }
          double v10 = (char *)v10 + 1;
        }
        while (v10 != v8);
        id v33 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
        id v8 = v33;
      }
      while (v33);
    }
    else
    {
      uint64_t v30 = 0;
    }

    int8x16_t v6 = v43;
    *BOOL v37 = v43;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v30 = FigSignalErrorAt();
  }
LABEL_32:

  return v30;
}

float32x2_t GVSComputeOverscanUsage(_DWORD *a1, float64x2_t *a2, uint64_t a3)
{
  uint64_t v3 = 0;
  int v4 = a1[6];
  int v5 = a1[7];
  float v6 = (float)v4;
  int v7 = a1[9];
  float v8 = (float)(v4 + a1[8] - 1);
  uint64_t v9 = v30;
  *(float *)&v29[4] = v6;
  v30[0] = (float)v5;
  v30[1] = v8;
  _OWORD v30[2] = (float)v5;
  v30[3] = v6;
  float v31 = (float)(v5 + v7 - 1);
  float v32 = v8;
  float v33 = v31;
  int v10 = a1[13];
  int v11 = (a1[14] - 1) * v10;
  v29[0] = 0;
  v29[1] = v11;
  _OWORD v29[2] = v10 - 1;
  v29[3] = v10 - 1 + v11;
  float32x2_t v12 = vcvt_f32_f64(*a2);
  __asm { FMOV            V2.2S, #-1.0 }
  float32x2_t v18 = vadd_f32(vadd_f32(v12, vcvt_f32_f64(a2[1])), _D2);
  float32x2_t result = (float32x2_t)vdup_n_s32(0x7F7FFFFFu);
  do
  {
    uint64_t v20 = a3 + 36 * (int)v29[v3];
    float v21 = *(v9 - 1);
    float v22 = (float)(*(float *)(v20 + 32) + (float)(*(float *)(v20 + 28) * *v9)) + (float)(*(float *)(v20 + 24) * v21);
    v23.i32[0] = *(_DWORD *)v20;
    v26.i32[0] = *(_DWORD *)(v20 + 4);
    v24.i32[0] = *(_DWORD *)(v20 + 8);
    double v25 = (__int32 *)(v20 + 12);
    v26.i32[1] = *(_DWORD *)(v20 + 16);
    uint64_t v27 = (__int32 *)(v20 + 20);
    if (fabsf(v22) > 0.00000001) {
      float v22 = 1.0 / v22;
    }
    v24.i32[1] = *v27;
    v23.i32[1] = *v25;
    float32x2_t v28 = vmul_n_f32(vmla_n_f32(vmla_n_f32(v24, v26, *v9), v23, v21), v22);
    float32x2_t result = vminnm_f32(result, vminnm_f32(vmaxnm_f32(vsub_f32(v28, v12), 0), vmaxnm_f32(vsub_f32(v18, v28), 0)));
    v9 += 2;
    ++v3;
  }
  while (v3 != 4);
  return result;
}

uint64_t GVSLogTransform(FILE *a1, int a2, uint64_t a3, int a4, int a5)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (a4 >= 1)
  {
    uint64_t v15 = 0;
    uint64_t v13 = a4;
    uint64_t v7 = 36 * a4;
    do
    {
      if (a5 >= 1)
      {
        uint64_t v8 = 0;
        uint64_t v9 = a3;
        do
        {
          fprintf(a1, "%d\t%d\t%d", a2, v8, v15);
          for (uint64_t i = 0; i != 36; i += 4)
            fprintf(a1, "\t%E", *(float *)(v9 + i));
          for (uint64_t j = 0; j != 36; j += 4)
            fprintf(a1, "\t0x%x", *(_DWORD *)(v9 + j));
          fputc(10, a1);
          ++v8;
          v9 += v7;
        }
        while (v8 != a5);
      }
      ++v15;
      a3 += 36;
    }
    while (v15 != v13);
  }
  return 0;
}

affineGPUMetal *AffineTransformContextAlloc(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[NSBundle bundleWithPath:@"/System/Library/VideoProcessors/VideoStabilizationV2.bundle"];
  if (!v2)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_8:
    float v6 = 0;
    goto LABEL_5;
  }
  id v3 = [objc_alloc((Class)FigMetalContext) initWithbundle:v2 andOptionalCommandQueue:v1];
  if (!v3)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    goto LABEL_8;
  }
  int v4 = v3;
  int v5 = [[affineGPUMetal alloc] initWithMetalContext:v3];
  float v6 = v5;
  if (v5)
  {
    CFRetain(v5);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
  }
LABEL_5:

  return v6;
}

uint64_t AffineTransformContextSetPriority(void *a1, uint64_t a2)
{
  return 0;
}

id AffineTransformSetOptions(void *a1, const char *a2)
{
  return [a1 setFillExtendedRowsInOutputBuffer:a2];
}

id AffineTransformSetOverscanFill(void *a1, const char *a2, uint64_t a3)
{
  return [a1 setOverscan:a2 height:a3];
}

uint64_t AffineTransformArrayApply(void *a1, opaqueCMSampleBuffer *a2, __CVBuffer *a3, uint64_t a4, uint64_t a5, void *a6, double a7, double a8)
{
  id v15 = a6;
  id v16 = a1;
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a2);
  float32x2_t v18 = CMGetAttachment(a2, @"MetadataDictionary", 0);
  float32x2_t v19 = v18;
  if (v18)
  {
    uint64_t v20 = [v18 objectForKeyedSubscript:@"QuadraBinningFactor"];
    BOOL v21 = v20 != 0;

    unsigned int WidthOfPlane = CVPixelBufferGetWidthOfPlane(ImageBuffer, 0);
    double v28 = COERCE_DOUBLE(__PAIR64__(CVPixelBufferGetHeightOfPlane(ImageBuffer, 0), WidthOfPlane));
    unsigned int v23 = CVPixelBufferGetWidthOfPlane(a3, 0);
    uint64_t v24 = (uint64_t)objc_msgSend(v16, "setTransformsArray:transforms3x3:transformStrides:inputSize:outputSize:pixelBufferValidRect:isQuadraSensor:", a4, a5, v21, a7, a8, v28, COERCE_DOUBLE(__PAIR64__(CVPixelBufferGetHeightOfPlane(a3, 0), v23)));
    if (v24)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      id v25 = [v16 renderWithSampleBuffer:a2 pixelBufferValidRect:a5 ltmLUT:v15 outputPixelBuffer:a3 isAttachmentRendering:0];
      if (v25)
      {
        uint64_t v27 = (uint64_t)v25;
        fig_log_get_emitter();
        FigDebugAssert3();
        uint64_t v24 = v27;
      }
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v24 = 4294954516;
  }

  return v24;
}

uint64_t AffineTransformArrayApplyOnAttachmentPixelBuffer(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, double a7, double a8, double a9, double a10)
{
  id v19 = a6;
  id v20 = a1;
  if (v19)
  {
    BOOL v21 = [v19 objectForKeyedSubscript:@"QuadraBinningFactor"];
    BOOL v22 = v21 != 0;

    id v23 = [v20 setTransformsArray:a4 transforms3x3:a5 transformStrides:v22 inputSize:a9 outputSize:a10 pixelBufferValidRect:a7 isQuadraSensor:a8];
    if (v23)
    {
      uint64_t v24 = (uint64_t)v23;
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      uint64_t v24 = (uint64_t)[v20 renderWithPixelBuffer:a2 metadata:v19 pixelBufferValidRect:a5 ltmLUT:0 outputPixelBuffer:a3 isAttachmentRendering:1];
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v24 = 4294954516;
  }

  return v24;
}

uint64_t AffineTransformArrayApplyOnAttachment(void *a1, opaqueCMSampleBuffer *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7, double a8, double a9)
{
  id v16 = a3;
  id v17 = a1;
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a2);
  id v19 = ImageBuffer;
  if (!ImageBuffer) {
    goto LABEL_11;
  }
  unsigned int WidthOfPlane = CVPixelBufferGetWidthOfPlane(ImageBuffer, 0);
  unsigned int HeightOfPlane = CVPixelBufferGetHeightOfPlane(v19, 0);
  *(double *)&v22.i64[1] = a9;
  v22.i64[0] = __PAIR64__(WidthOfPlane, HeightOfPlane);
  if (vmaxv_u16((uint16x4_t)vmovn_s32(vceqzq_s32(v22))))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    double v28 = 0;
    id v19 = 0;
LABEL_14:
    uint64_t v30 = 4294954516;
    goto LABEL_9;
  }
  CMGetAttachment(a2, @"MetadataDictionary", 0);
  id v23 = (__CVBuffer *)objc_claimAutoreleasedReturnValue();
  id v19 = v23;
  if (!v23)
  {
LABEL_11:
    fig_log_get_emitter();
    FigDebugAssert3();
    double v28 = 0;
    goto LABEL_14;
  }
  double v32 = COERCE_DOUBLE(__PAIR64__(HeightOfPlane, WidthOfPlane));
  uint64_t v24 = [(__CVBuffer *)v23 objectForKeyedSubscript:@"QuadraBinningFactor"];
  BOOL v25 = v24 != 0;

  id v26 = [v17 setTransformsArray:a5 transforms3x3:a6 transformStrides:v25 inputSize:a7 outputSize:a8 pixelBufferValidRect:v32 isQuadraSensor:a9];
  if (v26)
  {
    uint64_t v30 = (uint64_t)v26;
    fig_log_get_emitter();
    FigDebugAssert3();
    double v28 = 0;
    goto LABEL_9;
  }
  uint64_t v27 = CMGetAttachment(a2, kFigSampleBufferAttachmentKey_AttachedMedia, 0);
  double v28 = v27;
  if (!v27
    || ([v27 objectForKeyedSubscript:v16],
        float32x2_t v29 = objc_claimAutoreleasedReturnValue(),
        v29,
        !v29))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_14;
  }
  CMSetAttachment(v29, @"AttachmentName", v16, 1u);
  uint64_t v30 = (uint64_t)[v17 renderWithSampleBuffer:v29 pixelBufferValidRect:a6 ltmLUT:0 outputPixelBuffer:a4 isAttachmentRendering:1];
  if (v30)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
LABEL_9:

  return v30;
}

void AffineTransformFinish(void *a1)
{
  id v1 = a1;
  [v1 finish];
  [v1 resetFirstFrameParameters];
}

void AffineTransformContextRelease(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

id AffineTransformSetRenderMethod(void *a1, const char *a2)
{
  return [a1 setRenderMethod:a2];
}

id AffineTransformConfigureBlurBorderPixels(void *a1, const char *a2)
{
  return [a1 configureBlurWith:a2];
}

id AffineTransformGetBlurBuffersDimensions(void *a1, int a2, int a3, int *a4, int *a5)
{
  id result = [a1 getBlurBuffersDecimationFactor];
  *a4 = a2 / (int)result;
  *a5 = a3 / (int)result;
  return result;
}

id AffineTransformConfigureP3ToBT2020conversion(void *a1, const char *a2)
{
  return [a1 configureP3ToBT2020conversion:a2];
}

id AffineTransformCacheSourcePixelBuffer(void *a1, const char *a2)
{
  return [a1 cacheSourcePixelBuffer:a2];
}

void sub_28FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void __destructor_8_AB8s8n2_s8_AE(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
}

void __117__affineGPUMetal_renderWithPixelBuffer_metadata_pixelBufferValidRect_ltmLUT_outputPixelBuffer_isAttachmentRendering___block_invoke(id a1, MTLCommandBuffer *a2)
{
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
}

void __117__affineGPUMetal_renderWithPixelBuffer_metadata_pixelBufferValidRect_ltmLUT_outputPixelBuffer_isAttachmentRendering___block_invoke_2(id a1, MTLCommandBuffer *a2)
{
  uint64_t v2 = a2;
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

void sub_2C180(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __77__affineGPUMetal__renderBlurInputTextures_inputTexturesCount_outputTextures___block_invoke(id a1, MTLCommandBuffer *a2)
{
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
}

void __77__affineGPUMetal__renderBlurInputTextures_inputTexturesCount_outputTextures___block_invoke_2(id a1, MTLCommandBuffer *a2)
{
  uint64_t v2 = a2;
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

void sub_2D470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, uint64_t a14, void *a15, void *a16, uint64_t a17, void *a18, void *a19)
{
  _Unwind_Resume(a1);
}

void __87__affineGPUMetal__blurDeltaMapBordersFromStyledPixelBuffer_withUnstyledPixelBuffer_to___block_invoke(id a1, MTLCommandBuffer *a2)
{
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
}

void __87__affineGPUMetal__blurDeltaMapBordersFromStyledPixelBuffer_withUnstyledPixelBuffer_to___block_invoke_2(id a1, MTLCommandBuffer *a2)
{
  uint64_t v2 = a2;
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

void sub_2E4A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,void *a45,void *a46,uint64_t a47,void *a48,void *a49,char a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56)
{
  for (uint64_t i = 24; i != -24; i -= 24)
    __destructor_8_AB8s8n2_s8_AE((uint64_t)(&a50 + i));

  for (uint64_t j = 48; j != -24; j -= 24)
    __destructor_8_AB8s8n2_s8_AE((uint64_t)(&a56 + j));

  _Unwind_Resume(a1);
}

void __copy_assignment_8_8_t0w4_AB8s8n2_s8_AE(_DWORD *a1, _DWORD *a2)
{
  uint64_t v2 = 0;
  id v3 = a2 + 2;
  *a1 = *a2;
  int v4 = a1 + 2;
  do
  {
    objc_storeStrong((id *)&v4[v2], *(id *)&v3[v2]);
    v2 += 2;
  }
  while (v2 != 4);
}

void sub_30294(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void __43__affineGPUMetal__addCommandBufferHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    WeakRetained[585] |= [v4 status] != &dword_4;
  }
}

void sub_31574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _ispCallbackHandler(void *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  id v7 = a1;
  *((_DWORD *)v7 + 26) = a2;
  id v16 = v7;
  if (gGMFigKTraceEnabled == 1)
  {
    kdebug_trace();
    id v7 = v16;
  }
  if (!a2 && (int)a3 >= 1 && a4)
  {
    uint64_t v8 = a3;
    uint64_t v9 = (CFTypeRef *)(a4 + 8);
    do
    {
      if ([*((id *)v7 + 4) containsObject:*(v9 - 1)])
      {
        CVPixelBufferGetTypeID();
        CFGetTypeID(*v9);
      }
      v9 += 2;
      --v8;
      id v7 = v16;
    }
    while (v8);
  }
  dispatch_semaphore_wait(*((dispatch_semaphore_t *)v7 + 12), 0xFFFFFFFFFFFFFFFFLL);
  dispatch_semaphore_signal(*((dispatch_semaphore_t *)v16 + 10));
  --*((_DWORD *)v16 + 28);
  dispatch_semaphore_signal(*((dispatch_semaphore_t *)v16 + 12));
  if (a4)
  {
    int v10 = *(const void **)(a4 + 8);
    if (a3 >= 2)
    {
      uint64_t v11 = kFigCaptureISPProcessingSessionOutputID_PrimaryScalerLowRes;
      float32x2_t v12 = (CFTypeRef *)(a4 + 24);
      uint64_t v13 = a3 - 1;
      while (![(id)*(v12 - 1) isEqual:v11])
      {
        v12 += 2;
        if (!--v13) {
          goto LABEL_18;
        }
      }
      CMSetAttachment(v10, @"LowResolutionImageUsedByVideoEncoder", *v12, 0);
    }
  }
  else
  {
    int v10 = 0;
  }
LABEL_18:
  id WeakRetained = objc_loadWeakRetained((id *)v16 + 21);

  if (WeakRetained)
  {
    id v15 = objc_loadWeakRetained((id *)v16 + 21);
    [v15 didCompleteRenderingOfBuffer:v10 withStatus:a2];
  }
  else
  {
    dispatch_semaphore_signal(*((dispatch_semaphore_t *)v16 + 11));
  }
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

long long *_mapTransform2TileCoordinates(long long *result, int a2, int a3, int a4, int a5, uint64_t a6)
{
  unint64_t v6 = 0;
  long long v7 = *result;
  long long v8 = result[1];
  *(_DWORD *)(a6 + 32) = *((_DWORD *)result + 8);
  *(_OWORD *)a6 = v7;
  *(_OWORD *)(a6 + 16) = v8;
  do
  {
    *(float *)(a6 + 8 + 4 * v6) = *((float *)result + v6 + 2)
                                + (float)((float)(*((float *)result + v6 + 1) * (float)a5)
                                        + (float)(*((float *)result + v6) * (float)a4));
    BOOL v9 = v6 >= 6;
    v6 += 3;
  }
  while (!v9);
  for (uint64_t i = 0; i != 12; i += 4)
    *(float *)(a6 + i) = *(float *)(a6 + i) - (float)(*(float *)(a6 + i + 24) * (float)a2);
  for (uint64_t j = 0; j != 12; j += 4)
    *(float *)(a6 + j + 12) = *(float *)(a6 + j + 12) - (float)(*(float *)(a6 + j + 24) * (float)a3);
  return result;
}

float *_updateTileBoundingBox(float *result, unint64_t *a2, _WORD *a3, int8x16_t a4)
{
  uint64_t v4 = 0;
  a4.i64[0] = *a2;
  int8x16_t v23 = vqtbl1q_s8(a4, (int8x16_t)xmmword_47660);
  float v5 = result[6];
  float v6 = result[7];
  float v7 = result[8];
  float v8 = *result;
  float v9 = result[1];
  float v10 = result[2];
  float v11 = result[3];
  float v12 = result[4];
  float v13 = result[5];
  LOWORD(v14) = *a3;
  LOWORD(v15) = a3[1];
  LOWORD(v16) = a3[2];
  LOWORD(v17) = a3[3];
  do
  {
    float v18 = (float)v23.i16[v4];
    float v19 = (float)v23.i16[v4 + 1];
    double v20 = (float)(v7 + (float)((float)(v6 * v19) + (float)(v5 * v18)));
    if (fabs(v20) > 0.00000001) {
      double v20 = 1.0 / v20;
    }
    float v21 = v20 * (float)(v10 + (float)((float)(v9 * v19) + (float)(v8 * v18)));
    if (v21 < (float)(__int16)v14)
    {
      int v14 = (int)v21;
      *a3 = (int)v21;
    }
    if (v21 > (float)(__int16)v15)
    {
      int v15 = (int)(v21 + 1.0);
      a3[1] = v15;
    }
    float v22 = v20 * (float)(v13 + (float)((float)(v12 * v19) + (float)(v11 * v18)));
    if (v22 < (float)(__int16)v16)
    {
      int v16 = (int)v22;
      a3[2] = (int)v22;
    }
    if (v22 > (float)(__int16)v17)
    {
      int v17 = (int)(v22 + 1.0);
      a3[3] = v17;
    }
    v4 += 2;
  }
  while (v4 != 8);
  return result;
}

uint64_t portIndexFromPortType(const void *a1, int *a2)
{
  if (a1 && a2)
  {
    if (CFEqual(a1, kFigCapturePortType_BackFacingCamera))
    {
      *a2 = 0;
      return 0;
    }
    if (CFEqual(a1, kFigCapturePortType_BackFacingTelephotoCamera))
    {
      int v4 = 1;
LABEL_17:
      *a2 = v4;
      return 0;
    }
    if (CFEqual(a1, kFigCapturePortType_BackFacingSuperWideCamera))
    {
      int v4 = 2;
      goto LABEL_17;
    }
    if (CFEqual(a1, kFigCapturePortType_FrontFacingCamera))
    {
      int v4 = 3;
      goto LABEL_17;
    }
    if (CFEqual(a1, kFigCapturePortType_FrontFacingSuperWideCamera))
    {
      int v4 = 4;
      goto LABEL_17;
    }
    if (CFEqual(a1, kFigCapturePortType_FrontFacingInfraredCamera))
    {
      int v4 = 5;
      goto LABEL_17;
    }
    if (CFEqual(a1, kFigCapturePortType_BackFacingSparseTimeOfFlightCamera))
    {
      int v4 = 6;
      goto LABEL_17;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }

  return FigSignalErrorAt();
}

uint64_t bravoTransitionCameraIndexFromPortType(const void *a1, int *a2)
{
  if (a1 && a2)
  {
    if (CFEqual(a1, kFigCapturePortType_BackFacingCamera))
    {
      *a2 = 0;
      return 0;
    }
    if (CFEqual(a1, kFigCapturePortType_BackFacingTelephotoCamera))
    {
      int v4 = 1;
LABEL_9:
      *a2 = v4;
      return 0;
    }
    if (CFEqual(a1, kFigCapturePortType_BackFacingSuperWideCamera))
    {
      int v4 = 2;
      goto LABEL_9;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }

  return FigSignalErrorAt();
}

void FigMotionQuaternionFromDeltaRotation(float *a1)
{
  double v1 = sqrtf((float)((float)(a1[1] * a1[1]) + (float)(*a1 * *a1)) + (float)(a1[2] * a1[2]));
  if (v1 > 1.0e-10) {
    __sincos_stret(v1 * 0.5);
  }
}

int *FigMotionIncreaseRingIndex(int *result, int a2)
{
  *id result = (*result + 1) % a2;
  return result;
}

uint64_t FigMotionComputeLensPositionScalingFactor(const __CFDictionary *a1, int width, uint64_t a3, int a4, uint64_t a5, float *a6)
{
  if (a1 && a6)
  {
    CGSize size = CGRectZero.size;
    uint64_t SensorValidCropRect = FigMotionGetSensorValidCropRect(a1);
    if (SensorValidCropRect)
    {
      uint64_t v13 = SensorValidCropRect;
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      if (CFDictionaryContainsKey(a1, kFigCaptureStreamMetadata_ValidBufferRect))
      {
        FigCFDictionaryGetCGRectIfPresent();
        if (size.height > 0.0 && size.width > 0.0) {
          width = (int)size.width;
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

uint64_t FigMotionGetSensorValidCropRect(const __CFDictionary *a1)
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

uint64_t FigMotionGetISPHallData(const __CFData *a1, uint64_t a2, int *a3, int a4)
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
        float v19 = (float *)(a2 + 12);
        double v20 = (int *)(BytePtr + 28);
        do
        {
          int64_t v21 = FigHostTimeToNanoseconds();
          CMTimeMake(&v26, v21, 1000000000);
          *(Float64 *)(v19 - 3) = CMTimeGetSeconds(&v26);
          *(v19 - 1) = (float)*(v20 - 3) * 0.0039062;
          *float v19 = (float)*(v20 - 2) * 0.0039062;
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
        int v15 = (int *)(BytePtr + 20);
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

uint64_t FigMotionClearFocalLengthData(uint64_t a1)
{
  if (a1)
  {
    memset_pattern16((void *)(a1 + 480), &unk_47740, 0xCuLL);
    memset_pattern16((void *)(a1 + 492), &unk_47740, 0xCuLL);
    memset_pattern16((void *)(a1 + 504), &unk_47740, 0xCuLL);
    return 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

uint64_t FigMotionStashQuadraBinningFactor(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
  {
    FigCFDictionaryGetInt32IfPresent();
    return 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

uint64_t FigMotionStashFocalLengthData(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
  {
    FigCFDictionaryGetFloatIfPresent();
    FigCFDictionaryGetFloatIfPresent();
    FigCFDictionaryGetFloatIfPresent();
    return 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

uint64_t FigMotionUpdateBaseZoomFactorAdjustment(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
  {
    FigCFDictionaryGetFloatIfPresent();
    return 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

uint64_t FigMotionComputeBravoTranslation(float a1, float a2, uint64_t a3, uint64_t a4, unsigned int a5, float *a6, float *a7)
{
  float v34 = 0.0;
  if (!FigCFDictionaryGetFloatIfPresent())
  {
    if (!FigCFDictionaryGetFloatIfPresent() && !FigCFDictionaryGetFloatIfPresent())
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return FigSignalErrorAt();
    }
    float v34 = 0.0 * a2;
  }
  uint64_t v13 = 0;
  uint64_t v14 = *(unsigned int *)(a4 + 440);
  uint64_t v15 = *(void *)(a4 + 4 + 8 * v14);
  uint64_t v38 = *(void *)(a4 + 4 + 8 * a5);
  uint64_t v39 = v15;
  uint64_t v37 = 0;
  float v17 = *a6;
  float v16 = a6[1];
  *(float *)uint64_t v36 = *a6;
  *(float *)&v36[1] = v16;
  uint64_t v35 = 0;
  uint64_t v18 = BravoCurrentToReferenceMapping_0[3 * v14 + a5];
  float v19 = (float)(*(float *)(a4 + 4 * v18 + 76) * *(float *)(a4 + 40 + 4 * a5)) / *(float *)(a4 + 40 + 4 * v14);
  char v20 = 1;
  float v21 = (float)((float)*(int *)(a4 + 64 + 4 * a5) * a1) / (float)*(int *)(a4 + 64 + 4 * v14);
  do
  {
    float v22 = *(float *)&v36[v13];
    char v23 = v20;
    *((float *)&v37 + v13) = v22 + (float)(a1 * *((float *)&v38 + v13));
    *(float *)&v36[v13 - 2] = v22 + (float)(v19 * (float)(v21 * *((float *)&v39 + v13)));
    uint64_t v13 = 1;
    char v20 = 0;
  }
  while ((v23 & 1) != 0);
  uint64_t v24 = (float *)(a4 + 48 * (int)v18);
  float v25 = v17 - *(float *)&v35;
  float v26 = v16 - *((float *)&v35 + 1);
  float v27 = (float)((float)((float)(v16 - *((float *)&v35 + 1)) * v24[35]) + (float)(v24[34] * (float)(v17 - *(float *)&v35)))
      + (float)(v24[36] * v34);
  float v28 = 0.0;
  if (fabsf(v27) <= 0.00000001)
  {
    float v29 = 0.0;
  }
  else
  {
    float v29 = 0.0;
    if (v34 > 0.00000001)
    {
      float v31 = v24[26];
      float v32 = v24[27];
      uint64_t v30 = v24 + 26;
      float v29 = (float)(*(float *)&v37
                  + (float)((float)(v34
                                  * (float)((float)((float)(v26 * v32) + (float)(v31 * v25)) + (float)(v30[2] * v34)))
                          / v27))
          - v17;
      float v28 = (float)(*((float *)&v37 + 1)
                  + (float)((float)(v34
                                  * (float)((float)((float)(v26 * v30[5]) + (float)(v30[4] * v25))
                                          + (float)(v30[6] * v34)))
                          / v27))
          - v16;
    }
  }
  uint64_t result = 0;
  *a7 = v29;
  a7[1] = v28;
  return result;
}

void FigMotionComputeQuaternionForTimeStamp(uint64_t a1, void *a2, char *a3, double a4)
{
  float v8 = (unsigned char *)(a1 + 10256);
  BOOL v9 = *(unsigned char *)(a1 + 10257) == 0;
  if (a2)
  {
    *a2 = 0x3FF0000000000000;
    a2[1] = 0;
    a2[2] = 0;
    a2[3] = 0;
  }
  uint64_t v10 = 0;
  float v11 = flt_476A0[v9];
  float v12 = 1.0;
  int v13 = -1;
  do
  {
    float v14 = *(double *)(a1 + 8 + 8 * v10) - a4;
    float v15 = fabsf(v14);
    if (v12 > v15)
    {
      float v12 = v15;
      int v13 = v10;
    }
    ++v10;
  }
  while (v10 != 256);
  if (v12 > v11 && !*v8) {
    low_freq_error_logging();
  }
  if (v13 != -1)
  {
    double v16 = *(double *)(a1 + 8 * v13 + 8);
    if (v16 >= a4)
    {
      int v22 = (v13 - 1);
      if (v13 + 255 <= 0) {
        int v22 = -(1 - v13);
      }
      uint64_t v20 = v22;
      double v19 = *(double *)(a1 + 8 * v13 + 8);
      double v16 = *(double *)(a1 + 8 * v22 + 8);
      uint64_t v18 = v13;
    }
    else
    {
      if (v13 + 1 <= 0) {
        int v17 = --(char)(v13 + 1);
      }
      else {
        int v17 = (v13 + 1);
      }
      uint64_t v18 = v17;
      double v19 = *(double *)(a1 + 8 * v17 + 8);
      uint64_t v20 = v13;
    }
    double v23 = vabdd_f64(v19, a4);
    double v24 = v11;
    BOOL v26 = v19 >= a4 && v23 <= v24 && v16 <= a4;
    double v27 = vabdd_f64(v16, a4);
    if (v26 && v27 <= v24)
    {
      if (vabdd_f64(v19, v16) > 0.000001)
      {
        float v32 = (a4 - v16) / (v19 - v16);
        FigMotionInterpolateQuaternionsByAngle(a1 + 2056 + 32 * v20, (double *)(a1 + 2056 + 32 * v18), v32);
        *a2 = v33;
        a2[1] = v34;
        a2[2] = v35;
        a2[3] = v36;
        goto LABEL_34;
      }
      uint64_t v29 = a1 + 32 * v20;
    }
    else
    {
      uint64_t v29 = a1 + 32 * v13;
    }
    uint64_t v30 = (_OWORD *)(v29 + 2056);
    long long v31 = v30[1];
    *(_OWORD *)a2 = *v30;
    *((_OWORD *)a2 + 1) = v31;
LABEL_34:
    char v21 = 1;
    goto LABEL_35;
  }
  if (!*v8) {
    low_freq_error_logging();
  }
  char v21 = 0;
LABEL_35:
  *a3 = v21;
}

double FigMotionMultiplyByInverseOfQuaternion(double *a1, uint64_t *a2)
{
  double v3 = *(double *)a2;
  float64x2_t v4 = vnegq_f64(*(float64x2_t *)(a2 + 1));
  double v5 = -*((double *)a2 + 3);
  return FigMotionMultiplyQuaternions(&v3, a1);
}

uint64_t FigMotionComputeLensMovementForTimeStamp(uint64_t a1, float32x2_t *a2, unsigned int a3, double a4, float a5)
{
  return FigMotionComputeLensMovementAndSagForTimeStamp(a1, a2, 0, a3, a4, a5);
}

uint64_t FigMotionInitializeQuaternion(void *a1)
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

uint64_t low_freq_error_logging()
{
  FigGetUpTime();
  uint64_t result = FigHostTimeToNanoseconds();
  if (low_freq_error_logging_last_log_0) {
    BOOL v1 = (unint64_t)(result - low_freq_error_logging_last_log_0) >= 0x3B9ACA00;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1)
  {
    if (low_freq_error_logging_filtered_0) {
      low_freq_error_logging_filtered_0 = 0;
    }
    low_freq_error_logging_last_log_0 = result;
  }
  else
  {
    ++low_freq_error_logging_filtered_0;
  }
  return result;
}

void FigMotionInterpolateQuaternionsByAngle(uint64_t a1, double *a2, float a3)
{
  long double cosval = *(double *)a1;
  float64x2_t v19 = vnegq_f64(*(float64x2_t *)(a1 + 8));
  double v20 = -*(double *)(a1 + 24);
  long double v5 = FigMotionMultiplyQuaternions(&cosval, a2);
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
    FigMotionMultiplyQuaternions((double *)a1, &cosval);
  }
}

uint64_t FigMotionComputeLensMovementAndSagForTimeStamp(uint64_t a1, float32x2_t *a2, float32x2_t *a3, unsigned int a4, double a5, float a6)
{
  *a2 = 0;
  if (a3) {
    *a3 = 0;
  }
  uint64_t v6 = 0;
  unint64_t v7 = a1 + ((unint64_t)a4 << 12) + 8;
  int v8 = -1;
  float v9 = 1.0;
  do
  {
    float v10 = *(double *)(v7 + 8 * v6) - a5;
    float v11 = fabsf(v10);
    if (v9 > v11)
    {
      int v8 = v6;
      float v9 = v11;
    }
    ++v6;
  }
  while (v6 != 512);
  if (v8 == -1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v12 = *(void *)(a1 + 8 * a4 + 16392);
  if (!a3 || v12)
  {
    unint64_t v13 = a1 + ((unint64_t)a4 << 12) + 8200;
    uint64_t v14 = v8;
    double v15 = *(double *)(v7 + 8 * v8);
    if (v15 >= a5)
    {
      int v24 = v8 + 511;
      BOOL v17 = -v24 < 0;
      int v25 = -v24 & 0x1FF;
      int v26 = v24 & 0x1FF;
      if (v17) {
        int v27 = v26;
      }
      else {
        int v27 = -v25;
      }
      uint64_t v22 = v27;
      double v21 = v15;
      double v15 = *(double *)(v7 + 8 * v27);
      uint64_t v20 = v14;
    }
    else
    {
      int v16 = v8 + 1;
      BOOL v17 = -v16 < 0;
      int v18 = -v16 & 0x1FF;
      int v19 = v16 & 0x1FF;
      if (!v17) {
        int v19 = -v18;
      }
      uint64_t v20 = v19;
      double v21 = *(double *)(v7 + 8 * v19);
      uint64_t v22 = v14;
    }
    if (v21 >= a5
      && (vabdd_f64(v21, a5) <= 0.00200000009 ? (BOOL v28 = v15 <= a5) : (BOOL v28 = 0), v28
                                                                            && vabdd_f64(v15, a5) <= 0.00200000009))
    {
      if (vabdd_f64(v21, v15) > 0.000001)
      {
        double v31 = v21 - v15;
        float v32 = (a5 - v15) / v31;
        float32x2_t v33 = vmla_n_f32(vmul_n_f32(*(float32x2_t *)(v13 + 8 * v20), v32), *(float32x2_t *)(v13 + 8 * v22), 1.0 - v32);
        *a2 = v33;
        if (a3)
        {
          *(float *)&double v31 = 1.0 - v32;
          *a3 = vmla_f32(vmul_n_f32(*(float32x2_t *)(v12 + 8 * v20), v32), (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v31, 0), *(float32x2_t *)(v12 + 8 * v22));
          goto LABEL_29;
        }
        goto LABEL_36;
      }
      float32x2_t v29 = *(float32x2_t *)(v13 + 8 * v22);
      *a2 = v29;
      if (a3)
      {
        float32x2_t v30 = *(float32x2_t *)(v12 + 8 * v22);
        goto LABEL_28;
      }
    }
    else
    {
      float32x2_t v29 = *(float32x2_t *)(v13 + 8 * v14);
      *a2 = v29;
      if (a3)
      {
        float32x2_t v30 = *(float32x2_t *)(v12 + 8 * v14);
LABEL_28:
        *a3 = v30;
LABEL_29:
        uint64_t result = 0;
        *a2 = vmul_n_f32(*a2, a6);
        *a3 = vmul_n_f32(*a3, a6);
        return result;
      }
    }
    float32x2_t v33 = v29;
LABEL_36:
    uint64_t result = 0;
    *a2 = vmul_n_f32(v33, a6);
    return result;
  }
  fig_log_get_emitter();
  FigDebugAssert3();

  return FigSignalErrorAt();
}

double FigMotionPreMultiplyScalingTranslationToTransform(uint64_t a1, int8x16_t a2, int32x4_t a3, float a4, float a5, int8x16_t a6)
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

float FigMotionPostMultiplyScalingTranslationToTransform(float *a1, float a2, float a3, float a4, float a5)
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

double FigMotionApplyDigitalZoomToTransform(int a1, float *a2, int8x16_t a3, int32x4_t a4, double a5, double a6, int8x16_t a7)
{
  if (*(float *)a3.i32 > 0.0)
  {
    *(float *)a7.i32 = 1.0 / *(float *)a3.i32;
    if (a1) {
      float v7 = 1.0 / *(float *)a3.i32;
    }
    else {
      float v7 = *(float *)a3.i32;
    }
    float v8 = *(double *)a4.i64;
    *(float *)a4.i32 = (float)(1.0 - v7) * v8;
    float v9 = a5;
    float v10 = (float)(1.0 - v7) * v9;
    if (a1) {
      *(float *)a3.i32 = FigMotionPostMultiplyScalingTranslationToTransform(a2, 1.0 / *(float *)a3.i32, *(float *)a4.i32, *(float *)a7.i32, v10);
    }
    else {
      *(double *)a3.i64 = FigMotionPreMultiplyScalingTranslationToTransform((uint64_t)a2, a3, a4, *(float *)a3.i32, v10, a7);
    }
  }
  return *(double *)a3.i64;
}

double FigMotionComputeTransformFromRotation(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4)
{
  long long v6 = *a3;
  long long v7 = a3[1];
  *(_DWORD *)(a4 + 32) = *((_DWORD *)a3 + 8);
  *(_OWORD *)a4 = v6;
  *(_OWORD *)(a4 + 16) = v7;
  *(float *)&long long v7 = *(double *)(a2 + 8);
  float v8 = *(double *)(a2 + 16);
  FigMotionPostMultiplyScalingTranslationToTransform((float *)a4, 1.0 / *(float *)a2, (float)-*(float *)&v7 / *(float *)a2, 1.0 / *(float *)a2, (float)-v8 / *(float *)a2);
  v10.i32[0] = *(_DWORD *)a1;
  v11.i64[0] = *(void *)(a1 + 8);
  *(float *)v11.i32 = *(double *)v11.i64;
  float v12 = *(double *)(a1 + 16);
  float v13 = *(float *)a1;

  return FigMotionPreMultiplyScalingTranslationToTransform(a4, v10, v11, v13, v12, v9);
}

double FigMotionAdjustBravoDataForReferenceCamera(uint64_t a1)
{
  if (a1)
  {
    if ((*(unsigned char *)a1 & 6) != 0)
    {
      _computeExtrinsicMatrixBetweenCamera(a1, 0, 6, 2);
      _computeExtrinsicMatrixBetweenCamera(a1, 5, 4, 2);
      _invertExtrinsicMatrixStoredInBravoData(a1, 2, 1);
      _computeExtrinsicMatrixBetweenCamera(a1, 1, 6, 4);
      _invertExtrinsicMatrixStoredInBravoData(a1, 0, 1);
      _invertExtrinsicMatrixStoredInBravoData(a1, 0, 2);
      double result = 0.0;
      *(_OWORD *)(a1 + 392) = 0u;
      *(_OWORD *)(a1 + 408) = 0u;
      *(_OWORD *)(a1 + 424) = 0u;
      *(_DWORD *)(a1 + 392) = 1065353216;
      *(_DWORD *)(a1 + 412) = 1065353216;
      *(_DWORD *)(a1 + 432) = 1065353216;
    }
  }
  return result;
}

float *_computeExtrinsicMatrixBetweenCamera(uint64_t a1, int a2, int a3, int a4)
{
  uint64_t v4 = 0;
  float v5 = (float *)(a1 + 104 + 48 * a3);
  long long v6 = (float *)(a1 + 104 + 48 * a4);
  long long v7 = v33;
  float v8 = (double *)v32;
  int8x16_t v9 = v5;
  int8x16_t v10 = v6;
  do
  {
    uint64_t v11 = 0;
    float v12 = v8;
    do
    {
      *(double *)&v7[8 * v11] = v9[v11];
      *float v12 = v10[v11];
      v12 += 3;
      ++v11;
    }
    while (v11 != 3);
    ++v4;
    v10 += 4;
    v9 += 4;
    v7 += 24;
    ++v8;
  }
  while (v4 != 3);
  uint64_t v13 = 0;
  uint64_t v14 = v32;
  do
  {
    uint64_t v15 = 0;
    int v16 = (double *)v33;
    do
    {
      uint64_t v17 = 0;
      double v18 = 0.0;
      int v19 = v16;
      do
      {
        double v20 = *v19;
        v19 += 3;
        double v18 = v18 + *(double *)&v14[v17] * v20;
        v17 += 8;
      }
      while (v17 != 24);
      *(double *)&v31[6 * v13 + 3 + 2 * v15++] = v18;
      ++v16;
    }
    while (v15 != 3);
    ++v13;
    v14 += 24;
  }
  while (v13 != 3);
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  float v23 = v5[7] - v6[7];
  uint64_t v24 = a1 + 48 * a2 + 104;
  v31[0] = v5[3] - v6[3];
  v31[1] = v23;
  v31[2] = v5[11] - v6[11];
  uint64_t v25 = v24;
  do
  {
    uint64_t v26 = 0;
    uint64_t v27 = (4 * v22) | 3;
    *(_DWORD *)(v24 + 4 * v27) = 0;
    double result = &v31[v21 + 3];
    do
    {
      float v29 = *(double *)&result[2 * v26];
      *(float *)(v25 + 4 * v26) = v29;
      float v30 = *(float *)(v24 + 4 * v27) + *(double *)&v32[8 * v26 + v21 * 4] * v31[v26];
      *(float *)(v24 + 4 * v27) = v30;
      ++v26;
    }
    while (v26 != 3);
    ++v22;
    v25 += 16;
    v21 += 6;
  }
  while (v22 != 3);
  return result;
}

float _invertExtrinsicMatrixStoredInBravoData(uint64_t a1, int a2, int a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = (float *)(a1 + 104 + 48 * BravoCurrentToReferenceMapping_0[3 * a2 + a3]);
  uint64_t v5 = a1 + 104 + 48 * BravoCurrentToReferenceMapping_0[3 * a3 + a2];
  do
  {
    *(float *)(v5 + v3 * 4) = v4[dword_476DC[v3]];
    ++v3;
  }
  while (v3 != 12);
  for (uint64_t i = 0; i != 48; i += 16)
  {
    float result = -(float)((float)((float)(*(float *)(v5 + i + 4) * v4[7]) + (float)(*(float *)(v5 + i) * v4[3]))
                    + (float)(*(float *)(v5 + i + 8) * v4[11]));
    *(float *)(v5 + i + 12) = result;
  }
  return result;
}

uint64_t FigMotionGetBravoDataFromDictionary(const __CFDictionary *a1, uint64_t a2)
{
  if (a1
    && a2
    && (CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a1, kFigCapturePortType_BackFacingCamera)) != 0
    && (CFDictionaryRef v5 = Value,
        CFDictionaryRef v6 = (const __CFDictionary *)CFDictionaryGetValue(a1, kFigCapturePortType_BackFacingTelephotoCamera),
        CFDictionaryRef v7 = (const __CFDictionary *)CFDictionaryGetValue(a1, kFigCapturePortType_BackFacingSuperWideCamera),
        (unint64_t)v6 | (unint64_t)v7))
  {
    CFDictionaryRef v8 = v7;
    memset_pattern16((void *)(a2 + 28), &unk_47720, 0xCuLL);
    memset_pattern16((void *)(a2 + 40), &unk_47720, 0xCuLL);
    memset_pattern16((void *)(a2 + 64), &unk_47730, 0xCuLL);
    uint64_t v9 = a2 + 104;
    uint64_t v10 = 76;
    do
    {
      *(_DWORD *)(a2 + v10) = 1065353216;
      *(_OWORD *)uint64_t v9 = 0uLL;
      *(_OWORD *)(v9 + 16) = 0uLL;
      *(_OWORD *)(v9 + 32) = 0uLL;
      *(_DWORD *)uint64_t v9 = 1065353216;
      v10 += 4;
      *(_DWORD *)(v9 + 20) = 1065353216;
      *(_DWORD *)(v9 + 40) = 1065353216;
      v9 += 48;
    }
    while (v10 != 104);
    if (v6 && (uint64_t CameraInfo = FigMotionExtractCameraInfo(v6, a2, 1u, 2), CameraInfo)
      || v8 && (uint64_t CameraInfo = FigMotionExtractCameraInfo(v8, a2, 2u, 4), CameraInfo)
      || (uint64_t CameraInfo = FigMotionExtractCameraInfo(v5, a2, 0, 6), CameraInfo))
    {
      uint64_t v15 = CameraInfo;
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      for (uint64_t i = 0; i != 3; ++i)
      {
        uint64_t v13 = 0;
        uint64_t v14 = dword_4770C[i];
        do
        {
          *(float *)(a2 + 76 + 4 * BravoCurrentToReferenceMapping_0[3 * v14 + dword_4770C[v13]]) = *(float *)(a2 + 28 + 4 * dword_4770C[v13]) / *(float *)(a2 + 28 + 4 * v14);
          ++v13;
        }
        while (v13 != 3);
      }
      return 0;
    }
    return v15;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

uint64_t FigMotionExtractCameraInfo(const __CFDictionary *a1, uint64_t a2, unsigned int a3, int a4)
{
  if (a1 && (LODWORD(point.x) = 0, FigCFDictionaryGetFloatIfPresent()))
  {
    float v8 = *(float *)&point.x;
    if (*(float *)&point.x <= 1.0e-10) {
      float v8 = 1.0;
    }
    *(float *)(a2 + 4 * a3 + 28) = v8;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v14 = FigSignalErrorAt();
    if (v14)
    {
      fig_log_get_emitter();
      goto LABEL_26;
    }
  }
  CFDataRef Value = (const __CFData *)CFDictionaryGetValue(a1, kFigCaptureCameraInfoKey_CameraViewMatrix);
  if (!Value || (CFDataRef v10 = Value, CFDataGetLength(Value) != 48))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v22 = FigSignalErrorAt();
    if (!v22) {
      goto LABEL_9;
    }
    uint64_t v14 = v22;
    fig_log_get_emitter();
LABEL_26:
    FigDebugAssert3();
    return v14;
  }
  v24.location = 0;
  v24.length = 48;
  CFDataGetBytes(v10, v24, (UInt8 *)(a2 + 48 * a4 + 104));
LABEL_9:
  uint64_t v11 = a3;
  uint64_t v12 = a2 + 4 * a3;
  uint64_t v13 = (int *)(v12 + 64);
  if (a1 && (LODWORD(point.x) = 0, FigCFDictionaryGetFloatIfPresent()))
  {
    uint64_t v14 = 0;
    *(_DWORD *)(v12 + 52) = LODWORD(point.x);
    *uint64_t v13 = 1;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v14 = FigSignalErrorAt();
  }
  uint64_t v15 = (const void *)kFigCaptureCameraInfoKey_OpticalCenterOffsetInPhysicalSensorDimensions;
  if (CFDictionaryContainsKey(a1, kFigCaptureCameraInfoKey_OpticalCenterOffsetInPhysicalSensorDimensions))
  {
    CFDictionaryRef v16 = (const __CFDictionary *)CFDictionaryGetValue(a1, v15);
    if (v16)
    {
      uint64_t v17 = a2 + 8 * v11;
      CGPoint point = CGPointZero;
      CGPointMakeWithDictionaryRepresentation(v16, &point);
      CGPoint v18 = point;
      goto LABEL_17;
    }
LABEL_24:
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    if (!v14) {
      return v14;
    }
    goto LABEL_25;
  }
  int v19 = *v13;
  CFDictionaryRef v20 = (const __CFDictionary *)CFDictionaryGetValue(a1, kFigCaptureCameraInfoKey_OpticalCenterOffset);
  if (!v20) {
    goto LABEL_24;
  }
  uint64_t v17 = a2 + 8 * v11;
  CGPoint point = CGPointZero;
  CGPointMakeWithDictionaryRepresentation(v20, &point);
  CGPoint v18 = (CGPoint)vmulq_n_f64((float64x2_t)point, (double)v19);
LABEL_17:
  *(float32x2_t *)(v17 + 4) = vcvt_f32_f64((float64x2_t)v18);
  if (v14)
  {
LABEL_25:
    fig_log_get_emitter();
    goto LABEL_26;
  }
  return v14;
}

double FigMotionInverseOfQuaternion(uint64_t a1)
{
  return *(double *)a1;
}

double FigMotionQuaternionDotProduct(double *a1, double *a2)
{
  return a1[1] * a2[1] + *a1 * *a2 + a1[2] * a2[2] + a1[3] * a2[3];
}

double FigMotionGetQuaternionLength(double *a1)
{
  return sqrt(a1[1] * a1[1] + *a1 * *a1 + a1[2] * a1[2] + a1[3] * a1[3]);
}

double FigMotionMultiplyQuaternions(double *a1, double *a2)
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
  FigMotionNormalizeQuaternion(v12);
  return v12[0];
}

uint64_t FigMotionNormalizeQuaternion(double *a1)
{
  if (a1
    && (v2 = *a1, v1 = a1[1], v3 = a1[2], v4 = a1[3], double v5 = sqrt(v1 * v1 + v2 * v2 + v3 * v3 + v4 * v4), v5 > 0.00000001))
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

uint64_t FigMotionComputeAverageSpherePosition()
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
        uint64_t ISPHallData = FigMotionGetISPHallData(v10, (uint64_t)v26, (int *)&v25, 510);
        if (ISPHallData)
        {
          uint64_t v21 = ISPHallData;
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
            low_freq_error_logging();
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

float FigMotionAdjustParallaxShiftForScalingFactor(float result, double a2, float a3, float a4)
{
  if (a3 > 0.0 && vabds_f32(a3, a4) > 0.001) {
    return result * (float)(a4 / a3);
  }
  return result;
}

uint64_t FigMotionAdjustPointForSphereMovement(uint64_t a1, float64x2_t *a2, float a3, float a4)
{
  if (a1)
  {
    uint64_t v7 = FigMotionComputeAverageSpherePosition();
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

uint64_t FigMotionComputeOpticalCenterInBuffer(const __CFDictionary *a1, unint64_t a2, uint64_t a3, int a4, uint64_t a5, float64x2_t *a6, float a7)
{
  value = 0;
  CGPoint point = CGPointZero;
  if (a1 && a6)
  {
    int v9 = a5;
    int v11 = a3;
    unint64_t v14 = HIDWORD(a2);
    float v16 = 1.0;
    if (FigMotionComputeLensPositionScalingFactor(a1, a2, a3, a3, a5, &v16))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    v18.f64[0] = ((double)(int)a2 + -1.0) * 0.5;
    v18.f64[1] = ((double)(int)v14 + -1.0) * 0.5;
    if (!CFDictionaryGetValueIfPresent(a1, kFigCaptureStreamMetadata_OpticalCenter, (const void **)&value)
      || !CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)value, &point)
      || (uint64_t result = FigMotionMapPointFromRawToBuffer(a1, a2, v11, a4, &v18, point.x, point.y, v16), !result))
    {
      if (!v9 || (uint64_t result = FigMotionAdjustPointForSphereMovement((uint64_t)a1, &v18, a7, v16), !result))
      {
        uint64_t result = 0;
        *a6 = v18;
      }
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

uint64_t FigMotionMapPointFromRawToBuffer(const __CFDictionary *a1, uint64_t a2, int a3, int a4, float64x2_t *a5, float64_t a6, float64_t a7, float a8)
{
  if (a1 && a5)
  {
    float64x2_t size = (float64x2_t)CGRectZero.size;
    int8x16_t origin = (int8x16_t)CGRectZero.origin;
    CGPoint v31 = CGRectZero.origin;
    uint64_t SensorValidCropRect = FigMotionGetSensorValidCropRect(a1);
    if (SensorValidCropRect)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      FigCFDictionaryGetCGRectIfPresent();
      v33.int8x16_t origin = (CGPoint)origin;
      v33.float64x2_t size = (CGSize)size;
      v34.origin.double x = CGRectZero.origin.x;
      v34.origin.y = CGRectZero.origin.y;
      v34.size.width = CGRectZero.size.width;
      v34.size.height = CGRectZero.size.height;
      if (CGRectEqualToRect(v33, v34)) {
        unint64_t v14 = -1;
      }
      else {
        unint64_t v14 = 0;
      }
      int8x16_t v15 = (int8x16_t)vdupq_n_s64(v14);
      v16.i64[0] = (int)a2;
      v16.i64[1] = SHIDWORD(a2);
      float64x2_t v17 = (float64x2_t)vbslq_s8(v15, (int8x16_t)vcvtq_f64_s64(v16), (int8x16_t)size);
      __asm { FMOV            V1.2D, #-1.0 }
      v16.i64[0] = a3;
      v16.i64[1] = a4;
      __asm { FMOV            V5.2D, #0.5 }
      float64x2_t v24 = vmlaq_f64((float64x2_t)vbicq_s8(origin, v15), _Q5, vaddq_f64(v17, _Q1));
      float64x2_t v25 = vmlaq_f64((float64x2_t)v31, _Q5, vaddq_f64(size, _Q1));
      _Q5.f64[0] = a6;
      _Q5.f64[1] = a7;
      *a5 = vmlaq_f64(v24, vcvtq_f64_s64(v16), vmulq_n_f64(vsubq_f64(_Q5, v25), a8));
    }
    return SensorValidCropRect;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

uint64_t FigMotionComputeRawSensorCenterInBuffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1 && a5)
  {
    FigCFDictionaryGetIntIfPresent();
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

uint64_t FigMotionComputeParallaxShift(float a1, float a2, float a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8)
{
  float v27 = NAN;
  if (a5) {
    float v14 = *(float *)(a5 + 520);
  }
  else {
    float v14 = 0.0;
  }
  *(void *)a8 = 0;
  int FloatIfPresent = FigCFDictionaryGetFloatIfPresent();
  int v16 = FigCFDictionaryGetFloatIfPresent();
  uint64_t result = FigCFDictionaryGetFloatIfPresent();
  if (FloatIfPresent) {
    BOOL v18 = v16 == 0;
  }
  else {
    BOOL v18 = 1;
  }
  char v20 = v18 || a7 != 0;
  if (a5 && (v20 & 1) != 0)
  {
    uint64_t v21 = a5 + 4 * *(unsigned int *)(a5 + 444);
    float v22 = *(float *)(v21 + 480);
    float v27 = *(float *)(v21 + 492);
    float v23 = 1.0;
  }
  else
  {
    float v23 = 1.0;
    float v22 = NAN;
  }
  float v24 = v22 + -10.0;
  float v25 = 0.0;
  if (v27 > 0.0 && v24 > v27) {
    float v25 = (float)((float)(v23 * NAN) * a3) / fmaxf((float)((float)(v24 * v27) / (float)(v24 - v27)) / 1000.0, v14);
  }
  *(float *)a8 = v25 * a1;
  *(float *)(a8 + 4) = v25 * a2;
  return result;
}

uint64_t FigMotionHardwareAvailable()
{
  long long v4 = 0u;
  long long v5 = 0u;
  *(_OWORD *)__big = 0u;
  long long v3 = 0u;
  size_t v1 = 64;
  if ((FigMotionHardwareAvailable_checked & 1) == 0)
  {
    FigMotionHardwareAvailable_available = 1;
    if (!sysctlbyname("hw.model", __big, &v1, 0, 0) && strnstr(__big, "DEV", 0x40uLL)) {
      FigMotionHardwareAvailable_available = 0;
    }
    FigMotionHardwareAvailable_checked = 1;
  }
  return FigMotionHardwareAvailable_available;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return _CFAutorelease(arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryContainsKey(theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return _CFDictionaryGetValueIfPresent(theDict, key, value);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return _CFNumberGetType(number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

BOOL CGPointMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGPoint *point)
{
  return _CGPointMakeWithDictionaryRepresentation(dict, point);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return _CGRectCreateDictionaryRepresentation(a1);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  return _CGRectIntersection(r1, r2);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

BOOL CGRectIsNull(CGRect rect)
{
  return _CGRectIsNull(rect);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return _CGRectMakeWithDictionaryRepresentation(dict, rect);
}

uint64_t CMBaseObjectGetDerivedStorage()
{
  return _CMBaseObjectGetDerivedStorage();
}

uint64_t CMBaseObjectGetVTable()
{
  return _CMBaseObjectGetVTable();
}

uint64_t CMDerivedObjectCreate()
{
  return _CMDerivedObjectCreate();
}

CFDictionaryRef CMFormatDescriptionGetExtensions(CMFormatDescriptionRef desc)
{
  return _CMFormatDescriptionGetExtensions(desc);
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return _CMGetAttachment(target, key, attachmentModeOut);
}

uint64_t CMIGetPixelBufferYCCMatrix()
{
  return _CMIGetPixelBufferYCCMatrix();
}

uint64_t CMIGetPixelFormatInfo()
{
  return _CMIGetPixelFormatInfo();
}

uint64_t CMIGetRGBFromYCCConversionMatrix()
{
  return _CMIGetRGBFromYCCConversionMatrix();
}

uint64_t CMIGetYCCFromRGBConversionMatrix()
{
  return _CMIGetYCCFromRGBConversionMatrix();
}

uint64_t CMIGetYCCFromRGBConversionMatrixForPixelBuffer()
{
  return _CMIGetYCCFromRGBConversionMatrixForPixelBuffer();
}

void CMPropagateAttachments(CMAttachmentBearerRef source, CMAttachmentBearerRef destination)
{
}

void CMRemoveAttachment(CMAttachmentBearerRef target, CFStringRef key)
{
}

OSStatus CMSampleBufferCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMVideoFormatDescriptionRef formatDescription, const CMSampleTimingInfo *sampleTiming, CMSampleBufferRef *sampleBufferOut)
{
  return _CMSampleBufferCreateForImageBuffer(allocator, imageBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, sampleTiming, sampleBufferOut);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return _CMSampleBufferGetImageBuffer(sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return _CMSampleBufferGetPresentationTimeStamp(retstr, sbuf);
}

OSStatus CMSampleBufferGetSampleTimingInfoArray(CMSampleBufferRef sbuf, CMItemCount numSampleTimingEntries, CMSampleTimingInfo *timingArrayOut, CMItemCount *timingArrayEntriesNeededOut)
{
  return _CMSampleBufferGetSampleTimingInfoArray(sbuf, numSampleTimingEntries, timingArrayOut, timingArrayEntriesNeededOut);
}

void CMSetAttachment(CMAttachmentBearerRef target, CFStringRef key, CFTypeRef value, CMAttachmentMode attachmentMode)
{
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return _CMTimeCompare(time1, time2);
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

OSStatus CMVideoFormatDescriptionCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return _CMVideoFormatDescriptionCreateForImageBuffer(allocator, imageBuffer, formatDescriptionOut);
}

CFTypeRef CVBufferCopyAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return _CVBufferCopyAttachment(buffer, key, attachmentMode);
}

CFDictionaryRef CVBufferCopyAttachments(CVBufferRef buffer, CVAttachmentMode attachmentMode)
{
  return _CVBufferCopyAttachments(buffer, attachmentMode);
}

void CVBufferPropagateAttachments(CVBufferRef sourceBuffer, CVBufferRef destinationBuffer)
{
}

void CVBufferRemoveAttachment(CVBufferRef buffer, CFStringRef key)
{
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
}

void CVBufferSetAttachments(CVBufferRef buffer, CFDictionaryRef theAttachments, CVAttachmentMode attachmentMode)
{
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return _CVMetalTextureCacheCreate(allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return _CVMetalTextureCacheCreateTextureFromImage(allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex, textureOut);
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return _CVMetalTextureGetTexture(image);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return _CVPixelBufferCreate(allocator, width, height, pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

uint64_t CVPixelBufferGetAttributes()
{
  return _CVPixelBufferGetAttributes();
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return _CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, planeIndex);
}

void CVPixelBufferGetExtendedPixels(CVPixelBufferRef pixelBuffer, size_t *extraColumnsOnLeft, size_t *extraColumnsOnRight, size_t *extraRowsOnTop, size_t *extraRowsOnBottom)
{
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetHeight(pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return _CVPixelBufferGetHeightOfPlane(pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetIOSurface(pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetPixelFormatType(pixelBuffer);
}

CFTypeID CVPixelBufferGetTypeID(void)
{
  return _CVPixelBufferGetTypeID();
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetWidth(pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return _CVPixelBufferGetWidthOfPlane(pixelBuffer, planeIndex);
}

CVReturn CVPixelBufferPoolCreatePixelBufferWithAuxAttributes(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CFDictionaryRef auxAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return _CVPixelBufferPoolCreatePixelBufferWithAuxAttributes(allocator, pixelBufferPool, auxAttributes, pixelBufferOut);
}

uint64_t CreatePixelBuffer()
{
  return _CreatePixelBuffer();
}

uint64_t FigCFArrayGetDoubleAtIndex()
{
  return _FigCFArrayGetDoubleAtIndex();
}

uint64_t FigCFDictionaryGetBooleanIfPresent()
{
  return _FigCFDictionaryGetBooleanIfPresent();
}

uint64_t FigCFDictionaryGetCGRectIfPresent()
{
  return _FigCFDictionaryGetCGRectIfPresent();
}

uint64_t FigCFDictionaryGetDoubleIfPresent()
{
  return _FigCFDictionaryGetDoubleIfPresent();
}

uint64_t FigCFDictionaryGetFloat32IfPresent()
{
  return _FigCFDictionaryGetFloat32IfPresent();
}

uint64_t FigCFDictionaryGetFloatIfPresent()
{
  return _FigCFDictionaryGetFloatIfPresent();
}

uint64_t FigCFDictionaryGetInt32IfPresent()
{
  return _FigCFDictionaryGetInt32IfPresent();
}

uint64_t FigCFDictionaryGetInt64IfPresent()
{
  return _FigCFDictionaryGetInt64IfPresent();
}

uint64_t FigCFDictionaryGetIntIfPresent()
{
  return _FigCFDictionaryGetIntIfPresent();
}

uint64_t FigCFDictionarySetInt32()
{
  return _FigCFDictionarySetInt32();
}

uint64_t FigCFEqual()
{
  return _FigCFEqual();
}

uint64_t FigCaptureGetCaptureDeviceCreateFunction()
{
  return _FigCaptureGetCaptureDeviceCreateFunction();
}

uint64_t FigCapturePlatformIdentifier()
{
  return _FigCapturePlatformIdentifier();
}

uint64_t FigCreateIOSurfacePropertiesDictionary()
{
  return _FigCreateIOSurfacePropertiesDictionary();
}

uint64_t FigCreatePixelBufferCacheModeArray()
{
  return _FigCreatePixelBufferCacheModeArray();
}

uint64_t FigDebugAssert3()
{
  return _FigDebugAssert3();
}

uint64_t FigDispatchQueueCreateWithPriority()
{
  return _FigDispatchQueueCreateWithPriority();
}

uint64_t FigGetCFPreferenceBooleanWithDefault()
{
  return _FigGetCFPreferenceBooleanWithDefault();
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

uint64_t FigSampleBufferProcessorGetClassID()
{
  return _FigSampleBufferProcessorGetClassID();
}

uint64_t FigSignalErrorAt()
{
  return _FigSignalErrorAt();
}

uint64_t FigSimpleMutexCreate()
{
  return _FigSimpleMutexCreate();
}

uint64_t FigSimpleMutexDestroy()
{
  return _FigSimpleMutexDestroy();
}

uint64_t FigSimpleMutexLock()
{
  return _FigSimpleMutexLock();
}

uint64_t FigSimpleMutexUnlock()
{
  return _FigSimpleMutexUnlock();
}

size_t IOSurfaceGetBytesPerRowOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return _IOSurfaceGetBytesPerRowOfPlane(buffer, planeIndex);
}

uint64_t IOSurfaceGetCompressionTypeOfPlane()
{
  return _IOSurfaceGetCompressionTypeOfPlane();
}

uint64_t IOSurfaceGetOffsetOfPlane()
{
  return _IOSurfaceGetOffsetOfPlane();
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return _MTLPixelFormatGetInfoForDevice();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  return ___invert_f3(a1);
}

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  return ___invert_f4(a1);
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

__float2 __sincosf_stret(float a1)
{
  __float2 v3 = ___sincosf_stret(a1);
  float cosval = v3.__cosval;
  float sinval = v3.__sinval;
  result.__float cosval = cosval;
  result.__float sinval = sinval;
  return result;
}

long double acos(long double __x)
{
  return _acos(__x);
}

long double asin(long double __x)
{
  return _asin(__x);
}

float asinf(float a1)
{
  return _asinf(a1);
}

float atan2f(float a1, float a2)
{
  return _atan2f(a1, a2);
}

float atanf(float a1)
{
  return _atanf(a1);
}

void bzero(void *a1, size_t a2)
{
}

long double cos(long double __x)
{
  return _cos(__x);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
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

float fmodf(float a1, float a2)
{
  return _fmodf(a1, a2);
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

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

float ldexpf(float a1, int a2)
{
  return _ldexpf(a1, a2);
}

float logf(float a1)
{
  return _logf(a1);
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

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

float powf(float a1, float a2)
{
  return _powf(a1, a2);
}

int puts(const char *a1)
{
  return _puts(a1);
}

long double sin(long double __x)
{
  return _sin(__x);
}

float sinf(float a1)
{
  return _sinf(a1);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return _strnstr(__big, __little, __len);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

id objc_msgSend_GPUEndTime(void *a1, const char *a2, ...)
{
  return [a1 GPUEndTime];
}

id objc_msgSend_GPUStartTime(void *a1, const char *a2, ...)
{
  return [a1 GPUStartTime];
}

id objc_msgSend_ISPMeshParams(void *a1, const char *a2, ...)
{
  return [a1 ISPMeshParams];
}

id objc_msgSend_ISPStripParams(void *a1, const char *a2, ...)
{
  return [a1 ISPStripParams];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__allocateSemanticStyleColorCubeTextures(void *a1, const char *a2, ...)
{
  return [a1 _allocateSemanticStyleColorCubeTextures];
}

id objc_msgSend__checkInputIsWritable(void *a1, const char *a2, ...)
{
  return [a1 _checkInputIsWritable];
}

id objc_msgSend__compileShaders(void *a1, const char *a2, ...)
{
  return [a1 _compileShaders];
}

id objc_msgSend__configureISPStripTileCount(void *a1, const char *a2, ...)
{
  return [a1 _configureISPStripTileCount];
}

id objc_msgSend__deallocateTransformBuffers(void *a1, const char *a2, ...)
{
  return [a1 _deallocateTransformBuffers];
}

id objc_msgSend__initBlurShaders(void *a1, const char *a2, ...)
{
  return [a1 _initBlurShaders];
}

id objc_msgSend__initComputeShaders(void *a1, const char *a2, ...)
{
  return [a1 _initComputeShaders];
}

id objc_msgSend__initTransformShaders(void *a1, const char *a2, ...)
{
  return [a1 _initTransformShaders];
}

id objc_msgSend__purgeResources(void *a1, const char *a2, ...)
{
  return [a1 _purgeResources];
}

id objc_msgSend__shiftBuffers(void *a1, const char *a2, ...)
{
  return [a1 _shiftBuffers];
}

id objc_msgSend__updateConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _updateConfiguration];
}

id objc_msgSend_accumulationFilterPole(void *a1, const char *a2, ...)
{
  return [a1 accumulationFilterPole];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_applyFrameCropOffset(void *a1, const char *a2, ...)
{
  return [a1 applyFrameCropOffset];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attachEstimatedMotionVector(void *a1, const char *a2, ...)
{
  return [a1 attachEstimatedMotionVector];
}

id objc_msgSend_attachStabilizedOutputCameraTrajectory(void *a1, const char *a2, ...)
{
  return [a1 attachStabilizedOutputCameraTrajectory];
}

id objc_msgSend_attachStabilizedTrajectoryHomography(void *a1, const char *a2, ...)
{
  return [a1 attachStabilizedTrajectoryHomography];
}

id objc_msgSend_blitCommandEncoder(void *a1, const char *a2, ...)
{
  return [a1 blitCommandEncoder];
}

id objc_msgSend_blurBorderPixels(void *a1, const char *a2, ...)
{
  return [a1 blurBorderPixels];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cameraExtrinsicMatrix(void *a1, const char *a2, ...)
{
  return [a1 cameraExtrinsicMatrix];
}

id objc_msgSend_cameraInfoByPortType(void *a1, const char *a2, ...)
{
  return [a1 cameraInfoByPortType];
}

id objc_msgSend_cameraMetadataInput(void *a1, const char *a2, ...)
{
  return [a1 cameraMetadataInput];
}

id objc_msgSend_centerIndex(void *a1, const char *a2, ...)
{
  return [a1 centerIndex];
}

id objc_msgSend_cinematicLookAheadFrameCount(void *a1, const char *a2, ...)
{
  return [a1 cinematicLookAheadFrameCount];
}

id objc_msgSend_cinematicLookAheadTime(void *a1, const char *a2, ...)
{
  return [a1 cinematicLookAheadTime];
}

id objc_msgSend_colorAttachments(void *a1, const char *a2, ...)
{
  return [a1 colorAttachments];
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

id objc_msgSend_commitData(void *a1, const char *a2, ...)
{
  return [a1 commitData];
}

id objc_msgSend_computeCommandEncoder(void *a1, const char *a2, ...)
{
  return [a1 computeCommandEncoder];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_contents(void *a1, const char *a2, ...)
{
  return [a1 contents];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultSettings(void *a1, const char *a2, ...)
{
  return [a1 defaultSettings];
}

id objc_msgSend_detectAndTrack(void *a1, const char *a2, ...)
{
  return [a1 detectAndTrack];
}

id objc_msgSend_detectionResult(void *a1, const char *a2, ...)
{
  return [a1 detectionResult];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_disableTransformLimitsForPredeterminedTrajectory(void *a1, const char *a2, ...)
{
  return [a1 disableTransformLimitsForPredeterminedTrajectory];
}

id objc_msgSend_distortionCenter(void *a1, const char *a2, ...)
{
  return [a1 distortionCenter];
}

id objc_msgSend_distortionCompensationEnabledPortTypes(void *a1, const char *a2, ...)
{
  return [a1 distortionCompensationEnabledPortTypes];
}

id objc_msgSend_distortionCorrectionEnabledPortTypes(void *a1, const char *a2, ...)
{
  return [a1 distortionCorrectionEnabledPortTypes];
}

id objc_msgSend_emitSampleBufferSemaphore(void *a1, const char *a2, ...)
{
  return [a1 emitSampleBufferSemaphore];
}

id objc_msgSend_enableRollingShutterCorrectionOnly(void *a1, const char *a2, ...)
{
  return [a1 enableRollingShutterCorrectionOnly];
}

id objc_msgSend_endEncoding(void *a1, const char *a2, ...)
{
  return [a1 endEncoding];
}

id objc_msgSend_extendedOutputRowsToFill(void *a1, const char *a2, ...)
{
  return [a1 extendedOutputRowsToFill];
}

id objc_msgSend_extractGravityData(void *a1, const char *a2, ...)
{
  return [a1 extractGravityData];
}

id objc_msgSend_filteredBlurVector(void *a1, const char *a2, ...)
{
  return [a1 filteredBlurVector];
}

id objc_msgSend_filteredRoll(void *a1, const char *a2, ...)
{
  return [a1 filteredRoll];
}

id objc_msgSend_filteredValue(void *a1, const char *a2, ...)
{
  return [a1 filteredValue];
}

id objc_msgSend_finish(void *a1, const char *a2, ...)
{
  return [a1 finish];
}

id objc_msgSend_finishProcessing(void *a1, const char *a2, ...)
{
  return [a1 finishProcessing];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_fragmentFunction(void *a1, const char *a2, ...)
{
  return [a1 fragmentFunction];
}

id objc_msgSend_frameDurationPrevious(void *a1, const char *a2, ...)
{
  return [a1 frameDurationPrevious];
}

id objc_msgSend_frameRateConversionEnabled(void *a1, const char *a2, ...)
{
  return [a1 frameRateConversionEnabled];
}

id objc_msgSend_fullRangeVertexDesc(void *a1, const char *a2, ...)
{
  return [a1 fullRangeVertexDesc];
}

id objc_msgSend_getBlurBuffersDecimationFactor(void *a1, const char *a2, ...)
{
  return [a1 getBlurBuffersDecimationFactor];
}

id objc_msgSend_getDefaultProcessorConfigurationForStreaming(void *a1, const char *a2, ...)
{
  return [a1 getDefaultProcessorConfigurationForStreaming];
}

id objc_msgSend_getQuaternionSmoothingArrays(void *a1, const char *a2, ...)
{
  return [a1 getQuaternionSmoothingArrays];
}

id objc_msgSend_getSmoothingAnalysisArrays(void *a1, const char *a2, ...)
{
  return [a1 getSmoothingAnalysisArrays];
}

id objc_msgSend_getZoomSmoothingArrays(void *a1, const char *a2, ...)
{
  return [a1 getZoomSmoothingArrays];
}

id objc_msgSend_ghostInformationLookAheadPointer(void *a1, const char *a2, ...)
{
  return [a1 ghostInformationLookAheadPointer];
}

id objc_msgSend_globalLinearSystemMixFactor(void *a1, const char *a2, ...)
{
  return [a1 globalLinearSystemMixFactor];
}

id objc_msgSend_gpuPriority(void *a1, const char *a2, ...)
{
  return [a1 gpuPriority];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return [a1 height];
}

id objc_msgSend_horizonCorrectionMode(void *a1, const char *a2, ...)
{
  return [a1 horizonCorrectionMode];
}

id objc_msgSend_horizonCorrectionThreshold(void *a1, const char *a2, ...)
{
  return [a1 horizonCorrectionThreshold];
}

id objc_msgSend_incrementCenter(void *a1, const char *a2, ...)
{
  return [a1 incrementCenter];
}

id objc_msgSend_inputIndex(void *a1, const char *a2, ...)
{
  return [a1 inputIndex];
}

id objc_msgSend_inputPixelBufferAttributes(void *a1, const char *a2, ...)
{
  return [a1 inputPixelBufferAttributes];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_ispProcessingSession(void *a1, const char *a2, ...)
{
  return [a1 ispProcessingSession];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_library(void *a1, const char *a2, ...)
{
  return [a1 library];
}

id objc_msgSend_livePhotoCleanOutputRect(void *a1, const char *a2, ...)
{
  return [a1 livePhotoCleanOutputRect];
}

id objc_msgSend_metalCommandQueue(void *a1, const char *a2, ...)
{
  return [a1 metalCommandQueue];
}

id objc_msgSend_metalDevice(void *a1, const char *a2, ...)
{
  return [a1 metalDevice];
}

id objc_msgSend_metalSubmissionAndCompletionQueuePriority(void *a1, const char *a2, ...)
{
  return [a1 metalSubmissionAndCompletionQueuePriority];
}

id objc_msgSend_minDistanceForBravoParallaxShift(void *a1, const char *a2, ...)
{
  return [a1 minDistanceForBravoParallaxShift];
}

id objc_msgSend_motionBlurShimmerMitigationMethod(void *a1, const char *a2, ...)
{
  return [a1 motionBlurShimmerMitigationMethod];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_onlyGenerateTransformsParameters(void *a1, const char *a2, ...)
{
  return [a1 onlyGenerateTransformsParameters];
}

id objc_msgSend_openForNewData(void *a1, const char *a2, ...)
{
  return [a1 openForNewData];
}

id objc_msgSend_originalQuaternionsInput(void *a1, const char *a2, ...)
{
  return [a1 originalQuaternionsInput];
}

id objc_msgSend_outputAttachmentsAuxAttributes(void *a1, const char *a2, ...)
{
  return [a1 outputAttachmentsAuxAttributes];
}

id objc_msgSend_outputAttachmentsPixelBufferPools(void *a1, const char *a2, ...)
{
  return [a1 outputAttachmentsPixelBufferPools];
}

id objc_msgSend_outputAuxAttributes(void *a1, const char *a2, ...)
{
  return [a1 outputAuxAttributes];
}

id objc_msgSend_outputDepthAuxAttributes(void *a1, const char *a2, ...)
{
  return [a1 outputDepthAuxAttributes];
}

id objc_msgSend_outputDepthPixelBufferPool(void *a1, const char *a2, ...)
{
  return [a1 outputDepthPixelBufferPool];
}

id objc_msgSend_outputFrameTimeInput(void *a1, const char *a2, ...)
{
  return [a1 outputFrameTimeInput];
}

id objc_msgSend_outputIntegratedStyleCoefficientsTexture(void *a1, const char *a2, ...)
{
  return [a1 outputIntegratedStyleCoefficientsTexture];
}

id objc_msgSend_outputPixelBufferAttributes(void *a1, const char *a2, ...)
{
  return [a1 outputPixelBufferAttributes];
}

id objc_msgSend_outputPixelBufferPool(void *a1, const char *a2, ...)
{
  return [a1 outputPixelBufferPool];
}

id objc_msgSend_p3ToBT2020ConversionEnabled(void *a1, const char *a2, ...)
{
  return [a1 p3ToBT2020ConversionEnabled];
}

id objc_msgSend_pipelineLibrary(void *a1, const char *a2, ...)
{
  return [a1 pipelineLibrary];
}

id objc_msgSend_pixelFormat(void *a1, const char *a2, ...)
{
  return [a1 pixelFormat];
}

id objc_msgSend_prepareToProcess(void *a1, const char *a2, ...)
{
  return [a1 prepareToProcess];
}

id objc_msgSend_process(void *a1, const char *a2, ...)
{
  return [a1 process];
}

id objc_msgSend_purgeResources(void *a1, const char *a2, ...)
{
  return [a1 purgeResources];
}

id objc_msgSend_quaternionsInput(void *a1, const char *a2, ...)
{
  return [a1 quaternionsInput];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_repair(void *a1, const char *a2, ...)
{
  return [a1 repair];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resetCoefficientsFilter(void *a1, const char *a2, ...)
{
  return [a1 resetCoefficientsFilter];
}

id objc_msgSend_resetFirstFrameParameters(void *a1, const char *a2, ...)
{
  return [a1 resetFirstFrameParameters];
}

id objc_msgSend_resetState(void *a1, const char *a2, ...)
{
  return [a1 resetState];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_rollEstimate(void *a1, const char *a2, ...)
{
  return [a1 rollEstimate];
}

id objc_msgSend_rollRate(void *a1, const char *a2, ...)
{
  return [a1 rollRate];
}

id objc_msgSend_rollVariance(void *a1, const char *a2, ...)
{
  return [a1 rollVariance];
}

id objc_msgSend_sensorIDDict(void *a1, const char *a2, ...)
{
  return [a1 sensorIDDict];
}

id objc_msgSend_setup(void *a1, const char *a2, ...)
{
  return [a1 setup];
}

id objc_msgSend_shouldRampUp(void *a1, const char *a2, ...)
{
  return [a1 shouldRampUp];
}

id objc_msgSend_smartStyleMemoryPoolId(void *a1, const char *a2, ...)
{
  return [a1 smartStyleMemoryPoolId];
}

id objc_msgSend_smartStyleRenderingEnabled(void *a1, const char *a2, ...)
{
  return [a1 smartStyleRenderingEnabled];
}

id objc_msgSend_smartStyleReversibilityEnabled(void *a1, const char *a2, ...)
{
  return [a1 smartStyleReversibilityEnabled];
}

id objc_msgSend_smoothingMethod(void *a1, const char *a2, ...)
{
  return [a1 smoothingMethod];
}

id objc_msgSend_sphereCorrectionEnabled(void *a1, const char *a2, ...)
{
  return [a1 sphereCorrectionEnabled];
}

id objc_msgSend_sphereVideoEnabled(void *a1, const char *a2, ...)
{
  return [a1 sphereVideoEnabled];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_styleEngineConfiguration(void *a1, const char *a2, ...)
{
  return [a1 styleEngineConfiguration];
}

id objc_msgSend_suspend(void *a1, const char *a2, ...)
{
  return [a1 suspend];
}

id objc_msgSend_timeConstant(void *a1, const char *a2, ...)
{
  return [a1 timeConstant];
}

id objc_msgSend_timeVariance(void *a1, const char *a2, ...)
{
  return [a1 timeVariance];
}

id objc_msgSend_transformPlatform(void *a1, const char *a2, ...)
{
  return [a1 transformPlatform];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_updateCubesIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 updateCubesIfNeeded];
}

id objc_msgSend_useCameraGeometry(void *a1, const char *a2, ...)
{
  return [a1 useCameraGeometry];
}

id objc_msgSend_useISPMotionData(void *a1, const char *a2, ...)
{
  return [a1 useISPMotionData];
}

id objc_msgSend_utilities(void *a1, const char *a2, ...)
{
  return [a1 utilities];
}

id objc_msgSend_vertexFunction(void *a1, const char *a2, ...)
{
  return [a1 vertexFunction];
}

id objc_msgSend_videoGreenGhostMitigationParameters(void *a1, const char *a2, ...)
{
  return [a1 videoGreenGhostMitigationParameters];
}

id objc_msgSend_videoSTFAnalyticsVersion(void *a1, const char *a2, ...)
{
  return [a1 videoSTFAnalyticsVersion];
}

id objc_msgSend_videoSTFParameters(void *a1, const char *a2, ...)
{
  return [a1 videoSTFParameters];
}

id objc_msgSend_videoStabilizationDisabled(void *a1, const char *a2, ...)
{
  return [a1 videoStabilizationDisabled];
}

id objc_msgSend_waitForIdle(void *a1, const char *a2, ...)
{
  return [a1 waitForIdle];
}

id objc_msgSend_waitUntilCompleted(void *a1, const char *a2, ...)
{
  return [a1 waitUntilCompleted];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return [a1 width];
}

id objc_msgSend_zoomSmoothingEnabled(void *a1, const char *a2, ...)
{
  return [a1 zoomSmoothingEnabled];
}