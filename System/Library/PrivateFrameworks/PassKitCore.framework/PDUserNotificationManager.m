@interface PDUserNotificationManager
- (BOOL)_notificationRequirementsAreSatisfied:(id)a3;
- (BOOL)allowAcquisitionOfAssertionOfType:(unint64_t)a3;
- (BOOL)hasNotificationApplicationMessageWithIdentifier:(id)a3;
- (BOOL)interestedInAssertionOfType:(unint64_t)a3;
- (BOOL)updatePassAssetsWithPassUniqueID:(id)a3;
- (BOOL)userNotificationCenterShouldSuppressUserNotifications:(id)a3;
- (PDUserNotificationManager)initWithArchiveFileURL:(id)a3 databaseManager:(id)a4 assertionManager:(id)a5 paymentWebService:(id)a6 paymentWebServiceCoordinator:(id)a7 applicationMessageManager:(id)a8 delegate:(id)a9;
- (id)_badgeCountItemsForPayLaterWithAccount:(id)a3;
- (id)applicationMessageSink:(id)a3 createContentForMessageWithRegistration:(id)a4;
- (id)badgeCountItems;
- (id)passWithUniqueIdentifier:(id)a3;
- (id)pendingNotificationDescriptionsWithIdentifier:(id)a3;
- (id)scheduledNotificationActivitiesForPassUniqueIdentifier:(id)a3 ofType:(unint64_t)a4;
- (id)scheduledNotificationActivitiesOfType:(unint64_t)a3;
- (id)scheduledNotificationActivityWithIdentifier:(id)a3;
- (void)_archiveUserNotifications;
- (void)_removeScheduledActivitiesForPassUniqueIdentifier:(id)a3;
- (void)_removeScheduledActivitiesForPassUniqueIdentifier:(id)a3 ofType:(unint64_t)a4;
- (void)_removeScheduledActivitiesOfType:(unint64_t)a3;
- (void)alertNotificationsEnabled:(id)a3;
- (void)applicationMessageSink:(id)a3 tappedMessageWithRegistration:(id)a4;
- (void)assertionManager:(id)a3 didInvalidateAssertion:(id)a4;
- (void)connect;
- (void)connectApplicationMessageSink:(id)a3;
- (void)dealloc;
- (void)insertUserNotification:(id)a3;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4 activityContext:(id)a5;
- (void)removeAllUserNotifications;
- (void)removeNotificationApplicationMessageWithIdentifier:(id)a3;
- (void)removeNotificationAssetsForPassWithUniqueIdentifier:(id)a3;
- (void)removeUserNotification:(id)a3;
- (void)removeUserNotificationWithIdentifier:(id)a3;
- (void)removeUserNotificationsForPassUniqueIdentifier:(id)a3;
- (void)removeUserNotificationsForPassUniqueIdentifier:(id)a3 ofType:(unint64_t)a4;
- (void)removeUserNotificationsOfType:(unint64_t)a3;
- (void)requestNotificationAuthorizationIfNecessaryWithCompletion:(id)a3;
- (void)requestNotificationAuthorizationWithCompletion:(id)a3;
- (void)updateDate:(id)a3 forPendingNotificationWithIdentifier:(id)a4;
- (void)updateDeviceAssessmentEducationVisibility;
- (void)updateNotificationApplicationMessageWithNotification:(id)a3;
- (void)updateUserNotificationsForUpdatedExpressPassConfigurations:(id)a3;
- (void)updateWalletBadgeCount;
- (void)userNotificationActionPerformed:(unint64_t)a3 applicationMessageContentIdentifier:(id)a4;
- (void)userNotificationCenter:(id)a3 insertedOrUpdatedUserNotification:(id)a4;
- (void)userNotificationCenter:(id)a3 removedUserNotificationIdentifiers:(id)a4;
- (void)userNotificationWithIdentifier:(id)a3 completion:(id)a4;
- (void)userNotificationsForPassUniqueIdentifier:(id)a3 ofType:(unint64_t)a4 completion:(id)a5;
- (void)userNotificationsOfType:(unint64_t)a3 completion:(id)a4;
@end

@implementation PDUserNotificationManager

