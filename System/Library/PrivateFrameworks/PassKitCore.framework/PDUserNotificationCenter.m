@interface PDUserNotificationCenter
+ (BOOL)supportsSecureCoding;
+ (void)alertNotificationsEnabled:(id)a3;
- (NSArray)existingLocalNotifications;
- (OS_dispatch_queue)processingQueue;
- (PDDatabaseManager)databaseManager;
- (PDUserNotificationCenter)init;
- (PDUserNotificationCenter)initWithCoder:(id)a3;
- (PDUserNotificationCenterDelegate)delegate;
- (PDUserNotificationIconStore)iconStore;
- (id)_activeUserNotificationsSortedByDateAscending:(BOOL)a3;
- (id)_headerTitleForNotification:(id)a3;
- (id)_init;
- (id)_notificationCategories;
- (id)_notificationRequestForUserNotification:(id)a3 shouldInterrupt:(BOOL)a4;
- (id)_serviceNotificationCategories;
- (id)applicationMessageContentForNotificationIdentifier:(id)a3;
- (id)fileURLForAsset:(int64_t)a3 passUniqueIdentifier:(id)a4;
- (id)fileURLForImage:(id)a3 identifier:(id)a4;
- (id)notificationSettings;
- (id)passWithUniqueIdentifier:(id)a3;
- (void)_addUserNotification:(id)a3 shouldSuppress:(BOOL)a4;
- (void)_insertUserNotification:(id)a3;
- (void)_processConnectionOperations;
- (void)_processServiceConnectionOperations;
- (void)_queue_userNotificationActionPerformed:(unint64_t)a3 applicationMessageContentIdentifier:(id)a4;
- (void)_removeUserNotificationsWithIdentifiers:(id)a3;
- (void)_synchronizeDeliveredNotificationsWithCompletion:(id)a3;
- (void)_updateUserNotification:(id)a3 withExistingNotification:(id)a4 shouldSuppress:(BOOL)a5;
- (void)connect;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)insertUserNotification:(id)a3;
- (void)promoteSuppressedUserNotificationsIfPossible;
- (void)removeAllUserNotifications;
- (void)removeUserNotification:(id)a3;
- (void)removeUserNotificationWithIdentifier:(id)a3;
- (void)removeUserNotificationsForPassUniqueIdentifier:(id)a3;
- (void)removeUserNotificationsForPassUniqueIdentifier:(id)a3 ofType:(unint64_t)a4;
- (void)removeUserNotificationsOfType:(unint64_t)a3;
- (void)requestNotificationAuthorizationIfNecessaryWithCompletion:(id)a3;
- (void)requestNotificationAuthorizationWithCompletion:(id)a3;
- (void)setDatabaseManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIconStore:(id)a3;
- (void)setProcessingQueue:(id)a3;
- (void)updateApplicationMessageContentForNotification:(id)a3;
- (void)updateUserNotificationsForUpdatedExpressPassConfigurations:(id)a3;
- (void)userNotificationActionPerformed:(unint64_t)a3 applicationMessageContentIdentifier:(id)a4;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4;
- (void)userNotificationWithIdentifier:(id)a3 completion:(id)a4;
- (void)userNotificationsForPassUniqueIdentifier:(id)a3 ofType:(unint64_t)a4 completion:(id)a5;
- (void)userNotificationsOfType:(unint64_t)a3 completion:(id)a4;
@end

@implementation PDUserNotificationCenter

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)PDUserNotificationCenter;
  v2 = [(PDUserNotificationCenter *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pendingNotifications = v2->_pendingNotifications;
    v2->_pendingNotifications = v3;
  }
  return v2;
}

- (PDUserNotificationCenter)init
{
  v2 = [(PDUserNotificationCenter *)self _init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    userNotifications = v2->_userNotifications;
    v2->_userNotifications = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    inflightUserNotifications = v2->_inflightUserNotifications;
    v2->_inflightUserNotifications = v5;
  }
  return v2;
}

