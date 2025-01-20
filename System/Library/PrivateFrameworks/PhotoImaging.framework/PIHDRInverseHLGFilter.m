@interface PIHDRInverseHLGFilter
+ (id)inverseHLGLumaBlendingKernel;
- (CIImage)inputImage;
- (id)outputImage;
- (void)setInputImage:(id)a3;
@end

@implementation PIHDRInverseHLGFilter

+ (id)inverseHLGLumaBlendingKernel
{
  if (inverseHLGLumaBlendingKernel_once != -1) {
    dispatch_once(&inverseHLGLumaBlendingKernel_once, &__block_literal_global_27210);
  }
  v2 = (void *)inverseHLGLumaBlendingKernel_s_inverseLumaBlendingKernel;
  return v2;
}

uint64_t __53__PIHDRInverseHLGFilter_inverseHLGLumaBlendingKernel__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1E010] kernelWithString:@"kernel vec4 hlg_luma_blending_inv(__sample sdr, float scale) \n{ \n  const vec3 lum_weights = vec3(0.2627, 0.6780, 0.0593) \n  float Ys = dot(lum_weights, sdr.rgb); \n  float Ymax = max(sdr.r, max(sdr.g, sdr.b)); \n  float Yb = 0.5*(Ys+Ymax); \n  const float gamma1 = 0.845906630893; \n  float absY = max(abs(Yb), 0.00001); \n  float gainInv = scale * pow(absY, 1.0/gamma1 - 1.0); \n  float3 hdr = gainInv * sdr.rgb; \n  return vec4(hdr.rgb, 1.0); \n}\n"];;
  uint64_t v1 = inverseHLGLumaBlendingKernel_s_inverseLumaBlendingKernel;
  inverseHLGLumaBlendingKernel_s_inverseLumaBlendingKernel = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void).cxx_destruct
{
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
  v19[2] = *MEMORY[0x1E4F143B8];
  v2 = [(PIHDRInverseHLGFilter *)self inputImage];
  v3 = [MEMORY[0x1E4F7A400] colorSpaceFromColorPrimaries:*MEMORY[0x1E4F24AA8] transferFunction:*MEMORY[0x1E4F24BE8] yccMatrix:*MEMORY[0x1E4F24C30]];
  v4 = objc_msgSend(v2, "imageByColorMatchingWorkingSpaceToColorSpace:", objc_msgSend(v3, "CGColorSpace"));
  v5 = [(id)objc_opt_class() inverseHLGLumaBlendingKernel];
  [v4 extent];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v19[0] = v4;
  LODWORD(v6) = 2.0;
  v14 = [NSNumber numberWithFloat:v6];
  v19[1] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  v16 = objc_msgSend(v5, "applyWithExtent:arguments:", v15, v7, v9, v11, v13);

  v17 = objc_msgSend(v16, "imageByColorMatchingColorSpaceToWorkingSpace:", objc_msgSend(v3, "CGColorSpace"));

  return v17;
}

@end