@interface UNNotificationSystemSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)scheduledDeliveryTimes;
- (UNNotificationSystemSettings)initWithCoder:(id)a3;
- (UNNotificationSystemSettings)initWithShowPreviewsSetting:(int64_t)a3 announcementSetting:(int64_t)a4 announcementHeadphonesSetting:(int64_t)a5 announcementCarPlaySetting:(int64_t)a6 scheduledDeliverySetting:(int64_t)a7 scheduledDeliveryTimes:(id)a8 scheduledDeliveryShowNextSummarySetting:(int64_t)a9 notificationListDisplayStyleSetting:(int64_t)a10;
- (UNNotificationSystemSettings)initWithShowPreviewsSetting:(int64_t)a3 announcementSetting:(int64_t)a4 announcementHeadphonesSetting:(int64_t)a5 announcementCarPlaySetting:(int64_t)a6 scheduledDeliverySetting:(int64_t)a7 scheduledDeliveryTimes:(id)a8 scheduledDeliveryShowNextSummarySetting:(int64_t)a9 notificationListDisplayStyleSetting:(int64_t)a10 remoteNotificationsSetting:(int64_t)a11 summarizationSetting:(int64_t)a12 modifiedSettings:(unint64_t)a13;
- (UNNotificationSystemSettings)initWithShowPreviewsSetting:(int64_t)a3 announcementSetting:(int64_t)a4 announcementHeadphonesSetting:(int64_t)a5 announcementCarPlaySetting:(int64_t)a6 scheduledDeliverySetting:(int64_t)a7 scheduledDeliveryTimes:(id)a8 scheduledDeliveryShowNextSummarySetting:(int64_t)a9 notificationListDisplayStyleSetting:(int64_t)a10 summarizationSetting:(int64_t)a11;
- (UNNotificationSystemSettings)initWithShowPreviewsSetting:(int64_t)a3 announcementSetting:(int64_t)a4 announcementHeadphonesSetting:(int64_t)a5 announcementCarPlaySetting:(int64_t)a6 scheduledDeliverySetting:(int64_t)a7 scheduledDeliveryTimes:(id)a8 scheduledDeliveryShowNextSummarySetting:(int64_t)a9 notificationListDisplayStyleSetting:(int64_t)a10 summarizationSetting:(int64_t)a11 modifiedSettings:(unint64_t)a12;
- (id)_stringForNotificationListDisplayStyleSetting:(int64_t)a3;
- (id)_stringForScheduledDeliveryTimes:(id)a3;
- (id)_stringforAnnouncementCarPlaySetting:(int64_t)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)announcementCarPlaySetting;
- (int64_t)announcementHeadphonesSetting;
- (int64_t)announcementSetting;
- (int64_t)notificationListDisplayStyleSetting;
- (int64_t)remoteNotificationsSetting;
- (int64_t)scheduledDeliverySetting;
- (int64_t)scheduledDeliveryShowNextSummarySetting;
- (int64_t)showPreviewsSetting;
- (int64_t)summarizationSetting;
- (unint64_t)modifiedSettings;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UNNotificationSystemSettings

- (UNNotificationSystemSettings)initWithShowPreviewsSetting:(int64_t)a3 announcementSetting:(int64_t)a4 announcementHeadphonesSetting:(int64_t)a5 announcementCarPlaySetting:(int64_t)a6 scheduledDeliverySetting:(int64_t)a7 scheduledDeliveryTimes:(id)a8 scheduledDeliveryShowNextSummarySetting:(int64_t)a9 notificationListDisplayStyleSetting:(int64_t)a10 summarizationSetting:(int64_t)a11
{
  return [(UNNotificationSystemSettings *)self initWithShowPreviewsSetting:a3 announcementSetting:a4 announcementHeadphonesSetting:a5 announcementCarPlaySetting:a6 scheduledDeliverySetting:a7 scheduledDeliveryTimes:a8 scheduledDeliveryShowNextSummarySetting:a9 notificationListDisplayStyleSetting:a10 summarizationSetting:a11 modifiedSettings:0];
}

- (UNNotificationSystemSettings)initWithShowPreviewsSetting:(int64_t)a3 announcementSetting:(int64_t)a4 announcementHeadphonesSetting:(int64_t)a5 announcementCarPlaySetting:(int64_t)a6 scheduledDeliverySetting:(int64_t)a7 scheduledDeliveryTimes:(id)a8 scheduledDeliveryShowNextSummarySetting:(int64_t)a9 notificationListDisplayStyleSetting:(int64_t)a10
{
  return [(UNNotificationSystemSettings *)self initWithShowPreviewsSetting:a3 announcementSetting:a4 announcementHeadphonesSetting:a5 announcementCarPlaySetting:a6 scheduledDeliverySetting:a7 scheduledDeliveryTimes:a8 scheduledDeliveryShowNextSummarySetting:a9 notificationListDisplayStyleSetting:a10 remoteNotificationsSetting:0 summarizationSetting:0 modifiedSettings:0];
}

