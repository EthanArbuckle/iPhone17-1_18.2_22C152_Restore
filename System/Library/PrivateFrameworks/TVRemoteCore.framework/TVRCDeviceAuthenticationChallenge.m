@interface TVRCDeviceAuthenticationChallenge
- (NSString)codeToEnterOnDevice;
- (NSString)deviceIdentifier;
- (id)_initWithDeviceIdentifier:(id)a3 challengeType:(int64_t)a4 codeToEnterOnDevice:(id)a5;
- (int64_t)challengeAttributes;
- (int64_t)challengeType;
- (int64_t)throttleSeconds;
- (void)cancel;
- (void)setChallengeAttributes:(int64_t)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setThrottleSeconds:(int64_t)a3;
- (void)userEnteredCodeLocally:(id)a3;
@end

@implementation TVRCDeviceAuthenticationChallenge

- (id)_initWithDeviceIdentifier:(id)a3 challengeType:(int64_t)a4 codeToEnterOnDevice:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)TVRCDeviceAuthenticationChallenge;
  v10 = [(TVRCDeviceAuthenticationChallenge *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    deviceIdentifier = v10->_deviceIdentifier;
    v10->_deviceIdentifier = (NSString *)v11;

    v10->_challengeType = a4;
    uint64_t v13 = [v9 copy];
    codeToEnterOnDevice = v10->_codeToEnterOnDevice;
    v10->_codeToEnterOnDevice = (NSString *)v13;
  }
  return v10;
}

- (void)userEnteredCodeLocally:(id)a3
{
  if (!self->_challengeType)
  {
    id v4 = a3;
    id v5 = +[TVRCXPCClient sharedInstance];
    [v5 fulfillAuthChallengeForDeviceWithIdentifier:self->_deviceIdentifier withLocallyEnteredCode:v4];
  }
}

- (void)cancel
{
  id v3 = +[TVRCXPCClient sharedInstance];
  [v3 cancelAuthChallengeForDeviceWithIdentifier:self->_deviceIdentifier];
}

- (int64_t)challengeType
{
  return self->_challengeType;
}

- (int64_t)challengeAttributes
{
  return self->_challengeAttributes;
}

- (void)setChallengeAttributes:(int64_t)a3
{
  self->_challengeAttributes = a3;
}

- (int64_t)throttleSeconds
{
  return self->_throttleSeconds;
}

- (void)setThrottleSeconds:(int64_t)a3
{
  self->_throttleSeconds = a3;
}

- (NSString)codeToEnterOnDevice
{
  return self->_codeToEnterOnDevice;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);

  objc_storeStrong((id *)&self->_codeToEnterOnDevice, 0);
}

@end