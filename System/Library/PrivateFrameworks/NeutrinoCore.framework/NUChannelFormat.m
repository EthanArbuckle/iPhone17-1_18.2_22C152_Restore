@interface NUChannelFormat
- (BOOL)isCompatibleWithChannelFormat:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToChannelFormat:(id)a3;
- (BOOL)validateChannelData:(id)a3 error:(id *)a4;
- (id)debugDescription;
- (id)description;
- (id)subchannelFormatAtIndex:(unint64_t)a3;
- (id)subchannelFormatForKey:(id)a3;
- (int64_t)channelType;
- (unint64_t)hash;
@end

@implementation NUChannelFormat

- (int64_t)channelType
{
  return self->_channelType;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(NUChannelFormat *)self channelType];
  if ((unint64_t)(v5 - 1) > 2) {
    v6 = @"???";
  }
  else {
    v6 = off_1E5D94288[v5 - 1];
  }
  return (id)[v3 stringWithFormat:@"<%@:%p type:%@>", v4, self, v6];
}

- (id)description
{
  v2 = NSString;
  int64_t v3 = [(NUChannelFormat *)self channelType];
  if ((unint64_t)(v3 - 1) > 2) {
    uint64_t v4 = @"???";
  }
  else {
    uint64_t v4 = off_1E5D94288[v3 - 1];
  }
  return (id)[v2 stringWithFormat:@"type:%@", v4];
}

- (BOOL)validateChannelData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 format];
  char v8 = [v7 isCompatibleWithChannelFormat:self];

  if ((v8 & 1) == 0)
  {
    v9 = [v6 format];
    *a4 = +[NUError notFoundError:@"Incompatible data format" object:v9];
  }
  return v8;
}

- (BOOL)isCompatibleWithChannelFormat:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_3784);
  }
  uint64_t v4 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    int64_t v5 = NSString;
    id v6 = v4;
    v7 = (objc_class *)objc_opt_class();
    char v8 = NSStringFromClass(v7);
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
  _NUAssertFailHandler((uint64_t)"-[NUChannelFormat isCompatibleWithChannelFormat:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUChannel.m", 233, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v24, v25, v26, v27, v23);
}

- (BOOL)isEqualToChannelFormat:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_3784);
  }
  uint64_t v4 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    int64_t v5 = NSString;
    id v6 = v4;
    v7 = (objc_class *)objc_opt_class();
    char v8 = NSStringFromClass(v7);
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
  _NUAssertFailHandler((uint64_t)"-[NUChannelFormat isEqualToChannelFormat:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUChannel.m", 229, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v24, v25, v26, v27, v23);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(NUChannelFormat *)self isEqualToChannelFormat:v4];

  return v5;
}

- (unint64_t)hash
{
  return 0x34786CC70FLL * self->_channelType;
}

- (id)subchannelFormatAtIndex:(unint64_t)a3
{
  return 0;
}

- (id)subchannelFormatForKey:(id)a3
{
  return 0;
}

@end