@interface NPDBulletinManager
- (NPDBulletinManager)init;
- (UNUserNotificationCenter)notificationCenter;
- (id)_archivedDelayedNotifications;
- (id)_defaultNotficationIdentifierWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5 forPass:(id)a6;
- (id)_delayedUserNotificationWithIdentifier:(id)a3;
- (id)_userNotificationWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5 forPass:(id)a6 playSound:(BOOL)a7 notificationIdentifier:(id)a8 expirationDate:(id)a9;
- (void)_persistArchivedNotifications:(id)a3;
- (void)_persistDelayedNotificationRequest:(id)a3;
- (void)_removeDelayedNotificationRequestWithIdentifier:(id)a3;
- (void)dealloc;
- (void)insertBridgeBulletinWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5 delay:(double)a6;
- (void)insertBridgeBulletinWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5 forPass:(id)a6;
- (void)insertBridgeBulletinWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5 forPass:(id)a6 playSound:(BOOL)a7 notificationIdentifier:(id)a8 expirationDate:(id)a9;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)removeBridgeBulletinsForPassWithUniqueID:(id)a3;
- (void)removeBridgeBulletinsWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5;
- (void)removeDeliveredBridgeBulletinsWithNotificationIdentifier:(id)a3;
- (void)setNotificationCenter:(id)a3;
@end

@implementation NPDBulletinManager

- (NPDBulletinManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)NPDBulletinManager;
  v2 = [(NPDBulletinManager *)&v6 init];
  if (v2)
  {
    v3 = (UNUserNotificationCenter *)[objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.Bridge"];
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = v3;

    PDScheduledActivityClientRegister();
  }
  return v2;
}

- (void)dealloc
{
  PDScheduledActivityClientRemove();
  v3.receiver = self;
  v3.super_class = (Class)NPDBulletinManager;
  [(NPDBulletinManager *)&v3 dealloc];
}

- (void)insertBridgeBulletinWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5 forPass:(id)a6
{
  id v7 = [(NPDBulletinManager *)self _userNotificationWithTitle:a3 message:a4 actionURL:a5 forPass:a6 playSound:0 notificationIdentifier:0 expirationDate:0];
  [(UNUserNotificationCenter *)self->_notificationCenter addNotificationRequest:v7 withCompletionHandler:0];
}

- (void)insertBridgeBulletinWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5 forPass:(id)a6 playSound:(BOOL)a7 notificationIdentifier:(id)a8 expirationDate:(id)a9
{
  BOOL v10 = a7;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  v21 = pk_General_log();
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

  if (v22)
  {
    v23 = pk_General_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413570;
      id v27 = (id)objc_opt_class();
      __int16 v28 = 2112;
      id v29 = v15;
      __int16 v30 = 2112;
      id v31 = v16;
      __int16 v32 = 1024;
      BOOL v33 = v10;
      __int16 v34 = 2112;
      id v35 = v19;
      __int16 v36 = 2112;
      id v37 = v20;
      id v24 = v27;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Notice: %@: requested insert notification with title:%@ message:%@ playSound:%d, notificationIdentifier:%@, expirationDate:%@", buf, 0x3Au);
    }
  }
  v25 = [(NPDBulletinManager *)self _userNotificationWithTitle:v15 message:v16 actionURL:v17 forPass:v18 playSound:v10 notificationIdentifier:v19 expirationDate:v20];
  [(UNUserNotificationCenter *)self->_notificationCenter addNotificationRequest:v25 withCompletionHandler:0];
}

