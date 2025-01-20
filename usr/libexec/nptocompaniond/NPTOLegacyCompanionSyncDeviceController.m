@interface NPTOLegacyCompanionSyncDeviceController
- (IDSDevice)device;
- (IDSService)service;
- (NPTOLegacyCompanionSyncDeviceController)initWithDevice:(id)a3 service:(id)a4;
- (id)_libraryInfo;
- (id)exportAssetsQueue;
- (id)sendAssetsQueue;
- (void)_beginSync;
- (void)_cancelPendingExportAndSendAssets;
- (void)_endSync;
- (void)_exportAsset:(id)a3 forDevice:(id)a4 completionHandler:(id)a5;
- (void)_handleIncomingAssetResource:(id)a3;
- (void)_handleSyncNeededRequest:(id)a3;
- (void)_handleSyncResponse:(id)a3;
- (void)_scheduleExportAndSendAssets:(id)a3 context:(id)a4;
- (void)_scheduleSync;
- (void)_sendAssetResourceAtURL:(id)a3 metadata:(id)a4 identifier:(id)a5 completionHandler:(id)a6;
- (void)controllerDidInvalidateContent:(id)a3;
- (void)pause;
- (void)resume;
- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4;
- (void)syncCoordinator:(id)a3 didInvalidateSyncSession:(id)a4;
- (void)syncCoordinatorDidChangeSyncRestriction:(id)a3;
@end

@implementation NPTOLegacyCompanionSyncDeviceController

- (NPTOLegacyCompanionSyncDeviceController)initWithDevice:(id)a3 service:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)NPTOLegacyCompanionSyncDeviceController;
  v9 = [(NPTOLegacyCompanionSyncDeviceController *)&v29 init];
  if (v9)
  {
    v10 = sub_10005CDAC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v31 = "-[NPTOLegacyCompanionSyncDeviceController initWithDevice:service:]";
      __int16 v32 = 2080;
      v33 = "/Library/Caches/com.apple.xbs/Sources/NanoPhotos/NanoPhotosSync/Legacy/NPTOLegacyCompanionSyncDeviceController.m";
      __int16 v34 = 1024;
      int v35 = 70;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
    }

    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v9->_service, a4);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.nptocompaniond.sync", v11);
    syncQueue = v9->_syncQueue;
    v9->_syncQueue = (OS_dispatch_queue *)v12;

    if ([v7 relationship])
    {
      uint64_t v14 = +[PSYSyncCoordinator syncCoordinatorWithServiceName:@"com.apple.pairedsync.nptocompaniond"];
      syncCoordinator = v9->_syncCoordinator;
      v9->_syncCoordinator = (PSYSyncCoordinator *)v14;
    }
    v16 = [[NMSMessageCenter alloc] initWithDevice:v7 service:v8];
    messageCenter = v9->_messageCenter;
    v9->_messageCenter = v16;

    [(NMSMessageCenter *)v9->_messageCenter setDelegate:v9];
    v18 = v9->_messageCenter;
    uint64_t v19 = objc_opt_class();
    [(NMSMessageCenter *)v18 mapPBRequest:v19 toResponse:objc_opt_class() messageID:8];
    [(NMSMessageCenter *)v9->_messageCenter addResponseHandler:"_handleSyncResponse:" forMessageID:8];
    [(NMSMessageCenter *)v9->_messageCenter addRequestHandler:"_handleSyncNeededRequest:" forMessageID:10];
    if (_os_feature_enabled_impl() && ![(IDSDevice *)v9->_device isTinkerPaired])
    {
      v20 = objc_alloc_init(NPTOWatchAssetsImportController);
      watchAssetsImportController = v9->_watchAssetsImportController;
      v9->_watchAssetsImportController = v20;

      [(NMSMessageCenter *)v9->_messageCenter addIncomingFileHandler:"_handleIncomingAssetResource:" forMessageID:9];
    }
    objc_initWeak((id *)buf, v9);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000605A4;
    v26[3] = &unk_100093600;
    objc_copyWeak(&v28, (id *)buf);
    v22 = v9;
    v27 = v22;
    uint64_t v23 = +[NPTOFirstUnlockProtection performBlockAfterFirstUnlock:v26];
    id initFirstUnlockCancellable = v22->_initFirstUnlockCancellable;
    v22->_id initFirstUnlockCancellable = (id)v23;

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }

  return v9;
}

