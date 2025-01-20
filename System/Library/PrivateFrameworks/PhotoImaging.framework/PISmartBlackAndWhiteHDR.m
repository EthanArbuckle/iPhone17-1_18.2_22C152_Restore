@interface PISmartBlackAndWhiteHDR
+ (id)customAttributes;
- (CIImage)inputImage;
- (NSNumber)inputGrain;
- (NSNumber)inputHue;
- (NSNumber)inputNeutralGamma;
- (NSNumber)inputScaleFactor;
- (NSNumber)inputSeed;
- (NSNumber)inputStrength;
- (NSNumber)inputTone;
- (float)createHueArray;
- (id)hueArrayImage:(float *)a3;
- (id)outputImage;
- (id)smartBlackWhiteKernel;
- (void)getNonNormalizedSettings:(id *)a3;
- (void)setInputGrain:(id)a3;
- (void)setInputHue:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputNeutralGamma:(id)a3;
- (void)setInputScaleFactor:(id)a3;
- (void)setInputSeed:(id)a3;
- (void)setInputStrength:(id)a3;
- (void)setInputTone:(id)a3;
@end

@implementation PISmartBlackAndWhiteHDR

+ (id)customAttributes
{
  v42[8] = *MEMORY[0x1E4F143B8];
  v41[0] = *MEMORY[0x1E4F1E0B8];
  uint64_t v2 = *MEMORY[0x1E4F1E1C8];
  v40[0] = *MEMORY[0x1E4F1E190];
  v40[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1E1B0];
  v40[2] = *MEMORY[0x1E4F1E1A8];
  v40[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F1E180];
  v40[4] = *MEMORY[0x1E4F1E1B8];
  v40[5] = v4;
  v40[6] = *MEMORY[0x1E4F1E170];
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:7];
  v42[0] = v21;
  v41[1] = @"inputStrength";
  uint64_t v6 = *MEMORY[0x1E4F1E0E8];
  v34[0] = *MEMORY[0x1E4F1E0D8];
  uint64_t v5 = v34[0];
  v34[1] = v6;
  v39[0] = &unk_1F000A668;
  v39[1] = &unk_1F000A668;
  uint64_t v8 = *MEMORY[0x1E4F1E0D0];
  uint64_t v35 = *MEMORY[0x1E4F1E0E0];
  uint64_t v7 = v35;
  uint64_t v36 = v8;
  v39[2] = &unk_1F000A678;
  v39[3] = &unk_1F000A678;
  uint64_t v10 = *MEMORY[0x1E4F1E0F0];
  uint64_t v37 = *MEMORY[0x1E4F1E098];
  uint64_t v9 = v37;
  uint64_t v38 = v10;
  uint64_t v11 = *MEMORY[0x1E4F1E158];
  v39[4] = &unk_1F000A688;
  v39[5] = v11;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v34 count:6];
  v42[1] = v20;
  v41[2] = @"inputNeutralGamma";
  v32[0] = v5;
  v32[1] = v6;
  v33[0] = &unk_1F000A698;
  v33[1] = &unk_1F000A698;
  v32[2] = v7;
  v32[3] = v8;
  v33[2] = &unk_1F000A678;
  v33[3] = &unk_1F000A678;
  v32[4] = v9;
  v32[5] = v10;
  v33[4] = &unk_1F000A668;
  v33[5] = v11;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:6];
  v42[2] = v19;
  v41[3] = @"inputTone";
  v30[0] = v5;
  v30[1] = v6;
  v31[0] = &unk_1F000A698;
  v31[1] = &unk_1F000A698;
  v30[2] = v7;
  v30[3] = v8;
  v31[2] = &unk_1F000A678;
  v31[3] = &unk_1F000A678;
  v30[4] = v9;
  v30[5] = v10;
  v31[4] = &unk_1F000A668;
  v31[5] = v11;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:6];
  v42[3] = v18;
  v41[4] = @"inputHue";
  v28[0] = v5;
  v28[1] = v6;
  v29[0] = &unk_1F000A698;
  v29[1] = &unk_1F000A698;
  v28[2] = v7;
  v28[3] = v8;
  v29[2] = &unk_1F000A678;
  v29[3] = &unk_1F000A678;
  v28[4] = v9;
  v28[5] = v10;
  v29[4] = &unk_1F000A668;
  v29[5] = v11;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:6];
  v42[4] = v17;
  v41[5] = @"inputGrain";
  v26[0] = v5;
  v26[1] = v6;
  v27[0] = &unk_1F000A668;
  v27[1] = &unk_1F000A668;
  v26[2] = v7;
  v26[3] = v8;
  v27[2] = &unk_1F000A678;
  v27[3] = &unk_1F000A678;
  v26[4] = v9;
  v26[5] = v10;
  v27[4] = &unk_1F000A668;
  v27[5] = v11;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:6];
  v42[5] = v16;
  v41[6] = @"inputSeed";
  v24[0] = v5;
  v24[1] = v6;
  v25[0] = &unk_1F000A668;
  v25[1] = &unk_1F000A668;
  v24[2] = v7;
  v24[3] = v9;
  v25[2] = &unk_1F000A678;
  v25[3] = &unk_1F000A668;
  v24[4] = v10;
  v25[4] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:5];
  v42[6] = v12;
  v41[7] = @"inputScaleFactor";
  v22[0] = v5;
  v22[1] = v8;
  v23[0] = &unk_1F000A668;
  v23[1] = &unk_1F000A678;
  v22[2] = v9;
  v22[3] = v10;
  v23[2] = &unk_1F000A678;
  v23[3] = v11;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:4];
  v42[7] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:8];

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputScaleFactor, 0);
  objc_storeStrong((id *)&self->inputSeed, 0);
  objc_storeStrong((id *)&self->inputGrain, 0);
  objc_storeStrong((id *)&self->inputHue, 0);
  objc_storeStrong((id *)&self->inputTone, 0);
  objc_storeStrong((id *)&self->inputNeutralGamma, 0);
  objc_storeStrong((id *)&self->inputStrength, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

- (void)setInputScaleFactor:(id)a3
{
}

- (NSNumber)inputScaleFactor
{
  return self->inputScaleFactor;
}

- (void)setInputSeed:(id)a3
{
}

- (NSNumber)inputSeed
{
  return self->inputSeed;
}

- (void)setInputGrain:(id)a3
{
}

- (NSNumber)inputGrain
{
  return self->inputGrain;
}

- (void)setInputHue:(id)a3
{
}

- (NSNumber)inputHue
{
  return self->inputHue;
}

- (void)setInputTone:(id)a3
{
}

- (NSNumber)inputTone
{
  return self->inputTone;
}

- (void)setInputNeutralGamma:(id)a3
{
}

- (NSNumber)inputNeutralGamma
{
  return self->inputNeutralGamma;
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
  v35[4] = *MEMORY[0x1E4F143B8];
  if (self->inputImage && self->inputNeutralGamma && self->inputTone && self->inputStrength && self->inputScaleFactor)
  {
    float v32 = 1.0;
    uint64_t v3 = [(PISmartBlackAndWhiteHDR *)self hueArrayImage:&v32];
    if (v3)
    {
      long long v30 = 0u;
      *(_OWORD *)v31 = 0u;
      [(PISmartBlackAndWhiteHDR *)self getNonNormalizedSettings:&v30];
      uint64_t v4 = [MEMORY[0x1E4F1E080] vectorWithX:v31[1] Y:v31[2] Z:v31[3] W:v32];
      uint64_t v5 = [(CIImage *)self->inputImage imageByUnpremultiplyingAlpha];
      uint64_t v6 = [MEMORY[0x1E4F1E080] vectorWithX:0.997222245 Y:0.00138888892 Z:*((float *)&v30 + 3) W:v31[0]];
      uint64_t v7 = [(PISmartBlackAndWhiteHDR *)self smartBlackWhiteKernel];
      [(CIImage *)self->inputImage extent];
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      v35[0] = v5;
      v35[1] = v3;
      v35[2] = v4;
      v35[3] = v6;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:4];
      v17 = objc_msgSend(v7, "applyWithExtent:arguments:", v16, v9, v11, v13, v15);

      v18 = [v17 imageByPremultiplyingAlpha];

      [(NSNumber *)self->inputGrain floatValue];
      if (v19 > 0.0)
      {
        float v20 = v19;
        [(NSNumber *)self->inputScaleFactor floatValue];
        *(float *)&double v22 = v21 * 100.0;
        v33[0] = @"inputISO";
        v23 = [NSNumber numberWithFloat:v22];
        v34[0] = v23;
        v33[1] = @"inputAmount";
        *(float *)&double v24 = v20;
        v25 = [NSNumber numberWithFloat:v24];
        v33[2] = @"inputSeed";
        inputSeed = self->inputSeed;
        v34[1] = v25;
        void v34[2] = inputSeed;
        v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];
        uint64_t v28 = [v18 imageByApplyingFilter:@"PIPhotoGrainHDR" withInputParameters:v27];

        v18 = (void *)v28;
      }
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    v18 = 0;
  }
  return v18;
}

