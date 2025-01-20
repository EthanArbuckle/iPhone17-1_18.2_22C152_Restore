@interface _NUStyleEngineConfiguration
+ (CGSize)coefficientTextureSizeForConfigurationDictionary:(id)a3;
+ (CGSize)coefficientTextureSizeForStyleEngineConfiguration:(id)a3;
- (BOOL)matchesConfiguration:(id)a3;
- (CGSize)coefficientTextureSize;
- (CMIStyleEngineConfiguration)styleEngineConfiguration;
- (NSDictionary)configurationDictionary;
- (NSString)usage;
- (_NUStyleEngineConfiguration)init;
- (_NUStyleEngineConfiguration)initWithConfigurationDictionary:(id)a3;
- (_NUStyleEngineConfiguration)initWithStyleEngineConfiguration:(id)a3;
- (void)setUsage:(id)a3;
@end

@implementation _NUStyleEngineConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usage, 0);

  objc_storeStrong((id *)&self->_styleEngineConfiguration, 0);
}

- (void)setUsage:(id)a3
{
}

- (NSString)usage
{
  return self->_usage;
}

- (CMIStyleEngineConfiguration)styleEngineConfiguration
{
  return self->_styleEngineConfiguration;
}

- (CGSize)coefficientTextureSize
{
  v2 = (void *)MEMORY[0x1E4F55F28];
  styleEngineConfiguration = self->_styleEngineConfiguration;
  uint64_t v4 = [(CMIStyleEngineConfiguration *)styleEngineConfiguration outputCoefficientsF16];

  [v2 coefficientPixelBufferSizeForConfiguration:styleEngineConfiguration float16:v4];
  result.height = v6;
  result.width = v5;
  return result;
}

- (BOOL)matchesConfiguration:(id)a3
{
  id v4 = a3;
  double v5 = [(_NUStyleEngineConfiguration *)self styleEngineConfiguration];
  uint64_t v6 = [v5 linearSystemType];
  v7 = [v4 styleEngineConfiguration];
  uint64_t v8 = [v7 linearSystemType];

  if (v6 != v8) {
    goto LABEL_9;
  }
  v9 = [(_NUStyleEngineConfiguration *)self styleEngineConfiguration];
  uint64_t v10 = [v9 linearSystemOrder];
  v11 = [v4 styleEngineConfiguration];
  uint64_t v12 = [v11 linearSystemOrder];

  if (v10 != v12) {
    goto LABEL_9;
  }
  v13 = [(_NUStyleEngineConfiguration *)self styleEngineConfiguration];
  uint64_t v14 = [v13 linearSystemSolver];
  v15 = [v4 styleEngineConfiguration];
  uint64_t v16 = [v15 linearSystemSolver];

  if (v14 != v16)
  {
LABEL_9:
    char v27 = 0;
    goto LABEL_10;
  }
  v17 = [(_NUStyleEngineConfiguration *)self styleEngineConfiguration];
  [v17 thumbnailSize];
  double v19 = v18;
  double v21 = v20;
  v22 = [v4 styleEngineConfiguration];
  [v22 thumbnailSize];
  double v24 = v23;
  double v26 = v25;

  char v27 = 0;
  if (v19 == v24 && v21 == v26)
  {
    v28 = [(_NUStyleEngineConfiguration *)self styleEngineConfiguration];
    int v29 = [v28 weightPlaneCount];
    v30 = [v4 styleEngineConfiguration];
    int v31 = [v30 weightPlaneCount];

    if (v29 == v31)
    {
      v32 = [(_NUStyleEngineConfiguration *)self styleEngineConfiguration];
      [v32 spotlightCount];
      int32x2_t v34 = v33;
      v35 = [v4 styleEngineConfiguration];
      [v35 spotlightCount];
      uint32x2_t v37 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_s32(v34, v36));
      unsigned __int32 v38 = vpmax_u32(v37, v37).u32[0];

      if ((v38 & 0x80000000) == 0)
      {
        v39 = [(_NUStyleEngineConfiguration *)self styleEngineConfiguration];
        int v40 = [v39 inputCoefficientsF16];
        v41 = [v4 styleEngineConfiguration];
        int v42 = [v41 inputCoefficientsF16];

        if (v40 == v42)
        {
          v44 = [(_NUStyleEngineConfiguration *)self styleEngineConfiguration];
          int v45 = [v44 outputCoefficientsF16];
          v46 = [v4 styleEngineConfiguration];
          int v47 = v45 ^ [v46 outputCoefficientsF16];

          char v27 = v47 ^ 1;
          goto LABEL_10;
        }
      }
    }
    goto LABEL_9;
  }
