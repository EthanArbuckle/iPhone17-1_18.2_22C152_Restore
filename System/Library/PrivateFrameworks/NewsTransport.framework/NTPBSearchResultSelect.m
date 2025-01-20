@interface NTPBSearchResultSelect
+ (Class)articleResultArticleIdsType;
+ (Class)channelResultFeedIdsType;
+ (Class)nonSelectedResultFeedIdType;
+ (Class)searchResultsType;
+ (Class)topicResultFeedIdsType;
- (BOOL)didSelectResult;
- (BOOL)hasCampaignId;
- (BOOL)hasCampaignType;
- (BOOL)hasCompletedSearchString;
- (BOOL)hasCreativeId;
- (BOOL)hasDidSelectResult;
- (BOOL)hasSearchExecutionMethod;
- (BOOL)hasSearchLocation;
- (BOOL)hasSearchResultSelectLocation;
- (BOOL)hasSearchString;
- (BOOL)hasSelectedResultActionType;
- (BOOL)hasSelectedResultArticleId;
- (BOOL)hasSelectedResultFeedId;
- (BOOL)hasSelectedResultRankInSection;
- (BOOL)hasSelectedResultSection;
- (BOOL)hasSelectedResultShowMore;
- (BOOL)hasSelectedResultString;
- (BOOL)hasSelectedResultType;
- (BOOL)hasStoreFrontId;
- (BOOL)hasTopResultArticleId;
- (BOOL)hasTopResultChannelId;
- (BOOL)hasTopResultFeedId;
- (BOOL)hasTopResultTopicId;
- (BOOL)hasTotalResults;
- (BOOL)hasTotalResultsInSelectedSection;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)selectedResultShowMore;
- (NSMutableArray)articleResultArticleIds;
- (NSMutableArray)channelResultFeedIds;
- (NSMutableArray)nonSelectedResultFeedIds;
- (NSMutableArray)searchResults;
- (NSMutableArray)topicResultFeedIds;
- (NSString)campaignId;
- (NSString)campaignType;
- (NSString)completedSearchString;
- (NSString)creativeId;
- (NSString)searchString;
- (NSString)selectedResultArticleId;
- (NSString)selectedResultFeedId;
- (NSString)selectedResultString;
- (NSString)storeFrontId;
- (NSString)topResultArticleId;
- (NSString)topResultChannelId;
- (NSString)topResultFeedId;
- (NSString)topResultTopicId;
- (id)articleResultArticleIdsAtIndex:(unint64_t)a3;
- (id)channelResultFeedIdsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)nonSelectedResultFeedIdAtIndex:(unint64_t)a3;
- (id)searchExecutionMethodAsString:(int)a3;
- (id)searchLocationAsString:(int)a3;
- (id)searchResultsAtIndex:(unint64_t)a3;
- (id)topicResultFeedIdsAtIndex:(unint64_t)a3;
- (int)StringAsSearchExecutionMethod:(id)a3;
- (int)StringAsSearchLocation:(id)a3;
- (int)searchExecutionMethod;
- (int)searchLocation;
- (int)searchResultSelectLocation;
- (int)selectedResultActionType;
- (int)selectedResultRankInSection;
- (int)selectedResultSection;
- (int)selectedResultType;
- (int)totalResults;
- (int)totalResultsInSelectedSection;
- (unint64_t)articleResultArticleIdsCount;
- (unint64_t)channelResultFeedIdsCount;
- (unint64_t)hash;
- (unint64_t)nonSelectedResultFeedIdsCount;
- (unint64_t)searchResultsCount;
- (unint64_t)topicResultFeedIdsCount;
- (void)addArticleResultArticleIds:(id)a3;
- (void)addChannelResultFeedIds:(id)a3;
- (void)addNonSelectedResultFeedId:(id)a3;
- (void)addSearchResults:(id)a3;
- (void)addTopicResultFeedIds:(id)a3;
- (void)clearArticleResultArticleIds;
- (void)clearChannelResultFeedIds;
- (void)clearNonSelectedResultFeedIds;
- (void)clearSearchResults;
- (void)clearTopicResultFeedIds;
- (void)mergeFrom:(id)a3;
- (void)setArticleResultArticleIds:(id)a3;
- (void)setCampaignId:(id)a3;
- (void)setCampaignType:(id)a3;
- (void)setChannelResultFeedIds:(id)a3;
- (void)setCompletedSearchString:(id)a3;
- (void)setCreativeId:(id)a3;
- (void)setDidSelectResult:(BOOL)a3;
- (void)setHasDidSelectResult:(BOOL)a3;
- (void)setHasSearchExecutionMethod:(BOOL)a3;
- (void)setHasSearchLocation:(BOOL)a3;
- (void)setHasSearchResultSelectLocation:(BOOL)a3;
- (void)setHasSelectedResultActionType:(BOOL)a3;
- (void)setHasSelectedResultRankInSection:(BOOL)a3;
- (void)setHasSelectedResultSection:(BOOL)a3;
- (void)setHasSelectedResultShowMore:(BOOL)a3;
- (void)setHasSelectedResultType:(BOOL)a3;
- (void)setHasTotalResults:(BOOL)a3;
- (void)setHasTotalResultsInSelectedSection:(BOOL)a3;
- (void)setNonSelectedResultFeedIds:(id)a3;
- (void)setSearchExecutionMethod:(int)a3;
- (void)setSearchLocation:(int)a3;
- (void)setSearchResultSelectLocation:(int)a3;
- (void)setSearchResults:(id)a3;
- (void)setSearchString:(id)a3;
- (void)setSelectedResultActionType:(int)a3;
- (void)setSelectedResultArticleId:(id)a3;
- (void)setSelectedResultFeedId:(id)a3;
- (void)setSelectedResultRankInSection:(int)a3;
- (void)setSelectedResultSection:(int)a3;
- (void)setSelectedResultShowMore:(BOOL)a3;
- (void)setSelectedResultString:(id)a3;
- (void)setSelectedResultType:(int)a3;
- (void)setStoreFrontId:(id)a3;
- (void)setTopResultArticleId:(id)a3;
- (void)setTopResultChannelId:(id)a3;
- (void)setTopResultFeedId:(id)a3;
- (void)setTopResultTopicId:(id)a3;
- (void)setTopicResultFeedIds:(id)a3;
- (void)setTotalResults:(int)a3;
- (void)setTotalResultsInSelectedSection:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBSearchResultSelect

