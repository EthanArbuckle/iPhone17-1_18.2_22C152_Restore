@interface NTPBPushNotifySubscriptionRequest
+ (Class)notificationEntityType;
+ (Class)topicsFollowedType;
- (BOOL)hasDeviceInfo;
- (BOOL)hasNotificationUserId;
- (BOOL)hasUserStorefrontId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)notificationEntitys;
- (NSMutableArray)topicsFolloweds;
- (NSString)notificationUserId;
- (NSString)userStorefrontId;
- (NTPBDeviceInfo)deviceInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)notificationEntityAtIndex:(unint64_t)a3;
- (id)topicsFollowedAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)notificationEntitysCount;
- (unint64_t)topicsFollowedsCount;
- (void)addNotificationEntity:(id)a3;
- (void)addTopicsFollowed:(id)a3;
- (void)clearNotificationEntitys;
- (void)clearTopicsFolloweds;
- (void)mergeFrom:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setNotificationEntitys:(id)a3;
- (void)setNotificationUserId:(id)a3;
- (void)setTopicsFolloweds:(id)a3;
- (void)setUserStorefrontId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBPushNotifySubscriptionRequest

- (BOOL)hasNotificationUserId
{
  return self->_notificationUserId != 0;
}

- (BOOL)hasDeviceInfo
{
  return self->_deviceInfo != 0;
}

- (void)clearNotificationEntitys
{
}

- (void)addNotificationEntity:(id)a3
{
  id v4 = a3;
  notificationEntitys = self->_notificationEntitys;
  id v8 = v4;
  if (!notificationEntitys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_notificationEntitys;
    self->_notificationEntitys = v6;

    id v4 = v8;
    notificationEntitys = self->_notificationEntitys;
  }
  [(NSMutableArray *)notificationEntitys addObject:v4];
}

- (unint64_t)notificationEntitysCount
{
  return [(NSMutableArray *)self->_notificationEntitys count];
}

- (id)notificationEntityAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_notificationEntitys objectAtIndex:a3];
}

+ (Class)notificationEntityType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasUserStorefrontId
{
  return self->_userStorefrontId != 0;
}

- (void)clearTopicsFolloweds
{
}

- (void)addTopicsFollowed:(id)a3
{
  id v4 = a3;
  topicsFolloweds = self->_topicsFolloweds;
  id v8 = v4;
  if (!topicsFolloweds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_topicsFolloweds;
    self->_topicsFolloweds = v6;

    id v4 = v8;
    topicsFolloweds = self->_topicsFolloweds;
  }
  [(NSMutableArray *)topicsFolloweds addObject:v4];
}

- (unint64_t)topicsFollowedsCount
{
  return [(NSMutableArray *)self->_topicsFolloweds count];
}

- (id)topicsFollowedAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_topicsFolloweds objectAtIndex:a3];
}

