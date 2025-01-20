@interface NTPBSearchExecute
+ (Class)articleResultIdsType;
+ (Class)channelResultFeedIdsType;
+ (Class)topicResultFeedIdsType;
- (BOOL)hasCampaignId;
- (BOOL)hasCampaignType;
- (BOOL)hasCompletedSearchString;
- (BOOL)hasCreativeId;
- (BOOL)hasSearchExecutionMethod;
- (BOOL)hasSearchLocation;
- (BOOL)hasSearchString;
- (BOOL)hasStoreFrontId;
- (BOOL)hasTopResultArticleId;
- (BOOL)hasTopResultChannelId;
- (BOOL)hasTopResultFeedId;
- (BOOL)hasTopResultTopicId;
- (BOOL)hasTotalResults;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)articleResultIds;
- (NSMutableArray)channelResultFeedIds;
- (NSMutableArray)topicResultFeedIds;
- (NSString)campaignId;
- (NSString)campaignType;
- (NSString)completedSearchString;
- (NSString)creativeId;
- (NSString)searchString;
- (NSString)storeFrontId;
- (NSString)topResultArticleId;
- (NSString)topResultChannelId;
- (NSString)topResultFeedId;
- (NSString)topResultTopicId;
- (id)articleResultIdsAtIndex:(unint64_t)a3;
- (id)channelResultFeedIdsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)searchExecutionMethodAsString:(int)a3;
- (id)searchLocationAsString:(int)a3;
- (id)topicResultFeedIdsAtIndex:(unint64_t)a3;
- (int)StringAsSearchExecutionMethod:(id)a3;
- (int)StringAsSearchLocation:(id)a3;
- (int)searchExecutionMethod;
- (int)searchLocation;
- (int)totalResults;
- (unint64_t)articleResultIdsCount;
- (unint64_t)channelResultFeedIdsCount;
- (unint64_t)hash;
- (unint64_t)topicResultFeedIdsCount;
- (void)addArticleResultIds:(id)a3;
- (void)addChannelResultFeedIds:(id)a3;
- (void)addTopicResultFeedIds:(id)a3;
- (void)clearArticleResultIds;
- (void)clearChannelResultFeedIds;
- (void)clearTopicResultFeedIds;
- (void)mergeFrom:(id)a3;
- (void)setArticleResultIds:(id)a3;
- (void)setCampaignId:(id)a3;
- (void)setCampaignType:(id)a3;
- (void)setChannelResultFeedIds:(id)a3;
- (void)setCompletedSearchString:(id)a3;
- (void)setCreativeId:(id)a3;
- (void)setHasSearchExecutionMethod:(BOOL)a3;
- (void)setHasSearchLocation:(BOOL)a3;
- (void)setHasTotalResults:(BOOL)a3;
- (void)setSearchExecutionMethod:(int)a3;
- (void)setSearchLocation:(int)a3;
- (void)setSearchString:(id)a3;
- (void)setStoreFrontId:(id)a3;
- (void)setTopResultArticleId:(id)a3;
- (void)setTopResultChannelId:(id)a3;
- (void)setTopResultFeedId:(id)a3;
- (void)setTopResultTopicId:(id)a3;
- (void)setTopicResultFeedIds:(id)a3;
- (void)setTotalResults:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBSearchExecute

- (BOOL)hasSearchString
{
  return self->_searchString != 0;
}

- (int)searchLocation
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_searchLocation;
  }
  else {
    return 0;
  }
}

- (void)setSearchLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_searchLocation = a3;
}

- (void)setHasSearchLocation:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSearchLocation
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)searchLocationAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26444C018[a3];
  }

  return v3;
}

- (int)StringAsSearchLocation:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_SEARCH_LOCATION"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NAV_BAR_SEARCH_LOCATION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SEARCH_TAB_SEARCH_LOCATION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FAVORITES_TAB_SEARCH_LOCATION"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TOC_SEARCH_LOCATION"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)searchExecutionMethod
{
  if (*(unsigned char *)&self->_has) {
    return self->_searchExecutionMethod;
  }
  else {
    return 0;
  }
}

