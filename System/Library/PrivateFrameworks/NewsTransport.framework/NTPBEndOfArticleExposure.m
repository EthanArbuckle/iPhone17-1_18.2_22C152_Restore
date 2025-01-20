@interface NTPBEndOfArticleExposure
+ (Class)namedEntitiesType;
+ (Class)recommendedArticleIdType;
+ (Class)referencedRecommendedArticleIdsType;
- (BOOL)hasArticleId;
- (BOOL)hasArticleType;
- (BOOL)hasBackendArticleVersion;
- (BOOL)hasBackendArticleVersionInt64;
- (BOOL)hasCharacterCount;
- (BOOL)hasFeedId;
- (BOOL)hasFeedViewExposureId;
- (BOOL)hasIsUserSubscribedToFeed;
- (BOOL)hasLanguage;
- (BOOL)hasPersonalizationTreatmentId;
- (BOOL)hasPublisherArticleVersion;
- (BOOL)hasPublisherArticleVersionInt64;
- (BOOL)hasReferencedArticleId;
- (BOOL)hasSectionHeadlineId;
- (BOOL)hasSurfacedByChannelId;
- (BOOL)hasSurfacedBySectionId;
- (BOOL)hasSurfacedByTopicId;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUserSubscribedToFeed;
- (BOOL)readFrom:(id)a3;
- (NSData)feedViewExposureId;
- (NSMutableArray)namedEntities;
- (NSMutableArray)recommendedArticleIds;
- (NSMutableArray)referencedRecommendedArticleIds;
- (NSString)articleId;
- (NSString)feedId;
- (NSString)language;
- (NSString)referencedArticleId;
- (NSString)sectionHeadlineId;
- (NSString)surfacedByChannelId;
- (NSString)surfacedBySectionId;
- (NSString)surfacedByTopicId;
- (id)articleTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)namedEntitiesAtIndex:(unint64_t)a3;
- (id)recommendedArticleIdAtIndex:(unint64_t)a3;
- (id)referencedRecommendedArticleIdsAtIndex:(unint64_t)a3;
- (int)StringAsArticleType:(id)a3;
- (int)articleType;
- (int)backendArticleVersion;
- (int)characterCount;
- (int)publisherArticleVersion;
- (int64_t)backendArticleVersionInt64;
- (int64_t)personalizationTreatmentId;
- (int64_t)publisherArticleVersionInt64;
- (unint64_t)hash;
- (unint64_t)namedEntitiesCount;
- (unint64_t)recommendedArticleIdsCount;
- (unint64_t)referencedRecommendedArticleIdsCount;
- (void)addNamedEntities:(id)a3;
- (void)addRecommendedArticleId:(id)a3;
- (void)addReferencedRecommendedArticleIds:(id)a3;
- (void)clearNamedEntities;
- (void)clearRecommendedArticleIds;
- (void)clearReferencedRecommendedArticleIds;
- (void)mergeFrom:(id)a3;
- (void)setArticleId:(id)a3;
- (void)setArticleType:(int)a3;
- (void)setBackendArticleVersion:(int)a3;
- (void)setBackendArticleVersionInt64:(int64_t)a3;
- (void)setCharacterCount:(int)a3;
- (void)setFeedId:(id)a3;
- (void)setFeedViewExposureId:(id)a3;
- (void)setHasArticleType:(BOOL)a3;
- (void)setHasBackendArticleVersion:(BOOL)a3;
- (void)setHasBackendArticleVersionInt64:(BOOL)a3;
- (void)setHasCharacterCount:(BOOL)a3;
- (void)setHasIsUserSubscribedToFeed:(BOOL)a3;
- (void)setHasPersonalizationTreatmentId:(BOOL)a3;
- (void)setHasPublisherArticleVersion:(BOOL)a3;
- (void)setHasPublisherArticleVersionInt64:(BOOL)a3;
- (void)setIsUserSubscribedToFeed:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setNamedEntities:(id)a3;
- (void)setPersonalizationTreatmentId:(int64_t)a3;
- (void)setPublisherArticleVersion:(int)a3;
- (void)setPublisherArticleVersionInt64:(int64_t)a3;
- (void)setRecommendedArticleIds:(id)a3;
- (void)setReferencedArticleId:(id)a3;
- (void)setReferencedRecommendedArticleIds:(id)a3;
- (void)setSectionHeadlineId:(id)a3;
- (void)setSurfacedByChannelId:(id)a3;
- (void)setSurfacedBySectionId:(id)a3;
- (void)setSurfacedByTopicId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBEndOfArticleExposure

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (BOOL)hasReferencedArticleId
{
  return self->_referencedArticleId != 0;
}