+ (Class)topicsFollowedType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBPushNotifySubscriptionRequest;
  id v4 = [(NTPBPushNotifySubscriptionRequest *)&v8 description];
  v5 = [(NTPBPushNotifySubscriptionRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  notificationUserId = self->_notificationUserId;
  if (notificationUserId) {
    [v3 setObject:notificationUserId forKey:@"notification_user_id"];
  }
  deviceInfo = self->_deviceInfo;
  if (deviceInfo)
  {
    v7 = [(NTPBDeviceInfo *)deviceInfo dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"device_info"];
  }
  if ([(NSMutableArray *)self->_notificationEntitys count])
  {
    objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_notificationEntitys, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v9 = self->_notificationEntitys;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v28 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v11);
    }

    [v4 setObject:v8 forKey:@"notification_entity"];
  }
  userStorefrontId = self->_userStorefrontId;
  if (userStorefrontId) {
    [v4 setObject:userStorefrontId forKey:@"user_storefront_id"];
  }
  if ([(NSMutableArray *)self->_topicsFolloweds count])
  {
    v16 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_topicsFolloweds, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v17 = self->_topicsFolloweds;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * j), "dictionaryRepresentation", (void)v24);
          [v16 addObject:v22];
        }
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v19);
    }

    [v4 setObject:v16 forKey:@"topics_followed"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPushNotifySubscriptionRequestReadFrom((id *)&self->super.super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_notificationUserId) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceInfo) {
    PBDataWriterWriteSubmessage();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_notificationEntitys;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  if (self->_userStorefrontId) {
    PBDataWriterWriteStringField();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = self->_topicsFolloweds;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_notificationUserId copyWithZone:a3];
  uint64_t v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(NTPBDeviceInfo *)self->_deviceInfo copyWithZone:a3];
  uint64_t v9 = (void *)v5[1];
  v5[1] = v8;

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v10 = self->_notificationEntitys;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v30;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = (void *)[*(id *)(*((void *)&v29 + 1) + 8 * v14) copyWithZone:a3];
        [v5 addNotificationEntity:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v12);
  }

  uint64_t v16 = [(NSString *)self->_userStorefrontId copyWithZone:a3];
  long long v17 = (void *)v5[5];
  v5[5] = v16;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v18 = self->_topicsFolloweds;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v22), "copyWithZone:", a3, (void)v25);
        [v5 addTopicsFollowed:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v20);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((notificationUserId = self->_notificationUserId, !((unint64_t)notificationUserId | v4[3]))
     || -[NSString isEqual:](notificationUserId, "isEqual:"))
    && ((deviceInfo = self->_deviceInfo, !((unint64_t)deviceInfo | v4[1]))
     || -[NTPBDeviceInfo isEqual:](deviceInfo, "isEqual:"))
    && ((notificationEntitys = self->_notificationEntitys, !((unint64_t)notificationEntitys | v4[2]))
     || -[NSMutableArray isEqual:](notificationEntitys, "isEqual:"))
    && ((userStorefrontId = self->_userStorefrontId, !((unint64_t)userStorefrontId | v4[5]))
     || -[NSString isEqual:](userStorefrontId, "isEqual:")))
  {
    topicsFolloweds = self->_topicsFolloweds;
    if ((unint64_t)topicsFolloweds | v4[4]) {
      char v10 = -[NSMutableArray isEqual:](topicsFolloweds, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_notificationUserId hash];
  unint64_t v4 = [(NTPBDeviceInfo *)self->_deviceInfo hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_notificationEntitys hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_userStorefrontId hash];
  return v6 ^ [(NSMutableArray *)self->_topicsFolloweds hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 3)) {
    -[NTPBPushNotifySubscriptionRequest setNotificationUserId:](self, "setNotificationUserId:");
  }
  deviceInfo = self->_deviceInfo;
  uint64_t v6 = *((void *)v4 + 1);
  if (deviceInfo)
  {
    if (v6) {
      -[NTPBDeviceInfo mergeFrom:](deviceInfo, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBPushNotifySubscriptionRequest setDeviceInfo:](self, "setDeviceInfo:");
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = *((id *)v4 + 2);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        [(NTPBPushNotifySubscriptionRequest *)self addNotificationEntity:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  if (*((void *)v4 + 5)) {
    -[NTPBPushNotifySubscriptionRequest setUserStorefrontId:](self, "setUserStorefrontId:");
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = *((id *)v4 + 4);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[NTPBPushNotifySubscriptionRequest addTopicsFollowed:](self, "addTopicsFollowed:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (NSString)notificationUserId
{
  return self->_notificationUserId;
}

- (void)setNotificationUserId:(id)a3
{
}

- (NTPBDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (void)setDeviceInfo:(id)a3
{
}

- (NSMutableArray)notificationEntitys
{
  return self->_notificationEntitys;
}

- (void)setNotificationEntitys:(id)a3
{
}

- (NSString)userStorefrontId
{
  return self->_userStorefrontId;
}

- (void)setUserStorefrontId:(id)a3
{
}

- (NSMutableArray)topicsFolloweds
{
  return self->_topicsFolloweds;
}

- (void)setTopicsFolloweds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userStorefrontId, 0);
  objc_storeStrong((id *)&self->_topicsFolloweds, 0);
  objc_storeStrong((id *)&self->_notificationUserId, 0);
  objc_storeStrong((id *)&self->_notificationEntitys, 0);

  objc_storeStrong((id *)&self->_deviceInfo, 0);
}

@end