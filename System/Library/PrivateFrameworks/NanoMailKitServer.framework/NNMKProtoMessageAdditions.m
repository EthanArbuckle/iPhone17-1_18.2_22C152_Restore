@interface NNMKProtoMessageAdditions
+ (Class)messageAdditionType;
- (BOOL)hasDateForRequestingMoreMessages;
- (BOOL)hasDateSynced;
- (BOOL)hasFullSyncVersion;
- (BOOL)hasMailboxId;
- (BOOL)hasMailboxSyncVersion;
- (BOOL)hasMessagesAreNew;
- (BOOL)isEqual:(id)a3;
- (BOOL)messagesAreNew;
- (BOOL)readFrom:(id)a3;
- (NSData)dateForRequestingMoreMessages;
- (NSData)dateSynced;
- (NSMutableArray)messageAdditions;
- (NSString)mailboxId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)messageAdditionAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)messageAdditionsCount;
- (unsigned)fullSyncVersion;
- (unsigned)mailboxSyncVersion;
- (void)addMessageAddition:(id)a3;
- (void)clearMessageAdditions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDateForRequestingMoreMessages:(id)a3;
- (void)setDateSynced:(id)a3;
- (void)setFullSyncVersion:(unsigned int)a3;
- (void)setHasFullSyncVersion:(BOOL)a3;
- (void)setHasMailboxSyncVersion:(BOOL)a3;
- (void)setHasMessagesAreNew:(BOOL)a3;
- (void)setMailboxId:(id)a3;
- (void)setMailboxSyncVersion:(unsigned int)a3;
- (void)setMessageAdditions:(id)a3;
- (void)setMessagesAreNew:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NNMKProtoMessageAdditions

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

- (void)clearMessageAdditions
{
}

- (void)addMessageAddition:(id)a3
{
  id v4 = a3;
  messageAdditions = self->_messageAdditions;
  id v8 = v4;
  if (!messageAdditions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_messageAdditions;
    self->_messageAdditions = v6;

    id v4 = v8;
    messageAdditions = self->_messageAdditions;
  }
  [(NSMutableArray *)messageAdditions addObject:v4];
}

- (unint64_t)messageAdditionsCount
{
  return [(NSMutableArray *)self->_messageAdditions count];
}

- (id)messageAdditionAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_messageAdditions objectAtIndex:a3];
}

+ (Class)messageAdditionType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasDateForRequestingMoreMessages
{
  return self->_dateForRequestingMoreMessages != 0;
}

- (void)setMessagesAreNew:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_messagesAreNew = a3;
}