- (BOOL)hasFeedId
{
  return self->_feedId != 0;
}

- (BOOL)hasFeedViewExposureId
{
  return self->_feedViewExposureId != 0;
}

- (void)setIsUserSubscribedToFeed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_isUserSubscribedToFeed = a3;
}

- (void)setHasIsUserSubscribedToFeed:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasIsUserSubscribedToFeed
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)clearRecommendedArticleIds
{
}

- (void)addRecommendedArticleId:(id)a3
{
  id v4 = a3;
  recommendedArticleIds = self->_recommendedArticleIds;
  id v8 = v4;
  if (!recommendedArticleIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_recommendedArticleIds;
    self->_recommendedArticleIds = v6;

    id v4 = v8;
    recommendedArticleIds = self->_recommendedArticleIds;
  }
  [(NSMutableArray *)recommendedArticleIds addObject:v4];
}

- (unint64_t)recommendedArticleIdsCount
{
  return [(NSMutableArray *)self->_recommendedArticleIds count];
}

- (id)recommendedArticleIdAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_recommendedArticleIds objectAtIndex:a3];
}

+ (Class)recommendedArticleIdType
{
  return (Class)objc_opt_class();
}

- (void)clearReferencedRecommendedArticleIds
{
}

- (void)addReferencedRecommendedArticleIds:(id)a3
{
  id v4 = a3;
  referencedRecommendedArticleIds = self->_referencedRecommendedArticleIds;
  id v8 = v4;
  if (!referencedRecommendedArticleIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_referencedRecommendedArticleIds;
    self->_referencedRecommendedArticleIds = v6;

    id v4 = v8;
    referencedRecommendedArticleIds = self->_referencedRecommendedArticleIds;
  }
  [(NSMutableArray *)referencedRecommendedArticleIds addObject:v4];
}

- (unint64_t)referencedRecommendedArticleIdsCount
{
  return [(NSMutableArray *)self->_referencedRecommendedArticleIds count];
}

- (id)referencedRecommendedArticleIdsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_referencedRecommendedArticleIds objectAtIndex:a3];
}

+ (Class)referencedRecommendedArticleIdsType
{
  return (Class)objc_opt_class();
}

- (int)articleType
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_articleType;
  }
  else {
    return 0;
  }
}

- (void)setArticleType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_articleType = a3;
}

- (void)setHasArticleType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasArticleType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)articleTypeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26444BFC8[a3];
  }

  return v3;
}

- (int)StringAsArticleType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_ARTICLE_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"WEBVIEW_ARTICLE_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FLINT_ARTICLE_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"VIDEO_ARTICLE_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"AD_ARTICLE_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"EXTERNAL_WEBLINK_ARTICLE_TYPE"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setCharacterCount:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_characterCount = a3;
}

- (void)setHasCharacterCount:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasCharacterCount
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (void)clearNamedEntities
{
}

- (void)addNamedEntities:(id)a3
{
  id v4 = a3;
  namedEntities = self->_namedEntities;
  id v8 = v4;
  if (!namedEntities)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_namedEntities;
    self->_namedEntities = v6;

    id v4 = v8;
    namedEntities = self->_namedEntities;
  }
  [(NSMutableArray *)namedEntities addObject:v4];
}

