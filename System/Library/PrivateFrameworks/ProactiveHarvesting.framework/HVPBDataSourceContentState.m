@interface HVPBDataSourceContentState
+ (Class)deferredContentStatesType;
+ (Class)deprecatedDeferredContentStatesType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)deferredContentStates;
- (NSMutableArray)deprecatedDeferredContentStates;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deferredContentStatesAtIndex:(unint64_t)a3;
- (id)deprecatedDeferredContentStatesAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)deferredContentStatesCount;
- (unint64_t)deprecatedDeferredContentStatesCount;
- (unint64_t)hash;
- (void)addDeferredContentStates:(id)a3;
- (void)addDeprecatedDeferredContentStates:(id)a3;
- (void)clearDeferredContentStates;
- (void)clearDeprecatedDeferredContentStates;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeferredContentStates:(id)a3;
- (void)setDeprecatedDeferredContentStates:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HVPBDataSourceContentState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deprecatedDeferredContentStates, 0);

  objc_storeStrong((id *)&self->_deferredContentStates, 0);
}

- (void)setDeferredContentStates:(id)a3
{
}

- (NSMutableArray)deferredContentStates
{
  return self->_deferredContentStates;
}

- (void)setDeprecatedDeferredContentStates:(id)a3
{
}

- (NSMutableArray)deprecatedDeferredContentStates
{
  return self->_deprecatedDeferredContentStates;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v4 = (id *)a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v4[2];
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
        [(HVPBDataSourceContentState *)self addDeprecatedDeferredContentStates:*(void *)(*((void *)&v19 + 1) + 8 * v9++)];
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
  id v10 = v4[1];
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
        -[HVPBDataSourceContentState addDeferredContentStates:](self, "addDeferredContentStates:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_deprecatedDeferredContentStates hash];
  return [(NSMutableArray *)self->_deferredContentStates hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((deprecatedDeferredContentStates = self->_deprecatedDeferredContentStates,
         !((unint64_t)deprecatedDeferredContentStates | v4[2]))
     || -[NSMutableArray isEqual:](deprecatedDeferredContentStates, "isEqual:")))
  {
    deferredContentStates = self->_deferredContentStates;
    if ((unint64_t)deferredContentStates | v4[1]) {
      char v7 = -[NSMutableArray isEqual:](deferredContentStates, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = self->_deprecatedDeferredContentStates;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v23 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addDeprecatedDeferredContentStates:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v12 = self->_deferredContentStates;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
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
        [v5 addDeferredContentStates:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  return v5;
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if ([(HVPBDataSourceContentState *)self deprecatedDeferredContentStatesCount])
  {
    [v12 clearDeprecatedDeferredContentStates];
    unint64_t v4 = [(HVPBDataSourceContentState *)self deprecatedDeferredContentStatesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HVPBDataSourceContentState *)self deprecatedDeferredContentStatesAtIndex:i];
        [v12 addDeprecatedDeferredContentStates:v7];
      }
    }
  }
  if ([(HVPBDataSourceContentState *)self deferredContentStatesCount])
  {
    [v12 clearDeferredContentStates];
    unint64_t v8 = [(HVPBDataSourceContentState *)self deferredContentStatesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(HVPBDataSourceContentState *)self deferredContentStatesAtIndex:j];
        [v12 addDeferredContentStates:v11];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  unint64_t v5 = self->_deprecatedDeferredContentStates;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
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
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = self->_deferredContentStates;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
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
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (BOOL)readFrom:(id)a3
{
  return HVPBDataSourceContentStateReadFrom(self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_deprecatedDeferredContentStates count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_deprecatedDeferredContentStates, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    unint64_t v5 = self->_deprecatedDeferredContentStates;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v23 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"deprecatedDeferredContentStates"];
  }
  if ([(NSMutableArray *)self->_deferredContentStates count])
  {
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_deferredContentStates, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v12 = self->_deferredContentStates;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * j), "dictionaryRepresentation", (void)v19);
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"deferredContentStates"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HVPBDataSourceContentState;
  id v4 = [(HVPBDataSourceContentState *)&v8 description];
  unint64_t v5 = [(HVPBDataSourceContentState *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)deferredContentStatesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_deferredContentStates objectAtIndex:a3];
}

- (unint64_t)deferredContentStatesCount
{
  return [(NSMutableArray *)self->_deferredContentStates count];
}

- (void)addDeferredContentStates:(id)a3
{
  id v4 = a3;
  deferredContentStates = self->_deferredContentStates;
  id v8 = v4;
  if (!deferredContentStates)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_deferredContentStates;
    self->_deferredContentStates = v6;

    id v4 = v8;
    deferredContentStates = self->_deferredContentStates;
  }
  [(NSMutableArray *)deferredContentStates addObject:v4];
}

- (void)clearDeferredContentStates
{
}

- (id)deprecatedDeferredContentStatesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_deprecatedDeferredContentStates objectAtIndex:a3];
}

- (unint64_t)deprecatedDeferredContentStatesCount
{
  return [(NSMutableArray *)self->_deprecatedDeferredContentStates count];
}

- (void)addDeprecatedDeferredContentStates:(id)a3
{
  id v4 = a3;
  deprecatedDeferredContentStates = self->_deprecatedDeferredContentStates;
  id v8 = v4;
  if (!deprecatedDeferredContentStates)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_deprecatedDeferredContentStates;
    self->_deprecatedDeferredContentStates = v6;

    id v4 = v8;
    deprecatedDeferredContentStates = self->_deprecatedDeferredContentStates;
  }
  [(NSMutableArray *)deprecatedDeferredContentStates addObject:v4];
}

- (void)clearDeprecatedDeferredContentStates
{
}

+ (Class)deferredContentStatesType
{
  return (Class)objc_opt_class();
}

+ (Class)deprecatedDeferredContentStatesType
{
  return (Class)objc_opt_class();
}

@end