- (PDUserNotificationManager)initWithArchiveFileURL:(id)a3 databaseManager:(id)a4 assertionManager:(id)a5 paymentWebService:(id)a6 paymentWebServiceCoordinator:(id)a7 applicationMessageManager:(id)a8 delegate:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v36.receiver = self;
  v36.super_class = (Class)PDUserNotificationManager;
  v22 = [(PDUserNotificationManager *)&v36 init];
  if (v22)
  {
    dispatch_queue_t v23 = dispatch_queue_create("com.apple.passd.usernotificationmanager", 0);
    userNotificationManagerQueue = v22->_userNotificationManagerQueue;
    v22->_userNotificationManagerQueue = (OS_dispatch_queue *)v23;

    objc_storeStrong((id *)&v22->_applicationMessageManager, a8);
    objc_storeStrong((id *)&v22->_paymentWebServiceCoordinator, a7);
    [(PDPaymentWebServiceCoordinator *)v22->_paymentWebServiceCoordinator registerObserver:v22];
    sub_1003A0878((uint64_t)v22->_applicationMessageManager, 4, v22);
    v25 = v22->_userNotificationManagerQueue;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1002C83CC;
    v29[3] = &unk_100736010;
    v26 = v22;
    v30 = v26;
    id v31 = v15;
    id v32 = v16;
    id v33 = v17;
    id v34 = v18;
    id v35 = v21;
    dispatch_sync(v25, v29);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v26, (CFNotificationCallback)sub_1002C8480, PKWalletPreferencesChangedNotification, 0, (CFNotificationSuspensionBehavior)0);
  }
  return v22;
}

- (void)dealloc
{
  [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator unregisterObserver:self];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)PDUserNotificationManager;
  [(PDUserNotificationManager *)&v4 dealloc];
}

- (id)passWithUniqueIdentifier:(id)a3
{
  return [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:a3];
}

- (BOOL)userNotificationCenterShouldSuppressUserNotifications:(id)a3
{
  v3 = [(PDAssertionManager *)self->_assertionManager assertionsOfType:4];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)userNotificationCenter:(id)a3 insertedOrUpdatedUserNotification:(id)a4
{
  id v9 = a4;
  [(PDUserNotificationManager *)self _archiveUserNotifications];
  v5 = [v9 applicationMessageContent];

  if (v5)
  {
    id v6 = objc_alloc_init((Class)PKApplicationMessageRequest);
    objc_msgSend(v6, "setBadge:", objc_msgSend(v9, "applicationMessageBadge"));
    applicationMessageSink = self->_applicationMessageSink;
    v8 = [v9 notificationIdentifier];
    [(PKApplicationMessageSink *)applicationMessageSink registerOrUpdateMessageForIdentifier:v8 withRequest:v6];
  }
}

