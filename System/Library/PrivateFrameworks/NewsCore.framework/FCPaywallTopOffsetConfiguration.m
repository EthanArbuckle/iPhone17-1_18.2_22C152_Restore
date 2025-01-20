@interface FCPaywallTopOffsetConfiguration
- (FCPaywallTopOffsetConfiguration)init;
- (FCPaywallTopOffsetConfiguration)initWithCompactPortraitTopOffsetRatio:(double)a3 compactLandscapeTopOffsetRatio:(double)a4 regularPortraitTopOffsetRatio:(double)a5 regularLandscapeTopOffsetRatio:(double)a6;
- (FCPaywallTopOffsetConfiguration)initWithConfigDictionary:(id)a3;
- (double)compactLandscapeTopOffsetRatio;
- (double)compactPortraitTopOffsetRatio;
- (double)regularLandscapeTopOffsetRatio;
- (double)regularPortraitTopOffsetRatio;
@end

@implementation FCPaywallTopOffsetConfiguration

- (FCPaywallTopOffsetConfiguration)initWithConfigDictionary:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FCPaywallTopOffsetConfiguration;
  v5 = [(FCPaywallTopOffsetConfiguration *)&v7 init];
  if (v5)
  {
    v5->_compactPortraitTopOffsetRatio = FCAppConfigurationDoubleValue(v4, @"compactPortraitTopOffsetRatio", 0.0);
    v5->_compactLandscapeTopOffsetRatio = FCAppConfigurationDoubleValue(v4, @"compactLandscapeTopOffsetRatio", 0.0);
    v5->_regularPortraitTopOffsetRatio = FCAppConfigurationDoubleValue(v4, @"regularPortraitTopOffsetRatio", 0.0);
    v5->_regularLandscapeTopOffsetRatio = FCAppConfigurationDoubleValue(v4, @"regularLandscapeTopOffsetRatio", 0.0);
  }

  return v5;
}

- (FCPaywallTopOffsetConfiguration)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPaywallTopOffsetConfiguration init]";
    __int16 v9 = 2080;
    v10 = "FCPaywallTopOffsetConfiguration.m";
    __int16 v11 = 1024;
    int v12 = 16;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCPaywallTopOffsetConfiguration init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCPaywallTopOffsetConfiguration)initWithCompactPortraitTopOffsetRatio:(double)a3 compactLandscapeTopOffsetRatio:(double)a4 regularPortraitTopOffsetRatio:(double)a5 regularLandscapeTopOffsetRatio:(double)a6
{
  v11.receiver = self;
  v11.super_class = (Class)FCPaywallTopOffsetConfiguration;
  result = [(FCPaywallTopOffsetConfiguration *)&v11 init];
  if (result)
  {
    result->_compactPortraitTopOffsetRatio = a3;
    result->_compactLandscapeTopOffsetRatio = a4;
    result->_regularPortraitTopOffsetRatio = a5;
    result->_regularLandscapeTopOffsetRatio = a6;
  }
  return result;
}

- (double)compactPortraitTopOffsetRatio
{
  return self->_compactPortraitTopOffsetRatio;
}

- (double)compactLandscapeTopOffsetRatio
{
  return self->_compactLandscapeTopOffsetRatio;
}

- (double)regularPortraitTopOffsetRatio
{
  return self->_regularPortraitTopOffsetRatio;
}

- (double)regularLandscapeTopOffsetRatio
{
  return self->_regularLandscapeTopOffsetRatio;
}

@end