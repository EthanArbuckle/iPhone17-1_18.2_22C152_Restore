@interface PIHighKeyHDR
+ (id)customAttributes;
- (CIImage)inputImage;
- (NSNumber)inputStrength;
- (id)_highKeyHDR;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputStrength:(id)a3;
@end

@implementation PIHighKeyHDR

+ (id)customAttributes
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F1E0B8];
  uint64_t v2 = *MEMORY[0x1E4F1E1C8];
  v12[0] = *MEMORY[0x1E4F1E188];
  v12[1] = v2;
  v12[2] = *MEMORY[0x1E4F1E1B8];
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];
  v13[1] = @"inputStrength";
  uint64_t v4 = *MEMORY[0x1E4F1E0D0];
  v10[0] = *MEMORY[0x1E4F1E098];
  v10[1] = v4;
  v11[0] = &unk_1F000A498;
  v11[1] = &unk_1F000A4A8;
  uint64_t v5 = *MEMORY[0x1E4F1E0F0];
  v10[2] = *MEMORY[0x1E4F1E0D8];
  v10[3] = v5;
  v14[0] = v3;
  uint64_t v6 = *MEMORY[0x1E4F1E158];
  v11[2] = &unk_1F000A4B8;
  v11[3] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];
  v14[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputStrength, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

- (void)setInputStrength:(id)a3
{
}

- (NSNumber)inputStrength
{
  return self->inputStrength;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (id)outputImage
{
  v18[2] = *MEMORY[0x1E4F143B8];
  inputImage = self->inputImage;
  if (inputImage)
  {
    uint64_t v4 = inputImage;
    uint64_t v5 = [(PIHighKeyHDR *)self _highKeyHDR];
    [(CIImage *)self->inputImage extent];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    inputStrength = self->inputStrength;
    v18[0] = v4;
    v18[1] = inputStrength;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];

    v16 = objc_msgSend(v5, "applyWithExtent:arguments:", v15, v7, v9, v11, v13);
  }
  else
  {
    v16 = 0;
  }
  return v16;
}

- (id)_highKeyHDR
{
  if (_highKeyHDR_once != -1) {
    dispatch_once(&_highKeyHDR_once, &__block_literal_global_10875);
  }
  uint64_t v2 = (void *)_highKeyHDR_singleton;
  return v2;
}

uint64_t __27__PIHighKeyHDR__highKeyHDR__block_invoke()
{
  _highKeyHDR_singleton = [MEMORY[0x1E4F1E010] kernelWithString:@"kernel vec4 _highKeyHDR(__sample im, float str) \n { \n vec3 neg = min(im.rgb, 0.0) \n vec3 pos = max(im.rgb, 1.0) - 1.0; \n im = clamp(im, 0.0, 1.0); \n vec4 im2 = 1.0-((im-1.0)*(im-1.0)); \n im2 = sqrt(im2); \n float y = dot(im.rgb, vec3(.333333)); \n float y2 = sqrt(1.0-(y-1.0)*(y-1.0)); \n y2 = mix(y2, smoothstep(0.0, 1.0, y2), 0.5); \n vec4 im3 = (y>0) ? im*y2/y : vec4(0.0, 0.0, 0.0, 1.0) ; \n im3 = mix(im3, im2, .7*sqrt(y2)); \n im3 = mix(im, im3, sqrt(y)) ; \n im.rgb = mix(im.rgb, im3.rgb, str) + pos + neg; \n return im; } \n"];;
  return MEMORY[0x1F41817F8]();
}

@end