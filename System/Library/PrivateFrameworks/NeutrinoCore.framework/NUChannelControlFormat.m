@interface NUChannelControlFormat
+ (id)controlFormatWithSchema:(id)a3;
+ (id)controlFormatWithSetting:(id)a3;
- (BOOL)isCompatibleWithChannelFormat:(id)a3;
- (BOOL)isEqualToChannelFormat:(id)a3;
- (BOOL)validateChannelData:(id)a3 error:(id *)a4;
- (NUChannelControlFormat)init;
- (NUChannelControlFormat)initWithControlType:(int64_t)a3 dataModel:(id)a4;
- (NUModel)dataModel;
- (id)debugDescription;
- (id)description;
- (id)subchannelFormatForKey:(id)a3;
- (int64_t)channelType;
- (int64_t)controlType;
- (unint64_t)hash;
@end

@implementation NUChannelControlFormat

- (void).cxx_destruct
{
}

- (NUModel)dataModel
{
  return self->_dataModel;
}

- (int64_t)controlType
{
  return self->_controlType;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(NUChannelControlFormat *)self controlType];
  v6 = @"???";
  if (v5 == 2) {
    v6 = @"schema";
  }
  if (v5 == 1) {
    v6 = @"setting";
  }
  v7 = v6;
  v8 = [(NUChannelControlFormat *)self dataModel];
  v9 = [v8 debugDescription];
  v10 = [v3 stringWithFormat:@"<%@:%p type:%@ model:%@>", v4, self, v7, v9];

  return v10;
}

- (id)description
{
  int64_t v3 = [(NUChannelControlFormat *)self controlType];
  if (v3 == 1)
  {
    v8 = NSString;
    uint64_t v9 = [(NUModel *)self->_dataModel type];
    if ((unint64_t)(v9 - 1) > 5) {
      v10 = @"???";
    }
    else {
      v10 = off_1E5D956E8[v9 - 1];
    }
    int64_t v5 = v10;
    v7 = [v8 stringWithFormat:@"setting:%@", v5];
  }
  else
  {
    if (v3 != 2)
    {
      v7 = @"???";
      goto LABEL_10;
    }
    uint64_t v4 = NSString;
    int64_t v5 = [(NUModel *)self->_dataModel identifier];
    v6 = [(__CFString *)v5 name];
    v7 = [v4 stringWithFormat:@"schema:%@", v6];
  }
LABEL_10:

  return v7;
}

- (BOOL)validateChannelData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NUChannelControlFormat;
  if ([(NUChannelFormat *)&v12 validateChannelData:v6 error:a4])
  {
    id v7 = v6;
    v8 = [(NUChannelControlFormat *)self dataModel];
    uint64_t v9 = [v7 data];

    char v10 = [v8 validate:v9 error:a4];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)isCompatibleWithChannelFormat:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_11;
  }
  uint64_t v5 = [v4 controlType];
  if (v5 != [(NUChannelControlFormat *)self controlType]) {
    goto LABEL_11;
  }
  int64_t v6 = [(NUChannelControlFormat *)self controlType];
  if (v6 != 1)
  {
    if (v6 == 2)
    {
      id v7 = [(NUChannelControlFormat *)self dataModel];
      v8 = [v4 dataModel];
      if (([v7 isEqual:v8] & 1) == 0)
      {
        uint64_t v9 = +[NUSourceSchema sharedSourceSchema];
        if ([v7 isEqual:v9])
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass) {
            goto LABEL_8;
          }
        }
        else
        {
        }
        BOOL v11 = 0;
        goto LABEL_15;
      }
LABEL_8:
      BOOL v11 = 1;
LABEL_15:

      goto LABEL_12;
    }
    goto LABEL_10;
  }
  objc_super v12 = [(NUChannelControlFormat *)self dataModel];
  uint64_t v13 = [v12 type];
  v14 = [v4 dataModel];
  uint64_t v15 = [v14 type];

  if (v13 != v15)
  {
LABEL_11:
    BOOL v11 = 0;
    goto LABEL_12;
  }
LABEL_10:
  BOOL v11 = 1;
LABEL_12:

  return v11;
}

- (BOOL)isEqualToChannelFormat:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (uint64_t v5 = [v4 controlType], v5 == -[NUChannelControlFormat controlType](self, "controlType")))
  {
    int64_t v6 = [v4 dataModel];
    id v7 = [(NUChannelControlFormat *)self dataModel];
    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)NUChannelControlFormat;
  unint64_t v3 = [(NUChannelFormat *)&v6 hash];
  uint64_t v4 = 0x98D1398391 * self->_controlType;
  return v4 ^ v3 ^ (0xD97BDCE34BLL * [(NUModel *)self->_dataModel hash]);
}

