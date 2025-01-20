@interface PIDefinitionFilter
+ (id)definitionKernel;
- (CIImage)inputBlurImage;
- (CIImage)inputImage;
- (NSNumber)inputIntensity;
- (id)outputImage;
- (void)setInputBlurImage:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputIntensity:(id)a3;
@end

@implementation PIDefinitionFilter

+ (id)definitionKernel
{
  if (definitionKernel_onceToken != -1) {
    dispatch_once(&definitionKernel_onceToken, &__block_literal_global_6852);
  }
  v2 = (void *)definitionKernel_s_definitionKernel;
  return v2;
}

uint64_t __38__PIDefinitionFilter_definitionKernel__block_invoke()
{
  definitionKernel_s_definitionKernel = [MEMORY[0x1E4F1E010] kernelWithString:@"vec4 meaningBlur(vec4 im, vec4 b)\n{\nvec4 result = im\nfloat thresh = 0.1;\nfloat g1 = max(max(im.r, im.g), im.b);\nfloat g2 = dot(b.rgb, vec3(1.0/3.0));\nfloat diff = max(g2-g1, -1.0);\ndiff = smoothstep(0.1-thresh, 0.1+thresh, diff);\nresult.rgb = mix(im.rgb, b.rgb, diff+0.5);\nreturn result;\n}\nvec4 clarityNew(vec4 s, vec4 b, float intensity)\n{\nfloat sl = (s.r + s.g + s.b);\nfloat bl = (b.r + b.g + b.b);\nfloat dl = sl + (sl - bl) * intensity;\nfloat mult = dl / max(sl, 0.0001);\nmult = 1.571 * (mult - 1.0);\nmult = mult / (1.0 + abs(mult));\nmult += 1.0;\nmult = clamp(mult, 1.0 - 0.5 * abs(intensity), 1.0 + 1.0 * abs(intensity));\ns.rgb = s.rgb * mult;\nreturn s;\n}\nkernel vec4 definition(sampler image, sampler blur, float intensity)\n{\nvec4 imgSample = sample(image, samplerCoord(image));\nvec4 blurSample = sample(blur, samplerCoord(blur));\nvec4 meaning = meaningBlur(imgSample, blurSample);\nvec4 clarity = clarityNew(imgSample, meaning, intensity);\nreturn clarity;\n}\n\n"];;
  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputIntensity, 0);
  objc_storeStrong((id *)&self->_inputBlurImage, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

- (void)setInputIntensity:(id)a3
{
}

- (NSNumber)inputIntensity
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputBlurImage:(id)a3
{
}

- (CIImage)inputBlurImage
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
  v11[3] = *MEMORY[0x1E4F143B8];
  v3 = [(CIImage *)self->_inputImage imageByUnpremultiplyingAlpha];
  v4 = [(CIImage *)self->_inputBlurImage imageByUnpremultiplyingAlpha];
  inputIntensity = self->_inputIntensity;
  v11[1] = v4;
  v11[2] = inputIntensity;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];

  v7 = [(id)objc_opt_class() definitionKernel];
  [(CIImage *)self->_inputImage extent];
  v8 = objc_msgSend(v7, "applyWithExtent:arguments:", v6);

  v9 = [v8 imageByPremultiplyingAlpha];

  return v9;
}

@end