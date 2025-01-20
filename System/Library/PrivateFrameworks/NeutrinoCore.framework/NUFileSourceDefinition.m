@interface NUFileSourceDefinition
- (BOOL)useEmbeddedPreview;
- (NSString)uti;
- (NSURL)url;
- (NUFileSourceDefinition)init;
- (NUFileSourceDefinition)initWithURL:(id)a3 UTI:(id)a4;
- (id)description;
- (id)generateSourceNodeWithIdentifier:(id)a3 error:(id *)a4;
- (int64_t)mediaType;
- (void)setUseEmbeddedPreview:(BOOL)a3;
@end

@implementation NUFileSourceDefinition

- (id)generateSourceNodeWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v21 = NUAssertLogger_7355();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "identifier != nil");
      *(_DWORD *)buf = 138543362;
      v40 = v22;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v24 = NUAssertLogger_7355();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v29 = (void *)MEMORY[0x1E4F29060];
        id v30 = v28;
        v31 = [v29 callStackSymbols];
        v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v40 = v28;
        __int16 v41 = 2114;
        v42 = v32;
        _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v40 = v27;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUFileSourceDefinition(NodeProvider) generateSourceNodeWithIdentifier:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 513, @"Invalid parameter not satisfying: %s", v33, v34, v35, v36, (uint64_t)"identifier != nil");
  }
  v6 = v5;
  BOOL v7 = [(NUFileSourceDefinition *)self useEmbeddedPreview];
  v8 = [(NUFileSourceDefinition *)self uti];
  v9 = [MEMORY[0x1E4F8CDF8] typeWithIdentifier:v8];
  if (![v9 conformsToType:*MEMORY[0x1E4F44498]]
    || v7
    || +[NUGlobalSettings imageSourceDisableRAW])
  {
    if (![v9 conformsToType:*MEMORY[0x1E4F44448]])
    {
      v14 = [NUCGImageSourceNode alloc];
      v15 = [(NUFileSourceDefinition *)self url];
      v37 = @"useEmbeddedPreview";
      v16 = [NSNumber numberWithBool:v7];
      v38 = v16;
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      v13 = [(NUCGImageSourceNode *)v14 initWithURL:v15 UTI:v8 identifier:v6 options:v17];

      goto LABEL_10;
    }
    v10 = [NUVideoSourceNode alloc];
    v11 = [(NUFileSourceDefinition *)self url];
    v12 = [(NUSourceDefinition *)self sourceOptions];
    v13 = [(NUVideoSourceNode *)v10 initWithURL:v11 identifier:v6 options:v12];
  }
  else
  {
    v18 = [NURAWImageSourceNode alloc];
    v11 = [(NUFileSourceDefinition *)self url];
    v13 = [(NURAWImageSourceNode *)v18 initWithURL:v11 UTI:v8 identifier:v6];
  }

LABEL_10:
  v19 = [(NUSingleSourceDefinition *)self sourceDerivation];
  [(NUSourceNode *)v13 setSourceDerivation:v19];

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uti, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

- (void)setUseEmbeddedPreview:(BOOL)a3
{
  self->_useEmbeddedPreview = a3;
}

- (BOOL)useEmbeddedPreview
{
  return self->_useEmbeddedPreview;
}

- (NSString)uti
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p uti=%@ url=%@>", objc_opt_class(), self, self->_uti, self->_url];
}

- (int64_t)mediaType
{
  if (!self->_uti) {
    return 0;
  }
  v2 = objc_msgSend(MEMORY[0x1E4F442D8], "typeWithIdentifier:");
  if ([v2 conformsToType:*MEMORY[0x1E4F44400]])
  {

    return 1;
  }
  char v4 = [v2 conformsToType:*MEMORY[0x1E4F44448]];

  if (v4) {
    return 2;
  }
  else {
    return 0;
  }
}

- (NUFileSourceDefinition)initWithURL:(id)a3 UTI:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v6 = (NSURL *)a3;
  BOOL v7 = (NSString *)a4;
  if (!v6)
  {
    v14 = NUAssertLogger_7993();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "url != nil");
      *(_DWORD *)buf = 138543362;
      v32 = v15;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v17 = NUAssertLogger_7993();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v22 = (void *)MEMORY[0x1E4F29060];
        id v23 = v21;
        v24 = [v22 callStackSymbols];
        BOOL v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v32 = v21;
        __int16 v33 = 2114;
        uint64_t v34 = v25;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v32 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUFileSourceDefinition initWithURL:UTI:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUSource.m", 132, @"Invalid parameter not satisfying: %s", v26, v27, v28, v29, (uint64_t)"url != nil");
  }
  v8 = v7;
  v30.receiver = self;
  v30.super_class = (Class)NUFileSourceDefinition;
  v9 = [(NUSingleSourceDefinition *)&v30 init];
  url = v9->_url;
  v9->_url = v6;
  v11 = v6;

  uti = v9->_uti;
  v9->_uti = v8;

  return v9;
}

- (NUFileSourceDefinition)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_8007);
  }
  v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    char v4 = NSString;
    id v5 = v3;
    v6 = (objc_class *)objc_opt_class();
    BOOL v7 = NSStringFromClass(v6);
    v8 = NSStringFromSelector(a2);
    v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_8007);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_8007);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v12 = (void *)MEMORY[0x1E4F29060];
    v13 = v11;
    v14 = [v12 callStackSymbols];
    v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  BOOL v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  v13 = v16;
  v20 = [v18 callStackSymbols];
  v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v29 = specific;
  __int16 v30 = 2114;
  v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUFileSourceDefinition init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUSource.m", 127, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

@end