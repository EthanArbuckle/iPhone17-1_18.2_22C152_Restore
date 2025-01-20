@interface NTPBArticleEngagement
- (BOOL)hasArticleEngagementType;
- (BOOL)hasArticleId;
- (BOOL)hasArticleOpenedAtTimestamp;
- (BOOL)hasChannelId;
- (BOOL)hasCountryCode;
- (BOOL)hasDeviceModel;
- (BOOL)hasEventTimestamp;
- (BOOL)hasIsPaidSubscriber;
- (BOOL)hasIssueData;
- (BOOL)hasIssueViewData;
- (BOOL)hasSessionId;
- (BOOL)hasUserId;
- (BOOL)hasUtcOffset;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPaidSubscriber;
- (BOOL)readFrom:(id)a3;
- (NSData)sessionId;
- (NSString)articleId;
- (NSString)channelId;
- (NSString)countryCode;
- (NSString)deviceModel;
- (NSString)userId;
- (NTPBIssueData)issueData;
- (NTPBIssueViewData)issueViewData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)articleEngagementType;
- (int)utcOffset;
- (int64_t)articleOpenedAtTimestamp;
- (int64_t)eventTimestamp;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setArticleEngagementType:(int)a3;
- (void)setArticleId:(id)a3;
- (void)setArticleOpenedAtTimestamp:(int64_t)a3;
- (void)setChannelId:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setDeviceModel:(id)a3;
- (void)setEventTimestamp:(int64_t)a3;
- (void)setHasArticleEngagementType:(BOOL)a3;
- (void)setHasArticleOpenedAtTimestamp:(BOOL)a3;
- (void)setHasEventTimestamp:(BOOL)a3;
- (void)setHasIsPaidSubscriber:(BOOL)a3;
- (void)setHasUtcOffset:(BOOL)a3;
- (void)setIsPaidSubscriber:(BOOL)a3;
- (void)setIssueData:(id)a3;
- (void)setIssueViewData:(id)a3;
- (void)setSessionId:(id)a3;
- (void)setUserId:(id)a3;
- (void)setUtcOffset:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBArticleEngagement

- (int)articleEngagementType
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_articleEngagementType;
  }
  else {
    return 0;
  }
}

- (void)setArticleEngagementType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_articleEngagementType = a3;
}

- (void)setHasArticleEngagementType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasArticleEngagementType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasSessionId
{
  return self->_sessionId != 0;
}

- (BOOL)hasUserId
{
  return self->_userId != 0;
}

- (void)setEventTimestamp:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_eventTimestamp = a3;
}

- (void)setHasEventTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEventTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (BOOL)hasChannelId
{
  return self->_channelId != 0;
}

- (void)setUtcOffset:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_utcOffset = a3;
}

- (void)setHasUtcOffset:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasUtcOffset
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasCountryCode
{
  return self->_countryCode != 0;
}

- (void)setArticleOpenedAtTimestamp:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_articleOpenedAtTimestamp = a3;
}

- (void)setHasArticleOpenedAtTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasArticleOpenedAtTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsPaidSubscriber:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_isPaidSubscriber = a3;
}

- (void)setHasIsPaidSubscriber:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsPaidSubscriber
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasIssueData
{
  return self->_issueData != 0;
}

- (BOOL)hasIssueViewData
{
  return self->_issueViewData != 0;
}