- (void)userNotificationCenter:(id)a3 removedUserNotificationIdentifiers:(id)a4
{
  id v5 = a4;
  [(PDUserNotificationManager *)self _archiveUserNotifications];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[PKApplicationMessageSink unregisterMessageForIdentifier:](self->_applicationMessageSink, "unregisterMessageForIdentifier:", *(void *)(*((void *)&v11 + 1) + 8 * (void)v10), (void)v11);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4 activityContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    [(PDUserNotificationManager *)self insertUserNotification:v10];
  }
  else
  {
    long long v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Scheduled activity missing context %@", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (BOOL)interestedInAssertionOfType:(unint64_t)a3
{
  return a3 == 4;
}

- (BOOL)allowAcquisitionOfAssertionOfType:(unint64_t)a3
{
  return 1;
}

- (void)assertionManager:(id)a3 didInvalidateAssertion:(id)a4
{
  id v5 = a3;
  userNotificationManagerQueue = self->_userNotificationManagerQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002C8890;
  v8[3] = &unk_10072E198;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(userNotificationManagerQueue, v8);
}

- (void)connectApplicationMessageSink:(id)a3
{
}

- (id)applicationMessageSink:(id)a3 createContentForMessageWithRegistration:(id)a4
{
  id v5 = objc_msgSend(a4, "key", a3);
  id v6 = [v5 identifier];

  id v7 = [(PDUserNotificationCenter *)self->_notificationCenter applicationMessageContentForNotificationIdentifier:v6];

  return v7;
}

- (void)applicationMessageSink:(id)a3 tappedMessageWithRegistration:(id)a4
{
  id v5 = objc_msgSend(a4, "key", a3);
  id v6 = [v5 identifier];

  [(PKApplicationMessageSink *)self->_applicationMessageSink unregisterMessageForIdentifier:v6];
}

- (void)connect
{
  userNotificationManagerQueue = self->_userNotificationManagerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002C8A58;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  dispatch_async(userNotificationManagerQueue, block);
}

- (void)requestNotificationAuthorizationIfNecessaryWithCompletion:(id)a3
{
  id v4 = a3;
  userNotificationManagerQueue = self->_userNotificationManagerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002C8F70;
  v7[3] = &unk_10072FDC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(userNotificationManagerQueue, v7);
}

- (void)requestNotificationAuthorizationWithCompletion:(id)a3
{
  id v4 = a3;
  userNotificationManagerQueue = self->_userNotificationManagerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002C9030;
  v7[3] = &unk_10072FDC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(userNotificationManagerQueue, v7);
}

- (void)userNotificationActionPerformed:(unint64_t)a3 applicationMessageContentIdentifier:(id)a4
{
  id v6 = a4;
  userNotificationManagerQueue = self->_userNotificationManagerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002C9100;
  block[3] = &unk_10072F7D0;
  id v10 = v6;
  unint64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(userNotificationManagerQueue, block);
}

- (void)insertUserNotification:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    userNotificationManagerQueue = self->_userNotificationManagerQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002C91BC;
    v7[3] = &unk_10072E198;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(userNotificationManagerQueue, v7);
  }
}

- (void)updateUserNotificationsForUpdatedExpressPassConfigurations:(id)a3
{
}

- (void)removeUserNotificationWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    userNotificationManagerQueue = self->_userNotificationManagerQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002C9458;
    v7[3] = &unk_10072E198;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(userNotificationManagerQueue, v7);
  }
}

- (void)removeUserNotification:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    userNotificationManagerQueue = self->_userNotificationManagerQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002C9550;
    v7[3] = &unk_10072E198;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(userNotificationManagerQueue, v7);
  }
}

- (void)removeUserNotificationsOfType:(unint64_t)a3
{
  userNotificationManagerQueue = self->_userNotificationManagerQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1002C9628;
  v4[3] = &unk_10072F840;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(userNotificationManagerQueue, v4);
}

- (void)removeUserNotificationsForPassUniqueIdentifier:(id)a3 ofType:(unint64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    userNotificationManagerQueue = self->_userNotificationManagerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002C9714;
    block[3] = &unk_10072F7D0;
    block[4] = self;
    id v10 = v6;
    unint64_t v11 = a4;
    dispatch_async(userNotificationManagerQueue, block);
  }
}

- (void)removeUserNotificationsForPassUniqueIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    userNotificationManagerQueue = self->_userNotificationManagerQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002C9804;
    v7[3] = &unk_10072E198;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(userNotificationManagerQueue, v7);
  }
}

- (void)removeAllUserNotifications
{
  userNotificationManagerQueue = self->_userNotificationManagerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002C98B8;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  dispatch_async(userNotificationManagerQueue, block);
}

- (void)removeNotificationAssetsForPassWithUniqueIdentifier:(id)a3
{
}

- (BOOL)updatePassAssetsWithPassUniqueID:(id)a3
{
  return [(PDUserNotificationIconStore *)self->_iconStore updatePassAssetsWithPassUniqueID:a3];
}

- (id)scheduledNotificationActivitiesForPassUniqueIdentifier:(id)a3 ofType:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(PDUserNotificationManager *)self scheduledNotificationActivitiesOfType:a4];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002C9AB8;
  v11[3] = &unk_10072E838;
  id v12 = v6;
  id v8 = v6;
  id v9 = objc_msgSend(v7, "pk_objectsPassingTest:", v11);

  return v9;
}

