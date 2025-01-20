@interface NRSystemVersionRequestService
- (EPServiceRegistry)serviceRegistry;
- (NRSystemVersionRequestService)initWithServiceRegistry:(id)a3;
- (NRXPCServer)server;
- (void)broadcastVersionChangeToDisconnectedWatches;
- (void)remoteObject:(id)a3 receivedSystemVersionBroadcast:(id)a4 fromDeviceID:(id)a5;
- (void)sendCloudVersionMessageToCompanion;
- (void)sendVersionRequestToCompanion;
- (void)setServer:(id)a3;
- (void)setServiceRegistry:(id)a3;
- (void)updateVersions:(id)a3 withDeviceUUID:(id)a4;
@end

@implementation NRSystemVersionRequestService

- (NRSystemVersionRequestService)initWithServiceRegistry:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NRSystemVersionRequestService;
  v6 = [(NRSystemVersionRequestService *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_serviceRegistry, a3);
  }

  return v7;
}

- (void)updateVersions:(id)a3 withDeviceUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000CACE4;
  v11[3] = &unk_1001692A8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 grabRegistryWithWriteBlockAsync:v11];
}

- (void)sendVersionRequestToCompanion
{
  v2 = +[NRPairedDeviceRegistry sharedInstance];
  v3 = [v2 getPairedDevices];

  id v30 = objc_alloc_init((Class)NSMutableSet);
  v28 = [v3 firstObject];
  v27 = [v28 objectForKeyedSubscript:NRDevicePropertyPairingID];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (!v4) {
    goto LABEL_15;
  }
  id v5 = v4;
  uint64_t v6 = *(void *)v37;
  uint64_t v7 = _NRDevicePropertyMigrationIDSCloudIdentifier;
  do
  {
    v8 = 0;
    do
    {
      if (*(void *)v37 != v6) {
        objc_enumerationMutation(obj);
      }
      id v9 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v8);
      id v10 = [v9 objectForKeyedSubscript:v7];
      v11 = +[NRPairedDeviceRegistry sharedInstance];
      id v12 = [v11 secureProperties];
      id v13 = [v12 objectForKeyedSubscript:v10];

      if (v13)
      {
        v14 = [v9 objectForKeyedSubscript:v13];
        [v30 addObject:v14];
LABEL_8:

        goto LABEL_9;
      }
      v15 = nr_daemon_log();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

      if (v16)
      {
        v14 = nr_daemon_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Device has no cloud id", buf, 2u);
        }
        goto LABEL_8;
      }
LABEL_9:

      v8 = (char *)v8 + 1;
    }
    while (v5 != v8);
    id v17 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    id v5 = v17;
  }
  while (v17);
LABEL_15:

  v18 = [v28 objectForKeyedSubscript:NRDevicePropertyIsAltAccount];

  v19 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
  if (v18)
  {
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1000CB500;
    v33[3] = &unk_100169510;
    v20 = &v34;
    v21 = v27;
    v33[4] = self;
    v34 = v27;
    id v22 = v27;
    v23 = &stru_1001694E8;
    v24 = v33;
  }
  else
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000CB5E0;
    v31[3] = &unk_100169510;
    v20 = &v32;
    v21 = v27;
    v31[4] = self;
    v32 = v27;
    id v25 = v27;
    v23 = &stru_100169530;
    v24 = v31;
  }
  [v19 sendSystemVersionsRequestToCompanionWithSentBlock:v23 withResponseBlock:v24];
}

- (void)sendCloudVersionMessageToCompanion
{
  v3 = nr_daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = nr_daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Sending cloud message with system versions to companion", (uint8_t *)&v18, 2u);
    }
  }
  uint64_t v6 = +[NRPairedDeviceRegistry sharedInstance];
  uint64_t v7 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  v8 = [v6 getAllDevicesWithArchivedDevicesMatching:v7];
  id v9 = [v8 firstObject];

  if (v9)
  {
    id v10 = [v9 objectForKeyedSubscript:_NRDevicePropertyMigrationIDSCloudIdentifier];
    v11 = v10;
    if (v10 && [v10 length])
    {
      id v12 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
      id v13 = +[NSSet setWithObject:v11];
      [v12 sendSystemVersionsToDestinations:v13 withSentBlock:&stru_100169550];
    }
    else
    {
      v14 = nr_framework_log();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

      if (!v15)
      {
LABEL_16:

        goto LABEL_17;
      }
      id v12 = nr_framework_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412290;
        v19 = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "NRDevice: %@ has no cloudIDs. Unable to send system versions", (uint8_t *)&v18, 0xCu);
      }
    }

    goto LABEL_16;
  }
  BOOL v16 = nr_daemon_log();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

  if (v17)
  {
    v11 = nr_daemon_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000FB95C(v11);
    }
    goto LABEL_16;
  }
