@interface NTPBWidgetEngagement
+ (Class)otherVisibleSectionsType;
- (BOOL)hasArticleId;
- (BOOL)hasArticleViewingSessionId;
- (BOOL)hasContentFetchDate;
- (BOOL)hasContentId;
- (BOOL)hasEngagementId;
- (BOOL)hasEngagementTargetUrl;
- (BOOL)hasEntryId;
- (BOOL)hasSourceChannelId;
- (BOOL)hasStoryType;
- (BOOL)hasWebEmbedId;
- (BOOL)hasWidgetArticleCount;
- (BOOL)hasWidgetArticleCountInSection;
- (BOOL)hasWidgetArticleRank;
- (BOOL)hasWidgetArticleRankInSection;
- (BOOL)hasWidgetContentId;
- (BOOL)hasWidgetContentType;
- (BOOL)hasWidgetDisplayMode;
- (BOOL)hasWidgetEngagementType;
- (BOOL)hasWidgetExposureStackLocation;
- (BOOL)hasWidgetSectionDisplayRank;
- (BOOL)hasWidgetSectionId;
- (BOOL)hasWidgetSectionSubid;
- (BOOL)hasWidgetType;
- (BOOL)hasWidgetUserId;
- (BOOL)hasWidgetVideoPresentationReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)articleViewingSessionId;
- (NSMutableArray)otherVisibleSections;
- (NSString)articleId;
- (NSString)contentId;
- (NSString)engagementId;
- (NSString)engagementTargetUrl;
- (NSString)entryId;
- (NSString)sourceChannelId;
- (NSString)storyType;
- (NSString)webEmbedId;
- (NSString)widgetContentId;
- (NSString)widgetSectionId;
- (NSString)widgetSectionSubid;
- (NSString)widgetUserId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)otherVisibleSectionsAtIndex:(unint64_t)a3;
- (id)widgetContentTypeAsString:(int)a3;
- (id)widgetDisplayModeAsString:(int)a3;
- (id)widgetExposureStackLocationAsString:(int)a3;
- (id)widgetTypeAsString:(int)a3;
- (id)widgetVideoPresentationReasonAsString:(int)a3;
- (int)StringAsWidgetContentType:(id)a3;
- (int)StringAsWidgetDisplayMode:(id)a3;
- (int)StringAsWidgetExposureStackLocation:(id)a3;
- (int)StringAsWidgetType:(id)a3;
- (int)StringAsWidgetVideoPresentationReason:(id)a3;
- (int)widgetArticleCount;
- (int)widgetArticleCountInSection;
- (int)widgetArticleRank;
- (int)widgetArticleRankInSection;
- (int)widgetContentType;
- (int)widgetDisplayMode;
- (int)widgetEngagementType;
- (int)widgetExposureStackLocation;
- (int)widgetSectionDisplayRank;
- (int)widgetType;
- (int)widgetVideoPresentationReason;
- (int64_t)contentFetchDate;
- (unint64_t)hash;
- (unint64_t)otherVisibleSectionsCount;
- (void)addOtherVisibleSections:(id)a3;
- (void)clearOtherVisibleSections;
- (void)mergeFrom:(id)a3;
- (void)setArticleId:(id)a3;
- (void)setArticleViewingSessionId:(id)a3;
- (void)setContentFetchDate:(int64_t)a3;
- (void)setContentId:(id)a3;
- (void)setEngagementId:(id)a3;
- (void)setEngagementTargetUrl:(id)a3;
- (void)setEntryId:(id)a3;
- (void)setHasContentFetchDate:(BOOL)a3;
- (void)setHasWidgetArticleCount:(BOOL)a3;
- (void)setHasWidgetArticleCountInSection:(BOOL)a3;
- (void)setHasWidgetArticleRank:(BOOL)a3;
- (void)setHasWidgetArticleRankInSection:(BOOL)a3;
- (void)setHasWidgetContentType:(BOOL)a3;
- (void)setHasWidgetDisplayMode:(BOOL)a3;
- (void)setHasWidgetEngagementType:(BOOL)a3;
- (void)setHasWidgetExposureStackLocation:(BOOL)a3;
- (void)setHasWidgetSectionDisplayRank:(BOOL)a3;
- (void)setHasWidgetType:(BOOL)a3;
- (void)setHasWidgetVideoPresentationReason:(BOOL)a3;
- (void)setOtherVisibleSections:(id)a3;
- (void)setSourceChannelId:(id)a3;
- (void)setStoryType:(id)a3;
- (void)setWebEmbedId:(id)a3;
- (void)setWidgetArticleCount:(int)a3;
- (void)setWidgetArticleCountInSection:(int)a3;
- (void)setWidgetArticleRank:(int)a3;
- (void)setWidgetArticleRankInSection:(int)a3;
- (void)setWidgetContentId:(id)a3;
- (void)setWidgetContentType:(int)a3;
- (void)setWidgetDisplayMode:(int)a3;
- (void)setWidgetEngagementType:(int)a3;
- (void)setWidgetExposureStackLocation:(int)a3;
- (void)setWidgetSectionDisplayRank:(int)a3;
- (void)setWidgetSectionId:(id)a3;
- (void)setWidgetSectionSubid:(id)a3;
- (void)setWidgetType:(int)a3;
- (void)setWidgetUserId:(id)a3;
- (void)setWidgetVideoPresentationReason:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBWidgetEngagement

- (int)widgetEngagementType
{
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    return self->_widgetEngagementType;
  }
  else {
    return 0;
  }
}

- (void)setWidgetEngagementType:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_widgetEngagementType = a3;
}

- (void)setHasWidgetEngagementType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasWidgetEngagementType
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (BOOL)hasWidgetSectionId
{
  return self->_widgetSectionId != 0;
}

- (void)setWidgetSectionDisplayRank:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_widgetSectionDisplayRank = a3;
}

- (void)setHasWidgetSectionDisplayRank:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasWidgetSectionDisplayRank
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setWidgetArticleRankInSection:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_widgetArticleRankInSection = a3;
}

- (void)setHasWidgetArticleRankInSection:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasWidgetArticleRankInSection
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setWidgetArticleRank:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_widgetArticleRank = a3;
}

- (void)setHasWidgetArticleRank:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasWidgetArticleRank
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setWidgetArticleCount:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_widgetArticleCount = a3;
}

- (void)setHasWidgetArticleCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasWidgetArticleCount
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)clearOtherVisibleSections
{
}

- (void)addOtherVisibleSections:(id)a3
{
  id v4 = a3;
  otherVisibleSections = self->_otherVisibleSections;
  id v8 = v4;
  if (!otherVisibleSections)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_otherVisibleSections;
    self->_otherVisibleSections = v6;

    id v4 = v8;
    otherVisibleSections = self->_otherVisibleSections;
  }
  [(NSMutableArray *)otherVisibleSections addObject:v4];
}

- (unint64_t)otherVisibleSectionsCount
{
  return [(NSMutableArray *)self->_otherVisibleSections count];
}

- (id)otherVisibleSectionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_otherVisibleSections objectAtIndex:a3];
}

+ (Class)otherVisibleSectionsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasArticleViewingSessionId
{
  return self->_articleViewingSessionId != 0;
}

- (int)widgetVideoPresentationReason
{
  if ((*(_WORD *)&self->_has & 0x800) != 0) {
    return self->_widgetVideoPresentationReason;
  }
  else {
    return 0;
  }
}

- (void)setWidgetVideoPresentationReason:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_widgetVideoPresentationReason = a3;
}

- (void)setHasWidgetVideoPresentationReason:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasWidgetVideoPresentationReason
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (id)widgetVideoPresentationReasonAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_264448DF0[a3];
  }

  return v3;
}

- (int)StringAsWidgetVideoPresentationReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_WIDGET_VIDEO_PRESENTATION_REASON"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NEXT_VIDEO_TAP_WIDGET_VIDEO_PRESENTATION_REASON"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PREVIOUS_VIDEO_COMPLETED_WIDGET_VIDEO_PRESENTATION_REASON"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setWidgetArticleCountInSection:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_widgetArticleCountInSection = a3;
}

- (void)setHasWidgetArticleCountInSection:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasWidgetArticleCountInSection
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasWidgetUserId
{
  return self->_widgetUserId != 0;
}

- (int)widgetContentType
{
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    return self->_widgetContentType;
  }
  else {
    return 0;
  }
}

- (void)setWidgetContentType:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_widgetContentType = a3;
}

- (void)setHasWidgetContentType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasWidgetContentType
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)widgetContentTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_264448E08[a3];
  }

  return v3;
}

- (int)StringAsWidgetContentType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_WIDGET_CONTENT_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ARTICLE_HEADLINE_WIDGET_CONTENT_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WEB_EMBED_WIDGET_CONTENT_TYPE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasWebEmbedId
{
  return self->_webEmbedId != 0;
}

- (BOOL)hasEngagementTargetUrl
{
  return self->_engagementTargetUrl != 0;
}

- (BOOL)hasContentId
{
  return self->_contentId != 0;
}

- (void)setContentFetchDate:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_contentFetchDate = a3;
}

- (void)setHasContentFetchDate:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasContentFetchDate
{
  return *(_WORD *)&self->_has & 1;
}

- (int)widgetDisplayMode
{
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    return self->_widgetDisplayMode;
  }
  else {
    return 0;
  }
}

- (void)setWidgetDisplayMode:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_widgetDisplayMode = a3;
}

- (void)setHasWidgetDisplayMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasWidgetDisplayMode
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)widgetDisplayModeAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_264448E20[a3];
  }

  return v3;
}

- (int)StringAsWidgetDisplayMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_WIDGET_DISPLAY_MODE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"COMPACT_WIDGET_DISPLAY_MODE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EXPANDED_WIDGET_DISPLAY_MODE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TWO_BY_TWO_WIDGET_DISPLAY_MODE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TWO_BY_FOUR_WIDGET_DISPLAY_MODE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FOUR_BY_FOUR_WIDGET_DISPLAY_MODE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SIX_BY_FOUR_WIDGET_DISPLAY_MODE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"ONE_BY_TWO_WIDGET_DISPLAY_MODE"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasWidgetContentId
{
  return self->_widgetContentId != 0;
}

