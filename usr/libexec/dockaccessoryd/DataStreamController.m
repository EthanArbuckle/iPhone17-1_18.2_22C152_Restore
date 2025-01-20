@interface DataStreamController
- (BOOL)_isDataStreamConfigurationValid;
- (BOOL)setupRequiresCharactertisticReads;
- (BOOL)supportsDataStreamOverHAP;
- (DataStream)defaultDataStream;
- (DataStreamController)initWithAccessory:(id)a3 service:(id)a4 workQueue:(id)a5;
- (DataStreamController)initWithAccessory:(id)a3 service:(id)a4 workQueue:(id)a5 dataStreamFactory:(id)a6;
- (DataStreamSetupOperation)setupInProgress;
- (HAPAccessory)accessory;
- (HAPService)transferManagementService;
- (HMFTimer)idleTimer;
- (NSMutableArray)pendingSocketRequests;
- (NSString)logIdentifier;
- (OS_dispatch_queue)workQueue;
- (id)_getActiveProtocolWithName:(id)a3;
- (id)_getStreamProtocol;
- (id)dataStreamFactory;
- (unint64_t)maxControllerTransportMTU;
- (void)_cancelStreamTransportWithError:(id)a3;
- (void)_createBulkStreamProtocol;
- (void)_createStreamSocketWithStreamProtocol:(id)a3 applicationProtocolName:(id)a4 completion:(id)a5;
- (void)_failPendingSocketRequestsWithError:(id)a3;
- (void)_handleAccessoryConnected;
- (void)_initiateStreamSetup;
- (void)_processPendingSocketRequests;
- (void)_readRequiredTransportCharacteristicsIfNeededWithCompletion:(id)a3;
- (void)_resetDefaultDataStream;
- (void)_resetTransportInfo;
- (void)_startIdleTimer;
- (void)_stopIdleTimer;
- (void)addBulkSendListener:(id)a3 fileType:(id)a4;
- (void)dataStream:(id)a3 didFailWithError:(id)a4;
- (void)dataStreamDidClose:(id)a3;
- (void)dataStreamDidOpen:(id)a3;
- (void)dataStreamDidReceiveRawFrame:(id)a3;
- (void)dataStreamDidUpdateActiveStatus:(id)a3;
- (void)dataStreamInitializationSetupOperation:(id)a3 didCompleteSupportReadWithStatus:(BOOL)a4;
- (void)dataStreamSetupOperation:(id)a3 didFailWithError:(id)a4;
- (void)dataStreamSetupOperation:(id)a3 didSucceedWithTransport:(id)a4 sessionEncryption:(id)a5;
- (void)deRegisterFromNotifications;
- (void)handleAccessoryConnected;
- (void)handleAccessoryConnected:(id)a3;
- (void)handleAccessoryConnectedSync;
- (void)handleAccessoryDisconnected:(id)a3;
- (void)invalidate;
- (void)openBulkSendSessionForFileType:(id)a3 reason:(id)a4 metadata:(id)a5 queue:(id)a6 callback:(id)a7;
- (void)openStreamSocketWithApplicationProtocol:(id)a3 completion:(id)a4;
- (void)readRequiredTransportCharacteristicsIfNeededWithCompletion:(id)a3;
- (void)removeBulkSendListener:(id)a3;
- (void)sendTargetControlWhoAmIWithIdentifier:(unsigned int)a3;
- (void)setAccessory:(id)a3;
- (void)setDefaultDataStream:(id)a3;
- (void)setIdleTimer:(id)a3;
- (void)setMaxControllerTransportMTU:(unint64_t)a3;
- (void)setPendingSocketRequests:(id)a3;
- (void)setSetupInProgress:(id)a3;
- (void)setSupportsDataStreamOverHAP:(BOOL)a3;
- (void)setTransferManagementService:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation DataStreamController

- (DataStreamController)initWithAccessory:(id)a3 service:(id)a4 workQueue:(id)a5
{
  return [(DataStreamController *)self initWithAccessory:a3 service:a4 workQueue:a5 dataStreamFactory:&stru_1002746D0];
}

- (DataStreamController)initWithAccessory:(id)a3 service:(id)a4 workQueue:(id)a5 dataStreamFactory:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)DataStreamController;
  v14 = [(DataStreamController *)&v21 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_accessory, v10);
    objc_storeWeak((id *)&v15->_transferManagementService, v11);
    objc_storeStrong((id *)&v15->_workQueue, a5);
    uint64_t v16 = +[NSMutableArray array];
    pendingSocketRequests = v15->_pendingSocketRequests;
    v15->_pendingSocketRequests = (NSMutableArray *)v16;

    id v18 = objc_retainBlock(v13);
    id dataStreamFactory = v15->_dataStreamFactory;
    v15->_id dataStreamFactory = v18;
  }
  return v15;
}

