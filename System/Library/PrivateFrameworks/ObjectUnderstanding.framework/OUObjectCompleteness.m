@interface OUObjectCompleteness
- (BOOL)checkBoxFaceCompleteness:(uint64_t)a3 faceIndex:(int)a4 boxType:(void *)a5 pointCloud:(void *)a6;
- (uint64_t)isPointInCameraView:(simd_float4)a3 cameraPose:(simd_float4)a4 camera:(simd_float4)a5 marginRatio:(float)a6;
- (void)updateRawCornersStatus:(float32x4_t)a3 withOldObjects:(float32x4_t)a4 cameraPose:(double)a5 camera:(uint64_t)a6;
- (void)updateRawCornersStatusNoTimer:(float32x4_t)a3 withOldObjects:(float32x4_t)a4 cameraPose:(double)a5 camera:(uint64_t)a6;
- (void)updateRawFacesStatus:(double)a3 withOldObjects:(double)a4 pointCloud:(double)a5 cameraPose:(uint64_t)a6 camera:(void *)a7;
@end

@implementation OUObjectCompleteness

- (uint64_t)isPointInCameraView:(simd_float4)a3 cameraPose:(simd_float4)a4 camera:(simd_float4)a5 marginRatio:(float)a6
{
  v29.columns[2] = a4;
  v29.columns[3] = a5;
  v29.columns[0] = a2;
  v29.columns[1] = a3;
  id v10 = a9;
  simd_float4x4 v36 = __invert_f4(v29);
  float32x4_t v35 = vaddq_f32((float32x4_t)v36.columns[3], vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v36.columns[0], a1.f32[0]), (float32x4_t)v36.columns[1], *(float32x2_t *)a1.f32, 1), (float32x4_t)v36.columns[2], a1, 2));
  if (v35.f32[2] <= 0.01) {
    goto LABEL_9;
  }
  [v10 intrinsics];
  float v33 = v11;
  [v10 intrinsics];
  float v32 = v12;
  [v10 intrinsics];
  float32x2_t v31 = v13;
  [v10 intrinsics];
  objc_msgSend(v10, "imageResolution", v14);
  double v16 = v15;
  [v10 imageResolution];
  double v18 = v17;
  float v19 = (float)(vmuls_n_f32(v35.f32[0], v33) / v35.f32[2]) + v32;
  double v20 = a6;
  float v21 = v16 * a6;
  if (v19 < v21) {
    goto LABEL_9;
  }
  [v10 imageResolution];
  float v22 = (float)(vmuls_lane_f32(v35.f32[1], v31, 1) / v35.f32[2]) + v30;
  float v23 = v18 * v20;
  BOOL v25 = v24 - v21 <= v19 || v22 < v23;
  if (v25 || ([v10 imageResolution], v26 - v23 <= v22)) {
LABEL_9:
  }
    uint64_t v27 = 0;
  else {
    uint64_t v27 = 1;
  }

  return v27;
}

