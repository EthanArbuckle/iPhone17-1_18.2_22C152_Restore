@interface ATXPBLightweightClientModelCacheUpdate
+ (Class)suggestionsType;
- (BOOL)hasCacheCreationDate;
- (BOOL)hasClientModelId;
- (BOOL)hasUuidString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)suggestions;
- (NSString)clientModelId;
- (NSString)uuidString;
- (double)cacheCreationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)suggestionsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)suggestionsCount;
- (void)addSuggestions:(id)a3;
- (void)clearSuggestions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCacheCreationDate:(double)a3;
- (void)setClientModelId:(id)a3;
- (void)setHasCacheCreationDate:(BOOL)a3;
- (void)setSuggestions:(id)a3;
- (void)setUuidString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBLightweightClientModelCacheUpdate

- (BOOL)hasUuidString
{
  return self->_uuidString != 0;
}

- (void)clearSuggestions
{
}

- (void)addSuggestions:(id)a3
{
  id v4 = a3;
  suggestions = self->_suggestions;
  id v8 = v4;
  if (!suggestions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_suggestions;
    self->_suggestions = v6;

    id v4 = v8;
    suggestions = self->_suggestions;
  }
  [(NSMutableArray *)suggestions addObject:v4];
}

- (unint64_t)suggestionsCount
{
  return [(NSMutableArray *)self->_suggestions count];
}

- (id)suggestionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_suggestions objectAtIndex:a3];
}

+ (Class)suggestionsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasClientModelId
{
  return self->_clientModelId != 0;
}

- (void)setCacheCreationDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_cacheCreationDate = a3;
}

- (void)setHasCacheCreationDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCacheCreationDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBLightweightClientModelCacheUpdate;
  id v4 = [(ATXPBLightweightClientModelCacheUpdate *)&v8 description];
  v5 = [(ATXPBLightweightClientModelCacheUpdate *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  uuidString = self->_uuidString;
  if (uuidString) {
    [v3 setObject:uuidString forKey:@"uuidString"];
  }
  if ([(NSMutableArray *)self->_suggestions count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_suggestions, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v7 = self->_suggestions;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKey:@"suggestions"];
  }
  clientModelId = self->_clientModelId;
  if (clientModelId) {
    [v4 setObject:clientModelId forKey:@"clientModelId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v14 = [NSNumber numberWithDouble:self->_cacheCreationDate];
    [v4 setObject:v14 forKey:@"cacheCreationDate"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBLightweightClientModelCacheUpdateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_uuidString) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_suggestions;
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
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_clientModelId) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_uuidString) {
    objc_msgSend(v8, "setUuidString:");
  }
  if ([(ATXPBLightweightClientModelCacheUpdate *)self suggestionsCount])
  {
    [v8 clearSuggestions];
    unint64_t v4 = [(ATXPBLightweightClientModelCacheUpdate *)self suggestionsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(ATXPBLightweightClientModelCacheUpdate *)self suggestionsAtIndex:i];
        [v8 addSuggestions:v7];
      }
    }
  }
  if (self->_clientModelId) {
    objc_msgSend(v8, "setClientModelId:");
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v8 + 1) = *(void *)&self->_cacheCreationDate;
    *((unsigned char *)v8 + 40) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uuidString copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = self->_suggestions;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v12), "copyWithZone:", a3, (void)v17);
        [(id)v5 addSuggestions:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(NSString *)self->_clientModelId copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v14;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_cacheCreationDate;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uuidString = self->_uuidString;
  if ((unint64_t)uuidString | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](uuidString, "isEqual:")) {
      goto LABEL_12;
    }
  }
  suggestions = self->_suggestions;
  if ((unint64_t)suggestions | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](suggestions, "isEqual:")) {
      goto LABEL_12;
    }
  }
  clientModelId = self->_clientModelId;
  if ((unint64_t)clientModelId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](clientModelId, "isEqual:")) {
      goto LABEL_12;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) != 0 && self->_cacheCreationDate == *((double *)v4 + 1))
    {
      BOOL v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uuidString hash];
  uint64_t v4 = [(NSMutableArray *)self->_suggestions hash];
  NSUInteger v5 = [(NSString *)self->_clientModelId hash];
  if (*(unsigned char *)&self->_has)
  {
    double cacheCreationDate = self->_cacheCreationDate;
    double v8 = -cacheCreationDate;
    if (cacheCreationDate >= 0.0) {
      double v8 = self->_cacheCreationDate;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 4)) {
    -[ATXPBLightweightClientModelCacheUpdate setUuidString:](self, "setUuidString:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 3);
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
        -[ATXPBLightweightClientModelCacheUpdate addSuggestions:](self, "addSuggestions:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 2)) {
    -[ATXPBLightweightClientModelCacheUpdate setClientModelId:](self, "setClientModelId:");
  }
  if (*((unsigned char *)v4 + 40))
  {
    self->_double cacheCreationDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (void)setUuidString:(id)a3
{
}

- (NSMutableArray)suggestions
{
  return self->_suggestions;
}

- (void)setSuggestions:(id)a3
{
}

- (NSString)clientModelId
{
  return self->_clientModelId;
}

- (void)setClientModelId:(id)a3
{
}

- (double)cacheCreationDate
{
  return self->_cacheCreationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
}

@end