- (void)dealloc
{
  internalNotificationCenter = self->_internalNotificationCenter;
  self->_internalNotificationCenter = 0;

  internalServiceNotificationCenter = self->_internalServiceNotificationCenter;
  self->_internalServiceNotificationCenter = 0;

  v5.receiver = self;
  v5.super_class = (Class)PDUserNotificationCenter;
  [(PDUserNotificationCenter *)&v5 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDUserNotificationCenter)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(PDUserNotificationCenter *)self _init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"userNotifications"];
    userNotifications = v5->_userNotifications;
    v5->_userNotifications = (NSMutableDictionary *)v9;

    v11 = [v4 decodeObjectOfClasses:v8 forKey:@"inflightUserNoticiations"];
    v12 = v11;
    if (v11) {
      v13 = v11;
    }
    else {
      v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    }
    inflightUserNotifications = v5->_inflightUserNotifications;
    v5->_inflightUserNotifications = v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[NSMutableDictionary dictionary];
  userNotifications = self->_userNotifications;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1002A6018;
  v16[3] = &unk_100744E40;
  id v17 = v5;
  id v7 = v5;
  [(NSMutableDictionary *)userNotifications enumerateKeysAndObjectsUsingBlock:v16];
  [v4 encodeObject:v7 forKey:@"userNotifications"];
  v8 = +[NSMutableDictionary dictionary];
  inflightUserNotifications = self->_inflightUserNotifications;
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = sub_1002A6084;
  v14 = &unk_100744E40;
  id v15 = v8;
  id v10 = v8;
  [(NSMutableDictionary *)inflightUserNotifications enumerateKeysAndObjectsUsingBlock:&v11];
  objc_msgSend(v4, "encodeObject:forKey:", v10, @"inflightUserNoticiations", v11, v12, v13, v14);
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  processingQueue = self->_processingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002A61B4;
  block[3] = &unk_10072E9D8;
  id v13 = v7;
  v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(processingQueue, block);
}

- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4
{
  id v4 = objc_msgSend(a4, "request", a3);
  objc_super v5 = [v4 content];
  uint64_t v6 = [v5 userInfo];
  id v7 = [v6 PKStringForKey:PKPassbookBulletinPassUniqueIdentifierKey];

  if ([v7 length]) {
    PDOpenWalletUI();
  }
}

- (id)passWithUniqueIdentifier:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  uint64_t v6 = [WeakRetained passWithUniqueIdentifier:v4];

  return v6;
}

- (id)fileURLForAsset:(int64_t)a3 passUniqueIdentifier:(id)a4
{
  return [(PDUserNotificationIconStore *)self->_iconStore fileURLForAsset:a3 passUniqueIdentifier:a4];
}

- (id)fileURLForImage:(id)a3 identifier:(id)a4
{
  return [(PDUserNotificationIconStore *)self->_iconStore fileURLForImage:a3 identifier:a4];
}

- (id)notificationSettings
{
  return [(UNUserNotificationCenter *)self->_internalNotificationCenter notificationSettings];
}

- (void)connect
{
  if (self->_internalNotificationCenter && self->_userCenterConnected)
  {
    self->_userCenterConnected = 1;
    [(PDUserNotificationCenter *)self _processConnectionOperations];
  }
  else
  {
    id v3 = objc_alloc((Class)UNUserNotificationCenter);
    id v4 = (UNUserNotificationCenter *)[v3 initWithBundleIdentifier:PKUserNotificationsBundleIdentifier];
    internalNotificationCenter = self->_internalNotificationCenter;
    self->_internalNotificationCenter = v4;

    uint64_t v6 = self->_internalNotificationCenter;
    id v7 = [(PDUserNotificationCenter *)self _notificationCategories];
    [(UNUserNotificationCenter *)v6 setNotificationCategories:v7];

    [(UNUserNotificationCenter *)self->_internalNotificationCenter setDelegate:self];
    [(UNUserNotificationCenter *)self->_internalNotificationCenter setWantsNotificationResponsesDelivered];
    id v8 = self->_internalNotificationCenter;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1002A6770;
    v16[3] = &unk_100744E68;
    void v16[4] = self;
    [(UNUserNotificationCenter *)v8 getNotificationSettingsWithCompletionHandler:v16];
  }
  if (self->_internalServiceNotificationCenter && self->_serviceCenterConnected)
  {
    self->_serviceCenterConnected = 1;
    [(PDUserNotificationCenter *)self _processServiceConnectionOperations];
  }
  else
  {
    id v9 = objc_alloc((Class)UNUserNotificationCenter);
    id v10 = (UNUserNotificationCenter *)[v9 initWithBundleIdentifier:PKServiceNotificationsBundleIdentifier];
    internalServiceNotificationCenter = self->_internalServiceNotificationCenter;
    self->_internalServiceNotificationCenter = v10;

    uint64_t v12 = self->_internalServiceNotificationCenter;
    id v13 = [(PDUserNotificationCenter *)self _serviceNotificationCategories];
    [(UNUserNotificationCenter *)v12 setNotificationCategories:v13];

    [(UNUserNotificationCenter *)self->_internalServiceNotificationCenter setDelegate:self];
    [(UNUserNotificationCenter *)self->_internalServiceNotificationCenter setWantsNotificationResponsesDelivered];
    v14 = self->_internalServiceNotificationCenter;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1002A6AF4;
    v15[3] = &unk_100744E68;
    v15[4] = self;
    [(UNUserNotificationCenter *)v14 getNotificationSettingsWithCompletionHandler:v15];
  }
}

- (id)applicationMessageContentForNotificationIdentifier:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(NSMutableDictionary *)self->_userNotifications objectForKeyedSubscript:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = [v5 applicationMessageContent];
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PDUserNotificationCenter: cannot get applicationMessageContent since there is no user notification with identifier %@", (uint8_t *)&v10, 0xCu);
    }

    id v7 = 0;
  }

  return v7;
}

