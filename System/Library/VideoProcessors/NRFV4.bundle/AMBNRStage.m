@interface AMBNRStage
- (AMBNRStage)initWithContext:(id)a3;
- (BOOL)inputPyramidGenerationEnabled;
- (BOOL)upsampleOffsetEnabled;
- (SidecarWriter)sidecarWriter;
- (id)createAliasedPyramidFromLumaPyramid:(id)a3 chromaPyramid:(id)a4;
- (int)computeConfiguration:(const exposureParameters *)a3 staticScene:(BOOL)a4 dasPlist:(id)a5 nmPlist:(id)a6 isLowLight:(BOOL)a7 sensorCropRatio:(float)a8 zoomFactor:(float)a9;
- (int)greenGhostMitigationWithExposure:(const exposureParameters *)a3 faceLandMarks:(id)a4 ev0FrameMetadata:(id)a5 evmFrameMetadata:(id)a6 greenGhostBrightLightTuning:(id)a7 greenGhostIsRunning:(BOOL *)a8 gainMap:(id)a9;
- (int)runWithExposure:(const exposureParameters *)a3 staticScene:(BOOL)a4 dasPlist:(id)a5 nmPlist:(id)a6 defringingTuning:(id)a7 greenGhostBrightLightTuning:(id)a8 greenGhostEnabled:(BOOL)a9 skinMask:(id)a10 skyMask:(id)a11 maskExtent:(CGRect)a12 faceLandMarks:(id)a13 ev0FrameMetadata:(id)a14 evmFrameMetadata:(id)a15 defringeEnabled:(BOOL)a16 isLowLight:(BOOL)a17 gainMap:(id)a18;
- (int)setResourcesWithOutput:(id)a3 inputPyramid:(id)a4 noiseMapPyramid:(id)a5 sharpeningPyramid:(id)a6 localGainMapTex:(id)a7 denoisingOptions:(const DenoiseRemixStageOptions *)a8;
- (void)releaseResources;
- (void)selectBlurKernelSize:(AmbnrConfiguration *)a3;
- (void)setInputPyramidGenerationEnabled:(BOOL)a3;
- (void)setSidecarWriter:(id)a3;
- (void)setUpsampleOffsetEnabled:(BOOL)a3;
@end

@implementation AMBNRStage

- (AMBNRStage)initWithContext:(id)a3
{
  v27[3] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)AMBNRStage;
  v6 = [(AMBNRStage *)&v25 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_10;
  }
  objc_storeStrong((id *)&v6->_metalContext, a3);
  v8 = [[TextureUtils alloc] initWithMetalContext:v7->_metalContext];
  textureUtils = v7->_textureUtils;
  v7->_textureUtils = v8;

  if (!v7->_textureUtils) {
    goto LABEL_9;
  }
  v10 = [PyramidStage alloc];
  v26[0] = @"PyrGen.CompensateGpuShift";
  v26[1] = @"PyrGen.UseHW";
  v27[0] = &unk_270E98668;
  v27[1] = &unk_270E98680;
  v26[2] = @"PyrGen.SupportFP16";
  v27[2] = &unk_270E98668;
  v11 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];
  uint64_t v12 = [(PyramidStage *)v10 initWithOptions:v11 context:v5];
  pyramidStage = v7->_pyramidStage;
  v7->_pyramidStage = (PyramidStage *)v12;

  if (!v7->_pyramidStage) {
    goto LABEL_9;
  }
  *(_WORD *)&v7->_inputPyramidGenerationEnabled = 257;
  v14 = [[DenoiseRemixStage alloc] initWithContext:v5 numPyrLevels:4];
  denoiseRemixStage = v7->_denoiseRemixStage;
  v7->_denoiseRemixStage = v14;

  if (!v7->_denoiseRemixStage) {
    goto LABEL_9;
  }
  v16 = [[DefringeStage alloc] initWithMetalContext:v5];
  defringeStage = v7->_defringeStage;
  v7->_defringeStage = v16;

  if (!v7->_defringeStage) {
    goto LABEL_9;
  }
  uint64_t v18 = objc_opt_new();
  outputPyr = v7->_outputPyr;
  v7->_outputPyr = (PyramidStorage *)v18;

  v20 = v7->_outputPyr;
  if (!v20
    || (v20->levels = 4,
        v21 = [[GreenGhostBrightLightStage alloc] initWithMetalContext:v5], greenGhostStage = v7->_greenGhostStage, v7->_greenGhostStage = v21, greenGhostStage, !v7->_greenGhostStage))
  {
LABEL_9:
    FigDebugAssert3();
LABEL_10:
    v23 = 0;
    goto LABEL_11;
  }
  v7->_ambnrSharpeningEnabled = 1;
  v23 = v7;
LABEL_11:

  return v23;
}

- (id)createAliasedPyramidFromLumaPyramid:(id)a3 chromaPyramid:(id)a4
{
  id v5 = a3;
  v6 = (id *)a4;
  v7 = v6;
  if (v5 && v6 && v5[2] == *((_DWORD *)v6 + 2))
  {
    uint64_t v8 = +[PyramidStorage createTextureAlias:v5];
    v9 = (int *)v8;
    if (v8)
    {
      if (*(int *)(v8 + 8) >= 1)
      {
        uint64_t v10 = 0;
        uint64_t v11 = v8;
        do
        {
          objc_storeStrong((id *)(v11 + 496), v7[v10++ + 62]);
          v11 += 8;
        }
        while (v10 < v9[2]);
      }
    }
    else
    {
      FigDebugAssert3();
    }
  }
  else
  {
    FigDebugAssert3();
    v9 = 0;
  }

  return v9;
}