- (BOOL)hasSearchString
{
  return self->_searchString != 0;
}

- (int)searchLocation
{
  if ((*(_WORD *)&self->_has & 2) != 0) {
    return self->_searchLocation;
  }
  else {
    return 0;
  }
}

- (void)setSearchLocation:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_searchLocation = a3;
}

- (void)setHasSearchLocation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasSearchLocation
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)searchLocationAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_26444C8A8[a3];
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

- (int)selectedResultType
{
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    return self->_selectedResultType;
  }
  else {
    return 0;
  }
}

- (void)setSelectedResultType:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_selectedResultType = a3;
}

- (void)setHasSelectedResultType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasSelectedResultType
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (int)selectedResultActionType
{
  if ((*(_WORD *)&self->_has & 8) != 0) {
    return self->_selectedResultActionType;
  }
  else {
    return 0;
  }
}

- (void)setSelectedResultActionType:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_selectedResultActionType = a3;
}

- (void)setHasSelectedResultActionType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasSelectedResultActionType
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (int)selectedResultSection
{
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    return self->_selectedResultSection;
  }
  else {
    return 0;
  }
}

- (void)setSelectedResultSection:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_selectedResultSection = a3;
}

- (void)setHasSelectedResultSection:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasSelectedResultSection
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasSelectedResultString
{
  return self->_selectedResultString != 0;
}

- (BOOL)hasSelectedResultFeedId
{
  return self->_selectedResultFeedId != 0;
}

- (void)setSelectedResultRankInSection:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_selectedResultRankInSection = a3;
}

- (void)setHasSelectedResultRankInSection:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasSelectedResultRankInSection
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setSelectedResultShowMore:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_selectedResultShowMore = a3;
}

- (void)setHasSelectedResultShowMore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSelectedResultShowMore
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (int)searchExecutionMethod
{
  if (*(_WORD *)&self->_has) {
    return self->_searchExecutionMethod;
  }
  else {
    return 0;
  }
}

- (void)setSearchExecutionMethod:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_searchExecutionMethod = a3;
}

- (void)setHasSearchExecutionMethod:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasSearchExecutionMethod
{
  return *(_WORD *)&self->_has & 1;
}

- (id)searchExecutionMethodAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_26444C8D0[a3];
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
  *(_WORD *)&self->_has |= 0x80u;
  self->_totalResults = a3;
}

- (void)setHasTotalResults:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTotalResults
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setTotalResultsInSelectedSection:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_totalResultsInSelectedSection = a3;
}

- (void)setHasTotalResultsInSelectedSection:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTotalResultsInSelectedSection
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)clearNonSelectedResultFeedIds
{
}

- (void)addNonSelectedResultFeedId:(id)a3
{
  id v4 = a3;
  nonSelectedResultFeedIds = self->_nonSelectedResultFeedIds;
  id v8 = v4;
  if (!nonSelectedResultFeedIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_nonSelectedResultFeedIds;
    self->_nonSelectedResultFeedIds = v6;

    id v4 = v8;
    nonSelectedResultFeedIds = self->_nonSelectedResultFeedIds;
  }
  [(NSMutableArray *)nonSelectedResultFeedIds addObject:v4];
}

- (unint64_t)nonSelectedResultFeedIdsCount
{
  return [(NSMutableArray *)self->_nonSelectedResultFeedIds count];
}

- (id)nonSelectedResultFeedIdAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_nonSelectedResultFeedIds objectAtIndex:a3];
}

+ (Class)nonSelectedResultFeedIdType
{
  return (Class)objc_opt_class();
}

- (void)setDidSelectResult:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_didSelectResult = a3;
}

- (void)setHasDidSelectResult:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasDidSelectResult
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)clearSearchResults
{
}

- (void)addSearchResults:(id)a3
{
  id v4 = a3;
  searchResults = self->_searchResults;
  id v8 = v4;
  if (!searchResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_searchResults;
    self->_searchResults = v6;

    id v4 = v8;
    searchResults = self->_searchResults;
  }
  [(NSMutableArray *)searchResults addObject:v4];
}

- (unint64_t)searchResultsCount
{
  return [(NSMutableArray *)self->_searchResults count];
}

- (id)searchResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_searchResults objectAtIndex:a3];
}