- (void)setSearchExecutionMethod:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_searchExecutionMethod = a3;
}

- (void)setHasSearchExecutionMethod:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSearchExecutionMethod
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)searchExecutionMethodAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_26444C040[a3];
  }

  return v3;
}

- (int)StringAsSearchExecutionMethod:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_SEARCH_EXECUTION_METHOD"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SEARCHTAP_SEARCH_EXECUTION_METHOD"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_SEARCH_EXECUTION_METHOD"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setTotalResults:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_totalResults = a3;
}

- (void)setHasTotalResults:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTotalResults
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasTopResultFeedId
{
  return self->_topResultFeedId != 0;
}

- (void)clearTopicResultFeedIds
{
}

- (void)addTopicResultFeedIds:(id)a3
{
  id v4 = a3;
  topicResultFeedIds = self->_topicResultFeedIds;
  id v8 = v4;
  if (!topicResultFeedIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_topicResultFeedIds;
    self->_topicResultFeedIds = v6;

    id v4 = v8;
    topicResultFeedIds = self->_topicResultFeedIds;
  }
  [(NSMutableArray *)topicResultFeedIds addObject:v4];
}

- (unint64_t)topicResultFeedIdsCount
{
  return [(NSMutableArray *)self->_topicResultFeedIds count];
}

- (id)topicResultFeedIdsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_topicResultFeedIds objectAtIndex:a3];
}

+ (Class)topicResultFeedIdsType
{
  return (Class)objc_opt_class();
}

- (void)clearChannelResultFeedIds
{
}

- (void)addChannelResultFeedIds:(id)a3
{
  id v4 = a3;
  channelResultFeedIds = self->_channelResultFeedIds;
  id v8 = v4;
  if (!channelResultFeedIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_channelResultFeedIds;
    self->_channelResultFeedIds = v6;

    id v4 = v8;
    channelResultFeedIds = self->_channelResultFeedIds;
  }
  [(NSMutableArray *)channelResultFeedIds addObject:v4];
}

- (unint64_t)channelResultFeedIdsCount
{
  return [(NSMutableArray *)self->_channelResultFeedIds count];
}

- (id)channelResultFeedIdsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_channelResultFeedIds objectAtIndex:a3];
}

+ (Class)channelResultFeedIdsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasStoreFrontId
{
  return self->_storeFrontId != 0;
}

- (BOOL)hasCampaignId
{
  return self->_campaignId != 0;
}

- (BOOL)hasCampaignType
{
  return self->_campaignType != 0;
}

- (BOOL)hasCreativeId
{
  return self->_creativeId != 0;
}

- (BOOL)hasTopResultArticleId
{
  return self->_topResultArticleId != 0;
}

- (BOOL)hasTopResultChannelId
{
  return self->_topResultChannelId != 0;
}

- (BOOL)hasTopResultTopicId
{
  return self->_topResultTopicId != 0;
}

- (void)clearArticleResultIds
{
}

- (void)addArticleResultIds:(id)a3
{
  id v4 = a3;
  articleResultIds = self->_articleResultIds;
  id v8 = v4;
  if (!articleResultIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_articleResultIds;
    self->_articleResultIds = v6;

    id v4 = v8;
    articleResultIds = self->_articleResultIds;
  }
  [(NSMutableArray *)articleResultIds addObject:v4];
}

- (unint64_t)articleResultIdsCount
{
  return [(NSMutableArray *)self->_articleResultIds count];
}

- (id)articleResultIdsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_articleResultIds objectAtIndex:a3];
}

