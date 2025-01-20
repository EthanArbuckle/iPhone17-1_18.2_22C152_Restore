@interface CMIDeepZoomStandardPostProcMetalStageV2
- (CMIDeepZoomStandardPostProcMetalStageV2)initWithMetalContext:(id)a3 withTileConfiguration:(id *)a4;
- (int)configureLumaGainLUT:(id *)a3;
- (int)processTileFrom:(id)a3 with:(id)a4 to:(id)a5 commandBuffer:(id)a6;
- (void)dealloc;
@end

@implementation CMIDeepZoomStandardPostProcMetalStageV2

- (CMIDeepZoomStandardPostProcMetalStageV2)initWithMetalContext:(id)a3 withTileConfiguration:(id *)a4
{
  id v7 = a3;
  if (a4)
  {
    if (*(_WORD *)a4) {
      BOOL v8 = *((unsigned __int16 *)a4 + 1) == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8) {
      goto LABEL_13;
    }
    v14.receiver = self;
    v14.super_class = (Class)CMIDeepZoomStandardPostProcMetalStageV2;
    v9 = [(CMIDeepZoomStandardPostProcMetalStageV2 *)&v14 init];
    self = v9;
    if (!v9) {
      goto LABEL_11;
    }
    objc_storeStrong((id *)&v9->_metalContext, a3);
    if (!self->_metalContext)
    {
      v10 = +[NSBundle bundleForClass:objc_opt_class()];
      v11 = (FigMetalContext *)[objc_alloc((Class)FigMetalContext) initWithbundle:v10 andOptionalCommandQueue:0];
      metalContext = self->_metalContext;
      self->_metalContext = v11;

      if (!self->_metalContext) {
        goto LABEL_13;
      }
    }
    if (sub_6BC8((uint64_t)self)
      || sub_75D0((uint64_t)self, *(_WORD *)a4, *((unsigned __int16 *)a4 + 1)))
    {
LABEL_13:
      a4 = 0;
    }
    else
    {
LABEL_11:
      self = self;
      a4 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)self;
    }
  }

  return (CMIDeepZoomStandardPostProcMetalStageV2 *)a4;
}

