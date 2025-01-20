@interface NUToneTransferFilter
+ (id)toneTransferKernel;
- (CIImage)inputImage;
- (CIImage)inputSourceImage;
- (CIImage)inputTargetImage;
- (NSNumber)inputStrength;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputSourceImage:(id)a3;
- (void)setInputStrength:(id)a3;
- (void)setInputTargetImage:(id)a3;
@end

@implementation NUToneTransferFilter

+ (id)toneTransferKernel
{
  if (toneTransferKernel_once != -1) {
    dispatch_once(&toneTransferKernel_once, &__block_literal_global_629);
  }
  v2 = (void *)toneTransferKernel_s_toneTransferKernel;

  return v2;
}

uint64_t __42__NUToneTransferFilter_toneTransferKernel__block_invoke()
{
  toneTransferKernel_s_toneTransferKernel = [MEMORY[0x1E4F1E010] kernelWithString:@"kernel vec4 toneTransfer(__sample im, __sample src, __sample dst, float f) \n{ \n  float epsilon = 1e-5 \n  vec3 y0 = src.rgb; \n  vec3 y1 = dst.rgb; \n  vec3 g = (y1 + epsilon) / (y0 + epsilon); \n  vec3 x = im.rgb; \n  vec3 y = mix(x, g * x, f); \n  return vec4(y, im.a); \n}\n"];;

  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputStrength, 0);
  objc_storeStrong((id *)&self->_inputTargetImage, 0);
  objc_storeStrong((id *)&self->_inputSourceImage, 0);

  objc_storeStrong((id *)&self->_inputImage, 0);
}

- (void)setInputStrength:(id)a3
{
}

- (NSNumber)inputStrength
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputTargetImage:(id)a3
{
}

- (CIImage)inputTargetImage
{
  return (CIImage *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputSourceImage:(id)a3
{
}

- (CIImage)inputSourceImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (id)outputImage
{
  v23[4] = *MEMORY[0x1E4F143B8];
  v3 = [(NUToneTransferFilter *)self inputImage];
  if (v3)
  {
    v4 = [(NUToneTransferFilter *)self inputSourceImage];
    uint64_t v5 = [(NUToneTransferFilter *)self inputTargetImage];
    v6 = (void *)v5;
    if (v4 && v5)
    {
      uint64_t v7 = [(NUToneTransferFilter *)self inputStrength];
      v8 = (void *)v7;
      v9 = &unk_1F004A500;
      if (v7) {
        v9 = (void *)v7;
      }
      id v10 = v9;

      v11 = [(id)objc_opt_class() toneTransferKernel];
      [v3 extent];
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      v23[0] = v3;
      v23[1] = v4;
      v23[2] = v6;
      v23[3] = v10;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];

      objc_msgSend(v11, "applyWithExtent:arguments:", v20, v13, v15, v17, v19);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v21 = v3;
    }
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

@end