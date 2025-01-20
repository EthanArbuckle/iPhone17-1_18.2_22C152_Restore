@interface PIPhotoGrainHDR
+ (id)customAttributes;
- (CIImage)inputImage;
- (NSNumber)inputAmount;
- (NSNumber)inputISO;
- (NSNumber)inputSeed;
- (id)_grainBlendAndMixKernel;
- (id)_interpolateGrainKernel;
- (id)_paddedTileKernel;
- (id)outputImage;
- (void)setInputAmount:(id)a3;
- (void)setInputISO:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputSeed:(id)a3;
@end

@implementation PIPhotoGrainHDR

+ (id)customAttributes
{
  v30[4] = *MEMORY[0x1E4F143B8];
  v29[0] = *MEMORY[0x1E4F1E0B8];
  uint64_t v2 = *MEMORY[0x1E4F1E1C8];
  v28[0] = *MEMORY[0x1E4F1E190];
  v28[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1E1B0];
  v28[2] = *MEMORY[0x1E4F1E1A8];
  v28[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F1E180];
  v28[4] = *MEMORY[0x1E4F1E1B8];
  v28[5] = v4;
  v28[6] = *MEMORY[0x1E4F1E170];
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:7];
  v30[0] = v17;
  v29[1] = @"inputISO";
  uint64_t v6 = *MEMORY[0x1E4F1E0E8];
  v22[0] = *MEMORY[0x1E4F1E0D8];
  uint64_t v5 = v22[0];
  v22[1] = v6;
  v27[0] = &unk_1F000A9C8;
  v27[1] = &unk_1F000A9C8;
  uint64_t v8 = *MEMORY[0x1E4F1E098];
  uint64_t v23 = *MEMORY[0x1E4F1E0E0];
  uint64_t v7 = v23;
  uint64_t v24 = v8;
  v27[2] = &unk_1F000A9D8;
  v27[3] = &unk_1F000A9C8;
  uint64_t v10 = *MEMORY[0x1E4F1E0F0];
  uint64_t v25 = *MEMORY[0x1E4F1E0C8];
  uint64_t v9 = v25;
  uint64_t v26 = v10;
  uint64_t v11 = *MEMORY[0x1E4F1E158];
  v27[4] = &unk_1F000A9E8;
  v27[5] = v11;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v22 count:6];
  v30[1] = v16;
  v29[2] = @"inputAmount";
  v20[0] = v5;
  v20[1] = v6;
  v21[0] = &unk_1F000A9E8;
  v21[1] = &unk_1F000A9E8;
  v20[2] = v7;
  v20[3] = v8;
  v21[2] = &unk_1F000A9F8;
  v21[3] = &unk_1F000A9F8;
  v20[4] = v9;
  v20[5] = v10;
  v21[4] = &unk_1F000A9E8;
  v21[5] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:6];
  v30[2] = v12;
  v29[3] = @"inputSeed";
  v18[0] = v5;
  v18[1] = v6;
  v19[0] = &unk_1F000A9E8;
  v19[1] = &unk_1F000A9E8;
  v18[2] = v7;
  v18[3] = v8;
  v19[2] = &unk_1F000A9F8;
  v19[3] = &unk_1F000A9E8;
  v18[4] = v10;
  v19[4] = v11;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:5];
  v30[3] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:4];

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputSeed, 0);
  objc_storeStrong((id *)&self->inputAmount, 0);
  objc_storeStrong((id *)&self->inputISO, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

- (void)setInputSeed:(id)a3
{
}

- (NSNumber)inputSeed
{
  return self->inputSeed;
}

- (void)setInputAmount:(id)a3
{
}

- (NSNumber)inputAmount
{
  return self->inputAmount;
}

- (void)setInputISO:(id)a3
{
}

- (NSNumber)inputISO
{
  return self->inputISO;
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
  v67[2] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    goto LABEL_10;
  }
  [(NSNumber *)self->inputAmount floatValue];
  if (v3 < 0.001)
  {
    uint64_t v4 = self->inputImage;
    goto LABEL_11;
  }
  [(NSNumber *)self->inputISO floatValue];
  float v6 = v5;
  if (outputImage_onceToken != -1) {
    dispatch_once(&outputImage_onceToken, &__block_literal_global_29);
  }
  if (outputImage_inputGrain)
  {
    float v7 = fminf(fmaxf(v6, 10.0), 3200.0);
    float v8 = log10(v7);
    uint64_t v9 = [(PIPhotoGrainHDR *)self _interpolateGrainKernel];
    [(id)outputImage_inputGrain extent];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    v67[0] = outputImage_inputGrain;
    *(float *)&double v10 = v8;
    v18 = [NSNumber numberWithFloat:v10];
    v67[1] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:2];
    v20 = objc_msgSend(v9, "applyWithExtent:arguments:", v19, v11, v13, v15, v17);

    [v20 extent];
    double v22 = v21 + -2.0;
    [v20 extent];
    uint64_t v24 = v23;
    uint64_t v26 = v25;
    uint64_t v28 = v27;
    uint64_t v30 = v29;
    v31 = [(PIPhotoGrainHDR *)self _paddedTileKernel];
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __30__PIPhotoGrainHDR_outputImage__block_invoke_2;
    v64[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    v64[4] = v24;
    v64[5] = v26;
    v64[6] = v28;
    v64[7] = v30;
    v32 = [MEMORY[0x1E4F1E080] vectorWithX:v22 Y:v22 Z:1.0 / v22 W:1.0 / v22];
    v66 = v32;
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1];
    v34 = objc_msgSend(v31, "applyWithExtent:roiCallback:inputImage:arguments:", v64, v20, v33, *MEMORY[0x1E4F1DB10], *(double *)(MEMORY[0x1E4F1DB10] + 8), *(double *)(MEMORY[0x1E4F1DB10] + 16), *(double *)(MEMORY[0x1E4F1DB10] + 24));

    [(NSNumber *)self->inputSeed doubleValue];
    double __src = v35;
    if (v35 != 0.0)
    {
      v57[1] = 0;
      uint64_t v59 = 0;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v58 = xmmword_1A980B990;
      long long v60 = 0x61C8864E7A143579uLL;
      v57[0] = 0;
      XXH64_update((uint64_t)v57, (char *)&__src, 8uLL);
      unsigned int v36 = XXH64_digest((uint64_t)v57);
      CGAffineTransformMakeTranslation(&v56, (double)(v36 & 0x1FF), (double)((v36 >> 9) & 0x1FF));
      uint64_t v37 = [v34 imageByApplyingTransform:&v56];

      v34 = (void *)v37;
    }
    *(float *)&double v38 = grainParams(v7);
    int v40 = v39;
    v41 = [(CIImage *)self->inputImage imageByUnpremultiplyingAlpha];
    v42 = [(PIPhotoGrainHDR *)self _grainBlendAndMixKernel];
    [v41 extent];
    double v44 = v43;
    double v46 = v45;
    double v48 = v47;
    double v50 = v49;
    v65[0] = v41;
    v65[1] = v34;
    LODWORD(v43) = v40;
    v51 = [NSNumber numberWithFloat:v43];
    inputAmount = self->inputAmount;
    v65[2] = v51;
    v65[3] = inputAmount;
    v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:4];
    v54 = objc_msgSend(v42, "applyWithExtent:arguments:", v53, v44, v46, v48, v50);

    uint64_t v4 = [v54 imageByPremultiplyingAlpha];
  }
  else
  {
LABEL_10:
    uint64_t v4 = 0;
  }
