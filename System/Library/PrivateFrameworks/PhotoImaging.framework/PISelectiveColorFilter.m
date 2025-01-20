@interface PISelectiveColorFilter
+ (double)iptHueAngleFromRed:(double)a3 green:(double)a4 blue:(double)a5;
+ (float)hueAngleFrom:(const float *)a3;
+ (id)convertFromIPT:(id)a3;
+ (id)convertToIPT:(id)a3;
+ (id)selectiveColorKernels;
+ (void)iptFromLinearInto:(float *)a3 fromRed:(float)a4 green:(float)a5 blue:(float)a6;
- (CIImage)inputImage;
- (NSArray)inputCorrections;
- (id)hueSatLumTable;
- (id)outputImage;
- (void)setInputCorrections:(id)a3;
- (void)setInputImage:(id)a3;
@end

@implementation PISelectiveColorFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputCorrections, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

- (void)setInputCorrections:(id)a3
{
}

- (NSArray)inputCorrections
{
  return self->_inputCorrections;
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
  v20[2] = *MEMORY[0x1E4F143B8];
  v3 = self->_inputImage;
  v4 = +[PISelectiveColorFilter convertToIPT:v3];

  v5 = [(PISelectiveColorFilter *)self hueSatLumTable];
  v6 = +[PISelectiveColorFilter selectiveColorKernels];
  v7 = [v6 objectForKeyedSubscript:@"iptLumHueSatTable"];

  [v4 extent];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v20[0] = v4;
  v20[1] = v5;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  v17 = objc_msgSend(v7, "applyWithExtent:roiCallback:arguments:options:", &__block_literal_global_56_24306, v16, 0, v9, v11, v13, v15);

  v18 = +[PISelectiveColorFilter convertFromIPT:v17];

  return v18;
}

double __37__PISelectiveColorFilter_outputImage__block_invoke(uint64_t a1, int a2)
{
  if (a2 > 0) {
    return 0.0;
  }
  return result;
}

- (id)hueSatLumTable
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  CGColorSpaceRef v3 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC88]);
  v4 = [MEMORY[0x1E4F1E040] filterWithName:@"CIConstantColorGenerator"];
  v52 = v3;
  v5 = [MEMORY[0x1E4F1E008] colorWithRed:v3 green:0.0 blue:0.0 alpha:0.0 colorSpace:1.0];
  [v4 setValue:v5 forKey:@"inputColor"];

  v53 = v4;
  v6 = [v4 outputImage];
  v7 = objc_msgSend(v6, "imageByCroppingToRect:", 0.0, 0.0);

  double v8 = +[PISelectiveColorFilter selectiveColorKernels];
  v55 = [v8 objectForKeyedSubscript:@"add_gaussian"];

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  obj = self->_inputCorrections;
  uint64_t v57 = [(NSArray *)obj countByEnumeratingWithState:&v60 objects:v65 count:16];
  if (v57)
  {
    uint64_t v56 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v57; ++i)
      {
        if (*(void *)v61 != v56) {
          objc_enumerationMutation(obj);
        }
        double v10 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        double v11 = [v10 objectForKeyedSubscript:@"red"];
        double v12 = [v10 objectForKeyedSubscript:@"green"];
        double v13 = [v10 objectForKeyedSubscript:@"blue"];
        double v14 = [v10 objectForKeyedSubscript:@"spread"];
        double v15 = [v10 objectForKeyedSubscript:@"hueShift"];
        v16 = [v10 objectForKeyedSubscript:@"saturation"];
        v17 = [v10 objectForKeyedSubscript:@"luminance"];
        [v14 doubleValue];
        double v19 = v18;
        [v15 doubleValue];
        if (v20 != 0.0
          || ([v16 doubleValue], v21 != 0.0)
          || ([v17 doubleValue], v22 != 0.0))
        {
          [v7 extent];
          double v24 = v23;
          double v26 = v25;
          double v28 = v27;
          double v30 = v29;
          v64[0] = v7;
          v64[1] = &unk_1F000A968;
          v64[2] = v15;
          v64[3] = v16;
          v64[4] = v17;
          v58 = v17;
          v59 = v16;
          v31 = v13;
          v32 = v12;
          v33 = NSNumber;
          v34 = v14;
          [v11 doubleValue];
          double v36 = v35;
          [v12 doubleValue];
          double v38 = v37;
          [v31 doubleValue];
          +[PISelectiveColorFilter iptHueAngleFromRed:v36 green:v38 blue:v39];
          v40 = objc_msgSend(v33, "numberWithDouble:");
          v64[5] = v40;
          double v41 = 0.00000000833333333;
          if (v19 >= 0.0000001) {
            double v41 = v19 * 0.0833333333;
          }
          v42 = [NSNumber numberWithDouble:v41 * v41];
          v64[6] = v42;
          v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:7];
          uint64_t v44 = objc_msgSend(v55, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_20, v43, v24, v26, v28, v30);
          v45 = v7;
          v7 = (void *)v44;

          double v12 = v32;
          double v13 = v31;
          v17 = v58;

          double v14 = v34;
          v16 = v59;
        }
      }
      uint64_t v57 = [(NSArray *)obj countByEnumeratingWithState:&v60 objects:v65 count:16];
    }
    while (v57);
  }

  v46 = [MEMORY[0x1E4F1E008] colorWithRed:v52 green:0.0 blue:1.0 alpha:1.0 colorSpace:1.0];
  [v53 setValue:v46 forKey:@"inputColor"];

  v47 = [MEMORY[0x1E4F1E040] filterWithName:@"CIAdditionCompositing"];
  [v47 setValue:v7 forKey:@"inputBackgroundImage"];
  v48 = [v53 outputImage];
  [v47 setValue:v48 forKey:@"inputImage"];

  v49 = [v47 outputImage];

  v50 = objc_msgSend(v49, "imageByCroppingToRect:", 0.0, 0.0, 360.0, 1.0);

  CGColorSpaceRelease(v52);
  return v50;
}