- (UNNotificationSystemSettings)initWithShowPreviewsSetting:(int64_t)a3 announcementSetting:(int64_t)a4 announcementHeadphonesSetting:(int64_t)a5 announcementCarPlaySetting:(int64_t)a6 scheduledDeliverySetting:(int64_t)a7 scheduledDeliveryTimes:(id)a8 scheduledDeliveryShowNextSummarySetting:(int64_t)a9 notificationListDisplayStyleSetting:(int64_t)a10 summarizationSetting:(int64_t)a11 modifiedSettings:(unint64_t)a12
{
  return [(UNNotificationSystemSettings *)self initWithShowPreviewsSetting:a3 announcementSetting:a4 announcementHeadphonesSetting:a5 announcementCarPlaySetting:a6 scheduledDeliverySetting:a7 scheduledDeliveryTimes:a8 scheduledDeliveryShowNextSummarySetting:a9 notificationListDisplayStyleSetting:a10 remoteNotificationsSetting:0 summarizationSetting:a11 modifiedSettings:a12];
}

- (UNNotificationSystemSettings)initWithShowPreviewsSetting:(int64_t)a3 announcementSetting:(int64_t)a4 announcementHeadphonesSetting:(int64_t)a5 announcementCarPlaySetting:(int64_t)a6 scheduledDeliverySetting:(int64_t)a7 scheduledDeliveryTimes:(id)a8 scheduledDeliveryShowNextSummarySetting:(int64_t)a9 notificationListDisplayStyleSetting:(int64_t)a10 remoteNotificationsSetting:(int64_t)a11 summarizationSetting:(int64_t)a12 modifiedSettings:(unint64_t)a13
{
  id v20 = a8;
  v24.receiver = self;
  v24.super_class = (Class)UNNotificationSystemSettings;
  v21 = [(UNNotificationSystemSettings *)&v24 init];
  v22 = v21;
  if (v21)
  {
    v21->_showPreviewsSetting = a3;
    v21->_announcementSetting = a4;
    v21->_announcementHeadphonesSetting = a5;
    v21->_announcementCarPlaySetting = a6;
    v21->_scheduledDeliverySetting = a7;
    objc_storeStrong((id *)&v21->_scheduledDeliveryTimes, a8);
    v22->_notificationListDisplayStyleSetting = a10;
    v22->_remoteNotificationsSetting = a11;
    v22->_summarizationSetting = a12;
    v22->_scheduledDeliveryShowNextSummarySetting = a9;
    v22->_modifiedSettings = a13;
  }

  return v22;
}

