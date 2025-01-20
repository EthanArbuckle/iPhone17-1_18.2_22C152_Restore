@interface PKPendingIdentityCredential
+ (BOOL)supportsSecureCoding;
- (BOOL)representsCredential:(id)a3;
- (BOOL)representsPass:(id)a3;
- (NSString)accountKeyIdentifier;
- (NSString)cardConfigurationIdentifier;
- (NSString)credentialIdentifier;
- (NSString)passSerialNumber;
- (NSString)passTypeIdentifier;
- (NSString)provisioningCredentialIdentifier;
- (NSString)sharingInstanceIdentifier;
- (PKIdentityProvisioningAttestations)attestations;
- (PKPendingIdentityCredential)init;
- (PKPendingIdentityCredential)initWithCoder:(id)a3;
- (PKPendingIdentityCredential)initWithIdentityCredential:(id)a3;
- (PKPendingIdentityCredential)initWithShareableMetadata:(id)a3;
- (id)credential;
- (id)initForDatabase;
- (id)type;
- (void)_copyIntoPendingProvision:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountKeyIdentifier:(id)a3;
- (void)setAttestations:(id)a3;
- (void)setCardConfigurationIdentifier:(id)a3;
- (void)setCredentialIdentifier:(id)a3;
- (void)setPassSerialNumber:(id)a3;
- (void)setPassTypeIdentifier:(id)a3;
- (void)setProvisioningCredentialIdentifier:(id)a3;
- (void)setSharingInstanceIdentifier:(id)a3;
@end

@implementation PKPendingIdentityCredential

- (PKPendingIdentityCredential)init
{
  return 0;
}

- (id)initForDatabase
{
  v3.receiver = self;
  v3.super_class = (Class)PKPendingIdentityCredential;
  return [(PKPendingIdentityCredential *)&v3 init];
}

- (PKPendingIdentityCredential)initWithIdentityCredential:(id)a3
{
  id v4 = a3;
  v5 = [v4 shareableMetadata];
  v6 = [(PKPendingIdentityCredential *)self initWithShareableMetadata:v5];
  if (v6)
  {
    uint64_t v7 = [v4 attestations];
    attestations = v6->_attestations;
    v6->_attestations = (PKIdentityProvisioningAttestations *)v7;

    uint64_t v9 = [v4 isoCredentialIdentifier];
    credentialIdentifier = v6->_credentialIdentifier;
    v6->_credentialIdentifier = (NSString *)v9;

    uint64_t v11 = [v4 passTypeIdentifier];
    passTypeIdentifier = v6->_passTypeIdentifier;
    v6->_passTypeIdentifier = (NSString *)v11;

    uint64_t v13 = [v4 passSerialNumber];
    passSerialNumber = v6->_passSerialNumber;
    v6->_passSerialNumber = (NSString *)v13;

    v15 = [v4 state];
    [(PKPendingProvisioning *)v6 setProvisioningState:v15];
  }
  return v6;
}

- (PKPendingIdentityCredential)initWithShareableMetadata:(id)a3
{
  id v4 = a3;
  v5 = [v4 sharingInstanceIdentifier];
  v13.receiver = self;
  v13.super_class = (Class)PKPendingIdentityCredential;
  v6 = [(PKPendingProvisioning *)&v13 initWithUniqueIdentifier:v5 status:1];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sharingInstanceIdentifier, v5);
    uint64_t v8 = [v4 cardConfigurationIdentifier];
    cardConfigurationIdentifier = v7->_cardConfigurationIdentifier;
    v7->_cardConfigurationIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 credentialIdentifier];
    provisioningCredentialIdentifier = v7->_provisioningCredentialIdentifier;
    v7->_provisioningCredentialIdentifier = (NSString *)v10;
  }
  return v7;
}

- (id)type
{
  return @"IdentityCredential";
}

- (id)credential
{
  objc_super v3 = [[PKShareablePassMetadata alloc] initWithProvisioningCredentialIdentifier:self->_provisioningCredentialIdentifier cardConfigurationIdentifier:self->_cardConfigurationIdentifier sharingInstanceIdentifier:self->_sharingInstanceIdentifier];
  id v4 = [[PKPaymentIdentityCredential alloc] initWithShareablePassMetadata:v3 isoCredentialIdentifier:self->_credentialIdentifier];
  [(PKPaymentIdentityCredential *)v4 setAttestations:self->_attestations];
  [(PKPaymentIdentityCredential *)v4 setPassTypeIdentifier:self->_passTypeIdentifier];
  [(PKPaymentIdentityCredential *)v4 setPassSerialNumber:self->_passSerialNumber];
  [(PKPaymentIdentityCredential *)v4 setAccountKeyIdentifier:self->_accountKeyIdentifier];
  v5 = [(PKPendingProvisioning *)self provisioningState];

  if (v5)
  {
    v6 = [(PKPendingProvisioning *)self provisioningState];
    [(PKPaymentCredential *)v4 setState:v6];
  }
  return v4;
}

