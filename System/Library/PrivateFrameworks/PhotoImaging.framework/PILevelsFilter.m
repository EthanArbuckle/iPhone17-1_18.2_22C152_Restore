@interface PILevelsFilter
+ (id)P3Kernel;
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

@implementation PILevelsFilter

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
  v4 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F1E0D8], &unk_1F000A7C8, *MEMORY[0x1E4F1E0D0], &unk_1F000A7B8, *MEMORY[0x1E4F1E0E8], &unk_1F000A7C8, *MEMORY[0x1E4F1E0E0], v3, *MEMORY[0x1E4F1E098], v3, *MEMORY[0x1E4F1E0C8], *MEMORY[0x1E4F1E158], *MEMORY[0x1E4F1E0F0], 0);

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

+ (id)P3Kernel
{
  if (P3Kernel_onceToken != -1) {
    dispatch_once(&P3Kernel_onceToken, &__block_literal_global_22075);
  }
  v2 = (void *)P3Kernel_P3Kernel;
  return v2;
}

uint64_t __26__PILevelsFilter_P3Kernel__block_invoke()
{
  P3Kernel_P3Kernel = [MEMORY[0x1E4F1E058] kernelWithString:@"kernel vec4 levelsNewGammaForP3 (sampler src, sampler LUT)\n{\nvec4\tp,r\nvec2\tc1,c2;\nfloat\tf;\np  = sample(src, samplerCoord(src));\nvec3 neg = min(p.rgb, 0.0);\nvec3 pos = max(p.rgb, 1.0)-1.0;\np.rgb = clamp(p.rgb, 0.0, 1.0);\nf = p.r * 255.0 + 256.0;\nc1 = vec2(floor(f)+0.5, 0.5);\nc2 = vec2(ceil(f)+0.5, 0.5);\nr = mix(sample(LUT,samplerTransform(LUT,c1)), sample(LUT,samplerTransform(LUT,c2)), fract(f));\np.r = r.r * 4.0 - 1.0;\nf = p.g * 255.0 + 256.0;\nc1 = vec2(floor(f)+0.5, 0.5);\nc2 = vec2(ceil(f)+0.5, 0.5);\nr = mix(sample(LUT,samplerTransform(LUT,c1)), sample(LUT,samplerTransform(LUT,c2)), fract(f));\np.g = r.g * 4.0 - 1.0;\nf = p.b * 255.0 + 256.0;\nc1 = vec2(floor(f)+0.5, 0.5);\nc2 = vec2(ceil(f)+0.5, 0.5);\nr = mix(sample(LUT,samplerTransform(LUT,c1)), sample(LUT,samplerTransform(LUT,c2)), fract(f));\np.b = r.b * 4.0 - 1.0;\np.rgb = max(p.rgb, 0.0);\np.rgb = p.rgb + pos + neg;\nreturn p;\n}\n\n"];;
  return MEMORY[0x1F41817F8]();
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
  v26[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(PILevelsFilter *)self _LUTImage];
  if (v3)
  {
    double v4 = objc_msgSend(MEMORY[0x1E4F1E078], "samplerWithImage:keysAndValues:", v3, *MEMORY[0x1E4F1E558], *MEMORY[0x1E4F1E550], 0);
    v5 = [(id)objc_opt_class() P3Kernel];
    v6 = [MEMORY[0x1E4F1CA60] dictionary];
    v7 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBC8]);
    v8 = [(CIImage *)self->_inputImage imageByColorMatchingWorkingSpaceToColorSpace:v7];
    v9 = (void *)MEMORY[0x1E4F1E078];
    v10 = [v8 imageByUnpremultiplyingAlpha];
    v11 = [v9 samplerWithImage:v10];

    v12 = [v11 definition];
    [v12 extent];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    v26[0] = v11;
    v26[1] = v4;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    v22 = objc_msgSend(v5, "applyWithExtent:roiCallback:arguments:options:", &__block_literal_global_182_22294, v21, v6, v14, v16, v18, v20);

    v23 = [v22 imageByColorMatchingColorSpaceToWorkingSpace:v7];

    CGColorSpaceRelease(v7);
    v24 = [v23 imageByPremultiplyingAlpha];
  }
  else
  {
    v24 = self->_inputImage;
  }

  return v24;
}

