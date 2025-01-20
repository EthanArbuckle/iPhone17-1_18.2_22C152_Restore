@interface NTPBPersonalizationProfile
+ (Class)aggregatesType;
+ (Class)historiesType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)aggregates;
- (NSMutableArray)histories;
- (id)aggregatesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)historiesAtIndex:(unint64_t)a3;
- (unint64_t)aggregatesCount;
- (unint64_t)hash;
- (unint64_t)historiesCount;
- (void)addAggregates:(id)a3;
- (void)addHistories:(id)a3;
- (void)clearAggregates;
- (void)clearHistories;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAggregates:(id)a3;
- (void)setHistories:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBPersonalizationProfile

- (void)dealloc
{
  [(NTPBPersonalizationProfile *)self setAggregates:0];
  [(NTPBPersonalizationProfile *)self setHistories:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBPersonalizationProfile;
  [(NTPBPersonalizationProfile *)&v3 dealloc];
}

- (void)setAggregates:(id)a3
{
}

- (void)setHistories:(id)a3
{
}

- (NSMutableArray)aggregates
{
  return self->_aggregates;
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

- (void)clearHistories
{
}

- (void)addHistories:(id)a3
{
  histories = self->_histories;
  if (!histories)
  {
    histories = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_histories = histories;
  }

  [(NSMutableArray *)histories addObject:a3];
}

- (unint64_t)historiesCount
{
  return [(NSMutableArray *)self->_histories count];
}

- (id)historiesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_histories objectAtIndex:a3];
}

+ (Class)historiesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBPersonalizationProfile;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBPersonalizationProfile description](&v3, sel_description), -[NTPBPersonalizationProfile dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_aggregates count])
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_aggregates, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    aggregates = self->_aggregates;
    uint64_t v6 = [(NSMutableArray *)aggregates countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(aggregates);
          }
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        uint64_t v7 = [(NSMutableArray *)aggregates countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v7);
    }
    [v3 setObject:v4 forKey:@"aggregates"];
  }
  if ([(NSMutableArray *)self->_histories count])
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_histories, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    histories = self->_histories;
    uint64_t v12 = [(NSMutableArray *)histories countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(histories);
          }
          objc_msgSend(v10, "addObject:", objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * j), "dictionaryRepresentation"));
        }
        uint64_t v13 = [(NSMutableArray *)histories countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v13);
    }
    [v3 setObject:v10 forKey:@"histories"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPersonalizationProfileReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  aggregates = self->_aggregates;
  uint64_t v5 = [(NSMutableArray *)aggregates countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(aggregates);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v6 = [(NSMutableArray *)aggregates countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v6);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  histories = self->_histories;
  uint64_t v10 = [(NSMutableArray *)histories countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(histories);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v11 = [(NSMutableArray *)histories countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v11);
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
  aggregates = self->_aggregates;
  uint64_t v7 = [(NSMutableArray *)aggregates countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(aggregates);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v23 + 1) + 8 * i) copyWithZone:a3];
        [v5 addAggregates:v11];
      }
      uint64_t v8 = [(NSMutableArray *)aggregates countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  histories = self->_histories;
  uint64_t v13 = [(NSMutableArray *)histories countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(histories);
        }
        long long v17 = (void *)[*(id *)(*((void *)&v19 + 1) + 8 * j) copyWithZone:a3];
        [v5 addHistories:v17];
      }
      uint64_t v14 = [(NSMutableArray *)histories countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    aggregates = self->_aggregates;
    if (!((unint64_t)aggregates | *((void *)a3 + 1))
      || (int v5 = -[NSMutableArray isEqual:](aggregates, "isEqual:")) != 0)
    {
      histories = self->_histories;
      if ((unint64_t)histories | *((void *)a3 + 2))
      {
        LOBYTE(v5) = -[NSMutableArray isEqual:](histories, "isEqual:");
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_aggregates hash];
  return [(NSMutableArray *)self->_histories hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  int v5 = (void *)*((void *)a3 + 1);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NTPBPersonalizationProfile *)self addAggregates:*(void *)(*((void *)&v19 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
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
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [(NTPBPersonalizationProfile *)self addHistories:*(void *)(*((void *)&v15 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (NSMutableArray)histories
{
  return self->_histories;
}

@end