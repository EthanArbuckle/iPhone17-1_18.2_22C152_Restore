@interface PILevelsFilterHDR
+ (id)_customAttributesForKey:(id)a3;
+ (id)customAttributes;
+ (id)defaultValueForKey:(id)a3;
- (CIImage)inputImage;
- (NSNumber)inputBlackDstBlue;
- (NSNumber)inputBlackDstGreen;
- (NSNumber)inputBlackDstRGB;
- (NSNumber)inputBlackDstRed;
- (NSNumber)inputBlackSrcBlue;
- (NSNumber)inputBlackSrcGreen;
- (NSNumber)inputBlackSrcRGB;
- (NSNumber)inputBlackSrcRed;
- (NSNumber)inputHilightDstBlue;
- (NSNumber)inputHilightDstGreen;
- (NSNumber)inputHilightDstRGB;
- (NSNumber)inputHilightDstRed;
- (NSNumber)inputHilightSrcBlue;
- (NSNumber)inputHilightSrcGreen;
- (NSNumber)inputHilightSrcRGB;
- (NSNumber)inputHilightSrcRed;
- (NSNumber)inputMidDstBlue;
- (NSNumber)inputMidDstGreen;
- (NSNumber)inputMidDstRGB;
- (NSNumber)inputMidDstRed;
- (NSNumber)inputMidSrcBlue;
- (NSNumber)inputMidSrcGreen;
- (NSNumber)inputMidSrcRGB;
- (NSNumber)inputMidSrcRed;
- (NSNumber)inputShadowDstBlue;
- (NSNumber)inputShadowDstGreen;
- (NSNumber)inputShadowDstRGB;
- (NSNumber)inputShadowDstRed;
- (NSNumber)inputShadowSrcBlue;
- (NSNumber)inputShadowSrcGreen;
- (NSNumber)inputShadowSrcRGB;
- (NSNumber)inputShadowSrcRed;
- (NSNumber)inputWhiteDstBlue;
- (NSNumber)inputWhiteDstGreen;
- (NSNumber)inputWhiteDstRGB;
- (NSNumber)inputWhiteDstRed;
- (NSNumber)inputWhiteSrcBlue;
- (NSNumber)inputWhiteSrcGreen;
- (NSNumber)inputWhiteSrcRGB;
- (NSNumber)inputWhiteSrcRed;
- (NSString)inputColorSpace;
- (double)floatValueForKey:(id)a3 defaultValue:(double)a4 clearIfNotDefault:(BOOL *)a5;
- (id)P3KernelHDR;
- (id)_LUTImage;
- (id)outputImage;
- (void)setDefaults;
- (void)setInputBlackDstBlue:(id)a3;
- (void)setInputBlackDstGreen:(id)a3;
- (void)setInputBlackDstRGB:(id)a3;
- (void)setInputBlackDstRed:(id)a3;
- (void)setInputBlackSrcBlue:(id)a3;
- (void)setInputBlackSrcGreen:(id)a3;
- (void)setInputBlackSrcRGB:(id)a3;
- (void)setInputBlackSrcRed:(id)a3;
- (void)setInputColorSpace:(id)a3;
- (void)setInputHilightDstBlue:(id)a3;
- (void)setInputHilightDstGreen:(id)a3;
- (void)setInputHilightDstRGB:(id)a3;
- (void)setInputHilightDstRed:(id)a3;
- (void)setInputHilightSrcBlue:(id)a3;
- (void)setInputHilightSrcGreen:(id)a3;
- (void)setInputHilightSrcRGB:(id)a3;
- (void)setInputHilightSrcRed:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputMidDstBlue:(id)a3;
- (void)setInputMidDstGreen:(id)a3;
- (void)setInputMidDstRGB:(id)a3;
- (void)setInputMidDstRed:(id)a3;
- (void)setInputMidSrcBlue:(id)a3;
- (void)setInputMidSrcGreen:(id)a3;
- (void)setInputMidSrcRGB:(id)a3;
- (void)setInputMidSrcRed:(id)a3;
- (void)setInputShadowDstBlue:(id)a3;
- (void)setInputShadowDstGreen:(id)a3;
- (void)setInputShadowDstRGB:(id)a3;
- (void)setInputShadowDstRed:(id)a3;
- (void)setInputShadowSrcBlue:(id)a3;
- (void)setInputShadowSrcGreen:(id)a3;
- (void)setInputShadowSrcRGB:(id)a3;
- (void)setInputShadowSrcRed:(id)a3;
- (void)setInputWhiteDstBlue:(id)a3;
- (void)setInputWhiteDstGreen:(id)a3;
- (void)setInputWhiteDstRGB:(id)a3;
- (void)setInputWhiteDstRed:(id)a3;
- (void)setInputWhiteSrcBlue:(id)a3;
- (void)setInputWhiteSrcGreen:(id)a3;
- (void)setInputWhiteSrcRGB:(id)a3;
- (void)setInputWhiteSrcRed:(id)a3;
@end

@implementation PILevelsFilterHDR

