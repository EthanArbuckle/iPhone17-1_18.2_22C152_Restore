@interface PISmartColorFilterHDR
+ (id)customAttributes;
- (BOOL)_isIdentity;
- (CIImage)inputImage;
- (NSNumber)inputCast;
- (NSNumber)inputContrast;
- (NSNumber)inputVibrancy;
- (id)_kernelCNeg;
- (id)_kernelCPos;
- (id)_kernelCast;
- (id)_kernelV_gt1;
- (id)_kernelV_lt1;
- (id)outputImage;
- (void)setInputCast:(id)a3;
- (void)setInputContrast:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputVibrancy:(id)a3;
@end

@implementation PISmartColorFilterHDR

+ (id)customAttributes
{
  v32[4] = *MEMORY[0x1E4F143B8];
  v31[0] = *MEMORY[0x1E4F1E0B8];
  uint64_t v2 = *MEMORY[0x1E4F1E1C8];
  v30[0] = *MEMORY[0x1E4F1E1C0];
  v30[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1E180];
  v30[2] = *MEMORY[0x1E4F1E1B8];
  v30[3] = v3;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
  v32[0] = v17;
  v31[1] = @"inputVibrancy";
  uint64_t v5 = *MEMORY[0x1E4F1E0E8];
  v22[0] = *MEMORY[0x1E4F1E0D8];
  uint64_t v4 = v22[0];
  v22[1] = v5;
  v28[0] = &unk_1F000A3F8;
  v28[1] = &unk_1F000A3F8;
  uint64_t v7 = *MEMORY[0x1E4F1E0D0];
  uint64_t v23 = *MEMORY[0x1E4F1E0E0];
  uint64_t v6 = v23;
  uint64_t v24 = v7;
  v28[2] = &unk_1F000A408;
  v28[3] = &unk_1F000A418;
  uint64_t v9 = *MEMORY[0x1E4F1E0C8];
  uint64_t v25 = *MEMORY[0x1E4F1E098];
  uint64_t v8 = v25;
  uint64_t v26 = v9;
  v28[4] = &unk_1F000A428;
  v28[5] = &unk_1F000A428;
  uint64_t v27 = *MEMORY[0x1E4F1E0F0];
  uint64_t v10 = v27;
  uint64_t v29 = *MEMORY[0x1E4F1E158];
  uint64_t v11 = v29;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v22 count:7];
  v32[1] = v16;
  v31[2] = *MEMORY[0x1E4F1E458];
  v20[0] = v4;
  v20[1] = v5;
  v21[0] = &unk_1F000A3F8;
  v21[1] = &unk_1F000A3F8;
  v20[2] = v6;
  v20[3] = v7;
  v21[2] = &unk_1F000A408;
  v21[3] = &unk_1F000A418;
  v20[4] = v8;
  v20[5] = v9;
  v21[4] = &unk_1F000A428;
  v21[5] = &unk_1F000A428;
  v20[6] = v10;
  v21[6] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:7];
  v32[2] = v12;
  v31[3] = @"inputCast";
  v18[0] = v4;
  v18[1] = v5;
  v19[0] = &unk_1F000A3F8;
  v19[1] = &unk_1F000A3F8;
  v18[2] = v6;
  v18[3] = v7;
  v19[2] = &unk_1F000A408;
  v19[3] = &unk_1F000A408;
  v18[4] = v8;
  v18[5] = v9;
  v19[4] = &unk_1F000A428;
  v19[5] = &unk_1F000A428;
  v18[6] = v10;
  v19[6] = v11;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:7];
  v32[3] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:4];

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputCast, 0);
  objc_storeStrong((id *)&self->inputContrast, 0);
  objc_storeStrong((id *)&self->inputVibrancy, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

- (void)setInputCast:(id)a3
{
}

- (NSNumber)inputCast
{
  return self->inputCast;
}

- (void)setInputContrast:(id)a3
{
}

- (NSNumber)inputContrast
{
  return self->inputContrast;
}

- (void)setInputVibrancy:(id)a3
{
}

- (NSNumber)inputVibrancy
{
  return self->inputVibrancy;
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
  v84[2] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage)
  {
    uint64_t v3 = 0;
    goto LABEL_36;
  }
  if ([(PISmartColorFilterHDR *)self _isIdentity])
  {
    uint64_t v3 = self->inputImage;
    goto LABEL_36;
  }
  [(NSNumber *)self->inputVibrancy doubleValue];
  double v5 = fmin(fmax(v4, -1.0), 2.0);
  [(NSNumber *)self->inputContrast doubleValue];
  double v7 = fmin(fmax(v6, -1.0), 2.0);
  [(NSNumber *)self->inputCast doubleValue];
  float v9 = fmin(fmax(v8, -1.0), 1.0);
  uint64_t v10 = self->inputImage;
  uint64_t v3 = v10;
  if (fabs(v5) < 1.0e-10)
  {
    if (fabs(v7) < 1.0e-10)
    {
      if (fabsf(v9) < 1.0e-10) {
        goto LABEL_36;
      }
      int v13 = 1;
LABEL_23:
      if (v9 <= 0.0)
      {
        if (v9 > -0.5)
        {
          *(float *)&long long v11 = v9 * -2.0;
          float32x2_t v52 = (float32x2_t)0x3CA3D70ABD4CCCCDLL;
LABEL_28:
          *(float32x2_t *)&long long v11 = vmul_n_f32(v52, *(float *)&v11);
          long long v77 = v11;
          float v53 = 0.3;
          if (!v13) {
            goto LABEL_34;
          }
          goto LABEL_33;
        }
        float v54 = (float)(v9 + 0.5) * -2.0;
        float v55 = 1.0;
        float v56 = 1.0 - v54;
        *(float32x2_t *)&long long v12 = vmul_n_f32((float32x2_t)0xBCA3D70ABE0F5C29, v54);
        float32x2_t v57 = (float32x2_t)0x3CA3D70ABD4CCCCDLL;
      }
      else
      {
        if (v9 < 0.5)
        {
          *(float *)&long long v11 = v9 + v9;
          float32x2_t v52 = (float32x2_t)0xBD23D70A3DCCCCCDLL;
          goto LABEL_28;
        }
        float v54 = (float)(v9 + -0.5) + (float)(v9 + -0.5);
        float v55 = 1.0;
        float v56 = 1.0 - v54;
        *(float32x2_t *)&long long v12 = vmul_n_f32((float32x2_t)0x3C23D70A3E3851ECLL, v54);
        float32x2_t v57 = (float32x2_t)0xBD23D70A3DCCCCCDLL;
      }
      *(float32x2_t *)&long long v12 = vmla_n_f32(*(float32x2_t *)&v12, v57, v56);
      long long v77 = v12;
      float v53 = (float)(v55 + (float)(v54 * -0.6)) * 0.3;
      if (!v13)
      {
LABEL_34:
        v59 = [(PISmartColorFilterHDR *)self _kernelCast];
        [(CIImage *)v3 extent];
        double v61 = v60;
        double v63 = v62;
        double v65 = v64;
        double v67 = v66;
        v79[0] = v3;
        v79[1] = &unk_1F000A418;
        v68 = [NSNumber numberWithFloat:v78];
        v79[2] = v68;
        HIDWORD(v69) = HIDWORD(v78);
        LODWORD(v69) = HIDWORD(v78);
        v70 = [NSNumber numberWithFloat:v69];
        v79[3] = v70;
        *(float *)&double v71 = v53;
        v72 = [NSNumber numberWithFloat:v71];
        v79[4] = v72;
        v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:5];
        uint64_t v74 = objc_msgSend(v59, "applyWithExtent:arguments:", v73, v61, v63, v65, v67);

        uint64_t v3 = (CIImage *)v74;
        goto LABEL_35;
      }
LABEL_33:
      uint64_t v58 = [(CIImage *)v3 imageByUnpremultiplyingAlpha];

      uint64_t v3 = (CIImage *)v58;
      goto LABEL_34;
    }
    uint64_t v16 = [(CIImage *)v10 imageByUnpremultiplyingAlpha];

    uint64_t v3 = (CIImage *)v16;
    goto LABEL_17;
  }
  if (v5 <= 0.0) {
    double v14 = v5 + 1.0;
  }
  else {
    double v14 = v5 * 3.0 + 1.0;
  }
  v15 = [(CIImage *)v10 imageByUnpremultiplyingAlpha];

  if (v14 >= 1.0) {
    [(PISmartColorFilterHDR *)self _kernelV_gt1];
  }
  else {
  v17 = [(PISmartColorFilterHDR *)self _kernelV_lt1];
  }
  [v15 extent];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  v84[0] = v15;
  uint64_t v26 = [NSNumber numberWithDouble:v14];
  v84[1] = v26;
  uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:2];
  objc_msgSend(v17, "applyWithExtent:arguments:", v27, v19, v21, v23, v25);
  uint64_t v3 = (CIImage *)objc_claimAutoreleasedReturnValue();

  if (fabs(v7) >= 1.0e-10)
  {
LABEL_17:
    double v28 = v7 + v7;
    if (v7 + v7 <= 0.0)
    {
      v81 = @"inputAmount";
      v41 = objc_msgSend(NSNumber, "numberWithDouble:", fmax(v28 / 6.0, -0.4));
      v82 = v41;
      v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
      v43 = [(CIImage *)v3 imageByApplyingFilter:@"CIVibrance" withInputParameters:v42];

      uint64_t v29 = [(PISmartColorFilterHDR *)self _kernelCNeg];
      [(CIImage *)v43 extent];
      double v45 = v44;
      double v47 = v46;
      double v49 = v48;
      double v51 = v50;
      v80[0] = v43;
      v38 = [NSNumber numberWithDouble:-v28];
      v80[1] = v38;
      v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:2];
      uint64_t v40 = objc_msgSend(v29, "applyWithExtent:arguments:", v39, v45, v47, v49, v51);
      uint64_t v3 = v43;
    }
    else
    {
      uint64_t v29 = [(PISmartColorFilterHDR *)self _kernelCPos];
      [(CIImage *)v3 extent];
      double v31 = v30;
      double v33 = v32;
      double v35 = v34;
      double v37 = v36;
      v83[0] = v3;
      v38 = [NSNumber numberWithDouble:v7 + v7];
      v83[1] = v38;
      v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:2];
      uint64_t v40 = objc_msgSend(v29, "applyWithExtent:arguments:", v39, v31, v33, v35, v37);
    }

    uint64_t v3 = (CIImage *)v40;
  }
  if (fabsf(v9) >= 1.0e-10)
  {
    int v13 = 0;
    goto LABEL_23;
  }
