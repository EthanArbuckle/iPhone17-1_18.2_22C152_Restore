@interface CalcHomography
- (CalcHomography)initWithMetalToolBox:(id)a3;
- (__n128)cascadeHomographyMatricesArray:(void *)a3;
- (_homographyData)_ispHomographyFromISPInfoFunc:(id *)a3;
- (_homographyData)ispHomographyFromMetaInfo:(id)a3;
- (double)_scaleHomography:(simd_float3x3)a1 scaleX:(float)a2 scaleY:(float)a3;
- (id)_normalizeHomography:(double)a3 width:(double)a4 height:(double)a5;
@end

@implementation CalcHomography

- (CalcHomography)initWithMetalToolBox:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CalcHomography;
  v5 = [(CalcHomography *)&v9 init];
  if (v5)
  {
    if (v4) {
      v6 = (GGMMetalToolBox *)v4;
    }
    else {
      v6 = objc_alloc_init(GGMMetalToolBox);
    }
    metalToolbox = v5->_metalToolbox;
    v5->_metalToolbox = v6;
  }
  return v5;
}

- (id)_normalizeHomography:(double)a3 width:(double)a4 height:(double)a5
{
  *(float *)&a5 = (float)a8;
  *(float *)&a6 = (float)a9;
  return objc_msgSend(a1, "_scaleHomography:scaleX:scaleY:", a2, a3, a4, a5, a6);
}

- (double)_scaleHomography:(simd_float3x3)a1 scaleX:(float)a2 scaleY:(float)a3
{
  simd_float3 v3 = a1.columns[1];
  simd_float3 v4 = a1.columns[0];
  uint64_t v5 = 0;
  a1.columns[0].i32[1] = 0;
  a1.columns[0].i64[1] = 0;
  a1.columns[0].f32[0] = 1.0 / a2;
  a1.columns[1].i32[0] = 0;
  a1.columns[1].i64[1] = 0;
  a1.columns[1].f32[1] = 1.0 / a3;
  v11.columns[0] = v4;
  v11.columns[1] = v3;
  v11.columns[2] = a1.columns[2];
  float32x4_t v12 = 0u;
  float32x4_t v13 = 0u;
  float32x4_t v14 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v12 + v5 * 16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)a1.columns[0], COERCE_FLOAT(*(_OWORD *)&v11.columns[v5])), (float32x4_t)a1.columns[1], *(float32x2_t *)v11.columns[v5].f32, 1), (float32x4_t)xmmword_2E260, (float32x4_t)v11.columns[v5], 2);
    ++v5;
  }
  while (v5 != 3);
  a1.columns[2] = (simd_float3)xmmword_2E260;
  float32x4_t v9 = v13;
  float32x4_t v10 = v12;
  float32x4_t v8 = v14;
  simd_float3x3 v15 = __invert_f3(a1);
  uint64_t v6 = 0;
  simd_float3x3 v11 = v15;
  float32x4_t v12 = 0u;
  float32x4_t v13 = 0u;
  float32x4_t v14 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v12 + v6 * 16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v10, COERCE_FLOAT(*(_OWORD *)&v11.columns[v6])), v9, *(float32x2_t *)v11.columns[v6].f32, 1), v8, (float32x4_t)v11.columns[v6], 2);
    ++v6;
  }
  while (v6 != 3);
  return *(double *)v12.i64;
}