- (void)deRegisterFromNotifications
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (void)handleAccessoryConnected:(id)a3
{
}

- (void)_resetTransportInfo
{
  [(DataStreamController *)self setSupportsDataStreamOverHAP:0];

  [(DataStreamController *)self setMaxControllerTransportMTU:0];
}

- (void)handleAccessoryConnected
{
  id v3 = [(DataStreamController *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008FA90;
  block[3] = &unk_100273018;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)handleAccessoryConnectedSync
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10008FCAC;
  v2[3] = &unk_1002733C8;
  v2[4] = self;
  [(DataStreamController *)self _readRequiredTransportCharacteristicsIfNeededWithCompletion:v2];
}

- (BOOL)_isDataStreamConfigurationValid
{
  id v3 = [(DataStreamController *)self workQueue];
  dispatch_assert_queue_V2(v3);

  v4 = [(DataStreamController *)self transferManagementService];
  v5 = [v4 characteristicsOfType:@"00000130-0000-1000-8000-4D69736D6574"];
  v6 = [v5 objectAtIndexedSubscript:0];

  if (v6)
  {
    [(DataStreamController *)self _resetTransportInfo];
    v7 = [v6 value];
    id v50 = 0;
    v8 = +[HAPDataStreamTransportSupportedConfiguration parsedFromData:v7 error:&v50];
    v9 = (DataStreamController *)v50;

    if (v9) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = v8 == 0;
    }
    BOOL v11 = !v10;
    if (v10)
    {
      id v12 = self;
      v33 = sub_100083F74();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        v34 = sub_100083FD0(v12);
        [(DataStreamController *)v12 accessory];
        v35 = v45 = v8;
        [v35 name];
        v36 = BOOL v44 = v11;
        v37 = [(DataStreamController *)v12 accessory];
        v38 = [v37 identifier];
        *(_DWORD *)buf = 138543874;
        v53 = v34;
        __int16 v54 = 2112;
        v55 = v36;
        __int16 v56 = 2112;
        v57 = v38;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "%{public}@Failed to parse HDS supported configuration (%@/%@)", buf, 0x20u);

        BOOL v11 = v44;
        v8 = v45;
      }
    }
    else
    {
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v12 = [v8 configurations];
      id v13 = [(DataStreamController *)v12 countByEnumeratingWithState:&v46 objects:v51 count:16];
      if (v13)
      {
        id v14 = v13;
        BOOL v43 = v11;
        v40 = v9;
        v41 = v6;
        v42 = v4;
        uint64_t v15 = *(void *)v47;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v47 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v46 + 1) + 8 * i);
            id v18 = [v17 transport];

            if (v18)
            {
              v19 = [v17 transport];
              id v20 = [v19 value];

              if (v20 == (id)1 && ![(DataStreamController *)self supportsDataStreamOverHAP])
              {
                objc_super v21 = [v17 maximumControllerTransportMTU];

                if (v21)
                {
                  v22 = [v17 maximumControllerTransportMTU];
                  v23 = [v22 value];
                  id v24 = [v23 unsignedIntegerValue];

                  [(DataStreamController *)self setSupportsDataStreamOverHAP:1];
                  [(DataStreamController *)self setMaxControllerTransportMTU:v24];
                }
                else
                {
                  v25 = self;
                  v26 = sub_100083F74();
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                  {
                    v27 = sub_100083FD0(v25);
                    *(_DWORD *)buf = 138543362;
                    v53 = v27;
                    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Accessory with HDS service advertises HDS-over-HAP but provides no MTU; ignoring.",
                      buf,
                      0xCu);
                  }
                }
              }
            }
          }
          id v14 = [(DataStreamController *)v12 countByEnumeratingWithState:&v46 objects:v51 count:16];
        }
        while (v14);
        v6 = v41;
        v4 = v42;
        v9 = v40;
        BOOL v11 = v43;
      }
    }
  }
  else
  {
    v9 = self;
    v8 = sub_100083F74();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v28 = sub_100083FD0(v9);
      v29 = [(DataStreamController *)v9 accessory];
      v30 = [v29 name];
      v31 = [(DataStreamController *)v9 accessory];
      v32 = [v31 identifier];
      *(_DWORD *)buf = 138543874;
      v53 = v28;
      __int16 v54 = 2112;
      v55 = v30;
      __int16 v56 = 2112;
      v57 = v32;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@No HDS supported configuration (%@/%@)", buf, 0x20u);
    }
    BOOL v11 = 0;
  }

  return v11;
}

