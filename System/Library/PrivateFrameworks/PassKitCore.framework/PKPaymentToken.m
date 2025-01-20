@interface PKPaymentToken
+ (BOOL)supportsSecureCoding;
+ (PKPaymentToken)paymentTokenWithProtobuf:(id)a3;
+ (id)simulatedTokenForNetwork:(id)a3;
+ (int64_t)version;
- (NSData)paymentData;
- (NSString)paymentInstrumentName;
- (NSString)paymentNetwork;
- (NSString)retryNonce;
- (NSString)transactionIdentifier;
- (NSURL)redeemURL;
- (PKPaymentMethod)paymentMethod;
- (PKPaymentToken)initWithCoder:(id)a3;
- (PKPaymentToken)initWithPaymentMethod:(id)a3 transactionIdentifier:(id)a4 paymentData:(id)a5;
- (id)description;
- (id)dictionaryRepresentation;
- (id)protobuf;
- (void)encodeWithCoder:(id)a3;
- (void)setPaymentData:(id)a3;
- (void)setPaymentInstrumentName:(id)a3;
- (void)setPaymentMethod:(id)a3;
- (void)setPaymentNetwork:(id)a3;
- (void)setRedeemURL:(id)a3;
- (void)setRetryNonce:(id)a3;
- (void)setTransactionIdentifier:(id)a3;
@end

@implementation PKPaymentToken

+ (PKPaymentToken)paymentTokenWithProtobuf:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(PKPaymentToken);
  v5 = [v3 instrumentName];
  [(PKPaymentToken *)v4 setPaymentInstrumentName:v5];

  v6 = [v3 network];
  [(PKPaymentToken *)v4 setPaymentNetwork:v6];

  v7 = [v3 transactionIdentifier];
  [(PKPaymentToken *)v4 setTransactionIdentifier:v7];

  v8 = [v3 paymentData];
  [(PKPaymentToken *)v4 setPaymentData:v8];

  v9 = [v3 paymentMethod];
  v10 = +[PKPaymentMethod paymentMethodWithProtobuf:v9];
  [(PKPaymentToken *)v4 setPaymentMethod:v10];

  v11 = (void *)MEMORY[0x1E4F1CB10];
  v12 = [v3 redeemURL];
  v13 = [v11 URLWithString:v12];
  [(PKPaymentToken *)v4 setRedeemURL:v13];

  v14 = [v3 retryNonce];

  [(PKPaymentToken *)v4 setRetryNonce:v14];
  return v4;
}

- (id)protobuf
{
  id v3 = objc_alloc_init(PKProtobufPaymentToken);
  v4 = [(PKPaymentToken *)self paymentMethod];
  v5 = [v4 displayName];
  [(PKProtobufPaymentToken *)v3 setInstrumentName:v5];

  v6 = [(PKPaymentToken *)self paymentMethod];
  v7 = [v6 network];
  [(PKProtobufPaymentToken *)v3 setNetwork:v7];

  v8 = [(PKPaymentToken *)self transactionIdentifier];
  [(PKProtobufPaymentToken *)v3 setTransactionIdentifier:v8];

  v9 = [(PKPaymentToken *)self paymentData];
  [(PKProtobufPaymentToken *)v3 setPaymentData:v9];

  v10 = [(PKPaymentToken *)self paymentMethod];
  v11 = [v10 protobuf];
  [(PKProtobufPaymentToken *)v3 setPaymentMethod:v11];

  v12 = [(PKPaymentToken *)self redeemURL];
  v13 = [v12 absoluteString];
  [(PKProtobufPaymentToken *)v3 setRedeemURL:v13];

  v14 = [(PKPaymentToken *)self retryNonce];
  [(PKProtobufPaymentToken *)v3 setRetryNonce:v14];

  return v3;
}

+ (int64_t)version
{
  return 4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentToken)initWithPaymentMethod:(id)a3 transactionIdentifier:(id)a4 paymentData:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PKPaymentToken;
  v12 = [(PKPaymentToken *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_paymentMethod, a3);
    uint64_t v14 = [v10 copy];
    transactionIdentifier = v13->_transactionIdentifier;
    v13->_transactionIdentifier = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    paymentData = v13->_paymentData;
    v13->_paymentData = (NSData *)v16;
  }
  return v13;
}