+ (Class)searchResultsType
{
  return (Class)objc_opt_class();
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

- (int)searchResultSelectLocation
{
  if ((*(_WORD *)&self->_has & 4) != 0) {
    return self->_searchResultSelectLocation;
  }
  else {
    return 0;
  }
}

- (void)setSearchResultSelectLocation:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_searchResultSelectLocation = a3;
}

- (void)setHasSearchResultSelectLocation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasSearchResultSelectLocation
{
  return (*(_WORD *)&self->_has >> 2) & 1;
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

- (BOOL)hasSelectedResultArticleId
{
  return self->_selectedResultArticleId != 0;
}

- (void)clearArticleResultArticleIds
{
}

- (void)addArticleResultArticleIds:(id)a3
{
  id v4 = a3;
  articleResultArticleIds = self->_articleResultArticleIds;
  id v8 = v4;
  if (!articleResultArticleIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_articleResultArticleIds;
    self->_articleResultArticleIds = v6;

    id v4 = v8;
    articleResultArticleIds = self->_articleResultArticleIds;
  }
  [(NSMutableArray *)articleResultArticleIds addObject:v4];
}

- (unint64_t)articleResultArticleIdsCount
{
  return [(NSMutableArray *)self->_articleResultArticleIds count];
}

- (id)articleResultArticleIdsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_articleResultArticleIds objectAtIndex:a3];
}

+ (Class)articleResultArticleIdsType
{
  return (Class)objc_opt_class();
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

- (BOOL)hasCompletedSearchString
{
  return self->_completedSearchString != 0;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBSearchResultSelect;
  id v4 = [(NTPBSearchResultSelect *)&v8 description];
  v5 = [(NTPBSearchResultSelect *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  searchString = self->_searchString;
  if (searchString) {
    [v3 setObject:searchString forKey:@"search_string"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t searchLocation = self->_searchLocation;
    if (searchLocation >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_searchLocation);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_26444C8A8[searchLocation];
    }
    [v4 setObject:v8 forKey:@"search_location"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    v33 = [NSNumber numberWithInt:self->_selectedResultType];
    [v4 setObject:v33 forKey:@"selected_result_type"];

    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_10:
      if ((has & 0x20) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_10;
  }
  v34 = [NSNumber numberWithInt:self->_selectedResultActionType];
  [v4 setObject:v34 forKey:@"selected_result_action_type"];

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_11:
    v9 = [NSNumber numberWithInt:self->_selectedResultSection];
    [v4 setObject:v9 forKey:@"selected_result_section"];
  }
LABEL_12:
  selectedResultString = self->_selectedResultString;
  if (selectedResultString) {
    [v4 setObject:selectedResultString forKey:@"selected_result_string"];
  }
  selectedResultFeedId = self->_selectedResultFeedId;
  if (selectedResultFeedId) {
    [v4 setObject:selectedResultFeedId forKey:@"selected_result_feed_id"];
  }
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x10) != 0)
  {
    v35 = [NSNumber numberWithInt:self->_selectedResultRankInSection];
    [v4 setObject:v35 forKey:@"selected_result_rank_in_section"];

    __int16 v12 = (__int16)self->_has;
    if ((v12 & 0x400) == 0)
    {
LABEL_18:
      if ((v12 & 1) == 0) {
        goto LABEL_19;
      }
      goto LABEL_62;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_18;
  }
  v36 = [NSNumber numberWithBool:self->_selectedResultShowMore];
  [v4 setObject:v36 forKey:@"selected_result_show_more"];

  __int16 v12 = (__int16)self->_has;
  if ((v12 & 1) == 0)
  {
LABEL_19:
    if ((v12 & 0x80) == 0) {
      goto LABEL_20;
    }
    goto LABEL_66;
  }
LABEL_62:
  uint64_t searchExecutionMethod = self->_searchExecutionMethod;
  if (searchExecutionMethod >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_searchExecutionMethod);
    v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v38 = off_26444C8D0[searchExecutionMethod];
  }
  [v4 setObject:v38 forKey:@"search_execution_method"];

  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x80) == 0)
  {
LABEL_20:
    if ((v12 & 0x100) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_66:
  v39 = [NSNumber numberWithInt:self->_totalResults];
  [v4 setObject:v39 forKey:@"total_results"];

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_21:
    v13 = [NSNumber numberWithInt:self->_totalResultsInSelectedSection];
    [v4 setObject:v13 forKey:@"total_results_in_selected_section"];
  }
LABEL_22:
  nonSelectedResultFeedIds = self->_nonSelectedResultFeedIds;
  if (nonSelectedResultFeedIds) {
    [v4 setObject:nonSelectedResultFeedIds forKey:@"non_selected_result_feed_id"];
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    v15 = [NSNumber numberWithBool:self->_didSelectResult];
    [v4 setObject:v15 forKey:@"did_select_result"];
  }
  searchResults = self->_searchResults;
  if (searchResults) {
    [v4 setObject:searchResults forKey:@"search_results"];
  }
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
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    v21 = [NSNumber numberWithInt:self->_searchResultSelectLocation];
    [v4 setObject:v21 forKey:@"search_result_select_location"];
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
  selectedResultArticleId = self->_selectedResultArticleId;
  if (selectedResultArticleId) {
    [v4 setObject:selectedResultArticleId forKey:@"selected_result_article_id"];
  }
  articleResultArticleIds = self->_articleResultArticleIds;
  if (articleResultArticleIds) {
    [v4 setObject:articleResultArticleIds forKey:@"article_result_article_ids"];
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
  completedSearchString = self->_completedSearchString;
  if (completedSearchString) {
    [v4 setObject:completedSearchString forKey:@"completed_search_string"];
  }
  id v31 = v4;

  return v31;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBSearchResultSelectReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_searchString) {
    PBDataWriterWriteStringField();
  }
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_80;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_80:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
LABEL_7:
  }
    PBDataWriterWriteInt32Field();
LABEL_8:
  if (self->_selectedResultString) {
    PBDataWriterWriteStringField();
  }
  if (self->_selectedResultFeedId) {
    PBDataWriterWriteStringField();
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x400) == 0)
    {
LABEL_14:
      if ((v6 & 1) == 0) {
        goto LABEL_15;
      }
      goto LABEL_84;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterWriteBOOLField();
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 1) == 0)
  {
LABEL_15:
    if ((v6 & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteInt32Field();
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x80) == 0)
  {
LABEL_16:
    if ((v6 & 0x100) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_85:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
LABEL_17:
  }
    PBDataWriterWriteInt32Field();
LABEL_18:
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v7 = self->_nonSelectedResultFeedIds;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v49 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v48 objects:v56 count:16];
    }
    while (v9);
  }

  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  __int16 v12 = self->_searchResults;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v44 objects:v55 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v45 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v44 objects:v55 count:16];
    }
    while (v14);
  }

  if (self->_topResultFeedId) {
    PBDataWriterWriteStringField();
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v17 = self->_topicResultFeedIds;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v40 objects:v54 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v41;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v41 != v20) {
          objc_enumerationMutation(v17);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v40 objects:v54 count:16];
    }
    while (v19);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v22 = self->_channelResultFeedIds;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v36 objects:v53 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v37;
    do
    {
      for (uint64_t m = 0; m != v24; ++m)
      {
        if (*(void *)v37 != v25) {
          objc_enumerationMutation(v22);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v36 objects:v53 count:16];
    }
    while (v24);
  }

  if (self->_storeFrontId) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
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
  if (self->_selectedResultArticleId) {
    PBDataWriterWriteStringField();
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v27 = self->_articleResultArticleIds;
  uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v32 objects:v52 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v33;
    do
    {
      for (uint64_t n = 0; n != v29; ++n)
      {
        if (*(void *)v33 != v30) {
          objc_enumerationMutation(v27);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v32 objects:v52 count:16];
    }
    while (v29);
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
  if (self->_completedSearchString) {
    PBDataWriterWriteStringField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_searchString copyWithZone:a3];
  v7 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v6;

  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_searchLocation;
    *(_WORD *)(v5 + 204) |= 2u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_54;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 136) = self->_selectedResultType;
  *(_WORD *)(v5 + 204) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_54:
  *(_DWORD *)(v5 + 96) = self->_selectedResultActionType;
  *(_WORD *)(v5 + 204) |= 8u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 124) = self->_selectedResultSection;
    *(_WORD *)(v5 + 204) |= 0x20u;
  }