- (unint64_t)namedEntitiesCount
{
  return [(NSMutableArray *)self->_namedEntities count];
}

- (id)namedEntitiesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_namedEntities objectAtIndex:a3];
}

+ (Class)namedEntitiesType
{
  return (Class)objc_opt_class();
}

- (void)setPublisherArticleVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_publisherArticleVersion = a3;
}

- (void)setHasPublisherArticleVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasPublisherArticleVersion
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setBackendArticleVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_backendArticleVersion = a3;
}

- (void)setHasBackendArticleVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasBackendArticleVersion
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasSurfacedByChannelId
{
  return self->_surfacedByChannelId != 0;
}

- (BOOL)hasSurfacedBySectionId
{
  return self->_surfacedBySectionId != 0;
}

- (BOOL)hasSurfacedByTopicId
{
  return self->_surfacedByTopicId != 0;
}

- (BOOL)hasSectionHeadlineId
{
  return self->_sectionHeadlineId != 0;
}

- (void)setPersonalizationTreatmentId:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_personalizationTreatmentId = a3;
}

- (void)setHasPersonalizationTreatmentId:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPersonalizationTreatmentId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPublisherArticleVersionInt64:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_publisherArticleVersionInt64 = a3;
}

- (void)setHasPublisherArticleVersionInt64:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPublisherArticleVersionInt64
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setBackendArticleVersionInt64:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_backendArticleVersionInt64 = a3;
}

