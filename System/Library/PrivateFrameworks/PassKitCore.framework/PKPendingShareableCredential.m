@interface PKPendingShareableCredential
+ (BOOL)supportsSecureCoding;
- (BOOL)representsPass:(id)a3;
- (NSString)credentialAuthorityIdentifier;
- (NSString)passSerialNumber;
- (NSString)passTypeIdentifier;
- (NSString)provisioningCredentialHash;
- (NSString)sharingInstanceIdentifier;
- (PKPendingShareableCredential)init;
- (PKPendingShareableCredential)initWithCoder:(id)a3;
- (PKPendingShareableCredential)initWithShareableCredential:(id)a3;
- (PKPendingShareableCredential)initWithSharedCredential:(id)a3;
- (id)credential;
- (id)initForDatabase;
- (id)type;
- (int64_t)source;
- (unint64_t)securityOptions;
- (void)_copyIntoPendingProvision:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCredentialAuthorityIdentifier:(id)a3;
- (void)setPassSerialNumber:(id)a3;
- (void)setPassTypeIdentifier:(id)a3;
- (void)setProvisioningCredentialHash:(id)a3;
- (void)setSecurityOptions:(unint64_t)a3;
- (void)setSharingInstanceIdentifier:(id)a3;
- (void)setSource:(int64_t)a3;
@end

@implementation PKPendingShareableCredential

- (PKPendingShareableCredential)init
{
  return 0;
}

- (id)initForDatabase
{
  v3.receiver = self;
  v3.super_class = (Class)PKPendingShareableCredential;
  return [(PKPendingShareableCredential *)&v3 init];
}

- (PKPendingShareableCredential)initWithShareableCredential:(id)a3
{
  id v4 = a3;
  v5 = [v4 sharingInstanceIdentifier];
  v11.receiver = self;
  v11.super_class = (Class)PKPendingShareableCredential;
  v6 = [(PKPendingProvisioning *)&v11 initWithUniqueIdentifier:v5 status:1];

  if (v6)
  {
    uint64_t v7 = [v4 sharingInstanceIdentifier];
    sharingInstanceIdentifier = v6->_sharingInstanceIdentifier;
    v6->_sharingInstanceIdentifier = (NSString *)v7;

    v6->_source = [v4 source];
    v9 = [v4 state];
    [(PKPendingProvisioning *)v6 setProvisioningState:v9];
  }
  return v6;
}

- (PKPendingShareableCredential)initWithSharedCredential:(id)a3
{
  id v4 = a3;
  v5 = [v4 sharingInstanceIdentifier];
  v15.receiver = self;
  v15.super_class = (Class)PKPendingShareableCredential;
  v6 = [(PKPendingProvisioning *)&v15 initWithUniqueIdentifier:v5 status:1];

  if (v6)
  {
    uint64_t v7 = [v4 sharingInstanceIdentifier];
    sharingInstanceIdentifier = v6->_sharingInstanceIdentifier;
    v6->_sharingInstanceIdentifier = (NSString *)v7;

    uint64_t v9 = [v4 provisioningCredentialIdentifierHash];
    provisioningCredentialHash = v6->_provisioningCredentialHash;
    v6->_provisioningCredentialHash = (NSString *)v9;

    v6->_source = [v4 source];
    uint64_t v11 = [v4 credentialAuthorityIdentifier];
    credentialAuthorityIdentifier = v6->_credentialAuthorityIdentifier;
    v6->_credentialAuthorityIdentifier = (NSString *)v11;

    v6->_securityOptions = [v4 securityOptions];
    v13 = objc_alloc_init(PKSecureElementProvisioningState);
    [(PKPendingProvisioning *)v6 setProvisioningState:v13];
  }
  return v6;
}

- (id)type
{
  return @"PaymentShareableCredential";
}

- (id)credential
{
  objc_super v3 = [[PKPaymentShareableCredential alloc] initWithProvisioningSharingIdentifier:self->_sharingInstanceIdentifier isBackgroundProvisioning:1];
  [(PKPaymentShareableCredential *)v3 setSource:self->_source];
  id v4 = [(PKPendingProvisioning *)self provisioningState];

  if (v4)
  {
    v5 = [(PKPendingProvisioning *)self provisioningState];
    [(PKPaymentCredential *)v3 setState:v5];
  }
  return v3;
}

