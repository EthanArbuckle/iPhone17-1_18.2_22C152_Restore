@interface NTPBArticleScroll
+ (Class)fractionalCohortMembershipType;
- (BOOL)adSupportedChannel;
- (BOOL)hasAdSupportedChannel;
- (BOOL)hasAlternateHeadline;
- (BOOL)hasArticleId;
- (BOOL)hasArticleSessionId;
- (BOOL)hasArticleViewingSessionId;
- (BOOL)hasFeedViewExposureId;
- (BOOL)hasIssueData;
- (BOOL)hasIssueExposureData;
- (BOOL)hasIssueViewData;
- (BOOL)hasReferencedArticleId;
- (BOOL)hasScrollHostViewType;
- (BOOL)hasScrollVelocity;
- (BOOL)hasScrollingVelocity;
- (BOOL)hasSectionHeadlineId;
- (BOOL)hasSourceChannelId;
- (BOOL)hasVerticalScrollPositionEnd;
- (BOOL)hasVerticalScrollPositionEnding;
- (BOOL)hasVerticalScrollPositionStart;
- (BOOL)hasVerticalScrollPositionStarting;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)articleSessionId;
- (NSData)articleViewingSessionId;
- (NSData)feedViewExposureId;
- (NSMutableArray)fractionalCohortMemberships;
- (NSString)articleId;
- (NSString)referencedArticleId;
- (NSString)scrollVelocity;
- (NSString)sectionHeadlineId;
- (NSString)sourceChannelId;
- (NSString)verticalScrollPositionEnd;
- (NSString)verticalScrollPositionStart;
- (NTPBAlternateHeadline)alternateHeadline;
- (NTPBIssueData)issueData;
- (NTPBIssueExposureData)issueExposureData;
- (NTPBIssueViewData)issueViewData;
- (float)scrollingVelocity;
- (float)verticalScrollPositionEnding;
- (float)verticalScrollPositionStarting;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)fractionalCohortMembershipAtIndex:(unint64_t)a3;
- (int)scrollHostViewType;
- (unint64_t)fractionalCohortMembershipsCount;
- (unint64_t)hash;
- (void)addFractionalCohortMembership:(id)a3;
- (void)clearFractionalCohortMemberships;
- (void)mergeFrom:(id)a3;
- (void)setAdSupportedChannel:(BOOL)a3;
- (void)setAlternateHeadline:(id)a3;
- (void)setArticleId:(id)a3;
- (void)setArticleSessionId:(id)a3;
- (void)setArticleViewingSessionId:(id)a3;
- (void)setFeedViewExposureId:(id)a3;
- (void)setFractionalCohortMemberships:(id)a3;
- (void)setHasAdSupportedChannel:(BOOL)a3;
- (void)setHasScrollHostViewType:(BOOL)a3;
- (void)setHasScrollingVelocity:(BOOL)a3;
- (void)setHasVerticalScrollPositionEnding:(BOOL)a3;
- (void)setHasVerticalScrollPositionStarting:(BOOL)a3;
- (void)setIssueData:(id)a3;
- (void)setIssueExposureData:(id)a3;
- (void)setIssueViewData:(id)a3;
- (void)setReferencedArticleId:(id)a3;
- (void)setScrollHostViewType:(int)a3;
- (void)setScrollVelocity:(id)a3;
- (void)setScrollingVelocity:(float)a3;
- (void)setSectionHeadlineId:(id)a3;
- (void)setSourceChannelId:(id)a3;
- (void)setVerticalScrollPositionEnd:(id)a3;
- (void)setVerticalScrollPositionEnding:(float)a3;
- (void)setVerticalScrollPositionStart:(id)a3;
- (void)setVerticalScrollPositionStarting:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBArticleScroll

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (BOOL)hasReferencedArticleId
{
  return self->_referencedArticleId != 0;
}

- (BOOL)hasArticleSessionId
{
  return self->_articleSessionId != 0;
}

- (BOOL)hasArticleViewingSessionId
{
  return self->_articleViewingSessionId != 0;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (int)scrollHostViewType
{
  if (*(unsigned char *)&self->_has) {
    return self->_scrollHostViewType;
  }
  else {
    return 0;
  }
}

- (void)setScrollHostViewType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_scrollHostViewType = a3;
}

