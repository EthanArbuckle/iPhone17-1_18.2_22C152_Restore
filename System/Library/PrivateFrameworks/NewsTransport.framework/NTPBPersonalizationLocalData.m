@interface NTPBPersonalizationLocalData
+ (Class)aggregatesType;
+ (Class)closedChangeGroupsType;
+ (Class)openChangeGroupDeltasType;
- (BOOL)hasCurrentInstanceIdentifier;
- (BOOL)hasRemoteRecordData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)remoteRecordData;
- (NSMutableArray)aggregates;
- (NSMutableArray)closedChangeGroups;
- (NSMutableArray)openChangeGroupDeltas;
- (NSString)currentInstanceIdentifier;
- (id)aggregatesAtIndex:(unint64_t)a3;
- (id)closedChangeGroupsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)openChangeGroupDeltasAtIndex:(unint64_t)a3;
- (unint64_t)aggregatesCount;
- (unint64_t)closedChangeGroupsCount;
- (unint64_t)hash;
- (unint64_t)openChangeGroupDeltasCount;
- (void)addAggregates:(id)a3;
- (void)addClosedChangeGroups:(id)a3;
- (void)addOpenChangeGroupDeltas:(id)a3;
- (void)clearAggregates;
- (void)clearClosedChangeGroups;
- (void)clearOpenChangeGroupDeltas;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAggregates:(id)a3;
- (void)setClosedChangeGroups:(id)a3;
- (void)setCurrentInstanceIdentifier:(id)a3;
- (void)setOpenChangeGroupDeltas:(id)a3;
- (void)setRemoteRecordData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBPersonalizationLocalData

- (void)dealloc
{
  [(NTPBPersonalizationLocalData *)self setOpenChangeGroupDeltas:0];
  [(NTPBPersonalizationLocalData *)self setClosedChangeGroups:0];
  [(NTPBPersonalizationLocalData *)self setRemoteRecordData:0];
  [(NTPBPersonalizationLocalData *)self setCurrentInstanceIdentifier:0];
  [(NTPBPersonalizationLocalData *)self setAggregates:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBPersonalizationLocalData;
  [(NTPBPersonalizationLocalData *)&v3 dealloc];
}

- (void)setRemoteRecordData:(id)a3
{
}

- (void)setOpenChangeGroupDeltas:(id)a3
{
}

- (void)setCurrentInstanceIdentifier:(id)a3
{
}

- (void)setClosedChangeGroups:(id)a3
{
}

- (void)setAggregates:(id)a3
{
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPersonalizationLocalDataReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (NSData)remoteRecordData
{
  return self->_remoteRecordData;
}

- (NSMutableArray)aggregates
{
  return self->_aggregates;
}

- (void)clearOpenChangeGroupDeltas
{
}

- (void)addOpenChangeGroupDeltas:(id)a3
{
  openChangeGroupDeltas = self->_openChangeGroupDeltas;
  if (!openChangeGroupDeltas)
  {
    openChangeGroupDeltas = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_openChangeGroupDeltas = openChangeGroupDeltas;
  }

  [(NSMutableArray *)openChangeGroupDeltas addObject:a3];
}

- (unint64_t)openChangeGroupDeltasCount
{
  return [(NSMutableArray *)self->_openChangeGroupDeltas count];
}

- (id)openChangeGroupDeltasAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_openChangeGroupDeltas objectAtIndex:a3];
}

+ (Class)openChangeGroupDeltasType
{
  return (Class)objc_opt_class();
}

- (void)clearClosedChangeGroups
{
}

- (void)addClosedChangeGroups:(id)a3
{
  closedChangeGroups = self->_closedChangeGroups;
  if (!closedChangeGroups)
  {
    closedChangeGroups = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_closedChangeGroups = closedChangeGroups;
  }

  [(NSMutableArray *)closedChangeGroups addObject:a3];
}

- (unint64_t)closedChangeGroupsCount
{
  return [(NSMutableArray *)self->_closedChangeGroups count];
}

- (id)closedChangeGroupsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_closedChangeGroups objectAtIndex:a3];
}

+ (Class)closedChangeGroupsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasRemoteRecordData
{
  return self->_remoteRecordData != 0;
}

