@interface PKPrecursorPassCredential
- (BOOL)supportsSuperEasyProvisioning;
- (NSString)passTypeIdentifier;
- (NSString)serialNumber;
- (PKPaymentPass)paymentPass;
- (PKPrecursorPassCredential)initWithCoder:(id)a3;
- (PKPrecursorPassCredential)initWithPassTypeIdentifier:(id)a3 passSerialNumber:(id)a4;
- (PKPrecursorPassCredential)initWithRemoteCredential:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setPaymentPass:(id)a3;
@end

@implementation PKPrecursorPassCredential

- (PKPrecursorPassCredential)initWithRemoteCredential:(id)a3
{
  id v5 = a3;
  v6 = [v5 passTypeIdentifier];
  v7 = [v5 serialNumber];
  v8 = [(PKPrecursorPassCredential *)self initWithPassTypeIdentifier:v6 passSerialNumber:v7];

  if (v8) {
    objc_storeStrong((id *)&v8->_remoteCredential, a3);
  }

  return v8;
}

- (PKPrecursorPassCredential)initWithPassTypeIdentifier:(id)a3 passSerialNumber:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPrecursorPassCredential;
  v9 = [(PKPaymentCredential *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_passTypeIdentifier, a3);
    objc_storeStrong((id *)&v10->_serialNumber, a4);
  }

  return v10;
}

- (BOOL)supportsSuperEasyProvisioning
{
  return 1;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_passTypeIdentifier];
  [v3 safelyAddObject:self->_serialNumber];
  v7.receiver = self;
  v7.super_class = (Class)PKPrecursorPassCredential;
  id v4 = [(PKPaymentCredential *)&v7 hash];
  unint64_t v5 = PKCombinedHash((uint64_t)v4, v3);

  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@ %p>: PasTypeIdentifier: %@; SerialNumber: %@;",
    v5,
    self,
    self->_passTypeIdentifier,
  v6 = self->_serialNumber);

  return v6;
}

- (PKPrecursorPassCredential)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPrecursorPassCredential;
  unint64_t v5 = [(PKPaymentCredential *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pasTypeIdentifier"];
    passTypeIdentifier = v5->_passTypeIdentifier;
    v5->_passTypeIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serialNumber"];
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remoteCredential"];
    remoteCredential = v5->_remoteCredential;
    v5->_remoteCredential = (PKPaymentRemoteCredential *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  passTypeIdentifier = self->_passTypeIdentifier;
  id v5 = a3;
  [v5 encodeObject:passTypeIdentifier forKey:@"pasTypeIdentifier"];
  [v5 encodeObject:self->_serialNumber forKey:@"serialNumber"];
  [v5 encodeObject:self->_remoteCredential forKey:@"remoteCredential"];
}

- (PKPaymentPass)paymentPass
{
  return [(PKPaymentRemoteCredential *)self->_remoteCredential paymentPass];
}

- (void)setPaymentPass:(id)a3
{
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteCredential, 0);
}

@end