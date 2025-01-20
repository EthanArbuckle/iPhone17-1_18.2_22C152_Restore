@interface NNMKProtoMoreMessagesForConversation
+ (Class)addedMessageType;
- (BOOL)hasConversationId;
- (BOOL)hasDateSynced;
- (BOOL)hasFullSyncVersion;
- (BOOL)hasMailboxId;
- (BOOL)hasMailboxSyncVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)dateSynced;
- (NSMutableArray)addedMessages;
- (NSString)conversationId;
- (NSString)mailboxId;
- (id)addedMessageAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)addedMessagesCount;
- (unint64_t)hash;
- (unsigned)fullSyncVersion;
- (unsigned)mailboxSyncVersion;
- (void)addAddedMessage:(id)a3;
- (void)clearAddedMessages;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAddedMessages:(id)a3;
- (void)setConversationId:(id)a3;
- (void)setDateSynced:(id)a3;
- (void)setFullSyncVersion:(unsigned int)a3;
- (void)setHasFullSyncVersion:(BOOL)a3;
- (void)setHasMailboxSyncVersion:(BOOL)a3;
- (void)setMailboxId:(id)a3;
- (void)setMailboxSyncVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NNMKProtoMoreMessagesForConversation

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

- (BOOL)hasDateSynced
{
  return self->_dateSynced != 0;
}

- (BOOL)hasConversationId
{
  return self->_conversationId != 0;
}

- (void)clearAddedMessages
{
}

- (void)addAddedMessage:(id)a3
{
  id v4 = a3;
  addedMessages = self->_addedMessages;
  id v8 = v4;
  if (!addedMessages)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_addedMessages;
    self->_addedMessages = v6;

    id v4 = v8;
    addedMessages = self->_addedMessages;
  }
  [(NSMutableArray *)addedMessages addObject:v4];
}

- (unint64_t)addedMessagesCount
{
  return [(NSMutableArray *)self->_addedMessages count];
}

- (id)addedMessageAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_addedMessages objectAtIndex:a3];
}

+ (Class)addedMessageType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasMailboxId
{
  return self->_mailboxId != 0;
}

- (void)setMailboxSyncVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_mailboxSyncVersion = a3;
}

