@interface CLDurianUpdaterPlugin
- (ASAsset)candidateAssetToUpdate;
- (CLDurianMobileAssetUpdater)clDurianMobileAssetUpdater;
- (CLDurianUpdaterPlugin)initWithCoder:(id)a3;
- (CLDurianUpdaterPlugin)initWithDeviceClass:(id)a3 delegate:(id)a4 info:(id *)a5 options:(id)a6;
- (CLFindMyAccessoryFirmwareUpdateManager)clFirmwareUpdateManager;
- (FudPluginDelegate)fudPluginDelegate;
- (NSArray)candidateBeaconsToUpdate;
- (SPBeacon)candidateBeaconToUpdate;
- (SPFirmwareUpdateSessionProtocol)spFirmwareUpdateSession;
- (id)spFirmwareUpdateStateToString:(int64_t)a3;
- (unsigned)candidatePersonalizationState;
- (void)applyFirmwareWithOptions:(id)a3;
- (void)bootstrapWithOptions:(id)a3;
- (void)downloadFirmwareWithOptions:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)findFirmwareWithOptions:(id)a3 remote:(BOOL)a4;
- (void)findMyAccessoryFirmwareUpdateManager:(id)a3 didFailWithError:(id)a4 forDevice:(id)a5;
- (void)findMyAccessoryFirmwareUpdateManager:(id)a3 firmwareUpdateRequestForDevice:(id)a4 completedWithError:(id)a5;
- (void)findMyAccessoryFirmwareUpdateManager:(id)a3 personalizationRequestForDevice:(id)a4 completedWithInfo:(id)a5 andError:(id)a6;
- (void)finishWithOptions:(id)a3;
- (void)getCandidateBeaconsToUpdate;
- (void)notifySPFirmwareUpdateState:(int64_t)a3 error:(id)a4;
- (void)personalizationResponse:(id)a3 response:(id)a4 status:(id)a5;
- (void)prepareFirmwareWithOptions:(id)a3;
- (void)queryDeviceList:(id *)a3;
- (void)setCandidateAssetToUpdate:(id)a3;
- (void)setCandidateBeaconToUpdate:(id)a3;
- (void)setCandidateBeaconsToUpdate:(id)a3;
- (void)setCandidatePersonalizationState:(unsigned __int8)a3;
- (void)setClDurianMobileAssetUpdater:(id)a3;
- (void)setClFirmwareUpdateManager:(id)a3;
- (void)setFudPluginDelegate:(id)a3;
- (void)setSpFirmwareUpdateSession:(id)a3;
@end

@implementation CLDurianUpdaterPlugin

- (CLDurianUpdaterPlugin)initWithDeviceClass:(id)a3 delegate:(id)a4 info:(id *)a5 options:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "#durian Initializing CLDurianUpdaterPlugin - options: %@", buf, 0xCu);
  }
  v19.receiver = self;
  v19.super_class = (Class)CLDurianUpdaterPlugin;
  v12 = [(CLDurianUpdaterPlugin *)&v19 init];
  v13 = v12;
  if (v12)
  {
    [(CLDurianUpdaterPlugin *)v12 setFudPluginDelegate:v10];
    v14 = objc_alloc_init(CLDurianMobileAssetUpdater);
    [(CLDurianUpdaterPlugin *)v13 setClDurianMobileAssetUpdater:v14];

    id v15 = [objc_alloc((Class)CLFindMyAccessoryFirmwareUpdateManager) initWithDelegate:v13 delegateQueue:0];
    [(CLDurianUpdaterPlugin *)v13 setClFirmwareUpdateManager:v15];

    v16 = objc_opt_new();
    v17 = [v16 firmwareUpdateSession];
    [(CLDurianUpdaterPlugin *)v13 setSpFirmwareUpdateSession:v17];

    [(CLDurianUpdaterPlugin *)v13 getCandidateBeaconsToUpdate];
  }

  return v13;
}