- (void)setHasMessagesAreNew:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMessagesAreNew
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)NNMKProtoMessageAdditions;
  id v4 = [(NNMKProtoMessageAdditions *)&v8 description];
  v5 = [(NNMKProtoMessageAdditions *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x263EF8340];
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
  if ([(NSMutableArray *)self->_messageAdditions count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_messageAdditions, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v7 = self->_messageAdditions;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"messageAddition"];
  }
  dateForRequestingMoreMessages = self->_dateForRequestingMoreMessages;
  if (dateForRequestingMoreMessages) {
    [v3 setObject:dateForRequestingMoreMessages forKey:@"dateForRequestingMoreMessages"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v14 = [NSNumber numberWithBool:self->_messagesAreNew];
    [v3 setObject:v14 forKey:@"messagesAreNew"];
  }
  mailboxId = self->_mailboxId;
  if (mailboxId) {
    [v3 setObject:mailboxId forKey:@"mailboxId"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v16 = [NSNumber numberWithUnsignedInt:self->_mailboxSyncVersion];
    [v3 setObject:v16 forKey:@"mailboxSyncVersion"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoMessageAdditionsReadFrom(self, (uint64_t)a3);
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
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_messageAdditions;
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

  if (self->_dateForRequestingMoreMessages) {
    PBDataWriterWriteDataField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteBOOLField();
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
    v4[6] = self->_fullSyncVersion;
    *((unsigned char *)v4 + 60) |= 1u;
  }
  long long v10 = v4;
  if (self->_dateSynced) {
    objc_msgSend(v4, "setDateSynced:");
  }
  if ([(NNMKProtoMessageAdditions *)self messageAdditionsCount])
  {
    [v10 clearMessageAdditions];
    unint64_t v5 = [(NNMKProtoMessageAdditions *)self messageAdditionsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(NNMKProtoMessageAdditions *)self messageAdditionAtIndex:i];
        [v10 addMessageAddition:v8];
      }
    }
  }
  if (self->_dateForRequestingMoreMessages) {
    objc_msgSend(v10, "setDateForRequestingMoreMessages:");
  }
  uint64_t v9 = v10;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v10[56] = self->_messagesAreNew;
    v10[60] |= 4u;
  }
  if (self->_mailboxId)
  {
    objc_msgSend(v10, "setMailboxId:");
    uint64_t v9 = v10;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v9 + 10) = self->_mailboxSyncVersion;
    v9[60] |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_fullSyncVersion;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  uint64_t v7 = [(NSData *)self->_dateSynced copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v9 = self->_messageAdditions;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v13), "copyWithZone:", a3, (void)v20);
        [(id)v6 addMessageAddition:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  uint64_t v15 = [(NSData *)self->_dateForRequestingMoreMessages copyWithZone:a3];
  v16 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v15;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(unsigned char *)(v6 + 56) = self->_messagesAreNew;
    *(unsigned char *)(v6 + 60) |= 4u;
  }
  uint64_t v17 = -[NSString copyWithZone:](self->_mailboxId, "copyWithZone:", a3, (void)v20);
  long long v18 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v17;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_mailboxSyncVersion;
    *(unsigned char *)(v6 + 60) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_fullSyncVersion != *((_DWORD *)v4 + 6)) {
      goto LABEL_28;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_28;
  }
  dateSynced = self->_dateSynced;
  if ((unint64_t)dateSynced | *((void *)v4 + 2) && !-[NSData isEqual:](dateSynced, "isEqual:")) {
    goto LABEL_28;
  }
  messageAdditions = self->_messageAdditions;
  if ((unint64_t)messageAdditions | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](messageAdditions, "isEqual:")) {
      goto LABEL_28;
    }
  }
  dateForRequestingMoreMessages = self->_dateForRequestingMoreMessages;
  if ((unint64_t)dateForRequestingMoreMessages | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](dateForRequestingMoreMessages, "isEqual:")) {
      goto LABEL_28;
    }
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) == 0) {
      goto LABEL_28;
    }
    if (self->_messagesAreNew)
    {
      if (!*((unsigned char *)v4 + 56)) {
        goto LABEL_28;
      }
    }
    else if (*((unsigned char *)v4 + 56))
    {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 4) != 0)
  {
    goto LABEL_28;
  }
  mailboxId = self->_mailboxId;
  if (!((unint64_t)mailboxId | *((void *)v4 + 4))) {
    goto LABEL_24;
  }
  if (!-[NSString isEqual:](mailboxId, "isEqual:"))
  {
LABEL_28:
    BOOL v10 = 0;
    goto LABEL_29;
  }
  char has = (char)self->_has;
LABEL_24:
  BOOL v10 = (*((unsigned char *)v4 + 60) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_mailboxSyncVersion != *((_DWORD *)v4 + 10)) {
      goto LABEL_28;
    }
    BOOL v10 = 1;
  }
LABEL_29:

  return v10;
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
  uint64_t v5 = [(NSMutableArray *)self->_messageAdditions hash];
  uint64_t v6 = [(NSData *)self->_dateForRequestingMoreMessages hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v7 = 2654435761 * self->_messagesAreNew;
  }
  else {
    uint64_t v7 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_mailboxId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v9 = 2654435761 * self->_mailboxSyncVersion;
  }
  else {
    uint64_t v9 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v4 = a3;
  id v5 = v4;
  if (v4[15])
  {
    self->_fullSyncVersion = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2)) {
    -[NNMKProtoMessageAdditions setDateSynced:](self, "setDateSynced:");
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v5 + 6);
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
        -[NNMKProtoMessageAdditions addMessageAddition:](self, "addMessageAddition:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if (*((void *)v5 + 1)) {
    -[NNMKProtoMessageAdditions setDateForRequestingMoreMessages:](self, "setDateForRequestingMoreMessages:");
  }
  if ((*((unsigned char *)v5 + 60) & 4) != 0)
  {
    self->_messagesAreNew = *((unsigned char *)v5 + 56);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v5 + 4)) {
    -[NNMKProtoMessageAdditions setMailboxId:](self, "setMailboxId:");
  }
  if ((*((unsigned char *)v5 + 60) & 2) != 0)
  {
    self->_mailboxSyncVersion = *((_DWORD *)v5 + 10);
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

- (NSMutableArray)messageAdditions
{
  return self->_messageAdditions;
}

- (void)setMessageAdditions:(id)a3
{
}

- (NSData)dateForRequestingMoreMessages
{
  return self->_dateForRequestingMoreMessages;
}

- (void)setDateForRequestingMoreMessages:(id)a3
{
}

- (BOOL)messagesAreNew
{
  return self->_messagesAreNew;
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
  objc_storeStrong((id *)&self->_messageAdditions, 0);
  objc_storeStrong((id *)&self->_mailboxId, 0);
  objc_storeStrong((id *)&self->_dateSynced, 0);
  objc_storeStrong((id *)&self->_dateForRequestingMoreMessages, 0);
}

@end