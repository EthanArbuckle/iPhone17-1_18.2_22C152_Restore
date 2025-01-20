@interface PKPaymentShareableCredential
+ (BOOL)supportsSecureCoding;
- (BOOL)_isEqualToCredential:(id)a3;
- (BOOL)isBackgroundProvisioning;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsSuperEasyProvisioning;
- (NSData)externalizedAuth;
- (NSData)passThumbnailImageData;
- (NSString)sharingInstanceIdentifier;
- (PKEncryptedPushProvisioningTarget)encryptedProvisioningTarget;
- (PKPaymentShareableCredential)initWithCoder:(id)a3;
- (PKPaymentShareableCredential)initWithEncryptedProvisioningTarget:(id)a3 provisioningSharingIdentifier:(id)a4 passThumbnailImageData:(id)a5;
- (PKPaymentShareableCredential)initWithEncryptedProvisioningTarget:(id)a3 provisioningSharingIdentifier:(id)a4 passThumbnailImageData:(id)a5 isBackgroundProvisioning:(BOOL)a6;
- (PKPaymentShareableCredential)initWithProvisioningSharingIdentifier:(id)a3 isBackgroundProvisioning:(BOOL)a4;
- (id)description;
- (int64_t)source;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setExternalizedAuth:(id)a3;
- (void)setSource:(int64_t)a3;
@end

@implementation PKPaymentShareableCredential

- (PKPaymentShareableCredential)initWithEncryptedProvisioningTarget:(id)a3 provisioningSharingIdentifier:(id)a4 passThumbnailImageData:(id)a5
{
  return [(PKPaymentShareableCredential *)self initWithEncryptedProvisioningTarget:a3 provisioningSharingIdentifier:a4 passThumbnailImageData:a5 isBackgroundProvisioning:0];
}

- (PKPaymentShareableCredential)initWithProvisioningSharingIdentifier:(id)a3 isBackgroundProvisioning:(BOOL)a4
{
  return [(PKPaymentShareableCredential *)self initWithEncryptedProvisioningTarget:0 provisioningSharingIdentifier:a3 passThumbnailImageData:0 isBackgroundProvisioning:a4];
}

- (PKPaymentShareableCredential)initWithEncryptedProvisioningTarget:(id)a3 provisioningSharingIdentifier:(id)a4 passThumbnailImageData:(id)a5 isBackgroundProvisioning:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentShareableCredential;
  v14 = [(PKPaymentCredential *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_sharingInstanceIdentifier, a4);
    objc_storeStrong((id *)&v15->_encryptedProvisioningTarget, a3);
    objc_storeStrong((id *)&v15->_passThumbnailImageData, a5);
    v15->_backgroundProvisioning = a6;
    [(PKPaymentCredential *)v15 setCardType:3];
  }

  return v15;
}

- (PKPaymentShareableCredential)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentShareableCredential;
  v5 = [(PKPaymentCredential *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharingInstanceIdentifier"];
    sharingInstanceIdentifier = v5->_sharingInstanceIdentifier;
    v5->_sharingInstanceIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encryptedProvisioningTarget"];
    encryptedProvisioningTarget = v5->_encryptedProvisioningTarget;
    v5->_encryptedProvisioningTarget = (PKEncryptedPushProvisioningTarget *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passThumbnailImageData"];
    passThumbnailImageData = v5->_passThumbnailImageData;
    v5->_passThumbnailImageData = (NSData *)v10;

    v5->_backgroundProvisioning = [v4 decodeBoolForKey:@"backgroundProvisioning"];
    v5->_source = [v4 decodeIntegerForKey:@"source"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalizedAuth"];
    externalizedAuth = v5->_externalizedAuth;
    v5->_externalizedAuth = (NSData *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentShareableCredential;
  id v4 = a3;
  [(PKPaymentCredential *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_sharingInstanceIdentifier, @"sharingInstanceIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_encryptedProvisioningTarget forKey:@"encryptedProvisioningTarget"];
  [v4 encodeObject:self->_passThumbnailImageData forKey:@"passThumbnailImageData"];
  [v4 encodeBool:self->_backgroundProvisioning forKey:@"backgroundProvisioning"];
  [v4 encodeInteger:self->_source forKey:@"source"];
  [v4 encodeObject:self->_externalizedAuth forKey:@"externalizedAuth"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"encryptedProvisioningTarget: '%@'; ", self->_encryptedProvisioningTarget];
  [v3 appendFormat:@"sharingInstanceIdentifier: '%@'; ", self->_sharingInstanceIdentifier];
  if (self->_backgroundProvisioning) {
    id v4 = @"Yes";
  }
  else {
    id v4 = @"No";
  }
  [v3 appendFormat:@"backgroundProvisioning: '%@'; ", v4];
  objc_msgSend(v3, "appendFormat:", @"source: '%lu'; ", self->_source);
  if (self->_externalizedAuth) {
    objc_super v5 = @"Yes";
  }
  else {
    objc_super v5 = @"No";
  }
  [v3 appendFormat:@"hasExternalizedAuth: '%@'; ", v5];
  [v3 appendString:@">"];
  uint64_t v6 = (void *)[v3 copy];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_encryptedProvisioningTarget];
  [v3 safelyAddObject:self->_sharingInstanceIdentifier];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_source - v4 + 32 * v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PKPaymentShareableCredential *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PKPaymentShareableCredential *)self _isEqualToCredential:v4];
  }

  return v5;
}

- (BOOL)_isEqualToCredential:(id)a3
{
  uint64_t v4 = a3;
  if (!v4) {
    goto LABEL_16;
  }
  encryptedProvisioningTarget = self->_encryptedProvisioningTarget;
  uint64_t v6 = (PKEncryptedPushProvisioningTarget *)v4[14];
  if (encryptedProvisioningTarget) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (encryptedProvisioningTarget != v6) {
      goto LABEL_16;
    }
  }
  else if (!-[PKEncryptedPushProvisioningTarget isEqual:](encryptedProvisioningTarget, "isEqual:"))
  {
    goto LABEL_16;
  }
  sharingInstanceIdentifier = self->_sharingInstanceIdentifier;
  v9 = (NSString *)v4[15];
  if (sharingInstanceIdentifier) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (sharingInstanceIdentifier == v9)
    {
LABEL_19:
      BOOL v11 = self->_source == v4[17];
      goto LABEL_17;
    }
  }
  else if (-[NSString isEqual:](sharingInstanceIdentifier, "isEqual:"))
  {
    goto LABEL_19;
  }
LABEL_16:
  BOOL v11 = 0;
LABEL_17:

  return v11;
}

- (BOOL)supportsSuperEasyProvisioning
{
  return 1;
}

- (PKEncryptedPushProvisioningTarget)encryptedProvisioningTarget
{
  return self->_encryptedProvisioningTarget;
}

- (NSString)sharingInstanceIdentifier
{
  return self->_sharingInstanceIdentifier;
}

- (NSData)passThumbnailImageData
{
  return self->_passThumbnailImageData;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (BOOL)isBackgroundProvisioning
{
  return self->_backgroundProvisioning;
}

- (NSData)externalizedAuth
{
  return self->_externalizedAuth;
}

- (void)setExternalizedAuth:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalizedAuth, 0);
  objc_storeStrong((id *)&self->_passThumbnailImageData, 0);
  objc_storeStrong((id *)&self->_sharingInstanceIdentifier, 0);
  objc_storeStrong((id *)&self->_encryptedProvisioningTarget, 0);
}

@end