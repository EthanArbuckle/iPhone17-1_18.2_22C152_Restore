@interface NNMKProtoFetchRequest
- (BOOL)hasConversationId;
- (BOOL)hasCurrentDateForRequestingMoreMessages;
- (BOOL)hasCurrentMessageIdsAndStatus;
- (BOOL)hasFullSyncVersion;
- (BOOL)hasMailboxId;
- (BOOL)hasWantsBatchedResponse;
- (BOOL)hasWillTrimDatabaseAfterResults;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)wantsBatchedResponse;
- (BOOL)willTrimDatabaseAfterResults;
- (NSData)currentDateForRequestingMoreMessages;
- (NSData)currentMessageIdsAndStatus;
- (NSString)conversationId;
- (NSString)mailboxId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)fullSyncVersion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConversationId:(id)a3;
- (void)setCurrentDateForRequestingMoreMessages:(id)a3;
- (void)setCurrentMessageIdsAndStatus:(id)a3;
- (void)setFullSyncVersion:(unsigned int)a3;
- (void)setHasFullSyncVersion:(BOOL)a3;
- (void)setHasWantsBatchedResponse:(BOOL)a3;
- (void)setHasWillTrimDatabaseAfterResults:(BOOL)a3;
- (void)setMailboxId:(id)a3;
- (void)setWantsBatchedResponse:(BOOL)a3;
- (void)setWillTrimDatabaseAfterResults:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NNMKProtoFetchRequest

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

- (void)setWantsBatchedResponse:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_wantsBatchedResponse = a3;
}

- (void)setHasWantsBatchedResponse:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWantsBatchedResponse
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasCurrentMessageIdsAndStatus
{
  return self->_currentMessageIdsAndStatus != 0;
}

- (BOOL)hasCurrentDateForRequestingMoreMessages
{
  return self->_currentDateForRequestingMoreMessages != 0;
}

- (void)setWillTrimDatabaseAfterResults:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_willTrimDatabaseAfterResults = a3;
}

- (void)setHasWillTrimDatabaseAfterResults:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasWillTrimDatabaseAfterResults
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasMailboxId
{
  return self->_mailboxId != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NNMKProtoFetchRequest;
  v4 = [(NNMKProtoFetchRequest *)&v8 description];
  v5 = [(NNMKProtoFetchRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithUnsignedInt:self->_fullSyncVersion];
    [v3 setObject:v4 forKey:@"fullSyncVersion"];
  }
  conversationId = self->_conversationId;
  if (conversationId) {
    [v3 setObject:conversationId forKey:@"conversationId"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v6 = [NSNumber numberWithBool:self->_wantsBatchedResponse];
    [v3 setObject:v6 forKey:@"wantsBatchedResponse"];
  }
  currentMessageIdsAndStatus = self->_currentMessageIdsAndStatus;
  if (currentMessageIdsAndStatus) {
    [v3 setObject:currentMessageIdsAndStatus forKey:@"currentMessageIdsAndStatus"];
  }
  currentDateForRequestingMoreMessages = self->_currentDateForRequestingMoreMessages;
  if (currentDateForRequestingMoreMessages) {
    [v3 setObject:currentDateForRequestingMoreMessages forKey:@"currentDateForRequestingMoreMessages"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v9 = [NSNumber numberWithBool:self->_willTrimDatabaseAfterResults];
    [v3 setObject:v9 forKey:@"willTrimDatabaseAfterResults"];
  }
  mailboxId = self->_mailboxId;
  if (mailboxId) {
    [v3 setObject:mailboxId forKey:@"mailboxId"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoFetchRequestReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_currentMessageIdsAndStatus)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_currentDateForRequestingMoreMessages)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
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
    v4[8] = self->_fullSyncVersion;
    *((unsigned char *)v4 + 52) |= 1u;
  }
  id v5 = v4;
  if (self->_conversationId)
  {
    objc_msgSend(v4, "setConversationId:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((unsigned char *)v4 + 48) = self->_wantsBatchedResponse;
    *((unsigned char *)v4 + 52) |= 2u;
  }
  if (self->_currentMessageIdsAndStatus)
  {
    objc_msgSend(v5, "setCurrentMessageIdsAndStatus:");
    id v4 = v5;
  }
  if (self->_currentDateForRequestingMoreMessages)
  {
    objc_msgSend(v5, "setCurrentDateForRequestingMoreMessages:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((unsigned char *)v4 + 49) = self->_willTrimDatabaseAfterResults;
    *((unsigned char *)v4 + 52) |= 4u;
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
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 32) = self->_fullSyncVersion;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_conversationId copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v7;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v6 + 48) = self->_wantsBatchedResponse;
    *(unsigned char *)(v6 + 52) |= 2u;
  }
  uint64_t v9 = [(NSData *)self->_currentMessageIdsAndStatus copyWithZone:a3];
  v10 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v9;

  uint64_t v11 = [(NSData *)self->_currentDateForRequestingMoreMessages copyWithZone:a3];
  v12 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v11;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(unsigned char *)(v6 + 49) = self->_willTrimDatabaseAfterResults;
    *(unsigned char *)(v6 + 52) |= 4u;
  }
  uint64_t v13 = [(NSString *)self->_mailboxId copyWithZone:a3];
  v14 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v13;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_fullSyncVersion != *((_DWORD *)v4 + 8)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_26;
  }
  conversationId = self->_conversationId;
  if ((unint64_t)conversationId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](conversationId, "isEqual:")) {
      goto LABEL_26;
    }
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0) {
      goto LABEL_26;
    }
    if (self->_wantsBatchedResponse)
    {
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_26;
      }
    }
    else if (*((unsigned char *)v4 + 48))
    {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    goto LABEL_26;
  }
  currentMessageIdsAndStatus = self->_currentMessageIdsAndStatus;
  if ((unint64_t)currentMessageIdsAndStatus | *((void *)v4 + 3)
    && !-[NSData isEqual:](currentMessageIdsAndStatus, "isEqual:"))
  {
    goto LABEL_26;
  }
  currentDateForRequestingMoreMessages = self->_currentDateForRequestingMoreMessages;
  if ((unint64_t)currentDateForRequestingMoreMessages | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](currentDateForRequestingMoreMessages, "isEqual:")) {
      goto LABEL_26;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    if ((*((unsigned char *)v4 + 52) & 4) == 0) {
      goto LABEL_32;
    }
LABEL_26:
    char v9 = 0;
    goto LABEL_27;
  }
  if ((*((unsigned char *)v4 + 52) & 4) == 0) {
    goto LABEL_26;
  }
  if (!self->_willTrimDatabaseAfterResults)
  {
    if (!*((unsigned char *)v4 + 49)) {
      goto LABEL_32;
    }
    goto LABEL_26;
  }
  if (!*((unsigned char *)v4 + 49)) {
    goto LABEL_26;
  }
