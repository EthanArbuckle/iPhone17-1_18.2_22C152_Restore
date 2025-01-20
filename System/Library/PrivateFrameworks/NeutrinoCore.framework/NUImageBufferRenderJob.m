@interface NUImageBufferRenderJob
- (id)imageAccumulationNodeWithImageSize:(id)a3 tileSize:(id)a4 borderSize:(id)a5 format:(id)a6 colorSpace:(id)a7;
- (id)renderBufferOfSize:(id)a3 format:(id)a4;
- (id)result;
@end

@implementation NUImageBufferRenderJob

- (id)result
{
  v3 = objc_alloc_init(_NUImageBufferRenderResult);
  v4 = [(NUImageRenderJob *)self renderedRegion];
  [(_NUImageRenderResult *)v3 setRegion:v4];

  v5 = [(NUImageRenderJob *)self renderBuffer];
  [(_NUImageBufferRenderResult *)v3 setBuffer:v5];

  v6 = [(NURenderJob *)self outputGeometry];
  [(_NUImageRenderResult *)v3 setGeometry:v6];

  return v3;
}

- (id)renderBufferOfSize:(id)a3 format:(id)a4
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = [(NUImageRenderJob *)self storagePool];
  uint64_t v9 = objc_msgSend(v8, "newStorageWithSize:format:", var0, var1, v7);
  if (!v9)
  {
    v13 = NUAssertLogger_10780();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = [NSString stringWithFormat:@"No storage allocated"];
      *(_DWORD *)v29 = 138543362;
      *(void *)&v29[4] = v14;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v29, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v16 = NUAssertLogger_10780();
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
        *(_DWORD *)v29 = 138543618;
        *(void *)&v29[4] = v20;
        __int16 v30 = 2114;
        v31 = v24;
        _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v29, 0x16u);
      }
    }
    else if (v17)
    {
      v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)v29 = 138543362;
      *(void *)&v29[4] = v19;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v29, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUImageBufferRenderJob renderBufferOfSize:format:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageRenderJob.m", 490, @"No storage allocated", v25, v26, v27, v28, *(uint64_t *)v29);
  }
  v10 = (void *)v9;
  v11 = [[NUStorageImageBuffer alloc] initWithStorage:v9 fromPool:v8];

  return v11;
}

- (id)imageAccumulationNodeWithImageSize:(id)a3 tileSize:(id)a4 borderSize:(id)a5 format:(id)a6 colorSpace:(id)a7
{
  return 0;
}

@end