@interface ATXPBBlendingModelUICacheUpdate
- (BOOL)hasConsumerSubTypeString;
- (BOOL)hasHomeScreenCachedSuggestion;
- (BOOL)hasSpotlightSuggestionLayout;
- (BOOL)hasSuggestionLayout;
- (BOOL)hasUuidString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)cacheCreationDate;
- (id)clientModelCacheUpdateUUIDStringsAtIndex:(id *)a1;
- (id)clientModelIdsAtIndex:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)addClientModelCacheUpdateUUIDStrings:(uint64_t)a1;
- (uint64_t)addClientModelIds:(uint64_t)a1;
- (uint64_t)clearClientModelCacheUpdateUUIDStrings;
- (uint64_t)clearClientModelIds;
- (uint64_t)clientModelCacheUpdateUUIDStrings;
- (uint64_t)clientModelCacheUpdateUUIDStringsCount;
- (uint64_t)clientModelIds;
- (uint64_t)clientModelIdsCount;
- (uint64_t)consumerSubTypeString;
- (uint64_t)hasCacheCreationDate;
- (uint64_t)homeScreenCachedSuggestion;
- (uint64_t)setCacheCreationDate:(uint64_t)result;
- (uint64_t)setHasCacheCreationDate:(uint64_t)result;
- (uint64_t)spotlightSuggestionLayout;
- (uint64_t)suggestionLayout;
- (uint64_t)uuidString;
- (unint64_t)hash;
- (void)copyTo:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)setClientModelCacheUpdateUUIDStrings:(uint64_t)a1;
- (void)setClientModelIds:(uint64_t)a1;
- (void)setConsumerSubTypeString:(uint64_t)a1;
- (void)setHomeScreenCachedSuggestion:(uint64_t)a1;
- (void)setSpotlightSuggestionLayout:(uint64_t)a1;
- (void)setSuggestionLayout:(uint64_t)a1;
- (void)setUuidString:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBBlendingModelUICacheUpdate

- (BOOL)hasUuidString
{
  if (result) {
    return *(void *)(result + 64) != 0;
  }
  return result;
}

- (BOOL)hasConsumerSubTypeString
{
  if (result) {
    return *(void *)(result + 32) != 0;
  }
  return result;
}

- (uint64_t)clearClientModelIds
{
  if (result) {
    return [*(id *)(result + 24) removeAllObjects];
  }
  return result;
}

- (uint64_t)addClientModelIds:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 24);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v6;

      v5 = *(void **)(a1 + 24);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

- (uint64_t)clientModelIdsCount
{
  if (result) {
    return [*(id *)(result + 24) count];
  }
  return result;
}

- (id)clientModelIdsAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[3] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)clearClientModelCacheUpdateUUIDStrings
{
  if (result) {
    return [*(id *)(result + 16) removeAllObjects];
  }
  return result;
}

- (uint64_t)addClientModelCacheUpdateUUIDStrings:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 16);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v6;

      v5 = *(void **)(a1 + 16);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

- (uint64_t)clientModelCacheUpdateUUIDStringsCount
{
  if (result) {
    return [*(id *)(result + 16) count];
  }
  return result;
}

- (id)clientModelCacheUpdateUUIDStringsAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[2] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (BOOL)hasHomeScreenCachedSuggestion
{
  if (result) {
    return *(void *)(result + 40) != 0;
  }
  return result;
}

- (BOOL)hasSuggestionLayout
{
  if (result) {
    return *(void *)(result + 56) != 0;
  }
  return result;
}

- (uint64_t)setCacheCreationDate:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 72) |= 1u;
    *(double *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setHasCacheCreationDate:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 72) = *(unsigned char *)(result + 72) & 0xFE | a2;
  }
  return result;
}

- (uint64_t)hasCacheCreationDate
{
  if (result) {
    return *(unsigned char *)(result + 72) & 1;
  }
  return result;
}

