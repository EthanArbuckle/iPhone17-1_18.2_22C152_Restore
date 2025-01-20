@interface ATXPBSpotlightSuggestionLayout
+ (Class)collectionsType;
- (BOOL)hasUuidString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)collections;
- (NSString)uuidString;
- (double)scores;
- (double)scoresAtIndex:(unint64_t)a3;
- (id)collectionsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)collectionsCount;
- (unint64_t)hash;
- (unint64_t)scoresCount;
- (void)addCollections:(id)a3;
- (void)addScores:(double)a3;
- (void)clearCollections;
- (void)clearScores;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCollections:(id)a3;
- (void)setScores:(double *)a3 count:(unint64_t)a4;
- (void)setUuidString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBSpotlightSuggestionLayout

- (void)dealloc
{
  PBRepeatedDoubleClear();
  v3.receiver = self;
  v3.super_class = (Class)ATXPBSpotlightSuggestionLayout;
  [(ATXPBSpotlightSuggestionLayout *)&v3 dealloc];
}

- (BOOL)hasUuidString
{
  return self->_uuidString != 0;
}

- (void)clearCollections
{
}

- (void)addCollections:(id)a3
{
  id v4 = a3;
  collections = self->_collections;
  id v8 = v4;
  if (!collections)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_collections;
    self->_collections = v6;

    id v4 = v8;
    collections = self->_collections;
  }
  [(NSMutableArray *)collections addObject:v4];
}

- (unint64_t)collectionsCount
{
  return [(NSMutableArray *)self->_collections count];
}

- (id)collectionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_collections objectAtIndex:a3];
}

+ (Class)collectionsType
{
  return (Class)objc_opt_class();
}

- (unint64_t)scoresCount
{
  return self->_scores.count;
}

- (double)scores
{
  return self->_scores.list;
}

- (void)clearScores
{
}

- (void)addScores:(double)a3
{
}

- (double)scoresAtIndex:(unint64_t)a3
{
  p_scores = &self->_scores;
  unint64_t count = self->_scores.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_scores->list[a3];
}

- (void)setScores:(double *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBSpotlightSuggestionLayout;
  id v4 = [(ATXPBSpotlightSuggestionLayout *)&v8 description];
  v5 = [(ATXPBSpotlightSuggestionLayout *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  uuidString = self->_uuidString;
  if (uuidString) {
    [v3 setObject:uuidString forKey:@"uuidString"];
  }
  if ([(NSMutableArray *)self->_collections count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_collections, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v7 = self->_collections;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKey:@"collections"];
  }
  v13 = PBRepeatedDoubleNSArray();
  [v4 setObject:v13 forKey:@"scores"];

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBSpotlightSuggestionLayoutReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_uuidString) {
    PBDataWriterWriteStringField();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_collections;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  p_scores = &self->_scores;
  if (p_scores->count)
  {
    unint64_t v11 = 0;
    do
    {
      PBDataWriterWriteDoubleField();
      ++v11;
    }
    while (v11 < p_scores->count);
  }
}

- (void)copyTo:(id)a3
{
  id v11 = a3;
  if (self->_uuidString) {
    objc_msgSend(v11, "setUuidString:");
  }
  if ([(ATXPBSpotlightSuggestionLayout *)self collectionsCount])
  {
    [v11 clearCollections];
    unint64_t v4 = [(ATXPBSpotlightSuggestionLayout *)self collectionsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(ATXPBSpotlightSuggestionLayout *)self collectionsAtIndex:i];
        [v11 addCollections:v7];
      }
    }
  }
  if ([(ATXPBSpotlightSuggestionLayout *)self scoresCount])
  {
    [v11 clearScores];
    unint64_t v8 = [(ATXPBSpotlightSuggestionLayout *)self scoresCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        [(ATXPBSpotlightSuggestionLayout *)self scoresAtIndex:j];
        objc_msgSend(v11, "addScores:");
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uuidString copyWithZone:a3];
  uint64_t v7 = (void *)v5[5];
  v5[5] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v8 = self->_collections;
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
        [v5 addCollections:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  PBRepeatedDoubleCopy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((uuidString = self->_uuidString, !((unint64_t)uuidString | v4[5]))
     || -[NSString isEqual:](uuidString, "isEqual:"))
    && ((collections = self->_collections, !((unint64_t)collections | v4[4]))
     || -[NSMutableArray isEqual:](collections, "isEqual:")))
  {
    char IsEqual = PBRepeatedDoubleIsEqual();
  }
  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uuidString hash];
  uint64_t v4 = [(NSMutableArray *)self->_collections hash] ^ v3;
  return v4 ^ PBRepeatedDoubleHash();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 5)) {
    -[ATXPBSpotlightSuggestionLayout setUuidString:](self, "setUuidString:");
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = *((id *)v4 + 4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        -[ATXPBSpotlightSuggestionLayout addCollections:](self, "addCollections:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [v4 scoresCount];
  if (v10)
  {
    uint64_t v11 = v10;
    for (uint64_t j = 0; j != v11; ++j)
    {
      objc_msgSend(v4, "scoresAtIndex:", j, (void)v13);
      -[ATXPBSpotlightSuggestionLayout addScores:](self, "addScores:");
    }
  }
}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (void)setUuidString:(id)a3
{
}

- (NSMutableArray)collections
{
  return self->_collections;
}

- (void)setCollections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->_collections, 0);
}

@end