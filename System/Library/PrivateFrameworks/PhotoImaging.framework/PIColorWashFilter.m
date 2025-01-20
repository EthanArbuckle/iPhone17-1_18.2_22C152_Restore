@interface PIColorWashFilter
+ (id)colorWashFixedKernel;
+ (id)colorWashFixedSmoothKernel;
+ (id)colorWashKernels;
+ (id)colorWashVariableKernel;
+ (id)colorWashVariableSmoothKernel;
+ (id)customAttributes;
+ (id)hueChromaColorWashKernel;
+ (id)hueChromaFixedColorWashKernel;
+ (id)hueChromaVariableColorWashKernel;
- (CIColor)inputColor;
- (CIImage)inputImage;
- (NSString)inputMode;
- (id)outputImage;
- (void)setInputColor:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputMode:(id)a3;
@end

@implementation PIColorWashFilter

+ (id)customAttributes
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = *MEMORY[0x1E4F1E448];
  uint64_t v3 = *MEMORY[0x1E4F1E138];
  uint64_t v4 = *MEMORY[0x1E4F1E098];
  v12[0] = *MEMORY[0x1E4F1E0F0];
  uint64_t v2 = v12[0];
  v12[1] = v4;
  v13[0] = v3;
  v5 = [MEMORY[0x1E4F1E008] magentaColor];
  v13[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v14[1] = @"inputMode";
  v15[0] = v6;
  v10[0] = @"PIAttributeAvailableModes";
  v10[1] = v4;
  v11[0] = &unk_1F000AAF0;
  v11[1] = @"HueChroma";
  v10[2] = v2;
  v11[2] = @"PIAttributeTypeMode";
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  v15[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v8;
}

+ (id)colorWashVariableSmoothKernel
{
  uint64_t v2 = [a1 colorWashKernels];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"rgb_color_wash_variable_smooth"];

  return v3;
}

+ (id)colorWashFixedSmoothKernel
{
  uint64_t v2 = [a1 colorWashKernels];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"rgb_color_wash_fixed_smooth"];

  return v3;
}

+ (id)colorWashVariableKernel
{
  uint64_t v2 = [a1 colorWashKernels];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"rgb_color_wash_variable"];

  return v3;
}

+ (id)colorWashFixedKernel
{
  uint64_t v2 = [a1 colorWashKernels];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"rgb_color_wash_fixed"];

  return v3;
}

+ (id)hueChromaVariableColorWashKernel
{
  uint64_t v2 = [a1 colorWashKernels];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"ipt_hue_chroma_color_wash_variable"];

  return v3;
}

+ (id)hueChromaFixedColorWashKernel
{
  uint64_t v2 = [a1 colorWashKernels];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"ipt_hue_chroma_color_wash_fixed"];

  return v3;
}

+ (id)hueChromaColorWashKernel
{
  uint64_t v2 = [a1 colorWashKernels];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"ipt_hue_chroma_color_wash"];

  return v3;
}

+ (id)colorWashKernels
{
  if (colorWashKernels_onceToken != -1) {
    dispatch_once(&colorWashKernels_onceToken, &__block_literal_global_16830);
  }
  uint64_t v2 = (void *)colorWashKernels_kernels;
  return v2;
}