- (void)resume
{
  v3 = sub_10005CDAC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v9 = "-[NPTOLegacyCompanionSyncDeviceController resume]";
    __int16 v10 = 2080;
    v11 = "/Library/Caches/com.apple.xbs/Sources/NanoPhotos/NanoPhotosSync/Legacy/NPTOLegacyCompanionSyncDeviceController.m";
    __int16 v12 = 1024;
    int v13 = 109;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  objc_initWeak((id *)buf, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000607B4;
  v6[3] = &unk_1000931A8;
  objc_copyWeak(&v7, (id *)buf);
  v4 = +[NPTOFirstUnlockProtection performBlockAfterFirstUnlock:v6];
  id resumeFirstUnlockCancellable = self->_resumeFirstUnlockCancellable;
  self->_id resumeFirstUnlockCancellable = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

- (void)pause
{
  v3 = sub_10005CDAC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315650;
    v6 = "-[NPTOLegacyCompanionSyncDeviceController pause]";
    __int16 v7 = 2080;
    id v8 = "/Library/Caches/com.apple.xbs/Sources/NanoPhotos/NanoPhotosSync/Legacy/NPTOLegacyCompanionSyncDeviceController.m";
    __int16 v9 = 1024;
    int v10 = 125;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v5, 0x1Cu);
  }

  id resumeFirstUnlockCancellable = self->_resumeFirstUnlockCancellable;
  self->_id resumeFirstUnlockCancellable = 0;
}

- (void)controllerDidInvalidateContent:(id)a3
{
  v4 = sub_10005CDAC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315650;
    v6 = "-[NPTOLegacyCompanionSyncDeviceController controllerDidInvalidateContent:]";
    __int16 v7 = 2080;
    id v8 = "/Library/Caches/com.apple.xbs/Sources/NanoPhotos/NanoPhotosSync/Legacy/NPTOLegacyCompanionSyncDeviceController.m";
    __int16 v9 = 1024;
    int v10 = 133;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v5, 0x1Cu);
  }

  [(NPTOLegacyCompanionSyncDeviceController *)self _scheduleSync];
}

- (void)_scheduleSync
{
  v3 = sub_10005CDAC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "-[NPTOLegacyCompanionSyncDeviceController _scheduleSync]";
    __int16 v12 = 2080;
    int v13 = "/Library/Caches/com.apple.xbs/Sources/NanoPhotos/NanoPhotosSync/Legacy/NPTOLegacyCompanionSyncDeviceController.m";
    __int16 v14 = 1024;
    int v15 = 142;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  v4 = [[NPTOTransaction alloc] initWithDescription:@"com.apple.nptocompaniond.sync"];
  syncTransaction = self->_syncTransaction;
  self->_syncTransaction = v4;

  unint64_t v6 = self->_lastSyncRequest + 1;
  self->_lastSyncRequest = v6;
  dispatch_time_t v7 = dispatch_time(0, 1000000000);
  syncQueue = self->_syncQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100060B24;
  v9[3] = &unk_1000936C0;
  v9[4] = self;
  v9[5] = v6;
  dispatch_after(v7, syncQueue, v9);
}

- (void)_beginSync
{
  v3 = sub_10005CDAC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315650;
    v16 = "-[NPTOLegacyCompanionSyncDeviceController _beginSync]";
    __int16 v17 = 2080;
    v18 = "/Library/Caches/com.apple.xbs/Sources/NanoPhotos/NanoPhotosSync/Legacy/NPTOLegacyCompanionSyncDeviceController.m";
    __int16 v19 = 1024;
    int v20 = 165;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v15, 0x1Cu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  contentController = self->_contentController;
  if (!contentController)
  {
    int v5 = [[NPTOCompanionSyncDeviceContentController alloc] initWithDevice:self->_device];
    unint64_t v6 = self->_contentController;
    self->_contentController = v5;

    [(NPTOCompanionSyncDeviceContentController *)self->_contentController setDelegate:self];
    contentController = self->_contentController;
  }
  dispatch_time_t v7 = [(NPTOCompanionSyncDeviceContentController *)contentController composeSyncRequest];
  syncRequest = self->_syncRequest;
  self->_syncRequest = v7;

  __int16 v9 = [(NPTOSyncRequest *)self->_syncRequest npto_libraryCollectionTargetMap];
  int v10 = [(NPTOLegacyCompanionSyncDeviceController *)self _libraryInfo];
  [v10 setCollectionTargetMap:v9];

  syncCoordinator = self->_syncCoordinator;
  if (syncCoordinator && [(PSYSyncCoordinator *)syncCoordinator syncRestriction])
  {
    __int16 v12 = sub_10005CDAC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Sync restriction in place, bailing", (uint8_t *)&v15, 2u);
    }

    syncTransaction = self->_syncTransaction;
    self->_syncTransaction = 0;
  }
  else
  {
    syncTransaction = +[NMSOutgoingRequest requestWithMessageID:8];
    [syncTransaction setPbRequest:self->_syncRequest];
    [syncTransaction setPriority:2];
    [syncTransaction setQueueOneIdentifier:@"sync-request"];
    double v14 = IDSMaxMessageTimeout;
    [syncTransaction setSendTimeout:IDSMaxMessageTimeout];
    [syncTransaction setResponseTimeout:v14];
    [(NMSMessageCenter *)self->_messageCenter sendRequest:syncTransaction];
  }
}