- (void)setHasBackendArticleVersionInt64:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBackendArticleVersionInt64
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBEndOfArticleExposure;
  id v4 = [(NTPBEndOfArticleExposure *)&v8 description];
  v5 = [(NTPBEndOfArticleExposure *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  articleId = self->_articleId;
  if (articleId) {
    [v3 setObject:articleId forKey:@"article_id"];
  }
  referencedArticleId = self->_referencedArticleId;
  if (referencedArticleId) {
    [v4 setObject:referencedArticleId forKey:@"referenced_article_id"];
  }
  feedId = self->_feedId;
  if (feedId) {
    [v4 setObject:feedId forKey:@"feed_id"];
  }
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId) {
    [v4 setObject:feedViewExposureId forKey:@"feed_view_exposure_id"];
  }
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    v9 = [NSNumber numberWithBool:self->_isUserSubscribedToFeed];
    [v4 setObject:v9 forKey:@"is_user_subscribed_to_feed"];
  }
  recommendedArticleIds = self->_recommendedArticleIds;
  if (recommendedArticleIds) {
    [v4 setObject:recommendedArticleIds forKey:@"recommended_article_id"];
  }
  referencedRecommendedArticleIds = self->_referencedRecommendedArticleIds;
  if (referencedRecommendedArticleIds) {
    [v4 setObject:referencedRecommendedArticleIds forKey:@"referenced_recommended_article_ids"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t articleType = self->_articleType;
    if (articleType >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_articleType);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_26444BFC8[articleType];
    }
    [v4 setObject:v14 forKey:@"article_type"];

    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    v15 = [NSNumber numberWithInt:self->_characterCount];
    [v4 setObject:v15 forKey:@"character_count"];
  }
  language = self->_language;
  if (language) {
    [v4 setObject:language forKey:@"language"];
  }
  namedEntities = self->_namedEntities;
  if (namedEntities) {
    [v4 setObject:namedEntities forKey:@"named_entities"];
  }
  char v18 = (char)self->_has;
  if ((v18 & 0x40) != 0)
  {
    v19 = [NSNumber numberWithInt:self->_publisherArticleVersion];
    [v4 setObject:v19 forKey:@"publisher_article_version"];

    char v18 = (char)self->_has;
  }
  if ((v18 & 0x10) != 0)
  {
    v20 = [NSNumber numberWithInt:self->_backendArticleVersion];
    [v4 setObject:v20 forKey:@"backend_article_version"];
  }
  surfacedByChannelId = self->_surfacedByChannelId;
  if (surfacedByChannelId) {
    [v4 setObject:surfacedByChannelId forKey:@"surfaced_by_channel_id"];
  }
  surfacedBySectionId = self->_surfacedBySectionId;
  if (surfacedBySectionId) {
    [v4 setObject:surfacedBySectionId forKey:@"surfaced_by_section_id"];
  }
  surfacedByTopicId = self->_surfacedByTopicId;
  if (surfacedByTopicId) {
    [v4 setObject:surfacedByTopicId forKey:@"surfaced_by_topic_id"];
  }
  sectionHeadlineId = self->_sectionHeadlineId;
  if (sectionHeadlineId) {
    [v4 setObject:sectionHeadlineId forKey:@"section_headline_id"];
  }
  char v25 = (char)self->_has;
  if ((v25 & 2) != 0)
  {
    v28 = [NSNumber numberWithLongLong:self->_personalizationTreatmentId];
    [v4 setObject:v28 forKey:@"personalization_treatment_id"];

    char v25 = (char)self->_has;
    if ((v25 & 4) == 0)
    {
LABEL_40:
      if ((v25 & 1) == 0) {
        goto LABEL_42;
      }
      goto LABEL_41;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_40;
  }
  v29 = [NSNumber numberWithLongLong:self->_publisherArticleVersionInt64];
  [v4 setObject:v29 forKey:@"publisher_article_version_int64"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_41:
    v26 = [NSNumber numberWithLongLong:self->_backendArticleVersionInt64];
    [v4 setObject:v26 forKey:@"backend_article_version_int64"];
  }
LABEL_42:

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBEndOfArticleExposureReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_articleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_referencedArticleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_feedId) {
    PBDataWriterWriteStringField();
  }
  if (self->_feedViewExposureId) {
    PBDataWriterWriteDataField();
  }
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v5 = self->_recommendedArticleIds;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v7);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v10 = self->_referencedRecommendedArticleIds;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v12);
  }

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_language) {
    PBDataWriterWriteStringField();
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v16 = self->_namedEntities;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v35 count:16];
    }
    while (v18);
  }

  char v21 = (char)self->_has;
  if ((v21 & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    char v21 = (char)self->_has;
  }
  if ((v21 & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_surfacedByChannelId) {
    PBDataWriterWriteStringField();
  }
  if (self->_surfacedBySectionId) {
    PBDataWriterWriteStringField();
  }
  if (self->_surfacedByTopicId) {
    PBDataWriterWriteStringField();
  }
  if (self->_sectionHeadlineId) {
    PBDataWriterWriteStringField();
  }
  char v22 = (char)self->_has;
  if ((v22 & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_52;
    }
LABEL_56:
    PBDataWriterWriteInt64Field();
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_54;
    }
    goto LABEL_53;
  }
  PBDataWriterWriteInt64Field();
  char v22 = (char)self->_has;
  if ((v22 & 4) != 0) {
    goto LABEL_56;
  }
LABEL_52:
  if (v22) {
LABEL_53:
  }
    PBDataWriterWriteInt64Field();
LABEL_54:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_articleId copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSString *)self->_referencedArticleId copyWithZone:a3];
  v9 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v8;

  uint64_t v10 = [(NSString *)self->_feedId copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v10;

  uint64_t v12 = [(NSData *)self->_feedViewExposureId copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v12;

  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    *(unsigned char *)(v5 + 152) = self->_isUserSubscribedToFeed;
    *(unsigned char *)(v5 + 156) |= 0x80u;
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v14 = self->_recommendedArticleIds;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v55 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = (void *)[*(id *)(*((void *)&v54 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addRecommendedArticleId:v19];
      }
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v54 objects:v60 count:16];
    }
    while (v16);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v20 = self->_referencedRecommendedArticleIds;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v51 != v23) {
          objc_enumerationMutation(v20);
        }
        long long v25 = (void *)[*(id *)(*((void *)&v50 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addReferencedRecommendedArticleIds:v25];
      }
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v50 objects:v59 count:16];
    }
    while (v22);
  }

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_articleType;
    *(unsigned char *)(v5 + 156) |= 8u;
    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_characterCount;
    *(unsigned char *)(v5 + 156) |= 0x20u;
  }
  uint64_t v27 = [(NSString *)self->_language copyWithZone:a3];
  long long v28 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v27;

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v29 = self->_namedEntities;
  uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v46 objects:v58 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v47;
    do
    {
      for (uint64_t k = 0; k != v31; ++k)
      {
        if (*(void *)v47 != v32) {
          objc_enumerationMutation(v29);
        }
        long long v34 = objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * k), "copyWithZone:", a3, (void)v46);
        [(id)v5 addNamedEntities:v34];
      }
      uint64_t v31 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v46 objects:v58 count:16];
    }
    while (v31);
  }

  char v35 = (char)self->_has;
  if ((v35 & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_publisherArticleVersion;
    *(unsigned char *)(v5 + 156) |= 0x40u;
    char v35 = (char)self->_has;
  }
  if ((v35 & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 44) = self->_backendArticleVersion;
    *(unsigned char *)(v5 + 156) |= 0x10u;
  }
  uint64_t v36 = -[NSString copyWithZone:](self->_surfacedByChannelId, "copyWithZone:", a3, (void)v46);
  v37 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v36;

  uint64_t v38 = [(NSString *)self->_surfacedBySectionId copyWithZone:a3];
  v39 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v38;

  uint64_t v40 = [(NSString *)self->_surfacedByTopicId copyWithZone:a3];
  v41 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v40;

  uint64_t v42 = [(NSString *)self->_sectionHeadlineId copyWithZone:a3];
  v43 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v42;

  char v44 = (char)self->_has;
  if ((v44 & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_34;
    }
LABEL_38:
    *(void *)(v5 + 24) = self->_publisherArticleVersionInt64;
    *(unsigned char *)(v5 + 156) |= 4u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return (id)v5;
    }
    goto LABEL_35;
  }
  *(void *)(v5 + 16) = self->_personalizationTreatmentId;
  *(unsigned char *)(v5 + 156) |= 2u;
  char v44 = (char)self->_has;
  if ((v44 & 4) != 0) {
    goto LABEL_38;
  }
