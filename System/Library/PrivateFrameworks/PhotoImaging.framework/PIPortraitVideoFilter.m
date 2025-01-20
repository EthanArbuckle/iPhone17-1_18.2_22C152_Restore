@interface PIPortraitVideoFilter
- (BOOL)inputIsHDR;
- (CIImage)inputDisparityImage;
- (CIImage)inputImage;
- (NSNumber)inputAperture;
- (NSNumber)inputFocusedDisparity;
- (NSNumber)inputRenderDebugMode;
- (NSNumber)inputRenderQuality;
- (NUCVPixelBuffer)inputColorPixelBuffer;
- (NUCVPixelBuffer)inputDisparityPixelBuffer;
- (PIPortraitVideoMetadataSample)inputTimedRenderingMetadata;
- (PTGlobalRenderingMetadata)inputGlobalRenderingMetadata;
- (id)outputImage;
- (void)setInputAperture:(id)a3;
- (void)setInputColorPixelBuffer:(id)a3;
- (void)setInputDisparityImage:(id)a3;
- (void)setInputDisparityPixelBuffer:(id)a3;
- (void)setInputFocusedDisparity:(id)a3;
- (void)setInputGlobalRenderingMetadata:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputIsHDR:(BOOL)a3;
- (void)setInputRenderDebugMode:(id)a3;
- (void)setInputRenderQuality:(id)a3;
- (void)setInputTimedRenderingMetadata:(id)a3;
@end

