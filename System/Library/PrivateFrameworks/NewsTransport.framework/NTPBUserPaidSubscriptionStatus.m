@interface NTPBUserPaidSubscriptionStatus
- (BOOL)hasPaidSubscriptionChannelId;
- (BOOL)hasPaidSubscriptionStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)paidSubscriptionChannelId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)paidSubscriptionStatusAsString:(int)a3;
- (int)StringAsPaidSubscriptionStatus:(id)a3;
- (int)paidSubscriptionStatus;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setHasPaidSubscriptionStatus:(BOOL)a3;
- (void)setPaidSubscriptionChannelId:(id)a3;
- (void)setPaidSubscriptionStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBUserPaidSubscriptionStatus

- (int)paidSubscriptionStatus
{
  if (*(unsigned char *)&self->_has) {
    return self->_paidSubscriptionStatus;
  }
  else {
    return 0;
  }
}

- (void)setPaidSubscriptionStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_paidSubscriptionStatus = a3;
}

- (void)setHasPaidSubscriptionStatus:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPaidSubscriptionStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)paidSubscriptionStatusAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_26444EFC0[a3];
  }

  return v3;
}

- (int)StringAsPaidSubscriptionStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_PAID_SUBSCRIPTION_STATUS"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FREE_TRIAL_PAID_SUBSCRIPTION_STATUS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ACTIVE_PAYING_PAID_SUBSCRIPTION_STATUS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"EXPIRED_PAID_SUBSCRIPTION_STATUS"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasPaidSubscriptionChannelId
{
  return self->_paidSubscriptionChannelId != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBUserPaidSubscriptionStatus;
  int v4 = [(NTPBUserPaidSubscriptionStatus *)&v8 description];
  v5 = [(NTPBUserPaidSubscriptionStatus *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t paidSubscriptionStatus = self->_paidSubscriptionStatus;
    if (paidSubscriptionStatus >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_paidSubscriptionStatus);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_26444EFC0[paidSubscriptionStatus];
    }
    [v3 setObject:v5 forKey:@"paid_subscription_status"];
  }
  paidSubscriptionChannelId = self->_paidSubscriptionChannelId;
  if (paidSubscriptionChannelId) {
    [v3 setObject:paidSubscriptionChannelId forKey:@"paid_subscription_channel_id"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBUserPaidSubscriptionStatusReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_paidSubscriptionChannelId)
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
    *(_DWORD *)(v5 + 16) = self->_paidSubscriptionStatus;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_paidSubscriptionChannelId copyWithZone:a3];
  objc_super v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_paidSubscriptionStatus != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  paidSubscriptionChannelId = self->_paidSubscriptionChannelId;
  if ((unint64_t)paidSubscriptionChannelId | *((void *)v4 + 1)) {
    char v6 = -[NSString isEqual:](paidSubscriptionChannelId, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_paidSubscriptionStatus;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSString *)self->_paidSubscriptionChannelId hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (v4[5])
  {
    self->_uint64_t paidSubscriptionStatus = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    uint64_t v5 = v4;
    -[NTPBUserPaidSubscriptionStatus setPaidSubscriptionChannelId:](self, "setPaidSubscriptionChannelId:");
    id v4 = v5;
  }
}

- (NSString)paidSubscriptionChannelId
{
  return self->_paidSubscriptionChannelId;
}

- (void)setPaidSubscriptionChannelId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end