- (void)updateRawCornersStatusNoTimer:(float32x4_t)a3 withOldObjects:(float32x4_t)a4 cameraPose:(double)a5 camera:(uint64_t)a6
{
  id v64 = a7;
  id v62 = a8;
  id v11 = a9;
  unint64_t v12 = vaddq_f32(a4, vmlaq_f32(vmulq_f32(a2, (float32x4_t)0), (float32x4_t)0, a3)).u64[0];
  float v13 = 1.57079633 - atan2f(*((float *)&v12 + 1), *(float *)&v12);
  v14.i64[0] = 0;
  v14.i32[2] = 0;
  *(float *)&v14.i32[3] = -*(float *)&a5;
  v15.i64[0] = 0;
  v15.i32[2] = 0;
  *(float *)&v15.i32[3] = -*((float *)&a5 + 1);
  int32x4_t v68 = vzip2q_s32(v14, (int32x4_t)xmmword_237CB44B0);
  int32x4_t v70 = vzip2q_s32(v15, (int32x4_t)xmmword_237CB4480);
  __float2 v18 = __sincosf_stret(v13);
  *(float *)v17.i32 = v18.__cosval;
  *(__float2 *)v16.i8 = v18;
  uint64_t v19 = 0;
  *(float *)&v17.i32[1] = -v18.__sinval;
  int32x4_t v20 = vzip1q_s32(v17, (int32x4_t)0);
  float32x2x2_t v21 = (float32x2x2_t)vzip1q_s32(v16, (int32x4_t)0);
  float32x4_t v22 = (float32x4_t)vzip1q_s32(v20, (int32x4_t)v21);
  float32x4_t v23 = (float32x4_t)vzip2q_s32(v20, (int32x4_t)v21);
  v81[0] = xmmword_237CB4490;
  v81[1] = xmmword_237CB44A0;
  double v24 = (float *)v82;
  v21.val[0] = (float32x2_t)v68.i64[0];
  uint64_t v25 = v70.i64[0];
  vst2_f32(v24, v21);
  v82[1] = vzip2q_s32(v68, v70);
  do
  {
    v76.columns[v19] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v22, COERCE_FLOAT(v81[v19])), v23, *(float32x2_t *)&v81[v19], 1), (float32x4_t)xmmword_237CB44B0, (float32x4_t)v81[v19], 2), (float32x4_t)xmmword_237CB4480, (float32x4_t)v81[v19], 3);
    ++v19;
  }
  while (v19 != 4);
  float32x4_t v71 = (float32x4_t)v76.columns[0];
  float32x4_t v67 = (float32x4_t)v76.columns[2];
  float32x4_t v69 = (float32x4_t)v76.columns[1];
  float32x4_t v66 = (float32x4_t)v76.columns[3];
  __invert_f4(v76);
  v61 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v62, "count"));
  for (unint64_t i = 0; [v62 count] > i; ++i)
  {
    uint64_t v27 = [v62 objectAtIndexedSubscript:i];
    v28 = [v62 objectAtIndexedSubscript:i];
    simd_float4x4 v29 = [v28 identifier];
    [v61 setObject:v27 forKey:v29];
  }
  unint64_t v65 = 0;
  uint64_t v30 = MEMORY[0x263EFFA88];
  uint64_t v31 = MEMORY[0x263EFFA80];
  while ([v64 count] > v65)
  {
    float v32 = objc_msgSend(v64, "objectAtIndexedSubscript:");
    float v33 = [v32 identifier];
    v34 = [v61 objectForKey:v33];

    v63 = [v64 objectAtIndexedSubscript:v65];
    float32x4_t v35 = [v63 boxesDict];
    simd_float4x4 v36 = [v35 objectForKey:@"rawdetection"];

    if (v36)
    {
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      memset(&v76, 0, sizeof(v76));
      v37 = [v63 boxesDict];
      v38 = [v37 objectForKeyedSubscript:@"rawdetection"];
      box3dFromNSArray(v38, (uint64_t)&v76);

      v39 = objc_opt_new();
      for (uint64_t j = 0; j != 8; ++j)
      {
        if (v11)
        {
          LODWORD(v40) = 0.125;
          if (objc_msgSend(a1, "isPointInCameraView:cameraPose:camera:marginRatio:", v11, *(double *)v76.columns[j].i64, *(double *)a2.i64, *(double *)a3.i64, *(double *)a4.i64, a5, v40))uint64_t v42 = v30; {
          else
          }
            uint64_t v42 = v31;
        }
        else
        {
          unint64_t v43 = vaddq_f32(v66, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v71, COERCE_FLOAT(*(_OWORD *)&v76.columns[j])), v69, *(float32x2_t *)v76.columns[j].f32, 1), v67, (float32x4_t)v76.columns[j], 2)).u64[0];
          if (fabsf(*(float *)&v43 / *((float *)&v43 + 1)) >= 0.483 || *((float *)&v43 + 1) <= 0.0) {
            uint64_t v42 = v31;
          }
          else {
            uint64_t v42 = v30;
          }
        }
        [v39 addObject:v42];
      }
      v45 = (void *)[v39 copy];
      objc_msgSend(v63, "setCorners_status:", v45);
    }
    if (v34)
    {
      v46 = objc_msgSend(v34, "corners_status");
      uint64_t v47 = [v46 count];

      if (v47 == 8)
      {
        v48 = objc_msgSend(v63, "corners_status");
        uint64_t v49 = [v48 count];

        if (v49 == 8)
        {
          v50 = objc_opt_new();
          for (uint64_t k = 0; k != 8; ++k)
          {
            v52 = v34;
            v53 = objc_msgSend(v34, "corners_status");
            v54 = [v53 objectAtIndexedSubscript:k];
            int v55 = [v54 BOOLValue];

            if (v55)
            {
              [v50 addObject:v30];
            }
            else
            {
              v56 = [v64 objectAtIndexedSubscript:v65];
              v57 = objc_msgSend(v56, "corners_status");
              v58 = [v57 objectAtIndexedSubscript:k];
              [v50 addObject:v58];
            }
            v34 = v52;
          }
          v59 = (void *)[v50 copy];
          objc_msgSend(v63, "setCorners_status:", v59);
        }
        else
        {
          v50 = objc_msgSend(v34, "corners_status");
          v59 = (void *)[v50 copy];
          objc_msgSend(v63, "setCorners_status:", v59);
        }
      }
    }

    ++v65;
  }
}