- (void)setHasScrollHostViewType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasScrollHostViewType
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasVerticalScrollPositionStart
{
  return self->_verticalScrollPositionStart != 0;
}

- (BOOL)hasVerticalScrollPositionEnd
{
  return self->_verticalScrollPositionEnd != 0;
}

- (BOOL)hasScrollVelocity
{
  return self->_scrollVelocity != 0;
}

- (BOOL)hasFeedViewExposureId
{
  return self->_feedViewExposureId != 0;
}

- (void)setAdSupportedChannel:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_adSupportedChannel = a3;
}

- (void)setHasAdSupportedChannel:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasAdSupportedChannel
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasSectionHeadlineId
{
  return self->_sectionHeadlineId != 0;
}

- (void)setVerticalScrollPositionStarting:(float)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_verticalScrollPositionStarting = a3;
}

- (void)setHasVerticalScrollPositionStarting:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasVerticalScrollPositionStarting
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setVerticalScrollPositionEnding:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_verticalScrollPositionEnding = a3;
}

- (void)setHasVerticalScrollPositionEnding:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVerticalScrollPositionEnding
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setScrollingVelocity:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_scrollingVelocity = a3;
}

- (void)setHasScrollingVelocity:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasScrollingVelocity
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearFractionalCohortMemberships
{
}

- (void)addFractionalCohortMembership:(id)a3
{
  id v4 = a3;
  fractionalCohortMemberships = self->_fractionalCohortMemberships;
  id v8 = v4;
  if (!fractionalCohortMemberships)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_fractionalCohortMemberships;
    self->_fractionalCohortMemberships = v6;

    id v4 = v8;
    fractionalCohortMemberships = self->_fractionalCohortMemberships;
  }
  [(NSMutableArray *)fractionalCohortMemberships addObject:v4];
}

- (unint64_t)fractionalCohortMembershipsCount
{
  return [(NSMutableArray *)self->_fractionalCohortMemberships count];
}

- (id)fractionalCohortMembershipAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_fractionalCohortMemberships objectAtIndex:a3];
}

+ (Class)fractionalCohortMembershipType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAlternateHeadline
{
  return self->_alternateHeadline != 0;
}

- (BOOL)hasIssueData
{
  return self->_issueData != 0;
}

- (BOOL)hasIssueViewData
{
  return self->_issueViewData != 0;
}