double __29__PILevelsFilter_outputImage__block_invoke(uint64_t a1, int a2)
{
  if (a2 == 1) {
    return 0.0;
  }
  return result;
}

- (id)_LUTImage
{
  uint64_t v182 = *MEMORY[0x1E4F143B8];
  long long v180 = xmmword_1E5D80C08;
  v181 = @"Blue";
  id v3 = (char *)malloc_type_malloc(0x2000uLL, 0x6B09AF81uLL);
  char v175 = 1;
  [(PILevelsFilter *)self floatValueForKey:@"inputBlackSrcRGB" defaultValue:&v175 clearIfNotDefault:0.0];
  double v5 = v4;
  [(PILevelsFilter *)self floatValueForKey:@"inputShadowSrcRGB" defaultValue:&v175 clearIfNotDefault:0.25];
  uint64_t v167 = v6;
  [(PILevelsFilter *)self floatValueForKey:@"inputMidSrcRGB" defaultValue:&v175 clearIfNotDefault:0.5];
  uint64_t v171 = v7;
  [(PILevelsFilter *)self floatValueForKey:@"inputHilightSrcRGB" defaultValue:&v175 clearIfNotDefault:0.75];
  uint64_t __x = v8;
  [(PILevelsFilter *)self floatValueForKey:@"inputWhiteSrcRGB" defaultValue:&v175 clearIfNotDefault:1.0];
  double v10 = v9;
  [(PILevelsFilter *)self floatValueForKey:@"inputBlackDstRGB" defaultValue:&v175 clearIfNotDefault:0.0];
  double v12 = v11;
  [(PILevelsFilter *)self floatValueForKey:@"inputShadowDstRGB" defaultValue:&v175 clearIfNotDefault:0.25];
  double v14 = v13;
  [(PILevelsFilter *)self floatValueForKey:@"inputMidDstRGB" defaultValue:&v175 clearIfNotDefault:0.5];
  double v16 = v15;
  [(PILevelsFilter *)self floatValueForKey:@"inputHilightDstRGB" defaultValue:&v175 clearIfNotDefault:0.75];
  double v18 = v17;
  [(PILevelsFilter *)self floatValueForKey:@"inputWhiteDstRGB" defaultValue:&v175 clearIfNotDefault:1.0];
  if (v5 == 0.0 && *(double *)&v171 == 0.0 && v10 == 0.0)
  {
    if (!v3) {
      goto LABEL_37;
    }
    double v20 = v3;
    goto LABEL_32;
  }
  uint64_t v21 = 0;
  double v22 = (v19 - v12) / (v10 - v5);
  double v23 = v12 - v5 * v22;
  double v24 = v16 - (v23 + *(double *)&v171 * v22);
  double v25 = *(double *)&v167 - *(double *)&v171;
  if (*(double *)&v167 - *(double *)&v171 >= 0.0) {
    double v26 = 1.0 / (*(double *)&v171 - v10);
  }
  else {
    double v26 = 1.0 / (*(double *)&v171 - v5);
  }
  double v27 = v25 * v26;
  double v28 = v27 + 1.0;
  double v29 = -((v27 * 2.0 + 3.0) * v27) * v27 + 1.0;
  if (v28 < 0.0) {
    double v29 = 0.0;
  }
  double v30 = v14 - (v23 + *(double *)&v167 * v22 + v29 * v24);
  double v31 = *(double *)&__x - *(double *)&v171;
  if (*(double *)&__x - *(double *)&v171 >= 0.0) {
    double v32 = 1.0 / (*(double *)&v171 - v10);
  }
  else {
    double v32 = 1.0 / (*(double *)&v171 - v5);
  }
  double v33 = v31 * v32;
  double v34 = v33 + 1.0;
  double v35 = -((v33 * 2.0 + 3.0) * v33) * v33 + 1.0;
  if (v34 < 0.0) {
    double v35 = 0.0;
  }
  float64x2_t v145 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v22, 0);
  float64x2_t v144 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v23, 0);
  int8x16_t v142 = (int8x16_t)vdupq_lane_s64(COERCE__INT64(1.0 / (*(double *)&v171 - v5)), 0);
  float64x2_t v143 = (float64x2_t)vdupq_lane_s64(v171, 0);
  float64x2_t v140 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v24, 0);
  int8x16_t v141 = (int8x16_t)vdupq_lane_s64(COERCE__INT64(1.0 / (*(double *)&v171 - v10)), 0);
  int8x16_t v138 = (int8x16_t)vdupq_lane_s64(COERCE__INT64(*(double *)&v167 - v5), 0);
  float64x2_t v139 = (float64x2_t)vdupq_lane_s64(v167, 0);
  float64x2_t v136 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v30, 0);
  int8x16_t v137 = (int8x16_t)vdupq_lane_s64(*(uint64_t *)&v25, 0);
  int8x16_t v134 = (int8x16_t)vdupq_lane_s64(*(uint64_t *)&v31, 0);
  float64x2_t v135 = (float64x2_t)vdupq_lane_s64(__x, 0);
  float64x2_t v132 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v18 - (v23 + *(double *)&__x * v22 + v35 * v24)), 0);
  int8x16_t v133 = (int8x16_t)vdupq_lane_s64(COERCE__INT64(*(double *)&__x - v10), 0);
  v131 = v3;
  do
  {
    id v36 = *((id *)&v180 + v21);
    v37 = [@"inputBlackSrc" stringByAppendingString:v36];
    [(PILevelsFilter *)self floatValueForKey:v37 defaultValue:&v175 clearIfNotDefault:0.0];
    double v39 = v38;

    v40 = [@"inputShadowSrc" stringByAppendingString:v36];
    [(PILevelsFilter *)self floatValueForKey:v40 defaultValue:&v175 clearIfNotDefault:0.25];
    uint64_t v172 = v41;

    v42 = [@"inputMidSrc" stringByAppendingString:v36];
    [(PILevelsFilter *)self floatValueForKey:v42 defaultValue:&v175 clearIfNotDefault:0.5];
    uint64_t v168 = v43;

    v44 = [@"inputHilightSrc" stringByAppendingString:v36];
    [(PILevelsFilter *)self floatValueForKey:v44 defaultValue:&v175 clearIfNotDefault:0.75];
    uint64_t __xa = v45;

    v46 = [@"inputWhiteSrc" stringByAppendingString:v36];
    [(PILevelsFilter *)self floatValueForKey:v46 defaultValue:&v175 clearIfNotDefault:1.0];
    double v48 = v47;

    v49 = [@"inputBlackDst" stringByAppendingString:v36];
    [(PILevelsFilter *)self floatValueForKey:v49 defaultValue:&v175 clearIfNotDefault:0.0];
    double v51 = v50;

    v52 = [@"inputShadowDst" stringByAppendingString:v36];
    [(PILevelsFilter *)self floatValueForKey:v52 defaultValue:&v175 clearIfNotDefault:0.25];
    double v161 = v53;

    v54 = [@"inputMidDst" stringByAppendingString:v36];
    [(PILevelsFilter *)self floatValueForKey:v54 defaultValue:&v175 clearIfNotDefault:0.5];
    double v56 = v55;

    v57 = [@"inputHilightDst" stringByAppendingString:v36];
    [(PILevelsFilter *)self floatValueForKey:v57 defaultValue:&v175 clearIfNotDefault:0.75];
    double v59 = v58;

    v60 = [@"inputWhiteDst" stringByAppendingString:v36];
    [(PILevelsFilter *)self floatValueForKey:v60 defaultValue:&v175 clearIfNotDefault:1.0];
    double v62 = v61;

    uint64_t v63 = 0;
    double v64 = *(double *)&__xa - *(double *)&v168;
    if (*(double *)&__xa - *(double *)&v168 >= 0.0) {
      double v65 = 1.0 / (*(double *)&v168 - v48);
    }
    else {
      double v65 = 1.0 / (*(double *)&v168 - v39);
    }
    double v66 = v64 * v65;
    double v67 = v66 + 1.0;
    double v68 = -((v66 * 2.0 + 3.0) * v66) * v66 + 1.0;
    if (v67 < 0.0) {
      double v68 = 0.0;
    }
    double v69 = (v62 - v51) / (v48 - v39);
    double v70 = v51 - v39 * v69;
    double v71 = v56 - (v70 + *(double *)&v168 * v69);
    double v72 = v59 - (v70 + *(double *)&__xa * v69 + v68 * v71);
    double v73 = *(double *)&v172 - *(double *)&v168;
    if (*(double *)&v172 - *(double *)&v168 >= 0.0) {
      double v74 = 1.0 / (*(double *)&v168 - v48);
    }
    else {
      double v74 = 1.0 / (*(double *)&v168 - v39);
    }
    double v75 = v73 * v74;
    double v76 = v75 + 1.0;
    double v77 = -((v75 * 2.0 + 3.0) * v75) * v75 + 1.0;
    if (v76 < 0.0) {
      double v77 = 0.0;
    }
    float64x2_t v159 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v69, 0);
    float64x2_t v158 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v70, 0);
    int8x16_t v156 = (int8x16_t)vdupq_lane_s64(COERCE__INT64(1.0 / (*(double *)&v168 - v39)), 0);
    float64x2_t v157 = (float64x2_t)vdupq_lane_s64(v168, 0);
    float64x2_t v154 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v71, 0);
    int8x16_t v155 = (int8x16_t)vdupq_lane_s64(COERCE__INT64(1.0 / (*(double *)&v168 - v48)), 0);
    int8x16_t v152 = (int8x16_t)vdupq_lane_s64(COERCE__INT64(*(double *)&v172 - v39), 0);
    float64x2_t v153 = (float64x2_t)vdupq_lane_s64(v172, 0);
    float64x2_t v150 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v161 - (v70 + *(double *)&v172 * v69 + v77 * v71)), 0);
    int8x16_t v151 = (int8x16_t)vdupq_lane_s64(*(uint64_t *)&v73, 0);
    int8x16_t v148 = (int8x16_t)vdupq_lane_s64(*(uint64_t *)&v64, 0);
    float64x2_t v149 = (float64x2_t)vdupq_lane_s64(__xa, 0);
    float64x2_t v146 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v72, 0);
    int8x16_t v147 = (int8x16_t)vdupq_lane_s64(COERCE__INT64(*(double *)&__xa - v48), 0);
    int64x2_t v78 = (int64x2_t)xmmword_1A980B8B0;
    do
    {
      int64x2_t v173 = v78;
      float64x2_t __xb = vdivq_f64(vaddq_f64(vcvtq_f64_s64(v78), (float64x2_t)vdupq_n_s64(0xC070000000000000)), (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL));
      long double v169 = pow(__xb.f64[1], 0.454545438);
      v79.f64[0] = pow(__xb.f64[0], 0.454545438);
      v79.f64[1] = v169;
      float64x2_t v80 = vsubq_f64(v79, v143);
      float64x2_t v81 = vmulq_f64(v80, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v80), v142, v141));
      __asm
      {
        FMOV            V7.2D, #1.0
        FMOV            V2.2D, #2.0
        FMOV            V5.2D, #3.0
      }
      float64x2_t v89 = vmlaq_f64(vmlaq_f64(v144, v145, v79), v140, (float64x2_t)vbicq_s8((int8x16_t)vmlaq_f64(_Q7, v81, vmulq_f64(v81, vnegq_f64(vmlaq_f64(_Q5, _Q2, v81)))), (int8x16_t)vcltzq_f64(vaddq_f64(v81, _Q7))));
      float64x2_t v90 = vsubq_f64(v79, v139);
      float64x2_t v91 = _Q7;
      float64x2_t __xc = _Q7;
      float64x2_t v92 = vmulq_f64(v90, vdivq_f64(_Q7, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v90), v138, v137)));
      float64x2_t v93 = vsubq_f64(v79, v135);
      float64x2_t v94 = vmulq_f64(v93, vdivq_f64(_Q7, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v93), v134, v133)));
      float64x2_t v95 = vmlaq_f64(vmlaq_f64(v89, v136, (float64x2_t)vbicq_s8((int8x16_t)vmlaq_f64(_Q7, v92, vmulq_f64(v92, vnegq_f64(vmlaq_f64(_Q5, _Q2, v92)))), (int8x16_t)vcltzq_f64(vaddq_f64(v92, _Q7)))), v132, (float64x2_t)vbicq_s8((int8x16_t)vmlaq_f64(_Q7, v94, vmulq_f64(v94, vnegq_f64(vmlaq_f64(_Q5, _Q2, v94)))), (int8x16_t)vcltzq_f64(vaddq_f64(v94, _Q7))));
      float64x2_t v96 = vsubq_f64(v95, v157);
      float64x2_t v97 = vmulq_f64(v96, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v96), v156, v155));
      float64x2_t v98 = vmlaq_f64(vmlaq_f64(v158, v159, v95), v154, (float64x2_t)vbicq_s8((int8x16_t)vmlaq_f64(v91, v97, vmulq_f64(v97, vnegq_f64(vmlaq_f64(_Q5, _Q2, v97)))), (int8x16_t)vcltzq_f64(vaddq_f64(v97, v91))));
      float64x2_t v99 = vsubq_f64(v95, v153);
      float64x2_t v100 = vmulq_f64(v99, vdivq_f64(v91, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v99), v152, v151)));
      float64x2_t v170 = _Q5;
      float64x2_t v101 = vmlaq_f64(v98, v150, (float64x2_t)vbicq_s8((int8x16_t)vmlaq_f64(v91, v100, vmulq_f64(v100, vnegq_f64(vmlaq_f64(_Q5, _Q2, v100)))), (int8x16_t)vcltzq_f64(vaddq_f64(v100, v91))));
      float64x2_t v102 = vsubq_f64(v95, v149);
      float64x2_t v103 = vmulq_f64(v102, vdivq_f64(v91, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v102), v148, v147)));
      float64x2_t v160 = vmlaq_f64(v101, v146, (float64x2_t)vbicq_s8((int8x16_t)vmlaq_f64(v91, v103, vmulq_f64(v103, vnegq_f64(vmlaq_f64(_Q5, _Q2, v103)))), (int8x16_t)vcltzq_f64(vaddq_f64(v103, v91))));
      long double v162 = pow(v160.f64[1], 2.20000005);
      v104.f64[0] = pow(v160.f64[0], 2.20000005);
      v104.f64[1] = v162;
      __asm { FMOV            V1.2D, #-1.0 }
      float64x2_t v106 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(_Q1, v104), (int8x16_t)_Q1, (int8x16_t)v104);
      __asm { FMOV            V2.2D, #0.25 }
      float64x2_t v108 = vmulq_f64(vaddq_f64(v106, __xc), _Q2);
      float64x2_t v109 = (float64x2_t)vdupq_n_s64(0x40EFFFE000000000uLL);
      *(int32x2_t *)&v106.f64[0] = vmovn_s64(vcvtq_s64_f64((float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v106, v170), (int8x16_t)v109, (int8x16_t)vmulq_f64(v108, v109))));
      v110 = &v3[v63];
      *(_WORD *)v110 = LOWORD(v106.f64[0]);
      *((_WORD *)v110 + 4) = WORD2(v106.f64[0]);
      int64x2_t v78 = vaddq_s64(v173, vdupq_n_s64(2uLL));
      v63 += 16;
    }
    while (v63 != 0x2000);

    ++v21;
    v3 += 2;
  }
  while (v21 != 3);
  if (v175)
  {
    double v20 = v131;
LABEL_32:
    free(v20);
    id v3 = 0;
    goto LABEL_37;
  }
  for (uint64_t i = 6; i != 8198; i += 8)
    *(_WORD *)&v131[i] = 0x7FFF;
  dest.data = v131;
  *(_OWORD *)&dest.height = xmmword_1A980B8C0;
  dest.rowBytes = 0x2000;
  vImage_Error v112 = vImageConvert_16Uto16F(&dest, &dest, 0);
  if (!v112)
  {
    v113 = (void *)MEMORY[0x1E4F1E050];
    v114 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v131 length:0x2000 freeWhenDone:1];
    objc_msgSend(v113, "imageWithBitmapData:bytesPerRow:size:format:colorSpace:", v114, 0x2000, *MEMORY[0x1E4F1E300], 0, 1024.0, 1.0);
    id v3 = (char *)objc_claimAutoreleasedReturnValue();