+ (id)customAttributes
{
  id v19 = (id)MEMORY[0x1E4F1C9E8];
  v45 = [a1 _customAttributesForKey:@"inputBlackSrcRGB"];
  v44 = [a1 _customAttributesForKey:@"inputBlackDstRGB"];
  v43 = [a1 _customAttributesForKey:@"inputShadowSrcRGB"];
  v42 = [a1 _customAttributesForKey:@"inputShadowDstRGB"];
  v41 = [a1 _customAttributesForKey:@"inputMidSrcRGB"];
  v40 = [a1 _customAttributesForKey:@"inputMidDstRGB"];
  v39 = [a1 _customAttributesForKey:@"inputHilightSrcRGB"];
  v38 = [a1 _customAttributesForKey:@"inputHilightDstRGB"];
  v37 = [a1 _customAttributesForKey:@"inputWhiteSrcRGB"];
  v36 = [a1 _customAttributesForKey:@"inputWhiteDstRGB"];
  v35 = [a1 _customAttributesForKey:@"inputBlackSrcRed"];
  v34 = [a1 _customAttributesForKey:@"inputBlackDstRed"];
  v33 = [a1 _customAttributesForKey:@"inputShadowSrcRed"];
  v32 = [a1 _customAttributesForKey:@"inputShadowDstRed"];
  v31 = [a1 _customAttributesForKey:@"inputMidSrcRed"];
  v30 = [a1 _customAttributesForKey:@"inputMidDstRed"];
  v29 = [a1 _customAttributesForKey:@"inputHilightSrcRed"];
  v28 = [a1 _customAttributesForKey:@"inputHilightDstRed"];
  v27 = [a1 _customAttributesForKey:@"inputWhiteSrcRed"];
  v26 = [a1 _customAttributesForKey:@"inputWhiteDstRed"];
  v25 = [a1 _customAttributesForKey:@"inputBlackSrcGreen"];
  v18 = [a1 _customAttributesForKey:@"inputBlackDstGreen"];
  v17 = [a1 _customAttributesForKey:@"inputShadowSrcGreen"];
  v16 = [a1 _customAttributesForKey:@"inputShadowDstGreen"];
  v15 = [a1 _customAttributesForKey:@"inputMidSrcGreen"];
  v14 = [a1 _customAttributesForKey:@"inputMidDstGreen"];
  v13 = [a1 _customAttributesForKey:@"inputHilightSrcGreen"];
  v24 = [a1 _customAttributesForKey:@"inputHilightDstGreen"];
  v12 = [a1 _customAttributesForKey:@"inputWhiteSrcGreen"];
  v23 = [a1 _customAttributesForKey:@"inputWhiteDstGreen"];
  v22 = [a1 _customAttributesForKey:@"inputBlackSrcBlue"];
  v21 = [a1 _customAttributesForKey:@"inputBlackDstBlue"];
  v11 = [a1 _customAttributesForKey:@"inputShadowSrcBlue"];
  v6 = [a1 _customAttributesForKey:@"inputShadowDstBlue"];
  v10 = [a1 _customAttributesForKey:@"inputMidSrcBlue"];
  v9 = [a1 _customAttributesForKey:@"inputMidDstBlue"];
  v8 = [a1 _customAttributesForKey:@"inputHilightSrcBlue"];
  v7 = [a1 _customAttributesForKey:@"inputHilightDstBlue"];
  v3 = [a1 _customAttributesForKey:@"inputWhiteSrcBlue"];
  v5 = [a1 _customAttributesForKey:@"inputWhiteDstBlue"];
  objc_msgSend(v19, "dictionaryWithObjectsAndKeys:", v45, @"inputBlackSrcRGB", v44, @"inputBlackDstRGB", v43, @"inputShadowSrcRGB", v42, @"inputShadowDstRGB", v41, @"inputMidSrcRGB", v40, @"inputMidDstRGB", v39, @"inputHilightSrcRGB", v38, @"inputHilightDstRGB", v37,
    @"inputWhiteSrcRGB",
    v36,
    @"inputWhiteDstRGB",
    v35,
    @"inputBlackSrcRed",
    v34,
    @"inputBlackDstRed",
    v33,
    @"inputShadowSrcRed",
    v32,
    @"inputShadowDstRed",
    v31,
    @"inputMidSrcRed",
    v30,
    @"inputMidDstRed",
    v29,
    @"inputHilightSrcRed",
    v28,
    @"inputHilightDstRed",
    v27,
    @"inputWhiteSrcRed",
    v26,
    @"inputWhiteDstRed",
    v25,
    @"inputBlackSrcGreen",
    v18,
    @"inputBlackDstGreen",
    v17,
    @"inputShadowSrcGreen",
    v16,
    @"inputShadowDstGreen",
    v15,
    @"inputMidSrcGreen",
    v14,
    @"inputMidDstGreen",
    v13,
    @"inputHilightSrcGreen",
    v24,
    @"inputHilightDstGreen",
    v12,
    @"inputWhiteSrcGreen",
    v23,
    @"inputWhiteDstGreen",
    v22);
  id v20 = (id)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)_customAttributesForKey:(id)a3
{
  v3 = [a1 defaultValueForKey:a3];
  v4 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F1E0D8], &unk_1F000A158, *MEMORY[0x1E4F1E0D0], &unk_1F000A148, *MEMORY[0x1E4F1E0E8], &unk_1F000A158, *MEMORY[0x1E4F1E0E0], v3, *MEMORY[0x1E4F1E098], v3, *MEMORY[0x1E4F1E0C8], *MEMORY[0x1E4F1E158], *MEMORY[0x1E4F1E0F0], 0);

  return v4;
}

