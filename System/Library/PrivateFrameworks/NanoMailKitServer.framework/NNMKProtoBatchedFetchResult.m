@interface NNMKProtoBatchedFetchResult
+ (Class)messageAdditionType;
+ (Class)messageDeletionType;
+ (Class)messageUpdateType;
- (BOOL)hasDateForRequestingMoreMessages;
- (BOOL)hasDateSynced;
- (BOOL)hasFullSyncVersion;
- (BOOL)hasMailboxId;
- (BOOL)hasMailboxSyncVersion;
- (BOOL)hasShouldTrimDatabase;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldTrimDatabase;
- (NSData)dateForRequestingMoreMessages;
- (NSData)dateSynced;
- (NSMutableArray)messageAdditions;
- (NSMutableArray)messageDeletions;
- (NSMutableArray)messageUpdates;
- (NSString)mailboxId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)messageAdditionAtIndex:(unint64_t)a3;
- (id)messageDeletionAtIndex:(unint64_t)a3;
- (id)messageUpdateAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)messageAdditionsCount;
- (unint64_t)messageDeletionsCount;
- (unint64_t)messageUpdatesCount;
- (unsigned)fullSyncVersion;
- (unsigned)mailboxSyncVersion;
- (void)addMessageAddition:(id)a3;
- (void)addMessageDeletion:(id)a3;
- (void)addMessageUpdate:(id)a3;
- (void)clearMessageAdditions;
- (void)clearMessageDeletions;
- (void)clearMessageUpdates;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDateForRequestingMoreMessages:(id)a3;
- (void)setDateSynced:(id)a3;
- (void)setFullSyncVersion:(unsigned int)a3;
- (void)setHasFullSyncVersion:(BOOL)a3;
- (void)setHasMailboxSyncVersion:(BOOL)a3;
- (void)setHasShouldTrimDatabase:(BOOL)a3;
- (void)setMailboxId:(id)a3;
- (void)setMailboxSyncVersion:(unsigned int)a3;
- (void)setMessageAdditions:(id)a3;
- (void)setMessageDeletions:(id)a3;
- (void)setMessageUpdates:(id)a3;
- (void)setShouldTrimDatabase:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NNMKProtoBatchedFetchResult

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

- (void)clearMessageUpdates
{
}

- (void)addMessageUpdate:(id)a3
{
  id v4 = a3;
  messageUpdates = self->_messageUpdates;
  id v8 = v4;
  if (!messageUpdates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_messageUpdates;
    self->_messageUpdates = v6;

    id v4 = v8;
    messageUpdates = self->_messageUpdates;
  }
  [(NSMutableArray *)messageUpdates addObject:v4];
}

- (unint64_t)messageUpdatesCount
{
  return [(NSMutableArray *)self->_messageUpdates count];
}

- (id)messageUpdateAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_messageUpdates objectAtIndex:a3];
}

+ (Class)messageUpdateType
{
  return (Class)objc_opt_class();
}

- (void)clearMessageDeletions
{
}

- (void)addMessageDeletion:(id)a3
{
  id v4 = a3;
  messageDeletions = self->_messageDeletions;
  id v8 = v4;
  if (!messageDeletions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_messageDeletions;
    self->_messageDeletions = v6;

    id v4 = v8;
    messageDeletions = self->_messageDeletions;
  }
  [(NSMutableArray *)messageDeletions addObject:v4];
}

- (unint64_t)messageDeletionsCount
{
  return [(NSMutableArray *)self->_messageDeletions count];
}

- (id)messageDeletionAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_messageDeletions objectAtIndex:a3];
}

+ (Class)messageDeletionType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasDateForRequestingMoreMessages
{
  return self->_dateForRequestingMoreMessages != 0;
}

- (void)setShouldTrimDatabase:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_shouldTrimDatabase = a3;
}

