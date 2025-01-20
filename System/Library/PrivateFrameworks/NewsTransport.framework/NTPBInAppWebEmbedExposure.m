@interface NTPBInAppWebEmbedExposure
- (BOOL)hasArticleDisplayRankInGroup;
- (BOOL)hasArticleId;
- (BOOL)hasDisplayRank;
- (BOOL)hasFeedType;
- (BOOL)hasFeedViewExposureId;
- (BOOL)hasGroupType;
- (BOOL)hasModuleEventType;
- (BOOL)hasModuleExposureId;
- (BOOL)hasModuleItemCount;
- (BOOL)hasModuleItemPosition;
- (BOOL)hasModuleLocation;
- (BOOL)hasWebEmbedId;
- (BOOL)hasWebEmbedLocation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)feedViewExposureId;
- (NSData)moduleExposureId;
- (NSString)articleId;
- (NSString)webEmbedId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)feedTypeAsString:(int)a3;
- (id)groupTypeAsString:(int)a3;
- (id)moduleEventTypeAsString:(int)a3;
- (id)moduleLocationAsString:(int)a3;
- (id)webEmbedLocationAsString:(int)a3;
- (int)StringAsFeedType:(id)a3;
- (int)StringAsGroupType:(id)a3;
- (int)StringAsModuleEventType:(id)a3;
- (int)StringAsModuleLocation:(id)a3;
- (int)StringAsWebEmbedLocation:(id)a3;
- (int)articleDisplayRankInGroup;
- (int)displayRank;
- (int)feedType;
- (int)groupType;
- (int)moduleEventType;
- (int)moduleItemCount;
- (int)moduleItemPosition;
- (int)moduleLocation;
- (int)webEmbedLocation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setArticleDisplayRankInGroup:(int)a3;
- (void)setArticleId:(id)a3;
- (void)setDisplayRank:(int)a3;
- (void)setFeedType:(int)a3;
- (void)setFeedViewExposureId:(id)a3;
- (void)setGroupType:(int)a3;
- (void)setHasArticleDisplayRankInGroup:(BOOL)a3;
- (void)setHasDisplayRank:(BOOL)a3;
- (void)setHasFeedType:(BOOL)a3;
- (void)setHasGroupType:(BOOL)a3;
- (void)setHasModuleEventType:(BOOL)a3;
- (void)setHasModuleItemCount:(BOOL)a3;
- (void)setHasModuleItemPosition:(BOOL)a3;
- (void)setHasModuleLocation:(BOOL)a3;
- (void)setHasWebEmbedLocation:(BOOL)a3;
- (void)setModuleEventType:(int)a3;
- (void)setModuleExposureId:(id)a3;
- (void)setModuleItemCount:(int)a3;
- (void)setModuleItemPosition:(int)a3;
- (void)setModuleLocation:(int)a3;
- (void)setWebEmbedId:(id)a3;
- (void)setWebEmbedLocation:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBInAppWebEmbedExposure

- (int)moduleEventType
{
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    return self->_moduleEventType;
  }
  else {
    return 0;
  }
}

- (void)setModuleEventType:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_moduleEventType = a3;
}

- (void)setHasModuleEventType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasModuleEventType
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)moduleEventTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_264448798[a3];
  }

  return v3;
}

- (int)StringAsModuleEventType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_MODULE_EVENT_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"BREAKING_NEWS_MODULE_EVENT_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SPECIAL_EVENTS_MODULE_EVENT_TYPE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)moduleLocation
{
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    return self->_moduleLocation;
  }
  else {
    return 0;
  }
}

- (void)setModuleLocation:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_moduleLocation = a3;
}

- (void)setHasModuleLocation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasModuleLocation
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)moduleLocationAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_2644487B0[a3];
  }

  return v3;
}

- (int)StringAsModuleLocation:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_MODULE_LOCATION"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FOR_YOU_MODULE_LOCATION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"IN_ARTICLE_MODULE_EVENT_TYPE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setModuleItemCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_moduleItemCount = a3;
}

- (void)setHasModuleItemCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasModuleItemCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasModuleExposureId
{
  return self->_moduleExposureId != 0;
}

