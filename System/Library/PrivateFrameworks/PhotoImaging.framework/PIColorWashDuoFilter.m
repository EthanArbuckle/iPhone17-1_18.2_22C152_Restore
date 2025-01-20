@interface PIColorWashDuoFilter
+ (id)colorWashKernels;
+ (id)customAttributes;
+ (id)hueChromaColorWashDuoFixedKernel;
+ (id)hueChromaColorWashDuoKernel;
+ (id)hueChromaColorWashDuoVariableKernel;
+ (id)iptColorWashDuoFixedKernel;
+ (id)iptColorWashDuoKernel;
+ (id)iptColorWashDuoVariableKernel;
+ (id)rgbColorWashDuoFixedKernel;
+ (id)rgbColorWashDuoKernel;
+ (id)rgbColorWashDuoVariableKernel;
- (CIColor)inputHighlightColor;
- (CIColor)inputShadowColor;
- (CIImage)inputImage;
- (NSString)inputMode;
- (id)outputImage;
- (void)setInputHighlightColor:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputMode:(id)a3;
- (void)setInputShadowColor:(id)a3;
@end

@implementation PIColorWashDuoFilter

+ (id)customAttributes
{
  v19[3] = *MEMORY[0x1E4F143B8];
  v18[0] = @"inputShadowColor";
  uint64_t v3 = *MEMORY[0x1E4F1E138];
  uint64_t v4 = *MEMORY[0x1E4F1E098];
  v16[0] = *MEMORY[0x1E4F1E0F0];
  uint64_t v2 = v16[0];
  v16[1] = v4;
  v17[0] = v3;
  v5 = [MEMORY[0x1E4F1E008] blueColor];
  v17[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  v19[0] = v6;
  v18[1] = @"inputHighlightColor";
  v14[1] = v4;
  v15[0] = v3;
  v14[0] = v2;
  v7 = [MEMORY[0x1E4F1E008] yellowColor];
  v15[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  v18[2] = @"inputMode";
  v19[1] = v8;
  v12[0] = @"PIAttributeAvailableModes";
  v12[1] = v4;
  v13[0] = &unk_1F000AB08;
  v13[1] = @"IPT";
  v12[2] = v2;
  v13[2] = @"PIAttributeTypeMode";
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  v19[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];

  return v10;
}

+ (id)rgbColorWashDuoVariableKernel
{
  uint64_t v2 = [a1 colorWashKernels];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"rgb_color_wash_duo_variable"];

  return v3;
}

+ (id)rgbColorWashDuoFixedKernel
{
  uint64_t v2 = [a1 colorWashKernels];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"rgb_color_wash_duo_fixed"];

  return v3;
}

+ (id)rgbColorWashDuoKernel
{
  uint64_t v2 = [a1 colorWashKernels];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"rgb_color_wash_duo"];

  return v3;
}

+ (id)hueChromaColorWashDuoVariableKernel
{
  uint64_t v2 = [a1 colorWashKernels];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"ipt_hue_chroma_color_wash_duo_variable"];

  return v3;
}

+ (id)hueChromaColorWashDuoFixedKernel
{
  uint64_t v2 = [a1 colorWashKernels];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"ipt_hue_chroma_color_wash_duo_fixed"];

  return v3;
}

+ (id)hueChromaColorWashDuoKernel
{
  uint64_t v2 = [a1 colorWashKernels];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"ipt_hue_chroma_color_wash_duo"];

  return v3;
}

+ (id)iptColorWashDuoVariableKernel
{
  uint64_t v2 = [a1 colorWashKernels];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"ipt_color_wash_duo_variable"];

  return v3;
}

+ (id)iptColorWashDuoFixedKernel
{
  uint64_t v2 = [a1 colorWashKernels];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"ipt_color_wash_duo_fixed"];

  return v3;
}

+ (id)iptColorWashDuoKernel
{
  uint64_t v2 = [a1 colorWashKernels];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"ipt_color_wash_duo"];

  return v3;
}

