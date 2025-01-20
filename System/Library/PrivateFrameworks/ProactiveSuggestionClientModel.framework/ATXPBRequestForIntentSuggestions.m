@interface ATXPBRequestForIntentSuggestions
+ (Class)bundleIdsType;
+ (Class)intentClassNamesType;
- (ATXPBRequestForSuggestions)base;
- (BOOL)hasBase;
- (BOOL)hasLimit;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)bundleIds;
- (NSMutableArray)intentClassNames;
- (id)bundleIdsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)intentClassNamesAtIndex:(unint64_t)a3;
- (int)limit;
- (unint64_t)bundleIdsCount;
- (unint64_t)hash;
- (unint64_t)intentClassNamesCount;
- (void)addBundleIds:(id)a3;
- (void)addIntentClassNames:(id)a3;
- (void)clearBundleIds;
- (void)clearIntentClassNames;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBase:(id)a3;
- (void)setBundleIds:(id)a3;
- (void)setHasLimit:(BOOL)a3;
- (void)setIntentClassNames:(id)a3;
- (void)setLimit:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBRequestForIntentSuggestions

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (void)clearBundleIds
{
}

- (void)addBundleIds:(id)a3
{
  id v4 = a3;
  bundleIds = self->_bundleIds;
  id v8 = v4;
  if (!bundleIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_bundleIds;
    self->_bundleIds = v6;

    id v4 = v8;
    bundleIds = self->_bundleIds;
  }
  [(NSMutableArray *)bundleIds addObject:v4];
}

- (unint64_t)bundleIdsCount
{
  return [(NSMutableArray *)self->_bundleIds count];
}

- (id)bundleIdsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_bundleIds objectAtIndex:a3];
}

+ (Class)bundleIdsType
{
  return (Class)objc_opt_class();
}

- (void)clearIntentClassNames
{
}

- (void)addIntentClassNames:(id)a3
{
  id v4 = a3;
  intentClassNames = self->_intentClassNames;
  id v8 = v4;
  if (!intentClassNames)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_intentClassNames;
    self->_intentClassNames = v6;

    id v4 = v8;
    intentClassNames = self->_intentClassNames;
  }
  [(NSMutableArray *)intentClassNames addObject:v4];
}

- (unint64_t)intentClassNamesCount
{
  return [(NSMutableArray *)self->_intentClassNames count];
}

- (id)intentClassNamesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_intentClassNames objectAtIndex:a3];
}

+ (Class)intentClassNamesType
{
  return (Class)objc_opt_class();
}

- (void)setLimit:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_limit = a3;
}

- (void)setHasLimit:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLimit
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBRequestForIntentSuggestions;
  id v4 = [(ATXPBRequestForIntentSuggestions *)&v8 description];
  v5 = [(ATXPBRequestForIntentSuggestions *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  base = self->_base;
  if (base)
  {
    v5 = [(ATXPBRequestForSuggestions *)base dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"base"];
  }
  bundleIds = self->_bundleIds;
  if (bundleIds) {
    [v3 setObject:bundleIds forKey:@"bundleIds"];
  }
  intentClassNames = self->_intentClassNames;
  if (intentClassNames) {
    [v3 setObject:intentClassNames forKey:@"intentClassNames"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithInt:self->_limit];
    [v3 setObject:v8 forKey:@"limit"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBRequestForIntentSuggestionsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_base) {
    PBDataWriterWriteSubmessage();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_bundleIds;
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
  v10 = self->_intentClassNames;
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

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if (self->_base) {
    objc_msgSend(v12, "setBase:");
  }
  if ([(ATXPBRequestForIntentSuggestions *)self bundleIdsCount])
  {
    [v12 clearBundleIds];
    unint64_t v4 = [(ATXPBRequestForIntentSuggestions *)self bundleIdsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(ATXPBRequestForIntentSuggestions *)self bundleIdsAtIndex:i];
        [v12 addBundleIds:v7];
      }
    }
  }
  if ([(ATXPBRequestForIntentSuggestions *)self intentClassNamesCount])
  {
    [v12 clearIntentClassNames];
    unint64_t v8 = [(ATXPBRequestForIntentSuggestions *)self intentClassNamesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(ATXPBRequestForIntentSuggestions *)self intentClassNamesAtIndex:j];
        [v12 addIntentClassNames:v11];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v12 + 8) = self->_limit;
    *((unsigned char *)v12 + 36) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(ATXPBRequestForSuggestions *)self->_base copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  unint64_t v8 = self->_bundleIds;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * v12) copyWithZone:a3];
        [(id)v5 addBundleIds:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v14 = self->_intentClassNames;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v18), "copyWithZone:", a3, (void)v21);
        [(id)v5 addIntentClassNames:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 32) = self->_limit;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  base = self->_base;
  if ((unint64_t)base | *((void *)v4 + 1))
  {
    if (!-[ATXPBRequestForSuggestions isEqual:](base, "isEqual:")) {
      goto LABEL_12;
    }
  }
  bundleIds = self->_bundleIds;
  if ((unint64_t)bundleIds | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](bundleIds, "isEqual:")) {
      goto LABEL_12;
    }
  }
  intentClassNames = self->_intentClassNames;
  if ((unint64_t)intentClassNames | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](intentClassNames, "isEqual:")) {
      goto LABEL_12;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) != 0 && self->_limit == *((_DWORD *)v4 + 8))
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
  unint64_t v3 = [(ATXPBRequestForSuggestions *)self->_base hash];
  uint64_t v4 = [(NSMutableArray *)self->_bundleIds hash];
  uint64_t v5 = [(NSMutableArray *)self->_intentClassNames hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_limit;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  base = self->_base;
  uint64_t v6 = *((void *)v4 + 1);
  if (base)
  {
    if (v6) {
      -[ATXPBRequestForSuggestions mergeFrom:](base, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[ATXPBRequestForIntentSuggestions setBase:](self, "setBase:");
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = *((id *)v4 + 2);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        [(ATXPBRequestForIntentSuggestions *)self addBundleIds:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = *((id *)v4 + 3);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[ATXPBRequestForIntentSuggestions addIntentClassNames:](self, "addIntentClassNames:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }

  if (*((unsigned char *)v4 + 36))
  {
    self->_limit = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (ATXPBRequestForSuggestions)base
{
  return self->_base;
}

- (void)setBase:(id)a3
{
}

- (NSMutableArray)bundleIds
{
  return self->_bundleIds;
}

- (void)setBundleIds:(id)a3
{
}

- (NSMutableArray)intentClassNames
{
  return self->_intentClassNames;
}

- (void)setIntentClassNames:(id)a3
{
}

- (int)limit
{
  return self->_limit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentClassNames, 0);
  objc_storeStrong((id *)&self->_bundleIds, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end