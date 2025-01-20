@interface PIAutoLoopAutoCalculator
+ (id)pipelineFilterForCorruptedVideoMitigation;
- (PIAutoLoopAutoCalculator)initWithComposition:(id)a3;
- (int64_t)flavor;
- (void)setFlavor:(int64_t)a3;
- (void)submit:(id)a3;
@end

@implementation PIAutoLoopAutoCalculator

- (void)setFlavor:(int64_t)a3
{
  self->_flavor = a3;
}

- (int64_t)flavor
{
  return self->_flavor;
}

- (void)submit:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v20 = NUAssertLogger_6017();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "completion != nil");
      *(_DWORD *)buf = 138543362;
      v37 = v21;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v22 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v24 = NUAssertLogger_6017();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        v28 = dispatch_get_specific(*v22);
        v29 = (void *)MEMORY[0x1E4F29060];
        id v30 = v28;
        v31 = [v29 callStackSymbols];
        v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v37 = v28;
        __int16 v38 = 2114;
        v39 = v32;
        _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v37 = v27;
      _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v5 = (void (**)(void, void))v4;
  v6 = [(NURenderRequest *)self composition];
  if ([v6 mediaType] == 3)
  {
  }
  else
  {
    v7 = [(NURenderRequest *)self composition];
    uint64_t v8 = [v7 mediaType];

    if (v8 != 2)
    {
      v18 = (void *)MEMORY[0x1E4F7A438];
      v19 = (void *)[(PIAutoLoopAutoCalculator *)self copy];
      v10 = [v18 invalidError:@"PIAutoLoopAutoCalculator requires a video" object:v19];

      v16 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v10];
      ((void (**)(void, void *))v5)[2](v5, v16);
      goto LABEL_10;
    }
  }
  v9 = [(NURenderRequest *)self composition];
  v10 = [v9 objectForKeyedSubscript:@"autoLoop"];

  if (!v10
    || ([v10 objectForKeyedSubscript:@"recipe"],
        v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        !v11))
  {
    v15 = [(NURenderRequest *)[PIAutoLoopAnalysisRequest alloc] initWithRequest:self];
    [(PIAutoLoopAnalysisRequest *)v15 setFlavor:[(PIAutoLoopAutoCalculator *)self flavor]];
    v16 = (void *)[objc_alloc(MEMORY[0x1E4F7A700]) initWithRequest:self];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __35__PIAutoLoopAutoCalculator_submit___block_invoke;
    v33[3] = &unk_1E5D81798;
    v34 = v15;
    v35 = v5;
    v17 = v15;
    [v16 submit:v33];

LABEL_10:
    goto LABEL_11;
  }
  id v12 = objc_alloc(MEMORY[0x1E4F7A660]);
  v13 = [v10 objectForKeyedSubscript:@"recipe"];
  v14 = (void *)[v12 initWithResult:v13];
  ((void (**)(void, void *))v5)[2](v5, v14);

LABEL_11:
}

void __35__PIAutoLoopAutoCalculator_submit___block_invoke(uint64_t a1, void *a2)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v14 = 0;
  v3 = [a2 result:&v14];
  id v4 = v14;
  if (v3)
  {
    v5 = [v3 properties];
    v6 = [v5 videoCorruptionInfo];
    int v7 = PFExists();

    if (v7)
    {
      uint64_t v8 = +[PIAutoLoopAutoCalculator pipelineFilterForCorruptedVideoMitigation];
      v15[0] = v8;
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
      [*(id *)(a1 + 32) setPipelineFilters:v9];
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __35__PIAutoLoopAutoCalculator_submit___block_invoke_3;
    v12[3] = &unk_1E5D81670;
    v10 = *(void **)(a1 + 32);
    id v13 = *(id *)(a1 + 40);
    [v10 submit:v12];
    v11 = v13;
  }
  else
  {
    v5 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to get video properties" object:0 underlyingError:v4];
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v5];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __35__PIAutoLoopAutoCalculator_submit___block_invoke_3(uint64_t a1, void *a2)
{
  id v9 = 0;
  v3 = [a2 result:&v9];
  id v4 = v9;
  id v5 = objc_alloc(MEMORY[0x1E4F7A660]);
  v6 = v5;
  if (v3)
  {
    int v7 = [v3 recipe];
    uint64_t v8 = (void *)[v6 initWithResult:v7];
  }
  else
  {
    uint64_t v8 = (void *)[v5 initWithError:v4];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

BOOL __35__PIAutoLoopAutoCalculator_submit___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 type] == 1;
}

- (PIAutoLoopAutoCalculator)initWithComposition:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PIAutoLoopAutoCalculator;
  result = [(NURenderRequest *)&v4 initWithComposition:a3];
  result->_flavor = 1;
  return result;
}

+ (id)pipelineFilterForCorruptedVideoMitigation
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F7A618]) initWithBlock:&__block_literal_global_6063];
  return v2;
}

id __69__PIAutoLoopAutoCalculator_pipelineFilterForCorruptedVideoMitigation__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6 = a2;
  int v7 = [v6 getTagWithPath:@"/pre-SemanticStyle" error:a5];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = [v7 input];
    v10 = [v6 cacheNode:v9 type:@"Video" settings:MEMORY[0x1E4F1CC08] error:a5];

    if (v10)
    {
      [v8 setInput:v10];
      id v11 = v8;
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

@end