- (BOOL)hasCurrentInstanceIdentifier
{
  return self->_currentInstanceIdentifier != 0;
}

- (void)clearAggregates
{
}

- (void)addAggregates:(id)a3
{
  aggregates = self->_aggregates;
  if (!aggregates)
  {
    aggregates = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_aggregates = aggregates;
  }

  [(NSMutableArray *)aggregates addObject:a3];
}

- (unint64_t)aggregatesCount
{
  return [(NSMutableArray *)self->_aggregates count];
}

- (id)aggregatesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_aggregates objectAtIndex:a3];
}

+ (Class)aggregatesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBPersonalizationLocalData;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBPersonalizationLocalData description](&v3, sel_description), -[NTPBPersonalizationLocalData dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_openChangeGroupDeltas count])
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_openChangeGroupDeltas, "count"));
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    openChangeGroupDeltas = self->_openChangeGroupDeltas;
    uint64_t v6 = [(NSMutableArray *)openChangeGroupDeltas countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v34 != v8) {
            objc_enumerationMutation(openChangeGroupDeltas);
          }
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        uint64_t v7 = [(NSMutableArray *)openChangeGroupDeltas countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v7);
    }
    [v3 setObject:v4 forKey:@"open_change_group_deltas"];
  }
  if ([(NSMutableArray *)self->_closedChangeGroups count])
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_closedChangeGroups, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    closedChangeGroups = self->_closedChangeGroups;
    uint64_t v12 = [(NSMutableArray *)closedChangeGroups countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v30 != v14) {
            objc_enumerationMutation(closedChangeGroups);
          }
          objc_msgSend(v10, "addObject:", objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * j), "dictionaryRepresentation"));
        }
        uint64_t v13 = [(NSMutableArray *)closedChangeGroups countByEnumeratingWithState:&v29 objects:v38 count:16];
      }
      while (v13);
    }
    [v3 setObject:v10 forKey:@"closed_change_groups"];
  }
  remoteRecordData = self->_remoteRecordData;
  if (remoteRecordData) {
    [v3 setObject:remoteRecordData forKey:@"remote_record_data"];
  }
  currentInstanceIdentifier = self->_currentInstanceIdentifier;
  if (currentInstanceIdentifier) {
    [v3 setObject:currentInstanceIdentifier forKey:@"current_instance_identifier"];
  }
  if ([(NSMutableArray *)self->_aggregates count])
  {
    v18 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_aggregates, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    aggregates = self->_aggregates;
    uint64_t v20 = [(NSMutableArray *)aggregates countByEnumeratingWithState:&v25 objects:v37 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v26;
      do
      {
        for (uint64_t k = 0; k != v21; ++k)
        {
          if (*(void *)v26 != v22) {
            objc_enumerationMutation(aggregates);
          }
          objc_msgSend(v18, "addObject:", objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * k), "dictionaryRepresentation"));
        }
        uint64_t v21 = [(NSMutableArray *)aggregates countByEnumeratingWithState:&v25 objects:v37 count:16];
      }
      while (v21);
    }
    [v3 setObject:v18 forKey:@"aggregates"];
  }
  return v3;
}