LABEL_17:
}

- (void)broadcastVersionChangeToDisconnectedWatches
{
  v3 = nr_daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = nr_daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Broadcasting system versions to inactive watches", buf, 2u);
    }
  }
  uint64_t v6 = +[NRPairedDeviceRegistry sharedInstance];
  uint64_t v7 = [v6 getAllDevicesWithArchivedAltAccountDevicesMatching:&stru_100169570];

  v8 = +[NRPairedDeviceRegistry sharedInstance];
  id v9 = [v8 getAllDevicesWithArchivedAltAccountDevicesMatching:&stru_100169590];

  id v10 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
  long long v37 = v9;
  long long v38 = v7;
  long long v36 = v10;
  if ([v7 count])
  {
    v35 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
    id v11 = objc_alloc_init((Class)NSMutableSet);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v12 = v7;
    id v13 = [v12 countByEnumeratingWithState:&v43 objects:v50 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v44;
      uint64_t v16 = _NRDevicePropertyMigrationIDSCloudIdentifier;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v44 != v15) {
            objc_enumerationMutation(v12);
          }
          int v18 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          v19 = [v18 objectForKeyedSubscript:v16, v35];
          if (v19)
          {
            [v11 addObject:v19];
          }
          else
          {
            v20 = nr_framework_log();
            BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

            if (v21)
            {
              id v22 = nr_framework_log();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v49 = v18;
                _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "NRDevice: %@ has no cloudIDs", buf, 0xCu);
              }
            }
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v43 objects:v50 count:16];
      }
      while (v14);
    }

    [v35 sendSystemVersionsToDestinations:v11 withSentBlock:&stru_1001695B0];
    id v9 = v37;
    uint64_t v7 = v38;
    id v10 = v36;
  }
  if (objc_msgSend(v9, "count", v35))
  {
    id v23 = objc_alloc_init((Class)NSMutableSet);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v24 = v9;
    id v25 = [v24 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v40;
      uint64_t v28 = _NRDevicePropertyMigrationIDSCloudIdentifier;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v40 != v27) {
            objc_enumerationMutation(v24);
          }
          id v30 = *(void **)(*((void *)&v39 + 1) + 8 * (void)j);
          v31 = [v30 objectForKeyedSubscript:v28];
          if (v31)
          {
            [v23 addObject:v31];
          }
          else
          {
            v32 = nr_framework_log();
            BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);

            if (v33)
            {
              v34 = nr_framework_log();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v49 = v30;
                _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "NRDevice: %@ has no cloudIDs", buf, 0xCu);
              }
            }
          }
        }
        id v26 = [v24 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v26);
    }

    id v10 = v36;
    [v36 sendSystemVersionsToDestinations:v23 withSentBlock:&stru_1001695D0];

    id v9 = v37;
    uint64_t v7 = v38;
  }
}

- (void)remoteObject:(id)a3 receivedSystemVersionBroadcast:(id)a4 fromDeviceID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = +[NRPairedDeviceRegistry sharedInstance];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000CC1AC;
  v14[3] = &unk_1001695F8;
  id v15 = v7;
  id v10 = v7;
  id v11 = [v9 getAllDevicesWithArchivedAltAccountDevicesMatching:v14];

  id v12 = [v11 firstObject];
  id v13 = [v12 objectForKeyedSubscript:NRDevicePropertyPairingID];
  [(NRSystemVersionRequestService *)self updateVersions:v8 withDeviceUUID:v13];
}

- (NRXPCServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
}

- (EPServiceRegistry)serviceRegistry
{
  return self->_serviceRegistry;
}

- (void)setServiceRegistry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceRegistry, 0);

  objc_storeStrong((id *)&self->_server, 0);
}

@end