- (BOOL)hasFeedViewExposureId
{
  return self->_feedViewExposureId != 0;
}

- (int)webEmbedLocation
{
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    return self->_webEmbedLocation;
  }
  else {
    return 0;
  }
}

- (void)setWebEmbedLocation:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_webEmbedLocation = a3;
}

- (void)setHasWebEmbedLocation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasWebEmbedLocation
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)webEmbedLocationAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_2644487C8[a3];
  }

  return v3;
}

- (int)StringAsWebEmbedLocation:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_WEB_EMBED_LOCATION"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"IN_MODULE_WEB_EMBED_LOCATION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"IN_ARTICLE_WEB_EMBED_LOCATION"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (void)setModuleItemPosition:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_moduleItemPosition = a3;
}

- (void)setHasModuleItemPosition:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasModuleItemPosition
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (BOOL)hasWebEmbedId
{
  return self->_webEmbedId != 0;
}

- (int)groupType
{
  if ((*(_WORD *)&self->_has & 8) != 0) {
    return self->_groupType;
  }
  else {
    return 0;
  }
}

- (void)setGroupType:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_groupType = a3;
}

- (void)setHasGroupType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasGroupType
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)groupTypeAsString:(int)a3
{
  if (a3 >= 0x28)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_2644487E0[a3];
  }

  return v3;
}

- (int)StringAsGroupType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_GROUP_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TOP_STORIES_GROUP_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TRENDING_STORIES_GROUP_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LATEST_STORIES_GROUP_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TOPIC_ARTICLES_GROUP_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"EDITORS_PICKS_GROUP_TYPE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"MORE_FROM_TOPIC_GROUP_TYPE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"CHANNEL_ARTICLES_GROUP_TYPE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"DAILY_BRIEFINGS_GROUP_TYPE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"GREAT_STORIES_YOU_MISSED_GROUP_TYPE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SAVED_STORIES_GROUP_TYPE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"MORE_FOR_YOU_GROUP_TYPE"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"PAID_SUBSCRIPTION_GROUP_TYPE"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"LATEST_AND_GREATEST_GROUP_TYPE"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"SUGGESTED_TOPICS_GROUP_TYPE"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"FEATURED_STORIES_GROUP_TYPE"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"TOP_VIDEOS_GROUP_TYPE"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"MORE_VIDEOS_GROUP_TYPE"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"SYMBOL_GROUP_TYPE"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"RECIRCULATION_GROUP_TYPE"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"MORE_FROM_PUB_GROUP_TYPE"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"RELATED_GROUP_TYPE"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"MY_MAGAZINES_GROUP_TYPE"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"FEATURED_ISSUE_GROUP_TYPE"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"ISSUES_GROUP_TYPE"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"FEATURED_ARTICLE_GROUP_TYPE"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"FEATURED_ISSUE_ARTICLE_GROUP_TYPE"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"RECOMMENDED_ISSUES_GROUP_TYPE"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"NEW_ISSUE_GROUP_TYPE"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"SPOTLIGHT_GROUP_TYPE"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"ARTICLE_LIST_GROUP_TYPE"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"ORDERED_ARTICLE_LIST_GROUP_TYPE"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"BEST_OF_BUNDLE_GROUP_TYPE"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"CURATED_GROUP_TYPE"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"NEWSPAPER_GROUP_TYPE"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"LOCAL_NEWS_GROUP_TYPE"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"AUDIO_UP_NEXT_GROUP_TYPE"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"AUDIO_FOR_YOU_GROUP_TYPE"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"AUDIO_RECENTLY_PLAYED_GROUP_TYPE"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"AUDIO_DAILY_BRIEFING_GROUP_TYPE"])
  {
    int v4 = 39;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)feedType
{
  if ((*(_WORD *)&self->_has & 4) != 0) {
    return self->_feedType;
  }
  else {
    return 0;
  }
}

- (void)setFeedType:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_feedType = a3;
}

- (void)setHasFeedType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasFeedType
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)feedTypeAsString:(int)a3
{
  if (a3 >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_264448920[a3];
  }

  return v3;
}

