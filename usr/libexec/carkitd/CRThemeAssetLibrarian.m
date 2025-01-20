@interface CRThemeAssetLibrarian
+ (unint64_t)_supportedCompatibilityVersion;
- (CARSessionStatus)sessionStatus;
- (CARThemeAssetLibraryAgent)libraryAgent;
- (CRFileSender)fileSenderSession;
- (CRThemeAssetDownloader)assetDownloader;
- (CRThemeAssetLibrarian)initWithLibraryAgent:(id)a3 vehicleStore:(id)a4 sessionStatus:(id)a5;
- (CRVehicleStore)vehicleStore;
- (NSMutableDictionary)assetProgressForVehicleIdentifiers;
- (id)_assetProgressForVehicle:(id)a3;
- (id)_assetRequestForVehicle:(id)a3;
- (id)_assetVersionForVehicle:(id)a3;
- (id)_mainQueue_vehicleForSession:(id)a3;
- (id)_stagedAssetVersionForVehicle:(id)a3;
- (id)_vehicleForVehicleIdentifier:(id)a3;
- (id)_vehiclesForAssetRequest:(id)a3;
- (id)assetProgressForVehicle:(id)a3;
- (unint64_t)currentSessionTransferStatus;
- (void)_mainQueue_evaluateAssetTransferIfConnected;
- (void)_mainQueue_handleVehiclesChanged;
- (void)_mainQueue_hintDownloadForVehicle:(id)a3;
- (void)_mainQueue_invalidateFileSenderSession;
- (void)_mainQueue_removeOlderAssets;
- (void)_mainQueue_updateAssetRequests;
- (void)_removeAssetProgressForVehicleIdentifier:(id)a3;
- (void)assetDownloader:(id)a3 attemptingDownloadForAssetRequest:(id)a4 version:(id)a5 progress:(id)a6;
- (void)assetDownloader:(id)a3 failedDownloadForAssetRequest:(id)a4 version:(id)a5 error:(id)a6;
- (void)assetDownloader:(id)a3 hasAsset:(id)a4 forAssetRequest:(id)a5;
- (void)libraryAgent:(id)a3 receivedOverrideAsset:(id)a4 forVehicleIdentifier:(id)a5;
- (void)libraryAgent:(id)a3 requestsCurrentAssetsForVehicleIdentifier:(id)a4 completion:(id)a5;
- (void)receivedClusterAssetIdentifier:(id)a3 assetVersion:(id)a4 sdkVersion:(id)a5 forVehicle:(id)a6;
- (void)sessionDidConnect:(id)a3;
- (void)sessionDidDisconnect:(id)a3;
- (void)setCurrentSessionTransferStatus:(unint64_t)a3;
- (void)setFileSenderSession:(id)a3;
- (void)vehicleStore:(id)a3 didRemoveVehicle:(id)a4;
- (void)vehicleStoreDidBecomeAvailable:(id)a3;
@end

@implementation CRThemeAssetLibrarian

+ (unint64_t)_supportedCompatibilityVersion
{
  v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 0);
  v3 = [v2 objectAtIndex:0];

  v4 = [v3 stringByAppendingPathComponent:@"PrivateFrameworks/CarPlayAssetUI.framework"];
  v5 = +[NSBundle bundleWithPath:v4];
  v6 = [v5 infoDictionary];
  v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    v9 = CarThemeAssetsLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100075048();
    }
    goto LABEL_15;
  }
  v9 = [v6 valueForKey:@"MaximumAssetCompatibilityVersion"];
  v10 = CarThemeAssetsLogging();
  v11 = v10;
  if (!v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10007507C();
    }

LABEL_15:
    id v12 = 0;
    goto LABEL_16;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "MaximumAssetCompatibilityVersion is %@", (uint8_t *)&v14, 0xCu);
  }

  id v12 = [v9 unsignedIntegerValue];
LABEL_16:

  return (unint64_t)v12;
}

- (CRThemeAssetLibrarian)initWithLibraryAgent:(id)a3 vehicleStore:(id)a4 sessionStatus:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CRThemeAssetLibrarian;
  id v12 = [(CRThemeAssetLibrarian *)&v21 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_libraryAgent, a3);
    objc_storeStrong((id *)&v13->_vehicleStore, a4);
    [v10 addObserver:v13];
    objc_storeStrong((id *)&v13->_sessionStatus, a5);
    [v11 addSessionObserver:v13];
    int v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    assetProgressForVehicleIdentifiers = v13->_assetProgressForVehicleIdentifiers;
    v13->_assetProgressForVehicleIdentifiers = v14;

    v16 = objc_alloc_init(CRThemeAssetDownloader);
    assetDownloader = v13->_assetDownloader;
    v13->_assetDownloader = v16;

    [(CRThemeAssetDownloader *)v13->_assetDownloader setDownloadObserver:v13];
    v13->_currentSessionTransferStatus = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000496CC;
    block[3] = &unk_1000BD1B0;
    v20 = v13;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  return v13;
}

