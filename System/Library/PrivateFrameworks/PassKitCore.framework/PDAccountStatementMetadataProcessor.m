@interface PDAccountStatementMetadataProcessor
- (BOOL)_queue_isAccountEligible:(id)a3;
- (PDAccountStatementMetadataProcessor)initWithDatabaseManager:(id)a3 accountManager:(id)a4 cloudStoreNotificationCoordinator:(id)a5;
- (id)_queue_eligibleAccounts;
- (void)_addRequestToProcessQueue:(id)a3;
- (void)_executeNextRequestIfPossible;
- (void)_executeNextStatementMetadataProcessingRequest:(id)a3 completion:(id)a4;
- (void)_queue_updateScheduledActivityIfNeccessary;
- (void)accountManager:(id)a3 didAddAccount:(id)a4;
- (void)accountManager:(id)a3 didRemoveAccount:(id)a4;
- (void)accountManager:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5;
- (void)accountManager:(id)a3 statementsChangedForAccountIdentifier:(id)a4;
- (void)passAdded:(id)a3;
- (void)passRemoved:(id)a3;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)triggerStatementMetadataProcessingForAccountIdentifier:(id)a3 statementIdentifier:(id)a4 completion:(id)a5;
@end

@implementation PDAccountStatementMetadataProcessor

- (PDAccountStatementMetadataProcessor)initWithDatabaseManager:(id)a3 accountManager:(id)a4 cloudStoreNotificationCoordinator:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)PDAccountStatementMetadataProcessor;
  v12 = [(PDAccountStatementMetadataProcessor *)&v25 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_databaseManager, a3);
    objc_storeStrong((id *)&v13->_accountManager, a4);
    objc_storeStrong((id *)&v13->_cloudStoreNotificationCoordinator, a5);
    [(PDAccountManager *)v13->_accountManager registerObserver:v13];
    v14 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    requestList = v13->_requestList;
    v13->_requestList = v14;

    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.passd.PDAccountStatementMetadataProcessor.work", v16);
    workQueue = v13->_workQueue;
    v13->_workQueue = (OS_dispatch_queue *)v17;

    dispatch_queue_t v19 = dispatch_queue_create("com.apple.passd.PDAccountStatementMetadataProcessor.reply", v16);
    replyQueue = v13->_replyQueue;
    v13->_replyQueue = (OS_dispatch_queue *)v19;

    v13->_requestLock._os_unfair_lock_opaque = 0;
    v21 = v13->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005D4A0;
    block[3] = &unk_10072E1E8;
    v24 = v13;
    dispatch_async(v21, block);
  }
  return v13;
}

- (void)triggerStatementMetadataProcessingForAccountIdentifier:(id)a3 statementIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[PDAccountStatementMetadataProcessorRequest alloc] initWithAccountIdentifier:v10 statementIdentifier:v9 reason:1 completion:v8];

  [(PDAccountStatementMetadataProcessor *)self _addRequestToProcessQueue:v11];
}

- (void)accountManager:(id)a3 statementsChangedForAccountIdentifier:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    v6 = [[PDAccountStatementMetadataProcessorRequest alloc] initWithAccountIdentifier:v5 statementIdentifier:0 reason:0 completion:0];

    [(PDAccountStatementMetadataProcessor *)self _addRequestToProcessQueue:v6];
  }
}

- (void)accountManager:(id)a3 didAddAccount:(id)a4
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005D654;
  block[3] = &unk_10072E1E8;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)accountManager:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005D6D0;
  block[3] = &unk_10072E1E8;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)accountManager:(id)a3 didRemoveAccount:(id)a4
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005D74C;
  block[3] = &unk_10072E1E8;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)passAdded:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005D7EC;
  v7[3] = &unk_10072E198;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)passRemoved:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005D914;
  v7[3] = &unk_10072E198;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)_executeNextStatementMetadataProcessingRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005DA68;
  block[3] = &unk_10072E9D8;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_runningScheduledActivity)
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not running AccountStatementMetadataActivity task since one is already running", buf, 2u);
    }