- (id)scheduledNotificationActivitiesOfType:(unint64_t)a3
{
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = PDScheduledActivitiesForClient();
  id v6 = (char *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = PDScheduledActivityGetContext();
        if (objc_msgSend(v10, "notificationType", v13) == (id)a3) {
          [v4 addObject:v10];
        }
      }
      id v7 = (char *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = [v4 copy];
  return v11;
}

- (id)scheduledNotificationActivityWithIdentifier:(id)a3
{
  id v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = PDScheduledActivitiesForClient();
  id v5 = (char *)[v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = PDScheduledActivityGetContext();
        objc_msgSend(v9, "notificationIdentifier", v15);
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        id v11 = v3;
        id v12 = v11;
        if (v10 == v11)
        {

          goto LABEL_16;
        }
        if (v3 && v10)
        {
          unsigned __int8 v13 = [v10 isEqualToString:v11];

          if (v13) {
            goto LABEL_16;
          }
        }
        else
        {
        }
      }
      id v6 = (char *)[v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v9 = 0;
LABEL_16:

  return v9;
}

- (void)userNotificationsOfType:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    userNotificationManagerQueue = self->_userNotificationManagerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002C9EFC;
    block[3] = &unk_10072FFE8;
    block[4] = self;
    id v10 = v6;
    unint64_t v11 = a3;
    dispatch_async(userNotificationManagerQueue, block);
  }
}

- (void)userNotificationsForPassUniqueIdentifier:(id)a3 ofType:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    userNotificationManagerQueue = self->_userNotificationManagerQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1002CA004;
    v12[3] = &unk_10073B760;
    v12[4] = self;
    id v14 = v9;
    id v13 = v8;
    unint64_t v15 = a4;
    dispatch_async(userNotificationManagerQueue, v12);
  }
}

- (void)userNotificationWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    userNotificationManagerQueue = self->_userNotificationManagerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002CA100;
    block[3] = &unk_1007315D8;
    block[4] = self;
    id v12 = v7;
    id v11 = v6;
    dispatch_async(userNotificationManagerQueue, block);
  }
}

- (void)updateWalletBadgeCount
{
  id v3 = [(PDUserNotificationManager *)self badgeCountItems];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v26;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += (uint64_t)[*(id *)(*((void *)&v25 + 1) + 8 * i) count];
      }
      id v5 = [v3 countByEnumeratingWithState:&v25 objects:v32 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }
  p_lastLoggedBadgeCountItems = &self->_lastLoggedBadgeCountItems;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)p_lastLoggedBadgeCountItems, v3);
    id v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Badge count items changed:", buf, 2u);
    }

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = v3;
    id v12 = [v11 countByEnumeratingWithState:&v21 objects:v31 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        for (j = 0; j != v13; j = (char *)j + 1)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * (void)j);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v30 = v16;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "\t%@", buf, 0xCu);
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v21 objects:v31 count:16];
      }
      while (v13);
    }
  }
  id v17 = objc_alloc((Class)UISApplicationState);
  id v18 = [v17 initWithBundleIdentifier:PKServiceBundleIdentifier];
  id v19 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v30 = v6;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Updating badge count to %ld", buf, 0xCu);
  }

  id v20 = +[NSNumber numberWithUnsignedInteger:v6];
  [v18 setBadgeValue:v20];
}

- (void)alertNotificationsEnabled:(id)a3
{
}