- (void)_mainQueue_updateAssetRequests
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (+[CRVehicleStoreAvailability isVehicleStoreAvailable])
  {
    id v3 = objc_alloc_init((Class)NSMutableSet);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v4 = [(CRThemeAssetLibrarian *)self vehicleStore];
    v5 = [v4 allStoredVehicles];

    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [(CRThemeAssetLibrarian *)self _assetRequestForVehicle:*(void *)(*((void *)&v12 + 1) + 8 * (void)v9)];
          if (v10) {
            [v3 addObject:v10];
          }

          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    id v11 = [(CRThemeAssetLibrarian *)self assetDownloader];
    [v11 setAssetRequests:v3];
  }
}

- (id)_mainQueue_vehicleForSession:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v5 = [v4 MFiCertificateSerialNumber];
  if (v5)
  {
    id v6 = [(CRThemeAssetLibrarian *)self vehicleStore];
    id v7 = [v6 vehicleForCertificateSerial:v5];

    if (v7)
    {
      id v7 = v7;
      uint64_t v8 = v7;
    }
    else
    {
      id v9 = CarThemeAssetsLogging();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        id v12 = v4;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "no paired vehicle matching session %@", (uint8_t *)&v11, 0xCu);
      }

      uint64_t v8 = 0;
    }
  }
  else
  {
    id v7 = CarThemeAssetsLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000750B0();
    }
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)_mainQueue_evaluateAssetTransferIfConnected
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v3 = [(CRThemeAssetLibrarian *)self sessionStatus];
  id v4 = [v3 currentSession];

  v5 = CarThemeAssetsLogging();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "evaluate asset transfer: connected", buf, 2u);
    }

    v5 = [(CRThemeAssetLibrarian *)self _mainQueue_vehicleForSession:v4];
    unint64_t v7 = [(CRThemeAssetLibrarian *)self currentSessionTransferStatus];
    switch(v7)
    {
      case 3uLL:
        uint64_t v8 = CarThemeAssetsLogging();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          id v9 = "asset transfer already failed, not trying again";
          goto LABEL_15;
        }
LABEL_47:

        goto LABEL_48;
      case 2uLL:
        uint64_t v8 = CarThemeAssetsLogging();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          id v9 = "asset transfer already completed";
          goto LABEL_15;
        }
        goto LABEL_47;
      case 1uLL:
        uint64_t v8 = CarThemeAssetsLogging();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          id v9 = "asset transfer already in progress";
