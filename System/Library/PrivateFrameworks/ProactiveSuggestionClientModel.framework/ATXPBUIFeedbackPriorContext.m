@interface ATXPBUIFeedbackPriorContext
+ (Class)blendingModelCacheUpdatesType;
+ (Class)cacheUpdateOrderingType;
+ (Class)clientModelCacheUpdatesType;
- (BOOL)hasContext;
- (BOOL)hasContextClassString;
- (BOOL)hasPinnedBlendingModelUICacheUpdateUUID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)context;
- (NSMutableArray)blendingModelCacheUpdates;
- (NSMutableArray)cacheUpdateOrderings;
- (NSMutableArray)clientModelCacheUpdates;
- (NSString)contextClassString;
- (NSString)pinnedBlendingModelUICacheUpdateUUID;
- (id)blendingModelCacheUpdatesAtIndex:(unint64_t)a3;
- (id)cacheUpdateOrderingAtIndex:(unint64_t)a3;
- (id)clientModelCacheUpdatesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)blendingModelCacheUpdatesCount;
- (unint64_t)cacheUpdateOrderingsCount;
- (unint64_t)clientModelCacheUpdatesCount;
- (unint64_t)hash;
- (void)addBlendingModelCacheUpdates:(id)a3;
- (void)addCacheUpdateOrdering:(id)a3;
- (void)addClientModelCacheUpdates:(id)a3;
- (void)clearBlendingModelCacheUpdates;
- (void)clearCacheUpdateOrderings;
- (void)clearClientModelCacheUpdates;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBlendingModelCacheUpdates:(id)a3;
- (void)setCacheUpdateOrderings:(id)a3;
- (void)setClientModelCacheUpdates:(id)a3;
- (void)setContext:(id)a3;
- (void)setContextClassString:(id)a3;
- (void)setPinnedBlendingModelUICacheUpdateUUID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBUIFeedbackPriorContext

- (void)clearCacheUpdateOrderings
{
}

- (void)addCacheUpdateOrdering:(id)a3
{
  id v4 = a3;
  cacheUpdateOrderings = self->_cacheUpdateOrderings;
  id v8 = v4;
  if (!cacheUpdateOrderings)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_cacheUpdateOrderings;
    self->_cacheUpdateOrderings = v6;

    id v4 = v8;
    cacheUpdateOrderings = self->_cacheUpdateOrderings;
  }
  [(NSMutableArray *)cacheUpdateOrderings addObject:v4];
}

- (unint64_t)cacheUpdateOrderingsCount
{
  return [(NSMutableArray *)self->_cacheUpdateOrderings count];
}

- (id)cacheUpdateOrderingAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cacheUpdateOrderings objectAtIndex:a3];
}

+ (Class)cacheUpdateOrderingType
{
  return (Class)objc_opt_class();
}

- (void)clearBlendingModelCacheUpdates
{
}

- (void)addBlendingModelCacheUpdates:(id)a3
{
  id v4 = a3;
  blendingModelCacheUpdates = self->_blendingModelCacheUpdates;
  id v8 = v4;
  if (!blendingModelCacheUpdates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_blendingModelCacheUpdates;
    self->_blendingModelCacheUpdates = v6;

    id v4 = v8;
    blendingModelCacheUpdates = self->_blendingModelCacheUpdates;
  }
  [(NSMutableArray *)blendingModelCacheUpdates addObject:v4];
}

- (unint64_t)blendingModelCacheUpdatesCount
{
  return [(NSMutableArray *)self->_blendingModelCacheUpdates count];
}

- (id)blendingModelCacheUpdatesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_blendingModelCacheUpdates objectAtIndex:a3];
}

+ (Class)blendingModelCacheUpdatesType
{
  return (Class)objc_opt_class();
}

- (void)clearClientModelCacheUpdates
{
}

- (void)addClientModelCacheUpdates:(id)a3
{
  id v4 = a3;
  clientModelCacheUpdates = self->_clientModelCacheUpdates;
  id v8 = v4;
  if (!clientModelCacheUpdates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_clientModelCacheUpdates;
    self->_clientModelCacheUpdates = v6;

    id v4 = v8;
    clientModelCacheUpdates = self->_clientModelCacheUpdates;
  }
  [(NSMutableArray *)clientModelCacheUpdates addObject:v4];
}

- (unint64_t)clientModelCacheUpdatesCount
{
  return [(NSMutableArray *)self->_clientModelCacheUpdates count];
}

- (id)clientModelCacheUpdatesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_clientModelCacheUpdates objectAtIndex:a3];
}

+ (Class)clientModelCacheUpdatesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasContext
{
  return self->_context != 0;
}

