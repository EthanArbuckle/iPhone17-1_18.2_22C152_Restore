@interface SPOwnedCircleDataIntegrity
+ (BOOL)supportsSecureCoding;
- (NSArray)estimatedLocations;
- (NSArray)itemSharingKey;
- (NSArray)observations;
- (NSArray)peerTrusts;
- (SPDataIntegrityCheck)beaconRecord;
- (SPDataIntegrityCheck)circleRecord;
- (SPDataIntegrityCheck)keySyncRecord;
- (SPOwnedCircleDataIntegrity)initWithCircleRecord:(id)a3 beaconRecord:(id)a4 peerTrusts:(id)a5 sharedSecrets:(id)a6 keySyncRecord:(id)a7 observations:(id)a8 itemSharingKey:(id)a9 estimatedLocations:(id)a10;
- (SPOwnedCircleDataIntegrity)initWithCoder:(id)a3;
- (SPSharedSecretsDataCheck)sharedSecrets;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBeaconRecord:(id)a3;
- (void)setCircleRecord:(id)a3;
- (void)setEstimatedLocations:(id)a3;
- (void)setItemSharingKey:(id)a3;
- (void)setKeySyncRecord:(id)a3;
- (void)setObservations:(id)a3;
- (void)setPeerTrusts:(id)a3;
- (void)setSharedSecrets:(id)a3;
@end

@implementation SPOwnedCircleDataIntegrity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPOwnedCircleDataIntegrity)initWithCircleRecord:(id)a3 beaconRecord:(id)a4 peerTrusts:(id)a5 sharedSecrets:(id)a6 keySyncRecord:(id)a7 observations:(id)a8 itemSharingKey:(id)a9 estimatedLocations:(id)a10
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v22 = a8;
  id v21 = a9;
  id v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)SPOwnedCircleDataIntegrity;
  v18 = [(SPOwnedCircleDataIntegrity *)&v28 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_circleRecord, a3);
    objc_storeStrong((id *)&v19->_beaconRecord, a4);
    objc_storeStrong((id *)&v19->_peerTrusts, a5);
    objc_storeStrong((id *)&v19->_sharedSecrets, a6);
    objc_storeStrong((id *)&v19->_keySyncRecord, a7);
    objc_storeStrong((id *)&v19->_observations, a8);
    objc_storeStrong((id *)&v19->_itemSharingKey, a9);
    objc_storeStrong((id *)&v19->_estimatedLocations, a10);
  }

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SPOwnedCircleDataIntegrity alloc];
  v5 = [(SPOwnedCircleDataIntegrity *)self circleRecord];
  v6 = [(SPOwnedCircleDataIntegrity *)self beaconRecord];
  v7 = [(SPOwnedCircleDataIntegrity *)self peerTrusts];
  v8 = [(SPOwnedCircleDataIntegrity *)self sharedSecrets];
  v9 = [(SPOwnedCircleDataIntegrity *)self keySyncRecord];
  v10 = [(SPOwnedCircleDataIntegrity *)self observations];
  v11 = [(SPOwnedCircleDataIntegrity *)self itemSharingKey];
  v12 = [(SPOwnedCircleDataIntegrity *)self estimatedLocations];
  v13 = [(SPOwnedCircleDataIntegrity *)v4 initWithCircleRecord:v5 beaconRecord:v6 peerTrusts:v7 sharedSecrets:v8 keySyncRecord:v9 observations:v10 itemSharingKey:v11 estimatedLocations:v12];

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  circleRecord = self->_circleRecord;
  id v5 = a3;
  [v5 encodeObject:circleRecord forKey:@"circleRecord"];
  [v5 encodeObject:self->_beaconRecord forKey:@"beaconRecord"];
  [v5 encodeObject:self->_peerTrusts forKey:@"peerTrusts"];
  [v5 encodeObject:self->_sharedSecrets forKey:@"sharedSecrets"];
  [v5 encodeObject:self->_keySyncRecord forKey:@"keySyncRecord"];
  [v5 encodeObject:self->_observations forKey:@"observations"];
  [v5 encodeObject:self->_itemSharingKey forKey:@"itemSharingKey"];
  [v5 encodeObject:self->_estimatedLocations forKey:@"estimatedLocations"];
}

- (SPOwnedCircleDataIntegrity)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"circleRecord"];
  circleRecord = self->_circleRecord;
  self->_circleRecord = v5;

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"beaconRecord"];
  beaconRecord = self->_beaconRecord;
  self->_beaconRecord = v7;

  v9 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"peerTrusts"];
  peerTrusts = self->_peerTrusts;
  self->_peerTrusts = v9;

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharedSecrets"];
  sharedSecrets = self->_sharedSecrets;
  self->_sharedSecrets = v11;

  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keySyncRecord"];
  keySyncRecord = self->_keySyncRecord;
  self->_keySyncRecord = v13;

  v15 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"observations"];
  observations = self->_observations;
  self->_observations = v15;

  id v17 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"itemSharingKey"];
  itemSharingKey = self->_itemSharingKey;
  self->_itemSharingKey = v17;

  v19 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"estimatedLocations"];

  estimatedLocations = self->_estimatedLocations;
  self->_estimatedLocations = v19;

  return self;
}

- (SPDataIntegrityCheck)circleRecord
{
  return self->_circleRecord;
}

- (void)setCircleRecord:(id)a3
{
}

- (SPDataIntegrityCheck)beaconRecord
{
  return self->_beaconRecord;
}

- (void)setBeaconRecord:(id)a3
{
}

- (NSArray)peerTrusts
{
  return self->_peerTrusts;
}

- (void)setPeerTrusts:(id)a3
{
}

- (SPSharedSecretsDataCheck)sharedSecrets
{
  return self->_sharedSecrets;
}

- (void)setSharedSecrets:(id)a3
{
}

- (SPDataIntegrityCheck)keySyncRecord
{
  return self->_keySyncRecord;
}

- (void)setKeySyncRecord:(id)a3
{
}

- (NSArray)observations
{
  return self->_observations;
}

- (void)setObservations:(id)a3
{
}

- (NSArray)itemSharingKey
{
  return self->_itemSharingKey;
}

- (void)setItemSharingKey:(id)a3
{
}

- (NSArray)estimatedLocations
{
  return self->_estimatedLocations;
}

- (void)setEstimatedLocations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_estimatedLocations, 0);
  objc_storeStrong((id *)&self->_itemSharingKey, 0);
  objc_storeStrong((id *)&self->_observations, 0);
  objc_storeStrong((id *)&self->_keySyncRecord, 0);
  objc_storeStrong((id *)&self->_sharedSecrets, 0);
  objc_storeStrong((id *)&self->_peerTrusts, 0);
  objc_storeStrong((id *)&self->_beaconRecord, 0);

  objc_storeStrong((id *)&self->_circleRecord, 0);
}

@end