@interface PKProtobufRemotePaymentRequest
- (BOOL)hasIdentifier;
- (BOOL)hasPaymentApplicationIdentifier;
- (BOOL)hasPaymentRequest;
- (BOOL)hasPaymentType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (NSString)identifier;
- (NSString)paymentApplicationIdentifier;
- (PKProtobufPaymentRequest)paymentRequest;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)paymentType;
- (unsigned)requestTypeCode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasPaymentType:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setPaymentApplicationIdentifier:(id)a3;
- (void)setPaymentRequest:(id)a3;
- (void)setPaymentType:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufRemotePaymentRequest

- (BOOL)hasPaymentRequest
{
  return self->_paymentRequest != 0;
}

- (BOOL)hasPaymentApplicationIdentifier
{
  return self->_paymentApplicationIdentifier != 0;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setPaymentType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_paymentType = a3;
}

- (void)setHasPaymentType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPaymentType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufRemotePaymentRequest;
  v4 = [(PKProtobufRemotePaymentRequest *)&v8 description];
  v5 = [(PKProtobufRemotePaymentRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  paymentRequest = self->_paymentRequest;
  if (paymentRequest)
  {
    v5 = [(PKProtobufPaymentRequest *)paymentRequest dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"paymentRequest"];
  }
  paymentApplicationIdentifier = self->_paymentApplicationIdentifier;
  if (paymentApplicationIdentifier) {
    [v3 setObject:paymentApplicationIdentifier forKey:@"paymentApplicationIdentifier"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithUnsignedInt:self->_paymentType];
    [v3 setObject:v8 forKey:@"paymentType"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufRemotePaymentRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_paymentRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_paymentApplicationIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (unsigned)requestTypeCode
{
  return 2;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_paymentRequest)
  {
    objc_msgSend(v4, "setPaymentRequest:");
    id v4 = v5;
  }
  if (self->_paymentApplicationIdentifier)
  {
    objc_msgSend(v5, "setPaymentApplicationIdentifier:");
    id v4 = v5;
  }
  if (self->_identifier)
  {
    objc_msgSend(v5, "setIdentifier:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 8) = self->_paymentType;
    *((unsigned char *)v4 + 36) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(PKProtobufPaymentRequest *)self->_paymentRequest copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_paymentApplicationIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  uint64_t v10 = [(NSString *)self->_identifier copyWithZone:a3];
  v11 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 32) = self->_paymentType;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  paymentRequest = self->_paymentRequest;
  if ((unint64_t)paymentRequest | *((void *)v4 + 3))
  {
    if (!-[PKProtobufPaymentRequest isEqual:](paymentRequest, "isEqual:")) {
      goto LABEL_12;
    }
  }
  paymentApplicationIdentifier = self->_paymentApplicationIdentifier;
  if ((unint64_t)paymentApplicationIdentifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](paymentApplicationIdentifier, "isEqual:")) {
      goto LABEL_12;
    }
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_12;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) != 0 && self->_paymentType == *((_DWORD *)v4 + 8))
    {
      BOOL v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PKProtobufPaymentRequest *)self->_paymentRequest hash];
  NSUInteger v4 = [(NSString *)self->_paymentApplicationIdentifier hash];
  NSUInteger v5 = [(NSString *)self->_identifier hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_paymentType;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  paymentRequest = self->_paymentRequest;
  uint64_t v6 = *((void *)v4 + 3);
  id v7 = v4;
  if (paymentRequest)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[PKProtobufPaymentRequest mergeFrom:](paymentRequest, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[PKProtobufRemotePaymentRequest setPaymentRequest:](self, "setPaymentRequest:");
  }
  id v4 = v7;
LABEL_7:
  if (*((void *)v4 + 2))
  {
    -[PKProtobufRemotePaymentRequest setPaymentApplicationIdentifier:](self, "setPaymentApplicationIdentifier:");
    id v4 = v7;
  }
  if (*((void *)v4 + 1))
  {
    -[PKProtobufRemotePaymentRequest setIdentifier:](self, "setIdentifier:");
    id v4 = v7;
  }
  if (*((unsigned char *)v4 + 36))
  {
    self->_paymentType = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (PKProtobufPaymentRequest)paymentRequest
{
  return self->_paymentRequest;
}

- (void)setPaymentRequest:(id)a3
{
}

- (NSString)paymentApplicationIdentifier
{
  return self->_paymentApplicationIdentifier;
}

- (void)setPaymentApplicationIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unsigned)paymentType
{
  return self->_paymentType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentRequest, 0);
  objc_storeStrong((id *)&self->_paymentApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end