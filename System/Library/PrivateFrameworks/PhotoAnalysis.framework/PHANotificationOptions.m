@interface PHANotificationOptions
+ (id)stringFromNotificationType:(unsigned __int8)a3;
- (NSDate)deliveryDate;
- (NSDate)expirationDate;
- (NSDictionary)userInfo;
- (NSString)bodyText;
- (NSString)collectionUUID;
- (NSString)subtitle;
- (NSString)title;
- (PHANotificationOptions)initWithType:(unsigned __int8)a3;
- (PHAsset)keyAsset;
- (id)description;
- (unsigned)type;
- (void)setBodyText:(id)a3;
- (void)setCollectionUUID:(id)a3;
- (void)setDeliveryDate:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setKeyAsset:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation PHANotificationOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionUUID, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_deliveryDate, 0);
  objc_storeStrong((id *)&self->_bodyText, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setCollectionUUID:(id)a3
{
}

- (NSString)collectionUUID
{
  return self->_collectionUUID;
}

- (void)setKeyAsset:(id)a3
{
}

- (PHAsset)keyAsset
{
  return self->_keyAsset;
}

- (void)setUserInfo:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setExpirationDate:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setDeliveryDate:(id)a3
{
}

- (NSDate)deliveryDate
{
  return self->_deliveryDate;
}

- (void)setBodyText:(id)a3
{
}

- (NSString)bodyText
{
  return self->_bodyText;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (unsigned)type
{
  return self->_type;
}

- (id)description
{
  v3 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)PHANotificationOptions;
  v4 = [(PHANotificationOptions *)&v14 description];
  v5 = objc_msgSend((id)objc_opt_class(), "stringFromNotificationType:", -[PHANotificationOptions type](self, "type"));
  v6 = [(PHANotificationOptions *)self title];
  v7 = [(PHANotificationOptions *)self subtitle];
  v8 = [(PHANotificationOptions *)self keyAsset];
  v9 = [(PHANotificationOptions *)self deliveryDate];
  v10 = [(PHANotificationOptions *)self keyAsset];
  v11 = [(PHANotificationOptions *)self collectionUUID];
  v12 = [v3 stringWithFormat:@"%@ - %@ Notification with:\n\tTitle: %@\n\tSubtitle: %@\n\tKey asset: %@\n\tDelivery date: %@\n\tKey asset: %@\n\tCollection uuid: %@", v4, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (PHANotificationOptions)initWithType:(unsigned __int8)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PHANotificationOptions;
  result = [(PHANotificationOptions *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

+ (id)stringFromNotificationType:(unsigned __int8)a3
{
  v3 = &stru_1F2900940;
  if (a3 == 1) {
    v3 = @"Suggestions";
  }
  if (a3) {
    return v3;
  }
  else {
    return @"Memories";
  }
}

@end