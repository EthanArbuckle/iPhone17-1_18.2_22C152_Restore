@interface NUSlowMotionUtilities
+ (id)slowMotionAudioMixFromAsset:(id)a3 rate:(float)a4 range:(id *)a5 error:(id *)a6;
+ (id)slowMotionVideoFromAsset:(id)a3 rate:(float)a4 range:(id *)a5 error:(id *)a6;
+ (id)timeMapperForAssetDuration:(double)a3 rate:(float)a4 range:(id *)a5 error:(id *)a6;
@end

@implementation NUSlowMotionUtilities

+ (id)timeMapperForAssetDuration:(double)a3 rate:(float)a4 range:(id *)a5 error:(id *)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!a6)
  {
    v12 = NUAssertLogger_3451();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v15 = NUAssertLogger_3451();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        v22 = [v20 callStackSymbols];
        v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v19;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v23;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSlowMotionUtilities timeMapperForAssetDuration:rate:range:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/SlowMotion/NUSlowMotionUtilities.m", 77, @"Invalid parameter not satisfying: %s", v24, v25, v26, v27, (uint64_t)"error != NULL");
  }
  long long v7 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)buf = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)&buf[16] = v7;
  long long v29 = *(_OWORD *)&a5->var1.var1;
  v8 = objc_msgSend(MEMORY[0x1E4F8CDA0], "timeRangeMapperForSourceDuration:slowMotionRate:slowMotionTimeRange:forExport:", buf, 1, a3);
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    *a6 = +[NUError unknownError:@"NUSlowMotionTimeRangeMapper is Nil. Insufficent in length / placement to allow for the desired slow down, the original asset is returned and timing stays the same" object:0];
  }

  return v9;
}

+ (id)slowMotionAudioMixFromAsset:(id)a3 rate:(float)a4 range:(id *)a5 error:(id *)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!a6)
  {
    v15 = NUAssertLogger_3451();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      BOOL v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v16;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v18 = NUAssertLogger_3451();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v23 = (void *)MEMORY[0x1E4F29060];
        id v24 = v22;
        uint64_t v25 = [v23 callStackSymbols];
        uint64_t v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v22;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v26;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSlowMotionUtilities slowMotionAudioMixFromAsset:rate:range:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/SlowMotion/NUSlowMotionUtilities.m", 51, @"Invalid parameter not satisfying: %s", v27, v28, v29, v30, (uint64_t)"error != NULL");
  }
  id v10 = v9;
  id v31 = 0;
  long long v11 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)buf = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)&buf[16] = v11;
  long long v33 = *(_OWORD *)&a5->var1.var1;
  v12 = objc_msgSend(MEMORY[0x1E4F8CDA0], "assetFromVideoAsset:slowMotionRate:slowMotionTimeRange:forExport:outAudioMix:outTimeRangeMapper:", v9, buf, 1, &v31, 0, COERCE_DOUBLE(__PAIR64__(DWORD1(v33), LODWORD(a4))));
  id v13 = v31;
  if (!v13)
  {
    if (v12 == v10)
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4F163E0]);
    }
    else
    {
      +[NUError unknownError:@"failed to process slow motion audio" object:v10];
      id v13 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v13;
}

+ (id)slowMotionVideoFromAsset:(id)a3 rate:(float)a4 range:(id *)a5 error:(id *)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!a6)
  {
    BOOL v16 = NUAssertLogger_3451();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v17;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v19 = NUAssertLogger_3451();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v24 = (void *)MEMORY[0x1E4F29060];
        id v25 = v23;
        uint64_t v26 = [v24 callStackSymbols];
        uint64_t v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v23;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v27;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      id v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v22;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSlowMotionUtilities slowMotionVideoFromAsset:rate:range:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/SlowMotion/NUSlowMotionUtilities.m", 26, @"Invalid parameter not satisfying: %s", v28, v29, v30, v31, (uint64_t)"error != NULL");
  }
  id v10 = v9;
  long long v11 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)buf = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)&buf[16] = v11;
  long long v33 = *(_OWORD *)&a5->var1.var1;
  v12 = objc_msgSend(MEMORY[0x1E4F8CDA0], "assetFromVideoAsset:slowMotionRate:slowMotionTimeRange:forExport:outAudioMix:outTimeRangeMapper:", v9, buf, 1, 0, 0, COERCE_DOUBLE(__PAIR64__(DWORD1(v33), LODWORD(a4))));
  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v12;
      goto LABEL_8;
    }
    v14 = @"slow motion asset is not an AVComposition";
  }
  else
  {
    v14 = @"failed to process slow motion video";
  }
  +[NUError unknownError:v14 object:v10];
  id v13 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v13;
}

@end