- (int)StringAsFeedType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_FEED_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FOR_YOU_FEED_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FAVORITES_FEED_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CHANNEL_FEED_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SECTION_FEED_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"TOPIC_FEED_TYPE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RELATED_FEED_TYPE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"MORE_PUB_ARTICLES_FEED_TYPE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"READING_HISTORY_FEED_TYPE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"READING_LIST_FEED_TYPE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"RECOMMENDED_FEED_TYPE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"ISSUE_FEED_TYPE"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"LIST_FEED_TYPE"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"DEBUG_FEED_TYPE"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"WIDGET_FEED_TYPE"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"SEARCH_RESULTS_FEED_TYPE"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"SYMBOL_FEED_TYPE"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"MAGAZINE_FEED_TYPE"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"CATEGORY_FEED_TYPE"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"MY_MAGAZINES_FEED_TYPE"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"END_OF_ARTICLE_FEED_TYPE"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"AUDIO_FEED_TYPE"])
  {
    int v4 = 21;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setDisplayRank:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_displayRank = a3;
}

- (void)setHasDisplayRank:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDisplayRank
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setArticleDisplayRankInGroup:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_articleDisplayRankInGroup = a3;
}

- (void)setHasArticleDisplayRankInGroup:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasArticleDisplayRankInGroup
{
  return *(_WORD *)&self->_has & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBInAppWebEmbedExposure;
  int v4 = [(NTPBInAppWebEmbedExposure *)&v8 description];
  v5 = [(NTPBInAppWebEmbedExposure *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    uint64_t moduleEventType = self->_moduleEventType;
    if (moduleEventType >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_moduleEventType);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_264448798[moduleEventType];
    }
    [v3 setObject:v6 forKey:@"module_event_type"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x80) != 0)
  {
    uint64_t moduleLocation = self->_moduleLocation;
    if (moduleLocation >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_moduleLocation);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_2644487B0[moduleLocation];
    }
    [v3 setObject:v8 forKey:@"module_location"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    v9 = [NSNumber numberWithInt:self->_moduleItemCount];
    [v3 setObject:v9 forKey:@"module_item_count"];
  }
  moduleExposureId = self->_moduleExposureId;
  if (moduleExposureId) {
    [v3 setObject:moduleExposureId forKey:@"module_exposure_id"];
  }
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId) {
    [v3 setObject:feedViewExposureId forKey:@"feed_view_exposure_id"];
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    uint64_t webEmbedLocation = self->_webEmbedLocation;
    if (webEmbedLocation >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_webEmbedLocation);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_2644487C8[webEmbedLocation];
    }
    [v3 setObject:v13 forKey:@"web_embed_location"];
  }
  articleId = self->_articleId;
  if (articleId) {
    [v3 setObject:articleId forKey:@"article_id"];
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    v15 = [NSNumber numberWithInt:self->_moduleItemPosition];
    [v3 setObject:v15 forKey:@"module_item_position"];
  }
  webEmbedId = self->_webEmbedId;
  if (webEmbedId) {
    [v3 setObject:webEmbedId forKey:@"web_embed_id"];
  }
  __int16 v17 = (__int16)self->_has;
  if ((v17 & 8) != 0)
  {
    uint64_t groupType = self->_groupType;
    if (groupType >= 0x28)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_groupType);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = off_2644487E0[groupType];
    }
    [v3 setObject:v21 forKey:@"group_type"];

    __int16 v17 = (__int16)self->_has;
    if ((v17 & 4) == 0)
    {
LABEL_30:
      if ((v17 & 2) == 0) {
        goto LABEL_31;
      }
      goto LABEL_44;
    }
  }
  else if ((v17 & 4) == 0)
  {
    goto LABEL_30;
  }
  uint64_t feedType = self->_feedType;
  if (feedType >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedType);
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = off_264448920[feedType];
  }
  [v3 setObject:v23 forKey:@"feed_type"];

  __int16 v17 = (__int16)self->_has;
  if ((v17 & 2) == 0)
  {
LABEL_31:
    if ((v17 & 1) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
LABEL_44:
  v24 = [NSNumber numberWithInt:self->_displayRank];
  [v3 setObject:v24 forKey:@"display_rank"];

  if (*(_WORD *)&self->_has)
  {
LABEL_32:
    v18 = [NSNumber numberWithInt:self->_articleDisplayRankInGroup];
    [v3 setObject:v18 forKey:@"article_display_rank_in_group"];
  }
LABEL_33:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBInAppWebEmbedExposureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
LABEL_4:
  }
    PBDataWriterWriteInt32Field();
LABEL_5:
  if (self->_moduleExposureId) {
    PBDataWriterWriteDataField();
  }
  if (self->_feedViewExposureId) {
    PBDataWriterWriteDataField();
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_articleId) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_webEmbedId) {
    PBDataWriterWriteStringField();
  }
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v5 = (__int16)self->_has;
    if ((v5 & 4) == 0)
    {
LABEL_19:
      if ((v5 & 2) == 0) {
        goto LABEL_20;
      }
      goto LABEL_30;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteInt32Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 2) == 0)
  {
LABEL_20:
    if ((v5 & 1) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_30:
  PBDataWriterWriteInt32Field();
  if (*(_WORD *)&self->_has) {
LABEL_21:
  }
    PBDataWriterWriteInt32Field();
LABEL_22:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 44) = self->_moduleEventType;
    *(_WORD *)(v5 + 84) |= 0x10u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 64) = self->_moduleLocation;
  *(_WORD *)(v5 + 84) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 56) = self->_moduleItemCount;
    *(_WORD *)(v5 + 84) |= 0x20u;
  }