- (void)insertBridgeBulletinWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5 delay:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = pk_General_log();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  if (v14)
  {
    id v15 = pk_General_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      id v22 = (id)objc_opt_class();
      __int16 v23 = 2112;
      id v24 = v10;
      __int16 v25 = 2112;
      id v26 = v11;
      __int16 v27 = 2048;
      double v28 = a6;
      id v16 = v22;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Notice: %@: requested insert notification with title:%@ message:%@ delay:%f", buf, 0x2Au);
    }
  }
  if (a6 <= 0.0)
  {
    [(NPDBulletinManager *)self insertBridgeBulletinWithTitle:v10 message:v11 actionURL:v12 forPass:0];
  }
  else
  {
    id v17 = [(NPDBulletinManager *)self _defaultNotficationIdentifierWithTitle:v10 message:v11 actionURL:v12 forPass:0];
    id v18 = [(NPDBulletinManager *)self _userNotificationWithTitle:v10 message:v11 actionURL:v12 forPass:0 playSound:0 notificationIdentifier:v17 expirationDate:0];
    id v19 = +[NSDate dateWithTimeIntervalSinceNow:a6];
    id v20 = +[PDScheduledActivityCriteria priorityActivityCriteriaWithStartDate:v19];
    PDScheduledActivityRegister();
    [(NPDBulletinManager *)self _persistDelayedNotificationRequest:v18];
  }
}

- (void)removeBridgeBulletinsForPassWithUniqueID:(id)a3
{
  id v4 = a3;
  notificationCenter = self->_notificationCenter;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100044A60;
  v7[3] = &unk_10006EAD0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  [(UNUserNotificationCenter *)notificationCenter getDeliveredNotificationsWithCompletionHandler:v7];
}

- (void)removeBridgeBulletinsWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = pk_General_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    v13 = pk_General_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v21 = (id)objc_opt_class();
      __int16 v22 = 2112;
      id v23 = v8;
      __int16 v24 = 2112;
      id v25 = v9;
      id v14 = v21;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Notice: %@: requested remove notification with title:%@ message:%@", buf, 0x20u);
    }
  }
  uint64_t v15 = [(NPDBulletinManager *)self _defaultNotficationIdentifierWithTitle:v8 message:v9 actionURL:v10 forPass:0];
  id v16 = (void *)v15;
  if (v15)
  {
    notificationCenter = self->_notificationCenter;
    uint64_t v19 = v15;
    id v18 = +[NSArray arrayWithObjects:&v19 count:1];
    [(UNUserNotificationCenter *)notificationCenter removeDeliveredNotificationsWithIdentifiers:v18];

    [(NPDBulletinManager *)self _removeDelayedNotificationRequestWithIdentifier:v16];
    PDScheduledActivityRemove();
  }
}

- (void)removeDeliveredBridgeBulletinsWithNotificationIdentifier:(id)a3
{
  id v4 = a3;
  v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v13 = (id)objc_opt_class();
      __int16 v14 = 2112;
      id v15 = v4;
      id v8 = v13;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: %@: requested remove notification with identifier:%@", buf, 0x16u);
    }
  }
  if (v4)
  {
    notificationCenter = self->_notificationCenter;
    id v11 = v4;
    id v10 = +[NSArray arrayWithObjects:&v11 count:1];
    [(UNUserNotificationCenter *)notificationCenter removeDeliveredNotificationsWithIdentifiers:v10];
  }
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v6 = a3;
  v5 = -[NPDBulletinManager _delayedUserNotificationWithIdentifier:](self, "_delayedUserNotificationWithIdentifier:");
  if (v5)
  {
    [(NPDBulletinManager *)self _removeDelayedNotificationRequestWithIdentifier:v6];
    [(UNUserNotificationCenter *)self->_notificationCenter addNotificationRequest:v5 withCompletionHandler:0];
  }
}

- (void)_persistDelayedNotificationRequest:(id)a3
{
  id v4 = a3;
  v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_opt_class();
      id v9 = v8;
      id v10 = [v4 identifier];
      int v16 = 138412546;
      id v17 = v8;
      __int16 v18 = 2112;
      uint64_t v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: %@: persisted notification with ID:%@", (uint8_t *)&v16, 0x16u);
    }
  }
  id v11 = [v4 identifier];

  if (v11)
  {
    BOOL v12 = NPKSecureArchiveObject();
    id v13 = [(NPDBulletinManager *)self _archivedDelayedNotifications];
    id v14 = [v13 mutableCopy];

    id v15 = [v4 identifier];
    [v14 setObject:v12 forKeyedSubscript:v15];

    [(NPDBulletinManager *)self _persistArchivedNotifications:v14];
  }
}

