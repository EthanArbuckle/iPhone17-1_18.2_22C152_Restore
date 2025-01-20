@interface SMLocalSessionState
+ (BOOL)convertSMDeviceConfigurationLPMToBool:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int64_t)convertBoolToSMDeviceConfigurationLowPowerModeWarningState:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)separatedLPMConnectivityWarningState;
- (BOOL)unsupportedDeviceSeparationState;
- (BOOL)userDisabledConnectivity;
- (SMLocalSessionState)init;
- (SMLocalSessionState)initWithCoder:(id)a3;
- (SMLocalSessionState)initWithUnsupportedDeviceSeparationState:(BOOL)a3 userDisabledConnectivity:(BOOL)a4 separatedLPMConnectivityWarningState:(BOOL)a5;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setSeparatedLPMConnectivityWarningState:(BOOL)a3;
- (void)setUnsupportedDeviceSeparationState:(BOOL)a3;
- (void)setUserDisabledConnectivity:(BOOL)a3;
@end

@implementation SMLocalSessionState

- (SMLocalSessionState)init
{
  return [(SMLocalSessionState *)self initWithUnsupportedDeviceSeparationState:0 userDisabledConnectivity:0 separatedLPMConnectivityWarningState:0];
}

- (SMLocalSessionState)initWithUnsupportedDeviceSeparationState:(BOOL)a3 userDisabledConnectivity:(BOOL)a4 separatedLPMConnectivityWarningState:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)SMLocalSessionState;
  result = [(SMLocalSessionState *)&v9 init];
  if (result)
  {
    result->_unsupportedDeviceSeparationState = a3;
    result->_userDisabledConnectivity = a4;
    result->_separatedLPMConnectivityWarningState = a5;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  if ([(SMLocalSessionState *)self unsupportedDeviceSeparationState]) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  if ([(SMLocalSessionState *)self userDisabledConnectivity]) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  if ([(SMLocalSessionState *)self separatedLPMConnectivityWarningState]) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  return (id)[v3 stringWithFormat:@"{UnsupportDeviceSeparationState: %@},{UserDisabledConnectivity: %@},{SeparatedLPMConnectivityWarningState: %@}", v4, v5, v6];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMLocalSessionState)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"__kSMLocalSessionStateUnsupportedDeviceSeparationStateKey"];
  uint64_t v6 = [v4 decodeBoolForKey:@"__kSMLocalSessionStateUserDisabledConnectivityKey"];
  uint64_t v7 = [v4 decodeBoolForKey:@"__kSMLocalSessionStateSeparatedLPMConnectivityWarningStateKey"];

  return [(SMLocalSessionState *)self initWithUnsupportedDeviceSeparationState:v5 userDisabledConnectivity:v6 separatedLPMConnectivityWarningState:v7];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[SMLocalSessionState unsupportedDeviceSeparationState](self, "unsupportedDeviceSeparationState"), @"__kSMLocalSessionStateUnsupportedDeviceSeparationStateKey");
  objc_msgSend(v4, "encodeBool:forKey:", -[SMLocalSessionState userDisabledConnectivity](self, "userDisabledConnectivity"), @"__kSMLocalSessionStateUserDisabledConnectivityKey");
  objc_msgSend(v4, "encodeBool:forKey:", -[SMLocalSessionState separatedLPMConnectivityWarningState](self, "separatedLPMConnectivityWarningState"), @"__kSMLocalSessionStateSeparatedLPMConnectivityWarningStateKey");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SMLocalSessionState *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      BOOL v6 = [(SMLocalSessionState *)self unsupportedDeviceSeparationState];
      int v7 = v6 ^ [(SMLocalSessionState *)v5 unsupportedDeviceSeparationState];
      BOOL v8 = [(SMLocalSessionState *)self userDisabledConnectivity];
      int v9 = v7 | v8 ^ [(SMLocalSessionState *)v5 userDisabledConnectivity];
      BOOL v10 = [(SMLocalSessionState *)self separatedLPMConnectivityWarningState];
      LOBYTE(v8) = [(SMLocalSessionState *)v5 separatedLPMConnectivityWarningState];

      char v11 = (v9 | v10 ^ v8) ^ 1;
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

+ (BOOL)convertSMDeviceConfigurationLPMToBool:(int64_t)a3
{
  return a3 == 2;
}

+ (int64_t)convertBoolToSMDeviceConfigurationLowPowerModeWarningState:(BOOL)a3
{
  if (a3) {
    return 2;
  }
  else {
    return 1;
  }
}

- (BOOL)unsupportedDeviceSeparationState
{
  return self->_unsupportedDeviceSeparationState;
}

- (void)setUnsupportedDeviceSeparationState:(BOOL)a3
{
  self->_unsupportedDeviceSeparationState = a3;
}

- (BOOL)userDisabledConnectivity
{
  return self->_userDisabledConnectivity;
}

- (void)setUserDisabledConnectivity:(BOOL)a3
{
  self->_userDisabledConnectivity = a3;
}

- (BOOL)separatedLPMConnectivityWarningState
{
  return self->_separatedLPMConnectivityWarningState;
}

- (void)setSeparatedLPMConnectivityWarningState:(BOOL)a3
{
  self->_separatedLPMConnectivityWarningState = a3;
}

@end