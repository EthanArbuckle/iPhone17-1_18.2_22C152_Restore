@interface NTPBNotificationSettingsScreenView
- (BOOL)hasCampaignId;
- (BOOL)hasCampaignType;
- (BOOL)hasCreativeId;
- (BOOL)hasNotificationSettingsScreenViewPresentationReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)campaignId;
- (NSString)campaignType;
- (NSString)creativeId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)notificationSettingsScreenViewPresentationReason;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setCampaignId:(id)a3;
- (void)setCampaignType:(id)a3;
- (void)setCreativeId:(id)a3;
- (void)setHasNotificationSettingsScreenViewPresentationReason:(BOOL)a3;
- (void)setNotificationSettingsScreenViewPresentationReason:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBNotificationSettingsScreenView

- (int)notificationSettingsScreenViewPresentationReason
{
  if (*(unsigned char *)&self->_has) {
    return self->_notificationSettingsScreenViewPresentationReason;
  }
  else {
    return 0;
  }
}

- (void)setNotificationSettingsScreenViewPresentationReason:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_notificationSettingsScreenViewPresentationReason = a3;
}

- (void)setHasNotificationSettingsScreenViewPresentationReason:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNotificationSettingsScreenViewPresentationReason
{
  return *(unsigned char *)&self->_has & 1;
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
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBNotificationSettingsScreenView;
  v4 = [(NTPBNotificationSettingsScreenView *)&v8 description];
  v5 = [(NTPBNotificationSettingsScreenView *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithInt:self->_notificationSettingsScreenViewPresentationReason];
    [v3 setObject:v4 forKey:@"notification_settings_screen_view_presentation_reason"];
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
  return NTPBNotificationSettingsScreenViewReadFrom((uint64_t)self, (uint64_t)a3);
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
    *(_DWORD *)(v5 + 32) = self->_notificationSettingsScreenViewPresentationReason;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_campaignId copyWithZone:a3];
  objc_super v8 = (void *)v6[1];
  v6[1] = v7;

  uint64_t v9 = [(NSString *)self->_campaignType copyWithZone:a3];
  v10 = (void *)v6[2];
  v6[2] = v9;

  uint64_t v11 = [(NSString *)self->_creativeId copyWithZone:a3];
  v12 = (void *)v6[3];
  v6[3] = v11;

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
    if ((*((unsigned char *)v4 + 36) & 1) == 0
      || self->_notificationSettingsScreenViewPresentationReason != *((_DWORD *)v4 + 8))
    {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  campaignId = self->_campaignId;
  if ((unint64_t)campaignId | *((void *)v4 + 1) && !-[NSString isEqual:](campaignId, "isEqual:")) {
    goto LABEL_13;
  }
  campaignType = self->_campaignType;
  if ((unint64_t)campaignType | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](campaignType, "isEqual:")) {
      goto LABEL_13;
    }
  }
  creativeId = self->_creativeId;
  if ((unint64_t)creativeId | *((void *)v4 + 3)) {
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
    uint64_t v3 = 2654435761 * self->_notificationSettingsScreenViewPresentationReason;
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
  if (v4[9])
  {
    self->_notificationSettingsScreenViewPresentationReason = v4[8];
    *(unsigned char *)&self->_has |= 1u;
  }
  NSUInteger v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[NTPBNotificationSettingsScreenView setCampaignId:](self, "setCampaignId:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[NTPBNotificationSettingsScreenView setCampaignType:](self, "setCampaignType:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[NTPBNotificationSettingsScreenView setCreativeId:](self, "setCreativeId:");
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