LABEL_10:

  return v27;
}

- (NSDictionary)configurationDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_usage forKeyedSubscript:@"usage"];
  id v4 = NSNumber;
  [(CMIStyleEngineConfiguration *)self->_styleEngineConfiguration thumbnailSize];
  double v5 = objc_msgSend(v4, "numberWithDouble:");
  [v3 setObject:v5 forKeyedSubscript:@"thumbnailWidth"];

  uint64_t v6 = NSNumber;
  [(CMIStyleEngineConfiguration *)self->_styleEngineConfiguration thumbnailSize];
  uint64_t v8 = [v6 numberWithDouble:v7];
  [v3 setObject:v8 forKeyedSubscript:@"thumbnailHeight"];

  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CMIStyleEngineConfiguration linearSystemType](self->_styleEngineConfiguration, "linearSystemType"));
  [v3 setObject:v9 forKeyedSubscript:@"linearSystemType"];

  uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CMIStyleEngineConfiguration linearSystemOrder](self->_styleEngineConfiguration, "linearSystemOrder"));
  [v3 setObject:v10 forKeyedSubscript:@"linearSystemOrder"];

  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CMIStyleEngineConfiguration linearSystemSolver](self->_styleEngineConfiguration, "linearSystemSolver"));
  [v3 setObject:v11 forKeyedSubscript:@"linearSystemSolver"];

  uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CMIStyleEngineConfiguration weightPlaneCount](self->_styleEngineConfiguration, "weightPlaneCount"));
  [v3 setObject:v12 forKeyedSubscript:@"weightPlaneCount"];

  [(CMIStyleEngineConfiguration *)self->_styleEngineConfiguration spotlightCount];
  unsigned int v29 = v13;
  v15 = [NSNumber numberWithUnsignedInt:v14];
  [v3 setObject:v15 forKeyedSubscript:@"spotlightCountX"];

  uint64_t v16 = [NSNumber numberWithUnsignedInt:v29];
  [v3 setObject:v16 forKeyedSubscript:@"spotlightCountY"];

  v17 = objc_msgSend(NSNumber, "numberWithBool:", -[CMIStyleEngineConfiguration inputCoefficientsF16](self->_styleEngineConfiguration, "inputCoefficientsF16"));
  [v3 setObject:v17 forKeyedSubscript:@"useFloat16"];

  [(CMIStyleEngineConfiguration *)self->_styleEngineConfiguration linearSystemPriorMatrix];
  v30[0] = v18;
  v30[1] = v19;
  v30[2] = v20;
  double v21 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v30 length:48];
  [v3 setObject:v21 forKeyedSubscript:@"priorMatrix"];

  v22 = objc_msgSend(NSNumber, "numberWithBool:", -[CMIStyleEngineConfiguration createAndSolveGlobalLinearSystem](self->_styleEngineConfiguration, "createAndSolveGlobalLinearSystem"));
  [v3 setObject:v22 forKeyedSubscript:@"createAndSolveGlobalLinearSystem"];

  double v23 = NSNumber;
  [(CMIStyleEngineConfiguration *)self->_styleEngineConfiguration globalLinearSystemMixFactor];
  double v24 = objc_msgSend(v23, "numberWithFloat:");
  [v3 setObject:v24 forKeyedSubscript:@"globalLinearSystemMixFactor"];

  double v25 = objc_msgSend(NSNumber, "numberWithBool:", -[CMIStyleEngineConfiguration useBicubicIntegration](self->_styleEngineConfiguration, "useBicubicIntegration"));
  [v3 setObject:v25 forKeyedSubscript:@"useBicubicIntegration"];

  double v26 = objc_msgSend(NSNumber, "numberWithBool:", -[CMIStyleEngineConfiguration applySyntheticNoise](self->_styleEngineConfiguration, "applySyntheticNoise"));
  [v3 setObject:v26 forKeyedSubscript:@"applySyntheticNoise"];

  char v27 = objc_msgSend(NSNumber, "numberWithBool:", -[CMIStyleEngineConfiguration applyDithering](self->_styleEngineConfiguration, "applyDithering"));
  [v3 setObject:v27 forKeyedSubscript:@"applyDithering"];

  return (NSDictionary *)v3;
}

