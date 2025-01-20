@interface PKPushProvisioningSharingMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)allowProvisioningOnLockedDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEncryptedProvisioningTarget:(id)a3;
- (NSDate)createdAt;
- (NSString)credentialAuthorityIdentifier;
- (NSString)provisioningCredentialHash;
- (NSString)sharingInstanceIdentifier;
- (PKPushProvisioningSharingMetadata)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)source;
- (unint64_t)hash;
- (unint64_t)securityOptions;
- (unint64_t)sharingStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setCreatedAt:(id)a3;
- (void)setCredentialAuthorityIdentifier:(id)a3;
- (void)setProvisioningCredentialHash:(id)a3;
- (void)setSecurityOptions:(unint64_t)a3;
- (void)setSharingInstanceIdentifier:(id)a3;
- (void)setSharingStatus:(unint64_t)a3;
- (void)setSource:(int64_t)a3;
@end

@implementation PKPushProvisioningSharingMetadata

- (BOOL)allowProvisioningOnLockedDevice
{
  return self->_securityOptions & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPushProvisioningSharingMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPushProvisioningSharingMetadata;
  v5 = [(PKPushProvisioningSharingMetadata *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharingInstanceIdentifierKey"];
    sharingInstanceIdentifier = v5->_sharingInstanceIdentifier;
    v5->_sharingInstanceIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credentialHash"];
    provisioningCredentialHash = v5->_provisioningCredentialHash;
    v5->_provisioningCredentialHash = (NSString *)v8;

    v5->_sharingStatus = [v4 decodeIntegerForKey:@"status"];
    v5->_source = [v4 decodeIntegerForKey:@"source"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credentialAuthorityIdentifier"];
    credentialAuthorityIdentifier = v5->_credentialAuthorityIdentifier;
    v5->_credentialAuthorityIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"createdAt"];
    createdAt = v5->_createdAt;
    v5->_createdAt = (NSDate *)v12;

    v5->_securityOptions = [v4 decodeIntegerForKey:@"securityOptions"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  sharingInstanceIdentifier = self->_sharingInstanceIdentifier;
  id v5 = a3;
  [v5 encodeObject:sharingInstanceIdentifier forKey:@"sharingInstanceIdentifierKey"];
  [v5 encodeObject:self->_provisioningCredentialHash forKey:@"credentialHash"];
  [v5 encodeInteger:self->_sharingStatus forKey:@"status"];
  [v5 encodeInteger:self->_source forKey:@"source"];
  [v5 encodeObject:self->_credentialAuthorityIdentifier forKey:@"credentialAuthorityIdentifier"];
  [v5 encodeObject:self->_createdAt forKey:@"createdAt"];
  [v5 encodeInteger:self->_securityOptions forKey:@"securityOptions"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPushProvisioningSharingMetadata *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPushProvisioningSharingMetadata *)self isEqualToEncryptedProvisioningTarget:v5];

  return v6;
}

- (BOOL)isEqualToEncryptedProvisioningTarget:(id)a3
{
  if (!a3) {
    return 0;
  }
  sharingInstanceIdentifier = self->_sharingInstanceIdentifier;
  id v4 = (NSString *)*((void *)a3 + 1);
  if (sharingInstanceIdentifier) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    return sharingInstanceIdentifier == v4;
  }
  else {
    return -[NSString isEqual:](sharingInstanceIdentifier, "isEqual:");
  }
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_sharingInstanceIdentifier];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"sharingIdentifier: '%@'; ", self->_sharingInstanceIdentifier];
  [v3 appendFormat:@"provisioningCredentialHash: '%@'; ", self->_provisioningCredentialHash];
  objc_msgSend(v3, "appendFormat:", @"sharingStatus: '%lu'; ", self->_sharingStatus);
  objc_msgSend(v3, "appendFormat:", @"source: '%lu'; ", self->_source);
  [v3 appendFormat:@"credentialAuthority: '%@'; ", self->_credentialAuthorityIdentifier];
  [v3 appendFormat:@"createdAt: '%@'; ", self->_createdAt];
  objc_msgSend(v3, "appendFormat:", @"securityOptions: '%lu'; ", self->_securityOptions);
  [v3 appendFormat:@">"];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_sharingInstanceIdentifier copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_provisioningCredentialHash copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  v5[3] = self->_sharingStatus;
  v5[4] = self->_source;
  uint64_t v10 = [(NSString *)self->_credentialAuthorityIdentifier copyWithZone:a3];
  v11 = (void *)v5[5];
  v5[5] = v10;

  uint64_t v12 = [(NSDate *)self->_createdAt copy];
  v13 = (void *)v5[7];
  v5[7] = v12;

  v5[6] = self->_securityOptions;
  return v5;
}

- (NSString)sharingInstanceIdentifier
{
  return self->_sharingInstanceIdentifier;
}

- (void)setSharingInstanceIdentifier:(id)a3
{
}

- (NSString)provisioningCredentialHash
{
  return self->_provisioningCredentialHash;
}

- (void)setProvisioningCredentialHash:(id)a3
{
}

- (unint64_t)sharingStatus
{
  return self->_sharingStatus;
}

- (void)setSharingStatus:(unint64_t)a3
{
  self->_sharingStatus = a3;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (NSString)credentialAuthorityIdentifier
{
  return self->_credentialAuthorityIdentifier;
}

- (void)setCredentialAuthorityIdentifier:(id)a3
{
}

- (unint64_t)securityOptions
{
  return self->_securityOptions;
}

- (void)setSecurityOptions:(unint64_t)a3
{
  self->_securityOptions = a3;
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (void)setCreatedAt:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_credentialAuthorityIdentifier, 0);
  objc_storeStrong((id *)&self->_provisioningCredentialHash, 0);
  objc_storeStrong((id *)&self->_sharingInstanceIdentifier, 0);
}

@end