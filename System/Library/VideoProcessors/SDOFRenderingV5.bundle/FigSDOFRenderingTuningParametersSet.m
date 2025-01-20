@interface FigSDOFRenderingTuningParametersSet
- ($56A7D0D9115FBA927525223D43EC1313)mattingConfig;
- (BOOL)readBlurMapSmoothingConfig:(id)a3;
- (BOOL)readDisparityRefinementConfig:(id)a3;
- (BOOL)readHairNetConfig:(id)a3;
- (BOOL)readMattingConfig:(id)a3;
- (BOOL)readRenderingConfig:(id)a3;
- (BOOL)readSLMConfig:(id)a3;
- (FigSDOFRenderingTuningParametersSet)init;
- (FigSDOFRenderingTuningParametersSet)initWithTuningDictionary:(id)a3 suffix:(id)a4;
- (blurmap_refinement_params)blurmapRefinementConfig;
- (blurmap_smoothing_params)blurmapSmoothingConfig;
- (crisp_hair_params)crispHairConfig;
- (disparity_refinement_params)disparityRefinementConfig;
- (dynamic_tuning_parameters)dynamicParams;
- (face_mask_params)faceMaskConfig;
- (hairnet_params)hairnetConfig;
- (id)noiseEstimationConfig;
- (int)disparityRefinementVersion;
- (int)renderingMajorVersion;
- (rendering_config_params)renderingConfig;
- (segmentation_fusion_params)segmentationFusionConfig;
- (simple_lens_model_params)simpleLensModelConfig;
- (xhlrb_control_logic_params)xhlrbControlConfig;
@end

@implementation FigSDOFRenderingTuningParametersSet