LABEL_34:
  if (v44)
  {
LABEL_35:
    *(void *)(v5 + 8) = self->_backendArticleVersionInt64;
    *(unsigned char *)(v5 + 156) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_69;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:")) {
      goto LABEL_69;
    }
  }
  referencedArticleId = self->_referencedArticleId;
  if ((unint64_t)referencedArticleId | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](referencedArticleId, "isEqual:")) {
      goto LABEL_69;
    }
  }
  feedId = self->_feedId;
  if ((unint64_t)feedId | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](feedId, "isEqual:")) {
      goto LABEL_69;
    }
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((void *)v4 + 8))
  {
    if (!-[NSData isEqual:](feedViewExposureId, "isEqual:")) {
      goto LABEL_69;
    }
  }
  int v9 = v4[156];
  if ((*(unsigned char *)&self->_has & 0x80000000) == 0)
  {
    if ((v9 & 0x80000000) == 0) {
      goto LABEL_12;
    }
LABEL_69:
    BOOL v18 = 0;
    goto LABEL_70;
  }
  if ((v9 & 0x80000000) == 0) {
    goto LABEL_69;
  }
  if (self->_isUserSubscribedToFeed)
  {
    if (!v4[152]) {
      goto LABEL_69;
    }
  }
  else if (v4[152])
  {
    goto LABEL_69;
  }
