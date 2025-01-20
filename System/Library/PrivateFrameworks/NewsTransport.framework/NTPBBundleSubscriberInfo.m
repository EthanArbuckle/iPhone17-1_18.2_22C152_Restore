@interface NTPBBundleSubscriberInfo
+ (Class)subscribedChannelIdsType;
- (BOOL)hasBundleSubscriptionStatus;
- (BOOL)hasIsAmplifyUser;
- (BOOL)hasIsBundlePurchaser;
- (BOOL)hasIsStoreDemoModeEnabled;
- (BOOL)hasStartTimestamp;
- (BOOL)hasUserId;
- (BOOL)hasUserStorefrontId;
- (BOOL)isAmplifyUser;
- (BOOL)isBundlePurchaser;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStoreDemoModeEnabled;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)subscribedChannelIds;
- (NSString)userId;
- (NSString)userStorefrontId;
- (id)bundleSubscriptionStatusAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)subscribedChannelIdsAtIndex:(unint64_t)a3;
- (int)StringAsBundleSubscriptionStatus:(id)a3;
- (int)bundleSubscriptionStatus;
- (int64_t)startTimestamp;
- (unint64_t)hash;
- (unint64_t)subscribedChannelIdsCount;
- (void)addSubscribedChannelIds:(id)a3;
- (void)clearSubscribedChannelIds;
- (void)mergeFrom:(id)a3;
- (void)setBundleSubscriptionStatus:(int)a3;
- (void)setHasBundleSubscriptionStatus:(BOOL)a3;
- (void)setHasIsAmplifyUser:(BOOL)a3;
- (void)setHasIsBundlePurchaser:(BOOL)a3;
- (void)setHasIsStoreDemoModeEnabled:(BOOL)a3;
- (void)setHasStartTimestamp:(BOOL)a3;
- (void)setIsAmplifyUser:(BOOL)a3;
- (void)setIsBundlePurchaser:(BOOL)a3;
- (void)setIsStoreDemoModeEnabled:(BOOL)a3;
- (void)setStartTimestamp:(int64_t)a3;
- (void)setSubscribedChannelIds:(id)a3;
- (void)setUserId:(id)a3;
- (void)setUserStorefrontId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBBundleSubscriberInfo

- (int)bundleSubscriptionStatus
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_bundleSubscriptionStatus;
  }
  else {
    return 0;
  }
}

- (void)setBundleSubscriptionStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_bundleSubscriptionStatus = a3;
}

- (void)setHasBundleSubscriptionStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBundleSubscriptionStatus
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)bundleSubscriptionStatusAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26444BFF8[a3];
  }

  return v3;
}

- (int)StringAsBundleSubscriptionStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_BUNDLE_SUBSCRIPTION_STATUS"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"UNPAID_BUNDLE_SUBSCRIPTION_STATUS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PAID_BUNDLE_SUBSCRIPTION_STATUS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NO_BUNDLE_SUBSCRIPTION_STATUS"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearSubscribedChannelIds
{
}

- (void)addSubscribedChannelIds:(id)a3
{
  id v4 = a3;
  subscribedChannelIds = self->_subscribedChannelIds;
  id v8 = v4;
  if (!subscribedChannelIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_subscribedChannelIds;
    self->_subscribedChannelIds = v6;

    id v4 = v8;
    subscribedChannelIds = self->_subscribedChannelIds;
  }
  [(NSMutableArray *)subscribedChannelIds addObject:v4];
}

- (unint64_t)subscribedChannelIdsCount
{
  return [(NSMutableArray *)self->_subscribedChannelIds count];
}

- (id)subscribedChannelIdsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_subscribedChannelIds objectAtIndex:a3];
}

+ (Class)subscribedChannelIdsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasUserId
{
  return self->_userId != 0;
}

- (BOOL)hasUserStorefrontId
{
  return self->_userStorefrontId != 0;
}

- (void)setStartTimestamp:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_startTimestamp = a3;
}

- (void)setHasStartTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStartTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsStoreDemoModeEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_isStoreDemoModeEnabled = a3;
}

- (void)setHasIsStoreDemoModeEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsStoreDemoModeEnabled
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setIsBundlePurchaser:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isBundlePurchaser = a3;
}

- (void)setHasIsBundlePurchaser:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsBundlePurchaser
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsAmplifyUser:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isAmplifyUser = a3;
}

