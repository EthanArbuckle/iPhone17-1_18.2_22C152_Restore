@interface _NUSourcePipelineBuilder
- (BOOL)buildPipeline:(id)a3 error:(id *)a4;
- (NUSourceSchema)sourceSchema;
- (_NUSourcePipelineBuilder)init;
- (_NUSourcePipelineBuilder)initWithSourceSchema:(id)a3;
- (id)buildPipeline:(id *)a3;
@end

@implementation _NUSourcePipelineBuilder

- (void).cxx_destruct
{
}

- (NUSourceSchema)sourceSchema
{
  return self->_sourceSchema;
}

- (BOOL)buildPipeline:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [NUChannelControlFormat alloc];
  v7 = [(_NUSourcePipelineBuilder *)self sourceSchema];
  v8 = [(NUChannelControlFormat *)v6 initWithControlType:2 dataModel:v7];

  v9 = [[NUChannel alloc] initWithName:@"source" format:v8 index:0];
  v10 = [v5 addInputChannel:v9];
  v11 = +[NUChannel primary];
  id v12 = (id)[v5 addOutputChannel:v11];

  return 1;
}

- (id)buildPipeline:(id *)a3
{
  id v5 = [(_NUSourcePipelineBuilder *)self sourceSchema];
  v6 = [v5 identifier];

  v7 = [[_NUPipeline alloc] initWithIdentifier:v6];
  if ([(_NUSourcePipelineBuilder *)self buildPipeline:v7 error:a3]) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  v9 = v8;

  return v9;
}

- (_NUSourcePipelineBuilder)initWithSourceSchema:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v4 = (NUSourceSchema *)a3;
  if (!v4)
  {
    v9 = NUAssertLogger_5149();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "schema != nil");
      *(_DWORD *)buf = 138543362;
      v27 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v12 = NUAssertLogger_5149();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v17 = (void *)MEMORY[0x1E4F29060];
        id v18 = v16;
        v19 = [v17 callStackSymbols];
        v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v27 = v16;
        __int16 v28 = 2114;
        v29 = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v27 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUSourcePipelineBuilder initWithSourceSchema:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 712, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"schema != nil");
  }
  id v5 = v4;
  v25.receiver = self;
  v25.super_class = (Class)_NUSourcePipelineBuilder;
  v6 = [(_NUSourcePipelineBuilder *)&v25 init];
  sourceSchema = v6->_sourceSchema;
  v6->_sourceSchema = v5;

  return v6;
}

- (_NUSourcePipelineBuilder)init
{
  v3 = +[NUSourceSchema sharedSourceSchema];
  v4 = [(_NUSourcePipelineBuilder *)self initWithSourceSchema:v3];

  return v4;
}

@end