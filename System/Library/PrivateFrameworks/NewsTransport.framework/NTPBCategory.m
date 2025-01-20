@interface NTPBCategory
+ (Class)categoryHierarchyType;
+ (Class)curatedTagIdsType;
+ (Class)recommendedChannelsType;
+ (Class)recommendedTopicsType;
- (BOOL)hasEntityId;
- (BOOL)hasName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)categoryHierarchys;
- (NSMutableArray)curatedTagIds;
- (NSMutableArray)recommendedChannels;
- (NSMutableArray)recommendedTopics;
- (NSString)entityId;
- (NSString)name;
- (id)categoryHierarchyAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)curatedTagIdsAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)recommendedChannelsAtIndex:(unint64_t)a3;
- (id)recommendedTopicsAtIndex:(unint64_t)a3;
- (unint64_t)categoryHierarchysCount;
- (unint64_t)curatedTagIdsCount;
- (unint64_t)hash;
- (unint64_t)recommendedChannelsCount;
- (unint64_t)recommendedTopicsCount;
- (void)addCategoryHierarchy:(id)a3;
- (void)addCuratedTagIds:(id)a3;
- (void)addRecommendedChannels:(id)a3;
- (void)addRecommendedTopics:(id)a3;
- (void)clearCategoryHierarchys;
- (void)clearCuratedTagIds;
- (void)clearRecommendedChannels;
- (void)clearRecommendedTopics;
- (void)mergeFrom:(id)a3;
- (void)setCategoryHierarchys:(id)a3;
- (void)setCuratedTagIds:(id)a3;
- (void)setEntityId:(id)a3;
- (void)setName:(id)a3;
- (void)setRecommendedChannels:(id)a3;
- (void)setRecommendedTopics:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBCategory

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasEntityId
{
  return self->_entityId != 0;
}

- (void)clearRecommendedTopics
{
}

- (void)addRecommendedTopics:(id)a3
{
  id v4 = a3;
  recommendedTopics = self->_recommendedTopics;
  id v8 = v4;
  if (!recommendedTopics)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_recommendedTopics;
    self->_recommendedTopics = v6;

    id v4 = v8;
    recommendedTopics = self->_recommendedTopics;
  }
  [(NSMutableArray *)recommendedTopics addObject:v4];
}

- (unint64_t)recommendedTopicsCount
{
  return [(NSMutableArray *)self->_recommendedTopics count];
}

- (id)recommendedTopicsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_recommendedTopics objectAtIndex:a3];
}

+ (Class)recommendedTopicsType
{
  return (Class)objc_opt_class();
}

- (void)clearRecommendedChannels
{
}

- (void)addRecommendedChannels:(id)a3
{
  id v4 = a3;
  recommendedChannels = self->_recommendedChannels;
  id v8 = v4;
  if (!recommendedChannels)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_recommendedChannels;
    self->_recommendedChannels = v6;

    id v4 = v8;
    recommendedChannels = self->_recommendedChannels;
  }
  [(NSMutableArray *)recommendedChannels addObject:v4];
}

- (unint64_t)recommendedChannelsCount
{
  return [(NSMutableArray *)self->_recommendedChannels count];
}

- (id)recommendedChannelsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_recommendedChannels objectAtIndex:a3];
}

+ (Class)recommendedChannelsType
{
  return (Class)objc_opt_class();
}

- (void)clearCategoryHierarchys
{
}

- (void)addCategoryHierarchy:(id)a3
{
  id v4 = a3;
  categoryHierarchys = self->_categoryHierarchys;
  id v8 = v4;
  if (!categoryHierarchys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_categoryHierarchys;
    self->_categoryHierarchys = v6;

    id v4 = v8;
    categoryHierarchys = self->_categoryHierarchys;
  }
  [(NSMutableArray *)categoryHierarchys addObject:v4];
}

- (unint64_t)categoryHierarchysCount
{
  return [(NSMutableArray *)self->_categoryHierarchys count];
}

- (id)categoryHierarchyAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_categoryHierarchys objectAtIndex:a3];
}

+ (Class)categoryHierarchyType
{
  return (Class)objc_opt_class();
}

- (void)clearCuratedTagIds
{
}

- (void)addCuratedTagIds:(id)a3
{
  id v4 = a3;
  curatedTagIds = self->_curatedTagIds;
  id v8 = v4;
  if (!curatedTagIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_curatedTagIds;
    self->_curatedTagIds = v6;

    id v4 = v8;
    curatedTagIds = self->_curatedTagIds;
  }
  [(NSMutableArray *)curatedTagIds addObject:v4];
}

- (unint64_t)curatedTagIdsCount
{
  return [(NSMutableArray *)self->_curatedTagIds count];
}

- (id)curatedTagIdsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_curatedTagIds objectAtIndex:a3];
}

