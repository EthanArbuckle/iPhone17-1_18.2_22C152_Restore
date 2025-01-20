@interface NUChannelMetadataFormat
- (BOOL)isEqualToChannelFormat:(id)a3;
- (NUChannelMetadataFormat)init;
- (NUChannelMetadataFormat)initWithMetadataType:(int64_t)a3;
- (id)debugDescription;
- (id)description;
- (int64_t)channelType;
- (int64_t)metadataType;
- (unint64_t)hash;
@end

@implementation NUChannelMetadataFormat

- (int64_t)metadataType
{
  return self->_metadataType;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(NUChannelMetadataFormat *)self metadataType];
  v6 = @"???";
  if (v5 == 2) {
    v6 = @"video";
  }
  if (v5 == 1) {
    v6 = @"image";
  }
  return (id)[v3 stringWithFormat:@"<%@:%p type:%@>", v4, self, v6];
}

- (id)description
{
  v2 = NSString;
  int64_t v3 = [(NUChannelMetadataFormat *)self metadataType];
  uint64_t v4 = @"???";
  if (v3 == 2) {
    uint64_t v4 = @"video";
  }
  if (v3 == 1) {
    uint64_t v4 = @"image";
  }
  return (id)[v2 stringWithFormat:@"metadata:%@", v4];
}

- (BOOL)isEqualToChannelFormat:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NUChannelMetadataFormat;
  if ([(NUChannelFormat *)&v8 isEqualToChannelFormat:v4])
  {
    uint64_t v5 = [v4 metadataType];
    BOOL v6 = v5 == [(NUChannelMetadataFormat *)self metadataType];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)NUChannelMetadataFormat;
  return (0x7F34415F73 * self->_metadataType) ^ [(NUChannelFormat *)&v3 hash];
}

- (NUChannelMetadataFormat)initWithMetadataType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NUChannelMetadataFormat;
  result = [(NUChannelMetadataFormat *)&v5 init];
  result->_metadataType = a3;
  return result;
}

- (int64_t)channelType
{
  return 3;
}

- (NUChannelMetadataFormat)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_3784);
  }
  objc_super v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v4 = NSString;
    objc_super v5 = v3;
    BOOL v6 = (objc_class *)objc_opt_class();
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
  _NUAssertFailHandler((uint64_t)"-[NUChannelMetadataFormat init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUChannel.m", 488, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

@end