- (void)_endSync
{
  v3 = sub_10005CDAC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315650;
    unint64_t v6 = "-[NPTOLegacyCompanionSyncDeviceController _endSync]";
    __int16 v7 = 2080;
    id v8 = "/Library/Caches/com.apple.xbs/Sources/NanoPhotos/NanoPhotosSync/Legacy/NPTOLegacyCompanionSyncDeviceController.m";
    __int16 v9 = 1024;
    int v10 = 203;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v5, 0x1Cu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  [(NPTOLegacyCompanionSyncDeviceController *)self _cancelPendingExportAndSendAssets];
  syncTransaction = self->_syncTransaction;
  self->_syncTransaction = 0;
}

- (void)_handleSyncResponse:(id)a3
{
  id v4 = a3;
  int v5 = sub_10005CDAC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v17 = "-[NPTOLegacyCompanionSyncDeviceController _handleSyncResponse:]";
    __int16 v18 = 2080;
    __int16 v19 = "/Library/Caches/com.apple.xbs/Sources/NanoPhotos/NanoPhotosSync/Legacy/NPTOLegacyCompanionSyncDeviceController.m";
    __int16 v20 = 1024;
    int v21 = 216;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  unint64_t v6 = [(NMSMessageCenter *)self->_messageCenter actionQ];
  dispatch_assert_queue_V2(v6);

  __int16 v7 = [NPTOTransaction alloc];
  id v8 = [v4 context];
  __int16 v9 = [(NPTOTransaction *)v7 initWithDescription:@"com.apple.nptocompaniond.sync-response" userInfo:0 context:v8];

  syncQueue = self->_syncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100061054;
  block[3] = &unk_1000936E8;
  block[4] = self;
  id v14 = v4;
  int v15 = v9;
  v11 = v9;
  id v12 = v4;
  dispatch_async(syncQueue, block);
}

- (void)_handleSyncNeededRequest:(id)a3
{
  id v4 = a3;
  int v5 = sub_10005CDAC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    int v15 = "-[NPTOLegacyCompanionSyncDeviceController _handleSyncNeededRequest:]";
    __int16 v16 = 2080;
    __int16 v17 = "/Library/Caches/com.apple.xbs/Sources/NanoPhotos/NanoPhotosSync/Legacy/NPTOLegacyCompanionSyncDeviceController.m";
    __int16 v18 = 1024;
    int v19 = 253;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  unint64_t v6 = [(NMSMessageCenter *)self->_messageCenter actionQ];
  dispatch_assert_queue_V2(v6);

  __int16 v7 = [NPTOTransaction alloc];
  id v8 = [v4 context];

  __int16 v9 = [(NPTOTransaction *)v7 initWithDescription:@"com.apple.nptocompaniond.sync-needed-request" userInfo:0 context:v8];
  syncQueue = self->_syncQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000614C0;
  v12[3] = &unk_1000931D0;
  v12[4] = self;
  int v13 = v9;
  v11 = v9;
  dispatch_async(syncQueue, v12);
}

- (id)exportAssetsQueue
{
  exportAssetsQueue = self->_exportAssetsQueue;
  if (!exportAssetsQueue)
  {
    id v4 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    int v5 = self->_exportAssetsQueue;
    self->_exportAssetsQueue = v4;

    [(NSOperationQueue *)self->_exportAssetsQueue setName:@"com.apple.nptocompaniond.export-assets-queue"];
    [(NSOperationQueue *)self->_exportAssetsQueue setMaxConcurrentOperationCount:3];
    exportAssetsQueue = self->_exportAssetsQueue;
  }

  return exportAssetsQueue;
}

