@interface NTPBSportsEventRecord
+ (Class)allowedStorefrontIDsType;
+ (Class)blockedStorefrontIDsType;
+ (Class)eventCompetitorTagIDsType;
- (BOOL)hasBase;
- (BOOL)hasEventArticleListID;
- (BOOL)hasEventLeagueTagID;
- (BOOL)hasHighlightsArticleListID;
- (BOOL)hasIsDeprecated;
- (BOOL)hasMinimumNewsVersion;
- (BOOL)hasSportsData;
- (BOOL)hasSportsTheme;
- (BOOL)hasSuperfeedConfigResourceID;
- (BOOL)isDeprecated;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)allowedStorefrontIDs;
- (NSMutableArray)blockedStorefrontIDs;
- (NSMutableArray)eventCompetitorTagIDs;
- (NSString)eventArticleListID;
- (NSString)eventLeagueTagID;
- (NSString)highlightsArticleListID;
- (NSString)sportsData;
- (NSString)sportsTheme;
- (NSString)superfeedConfigResourceID;
- (NTPBRecordBase)base;
- (id)allowedStorefrontIDsAtIndex:(unint64_t)a3;
- (id)blockedStorefrontIDsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)eventCompetitorTagIDsAtIndex:(unint64_t)a3;
- (int64_t)minimumNewsVersion;
- (unint64_t)allowedStorefrontIDsCount;
- (unint64_t)blockedStorefrontIDsCount;
- (unint64_t)eventCompetitorTagIDsCount;
- (unint64_t)hash;
- (void)addAllowedStorefrontIDs:(id)a3;
- (void)addBlockedStorefrontIDs:(id)a3;
- (void)addEventCompetitorTagIDs:(id)a3;
- (void)clearAllowedStorefrontIDs;
- (void)clearBlockedStorefrontIDs;
- (void)clearEventCompetitorTagIDs;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAllowedStorefrontIDs:(id)a3;
- (void)setBase:(id)a3;
- (void)setBlockedStorefrontIDs:(id)a3;
- (void)setEventArticleListID:(id)a3;
- (void)setEventCompetitorTagIDs:(id)a3;
- (void)setEventLeagueTagID:(id)a3;
- (void)setHasIsDeprecated:(BOOL)a3;
- (void)setHasMinimumNewsVersion:(BOOL)a3;
- (void)setHighlightsArticleListID:(id)a3;
- (void)setIsDeprecated:(BOOL)a3;
- (void)setMinimumNewsVersion:(int64_t)a3;
- (void)setSportsData:(id)a3;
- (void)setSportsTheme:(id)a3;
- (void)setSuperfeedConfigResourceID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBSportsEventRecord

- (void)dealloc
{
  [(NTPBSportsEventRecord *)self setBase:0];
  [(NTPBSportsEventRecord *)self setSuperfeedConfigResourceID:0];
  [(NTPBSportsEventRecord *)self setEventCompetitorTagIDs:0];
  [(NTPBSportsEventRecord *)self setHighlightsArticleListID:0];
  [(NTPBSportsEventRecord *)self setEventArticleListID:0];
  [(NTPBSportsEventRecord *)self setSportsData:0];
  [(NTPBSportsEventRecord *)self setSportsTheme:0];
  [(NTPBSportsEventRecord *)self setEventLeagueTagID:0];
  [(NTPBSportsEventRecord *)self setBlockedStorefrontIDs:0];
  [(NTPBSportsEventRecord *)self setAllowedStorefrontIDs:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBSportsEventRecord;
  [(NTPBSportsEventRecord *)&v3 dealloc];
}

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (void)setMinimumNewsVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_minimumNewsVersion = a3;
}

- (void)setHasMinimumNewsVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMinimumNewsVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasSuperfeedConfigResourceID
{
  return self->_superfeedConfigResourceID != 0;
}

- (void)clearEventCompetitorTagIDs
{
}

