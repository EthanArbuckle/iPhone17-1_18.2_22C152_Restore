@interface AMBNRStage
- (AMBNRStage)initWithContext:(id)a3 denoisingOptions:(const DenoiseRemixStageOptions *)a4;
- (BOOL)inputPyramidGenerationEnabled;
- (BOOL)upsampleOffsetEnabled;
- (SidecarWriter)sidecarWriter;
- (id)createAliasedPyramidFromLumaPyramid:(id)a3 chromaPyramid:(id)a4;
- (int)computeConfiguration:(const exposureParameters *)a3 staticScene:(BOOL)a4 dasPlist:(id)a5 nmPlist:(id)a6 isLowLight:(BOOL)a7;
- (int)greenGhostMitigationWithExposure:(const exposureParameters *)a3 faceLandMarks:(id)a4 ev0FrameMetadata:(const frameMetadata *)a5 evmFrameMetadata:(const frameMetadata *)a6 greenGhostBrightLightTuning:(id)a7 greenGhostIsRunning:(BOOL *)a8 gainMap:(id)a9;
- (int)runWithExposure:(const exposureParameters *)a3 staticScene:(BOOL)a4 dasPlist:(id)a5 nmPlist:(id)a6 defringingTuning:(id)a7 greenGhostBrightLightTuning:(id)a8 greenGhostEnabled:(BOOL)a9 skinMask:(id)a10 skyMask:(id)a11 maskExtent:(CGRect)a12 faceLandMarks:(id)a13 ev0FrameMetadata:(const frameMetadata *)a14 evmFrameMetadata:(const frameMetadata *)a15 defringeEnabled:(BOOL)a16 isLowLight:(BOOL)a17 gainMap:(id)a18;
- (int)setResourcesWithOutput:(id)a3 inputPyramid:(id)a4 noiseMapPyramid:(id)a5 sharpeningPyramid:(id)a6 localGainMapTex:(id)a7;
- (void)selectBlurKernelSize:(AmbnrConfiguration *)a3;
- (void)setInputPyramidGenerationEnabled:(BOOL)a3;
- (void)setSidecarWriter:(id)a3;
- (void)setUpsampleOffsetEnabled:(BOOL)a3;
@end

@implementation AMBNRStage