- (id)sendAssetsQueue
{
  sendAssetsQueue = self->_sendAssetsQueue;
  if (!sendAssetsQueue)
  {
    id v4 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    int v5 = self->_sendAssetsQueue;
    self->_sendAssetsQueue = v4;

    [(NSOperationQueue *)self->_sendAssetsQueue setName:@"com.apple.nptocompaniond.send-assets-queue"];
    [(NSOperationQueue *)self->_sendAssetsQueue setMaxConcurrentOperationCount:2];
    sendAssetsQueue = self->_sendAssetsQueue;
  }

  return sendAssetsQueue;
}

- (void)_cancelPendingExportAndSendAssets
{
  v3 = sub_10005CDAC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    __int16 v9 = "-[NPTOLegacyCompanionSyncDeviceController _cancelPendingExportAndSendAssets]";
    __int16 v10 = 2080;
    v11 = "/Library/Caches/com.apple.xbs/Sources/NanoPhotos/NanoPhotosSync/Legacy/NPTOLegacyCompanionSyncDeviceController.m";
    __int16 v12 = 1024;
    int v13 = 285;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v8, 0x1Cu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  id v4 = [(NPTOLegacyCompanionSyncDeviceController *)self exportAssetsQueue];
  [v4 cancelAllOperations];

  int v5 = [(NPTOLegacyCompanionSyncDeviceController *)self sendAssetsQueue];
  [v5 cancelAllOperations];

  unint64_t v6 = [(NPTOLegacyCompanionSyncDeviceController *)self exportAssetsQueue];
  [v6 waitUntilAllOperationsAreFinished];

  __int16 v7 = [(NPTOLegacyCompanionSyncDeviceController *)self sendAssetsQueue];
  [v7 waitUntilAllOperationsAreFinished];
}

- (void)_scheduleExportAndSendAssets:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = sub_10005CDAC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[NPTOLegacyCompanionSyncDeviceController _scheduleExportAndSendAssets:context:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/NanoPhotos/NanoPhotosSync/Legacy/NPTOLegacyCompanionSync"
                          "DeviceController.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v36) = 295;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  __int16 v9 = +[NSMutableSet setWithArray:v6];
  __int16 v10 = +[NSMutableSet set];
  v11 = +[NSMutableSet set];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v36 = sub_100061A24;
  v37 = sub_100061A34;
  id v38 = 0;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100061A3C;
  v29[3] = &unk_100093738;
  v29[4] = self;
  id v12 = v9;
  id v30 = v12;
  id v13 = v10;
  id v31 = v13;
  __int16 v34 = buf;
  id v14 = v11;
  id v32 = v14;
  id v15 = v6;
  id v33 = v15;
  __int16 v16 = objc_retainBlock(v29);
  __int16 v17 = +[NRPairedDeviceRegistry sharedInstance];
  __int16 v18 = [v17 deviceForIDSDevice:self->_device];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100061E14;
  v23[3] = &unk_1000937D8;
  id v19 = v7;
  id v24 = v19;
  v25 = self;
  id v20 = v15;
  id v26 = v20;
  id v21 = v18;
  id v27 = v21;
  v22 = v16;
  id v28 = v22;
  [v20 enumerateObjectsUsingBlock:v23];

  _Block_object_dispose(buf, 8);
}

- (void)_exportAsset:(id)a3 forDevice:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  contentController = self->_contentController;
  id v12 = [v8 localIdentifier];
  id v13 = [(NPTOCompanionSyncDeviceContentController *)contentController assetForLocalIdentifier:v12];

  if (v13)
  {
    [v13 npto_exportForDevice:v9 isUserInitiated:1 completionHandler:v10];
  }
  else
  {
    NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
    id v14 = [v8 localIdentifier];
    id v15 = +[NSString stringWithFormat:@"Could not find asset to export %@ %@", v14, v8];
    uint64_t v23 = v15;
    __int16 v16 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    __int16 v17 = +[NSError errorWithDomain:@"NanoPhotosErrorDomain" code:0 userInfo:v16];

    __int16 v18 = sub_10005CDAC();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = [v17 localizedDescription];
      *(_DWORD *)buf = 138412290;
      id v21 = v19;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    if (v10) {
      (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0, 0, v17);
    }
  }
}