- (BOOL)hasContextClassString
{
  return self->_contextClassString != 0;
}

- (BOOL)hasPinnedBlendingModelUICacheUpdateUUID
{
  return self->_pinnedBlendingModelUICacheUpdateUUID != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBUIFeedbackPriorContext;
  id v4 = [(ATXPBUIFeedbackPriorContext *)&v8 description];
  v5 = [(ATXPBUIFeedbackPriorContext *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  cacheUpdateOrderings = self->_cacheUpdateOrderings;
  if (cacheUpdateOrderings) {
    [v3 setObject:cacheUpdateOrderings forKey:@"cacheUpdateOrdering"];
  }
  if ([(NSMutableArray *)self->_blendingModelCacheUpdates count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_blendingModelCacheUpdates, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v7 = self->_blendingModelCacheUpdates;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v28 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKey:@"blendingModelCacheUpdates"];
  }
  if ([(NSMutableArray *)self->_clientModelCacheUpdates count])
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_clientModelCacheUpdates, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v14 = self->_clientModelCacheUpdates;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * j), "dictionaryRepresentation", (void)v24);
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v16);
    }

    [v4 setObject:v13 forKey:@"clientModelCacheUpdates"];
  }
  context = self->_context;
  if (context) {
    [v4 setObject:context forKey:@"context"];
  }
  contextClassString = self->_contextClassString;
  if (contextClassString) {
    [v4 setObject:contextClassString forKey:@"contextClassString"];
  }
  pinnedBlendingModelUICacheUpdateUUID = self->_pinnedBlendingModelUICacheUpdateUUID;
  if (pinnedBlendingModelUICacheUpdateUUID) {
    [v4 setObject:pinnedBlendingModelUICacheUpdateUUID forKey:@"pinnedBlendingModelUICacheUpdateUUID"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBUIFeedbackPriorContextReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v5 = self->_cacheUpdateOrderings;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v10 = self->_blendingModelCacheUpdates;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v15 = self->_clientModelCacheUpdates;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }

  if (self->_context) {
    PBDataWriterWriteDataField();
  }
  if (self->_contextClassString) {
    PBDataWriterWriteStringField();
  }
  if (self->_pinnedBlendingModelUICacheUpdateUUID) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v17 = a3;
  if ([(ATXPBUIFeedbackPriorContext *)self cacheUpdateOrderingsCount])
  {
    [v17 clearCacheUpdateOrderings];
    unint64_t v4 = [(ATXPBUIFeedbackPriorContext *)self cacheUpdateOrderingsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(ATXPBUIFeedbackPriorContext *)self cacheUpdateOrderingAtIndex:i];
        [v17 addCacheUpdateOrdering:v7];
      }
    }
  }
  if ([(ATXPBUIFeedbackPriorContext *)self blendingModelCacheUpdatesCount])
  {
    [v17 clearBlendingModelCacheUpdates];
    unint64_t v8 = [(ATXPBUIFeedbackPriorContext *)self blendingModelCacheUpdatesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(ATXPBUIFeedbackPriorContext *)self blendingModelCacheUpdatesAtIndex:j];
        [v17 addBlendingModelCacheUpdates:v11];
      }
    }
  }
  if ([(ATXPBUIFeedbackPriorContext *)self clientModelCacheUpdatesCount])
  {
    [v17 clearClientModelCacheUpdates];
    unint64_t v12 = [(ATXPBUIFeedbackPriorContext *)self clientModelCacheUpdatesCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(ATXPBUIFeedbackPriorContext *)self clientModelCacheUpdatesAtIndex:k];
        [v17 addClientModelCacheUpdates:v15];
      }
    }
  }
  if (self->_context) {
    objc_msgSend(v17, "setContext:");
  }
  uint64_t v16 = v17;
  if (self->_contextClassString)
  {
    objc_msgSend(v17, "setContextClassString:");
    uint64_t v16 = v17;
  }
  if (self->_pinnedBlendingModelUICacheUpdateUUID)
  {
    objc_msgSend(v17, "setPinnedBlendingModelUICacheUpdateUUID:");
    uint64_t v16 = v17;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v6 = self->_cacheUpdateOrderings;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v40;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v39 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addCacheUpdateOrdering:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v8);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  unint64_t v12 = self->_blendingModelCacheUpdates;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v36;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = (void *)[*(id *)(*((void *)&v35 + 1) + 8 * v16) copyWithZone:a3];
        [v5 addBlendingModelCacheUpdates:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v35 objects:v44 count:16];
    }
    while (v14);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v18 = self->_clientModelCacheUpdates;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v32;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v32 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * v22), "copyWithZone:", a3, (void)v31);
        [v5 addClientModelCacheUpdates:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v31 objects:v43 count:16];
    }
    while (v20);
  }

  uint64_t v24 = [(NSData *)self->_context copyWithZone:a3];
  long long v25 = (void *)v5[4];
  v5[4] = v24;

  uint64_t v26 = [(NSString *)self->_contextClassString copyWithZone:a3];
  long long v27 = (void *)v5[5];
  v5[5] = v26;

  uint64_t v28 = [(NSString *)self->_pinnedBlendingModelUICacheUpdateUUID copyWithZone:a3];
  long long v29 = (void *)v5[6];
  v5[6] = v28;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((cacheUpdateOrderings = self->_cacheUpdateOrderings, !((unint64_t)cacheUpdateOrderings | v4[2]))
     || -[NSMutableArray isEqual:](cacheUpdateOrderings, "isEqual:"))
    && ((blendingModelCacheUpdates = self->_blendingModelCacheUpdates,
         !((unint64_t)blendingModelCacheUpdates | v4[1]))
     || -[NSMutableArray isEqual:](blendingModelCacheUpdates, "isEqual:"))
    && ((clientModelCacheUpdates = self->_clientModelCacheUpdates, !((unint64_t)clientModelCacheUpdates | v4[3]))
     || -[NSMutableArray isEqual:](clientModelCacheUpdates, "isEqual:"))
    && ((context = self->_context, !((unint64_t)context | v4[4]))
     || -[NSData isEqual:](context, "isEqual:"))
    && ((contextClassString = self->_contextClassString, !((unint64_t)contextClassString | v4[5]))
     || -[NSString isEqual:](contextClassString, "isEqual:")))
  {
    pinnedBlendingModelUICacheUpdateUUID = self->_pinnedBlendingModelUICacheUpdateUUID;
    if ((unint64_t)pinnedBlendingModelUICacheUpdateUUID | v4[6]) {
      char v11 = -[NSString isEqual:](pinnedBlendingModelUICacheUpdateUUID, "isEqual:");
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_cacheUpdateOrderings hash];
  uint64_t v4 = [(NSMutableArray *)self->_blendingModelCacheUpdates hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_clientModelCacheUpdates hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSData *)self->_context hash];
  NSUInteger v7 = [(NSString *)self->_contextClassString hash];
  return v6 ^ v7 ^ [(NSString *)self->_pinnedBlendingModelUICacheUpdateUUID hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = v4[2];
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
        [(ATXPBUIFeedbackPriorContext *)self addCacheUpdateOrdering:*(void *)(*((void *)&v28 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v4[1];
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
        [(ATXPBUIFeedbackPriorContext *)self addBlendingModelCacheUpdates:*(void *)(*((void *)&v24 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = v4[3];
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
        -[ATXPBUIFeedbackPriorContext addClientModelCacheUpdates:](self, "addClientModelCacheUpdates:", *(void *)(*((void *)&v20 + 1) + 8 * k), (void)v20);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }

  if (v4[4]) {
    -[ATXPBUIFeedbackPriorContext setContext:](self, "setContext:");
  }
  if (v4[5]) {
    -[ATXPBUIFeedbackPriorContext setContextClassString:](self, "setContextClassString:");
  }
  if (v4[6]) {
    -[ATXPBUIFeedbackPriorContext setPinnedBlendingModelUICacheUpdateUUID:](self, "setPinnedBlendingModelUICacheUpdateUUID:");
  }
}

- (NSMutableArray)cacheUpdateOrderings
{
  return self->_cacheUpdateOrderings;
}

- (void)setCacheUpdateOrderings:(id)a3
{
}

- (NSMutableArray)blendingModelCacheUpdates
{
  return self->_blendingModelCacheUpdates;
}

- (void)setBlendingModelCacheUpdates:(id)a3
{
}

- (NSMutableArray)clientModelCacheUpdates
{
  return self->_clientModelCacheUpdates;
}

- (void)setClientModelCacheUpdates:(id)a3
{
}

- (NSData)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSString)contextClassString
{
  return self->_contextClassString;
}

- (void)setContextClassString:(id)a3
{
}

- (NSString)pinnedBlendingModelUICacheUpdateUUID
{
  return self->_pinnedBlendingModelUICacheUpdateUUID;
}

- (void)setPinnedBlendingModelUICacheUpdateUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinnedBlendingModelUICacheUpdateUUID, 0);
  objc_storeStrong((id *)&self->_contextClassString, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_clientModelCacheUpdates, 0);
  objc_storeStrong((id *)&self->_cacheUpdateOrderings, 0);
  objc_storeStrong((id *)&self->_blendingModelCacheUpdates, 0);
}

@end