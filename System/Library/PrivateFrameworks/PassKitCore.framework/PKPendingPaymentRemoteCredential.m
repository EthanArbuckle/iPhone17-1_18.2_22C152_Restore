@interface PKPendingPaymentRemoteCredential
+ (BOOL)supportsSecureCoding;
- (BOOL)couldSupportSuperEasyProvisioning;
- (BOOL)representsCredential:(id)a3;
- (BOOL)representsPass:(id)a3;
- (BOOL)supportsSuperEasyProvisioning;
- (NSString)cardIdentifier;
- (NSString)nonce;
- (NSString)ownershipToken;
- (NSString)passSerialNumber;
- (NSString)passTypeIdentifier;
- (NSString)sanitizedPrimaryAccountNumber;
- (NSString)transferableFromDeviceIdentifier;
- (NSString)transferableFromDeviceSerialNumber;
- (NSURL)passURL;
- (PKPendingPaymentRemoteCredential)init;
- (PKPendingPaymentRemoteCredential)initWithCoder:(id)a3;
- (PKPendingPaymentRemoteCredential)initWithRemoteCredential:(id)a3;
- (id)credential;
- (id)initForDatabase;
- (id)type;
- (int64_t)cardType;
- (int64_t)credentialType;
- (void)_copyIntoPendingProvision:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCardIdentifier:(id)a3;
- (void)setCardType:(int64_t)a3;
- (void)setCouldSupportSuperEasyProvisioning:(BOOL)a3;
- (void)setCredentialType:(int64_t)a3;
- (void)setNonce:(id)a3;
- (void)setOwnershipToken:(id)a3;
- (void)setPassSerialNumber:(id)a3;
- (void)setPassTypeIdentifier:(id)a3;
- (void)setPassURL:(id)a3;
- (void)setSanitizedPrimaryAccountNumber:(id)a3;
- (void)setSupportsSuperEasyProvisioning:(BOOL)a3;
- (void)setTransferableFromDeviceIdentifier:(id)a3;
- (void)setTransferableFromDeviceSerialNumber:(id)a3;
@end

@implementation PKPendingPaymentRemoteCredential

- (PKPendingPaymentRemoteCredential)init
{
  return 0;
}

- (id)initForDatabase
{
  v3.receiver = self;
  v3.super_class = (Class)PKPendingPaymentRemoteCredential;
  return [(PKPendingPaymentRemoteCredential *)&v3 init];
}

- (PKPendingPaymentRemoteCredential)initWithRemoteCredential:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  v27.receiver = self;
  v27.super_class = (Class)PKPendingPaymentRemoteCredential;
  v6 = [(PKPendingProvisioning *)&v27 initWithUniqueIdentifier:v5 status:1];

  if (v6)
  {
    uint64_t v7 = [v4 passTypeIdentifier];
    passTypeIdentifier = v6->_passTypeIdentifier;
    v6->_passTypeIdentifier = (NSString *)v7;

    uint64_t v9 = [v4 serialNumber];
    passSerialNumber = v6->_passSerialNumber;
    v6->_passSerialNumber = (NSString *)v9;

    v6->_credentialType = [v4 credentialType];
    v6->_cardType = [v4 cardType];
    uint64_t v11 = [v4 sanitizedPrimaryAccountNumber];
    sanitizedPrimaryAccountNumber = v6->_sanitizedPrimaryAccountNumber;
    v6->_sanitizedPrimaryAccountNumber = (NSString *)v11;

    uint64_t v13 = [v4 identifier];
    cardIdentifier = v6->_cardIdentifier;
    v6->_cardIdentifier = (NSString *)v13;

    uint64_t v15 = [v4 ownershipTokenIdentifier];
    ownershipToken = v6->_ownershipToken;
    v6->_ownershipToken = (NSString *)v15;

    uint64_t v17 = [v4 passURL];
    passURL = v6->_passURL;
    v6->_passURL = (NSURL *)v17;

    v6->_supportsSuperEasyProvisioning = [v4 supportsSuperEasyProvisioning];
    v6->_couldSupportSuperEasyProvisioning = [v4 couldSupportSuperEasyProvisioning];
    v19 = [v4 transferableFromDevices];
    v20 = [v19 firstObject];

    if (v20)
    {
      uint64_t v21 = [v20 serialNumber];
      transferableFromDeviceSerialNumber = v6->_transferableFromDeviceSerialNumber;
      v6->_transferableFromDeviceSerialNumber = (NSString *)v21;

      uint64_t v23 = [v20 identifier];
      transferableFromDeviceIdentifier = v6->_transferableFromDeviceIdentifier;
      v6->_transferableFromDeviceIdentifier = (NSString *)v23;
    }
    v25 = [v4 state];
    [(PKPendingProvisioning *)v6 setProvisioningState:v25];
  }
  return v6;
}

