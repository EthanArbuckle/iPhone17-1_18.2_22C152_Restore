@interface PDSharingChannelMonitor
- (BOOL)_canEndpointBePolledOrCleanUpEndpoint:(id)a3;
- (BOOL)disabled;
- (PDSharingChannelMonitor)init;
- (PDSharingChannelMonitor)initWithQueue:(id)a3 webServiceCoordinator:(id)a4 databaseManager:(id)a5 pushNotificationManager:(id)a6 delegate:(id)a7;
- (id)_checkEndpointsToBePolledOrDetermineNextPollDate:(id *)a3;
- (id)pushNotificationTopics;
- (void)_processOutstandingEndpointsAndMessagesWithCompletion:(id)a3;
- (void)_updateEndpointHasOutstandingMessages:(id)a3 hasOutstandingMessages:(BOOL)a4 didCheckForNewMessages:(BOOL)a5;
- (void)checkForNewSharingMessagesWithShouldCheckAllEndpoint:(BOOL)a3 completion:(id)a4;
- (void)dealloc;
- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)scheduleNextCheckIfNeeded;
- (void)setDisabled:(BOOL)a3;
- (void)start;
@end

@implementation PDSharingChannelMonitor

- (PDSharingChannelMonitor)init
{
  return 0;
}

- (PDSharingChannelMonitor)initWithQueue:(id)a3 webServiceCoordinator:(id)a4 databaseManager:(id)a5 pushNotificationManager:(id)a6 delegate:(id)a7
{
  id v22 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)PDSharingChannelMonitor;
  v17 = [(PDSharingChannelMonitor *)&v23 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_queue, a3);
    uint64_t v19 = PDDefaultQueue();
    replyQueue = v18->_replyQueue;
    v18->_replyQueue = (OS_dispatch_queue *)v19;

    objc_storeStrong((id *)&v18->_webServiceCoordinator, a4);
    objc_storeStrong((id *)&v18->_databaseManager, a5);
    objc_storeStrong((id *)&v18->_pushNotificationManager, a6);
    objc_storeWeak((id *)&v18->_delegate, v16);
    [(PDPushNotificationManager *)v18->_pushNotificationManager registerConsumer:v18];
    PDScheduledActivityClientRegister();
  }

  return v18;
}

- (void)dealloc
{
  [(PDPushNotificationManager *)self->_pushNotificationManager unregisterConsumer:self];
  v3.receiver = self;
  v3.super_class = (Class)PDSharingChannelMonitor;
  [(PDSharingChannelMonitor *)&v3 dealloc];
}

- (void)start
{
}

- (void)scheduleNextCheckIfNeeded
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10042A778;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)checkForNewSharingMessagesWithShouldCheckAllEndpoint:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10042A9CC;
  block[3] = &unk_10073A378;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (id)_checkEndpointsToBePolledOrDetermineNextPollDate:(id *)a3
{
  if (self->_disabled)
  {
    objc_super v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PDSharingManager: Ignoring check endpoints because disabled", buf, 2u);
    }
    id v4 = 0;
    goto LABEL_29;
  }
  objc_super v3 = +[NSDate now];
  id v22 = objc_alloc_init((Class)NSMutableArray);
  id v6 = [(PDDatabaseManager *)self->_databaseManager sharingEndpointsOfType:1];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (!v7)
  {
    id v9 = 0;
    goto LABEL_24;
  }
  id v8 = v7;
  id v9 = 0;
  uint64_t v10 = *(void *)v24;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v24 != v10) {
        objc_enumerationMutation(v6);
      }
      v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      if ([(PDSharingChannelMonitor *)self _canEndpointBePolledOrCleanUpEndpoint:v12])
      {
        unsigned int v13 = [v12 doesRemoteMailboxSupportPushNotifications];
        id v14 = [v12 pollingBackoffCounter];
        if (v13) {
          uint64_t v15 = PDSharingChannelEndpointPollingBackoffDuration();
        }
        else {
          uint64_t v15 = PDAggressiveSharingChannelEndpointPollingBackoffDuration((unint64_t)v14);
        }
        uint64_t v16 = v15;
        v17 = [v12 updatedAt];
        v18 = [v17 dateByAddingTimeInterval:(double)v16];

        if ([v18 compare:v3] == (id)-1)
        {
          [v22 addObject:v12];
          if (!v9) {
            goto LABEL_18;
          }
LABEL_16:
          uint64_t v19 = [v9 earlierDate:v18];

          id v9 = (id)v19;
        }
        else
        {
          if (v9) {
            goto LABEL_16;
          }
LABEL_18:
          id v9 = v18;
        }

        continue;
      }
    }
    id v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  }
  while (v8);
