@interface _TIPreference
+ (id)preferenceWithKey:(id)a3 domain:(id)a4 defaultValue:(id)a5;
+ (id)preferenceWithKey:(id)a3 domain:(id)a4 defaultValue:(id)a5 fallbackKey:(id)a6;
+ (id)preferenceWithKey:(id)a3 domain:(id)a4 defaultValue:(id)a5 fallbackKey:(id)a6 isAnalyzed:(BOOL)a7;
- (BOOL)isAnalyzed;
- (BOOL)isCloudSetting;
- (BOOL)isWatchSync;
- (NSString)analyzedAtKey;
- (NSString)approxDateOfBuildInstallKey;
- (NSString)buildAtChangeKey;
- (NSString)buildAtLastAnalysisKey;
- (NSString)changedAtKey;
- (NSString)domain;
- (NSString)fallbackKey;
- (NSString)key;
- (NSString)previousValueKey;
- (id)approxDateOfBuildInstall;
- (id)buildAtLastAnalysis;
- (id)currentValue;
- (id)defaultValue;
- (void)setCurrentValue:(id)a3;
- (void)setDefaultValue:(id)a3;
- (void)setDomain:(id)a3;
- (void)setFallbackKey:(id)a3;
- (void)setIsAnalyzed:(BOOL)a3;
- (void)setIsCloudSetting:(BOOL)a3;
- (void)setIsWatchSync:(BOOL)a3;
- (void)setKey:(id)a3;
@end

@implementation _TIPreference

- (void)setIsWatchSync:(BOOL)a3
{
  self->_isWatchSync = a3;
}

- (void)setIsCloudSetting:(BOOL)a3
{
  self->_isCloudSetting = a3;
}

+ (id)preferenceWithKey:(id)a3 domain:(id)a4 defaultValue:(id)a5 fallbackKey:(id)a6 isAnalyzed:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = objc_alloc_init((Class)objc_opt_class());
  [v15 setKey:v14];

  [v15 setDomain:v13];
  [v15 setDefaultValue:v12];

  [v15 setFallbackKey:v11];
  [v15 setIsAnalyzed:v7];

  return v15;
}

- (void)setKey:(id)a3
{
}

- (void)setIsAnalyzed:(BOOL)a3
{
  self->_isAnalyzed = a3;
}

- (void)setFallbackKey:(id)a3
{
}

- (void)setDomain:(id)a3
{
}

- (void)setDefaultValue:(id)a3
{
}

- (id)defaultValue
{
  return self->_defaultValue;
}

- (NSString)previousValueKey
{
  v2 = NSString;
  v3 = [(_TIPreference *)self key];
  v4 = [v2 stringWithFormat:@"%@_previousValue", v3];

  return (NSString *)v4;
}

- (NSString)changedAtKey
{
  v2 = NSString;
  v3 = [(_TIPreference *)self key];
  v4 = [v2 stringWithFormat:@"%@_changedAt", v3];

  return (NSString *)v4;
}

- (id)buildAtLastAnalysis
{
  v2 = NSString;
  v3 = [(_TIPreference *)self key];
  v4 = [v2 stringWithFormat:@"%@_buildAtLastAnalysis", v3];

  return v4;
}

- (NSString)buildAtChangeKey
{
  v2 = NSString;
  v3 = [(_TIPreference *)self key];
  v4 = [v2 stringWithFormat:@"%@_buildAtChange", v3];

  return (NSString *)v4;
}

- (id)approxDateOfBuildInstall
{
  v2 = NSString;
  v3 = [(_TIPreference *)self key];
  v4 = [v2 stringWithFormat:@"%@_approxDateOfBuildInstall", v3];

  return v4;
}

- (NSString)analyzedAtKey
{
  v2 = NSString;
  v3 = [(_TIPreference *)self key];
  v4 = [v2 stringWithFormat:@"%@_analyzedAt", v3];

  return (NSString *)v4;
}

- (id)currentValue
{
  return self->_currentValue;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)key
{
  return self->_key;
}

- (void)setCurrentValue:(id)a3
{
}

- (NSString)fallbackKey
{
  return self->_fallbackKey;
}

+ (id)preferenceWithKey:(id)a3 domain:(id)a4 defaultValue:(id)a5 fallbackKey:(id)a6
{
  return (id)[a1 preferenceWithKey:a3 domain:a4 defaultValue:a5 fallbackKey:a6 isAnalyzed:0];
}

+ (id)preferenceWithKey:(id)a3 domain:(id)a4 defaultValue:(id)a5
{
  return (id)[a1 preferenceWithKey:a3 domain:a4 defaultValue:a5 fallbackKey:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buildAtLastAnalysisKey, 0);
  objc_storeStrong((id *)&self->_approxDateOfBuildInstallKey, 0);
  objc_storeStrong(&self->_currentValue, 0);
  objc_storeStrong(&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_fallbackKey, 0);
  objc_storeStrong((id *)&self->_domain, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

- (NSString)buildAtLastAnalysisKey
{
  return self->_buildAtLastAnalysisKey;
}

- (NSString)approxDateOfBuildInstallKey
{
  return self->_approxDateOfBuildInstallKey;
}

- (BOOL)isWatchSync
{
  return self->_isWatchSync;
}

- (BOOL)isCloudSetting
{
  return self->_isCloudSetting;
}

- (BOOL)isAnalyzed
{
  return self->_isAnalyzed;
}

@end