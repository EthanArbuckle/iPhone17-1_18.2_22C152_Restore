@interface PIPortraitEffectFilter
+ (id)remapPortraitV2Strength:(id)a3 portraitEffectKind:(id)a4;
- (CIImage)inputBlurMap;
- (CIImage)inputDepthMap;
- (CIImage)inputDisparity;
- (CIImage)inputFaceMask;
- (CIImage)inputFullSizeImage;
- (CIImage)inputHairMask;
- (CIImage)inputImage;
- (CIImage)inputMatte;
- (CIImage)inputTeethMask;
- (NSNumber)inputGenerateSpillMatte;
- (NSNumber)inputOneShot;
- (NSNumber)inputScale;
- (NSNumber)inputStrength;
- (NSNumber)inputVersion;
- (NSString)inputKind;
- (id)inputFaceLandmarkArray;
- (id)outputImage;
- (void)setInputBlurMap:(id)a3;
- (void)setInputDepthMap:(id)a3;
- (void)setInputDisparity:(id)a3;
- (void)setInputFaceLandmarkArray:(id)a3;
- (void)setInputFaceMask:(id)a3;
- (void)setInputFullSizeImage:(id)a3;
- (void)setInputGenerateSpillMatte:(id)a3;
- (void)setInputHairMask:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputKind:(id)a3;
- (void)setInputMatte:(id)a3;
- (void)setInputOneShot:(id)a3;
- (void)setInputScale:(id)a3;
- (void)setInputStrength:(id)a3;
- (void)setInputTeethMask:(id)a3;
- (void)setInputVersion:(id)a3;
@end

@implementation PIPortraitEffectFilter

