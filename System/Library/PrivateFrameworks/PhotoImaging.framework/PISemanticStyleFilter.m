@interface PISemanticStyleFilter
+ (id)CMISmartStyleTuningParameterVariantFromKey:(id)a3;
+ (id)_computeAlphaAwareHistogramForImage:(id)a3 context:(id)a4 colorSpace:(CGColorSpace *)a5 error:(id *)a6;
+ (id)_computeSmartToneStatsFromHistogram:(id)a3;
+ (id)stylePriorDataForCast:(id)a3 tone:(float)a4 color:(float)a5 intensity:(float)a6 priorStrength:(float)a7;
- (BOOL)isAvailable;
- (BOOL)useStyleEngine;
- (CIImage)inputGainMapImage;
- (CIImage)inputImage;
- (CIImage)inputLinearThumbnailImage;
- (CIImage)inputSkinMatteImage;
- (CIImage)inputSkyMatteImage;
- (CIImage)inputSubjectMatteImage;
- (NSData)inputLightMapData;
- (NSData)inputLinearLightMapData;
- (NSData)inputTRCData;
- (NSDictionary)inputExtendedStatistics;
- (NSDictionary)inputStatistics;
- (NSNumber)baseGain;
- (NSNumber)brightnessValue;
- (NSNumber)faceBasedGlobalExposureBoostRatio;
- (NSNumber)inputLightMapHeight;
- (NSNumber)inputLightMapWidth;
- (NSNumber)inputSRLCurveParameter;
- (NSNumber)inputSceneType;
- (NSNumber)tuningType;
- (NSString)inputCast;
- (double)inputBaselineExposure;
- (double)inputColorBias;
- (double)inputIntensity;
- (double)inputToneBias;
- (id)_lightMapImageWithData:(id)a3;
- (id)curveImageWithData:(id)a3;
- (id)extractDataToDictionary:(id)a3 options:(id)a4 context:(id)a5 colorSpace:(CGColorSpace *)a6 error:(id *)a7;
- (id)gtcKernel;
- (id)outputImage;
- (void)setBaseGain:(id)a3;
- (void)setBrightnessValue:(id)a3;
- (void)setFaceBasedGlobalExposureBoostRatio:(id)a3;
- (void)setInputBaselineExposure:(double)a3;
- (void)setInputCast:(id)a3;
- (void)setInputColorBias:(double)a3;
- (void)setInputExtendedStatistics:(id)a3;
- (void)setInputGainMapImage:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputIntensity:(double)a3;
- (void)setInputLightMapData:(id)a3;
- (void)setInputLightMapHeight:(id)a3;
- (void)setInputLightMapWidth:(id)a3;
- (void)setInputLinearLightMapData:(id)a3;
- (void)setInputLinearThumbnailImage:(id)a3;
- (void)setInputSRLCurveParameter:(id)a3;
- (void)setInputSceneType:(id)a3;
- (void)setInputSkinMatteImage:(id)a3;
- (void)setInputSkyMatteImage:(id)a3;
- (void)setInputStatistics:(id)a3;
- (void)setInputSubjectMatteImage:(id)a3;
- (void)setInputTRCData:(id)a3;
- (void)setInputToneBias:(double)a3;
- (void)setTuningType:(id)a3;
- (void)setUseStyleEngine:(BOOL)a3;
@end

@implementation PISemanticStyleFilter

+ (id)CMISmartStyleTuningParameterVariantFromKey:(id)a3
{
  unsigned int v3 = [a3 intValue] - 2;
  if (v3 > 6) {
    v4 = (void **)MEMORY[0x1E4F55E70];
  }
  else {
    v4 = (void **)qword_1E5D80B30[v3];
  }
  v5 = *v4;
  return v5;
}

+ (id)stylePriorDataForCast:(id)a3 tone:(float)a4 color:(float)a5 intensity:(float)a6 priorStrength:(float)a7
{
  id v11 = a3;
  if ([v11 isEqualToString:@"None"])
  {
    v16 = 0;
  }
  else
  {
    *(float *)&double v12 = a4;
    *(float *)&double v13 = a5;
    *(float *)&double v14 = a6;
    *(float *)&double v15 = a7;
    [MEMORY[0x1E4F55EF0] calculatePriorCCMforCast:v11 tone:v12 color:v13 intensity:v14 priorStrength:v15];
    v21[0] = v17;
    v21[1] = v18;
    v21[2] = v19;
    v16 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v21 length:48];
  }

  return v16;
}

