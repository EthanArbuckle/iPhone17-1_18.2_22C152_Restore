@interface PKShareableCredential
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToShareableCredential:(id)a3;
- (NSString)cardConfigurationIdentifier;
- (NSString)credentialIdentifier;
- (NSString)credentialIdentifierHash;
- (NSString)nonce;
- (NSString)ownerDisplayName;
- (NSString)sharingInstanceIdentifier;
- (PKEncryptedPushProvisioningTarget)encryptedPushProvisioningTarget;
- (PKShareableCredential)initWithCoder:(id)a3;
- (PKShareableCredential)initWithProtoCredential:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)protoCredential;
- (unint64_t)hash;
- (unint64_t)status;
- (void)encodeWithCoder:(id)a3;
- (void)setCardConfigurationIdentifier:(id)a3;
- (void)setCredentialIdentifier:(id)a3;
- (void)setCredentialIdentifierHash:(id)a3;
- (void)setEncryptedPushProvisioningTarget:(id)a3;
- (void)setNonce:(id)a3;
- (void)setOwnerDisplayName:(id)a3;
- (void)setSharingInstanceIdentifier:(id)a3;
- (void)setStatus:(unint64_t)a3;
@end

@implementation PKShareableCredential

- (PKShareableCredential)initWithProtoCredential:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKShareableCredential;
  v5 = [(PKShareableCredential *)&v23 init];
  if (v5)
  {
    v6 = [v4 encryptedPushProvisioningTarget];
    v7 = objc_msgSend(v6, "pk_decodeHexadecimal");

    uint64_t v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:0];
    encryptedPushProvisioningTarget = v5->_encryptedPushProvisioningTarget;
    v5->_encryptedPushProvisioningTarget = (PKEncryptedPushProvisioningTarget *)v8;

    v5->_status = (int)[v4 status];
    uint64_t v10 = [v4 cardConfigurationIdentifier];
    cardConfigurationIdentifier = v5->_cardConfigurationIdentifier;
    v5->_cardConfigurationIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 credentialIdentifier];
    credentialIdentifier = v5->_credentialIdentifier;
    v5->_credentialIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 credentialIdentifierHash];
    credentialIdentifierHash = v5->_credentialIdentifierHash;
    v5->_credentialIdentifierHash = (NSString *)v14;

    uint64_t v16 = [v4 ownerDisplayName];
    ownerDisplayName = v5->_ownerDisplayName;
    v5->_ownerDisplayName = (NSString *)v16;

    uint64_t v18 = [v4 sharingInstanceIdentifier];
    sharingInstanceIdentifier = v5->_sharingInstanceIdentifier;
    v5->_sharingInstanceIdentifier = (NSString *)v18;

    uint64_t v20 = [v4 nonce];
    nonce = v5->_nonce;
    v5->_nonce = (NSString *)v20;
  }
  return v5;
}

