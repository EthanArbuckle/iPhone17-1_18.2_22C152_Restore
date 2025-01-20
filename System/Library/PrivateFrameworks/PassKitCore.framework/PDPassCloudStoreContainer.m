@interface PDPassCloudStoreContainer
- (BOOL)_queue_canInitializeContainer;
- (BOOL)canInitializeContainer;
- (PDCloudStoreStateConfiguration)stateConfiguration;
- (PDPassCloudStoreContainer)initWithDataSource:(id)a3;
- (id)allPossibleZoneNamesForContainerDatabase:(id)a3;
- (id)allPossibleZoneSubscriptionsForContainerDatabase:(id)a3;
- (id)cloudStoreZonesForItem:(id)a3 action:(unint64_t)a4 inContainerDatabase:(id)a5;
- (id)cloudStoreZonesForItemType:(unint64_t)a3 configuration:(id)a4 action:(unint64_t)a5 inContainerDatabase:(id)a6;
- (id)identifierFromRecord:(id)a3;
- (id)invalidCloudStoreStateChangeError;
- (id)possibleDatabaseSubscriptionForContainerDatabase:(id)a3;
- (id)recordTypeFromRecordName:(id)a3;
- (id)recordTypesForCloudStoreItemType:(unint64_t)a3;
- (id)subscriptionForZone:(id)a3 inContainerDatabase:(id)a4;
- (id)zoneIDForSubscription:(id)a3 inContainerDatabase:(id)a4;
- (unint64_t)cloudStoreItemTypeForRecordType:(id)a3;
- (void)_queue_setContainerState:(unint64_t)a3 operationGroupNameSuffix:(id)a4 retryCount:(unint64_t)a5 completion:(id)a6;
- (void)_setupContainerManager;
- (void)advanceToNextState:(unint64_t)a3;
- (void)advanceToNextState:(unint64_t)a3 withError:(id)a4;
- (void)checkAccountState;
- (void)eraseStateConfiguration;
- (void)finishInvalidStateChange;
- (void)onWorkQueue:(id)a3;
- (void)passOnHandlingStateChange;
- (void)processFetchedCloudStoreDataWithModifiedRecordsByDatabaseIdentifier:(id)a3 deletedRecordsByDatabaseIdentifier:(id)a4 carriedOverRecordsByDatabaseIdentifier:(id)a5 conflictingRecordsByDatabaseIdentifier:(id)a6 request:(id)a7 completion:(id)a8;
- (void)setCanInitializeContainer:(BOOL)a3;
- (void)setStateConfiguration:(id)a3;
@end

@implementation PDPassCloudStoreContainer

- (PDPassCloudStoreContainer)initWithDataSource:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PDPassCloudStoreContainer;
  v3 = [(PDCloudStoreContainer *)&v8 initWithDataSource:a3 notificationStreamManager:0];
  if (v3)
  {
    if (PKIsPhone() & 1) != 0 || (PKIsWatch() & 1) != 0 || (PKIsPad() & 1) != 0 || (PKIsMac()) {
      int v4 = 1;
    }
    else {
      int v4 = PKIsVision();
    }
    v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Checking if the passes cloud store container can be initialized.", buf, 2u);
    }

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v6 = @"NO";
      if (v4) {
        CFStringRef v6 = @"YES";
      }
      *(_DWORD *)buf = 138543362;
      CFStringRef v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Can initalize the passes cloud store container: %{public}@", buf, 0xCu);
    }

    v3->_canInitializeContainer = v4;
    [(PDPassCloudStoreContainer *)v3 _setupContainerManager];
  }
  return v3;
}

- (void)_setupContainerManager
{
  id v3 = objc_alloc((Class)CKContainerID);
  id v8 = [v3 initWithContainerIdentifier:PKCloudStorePassesContainerName environment:PKPassContainerEnvironment()];
  id v4 = objc_alloc_init((Class)CKContainerOptions);
  [v4 setApplicationBundleIdentifierOverride:PKPassdBundleIdentifier];
  id v5 = [objc_alloc((Class)CKContainer) initWithContainerID:v8 options:v4];
  CFStringRef v6 = [(PDCloudStoreContainer *)self dataSource];
  v7 = [[PDCloudStoreContainerManager alloc] initWithContainer:v5 validScopes:&off_10078C2E8 cacheDataSource:v6 databaseContainerDataSource:self];
  [(PDCloudStoreContainer *)self setContainerManager:v7];
}

