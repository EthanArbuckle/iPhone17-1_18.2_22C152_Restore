@interface NUTagColorSampler
- (NSString)tag;
- (NUTagColorSampler)initWithComposition:(id)a3 tag:(id)a4;
- (NUTagColorSampler)initWithComposition:(id)a3 tag:(id)a4 responseQueue:(id)a5;
- (id)_pipelineFilters;
@end

@implementation NUTagColorSampler

- (void).cxx_destruct
{
}

- (NSString)tag
{
  return self->_tag;
}

- (id)_pipelineFilters
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = +[NURenderPipelineFilter stopAtTagFilter:self->_tag];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (NUTagColorSampler)initWithComposition:(id)a3 tag:(id)a4 responseQueue:(id)a5
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = (NSString *)a4;
  id v10 = a5;
  if (!v8)
  {
    v15 = NUAssertLogger_12242();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "composition != nil");
      *(_DWORD *)buf = 138543362;
      v65 = v16;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v18 = NUAssertLogger_12242();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v37 = (void *)MEMORY[0x1E4F29060];
        id v38 = v36;
        v39 = [v37 callStackSymbols];
        v40 = [v39 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v65 = v36;
        __int16 v66 = 2114;
        v67 = v40;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v65 = v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUTagColorSampler initWithComposition:tag:responseQueue:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Sampler/NUTagColorSampler.m", 23, @"Invalid parameter not satisfying: %s", v41, v42, v43, v44, (uint64_t)"composition != nil");
  }
  if (!v9)
  {
    v22 = NUAssertLogger_12242();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "tag != nil");
      *(_DWORD *)buf = 138543362;
      v65 = v23;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v25 = NUAssertLogger_12242();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (v24)
    {
      if (v26)
      {
        v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v46 = (void *)MEMORY[0x1E4F29060];
        id v47 = v45;
        v48 = [v46 callStackSymbols];
        v49 = [v48 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v65 = v45;
        __int16 v66 = 2114;
        v67 = v49;
        _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v65 = v28;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUTagColorSampler initWithComposition:tag:responseQueue:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Sampler/NUTagColorSampler.m", 24, @"Invalid parameter not satisfying: %s", v50, v51, v52, v53, (uint64_t)"tag != nil");
  }
  v11 = v10;
  if (!v10)
  {
    v29 = NUAssertLogger_12242();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "responseQueue != nil");
      *(_DWORD *)buf = 138543362;
      v65 = v30;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v32 = NUAssertLogger_12242();
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (v31)
    {
      if (v33)
      {
        v54 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v55 = (void *)MEMORY[0x1E4F29060];
        id v56 = v54;
        v57 = [v55 callStackSymbols];
        v58 = [v57 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v65 = v54;
        __int16 v66 = 2114;
        v67 = v58;
        _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v33)
    {
      v34 = [MEMORY[0x1E4F29060] callStackSymbols];
      v35 = [v34 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v65 = v35;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUTagColorSampler initWithComposition:tag:responseQueue:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Sampler/NUTagColorSampler.m", 25, @"Invalid parameter not satisfying: %s", v59, v60, v61, v62, (uint64_t)"responseQueue != nil");
  }
  v63.receiver = self;
  v63.super_class = (Class)NUTagColorSampler;
  v12 = [(NUColorSampler *)&v63 initWithComposition:v8 responseQueue:v10];
  tag = v12->_tag;
  v12->_tag = v9;

  return v12;
}

- (NUTagColorSampler)initWithComposition:(id)a3 tag:(id)a4
{
  return [(NUTagColorSampler *)self initWithComposition:a3 tag:a4 responseQueue:MEMORY[0x1E4F14428]];
}

@end