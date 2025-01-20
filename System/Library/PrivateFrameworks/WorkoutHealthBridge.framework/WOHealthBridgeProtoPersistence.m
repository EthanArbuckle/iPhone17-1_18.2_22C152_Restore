@interface WOHealthBridgeProtoPersistence
+ (Class)keyedDatasType;
+ (Class)keyedDatesType;
+ (Class)keyedNumbersType;
+ (Class)keyedStringsType;
- (BOOL)hasPersistedProtoData;
- (BOOL)hasSyncIdentity;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)persistedData;
- (NSData)persistedProtoData;
- (NSData)uuid;
- (NSMutableArray)keyedDatas;
- (NSMutableArray)keyedDates;
- (NSMutableArray)keyedNumbers;
- (NSMutableArray)keyedStrings;
- (WOHealthBridgeSyncIdentity)syncIdentity;
- (double)objectModificationTimeSinceReferenceDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)keyedDatasAtIndex:(unint64_t)a3;
- (id)keyedDatesAtIndex:(unint64_t)a3;
- (id)keyedNumbersAtIndex:(unint64_t)a3;
- (id)keyedStringsAtIndex:(unint64_t)a3;
- (int)objectState;
- (int)type;
- (int)version;
- (unint64_t)hash;
- (unint64_t)keyedDatasCount;
- (unint64_t)keyedDatesCount;
- (unint64_t)keyedNumbersCount;
- (unint64_t)keyedStringsCount;
- (void)addKeyedDatas:(id)a3;
- (void)addKeyedDates:(id)a3;
- (void)addKeyedNumbers:(id)a3;
- (void)addKeyedStrings:(id)a3;
- (void)clearKeyedDatas;
- (void)clearKeyedDates;
- (void)clearKeyedNumbers;
- (void)clearKeyedStrings;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setKeyedDatas:(id)a3;
- (void)setKeyedDates:(id)a3;
- (void)setKeyedNumbers:(id)a3;
- (void)setKeyedStrings:(id)a3;
- (void)setObjectModificationTimeSinceReferenceDate:(double)a3;
- (void)setObjectState:(int)a3;
- (void)setPersistedData:(id)a3;
- (void)setPersistedProtoData:(id)a3;
- (void)setSyncIdentity:(id)a3;
- (void)setType:(int)a3;
- (void)setUuid:(id)a3;
- (void)setVersion:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation WOHealthBridgeProtoPersistence

- (void)clearKeyedNumbers
{
}

- (void)addKeyedNumbers:(id)a3
{
  id v4 = a3;
  keyedNumbers = self->_keyedNumbers;
  id v8 = v4;
  if (!keyedNumbers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_keyedNumbers;
    self->_keyedNumbers = v6;

    id v4 = v8;
    keyedNumbers = self->_keyedNumbers;
  }
  [(NSMutableArray *)keyedNumbers addObject:v4];
}

- (unint64_t)keyedNumbersCount
{
  return [(NSMutableArray *)self->_keyedNumbers count];
}

- (id)keyedNumbersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_keyedNumbers objectAtIndex:a3];
}

+ (Class)keyedNumbersType
{
  return (Class)objc_opt_class();
}

- (void)clearKeyedStrings
{
}

- (void)addKeyedStrings:(id)a3
{
  id v4 = a3;
  keyedStrings = self->_keyedStrings;
  id v8 = v4;
  if (!keyedStrings)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_keyedStrings;
    self->_keyedStrings = v6;

    id v4 = v8;
    keyedStrings = self->_keyedStrings;
  }
  [(NSMutableArray *)keyedStrings addObject:v4];
}

- (unint64_t)keyedStringsCount
{
  return [(NSMutableArray *)self->_keyedStrings count];
}

- (id)keyedStringsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_keyedStrings objectAtIndex:a3];
}

+ (Class)keyedStringsType
{
  return (Class)objc_opt_class();
}

- (void)clearKeyedDates
{
}

- (void)addKeyedDates:(id)a3
{
  id v4 = a3;
  keyedDates = self->_keyedDates;
  id v8 = v4;
  if (!keyedDates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_keyedDates;
    self->_keyedDates = v6;

    id v4 = v8;
    keyedDates = self->_keyedDates;
  }
  [(NSMutableArray *)keyedDates addObject:v4];
}

- (unint64_t)keyedDatesCount
{
  return [(NSMutableArray *)self->_keyedDates count];
}

