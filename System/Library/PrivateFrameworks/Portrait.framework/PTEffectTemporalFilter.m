@interface PTEffectTemporalFilter
- (PTEffectTemporalFilter)initWithMetalContext:(id)a3 disparitySize:(id *)a4;
- (id)diffuseFiltered;
- (id)disparityFiltered;
- (id)displacementFWD;
- (id)normalFiltered;
- (unsigned)filter:(id)a3 inDisparity:(id)a4 inNormal:(id)a5 filterNormalSpatial:(BOOL)a6 frameIndex:(int)a7 disparityScale:(float)a8;
- (unsigned)filter:(id)a3 inDisparity:(id)a4 inNormal:(id)a5 inDiffuse:(id)a6 filterNormalSpatial:(BOOL)a7 filterDiffuseSpatial:(BOOL)a8 frameIndex:(int)a9 disparityScale:(float)a10;
- (unsigned)prepareFilter:(id)a3 opticalFlowRGB:(id)a4 frameIndex:(int)a5;
- (unsigned)reset;
@end

@implementation PTEffectTemporalFilter

- (PTEffectTemporalFilter)initWithMetalContext:(id)a3 disparitySize:(id *)a4
{
  id v7 = a3;
  v78.receiver = self;
  v78.super_class = (Class)PTEffectTemporalFilter;
  v8 = [(PTEffectTemporalFilter *)&v78 init];
  v9 = v8;
  if (v8)
  {
    long long v10 = *(_OWORD *)&a4->var0;
    *((void *)v8 + 13) = a4->var2;
    *(_OWORD *)(v8 + 88) = v10;
    objc_storeStrong((id *)v8 + 1, a3);
    if (v9[1])
    {
      uint64x2_t v75 = vcvtq_u64_f64(vcvtq_f64_f32(vmul_f32(vcvt_f32_f64(vcvtq_f64_u64(*(uint64x2_t *)&a4->var0)), (float32x2_t)0x3F0000003F000000)));
      uint64x2_t v76 = v75;
      uint64_t v77 = 1;
      v11 = [[PTOpticalFlow alloc] initWithMetalContext:v7 colorSize:&v76 lktPreset:4 allocateDisplacementFWD:1 needConversionBGRA2YUVA:0 inverseFlow:1];
      v12 = (void *)v9[2];
      v9[2] = v11;

      if (v9[2])
      {
        uint64_t v13 = 0;
        v14 = v9 + 4;
        v15 = v9 + 6;
        v16 = v9 + 8;
        char v17 = 1;
        do
        {
          char v18 = v17;
          v19 = objc_msgSend(v7, "textureUtil", *(_OWORD *)&v75);
          uint64_t v20 = [v19 createWithWidth:a4->var0 height:a4->var1 pixelFormat:25];
          v21 = (void *)v14[v13];
          v14[v13] = v20;

          if (!v14[v13])
          {
            v31 = _PTLogSystem();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
              -[PTEffectTemporalFilter initWithMetalContext:disparitySize:](v31, v46, v47, v48, v49, v50, v51, v52);
            }
            goto LABEL_23;
          }
          v22 = [v7 textureUtil];
          uint64_t v23 = [v22 createWithWidth:a4->var0 height:a4->var1 pixelFormat:115];
          v24 = (void *)v15[v13];
          v15[v13] = v23;

          if (!v15[v13])
          {
            v31 = _PTLogSystem();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
              -[PTEffectTemporalFilter initWithMetalContext:disparitySize:].cold.4(v31, v53, v54, v55, v56, v57, v58, v59);
            }
            goto LABEL_23;
          }
          v25 = [v7 textureUtil];
          uint64_t v26 = [v25 createWithWidth:a4->var0 height:a4->var1 pixelFormat:10];
          v27 = (void *)v16[v13];
          v16[v13] = v26;

          if (!v16[v13])
          {
            v31 = _PTLogSystem();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
              -[PTEffectTemporalFilter initWithMetalContext:disparitySize:].cold.5(v31, v60, v61, v62, v63, v64, v65, v66);
            }
            goto LABEL_23;
          }
          char v17 = 0;
          uint64_t v13 = 1;
        }
        while ((v18 & 1) != 0);
        v28 = [[PTFilterEMA_LKT alloc] initWithMetalContext:v7];
        v29 = (void *)v9[10];
        v9[10] = v28;

        if (v9[10])
        {
          v30 = v9;
          goto LABEL_25;
        }
        v31 = _PTLogSystem();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          -[PTEffectTemporalFilter initWithMetalContext:disparitySize:].cold.6(v31, v67, v68, v69, v70, v71, v72, v73);
        }
      }
      else
      {
        v31 = _PTLogSystem();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          -[PTEffectTemporalFilter initWithMetalContext:disparitySize:](v31, v39, v40, v41, v42, v43, v44, v45);
        }
      }
    }
    else
    {
      v31 = _PTLogSystem();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[PTEffectTemporalFilter initWithMetalContext:disparitySize:](v31, v32, v33, v34, v35, v36, v37, v38);
      }
    }
LABEL_23:
  }
  v30 = 0;
LABEL_25:

  return v30;
}

- (id)diffuseFiltered
{
  return self->_temporalDiffuse[self->_indexOut];
}

- (unsigned)prepareFilter:(id)a3 opticalFlowRGB:(id)a4 frameIndex:(int)a5
{
  opticalFlow = self->_opticalFlow;
  unsigned int v7 = (a5 + 1) & 1;
  if (a5 >= -1) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = -v7;
  }
  unsigned int v9 = [(PTOpticalFlow *)opticalFlow estimateDisplacementStream:a3 index:v8 doOpticalFlow:a5 > 0 destRGBA:a4];
  if (v9)
  {
    long long v10 = _PTLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[PTCVMNetwork executeNetwork:](v9, v10);
    }
  }
  return v9;
}