LABEL_35:
  uint64_t v75 = [(CIImage *)v3 imageByPremultiplyingAlpha];

  uint64_t v3 = (CIImage *)v75;
LABEL_36:
  return v3;
}

- (id)_kernelCast
{
  if (_kernelCast_once != -1) {
    dispatch_once(&_kernelCast_once, &__block_literal_global_48_7760);
  }
  uint64_t v2 = (void *)_kernelCast_singleton;
  return v2;
}

uint64_t __36__PISmartColorFilterHDR__kernelCast__block_invoke()
{
  _kernelCast_singleton = [MEMORY[0x1E4F1E010] kernelWithString:@"kernel vec4 _smartcolor_cast_HDR (__sample im, float lum, float grayI, float grayQ, float strength) \n { \n vec4 pix = clamp(im, 0.0, 1.0) \n pix.rgb = pow(pix.rgb, vec3(.25)); \n pix.rgb = pix.r * vec3(0.299, 0.595716, 0.211456) + \n pix.g * vec3(0.587, -0.274453, -0.522591) + \n pix.b * vec3(0.114, -0.321263, 0.311135); \n vec2 grayOffset = vec2(grayI, grayQ) ; \n vec3 result = pix.rgb; \n float newStrength = 1.0 + (strength-1.0)*(1.0-pix.r) ; \n result.gb = pix.gb + newStrength*grayOffset ; \n float damp = max(min(1.0, pix.r/(lum+0.00001)),0.0) ; \n result.rgb = mix(pix.rgb, result.rgb, damp) ; \n pix.rgb = result.r * vec3(1.0) + \n result.g * vec3(0.956296, -0.272122, -1.10699) + \n result.b * vec3(0.621024, -0.647381, 1.70461); \n pix.rgb = clamp(pix.rgb, 0.0, 1.0); \n pix.rgb *= pix.rgb*pix.rgb*pix.rgb; \n pix.rgb += min(im.rgb, 0.0) + max(im.rgb,1.0) -1.0; \n return pix; \n }"];;
  return MEMORY[0x1F41817F8]();
}