LABEL_12:
  recommendedArticleIds = self->_recommendedArticleIds;
  if ((unint64_t)recommendedArticleIds | *((void *)v4 + 12)
    && !-[NSMutableArray isEqual:](recommendedArticleIds, "isEqual:"))
  {
    goto LABEL_69;
  }
  referencedRecommendedArticleIds = self->_referencedRecommendedArticleIds;
  if ((unint64_t)referencedRecommendedArticleIds | *((void *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](referencedRecommendedArticleIds, "isEqual:")) {
      goto LABEL_69;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((v4[156] & 8) == 0 || self->_articleType != *((_DWORD *)v4 + 10)) {
      goto LABEL_69;
    }
  }
  else if ((v4[156] & 8) != 0)
  {
    goto LABEL_69;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((v4[156] & 0x20) == 0 || self->_characterCount != *((_DWORD *)v4 + 12)) {
      goto LABEL_69;
    }
  }
  else if ((v4[156] & 0x20) != 0)
  {
    goto LABEL_69;
  }
  language = self->_language;
  if ((unint64_t)language | *((void *)v4 + 9) && !-[NSString isEqual:](language, "isEqual:")) {
    goto LABEL_69;
  }
  namedEntities = self->_namedEntities;
  if ((unint64_t)namedEntities | *((void *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](namedEntities, "isEqual:")) {
      goto LABEL_69;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((v4[156] & 0x40) == 0 || self->_publisherArticleVersion != *((_DWORD *)v4 + 22)) {
      goto LABEL_69;
    }
  }
  else if ((v4[156] & 0x40) != 0)
  {
    goto LABEL_69;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((v4[156] & 0x10) == 0 || self->_backendArticleVersion != *((_DWORD *)v4 + 11)) {
      goto LABEL_69;
    }
  }
  else if ((v4[156] & 0x10) != 0)
  {
    goto LABEL_69;
  }
  surfacedByChannelId = self->_surfacedByChannelId;
  if ((unint64_t)surfacedByChannelId | *((void *)v4 + 16)
    && !-[NSString isEqual:](surfacedByChannelId, "isEqual:"))
  {
    goto LABEL_69;
  }
  surfacedBySectionId = self->_surfacedBySectionId;
  if ((unint64_t)surfacedBySectionId | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](surfacedBySectionId, "isEqual:")) {
      goto LABEL_69;
    }
  }
  surfacedByTopicId = self->_surfacedByTopicId;
  if ((unint64_t)surfacedByTopicId | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](surfacedByTopicId, "isEqual:")) {
      goto LABEL_69;
    }
  }
  sectionHeadlineId = self->_sectionHeadlineId;
  if ((unint64_t)sectionHeadlineId | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](sectionHeadlineId, "isEqual:")) {
      goto LABEL_69;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[156] & 2) == 0 || self->_personalizationTreatmentId != *((void *)v4 + 2)) {
      goto LABEL_69;
    }
  }
  else if ((v4[156] & 2) != 0)
  {
    goto LABEL_69;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v4[156] & 4) == 0 || self->_publisherArticleVersionInt64 != *((void *)v4 + 3)) {
      goto LABEL_69;
    }
  }
  else if ((v4[156] & 4) != 0)
  {
    goto LABEL_69;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[156] & 1) == 0 || self->_backendArticleVersionInt64 != *((void *)v4 + 1)) {
      goto LABEL_69;
    }
    BOOL v18 = 1;
  }
  else
  {
    BOOL v18 = (v4[156] & 1) == 0;
  }
LABEL_70:

  return v18;
}

