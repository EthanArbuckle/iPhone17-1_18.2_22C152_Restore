@interface SPPairingState
+ (BOOL)supportsSecureCoding;
- (NSData)macAddress;
- (NSNumber)pairingEpoch;
- (NSUUID)beaconIdentifier;
- (SPPairingState)initWithCoder:(id)a3;
- (SPPairingState)initWithStatus:(int64_t)a3 beaconIdentifier:(id)a4 macAddress:(id)a5 pairingEpoch:(id)a6 partId:(unsigned __int8)a7 pairingType:(int64_t)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)pairingType;
- (int64_t)status;
- (unsigned)partId;
- (void)encodeWithCoder:(id)a3;
- (void)setBeaconIdentifier:(id)a3;
- (void)setMacAddress:(id)a3;
- (void)setPairingEpoch:(id)a3;
- (void)setPairingType:(int64_t)a3;
- (void)setPartId:(unsigned __int8)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation SPPairingState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPPairingState)initWithStatus:(int64_t)a3 beaconIdentifier:(id)a4 macAddress:(id)a5 pairingEpoch:(id)a6 partId:(unsigned __int8)a7 pairingType:(int64_t)a8
{
  uint64_t v9 = a7;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SPPairingState;
  v17 = [(SPPairingState *)&v20 init];
  v18 = v17;
  if (v17)
  {
    [(SPPairingState *)v17 setStatus:a3];
    [(SPPairingState *)v18 setBeaconIdentifier:v14];
    [(SPPairingState *)v18 setMacAddress:v15];
    [(SPPairingState *)v18 setPairingEpoch:v16];
    [(SPPairingState *)v18 setPartId:v9];
    [(SPPairingState *)v18 setPairingType:a8];
  }

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SPPairingState alloc];
  int64_t v5 = [(SPPairingState *)self status];
  v6 = [(SPPairingState *)self beaconIdentifier];
  v7 = [(SPPairingState *)self macAddress];
  v8 = [(SPPairingState *)self pairingEpoch];
  uint64_t v9 = [(SPPairingState *)v4 initWithStatus:v5 beaconIdentifier:v6 macAddress:v7 pairingEpoch:v8 partId:[(SPPairingState *)self partId] pairingType:[(SPPairingState *)self pairingType]];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t status = self->_status;
  id v6 = a3;
  [v6 encodeInteger:status forKey:@"status"];
  [v6 encodeObject:self->_beaconIdentifier forKey:@"beaconIdentifier"];
  [v6 encodeObject:self->_macAddress forKey:@"macAddress"];
  [v6 encodeObject:self->_pairingEpoch forKey:@"pairingEpoch"];
  int64_t v5 = [NSNumber numberWithUnsignedChar:self->_partId];
  [v6 encodeObject:v5 forKey:@"partId"];

  [v6 encodeInteger:self->_pairingType forKey:@"pairingType"];
}

- (SPPairingState)initWithCoder:(id)a3
{
  id v4 = a3;
  self->_int64_t status = [v4 decodeIntegerForKey:@"status"];
  int64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"beaconIdentifier"];
  beaconIdentifier = self->_beaconIdentifier;
  self->_beaconIdentifier = v5;

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"macAddress"];
  macAddress = self->_macAddress;
  self->_macAddress = v7;

  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pairingEpoch"];
  pairingEpoch = self->_pairingEpoch;
  self->_pairingEpoch = v9;

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"partId"];
  self->_partId = [v11 unsignedIntegerValue];

  int64_t v12 = [v4 decodeIntegerForKey:@"pairingType"];
  self->_pairingType = v12;
  return self;
}

- (id)description
{
  unint64_t status = self->_status;
  if (status > 2) {
    v3 = 0;
  }
  else {
    v3 = off_1E601B9C8[status];
  }
  unint64_t v4 = self->_pairingType + 1;
  if (v4 > 2) {
    int64_t v5 = 0;
  }
  else {
    int64_t v5 = off_1E601B9E0[v4];
  }
  return (id)[NSString stringWithFormat:@"<%@: %p state: %@ beaconId: %@ macAddress: %@ pairingEpoch: %@ partId: %ld pairingType: %@>", objc_opt_class(), self, v3, self->_beaconIdentifier, self->_macAddress, self->_pairingEpoch, self->_partId, v5];
}

- (NSUUID)beaconIdentifier
{
  return self->_beaconIdentifier;
}

- (void)setBeaconIdentifier:(id)a3
{
}

- (NSData)macAddress
{
  return self->_macAddress;
}

- (void)setMacAddress:(id)a3
{
}

- (NSNumber)pairingEpoch
{
  return self->_pairingEpoch;
}

- (void)setPairingEpoch:(id)a3
{
}

- (unsigned)partId
{
  return self->_partId;
}

- (void)setPartId:(unsigned __int8)a3
{
  self->_partId = a3;
}

- (int64_t)pairingType
{
  return self->_pairingType;
}

- (void)setPairingType:(int64_t)a3
{
  self->_pairingType = a3;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_unint64_t status = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingEpoch, 0);
  objc_storeStrong((id *)&self->_macAddress, 0);

  objc_storeStrong((id *)&self->_beaconIdentifier, 0);
}

@end