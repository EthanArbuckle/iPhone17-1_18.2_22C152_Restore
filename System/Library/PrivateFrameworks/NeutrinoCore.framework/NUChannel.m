@interface NUChannel
+ (NUChannel)primary;
+ (id)controlChannelWithSchema:(id)a3;
+ (id)disparity;
- (BOOL)isCompatibleWithChannel:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToChannel:(id)a3;
- (NSString)name;
- (NUChannel)init;
- (NUChannel)initWithName:(id)a3 format:(id)a4 index:(int64_t)a5;
- (NUChannelFormat)format;
- (id)debugDescription;
- (id)description;
- (id)subchannelAtIndex:(unint64_t)a3;
- (id)subchannelForKey:(id)a3;
- (int64_t)index;
- (int64_t)type;
- (unint64_t)hash;
@end

@implementation NUChannel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_format, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (int64_t)index
{
  return self->_index;
}

- (NUChannelFormat)format
{
  return self->_format;
}

- (NSString)name
{
  return self->_name;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(NUChannel *)self name];
  unint64_t v6 = [(NUChannel *)self type] - 1;
  if (v6 > 2) {
    v7 = @"???";
  }
  else {
    v7 = off_1E5D94288[v6];
  }
  v8 = [(NUChannel *)self format];
  v9 = [v8 debugDescription];
  v10 = [v3 stringWithFormat:@"<%@:%p id:%@ type:%@ format:%@ idx:%ld>", v4, self, v5, v7, v9, -[NUChannel index](self, "index")];

  return v10;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(NUChannel *)self name];
  v5 = [(NUChannel *)self format];
  unint64_t v6 = [v5 description];
  v7 = [v3 stringWithFormat:@"%@ (%@)", v4, v6];

  return v7;
}

- (BOOL)isCompatibleWithChannel:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(NUChannel *)self type];
  if (v5 == [v4 type])
  {
    unint64_t v6 = [(NUChannel *)self format];
    v7 = [v4 format];
    char v8 = [v6 isCompatibleWithChannelFormat:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)isEqualToChannel:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(NUChannel *)self type];
  if (v5 != [v4 type]) {
    goto LABEL_5;
  }
  int64_t v6 = [(NUChannel *)self index];
  if (v6 != [v4 index]) {
    goto LABEL_5;
  }
  v7 = [(NUChannel *)self name];
  char v8 = [v4 name];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    v10 = [(NUChannel *)self format];
    v11 = [v4 format];
    char v12 = [v10 isEqualToChannelFormat:v11];

    char v13 = v12 ^ 1;
  }
  else
  {
LABEL_5:
    char v13 = 0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(NUChannel *)self isEqualToChannel:v4];

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = 0xAA676A18E7 * [(NSString *)self->_name hash];
  return (0xA0538F1583 * [(NUChannelFormat *)self->_format hash]) ^ v3 ^ (0x641F3AC4E7 * self->_index);
}

- (id)subchannelAtIndex:(unint64_t)a3
{
  BOOL v5 = [(NUChannel *)self format];
  int64_t v6 = [v5 subchannelFormatAtIndex:a3];

  if (v6)
  {
    v7 = [NUChannel alloc];
    char v8 = [(NUChannel *)self name];
    int v9 = [(NUChannel *)v7 initWithName:v8 format:v6 index:a3];
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

- (id)subchannelForKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NUChannel *)self format];
  int64_t v6 = [v5 subchannelFormatForKey:v4];

  if (v6) {
    v7 = [[NUChannel alloc] initWithName:v4 format:v6 index:0];
  }
  else {
    v7 = 0;
  }

  return v7;
}

- (int64_t)type
{
  v2 = [(NUChannel *)self format];
  int64_t v3 = [v2 channelType];

  return v3;
}

