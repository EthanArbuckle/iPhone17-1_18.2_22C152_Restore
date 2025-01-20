@interface SPAccessoryDiscoveryPairingStatusRequest
+ (BOOL)supportsSecureCoding;
+ (id)checkSerialNumberWithIdentifier:(id)a3;
- (BOOL)checkSerialNumber;
- (BOOL)verifyFMNID;
- (BOOL)verifyWithServer;
- (BOOL)wantsLostModeInfo;
- (NSUUID)identifier;
- (SPAccessoryDiscoveryPairingStatusRequest)initWithCoder:(id)a3;
- (SPAccessoryDiscoveryPairingStatusRequest)initWithIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCheckSerialNumber:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setVerifyFMNID:(BOOL)a3;
- (void)setVerifyWithServer:(BOOL)a3;
- (void)setWantsLostModeInfo:(BOOL)a3;
@end

@implementation SPAccessoryDiscoveryPairingStatusRequest

- (SPAccessoryDiscoveryPairingStatusRequest)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SPAccessoryDiscoveryPairingStatusRequest;
  v6 = [(SPAccessoryDiscoveryPairingStatusRequest *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    *(_DWORD *)&v7->_wantsLostModeInfo = 16843008;
  }

  return v7;
}

+ (id)checkSerialNumberWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [[SPAccessoryDiscoveryPairingStatusRequest alloc] initWithIdentifier:v3];

  [(SPAccessoryDiscoveryPairingStatusRequest *)v4 setWantsLostModeInfo:0];
  [(SPAccessoryDiscoveryPairingStatusRequest *)v4 setCheckSerialNumber:1];
  [(SPAccessoryDiscoveryPairingStatusRequest *)v4 setVerifyFMNID:0];
  [(SPAccessoryDiscoveryPairingStatusRequest *)v4 setVerifyWithServer:0];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SPAccessoryDiscoveryPairingStatusRequest alloc];
  id v5 = [(SPAccessoryDiscoveryPairingStatusRequest *)self identifier];
  v6 = [(SPAccessoryDiscoveryPairingStatusRequest *)v4 initWithIdentifier:v5];

  [(SPAccessoryDiscoveryPairingStatusRequest *)v6 setWantsLostModeInfo:[(SPAccessoryDiscoveryPairingStatusRequest *)self wantsLostModeInfo]];
  [(SPAccessoryDiscoveryPairingStatusRequest *)v6 setCheckSerialNumber:[(SPAccessoryDiscoveryPairingStatusRequest *)self checkSerialNumber]];
  [(SPAccessoryDiscoveryPairingStatusRequest *)v6 setVerifyFMNID:[(SPAccessoryDiscoveryPairingStatusRequest *)self verifyFMNID]];
  [(SPAccessoryDiscoveryPairingStatusRequest *)v6 setVerifyWithServer:[(SPAccessoryDiscoveryPairingStatusRequest *)self verifyWithServer]];
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeBool:self->_wantsLostModeInfo forKey:@"wantsLostModeInfo"];
  [v5 encodeBool:self->_checkSerialNumber forKey:@"checkSerialNumber"];
  [v5 encodeBool:self->_verifyFMNID forKey:@"verifyFMNID"];
  [v5 encodeBool:self->_verifyWithServer forKey:@"verifyWithServer"];
}

- (SPAccessoryDiscoveryPairingStatusRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  identifier = self->_identifier;
  self->_identifier = v5;

  self->_wantsLostModeInfo = [v4 decodeBoolForKey:@"wantsLostModeInfo"];
  self->_checkSerialNumber = [v4 decodeBoolForKey:@"checkSerialNumber"];
  self->_verifyFMNID = [v4 decodeBoolForKey:@"verifyFMNID"];
  char v7 = [v4 decodeBoolForKey:@"verifyWithServer"];

  self->_verifyWithServer = v7;
  return self;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)wantsLostModeInfo
{
  return self->_wantsLostModeInfo;
}

- (void)setWantsLostModeInfo:(BOOL)a3
{
  self->_wantsLostModeInfo = a3;
}

- (BOOL)checkSerialNumber
{
  return self->_checkSerialNumber;
}

- (void)setCheckSerialNumber:(BOOL)a3
{
  self->_checkSerialNumber = a3;
}

- (BOOL)verifyFMNID
{
  return self->_verifyFMNID;
}

- (void)setVerifyFMNID:(BOOL)a3
{
  self->_verifyFMNID = a3;
}

- (BOOL)verifyWithServer
{
  return self->_verifyWithServer;
}

- (void)setVerifyWithServer:(BOOL)a3
{
  self->_verifyWithServer = a3;
}

- (void).cxx_destruct
{
}

@end