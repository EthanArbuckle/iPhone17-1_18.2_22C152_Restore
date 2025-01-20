@interface NUMaskSource
- ($0AC6E346AE4835514AAA8AC86D8F4844)scale;
- ($8D19A3D7F6B32A57CF9B882F3E1C418F)extent;
- (NUMaskSource)initWithContentsOfURL:(id)a3 identifier:(id)a4 extent:(id *)a5 scale:(id)a6;
- (NUMaskSource)initWithImage:(id)a3 identifier:(id)a4 extent:(id *)a5 scale:(id)a6;
- (NUMaskSource)initWithImageBuffer:(id)a3 identifier:(id)a4 extent:(id *)a5 scale:(id)a6;
- (id)_initWithDefinition:(id)a3 identifier:(id)a4 extent:(id *)a5 scale:(id)a6;
- (id)newSourceNode:(id *)a3;
- (id)sourceImage:(id *)a3;
@end

@implementation NUMaskSource

- ($0AC6E346AE4835514AAA8AC86D8F4844)scale
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v2 = [(NUSource *)self settings];
  v3 = [v2 objectForKeyedSubscript:@"scale"];

  if (!v3)
  {
    v8 = NUAssertLogger_23719();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = [NSString stringWithFormat:@"missing scale"];
      *(_DWORD *)v40 = 138543362;
      *(void *)&v40[4] = v9;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v40, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v11 = NUAssertLogger_23719();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v23 = (void *)MEMORY[0x1E4F29060];
        id v24 = v22;
        v25 = [v23 callStackSymbols];
        v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)v40 = 138543618;
        *(void *)&v40[4] = v22;
        *(_WORD *)&v40[12] = 2114;
        *(void *)&v40[14] = v26;
        _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v40, 0x16u);
      }
    }
    else if (v12)
    {
      v13 = [MEMORY[0x1E4F29060] callStackSymbols];
      v14 = [v13 componentsJoinedByString:@"\n"];
      *(_DWORD *)v40 = 138543362;
      *(void *)&v40[4] = v14;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v40, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUMaskSource scale]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Mask/NUMaskSource.m", 207, @"missing scale", v27, v28, v29, v30, *(uint64_t *)v40);
  }
  id v4 = v3;
  if (strncmp((const char *)[v4 objCType], "{?=qq}", 6uLL))
  {
    v15 = NUAssertLogger_23719();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = [NSString stringWithFormat:@"wrong value type"];
      *(_DWORD *)v40 = 138543362;
      *(void *)&v40[4] = v16;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v40, 0xCu);
    }
    v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v18 = NUAssertLogger_23719();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (v17)
    {
      if (v19)
      {
        v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v32 = (void *)MEMORY[0x1E4F29060];
        id v33 = v31;
        v34 = [v32 callStackSymbols];
        v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)v40 = 138543618;
        *(void *)&v40[4] = v31;
        *(_WORD *)&v40[12] = 2114;
        *(void *)&v40[14] = v35;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v40, 0x16u);
      }
    }
    else if (v19)
    {
      v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)v40 = 138543362;
      *(void *)&v40[4] = v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v40, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUMaskSource scale]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Mask/NUMaskSource.m", 208, @"wrong value type", v36, v37, v38, v39, *(uint64_t *)v40);
  }
  *(_OWORD *)v40 = NUScaleUnknown;
  [v4 getValue:v40];
  unsigned long long v5 = *(_OWORD *)v40;

  int64_t v7 = v5 >> 64;
  int64_t v6 = v5;
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- ($8D19A3D7F6B32A57CF9B882F3E1C418F)extent
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v3 = [(NUSource *)self settings];
  id v4 = [v3 objectForKeyedSubscript:@"extent"];

  if (!v4)
  {
    int64_t v6 = NUAssertLogger_23719();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int64_t v7 = [NSString stringWithFormat:@"missing extent"];
      *(_DWORD *)buf = 138543362;
      uint64_t v41 = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v9 = NUAssertLogger_23719();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v21 = (void *)MEMORY[0x1E4F29060];
        id v22 = v20;
        v23 = [v21 callStackSymbols];
        id v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v41 = v20;
        __int16 v42 = 2114;
        v43 = v24;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v41 = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUMaskSource extent]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Mask/NUMaskSource.m", 198, @"missing extent", v25, v26, v27, v28, v38);
  }
  id v39 = v4;
  if (strncmp((const char *)[v39 objCType], "{?={?=qq}{?=qq}}", 0x10uLL))
  {
    v13 = NUAssertLogger_23719();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = [NSString stringWithFormat:@"wrong value type"];
      *(_DWORD *)buf = 138543362;
      uint64_t v41 = v14;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v16 = NUAssertLogger_23719();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (v15)
    {
      if (v17)
      {
        uint64_t v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v30 = (void *)MEMORY[0x1E4F29060];
        id v31 = v29;
        v32 = [v30 callStackSymbols];
        id v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v41 = v29;
        __int16 v42 = 2114;
        v43 = v33;
        _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v41 = v19;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUMaskSource extent]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Mask/NUMaskSource.m", 199, @"wrong value type", v34, v35, v36, v37, v38);
  }
  objc_msgSend(v39, "nu_pixelRect");

  return result;
}

