@interface PKProtobufPaymentHostUpdate
- (BOOL)hasPaymentMethod;
- (BOOL)hasRemotePaymentRequestIdentifier;
- (BOOL)hasShippingContact;
- (BOOL)hasShippingMethod;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)shippingContact;
- (NSString)remotePaymentRequestIdentifier;
- (PKProtobufPaymentMethod)paymentMethod;
- (PKProtobufShippingMethod)shippingMethod;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPaymentMethod:(id)a3;
- (void)setRemotePaymentRequestIdentifier:(id)a3;
- (void)setShippingContact:(id)a3;
- (void)setShippingMethod:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufPaymentHostUpdate

- (BOOL)hasRemotePaymentRequestIdentifier
{
  return self->_remotePaymentRequestIdentifier != 0;
}

- (BOOL)hasShippingContact
{
  return self->_shippingContact != 0;
}

- (BOOL)hasShippingMethod
{
  return self->_shippingMethod != 0;
}

- (BOOL)hasPaymentMethod
{
  return self->_paymentMethod != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufPaymentHostUpdate;
  v4 = [(PKProtobufPaymentHostUpdate *)&v8 description];
  v5 = [(PKProtobufPaymentHostUpdate *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  remotePaymentRequestIdentifier = self->_remotePaymentRequestIdentifier;
  if (remotePaymentRequestIdentifier) {
    [v3 setObject:remotePaymentRequestIdentifier forKey:@"remotePaymentRequestIdentifier"];
  }
  shippingContact = self->_shippingContact;
  if (shippingContact) {
    [v4 setObject:shippingContact forKey:@"shippingContact"];
  }
  shippingMethod = self->_shippingMethod;
  if (shippingMethod)
  {
    objc_super v8 = [(PKProtobufShippingMethod *)shippingMethod dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"shippingMethod"];
  }
  paymentMethod = self->_paymentMethod;
  if (paymentMethod)
  {
    v10 = [(PKProtobufPaymentMethod *)paymentMethod dictionaryRepresentation];
    [v4 setObject:v10 forKey:@"paymentMethod"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufPaymentHostUpdateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_remotePaymentRequestIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_shippingContact)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_shippingMethod)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_paymentMethod)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_remotePaymentRequestIdentifier)
  {
    objc_msgSend(v4, "setRemotePaymentRequestIdentifier:");
    id v4 = v5;
  }
  if (self->_shippingContact)
  {
    objc_msgSend(v5, "setShippingContact:");
    id v4 = v5;
  }
  if (self->_shippingMethod)
  {
    objc_msgSend(v5, "setShippingMethod:");
    id v4 = v5;
  }
  if (self->_paymentMethod)
  {
    objc_msgSend(v5, "setPaymentMethod:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_remotePaymentRequestIdentifier copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSData *)self->_shippingContact copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  id v10 = [(PKProtobufShippingMethod *)self->_shippingMethod copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  id v12 = [(PKProtobufPaymentMethod *)self->_paymentMethod copyWithZone:a3];
  v13 = (void *)v5[1];
  v5[1] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((remotePaymentRequestIdentifier = self->_remotePaymentRequestIdentifier,
         !((unint64_t)remotePaymentRequestIdentifier | v4[2]))
     || -[NSString isEqual:](remotePaymentRequestIdentifier, "isEqual:"))
    && ((shippingContact = self->_shippingContact, !((unint64_t)shippingContact | v4[3]))
     || -[NSData isEqual:](shippingContact, "isEqual:"))
    && ((shippingMethod = self->_shippingMethod, !((unint64_t)shippingMethod | v4[4]))
     || -[PKProtobufShippingMethod isEqual:](shippingMethod, "isEqual:")))
  {
    paymentMethod = self->_paymentMethod;
    if ((unint64_t)paymentMethod | v4[1]) {
      char v9 = -[PKProtobufPaymentMethod isEqual:](paymentMethod, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_remotePaymentRequestIdentifier hash];
  uint64_t v4 = [(NSData *)self->_shippingContact hash] ^ v3;
  unint64_t v5 = [(PKProtobufShippingMethod *)self->_shippingMethod hash];
  return v4 ^ v5 ^ [(PKProtobufPaymentMethod *)self->_paymentMethod hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  char v9 = v4;
  if (v4[2])
  {
    -[PKProtobufPaymentHostUpdate setRemotePaymentRequestIdentifier:](self, "setRemotePaymentRequestIdentifier:");
    uint64_t v4 = v9;
  }
  if (v4[3])
  {
    -[PKProtobufPaymentHostUpdate setShippingContact:](self, "setShippingContact:");
    uint64_t v4 = v9;
  }
  shippingMethod = self->_shippingMethod;
  uint64_t v6 = v4[4];
  if (shippingMethod)
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[PKProtobufShippingMethod mergeFrom:](shippingMethod, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[PKProtobufPaymentHostUpdate setShippingMethod:](self, "setShippingMethod:");
  }
  uint64_t v4 = v9;
LABEL_11:
  paymentMethod = self->_paymentMethod;
  uint64_t v8 = v4[1];
  if (paymentMethod)
  {
    if (!v8) {
      goto LABEL_17;
    }
    -[PKProtobufPaymentMethod mergeFrom:](paymentMethod, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_17;
    }
    -[PKProtobufPaymentHostUpdate setPaymentMethod:](self, "setPaymentMethod:");
  }
  uint64_t v4 = v9;
LABEL_17:
}

- (NSString)remotePaymentRequestIdentifier
{
  return self->_remotePaymentRequestIdentifier;
}

- (void)setRemotePaymentRequestIdentifier:(id)a3
{
}

- (NSData)shippingContact
{
  return self->_shippingContact;
}

- (void)setShippingContact:(id)a3
{
}

- (PKProtobufShippingMethod)shippingMethod
{
  return self->_shippingMethod;
}

- (void)setShippingMethod:(id)a3
{
}

- (PKProtobufPaymentMethod)paymentMethod
{
  return self->_paymentMethod;
}

- (void)setPaymentMethod:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shippingMethod, 0);
  objc_storeStrong((id *)&self->_shippingContact, 0);
  objc_storeStrong((id *)&self->_remotePaymentRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentMethod, 0);
}

@end