- (_NUStyleEngineConfiguration)initWithConfigurationDictionary:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    int v31 = NUAssertLogger_27648();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "config != nil");
      *(_DWORD *)buf = 138543362;
      v66 = v32;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    int32x2_t v34 = NUAssertLogger_27648();
    BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v35)
      {
        int v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v46 = (void *)MEMORY[0x1E4F29060];
        id v47 = v45;
        v48 = [v46 callStackSymbols];
        v49 = [v48 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v66 = v45;
        __int16 v67 = 2114;
        v68 = v49;
        _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v35)
    {
      int32x2_t v36 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint32x2_t v37 = [v36 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v66 = v37;
      _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUStyleEngineConfiguration initWithConfigurationDictionary:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2378, @"Invalid parameter not satisfying: %s", v50, v51, v52, v53, (uint64_t)"config != nil");
  }
  double v5 = v4;
  v64.receiver = self;
  v64.super_class = (Class)_NUStyleEngineConfiguration;
  uint64_t v6 = [(_NUStyleEngineConfiguration *)&v64 init];
  double v7 = (CMIStyleEngineConfiguration *)objc_alloc_init(MEMORY[0x1E4F55F20]);
  styleEngineConfiguration = v6->_styleEngineConfiguration;
  v6->_styleEngineConfiguration = v7;

  v9 = [v5 objectForKeyedSubscript:@"thumbnailWidth"];
  unint64_t v10 = [v9 unsignedIntegerValue];

  v11 = [v5 objectForKeyedSubscript:@"thumbnailHeight"];
  unint64_t v12 = [v11 unsignedIntegerValue];

  if (!v10 || !v12)
  {
    unsigned __int32 v38 = NUAssertLogger_27648();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = [NSString stringWithFormat:@"Missing thumbnail size"];
      *(_DWORD *)buf = 138543362;
      v66 = v39;
      _os_log_error_impl(&dword_1A9892000, v38, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    int v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v41 = NUAssertLogger_27648();
    BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
    if (v40)
    {
      if (v42)
      {
        v54 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v55 = (void *)MEMORY[0x1E4F29060];
        id v56 = v54;
        v57 = [v55 callStackSymbols];
        v58 = [v57 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v66 = v54;
        __int16 v67 = 2114;
        v68 = v58;
        _os_log_error_impl(&dword_1A9892000, v41, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v42)
    {
      v43 = [MEMORY[0x1E4F29060] callStackSymbols];
      v44 = [v43 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v66 = v44;
      _os_log_error_impl(&dword_1A9892000, v41, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUStyleEngineConfiguration initWithConfigurationDictionary:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2383, @"Missing thumbnail size", v59, v60, v61, v62, v63);
  }
  -[CMIStyleEngineConfiguration setThumbnailSize:](v6->_styleEngineConfiguration, "setThumbnailSize:", (double)v10, (double)v12);
  unsigned int v13 = [v5 objectForKeyedSubscript:@"linearSystemType"];
  -[CMIStyleEngineConfiguration setLinearSystemType:](v6->_styleEngineConfiguration, "setLinearSystemType:", [v13 unsignedIntegerValue]);

  unsigned int v14 = [v5 objectForKeyedSubscript:@"linearSystemOrder"];
  -[CMIStyleEngineConfiguration setLinearSystemOrder:](v6->_styleEngineConfiguration, "setLinearSystemOrder:", [v14 unsignedIntegerValue]);

  v15 = [v5 objectForKeyedSubscript:@"linearSystemSolver"];
  -[CMIStyleEngineConfiguration setLinearSystemSolver:](v6->_styleEngineConfiguration, "setLinearSystemSolver:", [v15 unsignedIntegerValue]);

  uint64_t v16 = [v5 objectForKeyedSubscript:@"weightPlaneCount"];
  -[CMIStyleEngineConfiguration setWeightPlaneCount:](v6->_styleEngineConfiguration, "setWeightPlaneCount:", [v16 unsignedIntValue]);

  v17 = [v5 objectForKeyedSubscript:@"spotlightCountX"];
  unsigned int v18 = [v17 unsignedIntValue];
  long long v19 = [v5 objectForKeyedSubscript:@"spotlightCountY"];
  -[CMIStyleEngineConfiguration setSpotlightCount:](v6->_styleEngineConfiguration, "setSpotlightCount:", COERCE_DOUBLE(__PAIR64__([v19 unsignedIntValue], v18)));

  long long v20 = [v5 objectForKeyedSubscript:@"useFloat16"];
  -[CMIStyleEngineConfiguration setInputCoefficientsF16:](v6->_styleEngineConfiguration, "setInputCoefficientsF16:", [v20 BOOLValue]);

  double v21 = [v5 objectForKeyedSubscript:@"useFloat16"];
  -[CMIStyleEngineConfiguration setOutputCoefficientsF16:](v6->_styleEngineConfiguration, "setOutputCoefficientsF16:", [v21 BOOLValue]);

  v22 = [v5 objectForKeyedSubscript:@"priorMatrix"];
  double v23 = v22;
  if (v22)
  {
    double v24 = (double *)[v22 bytes];
    -[CMIStyleEngineConfiguration setLinearSystemPriorMatrix:](v6->_styleEngineConfiguration, "setLinearSystemPriorMatrix:", *v24, v24[2], v24[4]);
  }
  double v25 = [v5 objectForKeyedSubscript:@"createAndSolveGlobalLinearSystem"];
  -[CMIStyleEngineConfiguration setCreateAndSolveGlobalLinearSystem:](v6->_styleEngineConfiguration, "setCreateAndSolveGlobalLinearSystem:", [v25 BOOLValue]);

  double v26 = [v5 objectForKeyedSubscript:@"globalLinearSystemMixFactor"];
  [v26 floatValue];
  -[CMIStyleEngineConfiguration setGlobalLinearSystemMixFactor:](v6->_styleEngineConfiguration, "setGlobalLinearSystemMixFactor:");

  char v27 = [v5 objectForKeyedSubscript:@"useBicubicIntegration"];
  -[CMIStyleEngineConfiguration setUseBicubicIntegration:](v6->_styleEngineConfiguration, "setUseBicubicIntegration:", [v27 BOOLValue]);

  v28 = [v5 objectForKeyedSubscript:@"applySyntheticNoise"];
  -[CMIStyleEngineConfiguration setApplySyntheticNoise:](v6->_styleEngineConfiguration, "setApplySyntheticNoise:", [v28 BOOLValue]);

  unsigned int v29 = [v5 objectForKeyedSubscript:@"applyDithering"];
  -[CMIStyleEngineConfiguration setApplyDithering:](v6->_styleEngineConfiguration, "setApplyDithering:", [v29 BOOLValue]);

  return v6;
}

- (_NUStyleEngineConfiguration)initWithStyleEngineConfiguration:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = (CMIStyleEngineConfiguration *)a3;
  if (!v4)
  {
    v9 = NUAssertLogger_27648();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      unint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "configuration != nil");
      *(_DWORD *)buf = 138543362;
      char v27 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    unint64_t v12 = NUAssertLogger_27648();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        uint64_t v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v17 = (void *)MEMORY[0x1E4F29060];
        id v18 = v16;
        long long v19 = [v17 callStackSymbols];
        long long v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        char v27 = v16;
        __int16 v28 = 2114;
        unsigned int v29 = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      unsigned int v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      char v27 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUStyleEngineConfiguration initWithStyleEngineConfiguration:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2371, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"configuration != nil");
  }
  double v5 = v4;
  v25.receiver = self;
  v25.super_class = (Class)_NUStyleEngineConfiguration;
  uint64_t v6 = [(_NUStyleEngineConfiguration *)&v25 init];
  styleEngineConfiguration = v6->_styleEngineConfiguration;
  v6->_styleEngineConfiguration = v5;

  return v6;
}

- (_NUStyleEngineConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)_NUStyleEngineConfiguration;
  v2 = [(_NUStyleEngineConfiguration *)&v6 init];
  id v3 = (CMIStyleEngineConfiguration *)objc_alloc_init(MEMORY[0x1E4F55F20]);
  styleEngineConfiguration = v2->_styleEngineConfiguration;
  v2->_styleEngineConfiguration = v3;

  return v2;
}

+ (CGSize)coefficientTextureSizeForStyleEngineConfiguration:(id)a3
{
  id v4 = a3;
  double v5 = (void *)[objc_alloc((Class)a1) initWithStyleEngineConfiguration:v4];

  [v5 coefficientTextureSize];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

+ (CGSize)coefficientTextureSizeForConfigurationDictionary:(id)a3
{
  id v4 = a3;
  double v5 = (void *)[objc_alloc((Class)a1) initWithConfigurationDictionary:v4];

  [v5 coefficientTextureSize];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

@end