- (void)setSidecarWriter:(id)a3
{
  greenGhostStage = self->_greenGhostStage;
  id obj = a3;
  [(GreenGhostBrightLightStage *)greenGhostStage setSidecarWriter:obj];
  objc_storeWeak((id *)&self->_sidecarWriter, obj);
}

- (int)setResourcesWithOutput:(id)a3 inputPyramid:(id)a4 noiseMapPyramid:(id)a5 sharpeningPyramid:(id)a6 localGainMapTex:(id)a7 denoisingOptions:(const DenoiseRemixStageOptions *)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v25 = a6;
  id v18 = a7;
  objc_storeStrong((id *)&self->_outputImg, a3);
  objc_storeStrong((id *)&self->_pyramid, a4);
  objc_storeStrong((id *)&self->_noiseMapPyramid, a5);
  objc_storeStrong((id *)&self->_sharpeningPyramid, a6);
  self->_dasOptions = *a8;
  self->_enableDefringingStage = self->_dasOptions.enableDefringingStage;
  self->_enableGreenGhostStage = self->_dasOptions.enableGreenGhostBrightLightStage;
  lumaTex = self->_outputImg->lumaTex;
  if (!lumaTex
    || (objc_storeStrong((id *)self->_outputPyr->textureY, lumaTex),
        objc_storeStrong((id *)self->_outputPyr->textureUV, self->_outputImg->chromaTex),
        self->_outputPyr->isFP16[0] = [(MTLTexture *)self->_outputImg->lumaTex pixelFormat] == 25,
        [(DenoiseRemixStage *)self->_denoiseRemixStage setResourcesWithOutputPyramid:self->_outputPyr noiseMapPyramid:self->_noiseMapPyramid sharpeningPyramid:self->_sharpeningPyramid localGainMapTex:v18 denoisingOptions:a8]))
  {
    FigDebugAssert3();
    v20 = v25;
LABEL_9:
    int v23 = FigSignalErrorAt();
    goto LABEL_6;
  }
  v20 = v25;
  if (self->_enableDefringingStage)
  {
    v21 = [(AMBNRStage *)self createAliasedPyramidFromLumaPyramid:self->_pyramid chromaPyramid:self->_sharpeningPyramid];
    defringePyramid = self->_defringePyramid;
    self->_defringePyramid = v21;

    if (!self->_defringePyramid)
    {
      FigDebugAssert3();
      goto LABEL_9;
    }
  }
  int v23 = 0;
LABEL_6:

  return v23;
}

- (void)releaseResources
{
  outputImg = self->_outputImg;
  self->_outputImg = 0;

  pyramid = self->_pyramid;
  self->_pyramid = 0;

  noiseMapPyramid = self->_noiseMapPyramid;
  self->_noiseMapPyramid = 0;

  sharpeningPyramid = self->_sharpeningPyramid;
  self->_sharpeningPyramid = 0;

  defringePyramid = self->_defringePyramid;
  self->_defringePyramid = 0;

  outputPyr = self->_outputPyr;
  if (outputPyr->levels >= 1)
  {
    uint64_t v9 = 0;
    do
    {
      [(PyramidStorage *)outputPyr clearLevel:v9];
      uint64_t v9 = (v9 + 1);
      outputPyr = self->_outputPyr;
    }
    while ((int)v9 < outputPyr->levels);
  }
  denoiseRemixStage = self->_denoiseRemixStage;

  [(DenoiseRemixStage *)denoiseRemixStage releaseResources];
}