- (BOOL)representsCredential:(id)a3
{
  id v4 = a3;
  if ([v4 isIdentityCredential])
  {
    v5 = [v4 identityCredential];
    v6 = [v5 passTypeIdentifier];
    passTypeIdentifier = self->_passTypeIdentifier;
    uint64_t v8 = v6;
    uint64_t v9 = passTypeIdentifier;
    if (v8 == v9)
    {

LABEL_16:
      v16 = [v5 passSerialNumber];
LABEL_19:
      passSerialNumber = self->_passSerialNumber;
      uint64_t v10 = v16;
      v18 = passSerialNumber;
      if (v10 == v18)
      {
        LOBYTE(v11) = 1;
        v19 = v10;
      }
      else
      {
        v19 = v18;
        LOBYTE(v11) = 0;
        if (v10 && v18) {
          LOBYTE(v11) = [(NSString *)v10 isEqualToString:v18];
        }
      }
      v15 = v8;

      uint64_t v8 = v10;
      goto LABEL_25;
    }
    uint64_t v10 = v9;
    LOBYTE(v11) = 0;
    if (v8 && v9)
    {
      BOOL v11 = [(NSString *)v8 isEqualToString:v9];

      if (!v11) {
        goto LABEL_26;
      }
      goto LABEL_16;
    }
LABEL_14:
    v15 = v8;
LABEL_25:

    uint64_t v8 = v15;
LABEL_26:

    goto LABEL_27;
  }
  if ([v4 isRemoteCredential])
  {
    v5 = [v4 remoteCredential];
    v12 = [v5 passTypeIdentifier];
    objc_super v13 = self->_passTypeIdentifier;
    uint64_t v8 = v12;
    v14 = v13;
    if (v8 == v14)
    {
    }
    else
    {
      uint64_t v10 = v14;
      LOBYTE(v11) = 0;
      if (!v8 || !v14) {
        goto LABEL_14;
      }
      BOOL v11 = [(NSString *)v8 isEqualToString:v14];

      if (!v11) {
        goto LABEL_26;
      }
    }
    v16 = [v5 serialNumber];
    goto LABEL_19;
  }
  LOBYTE(v11) = 0;
LABEL_27:

  return v11;
}

- (BOOL)representsPass:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 isIdentityPass])
  {
    BOOL v11 = 0;
    goto LABEL_39;
  }
  v5 = [v4 passTypeIdentifier];
  passTypeIdentifier = self->_passTypeIdentifier;
  uint64_t v7 = v5;
  uint64_t v8 = passTypeIdentifier;
  if (v7 == v8)
  {
  }
  else
  {
    uint64_t v9 = v8;
    if (!v7 || !v8)
    {
      v17 = v7;
      goto LABEL_18;
    }
    BOOL v10 = [(NSString *)v7 isEqualToString:v8];

    if (!v10) {
      goto LABEL_19;
    }
  }
  v12 = [v4 serialNumber];
  passSerialNumber = self->_passSerialNumber;
  uint64_t v9 = v12;
  v14 = passSerialNumber;
  if (v9 == v14)
  {

    goto LABEL_16;
  }
  v15 = v14;
  if (v9 && v14)
  {
    BOOL v16 = [(NSString *)v9 isEqualToString:v14];

    if (!v16) {
      goto LABEL_20;
    }
LABEL_16:
    BOOL v11 = 1;
    goto LABEL_39;
  }

  v17 = v9;
LABEL_18:

LABEL_19:
LABEL_20:
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v33 = v4;
  v18 = [v4 devicePaymentApplications];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v35;
    while (2)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v35 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if ([v23 paymentType] == 1005)
        {
          v24 = [v23 subcredentials];
          v25 = [v24 anyObject];
          v26 = [v25 identifier];

          if (v26)
          {
            credentialIdentifier = self->_credentialIdentifier;
            v28 = v26;
            v29 = credentialIdentifier;
            if (v28 == v29)
            {

LABEL_37:
              BOOL v11 = 1;
              goto LABEL_38;
            }
            v30 = v29;
            if (v29)
            {
              BOOL v31 = [(NSString *)v28 isEqualToString:v29];

              if (v31) {
                goto LABEL_37;
              }
            }
            else
            {
            }
          }
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }

  BOOL v11 = 0;
