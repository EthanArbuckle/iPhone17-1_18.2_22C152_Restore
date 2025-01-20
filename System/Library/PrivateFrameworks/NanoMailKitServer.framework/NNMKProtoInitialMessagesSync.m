@interface NNMKProtoInitialMessagesSync
+ (Class)initialMessageType;
- (BOOL)hasDateForRequestingMoreMessages;
- (BOOL)hasDateSynced;
- (BOOL)hasFullSyncVersion;
- (BOOL)hasMailbox;
- (BOOL)hasMailboxSyncVersion;
- (BOOL)hasOrganizedByThread;
- (BOOL)hasSyncedMailboxAccountId;
- (BOOL)hasSyncedMailboxCustomName;
- (BOOL)hasSyncedMailboxType;
- (BOOL)hasSyncedMailboxURL;
- (BOOL)isEqual:(id)a3;
- (BOOL)organizedByThread;
- (BOOL)readFrom:(id)a3;
- (NNMKProtoMailbox)mailbox;
- (NSData)dateForRequestingMoreMessages;
- (NSData)dateSynced;
- (NSMutableArray)initialMessages;
- (NSString)syncedMailboxAccountId;
- (NSString)syncedMailboxCustomName;
- (NSString)syncedMailboxURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)initialMessageAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)initialMessagesCount;
- (unsigned)fullSyncVersion;
- (unsigned)mailboxSyncVersion;
- (unsigned)syncedMailboxType;
- (void)addInitialMessage:(id)a3;
- (void)clearInitialMessages;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDateForRequestingMoreMessages:(id)a3;
- (void)setDateSynced:(id)a3;
- (void)setFullSyncVersion:(unsigned int)a3;
- (void)setHasFullSyncVersion:(BOOL)a3;
- (void)setHasMailboxSyncVersion:(BOOL)a3;
- (void)setHasOrganizedByThread:(BOOL)a3;
- (void)setHasSyncedMailboxType:(BOOL)a3;
- (void)setInitialMessages:(id)a3;
- (void)setMailbox:(id)a3;
- (void)setMailboxSyncVersion:(unsigned int)a3;
- (void)setOrganizedByThread:(BOOL)a3;
- (void)setSyncedMailboxAccountId:(id)a3;
- (void)setSyncedMailboxCustomName:(id)a3;
- (void)setSyncedMailboxType:(unsigned int)a3;
- (void)setSyncedMailboxURL:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NNMKProtoInitialMessagesSync

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

- (void)clearInitialMessages
{
}

- (void)addInitialMessage:(id)a3
{
  id v4 = a3;
  initialMessages = self->_initialMessages;
  id v8 = v4;
  if (!initialMessages)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_initialMessages;
    self->_initialMessages = v6;

    id v4 = v8;
    initialMessages = self->_initialMessages;
  }
  [(NSMutableArray *)initialMessages addObject:v4];
}

- (unint64_t)initialMessagesCount
{
  return [(NSMutableArray *)self->_initialMessages count];
}

- (id)initialMessageAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_initialMessages objectAtIndex:a3];
}

+ (Class)initialMessageType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasDateForRequestingMoreMessages
{
  return self->_dateForRequestingMoreMessages != 0;
}

- (void)setSyncedMailboxType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_syncedMailboxType = a3;
}

- (void)setHasSyncedMailboxType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSyncedMailboxType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasSyncedMailboxAccountId
{
  return self->_syncedMailboxAccountId != 0;
}

- (BOOL)hasSyncedMailboxURL
{
  return self->_syncedMailboxURL != 0;
}

- (BOOL)hasSyncedMailboxCustomName
{
  return self->_syncedMailboxCustomName != 0;
}

- (BOOL)hasMailbox
{
  return self->_mailbox != 0;
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

- (void)setOrganizedByThread:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_organizedByThread = a3;
}