- (BOOL)hasIssueExposureData
{
  return self->_issueExposureData != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBArticleScroll;
  id v4 = [(NTPBArticleScroll *)&v8 description];
  v5 = [(NTPBArticleScroll *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  v5 = v3;
  articleId = self->_articleId;
  if (articleId) {
    [v3 setObject:articleId forKey:@"article_id"];
  }
  referencedArticleId = self->_referencedArticleId;
  if (referencedArticleId) {
    [v5 setObject:referencedArticleId forKey:@"referenced_article_id"];
  }
  articleSessionId = self->_articleSessionId;
  if (articleSessionId) {
    [v5 setObject:articleSessionId forKey:@"article_session_id"];
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if (articleViewingSessionId) {
    [v5 setObject:articleViewingSessionId forKey:@"article_viewing_session_id"];
  }
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId) {
    [v5 setObject:sourceChannelId forKey:@"source_channel_id"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v11 = [NSNumber numberWithInt:self->_scrollHostViewType];
    [v5 setObject:v11 forKey:@"scroll_host_view_type"];
  }
  verticalScrollPositionStart = self->_verticalScrollPositionStart;
  if (verticalScrollPositionStart) {
    [v5 setObject:verticalScrollPositionStart forKey:@"vertical_scroll_position_start"];
  }
  verticalScrollPositionEnd = self->_verticalScrollPositionEnd;
  if (verticalScrollPositionEnd) {
    [v5 setObject:verticalScrollPositionEnd forKey:@"vertical_scroll_position_end"];
  }
  scrollVelocity = self->_scrollVelocity;
  if (scrollVelocity) {
    [v5 setObject:scrollVelocity forKey:@"scroll_velocity"];
  }
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId) {
    [v5 setObject:feedViewExposureId forKey:@"feed_view_exposure_id"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v16 = [NSNumber numberWithBool:self->_adSupportedChannel];
    [v5 setObject:v16 forKey:@"ad_supported_channel"];
  }
  sectionHeadlineId = self->_sectionHeadlineId;
  if (sectionHeadlineId) {
    [v5 setObject:sectionHeadlineId forKey:@"section_headline_id"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(float *)&double v4 = self->_verticalScrollPositionStarting;
    v36 = [NSNumber numberWithFloat:v4];
    [v5 setObject:v36 forKey:@"vertical_scroll_position_starting"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_27:
      if ((has & 2) == 0) {
        goto LABEL_29;
      }
      goto LABEL_28;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_27;
  }
  *(float *)&double v4 = self->_verticalScrollPositionEnding;
  v37 = [NSNumber numberWithFloat:v4];
  [v5 setObject:v37 forKey:@"vertical_scroll_position_ending"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_28:
    *(float *)&double v4 = self->_scrollingVelocity;
    v19 = [NSNumber numberWithFloat:v4];
    [v5 setObject:v19 forKey:@"scrolling_velocity"];
  }
LABEL_29:
  if ([(NSMutableArray *)self->_fractionalCohortMemberships count])
  {
    v20 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_fractionalCohortMemberships, "count"));
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v21 = self->_fractionalCohortMemberships;
    uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v39 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * i), "dictionaryRepresentation", (void)v38);
          [v20 addObject:v26];
        }
        uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v23);
    }

    [v5 setObject:v20 forKey:@"fractional_cohort_membership"];
  }
  alternateHeadline = self->_alternateHeadline;
  if (alternateHeadline)
  {
    v28 = [(NTPBAlternateHeadline *)alternateHeadline dictionaryRepresentation];
    [v5 setObject:v28 forKey:@"alternate_headline"];
  }
  issueData = self->_issueData;
  if (issueData)
  {
    v30 = [(NTPBIssueData *)issueData dictionaryRepresentation];
    [v5 setObject:v30 forKey:@"issue_data"];
  }
  issueViewData = self->_issueViewData;
  if (issueViewData)
  {
    v32 = [(NTPBIssueViewData *)issueViewData dictionaryRepresentation];
    [v5 setObject:v32 forKey:@"issue_view_data"];
  }
  issueExposureData = self->_issueExposureData;
  if (issueExposureData)
  {
    v34 = [(NTPBIssueExposureData *)issueExposureData dictionaryRepresentation];
    [v5 setObject:v34 forKey:@"issue_exposure_data"];
  }

  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBArticleScrollReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_articleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_referencedArticleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_articleSessionId) {
    PBDataWriterWriteDataField();
  }
  if (self->_articleViewingSessionId) {
    PBDataWriterWriteDataField();
  }
  if (self->_sourceChannelId) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_verticalScrollPositionStart) {
    PBDataWriterWriteStringField();
  }
  if (self->_verticalScrollPositionEnd) {
    PBDataWriterWriteStringField();
  }
  if (self->_scrollVelocity) {
    PBDataWriterWriteStringField();
  }
  if (self->_feedViewExposureId) {
    PBDataWriterWriteDataField();
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_sectionHeadlineId) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteFloatField();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_27:
      if ((has & 2) == 0) {
        goto LABEL_29;
      }
      goto LABEL_28;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_27;
  }
  PBDataWriterWriteFloatField();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_28:
  }
    PBDataWriterWriteFloatField();
