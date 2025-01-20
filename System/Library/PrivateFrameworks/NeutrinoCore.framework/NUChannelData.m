@interface NUChannelData
+ (id)composition:(id)a3;
+ (id)number:(double)a3;
- (NUChannelData)init;
- (NUChannelData)initWithFormat:(id)a3;
- (NUChannelFormat)format;
- (id)debugDescription;
- (id)description;
- (int64_t)type;
@end

@implementation NUChannelData

- (void).cxx_destruct
{
}

- (NUChannelFormat)format
{
  return self->_format;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(NUChannelData *)self format];
  v6 = [v3 stringWithFormat:@"<%@:%p format:%@>", v4, self, v5];

  return v6;
}

- (id)description
{
  v2 = NSString;
  v3 = [(NUChannelData *)self format];
  uint64_t v4 = [v2 stringWithFormat:@"data=%@", v3];

  return v4;
}

- (int64_t)type
{
  v2 = [(NUChannelData *)self format];
  int64_t v3 = [v2 channelType];

  return v3;
}

- (NUChannelData)initWithFormat:(id)a3
{
  uint64_t v4 = (NUChannelFormat *)a3;
  v8.receiver = self;
  v8.super_class = (Class)NUChannelData;
  v5 = [(NUChannelData *)&v8 init];
  format = v5->_format;
  v5->_format = v4;

  return v5;
}

- (NUChannelData)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_3784);
  }
  int64_t v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = NSString;
    v5 = v3;
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    objc_super v8 = NSStringFromSelector(a2);
    v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
    *(_DWORD *)buf = 138543362;
    v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

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
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUChannelData init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUChannel.m", 532, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

+ (id)number:(double)a3
{
  uint64_t v4 = [NUNumberSetting alloc];
  v5 = [NSNumber numberWithDouble:a3];
  v6 = [NSNumber numberWithDouble:a3];
  v7 = [(NUNumberSetting *)v4 initWithMinimum:v5 maximum:v6 attributes:MEMORY[0x1E4F1CC08]];

  objc_super v8 = [NSNumber numberWithDouble:a3];
  v9 = +[NUChannelControlData controlDataWithSetting:v7 value:v8];

  return v9;
}

+ (id)composition:(id)a3
{
  return +[NUChannelControlData controlDataWithComposition:a3];
}

@end