@interface SKIAnnounceNotificationDirectInvocationPayload
+ (BOOL)supportsSecureCoding;
- (BOOL)isBobbleCapableAnnouncement;
- (BOOL)isMediaPlaying;
- (BOOL)isSameTypeAsLastAnnouncement;
- (NSArray)summaries;
- (NSString)appBundleId;
- (NSString)appBundleIdOfLastAnnouncement;
- (SKIAnnounceNotificationDirectInvocationPayload)initWithCoder:(id)a3;
- (SKIAnnounceNotificationDirectInvocationPayload)initWithNotification:(id)a3 appBundleId:(id)a4 appBundleIdOfLastAnnouncement:(id)a5 synchronousBurstIndex:(unint64_t)a6 isSameTypeAsLastAnnouncement:(BOOL)a7 timeSinceLastAnnouncement:(double)a8 announcementPlatform:(int64_t)a9 isMediaPlaying:(BOOL)a10;
- (SKIAnnounceNotificationDirectInvocationPayload)initWithNotification:(id)a3 appBundleId:(id)a4 appBundleIdOfLastAnnouncement:(id)a5 synchronousBurstIndex:(unint64_t)a6 isSameTypeAsLastAnnouncement:(BOOL)a7 timeSinceLastAnnouncement:(double)a8 announcementPlatform:(int64_t)a9 isMediaPlaying:(BOOL)a10 isBobbleCapableAnnouncement:(BOOL)a11 summaries:(id)a12;
- (UNNotification)notification;
- (double)timeSinceLastAnnouncement;
- (id)notificationIdentifier;
- (int64_t)announcementPlatform;
- (unint64_t)synchronousBurstIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setAnnouncementPlatform:(int64_t)a3;
- (void)setAppBundleId:(id)a3;
- (void)setAppBundleIdOfLastAnnouncement:(id)a3;
- (void)setIsBobbleCapableAnnouncement:(BOOL)a3;
- (void)setIsMediaPlaying:(BOOL)a3;
- (void)setIsSameTypeAsLastAnnouncement:(BOOL)a3;
- (void)setNotification:(id)a3;
- (void)setSummaries:(id)a3;
- (void)setSynchronousBurstIndex:(unint64_t)a3;
- (void)setTimeSinceLastAnnouncement:(double)a3;
@end

@implementation SKIAnnounceNotificationDirectInvocationPayload

- (SKIAnnounceNotificationDirectInvocationPayload)initWithNotification:(id)a3 appBundleId:(id)a4 appBundleIdOfLastAnnouncement:(id)a5 synchronousBurstIndex:(unint64_t)a6 isSameTypeAsLastAnnouncement:(BOOL)a7 timeSinceLastAnnouncement:(double)a8 announcementPlatform:(int64_t)a9 isMediaPlaying:(BOOL)a10
{
  LOWORD(v11) = a10;
  return -[SKIAnnounceNotificationDirectInvocationPayload initWithNotification:appBundleId:appBundleIdOfLastAnnouncement:synchronousBurstIndex:isSameTypeAsLastAnnouncement:timeSinceLastAnnouncement:announcementPlatform:isMediaPlaying:isBobbleCapableAnnouncement:summaries:](self, "initWithNotification:appBundleId:appBundleIdOfLastAnnouncement:synchronousBurstIndex:isSameTypeAsLastAnnouncement:timeSinceLastAnnouncement:announcementPlatform:isMediaPlaying:isBobbleCapableAnnouncement:summaries:", a3, a4, a5, a6, a7, a9, a8, v11, 0);
}

- (SKIAnnounceNotificationDirectInvocationPayload)initWithNotification:(id)a3 appBundleId:(id)a4 appBundleIdOfLastAnnouncement:(id)a5 synchronousBurstIndex:(unint64_t)a6 isSameTypeAsLastAnnouncement:(BOOL)a7 timeSinceLastAnnouncement:(double)a8 announcementPlatform:(int64_t)a9 isMediaPlaying:(BOOL)a10 isBobbleCapableAnnouncement:(BOOL)a11 summaries:(id)a12
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a12;
  v33.receiver = self;
  v33.super_class = (Class)SKIAnnounceNotificationDirectInvocationPayload;
  v23 = [(SKIAnnounceNotificationDirectInvocationPayload *)&v33 init];
  if (v23)
  {
    uint64_t v24 = [v19 copy];
    notification = v23->_notification;
    v23->_notification = (UNNotification *)v24;

    uint64_t v26 = [v20 copy];
    appBundleId = v23->_appBundleId;
    v23->_appBundleId = (NSString *)v26;

    uint64_t v28 = [v21 copy];
    appBundleIdOfLastAnnouncement = v23->_appBundleIdOfLastAnnouncement;
    v23->_appBundleIdOfLastAnnouncement = (NSString *)v28;

    v23->_synchronousBurstIndex = a6;
    v23->_isSameTypeAsLastAnnouncement = a7;
    v23->_timeSinceLastAnnouncement = a8;
    v23->_announcementPlatform = a9;
    v23->_isMediaPlaying = a10;
    v23->_isBobbleCapableAnnouncement = a11;
    uint64_t v30 = [v22 copy];
    summaries = v23->_summaries;
    v23->_summaries = (NSArray *)v30;
  }
  return v23;
}

