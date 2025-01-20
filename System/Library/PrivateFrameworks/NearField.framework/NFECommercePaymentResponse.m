@interface NFECommercePaymentResponse
+ (BOOL)supportsSecureCoding;
- (NFECommercePaymentResponse)initWithCoder:(id)a3;
- (NFECommercePaymentResponse)initWithDictionary:(id)a3;
- (NSArray)SEPcerts;
- (NSData)confirmationBlobHash;
- (NSData)confirmationBlobSignature;
- (NSData)transactionData;
- (NSDictionary)certs;
- (NSString)transactionIdentifier;
- (int64_t)confirmationBlobVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setCerts:(id)a3;
- (void)setConfirmationBlobHash:(id)a3 withSignature:(id)a4 version:(unint64_t)a5;
- (void)setSEPCerts:(id)a3;
@end

@implementation NFECommercePaymentResponse

- (NFECommercePaymentResponse)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NFECommercePaymentResponse;
  v5 = [(NFECommercePaymentResponse *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"transactionIdentifier"];
    transactionIdentifier = v5->_transactionIdentifier;
    v5->_transactionIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"transactionData"];
    transactionData = v5->_transactionData;
    v5->_transactionData = (NSData *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"confirmationBlobHash"];
    confirmationBlobHash = v5->_confirmationBlobHash;
    v5->_confirmationBlobHash = (NSData *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"confirmationBlobHashSignature"];
    confirmationBlobSignature = v5->_confirmationBlobSignature;
    v5->_confirmationBlobSignature = (NSData *)v12;

    v14 = [v4 objectForKeyedSubscript:@"confirmationBlobVersion"];
    v5->_confirmationBlobVersion = [v14 integerValue];
  }
  return v5;
}

- (NFECommercePaymentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NFECommercePaymentResponse;
  v5 = [(NFECommercePaymentResponse *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionIdentifier"];
    transactionIdentifier = v5->_transactionIdentifier;
    v5->_transactionIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionData"];
    transactionData = v5->_transactionData;
    v5->_transactionData = (NSData *)v8;

    uint64_t v10 = [MEMORY[0x1E4FBA858] coder:v4 decodeDictOfClass:objc_opt_class() forKey:@"certs"];
    certs = v5->_certs;
    v5->_certs = (NSDictionary *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"confirmationBlobHash"];
    confirmationBlobHash = v5->_confirmationBlobHash;
    v5->_confirmationBlobHash = (NSData *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"confirmationBlobHashSignature"];
    confirmationBlobSignature = v5->_confirmationBlobSignature;
    v5->_confirmationBlobSignature = (NSData *)v14;

    objc_super v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"confirmationBlobVersion"];
    v5->_confirmationBlobVersion = [v16 integerValue];

    uint64_t v17 = [MEMORY[0x1E4FBA858] coder:v4 decodeArrayOfClass:objc_opt_class() forKey:@"sepCerts"];
    SEPcerts = v5->_SEPcerts;
    v5->_SEPcerts = (NSArray *)v17;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  [v8 encodeObject:self->_transactionIdentifier forKey:@"transactionIdentifier"];
  [v8 encodeObject:self->_transactionData forKey:@"transactionData"];
  [v8 encodeObject:self->_certs forKey:@"certs"];
  confirmationBlobHash = self->_confirmationBlobHash;
  if (confirmationBlobHash) {
    [v8 encodeObject:confirmationBlobHash forKey:@"confirmationBlobHash"];
  }
  confirmationBlobSignature = self->_confirmationBlobSignature;
  if (confirmationBlobSignature) {
    [v8 encodeObject:confirmationBlobSignature forKey:@"confirmationBlobHashSignature"];
  }
  uint64_t v6 = [NSNumber numberWithInteger:self->_confirmationBlobVersion];
  [v8 encodeObject:v6 forKey:@"confirmationBlobVersion"];

  SEPcerts = self->_SEPcerts;
  if (SEPcerts) {
    [v8 encodeObject:SEPcerts forKey:@"sepCerts"];
  }
}

- (void)setCerts:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setConfirmationBlobHash:(id)a3 withSignature:(id)a4 version:(unint64_t)a5
{
  id v8 = (NSData *)a3;
  v9 = (NSData *)a4;
  confirmationBlobHash = self->_confirmationBlobHash;
  self->_confirmationBlobHash = v8;
  v11 = v8;

  confirmationBlobSignature = self->_confirmationBlobSignature;
  self->_confirmationBlobSignature = v9;

  self->_confirmationBlobVersion = a5;
}

- (void)setSEPCerts:(id)a3
{
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (NSData)transactionData
{
  return self->_transactionData;
}

- (NSDictionary)certs
{
  return self->_certs;
}

- (NSArray)SEPcerts
{
  return self->_SEPcerts;
}

- (NSData)confirmationBlobHash
{
  return self->_confirmationBlobHash;
}

- (NSData)confirmationBlobSignature
{
  return self->_confirmationBlobSignature;
}

- (int64_t)confirmationBlobVersion
{
  return self->_confirmationBlobVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmationBlobSignature, 0);
  objc_storeStrong((id *)&self->_confirmationBlobHash, 0);
  objc_storeStrong((id *)&self->_SEPcerts, 0);
  objc_storeStrong((id *)&self->_certs, 0);
  objc_storeStrong((id *)&self->_transactionData, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
}

@end