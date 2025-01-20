@interface PKApplePayTrustHashResponse
+ (BOOL)supportsSecureCoding;
- (NSData)nonce;
- (NSString)referenceIdentifier;
- (PKApplePayTrustHashResponse)initWithCoder:(id)a3;
- (PKApplePayTrustHashResponse)initWithData:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKApplePayTrustHashResponse

- (PKApplePayTrustHashResponse)initWithData:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)PKApplePayTrustHashResponse;
  v3 = [(PKWebServiceResponse *)&v17 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      uint64_t v7 = [v6 PKStringForKey:@"referenceIdentifier"];
      referenceIdentifier = v4->_referenceIdentifier;
      v4->_referenceIdentifier = (NSString *)v7;

      v9 = [v6 PKStringForKey:@"nonce"];

      uint64_t v10 = [v9 pk_decodeHexadecimal];
      nonce = v4->_nonce;
      v4->_nonce = (NSData *)v10;
    }
    else
    {
      v9 = PKLogFacilityTypeGetObject(0xEuLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (objc_class *)objc_opt_class();
        v13 = NSStringFromClass(v12);
        v14 = (objc_class *)objc_opt_class();
        v15 = NSStringFromClass(v14);
        *(_DWORD *)buf = 138543618;
        v19 = v13;
        __int16 v20 = 2114;
        v21 = v15;
        _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
      }
    }
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKApplePayTrustHashResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKApplePayTrustHashResponse;
  v5 = [(PKWebServiceResponse *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"referenceIdentifier"];
    referenceIdentifier = v5->_referenceIdentifier;
    v5->_referenceIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nonce"];
    nonce = v5->_nonce;
    v5->_nonce = (NSData *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKApplePayTrustHashResponse;
  id v4 = a3;
  [(PKWebServiceResponse *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_referenceIdentifier, @"referenceIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_nonce forKey:@"nonce"];
}

- (NSString)referenceIdentifier
{
  return self->_referenceIdentifier;
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_referenceIdentifier, 0);
}

@end