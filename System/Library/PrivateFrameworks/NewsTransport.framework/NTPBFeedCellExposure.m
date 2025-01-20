@interface NTPBFeedCellExposure
- (BOOL)hasDisplayRankInSection;
- (BOOL)hasFeedCellHostExposureId;
- (BOOL)hasFeedCellHostType;
- (BOOL)hasFeedCellSection;
- (BOOL)hasFeedId;
- (BOOL)hasFeedType;
- (BOOL)hasIsUserSubscribedToFeed;
- (BOOL)hasViewFrameInScreen;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUserSubscribedToFeed;
- (BOOL)readFrom:(id)a3;
- (NSData)feedCellHostExposureId;
- (NSString)feedId;
- (NSString)viewFrameInScreen;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)feedCellHostTypeAsString:(int)a3;
- (id)feedCellSectionAsString:(int)a3;
- (id)feedTypeAsString:(int)a3;
- (int)StringAsFeedCellHostType:(id)a3;
- (int)StringAsFeedCellSection:(id)a3;
- (int)StringAsFeedType:(id)a3;
- (int)displayRankInSection;
- (int)feedCellHostType;
- (int)feedCellSection;
- (int)feedType;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setDisplayRankInSection:(int)a3;
- (void)setFeedCellHostExposureId:(id)a3;
- (void)setFeedCellHostType:(int)a3;
- (void)setFeedCellSection:(int)a3;
- (void)setFeedId:(id)a3;
- (void)setFeedType:(int)a3;
- (void)setHasDisplayRankInSection:(BOOL)a3;
- (void)setHasFeedCellHostType:(BOOL)a3;
- (void)setHasFeedCellSection:(BOOL)a3;
- (void)setHasFeedType:(BOOL)a3;
- (void)setHasIsUserSubscribedToFeed:(BOOL)a3;
- (void)setIsUserSubscribedToFeed:(BOOL)a3;
- (void)setViewFrameInScreen:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBFeedCellExposure

- (int)feedType
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_feedType;
  }
  else {
    return 0;
  }
}

- (void)setFeedType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_feedType = a3;
}

- (void)setHasFeedType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasFeedType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)feedTypeAsString:(int)a3
{
  if (a3 >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26444BE00[a3];
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

- (BOOL)hasFeedId
{
  return self->_feedId != 0;
}

- (void)setIsUserSubscribedToFeed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_isUserSubscribedToFeed = a3;
}

- (void)setHasIsUserSubscribedToFeed:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsUserSubscribedToFeed
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (int)feedCellSection
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_feedCellSection;
  }
  else {
    return 0;
  }
}

- (void)setFeedCellSection:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_feedCellSection = a3;
}

- (void)setHasFeedCellSection:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFeedCellSection
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)feedCellSectionAsString:(int)a3
{
  if (a3 >= 0x12)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26444BEB0[a3];
  }

  return v3;
}

- (int)StringAsFeedCellSection:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_FEED_CELL_SECTION"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"EXPLORE_SUGGESTED_CHANNELS_FEED_CELL_SECTION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EXPLORE_SUGGESTED_TOPICS_FEED_CELL_SECTION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BROWSE_FEATURED_CHANNELS_FEED_CELL_SECTION"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"BROWSE_FEATURED_TOPICS_FEED_CELL_SECTION"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"EXPLORE_FEATURED_FEED_CELL_SECTION"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"EXPLORE_SUGGESTED_FEED_CELL_SECTION"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SUGGESTIONS_FEED_CELL_SECTION"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"CHANNELS_FEED_CELL_SECTION"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"TOPICS_FEED_CELL_SECTION"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"NOTIFICATIONS_MORE_CHANNELS_FEED_CELL_SECTION"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"PAID_SUBSCRIPTIONS_FEED_CELL_SECTION"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"FOLLOWING_FEED_CELL_SECTION"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"BROWSE_FEED_CELL_SECTION"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"DISLIKED_CHANNELS_FEED_CELL_SECTION"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"SAVED_FEED_CELL_SECTION"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"HISTORY_FEED_CELL_SECTION"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"MAGAZINE_CATEGORY_FEED_CELL_SECTION"])
  {
    int v4 = 17;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setDisplayRankInSection:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_displayRankInSection = a3;
}

