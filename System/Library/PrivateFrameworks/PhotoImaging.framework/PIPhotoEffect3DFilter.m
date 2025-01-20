@interface PIPhotoEffect3DFilter
- (CIImage)inputBlurMap;
- (CIImage)inputImage;
- (NSNumber)inputIntensity;
- (NSNumber)inputIsHDR;
- (NSString)inputKind;
- (id)outputImage;
- (void)setInputBlurMap:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputIntensity:(id)a3;
- (void)setInputIsHDR:(id)a3;
- (void)setInputKind:(id)a3;
@end

@implementation PIPhotoEffect3DFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputIsHDR, 0);
  objc_storeStrong((id *)&self->_inputIntensity, 0);
  objc_storeStrong((id *)&self->_inputKind, 0);
  objc_storeStrong((id *)&self->_inputBlurMap, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

- (void)setInputIsHDR:(id)a3
{
}

- (NSNumber)inputIsHDR
{
  return self->_inputIsHDR;
}

- (void)setInputIntensity:(id)a3
{
}

- (NSNumber)inputIntensity
{
  return self->_inputIntensity;
}

- (void)setInputKind:(id)a3
{
}

- (NSString)inputKind
{
  return self->_inputKind;
}

- (void)setInputBlurMap:(id)a3
{
}

- (CIImage)inputBlurMap
{
  return self->_inputBlurMap;
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
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v3 = [(PIPhotoEffect3DFilter *)self inputImage];

  if (v3)
  {
    uint64_t v4 = [(PIPhotoEffect3DFilter *)self inputKind];
    if (!v4)
    {
      v21 = NUAssertLogger_15192();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = [NSString stringWithFormat:@"Missing photo effect kind"];
        *(_DWORD *)buf = 138543362;
        v37 = v22;
        _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      v23 = (const void **)MEMORY[0x1E4F7A308];
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      v25 = NUAssertLogger_15192();
      BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v26)
        {
          v29 = dispatch_get_specific(*v23);
          v30 = (void *)MEMORY[0x1E4F29060];
          id v31 = v29;
          v32 = [v30 callStackSymbols];
          v33 = [v32 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          v37 = v29;
          __int16 v38 = 2114;
          v39 = v33;
          _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v26)
      {
        v27 = [MEMORY[0x1E4F29060] callStackSymbols];
        v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v37 = v28;
        _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler();
    }
    v5 = (void *)v4;
    v6 = [@"CIPhotoEffect" stringByAppendingString:v4];
    v7 = [(PIPhotoEffect3DFilter *)self inputIsHDR];
    int v8 = [v7 BOOLValue];

    if (v8)
    {
      uint64_t v9 = +[PIPhotosPipelineHDRFilters HDRFilterForSDRFilter:v6];

      v6 = (void *)v9;
    }
    v10 = [MEMORY[0x1E4F1E040] filterWithName:v6];
    v11 = [(PIPhotoEffect3DFilter *)self inputImage];
    [v10 setValue:v11 forKey:*MEMORY[0x1E4F1E480]];

    [v10 setValue:&unk_1F000A568 forKey:@"inputThreshold"];
    v12 = [(PIPhotoEffect3DFilter *)self inputBlurMap];
    v13 = [v12 imageByApplyingFilter:@"CIGammaAdjust" withInputParameters:&unk_1F000AFD0];

    [v10 setValue:v13 forKey:@"inputDepthMap"];
    v14 = [v10 outputImage];
    v15 = [(PIPhotoEffect3DFilter *)self inputIntensity];

    if (v15)
    {
      v16 = [(PIPhotoEffect3DFilter *)self inputImage];
      v35[0] = v16;
      v34[1] = *MEMORY[0x1E4F1E400];
      v17 = [(PIPhotoEffect3DFilter *)self inputIntensity];
      v35[1] = v17;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
      uint64_t v19 = [v14 imageByApplyingFilter:@"CIMix" withInputParameters:v18];

      v14 = (void *)v19;
    }
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

@end