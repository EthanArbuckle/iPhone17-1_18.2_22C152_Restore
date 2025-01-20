@interface PKProtobufShippingMethod
- (BOOL)hasAmount;
- (BOOL)hasCustomPrecisionAmount;
- (BOOL)hasDecimalAmount;
- (BOOL)hasDetail;
- (BOOL)hasIdentifier;
- (BOOL)hasLabel;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)detail;
- (NSString)identifier;
- (NSString)label;
- (PKProtobufCustomPrecisionAmount)customPrecisionAmount;
- (PKProtobufNSDecimalNumber)decimalAmount;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)amount;
- (unint64_t)hash;
- (unsigned)type;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAmount:(int64_t)a3;
- (void)setCustomPrecisionAmount:(id)a3;
- (void)setDecimalAmount:(id)a3;
- (void)setDetail:(id)a3;
- (void)setHasAmount:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setLabel:(id)a3;
- (void)setType:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufShippingMethod

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

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (void)setType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasDetail
{
  return self->_detail != 0;
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
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufShippingMethod;
  v4 = [(PKProtobufShippingMethod *)&v8 description];
  v5 = [(PKProtobufShippingMethod *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithLongLong:self->_amount];
    [v3 setObject:v4 forKey:@"amount"];
  }
  label = self->_label;
  if (label) {
    [v3 setObject:label forKey:@"label"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v6 = [NSNumber numberWithUnsignedInt:self->_type];
    [v3 setObject:v6 forKey:@"type"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  detail = self->_detail;
  if (detail) {
    [v3 setObject:detail forKey:@"detail"];
  }
  customPrecisionAmount = self->_customPrecisionAmount;
  if (customPrecisionAmount)
  {
    v10 = [(PKProtobufCustomPrecisionAmount *)customPrecisionAmount dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"custom_precision_amount"];
  }
  decimalAmount = self->_decimalAmount;
  if (decimalAmount)
  {
    v12 = [(PKProtobufNSDecimalNumber *)decimalAmount dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"decimal_amount"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufShippingMethodReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteSint64Field();
    id v4 = v5;
  }
  if (self->_label)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_detail)
  {
    PBDataWriterWriteStringField();
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
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_amount;
    *((unsigned char *)v4 + 60) |= 1u;
  }
  id v5 = v4;
  if (self->_label)
  {
    objc_msgSend(v4, "setLabel:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_type;
    *((unsigned char *)v4 + 60) |= 2u;
  }
  if (self->_identifier)
  {
    objc_msgSend(v5, "setIdentifier:");
    id v4 = v5;
  }
  if (self->_detail)
  {
    objc_msgSend(v5, "setDetail:");
    id v4 = v5;
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
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_amount;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_label copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v7;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 56) = self->_type;
    *(unsigned char *)(v6 + 60) |= 2u;
  }
  uint64_t v9 = [(NSString *)self->_identifier copyWithZone:a3];
  v10 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v9;

  uint64_t v11 = [(NSString *)self->_detail copyWithZone:a3];
  v12 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v11;

  id v13 = [(PKProtobufCustomPrecisionAmount *)self->_customPrecisionAmount copyWithZone:a3];
  v14 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v13;

  id v15 = [(PKProtobufNSDecimalNumber *)self->_decimalAmount copyWithZone:a3];
  v16 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v15;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 60);
  if (has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_amount != *((void *)v4 + 1)) {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_23;
  }
  label = self->_label;
  if ((unint64_t)label | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](label, "isEqual:"))
    {
LABEL_23:
      char v12 = 0;
      goto LABEL_24;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 60);
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_type != *((_DWORD *)v4 + 14)) {
      goto LABEL_23;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_23;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 5) && !-[NSString isEqual:](identifier, "isEqual:")) {
    goto LABEL_23;
  }
  detail = self->_detail;
  if ((unint64_t)detail | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](detail, "isEqual:")) {
      goto LABEL_23;
    }
  }
  customPrecisionAmount = self->_customPrecisionAmount;
  if ((unint64_t)customPrecisionAmount | *((void *)v4 + 2))
  {
    if (!-[PKProtobufCustomPrecisionAmount isEqual:](customPrecisionAmount, "isEqual:")) {
      goto LABEL_23;
    }
  }
  decimalAmount = self->_decimalAmount;
  if ((unint64_t)decimalAmount | *((void *)v4 + 3)) {
    char v12 = -[PKProtobufNSDecimalNumber isEqual:](decimalAmount, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_24:

  return v12;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_amount;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_label hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_type;
  }
  else {
    uint64_t v5 = 0;
  }
  NSUInteger v6 = v4 ^ v3 ^ v5;
  NSUInteger v7 = [(NSString *)self->_identifier hash];
  NSUInteger v8 = v6 ^ v7 ^ [(NSString *)self->_detail hash];
  unint64_t v9 = [(PKProtobufCustomPrecisionAmount *)self->_customPrecisionAmount hash];
  return v8 ^ v9 ^ [(PKProtobufNSDecimalNumber *)self->_decimalAmount hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  uint64_t v5 = v4;
  if (*((unsigned char *)v4 + 60))
  {
    self->_amount = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  v10 = v4;
  if (v4[6])
  {
    -[PKProtobufShippingMethod setLabel:](self, "setLabel:");
    uint64_t v5 = v10;
  }
  if ((v5[15] & 2) != 0)
  {
    self->_type = v5[14];
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v5 + 5))
  {
    -[PKProtobufShippingMethod setIdentifier:](self, "setIdentifier:");
    uint64_t v5 = v10;
  }
  if (*((void *)v5 + 4))
  {
    -[PKProtobufShippingMethod setDetail:](self, "setDetail:");
    uint64_t v5 = v10;
  }
  customPrecisionAmount = self->_customPrecisionAmount;
  uint64_t v7 = *((void *)v5 + 2);
  if (customPrecisionAmount)
  {
    if (!v7) {
      goto LABEL_17;
    }
    -[PKProtobufCustomPrecisionAmount mergeFrom:](customPrecisionAmount, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_17;
    }
    -[PKProtobufShippingMethod setCustomPrecisionAmount:](self, "setCustomPrecisionAmount:");
  }
  uint64_t v5 = v10;
LABEL_17:
  decimalAmount = self->_decimalAmount;
  uint64_t v9 = *((void *)v5 + 3);
  if (decimalAmount)
  {
    if (!v9) {
      goto LABEL_23;
    }
    -[PKProtobufNSDecimalNumber mergeFrom:](decimalAmount, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_23;
    }
    -[PKProtobufShippingMethod setDecimalAmount:](self, "setDecimalAmount:");
  }
  uint64_t v5 = v10;
LABEL_23:
}

- (int64_t)amount
{
  return self->_amount;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (unsigned)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)detail
{
  return self->_detail;
}

- (void)setDetail:(id)a3
{
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
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_decimalAmount, 0);
  objc_storeStrong((id *)&self->_customPrecisionAmount, 0);
}

@end