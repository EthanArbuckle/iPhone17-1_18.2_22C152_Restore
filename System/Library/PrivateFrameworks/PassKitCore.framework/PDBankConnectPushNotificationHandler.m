@interface PDBankConnectPushNotificationHandler
+ (PDBankConnectPushNotificationHandler)new;
- (PDBankConnectPushNotificationHandler)init;
- (PDBankConnectPushNotificationHandler)initWithPushNotificationManager:(id)a3;
- (id)pushNotificationTopics;
- (void)dealloc;
- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4;
@end

@implementation PDBankConnectPushNotificationHandler

- (PDBankConnectPushNotificationHandler)init
{
  return 0;
}

+ (PDBankConnectPushNotificationHandler)new
{
  return 0;
}

- (PDBankConnectPushNotificationHandler)initWithPushNotificationManager:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PDBankConnectPushNotificationHandler;
  v6 = [(PDBankConnectPushNotificationHandler *)&v10 init];
  if (v6 && PKBankConnectPushNotificationsEnabled())
  {
    uint64_t v7 = +[NSSet setWithObjects:@"com.apple.fds.prod", @"com.apple.fds", 0];
    pushNotificationTopics = v6->_pushNotificationTopics;
    v6->_pushNotificationTopics = (NSSet *)v7;

    objc_storeStrong((id *)&v6->_pushNotificationManager, a3);
    [(PDPushNotificationManager *)v6->_pushNotificationManager registerConsumer:v6];
  }

  return v6;
}

- (void)dealloc
{
  [(PDPushNotificationManager *)self->_pushNotificationManager unregisterConsumer:self];
  v3.receiver = self;
  v3.super_class = (Class)PDBankConnectPushNotificationHandler;
  [(PDBankConnectPushNotificationHandler *)&v3 dealloc];
}

- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NSSet *)self->_pushNotificationTopics containsObject:v6])
  {
    v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = v6;
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received BankConnect push notification for topic: %@, userInfo: %@", (uint8_t *)&v10, 0x16u);
    }

    id v9 = objc_alloc_init(off_100806B00());
    [v9 handlePushNotificationWithPayload:v7];
  }
}

- (id)pushNotificationTopics
{
  return self->_pushNotificationTopics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushNotificationTopics, 0);
  objc_storeStrong((id *)&self->_pushNotificationManager, 0);
}

@end