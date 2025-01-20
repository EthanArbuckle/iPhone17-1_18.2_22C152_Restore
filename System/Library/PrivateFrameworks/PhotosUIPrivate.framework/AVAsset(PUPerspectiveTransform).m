@interface AVAsset(PUPerspectiveTransform)
- (__n128)pu_perspectiveTransformForMetadata:()PUPerspectiveTransform;
- (id)pu_stillImageTransformAssetTrack;
- (uint64_t)_pu_getVitalityTransform:()PUPerspectiveTransform dimensions:;
- (uint64_t)_pu_isVitalityLimitingAllowed;
- (uint64_t)pu_supportsVitality;
- (void)_pu_handleRequiredPropertiesLoadedWithAdditionalNormalizedTransform:()PUPerspectiveTransform completion:;
- (void)pu_loadNormalizedVitalityPerspectiveTransformWithAdditionalNormalizedTransform:()PUPerspectiveTransform completion:;
- (void)pu_stillAssetTransformMetadataPair;
@end

@implementation AVAsset(PUPerspectiveTransform)

- (void)pu_stillAssetTransformMetadataPair
{
  v2 = objc_msgSend(a1, "pu_stillImageTransformAssetTrack");
  if (v2)
  {
    v3 = [MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:v2 outputSettings:0];
    id v26 = 0;
    v4 = [MEMORY[0x1E4F16378] assetReaderWithAsset:a1 error:&v26];
    id v5 = v26;
    v6 = v5;
    if (v4)
    {
      id v23 = v5;
      v24 = v2;
      [v4 addOutput:v3];
      v22 = v4;
      [v4 startReading];
      v7 = 0;
      v8 = 0;
      uint64_t v25 = *MEMORY[0x1E4F1F150];
      uint64_t v9 = *MEMORY[0x1E4F1F158];
      while (1)
      {
        v10 = (opaqueCMSampleBuffer *)[v3 copyNextSampleBuffer];
        if (!v10) {
          break;
        }
        v11 = v10;
        if (CMSampleBufferGetNumSamples(v10))
        {
          v12 = (void *)[objc_alloc(MEMORY[0x1E4F166C0]) initWithSampleBuffer:v11];
          v13 = (void *)MEMORY[0x1E4F16558];
          v14 = [v12 items];
          v15 = [v13 metadataItemsFromArray:v14 filteredByIdentifier:v25];
          uint64_t v16 = [v15 firstObject];

          v17 = (void *)MEMORY[0x1E4F16558];
          v18 = [v12 items];
          v19 = [v17 metadataItemsFromArray:v18 filteredByIdentifier:v9];
          uint64_t v20 = [v19 firstObject];

          v7 = (void *)v20;
          v8 = (void *)v16;
        }
        CFRelease(v11);
        if (v8)
        {
          if (v7) {
            break;
          }
        }
      }
      v4 = v22;
      [v22 cancelReading];
      v6 = v23;
      v2 = v24;
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (__n128)pu_perspectiveTransformForMetadata:()PUPerspectiveTransform
{
  v3 = (_OWORD *)MEMORY[0x1E4F14998];
  if (a3)
  {
    v4 = [a3 value];
    uint64_t v5 = 0;
    long long v6 = v3[1];
    v13[0] = *v3;
    v13[1] = v6;
    v13[2] = v3[2];
    do
    {
      uint64_t v7 = 0;
      uint64_t v8 = v5;
      do
      {
        uint64_t v9 = [v4 objectAtIndexedSubscript:v8];
        [v9 floatValue];
        *((_DWORD *)&v13[v5] + v7) = v10;

        ++v7;
        v8 += 3;
      }
      while (v7 != 3);
      ++v5;
    }
    while (v5 != 3);
    long long v12 = v13[0];

    return (__n128)v12;
  }
  else
  {
    return *(__n128 *)MEMORY[0x1E4F14998];
  }
}

- (uint64_t)_pu_getVitalityTransform:()PUPerspectiveTransform dimensions:
{
  uint64_t v7 = objc_getAssociatedObject(a1, (const void *)VitalityTransformKey);
  uint64_t v8 = objc_getAssociatedObject(a1, (const void *)DimensionsKey);
  uint64_t v9 = (void *)v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    v11 = objc_msgSend(a1, "pu_stillAssetTransformMetadataPair");
    v13 = v12;
    id v14 = v11;
    if (v11)
    {
      v15 = (void *)MEMORY[0x1E4F29238];
      objc_msgSend(a1, "pu_perspectiveTransformForMetadata:", v14);
      uint64_t v16 = objc_msgSend(v15, "pu_valueWithPUPerspectiveTransform:");

      objc_setAssociatedObject(a1, (const void *)VitalityTransformKey, v16, (void *)1);
      uint64_t v7 = v16;
    }
    id v17 = v13;
    v18 = v17;
    if (v13)
    {
      v19 = [v17 value];

      objc_setAssociatedObject(a1, (const void *)DimensionsKey, v19, (void *)1);
      uint64_t v9 = v19;
    }
  }
  if (v9) {
    BOOL v20 = v7 == 0;
  }
  else {
    BOOL v20 = 1;
  }
  uint64_t v21 = !v20;
  if (!v20)
  {
    objc_msgSend(v7, "pu_PUPerspectiveTransformValue");
    *(_DWORD *)(a3 + 8) = v22;
    *(_DWORD *)(a3 + 24) = v23;
    *(void *)a3 = v24;
    *(void *)(a3 + 16) = v25;
    *(_DWORD *)(a3 + 40) = v26;
    *(void *)(a3 + 32) = v27;
    [v9 sizeValue];
    *a4 = v28;
    a4[1] = v29;
  }

  return v21;
}

- (uint64_t)_pu_isVitalityLimitingAllowed
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F8CC48]) initWithAVAsset:a1 timeZoneLookup:0];
  if (!v2 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    uint64_t v6 = a1;
    _os_log_error_impl(&dword_1AE9F8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Attempted to load vitality limiting from asset %@, but an error occurred", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = [v2 livePhotoVitalityLimitingAllowed];

  return v3;
}

- (void)_pu_handleRequiredPropertiesLoadedWithAdditionalNormalizedTransform:()PUPerspectiveTransform completion:
{
  v115.columns[1] = a3;
  v115.columns[2] = a4;
  v115.columns[0] = a2;
  uint64_t v145 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = a6;
  long long v136 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  uint64_t v8 = _vitalityTransformRequiredProperties();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v136 objects:v142 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v137;
    while (2)
    {
      uint64_t v13 = 0;
      id v14 = v11;
      do
      {
        if (*(void *)v137 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v15 = *(void *)(*((void *)&v136 + 1) + 8 * v13);
        id v135 = v14;
        uint64_t v16 = [a1 statusOfValueForKey:v15 error:&v135];
        id v11 = v135;

        if (v16 != 2)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            *(void *)&buf[4] = a1;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v15;
            *(_WORD *)&buf[22] = 2112;
            *(void *)&buf[24] = v11;
            _os_log_error_impl(&dword_1AE9F8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Attempted to load vitality transform from asset %@, but required property %@ coud not be loaded. Received error: %@", buf, 0x20u);
          }
          v7[2](v7, 0, *MEMORY[0x1E4F14998], *(__n128 *)(MEMORY[0x1E4F14998] + 16), *(__n128 *)(MEMORY[0x1E4F14998] + 32));

          goto LABEL_57;
        }
        ++v13;
        id v14 = v11;
      }
      while (v10 != v13);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v136 objects:v142 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v11 = 0;
  }

  __n128 v17 = *(__n128 *)(MEMORY[0x1E4F14998] + 16);
  float32x4_t v114 = *(float32x4_t *)MEMORY[0x1E4F14998];
  simd_float3 v132 = *(simd_float3 *)MEMORY[0x1E4F14998];
  simd_float3 v133 = (simd_float3)v17;
  float32x4_t v112 = (float32x4_t)v17;
  float32x4_t v113 = *(float32x4_t *)(MEMORY[0x1E4F14998] + 32);
  simd_float3 v134 = (simd_float3)v113;
  if (objc_msgSend(a1, "pu_supportsVitality"))
  {
    long long v131 = *MEMORY[0x1E4F28AE0];
    if (objc_msgSend(a1, "_pu_getVitalityTransform:dimensions:", &v132, &v131))
    {
      long long v129 = 0u;
      float32x4_t v130 = 0u;
      long long v128 = 0u;
      v18 = [MEMORY[0x1E4F8CC38] tracksWithMediaType:*MEMORY[0x1E4F15C18] forAsset:a1];
      v19 = [v18 firstObject];
      BOOL v20 = v19;
      if (v19)
      {
        [v19 preferredTransform];
      }
      else
      {
        long long v129 = 0u;
        float32x4_t v130 = 0u;
        long long v128 = 0u;
      }

      simd_float3 v90 = v133;
      simd_float3 v93 = v132;
      simd_float3 v89 = v134;
      *(_OWORD *)buf = v128;
      *(_OWORD *)&buf[16] = v129;
      float32x4_t v144 = v130;
      long long v22 = v131;
      __int16 v140 = 0;
      float v23 = (double)(int)FigGetRotationAngleAndFlipsFromCGAffineTransform() * 0.0174532925;
      v24.i64[0] = 0xBF000000BF000000;
      v24.i64[1] = v113.u32[2] | 0xBF00000000000000;
      simd_float3 v110 = v24;
      __float2 v26 = __sincosf_stret(v23);
      v25.i64[0] = __PAIR64__(LODWORD(v26.__sinval), LODWORD(v26.__cosval));
      v27.f32[0] = -v26.__sinval;
      v27.i32[1] = LODWORD(v26.__cosval);
      __asm { FMOV            V4.4S, #-1.0 }
      simd_float3 v102 = (simd_float3)v114;
      if ((_BYTE)v140)
      {
        v33.i64[0] = __PAIR64__(v114.u32[1], _Q4.u32[0]);
        v33.i64[1] = v114.i64[1];
        simd_float3 v102 = v33;
      }
      v25.i32[2] = v114.i32[2];
      simd_float3 v108 = v25;
      v146.columns[1] = (simd_float3)v112;
      v27.i32[2] = v112.i32[2];
      _Q4.i32[0] = v112.i32[0];
      _Q4.i32[2] = v112.i32[2];
      int8x16_t v103 = _Q4;
      simd_float3 v106 = v27;
      v146.columns[2] = v110;
      v146.columns[2].i32[3] = 0;
      v146.columns[1].i32[3] = 0;
      __int32 v34 = HIBYTE(v140);
      v146.columns[0] = (simd_float3)v114;
      v146.columns[0].i32[3] = 0;
      float v35 = *(double *)&v22;
      *(float *)_Q4.i32 = 1.0 / v35;
      *(uint64_t *)((char *)_Q4.i64 + 4) = *(uint64_t *)((char *)v114.i64 + 4);
      simd_float3 v88 = (simd_float3)_Q4;
      simd_float3 v100 = v146.columns[0];
      simd_float3 v101 = v146.columns[1];
      simd_float3 v111 = v146.columns[2];
      simd_float3x3 v147 = __invert_f3(v146);
      uint64_t v37 = 0;
      simd_float3 v97 = v147.columns[1];
      simd_float3 v98 = v147.columns[0];
      simd_float3x3 v141 = v147;
      simd_float3 v96 = v147.columns[2];
      memset(buf, 0, sizeof(buf));
      float32x4_t v144 = 0u;
      do
      {
        float32x4_t v38 = (float32x4_t)v141.columns[v37];
        int8x16_t v39 = (int8x16_t)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v114, v38.f32[0]), v112, *(float32x2_t *)v38.f32, 1), v113, v38, 2);
        *(int8x16_t *)&buf[v37 * 16] = v39;
        ++v37;
      }
      while (v37 != 3);
      v38.i32[0] = 0;
      uint64_t v40 = 0;
      v39.i32[0] = v34;
      simd_float3 v41 = (simd_float3)v103;
      int8x16_t v42 = vbslq_s8(vdupq_lane_s8((int8x8_t)*(_OWORD *)&vceqq_s8(v39, (int8x16_t)v38), 0), (int8x16_t)v112, v103);
      v42.i32[3] = v112.i32[3];
      __asm { FMOV            V19.4S, #1.0 }
      _Q19.i32[0] = v113.i32[0];
      _Q19.i32[2] = v113.i32[2];
      simd_float3 v44 = v108;
      v44.i32[3] = 0;
      float32x4_t v45 = *(float32x4_t *)buf;
      float32x4_t v46 = *(float32x4_t *)&buf[16];
      float32x4_t v47 = v144;
      v141.columns[0] = (simd_float3)v114;
      v141.columns[1] = (simd_float3)v42;
      simd_float3 v99 = (simd_float3)v42;
      v141.columns[2] = (simd_float3)v113;
      memset(buf, 0, sizeof(buf));
      float32x4_t v144 = 0u;
      do
      {
        *(float32x4_t *)&buf[v40 * 16] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v45, COERCE_FLOAT(*(_OWORD *)&v141.columns[v40])), v46, *(float32x2_t *)v141.columns[v40].f32, 1), v47, (float32x4_t)v141.columns[v40], 2);
        ++v40;
      }
      while (v40 != 3);
      uint64_t v48 = 0;
      v49.columns[1].i32[0] = v112.i32[0];
      float v36 = *((double *)&v22 + 1);
      v49.columns[1].f32[1] = 1.0 / v36;
      v49.columns[1].i32[2] = v112.i32[2];
      v49.columns[0] = *(simd_float3 *)buf;
      v49.columns[2] = *(simd_float3 *)&buf[16];
      float32x4_t v50 = v144;
      v141.columns[0] = v102;
      v141.columns[1] = (simd_float3)v112;
      v141.columns[2] = (simd_float3)v113;
      memset(buf, 0, sizeof(buf));
      float32x4_t v144 = 0u;
      do
      {
        *(float32x4_t *)&buf[v48 * 16] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v49.columns[0], COERCE_FLOAT(*(_OWORD *)&v141.columns[v48])), (float32x4_t)v49.columns[2], *(float32x2_t *)v141.columns[v48].f32, 1), v50, (float32x4_t)v141.columns[v48], 2);
        ++v48;
      }
      while (v48 != 3);
      uint64_t v51 = 0;
      v49.columns[2] = (simd_float3)v113;
      v49.columns[2].i32[3] = 0;
      simd_float3 v52 = v106;
      v52.i32[3] = 0;
      v49.columns[0] = *(simd_float3 *)buf;
      float32x4_t v53 = *(float32x4_t *)&buf[16];
      float32x4_t v54 = v144;
      v141.columns[0] = v44;
      v141.columns[1] = v52;
      simd_float3 v107 = v52;
      v141.columns[2] = v49.columns[2];
      memset(buf, 0, sizeof(buf));
      float32x4_t v144 = 0u;
      do
      {
        *(float32x4_t *)&buf[v51 * 16] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v49.columns[0], COERCE_FLOAT(*(_OWORD *)&v141.columns[v51])), v53, *(float32x2_t *)v141.columns[v51].f32, 1), v54, (float32x4_t)v141.columns[v51], 2);
        ++v51;
      }
      while (v51 != 3);
      uint64_t v55 = 0;
      v41.i32[3] = v112.i32[3];
      float32x4_t v56 = *(float32x4_t *)buf;
      float32x4_t v57 = *(float32x4_t *)&buf[16];
      float32x4_t v58 = v144;
      v141.columns[0] = v100;
      v141.columns[1] = v101;
      v141.columns[2] = v111;
      memset(buf, 0, sizeof(buf));
      float32x4_t v144 = 0u;
      do
      {
        *(float32x4_t *)&buf[v55 * 16] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v56, COERCE_FLOAT(*(_OWORD *)&v141.columns[v55])), v57, *(float32x2_t *)v141.columns[v55].f32, 1), v58, (float32x4_t)v141.columns[v55], 2);
        ++v55;
      }
      while (v55 != 3);
      uint64_t v59 = 0;
      _Q19.i32[3] = v113.i32[3];
      float32x4_t v60 = *(float32x4_t *)buf;
      float32x4_t v61 = *(float32x4_t *)&buf[16];
      float32x4_t v62 = v144;
      v141.columns[0] = (simd_float3)v114;
      v141.columns[1] = v41;
      v141.columns[2] = _Q19;
      memset(buf, 0, sizeof(buf));
      float32x4_t v144 = 0u;
      do
      {
        *(float32x4_t *)&buf[v59 * 16] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v60, COERCE_FLOAT(*(_OWORD *)&v141.columns[v59])), v61, *(float32x2_t *)v141.columns[v59].f32, 1), v62, (float32x4_t)v141.columns[v59], 2);
        ++v59;
      }
      while (v59 != 3);
      uint64_t v63 = 0;
      float32x4_t v64 = *(float32x4_t *)buf;
      float32x4_t v65 = *(float32x4_t *)&buf[16];
      float32x4_t v66 = v144;
      simd_float3x3 v141 = v115;
      memset(buf, 0, sizeof(buf));
      float32x4_t v144 = 0u;
      v49.columns[0] = v88;
      do
      {
        *(float32x4_t *)&buf[v63 * 16] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v64, COERCE_FLOAT(*(_OWORD *)&v141.columns[v63])), v65, *(float32x2_t *)v141.columns[v63].f32, 1), v66, (float32x4_t)v141.columns[v63], 2);
        ++v63;
      }
      while (v63 != 3);
      uint64_t v67 = 0;
      v49.columns[1].i32[3] = 0;
      v49.columns[0].i32[3] = 0;
      float32x4_t v68 = *(float32x4_t *)buf;
      float32x4_t v69 = *(float32x4_t *)&buf[16];
      float32x4_t v70 = v144;
      simd_float3x3 v141 = v49;
      memset(buf, 0, sizeof(buf));
      float32x4_t v144 = 0u;
      do
      {
        *(float32x4_t *)&buf[v67 * 16] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v68, COERCE_FLOAT(*(_OWORD *)&v141.columns[v67])), v69, *(float32x2_t *)v141.columns[v67].f32, 1), v70, (float32x4_t)v141.columns[v67], 2);
        ++v67;
      }
      while (v67 != 3);
      simd_float3 v124 = _Q19;
      simd_float3 v104 = v41;
      simd_float3 v109 = v44;
      uint64_t v71 = 0;
      float32x4_t v72 = *(float32x4_t *)buf;
      float32x4_t v73 = *(float32x4_t *)&buf[16];
      float32x4_t v74 = v144;
      v141.columns[0] = v93;
      v141.columns[1] = v90;
      v141.columns[2] = v89;
      memset(buf, 0, sizeof(buf));
      float32x4_t v144 = 0u;
      do
      {
        *(float32x4_t *)&buf[v71 * 16] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v72, COERCE_FLOAT(*(_OWORD *)&v141.columns[v71])), v73, *(float32x2_t *)v141.columns[v71].f32, 1), v74, (float32x4_t)v141.columns[v71], 2);
        ++v71;
      }
      while (v71 != 3);
      float32x4_t v116 = *(float32x4_t *)buf;
      simd_float3 v121 = v49.columns[2];
      float32x4_t v91 = v144;
      float32x4_t v94 = *(float32x4_t *)&buf[16];
      simd_float3x3 v148 = __invert_f3(v49);
      uint64_t v75 = 0;
      simd_float3x3 v141 = v148;
      memset(buf, 0, sizeof(buf));
      float32x4_t v144 = 0u;
      do
      {
        *(float32x4_t *)&buf[v75 * 16] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v116, COERCE_FLOAT(*(_OWORD *)&v141.columns[v75])), v94, *(float32x2_t *)v141.columns[v75].f32, 1), v91, (float32x4_t)v141.columns[v75], 2);
        ++v75;
      }
      while (v75 != 3);
      float32x4_t v117 = *(float32x4_t *)buf;
      float32x4_t v92 = v144;
      float32x4_t v95 = *(float32x4_t *)&buf[16];
      v149.columns[0] = (simd_float3)v114;
      v149.columns[1] = v104;
      v149.columns[2] = v124;
      simd_float3x3 v150 = __invert_f3(v149);
      uint64_t v76 = 0;
      simd_float3x3 v141 = v150;
      memset(buf, 0, sizeof(buf));
      float32x4_t v144 = 0u;
      do
      {
        *(float32x4_t *)&buf[v76 * 16] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v117, COERCE_FLOAT(*(_OWORD *)&v141.columns[v76])), v95, *(float32x2_t *)v141.columns[v76].f32, 1), v92, (float32x4_t)v141.columns[v76], 2);
        ++v76;
      }
      while (v76 != 3);
      uint64_t v77 = 0;
      float32x4_t v78 = *(float32x4_t *)buf;
      v80.columns[1] = *(simd_float3 *)&buf[16];
      float32x4_t v79 = v144;
      v141.columns[0] = v98;
      v141.columns[1] = v97;
      v141.columns[2] = v96;
      memset(buf, 0, sizeof(buf));
      float32x4_t v144 = 0u;
      v80.columns[0] = v109;
      v80.columns[2] = v121;
      do
      {
        *(float32x4_t *)&buf[v77 * 16] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v78, COERCE_FLOAT(*(_OWORD *)&v141.columns[v77])), (float32x4_t)v80.columns[1], *(float32x2_t *)v141.columns[v77].f32, 1), v79, (float32x4_t)v141.columns[v77], 2);
        ++v77;
      }
      while (v77 != 3);
      float32x4_t v125 = *(float32x4_t *)buf;
      float32x4_t v118 = *(float32x4_t *)&buf[16];
      float32x4_t v105 = v144;
      v80.columns[1] = v107;
      simd_float3x3 v151 = __invert_f3(v80);
      uint64_t v81 = 0;
      simd_float3x3 v141 = v151;
      memset(buf, 0, sizeof(buf));
      float32x4_t v144 = 0u;
      do
      {
        *(float32x4_t *)&buf[v81 * 16] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v125, COERCE_FLOAT(*(_OWORD *)&v141.columns[v81])), v118, *(float32x2_t *)v141.columns[v81].f32, 1), v105, (float32x4_t)v141.columns[v81], 2);
        ++v81;
      }
      while (v81 != 3);
      float32x4_t v122 = *(float32x4_t *)&buf[16];
      float32x4_t v126 = *(float32x4_t *)buf;
      float32x4_t v119 = v144;
      v152.columns[0] = v102;
      v152.columns[1] = (simd_float3)v112;
      v152.columns[2] = (simd_float3)v113;
      simd_float3x3 v153 = __invert_f3(v152);
      uint64_t v82 = 0;
      simd_float3x3 v141 = v153;
      memset(buf, 0, sizeof(buf));
      float32x4_t v144 = 0u;
      do
      {
        *(float32x4_t *)&buf[v82 * 16] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v126, COERCE_FLOAT(*(_OWORD *)&v141.columns[v82])), v122, *(float32x2_t *)v141.columns[v82].f32, 1), v119, (float32x4_t)v141.columns[v82], 2);
        ++v82;
      }
      while (v82 != 3);
      float32x4_t v123 = *(float32x4_t *)&buf[16];
      float32x4_t v127 = *(float32x4_t *)buf;
      float32x4_t v120 = v144;
      v154.columns[2] = (simd_float3)v113;
      v154.columns[0] = (simd_float3)v114;
      v154.columns[1] = v99;
      simd_float3x3 v155 = __invert_f3(v154);
      uint64_t v83 = 0;
      simd_float3x3 v141 = v155;
      memset(buf, 0, sizeof(buf));
      float32x4_t v144 = 0u;
      do
      {
        *(float32x4_t *)&buf[v83 * 16] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v127, COERCE_FLOAT(*(_OWORD *)&v141.columns[v83])), v123, *(float32x2_t *)v141.columns[v83].f32, 1), v120, (float32x4_t)v141.columns[v83], 2);
        ++v83;
      }
      while (v83 != 3);
      uint64_t v84 = 0;
      float32x4_t v85 = *(float32x4_t *)buf;
      float32x4_t v86 = *(float32x4_t *)&buf[16];
      float32x4_t v87 = v144;
      v141.columns[0] = v100;
      v141.columns[1] = v101;
      v141.columns[2] = v111;
      memset(buf, 0, sizeof(buf));
      float32x4_t v144 = 0u;
      do
      {
        *(float32x4_t *)&buf[v84 * 16] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v85, COERCE_FLOAT(*(_OWORD *)&v141.columns[v84])), v86, *(float32x2_t *)v141.columns[v84].f32, 1), v87, (float32x4_t)v141.columns[v84], 2);
        ++v84;
      }
      while (v84 != 3);
      v132.i32[2] = *(_DWORD *)&buf[8];
      v133.i32[2] = *(_DWORD *)&buf[24];
      v132.i64[0] = *(void *)buf;
      v133.i64[0] = *(void *)&buf[16];
      v134.i32[2] = v144.i32[2];
      v134.i64[0] = v144.i64[0];
    }
    uint64_t v21 = objc_msgSend(a1, "_pu_isVitalityLimitingAllowed", *(_OWORD *)&v88);
  }
  else
  {
    uint64_t v21 = 0;
  }
  v7[2](v7, v21, (__n128)v132, (__n128)v133, (__n128)v134);
