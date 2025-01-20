@interface NPKProtoRemotePassActionEnterValueRequest
- (BOOL)hasPaymentPassActionData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)paymentPassActionData;
- (NSString)balanceIdentifier;
- (NSString)balanceLabel;
- (NSString)currentBalanceCurrency;
- (NSString)requestUniqueID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)currentBalanceAmount;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBalanceIdentifier:(id)a3;
- (void)setBalanceLabel:(id)a3;
- (void)setCurrentBalanceAmount:(int64_t)a3;
- (void)setCurrentBalanceCurrency:(id)a3;
- (void)setPaymentPassActionData:(id)a3;
- (void)setRequestUniqueID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoRemotePassActionEnterValueRequest

- (BOOL)hasPaymentPassActionData
{
  return self->_paymentPassActionData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoRemotePassActionEnterValueRequest;
  v4 = [(NPKProtoRemotePassActionEnterValueRequest *)&v8 description];
  v5 = [(NPKProtoRemotePassActionEnterValueRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  requestUniqueID = self->_requestUniqueID;
  if (requestUniqueID) {
    [v3 setObject:requestUniqueID forKey:@"requestUniqueID"];
  }
  balanceIdentifier = self->_balanceIdentifier;
  if (balanceIdentifier) {
    [v4 setObject:balanceIdentifier forKey:@"balanceIdentifier"];
  }
  balanceLabel = self->_balanceLabel;
  if (balanceLabel) {
    [v4 setObject:balanceLabel forKey:@"balanceLabel"];
  }
  currentBalanceCurrency = self->_currentBalanceCurrency;
  if (currentBalanceCurrency) {
    [v4 setObject:currentBalanceCurrency forKey:@"currentBalanceCurrency"];
  }
  v9 = [NSNumber numberWithLongLong:self->_currentBalanceAmount];
  [v4 setObject:v9 forKey:@"currentBalanceAmount"];

  paymentPassActionData = self->_paymentPassActionData;
  if (paymentPassActionData) {
    [v4 setObject:paymentPassActionData forKey:@"paymentPassActionData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoRemotePassActionEnterValueRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_requestUniqueID) {
    -[NPKProtoRemotePassActionEnterValueRequest writeTo:]();
  }
  PBDataWriterWriteStringField();
  if (!self->_balanceIdentifier) {
    -[NPKProtoRemotePassActionEnterValueRequest writeTo:]();
  }
  PBDataWriterWriteStringField();
  if (!self->_balanceLabel) {
    -[NPKProtoRemotePassActionEnterValueRequest writeTo:]();
  }
  PBDataWriterWriteStringField();
  if (!self->_currentBalanceCurrency) {
    -[NPKProtoRemotePassActionEnterValueRequest writeTo:].cold.4();
  }
  PBDataWriterWriteStringField();
  PBDataWriterWriteSint64Field();
  if (self->_paymentPassActionData) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  v5 = a3;
  [v5 setRequestUniqueID:self->_requestUniqueID];
  [v5 setBalanceIdentifier:self->_balanceIdentifier];
  [v5 setBalanceLabel:self->_balanceLabel];
  [v5 setCurrentBalanceCurrency:self->_currentBalanceCurrency];
  id v4 = v5;
  v5[1] = self->_currentBalanceAmount;
  if (self->_paymentPassActionData)
  {
    objc_msgSend(v5, "setPaymentPassActionData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_requestUniqueID copyWithZone:a3];
  v7 = (void *)v5[6];
  v5[6] = v6;

  uint64_t v8 = [(NSString *)self->_balanceIdentifier copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_balanceLabel copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  uint64_t v12 = [(NSString *)self->_currentBalanceCurrency copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  v5[1] = self->_currentBalanceAmount;
  uint64_t v14 = [(NSData *)self->_paymentPassActionData copyWithZone:a3];
  v15 = (void *)v5[5];
  v5[5] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((requestUniqueID = self->_requestUniqueID, !((unint64_t)requestUniqueID | v4[6]))
     || -[NSString isEqual:](requestUniqueID, "isEqual:"))
    && ((balanceIdentifier = self->_balanceIdentifier, !((unint64_t)balanceIdentifier | v4[2]))
     || -[NSString isEqual:](balanceIdentifier, "isEqual:"))
    && ((balanceLabel = self->_balanceLabel, !((unint64_t)balanceLabel | v4[3]))
     || -[NSString isEqual:](balanceLabel, "isEqual:"))
    && ((currentBalanceCurrency = self->_currentBalanceCurrency, !((unint64_t)currentBalanceCurrency | v4[4]))
     || -[NSString isEqual:](currentBalanceCurrency, "isEqual:"))
    && self->_currentBalanceAmount == v4[1])
  {
    paymentPassActionData = self->_paymentPassActionData;
    if ((unint64_t)paymentPassActionData | v4[5]) {
      char v10 = -[NSData isEqual:](paymentPassActionData, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_requestUniqueID hash];
  NSUInteger v4 = [(NSString *)self->_balanceIdentifier hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_balanceLabel hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_currentBalanceCurrency hash];
  uint64_t v7 = 2654435761 * self->_currentBalanceAmount;
  return v6 ^ [(NSData *)self->_paymentPassActionData hash] ^ v7;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (int64_t *)a3;
  if (v4[6]) {
    -[NPKProtoRemotePassActionEnterValueRequest setRequestUniqueID:](self, "setRequestUniqueID:");
  }
  if (v4[2]) {
    -[NPKProtoRemotePassActionEnterValueRequest setBalanceIdentifier:](self, "setBalanceIdentifier:");
  }
  if (v4[3]) {
    -[NPKProtoRemotePassActionEnterValueRequest setBalanceLabel:](self, "setBalanceLabel:");
  }
  if (v4[4]) {
    -[NPKProtoRemotePassActionEnterValueRequest setCurrentBalanceCurrency:](self, "setCurrentBalanceCurrency:");
  }
  self->_currentBalanceAmount = v4[1];
  if (v4[5]) {
    -[NPKProtoRemotePassActionEnterValueRequest setPaymentPassActionData:](self, "setPaymentPassActionData:");
  }
}

- (NSString)requestUniqueID
{
  return self->_requestUniqueID;
}

- (void)setRequestUniqueID:(id)a3
{
}

- (NSString)balanceIdentifier
{
  return self->_balanceIdentifier;
}

- (void)setBalanceIdentifier:(id)a3
{
}

- (NSString)balanceLabel
{
  return self->_balanceLabel;
}

- (void)setBalanceLabel:(id)a3
{
}

- (NSString)currentBalanceCurrency
{
  return self->_currentBalanceCurrency;
}

- (void)setCurrentBalanceCurrency:(id)a3
{
}

- (int64_t)currentBalanceAmount
{
  return self->_currentBalanceAmount;
}

- (void)setCurrentBalanceAmount:(int64_t)a3
{
  self->_currentBalanceAmount = a3;
}

- (NSData)paymentPassActionData
{
  return self->_paymentPassActionData;
}

- (void)setPaymentPassActionData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestUniqueID, 0);
  objc_storeStrong((id *)&self->_paymentPassActionData, 0);
  objc_storeStrong((id *)&self->_currentBalanceCurrency, 0);
  objc_storeStrong((id *)&self->_balanceLabel, 0);
  objc_storeStrong((id *)&self->_balanceIdentifier, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoRemotePassActionEnterValueRequest writeTo:]", "NPKProtoRemotePassActionEnterValueRequest.m", 127, "nil != self->_requestUniqueID");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[NPKProtoRemotePassActionEnterValueRequest writeTo:]", "NPKProtoRemotePassActionEnterValueRequest.m", 132, "nil != self->_balanceIdentifier");
}

- (void)writeTo:.cold.3()
{
  __assert_rtn("-[NPKProtoRemotePassActionEnterValueRequest writeTo:]", "NPKProtoRemotePassActionEnterValueRequest.m", 137, "nil != self->_balanceLabel");
}

- (void)writeTo:.cold.4()
{
  __assert_rtn("-[NPKProtoRemotePassActionEnterValueRequest writeTo:]", "NPKProtoRemotePassActionEnterValueRequest.m", 142, "nil != self->_currentBalanceCurrency");
}

@end