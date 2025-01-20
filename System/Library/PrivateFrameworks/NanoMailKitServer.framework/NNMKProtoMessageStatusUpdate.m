@interface NNMKProtoMessageStatusUpdate
- (BOOL)hasMessageId;
- (BOOL)hasStatusVersion;
- (BOOL)hasUpdatedStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)messageId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)statusVersion;
- (unsigned)updatedStatus;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasStatusVersion:(BOOL)a3;
- (void)setHasUpdatedStatus:(BOOL)a3;
- (void)setMessageId:(id)a3;
- (void)setStatusVersion:(unsigned int)a3;
- (void)setUpdatedStatus:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NNMKProtoMessageStatusUpdate

- (BOOL)hasMessageId
{
  return self->_messageId != 0;
}

- (void)setUpdatedStatus:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_updatedStatus = a3;
}

- (void)setHasUpdatedStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUpdatedStatus
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setStatusVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_statusVersion = a3;
}

- (void)setHasStatusVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStatusVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NNMKProtoMessageStatusUpdate;
  v4 = [(NNMKProtoMessageStatusUpdate *)&v8 description];
  v5 = [(NNMKProtoMessageStatusUpdate *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  messageId = self->_messageId;
  if (messageId) {
    [v3 setObject:messageId forKey:@"messageId"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v7 = [NSNumber numberWithUnsignedInt:self->_updatedStatus];
    [v4 setObject:v7 forKey:@"updatedStatus"];

    char has = (char)self->_has;
  }
  if (has)
  {
    objc_super v8 = [NSNumber numberWithUnsignedInt:self->_statusVersion];
    [v4 setObject:v8 forKey:@"statusVersion"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoMessageStatusUpdateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_messageId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_messageId)
  {
    id v6 = v4;
    objc_msgSend(v4, "setMessageId:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 5) = self->_updatedStatus;
    *((unsigned char *)v4 + 24) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v4 + 4) = self->_statusVersion;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_messageId copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_updatedStatus;
    *(unsigned char *)(v5 + 24) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 16) = self->_statusVersion;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  messageId = self->_messageId;
  if ((unint64_t)messageId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](messageId, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_updatedStatus != *((_DWORD *)v4 + 5)) {
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
LABEL_13:
    BOOL v6 = 0;
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_statusVersion != *((_DWORD *)v4 + 4)) {
      goto LABEL_13;
    }
    BOOL v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_messageId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_updatedStatus;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_statusVersion;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (unsigned int *)a3;
  if (*((void *)v4 + 1))
  {
    BOOL v6 = v4;
    -[NNMKProtoMessageStatusUpdate setMessageId:](self, "setMessageId:");
    uint64_t v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 2) != 0)
  {
    self->_updatedStatus = v4[5];
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 24);
  }
  if (v5)
  {
    self->_statusVersion = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)messageId
{
  return self->_messageId;
}

- (void)setMessageId:(id)a3
{
}

- (unsigned)updatedStatus
{
  return self->_updatedStatus;
}

- (unsigned)statusVersion
{
  return self->_statusVersion;
}

- (void).cxx_destruct
{
}

@end