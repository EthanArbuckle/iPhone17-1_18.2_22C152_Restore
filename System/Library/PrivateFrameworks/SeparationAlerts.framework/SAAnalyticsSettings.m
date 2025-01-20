@interface SAAnalyticsSettings
- (BOOL)enableSubmission;
- (SAAnalyticsSettings)init;
- (SAAnalyticsSettings)initWithEnableSubmission:(BOOL)a3;
- (void)setEnableSubmission:(BOOL)a3;
@end

@implementation SAAnalyticsSettings

- (SAAnalyticsSettings)init
{
  return [(SAAnalyticsSettings *)self initWithEnableSubmission:1];
}

- (SAAnalyticsSettings)initWithEnableSubmission:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SAAnalyticsSettings;
  result = [(SAAnalyticsSettings *)&v5 init];
  if (result) {
    result->_enableSubmission = a3;
  }
  return result;
}

- (BOOL)enableSubmission
{
  return self->_enableSubmission;
}

- (void)setEnableSubmission:(BOOL)a3
{
  self->_enableSubmission = a3;
}

@end