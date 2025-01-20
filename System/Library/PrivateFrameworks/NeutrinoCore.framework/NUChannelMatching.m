@interface NUChannelMatching
+ (NUChannelMatching)primary;
+ (id)channel:(id)a3;
+ (id)media:(int64_t)a3;
+ (id)name:(id)a3;
+ (id)type:(int64_t)a3;
- (BOOL)match:(id)a3;
@end

@implementation NUChannelMatching

- (BOOL)match:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_3784);
  }
  v4 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v5 = NSString;
    v6 = v4;
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    v9 = [v5 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v8];
    *(_DWORD *)buf = 138543362;
    v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_3784);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_3784);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v12 = (void *)MEMORY[0x1E4F29060];
    v13 = v11;
    v14 = [v12 callStackSymbols];
    v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  v13 = v16;
  v20 = [v18 callStackSymbols];
  v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v29 = specific;
  __int16 v30 = 2114;
  v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  _NUAssertFailHandler((uint64_t)"-[NUChannelMatching match:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUChannel.m", 717, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v24, v25, v26, v27, v23);
}

+ (NUChannelMatching)primary
{
  v20[3] = *MEMORY[0x1E4F143B8];
  v2 = [NUChannelNameMatching alloc];
  id v3 = +[NUChannel primary];
  v4 = [v3 name];
  v5 = [(NUChannelNameMatching *)v2 initWithName:v4];

  v6 = [[NUChannelNameMatching alloc] initWithName:@"inputImage"];
  v7 = [[NUChannelNameMatching alloc] initWithName:@"outputImage"];
  v8 = [NUChannelAnyMatching alloc];
  v20[0] = v5;
  v20[1] = v6;
  v20[2] = v7;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  uint64_t v10 = [(NUChannelAnyMatching *)v8 initWithPredicates:v9];

  v11 = [NUChannelFormatMatching alloc];
  v12 = +[NUChannel primary];
  v13 = [v12 format];
  v14 = [(NUChannelFormatMatching *)v11 initWithFormat:v13];

  v15 = [NUChannelAllMatching alloc];
  v19[0] = v10;
  v19[1] = v14;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  v17 = [(NUChannelAnyMatching *)v15 initWithPredicates:v16];

  return (NUChannelMatching *)v17;
}

+ (id)channel:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    v15 = NUAssertLogger_3857();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "channel != nil");
      *(_DWORD *)buf = 138543362;
      v33 = v16;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v18 = NUAssertLogger_3857();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v23 = (void *)MEMORY[0x1E4F29060];
        id v24 = v22;
        uint64_t v25 = [v23 callStackSymbols];
        uint64_t v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v33 = v22;
        __int16 v34 = 2114;
        v35 = v26;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v33 = v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUChannelMatching channel:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUChannel.m", 700, @"Invalid parameter not satisfying: %s", v27, v28, v29, v30, (uint64_t)"channel != nil");
  }
  v4 = v3;
  v5 = [NUChannelNameMatching alloc];
  v6 = [v4 name];
  v7 = [(NUChannelNameMatching *)v5 initWithName:v6];

  v8 = [NUChannelFormatMatching alloc];
  v9 = [v4 format];
  uint64_t v10 = [(NUChannelFormatMatching *)v8 initWithFormat:v9];

  v11 = [NUChannelAllMatching alloc];
  v31[0] = v7;
  v31[1] = v10;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  v13 = [(NUChannelAnyMatching *)v11 initWithPredicates:v12];

  return v13;
}

+ (id)media:(int64_t)a3
{
  id v3 = [[NUChannelMediaFormat alloc] initWithMediaType:a3];
  v4 = [[NUChannelFormatMatching alloc] initWithFormat:v3];

  return v4;
}

+ (id)type:(int64_t)a3
{
  id v3 = [[NUChannelTypeMatching alloc] initWithType:a3];

  return v3;
}

+ (id)name:(id)a3
{
  id v3 = a3;
  v4 = [[NUChannelNameMatching alloc] initWithName:v3];

  return v4;
}

@end