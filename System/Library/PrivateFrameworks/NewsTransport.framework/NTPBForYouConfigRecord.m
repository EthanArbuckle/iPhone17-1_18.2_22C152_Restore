@interface NTPBForYouConfigRecord
+ (Class)editorialArticleListIDsType;
+ (Class)editorialSectionTagIDsType;
+ (Class)todayFeedTopStoriesArticleIDsType;
- (BOOL)hasBase;
- (BOOL)hasConfiguration;
- (BOOL)hasSpotlightArticleID;
- (BOOL)hasTodayFeedConfiguration;
- (BOOL)hasTrendingArticleListID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)editorialArticleListIDs;
- (NSMutableArray)editorialSectionTagIDs;
- (NSMutableArray)todayFeedTopStoriesArticleIDs;
- (NSString)configuration;
- (NSString)spotlightArticleID;
- (NSString)todayFeedConfiguration;
- (NSString)trendingArticleListID;
- (NTPBRecordBase)base;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)editorialArticleListIDsAtIndex:(unint64_t)a3;
- (id)editorialSectionTagIDsAtIndex:(unint64_t)a3;
- (id)todayFeedTopStoriesArticleIDsAtIndex:(unint64_t)a3;
- (unint64_t)editorialArticleListIDsCount;
- (unint64_t)editorialSectionTagIDsCount;
- (unint64_t)hash;
- (unint64_t)todayFeedTopStoriesArticleIDsCount;
- (void)addEditorialArticleListIDs:(id)a3;
- (void)addEditorialSectionTagIDs:(id)a3;
- (void)addTodayFeedTopStoriesArticleIDs:(id)a3;
- (void)clearEditorialArticleListIDs;
- (void)clearEditorialSectionTagIDs;
- (void)clearTodayFeedTopStoriesArticleIDs;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBase:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setEditorialArticleListIDs:(id)a3;
- (void)setEditorialSectionTagIDs:(id)a3;
- (void)setSpotlightArticleID:(id)a3;
- (void)setTodayFeedConfiguration:(id)a3;
- (void)setTodayFeedTopStoriesArticleIDs:(id)a3;
- (void)setTrendingArticleListID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBForYouConfigRecord

- (void)dealloc
{
  [(NTPBForYouConfigRecord *)self setBase:0];
  [(NTPBForYouConfigRecord *)self setConfiguration:0];
  [(NTPBForYouConfigRecord *)self setTrendingArticleListID:0];
  [(NTPBForYouConfigRecord *)self setEditorialArticleListIDs:0];
  [(NTPBForYouConfigRecord *)self setEditorialSectionTagIDs:0];
  [(NTPBForYouConfigRecord *)self setSpotlightArticleID:0];
  [(NTPBForYouConfigRecord *)self setTodayFeedTopStoriesArticleIDs:0];
  [(NTPBForYouConfigRecord *)self setTodayFeedConfiguration:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBForYouConfigRecord;
  [(NTPBForYouConfigRecord *)&v3 dealloc];
}

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (BOOL)hasConfiguration
{
  return self->_configuration != 0;
}

- (BOOL)hasTrendingArticleListID
{
  return self->_trendingArticleListID != 0;
}

- (void)clearEditorialArticleListIDs
{
}

- (void)addEditorialArticleListIDs:(id)a3
{
  editorialArticleListIDs = self->_editorialArticleListIDs;
  if (!editorialArticleListIDs)
  {
    editorialArticleListIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_editorialArticleListIDs = editorialArticleListIDs;
  }

  [(NSMutableArray *)editorialArticleListIDs addObject:a3];
}

- (unint64_t)editorialArticleListIDsCount
{
  return [(NSMutableArray *)self->_editorialArticleListIDs count];
}

- (id)editorialArticleListIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_editorialArticleListIDs objectAtIndex:a3];
}

+ (Class)editorialArticleListIDsType
{
  return (Class)objc_opt_class();
}

- (void)clearEditorialSectionTagIDs
{
}

