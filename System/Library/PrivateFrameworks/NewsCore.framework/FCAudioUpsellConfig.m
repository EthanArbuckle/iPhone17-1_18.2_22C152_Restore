@interface FCAudioUpsellConfig
- (FCAudioUpsellConfig)init;
- (FCAudioUpsellConfig)initWithConfigDictionary:(id)a3;
- (NSString)identifier;
- (NSURL)URL;
- (double)duration;
- (unint64_t)playPosition;
@end

@implementation FCAudioUpsellConfig

- (FCAudioUpsellConfig)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCAudioUpsellConfig init]";
    __int16 v9 = 2080;
    v10 = "FCAudioUpsellConfig.m";
    __int16 v11 = 1024;
    int v12 = 17;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCAudioUpsellConfig init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCAudioUpsellConfig)initWithConfigDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FCAudioUpsellConfig;
  v5 = [(FCAudioUpsellConfig *)&v12 init];
  if (v5)
  {
    uint64_t v6 = FCAppConfigurationStringValue(v4, @"identifier", &stru_1EF8299B8);
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = FCAppConfigurationURLValue(v4, @"url");
    URL = v5->_URL;
    v5->_URL = (NSURL *)v8;

    v5->_duration = FCAppConfigurationDoubleValue(v4, @"duration", 0.0);
    v10 = FCAppConfigurationStringValue(v4, @"playPosition", 0);
    v5->_playPosition = FCAudioUpsellPlayPositionForValue(v10);
  }
  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSURL)URL
{
  return self->_URL;
}

- (double)duration
{
  return self->_duration;
}

- (unint64_t)playPosition
{
  return self->_playPosition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end