- (BOOL)hasDeviceModel
{
  return self->_deviceModel != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBArticleEngagement;
  v4 = [(NTPBArticleEngagement *)&v8 description];
  v5 = [(NTPBArticleEngagement *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4 = [NSNumber numberWithInt:self->_articleEngagementType];
    [v3 setObject:v4 forKey:@"article_engagement_type"];
  }
  sessionId = self->_sessionId;
  if (sessionId) {
    [v3 setObject:sessionId forKey:@"session_id"];
  }
  userId = self->_userId;
  if (userId) {
    [v3 setObject:userId forKey:@"user_id"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v7 = [NSNumber numberWithLongLong:self->_eventTimestamp];
    [v3 setObject:v7 forKey:@"event_timestamp"];
  }
  articleId = self->_articleId;
  if (articleId) {
    [v3 setObject:articleId forKey:@"article_id"];
  }
  channelId = self->_channelId;
  if (channelId) {
    [v3 setObject:channelId forKey:@"channel_id"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v10 = [NSNumber numberWithInt:self->_utcOffset];
    [v3 setObject:v10 forKey:@"utc_offset"];
  }
  countryCode = self->_countryCode;
  if (countryCode) {
    [v3 setObject:countryCode forKey:@"country_code"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v13 = [NSNumber numberWithLongLong:self->_articleOpenedAtTimestamp];
    [v3 setObject:v13 forKey:@"article_opened_at_timestamp"];

    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    v14 = [NSNumber numberWithBool:self->_isPaidSubscriber];
    [v3 setObject:v14 forKey:@"is_paid_subscriber"];
  }
  issueData = self->_issueData;
  if (issueData)
  {
    v16 = [(NTPBIssueData *)issueData dictionaryRepresentation];
    [v3 setObject:v16 forKey:@"issue_data"];
  }
  issueViewData = self->_issueViewData;
  if (issueViewData)
  {
    v18 = [(NTPBIssueViewData *)issueViewData dictionaryRepresentation];
    [v3 setObject:v18 forKey:@"issue_view_data"];
  }
  deviceModel = self->_deviceModel;
  if (deviceModel) {
    [v3 setObject:deviceModel forKey:@"device_model"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBArticleEngagementReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_sessionId)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_userId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
  if (self->_articleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_channelId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_countryCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_issueData)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_issueViewData)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_deviceModel)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_articleEngagementType;
    *(unsigned char *)(v5 + 104) |= 4u;
  }
  uint64_t v7 = [(NSData *)self->_sessionId copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v7;

  uint64_t v9 = [(NSString *)self->_userId copyWithZone:a3];
  v10 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v9;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v6 + 16) = self->_eventTimestamp;
    *(unsigned char *)(v6 + 104) |= 2u;
  }
  uint64_t v11 = [(NSString *)self->_articleId copyWithZone:a3];
  v12 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v11;

  uint64_t v13 = [(NSString *)self->_channelId copyWithZone:a3];
  v14 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v13;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v6 + 96) = self->_utcOffset;
    *(unsigned char *)(v6 + 104) |= 8u;
  }
  uint64_t v15 = [(NSString *)self->_countryCode copyWithZone:a3];
  v16 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v15;

  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v6 + 8) = self->_articleOpenedAtTimestamp;
    *(unsigned char *)(v6 + 104) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *(unsigned char *)(v6 + 100) = self->_isPaidSubscriber;
    *(unsigned char *)(v6 + 104) |= 0x10u;
  }
  id v18 = [(NTPBIssueData *)self->_issueData copyWithZone:a3];
  v19 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v18;

  id v20 = [(NTPBIssueViewData *)self->_issueViewData copyWithZone:a3];
  v21 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v20;

  uint64_t v22 = [(NSString *)self->_deviceModel copyWithZone:a3];
  v23 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v22;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_47;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 104) & 4) == 0 || self->_articleEngagementType != *((_DWORD *)v4 + 6)) {
      goto LABEL_47;
    }
  }
  else if ((*((unsigned char *)v4 + 104) & 4) != 0)
  {
    goto LABEL_47;
  }
  sessionId = self->_sessionId;
  if ((unint64_t)sessionId | *((void *)v4 + 10) && !-[NSData isEqual:](sessionId, "isEqual:")) {
    goto LABEL_47;
  }
  userId = self->_userId;
  if ((unint64_t)userId | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](userId, "isEqual:")) {
      goto LABEL_47;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 104) & 2) == 0 || self->_eventTimestamp != *((void *)v4 + 2)) {
      goto LABEL_47;
    }
  }
  else if ((*((unsigned char *)v4 + 104) & 2) != 0)
  {
    goto LABEL_47;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((void *)v4 + 4) && !-[NSString isEqual:](articleId, "isEqual:")) {
    goto LABEL_47;
  }
  channelId = self->_channelId;
  if ((unint64_t)channelId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](channelId, "isEqual:")) {
      goto LABEL_47;
    }
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 104) & 8) == 0 || self->_utcOffset != *((_DWORD *)v4 + 24)) {
      goto LABEL_47;
    }
  }
  else if ((*((unsigned char *)v4 + 104) & 8) != 0)
  {
    goto LABEL_47;
  }
  countryCode = self->_countryCode;
  if ((unint64_t)countryCode | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](countryCode, "isEqual:")) {
      goto LABEL_47;
    }
    char has = (char)self->_has;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 104) & 1) == 0 || self->_articleOpenedAtTimestamp != *((void *)v4 + 1)) {
      goto LABEL_47;
    }
  }
  else if (*((unsigned char *)v4 + 104))
  {
    goto LABEL_47;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 104) & 0x10) != 0)
    {
      if (self->_isPaidSubscriber)
      {
        if (!*((unsigned char *)v4 + 100)) {
          goto LABEL_47;
        }
        goto LABEL_41;
      }
      if (!*((unsigned char *)v4 + 100)) {
        goto LABEL_41;
      }
    }
LABEL_47:
    char v14 = 0;
    goto LABEL_48;
  }
  if ((*((unsigned char *)v4 + 104) & 0x10) != 0) {
    goto LABEL_47;
  }
