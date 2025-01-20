@interface NPKProtoSetCommutePlanReminderForCommutePlanAndPassRequest
- (BOOL)hasCommutePlanBytes;
- (BOOL)hasReminderInterval;
- (BOOL)hasUniqueID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)commutePlanBytes;
- (NSString)uniqueID;
- (double)reminderInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCommutePlanBytes:(id)a3;
- (void)setHasReminderInterval:(BOOL)a3;
- (void)setReminderInterval:(double)a3;
- (void)setUniqueID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoSetCommutePlanReminderForCommutePlanAndPassRequest

- (BOOL)hasUniqueID
{
  return self->_uniqueID != 0;
}

- (BOOL)hasCommutePlanBytes
{
  return self->_commutePlanBytes != 0;
}

- (void)setReminderInterval:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_reminderInterval = a3;
}

- (void)setHasReminderInterval:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReminderInterval
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoSetCommutePlanReminderForCommutePlanAndPassRequest;
  v4 = [(NPKProtoSetCommutePlanReminderForCommutePlanAndPassRequest *)&v8 description];
  v5 = [(NPKProtoSetCommutePlanReminderForCommutePlanAndPassRequest *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithDouble:self->_reminderInterval];
    [v4 setObject:v7 forKey:@"reminderInterval"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoSetCommutePlanReminderForCommutePlanAndPassRequestReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
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
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_reminderInterval;
    *((unsigned char *)v4 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uniqueID copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSData *)self->_commutePlanBytes copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_reminderInterval;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  uniqueID = self->_uniqueID;
  if ((unint64_t)uniqueID | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](uniqueID, "isEqual:")) {
      goto LABEL_10;
    }
  }
  commutePlanBytes = self->_commutePlanBytes;
  if ((unint64_t)commutePlanBytes | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](commutePlanBytes, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) != 0 && self->_reminderInterval == *((double *)v4 + 1))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uniqueID hash];
  uint64_t v4 = [(NSData *)self->_commutePlanBytes hash];
  if (*(unsigned char *)&self->_has)
  {
    double reminderInterval = self->_reminderInterval;
    double v7 = -reminderInterval;
    if (reminderInterval >= 0.0) {
      double v7 = self->_reminderInterval;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (double *)a3;
  unint64_t v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[NPKProtoSetCommutePlanReminderForCommutePlanAndPassRequest setUniqueID:](self, "setUniqueID:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[NPKProtoSetCommutePlanReminderForCommutePlanAndPassRequest setCommutePlanBytes:](self, "setCommutePlanBytes:");
    uint64_t v4 = v5;
  }
  if ((_BYTE)v4[4])
  {
    self->_double reminderInterval = v4[1];
    *(unsigned char *)&self->_has |= 1u;
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

- (double)reminderInterval
{
  return self->_reminderInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_commutePlanBytes, 0);
}

@end