- (void)writeTo:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  openChangeGroupDeltas = self->_openChangeGroupDeltas;
  uint64_t v5 = [(NSMutableArray *)openChangeGroupDeltas countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(openChangeGroupDeltas);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v6 = [(NSMutableArray *)openChangeGroupDeltas countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v6);
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  closedChangeGroups = self->_closedChangeGroups;
  uint64_t v10 = [(NSMutableArray *)closedChangeGroups countByEnumeratingWithState:&v23 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(closedChangeGroups);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v11 = [(NSMutableArray *)closedChangeGroups countByEnumeratingWithState:&v23 objects:v32 count:16];
    }
    while (v11);
  }
  if (self->_remoteRecordData) {
    PBDataWriterWriteDataField();
  }
  if (self->_currentInstanceIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  aggregates = self->_aggregates;
  uint64_t v15 = [(NSMutableArray *)aggregates countByEnumeratingWithState:&v19 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      for (uint64_t k = 0; k != v16; ++k)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(aggregates);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v16 = [(NSMutableArray *)aggregates countByEnumeratingWithState:&v19 objects:v31 count:16];
    }
    while (v16);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  openChangeGroupDeltas = self->_openChangeGroupDeltas;
  uint64_t v7 = [(NSMutableArray *)openChangeGroupDeltas countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(openChangeGroupDeltas);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v33 + 1) + 8 * i) copyWithZone:a3];
        [v5 addOpenChangeGroupDeltas:v11];
      }
      uint64_t v8 = [(NSMutableArray *)openChangeGroupDeltas countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v8);
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  closedChangeGroups = self->_closedChangeGroups;
  uint64_t v13 = [(NSMutableArray *)closedChangeGroups countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(closedChangeGroups);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v29 + 1) + 8 * j) copyWithZone:a3];
        [v5 addClosedChangeGroups:v17];
      }
      uint64_t v14 = [(NSMutableArray *)closedChangeGroups countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v14);
  }

  v5[5] = (id)[(NSData *)self->_remoteRecordData copyWithZone:a3];
  v5[3] = (id)[(NSString *)self->_currentInstanceIdentifier copyWithZone:a3];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  aggregates = self->_aggregates;
  uint64_t v19 = [(NSMutableArray *)aggregates countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(aggregates);
        }
        long long v23 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * k) copyWithZone:a3];
        [v5 addAggregates:v23];
      }
      uint64_t v20 = [(NSMutableArray *)aggregates countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v20);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    openChangeGroupDeltas = self->_openChangeGroupDeltas;
    if (!((unint64_t)openChangeGroupDeltas | *((void *)a3 + 4))
      || (int v5 = -[NSMutableArray isEqual:](openChangeGroupDeltas, "isEqual:")) != 0)
    {
      closedChangeGroups = self->_closedChangeGroups;
      if (!((unint64_t)closedChangeGroups | *((void *)a3 + 2))
        || (int v5 = -[NSMutableArray isEqual:](closedChangeGroups, "isEqual:")) != 0)
      {
        remoteRecordData = self->_remoteRecordData;
        if (!((unint64_t)remoteRecordData | *((void *)a3 + 5))
          || (int v5 = -[NSData isEqual:](remoteRecordData, "isEqual:")) != 0)
        {
          currentInstanceIdentifier = self->_currentInstanceIdentifier;
          if (!((unint64_t)currentInstanceIdentifier | *((void *)a3 + 3))
            || (int v5 = -[NSString isEqual:](currentInstanceIdentifier, "isEqual:")) != 0)
          {
            aggregates = self->_aggregates;
            if ((unint64_t)aggregates | *((void *)a3 + 1))
            {
              LOBYTE(v5) = -[NSMutableArray isEqual:](aggregates, "isEqual:");
            }
            else
            {
              LOBYTE(v5) = 1;
            }
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_openChangeGroupDeltas hash];
  uint64_t v4 = [(NSMutableArray *)self->_closedChangeGroups hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_remoteRecordData hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_currentInstanceIdentifier hash];
  return v6 ^ [(NSMutableArray *)self->_aggregates hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v5 = (void *)*((void *)a3 + 4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NTPBPersonalizationLocalData *)self addOpenChangeGroupDeltas:*(void *)(*((void *)&v28 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v10 = (void *)*((void *)a3 + 2);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [(NTPBPersonalizationLocalData *)self addClosedChangeGroups:*(void *)(*((void *)&v24 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }
  if (*((void *)a3 + 5)) {
    -[NTPBPersonalizationLocalData setRemoteRecordData:](self, "setRemoteRecordData:");
  }
  if (*((void *)a3 + 3)) {
    -[NTPBPersonalizationLocalData setCurrentInstanceIdentifier:](self, "setCurrentInstanceIdentifier:");
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v15 = (void *)*((void *)a3 + 1);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        [(NTPBPersonalizationLocalData *)self addAggregates:*(void *)(*((void *)&v20 + 1) + 8 * k)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (NSMutableArray)openChangeGroupDeltas
{
  return self->_openChangeGroupDeltas;
}

- (NSMutableArray)closedChangeGroups
{
  return self->_closedChangeGroups;
}

- (NSString)currentInstanceIdentifier
{
  return self->_currentInstanceIdentifier;
}

@end