- (id)description
{
  v17 = NSString;
  uint64_t v16 = objc_opt_class();
  [(UNNotificationSystemSettings *)self showPreviewsSetting];
  v15 = UNShowPreviewsSettingString();
  [(UNNotificationSystemSettings *)self announcementSetting];
  v13 = UNNotificationSettingString();
  [(UNNotificationSystemSettings *)self announcementHeadphonesSetting];
  v3 = UNNotificationSettingString();
  v4 = [(UNNotificationSystemSettings *)self _stringforAnnouncementCarPlaySetting:[(UNNotificationSystemSettings *)self announcementCarPlaySetting]];
  [(UNNotificationSystemSettings *)self scheduledDeliverySetting];
  v5 = UNNotificationSettingString();
  v14 = [(UNNotificationSystemSettings *)self scheduledDeliveryTimes];
  v6 = [(UNNotificationSystemSettings *)self _stringForScheduledDeliveryTimes:v14];
  [(UNNotificationSystemSettings *)self scheduledDeliveryShowNextSummarySetting];
  v7 = UNNotificationSettingString();
  v8 = [(UNNotificationSystemSettings *)self _stringForNotificationListDisplayStyleSetting:self->_notificationListDisplayStyleSetting];
  [(UNNotificationSystemSettings *)self remoteNotificationsSetting];
  v9 = UNNotificationSettingString();
  [(UNNotificationSystemSettings *)self summarizationSetting];
  v10 = UNNotificationSettingString();
  objc_msgSend(v17, "stringWithFormat:", @"<%@: %p; showPreviewsSetting: %@; announcementSetting: %@; announcementHeadphonesSetting: %@; announcementCarPlaySetting: %@; scheduledDeliverySetting: %@; scheduledDeliveryTimes: %@; scheduledDeliveryShowNextSummarySetting: %@; notificationListDisplayStyleSetting: %@; remoteNotificationsSetting: %@, summarizationSetting: %@>",
    v16,
    self,
    v15,
    v13,
    v3,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
  v11 = v10);

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[UNNotificationSystemSettings showPreviewsSetting](self, "showPreviewsSetting"), @"showPreviewsSetting");
  objc_msgSend(v5, "encodeInteger:forKey:", -[UNNotificationSystemSettings announcementSetting](self, "announcementSetting"), @"announcementSetting");
  objc_msgSend(v5, "encodeInteger:forKey:", -[UNNotificationSystemSettings announcementHeadphonesSetting](self, "announcementHeadphonesSetting"), @"announcementHeadphonesSetting");
  objc_msgSend(v5, "encodeInteger:forKey:", -[UNNotificationSystemSettings announcementCarPlaySetting](self, "announcementCarPlaySetting"), @"announcementCarPlaySetting");
  objc_msgSend(v5, "encodeInteger:forKey:", -[UNNotificationSystemSettings scheduledDeliverySetting](self, "scheduledDeliverySetting"), @"scheduledDeliverySetting");
  v4 = [(UNNotificationSystemSettings *)self scheduledDeliveryTimes];
  [v5 encodeObject:v4 forKey:@"scheduledDeliveryTimes"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[UNNotificationSystemSettings scheduledDeliveryShowNextSummarySetting](self, "scheduledDeliveryShowNextSummarySetting"), @"scheduledDeliveryShowNextSummarySetting");
  [v5 encodeInteger:self->_notificationListDisplayStyleSetting forKey:@"notificationListDisplayStyleSetting"];
  objc_msgSend(v5, "encodeInteger:forKey:", -[UNNotificationSystemSettings remoteNotificationsSetting](self, "remoteNotificationsSetting"), @"remoteNotificationsSetting");
  objc_msgSend(v5, "encodeInteger:forKey:", -[UNNotificationSystemSettings summarizationSetting](self, "summarizationSetting"), @"summarizationSetting");
  objc_msgSend(v5, "encodeInteger:forKey:", -[UNNotificationSystemSettings modifiedSettings](self, "modifiedSettings"), @"modifiedSettings");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int64_t v6 = [(UNNotificationSystemSettings *)self showPreviewsSetting];
    if (v6 == [v5 showPreviewsSetting]
      && (int64_t v7 = [(UNNotificationSystemSettings *)self announcementSetting],
          v7 == [v5 announcementSetting])
      && (int64_t v8 = [(UNNotificationSystemSettings *)self announcementHeadphonesSetting],
          v8 == [v5 announcementHeadphonesSetting])
      && (int64_t v9 = [(UNNotificationSystemSettings *)self announcementCarPlaySetting],
          v9 == [v5 announcementCarPlaySetting])
      && (int64_t v10 = [(UNNotificationSystemSettings *)self scheduledDeliverySetting],
          v10 == [v5 scheduledDeliverySetting]))
    {
      v11 = [(UNNotificationSystemSettings *)self scheduledDeliveryTimes];
      v12 = [v5 scheduledDeliveryTimes];
      if ([v11 isEqual:v12]
        && (v13 = -[UNNotificationSystemSettings scheduledDeliveryShowNextSummarySetting](self, "scheduledDeliveryShowNextSummarySetting"), v13 == [v5 scheduledDeliveryShowNextSummarySetting])&& (v14 = -[UNNotificationSystemSettings notificationListDisplayStyleSetting](self, "notificationListDisplayStyleSetting"), v14 == objc_msgSend(v5, "notificationListDisplayStyleSetting"))&& (v15 = -[UNNotificationSystemSettings remoteNotificationsSetting](self, "remoteNotificationsSetting"), v15 == objc_msgSend(v5, "remoteNotificationsSetting"))&& (int64_t v16 = -[UNNotificationSystemSettings summarizationSetting](self, "summarizationSetting"), v16 == objc_msgSend(v5, "summarizationSetting")))
      {
        unint64_t v17 = [(UNNotificationSystemSettings *)self modifiedSettings];
        BOOL v18 = v17 == [v5 modifiedSettings];
      }
      else
      {
        BOOL v18 = 0;
      }
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (UNNotificationSystemSettings)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v19 = [v3 decodeIntegerForKey:@"showPreviewsSetting"];
  uint64_t v18 = [v3 decodeIntegerForKey:@"announcementSetting"];
  uint64_t v4 = [v3 decodeIntegerForKey:@"announcementHeadphonesSetting"];
  uint64_t v5 = [v3 decodeIntegerForKey:@"announcementCarPlaySetting"];
  uint64_t v6 = [v3 decodeIntegerForKey:@"scheduledDeliverySetting"];
  int64_t v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  int64_t v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  int64_t v10 = [v3 decodeObjectOfClasses:v9 forKey:@"scheduledDeliveryTimes"];

  uint64_t v11 = [v3 decodeIntegerForKey:@"scheduledDeliveryShowNextSummarySetting"];
  uint64_t v12 = [v3 decodeIntegerForKey:@"notificationListDisplayStyleSetting"];
  uint64_t v13 = [v3 decodeIntegerForKey:@"remoteNotificationsSetting"];
  uint64_t v14 = [v3 decodeIntegerForKey:@"summarizationSetting"];
  uint64_t v15 = [v3 decodeIntegerForKey:@"modifiedSettings"];

  int64_t v16 = [(UNNotificationSystemSettings *)self initWithShowPreviewsSetting:v19 announcementSetting:v18 announcementHeadphonesSetting:v4 announcementCarPlaySetting:v5 scheduledDeliverySetting:v6 scheduledDeliveryTimes:v10 scheduledDeliveryShowNextSummarySetting:v11 notificationListDisplayStyleSetting:v12 remoteNotificationsSetting:v13 summarizationSetting:v14 modifiedSettings:v15];
  return v16;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v12 = [UNMutableNotificationSystemSettings alloc];
  int64_t v11 = [(UNNotificationSystemSettings *)self showPreviewsSetting];
  int64_t v4 = [(UNNotificationSystemSettings *)self announcementSetting];
  int64_t v5 = [(UNNotificationSystemSettings *)self announcementHeadphonesSetting];
  int64_t v6 = [(UNNotificationSystemSettings *)self announcementCarPlaySetting];
  int64_t v7 = [(UNNotificationSystemSettings *)self scheduledDeliverySetting];
  uint64_t v8 = [(UNNotificationSystemSettings *)self scheduledDeliveryTimes];
  int64_t v9 = [(UNNotificationSystemSettings *)v12 initWithShowPreviewsSetting:v11 announcementSetting:v4 announcementHeadphonesSetting:v5 announcementCarPlaySetting:v6 scheduledDeliverySetting:v7 scheduledDeliveryTimes:v8 scheduledDeliveryShowNextSummarySetting:[(UNNotificationSystemSettings *)self scheduledDeliveryShowNextSummarySetting] notificationListDisplayStyleSetting:self->_notificationListDisplayStyleSetting remoteNotificationsSetting:[(UNNotificationSystemSettings *)self remoteNotificationsSetting] summarizationSetting:[(UNNotificationSystemSettings *)self summarizationSetting] modifiedSettings:[(UNNotificationSystemSettings *)self modifiedSettings]];

  return v9;
}

