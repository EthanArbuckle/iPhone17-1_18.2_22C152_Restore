@interface NNMKProtoMessagesFilteredOutWarning
+ (Class)removedMessageIdType;
- (BOOL)hasFullSyncVersion;
- (BOOL)hasMailboxId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)removedMessageIds;
- (NSString)mailboxId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)removedMessageIdAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)removedMessageIdsCount;
- (unsigned)fullSyncVersion;
- (void)addRemovedMessageId:(id)a3;
- (void)clearRemovedMessageIds;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFullSyncVersion:(unsigned int)a3;
- (void)setHasFullSyncVersion:(BOOL)a3;
- (void)setMailboxId:(id)a3;
- (void)setRemovedMessageIds:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NNMKProtoMessagesFilteredOutWarning

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

- (void)clearRemovedMessageIds
{
}

- (void)addRemovedMessageId:(id)a3
{
  id v4 = a3;
  removedMessageIds = self->_removedMessageIds;
  id v8 = v4;
  if (!removedMessageIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_removedMessageIds;
    self->_removedMessageIds = v6;

    id v4 = v8;
    removedMessageIds = self->_removedMessageIds;
  }
  [(NSMutableArray *)removedMessageIds addObject:v4];
}

- (unint64_t)removedMessageIdsCount
{
  return [(NSMutableArray *)self->_removedMessageIds count];
}

- (id)removedMessageIdAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_removedMessageIds objectAtIndex:a3];
}

+ (Class)removedMessageIdType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasMailboxId
{
  return self->_mailboxId != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NNMKProtoMessagesFilteredOutWarning;
  id v4 = [(NNMKProtoMessagesFilteredOutWarning *)&v8 description];
  v5 = [(NNMKProtoMessagesFilteredOutWarning *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithUnsignedInt:self->_fullSyncVersion];
    [v3 setObject:v4 forKey:@"fullSyncVersion"];
  }
  removedMessageIds = self->_removedMessageIds;
  if (removedMessageIds) {
    [v3 setObject:removedMessageIds forKey:@"removedMessageId"];
  }
  mailboxId = self->_mailboxId;
  if (mailboxId) {
    [v3 setObject:mailboxId forKey:@"mailboxId"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoMessagesFilteredOutWarningReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_removedMessageIds;
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
        PBDataWriterWriteStringField();
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
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_fullSyncVersion;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  id v9 = v4;
  if ([(NNMKProtoMessagesFilteredOutWarning *)self removedMessageIdsCount])
  {
    [v9 clearRemovedMessageIds];
    unint64_t v5 = [(NNMKProtoMessagesFilteredOutWarning *)self removedMessageIdsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(NNMKProtoMessagesFilteredOutWarning *)self removedMessageIdAtIndex:i];
        [v9 addRemovedMessageId:v8];
      }
    }
  }
  if (self->_mailboxId) {
    objc_msgSend(v9, "setMailboxId:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_fullSyncVersion;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = self->_removedMessageIds;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v11), "copyWithZone:", a3, (void)v16);
        [v6 addRemovedMessageId:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  uint64_t v13 = [(NSString *)self->_mailboxId copyWithZone:a3];
  v14 = (void *)v6[2];
  v6[2] = v13;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_fullSyncVersion != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  removedMessageIds = self->_removedMessageIds;
  if ((unint64_t)removedMessageIds | *((void *)v4 + 3)
    && !-[NSMutableArray isEqual:](removedMessageIds, "isEqual:"))
  {
    goto LABEL_11;
  }
  mailboxId = self->_mailboxId;
  if ((unint64_t)mailboxId | *((void *)v4 + 2)) {
    char v7 = -[NSString isEqual:](mailboxId, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_fullSyncVersion;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_removedMessageIds hash] ^ v3;
  return v4 ^ [(NSString *)self->_mailboxId hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (*((unsigned char *)v4 + 32))
  {
    self->_fullSyncVersion = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 3);
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
        -[NNMKProtoMessagesFilteredOutWarning addRemovedMessageId:](self, "addRemovedMessageId:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if (v5[2]) {
    -[NNMKProtoMessagesFilteredOutWarning setMailboxId:](self, "setMailboxId:");
  }
}

- (unsigned)fullSyncVersion
{
  return self->_fullSyncVersion;
}

- (NSMutableArray)removedMessageIds
{
  return self->_removedMessageIds;
}

- (void)setRemovedMessageIds:(id)a3
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
  objc_storeStrong((id *)&self->_removedMessageIds, 0);
  objc_storeStrong((id *)&self->_mailboxId, 0);
}

@end