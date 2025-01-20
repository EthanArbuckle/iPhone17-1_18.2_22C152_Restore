@interface NURAWGainMapFilter
+ (id)gainMapKernel;
- (CIImage)inputImage;
- (NSNumber)inputGain;
- (id)outputImage;
- (void)setInputGain:(id)a3;
- (void)setInputImage:(id)a3;
@end

@implementation NURAWGainMapFilter

+ (id)gainMapKernel
{
  if (gainMapKernel_once != -1) {
    dispatch_once(&gainMapKernel_once, &__block_literal_global_586);
  }
  v2 = (void *)gainMapKernel_s_gainMapKernel;

  return v2;
}

uint64_t __35__NURAWGainMapFilter_gainMapKernel__block_invoke()
{
  gainMapKernel_s_gainMapKernel = [MEMORY[0x1E4F1E010] kernelWithString:@"kernel vec4 _gainMap(__sample im, float gainCompensation) \n{ \n  vec3 stopDown = 0.25 * gainCompensation * im.rgb \n  float y = dot(stopDown, vec3(0.299, 0.587, 0.114)); \n  y = smoothstep(0.0, 1.0, sqrt(clamp(y, 0.0, 4.0))); \n  return vec4(y,y,y,1.0); \n}\n"];;

  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputGain, 0);

  objc_storeStrong((id *)&self->_inputImage, 0);
}

- (void)setInputGain:(id)a3
{
}

- (NSNumber)inputGain
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
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
  v21[2] = *MEMORY[0x1E4F143B8];
  v3 = [(NURAWGainMapFilter *)self inputImage];
  uint64_t v4 = [(NURAWGainMapFilter *)self inputGain];
  v5 = (void *)v4;
  v6 = &unk_1F004A500;
  if (v4) {
    v6 = (void *)v4;
  }
  id v7 = v6;

  v8 = [(id)objc_opt_class() gainMapKernel];
  [v3 extent];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v21[0] = v3;
  v21[1] = v7;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];

  v18 = objc_msgSend(v8, "applyWithExtent:arguments:", v17, v10, v12, v14, v16);

  v19 = [v18 _imageByApplyingGamma:2.2];

  return v19;
}

@end