- (void)updateRawCornersStatus:(float32x4_t)a3 withOldObjects:(float32x4_t)a4 cameraPose:(double)a5 camera:(uint64_t)a6
{
  id v67 = a7;
  id v11 = a8;
  id v12 = a9;
  unint64_t v13 = vaddq_f32(a4, vmlaq_f32(vmulq_f32(a2, (float32x4_t)0), (float32x4_t)0, a3)).u64[0];
  float v14 = 1.57079633 - atan2f(*((float *)&v13 + 1), *(float *)&v13);
  v15.i64[0] = 0;
  v15.i32[2] = 0;
  *(float *)&v15.i32[3] = -*(float *)&a5;
  v16.i64[0] = 0;
  v16.i32[2] = 0;
  *(float *)&v16.i32[3] = -*((float *)&a5 + 1);
  int32x4_t v72 = vzip2q_s32(v15, (int32x4_t)xmmword_237CB44B0);
  int32x4_t v74 = vzip2q_s32(v16, (int32x4_t)xmmword_237CB4480);
  __float2 v19 = __sincosf_stret(v14);
  *(float *)v18.i32 = v19.__cosval;
  *(__float2 *)v17.i8 = v19;
  unint64_t v20 = 0;
  *(float *)&v18.i32[1] = -v19.__sinval;
  int32x4_t v21 = vzip1q_s32(v18, (int32x4_t)0);
  float32x2x2_t v22 = (float32x2x2_t)vzip1q_s32(v17, (int32x4_t)0);
  float32x4_t v23 = (float32x4_t)vzip1q_s32(v21, (int32x4_t)v22);
  float32x4_t v24 = (float32x4_t)vzip2q_s32(v21, (int32x4_t)v22);
  *(_OWORD *)buf = xmmword_237CB4490;
  long long v87 = xmmword_237CB44A0;
  uint64_t v25 = (float *)v88;
  v22.val[0] = (float32x2_t)v72.i64[0];
  uint64_t v26 = v74.i64[0];
  vst2_f32(v25, v22);
  v88[1] = vzip2q_s32(v72, v74);
  do
  {
    v81.columns[v20 / 0x10] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v23, COERCE_FLOAT(*(_OWORD *)&buf[v20])), v24, *(float32x2_t *)&buf[v20], 1), (float32x4_t)xmmword_237CB44B0, *(float32x4_t *)&buf[v20], 2), (float32x4_t)xmmword_237CB4480, *(float32x4_t *)&buf[v20], 3);
    v20 += 16;
  }
  while (v20 != 64);
  float32x4_t v71 = (float32x4_t)v81.columns[1];
  float32x4_t v73 = (float32x4_t)v81.columns[0];
  float32x4_t v69 = (float32x4_t)v81.columns[3];
  float32x4_t v70 = (float32x4_t)v81.columns[2];
  __invert_f4(v81);
  id v64 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v11, "count"));
  unint64_t v65 = v11;
  for (unint64_t i = 0; [v65 count] > i; ++i)
  {
    v28 = [v65 objectAtIndexedSubscript:i];
    simd_float4x4 v29 = [v65 objectAtIndexedSubscript:i];
    uint64_t v30 = [v29 identifier];
    [v64 setObject:v28 forKey:v30];
  }
  unint64_t v31 = 0;
  id v62 = &buf[1];
  uint64_t v32 = MEMORY[0x263EFFA80];
  uint64_t v33 = MEMORY[0x263EFFA88];
  v34 = v65;
  while (objc_msgSend(v67, "count", v62) > v31)
  {
    float32x4_t v35 = [v67 objectAtIndexedSubscript:v31];
    simd_float4x4 v36 = [v35 identifier];
    float32x4_t v66 = [v64 objectForKey:v36];

    int32x4_t v68 = [v67 objectAtIndexedSubscript:v31];
    v37 = [v68 boxesDict];
    v38 = [v37 objectForKey:@"rawdetection"];

    if (v38)
    {
      if (v66)
      {
        v39 = objc_msgSend(v66, "corners_history");
        double v40 = (void *)[v39 copy];
        objc_msgSend(v68, "setCorners_history:", v40);
      }
      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      memset(&v81, 0, sizeof(v81));
      v41 = [v68 boxesDict];
      uint64_t v42 = [v41 objectForKeyedSubscript:@"rawdetection"];
      box3dFromNSArray(v42, (uint64_t)&v81);

      unint64_t v43 = objc_msgSend(v68, "corners_history");
      v44 = (void *)[v43 mutableCopy];

      v45 = [MEMORY[0x263EFF910] date];
      [v45 timeIntervalSince1970];
      double v47 = v46;
      unint64_t v63 = v31;

      v48 = objc_opt_new();
      uint64_t v50 = 0;
      v51 = (float32x2_t *)&v81;
      do
      {
        if (v12)
        {
          LODWORD(v49) = 0.125;
          int v52 = objc_msgSend(a1, "isPointInCameraView:cameraPose:camera:marginRatio:", v12, *(double *)v51, *(double *)a2.i64, *(double *)a3.i64, *(double *)a4.i64, a5, v49);
        }
        else
        {
          unint64_t v53 = vaddq_f32(v69, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v73, COERCE_FLOAT(*(_OWORD *)v51->f32)), v71, *v51, 1), v70, *(float32x4_t *)v51->f32, 2)).u64[0];
          int v52 = fabsf(*(float *)&v53 / *((float *)&v53 + 1)) < 0.483 && *((float *)&v53 + 1) > 0.0;
        }
        if (v52) {
          uint64_t v54 = v33;
        }
        else {
          uint64_t v54 = v32;
        }
        int v55 = [v44 objectAtIndexedSubscript:v50];
        long long v80 = *(_OWORD *)v51->f32;
        v56 = [NSNumber numberWithDouble:v47];
        [v55 addCornerStatus:v54 inView:v56 timestamp:*(double *)&v80];

        v57 = [v44 objectAtIndexedSubscript:v50];
        if ([v57 isCompleted]) {
          uint64_t v58 = v33;
        }
        else {
          uint64_t v58 = v32;
        }
        [v48 addObject:v58];

        ++v50;
        v51 += 2;
      }
      while (v50 != 8);
      unint64_t v31 = v63;
      v59 = (void *)[v48 copy];
      objc_msgSend(v68, "setCorners_status:", v59);

      v60 = (void *)[v44 copy];
      objc_msgSend(v68, "setCorners_history:", v60);

      v34 = v65;
    }
    else
    {
      v61 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG)) {
        -[OUObjectCompleteness updateRawCornersStatus:withOldObjects:cameraPose:camera:](buf, v62, v61);
      }
    }
    ++v31;
  }
}

