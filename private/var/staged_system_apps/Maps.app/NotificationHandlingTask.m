@interface NotificationHandlingTask
+ (id)taskForData:(id)a3 type:(id)a4 recordIdentifier:(id)a5;
- (NotificationHandlingTask)initWithData:(id)a3 recordIdentifier:(id)a4;
- (void)_clearBulletin;
@end

@implementation NotificationHandlingTask

+ (id)taskForData:(id)a3 type:(id)a4 recordIdentifier:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7)
  {
    if ([v8 isEqualToString:@"MapsPushNotifcationTypePushToPhone"])
    {
      v10 = _PushToPhoneHandlingTask;
LABEL_10:
      id v11 = [[v10 alloc] initWithData:v7 recordIdentifier:v9];
      goto LABEL_15;
    }
    if ([v8 isEqualToString:@"MapsPushNotifcationTypeProblemResolved"])
    {
      v10 = _RAPHandlingTask;
      goto LABEL_10;
    }
    if ([v8 isEqualToString:@"MapsPushNotificationTypeAnnouncement"])
    {
      v10 = _AnnounceHandlingTask;
      goto LABEL_10;
    }
    if ([v8 isEqualToString:@"MapsPushNotificationTypeSharedTrip"])
    {
      v10 = _SharedTripHandlingTask;
      goto LABEL_10;
    }
    v12 = sub_1000A930C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      id v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Notification type unknown %@", (uint8_t *)&v14, 0xCu);
    }
  }
  id v11 = 0;
LABEL_15:

  return v11;
}

- (NotificationHandlingTask)initWithData:(id)a3 recordIdentifier:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)NotificationHandlingTask;
  id v7 = [(NotificationHandlingTask *)&v10 init];
  id v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_recordIdentifier, a4);
  }

  return v8;
}

- (void)_clearBulletin
{
  if (self->_recordIdentifier)
  {
    id v3 = +[MSPMapsPushDaemonRemoteProxy sharedInstance];
    [v3 clearBulletinWithRecordID:self->_recordIdentifier];
  }
}

- (void).cxx_destruct
{
}

@end