LABEL_6:
  uint64_t v9 = [(NSString *)self->_selectedResultString copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v9;

  uint64_t v11 = [(NSString *)self->_selectedResultFeedId copyWithZone:a3];
  __int16 v12 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v11;

  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 120) = self->_selectedResultRankInSection;
    *(_WORD *)(v5 + 204) |= 0x10u;
    __int16 v13 = (__int16)self->_has;
    if ((v13 & 0x400) == 0)
    {
LABEL_8:
      if ((v13 & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_58;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_8;
  }
  *(unsigned char *)(v5 + 201) = self->_selectedResultShowMore;
  *(_WORD *)(v5 + 204) |= 0x400u;
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 1) == 0)
  {
LABEL_9:
    if ((v13 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_59;
  }
LABEL_58:
  *(_DWORD *)(v5 + 64) = self->_searchExecutionMethod;
  *(_WORD *)(v5 + 204) |= 1u;
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x80) == 0)
  {
LABEL_10:
    if ((v13 & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_59:
  *(_DWORD *)(v5 + 192) = self->_totalResults;
  *(_WORD *)(v5 + 204) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 196) = self->_totalResultsInSelectedSection;
    *(_WORD *)(v5 + 204) |= 0x100u;
  }
LABEL_12:
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  uint64_t v14 = self->_nonSelectedResultFeedIds;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v81 objects:v89 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v82;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v82 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = (void *)[*(id *)(*((void *)&v81 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addNonSelectedResultFeedId:v19];
      }
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v81 objects:v89 count:16];
    }
    while (v16);
  }

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    *(unsigned char *)(v5 + 200) = self->_didSelectResult;
    *(_WORD *)(v5 + 204) |= 0x200u;
  }
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  uint64_t v20 = self->_searchResults;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v77 objects:v88 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v78;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v78 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = (void *)[*(id *)(*((void *)&v77 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addSearchResults:v25];
      }
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v77 objects:v88 count:16];
    }
    while (v22);
  }

  uint64_t v26 = [(NSString *)self->_topResultFeedId copyWithZone:a3];
  v27 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v26;

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  uint64_t v28 = self->_topicResultFeedIds;
  uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v73 objects:v87 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v74;
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v74 != v31) {
          objc_enumerationMutation(v28);
        }
        long long v33 = (void *)[*(id *)(*((void *)&v73 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addTopicResultFeedIds:v33];
      }
      uint64_t v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v73 objects:v87 count:16];
    }
    while (v30);
  }

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v34 = self->_channelResultFeedIds;
  uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v69 objects:v86 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v70;
    do
    {
      for (uint64_t m = 0; m != v36; ++m)
      {
        if (*(void *)v70 != v37) {
          objc_enumerationMutation(v34);
        }
        long long v39 = (void *)[*(id *)(*((void *)&v69 + 1) + 8 * m) copyWithZone:a3];
        [(id)v5 addChannelResultFeedIds:v39];
      }
      uint64_t v36 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v69 objects:v86 count:16];
    }
    while (v36);
  }

  uint64_t v40 = [(NSString *)self->_storeFrontId copyWithZone:a3];
  long long v41 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v40;

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_searchResultSelectLocation;
    *(_WORD *)(v5 + 204) |= 4u;
  }
  uint64_t v42 = [(NSString *)self->_campaignId copyWithZone:a3];
  long long v43 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v42;

  uint64_t v44 = [(NSString *)self->_campaignType copyWithZone:a3];
  long long v45 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v44;

  uint64_t v46 = [(NSString *)self->_creativeId copyWithZone:a3];
  long long v47 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v46;

  uint64_t v48 = [(NSString *)self->_selectedResultArticleId copyWithZone:a3];
  long long v49 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v48;

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v50 = self->_articleResultArticleIds;
  uint64_t v51 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v65 objects:v85 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v66;
    do
    {
      for (uint64_t n = 0; n != v52; ++n)
      {
        if (*(void *)v66 != v53) {
          objc_enumerationMutation(v50);
        }
        v55 = objc_msgSend(*(id *)(*((void *)&v65 + 1) + 8 * n), "copyWithZone:", a3, (void)v65);
        [(id)v5 addArticleResultArticleIds:v55];
      }
      uint64_t v52 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v65 objects:v85 count:16];
    }
    while (v52);
  }

  uint64_t v56 = [(NSString *)self->_topResultArticleId copyWithZone:a3];
  uint64_t v57 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v56;

  uint64_t v58 = [(NSString *)self->_topResultChannelId copyWithZone:a3];
  v59 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v58;

  uint64_t v60 = [(NSString *)self->_topResultTopicId copyWithZone:a3];
  v61 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v60;

  uint64_t v62 = [(NSString *)self->_completedSearchString copyWithZone:a3];
  v63 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v62;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_100;
  }
  searchString = self->_searchString;
  if ((unint64_t)searchString | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](searchString, "isEqual:")) {
      goto LABEL_100;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)v4 + 102);
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_searchLocation != *((_DWORD *)v4 + 17)) {
      goto LABEL_100;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_100;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_selectedResultType != *((_DWORD *)v4 + 34)) {
      goto LABEL_100;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_100;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_selectedResultActionType != *((_DWORD *)v4 + 24)) {
      goto LABEL_100;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_100;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_selectedResultSection != *((_DWORD *)v4 + 31)) {
      goto LABEL_100;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_100;
  }
  selectedResultString = self->_selectedResultString;
  if ((unint64_t)selectedResultString | *((void *)v4 + 16)
    && !-[NSString isEqual:](selectedResultString, "isEqual:"))
  {
    goto LABEL_100;
  }
  selectedResultFeedId = self->_selectedResultFeedId;
  if ((unint64_t)selectedResultFeedId | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](selectedResultFeedId, "isEqual:")) {
      goto LABEL_100;
    }
  }
  __int16 v10 = (__int16)self->_has;
  __int16 v11 = *((_WORD *)v4 + 102);
  if ((v10 & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0 || self->_selectedResultRankInSection != *((_DWORD *)v4 + 30)) {
      goto LABEL_100;
    }
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 102) & 0x400) == 0) {
      goto LABEL_100;
    }
    if (self->_selectedResultShowMore)
    {
      if (!*((unsigned char *)v4 + 201)) {
        goto LABEL_100;
      }
    }
    else if (*((unsigned char *)v4 + 201))
    {
      goto LABEL_100;
    }
  }
  else if ((*((_WORD *)v4 + 102) & 0x400) != 0)
  {
    goto LABEL_100;
  }
  if (v10)
  {
    if ((v11 & 1) == 0 || self->_searchExecutionMethod != *((_DWORD *)v4 + 16)) {
      goto LABEL_100;
    }
  }
  else if (v11)
  {
    goto LABEL_100;
  }
  if ((v10 & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0 || self->_totalResults != *((_DWORD *)v4 + 48)) {
      goto LABEL_100;
    }
  }
  else if ((v11 & 0x80) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 102) & 0x100) == 0 || self->_totalResultsInSelectedSection != *((_DWORD *)v4 + 49)) {
      goto LABEL_100;
    }
  }
  else if ((*((_WORD *)v4 + 102) & 0x100) != 0)
  {
    goto LABEL_100;
  }
  nonSelectedResultFeedIds = self->_nonSelectedResultFeedIds;
  if ((unint64_t)nonSelectedResultFeedIds | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](nonSelectedResultFeedIds, "isEqual:")) {
      goto LABEL_100;
    }
    __int16 v10 = (__int16)self->_has;
  }
  if ((v10 & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 102) & 0x200) != 0)
    {
      if (self->_didSelectResult)
      {
        if (!*((unsigned char *)v4 + 200)) {
          goto LABEL_100;
        }
        goto LABEL_67;
      }
      if (!*((unsigned char *)v4 + 200)) {
        goto LABEL_67;
      }
    }
