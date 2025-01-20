@interface DenoiseRemixShaders
- (DenoiseRemixShaders)initWithMetal:(id)a3 vertFunc:(id)a4 pixelFormatLuma:(unint64_t)a5 pixelFormatChroma:(unint64_t)a6 options:(const DenoiseRemixStageOptions *)a7;
@end

@implementation DenoiseRemixShaders

- (DenoiseRemixShaders)initWithMetal:(id)a3 vertFunc:(id)a4 pixelFormatLuma:(unint64_t)a5 pixelFormatChroma:(unint64_t)a6 options:(const DenoiseRemixStageOptions *)a7
{
  id v12 = a3;
  id v13 = a4;
  v49.receiver = self;
  v49.super_class = (Class)DenoiseRemixShaders;
  v14 = [(DenoiseRemixShaders *)&v49 init];
  if (!v14)
  {
    FigDebugAssert3();
    v17 = 0;
    goto LABEL_13;
  }
  v15 = objc_opt_new();
  v17 = v15;
  if (!v15) {
    goto LABEL_12;
  }
  objc_msgSend_setConstantValue_type_atIndex_(v15, v16, (uint64_t)a7, 29, 1);
  objc_msgSend_setConstantValue_type_atIndex_(v17, v18, (uint64_t)&a7->enableNoiseMap, 53, 2);
  objc_msgSend_setConstantValue_type_atIndex_(v17, v19, (uint64_t)&a7->enableBilateralRegression, 53, 3);
  objc_msgSend_setConstantValue_type_atIndex_(v17, v20, (uint64_t)&a7->enableLoGOffset, 53, 4);
  objc_msgSend_setConstantValue_type_atIndex_(v17, v21, (uint64_t)&a7->enableGdFlatness, 53, 5);
  v22 = [DenoiseRemixFragmentShader alloc];
  uint64_t v24 = objc_msgSend_initWithMetal_vertFunc_fragName_constantValues_pixelFormat_pixelFormat2_(v22, v23, (uint64_t)v12, (uint64_t)v13, @"DenoiseChroma_frag", v17, a6, 0);
  denoiseChroma = v14->_denoiseChroma;
  v14->_denoiseChroma = (DenoiseRemixFragmentShader *)v24;

  if (!v14->_denoiseChroma) {
    goto LABEL_12;
  }
  v26 = [DenoiseRemixFragmentShader alloc];
  uint64_t v28 = objc_msgSend_initWithMetal_vertFunc_fragName_constantValues_pixelFormat_pixelFormat2_(v26, v27, (uint64_t)v12, (uint64_t)v13, @"DenoiseLumaDenoiseRemixChroma_frag", v17, a5, a6);
  denoiseLumaDenoiseRemixChroma = v14->_denoiseLumaDenoiseRemixChroma;
  v14->_denoiseLumaDenoiseRemixChroma = (DenoiseRemixFragmentShader *)v28;

  if (!v14->_denoiseLumaDenoiseRemixChroma) {
    goto LABEL_12;
  }
  v30 = [DenoiseRemixFragmentShader alloc];
  uint64_t v32 = objc_msgSend_initWithMetal_vertFunc_fragName_constantValues_pixelFormat_pixelFormat2_(v30, v31, (uint64_t)v12, (uint64_t)v13, @"DenoiseRemixLumaChroma_frag", v17, a5, a6);
  denoiseRemixLumaChroma = v14->_denoiseRemixLumaChroma;
  v14->_denoiseRemixLumaChroma = (DenoiseRemixFragmentShader *)v32;

  if (!v14->_denoiseRemixLumaChroma) {
    goto LABEL_12;
  }
  v34 = [DenoiseRemixFragmentShader alloc];
  uint64_t v36 = objc_msgSend_initWithMetal_vertFunc_fragName_constantValues_pixelFormat_pixelFormat2_(v34, v35, (uint64_t)v12, (uint64_t)v13, @"RemixLuma_frag", v17, a5, 0);
  remixLuma = v14->_remixLuma;
  v14->_remixLuma = (DenoiseRemixFragmentShader *)v36;

  if (!v14->_remixLuma) {
    goto LABEL_12;
  }
  v38 = [DenoiseRemixFragmentShader alloc];
  uint64_t v40 = objc_msgSend_initWithMetal_vertFunc_fragName_constantValues_pixelFormat_pixelFormat2_(v38, v39, (uint64_t)v12, (uint64_t)v13, @"DenoiseRemixLuma_frag", v17, a5, 0);
  denoiseRemixLuma = v14->_denoiseRemixLuma;
  v14->_denoiseRemixLuma = (DenoiseRemixFragmentShader *)v40;

  if (!v14->_denoiseRemixLuma
    || (objc_msgSend_computePipelineStateFor_constants_(v12, v42, @"VarianceSharpening_kernel_5x5", (uint64_t)v17), uint64_t v43 = objc_claimAutoreleasedReturnValue(), varianceSharpening = v14->_varianceSharpening, v14->_varianceSharpening = (MTLComputePipelineState *)v43, varianceSharpening, !v14->_varianceSharpening))
  {
LABEL_12:
    FigDebugAssert3();
LABEL_13:
    int v48 = FigSignalErrorAt();
    v45 = 0;
    if (v48) {
      goto LABEL_10;
    }
  }
  v45 = v14;
LABEL_10:
  v46 = v45;

  return v46;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_varianceSharpening, 0);
  objc_storeStrong((id *)&self->_denoiseRemixLuma, 0);
  objc_storeStrong((id *)&self->_remixLuma, 0);
  objc_storeStrong((id *)&self->_denoiseRemixLumaChroma, 0);
  objc_storeStrong((id *)&self->_denoiseLumaDenoiseRemixChroma, 0);

  objc_storeStrong((id *)&self->_denoiseChroma, 0);
}

@end