- (int)widgetExposureStackLocation
{
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    return self->_widgetExposureStackLocation;
  }
  else {
    return 0;
  }
}

- (void)setWidgetExposureStackLocation:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_widgetExposureStackLocation = a3;
}

- (void)setHasWidgetExposureStackLocation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasWidgetExposureStackLocation
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)widgetExposureStackLocationAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_264448E60[a3];
  }

  return v3;
}

- (int)StringAsWidgetExposureStackLocation:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_WIDGET_EXPOSURE_STACK_LOCATION"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TODAY_PAGE_WIDGET_EXPOSURE_STACK_LOCATION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"HOME_SCREEN_PAGE_ONE_WIDGET_EXPOSURE_STACK_LOCATION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"HOME_SCREEN_PAGE_TWO_WIDGET_EXPOSURE_STACK_LOCATION"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"HOME_SCREEN_PAGE_THREE_WIDGET_EXPOSURE_STACK_LOCATION"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"HOME_SCREEN_OTHER_PAGES_WIDGET_EXPOSURE_STACK_LOCATION"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)widgetType
{
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    return self->_widgetType;
  }
  else {
    return 0;
  }
}

- (void)setWidgetType:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_widgetType = a3;
}

- (void)setHasWidgetType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasWidgetType
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (id)widgetTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_264448E90[a3];
  }

  return v3;
}

- (int)StringAsWidgetType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_WIDGET_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PINNED_WIDGET_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SMART_STACK_WIDGET_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NON_SMART_STACK_WIDGET_TYPE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasWidgetSectionSubid
{
  return self->_widgetSectionSubid != 0;
}

- (BOOL)hasStoryType
{
  return self->_storyType != 0;
}

- (BOOL)hasEngagementId
{
  return self->_engagementId != 0;
}

- (BOOL)hasEntryId
{
  return self->_entryId != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBWidgetEngagement;
  int v4 = [(NTPBWidgetEngagement *)&v8 description];
  v5 = [(NTPBWidgetEngagement *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    int v4 = [NSNumber numberWithInt:self->_widgetEngagementType];
    [v3 setObject:v4 forKey:@"widget_engagement_type"];
  }
  articleId = self->_articleId;
  if (articleId) {
    [v3 setObject:articleId forKey:@"article_id"];
  }
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId) {
    [v3 setObject:sourceChannelId forKey:@"source_channel_id"];
  }
  widgetSectionId = self->_widgetSectionId;
  if (widgetSectionId) {
    [v3 setObject:widgetSectionId forKey:@"widget_section_id"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    v15 = [NSNumber numberWithInt:self->_widgetSectionDisplayRank];
    [v3 setObject:v15 forKey:@"widget_section_display_rank"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_11:
      if ((has & 8) == 0) {
        goto LABEL_12;
      }
      goto LABEL_23;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_11;
  }
  v16 = [NSNumber numberWithInt:self->_widgetArticleRankInSection];
  [v3 setObject:v16 forKey:@"widget_article_rank_in_section"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_23:
  v17 = [NSNumber numberWithInt:self->_widgetArticleRank];
  [v3 setObject:v17 forKey:@"widget_article_rank"];

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_13:
    v9 = [NSNumber numberWithInt:self->_widgetArticleCount];
    [v3 setObject:v9 forKey:@"widget_article_count"];
  }
LABEL_14:
  otherVisibleSections = self->_otherVisibleSections;
  if (otherVisibleSections) {
    [v3 setObject:otherVisibleSections forKey:@"other_visible_sections"];
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if (articleViewingSessionId) {
    [v3 setObject:articleViewingSessionId forKey:@"article_viewing_session_id"];
  }
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x800) != 0)
  {
    uint64_t widgetVideoPresentationReason = self->_widgetVideoPresentationReason;
    if (widgetVideoPresentationReason >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_widgetVideoPresentationReason);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_264448DF0[widgetVideoPresentationReason];
    }
    [v3 setObject:v14 forKey:@"widget_video_presentation_reason"];

    __int16 v12 = (__int16)self->_has;
  }
  if ((v12 & 4) != 0)
  {
    v18 = [NSNumber numberWithInt:self->_widgetArticleCountInSection];
    [v3 setObject:v18 forKey:@"widget_article_count_in_section"];
  }
  widgetUserId = self->_widgetUserId;
  if (widgetUserId) {
    [v3 setObject:widgetUserId forKey:@"widget_user_id"];
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    uint64_t widgetContentType = self->_widgetContentType;
    if (widgetContentType >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_widgetContentType);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = off_264448E08[widgetContentType];
    }
    [v3 setObject:v21 forKey:@"widget_content_type"];
  }
  webEmbedId = self->_webEmbedId;
  if (webEmbedId) {
    [v3 setObject:webEmbedId forKey:@"web_embed_id"];
  }
  engagementTargetUrl = self->_engagementTargetUrl;
  if (engagementTargetUrl) {
    [v3 setObject:engagementTargetUrl forKey:@"engagement_target_url"];
  }
  contentId = self->_contentId;
  if (contentId) {
    [v3 setObject:contentId forKey:@"content_id"];
  }
  __int16 v25 = (__int16)self->_has;
  if (v25)
  {
    v26 = [NSNumber numberWithLongLong:self->_contentFetchDate];
    [v3 setObject:v26 forKey:@"content_fetch_date"];

    __int16 v25 = (__int16)self->_has;
  }
  if ((v25 & 0x40) != 0)
  {
    uint64_t widgetDisplayMode = self->_widgetDisplayMode;
    if (widgetDisplayMode >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_widgetDisplayMode);
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = off_264448E20[widgetDisplayMode];
    }
    [v3 setObject:v28 forKey:@"widget_display_mode"];
  }
  widgetContentId = self->_widgetContentId;
  if (widgetContentId) {
    [v3 setObject:widgetContentId forKey:@"widget_content_id"];
  }
  __int16 v30 = (__int16)self->_has;
  if ((v30 & 0x100) != 0)
  {
    uint64_t widgetExposureStackLocation = self->_widgetExposureStackLocation;
    if (widgetExposureStackLocation >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_widgetExposureStackLocation);
      v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = off_264448E60[widgetExposureStackLocation];
    }
    [v3 setObject:v32 forKey:@"widget_exposure_stack_location"];

    __int16 v30 = (__int16)self->_has;
  }
  if ((v30 & 0x400) != 0)
  {
    uint64_t widgetType = self->_widgetType;
    if (widgetType >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_widgetType);
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = off_264448E90[widgetType];
    }
    [v3 setObject:v34 forKey:@"widget_type"];
  }
  widgetSectionSubid = self->_widgetSectionSubid;
  if (widgetSectionSubid) {
    [v3 setObject:widgetSectionSubid forKey:@"widget_section_subid"];
  }
  storyType = self->_storyType;
  if (storyType) {
    [v3 setObject:storyType forKey:@"story_type"];
  }
  engagementId = self->_engagementId;
  if (engagementId) {
    [v3 setObject:engagementId forKey:@"engagement_id"];
  }
  entryId = self->_entryId;
  if (entryId) {
    [v3 setObject:entryId forKey:@"entry_id"];
  }
  id v39 = v3;

  return v39;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBWidgetEngagementReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_articleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_sourceChannelId) {
    PBDataWriterWriteStringField();
  }
  if (self->_widgetSectionId) {
    PBDataWriterWriteStringField();
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_11:
      if ((has & 8) == 0) {
        goto LABEL_12;
      }
      goto LABEL_58;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_58:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 2) != 0) {
LABEL_13:
  }
    PBDataWriterWriteInt32Field();