- (id)pendingNotificationDescriptionsWithIdentifier:(id)a3
{
  id v3 = a3;
  id v40 = objc_alloc_init((Class)NSMutableArray);
  id v4 = objc_alloc_init((Class)NSDateFormatter);
  [v4 setDateStyle:2];
  v39 = v4;
  [v4 setTimeStyle:3];
  id v5 = PDScheduledActivitiesForClient();
  id v6 = objc_alloc_init((Class)NSMutableArray);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v46;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v46 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        if (![v3 length]) {
          goto LABEL_13;
        }
        id v12 = v3;
        id v13 = v11;
        if (v13 == v12)
        {

LABEL_13:
          PDScheduledActivityGetContext();
          id v12 = (id)objc_claimAutoreleasedReturnValue();
          [v6 safelyAddObject:v12];
LABEL_15:

          continue;
        }
        uint64_t v14 = v13;
        if (!v3 || !v13)
        {

          goto LABEL_15;
        }
        unsigned int v15 = [v12 isEqualToString:v13];

        if (v15) {
          goto LABEL_13;
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v8);
  }

  uint64_t v16 = +[NSSortDescriptor sortDescriptorWithKey:@"date" ascending:1];
  v50 = v16;
  id v17 = +[NSArray arrayWithObjects:&v50 count:1];
  [v6 sortUsingDescriptors:v17];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v35 = v6;
  id v18 = [v35 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v37 = *(void *)v42;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        id v21 = v3;
        if (*(void *)v42 != v37) {
          objc_enumerationMutation(v35);
        }
        long long v22 = *(void **)(*((void *)&v41 + 1) + 8 * (void)j);
        long long v23 = [v22 notificationContentWithDataSource:self->_notificationCenter];
        long long v24 = [v22 date];
        long long v25 = [v39 stringFromDate:v24];

        long long v26 = [v23 title];
        long long v27 = [v23 subtitle];
        long long v28 = [v23 body];
        v29 = +[NSString stringWithFormat:@"Notification: %@\nLocal fire date: %@\nTitle: %@\nSubtitle: %@\nBody: %@", v22, v25, v26, v27, v28];

        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          unsigned int v30 = [v22 preventAutomaticDismissal];
          CFStringRef v31 = @"NO";
          if (v30) {
            CFStringRef v31 = @"YES";
          }
          uint64_t v32 = [v29 stringByAppendingFormat:@"\nSticky: %@", v31];

          v29 = (void *)v32;
        }
        id v3 = v21;
        [v40 addObject:v29];
      }
      id v19 = [v35 countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v19);
  }

  id v33 = [v40 copy];
  return v33;
}

- (void)updateDate:(id)a3 forPendingNotificationWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = [(PDUserNotificationManager *)self scheduledNotificationActivityWithIdentifier:a4];
  [v7 setDate:v6];

  [(PDUserNotificationManager *)self insertUserNotification:v7];
}

- (void)updateDeviceAssessmentEducationVisibility
{
  id v3 = [(PDDatabaseManager *)self->_databaseManager passesOfType:1];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002CAAD8;
  v5[3] = &unk_100746378;
  v5[4] = self;
  unsigned int v4 = objc_msgSend(v3, "pk_hasObjectPassingTest:", v5);
  if (self->_isDeviceAssessmentEducationVisible != v4)
  {
    self->_isDeviceAssessmentEducationVisible = v4;
    [(PDUserNotificationManager *)self updateWalletBadgeCount];
  }
}

- (void)removeNotificationApplicationMessageWithIdentifier:(id)a3
{
  if (a3) {
    -[PKApplicationMessageSink unregisterMessageForIdentifier:](self->_applicationMessageSink, "unregisterMessageForIdentifier:");
  }
}

- (BOOL)hasNotificationApplicationMessageWithIdentifier:(id)a3
{
  if (a3) {
    return -[PKApplicationMessageSink hasMessageWithIdentifier:](self->_applicationMessageSink, "hasMessageWithIdentifier:");
  }
  else {
    return 0;
  }
}

- (void)updateNotificationApplicationMessageWithNotification:(id)a3
{
  if (a3)
  {
    notificationCenter = self->_notificationCenter;
    id v5 = a3;
    [(PDUserNotificationCenter *)notificationCenter updateApplicationMessageContentForNotification:v5];
    id v8 = objc_alloc_init((Class)PKApplicationMessageRequest);
    objc_msgSend(v8, "setBadge:", objc_msgSend(v5, "applicationMessageBadge"));
    applicationMessageSink = self->_applicationMessageSink;
    id v7 = [v5 notificationIdentifier];

    [(PKApplicationMessageSink *)applicationMessageSink updateMessageForIdentifier:v7 withRequest:v8];
  }
}

