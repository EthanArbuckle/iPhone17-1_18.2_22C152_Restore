@interface PKProtobufPaymentToken
- (BOOL)hasInstrumentName;
- (BOOL)hasNetwork;
- (BOOL)hasPaymentData;
- (BOOL)hasPaymentMethod;
- (BOOL)hasRedeemURL;
- (BOOL)hasRetryNonce;
- (BOOL)hasTransactionIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)paymentData;
- (NSString)instrumentName;
- (NSString)network;
- (NSString)redeemURL;
- (NSString)retryNonce;
- (NSString)transactionIdentifier;
- (PKProtobufPaymentMethod)paymentMethod;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setInstrumentName:(id)a3;
- (void)setNetwork:(id)a3;
- (void)setPaymentData:(id)a3;
- (void)setPaymentMethod:(id)a3;
- (void)setRedeemURL:(id)a3;
- (void)setRetryNonce:(id)a3;
- (void)setTransactionIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufPaymentToken

- (BOOL)hasPaymentMethod
{
  return self->_paymentMethod != 0;
}

- (BOOL)hasInstrumentName
{
  return self->_instrumentName != 0;
}

- (BOOL)hasNetwork
{
  return self->_network != 0;
}

- (BOOL)hasTransactionIdentifier
{
  return self->_transactionIdentifier != 0;
}

- (BOOL)hasPaymentData
{
  return self->_paymentData != 0;
}

- (BOOL)hasRedeemURL
{
  return self->_redeemURL != 0;
}

