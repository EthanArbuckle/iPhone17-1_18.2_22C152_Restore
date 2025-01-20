@interface NUHDRApplyGainMapFilter
+ (id)flexRangeGainMapApplyKernel;
+ (id)flexRangeGainMapApplyRGBKernel;
+ (id)meteorPlusGainMapApplyKernel;
- (CIImage)inputGainMap;
- (CIImage)inputImage;
- (NSNumber)inputHeadroom;
- (NUColorSpace)inputColorSpace;
- (NUFlexRangeProperties)flexRangeProperties;
- (id)outputImage;
- (void)setFlexRangeProperties:(id)a3;
- (void)setInputColorSpace:(id)a3;
- (void)setInputGainMap:(id)a3;
- (void)setInputHeadroom:(id)a3;
- (void)setInputImage:(id)a3;
@end

@implementation NUHDRApplyGainMapFilter

+ (id)flexRangeGainMapApplyRGBKernel
{
  if (flexRangeGainMapApplyRGBKernel_once != -1) {
    dispatch_once(&flexRangeGainMapApplyRGBKernel_once, &__block_literal_global_61);
  }
  v2 = (void *)flexRangeGainMapApplyRGBKernel_s_flexRangeGainMapApplyRGBKernel;

  return v2;
}

uint64_t __57__NUHDRApplyGainMapFilter_flexRangeGainMapApplyRGBKernel__block_invoke()
{
  flexRangeGainMapApplyRGBKernel_s_flexRangeGainMapApplyRGBKernel = [MEMORY[0x1E4F1E010] kernelWithString:@"vec3 s_pow(vec3 x, vec3 g) {  vec3 a = max(abs(x), 1e-6) \n  return sign(x) * pow(a, g); \n}kernel vec4 flx_gain_apply_rgb(__sample im, __sample gm, vec3 a, vec3 b, vec3 g, vec3 s, vec3 kx, vec3 ky) \n{ \n  vec3 gainLog2 = a * s_pow(gm.rgb, g) + b; \n  vec3 gainLin = exp2(s * gainLog2); \n  vec3 rgb = gainLin * (im.rgb + kx) - ky; \n  return vec4(rgb, 1.0); \n}\n"];;

  return MEMORY[0x1F41817F8]();
}

+ (id)flexRangeGainMapApplyKernel
{
  if (flexRangeGainMapApplyKernel_once != -1) {
    dispatch_once(&flexRangeGainMapApplyKernel_once, &__block_literal_global_56);
  }
  v2 = (void *)flexRangeGainMapApplyKernel_s_flexRangeGainMapApplyKernel;

  return v2;
}

uint64_t __54__NUHDRApplyGainMapFilter_flexRangeGainMapApplyKernel__block_invoke()
{
  flexRangeGainMapApplyKernel_s_flexRangeGainMapApplyKernel = [MEMORY[0x1E4F1E010] kernelWithString:@"float s_pow(float x, float g) {  float a = max(abs(x), 1e-6) \n  return sign(x) * pow(a, g); \n}kernel vec4 flx_gain_apply(__sample im, __sample gm, vec4 p, vec2 k) \n{ \n  float gainLog2 = p.x * s_pow(gm.r, p.y) + p.z; \n  float gainLin = exp2(p.w * gainLog2); \n  vec3 rgb = gainLin * (im.rgb + k.x) - k.y; \n  return vec4(rgb, 1.0); \n}\n"];;

  return MEMORY[0x1F41817F8]();
}

+ (id)meteorPlusGainMapApplyKernel
{
  if (meteorPlusGainMapApplyKernel_once != -1) {
    dispatch_once(&meteorPlusGainMapApplyKernel_once, &__block_literal_global_9772);
  }
  v2 = (void *)meteorPlusGainMapApplyKernel_s_meteorPlusGainMapApplyKernel;

  return v2;
}

