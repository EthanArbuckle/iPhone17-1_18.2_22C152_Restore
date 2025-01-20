@interface NTPBTodayWidgetHeadlineExposure
- (BOOL)hasAlternateHeadline;
- (BOOL)hasArticleId;
- (BOOL)hasSourceChannelId;
- (BOOL)hasStoryType;
- (BOOL)hasWebEmbedId;
- (BOOL)hasWidgetArticleCount;
- (BOOL)hasWidgetArticleCountInSection;
- (BOOL)hasWidgetArticleRank;
- (BOOL)hasWidgetArticleRankInSection;
- (BOOL)hasWidgetContentType;
- (BOOL)hasWidgetExposureStackLocation;
- (BOOL)hasWidgetSectionDisplayRank;
- (BOOL)hasWidgetSectionId;
- (BOOL)hasWidgetSectionSubid;
- (BOOL)hasWidgetType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)articleId;
- (NSString)sourceChannelId;
- (NSString)storyType;
- (NSString)webEmbedId;
- (NSString)widgetSectionId;
- (NSString)widgetSectionSubid;
- (NTPBAlternateHeadline)alternateHeadline;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)widgetContentTypeAsString:(int)a3;
- (id)widgetExposureStackLocationAsString:(int)a3;
- (id)widgetTypeAsString:(int)a3;
- (int)StringAsWidgetContentType:(id)a3;
- (int)StringAsWidgetExposureStackLocation:(id)a3;
- (int)StringAsWidgetType:(id)a3;
- (int)widgetArticleCount;
- (int)widgetArticleCountInSection;
- (int)widgetArticleRank;
- (int)widgetArticleRankInSection;
- (int)widgetContentType;
- (int)widgetExposureStackLocation;
- (int)widgetSectionDisplayRank;
- (int)widgetType;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setAlternateHeadline:(id)a3;
- (void)setArticleId:(id)a3;
- (void)setHasWidgetArticleCount:(BOOL)a3;
- (void)setHasWidgetArticleCountInSection:(BOOL)a3;
- (void)setHasWidgetArticleRank:(BOOL)a3;
- (void)setHasWidgetArticleRankInSection:(BOOL)a3;
- (void)setHasWidgetContentType:(BOOL)a3;
- (void)setHasWidgetExposureStackLocation:(BOOL)a3;
- (void)setHasWidgetSectionDisplayRank:(BOOL)a3;
- (void)setHasWidgetType:(BOOL)a3;
- (void)setSourceChannelId:(id)a3;
- (void)setStoryType:(id)a3;
- (void)setWebEmbedId:(id)a3;
- (void)setWidgetArticleCount:(int)a3;
- (void)setWidgetArticleCountInSection:(int)a3;
- (void)setWidgetArticleRank:(int)a3;
- (void)setWidgetArticleRankInSection:(int)a3;
- (void)setWidgetContentType:(int)a3;
- (void)setWidgetExposureStackLocation:(int)a3;
- (void)setWidgetSectionDisplayRank:(int)a3;
- (void)setWidgetSectionId:(id)a3;
- (void)setWidgetSectionSubid:(id)a3;
- (void)setWidgetType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBTodayWidgetHeadlineExposure

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
  *(unsigned char *)&self->_has |= 0x40u;
  self->_widgetSectionDisplayRank = a3;
}

- (void)setHasWidgetSectionDisplayRank:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasWidgetSectionDisplayRank
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setWidgetArticleRankInSection:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_widgetArticleRankInSection = a3;
}

- (void)setHasWidgetArticleRankInSection:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasWidgetArticleRankInSection
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setWidgetArticleRank:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_widgetArticleRank = a3;
}

- (void)setHasWidgetArticleRank:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasWidgetArticleRank
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setWidgetArticleCount:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_widgetArticleCount = a3;
}

- (void)setHasWidgetArticleCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasWidgetArticleCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setWidgetArticleCountInSection:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_widgetArticleCountInSection = a3;
}

- (void)setHasWidgetArticleCountInSection:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWidgetArticleCountInSection
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)widgetContentType
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_widgetContentType;
  }
  else {
    return 0;
  }
}

- (void)setWidgetContentType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_widgetContentType = a3;
}

- (void)setHasWidgetContentType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasWidgetContentType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)widgetContentTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26444EF58[a3];
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

- (BOOL)hasAlternateHeadline
{
  return self->_alternateHeadline != 0;
}

- (int)widgetExposureStackLocation
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_widgetExposureStackLocation;
  }
  else {
    return 0;
  }
}

- (void)setWidgetExposureStackLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_widgetExposureStackLocation = a3;
}

- (void)setHasWidgetExposureStackLocation:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasWidgetExposureStackLocation
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)widgetExposureStackLocationAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26444EF70[a3];
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
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0) {
    return self->_widgetType;
  }
  else {
    return 0;
  }
}