LABEL_100:
    char v28 = 0;
    goto LABEL_101;
  }
  if ((*((_WORD *)v4 + 102) & 0x200) != 0) {
    goto LABEL_100;
  }
LABEL_67:
  searchResults = self->_searchResults;
  if ((unint64_t)searchResults | *((void *)v4 + 10)
    && !-[NSMutableArray isEqual:](searchResults, "isEqual:"))
  {
    goto LABEL_100;
  }
  topResultFeedId = self->_topResultFeedId;
  if ((unint64_t)topResultFeedId | *((void *)v4 + 21))
  {
    if (!-[NSString isEqual:](topResultFeedId, "isEqual:")) {
      goto LABEL_100;
    }
  }
  topicResultFeedIds = self->_topicResultFeedIds;
  if ((unint64_t)topicResultFeedIds | *((void *)v4 + 23))
  {
    if (!-[NSMutableArray isEqual:](topicResultFeedIds, "isEqual:")) {
      goto LABEL_100;
    }
  }
  channelResultFeedIds = self->_channelResultFeedIds;
  if ((unint64_t)channelResultFeedIds | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](channelResultFeedIds, "isEqual:")) {
      goto LABEL_100;
    }
  }
  storeFrontId = self->_storeFrontId;
  if ((unint64_t)storeFrontId | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](storeFrontId, "isEqual:")) {
      goto LABEL_100;
    }
  }
  __int16 v18 = *((_WORD *)v4 + 102);
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    if ((v18 & 4) == 0 || self->_searchResultSelectLocation != *((_DWORD *)v4 + 18)) {
      goto LABEL_100;
    }
  }
  else if ((v18 & 4) != 0)
  {
    goto LABEL_100;
  }
  campaignId = self->_campaignId;
  if ((unint64_t)campaignId | *((void *)v4 + 2) && !-[NSString isEqual:](campaignId, "isEqual:")) {
    goto LABEL_100;
  }
  campaignType = self->_campaignType;
  if ((unint64_t)campaignType | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](campaignType, "isEqual:")) {
      goto LABEL_100;
    }
  }
  creativeId = self->_creativeId;
  if ((unint64_t)creativeId | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](creativeId, "isEqual:")) {
      goto LABEL_100;
    }
  }
  selectedResultArticleId = self->_selectedResultArticleId;
  if ((unint64_t)selectedResultArticleId | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](selectedResultArticleId, "isEqual:")) {
      goto LABEL_100;
    }
  }
  articleResultArticleIds = self->_articleResultArticleIds;
  if ((unint64_t)articleResultArticleIds | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](articleResultArticleIds, "isEqual:")) {
      goto LABEL_100;
    }
  }
  topResultArticleId = self->_topResultArticleId;
  if ((unint64_t)topResultArticleId | *((void *)v4 + 19))
  {
    if (!-[NSString isEqual:](topResultArticleId, "isEqual:")) {
      goto LABEL_100;
    }
  }
  topResultChannelId = self->_topResultChannelId;
  if ((unint64_t)topResultChannelId | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](topResultChannelId, "isEqual:")) {
      goto LABEL_100;
    }
  }
  topResultTopicId = self->_topResultTopicId;
  if ((unint64_t)topResultTopicId | *((void *)v4 + 22))
  {
    if (!-[NSString isEqual:](topResultTopicId, "isEqual:")) {
      goto LABEL_100;
    }
  }
  completedSearchString = self->_completedSearchString;
  if ((unint64_t)completedSearchString | *((void *)v4 + 5)) {
    char v28 = -[NSString isEqual:](completedSearchString, "isEqual:");
  }
  else {
    char v28 = 1;
  }