- (void)addEditorialSectionTagIDs:(id)a3
{
  editorialSectionTagIDs = self->_editorialSectionTagIDs;
  if (!editorialSectionTagIDs)
  {
    editorialSectionTagIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_editorialSectionTagIDs = editorialSectionTagIDs;
  }

  [(NSMutableArray *)editorialSectionTagIDs addObject:a3];
}

- (unint64_t)editorialSectionTagIDsCount
{
  return [(NSMutableArray *)self->_editorialSectionTagIDs count];
}

- (id)editorialSectionTagIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_editorialSectionTagIDs objectAtIndex:a3];
}

+ (Class)editorialSectionTagIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSpotlightArticleID
{
  return self->_spotlightArticleID != 0;
}

- (void)clearTodayFeedTopStoriesArticleIDs
{
}

- (void)addTodayFeedTopStoriesArticleIDs:(id)a3
{
  todayFeedTopStoriesArticleIDs = self->_todayFeedTopStoriesArticleIDs;
  if (!todayFeedTopStoriesArticleIDs)
  {
    todayFeedTopStoriesArticleIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_todayFeedTopStoriesArticleIDs = todayFeedTopStoriesArticleIDs;
  }

  [(NSMutableArray *)todayFeedTopStoriesArticleIDs addObject:a3];
}

- (unint64_t)todayFeedTopStoriesArticleIDsCount
{
  return [(NSMutableArray *)self->_todayFeedTopStoriesArticleIDs count];
}

- (id)todayFeedTopStoriesArticleIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_todayFeedTopStoriesArticleIDs objectAtIndex:a3];
}

+ (Class)todayFeedTopStoriesArticleIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasTodayFeedConfiguration
{
  return self->_todayFeedConfiguration != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBForYouConfigRecord;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBForYouConfigRecord description](&v3, sel_description), -[NTPBForYouConfigRecord dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  base = self->_base;
  if (base) {
    objc_msgSend(v3, "setObject:forKey:", -[NTPBRecordBase dictionaryRepresentation](base, "dictionaryRepresentation"), @"base");
  }
  configuration = self->_configuration;
  if (configuration) {
    [v3 setObject:configuration forKey:@"configuration"];
  }
  trendingArticleListID = self->_trendingArticleListID;
  if (trendingArticleListID) {
    [v3 setObject:trendingArticleListID forKey:@"trendingArticleListID"];
  }
  editorialArticleListIDs = self->_editorialArticleListIDs;
  if (editorialArticleListIDs) {
    [v3 setObject:editorialArticleListIDs forKey:@"editorialArticleListIDs"];
  }
  editorialSectionTagIDs = self->_editorialSectionTagIDs;
  if (editorialSectionTagIDs) {
    [v3 setObject:editorialSectionTagIDs forKey:@"editorialSectionTagIDs"];
  }
  spotlightArticleID = self->_spotlightArticleID;
  if (spotlightArticleID) {
    [v3 setObject:spotlightArticleID forKey:@"spotlightArticleID"];
  }
  todayFeedTopStoriesArticleIDs = self->_todayFeedTopStoriesArticleIDs;
  if (todayFeedTopStoriesArticleIDs) {
    [v3 setObject:todayFeedTopStoriesArticleIDs forKey:@"todayFeedTopStoriesArticleIDs"];
  }
  todayFeedConfiguration = self->_todayFeedConfiguration;
  if (todayFeedConfiguration) {
    [v3 setObject:todayFeedConfiguration forKey:@"todayFeedConfiguration"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBForYouConfigRecordReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (self->_base) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_configuration) {
    PBDataWriterWriteStringField();
  }
  if (self->_trendingArticleListID) {
    PBDataWriterWriteStringField();
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  editorialArticleListIDs = self->_editorialArticleListIDs;
  uint64_t v5 = [(NSMutableArray *)editorialArticleListIDs countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(editorialArticleListIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v6 = [(NSMutableArray *)editorialArticleListIDs countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v6);
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  editorialSectionTagIDs = self->_editorialSectionTagIDs;
  uint64_t v10 = [(NSMutableArray *)editorialSectionTagIDs countByEnumeratingWithState:&v23 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(editorialSectionTagIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v11 = [(NSMutableArray *)editorialSectionTagIDs countByEnumeratingWithState:&v23 objects:v32 count:16];
    }
    while (v11);
  }
  if (self->_spotlightArticleID) {
    PBDataWriterWriteStringField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  todayFeedTopStoriesArticleIDs = self->_todayFeedTopStoriesArticleIDs;
  uint64_t v15 = [(NSMutableArray *)todayFeedTopStoriesArticleIDs countByEnumeratingWithState:&v19 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      for (uint64_t k = 0; k != v16; ++k)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(todayFeedTopStoriesArticleIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v16 = [(NSMutableArray *)todayFeedTopStoriesArticleIDs countByEnumeratingWithState:&v19 objects:v31 count:16];
    }
    while (v16);
  }
  if (self->_todayFeedConfiguration) {
    PBDataWriterWriteStringField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[1] = [(NTPBRecordBase *)self->_base copyWithZone:a3];
  v5[2] = (id)[(NSString *)self->_configuration copyWithZone:a3];

  v5[8] = (id)[(NSString *)self->_trendingArticleListID copyWithZone:a3];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  editorialArticleListIDs = self->_editorialArticleListIDs;
  uint64_t v7 = [(NSMutableArray *)editorialArticleListIDs countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(editorialArticleListIDs);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v33 + 1) + 8 * i) copyWithZone:a3];
        [v5 addEditorialArticleListIDs:v11];
      }
      uint64_t v8 = [(NSMutableArray *)editorialArticleListIDs countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v8);
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  editorialSectionTagIDs = self->_editorialSectionTagIDs;
  uint64_t v13 = [(NSMutableArray *)editorialSectionTagIDs countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(editorialSectionTagIDs);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v29 + 1) + 8 * j) copyWithZone:a3];
        [v5 addEditorialSectionTagIDs:v17];
      }
      uint64_t v14 = [(NSMutableArray *)editorialSectionTagIDs countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v14);
  }

  v5[5] = (id)[(NSString *)self->_spotlightArticleID copyWithZone:a3];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  todayFeedTopStoriesArticleIDs = self->_todayFeedTopStoriesArticleIDs;
  uint64_t v19 = [(NSMutableArray *)todayFeedTopStoriesArticleIDs countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(todayFeedTopStoriesArticleIDs);
        }
        long long v23 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * k) copyWithZone:a3];
        [v5 addTodayFeedTopStoriesArticleIDs:v23];
      }
      uint64_t v20 = [(NSMutableArray *)todayFeedTopStoriesArticleIDs countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v20);
  }

  v5[6] = (id)[(NSString *)self->_todayFeedConfiguration copyWithZone:a3];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    base = self->_base;
    if (!((unint64_t)base | *((void *)a3 + 1)) || (int v5 = -[NTPBRecordBase isEqual:](base, "isEqual:")) != 0)
    {
      configuration = self->_configuration;
      if (!((unint64_t)configuration | *((void *)a3 + 2))
        || (int v5 = -[NSString isEqual:](configuration, "isEqual:")) != 0)
      {
        trendingArticleListID = self->_trendingArticleListID;
        if (!((unint64_t)trendingArticleListID | *((void *)a3 + 8))
          || (int v5 = -[NSString isEqual:](trendingArticleListID, "isEqual:")) != 0)
        {
          editorialArticleListIDs = self->_editorialArticleListIDs;
          if (!((unint64_t)editorialArticleListIDs | *((void *)a3 + 3))
            || (int v5 = -[NSMutableArray isEqual:](editorialArticleListIDs, "isEqual:")) != 0)
          {
            editorialSectionTagIDs = self->_editorialSectionTagIDs;
            if (!((unint64_t)editorialSectionTagIDs | *((void *)a3 + 4))
              || (int v5 = -[NSMutableArray isEqual:](editorialSectionTagIDs, "isEqual:")) != 0)
            {
              spotlightArticleID = self->_spotlightArticleID;
              if (!((unint64_t)spotlightArticleID | *((void *)a3 + 5))
                || (int v5 = -[NSString isEqual:](spotlightArticleID, "isEqual:")) != 0)
              {
                todayFeedTopStoriesArticleIDs = self->_todayFeedTopStoriesArticleIDs;
                if (!((unint64_t)todayFeedTopStoriesArticleIDs | *((void *)a3 + 7))
                  || (int v5 = -[NSMutableArray isEqual:](todayFeedTopStoriesArticleIDs, "isEqual:")) != 0)
                {
                  todayFeedConfiguration = self->_todayFeedConfiguration;
                  if ((unint64_t)todayFeedConfiguration | *((void *)a3 + 6))
                  {
                    LOBYTE(v5) = -[NSString isEqual:](todayFeedConfiguration, "isEqual:");
                  }
                  else
                  {
                    LOBYTE(v5) = 1;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NTPBRecordBase *)self->_base hash];
  NSUInteger v4 = [(NSString *)self->_configuration hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_trendingArticleListID hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_editorialArticleListIDs hash];
  uint64_t v7 = [(NSMutableArray *)self->_editorialSectionTagIDs hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_spotlightArticleID hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSMutableArray *)self->_todayFeedTopStoriesArticleIDs hash];
  return v9 ^ [(NSString *)self->_todayFeedConfiguration hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  base = self->_base;
  uint64_t v6 = *((void *)a3 + 1);
  if (base)
  {
    if (v6) {
      -[NTPBRecordBase mergeFrom:](base, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBForYouConfigRecord setBase:](self, "setBase:");
  }
  if (*((void *)a3 + 2)) {
    -[NTPBForYouConfigRecord setConfiguration:](self, "setConfiguration:");
  }
  if (*((void *)a3 + 8)) {
    -[NTPBForYouConfigRecord setTrendingArticleListID:](self, "setTrendingArticleListID:");
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v7 = (void *)*((void *)a3 + 3);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v7);
        }
        [(NTPBForYouConfigRecord *)self addEditorialArticleListIDs:*(void *)(*((void *)&v30 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v9);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v12 = (void *)*((void *)a3 + 4);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        [(NTPBForYouConfigRecord *)self addEditorialSectionTagIDs:*(void *)(*((void *)&v26 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v14);
  }
  if (*((void *)a3 + 5)) {
    -[NTPBForYouConfigRecord setSpotlightArticleID:](self, "setSpotlightArticleID:");
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v17 = (void *)*((void *)a3 + 7);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v23;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(v17);
        }
        [(NTPBForYouConfigRecord *)self addTodayFeedTopStoriesArticleIDs:*(void *)(*((void *)&v22 + 1) + 8 * k)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v19);
  }
  if (*((void *)a3 + 6)) {
    -[NTPBForYouConfigRecord setTodayFeedConfiguration:](self, "setTodayFeedConfiguration:");
  }
}

- (NTPBRecordBase)base
{
  return self->_base;
}

- (void)setBase:(id)a3
{
}

- (NSString)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (NSString)trendingArticleListID
{
  return self->_trendingArticleListID;
}

- (void)setTrendingArticleListID:(id)a3
{
}

- (NSMutableArray)editorialArticleListIDs
{
  return self->_editorialArticleListIDs;
}

- (void)setEditorialArticleListIDs:(id)a3
{
}

- (NSMutableArray)editorialSectionTagIDs
{
  return self->_editorialSectionTagIDs;
}

- (void)setEditorialSectionTagIDs:(id)a3
{
}

- (NSString)spotlightArticleID
{
  return self->_spotlightArticleID;
}

- (void)setSpotlightArticleID:(id)a3
{
}

- (NSMutableArray)todayFeedTopStoriesArticleIDs
{
  return self->_todayFeedTopStoriesArticleIDs;
}

- (void)setTodayFeedTopStoriesArticleIDs:(id)a3
{
}

- (NSString)todayFeedConfiguration
{
  return self->_todayFeedConfiguration;
}

- (void)setTodayFeedConfiguration:(id)a3
{
}

@end