uint64_t __37__PIColorWashFilter_colorWashKernels__block_invoke()
{
  colorWashKernels_kernels = [MEMORY[0x1E4F1E058] kernelsDictionaryWithString:&cfstr_KernelVec4IptH];
  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputMode, 0);
  objc_storeStrong((id *)&self->_inputColor, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

- (void)setInputMode:(id)a3
{
}

- (NSString)inputMode
{
  return self->_inputMode;
}

- (void)setInputColor:(id)a3
{
}

- (CIColor)inputColor
{
  return self->_inputColor;
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
  v54[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PIColorWashFilter *)self inputImage];
  if (!v3)
  {
    v8 = 0;
    goto LABEL_31;
  }
  uint64_t v4 = (void *)v3;
  v5 = [(PIColorWashFilter *)self inputColor];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1E008] magentaColor];
  }
  v9 = v7;

  uint64_t v10 = [(PIColorWashFilter *)self inputMode];
  v11 = (void *)v10;
  if (v10) {
    v12 = (__CFString *)v10;
  }
  else {
    v12 = @"HueChroma";
  }
  v13 = v12;

  if ([(__CFString *)v13 hasPrefix:@"HueChroma"])
  {
    v14 = objc_msgSend(MEMORY[0x1E4F8CC78], "colorWithCGColor:", objc_msgSend(v9, "cgColor"));
    v15 = [v4 imageByUnpremultiplyingAlpha];
    v16 = +[PIIPTHueChromaFilter convertRGBImageToHueChroma:v15];

    if ([(__CFString *)v13 isEqualToString:@"HueChromaFixed"])
    {
      uint64_t v17 = [(id)objc_opt_class() hueChromaFixedColorWashKernel];
    }
    else
    {
      int v19 = [(__CFString *)v13 isEqualToString:@"HueChromaVariable"];
      v20 = objc_opt_class();
      if (v19) {
        [v20 hueChromaVariableColorWashKernel];
      }
      else {
      uint64_t v17 = [v20 hueChromaColorWashKernel];
      }
    }
    v18 = (void *)v17;
    [v4 extent];
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    v54[0] = v16;
    v30 = (void *)MEMORY[0x1E4F1E080];
    [v14 luma];
    double v32 = v31;
    [v14 hue];
    double v34 = v33 * 3.14159265 / 180.0;
    [v14 chroma];
    v36 = [v30 vectorWithX:v32 Y:v34 Z:v35];
    v54[1] = v36;
    v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
    v38 = objc_msgSend(v18, "applyWithExtent:arguments:", v37, v23, v25, v27, v29);

    v39 = +[PIIPTHueChromaFilter convertHueChromaImageToRGB:v38];
    v8 = [v39 imageByPremultiplyingAlpha];

    goto LABEL_21;
  }
  if (![(__CFString *)v13 isEqualToString:@"MonoLight"])
  {
    if ([(__CFString *)v13 isEqualToString:@"RGBFixed"])
    {
      uint64_t v21 = [(id)objc_opt_class() colorWashFixedKernel];
    }
    else if ([(__CFString *)v13 isEqualToString:@"RGBVariable"])
    {
      uint64_t v21 = [(id)objc_opt_class() colorWashVariableKernel];
    }
    else if ([(__CFString *)v13 isEqualToString:@"RGBFixedSmooth"])
    {
      uint64_t v21 = [(id)objc_opt_class() colorWashFixedSmoothKernel];
    }
    else
    {
      if (![(__CFString *)v13 isEqualToString:@"RGBVariableSmooth"])
      {
        v14 = 0;
        goto LABEL_29;
      }
      uint64_t v21 = [(id)objc_opt_class() colorWashVariableSmoothKernel];
    }
    v14 = (void *)v21;
LABEL_29:
    v40 = [v4 imageByUnpremultiplyingAlpha];

    [v40 extent];
    double v42 = v41;
    double v44 = v43;
    double v46 = v45;
    double v48 = v47;
    v51[0] = v40;
    v51[1] = v9;
    v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
    v16 = objc_msgSend(v14, "applyWithExtent:arguments:", v49, v42, v44, v46, v48);

    v8 = [v16 imageByPremultiplyingAlpha];
    uint64_t v4 = v40;
    goto LABEL_30;
  }
  v14 = [v4 imageByApplyingFilter:@"CIPhotoEffectMono"];
  v16 = [MEMORY[0x1E4F1E050] imageWithColor:v9];
  uint64_t v52 = *MEMORY[0x1E4F1E418];
  v53 = v14;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
  v8 = [v16 imageByApplyingFilter:@"CISoftLightBlendMode" withInputParameters:v18];
LABEL_21:

LABEL_30:
LABEL_31:
  return v8;
}

@end