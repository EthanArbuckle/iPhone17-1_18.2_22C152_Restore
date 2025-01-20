@interface PKPaymentPushProvisioningCredential
+ (BOOL)supportsSecureCoding;
- (NSString)accountIdentifier;
- (NSString)credentialAuthorityIdentifier;
- (NSString)provisioningCredentialIdentifierHash;
- (NSString)sharingInstanceIdentifier;
- (PKPaymentPushProvisioningCredential)initWithCoder:(id)a3;
- (PKPaymentPushProvisioningCredential)initWithDict:(id)a3;
- (int64_t)source;
- (unint64_t)feature;
- (unint64_t)securityOptions;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setCredentialAuthorityIdentifier:(id)a3;
- (void)setSecurityOptions:(unint64_t)a3;
- (void)setSharingInstanceIdentifier:(id)a3;
- (void)setSource:(int64_t)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKPaymentPushProvisioningCredential

- (PKPaymentPushProvisioningCredential)initWithDict:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v28.receiver = self;
    v28.super_class = (Class)PKPaymentPushProvisioningCredential;
    v5 = [(PKPaymentPushProvisioningCredential *)&v28 init];
    if (!v5)
    {
LABEL_15:
      self = v5;
      v20 = self;
      goto LABEL_16;
    }
    v6 = [v4 PKStringForKey:@"type"];
    v7 = v6;
    if (v6 == @"sharedCredential") {
      goto LABEL_6;
    }
    if (!v6) {
      goto LABEL_8;
    }
    char v8 = [(__CFString *)v6 isEqualToString:@"sharedCredential"];

    if (v8)
    {
LABEL_6:
      uint64_t v9 = 1;
    }
    else
    {
      v25 = v7;
      if (v25 != @"appleFeature")
      {
        v26 = v25;
        int v27 = [(__CFString *)v25 isEqualToString:@"appleFeature"];

        if (!v27)
        {
LABEL_8:
          v5->_securityOptions = [v4 PKIntegerForKey:@"securityOptions"];
          uint64_t v10 = [v4 PKStringForKey:@"sharingInstanceIdentifier"];
          sharingInstanceIdentifier = v5->_sharingInstanceIdentifier;
          v5->_sharingInstanceIdentifier = (NSString *)v10;

          uint64_t v12 = [v4 PKStringForKey:@"provisioningCredentialIdentifierHash"];
          provisioningCredentialIdentifierHash = v5->_provisioningCredentialIdentifierHash;
          v5->_provisioningCredentialIdentifierHash = (NSString *)v12;

          uint64_t v14 = [v4 PKStringForKey:@"credentialAuthorityIdentifier"];
          credentialAuthorityIdentifier = v5->_credentialAuthorityIdentifier;
          v5->_credentialAuthorityIdentifier = (NSString *)v14;

          v16 = [v4 PKNumberForKey:@"source"];
          v17 = v16;
          if (v16)
          {
            uint64_t v18 = [v16 integerValue];
            v5->_source = v18;
            p_source = &v5->_source;
            if ((unint64_t)(v18 - 1) < 0xB) {
              goto LABEL_14;
            }
          }
          else
          {
            p_source = &v5->_source;
          }
          int64_t *p_source = 1;
LABEL_14:
          uint64_t v21 = [v4 PKStringForKey:@"accountIdentifier"];
          accountIdentifier = v5->_accountIdentifier;
          v5->_accountIdentifier = (NSString *)v21;

          v23 = [v4 PKStringForKey:@"featureIdentifier"];
          v5->_feature = PKFeatureIdentifierFromString(v23);

          goto LABEL_15;
        }
      }
      uint64_t v9 = 2;
    }
    v5->_type = v9;
    goto LABEL_8;
  }
  v20 = 0;
LABEL_16:

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  sharingInstanceIdentifier = self->_sharingInstanceIdentifier;
  id v5 = a3;
  [v5 encodeObject:sharingInstanceIdentifier forKey:@"sharingInstanceIdentifier"];
  [v5 encodeObject:self->_provisioningCredentialIdentifierHash forKey:@"provisioningCredentialIdentifierHash"];
  [v5 encodeInteger:self->_source forKey:@"source"];
}

- (PKPaymentPushProvisioningCredential)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentPushProvisioningCredential;
  id v5 = [(PKPaymentPushProvisioningCredential *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharingInstanceIdentifier"];
    sharingInstanceIdentifier = v5->_sharingInstanceIdentifier;
    v5->_sharingInstanceIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"provisioningCredentialIdentifierHash"];
    provisioningCredentialIdentifierHash = v5->_provisioningCredentialIdentifierHash;
    v5->_provisioningCredentialIdentifierHash = (NSString *)v8;

    v5->_source = [v4 decodeIntegerForKey:@"source"];
  }

  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)securityOptions
{
  return self->_securityOptions;
}

- (void)setSecurityOptions:(unint64_t)a3
{
  self->_securityOptions = a3;
}

- (NSString)sharingInstanceIdentifier
{
  return self->_sharingInstanceIdentifier;
}

- (void)setSharingInstanceIdentifier:(id)a3
{
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (NSString)provisioningCredentialIdentifierHash
{
  return self->_provisioningCredentialIdentifierHash;
}

- (NSString)credentialAuthorityIdentifier
{
  return self->_credentialAuthorityIdentifier;
}

- (void)setCredentialAuthorityIdentifier:(id)a3
{
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (unint64_t)feature
{
  return self->_feature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_credentialAuthorityIdentifier, 0);
  objc_storeStrong((id *)&self->_provisioningCredentialIdentifierHash, 0);
  objc_storeStrong((id *)&self->_sharingInstanceIdentifier, 0);
}

@end