- (id)protoCredential
{
  v3 = objc_alloc_init(PKProtobufShareableCredential);
  encryptedPushProvisioningTarget = self->_encryptedPushProvisioningTarget;
  if (encryptedPushProvisioningTarget)
  {
    v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:encryptedPushProvisioningTarget requiringSecureCoding:1 error:0];
    v6 = [v5 hexEncoding];
    [(PKProtobufShareableCredential *)v3 setEncryptedPushProvisioningTarget:v6];
  }
  [(PKProtobufShareableCredential *)v3 setStatus:LODWORD(self->_status)];
  [(PKProtobufShareableCredential *)v3 setCardConfigurationIdentifier:self->_cardConfigurationIdentifier];
  [(PKProtobufShareableCredential *)v3 setCredentialIdentifier:self->_credentialIdentifier];
  [(PKProtobufShareableCredential *)v3 setCredentialIdentifierHash:self->_credentialIdentifierHash];
  [(PKProtobufShareableCredential *)v3 setOwnerDisplayName:self->_ownerDisplayName];
  [(PKProtobufShareableCredential *)v3 setSharingInstanceIdentifier:self->_sharingInstanceIdentifier];
  [(PKProtobufShareableCredential *)v3 setNonce:self->_nonce];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKShareableCredential)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKShareableCredential;
  v5 = [(PKShareableCredential *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encryptedPushProvisioningTargetKey"];
    encryptedPushProvisioningTarget = v5->_encryptedPushProvisioningTarget;
    v5->_encryptedPushProvisioningTarget = (PKEncryptedPushProvisioningTarget *)v6;

    v5->_status = [v4 decodeIntegerForKey:@"statusKey"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cardConfigurationIdentifierKey"];
    cardConfigurationIdentifier = v5->_cardConfigurationIdentifier;
    v5->_cardConfigurationIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifierKey"];
    credentialIdentifier = v5->_credentialIdentifier;
    v5->_credentialIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifierHashKey"];
    credentialIdentifierHash = v5->_credentialIdentifierHash;
    v5->_credentialIdentifierHash = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ownerDisplayNameKey"];
    ownerDisplayName = v5->_ownerDisplayName;
    v5->_ownerDisplayName = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharingInstanceIdentifierKey"];
    sharingInstanceIdentifier = v5->_sharingInstanceIdentifier;
    v5->_sharingInstanceIdentifier = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nonceKey"];
    nonce = v5->_nonce;
    v5->_nonce = (NSString *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t status = self->_status;
  id v5 = a3;
  [v5 encodeInteger:status forKey:@"statusKey"];
  [v5 encodeObject:self->_encryptedPushProvisioningTarget forKey:@"encryptedPushProvisioningTargetKey"];
  [v5 encodeObject:self->_cardConfigurationIdentifier forKey:@"cardConfigurationIdentifierKey"];
  [v5 encodeObject:self->_credentialIdentifier forKey:@"identifierKey"];
  [v5 encodeObject:self->_credentialIdentifierHash forKey:@"identifierHashKey"];
  [v5 encodeObject:self->_ownerDisplayName forKey:@"ownerDisplayNameKey"];
  [v5 encodeObject:self->_sharingInstanceIdentifier forKey:@"sharingInstanceIdentifierKey"];
  [v5 encodeObject:self->_nonce forKey:@"nonceKey"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKShareableCredential *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKShareableCredential *)self isEqualToShareableCredential:v5];

  return v6;
}

- (BOOL)isEqualToShareableCredential:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    BOOL v6 = (void *)v4[4];
    v7 = self->_credentialIdentifier;
    uint64_t v8 = v6;
    if (v7 == v8)
    {
    }
    else
    {
      v9 = v8;
      LOBYTE(v10) = 0;
      if (!v7 || !v8) {
        goto LABEL_30;
      }
      BOOL v10 = [(NSString *)v7 isEqualToString:v8];

      if (!v10) {
        goto LABEL_31;
      }
    }
    v11 = (void *)v5[5];
    v7 = self->_credentialIdentifierHash;
    uint64_t v12 = v11;
    if (v7 == v12)
    {
    }
    else
    {
      v9 = v12;
      LOBYTE(v10) = 0;
      if (!v7 || !v12) {
        goto LABEL_30;
      }
      BOOL v10 = [(NSString *)v7 isEqualToString:v12];

      if (!v10) {
        goto LABEL_31;
      }
    }
    encryptedPushProvisioningTarget = self->_encryptedPushProvisioningTarget;
    uint64_t v14 = (PKEncryptedPushProvisioningTarget *)v5[1];
    if (encryptedPushProvisioningTarget && v14)
    {
      if (-[PKEncryptedPushProvisioningTarget isEqual:](encryptedPushProvisioningTarget, "isEqual:"))
      {
LABEL_17:
        v15 = (void *)v5[6];
        v7 = self->_sharingInstanceIdentifier;
        uint64_t v16 = v15;
        if (v7 == v16)
        {

LABEL_25:
          cardConfigurationIdentifier = self->_cardConfigurationIdentifier;
          uint64_t v18 = (void *)v5[7];
          v7 = cardConfigurationIdentifier;
          v19 = v18;
          if (v7 == v19)
          {
            LOBYTE(v10) = 1;
            v9 = v7;
          }
          else
          {
            v9 = v19;
            LOBYTE(v10) = 0;
            if (v7 && v19) {
              LOBYTE(v10) = [(NSString *)v7 isEqualToString:v19];
            }
          }
          goto LABEL_30;
        }
        v9 = v16;
        LOBYTE(v10) = 0;
        if (v7 && v16)
        {
          BOOL v10 = [(NSString *)v7 isEqualToString:v16];

          if (!v10) {
            goto LABEL_31;
          }
          goto LABEL_25;
        }
LABEL_30:

        goto LABEL_31;
      }
    }
    else if (encryptedPushProvisioningTarget == v14)
    {
      goto LABEL_17;
    }
  }
  LOBYTE(v10) = 0;
LABEL_31:

  return v10;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_credentialIdentifier];
  [v3 safelyAddObject:self->_credentialIdentifierHash];
  [v3 safelyAddObject:self->_encryptedPushProvisioningTarget];
  [v3 safelyAddObject:self->_sharingInstanceIdentifier];
  [v3 safelyAddObject:self->_cardConfigurationIdentifier];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  unint64_t v4 = PKPushProvisioningSharingStatusToString(self->_status);
  [v3 appendFormat:@"status: '%@'; ", v4];

  [v3 appendFormat:@"credential identifier hash: '%@'; ", self->_credentialIdentifierHash];
  [v3 appendFormat:@"sharing instance identifier: '%@'; ", self->_sharingInstanceIdentifier];
  [v3 appendFormat:@"display name: '%@'; ", self->_ownerDisplayName];
  [v3 appendFormat:@"encrypted target: '%@'; ", self->_encryptedPushProvisioningTarget];
  [v3 appendFormat:@">"];
  id v5 = (void *)[v3 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(PKEncryptedPushProvisioningTarget *)self->_encryptedPushProvisioningTarget copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  v5[2] = self->_status;
  uint64_t v8 = [(NSString *)self->_credentialIdentifier copyWithZone:a3];
  v9 = (void *)v5[4];
  v5[4] = v8;

  uint64_t v10 = [(NSString *)self->_credentialIdentifierHash copyWithZone:a3];
  v11 = (void *)v5[5];
  v5[5] = v10;

  uint64_t v12 = [(NSString *)self->_sharingInstanceIdentifier copyWithZone:a3];
  v13 = (void *)v5[6];
  v5[6] = v12;

  uint64_t v14 = [(NSString *)self->_cardConfigurationIdentifier copyWithZone:a3];
  v15 = (void *)v5[7];
  v5[7] = v14;

  uint64_t v16 = [(NSString *)self->_ownerDisplayName copyWithZone:a3];
  v17 = (void *)v5[3];
  v5[3] = v16;

  uint64_t v18 = [(NSString *)self->_nonce copyWithZone:a3];
  v19 = (void *)v5[8];
  v5[8] = v18;

  return v5;
}