- (unsigned)filter:(id)a3 inDisparity:(id)a4 inNormal:(id)a5 filterNormalSpatial:(BOOL)a6 frameIndex:(int)a7 disparityScale:(float)a8
{
  LODWORD(v9) = a7;
  return -[PTEffectTemporalFilter filter:inDisparity:inNormal:inDiffuse:filterNormalSpatial:filterDiffuseSpatial:frameIndex:disparityScale:](self, "filter:inDisparity:inNormal:inDiffuse:filterNormalSpatial:filterDiffuseSpatial:frameIndex:disparityScale:", a3, a4, a5, 0, a6, 0, v9);
}

- (unsigned)filter:(id)a3 inDisparity:(id)a4 inNormal:(id)a5 inDiffuse:(id)a6 filterNormalSpatial:(BOOL)a7 filterDiffuseSpatial:(BOOL)a8 frameIndex:(int)a9 disparityScale:(float)a10
{
  unsigned int v11 = a8;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  if (__PAIR128__([v18 height], objc_msgSend(v18, "width")) != *(_OWORD *)&self->_disparitySize.width)
  {
    v31 = _PTLogSystem();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[PTEffectTemporalFilter filter:inDisparity:inNormal:inDiffuse:filterNormalSpatial:filterDiffuseSpatial:frameIndex:disparityScale:](v31);
    }

    unsigned int v11 = -10;
    goto LABEL_12;
  }
  int v21 = (a9 + 1) & 1;
  if (a9 < -1) {
    int v21 = -v21;
  }
  int v22 = a9 & 1;
  if (a9 < 0) {
    int v22 = -v22;
  }
  self->_uint64_t indexIn = v21;
  self->_uint64_t indexOut = v22;
  disparityFilter = self->_disparityFilter;
  v24 = [(PTOpticalFlow *)self->_opticalFlow displacementFWD];
  uint64_t indexIn = self->_indexIn;
  uint64_t indexOut = self->_indexOut;
  v28 = self->_temporalDisparity[indexIn];
  v29 = self->_temporalDisparity[indexOut];
  if (!a7)
  {
    LODWORD(v38) = a9;
    [(PTFilterEMA_LKT *)disparityFilter emaFilterDisparityNormal:v17 inDisplacement:v24 inDisparityPrev:v28 inDisparity:v18 outDisparity:v29 inNormalPrev:self->_temporalNormal[indexIn] inNormal:v19 outNormal:self->_temporalNormal[indexOut] frameIndex:v38];
    goto LABEL_14;
  }
  *(float *)&double v25 = a10;
  [(PTFilterEMA_LKT *)disparityFilter emaFilter:v17 inDisplacement:v24 inTexPrev:v28 inTex:v18 outTex:v29 frameIndex:a9 scale:v25];

  if (v19)
  {
    v30 = self->_disparityFilter;
    v24 = [(PTOpticalFlow *)self->_opticalFlow displacementFWD];
    [(PTFilterEMA_LKT *)v30 gaussEMAFilterNormal:v17 inDisplacement:v24 inNormalPrev:self->_temporalNormal[self->_indexIn] inNormal:v19 outNormal:self->_temporalNormal[self->_indexOut] frameIndex:a9];
LABEL_14:
  }
  if (v20)
  {
    uint64_t v33 = self->_disparityFilter;
    uint64_t v34 = [(PTOpticalFlow *)self->_opticalFlow displacementFWD];
    uint64_t v36 = self->_temporalDiffuse[self->_indexIn];
    uint64_t v37 = self->_temporalDiffuse[self->_indexOut];
    if (!v11)
    {
      LODWORD(v35) = 1.0;
      [(PTFilterEMA_LKT *)v33 emaFilter:v17 inDisplacement:v34 inTexPrev:v36 inTex:v20 outTex:v37 frameIndex:a9 scale:v35];

      goto LABEL_12;
    }
    [(PTFilterEMA_LKT *)v33 gaussEMAFilter:v17 inDisplacement:v34 inTexPrev:v36 inTex:v20 outTex:v37 frameIndex:a9];
  }
  unsigned int v11 = 0;
LABEL_12:

  return v11;
}

- (unsigned)reset
{
  return 0;
}

- (id)displacementFWD
{
  return [(PTOpticalFlow *)self->_opticalFlow displacementFWD];
}

- (id)disparityFiltered
{
  return self->_temporalDisparity[self->_indexOut];
}

- (id)normalFiltered
{
  return self->_temporalNormal[self->_indexOut];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disparityFilter, 0);
  for (uint64_t i = 0; i != -2; --i)
    objc_storeStrong((id *)&self->_temporalDiffuse[i + 1], 0);
  for (uint64_t j = 0; j != -2; --j)
    objc_storeStrong((id *)&self->_temporalNormal[j + 1], 0);
  for (uint64_t k = 40; k != 24; k -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + k), 0);
  objc_storeStrong((id *)&self->_opticalFlow, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 disparitySize:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 disparitySize:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 disparitySize:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 disparitySize:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 disparitySize:(uint64_t)a4 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 disparitySize:(uint64_t)a4 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)filter:(os_log_t)log inDisparity:inNormal:inDiffuse:filterNormalSpatial:filterDiffuseSpatial:frameIndex:disparityScale:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Disparity filtering failed. Size of inDisparity does not match filter size.", v1, 2u);
}

@end