- (void)updateApplicationMessageContentForNotification:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    processingQueue = self->_processingQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002A701C;
    v7[3] = &unk_10072E198;
    id v8 = v4;
    id v9 = self;
    dispatch_async(processingQueue, v7);
  }
}

- (void)requestNotificationAuthorizationWithCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PDUserNotificationCenter: requestAuthorizationWithOptions", buf, 2u);
  }

  internalNotificationCenter = self->_internalNotificationCenter;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002A7188;
  v8[3] = &unk_1007305A0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(UNUserNotificationCenter *)internalNotificationCenter requestAuthorizationWithOptions:7 completionHandler:v8];
}

- (void)userNotificationActionPerformed:(unint64_t)a3 applicationMessageContentIdentifier:(id)a4
{
  id v6 = a4;
  processingQueue = self->_processingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002A73E4;
  block[3] = &unk_10072F7D0;
  id v10 = v6;
  unint64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(processingQueue, block);
}

- (void)_queue_userNotificationActionPerformed:(unint64_t)a3 applicationMessageContentIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"dismiss";
    if (a3 != 1) {
      CFStringRef v8 = 0;
    }
    if (a3 == 2) {
      CFStringRef v8 = @"defaultAction";
    }
    int v10 = 138412546;
    CFStringRef v11 = v8;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PDUserNotificationCenter _queue_userNotificationActionPerformed: %@, applicationMessageContentIdentifier: %@", (uint8_t *)&v10, 0x16u);
  }

  if (v6 && a3 - 1 <= 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained removeNotificationApplicationMessageWithIdentifier:v6];
  }
}

- (void)requestNotificationAuthorizationIfNecessaryWithCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PDUserNotificationCenter: requestNotificationAuthorizationIfNecessaryWithCompletion", buf, 2u);
  }

  internalNotificationCenter = self->_internalNotificationCenter;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002A75F4;
  v8[3] = &unk_100744E90;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(UNUserNotificationCenter *)internalNotificationCenter getNotificationSettingsWithCompletionHandler:v8];
}

- (void)_processConnectionOperations
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = self->_pendingNotifications;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        CFStringRef v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ((objc_msgSend(v8, "isServiceNotification", (void)v9) & 1) == 0) {
          [(PDUserNotificationCenter *)self _insertUserNotification:v8];
        }
      }
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_pendingNotifications pk_removeObjectsPassingTest:&stru_100744ED0];
  [(PDUserNotificationCenter *)self promoteSuppressedUserNotificationsIfPossible];
}

- (void)_processServiceConnectionOperations
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = self->_pendingNotifications;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        CFStringRef v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "isServiceNotification", (void)v9)) {
          [(PDUserNotificationCenter *)self _insertUserNotification:v8];
        }
      }
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_pendingNotifications pk_removeObjectsPassingTest:&stru_100744EF0];
  [(PDUserNotificationCenter *)self promoteSuppressedUserNotificationsIfPossible];
}

- (void)promoteSuppressedUserNotificationsIfPossible
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned __int8 v4 = [WeakRetained userNotificationCenterShouldSuppressUserNotifications:self];

  if ((v4 & 1) == 0)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1002A7B24;
    v5[3] = &unk_10072E1E8;
    v5[4] = self;
    [(PDUserNotificationCenter *)self _synchronizeDeliveredNotificationsWithCompletion:v5];
  }
}

- (void)insertUserNotification:(id)a3
{
  id v4 = a3;
  if ([v4 isValid])
  {
    if (!self->_userCenterConnected && ([v4 isServiceNotification] & 1) == 0)
    {
      id v5 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138412546;
        id v9 = v4;
        __int16 v10 = 2112;
        long long v11 = self;
        uint64_t v6 = "Cannot insert User Notification: %@ in Notification Center: %@ as connecting has not completed yet.";
        goto LABEL_14;
      }
LABEL_15:

      [(NSMutableArray *)self->_pendingNotifications addObject:v4];
      goto LABEL_16;
    }
    if (!self->_serviceCenterConnected && [v4 isServiceNotification])
    {
      id v5 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138412546;
        id v9 = v4;
        __int16 v10 = 2112;
        long long v11 = self;
        uint64_t v6 = "Cannot insert Service Notification: %@ in Notification Center: %@ as connecting has not completed yet.";
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0x16u);
        goto LABEL_15;
      }
      goto LABEL_15;
    }
    [(PDUserNotificationCenter *)self _insertUserNotification:v4];
  }
  else
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412546;
      id v9 = v4;
      __int16 v10 = 2112;
      long long v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Cannot insert User Notification: %@ in Notification Center: %@ as it is not valid.", (uint8_t *)&v8, 0x16u);
    }
  }
LABEL_16:
}

