@interface NTPBAnfComponentExposure
+ (Class)fractionalCohortMembershipType;
- (BOOL)hasAnfComponentId;
- (BOOL)hasAnfComponentRole;
- (BOOL)hasAnfComponentType;
- (BOOL)hasArticleId;
- (BOOL)hasArticleVersion;
- (BOOL)hasArticleViewingSessionId;
- (BOOL)hasBackendArticleVersionInt64;
- (BOOL)hasIssueData;
- (BOOL)hasIssueExposureData;
- (BOOL)hasIssueViewData;
- (BOOL)hasMetadata;
- (BOOL)hasPublisherArticleVersionInt64;
- (BOOL)hasSourceChannelId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)articleViewingSessionId;
- (NSMutableArray)fractionalCohortMemberships;
- (NSString)anfComponentId;
- (NSString)anfComponentRole;
- (NSString)anfComponentType;
- (NSString)articleId;
- (NSString)articleVersion;
- (NSString)metadata;
- (NSString)sourceChannelId;
- (NTPBIssueData)issueData;
- (NTPBIssueExposureData)issueExposureData;
- (NTPBIssueViewData)issueViewData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)fractionalCohortMembershipAtIndex:(unint64_t)a3;
- (int64_t)backendArticleVersionInt64;
- (int64_t)publisherArticleVersionInt64;
- (unint64_t)fractionalCohortMembershipsCount;
- (unint64_t)hash;
- (void)addFractionalCohortMembership:(id)a3;
- (void)clearFractionalCohortMemberships;
- (void)mergeFrom:(id)a3;
- (void)setAnfComponentId:(id)a3;
- (void)setAnfComponentRole:(id)a3;
- (void)setAnfComponentType:(id)a3;
- (void)setArticleId:(id)a3;
- (void)setArticleVersion:(id)a3;
- (void)setArticleViewingSessionId:(id)a3;
- (void)setBackendArticleVersionInt64:(int64_t)a3;
- (void)setFractionalCohortMemberships:(id)a3;
- (void)setHasBackendArticleVersionInt64:(BOOL)a3;
- (void)setHasPublisherArticleVersionInt64:(BOOL)a3;
- (void)setIssueData:(id)a3;
- (void)setIssueExposureData:(id)a3;
- (void)setIssueViewData:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setPublisherArticleVersionInt64:(int64_t)a3;
- (void)setSourceChannelId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBAnfComponentExposure

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (BOOL)hasAnfComponentType
{
  return self->_anfComponentType != 0;
}

- (BOOL)hasAnfComponentId
{
  return self->_anfComponentId != 0;
}

- (BOOL)hasAnfComponentRole
{
  return self->_anfComponentRole != 0;
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (BOOL)hasArticleVersion
{
  return self->_articleVersion != 0;
}

- (void)setPublisherArticleVersionInt64:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_publisherArticleVersionInt64 = a3;
}

- (void)setHasPublisherArticleVersionInt64:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPublisherArticleVersionInt64
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
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

- (BOOL)hasIssueData
{
  return self->_issueData != 0;
}

- (BOOL)hasIssueExposureData
{
  return self->_issueExposureData != 0;
}

- (BOOL)hasIssueViewData
{
  return self->_issueViewData != 0;
}