- (void)setHasMailboxSyncVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMailboxSyncVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NNMKProtoMoreMessagesForConversation;
  id v4 = [(NNMKProtoMoreMessagesForConversation *)&v8 description];
  v5 = [(NNMKProtoMoreMessagesForConversation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithUnsignedInt:self->_fullSyncVersion];
    [v3 setObject:v4 forKey:@"fullSyncVersion"];
  }
  dateSynced = self->_dateSynced;
  if (dateSynced) {
    [v3 setObject:dateSynced forKey:@"dateSynced"];
  }
  conversationId = self->_conversationId;
  if (conversationId) {
    [v3 setObject:conversationId forKey:@"conversationId"];
  }
  if ([(NSMutableArray *)self->_addedMessages count])
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_addedMessages, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    objc_super v8 = self->_addedMessages;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (void)v17);
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"addedMessage"];
  }
  mailboxId = self->_mailboxId;
  if (mailboxId) {
    [v3 setObject:mailboxId forKey:@"mailboxId"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v15 = [NSNumber numberWithUnsignedInt:self->_mailboxSyncVersion];
    [v3 setObject:v15 forKey:@"mailboxSyncVersion"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoMoreMessagesForConversationReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_dateSynced) {
    PBDataWriterWriteDataField();
  }
  if (self->_conversationId) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_addedMessages;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_mailboxId) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
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
  id v9 = v4;
  if (self->_dateSynced) {
    objc_msgSend(v4, "setDateSynced:");
  }
  if (self->_conversationId) {
    objc_msgSend(v9, "setConversationId:");
  }
  if ([(NNMKProtoMoreMessagesForConversation *)self addedMessagesCount])
  {
    [v9 clearAddedMessages];
    unint64_t v5 = [(NNMKProtoMoreMessagesForConversation *)self addedMessagesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(NNMKProtoMoreMessagesForConversation *)self addedMessageAtIndex:i];
        [v9 addAddedMessage:v8];
      }
    }
  }
  if (self->_mailboxId) {
    objc_msgSend(v9, "setMailboxId:");
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v9 + 12) = self->_mailboxSyncVersion;
    *((unsigned char *)v9 + 52) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 32) = self->_fullSyncVersion;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
  uint64_t v7 = [(NSData *)self->_dateSynced copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v7;

  uint64_t v9 = [(NSString *)self->_conversationId copyWithZone:a3];
  long long v10 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v9;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v11 = self->_addedMessages;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v15), "copyWithZone:", a3, (void)v20);
        [(id)v6 addAddedMessage:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  uint64_t v17 = [(NSString *)self->_mailboxId copyWithZone:a3];
  long long v18 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v17;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_mailboxSyncVersion;
    *(unsigned char *)(v6 + 52) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_fullSyncVersion != *((_DWORD *)v4 + 8)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
LABEL_19:
    BOOL v9 = 0;
    goto LABEL_20;
  }
  dateSynced = self->_dateSynced;
  if ((unint64_t)dateSynced | *((void *)v4 + 3) && !-[NSData isEqual:](dateSynced, "isEqual:")) {
    goto LABEL_19;
  }
  conversationId = self->_conversationId;
  if ((unint64_t)conversationId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](conversationId, "isEqual:")) {
      goto LABEL_19;
    }
  }
  addedMessages = self->_addedMessages;
  if ((unint64_t)addedMessages | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](addedMessages, "isEqual:")) {
      goto LABEL_19;
    }
  }
  mailboxId = self->_mailboxId;
  if ((unint64_t)mailboxId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](mailboxId, "isEqual:")) {
      goto LABEL_19;
    }
  }
  BOOL v9 = (*((unsigned char *)v4 + 52) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_mailboxSyncVersion != *((_DWORD *)v4 + 12)) {
      goto LABEL_19;
    }
    BOOL v9 = 1;
  }
LABEL_20:

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
  uint64_t v4 = [(NSData *)self->_dateSynced hash];
  NSUInteger v5 = [(NSString *)self->_conversationId hash];
  uint64_t v6 = [(NSMutableArray *)self->_addedMessages hash];
  NSUInteger v7 = [(NSString *)self->_mailboxId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v8 = 2654435761 * self->_mailboxSyncVersion;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v4 = a3;
  id v5 = v4;
  if (v4[13])
  {
    self->_fullSyncVersion = v4[8];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3)) {
    -[NNMKProtoMoreMessagesForConversation setDateSynced:](self, "setDateSynced:");
  }
  if (*((void *)v5 + 2)) {
    -[NNMKProtoMoreMessagesForConversation setConversationId:](self, "setConversationId:");
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v5 + 1);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[NNMKProtoMoreMessagesForConversation addAddedMessage:](self, "addAddedMessage:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if (*((void *)v5 + 5)) {
    -[NNMKProtoMoreMessagesForConversation setMailboxId:](self, "setMailboxId:");
  }
  if ((*((unsigned char *)v5 + 52) & 2) != 0)
  {
    self->_mailboxSyncVersion = *((_DWORD *)v5 + 12);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unsigned)fullSyncVersion
{
  return self->_fullSyncVersion;
}

- (NSData)dateSynced
{
  return self->_dateSynced;
}

- (void)setDateSynced:(id)a3
{
}

- (NSString)conversationId
{
  return self->_conversationId;
}

- (void)setConversationId:(id)a3
{
}

- (NSMutableArray)addedMessages
{
  return self->_addedMessages;
}

- (void)setAddedMessages:(id)a3
{
}

- (NSString)mailboxId
{
  return self->_mailboxId;
}

- (void)setMailboxId:(id)a3
{
}

- (unsigned)mailboxSyncVersion
{
  return self->_mailboxSyncVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxId, 0);
  objc_storeStrong((id *)&self->_dateSynced, 0);
  objc_storeStrong((id *)&self->_conversationId, 0);
  objc_storeStrong((id *)&self->_addedMessages, 0);
}

@end