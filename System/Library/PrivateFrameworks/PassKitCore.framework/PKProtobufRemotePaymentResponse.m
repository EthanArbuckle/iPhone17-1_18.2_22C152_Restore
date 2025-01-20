@interface PKProtobufRemotePaymentResponse
- (BOOL)hasPayment;
- (BOOL)hasRemotePaymentRequestIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)remotePaymentRequestIdentifier;
- (PKProtobufPayment)payment;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPayment:(id)a3;
- (void)setRemotePaymentRequestIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufRemotePaymentResponse

- (BOOL)hasPayment
{
  return self->_payment != 0;
}

- (BOOL)hasRemotePaymentRequestIdentifier
{
  return self->_remotePaymentRequestIdentifier != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufRemotePaymentResponse;
  v4 = [(PKProtobufRemotePaymentResponse *)&v8 description];
  v5 = [(PKProtobufRemotePaymentResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  payment = self->_payment;
  if (payment)
  {
    v5 = [(PKProtobufPayment *)payment dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"payment"];
  }
  remotePaymentRequestIdentifier = self->_remotePaymentRequestIdentifier;
  if (remotePaymentRequestIdentifier) {
    [v3 setObject:remotePaymentRequestIdentifier forKey:@"remotePaymentRequestIdentifier"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufRemotePaymentResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_payment)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_remotePaymentRequestIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_payment)
  {
    objc_msgSend(v4, "setPayment:");
    id v4 = v5;
  }
  if (self->_remotePaymentRequestIdentifier)
  {
    objc_msgSend(v5, "setRemotePaymentRequestIdentifier:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(PKProtobufPayment *)self->_payment copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_remotePaymentRequestIdentifier copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((payment = self->_payment, !((unint64_t)payment | v4[1]))
     || -[PKProtobufPayment isEqual:](payment, "isEqual:")))
  {
    remotePaymentRequestIdentifier = self->_remotePaymentRequestIdentifier;
    if ((unint64_t)remotePaymentRequestIdentifier | v4[2]) {
      char v7 = -[NSString isEqual:](remotePaymentRequestIdentifier, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PKProtobufPayment *)self->_payment hash];
  return [(NSString *)self->_remotePaymentRequestIdentifier hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  payment = self->_payment;
  uint64_t v6 = v4[1];
  char v7 = v4;
  if (payment)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[PKProtobufPayment mergeFrom:](payment, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[PKProtobufRemotePaymentResponse setPayment:](self, "setPayment:");
  }
  id v4 = v7;
LABEL_7:
  if (v4[2])
  {
    -[PKProtobufRemotePaymentResponse setRemotePaymentRequestIdentifier:](self, "setRemotePaymentRequestIdentifier:");
    id v4 = v7;
  }
}

- (PKProtobufPayment)payment
{
  return self->_payment;
}

- (void)setPayment:(id)a3
{
}

- (NSString)remotePaymentRequestIdentifier
{
  return self->_remotePaymentRequestIdentifier;
}

- (void)setRemotePaymentRequestIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remotePaymentRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_payment, 0);
}

@end