- (BOOL)_queue_canInitializeContainer
{
  return self->_canInitializeContainer;
}

- (void)_queue_setContainerState:(unint64_t)a3 operationGroupNameSuffix:(id)a4 retryCount:(unint64_t)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  v12 = objc_alloc_init(PDCloudStoreStateConfiguration);
  [(PDCloudStoreStateConfiguration *)v12 setCurrentState:a3];
  [(PDCloudStoreStateConfiguration *)v12 setOperationGroupNameSuffix:v11];

  [(PDCloudStoreStateConfiguration *)v12 setRetryCount:a5];
  [(PDCloudStoreStateConfiguration *)v12 setStateChangeCompletion:v10];

  [(PDPassCloudStoreContainer *)self setStateConfiguration:v12];
  v13 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543362;
    v15 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStoreContainer] state will advance to %{public}@", (uint8_t *)&v14, 0xCu);
  }

  if ([(PDCloudStoreContainer *)self _queue_ensureContainerState:a3])
  {
    if (a3 == 4) {
      [(PDPassCloudStoreContainer *)self checkAccountState];
    }
    else {
      [(PDPassCloudStoreContainer *)self passOnHandlingStateChange];
    }
  }
  else
  {
    [(PDPassCloudStoreContainer *)self finishInvalidStateChange];
  }
}

- (void)finishInvalidStateChange
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(PDPassCloudStoreContainer *)self stateConfiguration];
    int v8 = 138543362;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStoreContainer] encountered invalid state configuration %{public}@", (uint8_t *)&v8, 0xCu);
  }
  id v5 = [(PDPassCloudStoreContainer *)self stateConfiguration];
  CFStringRef v6 = [v5 stateChangeCompletion];

  if (v6)
  {
    v7 = [(PDPassCloudStoreContainer *)self invalidCloudStoreStateChangeError];
    ((void (**)(void, void, void *))v6)[2](v6, 0, v7);
  }
  [(PDPassCloudStoreContainer *)self eraseStateConfiguration];
}

- (id)invalidCloudStoreStateChangeError
{
  return [(PDCloudStoreContainer *)self errorWithCode:-4006 description:@"Invalid cloud store state"];
}

- (void)eraseStateConfiguration
{
}

- (void)advanceToNextState:(unint64_t)a3
{
  id v8 = [(PDPassCloudStoreContainer *)self stateConfiguration];
  [(PDPassCloudStoreContainer *)self eraseStateConfiguration];
  [(PDCloudStoreContainer *)self setNextExpectedState:a3];
  id v5 = [v8 operationGroupNameSuffix];
  id v6 = [v8 retryCount];
  v7 = [v8 stateChangeCompletion];
  [(PDPassCloudStoreContainer *)self _queue_setContainerState:a3 operationGroupNameSuffix:v5 retryCount:v6 completion:v7];
}

- (void)advanceToNextState:(unint64_t)a3 withError:(id)a4
{
  id v6 = a4;
  id v10 = [(PDPassCloudStoreContainer *)self stateConfiguration];
  [(PDPassCloudStoreContainer *)self eraseStateConfiguration];
  [(PDCloudStoreContainer *)self setNextExpectedState:a3];
  v7 = [v10 operationGroupNameSuffix];
  id v8 = [v10 retryCount];
  v9 = [v10 stateChangeCompletion];
  [(PDCloudStoreContainer *)self _queue_processResultWithError:v6 nextExpectedState:a3 operationGroupNameSuffix:v7 retryCount:v8 shouldRetry:0 completion:v9];
}

- (void)passOnHandlingStateChange
{
  id v3 = [(PDPassCloudStoreContainer *)self stateConfiguration];
  [(PDPassCloudStoreContainer *)self eraseStateConfiguration];
  id v4 = [v3 currentState];
  id v5 = [v3 operationGroupNameSuffix];
  id v6 = [v3 retryCount];
  v7 = [v3 stateChangeCompletion];
  v8.receiver = self;
  v8.super_class = (Class)PDPassCloudStoreContainer;
  [(PDCloudStoreContainer *)&v8 _queue_setContainerState:v4 operationGroupNameSuffix:v5 retryCount:v6 completion:v7];
}

- (void)checkAccountState
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10023410C;
  v2[3] = &unk_100732CE0;
  v2[4] = self;
  [(PDCloudStoreContainer *)self _queue_cloudStoreAccountInformationWithCompletion:v2];
}