- (void)bootstrapWithOptions:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "#durian Bootstrapping and resolving AUDAccessory to SPBeacon - options: %@", buf, 0xCu);
  }
  v22 = v4;
  v5 = [v4 objectForKey:@"AccessoryOption"];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v6 = [(CLDurianUpdaterPlugin *)self candidateBeaconsToUpdate];
  id v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v24;
    id v21 = self;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "identifier", v21);
        v13 = [v12 UUIDString];
        v14 = [v5 uid];
        unsigned int v15 = [v13 isEqual:v14];

        if (v15)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "#durian Resolved AUDAccessory to SPBeacon!", buf, 2u);
          }
          self = v21;
          [(CLDurianUpdaterPlugin *)v21 setCandidateBeaconToUpdate:v11];
          v16 = [(CLDurianUpdaterPlugin *)v21 clDurianMobileAssetUpdater];
          v17 = [(CLDurianUpdaterPlugin *)v21 candidateBeaconToUpdate];
          v18 = [v17 systemVersion];
          [v16 setCurrentSystemVersion:v18];

          goto LABEL_15;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
      self = v21;
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  objc_super v19 = [(CLDurianUpdaterPlugin *)self fudPluginDelegate];
  v20 = [(CLDurianUpdaterPlugin *)self candidateBeaconToUpdate];
  [v19 didBootstrap:v20 != 0 info:0 error:0];
}

- (void)findFirmwareWithOptions:(id)a3 remote:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v11 = v6;
    __int16 v12 = 1024;
    BOOL v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "#durian Querying MobileAsset for FW - options: %@, searchRemote: %d", buf, 0x12u);
  }
  id v7 = [(CLDurianUpdaterPlugin *)self clDurianMobileAssetUpdater];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000050E4;
  v9[3] = &unk_10000C250;
  v9[4] = self;
  id v8 = [v7 findAsset:v4 completion:v9];
}

- (void)downloadFirmwareWithOptions:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "#durian Downloading firmware - options: %@", buf, 0xCu);
  }
  v5 = [(CLDurianUpdaterPlugin *)self clDurianMobileAssetUpdater];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000538C;
  v7[3] = &unk_10000C250;
  v7[4] = self;
  id v6 = [v5 downloadAsset:v7];
}

- (void)prepareFirmwareWithOptions:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "#durian Preparing firmware - options: %@", (uint8_t *)&v7, 0xCu);
  }
  v5 = [(CLDurianUpdaterPlugin *)self clDurianMobileAssetUpdater];
  [v5 splitSuperBinary];

  id v6 = [(CLDurianUpdaterPlugin *)self fudPluginDelegate];
  [v6 didPrepare:1 info:0 error:0];
}

- (void)applyFirmwareWithOptions:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "#durian Applying firmware and getting personalization information - options: %@", (uint8_t *)&v7, 0xCu);
  }
  v5 = [(CLDurianUpdaterPlugin *)self clFirmwareUpdateManager];
  id v6 = [(SPBeacon *)self->_candidateBeaconToUpdate identifier];
  [v5 getPersonalizationInfoForDevice:v6];
}

- (void)finishWithOptions:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "#durian Finished firmware download - options: %@", (uint8_t *)&v6, 0xCu);
  }
  v5 = [(CLDurianUpdaterPlugin *)self fudPluginDelegate];
  [v5 didFinish:1 info:0 error:0];
}

- (void)encodeWithCoder:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "#durian Encoding with a coder?", v3, 2u);
  }
}

- (CLDurianUpdaterPlugin)initWithCoder:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "#durian Initializing with a coder?", v5, 2u);
  }

  return 0;
}

- (void)queryDeviceList:(id *)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "#durian Querying the device list", buf, 2u);
  }
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = [(CLDurianUpdaterPlugin *)self candidateBeaconsToUpdate];
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v11 = objc_alloc((Class)AUDAccessory);
        __int16 v12 = [v10 identifier];
        BOOL v13 = [v12 UUIDString];
        id v14 = [v11 initWithUID:v13];

        unsigned int v15 = [v10 systemVersion];
        [v14 setFwVersion:v15];

        [v4 addObject:v14];
      }
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v7);
  }

  id v16 = v4;
  *a3 = v16;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = *a3;
    *(_DWORD *)buf = 138412290;
    id v24 = v17;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "#durian Sending FUD the accessory list: %@", buf, 0xCu);
  }
}