- (void)setHasIsAmplifyUser:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsAmplifyUser
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBBundleSubscriberInfo;
  id v4 = [(NTPBBundleSubscriberInfo *)&v8 description];
  v5 = [(NTPBBundleSubscriberInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t bundleSubscriptionStatus = self->_bundleSubscriptionStatus;
    if (bundleSubscriptionStatus >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_bundleSubscriptionStatus);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_26444BFF8[bundleSubscriptionStatus];
    }
    [v3 setObject:v5 forKey:@"bundle_subscription_status"];
  }
  subscribedChannelIds = self->_subscribedChannelIds;
  if (subscribedChannelIds) {
    [v3 setObject:subscribedChannelIds forKey:@"subscribed_channel_ids"];
  }
  userId = self->_userId;
  if (userId) {
    [v3 setObject:userId forKey:@"user_id"];
  }
  userStorefrontId = self->_userStorefrontId;
  if (userStorefrontId) {
    [v3 setObject:userStorefrontId forKey:@"user_storefront_id"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v12 = [NSNumber numberWithLongLong:self->_startTimestamp];
    [v3 setObject:v12 forKey:@"start_timestamp"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_14:
      if ((has & 8) == 0) {
        goto LABEL_15;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_14;
  }
  v13 = [NSNumber numberWithBool:self->_isStoreDemoModeEnabled];
  [v3 setObject:v13 forKey:@"is_store_demo_mode_enabled"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_15:
    if ((has & 4) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_22:
  v14 = [NSNumber numberWithBool:self->_isBundlePurchaser];
  [v3 setObject:v14 forKey:@"is_bundle_purchaser"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_16:
    v10 = [NSNumber numberWithBool:self->_isAmplifyUser];
    [v3 setObject:v10 forKey:@"is_amplify_user"];
  }
LABEL_17:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBBundleSubscriberInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = self->_subscribedChannelIds;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  if (self->_userId) {
    PBDataWriterWriteStringField();
  }
  if (self->_userStorefrontId) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_16:
      if ((has & 8) == 0) {
        goto LABEL_17;
      }
LABEL_22:
      PBDataWriterWriteBOOLField();
      if ((*(unsigned char *)&self->_has & 4) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_22;
  }
LABEL_17:
  if ((has & 4) != 0) {
LABEL_18:
  }
    PBDataWriterWriteBOOLField();
LABEL_19:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_bundleSubscriptionStatus;
    *(unsigned char *)(v5 + 52) |= 2u;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = self->_subscribedChannelIds;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "copyWithZone:", a3, (void)v19);
        [(id)v6 addSubscribedChannelIds:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  uint64_t v13 = [(NSString *)self->_userId copyWithZone:a3];
  long long v14 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v13;

  uint64_t v15 = [(NSString *)self->_userStorefrontId copyWithZone:a3];
  uint64_t v16 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v15;

  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v6 + 8) = self->_startTimestamp;
    *(unsigned char *)(v6 + 52) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_12:
      if ((has & 8) == 0) {
        goto LABEL_13;
      }
LABEL_18:
      *(unsigned char *)(v6 + 49) = self->_isBundlePurchaser;
      *(unsigned char *)(v6 + 52) |= 8u;
      if ((*(unsigned char *)&self->_has & 4) == 0) {
        return (id)v6;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_12;
  }
  *(unsigned char *)(v6 + 50) = self->_isStoreDemoModeEnabled;
  *(unsigned char *)(v6 + 52) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_18;
  }
LABEL_13:
  if ((has & 4) != 0)
  {
LABEL_14:
    *(unsigned char *)(v6 + 48) = self->_isAmplifyUser;
    *(unsigned char *)(v6 + 52) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_bundleSubscriptionStatus != *((_DWORD *)v4 + 4)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    goto LABEL_36;
  }
  subscribedChannelIds = self->_subscribedChannelIds;
  if ((unint64_t)subscribedChannelIds | *((void *)v4 + 3)
    && !-[NSMutableArray isEqual:](subscribedChannelIds, "isEqual:"))
  {
    goto LABEL_36;
  }
  userId = self->_userId;
  if ((unint64_t)userId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](userId, "isEqual:")) {
      goto LABEL_36;
    }
  }
  userStorefrontId = self->_userStorefrontId;
  if ((unint64_t)userStorefrontId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](userStorefrontId, "isEqual:")) {
      goto LABEL_36;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_startTimestamp != *((void *)v4 + 1)) {
      goto LABEL_36;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 0x10) == 0) {
      goto LABEL_36;
    }
    if (self->_isStoreDemoModeEnabled)
    {
      if (!*((unsigned char *)v4 + 50)) {
        goto LABEL_36;
      }
    }
    else if (*((unsigned char *)v4 + 50))
    {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 0x10) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 8) == 0) {
      goto LABEL_36;
    }
    if (self->_isBundlePurchaser)
    {
      if (!*((unsigned char *)v4 + 49)) {
        goto LABEL_36;
      }
    }
    else if (*((unsigned char *)v4 + 49))
    {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 8) != 0)
  {
    goto LABEL_36;
  }
  BOOL v8 = (*((unsigned char *)v4 + 52) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 4) != 0)
    {
      if (self->_isAmplifyUser)
      {
        if (!*((unsigned char *)v4 + 48)) {
          goto LABEL_36;
        }
      }
      else if (*((unsigned char *)v4 + 48))
      {
        goto LABEL_36;
      }
      BOOL v8 = 1;
      goto LABEL_37;
    }