LABEL_37:
    for (uint64_t j = 16; j != -8; j -= 8)

    return v3;
  }
  vImage_Error v117 = v112;
  v118 = NUAssertLogger_22297();
  if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
  {
    v119 = objc_msgSend(NSString, "stringWithFormat:", @"Failed converting data to RGBAh: %ld", v117);
    *(_DWORD *)buf = 138543362;
    v177 = v119;
    _os_log_error_impl(&dword_1A9680000, v118, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
  }
  v120 = (const void **)MEMORY[0x1E4F7A308];
  specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
  v122 = NUAssertLogger_22297();
  BOOL v123 = os_log_type_enabled(v122, OS_LOG_TYPE_ERROR);
  if (specific)
  {
    if (v123)
    {
      v126 = dispatch_get_specific(*v120);
      v127 = (void *)MEMORY[0x1E4F29060];
      id v128 = v126;
      v129 = [v127 callStackSymbols];
      v130 = [v129 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v177 = v126;
      __int16 v178 = 2114;
      v179 = v130;
      _os_log_error_impl(&dword_1A9680000, v122, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
  }
  else if (v123)
  {
    v124 = [MEMORY[0x1E4F29060] callStackSymbols];
    v125 = [v124 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v177 = v125;
    _os_log_error_impl(&dword_1A9680000, v122, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
  }
  _NUAssertFailHandler();
  return NUAssertLogger_22297();
}

- (double)floatValueForKey:(id)a3 defaultValue:(double)a4 clearIfNotDefault:(BOOL *)a5
{
  uint64_t v7 = [(PILevelsFilter *)self valueForKey:a3];
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
  long long v27 = xmmword_1E5D80BE8;
  long long v28 = *(_OWORD *)&off_1E5D80BF8;
  do
  {
    double v4 = NSNumber;
    id v5 = *(id *)((char *)&v27 + v3);
    uint64_t v6 = objc_msgSend(v4, "numberWithDouble:", 0.0, v27, v28);
    uint64_t v7 = [@"inputBlackSrc" stringByAppendingString:v5];
    [(PILevelsFilter *)self setValue:v6 forKey:v7];

    uint64_t v8 = [NSNumber numberWithDouble:0.0];
    double v9 = [@"inputBlackDst" stringByAppendingString:v5];
    [(PILevelsFilter *)self setValue:v8 forKey:v9];

    float v10 = [NSNumber numberWithDouble:0.25];
    double v11 = [@"inputShadowSrc" stringByAppendingString:v5];
    [(PILevelsFilter *)self setValue:v10 forKey:v11];

    double v12 = [NSNumber numberWithDouble:0.25];
    double v13 = [@"inputShadowDst" stringByAppendingString:v5];
    [(PILevelsFilter *)self setValue:v12 forKey:v13];

    double v14 = [NSNumber numberWithDouble:0.5];
    double v15 = [@"inputMidSrc" stringByAppendingString:v5];
    [(PILevelsFilter *)self setValue:v14 forKey:v15];

    double v16 = [NSNumber numberWithDouble:0.5];
    double v17 = [@"inputMidDst" stringByAppendingString:v5];
    [(PILevelsFilter *)self setValue:v16 forKey:v17];

    double v18 = [NSNumber numberWithDouble:0.75];
    double v19 = [@"inputHilightSrc" stringByAppendingString:v5];
    [(PILevelsFilter *)self setValue:v18 forKey:v19];

    double v20 = [NSNumber numberWithDouble:0.75];
    uint64_t v21 = [@"inputHilightDst" stringByAppendingString:v5];
    [(PILevelsFilter *)self setValue:v20 forKey:v21];

    double v22 = [NSNumber numberWithDouble:1.0];
    double v23 = [@"inputWhiteSrc" stringByAppendingString:v5];
    [(PILevelsFilter *)self setValue:v22 forKey:v23];

    double v24 = [NSNumber numberWithDouble:1.0];
    double v25 = [@"inputWhiteDst" stringByAppendingString:v5];

    [(PILevelsFilter *)self setValue:v24 forKey:v25];
    v3 += 8;
  }
  while (v3 != 32);
  for (uint64_t i = 24; i != -8; i -= 8)
}

@end