@interface NPKIDVRemoteDeviceCredentialPreflightStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)preflightSuccessful;
- (NPKIDVRemoteDeviceCredentialPreflightStatus)initWithCoder:(id)a3;
- (NPKIDVRemoteDeviceCredentialPreflightStatus)initWithCredentialType:(unint64_t)a3 provisionedPassesCount:(unint64_t)a4 preflightSuccessful:(BOOL)a5;
- (unint64_t)credentialType;
- (unint64_t)provisionedPassesCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NPKIDVRemoteDeviceCredentialPreflightStatus

- (NPKIDVRemoteDeviceCredentialPreflightStatus)initWithCredentialType:(unint64_t)a3 provisionedPassesCount:(unint64_t)a4 preflightSuccessful:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)NPKIDVRemoteDeviceCredentialPreflightStatus;
  result = [(NPKIDVRemoteDeviceCredentialPreflightStatus *)&v9 init];
  if (result)
  {
    result->_credentialType = a3;
    result->_provisionedPassesCount = a4;
    result->_preflightSuccessful = a5;
  }
  return result;
}

- (NPKIDVRemoteDeviceCredentialPreflightStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"credentialType"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"provisionedPassesCount"];
  uint64_t v7 = [v4 decodeBoolForKey:@"preflightSuccessful"];

  return [(NPKIDVRemoteDeviceCredentialPreflightStatus *)self initWithCredentialType:v5 provisionedPassesCount:v6 preflightSuccessful:v7];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t credentialType = self->_credentialType;
  id v5 = a3;
  [v5 encodeInteger:credentialType forKey:@"credentialType"];
  [v5 encodeInteger:self->_provisionedPassesCount forKey:@"provisionedPassesCount"];
  [v5 encodeBool:self->_preflightSuccessful forKey:@"preflightSuccessful"];
}

- (unint64_t)credentialType
{
  return self->_credentialType;
}

- (unint64_t)provisionedPassesCount
{
  return self->_provisionedPassesCount;
}

- (BOOL)preflightSuccessful
{
  return self->_preflightSuccessful;
}

@end