- (void)personalizationResponse:(id)a3 response:(id)a4 status:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412546;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "#durian Received personalization response from FUD - responseData: %@ status: %@", (uint8_t *)&v19, 0x16u);
  }
  if ([(CLDurianUpdaterPlugin *)self candidatePersonalizationState] == 1)
  {
    if (v10)
    {
      [(CLDurianUpdaterPlugin *)self notifySPFirmwareUpdateState:1 error:v10];
      id v11 = [(CLDurianUpdaterPlugin *)self fudPluginDelegate];
      [v11 didApply:0 info:0 error:v10];
    }
    else
    {
      __int16 v12 = [(CLDurianUpdaterPlugin *)self clDurianMobileAssetUpdater];
      id v11 = [v12 getAssetURL];

      BOOL v13 = [v11 URLByAppendingPathComponent:@"r1md"];
      id v14 = [v13 URLByAppendingPathExtension:@"bin"];
      unsigned int v15 = [v14 path];
      [v9 writeToFile:v15 atomically:0];

      id v16 = [(CLDurianUpdaterPlugin *)self clFirmwareUpdateManager];
      id v17 = [(CLDurianUpdaterPlugin *)self candidateBeaconToUpdate];
      v18 = [v17 identifier];
      [v16 updateFirmwareForDevice:v18 withAssetURL:v11];
    }
  }
}

- (void)findMyAccessoryFirmwareUpdateManager:(id)a3 didFailWithError:(id)a4 forDevice:(id)a5
{
  id v7 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100007F18((uint64_t)v7, (uint64_t)a5);
  }
  [(CLDurianUpdaterPlugin *)self notifySPFirmwareUpdateState:1 error:v7];
  id v8 = [(CLDurianUpdaterPlugin *)self fudPluginDelegate];
  [v8 didApply:0 info:0 error:v7];
}