LABEL_11:
  return v4;
}

double __30__PIPhotoGrainHDR_outputImage__block_invoke_2(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

void __30__PIPhotoGrainHDR_outputImage__block_invoke()
{
  v30[2] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1C9B8] dataWithBytes:"1536 x 1536 noise grain image prov" length:32];
  uint64_t v1 = *MEMORY[0x1E4F1E3D8];
  v29[0] = *MEMORY[0x1E4F1E3D0];
  v29[1] = v1;
  v30[0] = v0;
  v30[1] = @"PIPhotoGrainHDR";
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
  id v3 = objc_alloc(MEMORY[0x1E4F1E050]);
  uint64_t v4 = (void *)[v3 initWithImageProvider:&__block_literal_global_67 width:1536 height:1536 format:*MEMORY[0x1E4F1E2F0] colorSpace:0 options:v2];
  float v5 = applyGrainParams(v4, 10.0);
  float v6 = applyGrainParams(v4, 50.0);
  float v7 = applyGrainParams(v4, 400.0);
  float v8 = applyGrainParams(v4, 3200.0);
  uint64_t v9 = [MEMORY[0x1E4F1E010] kernelWithString:@"kernel vec4 _grainGenCombineHDR (__sample r, __sample g, __sample b, __sample a)\n{ return vec4(r.x, g.x, b.x, a.x); }"];
  [v8 extent];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v28[0] = v5;
  v28[1] = v6;
  v28[2] = v7;
  v28[3] = v8;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];
  v19 = objc_msgSend(v9, "applyWithExtent:arguments:", v18, v11, v13, v15, v17);

  v20 = objc_msgSend(v19, "imageByCroppingToRect:", 511.0, 511.0, 514.0, 514.0);

  CGAffineTransformMakeTranslation(&v27, -511.0, -511.0);
  uint64_t v21 = [v20 imageByApplyingTransform:&v27];

  double v22 = (void *)outputImage_inputGrain;
  outputImage_inputGrain = v21;

  uint64_t v23 = (void *)outputImage_inputGrain;
  CGAffineTransformMakeTranslation(&v26, -1.0, -1.0);
  uint64_t v24 = [v23 imageByApplyingTransform:&v26];
  uint64_t v25 = (void *)outputImage_inputGrain;
  outputImage_inputGrain = v24;
}