- (unint64_t)hash
{
  NSUInteger v28 = [(NSString *)self->_articleId hash];
  NSUInteger v3 = [(NSString *)self->_referencedArticleId hash];
  NSUInteger v4 = [(NSString *)self->_feedId hash];
  uint64_t v5 = [(NSData *)self->_feedViewExposureId hash];
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0) {
    uint64_t v27 = 2654435761 * self->_isUserSubscribedToFeed;
  }
  else {
    uint64_t v27 = 0;
  }
  uint64_t v26 = [(NSMutableArray *)self->_recommendedArticleIds hash];
  uint64_t v6 = [(NSMutableArray *)self->_referencedRecommendedArticleIds hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v7 = 2654435761 * self->_articleType;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v24 = v7;
  uint64_t v25 = v6;
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    uint64_t v21 = 2654435761 * self->_characterCount;
  }
  else {
    uint64_t v21 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_language hash];
  uint64_t v9 = [(NSMutableArray *)self->_namedEntities hash];
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    uint64_t v10 = 2654435761 * self->_publisherArticleVersion;
  }
  else {
    uint64_t v10 = 0;
  }
  NSUInteger v23 = v4;
  NSUInteger v22 = v3;
  uint64_t v11 = v9;
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v12 = 2654435761 * self->_backendArticleVersion;
  }
  else {
    uint64_t v12 = 0;
  }
  NSUInteger v13 = [(NSString *)self->_surfacedByChannelId hash];
  NSUInteger v14 = [(NSString *)self->_surfacedBySectionId hash];
  NSUInteger v15 = [(NSString *)self->_surfacedByTopicId hash];
  NSUInteger v16 = [(NSString *)self->_sectionHeadlineId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v17 = 2654435761 * self->_personalizationTreatmentId;
  }
  else {
    uint64_t v17 = 0;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v18 = 2654435761 * self->_publisherArticleVersionInt64;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_21;
    }
LABEL_23:
    uint64_t v19 = 0;
    return v22 ^ v28 ^ v23 ^ v5 ^ v27 ^ v26 ^ v25 ^ v24 ^ v21 ^ v8 ^ v11 ^ v10 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
  }
  uint64_t v18 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_23;
  }