- (NUMaskSource)initWithContentsOfURL:(id)a3 identifier:(id)a4 extent:(id *)a5 scale:(id)a6
{
  int64_t var1 = a6.var1;
  int64_t var0 = a6.var0;
  id v11 = a4;
  id v12 = a3;
  v13 = [[NUFileSourceDefinition alloc] initWithURL:v12 UTI:0];

  $0AC6E346AE4835514AAA8AC86D8F4844 v14 = a5->var1;
  v17[0] = a5->var0;
  v17[1] = v14;
  v15 = -[NUMaskSource _initWithDefinition:identifier:extent:scale:](self, "_initWithDefinition:identifier:extent:scale:", v13, v11, v17, var0, var1);

  return v15;
}

- (NUMaskSource)initWithImage:(id)a3 identifier:(id)a4 extent:(id *)a5 scale:(id)a6
{
  int64_t var1 = a6.var1;
  int64_t var0 = a6.var0;
  id v11 = a4;
  id v12 = a3;
  v13 = [NUMaskSourceDefinition alloc];
  $0AC6E346AE4835514AAA8AC86D8F4844 v14 = a5->var1;
  $0AC6E346AE4835514AAA8AC86D8F4844 v19 = a5->var0;
  $0AC6E346AE4835514AAA8AC86D8F4844 v20 = v14;
  v15 = -[NUMaskSourceDefinition initWithCIImage:croppedExtent:scale:orientation:](v13, "initWithCIImage:croppedExtent:scale:orientation:", v12, &v19, var0, var1, 1);

  $0AC6E346AE4835514AAA8AC86D8F4844 v16 = a5->var1;
  $0AC6E346AE4835514AAA8AC86D8F4844 v19 = a5->var0;
  $0AC6E346AE4835514AAA8AC86D8F4844 v20 = v16;
  BOOL v17 = -[NUMaskSource _initWithDefinition:identifier:extent:scale:](self, "_initWithDefinition:identifier:extent:scale:", v15, v11, &v19, var0, var1);

  return v17;
}

- (NUMaskSource)initWithImageBuffer:(id)a3 identifier:(id)a4 extent:(id *)a5 scale:(id)a6
{
  int64_t var1 = a6.var1;
  int64_t var0 = a6.var0;
  id v11 = a4;
  uint64_t v12 = [a3 CVPixelBuffer];
  v13 = [MEMORY[0x1E4F1E050] imageWithCVPixelBuffer:v12];
  $0AC6E346AE4835514AAA8AC86D8F4844 v14 = a5->var1;
  v17[0] = a5->var0;
  v17[1] = v14;
  v15 = -[NUMaskSource initWithImage:identifier:extent:scale:](self, "initWithImage:identifier:extent:scale:", v13, v11, v17, var0, var1);

  return v15;
}