- (void)updateRawFacesStatus:(double)a3 withOldObjects:(double)a4 pointCloud:(double)a5 cameraPose:(uint64_t)a6 camera:(void *)a7
{
  id v68 = a7;
  id v67 = a8;
  id v69 = a9;
  id v77 = a10;
  float32x4_t v66 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v67, "count"));
  for (unint64_t i = 0; [v67 count] > i; ++i)
  {
    int32x4_t v15 = [v67 objectAtIndexedSubscript:i];
    int32x4_t v16 = [v67 objectAtIndexedSubscript:i];
    int32x4_t v17 = [v16 identifier];
    [v66 setObject:v15 forKey:v17];
  }
  unint64_t v18 = 0;
  unint64_t v65 = v91;
  uint64_t v19 = MEMORY[0x263EFFA80];
  while (objc_msgSend(v68, "count", v65) > v18)
  {
    unint64_t v20 = [v68 objectAtIndexedSubscript:v18];
    int32x4_t v21 = [v20 identifier];
    float32x4_t v71 = [v66 objectForKey:v21];

    long long v78 = [v68 objectAtIndexedSubscript:v18];
    float32x2x2_t v22 = [v78 type];
    if ([v22 isEqualToString:@"Cabinet"]) {
      goto LABEL_9;
    }
    float32x4_t v23 = [v78 type];
    if ([v23 isEqualToString:@"Sofa"])
    {

LABEL_9:
      goto LABEL_10;
    }
    unint64_t v63 = [v78 type];
    char v64 = [v63 isEqualToString:@"Table"];

    if ((v64 & 1) == 0) {
      goto LABEL_49;
    }
LABEL_10:
    float32x4_t v24 = [v78 boxesDict];
    uint64_t v25 = [v24 objectForKey:@"rawdetection"];

    if (v25)
    {
      long long v88 = 0u;
      long long v89 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      float32x4_t v82 = 0u;
      long long v83 = 0u;
      uint64_t v26 = [v78 boxesDict];
      uint64_t v27 = [v26 objectForKeyedSubscript:@"rawdetection"];
      box3dFromNSArray(v27, (uint64_t)&v82);

      box3dEnlarge(&v82, 0.02, 0.02, 0.02, v81);
      long long v86 = v81[4];
      long long v87 = v81[5];
      long long v88 = v81[6];
      long long v89 = v81[7];
      float32x4_t v82 = (float32x4_t)v81[0];
      long long v83 = v81[1];
      long long v84 = v81[2];
      long long v85 = v81[3];
      int32x4_t v72 = objc_opt_new();
      uint64_t v29 = 0;
      unint64_t v70 = v18;
      while (1)
      {
        if (!v71) {
          goto LABEL_17;
        }
        uint64_t v30 = objc_msgSend(v71, "faces_status");
        if ([v30 count] != 6) {
          break;
        }
        unint64_t v31 = objc_msgSend(v71, "faces_status");
        uint64_t v32 = [v31 objectAtIndexedSubscript:v29];
        int v33 = [v32 BOOLValue];

        if (!v33) {
          goto LABEL_17;
        }
        [v72 addObject:MEMORY[0x263EFFA88]];
LABEL_30:
        if (++v29 == 6)
        {
          std::vector<int>::value_type __x = 0;
          std::vector<int>::vector((std::vector<int> *)v81, 0xCuLL, &__x);
          for (uint64_t j = 0; j != 6; ++j)
          {
            uint64_t v50 = [v72 objectAtIndexedSubscript:j];
            int v51 = [v50 BOOLValue];

            if (v51)
            {
              uint64_t v52 = kFaceEdgeIndicesMap + 24 * j;
              unint64_t v53 = *(int **)v52;
              uint64_t v54 = *(int **)(v52 + 8);
              if (v53 != v54)
              {
                uint64_t v55 = *(void *)&v81[0];
                do
                {
                  uint64_t v56 = *v53++;
                  ++*(_DWORD *)(v55 + 4 * v56);
                }
                while (v53 != v54);
              }
            }
          }
          v57 = objc_opt_new();
          for (uint64_t k = 0; k != 48; k += 4)
          {
            if (*(int *)(*(void *)&v81[0] + k) <= 1) {
              uint64_t v59 = v19;
            }
            else {
              uint64_t v59 = MEMORY[0x263EFFA88];
            }
            [v57 addObject:v59];
          }
          v60 = (void *)[v72 copy];
          objc_msgSend(v78, "setFaces_status:", v60);

          v61 = (void *)[v57 copy];
          objc_msgSend(v78, "setEdges_status:", v61);

          if (*(void *)&v81[0])
          {
            *((void *)&v81[0] + 1) = *(void *)&v81[0];
            operator delete(*(void **)&v81[0]);
          }

          goto LABEL_49;
        }
      }

LABEL_17:
      uint64_t v34 = kFaceCornerIndicesMap + 24 * v29;
      float32x4_t v35 = *(int **)v34;
      simd_float4x4 v36 = *(int **)(v34 + 8);
      if (*(int **)v34 == v36) {
        goto LABEL_25;
      }
      unsigned int v37 = 0;
      unsigned int v38 = 0;
      do
      {
        uint64_t v39 = *v35;
        LODWORD(v28) = 1011666125;
        int v40 = objc_msgSend(a1, "isPointInCameraView:cameraPose:camera:marginRatio:", v77, *(double *)&v82.i64[2 * v39], a2, a3, a4, a5, v28);
        v41 = objc_msgSend(v78, "corners_status");
        uint64_t v42 = [v41 objectAtIndexedSubscript:v39];
        int v43 = [v42 BOOLValue];
        v38 += v40;

        v37 += v43;
        ++v35;
      }
      while (v35 != v36);
      if (v38 > 3 || (v38 ? (BOOL v44 = v37 >= 2) : (BOOL v44 = 0), v44))
      {
        v80[4] = v86;
        v80[5] = v87;
        v80[6] = v88;
        v80[7] = v89;
        v80[0] = v82;
        v80[1] = v83;
        v80[2] = v84;
        v80[3] = v85;
        uint64_t v45 = [v78 type];
        unint64_t v18 = v70;
        uint64_t v19 = MEMORY[0x263EFFA80];
        double v46 = (void *)v45;
        int v47 = [a1 checkBoxFaceCompleteness:v80 faceIndex:v29 boxType:v45 pointCloud:v69];

        if (v47) {
          uint64_t v48 = MEMORY[0x263EFFA88];
        }
        else {
          uint64_t v48 = v19;
        }
        [v72 addObject:v48];
      }
      else
      {
LABEL_25:
        uint64_t v19 = MEMORY[0x263EFFA80];
        [v72 addObject:MEMORY[0x263EFFA80]];
        unint64_t v18 = v70;
      }
      goto LABEL_30;
    }
    id v62 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG)) {
      -[OUObjectCompleteness updateRawCornersStatus:withOldObjects:cameraPose:camera:](&buf, v65, v62);
    }