- (void)onWorkQueue:(id)a3
{
  id v4 = a3;
  id v5 = [(PDCloudStoreContainer *)self workQueue];
  dispatch_async(v5, v4);
}

- (void)processFetchedCloudStoreDataWithModifiedRecordsByDatabaseIdentifier:(id)a3 deletedRecordsByDatabaseIdentifier:(id)a4 carriedOverRecordsByDatabaseIdentifier:(id)a5 conflictingRecordsByDatabaseIdentifier:(id)a6 request:(id)a7 completion:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v34 = a5;
  id v33 = a6;
  id v32 = a7;
  id v31 = a8;
  v15 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = [v13 objectForKeyedSubscript:@"Private"];
    id v17 = [v16 count];
    v18 = [v14 objectForKeyedSubscript:@"Private"];
    *(_DWORD *)buf = 134218240;
    id v52 = v17;
    __int16 v53 = 2048;
    id v54 = [v18 count];
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStoreContainer] received a batch of updates: %lu and deltes: %lu", buf, 0x16u);
  }
  v35 = v14;

  id v19 = objc_alloc_init((Class)PKCloudRecordArray);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = [v13 allKeys];
  id v39 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v39)
  {
    uint64_t v37 = *(void *)v46;
    id v38 = v13;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v46 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v40 = v20;
        uint64_t v21 = *(void *)(*((void *)&v45 + 1) + 8 * v20);
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        v22 = objc_msgSend(v13, "objectForKeyedSubscript:", v21, v31, v32, v33, v34, v35);
        id v23 = [v22 countByEnumeratingWithState:&v41 objects:v49 count:16];
        if (v23)
        {
          id v24 = v23;
          uint64_t v25 = *(void *)v42;
          do
          {
            for (i = 0; i != v24; i = (char *)i + 1)
            {
              if (*(void *)v42 != v25) {
                objc_enumerationMutation(v22);
              }
              v27 = *(void **)(*((void *)&v41 + 1) + 8 * i);
              if (objc_msgSend(v27, "pk_isRemoteAsset"))
              {
                id v28 = objc_alloc((Class)PKCloudRecordAssetURL);
                v29 = +[NSSet setWithObject:v27];
                id v30 = [v28 initWithRecords:v29];

                [v19 addCloudRecord:v30 forContainerDatabaseIdentifier:v21];
              }
            }
            id v24 = [v22 countByEnumeratingWithState:&v41 objects:v49 count:16];
          }
          while (v24);
        }

        uint64_t v20 = v40 + 1;
        id v13 = v38;
      }
      while ((id)(v40 + 1) != v39);
      id v39 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v39);
  }

  if (v31) {
    (*((void (**)(id, id, void, void))v31 + 2))(v31, v19, 0, 0);
  }
}

