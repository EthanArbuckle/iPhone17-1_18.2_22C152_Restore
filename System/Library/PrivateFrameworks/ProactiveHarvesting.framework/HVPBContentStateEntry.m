@interface HVPBContentStateEntry
+ (Class)uniqueIdsType;
- (BOOL)hasState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HVPBContentState)state;
- (NSMutableArray)uniqueIds;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)uniqueIdsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)uniqueIdsCount;
- (void)addUniqueIds:(id)a3;
- (void)clearUniqueIds;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setState:(id)a3;
- (void)setUniqueIds:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HVPBContentStateEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIds, 0);

  objc_storeStrong((id *)&self->_state, 0);
}

- (void)setUniqueIds:(id)a3
{
}

- (NSMutableArray)uniqueIds
{
  return self->_uniqueIds;
}

- (void)setState:(id)a3
{
}

- (HVPBContentState)state
{
  return self->_state;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  state = self->_state;
  uint64_t v6 = *((void *)v4 + 1);
  if (state)
  {
    if (v6) {
      -[HVPBContentState mergeFrom:](state, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[HVPBContentStateEntry setState:](self, "setState:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 2);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        -[HVPBContentStateEntry addUniqueIds:](self, "addUniqueIds:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(HVPBContentState *)self->_state hash];
  return [(NSMutableArray *)self->_uniqueIds hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((state = self->_state, !((unint64_t)state | v4[1])) || -[HVPBContentState isEqual:](state, "isEqual:")))
  {
    uniqueIds = self->_uniqueIds;
    if ((unint64_t)uniqueIds | v4[2]) {
      char v7 = -[NSMutableArray isEqual:](uniqueIds, "isEqual:");
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
  uint64_t v20 = *MEMORY[0x263EF8340];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HVPBContentState *)self->_state copyWithZone:a3];
  char v7 = (void *)v5[1];
  v5[1] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_uniqueIds;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (void)v15);
        [v5 addUniqueIds:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_state) {
    objc_msgSend(v8, "setState:");
  }
  if ([(HVPBContentStateEntry *)self uniqueIdsCount])
  {
    [v8 clearUniqueIds];
    unint64_t v4 = [(HVPBContentStateEntry *)self uniqueIdsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        char v7 = [(HVPBContentStateEntry *)self uniqueIdsAtIndex:i];
        [v8 addUniqueIds:v7];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_state) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = self->_uniqueIds;
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
}

- (BOOL)readFrom:(id)a3
{
  return HVPBContentStateEntryReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  state = self->_state;
  if (state)
  {
    unint64_t v5 = [(HVPBContentState *)state dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"state"];
  }
  uniqueIds = self->_uniqueIds;
  if (uniqueIds) {
    [v3 setObject:uniqueIds forKey:@"uniqueIds"];
  }

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HVPBContentStateEntry;
  id v4 = [(HVPBContentStateEntry *)&v8 description];
  unint64_t v5 = [(HVPBContentStateEntry *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)uniqueIdsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_uniqueIds objectAtIndex:a3];
}

- (unint64_t)uniqueIdsCount
{
  return [(NSMutableArray *)self->_uniqueIds count];
}

- (void)addUniqueIds:(id)a3
{
  id v4 = a3;
  uniqueIds = self->_uniqueIds;
  id v8 = v4;
  if (!uniqueIds)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_uniqueIds;
    self->_uniqueIds = v6;

    id v4 = v8;
    uniqueIds = self->_uniqueIds;
  }
  [(NSMutableArray *)uniqueIds addObject:v4];
}

- (void)clearUniqueIds
{
}

- (BOOL)hasState
{
  return self->_state != 0;
}

+ (Class)uniqueIdsType
{
  return (Class)objc_opt_class();
}

@end