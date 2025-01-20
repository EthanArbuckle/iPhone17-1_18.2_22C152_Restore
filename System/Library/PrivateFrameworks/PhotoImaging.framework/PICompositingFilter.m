@interface PICompositingFilter
+ (id)availableBlendModes;
+ (id)blendKernelForBlendMode:(id)a3;
+ (id)customAttributes;
- (CIImage)inputBackgroundImage;
- (CIImage)inputImage;
- (NSNumber)inputIntensity;
- (NSString)inputBlendMode;
- (id)outputImage;
- (void)setInputBackgroundImage:(id)a3;
- (void)setInputBlendMode:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputIntensity:(id)a3;
@end

@implementation PICompositingFilter

+ (id)customAttributes
{
  v21[3] = *MEMORY[0x1E4F143B8];
  v20[0] = *MEMORY[0x1E4F1E0B8];
  uint64_t v19 = *MEMORY[0x1E4F1E198];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  v21[0] = v2;
  v20[1] = *MEMORY[0x1E4F1E488];
  uint64_t v3 = *MEMORY[0x1E4F1E0E0];
  v14[0] = *MEMORY[0x1E4F1E0E8];
  v14[1] = v3;
  v18[0] = &unk_1F000A748;
  v18[1] = &unk_1F000A758;
  uint64_t v5 = *MEMORY[0x1E4F1E0C8];
  uint64_t v15 = *MEMORY[0x1E4F1E098];
  uint64_t v4 = v15;
  uint64_t v16 = v5;
  v18[2] = &unk_1F000A758;
  v18[3] = &unk_1F000A748;
  uint64_t v17 = *MEMORY[0x1E4F1E0F0];
  uint64_t v6 = v17;
  v18[4] = *MEMORY[0x1E4F1E158];
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v14 count:5];
  v21[1] = v7;
  v20[2] = @"inputBlendMode";
  v13[0] = @"PIAttributeTypeMode";
  v8 = objc_msgSend((id)objc_opt_class(), "availableBlendModes", v6, @"PIAttributeAvailableModes");
  v12[2] = v4;
  v13[1] = v8;
  v13[2] = @"sourceOver";
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  v21[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];

  return v10;
}

+ (id)blendKernelForBlendMode:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1E000] valueForKey:v3];

  return v4;
}

+ (id)availableBlendModes
{
  if (availableBlendModes_onceToken != -1) {
    dispatch_once(&availableBlendModes_onceToken, &__block_literal_global_20500);
  }
  v2 = (void *)availableBlendModes_blendModes;
  return v2;
}

void __42__PICompositingFilter_availableBlendModes__block_invoke()
{
  v0 = (void *)availableBlendModes_blendModes;
  availableBlendModes_blendModes = (uint64_t)&unk_1F000AB38;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputBlendMode, 0);
  objc_storeStrong((id *)&self->_inputIntensity, 0);
  objc_storeStrong((id *)&self->_inputBackgroundImage, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

- (void)setInputBlendMode:(id)a3
{
}

- (NSString)inputBlendMode
{
  return self->_inputBlendMode;
}

- (void)setInputIntensity:(id)a3
{
}

- (NSNumber)inputIntensity
{
  return self->_inputIntensity;
}

- (void)setInputBackgroundImage:(id)a3
{
}

- (CIImage)inputBackgroundImage
{
  return self->_inputBackgroundImage;
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
  v25[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(PICompositingFilter *)self inputImage];

  uint64_t v4 = [(PICompositingFilter *)self inputBackgroundImage];
  uint64_t v5 = v4;
  if (v3)
  {

    if (v5)
    {
      uint64_t v6 = [(PICompositingFilter *)self inputBlendMode];
      v7 = (void *)v6;
      v8 = @"sourceOver";
      if (v6) {
        v8 = (__CFString *)v6;
      }
      v9 = v8;

      v10 = [(id)objc_opt_class() blendKernelForBlendMode:v9];
      v11 = [(PICompositingFilter *)self inputImage];
      v12 = [(PICompositingFilter *)self inputBackgroundImage];
      v13 = [v10 applyWithForeground:v11 background:v12];
      v14 = v13;
      if (v13)
      {
        id v15 = v13;
      }
      else
      {
        id v15 = [(PICompositingFilter *)self inputImage];
      }
      uint64_t v5 = v15;

      if (v5)
      {
        uint64_t v16 = [(PICompositingFilter *)self inputIntensity];

        if (v16)
        {
          uint64_t v17 = [(PICompositingFilter *)self inputBackgroundImage];
          uint64_t v18 = *MEMORY[0x1E4F1E4F8];
          v25[0] = v5;
          uint64_t v19 = *MEMORY[0x1E4F1E500];
          v24[0] = v18;
          v24[1] = v19;
          v20 = [(PICompositingFilter *)self inputIntensity];
          v25[1] = v20;
          v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
          uint64_t v22 = [v17 imageByApplyingFilter:@"CIDissolveTransition" withInputParameters:v21];

          uint64_t v5 = (void *)v22;
        }
      }
    }
    else
    {
      uint64_t v5 = [(PICompositingFilter *)self inputImage];
    }
  }
  return v5;
}

@end