- (FigSDOFRenderingTuningParametersSet)init
{
  v43.receiver = self;
  v43.super_class = (Class)FigSDOFRenderingTuningParametersSet;
  v2 = [(FigSDOFRenderingTuningParametersSet *)&v43 init];
  v3 = v2;
  if (v2)
  {
    v4 = v2 + 356;
    *((_DWORD *)v2 + 300) = 4;
    sub_26353BBF0(&v31);
    long long v5 = v31;
    *(_OWORD *)(v3 + 184) = v32;
    long long v6 = v34;
    *(_OWORD *)(v3 + 200) = v33;
    *(_OWORD *)(v3 + 216) = v6;
    *(_OWORD *)(v3 + 232) = v35;
    *(_OWORD *)(v3 + 168) = v5;
    _OWORD *v4 = xmmword_2635447D0;
    *(_OWORD *)(v3 + 372) = xmmword_2635447E0;
    *(_OWORD *)(v3 + 388) = xmmword_2635447F0;
    *(void *)(v3 + 404) = 0x3F8000003E560419;
    *((_DWORD *)v3 + 164) = 5;
    *(_OWORD *)(v3 + 660) = xmmword_263544800;
    *((int32x2_t *)v3 + 110) = vdup_n_s32(0x40B33333u);
    *((void *)v3 + 111) = 0x23D4CCCCDLL;
    *((_OWORD *)v3 + 56) = xmmword_263544810;
    *((void *)v3 + 114) = 0;
    *((void *)v3 + 115) = 0x400000004;
    *((void *)v3 + 116) = 0x2B8CBCCC00000004;
    *((void *)v3 + 117) = 0x33DCCCCCDLL;
    *((_OWORD *)v3 + 59) = xmmword_263544820;
    *((_OWORD *)v3 + 60) = xmmword_263544830;
    *((_DWORD *)v3 + 244) = 50;
    *(_OWORD *)(v3 + 980) = xmmword_263544840;
    *(_OWORD *)(v3 + 996) = xmmword_263544850;
    *((_DWORD *)v3 + 253) = 0;
    *((_DWORD *)v3 + 257) = 8;
    *((_DWORD *)v3 + 259) = 1082130432;
    *((_DWORD *)v3 + 262) = 0;
    *((void *)v3 + 130) = 0;
    *(_OWORD *)(v3 + 1052) = xmmword_263544860;
    *(_OWORD *)(v3 + 1068) = xmmword_263544870;
    *((_DWORD *)v3 + 271) = 1061158912;
    *((_DWORD *)v3 + 106) = 1085485875;
    *((void *)v3 + 52) = 0x40B333333CF5C28FLL;
    __asm { FMOV            V0.4S, #-1.0 }
    *((_OWORD *)v3 + 27) = _Q0;
    *((_OWORD *)v3 + 28) = _Q0;
    *((_OWORD *)v3 + 29) = _Q0;
    *((_OWORD *)v3 + 30) = _Q0;
    *((_OWORD *)v3 + 31) = _Q0;
    *((_OWORD *)v3 + 32) = _Q0;
    *((_OWORD *)v3 + 33) = _Q0;
    *((_OWORD *)v3 + 34) = _Q0;
    *((_OWORD *)v3 + 35) = xmmword_263544880;
    *((_OWORD *)v3 + 36) = xmmword_263544890;
    *((void *)v3 + 74) = 0x3F0000003E4CCCCDLL;
    *((_DWORD *)v3 + 150) = 0;
    sub_263542400((uint64_t)&v31);
    long long v12 = v32;
    *((_OWORD *)v3 + 38) = v31;
    *((_OWORD *)v3 + 39) = v12;
    *((_DWORD *)v3 + 160) = v33;
    sub_26353BBAC(&v31);
    long long v13 = *(_OWORD *)v42;
    *(_OWORD *)(v3 + 836) = v41;
    *(_OWORD *)(v3 + 852) = v13;
    *((_OWORD *)v3 + 54) = *(_OWORD *)&v42[12];
    long long v14 = v38;
    *(_OWORD *)(v3 + 772) = v37;
    *(_OWORD *)(v3 + 788) = v14;
    long long v15 = v40;
    *(_OWORD *)(v3 + 804) = v39;
    *(_OWORD *)(v3 + 820) = v15;
    long long v16 = v34;
    *(_OWORD *)(v3 + 708) = v33;
    *(_OWORD *)(v3 + 724) = v16;
    long long v17 = v36;
    *(_OWORD *)(v3 + 740) = v35;
    *(_OWORD *)(v3 + 756) = v17;
    long long v18 = v32;
    *(_OWORD *)(v3 + 676) = v31;
    *(_OWORD *)(v3 + 692) = v18;
    sub_2635423C4((uint64_t)&v31);
    *((_OWORD *)v3 + 21) = v31;
    *((_DWORD *)v3 + 88) = v32;
    sub_2635423E4(&v31);
    long long v19 = v32;
    *((_OWORD *)v3 + 68) = v31;
    *((_OWORD *)v3 + 69) = v19;
    long long v20 = v34;
    *((_OWORD *)v3 + 70) = v33;
    *((_OWORD *)v3 + 71) = v20;
    *((_OWORD *)v3 + 72) = xmmword_2635448A0;
    *((_OWORD *)v3 + 73) = xmmword_2635448B0;
    *((void *)v3 + 148) = 0x38D1B71741000000;
    *((void *)v3 + 149) = 0x3F80000000000032;
    sub_263542254((uint64_t)&v31, (int32x2_t)(COERCE_UNSIGNED_INT(1.0) | 0x38D1B71700000000));
    long long v21 = v31;
    *(_OWORD *)(v3 + 24) = v32;
    *(_OWORD *)(v3 + 8) = v21;
    LODWORD(v21) = *((_DWORD *)v3 + 160);
    sub_263542254((uint64_t)&v31, *(int32x2_t *)&v21);
    v22.i32[1] = DWORD1(v31);
    long long v23 = v32;
    *(_OWORD *)(v3 + 72) = v31;
    *(_OWORD *)(v3 + 88) = v23;
    v22.i32[0] = *((_DWORD *)v3 + 157);
    sub_263542254((uint64_t)&v31, v22);
    v24.i32[1] = DWORD1(v31);
    long long v25 = v32;
    *(_OWORD *)(v3 + 40) = v31;
    *(_OWORD *)(v3 + 56) = v25;
    v24.i32[0] = *((_DWORD *)v3 + 183);
    sub_263542254((uint64_t)&v31, v24);
    v26.i32[1] = DWORD1(v31);
    long long v27 = v32;
    *(_OWORD *)(v3 + 136) = v31;
    *(_OWORD *)(v3 + 152) = v27;
    v26.i32[0] = *((_DWORD *)v3 + 180);
    sub_263542254((uint64_t)&v31, v26);
    long long v28 = v32;
    *(_OWORD *)(v3 + 104) = v31;
    *(_OWORD *)(v3 + 120) = v28;
    *((void *)v3 + 41) = 0x73D4CCCCDLL;
    v29 = v3;
  }

  return (FigSDOFRenderingTuningParametersSet *)v3;
}

- (BOOL)readDisparityRefinementConfig:(id)a3
{
  id v4 = a3;
  long long v5 = v4;
  if (!v4) {
    goto LABEL_28;
  }
  if (!sub_263537014(v4, (uint64_t)"version", &self->_disparityRefinementVersion)) {
    goto LABEL_28;
  }
  if (!sub_263537014(v5, (uint64_t)"radius", &self->_disparityRefinementConfig.radius)) {
    goto LABEL_28;
  }
  sub_2635370AC(v5, (uint64_t)"weightScaling", &self->_disparityRefinementConfig.weightScaling);
  if (!v6) {
    goto LABEL_28;
  }
  sub_2635370AC(v5, (uint64_t)"maxReconstructionWeight", &self->_disparityRefinementConfig.maxReconstructionWeight);
  if (!v7) {
    goto LABEL_28;
  }
  sub_2635370AC(v5, (uint64_t)"innerSamplingRadius", &self->_disparityRefinementConfig.innerSamplingRadius);
  if (!v8) {
    goto LABEL_28;
  }
  sub_2635370AC(v5, (uint64_t)"outerSamplingRadius", &self->_disparityRefinementConfig.outerSamplingRadius);
  if (!v9) {
    goto LABEL_28;
  }
  if (!sub_263537014(v5, (uint64_t)"nSamples", &self->_disparityRefinementConfig.nSamples)) {
    goto LABEL_28;
  }
  sub_2635370AC(v5, (uint64_t)"lumaSigma", &self->_disparityRefinementConfig.lumaSigma);
  if (!v10) {
    goto LABEL_28;
  }
  sub_2635370AC(v5, (uint64_t)"chromaSigma", &self->_disparityRefinementConfig.chromaSigma);
  if (!v11) {
    goto LABEL_28;
  }
  sub_2635370AC(v5, (uint64_t)"segmentationSigma", &self->_disparityRefinementConfig.segmentationSigma);
  if (!v12) {
    goto LABEL_28;
  }
  sub_2635370AC(v5, (uint64_t)"disparitySigma", &self->_disparityRefinementConfig.disparitySigma);
  if (!v13) {
    goto LABEL_28;
  }
  sub_2635370AC(v5, (uint64_t)"accumulatedWeightT0", &self->_disparityRefinementConfig.accumulatedWeightT0);
  if (!v14) {
    goto LABEL_28;
  }
  sub_2635370AC(v5, (uint64_t)"accumulatedWeightT1", &self->_disparityRefinementConfig.accumulatedWeightT1);
  if (!v15) {
    goto LABEL_28;
  }
  sub_2635370AC(v5, (uint64_t)"aaLumaSigma", &self->_disparityRefinementConfig.aaLumaSigma);
  if (!v16) {
    goto LABEL_28;
  }
  sub_2635370AC(v5, (uint64_t)"aaChromaSigma", &self->_disparityRefinementConfig.aaChromaSigma);
  if (!v17) {
    goto LABEL_28;
  }
  sub_2635370AC(v5, (uint64_t)"aaSegmentationSigma", &self->_disparityRefinementConfig.aaSegmentationSigma);
  if (!v18) {
    goto LABEL_28;
  }
  sub_2635370AC(v5, (uint64_t)"aaSpatialSigma", &self->_disparityRefinementConfig.aaSpatialSigma);
  if (!v19) {
    goto LABEL_28;
  }
  p_fgBlurScale = &self->_disparityRefinementConfig.fgBlurScale;
  if (SLODWORD(self[1].super.isa) < 7)
  {
    *(void *)p_fgBlurScale = 0;
    *(void *)&self->_disparityRefinementConfig.fgDeadZoneOffset = 0;
    BOOL v25 = 1;
    p_fgBlurScale[4] = 0.0;
    goto LABEL_27;
  }
  sub_2635370AC(v5, (uint64_t)"fgBlurScale", p_fgBlurScale);
  if (!v21
    || (sub_2635370AC(v5, (uint64_t)"fgBlurClamp", &self->_disparityRefinementConfig.fgBlurClamp), !v22)
    || (sub_2635370AC(v5, (uint64_t)"fgDeadZoneOffset", &self->_disparityRefinementConfig.fgDeadZoneOffset), !v23)
    || (sub_2635370AC(v5, (uint64_t)"fgFgBgThreshold", &self->_disparityRefinementConfig.fgFgBgThreshold), !v24)
    || !sub_263537014(v5, (uint64_t)"fgBgDilationSize", &self->_disparityRefinementConfig.fgBgDilationSize))
  {
LABEL_28:
    BOOL v25 = 0;
    goto LABEL_27;
  }
  BOOL v25 = 1;
LABEL_27:

  return v25;
}

- (BOOL)readSLMConfig:(id)a3
{
  id v4 = a3;
  long long v5 = v4;
  if (!v4) {
    goto LABEL_15;
  }
  sub_2635370AC(v4, (uint64_t)"fallbackFocusROI_left", &self->_simpleLensModelConfig.left);
  if (!v6) {
    goto LABEL_15;
  }
  sub_2635370AC(v5, (uint64_t)"fallbackFocusROI_top", &self->_simpleLensModelConfig.top);
  if (!v7) {
    goto LABEL_15;
  }
  sub_2635370AC(v5, (uint64_t)"fallbackFocusROI_width", &self->_simpleLensModelConfig.width);
  if (!v8) {
    goto LABEL_15;
  }
  sub_2635370AC(v5, (uint64_t)"fallbackFocusROI_height", &self->_simpleLensModelConfig.height);
  if (v9
    && (sub_2635370AC(v5, (uint64_t)"zeroShiftPercentile", &self->_simpleLensModelConfig.zeroShiftPercentile), v10)
    && (sub_2635370AC(v5, (uint64_t)"simulatedAperture", &self->_simpleLensModelConfig.simulatedAperture), v11)
    && (sub_2635370AC(v5, (uint64_t)"minimumSimulatedAperture", &self->_simpleLensModelConfig.minimumSimulatedAperture),
        v12)
    && (sub_2635370AC(v5, (uint64_t)"maximumSimulatedAperture", &self->_simpleLensModelConfig.maximumSimulatedAperture),
        v13)
    && (sub_2635370AC(v5, (uint64_t)"maxFGBlur", &self->_simpleLensModelConfig.maxFGBlur), v14)
    && (sub_2635370AC(v5, (uint64_t)"shiftDeadZone", &self->_simpleLensModelConfig.shiftDeadZone), v15)
    && (sub_26353728C(v5, (uint64_t)"disparityScalingFactor", &self->_dynamicParams.disparityScalingFactor.brightLightExposureLevel) & 1) != 0)
  {
    BOOL v16 = 1;
  }
  else
  {
LABEL_15:
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)readBlurMapSmoothingConfig:(id)a3
{
  id v4 = a3;
  long long v5 = v4;
  BOOL v10 = 0;
  if (v4)
  {
    if (sub_263537014(v4, (uint64_t)"nIterations", &self->_blurmapSmoothingConfig.originalBlurValueT1))
    {
      sub_2635370AC(v5, (uint64_t)"originalBlurValueT0", &self->_blurmapSmoothingConfig.localMinimumBlurValueT0);
      if (v6)
      {
        sub_2635370AC(v5, (uint64_t)"originalBlurValueT1", &self->_blurmapSmoothingConfig.localMinimumBlurValueT1);
        if (v7)
        {
          sub_2635370AC(v5, (uint64_t)"localMinimumBlurValueT0", &self->_blurmapRefinementConfig.personParams.fusion.subtractiveLowerAlpha);
          if (v8)
          {
            sub_2635370AC(v5, (uint64_t)"localMinimumBlurValueT1", &self->_blurmapRefinementConfig.personParams.fusion.subtractiveUpperAlpha);
            if (v9) {
              BOOL v10 = 1;
            }
          }
        }
      }
    }
  }

  return v10;
}

- (BOOL)readMattingConfig:(id)a3
{
  id v4 = a3;
  long long v5 = v4;
  if (!v4) {
    goto LABEL_16;
  }
  sub_2635370AC(v4, (uint64_t)"zeroShiftPercentile", &self->_mattingConfig.preprocessingAmplitude);
  if (!v6) {
    goto LABEL_16;
  }
  sub_2635370AC(v5, (uint64_t)"preprocessingAlphaThreshold", &self->_mattingConfig.preprocessingExponent);
  if (!v7) {
    goto LABEL_16;
  }
  sub_2635370AC(v5, (uint64_t)"preprocessingAmplitude", &self->_mattingConfig.preprocessingGamma);
  if (!v8) {
    goto LABEL_16;
  }
  sub_2635370AC(v5, (uint64_t)"preprocessingExponent", &self->_mattingConfig.preprocessingMinFactor);
  if (!v9) {
    goto LABEL_16;
  }
  sub_2635370AC(v5, (uint64_t)"preprocessingGamma", &self->_mattingConfig.preprocessingMaxFactor);
  if (v10
    && (sub_2635370AC(v5, (uint64_t)"preprocessingMinFactor", &self->_mattingConfig.radius), v11)
    && (sub_2635370AC(v5, (uint64_t)"preprocessingMaxFactor", &self->_mattingConfig.subsampling), v12)
    && (sub_2635370AC(v5, (uint64_t)"radius", &self->_mattingConfig.epsilon), v13)
    && (sub_2635370AC(v5, (uint64_t)"subsampling", &self->_mattingConfig.iterations), v14)
    && (sub_2635370AC(v5, (uint64_t)"epsilon", &self->_mattingConfig.rgbWeight), v15)
    && sub_263537014(v5, (uint64_t)"iterations", &self->_renderingMajorVersion)
    && (sub_2635370AC(v5, (uint64_t)"rgbWeight", &self->_renderingMajorVersion + 1), (v16 & 1) != 0))
  {
    BOOL v17 = 1;
  }
  else
  {
LABEL_16:
    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)readRenderingConfig:(id)a3
{
  id v4 = a3;
  long long v5 = v4;
  if (!v4) {
    goto LABEL_130;
  }
  sub_2635370AC(v4, (uint64_t)"preFilterBlurStrength", &self->_renderingConfig.maxBlur);
  if (!v6) {
    goto LABEL_130;
  }
  if (!sub_263537014(v5, (uint64_t)"preFilterRadius", &self->_renderingConfig.sharpRadius)) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"maxBlur", &self->_renderingConfig.softRadius);
  if (!v7) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"sharpRadius", &self->_renderingConfig.lumaNoiseModelCoeff);
  if (!v8) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"softRadius", &self->_renderingConfig.lumaNoiseAmplitude);
  if (!v9) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"lumaNoiseModelCoeff", &self->_renderingConfig.highlightBoostGain);
  if (!v10) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"highlightBoostGain", &self->_renderingConfig.maxNRings);
  if (!v11) {
    goto LABEL_130;
  }
  if (!sub_263537014(v5, (uint64_t)"minNRings", &self->_renderingConfig.nRings)) {
    goto LABEL_130;
  }
  if (!sub_263537014(v5, (uint64_t)"maxNRings", &self->_renderingConfig.basePixelWeight)) {
    goto LABEL_130;
  }
  if (!sub_263537014(v5, (uint64_t)"nRings", &self->_renderingConfig.antiAliasBlurStrength)) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"basePixelWeight", &self->_renderingConfig.antiAliasRadius);
  if (!v12) {
    goto LABEL_130;
  }
  if (!sub_263537014(v5, (uint64_t)"antiAliasRadius", &self->_renderingConfig.alphaEpsilon)) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"antiAliasBlurStrength", &self->_renderingConfig.relativeWeightThreshold);
  if (!v13) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"relativeWeightThreshold", &self->_renderingConfig.alphaGain);
  if (!v14) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"alphaEpsilon", &self->_renderingConfig.shapeObstructionCoeff);
  if (!v15) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"alphaGain", &self->_renderingConfig.ringAmplitude);
  if (!v16) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"shapeObstructionCoeff", &self->_renderingConfig.ringSharpness);
  if (!v17) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"ringAmplitude", &self->_renderingConfig.blendingQuarterResAlphaGain);
  if (!v18) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"ringSharpness", &self->_renderingConfig.blendingFullResAlphaGain);
  if (!v19) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"blendingQuarterResAlphaGain", &self->_renderingConfig.xhlrbIterations);
  if (!v20) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"blendingFullResAlphaGain", &self->_renderingConfig.xhlrbBlurRadiusT0);
  if (!v21) {
    goto LABEL_130;
  }
  if (!sub_263537014(v5, (uint64_t)"xhlrbIterations", &self->_xhlrbControlConfig.maxColourDiffusionIterations)) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"xhlrbBlurRadiusT0", &self->_xhlrbControlConfig.blurRadiusT0);
  if (!v22) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"xhlrbBlurRadiusT1", &self->_xhlrbControlConfig.blurRadiusT1);
  if (!v23) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"xhlrbMaxIntensityT0", &self->_xhlrbControlConfig.maxIntensityT0);
  if (!v24) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"xhlrbMaxIntensityT1", &self->_xhlrbControlConfig.maxIntensityT1);
  if (!v25) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"xhlrbMinIntensityT0", &self->_xhlrbControlConfig.minIntensityT0);
  if (!v26) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"xhlrbMinIntensityT1", &self->_xhlrbControlConfig.minIntensityT1);
  if (!v27) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"xhlrbExposureScoreT0", &self->_xhlrbControlConfig.exposureScoreT0);
  if (!v28) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"xhlrbExposureScoreT1", &self->_xhlrbControlConfig.exposureScoreT1);
  if (!v29) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"xhlrbClippedPixelsT0", &self->_xhlrbControlConfig.clippedPixelsT0);
  if (!v30) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"xhlrbClippedPixelsT1", &self->_xhlrbControlConfig.clippedPixelsT1);
  if (!v31) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"xhlrbRecoveryScoreT", &self->_xhlrbControlConfig.recoveryScoreT);
  if (!v32) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"xhlrbPreFilterGain", &self->_xhlrbControlConfig.maxPreFilterGain);
  if (!v33) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"xhlrbWeightGain", &self->_xhlrbControlConfig.maxWeightGain);
  if (!v34) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"xhlrbIntensityGain", &self->_xhlrbControlConfig.maxIntensityGain);
  if (!v35) {
    goto LABEL_130;
  }
  if (!sub_263537014(v5, (uint64_t)"xhlrbTileSize", &self->_renderingConfig.linearBoostGain))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  sub_2635370AC(v5, (uint64_t)"ohlbPreFilterGain", &self->_xhlrbControlConfig.maxObscenePreFilterGain);
  if (!v36) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"ohlbWeightGain", &self->_xhlrbControlConfig.maxObsceneWeightGain);
  if (!v37) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"ohlbIntensityGain", &self->_xhlrbControlConfig.maxObsceneIntensityGain);
  if (!v38) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"linearBoostGain", &self->_renderingConfig.fgMaxNRings);
  if ((v39 & 1) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  if (SLODWORD(self[1].super.isa) < 7)
  {
    *(void *)&self->_renderingConfig.fgNRings = 0;
    *(void *)&self->_renderingConfig.fgHitThreshold = 0x3F80000000000000;
    self->_renderingConfig.fgAlphaSmoothstepEnd = 1.0;
    self->_renderingConfig.bicubicDownsampleParamC = 0.0;
    *(_OWORD *)&self->_renderingConfig.fgBlurWeightSmoothstepStart = 0u;
LABEL_61:
    *(void *)&self->_hairnetConfig.hairnetMaskGmagThreshold = 0x3F40000000000000;
    goto LABEL_62;
  }
  if (!sub_263537014(v5, (uint64_t)"fgMinNRings", &self->_renderingConfig.fgNRings)) {
    goto LABEL_130;
  }
  if (!sub_263537014(v5, (uint64_t)"fgMaxNRings", &self->_renderingConfig.fgTraceStepScale)) {
    goto LABEL_130;
  }
  if (!sub_263537014(v5, (uint64_t)"fgNRings", &self->_renderingConfig.fgHitThreshold)) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"fgTraceStepScale", &self->_renderingConfig.fgAlphaSmoothstepStart);
  if (!v40) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"fgHitThreshold", &self->_renderingConfig.fgAlphaSmoothstepEnd);
  if (!v41) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"fgAlphaSmoothstepStart", &self->_renderingConfig.fgBlurWeightSmoothstepStart);
  if (!v42) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"fgAlphaSmoothstepEnd", &self->_renderingConfig.fgBlurWeightSmoothstepEnd);
  if (!v43) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"fgBlurWeightSmoothstepStart", &self->_renderingConfig.fgAARadius);
  if (!v44) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"fgBlurWeightSmoothstepEnd", &self->_renderingConfig.bicubicDownsampleParamB);
  if (!v45) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"fgAARadius", &self->_renderingConfig.bicubicDownsampleParamC);
  if ((v46 & 1) == 0) {
    goto LABEL_130;
  }
  if (SLODWORD(self[1].super.isa) < 8) {
    goto LABEL_61;
  }
  sub_2635370AC(v5, (uint64_t)"bicubicDownsampleParamB", &self->_hairnetConfig.hairnetMaskGmagThreshold);
  if (!v47
    || (sub_2635370AC(v5, (uint64_t)"bicubicDownsampleParamC", &self->_hairnetConfig.hairnetMaskBlurMapThreshold),
        (v48 & 1) == 0))
  {
LABEL_130:
    BOOL v108 = 0;
    goto LABEL_129;
  }