- (NUChannel)initWithName:(id)a3 format:(id)a4 index:(int64_t)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  int v9 = (NUChannelFormat *)a4;
  if (!v8)
  {
    v16 = NUAssertLogger_3857();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "name != nil");
      *(_DWORD *)buf = 138543362;
      v50 = v17;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v19 = NUAssertLogger_3857();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v31 = (void *)MEMORY[0x1E4F29060];
        id v32 = v30;
        v33 = [v31 callStackSymbols];
        v34 = [v33 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v50 = v30;
        __int16 v51 = 2114;
        v52 = v34;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v50 = v22;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUChannel initWithName:format:index:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUChannel.m", 119, @"Invalid parameter not satisfying: %s", v35, v36, v37, v38, (uint64_t)"name != nil");
  }
  if (a5 < 0)
  {
    v23 = NUAssertLogger_3857();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "index >= 0");
      *(_DWORD *)buf = 138543362;
      v50 = v24;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v26 = NUAssertLogger_3857();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (v25)
    {
      if (v27)
      {
        v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v40 = (void *)MEMORY[0x1E4F29060];
        id v41 = v39;
        v42 = [v40 callStackSymbols];
        v43 = [v42 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v50 = v39;
        __int16 v51 = 2114;
        v52 = v43;
        _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v27)
    {
      v28 = [MEMORY[0x1E4F29060] callStackSymbols];
      v29 = [v28 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v50 = v29;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUChannel initWithName:format:index:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUChannel.m", 120, @"Invalid parameter not satisfying: %s", v44, v45, v46, v47, (uint64_t)"index >= 0");
  }
  v10 = v9;
  v48.receiver = self;
  v48.super_class = (Class)NUChannel;
  v11 = [(NUChannel *)&v48 init];
  uint64_t v12 = [v8 copy];
  name = v11->_name;
  v11->_name = (NSString *)v12;

  format = v11->_format;
  v11->_format = v10;

  v11->_index = a5;
  return v11;
}

- (NUChannel)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_3784);
  }
  int64_t v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v4 = NSString;
    BOOL v5 = v3;
    int64_t v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    id v8 = NSStringFromSelector(a2);
    int v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
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
    uint64_t v12 = (void *)MEMORY[0x1E4F29060];
    char v13 = v11;
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
  char v13 = v16;
  BOOL v20 = [v18 callStackSymbols];
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
  _NUAssertFailHandler((uint64_t)"-[NUChannel init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUChannel.m", 115, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

+ (id)controlChannelWithSchema:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    char v13 = NUAssertLogger_3857();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "schema != nil");
      *(_DWORD *)buf = 138543362;
      __int16 v30 = v14;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v16 = NUAssertLogger_3857();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        BOOL v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v21 = (void *)MEMORY[0x1E4F29060];
        id v22 = v20;
        uint64_t v23 = [v21 callStackSymbols];
        uint64_t v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        __int16 v30 = v20;
        __int16 v31 = 2114;
        uint64_t v32 = v24;
        _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v30 = v19;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUChannel controlChannelWithSchema:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUChannel.m", 109, @"Invalid parameter not satisfying: %s", v25, v26, v27, v28, (uint64_t)"schema != nil");
  }
  BOOL v5 = v4;
  int64_t v6 = +[NUChannelControlFormat controlFormatWithSchema:v4];
  id v7 = objc_alloc((Class)a1);
  id v8 = [v5 identifier];
  int v9 = [v8 name];
  uint64_t v10 = [v9 lowercaseString];
  v11 = (void *)[v7 initWithName:v10 format:v6 index:0];

  return v11;
}

+ (id)disparity
{
  v2 = [[NUChannelMediaFormat alloc] initWithMediaType:3];
  int64_t v3 = [[NUChannel alloc] initWithName:@"disparity" format:v2 index:0];

  return v3;
}

+ (NUChannel)primary
{
  v2 = [[NUChannelMediaFormat alloc] initWithMediaType:1];
  int64_t v3 = [[NUChannel alloc] initWithName:@"primary" format:v2 index:0];

  return v3;
}

@end