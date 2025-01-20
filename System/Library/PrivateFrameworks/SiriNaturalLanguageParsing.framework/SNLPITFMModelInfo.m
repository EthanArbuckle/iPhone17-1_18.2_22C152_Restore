@interface SNLPITFMModelInfo
+ (id)stringForModelType:(unint64_t)a3;
- (NSString)errorDomain;
- (NSString)loggingComponentString;
- (SNLPITFMModelInfo)initWithType:(unint64_t)a3 loggingComponent:(int)a4 errorDomain:(id)a5;
- (int)loggingComponent;
- (unint64_t)type;
@end

@implementation SNLPITFMModelInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingComponentString, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
}

- (NSString)loggingComponentString
{
  return self->_loggingComponentString;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (int)loggingComponent
{
  return self->_loggingComponent;
}

- (unint64_t)type
{
  return self->_type;
}

- (SNLPITFMModelInfo)initWithType:(unint64_t)a3 loggingComponent:(int)a4 errorDomain:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SNLPITFMModelInfo;
  v10 = [(SNLPITFMModelInfo *)&v19 init];
  v11 = v10;
  if (v10)
  {
    v10->_uint64_t loggingComponent = a4;
    v10->_type = a3;
    objc_storeStrong((id *)&v10->_errorDomain, a5);
    v12 = NSString;
    uint64_t loggingComponent = v11->_loggingComponent;
    if (loggingComponent >= 8)
    {
      v15 = SNLPOSLoggerForCategory(4);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v21 = "<UNDEFINED_COMPONENT>";
        __int16 v22 = 2048;
        uint64_t v23 = loggingComponent;
        _os_log_impl(&dword_1C8DA9000, v15, OS_LOG_TYPE_ERROR, "[%s] The component %zu is invalid", buf, 0x16u);
      }

      v14 = "<UNDEFINED_COMPONENT>";
    }
    else
    {
      v14 = off_1E65808C8[loggingComponent];
    }
    uint64_t v16 = [v12 stringWithUTF8String:v14];
    loggingComponentString = v11->_loggingComponentString;
    v11->_loggingComponentString = (NSString *)v16;
  }
  return v11;
}

+ (id)stringForModelType:(unint64_t)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return off_1E6580830[a3];
  }
}

@end