- (BOOL)hasArticleViewingSessionId
{
  return self->_articleViewingSessionId != 0;
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

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBAnfComponentExposure;
  id v4 = [(NTPBAnfComponentExposure *)&v8 description];
  v5 = [(NTPBAnfComponentExposure *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  articleId = self->_articleId;
  if (articleId) {
    [v3 setObject:articleId forKey:@"article_id"];
  }
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId) {
    [v4 setObject:sourceChannelId forKey:@"source_channel_id"];
  }
  anfComponentType = self->_anfComponentType;
  if (anfComponentType) {
    [v4 setObject:anfComponentType forKey:@"anf_component_type"];
  }
  anfComponentId = self->_anfComponentId;
  if (anfComponentId) {
    [v4 setObject:anfComponentId forKey:@"anf_component_id"];
  }
  anfComponentRole = self->_anfComponentRole;
  if (anfComponentRole) {
    [v4 setObject:anfComponentRole forKey:@"anf_component_role"];
  }
  metadata = self->_metadata;
  if (metadata) {
    [v4 setObject:metadata forKey:@"metadata"];
  }
  articleVersion = self->_articleVersion;
  if (articleVersion) {
    [v4 setObject:articleVersion forKey:@"article_version"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v13 = [NSNumber numberWithLongLong:self->_publisherArticleVersionInt64];
    [v4 setObject:v13 forKey:@"publisher_article_version_int64"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v14 = [NSNumber numberWithLongLong:self->_backendArticleVersionInt64];
    [v4 setObject:v14 forKey:@"backend_article_version_int64"];
  }
  issueData = self->_issueData;
  if (issueData)
  {
    v16 = [(NTPBIssueData *)issueData dictionaryRepresentation];
    [v4 setObject:v16 forKey:@"issue_data"];
  }
  issueExposureData = self->_issueExposureData;
  if (issueExposureData)
  {
    v18 = [(NTPBIssueExposureData *)issueExposureData dictionaryRepresentation];
    [v4 setObject:v18 forKey:@"issue_exposure_data"];
  }
  issueViewData = self->_issueViewData;
  if (issueViewData)
  {
    v20 = [(NTPBIssueViewData *)issueViewData dictionaryRepresentation];
    [v4 setObject:v20 forKey:@"issue_view_data"];
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if (articleViewingSessionId) {
    [v4 setObject:articleViewingSessionId forKey:@"article_viewing_session_id"];
  }
  if ([(NSMutableArray *)self->_fractionalCohortMemberships count])
  {
    v22 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_fractionalCohortMemberships, "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v23 = self->_fractionalCohortMemberships;
    uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v31 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "dictionaryRepresentation", (void)v30);
          [v22 addObject:v28];
        }
        uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v25);
    }

    [v4 setObject:v22 forKey:@"fractional_cohort_membership"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAnfComponentExposureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_articleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_sourceChannelId) {
    PBDataWriterWriteStringField();
  }
  if (self->_anfComponentType) {
    PBDataWriterWriteStringField();
  }
  if (self->_anfComponentId) {
    PBDataWriterWriteStringField();
  }
  if (self->_anfComponentRole) {
    PBDataWriterWriteStringField();
  }
  if (self->_metadata) {
    PBDataWriterWriteStringField();
  }
  if (self->_articleVersion) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_issueData) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_issueExposureData) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_issueViewData) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_articleViewingSessionId) {
    PBDataWriterWriteDataField();
  }
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
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_articleId copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  uint64_t v8 = [(NSString *)self->_sourceChannelId copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v8;

  uint64_t v10 = [(NSString *)self->_anfComponentType copyWithZone:a3];
  long long v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  uint64_t v12 = [(NSString *)self->_anfComponentId copyWithZone:a3];
  long long v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  uint64_t v14 = [(NSString *)self->_anfComponentRole copyWithZone:a3];
  v15 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v14;

  uint64_t v16 = [(NSString *)self->_metadata copyWithZone:a3];
  v17 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v16;

  uint64_t v18 = [(NSString *)self->_articleVersion copyWithZone:a3];
  v19 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v18;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_publisherArticleVersionInt64;
    *(unsigned char *)(v5 + 120) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v5 + 8) = self->_backendArticleVersionInt64;
    *(unsigned char *)(v5 + 120) |= 1u;
  }
  id v21 = [(NTPBIssueData *)self->_issueData copyWithZone:a3];
  v22 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v21;

  id v23 = [(NTPBIssueExposureData *)self->_issueExposureData copyWithZone:a3];
  uint64_t v24 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v23;

  id v25 = [(NTPBIssueViewData *)self->_issueViewData copyWithZone:a3];
  uint64_t v26 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v25;

  uint64_t v27 = [(NSData *)self->_articleViewingSessionId copyWithZone:a3];
  v28 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v27;

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v29 = self->_fractionalCohortMemberships;
  uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v37 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * i), "copyWithZone:", a3, (void)v36);
        [(id)v5 addFractionalCohortMembership:v34];
      }
      uint64_t v31 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v31);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:")) {
      goto LABEL_36;
    }
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:")) {
      goto LABEL_36;
    }
  }
  anfComponentType = self->_anfComponentType;
  if ((unint64_t)anfComponentType | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](anfComponentType, "isEqual:")) {
      goto LABEL_36;
    }
  }
  anfComponentId = self->_anfComponentId;
  if ((unint64_t)anfComponentId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](anfComponentId, "isEqual:")) {
      goto LABEL_36;
    }
  }
  anfComponentRole = self->_anfComponentRole;
  if ((unint64_t)anfComponentRole | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](anfComponentRole, "isEqual:")) {
      goto LABEL_36;
    }
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](metadata, "isEqual:")) {
      goto LABEL_36;
    }
  }
  articleVersion = self->_articleVersion;
  if ((unint64_t)articleVersion | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](articleVersion, "isEqual:")) {
      goto LABEL_36;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 120) & 2) == 0 || self->_publisherArticleVersionInt64 != *((void *)v4 + 2)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 120) & 2) != 0)
  {
LABEL_36:
    char v17 = 0;
    goto LABEL_37;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 120) & 1) == 0 || self->_backendArticleVersionInt64 != *((void *)v4 + 1)) {
      goto LABEL_36;
    }
  }
  else if (*((unsigned char *)v4 + 120))
  {
    goto LABEL_36;
  }
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((void *)v4 + 10) && !-[NTPBIssueData isEqual:](issueData, "isEqual:")) {
    goto LABEL_36;
  }
  issueExposureData = self->_issueExposureData;
  if ((unint64_t)issueExposureData | *((void *)v4 + 11))
  {
    if (!-[NTPBIssueExposureData isEqual:](issueExposureData, "isEqual:")) {
      goto LABEL_36;
    }
  }
  issueViewData = self->_issueViewData;
  if ((unint64_t)issueViewData | *((void *)v4 + 12))
  {
    if (!-[NTPBIssueViewData isEqual:](issueViewData, "isEqual:")) {
      goto LABEL_36;
    }
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((void *)v4 + 8))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:")) {
      goto LABEL_36;
    }
  }
  fractionalCohortMemberships = self->_fractionalCohortMemberships;
  if ((unint64_t)fractionalCohortMemberships | *((void *)v4 + 9)) {
    char v17 = -[NSMutableArray isEqual:](fractionalCohortMemberships, "isEqual:");
  }
  else {
    char v17 = 1;
  }