- (void)readRequiredTransportCharacteristicsIfNeededWithCompletion:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100090340;
  v5[3] = &unk_1002746F8;
  id v6 = a3;
  id v4 = v6;
  [(DataStreamController *)self _readRequiredTransportCharacteristicsIfNeededWithCompletion:v5];
}

- (void)_readRequiredTransportCharacteristicsIfNeededWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  v5 = [(DataStreamController *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(DataStreamController *)self transferManagementService];
  v7 = [v6 characteristicsOfType:@"00000130-0000-1000-8000-4D69736D6574"];
  v8 = [v7 objectAtIndexedSubscript:0];

  if (!v8)
  {
    BOOL v10 = +[NSError dkErrorWithCode:4];
    v4[2](v4, 0, v10);
LABEL_11:

    goto LABEL_12;
  }
  v9 = [v8 value];

  if (!v9)
  {
    v25 = v8;
    BOOL v10 = +[NSArray arrayWithObjects:&v25 count:1];
    if ([v10 count])
    {
      BOOL v11 = self;
      id v12 = sub_100083F74();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = sub_100083FD0(v11);
        id v14 = [(DataStreamController *)v11 accessory];
        uint64_t v15 = [v14 identifier];
        *(_DWORD *)buf = 138543618;
        v22 = v13;
        __int16 v23 = 2112;
        id v24 = v15;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Reading required transport characteristic for data stream controller %@", buf, 0x16u);
      }
      uint64_t v16 = [(DataStreamController *)v11 accessory];
      v17 = [(DataStreamController *)v11 workQueue];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10009062C;
      v19[3] = &unk_1002746F8;
      id v20 = v4;
      [v16 readCharacteristicValues:v10 timeout:v17 completionQueue:v19 completionHandler:0.0];

      id v18 = v20;
    }
    else
    {
      id v18 = +[NSError dkErrorWithCode:4];
      v4[2](v4, 0, v18);
    }

    goto LABEL_11;
  }
  v4[2](v4, 0, 0);
LABEL_12:
}

- (void)_handleAccessoryConnected
{
  id v3 = [(DataStreamController *)self workQueue];
  dispatch_assert_queue_V2(v3);

  [(DataStreamController *)self _isDataStreamConfigurationValid];
  [(DataStreamController *)self canAcceptBulkSendListeners];
  id v4 = self;
  v5 = sub_100083F74();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = sub_100083FD0(v4);
    v7 = [(DataStreamController *)v4 accessory];
    v8 = [v7 shortDescription];
    v9 = HMFBooleanToString();
    BOOL v10 = HMFBooleanToString();
    int v11 = 138544130;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v8;
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    id v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Accessory with HDS service is connected: %@. Configured: %@ Accepts Bulk Send: %@", (uint8_t *)&v11, 0x2Au);
  }
}

- (void)handleAccessoryDisconnected:(id)a3
{
  id v4 = a3;
  v5 = [(DataStreamController *)self workQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100090860;
  v7[3] = &unk_100273040;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)_getActiveProtocolWithName:(id)a3
{
  id v4 = a3;
  v5 = [(DataStreamController *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(DataStreamController *)self defaultDataStream];
  v7 = [v6 protocolWithName:v4];

  return v7;
}

- (void)addBulkSendListener:(id)a3 fileType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DataStreamController *)self accessory];
  v9 = [(DataStreamController *)self defaultDataStream];

  if (v9)
  {
    BOOL v10 = +[DataStreamBulkSendProtocol protocolName];
    int v11 = [(DataStreamController *)self _getActiveProtocolWithName:v10];

    id v12 = v11;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      __int16 v13 = v12;
    }
    else {
      __int16 v13 = 0;
    }
    id v14 = v13;

    __int16 v15 = self;
    uint64_t v16 = sub_100083F74();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
    if (v14)
    {
      if (v17)
      {
        id v18 = sub_100083FD0(v15);
        int v26 = 138543618;
        v27 = v18;
        __int16 v28 = 2112;
        id v29 = v7;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%{public}@Adding bulk-send listener on this stream for file-type '%@'", (uint8_t *)&v26, 0x16u);
      }
      [v14 addListener:v6 fileType:v7];
    }
    else
    {
      if (v17)
      {
        id v24 = sub_100083FD0(v15);
        int v26 = 138543618;
        v27 = v24;
        __int16 v28 = 2112;
        id v29 = v7;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%{public}@Cancelling bulk-send listener registration for file-type '%@' due to no such protocol on this stream", (uint8_t *)&v26, 0x16u);
      }
      [v6 accessoryDidCloseDataStream:v8];
    }