+ (Class)articleResultIdsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasCompletedSearchString
{
  return self->_completedSearchString != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBSearchExecute;
  id v4 = [(NTPBSearchExecute *)&v8 description];
  v5 = [(NTPBSearchExecute *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  searchString = self->_searchString;
  if (searchString) {
    [v3 setObject:searchString forKey:@"search_string"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t searchLocation = self->_searchLocation;
    if (searchLocation >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_searchLocation);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_26444C018[searchLocation];
    }
    [v4 setObject:v22 forKey:@"search_location"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  uint64_t searchExecutionMethod = self->_searchExecutionMethod;
  if (searchExecutionMethod >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_searchExecutionMethod);
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = off_26444C040[searchExecutionMethod];
  }
  [v4 setObject:v24 forKey:@"search_execution_method"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_6:
    v7 = [NSNumber numberWithInt:self->_totalResults];
    [v4 setObject:v7 forKey:@"total_results"];
  }
LABEL_7:
  topResultFeedId = self->_topResultFeedId;
  if (topResultFeedId) {
    [v4 setObject:topResultFeedId forKey:@"top_result_feed_id"];
  }
  topicResultFeedIds = self->_topicResultFeedIds;
  if (topicResultFeedIds) {
    [v4 setObject:topicResultFeedIds forKey:@"topic_result_feed_ids"];
  }
  channelResultFeedIds = self->_channelResultFeedIds;
  if (channelResultFeedIds) {
    [v4 setObject:channelResultFeedIds forKey:@"channel_result_feed_ids"];
  }
  storeFrontId = self->_storeFrontId;
  if (storeFrontId) {
    [v4 setObject:storeFrontId forKey:@"store_front_id"];
  }
  campaignId = self->_campaignId;
  if (campaignId) {
    [v4 setObject:campaignId forKey:@"campaign_id"];
  }
  campaignType = self->_campaignType;
  if (campaignType) {
    [v4 setObject:campaignType forKey:@"campaign_type"];
  }
  creativeId = self->_creativeId;
  if (creativeId) {
    [v4 setObject:creativeId forKey:@"creative_id"];
  }
  topResultArticleId = self->_topResultArticleId;
  if (topResultArticleId) {
    [v4 setObject:topResultArticleId forKey:@"top_result_article_id"];
  }
  topResultChannelId = self->_topResultChannelId;
  if (topResultChannelId) {
    [v4 setObject:topResultChannelId forKey:@"top_result_channel_id"];
  }
  topResultTopicId = self->_topResultTopicId;
  if (topResultTopicId) {
    [v4 setObject:topResultTopicId forKey:@"top_result_topic_id"];
  }
  articleResultIds = self->_articleResultIds;
  if (articleResultIds) {
    [v4 setObject:articleResultIds forKey:@"article_result_ids"];
  }
  completedSearchString = self->_completedSearchString;
  if (completedSearchString) {
    [v4 setObject:completedSearchString forKey:@"completed_search_string"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBSearchExecuteReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_searchString) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_6:
  }
    PBDataWriterWriteInt32Field();
LABEL_7:
  if (self->_topResultFeedId) {
    PBDataWriterWriteStringField();
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v6 = self->_topicResultFeedIds;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v8);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v11 = self->_channelResultFeedIds;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v13);
  }

  if (self->_storeFrontId) {
    PBDataWriterWriteStringField();
  }
  if (self->_campaignId) {
    PBDataWriterWriteStringField();
  }
  if (self->_campaignType) {
    PBDataWriterWriteStringField();
  }
  if (self->_creativeId) {
    PBDataWriterWriteStringField();
  }
  if (self->_topResultArticleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_topResultChannelId) {
    PBDataWriterWriteStringField();
  }
  if (self->_topResultTopicId) {
    PBDataWriterWriteStringField();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v16 = self->_articleResultIds;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v18);
  }

  if (self->_completedSearchString) {
    PBDataWriterWriteStringField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_searchString copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_searchLocation;
    *(unsigned char *)(v5 + 124) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 56) = self->_searchExecutionMethod;
  *(unsigned char *)(v5 + 124) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 120) = self->_totalResults;
    *(unsigned char *)(v5 + 124) |= 4u;
  }
