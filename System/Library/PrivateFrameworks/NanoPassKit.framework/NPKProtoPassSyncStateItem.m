@interface NPKProtoPassSyncStateItem
+ (Class)manifestEntryType;
- (BOOL)hasSequenceCounter;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)manifestHash;
- (NSMutableArray)manifestEntrys;
- (NSString)passTypeIdentifier;
- (NSString)serialNumber;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)manifestEntryAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)manifestEntrysCount;
- (unsigned)sequenceCounter;
- (void)addManifestEntry:(id)a3;
- (void)clearManifestEntrys;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSequenceCounter:(BOOL)a3;
- (void)setManifestEntrys:(id)a3;
- (void)setManifestHash:(id)a3;
- (void)setPassTypeIdentifier:(id)a3;
- (void)setSequenceCounter:(unsigned int)a3;
- (void)setSerialNumber:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoPassSyncStateItem

- (void)setSequenceCounter:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_sequenceCounter = a3;
}

- (void)setHasSequenceCounter:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSequenceCounter
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearManifestEntrys
{
}

- (void)addManifestEntry:(id)a3
{
  id v4 = a3;
  manifestEntrys = self->_manifestEntrys;
  id v8 = v4;
  if (!manifestEntrys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_manifestEntrys;
    self->_manifestEntrys = v6;

    id v4 = v8;
    manifestEntrys = self->_manifestEntrys;
  }
  [(NSMutableArray *)manifestEntrys addObject:v4];
}

- (unint64_t)manifestEntrysCount
{
  return [(NSMutableArray *)self->_manifestEntrys count];
}

- (id)manifestEntryAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_manifestEntrys objectAtIndex:a3];
}

+ (Class)manifestEntryType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoPassSyncStateItem;
  id v4 = [(NPKProtoPassSyncStateItem *)&v8 description];
  v5 = [(NPKProtoPassSyncStateItem *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  passTypeIdentifier = self->_passTypeIdentifier;
  if (passTypeIdentifier) {
    [v3 setObject:passTypeIdentifier forKey:@"passTypeIdentifier"];
  }
  serialNumber = self->_serialNumber;
  if (serialNumber) {
    [v4 setObject:serialNumber forKey:@"serialNumber"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithUnsignedInt:self->_sequenceCounter];
    [v4 setObject:v7 forKey:@"sequenceCounter"];
  }
  manifestHash = self->_manifestHash;
  if (manifestHash) {
    [v4 setObject:manifestHash forKey:@"manifestHash"];
  }
  if ([(NSMutableArray *)self->_manifestEntrys count])
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_manifestEntrys, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v10 = self->_manifestEntrys;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
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
          v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (void)v17);
          [v9 addObject:v15];
        }
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    [v4 setObject:v9 forKey:@"manifestEntry"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoPassSyncStateItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_passTypeIdentifier) {
    -[NPKProtoPassSyncStateItem writeTo:]();
  }
  v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_serialNumber) {
    -[NPKProtoPassSyncStateItem writeTo:]();
  }
  PBDataWriterWriteStringField();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  if (!self->_manifestHash) {
    -[NPKProtoPassSyncStateItem writeTo:]();
  }
  PBDataWriterWriteDataField();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_manifestEntrys;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  [v8 setPassTypeIdentifier:self->_passTypeIdentifier];
  [v8 setSerialNumber:self->_serialNumber];
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v8 + 8) = self->_sequenceCounter;
    *((unsigned char *)v8 + 48) |= 1u;
  }
  [v8 setManifestHash:self->_manifestHash];
  if ([(NPKProtoPassSyncStateItem *)self manifestEntrysCount])
  {
    [v8 clearManifestEntrys];
    unint64_t v4 = [(NPKProtoPassSyncStateItem *)self manifestEntrysCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKProtoPassSyncStateItem *)self manifestEntryAtIndex:i];
        [v8 addManifestEntry:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_passTypeIdentifier copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_serialNumber copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 32) = self->_sequenceCounter;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  uint64_t v10 = [(NSData *)self->_manifestHash copyWithZone:a3];
  long long v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v12 = self->_manifestEntrys;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "copyWithZone:", a3, (void)v19);
        [(id)v5 addManifestEntry:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  passTypeIdentifier = self->_passTypeIdentifier;
  if ((unint64_t)passTypeIdentifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](passTypeIdentifier, "isEqual:")) {
      goto LABEL_15;
    }
  }
  serialNumber = self->_serialNumber;
  if ((unint64_t)serialNumber | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](serialNumber, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_sequenceCounter != *((_DWORD *)v4 + 8)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  manifestHash = self->_manifestHash;
  if ((unint64_t)manifestHash | *((void *)v4 + 2)
    && !-[NSData isEqual:](manifestHash, "isEqual:"))
  {
    goto LABEL_15;
  }
  manifestEntrys = self->_manifestEntrys;
  if ((unint64_t)manifestEntrys | *((void *)v4 + 1)) {
    char v9 = -[NSMutableArray isEqual:](manifestEntrys, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_passTypeIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_serialNumber hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_sequenceCounter;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v4 ^ v3 ^ v5 ^ [(NSData *)self->_manifestHash hash];
  return v6 ^ [(NSMutableArray *)self->_manifestEntrys hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 3)) {
    -[NPKProtoPassSyncStateItem setPassTypeIdentifier:](self, "setPassTypeIdentifier:");
  }
  if (*((void *)v4 + 5)) {
    -[NPKProtoPassSyncStateItem setSerialNumber:](self, "setSerialNumber:");
  }
  if (*((unsigned char *)v4 + 48))
  {
    self->_sequenceCounter = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2)) {
    -[NPKProtoPassSyncStateItem setManifestHash:](self, "setManifestHash:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 1);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[NPKProtoPassSyncStateItem addManifestEntry:](self, "addManifestEntry:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (unsigned)sequenceCounter
{
  return self->_sequenceCounter;
}

- (NSData)manifestHash
{
  return self->_manifestHash;
}

- (void)setManifestHash:(id)a3
{
}

- (NSMutableArray)manifestEntrys
{
  return self->_manifestEntrys;
}

- (void)setManifestEntrys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_manifestHash, 0);
  objc_storeStrong((id *)&self->_manifestEntrys, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoPassSyncStateItem writeTo:]", "NPKProtoPassSyncStateItem.m", 172, "nil != self->_passTypeIdentifier");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[NPKProtoPassSyncStateItem writeTo:]", "NPKProtoPassSyncStateItem.m", 177, "nil != self->_serialNumber");
}

- (void)writeTo:.cold.3()
{
  __assert_rtn("-[NPKProtoPassSyncStateItem writeTo:]", "NPKProtoPassSyncStateItem.m", 189, "nil != self->_manifestHash");
}

@end