- (id)smartBlackWhiteKernel
{
  if (smartBlackWhiteKernel_once != -1) {
    dispatch_once(&smartBlackWhiteKernel_once, &__block_literal_global_18965);
  }
  uint64_t v2 = (void *)smartBlackWhiteKernel_singleton;
  return v2;
}

uint64_t __48__PISmartBlackAndWhiteHDR_smartBlackWhiteKernel__block_invoke()
{
  smartBlackWhiteKernel_singleton = [MEMORY[0x1E4F1E010] kernelWithString:@"kernel vec4 _smartBlackAndWhiteHDR(__sample imageHDR, sampler2D hueImage, vec4 rgbWeights, vec4 normalizer) { float hueTableScaleFactor = rgbWeights.w float hueImageWidth = normalizer.x; float huePixelCenter = normalizer.y; float neutralGamma = normalizer.z; float phototone = normalizer.w; float bw = dot(imageHDR.rgb / 12.0, rgbWeights.rgb); bw = clamp(bw, 0.0, 1.0); vec3 lms; lms.x = dot(imageHDR.rgb, vec3(0.3139902162, 0.6395129383, 0.0464975462)); lms.y = dot(imageHDR.rgb, vec3(0.155372406, 0.7578944616, 0.0867014186)); lms.z = dot(imageHDR.rgb, vec3(0.017752387, 0.109442094, 0.8725692246)); lms = pow(lms, vec3(0.43)); float i = dot(lms, vec3(0.4,0.4,0.2)); float p = dot(lms, vec3(4.4550,-4.8510,0.3960)); float t = dot(lms, vec3(0.8056,0.3572,-1.1628)); float chroma = sqrt(p*p+t*t); float hue = 0.5 + (atan(t, p) / 6.28318530718); vec2 huePt = vec2(hue * hueImageWidth + huePixelCenter, 0.5); float hueGamma = hueTableScaleFactor * texture2D(hueImage, huePt).a; float cd = 0.06 + 0.53 * abs(i-0.5); float lowSaturationDamp = smoothstep(0.0, 1.0, (chroma)/cd); float intensityDamp = smoothstep(0.0, 1.0, 1.0 - i); float lowLuminosityDamp = smoothstep(0.0, 1.0, 25.0 * i); float hWeight = lowSaturationDamp * intensityDamp * lowLuminosityDamp; hueGamma -= 1; hueGamma *= hWeight; hueGamma += 1; bw = pow(bw, hueGamma); float bwSDR = clamp(bw * 12.0, 0.0, 1.0); float midLumWeight = bwSDR*(1.0 - bwSDR); float grayWeight = 1.0 - smoothstep(0.0, 1.0, chroma * 10.0); float nWeight = midLumWeight * grayWeight; neutralGamma -= 1; neutralGamma *= nWeight; neutralGamma *= -2; neutralGamma += 1; bw = pow(bw, neutralGamma); bw = bw * 12.0; bw = clamp(bw, 0.0, 12.0); float df0 = 0.812379; float result; if (bw < df0) { result = 1.8031*bw*bw*bw - 2.1972*bw*bw + 1.3823*bw; } else { float scale = 12.0 - df0; float x = (bw - df0) / scale; result = 1.8031*x*x*x - 2.1972*x*x + 1.3823*x; result = result * scale + df0; result -= 0.158305860; } bw = mix(bw, result,-phototone); return vec4(bw,bw,bw,imageHDR.a); }"];;
  return MEMORY[0x1F41817F8]();
}

