@interface PIFakeBoost
+ (NSString)currentVersion;
+ (id)boostParametersFromRawProperties:(id)a3;
+ (id)kernelFB0;
+ (id)kernelFB3;
- (CIImage)inputImage;
- (NSArray)inputParams;
- (NSString)inputVersion;
- (double)inputBoost;
- (id)outputImage;
- (id)outputImageFB0;
- (id)outputImageFB3;
- (void)setInputBoost:(double)a3;
- (void)setInputImage:(id)a3;
- (void)setInputParams:(id)a3;
- (void)setInputVersion:(id)a3;
@end

@implementation PIFakeBoost

+ (id)boostParametersFromRawProperties:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    v24 = NUAssertLogger_12800();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "properties != nil");
      *(_DWORD *)buf = 138543362;
      v39 = v25;
      _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v26 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v28 = NUAssertLogger_12800();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v29)
      {
        v32 = dispatch_get_specific(*v26);
        v33 = (void *)MEMORY[0x1E4F29060];
        id v34 = v32;
        v35 = [v33 callStackSymbols];
        v36 = [v35 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v39 = v32;
        __int16 v40 = 2114;
        v41 = v36;
        _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v29)
    {
      v30 = [MEMORY[0x1E4F29060] callStackSymbols];
      v31 = [v30 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v39 = v31;
      _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v4 = v3;
  v5 = [v3 rawToneCurveProperties];
  v7 = v5;
  if (v5)
  {
    LODWORD(v6) = 1045220557;
    [v5 boostCurveValueAt:v6];
    int v9 = v8;
    LODWORD(v10) = 0.5;
    [v7 boostCurveValueAt:v10];
    int v12 = v11;
    LODWORD(v13) = 1061997773;
    [v7 boostCurveValueAt:v13];
    int v15 = v14;
    LODWORD(v16) = v9;
    v17 = [NSNumber numberWithFloat:v16];
    v37[0] = v17;
    LODWORD(v18) = v12;
    v19 = [NSNumber numberWithFloat:v18];
    v37[1] = v19;
    LODWORD(v20) = v15;
    v21 = [NSNumber numberWithFloat:v20];
    v37[2] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:3];
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (NSString)currentVersion
{
  return (NSString *)@"FB3";
}

+ (id)kernelFB3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    id v3 = (os_log_t *)MEMORY[0x1E4F7A748];
    v4 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      v5 = NSString;
      double v6 = v4;
      v7 = (objc_class *)objc_opt_class();
      int v8 = NSStringFromClass(v7);
      int v9 = [v5 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v8];
      *(_DWORD *)buf = 138543362;
      v23 = v9;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v10 = *v2;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v10 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_101_12816);
        }
LABEL_7:
        os_log_t v11 = *v3;
        if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
        {
          int v12 = (void *)MEMORY[0x1E4F29060];
          double v13 = v11;
          int v14 = [v12 callStackSymbols];
          int v15 = [v14 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v23 = v15;
          _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v10 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_101_12816);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v16 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      double v18 = (void *)MEMORY[0x1E4F29060];
      id v19 = specific;
      double v13 = v16;
      double v20 = [v18 callStackSymbols];
      v2 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v23 = specific;
      __int16 v24 = 2114;
      v25 = v2;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_101_12816);
  }
}

+ (id)kernelFB0
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    id v3 = (os_log_t *)MEMORY[0x1E4F7A748];
    v4 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      v5 = NSString;
      double v6 = v4;
      v7 = (objc_class *)objc_opt_class();
      int v8 = NSStringFromClass(v7);
      int v9 = [v5 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v8];
      *(_DWORD *)buf = 138543362;
      v23 = v9;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v10 = *v2;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v10 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_101_12816);
        }
