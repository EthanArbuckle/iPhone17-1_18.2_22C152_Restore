@interface NPKProtoSetBalanceReminderForBalanceAndPassRequest
- (BOOL)hasBalanceBytes;
- (BOOL)hasBalanceReminderBytes;
- (BOOL)hasUniqueID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)balanceBytes;
- (NSData)balanceReminderBytes;
- (NSString)uniqueID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBalanceBytes:(id)a3;
- (void)setBalanceReminderBytes:(id)a3;
- (void)setUniqueID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoSetBalanceReminderForBalanceAndPassRequest

- (BOOL)hasUniqueID
{
  return self->_uniqueID != 0;
}

- (BOOL)hasBalanceBytes
{
  return self->_balanceBytes != 0;
}

- (BOOL)hasBalanceReminderBytes
{
  return self->_balanceReminderBytes != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoSetBalanceReminderForBalanceAndPassRequest;
  v4 = [(NPKProtoSetBalanceReminderForBalanceAndPassRequest *)&v8 description];
  v5 = [(NPKProtoSetBalanceReminderForBalanceAndPassRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  uniqueID = self->_uniqueID;
  if (uniqueID) {
    [v3 setObject:uniqueID forKey:@"uniqueID"];
  }
  balanceBytes = self->_balanceBytes;
  if (balanceBytes) {
    [v4 setObject:balanceBytes forKey:@"balanceBytes"];
  }
  balanceReminderBytes = self->_balanceReminderBytes;
  if (balanceReminderBytes) {
    [v4 setObject:balanceReminderBytes forKey:@"balanceReminderBytes"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoSetBalanceReminderForBalanceAndPassRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_uniqueID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_balanceBytes)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_balanceReminderBytes)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_uniqueID)
  {
    objc_msgSend(v4, "setUniqueID:");
    id v4 = v5;
  }
  if (self->_balanceBytes)
  {
    objc_msgSend(v5, "setBalanceBytes:");
    id v4 = v5;
  }
  if (self->_balanceReminderBytes)
  {
    objc_msgSend(v5, "setBalanceReminderBytes:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uniqueID copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSData *)self->_balanceBytes copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  uint64_t v10 = [(NSData *)self->_balanceReminderBytes copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((uniqueID = self->_uniqueID, !((unint64_t)uniqueID | v4[3]))
     || -[NSString isEqual:](uniqueID, "isEqual:"))
    && ((balanceBytes = self->_balanceBytes, !((unint64_t)balanceBytes | v4[1]))
     || -[NSData isEqual:](balanceBytes, "isEqual:")))
  {
    balanceReminderBytes = self->_balanceReminderBytes;
    if ((unint64_t)balanceReminderBytes | v4[2]) {
      char v8 = -[NSData isEqual:](balanceReminderBytes, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uniqueID hash];
  uint64_t v4 = [(NSData *)self->_balanceBytes hash] ^ v3;
  return v4 ^ [(NSData *)self->_balanceReminderBytes hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if (v4[3]) {
    -[NPKProtoSetBalanceReminderForBalanceAndPassRequest setUniqueID:](self, "setUniqueID:");
  }
  if (v4[1]) {
    -[NPKProtoSetBalanceReminderForBalanceAndPassRequest setBalanceBytes:](self, "setBalanceBytes:");
  }
  if (v4[2]) {
    -[NPKProtoSetBalanceReminderForBalanceAndPassRequest setBalanceReminderBytes:](self, "setBalanceReminderBytes:");
  }
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
}

- (NSData)balanceBytes
{
  return self->_balanceBytes;
}

- (void)setBalanceBytes:(id)a3
{
}

- (NSData)balanceReminderBytes
{
  return self->_balanceReminderBytes;
}

- (void)setBalanceReminderBytes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_balanceReminderBytes, 0);
  objc_storeStrong((id *)&self->_balanceBytes, 0);
}

@end