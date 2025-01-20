@interface SPMemberCircleDataIntegrity
+ (BOOL)supportsSecureCoding;
- (NSArray)estimatedLocations;
- (NSArray)itemSharingKey;
- (NSArray)observations;
- (NSArray)peerTrusts;
- (SPDataIntegrityCheck)circleRecord;
- (SPDataIntegrityCheck)keySyncRecord;
- (SPDataIntegrityCheck)sharedBeaconNameRecord;
- (SPDataIntegrityCheck)sharedBeaconOwnerName;
- (SPDataIntegrityCheck)sharedBeaconRecord;
- (SPMemberCircleDataIntegrity)initWithCircleRecord:(id)a3 sharedBeaconRecord:(id)a4 sharedBeaconNameRecord:(id)a5 sharedBeaconOwnerName:(id)a6 peerTrusts:(id)a7 sharedSecrets:(id)a8 keySyncRecord:(id)a9 observations:(id)a10 itemSharingKey:(id)a11 estimatedLocations:(id)a12;
- (SPMemberCircleDataIntegrity)initWithCoder:(id)a3;
- (SPSharedSecretsDataCheck)sharedSecrets;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCircleRecord:(id)a3;
- (void)setEstimatedLocations:(id)a3;
- (void)setItemSharingKey:(id)a3;
- (void)setKeySyncRecord:(id)a3;
- (void)setObservations:(id)a3;
- (void)setPeerTrusts:(id)a3;
- (void)setSharedBeaconNameRecord:(id)a3;
- (void)setSharedBeaconOwnerName:(id)a3;
- (void)setSharedBeaconRecord:(id)a3;
- (void)setSharedSecrets:(id)a3;
@end

@implementation SPMemberCircleDataIntegrity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPMemberCircleDataIntegrity)initWithCircleRecord:(id)a3 sharedBeaconRecord:(id)a4 sharedBeaconNameRecord:(id)a5 sharedBeaconOwnerName:(id)a6 peerTrusts:(id)a7 sharedSecrets:(id)a8 keySyncRecord:(id)a9 observations:(id)a10 itemSharingKey:(id)a11 estimatedLocations:(id)a12
{
  id v34 = a3;
  id obj = a4;
  id v33 = a4;
  id v32 = a5;
  id v26 = a6;
  id v31 = a6;
  id v27 = a7;
  id v30 = a7;
  id v29 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  id v21 = a12;
  v35.receiver = self;
  v35.super_class = (Class)SPMemberCircleDataIntegrity;
  v22 = [(SPMemberCircleDataIntegrity *)&v35 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_circleRecord, a3);
    objc_storeStrong((id *)&v23->_sharedBeaconRecord, obj);
    objc_storeStrong((id *)&v23->_sharedBeaconNameRecord, a5);
    objc_storeStrong((id *)&v23->_sharedBeaconOwnerName, v26);
    objc_storeStrong((id *)&v23->_peerTrusts, v27);
    objc_storeStrong((id *)&v23->_sharedSecrets, a8);
    objc_storeStrong((id *)&v23->_keySyncRecord, a9);
    objc_storeStrong((id *)&v23->_observations, a10);
    objc_storeStrong((id *)&v23->_itemSharingKey, a11);
    objc_storeStrong((id *)&v23->_estimatedLocations, a12);
  }

  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16 = [SPMemberCircleDataIntegrity alloc];
  v15 = [(SPMemberCircleDataIntegrity *)self circleRecord];
  v4 = [(SPMemberCircleDataIntegrity *)self sharedBeaconRecord];
  v5 = [(SPMemberCircleDataIntegrity *)self sharedBeaconNameRecord];
  v6 = [(SPMemberCircleDataIntegrity *)self sharedBeaconOwnerName];
  v7 = [(SPMemberCircleDataIntegrity *)self peerTrusts];
  v8 = [(SPMemberCircleDataIntegrity *)self sharedSecrets];
  v9 = [(SPMemberCircleDataIntegrity *)self keySyncRecord];
  v10 = [(SPMemberCircleDataIntegrity *)self observations];
  v11 = [(SPMemberCircleDataIntegrity *)self itemSharingKey];
  v12 = [(SPMemberCircleDataIntegrity *)self estimatedLocations];
  v13 = [(SPMemberCircleDataIntegrity *)v16 initWithCircleRecord:v15 sharedBeaconRecord:v4 sharedBeaconNameRecord:v5 sharedBeaconOwnerName:v6 peerTrusts:v7 sharedSecrets:v8 keySyncRecord:v9 observations:v10 itemSharingKey:v11 estimatedLocations:v12];

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  circleRecord = self->_circleRecord;
  id v5 = a3;
  [v5 encodeObject:circleRecord forKey:@"circleRecord"];
  [v5 encodeObject:self->_sharedBeaconRecord forKey:@"sharedBeaconRecord"];
  [v5 encodeObject:self->_sharedBeaconNameRecord forKey:@"sharedBeaconNameRecord"];
  [v5 encodeObject:self->_sharedBeaconOwnerName forKey:@"sharedBeaconOwnerName"];
  [v5 encodeObject:self->_peerTrusts forKey:@"peerTrusts"];
  [v5 encodeObject:self->_sharedSecrets forKey:@"sharedSecrets"];
  [v5 encodeObject:self->_keySyncRecord forKey:@"keySyncRecord"];
  [v5 encodeObject:self->_observations forKey:@"observations"];
  [v5 encodeObject:self->_itemSharingKey forKey:@"itemSharingKey"];
  [v5 encodeObject:self->_estimatedLocations forKey:@"estimatedLocations"];
}

