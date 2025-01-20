@interface NPKProtoResyncNeededRequest
+ (Class)manifestHashesType;
+ (Class)uniqueIDsType;
- (BOOL)fullResyncNeeded;
- (BOOL)hasExpectedHash;
- (BOOL)hasFullResyncNeeded;
- (BOOL)hasResyncID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NPKProtoHash)expectedHash;
- (NSMutableArray)manifestHashes;
- (NSMutableArray)uniqueIDs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)manifestHashesAtIndex:(unint64_t)a3;
- (id)uniqueIDsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)manifestHashesCount;
- (unint64_t)uniqueIDsCount;
- (unsigned)resyncID;
- (void)addManifestHashes:(id)a3;
- (void)addUniqueIDs:(id)a3;
- (void)clearManifestHashes;
- (void)clearUniqueIDs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setExpectedHash:(id)a3;
- (void)setFullResyncNeeded:(BOOL)a3;
- (void)setHasFullResyncNeeded:(BOOL)a3;
- (void)setHasResyncID:(BOOL)a3;
- (void)setManifestHashes:(id)a3;
- (void)setResyncID:(unsigned int)a3;
- (void)setUniqueIDs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoResyncNeededRequest

- (BOOL)hasExpectedHash
{
  return self->_expectedHash != 0;
}

- (void)clearUniqueIDs
{
}

- (void)addUniqueIDs:(id)a3
{
  id v4 = a3;
  uniqueIDs = self->_uniqueIDs;
  id v8 = v4;
  if (!uniqueIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_uniqueIDs;
    self->_uniqueIDs = v6;

    id v4 = v8;
    uniqueIDs = self->_uniqueIDs;
  }
  [(NSMutableArray *)uniqueIDs addObject:v4];
}

- (unint64_t)uniqueIDsCount
{
  return [(NSMutableArray *)self->_uniqueIDs count];
}

- (id)uniqueIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_uniqueIDs objectAtIndex:a3];
}

+ (Class)uniqueIDsType
{
  return (Class)objc_opt_class();
}

- (void)clearManifestHashes
{
}

- (void)addManifestHashes:(id)a3
{
  id v4 = a3;
  manifestHashes = self->_manifestHashes;
  id v8 = v4;
  if (!manifestHashes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_manifestHashes;
    self->_manifestHashes = v6;

    id v4 = v8;
    manifestHashes = self->_manifestHashes;
  }
  [(NSMutableArray *)manifestHashes addObject:v4];
}

- (unint64_t)manifestHashesCount
{
  return [(NSMutableArray *)self->_manifestHashes count];
}

- (id)manifestHashesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_manifestHashes objectAtIndex:a3];
}

+ (Class)manifestHashesType
{
  return (Class)objc_opt_class();
}

- (void)setFullResyncNeeded:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_fullResyncNeeded = a3;
}

- (void)setHasFullResyncNeeded:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFullResyncNeeded
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setResyncID:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_resyncID = a3;
}

