@interface PKEncryptedPushProvisioningTarget
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEncryptedProvisioningTarget:(id)a3;
- (NSData)data;
- (NSData)ephemeralPublicKey;
- (NSData)publicKeyHash;
- (NSString)secondarySource;
- (NSString)verificationCode;
- (PKEncryptedPushProvisioningTarget)initWithCoder:(id)a3;
- (id)asWebServiceDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)source;
- (unint64_t)status;
- (unint64_t)targetDevice;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
- (void)setEphemeralPublicKey:(id)a3;
- (void)setPublicKeyHash:(id)a3;
- (void)setSecondarySource:(id)a3;
- (void)setSource:(unint64_t)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setTargetDevice:(unint64_t)a3;
- (void)setVerificationCode:(id)a3;
@end

@implementation PKEncryptedPushProvisioningTarget

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  v4 = [(NSData *)self->_publicKeyHash hexEncoding];
  [v3 appendFormat:@"publicKeyHash: '%@'; ", v4];

  v5 = [(NSData *)self->_ephemeralPublicKey base64EncodedStringWithOptions:0];
  [v3 appendFormat:@"ephemeralPublicKey: '%@'; ", v5];

  v6 = [(NSData *)self->_data description];
  [v3 appendFormat:@"data: '%@'; ", v6];

  objc_msgSend(v3, "appendFormat:", @"source: '%ld'; ", self->_source);
  objc_msgSend(v3, "appendFormat:", @"status: '%ld'; ", self->_status);
  objc_msgSend(v3, "appendFormat:", @"targetDevice: '%ld'; ", self->_targetDevice);
  [v3 appendFormat:@"verificationCode: '%@'; ", self->_verificationCode];
  [v3 appendFormat:@"secondarySource: '%@'; ", self->_secondarySource];
  [v3 appendFormat:@">"];
  v7 = (void *)[v3 copy];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKEncryptedPushProvisioningTarget)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKEncryptedPushProvisioningTarget;
  v5 = [(PKEncryptedPushProvisioningTarget *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicKeyHash"];
    publicKeyHash = v5->_publicKeyHash;
    v5->_publicKeyHash = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ephemeralPublicKey"];
    ephemeralPublicKey = v5->_ephemeralPublicKey;
    v5->_ephemeralPublicKey = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encryptedProvisioningTarget"];
    data = v5->_data;
    v5->_data = (NSData *)v10;

    v5->_source = [v4 decodeIntegerForKey:@"source"];
    v5->_status = [v4 decodeIntegerForKey:@"status"];
    v5->_targetDevice = [v4 decodeIntegerForKey:@"targetDevice"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"verificationCode"];
    verificationCode = v5->_verificationCode;
    v5->_verificationCode = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secondarySource"];
    secondarySource = v5->_secondarySource;
    v5->_secondarySource = (NSString *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  publicKeyHash = self->_publicKeyHash;
  id v5 = a3;
  [v5 encodeObject:publicKeyHash forKey:@"publicKeyHash"];
  [v5 encodeObject:self->_ephemeralPublicKey forKey:@"ephemeralPublicKey"];
  [v5 encodeObject:self->_data forKey:@"encryptedProvisioningTarget"];
  [v5 encodeInteger:self->_source forKey:@"source"];
  [v5 encodeInteger:self->_status forKey:@"status"];
  [v5 encodeInteger:self->_targetDevice forKey:@"targetDevice"];
  [v5 encodeObject:self->_verificationCode forKey:@"verificationCode"];
  [v5 encodeObject:self->_secondarySource forKey:@"secondarySource"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKEncryptedPushProvisioningTarget *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKEncryptedPushProvisioningTarget *)self isEqualToEncryptedProvisioningTarget:v5];

  return v6;
}

- (BOOL)isEqualToEncryptedProvisioningTarget:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_28;
  }
  ephemeralPublicKey = self->_ephemeralPublicKey;
  BOOL v6 = (NSData *)v4[1];
  if (ephemeralPublicKey) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (ephemeralPublicKey != v6) {
      goto LABEL_28;
    }
  }
  else
  {
    char v8 = -[NSData isEqual:](ephemeralPublicKey, "isEqual:");
    if ((v8 & 1) == 0) {
      goto LABEL_28;
    }
  }
  publicKeyHash = self->_publicKeyHash;
  uint64_t v10 = (NSData *)v4[2];
  if (publicKeyHash && v10)
  {
    if ((-[NSData isEqual:](publicKeyHash, "isEqual:") & 1) == 0) {
      goto LABEL_28;
    }
  }
  else if (publicKeyHash != v10)
  {
    goto LABEL_28;
  }
  data = self->_data;
  uint64_t v12 = (NSData *)v4[3];
  if (!data || !v12)
  {
    if (data == v12) {
      goto LABEL_20;
    }
LABEL_28:
    LOBYTE(v17) = 0;
    goto LABEL_29;
  }
  if ((-[NSData isEqual:](data, "isEqual:") & 1) == 0) {
    goto LABEL_28;
  }