- (void)setHasDisplayRankInSection:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDisplayRankInSection
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasViewFrameInScreen
{
  return self->_viewFrameInScreen != 0;
}

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
    char v3 = off_26444BF40[a3];
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

- (BOOL)hasFeedCellHostExposureId
{
  return self->_feedCellHostExposureId != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBFeedCellExposure;
  int v4 = [(NTPBFeedCellExposure *)&v8 description];
  v5 = [(NTPBFeedCellExposure *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t feedType = self->_feedType;
    if (feedType >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_26444BE00[feedType];
    }
    [v3 setObject:v5 forKey:@"feed_type"];
  }
  feedId = self->_feedId;
  if (feedId) {
    [v3 setObject:feedId forKey:@"feed_id"];
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v12 = [NSNumber numberWithBool:self->_isUserSubscribedToFeed];
    [v3 setObject:v12 forKey:@"is_user_subscribed_to_feed"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_10:
      if ((has & 1) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_10;
  }
  uint64_t feedCellSection = self->_feedCellSection;
  if (feedCellSection >= 0x12)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedCellSection);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = off_26444BEB0[feedCellSection];
  }
  [v3 setObject:v14 forKey:@"feed_cell_section"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_11:
    objc_super v8 = [NSNumber numberWithInt:self->_displayRankInSection];
    [v3 setObject:v8 forKey:@"display_rank_in_section"];
  }
LABEL_12:
  viewFrameInScreen = self->_viewFrameInScreen;
  if (viewFrameInScreen) {
    [v3 setObject:viewFrameInScreen forKey:@"view_frame_in_screen"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t feedCellHostType = self->_feedCellHostType;
    if (feedCellHostType >= 0x11)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedCellHostType);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_26444BF40[feedCellHostType];
    }
    [v3 setObject:v11 forKey:@"feed_cell_host_type"];
  }
  feedCellHostExposureId = self->_feedCellHostExposureId;
  if (feedCellHostExposureId) {
    [v3 setObject:feedCellHostExposureId forKey:@"feed_cell_host_exposure_id"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBFeedCellExposureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_feedId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_8:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_9:
  if (self->_viewFrameInScreen)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_feedCellHostExposureId)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_feedType;
    *(unsigned char *)(v5 + 60) |= 8u;
  }
  uint64_t v7 = [(NSString *)self->_feedId copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v7;

  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(unsigned char *)(v6 + 56) = self->_isUserSubscribedToFeed;
    *(unsigned char *)(v6 + 60) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 28) = self->_feedCellSection;
  *(unsigned char *)(v6 + 60) |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    *(_DWORD *)(v6 + 8) = self->_displayRankInSection;
    *(unsigned char *)(v6 + 60) |= 1u;
  }
LABEL_7:
  uint64_t v10 = [(NSString *)self->_viewFrameInScreen copyWithZone:a3];
  v11 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v10;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_feedCellHostType;
    *(unsigned char *)(v6 + 60) |= 2u;
  }
  uint64_t v12 = [(NSData *)self->_feedCellHostExposureId copyWithZone:a3];
  v13 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v12;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_38;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 8) == 0 || self->_feedType != *((_DWORD *)v4 + 10)) {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 8) != 0)
  {
    goto LABEL_38;
  }
  feedId = self->_feedId;
  if ((unint64_t)feedId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](feedId, "isEqual:")) {
      goto LABEL_38;
    }
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 0x10) == 0) {
      goto LABEL_38;
    }
    if (self->_isUserSubscribedToFeed)
    {
      if (!*((unsigned char *)v4 + 56)) {
        goto LABEL_38;
      }
    }
    else if (*((unsigned char *)v4 + 56))
    {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 0x10) != 0)
  {
    goto LABEL_38;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) == 0 || self->_feedCellSection != *((_DWORD *)v4 + 7)) {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 4) != 0)
  {
    goto LABEL_38;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_displayRankInSection != *((_DWORD *)v4 + 2)) {
      goto LABEL_38;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_38;
  }
  viewFrameInScreen = self->_viewFrameInScreen;
  if ((unint64_t)viewFrameInScreen | *((void *)v4 + 6))
  {
    if (-[NSString isEqual:](viewFrameInScreen, "isEqual:"))
    {
      char has = (char)self->_has;
      goto LABEL_31;
    }
LABEL_38:
    char v9 = 0;
    goto LABEL_39;
  }
