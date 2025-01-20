@interface PKProtobufPaymentTokenContext
- (BOOL)hasAmount;
- (BOOL)hasCustomPrecisionAmount;
- (BOOL)hasDecimalAmount;
- (BOOL)hasExternalIdentifier;
- (BOOL)hasMerchantDomain;
- (BOOL)hasMerchantIdentifier;
- (BOOL)hasMerchantName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)externalIdentifier;
- (NSString)merchantDomain;
- (NSString)merchantIdentifier;
- (NSString)merchantName;
- (PKProtobufCustomPrecisionAmount)customPrecisionAmount;
- (PKProtobufNSDecimalNumber)decimalAmount;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)amount;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAmount:(int64_t)a3;
- (void)setCustomPrecisionAmount:(id)a3;
- (void)setDecimalAmount:(id)a3;
- (void)setExternalIdentifier:(id)a3;
- (void)setHasAmount:(BOOL)a3;
- (void)setMerchantDomain:(id)a3;
- (void)setMerchantIdentifier:(id)a3;
- (void)setMerchantName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufPaymentTokenContext

- (BOOL)hasMerchantIdentifier
{
  return self->_merchantIdentifier != 0;
}

- (BOOL)hasExternalIdentifier
{
  return self->_externalIdentifier != 0;
}

- (BOOL)hasMerchantName
{
  return self->_merchantName != 0;
}

- (BOOL)hasMerchantDomain
{
  return self->_merchantDomain != 0;
}

- (void)setAmount:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_amount = a3;
}

- (void)setHasAmount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAmount
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasCustomPrecisionAmount
{
  return self->_customPrecisionAmount != 0;
}

