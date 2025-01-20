@interface PKProtobufPayment
- (BOOL)hasBillingContact;
- (BOOL)hasShippingContact;
- (BOOL)hasShippingMethod;
- (BOOL)hasToken;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)billingContact;
- (NSData)shippingContact;
- (PKProtobufPaymentToken)token;
- (PKProtobufShippingMethod)shippingMethod;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBillingContact:(id)a3;
- (void)setShippingContact:(id)a3;
- (void)setShippingMethod:(id)a3;
- (void)setToken:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufPayment

- (BOOL)hasToken
{
  return self->_token != 0;
}

- (BOOL)hasBillingContact
{
  return self->_billingContact != 0;
}

- (BOOL)hasShippingContact
{
  return self->_shippingContact != 0;
}

- (BOOL)hasShippingMethod
{
  return self->_shippingMethod != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufPayment;
  v4 = [(PKProtobufPayment *)&v8 description];
  v5 = [(PKProtobufPayment *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  token = self->_token;
  if (token)
  {
    v5 = [(PKProtobufPaymentToken *)token dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"token"];
  }
  billingContact = self->_billingContact;
  if (billingContact) {
    [v3 setObject:billingContact forKey:@"billingContact"];
  }
  shippingContact = self->_shippingContact;
  if (shippingContact) {
    [v3 setObject:shippingContact forKey:@"shippingContact"];
  }
  shippingMethod = self->_shippingMethod;
  if (shippingMethod)
  {
    v9 = [(PKProtobufShippingMethod *)shippingMethod dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"shippingMethod"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufPaymentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_token)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_billingContact)
  {
    PBDataWriterWriteDataField();
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
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_token)
  {
    objc_msgSend(v4, "setToken:");
    id v4 = v5;
  }
  if (self->_billingContact)
  {
    objc_msgSend(v5, "setBillingContact:");
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
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(PKProtobufPaymentToken *)self->_token copyWithZone:a3];
  v7 = (void *)v5[4];
  v5[4] = v6;

  uint64_t v8 = [(NSData *)self->_billingContact copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  uint64_t v10 = [(NSData *)self->_shippingContact copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  id v12 = [(PKProtobufShippingMethod *)self->_shippingMethod copyWithZone:a3];
  v13 = (void *)v5[3];
  v5[3] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((token = self->_token, !((unint64_t)token | v4[4]))
     || -[PKProtobufPaymentToken isEqual:](token, "isEqual:"))
    && ((billingContact = self->_billingContact, !((unint64_t)billingContact | v4[1]))
     || -[NSData isEqual:](billingContact, "isEqual:"))
    && ((shippingContact = self->_shippingContact, !((unint64_t)shippingContact | v4[2]))
     || -[NSData isEqual:](shippingContact, "isEqual:")))
  {
    shippingMethod = self->_shippingMethod;
    if ((unint64_t)shippingMethod | v4[3]) {
      char v9 = -[PKProtobufShippingMethod isEqual:](shippingMethod, "isEqual:");
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
  unint64_t v3 = [(PKProtobufPaymentToken *)self->_token hash];
  uint64_t v4 = [(NSData *)self->_billingContact hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_shippingContact hash];
  return v4 ^ v5 ^ [(PKProtobufShippingMethod *)self->_shippingMethod hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  token = self->_token;
  uint64_t v6 = v4[4];
  char v9 = v4;
  if (token)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[PKProtobufPaymentToken mergeFrom:](token, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[PKProtobufPayment setToken:](self, "setToken:");
  }
  uint64_t v4 = v9;
LABEL_7:
  if (v4[1])
  {
    -[PKProtobufPayment setBillingContact:](self, "setBillingContact:");
    uint64_t v4 = v9;
  }
  if (v4[2])
  {
    -[PKProtobufPayment setShippingContact:](self, "setShippingContact:");
    uint64_t v4 = v9;
  }
  shippingMethod = self->_shippingMethod;
  uint64_t v8 = v4[3];
  if (shippingMethod)
  {
    if (!v8) {
      goto LABEL_17;
    }
    -[PKProtobufShippingMethod mergeFrom:](shippingMethod, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_17;
    }
    -[PKProtobufPayment setShippingMethod:](self, "setShippingMethod:");
  }
  uint64_t v4 = v9;
LABEL_17:
}

- (PKProtobufPaymentToken)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (NSData)billingContact
{
  return self->_billingContact;
}

- (void)setBillingContact:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_shippingMethod, 0);
  objc_storeStrong((id *)&self->_shippingContact, 0);
  objc_storeStrong((id *)&self->_billingContact, 0);
}

@end