+ (id)defaultValueForKey:(id)a3
{
  id v3 = a3;
  double v4 = 0.0;
  if (([v3 containsString:@"inputBlackSrc"] & 1) == 0
    && ([v3 containsString:@"inputBlackDst"] & 1) == 0)
  {
    double v4 = 0.25;
    if (([v3 containsString:@"inputShadowSrc"] & 1) == 0
      && ([v3 containsString:@"inputShadowDst"] & 1) == 0)
    {
      double v4 = 0.5;
      if (([v3 containsString:@"inputMidSrc"] & 1) == 0
        && ([v3 containsString:@"inputMidDst"] & 1) == 0)
      {
        double v4 = 0.75;
        if (([v3 containsString:@"inputHilightSrc"] & 1) == 0
          && ([v3 containsString:@"inputHilightDst"] & 1) == 0)
        {
          if (([v3 containsString:@"inputWhiteSrc"] & 1) != 0
            || (double v4 = 0.0, [v3 containsString:@"inputWhiteDst"]))
          {
            double v4 = 1.0;
          }
        }
      }
    }
  }
  v5 = [NSNumber numberWithDouble:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputColorSpace, 0);
  objc_storeStrong((id *)&self->_inputWhiteDstBlue, 0);
  objc_storeStrong((id *)&self->_inputWhiteSrcBlue, 0);
  objc_storeStrong((id *)&self->_inputHilightDstBlue, 0);
  objc_storeStrong((id *)&self->_inputHilightSrcBlue, 0);
  objc_storeStrong((id *)&self->_inputMidDstBlue, 0);
  objc_storeStrong((id *)&self->_inputMidSrcBlue, 0);
  objc_storeStrong((id *)&self->_inputShadowDstBlue, 0);
  objc_storeStrong((id *)&self->_inputShadowSrcBlue, 0);
  objc_storeStrong((id *)&self->_inputBlackDstBlue, 0);
  objc_storeStrong((id *)&self->_inputBlackSrcBlue, 0);
  objc_storeStrong((id *)&self->_inputWhiteDstGreen, 0);
  objc_storeStrong((id *)&self->_inputWhiteSrcGreen, 0);
  objc_storeStrong((id *)&self->_inputHilightDstGreen, 0);
  objc_storeStrong((id *)&self->_inputHilightSrcGreen, 0);
  objc_storeStrong((id *)&self->_inputMidDstGreen, 0);
  objc_storeStrong((id *)&self->_inputMidSrcGreen, 0);
  objc_storeStrong((id *)&self->_inputShadowDstGreen, 0);
  objc_storeStrong((id *)&self->_inputShadowSrcGreen, 0);
  objc_storeStrong((id *)&self->_inputBlackDstGreen, 0);
  objc_storeStrong((id *)&self->_inputBlackSrcGreen, 0);
  objc_storeStrong((id *)&self->_inputWhiteDstRed, 0);
  objc_storeStrong((id *)&self->_inputWhiteSrcRed, 0);
  objc_storeStrong((id *)&self->_inputHilightDstRed, 0);
  objc_storeStrong((id *)&self->_inputHilightSrcRed, 0);
  objc_storeStrong((id *)&self->_inputMidDstRed, 0);
  objc_storeStrong((id *)&self->_inputMidSrcRed, 0);
  objc_storeStrong((id *)&self->_inputShadowDstRed, 0);
  objc_storeStrong((id *)&self->_inputShadowSrcRed, 0);
  objc_storeStrong((id *)&self->_inputBlackDstRed, 0);
  objc_storeStrong((id *)&self->_inputBlackSrcRed, 0);
  objc_storeStrong((id *)&self->_inputWhiteDstRGB, 0);
  objc_storeStrong((id *)&self->_inputWhiteSrcRGB, 0);
  objc_storeStrong((id *)&self->_inputHilightDstRGB, 0);
  objc_storeStrong((id *)&self->_inputHilightSrcRGB, 0);
  objc_storeStrong((id *)&self->_inputMidDstRGB, 0);
  objc_storeStrong((id *)&self->_inputMidSrcRGB, 0);
  objc_storeStrong((id *)&self->_inputShadowDstRGB, 0);
  objc_storeStrong((id *)&self->_inputShadowSrcRGB, 0);
  objc_storeStrong((id *)&self->_inputBlackDstRGB, 0);
  objc_storeStrong((id *)&self->_inputBlackSrcRGB, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

- (void)setInputColorSpace:(id)a3
{
}

- (NSString)inputColorSpace
{
  return self->_inputColorSpace;
}

- (void)setInputWhiteDstBlue:(id)a3
{
}

- (NSNumber)inputWhiteDstBlue
{
  return self->_inputWhiteDstBlue;
}

- (void)setInputWhiteSrcBlue:(id)a3
{
}

- (NSNumber)inputWhiteSrcBlue
{
  return self->_inputWhiteSrcBlue;
}

- (void)setInputHilightDstBlue:(id)a3
{
}

- (NSNumber)inputHilightDstBlue
{
  return self->_inputHilightDstBlue;
}

- (void)setInputHilightSrcBlue:(id)a3
{
}

- (NSNumber)inputHilightSrcBlue
{
  return self->_inputHilightSrcBlue;
}

- (void)setInputMidDstBlue:(id)a3
{
}

- (NSNumber)inputMidDstBlue
{
  return self->_inputMidDstBlue;
}

- (void)setInputMidSrcBlue:(id)a3
{
}

- (NSNumber)inputMidSrcBlue
{
  return self->_inputMidSrcBlue;
}

- (void)setInputShadowDstBlue:(id)a3
{
}

- (NSNumber)inputShadowDstBlue
{
  return self->_inputShadowDstBlue;
}

- (void)setInputShadowSrcBlue:(id)a3
{
}

- (NSNumber)inputShadowSrcBlue
{
  return self->_inputShadowSrcBlue;
}

- (void)setInputBlackDstBlue:(id)a3
{
}

- (NSNumber)inputBlackDstBlue
{
  return self->_inputBlackDstBlue;
}

- (void)setInputBlackSrcBlue:(id)a3
{
}

- (NSNumber)inputBlackSrcBlue
{
  return self->_inputBlackSrcBlue;
}

- (void)setInputWhiteDstGreen:(id)a3
{
}

- (NSNumber)inputWhiteDstGreen
{
  return self->_inputWhiteDstGreen;
}

- (void)setInputWhiteSrcGreen:(id)a3
{
}

- (NSNumber)inputWhiteSrcGreen
{
  return self->_inputWhiteSrcGreen;
}

- (void)setInputHilightDstGreen:(id)a3
{
}

- (NSNumber)inputHilightDstGreen
{
  return self->_inputHilightDstGreen;
}

- (void)setInputHilightSrcGreen:(id)a3
{
}

- (NSNumber)inputHilightSrcGreen
{
  return self->_inputHilightSrcGreen;
}

- (void)setInputMidDstGreen:(id)a3
{
}

- (NSNumber)inputMidDstGreen
{
  return self->_inputMidDstGreen;
}

- (void)setInputMidSrcGreen:(id)a3
{
}

- (NSNumber)inputMidSrcGreen
{
  return self->_inputMidSrcGreen;
}

- (void)setInputShadowDstGreen:(id)a3
{
}

- (NSNumber)inputShadowDstGreen
{
  return self->_inputShadowDstGreen;
}

- (void)setInputShadowSrcGreen:(id)a3
{
}

- (NSNumber)inputShadowSrcGreen
{
  return self->_inputShadowSrcGreen;
}

- (void)setInputBlackDstGreen:(id)a3
{
}

- (NSNumber)inputBlackDstGreen
{
  return self->_inputBlackDstGreen;
}

- (void)setInputBlackSrcGreen:(id)a3
{
}

- (NSNumber)inputBlackSrcGreen
{
  return self->_inputBlackSrcGreen;
}

- (void)setInputWhiteDstRed:(id)a3
{
}

- (NSNumber)inputWhiteDstRed
{
  return self->_inputWhiteDstRed;
}

- (void)setInputWhiteSrcRed:(id)a3
{
}

- (NSNumber)inputWhiteSrcRed
{
  return self->_inputWhiteSrcRed;
}

- (void)setInputHilightDstRed:(id)a3
{
}

- (NSNumber)inputHilightDstRed
{
  return self->_inputHilightDstRed;
}

- (void)setInputHilightSrcRed:(id)a3
{
}

- (NSNumber)inputHilightSrcRed
{
  return self->_inputHilightSrcRed;
}

- (void)setInputMidDstRed:(id)a3
{
}

- (NSNumber)inputMidDstRed
{
  return self->_inputMidDstRed;
}

- (void)setInputMidSrcRed:(id)a3
{
}

- (NSNumber)inputMidSrcRed
{
  return self->_inputMidSrcRed;
}

- (void)setInputShadowDstRed:(id)a3
{
}

- (NSNumber)inputShadowDstRed
{
  return self->_inputShadowDstRed;
}

- (void)setInputShadowSrcRed:(id)a3
{
}

- (NSNumber)inputShadowSrcRed
{
  return self->_inputShadowSrcRed;
}

- (void)setInputBlackDstRed:(id)a3
{
}

- (NSNumber)inputBlackDstRed
{
  return self->_inputBlackDstRed;
}

- (void)setInputBlackSrcRed:(id)a3
{
}

- (NSNumber)inputBlackSrcRed
{
  return self->_inputBlackSrcRed;
}

- (void)setInputWhiteDstRGB:(id)a3
{
}

- (NSNumber)inputWhiteDstRGB
{
  return self->_inputWhiteDstRGB;
}

- (void)setInputWhiteSrcRGB:(id)a3
{
}

- (NSNumber)inputWhiteSrcRGB
{
  return self->_inputWhiteSrcRGB;
}

- (void)setInputHilightDstRGB:(id)a3
{
}

- (NSNumber)inputHilightDstRGB
{
  return self->_inputHilightDstRGB;
}

- (void)setInputHilightSrcRGB:(id)a3
{
}

- (NSNumber)inputHilightSrcRGB
{
  return self->_inputHilightSrcRGB;
}

- (void)setInputMidDstRGB:(id)a3
{
}

- (NSNumber)inputMidDstRGB
{
  return self->_inputMidDstRGB;
}

- (void)setInputMidSrcRGB:(id)a3
{
}

- (NSNumber)inputMidSrcRGB
{
  return self->_inputMidSrcRGB;
}

- (void)setInputShadowDstRGB:(id)a3
{
}

- (NSNumber)inputShadowDstRGB
{
  return self->_inputShadowDstRGB;
}

- (void)setInputShadowSrcRGB:(id)a3
{
}

- (NSNumber)inputShadowSrcRGB
{
  return self->_inputShadowSrcRGB;
}

- (void)setInputBlackDstRGB:(id)a3
{
}

- (NSNumber)inputBlackDstRGB
{
  return self->_inputBlackDstRGB;
}

- (void)setInputBlackSrcRGB:(id)a3
{
}

- (NSNumber)inputBlackSrcRGB
{
  return self->_inputBlackSrcRGB;
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
  id v3 = [(PILevelsFilterHDR *)self _LUTImage];
  if (v3)
  {
    v51 = objc_msgSend(MEMORY[0x1E4F1E078], "samplerWithImage:keysAndValues:", v3, *MEMORY[0x1E4F1E558], *MEMORY[0x1E4F1E550], 0);
    v50 = [(PILevelsFilterHDR *)self P3KernelHDR];
    v49 = [MEMORY[0x1E4F1CA60] dictionary];
    double v4 = self->_inputImage;
    [MEMORY[0x1E4F7A4A0] HLGOpticalScale];
    double v6 = v5;
    unint64_t v7 = 0x1E4F7A000;
    if (v5 > 1.0)
    {
      v57[0] = @"inputRVector";
      v8 = [MEMORY[0x1E4F1E080] vectorWithX:4.92610837 / v5 Y:0.0 Z:0.0 W:0.0];
      v58[0] = v8;
      v57[1] = @"inputGVector";
      v9 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:4.92610837 / v6 Z:0.0 W:0.0];
      v58[1] = v9;
      v57[2] = @"inputBVector";
      v10 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:4.92610837 / v6 W:0.0];
      v58[2] = v10;
      v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:3];
      v12 = [(CIImage *)v4 imageByApplyingFilter:@"CIColorMatrix" withInputParameters:v11];

      v13 = [MEMORY[0x1E4F7A400] itur2100HLGColorSpace];
      v14 = [v13 linearized];
      v15 = [v14 extended];

      v16 = objc_msgSend(v12, "imageByColorMatchingWorkingSpaceToColorSpace:", objc_msgSend(v15, "CGColorSpace"));

      v55[0] = @"inputMinComponents";
      v17 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:0.0 W:0.0];
      v55[1] = @"inputMaxComponents";
      v56[0] = v17;
      v18 = [MEMORY[0x1E4F1E080] vectorWithX:4.92610837 Y:4.92610837 Z:4.92610837 W:1.0];
      v56[1] = v18;
      id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:2];
      id v20 = [v16 imageByApplyingFilter:@"CIColorClamp" withInputParameters:v19];

      objc_msgSend(v20, "imageByColorMatchingColorSpaceToWorkingSpace:", objc_msgSend(v15, "CGColorSpace"));
      double v4 = (CIImage *)objc_claimAutoreleasedReturnValue();

      unint64_t v7 = 0x1E4F7A000uLL;
    }
    v21 = [*(id *)(v7 + 1024) itur2100HLGColorSpace];
    uint64_t v22 = [v21 CGColorSpace];

    v23 = [(CIImage *)v4 imageByColorMatchingWorkingSpaceToColorSpace:v22];
    v24 = (void *)MEMORY[0x1E4F1E078];
    v25 = [v23 imageByUnpremultiplyingAlpha];
    v26 = [v24 samplerWithImage:v25];

    v27 = [v26 definition];
    [v27 extent];
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    v54[0] = v26;
    v54[1] = v51;
    v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
    v37 = objc_msgSend(v50, "applyWithExtent:roiCallback:arguments:options:", &__block_literal_global_182, v36, v49, v29, v31, v33, v35);

    v38 = [v37 imageByColorMatchingColorSpaceToWorkingSpace:v22];

    v39 = [v38 imageByPremultiplyingAlpha];

    if (v6 > 1.0)
    {
      v52[0] = @"inputRVector";
      double v40 = v6 / 4.92610837;
      v41 = [MEMORY[0x1E4F1E080] vectorWithX:v40 Y:0.0 Z:0.0 W:0.0];
      v53[0] = v41;
      v52[1] = @"inputGVector";
      v42 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:v40 Z:0.0 W:0.0];
      v53[1] = v42;
      v52[2] = @"inputBVector";
      v43 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:v40 W:0.0];
      v53[2] = v43;
      v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:3];
      uint64_t v45 = [v39 imageByApplyingFilter:@"CIColorMatrix" withInputParameters:v44];

      v39 = (void *)v45;
    }
    v46 = [MEMORY[0x1E4F7A400] workingColorSpace];
    objc_msgSend(v39, "imageByTaggingWithColorSpace:", objc_msgSend(v46, "CGColorSpace"));
    v47 = (CIImage *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v47 = self->_inputImage;
  }

  return v47;
}

