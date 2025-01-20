@interface NTPBAudioConfigRecord
+ (Class)heroArticleIDsType;
- (BOOL)hasBase;
- (BOOL)hasConfiguration;
- (BOOL)hasCuratedArticleIDs;
- (BOOL)hasDailyBriefingArticleID;
- (BOOL)hasFeaturedAudioArticleListID;
- (BOOL)hasFeedConfiguration;
- (BOOL)hasLatestAudioArticleListID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)heroArticleIDs;
- (NSString)configuration;
- (NSString)curatedArticleIDs;
- (NSString)dailyBriefingArticleID;
- (NSString)featuredAudioArticleListID;
- (NSString)feedConfiguration;
- (NSString)latestAudioArticleListID;
- (NTPBRecordBase)base;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)heroArticleIDsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)heroArticleIDsCount;
- (void)addHeroArticleIDs:(id)a3;
- (void)clearHeroArticleIDs;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBase:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setCuratedArticleIDs:(id)a3;
- (void)setDailyBriefingArticleID:(id)a3;
- (void)setFeaturedAudioArticleListID:(id)a3;
- (void)setFeedConfiguration:(id)a3;
- (void)setHeroArticleIDs:(id)a3;
- (void)setLatestAudioArticleListID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBAudioConfigRecord

- (void)dealloc
{
  [(NTPBAudioConfigRecord *)self setBase:0];
  [(NTPBAudioConfigRecord *)self setConfiguration:0];
  [(NTPBAudioConfigRecord *)self setDailyBriefingArticleID:0];
  [(NTPBAudioConfigRecord *)self setFeaturedAudioArticleListID:0];
  [(NTPBAudioConfigRecord *)self setHeroArticleIDs:0];
  [(NTPBAudioConfigRecord *)self setLatestAudioArticleListID:0];
  [(NTPBAudioConfigRecord *)self setFeedConfiguration:0];
  [(NTPBAudioConfigRecord *)self setCuratedArticleIDs:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBAudioConfigRecord;
  [(NTPBAudioConfigRecord *)&v3 dealloc];
}

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (BOOL)hasConfiguration
{
  return self->_configuration != 0;
}

- (BOOL)hasDailyBriefingArticleID
{
  return self->_dailyBriefingArticleID != 0;
}

- (BOOL)hasFeaturedAudioArticleListID
{
  return self->_featuredAudioArticleListID != 0;
}

- (void)clearHeroArticleIDs
{
}

- (void)addHeroArticleIDs:(id)a3
{
  heroArticleIDs = self->_heroArticleIDs;
  if (!heroArticleIDs)
  {
    heroArticleIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_heroArticleIDs = heroArticleIDs;
  }

  [(NSMutableArray *)heroArticleIDs addObject:a3];
}

- (unint64_t)heroArticleIDsCount
{
  return [(NSMutableArray *)self->_heroArticleIDs count];
}

- (id)heroArticleIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_heroArticleIDs objectAtIndex:a3];
}

+ (Class)heroArticleIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasLatestAudioArticleListID
{
  return self->_latestAudioArticleListID != 0;
}

- (BOOL)hasFeedConfiguration
{
  return self->_feedConfiguration != 0;
}

