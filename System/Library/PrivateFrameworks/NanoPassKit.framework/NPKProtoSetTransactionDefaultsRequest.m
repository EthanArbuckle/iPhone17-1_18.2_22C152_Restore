@interface NPKProtoSetTransactionDefaultsRequest
- (BOOL)hasDefaultBillingAddresses;
- (BOOL)hasDefaultContactEmail;
- (BOOL)hasDefaultContactName;
- (BOOL)hasDefaultContactPhone;
- (BOOL)hasDefaultShippingAddress;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)defaultBillingAddresses;
- (NSData)defaultContactEmail;
- (NSData)defaultContactName;
- (NSData)defaultContactPhone;
- (NSData)defaultShippingAddress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDefaultBillingAddresses:(id)a3;
- (void)setDefaultContactEmail:(id)a3;
- (void)setDefaultContactName:(id)a3;
- (void)setDefaultContactPhone:(id)a3;
- (void)setDefaultShippingAddress:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoSetTransactionDefaultsRequest

- (BOOL)hasDefaultShippingAddress
{
  return self->_defaultShippingAddress != 0;
}

- (BOOL)hasDefaultBillingAddresses
{
  return self->_defaultBillingAddresses != 0;
}

- (BOOL)hasDefaultContactEmail
{
  return self->_defaultContactEmail != 0;
}

- (BOOL)hasDefaultContactPhone
{
  return self->_defaultContactPhone != 0;
}

- (BOOL)hasDefaultContactName
{
  return self->_defaultContactName != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoSetTransactionDefaultsRequest;
  v4 = [(NPKProtoSetTransactionDefaultsRequest *)&v8 description];
  v5 = [(NPKProtoSetTransactionDefaultsRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  defaultShippingAddress = self->_defaultShippingAddress;
  if (defaultShippingAddress) {
    [v3 setObject:defaultShippingAddress forKey:@"defaultShippingAddress"];
  }
  defaultBillingAddresses = self->_defaultBillingAddresses;
  if (defaultBillingAddresses) {
    [v4 setObject:defaultBillingAddresses forKey:@"defaultBillingAddresses"];
  }
  defaultContactEmail = self->_defaultContactEmail;
  if (defaultContactEmail) {
    [v4 setObject:defaultContactEmail forKey:@"defaultContactEmail"];
  }
  defaultContactPhone = self->_defaultContactPhone;
  if (defaultContactPhone) {
    [v4 setObject:defaultContactPhone forKey:@"defaultContactPhone"];
  }
  defaultContactName = self->_defaultContactName;
  if (defaultContactName) {
    [v4 setObject:defaultContactName forKey:@"defaultContactName"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoSetTransactionDefaultsRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_defaultShippingAddress)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_defaultBillingAddresses)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_defaultContactEmail)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_defaultContactPhone)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_defaultContactName)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_defaultShippingAddress)
  {
    objc_msgSend(v4, "setDefaultShippingAddress:");
    id v4 = v5;
  }
  if (self->_defaultBillingAddresses)
  {
    objc_msgSend(v5, "setDefaultBillingAddresses:");
    id v4 = v5;
  }
  if (self->_defaultContactEmail)
  {
    objc_msgSend(v5, "setDefaultContactEmail:");
    id v4 = v5;
  }
  if (self->_defaultContactPhone)
  {
    objc_msgSend(v5, "setDefaultContactPhone:");
    id v4 = v5;
  }
  if (self->_defaultContactName)
  {
    objc_msgSend(v5, "setDefaultContactName:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_defaultShippingAddress copyWithZone:a3];
  v7 = (void *)v5[5];
  v5[5] = v6;

  uint64_t v8 = [(NSData *)self->_defaultBillingAddresses copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  uint64_t v10 = [(NSData *)self->_defaultContactEmail copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  uint64_t v12 = [(NSData *)self->_defaultContactPhone copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  uint64_t v14 = [(NSData *)self->_defaultContactName copyWithZone:a3];
  v15 = (void *)v5[3];
  v5[3] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((defaultShippingAddress = self->_defaultShippingAddress, !((unint64_t)defaultShippingAddress | v4[5]))
     || -[NSData isEqual:](defaultShippingAddress, "isEqual:"))
    && ((defaultBillingAddresses = self->_defaultBillingAddresses, !((unint64_t)defaultBillingAddresses | v4[1]))
     || -[NSData isEqual:](defaultBillingAddresses, "isEqual:"))
    && ((defaultContactEmail = self->_defaultContactEmail, !((unint64_t)defaultContactEmail | v4[2]))
     || -[NSData isEqual:](defaultContactEmail, "isEqual:"))
    && ((defaultContactPhone = self->_defaultContactPhone, !((unint64_t)defaultContactPhone | v4[4]))
     || -[NSData isEqual:](defaultContactPhone, "isEqual:")))
  {
    defaultContactName = self->_defaultContactName;
    if ((unint64_t)defaultContactName | v4[3]) {
      char v10 = -[NSData isEqual:](defaultContactName, "isEqual:");
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
  uint64_t v3 = [(NSData *)self->_defaultShippingAddress hash];
  uint64_t v4 = [(NSData *)self->_defaultBillingAddresses hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_defaultContactEmail hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSData *)self->_defaultContactPhone hash];
  return v6 ^ [(NSData *)self->_defaultContactName hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if (v4[5]) {
    -[NPKProtoSetTransactionDefaultsRequest setDefaultShippingAddress:](self, "setDefaultShippingAddress:");
  }
  if (v4[1]) {
    -[NPKProtoSetTransactionDefaultsRequest setDefaultBillingAddresses:](self, "setDefaultBillingAddresses:");
  }
  if (v4[2]) {
    -[NPKProtoSetTransactionDefaultsRequest setDefaultContactEmail:](self, "setDefaultContactEmail:");
  }
  if (v4[4]) {
    -[NPKProtoSetTransactionDefaultsRequest setDefaultContactPhone:](self, "setDefaultContactPhone:");
  }
  if (v4[3]) {
    -[NPKProtoSetTransactionDefaultsRequest setDefaultContactName:](self, "setDefaultContactName:");
  }
}

- (NSData)defaultShippingAddress
{
  return self->_defaultShippingAddress;
}

- (void)setDefaultShippingAddress:(id)a3
{
}

- (NSData)defaultBillingAddresses
{
  return self->_defaultBillingAddresses;
}

- (void)setDefaultBillingAddresses:(id)a3
{
}

- (NSData)defaultContactEmail
{
  return self->_defaultContactEmail;
}

- (void)setDefaultContactEmail:(id)a3
{
}

- (NSData)defaultContactPhone
{
  return self->_defaultContactPhone;
}

- (void)setDefaultContactPhone:(id)a3
{
}

- (NSData)defaultContactName
{
  return self->_defaultContactName;
}

- (void)setDefaultContactName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultShippingAddress, 0);
  objc_storeStrong((id *)&self->_defaultContactPhone, 0);
  objc_storeStrong((id *)&self->_defaultContactName, 0);
  objc_storeStrong((id *)&self->_defaultContactEmail, 0);
  objc_storeStrong((id *)&self->_defaultBillingAddresses, 0);
}

@end