LABEL_5:
  uint64_t v8 = [(NSData *)self->_moduleExposureId copyWithZone:a3];
  v9 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v8;

  uint64_t v10 = [(NSData *)self->_feedViewExposureId copyWithZone:a3];
  v11 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v10;

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *(_DWORD *)(v6 + 80) = self->_webEmbedLocation;
    *(_WORD *)(v6 + 84) |= 0x100u;
  }
  uint64_t v12 = [(NSString *)self->_articleId copyWithZone:a3];
  v13 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v12;

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 60) = self->_moduleItemPosition;
    *(_WORD *)(v6 + 84) |= 0x40u;
  }
  uint64_t v14 = [(NSString *)self->_webEmbedId copyWithZone:a3];
  v15 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v14;

  __int16 v16 = (__int16)self->_has;
  if ((v16 & 8) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_groupType;
    *(_WORD *)(v6 + 84) |= 8u;
    __int16 v16 = (__int16)self->_has;
    if ((v16 & 4) == 0)
    {
LABEL_11:
      if ((v16 & 2) == 0) {
        goto LABEL_12;
      }
LABEL_20:
      *(_DWORD *)(v6 + 24) = self->_displayRank;
      *(_WORD *)(v6 + 84) |= 2u;
      if ((*(_WORD *)&self->_has & 1) == 0) {
        return (id)v6;
      }
      goto LABEL_13;
    }
  }
  else if ((v16 & 4) == 0)
  {
    goto LABEL_11;
  }
  *(_DWORD *)(v6 + 28) = self->_feedType;
  *(_WORD *)(v6 + 84) |= 4u;
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 2) != 0) {
    goto LABEL_20;
  }