- (id)recordTypesForCloudStoreItemType:(unint64_t)a3
{
  if (a3 == 4)
  {
    uint64_t v5 = PKCloudRemoteAssetRecordType;
    id v3 = +[NSArray arrayWithObjects:&v5 count:1];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (unint64_t)cloudStoreItemTypeForRecordType:(id)a3
{
  id v3 = a3;
  id v4 = (void *)PKCloudRemoteAssetRecordType;
  id v5 = v3;
  id v6 = v4;
  if (v6 == v5)
  {
  }
  else
  {
    v7 = v6;
    if (!v5 || !v6)
    {

LABEL_9:
      unint64_t v9 = 0;
      goto LABEL_10;
    }
    unsigned int v8 = [v5 isEqualToString:v6];

    if (!v8) {
      goto LABEL_9;
    }
  }
  unint64_t v9 = 4;
LABEL_10:

  return v9;
}

- (id)identifierFromRecord:(id)a3
{
  id v3 = [a3 recordID];
  id v4 = [v3 recordName];

  return v4;
}

- (id)recordTypeFromRecordName:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PDPassCloudStoreContainer;
  uint64_t v3 = [(PDCloudStoreContainer *)&v8 recordTypeFromRecordName:a3];
  id v4 = (void *)v3;
  id v5 = (void *)PKCloudRemoteAssetRecordType;
  if (v3) {
    id v5 = (void *)v3;
  }
  id v6 = v5;

  return v6;
}

- (id)allPossibleZoneNamesForContainerDatabase:(id)a3
{
  if ([a3 scope] == (id)2)
  {
    uint64_t v3 = +[NSSet setWithObject:PKCloudStoreRemoteAssestsZoneName];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (id)allPossibleZoneSubscriptionsForContainerDatabase:(id)a3
{
  id v5 = a3;
  id v6 = [v5 scope];
  if (v6 == (id)1 || v6 == (id)3)
  {
    uint64_t v3 = +[NSSet set];
  }
  else if (v6 == (id)2)
  {
    objc_super v8 = [v5 zoneForZoneName:PKCloudStoreRemoteAssestsZoneName];
    unint64_t v9 = [(PDPassCloudStoreContainer *)self subscriptionForZone:v8 inContainerDatabase:v5];

    if (v9) {
      +[NSSet setWithObject:v9];
    }
    else {
    uint64_t v3 = +[NSSet set];
    }
  }
  return v3;
}

- (id)possibleDatabaseSubscriptionForContainerDatabase:(id)a3
{
  return 0;
}

- (id)subscriptionForZone:(id)a3 inContainerDatabase:(id)a4
{
  id v5 = a3;
  if ([a4 scope] != (id)2) {
    goto LABEL_6;
  }
  id v6 = [v5 zoneID];
  v7 = [v6 zoneName];
  objc_super v8 = (void *)PKCloudStoreRemoteAssestsZoneName;
  id v9 = v7;
  id v10 = v8;
  if (v9 == v10)
  {
  }
  else
  {
    id v11 = v10;
    if (!v9 || !v10)
    {

      id v13 = 0;
      goto LABEL_10;
    }
    unsigned __int8 v12 = [v9 isEqualToString:v10];

    if ((v12 & 1) == 0)
    {
LABEL_6:
      id v13 = 0;
      goto LABEL_11;
    }
  }
  id v14 = objc_alloc((Class)CKRecordZoneSubscription);
  id v6 = [v5 zoneID];
  id v13 = [v14 initWithZoneID:v6 subscriptionID:PKCloudStoreRemoteAssetZoneSubscriptionID];
LABEL_10:

LABEL_11:
  return v13;
}

- (id)zoneIDForSubscription:(id)a3 inContainerDatabase:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 scope] != (id)2) {
    goto LABEL_6;
  }
  v7 = [v5 subscriptionID];
  objc_super v8 = (void *)PKCloudStoreRemoteAssetZoneSubscriptionID;
  id v9 = v7;
  id v10 = v8;
  if (v9 == v10)
  {
  }
  else
  {
    id v11 = v10;
    if (!v9 || !v10)
    {

      id v13 = 0;
      goto LABEL_10;
    }
    unsigned int v12 = [v9 isEqualToString:v10];

    if (!v12)
    {
LABEL_6:
      id v13 = 0;
      goto LABEL_11;
    }
  }
  id v9 = [v6 zoneForZoneName:PKCloudStoreRemoteAssestsZoneName];
  id v13 = [v9 zoneID];
LABEL_10:

LABEL_11:
  return v13;
}

- (id)cloudStoreZonesForItem:(id)a3 action:(unint64_t)a4 inContainerDatabase:(id)a5
{
  id v8 = a5;
  id v9 = -[PDPassCloudStoreContainer cloudStoreZonesForItemType:configuration:action:inContainerDatabase:](self, "cloudStoreZonesForItemType:configuration:action:inContainerDatabase:", [a3 itemType], 0, a4, v8);

  return v9;
}

- (id)cloudStoreZonesForItemType:(unint64_t)a3 configuration:(id)a4 action:(unint64_t)a5 inContainerDatabase:(id)a6
{
  if (a3 == 4)
  {
    id v7 = a6;
    id v8 = [(PDCloudStoreContainer *)self containerManager];
    id v9 = [v8 cloudStoreZoneForZoneName:PKCloudStoreRemoteAssestsZoneName inContainerDatabase:v7];

    if (v9)
    {
      id v10 = +[NSSet setWithObject:v9];
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

- (PDCloudStoreStateConfiguration)stateConfiguration
{
  return self->_stateConfiguration;
}

- (void)setStateConfiguration:(id)a3
{
}

- (BOOL)canInitializeContainer
{
  return self->_canInitializeContainer;
}

- (void)setCanInitializeContainer:(BOOL)a3
{
  self->_canInitializeContainer = a3;
}

- (void).cxx_destruct
{
}

@end