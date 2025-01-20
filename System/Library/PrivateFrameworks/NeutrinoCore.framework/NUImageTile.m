@interface NUImageTile
@end

@implementation NUImageTile

uint64_t __23___NUImageTile_isValid__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(v1 + 24)) {
    BOOL v2 = *(unsigned char *)(v1 + 32) == 0;
  }
  else {
    BOOL v2 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v2;
  return result;
}

void __36___NUImageTile_copyFromTile_region___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  BOOL v2 = *(void **)(a1 + 32);
  if (v2[3] != 1)
  {
    v5 = NUAssertLogger_28945();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"cannot access storage (write): accessCount != 1 (%ld)", *(void *)(*(void *)(a1 + 32) + 24));
      *(_DWORD *)buf = 138543362;
      v42 = v6;
      _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v8 = NUAssertLogger_28945();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v9)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        v22 = [v20 callStackSymbols];
        v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v42 = v19;
        __int16 v43 = 2114;
        v44 = v23;
        _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v9)
    {
      v10 = [MEMORY[0x1E4F29060] callStackSymbols];
      v11 = [v10 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v42 = v11;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUImageTile copyFromTile:region:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageTile.m", 257, @"cannot access storage (write): accessCount != 1 (%ld)", v24, v25, v26, v27, *(void *)(*(void *)(a1 + 32) + 24));
  }
  if ([v2 isShared])
  {
    v12 = NUAssertLogger_28945();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = [NSString stringWithFormat:@"cannot write to a shared storage"];
      *(_DWORD *)buf = 138543362;
      v42 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v15 = NUAssertLogger_28945();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (v14)
    {
      if (v16)
      {
        v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v29 = (void *)MEMORY[0x1E4F29060];
        id v30 = v28;
        v31 = [v29 callStackSymbols];
        v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v42 = v28;
        __int16 v43 = 2114;
        v44 = v32;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v42 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUImageTile copyFromTile:region:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageTile.m", 258, @"cannot write to a shared storage", v33, v34, v35, v36, v37);
  }
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __36___NUImageTile_copyFromTile_region___block_invoke_2;
  v39[3] = &unk_1E5D95EB8;
  v3 = *(void **)(a1 + 40);
  v39[4] = *(void *)(a1 + 32);
  long long v38 = *(_OWORD *)(a1 + 48);
  id v4 = (id)v38;
  long long v40 = v38;
  [v3 _visitRead:v39];
}

uint64_t __36___NUImageTile_copyFromTile_region___block_invoke_2(void *a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1[4] + 16) copyFromStorage:a2 region:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

uint64_t __43___NUImageTile_writeStorageInRegion_block___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) isShared];
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 3;
  }
  else
  {
    if (*(void *)(*(void *)(a1 + 32) + 24) != 1)
    {
      v3 = NUAssertLogger_28945();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        id v4 = objc_msgSend(NSString, "stringWithFormat:", @"cannot access storage (write): accessCount != 1 (%ld)", *(void *)(*(void *)(a1 + 32) + 24));
        *(_DWORD *)buf = 138543362;
        v20 = v4;
        _os_log_error_impl(&dword_1A9892000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v6 = NUAssertLogger_28945();
      BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v7)
        {
          v10 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v11 = (void *)MEMORY[0x1E4F29060];
          id v12 = v10;
          v13 = [v11 callStackSymbols];
          v14 = [v13 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          v20 = v10;
          __int16 v21 = 2114;
          v22 = v14;
          _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v7)
      {
        v8 = [MEMORY[0x1E4F29060] callStackSymbols];
        BOOL v9 = [v8 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v20 = v9;
        _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler((uint64_t)"-[_NUImageTile writeStorageInRegion:block:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageTile.m", 235, @"cannot access storage (write): accessCount != 1 (%ld)", v15, v16, v17, v18, *(void *)(*(void *)(a1 + 32) + 24));
    }
    uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == 1) {
      *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
    }
  }
  return result;
}

uint64_t __42___NUImageTile_readStorageInRegion_block___block_invoke(void *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1[4] + 24))
  {
    v3 = NUAssertLogger_28945();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = [NSString stringWithFormat:@"cannot access storage (read): accessCount == 0"];
      *(_DWORD *)v19 = 138543362;
      *(void *)&v19[4] = v4;
      _os_log_error_impl(&dword_1A9892000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v19, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v6 = NUAssertLogger_28945();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v7)
      {
        v10 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v11 = (void *)MEMORY[0x1E4F29060];
        id v12 = v10;
        v13 = [v11 callStackSymbols];
        v14 = [v13 componentsJoinedByString:@"\n"];
        *(_DWORD *)v19 = 138543618;
        *(void *)&v19[4] = v10;
        __int16 v20 = 2114;
        __int16 v21 = v14;
        _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v19, 0x16u);
      }
    }
    else if (v7)
    {
      v8 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v9 = [v8 componentsJoinedByString:@"\n"];
      *(_DWORD *)v19 = 138543362;
      *(void *)&v19[4] = v9;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v19, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUImageTile readStorageInRegion:block:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageTile.m", 212, @"cannot access storage (read): accessCount == 0", v15, v16, v17, v18, *(uint64_t *)v19);
  }
  uint64_t result = (*(uint64_t (**)(void))(a1[5] + 16))();
  *(void *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

uint64_t __27___NUImageTile__visitRead___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(a1 + 32) + 24))
  {
    v3 = NUAssertLogger_28945();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = [NSString stringWithFormat:@"cannot access storage (read): accessCount == 0"];
      *(_DWORD *)v19 = 138543362;
      *(void *)&v19[4] = v4;
      _os_log_error_impl(&dword_1A9892000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v19, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v6 = NUAssertLogger_28945();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v7)
      {
        v10 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v11 = (void *)MEMORY[0x1E4F29060];
        id v12 = v10;
        v13 = [v11 callStackSymbols];
        v14 = [v13 componentsJoinedByString:@"\n"];
        *(_DWORD *)v19 = 138543618;
        *(void *)&v19[4] = v10;
        __int16 v20 = 2114;
        __int16 v21 = v14;
        _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v19, 0x16u);
      }
    }
    else if (v7)
    {
      v8 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v9 = [v8 componentsJoinedByString:@"\n"];
      *(_DWORD *)v19 = 138543362;
      *(void *)&v19[4] = v9;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v19, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUImageTile _visitRead:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageTile.m", 194, @"cannot access storage (read): accessCount == 0", v15, v16, v17, v18, *(uint64_t *)v19);
  }
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v1();
}

uint64_t __61___NUImageTile_decrementAccessCountButLeaveAccessedIfLastUse__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) useCount];
  if (result != 1)
  {
    v3 = *(void **)(a1 + 32);
    return [v3 _decrementAccessCount];
  }
  return result;
}

uint64_t __36___NUImageTile_decrementAccessCount__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _decrementAccessCount];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __36___NUImageTile_incrementAccessCount__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _incrementAccessCount];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __27___NUImageTile_accessCount__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 24);
  return result;
}

uint64_t __39___NUImageTile_returnToStorageFactory___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) returnStorage:*(void *)(*(void *)(a1 + 40) + 16)];
}

@end