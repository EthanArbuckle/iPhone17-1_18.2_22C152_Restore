@interface STRequestManager
+ (BOOL)_bundleIdentifiersContainCommunicationBundleIdentifier:(id)a3;
+ (void)_performDeviceManagementRequest:(id)a3;
- (NSString)currentBlueprintHash;
- (NSString)organizationIdentifier;
- (STDebouncer)changeNotificationDebouncer;
- (STPersistenceControllerProtocol)persistenceController;
- (STRequestManager)initWithOrganizationIdentifier:(id)a3 persistenceController:(id)a4;
- (STRequestManagerDelegate)delegate;
- (id)_expiredNotificationTimesForPredicates:(id)a3;
- (id)operationToSendStatusUpdate:(id)a3;
- (void)_processBlueprintChanges;
- (void)_processDeclarationsPayload:(id)a3;
- (void)_processStatusPayload:(id)a3;
- (void)_updateWithImageGenerationThenPerformRequest:(id)a3 requestPayload:(id)a4;
- (void)debouncer:(id)a3 didDebounce:(id)a4;
- (void)installFromRequest:(id)a3;
- (void)invalidate;
- (void)persistBlueprintsFromBlueprintPayload:(id)a3 withCompletion:(id)a4;
- (void)processBlueprintChanges;
- (void)setCurrentBlueprintHash:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation STRequestManager

- (STRequestManager)initWithOrganizationIdentifier:(id)a3 persistenceController:(id)a4
{
  v6 = (STPersistenceControllerProtocol *)a4;
  v16.receiver = self;
  v16.super_class = (Class)STRequestManager;
  id v7 = a3;
  v8 = [(STRequestManager *)&v16 init];
  v9 = (NSString *)objc_msgSend(v7, "copy", v16.receiver, v16.super_class);

  organizationIdentifier = v8->_organizationIdentifier;
  v8->_organizationIdentifier = v9;

  persistenceController = v8->_persistenceController;
  v8->_persistenceController = v6;
  v12 = v6;

  v13 = (STDebouncer *)[objc_alloc((Class)STDebouncer) initWithMinCoalescenceInterval:2.0 maxCoalescenceInterval:10.0];
  changeNotificationDebouncer = v8->_changeNotificationDebouncer;
  v8->_changeNotificationDebouncer = v13;

  [(STDebouncer *)v8->_changeNotificationDebouncer setDelegate:v8];
  return v8;
}

- (void)invalidate
{
  v3 = +[STLog requestManager];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ : Invalidating", (uint8_t *)&v4, 0xCu);
  }
}

- (void)processBlueprintChanges
{
  v3 = +[STLog requestManager];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Process blueprint changes", v5, 2u);
  }

  int v4 = [(STRequestManager *)self changeNotificationDebouncer];
  [v4 bounce:0];
}

- (void)debouncer:(id)a3 didDebounce:(id)a4
{
  id v5 = a3;
  id v6 = [(STRequestManager *)self changeNotificationDebouncer];

  if (v6 == v5)
  {
    [(STRequestManager *)self _processBlueprintChanges];
  }
}

- (void)_processBlueprintChanges
{
  v3 = +[STLog requestManager];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Process installed blueprints starting", buf, 2u);
  }

  int v4 = [(STRequestManager *)self persistenceController];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10006EC3C;
  v5[3] = &unk_1002FDF30;
  v5[4] = self;
  +[STProcessBlueprintChanges processBlueprintsChangesWithPersistenceController:v4 completionHandler:v5];
}

- (void)persistBlueprintsFromBlueprintPayload:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[STLog requestManager];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Persist blueprint payload: %@", buf, 0xCu);
  }

  v9 = [(STRequestManager *)self persistenceController];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10006EED4;
  v11[3] = &unk_1002FDF58;
  id v12 = v7;
  id v10 = v7;
  +[STPersistBlueprints persistBlueprintsPayload:v6 persistenceController:v9 completionHandler:v11];
}

- (void)installFromRequest:(id)a3
{
  id v4 = a3;
  id v5 = +[STLog requestManager];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Install requests", buf, 2u);
  }

  id v6 = [v4 payloadType];
  if (![v6 isEqualToString:@"Status"])
  {
    if ([v6 isEqualToString:@"Events"])
    {
      id v7 = +[STLog requestManager];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received event payload, ignoring", v8, 2u);
      }
    }
    else
    {
      if ([v6 isEqualToString:@"Set"])
      {
        [(STRequestManager *)self _processDeclarationsPayload:v4];
        goto LABEL_13;
      }
      id v7 = +[STLog requestManager];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100264718();
      }
    }

    goto LABEL_13;
  }
  [(STRequestManager *)self _processStatusPayload:v4];
LABEL_13:
}

