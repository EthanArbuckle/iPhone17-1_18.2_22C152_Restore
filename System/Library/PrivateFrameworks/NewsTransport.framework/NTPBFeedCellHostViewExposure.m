@interface NTPBFeedCellHostViewExposure
- (BOOL)hasAreaPresentationReason;
- (BOOL)hasCampaignId;
- (BOOL)hasCampaignType;
- (BOOL)hasCreativeId;
- (BOOL)hasFeedCellHostType;
- (BOOL)hasPickFavsButtonExposed;
- (BOOL)hasTopicFeedId;
- (BOOL)hasUserAction;
- (BOOL)isEqual:(id)a3;
- (BOOL)pickFavsButtonExposed;
- (BOOL)readFrom:(id)a3;
- (NSString)campaignId;
- (NSString)campaignType;
- (NSString)creativeId;
- (NSString)topicFeedId;
- (id)areaPresentationReasonAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)feedCellHostTypeAsString:(int)a3;
- (int)StringAsAreaPresentationReason:(id)a3;
- (int)StringAsFeedCellHostType:(id)a3;
- (int)areaPresentationReason;
- (int)feedCellHostType;
- (int)userAction;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setAreaPresentationReason:(int)a3;
- (void)setCampaignId:(id)a3;
- (void)setCampaignType:(id)a3;
- (void)setCreativeId:(id)a3;
- (void)setFeedCellHostType:(int)a3;
- (void)setHasAreaPresentationReason:(BOOL)a3;
- (void)setHasFeedCellHostType:(BOOL)a3;
- (void)setHasPickFavsButtonExposed:(BOOL)a3;
- (void)setHasUserAction:(BOOL)a3;
- (void)setPickFavsButtonExposed:(BOOL)a3;
- (void)setTopicFeedId:(id)a3;
- (void)setUserAction:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBFeedCellHostViewExposure

- (int)feedCellHostType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_feedCellHostType;
  }
  else {
    return 0;
  }
}

- (void)setFeedCellHostType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_feedCellHostType = a3;
}

- (void)setHasFeedCellHostType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFeedCellHostType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)feedCellHostTypeAsString:(int)a3
{
  if (a3 >= 0x11)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_264449F40[a3];
  }

  return v3;
}

- (int)StringAsFeedCellHostType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_FEED_CELL_HOST_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"EXPLORE_FEED_CELL_HOST_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FAVORITES_FEED_CELL_HOST_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RECOMMENDATION_BRICK_FEED_CELL_HOST_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"DISCOVERY_WIDGET_FEED_CELL_HOST_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"DISCOVERY_WIDGET_FULL_VIEW_FEED_CELL_HOST_TYPE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ONBOARDING_PICKER_FEED_CELL_HOST_TYPE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"BROWSE_FEED_CELL_HOST_TYPE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SEARCH_FEED_CELL_HOST_TYPE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"TRENDING_WIDGET_FEED_CELL_HOST_TYPE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"EDITORS_PICKS_WIDGET_FEED_CELL_HOST_TYPE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"RELATED_TOPICS_WIDGET_FEED_CELL_HOST_TYPE"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"SUBSCRIPTION_DETECTION_SCREEN_FEED_CELL_HOST_TYPE"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"FAVORITES_SUGGESTIONS_SEE_ALL_FEED_CELL_HOST_TYPE"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"NOTIFICATIONS_SETTINGS_SCREEN_FOLLOWING_FEED_CELL_HOST_TYPE"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"MUTE_MANAGER_FEED_CELL_HOST_TYPE"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"TOC_FEED_CELL_HOST_TYPE"])
  {
    int v4 = 16;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)areaPresentationReason
{
  if (*(unsigned char *)&self->_has) {
    return self->_areaPresentationReason;
  }
  else {
    return 0;
  }
}

- (void)setAreaPresentationReason:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_areaPresentationReason = a3;
}

- (void)setHasAreaPresentationReason:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAreaPresentationReason
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)areaPresentationReasonAsString:(int)a3
{
  if (a3 >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_264449FC8[a3];
  }

  return v3;
}