- (void)selectBlurKernelSize:(AmbnrConfiguration *)a3
{
  __asm { FMOV            V0.2S, #5.0 }
  *(void *)&a3[1].nm.lumaSigmaSlope = _D0;
}

- (int)computeConfiguration:(const exposureParameters *)a3 staticScene:(BOOL)a4 dasPlist:(id)a5 nmPlist:(id)a6 isLowLight:(BOOL)a7 sensorCropRatio:(float)a8 zoomFactor:(float)a9
{
  BOOL v11 = a7;
  BOOL v88 = a4;
  id v15 = (float *)a5;
  id v89 = a6;
  uint64_t v16 = 108;
  if (!v11) {
    uint64_t v16 = 0;
  }
  int levels = self->_pyramid->levels;
  if (levels > 4)
  {
    FigDebugAssert3();
    int v85 = FigSignalErrorAt();
  }
  else
  {
    if (levels >= 1)
    {
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      float v20 = *(float *)((char *)&a3->gain + v16);
      ambnrConf = self->_ambnrConf;
      do
      {
        v21 = (char *)self + v18;
        computeNoiseModel((float32x2_t *)((char *)self->_ambnrConf + v18), v89, (uint64_t)a3, v19);
        long long v22 = *(_OWORD *)&a3->hr_gain_down_ratio;
        long long v24 = *(_OWORD *)&a3->gain;
        long long v23 = *(_OWORD *)&a3->blue_combo_gain;
        *((_OWORD *)v21 + 16) = *(_OWORD *)&a3->hard_gain;
        *((_OWORD *)v21 + 17) = v22;
        *((_OWORD *)v21 + 14) = v24;
        *((_OWORD *)v21 + 15) = v23;
        long long v25 = *(_OWORD *)&a3->face_exp_ratio;
        long long v27 = *(_OWORD *)&a3->frame_exposure_bias;
        long long v26 = *(_OWORD *)&a3->read_noise_8x;
        *((_OWORD *)v21 + 20) = *(_OWORD *)&a3->is_long;
        *((_OWORD *)v21 + 21) = v25;
        *((_OWORD *)v21 + 18) = v27;
        *((_OWORD *)v21 + 19) = v26;
        uint64_t v28 = [*(id *)(*((void *)v15 + 2) + 8) objectAtIndexedSubscript:v19];
        *((float *)v21 + 8) = interpolate_with_gain(*(void **)(v28 + 8), v20);
        *((float *)v21 + 9) = interpolate_with_gain(*(void **)(v28 + 16), v20);
        *((float *)v21 + 10) = interpolate_with_gain(*(void **)(v28 + 24), v20);
        if (v88)
        {
          v29 = *(void **)(v28 + 104);
          if (!v29) {
            goto LABEL_65;
          }
          *(float *)((char *)&self->_ambnrConf[0].das.lumaDenoisingScalingOnSkin + v18) = interpolate_with_gain(v29, v20);
          v30 = *(void **)(v28 + 112);
          if (!v30) {
            goto LABEL_65;
          }
          *(float *)((char *)&self->_ambnrConf[0].das.lumaSharpeningScalingOnSky + v18) = interpolate_with_gain(v30, v20);
          v31 = *(void **)(v28 + 120);
          float v32 = 1.0;
          float v33 = 1.0;
          if (v31) {
            float v33 = interpolate_with_gain(v31, v20);
          }
          *(float *)((char *)&self->_ambnrConf[0].das.lumaDenoisingScalingOnSky + v18) = v33;
          v34 = *(void **)(v28 + 128);
          if (v34) {
            float v32 = interpolate_with_gain(v34, v20);
          }
          *(float *)((char *)&self->_ambnrConf[0].das.luma3x3SharpeningStrength + v18) = v32;
          v35 = *(void **)(v28 + 136);
          float v36 = v35 ? interpolate_with_gain(v35, v20) : 0.0;
          *(float *)((char *)&self->_ambnrConf[0].das.haloStrength + v18) = v36;
          v44 = *(void **)(v28 + 144);
          if (!v44
            || (*(float *)((char *)&self->_ambnrConf[0].das.flatnessBoost + v18) = interpolate_with_gain(v44, v20),
                (v43 = *(void **)(v28 + 152)) == 0))
          {
LABEL_65:
            FigDebugAssert3();
            int v85 = FigSignalErrorAt();

            goto LABEL_64;
          }
        }
        else
        {
          *((float *)v21 + 11) = interpolate_with_gain(*(void **)(v28 + 32), v20);
          *((float *)v21 + 12) = interpolate_with_gain(*(void **)(v28 + 40), v20);
          v37 = *(void **)(v28 + 48);
          float v38 = 1.0;
          float v39 = 1.0;
          if (v37) {
            float v39 = interpolate_with_gain(v37, v20);
          }
          *(float *)((char *)&self->_ambnrConf[0].das.lumaDenoisingScalingOnSky + v18) = v39;
          v40 = *(void **)(v28 + 56);
          if (v40) {
            float v38 = interpolate_with_gain(v40, v20);
          }
          *(float *)((char *)&self->_ambnrConf[0].das.luma3x3SharpeningStrength + v18) = v38;
          v41 = *(void **)(v28 + 80);
          if (v41) {
            float v42 = interpolate_with_gain(v41, v20);
          }
          else {
            float v42 = 0.0;
          }
          *(float *)((char *)&self->_ambnrConf[0].das.haloStrength + v18) = v42;
          *(float *)((char *)&self->_ambnrConf[0].das.flatnessBoost + v18) = interpolate_with_gain(*(void **)(v28 + 88), v20);
          v43 = *(void **)(v28 + 96);
        }
        *(float *)((char *)&self->_ambnrConf[0].das.flatnessThreshold + v18) = interpolate_with_gain(v43, v20);
        if (*(float *)((char *)&self->_ambnrConf[0].das.lumaSharpeningScalingOnSky + v18) < 1.0
          || *((float *)v21 + 10) < 1.0)
        {
          goto LABEL_65;
        }
        float v45 = 0.0;
        float v46 = 0.0;
        if (self->_ambnrSharpeningEnabled) {
          float v46 = interpolate_with_gain(*(void **)(v28 + 160), v20) * a9;
        }
        v47 = (float *)((char *)self + v18);
        *(float *)((char *)&self->_ambnrConf[0].das.gdFlatnessBoostMidtone + v18) = v46;
        v47[21] = interpolate_with_gain(*(void **)(v28 + 168), v20);
        v47[22] = interpolate_with_gain(*(void **)(v28 + 176), v20);
        v47[30] = interpolate_with_gain(*(void **)(v28 + 240), v20);
        v47[31] = interpolate_with_gain(*(void **)(v28 + 248), v20);
        v47[32] = interpolate_with_gain(*(void **)(v28 + 256), v20);
        v48 = *(void **)(v28 + 216);
        if (v48) {
          float v45 = interpolate_with_gain(v48, v20);
        }
        v47[27] = v45;
        v49 = *(void **)(v28 + 224);
        float v50 = 0.0;
        float v51 = 0.0;
        if (v49) {
          float v51 = interpolate_with_gain(v49, v20);
        }
        *(float *)((char *)&self->_ambnrConf[0].das.radialSharpnessBoost + v18) = v51;
        v52 = *(void **)(v28 + 232);
        if (v52) {
          float v50 = interpolate_with_gain(v52, v20);
        }
        *(float *)((char *)&self->_ambnrConf[0].das.blueBoost + v18) = v50;
        v53 = *(void **)(v28 + 184);
        if (v53) {
          float v54 = interpolate_with_gain(v53, v20);
        }
        else {
          float v54 = 0.0;
        }
        *(float *)((char *)&self->_ambnrConf[0].das.gdFlatnessBoostHighlight + v18) = v54;
        v55 = *(void **)(v28 + 192);
        if (v55) {
          float v56 = interpolate_with_gain(v55, v20);
        }
        else {
          float v56 = 0.25;
        }
        *(float *)((char *)&self->_ambnrConf[0].das.gdTexturenessThresholdLow + v18) = v56;
        v57 = *(void **)(v28 + 200);
        float v58 = 0.0;
        float v59 = 0.0;
        if (v57) {
          float v59 = interpolate_with_gain(v57, v20);
        }
        *(float *)((char *)&self->_ambnrConf[0].das.gdTexturenessThresholdHigh + v18) = v59;
        v60 = *(void **)(v28 + 208);
        if (v60) {
          float v58 = interpolate_with_gain(v60, v20);
        }
        *(float *)((char *)&self->_ambnrConf[0].das.gdTexturenessShadingFactor + v18) = v58;
        v61 = *(void **)(v28 + 72);
        float v62 = 1.0;
        float v63 = 1.0;
        if (v61) {
          float v63 = interpolate_with_gain(v61, v20);
        }
        v64 = (float *)((char *)self + v18);
        *(float *)((char *)&self->_ambnrConf[0].das.lumaLowVarDetailsLevel + v18) = v63;
        v65 = *(void **)(v28 + 64);
        if (v65) {
          float v62 = interpolate_with_gain(v65, v20);
        }
        v64[15] = v62;
        v64[50] = v15[12];
        v64[51] = v15[13];
        v64[52] = v15[14];
        v64[53] = v15[15];
        v64[54] = v15[16];
        v64[55] = v15[17];
        v64[33] = interpolate_with_gain(*(void **)(*((void *)v15 + 2) + 16), v20);
        v64[34] = interpolate_with_gain(*(void **)(*((void *)v15 + 2) + 24), v20);
        v64[35] = interpolate_with_gain(*(void **)(*((void *)v15 + 2) + 48), v20);
        v64[36] = interpolate_with_gain(*(void **)(*((void *)v15 + 2) + 56), v20);
        v64[37] = interpolate_with_gain(*(void **)(*((void *)v15 + 2) + 64), v20);
        *((unsigned char *)v64 + 152) = *((unsigned char *)v15 + 25);
        *((unsigned char *)v64 + 153) = *((unsigned char *)v15 + 26);
        *((unsigned char *)v64 + 154) = *((unsigned char *)v15 + 27);
        *((unsigned char *)v64 + 155) = *((unsigned char *)v15 + 28);
        v64[39] = v15[8];
        v64[40] = v15[9];
        *((unsigned char *)v64 + 164) = *((unsigned char *)v15 + 40);
        *((unsigned char *)v64 + 165) = *((unsigned char *)v15 + 42);
        v64[42] = v15[11];
        *((unsigned char *)v64 + 172) = *((unsigned char *)v15 + 41);
        uint64_t v66 = *((void *)v15 + 2);
        if (*(unsigned char *)(v66 + 72)) {
          float v67 = a8;
        }
        else {
          float v67 = 1.0;
        }
        if (v67 <= 0.0) {
          a8 = 1.0;
        }
        else {
          a8 = v67;
        }
        v64[44] = *(float *)(v66 + 76) / a8;
        v64[45] = *(float *)(*((void *)v15 + 2) + 80) / a8;
        v64[46] = *(float *)(*((void *)v15 + 2) + 84) / a8;
        v64[47] = *(float *)(*((void *)v15 + 2) + 88) / a8;
        v64[48] = *(float *)(*((void *)v15 + 2) + 92) / a8;
        v64[49] = *(float *)(*((void *)v15 + 2) + 96) / a8;

        ++v19;
        uint64_t v68 = self->_pyramid->levels;
        v18 += 376;
      }
      while (v19 < v68);
      if ((int)v68 >= 2)
      {
        uint64_t v69 = 0;
        __asm { FMOV            V8.2S, #-0.25 }
        do
        {
          [(AMBNRStage *)self selectBlurKernelSize:(char *)ambnrConf + 376 * v69];
          v75 = &self->_pyrFilters[v69];
          v75->filterType = 1;
          *(void *)&v75->luma_param = *((void *)&ambnrConf[1].nm.lumaSigmaSlope + 47 * v69);
          if (self->_upsampleOffsetEnabled)
          {
            uint64_t v76 = v69 + 1;
            uint64_t v77 = [(MTLTexture *)self->_pyramid->textureY[v69 + 1] width];
            uint64_t v78 = [(MTLTexture *)self->_pyramid->textureY[v69 + 1] height];
            v79.i64[0] = v77;
            v79.i64[1] = v78;
            *((float32x2_t *)&ambnrConf[1].das.chromaDenoiseLumaThresholdGain + 47 * v69) = vdiv_f32(_D8, vcvt_f32_f64(vcvtq_f64_u64(v79)));
            uint64_t v80 = [(MTLTexture *)self->_pyramid->textureUV[v69 + 1] width];
            uint64_t v81 = [(MTLTexture *)self->_pyramid->textureUV[v69 + 1] height];
            v82.i64[0] = v80;
            v82.i64[1] = v81;
            float32x2_t v83 = vdiv_f32(_D8, vcvt_f32_f64(vcvtq_f64_u64(v82)));
          }
          else
          {
            float32x2_t v83 = 0;
            *((void *)&ambnrConf[1].das.chromaDenoiseLumaThresholdGain + 47 * v69) = 0;
            uint64_t v76 = v69 + 1;
          }
          v84 = (char *)ambnrConf + 376 * v69;
          *((float32x2_t *)v84 + 45) = v83;
          v84[368] = self->_dasOptions.enableNoiseMap;
          v84[371] = self->_dasOptions.enableGdFlatness;
          *(_WORD *)(v84 + 369) = *(_WORD *)&self->_dasOptions.enableBilateralRegression;
          v84[372] = self->_dasOptions.enableDithering;
          uint64_t v69 = v76;
        }
        while (v76 < self->_pyramid->levels - 1);
      }
    }
    int v85 = 0;
  }
LABEL_64:

  return v85;
}

- (int)greenGhostMitigationWithExposure:(const exposureParameters *)a3 faceLandMarks:(id)a4 ev0FrameMetadata:(id)a5 evmFrameMetadata:(id)a6 greenGhostBrightLightTuning:(id)a7 greenGhostIsRunning:(BOOL *)a8 gainMap:(id)a9
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v62 = a4;
  id v65 = a5;
  id v15 = a6;
  id v16 = a7;
  id v64 = a9;
  float v17 = a3->gain * a3->exposure_time;
  if (v16)
  {
    [v16 tuningParams];
    float v18 = *((float *)&v69 + 1);
  }
  else
  {
    uint64_t v79 = 0;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    float v18 = 0.0;
    long long v69 = 0u;
    long long v70 = 0u;
  }
  unsigned int v19 = [(MTLTexture *)self->_outputImg->lumaTex width];
  unsigned int v20 = [(MTLTexture *)self->_outputImg->lumaTex height];
  v21.i64[0] = 0;
  v21.i64[1] = __PAIR64__(v20, v19);
  uint32x4_t v68 = v21;
  float v63 = v15;
  if (v17 < v18)
  {
    if (v16)
    {
      [v16 tuningParams];
      if (v67)
      {
        if (v15 && (v22 = [v15 hasValidClippingData], long long v23 = v15, (v22 & 1) != 0)
          || v65 && (v24 = [v65 hasValidClippingData], long long v23 = v65, (v24 & 1) != 0))
        {
          uint64_t v25 = [v23 clippingData];
          [v16 tuningParams];
          v80[0] = v66;
          uint64_t v26 = 1;
          if (findGreenGhostROI(v25, &v68, [(MTLTexture *)self->_outputImg->lumaTex width], [(MTLTexture *)self->_outputImg->lumaTex height], (uint64_t)v80))
          {
            uint64_t v27 = 1;
            goto LABEL_17;
          }
          uint64_t v27 = 0;
LABEL_38:
          int v31 = 0;
          v29 = v62;
          goto LABEL_39;
        }
        FigDebugAssert3();
LABEL_37:
        uint64_t v27 = 0;
        uint64_t v26 = 0;
        goto LABEL_38;
      }
      uint64_t v27 = 0;
    }
    else
    {
      uint64_t v27 = 0;
    }
LABEL_17:
    if (dword_26B430EE8)
    {
      v30 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    *a8 = 1;
    float v32 = objc_opt_new();
    if (v32
      && ([(FigMetalContext *)self->_metalContext allocator],
          float v33 = objc_claimAutoreleasedReturnValue(),
          v34 = (void *)[v33 newTextureDescriptor],
          v33,
          v34))
    {
      v35 = [v34 desc];
      [v35 setUsage:7];

      float v36 = [v34 desc];
      [v36 setCompressionMode:2];

      v37 = [v34 desc];
      [v37 setCompressionFootprint:0];

      uint64_t v38 = [(MTLTexture *)self->_outputImg->lumaTex width];
      float v39 = [v34 desc];
      [v39 setWidth:v38];

      uint64_t v40 = [(MTLTexture *)self->_outputImg->lumaTex height];
      v41 = [v34 desc];
      [v41 setHeight:v40];

      float v42 = [v34 desc];
      [v42 setPixelFormat:10];

      [v34 setLabel:0];
      v43 = [(FigMetalContext *)self->_metalContext allocator];
      uint64_t v44 = [v43 newTextureWithDescriptor:v34];
      float v45 = (void *)v32[2];
      v32[2] = v44;

      if (v32[2])
      {
        uint64_t v46 = [(MTLTexture *)self->_outputImg->chromaTex width];
        v47 = [v34 desc];
        [v47 setWidth:v46];

        uint64_t v48 = [(MTLTexture *)self->_outputImg->chromaTex height];
        v49 = [v34 desc];
        [v49 setHeight:v48];

        float v50 = [v34 desc];
        [v50 setPixelFormat:30];

        [v34 setLabel:0];
        float v51 = [(FigMetalContext *)self->_metalContext allocator];
        uint64_t v52 = [v51 newTextureWithDescriptor:v34];
        v53 = (void *)v32[3];
        v32[3] = v52;

        if (v32[3])
        {
          v29 = v62;
          int v54 = [(GreenGhostBrightLightStage *)self->_greenGhostStage GhostMitigationWithPyr:self->_outputPyr outputImage:v32 tuning:v16 faceLandMarks:v62 ev0FrameMetadata:v65 roi:v64 gainMap:*(double *)v68.i64];
          if (v54)
          {
            int v31 = v54;
          }
          else
          {
            int v55 = [(TextureUtils *)self->_textureUtils copyTexture:v32[2] outTex:self->_outputImg->lumaTex];
            if (v55)
            {
              int v31 = v55;
            }
            else
            {
              int v31 = [(TextureUtils *)self->_textureUtils copyTexture:v32[3] outTex:self->_outputImg->chromaTex];
              if (!v31)
              {
                FigMetalDecRef();
                FigMetalDecRef();
LABEL_28:

LABEL_29:
                uint64_t v26 = v27;
                goto LABEL_39;
              }
            }
          }
          FigDebugAssert3();
          goto LABEL_28;
        }
      }
      FigDebugAssert3();
      int v31 = FigSignalErrorAt();
    }
    else
    {
      FigDebugAssert3();
      int v31 = FigSignalErrorAt();
    }
    v29 = v62;
    goto LABEL_29;
  }
  if (!dword_26B430EE8) {
    goto LABEL_37;
  }
  uint64_t v28 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
  v29 = v62;
  fig_log_call_emit_and_clean_up_after_send_and_compose();

  uint64_t v27 = 0;
  uint64_t v26 = 0;
  int v31 = 0;
LABEL_39:
  float v56 = objc_opt_new();
  v57 = [NSNumber numberWithBool:v17 < v18];
  [v56 setObject:v57 forKeyedSubscript:@"isBrightScene"];

  float v58 = [NSNumber numberWithBool:v27];
  [v56 setObject:v58 forKeyedSubscript:@"roiIsComputed"];

  float v59 = [NSNumber numberWithBool:v26];
  [v56 setObject:v59 forKeyedSubscript:@"hasValidClippingData"];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_sidecarWriter);
  [WeakRetained addToSidecar:v56 forKey:@"GreenGhostBrightLight"];

  return v31;
}

- (int)runWithExposure:(const exposureParameters *)a3 staticScene:(BOOL)a4 dasPlist:(id)a5 nmPlist:(id)a6 defringingTuning:(id)a7 greenGhostBrightLightTuning:(id)a8 greenGhostEnabled:(BOOL)a9 skinMask:(id)a10 skyMask:(id)a11 maskExtent:(CGRect)a12 faceLandMarks:(id)a13 ev0FrameMetadata:(id)a14 evmFrameMetadata:(id)a15 defringeEnabled:(BOOL)a16 isLowLight:(BOOL)a17 gainMap:(id)a18
{
  BOOL v76 = a4;
  double height = a12.size.height;
  double width = a12.size.width;
  double y = a12.origin.y;
  double x = a12.origin.x;
  uint64_t v105 = *MEMORY[0x263EF8340];
  id v83 = a5;
  id v84 = a6;
  id v25 = a7;
  id v79 = a8;
  id v82 = a10;
  id v81 = a11;
  id v78 = a13;
  id v26 = a14;
  id v77 = a15;
  id v27 = a18;
  id v104 = 0;
  float v28 = 1.0;
  if (a17)
  {
    [v26 finalCropRectZoomRatio];
    float v30 = fminf(fmaxf((float)(v29 + -2.5) * 0.5, 0.0), 1.0);
    float v28 = 1.0 - (float)((float)(v30 * v30) * (float)((float)(v30 * -2.0) + 3.0));
  }
  int v31 = v83;
  if (![v26 exposureParams])
  {
    uint64_t v73 = v74;
    LODWORD(v72) = 0;
    FigDebugAssert3();
    v47 = 0;
    v35 = 0;
    int v70 = -73436;
    float v33 = self;
LABEL_60:
    [(AMBNRStage *)v33 releaseResources];
    goto LABEL_43;
  }
  uint64_t v32 = *(unsigned int *)([v26 exposureParams] + 120);
  float v33 = self;
  if (v32 >= 3)
  {
    uint64_t v73 = v74;
    LODWORD(v72) = 0;
    FigDebugAssert3();
    v47 = 0;
    v35 = 0;
    int v70 = -73436;
    goto LABEL_60;
  }
  v34 = [(FigMetalContext *)self->_metalContext allocator];
  v35 = (void *)[v34 newTextureDescriptor];

  if (!v35)
  {
    uint64_t v73 = v74;
    LODWORD(v72) = 0;
LABEL_52:
    FigDebugAssert3();
    int v70 = FigSignalErrorAt();
    v47 = 0;
    goto LABEL_60;
  }
  float v36 = [v35 desc];
  [v36 setUsage:7];

  if (v26) {
    [v26 sensorCropRatio];
  }
  else {
    LODWORD(v37) = 1.0;
  }
  *(float *)&double v38 = v28;
  if ([(AMBNRStage *)self computeConfiguration:a3 staticScene:v76 dasPlist:v83 nmPlist:v84 isLowLight:a17 sensorCropRatio:v37 zoomFactor:v38])
  {
    uint64_t v73 = v74;
    LODWORD(v72) = 0;
    goto LABEL_52;
  }
  if (self->_inputPyramidGenerationEnabled
    && [(PyramidStage *)self->_pyramidStage runWithFilters:self->_pyrFilters pyramid:self->_pyramid])
  {
    uint64_t v73 = v74;
    LODWORD(v72) = 0;
    goto LABEL_52;
  }
  id v43 = v25;
  if (a16)
  {
    *(float *)&double v40 = a3->exposure_time;
    *(float *)&double v39 = a3->gain;
    *(float *)&double v41 = a3->red_gain;
    *(float *)&double v42 = a3->blue_gain;
    [v25 setMetadataGain:v39 exposureTime:v40 AWBRGain:v41 AWBBGain:v42];
    if (v25)
    {
      [v25 correctionParams];
      float v44 = *((float *)&v101 + 1);
    }
    else
    {
      long long v101 = 0u;
      long long v102 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      float v44 = 0.0;
      uint64_t v103 = 0;
    }
    if (v44 > 0.1)
    {
      if (!self->_defringeStage || ([v25 defringingEnabled] & 1) == 0)
      {
        int v70 = FigSignalErrorAt();
        v47 = 0;
        goto LABEL_59;
      }
      if (dword_26B430EE8)
      {
        int v88 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        float v45 = (id)objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT);

        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      uint64_t v48 = [(MTLTexture *)self->_pyramid->textureY[1] width];
      v49 = [v35 desc];
      [v49 setWidth:v48];

      uint64_t v50 = [(MTLTexture *)self->_pyramid->textureY[1] height];
      float v51 = [v35 desc];
      [v51 setHeight:v50];

      uint64_t v52 = [v35 desc];
      [v52 setPixelFormat:65];

      [v35 setLabel:0];
      v53 = [(FigMetalContext *)self->_metalContext allocator];
      int v54 = (void *)[v53 newTextureWithDescriptor:v35];
      id v104 = v54;

      if (v54)
      {
        int v55 = [(DefringeStage *)self->_defringeStage defringePyramid:self->_pyramid outputPyramid:self->_defringePyramid chromaScratch:v54 quadraBinningFactor:v32 tuningParameters:v25];
        if (!v55)
        {
          v47 = self->_defringePyramid;
          FigMetalDecRef();
          FigMetalDecRef();
          FigMetalDecRef();
          FigMetalDecRef();
          FigMetalDecRef();
          goto LABEL_27;
        }
        int v70 = v55;
        uint64_t v73 = v74;
        LODWORD(v72) = v55;
        FigDebugAssert3();
      }
      else
      {
        uint64_t v73 = v74;
        LODWORD(v72) = 0;
        FigDebugAssert3();
        int v70 = FigSignalErrorAt();
      }
      v47 = 0;
      int v31 = v83;
      goto LABEL_60;
    }
    if (dword_26B430EE8)
    {
      int v88 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v46 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  v47 = self->_pyramid;
LABEL_27:
  if (self->_noiseMapPyramid)
  {
    int v56 = +[PyramidStorage allocatePyramidWithMetalContext:self->_metalContext label:@"_noiseMapPyramid" width:[(MTLTexture *)v47->textureY[0] width] height:[(MTLTexture *)v47->textureY[0] height] isFP16:1 pyramid:self->_noiseMapPyramid];
    if (v56)
    {
      int v70 = v56;
      uint64_t v73 = v74;
      LODWORD(v72) = v56;
      goto LABEL_54;
    }
    if (self->_noiseMapPyramid
      && -[PyramidStage runWithFilters:pyramid:](self->_pyramidStage, "runWithFilters:pyramid:", self->_pyrFilters))
    {
      uint64_t v73 = v74;
      LODWORD(v72) = 0;
      goto LABEL_58;
    }
  }
  if (-[DenoiseRemixStage setUniforms:](self->_denoiseRemixStage, "setUniforms:", self->_ambnrConf, v72, v73))
  {
    uint64_t v73 = v74;
    LODWORD(v72) = 0;
LABEL_58:
    FigDebugAssert3();
    int v70 = FigSignalErrorAt();
    goto LABEL_59;
  }
  [(DenoiseRemixStage *)self->_denoiseRemixStage setDitheringEnabled:LOBYTE(self->_ambnrConf[1].das.lumaSharpeningScalingOnSkin)];
  int v57 = +[PyramidStorage allocatePyramidWithMetalContext:self->_metalContext label:@"_outputPyr" width:[(MTLTexture *)self->_pyramid->textureY[0] width] height:[(MTLTexture *)self->_pyramid->textureY[0] height] isFP16:1 pyramid:self->_outputPyr];
  if (v57)
  {
    int v70 = v57;
    uint64_t v73 = v74;
    LODWORD(v72) = v57;
LABEL_54:
    FigDebugAssert3();
LABEL_59:
    int v31 = v83;
    goto LABEL_60;
  }
  int v58 = -[DenoiseRemixStage run:skinMask:skyMask:maskExtent:disableChromaBand3GainMap:](self->_denoiseRemixStage, "run:skinMask:skyMask:maskExtent:disableChromaBand3GainMap:", v47, v82, v81, self->_dasOptions.disableGainMapChromaBand3, x, y, width, height);
  if (v58)
  {
    int v70 = v58;
    uint64_t v73 = v74;
    LODWORD(v72) = v58;
    goto LABEL_54;
  }
  objc_storeStrong((id *)&self->_outputImg->lumaTex, self->_outputPyr->textureY[0]);
  objc_storeStrong((id *)&self->_outputImg->chromaTex, self->_outputPyr->textureUV[0]);
  unsigned __int8 v86 = 0;
  if (a9)
  {
    float v59 = (_DWORD *)MEMORY[0x263F00E10];
    if (*MEMORY[0x263F00E10])
    {
      v60 = [(FigMetalContext *)self->_metalContext commandQueue];
      v61 = [v60 commandBuffer];

      [v61 setLabel:@"KTRACE_START_MTL"];
      [v61 addCompletedHandler:&__block_literal_global_11];
      [v61 commit];
    }
    int v62 = [(AMBNRStage *)self greenGhostMitigationWithExposure:a3 faceLandMarks:v78 ev0FrameMetadata:v26 evmFrameMetadata:v77 greenGhostBrightLightTuning:v79 greenGhostIsRunning:&v86 gainMap:v27];
    if (!v62)
    {
      if (*v59)
      {
        float v63 = [(FigMetalContext *)self->_metalContext commandQueue];
        id v64 = [v63 commandBuffer];

        [v64 setLabel:@"KTRACE_END_MTL"];
        v85[0] = MEMORY[0x263EF8330];
        v85[1] = 3221225472;
        v85[2] = __233__AMBNRStage_runWithExposure_staticScene_dasPlist_nmPlist_defringingTuning_greenGhostBrightLightTuning_greenGhostEnabled_skinMask_skyMask_maskExtent_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_defringeEnabled_isLowLight_gainMap___block_invoke_2;
        v85[3] = &__block_descriptor_56_e28_v16__0___MTLCommandBuffer__8l;
        memset(&v85[4], 0, 24);
        [v64 addCompletedHandler:v85];
        [v64 commit];
      }
      goto LABEL_40;
    }
    int v70 = v62;
    uint64_t v73 = v74;
    LODWORD(v72) = v62;
    FigDebugAssert3();
    id v25 = v43;
    goto LABEL_59;
  }
LABEL_40:
  id v65 = objc_opt_new();
  long long v66 = [NSNumber numberWithBool:a9];
  [v65 setObject:v66 forKeyedSubscript:@"isEnabled"];

  char v67 = [NSNumber numberWithBool:v86];
  [v65 setObject:v67 forKeyedSubscript:@"isRunning"];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_sidecarWriter);
  [WeakRetained addToSidecar:v65 forKey:@"GreenGhostBrightLight"];

  +[PyramidStorage makePyramidAliasable:self->_outputPyr metal:self->_metalContext];
  noiseMapPyramid = self->_noiseMapPyramid;
  if (noiseMapPyramid) {
    +[PyramidStorage makePyramidAliasable:noiseMapPyramid metal:self->_metalContext];
  }
  int v70 = 0;
  id v25 = v43;
  int v31 = v83;
LABEL_43:

  return v70;
}

void __233__AMBNRStage_runWithExposure_staticScene_dasPlist_nmPlist_defringingTuning_greenGhostBrightLightTuning_greenGhostEnabled_skinMask_skyMask_maskExtent_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_defringeEnabled_isLowLight_gainMap___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 GPUEndTime];
  [v2 GPUStartTime];

  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
  }
}