LABEL_62:
  float softRadius = self->_renderingConfig.softRadius;
  self->_xhlrbControlConfig.maxBGBlur = softRadius;
  *(_OWORD *)&self->_renderingConfig.xhlrbMaxIntensityT0 = *(_OWORD *)&self->_xhlrbControlConfig.blurRadiusT0;
  *(void *)&self->_renderingConfig.xhlrbPreFilterGain = *(void *)&self->_xhlrbControlConfig.minIntensityT0;
  self->_renderingConfig.xhlrbBlurRadiusT1 = 0.0;
  self->_renderingConfig.fgMinNRings = 0;
  *(void *)&self->_renderingConfig.ohlbWeightGain = 0;
  *(void *)&self->_renderingConfig.xhlrbTileSize = 0;
  *(void *)&self->_renderingConfig.xhlrbIntensityGain = 0;
  self->_simpleLensModelConfig.maxBGBlur = softRadius;
  self->_faceMaskConfig.float simulatedAperture = softRadius;
  self->_segmentationFusionConfig.subtractiveLowerAlpha = softRadius;
  float simulatedAperture = self->_simpleLensModelConfig.simulatedAperture;
  self->_faceMaskConfig.defaultSimulatedAperture = simulatedAperture;
  self->_segmentationFusionConfig.defaultSimulatedAperture = simulatedAperture;
  self->_renderingConfig.preFilterBlurStrength = simulatedAperture;
  *(float *)self->_anon_1ac = simulatedAperture;
  self->_segmentationFusionConfig.maxBlur = simulatedAperture;
  *(float *)&self->_renderingConfig.preFilterRadius = simulatedAperture;
  sub_2635370AC(v5, (uint64_t)"faces.maxBlurOnEyes", &self->_anon_1ac[136]);
  if (!v51) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"faces.maxBlurDistFromFocus", &self->_anon_1ac[140]);
  if (!v52) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"faces.eyeToEyebrowRatio", &self->_anon_1ac[144]);
  if (!v53) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"faces.linearBlurGrowthM", &self->_anon_1ac[148]);
  if (!v54) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"faces.linearBlurGrowthC", &self->_anon_1ac[152]);
  if (!v55) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"faces.distToBlurScaling", &self->_anon_1ac[156]);
  if (!v56) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"faces.capMultip", &self->_anon_1ac[160]);
  if (!v57) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"faces.gainMultip", &self->_anon_1ac[164]);
  if (!v58) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"faces.chinThetaLimit", &self->_anon_1ac[168]);
  if (!v59) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"faces.chinThetaMultip", &self->_anon_1ac[172]);
  if (!v60) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"faces.chinVectorSnapping", &self->_anon_1ac[176]);
  if (!v61) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"segfusion.subtractiveLowerAlpha", &self->_segmentationFusionConfig.subtractiveUpperAlpha);
  if (!v62) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"segfusion.subtractiveUpperAlpha", &self->_segmentationFusionConfig.subtractiveMaxBlur);
  if (!v63) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"segfusion.additiveLowerAlpha", &self->_segmentationFusionConfig.additiveUpperAlpha);
  if (!v64) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"segfusion.additiveUpperAlpha", &self->_segmentationFusionConfig.additiveMaxBlur);
  if (!v65
    || !sub_26353728C(v5, (uint64_t)"segfusion.additiveMaxBlur", &self->_dynamicParams.segmentationFusionAdditiveMaxBlur.brightLightExposureLevel)|| !sub_26353728C(v5, (uint64_t)"segfusion.subtractiveMaxBlur", &self->_dynamicParams.segmentationFusionSubtractiveMaxBlur.brightLightExposureLevel))
  {
    goto LABEL_130;
  }
  self->_segmentationFusionConfig.additiveLowerAlpha = self->_dynamicParams.segmentationFusionSubtractiveMaxBlur.brightLightNearValue;
  *(float *)&self->_noiseEstimationConfig = self->_dynamicParams.segmentationFusionAdditiveMaxBlur.brightLightNearValue;
  float antiAliasBlurStrength = self->_renderingConfig.antiAliasBlurStrength;
  float v67 = *(float *)&self->_renderingConfig.nRings;
  if (SLODWORD(v67) >= SLODWORD(antiAliasBlurStrength)) {
    float v67 = self->_renderingConfig.antiAliasBlurStrength;
  }
  *(float *)&self->_renderingConfig.nRings = v67;
  if (SLODWORD(self->_renderingConfig.basePixelWeight) > SLODWORD(antiAliasBlurStrength)) {
    float antiAliasBlurStrength = self->_renderingConfig.basePixelWeight;
  }
  self->_renderingConfig.basePixelWeight = antiAliasBlurStrength;
  sub_2635370AC(v5, (uint64_t)"blurmapRefinement.subjectDistance.minimumFocusDistance", &self->_blurmapRefinementConfig.subjectDistance.scalingFactor);
  if (!v68) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"blurmapRefinement.subjectDistance.maximumFocusDistance", &self->_blurmapRefinementConfig.subjectDistance.offset);
  if (!v69) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"blurmapRefinement.subjectDistance.scalingFactor", &self->_blurmapRefinementConfig.eyeProtectionParams.maxFaces);
  if (!v70) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"blurmapRefinement.subjectDistance.offset", &self->_blurmapRefinementConfig.eyeProtectionParams.faceWeightsSmoothStepMin);
  if (!v71) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"blurmapRefinement.protectBodyStrength", &self->_blurmapRefinementConfig.relativeApertureScalingStrength);
  if (!v72) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"blurmapRefinement.smoothstepMin", &self->_blurmapRefinementConfig.maxBlur);
  if (!v73) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"blurmapRefinement.smoothstepMax", &self->_blurmapRefinementConfig.distanceAdd);
  if (!v74) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"blurmapRefinement.maxBlur", &self->_blurmapRefinementConfig.subjectDistance.minimumFocusDistance);
  if (!v75) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"blurmapRefinement.distanceAdd", &self->_blurmapRefinementConfig.subjectDistance.maximumFocusDistance);
  if (!v76) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"blurmapRefinement.relativeApertureScalingStrength", &self->_blurmapRefinementConfig.smoothstepMax);
  if (!v77) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"blurmapRefinement.faceMaskAdditiveMaxBlur", &self->_blurmapRefinementConfig.focusWindowLeft);
  if (!v78) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"blurmapRefinement.faceMaskSubtractiveMaxBlur", &self->_blurmapRefinementConfig.focusWindowTop);
  if (!v79) {
    goto LABEL_130;
  }
  if (!sub_263537014(v5, (uint64_t)"blurmapRefinement.personDistance", &self->_blurmapRefinementConfig.personParams.maxBlur))goto LABEL_130; {
  sub_2635370AC(v5, (uint64_t)"blurmapRefinement.personThreshold", &self->_blurmapRefinementConfig.hairParams.fusion.subtractiveLowerAlpha);
  }
  if (!v80) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"blurmapRefinement.personMaxBlur", &self->_blurmapRefinementConfig.hairParams.fusion.subtractiveUpperAlpha);
  if (!v81) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"blurmapRefinement.hairSubtractiveLowerAlpha", &self->_blurmapRefinementConfig.hairParams.fusion.subtractiveMaxBlur);
  if (!v82) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"blurmapRefinement.hairSubtractiveUpperAlpha", &self->_blurmapRefinementConfig.hairParams.fusion.additiveLowerAlpha);
  if (!v83) {
    goto LABEL_130;
  }
  if (!sub_26353728C(v5, (uint64_t)"blurmapRefinement.hairSubtractiveMaxBlur", &self->_dynamicParams.hairSubtractiveMaxBlur.brightLightExposureLevel))goto LABEL_130; {
  sub_2635370AC(v5, (uint64_t)"blurmapRefinement.hairAdditiveLowerAlpha", &self->_blurmapRefinementConfig.hairParams.fusion.additiveMaxBlur);
  }
  if (!v84) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"blurmapRefinement.hairAdditiveUpperAlpha", &self->_blurmapRefinementConfig.hairParams.maxDistance);
  if (!v85) {
    goto LABEL_130;
  }
  if (!sub_26353728C(v5, (uint64_t)"blurmapRefinement.hairAdditiveMaxBlur", &self->_dynamicParams.hairAdditiveMaxBlur.brightLightExposureLevel))goto LABEL_130; {
  if (!sub_263537014(v5, (uint64_t)"blurmapRefinement.hairDistance", &self->_blurmapRefinementConfig.hairParams.maxBlur))
  }
    goto LABEL_130;
  sub_2635370AC(v5, (uint64_t)"blurmapRefinement.hairThreshold", &self->_blurmapRefinementConfig.protectBodyStrength);
  if (!v86) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"blurmapRefinement.hairMaxBlur", &self->_blurmapRefinementConfig.apertureScaling);
  if (!v87) {
    goto LABEL_130;
  }
  self->_blurmapRefinementConfig.hairParams.fusion.additiveUpperAlpha = self->_dynamicParams.hairSubtractiveMaxBlur.brightLightNearValue;
  self->_blurmapRefinementConfig.hairParams.thresholdValue = self->_dynamicParams.hairAdditiveMaxBlur.brightLightNearValue;
  if (!sub_263537014(v5, (uint64_t)"blurmapRefinement.eyeProtectionParams.maxFaces", &self->_blurmapRefinementConfig.eyeProtectionParams.faceWeightsSmoothStepMax))goto LABEL_130; {
  sub_2635370AC(v5, (uint64_t)"blurmapRefinement.eyeProtectionParams.faceWeightsSmoothStepMin", &self->_blurmapRefinementConfig.eyeProtectionParams.ovalDimsDistanceScale);
  }
  if (!v88) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"blurmapRefinement.eyeProtectionParams.faceWeightsSmoothStepMax", &self->_blurmapRefinementConfig.eyeProtectionParams.ovalDimsDistanceOffset);
  if (!v89) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"blurmapRefinement.eyeProtectionParams.ovalDimsDistanceScale", &self->_blurmapRefinementConfig.eyeProtectionParams.ovalDimsRadiusHorizontal);
  if (!v90) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"blurmapRefinement.eyeProtectionParams.ovalDimsDistanceOffset", &self->_blurmapRefinementConfig.eyeProtectionParams.ovalDimsRadiusVertical);
  if (!v91) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"blurmapRefinement.eyeProtectionParams.ovalDimsRadiusHorizontal", &self->_blurmapRefinementConfig.eyeProtectionParams.ovalFallOffSmoothStepMin);
  if (!v92) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"blurmapRefinement.eyeProtectionParams.ovalDimsRadiusVertical", &self->_blurmapRefinementConfig.eyeProtectionParams.ovalFallOffSmoothStepMax);
  if (!v93) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"blurmapRefinement.eyeProtectionParams.ovalFallOffSmoothStepMin", &self->_blurmapRefinementConfig.eyeProtectionParams.personMaskSmoothStepMin);
  if (!v94) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"blurmapRefinement.eyeProtectionParams.ovalFallOffSmoothStepMax", &self->_blurmapRefinementConfig.eyeProtectionParams.personMaskSmoothStepMax);
  if (!v95) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"blurmapRefinement.eyeProtectionParams.personMaskSmoothStepMin", &self->_blurmapRefinementConfig.eyeProtectionParams.preventStrength);
  if (!v96) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"blurmapRefinement.eyeProtectionParams.personMaskSmoothStepMax", &self->_blurmapRefinementConfig.eyeProtectionParams.subtractiveMaxBlur);
  if (!v97) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"blurmapRefinement.eyeProtectionParams.preventStrength", &self->_blurmapRefinementConfig.eyeProtectionParams.subtractiveApertureScaling);
  if (!v98) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"blurmapRefinement.eyeProtectionParams.subtractiveMaxBlur", &self->_blurmapRefinementConfig.eyeProtectionParams.maxMaskSmoothstepMin);
  if (!v99) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"blurmapRefinement.eyeProtectionParams.subtractiveApertureScaling", &self->_blurmapRefinementConfig.eyeProtectionParams.maxMaskSmoothstepMax);
  if (!v100) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"blurmapRefinement.eyeProtectionParams.maxMaskSmoothstepMin", &self->_blurmapRefinementConfig.faceMask_additiveMaxBlur);
  if (!v101) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"blurmapRefinement.eyeProtectionParams.maxMaskSmoothstepMax", &self->_blurmapRefinementConfig.faceMask_subtractiveMaxBlur);
  if (!v102) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"crispHair.trustedRegionAlphaThreshold", &self->_crispHairConfig.trustedRegionAlphaThreshold);
  if (!v103) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"crispHair.trustedRegionErode", &self->_crispHairConfig.trustedRegionErode);
  if (!v104) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"crispHair.expandingRadius", &self->_crispHairConfig.expandingRadius);
  if (!v105) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"crispHair.compositeAlphaThresholdLow", &self->_crispHairConfig.compositeAlphaThresholdLow);
  if (!v106) {
    goto LABEL_130;
  }
  sub_2635370AC(v5, (uint64_t)"crispHair.compositeAlphaThresholdHigh", &self->_crispHairConfig.compositeAlphaThresholdHigh);
  if ((v107 & 1) == 0) {
    goto LABEL_130;
  }
  BOOL v108 = 1;
