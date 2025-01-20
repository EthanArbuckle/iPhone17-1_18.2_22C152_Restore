@interface NTPBAppleIdSignInResult
- (BOOL)hasPaidSubscriptionConversionPointType;
- (BOOL)hasSignInResult;
- (BOOL)hasSubscriptionPurchaseSessionId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)subscriptionPurchaseSessionId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)paidSubscriptionConversionPointTypeAsString:(int)a3;
- (int)StringAsPaidSubscriptionConversionPointType:(id)a3;
- (int)paidSubscriptionConversionPointType;
- (int)signInResult;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setHasPaidSubscriptionConversionPointType:(BOOL)a3;
- (void)setHasSignInResult:(BOOL)a3;
- (void)setPaidSubscriptionConversionPointType:(int)a3;
- (void)setSignInResult:(int)a3;
- (void)setSubscriptionPurchaseSessionId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBAppleIdSignInResult

- (int)signInResult
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_signInResult;
  }
  else {
    return 0;
  }
}

- (void)setSignInResult:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_signInResult = a3;
}

- (void)setHasSignInResult:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSignInResult
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)paidSubscriptionConversionPointType
{
  if (*(unsigned char *)&self->_has) {
    return self->_paidSubscriptionConversionPointType;
  }
  else {
    return 0;
  }
}

- (void)setPaidSubscriptionConversionPointType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_paidSubscriptionConversionPointType = a3;
}

- (void)setHasPaidSubscriptionConversionPointType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPaidSubscriptionConversionPointType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)paidSubscriptionConversionPointTypeAsString:(int)a3
{
  if (a3 >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26444C3D8[a3];
  }

  return v3;
}

- (int)StringAsPaidSubscriptionConversionPointType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TOP_OF_ARTICLE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"HARD_PAYWALL_CHANNEL_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"HARD_PAYWALL_END_OF_ARTICLE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"HARD_PAYWALL_IN_ARTICLE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SUBSCRIBER_SOCIAL_SHARE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"IN_FEED_AD_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"IN_ARTICLE_AD_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"TOP_OF_ARTICLE_SOCIAL_SHARE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"HARD_PAYWALL_SOCIAL_SHARE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SUBSCRIPTION_EXPIRATION_RENEWAL_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"HARD_PAYWALL_SWIPING_BETWEEN_ARTICLES_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"TOP_OF_ARTICLE_SWIPING_BETWEEN_ARTICLES_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"TOP_OF_CHANNEL_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"INTERSTITIAL_AD_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"END_OF_ARTICLE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"GROUP_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"LANDING_PAGE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"MAGAZINE_FEED_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"ISSUE_TOC_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"AUDIO_FEED_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"SUBSCRIPTION_OFFERS_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 21;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasSubscriptionPurchaseSessionId
{
  return self->_subscriptionPurchaseSessionId != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBAppleIdSignInResult;
  int v4 = [(NTPBAppleIdSignInResult *)&v8 description];
  v5 = [(NTPBAppleIdSignInResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = [NSNumber numberWithInt:self->_signInResult];
    [v3 setObject:v5 forKey:@"sign_in_result"];

    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t paidSubscriptionConversionPointType = self->_paidSubscriptionConversionPointType;
    if (paidSubscriptionConversionPointType >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_paidSubscriptionConversionPointType);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_26444C3D8[paidSubscriptionConversionPointType];
    }
    [v3 setObject:v7 forKey:@"paid_subscription_conversion_point_type"];
  }
  subscriptionPurchaseSessionId = self->_subscriptionPurchaseSessionId;
  if (subscriptionPurchaseSessionId) {
    [v3 setObject:subscriptionPurchaseSessionId forKey:@"subscription_purchase_session_id"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAppleIdSignInResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_subscriptionPurchaseSessionId)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 12) = self->_signInResult;
    *(unsigned char *)(v5 + 24) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 8) = self->_paidSubscriptionConversionPointType;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  uint64_t v8 = [(NSData *)self->_subscriptionPurchaseSessionId copyWithZone:a3];
  v9 = (void *)v6[2];
  v6[2] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_signInResult != *((_DWORD *)v4 + 3)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
LABEL_14:
    char v6 = 0;
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_paidSubscriptionConversionPointType != *((_DWORD *)v4 + 2)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_14;
  }
  subscriptionPurchaseSessionId = self->_subscriptionPurchaseSessionId;
  if ((unint64_t)subscriptionPurchaseSessionId | *((void *)v4 + 2)) {
    char v6 = -[NSData isEqual:](subscriptionPurchaseSessionId, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_signInResult;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(NSData *)self->_subscriptionPurchaseSessionId hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_paidSubscriptionConversionPointType;
  return v3 ^ v2 ^ [(NSData *)self->_subscriptionPurchaseSessionId hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 2) != 0)
  {
    self->_signInResult = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 24);
  }
  if (v5)
  {
    self->_uint64_t paidSubscriptionConversionPointType = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    id v6 = v4;
    -[NTPBAppleIdSignInResult setSubscriptionPurchaseSessionId:](self, "setSubscriptionPurchaseSessionId:");
    id v4 = v6;
  }
}

- (NSData)subscriptionPurchaseSessionId
{
  return self->_subscriptionPurchaseSessionId;
}

- (void)setSubscriptionPurchaseSessionId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end