- (id)keyedDatesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_keyedDates objectAtIndex:a3];
}

+ (Class)keyedDatesType
{
  return (Class)objc_opt_class();
}

- (void)clearKeyedDatas
{
}

- (void)addKeyedDatas:(id)a3
{
  id v4 = a3;
  keyedDatas = self->_keyedDatas;
  id v8 = v4;
  if (!keyedDatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_keyedDatas;
    self->_keyedDatas = v6;

    id v4 = v8;
    keyedDatas = self->_keyedDatas;
  }
  [(NSMutableArray *)keyedDatas addObject:v4];
}

- (unint64_t)keyedDatasCount
{
  return [(NSMutableArray *)self->_keyedDatas count];
}

- (id)keyedDatasAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_keyedDatas objectAtIndex:a3];
}

+ (Class)keyedDatasType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasPersistedProtoData
{
  return self->_persistedProtoData != 0;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WOHealthBridgeProtoPersistence;
  id v4 = [(WOHealthBridgeProtoPersistence *)&v8 description];
  v5 = [(WOHealthBridgeProtoPersistence *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [NSNumber numberWithInt:self->_version];
  [v3 setObject:v4 forKey:@"version"];

  v5 = [NSNumber numberWithInt:self->_type];
  [v3 setObject:v5 forKey:@"type"];

  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  if ([(NSMutableArray *)self->_keyedNumbers count])
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_keyedNumbers, "count"));
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    objc_super v8 = self->_keyedNumbers;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v54 objects:v61 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v55 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v54 + 1) + 8 * i) dictionaryRepresentation];
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v54 objects:v61 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"keyedNumbers"];
  }
  if ([(NSMutableArray *)self->_keyedStrings count])
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_keyedStrings, "count"));
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v15 = self->_keyedStrings;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v50 objects:v60 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v51;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v51 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [*(id *)(*((void *)&v50 + 1) + 8 * j) dictionaryRepresentation];
          [v14 addObject:v20];
        }
        uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v50 objects:v60 count:16];
      }
      while (v17);
    }

    [v3 setObject:v14 forKey:@"keyedStrings"];
  }
  if ([(NSMutableArray *)self->_keyedDates count])
  {
    v21 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_keyedDates, "count"));
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v22 = self->_keyedDates;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v46 objects:v59 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v47;
      do
      {
        for (uint64_t k = 0; k != v24; ++k)
        {
          if (*(void *)v47 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = [*(id *)(*((void *)&v46 + 1) + 8 * k) dictionaryRepresentation];
          [v21 addObject:v27];
        }
        uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v46 objects:v59 count:16];
      }
      while (v24);
    }

    [v3 setObject:v21 forKey:@"keyedDates"];
  }
  if ([(NSMutableArray *)self->_keyedDatas count])
  {
    v28 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_keyedDatas, "count"));
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v29 = self->_keyedDatas;
    uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v42 objects:v58 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v43;
      do
      {
        for (uint64_t m = 0; m != v31; ++m)
        {
          if (*(void *)v43 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = objc_msgSend(*(id *)(*((void *)&v42 + 1) + 8 * m), "dictionaryRepresentation", (void)v42);
          [v28 addObject:v34];
        }
        uint64_t v31 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v42 objects:v58 count:16];
      }
      while (v31);
    }

    [v3 setObject:v28 forKey:@"keyedDatas"];
  }
  persistedData = self->_persistedData;
  if (persistedData) {
    [v3 setObject:persistedData forKey:@"persistedData"];
  }
  persistedProtoData = self->_persistedProtoData;
  if (persistedProtoData) {
    [v3 setObject:persistedProtoData forKey:@"persistedProtoData"];
  }
  v37 = objc_msgSend(NSNumber, "numberWithInt:", self->_objectState, (void)v42);
  [v3 setObject:v37 forKey:@"objectState"];

  v38 = [NSNumber numberWithDouble:self->_objectModificationTimeSinceReferenceDate];
  [v3 setObject:v38 forKey:@"objectModificationTimeSinceReferenceDate"];

  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    v40 = [(WOHealthBridgeSyncIdentity *)syncIdentity dictionaryRepresentation];
    [v3 setObject:v40 forKey:@"syncIdentity"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return WOHealthBridgeProtoPersistenceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  if (!self->_uuid) {
    -[WOHealthBridgeProtoPersistence writeTo:]();
  }
  PBDataWriterWriteDataField();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v5 = self->_keyedNumbers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v7);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v10 = self->_keyedStrings;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v12);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v15 = self->_keyedDates;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v17);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v20 = self->_keyedDatas;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v22);
  }

  if (!self->_persistedData) {
    -[WOHealthBridgeProtoPersistence writeTo:]();
  }
  PBDataWriterWriteDataField();
  if (self->_persistedProtoData) {
    PBDataWriterWriteDataField();
  }
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteDoubleField();
  if (self->_syncIdentity) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v4[24] = self->_version;
  v4[20] = self->_type;
  id v22 = v4;
  [v4 setUuid:self->_uuid];
  if ([(WOHealthBridgeProtoPersistence *)self keyedNumbersCount])
  {
    [v22 clearKeyedNumbers];
    unint64_t v5 = [(WOHealthBridgeProtoPersistence *)self keyedNumbersCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(WOHealthBridgeProtoPersistence *)self keyedNumbersAtIndex:i];
        [v22 addKeyedNumbers:v8];
      }
    }
  }
  if ([(WOHealthBridgeProtoPersistence *)self keyedStringsCount])
  {
    [v22 clearKeyedStrings];
    unint64_t v9 = [(WOHealthBridgeProtoPersistence *)self keyedStringsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(WOHealthBridgeProtoPersistence *)self keyedStringsAtIndex:j];
        [v22 addKeyedStrings:v12];
      }
    }
  }
  if ([(WOHealthBridgeProtoPersistence *)self keyedDatesCount])
  {
    [v22 clearKeyedDates];
    unint64_t v13 = [(WOHealthBridgeProtoPersistence *)self keyedDatesCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        uint64_t v16 = [(WOHealthBridgeProtoPersistence *)self keyedDatesAtIndex:k];
        [v22 addKeyedDates:v16];
      }
    }
  }
  if ([(WOHealthBridgeProtoPersistence *)self keyedDatasCount])
  {
    [v22 clearKeyedDatas];
    unint64_t v17 = [(WOHealthBridgeProtoPersistence *)self keyedDatasCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
      {
        v20 = [(WOHealthBridgeProtoPersistence *)self keyedDatasAtIndex:m];
        [v22 addKeyedDatas:v20];
      }
    }
  }
  [v22 setPersistedData:self->_persistedData];
  if (self->_persistedProtoData) {
    objc_msgSend(v22, "setPersistedProtoData:");
  }
  uint64_t v21 = v22;
  *((_DWORD *)v22 + 12) = self->_objectState;
  *((void *)v22 + 1) = *(void *)&self->_objectModificationTimeSinceReferenceDate;
  if (self->_syncIdentity)
  {
    objc_msgSend(v22, "setSyncIdentity:");
    uint64_t v21 = v22;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 96) = self->_version;
  *(_DWORD *)(v5 + 80) = self->_type;
  uint64_t v6 = [(NSData *)self->_uuid copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v6;

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v8 = self->_keyedNumbers;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v51 objects:v58 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v52;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v52 != v11) {
          objc_enumerationMutation(v8);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v51 + 1) + 8 * v12) copyWithZone:a3];
        [(id)v5 addKeyedNumbers:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v51 objects:v58 count:16];
    }
    while (v10);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  unint64_t v14 = self->_keyedStrings;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v47 objects:v57 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v48;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v48 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = (void *)[*(id *)(*((void *)&v47 + 1) + 8 * v18) copyWithZone:a3];
        [(id)v5 addKeyedStrings:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v47 objects:v57 count:16];
    }
    while (v16);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v20 = self->_keyedDates;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v43 objects:v56 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v44;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v44 != v23) {
          objc_enumerationMutation(v20);
        }
        long long v25 = (void *)[*(id *)(*((void *)&v43 + 1) + 8 * v24) copyWithZone:a3];
        [(id)v5 addKeyedDates:v25];

        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v43 objects:v56 count:16];
    }
    while (v22);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v26 = self->_keyedDatas;
  uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v39 objects:v55 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v40;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v40 != v29) {
          objc_enumerationMutation(v26);
        }
        long long v31 = objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * v30), "copyWithZone:", a3, (void)v39);
        [(id)v5 addKeyedDatas:v31];

        ++v30;
      }
      while (v28 != v30);
      uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v39 objects:v55 count:16];
    }
    while (v28);
  }

  uint64_t v32 = [(NSData *)self->_persistedData copyWithZone:a3];
  long long v33 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v32;

  uint64_t v34 = [(NSData *)self->_persistedProtoData copyWithZone:a3];
  long long v35 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v34;

  *(_DWORD *)(v5 + 48) = self->_objectState;
  *(double *)(v5 + 8) = self->_objectModificationTimeSinceReferenceDate;
  id v36 = [(WOHealthBridgeSyncIdentity *)self->_syncIdentity copyWithZone:a3];
  long long v37 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v36;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_version == *((_DWORD *)v4 + 24)
    && self->_type == *((_DWORD *)v4 + 20)
    && ((uuid = self->_uuid, !((unint64_t)uuid | v4[11])) || -[NSData isEqual:](uuid, "isEqual:"))
    && ((keyedNumbers = self->_keyedNumbers, !((unint64_t)keyedNumbers | v4[4]))
     || -[NSMutableArray isEqual:](keyedNumbers, "isEqual:"))
    && ((keyedStrings = self->_keyedStrings, !((unint64_t)keyedStrings | v4[5]))
     || -[NSMutableArray isEqual:](keyedStrings, "isEqual:"))
    && ((keyedDates = self->_keyedDates, !((unint64_t)keyedDates | v4[3]))
     || -[NSMutableArray isEqual:](keyedDates, "isEqual:"))
    && ((keyedDatas = self->_keyedDatas, !((unint64_t)keyedDatas | v4[2]))
     || -[NSMutableArray isEqual:](keyedDatas, "isEqual:"))
    && ((persistedData = self->_persistedData, !((unint64_t)persistedData | v4[7]))
     || -[NSData isEqual:](persistedData, "isEqual:"))
    && ((persistedProtoData = self->_persistedProtoData, !((unint64_t)persistedProtoData | v4[8]))
     || -[NSData isEqual:](persistedProtoData, "isEqual:"))
    && self->_objectState == *((_DWORD *)v4 + 12)
    && self->_objectModificationTimeSinceReferenceDate == *((double *)v4 + 1))
  {
    syncIdentity = self->_syncIdentity;
    if ((unint64_t)syncIdentity | v4[9]) {
      char v13 = -[WOHealthBridgeSyncIdentity isEqual:](syncIdentity, "isEqual:");
    }
    else {
      char v13 = 1;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  uint64_t type = self->_type;
  uint64_t version = self->_version;
  uint64_t v3 = [(NSData *)self->_uuid hash];
  uint64_t v4 = [(NSMutableArray *)self->_keyedNumbers hash];
  uint64_t v5 = [(NSMutableArray *)self->_keyedStrings hash];
  uint64_t v6 = [(NSMutableArray *)self->_keyedDates hash];
  uint64_t v7 = [(NSMutableArray *)self->_keyedDatas hash];
  uint64_t v8 = [(NSData *)self->_persistedData hash];
  uint64_t v9 = [(NSData *)self->_persistedProtoData hash];
  uint64_t objectState = self->_objectState;
  double objectModificationTimeSinceReferenceDate = self->_objectModificationTimeSinceReferenceDate;
  double v12 = -objectModificationTimeSinceReferenceDate;
  if (objectModificationTimeSinceReferenceDate >= 0.0) {
    double v12 = self->_objectModificationTimeSinceReferenceDate;
  }
  long double v13 = floor(v12 + 0.5);
  double v14 = (v12 - v13) * 1.84467441e19;
  double v15 = fmod(v13, 1.84467441e19);
  unint64_t v16 = 2654435761u * (unint64_t)v15;
  unint64_t v17 = v16 + (unint64_t)v14;
  if (v14 <= 0.0) {
    unint64_t v17 = 2654435761u * (unint64_t)v15;
  }
  unint64_t v18 = v16 - (unint64_t)fabs(v14);
  if (v14 >= 0.0) {
    unint64_t v18 = v17;
  }
  return (2654435761 * type) ^ (2654435761 * version) ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(WOHealthBridgeSyncIdentity *)self->_syncIdentity hash] ^ v9 ^ (2654435761 * objectState) ^ v18;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  self->_uint64_t version = *((_DWORD *)v4 + 24);
  self->_uint64_t type = *((_DWORD *)v4 + 20);
  if (*((void *)v4 + 11)) {
    -[WOHealthBridgeProtoPersistence setUuid:](self, "setUuid:");
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v5 = *((id *)v4 + 4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v40 != v8) {
          objc_enumerationMutation(v5);
        }
        [(WOHealthBridgeProtoPersistence *)self addKeyedNumbers:*(void *)(*((void *)&v39 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v39 objects:v46 count:16];
    }
    while (v7);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v10 = *((id *)v4 + 5);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(v10);
        }
        [(WOHealthBridgeProtoPersistence *)self addKeyedStrings:*(void *)(*((void *)&v35 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v35 objects:v45 count:16];
    }
    while (v12);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v15 = *((id *)v4 + 3);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v44 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v32;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v15);
        }
        [(WOHealthBridgeProtoPersistence *)self addKeyedDates:*(void *)(*((void *)&v31 + 1) + 8 * k)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v31 objects:v44 count:16];
    }
    while (v17);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v20 = *((id *)v4 + 2);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v27 objects:v43 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v28;
    do
    {
      for (uint64_t m = 0; m != v22; ++m)
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v20);
        }
        -[WOHealthBridgeProtoPersistence addKeyedDatas:](self, "addKeyedDatas:", *(void *)(*((void *)&v27 + 1) + 8 * m), (void)v27);
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v27 objects:v43 count:16];
    }
    while (v22);
  }

  if (*((void *)v4 + 7)) {
    -[WOHealthBridgeProtoPersistence setPersistedData:](self, "setPersistedData:");
  }
  if (*((void *)v4 + 8)) {
    -[WOHealthBridgeProtoPersistence setPersistedProtoData:](self, "setPersistedProtoData:");
  }
  self->_uint64_t objectState = *((_DWORD *)v4 + 12);
  self->_double objectModificationTimeSinceReferenceDate = *((double *)v4 + 1);
  syncIdentity = self->_syncIdentity;
  uint64_t v26 = *((void *)v4 + 9);
  if (syncIdentity)
  {
    if (v26) {
      -[WOHealthBridgeSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
    }
  }
  else if (v26)
  {
    -[WOHealthBridgeProtoPersistence setSyncIdentity:](self, "setSyncIdentity:");
  }
}