LABEL_7:
        os_log_t v11 = *v3;
        if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
        {
          int v12 = (void *)MEMORY[0x1E4F29060];
          double v13 = v11;
          int v14 = [v12 callStackSymbols];
          int v15 = [v14 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v23 = v15;
          _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v10 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_101_12816);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v16 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      double v18 = (void *)MEMORY[0x1E4F29060];
      id v19 = specific;
      double v13 = v16;
      double v20 = [v18 callStackSymbols];
      v2 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v23 = specific;
      __int16 v24 = 2114;
      v25 = v2;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_101_12816);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputParams, 0);
  objc_storeStrong((id *)&self->_inputVersion, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

- (void)setInputParams:(id)a3
{
}

- (NSArray)inputParams
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputVersion:(id)a3
{
}

- (NSString)inputVersion
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputBoost:(double)a3
{
  self->_inputBoost = a3;
}

- (double)inputBoost
{
  return self->_inputBoost;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (id)outputImageFB3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  inputImage = self->_inputImage;
  if (!inputImage)
  {
    v41 = NUAssertLogger_12800();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      uint64_t v42 = [NSString stringWithFormat:@"inputImage cannot be nil"];
      *(_DWORD *)buf = 138543362;
      v75 = v42;
      _os_log_error_impl(&dword_1A9680000, v41, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v43 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v45 = NUAssertLogger_12800();
    BOOL v46 = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v46)
      {
        v60 = dispatch_get_specific(*v43);
        v61 = (void *)MEMORY[0x1E4F29060];
        id v62 = v60;
        v43 = [v61 callStackSymbols];
        v63 = [v43 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v75 = (const void **)v60;
        __int16 v76 = 2114;
        v77 = v63;
        _os_log_error_impl(&dword_1A9680000, v45, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v46)
    {
      v47 = [MEMORY[0x1E4F29060] callStackSymbols];
      v43 = [v47 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v75 = v43;
      _os_log_error_impl(&dword_1A9680000, v45, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v51 = _NUAssertFailHandler();
    goto LABEL_29;
  }
  v4 = [(CIImage *)inputImage imageByUnpremultiplyingAlpha];
  if ([(NSArray *)self->_inputParams count] != 3)
  {
    v48 = NUAssertLogger_12800();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v49 = [NSString stringWithFormat:@"Invalid boost parameters"];
      *(_DWORD *)buf = 138543362;
      v75 = v49;
      _os_log_error_impl(&dword_1A9680000, v48, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v43 = (const void **)MEMORY[0x1E4F7A308];
    v50 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v45 = NUAssertLogger_12800();
    int v51 = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
    if (!v50)
    {
      if (v51)
      {
        v52 = [MEMORY[0x1E4F29060] callStackSymbols];
        v43 = [v52 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v75 = v43;
        _os_log_error_impl(&dword_1A9680000, v45, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_31:

      int v57 = _NUAssertFailHandler();
      goto LABEL_32;
    }
LABEL_29:
    if (v51)
    {
      v64 = dispatch_get_specific(*v43);
      v65 = (void *)MEMORY[0x1E4F29060];
      id v66 = v64;
      v43 = [v65 callStackSymbols];
      v67 = [v43 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v75 = (const void **)v64;
      __int16 v76 = 2114;
      v77 = v67;
      _os_log_error_impl(&dword_1A9680000, v45, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_31;
  }
  v5 = [(NSArray *)self->_inputParams objectAtIndexedSubscript:0];
  [v5 floatValue];
  float v7 = v6;

  int v8 = [(NSArray *)self->_inputParams objectAtIndexedSubscript:1];
  [v8 floatValue];
  float v10 = v9;

  os_log_t v11 = [(NSArray *)self->_inputParams objectAtIndexedSubscript:2];
  [v11 floatValue];
  float v13 = v12;

  if (v7 >= v10 || v10 >= v13)
  {
    v53 = NUAssertLogger_12800();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      v55 = [NSString stringWithFormat:@"Invalid points parameters"];
      *(_DWORD *)buf = 138543362;
      v75 = v55;
      _os_log_error_impl(&dword_1A9680000, v53, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v43 = (const void **)MEMORY[0x1E4F7A308];
    v56 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v45 = NUAssertLogger_12800();
    int v57 = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
    if (!v56)
    {
      if (v57)
      {
        v58 = [MEMORY[0x1E4F29060] callStackSymbols];
        v59 = [v58 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v75 = v59;
        _os_log_error_impl(&dword_1A9680000, v45, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_34;
    }
LABEL_32:
    if (v57)
    {
      v68 = dispatch_get_specific(*v43);
      v69 = (void *)MEMORY[0x1E4F29060];
      id v70 = v68;
      v71 = [v69 callStackSymbols];
      v72 = [v71 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v75 = (const void **)v68;
      __int16 v76 = 2114;
      v77 = v72;
      _os_log_error_impl(&dword_1A9680000, v45, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_34:

    _NUAssertFailHandler();
  }
  float v15 = (float)(v7 * -0.2) + (float)(v13 * 0.8);
  float v16 = (float)(v7 * -0.2) + (float)(v10 * 0.5);
  float v17 = (float)((float)(v10 - v7) * v15) - (float)((float)(v13 - v7) * v16);
  float v18 = (float)((float)(v13 - v7) * -0.3) + (float)((float)(v10 - v7) * 0.6);
  float v19 = (float)(v16 * -0.6) + (float)(v15 * 0.3);
  float v20 = (float)((float)(v7 * (float)(v18 * 0.2)) + (float)(v19 * v7)) + (float)(v17 * -0.2);
  float v21 = (float)(v17 * v19) - (float)(v20 * v18);
  float v22 = v21 / (float)((float)(v19 + (float)(v18 * 0.2)) * (float)(v19 + (float)(v18 * 0.2)));
  float v23 = v21 / (float)((float)(v19 + (float)(v18 * 0.8)) * (float)(v19 + (float)(v18 * 0.8)));
  __int16 v24 = [MEMORY[0x1E4F1E080] vectorWithX:v17 Y:v20 Z:v18 W:v19];
  v25 = [MEMORY[0x1E4F1E080] vectorWithX:0.200000003 Y:v7 Z:v22];
  uint64_t v26 = [MEMORY[0x1E4F1E080] vectorWithX:0.800000012 Y:v13 Z:v23];
  v27 = [(id)objc_opt_class() kernelFB3];
  [(CIImage *)self->_inputImage extent];
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  v73[0] = v4;
  v36 = [NSNumber numberWithDouble:self->_inputBoost];
  v73[1] = v36;
  v73[2] = v24;
  v73[3] = v25;
  v73[4] = v26;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:5];
  v38 = objc_msgSend(v27, "applyWithExtent:arguments:", v37, v29, v31, v33, v35);

  v39 = [v38 imageByPremultiplyingAlpha];

  return v39;
}

- (id)outputImageFB0
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  inputImage = self->_inputImage;
  if (!inputImage)
  {
    float v19 = NUAssertLogger_12800();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      float v20 = [NSString stringWithFormat:@"inputImage cannot be nil"];
      *(_DWORD *)buf = 138543362;
      double v34 = v20;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    float v21 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    float v23 = NUAssertLogger_12800();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v27 = dispatch_get_specific(*v21);
        double v28 = (void *)MEMORY[0x1E4F29060];
        id v29 = v27;
        double v30 = [v28 callStackSymbols];
        double v31 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        double v34 = v27;
        __int16 v35 = 2114;
        v36 = v31;
        _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      double v34 = v26;
      _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v4 = [(CIImage *)inputImage imageByUnpremultiplyingAlpha];
  v5 = [(id)objc_opt_class() kernelFB0];
  [(CIImage *)self->_inputImage extent];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  int v14 = objc_msgSend(NSNumber, "numberWithDouble:", self->_inputBoost, v4);
  v32[1] = v14;
  float v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  float v16 = objc_msgSend(v5, "applyWithExtent:arguments:", v15, v7, v9, v11, v13);

  float v17 = [v16 imageByPremultiplyingAlpha];

  return v17;
}

- (id)outputImage
{
  if ([(NSString *)self->_inputVersion isEqualToString:@"FB3"]) {
    [(PIFakeBoost *)self outputImageFB3];
  }
  else {
  id v3 = [(PIFakeBoost *)self outputImageFB0];
  }
  return v3;
}

@end