- (void)setHasOrganizedByThread:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasOrganizedByThread
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NNMKProtoInitialMessagesSync;
  id v4 = [(NNMKProtoInitialMessagesSync *)&v8 description];
  v5 = [(NNMKProtoInitialMessagesSync *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v29 = *MEMORY[0x263EF8340];
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
  if ([(NSMutableArray *)self->_initialMessages count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_initialMessages, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v7 = self->_initialMessages;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "dictionaryRepresentation", (void)v24);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"initialMessage"];
  }
  dateForRequestingMoreMessages = self->_dateForRequestingMoreMessages;
  if (dateForRequestingMoreMessages) {
    [v3 setObject:dateForRequestingMoreMessages forKey:@"dateForRequestingMoreMessages"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v14 = [NSNumber numberWithUnsignedInt:self->_syncedMailboxType];
    [v3 setObject:v14 forKey:@"syncedMailboxType"];
  }
  syncedMailboxAccountId = self->_syncedMailboxAccountId;
  if (syncedMailboxAccountId) {
    [v3 setObject:syncedMailboxAccountId forKey:@"syncedMailboxAccountId"];
  }
  syncedMailboxURL = self->_syncedMailboxURL;
  if (syncedMailboxURL) {
    [v3 setObject:syncedMailboxURL forKey:@"syncedMailboxURL"];
  }
  syncedMailboxCustomName = self->_syncedMailboxCustomName;
  if (syncedMailboxCustomName) {
    [v3 setObject:syncedMailboxCustomName forKey:@"syncedMailboxCustomName"];
  }
  mailbox = self->_mailbox;
  if (mailbox)
  {
    v19 = [(NNMKProtoMailbox *)mailbox dictionaryRepresentation];
    [v3 setObject:v19 forKey:@"mailbox"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v21 = [NSNumber numberWithUnsignedInt:self->_mailboxSyncVersion];
    [v3 setObject:v21 forKey:@"mailboxSyncVersion"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v22 = [NSNumber numberWithBool:self->_organizedByThread];
    [v3 setObject:v22 forKey:@"organizedByThread"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoInitialMessagesSyncReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_dateSynced) {
    PBDataWriterWriteDataField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = self->_initialMessages;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  if (self->_dateForRequestingMoreMessages) {
    PBDataWriterWriteDataField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_syncedMailboxAccountId) {
    PBDataWriterWriteStringField();
  }
  if (self->_syncedMailboxURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_syncedMailboxCustomName) {
    PBDataWriterWriteStringField();
  }
  if (self->_mailbox) {
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[6] = self->_fullSyncVersion;
    *((unsigned char *)v4 + 92) |= 1u;
  }
  id v11 = v4;
  if (self->_dateSynced) {
    objc_msgSend(v4, "setDateSynced:");
  }
  if ([(NNMKProtoInitialMessagesSync *)self initialMessagesCount])
  {
    [v11 clearInitialMessages];
    unint64_t v5 = [(NNMKProtoInitialMessagesSync *)self initialMessagesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(NNMKProtoInitialMessagesSync *)self initialMessageAtIndex:i];
        [v11 addInitialMessage:v8];
      }
    }
  }
  if (self->_dateForRequestingMoreMessages) {
    objc_msgSend(v11, "setDateForRequestingMoreMessages:");
  }
  uint64_t v9 = v11;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v11 + 18) = self->_syncedMailboxType;
    *((unsigned char *)v11 + 92) |= 4u;
  }
  if (self->_syncedMailboxAccountId)
  {
    objc_msgSend(v11, "setSyncedMailboxAccountId:");
    uint64_t v9 = v11;
  }
  if (self->_syncedMailboxURL)
  {
    objc_msgSend(v11, "setSyncedMailboxURL:");
    uint64_t v9 = v11;
  }
  if (self->_syncedMailboxCustomName)
  {
    objc_msgSend(v11, "setSyncedMailboxCustomName:");
    uint64_t v9 = v11;
  }
  if (self->_mailbox)
  {
    objc_msgSend(v11, "setMailbox:");
    uint64_t v9 = v11;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v9[12] = self->_mailboxSyncVersion;
    *((unsigned char *)v9 + 92) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((unsigned char *)v9 + 88) = self->_organizedByThread;
    *((unsigned char *)v9 + 92) |= 8u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_fullSyncVersion;
    *(unsigned char *)(v5 + 92) |= 1u;
  }
  uint64_t v7 = [(NSData *)self->_dateSynced copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v9 = self->_initialMessages;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "copyWithZone:", a3, (void)v27);
        [(id)v6 addInitialMessage:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v11);
  }

  uint64_t v15 = [(NSData *)self->_dateForRequestingMoreMessages copyWithZone:a3];
  uint64_t v16 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v15;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 72) = self->_syncedMailboxType;
    *(unsigned char *)(v6 + 92) |= 4u;
  }
  uint64_t v17 = -[NSString copyWithZone:](self->_syncedMailboxAccountId, "copyWithZone:", a3, (void)v27);
  v18 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v17;

  uint64_t v19 = [(NSString *)self->_syncedMailboxURL copyWithZone:a3];
  v20 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v19;

  uint64_t v21 = [(NSString *)self->_syncedMailboxCustomName copyWithZone:a3];
  v22 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v21;

  id v23 = [(NNMKProtoMailbox *)self->_mailbox copyWithZone:a3];
  long long v24 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v23;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_mailboxSyncVersion;
    *(unsigned char *)(v6 + 92) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *(unsigned char *)(v6 + 88) = self->_organizedByThread;
    *(unsigned char *)(v6 + 92) |= 8u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_33;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 92) & 1) == 0 || self->_fullSyncVersion != *((_DWORD *)v4 + 6)) {
      goto LABEL_33;
    }
  }
  else if (*((unsigned char *)v4 + 92))
  {
    goto LABEL_33;
  }
  dateSynced = self->_dateSynced;
  if ((unint64_t)dateSynced | *((void *)v4 + 2) && !-[NSData isEqual:](dateSynced, "isEqual:")) {
    goto LABEL_33;
  }
  initialMessages = self->_initialMessages;
  if ((unint64_t)initialMessages | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](initialMessages, "isEqual:")) {
      goto LABEL_33;
    }
  }
  dateForRequestingMoreMessages = self->_dateForRequestingMoreMessages;
  if ((unint64_t)dateForRequestingMoreMessages | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](dateForRequestingMoreMessages, "isEqual:")) {
      goto LABEL_33;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 4) == 0 || self->_syncedMailboxType != *((_DWORD *)v4 + 18)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 92) & 4) != 0)
  {
    goto LABEL_33;
  }
  syncedMailboxAccountId = self->_syncedMailboxAccountId;
  if ((unint64_t)syncedMailboxAccountId | *((void *)v4 + 7)
    && !-[NSString isEqual:](syncedMailboxAccountId, "isEqual:"))
  {
    goto LABEL_33;
  }
  syncedMailboxURL = self->_syncedMailboxURL;
  if ((unint64_t)syncedMailboxURL | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](syncedMailboxURL, "isEqual:")) {
      goto LABEL_33;
    }
  }
  syncedMailboxCustomName = self->_syncedMailboxCustomName;
  if ((unint64_t)syncedMailboxCustomName | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](syncedMailboxCustomName, "isEqual:")) {
      goto LABEL_33;
    }
  }
  mailbox = self->_mailbox;
  if ((unint64_t)mailbox | *((void *)v4 + 5))
  {
    if (!-[NNMKProtoMailbox isEqual:](mailbox, "isEqual:")) {
      goto LABEL_33;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 2) == 0 || self->_mailboxSyncVersion != *((_DWORD *)v4 + 12)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 92) & 2) != 0)
  {
    goto LABEL_33;
  }
  BOOL v12 = (*((unsigned char *)v4 + 92) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 8) == 0)
    {
LABEL_33:
      BOOL v12 = 0;
      goto LABEL_34;
    }
    if (self->_organizedByThread)
    {
      if (!*((unsigned char *)v4 + 88)) {
        goto LABEL_33;
      }
    }
    else if (*((unsigned char *)v4 + 88))
    {
      goto LABEL_33;
    }
    BOOL v12 = 1;
  }