LABEL_129:

  return v108;
}

- (BOOL)readHairNetConfig:(id)a3
{
  id v4 = a3;
  long long v5 = v4;
  if (!v4) {
    goto LABEL_19;
  }
  p_hairnetMaskAlphaBlurSigma = &self->_hairnetConfig.hairnetMaskAlphaBlurSigma;
  if (SLODWORD(self[1].super.isa) < 8)
  {
    *(_OWORD *)&self->_hairnetConfig.hairnetMaskBlurMapSharpThreshold = 0u;
    *(_OWORD *)&self->_hairnetConfig.hairnetChromaWeight = 0u;
    *(_OWORD *)p_hairnetMaskAlphaBlurSigma = 0u;
    *(_OWORD *)&self->_hairnetConfig.hairnetMaskHairThreshold = 0u;
LABEL_21:
    BOOL v23 = 1;
    goto LABEL_22;
  }
  sub_2635370AC(v4, (uint64_t)"hairnetMaskGmagThreshold", p_hairnetMaskAlphaBlurSigma);
  if (v7)
  {
    sub_2635370AC(v5, (uint64_t)"hairnetMaskBlurMapThreshold", &self->_hairnetConfig.hairnetMaskAlphaThresholdLow);
    if (v8)
    {
      sub_2635370AC(v5, (uint64_t)"hairnetMaskAlphaBlurSigma", &self->_hairnetConfig.hairnetMaskAlphaThresholdHigh);
      if (v9)
      {
        sub_2635370AC(v5, (uint64_t)"hairnetMaskAlphaThresholdLow", &self->_hairnetConfig.hairnetMaskHairBlurSigma);
        if (v10)
        {
          sub_2635370AC(v5, (uint64_t)"hairnetMaskAlphaThresholdHigh", &self->_hairnetConfig.hairnetMaskHairThreshold);
          if (v11)
          {
            sub_2635370AC(v5, (uint64_t)"hairnetMaskHairBlurSigma", &self->_hairnetConfig.hairnetMaskGlassesBlurSigma);
            if (v12)
            {
              sub_2635370AC(v5, (uint64_t)"hairnetMaskHairThreshold", &self->_hairnetConfig.hairnetMaskGlassesThreshold);
              if (v13)
              {
                sub_2635370AC(v5, (uint64_t)"hairnetMaskGlassesBlurSigma", &self->_hairnetConfig.hairnetMaskBlurMapBlurSigma);
                if (v14)
                {
                  sub_2635370AC(v5, (uint64_t)"hairnetMaskGlassesThreshold", &self->_hairnetConfig.hairnetMaskBlurMapSharpThreshold);
                  if (v15)
                  {
                    sub_2635370AC(v5, (uint64_t)"hairnetMaskBlurMapBlurSigma", &self->_hairnetConfig.hairnetMaskBeardOvalWidthFactor);
                    if (v16)
                    {
                      sub_2635370AC(v5, (uint64_t)"hairnetMaskBlurMapSharpThreshold", &self->_hairnetConfig.hairnetMaskBeardOvalEccentricity);
                      if (v17)
                      {
                        sub_2635370AC(v5, (uint64_t)"hairnetMaskBeardOvalWidthFactor", &self->_hairnetConfig.hairnetMaskFinalDilation);
                        if (v18)
                        {
                          sub_2635370AC(v5, (uint64_t)"hairnetMaskBeardOvalEccentricity", &self->_hairnetConfig.hairnetChromaWeight);
                          if (v19)
                          {
                            sub_2635370AC(v5, (uint64_t)"hairnetMaskFinalDilation", &self->_hairnetConfig.hairnetChromaBlurSigma);
                            if (v20)
                            {
                              sub_2635370AC(v5, (uint64_t)"hairnetChromaWeight", &self->_mattingConfig.zeroShiftPercentile);
                              if (v21)
                              {
                                sub_2635370AC(v5, (uint64_t)"hairnetChromaBlurSigma", &self->_mattingConfig.preprocessingAlphaThreshold);
                                if (v22) {
                                  goto LABEL_21;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_19:
  BOOL v23 = 0;
LABEL_22:

  return v23;
}

- (FigSDOFRenderingTuningParametersSet)initWithTuningDictionary:(id)a3 suffix:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = objc_msgSend_init(self, v8, v9, v10);
  if (!v13)
  {
    int v81 = 0;
    int v83 = 0;
    int v84 = 0;
    int v51 = 0;
    int v57 = 0;
    int v32 = 0;
    int v38 = 0;
    int v14 = 0;
    BOOL v23 = 0;
    goto LABEL_25;
  }
  if (v7)
  {
    objc_msgSend_stringByAppendingString_(@"_", v11, (uint64_t)v7, v12);
    int v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v14 = &stru_270E99658;
  }
  int v15 = NSNumber;
  int v16 = objc_msgSend_objectForKeyedSubscript_(v6, v11, @"Version", v12);
  objc_msgSend_intValue(v16, v17, v18, v19);
  uint64_t CFPreferenceNumberWithDefault = FigGetCFPreferenceNumberWithDefault();
  BOOL v23 = objc_msgSend_numberWithInt_(v15, v21, CFPreferenceNumberWithDefault, v22);

  if (!v23)
  {
    int v81 = 0;
    int v83 = 0;
    int v84 = 0;
    int v51 = 0;
    int v57 = 0;
    int v32 = 0;
LABEL_30:
    int v38 = 0;
    goto LABEL_25;
  }
  *(_DWORD *)(v13 + 1200) = objc_msgSend_intValue(v23, v24, v25, v26);
  int v29 = objc_msgSend_stringByAppendingString_(@"DisparityRefinement", v27, (uint64_t)v14, v28);
  int v32 = objc_msgSend_objectForKeyedSubscript_(v6, v30, (uint64_t)v29, v31);

  if (!v32)
  {
    int v81 = 0;
    int v83 = 0;
    int v84 = 0;
    int v51 = 0;
    int v57 = 0;
    goto LABEL_30;
  }
  int v35 = objc_msgSend_stringWithFormat_(NSString, v33, @"SLMv%@%@", v34, v23, v14);
  int v38 = objc_msgSend_objectForKeyedSubscript_(v6, v36, (uint64_t)v35, v37);

  int v84 = v32;
  if (!v38)
  {
    int v81 = 0;
    int v83 = 0;
    int v51 = 0;
    int v57 = 0;
    int v32 = 0;
    goto LABEL_25;
  }
  int v41 = objc_msgSend_stringByAppendingString_(@"NoiseEstimation", v39, (uint64_t)v14, v40);
  uint64_t v44 = objc_msgSend_objectForKeyedSubscript_(v6, v42, (uint64_t)v41, v43);
  int v45 = *(void **)(v13 + 648);
  *(void *)(v13 + 648) = v44;

  int v83 = v38;
  if (!*(void *)(v13 + 648))
  {
    int v81 = 0;
    int v51 = 0;
LABEL_34:
    int v57 = 0;
    goto LABEL_35;
  }
  char v48 = objc_msgSend_stringWithFormat_(NSString, v46, @"BlurMapSmoothingV%@%@", v47, v23, v14);
  int v51 = objc_msgSend_objectForKeyedSubscript_(v6, v49, (uint64_t)v48, v50);

  if (!v51)
  {
    int v81 = 0;
    goto LABEL_34;
  }
  int v54 = objc_msgSend_stringWithFormat_(NSString, v52, @"RenderingV%@%@", v53, v23, v14);
  int v57 = objc_msgSend_objectForKeyedSubscript_(v6, v55, (uint64_t)v54, v56);

  if (!v57
    || !objc_msgSend_readDisparityRefinementConfig_((void *)v13, v58, (uint64_t)v32, v59)
    || !objc_msgSend_readSLMConfig_((void *)v13, v60, (uint64_t)v38, v61)
    || !objc_msgSend_readBlurMapSmoothingConfig_((void *)v13, v62, (uint64_t)v51, v63)
    || !objc_msgSend_readRenderingConfig_((void *)v13, v64, (uint64_t)v57, v65))
  {
    int v81 = 0;
LABEL_35:
    int v32 = 0;
    int v38 = 0;
    goto LABEL_25;
  }
  int v68 = objc_msgSend_stringWithFormat_(NSString, v66, @"HairNetV%@%@", v67, v23, v14);
  int v38 = objc_msgSend_objectForKeyedSubscript_(v6, v69, (uint64_t)v68, v70);

  if (v38) {
    objc_msgSend_readHairNetConfig_((void *)v13, v71, (uint64_t)v38, v72);
  }
  if (*(_DWORD *)(v13 + 248) != 0xFFFF || *(int *)(v13 + 1200) < 6)
  {
    int v32 = 0;
LABEL_24:
    int v81 = (FigSDOFRenderingTuningParametersSet *)(id)v13;
    goto LABEL_25;
  }
  int v73 = objc_msgSend_stringWithFormat_(NSString, v71, @"MattingV%@%@", v72, v23, v14);
  int v32 = objc_msgSend_objectForKeyedSubscript_(v6, v74, (uint64_t)v73, v75);

  if (v32
    || (objc_msgSend_stringWithFormat_(NSString, v76, @"MattingV%@", v77, v23),
        int v78 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_objectForKeyedSubscript_(v6, v79, (uint64_t)v78, v80),
        int v32 = objc_claimAutoreleasedReturnValue(),
        v78,
        v32))
  {
    if (objc_msgSend_readMattingConfig_((void *)v13, v76, (uint64_t)v32, v77)) {
      goto LABEL_24;
    }
  }
  int v81 = 0;
LABEL_25:

  return v81;
}

- (dynamic_tuning_parameters)dynamicParams
{
  long long v3 = *(_OWORD *)&self->hairSubtractiveMaxBlur.lowLightNearValue;
  *(_OWORD *)&retstr->hairSubtractiveMaxBlur.brightLightExposureLevel = *(_OWORD *)&self->hairSubtractiveMaxBlur.nearSubjectDistanceRatio;
  *(_OWORD *)&retstr->hairSubtractiveMaxBlur.brightLightNearValue = v3;
  long long v4 = *(_OWORD *)&self->hairAdditiveMaxBlur.lowLightNearValue;
  *(_OWORD *)&retstr->hairAdditiveMaxBlur.brightLightExposureLevel = *(_OWORD *)&self->hairAdditiveMaxBlur.nearSubjectDistanceRatio;
  *(_OWORD *)&retstr->hairAdditiveMaxBlur.brightLightNearValue = v4;
  long long v5 = *(_OWORD *)&self->segmentationFusionSubtractiveMaxBlur.lowLightNearValue;
  *(_OWORD *)&retstr->segmentationFusionSubtractiveMaxBlur.brightLightExposureLevel = *(_OWORD *)&self->segmentationFusionSubtractiveMaxBlur.nearSubjectDistanceRatio;
  *(_OWORD *)&retstr->segmentationFusionSubtractiveMaxBlur.brightLightNearValue = v5;
  long long v6 = *(_OWORD *)&self->segmentationFusionAdditiveMaxBlur.lowLightNearValue;
  *(_OWORD *)&retstr->segmentationFusionAdditiveMaxBlur.brightLightExposureLevel = *(_OWORD *)&self->segmentationFusionAdditiveMaxBlur.nearSubjectDistanceRatio;
  *(_OWORD *)&retstr->segmentationFusionAdditiveMaxBlur.brightLightNearValue = v6;
  long long v7 = *(_OWORD *)&self->disparityScalingFactor.lowLightNearValue;
  *(_OWORD *)&retstr->disparityScalingFactor.brightLightExposureLevel = *(_OWORD *)&self->disparityScalingFactor.nearSubjectDistanceRatio;
  *(_OWORD *)&retstr->disparityScalingFactor.brightLightNearValue = v7;
  return self;
}

- (xhlrb_control_logic_params)xhlrbControlConfig
{
  long long v3 = *(_OWORD *)&self[2].maxColourDiffusionIterations;
  long long v4 = *(_OWORD *)&self[2].blurRadiusT0;
  *(_OWORD *)&retstr->maxWeightGain = *(_OWORD *)&self[2].maxObscenePreFilterGain;
  *(_OWORD *)&retstr->maxObsceneIntensityGain = v4;
  *(_OWORD *)&retstr->maxIntensityT0 = *(_OWORD *)&self[2].minIntensityT0;
  *(_OWORD *)&retstr->mode = *(_OWORD *)&self[2].exposureScoreT1;
  *(_OWORD *)&retstr->clippedPixelsT1 = v3;
  return self;
}

- (disparity_refinement_params)disparityRefinementConfig
{
  long long v3 = *(_OWORD *)&self[3].aaLumaSigma;
  long long v4 = *(_OWORD *)&self[3].fgBlurScale;
  long long v5 = *(_OWORD *)&self[3].outerSamplingRadius;
  *(_OWORD *)&retstr->segmentationSigma = *(_OWORD *)&self[3].segmentationSigma;
  *(_OWORD *)&retstr->aaLumaSigma = v3;
  retstr->fgBgDilationSize = self[3].fgBgDilationSize;
  *(_OWORD *)&retstr->fgBlurScale = v4;
  *(_OWORD *)&retstr->radius = *(_OWORD *)&self[3].radius;
  *(_OWORD *)&retstr->outerSamplingRadius = v5;
  return self;
}

- (int)disparityRefinementVersion
{
  return self->_disparityRefinementVersion;
}

- (crisp_hair_params)crispHairConfig
{
  *retstr = *(crisp_hair_params *)((char *)self + 336);
  return self;
}

- (hairnet_params)hairnetConfig
{
  long long v3 = *(_OWORD *)&self[17].hairnetMaskAlphaThresholdHigh;
  *(_OWORD *)&retstr->hairnetMaskGmagThreshold = *(_OWORD *)&self[17].hairnetMaskGmagThreshold;
  *(_OWORD *)&retstr->hairnetMaskAlphaThresholdHigh = v3;
  long long v4 = *(_OWORD *)&self[17].hairnetMaskBeardOvalEccentricity;
  *(_OWORD *)&retstr->hairnetMaskGlassesThreshold = *(_OWORD *)&self[17].hairnetMaskGlassesThreshold;
  *(_OWORD *)&retstr->hairnetMaskBeardOvalEccentricity = v4;
  return self;
}

- (simple_lens_model_params)simpleLensModelConfig
{
  long long v3 = *(_OWORD *)&self[6].frameNormalizedFocalLength;
  *(_OWORD *)&retstr->left = *(_OWORD *)&self[6].simulatedFocalLength;
  *(_OWORD *)&retstr->zeroShiftPercentile = v3;
  *(_OWORD *)&retstr->maximumSimulatedAperture = *(_OWORD *)&self[6].disparityScalingFactor;
  *(void *)&retstr->shiftDeadZone = *(void *)&self[7].height;
  return self;
}

- (face_mask_params)faceMaskConfig
{
  long long v3 = *(_OWORD *)&self->_anon_1ac[136];
  v2[8] = *(_OWORD *)&self->_anon_1ac[120];
  v2[9] = v3;
  long long v4 = *(_OWORD *)&self->_anon_1ac[168];
  v2[10] = *(_OWORD *)&self->_anon_1ac[152];
  v2[11] = v4;
  long long v5 = *(_OWORD *)&self->_anon_1ac[72];
  v2[4] = *(_OWORD *)&self->_anon_1ac[56];
  v2[5] = v5;
  long long v6 = *(_OWORD *)&self->_anon_1ac[104];
  v2[6] = *(_OWORD *)&self->_anon_1ac[88];
  v2[7] = v6;
  long long v7 = *(_OWORD *)&self->_anon_1ac[8];
  _OWORD *v2 = *(_OWORD *)&self->_faceMaskConfig.simulatedAperture;
  v2[1] = v7;
  long long v8 = *(_OWORD *)&self->_anon_1ac[24];
  long long v9 = *(_OWORD *)&self->_anon_1ac[40];
  v2[2] = v8;
  v2[3] = v9;
  result.float simulatedAperture = *(float *)&v9;
  result.maxBlur = *(float *)&v8;
  return result;
}

- (segmentation_fusion_params)segmentationFusionConfig
{
  long long v3 = *(_OWORD *)&self[17].subtractiveLowerAlpha;
  *(_OWORD *)&retstr->float simulatedAperture = *(_OWORD *)&self[16].additiveMaxBlur;
  *(_OWORD *)&retstr->subtractiveUpperAlpha = v3;
  retstr->additiveMaxBlur = self[17].additiveUpperAlpha;
  return self;
}

- (id)noiseEstimationConfig
{
  return *(id *)&self->_blurmapSmoothingConfig.nIterations;
}

- (blurmap_smoothing_params)blurmapSmoothingConfig
{
  *retstr = *(blurmap_smoothing_params *)((char *)self + 656);
  return self;
}

- (blurmap_refinement_params)blurmapRefinementConfig
{
  *(_OWORD *)&retstr->focusWindowLeft = *(_OWORD *)&self[4].hairParams.fusion.additiveLowerAlpha;
  long long v3 = *(_OWORD *)&self[4].hairParams.fusion.subtractiveLowerAlpha;
  *(_OWORD *)&retstr->eyeProtectionParams.preventStrength = *(_OWORD *)&self[4].personParams.fusion.additiveMaxBlur;
  *(_OWORD *)&retstr->eyeProtectionParams.maxMaskSmoothstepMax = v3;
  long long v4 = *(_OWORD *)&self[3].eyeProtectionParams.maxMaskSmoothstepMax;
  *(_OWORD *)&retstr->distanceAdd = *(_OWORD *)&self[3].eyeProtectionParams.preventStrength;
  *(_OWORD *)&retstr->subjectDistance.offset = v4;
  long long v5 = *(_OWORD *)&self[4].personParams.fusion.subtractiveUpperAlpha;
  *(_OWORD *)&retstr->eyeProtectionParams.ovalDimsDistanceScale = *(_OWORD *)&self[3].focusWindowTop;
  *(_OWORD *)&retstr->eyeProtectionParams.ovalFallOffSmoothStepMin = v5;
  long long v6 = *(_OWORD *)&self[3].subjectDistance.offset;
  *(_OWORD *)&retstr->personParams.maxBlur = *(_OWORD *)&self[3].distanceAdd;
  *(_OWORD *)&retstr->hairParams.fusion.additiveLowerAlpha = v6;
  long long v7 = *(_OWORD *)&self[3].eyeProtectionParams.ovalFallOffSmoothStepMin;
  *(_OWORD *)&retstr->hairParams.thresholdValue = *(_OWORD *)&self[3].eyeProtectionParams.ovalDimsDistanceScale;
  *(_OWORD *)&retstr->relativeApertureScalingStrength = v7;
  long long v8 = *(_OWORD *)&self[3].relativeApertureScalingStrength;
  *(_OWORD *)&retstr->personParams.fusion.subtractiveLowerAlpha = *(_OWORD *)&self[3].hairParams.thresholdValue;
  *(_OWORD *)&retstr->personParams.fusion.additiveUpperAlpha = v8;
  return self;
}

- (rendering_config_params)renderingConfig
{
  long long v3 = *(_OWORD *)&self[5].maxBlur;
  *(_OWORD *)&retstr->fgMinNRings = *(_OWORD *)&self[5].simulatedAperture;
  *(_OWORD *)&retstr->fgHitThreshold = v3;
  *(_OWORD *)&retstr->fgBlurWeightSmoothstepEnd = *(_OWORD *)&self[5].lumaNoiseAmplitude;
  long long v4 = *(_OWORD *)&self[4].fgMinNRings;
  *(_OWORD *)&retstr->xhlrbIterations = *(_OWORD *)&self[4].ohlbIntensityGain;
  *(_OWORD *)&retstr->xhlrbMaxIntensityT1 = v4;
  long long v5 = *(_OWORD *)&self[4].fgBlurWeightSmoothstepEnd;
  *(_OWORD *)&retstr->xhlrbWeightGain = *(_OWORD *)&self[4].fgHitThreshold;
  *(_OWORD *)&retstr->ohlbIntensityGain = v5;
  long long v6 = *(_OWORD *)&self[4].xhlrbIterations;
  *(_OWORD *)&retstr->lumaNoiseAmplitude = *(_OWORD *)&self[4].ringAmplitude;
  *(_OWORD *)&retstr->nRings = v6;
  long long v7 = *(_OWORD *)&self[4].xhlrbWeightGain;
  *(_OWORD *)&retstr->relativeWeightThreshold = *(_OWORD *)&self[4].xhlrbMaxIntensityT1;
  *(_OWORD *)&retstr->ringAmplitude = v7;
  long long v8 = *(_OWORD *)&self[4].relativeWeightThreshold;
  *(_OWORD *)&retstr->float simulatedAperture = *(_OWORD *)&self[4].nRings;
  *(_OWORD *)&retstr->maxBlur = v8;
  return self;
}

- ($56A7D0D9115FBA927525223D43EC1313)mattingConfig
{
  long long v3 = *(_OWORD *)&self[24].var4;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[24].var0;
  *(_OWORD *)&retstr->var4 = v3;
  *(_OWORD *)&retstr->var8 = *(_OWORD *)&self[24].var8;
  return self;
}

- (int)renderingMajorVersion
{
  return (int)self[1].super.isa;
}

- (void).cxx_destruct
{
}

@end