@interface PIDepthEffectFilter
- (CIImage)inputBlurMap;
- (CIImage)inputGainMap;
- (CIImage)inputImage;
- (CIImage)inputMatte;
- (NSNumber)inputAperture;
- (NSNumber)inputBestHairQuality;
- (NSNumber)inputGainMapIsLinear;
- (NSNumber)inputLumaNoiseScale;
- (NSNumber)inputScale;
- (id)inputDepthMetadata;
- (id)inputGainMapMetadata;
- (id)inputShape;
- (id)outputImage;
- (void)setInputAperture:(id)a3;
- (void)setInputBestHairQuality:(id)a3;
- (void)setInputBlurMap:(id)a3;
- (void)setInputDepthMetadata:(id)a3;
- (void)setInputGainMap:(id)a3;
- (void)setInputGainMapIsLinear:(id)a3;
- (void)setInputGainMapMetadata:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputLumaNoiseScale:(id)a3;
- (void)setInputMatte:(id)a3;
- (void)setInputScale:(id)a3;
- (void)setInputShape:(id)a3;
@end

@implementation PIDepthEffectFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputBestHairQuality, 0);
  objc_storeStrong((id *)&self->_inputLumaNoiseScale, 0);
  objc_storeStrong((id *)&self->_inputScale, 0);
  objc_storeStrong(&self->_inputGainMapMetadata, 0);
  objc_storeStrong(&self->_inputDepthMetadata, 0);
  objc_storeStrong(&self->_inputShape, 0);
  objc_storeStrong((id *)&self->_inputAperture, 0);
  objc_storeStrong((id *)&self->_inputGainMapIsLinear, 0);
  objc_storeStrong((id *)&self->_inputGainMap, 0);
  objc_storeStrong((id *)&self->_inputBlurMap, 0);
  objc_storeStrong((id *)&self->_inputMatte, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

- (void)setInputBestHairQuality:(id)a3
{
}

- (NSNumber)inputBestHairQuality
{
  return self->_inputBestHairQuality;
}

- (void)setInputLumaNoiseScale:(id)a3
{
}

- (NSNumber)inputLumaNoiseScale
{
  return self->_inputLumaNoiseScale;
}

- (void)setInputScale:(id)a3
{
}

- (NSNumber)inputScale
{
  return self->_inputScale;
}

- (void)setInputGainMapMetadata:(id)a3
{
}

- (id)inputGainMapMetadata
{
  return self->_inputGainMapMetadata;
}

- (void)setInputDepthMetadata:(id)a3
{
}

- (id)inputDepthMetadata
{
  return self->_inputDepthMetadata;
}

- (void)setInputShape:(id)a3
{
}

- (id)inputShape
{
  return self->_inputShape;
}

- (void)setInputAperture:(id)a3
{
}

- (NSNumber)inputAperture
{
  return self->_inputAperture;
}

- (void)setInputGainMapIsLinear:(id)a3
{
}

- (NSNumber)inputGainMapIsLinear
{
  return self->_inputGainMapIsLinear;
}

- (void)setInputGainMap:(id)a3
{
}

- (CIImage)inputGainMap
{
  return self->_inputGainMap;
}

- (void)setInputBlurMap:(id)a3
{
}

- (CIImage)inputBlurMap
{
  return self->_inputBlurMap;
}

- (void)setInputMatte:(id)a3
{
}

- (CIImage)inputMatte
{
  return self->_inputMatte;
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
  v26[1] = *MEMORY[0x1E4F143B8];
  v3 = [(PIDepthEffectFilter *)self inputImage];

  if (v3)
  {
    v4 = [MEMORY[0x1E4F1E040] filterWithName:@"CIDepthEffectApplyBlurMap"];
    v5 = [(PIDepthEffectFilter *)self inputImage];
    [v4 setValue:v5 forKey:*MEMORY[0x1E4F1E480]];

    v6 = [(PIDepthEffectFilter *)self inputBlurMap];
    [v4 setValue:v6 forKey:@"inputBlurMap"];

    v7 = [(PIDepthEffectFilter *)self inputMatte];
    [v4 setValue:v7 forKey:@"inputMatteImage"];

    v8 = [(PIDepthEffectFilter *)self inputScale];
    [v4 setValue:v8 forKey:*MEMORY[0x1E4F1E4F0]];

    v9 = [(PIDepthEffectFilter *)self inputLumaNoiseScale];
    [v4 setValue:v9 forKey:@"inputLumaNoiseScale"];

    v10 = [(PIDepthEffectFilter *)self inputShape];
    [v4 setValue:v10 forKey:@"inputShape"];

    v11 = [(PIDepthEffectFilter *)self inputAperture];
    [v4 setValue:v11 forKey:@"inputAperture"];

    v12 = [(PIDepthEffectFilter *)self inputDepthMetadata];
    [v4 setValue:v12 forKey:@"inputAuxDataMetadata"];

    v13 = [(PIDepthEffectFilter *)self inputGainMap];
    v14 = [(PIDepthEffectFilter *)self inputGainMapIsLinear];
    char v15 = [v14 BOOLValue];

    if ((v15 & 1) == 0)
    {
      uint64_t v16 = [v13 _imageByApplyingGamma:0.454545455];

      v13 = (void *)v16;
    }
    v17 = [(PIDepthEffectFilter *)self inputGainMapMetadata];

    if (v17)
    {
      uint64_t v25 = *MEMORY[0x1E4F2F380];
      v26[0] = v17;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
      uint64_t v19 = [v13 imageBySettingPropertiesNoCopy:v18];

      v13 = (void *)v19;
    }
    [v4 setValue:v13 forKey:@"inputGainMap"];
    v20 = [(PIDepthEffectFilter *)self inputBestHairQuality];
    [v4 setValue:v20 forKey:@"inputBestHairQuality"];

    v21 = +[PIGlobalSettings globalSettings];
    int v22 = [v21 portraitDisableFuzzball];

    if (v22) {
      [v4 setValue:MEMORY[0x1E4F1CC28] forKey:@"inputBestHairQuality"];
    }
    v23 = [v4 outputImage];
  }
  else
  {
    v23 = 0;
  }
  return v23;
}

@end