- (id)hueArrayImage:(float *)a3
{
  v19[5] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(PISmartBlackAndWhiteHDR *)self createHueArray];
  uint64_t v5 = [MEMORY[0x1E4F1CA58] dataWithLength:368];
  float v6 = *v4;
  for (uint64_t i = 1; i != 360; ++i)
  {
    if (v6 < v4[i]) {
      float v6 = v4[i];
    }
  }
  id v8 = v5;
  uint64_t v9 = [v8 mutableBytes];
  for (uint64_t j = 0; j != 360; ++j)
    *(unsigned char *)(v9 + j) = (int)fmaxf(fminf((float)(v4[j] * 255.0) / v6, 255.0), 0.0);
  *a3 = v6;
  free(v4);
  v18[0] = *MEMORY[0x1E4F1E390];
  double v11 = [MEMORY[0x1E4F1CA98] null];
  uint64_t v12 = *MEMORY[0x1E4F1E388];
  v18[1] = *MEMORY[0x1E4F1E3A0];
  v18[2] = v12;
  v19[0] = v11;
  v19[1] = MEMORY[0x1E4F1CC28];
  uint64_t v13 = *MEMORY[0x1E4F1E3A8];
  v19[2] = MEMORY[0x1E4F1CC38];
  v19[3] = MEMORY[0x1E4F1CC28];
  uint64_t v14 = *MEMORY[0x1E4F1E378];
  v18[3] = v13;
  v18[4] = v14;
  v19[4] = MEMORY[0x1E4F1CC38];
  double v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:5];

  v16 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithBitmapData:bytesPerRow:size:format:options:", v8, 368, *MEMORY[0x1E4F1E270], v15, 360.0, 1.0);

  return v16;
}

