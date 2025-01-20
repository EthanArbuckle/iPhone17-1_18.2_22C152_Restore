@interface PKWrappedPayment
+ (BOOL)supportsSecureCoding;
- (NSArray)SEPCertificates;
- (NSData)confirmationBlobHash;
- (NSData)enrollmentSignature;
- (NSData)transactionData;
- (NSData)transactionInstructionsSignature;
- (NSString)kextBlacklistVersion;
- (NSString)merchantCountryCode;
- (NSString)transactionIdentifier;
- (PKSecureElementCertificateSet)certificates;
- (PKWrappedPayment)initWithCoder:(id)a3;
- (id)description;
- (int64_t)confirmationBlobVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setCertificates:(id)a3;
- (void)setConfirmationBlobHash:(id)a3;
- (void)setConfirmationBlobVersion:(int64_t)a3;
- (void)setEnrollmentSignature:(id)a3;
- (void)setKextBlacklistVersion:(id)a3;
- (void)setMerchantCountryCode:(id)a3;
- (void)setSEPCertificates:(id)a3;
- (void)setTransactionData:(id)a3;
- (void)setTransactionIdentifier:(id)a3;
- (void)setTransactionInstructionsSignature:(id)a3;
@end

@implementation PKWrappedPayment

- (PKWrappedPayment)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKWrappedPayment;
  v5 = [(PKWrappedPayment *)&v19 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionIdentifier"];
    [(PKWrappedPayment *)v5 setTransactionIdentifier:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionData"];
    [(PKWrappedPayment *)v5 setTransactionData:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionInstructionsSignature"];
    [(PKWrappedPayment *)v5 setTransactionInstructionsSignature:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"certificates"];
    [(PKWrappedPayment *)v5 setCertificates:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantCountryCode"];
    [(PKWrappedPayment *)v5 setMerchantCountryCode:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kextBlacklistVersion"];
    [(PKWrappedPayment *)v5 setKextBlacklistVersion:v11];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"enrollmentSignature"];
    [(PKWrappedPayment *)v5 setEnrollmentSignature:v12];

    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v16 = [v4 decodeObjectOfClasses:v15 forKey:@"SEPCertificates"];
    [(PKWrappedPayment *)v5 setSEPCertificates:v16];

    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"confirmationBlobHash"];
    [(PKWrappedPayment *)v5 setConfirmationBlobHash:v17];

    -[PKWrappedPayment setConfirmationBlobVersion:](v5, "setConfirmationBlobVersion:", [v4 decodeIntegerForKey:@"confirmationBlobVersion"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  id v4 = [(PKWrappedPayment *)self transactionIdentifier];
  [v13 encodeObject:v4 forKey:@"transactionIdentifier"];

  v5 = [(PKWrappedPayment *)self transactionData];
  [v13 encodeObject:v5 forKey:@"transactionData"];

  v6 = [(PKWrappedPayment *)self transactionInstructionsSignature];
  [v13 encodeObject:v6 forKey:@"transactionInstructionsSignature"];

  v7 = [(PKWrappedPayment *)self certificates];
  [v13 encodeObject:v7 forKey:@"certificates"];

  v8 = [(PKWrappedPayment *)self merchantCountryCode];
  [v13 encodeObject:v8 forKey:@"merchantCountryCode"];

  v9 = [(PKWrappedPayment *)self kextBlacklistVersion];
  [v13 encodeObject:v9 forKey:@"kextBlacklistVersion"];

  v10 = [(PKWrappedPayment *)self enrollmentSignature];
  [v13 encodeObject:v10 forKey:@"enrollmentSignature"];

  v11 = [(PKWrappedPayment *)self SEPCertificates];
  [v13 encodeObject:v11 forKey:@"SEPCertificates"];

  v12 = [(PKWrappedPayment *)self confirmationBlobHash];
  [v13 encodeObject:v12 forKey:@"confirmationBlobHash"];

  objc_msgSend(v13, "encodeInteger:forKey:", -[PKWrappedPayment confirmationBlobVersion](self, "confirmationBlobVersion"), @"confirmationBlobVersion");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = objc_opt_class();
  v5 = [(PKWrappedPayment *)self transactionIdentifier];
  v6 = [(PKWrappedPayment *)self transactionData];
  uint64_t v7 = [v6 length];
  v8 = [(PKWrappedPayment *)self certificates];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; transactionId = %@; transactionData = %tu bytes; certificates = %@;",
    v4,
    self,
    v5,
    v7,
  v9 = v8);

  v10 = [(PKWrappedPayment *)self SEPCertificates];
  [v9 appendFormat:@" SEPCertificates = %@;", v10];

  v11 = [(PKWrappedPayment *)self confirmationBlobHash];
  [v9 appendFormat:@" confirmationBlobHash = %@;", v11];

  objc_msgSend(v9, "appendFormat:", @" confirmationBlobVersion: %d", -[PKWrappedPayment confirmationBlobVersion](self, "confirmationBlobVersion"));
  v12 = [(PKWrappedPayment *)self transactionInstructionsSignature];

  if (v12)
  {
    id v13 = [(PKWrappedPayment *)self transactionInstructionsSignature];
    objc_msgSend(v9, "appendFormat:", @" transactionInstructionsSignature = %tu bytes;",
      [v13 length]);
  }
  uint64_t v14 = [(PKWrappedPayment *)self enrollmentSignature];

  if (v14)
  {
    v15 = [(PKWrappedPayment *)self enrollmentSignature];
    [v9 appendFormat:@" enrollmentSignature: %@;", v15];
  }
  [v9 appendString:@">"];
  v16 = (void *)[v9 copy];

  return v16;
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (void)setTransactionIdentifier:(id)a3
{
}

- (NSData)transactionData
{
  return self->_transactionData;
}

- (void)setTransactionData:(id)a3
{
}

- (NSData)transactionInstructionsSignature
{
  return self->_transactionInstructionsSignature;
}

- (void)setTransactionInstructionsSignature:(id)a3
{
}

- (PKSecureElementCertificateSet)certificates
{
  return self->_certificates;
}

- (void)setCertificates:(id)a3
{
}

- (NSString)merchantCountryCode
{
  return self->_merchantCountryCode;
}

- (void)setMerchantCountryCode:(id)a3
{
}

- (NSString)kextBlacklistVersion
{
  return self->_kextBlacklistVersion;
}

- (void)setKextBlacklistVersion:(id)a3
{
}

- (NSData)enrollmentSignature
{
  return self->_enrollmentSignature;
}

- (void)setEnrollmentSignature:(id)a3
{
}

- (NSArray)SEPCertificates
{
  return self->_SEPCertificates;
}

- (void)setSEPCertificates:(id)a3
{
}

- (NSData)confirmationBlobHash
{
  return self->_confirmationBlobHash;
}

- (void)setConfirmationBlobHash:(id)a3
{
}

- (int64_t)confirmationBlobVersion
{
  return self->_confirmationBlobVersion;
}

- (void)setConfirmationBlobVersion:(int64_t)a3
{
  self->_confirmationBlobVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmationBlobHash, 0);
  objc_storeStrong((id *)&self->_SEPCertificates, 0);
  objc_storeStrong((id *)&self->_enrollmentSignature, 0);
  objc_storeStrong((id *)&self->_kextBlacklistVersion, 0);
  objc_storeStrong((id *)&self->_merchantCountryCode, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_transactionInstructionsSignature, 0);
  objc_storeStrong((id *)&self->_transactionData, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
}

@end