- (SPMemberCircleDataIntegrity)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"circleRecord"];
  circleRecord = self->_circleRecord;
  self->_circleRecord = v5;

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharedBeaconRecord"];
  sharedBeaconRecord = self->_sharedBeaconRecord;
  self->_sharedBeaconRecord = v7;

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharedBeaconNameRecord"];
  sharedBeaconNameRecord = self->_sharedBeaconNameRecord;
  self->_sharedBeaconNameRecord = v9;

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharedBeaconOwnerName"];
  sharedBeaconOwnerName = self->_sharedBeaconOwnerName;
  self->_sharedBeaconOwnerName = v11;

  v13 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"peerTrusts"];
  peerTrusts = self->_peerTrusts;
  self->_peerTrusts = v13;

  v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharedSecrets"];
  sharedSecrets = self->_sharedSecrets;
  self->_sharedSecrets = v15;

  v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keySyncRecord"];
  keySyncRecord = self->_keySyncRecord;
  self->_keySyncRecord = v17;

  id v19 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"observations"];
  observations = self->_observations;
  self->_observations = v19;

  id v21 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"itemSharingKey"];
  itemSharingKey = self->_itemSharingKey;
  self->_itemSharingKey = v21;

  v23 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"estimatedLocations"];

  estimatedLocations = self->_estimatedLocations;
  self->_estimatedLocations = v23;

  return self;
}

- (SPDataIntegrityCheck)circleRecord
{
  return self->_circleRecord;
}

- (void)setCircleRecord:(id)a3
{
}

- (SPDataIntegrityCheck)sharedBeaconRecord
{
  return self->_sharedBeaconRecord;
}

- (void)setSharedBeaconRecord:(id)a3
{
}

- (SPDataIntegrityCheck)sharedBeaconNameRecord
{
  return self->_sharedBeaconNameRecord;
}

- (void)setSharedBeaconNameRecord:(id)a3
{
}

- (SPDataIntegrityCheck)sharedBeaconOwnerName
{
  return self->_sharedBeaconOwnerName;
}

- (void)setSharedBeaconOwnerName:(id)a3
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
  objc_storeStrong((id *)&self->_sharedBeaconOwnerName, 0);
  objc_storeStrong((id *)&self->_sharedBeaconNameRecord, 0);
  objc_storeStrong((id *)&self->_sharedBeaconRecord, 0);

  objc_storeStrong((id *)&self->_circleRecord, 0);
}

@end