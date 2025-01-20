@interface STSPaymentResponseBase
+ (BOOL)supportsSecureCoding;
- (NSData)transactionData;
- (NSDictionary)certificates;
- (NSString)transactionIdentifier;
- (STSPaymentResponseBase)initWithCoder:(id)a3;
- (id)initFromNFECommercePaymentResponse:(id)a3;
- (id)initFromNFPeerPaymentResponse:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STSPaymentResponseBase

- (id)initFromNFECommercePaymentResponse:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STSPaymentResponseBase;
  v5 = [(STSPaymentResponseBase *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 transactionIdentifier];
    transactionIdentifier = v5->_transactionIdentifier;
    v5->_transactionIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 transactionData];
    transactionData = v5->_transactionData;
    v5->_transactionData = (NSData *)v8;

    uint64_t v10 = [v4 certs];
    certificates = v5->_certificates;
    v5->_certificates = (NSDictionary *)v10;
  }
  return v5;
}

- (id)initFromNFPeerPaymentResponse:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STSPaymentResponseBase;
  v5 = [(STSPaymentResponseBase *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 transactionData];
    transactionData = v5->_transactionData;
    v5->_transactionData = (NSData *)v6;

    uint64_t v8 = [v4 transactionIdentifier];
    transactionIdentifier = v5->_transactionIdentifier;
    v5->_transactionIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 certificates];
    certificates = v5->_certificates;
    v5->_certificates = (NSDictionary *)v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STSPaymentResponseBase)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)STSPaymentResponseBase;
  v5 = [(STSPaymentResponseBase *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionIdentifier"];
    transactionIdentifier = v5->_transactionIdentifier;
    v5->_transactionIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionData"];
    transactionData = v5->_transactionData;
    v5->_transactionData = (NSData *)v8;

    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [v4 decodeDictionaryWithKeysOfClass:v10 objectsOfClass:objc_opt_class() forKey:@"certs"];
    certificates = v5->_certificates;
    v5->_certificates = (NSDictionary *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  transactionIdentifier = self->_transactionIdentifier;
  id v5 = a3;
  [v5 encodeObject:transactionIdentifier forKey:@"transactionIdentifier"];
  [v5 encodeObject:self->_transactionData forKey:@"transactionData"];
  [v5 encodeObject:self->_certificates forKey:@"certs"];
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (NSData)transactionData
{
  return self->_transactionData;
}

- (NSDictionary)certificates
{
  return self->_certificates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_transactionData, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
}

@end