LABEL_17:
    goto LABEL_18;
  }
  [(DataStreamController *)self _initiateStreamSetup];
  v19 = [(DataStreamController *)self setupInProgress];

  id v20 = self;
  objc_super v21 = sub_100083F74();
  v22 = v21;
  if (v19)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      __int16 v23 = sub_100083FD0(v20);
      int v26 = 138543618;
      v27 = v23;
      __int16 v28 = 2112;
      id v29 = v7;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%{public}@Add pending bulk-send listener registration for file-type '%@' (waiting for stream setup)", (uint8_t *)&v26, 0x16u);
    }
    id v12 = [(DataStreamController *)v20 setupInProgress];
    [v12 addBulkSendListener:v6 fileType:v7];
    goto LABEL_17;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v25 = sub_100083FD0(v20);
    int v26 = 138543618;
    v27 = v25;
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Canceling bulk-send listener registration for file-type '%@' due to no active data stream", (uint8_t *)&v26, 0x16u);
  }
  [v6 accessoryDidCloseDataStream:v8];
LABEL_18:
}

- (void)removeBulkSendListener:(id)a3
{
  id v4 = a3;
  v5 = [(DataStreamController *)self defaultDataStream];

  if (!v5)
  {
    __int16 v15 = [(DataStreamController *)self setupInProgress];

    if (v15)
    {
      uint64_t v16 = [(DataStreamController *)self setupInProgress];
      unsigned int v17 = [v16 removeBulkSendListener:v4];

      id v8 = self;
      BOOL v10 = sub_100083F74();
      BOOL v18 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
      if (v17)
      {
        if (!v18) {
          goto LABEL_22;
        }
        sub_100083FD0(v8);
        int v11 = (DataStreamController *)objc_claimAutoreleasedReturnValue();
        int v22 = 138543362;
        __int16 v23 = v11;
        v19 = "%{public}@Removed pending bulk-send listener registration (waiting for stream setup)";
      }
      else
      {
        if (!v18) {
          goto LABEL_22;
        }
        sub_100083FD0(v8);
        int v11 = (DataStreamController *)objc_claimAutoreleasedReturnValue();
        int v22 = 138543362;
        __int16 v23 = v11;
        v19 = "%{public}@Removed bulk-send listener trivially (stream setting up, but this was not part of it)";
      }
    }
    else
    {
      id v8 = self;
      BOOL v10 = sub_100083F74();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        goto LABEL_22;
      }
      sub_100083FD0(v8);
      int v11 = (DataStreamController *)objc_claimAutoreleasedReturnValue();
      int v22 = 138543362;
      __int16 v23 = v11;
      v19 = "%{public}@Removed bulk-send listener trivially (nothing had started)";
    }
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v19, (uint8_t *)&v22, 0xCu);
LABEL_21:

    goto LABEL_22;
  }
  id v6 = +[DataStreamBulkSendProtocol protocolName];
  id v7 = [(DataStreamController *)self _getActiveProtocolWithName:v6];

  id v8 = v7;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  BOOL v10 = v9;

  int v11 = self;
  id v12 = sub_100083F74();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (!v10)
  {
    if (v13)
    {
      sub_100083FD0(v11);
      id v20 = (DataStreamController *)objc_claimAutoreleasedReturnValue();
      int v22 = 138543362;
      __int16 v23 = v20;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}@Removed bulk-send listener on this stream (but there was no protocol!?)", (uint8_t *)&v22, 0xCu);
    }
    goto LABEL_21;
  }
  if (v13)
  {
    sub_100083FD0(v11);
    id v14 = (DataStreamController *)objc_claimAutoreleasedReturnValue();
    int v22 = 138543362;
    __int16 v23 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}@Removed bulk-send listener on this stream", (uint8_t *)&v22, 0xCu);
  }
  [v10 removeListener:v4];
LABEL_22:

  objc_super v21 = [(DataStreamController *)self accessory];
  [v4 accessoryDidCloseDataStream:v21];
}

