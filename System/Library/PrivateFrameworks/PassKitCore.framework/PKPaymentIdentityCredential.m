@interface PKPaymentIdentityCredential
+ (BOOL)supportsSecureCoding;
- (BOOL)hasExistingPassInformation;
- (NSString)accountKeyIdentifier;
- (NSString)isoCredentialIdentifier;
- (NSString)passSerialNumber;
- (NSString)passTypeIdentifier;
- (PKIdentityProvisioningAttestations)attestations;
- (PKPaymentIdentityCredential)initWithCoder:(id)a3;
- (PKPaymentIdentityCredential)initWithShareablePassMetadata:(id)a3 isoCredentialIdentifier:(id)a4;
- (PKShareablePassMetadata)shareableMetadata;
- (id)paymentApplications;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountKeyIdentifier:(id)a3;
- (void)setAttestations:(id)a3;
- (void)setPassSerialNumber:(id)a3;
- (void)setPassTypeIdentifier:(id)a3;
@end

@implementation PKPaymentIdentityCredential

- (PKPaymentIdentityCredential)initWithShareablePassMetadata:(id)a3 isoCredentialIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentIdentityCredential;
  v9 = [(PKPaymentCredential *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_shareableMetadata, a3);
    objc_storeStrong((id *)&v10->_isoCredentialIdentifier, a4);
    [(PKPaymentCredential *)v10 setCardType:4];
  }

  return v10;
}

- (id)paymentApplications
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = +[PKProvisioningSEStorageSnapshot appletTypePurpleTrustAirAccess];
  v3 = [[PKProvisioningPaymentApplication alloc] initWithAppletTypeIdentifier:v2 paymentType:1002];
  v6[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

- (BOOL)hasExistingPassInformation
{
  return self->_passTypeIdentifier && self->_passSerialNumber != 0;
}

- (PKPaymentIdentityCredential)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKPaymentIdentityCredential;
  v5 = [(PKPaymentCredential *)&v19 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shareableMetadata"];
    shareableMetadata = v5->_shareableMetadata;
    v5->_shareableMetadata = (PKShareablePassMetadata *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isoCredentialIdentifier"];
    isoCredentialIdentifier = v5->_isoCredentialIdentifier;
    v5->_isoCredentialIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passTypeIdentifier"];
    passTypeIdentifier = v5->_passTypeIdentifier;
    v5->_passTypeIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passSerialNumber"];
    passSerialNumber = v5->_passSerialNumber;
    v5->_passSerialNumber = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountKeyIdentifier"];
    accountKeyIdentifier = v5->_accountKeyIdentifier;
    v5->_accountKeyIdentifier = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attestations"];
    attestations = v5->_attestations;
    v5->_attestations = (PKIdentityProvisioningAttestations *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentIdentityCredential;
  id v4 = a3;
  [(PKPaymentCredential *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_shareableMetadata, @"shareableMetadata", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_passTypeIdentifier forKey:@"passTypeIdentifier"];
  [v4 encodeObject:self->_isoCredentialIdentifier forKey:@"isoCredentialIdentifier"];
  [v4 encodeObject:self->_passSerialNumber forKey:@"passSerialNumber"];
  [v4 encodeObject:self->_accountKeyIdentifier forKey:@"accountKeyIdentifier"];
  [v4 encodeObject:self->_attestations forKey:@"attestations"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)isoCredentialIdentifier
{
  return self->_isoCredentialIdentifier;
}

- (PKShareablePassMetadata)shareableMetadata
{
  return self->_shareableMetadata;
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
}

- (NSString)passSerialNumber
{
  return self->_passSerialNumber;
}

- (void)setPassSerialNumber:(id)a3
{
}

- (NSString)accountKeyIdentifier
{
  return self->_accountKeyIdentifier;
}

- (void)setAccountKeyIdentifier:(id)a3
{
}

- (PKIdentityProvisioningAttestations)attestations
{
  return self->_attestations;
}

- (void)setAttestations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attestations, 0);
  objc_storeStrong((id *)&self->_accountKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_passSerialNumber, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_shareableMetadata, 0);
  objc_storeStrong((id *)&self->_isoCredentialIdentifier, 0);
}

@end