- (int)processTileFrom:(id)a3 with:(id)a4 to:(id)a5 commandBuffer:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v13;
  v15 = 0;
  int v16 = -12780;
  if (v10 && v11 && v12)
  {
    v17 = v13;
    if (!v13)
    {
      v18 = [(FigMetalContext *)self->_metalContext commandQueue];
      v17 = [v18 commandBuffer];
    }
    v15 = [v10 objectAtIndexedSubscript:0];
    v19 = [v11 objectAtIndexedSubscript:0];
    tileResidual = self->_tileResidual;
    self->_tileResidual = v19;

    v21 = [v12 objectAtIndexedSubscript:0];
    tileOutputLuma = self->_tileOutputLuma;
    self->_tileOutputLuma = v21;

    v23 = [v12 objectAtIndexedSubscript:1];
    tileOutputChroma = self->_tileOutputChroma;
    self->_tileOutputChroma = v23;

    v25 = [v17 computeCommandEncoder];
    sub_8260((uint32x2_t *)self, v15, self->_tileSourceLuma, self->_tileSourceChroma, v25);
    int v26 = sub_8388((uint64_t)self, self->_tileSourceLuma, self->_tileSourceChroma, self->_tileSourceLPLuma, self->_tileSourceLPChroma, self->_tileResidual, self->_tileEnhancedLuma, self->_tileEnhancedChroma, v25);
    if (v26) {
      goto LABEL_22;
    }
    int v26 = sub_8608((uint32x2_t *)self, self->_tileSourceLPLuma, self->_tileSourceLPChroma, self->_tileEnhancedLuma, self->_tileEnhancedChroma, v25);
    if (v26) {
      goto LABEL_22;
    }
    int v26 = sub_8A94((uint64_t)self, self->_tileEnhancedLuma, self->_tileEnhancedChroma, self->_tileLuma1Flipped, self->_tileChroma1Flipped, 5u, self->_params.tileWidth, self->_params.tileHeight, v25);
    if (v26) {
      goto LABEL_22;
    }
    int v26 = sub_8A94((uint64_t)self, self->_tileLuma1Flipped, self->_tileChroma1Flipped, self->_tileEnhancedLFLuma, self->_tileEnhancedLFChroma, 5u, self->_params.tileHeight, self->_params.tileWidth, v25);
    if (v26) {
      goto LABEL_22;
    }
    int v26 = sub_8A94((uint64_t)self, self->_tileEnhancedLFLuma, self->_tileEnhancedLFChroma, self->_tileLuma1Flipped, self->_tileChroma1Flipped, 5u, self->_params.tileWidth, self->_params.tileHeight, v25);
    if (v26) {
      goto LABEL_22;
    }
    int v26 = sub_8A94((uint64_t)self, self->_tileLuma1Flipped, self->_tileChroma1Flipped, self->_tileEnhancedLFLuma, self->_tileEnhancedLFChroma, 5u, self->_params.tileHeight, self->_params.tileWidth, v25);
    if (v26) {
      goto LABEL_22;
    }
    int v26 = sub_8A94((uint64_t)self, self->_tileSourceLPLuma, self->_tileSourceLPChroma, self->_tileLuma1Flipped, self->_tileChroma1Flipped, 5u, self->_params.tileWidth, self->_params.tileHeight, v25);
    if (v26) {
      goto LABEL_22;
    }
    int v26 = sub_8A94((uint64_t)self, self->_tileLuma1Flipped, self->_tileChroma1Flipped, self->_tileSourceLPLuma, self->_tileSourceLPChroma, 5u, self->_params.tileHeight, self->_params.tileWidth, v25);
    if (v26) {
      goto LABEL_22;
    }
    sub_8B90((uint64_t)self, self->_tileEnhancedLuma, self->_tileEnhancedChroma, self->_tileEnhancedLFLuma, self->_tileEnhancedLFChroma, self->_tileEnhancedLuma, self->_tileEnhancedChroma, v25);
    sub_8B90((uint64_t)self, self->_tileSourceLuma, self->_tileSourceChroma, self->_tileSourceLPLuma, self->_tileSourceLPChroma, self->_tileSourceLPLuma, self->_tileSourceLPChroma, v25);
    sub_8D5C((uint64_t)self, self->_tileSourceLPLuma, self->_tileSourceLPChroma, self->_tileSourceLPLuma, self->_tileSourceLPChroma, v25);
    sub_8D5C((uint64_t)self, self->_tileEnhancedLuma, self->_tileEnhancedChroma, self->_tileLumaTemp1, self->_tileChromaTemp1, v25);
    sub_9000((uint64_t)self, self->_tileSourceLPLuma, self->_tileSourceLPChroma, self->_tileLumaTemp1, self->_tileChromaTemp1, self->_tileSourceLPLuma, self->_tileSourceLPChroma, v25);
    int v26 = sub_8A94((uint64_t)self, self->_tileSourceLPLuma, self->_tileSourceLPChroma, self->_tileLuma1Flipped, self->_tileChroma1Flipped, 0x15u, self->_params.tileWidth, self->_params.tileHeight, v25);
    if (v26
      || (int v26 = sub_8A94((uint64_t)self, self->_tileLuma1Flipped, self->_tileChroma1Flipped, self->_tileSourceLPLuma, self->_tileSourceLPChroma, 0x15u, self->_params.tileHeight, self->_params.tileWidth, v25)) != 0|| (int v26 = sub_9200((uint64_t)self, self->_tileSourceLuma, self->_tileSourceLPLuma, v25)) != 0)
    {
LABEL_22:
      int v16 = v26;
    }
    else
    {
      sub_94EC((uint32x2_t *)self, self->_tileEnhancedLuma, self->_tileEnhancedChroma, self->_tileSourceLPLuma, self->_tileSourceLPChroma, self->_tileEnhancedLFLuma, self->_tileEnhancedLFChroma, self->_tileOutputLuma, self->_tileOutputChroma, v25);
      int v16 = sub_970C((uint64_t)self, self->_tileOutputLuma, self->_tileSourceLuma, self->_tileSourceLPLuma, self->_tileOutputLuma, v25);
      if (!v16)
      {
        [v25 endEncoding];
        if (!v14)
        {
          if (v17)
          {
            [v17 commit];
            [v17 waitUntilScheduled];
            int v16 = 0;
          }
        }
      }
    }
  }
  else
  {
    v17 = v13;
    v25 = 0;
  }

  return v16;
}