- (void)_insertUserNotification:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002A7F78;
  v5[3] = &unk_10072E198;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  [(PDUserNotificationCenter *)self _synchronizeDeliveredNotificationsWithCompletion:v5];
}

- (void)updateUserNotificationsForUpdatedExpressPassConfigurations:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating User Notifications to reflect new Express Pass State", buf, 2u);
  }

  id v6 = objc_msgSend(v4, "pk_setByApplyingBlock:", &stru_100744F30);
  id v7 = +[NSPredicate predicateWithFormat:@"NOT (passUniqueIdentifier IN %@) AND (notificationType == %ul OR notificationType = %ul)", v6, 28, 32];
  int v8 = [(NSMutableDictionary *)self->_userNotifications allValues];
  id v9 = [v8 filteredArrayUsingPredicate:v7];
  __int16 v10 = objc_msgSend(v9, "pk_arrayByApplyingBlock:", &stru_100744F70);

  [(PDUserNotificationCenter *)self _removeUserNotificationsWithIdentifiers:v10];
}

- (void)removeUserNotificationWithIdentifier:(id)a3
{
  if (a3)
  {
    id v6 = a3;
    id v4 = a3;
    id v5 = +[NSArray arrayWithObjects:&v6 count:1];

    -[PDUserNotificationCenter _removeUserNotificationsWithIdentifiers:](self, "_removeUserNotificationsWithIdentifiers:", v5, v6);
  }
}

- (void)removeUserNotification:(id)a3
{
  if (a3)
  {
    id v4 = [a3 notificationIdentifier];
    id v6 = v4;
    id v5 = +[NSArray arrayWithObjects:&v6 count:1];
    [(PDUserNotificationCenter *)self _removeUserNotificationsWithIdentifiers:v5];
  }
}

- (void)removeUserNotificationsOfType:(unint64_t)a3
{
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 > 0x51) {
      CFStringRef v6 = @"unknown";
    }
    else {
      CFStringRef v6 = *(&off_100745148 + a3);
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v12 = v6;
    __int16 v13 = 2112;
    v14 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing User Notifications of type: %@ from Notification Center: %@", buf, 0x16u);
  }

  id v7 = +[NSPredicate predicateWithFormat:@"notificationType == %ul", a3];
  int v8 = [(NSMutableDictionary *)self->_userNotifications allValues];
  id v9 = [v8 filteredArrayUsingPredicate:v7];
  __int16 v10 = objc_msgSend(v9, "pk_arrayByApplyingBlock:", &stru_100744F90);

  [(PDUserNotificationCenter *)self _removeUserNotificationsWithIdentifiers:v10];
}

- (void)removeUserNotificationsForPassUniqueIdentifier:(id)a3 ofType:(unint64_t)a4
{
  id v6 = a3;
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (a4 > 0x51) {
      CFStringRef v8 = @"unknown";
    }
    else {
      CFStringRef v8 = *(&off_100745148 + a4);
    }
    *(_DWORD *)buf = 138412802;
    id v14 = v6;
    __int16 v15 = 2112;
    CFStringRef v16 = v8;
    __int16 v17 = 2112;
    v18 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Removing User Notifications for Pass: %@ of type: %@ from Notification Center: %@", buf, 0x20u);
  }

  id v9 = +[NSPredicate predicateWithFormat:@"passUniqueIdentifier == %@ AND notificationType == %ul", v6, a4];
  __int16 v10 = [(NSMutableDictionary *)self->_userNotifications allValues];
  long long v11 = [v10 filteredArrayUsingPredicate:v9];
  CFStringRef v12 = objc_msgSend(v11, "pk_arrayByApplyingBlock:", &stru_100744FB0);

  [(PDUserNotificationCenter *)self _removeUserNotificationsWithIdentifiers:v12];
}

- (void)removeUserNotificationsForPassUniqueIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v11 = v4;
    __int16 v12 = 2112;
    __int16 v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing User Notifications for Pass: %@ from Notification Center: %@", buf, 0x16u);
  }

  id v6 = +[NSPredicate predicateWithFormat:@"passUniqueIdentifier == %@", v4];
  id v7 = [(NSMutableDictionary *)self->_userNotifications allValues];
  CFStringRef v8 = [v7 filteredArrayUsingPredicate:v6];
  id v9 = objc_msgSend(v8, "pk_arrayByApplyingBlock:", &stru_100744FD0);

  [(PDUserNotificationCenter *)self _removeUserNotificationsWithIdentifiers:v9];
}

- (void)removeAllUserNotifications
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Removing all User Notifications from Notification Center: %@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(NSMutableDictionary *)self->_userNotifications allKeys];
  [(PDUserNotificationCenter *)self _removeUserNotificationsWithIdentifiers:v4];
}

- (void)userNotificationsOfType:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1002A8BE0;
    v8[3] = &unk_10072FFE8;
    v8[4] = self;
    unint64_t v10 = a3;
    id v9 = v6;
    [(PDUserNotificationCenter *)self _synchronizeDeliveredNotificationsWithCompletion:v8];
  }
}