LABEL_19:

    goto LABEL_20;
  }
  id v9 = (__CFString *)v6;
  if (v9 == @"AccountStatementMetadataActivity"
    || (id v10 = v9) != 0
    && (unsigned int v11 = [(__CFString *)v9 isEqualToString:@"AccountStatementMetadataActivity"], v10, v11))
  {
    id v26 = v7;
    id v27 = v6;
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Running AccountStatementMetadataActivity task", buf, 2u);
    }

    self->_runningScheduledActivity = 1;
    v13 = [(PDAccountStatementMetadataProcessor *)self _queue_eligibleAccounts];
    id v14 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v8 = v13;
    id v15 = [v8 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v34;
      obj = v8;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v34 != v17) {
            objc_enumerationMutation(obj);
          }
          dispatch_queue_t v19 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          objc_msgSend(v19, "type", v26, v27);
          v20 = PKAccountTypeToString();
          v21 = [v19 accountIdentifier];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v38 = v21;
            __int16 v39 = 2112;
            v40 = v20;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Running AccountStatementMetadataActivity task for account identifier %@, type %@", buf, 0x16u);
          }

          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472;
          v30[2] = sub_10005FE60;
          v30[3] = &unk_100730C60;
          v30[4] = v19;
          v30[5] = self;
          id v31 = v21;
          id v32 = v20;
          id v22 = v20;
          id v23 = v21;
          [v14 addOperation:v30];
        }
        id v8 = obj;
        id v16 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v16);
    }

    v24 = +[NSNull null];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100060134;
    v29[3] = &unk_100730C88;
    v29[4] = self;
    id v25 = [v14 evaluateWithInput:v24 completion:v29];

    id v7 = v26;
    id v6 = v27;
    goto LABEL_19;
  }
LABEL_20:
}

- (void)_addRequestToProcessQueue:(id)a3
{
  id v4 = (NSMutableOrderedSet *)a3;
  if (v4)
  {
    id v5 = v4;
    p_super = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      dispatch_queue_t v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "Statement metadata process request incoming %@", buf, 0xCu);
    }

    os_unfair_lock_lock(&self->_requestLock);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = self->_requestList;
    id v8 = [(NSMutableOrderedSet *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(NSMutableOrderedSet **)(*((void *)&v13 + 1) + 8 * i);
          if (-[NSMutableOrderedSet coalesceWithRequest:](v12, "coalesceWithRequest:", v5, (void)v13))
          {
            if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              dispatch_queue_t v19 = v12;
              _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "Statement metadata process request coalesced onto %@", buf, 0xCu);
            }

            p_super = &v5->super.super;
            goto LABEL_18;
          }
        }
        id v9 = [(NSMutableOrderedSet *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    [(NSMutableOrderedSet *)self->_requestList addObject:v5];
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      dispatch_queue_t v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "Statement metadata process request queued %@", buf, 0xCu);
    }
    id v7 = v5;
LABEL_18:

    os_unfair_lock_unlock(&self->_requestLock);
    [(PDAccountStatementMetadataProcessor *)self _executeNextRequestIfPossible];
  }
}

