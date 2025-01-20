@interface SBUIRemoteAlertIdleTimerSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)disablesWarn;
- (BOOL)usesLockScreenRules;
- (SBUIRemoteAlertIdleTimerSettings)initWithCoder:(id)a3;
- (double)autoLockTimeout;
- (void)encodeWithCoder:(id)a3;
- (void)setAutoLockTimeout:(double)a3;
- (void)setDisablesWarn:(BOOL)a3;
- (void)setUsesLockScreenRules:(BOOL)a3;
@end

@implementation SBUIRemoteAlertIdleTimerSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SBUIRemoteAlertIdleTimerSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBUIRemoteAlertIdleTimerSettings;
  v5 = [(SBUIRemoteAlertIdleTimerSettings *)&v8 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"autoLockTimeout"];
    v5->_autoLockTimeout = v6;
    v5->_disablesWarn = [v4 decodeBoolForKey:@"disablesWarn"];
    v5->_usesLockScreenRules = [v4 decodeBoolForKey:@"usesLockScreenRules"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double autoLockTimeout = self->_autoLockTimeout;
  id v5 = a3;
  [v5 encodeDouble:@"autoLockTimeout" forKey:autoLockTimeout];
  [v5 encodeBool:self->_disablesWarn forKey:@"disablesWarn"];
  [v5 encodeBool:self->_usesLockScreenRules forKey:@"usesLockScreenRules"];
}

- (double)autoLockTimeout
{
  return self->_autoLockTimeout;
}

- (void)setAutoLockTimeout:(double)a3
{
  self->_double autoLockTimeout = a3;
}

- (BOOL)disablesWarn
{
  return self->_disablesWarn;
}

- (void)setDisablesWarn:(BOOL)a3
{
  self->_disablesWarn = a3;
}

- (BOOL)usesLockScreenRules
{
  return self->_usesLockScreenRules;
}

- (void)setUsesLockScreenRules:(BOOL)a3
{
  self->_usesLockScreenRules = a3;
}

@end