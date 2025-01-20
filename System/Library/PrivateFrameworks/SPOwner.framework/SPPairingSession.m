@interface SPPairingSession
+ (BOOL)supportsSecureCoding;
- (BOOL)ackSuccess;
- (BOOL)isZeus;
- (BOOL)pairingUsingTool;
- (CLLocation)pairingLocation;
- (NSData)attestation;
- (NSData)baaIntermediateCert;
- (NSData)baaLeaftCert;
- (NSData)chipId;
- (NSData)collaborativeKeyC1;
- (NSData)collaborativeKeyC2;
- (NSData)collaborativeKeyC3;
- (NSData)confirmSignature;
- (NSData)ecid;
- (NSData)keyGenerationStatus;
- (NSData)nonce;
- (NSData)payloadSignature;
- (NSData)refKeyPublicKey;
- (NSData)serverPublicKey;
- (NSData)serverSeed;
- (NSData)serverSignature;
- (NSData)systemPublicKey;
- (NSString)maskedAppleID;
- (NSString)name;
- (NSString)roleEmoji;
- (NSString)serialNumber;
- (NSString)systemVersion;
- (NSString)userMessage;
- (NSUUID)beaconId;
- (NSUUID)identifier;
- (SPPairingSession)initWithCoder:(id)a3;
- (SPPairingSession)initWithIdentifier:(id)a3 nonce:(id)a4;
- (id)debugDescription;
- (int64_t)batteryLevel;
- (int64_t)productId;
- (int64_t)roleId;
- (int64_t)vendorId;
- (void)encodeWithCoder:(id)a3;
- (void)setAckSuccess:(BOOL)a3;
- (void)setAttestation:(id)a3;
- (void)setBaaIntermediateCert:(id)a3;
- (void)setBaaLeaftCert:(id)a3;
- (void)setBatteryLevel:(int64_t)a3;
- (void)setBeaconId:(id)a3;
- (void)setChipId:(id)a3;
- (void)setCollaborativeKeyC1:(id)a3;
- (void)setCollaborativeKeyC2:(id)a3;
- (void)setCollaborativeKeyC3:(id)a3;
- (void)setConfirmSignature:(id)a3;
- (void)setEcid:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsZeus:(BOOL)a3;
- (void)setKeyGenerationStatus:(id)a3;
- (void)setMaskedAppleID:(id)a3;
- (void)setName:(id)a3;
- (void)setNonce:(id)a3;
- (void)setPairingLocation:(id)a3;
- (void)setPairingUsingTool:(BOOL)a3;
- (void)setPayloadSignature:(id)a3;
- (void)setProductId:(int64_t)a3;
- (void)setRefKeyPublicKey:(id)a3;
- (void)setRoleEmoji:(id)a3;
- (void)setRoleId:(int64_t)a3;
- (void)setSerialNumber:(id)a3;
- (void)setServerPublicKey:(id)a3;
- (void)setServerSeed:(id)a3;
- (void)setServerSignature:(id)a3;
- (void)setSystemPublicKey:(id)a3;
- (void)setSystemVersion:(id)a3;
- (void)setUserMessage:(id)a3;
- (void)setVendorId:(int64_t)a3;
- (void)updateName:(id)a3 roleId:(int64_t)a4 roleEmoji:(id)a5;
- (void)updateToPairingUsingTool;
- (void)updateWithConfiguration:(id)a3;
- (void)updateWithPayloadSignature:(id)a3 attestation:(id)a4 collaborativeKey:(id)a5 systemVersion:(id)a6 vendorId:(int64_t)a7 productId:(int64_t)a8 ecid:(id)a9 chipId:(id)a10 serialNumber:(id)a11;
- (void)updateWithSeed:(id)a3 collaborativeKeyC2:(id)a4 serverSignature:(id)a5 serverPublicKey:(id)a6 maskedAppleID:(id)a7 userMessage:(id)a8 baaIntermediateCert:(id)a9 baaLeafCert:(id)a10;
@end

@implementation SPPairingSession

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPPairingSession)initWithIdentifier:(id)a3 nonce:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SPPairingSession;
  v9 = [(SPPairingSession *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_nonce, a4);
  }

  return v10;
}

- (void)updateWithSeed:(id)a3 collaborativeKeyC2:(id)a4 serverSignature:(id)a5 serverPublicKey:(id)a6 maskedAppleID:(id)a7 userMessage:(id)a8 baaIntermediateCert:(id)a9 baaLeafCert:(id)a10
{
  id v23 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  [(SPPairingSession *)self setServerSeed:a3];
  [(SPPairingSession *)self setCollaborativeKeyC2:v22];

  [(SPPairingSession *)self setServerSignature:v21];
  [(SPPairingSession *)self setServerPublicKey:v20];

  [(SPPairingSession *)self setMaskedAppleID:v19];
  [(SPPairingSession *)self setUserMessage:v18];

  [(SPPairingSession *)self setBaaIntermediateCert:v17];
  [(SPPairingSession *)self setBaaLeaftCert:v23];
}