LABEL_29:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_fractionalCohortMemberships;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if (self->_alternateHeadline) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_issueData) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_issueViewData) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_issueExposureData) {
    PBDataWriterWriteSubmessage();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_articleId copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_referencedArticleId copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v8;

  uint64_t v10 = [(NSData *)self->_articleSessionId copyWithZone:a3];
  long long v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  uint64_t v12 = [(NSData *)self->_articleViewingSessionId copyWithZone:a3];
  long long v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  uint64_t v14 = [(NSString *)self->_sourceChannelId copyWithZone:a3];
  v15 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v14;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 88) = self->_scrollHostViewType;
    *(unsigned char *)(v5 + 160) |= 1u;
  }
  uint64_t v16 = [(NSString *)self->_verticalScrollPositionStart copyWithZone:a3];
  v17 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v16;

  uint64_t v18 = [(NSString *)self->_verticalScrollPositionEnd copyWithZone:a3];
  v19 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v18;

  uint64_t v20 = [(NSString *)self->_scrollVelocity copyWithZone:a3];
  v21 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v20;

  uint64_t v22 = [(NSData *)self->_feedViewExposureId copyWithZone:a3];
  uint64_t v23 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v22;

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 156) = self->_adSupportedChannel;
    *(unsigned char *)(v5 + 160) |= 0x10u;
  }
  uint64_t v24 = [(NSString *)self->_sectionHeadlineId copyWithZone:a3];
  v25 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v24;

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(float *)(v5 + 152) = self->_verticalScrollPositionStarting;
    *(unsigned char *)(v5 + 160) |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *(float *)(v5 + 136) = self->_verticalScrollPositionEnding;
  *(unsigned char *)(v5 + 160) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_8:
    *(float *)(v5 + 104) = self->_scrollingVelocity;
    *(unsigned char *)(v5 + 160) |= 2u;
  }
LABEL_9:
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v27 = self->_fractionalCohortMemberships;
  uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v43 != v30) {
          objc_enumerationMutation(v27);
        }
        v32 = objc_msgSend(*(id *)(*((void *)&v42 + 1) + 8 * i), "copyWithZone:", a3, (void)v42);
        [(id)v5 addFractionalCohortMembership:v32];
      }
      uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v29);
  }

  id v33 = [(NTPBAlternateHeadline *)self->_alternateHeadline copyWithZone:a3];
  v34 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v33;

  id v35 = [(NTPBIssueData *)self->_issueData copyWithZone:a3];
  v36 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v35;

  id v37 = [(NTPBIssueViewData *)self->_issueViewData copyWithZone:a3];
  long long v38 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v37;

  id v39 = [(NTPBIssueExposureData *)self->_issueExposureData copyWithZone:a3];
  long long v40 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v39;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_61;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:")) {
      goto LABEL_61;
    }
  }
  referencedArticleId = self->_referencedArticleId;
  if ((unint64_t)referencedArticleId | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](referencedArticleId, "isEqual:")) {
      goto LABEL_61;
    }
  }
  articleSessionId = self->_articleSessionId;
  if ((unint64_t)articleSessionId | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](articleSessionId, "isEqual:")) {
      goto LABEL_61;
    }
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:")) {
      goto LABEL_61;
    }
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:")) {
      goto LABEL_61;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 160) & 1) == 0 || self->_scrollHostViewType != *((_DWORD *)v4 + 22)) {
      goto LABEL_61;
    }
  }
  else if (*((unsigned char *)v4 + 160))
  {
    goto LABEL_61;
  }
  verticalScrollPositionStart = self->_verticalScrollPositionStart;
  if ((unint64_t)verticalScrollPositionStart | *((void *)v4 + 18)
    && !-[NSString isEqual:](verticalScrollPositionStart, "isEqual:"))
  {
    goto LABEL_61;
  }
  verticalScrollPositionEnd = self->_verticalScrollPositionEnd;
  if ((unint64_t)verticalScrollPositionEnd | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](verticalScrollPositionEnd, "isEqual:")) {
      goto LABEL_61;
    }
  }
  scrollVelocity = self->_scrollVelocity;
  if ((unint64_t)scrollVelocity | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](scrollVelocity, "isEqual:")) {
      goto LABEL_61;
    }
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](feedViewExposureId, "isEqual:")) {
      goto LABEL_61;
    }
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 160) & 0x10) == 0) {
      goto LABEL_61;
    }
    if (self->_adSupportedChannel)
    {
      if (!*((unsigned char *)v4 + 156)) {
        goto LABEL_61;
      }
    }
    else if (*((unsigned char *)v4 + 156))
    {
      goto LABEL_61;
    }
  }
  else if ((*((unsigned char *)v4 + 160) & 0x10) != 0)
  {
    goto LABEL_61;
  }
  sectionHeadlineId = self->_sectionHeadlineId;
  if (!((unint64_t)sectionHeadlineId | *((void *)v4 + 14))) {
    goto LABEL_36;
  }
  if (!-[NSString isEqual:](sectionHeadlineId, "isEqual:"))
  {
LABEL_61:
    char v21 = 0;
    goto LABEL_62;
  }
  char has = (char)self->_has;