LABEL_24:
  if ([v22 count])
  {
    id v4 = [v22 copy];
  }
  else
  {
    id v4 = 0;
    if (a3) {
      *a3 = v9;
    }
  }

LABEL_29:
  return v4;
}

- (void)_processOutstandingEndpointsAndMessagesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = [(PDDatabaseManager *)self->_databaseManager sharingEndpointsWithOutstandingMessages];
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v10);
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_10042B320;
        v19[3] = &unk_100731CB8;
        v19[4] = self;
        v19[5] = v11;
        [v5 addOperation:v19];
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10042B778;
  v18[3] = &unk_10072E5C0;
  v18[4] = self;
  [v5 addOperation:v18];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10042BA94;
  v17[3] = &unk_10072E5C0;
  v17[4] = self;
  [v5 addOperation:v17];
  v12 = +[NSNull null];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10042BB8C;
  v15[3] = &unk_100747FA8;
  v15[4] = self;
  id v16 = v4;
  id v13 = v4;
  id v14 = [v5 evaluateWithInput:v12 completion:v15];
}

- (id)pushNotificationTopics
{
  id v2 = objc_alloc((Class)NSSet);
  objc_super v3 = PKSharingRelayServerPushTopics();
  id v4 = [v2 initWithArray:v3];

  return v4;
}

- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4
{
  id v5 = a3;
  if (PKSharingDisableStatefulPushNotifications())
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = 0;
      id v7 = "PDSharingManager: Ignoring push notification because of debug override";
      id v8 = (uint8_t *)&v12;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (self->_disabled)
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = 0;
      id v7 = "PDSharingManager: Ignoring push notification because of disabled";
      id v8 = (uint8_t *)&v11;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  uint64_t v9 = PKSharingRelayServerPushTopics();
  unsigned int v10 = [v9 containsObject:v5];

  if (v10) {
    [(PDSharingChannelMonitor *)self checkForNewSharingMessagesWithShouldCheckAllEndpoint:1 completion:&stru_100750A28];
  }
LABEL_9:
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
}

- (BOOL)_canEndpointBePolledOrCleanUpEndpoint:(id)a3
{
  id v4 = a3;
  if ([v4 channelType] == (id)1)
  {
    id v5 = v4;
    id v6 = [v5 timeToLive];
    if (v6) {
      unint64_t v7 = (unint64_t)v6;
    }
    else {
      unint64_t v7 = 604800;
    }
    id v8 = [v5 createdAt];
    uint64_t v9 = [v8 dateByAddingTimeInterval:(double)v7];
    [v9 timeIntervalSinceNow];
    double v11 = v10;

    id v12 = [v5 provisioningType];
    if ((unint64_t)[v5 pollingBackoffCounter] < 5)
    {
      char v15 = 0;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      unsigned __int8 v14 = [WeakRetained canHandleOutstandingMessagesOnEndpoint:v5];

      char v15 = v14 ^ 1;
    }
    if (v11 <= 0.0
      || (v15 & 1) != 0
      || (PDSharingRelayServerEndpointStatusIsActive((unint64_t)[v5 mailboxStatus]) & 1) == 0)
    {
      id v18 = objc_loadWeakRetained((id *)&self->_delegate);
      [v18 endpointWasRemotelyTerminated:v5];

      char v17 = 0;
    }
    else
    {
      char v17 = 1;
    }
    if (v12 == (id)2) {
      BOOL v16 = v17;
    }
    else {
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (void)_updateEndpointHasOutstandingMessages:(id)a3 hasOutstandingMessages:(BOOL)a4 didCheckForNewMessages:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v11 = a3;
  BOOL v8 = [v11 channelType] == (id)1;
  uint64_t v9 = v11;
  if (v8)
  {
    id v10 = v11;
    [v10 setHasOutstandingMessages:v6];
    if (v5) {
      objc_msgSend(v10, "setPollingBackoffCounter:", (char *)objc_msgSend(v10, "pollingBackoffCounter") + 1);
    }
    [(PDDatabaseManager *)self->_databaseManager insertSharingEndpoint:v10];

    uint64_t v9 = v11;
  }
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pushNotificationManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_webServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end