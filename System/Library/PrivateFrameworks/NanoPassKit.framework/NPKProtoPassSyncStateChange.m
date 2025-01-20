@interface NPKProtoPassSyncStateChange
+ (Class)remoteAssetsForPartialUpdateType;
- (BOOL)hasBaseManifestHashForPartialUpdate;
- (BOOL)hasCompanionCatalog;
- (BOOL)hasLastKnownReconciledPassSyncStateHash;
- (BOOL)hasLastKnownReconciledPassSyncStateHashVersion;
- (BOOL)hasPassData;
- (BOOL)hasPassSegmentIndex;
- (BOOL)hasPassSegmentTotal;
- (BOOL)hasSyncStateItem;
- (BOOL)hasWatchCatalog;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NPKProtoCatalog)companionCatalog;
- (NPKProtoCatalog)watchCatalog;
- (NPKProtoPassSyncStateItem)syncStateItem;
- (NSData)baseManifestHashForPartialUpdate;
- (NSData)changeUUID;
- (NSData)lastKnownReconciledPassSyncStateHash;
- (NSData)passData;
- (NSMutableArray)remoteAssetsForPartialUpdates;
- (NSString)uniqueID;
- (id)changeTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)npkDescription;
- (id)remoteAssetsForPartialUpdateAtIndex:(unint64_t)a3;
- (int)StringAsChangeType:(id)a3;
- (int)changeType;
- (unint64_t)hash;
- (unint64_t)remoteAssetsForPartialUpdatesCount;
- (unsigned)lastKnownReconciledPassSyncStateHashVersion;
- (unsigned)passSegmentIndex;
- (unsigned)passSegmentTotal;
- (void)addRemoteAssetsForPartialUpdate:(id)a3;
- (void)clearRemoteAssetsForPartialUpdates;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBaseManifestHashForPartialUpdate:(id)a3;
- (void)setChangeType:(int)a3;
- (void)setChangeUUID:(id)a3;
- (void)setCompanionCatalog:(id)a3;
- (void)setHasLastKnownReconciledPassSyncStateHashVersion:(BOOL)a3;
- (void)setHasPassSegmentIndex:(BOOL)a3;
- (void)setHasPassSegmentTotal:(BOOL)a3;
- (void)setLastKnownReconciledPassSyncStateHash:(id)a3;
- (void)setLastKnownReconciledPassSyncStateHashVersion:(unsigned int)a3;
- (void)setPassData:(id)a3;
- (void)setPassSegmentIndex:(unsigned int)a3;
- (void)setPassSegmentTotal:(unsigned int)a3;
- (void)setRemoteAssetsForPartialUpdates:(id)a3;
- (void)setSyncStateItem:(id)a3;
- (void)setUniqueID:(id)a3;
- (void)setWatchCatalog:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoPassSyncStateChange

- (BOOL)hasLastKnownReconciledPassSyncStateHash
{
  return self->_lastKnownReconciledPassSyncStateHash != 0;
}

- (id)changeTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_2644D7458[a3];
  }
  return v3;
}

- (int)StringAsChangeType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Add"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Update"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Remove"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasSyncStateItem
{
  return self->_syncStateItem != 0;
}

- (BOOL)hasPassData
{
  return self->_passData != 0;
}

- (void)setPassSegmentIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_passSegmentIndex = a3;
}

- (void)setHasPassSegmentIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPassSegmentIndex
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPassSegmentTotal:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_passSegmentTotal = a3;
}

- (void)setHasPassSegmentTotal:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPassSegmentTotal
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasCompanionCatalog
{
  return self->_companionCatalog != 0;
}

- (BOOL)hasBaseManifestHashForPartialUpdate
{
  return self->_baseManifestHashForPartialUpdate != 0;
}

- (void)clearRemoteAssetsForPartialUpdates
{
}

- (void)addRemoteAssetsForPartialUpdate:(id)a3
{
  id v4 = a3;
  remoteAssetsForPartialUpdates = self->_remoteAssetsForPartialUpdates;
  id v8 = v4;
  if (!remoteAssetsForPartialUpdates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_remoteAssetsForPartialUpdates;
    self->_remoteAssetsForPartialUpdates = v6;

    id v4 = v8;
    remoteAssetsForPartialUpdates = self->_remoteAssetsForPartialUpdates;
  }
  [(NSMutableArray *)remoteAssetsForPartialUpdates addObject:v4];
}

- (unint64_t)remoteAssetsForPartialUpdatesCount
{
  return [(NSMutableArray *)self->_remoteAssetsForPartialUpdates count];
}

- (id)remoteAssetsForPartialUpdateAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_remoteAssetsForPartialUpdates objectAtIndex:a3];
}

+ (Class)remoteAssetsForPartialUpdateType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasWatchCatalog
{
  return self->_watchCatalog != 0;
}

- (void)setLastKnownReconciledPassSyncStateHashVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_lastKnownReconciledPassSyncStateHashVersion = a3;
}

- (void)setHasLastKnownReconciledPassSyncStateHashVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLastKnownReconciledPassSyncStateHashVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoPassSyncStateChange;
  id v4 = [(NPKProtoPassSyncStateChange *)&v8 description];
  v5 = [(NPKProtoPassSyncStateChange *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  changeUUID = self->_changeUUID;
  if (changeUUID) {
    [v3 setObject:changeUUID forKey:@"changeUUID"];
  }
  lastKnownReconciledPassSyncStateHash = self->_lastKnownReconciledPassSyncStateHash;
  if (lastKnownReconciledPassSyncStateHash) {
    [v4 setObject:lastKnownReconciledPassSyncStateHash forKey:@"lastKnownReconciledPassSyncStateHash"];
  }
  uint64_t changeType = self->_changeType;
  if (changeType >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_changeType);
    objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v8 = off_2644D7458[changeType];
  }
  [v4 setObject:v8 forKey:@"changeType"];

  uniqueID = self->_uniqueID;
  if (uniqueID) {
    [v4 setObject:uniqueID forKey:@"uniqueID"];
  }
  syncStateItem = self->_syncStateItem;
  if (syncStateItem)
  {
    v11 = [(NPKProtoPassSyncStateItem *)syncStateItem dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"syncStateItem"];
  }
  passData = self->_passData;
  if (passData) {
    [v4 setObject:passData forKey:@"passData"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v14 = [NSNumber numberWithUnsignedInt:self->_passSegmentIndex];
    [v4 setObject:v14 forKey:@"passSegmentIndex"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v15 = [NSNumber numberWithUnsignedInt:self->_passSegmentTotal];
    [v4 setObject:v15 forKey:@"passSegmentTotal"];
  }
  companionCatalog = self->_companionCatalog;
  if (companionCatalog)
  {
    v17 = [(NPKProtoCatalog *)companionCatalog dictionaryRepresentation];
    [v4 setObject:v17 forKey:@"companionCatalog"];
  }
  baseManifestHashForPartialUpdate = self->_baseManifestHashForPartialUpdate;
  if (baseManifestHashForPartialUpdate) {
    [v4 setObject:baseManifestHashForPartialUpdate forKey:@"baseManifestHashForPartialUpdate"];
  }
  if ([(NSMutableArray *)self->_remoteAssetsForPartialUpdates count])
  {
    v19 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_remoteAssetsForPartialUpdates, "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v20 = self->_remoteAssetsForPartialUpdates;
    uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v31 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = [*(id *)(*((void *)&v30 + 1) + 8 * i) dictionaryRepresentation];
          [v19 addObject:v25];
        }
        uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v22);
    }

    [v4 setObject:v19 forKey:@"remoteAssetsForPartialUpdate"];
  }
  watchCatalog = self->_watchCatalog;
  if (watchCatalog)
  {
    v27 = [(NPKProtoCatalog *)watchCatalog dictionaryRepresentation];
    [v4 setObject:v27 forKey:@"watchCatalog"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v28 = [NSNumber numberWithUnsignedInt:self->_lastKnownReconciledPassSyncStateHashVersion];
    [v4 setObject:v28 forKey:@"lastKnownReconciledPassSyncStateHashVersion"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoPassSyncStateChangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_changeUUID) {
    -[NPKProtoPassSyncStateChange writeTo:]();
  }
  v5 = v4;
  PBDataWriterWriteDataField();
  if (self->_lastKnownReconciledPassSyncStateHash) {
    PBDataWriterWriteDataField();
  }
  PBDataWriterWriteInt32Field();
  if (!self->_uniqueID) {
    -[NPKProtoPassSyncStateChange writeTo:]();
  }
  PBDataWriterWriteStringField();
  if (self->_syncStateItem) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_passData) {
    PBDataWriterWriteDataField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_companionCatalog) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_baseManifestHashForPartialUpdate) {
    PBDataWriterWriteDataField();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v7 = self->_remoteAssetsForPartialUpdates;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  if (self->_watchCatalog) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  [v9 setChangeUUID:self->_changeUUID];
  if (self->_lastKnownReconciledPassSyncStateHash) {
    objc_msgSend(v9, "setLastKnownReconciledPassSyncStateHash:");
  }
  *((_DWORD *)v9 + 4) = self->_changeType;
  [v9 setUniqueID:self->_uniqueID];
  if (self->_syncStateItem) {
    objc_msgSend(v9, "setSyncStateItem:");
  }
  if (self->_passData) {
    objc_msgSend(v9, "setPassData:");
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v9 + 16) = self->_passSegmentIndex;
    *((unsigned char *)v9 + 104) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)v9 + 17) = self->_passSegmentTotal;
    *((unsigned char *)v9 + 104) |= 4u;
  }
  if (self->_companionCatalog) {
    objc_msgSend(v9, "setCompanionCatalog:");
  }
  if (self->_baseManifestHashForPartialUpdate) {
    objc_msgSend(v9, "setBaseManifestHashForPartialUpdate:");
  }
  if ([(NPKProtoPassSyncStateChange *)self remoteAssetsForPartialUpdatesCount])
  {
    [v9 clearRemoteAssetsForPartialUpdates];
    unint64_t v5 = [(NPKProtoPassSyncStateChange *)self remoteAssetsForPartialUpdatesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(NPKProtoPassSyncStateChange *)self remoteAssetsForPartialUpdateAtIndex:i];
        [v9 addRemoteAssetsForPartialUpdate:v8];
      }
    }
  }
  if (self->_watchCatalog) {
    objc_msgSend(v9, "setWatchCatalog:");
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v9 + 12) = self->_lastKnownReconciledPassSyncStateHashVersion;
    *((unsigned char *)v9 + 104) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_changeUUID copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSData *)self->_lastKnownReconciledPassSyncStateHash copyWithZone:a3];
  id v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  *(_DWORD *)(v5 + 16) = self->_changeType;
  uint64_t v10 = [(NSString *)self->_uniqueID copyWithZone:a3];
  v11 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v10;

  id v12 = [(NPKProtoPassSyncStateItem *)self->_syncStateItem copyWithZone:a3];
  long long v13 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v12;

  uint64_t v14 = [(NSData *)self->_passData copyWithZone:a3];
  long long v15 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v14;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_passSegmentIndex;
    *(unsigned char *)(v5 + 104) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_passSegmentTotal;
    *(unsigned char *)(v5 + 104) |= 4u;
  }
  id v17 = [(NPKProtoCatalog *)self->_companionCatalog copyWithZone:a3];
  v18 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v17;

  uint64_t v19 = [(NSData *)self->_baseManifestHashForPartialUpdate copyWithZone:a3];
  v20 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v19;

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v21 = self->_remoteAssetsForPartialUpdates;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "copyWithZone:", a3, (void)v30);
        [(id)v5 addRemoteAssetsForPartialUpdate:v26];
      }
      uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v23);
  }

  id v27 = [(NPKProtoCatalog *)self->_watchCatalog copyWithZone:a3];
  v28 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v27;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 48) = self->_lastKnownReconciledPassSyncStateHashVersion;
    *(unsigned char *)(v5 + 104) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_35;
  }
  changeUUID = self->_changeUUID;
  if ((unint64_t)changeUUID | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](changeUUID, "isEqual:")) {
      goto LABEL_35;
    }
  }
  lastKnownReconciledPassSyncStateHash = self->_lastKnownReconciledPassSyncStateHash;
  if ((unint64_t)lastKnownReconciledPassSyncStateHash | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](lastKnownReconciledPassSyncStateHash, "isEqual:")) {
      goto LABEL_35;
    }
  }
  if (self->_changeType != *((_DWORD *)v4 + 4)) {
    goto LABEL_35;
  }
  uniqueID = self->_uniqueID;
  if ((unint64_t)uniqueID | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](uniqueID, "isEqual:")) {
      goto LABEL_35;
    }
  }
  syncStateItem = self->_syncStateItem;
  if ((unint64_t)syncStateItem | *((void *)v4 + 10))
  {
    if (!-[NPKProtoPassSyncStateItem isEqual:](syncStateItem, "isEqual:")) {
      goto LABEL_35;
    }
  }
  passData = self->_passData;
  if ((unint64_t)passData | *((void *)v4 + 7))
  {
    if (!-[NSData isEqual:](passData, "isEqual:")) {
      goto LABEL_35;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 104) & 2) == 0 || self->_passSegmentIndex != *((_DWORD *)v4 + 16)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 104) & 2) != 0)
  {
LABEL_35:
    BOOL v14 = 0;
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 104) & 4) == 0 || self->_passSegmentTotal != *((_DWORD *)v4 + 17)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 104) & 4) != 0)
  {
    goto LABEL_35;
  }
  companionCatalog = self->_companionCatalog;
  if ((unint64_t)companionCatalog | *((void *)v4 + 4)
    && !-[NPKProtoCatalog isEqual:](companionCatalog, "isEqual:"))
  {
    goto LABEL_35;
  }
  baseManifestHashForPartialUpdate = self->_baseManifestHashForPartialUpdate;
  if ((unint64_t)baseManifestHashForPartialUpdate | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](baseManifestHashForPartialUpdate, "isEqual:")) {
      goto LABEL_35;
    }
  }
  remoteAssetsForPartialUpdates = self->_remoteAssetsForPartialUpdates;
  if ((unint64_t)remoteAssetsForPartialUpdates | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](remoteAssetsForPartialUpdates, "isEqual:")) {
      goto LABEL_35;
    }
  }
  watchCatalog = self->_watchCatalog;
  if ((unint64_t)watchCatalog | *((void *)v4 + 12))
  {
    if (!-[NPKProtoCatalog isEqual:](watchCatalog, "isEqual:")) {
      goto LABEL_35;
    }
  }
  BOOL v14 = (*((unsigned char *)v4 + 104) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 104) & 1) == 0 || self->_lastKnownReconciledPassSyncStateHashVersion != *((_DWORD *)v4 + 12)) {
      goto LABEL_35;
    }
    BOOL v14 = 1;
  }
