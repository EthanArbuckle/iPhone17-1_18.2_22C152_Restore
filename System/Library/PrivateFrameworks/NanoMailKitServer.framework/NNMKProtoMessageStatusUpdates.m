@interface NNMKProtoMessageStatusUpdates
+ (Class)messageStatusUpdateType;
- (BOOL)hasDateSynced;
- (BOOL)hasFullSyncVersion;
- (BOOL)hasMailboxId;
- (BOOL)hasMailboxSyncVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)dateSynced;
- (NSMutableArray)messageStatusUpdates;
- (NSString)mailboxId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)messageStatusUpdateAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)messageStatusUpdatesCount;
- (unsigned)fullSyncVersion;
- (unsigned)mailboxSyncVersion;
- (void)addMessageStatusUpdate:(id)a3;
- (void)clearMessageStatusUpdates;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDateSynced:(id)a3;
- (void)setFullSyncVersion:(unsigned int)a3;
- (void)setHasFullSyncVersion:(BOOL)a3;
- (void)setHasMailboxSyncVersion:(BOOL)a3;
- (void)setMailboxId:(id)a3;
- (void)setMailboxSyncVersion:(unsigned int)a3;
- (void)setMessageStatusUpdates:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NNMKProtoMessageStatusUpdates

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

- (void)clearMessageStatusUpdates
{
}

- (void)addMessageStatusUpdate:(id)a3
{
  id v4 = a3;
  messageStatusUpdates = self->_messageStatusUpdates;
  id v8 = v4;
  if (!messageStatusUpdates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_messageStatusUpdates;
    self->_messageStatusUpdates = v6;

    id v4 = v8;
    messageStatusUpdates = self->_messageStatusUpdates;
  }
  [(NSMutableArray *)messageStatusUpdates addObject:v4];
}

- (unint64_t)messageStatusUpdatesCount
{
  return [(NSMutableArray *)self->_messageStatusUpdates count];
}

- (id)messageStatusUpdateAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_messageStatusUpdates objectAtIndex:a3];
}

+ (Class)messageStatusUpdateType
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
  v8.super_class = (Class)NNMKProtoMessageStatusUpdates;
  id v4 = [(NNMKProtoMessageStatusUpdates *)&v8 description];
  v5 = [(NNMKProtoMessageStatusUpdates *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x263EF8340];
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
  if ([(NSMutableArray *)self->_messageStatusUpdates count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_messageStatusUpdates, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v7 = self->_messageStatusUpdates;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"messageStatusUpdate"];
  }
  mailboxId = self->_mailboxId;
  if (mailboxId) {
    [v3 setObject:mailboxId forKey:@"mailboxId"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v14 = [NSNumber numberWithUnsignedInt:self->_mailboxSyncVersion];
    [v3 setObject:v14 forKey:@"mailboxSyncVersion"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoMessageStatusUpdatesReadFrom(self, (uint64_t)a3);
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
  v5 = self->_messageStatusUpdates;
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
    v4[4] = self->_fullSyncVersion;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  id v9 = v4;
  if (self->_dateSynced) {
    objc_msgSend(v4, "setDateSynced:");
  }
  if ([(NNMKProtoMessageStatusUpdates *)self messageStatusUpdatesCount])
  {
    [v9 clearMessageStatusUpdates];
    unint64_t v5 = [(NNMKProtoMessageStatusUpdates *)self messageStatusUpdatesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(NNMKProtoMessageStatusUpdates *)self messageStatusUpdateAtIndex:i];
        [v9 addMessageStatusUpdate:v8];
      }
    }
  }
  if (self->_mailboxId) {
    objc_msgSend(v9, "setMailboxId:");
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v9 + 8) = self->_mailboxSyncVersion;
    *((unsigned char *)v9 + 48) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_fullSyncVersion;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  uint64_t v7 = [(NSData *)self->_dateSynced copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v7;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = self->_messageStatusUpdates;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v13), "copyWithZone:", a3, (void)v18);
        [(id)v6 addMessageStatusUpdate:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  uint64_t v15 = [(NSString *)self->_mailboxId copyWithZone:a3];
  long long v16 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v15;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_mailboxSyncVersion;
    *(unsigned char *)(v6 + 48) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_fullSyncVersion != *((_DWORD *)v4 + 4)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_17:
    BOOL v8 = 0;
    goto LABEL_18;
  }
  dateSynced = self->_dateSynced;
  if ((unint64_t)dateSynced | *((void *)v4 + 1) && !-[NSData isEqual:](dateSynced, "isEqual:")) {
    goto LABEL_17;
  }
  messageStatusUpdates = self->_messageStatusUpdates;
  if ((unint64_t)messageStatusUpdates | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](messageStatusUpdates, "isEqual:")) {
      goto LABEL_17;
    }
  }
  mailboxId = self->_mailboxId;
  if ((unint64_t)mailboxId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](mailboxId, "isEqual:")) {
      goto LABEL_17;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 48) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_mailboxSyncVersion != *((_DWORD *)v4 + 8)) {
      goto LABEL_17;
    }
    BOOL v8 = 1;
  }
LABEL_18:

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
  uint64_t v4 = [(NSData *)self->_dateSynced hash];
  uint64_t v5 = [(NSMutableArray *)self->_messageStatusUpdates hash];
  NSUInteger v6 = [(NSString *)self->_mailboxId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v7 = 2654435761 * self->_mailboxSyncVersion;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v4 = a3;
  id v5 = v4;
  if (v4[12])
  {
    self->_fullSyncVersion = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1)) {
    -[NNMKProtoMessageStatusUpdates setDateSynced:](self, "setDateSynced:");
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v5 + 5);
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
        -[NNMKProtoMessageStatusUpdates addMessageStatusUpdate:](self, "addMessageStatusUpdate:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if (*((void *)v5 + 3)) {
    -[NNMKProtoMessageStatusUpdates setMailboxId:](self, "setMailboxId:");
  }
  if ((*((unsigned char *)v5 + 48) & 2) != 0)
  {
    self->_mailboxSyncVersion = *((_DWORD *)v5 + 8);
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

- (NSMutableArray)messageStatusUpdates
{
  return self->_messageStatusUpdates;
}

- (void)setMessageStatusUpdates:(id)a3
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
  objc_storeStrong((id *)&self->_messageStatusUpdates, 0);
  objc_storeStrong((id *)&self->_mailboxId, 0);
  objc_storeStrong((id *)&self->_dateSynced, 0);
}

@end