LABEL_5:
  uint64_t v9 = [(NSString *)self->_topResultFeedId copyWithZone:a3];
  v10 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v9;

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v11 = self->_topicResultFeedIds;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v55 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = (void *)[*(id *)(*((void *)&v54 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addTopicResultFeedIds:v16];
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v54 objects:v60 count:16];
    }
    while (v13);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v17 = self->_channelResultFeedIds;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v51 != v20) {
          objc_enumerationMutation(v17);
        }
        long long v22 = (void *)[*(id *)(*((void *)&v50 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addChannelResultFeedIds:v22];
      }
      uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v50 objects:v59 count:16];
    }
    while (v19);
  }

  uint64_t v23 = [(NSString *)self->_storeFrontId copyWithZone:a3];
  long long v24 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v23;

  uint64_t v25 = [(NSString *)self->_campaignId copyWithZone:a3];
  long long v26 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v25;

  uint64_t v27 = [(NSString *)self->_campaignType copyWithZone:a3];
  long long v28 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v27;

  uint64_t v29 = [(NSString *)self->_creativeId copyWithZone:a3];
  long long v30 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v29;

  uint64_t v31 = [(NSString *)self->_topResultArticleId copyWithZone:a3];
  long long v32 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v31;

  uint64_t v33 = [(NSString *)self->_topResultChannelId copyWithZone:a3];
  v34 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v33;

  uint64_t v35 = [(NSString *)self->_topResultTopicId copyWithZone:a3];
  uint64_t v36 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v35;

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v37 = self->_articleResultIds;
  uint64_t v38 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v46 objects:v58 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v47;
    do
    {
      for (uint64_t k = 0; k != v39; ++k)
      {
        if (*(void *)v47 != v40) {
          objc_enumerationMutation(v37);
        }
        v42 = objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * k), "copyWithZone:", a3, (void)v46);
        [(id)v5 addArticleResultIds:v42];
      }
      uint64_t v39 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v46 objects:v58 count:16];
    }
    while (v39);
  }

  uint64_t v43 = [(NSString *)self->_completedSearchString copyWithZone:a3];
  v44 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v43;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_43;
  }
  searchString = self->_searchString;
  if ((unint64_t)searchString | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](searchString, "isEqual:")) {
      goto LABEL_43;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 124) & 2) == 0 || self->_searchLocation != *((_DWORD *)v4 + 15)) {
      goto LABEL_43;
    }
  }
  else if ((*((unsigned char *)v4 + 124) & 2) != 0)
  {
LABEL_43:
    char v18 = 0;
    goto LABEL_44;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 124) & 1) == 0 || self->_searchExecutionMethod != *((_DWORD *)v4 + 14)) {
      goto LABEL_43;
    }
  }
  else if (*((unsigned char *)v4 + 124))
  {
    goto LABEL_43;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 124) & 4) == 0 || self->_totalResults != *((_DWORD *)v4 + 30)) {
      goto LABEL_43;
    }
  }
  else if ((*((unsigned char *)v4 + 124) & 4) != 0)
  {
    goto LABEL_43;
  }
  topResultFeedId = self->_topResultFeedId;
  if ((unint64_t)topResultFeedId | *((void *)v4 + 12)
    && !-[NSString isEqual:](topResultFeedId, "isEqual:"))
  {
    goto LABEL_43;
  }
  topicResultFeedIds = self->_topicResultFeedIds;
  if ((unint64_t)topicResultFeedIds | *((void *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](topicResultFeedIds, "isEqual:")) {
      goto LABEL_43;
    }
  }
  channelResultFeedIds = self->_channelResultFeedIds;
  if ((unint64_t)channelResultFeedIds | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](channelResultFeedIds, "isEqual:")) {
      goto LABEL_43;
    }
  }
  storeFrontId = self->_storeFrontId;
  if ((unint64_t)storeFrontId | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](storeFrontId, "isEqual:")) {
      goto LABEL_43;
    }
  }
  campaignId = self->_campaignId;
  if ((unint64_t)campaignId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](campaignId, "isEqual:")) {
      goto LABEL_43;
    }
  }
  campaignType = self->_campaignType;
  if ((unint64_t)campaignType | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](campaignType, "isEqual:")) {
      goto LABEL_43;
    }
  }
  creativeId = self->_creativeId;
  if ((unint64_t)creativeId | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](creativeId, "isEqual:")) {
      goto LABEL_43;
    }
  }
  topResultArticleId = self->_topResultArticleId;
  if ((unint64_t)topResultArticleId | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](topResultArticleId, "isEqual:")) {
      goto LABEL_43;
    }
  }
  topResultChannelId = self->_topResultChannelId;
  if ((unint64_t)topResultChannelId | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](topResultChannelId, "isEqual:")) {
      goto LABEL_43;
    }
  }
  topResultTopicId = self->_topResultTopicId;
  if ((unint64_t)topResultTopicId | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](topResultTopicId, "isEqual:")) {
      goto LABEL_43;
    }
  }
  articleResultIds = self->_articleResultIds;
  if ((unint64_t)articleResultIds | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](articleResultIds, "isEqual:")) {
      goto LABEL_43;
    }
  }
  completedSearchString = self->_completedSearchString;
  if ((unint64_t)completedSearchString | *((void *)v4 + 5)) {
    char v18 = -[NSString isEqual:](completedSearchString, "isEqual:");
  }
  else {
    char v18 = 1;
  }