LABEL_37:

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_articleId hash];
  NSUInteger v4 = [(NSString *)self->_sourceChannelId hash];
  NSUInteger v5 = [(NSString *)self->_anfComponentType hash];
  NSUInteger v6 = [(NSString *)self->_anfComponentId hash];
  NSUInteger v7 = [(NSString *)self->_anfComponentRole hash];
  NSUInteger v8 = [(NSString *)self->_metadata hash];
  NSUInteger v9 = [(NSString *)self->_articleVersion hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v10 = 2654435761 * self->_publisherArticleVersionInt64;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v11 = 0;
    goto LABEL_6;
  }
  uint64_t v10 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v11 = 2654435761 * self->_backendArticleVersionInt64;
LABEL_6:
  NSUInteger v12 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  unint64_t v13 = v10 ^ v11 ^ [(NTPBIssueData *)self->_issueData hash];
  unint64_t v14 = v13 ^ [(NTPBIssueExposureData *)self->_issueExposureData hash];
  unint64_t v15 = v12 ^ v14 ^ [(NTPBIssueViewData *)self->_issueViewData hash];
  uint64_t v16 = [(NSData *)self->_articleViewingSessionId hash];
  return v15 ^ v16 ^ [(NSMutableArray *)self->_fractionalCohortMemberships hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 6)) {
    -[NTPBAnfComponentExposure setArticleId:](self, "setArticleId:");
  }
  if (*((void *)v4 + 14)) {
    -[NTPBAnfComponentExposure setSourceChannelId:](self, "setSourceChannelId:");
  }
  if (*((void *)v4 + 5)) {
    -[NTPBAnfComponentExposure setAnfComponentType:](self, "setAnfComponentType:");
  }
  if (*((void *)v4 + 3)) {
    -[NTPBAnfComponentExposure setAnfComponentId:](self, "setAnfComponentId:");
  }
  if (*((void *)v4 + 4)) {
    -[NTPBAnfComponentExposure setAnfComponentRole:](self, "setAnfComponentRole:");
  }
  if (*((void *)v4 + 13)) {
    -[NTPBAnfComponentExposure setMetadata:](self, "setMetadata:");
  }
  if (*((void *)v4 + 7)) {
    -[NTPBAnfComponentExposure setArticleVersion:](self, "setArticleVersion:");
  }
  char v5 = *((unsigned char *)v4 + 120);
  if ((v5 & 2) != 0)
  {
    self->_publisherArticleVersionInt64 = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 120);
  }
  if (v5)
  {
    self->_backendArticleVersionInt64 = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  issueData = self->_issueData;
  uint64_t v7 = *((void *)v4 + 10);
  if (issueData)
  {
    if (v7) {
      -[NTPBIssueData mergeFrom:](issueData, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[NTPBAnfComponentExposure setIssueData:](self, "setIssueData:");
  }
  issueExposureData = self->_issueExposureData;
  uint64_t v9 = *((void *)v4 + 11);
  if (issueExposureData)
  {
    if (v9) {
      -[NTPBIssueExposureData mergeFrom:](issueExposureData, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[NTPBAnfComponentExposure setIssueExposureData:](self, "setIssueExposureData:");
  }
  issueViewData = self->_issueViewData;
  uint64_t v11 = *((void *)v4 + 12);
  if (issueViewData)
  {
    if (v11) {
      -[NTPBIssueViewData mergeFrom:](issueViewData, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[NTPBAnfComponentExposure setIssueViewData:](self, "setIssueViewData:");
  }
  if (*((void *)v4 + 8)) {
    -[NTPBAnfComponentExposure setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = *((id *)v4 + 9);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[NTPBAnfComponentExposure addFractionalCohortMembership:](self, "addFractionalCohortMembership:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
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

- (NSString)anfComponentType
{
  return self->_anfComponentType;
}

- (void)setAnfComponentType:(id)a3
{
}

- (NSString)anfComponentId
{
  return self->_anfComponentId;
}

- (void)setAnfComponentId:(id)a3
{
}

- (NSString)anfComponentRole
{
  return self->_anfComponentRole;
}

- (void)setAnfComponentRole:(id)a3
{
}

- (NSString)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (NSString)articleVersion
{
  return self->_articleVersion;
}

- (void)setArticleVersion:(id)a3
{
}

- (int64_t)publisherArticleVersionInt64
{
  return self->_publisherArticleVersionInt64;
}

- (int64_t)backendArticleVersionInt64
{
  return self->_backendArticleVersionInt64;
}

- (NTPBIssueData)issueData
{
  return self->_issueData;
}

- (void)setIssueData:(id)a3
{
}

- (NTPBIssueExposureData)issueExposureData
{
  return self->_issueExposureData;
}

- (void)setIssueExposureData:(id)a3
{
}

- (NTPBIssueViewData)issueViewData
{
  return self->_issueViewData;
}

- (void)setIssueViewData:(id)a3
{
}

- (NSData)articleViewingSessionId
{
  return self->_articleViewingSessionId;
}

- (void)setArticleViewingSessionId:(id)a3
{
}

- (NSMutableArray)fractionalCohortMemberships
{
  return self->_fractionalCohortMemberships;
}

- (void)setFractionalCohortMemberships:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_issueViewData, 0);
  objc_storeStrong((id *)&self->_issueExposureData, 0);
  objc_storeStrong((id *)&self->_issueData, 0);
  objc_storeStrong((id *)&self->_fractionalCohortMemberships, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);
  objc_storeStrong((id *)&self->_articleVersion, 0);
  objc_storeStrong((id *)&self->_articleId, 0);
  objc_storeStrong((id *)&self->_anfComponentType, 0);
  objc_storeStrong((id *)&self->_anfComponentRole, 0);

  objc_storeStrong((id *)&self->_anfComponentId, 0);
}

@end