- (void)sendTargetControlWhoAmIWithIdentifier:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = [(DataStreamController *)self defaultDataStream];

  id v6 = self;
  id v7 = sub_100083F74();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v8)
    {
      v9 = sub_100083FD0(v6);
      int v11 = 138543362;
      id v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@Data Stream sending target-control whoami message", (uint8_t *)&v11, 0xCu);
    }
    id v6 = [(DataStreamController *)v6 defaultDataStream];
    id v7 = [(DataStreamController *)v6 protocolDelegateHandle];
    +[DataStreamTargetControlProtocol sendTargetControlWhoAmIWithIdentifier:v3 dataStreamProtocolDelegate:v7];
  }
  else if (v8)
  {
    BOOL v10 = sub_100083FD0(v6);
    int v11 = 138543362;
    id v12 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@Data Stream not running; dropping target-control whoami message",
      (uint8_t *)&v11,
      0xCu);
  }
}

- (void)openStreamSocketWithApplicationProtocol:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(DataStreamController *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000913B0;
  block[3] = &unk_100274040;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)_processPendingSocketRequests
{
  uint64_t v3 = [(DataStreamController *)self pendingSocketRequests];
  unsigned __int8 v4 = [v3 hmf_isEmpty];

  if ((v4 & 1) == 0)
  {
    v5 = [(DataStreamController *)self _getStreamProtocol];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = [(DataStreamController *)self pendingSocketRequests];
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          int v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v12 = [v11 applicationProtocolName];
          id v13 = [v11 completion];
          [(DataStreamController *)self _createStreamSocketWithStreamProtocol:v5 applicationProtocolName:v12 completion:v13];
        }
        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    id v14 = [(DataStreamController *)self pendingSocketRequests];
    [v14 removeAllObjects];
  }
}

- (void)_failPendingSocketRequestsWithError:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = [(DataStreamController *)self pendingSocketRequests];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v12 + 1) + 8 * (void)v9) completion];
        ((void (**)(void, void, id))v10)[2](v10, 0, v4);

        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  int v11 = [(DataStreamController *)self pendingSocketRequests];
  [v11 removeAllObjects];
}

- (id)_getStreamProtocol
{
  uint64_t v3 = +[DataStreamStreamProtocol protocolName];
  id v4 = [(DataStreamController *)self _getActiveProtocolWithName:v3];

  v5 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  uint64_t v8 = v5;
  if (!v7)
  {
    uint64_t v9 = [DataStreamStreamProtocol alloc];
    id v10 = [(DataStreamController *)self defaultDataStream];
    int v11 = [v10 protocolDelegateHandle];
    uint64_t v8 = [(DataStreamStreamProtocol *)v9 initWithDataStream:v11];

    long long v12 = [(DataStreamController *)self defaultDataStream];
    long long v13 = +[DataStreamStreamProtocol protocolName];
    [v12 addProtocol:v8 name:v13];
  }

  return v8;
}

- (void)_createStreamSocketWithStreamProtocol:(id)a3 applicationProtocolName:(id)a4 completion:(id)a5
{
  id v8 = a4;
  uint64_t v9 = self;
  id v10 = (void (**)(id, id, void))a5;
  id v11 = a3;
  long long v12 = sub_100083F74();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    long long v13 = sub_100083FD0(v9);
    int v17 = 138543618;
    long long v18 = v13;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}@Creating stream socket for application protocol %@", (uint8_t *)&v17, 0x16u);
  }
  long long v14 = [DataStreamSocket alloc];
  long long v15 = [(DataStreamController *)v9 workQueue];
  long long v16 = [(DataStreamSocket *)v14 initWithStreamProtocol:v11 applicationProtocolName:v8 workQueue:v15];

  [v11 registerSocket:v16];
  v10[2](v10, v16, 0);
}

- (BOOL)setupRequiresCharactertisticReads
{
  if ([(DataStreamController *)self _isDataStreamCapable]) {
    return 0;
  }
  if (![(DataStreamController *)self _isDataStreamConfigurationValid])
  {
    uint64_t v3 = self;
    id v4 = sub_100083F74();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = sub_100083FD0(v3);
      int v7 = 138543362;
      id v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%{public}@Current data stream configuration is not valid", (uint8_t *)&v7, 0xCu);
    }
  }
  return ![(DataStreamController *)self _isDataStreamCapable];
}