LABEL_15:
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
          goto LABEL_47;
        }
        goto LABEL_47;
    }
    id v10 = [(CRThemeAssetLibrarian *)self fileSenderSession];

    if (v10) {
      [(CRThemeAssetLibrarian *)self _mainQueue_invalidateFileSenderSession];
    }
    uint64_t v8 = [v5 clusterAssetIdentifier];
    if (!v8)
    {
      int v11 = CarThemeAssetsLogging();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "vehicle doesn't require assets", buf, 2u);
      }
      goto LABEL_46;
    }
    int v11 = [(CRThemeAssetLibrarian *)self _assetVersionForVehicle:v5];
    id v12 = [(CRThemeAssetLibrarian *)self _stagedAssetVersionForVehicle:v5];
    if (v12)
    {
      if ([v11 compare:v12] != (id)-1)
      {
LABEL_45:

LABEL_46:
        goto LABEL_47;
      }
      long long v13 = CarThemeAssetsLogging();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v35 = v12;
        __int16 v36 = 2114;
        v37 = v11;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "staged asset version %{public}@ is newer than vehicle's asset version %{public}@, starting update", buf, 0x16u);
      }

      long long v14 = [v11 accessoryContentVersion];
      v29 = [v12 accessoryContentVersion];
      if ([v14 isEqual:v29])
      {
        long long v15 = CarThemeAssetsLogging();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v35 = v12;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "staged asset accessory content version %{public}@ is the same as the active asset, no need to transfer", buf, 0xCu);
        }
      }
      else
      {
        id v16 = [v14 isEqualToNumber:&off_1000C60B8];
        id v17 = objc_alloc((Class)CARSessionChannel);
        long long v15 = [v17 initWithSession:v4 channelType:kFigEndpointRemoteControlSessionClientTypeUUIDKey_CarPlayUpdateData];
        v27 = [[CRFileSender alloc] initWithChannel:v15 isPriority:v16];
        [(CRThemeAssetLibrarian *)self setFileSenderSession:v27];
        v18 = CarThemeAssetsLogging();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "file transfer channel opened", buf, 2u);
        }

        v28 = [v5 stagedClusterAssetURL];
        if (v28)
        {
          [(CRThemeAssetLibrarian *)self setCurrentSessionTransferStatus:1];
          v19 = CarThemeAssetsLogging();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v35 = v29;
            __int16 v36 = 2112;
            v37 = v28;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "sending version %@ from %@", buf, 0x16u);
          }

          v26 = [objc_alloc((Class)CARThemeAsset) initWithBaseURL:v28 version:v12];
          objc_initWeak(&location, self);
          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472;
          v30[2] = sub_10004A08C;
          v30[3] = &unk_1000BECD0;
          v25 = &v32;
          objc_copyWeak(&v32, &location);
          v31 = v29;
          v20 = [(CRFileSender *)v27 sendThemeAsset:v26 completion:v30];
          if (v20)
          {
            objc_super v21 = -[CRThemeAssetLibrarian _assetProgressForVehicle:](self, "_assetProgressForVehicle:", v5, &v32);
            [v21 addChild:v20 withPendingUnitCount:1];
            v22 = CarThemeAssetsLogging();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v35 = v5;
              __int16 v36 = 2112;
              v37 = v21;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "attempting transfer for vehicle %@, overall progress is now: %@", buf, 0x16u);
            }
          }
          objc_destroyWeak(v25);
          objc_destroyWeak(&location);
          v23 = v26;
        }
        else
        {
          v24 = CarThemeAssetsLogging();
          v23 = v24;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            sub_100075118();
            v23 = v24;
          }
        }
      }
    }
    else
    {
      long long v14 = CarThemeAssetsLogging();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v35 = v11;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "vehicle is using the latest asset version %{public}@, no staged asset available", buf, 0xCu);
      }
    }

    goto LABEL_45;
  }
  if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "evaluate asset transfer: not connected", buf, 2u);
  }
LABEL_48:
}

- (void)_mainQueue_invalidateFileSenderSession
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v3 = [(CRThemeAssetLibrarian *)self fileSenderSession];
  [v3 invalidate];

  [(CRThemeAssetLibrarian *)self setFileSenderSession:0];
}

- (void)_mainQueue_hintDownloadForVehicle:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v5 = [(CRThemeAssetLibrarian *)self _assetRequestForVehicle:v4];

  if (v5)
  {
    BOOL v6 = CarThemeAssetsLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "hinting download request for %@", (uint8_t *)&v8, 0xCu);
    }

    unint64_t v7 = [(CRThemeAssetLibrarian *)self assetDownloader];
    [v7 handleDownloadHintForAssetRequest:v5];
  }
}

- (void)_mainQueue_removeOlderAssets
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v3 = +[NSMutableDictionary dictionary];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [(CRThemeAssetLibrarian *)self vehicleStore];
  v5 = [v4 allStoredVehicles];

  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        int v11 = [v10 clusterAssetIdentifier];
        if (v11)
        {
          id v12 = [(CRThemeAssetLibrarian *)self _assetVersionForVehicle:v10];
          uint64_t v13 = [v3 objectForKey:v11];
          long long v14 = (void *)v13;
          if (v12 && (!v13 || [v12 compare:v13] == (id)-1)) {
            [v3 setObject:v12 forKey:v11];
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10004A5A0;
  v15[3] = &unk_1000BECF8;
  v15[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v15];
}

- (void)_mainQueue_handleVehiclesChanged
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  [(CRThemeAssetLibrarian *)self _mainQueue_updateAssetRequests];
  [(CRThemeAssetLibrarian *)self _mainQueue_evaluateAssetTransferIfConnected];

  [(CRThemeAssetLibrarian *)self _mainQueue_removeOlderAssets];
}