- (id)notificationIdentifier
{
  v2 = [(UNNotification *)self->_notification request];
  v3 = [v2 identifier];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  v4 = [(SKIAnnounceNotificationDirectInvocationPayload *)self notification];
  [v10 encodeObject:v4 forKey:@"notification"];

  v5 = [(SKIAnnounceNotificationDirectInvocationPayload *)self appBundleId];
  [v10 encodeObject:v5 forKey:@"appBundleId"];

  v6 = [(SKIAnnounceNotificationDirectInvocationPayload *)self appBundleIdOfLastAnnouncement];
  [v10 encodeObject:v6 forKey:@"appBundleIdOfLastAnnouncement"];

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SKIAnnounceNotificationDirectInvocationPayload synchronousBurstIndex](self, "synchronousBurstIndex"));
  [v10 encodeObject:v7 forKey:@"synchronousBurstIndex"];

  v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[SKIAnnounceNotificationDirectInvocationPayload announcementPlatform](self, "announcementPlatform"));
  [v10 encodeObject:v8 forKey:@"announcementPlatform"];

  v9 = [(SKIAnnounceNotificationDirectInvocationPayload *)self summaries];
  [v10 encodeObject:v9 forKey:@"summaries"];

  objc_msgSend(v10, "encodeBool:forKey:", -[SKIAnnounceNotificationDirectInvocationPayload isMediaPlaying](self, "isMediaPlaying"), @"isMediaPlaying");
  objc_msgSend(v10, "encodeBool:forKey:", -[SKIAnnounceNotificationDirectInvocationPayload isSameTypeAsLastAnnouncement](self, "isSameTypeAsLastAnnouncement"), @"isSameTypeAsLastAnnouncement");
  [(SKIAnnounceNotificationDirectInvocationPayload *)self timeSinceLastAnnouncement];
  objc_msgSend(v10, "encodeDouble:forKey:", @"timeSinceLastAnnouncement");
  objc_msgSend(v10, "encodeBool:forKey:", -[SKIAnnounceNotificationDirectInvocationPayload isBobbleCapableAnnouncement](self, "isBobbleCapableAnnouncement"), @"isBobbleCapableAnnouncement");
}

- (SKIAnnounceNotificationDirectInvocationPayload)initWithCoder:(id)a3
{
  v23[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"notification"];
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"appBundleId"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"appBundleIdOfLastAnnouncement"];
  v7 = (void *)MEMORY[0x263EFFA08];
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  v9 = [v7 setWithArray:v8];
  id v10 = [v3 decodeObjectOfClasses:v9 forKey:@"summaries"];

  uint64_t v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"synchronousBurstIndex"];
  uint64_t v12 = [v11 unsignedIntegerValue];

  v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"announcementPlatform"];
  uint64_t v14 = [v13 integerValue];

  LOBYTE(v13) = [v3 decodeBoolForKey:@"isMediaPlaying"];
  uint64_t v15 = [v3 decodeBoolForKey:@"isSameTypeAsLastAnnouncement"];
  [v3 decodeDoubleForKey:@"timeSinceLastAnnouncement"];
  double v17 = v16;
  char v18 = [v3 decodeBoolForKey:@"isBobbleCapableAnnouncement"];

  BYTE1(v21) = v18;
  LOBYTE(v21) = (_BYTE)v13;
  id v19 = -[SKIAnnounceNotificationDirectInvocationPayload initWithNotification:appBundleId:appBundleIdOfLastAnnouncement:synchronousBurstIndex:isSameTypeAsLastAnnouncement:timeSinceLastAnnouncement:announcementPlatform:isMediaPlaying:isBobbleCapableAnnouncement:summaries:](self, "initWithNotification:appBundleId:appBundleIdOfLastAnnouncement:synchronousBurstIndex:isSameTypeAsLastAnnouncement:timeSinceLastAnnouncement:announcementPlatform:isMediaPlaying:isBobbleCapableAnnouncement:summaries:", v4, v5, v6, v12, v15, v14, v17, v21, v10);

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UNNotification)notification
{
  return self->_notification;
}

- (void)setNotification:(id)a3
{
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
}

- (NSString)appBundleIdOfLastAnnouncement
{
  return self->_appBundleIdOfLastAnnouncement;
}

- (void)setAppBundleIdOfLastAnnouncement:(id)a3
{
}

- (unint64_t)synchronousBurstIndex
{
  return self->_synchronousBurstIndex;
}

- (void)setSynchronousBurstIndex:(unint64_t)a3
{
  self->_synchronousBurstIndex = a3;
}

- (BOOL)isMediaPlaying
{
  return self->_isMediaPlaying;
}

- (void)setIsMediaPlaying:(BOOL)a3
{
  self->_isMediaPlaying = a3;
}

- (BOOL)isSameTypeAsLastAnnouncement
{
  return self->_isSameTypeAsLastAnnouncement;
}

- (void)setIsSameTypeAsLastAnnouncement:(BOOL)a3
{
  self->_isSameTypeAsLastAnnouncement = a3;
}

- (double)timeSinceLastAnnouncement
{
  return self->_timeSinceLastAnnouncement;
}

- (void)setTimeSinceLastAnnouncement:(double)a3
{
  self->_timeSinceLastAnnouncement = a3;
}

- (int64_t)announcementPlatform
{
  return self->_announcementPlatform;
}

- (void)setAnnouncementPlatform:(int64_t)a3
{
  self->_announcementPlatform = a3;
}

- (BOOL)isBobbleCapableAnnouncement
{
  return self->_isBobbleCapableAnnouncement;
}

- (void)setIsBobbleCapableAnnouncement:(BOOL)a3
{
  self->_isBobbleCapableAnnouncement = a3;
}

- (NSArray)summaries
{
  return self->_summaries;
}

- (void)setSummaries:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaries, 0);
  objc_storeStrong((id *)&self->_appBundleIdOfLastAnnouncement, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);

  objc_storeStrong((id *)&self->_notification, 0);
}

@end