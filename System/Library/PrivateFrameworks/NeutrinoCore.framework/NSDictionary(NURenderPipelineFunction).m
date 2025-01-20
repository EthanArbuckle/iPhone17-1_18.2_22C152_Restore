@interface NSDictionary(NURenderPipelineFunction)
- (id)nu_evaluateWithPipelineState:()NURenderPipelineFunction error:;
@end

@implementation NSDictionary(NURenderPipelineFunction)

- (id)nu_evaluateWithPipelineState:()NURenderPipelineFunction error:
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4)
  {
    v13 = NUAssertLogger_1297();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v14;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v16 = NUAssertLogger_1297();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v21 = (void *)MEMORY[0x1E4F29060];
        id v22 = v20;
        v23 = [v21 callStackSymbols];
        v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v20;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v24;
        _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v19;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NSDictionary(NURenderPipelineFunction) nu_evaluateWithPipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineState.m", 529, @"Invalid parameter not satisfying: %s", v25, v26, v27, v28, (uint64_t)"error != NULL");
  }
  v7 = v6;
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a1, "count"));
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 1;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v39 = __Block_byref_object_copy__1485;
  v40 = __Block_byref_object_dispose__1486;
  id v41 = 0;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __77__NSDictionary_NURenderPipelineFunction__nu_evaluateWithPipelineState_error___block_invoke;
  v29[3] = &unk_1E5D93E20;
  id v9 = v7;
  id v30 = v9;
  v32 = buf;
  id v10 = v8;
  id v31 = v10;
  v33 = &v34;
  [a1 enumerateKeysAndObjectsUsingBlock:v29];
  if (*((unsigned char *)v35 + 24))
  {
    id v11 = v10;
  }
  else
  {
    id v11 = 0;
    *a4 = *(id *)(*(void *)&buf[8] + 40);
  }

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v34, 8);

  return v11;
}

@end