LABEL_49:
    ++v18;
  }
}

- (BOOL)checkBoxFaceCompleteness:(uint64_t)a3 faceIndex:(int)a4 boxType:(void *)a5 pointCloud:(void *)a6
{
  id v9 = a5;
  id v10 = a6;
  if (a4 > 5)
  {
    BOOL v23 = 0;
    goto LABEL_35;
  }
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  unint64_t v31 = 0;
  std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&v31, *(const void **)(kFaceCornerIndicesMap + 24 * a4), *(void *)(kFaceCornerIndicesMap + 24 * a4 + 8), (uint64_t)(*(void *)(kFaceCornerIndicesMap + 24 * a4 + 8) - *(void *)(kFaceCornerIndicesMap + 24 * a4)) >> 2);
  __p = 0;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  id v11 = (int *)v31;
  id v12 = v32;
  if (v31 != v32)
  {
    unint64_t v13 = 0;
    do
    {
      uint64_t v14 = *v11;
      if (v13 >= v30)
      {
        uint64_t v15 = (v13 - (unsigned char *)__p) >> 4;
        if ((unint64_t)(v15 + 1) >> 60) {
          std::vector<float>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v16 = (v30 - (unsigned char *)__p) >> 3;
        if (v16 <= v15 + 1) {
          unint64_t v16 = v15 + 1;
        }
        if ((unint64_t)(v30 - (unsigned char *)__p) >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v17 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v17 = v16;
        }
        if (v17) {
          unint64_t v18 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv3_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&v30, v17);
        }
        else {
          unint64_t v18 = 0;
        }
        uint64_t v19 = &v18[16 * v15];
        *(_OWORD *)uint64_t v19 = *(_OWORD *)(a3 + 16 * v14);
        unint64_t v13 = v19 + 16;
        int32x4_t v21 = (char *)__p;
        unint64_t v20 = v29;
        if (v29 != __p)
        {
          do
          {
            long long v22 = *((_OWORD *)v20 - 1);
            v20 -= 16;
            *((_OWORD *)v19 - 1) = v22;
            v19 -= 16;
          }
          while (v20 != v21);
          unint64_t v20 = (char *)__p;
        }
        __p = v19;
        uint64_t v29 = v13;
        uint64_t v30 = &v18[16 * v17];
        if (v20) {
          operator delete(v20);
        }
      }
      else
      {
        *(_OWORD *)unint64_t v13 = *(_OWORD *)(a3 + 16 * v14);
        v13 += 16;
      }
      uint64_t v29 = v13;
      ++v11;
    }
    while (v11 != v12);
  }
  CountPointsNearPlane(v9, (float32x4_t **)&__p, v10, (uint64_t)v25, 0.1);
  if (3 * v26 < v25[2])
  {
    BOOL v23 = 1;
    if (v26 < 6 || (float)((float)v27 / (float)v26) > 0.5) {
      goto LABEL_31;
    }
    goto LABEL_28;
  }
  if (v26 >= 6)
  {
LABEL_28:
    BOOL v23 = v25[0] >= 6 && (float)((float)v25[0] / (float)v25[1]) >= 8.0;
    goto LABEL_31;
  }
  BOOL v23 = 1;
LABEL_31:
  if (__p)
  {
    uint64_t v29 = (char *)__p;
    operator delete(__p);
  }
  if (v31)
  {
    uint64_t v32 = (int *)v31;
    operator delete(v31);
  }
LABEL_35:

  return v23;
}

- (void)updateRawCornersStatus:(os_log_t)log withOldObjects:cameraPose:camera:.cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_237C17000, log, OS_LOG_TYPE_DEBUG, "[3DOD] WARNING: the object needs to have raw box for corner completeness.", buf, 2u);
}

@end