- (void)_executeNextRequestIfPossible
{
  p_requestLock = &self->_requestLock;
  os_unfair_lock_lock(&self->_requestLock);
  id v4 = self->_currentRequest;
  if (v4
    || ([(NSMutableOrderedSet *)self->_requestList firstObject],
        (uint64_t v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    os_unfair_lock_unlock(p_requestLock);
  }
  else
  {
    id v6 = (void *)v5;
    [(NSMutableOrderedSet *)self->_requestList removeObjectAtIndex:0];
    id v7 = v6;
    objc_storeStrong((id *)&self->_currentRequest, v6);
    os_unfair_lock_unlock(p_requestLock);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10006048C;
    v8[3] = &unk_100730CB0;
    v8[4] = self;
    id v9 = v7;
    id v4 = (PDAccountStatementMetadataProcessorRequest *)v7;
    [(PDAccountStatementMetadataProcessor *)self _executeNextStatementMetadataProcessingRequest:v4 completion:v8];
  }
}

- (id)_queue_eligibleAccounts
{
  v3 = [(PDDatabaseManager *)self->_databaseManager accounts];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10006067C;
  v6[3] = &unk_100730CD8;
  v6[4] = self;
  id v4 = [v3 objectsPassingTest:v6];

  return v4;
}

- (BOOL)_queue_isAccountEligible:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 accountIdentifier];
  id v6 = (char *)[v4 type];
  id v7 = PKAccountTypeToString();
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    long long v15 = v5;
    __int16 v16 = 2112;
    uint64_t v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Checking if accountID %@, type %@ is eligible for supportsStatementMetadata.", (uint8_t *)&v14, 0x16u);
  }

  if ([v4 supportsStatementMetadata])
  {
    [v4 state];
    if (PKAccountStateIsTerminal())
    {
      BOOL v9 = 0;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412546;
        long long v15 = v5;
        __int16 v16 = 2112;
        uint64_t v17 = v7;
        uint64_t v10 = "Account identifier: %@, type: %@, is not eligible for supportsStatementMetadata since state is terminal.";
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, 0x16u);
        BOOL v9 = 0;
      }
    }
    else if ((unint64_t)(v6 - 2) >= 2 && v6)
    {
      if (v6 == (char *)1)
      {
        databaseManager = self->_databaseManager;
        id v12 = [v4 associatedPassUniqueID];
        LOBYTE(databaseManager) = [(PDDatabaseManager *)databaseManager passExistsWithUniqueID:v12];

        if ((databaseManager & 1) == 0)
        {
          BOOL v9 = 0;
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_19;
          }
          int v14 = 138412546;
          long long v15 = v5;
          __int16 v16 = 2112;
          uint64_t v17 = v7;
          uint64_t v10 = "Account identifier: %@, type: %@, is not eligible for supportsStatementMetadata since there is no account on device.";
          goto LABEL_18;
        }
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412546;
        long long v15 = v5;
        __int16 v16 = 2112;
        uint64_t v17 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Account identifier: %@, type: %@, is eligible for supportsStatementMetadata.", (uint8_t *)&v14, 0x16u);
      }
      BOOL v9 = 1;
    }
    else
    {
      BOOL v9 = 0;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412546;
        long long v15 = v5;
        __int16 v16 = 2112;
        uint64_t v17 = v7;
        uint64_t v10 = "Account identifier: %@, type: %@, is not eligible for supportsStatementMetadata since the account type is not supported.";
        goto LABEL_18;
      }
    }
  }
  else
  {
    BOOL v9 = 0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      long long v15 = v5;
      __int16 v16 = 2112;
      uint64_t v17 = v7;
      uint64_t v10 = "Account identifier: %@, type: %@, is not eligible for supportsStatementMetadata since its not a supported feature.";
      goto LABEL_18;
    }
  }
LABEL_19:

  return v9;
}

- (void)_queue_updateScheduledActivityIfNeccessary
{
  v2 = [(PDAccountStatementMetadataProcessor *)self _queue_eligibleAccounts];
  id v3 = [v2 count];

  if (v3)
  {
    if (PDScheduledActivityExists())
    {
      id v4 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        uint64_t v5 = "Not scheduling AccountStatementMetadataActivity since one already exists";
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v11, 2u);
      }
    }
    else
    {
      uint64_t v6 = PKRandomIntegerInRange();
      uint64_t v7 = PKRandomIntegerInRange();
      id v8 = +[NSDate date];
      id v4 = [v8 dateByAddingTimeInterval:(double)v7 * 60.0 + (double)v6 * 3600.0];

      PDScheduledActivityClientRegister();
      BOOL v9 = +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:v4];
      [v9 setRepeating:0];
      [v9 setRequireNetworkConnectivity:1];
      [v9 setRequireScreenSleep:1];
      [v9 setRequireMainsPower:1];
      PDScheduledActivityRegister();
      uint64_t v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        id v12 = v4;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Scheduled AccountStatementMetadataActivity with start time %@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  else
  {
    PDScheduledActivityRemove();
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      uint64_t v5 = "Not scheduling AccountStatementMetadataActivity since there are no applicable accounts on device";
      goto LABEL_7;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_requestList, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_cloudStoreNotificationCoordinator, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
}

@end