LABEL_32:
  mailboxId = self->_mailboxId;
  if ((unint64_t)mailboxId | *((void *)v4 + 5)) {
    char v9 = -[NSString isEqual:](mailboxId, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_27:

  return v9;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_fullSyncVersion;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_conversationId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_wantsBatchedResponse;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = [(NSData *)self->_currentMessageIdsAndStatus hash];
  uint64_t v7 = [(NSData *)self->_currentDateForRequestingMoreMessages hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v8 = 2654435761 * self->_willTrimDatabaseAfterResults;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSString *)self->_mailboxId hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((unsigned char *)v4 + 52))
  {
    self->_fullSyncVersion = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
  id v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[NNMKProtoFetchRequest setConversationId:](self, "setConversationId:");
    id v4 = v5;
  }
  if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    self->_wantsBatchedResponse = *((unsigned char *)v4 + 48);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 3))
  {
    -[NNMKProtoFetchRequest setCurrentMessageIdsAndStatus:](self, "setCurrentMessageIdsAndStatus:");
    id v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[NNMKProtoFetchRequest setCurrentDateForRequestingMoreMessages:](self, "setCurrentDateForRequestingMoreMessages:");
    id v4 = v5;
  }
  if ((*((unsigned char *)v4 + 52) & 4) != 0)
  {
    self->_willTrimDatabaseAfterResults = *((unsigned char *)v4 + 49);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 5))
  {
    -[NNMKProtoFetchRequest setMailboxId:](self, "setMailboxId:");
    id v4 = v5;
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

- (BOOL)wantsBatchedResponse
{
  return self->_wantsBatchedResponse;
}

- (NSData)currentMessageIdsAndStatus
{
  return self->_currentMessageIdsAndStatus;
}

- (void)setCurrentMessageIdsAndStatus:(id)a3
{
}

- (NSData)currentDateForRequestingMoreMessages
{
  return self->_currentDateForRequestingMoreMessages;
}

- (void)setCurrentDateForRequestingMoreMessages:(id)a3
{
}

- (BOOL)willTrimDatabaseAfterResults
{
  return self->_willTrimDatabaseAfterResults;
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
  objc_storeStrong((id *)&self->_currentMessageIdsAndStatus, 0);
  objc_storeStrong((id *)&self->_currentDateForRequestingMoreMessages, 0);
  objc_storeStrong((id *)&self->_conversationId, 0);
}

@end