double __32__PILevelsFilterHDR_outputImage__block_invoke(uint64_t a1, int a2)
{
  if (a2 == 1) {
    return 0.0;
  }
  return result;
}

- (id)_LUTImage
{
  uint64_t v174 = *MEMORY[0x1E4F143B8];
  long long v172 = xmmword_1E5D7EF30;
  v173 = @"Blue";
  id v3 = (char *)malloc_type_malloc(0x2000uLL, 0x585C5AuLL);
  char v167 = 1;
  [(PILevelsFilterHDR *)self floatValueForKey:@"inputBlackSrcRGB" defaultValue:&v167 clearIfNotDefault:0.0];
  double v5 = v4;
  [(PILevelsFilterHDR *)self floatValueForKey:@"inputShadowSrcRGB" defaultValue:&v167 clearIfNotDefault:0.25];
  uint64_t v162 = v6;
  [(PILevelsFilterHDR *)self floatValueForKey:@"inputMidSrcRGB" defaultValue:&v167 clearIfNotDefault:0.5];
  uint64_t v164 = v7;
  [(PILevelsFilterHDR *)self floatValueForKey:@"inputHilightSrcRGB" defaultValue:&v167 clearIfNotDefault:0.75];
  uint64_t v159 = v8;
  [(PILevelsFilterHDR *)self floatValueForKey:@"inputWhiteSrcRGB" defaultValue:&v167 clearIfNotDefault:1.0];
  double v10 = v9;
  [(PILevelsFilterHDR *)self floatValueForKey:@"inputBlackDstRGB" defaultValue:&v167 clearIfNotDefault:0.0];
  double v12 = v11;
  [(PILevelsFilterHDR *)self floatValueForKey:@"inputShadowDstRGB" defaultValue:&v167 clearIfNotDefault:0.25];
  double v14 = v13;
  [(PILevelsFilterHDR *)self floatValueForKey:@"inputMidDstRGB" defaultValue:&v167 clearIfNotDefault:0.5];
  double v16 = v15;
  [(PILevelsFilterHDR *)self floatValueForKey:@"inputHilightDstRGB" defaultValue:&v167 clearIfNotDefault:0.75];
  double v18 = v17;
  [(PILevelsFilterHDR *)self floatValueForKey:@"inputWhiteDstRGB" defaultValue:&v167 clearIfNotDefault:1.0];
  if (v5 == 0.0 && *(double *)&v164 == 0.0 && v10 == 0.0)
  {
    if (!v3)
    {
LABEL_33:
      v118 = 0;
      goto LABEL_34;
    }
    id v20 = v3;
LABEL_32:
    free(v20);
    goto LABEL_33;
  }
  uint64_t v21 = 0;
  double v22 = (v19 - v12) / (v10 - v5);
  double v23 = v12 - v5 * v22;
  double v24 = v16 - (v23 + *(double *)&v164 * v22);
  double v25 = *(double *)&v162 - *(double *)&v164;
  if (*(double *)&v162 - *(double *)&v164 >= 0.0) {
    double v26 = 1.0 / (*(double *)&v164 - v10);
  }
  else {
    double v26 = 1.0 / (*(double *)&v164 - v5);
  }
  double v27 = v25 * v26;
  double v28 = v27 + 1.0;
  double v29 = -((v27 * 2.0 + 3.0) * v27) * v27 + 1.0;
  if (v28 < 0.0) {
    double v29 = 0.0;
  }
  double v30 = v14 - (v23 + *(double *)&v162 * v22 + v29 * v24);
  double v31 = *(double *)&v159 - *(double *)&v164;
  if (*(double *)&v159 - *(double *)&v164 >= 0.0) {
    double v32 = 1.0 / (*(double *)&v164 - v10);
  }
  else {
    double v32 = 1.0 / (*(double *)&v164 - v5);
  }
  double v33 = v31 * v32;
  double v34 = v33 + 1.0;
  double v35 = -((v33 * 2.0 + 3.0) * v33) * v33 + 1.0;
  if (v34 < 0.0) {
    double v35 = 0.0;
  }
  float64x2_t v153 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v22, 0);
  float64x2_t v152 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v23, 0);
  int8x16_t v150 = (int8x16_t)vdupq_lane_s64(COERCE__INT64(1.0 / (*(double *)&v164 - v5)), 0);
  float64x2_t v151 = (float64x2_t)vdupq_lane_s64(v164, 0);
  float64x2_t v148 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v24, 0);
  int8x16_t v149 = (int8x16_t)vdupq_lane_s64(COERCE__INT64(1.0 / (*(double *)&v164 - v10)), 0);
  int8x16_t v146 = (int8x16_t)vdupq_lane_s64(COERCE__INT64(*(double *)&v162 - v5), 0);
  float64x2_t v147 = (float64x2_t)vdupq_lane_s64(v162, 0);
  float64x2_t v144 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v30, 0);
  int8x16_t v145 = (int8x16_t)vdupq_lane_s64(*(uint64_t *)&v25, 0);
  int8x16_t v142 = (int8x16_t)vdupq_lane_s64(*(uint64_t *)&v31, 0);
  float64x2_t v143 = (float64x2_t)vdupq_lane_s64(v159, 0);
  float64x2_t v140 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v18 - (v23 + *(double *)&v159 * v22 + v35 * v24)), 0);
  int8x16_t v141 = (int8x16_t)vdupq_lane_s64(COERCE__INT64(*(double *)&v159 - v10), 0);
  v139 = v3;
  do
  {
    id v36 = *((id *)&v172 + v21);
    v37 = [@"inputBlackSrc" stringByAppendingString:v36];
    [(PILevelsFilterHDR *)self floatValueForKey:v37 defaultValue:&v167 clearIfNotDefault:0.0];
    double v39 = v38;

    double v40 = [@"inputShadowSrc" stringByAppendingString:v36];
    [(PILevelsFilterHDR *)self floatValueForKey:v40 defaultValue:&v167 clearIfNotDefault:0.25];
    uint64_t v155 = v41;

    v42 = [@"inputMidSrc" stringByAppendingString:v36];
    [(PILevelsFilterHDR *)self floatValueForKey:v42 defaultValue:&v167 clearIfNotDefault:0.5];
    uint64_t v160 = v43;

    v44 = [@"inputHilightSrc" stringByAppendingString:v36];
    [(PILevelsFilterHDR *)self floatValueForKey:v44 defaultValue:&v167 clearIfNotDefault:0.75];
    uint64_t v154 = v45;

    v46 = [@"inputWhiteSrc" stringByAppendingString:v36];
    [(PILevelsFilterHDR *)self floatValueForKey:v46 defaultValue:&v167 clearIfNotDefault:1.0];
    double v48 = v47;

    v49 = [@"inputBlackDst" stringByAppendingString:v36];
    [(PILevelsFilterHDR *)self floatValueForKey:v49 defaultValue:&v167 clearIfNotDefault:0.0];
    double v51 = v50;

    v52 = [@"inputShadowDst" stringByAppendingString:v36];
    [(PILevelsFilterHDR *)self floatValueForKey:v52 defaultValue:&v167 clearIfNotDefault:0.25];
    double v54 = v53;

    v55 = [@"inputMidDst" stringByAppendingString:v36];
    [(PILevelsFilterHDR *)self floatValueForKey:v55 defaultValue:&v167 clearIfNotDefault:0.5];
    double v57 = v56;

    v58 = [@"inputHilightDst" stringByAppendingString:v36];
    [(PILevelsFilterHDR *)self floatValueForKey:v58 defaultValue:&v167 clearIfNotDefault:0.75];
    double v60 = v59;

    v61 = [@"inputWhiteDst" stringByAppendingString:v36];
    [(PILevelsFilterHDR *)self floatValueForKey:v61 defaultValue:&v167 clearIfNotDefault:1.0];
    double v63 = v62;

    uint64_t v64 = 0;
    double v65 = *(double *)&v154 - *(double *)&v160;
    double v66 = 1.0 / (*(double *)&v160 - v48);
    if (*(double *)&v154 - *(double *)&v160 >= 0.0) {
      double v67 = 1.0 / (*(double *)&v160 - v48);
    }
    else {
      double v67 = 1.0 / (*(double *)&v160 - v39);
    }
    double v68 = v65 * v67;
    double v69 = v68 + 1.0;
    double v70 = -((v68 * 2.0 + 3.0) * v68) * v68 + 1.0;
    if (v69 < 0.0) {
      double v70 = 0.0;
    }
    double v71 = (v63 - v51) / (v48 - v39);
    double v72 = v51 - v39 * v71;
    double v73 = v57 - (v72 + *(double *)&v160 * v71);
    double v74 = v60 - (v72 + *(double *)&v154 * v71 + v70 * v73);
    double v75 = *(double *)&v155 - *(double *)&v160;
    if (*(double *)&v155 - *(double *)&v160 >= 0.0) {
      double v76 = 1.0 / (*(double *)&v160 - v48);
    }
    else {
      double v76 = 1.0 / (*(double *)&v160 - v39);
    }
    double v77 = v75 * v76;
    double v78 = v77 + 1.0;
    double v79 = -((v77 * 2.0 + 3.0) * v77) * v77 + 1.0;
    if (v78 < 0.0) {
      double v79 = 0.0;
    }
    float64x2_t v163 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v72, 0);
    float64x2_t v165 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v71, 0);
    int8x16_t v158 = (int8x16_t)vdupq_lane_s64(COERCE__INT64(1.0 / (*(double *)&v160 - v39)), 0);
    float64x2_t v161 = (float64x2_t)vdupq_lane_s64(v160, 0);
    float64x2_t v156 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v73, 0);
    int8x16_t v157 = (int8x16_t)vdupq_lane_s64(*(uint64_t *)&v66, 0);
    float64x2_t v80 = (float64x2_t)vdupq_lane_s64(v155, 0);
    int8x16_t v81 = (int8x16_t)vdupq_lane_s64(COERCE__INT64(*(double *)&v155 - v39), 0);
    int8x16_t v82 = (int8x16_t)vdupq_lane_s64(*(uint64_t *)&v75, 0);
    float64x2_t v83 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v54 - (v72 + *(double *)&v155 * v71 + v79 * v73)), 0);
    float64x2_t v84 = (float64x2_t)vdupq_lane_s64(v154, 0);
    int8x16_t v85 = (int8x16_t)vdupq_lane_s64(*(uint64_t *)&v65, 0);
    int8x16_t v86 = (int8x16_t)vdupq_lane_s64(COERCE__INT64(*(double *)&v154 - v48), 0);
    float64x2_t v87 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v74, 0);
    int64x2_t v88 = (int64x2_t)xmmword_1A980B8B0;
    do
    {
      float64x2_t v89 = vmulq_f64(vcvtq_f64_s64(v88), (float64x2_t)vdupq_n_s64(0x3F50000000000000uLL));
      float64x2_t v90 = vsubq_f64(v89, v151);
      float64x2_t v91 = vmulq_f64(v90, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v90), v150, v149));
      __asm { FMOV            V23.2D, #1.0 }
      float64x2_t v97 = vaddq_f64(v91, _Q23);
      __asm
      {
        FMOV            V24.2D, #2.0
        FMOV            V25.2D, #3.0
      }
      int8x16_t v100 = (int8x16_t)vmlaq_f64(_Q23, v91, vmulq_f64(v91, vnegq_f64(vmlaq_f64(_Q25, _Q24, v91))));
      float64x2_t v101 = vsubq_f64(v89, v147);
      float64x2_t v102 = vmulq_f64(v101, vdivq_f64(_Q23, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v101), v146, v145)));
      float64x2_t v103 = vmlaq_f64(vmlaq_f64(v152, v153, v89), v148, (float64x2_t)vbicq_s8(v100, (int8x16_t)vcltzq_f64(v97)));
      float64x2_t v104 = vsubq_f64(v89, v143);
      float64x2_t v105 = vmulq_f64(v104, vdivq_f64(_Q23, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v104), v142, v141)));
      float64x2_t v106 = vmlaq_f64(vmlaq_f64(v103, v144, (float64x2_t)vbicq_s8((int8x16_t)vmlaq_f64(_Q23, v102, vmulq_f64(v102, vnegq_f64(vmlaq_f64(_Q25, _Q24, v102)))), (int8x16_t)vcltzq_f64(vaddq_f64(v102, _Q23)))), v140, (float64x2_t)vbicq_s8((int8x16_t)vmlaq_f64(_Q23, v105, vmulq_f64(v105, vnegq_f64(vmlaq_f64(_Q25, _Q24, v105)))), (int8x16_t)vcltzq_f64(vaddq_f64(v105, _Q23))));
      float64x2_t v107 = vsubq_f64(v106, v161);
      float64x2_t v108 = vmulq_f64(v107, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v107), v158, v157));
      float64x2_t v109 = vsubq_f64(v106, v80);
      float64x2_t v110 = vmulq_f64(v109, vdivq_f64(_Q23, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v109), v81, v82)));
      float64x2_t v111 = vmlaq_f64(vmlaq_f64(v163, v165, v106), v156, (float64x2_t)vbicq_s8((int8x16_t)vmlaq_f64(_Q23, v108, vmulq_f64(v108, vnegq_f64(vmlaq_f64(_Q25, _Q24, v108)))), (int8x16_t)vcltzq_f64(vaddq_f64(v108, _Q23))));
      float64x2_t v112 = vsubq_f64(v106, v84);
      float64x2_t v113 = vmulq_f64(v112, vdivq_f64(_Q23, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v112), v85, v86)));
      float64x2_t v114 = vmlaq_f64(vmlaq_f64(v111, v83, (float64x2_t)vbicq_s8((int8x16_t)vmlaq_f64(_Q23, v110, vmulq_f64(v110, vnegq_f64(vmlaq_f64(_Q25, _Q24, v110)))), (int8x16_t)vcltzq_f64(vaddq_f64(v110, _Q23)))), v87, (float64x2_t)vbicq_s8((int8x16_t)vmlaq_f64(_Q23, v113, vmulq_f64(v113, vnegq_f64(vmlaq_f64(_Q25, _Q24, v113)))), (int8x16_t)vcltzq_f64(vaddq_f64(v113, _Q23))));
      float64x2_t v115 = (float64x2_t)vbicq_s8((int8x16_t)v114, (int8x16_t)vcltzq_f64(v114));
      float64x2_t v116 = (float64x2_t)vdupq_n_s64(0x40EFFFE000000000uLL);
      *(int32x2_t *)&_Q23.f64[0] = vmovn_s64(vcvtq_s64_f64((float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v115, _Q23), (int8x16_t)v116, (int8x16_t)vmulq_f64(v115, v116))));
      int64x2_t v88 = vaddq_s64(v88, vdupq_n_s64(2uLL));
      v117 = &v3[v64];
      *(_WORD *)v117 = LOWORD(_Q23.f64[0]);
      *((_WORD *)v117 + 4) = WORD2(_Q23.f64[0]);
      v64 += 16;
    }
    while (v64 != 0x2000);

    ++v21;
    v3 += 2;
  }
  while (v21 != 3);
  if (v167)
  {
    id v20 = v139;
    goto LABEL_32;
  }
  for (uint64_t i = 6; i != 8198; i += 8)
    *(_WORD *)&v139[i] = 0x7FFF;
  dest.data = v139;
  *(_OWORD *)&dest.height = xmmword_1A980B8C0;
  dest.rowBytes = 0x2000;
  vImage_Error v122 = vImageConvert_16Uto16F(&dest, &dest, 0);
  if (!v122)
  {
    v123 = (void *)MEMORY[0x1E4F1E050];
    v124 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v139 length:0x2000 freeWhenDone:1];
    v118 = objc_msgSend(v123, "imageWithBitmapData:bytesPerRow:size:format:colorSpace:", v124, 0x2000, *MEMORY[0x1E4F1E300], 0, 1024.0, 1.0);