- (void)setHasShouldTrimDatabase:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasShouldTrimDatabase
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
  v8.super_class = (Class)NNMKProtoBatchedFetchResult;
  id v4 = [(NNMKProtoBatchedFetchResult *)&v8 description];
  v5 = [(NNMKProtoBatchedFetchResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v47 = *MEMORY[0x263EF8340];
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
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v7 = self->_messageAdditions;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v41 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v40 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"messageAddition"];
  }
  if ([(NSMutableArray *)self->_messageUpdates count])
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_messageUpdates, "count"));
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v14 = self->_messageUpdates;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v36 objects:v45 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v37 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v36 + 1) + 8 * j) dictionaryRepresentation];
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v36 objects:v45 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKey:@"messageUpdate"];
  }
  if ([(NSMutableArray *)self->_messageDeletions count])
  {
    v20 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_messageDeletions, "count"));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v21 = self->_messageDeletions;
    uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v32 objects:v44 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v33;
      do
      {
        for (uint64_t k = 0; k != v23; ++k)
        {
          if (*(void *)v33 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * k), "dictionaryRepresentation", (void)v32);
          [v20 addObject:v26];
        }
        uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v32 objects:v44 count:16];
      }
      while (v23);
    }

    [v3 setObject:v20 forKey:@"messageDeletion"];
  }
  dateForRequestingMoreMessages = self->_dateForRequestingMoreMessages;
  if (dateForRequestingMoreMessages) {
    [v3 setObject:dateForRequestingMoreMessages forKey:@"dateForRequestingMoreMessages"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v28 = [NSNumber numberWithBool:self->_shouldTrimDatabase];
    [v3 setObject:v28 forKey:@"shouldTrimDatabase"];
  }
  mailboxId = self->_mailboxId;
  if (mailboxId) {
    [v3 setObject:mailboxId forKey:@"mailboxId"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v30 = [NSNumber numberWithUnsignedInt:self->_mailboxSyncVersion];
    [v3 setObject:v30 forKey:@"mailboxSyncVersion"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoBatchedFetchResultReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_dateSynced) {
    PBDataWriterWriteDataField();
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v5 = self->_messageAdditions;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v10 = self->_messageUpdates;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v15 = self->_messageDeletions;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
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
    *((unsigned char *)v4 + 76) |= 1u;
  }
  uint64_t v18 = v4;
  if (self->_dateSynced) {
    objc_msgSend(v4, "setDateSynced:");
  }
  if ([(NNMKProtoBatchedFetchResult *)self messageAdditionsCount])
  {
    [v18 clearMessageAdditions];
    unint64_t v5 = [(NNMKProtoBatchedFetchResult *)self messageAdditionsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(NNMKProtoBatchedFetchResult *)self messageAdditionAtIndex:i];
        [v18 addMessageAddition:v8];
      }
    }
  }
  if ([(NNMKProtoBatchedFetchResult *)self messageUpdatesCount])
  {
    [v18 clearMessageUpdates];
    unint64_t v9 = [(NNMKProtoBatchedFetchResult *)self messageUpdatesCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(NNMKProtoBatchedFetchResult *)self messageUpdateAtIndex:j];
        [v18 addMessageUpdate:v12];
      }
    }
  }
  if ([(NNMKProtoBatchedFetchResult *)self messageDeletionsCount])
  {
    [v18 clearMessageDeletions];
    unint64_t v13 = [(NNMKProtoBatchedFetchResult *)self messageDeletionsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        uint64_t v16 = [(NNMKProtoBatchedFetchResult *)self messageDeletionAtIndex:k];
        [v18 addMessageDeletion:v16];
      }
    }
  }
  if (self->_dateForRequestingMoreMessages) {
    objc_msgSend(v18, "setDateForRequestingMoreMessages:");
  }
  uint64_t v17 = v18;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v18[72] = self->_shouldTrimDatabase;
    v18[76] |= 4u;
  }
  if (self->_mailboxId)
  {
    objc_msgSend(v18, "setMailboxId:");
    uint64_t v17 = v18;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v17 + 10) = self->_mailboxSyncVersion;
    v17[76] |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_fullSyncVersion;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
  uint64_t v7 = [(NSData *)self->_dateSynced copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  unint64_t v9 = self->_messageAdditions;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v41;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v41 != v12) {
          objc_enumerationMutation(v9);
        }
        unint64_t v14 = (void *)[*(id *)(*((void *)&v40 + 1) + 8 * v13) copyWithZone:a3];
        [(id)v6 addMessageAddition:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v11);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v15 = self->_messageUpdates;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v37;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v37 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = (void *)[*(id *)(*((void *)&v36 + 1) + 8 * v19) copyWithZone:a3];
        [(id)v6 addMessageUpdate:v20];

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v17);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v21 = self->_messageDeletions;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v33;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v33 != v24) {
          objc_enumerationMutation(v21);
        }
        long long v26 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * v25), "copyWithZone:", a3, (void)v32);
        [(id)v6 addMessageDeletion:v26];

        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v32 objects:v44 count:16];
    }
    while (v23);
  }

  uint64_t v27 = [(NSData *)self->_dateForRequestingMoreMessages copyWithZone:a3];
  long long v28 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v27;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(unsigned char *)(v6 + 72) = self->_shouldTrimDatabase;
    *(unsigned char *)(v6 + 76) |= 4u;
  }
  uint64_t v29 = -[NSString copyWithZone:](self->_mailboxId, "copyWithZone:", a3, (void)v32);
  long long v30 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v29;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_mailboxSyncVersion;
    *(unsigned char *)(v6 + 76) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_fullSyncVersion != *((_DWORD *)v4 + 6)) {
      goto LABEL_32;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
    goto LABEL_32;
  }
  dateSynced = self->_dateSynced;
  if ((unint64_t)dateSynced | *((void *)v4 + 2) && !-[NSData isEqual:](dateSynced, "isEqual:")) {
    goto LABEL_32;
  }
  messageAdditions = self->_messageAdditions;
  if ((unint64_t)messageAdditions | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](messageAdditions, "isEqual:")) {
      goto LABEL_32;
    }
  }
  messageUpdates = self->_messageUpdates;
  if ((unint64_t)messageUpdates | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](messageUpdates, "isEqual:")) {
      goto LABEL_32;
    }
  }
  messageDeletions = self->_messageDeletions;
  if ((unint64_t)messageDeletions | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](messageDeletions, "isEqual:")) {
      goto LABEL_32;
    }
  }
  dateForRequestingMoreMessages = self->_dateForRequestingMoreMessages;
  if ((unint64_t)dateForRequestingMoreMessages | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](dateForRequestingMoreMessages, "isEqual:")) {
      goto LABEL_32;
    }
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 4) == 0) {
      goto LABEL_32;
    }
    if (self->_shouldTrimDatabase)
    {
      if (!*((unsigned char *)v4 + 72)) {
        goto LABEL_32;
      }
    }
    else if (*((unsigned char *)v4 + 72))
    {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 4) != 0)
  {
    goto LABEL_32;
  }
  mailboxId = self->_mailboxId;
  if (!((unint64_t)mailboxId | *((void *)v4 + 4))) {
    goto LABEL_28;
  }
  if (!-[NSString isEqual:](mailboxId, "isEqual:"))
  {
LABEL_32:
    BOOL v12 = 0;
    goto LABEL_33;
  }
  char has = (char)self->_has;
