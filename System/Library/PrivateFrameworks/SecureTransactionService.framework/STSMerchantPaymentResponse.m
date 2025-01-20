@interface STSMerchantPaymentResponse
+ (BOOL)supportsSecureCoding;
- (NSArray)sepCerts;
- (NSData)confirmationBlobHash;
- (NSData)confirmationBlobSignature;
- (NSNumber)confirmationBlobVersion;
- (STSMerchantPaymentResponse)initWithCoder:(id)a3;
- (id)initFromNFECommercePaymentResponse:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STSMerchantPaymentResponse

- (id)initFromNFECommercePaymentResponse:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)STSMerchantPaymentResponse;
  v5 = [(STSPaymentResponseBase *)&v15 initFromNFECommercePaymentResponse:v4];
  if (v5)
  {
    uint64_t v6 = [v4 confirmationBlobHash];
    v7 = (void *)v5[5];
    v5[5] = v6;

    uint64_t v8 = [v4 confirmationBlobSignature];
    v9 = (void *)v5[6];
    v5[6] = v8;

    uint64_t v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "confirmationBlobVersion"));
    v11 = (void *)v5[7];
    v5[7] = v10;

    uint64_t v12 = [v4 SEPcerts];
    v13 = (void *)v5[4];
    v5[4] = v12;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STSMerchantPaymentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)STSMerchantPaymentResponse;
  v5 = [(STSPaymentResponseBase *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"confirmationBlobVersion"];
    confirmationBlobVersion = v5->_confirmationBlobVersion;
    v5->_confirmationBlobVersion = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"confirmationBlobHash"];
    confirmationBlobHash = v5->_confirmationBlobHash;
    v5->_confirmationBlobHash = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"confirmationBlobHashSignature"];
    confirmationBlobSignature = v5->_confirmationBlobSignature;
    v5->_confirmationBlobSignature = (NSData *)v10;

    uint64_t v12 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"sepCerts"];
    sepCerts = v5->_sepCerts;
    v5->_sepCerts = (NSArray *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STSMerchantPaymentResponse;
  id v4 = a3;
  [(STSPaymentResponseBase *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_confirmationBlobVersion, @"confirmationBlobVersion", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_confirmationBlobHash forKey:@"confirmationBlobHash"];
  [v4 encodeObject:self->_confirmationBlobSignature forKey:@"confirmationBlobHashSignature"];
  [v4 encodeObject:self->_sepCerts forKey:@"sepCerts"];
}

- (NSArray)sepCerts
{
  return self->_sepCerts;
}

- (NSData)confirmationBlobHash
{
  return self->_confirmationBlobHash;
}

- (NSData)confirmationBlobSignature
{
  return self->_confirmationBlobSignature;
}

- (NSNumber)confirmationBlobVersion
{
  return self->_confirmationBlobVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmationBlobVersion, 0);
  objc_storeStrong((id *)&self->_confirmationBlobSignature, 0);
  objc_storeStrong((id *)&self->_confirmationBlobHash, 0);
  objc_storeStrong((id *)&self->_sepCerts, 0);
}

@end