- (void)setHasResyncID:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResyncID
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoResyncNeededRequest;
  id v4 = [(NPKProtoResyncNeededRequest *)&v8 description];
  v5 = [(NPKProtoResyncNeededRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  expectedHash = self->_expectedHash;
  if (expectedHash)
  {
    v5 = [(NPKProtoHash *)expectedHash dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"expectedHash"];
  }
  uniqueIDs = self->_uniqueIDs;
  if (uniqueIDs) {
    [v3 setObject:uniqueIDs forKey:@"uniqueIDs"];
  }
  manifestHashes = self->_manifestHashes;
  if (manifestHashes) {
    [v3 setObject:manifestHashes forKey:@"manifestHashes"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v9 = [NSNumber numberWithBool:self->_fullResyncNeeded];
    [v3 setObject:v9 forKey:@"fullResyncNeeded"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v10 = [NSNumber numberWithUnsignedInt:self->_resyncID];
    [v3 setObject:v10 forKey:@"resyncID"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoResyncNeededRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_expectedHash) {
    PBDataWriterWriteSubmessage();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v5 = self->_uniqueIDs;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v10 = self->_manifestHashes;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteDataField();
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v13 = a3;
  if (self->_expectedHash) {
    objc_msgSend(v13, "setExpectedHash:");
  }
  if ([(NPKProtoResyncNeededRequest *)self uniqueIDsCount])
  {
    [v13 clearUniqueIDs];
    unint64_t v4 = [(NPKProtoResyncNeededRequest *)self uniqueIDsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKProtoResyncNeededRequest *)self uniqueIDsAtIndex:i];
        [v13 addUniqueIDs:v7];
      }
    }
  }
  if ([(NPKProtoResyncNeededRequest *)self manifestHashesCount])
  {
    [v13 clearManifestHashes];
    unint64_t v8 = [(NPKProtoResyncNeededRequest *)self manifestHashesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(NPKProtoResyncNeededRequest *)self manifestHashesAtIndex:j];
        [v13 addManifestHashes:v11];
      }
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((unsigned char *)v13 + 40) = self->_fullResyncNeeded;
    *((unsigned char *)v13 + 44) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v13 + 6) = self->_resyncID;
    *((unsigned char *)v13 + 44) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NPKProtoHash *)self->_expectedHash copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  unint64_t v8 = self->_uniqueIDs;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = (void *)[*(id *)(*((void *)&v26 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addUniqueIDs:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v10);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v14 = self->_manifestHashes;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * j), "copyWithZone:", a3, (void)v22);
        [(id)v5 addManifestHashes:v19];
      }
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v16);
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 40) = self->_fullResyncNeeded;
    *(unsigned char *)(v5 + 44) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 24) = self->_resyncID;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  expectedHash = self->_expectedHash;
  if ((unint64_t)expectedHash | *((void *)v4 + 1))
  {
    if (!-[NPKProtoHash isEqual:](expectedHash, "isEqual:")) {
      goto LABEL_20;
    }
  }
  uniqueIDs = self->_uniqueIDs;
  if ((unint64_t)uniqueIDs | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](uniqueIDs, "isEqual:")) {
      goto LABEL_20;
    }
  }
  manifestHashes = self->_manifestHashes;
  if ((unint64_t)manifestHashes | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](manifestHashes, "isEqual:")) {
      goto LABEL_20;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) != 0)
    {
      if (self->_fullResyncNeeded)
      {
        if (!*((unsigned char *)v4 + 40)) {
          goto LABEL_20;
        }
        goto LABEL_16;
      }
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_16;
      }
    }
LABEL_20:
    BOOL v8 = 0;
    goto LABEL_21;
  }
  if ((*((unsigned char *)v4 + 44) & 2) != 0) {
    goto LABEL_20;
  }
LABEL_16:
  BOOL v8 = (*((unsigned char *)v4 + 44) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_resyncID != *((_DWORD *)v4 + 6)) {
      goto LABEL_20;
    }
    BOOL v8 = 1;
  }
LABEL_21:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NPKProtoHash *)self->_expectedHash hash];
  uint64_t v4 = [(NSMutableArray *)self->_uniqueIDs hash];
  uint64_t v5 = [(NSMutableArray *)self->_manifestHashes hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v6 = 2654435761 * self->_fullResyncNeeded;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v7 = 2654435761 * self->_resyncID;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  expectedHash = self->_expectedHash;
  uint64_t v6 = *((void *)v4 + 1);
  if (expectedHash)
  {
    if (v6) {
      -[NPKProtoHash mergeFrom:](expectedHash, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NPKProtoResyncNeededRequest setExpectedHash:](self, "setExpectedHash:");
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = *((id *)v4 + 4);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        [(NPKProtoResyncNeededRequest *)self addUniqueIDs:*(void *)(*((void *)&v22 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v9);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = *((id *)v4 + 2);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        -[NPKProtoResyncNeededRequest addManifestHashes:](self, "addManifestHashes:", *(void *)(*((void *)&v18 + 1) + 8 * j), (void)v18);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v14);
  }

  char v17 = *((unsigned char *)v4 + 44);
  if ((v17 & 2) != 0)
  {
    self->_fullResyncNeeded = *((unsigned char *)v4 + 40);
    *(unsigned char *)&self->_has |= 2u;
    char v17 = *((unsigned char *)v4 + 44);
  }
  if (v17)
  {
    self->_resyncID = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NPKProtoHash)expectedHash
{
  return self->_expectedHash;
}

- (void)setExpectedHash:(id)a3
{
}

- (NSMutableArray)uniqueIDs
{
  return self->_uniqueIDs;
}

- (void)setUniqueIDs:(id)a3
{
}

- (NSMutableArray)manifestHashes
{
  return self->_manifestHashes;
}

- (void)setManifestHashes:(id)a3
{
}

- (BOOL)fullResyncNeeded
{
  return self->_fullResyncNeeded;
}

- (unsigned)resyncID
{
  return self->_resyncID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIDs, 0);
  objc_storeStrong((id *)&self->_manifestHashes, 0);
  objc_storeStrong((id *)&self->_expectedHash, 0);
}

@end