- (id)type
{
  return @"PaymentRemoteCredential";
}

- (id)credential
{
  v10[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [PKPaymentRemoteCredential alloc];
  id v4 = [(PKPaymentRemoteCredential *)v3 initWithDictionary:MEMORY[0x1E4F1CC08]];
  [(PKPaymentRemoteCredential *)v4 setPassTypeIdentifier:self->_passTypeIdentifier];
  [(PKPaymentRemoteCredential *)v4 setSerialNumber:self->_passSerialNumber];
  [(PKPaymentCredential *)v4 setCredentialType:self->_credentialType];
  [(PKPaymentCredential *)v4 setCardType:self->_cardType];
  [(PKPaymentCredential *)v4 setSanitizedPrimaryAccountNumber:self->_sanitizedPrimaryAccountNumber];
  [(PKPaymentRemoteCredential *)v4 setIdentifier:self->_cardIdentifier];
  [(PKPaymentRemoteCredential *)v4 setOwnershipTokenIdentifier:self->_ownershipToken];
  [(PKPaymentRemoteCredential *)v4 setPassURL:self->_passURL];
  [(PKPaymentRemoteCredential *)v4 setStatus:1];
  [(PKPaymentRemoteCredential *)v4 setSupportsSuperEasyProvisioning:self->_supportsSuperEasyProvisioning];
  [(PKPaymentRemoteCredential *)v4 setCouldSupportSuperEasyProvisioning:self->_couldSupportSuperEasyProvisioning];
  if (self->_transferableFromDeviceIdentifier && self->_transferableFromDeviceSerialNumber)
  {
    v5 = [[PKExternalDestinationDevice alloc] initWithIdentifier:self->_transferableFromDeviceIdentifier serialNumber:self->_transferableFromDeviceSerialNumber];
    v10[0] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [(PKPaymentRemoteCredential *)v4 setTransferableFromDevices:v6];

    [(PKPaymentRemoteCredential *)v4 setStatus:5];
  }
  uint64_t v7 = [(PKPendingProvisioning *)self provisioningState];

  if (v7)
  {
    v8 = [(PKPendingProvisioning *)self provisioningState];
    [(PKPaymentCredential *)v4 setState:v8];
  }
  return v4;
}

- (BOOL)representsCredential:(id)a3
{
  id v4 = a3;
  if ([v4 isRemoteCredential])
  {
    v5 = [v4 remoteCredential];
    v6 = v5;
    uint64_t v7 = 104;
    cardIdentifier = self->_cardIdentifier;
    if (!cardIdentifier)
    {
      p_passURL = &self->_passURL;
      if (!*p_passURL)
      {
        char v14 = 0;
LABEL_24:

        goto LABEL_25;
      }
      goto LABEL_15;
    }
    uint64_t v9 = [v5 identifier];
    v10 = self->_cardIdentifier;
    uint64_t v7 = v9;
    uint64_t v11 = v10;
    if ((NSString *)v7 == v11)
    {
    }
    else
    {
      v12 = v11;
      if (!v7 || !v11)
      {

LABEL_14:
        p_passURL = &self->_passURL;
        if (*p_passURL)
        {
LABEL_15:
          v16 = [v6 passURL];
          uint64_t v17 = v16;
          v18 = *p_passURL;
          if (v16 && v18) {
            char v14 = -[NSURL isEqual:](v16, "isEqual:");
          }
          else {
            char v14 = v16 == v18;
          }

          if (!cardIdentifier) {
            goto LABEL_24;
          }
          goto LABEL_23;
        }
        char v14 = 0;
LABEL_23:

        goto LABEL_24;
      }
      char v13 = [(id)v7 isEqualToString:v11];

      if ((v13 & 1) == 0) {
        goto LABEL_14;
      }
    }
    char v14 = 1;
    goto LABEL_23;
  }
  char v14 = 0;
LABEL_25:

  return v14;
}

- (BOOL)representsPass:(id)a3
{
  id v4 = a3;
  v5 = [v4 passTypeIdentifier];
  v6 = [v4 serialNumber];

  uint64_t v7 = [(NSURL *)self->_passURL absoluteString];
  v8 = self->_passTypeIdentifier;
  uint64_t v9 = v5;
  v10 = v9;
  if (v8 == v9)
  {
  }
  else
  {
    if (!v9 || !v8)
    {
      char v13 = v9;
      goto LABEL_14;
    }
    BOOL v11 = [(NSString *)v8 isEqualToString:v9];

    if (!v11)
    {
LABEL_11:
      if (!v7) {
        goto LABEL_17;
      }
      goto LABEL_15;
    }
  }
  v8 = self->_passSerialNumber;
  v12 = v6;
  char v13 = v12;
  if (v8 == v12)
  {

    goto LABEL_19;
  }
  if (v12 && v8)
  {
    BOOL v14 = [(NSString *)v8 isEqualToString:v12];

    if (!v14) {
      goto LABEL_11;
    }
LABEL_19:
    char v15 = 1;
    goto LABEL_20;
  }
LABEL_14:

  if (!v7)
  {
LABEL_17:
    char v15 = 0;
    goto LABEL_20;
  }
LABEL_15:
  if (![v7 containsString:v10]) {
    goto LABEL_17;
  }
  char v15 = [v7 containsString:v6];
LABEL_20:

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPendingPaymentRemoteCredential)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKPendingPaymentRemoteCredential;
  v5 = [(PKPendingProvisioning *)&v25 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passTypeIdentifier"];
    passTypeIdentifier = v5->_passTypeIdentifier;
    v5->_passTypeIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passSerialNumber"];
    passSerialNumber = v5->_passSerialNumber;
    v5->_passSerialNumber = (NSString *)v8;

    v5->_credentialType = [v4 decodeIntegerForKey:@"credentialType"];
    v5->_cardType = [v4 decodeIntegerForKey:@"cardType"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sanitizedPrimaryAccountNumber"];
    sanitizedPrimaryAccountNumber = v5->_sanitizedPrimaryAccountNumber;
    v5->_sanitizedPrimaryAccountNumber = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cardIdentifier"];
    cardIdentifier = v5->_cardIdentifier;
    v5->_cardIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ownershipToken"];
    ownershipToken = v5->_ownershipToken;
    v5->_ownershipToken = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nonce"];
    nonce = v5->_nonce;
    v5->_nonce = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transferableFromDeviceSerialNumber"];
    transferableFromDeviceSerialNumber = v5->_transferableFromDeviceSerialNumber;
    v5->_transferableFromDeviceSerialNumber = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transferableFromDeviceIdentifier"];
    transferableFromDeviceIdentifier = v5->_transferableFromDeviceIdentifier;
    v5->_transferableFromDeviceIdentifier = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passURL"];
    passURL = v5->_passURL;
    v5->_passURL = (NSURL *)v22;

    v5->_supportsSuperEasyProvisioning = [v4 decodeBoolForKey:@"supportsSuperEasyProvisioning"];
    v5->_couldSupportSuperEasyProvisioning = [v4 decodeBoolForKey:@"couldSupportSuperEasyProvisioning"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPendingPaymentRemoteCredential;
  id v4 = a3;
  [(PKPendingProvisioning *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_passTypeIdentifier, @"passTypeIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_passSerialNumber forKey:@"passSerialNumber"];
  [v4 encodeInteger:self->_credentialType forKey:@"credentialType"];
  [v4 encodeInteger:self->_cardType forKey:@"cardType"];
  [v4 encodeObject:self->_sanitizedPrimaryAccountNumber forKey:@"sanitizedPrimaryAccountNumber"];
  [v4 encodeObject:self->_cardIdentifier forKey:@"cardIdentifier"];
  [v4 encodeObject:self->_ownershipToken forKey:@"ownershipToken"];
  [v4 encodeObject:self->_nonce forKey:@"nonce"];
  [v4 encodeObject:self->_transferableFromDeviceSerialNumber forKey:@"transferableFromDeviceSerialNumber"];
  [v4 encodeObject:self->_transferableFromDeviceIdentifier forKey:@"transferableFromDeviceIdentifier"];
  [v4 encodeObject:self->_passURL forKey:@"passURL"];
  [v4 encodeBool:self->_supportsSuperEasyProvisioning forKey:@"supportsSuperEasyProvisioning"];
  [v4 encodeBool:self->_couldSupportSuperEasyProvisioning forKey:@"couldSupportSuperEasyProvisioning"];
}

- (void)_copyIntoPendingProvision:(id)a3
{
  v23.receiver = self;
  v23.super_class = (Class)PKPendingPaymentRemoteCredential;
  id v4 = a3;
  [(PKPendingProvisioning *)&v23 _copyIntoPendingProvision:v4];
  uint64_t v5 = [(NSString *)self->_passTypeIdentifier copy];
  uint64_t v6 = (void *)v4[8];
  v4[8] = v5;

  uint64_t v7 = [(NSString *)self->_passSerialNumber copy];
  uint64_t v8 = (void *)v4[9];
  v4[9] = v7;

  v4[10] = self->_credentialType;
  v4[11] = self->_cardType;
  uint64_t v9 = [(NSString *)self->_sanitizedPrimaryAccountNumber copy];
  uint64_t v10 = (void *)v4[12];
  v4[12] = v9;

  uint64_t v11 = [(NSString *)self->_cardIdentifier copy];
  uint64_t v12 = (void *)v4[13];
  v4[13] = v11;

  uint64_t v13 = [(NSString *)self->_ownershipToken copy];
  uint64_t v14 = (void *)v4[14];
  v4[14] = v13;

  uint64_t v15 = [(NSString *)self->_nonce copy];
  uint64_t v16 = (void *)v4[15];
  v4[15] = v15;

  uint64_t v17 = [(NSString *)self->_transferableFromDeviceSerialNumber copy];
  uint64_t v18 = (void *)v4[16];
  v4[16] = v17;

  uint64_t v19 = [(NSString *)self->_transferableFromDeviceIdentifier copy];
  uint64_t v20 = (void *)v4[17];
  v4[17] = v19;

  uint64_t v21 = [(NSURL *)self->_passURL copy];
  uint64_t v22 = (void *)v4[18];
  v4[18] = v21;

  *((unsigned char *)v4 + 56) = self->_supportsSuperEasyProvisioning;
  *((unsigned char *)v4 + 57) = self->_couldSupportSuperEasyProvisioning;
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

- (int64_t)credentialType
{
  return self->_credentialType;
}

- (void)setCredentialType:(int64_t)a3
{
  self->_credentialType = a3;
}

- (int64_t)cardType
{
  return self->_cardType;
}

- (void)setCardType:(int64_t)a3
{
  self->_cardType = a3;
}

- (NSString)sanitizedPrimaryAccountNumber
{
  return self->_sanitizedPrimaryAccountNumber;
}

- (void)setSanitizedPrimaryAccountNumber:(id)a3
{
}

- (NSString)cardIdentifier
{
  return self->_cardIdentifier;
}

- (void)setCardIdentifier:(id)a3
{
}

- (NSString)ownershipToken
{
  return self->_ownershipToken;
}

- (void)setOwnershipToken:(id)a3
{
}

- (NSString)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
}

- (NSString)transferableFromDeviceSerialNumber
{
  return self->_transferableFromDeviceSerialNumber;
}

- (void)setTransferableFromDeviceSerialNumber:(id)a3
{
}

- (NSString)transferableFromDeviceIdentifier
{
  return self->_transferableFromDeviceIdentifier;
}

- (void)setTransferableFromDeviceIdentifier:(id)a3
{
}

- (NSURL)passURL
{
  return self->_passURL;
}

- (void)setPassURL:(id)a3
{
}

- (BOOL)supportsSuperEasyProvisioning
{
  return self->_supportsSuperEasyProvisioning;
}

- (void)setSupportsSuperEasyProvisioning:(BOOL)a3
{
  self->_supportsSuperEasyProvisioning = a3;
}

- (BOOL)couldSupportSuperEasyProvisioning
{
  return self->_couldSupportSuperEasyProvisioning;
}

- (void)setCouldSupportSuperEasyProvisioning:(BOOL)a3
{
  self->_couldSupportSuperEasyProvisioning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passURL, 0);
  objc_storeStrong((id *)&self->_transferableFromDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_transferableFromDeviceSerialNumber, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_ownershipToken, 0);
  objc_storeStrong((id *)&self->_cardIdentifier, 0);
  objc_storeStrong((id *)&self->_sanitizedPrimaryAccountNumber, 0);
  objc_storeStrong((id *)&self->_passSerialNumber, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
}

@end