LABEL_21:
  uint64_t v19 = 2654435761 * self->_backendArticleVersionInt64;
  return v22 ^ v28 ^ v23 ^ v5 ^ v27 ^ v26 ^ v25 ^ v24 ^ v21 ^ v8 ^ v11 ^ v10 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  NSUInteger v4 = (char *)a3;
  if (*((void *)v4 + 4)) {
    -[NTPBEndOfArticleExposure setArticleId:](self, "setArticleId:");
  }
  if (*((void *)v4 + 13)) {
    -[NTPBEndOfArticleExposure setReferencedArticleId:](self, "setReferencedArticleId:");
  }
  if (*((void *)v4 + 7)) {
    -[NTPBEndOfArticleExposure setFeedId:](self, "setFeedId:");
  }
  if (*((void *)v4 + 8)) {
    -[NTPBEndOfArticleExposure setFeedViewExposureId:](self, "setFeedViewExposureId:");
  }
  if (v4[156] < 0)
  {
    self->_isUserSubscribedToFeed = v4[152];
    *(unsigned char *)&self->_has |= 0x80u;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = *((id *)v4 + 12);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NTPBEndOfArticleExposure *)self addRecommendedArticleId:*(void *)(*((void *)&v31 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v7);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = *((id *)v4 + 14);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        [(NTPBEndOfArticleExposure *)self addReferencedRecommendedArticleIds:*(void *)(*((void *)&v27 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v12);
  }

  char v15 = v4[156];
  if ((v15 & 8) != 0)
  {
    self->_uint64_t articleType = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 8u;
    char v15 = v4[156];
  }
  if ((v15 & 0x20) != 0)
  {
    self->_characterCount = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 0x20u;
  }
  if (*((void *)v4 + 9)) {
    -[NTPBEndOfArticleExposure setLanguage:](self, "setLanguage:");
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v16 = *((id *)v4 + 10);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        -[NTPBEndOfArticleExposure addNamedEntities:](self, "addNamedEntities:", *(void *)(*((void *)&v23 + 1) + 8 * k), (void)v23);
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v35 count:16];
    }
    while (v18);
  }

  char v21 = v4[156];
  if ((v21 & 0x40) != 0)
  {
    self->_publisherArticleVersion = *((_DWORD *)v4 + 22);
    *(unsigned char *)&self->_has |= 0x40u;
    char v21 = v4[156];
  }
  if ((v21 & 0x10) != 0)
  {
    self->_backendArticleVersion = *((_DWORD *)v4 + 11);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  if (*((void *)v4 + 16)) {
    -[NTPBEndOfArticleExposure setSurfacedByChannelId:](self, "setSurfacedByChannelId:");
  }
  if (*((void *)v4 + 17)) {
    -[NTPBEndOfArticleExposure setSurfacedBySectionId:](self, "setSurfacedBySectionId:");
  }
  if (*((void *)v4 + 18)) {
    -[NTPBEndOfArticleExposure setSurfacedByTopicId:](self, "setSurfacedByTopicId:");
  }
  if (*((void *)v4 + 15)) {
    -[NTPBEndOfArticleExposure setSectionHeadlineId:](self, "setSectionHeadlineId:");
  }
  char v22 = v4[156];
  if ((v22 & 2) == 0)
  {
    if ((v4[156] & 4) == 0) {
      goto LABEL_52;
    }
LABEL_56:
    self->_publisherArticleVersionInt64 = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
    if ((v4[156] & 1) == 0) {
      goto LABEL_54;
    }
    goto LABEL_53;
  }
  self->_personalizationTreatmentId = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v22 = v4[156];
  if ((v22 & 4) != 0) {
    goto LABEL_56;
  }
LABEL_52:
  if (v22)
  {
LABEL_53:
    self->_backendArticleVersionInt64 = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_54:
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

- (NSString)feedId
{
  return self->_feedId;
}

- (void)setFeedId:(id)a3
{
}

- (NSData)feedViewExposureId
{
  return self->_feedViewExposureId;
}

- (void)setFeedViewExposureId:(id)a3
{
}

- (BOOL)isUserSubscribedToFeed
{
  return self->_isUserSubscribedToFeed;
}

- (NSMutableArray)recommendedArticleIds
{
  return self->_recommendedArticleIds;
}

- (void)setRecommendedArticleIds:(id)a3
{
}

- (NSMutableArray)referencedRecommendedArticleIds
{
  return self->_referencedRecommendedArticleIds;
}

- (void)setReferencedRecommendedArticleIds:(id)a3
{
}

- (int)characterCount
{
  return self->_characterCount;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (NSMutableArray)namedEntities
{
  return self->_namedEntities;
}

- (void)setNamedEntities:(id)a3
{
}

- (int)publisherArticleVersion
{
  return self->_publisherArticleVersion;
}

- (int)backendArticleVersion
{
  return self->_backendArticleVersion;
}

- (NSString)surfacedByChannelId
{
  return self->_surfacedByChannelId;
}

- (void)setSurfacedByChannelId:(id)a3
{
}

- (NSString)surfacedBySectionId
{
  return self->_surfacedBySectionId;
}

- (void)setSurfacedBySectionId:(id)a3
{
}

- (NSString)surfacedByTopicId
{
  return self->_surfacedByTopicId;
}

- (void)setSurfacedByTopicId:(id)a3
{
}

- (NSString)sectionHeadlineId
{
  return self->_sectionHeadlineId;
}

- (void)setSectionHeadlineId:(id)a3
{
}

- (int64_t)personalizationTreatmentId
{
  return self->_personalizationTreatmentId;
}

- (int64_t)publisherArticleVersionInt64
{
  return self->_publisherArticleVersionInt64;
}

- (int64_t)backendArticleVersionInt64
{
  return self->_backendArticleVersionInt64;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_surfacedByTopicId, 0);
  objc_storeStrong((id *)&self->_surfacedBySectionId, 0);
  objc_storeStrong((id *)&self->_surfacedByChannelId, 0);
  objc_storeStrong((id *)&self->_sectionHeadlineId, 0);
  objc_storeStrong((id *)&self->_referencedRecommendedArticleIds, 0);
  objc_storeStrong((id *)&self->_referencedArticleId, 0);
  objc_storeStrong((id *)&self->_recommendedArticleIds, 0);
  objc_storeStrong((id *)&self->_namedEntities, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_feedViewExposureId, 0);
  objc_storeStrong((id *)&self->_feedId, 0);

  objc_storeStrong((id *)&self->_articleId, 0);
}

@end