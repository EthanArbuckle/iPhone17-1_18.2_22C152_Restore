@interface MitigationCPU
- (MitigationCPU)initWithMetalToolBox:(id)a3;
- (MitigationCPU)initWithMetalToolBox:(id)a3 mitigationGPU:(id)a4;
- (void)hybridMitigationYUVInplaceInput:(id)a3 frRefTPlusOrMinus1:(id)a4 frRefTPlusOrMinus2:(id)a5 trRefTPlusOrMinus1:(id)a6 trRefTPlusOrMinus2:(id)a7 meta:(id)a8 metaTPlusOrMinus1:(id)a9 metaTPlusOrMinus2:(id)a10 info:(id)a11 infoTPlusOrMinus1:(id)a12 infoTPlusOrMinus2:(id)a13 config:(id *)a14 trInput:(id)a15 usePastAsRef:(BOOL)a16;
@end

@implementation MitigationCPU

- (MitigationCPU)initWithMetalToolBox:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MitigationCPU;
  v5 = [(MitigationCPU *)&v12 init];
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

    v8 = [[CalcHomography alloc] initWithMetalToolBox:v5->_metalToolbox];
    calcTransform = v5->_calcTransform;
    v5->_calcTransform = v8;

    v10 = v5;
  }

  return v5;
}

- (MitigationCPU)initWithMetalToolBox:(id)a3 mitigationGPU:(id)a4
{
  objc_storeStrong((id *)&self->_mitigationGPU, a4);
  id v6 = a3;
  v7 = [(MitigationCPU *)self initWithMetalToolBox:v6];

  return v7;
}