+ (id)remapPortraitV2Strength:(id)a3 portraitEffectKind:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    [v5 doubleValue];
    double v8 = v7;
  }
  else
  {
    double v8 = 0.5;
  }
  if (([v6 isEqualToString:@"StudioV2"] & 1) != 0
    || [v6 isEqualToString:@"StageWhite"])
  {
    v9 = NSNumber;
    double v10 = pow(v8, 0.75);
    v11 = v9;
  }
  else if (([v6 isEqualToString:@"ContourV2"] & 1) != 0 {
         || ([v6 isEqualToString:@"StageV2"] & 1) != 0
  }
         || [v6 isEqualToString:@"StageMonoV2"])
  {
    v11 = NSNumber;
    double v10 = v8 * 1.8 + v8 * v8 * -0.8;
  }
  else
  {
    v11 = NSNumber;
    double v10 = v8;
  }
  v12 = [v11 numberWithDouble:v10];

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputOneShot, 0);
  objc_storeStrong((id *)&self->_inputStrength, 0);
  objc_storeStrong((id *)&self->_inputGenerateSpillMatte, 0);
  objc_storeStrong((id *)&self->_inputScale, 0);
  objc_storeStrong(&self->_inputFaceLandmarkArray, 0);
  objc_storeStrong((id *)&self->_inputVersion, 0);
  objc_storeStrong((id *)&self->_inputKind, 0);
  objc_storeStrong((id *)&self->_inputDepthMap, 0);
  objc_storeStrong((id *)&self->_inputTeethMask, 0);
  objc_storeStrong((id *)&self->_inputHairMask, 0);
  objc_storeStrong((id *)&self->_inputFaceMask, 0);
  objc_storeStrong((id *)&self->_inputBlurMap, 0);
  objc_storeStrong((id *)&self->_inputMatte, 0);
  objc_storeStrong((id *)&self->_inputDisparity, 0);
  objc_storeStrong((id *)&self->_inputFullSizeImage, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

- (void)setInputOneShot:(id)a3
{
}

- (NSNumber)inputOneShot
{
  return self->_inputOneShot;
}

- (void)setInputStrength:(id)a3
{
}

- (NSNumber)inputStrength
{
  return self->_inputStrength;
}

- (void)setInputGenerateSpillMatte:(id)a3
{
}

- (NSNumber)inputGenerateSpillMatte
{
  return self->_inputGenerateSpillMatte;
}

- (void)setInputScale:(id)a3
{
}

- (NSNumber)inputScale
{
  return self->_inputScale;
}

- (void)setInputFaceLandmarkArray:(id)a3
{
}

- (id)inputFaceLandmarkArray
{
  return self->_inputFaceLandmarkArray;
}

- (void)setInputVersion:(id)a3
{
}

- (NSNumber)inputVersion
{
  return self->_inputVersion;
}

- (void)setInputKind:(id)a3
{
}

- (NSString)inputKind
{
  return self->_inputKind;
}

- (void)setInputDepthMap:(id)a3
{
}

- (CIImage)inputDepthMap
{
  return self->_inputDepthMap;
}

- (void)setInputTeethMask:(id)a3
{
}

- (CIImage)inputTeethMask
{
  return self->_inputTeethMask;
}

- (void)setInputHairMask:(id)a3
{
}

- (CIImage)inputHairMask
{
  return self->_inputHairMask;
}

- (void)setInputFaceMask:(id)a3
{
}

- (CIImage)inputFaceMask
{
  return self->_inputFaceMask;
}

- (void)setInputBlurMap:(id)a3
{
}

- (CIImage)inputBlurMap
{
  return self->_inputBlurMap;
}

- (void)setInputMatte:(id)a3
{
}

- (CIImage)inputMatte
{
  return self->_inputMatte;
}

- (void)setInputDisparity:(id)a3
{
}

- (CIImage)inputDisparity
{
  return self->_inputDisparity;
}

- (void)setInputFullSizeImage:(id)a3
{
}

- (CIImage)inputFullSizeImage
{
  return self->_inputFullSizeImage;
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
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v3 = [(PIPortraitEffectFilter *)self inputImage];

  if (!v3)
  {
    v24 = 0;
    goto LABEL_14;
  }
  v4 = [(PIPortraitEffectFilter *)self inputVersion];
  int v5 = [v4 intValue];

  uint64_t v6 = [(PIPortraitEffectFilter *)self inputKind];
  if (!v6)
  {
    v38 = NUAssertLogger_15192();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = [NSString stringWithFormat:@"Missing portrait effect kind"];
      *(_DWORD *)buf = 138543362;
      v54 = v39;
      _os_log_error_impl(&dword_1A9680000, v38, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v40 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v42 = NUAssertLogger_15192();
    BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v43)
      {
        v46 = dispatch_get_specific(*v40);
        v47 = (void *)MEMORY[0x1E4F29060];
        id v48 = v46;
        v49 = [v47 callStackSymbols];
        v50 = [v49 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v54 = v46;
        __int16 v55 = 2114;
        v56 = v50;
        _os_log_error_impl(&dword_1A9680000, v42, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v43)
    {
      v44 = [MEMORY[0x1E4F29060] callStackSymbols];
      v45 = [v44 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v54 = v45;
      _os_log_error_impl(&dword_1A9680000, v42, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  double v7 = (void *)v6;
  double v8 = [@"CIPortraitEffect" stringByAppendingString:v6];
  v9 = [MEMORY[0x1E4F1E040] filterWithName:v8];
  double v10 = [(PIPortraitEffectFilter *)self inputFaceLandmarkArray];
  [v9 setValue:v10 forKey:@"inputFaceLandmarkArray"];

  v11 = [(PIPortraitEffectFilter *)self inputImage];
  [v9 setValue:v11 forKey:*MEMORY[0x1E4F1E480]];

  v12 = [(PIPortraitEffectFilter *)self inputScale];
  [v9 setValue:v12 forKey:*MEMORY[0x1E4F1E4F0]];

  if (v5 != 2)
  {
    if (([v7 isEqualToString:@"Black"] & 1) != 0
      || [v7 isEqualToString:@"BlackoutMono"])
    {
      v25 = [(PIPortraitEffectFilter *)self inputDisparity];
      [v9 setValue:v25 forKey:@"inputDisparity"];

      v26 = [(PIPortraitEffectFilter *)self inputFullSizeImage];
      [v9 setValue:v26 forKey:@"inputFullSizeImage"];

      v22 = [(PIPortraitEffectFilter *)self inputMatte];
      v23 = @"inputMatte";
    }
    else
    {
      if ([v7 isEqualToString:@"Light"]) {
        goto LABEL_11;
      }
      v37 = [(PIPortraitEffectFilter *)self inputBlurMap];
      v22 = [v37 imageByApplyingFilter:@"CIGammaAdjust" withInputParameters:&unk_1F000AFA8];

      v23 = @"inputDepthMap";
    }
LABEL_10:
    [v9 setValue:v22 forKey:v23];

LABEL_11:
    v27 = [v9 outputImage];
    v24 = [v27 imageByInsertingIntermediate];
    goto LABEL_12;
  }
  v13 = [(PIPortraitEffectFilter *)self inputDisparity];
  [v9 setValue:v13 forKey:@"inputDisparity"];

  v14 = [(PIPortraitEffectFilter *)self inputMatte];
  [v9 setValue:v14 forKey:@"inputMatte"];

  v15 = [(PIPortraitEffectFilter *)self inputBlurMap];
  [v9 setValue:v15 forKey:@"inputBlurMap"];

  v16 = [(PIPortraitEffectFilter *)self inputFaceMask];
  [v9 setValue:v16 forKey:@"inputFaceMask"];

  v17 = [(PIPortraitEffectFilter *)self inputHairMask];
  [v9 setValue:v17 forKey:@"inputHairMask"];

  v18 = [(PIPortraitEffectFilter *)self inputTeethMask];
  [v9 setValue:v18 forKey:@"inputTeethMask"];

  v19 = [(PIPortraitEffectFilter *)self inputGenerateSpillMatte];
  [v9 setValue:v19 forKey:@"inputGenerateSpillMatte"];

  v20 = [(PIPortraitEffectFilter *)self inputOneShot];
  int v21 = [v20 BOOLValue];

  if (v21)
  {
    v22 = [(PIPortraitEffectFilter *)self inputStrength];
    v23 = @"inputStrength";
    goto LABEL_10;
  }
  [v9 setValue:&unk_1F000A558 forKey:@"inputStrength"];
  v29 = [v9 outputImage];
  v27 = [v29 imageByInsertingIntermediate];

  [v9 setValue:&unk_1F000A538 forKey:@"inputStrength"];
  v30 = [v9 outputImage];
  v31 = [v30 imageByInsertingIntermediate];

  if (!v27 || !v31)
  {

    v24 = 0;
    goto LABEL_13;
  }
  v32 = objc_opt_class();
  v33 = [(PIPortraitEffectFilter *)self inputStrength];
  v34 = [v32 remapPortraitV2Strength:v33 portraitEffectKind:v7];

  uint64_t v35 = *MEMORY[0x1E4F1E400];
  v51[0] = *MEMORY[0x1E4F1E418];
  v51[1] = v35;
  v52[0] = v27;
  v52[1] = v34;
  v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:2];
  v24 = [v31 imageByApplyingFilter:@"CIMix" withInputParameters:v36];

LABEL_12:
LABEL_13:

LABEL_14:
  return v24;
}

@end