- (void)_processStatusPayload:(id)a3
{
  id v4 = a3;
  id v5 = [(STRequestManager *)self persistenceController];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006F230;
  v7[3] = &unk_1002FB788;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  [v5 performBackgroundTask:v7];
}

+ (BOOL)_bundleIdentifiersContainCommunicationBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[DMFCommunicationPolicyMonitor communicationBundleIdentifiers];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(v4, "containsObject:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (void)_processDeclarationsPayload:(id)a3
{
  id v4 = a3;
  id v5 = [(STRequestManager *)self organizationIdentifier];
  id v6 = [v4 deviceManagementRequestForOrganizationID:v5];

  if (v6)
  {
    uint64_t v7 = [v4 underlyingPayload];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      if (_os_feature_enabled_impl() && _os_feature_enabled_impl())
      {
        [(STRequestManager *)self _updateWithImageGenerationThenPerformRequest:v6 requestPayload:v4];
        goto LABEL_15;
      }
      long long v10 = +[STLog checkpoint];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        long long v11 = objc_opt_class();
        id v12 = v11;
        long long v13 = [v4 UUID];
        id v14 = [v4 underlyingPayload];
        v15 = [v14 declarations];
        int v17 = 138543875;
        v18 = v11;
        __int16 v19 = 2114;
        v20 = v13;
        __int16 v21 = 2113;
        v22 = v15;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}@: Installing Declarations: %{public}@ %{private}@", (uint8_t *)&v17, 0x20u);
      }
    }
    objc_super v16 = +[STLog requestManager];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_1002648F4();
    }

    [(id)objc_opt_class() _performDeviceManagementRequest:v6];
  }
  else
  {
    v9 = +[STLog requestManager];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100264888();
    }
  }
LABEL_15:
}

- (void)_updateWithImageGenerationThenPerformRequest:(id)a3 requestPayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 underlyingPayload];
  v9 = +[STLog checkpoint];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    long long v10 = objc_opt_class();
    id v11 = v10;
    id v12 = [v7 UUID];
    long long v13 = [v8 declarations];
    *(_DWORD *)buf = 138543875;
    v24 = v10;
    __int16 v25 = 2114;
    v26 = v12;
    __int16 v27 = 2113;
    v28 = v13;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Original declarations: %{public}@ %{private}@", buf, 0x20u);
  }
  id v14 = [(STRequestManager *)self persistenceController];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100070A08;
  v18[3] = &unk_1002FC670;
  id v19 = v6;
  id v20 = v7;
  __int16 v21 = self;
  id v22 = v8;
  id v15 = v8;
  id v16 = v7;
  id v17 = v6;
  [v14 performBackgroundTask:v18];
}

+ (void)_performDeviceManagementRequest:(id)a3
{
  id v4 = a3;
  id v5 = +[DMFConnection systemConnection];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100070F28;
  v6[3] = &unk_1002FDFC8;
  v6[4] = a1;
  [v5 performRequest:v4 completion:v6];
}

- (id)_expiredNotificationTimesForPredicates:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v18 = *(void *)v21;
    uint64_t v7 = DMFDeclarationStatePredicatePayloadStatusKey;
    uint64_t v8 = DMFDeclarationStatePredicatePayloadStatusExpiredNotificationTimesKey;
    uint64_t v9 = DMFDeclarationStatePredicateSubPredicatesKey;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v12 = [v11 objectForKeyedSubscript:v7];
        long long v13 = [v12 objectForKeyedSubscript:v8];
        [v4 addObjectsFromArray:v13];
        id v14 = [v11 objectForKeyedSubscript:v9];
        id v15 = [(STRequestManager *)self _expiredNotificationTimesForPredicates:v14];
        if ([v15 count]) {
          [v4 addObjectsFromArray:v15];
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)operationToSendStatusUpdate:(id)a3
{
  id v4 = a3;
  id v5 = +[STLog requestManager];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100264BAC();
  }

  id v6 = [[STReportStatusAndEventOperation alloc] initWithStatus:v4];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100071314;
  v8[3] = &unk_1002FDFF0;
  v8[4] = self;
  [(STReportStatusAndEventOperation *)v6 setPayloadHandler:v8];

  return v6;
}

- (STRequestManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (STRequestManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (STPersistenceControllerProtocol)persistenceController
{
  return self->_persistenceController;
}

- (NSString)currentBlueprintHash
{
  return self->_currentBlueprintHash;
}

- (void)setCurrentBlueprintHash:(id)a3
{
}

- (STDebouncer)changeNotificationDebouncer
{
  return (STDebouncer *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeNotificationDebouncer, 0);
  objc_storeStrong((id *)&self->_currentBlueprintHash, 0);
  objc_storeStrong((id *)&self->_persistenceController, 0);
  objc_storeStrong((id *)&self->_organizationIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end