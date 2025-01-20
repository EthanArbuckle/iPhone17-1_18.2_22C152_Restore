@interface NPKProtoCommutePlanReminderForCommutePlanAndPassRequest
- (BOOL)hasCommutePlanBytes;
- (BOOL)hasUniqueID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)commutePlanBytes;
- (NSString)uniqueID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCommutePlanBytes:(id)a3;
- (void)setUniqueID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoCommutePlanReminderForCommutePlanAndPassRequest

- (BOOL)hasUniqueID
{
  return self->_uniqueID != 0;
}

- (BOOL)hasCommutePlanBytes
{
  return self->_commutePlanBytes != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoCommutePlanReminderForCommutePlanAndPassRequest;
  v4 = [(NPKProtoCommutePlanReminderForCommutePlanAndPassRequest *)&v8 description];
  v5 = [(NPKProtoCommutePlanReminderForCommutePlanAndPassRequest *)self dictionaryRepresentation];
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
  commutePlanBytes = self->_commutePlanBytes;
  if (commutePlanBytes) {
    [v4 setObject:commutePlanBytes forKey:@"commutePlanBytes"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCommutePlanReminderForCommutePlanAndPassRequestReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_commutePlanBytes)
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
  if (self->_commutePlanBytes)
  {
    objc_msgSend(v5, "setCommutePlanBytes:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uniqueID copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSData *)self->_commutePlanBytes copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((uniqueID = self->_uniqueID, !((unint64_t)uniqueID | v4[2]))
     || -[NSString isEqual:](uniqueID, "isEqual:")))
  {
    commutePlanBytes = self->_commutePlanBytes;
    if ((unint64_t)commutePlanBytes | v4[1]) {
      char v7 = -[NSData isEqual:](commutePlanBytes, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_uniqueID hash];
  return [(NSData *)self->_commutePlanBytes hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[NPKProtoCommutePlanReminderForCommutePlanAndPassRequest setUniqueID:](self, "setUniqueID:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[NPKProtoCommutePlanReminderForCommutePlanAndPassRequest setCommutePlanBytes:](self, "setCommutePlanBytes:");
    id v4 = v5;
  }
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
}

- (NSData)commutePlanBytes
{
  return self->_commutePlanBytes;
}

- (void)setCommutePlanBytes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_commutePlanBytes, 0);
}

@end