LABEL_101:

  return v28;
}

- (unint64_t)hash
{
  NSUInteger v34 = [(NSString *)self->_searchString hash];
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v33 = 2654435761 * self->_searchLocation;
    if ((has & 0x40) != 0)
    {
LABEL_3:
      uint64_t v32 = 2654435761 * self->_selectedResultType;
      if ((has & 8) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v31 = 0;
      if ((has & 0x20) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v33 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v32 = 0;
  if ((has & 8) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v31 = 2654435761 * self->_selectedResultActionType;
  if ((has & 0x20) != 0)
  {
LABEL_5:
    uint64_t v30 = 2654435761 * self->_selectedResultSection;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v30 = 0;
LABEL_10:
  NSUInteger v29 = [(NSString *)self->_selectedResultString hash];
  NSUInteger v28 = [(NSString *)self->_selectedResultFeedId hash];
  __int16 v4 = (__int16)self->_has;
  if ((v4 & 0x10) != 0)
  {
    uint64_t v27 = 2654435761 * self->_selectedResultRankInSection;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
LABEL_12:
      uint64_t v26 = 2654435761 * self->_selectedResultShowMore;
      if (v4) {
        goto LABEL_13;
      }
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v27 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_12;
    }
  }
  uint64_t v26 = 0;
  if (v4)
  {
LABEL_13:
    uint64_t v25 = 2654435761 * self->_searchExecutionMethod;
    if ((v4 & 0x80) != 0) {
      goto LABEL_14;
    }
LABEL_19:
    uint64_t v24 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_15;
    }
    goto LABEL_20;
  }
LABEL_18:
  uint64_t v25 = 0;
  if ((v4 & 0x80) == 0) {
    goto LABEL_19;
  }
LABEL_14:
  uint64_t v24 = 2654435761 * self->_totalResults;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_15:
    uint64_t v5 = 2654435761 * self->_totalResultsInSelectedSection;
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v5 = 0;
LABEL_21:
  uint64_t v6 = [(NSMutableArray *)self->_nonSelectedResultFeedIds hash];
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    uint64_t v7 = 2654435761 * self->_didSelectResult;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = [(NSMutableArray *)self->_searchResults hash];
  NSUInteger v9 = [(NSString *)self->_topResultFeedId hash];
  uint64_t v10 = [(NSMutableArray *)self->_topicResultFeedIds hash];
  uint64_t v11 = [(NSMutableArray *)self->_channelResultFeedIds hash];
  NSUInteger v12 = [(NSString *)self->_storeFrontId hash];
  if ((*(_WORD *)&self->_has & 4) != 0) {
    uint64_t v13 = 2654435761 * self->_searchResultSelectLocation;
  }
  else {
    uint64_t v13 = 0;
  }
  NSUInteger v14 = v33 ^ v34 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  NSUInteger v15 = [(NSString *)self->_campaignId hash];
  NSUInteger v16 = v15 ^ [(NSString *)self->_campaignType hash];
  NSUInteger v17 = v16 ^ [(NSString *)self->_creativeId hash];
  NSUInteger v18 = v17 ^ [(NSString *)self->_selectedResultArticleId hash];
  uint64_t v19 = v18 ^ [(NSMutableArray *)self->_articleResultArticleIds hash];
  NSUInteger v20 = v14 ^ v19 ^ [(NSString *)self->_topResultArticleId hash];
  NSUInteger v21 = [(NSString *)self->_topResultChannelId hash];
  NSUInteger v22 = v21 ^ [(NSString *)self->_topResultTopicId hash];
  return v20 ^ v22 ^ [(NSString *)self->_completedSearchString hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 11)) {
    -[NTPBSearchResultSelect setSearchString:](self, "setSearchString:");
  }
  __int16 v5 = *((_WORD *)v4 + 102);
  if ((v5 & 2) != 0)
  {
    self->_uint64_t searchLocation = *((_DWORD *)v4 + 17);
    *(_WORD *)&self->_has |= 2u;
    __int16 v5 = *((_WORD *)v4 + 102);
    if ((v5 & 0x40) == 0)
    {
LABEL_5:
      if ((v5 & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_80;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_5;
  }
  self->_selectedResultType = *((_DWORD *)v4 + 34);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 102);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_80:
  self->_selectedResultActionType = *((_DWORD *)v4 + 24);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v4 + 102) & 0x20) != 0)
  {
LABEL_7:
    self->_selectedResultSectiouint64_t n = *((_DWORD *)v4 + 31);
    *(_WORD *)&self->_has |= 0x20u;
  }
LABEL_8:
  if (*((void *)v4 + 16)) {
    -[NTPBSearchResultSelect setSelectedResultString:](self, "setSelectedResultString:");
  }
  if (*((void *)v4 + 14)) {
    -[NTPBSearchResultSelect setSelectedResultFeedId:](self, "setSelectedResultFeedId:");
  }
  __int16 v6 = *((_WORD *)v4 + 102);
  if ((v6 & 0x10) != 0)
  {
    self->_selectedResultRankInSectiouint64_t n = *((_DWORD *)v4 + 30);
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v6 = *((_WORD *)v4 + 102);
    if ((v6 & 0x400) == 0)
    {
LABEL_14:
      if ((v6 & 1) == 0) {
        goto LABEL_15;
      }
      goto LABEL_84;
    }
  }
  else if ((*((_WORD *)v4 + 102) & 0x400) == 0)
  {
    goto LABEL_14;
  }
  self->_selectedResultShowMore = *((unsigned char *)v4 + 201);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v6 = *((_WORD *)v4 + 102);
  if ((v6 & 1) == 0)
  {
LABEL_15:
    if ((v6 & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_85;
  }
LABEL_84:
  self->_uint64_t searchExecutionMethod = *((_DWORD *)v4 + 16);
  *(_WORD *)&self->_has |= 1u;
  __int16 v6 = *((_WORD *)v4 + 102);
  if ((v6 & 0x80) == 0)
  {
LABEL_16:
    if ((v6 & 0x100) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_85:
  self->_totalResults = *((_DWORD *)v4 + 48);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)v4 + 102) & 0x100) != 0)
  {
LABEL_17:
    self->_totalResultsInSelectedSectiouint64_t n = *((_DWORD *)v4 + 49);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_18:
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v7 = *((id *)v4 + 7);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v49 != v10) {
          objc_enumerationMutation(v7);
        }
        [(NTPBSearchResultSelect *)self addNonSelectedResultFeedId:*(void *)(*((void *)&v48 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v48 objects:v56 count:16];
    }
    while (v9);
  }

  if ((*((_WORD *)v4 + 102) & 0x200) != 0)
  {
    self->_didSelectResult = *((unsigned char *)v4 + 200);
    *(_WORD *)&self->_has |= 0x200u;
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v12 = *((id *)v4 + 10);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v44 objects:v55 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v45 != v15) {
          objc_enumerationMutation(v12);
        }
        [(NTPBSearchResultSelect *)self addSearchResults:*(void *)(*((void *)&v44 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v44 objects:v55 count:16];
    }
    while (v14);
  }

  if (*((void *)v4 + 21)) {
    -[NTPBSearchResultSelect setTopResultFeedId:](self, "setTopResultFeedId:");
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v17 = *((id *)v4 + 23);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v40 objects:v54 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v41;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v41 != v20) {
          objc_enumerationMutation(v17);
        }
        [(NTPBSearchResultSelect *)self addTopicResultFeedIds:*(void *)(*((void *)&v40 + 1) + 8 * k)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v40 objects:v54 count:16];
    }
    while (v19);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v22 = *((id *)v4 + 4);
  uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v53 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v37;
    do
    {
      for (uint64_t m = 0; m != v24; ++m)
      {
        if (*(void *)v37 != v25) {
          objc_enumerationMutation(v22);
        }
        [(NTPBSearchResultSelect *)self addChannelResultFeedIds:*(void *)(*((void *)&v36 + 1) + 8 * m)];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v36 objects:v53 count:16];
    }
    while (v24);
  }

  if (*((void *)v4 + 18)) {
    -[NTPBSearchResultSelect setStoreFrontId:](self, "setStoreFrontId:");
  }
  if ((*((_WORD *)v4 + 102) & 4) != 0)
  {
    self->_searchResultSelectLocatiouint64_t n = *((_DWORD *)v4 + 18);
    *(_WORD *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 2)) {
    -[NTPBSearchResultSelect setCampaignId:](self, "setCampaignId:");
  }
  if (*((void *)v4 + 3)) {
    -[NTPBSearchResultSelect setCampaignType:](self, "setCampaignType:");
  }
  if (*((void *)v4 + 6)) {
    -[NTPBSearchResultSelect setCreativeId:](self, "setCreativeId:");
  }
  if (*((void *)v4 + 13)) {
    -[NTPBSearchResultSelect setSelectedResultArticleId:](self, "setSelectedResultArticleId:");
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v27 = *((id *)v4 + 1);
  uint64_t v28 = [v27 countByEnumeratingWithState:&v32 objects:v52 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v33;
    do
    {
      for (uint64_t n = 0; n != v29; ++n)
      {
        if (*(void *)v33 != v30) {
          objc_enumerationMutation(v27);
        }
        -[NTPBSearchResultSelect addArticleResultArticleIds:](self, "addArticleResultArticleIds:", *(void *)(*((void *)&v32 + 1) + 8 * n), (void)v32);
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v32 objects:v52 count:16];
    }
    while (v29);
  }

  if (*((void *)v4 + 19)) {
    -[NTPBSearchResultSelect setTopResultArticleId:](self, "setTopResultArticleId:");
  }
  if (*((void *)v4 + 20)) {
    -[NTPBSearchResultSelect setTopResultChannelId:](self, "setTopResultChannelId:");
  }
  if (*((void *)v4 + 22)) {
    -[NTPBSearchResultSelect setTopResultTopicId:](self, "setTopResultTopicId:");
  }
  if (*((void *)v4 + 5)) {
    -[NTPBSearchResultSelect setCompletedSearchString:](self, "setCompletedSearchString:");
  }
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
}