LABEL_36:
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 160) & 8) == 0 || self->_verticalScrollPositionStarting != *((float *)v4 + 38)) {
      goto LABEL_61;
    }
  }
  else if ((*((unsigned char *)v4 + 160) & 8) != 0)
  {
    goto LABEL_61;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 160) & 4) == 0 || self->_verticalScrollPositionEnding != *((float *)v4 + 34)) {
      goto LABEL_61;
    }
  }
  else if ((*((unsigned char *)v4 + 160) & 4) != 0)
  {
    goto LABEL_61;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 160) & 2) == 0 || self->_scrollingVelocity != *((float *)v4 + 26)) {
      goto LABEL_61;
    }
  }
  else if ((*((unsigned char *)v4 + 160) & 2) != 0)
  {
    goto LABEL_61;
  }
  fractionalCohortMemberships = self->_fractionalCohortMemberships;
  if ((unint64_t)fractionalCohortMemberships | *((void *)v4 + 6)
    && !-[NSMutableArray isEqual:](fractionalCohortMemberships, "isEqual:"))
  {
    goto LABEL_61;
  }
  alternateHeadline = self->_alternateHeadline;
  if ((unint64_t)alternateHeadline | *((void *)v4 + 1))
  {
    if (!-[NTPBAlternateHeadline isEqual:](alternateHeadline, "isEqual:")) {
      goto LABEL_61;
    }
  }
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((void *)v4 + 7))
  {
    if (!-[NTPBIssueData isEqual:](issueData, "isEqual:")) {
      goto LABEL_61;
    }
  }
  issueViewData = self->_issueViewData;
  if ((unint64_t)issueViewData | *((void *)v4 + 9))
  {
    if (!-[NTPBIssueViewData isEqual:](issueViewData, "isEqual:")) {
      goto LABEL_61;
    }
  }
  issueExposureData = self->_issueExposureData;
  if ((unint64_t)issueExposureData | *((void *)v4 + 8)) {
    char v21 = -[NTPBIssueExposureData isEqual:](issueExposureData, "isEqual:");
  }
  else {
    char v21 = 1;
  }
LABEL_62:

  return v21;
}

