@interface NFPeerPaymentTransferRequest
+ (BOOL)supportsSecureCoding;
- (NFPeerPaymentTransferRequest)initWithCoder:(id)a3;
- (NFPeerPaymentTransferRequest)initWithDictionary:(id)a3;
- (NSData)nonce;
- (NSDate)transactionDate;
- (NSDecimalNumber)transactionAmount;
- (NSString)appleTransactionHash;
- (NSString)publicTransactionHash;
- (NSString)transactionCountry;
- (NSString)transactionCurrency;
- (void)encodeWithCoder:(id)a3;
- (void)setAppleTransactionHash:(id)a3;
- (void)setNonce:(id)a3;
- (void)setPublicTransactionHash:(id)a3;
- (void)setTransactionAmount:(id)a3;
- (void)setTransactionCountry:(id)a3;
- (void)setTransactionCurrency:(id)a3;
- (void)setTransactionDate:(id)a3;
@end

@implementation NFPeerPaymentTransferRequest

- (NFPeerPaymentTransferRequest)initWithDictionary:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NFPeerPaymentTransferRequest;
  v5 = [(NFPeerPaymentTransferRequest *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"transferAmount"];
    transactionAmount = v5->_transactionAmount;
    v5->_transactionAmount = (NSDecimalNumber *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"transferAppleTransactionHash"];
    appleTransactionHash = v5->_appleTransactionHash;
    v5->_appleTransactionHash = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"transferPublicTransactionHash"];
    publicTransactionHash = v5->_publicTransactionHash;
    v5->_publicTransactionHash = (NSString *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"transferDate"];
    transactionDate = v5->_transactionDate;
    v5->_transactionDate = (NSDate *)v12;

    uint64_t v14 = [v4 objectForKeyedSubscript:@"transferCurrency"];
    transactionCurrency = v5->_transactionCurrency;
    v5->_transactionCurrency = (NSString *)v14;

    uint64_t v16 = [v4 objectForKeyedSubscript:@"transferCountry"];
    transactionCountry = v5->_transactionCountry;
    v5->_transactionCountry = (NSString *)v16;

    uint64_t v18 = [v4 objectForKeyedSubscript:@"transferNonce"];
    nonce = v5->_nonce;
    v5->_nonce = (NSData *)v18;
  }
  return v5;
}

- (NFPeerPaymentTransferRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NFPeerPaymentTransferRequest;
  v5 = [(NFPeerPaymentTransferRequest *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transferAmount"];
    transactionAmount = v5->_transactionAmount;
    v5->_transactionAmount = (NSDecimalNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transferAppleTransactionHash"];
    appleTransactionHash = v5->_appleTransactionHash;
    v5->_appleTransactionHash = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transferPublicTransactionHash"];
    publicTransactionHash = v5->_publicTransactionHash;
    v5->_publicTransactionHash = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transferDate"];
    transactionDate = v5->_transactionDate;
    v5->_transactionDate = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transferCurrency"];
    transactionCurrency = v5->_transactionCurrency;
    v5->_transactionCurrency = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transferCountry"];
    transactionCountry = v5->_transactionCountry;
    v5->_transactionCountry = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transferNonce"];
    nonce = v5->_nonce;
    v5->_nonce = (NSData *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  transactionAmount = self->_transactionAmount;
  id v5 = a3;
  [v5 encodeObject:transactionAmount forKey:@"transferAmount"];
  [v5 encodeObject:self->_appleTransactionHash forKey:@"transferAppleTransactionHash"];
  [v5 encodeObject:self->_publicTransactionHash forKey:@"transferPublicTransactionHash"];
  [v5 encodeObject:self->_transactionDate forKey:@"transferDate"];
  [v5 encodeObject:self->_transactionCurrency forKey:@"transferCurrency"];
  [v5 encodeObject:self->_transactionCountry forKey:@"transferCountry"];
  [v5 encodeObject:self->_nonce forKey:@"transferNonce"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDecimalNumber)transactionAmount
{
  return self->_transactionAmount;
}

- (void)setTransactionAmount:(id)a3
{
}

- (NSString)appleTransactionHash
{
  return self->_appleTransactionHash;
}

- (void)setAppleTransactionHash:(id)a3
{
}

- (NSString)publicTransactionHash
{
  return self->_publicTransactionHash;
}

- (void)setPublicTransactionHash:(id)a3
{
}

- (NSDate)transactionDate
{
  return self->_transactionDate;
}

- (void)setTransactionDate:(id)a3
{
}

- (NSString)transactionCurrency
{
  return self->_transactionCurrency;
}

- (void)setTransactionCurrency:(id)a3
{
}

- (NSString)transactionCountry
{
  return self->_transactionCountry;
}

- (void)setTransactionCountry:(id)a3
{
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_transactionCountry, 0);
  objc_storeStrong((id *)&self->_transactionCurrency, 0);
  objc_storeStrong((id *)&self->_transactionDate, 0);
  objc_storeStrong((id *)&self->_publicTransactionHash, 0);
  objc_storeStrong((id *)&self->_appleTransactionHash, 0);
  objc_storeStrong((id *)&self->_transactionAmount, 0);
}

@end