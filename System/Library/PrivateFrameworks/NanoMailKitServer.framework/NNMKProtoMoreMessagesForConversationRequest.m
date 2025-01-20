@interface NNMKProtoMoreMessagesForConversationRequest
- (BOOL)hasBeforeDateReceived;
- (BOOL)hasConversationId;
- (BOOL)hasFullSyncVersion;
- (BOOL)hasMailboxId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)beforeDateReceived;
- (NSString)conversationId;
- (NSString)mailboxId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)fullSyncVersion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBeforeDateReceived:(id)a3;
- (void)setConversationId:(id)a3;
- (void)setFullSyncVersion:(unsigned int)a3;
- (void)setHasFullSyncVersion:(BOOL)a3;
- (void)setMailboxId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NNMKProtoMoreMessagesForConversationRequest

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

- (BOOL)hasConversationId
{
  return self->_conversationId != 0;
}

- (BOOL)hasBeforeDateReceived
{
  return self->_beforeDateReceived != 0;
}

- (BOOL)hasMailboxId
{
  return self->_mailboxId != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NNMKProtoMoreMessagesForConversationRequest;
  v4 = [(NNMKProtoMoreMessagesForConversationRequest *)&v8 description];
  v5 = [(NNMKProtoMoreMessagesForConversationRequest *)self dictionaryRepresentation];
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
  conversationId = self->_conversationId;
  if (conversationId) {
    [v3 setObject:conversationId forKey:@"conversationId"];
  }
  beforeDateReceived = self->_beforeDateReceived;
  if (beforeDateReceived) {
    [v3 setObject:beforeDateReceived forKey:@"beforeDateReceived"];
  }
  mailboxId = self->_mailboxId;
  if (mailboxId) {
    [v3 setObject:mailboxId forKey:@"mailboxId"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoMoreMessagesForConversationRequestReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_conversationId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_beforeDateReceived)
  {
    PBDataWriterWriteDataField();
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
    v4[6] = self->_fullSyncVersion;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  id v5 = v4;
  if (self->_conversationId)
  {
    objc_msgSend(v4, "setConversationId:");
    id v4 = v5;
  }
  if (self->_beforeDateReceived)
  {
    objc_msgSend(v5, "setBeforeDateReceived:");
    id v4 = v5;
  }
  if (self->_mailboxId)
  {
    objc_msgSend(v5, "setMailboxId:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_fullSyncVersion;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_conversationId copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  uint64_t v9 = [(NSData *)self->_beforeDateReceived copyWithZone:a3];
  v10 = (void *)v6[1];
  v6[1] = v9;

  uint64_t v11 = [(NSString *)self->_mailboxId copyWithZone:a3];
  v12 = (void *)v6[4];
  v6[4] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_fullSyncVersion != *((_DWORD *)v4 + 6)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  conversationId = self->_conversationId;
  if ((unint64_t)conversationId | *((void *)v4 + 2)
    && !-[NSString isEqual:](conversationId, "isEqual:"))
  {
    goto LABEL_13;
  }
  beforeDateReceived = self->_beforeDateReceived;
  if ((unint64_t)beforeDateReceived | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](beforeDateReceived, "isEqual:")) {
      goto LABEL_13;
    }
  }
  mailboxId = self->_mailboxId;
  if ((unint64_t)mailboxId | *((void *)v4 + 4)) {
    char v8 = -[NSString isEqual:](mailboxId, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_fullSyncVersion;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_conversationId hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_beforeDateReceived hash];
  return v4 ^ v5 ^ [(NSString *)self->_mailboxId hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[10])
  {
    self->_fullSyncVersion = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[NNMKProtoMoreMessagesForConversationRequest setConversationId:](self, "setConversationId:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[NNMKProtoMoreMessagesForConversationRequest setBeforeDateReceived:](self, "setBeforeDateReceived:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[NNMKProtoMoreMessagesForConversationRequest setMailboxId:](self, "setMailboxId:");
    NSUInteger v4 = v5;
  }
}

- (unsigned)fullSyncVersion
{
  return self->_fullSyncVersion;
}

- (NSString)conversationId
{
  return self->_conversationId;
}

- (void)setConversationId:(id)a3
{
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxId, 0);
  objc_storeStrong((id *)&self->_conversationId, 0);
  objc_storeStrong((id *)&self->_beforeDateReceived, 0);
}

@end