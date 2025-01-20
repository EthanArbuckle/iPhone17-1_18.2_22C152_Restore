@interface NTPBNotificationSubscribeUnsubscribe
- (BOOL)hasCampaignId;
- (BOOL)hasCampaignType;
- (BOOL)hasChannelId;
- (BOOL)hasCreativeId;
- (BOOL)hasIsPaidUserOfChannel;
- (BOOL)hasNotificationSettingType;
- (BOOL)hasNotificationSubscribeUnsubscribeLocation;
- (BOOL)hasUserAction;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPaidUserOfChannel;
- (BOOL)readFrom:(id)a3;
- (NSString)campaignId;
- (NSString)campaignType;
- (NSString)channelId;
- (NSString)creativeId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)notificationSettingType;
- (int)notificationSubscribeUnsubscribeLocation;
- (int)userAction;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setCampaignId:(id)a3;
- (void)setCampaignType:(id)a3;
- (void)setChannelId:(id)a3;
- (void)setCreativeId:(id)a3;
- (void)setHasIsPaidUserOfChannel:(BOOL)a3;
- (void)setHasNotificationSettingType:(BOOL)a3;
- (void)setHasNotificationSubscribeUnsubscribeLocation:(BOOL)a3;
- (void)setHasUserAction:(BOOL)a3;
- (void)setIsPaidUserOfChannel:(BOOL)a3;
- (void)setNotificationSettingType:(int)a3;
- (void)setNotificationSubscribeUnsubscribeLocation:(int)a3;
- (void)setUserAction:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBNotificationSubscribeUnsubscribe

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

- (int)notificationSubscribeUnsubscribeLocation
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_notificationSubscribeUnsubscribeLocation;
  }
  else {
    return 0;
  }
}

- (void)setNotificationSubscribeUnsubscribeLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_notificationSubscribeUnsubscribeLocation = a3;
}

- (void)setHasNotificationSubscribeUnsubscribeLocation:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNotificationSubscribeUnsubscribeLocation
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasChannelId
{
  return self->_channelId != 0;
}

- (void)setIsPaidUserOfChannel:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isPaidUserOfChannel = a3;
}

- (void)setHasIsPaidUserOfChannel:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsPaidUserOfChannel
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
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

- (int)notificationSettingType
{
  if (*(unsigned char *)&self->_has) {
    return self->_notificationSettingType;
  }
  else {
    return 0;
  }
}

- (void)setNotificationSettingType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_notificationSettingType = a3;
}

- (void)setHasNotificationSettingType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNotificationSettingType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBNotificationSubscribeUnsubscribe;
  v4 = [(NTPBNotificationSubscribeUnsubscribe *)&v8 description];
  v5 = [(NTPBNotificationSubscribeUnsubscribe *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5 = [NSNumber numberWithInt:self->_userAction];
    [v3 setObject:v5 forKey:@"user_action"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = [NSNumber numberWithInt:self->_notificationSubscribeUnsubscribeLocation];
    [v3 setObject:v6 forKey:@"notification_subscribe_unsubscribe_location"];
  }
  channelId = self->_channelId;
  if (channelId) {
    [v3 setObject:channelId forKey:@"channel_id"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    objc_super v8 = [NSNumber numberWithBool:self->_isPaidUserOfChannel];
    [v3 setObject:v8 forKey:@"is_paid_user_of_channel"];
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
  if (*(unsigned char *)&self->_has)
  {
    v12 = [NSNumber numberWithInt:self->_notificationSettingType];
    [v3 setObject:v12 forKey:@"notification_setting_type"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBNotificationSubscribeUnsubscribeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_channelId) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteBOOLField();
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
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_userAction;
    *(unsigned char *)(v5 + 56) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 44) = self->_notificationSubscribeUnsubscribeLocation;
    *(unsigned char *)(v5 + 56) |= 2u;
  }
  uint64_t v8 = [(NSString *)self->_channelId copyWithZone:a3];
  v9 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v8;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(unsigned char *)(v6 + 52) = self->_isPaidUserOfChannel;
    *(unsigned char *)(v6 + 56) |= 8u;
  }
  uint64_t v10 = [(NSString *)self->_campaignId copyWithZone:a3];
  v11 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v10;

  uint64_t v12 = [(NSString *)self->_campaignType copyWithZone:a3];
  v13 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v12;

  uint64_t v14 = [(NSString *)self->_creativeId copyWithZone:a3];
  v15 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v14;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v6 + 40) = self->_notificationSettingType;
    *(unsigned char *)(v6 + 56) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_33;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_userAction != *((_DWORD *)v4 + 12)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
    goto LABEL_33;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_notificationSubscribeUnsubscribeLocation != *((_DWORD *)v4 + 11)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_33;
  }
  channelId = self->_channelId;
  if ((unint64_t)channelId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](channelId, "isEqual:")) {
      goto LABEL_33;
    }
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 8) != 0)
    {
      if (self->_isPaidUserOfChannel)
      {
        if (!*((unsigned char *)v4 + 52)) {
          goto LABEL_33;
        }
        goto LABEL_23;
      }
      if (!*((unsigned char *)v4 + 52)) {
        goto LABEL_23;
      }
    }