- (int)version
{
  return self->_version;
}

- (void)setVersion:(int)a3
{
  self->_uint64_t version = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_uint64_t type = a3;
}

- (NSData)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSMutableArray)keyedNumbers
{
  return self->_keyedNumbers;
}

- (void)setKeyedNumbers:(id)a3
{
}

- (NSMutableArray)keyedStrings
{
  return self->_keyedStrings;
}

- (void)setKeyedStrings:(id)a3
{
}

- (NSMutableArray)keyedDates
{
  return self->_keyedDates;
}

- (void)setKeyedDates:(id)a3
{
}

- (NSMutableArray)keyedDatas
{
  return self->_keyedDatas;
}

- (void)setKeyedDatas:(id)a3
{
}

- (NSData)persistedData
{
  return self->_persistedData;
}

- (void)setPersistedData:(id)a3
{
}

- (NSData)persistedProtoData
{
  return self->_persistedProtoData;
}

- (void)setPersistedProtoData:(id)a3
{
}

- (int)objectState
{
  return self->_objectState;
}

- (void)setObjectState:(int)a3
{
  self->_uint64_t objectState = a3;
}

- (double)objectModificationTimeSinceReferenceDate
{
  return self->_objectModificationTimeSinceReferenceDate;
}

- (void)setObjectModificationTimeSinceReferenceDate:(double)a3
{
  self->_double objectModificationTimeSinceReferenceDate = a3;
}

- (WOHealthBridgeSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_persistedProtoData, 0);
  objc_storeStrong((id *)&self->_persistedData, 0);
  objc_storeStrong((id *)&self->_keyedStrings, 0);
  objc_storeStrong((id *)&self->_keyedNumbers, 0);
  objc_storeStrong((id *)&self->_keyedDates, 0);
  objc_storeStrong((id *)&self->_keyedDatas, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[WOHealthBridgeProtoPersistence writeTo:]", "WOHealthBridgeProtoPersistence.m", 375, "nil != self->_uuid");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[WOHealthBridgeProtoPersistence writeTo:]", "WOHealthBridgeProtoPersistence.m", 408, "nil != self->_persistedData");
}

@end