void __233__AMBNRStage_runWithExposure_staticScene_dasPlist_nmPlist_defringingTuning_greenGhostBrightLightTuning_greenGhostEnabled_skinMask_skyMask_maskExtent_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_defringeEnabled_isLowLight_gainMap___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 status] == 4)
  {
    [v2 GPUEndTime];
    [v2 GPUStartTime];
  }
  else
  {
    [v2 status];
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

- (SidecarWriter)sidecarWriter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sidecarWriter);

  return (SidecarWriter *)WeakRetained;
}

- (BOOL)inputPyramidGenerationEnabled
{
  return self->_inputPyramidGenerationEnabled;
}

- (void)setInputPyramidGenerationEnabled:(BOOL)a3
{
  self->_inputPyramidGenerationEnabled = a3;
}

- (BOOL)upsampleOffsetEnabled
{
  return self->_upsampleOffsetEnabled;
}

- (void)setUpsampleOffsetEnabled:(BOOL)a3
{
  self->_upsampleOffsetEnabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sidecarWriter);
  objc_storeStrong((id *)&self->_greenGhostStage, 0);
  objc_storeStrong((id *)&self->_defringeStage, 0);
  objc_storeStrong((id *)&self->_defringePyramid, 0);
  objc_storeStrong((id *)&self->_textureUtils, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_denoiseRemixStage, 0);
  objc_storeStrong((id *)&self->_pyramidStage, 0);
  objc_storeStrong((id *)&self->_outputImg, 0);
  objc_storeStrong((id *)&self->_outputPyr, 0);
  objc_storeStrong((id *)&self->_sharpeningPyramid, 0);
  objc_storeStrong((id *)&self->_noiseMapPyramid, 0);

  objc_storeStrong((id *)&self->_pyramid, 0);
}

@end