LABEL_14:
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v6 = self->_otherVisibleSections;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  if (self->_articleViewingSessionId) {
    PBDataWriterWriteDataField();
  }
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x800) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v11 = (__int16)self->_has;
  }
  if ((v11 & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_widgetUserId) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_webEmbedId) {
    PBDataWriterWriteStringField();
  }
  if (self->_engagementTargetUrl) {
    PBDataWriterWriteStringField();
  }
  if (self->_contentId) {
    PBDataWriterWriteStringField();
  }
  __int16 v12 = (__int16)self->_has;
  if (v12)
  {
    PBDataWriterWriteInt64Field();
    __int16 v12 = (__int16)self->_has;
  }
  if ((v12 & 0x40) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_widgetContentId) {
    PBDataWriterWriteStringField();
  }
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x100) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v13 = (__int16)self->_has;
  }
  if ((v13 & 0x400) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_widgetSectionSubid) {
    PBDataWriterWriteStringField();
  }
  if (self->_storyType) {
    PBDataWriterWriteStringField();
  }
  if (self->_engagementId) {
    PBDataWriterWriteStringField();
  }
  if (self->_entryId) {
    PBDataWriterWriteStringField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 128) = self->_widgetEngagementType;
    *(_WORD *)(v5 + 180) |= 0x80u;
  }
  uint64_t v7 = [(NSString *)self->_articleId copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  uint64_t v9 = [(NSString *)self->_sourceChannelId copyWithZone:a3];
  v10 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v9;

  uint64_t v11 = [(NSString *)self->_widgetSectionId copyWithZone:a3];
  __int16 v12 = *(void **)(v6 + 144);
  *(void *)(v6 + 144) = v11;

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *(_DWORD *)(v6 + 136) = self->_widgetSectionDisplayRank;
    *(_WORD *)(v6 + 180) |= 0x200u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_32;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 108) = self->_widgetArticleRankInSection;
  *(_WORD *)(v6 + 180) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_32:
  *(_DWORD *)(v6 + 104) = self->_widgetArticleRank;
  *(_WORD *)(v6 + 180) |= 8u;
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_7:
    *(_DWORD *)(v6 + 96) = self->_widgetArticleCount;
    *(_WORD *)(v6 + 180) |= 2u;
  }