LABEL_12:
  if (v16)
  {
LABEL_13:
    *(_DWORD *)(v6 + 8) = self->_articleDisplayRankInGroup;
    *(_WORD *)(v6 + 84) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_57;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 42);
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_moduleEventType != *((_DWORD *)v4 + 11)) {
      goto LABEL_57;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_moduleLocation != *((_DWORD *)v4 + 16)) {
      goto LABEL_57;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_moduleItemCount != *((_DWORD *)v4 + 14)) {
      goto LABEL_57;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_57;
  }
  moduleExposureId = self->_moduleExposureId;
  if ((unint64_t)moduleExposureId | *((void *)v4 + 6)
    && !-[NSData isEqual:](moduleExposureId, "isEqual:"))
  {
    goto LABEL_57;
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](feedViewExposureId, "isEqual:")) {
      goto LABEL_57;
    }
  }
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 42) & 0x100) == 0 || self->_webEmbedLocation != *((_DWORD *)v4 + 20)) {
      goto LABEL_57;
    }
  }
  else if ((*((_WORD *)v4 + 42) & 0x100) != 0)
  {
    goto LABEL_57;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:")) {
      goto LABEL_57;
    }
    __int16 v9 = (__int16)self->_has;
  }
  __int16 v11 = *((_WORD *)v4 + 42);
  if ((v9 & 0x40) != 0)
  {
    if ((v11 & 0x40) == 0 || self->_moduleItemPosition != *((_DWORD *)v4 + 15)) {
      goto LABEL_57;
    }
  }
  else if ((v11 & 0x40) != 0)
  {
    goto LABEL_57;
  }
  webEmbedId = self->_webEmbedId;
  if ((unint64_t)webEmbedId | *((void *)v4 + 9))
  {
    if (-[NSString isEqual:](webEmbedId, "isEqual:"))
    {
      __int16 v9 = (__int16)self->_has;
      goto LABEL_37;
    }
LABEL_57:
    BOOL v14 = 0;
    goto LABEL_58;
  }
LABEL_37:
  __int16 v13 = *((_WORD *)v4 + 42);
  if ((v9 & 8) != 0)
  {
    if ((v13 & 8) == 0 || self->_groupType != *((_DWORD *)v4 + 10)) {
      goto LABEL_57;
    }
  }
  else if ((v13 & 8) != 0)
  {
    goto LABEL_57;
  }
  if ((v9 & 4) != 0)
  {
    if ((v13 & 4) == 0 || self->_feedType != *((_DWORD *)v4 + 7)) {
      goto LABEL_57;
    }
  }
  else if ((v13 & 4) != 0)
  {
    goto LABEL_57;
  }
  if ((v9 & 2) != 0)
  {
    if ((v13 & 2) == 0 || self->_displayRank != *((_DWORD *)v4 + 6)) {
      goto LABEL_57;
    }
  }
  else if ((v13 & 2) != 0)
  {
    goto LABEL_57;
  }
  if (v9)
  {
    if ((v13 & 1) == 0 || self->_articleDisplayRankInGroup != *((_DWORD *)v4 + 2)) {
      goto LABEL_57;
    }
    BOOL v14 = 1;
  }
  else
  {
    BOOL v14 = (v13 & 1) == 0;
  }
LABEL_58:

  return v14;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
    uint64_t v18 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((has & 0x20) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v18 = 2654435761 * self->_moduleEventType;
  if ((has & 0x80) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_moduleLocation;
  if ((has & 0x20) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_moduleItemCount;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v5 = 0;
LABEL_8:
  uint64_t v6 = [(NSData *)self->_moduleExposureId hash];
  uint64_t v7 = [(NSData *)self->_feedViewExposureId hash];
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    uint64_t v8 = 2654435761 * self->_webEmbedLocation;
  }
  else {
    uint64_t v8 = 0;
  }
  NSUInteger v9 = [(NSString *)self->_articleId hash];
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    uint64_t v10 = 2654435761 * self->_moduleItemPosition;
  }
  else {
    uint64_t v10 = 0;
  }
  NSUInteger v11 = [(NSString *)self->_webEmbedId hash];
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 8) != 0)
  {
    uint64_t v13 = 2654435761 * self->_groupType;
    if ((v12 & 4) != 0)
    {
LABEL_16:
      uint64_t v14 = 2654435761 * self->_feedType;
      if ((v12 & 2) != 0) {
        goto LABEL_17;
      }
LABEL_21:
      uint64_t v15 = 0;
      if (v12) {
        goto LABEL_18;
      }
LABEL_22:
      uint64_t v16 = 0;
      return v4 ^ v18 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16;
    }
  }
  else
  {
    uint64_t v13 = 0;
    if ((v12 & 4) != 0) {
      goto LABEL_16;
    }
  }
  uint64_t v14 = 0;
  if ((v12 & 2) == 0) {
    goto LABEL_21;
  }