LABEL_34:

  return v12;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v14 = 2654435761 * self->_fullSyncVersion;
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t v3 = [(NSData *)self->_dateSynced hash];
  uint64_t v4 = [(NSMutableArray *)self->_initialMessages hash];
  uint64_t v5 = [(NSData *)self->_dateForRequestingMoreMessages hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v6 = 2654435761 * self->_syncedMailboxType;
  }
  else {
    uint64_t v6 = 0;
  }
  NSUInteger v7 = [(NSString *)self->_syncedMailboxAccountId hash];
  NSUInteger v8 = [(NSString *)self->_syncedMailboxURL hash];
  NSUInteger v9 = [(NSString *)self->_syncedMailboxCustomName hash];
  unint64_t v10 = [(NNMKProtoMailbox *)self->_mailbox hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v11 = 2654435761 * self->_mailboxSyncVersion;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_9;
    }
LABEL_11:
    uint64_t v12 = 0;
    return v3 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
  uint64_t v11 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v12 = 2654435761 * self->_organizedByThread;
  return v3 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v4 = a3;
  id v5 = v4;
  if (v4[23])
  {
    self->_fullSyncVersion = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2)) {
    -[NNMKProtoInitialMessagesSync setDateSynced:](self, "setDateSynced:");
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = *((id *)v5 + 4);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        -[NNMKProtoInitialMessagesSync addInitialMessage:](self, "addInitialMessage:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  if (*((void *)v5 + 1)) {
    -[NNMKProtoInitialMessagesSync setDateForRequestingMoreMessages:](self, "setDateForRequestingMoreMessages:");
  }
  if ((*((unsigned char *)v5 + 92) & 4) != 0)
  {
    self->_syncedMailboxType = *((_DWORD *)v5 + 18);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v5 + 7)) {
    -[NNMKProtoInitialMessagesSync setSyncedMailboxAccountId:](self, "setSyncedMailboxAccountId:");
  }
  if (*((void *)v5 + 10)) {
    -[NNMKProtoInitialMessagesSync setSyncedMailboxURL:](self, "setSyncedMailboxURL:");
  }
  if (*((void *)v5 + 8)) {
    -[NNMKProtoInitialMessagesSync setSyncedMailboxCustomName:](self, "setSyncedMailboxCustomName:");
  }
  mailbox = self->_mailbox;
  uint64_t v12 = *((void *)v5 + 5);
  if (mailbox)
  {
    if (v12) {
      -[NNMKProtoMailbox mergeFrom:](mailbox, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[NNMKProtoInitialMessagesSync setMailbox:](self, "setMailbox:");
  }
  char v13 = *((unsigned char *)v5 + 92);
  if ((v13 & 2) != 0)
  {
    self->_mailboxSyncVersion = *((_DWORD *)v5 + 12);
    *(unsigned char *)&self->_has |= 2u;
    char v13 = *((unsigned char *)v5 + 92);
  }
  if ((v13 & 8) != 0)
  {
    self->_organizedByThread = *((unsigned char *)v5 + 88);
    *(unsigned char *)&self->_has |= 8u;
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

- (NSMutableArray)initialMessages
{
  return self->_initialMessages;
}

- (void)setInitialMessages:(id)a3
{
}

- (NSData)dateForRequestingMoreMessages
{
  return self->_dateForRequestingMoreMessages;
}

- (void)setDateForRequestingMoreMessages:(id)a3
{
}

- (unsigned)syncedMailboxType
{
  return self->_syncedMailboxType;
}

- (NSString)syncedMailboxAccountId
{
  return self->_syncedMailboxAccountId;
}

- (void)setSyncedMailboxAccountId:(id)a3
{
}

- (NSString)syncedMailboxURL
{
  return self->_syncedMailboxURL;
}

- (void)setSyncedMailboxURL:(id)a3
{
}

- (NSString)syncedMailboxCustomName
{
  return self->_syncedMailboxCustomName;
}

- (void)setSyncedMailboxCustomName:(id)a3
{
}

- (NNMKProtoMailbox)mailbox
{
  return self->_mailbox;
}

- (void)setMailbox:(id)a3
{
}

- (unsigned)mailboxSyncVersion
{
  return self->_mailboxSyncVersion;
}

- (BOOL)organizedByThread
{
  return self->_organizedByThread;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncedMailboxURL, 0);
  objc_storeStrong((id *)&self->_syncedMailboxCustomName, 0);
  objc_storeStrong((id *)&self->_syncedMailboxAccountId, 0);
  objc_storeStrong((id *)&self->_mailbox, 0);
  objc_storeStrong((id *)&self->_initialMessages, 0);
  objc_storeStrong((id *)&self->_dateSynced, 0);
  objc_storeStrong((id *)&self->_dateForRequestingMoreMessages, 0);
}

@end