@interface NUSingleSourceDefinition
- (NUSingleSourceDefinition)init;
- (NUSourceDerivation)sourceDerivation;
- (id)generateSourceNodeWithIdentifier:(id)a3 error:(id *)a4;
- (id)sourceContainerNodeWithIdentifier:(id)a3 error:(id *)a4;
- (void)setSourceDerivation:(id)a3;
@end

@implementation NUSingleSourceDefinition

- (id)generateSourceNodeWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_317);
  }
  v5 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v6 = NSString;
    v7 = v5;
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    v10 = [v6 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v9];
    *(_DWORD *)buf = 138543362;
    v30 = v10;
    _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v11 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v11 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_317);
      }
      goto LABEL_8;
    }
    if (v11 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_317);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v12 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v13 = (void *)MEMORY[0x1E4F29060];
    v14 = v12;
    v15 = [v13 callStackSymbols];
    v16 = [v15 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v30 = v16;
    _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v17 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v19 = (void *)MEMORY[0x1E4F29060];
  id v20 = specific;
  v14 = v17;
  v21 = [v19 callStackSymbols];
  v22 = [v21 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v30 = specific;
  __int16 v31 = 2114;
  v32 = v22;
  _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v23 = (objc_class *)objc_opt_class();
  uint64_t v24 = NSStringFromClass(v23);
  _NUAssertFailHandler((uint64_t)"-[NUSingleSourceDefinition(NodeProvider) generateSourceNodeWithIdentifier:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 466, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v25, v26, v27, v28, v24);
}

- (id)sourceContainerNodeWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4)
  {
    v12 = NUAssertLogger_7355();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v30 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v15 = NUAssertLogger_7355();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        v22 = [v20 callStackSymbols];
        v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v30 = v19;
        __int16 v31 = 2114;
        v32 = v23;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v30 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSingleSourceDefinition(NodeProvider) sourceContainerNodeWithIdentifier:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 451, @"Invalid parameter not satisfying: %s", v24, v25, v26, v27, (uint64_t)"error != NULL");
  }
  v7 = v6;
  id v28 = 0;
  v8 = [(NUSingleSourceDefinition *)self generateSourceNodeWithIdentifier:v6 error:&v28];
  id v9 = v28;
  if (v8)
  {
    v10 = [[NUSingleSourceContainerNode alloc] initWithSourceNode:v8 assetIdentifier:v7];
  }
  else
  {
    +[NUError errorWithCode:1 reason:@"Failed to generate source node" object:v7 underlyingError:v9];
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (void).cxx_destruct
{
}

- (void)setSourceDerivation:(id)a3
{
}

- (NUSourceDerivation)sourceDerivation
{
  return (NUSourceDerivation *)objc_getProperty(self, a2, 16, 1);
}

- (NUSingleSourceDefinition)init
{
  v6.receiver = self;
  v6.super_class = (Class)NUSingleSourceDefinition;
  v2 = [(NUSingleSourceDefinition *)&v6 init];
  v3 = objc_alloc_init(NUDefaultSourceDerivation);
  sourceDerivation = v2->_sourceDerivation;
  v2->_sourceDerivation = (NUSourceDerivation *)v3;

  return v2;
}

@end