- (_homographyData)_ispHomographyFromISPInfoFunc:(id *)a3
{
  uint64_t v6 = v3;
  uint64_t v7 = 0;
  *(_OWORD *)(v6 + 32) = 0u;
  *(_OWORD *)(v6 + 48) = 0u;
  *(_OWORD *)uint64_t v6 = 0u;
  *(_OWORD *)(v6 + 16) = 0u;
  float32x4_t v33 = 0u;
  float32x4_t v34 = 0u;
  float32x4_t v32 = 0u;
  do
  {
    v32.i32[4 * (v7 % 3u) + v7 / 3u] = LODWORD(a3->var0.var0[v7]);
    ++v7;
  }
  while (v7 != 9);
  uint64_t v8 = 0;
  v9.i32[0] = 0;
  v9.i32[3] = 0;
  *(uint64_t *)((char *)v9.i64 + 4) = LODWORD(a3->var3.var3[4]);
  float var2 = a3->var0.var2;
  __asm { FMOV            V3.4S, #1.0 }
  v16.i64[1] = _Q3.i64[1];
  v16.i32[0] = LODWORD(a3->var3.var3[2]);
  v4.i32[0] = LODWORD(a3->var3.var3[0]);
  v16.i32[1] = LODWORD(a3->var3.var3[5]);
  v5.i32[0] = LODWORD(a3->var3.var1[0]);
  v17.i32[0] = 0;
  v17.i32[3] = 0;
  *(uint64_t *)((char *)v17.i64 + 4) = LODWORD(a3->var3.var1[4]);
  _Q3.i32[0] = LODWORD(a3->var3.var1[2]);
  _Q3.i32[1] = LODWORD(a3->var3.var1[5]);
  v35.columns[0] = v5;
  v35.columns[1] = v17;
  v35.columns[2] = _Q3;
  memset(&v36, 0, sizeof(v36));
  do
  {
    v36.columns[v8] = (simd_float3)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(*(_OWORD *)&v35.columns[v8])), v9, *(float32x2_t *)v35.columns[v8].f32, 1), v16, (float32x4_t)v35.columns[v8], 2);
    ++v8;
  }
  while (v8 != 3);
  float32x4_t v30 = (float32x4_t)v36.columns[1];
  float32x4_t v31 = (float32x4_t)v36.columns[0];
  float32x4_t v29 = (float32x4_t)v36.columns[2];
  simd_float3x3 v38 = __invert_f3(v36);
  uint64_t v18 = 0;
  v38.columns[0].i32[3] = 0;
  v38.columns[1].i32[3] = 0;
  v38.columns[2].i32[3] = 0;
  float32x4_t v19 = v32;
  float32x4_t v20 = v33;
  float32x4_t v21 = v34;
  simd_float3x3 v35 = v38;
  memset(&v36, 0, sizeof(v36));
  do
  {
    v36.columns[v18] = (simd_float3)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v19, COERCE_FLOAT(*(_OWORD *)&v35.columns[v18])), v20, *(float32x2_t *)v35.columns[v18].f32, 1), v21, (float32x4_t)v35.columns[v18], 2);
    ++v18;
  }
  while (v18 != 3);
  uint64_t v22 = 0;
  simd_float3 v23 = v36.columns[0];
  simd_float3 v24 = v36.columns[1];
  v23.i32[3] = 0;
  v24.i32[3] = 0;
  simd_float3 v25 = v36.columns[2];
  v25.i32[3] = 0;
  v35.columns[0] = v23;
  v35.columns[1] = v24;
  v35.columns[2] = v25;
  memset(&v36, 0, sizeof(v36));
  do
  {
    v36.columns[v22] = (simd_float3)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v31, COERCE_FLOAT(*(_OWORD *)&v35.columns[v22])), v30, *(float32x2_t *)v35.columns[v22].f32, 1), v29, (float32x4_t)v35.columns[v22], 2);
    ++v22;
  }
  while (v22 != 3);
  simd_float3x3 v39 = v36;
  *(float *)(v6 + 48) = var2;
  simd_float3x3 v40 = __invert_f3(v39);
  int32x4_t v26 = vdupq_laneq_s32((int32x4_t)v40.columns[0], 2);
  unint64_t v27 = vzip1q_s32((int32x4_t)v40.columns[0], (int32x4_t)v40.columns[1]).u64[0];
  unint64_t v28 = vtrn2q_s32((int32x4_t)v40.columns[0], (int32x4_t)v40.columns[1]).u64[0];
  *(_DWORD *)(v6 + 8) = v40.columns[2].i32[0];
  *(_DWORD *)(v6 + 24) = v40.columns[2].i32[1];
  *(void *)uint64_t v6 = v27;
  *(void *)(v6 + 16) = v28;
  *(_DWORD *)(v6 + 40) = v40.columns[2].i32[2];
  *(void *)(v6 + 32) = vzip1q_s32(v26, vdupq_laneq_s32((int32x4_t)v40.columns[1], 2)).u64[0];
  return (_homographyData)v28;
}

- (_homographyData)ispHomographyFromMetaInfo:(id)a3
{
  simd_float3 v5 = v3;
  id v6 = a3;
  v5[3].i64[0] = 0;
  v5[3].i64[1] = 0;
  simd_float3 v7 = matrix_identity_float3x3.columns[1];
  simd_float3 *v5 = matrix_identity_float3x3.columns[0];
  v5[1] = v7;
  v5[2] = matrix_identity_float3x3.columns[2];
  memset(v18, 0, 512);
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v8 = [v6 objectForKeyedSubscript:@"IspScalerInfo"];
  if (!v8)
  {
    fig_log_get_emitter();
LABEL_11:
    FigDebugAssert3();
    goto LABEL_7;
  }
  float32x4_t v9 = v8;
  if ([v8 length] != &stru_1F8.reserved2)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    goto LABEL_7;
  }
  [v9 getBytes:v18 length:576];
  float32x4_t v10 = [v6 objectForKeyedSubscript:@"MetaConfig"];

  if (!v10)
  {
    fig_log_get_emitter();
    goto LABEL_11;
  }
  [v10 getBytes:&v16 length:16];
  if (v17)
  {
    [(CalcHomography *)self _ispHomographyFromISPInfoFunc:v18];
    simd_float3 *v5 = v12;
    v5[1] = v13;
    v5[2] = v14;
    v5[3] = v15;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }

LABEL_7:
  return v11;
}

- (__n128)cascadeHomographyMatricesArray:(void *)a3
{
  id v3 = a3;
  float32x4_t v9 = (float32x4_t)matrix_identity_float3x3.columns[1];
  float32x4_t v10 = (float32x4_t)matrix_identity_float3x3.columns[0];
  float32x4_t v8 = (float32x4_t)matrix_identity_float3x3.columns[2];
  simd_float3 v11 = matrix_identity_float3x3.columns[0];
  float32x4_t v12 = v9;
  simd_float3 v13 = matrix_identity_float3x3.columns[2];
  if ([v3 count])
  {
    if ([v3 count])
    {
      unint64_t v4 = 0;
      do
      {
        simd_float3 v5 = [v3 objectAtIndexedSubscript:v4];
        [v5 getBytes:&v11 length:48];

        uint64_t v6 = 0;
        v14[0] = v11;
        v14[1] = v12;
        v14[2] = v13;
        float32x4_t v15 = 0u;
        float32x4_t v16 = 0u;
        float32x4_t v17 = 0u;
        do
        {
          *(float32x4_t *)((char *)&v15 + v6 * 16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v10, COERCE_FLOAT(v14[v6])), v9, *(float32x2_t *)&v14[v6], 1), v8, (float32x4_t)v14[v6], 2);
          ++v6;
        }
        while (v6 != 3);
        float32x4_t v9 = v16;
        float32x4_t v10 = v15;
        ++v4;
        float32x4_t v8 = v17;
      }
      while ((unint64_t)[v3 count] > v4);
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }

  return (__n128)v10;
}

- (void).cxx_destruct
{
}

@end