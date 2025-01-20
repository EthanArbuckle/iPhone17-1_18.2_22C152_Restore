@interface NTPBNotificationEntity
+ (Class)tagIdType;
- (BOOL)hasNotificationType;
- (BOOL)hasPaidBundleSubscriptionStatus;
- (BOOL)hasSubscriberType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)tagIds;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)tagIdAtIndex:(unint64_t)a3;
- (int)notificationType;
- (int)paidBundleSubscriptionStatus;
- (int)subscriberType;
- (unint64_t)hash;
- (unint64_t)tagIdsCount;
- (void)addTagId:(id)a3;
- (void)clearTagIds;
- (void)mergeFrom:(id)a3;
- (void)setHasNotificationType:(BOOL)a3;
- (void)setHasPaidBundleSubscriptionStatus:(BOOL)a3;
- (void)setHasSubscriberType:(BOOL)a3;
- (void)setNotificationType:(int)a3;
- (void)setPaidBundleSubscriptionStatus:(int)a3;
- (void)setSubscriberType:(int)a3;
- (void)setTagIds:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBNotificationEntity

- (int)notificationType
{
  if (*(unsigned char *)&self->_has) {
    return self->_notificationType;
  }
  else {
    return 0;
  }
}

- (void)setNotificationType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_notificationType = a3;
}

- (void)setHasNotificationType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNotificationType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearTagIds
{
}

- (void)addTagId:(id)a3
{
  id v4 = a3;
  tagIds = self->_tagIds;
  id v8 = v4;
  if (!tagIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_tagIds;
    self->_tagIds = v6;

    id v4 = v8;
    tagIds = self->_tagIds;
  }
  [(NSMutableArray *)tagIds addObject:v4];
}

- (unint64_t)tagIdsCount
{
  return [(NSMutableArray *)self->_tagIds count];
}

- (id)tagIdAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_tagIds objectAtIndex:a3];
}

+ (Class)tagIdType
{
  return (Class)objc_opt_class();
}

- (int)subscriberType
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_subscriberType;
  }
  else {
    return 0;
  }
}

- (void)setSubscriberType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_subscriberType = a3;
}

- (void)setHasSubscriberType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSubscriberType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (int)paidBundleSubscriptionStatus
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_paidBundleSubscriptionStatus;
  }
  else {
    return 0;
  }
}

- (void)setPaidBundleSubscriptionStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_paidBundleSubscriptionStatus = a3;
}

- (void)setHasPaidBundleSubscriptionStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPaidBundleSubscriptionStatus
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBNotificationEntity;
  id v4 = [(NTPBNotificationEntity *)&v8 description];
  v5 = [(NTPBNotificationEntity *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithInt:self->_notificationType];
    [v3 setObject:v4 forKey:@"notification_type"];
  }
  tagIds = self->_tagIds;
  if (tagIds) {
    [v3 setObject:tagIds forKey:@"tag_id"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v7 = [NSNumber numberWithInt:self->_subscriberType];
    [v3 setObject:v7 forKey:@"subscriber_type"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithInt:self->_paidBundleSubscriptionStatus];
    [v3 setObject:v8 forKey:@"paid_bundle_subscription_status"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBNotificationEntityReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = self->_tagIds;
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

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_notificationType;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = self->_tagIds;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (void)v15);
        [(id)v6 addTagId:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_subscriberType;
    *(unsigned char *)(v6 + 32) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 12) = self->_paidBundleSubscriptionStatus;
    *(unsigned char *)(v6 + 32) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_notificationType != *((_DWORD *)v4 + 2)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_19;
  }
  tagIds = self->_tagIds;
  if ((unint64_t)tagIds | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](tagIds, "isEqual:"))
    {
LABEL_19:
      BOOL v7 = 0;
      goto LABEL_20;
    }
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_subscriberType != *((_DWORD *)v4 + 4)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_19;
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_paidBundleSubscriptionStatus != *((_DWORD *)v4 + 3)) {
      goto LABEL_19;
    }
    BOOL v7 = 1;
  }
LABEL_20:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_notificationType;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_tagIds hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v5 = 2654435761 * self->_subscriberType;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_paidBundleSubscriptionStatus;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (*((unsigned char *)v4 + 32))
  {
    self->_notificationType = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
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
        -[NTPBNotificationEntity addTagId:](self, "addTagId:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  char v11 = *((unsigned char *)v5 + 32);
  if ((v11 & 4) != 0)
  {
    self->_subscriberType = *((_DWORD *)v5 + 4);
    *(unsigned char *)&self->_has |= 4u;
    char v11 = *((unsigned char *)v5 + 32);
  }
  if ((v11 & 2) != 0)
  {
    self->_paidBundleSubscriptionStatus = *((_DWORD *)v5 + 3);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSMutableArray)tagIds
{
  return self->_tagIds;
}

- (void)setTagIds:(id)a3
{
}

- (void).cxx_destruct
{
}

@end