LABEL_34:
    for (uint64_t j = 16; j != -8; j -= 8)

    return v118;
  }
  vImage_Error v125 = v122;
  v126 = NUAssertLogger_1960();
  if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
  {
    v127 = objc_msgSend(NSString, "stringWithFormat:", @"Failed converting data to RGBAh: %ld", v125);
    *(_DWORD *)buf = 138543362;
    v169 = v127;
    _os_log_error_impl(&dword_1A9680000, v126, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
  }
  v128 = (const void **)MEMORY[0x1E4F7A308];
  specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
  v130 = NUAssertLogger_1960();
  BOOL v131 = os_log_type_enabled(v130, OS_LOG_TYPE_ERROR);
  if (specific)
  {
    if (v131)
    {
      v134 = dispatch_get_specific(*v128);
      v135 = (void *)MEMORY[0x1E4F29060];
      id v136 = v134;
      v137 = [v135 callStackSymbols];
      v138 = [v137 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v169 = v134;
      __int16 v170 = 2114;
      v171 = v138;
      _os_log_error_impl(&dword_1A9680000, v130, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
  }
  else if (v131)
  {
    v132 = [MEMORY[0x1E4F29060] callStackSymbols];
    v133 = [v132 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v169 = v133;
    _os_log_error_impl(&dword_1A9680000, v130, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
  }
  _NUAssertFailHandler();
  return NUAssertLogger_1960();
}

- (double)floatValueForKey:(id)a3 defaultValue:(double)a4 clearIfNotDefault:(BOOL *)a5
{
  uint64_t v7 = [(PILevelsFilterHDR *)self valueForKey:a3];
  uint64_t v8 = v7;
  double v9 = a4;
  if (v7)
  {
    [v7 floatValue];
    double v9 = v10;
  }
  if (v9 != a4) {
    *a5 = 0;
  }

  return v9;
}

- (void)setDefaults
{
  uint64_t v3 = 0;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v27 = xmmword_1E5D7EF10;
  long long v28 = *(_OWORD *)&off_1E5D7EF20;
  do
  {
    double v4 = NSNumber;
    id v5 = *(id *)((char *)&v27 + v3);
    uint64_t v6 = objc_msgSend(v4, "numberWithDouble:", 0.0, v27, v28);
    uint64_t v7 = [@"inputBlackSrc" stringByAppendingString:v5];
    [(PILevelsFilterHDR *)self setValue:v6 forKey:v7];

    uint64_t v8 = [NSNumber numberWithDouble:0.0];
    double v9 = [@"inputBlackDst" stringByAppendingString:v5];
    [(PILevelsFilterHDR *)self setValue:v8 forKey:v9];

    float v10 = [NSNumber numberWithDouble:0.25];
    double v11 = [@"inputShadowSrc" stringByAppendingString:v5];
    [(PILevelsFilterHDR *)self setValue:v10 forKey:v11];

    double v12 = [NSNumber numberWithDouble:0.25];
    double v13 = [@"inputShadowDst" stringByAppendingString:v5];
    [(PILevelsFilterHDR *)self setValue:v12 forKey:v13];

    double v14 = [NSNumber numberWithDouble:0.5];
    double v15 = [@"inputMidSrc" stringByAppendingString:v5];
    [(PILevelsFilterHDR *)self setValue:v14 forKey:v15];

    double v16 = [NSNumber numberWithDouble:0.5];
    double v17 = [@"inputMidDst" stringByAppendingString:v5];
    [(PILevelsFilterHDR *)self setValue:v16 forKey:v17];

    double v18 = [NSNumber numberWithDouble:0.75];
    double v19 = [@"inputHilightSrc" stringByAppendingString:v5];
    [(PILevelsFilterHDR *)self setValue:v18 forKey:v19];

    id v20 = [NSNumber numberWithDouble:0.75];
    uint64_t v21 = [@"inputHilightDst" stringByAppendingString:v5];
    [(PILevelsFilterHDR *)self setValue:v20 forKey:v21];

    double v22 = [NSNumber numberWithDouble:1.0];
    double v23 = [@"inputWhiteSrc" stringByAppendingString:v5];
    [(PILevelsFilterHDR *)self setValue:v22 forKey:v23];

    double v24 = [NSNumber numberWithDouble:1.0];
    double v25 = [@"inputWhiteDst" stringByAppendingString:v5];

    [(PILevelsFilterHDR *)self setValue:v24 forKey:v25];
    v3 += 8;
  }
  while (v3 != 32);
  for (uint64_t i = 24; i != -8; i -= 8)
}

- (id)P3KernelHDR
{
  if (P3KernelHDR_once != -1) {
    dispatch_once(&P3KernelHDR_once, &__block_literal_global_1973);
  }
  v2 = (void *)P3KernelHDR_singleton;
  return v2;
}

uint64_t __32__PILevelsFilterHDR_P3KernelHDR__block_invoke()
{
  P3KernelHDR_singleton = [MEMORY[0x1E4F1E058] kernelWithString:@"kernel vec4 levelsHDR (sampler src, sampler LUT) { vec4 p,r vec2 c1,c2; float f; p = sample(src, samplerCoord(src)); vec3 neg = min(p.rgb, 0.0); vec3 pos = max(p.rgb, 1.0)-1.0; p.rgb = clamp(p.rgb, 0.0, 1.0); f = p.r * 1024; c1 = vec2(floor(f)+0.5, 0.5); c2 = vec2(ceil(f)+0.5, 0.5); r = mix(sample(LUT,samplerTransform(LUT,c1)), sample(LUT,samplerTransform(LUT,c2)), fract(f)); p.r = r.r; f = p.g * 1024; c1 = vec2(floor(f)+0.5, 0.5); c2 = vec2(ceil(f)+0.5, 0.5); r = mix(sample(LUT,samplerTransform(LUT,c1)), sample(LUT,samplerTransform(LUT,c2)), fract(f)); p.g = r.g; f = p.b * 1024; c1 = vec2(floor(f)+0.5, 0.5); c2 = vec2(ceil(f)+0.5, 0.5); r = mix(sample(LUT,samplerTransform(LUT,c1)), sample(LUT,samplerTransform(LUT,c2)), fract(f)); p.b = r.b; p.rgb = max(p.rgb, 0.0); p.rgb = p.rgb + pos + neg; return p; }"];;
  return MEMORY[0x1F41817F8]();
}

@end