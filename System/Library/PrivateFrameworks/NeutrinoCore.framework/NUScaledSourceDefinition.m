@interface NUScaledSourceDefinition
- ($0AC6E346AE4835514AAA8AC86D8F4844)fullSize;
- ($0AC6E346AE4835514AAA8AC86D8F4844)scale;
- ($0AC6E346AE4835514AAA8AC86D8F4844)sourceSize;
- (NUScaledSourceDefinition)initWithSourceDefinition:(id)a3 sourceSize:(id)a4 fullSize:(id)a5;
- (NUSingleSourceDefinition)source;
- (id)description;
- (id)sourceContainerNodeWithIdentifier:(id)a3 error:(id *)a4;
- (int64_t)mediaType;
@end

@implementation NUScaledSourceDefinition

- (id)sourceContainerNodeWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4)
  {
    v23 = NUAssertLogger_7355();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v42 = v24;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v26 = NUAssertLogger_7355();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v31 = (void *)MEMORY[0x1E4F29060];
        id v32 = v30;
        v33 = [v31 callStackSymbols];
        v34 = [v33 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v42 = v30;
        __int16 v43 = 2114;
        v44 = v34;
        _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v27)
    {
      v28 = [MEMORY[0x1E4F29060] callStackSymbols];
      v29 = [v28 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v42 = v29;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUScaledSourceDefinition(NodeProvider) sourceContainerNodeWithIdentifier:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 475, @"Invalid parameter not satisfying: %s", v35, v36, v37, v38, (uint64_t)"error != NULL");
  }
  v7 = v6;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = objc_alloc(MEMORY[0x1E4F1E050]);
  v10 = [MEMORY[0x1E4F1E008] whiteColor];
  v11 = (void *)[v9 initWithColor:v10];

  double v12 = (double)[(NUScaledSourceDefinition *)self fullSize];
  [(NUScaledSourceDefinition *)self fullSize];
  v14 = objc_msgSend(v11, "imageByCroppingToRect:", 0.0, 0.0, v12, (double)v13);

  v15 = [[NUCIImageSourceDefinition alloc] initWithCIImage:v14 orientation:1];
  id v40 = 0;
  v16 = [(NUCIImageSourceDefinition *)v15 generateSourceNodeWithIdentifier:v7 error:&v40];
  id v17 = v40;
  if (v16)
  {
    v18 = [(NUScaledSourceDefinition *)self source];
    id v39 = 0;
    v19 = [v18 generateSourceNodeWithIdentifier:v7 error:&v39];
    id v20 = v39;

    if (v19)
    {
      [v8 addObject:v16];
      [v8 addObject:v19];
      v21 = [(NUMultipleSourceContainerNode *)[NUScaledSourceContainerNode alloc] initWithSourceNodes:v8 assetIdentifier:v7];
    }
    else
    {
      +[NUError errorWithCode:1 reason:@"Failed to generate source node" object:v7 underlyingError:v20];
      v21 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    +[NUError errorWithCode:1 reason:@"Failed to generate dummy full size source node" object:v7 underlyingError:v17];
    v21 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    id v20 = v17;
  }

  return v21;
}

- (void).cxx_destruct
{
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)fullSize
{
  objc_copyStruct(v4, &self->_fullSize, 16, 1, 0);
  int64_t v2 = v4[0];
  int64_t v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)sourceSize
{
  objc_copyStruct(v4, &self->_sourceSize, 16, 1, 0);
  int64_t v2 = v4[0];
  int64_t v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (NUSingleSourceDefinition)source
{
  return (NUSingleSourceDefinition *)objc_getProperty(self, a2, 24, 1);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p fullSize:(%li,%li) sourceSize:(%li,%li) source:%@>", objc_opt_class(), self, self->_fullSize.width, self->_fullSize.height, self->_sourceSize.width, self->_sourceSize.height, self->_source];
}

- (int64_t)mediaType
{
  return [(NUSourceDefinition *)self->_source mediaType];
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)scale
{
  int64_t v3 = objc_alloc_init(NUDefaultSourceDerivation);
  uint64_t v4 = -[NUDefaultSourceDerivation scaleFromOriginalSize:derivativeSize:](v3, "scaleFromOriginalSize:derivativeSize:", self->_fullSize.width, self->_fullSize.height, self->_sourceSize.width, self->_sourceSize.height);
  int64_t v6 = v5;

  int64_t v7 = v4;
  int64_t v8 = v6;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (NUScaledSourceDefinition)initWithSourceDefinition:(id)a3 sourceSize:(id)a4 fullSize:(id)a5
{
  int64_t var1 = a5.var1;
  int64_t var0 = a5.var0;
  int64_t v7 = a4.var1;
  int64_t v8 = a4.var0;
  v10 = (NUSingleSourceDefinition *)a3;
  v14.receiver = self;
  v14.super_class = (Class)NUScaledSourceDefinition;
  v11 = [(NUSingleSourceDefinition *)&v14 init];
  source = v11->_source;
  v11->_source = v10;

  v11->_sourceSize.width = v8;
  v11->_sourceSize.height = v7;
  v11->_fullSize.width = var0;
  v11->_fullSize.height = var1;
  return v11;
}

@end