- (id)createAliasedPyramidFromLumaPyramid:(id)a3 chromaPyramid:(id)a4
{
  v5 = a3;
  v6 = (id *)a4;
  v9 = v6;
  if (v5 && v6 && v5[2] == *((_DWORD *)v6 + 2))
  {
    uint64_t v10 = objc_msgSend_createTextureAlias_(PyramidStorage_NRF, v7, (uint64_t)v5, v8);
    v11 = (int *)v10;
    if (v10)
    {
      if (*(int *)(v10 + 8) >= 1)
      {
        uint64_t v12 = 0;
        uint64_t v13 = v10;
        do
        {
          objc_storeStrong((id *)(v13 + 496), v9[v12++ + 62]);
          v13 += 8;
        }
        while (v12 < v11[2]);
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
    v11 = 0;
  }

  return v11;
}

- (AMBNRStage)initWithContext:(id)a3 denoisingOptions:(const DenoiseRemixStageOptions *)a4
{
  v44[3] = *MEMORY[0x263EF8340];
  id v7 = a3;
  v42.receiver = self;
  v42.super_class = (Class)AMBNRStage;
  uint64_t v8 = [(AMBNRStage *)&v42 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_12;
  }
  objc_storeStrong((id *)&v8->_metalContext, a3);
  uint64_t v10 = [TextureUtils alloc];
  uint64_t v13 = objc_msgSend_initWithMetalContext_(v10, v11, (uint64_t)v9->_metalContext, v12);
  textureUtils = v9->_textureUtils;
  v9->_textureUtils = (TextureUtils *)v13;

  if (!v9->_textureUtils) {
    goto LABEL_11;
  }
  v15 = [PyramidStage_NRF alloc];
  v43[0] = @"PyrGen.CompensateGpuShift";
  v43[1] = @"PyrGen.UseHW";
  v44[0] = &unk_270E506D0;
  v44[1] = &unk_270E506E8;
  v43[2] = @"PyrGen.SupportFP16";
  v44[2] = &unk_270E506D0;
  v17 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v16, (uint64_t)v44, (uint64_t)v43, 3);
  uint64_t v19 = objc_msgSend_initWithOptions_context_(v15, v18, (uint64_t)v17, (uint64_t)v7);
  pyramidStage = v9->_pyramidStage;
  v9->_pyramidStage = (PyramidStage_NRF *)v19;

  if (!v9->_pyramidStage) {
    goto LABEL_11;
  }
  *(_WORD *)&v9->_inputPyramidGenerationEnabled = 257;
  v21 = [DenoiseRemixStage alloc];
  uint64_t v23 = objc_msgSend_initWithContext_options_numPyrLevels_(v21, v22, (uint64_t)v7, (uint64_t)a4, 4);
  denoiseRemixStage = v9->_denoiseRemixStage;
  v9->_denoiseRemixStage = (DenoiseRemixStage *)v23;

  if (!v9->_denoiseRemixStage) {
    goto LABEL_11;
  }
  BOOL enableDefringingStage = a4->enableDefringingStage;
  v9->_BOOL enableDefringingStage = enableDefringingStage;
  if (enableDefringingStage)
  {
    v26 = [DefringeStage alloc];
    uint64_t v29 = objc_msgSend_initWithMetalContext_(v26, v27, (uint64_t)v7, v28);
    defringeStage = v9->_defringeStage;
    v9->_defringeStage = (DefringeStage *)v29;

    if (!v9->_defringeStage) {
      goto LABEL_11;
    }
  }
  uint64_t v31 = objc_opt_new();
  outputPyr = v9->_outputPyr;
  v9->_outputPyr = (PyramidStorage_NRF *)v31;

  v33 = v9->_outputPyr;
  if (!v33) {
    goto LABEL_11;
  }
  v33->levels = 4;
  BOOL enableGreenGhostBrightLightStage = a4->enableGreenGhostBrightLightStage;
  v9->_enableGreenGhostStage = enableGreenGhostBrightLightStage;
  if (enableGreenGhostBrightLightStage)
  {
    v35 = [GreenGhostBrightLightStage alloc];
    uint64_t v38 = objc_msgSend_initWithMetalContext_(v35, v36, (uint64_t)v7, v37);
    greenGhostStage = v9->_greenGhostStage;
    v9->_greenGhostStage = (GreenGhostBrightLightStage *)v38;

    if (!v9->_greenGhostStage)
    {
LABEL_11:
      FigDebugAssert3();
LABEL_12:
      v40 = 0;
      goto LABEL_13;
    }
  }
  v40 = v9;
LABEL_13:

  return v40;
}

- (void)setSidecarWriter:(id)a3
{
  greenGhostStage = self->_greenGhostStage;
  id obj = a3;
  objc_msgSend_setSidecarWriter_(greenGhostStage, v5, (uint64_t)obj, v6);
  objc_storeWeak((id *)&self->_sidecarWriter, obj);
}

- (int)setResourcesWithOutput:(id)a3 inputPyramid:(id)a4 noiseMapPyramid:(id)a5 sharpeningPyramid:(id)a6 localGainMapTex:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  objc_storeStrong((id *)&self->_outputImg, a3);
  objc_storeStrong((id *)&self->_pyramid, a4);
  objc_storeStrong((id *)&self->_noiseMapPyramid, a5);
  objc_storeStrong((id *)&self->_sharpeningPyramid, a6);
  lumaTex = self->_outputImg->lumaTex;
  if (!lumaTex) {
    goto LABEL_7;
  }
  objc_storeStrong((id *)self->_outputPyr->textureY, lumaTex);
  objc_storeStrong((id *)self->_outputPyr->textureUV, self->_outputImg->chromaTex);
  self->_outputPyr->isFP16[0] = objc_msgSend_pixelFormat(self->_outputImg->lumaTex, v19, v20, v21) == 25;
  if (objc_msgSend_setResourcesWithOutputPyramid_noiseMapPyramid_sharpeningPyramid_localGainMapTex_(self->_denoiseRemixStage, v22, (uint64_t)self->_outputPyr, (uint64_t)self->_noiseMapPyramid, self->_sharpeningPyramid, v17)|| self->_enableDefringingStage&& (objc_msgSend_createAliasedPyramidFromLumaPyramid_chromaPyramid_(self, v23, (uint64_t)self->_pyramid, (uint64_t)self->_sharpeningPyramid), v24 = (PyramidStorage_NRF *)objc_claimAutoreleasedReturnValue(), defringePyramid = self->_defringePyramid, self->_defringePyramid = v24, defringePyramid, !self->_defringePyramid))
  {
LABEL_7:
    FigDebugAssert3();
    int v26 = FigSignalErrorAt();
  }
  else
  {
    int v26 = 0;
  }

  return v26;
}

