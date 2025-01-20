@interface NTPBRestorePaidSubscriptionItem
- (BOOL)hasIsNewsAppPurchase;
- (BOOL)hasRestoredPaidSubscriptionChannelId;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNewsAppPurchase;
- (BOOL)readFrom:(id)a3;
- (NSString)restoredPaidSubscriptionChannelId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setHasIsNewsAppPurchase:(BOOL)a3;
- (void)setIsNewsAppPurchase:(BOOL)a3;
- (void)setRestoredPaidSubscriptionChannelId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBRestorePaidSubscriptionItem

- (BOOL)hasRestoredPaidSubscriptionChannelId
{
  return self->_restoredPaidSubscriptionChannelId != 0;
}

- (void)setIsNewsAppPurchase:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isNewsAppPurchase = a3;
}

- (void)setHasIsNewsAppPurchase:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsNewsAppPurchase
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBRestorePaidSubscriptionItem;
  v4 = [(NTPBRestorePaidSubscriptionItem *)&v8 description];
  v5 = [(NTPBRestorePaidSubscriptionItem *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  restoredPaidSubscriptionChannelId = self->_restoredPaidSubscriptionChannelId;
  if (restoredPaidSubscriptionChannelId) {
    [v3 setObject:restoredPaidSubscriptionChannelId forKey:@"restored_paid_subscription_channel_id"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithBool:self->_isNewsAppPurchase];
    [v4 setObject:v6 forKey:@"is_news_app_purchase"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBRestorePaidSubscriptionItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_restoredPaidSubscriptionChannelId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_restoredPaidSubscriptionChannelId copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 16) = self->_isNewsAppPurchase;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  restoredPaidSubscriptionChannelId = self->_restoredPaidSubscriptionChannelId;
  if ((unint64_t)restoredPaidSubscriptionChannelId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](restoredPaidSubscriptionChannelId, "isEqual:")) {
      goto LABEL_6;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0)
    {
LABEL_6:
      BOOL v6 = 0;
      goto LABEL_7;
    }
    if (self->_isNewsAppPurchase)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_6;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_6;
    }
    BOOL v6 = 1;
  }
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_restoredPaidSubscriptionChannelId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_isNewsAppPurchase;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  if (*((void *)v4 + 1))
  {
    uint64_t v5 = v4;
    -[NTPBRestorePaidSubscriptionItem setRestoredPaidSubscriptionChannelId:](self, "setRestoredPaidSubscriptionChannelId:");
    uint64_t v4 = v5;
  }
  if (v4[20])
  {
    self->_isNewsAppPurchase = v4[16];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)restoredPaidSubscriptionChannelId
{
  return self->_restoredPaidSubscriptionChannelId;
}

- (void)setRestoredPaidSubscriptionChannelId:(id)a3
{
}

- (BOOL)isNewsAppPurchase
{
  return self->_isNewsAppPurchase;
}

- (void).cxx_destruct
{
}

@end