- (void)_removeScheduledActivitiesForPassUniqueIdentifier:(id)a3
{
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unsigned int v4 = PDScheduledActivitiesForClient();
  id v5 = (char *)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = PDScheduledActivityGetContext();
        id v10 = objc_msgSend(v9, "passUniqueIdentifier", v12);
        unsigned int v11 = [v10 isEqualToString:v3];

        if (v11) {
          PDScheduledActivityRemove();
        }

        ++v8;
      }
      while (v6 != v8);
      id v6 = (char *)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)_removeScheduledActivitiesOfType:(unint64_t)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unsigned int v4 = PDScheduledActivitiesForClient();
  id v5 = (char *)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = PDScheduledActivityGetContext();
        if (objc_msgSend(v9, "notificationType", v10) == (id)a3) {
          PDScheduledActivityRemove();
        }

        ++v8;
      }
      while (v6 != v8);
      id v6 = (char *)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_removeScheduledActivitiesForPassUniqueIdentifier:(id)a3 ofType:(unint64_t)a4
{
  id v13 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = PDScheduledActivitiesForClient();
  id v6 = (char *)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = PDScheduledActivityGetContext();
        if ([v10 notificationType] == (id)a4)
        {
          long long v11 = [v10 passUniqueIdentifier];
          unsigned int v12 = [v11 isEqualToString:v13];

          if (v12) {
            PDScheduledActivityRemove();
          }
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = (char *)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)_archiveUserNotifications
{
  if (!dispatch_semaphore_wait((dispatch_semaphore_t)self->_archiveSemaphore, 0))
  {
    dispatch_time_t v3 = dispatch_time(0, 2000000000);
    unsigned int v4 = (void *)PDOSTransactionCreate("PDUserNotificationManager");
    userNotificationManagerQueue = self->_userNotificationManagerQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002CB090;
    v7[3] = &unk_10072E198;
    id v8 = v4;
    uint64_t v9 = self;
    id v6 = v4;
    dispatch_after(v3, userNotificationManagerQueue, v7);
  }
}

- (BOOL)_notificationRequirementsAreSatisfied:(id)a3
{
  id v4 = a3;
  id v5 = [v4 insertionRequirements];
  if (!v5)
  {
    BOOL v9 = 1;
    goto LABEL_40;
  }
  char v6 = (char)v5;
  uint64_t v7 = +[NSMutableArray array];
  if ((v6 & 2) != 0
    && ![(PDDatabaseManager *)self->_databaseManager passExistsWithPassType:-1])
  {
    [v7 addObject:@"'Passes Exist'"];
    int v8 = 0;
    if ((v6 & 4) == 0) {
      goto LABEL_10;
    }
  }
  else
  {
    int v8 = 1;
    if ((v6 & 4) == 0) {
      goto LABEL_10;
    }
  }
  unsigned int v10 = ![(PDDatabaseManager *)self->_databaseManager passExistsWithPassType:-1];
  v8 &= v10;
  if ((v10 & 1) == 0) {
    [v7 addObject:@"'No Passes Exist'"];
  }
LABEL_10:
  if ((v6 & 8) != 0)
  {
    unsigned int v11 = [(PDDatabaseManager *)self->_databaseManager passExistsWithPassType:1];
    int v8 = v8 ? v11 : 0;
    if ((v11 & 1) == 0) {
      [v7 addObject:@"'Payment Passes Exist'"];
    }
  }
  if ((v6 & 0x10) != 0)
  {
    unsigned int v12 = ![(PDDatabaseManager *)self->_databaseManager passExistsWithPassType:1];
    int v8 = v8 ? v12 : 0;
    if ((v12 & 1) == 0) {
      [v7 addObject:@"'No Payment Passes Exist'"];
    }
  }
  if ((v6 & 0x20) != 0 && (PKHandsOnDemoModeEnabled() & 1) == 0 && !PKUIOnlyDemoModeEnabled())
  {
    int v13 = PKStoreDemoModeEnabled();
    int v8 = v8 ? v13 : 0;
    if ((v13 & 1) == 0) {
      [v7 addObject:@"Demo Mode Active'"];
    }
  }
  if ((v6 & 0x40) == 0) {
    goto LABEL_35;
  }
  if (PKHandsOnDemoModeEnabled() & 1) != 0 || (PKUIOnlyDemoModeEnabled())
  {
    int v8 = 0;
  }
  else
  {
    int v21 = PKStoreDemoModeEnabled() ^ 1;
    if (v8) {
      int v8 = v21;
    }
    else {
      int v8 = 0;
    }
    if (v21) {
      goto LABEL_35;
    }
  }
  [v7 addObject:@"'No Demo Mode Active'"];
LABEL_35:
  if (!v8)
  {
    long long v14 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      long long v15 = [v7 componentsJoinedByString:@", "];
      int v22 = 138412546;
      long long v23 = v15;
      __int16 v24 = 2112;
      id v25 = v4;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Insertion Requirements (%@) failed for User Notification: %@", (uint8_t *)&v22, 0x16u);
    }
  }

  BOOL v9 = v8 != 0;
LABEL_40:
  long long v16 = [v4 passUniqueIdentifier];
  if (v16 && [(PDDatabaseManager *)self->_databaseManager passExistsWithUniqueID:v16])
  {
    long long v17 = [(PDDatabaseManager *)self->_databaseManager passAnnotationsForPassUniqueIdentifier:v16];
    id v18 = v17;
    if (v17 && [v17 sortingState] == (id)1)
    {
      id v19 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Attempting to insert User Notification for pass that is in expired section, force fail notification insertion requirements", (uint8_t *)&v22, 2u);
      }

      BOOL v9 = 0;
    }
  }
  return v9;
}