- (BOOL)hasRetryNonce
{
  return self->_retryNonce != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufPaymentToken;
  v4 = [(PKProtobufPaymentToken *)&v8 description];
  v5 = [(PKProtobufPaymentToken *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  paymentMethod = self->_paymentMethod;
  if (paymentMethod)
  {
    v5 = [(PKProtobufPaymentMethod *)paymentMethod dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"paymentMethod"];
  }
  instrumentName = self->_instrumentName;
  if (instrumentName) {
    [v3 setObject:instrumentName forKey:@"instrumentName"];
  }
  network = self->_network;
  if (network) {
    [v3 setObject:network forKey:@"network"];
  }
  transactionIdentifier = self->_transactionIdentifier;
  if (transactionIdentifier) {
    [v3 setObject:transactionIdentifier forKey:@"transactionIdentifier"];
  }
  paymentData = self->_paymentData;
  if (paymentData) {
    [v3 setObject:paymentData forKey:@"paymentData"];
  }
  redeemURL = self->_redeemURL;
  if (redeemURL) {
    [v3 setObject:redeemURL forKey:@"redeemURL"];
  }
  retryNonce = self->_retryNonce;
  if (retryNonce) {
    [v3 setObject:retryNonce forKey:@"retryNonce"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufPaymentTokenReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_paymentMethod)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_instrumentName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_network)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_transactionIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_paymentData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_redeemURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_retryNonce)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_paymentMethod)
  {
    objc_msgSend(v4, "setPaymentMethod:");
    id v4 = v5;
  }
  if (self->_instrumentName)
  {
    objc_msgSend(v5, "setInstrumentName:");
    id v4 = v5;
  }
  if (self->_network)
  {
    objc_msgSend(v5, "setNetwork:");
    id v4 = v5;
  }
  if (self->_transactionIdentifier)
  {
    objc_msgSend(v5, "setTransactionIdentifier:");
    id v4 = v5;
  }
  if (self->_paymentData)
  {
    objc_msgSend(v5, "setPaymentData:");
    id v4 = v5;
  }
  if (self->_redeemURL)
  {
    objc_msgSend(v5, "setRedeemURL:");
    id v4 = v5;
  }
  if (self->_retryNonce)
  {
    objc_msgSend(v5, "setRetryNonce:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(PKProtobufPaymentMethod *)self->_paymentMethod copyWithZone:a3];
  v7 = (void *)v5[4];
  v5[4] = v6;

  uint64_t v8 = [(NSString *)self->_instrumentName copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  uint64_t v10 = [(NSString *)self->_network copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  uint64_t v12 = [(NSString *)self->_transactionIdentifier copyWithZone:a3];
  v13 = (void *)v5[7];
  v5[7] = v12;

  uint64_t v14 = [(NSData *)self->_paymentData copyWithZone:a3];
  v15 = (void *)v5[3];
  v5[3] = v14;

  uint64_t v16 = [(NSString *)self->_redeemURL copyWithZone:a3];
  v17 = (void *)v5[5];
  v5[5] = v16;

  uint64_t v18 = [(NSString *)self->_retryNonce copyWithZone:a3];
  v19 = (void *)v5[6];
  v5[6] = v18;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((paymentMethod = self->_paymentMethod, !((unint64_t)paymentMethod | v4[4]))
     || -[PKProtobufPaymentMethod isEqual:](paymentMethod, "isEqual:"))
    && ((instrumentName = self->_instrumentName, !((unint64_t)instrumentName | v4[1]))
     || -[NSString isEqual:](instrumentName, "isEqual:"))
    && ((network = self->_network, !((unint64_t)network | v4[2]))
     || -[NSString isEqual:](network, "isEqual:"))
    && ((transactionIdentifier = self->_transactionIdentifier, !((unint64_t)transactionIdentifier | v4[7]))
     || -[NSString isEqual:](transactionIdentifier, "isEqual:"))
    && ((paymentData = self->_paymentData, !((unint64_t)paymentData | v4[3]))
     || -[NSData isEqual:](paymentData, "isEqual:"))
    && ((redeemURL = self->_redeemURL, !((unint64_t)redeemURL | v4[5]))
     || -[NSString isEqual:](redeemURL, "isEqual:")))
  {
    retryNonce = self->_retryNonce;
    if ((unint64_t)retryNonce | v4[6]) {
      char v12 = -[NSString isEqual:](retryNonce, "isEqual:");
    }
    else {
      char v12 = 1;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PKProtobufPaymentMethod *)self->_paymentMethod hash];
  NSUInteger v4 = [(NSString *)self->_instrumentName hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_network hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_transactionIdentifier hash];
  uint64_t v7 = [(NSData *)self->_paymentData hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_redeemURL hash];
  return v6 ^ v8 ^ [(NSString *)self->_retryNonce hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  paymentMethod = self->_paymentMethod;
  uint64_t v7 = v4;
  uint64_t v6 = v4[4];
  if (paymentMethod)
  {
    if (v6) {
      -[PKProtobufPaymentMethod mergeFrom:](paymentMethod, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[PKProtobufPaymentToken setPaymentMethod:](self, "setPaymentMethod:");
  }
  if (v7[1]) {
    -[PKProtobufPaymentToken setInstrumentName:](self, "setInstrumentName:");
  }
  if (v7[2]) {
    -[PKProtobufPaymentToken setNetwork:](self, "setNetwork:");
  }
  if (v7[7]) {
    -[PKProtobufPaymentToken setTransactionIdentifier:](self, "setTransactionIdentifier:");
  }
  if (v7[3]) {
    -[PKProtobufPaymentToken setPaymentData:](self, "setPaymentData:");
  }
  if (v7[5]) {
    -[PKProtobufPaymentToken setRedeemURL:](self, "setRedeemURL:");
  }
  if (v7[6]) {
    -[PKProtobufPaymentToken setRetryNonce:](self, "setRetryNonce:");
  }
}

- (PKProtobufPaymentMethod)paymentMethod
{
  return self->_paymentMethod;
}

- (void)setPaymentMethod:(id)a3
{
}

- (NSString)instrumentName
{
  return self->_instrumentName;
}

- (void)setInstrumentName:(id)a3
{
}

- (NSString)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
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

- (NSString)redeemURL
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
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_retryNonce, 0);
  objc_storeStrong((id *)&self->_redeemURL, 0);
  objc_storeStrong((id *)&self->_paymentMethod, 0);
  objc_storeStrong((id *)&self->_paymentData, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_instrumentName, 0);
}

@end