- (void)receivedClusterAssetIdentifier:(id)a3 assetVersion:(id)a4 sdkVersion:(id)a5 forVehicle:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (v13 && ([v13 isPaired] & 1) != 0)
  {
    v65 = self;
    long long v14 = [(CRThemeAssetLibrarian *)self _assetVersionForVehicle:v13];
    uint64_t v15 = [v13 clusterAssetURL];
    uint64_t v16 = v15;
    long long v17 = 0;
    if (v14 && v15) {
      long long v17 = [objc_alloc((Class)CARThemeAsset) initWithBaseURL:v15 version:v14];
    }
    v64 = (void *)v16;
    long long v18 = [v13 supportsThemeAssets];
    BOOL v19 = v18 == 0;

    if (!v18)
    {
      v20 = CarThemeAssetsLogging();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "updating supportsThemeAssets to YES", buf, 2u);
      }

      [v13 setSupportsThemeAssets:&__kCFBooleanTrue];
    }
    objc_super v21 = [v13 clusterAssetIdentifier];
    v22 = v21;
    if (v10 && v21)
    {
      unsigned __int8 v23 = [v21 isEqual:v10];

      if (v23) {
        goto LABEL_20;
      }
    }
    else
    {

      if (!v10) {
        goto LABEL_20;
      }
    }
    v24 = CarThemeAssetsLogging();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = [v13 clusterAssetIdentifier];
      *(_DWORD *)buf = 138543618;
      id v67 = v25;
      __int16 v68 = 2114;
      id v69 = v10;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "updating cluster asset identifier from %{public}@ to %{public}@", buf, 0x16u);
    }
    [v13 setClusterAssetIdentifier:v10];
    BOOL v19 = 1;
LABEL_20:
    v26 = [v13 clusterAssetVersion];
    v27 = v26;
    if (v11 && v26)
    {
      unsigned __int8 v28 = [v26 isEqual:v11];

      if (v28) {
        goto LABEL_28;
      }
    }
    else
    {

      if (!v11) {
        goto LABEL_28;
      }
    }
    v29 = CarThemeAssetsLogging();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = [v13 clusterAssetVersion];
      *(_DWORD *)buf = 138543618;
      id v67 = v30;
      __int16 v68 = 2114;
      id v69 = v11;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "updating cluster asset version from %{public}@ to %{public}@", buf, 0x16u);
    }
    [v13 setClusterAssetVersion:v11];
    BOOL v19 = 1;
LABEL_28:
    v31 = [v13 clusterAssetVersion];
    id v32 = [v13 stagedClusterAssetVersion];
    unsigned int v33 = [v31 isEqual:v32];

    if (v33)
    {
      v34 = CarThemeAssetsLogging();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = [v13 clusterAssetiOSContentVersion];
        __int16 v36 = [v13 stagedClusterAssetiOSContentVersion];
        *(_DWORD *)buf = 138543618;
        id v67 = v35;
        __int16 v68 = 2114;
        id v69 = v36;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "updating cluster iOS content version from %{public}@ to %{public}@", buf, 0x16u);
      }
      BOOL v19 = 1;
    }
    v37 = [v13 SDKVersion];
    v38 = v37;
    if (v12 && v37)
    {
      unsigned __int8 v39 = [v37 isEqual:v12];

      if (v39) {
        goto LABEL_35;
      }
    }
    else
    {

      if (!v12)
      {
LABEL_35:
        if (!v19)
        {
          v40 = CarGeneralLogging();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "saved vehicle already has current cluster information", buf, 2u);
          }
          v41 = v64;
LABEL_61:

          goto LABEL_62;
        }