- (id)_kernelV_lt1
{
  if (_kernelV_lt1_once != -1) {
    dispatch_once(&_kernelV_lt1_once, &__block_literal_global_43);
  }
  uint64_t v2 = (void *)_kernelV_lt1_singleton;
  return v2;
}

uint64_t __37__PISmartColorFilterHDR__kernelV_lt1__block_invoke()
{
  _kernelV_lt1_singleton = [MEMORY[0x1E4F1E010] kernelWithString:@"kernel vec4 _smartcolor_vibrancy_lt1_HDR (__sample im, float amt) \n { \n float gray = dot(im.rgb, vec3(0.333333)) \n im.rgb = mix(vec3(gray), im.rgb, amt); \n return im; \n }"];;
  return MEMORY[0x1F41817F8]();
}

- (id)_kernelV_gt1
{
  if (_kernelV_gt1_once != -1) {
    dispatch_once(&_kernelV_gt1_once, &__block_literal_global_38);
  }
  uint64_t v2 = (void *)_kernelV_gt1_singleton;
  return v2;
}

uint64_t __37__PISmartColorFilterHDR__kernelV_gt1__block_invoke()
{
  _kernelV_gt1_singleton = [MEMORY[0x1E4F1E010] kernelWithString:@"kernel vec4 _smartcolor_vibrancy_gt1_HDR (__sample im, float amt) \n { \n float gray = dot(clamp(im.rgb, 0.0, 1.0), vec3(.3, .5, .2)) \n float y = dot(clamp(im.rgb, 0.0, 1.0), vec3(.4, .2, .1)); \n float damp = 1.0-4.0*y*(1.0-y); \n float s = 1.0/(im.r+im.g+im.b); \n float r = im.r*s; \n float b = im.b*s; \n float d = 1.0-.8*smoothstep(0.2, 0.4, r-b); \n damp *= d; \n damp = amt > 2.5 ? min(damp+(amt-2.5)/5.0, 1.0) : damp; \n float sat = min(amt, 3.0); \n vec4 result; \n result.rgb = (im.rgb - gray)*sat + gray; \n result.rgb = mix(im.rgb, result.rgb, damp); \n result.a = im.a; \n return result; \n }"];;
  return MEMORY[0x1F41817F8]();
}

