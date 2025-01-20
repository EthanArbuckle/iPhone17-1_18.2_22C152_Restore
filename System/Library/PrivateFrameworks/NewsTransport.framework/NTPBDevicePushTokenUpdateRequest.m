@interface NTPBDevicePushTokenUpdateRequest
- (BOOL)hasDeviceInfoToAdd;
- (BOOL)hasDeviceInfoToRemove;
- (BOOL)hasNotificationUserId;
- (BOOL)hasUserStorefrontId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)notificationUserId;
- (NSString)userStorefrontId;
- (NTPBDeviceInfo)deviceInfoToAdd;
- (NTPBDeviceInfo)deviceInfoToRemove;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setDeviceInfoToAdd:(id)a3;
- (void)setDeviceInfoToRemove:(id)a3;
- (void)setNotificationUserId:(id)a3;
- (void)setUserStorefrontId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBDevicePushTokenUpdateRequest

- (BOOL)hasNotificationUserId
{
  return self->_notificationUserId != 0;
}

- (BOOL)hasDeviceInfoToAdd
{
  return self->_deviceInfoToAdd != 0;
}

- (BOOL)hasDeviceInfoToRemove
{
  return self->_deviceInfoToRemove != 0;
}

- (BOOL)hasUserStorefrontId
{
  return self->_userStorefrontId != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBDevicePushTokenUpdateRequest;
  v4 = [(NTPBDevicePushTokenUpdateRequest *)&v8 description];
  v5 = [(NTPBDevicePushTokenUpdateRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  notificationUserId = self->_notificationUserId;
  if (notificationUserId) {
    [v3 setObject:notificationUserId forKey:@"notification_user_id"];
  }
  deviceInfoToAdd = self->_deviceInfoToAdd;
  if (deviceInfoToAdd)
  {
    v7 = [(NTPBDeviceInfo *)deviceInfoToAdd dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"device_info_to_add"];
  }
  deviceInfoToRemove = self->_deviceInfoToRemove;
  if (deviceInfoToRemove)
  {
    v9 = [(NTPBDeviceInfo *)deviceInfoToRemove dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"device_info_to_remove"];
  }
  userStorefrontId = self->_userStorefrontId;
  if (userStorefrontId) {
    [v4 setObject:userStorefrontId forKey:@"user_storefront_id"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBDevicePushTokenUpdateRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_notificationUserId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_deviceInfoToAdd)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_deviceInfoToRemove)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_userStorefrontId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_notificationUserId copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(NTPBDeviceInfo *)self->_deviceInfoToAdd copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  id v10 = [(NTPBDeviceInfo *)self->_deviceInfoToRemove copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  uint64_t v12 = [(NSString *)self->_userStorefrontId copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((notificationUserId = self->_notificationUserId, !((unint64_t)notificationUserId | v4[3]))
     || -[NSString isEqual:](notificationUserId, "isEqual:"))
    && ((deviceInfoToAdd = self->_deviceInfoToAdd, !((unint64_t)deviceInfoToAdd | v4[1]))
     || -[NTPBDeviceInfo isEqual:](deviceInfoToAdd, "isEqual:"))
    && ((deviceInfoToRemove = self->_deviceInfoToRemove, !((unint64_t)deviceInfoToRemove | v4[2]))
     || -[NTPBDeviceInfo isEqual:](deviceInfoToRemove, "isEqual:")))
  {
    userStorefrontId = self->_userStorefrontId;
    if ((unint64_t)userStorefrontId | v4[4]) {
      char v9 = -[NSString isEqual:](userStorefrontId, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_notificationUserId hash];
  unint64_t v4 = [(NTPBDeviceInfo *)self->_deviceInfoToAdd hash] ^ v3;
  unint64_t v5 = [(NTPBDeviceInfo *)self->_deviceInfoToRemove hash];
  return v4 ^ v5 ^ [(NSString *)self->_userStorefrontId hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  char v9 = v4;
  if (v4[3])
  {
    -[NTPBDevicePushTokenUpdateRequest setNotificationUserId:](self, "setNotificationUserId:");
    unint64_t v4 = v9;
  }
  deviceInfoToAdd = self->_deviceInfoToAdd;
  uint64_t v6 = v4[1];
  if (deviceInfoToAdd)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[NTPBDeviceInfo mergeFrom:](deviceInfoToAdd, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[NTPBDevicePushTokenUpdateRequest setDeviceInfoToAdd:](self, "setDeviceInfoToAdd:");
  }
  unint64_t v4 = v9;
LABEL_9:
  deviceInfoToRemove = self->_deviceInfoToRemove;
  uint64_t v8 = v4[2];
  if (deviceInfoToRemove)
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[NTPBDeviceInfo mergeFrom:](deviceInfoToRemove, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[NTPBDevicePushTokenUpdateRequest setDeviceInfoToRemove:](self, "setDeviceInfoToRemove:");
  }
  unint64_t v4 = v9;
LABEL_15:
  if (v4[4]) {
    -[NTPBDevicePushTokenUpdateRequest setUserStorefrontId:](self, "setUserStorefrontId:");
  }

  MEMORY[0x270F9A758]();
}

- (NSString)notificationUserId
{
  return self->_notificationUserId;
}

- (void)setNotificationUserId:(id)a3
{
}

- (NTPBDeviceInfo)deviceInfoToAdd
{
  return self->_deviceInfoToAdd;
}

- (void)setDeviceInfoToAdd:(id)a3
{
}

- (NTPBDeviceInfo)deviceInfoToRemove
{
  return self->_deviceInfoToRemove;
}

- (void)setDeviceInfoToRemove:(id)a3
{
}

- (NSString)userStorefrontId
{
  return self->_userStorefrontId;
}

- (void)setUserStorefrontId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userStorefrontId, 0);
  objc_storeStrong((id *)&self->_notificationUserId, 0);
  objc_storeStrong((id *)&self->_deviceInfoToRemove, 0);

  objc_storeStrong((id *)&self->_deviceInfoToAdd, 0);
}

@end