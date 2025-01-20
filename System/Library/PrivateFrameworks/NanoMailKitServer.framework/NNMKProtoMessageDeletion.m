@interface NNMKProtoMessageDeletion
- (BOOL)hasDeletionState;
- (BOOL)hasMessageId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)messageId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)deletionState;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeletionState:(unsigned int)a3;
- (void)setHasDeletionState:(BOOL)a3;
- (void)setMessageId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NNMKProtoMessageDeletion

- (BOOL)hasMessageId
{
  return self->_messageId != 0;
}

- (void)setDeletionState:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_deletionState = a3;
}

- (void)setHasDeletionState:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDeletionState
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NNMKProtoMessageDeletion;
  v4 = [(NNMKProtoMessageDeletion *)&v8 description];
  v5 = [(NNMKProtoMessageDeletion *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  messageId = self->_messageId;
  if (messageId) {
    [v3 setObject:messageId forKey:@"messageId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithUnsignedInt:self->_deletionState];
    [v4 setObject:v6 forKey:@"deletionState"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoMessageDeletionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_messageId)
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

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_messageId)
  {
    id v5 = v4;
    objc_msgSend(v4, "setMessageId:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 2) = self->_deletionState;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_messageId copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_deletionState;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  messageId = self->_messageId;
  if ((unint64_t)messageId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](messageId, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_deletionState == *((_DWORD *)v4 + 2))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_messageId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_deletionState;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (unsigned int *)a3;
  if (*((void *)v4 + 2))
  {
    uint64_t v5 = v4;
    -[NNMKProtoMessageDeletion setMessageId:](self, "setMessageId:");
    uint64_t v4 = v5;
  }
  if (v4[6])
  {
    self->_deletionState = v4[2];
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

- (unsigned)deletionState
{
  return self->_deletionState;
}

- (void).cxx_destruct
{
}

@end