LABEL_8:
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v14 = self->_otherVisibleSections;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v45 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * i), "copyWithZone:", a3, (void)v44);
        [(id)v6 addOtherVisibleSections:v19];
      }
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v16);
  }

  uint64_t v20 = [(NSData *)self->_articleViewingSessionId copyWithZone:a3];
  v21 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v20;

  __int16 v22 = (__int16)self->_has;
  if ((v22 & 0x800) != 0)
  {
    *(_DWORD *)(v6 + 176) = self->_widgetVideoPresentationReason;
    *(_WORD *)(v6 + 180) |= 0x800u;
    __int16 v22 = (__int16)self->_has;
  }
  if ((v22 & 4) != 0)
  {
    *(_DWORD *)(v6 + 100) = self->_widgetArticleCountInSection;
    *(_WORD *)(v6 + 180) |= 4u;
  }
  uint64_t v23 = -[NSString copyWithZone:](self->_widgetUserId, "copyWithZone:", a3, (void)v44);
  v24 = *(void **)(v6 + 168);
  *(void *)(v6 + 168) = v23;

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 120) = self->_widgetContentType;
    *(_WORD *)(v6 + 180) |= 0x20u;
  }
  uint64_t v25 = [(NSString *)self->_webEmbedId copyWithZone:a3];
  v26 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v25;

  uint64_t v27 = [(NSString *)self->_engagementTargetUrl copyWithZone:a3];
  v28 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v27;

  uint64_t v29 = [(NSString *)self->_contentId copyWithZone:a3];
  __int16 v30 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v29;

  __int16 v31 = (__int16)self->_has;
  if (v31)
  {
    *(void *)(v6 + 8) = self->_contentFetchDate;
    *(_WORD *)(v6 + 180) |= 1u;
    __int16 v31 = (__int16)self->_has;
  }
  if ((v31 & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 124) = self->_widgetDisplayMode;
    *(_WORD *)(v6 + 180) |= 0x40u;
  }
  uint64_t v32 = [(NSString *)self->_widgetContentId copyWithZone:a3];
  v33 = *(void **)(v6 + 112);
  *(void *)(v6 + 112) = v32;

  __int16 v34 = (__int16)self->_has;
  if ((v34 & 0x100) != 0)
  {
    *(_DWORD *)(v6 + 132) = self->_widgetExposureStackLocation;
    *(_WORD *)(v6 + 180) |= 0x100u;
    __int16 v34 = (__int16)self->_has;
  }
  if ((v34 & 0x400) != 0)
  {
    *(_DWORD *)(v6 + 160) = self->_widgetType;
    *(_WORD *)(v6 + 180) |= 0x400u;
  }
  uint64_t v35 = [(NSString *)self->_widgetSectionSubid copyWithZone:a3];
  v36 = *(void **)(v6 + 152);
  *(void *)(v6 + 152) = v35;

  uint64_t v37 = [(NSString *)self->_storyType copyWithZone:a3];
  v38 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v37;

  uint64_t v39 = [(NSString *)self->_engagementId copyWithZone:a3];
  v40 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v39;

  uint64_t v41 = [(NSString *)self->_entryId copyWithZone:a3];
  v42 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v41;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_92;
  }
  __int16 v5 = *((_WORD *)v4 + 90);
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    if ((v5 & 0x80) == 0 || self->_widgetEngagementType != *((_DWORD *)v4 + 32)) {
      goto LABEL_92;
    }
  }
  else if ((v5 & 0x80) != 0)
  {
    goto LABEL_92;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((void *)v4 + 2) && !-[NSString isEqual:](articleId, "isEqual:")) {
    goto LABEL_92;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:")) {
      goto LABEL_92;
    }
  }
  widgetSectionId = self->_widgetSectionId;
  if ((unint64_t)widgetSectionId | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](widgetSectionId, "isEqual:")) {
      goto LABEL_92;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v10 = *((_WORD *)v4 + 90);
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 90) & 0x200) == 0 || self->_widgetSectionDisplayRank != *((_DWORD *)v4 + 34)) {
      goto LABEL_92;
    }
  }
  else if ((*((_WORD *)v4 + 90) & 0x200) != 0)
  {
    goto LABEL_92;
  }
  if ((has & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0 || self->_widgetArticleRankInSection != *((_DWORD *)v4 + 27)) {
      goto LABEL_92;
    }
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_92;
  }
  if ((has & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_widgetArticleRank != *((_DWORD *)v4 + 26)) {
      goto LABEL_92;
    }
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_92;
  }
  if ((has & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_widgetArticleCount != *((_DWORD *)v4 + 24)) {
      goto LABEL_92;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_92;
  }
  otherVisibleSections = self->_otherVisibleSections;
  if ((unint64_t)otherVisibleSections | *((void *)v4 + 8)
    && !-[NSMutableArray isEqual:](otherVisibleSections, "isEqual:"))
  {
    goto LABEL_92;
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:")) {
      goto LABEL_92;
    }
  }
  __int16 v13 = (__int16)self->_has;
  __int16 v14 = *((_WORD *)v4 + 90);
  if ((v13 & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 90) & 0x800) == 0 || self->_widgetVideoPresentationReason != *((_DWORD *)v4 + 44)) {
      goto LABEL_92;
    }
  }
  else if ((*((_WORD *)v4 + 90) & 0x800) != 0)
  {
    goto LABEL_92;
  }
  if ((v13 & 4) != 0)
  {
    if ((v14 & 4) == 0 || self->_widgetArticleCountInSection != *((_DWORD *)v4 + 25)) {
      goto LABEL_92;
    }
  }
  else if ((v14 & 4) != 0)
  {
    goto LABEL_92;
  }
  widgetUserId = self->_widgetUserId;
  if ((unint64_t)widgetUserId | *((void *)v4 + 21))
  {
    if (!-[NSString isEqual:](widgetUserId, "isEqual:")) {
      goto LABEL_92;
    }
    __int16 v13 = (__int16)self->_has;
  }
  __int16 v16 = *((_WORD *)v4 + 90);
  if ((v13 & 0x20) != 0)
  {
    if ((v16 & 0x20) == 0 || self->_widgetContentType != *((_DWORD *)v4 + 30)) {
      goto LABEL_92;
    }
  }
  else if ((v16 & 0x20) != 0)
  {
    goto LABEL_92;
  }
  webEmbedId = self->_webEmbedId;
  if ((unint64_t)webEmbedId | *((void *)v4 + 11)
    && !-[NSString isEqual:](webEmbedId, "isEqual:"))
  {
    goto LABEL_92;
  }
  engagementTargetUrl = self->_engagementTargetUrl;
  if ((unint64_t)engagementTargetUrl | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](engagementTargetUrl, "isEqual:")) {
      goto LABEL_92;
    }
  }
  contentId = self->_contentId;
  if ((unint64_t)contentId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](contentId, "isEqual:")) {
      goto LABEL_92;
    }
  }
  __int16 v20 = (__int16)self->_has;
  __int16 v21 = *((_WORD *)v4 + 90);
  if (v20)
  {
    if ((v21 & 1) == 0 || self->_contentFetchDate != *((void *)v4 + 1)) {
      goto LABEL_92;
    }
  }
  else if (v21)
  {
    goto LABEL_92;
  }
  if ((v20 & 0x40) != 0)
  {
    if ((v21 & 0x40) == 0 || self->_widgetDisplayMode != *((_DWORD *)v4 + 31)) {
      goto LABEL_92;
    }
  }
  else if ((v21 & 0x40) != 0)
  {
    goto LABEL_92;
  }
  widgetContentId = self->_widgetContentId;
  if ((unint64_t)widgetContentId | *((void *)v4 + 14))
  {
    if (-[NSString isEqual:](widgetContentId, "isEqual:"))
    {
      __int16 v20 = (__int16)self->_has;
      goto LABEL_74;
    }
LABEL_92:
    char v27 = 0;
    goto LABEL_93;
  }