- (id)subchannelFormatForKey:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [(NUChannelControlFormat *)self controlType];
  if (v5 != 1)
  {
    if (v5 != 2)
    {
      char v10 = 0;
      goto LABEL_27;
    }
    objc_super v6 = [(NUChannelControlFormat *)self dataModel];
    switch([v6 type])
    {
      case 0:
      case 2:
        if (_NULogOnceToken != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_407);
        }
        uint64_t v9 = (void *)_NULogger;
        if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR)) {
          goto LABEL_15;
        }
        goto LABEL_30;
      case 1:
      case 3:
        id v7 = [v6 settings];
        goto LABEL_20;
      case 4:
        BOOL v11 = [v6 contents];
        objc_super v12 = [v11 objectForKeyedSubscript:v4];

        if (!v12) {
          goto LABEL_22;
        }
        uint64_t v13 = +[NUSchemaRegistry sharedRegistry];
        v14 = [v13 schemaWithIdentifier:v12];

        if (v14)
        {
          char v10 = +[NUChannelControlFormat controlFormatWithSchema:v14];
        }
        else
        {
          char v10 = 0;
        }

        break;
      default:
        goto LABEL_15;
    }
    goto LABEL_25;
  }
  objc_super v6 = [(NUChannelControlFormat *)self dataModel];
  unint64_t v8 = [v6 type];
  if (v8 <= 6)
  {
    if (v8 == 4)
    {
      id v7 = [v6 properties];
LABEL_20:
      uint64_t v15 = v7;
      objc_super v12 = [v7 objectForKeyedSubscript:v4];

      if (v12)
      {
        char v10 = +[NUChannelControlFormat controlFormatWithSetting:v12];
      }
      else
      {
LABEL_22:
        char v10 = 0;
      }
LABEL_25:

      goto LABEL_26;
    }
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_407);
    }
    uint64_t v9 = (void *)_NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
LABEL_30:
      v17 = v9;
      v18 = [(NUChannelControlFormat *)self description];
      int v19 = 138412546;
      v20 = v18;
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Unsupported subchannel format %@:%@", (uint8_t *)&v19, 0x16u);
    }
  }
LABEL_15:
  char v10 = 0;
LABEL_26:

LABEL_27:

  return v10;
}

- (NUChannelControlFormat)initWithControlType:(int64_t)a3 dataModel:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  objc_super v6 = (NUModel *)a4;
  if (!v6)
  {
    BOOL v11 = NUAssertLogger_3857();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_super v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dataModel != nil");
      *(_DWORD *)buf = 138543362;
      v29 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v14 = NUAssertLogger_3857();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        int v19 = (void *)MEMORY[0x1E4F29060];
        id v20 = v18;
        __int16 v21 = [v19 callStackSymbols];
        id v22 = [v21 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v29 = v18;
        __int16 v30 = 2114;
        v31 = v22;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v29 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUChannelControlFormat initWithControlType:dataModel:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUChannel.m", 319, @"Invalid parameter not satisfying: %s", v23, v24, v25, v26, (uint64_t)"dataModel != nil");
  }
  id v7 = v6;
  v27.receiver = self;
  v27.super_class = (Class)NUChannelControlFormat;
  unint64_t v8 = [(NUChannelControlFormat *)&v27 init];
  v8->_controlType = a3;
  dataModel = v8->_dataModel;
  v8->_dataModel = v7;

  return v8;
}

- (int64_t)channelType
{
  return 2;
}

- (NUChannelControlFormat)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_3784);
  }
  unint64_t v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v4 = NSString;
    int64_t v5 = v3;
    objc_super v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    unint64_t v8 = NSStringFromSelector(a2);
    uint64_t v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
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
    BOOL v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    objc_super v12 = (void *)MEMORY[0x1E4F29060];
    uint64_t v13 = v11;
    v14 = [v12 callStackSymbols];
    BOOL v15 = [v14 componentsJoinedByString:@"\n"];
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
  uint64_t v13 = v16;
  id v20 = [v18 callStackSymbols];
  __int16 v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v29 = specific;
  __int16 v30 = 2114;
  v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  id v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUChannelControlFormat init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUChannel.m", 311, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

+ (id)controlFormatWithSetting:(id)a3
{
  id v4 = a3;
  int64_t v5 = (void *)[objc_alloc((Class)a1) initWithControlType:1 dataModel:v4];

  return v5;
}

+ (id)controlFormatWithSchema:(id)a3
{
  id v4 = a3;
  int64_t v5 = (void *)[objc_alloc((Class)a1) initWithControlType:2 dataModel:v4];

  return v5;
}

@end