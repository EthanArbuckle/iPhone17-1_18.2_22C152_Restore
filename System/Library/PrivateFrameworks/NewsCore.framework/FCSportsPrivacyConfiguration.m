@interface FCSportsPrivacyConfiguration
- (BOOL)isHeadlineExposureTrackingDisabled;
- (FCSportsPrivacyConfiguration)init;
- (FCSportsPrivacyConfiguration)initWithConfigDictionary:(id)a3;
- (double)headlineExposureNoiseRate;
- (double)syncEventSamplingRate;
@end

@implementation FCSportsPrivacyConfiguration

- (FCSportsPrivacyConfiguration)initWithConfigDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCSportsPrivacyConfiguration;
  v5 = [(FCSportsPrivacyConfiguration *)&v11 init];
  if (v5)
  {
    v5->_isHeadlineExposureTrackingDisabled = +[FCFeatureEnablementChecker enabledForCurrentLevel:FCAppConfigurationIntegerValue(v4, @"disableHeadlineExposureTrackingEnabledLevel", 0)];
    v6 = FCAppConfigurationNumberValue(v4, @"syncEventSamplingRate", &unk_1EF8D9A28);
    [v6 floatValue];
    v5->_syncEventSamplingRate = v7;

    v8 = FCAppConfigurationNumberValue(v4, @"headlineExposureNoiseRate", &unk_1EF8D9A38);
    [v8 floatValue];
    v5->_headlineExposureNoiseRate = v9;
  }
  return v5;
}

- (double)headlineExposureNoiseRate
{
  return self->_headlineExposureNoiseRate;
}

- (FCSportsPrivacyConfiguration)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCSportsPrivacyConfiguration init]";
    __int16 v9 = 2080;
    v10 = "FCSportsPrivacyConfiguration.m";
    __int16 v11 = 1024;
    int v12 = 17;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCSportsPrivacyConfiguration init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (BOOL)isHeadlineExposureTrackingDisabled
{
  return self->_isHeadlineExposureTrackingDisabled;
}

- (double)syncEventSamplingRate
{
  return self->_syncEventSamplingRate;
}

@end