- (unint64_t)hash
{
  NSUInteger v35 = [(NSString *)self->_articleId hash];
  NSUInteger v34 = [(NSString *)self->_referencedArticleId hash];
  uint64_t v33 = [(NSData *)self->_articleSessionId hash];
  uint64_t v32 = [(NSData *)self->_articleViewingSessionId hash];
  NSUInteger v31 = [(NSString *)self->_sourceChannelId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v30 = 2654435761 * self->_scrollHostViewType;
  }
  else {
    uint64_t v30 = 0;
  }
  NSUInteger v29 = [(NSString *)self->_verticalScrollPositionStart hash];
  NSUInteger v3 = [(NSString *)self->_verticalScrollPositionEnd hash];
  NSUInteger v4 = [(NSString *)self->_scrollVelocity hash];
  uint64_t v5 = [(NSData *)self->_feedViewExposureId hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v6 = 2654435761 * self->_adSupportedChannel;
  }
  else {
    uint64_t v6 = 0;
  }
  NSUInteger v7 = [(NSString *)self->_sectionHeadlineId hash];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    float verticalScrollPositionStarting = self->_verticalScrollPositionStarting;
    float v11 = -verticalScrollPositionStarting;
    if (verticalScrollPositionStarting >= 0.0) {
      float v11 = self->_verticalScrollPositionStarting;
    }
    float v12 = floorf(v11 + 0.5);
    float v13 = (float)(v11 - v12) * 1.8447e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmodf(v12, 1.8447e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabsf(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((has & 4) != 0)
  {
    float verticalScrollPositionEnding = self->_verticalScrollPositionEnding;
    float v16 = -verticalScrollPositionEnding;
    if (verticalScrollPositionEnding >= 0.0) {
      float v16 = self->_verticalScrollPositionEnding;
    }
    float v17 = floorf(v16 + 0.5);
    float v18 = (float)(v16 - v17) * 1.8447e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmodf(v17, 1.8447e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabsf(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((has & 2) != 0)
  {
    float scrollingVelocity = self->_scrollingVelocity;
    float v21 = -scrollingVelocity;
    if (scrollingVelocity >= 0.0) {
      float v21 = self->_scrollingVelocity;
    }
    float v22 = floorf(v21 + 0.5);
    float v23 = (float)(v21 - v22) * 1.8447e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmodf(v22, 1.8447e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabsf(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  uint64_t v24 = v34 ^ v35 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v9 ^ v14 ^ v19 ^ [(NSMutableArray *)self->_fractionalCohortMemberships hash];
  unint64_t v25 = [(NTPBAlternateHeadline *)self->_alternateHeadline hash];
  unint64_t v26 = v25 ^ [(NTPBIssueData *)self->_issueData hash];
  unint64_t v27 = v26 ^ [(NTPBIssueViewData *)self->_issueViewData hash];
  return v24 ^ v27 ^ [(NTPBIssueExposureData *)self->_issueExposureData hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[NTPBArticleScroll setArticleId:](self, "setArticleId:");
  }
  if (*((void *)v4 + 10)) {
    -[NTPBArticleScroll setReferencedArticleId:](self, "setReferencedArticleId:");
  }
  if (*((void *)v4 + 3)) {
    -[NTPBArticleScroll setArticleSessionId:](self, "setArticleSessionId:");
  }
  if (*((void *)v4 + 4)) {
    -[NTPBArticleScroll setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
  }
  if (*((void *)v4 + 15)) {
    -[NTPBArticleScroll setSourceChannelId:](self, "setSourceChannelId:");
  }
  if (*((unsigned char *)v4 + 160))
  {
    self->_scrollHostViewType = *((_DWORD *)v4 + 22);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 18)) {
    -[NTPBArticleScroll setVerticalScrollPositionStart:](self, "setVerticalScrollPositionStart:");
  }
  if (*((void *)v4 + 16)) {
    -[NTPBArticleScroll setVerticalScrollPositionEnd:](self, "setVerticalScrollPositionEnd:");
  }
  if (*((void *)v4 + 12)) {
    -[NTPBArticleScroll setScrollVelocity:](self, "setScrollVelocity:");
  }
  if (*((void *)v4 + 5)) {
    -[NTPBArticleScroll setFeedViewExposureId:](self, "setFeedViewExposureId:");
  }
  if ((*((unsigned char *)v4 + 160) & 0x10) != 0)
  {
    self->_adSupportedChannel = *((unsigned char *)v4 + 156);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  if (*((void *)v4 + 14)) {
    -[NTPBArticleScroll setSectionHeadlineId:](self, "setSectionHeadlineId:");
  }
  char v5 = *((unsigned char *)v4 + 160);
  if ((v5 & 8) != 0)
  {
    self->_float verticalScrollPositionStarting = *((float *)v4 + 38);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 160);
    if ((v5 & 4) == 0)
    {
LABEL_27:
      if ((v5 & 2) == 0) {
        goto LABEL_29;
      }
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 160) & 4) == 0)
  {
    goto LABEL_27;
  }
  self->_float verticalScrollPositionEnding = *((float *)v4 + 34);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 160) & 2) != 0)
  {
LABEL_28:
    self->_float scrollingVelocity = *((float *)v4 + 26);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_29:
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = *((id *)v4 + 6);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        -[NTPBArticleScroll addFractionalCohortMembership:](self, "addFractionalCohortMembership:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  alternateHeadline = self->_alternateHeadline;
  uint64_t v12 = *((void *)v4 + 1);
  if (alternateHeadline)
  {
    if (v12) {
      -[NTPBAlternateHeadline mergeFrom:](alternateHeadline, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[NTPBArticleScroll setAlternateHeadline:](self, "setAlternateHeadline:");
  }
  issueData = self->_issueData;
  uint64_t v14 = *((void *)v4 + 7);
  if (issueData)
  {
    if (v14) {
      -[NTPBIssueData mergeFrom:](issueData, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[NTPBArticleScroll setIssueData:](self, "setIssueData:");
  }
  issueViewData = self->_issueViewData;
  uint64_t v16 = *((void *)v4 + 9);
  if (issueViewData)
  {
    if (v16) {
      -[NTPBIssueViewData mergeFrom:](issueViewData, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[NTPBArticleScroll setIssueViewData:](self, "setIssueViewData:");
  }
  issueExposureData = self->_issueExposureData;
  uint64_t v18 = *((void *)v4 + 8);
  if (issueExposureData)
  {
    if (v18) {
      -[NTPBIssueExposureData mergeFrom:](issueExposureData, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[NTPBArticleScroll setIssueExposureData:](self, "setIssueExposureData:");
  }
}

- (NSString)articleId
{
  return self->_articleId;
}

- (void)setArticleId:(id)a3
{
}

- (NSString)referencedArticleId
{
  return self->_referencedArticleId;
}

- (void)setReferencedArticleId:(id)a3
{
}

- (NSData)articleSessionId
{
  return self->_articleSessionId;
}

- (void)setArticleSessionId:(id)a3
{
}

- (NSData)articleViewingSessionId
{
  return self->_articleViewingSessionId;
}

- (void)setArticleViewingSessionId:(id)a3
{
}

- (NSString)sourceChannelId
{
  return self->_sourceChannelId;
}

- (void)setSourceChannelId:(id)a3
{
}

- (NSString)verticalScrollPositionStart
{
  return self->_verticalScrollPositionStart;
}

- (void)setVerticalScrollPositionStart:(id)a3
{
}

- (NSString)verticalScrollPositionEnd
{
  return self->_verticalScrollPositionEnd;
}

- (void)setVerticalScrollPositionEnd:(id)a3
{
}

- (NSString)scrollVelocity
{
  return self->_scrollVelocity;
}

- (void)setScrollVelocity:(id)a3
{
}

- (NSData)feedViewExposureId
{
  return self->_feedViewExposureId;
}

- (void)setFeedViewExposureId:(id)a3
{
}

- (BOOL)adSupportedChannel
{
  return self->_adSupportedChannel;
}

- (NSString)sectionHeadlineId
{
  return self->_sectionHeadlineId;
}

- (void)setSectionHeadlineId:(id)a3
{
}

- (float)verticalScrollPositionStarting
{
  return self->_verticalScrollPositionStarting;
}

- (float)verticalScrollPositionEnding
{
  return self->_verticalScrollPositionEnding;
}

- (float)scrollingVelocity
{
  return self->_scrollingVelocity;
}

- (NSMutableArray)fractionalCohortMemberships
{
  return self->_fractionalCohortMemberships;
}

- (void)setFractionalCohortMemberships:(id)a3
{
}

- (NTPBAlternateHeadline)alternateHeadline
{
  return self->_alternateHeadline;
}

- (void)setAlternateHeadline:(id)a3
{
}

- (NTPBIssueData)issueData
{
  return self->_issueData;
}

- (void)setIssueData:(id)a3
{
}

- (NTPBIssueViewData)issueViewData
{
  return self->_issueViewData;
}

- (void)setIssueViewData:(id)a3
{
}

- (NTPBIssueExposureData)issueExposureData
{
  return self->_issueExposureData;
}

- (void)setIssueExposureData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verticalScrollPositionStart, 0);
  objc_storeStrong((id *)&self->_verticalScrollPositionEnd, 0);
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_sectionHeadlineId, 0);
  objc_storeStrong((id *)&self->_scrollVelocity, 0);
  objc_storeStrong((id *)&self->_referencedArticleId, 0);
  objc_storeStrong((id *)&self->_issueViewData, 0);
  objc_storeStrong((id *)&self->_issueExposureData, 0);
  objc_storeStrong((id *)&self->_issueData, 0);
  objc_storeStrong((id *)&self->_fractionalCohortMemberships, 0);
  objc_storeStrong((id *)&self->_feedViewExposureId, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);
  objc_storeStrong((id *)&self->_articleSessionId, 0);
  objc_storeStrong((id *)&self->_articleId, 0);

  objc_storeStrong((id *)&self->_alternateHeadline, 0);
}

@end