- (void)_sendAssetResourceAtURL:(id)a3 metadata:(id)a4 identifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(NMSOutgoingFile);
  [(NMSOutgoingFile *)v14 setMessageID:9];
  [(NMSOutgoingFile *)v14 setURL:v13];

  [(NMSOutgoingFile *)v14 setMetadata:v12];
  [(NMSOutgoingFile *)v14 setQueueOneIdentifier:v11];

  [(NMSOutgoingFile *)v14 setUnlinkWhenSent:1];
  [(NMSMessageCenter *)self->_messageCenter sendFile:v14 completionHandler:v10];
}

- (void)_handleIncomingAssetResource:(id)a3
{
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10005CDAC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 serviceName];
    [v7 syncSessionType];
    id v10 = NSStringfromPSYSyncSessionType();
    id v11 = [v7 pairedDevice];
    id v12 = [v11 valueForProperty:NRDevicePropertyName];
    int v13 = 138412802;
    id v14 = v9;
    __int16 v15 = 2112;
    __int16 v16 = v10;
    __int16 v17 = 2112;
    __int16 v18 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Did receive syncCoordinator:beginSyncSession: from coordinator with service name: \"%@\" and sync type: \"%@\" for device: \"%@\"", (uint8_t *)&v13, 0x20u);
  }
  [(NPTOLegacyCompanionSyncDeviceController *)self _scheduleSync];
}

- (void)syncCoordinator:(id)a3 didInvalidateSyncSession:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_10005CDAC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v5 serviceName];
    id v9 = [v6 pairedDevice];
    id v10 = [v9 valueForProperty:NRDevicePropertyName];
    int v11 = 138412546;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Did receive syncCoordinator:didInvalidateSyncSession: from coordinator with service name: \"%@\" for device: \"%@\"", (uint8_t *)&v11, 0x16u);
  }
}

- (void)syncCoordinatorDidChangeSyncRestriction:(id)a3
{
  id v4 = a3;
  id v5 = sub_10005CDAC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315650;
    id v8 = "-[NPTOLegacyCompanionSyncDeviceController syncCoordinatorDidChangeSyncRestriction:]";
    __int16 v9 = 2080;
    id v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPhotos/NanoPhotosSync/Legacy/NPTOLegacyCompanionSyncDeviceController.m";
    __int16 v11 = 1024;
    int v12 = 459;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v7, 0x1Cu);
  }

  id v6 = [v4 syncRestriction];
  if (v6) {
    [(NPTOLegacyCompanionSyncDeviceController *)self _endSync];
  }
  else {
    [(NPTOLegacyCompanionSyncDeviceController *)self _scheduleSync];
  }
}

- (id)_libraryInfo
{
  libraryInfo = self->_libraryInfo;
  if (!libraryInfo)
  {
    id v4 = +[NRPairedDeviceRegistry sharedInstance];
    id v5 = [v4 deviceForIDSDevice:self->_device];

    id v6 = (NPTOLibraryInfo *)[objc_alloc((Class)NPTOLibraryInfo) initWithDevice:v5];
    int v7 = self->_libraryInfo;
    self->_libraryInfo = v6;

    libraryInfo = self->_libraryInfo;
  }

  return libraryInfo;
}

- (IDSDevice)device
{
  return self->_device;
}

- (IDSService)service
{
  return self->_service;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong(&self->_resumeFirstUnlockCancellable, 0);
  objc_storeStrong(&self->_initFirstUnlockCancellable, 0);
  objc_storeStrong((id *)&self->_watchAssetsImportController, 0);
  objc_storeStrong((id *)&self->_libraryInfo, 0);
  objc_storeStrong((id *)&self->_messageCenter, 0);
  objc_storeStrong((id *)&self->_syncCoordinator, 0);
  objc_storeStrong((id *)&self->_sendAssetsQueue, 0);
  objc_storeStrong((id *)&self->_exportAssetsQueue, 0);
  objc_storeStrong((id *)&self->_syncTransaction, 0);
  objc_storeStrong((id *)&self->_syncResponse, 0);
  objc_storeStrong((id *)&self->_syncRequest, 0);
  objc_storeStrong((id *)&self->_contentController, 0);

  objc_storeStrong((id *)&self->_syncQueue, 0);
}

@end