- (void)userNotificationsForPassUniqueIdentifier:(id)a3 ofType:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1002A8D98;
    v10[3] = &unk_100731AD8;
    unint64_t v14 = a4;
    id v11 = v8;
    __int16 v12 = self;
    id v13 = v9;
    [(PDUserNotificationCenter *)self _synchronizeDeliveredNotificationsWithCompletion:v10];
  }
}

- (void)userNotificationWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1002A8F08;
    v8[3] = &unk_10072E9D8;
    v8[4] = self;
    id v9 = v6;
    id v10 = v7;
    [(PDUserNotificationCenter *)self _synchronizeDeliveredNotificationsWithCompletion:v8];
  }
}

+ (void)alertNotificationsEnabled:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc((Class)UNUserNotificationCenter);
    id v5 = [v4 initWithBundleIdentifier:PKUserNotificationsBundleIdentifier];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1002A9024;
    v6[3] = &unk_100745018;
    id v7 = v3;
    [v5 getNotificationSettingsWithCompletionHandler:v6];
  }
}

- (NSArray)existingLocalNotifications
{
  return (NSArray *)[(NSMutableDictionary *)self->_userNotifications allValues];
}

- (id)_headerTitleForNotification:(id)a3
{
  id v4 = a3;
  if (PDIsWalletUserNotificationType((uint64_t)[v4 notificationType]))
  {
    uint64_t v5 = PKLocalizedString(@"WALLET");
LABEL_11:
    __int16 v12 = (void *)v5;
    goto LABEL_12;
  }
  id v6 = [v4 familyNotificationType];
  if (!v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v8 = [v4 passUniqueIdentifier];
    id v9 = [WeakRetained passWithUniqueIdentifier:v8];

    id v10 = [v9 notificationCenterTitle];
    if (v10)
    {
      if (PKPassbookIsCurrentlyAvailable())
      {
        PKLocalizedString(@"TRANSACTION_USER_NOTIFICATION_TITLE_FORMAT", @"%@", v10);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v11 = v10;
      }
    }
    else
    {
      PKLocalizedString(@"WALLET");
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    __int16 v12 = v11;

    goto LABEL_12;
  }
  if (v6 == (id)2)
  {
    uint64_t v5 = PKLocalizedMadisonString(@"ACCOUNT_USER_NOTIFICATION_TITLE_FORMAT");
    goto LABEL_11;
  }
  if (v6 == (id)1)
  {
    uint64_t v5 = PKLocalizedPeerPaymentLexingtonString(@"PEER_PAYMENT_TRANSACTION_NOTIFICATION_FAMILY_TRANSACTION_USER_NOTIFICATION_TITLE_FORMAT");
    goto LABEL_11;
  }
  __int16 v12 = 0;
LABEL_12:

  return v12;
}

- (id)_notificationCategories
{
  registeredCategories = self->_registeredCategories;
  if (!registeredCategories)
  {
    v49 = self;
    id v4 = objc_alloc_init((Class)NSMutableSet);
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v5 = [&off_10078C378 countByEnumeratingWithState:&v50 objects:v54 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v51;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v51 != v7) {
            objc_enumerationMutation(&off_10078C378);
          }
          id v9 = PDUserNotificationCategoryForType((uint64_t)[*(id *)(*((void *)&v50 + 1) + 8 * (void)v8) integerValue]);
          if ([v9 length])
          {
            id v10 = [objc_alloc((Class)UNMutableNotificationCategory) initWithIdentifier:v9];
            [v10 setOptions:1];
            [v4 addObject:v10];
          }
          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [&off_10078C378 countByEnumeratingWithState:&v50 objects:v54 count:16];
      }
      while (v6);
    }
    id v11 = objc_alloc((Class)UNMutableNotificationCategory);
    __int16 v12 = PDUserNotificationCategoryForType(2);
    id v13 = [v11 initWithIdentifier:v12];

    v48 = v13;
    [v13 setOptions:4];
    [v4 addObject:v13];
    id v14 = objc_alloc((Class)UNMutableNotificationCategory);
    __int16 v15 = PDUserNotificationCategoryForType(3);
    id v47 = [v14 initWithIdentifier:v15];

    [v47 setOptions:4];
    [v4 addObject:v47];
    id v16 = objc_alloc((Class)UNMutableNotificationCategory);
    __int16 v17 = PDUserNotificationCategoryForType(4);
    id v46 = [v16 initWithIdentifier:v17];

    v18 = +[NSString localizedUserNotificationStringForKey:@"NOTIFICATION_SUMMARY_TRANSACTIONS" arguments:0];
    [v46 setHiddenPreviewsBodyPlaceholder:v18];

    [v46 setOptions:4];
    [v4 addObject:v46];
    id v19 = objc_alloc((Class)UNMutableNotificationCategory);
    v20 = PDUserNotificationCategoryForType(5);
    id v21 = [v19 initWithIdentifier:v20];

    v22 = +[NSString localizedUserNotificationStringForKey:@"NOTIFICATION_SUMMARY_TRANSACTIONS" arguments:0];
    [v21 setHiddenPreviewsBodyPlaceholder:v22];

    [v21 setOptions:4];
    [v4 addObject:v21];
    id v23 = objc_alloc((Class)UNMutableNotificationCategory);
    v24 = PDUserNotificationCategoryForType(7);
    id v45 = [v23 initWithIdentifier:v24];

    [v45 setOptions:4];
    [v4 addObject:v45];
    id v25 = objc_alloc((Class)UNMutableNotificationCategory);
    v26 = PDUserNotificationCategoryForType(6);
    id v27 = [v25 initWithIdentifier:v26];

    [v27 setListPriority:1];
    [v27 setOptions:131076];
    [v4 addObject:v27];
    id v28 = [objc_alloc((Class)UNMutableNotificationCategory) initWithIdentifier:@"PDUserNotificationTypeAccountPaymentDue"];
    [v28 setOptions:131076];
    [v4 addObject:v28];
    id v29 = [objc_alloc((Class)UNMutableNotificationCategory) initWithIdentifier:@"PDUserNotificationTypeAccountPaymentPastDue"];
    [v29 setOptions:0x20000];
    [v4 addObject:v29];
    id v30 = objc_alloc((Class)UNMutableNotificationCategory);
    v31 = PDUserNotificationCategoryForType(42);
    id v32 = [v30 initWithIdentifier:v31];

    [v32 setOptions:4];
    [v4 addObject:v32];
    id v33 = objc_alloc((Class)UNMutableNotificationCategory);
    v34 = PDUserNotificationCategoryForType(32);
    id v35 = [v33 initWithIdentifier:v34];

    [v35 setOptions:131076];
    [v4 addObject:v35];
    id v36 = objc_alloc((Class)UNMutableNotificationCategory);
    v37 = PDUserNotificationCategoryForType(63);
    id v38 = [v36 initWithIdentifier:v37];

    [v38 setOptions:4];
    [v4 addObject:v38];
    id v39 = objc_alloc((Class)UNMutableNotificationCategory);
    v40 = PDUserNotificationCategoryForType(79);
    id v41 = [v39 initWithIdentifier:v40];

    [v41 setOptions:131073];
    [v4 addObject:v41];
    v42 = (NSMutableSet *)[v4 copy];
    v43 = v49->_registeredCategories;
    v49->_registeredCategories = v42;

    registeredCategories = v49->_registeredCategories;
  }
  return registeredCategories;
}

