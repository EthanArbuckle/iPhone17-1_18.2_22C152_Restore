@interface STSPeerPaymentTransferRequest
+ (BOOL)supportsSecureCoding;
- (NSData)nonce;
- (NSString)appleTransactionHash;
- (NSString)publicTransactionHash;
- (STSPeerPaymentTransferRequest)init;
- (STSPeerPaymentTransferRequest)initWithCoder:(id)a3;
- (STSPeerPaymentTransferRequest)initWithTransactionAmount:(id)a3 currencyCode:(id)a4 countryCode:(id)a5 transactionDate:(id)a6 appleTransactionHash:(id)a7 publicTransactionHash:(id)a8 nonce:(id)a9;
- (id)description;
- (id)toNFPeerPaymentTransferRequest;
- (void)encodeWithCoder:(id)a3;
- (void)setAppleTransactionHash:(id)a3;
- (void)setNonce:(id)a3;
- (void)setPublicTransactionHash:(id)a3;
@end

@implementation STSPeerPaymentTransferRequest

- (STSPeerPaymentTransferRequest)initWithTransactionAmount:(id)a3 currencyCode:(id)a4 countryCode:(id)a5 transactionDate:(id)a6 appleTransactionHash:(id)a7 publicTransactionHash:(id)a8 nonce:(id)a9
{
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v22.receiver = self;
  v22.super_class = (Class)STSPeerPaymentTransferRequest;
  v18 = [(STSPaymentRequestBase *)&v22 initWithTransactionAmount:a3 currencyCode:a4 countryCode:a5 transactionDate:a6];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_nonce, a9);
    objc_storeStrong((id *)&v19->_appleTransactionHash, a7);
    objc_storeStrong((id *)&v19->_publicTransactionHash, a8);
  }

  return v19;
}

- (id)description
{
  v3 = NSString;
  v4 = [(STSPaymentRequestBase *)self transactionAmount];
  appleTransactionHash = self->_appleTransactionHash;
  publicTransactionHash = self->_publicTransactionHash;
  v7 = [(STSPaymentRequestBase *)self transactionDate];
  v8 = [(STSPaymentRequestBase *)self currencyCode];
  v9 = [(STSPaymentRequestBase *)self countryCode];
  v10 = [v3 stringWithFormat:@"STSPeerPaymentTransferRequest { transactionAmount=%@ appleTransactionHash=%@ publicTransactionHash=%@ transactionDate=%@ transactionCurrency=%@ transactionCountry=%@ nonce=%@}", v4, appleTransactionHash, publicTransactionHash, v7, v8, v9, self->_nonce];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STSPeerPaymentTransferRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)STSPeerPaymentTransferRequest;
  return [(STSPeerPaymentTransferRequest *)&v3 init];
}

- (STSPeerPaymentTransferRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STSPeerPaymentTransferRequest;
  v5 = [(STSPaymentRequestBase *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transferAppleTransactionHash"];
    appleTransactionHash = v5->_appleTransactionHash;
    v5->_appleTransactionHash = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transferPublicTransactionHash"];
    publicTransactionHash = v5->_publicTransactionHash;
    v5->_publicTransactionHash = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transferNonce"];
    nonce = v5->_nonce;
    v5->_nonce = (NSData *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STSPeerPaymentTransferRequest;
  id v4 = a3;
  [(STSPaymentRequestBase *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_appleTransactionHash, @"transferAppleTransactionHash", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_publicTransactionHash forKey:@"transferPublicTransactionHash"];
  [v4 encodeObject:self->_nonce forKey:@"transferNonce"];
}

- (id)toNFPeerPaymentTransferRequest
{
  id v3 = objc_alloc_init(MEMORY[0x263F58128]);
  id v4 = [(STSPaymentRequestBase *)self transactionAmount];
  [v3 setTransactionAmount:v4];

  objc_super v5 = [(STSPaymentRequestBase *)self transactionDate];
  [v3 setTransactionDate:v5];

  uint64_t v6 = [(STSPaymentRequestBase *)self currencyCode];
  [v3 setTransactionCurrency:v6];

  v7 = [(STSPaymentRequestBase *)self countryCode];
  [v3 setTransactionCountry:v7];

  [v3 setAppleTransactionHash:self->_appleTransactionHash];
  [v3 setPublicTransactionHash:self->_publicTransactionHash];
  [v3 setNonce:self->_nonce];
  return v3;
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
  objc_storeStrong((id *)&self->_publicTransactionHash, 0);
  objc_storeStrong((id *)&self->_appleTransactionHash, 0);
}

@end