- (BOOL)hasDecimalAmount
{
  return self->_decimalAmount != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufPaymentTokenContext;
  v4 = [(PKProtobufPaymentTokenContext *)&v8 description];
  v5 = [(PKProtobufPaymentTokenContext *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  merchantIdentifier = self->_merchantIdentifier;
  if (merchantIdentifier) {
    [v3 setObject:merchantIdentifier forKey:@"merchantIdentifier"];
  }
  externalIdentifier = self->_externalIdentifier;
  if (externalIdentifier) {
    [v4 setObject:externalIdentifier forKey:@"externalIdentifier"];
  }
  merchantName = self->_merchantName;
  if (merchantName) {
    [v4 setObject:merchantName forKey:@"merchantName"];
  }
  merchantDomain = self->_merchantDomain;
  if (merchantDomain) {
    [v4 setObject:merchantDomain forKey:@"merchantDomain"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v9 = [NSNumber numberWithLongLong:self->_amount];
    [v4 setObject:v9 forKey:@"amount"];
  }
  customPrecisionAmount = self->_customPrecisionAmount;
  if (customPrecisionAmount)
  {
    v11 = [(PKProtobufCustomPrecisionAmount *)customPrecisionAmount dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"custom_precision_amount"];
  }
  decimalAmount = self->_decimalAmount;
  if (decimalAmount)
  {
    v13 = [(PKProtobufNSDecimalNumber *)decimalAmount dictionaryRepresentation];
    [v4 setObject:v13 forKey:@"decimal_amount"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufPaymentTokenContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_merchantIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_externalIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_merchantName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_merchantDomain)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteSint64Field();
    id v4 = v5;
  }
  if (self->_customPrecisionAmount)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_decimalAmount)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_merchantIdentifier)
  {
    objc_msgSend(v4, "setMerchantIdentifier:");
    id v4 = v5;
  }
  if (self->_externalIdentifier)
  {
    objc_msgSend(v5, "setExternalIdentifier:");
    id v4 = v5;
  }
  if (self->_merchantName)
  {
    objc_msgSend(v5, "setMerchantName:");
    id v4 = v5;
  }
  if (self->_merchantDomain)
  {
    objc_msgSend(v5, "setMerchantDomain:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_amount;
    *((unsigned char *)v4 + 64) |= 1u;
  }
  if (self->_customPrecisionAmount)
  {
    objc_msgSend(v5, "setCustomPrecisionAmount:");
    id v4 = v5;
  }
  if (self->_decimalAmount)
  {
    objc_msgSend(v5, "setDecimalAmount:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_merchantIdentifier copyWithZone:a3];
  v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  uint64_t v8 = [(NSString *)self->_externalIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  uint64_t v10 = [(NSString *)self->_merchantName copyWithZone:a3];
  v11 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v10;

  uint64_t v12 = [(NSString *)self->_merchantDomain copyWithZone:a3];
  v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_amount;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  id v14 = [(PKProtobufCustomPrecisionAmount *)self->_customPrecisionAmount copyWithZone:a3];
  v15 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v14;

  id v16 = [(PKProtobufNSDecimalNumber *)self->_decimalAmount copyWithZone:a3];
  v17 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v16;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  merchantIdentifier = self->_merchantIdentifier;
  if ((unint64_t)merchantIdentifier | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](merchantIdentifier, "isEqual:")) {
      goto LABEL_19;
    }
  }
  externalIdentifier = self->_externalIdentifier;
  if ((unint64_t)externalIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](externalIdentifier, "isEqual:")) {
      goto LABEL_19;
    }
  }
  merchantName = self->_merchantName;
  if ((unint64_t)merchantName | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](merchantName, "isEqual:")) {
      goto LABEL_19;
    }
  }
  merchantDomain = self->_merchantDomain;
  if ((unint64_t)merchantDomain | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](merchantDomain, "isEqual:")) {
      goto LABEL_19;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_amount != *((void *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_19:
    char v11 = 0;
    goto LABEL_20;
  }
  customPrecisionAmount = self->_customPrecisionAmount;
  if ((unint64_t)customPrecisionAmount | *((void *)v4 + 2)
    && !-[PKProtobufCustomPrecisionAmount isEqual:](customPrecisionAmount, "isEqual:"))
  {
    goto LABEL_19;
  }
  decimalAmount = self->_decimalAmount;
  if ((unint64_t)decimalAmount | *((void *)v4 + 3)) {
    char v11 = -[PKProtobufNSDecimalNumber isEqual:](decimalAmount, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_merchantIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_externalIdentifier hash];
  NSUInteger v5 = [(NSString *)self->_merchantName hash];
  NSUInteger v6 = [(NSString *)self->_merchantDomain hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_amount;
  }
  else {
    uint64_t v7 = 0;
  }
  NSUInteger v8 = v4 ^ v3 ^ v5 ^ v6;
  unint64_t v9 = v7 ^ [(PKProtobufCustomPrecisionAmount *)self->_customPrecisionAmount hash];
  return v8 ^ v9 ^ [(PKProtobufNSDecimalNumber *)self->_decimalAmount hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  unint64_t v9 = v4;
  if (v4[6])
  {
    -[PKProtobufPaymentTokenContext setMerchantIdentifier:](self, "setMerchantIdentifier:");
    NSUInteger v4 = v9;
  }
  if (v4[4])
  {
    -[PKProtobufPaymentTokenContext setExternalIdentifier:](self, "setExternalIdentifier:");
    NSUInteger v4 = v9;
  }
  if (v4[7])
  {
    -[PKProtobufPaymentTokenContext setMerchantName:](self, "setMerchantName:");
    NSUInteger v4 = v9;
  }
  if (v4[5])
  {
    -[PKProtobufPaymentTokenContext setMerchantDomain:](self, "setMerchantDomain:");
    NSUInteger v4 = v9;
  }
  if (v4[8])
  {
    self->_amount = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  customPrecisionAmount = self->_customPrecisionAmount;
  uint64_t v6 = v4[2];
  if (customPrecisionAmount)
  {
    if (!v6) {
      goto LABEL_17;
    }
    -[PKProtobufCustomPrecisionAmount mergeFrom:](customPrecisionAmount, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_17;
    }
    -[PKProtobufPaymentTokenContext setCustomPrecisionAmount:](self, "setCustomPrecisionAmount:");
  }
  NSUInteger v4 = v9;
LABEL_17:
  decimalAmount = self->_decimalAmount;
  uint64_t v8 = v4[3];
  if (decimalAmount)
  {
    if (!v8) {
      goto LABEL_23;
    }
    -[PKProtobufNSDecimalNumber mergeFrom:](decimalAmount, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_23;
    }
    -[PKProtobufPaymentTokenContext setDecimalAmount:](self, "setDecimalAmount:");
  }
  NSUInteger v4 = v9;
LABEL_23:
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(id)a3
{
}

- (NSString)externalIdentifier
{
  return self->_externalIdentifier;
}

- (void)setExternalIdentifier:(id)a3
{
}

- (NSString)merchantName
{
  return self->_merchantName;
}

- (void)setMerchantName:(id)a3
{
}

- (NSString)merchantDomain
{
  return self->_merchantDomain;
}

- (void)setMerchantDomain:(id)a3
{
}

- (int64_t)amount
{
  return self->_amount;
}

- (PKProtobufCustomPrecisionAmount)customPrecisionAmount
{
  return self->_customPrecisionAmount;
}

- (void)setCustomPrecisionAmount:(id)a3
{
}

- (PKProtobufNSDecimalNumber)decimalAmount
{
  return self->_decimalAmount;
}

- (void)setDecimalAmount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantName, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
  objc_storeStrong((id *)&self->_merchantDomain, 0);
  objc_storeStrong((id *)&self->_externalIdentifier, 0);
  objc_storeStrong((id *)&self->_decimalAmount, 0);
  objc_storeStrong((id *)&self->_customPrecisionAmount, 0);
}

@end