- (BOOL)hasSpotlightSuggestionLayout
{
  if (result) {
    return *(void *)(result + 48) != 0;
  }
  return result;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBBlendingModelUICacheUpdate;
  id v4 = [(ATXPBBlendingModelUICacheUpdate *)&v8 description];
  v5 = [(ATXPBBlendingModelUICacheUpdate *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  uuidString = self->_uuidString;
  if (uuidString) {
    [v3 setObject:uuidString forKey:@"uuidString"];
  }
  consumerSubTypeString = self->_consumerSubTypeString;
  if (consumerSubTypeString) {
    [v4 setObject:consumerSubTypeString forKey:@"consumerSubTypeString"];
  }
  clientModelIds = self->_clientModelIds;
  if (clientModelIds) {
    [v4 setObject:clientModelIds forKey:@"clientModelIds"];
  }
  clientModelCacheUpdateUUIDStrings = self->_clientModelCacheUpdateUUIDStrings;
  if (clientModelCacheUpdateUUIDStrings) {
    [v4 setObject:clientModelCacheUpdateUUIDStrings forKey:@"clientModelCacheUpdateUUIDStrings"];
  }
  homeScreenCachedSuggestion = self->_homeScreenCachedSuggestion;
  if (homeScreenCachedSuggestion)
  {
    v10 = [(ATXPBHomeScreenCachedSuggestion *)homeScreenCachedSuggestion dictionaryRepresentation];
    [v4 setObject:v10 forKey:@"homeScreenCachedSuggestion"];
  }
  suggestionLayout = self->_suggestionLayout;
  if (suggestionLayout)
  {
    v12 = [(ATXPBSuggestionLayout *)suggestionLayout dictionaryRepresentation];
    [v4 setObject:v12 forKey:@"suggestionLayout"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v13 = [NSNumber numberWithDouble:self->_cacheCreationDate];
    [v4 setObject:v13 forKey:@"cacheCreationDate"];
  }
  spotlightSuggestionLayout = self->_spotlightSuggestionLayout;
  if (spotlightSuggestionLayout)
  {
    v15 = [(ATXPBSpotlightSuggestionLayout *)spotlightSuggestionLayout dictionaryRepresentation];
    [v4 setObject:v15 forKey:@"spotlightSuggestionLayout"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBBlendingModelUICacheUpdateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_uuidString) {
    PBDataWriterWriteStringField();
  }
  if (self->_consumerSubTypeString) {
    PBDataWriterWriteStringField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_clientModelIds;
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
        PBDataWriterWriteStringField();
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
  v10 = self->_clientModelCacheUpdateUUIDStrings;
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
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (self->_homeScreenCachedSuggestion) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_suggestionLayout) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_spotlightSuggestionLayout) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 64);
    long long v17 = v3;
    if (v4) {
      -[ATXPBBlendingModelUICacheUpdate setUuidString:]((uint64_t)v3, v4);
    }
    v5 = *(void **)(a1 + 32);
    if (v5) {
      -[ATXPBBlendingModelUICacheUpdate setConsumerSubTypeString:]((uint64_t)v17, v5);
    }
    if ([*(id *)(a1 + 24) count])
    {
      if (v17) {
        [v17[3] removeAllObjects];
      }
      uint64_t v6 = [*(id *)(a1 + 24) count];
      if (v6)
      {
        uint64_t v7 = v6;
        for (uint64_t i = 0; i != v7; ++i)
        {
          uint64_t v9 = [*(id *)(a1 + 24) objectAtIndex:i];
          -[ATXPBBlendingModelUICacheUpdate addClientModelIds:]((uint64_t)v17, v9);
        }
      }
    }
    if ([*(id *)(a1 + 16) count])
    {
      if (v17) {
        [v17[2] removeAllObjects];
      }
      uint64_t v10 = [*(id *)(a1 + 16) count];
      if (v10)
      {
        uint64_t v11 = v10;
        for (uint64_t j = 0; j != v11; ++j)
        {
          uint64_t v13 = [*(id *)(a1 + 16) objectAtIndex:j];
          -[ATXPBBlendingModelUICacheUpdate addClientModelCacheUpdateUUIDStrings:]((uint64_t)v17, v13);
        }
      }
    }
    uint64_t v14 = *(void **)(a1 + 40);
    if (v14) {
      -[ATXPBBlendingModelUICacheUpdate setHomeScreenCachedSuggestion:]((uint64_t)v17, v14);
    }
    long long v15 = *(void **)(a1 + 56);
    id v3 = v17;
    if (v15)
    {
      -[ATXPBBlendingModelUICacheUpdate setSuggestionLayout:]((uint64_t)v17, v15);
      id v3 = v17;
    }
    if (*(unsigned char *)(a1 + 72))
    {
      v3[1] = *(id *)(a1 + 8);
      *((unsigned char *)v3 + 72) |= 1u;
    }
    long long v16 = *(void **)(a1 + 48);
    if (v16)
    {
      -[ATXPBBlendingModelUICacheUpdate setSpotlightSuggestionLayout:]((uint64_t)v17, v16);
      id v3 = v17;
    }
  }
}

- (void)setUuidString:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

- (void)setConsumerSubTypeString:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)setHomeScreenCachedSuggestion:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (void)setSuggestionLayout:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (void)setSpotlightSuggestionLayout:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uuidString copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v6;

  uint64_t v8 = [(NSString *)self->_consumerSubTypeString copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v10 = self->_clientModelIds;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v38 count:16];
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
        long long v15 = (void *)[*(id *)(*((void *)&v33 + 1) + 8 * v14) copyWithZone:a3];
        -[ATXPBBlendingModelUICacheUpdate addClientModelIds:](v5, v15);

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v12);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v16 = self->_clientModelCacheUpdateUUIDStrings;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v30;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v30 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * v20), "copyWithZone:", a3, (void)v29);
        -[ATXPBBlendingModelUICacheUpdate addClientModelCacheUpdateUUIDStrings:](v5, v21);

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v18);
  }

  id v22 = [(ATXPBHomeScreenCachedSuggestion *)self->_homeScreenCachedSuggestion copyWithZone:a3];
  v23 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v22;

  id v24 = [(ATXPBSuggestionLayout *)self->_suggestionLayout copyWithZone:a3];
  uint64_t v25 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v24;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_cacheCreationDate;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  id v26 = -[ATXPBSpotlightSuggestionLayout copyWithZone:](self->_spotlightSuggestionLayout, "copyWithZone:", a3, (void)v29);
  v27 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v26;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  uuidString = self->_uuidString;
  if ((unint64_t)uuidString | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](uuidString, "isEqual:")) {
      goto LABEL_21;
    }
  }
  consumerSubTypeString = self->_consumerSubTypeString;
  if ((unint64_t)consumerSubTypeString | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](consumerSubTypeString, "isEqual:")) {
      goto LABEL_21;
    }
  }
  clientModelIds = self->_clientModelIds;
  if ((unint64_t)clientModelIds | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](clientModelIds, "isEqual:")) {
      goto LABEL_21;
    }
  }
  clientModelCacheUpdateUUIDStrings = self->_clientModelCacheUpdateUUIDStrings;
  if ((unint64_t)clientModelCacheUpdateUUIDStrings | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](clientModelCacheUpdateUUIDStrings, "isEqual:")) {
      goto LABEL_21;
    }
  }
  homeScreenCachedSuggestion = self->_homeScreenCachedSuggestion;
  if ((unint64_t)homeScreenCachedSuggestion | *((void *)v4 + 5))
  {
    if (!-[ATXPBHomeScreenCachedSuggestion isEqual:](homeScreenCachedSuggestion, "isEqual:")) {
      goto LABEL_21;
    }
  }
  suggestionLayout = self->_suggestionLayout;
  if ((unint64_t)suggestionLayout | *((void *)v4 + 7))
  {
    if (!-[ATXPBSuggestionLayout isEqual:](suggestionLayout, "isEqual:")) {
      goto LABEL_21;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_cacheCreationDate != *((double *)v4 + 1)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
LABEL_21:
    char v12 = 0;
    goto LABEL_22;
  }
  spotlightSuggestionLayout = self->_spotlightSuggestionLayout;
  if ((unint64_t)spotlightSuggestionLayout | *((void *)v4 + 6)) {
    char v12 = -[ATXPBSpotlightSuggestionLayout isEqual:](spotlightSuggestionLayout, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_22:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uuidString hash];
  NSUInteger v4 = [(NSString *)self->_consumerSubTypeString hash];
  uint64_t v5 = [(NSMutableArray *)self->_clientModelIds hash];
  uint64_t v6 = [(NSMutableArray *)self->_clientModelCacheUpdateUUIDStrings hash];
  unint64_t v7 = [(ATXPBHomeScreenCachedSuggestion *)self->_homeScreenCachedSuggestion hash];
  unint64_t v8 = [(ATXPBSuggestionLayout *)self->_suggestionLayout hash];
  if (*(unsigned char *)&self->_has)
  {
    double cacheCreationDate = self->_cacheCreationDate;
    double v11 = -cacheCreationDate;
    if (cacheCreationDate >= 0.0) {
      double v11 = self->_cacheCreationDate;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ [(ATXPBSpotlightSuggestionLayout *)self->_spotlightSuggestionLayout hash];
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v5 = (void *)v3[8];
    if (v5) {
      objc_storeStrong((id *)(a1 + 64), v5);
    }
    uint64_t v6 = (void *)*((void *)v4 + 4);
    if (v6) {
      objc_storeStrong((id *)(a1 + 32), v6);
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v7 = *((id *)v4 + 3);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v7);
          }
          -[ATXPBBlendingModelUICacheUpdate addClientModelIds:](a1, *(void **)(*((void *)&v24 + 1) + 8 * i));
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v9);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v12 = *((id *)v4 + 2);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          -[ATXPBBlendingModelUICacheUpdate addClientModelCacheUpdateUUIDStrings:](a1, *(void **)(*((void *)&v20 + 1) + 8 * j));
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v14);
    }

    uint64_t v17 = (void *)*((void *)v4 + 5);
    if (*(void *)(a1 + 40))
    {
      if (v17) {
        -[ATXPBHomeScreenCachedSuggestion mergeFrom:](*(void *)(a1 + 40), v17);
      }
    }
    else if (v17)
    {
      objc_storeStrong((id *)(a1 + 40), v17);
    }
    uint64_t v18 = (void *)*((void *)v4 + 7);
    if (*(void *)(a1 + 56))
    {
      if (v18) {
        -[ATXPBSuggestionLayout mergeFrom:](*(void *)(a1 + 56), v18);
      }
    }
    else if (v18)
    {
      objc_storeStrong((id *)(a1 + 56), v18);
    }
    if (*((unsigned char *)v4 + 72))
    {
      *(void *)(a1 + 8) = *((void *)v4 + 1);
      *(unsigned char *)(a1 + 72) |= 1u;
    }
    uint64_t v19 = *((void *)v4 + 6);
    if (*(void *)(a1 + 48))
    {
      if (v19) {
        [*(id *)(a1 + 48) mergeFrom:(void)v20];
      }
    }
    else if (v19)
    {
      objc_storeStrong((id *)(a1 + 48), *((id *)v4 + 6));
    }
  }
}

- (uint64_t)uuidString
{
  if (result) {
    return *(void *)(result + 64);
  }
  return result;
}

- (uint64_t)consumerSubTypeString
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (uint64_t)clientModelIds
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (void)setClientModelIds:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (uint64_t)clientModelCacheUpdateUUIDStrings
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (void)setClientModelCacheUpdateUUIDStrings:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (uint64_t)homeScreenCachedSuggestion
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

- (uint64_t)suggestionLayout
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

- (double)cacheCreationDate
{
  if (a1) {
    return *(double *)(a1 + 8);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)spotlightSuggestionLayout
{
  if (result) {
    return *(void *)(result + 48);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->_suggestionLayout, 0);
  objc_storeStrong((id *)&self->_spotlightSuggestionLayout, 0);
  objc_storeStrong((id *)&self->_homeScreenCachedSuggestion, 0);
  objc_storeStrong((id *)&self->_consumerSubTypeString, 0);
  objc_storeStrong((id *)&self->_clientModelIds, 0);
  objc_storeStrong((id *)&self->_clientModelCacheUpdateUUIDStrings, 0);
}

@end