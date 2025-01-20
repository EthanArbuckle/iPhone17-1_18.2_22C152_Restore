@interface PKApplePayTrustSignature
+ (BOOL)supportsSecureCoding;
- (NSData)paymentData;
- (NSData)signatureData;
- (PKApplePayTrustSignature)initWithCoder:(id)a3;
- (PKApplePayTrustSignature)initWithSignatureRequest:(id)a3 signature:(id)a4;
- (PKApplePayTrustSignatureRequest)signatureRequest;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKApplePayTrustSignature

- (PKApplePayTrustSignature)initWithSignatureRequest:(id)a3 signature:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKApplePayTrustSignature;
  v9 = [(PKApplePayTrustSignature *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_signatureRequest, a3);
    objc_storeStrong((id *)&v10->_signatureData, a4);
  }

  return v10;
}

- (PKApplePayTrustSignature)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKApplePayTrustSignature;
  v5 = [(PKApplePayTrustSignature *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signatureData"];
    signatureData = v5->_signatureData;
    v5->_signatureData = (NSData *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"signatureData: '%@'; ", self->_signatureData];
  [v3 appendFormat:@"signatureRequest: '%@'; ", self->_signatureRequest];
  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKApplePayTrustSignatureRequest)signatureRequest
{
  return self->_signatureRequest;
}

- (NSData)signatureData
{
  return self->_signatureData;
}

- (NSData)paymentData
{
  return self->_paymentData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentData, 0);
  objc_storeStrong((id *)&self->_signatureData, 0);
  objc_storeStrong((id *)&self->_signatureRequest, 0);
}

@end