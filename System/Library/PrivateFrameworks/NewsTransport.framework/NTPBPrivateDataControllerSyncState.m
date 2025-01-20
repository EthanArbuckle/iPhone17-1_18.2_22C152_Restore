@interface NTPBPrivateDataControllerSyncState
+ (Class)recordStatesType;
+ (Class)zoneStatesType;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)recordStates;
- (NSMutableArray)zoneStates;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)recordStatesAtIndex:(unint64_t)a3;
- (id)zoneStatesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)recordStatesCount;
- (unint64_t)version;
- (unint64_t)zoneStatesCount;
- (void)addRecordStates:(id)a3;
- (void)addZoneStates:(id)a3;
- (void)clearRecordStates;
- (void)clearZoneStates;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setRecordStates:(id)a3;
- (void)setVersion:(unint64_t)a3;
- (void)setZoneStates:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBPrivateDataControllerSyncState

- (void)dealloc
{
  [(NTPBPrivateDataControllerSyncState *)self setZoneStates:0];
  [(NTPBPrivateDataControllerSyncState *)self setRecordStates:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBPrivateDataControllerSyncState;
  [(NTPBPrivateDataControllerSyncState *)&v3 dealloc];
}

- (void)clearZoneStates
{
}

- (void)addZoneStates:(id)a3
{
  zoneStates = self->_zoneStates;
  if (!zoneStates)
  {
    zoneStates = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_zoneStates = zoneStates;
  }

  [(NSMutableArray *)zoneStates addObject:a3];
}

- (unint64_t)zoneStatesCount
{
  return [(NSMutableArray *)self->_zoneStates count];
}

- (id)zoneStatesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_zoneStates objectAtIndex:a3];
}

+ (Class)zoneStatesType
{
  return (Class)objc_opt_class();
}

- (void)clearRecordStates
{
}

- (void)addRecordStates:(id)a3
{
  recordStates = self->_recordStates;
  if (!recordStates)
  {
    recordStates = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_recordStates = recordStates;
  }

  [(NSMutableArray *)recordStates addObject:a3];
}

- (unint64_t)recordStatesCount
{
  return [(NSMutableArray *)self->_recordStates count];
}

- (id)recordStatesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_recordStates objectAtIndex:a3];
}

+ (Class)recordStatesType
{
  return (Class)objc_opt_class();
}

- (void)setVersion:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBPrivateDataControllerSyncState;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBPrivateDataControllerSyncState description](&v3, sel_description), -[NTPBPrivateDataControllerSyncState dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_zoneStates count])
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_zoneStates, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    zoneStates = self->_zoneStates;
    uint64_t v6 = [(NSMutableArray *)zoneStates countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(zoneStates);
          }
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        uint64_t v7 = [(NSMutableArray *)zoneStates countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v7);
    }
    [v3 setObject:v4 forKey:@"zone_states"];
  }
  if ([(NSMutableArray *)self->_recordStates count])
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_recordStates, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    recordStates = self->_recordStates;
    uint64_t v12 = [(NSMutableArray *)recordStates countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(recordStates);
          }
          objc_msgSend(v10, "addObject:", objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * j), "dictionaryRepresentation"));
        }
        uint64_t v13 = [(NSMutableArray *)recordStates countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v13);
    }
    [v3 setObject:v10 forKey:@"record_states"];
  }
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_version), @"version");
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPrivateDataControllerSyncStateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  zoneStates = self->_zoneStates;
  uint64_t v5 = [(NSMutableArray *)zoneStates countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(zoneStates);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v6 = [(NSMutableArray *)zoneStates countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v6);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  recordStates = self->_recordStates;
  uint64_t v10 = [(NSMutableArray *)recordStates countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(recordStates);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v11 = [(NSMutableArray *)recordStates countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v11);
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  zoneStates = self->_zoneStates;
  uint64_t v7 = [(NSMutableArray *)zoneStates countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(zoneStates);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v23 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addZoneStates:v11];
      }
      uint64_t v8 = [(NSMutableArray *)zoneStates countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  recordStates = self->_recordStates;
  uint64_t v13 = [(NSMutableArray *)recordStates countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(recordStates);
        }
        long long v17 = (void *)[*(id *)(*((void *)&v19 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addRecordStates:v17];
      }
      uint64_t v14 = [(NSMutableArray *)recordStates countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_version;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    zoneStates = self->_zoneStates;
    if (!((unint64_t)zoneStates | *((void *)a3 + 3))
      || (int v5 = -[NSMutableArray isEqual:](zoneStates, "isEqual:")) != 0)
    {
      recordStates = self->_recordStates;
      if (!((unint64_t)recordStates | *((void *)a3 + 2))
        || (int v5 = -[NSMutableArray isEqual:](recordStates, "isEqual:")) != 0)
      {
        LOBYTE(v5) = (*((unsigned char *)a3 + 32) & 1) == 0;
        if (*(unsigned char *)&self->_has) {
          LOBYTE(v5) = (*((unsigned char *)a3 + 32) & 1) != 0 && self->_version == *((void *)a3 + 1);
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_zoneStates hash];
  uint64_t v4 = [(NSMutableArray *)self->_recordStates hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v5 = 2654435761u * self->_version;
  }
  else {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  unint64_t v5 = (void *)*((void *)a3 + 3);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NTPBPrivateDataControllerSyncState *)self addZoneStates:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = (void *)*((void *)a3 + 2);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [(NTPBPrivateDataControllerSyncState *)self addRecordStates:*(void *)(*((void *)&v15 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
  if (*((unsigned char *)a3 + 32))
  {
    self->_version = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSMutableArray)zoneStates
{
  return self->_zoneStates;
}

- (void)setZoneStates:(id)a3
{
}

- (NSMutableArray)recordStates
{
  return self->_recordStates;
}

- (void)setRecordStates:(id)a3
{
}

- (unint64_t)version
{
  return self->_version;
}

@end