- (PKEncryptedPushProvisioningTarget)encryptedPushProvisioningTarget
{
  return self->_encryptedPushProvisioningTarget;
}

- (void)setEncryptedPushProvisioningTarget:(id)a3
{
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_unint64_t status = a3;
}

- (NSString)ownerDisplayName
{
  return self->_ownerDisplayName;
}

- (void)setOwnerDisplayName:(id)a3
{
}

- (NSString)credentialIdentifier
{
  return self->_credentialIdentifier;
}

- (void)setCredentialIdentifier:(id)a3
{
}

- (NSString)credentialIdentifierHash
{
  return self->_credentialIdentifierHash;
}

- (void)setCredentialIdentifierHash:(id)a3
{
}

- (NSString)sharingInstanceIdentifier
{
  return self->_sharingInstanceIdentifier;
}

- (void)setSharingInstanceIdentifier:(id)a3
{
}

- (NSString)cardConfigurationIdentifier
{
  return self->_cardConfigurationIdentifier;
}

- (void)setCardConfigurationIdentifier:(id)a3
{
}

- (NSString)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_cardConfigurationIdentifier, 0);
  objc_storeStrong((id *)&self->_sharingInstanceIdentifier, 0);
  objc_storeStrong((id *)&self->_credentialIdentifierHash, 0);
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
  objc_storeStrong((id *)&self->_ownerDisplayName, 0);
  objc_storeStrong((id *)&self->_encryptedPushProvisioningTarget, 0);
}

@end