LABEL_74:
  if ((v20 & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 90) & 0x100) == 0 || self->_widgetExposureStackLocation != *((_DWORD *)v4 + 33)) {
      goto LABEL_92;
    }
  }
  else if ((*((_WORD *)v4 + 90) & 0x100) != 0)
  {
    goto LABEL_92;
  }
  if ((v20 & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 90) & 0x400) == 0 || self->_widgetType != *((_DWORD *)v4 + 40)) {
      goto LABEL_92;
    }
  }
  else if ((*((_WORD *)v4 + 90) & 0x400) != 0)
  {
    goto LABEL_92;
  }
  widgetSectionSubid = self->_widgetSectionSubid;
  if ((unint64_t)widgetSectionSubid | *((void *)v4 + 19)
    && !-[NSString isEqual:](widgetSectionSubid, "isEqual:"))
  {
    goto LABEL_92;
  }
  storyType = self->_storyType;
  if ((unint64_t)storyType | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](storyType, "isEqual:")) {
      goto LABEL_92;
    }
  }
  engagementId = self->_engagementId;
  if ((unint64_t)engagementId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](engagementId, "isEqual:")) {
      goto LABEL_92;
    }
  }
  entryId = self->_entryId;
  if ((unint64_t)entryId | *((void *)v4 + 7)) {
    char v27 = -[NSString isEqual:](entryId, "isEqual:");
  }
  else {
    char v27 = 1;
  }
LABEL_93:

  return v27;
}