double __40__PISelectiveColorFilter_hueSatLumTable__block_invoke()
{
  return 0.0;
}

+ (id)convertFromIPT:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1DBE0];
  id v4 = a3;
  v5 = CGColorSpaceCreateWithName(v3);
  v6 = +[PISelectiveColorFilter selectiveColorKernels];
  v7 = [v6 objectForKeyedSubscript:@"iptToSRGB"];

  [v4 extent];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v20[0] = v4;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];

  v17 = objc_msgSend(v7, "applyWithExtent:arguments:", v16, v9, v11, v13, v15);

  double v18 = [v17 imageByColorMatchingColorSpaceToWorkingSpace:v5];

  CGColorSpaceRelease(v5);
  return v18;
}

+ (id)convertToIPT:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1DBE0];
  id v4 = a3;
  v5 = CGColorSpaceCreateWithName(v3);
  v6 = [v4 imageByColorMatchingWorkingSpaceToColorSpace:v5];

  v7 = +[PISelectiveColorFilter selectiveColorKernels];
  double v8 = [v7 objectForKeyedSubscript:@"srgbToIPT"];

  [v6 extent];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v20[0] = v6;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  double v18 = objc_msgSend(v8, "applyWithExtent:arguments:", v17, v10, v12, v14, v16);

  CGColorSpaceRelease(v5);
  return v18;
}

+ (id)selectiveColorKernels
{
  if (selectiveColorKernels_onceToken != -1) {
    dispatch_once(&selectiveColorKernels_onceToken, &__block_literal_global_24372);
  }
  v2 = (void *)selectiveColorKernels_selectiveColorKernels;
  return v2;
}