- (void)setWidgetType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_widgetType = a3;
}

- (void)setHasWidgetType:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasWidgetType
{
  return *(unsigned char *)&self->_has >> 7;
}

- (id)widgetTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26444EFA0[a3];
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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBTodayWidgetHeadlineExposure;
  int v4 = [(NTPBTodayWidgetHeadlineExposure *)&v8 description];
  v5 = [(NTPBTodayWidgetHeadlineExposure *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  int v4 = v3;
  articleId = self->_articleId;
  if (articleId) {
    [v3 setObject:articleId forKey:@"article_id"];
  }
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId) {
    [v4 setObject:sourceChannelId forKey:@"source_channel_id"];
  }
  widgetSectionId = self->_widgetSectionId;
  if (widgetSectionId) {
    [v4 setObject:widgetSectionId forKey:@"widget_section_id"];
  }
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    v9 = [NSNumber numberWithInt:self->_widgetSectionDisplayRank];
    [v4 setObject:v9 forKey:@"widget_section_display_rank"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  v10 = [NSNumber numberWithInt:self->_widgetArticleRankInSection];
  [v4 setObject:v10 forKey:@"widget_article_rank_in_section"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_17;
  }
LABEL_16:
  v11 = [NSNumber numberWithInt:self->_widgetArticleRank];
  [v4 setObject:v11 forKey:@"widget_article_rank"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_11:
    if ((has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_18;
  }
LABEL_17:
  v12 = [NSNumber numberWithInt:self->_widgetArticleCount];
  [v4 setObject:v12 forKey:@"widget_article_count"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_23;
    }
    goto LABEL_19;
  }
LABEL_18:
  v13 = [NSNumber numberWithInt:self->_widgetArticleCountInSection];
  [v4 setObject:v13 forKey:@"widget_article_count_in_section"];

  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_23;
  }
LABEL_19:
  uint64_t widgetContentType = self->_widgetContentType;
  if (widgetContentType >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_widgetContentType);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = off_26444EF58[widgetContentType];
  }
  [v4 setObject:v15 forKey:@"widget_content_type"];

LABEL_23:
  webEmbedId = self->_webEmbedId;
  if (webEmbedId) {
    [v4 setObject:webEmbedId forKey:@"web_embed_id"];
  }
  alternateHeadline = self->_alternateHeadline;
  if (alternateHeadline)
  {
    v18 = [(NTPBAlternateHeadline *)alternateHeadline dictionaryRepresentation];
    [v4 setObject:v18 forKey:@"alternate_headline"];
  }
  char v19 = (char)self->_has;
  if ((v19 & 0x20) != 0)
  {
    uint64_t widgetExposureStackLocation = self->_widgetExposureStackLocation;
    if (widgetExposureStackLocation >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_widgetExposureStackLocation);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = off_26444EF70[widgetExposureStackLocation];
    }
    [v4 setObject:v21 forKey:@"widget_exposure_stack_location"];

    char v19 = (char)self->_has;
  }
  if (v19 < 0)
  {
    uint64_t widgetType = self->_widgetType;
    if (widgetType >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_widgetType);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = off_26444EFA0[widgetType];
    }
    [v4 setObject:v23 forKey:@"widget_type"];
  }
  widgetSectionSubid = self->_widgetSectionSubid;
  if (widgetSectionSubid) {
    [v4 setObject:widgetSectionSubid forKey:@"widget_section_subid"];
  }
  storyType = self->_storyType;
  if (storyType) {
    [v4 setObject:storyType forKey:@"story_type"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTodayWidgetHeadlineExposureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_articleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_sourceChannelId)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_widgetSectionId)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_31;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_11:
    if ((has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_33:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_13:
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
LABEL_14:
  if (self->_webEmbedId)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_alternateHeadline)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
    char v6 = (char)self->_has;
  }
  if (v6 < 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
  if (self->_widgetSectionSubid)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_storyType)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_articleId copyWithZone:a3];
  id v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_sourceChannelId copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_widgetSectionId copyWithZone:a3];
  v11 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v10;

  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_widgetSectionDisplayRank;
    *(unsigned char *)(v5 + 100) |= 0x40u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 60) = self->_widgetArticleRankInSection;
  *(unsigned char *)(v5 + 100) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  *(_DWORD *)(v5 + 56) = self->_widgetArticleRank;
  *(unsigned char *)(v5 + 100) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  *(_DWORD *)(v5 + 48) = self->_widgetArticleCount;
  *(unsigned char *)(v5 + 100) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_17:
  *(_DWORD *)(v5 + 52) = self->_widgetArticleCountInSection;
  *(unsigned char *)(v5 + 100) |= 2u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    *(_DWORD *)(v5 + 64) = self->_widgetContentType;
    *(unsigned char *)(v5 + 100) |= 0x10u;
  }