- (int)StringAsAreaPresentationReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_AREA_PRESENTATION_REASON"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FROM_FOR_YOU_MAIN_AREA_PRESENTATION_REASON"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FROM_FAVORITES_MAIN_AREA_PRESENTATION_REASON"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FROM_FEED_IN_FAVORITES_AREA_PRESENTATION_REASON"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FROM_EXPLORE_MAIN_AREA_PRESENTATION_REASON"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FROM_FEED_IN_EXPLORE_EDITORS_PICKS_AREA_PRESENTATION_REASON"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FROM_FEED_IN_EXPLORE_RECOMMENDED_AREA_PRESENTATION_REASON"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"FROM_EXPLORE_BROWSE_MAIN_AREA_PRESENTATION_REASON"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"FROM_FEED_IN_EXPLORE_BROWSE_FEATURED_CHANNELS_AREA_PRESENTATION_REASON"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"FROM_FEED_IN_EXPLORE_BROWSE_FEATURED_TOPICS_AREA_PRESENTATION_REASON"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"FROM_FEED_IN_EXPLORE_BROWSE_CHANNELS_AREA_PRESENTATION_REASON"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"FROM_FEED_IN_EXPLORE_BROWSE_TOPICS_AREA_PRESENTATION_REASON"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"FROM_SEARCH_MAIN_AREA_PRESENTATION_REASON"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"FROM_FEED_IN_SEARCH_AREA_PRESENTATION_REASON"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"FROM_SEARCH_RESULTS_LIST_AREA_PRESENTATION_REASON"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"FROM_SAVED_MAIN_AREA_PRESENTATION_REASON"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"FROM_SAVED_HISTORY_AREA_PRESENTATION_REASON"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"FROM_DISCOVER_MORE_BUTTON_TAP_AREA_PRESENTATION_REASON"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"FROM_DISCOVER_MORE_BACK_TAP_AREA_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"FROM_ARTICLE_AREA_PRESENTATION_REASON"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"FROM_FEED_AREA_PRESENTATION_REASON"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"FROM_TOC_AREA_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 21;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasTopicFeedId
{
  return self->_topicFeedId != 0;
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

- (void)setPickFavsButtonExposed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_pickFavsButtonExposed = a3;
}

- (void)setHasPickFavsButtonExposed:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPickFavsButtonExposed
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (int)userAction
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_userAction;
  }
  else {
    return 0;
  }
}

- (void)setUserAction:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_userAction = a3;
}

- (void)setHasUserAction:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasUserAction
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBFeedCellHostViewExposure;
  int v4 = [(NTPBFeedCellHostViewExposure *)&v8 description];
  v5 = [(NTPBFeedCellHostViewExposure *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t feedCellHostType = self->_feedCellHostType;
    if (feedCellHostType >= 0x11)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedCellHostType);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_264449F40[feedCellHostType];
    }
    [v3 setObject:v6 forKey:@"feed_cell_host_type"];

    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t areaPresentationReason = self->_areaPresentationReason;
    if (areaPresentationReason >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_areaPresentationReason);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_264449FC8[areaPresentationReason];
    }
    [v3 setObject:v8 forKey:@"area_presentation_reason"];
  }
  topicFeedId = self->_topicFeedId;
  if (topicFeedId) {
    [v3 setObject:topicFeedId forKey:@"topic_feed_id"];
  }
  campaignId = self->_campaignId;
  if (campaignId) {
    [v3 setObject:campaignId forKey:@"campaign_id"];
  }
  campaignType = self->_campaignType;
  if (campaignType) {
    [v3 setObject:campaignType forKey:@"campaign_type"];
  }
  creativeId = self->_creativeId;
  if (creativeId) {
    [v3 setObject:creativeId forKey:@"creative_id"];
  }
  char v13 = (char)self->_has;
  if ((v13 & 8) != 0)
  {
    v14 = [NSNumber numberWithBool:self->_pickFavsButtonExposed];
    [v3 setObject:v14 forKey:@"pick_favs_button_exposed"];

    char v13 = (char)self->_has;
  }
  if ((v13 & 4) != 0)
  {
    v15 = [NSNumber numberWithInt:self->_userAction];
    [v3 setObject:v15 forKey:@"user_action"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBFeedCellHostViewExposureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_topicFeedId) {
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
  char v5 = (char)self->_has;
  if ((v5 & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v5 = (char)self->_has;
  }
  if ((v5 & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_feedCellHostType;
    *(unsigned char *)(v5 + 64) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 8) = self->_areaPresentationReason;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_topicFeedId copyWithZone:a3];
  v9 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v8;

  uint64_t v10 = [(NSString *)self->_campaignId copyWithZone:a3];
  v11 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v10;

  uint64_t v12 = [(NSString *)self->_campaignType copyWithZone:a3];
  char v13 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v12;

  uint64_t v14 = [(NSString *)self->_creativeId copyWithZone:a3];
  v15 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v14;

  char v16 = (char)self->_has;
  if ((v16 & 8) != 0)
  {
    *(unsigned char *)(v6 + 60) = self->_pickFavsButtonExposed;
    *(unsigned char *)(v6 + 64) |= 8u;
    char v16 = (char)self->_has;
  }
  if ((v16 & 4) != 0)
  {
    *(_DWORD *)(v6 + 56) = self->_userAction;
    *(unsigned char *)(v6 + 64) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_feedCellHostType != *((_DWORD *)v4 + 10)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    goto LABEL_32;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_areaPresentationReason != *((_DWORD *)v4 + 2)) {
      goto LABEL_32;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
    goto LABEL_32;
  }
  topicFeedId = self->_topicFeedId;
  if ((unint64_t)topicFeedId | *((void *)v4 + 6)
    && !-[NSString isEqual:](topicFeedId, "isEqual:"))
  {
    goto LABEL_32;
  }
  campaignId = self->_campaignId;
  if ((unint64_t)campaignId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](campaignId, "isEqual:")) {
      goto LABEL_32;
    }
  }
  campaignType = self->_campaignType;
  if ((unint64_t)campaignType | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](campaignType, "isEqual:")) {
      goto LABEL_32;
    }
  }
  creativeId = self->_creativeId;
  if ((unint64_t)creativeId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](creativeId, "isEqual:")) {
      goto LABEL_32;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 8) != 0)
    {
      if (self->_pickFavsButtonExposed)
      {
        if (!*((unsigned char *)v4 + 60)) {
          goto LABEL_32;
        }
        goto LABEL_28;
      }
      if (!*((unsigned char *)v4 + 60)) {
        goto LABEL_28;
      }
    }