- (BOOL)representsPass:(id)a3
{
  id v4 = [a3 provisioningCredentialHash];
  provisioningCredentialHash = self->_provisioningCredentialHash;
  v6 = v4;
  uint64_t v7 = provisioningCredentialHash;
  v8 = v7;
  if (v6 == v7)
  {
    char v9 = 1;
  }
  else
  {
    char v9 = 0;
    if (v6 && v7) {
      char v9 = [(NSString *)v6 isEqualToString:v7];
    }
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPendingShareableCredential)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKPendingShareableCredential;
  v5 = [(PKPendingProvisioning *)&v18 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharingInstanceIdentifier"];
    sharingInstanceIdentifier = v5->_sharingInstanceIdentifier;
    v5->_sharingInstanceIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"provisioningCredentialHash"];
    provisioningCredentialHash = v5->_provisioningCredentialHash;
    v5->_provisioningCredentialHash = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credentialAuthorityIdentifier"];
    credentialAuthorityIdentifier = v5->_credentialAuthorityIdentifier;
    v5->_credentialAuthorityIdentifier = (NSString *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"securityOptions"];
    v5->_securityOptions = PKPushProvisioningSecurityOptionsFromString(v12);

    v5->_source = [v4 decodeIntegerForKey:@"source"];
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passSerialNumber"];
    passSerialNumber = v5->_passSerialNumber;
    v5->_passSerialNumber = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passTypeIdentifier"];
    passTypeIdentifier = v5->_passTypeIdentifier;
    v5->_passTypeIdentifier = (NSString *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPendingShareableCredential;
  id v4 = a3;
  [(PKPendingProvisioning *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_sharingInstanceIdentifier, @"sharingInstanceIdentifier", v6.receiver, v6.super_class);
  [v4 encodeObject:self->_provisioningCredentialHash forKey:@"provisioningCredentialHash"];
  [v4 encodeObject:self->_credentialAuthorityIdentifier forKey:@"credentialAuthorityIdentifier"];
  v5 = PKPushProvisioningSecurityOptionsToString(self->_securityOptions);
  [v4 encodeObject:v5 forKey:@"securityOptions"];

  [v4 encodeInteger:self->_source forKey:@"source"];
  [v4 encodeObject:self->_passSerialNumber forKey:@"passSerialNumber"];
  [v4 encodeObject:self->_passTypeIdentifier forKey:@"passTypeIdentifier"];
}

- (void)_copyIntoPendingProvision:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)PKPendingShareableCredential;
  id v4 = a3;
  [(PKPendingProvisioning *)&v15 _copyIntoPendingProvision:v4];
  uint64_t v5 = [(NSString *)self->_sharingInstanceIdentifier copy];
  objc_super v6 = (void *)v4[7];
  v4[7] = v5;

  uint64_t v7 = [(NSString *)self->_provisioningCredentialHash copy];
  uint64_t v8 = (void *)v4[8];
  v4[8] = v7;

  uint64_t v9 = [(NSString *)self->_credentialAuthorityIdentifier copy];
  uint64_t v10 = (void *)v4[10];
  v4[10] = v9;

  v4[11] = self->_securityOptions;
  v4[9] = self->_source;
  uint64_t v11 = [(NSString *)self->_passSerialNumber copy];
  v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(NSString *)self->_passTypeIdentifier copy];
  v14 = (void *)v4[13];
  v4[13] = v13;
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

- (NSString)passSerialNumber
{
  return self->_passSerialNumber;
}

- (void)setPassSerialNumber:(id)a3
{
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_passSerialNumber, 0);
  objc_storeStrong((id *)&self->_credentialAuthorityIdentifier, 0);
  objc_storeStrong((id *)&self->_provisioningCredentialHash, 0);
  objc_storeStrong((id *)&self->_sharingInstanceIdentifier, 0);
}

@end