LABEL_33:
    BOOL v10 = 0;
    goto LABEL_34;
  }
  if ((*((unsigned char *)v4 + 56) & 8) != 0) {
    goto LABEL_33;
  }
LABEL_23:
  campaignId = self->_campaignId;
  if ((unint64_t)campaignId | *((void *)v4 + 1) && !-[NSString isEqual:](campaignId, "isEqual:")) {
    goto LABEL_33;
  }
  campaignType = self->_campaignType;
  if ((unint64_t)campaignType | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](campaignType, "isEqual:")) {
      goto LABEL_33;
    }
  }
  creativeId = self->_creativeId;
  if ((unint64_t)creativeId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](creativeId, "isEqual:")) {
      goto LABEL_33;
    }
  }
  BOOL v10 = (*((unsigned char *)v4 + 56) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_notificationSettingType != *((_DWORD *)v4 + 10)) {
      goto LABEL_33;
    }
    BOOL v10 = 1;
  }
LABEL_34:

  return v10;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v3 = 2654435761 * self->_userAction;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_notificationSubscribeUnsubscribeLocation;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_channelId hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v6 = 2654435761 * self->_isPaidUserOfChannel;
  }
  else {
    uint64_t v6 = 0;
  }
  NSUInteger v7 = [(NSString *)self->_campaignId hash];
  NSUInteger v8 = [(NSString *)self->_campaignType hash];
  NSUInteger v9 = [(NSString *)self->_creativeId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v10 = 2654435761 * self->_notificationSettingType;
  }
  else {
    uint64_t v10 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 56);
  if ((v5 & 4) != 0)
  {
    self->_userAction = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 56);
  }
  if ((v5 & 2) != 0)
  {
    self->_notificationSubscribeUnsubscribeLocation = *((_DWORD *)v4 + 11);
    *(unsigned char *)&self->_has |= 2u;
  }
  id v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[NTPBNotificationSubscribeUnsubscribe setChannelId:](self, "setChannelId:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 56) & 8) != 0)
  {
    self->_isPaidUserOfChannel = *((unsigned char *)v4 + 52);
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)v4 + 1))
  {
    -[NTPBNotificationSubscribeUnsubscribe setCampaignId:](self, "setCampaignId:");
    id v4 = v6;
  }
  if (*((void *)v4 + 2))
  {
    -[NTPBNotificationSubscribeUnsubscribe setCampaignType:](self, "setCampaignType:");
    id v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[NTPBNotificationSubscribeUnsubscribe setCreativeId:](self, "setCreativeId:");
    id v4 = v6;
  }
  if (*((unsigned char *)v4 + 56))
  {
    self->_notificationSettingType = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)channelId
{
  return self->_channelId;
}

- (void)setChannelId:(id)a3
{
}

- (BOOL)isPaidUserOfChannel
{
  return self->_isPaidUserOfChannel;
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
  objc_storeStrong((id *)&self->_channelId, 0);
  objc_storeStrong((id *)&self->_campaignType, 0);

  objc_storeStrong((id *)&self->_campaignId, 0);
}

@end