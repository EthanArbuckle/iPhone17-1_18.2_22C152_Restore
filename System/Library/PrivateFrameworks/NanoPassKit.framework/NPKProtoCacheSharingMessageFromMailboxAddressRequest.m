@interface NPKProtoCacheSharingMessageFromMailboxAddressRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)sharingMessageData;
- (NSString)mailboxAddress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMailboxAddress:(id)a3;
- (void)setSharingMessageData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoCacheSharingMessageFromMailboxAddressRequest

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoCacheSharingMessageFromMailboxAddressRequest;
  v4 = [(NPKProtoCacheSharingMessageFromMailboxAddressRequest *)&v8 description];
  v5 = [(NPKProtoCacheSharingMessageFromMailboxAddressRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  mailboxAddress = self->_mailboxAddress;
  if (mailboxAddress) {
    [v3 setObject:mailboxAddress forKey:@"mailboxAddress"];
  }
  sharingMessageData = self->_sharingMessageData;
  if (sharingMessageData) {
    [v4 setObject:sharingMessageData forKey:@"sharingMessageData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCacheSharingMessageFromMailboxAddressRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_mailboxAddress) {
    -[NPKProtoCacheSharingMessageFromMailboxAddressRequest writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_sharingMessageData) {
    -[NPKProtoCacheSharingMessageFromMailboxAddressRequest writeTo:]();
  }
  PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
  mailboxAddress = self->_mailboxAddress;
  id v5 = a3;
  [v5 setMailboxAddress:mailboxAddress];
  [v5 setSharingMessageData:self->_sharingMessageData];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_mailboxAddress copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSData *)self->_sharingMessageData copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((mailboxAddress = self->_mailboxAddress, !((unint64_t)mailboxAddress | v4[1]))
     || -[NSString isEqual:](mailboxAddress, "isEqual:")))
  {
    sharingMessageData = self->_sharingMessageData;
    if ((unint64_t)sharingMessageData | v4[2]) {
      char v7 = -[NSData isEqual:](sharingMessageData, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_mailboxAddress hash];
  return [(NSData *)self->_sharingMessageData hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[1])
  {
    -[NPKProtoCacheSharingMessageFromMailboxAddressRequest setMailboxAddress:](self, "setMailboxAddress:");
    id v4 = v5;
  }
  if (v4[2])
  {
    -[NPKProtoCacheSharingMessageFromMailboxAddressRequest setSharingMessageData:](self, "setSharingMessageData:");
    id v4 = v5;
  }
}

- (NSString)mailboxAddress
{
  return self->_mailboxAddress;
}

- (void)setMailboxAddress:(id)a3
{
}

- (NSData)sharingMessageData
{
  return self->_sharingMessageData;
}

- (void)setSharingMessageData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingMessageData, 0);
  objc_storeStrong((id *)&self->_mailboxAddress, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoCacheSharingMessageFromMailboxAddressRequest writeTo:]", "NPKProtoCacheSharingMessageFromMailboxAddressRequest.m", 83, "nil != self->_mailboxAddress");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[NPKProtoCacheSharingMessageFromMailboxAddressRequest writeTo:]", "NPKProtoCacheSharingMessageFromMailboxAddressRequest.m", 88, "nil != self->_sharingMessageData");
}

@end