- (void)updateWithPayloadSignature:(id)a3 attestation:(id)a4 collaborativeKey:(id)a5 systemVersion:(id)a6 vendorId:(int64_t)a7 productId:(int64_t)a8 ecid:(id)a9 chipId:(id)a10 serialNumber:(id)a11
{
  id v18 = a11;
  id v19 = a10;
  id v20 = a9;
  id v23 = a5;
  id v21 = a4;
  id v22 = a3;
  [(SPPairingSession *)self setSystemVersion:a6];
  [(SPPairingSession *)self setVendorId:a7];
  [(SPPairingSession *)self setProductId:a8];
  [(SPPairingSession *)self setEcid:v20];

  [(SPPairingSession *)self setChipId:v19];
  [(SPPairingSession *)self setSerialNumber:v18];

  [(SPPairingSession *)self setPayloadSignature:v22];
  [(SPPairingSession *)self setAttestation:v21];

  [(SPPairingSession *)self setCollaborativeKeyC1:v23];
}

- (void)updateName:(id)a3 roleId:(int64_t)a4 roleEmoji:(id)a5
{
  id v8 = a5;
  [(SPPairingSession *)self setName:a3];
  [(SPPairingSession *)self setRoleId:a4];
  [(SPPairingSession *)self setRoleEmoji:v8];
}

- (void)updateWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [v4 name];
  [(SPPairingSession *)self setName:v5];

  -[SPPairingSession setRoleId:](self, "setRoleId:", [v4 roleId]);
  v6 = [v4 roleEmoji];
  [(SPPairingSession *)self setRoleEmoji:v6];

  id v7 = [v4 keyStatus];
  [(SPPairingSession *)self setKeyGenerationStatus:v7];

  id v8 = [v4 collaborativeKeyC3];
  [(SPPairingSession *)self setCollaborativeKeyC3:v8];

  v9 = [v4 signatureS4];
  [(SPPairingSession *)self setConfirmSignature:v9];

  -[SPPairingSession setIsZeus:](self, "setIsZeus:", [v4 isZeus]);
  uint64_t v10 = [v4 batteryLevel];

  [(SPPairingSession *)self setBatteryLevel:v10];
}

- (void)updateToPairingUsingTool
{
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_beaconId forKey:@"beaconId"];
  [v5 encodeObject:self->_nonce forKey:@"nonce"];
  [v5 encodeBool:self->_pairingUsingTool forKey:@"pairingUsingTool"];
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeInteger:self->_roleId forKey:@"roleId"];
  [v5 encodeObject:self->_roleEmoji forKey:@"roleEmoji"];
  [v5 encodeObject:self->_systemVersion forKey:@"systemVersion"];
  [v5 encodeInteger:self->_vendorId forKey:@"vendorId"];
  [v5 encodeInteger:self->_productId forKey:@"productId"];
  [v5 encodeObject:self->_ecid forKey:@"ecid"];
  [v5 encodeObject:self->_chipId forKey:@"chipId"];
  [v5 encodeObject:self->_serialNumber forKey:@"serialNumber"];
  [v5 encodeObject:self->_collaborativeKeyC1 forKey:@"collaborativeKeyC1"];
  [v5 encodeObject:self->_payloadSignature forKey:@"payloadSignature"];
  [v5 encodeObject:self->_attestation forKey:@"attestation"];
  [v5 encodeObject:self->_systemPublicKey forKey:@"systemPublicKey"];
  [v5 encodeObject:self->_refKeyPublicKey forKey:@"refKeyPublicKey"];
  [v5 encodeObject:self->_maskedAppleID forKey:@"maskedAppleID"];
  [v5 encodeObject:self->_userMessage forKey:@"userMessage"];
  [v5 encodeObject:self->_collaborativeKeyC2 forKey:@"collaborativeKeyC2"];
  [v5 encodeObject:self->_serverSeed forKey:@"serverSeed"];
  [v5 encodeObject:self->_serverSignature forKey:@"serverSignature"];
  [v5 encodeObject:self->_serverPublicKey forKey:@"serverPublicKey"];
  [v5 encodeObject:self->_baaIntermediateCert forKey:@"baaIntermediateCert"];
  [v5 encodeObject:self->_baaLeaftCert forKey:@"baaLeaftCert"];
  [v5 encodeObject:self->_collaborativeKeyC3 forKey:@"collaborativeKeyC3"];
  [v5 encodeObject:self->_confirmSignature forKey:@"confirmSignature"];
  [v5 encodeBool:self->_ackSuccess forKey:@"ackSuccess"];
  [v5 encodeObject:self->_keyGenerationStatus forKey:@"keyGenerationStatus"];
  [v5 encodeBool:self->_isZeus forKey:@"isZeus"];
  [v5 encodeInteger:self->_batteryLevel forKey:@"batteryLevel"];
  [v5 encodeObject:self->_pairingLocation forKey:@"pairingLocation"];
}