+ (id)colorWashKernels
{
  return +[PIColorWashFilter colorWashKernels];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputMode, 0);
  objc_storeStrong((id *)&self->_inputHighlightColor, 0);
  objc_storeStrong((id *)&self->_inputShadowColor, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

- (void)setInputMode:(id)a3
{
}

- (NSString)inputMode
{
  return self->_inputMode;
}

- (void)setInputHighlightColor:(id)a3
{
}

- (CIColor)inputHighlightColor
{
  return self->_inputHighlightColor;
}

- (void)setInputShadowColor:(id)a3
{
}

- (CIColor)inputShadowColor
{
  return self->_inputShadowColor;
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
  v99[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PIColorWashDuoFilter *)self inputImage];
  if (!v3)
  {
    v8 = 0;
    goto LABEL_41;
  }
  uint64_t v4 = (void *)v3;
  v5 = [(PIColorWashDuoFilter *)self inputShadowColor];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1E008] blueColor];
  }
  v9 = v7;

  v10 = [(PIColorWashDuoFilter *)self inputHighlightColor];
  v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [MEMORY[0x1E4F1E008] blueColor];
  }
  v13 = v12;

  uint64_t v14 = [(PIColorWashDuoFilter *)self inputMode];
  v15 = (void *)v14;
  if (v14) {
    v16 = (__CFString *)v14;
  }
  else {
    v16 = @"IPT";
  }
  v17 = v16;

  if (![(__CFString *)v17 hasPrefix:@"IPT"])
  {
    if ([(__CFString *)v17 hasPrefix:@"HueChroma"])
    {
      v96 = v9;
      v18 = objc_msgSend(MEMORY[0x1E4F8CC78], "colorWithCGColor:", objc_msgSend(v9, "cgColor"));
      v19 = objc_msgSend(MEMORY[0x1E4F8CC78], "colorWithCGColor:", objc_msgSend(v13, "cgColor"));
      v23 = [v4 imageByUnpremultiplyingAlpha];
      v21 = +[PIIPTHueChromaFilter convertRGBImageToHueChroma:v23];

      if ([(__CFString *)v17 isEqualToString:@"HueChromaFixed"])
      {
        uint64_t v24 = [(id)objc_opt_class() hueChromaColorWashDuoFixedKernel];
      }
      else
      {
        int v28 = [(__CFString *)v17 isEqualToString:@"HueChromaVariable"];
        v29 = objc_opt_class();
        if (v28) {
          [v29 hueChromaColorWashDuoVariableKernel];
        }
        else {
        uint64_t v24 = [v29 hueChromaColorWashDuoKernel];
        }
      }
      v30 = (void *)v24;
      [v18 hue];
      double v57 = v56;
      [v19 hue];
      double v59 = v58;
      double v60 = v58 - v57;
      double v61 = 360.0;
      double v62 = vabdd_f64(v59, v57);
      v95 = v13;
      if (fabs(v60 + 360.0) < v62 || (double v61 = -360.0, fabs(v60 + -360.0) < v62)) {
        double v59 = v59 + v61;
      }
      [v4 extent];
      double v94 = v63;
      double v65 = v64;
      double v67 = v66;
      double v69 = v68;
      v98[0] = v21;
      v70 = (void *)MEMORY[0x1E4F1E080];
      [v18 luma];
      double v72 = v71;
      [v18 chroma];
      v74 = [v70 vectorWithX:v72 Y:v57 * 3.14159265 / 180.0 Z:v73];
      v98[1] = v74;
      v75 = (void *)MEMORY[0x1E4F1E080];
      [v19 luma];
      double v77 = v76;
      [v19 chroma];
      v79 = [v75 vectorWithX:v77 Y:v59 * 3.14159265 / 180.0 Z:v78];
      v98[2] = v79;
      v80 = [MEMORY[0x1E4F1C978] arrayWithObjects:v98 count:3];
      v81 = objc_msgSend(v30, "applyWithExtent:arguments:", v80, v94, v65, v67, v69);

      v82 = +[PIIPTHueChromaFilter convertHueChromaImageToRGB:v81];
      v8 = [v82 imageByPremultiplyingAlpha];

      goto LABEL_35;
    }
    if ([(__CFString *)v17 isEqualToString:@"RGB"])
    {
      uint64_t v27 = [(id)objc_opt_class() rgbColorWashDuoKernel];
    }
    else if ([(__CFString *)v17 isEqualToString:@"RGBFixed"])
    {
      uint64_t v27 = [(id)objc_opt_class() rgbColorWashDuoFixedKernel];
    }
    else
    {
      if (![(__CFString *)v17 isEqualToString:@"RGBVariable"])
      {
        v18 = 0;
        goto LABEL_39;
      }
      uint64_t v27 = [(id)objc_opt_class() rgbColorWashDuoVariableKernel];
    }
    v18 = (void *)v27;
LABEL_39:
    v83 = [v4 imageByUnpremultiplyingAlpha];

    [v83 extent];
    double v85 = v84;
    double v87 = v86;
    double v89 = v88;
    double v91 = v90;
    v97[0] = v83;
    v97[1] = v9;
    v97[2] = v13;
    v92 = [MEMORY[0x1E4F1C978] arrayWithObjects:v97 count:3];
    v19 = objc_msgSend(v18, "applyWithExtent:arguments:", v92, v85, v87, v89, v91);

    v8 = [v19 imageByPremultiplyingAlpha];
    uint64_t v4 = v83;
    goto LABEL_40;
  }
  v96 = v9;
  v18 = objc_msgSend(MEMORY[0x1E4F8CC78], "colorWithCGColor:", objc_msgSend(v9, "cgColor"));
  v19 = objc_msgSend(MEMORY[0x1E4F8CC78], "colorWithCGColor:", objc_msgSend(v13, "cgColor"));
  v20 = [v4 imageByUnpremultiplyingAlpha];
  v21 = +[PIIPTHueChromaFilter convertRGBImageToIPT:v20];

  v95 = v13;
  if ([(__CFString *)v17 isEqualToString:@"IPTFixed"])
  {
    uint64_t v22 = [(id)objc_opt_class() iptColorWashDuoFixedKernel];
  }
  else
  {
    int v25 = [(__CFString *)v17 isEqualToString:@"IPTVariable"];
    v26 = objc_opt_class();
    if (v25) {
      [v26 iptColorWashDuoVariableKernel];
    }
    else {
    uint64_t v22 = [v26 iptColorWashDuoKernel];
    }
  }
  v30 = (void *)v22;
  [v4 extent];
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  v99[0] = v21;
  v39 = (void *)MEMORY[0x1E4F1E080];
  [v18 luma];
  double v41 = v40;
  [v18 pt];
  double v43 = v42;
  [v18 pt];
  v45 = [v39 vectorWithX:v41 Y:v43 Z:v44];
  v99[1] = v45;
  v46 = (void *)MEMORY[0x1E4F1E080];
  [v19 luma];
  double v48 = v47;
  [v19 pt];
  double v50 = v49;
  [v19 pt];
  v52 = [v46 vectorWithX:v48 Y:v50 Z:v51];
  v99[2] = v52;
  v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v99 count:3];
  v54 = objc_msgSend(v30, "applyWithExtent:arguments:", v53, v32, v34, v36, v38);

  v55 = +[PIIPTHueChromaFilter convertIPTImageToRGB:v54];
  v8 = [v55 imageByPremultiplyingAlpha];

LABEL_35:
  v13 = v95;
  v9 = v96;
LABEL_40:

LABEL_41:
  return v8;
}

@end