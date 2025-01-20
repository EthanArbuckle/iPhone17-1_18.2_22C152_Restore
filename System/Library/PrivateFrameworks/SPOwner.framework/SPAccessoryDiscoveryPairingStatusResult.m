@interface SPAccessoryDiscoveryPairingStatusResult
+ (BOOL)supportsSecureCoding;
- (SPAccessoryDiscoveryPairingStatusResult)initWithCoder:(id)a3;
- (SPAccessoryDiscoveryPairingStatusResult)initWithPairingStatus:(int64_t)a3 lostModeInfo:(id)a4;
- (SPLostModeInfo)lostModeInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)pairingStatus;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SPAccessoryDiscoveryPairingStatusResult

- (SPAccessoryDiscoveryPairingStatusResult)initWithPairingStatus:(int64_t)a3 lostModeInfo:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SPAccessoryDiscoveryPairingStatusResult;
  v8 = [(SPAccessoryDiscoveryPairingStatusResult *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_pairingStatus = a3;
    objc_storeStrong((id *)&v8->_lostModeInfo, a4);
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SPAccessoryDiscoveryPairingStatusResult alloc];
  int64_t v5 = [(SPAccessoryDiscoveryPairingStatusResult *)self pairingStatus];
  v6 = [(SPAccessoryDiscoveryPairingStatusResult *)self lostModeInfo];
  id v7 = [(SPAccessoryDiscoveryPairingStatusResult *)v4 initWithPairingStatus:v5 lostModeInfo:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t pairingStatus = self->_pairingStatus;
  id v5 = a3;
  [v5 encodeInt64:pairingStatus forKey:@"pairingStatus"];
  [v5 encodeObject:self->_lostModeInfo forKey:@"lostModeInfo"];
}

- (SPAccessoryDiscoveryPairingStatusResult)initWithCoder:(id)a3
{
  id v4 = a3;
  self->_int64_t pairingStatus = [v4 decodeInt64ForKey:@"pairingStatus"];
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lostModeInfo"];

  lostModeInfo = self->_lostModeInfo;
  self->_lostModeInfo = v5;

  return self;
}

- (int64_t)pairingStatus
{
  return self->_pairingStatus;
}

- (SPLostModeInfo)lostModeInfo
{
  return self->_lostModeInfo;
}

- (void).cxx_destruct
{
}

@end