LABEL_57:
}

- (void)pu_loadNormalizedVitalityPerspectiveTransformWithAdditionalNormalizedTransform:()PUPerspectiveTransform completion:
{
  id v7 = a6;
  uint64_t v8 = _vitalityLoadingQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __125__AVAsset_PUPerspectiveTransform__pu_loadNormalizedVitalityPerspectiveTransformWithAdditionalNormalizedTransform_completion___block_invoke;
  block[3] = &unk_1E5F24628;
  __n128 v14 = a2;
  __n128 v15 = a3;
  __n128 v16 = a4;
  uint64_t v17 = a1;
  id v18 = v7;
  id v9 = v7;
  dispatch_async(v8, block);
}

- (id)pu_stillImageTransformAssetTrack
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [MEMORY[0x1E4F8CC38] tracksWithMediaType:*MEMORY[0x1E4F15BE0] forAsset:a1];
  uint64_t v1 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v21;
    uint64_t v4 = *MEMORY[0x1E4F1F150];
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v21 != v3) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v7 = [v6 formatDescriptions];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v17;
LABEL_8:
          uint64_t v11 = 0;
          while (1)
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = CMMetadataFormatDescriptionGetIdentifiers(*(CMMetadataFormatDescriptionRef *)(*((void *)&v16 + 1) + 8 * v11));
            if ([v12 containsObject:v4]) {
              break;
            }

            if (v9 == ++v11)
            {
              uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
              if (v9) {
                goto LABEL_8;
              }
              goto LABEL_14;
            }
          }
          id v13 = v6;

          if (v13) {
            goto LABEL_19;
          }
        }
        else
        {
LABEL_14:
        }
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v2);
  }
  id v13 = 0;
LABEL_19:

  return v13;
}

- (uint64_t)pu_supportsVitality
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_getAssociatedObject(a1, (const void *)SupportsVitalityKey);
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 BOOLValue];
  }
  else
  {
    int v5 = (void *)[objc_alloc(MEMORY[0x1E4F8CC48]) initWithAVAsset:a1 timeZoneLookup:0];
    uint64_t v6 = v5;
    if (v5)
    {
      uint64_t v4 = [v5 hasVitality];
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        int v10 = 138412290;
        uint64_t v11 = a1;
        _os_log_error_impl(&dword_1AE9F8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Attempted to read vitality disabled metadata from asset %@, but failed", (uint8_t *)&v10, 0xCu);
      }
      uint64_t v4 = 1;
    }
    id v7 = (const void *)SupportsVitalityKey;
    uint64_t v8 = [NSNumber numberWithBool:v4];
    objc_setAssociatedObject(a1, v7, v8, (void *)1);
  }
  return v4;
}

@end