- (id)_kernelCNeg
{
  if (_kernelCNeg_once != -1) {
    dispatch_once(&_kernelCNeg_once, &__block_literal_global_33_7772);
  }
  uint64_t v2 = (void *)_kernelCNeg_singleton;
  return v2;
}

uint64_t __36__PISmartColorFilterHDR__kernelCNeg__block_invoke()
{
  _kernelCNeg_singleton = [MEMORY[0x1E4F1E010] kernelWithString:@"kernel vec4 _smartcolor_contrast_darken_HDR (__sample im, float amt) \n { \n vec3 diff = im.rgb-dot(im.rgb, vec3(.0, .3, .5)) \n float dist = distance(diff, vec3(0.0)); \n dist = smoothstep(0.0, 1.0, dist); \n float strength = 5.0*dist*amt; \n vec3 pos = max(im.rgb, 1.0)-1.0 + min(im.rgb, 0.0); \n im.rgb = clamp(im.rgb, 0.0, 1.0); \n strength *= (im.b-im.g); \n float gray = 1.0-min(dot(im.rgb, vec3(0.5, 0.7, -0.20)), 1.0); \n vec4 result; \n result.rgb = strength < 0.0 ? pow(im.rgb, vec3(1.0-strength*gray)) : im.rgb/(strength+1.0-(im.rgb*strength)); \n result.rgb += pos; result.a = im.a; \n return result; \n }"];;
  return MEMORY[0x1F41817F8]();
}

- (id)_kernelCPos
{
  if (_kernelCPos_once != -1) {
    dispatch_once(&_kernelCPos_once, &__block_literal_global_7777);
  }
  uint64_t v2 = (void *)_kernelCPos_singleton;
  return v2;
}

uint64_t __36__PISmartColorFilterHDR__kernelCPos__block_invoke()
{
  _kernelCPos_singleton = [MEMORY[0x1E4F1E010] kernelWithString:@"kernel vec4 _smartcolor_contrast_HDR (__sample im, float amt) \n { \n vec3 diff = im.rgb-dot(im.rgb, vec3(.0, .3, .5)) \n float dist = distance(diff, vec3(0.0)); \n dist = smoothstep(0.0, 1.0, dist); \n float strength = 5.0*dist*amt; \n vec3 pos = max(im.rgb, 1.0)-1.0 + min(im.rgb, 0.0); \n im.rgb = clamp(im.rgb, 0.0, 1.0); \n strength *= (im.b-im.g); \n strength = max(strength, -0.35); \n vec4 result; \n result.rgb = im.rgb/(strength + 1.0 - (im.rgb*strength)) + pos; \n result.a = im.a; \n return result; \n }"];;
  return MEMORY[0x1F41817F8]();
}

- (BOOL)_isIdentity
{
  [(NSNumber *)self->inputVibrancy doubleValue];
  double v4 = v3;
  [(NSNumber *)self->inputContrast doubleValue];
  double v6 = v5;
  [(NSNumber *)self->inputCast doubleValue];
  BOOL result = 0;
  if (fabs(v4) < 1.0e-10 && fabs(v6) < 1.0e-10) {
    return fabs(v7) < 1.0e-10;
  }
  return result;
}

@end