LABEL_36:
    BOOL v8 = 0;
  }
LABEL_37:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_bundleSubscriptionStatus;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_subscribedChannelIds hash];
  NSUInteger v5 = [(NSString *)self->_userId hash];
  NSUInteger v6 = [(NSString *)self->_userStorefrontId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = 2654435761 * self->_startTimestamp;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_6:
      uint64_t v8 = 2654435761 * self->_isStoreDemoModeEnabled;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_7;
      }
LABEL_11:
      uint64_t v9 = 0;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_8;
      }
LABEL_12:
      uint64_t v10 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v9 = 2654435761 * self->_isBundlePurchaser;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_12;
  }
LABEL_8:
  uint64_t v10 = 2654435761 * self->_isAmplifyUser;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    self->_uint64_t bundleSubscriptionStatus = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = *((id *)v4 + 3);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        -[NTPBBundleSubscriberInfo addSubscribedChannelIds:](self, "addSubscribedChannelIds:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  if (*((void *)v5 + 4)) {
    -[NTPBBundleSubscriberInfo setUserId:](self, "setUserId:");
  }
  if (*((void *)v5 + 5)) {
    -[NTPBBundleSubscriberInfo setUserStorefrontId:](self, "setUserStorefrontId:");
  }
  char v11 = *((unsigned char *)v5 + 52);
  if (v11)
  {
    self->_startTimestamp = *((void *)v5 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v11 = *((unsigned char *)v5 + 52);
    if ((v11 & 0x10) == 0)
    {
LABEL_16:
      if ((v11 & 8) == 0) {
        goto LABEL_17;
      }
LABEL_22:
      self->_isBundlePurchaser = *((unsigned char *)v5 + 49);
      *(unsigned char *)&self->_has |= 8u;
      if ((*((unsigned char *)v5 + 52) & 4) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v5 + 52) & 0x10) == 0)
  {
    goto LABEL_16;
  }
  self->_isStoreDemoModeEnabled = *((unsigned char *)v5 + 50);
  *(unsigned char *)&self->_has |= 0x10u;
  char v11 = *((unsigned char *)v5 + 52);
  if ((v11 & 8) != 0) {
    goto LABEL_22;
  }
LABEL_17:
  if ((v11 & 4) != 0)
  {
LABEL_18:
    self->_isAmplifyUser = *((unsigned char *)v5 + 48);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_19:
}

- (NSMutableArray)subscribedChannelIds
{
  return self->_subscribedChannelIds;
}

- (void)setSubscribedChannelIds:(id)a3
{
}

- (NSString)userId
{
  return self->_userId;
}

- (void)setUserId:(id)a3
{
}

- (NSString)userStorefrontId
{
  return self->_userStorefrontId;
}

- (void)setUserStorefrontId:(id)a3
{
}

- (int64_t)startTimestamp
{
  return self->_startTimestamp;
}

- (BOOL)isStoreDemoModeEnabled
{
  return self->_isStoreDemoModeEnabled;
}

- (BOOL)isBundlePurchaser
{
  return self->_isBundlePurchaser;
}

- (BOOL)isAmplifyUser
{
  return self->_isAmplifyUser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userStorefrontId, 0);
  objc_storeStrong((id *)&self->_userId, 0);

  objc_storeStrong((id *)&self->_subscribedChannelIds, 0);
}

@end