- (void)findMyAccessoryFirmwareUpdateManager:(id)a3 personalizationRequestForDevice:(id)a4 completedWithInfo:(id)a5 andError:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v11;
    __int16 v63 = 2112;
    id v64 = v12;
    __int16 v65 = 2112;
    id v66 = v13;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "#durian Received personalization data from durian - device: %@ personalizationInfo: %@ error: %@", buf, 0x20u);
  }
  if (v13)
  {
    [(CLDurianUpdaterPlugin *)self notifySPFirmwareUpdateState:1 error:v13];
    id v14 = [(CLDurianUpdaterPlugin *)self fudPluginDelegate];
    [v14 didApply:0 info:0 error:v13];
  }
  else
  {
    id v41 = v11;
    id v42 = v10;
    [(CLDurianUpdaterPlugin *)self setCandidatePersonalizationState:1];
    unsigned int v59 = 0;
    unsigned int v15 = [v12 objectForKey:@"7DFC6101-7D1C-4951-86AA-8D9728F8D66C"];
    [v15 getBytes:&v59 length:4];

    unsigned int v58 = 0;
    id v16 = [v12 objectForKey:@"7DFC6102-7D1C-4951-86AA-8D9728F8D66C"];
    [v16 getBytes:&v58 length:4];

    *(void *)buf = 0;
    id v17 = [v12 objectForKey:@"7DFC6103-7D1C-4951-86AA-8D9728F8D66C"];
    [v17 getBytes:buf length:8];

    unsigned int v57 = 0;
    v18 = [v12 objectForKey:@"7DFC6104-7D1C-4951-86AA-8D9728F8D66C"];
    [v18 getBytes:&v57 length:4];

    unsigned __int8 v56 = 0;
    int v19 = [v12 objectForKey:@"7DFC6105-7D1C-4951-86AA-8D9728F8D66C"];
    [v19 getBytes:&v56 length:1];

    unsigned __int8 v55 = 0;
    id v20 = [v12 objectForKey:@"7DFC6106-7D1C-4951-86AA-8D9728F8D66C"];
    [v20 getBytes:&v55 length:1];

    id v40 = v12;
    v39 = [v12 objectForKey:@"7DFC6107-7D1C-4951-86AA-8D9728F8D66C"];
    __int16 v21 = objc_opt_new();
    id v22 = [(CLDurianUpdaterPlugin *)self clDurianMobileAssetUpdater];
    long long v23 = [v22 getBuildIdentities];

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id obj = v23;
    id v45 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
    if (v45)
    {
      uint64_t v44 = *(void *)v52;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v52 != v44) {
            objc_enumerationMutation(obj);
          }
          uint64_t v46 = v24;
          long long v25 = objc_msgSend(*(id *)(*((void *)&v51 + 1) + 8 * v24), "objectForKey:", @"Manifest", v39);
          long long v47 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          id v26 = [v25 countByEnumeratingWithState:&v47 objects:v60 count:16];
          if (v26)
          {
            id v27 = v26;
            uint64_t v28 = *(void *)v48;
            do
            {
              for (i = 0; i != v27; i = (char *)i + 1)
              {
                if (*(void *)v48 != v28) {
                  objc_enumerationMutation(v25);
                }
                uint64_t v30 = *(void *)(*((void *)&v47 + 1) + 8 * i);
                v31 = [v25 objectForKey:v30];
                id v32 = [objc_alloc((Class)FudPersonalizationObjectInfo) initWithTag:v30];
                v33 = [v31 objectForKey:@"Trusted"];
                objc_msgSend(v32, "setTrusted:", objc_msgSend(v33, "BOOLValue"));

                v34 = [v31 objectForKey:@"Digest"];
                [v32 setDigest:v34];

                [v32 setEffectiveSecurityMode:v56];
                [v32 setEffectiveProductionMode:v55];
                [v21 addObject:v32];
              }
              id v27 = [v25 countByEnumeratingWithState:&v47 objects:v60 count:16];
            }
            while (v27);
          }

          uint64_t v24 = v46 + 1;
        }
        while ((id)(v46 + 1) != v45);
        id v45 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
      }
      while (v45);
    }

    id v35 = [objc_alloc((Class)FudPersonalizationRequest) initWithName:@"Durian"];
    [v35 setResponseFormat:1];
    [v35 setResponseAlignment:4096];
    [v35 setChipID:v59];
    [v35 setBoardID:v58];
    [v35 setEcID:*(void *)buf];
    [v35 setSecurityDomain:v57];
    [v35 setSecurityMode:v56];
    [v35 setProductionMode:v55];
    [v35 setNonceHash:v39];
    [v35 setObjectList:v21];
    [v35 setRequestPrefix:@"Rap"];
    v36 = [(CLDurianUpdaterPlugin *)self clDurianMobileAssetUpdater];
    v37 = [v36 getFTAB];
    [v35 setPayload:v37];

    v38 = [(CLDurianUpdaterPlugin *)self fudPluginDelegate];
    [v38 personalizationRequest:v35];

    id v11 = v41;
    id v10 = v42;
    id v13 = 0;
    id v12 = v40;
  }
}

- (void)findMyAccessoryFirmwareUpdateManager:(id)a3 firmwareUpdateRequestForDevice:(id)a4 completedWithError:(id)a5
{
  id v7 = a5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = a4;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "#durian Firmware update to durian completed - device: %@ error: %@", (uint8_t *)&v10, 0x16u);
  }
  [(CLDurianUpdaterPlugin *)self setCandidatePersonalizationState:2];
  if (v7) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = 2;
  }
  [(CLDurianUpdaterPlugin *)self notifySPFirmwareUpdateState:v8 error:v7];
  id v9 = [(CLDurianUpdaterPlugin *)self fudPluginDelegate];
  [v9 didApply:v7 == 0 info:0 error:v7];
}