+ (id)_computeSmartToneStatsFromHistogram:(id)a3
{
  v43[10] = *MEMORY[0x1E4F143B8];
  unsigned int v3 = [a3 luminance];
  if ([v3 binCount] <= 512)
  {
    int v4 = [v3 binCount];
    if (v4 < 1)
    {
      long double v8 = 0.0;
      long double v7 = 0.0;
      goto LABEL_6;
    }
  }
  else
  {
    int v4 = 512;
  }
  uint64_t v5 = 0;
  uint64_t v6 = v4;
  long double v7 = 0.0;
  long double v8 = 0.0;
  do
  {
    double v9 = fmin((double)(int)v5 / 255.0, 1.0);
    double v10 = (double)*(uint64_t *)([v3 values] + 8 * v5);
    double v11 = v10 / (double)[v3 sampleCount];
    long double v7 = v7 + v11 * log(v9 + 0.00392156863);
    long double v8 = v8 + v11 * log(1.0 - v9 + 0.00392156863);
    ++v5;
  }
  while (v6 != v5);
LABEL_6:
  double v12 = exp(v7);
  double v13 = exp(v8);
  [v3 percentile:0.02];
  double v15 = v14;
  [v3 percentile:0.1];
  double v17 = v16;
  [v3 percentile:0.25];
  double v19 = v18;
  [v3 percentile:0.5];
  double v21 = v20;
  [v3 percentile:0.75];
  double v38 = v22;
  [v3 percentile:0.98];
  double v39 = v23;
  [v3 percentile:0.001];
  double v25 = v24 * ((sqrt(v24) * -0.65 + 1.0) * 0.85);
  [v3 percentile:1.0];
  double v27 = v26;
  v42[0] = @"tonalRange";
  v41 = [NSNumber numberWithDouble:v12];
  v43[0] = v41;
  v42[1] = @"highKey";
  v40 = [NSNumber numberWithDouble:v13];
  v43[1] = v40;
  v42[2] = @"p02";
  v28 = [NSNumber numberWithDouble:v15];
  v43[2] = v28;
  v42[3] = @"p10";
  v29 = [NSNumber numberWithDouble:v17];
  v43[3] = v29;
  v42[4] = @"p25";
  v30 = [NSNumber numberWithDouble:v19];
  v43[4] = v30;
  v42[5] = @"p50";
  v31 = [NSNumber numberWithDouble:v21];
  v43[5] = v31;
  v42[6] = @"p75";
  v32 = [NSNumber numberWithDouble:v38];
  v43[6] = v32;
  v42[7] = @"p98";
  v33 = [NSNumber numberWithDouble:v39];
  v43[7] = v33;
  v42[8] = @"blackPoint";
  v34 = [NSNumber numberWithDouble:v25];
  v43[8] = v34;
  v42[9] = @"whitePoint";
  v35 = [NSNumber numberWithDouble:v27];
  v43[9] = v35;
  v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:10];

  return v36;
}