LABEL_43:
        v63 = v14;
        v44 = CarGeneralLogging();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v67 = v13;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Saving vehicle %@ to update cluster information", buf, 0xCu);
        }
        id v62 = v10;

        uint64_t v45 = [v13 stagedClusterAssetiOSContentVersion];
        uint64_t v46 = [v13 stagedClusterAssetVersion];
        uint64_t v47 = [v13 stagedClusterAssetURL];
        v48 = (void *)v47;
        if (v46 && v47)
        {
          id v49 = [v11 compare:v46];
          if (v49)
          {
            if (v49 == (id)-1)
            {
              v50 = CarThemeAssetsLogging();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
                sub_1000752DC();
              }
            }
            else
            {
              v56 = CarThemeAssetsLogging();
              if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
                sub_1000752A8();
              }

              [v13 setStagedClusterAssetiOSContentVersion:0];
              [v13 setStagedClusterAssetVersion:0];
              [v13 setStagedClusterAssetURL:0];
            }
          }
          else
          {
            v51 = CarThemeAssetsLogging();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "staged asset is now the current asset, making staged asset the current asset", buf, 2u);
            }

            [v13 setClusterAssetURL:v48];
            [v13 setClusterAssetiOSContentVersion:v45];
            [v13 setStagedClusterAssetiOSContentVersion:0];
            [v13 setStagedClusterAssetVersion:0];
            [v13 setStagedClusterAssetURL:0];
            v61 = [(CRThemeAssetLibrarian *)v65 _assetVersionForVehicle:v13];
            id v52 = [objc_alloc((Class)CARThemeAsset) initWithBaseURL:v48 version:v61];
            v53 = CarThemeAssetsLogging();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v67 = v52;
              _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "updating to asset %@", buf, 0xCu);
            }

            v54 = [(CRThemeAssetLibrarian *)v65 libraryAgent];
            v55 = [v13 identifier];
            [v54 notifyDidUpdateFromAsset:v17 toAsset:v52 forVehicleIdentifier:v55];
          }
        }
        v57 = (void *)v46;
        v58 = v48;
        v40 = v45;
        v59 = [(CRThemeAssetLibrarian *)v65 vehicleStore];
        v60 = [v59 saveVehicle:v13];

        [(CRThemeAssetLibrarian *)v65 _mainQueue_handleVehiclesChanged];
        long long v14 = v63;
        v41 = v64;
        id v10 = v62;
        goto LABEL_61;
      }
    }
    v42 = CarThemeAssetsLogging();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = [v13 SDKVersion];
      *(_DWORD *)buf = 138543618;
      id v67 = v43;
      __int16 v68 = 2114;
      id v69 = v12;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "updating SDK version from %{public}@ to %{public}@", buf, 0x16u);
    }
    [v13 setSDKVersion:v12];
    goto LABEL_43;
  }
  long long v17 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_100075274();
  }
LABEL_62:
}

- (id)assetProgressForVehicle:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v5 = [(CRThemeAssetLibrarian *)self _assetProgressForVehicle:v4];

  id v6 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "overall asset progress: %@", (uint8_t *)&v8, 0xCu);
  }

  return v5;
}

- (void)vehicleStoreDidBecomeAvailable:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004AFA0;
  block[3] = &unk_1000BD1B0;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)vehicleStore:(id)a3 didRemoveVehicle:(id)a4
{
  [a4 identifier:a3];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004B04C;
  v6[3] = &unk_1000BD3A8;
  v6[4] = self;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)sessionDidConnect:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004B100;
  block[3] = &unk_1000BD1B0;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)sessionDidDisconnect:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004B1D8;
  v4[3] = &unk_1000BD3A8;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)assetDownloader:(id)a3 attemptingDownloadForAssetRequest:(id)a4 version:(id)a5 progress:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10004B34C;
  v14[3] = &unk_1000BDEB8;
  v14[4] = self;
  id v15 = v9;
  id v16 = a6;
  id v17 = v10;
  id v11 = v10;
  id v12 = v16;
  id v13 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
}

- (void)assetDownloader:(id)a3 failedDownloadForAssetRequest:(id)a4 version:(id)a5 error:(id)a6
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004B5C0;
  block[3] = &unk_1000BD3D0;
  id v11 = a5;
  id v12 = self;
  id v13 = a6;
  id v8 = v13;
  id v9 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)assetDownloader:(id)a3 hasAsset:(id)a4 forAssetRequest:(id)a5
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004B74C;
  block[3] = &unk_1000BD3D0;
  id v10 = a4;
  id v11 = a5;
  id v12 = self;
  id v7 = v11;
  id v8 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)libraryAgent:(id)a3 requestsCurrentAssetsForVehicleIdentifier:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (v8)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004BC38;
    block[3] = &unk_1000BED20;
    void block[4] = self;
    id v10 = v7;
    id v11 = v8;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)libraryAgent:(id)a3 receivedOverrideAsset:(id)a4 forVehicleIdentifier:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = v8;
  if (v7)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004C0DC;
    block[3] = &unk_1000BD3D0;
    void block[4] = self;
    id v11 = v8;
    id v12 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (id)_vehicleForVehicleIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(CRThemeAssetLibrarian *)self vehicleStore];
    id v6 = [v5 allStoredVehicles];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10004C3B4;
    v9[3] = &unk_1000BED48;
    id v10 = v4;
    id v7 = [v6 bs_firstObjectPassingTest:v9];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_assetRequestForVehicle:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 clusterAssetIdentifier];
  uint64_t v5 = [v3 SDKVersion];

  if (v4 | v5) {
    id v6 = -[CRThemeAssetDownloadRequest initWithAssetIdentifier:maximumSDKVersion:maximumCompatibilityVersion:]([CRThemeAssetDownloadRequest alloc], "initWithAssetIdentifier:maximumSDKVersion:maximumCompatibilityVersion:", v4, v5, [(id)objc_opt_class() _supportedCompatibilityVersion]);
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (id)_vehiclesForAssetRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 assetIdentifier];
  id v6 = [v4 maximumSDKVersion];
  id v7 = [(CRThemeAssetLibrarian *)self vehicleStore];
  id v8 = [v7 allStoredVehicles];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10004C5D8;
  v14[3] = &unk_1000BED70;
  id v15 = v5;
  id v16 = v6;
  id v17 = v4;
  id v9 = v4;
  id v10 = v6;
  id v11 = v5;
  id v12 = [v8 bs_filter:v14];

  return v12;
}