LABEL_17:
  uint64_t v15 = 2654435761 * self->_displayRank;
  if ((v12 & 1) == 0) {
    goto LABEL_22;
  }
LABEL_18:
  uint64_t v16 = 2654435761 * self->_articleDisplayRankInGroup;
  return v4 ^ v18 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 42);
  if ((v5 & 0x10) != 0)
  {
    self->_uint64_t moduleEventType = *((_DWORD *)v4 + 11);
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v5 = *((_WORD *)v4 + 42);
    if ((v5 & 0x80) == 0)
    {
LABEL_3:
      if ((v5 & 0x20) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t moduleLocation = *((_DWORD *)v4 + 16);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)v4 + 42) & 0x20) != 0)
  {
LABEL_4:
    self->_moduleItemCount = *((_DWORD *)v4 + 14);
    *(_WORD *)&self->_has |= 0x20u;
  }
LABEL_5:
  id v7 = v4;
  if (*((void *)v4 + 6))
  {
    -[NTPBInAppWebEmbedExposure setModuleExposureId:](self, "setModuleExposureId:");
    id v4 = v7;
  }
  if (*((void *)v4 + 4))
  {
    -[NTPBInAppWebEmbedExposure setFeedViewExposureId:](self, "setFeedViewExposureId:");
    id v4 = v7;
  }
  if ((*((_WORD *)v4 + 42) & 0x100) != 0)
  {
    self->_uint64_t webEmbedLocation = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_has |= 0x100u;
  }
  if (*((void *)v4 + 2))
  {
    -[NTPBInAppWebEmbedExposure setArticleId:](self, "setArticleId:");
    id v4 = v7;
  }
  if ((*((_WORD *)v4 + 42) & 0x40) != 0)
  {
    self->_moduleItemPosition = *((_DWORD *)v4 + 15);
    *(_WORD *)&self->_has |= 0x40u;
  }
  if (*((void *)v4 + 9))
  {
    -[NTPBInAppWebEmbedExposure setWebEmbedId:](self, "setWebEmbedId:");
    id v4 = v7;
  }
  __int16 v6 = *((_WORD *)v4 + 42);
  if ((v6 & 8) != 0)
  {
    self->_uint64_t groupType = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 8u;
    __int16 v6 = *((_WORD *)v4 + 42);
    if ((v6 & 4) == 0)
    {
LABEL_19:
      if ((v6 & 2) == 0) {
        goto LABEL_20;
      }
      goto LABEL_30;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_19;
  }
  self->_uint64_t feedType = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 4u;
  __int16 v6 = *((_WORD *)v4 + 42);
  if ((v6 & 2) == 0)
  {
LABEL_20:
    if ((v6 & 1) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_30:
  self->_displayRank = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 2u;
  if (*((_WORD *)v4 + 42))
  {
LABEL_21:
    self->_articleDisplayRankInGroup = *((_DWORD *)v4 + 2);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_22:
}

- (int)moduleItemCount
{
  return self->_moduleItemCount;
}

- (NSData)moduleExposureId
{
  return self->_moduleExposureId;
}

- (void)setModuleExposureId:(id)a3
{
}

- (NSData)feedViewExposureId
{
  return self->_feedViewExposureId;
}

- (void)setFeedViewExposureId:(id)a3
{
}

- (NSString)articleId
{
  return self->_articleId;
}

- (void)setArticleId:(id)a3
{
}

- (int)moduleItemPosition
{
  return self->_moduleItemPosition;
}

- (NSString)webEmbedId
{
  return self->_webEmbedId;
}

- (void)setWebEmbedId:(id)a3
{
}

- (int)displayRank
{
  return self->_displayRank;
}

- (int)articleDisplayRankInGroup
{
  return self->_articleDisplayRankInGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webEmbedId, 0);
  objc_storeStrong((id *)&self->_moduleExposureId, 0);
  objc_storeStrong((id *)&self->_feedViewExposureId, 0);

  objc_storeStrong((id *)&self->_articleId, 0);
}

@end