uint64_t __55__NUHDRApplyGainMapFilter_meteorPlusGainMapApplyKernel__block_invoke()
{
  meteorPlusGainMapApplyKernel_s_meteorPlusGainMapApplyKernel = [MEMORY[0x1E4F1E010] kernelWithString:@"kernel vec4 mpp_gain_apply(__sample im, __sample gm, float h) \n{ \n  float gain = 1.0 + (h - 1.0) * gm.r \n  float3 rgb = gain * im.rgb; \n  return vec4(rgb, 1.0); \n}\n"];;

  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flexRangeProperties, 0);
  objc_storeStrong((id *)&self->_inputColorSpace, 0);
  objc_storeStrong((id *)&self->_inputHeadroom, 0);
  objc_storeStrong((id *)&self->_inputGainMap, 0);

  objc_storeStrong((id *)&self->_inputImage, 0);
}

- (void)setFlexRangeProperties:(id)a3
{
}

- (NUFlexRangeProperties)flexRangeProperties
{
  return self->_flexRangeProperties;
}

- (void)setInputColorSpace:(id)a3
{
}

- (NUColorSpace)inputColorSpace
{
  return self->_inputColorSpace;
}

- (void)setInputHeadroom:(id)a3
{
}

- (NSNumber)inputHeadroom
{
  return self->_inputHeadroom;
}

- (void)setInputGainMap:(id)a3
{
}