LABEL_20:
  if (self->_status != v4[4] || self->_source != v4[5] || self->_targetDevice != v4[6]) {
    goto LABEL_28;
  }
  v13 = (void *)v4[7];
  uint64_t v14 = self->_verificationCode;
  v15 = v13;
  if (v14 == v15)
  {

    goto LABEL_31;
  }
  v16 = v15;
  LOBYTE(v17) = 0;
  if (!v14 || !v15)
  {
LABEL_36:

    goto LABEL_29;
  }
  BOOL v17 = [(NSString *)v14 isEqualToString:v15];

  if (v17)
  {
LABEL_31:
    secondarySource = self->_secondarySource;
    v20 = (void *)v4[8];
    uint64_t v14 = secondarySource;
    v21 = v20;
    if (v14 == v21)
    {
      LOBYTE(v17) = 1;
      v16 = v14;
    }
    else
    {
      v16 = v21;
      LOBYTE(v17) = 0;
      if (v14 && v21) {
        LOBYTE(v17) = [(NSString *)v14 isEqualToString:v21];
      }
    }
    goto LABEL_36;
  }
LABEL_29:

  return v17;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_publicKeyHash];
  [v3 safelyAddObject:self->_ephemeralPublicKey];
  [v3 safelyAddObject:self->_data];
  [v3 safelyAddObject:self->_verificationCode];
  [v3 safelyAddObject:self->_secondarySource];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_source - v4 + 32 * v4;
  unint64_t v6 = self->_targetDevice - v5 + 32 * v5;
  unint64_t v7 = self->_status - v6 + 32 * v6;

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_ephemeralPublicKey copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(NSData *)self->_publicKeyHash copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  uint64_t v10 = [(NSData *)self->_data copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  *(void *)(v5 + 32) = self->_status;
  *(void *)(v5 + 40) = self->_source;
  *(void *)(v5 + 48) = self->_targetDevice;
  objc_storeStrong((id *)(v5 + 56), self->_verificationCode);
  objc_storeStrong((id *)(v5 + 64), self->_secondarySource);
  return (id)v5;
}

- (id)asWebServiceDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = [(NSData *)self->_publicKeyHash hexEncoding];
  [v3 setObject:v4 forKey:@"publicKeyHash"];

  uint64_t v5 = [(NSData *)self->_ephemeralPublicKey base64EncodedStringWithOptions:0];
  [v3 setObject:v5 forKey:@"ephemeralPublicKey"];

  [v3 setObject:@"EV_ECC_v3" forKey:@"encryptionVersion"];
  uint64_t v6 = [(NSData *)self->_data base64EncodedStringWithOptions:0];
  [v3 setObject:v6 forKey:@"encryptedProvisioningTarget"];

  [v3 setObject:self->_verificationCode forKeyedSubscript:@"verificationCode"];
  [v3 setObject:self->_secondarySource forKeyedSubscript:@"secondarySource"];
  unint64_t v7 = (void *)[v3 copy];

  return v7;
}

- (NSData)ephemeralPublicKey
{
  return self->_ephemeralPublicKey;
}

- (void)setEphemeralPublicKey:(id)a3
{
}

- (NSData)publicKeyHash
{
  return self->_publicKeyHash;
}

- (void)setPublicKeyHash:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (unint64_t)targetDevice
{
  return self->_targetDevice;
}

- (void)setTargetDevice:(unint64_t)a3
{
  self->_targetDevice = a3;
}

- (NSString)verificationCode
{
  return self->_verificationCode;
}

- (void)setVerificationCode:(id)a3
{
}

- (NSString)secondarySource
{
  return self->_secondarySource;
}

- (void)setSecondarySource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondarySource, 0);
  objc_storeStrong((id *)&self->_verificationCode, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->_ephemeralPublicKey, 0);
}

@end