- (SPPairingSession)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  identifier = self->_identifier;
  self->_identifier = v5;

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"beaconId"];
  beaconId = self->_beaconId;
  self->_beaconId = v7;

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nonce"];
  nonce = self->_nonce;
  self->_nonce = v9;

  self->_pairingUsingTool = [v4 decodeBoolForKey:@"pairingUsingTool"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  name = self->_name;
  self->_name = v11;

  self->_roleId = [v4 decodeIntegerForKey:@"roleId"];
  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"roleEmoji"];
  roleEmoji = self->_roleEmoji;
  self->_roleEmoji = v13;

  v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"systemVersion"];
  systemVersion = self->_systemVersion;
  self->_systemVersion = v15;

  self->_vendorId = [v4 decodeIntegerForKey:@"vendorId"];
  self->_productId = [v4 decodeIntegerForKey:@"productId"];
  id v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ecid"];
  ecid = self->_ecid;
  self->_ecid = v17;

  id v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"chipId"];
  chipId = self->_chipId;
  self->_chipId = v19;

  id v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serialNumber"];
  serialNumber = self->_serialNumber;
  self->_serialNumber = v21;

  id v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"collaborativeKeyC1"];
  collaborativeKeyC1 = self->_collaborativeKeyC1;
  self->_collaborativeKeyC1 = v23;

  v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payloadSignature"];
  payloadSignature = self->_payloadSignature;
  self->_payloadSignature = v25;

  v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attestation"];
  attestation = self->_attestation;
  self->_attestation = v27;

  v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"systemPublicKey"];
  systemPublicKey = self->_systemPublicKey;
  self->_systemPublicKey = v29;

  v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"refKeyPublicKey"];
  refKeyPublicKey = self->_refKeyPublicKey;
  self->_refKeyPublicKey = v31;

  v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maskedAppleID"];
  maskedAppleID = self->_maskedAppleID;
  self->_maskedAppleID = v33;

  v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userMessage"];
  userMessage = self->_userMessage;
  self->_userMessage = v35;

  v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"collaborativeKeyC2"];
  collaborativeKeyC2 = self->_collaborativeKeyC2;
  self->_collaborativeKeyC2 = v37;

  v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serverSeed"];
  serverSeed = self->_serverSeed;
  self->_serverSeed = v39;

  v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serverSignature"];
  serverSignature = self->_serverSignature;
  self->_serverSignature = v41;

  v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serverPublicKey"];
  serverPublicKey = self->_serverPublicKey;
  self->_serverPublicKey = v43;

  v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"baaIntermediateCert"];
  baaIntermediateCert = self->_baaIntermediateCert;
  self->_baaIntermediateCert = v45;

  v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"baaLeaftCert"];
  baaLeaftCert = self->_baaLeaftCert;
  self->_baaLeaftCert = v47;

  v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"collaborativeKeyC3"];
  collaborativeKeyC3 = self->_collaborativeKeyC3;
  self->_collaborativeKeyC3 = v49;

  v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"confirmSignature"];
  confirmSignature = self->_confirmSignature;
  self->_confirmSignature = v51;

  self->_ackSuccess = [v4 decodeBoolForKey:@"ackSuccess"];
  v53 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyGenerationStatus"];
  keyGenerationStatus = self->_keyGenerationStatus;
  self->_keyGenerationStatus = v53;

  self->_isZeus = [v4 decodeBoolForKey:@"isZeus"];
  self->_batteryLevel = [v4 decodeIntegerForKey:@"batteryLevel"];
  v55 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pairingLocation"];

  pairingLocation = self->_pairingLocation;
  self->_pairingLocation = v55;

  return self;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(SPPairingSession *)self identifier];
  v6 = [v3 stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return v6;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
}

- (NSUUID)beaconId
{
  return self->_beaconId;
}

- (void)setBeaconId:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int64_t)roleId
{
  return self->_roleId;
}

- (void)setRoleId:(int64_t)a3
{
  self->_roleId = a3;
}

- (NSString)roleEmoji
{
  return self->_roleEmoji;
}

- (void)setRoleEmoji:(id)a3
{
}

- (NSString)systemVersion
{
  return self->_systemVersion;
}

- (void)setSystemVersion:(id)a3
{
}

- (int64_t)vendorId
{
  return self->_vendorId;
}

- (void)setVendorId:(int64_t)a3
{
  self->_vendorId = a3;
}

- (int64_t)productId
{
  return self->_productId;
}

- (void)setProductId:(int64_t)a3
{
  self->_productId = a3;
}