uint64_t __47__PISelectiveColorFilter_selectiveColorKernels__block_invoke()
{
  v0 = [MEMORY[0x1E4F1E058] kernelsDictionaryWithString:@"kernel vec4 iptLumHueSatTable(sampler image, __table sampler hueSatLumTable)\n{\nvec4 im = sample(image, samplerCoord(image)) \nvec4 double result = im;\nfloat hue = atan(im.b, im.g);\nfloat hueIdx = 359.0 * 0.5 * (hue/3.1416 + 1.0);\nhueIdx = clamp(hueIdx, 0.0, 359.0) + 0.5;\nfloat hueChange = (sample(hueSatLumTable, samplerTransform(hueSatLumTable, vec2(hueIdx,0.5))).r);\nfloat satChange = (sample(hueSatLumTable, samplerTransform(hueSatLumTable, vec2(hueIdx,0.5))).g);\nfloat lumChange = (sample(hueSatLumTable, samplerTransform(hueSatLumTable, vec2(hueIdx,0.5))).b);\nfloat chroma = sqrt(im.g*im.g+im.b*im.b) ;\nchroma *= satChange ;\nhue += hueChange ;\nvec3 adjustIm = im.rgb;\nfloat hueAngle = hue  ;\nlumChange = mix(1.0, lumChange, clamp(chroma,-0.7,0.7));\nadjustIm.r *= lumChange;\nadjustIm.g = chroma * cos(hueAngle) ;\nadjustIm.b = chroma * sin(hueAngle) ;\nresult.rgb = adjustIm.rgb;\nresult.a = im.a ;\nreturn result ;\n}\nkernel vec4 srgbToIPT(sampler image){\nvec4 im = sample(image, samplerCoord(image));\nvec3 lms, ipt;\nlms = im.r * vec3(0.3139902162, 0.155372406, 0.017752387) +\nim.g * vec3(0.6395129383, 0.7578944616, 0.109442094) +\nim.b * vec3(0.0464975462, 0.0867014186, 0.8725692246);\nlms = sign(lms)*pow(abs(lms), vec3(0.43, 0.43, 0.43));\nipt = lms.r * vec3(0.4, 4.455, 0.8056) +\nlms.g * vec3(0.4, -4.851, 0.3572) +\nlms.b * vec3(0.2, 0.3960, -1.1628);\nreturn vec4(ipt, im.a);\n}\nkernel vec4 iptToSRGB(sampler image){\nvec4 im = sample(image, samplerCoord(image));\nvec3 lms, rgb;\nlms = im.rrr +\nim.g * vec3(0.09756893,-0.11387649,0.03261511) +\nim.b * vec3(0.20522644, 0.13321716, -0.67688718);\nlms = sign(lms)*pow(abs(lms), vec3(1.0/.43));\nrgb = lms.r * vec3( 5.472212058380287, -1.125241895533569, 0.029801651173470) +\nlms.g * vec3(-4.641960098354470, 2.293170938060623, -0.193180728257140) +\nlms.b * vec3(0.169637076827974, -0.167895202223709, 1.163647892783812);\nreturn vec4(rgb, im.a);\n}\nkernel vec4 add_gaussian(sampler srcTable, float tableSize, float hueAmplitude, float satAmplitude, float lumAmplitude, float gaussX, float gaussSigmaSquared) {\nvec2 d = destCoord();\nvec4 src = sample(srcTable, samplerCoord(srcTable));\nfloat x = d.x / (tableSize - 1.0);\nfloat dist = min(min(abs(x - gaussX), abs(x - 1.0 - gaussX)), abs(x + 1.0 - gaussX));\nfloat p = -((dist * dist) / (2.0 * gaussSigmaSquared));\nfloat ep = exp(p);\nfloat hue = hueAmplitude * ep;\nfloat sat = satAmplitude * ep;\nfloat lum = lumAmplitude * ep;\nfloat h = clamp(src.r + hue, -1.0, 1.0);\nfloat s = clamp(src.g + sat, -1.0, 1.0);\nfloat l = clamp(src.b + lum, -1.0, 1.0);\nreturn vec4(h,s,l,1.0);\n}\n\n"];;
  uint64_t v1 = selectiveColorKernels_selectiveColorKernels;
  selectiveColorKernels_selectiveColorKernels = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (double)iptHueAngleFromRed:(double)a3 green:(double)a4 blue:(double)a5
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  *(float *)&a3 = a3;
  *(float *)&a4 = a4;
  *(float *)&a5 = a5;
  [a1 iptFromLinearInto:v8 fromRed:a3 green:a4 blue:a5];
  [a1 hueAngleFrom:v8];
  return v6;
}

+ (float)hueAngleFrom:(const float *)a3
{
  float v3 = atan2(a3[2], a3[1]) / 6.28318531;
  return v3 + 0.5;
}

+ (void)iptFromLinearInto:(float *)a3 fromRed:(float)a4 green:(float)a5 blue:(float)a6
{
  uint64_t v7 = 0;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  double v8 = (float *)&dword_1A980BE94;
  do
  {
    float v9 = (float)(*(v8 - 1) * a5) + (float)(*(v8 - 2) * a4);
    float v10 = *v8;
    v8 += 3;
    *(float *)((char *)&v23 + v7) = v9 + (float)(v10 * a6);
    v7 += 4;
  }
  while (v7 != 12);
  uint64_t v11 = 0;
  uint64_t v21 = v23;
  float v22 = v24;
  do
  {
    float v12 = *(float *)((char *)&v21 + v11);
    float v13 = powf(fabsf(v12), 0.43);
    if (v12 < 0.0) {
      float v13 = -v13;
    }
    *(float *)((char *)&v21 + v11) = v13;
    v11 += 4;
  }
  while (v11 != 12);
  uint64_t v14 = 0;
  uint64_t v15 = v21;
  double v16 = (float *)&dword_1A980BEB8;
  float v17 = v22;
  do
  {
    float v18 = (float)(*((float *)&v15 + 1) * *(v16 - 1)) + (float)(*(v16 - 2) * *(float *)&v15);
    float v19 = *v16;
    v16 += 3;
    *(float *)((char *)&v23 + v14) = v18 + (float)(v19 * v17);
    v14 += 4;
  }
  while (v14 != 12);
  float v20 = v24;
  *(void *)a3 = v23;
  a3[2] = v20;
}

@end