- (void)_initiateStreamSetup
{
  uint64_t v3 = [(DataStreamController *)self setupInProgress];

  if (v3)
  {
    id v4 = self;
    v5 = sub_100083F74();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = sub_100083FD0(v4);
      int v16 = 138543362;
      int v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%{public}@Initiating stream setup while already in progress; ignoring this extra call.",
        (uint8_t *)&v16,
        0xCu);
LABEL_11:
    }
  }
  else
  {
    BOOL v7 = [(DataStreamController *)self setupRequiresCharactertisticReads];
    id v4 = [(DataStreamController *)self accessory];
    v5 = [(DataStreamController *)self transferManagementService];
    if ([(DataStreamController *)self supportsDataStreamOverHAP] || v7)
    {
      long long v12 = [(DataStreamController *)self workQueue];
      long long v13 = [(DataStreamController *)self logIdentifier];
      long long v14 = +[DataStreamSetupOperation hapSetupOperationWithAccessory:v4 queue:v12 logIdentifier:v13 transferManagementService:v5 maxControllerTransportMTU:[(DataStreamController *)self maxControllerTransportMTU] setupOperationReadRequired:v7];
      [(DataStreamController *)self setSetupInProgress:v14];

      long long v15 = [(DataStreamController *)self setupInProgress];
      [v15 setDelegate:self];

      if (!v7)
      {
        id v6 = [(DataStreamController *)self setupInProgress];
        [v6 startSetup];
        goto LABEL_11;
      }
    }
    else
    {
      id v8 = self;
      uint64_t v9 = sub_100083F74();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = sub_100083FD0(v8);
        int v16 = 138543362;
        int v17 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to create new DataStream; not supported",
          (uint8_t *)&v16,
          0xCu);
      }
      id v11 = +[NSError dkErrorWithCode:1];
      [(DataStreamController *)v8 _cancelStreamTransportWithError:v11];
    }
  }
}

- (void)dataStreamInitializationSetupOperation:(id)a3 didCompleteSupportReadWithStatus:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(DataStreamController *)self setupInProgress];

  if (v7 != v6)
  {
    id v8 = self;
    uint64_t v9 = sub_100083F74();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = sub_100083FD0(v8);
      int v15 = 138543362;
      int v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%{public}@Setup init operation succeeded however is no longer the current one; ignoring its result.",
        (uint8_t *)&v15,
        0xCu);
    }
    goto LABEL_9;
  }
  if (v4) {
    [(DataStreamController *)self _handleAccessoryConnected];
  }
  if ([(DataStreamController *)self _isDataStreamCapable])
  {
    [v6 setMaxControllerTransportMTU:self->_maxControllerTransportMTU];
    id v8 = [(DataStreamController *)self setupInProgress];
    [(DataStreamController *)v8 startSetup];
LABEL_9:

    goto LABEL_10;
  }
  id v11 = self;
  long long v12 = sub_100083F74();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    long long v13 = sub_100083FD0(v11);
    int v15 = 138543362;
    int v16 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}@Canceling DataStream initialization setup (which is in progress)", (uint8_t *)&v15, 0xCu);
  }
  [(DataStreamController *)v11 setSetupInProgress:0];
  long long v14 = +[NSError dkErrorWithCode:4];
  [(DataStreamController *)v11 _failPendingSocketRequestsWithError:v14];

LABEL_10:
}

- (void)dataStreamSetupOperation:(id)a3 didSucceedWithTransport:(id)a4 sessionEncryption:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(DataStreamController *)self setupInProgress];

  if (v11 == v10)
  {
    int v15 = [(DataStreamController *)self dataStreamFactory];
    int v16 = [(DataStreamController *)self workQueue];
    int v17 = [(DataStreamController *)self logIdentifier];
    long long v18 = ((void (**)(void, id, id, void *, void *))v15)[2](v15, v8, v9, v16, v17);

    [(DataStreamController *)self setDefaultDataStream:v18];
    __int16 v19 = [(DataStreamController *)self defaultDataStream];
    [v19 setDelegate:self];

    [v8 setDelegate:v18];
    [(DataStreamController *)self _createBulkStreamProtocol];
    [v18 connect];
    [(DataStreamController *)self setSetupInProgress:0];
  }
  else
  {
    long long v12 = self;
    long long v13 = sub_100083F74();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      long long v14 = sub_100083FD0(v12);
      int v20 = 138543362;
      objc_super v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%{public}@Setup operation succeeded however is no longer the current one; ignoring its result.",
        (uint8_t *)&v20,
        0xCu);
    }
  }
}

- (void)dataStreamSetupOperation:(id)a3 didFailWithError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DataStreamController *)self setupInProgress];

  if (v8 == v7)
  {
    id v9 = self;
    id v10 = sub_100083F74();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = sub_100083FD0(v9);
      int v12 = 138543362;
      long long v13 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}@Canceling DataStream setup (which is in progress)", (uint8_t *)&v12, 0xCu);
    }
    [(DataStreamController *)v9 setSetupInProgress:0];
    [(DataStreamController *)v9 _failPendingSocketRequestsWithError:v6];
  }
}