LABEL_41:
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((void *)v4 + 8) && !-[NTPBIssueData isEqual:](issueData, "isEqual:")) {
    goto LABEL_47;
  }
  issueViewData = self->_issueViewData;
  if ((unint64_t)issueViewData | *((void *)v4 + 9))
  {
    if (!-[NTPBIssueViewData isEqual:](issueViewData, "isEqual:")) {
      goto LABEL_47;
    }
  }
  deviceModel = self->_deviceModel;
  if ((unint64_t)deviceModel | *((void *)v4 + 7)) {
    char v14 = -[NSString isEqual:](deviceModel, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_48:

  return v14;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v3 = 2654435761 * self->_articleEngagementType;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSData *)self->_sessionId hash];
  NSUInteger v5 = [(NSString *)self->_userId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_eventTimestamp;
  }
  else {
    uint64_t v6 = 0;
  }
  NSUInteger v7 = [(NSString *)self->_articleId hash];
  NSUInteger v8 = [(NSString *)self->_channelId hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v9 = 2654435761 * self->_utcOffset;
  }
  else {
    uint64_t v9 = 0;
  }
  NSUInteger v10 = [(NSString *)self->_countryCode hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v11 = 2654435761 * self->_articleOpenedAtTimestamp;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_12;
    }
LABEL_14:
    uint64_t v12 = 0;
    goto LABEL_15;
  }
  uint64_t v11 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_14;
  }
LABEL_12:
  uint64_t v12 = 2654435761 * self->_isPaidSubscriber;
LABEL_15:
  unint64_t v13 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ [(NTPBIssueData *)self->_issueData hash];
  unint64_t v14 = [(NTPBIssueViewData *)self->_issueViewData hash];
  return v13 ^ v14 ^ [(NSString *)self->_deviceModel hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  NSUInteger v5 = v4;
  if ((v4[26] & 4) != 0)
  {
    self->_articleEngagementType = v4[6];
    *(unsigned char *)&self->_has |= 4u;
  }
  uint64_t v11 = v4;
  if (*((void *)v4 + 10))
  {
    -[NTPBArticleEngagement setSessionId:](self, "setSessionId:");
    NSUInteger v5 = v11;
  }
  if (*((void *)v5 + 11))
  {
    -[NTPBArticleEngagement setUserId:](self, "setUserId:");
    NSUInteger v5 = v11;
  }
  if ((v5[26] & 2) != 0)
  {
    self->_eventTimestamp = *((void *)v5 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v5 + 4))
  {
    -[NTPBArticleEngagement setArticleId:](self, "setArticleId:");
    NSUInteger v5 = v11;
  }
  if (*((void *)v5 + 5))
  {
    -[NTPBArticleEngagement setChannelId:](self, "setChannelId:");
    NSUInteger v5 = v11;
  }
  if ((v5[26] & 8) != 0)
  {
    self->_utcOffset = v5[24];
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)v5 + 6))
  {
    -[NTPBArticleEngagement setCountryCode:](self, "setCountryCode:");
    NSUInteger v5 = v11;
  }
  char v6 = *((unsigned char *)v5 + 104);
  if (v6)
  {
    self->_articleOpenedAtTimestamp = *((void *)v5 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v5 + 104);
  }
  if ((v6 & 0x10) != 0)
  {
    self->_isPaidSubscriber = *((unsigned char *)v5 + 100);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  issueData = self->_issueData;
  uint64_t v8 = *((void *)v5 + 8);
  if (issueData)
  {
    if (!v8) {
      goto LABEL_27;
    }
    -[NTPBIssueData mergeFrom:](issueData, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_27;
    }
    -[NTPBArticleEngagement setIssueData:](self, "setIssueData:");
  }
  NSUInteger v5 = v11;
LABEL_27:
  issueViewData = self->_issueViewData;
  uint64_t v10 = *((void *)v5 + 9);
  if (issueViewData)
  {
    if (!v10) {
      goto LABEL_33;
    }
    -[NTPBIssueViewData mergeFrom:](issueViewData, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_33;
    }
    -[NTPBArticleEngagement setIssueViewData:](self, "setIssueViewData:");
  }
  NSUInteger v5 = v11;
LABEL_33:
  if (*((void *)v5 + 7)) {
    -[NTPBArticleEngagement setDeviceModel:](self, "setDeviceModel:");
  }

  MEMORY[0x270F9A758]();
}

- (NSData)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
}

- (NSString)userId
{
  return self->_userId;
}

- (void)setUserId:(id)a3
{
}

- (int64_t)eventTimestamp
{
  return self->_eventTimestamp;
}

- (NSString)articleId
{
  return self->_articleId;
}

- (void)setArticleId:(id)a3
{
}

- (NSString)channelId
{
  return self->_channelId;
}

- (void)setChannelId:(id)a3
{
}

- (int)utcOffset
{
  return self->_utcOffset;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (int64_t)articleOpenedAtTimestamp
{
  return self->_articleOpenedAtTimestamp;
}

- (BOOL)isPaidSubscriber
{
  return self->_isPaidSubscriber;
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

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_issueViewData, 0);
  objc_storeStrong((id *)&self->_issueData, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_channelId, 0);

  objc_storeStrong((id *)&self->_articleId, 0);
}

@end