@interface NTPBSearchViewExposure
- (BOOL)hasAreaPresentationReason;
- (BOOL)hasCampaignId;
- (BOOL)hasCampaignType;
- (BOOL)hasCreativeId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)campaignId;
- (NSString)campaignType;
- (NSString)creativeId;
- (id)areaPresentationReasonAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsAreaPresentationReason:(id)a3;
- (int)areaPresentationReason;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setAreaPresentationReason:(int)a3;
- (void)setCampaignId:(id)a3;
- (void)setCampaignType:(id)a3;
- (void)setCreativeId:(id)a3;
- (void)setHasAreaPresentationReason:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBSearchViewExposure

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
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_264449E90[a3];
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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBSearchViewExposure;
  int v4 = [(NTPBSearchViewExposure *)&v8 description];
  v5 = [(NTPBSearchViewExposure *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t areaPresentationReason = self->_areaPresentationReason;
    if (areaPresentationReason >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_areaPresentationReason);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_264449E90[areaPresentationReason];
    }
    [v3 setObject:v5 forKey:@"area_presentation_reason"];
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

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBSearchViewExposureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_campaignId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_campaignType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_creativeId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_areaPresentationReason;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_campaignId copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  uint64_t v9 = [(NSString *)self->_campaignType copyWithZone:a3];
  v10 = (void *)v6[3];
  v6[3] = v9;

  uint64_t v11 = [(NSString *)self->_creativeId copyWithZone:a3];
  v12 = (void *)v6[4];
  v6[4] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_areaPresentationReason != *((_DWORD *)v4 + 2)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  campaignId = self->_campaignId;
  if ((unint64_t)campaignId | *((void *)v4 + 2) && !-[NSString isEqual:](campaignId, "isEqual:")) {
    goto LABEL_13;
  }
  campaignType = self->_campaignType;
  if ((unint64_t)campaignType | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](campaignType, "isEqual:")) {
      goto LABEL_13;
    }
  }
  creativeId = self->_creativeId;
  if ((unint64_t)creativeId | *((void *)v4 + 4)) {
    char v8 = -[NSString isEqual:](creativeId, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_areaPresentationReason;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_campaignId hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_campaignType hash];
  return v4 ^ v5 ^ [(NSString *)self->_creativeId hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[10])
  {
    self->_uint64_t areaPresentationReason = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
  NSUInteger v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[NTPBSearchViewExposure setCampaignId:](self, "setCampaignId:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[NTPBSearchViewExposure setCampaignType:](self, "setCampaignType:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[NTPBSearchViewExposure setCreativeId:](self, "setCreativeId:");
    NSUInteger v4 = v5;
  }
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creativeId, 0);
  objc_storeStrong((id *)&self->_campaignType, 0);

  objc_storeStrong((id *)&self->_campaignId, 0);
}

@end