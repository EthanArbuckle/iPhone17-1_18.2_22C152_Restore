@interface NUDevice_iOS
- (NUDevice_iOS)initWithName:(id)a3;
- (id)_newMetalRendererWithOptions:(id)a3;
- (id)_newRendererWithCIContextOptions:(id)a3 error:(id *)a4;
- (id)debugDescription;
- (int64_t)_preferredSampleMode;
- (unint64_t)family;
@end

@implementation NUDevice_iOS

- (void).cxx_destruct
{
}

- (id)_newMetalRendererWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [NUMetalRenderer alloc];
  v6 = [(NUDevice *)self metalDevice];
  v7 = [(NUMetalRenderer *)v5 initWithMetalDevice:v6 options:v4];

  return v7;
}

- (id)_newRendererWithCIContextOptions:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![(NUDevice *)self shouldRenderUsingMetal])
  {
    v8 = NUAssertLogger_11009();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = [NSString stringWithFormat:@"Software renderer is unsupported"];
      *(_DWORD *)v24 = 138543362;
      *(void *)&v24[4] = v9;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v24, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v11 = NUAssertLogger_11009();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v16 = (void *)MEMORY[0x1E4F29060];
        id v17 = v15;
        v18 = [v16 callStackSymbols];
        v19 = [v18 componentsJoinedByString:@"\n"];
        *(_DWORD *)v24 = 138543618;
        *(void *)&v24[4] = v15;
        __int16 v25 = 2114;
        v26 = v19;
        _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v24, 0x16u);
      }
    }
    else if (v12)
    {
      v13 = [MEMORY[0x1E4F29060] callStackSymbols];
      v14 = [v13 componentsJoinedByString:@"\n"];
      *(_DWORD *)v24 = 138543362;
      *(void *)&v24[4] = v14;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v24, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUDevice_iOS _newRendererWithCIContextOptions:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Runtime/NUDevice_iOS.m", 101, @"Software renderer is unsupported", v20, v21, v22, v23, *(uint64_t *)v24);
  }
  id v6 = [(NUDevice_iOS *)self _newMetalRendererWithOptions:v5];

  return v6;
}

- (int64_t)_preferredSampleMode
{
  if ([(NUDevice_iOS *)self family] - 2 >= 7) {
    return 2;
  }
  else {
    return 3;
  }
}

- (unint64_t)family
{
  v2 = [(NUDevice *)self metalDevice];
  if ([v2 supportsFamily:1008])
  {
    unint64_t v3 = 8;
  }
  else if ([v2 supportsFamily:1007])
  {
    unint64_t v3 = 7;
  }
  else if ([v2 supportsFamily:1006])
  {
    unint64_t v3 = 6;
  }
  else if ([v2 supportsFamily:1005])
  {
    unint64_t v3 = 5;
  }
  else if ([v2 supportsFamily:1004])
  {
    unint64_t v3 = 4;
  }
  else if ([v2 supportsFamily:1003])
  {
    unint64_t v3 = 3;
  }
  else if ([v2 supportsFamily:1002])
  {
    unint64_t v3 = 2;
  }
  else
  {
    unint64_t v3 = [v2 supportsFamily:1001];
  }

  return v3;
}

- (id)debugDescription
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(NUDevice *)self name];
  id v6 = [(NUDevice *)self model];
  v7 = [(NUDevice *)self metalDevice];
  v8 = [v3 stringWithFormat:@"<%@:%p name:%@ model:%@ metal: %@>", v4, self, v5, v6, v7];

  return v8;
}

- (NUDevice_iOS)initWithName:(id)a3
{
  id v4 = a3;
  id v5 = MTLCreateSystemDefaultDevice();
  if (!v5)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_11027);
    }
    id v6 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1A9892000, v6, OS_LOG_TYPE_FAULT, "Failed to obtain default Metal device", buf, 2u);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)NUDevice_iOS;
  v7 = [(NUDevice *)&v9 initWithName:v4 model:@"Apple" metalDevice:v5];

  return v7;
}

@end