LABEL_32:
    BOOL v9 = 0;
    goto LABEL_33;
  }
  if ((*((unsigned char *)v4 + 64) & 8) != 0) {
    goto LABEL_32;
  }
LABEL_28:
  BOOL v9 = (*((unsigned char *)v4 + 64) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 4) == 0 || self->_userAction != *((_DWORD *)v4 + 14)) {
      goto LABEL_32;
    }
    BOOL v9 = 1;
  }
LABEL_33:

  return v9;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_feedCellHostType;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_areaPresentationReason;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_topicFeedId hash];
  NSUInteger v6 = [(NSString *)self->_campaignId hash];
  NSUInteger v7 = [(NSString *)self->_campaignType hash];
  NSUInteger v8 = [(NSString *)self->_creativeId hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v9 = 2654435761 * self->_pickFavsButtonExposed;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_8;
    }
LABEL_10:
    uint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
  uint64_t v9 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_8:
  uint64_t v10 = 2654435761 * self->_userAction;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 64);
  if ((v5 & 2) != 0)
  {
    self->_uint64_t feedCellHostType = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 64);
  }
  if (v5)
  {
    self->_uint64_t areaPresentationReason = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  id v7 = v4;
  if (*((void *)v4 + 6))
  {
    -[NTPBFeedCellHostViewExposure setTopicFeedId:](self, "setTopicFeedId:");
    id v4 = v7;
  }
  if (*((void *)v4 + 2))
  {
    -[NTPBFeedCellHostViewExposure setCampaignId:](self, "setCampaignId:");
    id v4 = v7;
  }
  if (*((void *)v4 + 3))
  {
    -[NTPBFeedCellHostViewExposure setCampaignType:](self, "setCampaignType:");
    id v4 = v7;
  }
  if (*((void *)v4 + 4))
  {
    -[NTPBFeedCellHostViewExposure setCreativeId:](self, "setCreativeId:");
    id v4 = v7;
  }
  char v6 = *((unsigned char *)v4 + 64);
  if ((v6 & 8) != 0)
  {
    self->_pickFavsButtonExposed = *((unsigned char *)v4 + 60);
    *(unsigned char *)&self->_has |= 8u;
    char v6 = *((unsigned char *)v4 + 64);
  }
  if ((v6 & 4) != 0)
  {
    self->_userAction = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (NSString)topicFeedId
{
  return self->_topicFeedId;
}

- (void)setTopicFeedId:(id)a3
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

- (BOOL)pickFavsButtonExposed
{
  return self->_pickFavsButtonExposed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicFeedId, 0);
  objc_storeStrong((id *)&self->_creativeId, 0);
  objc_storeStrong((id *)&self->_campaignType, 0);

  objc_storeStrong((id *)&self->_campaignId, 0);
}

@end