- (id)_paddedTileKernel
{
  if (_paddedTileKernel_once != -1) {
    dispatch_once(&_paddedTileKernel_once, &__block_literal_global_9_25048);
  }
  uint64_t v2 = (void *)_paddedTileKernel_singleton;
  return v2;
}

uint64_t __36__PIPhotoGrainHDR__paddedTileKernel__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1E088] kernelWithString:@"kernel vec2 _paddedTile2(vec4 k) { return fract(destCoord() * k.zw) * k.xy + vec2(1.0); }\n"];
  uint64_t v1 = _paddedTileKernel_singleton;
  _paddedTileKernel_singleton = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)_grainBlendAndMixKernel
{
  if (_grainBlendAndMixKernel_once != -1) {
    dispatch_once(&_grainBlendAndMixKernel_once, &__block_literal_global_25054);
  }
  uint64_t v2 = (void *)_grainBlendAndMixKernel_singleton;
  return v2;
}

uint64_t __42__PIPhotoGrainHDR__grainBlendAndMixKernel__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1E010] kernelWithString:@"kernel vec4 _grainBlendAndMixHDR(__sample img, __sample grainImage, float contrast, float mixAmount)\n{\n  vec3 rgb = img.rgb\n  float luminance = clamp(dot(rgb, vec3(.333333)), 0.0, 1.0); \n  float gamma = 4.01 - 2.0*luminance;\n  rgb = sign(rgb) * pow(abs(rgb), vec3(1.0/gamma));\n  float grain = grainImage.r - 0.5;\n  float mult = contrast * grain;\n  rgb += (max(luminance, 0.5) * mult * (1.0-luminance));\n  rgb = sign(rgb) * pow(abs(rgb), vec3(gamma));\n  rgb = min(rgb, 12.0);\n  return mix(img, vec4(rgb,img.a), mixAmount);\n}"];;
  uint64_t v1 = (void *)_grainBlendAndMixKernel_singleton;
  _grainBlendAndMixKernel_singleton = v0;

  uint64_t v2 = (void *)_grainBlendAndMixKernel_singleton;
  return [v2 setPerservesAlpha:1];
}

- (id)_interpolateGrainKernel
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__PIPhotoGrainHDR__interpolateGrainKernel__block_invoke;
  block[3] = &unk_1E5D812E0;
  float v5 = @"kernel vec4 _blendGrainsHDR(__sample isoImages, float log10iso)\n{\n  vec4 c = isoImages; \n  float mix10_50    = mix(c.r, c.g, log10iso*1.43067655809 \n                                           - 1.43067655809); \n  float mix50_400   = mix(c.g, c.b, log10iso*1.10730936496 \n                                           - 1.88128539659); \n  float mix400_3200 = mix(c.b, c.a, log10iso*1.10730936496 \n                                           - 2.88128539659); \n  float v = compare(log10iso - 1.69897000434,                     mix10_50,                     compare(log10iso - 2.60205999133,                             mix50_400,                             mix400_3200)); \n  return vec4(v,v,v,1.0);\n}";
  if (_interpolateGrainKernel_once != -1) {
    dispatch_once(&_interpolateGrainKernel_once, block);
  }
  id v2 = (id)_interpolateGrainKernel_singleton;

  return v2;
}

uint64_t __42__PIPhotoGrainHDR__interpolateGrainKernel__block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F1E010] kernelWithString:*(void *)(a1 + 32)];
  uint64_t v2 = _interpolateGrainKernel_singleton;
  _interpolateGrainKernel_singleton = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

@end