- (void)addEventCompetitorTagIDs:(id)a3
{
  eventCompetitorTagIDs = self->_eventCompetitorTagIDs;
  if (!eventCompetitorTagIDs)
  {
    eventCompetitorTagIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_eventCompetitorTagIDs = eventCompetitorTagIDs;
  }

  [(NSMutableArray *)eventCompetitorTagIDs addObject:a3];
}

- (unint64_t)eventCompetitorTagIDsCount
{
  return [(NSMutableArray *)self->_eventCompetitorTagIDs count];
}

- (id)eventCompetitorTagIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_eventCompetitorTagIDs objectAtIndex:a3];
}

+ (Class)eventCompetitorTagIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasHighlightsArticleListID
{
  return self->_highlightsArticleListID != 0;
}

- (BOOL)hasEventArticleListID
{
  return self->_eventArticleListID != 0;
}

- (BOOL)hasSportsData
{
  return self->_sportsData != 0;
}

- (BOOL)hasSportsTheme
{
  return self->_sportsTheme != 0;
}

- (BOOL)hasEventLeagueTagID
{
  return self->_eventLeagueTagID != 0;
}

- (void)setIsDeprecated:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isDeprecated = a3;
}

- (void)setHasIsDeprecated:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsDeprecated
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearBlockedStorefrontIDs
{
}

- (void)addBlockedStorefrontIDs:(id)a3
{
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  if (!blockedStorefrontIDs)
  {
    blockedStorefrontIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_blockedStorefrontIDs = blockedStorefrontIDs;
  }

  [(NSMutableArray *)blockedStorefrontIDs addObject:a3];
}

- (unint64_t)blockedStorefrontIDsCount
{
  return [(NSMutableArray *)self->_blockedStorefrontIDs count];
}

- (id)blockedStorefrontIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_blockedStorefrontIDs objectAtIndex:a3];
}

+ (Class)blockedStorefrontIDsType
{
  return (Class)objc_opt_class();
}

- (void)clearAllowedStorefrontIDs
{
}

- (void)addAllowedStorefrontIDs:(id)a3
{
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  if (!allowedStorefrontIDs)
  {
    allowedStorefrontIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_allowedStorefrontIDs = allowedStorefrontIDs;
  }

  [(NSMutableArray *)allowedStorefrontIDs addObject:a3];
}

- (unint64_t)allowedStorefrontIDsCount
{
  return [(NSMutableArray *)self->_allowedStorefrontIDs count];
}

- (id)allowedStorefrontIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_allowedStorefrontIDs objectAtIndex:a3];
}