- (id)_serviceNotificationCategories
{
  registeredServiceCategories = self->_registeredServiceCategories;
  if (!registeredServiceCategories)
  {
    id v4 = objc_alloc_init((Class)NSMutableSet);
    id v5 = (NSMutableSet *)[v4 copy];
    id v6 = self->_registeredServiceCategories;
    self->_registeredServiceCategories = v5;

    registeredServiceCategories = self->_registeredServiceCategories;
  }
  return registeredServiceCategories;
}

- (id)_notificationRequestForUserNotification:(id)a3 shouldInterrupt:(BOOL)a4
{
  BOOL v41 = a4;
  id v5 = a3;
  id v6 = [v5 notificationContentWithDataSource:self];
  uint64_t v7 = [v6 title];

  if (!v7)
  {
    id v8 = [(PDUserNotificationCenter *)self _headerTitleForNotification:v5];
    [v6 setTitle:v8];
  }
  v44 = PDUserNotificationCategoryForNotification(v5);
  objc_msgSend(v6, "setCategoryIdentifier:");
  char v9 = PDIsWalletUserNotificationType((uint64_t)[v5 notificationType]);
  id v10 = [v5 passUniqueIdentifier];
  uint64_t v11 = [v5 accountIdentifier];
  __int16 v12 = (void *)v11;
  v43 = v10;
  if (v9) {
    goto LABEL_4;
  }
  if (v10)
  {
    id v14 = -[PDUserNotificationIconStore fileURLForAsset:passUniqueIdentifier:](self->_iconStore, "fileURLForAsset:passUniqueIdentifier:", [v5 assetType], v10);
    __int16 v15 = [v14 path];
    id v16 = +[UNNotificationIcon iconAtPath:v15];

    [v6 setIcon:v16];
    __int16 v17 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v10];
    v18 = [v17 paymentPass];
    unsigned __int8 v19 = [v18 hasAssociatedPeerPaymentAccount];
    v20 = [v18 associatedAccountServiceAccountIdentifier];

    id v21 = [v17 rawIcon];
    if (!v21 || (v19 & 1) != 0)
    {
    }
    else
    {

      if (!v20) {
        [v6 setShouldShowSubordinateIcon:1];
      }
    }
    [v6 setThreadIdentifier:v10];
    CFStringRef v13 = v10;
  }
  else
  {
    if (!v11)
    {
LABEL_4:
      CFStringRef v13 = @"com.apple.Passbook";
      goto LABEL_17;
    }
    v22 = -[PDUserNotificationIconStore fileURLForAsset:accountIdentifier:](self->_iconStore, "fileURLForAsset:accountIdentifier:", [v5 assetType], v11);
    id v14 = v22;
    if (v22)
    {
      id v23 = [v22 path];
      v24 = +[UNNotificationIcon iconAtPath:v23];

      [v6 setIcon:v24];
    }
    [v6 setThreadIdentifier:v12];
    CFStringRef v13 = v12;
  }