+ (Class)curatedTagIdsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBCategory;
  id v4 = [(NTPBCategory *)&v8 description];
  v5 = [(NTPBCategory *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  entityId = self->_entityId;
  if (entityId) {
    [v4 setObject:entityId forKey:@"entity_id"];
  }
  recommendedTopics = self->_recommendedTopics;
  if (recommendedTopics) {
    [v4 setObject:recommendedTopics forKey:@"recommended_topics"];
  }
  recommendedChannels = self->_recommendedChannels;
  if (recommendedChannels) {
    [v4 setObject:recommendedChannels forKey:@"recommended_channels"];
  }
  if ([(NSMutableArray *)self->_categoryHierarchys count])
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_categoryHierarchys, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v10 = self->_categoryHierarchys;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
          [v9 addObject:v15];
        }
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }

    [v4 setObject:v9 forKey:@"category_hierarchy"];
  }
  curatedTagIds = self->_curatedTagIds;
  if (curatedTagIds) {
    [v4 setObject:curatedTagIds forKey:@"curated_tag_ids"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBCategoryReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  if (self->_entityId) {
    PBDataWriterWriteStringField();
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v5 = self->_recommendedTopics;
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
        PBDataWriterWriteStringField();
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
  v10 = self->_recommendedChannels;
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
        PBDataWriterWriteStringField();
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
  v15 = self->_categoryHierarchys;
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
  long long v20 = self->_curatedTagIds;
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
        PBDataWriterWriteStringField();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v22);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  uint64_t v7 = (void *)v5[4];
  v5[4] = v6;

  uint64_t v8 = [(NSString *)self->_entityId copyWithZone:a3];
  uint64_t v9 = (void *)v5[3];
  v5[3] = v8;

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v10 = self->_recommendedTopics;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v47 objects:v54 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v48;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v48 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = (void *)[*(id *)(*((void *)&v47 + 1) + 8 * v14) copyWithZone:a3];
        [v5 addRecommendedTopics:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v47 objects:v54 count:16];
    }
    while (v12);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v16 = self->_recommendedChannels;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v44;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v44 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = (void *)[*(id *)(*((void *)&v43 + 1) + 8 * v20) copyWithZone:a3];
        [v5 addRecommendedChannels:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v43 objects:v53 count:16];
    }
    while (v18);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v22 = self->_categoryHierarchys;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v39 objects:v52 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v40;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v40 != v25) {
          objc_enumerationMutation(v22);
        }
        long long v27 = (void *)[*(id *)(*((void *)&v39 + 1) + 8 * v26) copyWithZone:a3];
        [v5 addCategoryHierarchy:v27];

        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v39 objects:v52 count:16];
    }
    while (v24);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v28 = self->_curatedTagIds;
  uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v35 objects:v51 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v36;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v36 != v31) {
          objc_enumerationMutation(v28);
        }
        long long v33 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * v32), "copyWithZone:", a3, (void)v35);
        [v5 addCuratedTagIds:v33];

        ++v32;
      }
      while (v30 != v32);
      uint64_t v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v35 objects:v51 count:16];
    }
    while (v30);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((name = self->_name, !((unint64_t)name | v4[4])) || -[NSString isEqual:](name, "isEqual:"))
    && ((entityId = self->_entityId, !((unint64_t)entityId | v4[3]))
     || -[NSString isEqual:](entityId, "isEqual:"))
    && ((recommendedTopics = self->_recommendedTopics, !((unint64_t)recommendedTopics | v4[6]))
     || -[NSMutableArray isEqual:](recommendedTopics, "isEqual:"))
    && ((recommendedChannels = self->_recommendedChannels, !((unint64_t)recommendedChannels | v4[5]))
     || -[NSMutableArray isEqual:](recommendedChannels, "isEqual:"))
    && ((categoryHierarchys = self->_categoryHierarchys, !((unint64_t)categoryHierarchys | v4[1]))
     || -[NSMutableArray isEqual:](categoryHierarchys, "isEqual:")))
  {
    curatedTagIds = self->_curatedTagIds;
    if ((unint64_t)curatedTagIds | v4[2]) {
      char v11 = -[NSMutableArray isEqual:](curatedTagIds, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_entityId hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_recommendedTopics hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_recommendedChannels hash];
  uint64_t v7 = [(NSMutableArray *)self->_categoryHierarchys hash];
  return v6 ^ v7 ^ [(NSMutableArray *)self->_curatedTagIds hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 4)) {
    -[NTPBCategory setName:](self, "setName:");
  }
  if (*((void *)v4 + 3)) {
    -[NTPBCategory setEntityId:](self, "setEntityId:");
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v5 = *((id *)v4 + 6);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NTPBCategory *)self addRecommendedTopics:*(void *)(*((void *)&v37 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v7);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = *((id *)v4 + 5);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        [(NTPBCategory *)self addRecommendedChannels:*(void *)(*((void *)&v33 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v12);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v15 = *((id *)v4 + 1);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        [(NTPBCategory *)self addCategoryHierarchy:*(void *)(*((void *)&v29 + 1) + 8 * k)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v17);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v20 = *((id *)v4 + 2);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      for (uint64_t m = 0; m != v22; ++m)
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        -[NTPBCategory addCuratedTagIds:](self, "addCuratedTagIds:", *(void *)(*((void *)&v25 + 1) + 8 * m), (void)v25);
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v22);
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)entityId
{
  return self->_entityId;
}

- (void)setEntityId:(id)a3
{
}

- (NSMutableArray)recommendedTopics
{
  return self->_recommendedTopics;
}

- (void)setRecommendedTopics:(id)a3
{
}

- (NSMutableArray)recommendedChannels
{
  return self->_recommendedChannels;
}

- (void)setRecommendedChannels:(id)a3
{
}

- (NSMutableArray)categoryHierarchys
{
  return self->_categoryHierarchys;
}

- (void)setCategoryHierarchys:(id)a3
{
}

- (NSMutableArray)curatedTagIds
{
  return self->_curatedTagIds;
}

- (void)setCuratedTagIds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendedTopics, 0);
  objc_storeStrong((id *)&self->_recommendedChannels, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_entityId, 0);
  objc_storeStrong((id *)&self->_curatedTagIds, 0);

  objc_storeStrong((id *)&self->_categoryHierarchys, 0);
}

@end