- (id)badgeCountItems
{
  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x3032000000;
  unsigned int v11 = sub_100020AEC;
  unsigned int v12 = sub_100021068;
  id v13 = +[NSMutableArray array];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002CB610;
  v7[3] = &unk_10073BB48;
  void v7[4] = self;
  void v7[5] = &v8;
  dispatch_time_t v3 = objc_retainBlock(v7);
  [(PDDatabaseManager *)self->_databaseManager accessDatabaseUsingBlock:v3];
  [(id)v9[5] sortUsingComparator:&stru_1007463B8];
  id v5 = [(id)v9[5] copy];

  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)_badgeCountItemsForPayLaterWithAccount:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4
    && (databaseManager = self->_databaseManager,
        [v4 associatedPassUniqueID],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        LODWORD(databaseManager) = [(PDDatabaseManager *)databaseManager passExistsWithUniqueID:v7], v7, databaseManager))
  {
    uint64_t v20 = 0;
    int v21 = &v20;
    uint64_t v22 = 0x3032000000;
    long long v23 = sub_100020AEC;
    __int16 v24 = sub_100021068;
    id v25 = +[NSMutableArray array];
    if ([v5 stateReason] == (id)5)
    {
      uint64_t v8 = (void *)v21[5];
      id v9 = objc_alloc((Class)PKBadgeCountItem);
      uint64_t v10 = [v5 accountIdentifier];
      id v11 = [v9 initWithTitle:@"Pay Later Account fraud suspected" subtitle:v10 count:1];
      [v8 addObject:v11];
    }
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1002CC140;
    v19[3] = &unk_1007463E0;
    v19[4] = self;
    v19[5] = &v20;
    unsigned int v12 = objc_retainBlock(v19);
    ((void (*)(void *, uint64_t, void))v12[2])(v12, 2, PKSharedCachePayLaterPlanDisputeEvidenceRequiredPrefix);
    ((void (*)(void *, uint64_t, void))v12[2])(v12, 5, PKSharedCachePayLaterPlanDisputeSplitPrefix);
    ((void (*)(void *, uint64_t, void))v12[2])(v12, 4, PKSharedCachePayLaterPlanDisputeRejectedPrefix);
    id v13 = [(PDDatabaseManager *)self->_databaseManager financingPlanIdentifiersThatContainInstallmentWithStatus:4];
    id v14 = [v13 count];

    long long v15 = (void *)v21[5];
    id v16 = [objc_alloc((Class)PKBadgeCountItem) initWithTitle:@"Pay Later installments with status" subtitle:0 count:v14];
    [v15 addObject:v16];

    id v17 = [(id)v21[5] copy];
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    id v17 = &__NSArray0__struct;
  }

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLoggedBadgeCountItems, 0);
  objc_storeStrong((id *)&self->_userNotificationManagerQueue, 0);
  objc_storeStrong((id *)&self->_archiveSemaphore, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_applicationMessageSink, 0);
  objc_storeStrong((id *)&self->_applicationMessageManager, 0);
  objc_storeStrong((id *)&self->_paymentWebServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_paymentWebService, 0);
  objc_storeStrong((id *)&self->_iconStore, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_archiveFileURL, 0);
}

@end