- (id)_initWithDefinition:(id)a3 identifier:(id)a4 extent:(id *)a5 scale:(id)a6
{
  int64_t var1 = a6.var1;
  int64_t var0 = a6.var0;
  id v11 = a3;
  id v12 = a4;
  v13 = +[NUSourceSchema sharedSourceSchema];
  v21.receiver = self;
  v21.super_class = (Class)NUMaskSource;
  $0AC6E346AE4835514AAA8AC86D8F4844 v14 = [(NUSource *)&v21 initWithSourceSchema:v13];

  if (v14)
  {
    [(NUSource *)v14 setAssetIdentifier:v12];
    [(NUSource *)v14 setDefinition:v11];
    v15 = objc_opt_new();
    $0AC6E346AE4835514AAA8AC86D8F4844 v16 = a5->var1;
    v20[0] = a5->var0;
    v20[1] = v16;
    BOOL v17 = objc_msgSend(MEMORY[0x1E4F29238], "nu_valueWithPixelRect:", v20);
    [v15 setObject:v17 forKeyedSubscript:@"extent"];

    v18 = NUScaleToValue(var0, var1);
    [v15 setObject:v18 forKeyedSubscript:@"scale"];

    [(NUSource *)v14 setSettings:v15];
  }

  return v14;
}

- (id)sourceImage:(id *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v15 = NUAssertLogger_23719();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      $0AC6E346AE4835514AAA8AC86D8F4844 v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v32 = v16;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v18 = NUAssertLogger_23719();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        id v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v23 = (void *)MEMORY[0x1E4F29060];
        id v24 = v22;
        uint64_t v25 = [v23 callStackSymbols];
        uint64_t v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v32 = v22;
        __int16 v33 = 2114;
        uint64_t v34 = v26;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      $0AC6E346AE4835514AAA8AC86D8F4844 v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      objc_super v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v32 = v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUMaskSource(MaskEvaluation) sourceImage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Mask/NUMaskSource.m", 242, @"Invalid parameter not satisfying: %s", v27, v28, v29, v30, (uint64_t)"error != NULL");
  }
  unsigned long long v5 = [(NUSource *)self definition];

  if (v5)
  {
    int64_t v6 = [(NUSource *)self definition];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    v8 = [(NUSource *)self definition];
    v9 = v8;
    if (isKindOfClass)
    {
      BOOL v10 = [v8 image];
    }
    else
    {
      objc_opt_class();
      char v11 = objc_opt_isKindOfClass();

      v9 = [(NUSource *)self definition];
      if (v11)
      {
        id v12 = objc_alloc(MEMORY[0x1E4F1E050]);
        v13 = [v9 url];
        BOOL v10 = (void *)[v12 initWithContentsOfURL:v13];
      }
      else
      {
        +[NUError unsupportedError:@"Unexpected source definition kind" object:v9];
        BOOL v10 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  else
  {
    +[NUError missingError:@"Missing source" object:self];
    BOOL v10 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)newSourceNode:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    char v11 = NUAssertLogger_23719();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v28 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    $0AC6E346AE4835514AAA8AC86D8F4844 v14 = NUAssertLogger_23719();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v19 = (void *)MEMORY[0x1E4F29060];
        id v20 = v18;
        objc_super v21 = [v19 callStackSymbols];
        id v22 = [v21 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v28 = v18;
        __int16 v29 = 2114;
        uint64_t v30 = v22;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      $0AC6E346AE4835514AAA8AC86D8F4844 v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v28 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUMaskSource(MaskEvaluation) newSourceNode:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Mask/NUMaskSource.m", 219, @"Invalid parameter not satisfying: %s", v23, v24, v25, v26, (uint64_t)"error != NULL");
  }
  unsigned long long v5 = [(NUSource *)self definition];
  if (!v5)
  {
    v9 = +[NUError missingError:@"Missing source" object:self];
LABEL_9:
    int64_t v7 = 0;
    *a3 = v9;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = +[NUError invalidError:@"Unexpected source definition kind" object:v5];
    goto LABEL_9;
  }
  int64_t v6 = [(NUSource *)self assetIdentifier];
  int64_t v7 = [v5 generateSourceNodeWithIdentifier:v6 error:a3];

  if (v7) {
    id v8 = v7;
  }

LABEL_10:
  return v7;
}

@end