@implementation PIPortraitVideoFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputFocusedDisparity, 0);
  objc_storeStrong((id *)&self->_inputAperture, 0);
  objc_storeStrong((id *)&self->_inputTimedRenderingMetadata, 0);
  objc_storeStrong((id *)&self->_inputGlobalRenderingMetadata, 0);
  objc_storeStrong((id *)&self->_inputRenderDebugMode, 0);
  objc_storeStrong((id *)&self->_inputRenderQuality, 0);
  objc_storeStrong((id *)&self->_inputDisparityPixelBuffer, 0);
  objc_storeStrong((id *)&self->_inputColorPixelBuffer, 0);
  objc_storeStrong((id *)&self->_inputDisparityImage, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

- (void)setInputFocusedDisparity:(id)a3
{
}

- (NSNumber)inputFocusedDisparity
{
  return self->_inputFocusedDisparity;
}

- (void)setInputAperture:(id)a3
{
}

- (NSNumber)inputAperture
{
  return self->_inputAperture;
}

- (void)setInputTimedRenderingMetadata:(id)a3
{
}

- (PIPortraitVideoMetadataSample)inputTimedRenderingMetadata
{
  return self->_inputTimedRenderingMetadata;
}

- (void)setInputGlobalRenderingMetadata:(id)a3
{
}

- (PTGlobalRenderingMetadata)inputGlobalRenderingMetadata
{
  return self->_inputGlobalRenderingMetadata;
}

- (void)setInputIsHDR:(BOOL)a3
{
  self->_inputIsHDR = a3;
}

- (BOOL)inputIsHDR
{
  return self->_inputIsHDR;
}

- (void)setInputRenderDebugMode:(id)a3
{
}

- (NSNumber)inputRenderDebugMode
{
  return self->_inputRenderDebugMode;
}

- (void)setInputRenderQuality:(id)a3
{
}

- (NSNumber)inputRenderQuality
{
  return self->_inputRenderQuality;
}

- (void)setInputDisparityPixelBuffer:(id)a3
{
}

- (NUCVPixelBuffer)inputDisparityPixelBuffer
{
  return self->_inputDisparityPixelBuffer;
}

- (void)setInputColorPixelBuffer:(id)a3
{
}

- (NUCVPixelBuffer)inputColorPixelBuffer
{
  return self->_inputColorPixelBuffer;
}

- (void)setInputDisparityImage:(id)a3
{
}

- (CIImage)inputDisparityImage
{
  return self->_inputDisparityImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (id)outputImage
{
  v58[3] = *MEMORY[0x1E4F143B8];
  v3 = [(PIPortraitVideoFilter *)self inputGlobalRenderingMetadata];
  int v4 = [v3 renderingVersion];

  if (v4 == 1)
  {
    uint64_t v5 = objc_opt_class();
LABEL_6:
    v48 = (void *)v5;
    v8 = 0;
    goto LABEL_10;
  }
  v6 = +[PIGlobalSettings globalSettings];
  int v7 = [v6 cinematicAllowRGB10Packed];

  uint64_t v5 = objc_opt_class();
  if (!v7) {
    goto LABEL_6;
  }
  if ([(PIPortraitVideoFilter *)self inputIsHDR]) {
    [MEMORY[0x1E4F7A400] itur2100HLGColorSpace];
  }
  else {
  v8 = [MEMORY[0x1E4F7A400] rec709ColorSpace];
  }
  v48 = objc_opt_class();
  if (outputImage_once != -1) {
    dispatch_once(&outputImage_once, &__block_literal_global_101);
  }
LABEL_10:
  v9 = [(PIPortraitVideoFilter *)self inputImage];
  [MEMORY[0x1E4F7A4A0] HLGOpticalScale];
  double v11 = v10;
  v49 = v8;
  if (v8)
  {
    if ([v8 isHDR] && v11 > 1.0)
    {
      v57[0] = @"inputRVector";
      v12 = [MEMORY[0x1E4F1E080] vectorWithX:4.92610837 / v11 Y:0.0 Z:0.0 W:0.0];
      v58[0] = v12;
      v57[1] = @"inputGVector";
      v13 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:4.92610837 / v11 Z:0.0 W:0.0];
      v58[1] = v13;
      v57[2] = @"inputBVector";
      v14 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:4.92610837 / v11 W:0.0];
      v58[2] = v14;
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:3];
      v16 = [v9 imageByApplyingFilter:@"CIColorMatrix" withInputParameters:v15];

      v17 = [v8 linearized];
      v18 = [v17 extended];

      v19 = objc_msgSend(v16, "imageByColorMatchingWorkingSpaceToColorSpace:", objc_msgSend(v18, "CGColorSpace"));

      v55[0] = @"inputMinComponents";
      v20 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:0.0 W:0.0];
      v55[1] = @"inputMaxComponents";
      v56[0] = v20;
      v21 = [MEMORY[0x1E4F1E080] vectorWithX:4.92610837 Y:4.92610837 Z:4.92610837 W:1.0];
      v56[1] = v21;
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:2];
      v23 = [v19 imageByApplyingFilter:@"CIColorClamp" withInputParameters:v22];

      v8 = v49;
      v9 = objc_msgSend(v23, "imageByColorMatchingColorSpaceToWorkingSpace:", objc_msgSend(v18, "CGColorSpace"));
    }
    uint64_t v24 = objc_msgSend(v9, "imageByColorMatchingWorkingSpaceToColorSpace:", objc_msgSend(v8, "CGColorSpace"));

    v9 = (void *)v24;
  }
  v47 = [(PIPortraitVideoFilter *)self inputDisparityImage];
  v25 = [(PIPortraitVideoFilter *)self inputColorPixelBuffer];
  v26 = [(PIPortraitVideoFilter *)self inputDisparityPixelBuffer];
  v27 = [(PIPortraitVideoFilter *)self inputGlobalRenderingMetadata];
  v46 = [(PIPortraitVideoFilter *)self inputTimedRenderingMetadata];
  v28 = [(PIPortraitVideoFilter *)self inputAperture];
  v29 = [(PIPortraitVideoFilter *)self inputFocusedDisparity];
  v30 = [(PIPortraitVideoFilter *)self inputRenderQuality];
  v31 = [(PIPortraitVideoFilter *)self inputRenderDebugMode];
  id v50 = 0;
  LOBYTE(v45) = [(PIPortraitVideoFilter *)self inputIsHDR];
  v32 = [v48 applyWithInputImage:v9 disparityImage:v47 inputPixelBuffer:v25 disparityPixelBuffer:v26 globalMetadata:v27 timedMetadata:v46 aperture:v28 focusedDisparity:v29 quality:v30 debugMode:v31 isHDR:v45 error:&v50];
  id v33 = v50;

  v34 = v49;
  if (!v32)
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_200);
    }
    v35 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v54 = v33;
      _os_log_error_impl(&dword_1A9680000, v35, OS_LOG_TYPE_ERROR, "Could not apply PIPortraitVideoProcessor: %@", buf, 0xCu);
    }
  }
  if (v49)
  {
    v36 = objc_msgSend(v32, "imageByColorMatchingColorSpaceToWorkingSpace:", objc_msgSend(v49, "CGColorSpace"));

    if ([v49 isHDR] && v11 > 1.0)
    {
      v51[0] = @"inputRVector";
      double v37 = v11 / 4.92610837;
      v38 = [MEMORY[0x1E4F1E080] vectorWithX:v37 Y:0.0 Z:0.0 W:0.0];
      v52[0] = v38;
      v51[1] = @"inputGVector";
      v39 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:v37 Z:0.0 W:0.0];
      v52[1] = v39;
      v51[2] = @"inputBVector";
      v40 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:v37 W:0.0];
      v52[2] = v40;
      v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:3];
      v42 = [v36 imageByApplyingFilter:@"CIColorMatrix" withInputParameters:v41];

      v34 = v49;
      v43 = [MEMORY[0x1E4F7A400] workingColorSpace];
      v32 = objc_msgSend(v42, "imageByTaggingWithColorSpace:", objc_msgSend(v43, "CGColorSpace"));
    }
    else
    {
      v32 = v36;
    }
  }

  return v32;
}

void __36__PIPortraitVideoFilter_outputImage__block_invoke()
{
}

@end