- (BOOL)hasCuratedArticleIDs
{
  return self->_curatedArticleIDs != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBAudioConfigRecord;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBAudioConfigRecord description](&v3, sel_description), -[NTPBAudioConfigRecord dictionaryRepresentation](self, "dictionaryRepresentation")];
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
  dailyBriefingArticleID = self->_dailyBriefingArticleID;
  if (dailyBriefingArticleID) {
    [v3 setObject:dailyBriefingArticleID forKey:@"dailyBriefingArticleID"];
  }
  featuredAudioArticleListID = self->_featuredAudioArticleListID;
  if (featuredAudioArticleListID) {
    [v3 setObject:featuredAudioArticleListID forKey:@"featuredAudioArticleListID"];
  }
  heroArticleIDs = self->_heroArticleIDs;
  if (heroArticleIDs) {
    [v3 setObject:heroArticleIDs forKey:@"heroArticleIDs"];
  }
  latestAudioArticleListID = self->_latestAudioArticleListID;
  if (latestAudioArticleListID) {
    [v3 setObject:latestAudioArticleListID forKey:@"latestAudioArticleListID"];
  }
  feedConfiguration = self->_feedConfiguration;
  if (feedConfiguration) {
    [v3 setObject:feedConfiguration forKey:@"feedConfiguration"];
  }
  curatedArticleIDs = self->_curatedArticleIDs;
  if (curatedArticleIDs) {
    [v3 setObject:curatedArticleIDs forKey:@"curatedArticleIDs"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAudioConfigRecordReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_base) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_configuration) {
    PBDataWriterWriteStringField();
  }
  if (self->_dailyBriefingArticleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_featuredAudioArticleListID) {
    PBDataWriterWriteStringField();
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  heroArticleIDs = self->_heroArticleIDs;
  uint64_t v5 = [(NSMutableArray *)heroArticleIDs countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(heroArticleIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v6 = [(NSMutableArray *)heroArticleIDs countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
  if (self->_latestAudioArticleListID) {
    PBDataWriterWriteStringField();
  }
  if (self->_feedConfiguration) {
    PBDataWriterWriteStringField();
  }
  if (self->_curatedArticleIDs) {
    PBDataWriterWriteStringField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[1] = [(NTPBRecordBase *)self->_base copyWithZone:a3];
  v5[2] = (id)[(NSString *)self->_configuration copyWithZone:a3];

  v5[4] = (id)[(NSString *)self->_dailyBriefingArticleID copyWithZone:a3];
  v5[5] = (id)[(NSString *)self->_featuredAudioArticleListID copyWithZone:a3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  heroArticleIDs = self->_heroArticleIDs;
  uint64_t v7 = [(NSMutableArray *)heroArticleIDs countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(heroArticleIDs);
        }
        long long v11 = (void *)[*(id *)(*((void *)&v13 + 1) + 8 * i) copyWithZone:a3];
        [v5 addHeroArticleIDs:v11];
      }
      uint64_t v8 = [(NSMutableArray *)heroArticleIDs countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  v5[8] = (id)[(NSString *)self->_latestAudioArticleListID copyWithZone:a3];
  v5[6] = (id)[(NSString *)self->_feedConfiguration copyWithZone:a3];

  v5[3] = (id)[(NSString *)self->_curatedArticleIDs copyWithZone:a3];
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
        dailyBriefingArticleID = self->_dailyBriefingArticleID;
        if (!((unint64_t)dailyBriefingArticleID | *((void *)a3 + 4))
          || (int v5 = -[NSString isEqual:](dailyBriefingArticleID, "isEqual:")) != 0)
        {
          featuredAudioArticleListID = self->_featuredAudioArticleListID;
          if (!((unint64_t)featuredAudioArticleListID | *((void *)a3 + 5))
            || (int v5 = -[NSString isEqual:](featuredAudioArticleListID, "isEqual:")) != 0)
          {
            heroArticleIDs = self->_heroArticleIDs;
            if (!((unint64_t)heroArticleIDs | *((void *)a3 + 7))
              || (int v5 = -[NSMutableArray isEqual:](heroArticleIDs, "isEqual:")) != 0)
            {
              latestAudioArticleListID = self->_latestAudioArticleListID;
              if (!((unint64_t)latestAudioArticleListID | *((void *)a3 + 8))
                || (int v5 = -[NSString isEqual:](latestAudioArticleListID, "isEqual:")) != 0)
              {
                feedConfiguration = self->_feedConfiguration;
                if (!((unint64_t)feedConfiguration | *((void *)a3 + 6))
                  || (int v5 = -[NSString isEqual:](feedConfiguration, "isEqual:")) != 0)
                {
                  curatedArticleIDs = self->_curatedArticleIDs;
                  if ((unint64_t)curatedArticleIDs | *((void *)a3 + 3))
                  {
                    LOBYTE(v5) = -[NSString isEqual:](curatedArticleIDs, "isEqual:");
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
  NSUInteger v5 = [(NSString *)self->_dailyBriefingArticleID hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_featuredAudioArticleListID hash];
  uint64_t v7 = [(NSMutableArray *)self->_heroArticleIDs hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_latestAudioArticleListID hash];
  NSUInteger v9 = v6 ^ v8 ^ [(NSString *)self->_feedConfiguration hash];
  return v9 ^ [(NSString *)self->_curatedArticleIDs hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
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
    -[NTPBAudioConfigRecord setBase:](self, "setBase:");
  }
  if (*((void *)a3 + 2)) {
    -[NTPBAudioConfigRecord setConfiguration:](self, "setConfiguration:");
  }
  if (*((void *)a3 + 4)) {
    -[NTPBAudioConfigRecord setDailyBriefingArticleID:](self, "setDailyBriefingArticleID:");
  }
  if (*((void *)a3 + 5)) {
    -[NTPBAudioConfigRecord setFeaturedAudioArticleListID:](self, "setFeaturedAudioArticleListID:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = (void *)*((void *)a3 + 7);
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
        [(NTPBAudioConfigRecord *)self addHeroArticleIDs:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
  if (*((void *)a3 + 8)) {
    -[NTPBAudioConfigRecord setLatestAudioArticleListID:](self, "setLatestAudioArticleListID:");
  }
  if (*((void *)a3 + 6)) {
    -[NTPBAudioConfigRecord setFeedConfiguration:](self, "setFeedConfiguration:");
  }
  if (*((void *)a3 + 3)) {
    -[NTPBAudioConfigRecord setCuratedArticleIDs:](self, "setCuratedArticleIDs:");
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

- (NSString)dailyBriefingArticleID
{
  return self->_dailyBriefingArticleID;
}

- (void)setDailyBriefingArticleID:(id)a3
{
}

- (NSString)featuredAudioArticleListID
{
  return self->_featuredAudioArticleListID;
}

- (void)setFeaturedAudioArticleListID:(id)a3
{
}

- (NSMutableArray)heroArticleIDs
{
  return self->_heroArticleIDs;
}

- (void)setHeroArticleIDs:(id)a3
{
}

- (NSString)latestAudioArticleListID
{
  return self->_latestAudioArticleListID;
}

- (void)setLatestAudioArticleListID:(id)a3
{
}

- (NSString)feedConfiguration
{
  return self->_feedConfiguration;
}

- (void)setFeedConfiguration:(id)a3
{
}

- (NSString)curatedArticleIDs
{
  return self->_curatedArticleIDs;
}

- (void)setCuratedArticleIDs:(id)a3
{
}

@end