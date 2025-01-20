@interface NFPeerPaymentResponse
+ (BOOL)supportsSecureCoding;
- (NFPeerPaymentResponse)initWithCoder:(id)a3;
- (NFPeerPaymentResponse)initWithDictionary:(id)a3;
- (NSData)transactionData;
- (NSDictionary)certificates;
- (NSString)transactionIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NFPeerPaymentResponse

- (NFPeerPaymentResponse)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NFPeerPaymentResponse;
  v5 = [(NFPeerPaymentResponse *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"transactionData"];
    transactionData = v5->_transactionData;
    v5->_transactionData = (NSData *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"certificates"];
    certificates = v5->_certificates;
    v5->_certificates = (NSDictionary *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"transactionIdentifier"];
    transactionIdentifier = v5->_transactionIdentifier;
    v5->_transactionIdentifier = (NSString *)v10;
  }
  return v5;
}

- (NFPeerPaymentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NFPeerPaymentResponse;
  v5 = [(NFPeerPaymentResponse *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionData"];
    transactionData = v5->_transactionData;
    v5->_transactionData = (NSData *)v6;

    uint64_t v8 = [MEMORY[0x1E4FBA858] coder:v4 decodeDictOfClass:objc_opt_class() forKey:@"certificates"];
    certificates = v5->_certificates;
    v5->_certificates = (NSDictionary *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionIdentifier"];
    transactionIdentifier = v5->_transactionIdentifier;
    v5->_transactionIdentifier = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_transactionData forKey:@"transactionData"];
  [v5 encodeObject:self->_certificates forKey:@"certificates"];
  transactionIdentifier = self->_transactionIdentifier;
  if (transactionIdentifier) {
    [v5 encodeObject:transactionIdentifier forKey:@"transactionIdentifier"];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)transactionData
{
  return self->_transactionData;
}

- (NSDictionary)certificates
{
  return self->_certificates;
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_transactionData, 0);
}

@end