@interface TAAnalyticsManagerSettings
- (BOOL)enableSubmission;
- (TAAnalyticsManagerSettings)init;
- (TAAnalyticsManagerSettings)initWithEnableSubmissionOrDefault:(id)a3 andSettingsVersion:(unint64_t)a4;
- (unint64_t)settingsVersion;
- (void)setEnableSubmission:(BOOL)a3;
- (void)setSettingsVersion:(unint64_t)a3;
@end

@implementation TAAnalyticsManagerSettings

- (TAAnalyticsManagerSettings)init
{
  return [(TAAnalyticsManagerSettings *)self initWithEnableSubmissionOrDefault:0 andSettingsVersion:1];
}

- (TAAnalyticsManagerSettings)initWithEnableSubmissionOrDefault:(id)a3 andSettingsVersion:(unint64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TAAnalyticsManagerSettings;
  v7 = [(TAAnalyticsManagerSettings *)&v10 init];
  if (v7)
  {
    if (v6) {
      char v8 = [v6 BOOLValue];
    }
    else {
      char v8 = 1;
    }
    v7->_enableSubmission = v8;
    v7->_settingsVersion = a4;
  }

  return v7;
}

- (BOOL)enableSubmission
{
  return self->_enableSubmission;
}

- (void)setEnableSubmission:(BOOL)a3
{
  self->_enableSubmission = a3;
}

- (unint64_t)settingsVersion
{
  return self->_settingsVersion;
}

- (void)setSettingsVersion:(unint64_t)a3
{
  self->_settingsVersion = a3;
}

@end