+ (id)_computeAlphaAwareHistogramForImage:(id)a3 context:(id)a4 colorSpace:(CGColorSpace *)a5 error:(id *)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!a6)
  {
    v30 = NUAssertLogger_20707();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v31;
      _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v32 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v34 = NUAssertLogger_20707();
    BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v35)
      {
        double v38 = dispatch_get_specific(*v32);
        double v39 = (void *)MEMORY[0x1E4F29060];
        id v40 = v38;
        v41 = [v39 callStackSymbols];
        v42 = [v41 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v38;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v42;
        _os_log_error_impl(&dword_1A9680000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v35)
    {
      v36 = [MEMORY[0x1E4F29060] callStackSymbols];
      v37 = [v36 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v37;
      _os_log_error_impl(&dword_1A9680000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  double v11 = v10;
  id v12 = objc_alloc_init(MEMORY[0x1E4F7A378]);
  LODWORD(v13) = *(_DWORD *)(MEMORY[0x1E4F7A310] + 48);
  LODWORD(v14) = *(_DWORD *)(MEMORY[0x1E4F7A310] + 52);
  LODWORD(v15) = *(_DWORD *)(MEMORY[0x1E4F7A310] + 56);
  LODWORD(v16) = *(_DWORD *)(MEMORY[0x1E4F7A310] + 60);
  objc_msgSend(v12, "setLuminanceWeights:", v13, v14, v15, v16);
  memset(buf, 0, 32);
  [v9 extent];
  NUPixelRectFromCGRect();
  double v17 = [MEMORY[0x1E4F7A5D8] BGRA8];
  uint64_t v18 = [v17 alignedRowBytesForWidth:0];

  id v19 = [MEMORY[0x1E4F1CA58] dataWithLength:0];
  uint64_t v20 = [v19 mutableBytes];
  [v9 extent];
  objc_msgSend(v11, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v9, v20, v18, *MEMORY[0x1E4F1E280], a5);
  id v21 = objc_alloc(MEMORY[0x1E4F7A3A0]);
  double v22 = [MEMORY[0x1E4F7A5D8] BGRA8];
  id v23 = v19;
  double v24 = objc_msgSend(v21, "initWithSize:format:rowBytes:bytes:", (unsigned __int128)0, v22, v18, objc_msgSend(v23, "bytes"));

  id v43 = 0;
  double v25 = [v12 computeHistogramFromBuffer:v24 error:&v43];
  if (!v25)
  {
    double v26 = (void *)MEMORY[0x1E4F7A438];
    id v27 = v43;
    id v28 = [v26 errorWithCode:1 reason:@"Failed to compute histogram" object:v12 underlyingError:v27];

    *a6 = v28;
  }

  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceBasedGlobalExposureBoostRatio, 0);
  objc_storeStrong((id *)&self->_baseGain, 0);
  objc_storeStrong((id *)&self->_tuningType, 0);
  objc_storeStrong((id *)&self->_brightnessValue, 0);
  objc_storeStrong((id *)&self->_inputLightMapHeight, 0);
  objc_storeStrong((id *)&self->_inputLightMapWidth, 0);
  objc_storeStrong((id *)&self->_inputLinearLightMapData, 0);
  objc_storeStrong((id *)&self->_inputLightMapData, 0);
  objc_storeStrong((id *)&self->_inputSRLCurveParameter, 0);
  objc_storeStrong((id *)&self->_inputTRCData, 0);
  objc_storeStrong((id *)&self->_inputExtendedStatistics, 0);
  objc_storeStrong((id *)&self->_inputStatistics, 0);
  objc_storeStrong((id *)&self->_inputSceneType, 0);
  objc_storeStrong((id *)&self->_inputCast, 0);
  objc_storeStrong((id *)&self->_inputGainMapImage, 0);
  objc_storeStrong((id *)&self->_inputLinearThumbnailImage, 0);
  objc_storeStrong((id *)&self->_inputSkyMatteImage, 0);
  objc_storeStrong((id *)&self->_inputSkinMatteImage, 0);
  objc_storeStrong((id *)&self->_inputSubjectMatteImage, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

- (void)setUseStyleEngine:(BOOL)a3
{
  self->_useStyleEngine = a3;
}

- (BOOL)useStyleEngine
{
  return self->_useStyleEngine;
}

- (void)setFaceBasedGlobalExposureBoostRatio:(id)a3
{
}

- (NSNumber)faceBasedGlobalExposureBoostRatio
{
  return self->_faceBasedGlobalExposureBoostRatio;
}

- (void)setBaseGain:(id)a3
{
}

- (NSNumber)baseGain
{
  return self->_baseGain;
}

- (void)setTuningType:(id)a3
{
}

- (NSNumber)tuningType
{
  return self->_tuningType;
}

- (void)setBrightnessValue:(id)a3
{
}

- (NSNumber)brightnessValue
{
  return self->_brightnessValue;
}

- (void)setInputLightMapHeight:(id)a3
{
}

- (NSNumber)inputLightMapHeight
{
  return self->_inputLightMapHeight;
}

- (void)setInputLightMapWidth:(id)a3
{
}

- (NSNumber)inputLightMapWidth
{
  return self->_inputLightMapWidth;
}

- (void)setInputLinearLightMapData:(id)a3
{
}

- (NSData)inputLinearLightMapData
{
  return self->_inputLinearLightMapData;
}

- (void)setInputLightMapData:(id)a3
{
}

- (NSData)inputLightMapData
{
  return self->_inputLightMapData;
}

- (void)setInputSRLCurveParameter:(id)a3
{
}

- (NSNumber)inputSRLCurveParameter
{
  return self->_inputSRLCurveParameter;
}

- (void)setInputTRCData:(id)a3
{
}

- (NSData)inputTRCData
{
  return self->_inputTRCData;
}

- (void)setInputBaselineExposure:(double)a3
{
  self->_inputBaselineExposure = a3;
}

- (double)inputBaselineExposure
{
  return self->_inputBaselineExposure;
}

- (void)setInputExtendedStatistics:(id)a3
{
}

- (NSDictionary)inputExtendedStatistics
{
  return self->_inputExtendedStatistics;
}

- (void)setInputStatistics:(id)a3
{
}

- (NSDictionary)inputStatistics
{
  return self->_inputStatistics;
}

- (void)setInputSceneType:(id)a3
{
}

- (NSNumber)inputSceneType
{
  return self->_inputSceneType;
}

- (void)setInputIntensity:(double)a3
{
  self->_inputIntensity = a3;
}

- (double)inputIntensity
{
  return self->_inputIntensity;
}

- (void)setInputCast:(id)a3
{
}

- (NSString)inputCast
{
  return self->_inputCast;
}

- (void)setInputColorBias:(double)a3
{
  self->_inputColorBias = a3;
}

- (double)inputColorBias
{
  return self->_inputColorBias;
}

- (void)setInputToneBias:(double)a3
{
  self->_inputToneBias = a3;
}

- (double)inputToneBias
{
  return self->_inputToneBias;
}

- (void)setInputGainMapImage:(id)a3
{
}

- (CIImage)inputGainMapImage
{
  return self->_inputGainMapImage;
}

- (void)setInputLinearThumbnailImage:(id)a3
{
}

- (CIImage)inputLinearThumbnailImage
{
  return self->_inputLinearThumbnailImage;
}

- (void)setInputSkyMatteImage:(id)a3
{
}

- (CIImage)inputSkyMatteImage
{
  return self->_inputSkyMatteImage;
}

- (void)setInputSkinMatteImage:(id)a3
{
}

- (CIImage)inputSkinMatteImage
{
  return self->_inputSkinMatteImage;
}

- (void)setInputSubjectMatteImage:(id)a3
{
}

- (CIImage)inputSubjectMatteImage
{
  return self->_inputSubjectMatteImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (id)extractDataToDictionary:(id)a3 options:(id)a4 context:(id)a5 colorSpace:(CGColorSpace *)a6 error:(id *)a7
{
  v54[3] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v51 = 0;
  double v15 = [(id)objc_opt_class() _computeAlphaAwareHistogramForImage:v12 context:v14 colorSpace:a6 error:&v51];

  id v16 = v51;
  if (v15)
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v18 = [(id)objc_opt_class() _computeSmartToneStatsFromHistogram:v15];
    [v17 addEntriesFromDictionary:v18];
    id v19 = [v13 objectForKeyedSubscript:PISemanticStyleFilterStatsLocalOption];
    int v20 = [v19 BOOLValue];

    if (v20)
    {
      v49 = v18;
      id v50 = v16;
      id v21 = [v13 objectForKeyedSubscript:PISemanticStyleFilterStatsBaselineExposureOption];
      v48 = v21;
      if (v21)
      {
        [v21 floatValue];
        v53[0] = @"inputRVector";
        double v23 = v22;
        double v24 = [MEMORY[0x1E4F1E080] vectorWithX:v22 Y:0.0 Z:0.0 W:0.0];
        v54[0] = v24;
        v53[1] = @"inputGVector";
        double v25 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:v23 Z:0.0 W:0.0];
        v54[1] = v25;
        v53[2] = @"inputBVector";
        double v26 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:v23 W:0.0];
        v54[2] = v26;
        id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:3];
        uint64_t v28 = [v12 imageByApplyingFilter:@"CIColorMatrix" withInputParameters:v27];

        id v12 = (id)v28;
      }
      v29 = [v13 objectForKeyedSubscript:PISemanticStyleFilterStatsGlobalToneCurveOption];
      if (v29)
      {
        v30 = [(PISemanticStyleFilter *)self curveImageWithData:v29];
        v47 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:1.0];
        [v30 extent];
        v32 = [MEMORY[0x1E4F1E080] vectorWithX:(v31 + -1.0) / v31 Y:0.5 / v31];
        v33 = [v12 imageByUnpremultiplyingAlpha];

        v34 = [(PISemanticStyleFilter *)self gtcKernel];
        [v33 extent];
        double v36 = v35;
        double v38 = v37;
        double v40 = v39;
        double v42 = v41;
        v52[0] = v33;
        v52[1] = v30;
        v52[2] = v47;
        v52[3] = v32;
        id v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:4];
        v44 = objc_msgSend(v34, "applyWithExtent:arguments:", v43, v36, v38, v40, v42);

        id v12 = [v44 imageByPremultiplyingAlpha];
      }
      uint64_t v18 = v49;
      uint64_t v45 = [v12 localLightStatisticsNoProxy];
      [v17 addEntriesFromDictionary:v45];

      id v16 = v50;
    }
  }
  else if (a7)
  {
    [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to compute histogram" object:v12 underlyingError:v16];
    id v17 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (id)gtcKernel
{
  if (gtcKernel_once != -1) {
    dispatch_once(&gtcKernel_once, &__block_literal_global_194_21039);
  }
  v2 = (void *)gtcKernel_singleton;
  return v2;
}

uint64_t __34__PISemanticStyleFilter_gtcKernel__block_invoke()
{
  gtcKernel_singleton = [MEMORY[0x1E4F1E010] kernelWithString:@"float gtc_sample_r(float x, sampler2D table, vec2 domain, vec2 normalizer) { x = (x - domain.x) / (domain.y - domain.x) x = clamp(x, 0.0001, 0.9999); x = normalizer.x * x + normalizer.y; return texture2D(table, vec2(x, 0.5)).r; } kernel vec4 gtc_rgb(__sample color, sampler2D table, vec2 domain, vec2 normalizer) { vec4 pixel = color; pixel.r = gtc_sample_r(pixel.r, table, domain, normalizer); pixel.g = gtc_sample_r(pixel.g, table, domain, normalizer); pixel.b = gtc_sample_r(pixel.b, table, domain, normalizer); return pixel; }"];;
  return MEMORY[0x1F41817F8]();
}

- (id)outputImage
{
  uint64_t v191 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = [(PISemanticStyleFilter *)self inputImage];

  if (!v3)
  {
    v75 = NUAssertLogger_20707();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "self.inputImage != nil");
      v76 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v188 = v76;
      _os_log_error_impl(&dword_1A9680000, v75, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v77 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v79 = NUAssertLogger_20707();
    BOOL v80 = os_log_type_enabled(v79, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v80)
      {
        v118 = dispatch_get_specific(*v77);
        v119 = (void *)MEMORY[0x1E4F29060];
        id v120 = v118;
        v77 = [v119 callStackSymbols];
        v121 = [v77 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v188 = (const void **)v118;
        __int16 v189 = 2114;
        v190 = v121;
        _os_log_error_impl(&dword_1A9680000, v79, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v80)
    {
      v81 = [MEMORY[0x1E4F29060] callStackSymbols];
      v77 = [v81 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v188 = v77;
      _os_log_error_impl(&dword_1A9680000, v79, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v85 = _NUAssertFailHandler();
    goto LABEL_85;
  }
  int v4 = [(PISemanticStyleFilter *)self inputSubjectMatteImage];

  if (!v4)
  {
    v82 = NUAssertLogger_20707();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "self.inputSubjectMatteImage != nil");
      v83 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v188 = v83;
      _os_log_error_impl(&dword_1A9680000, v82, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v77 = (const void **)MEMORY[0x1E4F7A308];
    v84 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v79 = NUAssertLogger_20707();
    int v85 = os_log_type_enabled(v79, OS_LOG_TYPE_ERROR);
    if (!v84)
    {
      if (v85)
      {
        v86 = [MEMORY[0x1E4F29060] callStackSymbols];
        v77 = [v86 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v188 = v77;
        _os_log_error_impl(&dword_1A9680000, v79, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_87:

      int v90 = _NUAssertFailHandler();
      goto LABEL_88;
    }
LABEL_85:
    if (v85)
    {
      v122 = dispatch_get_specific(*v77);
      v123 = (void *)MEMORY[0x1E4F29060];
      id v124 = v122;
      v77 = [v123 callStackSymbols];
      v125 = [v77 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v188 = (const void **)v122;
      __int16 v189 = 2114;
      v190 = v125;
      _os_log_error_impl(&dword_1A9680000, v79, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_87;
  }
  uint64_t v5 = [(PISemanticStyleFilter *)self inputSkinMatteImage];

  if (!v5)
  {
    v87 = NUAssertLogger_20707();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "self.inputSkinMatteImage != nil");
      v88 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v188 = v88;
      _os_log_error_impl(&dword_1A9680000, v87, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v77 = (const void **)MEMORY[0x1E4F7A308];
    v89 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v79 = NUAssertLogger_20707();
    int v90 = os_log_type_enabled(v79, OS_LOG_TYPE_ERROR);
    if (!v89)
    {
      if (v90)
      {
        v91 = [MEMORY[0x1E4F29060] callStackSymbols];
        v77 = [v91 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v188 = v77;
        _os_log_error_impl(&dword_1A9680000, v79, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_90:

      int v95 = _NUAssertFailHandler();
      goto LABEL_91;
    }
LABEL_88:
    if (v90)
    {
      v126 = dispatch_get_specific(*v77);
      v127 = (void *)MEMORY[0x1E4F29060];
      id v128 = v126;
      v77 = [v127 callStackSymbols];
      v129 = [v77 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v188 = (const void **)v126;
      __int16 v189 = 2114;
      v190 = v129;
      _os_log_error_impl(&dword_1A9680000, v79, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_90;
  }
  uint64_t v6 = [(PISemanticStyleFilter *)self inputSkyMatteImage];

  if (!v6)
  {
    v92 = NUAssertLogger_20707();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "self.inputSkyMatteImage != nil");
      v93 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v188 = v93;
      _os_log_error_impl(&dword_1A9680000, v92, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v77 = (const void **)MEMORY[0x1E4F7A308];
    v94 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v79 = NUAssertLogger_20707();
    int v95 = os_log_type_enabled(v79, OS_LOG_TYPE_ERROR);
    if (!v94)
    {
      if (v95)
      {
        v96 = [MEMORY[0x1E4F29060] callStackSymbols];
        v77 = [v96 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v188 = v77;
        _os_log_error_impl(&dword_1A9680000, v79, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_93:

      int v100 = _NUAssertFailHandler();
      goto LABEL_94;
    }
LABEL_91:
    if (v95)
    {
      v130 = dispatch_get_specific(*v77);
      v131 = (void *)MEMORY[0x1E4F29060];
      id v132 = v130;
      v77 = [v131 callStackSymbols];
      v133 = [v77 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v188 = (const void **)v130;
      __int16 v189 = 2114;
      v190 = v133;
      _os_log_error_impl(&dword_1A9680000, v79, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_93;
  }
  long double v7 = [(PISemanticStyleFilter *)self inputLinearThumbnailImage];

  if (!v7)
  {
    v97 = NUAssertLogger_20707();
    if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "self.inputLinearThumbnailImage != nil");
      v98 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v188 = v98;
      _os_log_error_impl(&dword_1A9680000, v97, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v77 = (const void **)MEMORY[0x1E4F7A308];
    v99 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v79 = NUAssertLogger_20707();
    int v100 = os_log_type_enabled(v79, OS_LOG_TYPE_ERROR);
    if (!v99)
    {
      if (v100)
      {
        v101 = [MEMORY[0x1E4F29060] callStackSymbols];
        v77 = [v101 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v188 = v77;
        _os_log_error_impl(&dword_1A9680000, v79, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_96:

      int v105 = _NUAssertFailHandler();
      goto LABEL_97;
    }
LABEL_94:
    if (v100)
    {
      v134 = dispatch_get_specific(*v77);
      v135 = (void *)MEMORY[0x1E4F29060];
      id v136 = v134;
      v77 = [v135 callStackSymbols];
      v137 = [v77 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v188 = (const void **)v134;
      __int16 v189 = 2114;
      v190 = v137;
      _os_log_error_impl(&dword_1A9680000, v79, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_96;
  }
  long double v8 = [(PISemanticStyleFilter *)self inputGainMapImage];

  if (!v8)
  {
    v102 = NUAssertLogger_20707();
    if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "self.inputGainMapImage != nil");
      v103 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v188 = v103;
      _os_log_error_impl(&dword_1A9680000, v102, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v77 = (const void **)MEMORY[0x1E4F7A308];
    v104 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v79 = NUAssertLogger_20707();
    int v105 = os_log_type_enabled(v79, OS_LOG_TYPE_ERROR);
    if (!v104)
    {
      if (v105)
      {
        v106 = [MEMORY[0x1E4F29060] callStackSymbols];
        v77 = [v106 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v188 = v77;
        _os_log_error_impl(&dword_1A9680000, v79, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_99:

      int v110 = _NUAssertFailHandler();
      goto LABEL_100;
    }
LABEL_97:
    if (v105)
    {
      v138 = dispatch_get_specific(*v77);
      v139 = (void *)MEMORY[0x1E4F29060];
      id v140 = v138;
      v77 = [v139 callStackSymbols];
      v141 = [v77 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v188 = (const void **)v138;
      __int16 v189 = 2114;
      v190 = v141;
      _os_log_error_impl(&dword_1A9680000, v79, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_99;
  }
  id v9 = [(PISemanticStyleFilter *)self inputTRCData];

  if (!v9)
  {
    v107 = NUAssertLogger_20707();
    if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "self.inputTRCData != nil");
      v108 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v188 = v108;
      _os_log_error_impl(&dword_1A9680000, v107, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v77 = (const void **)MEMORY[0x1E4F7A308];
    v109 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v79 = NUAssertLogger_20707();
    int v110 = os_log_type_enabled(v79, OS_LOG_TYPE_ERROR);
    if (!v109)
    {
      if (v110)
      {
        v111 = [MEMORY[0x1E4F29060] callStackSymbols];
        v77 = [v111 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v188 = v77;
        _os_log_error_impl(&dword_1A9680000, v79, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_102:

      int v115 = _NUAssertFailHandler();
      goto LABEL_103;
    }
LABEL_100:
    if (v110)
    {
      v142 = dispatch_get_specific(*v77);
      v143 = (void *)MEMORY[0x1E4F29060];
      id v144 = v142;
      v77 = [v143 callStackSymbols];
      v145 = [v77 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v188 = (const void **)v142;
      __int16 v189 = 2114;
      v190 = v145;
      _os_log_error_impl(&dword_1A9680000, v79, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_102;
  }
  id v10 = [(PISemanticStyleFilter *)self inputTRCData];
  uint64_t v11 = [(PISemanticStyleFilter *)self curveImageWithData:v10];

  if (!v11)
  {
    v112 = NUAssertLogger_20707();
    if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
    {
      v113 = [NSString stringWithFormat:@"Failed to generate TRC image"];
      *(_DWORD *)buf = 138543362;
      v188 = v113;
      _os_log_error_impl(&dword_1A9680000, v112, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v77 = (const void **)MEMORY[0x1E4F7A308];
    v114 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v79 = NUAssertLogger_20707();
    int v115 = os_log_type_enabled(v79, OS_LOG_TYPE_ERROR);
    if (!v114)
    {
      if (v115)
      {
        v116 = [MEMORY[0x1E4F29060] callStackSymbols];
        v117 = [v116 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v188 = v117;
        _os_log_error_impl(&dword_1A9680000, v79, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_105:

      _NUAssertFailHandler();
      goto LABEL_106;
    }
LABEL_103:
    if (v115)
    {
      v146 = dispatch_get_specific(*v77);
      v147 = (void *)MEMORY[0x1E4F29060];
      id v148 = v146;
      v149 = [v147 callStackSymbols];
      v150 = [v149 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v188 = (const void **)v146;
      __int16 v189 = 2114;
      v190 = v150;
      _os_log_error_impl(&dword_1A9680000, v79, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_105;
  }
  id v12 = [(PISemanticStyleFilter *)self inputLightMapData];
  if (v12)
  {
    id v13 = [(PISemanticStyleFilter *)self inputLinearLightMapData];
    if (v13)
    {
      id v14 = [(PISemanticStyleFilter *)self inputStatistics];
      BOOL v15 = v14 != 0;
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  id v16 = [(PISemanticStyleFilter *)self inputLightMapData];
  uint64_t v17 = [(PISemanticStyleFilter *)self _lightMapImageWithData:v16];

  uint64_t v18 = [(PISemanticStyleFilter *)self inputLinearLightMapData];
  uint64_t v19 = [(PISemanticStyleFilter *)self _lightMapImageWithData:v18];

  if (v15)
  {
    if (v17)
    {
      if (v19) {
        goto LABEL_18;
      }
      v158 = NUAssertLogger_20707();
      if (os_log_type_enabled(v158, OS_LOG_TYPE_ERROR))
      {
        v159 = [NSString stringWithFormat:@"Failed to generate linear lightmap image"];
        *(_DWORD *)buf = 138543362;
        v188 = v159;
        _os_log_error_impl(&dword_1A9680000, v158, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      v153 = (const void **)MEMORY[0x1E4F7A308];
      v160 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      v155 = NUAssertLogger_20707();
      int v161 = os_log_type_enabled(v155, OS_LOG_TYPE_ERROR);
      if (!v160)
      {
        if (v161)
        {
          v162 = [MEMORY[0x1E4F29060] callStackSymbols];
          v163 = [v162 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v188 = v163;
          _os_log_error_impl(&dword_1A9680000, v155, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
        }
        goto LABEL_121;
      }
LABEL_119:
      if (v161)
      {
        v168 = dispatch_get_specific(*v153);
        v169 = (void *)MEMORY[0x1E4F29060];
        id v170 = v168;
        v171 = [v169 callStackSymbols];
        v172 = [v171 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v188 = (const void **)v168;
        __int16 v189 = 2114;
        v190 = v172;
        _os_log_error_impl(&dword_1A9680000, v155, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
LABEL_121:

      _NUAssertFailHandler();
    }
LABEL_106:
    v151 = NUAssertLogger_20707();
    if (os_log_type_enabled(v151, OS_LOG_TYPE_ERROR))
    {
      v152 = [NSString stringWithFormat:@"Failed to generate lightmap image"];
      *(_DWORD *)buf = 138543362;
      v188 = v152;
      _os_log_error_impl(&dword_1A9680000, v151, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v153 = (const void **)MEMORY[0x1E4F7A308];
    v154 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v155 = NUAssertLogger_20707();
    BOOL v156 = os_log_type_enabled(v155, OS_LOG_TYPE_ERROR);
    if (v154)
    {
      if (v156)
      {
        v164 = dispatch_get_specific(*v153);
        v165 = (void *)MEMORY[0x1E4F29060];
        id v166 = v164;
        v153 = [v165 callStackSymbols];
        v167 = [v153 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v188 = (const void **)v164;
        __int16 v189 = 2114;
        v190 = v167;
        _os_log_error_impl(&dword_1A9680000, v155, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v156)
    {
      v157 = [MEMORY[0x1E4F29060] callStackSymbols];
      v153 = [v157 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v188 = v153;
      _os_log_error_impl(&dword_1A9680000, v155, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v161 = _NUAssertFailHandler();
    goto LABEL_119;
  }
LABEL_18:
  v178 = (void *)v19;
  [(PISemanticStyleFilter *)self inputImage];
  int v20 = v179 = (void *)v17;
  id v21 = [(PISemanticStyleFilter *)self inputSubjectMatteImage];
  float v22 = [(PISemanticStyleFilter *)self inputSkinMatteImage];
  [(PISemanticStyleFilter *)self inputSkyMatteImage];
  double v23 = v180 = (void *)v11;
  uint64_t v24 = [(PISemanticStyleFilter *)self inputLinearThumbnailImage];
  double v25 = [(PISemanticStyleFilter *)self inputGainMapImage];
  __36__PISemanticStyleFilter_outputImage__block_invoke(v21, v20);
  v27 = BOOL v26 = v15;

  uint64_t v28 = __36__PISemanticStyleFilter_outputImage__block_invoke(v22, v20);

  uint64_t v29 = __36__PISemanticStyleFilter_outputImage__block_invoke(v23, v20);

  uint64_t v30 = __36__PISemanticStyleFilter_outputImage__block_invoke(v25, v20);

  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v175 = v20;
  [v31 addObject:v20];
  v177 = (void *)v27;
  [v31 addObject:v27];
  v174 = (void *)v28;
  [v31 addObject:v28];
  v173 = (void *)v29;
  [v31 addObject:v29];
  v176 = (void *)v24;
  uint64_t v32 = v24;
  v33 = (void *)v30;
  [v31 addObject:v32];
  [v31 addObject:v30];
  [v31 addObject:v180];
  if (v26)
  {
    [v31 addObject:v179];
    [v31 addObject:v178];
  }
  v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v31, "count"));
  long long v182 = 0u;
  long long v183 = 0u;
  long long v184 = 0u;
  long long v185 = 0u;
  id v35 = v31;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v182 objects:v186 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v183;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v183 != v38) {
          objc_enumerationMutation(v35);
        }
        double v40 = (void *)MEMORY[0x1E4F1E080];
        [*(id *)(*((void *)&v182 + 1) + 8 * i) extent];
        double v41 = objc_msgSend(v40, "vectorWithCGRect:");
        [v34 addObject:v41];
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v182 objects:v186 count:16];
    }
    while (v37);
  }

  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v42 setObject:v34 forKeyedSubscript:@"extents"];
  id v43 = NSNumber;
  [(PISemanticStyleFilter *)self inputToneBias];
  v44 = objc_msgSend(v43, "numberWithDouble:");
  [v42 setObject:v44 forKeyedSubscript:@"tone"];

  uint64_t v45 = NSNumber;
  [(PISemanticStyleFilter *)self inputColorBias];
  v46 = objc_msgSend(v45, "numberWithDouble:");
  [v42 setObject:v46 forKeyedSubscript:@"color"];

  v47 = [(PISemanticStyleFilter *)self inputCast];
  [v42 setObject:v47 forKeyedSubscript:@"cast"];

  v48 = NSNumber;
  [(PISemanticStyleFilter *)self inputIntensity];
  v49 = objc_msgSend(v48, "numberWithDouble:");
  [v42 setObject:v49 forKeyedSubscript:@"intensity"];

  uint64_t v50 = [(PISemanticStyleFilter *)self inputSRLCurveParameter];
  id v51 = (void *)v50;
  if (v50) {
    v52 = (void *)v50;
  }
  else {
    v52 = &unk_1F000A768;
  }
  [v42 setObject:v52 forKeyedSubscript:@"srlCurveParameter"];

  uint64_t v53 = [(PISemanticStyleFilter *)self inputSceneType];
  v54 = (void *)v53;
  if (v53) {
    v55 = (void *)v53;
  }
  else {
    v55 = &unk_1F0009CB0;
  }
  [v42 setObject:v55 forKeyedSubscript:@"sceneType"];

  v56 = [(PISemanticStyleFilter *)self inputStatistics];
  [v42 setObject:v56 forKeyedSubscript:@"stats"];

  v57 = [(PISemanticStyleFilter *)self inputExtendedStatistics];
  [v42 setObject:v57 forKeyedSubscript:@"xstats"];

  v58 = NSNumber;
  [(PISemanticStyleFilter *)self inputBaselineExposure];
  v59 = objc_msgSend(v58, "numberWithDouble:");
  [v42 setObject:v59 forKeyedSubscript:@"baselineExposure"];

  v60 = [NSNumber numberWithBool:v26];
  [v42 setObject:v60 forKeyedSubscript:@"useLightMap"];

  v61 = objc_opt_class();
  v62 = [(PISemanticStyleFilter *)self tuningType];
  v63 = [v61 CMISmartStyleTuningParameterVariantFromKey:v62];
  [v42 setObject:v63 forKeyedSubscript:@"tuningType"];

  v64 = objc_msgSend(NSNumber, "numberWithBool:", -[PISemanticStyleFilter useStyleEngine](self, "useStyleEngine"));
  [v42 setObject:v64 forKeyedSubscript:@"useStyleEngine"];

  v65 = [(PISemanticStyleFilter *)self brightnessValue];
  [v42 setObject:v65 forKeyedSubscript:@"brightnessValue"];

  uint64_t v66 = [(PISemanticStyleFilter *)self baseGain];
  v67 = (void *)v66;
  if (v66) {
    v68 = (void *)v66;
  }
  else {
    v68 = &unk_1F000A778;
  }
  [v42 setObject:v68 forKeyedSubscript:@"baseGain"];

  uint64_t v69 = [(PISemanticStyleFilter *)self faceBasedGlobalExposureBoostRatio];
  v70 = (void *)v69;
  if (v69) {
    v71 = (void *)v69;
  }
  else {
    v71 = &unk_1F000A778;
  }
  [v42 setObject:v71 forKeyedSubscript:@"faceBasedGlobalExposureBoostRatio"];

  v72 = [(PISemanticStyleFilter *)self inputImage];
  [v72 extent];
  uint64_t v181 = 0;
  v73 = +[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](PISemanticStyleProcessor, "applyWithExtent:inputs:arguments:error:", v35, v42, &v181);

  return v73;
}

id __36__PISemanticStyleFilter_outputImage__block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  [v4 extent];
  [v3 extent];

  NUCGAffineTransformByMappingFromRectToRect();
  uint64_t v5 = [v4 imageByApplyingTransform:&v7];

  return v5;
}

- (id)_lightMapImageWithData:(id)a3
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(PISemanticStyleFilter *)self inputLightMapWidth];
    uint64_t v6 = (void *)v5;
    if (v5) {
      uint64_t v7 = (void *)v5;
    }
    else {
      uint64_t v7 = &unk_1F0009C98;
    }
    id v8 = v7;

    uint64_t v9 = [(PISemanticStyleFilter *)self inputLightMapHeight];
    id v10 = (void *)v9;
    if (v9) {
      uint64_t v11 = (void *)v9;
    }
    else {
      uint64_t v11 = &unk_1F0009C98;
    }
    id v12 = v11;

    unsigned int v13 = [v8 intValue];
    int v14 = [v12 intValue];

    v28[0] = *MEMORY[0x1E4F1E390];
    BOOL v15 = [MEMORY[0x1E4F1CA98] null];
    v28[1] = *MEMORY[0x1E4F1E3A0];
    v29[0] = v15;
    v29[1] = MEMORY[0x1E4F1CC38];
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];

    uint64_t v17 = 2 * v13;
    if ((double)v14 * (double)(unint64_t)v17 == (double)(unint64_t)[v4 length])
    {
      uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithBitmapData:bytesPerRow:size:format:options:", v4, 2 * v13, *MEMORY[0x1E4F1E318], v16, (double)(int)v13, (double)v14);
    }
    else
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_402);
      }
      uint64_t v18 = (void *)*MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
      {
        id v21 = v18;
        int v22 = 134218496;
        uint64_t v23 = [v4 length];
        __int16 v24 = 2048;
        uint64_t v25 = v17;
        __int16 v26 = 2048;
        uint64_t v27 = v14;
        _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Light Map dimension mismatch: %lu, expected %lu * %lu", (uint8_t *)&v22, 0x20u);
      }
      uint64_t v19 = 0;
    }
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

- (id)curveImageWithData:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v4 = (double)((unint64_t)[v3 length] >> 2);
  v11[0] = *MEMORY[0x1E4F1E390];
  uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  v11[1] = *MEMORY[0x1E4F1E3A0];
  v12[0] = v5;
  v12[1] = MEMORY[0x1E4F1CC28];
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  uint64_t v7 = (void *)MEMORY[0x1E4F1E050];
  uint64_t v8 = [v3 length];
  uint64_t v9 = objc_msgSend(v7, "imageWithBitmapData:bytesPerRow:size:format:options:", v3, v8, *MEMORY[0x1E4F1E310], v6, v4, 1.0);

  return v9;
}

- (BOOL)isAvailable
{
  return 1;
}

@end