LABEL_36:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v17 = [(NSData *)self->_changeUUID hash];
  uint64_t v3 = [(NSData *)self->_lastKnownReconciledPassSyncStateHash hash];
  uint64_t changeType = self->_changeType;
  uint64_t v16 = v3;
  NSUInteger v4 = [(NSString *)self->_uniqueID hash];
  unint64_t v5 = [(NPKProtoPassSyncStateItem *)self->_syncStateItem hash];
  uint64_t v6 = [(NSData *)self->_passData hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v7 = 2654435761 * self->_passSegmentIndex;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v8 = 2654435761 * self->_passSegmentTotal;
      goto LABEL_6;
    }
  }
  uint64_t v8 = 0;
LABEL_6:
  unint64_t v9 = [(NPKProtoCatalog *)self->_companionCatalog hash];
  uint64_t v10 = [(NSData *)self->_baseManifestHashForPartialUpdate hash];
  uint64_t v11 = [(NSMutableArray *)self->_remoteAssetsForPartialUpdates hash];
  unint64_t v12 = [(NPKProtoCatalog *)self->_watchCatalog hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v13 = 2654435761 * self->_lastKnownReconciledPassSyncStateHashVersion;
  }
  else {
    uint64_t v13 = 0;
  }
  return v16 ^ v17 ^ v4 ^ v5 ^ v6 ^ (2654435761 * changeType) ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 3)) {
    -[NPKProtoPassSyncStateChange setChangeUUID:](self, "setChangeUUID:");
  }
  if (*((void *)v4 + 5)) {
    -[NPKProtoPassSyncStateChange setLastKnownReconciledPassSyncStateHash:](self, "setLastKnownReconciledPassSyncStateHash:");
  }
  self->_uint64_t changeType = *((_DWORD *)v4 + 4);
  if (*((void *)v4 + 11)) {
    -[NPKProtoPassSyncStateChange setUniqueID:](self, "setUniqueID:");
  }
  syncStateItem = self->_syncStateItem;
  uint64_t v6 = *((void *)v4 + 10);
  if (syncStateItem)
  {
    if (v6) {
      -[NPKProtoPassSyncStateItem mergeFrom:](syncStateItem, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NPKProtoPassSyncStateChange setSyncStateItem:](self, "setSyncStateItem:");
  }
  if (*((void *)v4 + 7)) {
    -[NPKProtoPassSyncStateChange setPassData:](self, "setPassData:");
  }
  char v7 = *((unsigned char *)v4 + 104);
  if ((v7 & 2) != 0)
  {
    self->_passSegmentIndex = *((_DWORD *)v4 + 16);
    *(unsigned char *)&self->_has |= 2u;
    char v7 = *((unsigned char *)v4 + 104);
  }
  if ((v7 & 4) != 0)
  {
    self->_passSegmentTotal = *((_DWORD *)v4 + 17);
    *(unsigned char *)&self->_has |= 4u;
  }
  companionCatalog = self->_companionCatalog;
  uint64_t v9 = *((void *)v4 + 4);
  if (companionCatalog)
  {
    if (v9) {
      -[NPKProtoCatalog mergeFrom:](companionCatalog, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[NPKProtoPassSyncStateChange setCompanionCatalog:](self, "setCompanionCatalog:");
  }
  if (*((void *)v4 + 1)) {
    -[NPKProtoPassSyncStateChange setBaseManifestHashForPartialUpdate:](self, "setBaseManifestHashForPartialUpdate:");
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = *((id *)v4 + 9);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        -[NPKProtoPassSyncStateChange addRemoteAssetsForPartialUpdate:](self, "addRemoteAssetsForPartialUpdate:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  watchCatalog = self->_watchCatalog;
  uint64_t v16 = *((void *)v4 + 12);
  if (watchCatalog)
  {
    if (v16) {
      -[NPKProtoCatalog mergeFrom:](watchCatalog, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[NPKProtoPassSyncStateChange setWatchCatalog:](self, "setWatchCatalog:");
  }
  if (*((unsigned char *)v4 + 104))
  {
    self->_lastKnownReconciledPassSyncStateHashVersion = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSData)changeUUID
{
  return self->_changeUUID;
}

- (void)setChangeUUID:(id)a3
{
}

- (NSData)lastKnownReconciledPassSyncStateHash
{
  return self->_lastKnownReconciledPassSyncStateHash;
}

- (void)setLastKnownReconciledPassSyncStateHash:(id)a3
{
}

- (int)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(int)a3
{
  self->_uint64_t changeType = a3;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
}

- (NPKProtoPassSyncStateItem)syncStateItem
{
  return self->_syncStateItem;
}

- (void)setSyncStateItem:(id)a3
{
}

- (NSData)passData
{
  return self->_passData;
}

- (void)setPassData:(id)a3
{
}

- (unsigned)passSegmentIndex
{
  return self->_passSegmentIndex;
}

- (unsigned)passSegmentTotal
{
  return self->_passSegmentTotal;
}

- (NPKProtoCatalog)companionCatalog
{
  return self->_companionCatalog;
}

- (void)setCompanionCatalog:(id)a3
{
}

- (NSData)baseManifestHashForPartialUpdate
{
  return self->_baseManifestHashForPartialUpdate;
}

- (void)setBaseManifestHashForPartialUpdate:(id)a3
{
}

- (NSMutableArray)remoteAssetsForPartialUpdates
{
  return self->_remoteAssetsForPartialUpdates;
}

- (void)setRemoteAssetsForPartialUpdates:(id)a3
{
}

- (NPKProtoCatalog)watchCatalog
{
  return self->_watchCatalog;
}

- (void)setWatchCatalog:(id)a3
{
}

- (unsigned)lastKnownReconciledPassSyncStateHashVersion
{
  return self->_lastKnownReconciledPassSyncStateHashVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchCatalog, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_syncStateItem, 0);
  objc_storeStrong((id *)&self->_remoteAssetsForPartialUpdates, 0);
  objc_storeStrong((id *)&self->_passData, 0);
  objc_storeStrong((id *)&self->_lastKnownReconciledPassSyncStateHash, 0);
  objc_storeStrong((id *)&self->_companionCatalog, 0);
  objc_storeStrong((id *)&self->_changeUUID, 0);
  objc_storeStrong((id *)&self->_baseManifestHashForPartialUpdate, 0);
}

- (id)npkDescription
{
  uint64_t v3 = [(NPKProtoPassSyncStateChange *)self dictionaryRepresentation];
  id v4 = (void *)[v3 mutableCopy];

  unint64_t v5 = [(NPKProtoPassSyncStateChange *)self passData];
  uint64_t v6 = v5;
  if (v5)
  {
    char v7 = [v5 npkDescription];
    [v4 setObject:v7 forKey:@"passData"];
  }
  uint64_t v8 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)NPKProtoPassSyncStateChange;
  uint64_t v9 = [(NPKProtoPassSyncStateChange *)&v12 description];
  id v10 = [v8 stringWithFormat:@"%@ %@", v9, v4];

  return v10;
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoPassSyncStateChange writeTo:]", "NPKProtoPassSyncStateChange.m", 352, "nil != self->_changeUUID");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[NPKProtoPassSyncStateChange writeTo:]", "NPKProtoPassSyncStateChange.m", 368, "nil != self->_uniqueID");
}

@end