- (id)_assetVersionForVehicle:(id)a3
{
  id v3 = a3;
  id v4 = [v3 clusterAssetIdentifier];
  uint64_t v5 = [v3 clusterAssetiOSContentVersion];
  id v6 = [v3 clusterAssetVersion];

  id v7 = 0;
  if (v4 && v6)
  {
    if (!v5) {
      uint64_t v5 = @"0";
    }
    id v7 = [objc_alloc((Class)CARThemeAssetVersion) initWithIdentifier:v4 iOSContentVersion:v5 accessoryContentVersion:v6];
  }

  return v7;
}

- (id)_stagedAssetVersionForVehicle:(id)a3
{
  id v3 = a3;
  id v4 = [v3 clusterAssetIdentifier];
  uint64_t v5 = [v3 stagedClusterAssetiOSContentVersion];
  id v6 = [v3 stagedClusterAssetVersion];

  id v7 = 0;
  if (v4 && v6)
  {
    if (!v5) {
      uint64_t v5 = @"0";
    }
    id v7 = [objc_alloc((Class)CARThemeAssetVersion) initWithIdentifier:v4 iOSContentVersion:v5 accessoryContentVersion:v6];
  }

  return v7;
}

- (id)_assetProgressForVehicle:(id)a3
{
  id v4 = [a3 identifier];
  if (v4)
  {
    uint64_t v5 = [(CRThemeAssetLibrarian *)self assetProgressForVehicleIdentifiers];
    id v6 = [v5 objectForKey:v4];

    if (!v6)
    {
      id v6 = [objc_alloc((Class)NSProgress) initWithParent:0 userInfo:0];
      [v6 setTotalUnitCount:2];
      id v7 = [(CRThemeAssetLibrarian *)self assetProgressForVehicleIdentifiers];
      [v7 setObject:v6 forKey:v4];

      id v8 = CarThemeAssetsLogging();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412546;
        id v11 = v6;
        __int16 v12 = 2112;
        id v13 = v4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "created asset progress %@ for vehicleID: %@", (uint8_t *)&v10, 0x16u);
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_removeAssetProgressForVehicleIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(CRThemeAssetLibrarian *)self assetProgressForVehicleIdentifiers];
    [v5 removeObjectForKey:v4];

    id v6 = CarThemeAssetsLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "removing asset progress for vehicleID: %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (CARThemeAssetLibraryAgent)libraryAgent
{
  return self->_libraryAgent;
}

- (CRVehicleStore)vehicleStore
{
  return self->_vehicleStore;
}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (NSMutableDictionary)assetProgressForVehicleIdentifiers
{
  return self->_assetProgressForVehicleIdentifiers;
}

- (CRThemeAssetDownloader)assetDownloader
{
  return self->_assetDownloader;
}

- (CRFileSender)fileSenderSession
{
  return self->_fileSenderSession;
}

- (void)setFileSenderSession:(id)a3
{
}

- (unint64_t)currentSessionTransferStatus
{
  return self->_currentSessionTransferStatus;
}

- (void)setCurrentSessionTransferStatus:(unint64_t)a3
{
  self->_currentSessionTransferStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileSenderSession, 0);
  objc_storeStrong((id *)&self->_assetDownloader, 0);
  objc_storeStrong((id *)&self->_assetProgressForVehicleIdentifiers, 0);
  objc_storeStrong((id *)&self->_sessionStatus, 0);
  objc_storeStrong((id *)&self->_vehicleStore, 0);

  objc_storeStrong((id *)&self->_libraryAgent, 0);
}

@end