+ (Class)allowedStorefrontIDsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBSportsEventRecord;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBSportsEventRecord description](&v3, sel_description), -[NTPBSportsEventRecord dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  base = self->_base;
  if (base) {
    objc_msgSend(v3, "setObject:forKey:", -[NTPBRecordBase dictionaryRepresentation](base, "dictionaryRepresentation"), @"base");
  }
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_minimumNewsVersion), @"minimum_news_version");
  }
  superfeedConfigResourceID = self->_superfeedConfigResourceID;
  if (superfeedConfigResourceID) {
    [v3 setObject:superfeedConfigResourceID forKey:@"superfeed_config_resource_ID"];
  }
  eventCompetitorTagIDs = self->_eventCompetitorTagIDs;
  if (eventCompetitorTagIDs) {
    [v3 setObject:eventCompetitorTagIDs forKey:@"event_competitor_tag_IDs"];
  }
  highlightsArticleListID = self->_highlightsArticleListID;
  if (highlightsArticleListID) {
    [v3 setObject:highlightsArticleListID forKey:@"highlights_article_list_ID"];
  }
  eventArticleListID = self->_eventArticleListID;
  if (eventArticleListID) {
    [v3 setObject:eventArticleListID forKey:@"event_article_list_ID"];
  }
  sportsData = self->_sportsData;
  if (sportsData) {
    [v3 setObject:sportsData forKey:@"sports_data"];
  }
  sportsTheme = self->_sportsTheme;
  if (sportsTheme) {
    [v3 setObject:sportsTheme forKey:@"sports_theme"];
  }
  eventLeagueTagID = self->_eventLeagueTagID;
  if (eventLeagueTagID) {
    [v3 setObject:eventLeagueTagID forKey:@"event_league_tag_ID"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isDeprecated), @"is_deprecated");
  }
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  if (blockedStorefrontIDs) {
    [v3 setObject:blockedStorefrontIDs forKey:@"blocked_storefront_IDs"];
  }
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  if (allowedStorefrontIDs) {
    [v3 setObject:allowedStorefrontIDs forKey:@"allowed_storefront_IDs"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBSportsEventRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (self->_base) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_superfeedConfigResourceID) {
    PBDataWriterWriteStringField();
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  eventCompetitorTagIDs = self->_eventCompetitorTagIDs;
  uint64_t v5 = [(NSMutableArray *)eventCompetitorTagIDs countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(eventCompetitorTagIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v6 = [(NSMutableArray *)eventCompetitorTagIDs countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v6);
  }
  if (self->_highlightsArticleListID) {
    PBDataWriterWriteStringField();
  }
  if (self->_eventArticleListID) {
    PBDataWriterWriteStringField();
  }
  if (self->_sportsData) {
    PBDataWriterWriteStringField();
  }
  if (self->_sportsTheme) {
    PBDataWriterWriteStringField();
  }
  if (self->_eventLeagueTagID) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  uint64_t v10 = [(NSMutableArray *)blockedStorefrontIDs countByEnumeratingWithState:&v23 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(blockedStorefrontIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v11 = [(NSMutableArray *)blockedStorefrontIDs countByEnumeratingWithState:&v23 objects:v32 count:16];
    }
    while (v11);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  uint64_t v15 = [(NSMutableArray *)allowedStorefrontIDs countByEnumeratingWithState:&v19 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      for (uint64_t k = 0; k != v16; ++k)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(allowedStorefrontIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v16 = [(NSMutableArray *)allowedStorefrontIDs countByEnumeratingWithState:&v19 objects:v31 count:16];
    }
    while (v16);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(void *)(v5 + 24) = [(NTPBRecordBase *)self->_base copyWithZone:a3];
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_minimumNewsVersion;
    *(unsigned char *)(v5 + 100) |= 1u;
  }

  *(void *)(v5 + 88) = [(NSString *)self->_superfeedConfigResourceID copyWithZone:a3];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  eventCompetitorTagIDs = self->_eventCompetitorTagIDs;
  uint64_t v7 = [(NSMutableArray *)eventCompetitorTagIDs countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(eventCompetitorTagIDs);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v33 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addEventCompetitorTagIDs:v11];
      }
      uint64_t v8 = [(NSMutableArray *)eventCompetitorTagIDs countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v8);
  }

  *(void *)(v5 + 64) = [(NSString *)self->_highlightsArticleListID copyWithZone:a3];
  *(void *)(v5 + 40) = [(NSString *)self->_eventArticleListID copyWithZone:a3];

  *(void *)(v5 + 72) = [(NSString *)self->_sportsData copyWithZone:a3];
  *(void *)(v5 + 80) = [(NSString *)self->_sportsTheme copyWithZone:a3];

  *(void *)(v5 + 56) = [(NSString *)self->_eventLeagueTagID copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v5 + 96) = self->_isDeprecated;
    *(unsigned char *)(v5 + 100) |= 2u;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  uint64_t v13 = [(NSMutableArray *)blockedStorefrontIDs countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(blockedStorefrontIDs);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v29 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addBlockedStorefrontIDs:v17];
      }
      uint64_t v14 = [(NSMutableArray *)blockedStorefrontIDs countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v14);
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  uint64_t v19 = [(NSMutableArray *)allowedStorefrontIDs countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(allowedStorefrontIDs);
        }
        long long v23 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addAllowedStorefrontIDs:v23];
      }
      uint64_t v20 = [(NSMutableArray *)allowedStorefrontIDs countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v20);
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    base = self->_base;
    if (!((unint64_t)base | *((void *)a3 + 3)) || (int v5 = -[NTPBRecordBase isEqual:](base, "isEqual:")) != 0)
    {
      if (*(unsigned char *)&self->_has)
      {
        if ((*((unsigned char *)a3 + 100) & 1) == 0 || self->_minimumNewsVersion != *((void *)a3 + 1)) {
          goto LABEL_27;
        }
      }
      else if (*((unsigned char *)a3 + 100))
      {
        goto LABEL_27;
      }
      superfeedConfigResourceID = self->_superfeedConfigResourceID;
      if (!((unint64_t)superfeedConfigResourceID | *((void *)a3 + 11))
        || (int v5 = -[NSString isEqual:](superfeedConfigResourceID, "isEqual:")) != 0)
      {
        eventCompetitorTagIDs = self->_eventCompetitorTagIDs;
        if (!((unint64_t)eventCompetitorTagIDs | *((void *)a3 + 6))
          || (int v5 = -[NSMutableArray isEqual:](eventCompetitorTagIDs, "isEqual:")) != 0)
        {
          highlightsArticleListID = self->_highlightsArticleListID;
          if (!((unint64_t)highlightsArticleListID | *((void *)a3 + 8))
            || (int v5 = -[NSString isEqual:](highlightsArticleListID, "isEqual:")) != 0)
          {
            eventArticleListID = self->_eventArticleListID;
            if (!((unint64_t)eventArticleListID | *((void *)a3 + 5))
              || (int v5 = -[NSString isEqual:](eventArticleListID, "isEqual:")) != 0)
            {
              sportsData = self->_sportsData;
              if (!((unint64_t)sportsData | *((void *)a3 + 9))
                || (int v5 = -[NSString isEqual:](sportsData, "isEqual:")) != 0)
              {
                sportsTheme = self->_sportsTheme;
                if (!((unint64_t)sportsTheme | *((void *)a3 + 10))
                  || (int v5 = -[NSString isEqual:](sportsTheme, "isEqual:")) != 0)
                {
                  eventLeagueTagID = self->_eventLeagueTagID;
                  if (!((unint64_t)eventLeagueTagID | *((void *)a3 + 7))
                    || (int v5 = -[NSString isEqual:](eventLeagueTagID, "isEqual:")) != 0)
                  {
                    if ((*(unsigned char *)&self->_has & 2) != 0)
                    {
                      if ((*((unsigned char *)a3 + 100) & 2) != 0)
                      {
                        if (self->_isDeprecated)
                        {
                          if (!*((unsigned char *)a3 + 96)) {
                            goto LABEL_27;
                          }
                          goto LABEL_33;
                        }
                        if (!*((unsigned char *)a3 + 96))
                        {
LABEL_33:
                          blockedStorefrontIDs = self->_blockedStorefrontIDs;
                          if (!((unint64_t)blockedStorefrontIDs | *((void *)a3 + 4))
                            || (int v5 = -[NSMutableArray isEqual:](blockedStorefrontIDs, "isEqual:")) != 0)
                          {
                            allowedStorefrontIDs = self->_allowedStorefrontIDs;
                            if ((unint64_t)allowedStorefrontIDs | *((void *)a3 + 2))
                            {
                              LOBYTE(v5) = -[NSMutableArray isEqual:](allowedStorefrontIDs, "isEqual:");
                            }
                            else
                            {
                              LOBYTE(v5) = 1;
                            }
                          }
                          return v5;
                        }
                      }
                    }
                    else if ((*((unsigned char *)a3 + 100) & 2) == 0)
                    {
                      goto LABEL_33;
                    }
LABEL_27:
                    LOBYTE(v5) = 0;
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
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_minimumNewsVersion;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_superfeedConfigResourceID hash];
  uint64_t v6 = [(NSMutableArray *)self->_eventCompetitorTagIDs hash];
  NSUInteger v7 = [(NSString *)self->_highlightsArticleListID hash];
  NSUInteger v8 = [(NSString *)self->_eventArticleListID hash];
  NSUInteger v9 = [(NSString *)self->_sportsData hash];
  NSUInteger v10 = [(NSString *)self->_sportsTheme hash];
  NSUInteger v11 = [(NSString *)self->_eventLeagueTagID hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v12 = 2654435761 * self->_isDeprecated;
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ [(NSMutableArray *)self->_blockedStorefrontIDs hash];
  return v13 ^ [(NSMutableArray *)self->_allowedStorefrontIDs hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  base = self->_base;
  uint64_t v6 = *((void *)a3 + 3);
  if (base)
  {
    if (v6) {
      -[NTPBRecordBase mergeFrom:](base, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBSportsEventRecord setBase:](self, "setBase:");
  }
  if (*((unsigned char *)a3 + 100))
  {
    self->_minimumNewsVersion = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 11)) {
    -[NTPBSportsEventRecord setSuperfeedConfigResourceID:](self, "setSuperfeedConfigResourceID:");
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  NSUInteger v7 = (void *)*((void *)a3 + 6);
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
        [(NTPBSportsEventRecord *)self addEventCompetitorTagIDs:*(void *)(*((void *)&v30 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v9);
  }
  if (*((void *)a3 + 8)) {
    -[NTPBSportsEventRecord setHighlightsArticleListID:](self, "setHighlightsArticleListID:");
  }
  if (*((void *)a3 + 5)) {
    -[NTPBSportsEventRecord setEventArticleListID:](self, "setEventArticleListID:");
  }
  if (*((void *)a3 + 9)) {
    -[NTPBSportsEventRecord setSportsData:](self, "setSportsData:");
  }
  if (*((void *)a3 + 10)) {
    -[NTPBSportsEventRecord setSportsTheme:](self, "setSportsTheme:");
  }
  if (*((void *)a3 + 7)) {
    -[NTPBSportsEventRecord setEventLeagueTagID:](self, "setEventLeagueTagID:");
  }
  if ((*((unsigned char *)a3 + 100) & 2) != 0)
  {
    self->_isDeprecated = *((unsigned char *)a3 + 96);
    *(unsigned char *)&self->_has |= 2u;
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
        [(NTPBSportsEventRecord *)self addBlockedStorefrontIDs:*(void *)(*((void *)&v26 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v14);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v17 = (void *)*((void *)a3 + 2);
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
        [(NTPBSportsEventRecord *)self addAllowedStorefrontIDs:*(void *)(*((void *)&v22 + 1) + 8 * k)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v19);
  }
}

- (NTPBRecordBase)base
{
  return self->_base;
}

- (void)setBase:(id)a3
{
}

- (int64_t)minimumNewsVersion
{
  return self->_minimumNewsVersion;
}

- (NSString)superfeedConfigResourceID
{
  return self->_superfeedConfigResourceID;
}

- (void)setSuperfeedConfigResourceID:(id)a3
{
}

- (NSMutableArray)eventCompetitorTagIDs
{
  return self->_eventCompetitorTagIDs;
}

- (void)setEventCompetitorTagIDs:(id)a3
{
}

- (NSString)highlightsArticleListID
{
  return self->_highlightsArticleListID;
}

- (void)setHighlightsArticleListID:(id)a3
{
}

- (NSString)eventArticleListID
{
  return self->_eventArticleListID;
}

- (void)setEventArticleListID:(id)a3
{
}

- (NSString)sportsData
{
  return self->_sportsData;
}

- (void)setSportsData:(id)a3
{
}

- (NSString)sportsTheme
{
  return self->_sportsTheme;
}

- (void)setSportsTheme:(id)a3
{
}

- (NSString)eventLeagueTagID
{
  return self->_eventLeagueTagID;
}

- (void)setEventLeagueTagID:(id)a3
{
}

- (BOOL)isDeprecated
{
  return self->_isDeprecated;
}

- (NSMutableArray)blockedStorefrontIDs
{
  return self->_blockedStorefrontIDs;
}

- (void)setBlockedStorefrontIDs:(id)a3
{
}

- (NSMutableArray)allowedStorefrontIDs
{
  return self->_allowedStorefrontIDs;
}

- (void)setAllowedStorefrontIDs:(id)a3
{
}

@end