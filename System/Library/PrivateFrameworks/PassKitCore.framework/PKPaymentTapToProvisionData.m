@interface PKPaymentTapToProvisionData
+ (BOOL)supportsSecureCoding;
- (NSData)casdCertificate;
- (NSData)encryptedData;
- (PKPaymentTapToProvisionData)initWithCoder:(id)a3;
- (PKPaymentTapToProvisionData)initWithEncryptedData:(id)a3 casdCertificate:(id)a4;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPaymentTapToProvisionData

- (PKPaymentTapToProvisionData)initWithEncryptedData:(id)a3 casdCertificate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentTapToProvisionData;
  v9 = [(PKPaymentTapToProvisionData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_encryptedData, a3);
    objc_storeStrong((id *)&v10->_casdCertificate, a4);
  }

  return v10;
}

- (id)dictionaryRepresentation
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"encryptedTapData";
  v3 = [(NSData *)self->_encryptedData base64EncodedStringWithOptions:0];
  v7[1] = @"casdCertificate";
  v8[0] = v3;
  v4 = [(NSData *)self->_casdCertificate base64EncodedStringWithOptions:0];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (PKPaymentTapToProvisionData)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentTapToProvisionData;
  v5 = [(PKPaymentTapToProvisionData *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encryptedData"];
    encryptedData = v5->_encryptedData;
    v5->_encryptedData = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"casdCertificate"];
    casdCertificate = v5->_casdCertificate;
    v5->_casdCertificate = (NSData *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  encryptedData = self->_encryptedData;
  id v5 = a3;
  [v5 encodeObject:encryptedData forKey:@"encryptedData"];
  [v5 encodeObject:self->_casdCertificate forKey:@"casdCertificate"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)encryptedData
{
  return self->_encryptedData;
}

- (NSData)casdCertificate
{
  return self->_casdCertificate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_casdCertificate, 0);
  objc_storeStrong((id *)&self->_encryptedData, 0);
}

@end