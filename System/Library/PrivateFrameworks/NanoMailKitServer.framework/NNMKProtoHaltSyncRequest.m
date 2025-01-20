@interface NNMKProtoHaltSyncRequest
- (BOOL)hasFullSyncVersion;
- (BOOL)hasMailboxId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)mailboxId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)fullSyncVersion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFullSyncVersion:(unsigned int)a3;
- (void)setHasFullSyncVersion:(BOOL)a3;
- (void)setMailboxId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NNMKProtoHaltSyncRequest

- (void)setFullSyncVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_fullSyncVersion = a3;
}

- (void)setHasFullSyncVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFullSyncVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasMailboxId
{
  return self->_mailboxId != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NNMKProtoHaltSyncRequest;
  v4 = [(NNMKProtoHaltSyncRequest *)&v8 description];
  v5 = [(NNMKProtoHaltSyncRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithUnsignedInt:self->_fullSyncVersion];
    [v3 setObject:v4 forKey:@"fullSyncVersion"];
  }
  mailboxId = self->_mailboxId;
  if (mailboxId) {
    [v3 setObject:mailboxId forKey:@"mailboxId"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoHaltSyncRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_mailboxId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_fullSyncVersion;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_mailboxId)
  {
    id v5 = v4;
    objc_msgSend(v4, "setMailboxId:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_fullSyncVersion;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_mailboxId copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_fullSyncVersion != *((_DWORD *)v4 + 2)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  mailboxId = self->_mailboxId;
  if ((unint64_t)mailboxId | *((void *)v4 + 2)) {
    char v6 = -[NSString isEqual:](mailboxId, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_fullSyncVersion;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSString *)self->_mailboxId hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (v4[6])
  {
    self->_fullSyncVersion = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    uint64_t v5 = v4;
    -[NNMKProtoHaltSyncRequest setMailboxId:](self, "setMailboxId:");
    id v4 = v5;
  }
}

- (unsigned)fullSyncVersion
{
  return self->_fullSyncVersion;
}

- (NSString)mailboxId
{
  return self->_mailboxId;
}

- (void)setMailboxId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end