- (void)hybridMitigationYUVInplaceInput:(id)a3 frRefTPlusOrMinus1:(id)a4 frRefTPlusOrMinus2:(id)a5 trRefTPlusOrMinus1:(id)a6 trRefTPlusOrMinus2:(id)a7 meta:(id)a8 metaTPlusOrMinus1:(id)a9 metaTPlusOrMinus2:(id)a10 info:(id)a11 infoTPlusOrMinus1:(id)a12 infoTPlusOrMinus2:(id)a13 config:(id *)a14 trInput:(id)a15 usePastAsRef:(BOOL)a16
{
  v56 = self;
  id v64 = a3;
  id v63 = a4;
  id v62 = a5;
  id v61 = a6;
  id v60 = a7;
  id v58 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  id v25 = a13;
  id v26 = a15;
  id v59 = v23;
  id v57 = v25;
  if (a14->var1.var1)
  {
    v27 = v24;
    simd_float3 v28 = matrix_identity_float3x3.columns[0];
    simd_float3 v29 = matrix_identity_float3x3.columns[1];
    simd_float3 v30 = matrix_identity_float3x3.columns[2];
    v31 = v56;
  }
  else
  {
    v31 = v56;
    calcTransform = v56->_calcTransform;
    if (a16)
    {
      v33 = [v23 objectForKeyedSubscript:@"MetaData"];
      if (calcTransform)
      {
        [(CalcHomography *)calcTransform ispHomographyFromMetaInfo:v33];
        v55.columns[0] = v73;
        v55.columns[1] = v72;
        v55.columns[2] = v74;
      }
      else
      {
        memset(&v55, 0, sizeof(v55));
      }

      v35 = v56->_calcTransform;
      v36 = [v24 objectForKeyedSubscript:@"MetaData"];
      if (v35)
      {
        [(CalcHomography *)v35 ispHomographyFromMetaInfo:v36];
        float32x4_t v46 = v69;
        float32x4_t v49 = v70;
        float32x4_t v52 = v71;
      }
      else
      {
        float32x4_t v49 = 0u;
        float32x4_t v52 = 0u;
        float32x4_t v46 = 0u;
      }
      v27 = v24;

      uint64_t v39 = 0;
      v29.i64[0] = v55.columns[0].i64[0];
      v28.i64[0] = v55.columns[1].i64[0];
      simd_float3 v75 = v55.columns[1];
      simd_float3 v76 = v55.columns[0];
      v30.i64[0] = v55.columns[2].i64[0];
      simd_float3 v77 = v55.columns[2];
      simd_float3 v78 = 0u;
      simd_float3 v79 = 0u;
      simd_float3 v80 = 0u;
      do
      {
        *(float32x4_t *)((char *)&v78 + v39 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v46, COERCE_FLOAT(*(_OWORD *)((char *)&v75 + v39 * 4))), v49, *(float32x2_t *)&v75.f32[v39], 1), v52, *(float32x4_t *)((char *)&v75 + v39 * 4), 2);
        v39 += 4;
      }
      while (v39 != 12);
    }
    else
    {
      v34 = [v24 objectForKeyedSubscript:@"MetaData"];
      if (calcTransform)
      {
        [(CalcHomography *)calcTransform ispHomographyFromMetaInfo:v34];
        simd_float3x3 v55 = v68;
      }
      else
      {
        memset(&v55, 0, sizeof(v55));
      }

      v37 = v56->_calcTransform;
      v38 = [v25 objectForKeyedSubscript:@"MetaData"];
      if (v37)
      {
        [(CalcHomography *)v37 ispHomographyFromMetaInfo:v38];
        simd_float3 v47 = v65;
        simd_float3 v50 = v66;
        simd_float3 v53 = v67;
      }
      else
      {
        simd_float3 v50 = 0u;
        simd_float3 v53 = 0u;
        simd_float3 v47 = 0u;
      }
      v27 = v24;

      uint64_t v40 = 0;
      simd_float3 v75 = v47;
      simd_float3 v76 = v50;
      simd_float3 v77 = v53;
      simd_float3 v78 = 0u;
      simd_float3 v79 = 0u;
      simd_float3 v80 = 0u;
      simd_float3x3 v41 = v55;
      do
      {
        *(float32x4_t *)((char *)&v78 + v40 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v55.columns[0], COERCE_FLOAT(*(_OWORD *)((char *)&v75 + v40 * 4))), (float32x4_t)v55.columns[1], *(float32x2_t *)&v75.f32[v40], 1), (float32x4_t)v55.columns[2], *(float32x4_t *)((char *)&v75 + v40 * 4), 2);
        v40 += 4;
      }
      while (v40 != 12);
      simd_float3 v42 = v78;
      simd_float3 v43 = v79;
      simd_float3 v44 = v80;
      v42.i32[3] = 0;
      v43.i32[3] = 0;
      simd_float3 v51 = v43;
      simd_float3 v54 = v42;
      v44.i32[3] = 0;
      simd_float3 v48 = v44;
      simd_float3x3 v81 = __invert_f3(v41);
      v55.columns[0].i64[0] = v81.columns[1].i64[0];
      v55.columns[1].i64[0] = v81.columns[0].i64[0];
      v55.columns[2].i64[0] = v81.columns[2].i64[0];
      v81.columns[1] = v51;
      v81.columns[0] = v54;
      v81.columns[2] = v48;
      __invert_f3(v81);
      v29.i64[0] = v55.columns[0].i64[0];
      v28.i64[0] = v55.columns[1].i64[0];
      v30.i64[0] = v55.columns[2].i64[0];
    }
  }
  LOBYTE(v45) = 0;
  -[MitigationGPU spatialTemporalRepairThenFuseInplaceYUVInput:frRef0:frRef1:trRef0:trRef1:hmgrphy0:hmgrphy1:metaBuf:ref0MetaBuf:ref1MetaBuf:trInput:waitForComplete:](v31->_mitigationGPU, "spatialTemporalRepairThenFuseInplaceYUVInput:frRef0:frRef1:trRef0:trRef1:hmgrphy0:hmgrphy1:metaBuf:ref0MetaBuf:ref1MetaBuf:trInput:waitForComplete:", v64, v63, v62, v61, v60, v58, *(double *)v28.i64, *(double *)v29.i64, *(double *)v30.i64, v21, v22, v26, v45);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calcTransform, 0);
  objc_storeStrong((id *)&self->_metalToolbox, 0);

  objc_storeStrong((id *)&self->_mitigationGPU, 0);
}

@end