LABEL_8:
  uint64_t v13 = [(NSString *)self->_webEmbedId copyWithZone:a3];
  v14 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v13;

  id v15 = [(NTPBAlternateHeadline *)self->_alternateHeadline copyWithZone:a3];
  v16 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v15;

  char v17 = (char)self->_has;
  if ((v17 & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_widgetExposureStackLocation;
    *(unsigned char *)(v5 + 100) |= 0x20u;
    char v17 = (char)self->_has;
  }
  if (v17 < 0)
  {
    *(_DWORD *)(v5 + 96) = self->_widgetType;
    *(unsigned char *)(v5 + 100) |= 0x80u;
  }
  uint64_t v18 = [(NSString *)self->_widgetSectionSubid copyWithZone:a3];
  char v19 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v18;

  uint64_t v20 = [(NSString *)self->_storyType copyWithZone:a3];
  v21 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v20;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_55;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:")) {
      goto LABEL_55;
    }
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:")) {
      goto LABEL_55;
    }
  }
  widgetSectionId = self->_widgetSectionId;
  if ((unint64_t)widgetSectionId | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](widgetSectionId, "isEqual:")) {
      goto LABEL_55;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 0x40) == 0 || self->_widgetSectionDisplayRank != *((_DWORD *)v4 + 18)) {
      goto LABEL_55;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 0x40) != 0)
  {
    goto LABEL_55;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 8) == 0 || self->_widgetArticleRankInSection != *((_DWORD *)v4 + 15)) {
      goto LABEL_55;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 8) != 0)
  {
    goto LABEL_55;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 4) == 0 || self->_widgetArticleRank != *((_DWORD *)v4 + 14)) {
      goto LABEL_55;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 4) != 0)
  {
    goto LABEL_55;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 100) & 1) == 0 || self->_widgetArticleCount != *((_DWORD *)v4 + 12)) {
      goto LABEL_55;
    }
  }
  else if (*((unsigned char *)v4 + 100))
  {
    goto LABEL_55;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 2) == 0 || self->_widgetArticleCountInSection != *((_DWORD *)v4 + 13)) {
      goto LABEL_55;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 2) != 0)
  {
    goto LABEL_55;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 0x10) == 0 || self->_widgetContentType != *((_DWORD *)v4 + 16)) {
      goto LABEL_55;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 0x10) != 0)
  {
    goto LABEL_55;
  }
  webEmbedId = self->_webEmbedId;
  if ((unint64_t)webEmbedId | *((void *)v4 + 5) && !-[NSString isEqual:](webEmbedId, "isEqual:")) {
    goto LABEL_55;
  }
  alternateHeadline = self->_alternateHeadline;
  if ((unint64_t)alternateHeadline | *((void *)v4 + 1))
  {
    if (!-[NTPBAlternateHeadline isEqual:](alternateHeadline, "isEqual:")) {
      goto LABEL_55;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 0x20) == 0 || self->_widgetExposureStackLocation != *((_DWORD *)v4 + 17)) {
      goto LABEL_55;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 0x20) != 0)
  {
    goto LABEL_55;
  }
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 0x80) == 0 || self->_widgetType != *((_DWORD *)v4 + 24)) {
      goto LABEL_55;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 0x80) != 0)
  {
LABEL_55:
    char v12 = 0;
    goto LABEL_56;
  }
  widgetSectionSubid = self->_widgetSectionSubid;
  if ((unint64_t)widgetSectionSubid | *((void *)v4 + 11)
    && !-[NSString isEqual:](widgetSectionSubid, "isEqual:"))
  {
    goto LABEL_55;
  }
  storyType = self->_storyType;
  if ((unint64_t)storyType | *((void *)v4 + 4)) {
    char v12 = -[NSString isEqual:](storyType, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_56:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v20 = [(NSString *)self->_articleId hash];
  NSUInteger v19 = [(NSString *)self->_sourceChannelId hash];
  NSUInteger v3 = [(NSString *)self->_widgetSectionId hash];
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    uint64_t v4 = 2654435761 * self->_widgetSectionDisplayRank;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_widgetArticleRankInSection;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_widgetArticleRank;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_widgetArticleCount;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    uint64_t v8 = 2654435761 * self->_widgetArticleCountInSection;
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v8 = 0;
LABEL_12:
  uint64_t v9 = v7;
  NSUInteger v10 = v3;
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v11 = 2654435761 * self->_widgetContentType;
  }
  else {
    uint64_t v11 = 0;
  }
  NSUInteger v12 = [(NSString *)self->_webEmbedId hash];
  unint64_t v13 = [(NTPBAlternateHeadline *)self->_alternateHeadline hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    uint64_t v14 = 2654435761 * self->_widgetExposureStackLocation;
  }
  else {
    uint64_t v14 = 0;
  }
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
    uint64_t v15 = 2654435761 * self->_widgetType;
  }
  else {
    uint64_t v15 = 0;
  }
  NSUInteger v16 = v19 ^ v20 ^ v10 ^ v4 ^ v5 ^ v6 ^ v9 ^ v8 ^ v11 ^ v12 ^ v13;
  NSUInteger v17 = v14 ^ v15 ^ [(NSString *)self->_widgetSectionSubid hash];
  return v16 ^ v17 ^ [(NSString *)self->_storyType hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  uint64_t v9 = v4;
  if (*((void *)v4 + 2))
  {
    -[NTPBTodayWidgetHeadlineExposure setArticleId:](self, "setArticleId:");
    uint64_t v4 = v9;
  }
  if (*((void *)v4 + 3))
  {
    -[NTPBTodayWidgetHeadlineExposure setSourceChannelId:](self, "setSourceChannelId:");
    uint64_t v4 = v9;
  }
  if (*((void *)v4 + 10))
  {
    -[NTPBTodayWidgetHeadlineExposure setWidgetSectionId:](self, "setWidgetSectionId:");
    uint64_t v4 = v9;
  }
  char v5 = *((unsigned char *)v4 + 100);
  if ((v5 & 0x40) != 0)
  {
    self->_widgetSectionDisplayRank = v4[18];
    *(unsigned char *)&self->_has |= 0x40u;
    char v5 = *((unsigned char *)v4 + 100);
    if ((v5 & 8) == 0)
    {
LABEL_9:
      if ((v5 & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_21;
    }
  }
  else if ((v4[25] & 8) == 0)
  {
    goto LABEL_9;
  }
  self->_widgetArticleRankInSection = v4[15];
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 100);
  if ((v5 & 4) == 0)
  {
LABEL_10:
    if ((v5 & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_widgetArticleRank = v4[14];
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 100);
  if ((v5 & 1) == 0)
  {
LABEL_11:
    if ((v5 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_widgetArticleCount = v4[12];
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 100);
  if ((v5 & 2) == 0)
  {
LABEL_12:
    if ((v5 & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_23:
  self->_widgetArticleCountInSection = v4[13];
  *(unsigned char *)&self->_has |= 2u;
  if ((v4[25] & 0x10) != 0)
  {
LABEL_13:
    self->_uint64_t widgetContentType = v4[16];
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_14:
  if (*((void *)v4 + 5))
  {
    -[NTPBTodayWidgetHeadlineExposure setWebEmbedId:](self, "setWebEmbedId:");
    uint64_t v4 = v9;
  }
  alternateHeadline = self->_alternateHeadline;
  uint64_t v7 = *((void *)v4 + 1);
  if (alternateHeadline)
  {
    if (!v7) {
      goto LABEL_28;
    }
    -[NTPBAlternateHeadline mergeFrom:](alternateHeadline, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_28;
    }
    -[NTPBTodayWidgetHeadlineExposure setAlternateHeadline:](self, "setAlternateHeadline:");
  }
  uint64_t v4 = v9;
LABEL_28:
  char v8 = *((unsigned char *)v4 + 100);
  if ((v8 & 0x20) != 0)
  {
    self->_uint64_t widgetExposureStackLocation = v4[17];
    *(unsigned char *)&self->_has |= 0x20u;
    char v8 = *((unsigned char *)v4 + 100);
  }
  if (v8 < 0)
  {
    self->_uint64_t widgetType = v4[24];
    *(unsigned char *)&self->_has |= 0x80u;
  }
  if (*((void *)v4 + 11))
  {
    -[NTPBTodayWidgetHeadlineExposure setWidgetSectionSubid:](self, "setWidgetSectionSubid:");
    uint64_t v4 = v9;
  }
  if (*((void *)v4 + 4)) {
    -[NTPBTodayWidgetHeadlineExposure setStoryType:](self, "setStoryType:");
  }

  MEMORY[0x270F9A758]();
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

- (int)widgetArticleCountInSection
{
  return self->_widgetArticleCountInSection;
}

- (NSString)webEmbedId
{
  return self->_webEmbedId;
}

- (void)setWebEmbedId:(id)a3
{
}

- (NTPBAlternateHeadline)alternateHeadline
{
  return self->_alternateHeadline;
}

- (void)setAlternateHeadline:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetSectionSubid, 0);
  objc_storeStrong((id *)&self->_widgetSectionId, 0);
  objc_storeStrong((id *)&self->_webEmbedId, 0);
  objc_storeStrong((id *)&self->_storyType, 0);
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_articleId, 0);

  objc_storeStrong((id *)&self->_alternateHeadline, 0);
}

@end