- (NSString)selectedResultString
{
  return self->_selectedResultString;
}

- (void)setSelectedResultString:(id)a3
{
}

- (NSString)selectedResultFeedId
{
  return self->_selectedResultFeedId;
}

- (void)setSelectedResultFeedId:(id)a3
{
}

- (int)selectedResultRankInSection
{
  return self->_selectedResultRankInSection;
}

- (BOOL)selectedResultShowMore
{
  return self->_selectedResultShowMore;
}

- (int)totalResults
{
  return self->_totalResults;
}

- (int)totalResultsInSelectedSection
{
  return self->_totalResultsInSelectedSection;
}

- (NSMutableArray)nonSelectedResultFeedIds
{
  return self->_nonSelectedResultFeedIds;
}

- (void)setNonSelectedResultFeedIds:(id)a3
{
}

- (BOOL)didSelectResult
{
  return self->_didSelectResult;
}

- (NSMutableArray)searchResults
{
  return self->_searchResults;
}

- (void)setSearchResults:(id)a3
{
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

- (NSString)selectedResultArticleId
{
  return self->_selectedResultArticleId;
}

- (void)setSelectedResultArticleId:(id)a3
{
}

- (NSMutableArray)articleResultArticleIds
{
  return self->_articleResultArticleIds;
}

- (void)setArticleResultArticleIds:(id)a3
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
  objc_storeStrong((id *)&self->_selectedResultString, 0);
  objc_storeStrong((id *)&self->_selectedResultFeedId, 0);
  objc_storeStrong((id *)&self->_selectedResultArticleId, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_nonSelectedResultFeedIds, 0);
  objc_storeStrong((id *)&self->_creativeId, 0);
  objc_storeStrong((id *)&self->_completedSearchString, 0);
  objc_storeStrong((id *)&self->_channelResultFeedIds, 0);
  objc_storeStrong((id *)&self->_campaignType, 0);
  objc_storeStrong((id *)&self->_campaignId, 0);

  objc_storeStrong((id *)&self->_articleResultArticleIds, 0);
}

@end