- (NSData)ecid
{
  return self->_ecid;
}

- (void)setEcid:(id)a3
{
}

- (NSData)chipId
{
  return self->_chipId;
}

- (void)setChipId:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSData)collaborativeKeyC1
{
  return self->_collaborativeKeyC1;
}

- (void)setCollaborativeKeyC1:(id)a3
{
}

- (NSData)payloadSignature
{
  return self->_payloadSignature;
}

- (void)setPayloadSignature:(id)a3
{
}

- (NSData)attestation
{
  return self->_attestation;
}

- (void)setAttestation:(id)a3
{
}

- (NSData)systemPublicKey
{
  return self->_systemPublicKey;
}

- (void)setSystemPublicKey:(id)a3
{
}

- (NSData)refKeyPublicKey
{
  return self->_refKeyPublicKey;
}

- (void)setRefKeyPublicKey:(id)a3
{
}

- (NSData)collaborativeKeyC2
{
  return self->_collaborativeKeyC2;
}

- (void)setCollaborativeKeyC2:(id)a3
{
}

- (NSData)serverSeed
{
  return self->_serverSeed;
}

- (void)setServerSeed:(id)a3
{
}

- (NSData)serverSignature
{
  return self->_serverSignature;
}

- (void)setServerSignature:(id)a3
{
}

- (NSData)serverPublicKey
{
  return self->_serverPublicKey;
}

- (void)setServerPublicKey:(id)a3
{
}

- (NSString)maskedAppleID
{
  return self->_maskedAppleID;
}

- (void)setMaskedAppleID:(id)a3
{
}

- (NSString)userMessage
{
  return self->_userMessage;
}

- (void)setUserMessage:(id)a3
{
}

- (NSData)baaLeaftCert
{
  return self->_baaLeaftCert;
}

- (void)setBaaLeaftCert:(id)a3
{
}

- (NSData)baaIntermediateCert
{
  return self->_baaIntermediateCert;
}

- (void)setBaaIntermediateCert:(id)a3
{
}

- (NSData)collaborativeKeyC3
{
  return self->_collaborativeKeyC3;
}

- (void)setCollaborativeKeyC3:(id)a3
{
}

- (NSData)confirmSignature
{
  return self->_confirmSignature;
}

- (void)setConfirmSignature:(id)a3
{
}

- (BOOL)ackSuccess
{
  return self->_ackSuccess;
}

- (void)setAckSuccess:(BOOL)a3
{
  self->_ackSuccess = a3;
}

- (NSData)keyGenerationStatus
{
  return self->_keyGenerationStatus;
}

- (void)setKeyGenerationStatus:(id)a3
{
}

- (BOOL)isZeus
{
  return self->_isZeus;
}

- (void)setIsZeus:(BOOL)a3
{
  self->_isZeus = a3;
}

- (int64_t)batteryLevel
{
  return self->_batteryLevel;
}

- (void)setBatteryLevel:(int64_t)a3
{
  self->_batteryLevel = a3;
}

- (CLLocation)pairingLocation
{
  return self->_pairingLocation;
}

- (void)setPairingLocation:(id)a3
{
}

- (BOOL)pairingUsingTool
{
  return self->_pairingUsingTool;
}

- (void)setPairingUsingTool:(BOOL)a3
{
  self->_pairingUsingTool = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingLocation, 0);
  objc_storeStrong((id *)&self->_keyGenerationStatus, 0);
  objc_storeStrong((id *)&self->_confirmSignature, 0);
  objc_storeStrong((id *)&self->_collaborativeKeyC3, 0);
  objc_storeStrong((id *)&self->_baaIntermediateCert, 0);
  objc_storeStrong((id *)&self->_baaLeaftCert, 0);
  objc_storeStrong((id *)&self->_userMessage, 0);
  objc_storeStrong((id *)&self->_maskedAppleID, 0);
  objc_storeStrong((id *)&self->_serverPublicKey, 0);
  objc_storeStrong((id *)&self->_serverSignature, 0);
  objc_storeStrong((id *)&self->_serverSeed, 0);
  objc_storeStrong((id *)&self->_collaborativeKeyC2, 0);
  objc_storeStrong((id *)&self->_refKeyPublicKey, 0);
  objc_storeStrong((id *)&self->_systemPublicKey, 0);
  objc_storeStrong((id *)&self->_attestation, 0);
  objc_storeStrong((id *)&self->_payloadSignature, 0);
  objc_storeStrong((id *)&self->_collaborativeKeyC1, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_chipId, 0);
  objc_storeStrong((id *)&self->_ecid, 0);
  objc_storeStrong((id *)&self->_systemVersion, 0);
  objc_storeStrong((id *)&self->_roleEmoji, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_beaconId, 0);
  objc_storeStrong((id *)&self->_nonce, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end