LABEL_44:

  return v18;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_searchString hash];
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v6 = 0;
    goto LABEL_8;
  }
  uint64_t v4 = 2654435761 * self->_searchLocation;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_searchExecutionMethod;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_totalResults;
LABEL_8:
  NSUInteger v7 = v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_topResultFeedId hash];
  uint64_t v8 = [(NSMutableArray *)self->_topicResultFeedIds hash];
  uint64_t v9 = v8 ^ [(NSMutableArray *)self->_channelResultFeedIds hash];
  NSUInteger v10 = v7 ^ v9 ^ [(NSString *)self->_storeFrontId hash];
  NSUInteger v11 = [(NSString *)self->_campaignId hash];
  NSUInteger v12 = v11 ^ [(NSString *)self->_campaignType hash];
  NSUInteger v13 = v12 ^ [(NSString *)self->_creativeId hash];
  NSUInteger v14 = v10 ^ v13 ^ [(NSString *)self->_topResultArticleId hash];
  NSUInteger v15 = [(NSString *)self->_topResultChannelId hash];
  NSUInteger v16 = v15 ^ [(NSString *)self->_topResultTopicId hash];
  uint64_t v17 = v16 ^ [(NSMutableArray *)self->_articleResultIds hash];
  return v14 ^ v17 ^ [(NSString *)self->_completedSearchString hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 8)) {
    -[NTPBSearchExecute setSearchString:](self, "setSearchString:");
  }
  char v5 = *((unsigned char *)v4 + 124);
  if ((v5 & 2) != 0)
  {
    self->_uint64_t searchLocation = *((_DWORD *)v4 + 15);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 124);
    if ((v5 & 1) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*((unsigned char *)v4 + 124) & 1) == 0)
  {
    goto LABEL_5;
  }
  self->_uint64_t searchExecutionMethod = *((_DWORD *)v4 + 14);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 124) & 4) != 0)
  {
LABEL_6:
    self->_totalResults = *((_DWORD *)v4 + 30);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_7:
  if (*((void *)v4 + 12)) {
    -[NTPBSearchExecute setTopResultFeedId:](self, "setTopResultFeedId:");
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = *((id *)v4 + 14);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        [(NTPBSearchExecute *)self addTopicResultFeedIds:*(void *)(*((void *)&v29 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v8);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = *((id *)v4 + 4);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        [(NTPBSearchExecute *)self addChannelResultFeedIds:*(void *)(*((void *)&v25 + 1) + 8 * j)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v13);
  }

  if (*((void *)v4 + 9)) {
    -[NTPBSearchExecute setStoreFrontId:](self, "setStoreFrontId:");
  }
  if (*((void *)v4 + 2)) {
    -[NTPBSearchExecute setCampaignId:](self, "setCampaignId:");
  }
  if (*((void *)v4 + 3)) {
    -[NTPBSearchExecute setCampaignType:](self, "setCampaignType:");
  }
  if (*((void *)v4 + 6)) {
    -[NTPBSearchExecute setCreativeId:](self, "setCreativeId:");
  }
  if (*((void *)v4 + 10)) {
    -[NTPBSearchExecute setTopResultArticleId:](self, "setTopResultArticleId:");
  }
  if (*((void *)v4 + 11)) {
    -[NTPBSearchExecute setTopResultChannelId:](self, "setTopResultChannelId:");
  }
  if (*((void *)v4 + 13)) {
    -[NTPBSearchExecute setTopResultTopicId:](self, "setTopResultTopicId:");
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v16 = *((id *)v4 + 1);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        -[NTPBSearchExecute addArticleResultIds:](self, "addArticleResultIds:", *(void *)(*((void *)&v21 + 1) + 8 * k), (void)v21);
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v18);
  }

  if (*((void *)v4 + 5)) {
    -[NTPBSearchExecute setCompletedSearchString:](self, "setCompletedSearchString:");
  }
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
}

- (int)totalResults
{
  return self->_totalResults;
}

- (NSString)topResultFeedId
{
  return self->_topResultFeedId;
}

- (void)setTopResultFeedId:(id)a3
{
}

- (NSMutableArray)topicResultFeedIds
{
  return self->_topicResultFeedIds;
}

- (void)setTopicResultFeedIds:(id)a3
{
}

- (NSMutableArray)channelResultFeedIds
{
  return self->_channelResultFeedIds;
}

- (void)setChannelResultFeedIds:(id)a3
{
}

- (NSString)storeFrontId
{
  return self->_storeFrontId;
}

- (void)setStoreFrontId:(id)a3
{
}

- (NSString)campaignId
{
  return self->_campaignId;
}

- (void)setCampaignId:(id)a3
{
}

- (NSString)campaignType
{
  return self->_campaignType;
}

- (void)setCampaignType:(id)a3
{
}

- (NSString)creativeId
{
  return self->_creativeId;
}

- (void)setCreativeId:(id)a3
{
}

- (NSString)topResultArticleId
{
  return self->_topResultArticleId;
}

- (void)setTopResultArticleId:(id)a3
{
}

- (NSString)topResultChannelId
{
  return self->_topResultChannelId;
}

- (void)setTopResultChannelId:(id)a3
{
}

- (NSString)topResultTopicId
{
  return self->_topResultTopicId;
}

- (void)setTopResultTopicId:(id)a3
{
}

- (NSMutableArray)articleResultIds
{
  return self->_articleResultIds;
}

- (void)setArticleResultIds:(id)a3
{
}

- (NSString)completedSearchString
{
  return self->_completedSearchString;
}

- (void)setCompletedSearchString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicResultFeedIds, 0);
  objc_storeStrong((id *)&self->_topResultTopicId, 0);
  objc_storeStrong((id *)&self->_topResultFeedId, 0);
  objc_storeStrong((id *)&self->_topResultChannelId, 0);
  objc_storeStrong((id *)&self->_topResultArticleId, 0);
  objc_storeStrong((id *)&self->_storeFrontId, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_creativeId, 0);
  objc_storeStrong((id *)&self->_completedSearchString, 0);
  objc_storeStrong((id *)&self->_channelResultFeedIds, 0);
  objc_storeStrong((id *)&self->_campaignType, 0);
  objc_storeStrong((id *)&self->_campaignId, 0);

  objc_storeStrong((id *)&self->_articleResultIds, 0);
}

@end