- (CIImage)inputGainMap
{
  return self->_inputGainMap;
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
  v125[8] = *MEMORY[0x1E4F143B8];
  id v3 = [(NUHDRApplyGainMapFilter *)self inputImage];
  uint64_t v4 = [(NUHDRApplyGainMapFilter *)self inputGainMap];
  v5 = (void *)v4;
  v6 = 0;
  if (v3 && v4)
  {
    v7 = [(NUHDRApplyGainMapFilter *)self inputHeadroom];
    [v7 floatValue];
    float v9 = fmaxf(v8, 1.0);

    v10 = [(NUHDRApplyGainMapFilter *)self inputColorSpace];
    v11 = [v10 linearized];
    v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = +[NUColorSpace displayP3LinearColorSpace];
    }
    v14 = v13;
    float v15 = fminf(v9, 16.0);

    v16 = objc_msgSend(v3, "imageByColorMatchingWorkingSpaceToColorSpace:", objc_msgSend(v14, "CGColorSpace"));

    v17 = [v16 _imageByClampingAlpha];

    [v17 extent];
    double v19 = v18;
    double v21 = v20;
    [v5 extent];
    CGAffineTransformMakeScale(&v122, v19 / v22, v21 / v23);
    v121 = [v5 imageByApplyingTransform:&v122];
    v24 = [(NUHDRApplyGainMapFilter *)self flexRangeProperties];
    if (v24)
    {
      v120 = v5;
      float v25 = log2f(v15);
      [v24 baseHeadroom];
      float v27 = v26;
      [v24 alternateHeadroom];
      float v29 = fminf(fmaxf((float)(v25 - v27) / (float)(v28 - v27), 0.0), 1.0);
      if (v25 <= v27) {
        float v30 = -v29;
      }
      else {
        float v30 = v29;
      }
      v31 = [(NUHDRApplyGainMapFilter *)self flexRangeProperties];
      v32 = [v31 channelInfo];

      v33 = v32;
      if ([v32 count] == 3)
      {
        v114 = v32;
        v34 = [v32 objectAtIndexedSubscript:0];
        v35 = [v32 objectAtIndexedSubscript:1];
        v36 = [v32 objectAtIndexedSubscript:2];
        [v34 gamma];
        float v118 = v37;
        [v35 gamma];
        float v116 = v38;
        [v36 gamma];
        float v112 = v39;
        [v34 min];
        float v41 = v40;
        [v35 min];
        float v43 = v42;
        [v36 min];
        float v45 = v44;
        [v34 max];
        float v47 = v46;
        [v35 max];
        float v110 = v30;
        float v49 = v48;
        [v36 max];
        float v51 = v50;
        [v34 baseOffset];
        float v109 = v52;
        [v35 baseOffset];
        float v107 = v53;
        [v36 baseOffset];
        float v105 = v54;
        [v34 alternateOffset];
        float v108 = v55;
        [v35 alternateOffset];
        float v106 = v56;
        [v36 alternateOffset];
        float v58 = v57;
        v115 = v24;
        uint64_t v59 = [MEMORY[0x1E4F1E080] vectorWithX:(float)(v47 - v41) Y:(float)(v49 - v43) Z:(float)(v51 - v45)];
        uint64_t v104 = [MEMORY[0x1E4F1E080] vectorWithX:v41 Y:v43 Z:v45];
        uint64_t v113 = [MEMORY[0x1E4F1E080] vectorWithX:(float)(1.0 / v118) Y:(float)(1.0 / v116) Z:(float)(1.0 / v112)];
        v111 = [MEMORY[0x1E4F1E080] vectorWithX:v110 Y:v110 Z:v110];
        v60 = [MEMORY[0x1E4F1E080] vectorWithX:v109 Y:v107 Z:v105];
        v61 = [MEMORY[0x1E4F1E080] vectorWithX:v108 Y:v106 Z:v58];
        [(id)objc_opt_class() flexRangeGainMapApplyRGBKernel];
        v62 = v117 = v14;
        [v17 extent];
        double v64 = v63;
        double v66 = v65;
        double v68 = v67;
        double v70 = v69;
        v125[0] = v17;
        v125[1] = v121;
        v119 = (void *)v59;
        v125[2] = v59;
        v71 = (void *)v104;
        v125[3] = v104;
        v125[4] = v113;
        v125[5] = v111;
        v125[6] = v60;
        v125[7] = v61;
        v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:v125 count:8];
        v73 = objc_msgSend(v62, "applyWithExtent:arguments:", v72, v64, v66, v68, v70);

        v33 = v114;
        v14 = v117;

        v24 = v115;
        v17 = (void *)v113;
      }
      else
      {
        v34 = [v32 firstObject];
        [v34 gamma];
        float v84 = v83;
        [v34 min];
        float v86 = v85;
        [v34 max];
        float v88 = v87;
        [v34 baseOffset];
        float v90 = v89;
        [v34 alternateOffset];
        float v92 = v91;
        v35 = [MEMORY[0x1E4F1E080] vectorWithX:(float)(v88 - v86) Y:(float)(1.0 / v84) Z:v86 W:v30];
        v36 = [MEMORY[0x1E4F1E080] vectorWithX:v90 Y:v92];
        v93 = [(id)objc_opt_class() flexRangeGainMapApplyKernel];
        [v17 extent];
        double v95 = v94;
        double v97 = v96;
        double v99 = v98;
        double v101 = v100;
        v124[0] = v17;
        v124[1] = v121;
        v124[2] = v35;
        v124[3] = v36;
        [MEMORY[0x1E4F1C978] arrayWithObjects:v124 count:4];
        v71 = v119 = v93;
        v73 = objc_msgSend(v93, "applyWithExtent:arguments:", v95, v97, v99, v101);
      }

      v17 = v36;
      v5 = v120;
    }
    else
    {
      v74 = [(id)objc_opt_class() meteorPlusGainMapApplyKernel];
      [v17 extent];
      double v76 = v75;
      double v78 = v77;
      double v80 = v79;
      double v82 = v81;
      v123[0] = v17;
      v123[1] = v121;
      *(float *)&double v75 = v15;
      v34 = [NSNumber numberWithFloat:v75];
      v123[2] = v34;
      v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v123 count:3];
      v33 = v74;
      v73 = objc_msgSend(v74, "applyWithExtent:arguments:", v35, v76, v78, v80, v82);
    }

    v102 = objc_msgSend(v73, "imageByColorMatchingColorSpaceToWorkingSpace:", objc_msgSend(v14, "CGColorSpace"));

    id v3 = v102;
    v6 = v3;
  }

  return v6;
}

@end