- (id)_delayedUserNotificationWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(NPDBulletinManager *)self _archivedDelayedNotifications];
  BOOL v6 = [v5 objectForKey:v4];

  objc_opt_class();
  id v7 = NPKSecureUnarchiveObject();
  id v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    if (!v9) {
      goto LABEL_9;
    }
    id v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      id v16 = (id)objc_opt_class();
      __int16 v17 = 2112;
      id v18 = v4;
      id v11 = v16;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Notice: %@: found persisted notification with ID:%@", (uint8_t *)&v15, 0x16u);
    }
  }
  else
  {
    if (!v9) {
      goto LABEL_9;
    }
    id v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v12 = objc_opt_class();
      id v13 = v12;
      int v15 = 138412802;
      id v16 = v12;
      __int16 v17 = 2112;
      id v18 = v4;
      __int16 v19 = 2048;
      id v20 = [0 length];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Notice: %@: could not find persisted notification with ID:%@ dataLength:%lu", (uint8_t *)&v15, 0x20u);
    }
  }

LABEL_9:
  return v7;
}

- (void)_removeDelayedNotificationRequestWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(NPDBulletinManager *)self _archivedDelayedNotifications];
  id v6 = [v5 mutableCopy];

  [v6 removeObjectForKey:v4];
  if (![v6 count])
  {

    id v6 = 0;
  }
  [(NPDBulletinManager *)self _persistArchivedNotifications:v6];
  id v7 = pk_General_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    BOOL v9 = pk_General_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      id v12 = (id)objc_opt_class();
      __int16 v13 = 2112;
      id v14 = v4;
      id v10 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Notice: %@: removed persisted notification with ID:%@", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (id)_archivedDelayedNotifications
{
  v2 = NPKPreferencesGetValue();
  if (!v2)
  {
    v2 = +[NSDictionary dictionary];
  }
  return v2;
}

- (void)_persistArchivedNotifications:(id)a3
{
}

- (id)_userNotificationWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5 forPass:(id)a6 playSound:(BOOL)a7 notificationIdentifier:(id)a8 expirationDate:(id)a9
{
  BOOL v10 = a7;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  uint64_t v21 = [v18 uniqueID];
  __int16 v22 = (void *)v21;
  if (v19)
  {
    if (!v21)
    {
LABEL_8:
      if (!v17)
      {
        id v17 = +[NPKCompanionAgentConnection watchProvisioningURL];
      }
      goto LABEL_10;
    }
  }
  else
  {
    id v19 = [(NPDBulletinManager *)self _defaultNotficationIdentifierWithTitle:v15 message:v16 actionURL:v17 forPass:v18];
    if (!v22) {
      goto LABEL_8;
    }
  }
  if ([v18 passType] != (id)1) {
    goto LABEL_8;
  }
  if (!v17)
  {
    id v23 = [v18 paymentPass];
    __int16 v32 = v23;
    __int16 v24 = +[NSArray arrayWithObjects:&v32 count:1];
    id v17 = +[NPKCompanionAgentConnection watchProvisioningURLForPaymentPasses:v24];
  }
LABEL_10:
  id v25 = objc_alloc_init((Class)UNMutableNotificationContent);
  [v25 setTitle:v15];
  [v25 setBody:v16];
  [v25 setDefaultActionURL:v17];
  if (v22)
  {
    uint64_t v30 = PKPassbookBulletinPassUniqueIdentifierKey;
    id v31 = v22;
    id v26 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    [v25 setUserInfo:v26];
  }
  if (v20) {
    [v25 setExpirationDate:v20];
  }
  if (v10)
  {
    __int16 v27 = +[UNNotificationSound defaultSound];
    [v25 setSound:v27];
  }
  double v28 = +[UNNotificationRequest requestWithIdentifier:v19 content:v25 trigger:0];

  return v28;
}

- (id)_defaultNotficationIdentifierWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5 forPass:(id)a6
{
  id v8 = a6;
  id v9 = a4;
  id v10 = a3;
  int v11 = +[NSMutableArray array];
  [v11 npkSafelyAddObject:v10];

  [v11 npkSafelyAddObject:v9];
  id v12 = [v8 uniqueID];

  [v11 npkSafelyAddObject:v12];
  __int16 v13 = +[NSString stringWithFormat:@"wallet-%ld", PKCombinedHash()];

  return v13;
}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end