- (void)_cancelStreamTransportWithError:(id)a3
{
  id v4 = a3;
  v5 = [(DataStreamController *)self setupInProgress];

  id v6 = self;
  id v7 = sub_100083F74();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v8)
    {
      id v9 = sub_100083FD0(v6);
      int v13 = 138543362;
      long long v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@Canceling DataStream setup", (uint8_t *)&v13, 0xCu);
    }
    id v10 = [(DataStreamController *)v6 setupInProgress];
    [v10 cancelSetup];

    [(DataStreamController *)v6 _failPendingSocketRequestsWithError:v4];
    [(DataStreamController *)v6 setSetupInProgress:0];
  }
  else
  {
    if (v8)
    {
      id v11 = sub_100083FD0(v6);
      int v13 = 138543362;
      long long v14 = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@Canceling active DataStream", (uint8_t *)&v13, 0xCu);
    }
    int v12 = [(DataStreamController *)v6 defaultDataStream];
    [v12 invalidate];
  }
}

- (void)_createBulkStreamProtocol
{
  uint64_t v3 = [DataStreamBulkSendProtocol alloc];
  id v4 = [(DataStreamController *)self workQueue];
  v5 = [(DataStreamController *)self accessory];
  id v6 = [(DataStreamController *)self logIdentifier];
  int v12 = [(DataStreamBulkSendProtocol *)v3 initWithQueue:v4 accessory:v5 logIdentifier:v6];

  id v7 = [(DataStreamController *)self defaultDataStream];
  BOOL v8 = +[DataStreamBulkSendProtocol protocolName];
  [v7 addProtocol:v12 name:v8];

  id v9 = [(DataStreamController *)self defaultDataStream];
  id v10 = [v9 protocolDelegateHandle];
  [(DataStreamBulkSendProtocol *)v12 setDataStream:v10];

  id v11 = [(DataStreamController *)self setupInProgress];
  [v11 movePendingBulkSendListenersToBulkSendProtocol:v12];
}

- (void)_resetDefaultDataStream
{
  [(DataStreamController *)self setDefaultDataStream:0];
  id v3 = +[NSError dkErrorWithCode:33];
  [(DataStreamController *)self _failPendingSocketRequestsWithError:v3];
}

- (void)dataStream:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  id v6 = self;
  id v7 = sub_100083F74();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    BOOL v8 = sub_100083FD0(v6);
    int v9 = 138543618;
    id v10 = v8;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}@DataStream failed with error (%@)!", (uint8_t *)&v9, 0x16u);
  }
  [(DataStreamController *)v6 _resetDefaultDataStream];
}

- (void)dataStreamDidClose:(id)a3
{
  id v3 = self;
  id v4 = sub_100083F74();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = sub_100083FD0(v3);
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@DataStream closed", (uint8_t *)&v6, 0xCu);
  }
  [(DataStreamController *)v3 _resetDefaultDataStream];
}

- (void)dataStreamDidOpen:(id)a3
{
  id v3 = self;
  id v4 = sub_100083F74();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = sub_100083FD0(v3);
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@DataStream opened", (uint8_t *)&v6, 0xCu);
  }
  [(DataStreamController *)v3 _processPendingSocketRequests];
}

- (void)dataStreamDidReceiveRawFrame:(id)a3
{
  id v3 = self;
  id v4 = sub_100083F74();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = sub_100083FD0(v3);
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@dataStreamDidReceiveRawFrame", (uint8_t *)&v6, 0xCu);
  }
}

- (void)dataStreamDidUpdateActiveStatus:(id)a3
{
  id v4 = [(DataStreamController *)self workQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(DataStreamController *)self defaultDataStream];
  unsigned int v6 = [v5 isActive];

  if (v6)
  {
    [(DataStreamController *)self _stopIdleTimer];
  }
  else
  {
    [(DataStreamController *)self _startIdleTimer];
  }
}

- (void)openBulkSendSessionForFileType:(id)a3 reason:(id)a4 metadata:(id)a5 queue:(id)a6 callback:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  int v17 = [(DataStreamController *)self workQueue];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100092BBC;
  v23[3] = &unk_100274720;
  v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  id v22 = v16;
  dispatch_async(v17, v23);
}