LABEL_31:
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_feedCellHostType != *((_DWORD *)v4 + 6)) {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_38;
  }
  feedCellHostExposureId = self->_feedCellHostExposureId;
  if ((unint64_t)feedCellHostExposureId | *((void *)v4 + 2)) {
    char v9 = -[NSData isEqual:](feedCellHostExposureId, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_39:

  return v9;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v3 = 2654435761 * self->_feedType;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_feedId hash];
  if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v6 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  uint64_t v5 = 2654435761 * self->_isUserSubscribedToFeed;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_feedCellSection;
  if (*(unsigned char *)&self->_has)
  {
LABEL_7:
    uint64_t v7 = 2654435761 * self->_displayRankInSection;
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v7 = 0;
LABEL_11:
  NSUInteger v8 = [(NSString *)self->_viewFrameInScreen hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v9 = 2654435761 * self->_feedCellHostType;
  }
  else {
    uint64_t v9 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ [(NSData *)self->_feedCellHostExposureId hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)v4 + 60) & 8) != 0)
  {
    self->_uint64_t feedType = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 8u;
  }
  id v6 = v4;
  if (*((void *)v4 + 4))
  {
    -[NTPBFeedCellExposure setFeedId:](self, "setFeedId:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 60);
  if ((v5 & 0x10) != 0)
  {
    self->_isUserSubscribedToFeed = *((unsigned char *)v4 + 56);
    *(unsigned char *)&self->_has |= 0x10u;
    char v5 = *((unsigned char *)v4 + 60);
    if ((v5 & 4) == 0)
    {
LABEL_7:
      if ((v5 & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 4) == 0)
  {
    goto LABEL_7;
  }
  self->_uint64_t feedCellSection = *((_DWORD *)v4 + 7);
  *(unsigned char *)&self->_has |= 4u;
  if (*((unsigned char *)v4 + 60))
  {
LABEL_8:
    self->_displayRankInSection = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_9:
  if (*((void *)v4 + 6))
  {
    -[NTPBFeedCellExposure setViewFrameInScreen:](self, "setViewFrameInScreen:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    self->_uint64_t feedCellHostType = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 2))
  {
    -[NTPBFeedCellExposure setFeedCellHostExposureId:](self, "setFeedCellHostExposureId:");
    id v4 = v6;
  }
}

- (NSString)feedId
{
  return self->_feedId;
}

- (void)setFeedId:(id)a3
{
}

- (BOOL)isUserSubscribedToFeed
{
  return self->_isUserSubscribedToFeed;
}

- (int)displayRankInSection
{
  return self->_displayRankInSection;
}

- (NSString)viewFrameInScreen
{
  return self->_viewFrameInScreen;
}

- (void)setViewFrameInScreen:(id)a3
{
}

- (NSData)feedCellHostExposureId
{
  return self->_feedCellHostExposureId;
}

- (void)setFeedCellHostExposureId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewFrameInScreen, 0);
  objc_storeStrong((id *)&self->_feedId, 0);

  objc_storeStrong((id *)&self->_feedCellHostExposureId, 0);
}

@end