LABEL_38:
  id v4 = v33;
LABEL_39:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPendingIdentityCredential)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKPendingIdentityCredential;
  v5 = [(PKPendingProvisioning *)&v23 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharingInstanceIdentifier"];
    sharingInstanceIdentifier = v5->_sharingInstanceIdentifier;
    v5->_sharingInstanceIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cardConfigurationIdentifier"];
    cardConfigurationIdentifier = v5->_cardConfigurationIdentifier;
    v5->_cardConfigurationIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"provisioningCredentialIdentifier"];
    provisioningCredentialIdentifier = v5->_provisioningCredentialIdentifier;
    v5->_provisioningCredentialIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credentialIdentifier"];
    credentialIdentifier = v5->_credentialIdentifier;
    v5->_credentialIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passSerialNumber"];
    passSerialNumber = v5->_passSerialNumber;
    v5->_passSerialNumber = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passTypeIdentifier"];
    passTypeIdentifier = v5->_passTypeIdentifier;
    v5->_passTypeIdentifier = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountKeyIdentifier"];
    accountKeyIdentifier = v5->_accountKeyIdentifier;
    v5->_accountKeyIdentifier = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attestations"];
    attestations = v5->_attestations;
    v5->_attestations = (PKIdentityProvisioningAttestations *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPendingIdentityCredential;
  id v4 = a3;
  [(PKPendingProvisioning *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_sharingInstanceIdentifier, @"sharingInstanceIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_credentialIdentifier forKey:@"credentialIdentifier"];
  [v4 encodeObject:self->_cardConfigurationIdentifier forKey:@"cardConfigurationIdentifier"];
  [v4 encodeObject:self->_provisioningCredentialIdentifier forKey:@"provisioningCredentialIdentifier"];
  [v4 encodeObject:self->_passSerialNumber forKey:@"passSerialNumber"];
  [v4 encodeObject:self->_passTypeIdentifier forKey:@"passTypeIdentifier"];
  [v4 encodeObject:self->_accountKeyIdentifier forKey:@"accountKeyIdentifier"];
  [v4 encodeObject:self->_attestations forKey:@"attestations"];
}

- (void)_copyIntoPendingProvision:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)PKPendingIdentityCredential;
  id v4 = a3;
  [(PKPendingProvisioning *)&v19 _copyIntoPendingProvision:v4];
  uint64_t v5 = [(NSString *)self->_sharingInstanceIdentifier copy];
  uint64_t v6 = (void *)*((void *)v4 + 7);
  *((void *)v4 + 7) = v5;

  uint64_t v7 = [(NSString *)self->_cardConfigurationIdentifier copy];
  uint64_t v8 = (void *)*((void *)v4 + 8);
  *((void *)v4 + 8) = v7;

  uint64_t v9 = [(NSString *)self->_provisioningCredentialIdentifier copy];
  uint64_t v10 = (void *)*((void *)v4 + 9);
  *((void *)v4 + 9) = v9;

  uint64_t v11 = [(NSString *)self->_credentialIdentifier copy];
  uint64_t v12 = (void *)*((void *)v4 + 10);
  *((void *)v4 + 10) = v11;

  uint64_t v13 = [(NSString *)self->_passSerialNumber copy];
  uint64_t v14 = (void *)*((void *)v4 + 11);
  *((void *)v4 + 11) = v13;

  uint64_t v15 = [(NSString *)self->_passTypeIdentifier copy];
  uint64_t v16 = (void *)*((void *)v4 + 12);
  *((void *)v4 + 12) = v15;

  uint64_t v17 = [(NSString *)self->_accountKeyIdentifier copy];
  uint64_t v18 = (void *)*((void *)v4 + 13);
  *((void *)v4 + 13) = v17;

  objc_storeStrong((id *)v4 + 14, self->_attestations);
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

- (NSString)provisioningCredentialIdentifier
{
  return self->_provisioningCredentialIdentifier;
}

- (void)setProvisioningCredentialIdentifier:(id)a3
{
}

- (NSString)credentialIdentifier
{
  return self->_credentialIdentifier;
}

- (void)setCredentialIdentifier:(id)a3
{
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
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_passSerialNumber, 0);
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
  objc_storeStrong((id *)&self->_provisioningCredentialIdentifier, 0);
  objc_storeStrong((id *)&self->_cardConfigurationIdentifier, 0);
  objc_storeStrong((id *)&self->_sharingInstanceIdentifier, 0);
}

@end