- (int)configureLumaGainLUT:(id *)a3
{
  if (!a3) {
    return -12780;
  }
  uint64_t v6 = 0;
  char v7 = 0;
  p_controlParams = &self->_controlParams;
  lumaGainCoefY = self->_controlParams.lumaGainCoefY;
LABEL_3:
  uint64_t v10 = v6 - 4;
  id v11 = &a3->var1[v6];
  id v12 = &lumaGainCoefY[v6];
  do
  {
    float v13 = *(v11 - 4);
    if (*(v12 - 4) != v13 || *v12 != *v11)
    {
      *(v12 - 4) = v13;
      *id v12 = *v11;
      uint64_t v6 = v10 + 5;
      char v7 = 1;
      if (v10 != -1) {
        goto LABEL_3;
      }
      goto LABEL_12;
    }
    *(v12 - 4) = v13;
    int v14 = *(_DWORD *)v11++;
    *(_DWORD *)v12++ = v14;
  }
  while (!__CFADD__(v10++, 1));
  if ((v7 & 1) == 0) {
    return 0;
  }
LABEL_12:
  uint64_t v16 = 0;
  lumaGainLUT = self->_lumaGainLUT;
  LODWORD(v3) = 1.0;
  LODWORD(v4) = 3.0;
  LODWORD(v5) = -2.0;
  do
  {
    float v18 = (float)v16 / 255.0;
    unsigned int v19 = 4;
    do
    {
      uint64_t v20 = v19 - 2;
      float v21 = p_controlParams->lumaGainCoefX[v20];
      --v19;
    }
    while (v18 < v21);
    float v22 = lumaGainCoefY[v20];
    float v23 = lumaGainCoefY[v19];
    float v24 = (float)(v18 - v21) / (float)(p_controlParams->lumaGainCoefX[v19] - v21);
    if (v24 > 1.0) {
      float v24 = 1.0;
    }
    if (v24 < 0.0) {
      float v24 = 0.0;
    }
    float v25 = (float)(v24 * v24) * (float)((float)(v24 * -2.0) + 3.0);
    float v26 = v23 + (float)((float)(v22 - v23) * (float)(1.0 - v25));
    float v27 = v22 + (float)((float)(v23 - v22) * v25);
    if (v22 > v23) {
      float v27 = v26;
    }
    lumaGainLUT[v16++] = v27;
  }
  while (v16 != 256);
  memcpy([(MTLBuffer *)self->_lumaGainLUTBuffer contents], lumaGainLUT, 0x400uLL);
  return 0;
}

- (void)dealloc
{
  sub_9B50(self);
  v3.receiver = self;
  v3.super_class = (Class)CMIDeepZoomStandardPostProcMetalStageV2;
  [(CMIDeepZoomStandardPostProcMetalStageV2 *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileResidual, 0);
  objc_storeStrong((id *)&self->_tileOutputChroma, 0);
  objc_storeStrong((id *)&self->_tileOutputLuma, 0);
  objc_storeStrong((id *)&self->_lumaGainLUTBuffer, 0);
  objc_storeStrong((id *)&self->_tileChromaTemp1, 0);
  objc_storeStrong((id *)&self->_tileLumaTemp1, 0);
  objc_storeStrong((id *)&self->_tileChroma1Flipped, 0);
  objc_storeStrong((id *)&self->_tileLuma1Flipped, 0);
  objc_storeStrong((id *)&self->_tileEnhancedLFChroma, 0);
  objc_storeStrong((id *)&self->_tileEnhancedLFLuma, 0);
  objc_storeStrong((id *)&self->_tileEnhancedChroma, 0);
  objc_storeStrong((id *)&self->_tileEnhancedLuma, 0);
  objc_storeStrong((id *)&self->_tileSourceChroma, 0);
  objc_storeStrong((id *)&self->_tileSourceLuma, 0);
  objc_storeStrong((id *)&self->_tileSourceLPChroma, 0);
  objc_storeStrong((id *)&self->_tileSourceLPLuma, 0);
  for (uint64_t i = 152; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end