LABEL_28:
  BOOL v12 = (*((unsigned char *)v4 + 76) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) == 0 || self->_mailboxSyncVersion != *((_DWORD *)v4 + 10)) {
      goto LABEL_32;
    }
    BOOL v12 = 1;
  }
LABEL_33:

  return v12;
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
  uint64_t v6 = [(NSMutableArray *)self->_messageUpdates hash];
  uint64_t v7 = [(NSMutableArray *)self->_messageDeletions hash];
  uint64_t v8 = [(NSData *)self->_dateForRequestingMoreMessages hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v9 = 2654435761 * self->_shouldTrimDatabase;
  }
  else {
    uint64_t v9 = 0;
  }
  NSUInteger v10 = [(NSString *)self->_mailboxId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v11 = 2654435761 * self->_mailboxSyncVersion;
  }
  else {
    uint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v4 = a3;
  id v5 = v4;
  if (v4[19])
  {
    self->_fullSyncVersion = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2)) {
    -[NNMKProtoBatchedFetchResult setDateSynced:](self, "setDateSynced:");
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = *((id *)v5 + 6);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        [(NNMKProtoBatchedFetchResult *)self addMessageAddition:*(void *)(*((void *)&v29 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v8);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = *((id *)v5 + 8);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        [(NNMKProtoBatchedFetchResult *)self addMessageUpdate:*(void *)(*((void *)&v25 + 1) + 8 * j)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v13);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v16 = *((id *)v5 + 7);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        -[NNMKProtoBatchedFetchResult addMessageDeletion:](self, "addMessageDeletion:", *(void *)(*((void *)&v21 + 1) + 8 * k), (void)v21);
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v18);
  }

  if (*((void *)v5 + 1)) {
    -[NNMKProtoBatchedFetchResult setDateForRequestingMoreMessages:](self, "setDateForRequestingMoreMessages:");
  }
  if ((*((unsigned char *)v5 + 76) & 4) != 0)
  {
    self->_shouldTrimDatabase = *((unsigned char *)v5 + 72);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v5 + 4)) {
    -[NNMKProtoBatchedFetchResult setMailboxId:](self, "setMailboxId:");
  }
  if ((*((unsigned char *)v5 + 76) & 2) != 0)
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

- (NSMutableArray)messageUpdates
{
  return self->_messageUpdates;
}

- (void)setMessageUpdates:(id)a3
{
}

- (NSMutableArray)messageDeletions
{
  return self->_messageDeletions;
}

- (void)setMessageDeletions:(id)a3
{
}

- (NSData)dateForRequestingMoreMessages
{
  return self->_dateForRequestingMoreMessages;
}

- (void)setDateForRequestingMoreMessages:(id)a3
{
}

- (BOOL)shouldTrimDatabase
{
  return self->_shouldTrimDatabase;
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
  objc_storeStrong((id *)&self->_messageUpdates, 0);
  objc_storeStrong((id *)&self->_messageDeletions, 0);
  objc_storeStrong((id *)&self->_messageAdditions, 0);
  objc_storeStrong((id *)&self->_mailboxId, 0);
  objc_storeStrong((id *)&self->_dateSynced, 0);
  objc_storeStrong((id *)&self->_dateForRequestingMoreMessages, 0);
}

@end