LABEL_17:
  CFStringRef v50 = v13;
  CFStringRef v51 = @"sectionInfo";
  CFStringRef v49 = @"sectionID";
  id v25 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1, v13);
  long long v52 = v25;
  v26 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];

  id v46 = v26;
  CFStringRef v47 = @"BLTWatchLegacyMap";
  CFStringRef v45 = @"5.9.9";
  id v27 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
  v48 = v27;
  id v28 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];

  id v29 = [v6 userInfo];
  id v30 = [v29 mutableCopy];
  v31 = v30;
  v42 = v12;
  if (v30) {
    id v32 = v30;
  }
  else {
    id v32 = objc_alloc_init((Class)NSMutableDictionary);
  }
  id v33 = v32;
  if (v41) {
    uint64_t v34 = 15;
  }
  else {
    uint64_t v34 = 6;
  }

  [v33 addEntriesFromDictionary:v28];
  id v35 = [v33 copy];
  [v6 setUserInfo:v35];

  id v36 = [v5 notificationIdentifier];
  id v37 = [v6 copy];
  id v38 = +[UNNotificationRequest requestWithIdentifier:v36 content:v37 trigger:0 destinations:v34];

  return v38;
}

- (void)_addUserNotification:(id)a3 shouldSuppress:(BOOL)a4
{
  LODWORD(v4) = a4;
  id v6 = (PDUserNotificationCenter *)a3;
  uint64_t v7 = [(PDUserNotificationCenter *)self _activeUserNotificationsSortedByDateAscending:0];
  if ((unint64_t)[v7 count] < 0xA) {
    goto LABEL_3;
  }
  id v8 = [v7 lastObject];
  char v9 = [(PDUserNotificationCenter *)v6 date];
  id v10 = [v8 date];
  id v11 = [v9 compare:v10];

  if (v11 == (id)1)
  {
LABEL_3:
    __int16 v12 = [(PDUserNotificationCenter *)v6 notificationIdentifier];
    id v13 = [(PDUserNotificationCenter *)v6 suppressionBehavior];
    if (v13) {
      uint64_t v4 = v4;
    }
    else {
      uint64_t v4 = 0;
    }
    if ([(PDUserNotificationCenter *)v6 notificationType] == (id)28 && v13 == (id)2)
    {
      id v14 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v27 = (id)objc_opt_class();
        __int16 v28 = 2048;
        id v29 = v6;
        id v15 = v27;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Sending demoted express notification to Notification Center without interruptive notification: <%@: %p>", buf, 0x16u);
      }
      uint64_t v4 = 1;
    }
    [(PDUserNotificationCenter *)v6 setSuppressed:v4];
    id v16 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v27 = v6;
      __int16 v28 = 2112;
      id v29 = self;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Adding User Notification: %@ in Notification Center: %@", buf, 0x16u);
    }

    [(NSMutableDictionary *)self->_inflightUserNotifications setObject:v6 forKey:v12];
    objc_initWeak((id *)buf, self);
    unsigned int v17 = [(PDUserNotificationCenter *)v6 isServiceNotification];
    uint64_t v18 = 8;
    if (v17) {
      uint64_t v18 = 16;
    }
    id v19 = *(id *)((char *)&self->super.isa + v18);
    v20 = [(PDUserNotificationCenter *)self _notificationRequestForUserNotification:v6 shouldInterrupt:v4 ^ 1];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1002AA00C;
    v22[3] = &unk_100745060;
    objc_copyWeak(&v25, (id *)buf);
    id v21 = v12;
    id v23 = v21;
    v24 = v6;
    [v19 addNotificationRequest:v20 withCompletionHandler:v22];

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v21 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v27 = v6;
      __int16 v28 = 2112;
      id v29 = self;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Cannot add User Notification: %@ in Notification Center: %@ due to notification age.", buf, 0x16u);
    }
  }
}

- (void)_updateUserNotification:(id)a3 withExistingNotification:(id)a4 shouldSuppress:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 notificationIdentifier];
  id v11 = [v8 suppressionBehavior];
  if (a5)
  {
    if (v11)
    {
      unsigned int v12 = 0;
      uint64_t v13 = 1;
      goto LABEL_7;
    }
  }
  else if (v11 == (id)1)
  {
    [v9 isSuppressed];
  }
  unsigned int v12 = [v8 reissueBannerOnUpdate];
  uint64_t v13 = 0;