- (float)createHueArray
{
  memset(v29, 0, sizeof(v29));
  [(PISmartBlackAndWhiteHDR *)self getNonNormalizedSettings:v29];
  uint64_t v2 = (float *)malloc_type_calloc(0x168uLL, 4uLL, 0x100004052888210uLL);
  uint64_t v3 = 0;
  int32x4_t v4 = (int32x4_t)xmmword_1A980B9F0;
  float32x4_t v22 = (float32x4_t)vdupq_n_s32(0x40C90FDBu);
  float32x4_t v23 = (float32x4_t)vdupq_n_s32(0x43B38000u);
  float32x4_t v20 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)((char *)v29 + 4), 0);
  float32x4_t v21 = (float32x4_t)vdupq_n_s32(0x3EE66666u);
  __asm { FMOV            V0.4S, #1.0 }
  float32x4_t v18 = _Q0;
  float32x4_t v19 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)((char *)v29 + 8), 0);
  __asm { FMOV            V0.4S, #3.0 }
  float32x4_t v17 = _Q0;
  do
  {
    int32x4_t v27 = v4;
    float32x4_t v11 = vmulq_f32(vsubq_f32(vdivq_f32(vcvtq_f32_s32(v4), v23), v20), v22);
    float64x2_t v28 = vcvtq_f64_f32(*(float32x2_t *)v11.f32);
    float64x2_t __x = vcvt_hight_f64_f32(v11);
    long double v25 = cos(__x.f64[1]);
    v12.f64[0] = cos(__x.f64[0]);
    v12.f64[1] = v25;
    float64x2_t v26 = v12;
    __x.f64[0] = cos(v28.f64[1]);
    v13.f64[0] = cos(v28.f64[0]);
    v13.f64[1] = __x.f64[0];
    float32x4_t v14 = vmlaq_f32(v18, vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v13), v26), v19);
    float32x4_t v15 = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v21, v14), (int8x16_t)v21, (int8x16_t)v14);
    *(int8x16_t *)&v2[v3] = vbslq_s8((int8x16_t)vcgtq_f32(v15, v17), (int8x16_t)v17, (int8x16_t)v15);
    v15.i64[0] = 0x400000004;
    v15.i64[1] = 0x400000004;
    int32x4_t v4 = vaddq_s32(v27, (int32x4_t)v15);
    v3 += 4;
  }
  while (v3 != 360);
  return v2;
}