- (void)selectBlurKernelSize:(AmbnrConfiguration *)a3
{
  __asm { FMOV            V0.2S, #5.0 }
  *(void *)&a3[1].nm.lumaSigmaSlope = _D0;
}

- (int)computeConfiguration:(const exposureParameters *)a3 staticScene:(BOOL)a4 dasPlist:(id)a5 nmPlist:(id)a6 isLowLight:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v93 = a4;
  v11 = (float *)a5;
  id v94 = a6;
  uint64_t v12 = 96;
  if (!v7) {
    uint64_t v12 = 0;
  }
  int levels = self->_pyramid->levels;
  if (levels > 4)
  {
    FigDebugAssert3();
    int v90 = FigSignalErrorAt();
  }
  else
  {
    if (levels >= 1)
    {
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      float v16 = *(float *)((char *)&a3->gain + v12);
      ambnrConf = self->_ambnrConf;
      do
      {
        id v17 = (char *)self + v14;
        sub_262F857EC((float32x2_t *)((char *)self->_ambnrConf + v14), v94, (uint64_t)a3, v15);
        long long v19 = *(_OWORD *)&a3->blue_combo_gain;
        long long v18 = *(_OWORD *)&a3->ispGainRangeExpansionFactor;
        *(_OWORD *)(v17 + 228) = *(_OWORD *)&a3->gain;
        *(_OWORD *)(v17 + 244) = v19;
        *(_OWORD *)(v17 + 260) = v18;
        long long v21 = *(_OWORD *)&a3->read_noise_1x;
        long long v20 = *(_OWORD *)&a3->lsModulationWeight;
        long long v22 = *(_OWORD *)&a3->exposure_time;
        *((_OWORD *)v17 + 20) = *(_OWORD *)&a3->ltm_locked;
        *(_OWORD *)(v17 + 292) = v21;
        *(_OWORD *)(v17 + 308) = v20;
        *(_OWORD *)(v17 + 276) = v22;
        objc_msgSend_objectAtIndexedSubscript_(*(void **)(*((void *)v11 + 1) + 8), v23, v15, v24);
        v25 = (uint64_t *)objc_claimAutoreleasedReturnValue();
        *((float *)v17 + 8) = sub_262FCDA18(v25[1], v16);
        *((float *)v17 + 9) = sub_262FCDA18(v25[2], v16);
        *((float *)v17 + 10) = sub_262FCDA18(v25[3], v16);
        if (v93)
        {
          uint64_t v26 = v25[13];
          if (!v26) {
            goto LABEL_56;
          }
          *(float *)((char *)&self->_ambnrConf[0].das.lumaDenoisingScalingOnSkin + v14) = sub_262FCDA18(v26, v16);
          uint64_t v27 = v25[14];
          if (!v27) {
            goto LABEL_56;
          }
          *(float *)((char *)&self->_ambnrConf[0].das.lumaSharpeningScalingOnSky + v14) = sub_262FCDA18(v27, v16);
          uint64_t v28 = v25[15];
          float v29 = 1.0;
          float v30 = 1.0;
          if (v28) {
            float v30 = sub_262FCDA18(v28, v16);
          }
          *(float *)((char *)&self->_ambnrConf[0].das.lumaDenoisingScalingOnSky + v14) = v30;
          uint64_t v31 = v25[16];
          if (v31) {
            float v29 = sub_262FCDA18(v31, v16);
          }
          *(float *)((char *)&self->_ambnrConf[0].das.luma3x3SharpeningStrength + v14) = v29;
          uint64_t v32 = v25[17];
          float v33 = v32 ? sub_262FCDA18(v32, v16) : 0.0;
          *(float *)((char *)&self->_ambnrConf[0].das.flatnessBoost + v14) = v33;
          uint64_t v41 = v25[18];
          if (!v41
            || (*(float *)((char *)&self->_ambnrConf[0].das.flatnessThreshold + v14) = sub_262FCDA18(v41, v16),
                (uint64_t v40 = v25[19]) == 0))
          {
LABEL_56:
            FigDebugAssert3();
            int v90 = FigSignalErrorAt();

            goto LABEL_55;
          }
        }
        else
        {
          *((float *)v17 + 11) = sub_262FCDA18(v25[4], v16);
          *((float *)v17 + 12) = sub_262FCDA18(v25[5], v16);
          uint64_t v34 = v25[6];
          float v35 = 1.0;
          float v36 = 1.0;
          if (v34) {
            float v36 = sub_262FCDA18(v34, v16);
          }
          *(float *)((char *)&self->_ambnrConf[0].das.lumaDenoisingScalingOnSky + v14) = v36;
          uint64_t v37 = v25[7];
          if (v37) {
            float v35 = sub_262FCDA18(v37, v16);
          }
          *(float *)((char *)&self->_ambnrConf[0].das.luma3x3SharpeningStrength + v14) = v35;
          uint64_t v38 = v25[10];
          if (v38) {
            float v39 = sub_262FCDA18(v38, v16);
          }
          else {
            float v39 = 0.0;
          }
          *(float *)((char *)&self->_ambnrConf[0].das.flatnessBoost + v14) = v39;
          *(float *)((char *)&self->_ambnrConf[0].das.flatnessThreshold + v14) = sub_262FCDA18(v25[11], v16);
          uint64_t v40 = v25[12];
        }
        *(float *)((char *)&self->_ambnrConf[0].das.gdFlatnessBoostMidtone + v14) = sub_262FCDA18(v40, v16);
        if (*(float *)((char *)&self->_ambnrConf[0].das.lumaSharpeningScalingOnSky + v14) < 1.0
          || *((float *)v17 + 10) < 1.0)
        {
          goto LABEL_56;
        }
        objc_super v42 = (float *)((char *)self + v14);
        *(float *)((char *)&self->_ambnrConf[0].das.gdFlatnessMidtoneValue + v14) = sub_262FCDA18(v25[20], v16);
        v42[21] = sub_262FCDA18(v25[21], v16);
        v42[29] = sub_262FCDA18(v25[29], v16);
        v42[30] = sub_262FCDA18(v25[30], v16);
        v42[31] = sub_262FCDA18(v25[31], v16);
        uint64_t v43 = v25[26];
        float v44 = 0.0;
        float v45 = 0.0;
        if (v43) {
          float v45 = sub_262FCDA18(v43, v16);
        }
        v42[26] = v45;
        uint64_t v46 = v25[27];
        if (v46) {
          float v44 = sub_262FCDA18(v46, v16);
        }
        *(float *)((char *)&self->_ambnrConf[0].das.radialSharpnessBoost + v14) = v44;
        uint64_t v47 = v25[28];
        float v48 = 0.0;
        float v49 = 0.0;
        if (v47) {
          float v49 = sub_262FCDA18(v47, v16);
        }
        *(float *)((char *)&self->_ambnrConf[0].das.blueBoost + v14) = v49;
        uint64_t v50 = v25[22];
        if (v50) {
          float v48 = sub_262FCDA18(v50, v16);
        }
        *(float *)((char *)&self->_ambnrConf[0].das.gdFlatnessBoostHighlight + v14) = v48;
        uint64_t v51 = v25[23];
        if (v51) {
          float v52 = sub_262FCDA18(v51, v16);
        }
        else {
          float v52 = 0.25;
        }
        *(float *)((char *)&self->_ambnrConf[0].das.gdTexturenessThresholdLow + v14) = v52;
        uint64_t v53 = v25[24];
        float v54 = 0.0;
        float v55 = 0.0;
        if (v53) {
          float v55 = sub_262FCDA18(v53, v16);
        }
        *(float *)((char *)&self->_ambnrConf[0].das.gdTexturenessThresholdHigh + v14) = v55;
        uint64_t v56 = v25[25];
        if (v56) {
          float v54 = sub_262FCDA18(v56, v16);
        }
        *(float *)((char *)&self->_ambnrConf[0].das.gdTexturenessShadingFactor + v14) = v54;
        uint64_t v57 = v25[9];
        float v58 = 1.0;
        float v59 = 1.0;
        if (v57) {
          float v59 = sub_262FCDA18(v57, v16);
        }
        v60 = (float *)((char *)self + v14);
        *(float *)((char *)&self->_ambnrConf[0].das.lumaLowVarDetailsLevel + v14) = v59;
        uint64_t v61 = v25[8];
        if (v61) {
          float v58 = sub_262FCDA18(v61, v16);
        }
        v60[15] = v58;
        v60[51] = v11[12];
        v60[52] = v11[13];
        v60[53] = v11[14];
        v60[54] = v11[15];
        v60[55] = v11[16];
        v60[56] = v11[17];
        v60[32] = sub_262FCDA18(*(void *)(*((void *)v11 + 1) + 16), v16);
        v60[33] = sub_262FCDA18(*(void *)(*((void *)v11 + 1) + 24), v16);
        v60[34] = sub_262FCDA18(*(void *)(*((void *)v11 + 1) + 48), v16);
        v60[35] = sub_262FCDA18(*(void *)(*((void *)v11 + 1) + 56), v16);
        v60[36] = sub_262FCDA18(*(void *)(*((void *)v11 + 1) + 64), v16);
        *((unsigned char *)v60 + 148) = *((unsigned char *)v11 + 16);
        *((unsigned char *)v60 + 149) = *((unsigned char *)v11 + 17);
        *((unsigned char *)v60 + 150) = *((unsigned char *)v11 + 18);
        *((unsigned char *)v60 + 151) = *((unsigned char *)v11 + 19);
        *((unsigned char *)v60 + 152) = *((unsigned char *)v11 + 20);
        v60[39] = v11[6];
        v60[40] = v11[7];
        v60[41] = v11[8];
        v60[42] = v11[9];
        *((unsigned char *)v60 + 172) = *((unsigned char *)v11 + 40);
        *((unsigned char *)v60 + 173) = *((unsigned char *)v11 + 41);
        v60[44] = v11[11];
        v60[45] = *(float *)(*((void *)v11 + 1) + 72);
        v60[46] = *(float *)(*((void *)v11 + 1) + 76);
        v60[47] = *(float *)(*((void *)v11 + 1) + 80);
        v60[48] = *(float *)(*((void *)v11 + 1) + 84);
        v60[49] = *(float *)(*((void *)v11 + 1) + 88);
        v60[50] = *(float *)(*((void *)v11 + 1) + 92);

        ++v15;
        uint64_t v64 = self->_pyramid->levels;
        v14 += 352;
      }
      while (v15 < v64);
      if ((int)v64 >= 2)
      {
        uint64_t v65 = 0;
        __asm { FMOV            V8.2S, #-0.25 }
        do
        {
          objc_msgSend_selectBlurKernelSize_(self, v62, (uint64_t)ambnrConf + 352 * v65, v63);
          v72 = &self->_pyrFilters[v65];
          v72->filterType = 1;
          *(void *)&v72->luma_param = *((void *)&ambnrConf[1].nm.lumaSigmaSlope + 44 * v65);
          if (self->_upsampleOffsetEnabled)
          {
            uint64_t v73 = v65 + 1;
            uint64_t v74 = objc_msgSend_width(self->_pyramid->textureY[v65 + 1], v62, v71, v63);
            uint64_t v78 = objc_msgSend_height(self->_pyramid->textureY[v65 + 1], v75, v76, v77);
            v79.i64[0] = v74;
            v79.i64[1] = v78;
            *((float32x2_t *)&ambnrConf[1].das.chromaDenoiseLumaThresholdGain + 44 * v65) = vdiv_f32(_D8, vcvt_f32_f64(vcvtq_f64_u64(v79)));
            uint64_t v83 = objc_msgSend_width(self->_pyramid->textureUV[v65 + 1], v80, v81, v82);
            uint64_t v87 = objc_msgSend_height(self->_pyramid->textureUV[v65 + 1], v84, v85, v86);
            v88.i64[0] = v83;
            v88.i64[1] = v87;
            float32x2_t v89 = vdiv_f32(_D8, vcvt_f32_f64(vcvtq_f64_u64(v88)));
          }
          else
          {
            float32x2_t v89 = 0;
            *((void *)&ambnrConf[1].das.chromaDenoiseLumaThresholdGain + 44 * v65) = 0;
            uint64_t v73 = v65 + 1;
          }
          *((float32x2_t *)&ambnrConf[1].das.chromaDenoiseMixingCoeff + 44 * v65) = v89;
          uint64_t v65 = v73;
        }
        while (v73 < self->_pyramid->levels - 1);
      }
    }
    int v90 = 0;
  }
LABEL_55:

  return v90;
}

- (int)greenGhostMitigationWithExposure:(const exposureParameters *)a3 faceLandMarks:(id)a4 ev0FrameMetadata:(const frameMetadata *)a5 evmFrameMetadata:(const frameMetadata *)a6 greenGhostBrightLightTuning:(id)a7 greenGhostIsRunning:(BOOL *)a8 gainMap:(id)a9
{
  uint64_t v187 = *MEMORY[0x263EF8340];
  id v15 = a4;
  id v16 = a7;
  id v170 = a9;
  float v20 = a3->gain * a3->exposure_time;
  if (v16)
  {
    objc_msgSend_tuningParams(v16, v17, v18, v19);
    float v21 = *((float *)&v174 + 1);
  }
  else
  {
    uint64_t v184 = 0;
    long long v182 = 0u;
    long long v183 = 0u;
    long long v180 = 0u;
    long long v181 = 0u;
    long long v178 = 0u;
    long long v179 = 0u;
    long long v176 = 0u;
    long long v177 = 0u;
    float v21 = 0.0;
    long long v174 = 0u;
    long long v175 = 0u;
  }
  unsigned int v22 = objc_msgSend_width(self->_outputImg->lumaTex, v17, v18, v19);
  unsigned int v26 = objc_msgSend_height(self->_outputImg->lumaTex, v23, v24, v25);
  *(void *)&long long v30 = 0;
  *((void *)&v30 + 1) = __PAIR64__(v26, v22);
  long long v173 = v30;
  if (v20 >= v21)
  {
    if (dword_26B429788)
    {
      objc_super v42 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    if (!v16)
    {
      unsigned int v169 = 0;
      goto LABEL_17;
    }
    objc_msgSend_tuningParams(v16, v27, v28, v29);
    if (!v172)
    {
      unsigned int v169 = 0;
      goto LABEL_17;
    }
    if (a6 && LOBYTE(a6[1].exposureParams.blue_combo_gain)
      || a5 && (a6 = a5, LOBYTE(a5[1].exposureParams.blue_combo_gain)))
    {
      v186[0] = *(_OWORD *)&a6[1].exposureParams.isp_digital_gain;
      objc_msgSend_tuningParams(v16, v31, v32, v33);
      v185[0] = v171;
      uint64_t v37 = objc_msgSend_width(self->_outputImg->lumaTex, v34, v35, v36);
      uint64_t v41 = objc_msgSend_height(self->_outputImg->lumaTex, v38, v39, v40);
      if (!sub_262F9C69C((uint64_t)v186, (char *)&v173, v37, v41, (uint64_t)v185))
      {
        FigDebugAssert3();
        uint64_t v44 = 0;
        int v46 = 0;
        uint64_t v45 = 1;
        goto LABEL_30;
      }
      unsigned int v169 = 1;
LABEL_17:
      if (dword_26B429788)
      {
        uint64_t v43 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      *a8 = 1;
      uint64_t v50 = (uint64_t *)objc_opt_new();
      if (!v50)
      {
        FigDebugAssert3();
        int v46 = FigSignalErrorAt();
        goto LABEL_29;
      }
      id v168 = v15;
      uint64_t v51 = objc_msgSend_allocator(self->_metalContext, v47, v48, v49);
      float v55 = objc_msgSend_newTextureDescriptor(v51, v52, v53, v54);

      if (v55)
      {
        float v59 = a5;
        v60 = objc_msgSend_desc(v55, v56, v57, v58);
        objc_msgSend_setUsage_(v60, v61, 7, v62);

        v66 = objc_msgSend_desc(v55, v63, v64, v65);
        objc_msgSend_setCompressionMode_(v66, v67, 2, v68);

        v72 = objc_msgSend_desc(v55, v69, v70, v71);
        objc_msgSend_setCompressionFootprint_(v72, v73, 0, v74);

        uint64_t v78 = objc_msgSend_width(self->_outputImg->lumaTex, v75, v76, v77);
        uint64_t v82 = objc_msgSend_desc(v55, v79, v80, v81);
        objc_msgSend_setWidth_(v82, v83, v78, v84);

        uint64_t v88 = objc_msgSend_height(self->_outputImg->lumaTex, v85, v86, v87);
        v92 = objc_msgSend_desc(v55, v89, v90, v91);
        objc_msgSend_setHeight_(v92, v93, v88, v94);

        v98 = objc_msgSend_desc(v55, v95, v96, v97);
        objc_msgSend_setPixelFormat_(v98, v99, 10, v100);

        objc_msgSend_setLabel_(v55, v101, 0, v102);
        v106 = objc_msgSend_allocator(self->_metalContext, v103, v104, v105);
        uint64_t v109 = objc_msgSend_newTextureWithDescriptor_(v106, v107, (uint64_t)v55, v108);
        v110 = (void *)v50[2];
        v50[2] = v109;

        if (v50[2])
        {
          uint64_t v114 = objc_msgSend_width(self->_outputImg->chromaTex, v111, v112, v113);
          v118 = objc_msgSend_desc(v55, v115, v116, v117);
          objc_msgSend_setWidth_(v118, v119, v114, v120);

          uint64_t v124 = objc_msgSend_height(self->_outputImg->chromaTex, v121, v122, v123);
          v128 = objc_msgSend_desc(v55, v125, v126, v127);
          objc_msgSend_setHeight_(v128, v129, v124, v130);

          v134 = objc_msgSend_desc(v55, v131, v132, v133);
          objc_msgSend_setPixelFormat_(v134, v135, 30, v136);

          objc_msgSend_setLabel_(v55, v137, 0, v138);
          v142 = objc_msgSend_allocator(self->_metalContext, v139, v140, v141);
          uint64_t v145 = objc_msgSend_newTextureWithDescriptor_(v142, v143, (uint64_t)v55, v144);
          v146 = (void *)v50[3];
          v50[3] = v145;

          if (v50[3])
          {
            id v15 = v168;
            int v148 = objc_msgSend_GhostMitigationWithPyr_outputImage_tuning_faceLandMarks_ev0FrameMetadata_roi_gainMap_(self->_greenGhostStage, v147, (uint64_t)self->_outputPyr, (uint64_t)v50, v16, v168, v59, v170, *(double *)&v173);
            if (v148)
            {
              int v46 = v148;
            }
            else
            {
              int v150 = objc_msgSend_copyTexture_outTex_(self->_textureUtils, v149, v50[2], (uint64_t)self->_outputImg->lumaTex);
              if (v150)
              {
                int v46 = v150;
              }
              else
              {
                int v46 = objc_msgSend_copyTexture_outTex_(self->_textureUtils, v151, v50[3], (uint64_t)self->_outputImg->chromaTex);
                if (!v46)
                {
                  FigMetalDecRef();
                  FigMetalDecRef();
LABEL_28:

LABEL_29:
                  uint64_t v44 = v169;
                  uint64_t v45 = v169;
                  goto LABEL_30;
                }
              }
            }
            FigDebugAssert3();
            goto LABEL_28;
          }
        }
        FigDebugAssert3();
        int v46 = FigSignalErrorAt();
      }
      else
      {
        FigDebugAssert3();
        int v46 = FigSignalErrorAt();
      }
      id v15 = v168;
      goto LABEL_29;
    }
    FigDebugAssert3();
  }
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  int v46 = 0;
LABEL_30:
  v152 = objc_opt_new();
  v155 = objc_msgSend_numberWithBool_(NSNumber, v153, v20 < v21, v154);
  objc_msgSend_setObject_forKeyedSubscript_(v152, v156, (uint64_t)v155, @"isBrightScene");

  v159 = objc_msgSend_numberWithBool_(NSNumber, v157, v44, v158);
  objc_msgSend_setObject_forKeyedSubscript_(v152, v160, (uint64_t)v159, @"roiIsComputed");

  v163 = objc_msgSend_numberWithBool_(NSNumber, v161, v45, v162);
  objc_msgSend_setObject_forKeyedSubscript_(v152, v164, (uint64_t)v163, @"hasValidClippingData");

  id WeakRetained = objc_loadWeakRetained((id *)&self->_sidecarWriter);
  objc_msgSend_addToSidecar_forKey_(WeakRetained, v166, (uint64_t)v152, @"GreenGhostBrightLight");

  return v46;
}

- (int)runWithExposure:(const exposureParameters *)a3 staticScene:(BOOL)a4 dasPlist:(id)a5 nmPlist:(id)a6 defringingTuning:(id)a7 greenGhostBrightLightTuning:(id)a8 greenGhostEnabled:(BOOL)a9 skinMask:(id)a10 skyMask:(id)a11 maskExtent:(CGRect)a12 faceLandMarks:(id)a13 ev0FrameMetadata:(const frameMetadata *)a14 evmFrameMetadata:(const frameMetadata *)a15 defringeEnabled:(BOOL)a16 isLowLight:(BOOL)a17 gainMap:(id)a18
{
  BOOL v179 = a4;
  double height = a12.size.height;
  double width = a12.size.width;
  double y = a12.origin.y;
  double x = a12.origin.x;
  uint64_t v207 = *MEMORY[0x263EF8340];
  id v27 = a5;
  id v28 = a6;
  id v184 = a7;
  id v183 = a8;
  id v186 = a10;
  id v185 = a11;
  id v182 = a13;
  id v181 = a18;
  id v206 = 0;
  uint64_t v32 = objc_msgSend_allocator(self->_metalContext, v29, v30, v31);
  uint64_t v36 = objc_msgSend_newTextureDescriptor(v32, v33, v34, v35);

  if (!v36)
  {
    FigDebugAssert3();
    int v174 = FigSignalErrorAt();
    v67 = 0;
    uint64_t v51 = v27;
LABEL_42:
    float v52 = v184;
    goto LABEL_39;
  }
  uint64_t v40 = objc_msgSend_desc(v36, v37, v38, v39);
  objc_msgSend_setUsage_(v40, v41, 7, v42);

  uint64_t v51 = v27;
  if (objc_msgSend_computeConfiguration_staticScene_dasPlist_nmPlist_isLowLight_(self, v43, (uint64_t)a3, v179, v27, v28, a17))
  {
    FigDebugAssert3();
    int v174 = FigSignalErrorAt();
    v67 = 0;
    goto LABEL_42;
  }
  float v52 = v184;
  if (self->_inputPyramidGenerationEnabled
    && (objc_msgSend_setResourcesWithPyramid_(self->_pyramidStage, v44, (uint64_t)self->_pyramid, v46)
     || objc_msgSend_runWithFilters_(self->_pyramidStage, v53, (uint64_t)self->_pyrFilters, v54)))
  {
    FigDebugAssert3();
    int v174 = FigSignalErrorAt();
    v67 = 0;
    goto LABEL_39;
  }
  id v180 = v28;
  long long v178 = a3;
  if (!a16) {
    goto LABEL_17;
  }
  *(float *)&double v48 = a3->exposure_time;
  *(float *)&double v47 = a3->gain;
  *(float *)&double v49 = a3->red_gain;
  *(float *)&double v50 = a3->blue_gain;
  objc_msgSend_setMetadataGain_exposureTime_AWBRGain_AWBBGain_(v184, v44, v45, v46, v47, v48, v49, v50);
  if (v184)
  {
    objc_msgSend_correctionParams(v184, v55, v56, v57);
    float v58 = *((float *)&v203 + 1);
  }
  else
  {
    long long v203 = 0u;
    long long v204 = 0u;
    long long v201 = 0u;
    long long v202 = 0u;
    long long v199 = 0u;
    long long v200 = 0u;
    long long v197 = 0u;
    long long v198 = 0u;
    long long v195 = 0u;
    long long v196 = 0u;
    long long v193 = 0u;
    long long v194 = 0u;
    long long v191 = 0u;
    long long v192 = 0u;
    float v58 = 0.0;
    uint64_t v205 = 0;
  }
  if (v58 <= 0.1)
  {
    if (dword_26B429788)
    {
      int v190 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v63 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
LABEL_17:
    FigMetalDecRef();
    FigMetalDecRef();
    FigMetalDecRef();
    FigMetalDecRef();
    v67 = self->_pyramid;
    goto LABEL_21;
  }
  if (!self->_defringeStage || (objc_msgSend_defringingEnabled(v184, v55, v56, v57) & 1) == 0)
  {
    int v174 = FigSignalErrorAt();
    v67 = 0;
    goto LABEL_39;
  }
  if (dword_26B429788)
  {
    int v190 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    uint64_t v62 = (id)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT);

    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v68 = objc_msgSend_width(self->_pyramid->textureY[1], v59, v60, v61);
  v72 = objc_msgSend_desc(v36, v69, v70, v71);
  objc_msgSend_setWidth_(v72, v73, v68, v74);

  uint64_t v78 = objc_msgSend_height(self->_pyramid->textureY[1], v75, v76, v77);
  uint64_t v82 = objc_msgSend_desc(v36, v79, v80, v81);
  objc_msgSend_setHeight_(v82, v83, v78, v84);

  uint64_t v88 = objc_msgSend_desc(v36, v85, v86, v87);
  objc_msgSend_setPixelFormat_(v88, v89, 65, v90);

  objc_msgSend_setLabel_(v36, v91, 0, v92);
  uint64_t v96 = objc_msgSend_allocator(self->_metalContext, v93, v94, v95);
  v99 = objc_msgSend_newTextureWithDescriptor_(v96, v97, (uint64_t)v36, v98);
  id v206 = v99;

  if (!v99)
  {
    FigDebugAssert3();
    int v174 = FigSignalErrorAt();
LABEL_54:
    v67 = 0;
    goto LABEL_39;
  }
  int v101 = objc_msgSend_defringePyramid_outputPyramid_chromaScratch_tuningParameters_(self->_defringeStage, v100, (uint64_t)self->_pyramid, (uint64_t)self->_defringePyramid, v99, v184);
  if (v101)
  {
    int v174 = v101;
    FigDebugAssert3();
    goto LABEL_54;
  }
  v67 = self->_defringePyramid;
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
LABEL_21:
  if (self->_noiseMapPyramid)
  {
    metalContext = self->_metalContext;
    uint64_t v103 = objc_msgSend_width(v67->textureY[0], v64, v65, v66);
    uint64_t v107 = objc_msgSend_height(v67->textureY[0], v104, v105, v106);
    int isFP16_pyramid = objc_msgSend_allocatePyramidWithMetalContext_label_width_height_isFP16_pyramid_(PyramidStorage_NRF, v108, (uint64_t)metalContext, @"_noiseMapPyramid", v103, v107, 1, self->_noiseMapPyramid);
    if (isFP16_pyramid)
    {
      int v174 = isFP16_pyramid;
      goto LABEL_48;
    }
    noiseMapPyramid = self->_noiseMapPyramid;
    if (noiseMapPyramid)
    {
      if (objc_msgSend_setResourcesWithPyramid_(self->_pyramidStage, v64, (uint64_t)noiseMapPyramid, v66)
        || objc_msgSend_runWithFilters_(self->_pyramidStage, v111, (uint64_t)self->_pyrFilters, v112))
      {
        goto LABEL_51;
      }
    }
  }
  if (objc_msgSend_setUniforms_(self->_denoiseRemixStage, v64, (uint64_t)self->_ambnrConf, v66, v176, v177))
  {
LABEL_51:
    FigDebugAssert3();
    int v174 = FigSignalErrorAt();
    goto LABEL_39;
  }
  uint64_t v116 = self->_metalContext;
  uint64_t v117 = objc_msgSend_width(self->_pyramid->textureY[0], v113, v114, v115);
  uint64_t v121 = objc_msgSend_height(self->_pyramid->textureY[0], v118, v119, v120);
  int v123 = objc_msgSend_allocatePyramidWithMetalContext_label_width_height_isFP16_pyramid_(PyramidStorage_NRF, v122, (uint64_t)v116, @"_outputPyr", v117, v121, 1, self->_outputPyr);
  if (v123)
  {
    int v174 = v123;
LABEL_48:
    FigDebugAssert3();
    goto LABEL_39;
  }
  int v125 = objc_msgSend_run_skinMask_skyMask_maskExtent_(self->_denoiseRemixStage, v124, (uint64_t)v67, (uint64_t)v186, v185, x, y, width, height);
  if (v125)
  {
    int v174 = v125;
    goto LABEL_48;
  }
  objc_storeStrong((id *)&self->_outputImg->lumaTex, self->_outputPyr->textureY[0]);
  objc_storeStrong((id *)&self->_outputImg->chromaTex, self->_outputPyr->textureUV[0]);
  unsigned __int8 v188 = 0;
  if (!a9)
  {
LABEL_35:
    v160 = objc_opt_new();
    v163 = objc_msgSend_numberWithBool_(NSNumber, v161, a9, v162);
    objc_msgSend_setObject_forKeyedSubscript_(v160, v164, (uint64_t)v163, @"isEnabled");

    v167 = objc_msgSend_numberWithBool_(NSNumber, v165, v188, v166);
    objc_msgSend_setObject_forKeyedSubscript_(v160, v168, (uint64_t)v167, @"isRunning");

    id WeakRetained = objc_loadWeakRetained((id *)&self->_sidecarWriter);
    objc_msgSend_addToSidecar_forKey_(WeakRetained, v170, (uint64_t)v160, @"GreenGhostBrightLight");

    objc_msgSend_makePyramidAliasable_metal_(PyramidStorage_NRF, v171, (uint64_t)self->_outputPyr, (uint64_t)self->_metalContext);
    long long v173 = self->_noiseMapPyramid;
    if (v173) {
      objc_msgSend_makePyramidAliasable_metal_(PyramidStorage_NRF, v172, (uint64_t)v173, (uint64_t)self->_metalContext);
    }
    int v174 = 0;
    goto LABEL_38;
  }
  v129 = v51;
  uint64_t v130 = (int *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10])
  {
    v131 = objc_msgSend_commandQueue(self->_metalContext, v126, v127, v128);
    v135 = objc_msgSend_commandBuffer(v131, v132, v133, v134);

    id v28 = v180;
    objc_msgSend_setLabel_(v135, v136, @"KTRACE_START_MTL", v137);
    objc_msgSend_addCompletedHandler_(v135, v138, (uint64_t)&unk_270E34448, v139);
    objc_msgSend_commit(v135, v140, v141, v142);
  }
  int IsRunning_gainMap = objc_msgSend_greenGhostMitigationWithExposure_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_greenGhostBrightLightTuning_greenGhostIsRunning_gainMap_(self, v126, (uint64_t)v178, (uint64_t)v182, a14, a15, v183, &v188, v181);
  if (!IsRunning_gainMap)
  {
    int v147 = *v130;
    uint64_t v51 = v129;
    if (v147)
    {
      int v148 = objc_msgSend_commandQueue(self->_metalContext, v144, v145, v146);
      v152 = objc_msgSend_commandBuffer(v148, v149, v150, v151);

      objc_msgSend_setLabel_(v152, v153, @"KTRACE_END_MTL", v154);
      v187[0] = MEMORY[0x263EF8330];
      v187[1] = 3221225472;
      v187[2] = sub_262FF92A0;
      v187[3] = &unk_2655C32E8;
      memset(&v187[4], 0, 24);
      objc_msgSend_addCompletedHandler_(v152, v155, (uint64_t)v187, v156);
      objc_msgSend_commit(v152, v157, v158, v159);
    }
    goto LABEL_35;
  }
  int v174 = IsRunning_gainMap;
  FigDebugAssert3();
  uint64_t v51 = v129;
LABEL_38:
  float v52 = v184;
LABEL_39:

  return v174;
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