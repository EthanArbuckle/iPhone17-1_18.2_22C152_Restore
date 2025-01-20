@interface PKPaymentLocalPassCredential
- (BOOL)_isEqualToCredential:(id)a3;
- (BOOL)couldSupportSuperEasyProvisioning;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsSuperEasyProvisioning;
- (NSString)passTypeIdentifier;
- (NSString)serialNumber;
- (NSString)summaryMetadataDescription;
- (PKPaymentLocalPassCredential)init;
- (PKPaymentLocalPassCredential)initWithPaymentPass:(id)a3;
- (PKPaymentPass)paymentPass;
- (id)description;
- (unint64_t)hash;
- (void)setPassTypeIdentifier:(id)a3;
- (void)setSerialNumber:(id)a3;
@end

@implementation PKPaymentLocalPassCredential

- (PKPaymentLocalPassCredential)init
{
  return [(PKPaymentLocalPassCredential *)self initWithPaymentPass:0];
}

- (PKPaymentLocalPassCredential)initWithPaymentPass:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v17.receiver = self;
    v17.super_class = (Class)PKPaymentLocalPassCredential;
    v6 = [(PKPaymentCredential *)&v17 init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_paymentPass, a3);
      uint64_t v8 = [v5 serialNumber];
      serialNumber = v7->_serialNumber;
      v7->_serialNumber = (NSString *)v8;

      uint64_t v10 = [v5 passTypeIdentifier];
      passTypeIdentifier = v7->_passTypeIdentifier;
      v7->_passTypeIdentifier = (NSString *)v10;

      v12 = [v5 devicePrimaryPaymentApplication];
      -[PKPaymentCredential setCredentialType:](v7, "setCredentialType:", [v12 paymentNetworkIdentifier]);

      v13 = [v5 primaryAccountNumberSuffix];
      [(PKPaymentCredential *)v7 setSanitizedPrimaryAccountNumber:v13];

      v14 = [v5 sanitizedPrimaryAccountName];
      [(PKPaymentCredential *)v7 setSanitizedPrimaryAccountName:v14];

      [(PKPaymentCredential *)v7 setExpiration:0];
      v15 = [v5 localizedDescription];
      [(PKPaymentCredential *)v7 setLongDescription:v15];

      -[PKPaymentCredential setCardType:](v7, "setCardType:", [v5 cardType]);
    }
  }
  else
  {

    v7 = 0;
  }

  return v7;
}

- (NSString)summaryMetadataDescription
{
  if ([(PKPass *)self->_paymentPass passType] == PKPassTypeSecureElement)
  {
    v3 = [(PKSecureElementPass *)self->_paymentPass primaryAccountNumberSuffix];
    if ([v3 length]) {
      PKMaskedPaymentPAN((uint64_t)v3);
    }
    else {
    v4 = [(PKSecureElementPass *)self->_paymentPass sanitizedPrimaryAccountName];
    }
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKPaymentLocalPassCredential *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PKPaymentLocalPassCredential *)self _isEqualToCredential:v4];
  }

  return v5;
}

- (BOOL)_isEqualToCredential:(id)a3
{
  v4 = a3;
  BOOL v5 = (void *)v4[13];
  v6 = self->_serialNumber;
  v7 = v5;
  uint64_t v8 = v7;
  if (v6 == v7)
  {
    char v10 = 1;
  }
  else
  {
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9) {
      char v10 = 0;
    }
    else {
      char v10 = [(NSString *)v6 isEqualToString:v7];
    }
  }

  return v10;
}

- (BOOL)supportsSuperEasyProvisioning
{
  return 0;
}

- (BOOL)couldSupportSuperEasyProvisioning
{
  if ([(PKSecureElementPass *)self->_paymentPass isTransitPass]
    || [(PKSecureElementPass *)self->_paymentPass isAccessPass])
  {
    return 0;
  }
  else
  {
    return ![(PKSecureElementPass *)self->_paymentPass isIdentityPass];
  }
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_serialNumber];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  serialNumber = (__CFString *)self->_serialNumber;
  if (!serialNumber) {
    serialNumber = @"n/a";
  }
  unint64_t v4 = NSString;
  BOOL v5 = serialNumber;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  uint64_t v8 = [v4 stringWithFormat:@"<%@ %p>: Serial Number: %@", v7, self, v5];

  return v8;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
}

- (PKPaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
}

@end