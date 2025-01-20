@interface NNMKProtoMoreMessagesRequest
- (BOOL)hasBeforeDateReceived;
- (BOOL)hasFilterType;
- (BOOL)hasFullSyncVersion;
- (BOOL)hasMailboxId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)beforeDateReceived;
- (NSString)mailboxId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)filterType;
- (unsigned)fullSyncVersion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBeforeDateReceived:(id)a3;
- (void)setFilterType:(unsigned int)a3;
- (void)setFullSyncVersion:(unsigned int)a3;
- (void)setHasFilterType:(BOOL)a3;
- (void)setHasFullSyncVersion:(BOOL)a3;
- (void)setMailboxId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NNMKProtoMoreMessagesRequest

- (void)setFullSyncVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_fullSyncVersion = a3;
}

- (void)setHasFullSyncVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFullSyncVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasBeforeDateReceived
{
  return self->_beforeDateReceived != 0;
}

- (BOOL)hasMailboxId
{
  return self->_mailboxId != 0;
}

- (void)setFilterType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_filterType = a3;
}

- (void)setHasFilterType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFilterType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NNMKProtoMoreMessagesRequest;
  v4 = [(NNMKProtoMoreMessagesRequest *)&v8 description];
  v5 = [(NNMKProtoMoreMessagesRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4 = [NSNumber numberWithUnsignedInt:self->_fullSyncVersion];
    [v3 setObject:v4 forKey:@"fullSyncVersion"];
  }
  beforeDateReceived = self->_beforeDateReceived;
  if (beforeDateReceived) {
    [v3 setObject:beforeDateReceived forKey:@"beforeDateReceived"];
  }
  mailboxId = self->_mailboxId;
  if (mailboxId) {
    [v3 setObject:mailboxId forKey:@"mailboxId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithUnsignedInt:self->_filterType];
    [v3 setObject:v7 forKey:@"filterType"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoMoreMessagesRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_beforeDateReceived) {
    PBDataWriterWriteDataField();
  }
  if (self->_mailboxId) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[5] = self->_fullSyncVersion;
    *((unsigned char *)v4 + 32) |= 2u;
  }
  v5 = v4;
  if (self->_beforeDateReceived)
  {
    objc_msgSend(v4, "setBeforeDateReceived:");
    id v4 = v5;
  }
  if (self->_mailboxId)
  {
    objc_msgSend(v5, "setMailboxId:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_filterType;
    *((unsigned char *)v4 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_fullSyncVersion;
    *(unsigned char *)(v5 + 32) |= 2u;
  }
  uint64_t v7 = [(NSData *)self->_beforeDateReceived copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v7;

  uint64_t v9 = [(NSString *)self->_mailboxId copyWithZone:a3];
  v10 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v9;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v6 + 16) = self->_filterType;
    *(unsigned char *)(v6 + 32) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_fullSyncVersion != *((_DWORD *)v4 + 5)) {
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_15:
    BOOL v7 = 0;
    goto LABEL_16;
  }
  beforeDateReceived = self->_beforeDateReceived;
  if ((unint64_t)beforeDateReceived | *((void *)v4 + 1)
    && !-[NSData isEqual:](beforeDateReceived, "isEqual:"))
  {
    goto LABEL_15;
  }
  mailboxId = self->_mailboxId;
  if ((unint64_t)mailboxId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](mailboxId, "isEqual:")) {
      goto LABEL_15;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_filterType != *((_DWORD *)v4 + 4)) {
      goto LABEL_15;
    }
    BOOL v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_fullSyncVersion;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSData *)self->_beforeDateReceived hash];
  NSUInteger v5 = [(NSString *)self->_mailboxId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_filterType;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if ((v4[8] & 2) != 0)
  {
    self->_fullSyncVersion = v4[5];
    *(unsigned char *)&self->_has |= 2u;
  }
  NSUInteger v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[NNMKProtoMoreMessagesRequest setBeforeDateReceived:](self, "setBeforeDateReceived:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[NNMKProtoMoreMessagesRequest setMailboxId:](self, "setMailboxId:");
    uint64_t v4 = v5;
  }
  if (v4[8])
  {
    self->_filterType = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unsigned)fullSyncVersion
{
  return self->_fullSyncVersion;
}

- (NSData)beforeDateReceived
{
  return self->_beforeDateReceived;
}

- (void)setBeforeDateReceived:(id)a3
{
}

- (NSString)mailboxId
{
  return self->_mailboxId;
}

- (void)setMailboxId:(id)a3
{
}

- (unsigned)filterType
{
  return self->_filterType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxId, 0);
  objc_storeStrong((id *)&self->_beforeDateReceived, 0);
}

@end