- (unint64_t)hash
{
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    uint64_t v33 = 2654435761 * self->_widgetEngagementType;
  }
  else {
    uint64_t v33 = 0;
  }
  NSUInteger v32 = [(NSString *)self->_articleId hash];
  NSUInteger v31 = [(NSString *)self->_sourceChannelId hash];
  NSUInteger v30 = [(NSString *)self->_widgetSectionId hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    uint64_t v29 = 2654435761 * self->_widgetSectionDisplayRank;
    if ((has & 0x10) != 0)
    {
LABEL_6:
      uint64_t v28 = 2654435761 * self->_widgetArticleRankInSection;
      if ((has & 8) != 0) {
        goto LABEL_7;
      }
LABEL_11:
      uint64_t v27 = 0;
      if ((has & 2) != 0) {
        goto LABEL_8;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v29 = 0;
    if ((has & 0x10) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v28 = 0;
  if ((has & 8) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v27 = 2654435761 * self->_widgetArticleRank;
  if ((has & 2) != 0)
  {
LABEL_8:
    uint64_t v26 = 2654435761 * self->_widgetArticleCount;
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v26 = 0;
LABEL_13:
  uint64_t v25 = [(NSMutableArray *)self->_otherVisibleSections hash];
  uint64_t v24 = [(NSData *)self->_articleViewingSessionId hash];
  __int16 v4 = (__int16)self->_has;
  if ((v4 & 0x800) != 0)
  {
    uint64_t v23 = 2654435761 * self->_widgetVideoPresentationReason;
    if ((v4 & 4) != 0) {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v23 = 0;
    if ((v4 & 4) != 0)
    {
LABEL_15:
      NSUInteger v5 = [(NSString *)self->_widgetUserId hash];
      goto LABEL_18;
    }
  }
  NSUInteger v5 = [(NSString *)self->_widgetUserId hash];
LABEL_18:
  NSUInteger v6 = v5;
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    uint64_t v7 = 2654435761 * self->_widgetContentType;
  }
  else {
    uint64_t v7 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_webEmbedId hash];
  NSUInteger v9 = [(NSString *)self->_engagementTargetUrl hash];
  NSUInteger v10 = [(NSString *)self->_contentId hash];
  __int16 v11 = (__int16)self->_has;
  if (v11)
  {
    uint64_t v12 = 2654435761 * self->_contentFetchDate;
    if ((v11 & 0x40) != 0) {
      goto LABEL_23;
    }
  }
  else
  {
    uint64_t v12 = 0;
    if ((v11 & 0x40) != 0)
    {
LABEL_23:
      uint64_t v13 = 2654435761 * self->_widgetDisplayMode;
      goto LABEL_26;
    }
  }
  uint64_t v13 = 0;
LABEL_26:
  NSUInteger v14 = [(NSString *)self->_widgetContentId hash];
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    uint64_t v15 = 2654435761 * self->_widgetExposureStackLocation;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_28;
    }
LABEL_30:
    uint64_t v16 = 0;
    goto LABEL_31;
  }
  uint64_t v15 = 0;
  if ((*(_WORD *)&self->_has & 0x400) == 0) {
    goto LABEL_30;
  }
LABEL_28:
  uint64_t v16 = 2654435761 * self->_widgetType;
LABEL_31:
  NSUInteger v17 = v32 ^ v33 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14;
  NSUInteger v18 = v15 ^ v16 ^ [(NSString *)self->_widgetSectionSubid hash];
  NSUInteger v19 = v18 ^ [(NSString *)self->_storyType hash];
  NSUInteger v20 = v19 ^ [(NSString *)self->_engagementId hash];
  return v17 ^ v20 ^ [(NSString *)self->_entryId hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  __int16 v4 = a3;
  id v5 = v4;
  if ((v4[45] & 0x80) != 0)
  {
    self->_widgetEngagementType = v4[32];
    *(_WORD *)&self->_has |= 0x80u;
  }
  if (*((void *)v4 + 2)) {
    -[NTPBWidgetEngagement setArticleId:](self, "setArticleId:");
  }
  if (*((void *)v5 + 9)) {
    -[NTPBWidgetEngagement setSourceChannelId:](self, "setSourceChannelId:");
  }
  if (*((void *)v5 + 18)) {
    -[NTPBWidgetEngagement setWidgetSectionId:](self, "setWidgetSectionId:");
  }
  __int16 v6 = *((_WORD *)v5 + 90);
  if ((v6 & 0x200) != 0)
  {
    self->_widgetSectionDisplayRank = *((_DWORD *)v5 + 34);
    *(_WORD *)&self->_has |= 0x200u;
    __int16 v6 = *((_WORD *)v5 + 90);
    if ((v6 & 0x10) == 0)
    {
LABEL_11:
      if ((v6 & 8) == 0) {
        goto LABEL_12;
      }
      goto LABEL_58;
    }
  }
  else if ((v6 & 0x10) == 0)
  {
    goto LABEL_11;
  }
  self->_widgetArticleRankInSection = *((_DWORD *)v5 + 27);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v6 = *((_WORD *)v5 + 90);
  if ((v6 & 8) == 0)
  {
LABEL_12:
    if ((v6 & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_58:
  self->_widgetArticleRank = *((_DWORD *)v5 + 26);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v5 + 90) & 2) != 0)
  {
LABEL_13:
    self->_widgetArticleCount = *((_DWORD *)v5 + 24);
    *(_WORD *)&self->_has |= 2u;
  }
LABEL_14:
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = *((id *)v5 + 8);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
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
        -[NTPBWidgetEngagement addOtherVisibleSections:](self, "addOtherVisibleSections:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  if (*((void *)v5 + 3)) {
    -[NTPBWidgetEngagement setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
  }
  __int16 v12 = *((_WORD *)v5 + 90);
  if ((v12 & 0x800) != 0)
  {
    self->_uint64_t widgetVideoPresentationReason = *((_DWORD *)v5 + 44);
    *(_WORD *)&self->_has |= 0x800u;
    __int16 v12 = *((_WORD *)v5 + 90);
  }
  if ((v12 & 4) != 0)
  {
    self->_widgetArticleCountInSection = *((_DWORD *)v5 + 25);
    *(_WORD *)&self->_has |= 4u;
  }
  if (*((void *)v5 + 21)) {
    -[NTPBWidgetEngagement setWidgetUserId:](self, "setWidgetUserId:");
  }
  if ((*((_WORD *)v5 + 90) & 0x20) != 0)
  {
    self->_uint64_t widgetContentType = *((_DWORD *)v5 + 30);
    *(_WORD *)&self->_has |= 0x20u;
  }
  if (*((void *)v5 + 11)) {
    -[NTPBWidgetEngagement setWebEmbedId:](self, "setWebEmbedId:");
  }
  if (*((void *)v5 + 6)) {
    -[NTPBWidgetEngagement setEngagementTargetUrl:](self, "setEngagementTargetUrl:");
  }
  if (*((void *)v5 + 4)) {
    -[NTPBWidgetEngagement setContentId:](self, "setContentId:");
  }
  __int16 v13 = *((_WORD *)v5 + 90);
  if (v13)
  {
    self->_contentFetchDate = *((void *)v5 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v13 = *((_WORD *)v5 + 90);
  }
  if ((v13 & 0x40) != 0)
  {
    self->_uint64_t widgetDisplayMode = *((_DWORD *)v5 + 31);
    *(_WORD *)&self->_has |= 0x40u;
  }
  if (*((void *)v5 + 14)) {
    -[NTPBWidgetEngagement setWidgetContentId:](self, "setWidgetContentId:");
  }
  __int16 v14 = *((_WORD *)v5 + 90);
  if ((v14 & 0x100) != 0)
  {
    self->_uint64_t widgetExposureStackLocation = *((_DWORD *)v5 + 33);
    *(_WORD *)&self->_has |= 0x100u;
    __int16 v14 = *((_WORD *)v5 + 90);
  }
  if ((v14 & 0x400) != 0)
  {
    self->_uint64_t widgetType = *((_DWORD *)v5 + 40);
    *(_WORD *)&self->_has |= 0x400u;
  }
  if (*((void *)v5 + 19)) {
    -[NTPBWidgetEngagement setWidgetSectionSubid:](self, "setWidgetSectionSubid:");
  }
  if (*((void *)v5 + 10)) {
    -[NTPBWidgetEngagement setStoryType:](self, "setStoryType:");
  }
  if (*((void *)v5 + 5)) {
    -[NTPBWidgetEngagement setEngagementId:](self, "setEngagementId:");
  }
  if (*((void *)v5 + 7)) {
    -[NTPBWidgetEngagement setEntryId:](self, "setEntryId:");
  }
}

- (NSString)articleId
{
  return self->_articleId;
}

- (void)setArticleId:(id)a3
{
}

- (NSString)sourceChannelId
{
  return self->_sourceChannelId;
}

- (void)setSourceChannelId:(id)a3
{
}

- (NSString)widgetSectionId
{
  return self->_widgetSectionId;
}

- (void)setWidgetSectionId:(id)a3
{
}

- (int)widgetSectionDisplayRank
{
  return self->_widgetSectionDisplayRank;
}

- (int)widgetArticleRankInSection
{
  return self->_widgetArticleRankInSection;
}

- (int)widgetArticleRank
{
  return self->_widgetArticleRank;
}

- (int)widgetArticleCount
{
  return self->_widgetArticleCount;
}

- (NSMutableArray)otherVisibleSections
{
  return self->_otherVisibleSections;
}

- (void)setOtherVisibleSections:(id)a3
{
}

- (NSData)articleViewingSessionId
{
  return self->_articleViewingSessionId;
}

- (void)setArticleViewingSessionId:(id)a3
{
}

- (int)widgetArticleCountInSection
{
  return self->_widgetArticleCountInSection;
}

- (NSString)widgetUserId
{
  return self->_widgetUserId;
}

- (void)setWidgetUserId:(id)a3
{
}

- (NSString)webEmbedId
{
  return self->_webEmbedId;
}

- (void)setWebEmbedId:(id)a3
{
}

- (NSString)engagementTargetUrl
{
  return self->_engagementTargetUrl;
}

- (void)setEngagementTargetUrl:(id)a3
{
}

- (NSString)contentId
{
  return self->_contentId;
}

- (void)setContentId:(id)a3
{
}

- (int64_t)contentFetchDate
{
  return self->_contentFetchDate;
}

- (NSString)widgetContentId
{
  return self->_widgetContentId;
}

- (void)setWidgetContentId:(id)a3
{
}

- (NSString)widgetSectionSubid
{
  return self->_widgetSectionSubid;
}

- (void)setWidgetSectionSubid:(id)a3
{
}

- (NSString)storyType
{
  return self->_storyType;
}

- (void)setStoryType:(id)a3
{
}

- (NSString)engagementId
{
  return self->_engagementId;
}

- (void)setEngagementId:(id)a3
{
}

- (NSString)entryId
{
  return self->_entryId;
}

- (void)setEntryId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetUserId, 0);
  objc_storeStrong((id *)&self->_widgetSectionSubid, 0);
  objc_storeStrong((id *)&self->_widgetSectionId, 0);
  objc_storeStrong((id *)&self->_widgetContentId, 0);
  objc_storeStrong((id *)&self->_webEmbedId, 0);
  objc_storeStrong((id *)&self->_storyType, 0);
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_otherVisibleSections, 0);
  objc_storeStrong((id *)&self->_entryId, 0);
  objc_storeStrong((id *)&self->_engagementTargetUrl, 0);
  objc_storeStrong((id *)&self->_engagementId, 0);
  objc_storeStrong((id *)&self->_contentId, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);

  objc_storeStrong((id *)&self->_articleId, 0);
}

@end