- (id)_stringforAnnouncementCarPlaySetting:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return 0;
  }
  else {
    return off_264252978[a3];
  }
}

- (id)_stringForScheduledDeliveryTimes:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  int64_t v4 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v5 = objc_alloc_init(MEMORY[0x263F08790]);
  [v5 setDateFormat:@"HH:mm"];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    int64_t v9 = @"[";
    do
    {
      uint64_t v10 = 0;
      int64_t v11 = v9;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = [v4 dateFromComponents:*(void *)(*((void *)&v19 + 1) + 8 * v10)];
        uint64_t v13 = NSString;
        uint64_t v14 = [v5 stringFromDate:v12];
        uint64_t v15 = [v13 stringWithFormat:@" %@,", v14];

        int64_t v9 = [(__CFString *)v11 stringByAppendingString:v15];

        ++v10;
        int64_t v11 = v9;
      }
      while (v7 != v10);
      uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
  else
  {
    int64_t v9 = @"[";
  }

  int64_t v16 = [(__CFString *)v9 stringByAppendingString:@" ]"];

  return v16;
}

- (id)_stringForNotificationListDisplayStyleSetting:(int64_t)a3
{
  id v3 = @"Standard";
  if (a3 == 1) {
    id v3 = @"Stack";
  }
  if (a3 == 2) {
    return @"Hidden";
  }
  else {
    return v3;
  }
}

- (int64_t)showPreviewsSetting
{
  return self->_showPreviewsSetting;
}

- (int64_t)announcementSetting
{
  return self->_announcementSetting;
}

- (int64_t)announcementHeadphonesSetting
{
  return self->_announcementHeadphonesSetting;
}

- (int64_t)announcementCarPlaySetting
{
  return self->_announcementCarPlaySetting;
}

- (int64_t)scheduledDeliverySetting
{
  return self->_scheduledDeliverySetting;
}

- (NSArray)scheduledDeliveryTimes
{
  return self->_scheduledDeliveryTimes;
}

- (int64_t)scheduledDeliveryShowNextSummarySetting
{
  return self->_scheduledDeliveryShowNextSummarySetting;
}

- (int64_t)notificationListDisplayStyleSetting
{
  return self->_notificationListDisplayStyleSetting;
}

- (int64_t)remoteNotificationsSetting
{
  return self->_remoteNotificationsSetting;
}

- (int64_t)summarizationSetting
{
  return self->_summarizationSetting;
}

- (unint64_t)modifiedSettings
{
  return self->_modifiedSettings;
}

- (void).cxx_destruct
{
}

@end