- (void)getNonNormalizedSettings:(id *)a3
{
  a3->var0 = 1;
  [(NSNumber *)self->inputHue floatValue];
  a3->float var1 = v5;
  [(NSNumber *)self->inputStrength floatValue];
  a3->float var2 = v6;
  [(NSNumber *)self->inputNeutralGamma floatValue];
  a3->var3 = v7;
  [(NSNumber *)self->inputTone floatValue];
  float v28 = v8;
  a3->var4 = v8;
  float var1 = a3->var1;
  float var2 = a3->var2;
  double v11 = var2;
  double v12 = var2 * cos((float)(0.60167 - var1) * 6.28318531) + 1.0;
  if (v12 <= 1.0) {
    double v13 = v12 * -2.0 + 3.0;
  }
  else {
    double v13 = (v12 + -1.0) * -0.550000012 + 1.0;
  }
  float v14 = v13;
  float v15 = powf(0.3, v14);
  double v16 = v11 * cos((float)(0.8663 - var1) * 6.28318531) + 1.0;
  if (v16 <= 1.0) {
    double v17 = v16 * -2.0 + 3.0;
  }
  else {
    double v17 = (v16 + -1.0) * -0.550000012 + 1.0;
  }
  float v18 = v17;
  float v19 = powf(0.6, v18);
  double v20 = v11 * cos((float)(0.22284 - var1) * 6.28318531) + 1.0;
  if (v20 <= 1.0) {
    double v21 = v20 * -2.0 + 3.0;
  }
  else {
    double v21 = (v20 + -1.0) * -0.550000012 + 1.0;
  }
  float v22 = v21;
  float v23 = powf(0.1, v22);
  float v24 = v23 + (float)(v15 + v19);
  a3->var5[0] = v15 / v24;
  a3->var5[1] = v19 / v24;
  a3->var5[2] = v23 / v24;
  if (a3->var0)
  {
    a3->var0 = 0;
    float v25 = (float)(var1 * 0.5) + 0.35;
    if (v25 < 0.0) {
      float v25 = v25 + 1.0;
    }
    if (var2 <= 0.5) {
      float v26 = var2 * 0.8;
    }
    else {
      float v26 = (float)((float)(var2 + -0.5) * 1.2) + 0.4;
    }
    a3->float var1 = v25;
    a3->float var2 = v26;
    float v27 = v28 + v28;
    if (v28 <= 0.0) {
      float v27 = v28;
    }
    a3->var3 = a3->var3 + 1.0;
    a3->var4 = v27;
  }
}

@end