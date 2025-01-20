@interface STCoreDataConfigurationStore
- (STConfigurationStoreChangeObserverDelegate)delegate;
- (STCoreDataConfigurationReverseTransformer)reverseTransformer;
- (STCoreDataConfigurationStore)initWithObserver:(id)a3 transformer:(id)a4 reverseTransformer:(id)a5;
- (STCoreDataConfigurationTransformer)transformer;
- (STCoreDataObserver)observer;
- (id)communicationConfigurationOfChildrenByUserIDForTargetableFamilyMembers:(id)a3;
- (id)downtimeConfigurationOfChildrenByUserIDForTargetableFamilyMembers:(id)a3;
- (id)readCommunicationConfigurationForLocalUser;
- (id)readCommunicationConfigurationForUserID:(id)a3;
- (id)readConfigurationChangesOfType:(int64_t)a3 userID:(id)a4;
- (id)readConfigurationRelatedToConfiguration:(id)a3;
- (id)readDowntimeConfigurationForUserID:(id)a3;
- (id)readSetupConfigurationForUserID:(id)a3 familyProvider:(id)a4;
- (id)toggleOnDemandDowntimeConfigurationForUserID:(id)a3;
- (id)writeConfigurationChange:(id)a3;
- (id)writeSetupConfiguration:(id)a3;
- (void)observer:(id)a3 didObserveCoreDataChanges:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation STCoreDataConfigurationStore

- (id)readCommunicationConfigurationForLocalUser
{
  v2 = [(STCoreDataConfigurationStore *)self transformer];
  v3 = [v2 communicationConfigurationForLocalUser];

  return v3;
}

- (STCoreDataConfigurationTransformer)transformer
{
  return (STCoreDataConfigurationTransformer *)objc_getProperty(self, a2, 24, 1);
}

- (STCoreDataConfigurationStore)initWithObserver:(id)a3 transformer:(id)a4 reverseTransformer:(id)a5
{
  v8 = (STCoreDataObserver *)a3;
  v9 = (STCoreDataConfigurationTransformer *)a4;
  v10 = (STCoreDataConfigurationReverseTransformer *)a5;
  v21.receiver = self;
  v21.super_class = (Class)STCoreDataConfigurationStore;
  v11 = [(STCoreDataConfigurationStore *)&v21 init];
  observer = v11->_observer;
  v11->_observer = v8;
  v13 = v8;

  transformer = v11->_transformer;
  v11->_transformer = v9;
  v15 = v9;

  reverseTransformer = v11->_reverseTransformer;
  v11->_reverseTransformer = v10;
  v17 = v10;

  v18 = v11->_observer;
  v19 = [(STCoreDataConfigurationTransformer *)v15 configurationObservationFiltersByTriggerPredicate];
  [(STCoreDataObserver *)v18 addObservationFiltersByTriggerPredicate:v19 forDelegate:v11];

  return v11;
}

- (id)readConfigurationRelatedToConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [(STCoreDataConfigurationStore *)self transformer];
  v6 = [v5 configurationChangeForRelatedConfigurationChange:v4];

  return v6;
}

- (id)readConfigurationChangesOfType:(int64_t)a3 userID:(id)a4
{
  id v6 = a4;
  v7 = [(STCoreDataConfigurationStore *)self transformer];
  v8 = [v7 configurationChangesOfType:a3 userID:v6];

  return v8;
}

- (id)readSetupConfigurationForUserID:(id)a3 familyProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(STCoreDataConfigurationStore *)self readConfigurationChangesOfType:1 userID:v6];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100026F60;
  v16[3] = &unk_1002FC120;
  v16[4] = self;
  id v17 = v7;
  id v9 = v7;
  v10 = [v8 flatMap:v16];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100026FD8;
  v14[3] = &unk_1002FC148;
  id v15 = v6;
  id v11 = v6;
  v12 = [v10 mapError:v14];

  return v12;
}

- (id)readCommunicationConfigurationForUserID:(id)a3
{
  id v4 = a3;
  v5 = [(STCoreDataConfigurationStore *)self transformer];
  id v6 = [v5 communicationConfigurationForUserID:v4];

  return v6;
}

- (id)readDowntimeConfigurationForUserID:(id)a3
{
  id v4 = a3;
  v5 = [(STCoreDataConfigurationStore *)self transformer];
  id v6 = [v5 downtimeConfigurationForUserID:v4];

  return v6;
}

- (id)communicationConfigurationOfChildrenByUserIDForTargetableFamilyMembers:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (([v11 isParent] & 1) == 0)
        {
          v12 = [v11 dsid];
          id v13 = [objc_alloc((Class)STUserID) initWithDSID:v12];
          v14 = [(STCoreDataConfigurationStore *)self readCommunicationConfigurationForUserID:v13];
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = sub_100027400;
          v18[3] = &unk_1002FC170;
          id v19 = v5;
          id v20 = v13;
          id v15 = v13;
          [v14 evaluateWithSuccess:v18 failure:&stru_1002FC190];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  id v16 = [v5 copy];
  return v16;
}

- (id)downtimeConfigurationOfChildrenByUserIDForTargetableFamilyMembers:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (([v11 isParent] & 1) == 0)
        {
          id v12 = objc_alloc((Class)STUserID);
          id v13 = [v11 dsid];
          id v14 = [v12 initWithDSID:v13];

          id v15 = [(STCoreDataConfigurationStore *)self readDowntimeConfigurationForUserID:v14];
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = sub_100027690;
          v18[3] = &unk_1002FC1B8;
          id v19 = v5;
          id v20 = v14;
          id v16 = v14;
          [v15 evaluateWithSuccess:v18 failure:&stru_1002FC1D8];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)writeConfigurationChange:(id)a3
{
  id v4 = a3;
  id v5 = [(STCoreDataConfigurationStore *)self reverseTransformer];
  id v6 = [v5 handleConfigurationChange:v4];

  return v6;
}

- (id)writeSetupConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(STCoreDataConfigurationStore *)self reverseTransformer];
  id v6 = [v5 handleSetupConfiguration:v4];

  return v6;
}

- (id)toggleOnDemandDowntimeConfigurationForUserID:(id)a3
{
  id v4 = a3;
  id v5 = [(STCoreDataConfigurationStore *)self reverseTransformer];
  id v6 = [v5 handleOnDemandDowntimeToggleForUserID:v4];

  return v6;
}

- (void)observer:(id)a3 didObserveCoreDataChanges:(id)a4
{
  id v18 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = a4;
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v13 = [(STCoreDataConfigurationStore *)self transformer];
        id v19 = 0;
        id v14 = [v13 configurationChangeForCoreDataChange:v11 error:&v19];
        id v15 = v19;

        if (!v14)
        {
          id v17 = +[STLog coreDataConfigurationStore];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            sub_10025D6BC(v11, (uint64_t)v15, v17);
          }

          goto LABEL_13;
        }
        id v16 = [(STCoreDataConfigurationStore *)self delegate];
        [v16 changeObserver:self didObserveConfigurationChange:v14];
      }
      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (STConfigurationStoreChangeObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (STConfigurationStoreChangeObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (STCoreDataObserver)observer
{
  return (STCoreDataObserver *)objc_getProperty(self, a2, 16, 1);
}

- (STCoreDataConfigurationReverseTransformer)reverseTransformer
{
  return (STCoreDataConfigurationReverseTransformer *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reverseTransformer, 0);
  objc_storeStrong((id *)&self->_transformer, 0);
  objc_storeStrong((id *)&self->_observer, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end