LABEL_7:
  [v8 setSuppressed:v13];
  unsigned int v14 = [v8 isServiceNotification];
  uint64_t v15 = 8;
  if (v14) {
    uint64_t v15 = 16;
  }
  id v16 = *(id *)((char *)&self->super.isa + v15);
  if (v12)
  {
    objc_initWeak(&location, self);
    unsigned int v17 = [(PDUserNotificationCenter *)self _notificationRequestForUserNotification:v8 shouldInterrupt:1];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1002AA550;
    v25[3] = &unk_100745060;
    objc_copyWeak(&v28, &location);
    id v26 = v10;
    id v27 = v8;
    [v16 addNotificationRequest:v17 withCompletionHandler:v25];

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v18 = [(PDUserNotificationCenter *)self _notificationRequestForUserNotification:v8 shouldInterrupt:0];
    objc_initWeak(&location, self);
    id v19 = [v18 identifier];
    v20 = [v18 content];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1002AA650;
    v21[3] = &unk_100745060;
    objc_copyWeak(&v24, &location);
    id v22 = v10;
    id v23 = v8;
    [v16 replaceContentForRequestWithIdentifier:v19 replacementContent:v20 completionHandler:v21];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
}

- (void)_removeUserNotificationsWithIdentifiers:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412546;
      id v8 = v4;
      __int16 v9 = 2112;
      id v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing User Notifications: %@ from Notification Center: %@", (uint8_t *)&v7, 0x16u);
    }

    [(NSMutableDictionary *)self->_userNotifications removeObjectsForKeys:v4];
    [(UNUserNotificationCenter *)self->_internalNotificationCenter removeDeliveredNotificationsWithIdentifiers:v4];
    [(UNUserNotificationCenter *)self->_internalServiceNotificationCenter removeDeliveredNotificationsWithIdentifiers:v4];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained userNotificationCenter:self removedUserNotificationIdentifiers:v4];
  }
}

- (void)_synchronizeDeliveredNotificationsWithCompletion:(id)a3
{
  id v4 = a3;
  internalServiceNotificationCenter = self->_internalServiceNotificationCenter;
  v31[0] = self->_internalNotificationCenter;
  v31[1] = internalServiceNotificationCenter;
  id v6 = +[NSArray arrayWithObjects:v31 count:2];
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v29[3] = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = sub_100020AAC;
  v27[4] = sub_100021048;
  id v28 = objc_alloc_init((Class)NSMutableArray);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1002AAAAC;
  v21[3] = &unk_1007450C8;
  id v25 = v27;
  id v26 = v29;
  id v7 = v6;
  id v22 = v7;
  id v23 = self;
  id v8 = v4;
  id v24 = v8;
  __int16 v9 = objc_retainBlock(v21);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v10);
        }
        unsigned int v14 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v13);
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_1002AAD6C;
        v15[3] = &unk_100736918;
        id v16 = v9;
        [v14 getDeliveredNotificationsWithCompletionHandler:v15];

        uint64_t v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v10 countByEnumeratingWithState:&v17 objects:v30 count:16];
    }
    while (v11);
  }

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v29, 8);
}

- (id)_activeUserNotificationsSortedByDateAscending:(BOOL)a3
{
  id v5 = +[NSPredicate predicateWithFormat:@"isActive == YES"];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002AAE78;
  v11[3] = &unk_1007450E8;
  BOOL v12 = a3;
  id v6 = objc_retainBlock(v11);
  id v7 = [(NSMutableDictionary *)self->_userNotifications allValues];
  id v8 = [v7 filteredArrayUsingPredicate:v5];

  __int16 v9 = [v8 sortedArrayUsingComparator:v6];

  return v9;
}

- (PDUserNotificationCenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PDUserNotificationCenterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)setProcessingQueue:(id)a3
{
  self->_processingQueue = (OS_dispatch_queue *)a3;
}

- (PDUserNotificationIconStore)iconStore
{
  return self->_iconStore;
}

- (void)setIconStore:(id)a3
{
}

- (PDDatabaseManager)databaseManager
{
  return self->_databaseManager;
}

- (void)setDatabaseManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_iconStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pendingNotifications, 0);
  objc_storeStrong((id *)&self->_inflightUserNotifications, 0);
  objc_storeStrong((id *)&self->_userNotifications, 0);
  objc_storeStrong((id *)&self->_registeredServiceCategories, 0);
  objc_storeStrong((id *)&self->_registeredCategories, 0);
  objc_storeStrong((id *)&self->_internalServiceNotificationCenter, 0);
  objc_storeStrong((id *)&self->_internalNotificationCenter, 0);
}

@end