- (void)invalidate
{
  id v3 = [(DataStreamController *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100092DD8;
  block[3] = &unk_100273018;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_startIdleTimer
{
  id v3 = [(DataStreamController *)self workQueue];
  dispatch_assert_queue_V2(v3);

  [(DataStreamController *)self _stopIdleTimer];
  id v4 = self;
  id v5 = sub_100083F74();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unsigned int v6 = sub_100083FD0(v4);
    int v18 = 138543362;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@Starting idle timer", (uint8_t *)&v18, 0xCu);
  }
  id v7 = +[HMFPreferences sharedPreferences];
  BOOL v8 = [v7 preferenceForKey:@"hdsIdleTimeout"];

  int v9 = [v8 numberValue];

  if (v9)
  {
    id v10 = [v8 numberValue];
    [v10 doubleValue];
    double v12 = v11;
  }
  else
  {
    double v12 = 5.0;
  }
  id v13 = [objc_alloc((Class)HMFTimer) initWithTimeInterval:1 options:v12];
  [(DataStreamController *)v4 setIdleTimer:v13];

  id v14 = [(DataStreamController *)v4 idleTimer];
  [v14 setDelegate:v4];

  id v15 = [(DataStreamController *)v4 workQueue];
  id v16 = [(DataStreamController *)v4 idleTimer];
  [v16 setDelegateQueue:v15];

  int v17 = [(DataStreamController *)v4 idleTimer];
  [v17 resume];
}

- (void)_stopIdleTimer
{
  id v3 = [(DataStreamController *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(DataStreamController *)self idleTimer];

  if (v4)
  {
    id v5 = self;
    unsigned int v6 = sub_100083F74();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = sub_100083FD0(v5);
      int v9 = 138543362;
      id v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@Stopping idle timer", (uint8_t *)&v9, 0xCu);
    }
    BOOL v8 = [(DataStreamController *)v5 idleTimer];
    [v8 suspend];

    [(DataStreamController *)v5 setIdleTimer:0];
  }
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  id v5 = [(DataStreamController *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(DataStreamController *)self idleTimer];

  if (v6 == v4)
  {
    id v7 = self;
    BOOL v8 = sub_100083F74();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = sub_100083FD0(v7);
      id v10 = [(DataStreamController *)v7 defaultDataStream];
      unsigned int v11 = [v10 isActive];
      CFStringRef v12 = @"inactive";
      if (v11) {
        CFStringRef v12 = @"active";
      }
      int v16 = 138543618;
      int v17 = v9;
      __int16 v18 = 2112;
      CFStringRef v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@Idle timer fired and data stream is %@", (uint8_t *)&v16, 0x16u);
    }
    id v13 = [(DataStreamController *)v7 defaultDataStream];
    unsigned __int8 v14 = [v13 isActive];

    if ((v14 & 1) == 0)
    {
      id v15 = [(DataStreamController *)v7 defaultDataStream];
      [v15 close];
    }
    [(DataStreamController *)v7 _stopIdleTimer];
  }
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (HAPAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);

  return (HAPAccessory *)WeakRetained;
}

- (void)setAccessory:(id)a3
{
}

- (HAPService)transferManagementService
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transferManagementService);

  return (HAPService *)WeakRetained;
}

- (void)setTransferManagementService:(id)a3
{
}

- (DataStream)defaultDataStream
{
  return self->_defaultDataStream;
}

- (void)setDefaultDataStream:(id)a3
{
}

- (NSMutableArray)pendingSocketRequests
{
  return self->_pendingSocketRequests;
}

- (void)setPendingSocketRequests:(id)a3
{
}

- (DataStreamSetupOperation)setupInProgress
{
  return self->_setupInProgress;
}

- (void)setSetupInProgress:(id)a3
{
}

- (id)dataStreamFactory
{
  return self->_dataStreamFactory;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (BOOL)supportsDataStreamOverHAP
{
  return self->_supportsDataStreamOverHAP;
}

- (void)setSupportsDataStreamOverHAP:(BOOL)a3
{
  self->_supportsDataStreamOverHAP = a3;
}

- (unint64_t)maxControllerTransportMTU
{
  return self->_maxControllerTransportMTU;
}

- (void)setMaxControllerTransportMTU:(unint64_t)a3
{
  self->_maxControllerTransportMTU = a3;
}

- (HMFTimer)idleTimer
{
  return self->_idleTimer;
}

- (void)setIdleTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong(&self->_dataStreamFactory, 0);
  objc_storeStrong((id *)&self->_setupInProgress, 0);
  objc_storeStrong((id *)&self->_pendingSocketRequests, 0);
  objc_storeStrong((id *)&self->_defaultDataStream, 0);
  objc_destroyWeak((id *)&self->_transferManagementService);
  objc_destroyWeak((id *)&self->_accessory);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end