- (void)getCandidateBeaconsToUpdate
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = [(CLDurianUpdaterPlugin *)self spFirmwareUpdateSession];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100006408;
  v6[3] = &unk_10000C278;
  v6[4] = self;
  dispatch_semaphore_t v7 = v3;
  v5 = v3;
  [v4 candidateBeaconsWithCompletion:v6];

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)notifySPFirmwareUpdateState:(int64_t)a3 error:(id)a4
{
  id v6 = a4;
  if (a3 == 2)
  {
    dispatch_semaphore_t v7 = [(CLDurianUpdaterPlugin *)self clDurianMobileAssetUpdater];
    uint64_t v8 = [v7 getUpdatedSystemVersion];
  }
  else
  {
    uint64_t v8 = 0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(CLDurianUpdaterPlugin *)self spFirmwareUpdateStateToString:a3];
    int v13 = 138412546;
    id v14 = v9;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "#durian Signaling SPFirmwareUpdateState to %@ and system version %@", (uint8_t *)&v13, 0x16u);
  }
  int v10 = [(CLDurianUpdaterPlugin *)self spFirmwareUpdateSession];
  id v11 = [(CLDurianUpdaterPlugin *)self candidateBeaconToUpdate];
  __int16 v12 = [v11 identifier];
  [v10 updateBeaconUUID:v12 firmwareUpdateState:a3 systemVersion:v8 error:v6 completion:&stru_10000C2B8];
}

- (id)spFirmwareUpdateStateToString:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 6) {
    return @"FIRMWARE_UPDATE_STATE_INVALID";
  }
  else {
    return off_10000C2D8[a3 + 1];
  }
}

- (FudPluginDelegate)fudPluginDelegate
{
  return self->_fudPluginDelegate;
}

- (void)setFudPluginDelegate:(id)a3
{
}

- (CLDurianMobileAssetUpdater)clDurianMobileAssetUpdater
{
  return self->_clDurianMobileAssetUpdater;
}

- (void)setClDurianMobileAssetUpdater:(id)a3
{
}

- (CLFindMyAccessoryFirmwareUpdateManager)clFirmwareUpdateManager
{
  return self->_clFirmwareUpdateManager;
}

- (void)setClFirmwareUpdateManager:(id)a3
{
}

- (SPFirmwareUpdateSessionProtocol)spFirmwareUpdateSession
{
  return self->_spFirmwareUpdateSession;
}

- (void)setSpFirmwareUpdateSession:(id)a3
{
}

- (NSArray)candidateBeaconsToUpdate
{
  return self->_candidateBeaconsToUpdate;
}

- (void)setCandidateBeaconsToUpdate:(id)a3
{
}

- (SPBeacon)candidateBeaconToUpdate
{
  return self->_candidateBeaconToUpdate;
}

- (void)setCandidateBeaconToUpdate:(id)a3
{
}

- (ASAsset)candidateAssetToUpdate
{
  return self->_candidateAssetToUpdate;
}

- (void)setCandidateAssetToUpdate:(id)a3
{
}

- (unsigned)candidatePersonalizationState
{
  return self->_candidatePersonalizationState;
}

- (void)setCandidatePersonalizationState:(unsigned __int8)a3
{
  self->_candidatePersonalizationState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateAssetToUpdate, 0);
  objc_storeStrong((id *)&self->_candidateBeaconToUpdate, 0);
  objc_storeStrong((id *)&self->_candidateBeaconsToUpdate, 0);
  objc_storeStrong((id *)&self->_spFirmwareUpdateSession, 0);
  objc_storeStrong((id *)&self->_clFirmwareUpdateManager, 0);
  objc_storeStrong((id *)&self->_clDurianMobileAssetUpdater, 0);
  objc_storeStrong((id *)&self->_fudPluginDelegate, 0);
}

@end