- (PKPaymentToken)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentToken;
  v5 = [(PKPaymentToken *)&v14 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentInstrumentName"];
    [(PKPaymentToken *)v5 setPaymentInstrumentName:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentNetwork"];
    [(PKPaymentToken *)v5 setPaymentNetwork:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionIdentifier"];
    [(PKPaymentToken *)v5 setTransactionIdentifier:v8];

    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentData"];
    [(PKPaymentToken *)v5 setPaymentData:v9];

    id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentMethod"];
    [(PKPaymentToken *)v5 setPaymentMethod:v10];

    id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"redeemURL"];
    [(PKPaymentToken *)v5 setRedeemURL:v11];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"retryNonce"];
    [(PKPaymentToken *)v5 setRetryNonce:v12];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PKPaymentToken *)self paymentInstrumentName];
  [v4 encodeObject:v5 forKey:@"paymentInstrumentName"];

  v6 = [(PKPaymentToken *)self paymentNetwork];
  [v4 encodeObject:v6 forKey:@"paymentNetwork"];

  v7 = [(PKPaymentToken *)self transactionIdentifier];
  [v4 encodeObject:v7 forKey:@"transactionIdentifier"];

  v8 = [(PKPaymentToken *)self paymentData];
  [v4 encodeObject:v8 forKey:@"paymentData"];

  id v9 = [(PKPaymentToken *)self paymentMethod];
  [v4 encodeObject:v9 forKey:@"paymentMethod"];

  id v10 = [(PKPaymentToken *)self redeemURL];
  [v4 encodeObject:v10 forKey:@"redeemURL"];

  id v11 = [(PKPaymentToken *)self retryNonce];
  [v4 encodeObject:v11 forKey:@"retryNonce"];
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = v3;
  if (self->_transactionIdentifier) {
    [v3 appendFormat:@"transactionIdentifier: %@; ", self->_transactionIdentifier];
  }
  paymentData = self->_paymentData;
  if (paymentData) {
    objc_msgSend(v4, "appendFormat:", @"paymentData: %tu bytes", -[NSData length](paymentData, "length"));
  }
  [v4 appendFormat:@">"];
  v6 = (void *)[v4 copy];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = v3;
  transactionIdentifier = self->_transactionIdentifier;
  if (transactionIdentifier) {
    [v3 setObject:transactionIdentifier forKeyedSubscript:@"transactionIdentifier"];
  }
  if (self->_paymentData)
  {
    v6 = (void *)[[NSString alloc] initWithData:self->_paymentData encoding:4];
    [v4 setObject:v6 forKeyedSubscript:@"paymentData"];
  }
  paymentMethod = self->_paymentMethod;
  if (paymentMethod)
  {
    v8 = [(PKPaymentMethod *)paymentMethod dictionaryRepresentation];
    [v4 setObject:v8 forKeyedSubscript:@"paymentMethod"];
  }
  id v9 = (void *)[v4 copy];

  return v9;
}

+ (id)simulatedTokenForNetwork:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(PKPaymentToken);
  [(PKPaymentToken *)v4 setPaymentInstrumentName:@"Simulated Instrument"];
  [(PKPaymentToken *)v4 setPaymentNetwork:v3];
  [(PKPaymentToken *)v4 setTransactionIdentifier:@"Simulated Identifier"];
  v5 = [MEMORY[0x1E4F1C9B8] data];
  [(PKPaymentToken *)v4 setPaymentData:v5];

  v6 = objc_alloc_init(PKPaymentMethod);
  [(PKPaymentMethod *)v6 setDisplayName:@"Simulated Instrument"];
  [(PKPaymentMethod *)v6 setType:0];
  [(PKPaymentMethod *)v6 setNetwork:v3];

  [(PKPaymentToken *)v4 setPaymentMethod:v6];
  return v4;
}

- (PKPaymentMethod)paymentMethod
{
  return self->_paymentMethod;
}

- (void)setPaymentMethod:(id)a3
{
}

- (NSString)paymentInstrumentName
{
  return self->_paymentInstrumentName;
}

- (void)setPaymentInstrumentName:(id)a3
{
}

- (NSString)paymentNetwork
{
  return self->_paymentNetwork;
}

- (void)setPaymentNetwork:(id)a3
{
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (void)setTransactionIdentifier:(id)a3
{
}

- (NSData)paymentData
{
  return self->_paymentData;
}

- (void)setPaymentData:(id)a3
{
}

- (NSURL)redeemURL
{
  return self->_redeemURL;
}

- (void)setRedeemURL:(id)a3
{
}

- (NSString)retryNonce
{
  return self->_retryNonce;
}

- (void)setRetryNonce:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryNonce, 0);
  objc_storeStrong((id *)&self->_redeemURL, 0);
  objc_storeStrong((id *)&self->_paymentData, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentNetwork, 0);
  objc_storeStrong((id *)&self->_paymentInstrumentName, 0);
  objc_storeStrong((id *)&self->_paymentMethod, 0);
}

@end