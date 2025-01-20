@interface CSDMomentsController
+ (BOOL)isFaceTimePhotosAvailable;
+ (BOOL)shouldPreserveMomentsFile;
+ (CSDMomentsControllerLocalCapabilities)localCapabilities;
+ (void)setLocalCapabilities:(id)a3;
- (CSDCallCenterObserver)callCenterObserver;
- (CSDClientManager)clientManager;
- (CSDFileTransferring)fileTransferController;
- (CSDMediaAssetManaging)mediaAssetManager;
- (CSDMomentsController)init;
- (CSDMomentsController)initWithQueue:(id)a3 fileTransferController:(id)a4 mediaAssetManager:(id)a5 callCenterObserver:(id)a6;
- (CSDMomentsControllerDelegate)delegate;
- (CSDMomentsServerBag)serverBag;
- (NSMapTable)streamTokensByCSDClient;
- (NSMutableDictionary)sessionsByToken;
- (OS_dispatch_queue)queue;
- (TUFeatureFlags)featureFlags;
- (TUMomentsControllerXPCClient)momentsClient;
- (id)contentsOfDirectoryAtURL:(id)a3;
- (id)momentsGenerator;
- (id)sessionForTransactionID:(id)a3;
- (id)urlFromResources:(id)a3 withExtension:(id)a4;
- (int)availabilityWithRemoteAvailable:(BOOL)a3;
- (void)_handleReceivedResourcesAtDirectoryURL:(id)a3;
- (void)_handleReceivedVideoURL:(id)a3;
- (void)_saveLivePhotoWithPhotoURL:(id)a3 videoURL:(id)a4 completion:(id)a5;
- (void)_saveVideoWithURL:(id)a3 completion:(id)a4;
- (void)_startTimeoutForMomentsRequestWithTransactionID:(id)a3;
- (void)_transferFileAtURL:(id)a3 forSession:(id)a4 request:(id)a5;
- (void)cleanUpForMomentIfNecessary:(id)a3;
- (void)deleteContentsAtURL:(id)a3;
- (void)discardVideoMessageWithUUID:(id)a3 completion:(id)a4;
- (void)endRecordingMessageWithUUID:(id)a3 completion:(id)a4;
- (void)endRequestWithTransactionID:(id)a3 reply:(id)a4;
- (void)fileTransferer:(id)a3 didReceiveResourcesAtURL:(id)a4 withMetadata:(id)a5 isZipped:(BOOL)a6 fromIDSDestination:(id)a7;
- (void)fileTransferer:(id)a3 didTransferFileAtURL:(id)a4 successfully:(BOOL)a5;
- (void)handleClientDisconnected:(id)a3;
- (void)handleRequestResultWithMomentDescriptor:(id)a3;
- (void)moments:(id)a3 capabilitiesDidChange:(unsigned int)a4;
- (void)moments:(id)a3 didEndProcessingRequest:(id)a4 stillImageURL:(id)a5 movieURL:(id)a6 error:(id)a7;
- (void)moments:(id)a3 didFinishRequest:(id)a4 error:(id)a5;
- (void)moments:(id)a3 didStartProcessingRequest:(id)a4 error:(id)a5;
- (void)momentsServerDidDisconnect:(id)a3;
- (void)prewarmAudioClientWithCompletion:(id)a3;
- (void)registerClient:(id)a3;
- (void)registerStreamToken:(int64_t)a3 requesterID:(id)a4 remoteIDSDestinations:(id)a5 remoteMomentsAvailable:(BOOL)a6 reply:(id)a7;
- (void)registerXPCClientWithReply:(id)a3;
- (void)resetVideoMessagingWithSessionUUID:(id)a3 completionHandler:(id)a4;
- (void)saveVideoMessageWithUUID:(id)a3 completion:(id)a4;
- (void)sendVideoMessageWithUUID:(id)a3 callUUID:(id)a4 toHandles:(id)a5 completion:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setMomentsGenerator:(id)a3;
- (void)setServerBag:(id)a3;
- (void)startRecordingMessageWithMediaType:(int)a3 completion:(id)a4;
- (void)startRequestWithMediaType:(int)a3 forStreamToken:(int64_t)a4 requesteeID:(id)a5 destinationID:(id)a6 reply:(id)a7;
- (void)startRequestWithMediaType:(int)a3 forStreamToken:(int64_t)a4 requesteeID:(id)a5 reply:(id)a6;
- (void)unregisterClient:(id)a3;
- (void)unregisterStreamToken:(int64_t)a3;
- (void)unregisterStreamToken:(int64_t)a3 reply:(id)a4;
@end

@implementation CSDMomentsController

- (CSDMomentsController)init
{
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.telephonyutilities.callservicesd.csdmomentscontroller", 0);
  v4 = objc_alloc_init(CSDFileTransferController);
  v5 = objc_alloc_init(CSDMediaAssetManager);
  v6 = objc_alloc_init(CSDCallCenterObserver);
  v7 = [(CSDMomentsController *)self initWithQueue:v3 fileTransferController:v4 mediaAssetManager:v5 callCenterObserver:v6];

  return v7;
}

- (CSDMomentsController)initWithQueue:(id)a3 fileTransferController:(id)a4 mediaAssetManager:(id)a5 callCenterObserver:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)CSDMomentsController;
  v15 = [(CSDMomentsController *)&v24 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_queue, a3);
    queue = v16->_queue;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1001D0F48;
    v19[3] = &unk_1005053D0;
    v20 = v16;
    id v21 = v12;
    id v22 = v13;
    id v23 = v14;
    dispatch_async(queue, v19);
  }
  return v16;
}

- (void)handleClientDisconnected:(id)a3
{
  id v4 = a3;
  v5 = [(CSDMomentsController *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "handle disconnect for client: %@", buf, 0xCu);
  }

  v7 = [(CSDMomentsController *)self streamTokensByCSDClient];
  v8 = [v7 objectForKey:v4];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        -[CSDMomentsController unregisterStreamToken:](self, "unregisterStreamToken:", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)v13), "integerValue", (void)v15));
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  id v14 = [(CSDMomentsController *)self streamTokensByCSDClient];
  [v14 removeObjectForKey:v4];
}

- (void)registerXPCClientWithReply:(id)a3
{
  v5 = (void (**)(void))a3;
  id v4 = [(CSDMomentsController *)self queue];
  dispatch_assert_queue_V2(v4);

  v5[2]();
}

- (void)startRequestWithMediaType:(int)a3 forStreamToken:(int64_t)a4 requesteeID:(id)a5 reply:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [(CSDMomentsController *)self queue];
  dispatch_assert_queue_V2(v12);

  id v13 = [(CSDMomentsController *)self clientManager];
  id v14 = [v13 currentClient];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001D1890;
  v17[3] = &unk_10050A390;
  int v21 = a3;
  v17[4] = self;
  id v18 = v10;
  id v19 = v11;
  int64_t v20 = a4;
  id v15 = v11;
  id v16 = v10;
  sub_1000085AC(v14, @"modify-moments", v17, 0, (uint64_t)"-[CSDMomentsController startRequestWithMediaType:forStreamToken:requesteeID:reply:]");
}

- (void)endRequestWithTransactionID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CSDMomentsController *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDMomentsController *)self clientManager];
  id v10 = [v9 currentClient];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001D1F9C;
  v13[3] = &unk_100505EA0;
  id v14 = v6;
  id v15 = self;
  id v16 = v7;
  id v11 = v7;
  id v12 = v6;
  sub_1000085AC(v10, @"modify-moments", v13, 0, (uint64_t)"-[CSDMomentsController endRequestWithTransactionID:reply:]");
}

- (void)registerStreamToken:(int64_t)a3 requesterID:(id)a4 remoteIDSDestinations:(id)a5 remoteMomentsAvailable:(BOOL)a6 reply:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = [(CSDMomentsController *)self queue];
  dispatch_assert_queue_V2(v15);

  id v16 = [(CSDMomentsController *)self clientManager];
  long long v17 = [v16 currentClient];

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1001D236C;
  v22[3] = &unk_10050A3B8;
  BOOL v28 = a6;
  v22[4] = self;
  id v23 = v13;
  id v24 = v12;
  id v25 = v17;
  id v26 = v14;
  int64_t v27 = a3;
  id v18 = v14;
  id v19 = v17;
  id v20 = v12;
  id v21 = v13;
  sub_1000085AC(v19, @"modify-moments", v22, 0, (uint64_t)"-[CSDMomentsController registerStreamToken:requesterID:remoteIDSDestinations:remoteMomentsAvailable:reply:]");
}

- (void)unregisterStreamToken:(int64_t)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = [(CSDMomentsController *)self queue];
  dispatch_assert_queue_V2(v7);

  v8 = [(CSDMomentsController *)self clientManager];
  id v9 = [v8 currentClient];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001D2ACC;
  v12[3] = &unk_10050A3E0;
  v12[4] = self;
  id v13 = v9;
  id v14 = v6;
  int64_t v15 = a3;
  id v10 = v6;
  id v11 = v9;
  sub_1000085AC(v11, @"modify-moments", v12, 0, (uint64_t)"-[CSDMomentsController unregisterStreamToken:reply:]");
}

- (void)registerClient:(id)a3
{
  id v4 = a3;
  v5 = [(CSDMomentsController *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001D2CC8;
  v7[3] = &unk_100504F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)unregisterClient:(id)a3
{
  id v4 = a3;
  v5 = [(CSDMomentsController *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001D2DD0;
  v7[3] = &unk_100504F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)discardVideoMessageWithUUID:(id)a3 completion:(id)a4
{
}

- (void)endRecordingMessageWithUUID:(id)a3 completion:(id)a4
{
}

- (void)prewarmAudioClientWithCompletion:(id)a3
{
}

- (void)resetVideoMessagingWithSessionUUID:(id)a3 completionHandler:(id)a4
{
}

- (void)saveVideoMessageWithUUID:(id)a3 completion:(id)a4
{
}

- (void)sendVideoMessageWithUUID:(id)a3 callUUID:(id)a4 toHandles:(id)a5 completion:(id)a6
{
}

- (void)startRecordingMessageWithMediaType:(int)a3 completion:(id)a4
{
}

- (void)startRequestWithMediaType:(int)a3 forStreamToken:(int64_t)a4 requesteeID:(id)a5 destinationID:(id)a6 reply:(id)a7
{
}

- (void)moments:(id)a3 didFinishRequest:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(CSDMomentsController *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = sub_100008DCC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "didFinish request: %@, error: %@", (uint8_t *)&v13, 0x16u);
  }

  [(CSDMomentsController *)self cleanUpForMomentIfNecessary:v10];
}

- (void)moments:(id)a3 capabilitiesDidChange:(unsigned int)a4
{
  id v6 = a3;
  id v7 = [(CSDMomentsController *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v19 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "new capabilities: %u", buf, 8u);
  }

  uint64_t v9 = [(CSDMomentsController *)self availabilityWithRemoteAvailable:1];
  if (v9 == 3) {
    sub_1001D2918(a4);
  }
  else {
  id v10 = +[NSSet set];
  }
  id v11 = [objc_alloc((Class)TUMomentsCapabilities) initWithAvailability:v9 supportedMediaTypes:v10];
  id v12 = [(CSDMomentsController *)self clientManager];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001D3190;
  v15[3] = &unk_10050A408;
  id v16 = v11;
  id v17 = v6;
  id v13 = v6;
  id v14 = v11;
  [v12 performBlockOnClients:v15];
}

- (void)moments:(id)a3 didStartProcessingRequest:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CSDMomentsController *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = sub_100008DCC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v35 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "didStartProcessing request: %@", buf, 0xCu);
  }

  id v13 = [(CSDMomentsController *)self serverBag];
  if ([v13 isMomentsDisabled])
  {
  }
  else
  {
    unsigned __int8 v14 = [(id)objc_opt_class() isFaceTimePhotosAvailable];

    if (v14) {
      goto LABEL_9;
    }
  }
  __int16 v15 = sub_100008DCC();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_1003B1428(v15, v16, v17, v18, v19, v20, v21, v22);
  }

LABEL_9:
  if (!v9)
  {
    v31 = sub_100008DCC();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_1003B13C0();
    }
    goto LABEL_20;
  }
  if [v9 mediaType] == 2 && (TUAllowLocalVideoRecording())
  {
    int v23 = 1;
  }
  else
  {
    id v24 = [(CSDMomentsController *)self clientManager];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1001D34C4;
    v32[3] = &unk_10050A430;
    id v33 = v9;
    [v24 performBlockOnClients:v32];

    int v23 = 0;
  }
  id v25 = [v9 requesterID];

  if (v25)
  {
    id v26 = [CSDMomentsNotification alloc];
    id v27 = [v8 streamToken];
    BOOL v28 = [v9 requesterID];
    v29 = [(CSDMomentsNotification *)v26 initWithStreamToken:v27 requesterID:v28];

    v30 = +[NSNotificationCenter defaultCenter];
    [v30 postNotificationName:@"CSDMomentsControllerStartedRemoteCaptureNotification" object:v29];
  }
  if (v23)
  {
    v31 = +[NSNotificationCenter defaultCenter];
    [v31 postNotificationName:@"CSDMomentsControllerStartedLocalVideoCaptureNotification" object:0];
LABEL_20:
  }
}

- (void)moments:(id)a3 didEndProcessingRequest:(id)a4 stillImageURL:(id)a5 movieURL:(id)a6 error:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  __int16 v15 = [(CSDMomentsController *)self queue];
  dispatch_assert_queue_V2(v15);

  uint64_t v16 = sub_100008DCC();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v99 = v12;
    __int16 v100 = 2112;
    id v101 = v13;
    __int16 v102 = 2112;
    id v103 = v14;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "didEndProcessing request: %@, stillImageURL: %@ movieURL: %@", buf, 0x20u);
  }

  uint64_t v17 = [(CSDMomentsController *)self serverBag];
  if ([v17 isMomentsDisabled])
  {

    goto LABEL_16;
  }
  unsigned __int8 v18 = [(id)objc_opt_class() isFaceTimePhotosAvailable];

  if ((v18 & 1) == 0)
  {
LABEL_16:
    uint64_t v21 = sub_100008DCC();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1003B1460(v21, v36, v37, v38, v39, v40, v41, v42);
    }
    goto LABEL_18;
  }
  uint64_t v19 = [(CSDMomentsController *)self sessionsByToken];
  uint64_t v20 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v11 streamToken]);
  uint64_t v21 = [v19 objectForKeyedSubscript:v20];

  if (!v21)
  {
    v43 = sub_100008DCC();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      sub_1003B1498(v11);
    }
    goto LABEL_21;
  }
  if [v12 mediaType] == 2 || (TUAllowLocalVideoRecording())
  {
    if (!TUAllowLocalVideoRecording())
    {
LABEL_15:
      [(CSDMomentsController *)self cleanUpForMomentIfNecessary:v11];
      goto LABEL_18;
    }
    uint64_t v22 = +[NSNotificationCenter defaultCenter];
    [v22 postNotificationName:@"CSDMomentsControllerStoppedLocalVideoCaptureNotification" object:0];

    if (v14)
    {
      id v23 = objc_alloc((Class)NSUUID);
      id v24 = [v12 transactionID];
      id v25 = [v23 initWithUUIDString:v24];

      if (v25)
      {
        v87 = NSTemporaryDirectory();
        v95[0] = v87;
        v79 = v25;
        v84 = [v25 UUIDString];
        v95[1] = v84;
        id v26 = +[NSUUID UUID];
        id v27 = [v26 UUIDString];
        v95[2] = v27;
        uint64_t v28 = +[NSArray arrayWithObjects:v95 count:3];
        v29 = +[NSURL fileURLWithPathComponents:v28];

        v30 = +[NSFileManager defaultManager];
        id v91 = 0;
        LOBYTE(v28) = [v30 createDirectoryAtURL:v29 withIntermediateDirectories:1 attributes:0 error:&v91];
        id v31 = v91;

        if (v28)
        {
          v88 = v29;
          v32 = [v29 URLByAppendingPathComponent:@"lp_movie"];
          uint64_t v33 = [v14 pathExtension];
          v34 = [v32 URLByAppendingPathExtension:v33];

          id v35 = +[NSFileManager defaultManager];
          id v90 = v31;
          LOBYTE(v33) = [v35 copyItemAtURL:v14 toURL:v34 error:&v90];
          id v85 = v90;

          if (v33)
          {
            [(CSDMomentsController *)self _handleReceivedVideoURL:v34];

            goto LABEL_15;
          }
          v73 = sub_100008DCC();
          v44 = v79;
          id v31 = v85;
          if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
            sub_1003B15FC();
          }

          v71 = v88;
        }
        else
        {
          v71 = v29;
          v34 = sub_100008DCC();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
            sub_1003B1664();
          }
          v44 = v79;
        }

        goto LABEL_51;
      }
      v43 = sub_100008DCC();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        sub_1003B1578(v12);
      }
    }
    else
    {
      v43 = sub_100008DCC();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        sub_1003B1510();
      }
    }
LABEL_21:

    goto LABEL_18;
  }
  v44 = [v21 remoteRequesterIDSDestinationFor:v12];
  if (!v44)
  {
    v71 = sub_100008DCC();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
      sub_1003B16CC((uint64_t)v12, v21, v71);
    }
    goto LABEL_51;
  }
  if (!v13 || !v14)
  {
    v71 = sub_100008DCC();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
      sub_1003B1838();
    }
LABEL_51:

LABEL_52:
    goto LABEL_18;
  }
  v97[0] = @"jpg";
  v97[1] = @"heic";
  v97[2] = @"mov";
  v45 = +[NSArray arrayWithObjects:v97 count:3];
  v46 = +[NSSet setWithArray:v45];

  v47 = [v13 pathExtension];
  v48 = [v47 lowercaseString];
  v89 = v46;
  if (([v46 containsObject:v48] & 1) == 0)
  {

    goto LABEL_44;
  }
  v82 = [v14 pathExtension];
  [v82 lowercaseString];
  v49 = v86 = v44;
  unsigned __int8 v50 = [v46 containsObject:v49];

  v44 = v86;
  if ((v50 & 1) == 0)
  {
LABEL_44:
    v72 = sub_100008DCC();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
      sub_1003B17D0();
    }

    goto LABEL_52;
  }
  id v51 = objc_alloc((Class)NSUUID);
  v52 = [v12 transactionID];
  id v53 = [v51 initWithUUIDString:v52];

  if (v53)
  {
    v80 = NSTemporaryDirectory();
    v96[0] = v80;
    id v76 = v53;
    v77 = [v53 UUIDString];
    v96[1] = v77;
    uint64_t v54 = +[NSUUID UUID];
    v55 = [(id)v54 UUIDString];
    v96[2] = v55;
    v56 = +[NSArray arrayWithObjects:v96 count:3];
    v57 = +[NSURL fileURLWithPathComponents:v56];

    v58 = +[NSFileManager defaultManager];
    id v94 = 0;
    LOBYTE(v54) = [v58 createDirectoryAtURL:v57 withIntermediateDirectories:1 attributes:0 error:&v94];
    id v59 = v94;

    v83 = v57;
    if (v54)
    {
      v60 = [v57 URLByAppendingPathComponent:@"lp_image"];
      uint64_t v61 = [v13 pathExtension];
      uint64_t v62 = [v60 URLByAppendingPathExtension:v61];

      v63 = +[NSFileManager defaultManager];
      id v93 = v59;
      v81 = v62;
      LOBYTE(v61) = [v63 copyItemAtURL:v13 toURL:v62 error:&v93];
      id v64 = v93;

      if (v61)
      {
        v65 = [v83 URLByAppendingPathComponent:@"lp_movie"];
        uint64_t v66 = [v14 pathExtension];
        uint64_t v67 = [v65 URLByAppendingPathExtension:v66];

        v68 = +[NSFileManager defaultManager];
        id v92 = v64;
        v78 = v67;
        LOBYTE(v66) = [v68 copyItemAtURL:v14 toURL:v67 error:&v92];
        id v59 = v92;

        if (v66)
        {
          [(CSDMomentsController *)self _transferFileAtURL:v83 forSession:v21 request:v12];
          int v69 = 0;
          v70 = v89;
          id v53 = v76;
        }
        else
        {
          v75 = sub_100008DCC();
          id v53 = v76;
          if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
            sub_1003B15FC();
          }

          int v69 = 1;
          v70 = v89;
        }
      }
      else
      {
        id v59 = v64;
        v78 = sub_100008DCC();
        v70 = v89;
        id v53 = v76;
        if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
          sub_1003B1768();
        }
        int v69 = 1;
      }
    }
    else
    {
      v81 = sub_100008DCC();
      v70 = v89;
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR)) {
        sub_1003B1664();
      }
      int v69 = 1;
      id v53 = v76;
    }

    v74 = v83;
  }
  else
  {
    v74 = sub_100008DCC();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
      sub_1003B1578(v12);
    }
    int v69 = 1;
    v70 = v89;
  }

  if (!v69) {
    goto LABEL_15;
  }
LABEL_18:
}

- (void)momentsServerDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = [(CSDMomentsController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_1003B18A0();
  }

  id v7 = [(CSDMomentsController *)self sessionsByToken];
  [v7 removeAllObjects];

  id v8 = [(CSDMomentsController *)self streamTokensByCSDClient];
  [v8 removeAllObjects];
}

- (void)fileTransferer:(id)a3 didReceiveResourcesAtURL:(id)a4 withMetadata:(id)a5 isZipped:(BOOL)a6 fromIDSDestination:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  id v14 = [(CSDMomentsController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D40E4;
  block[3] = &unk_1005074A0;
  id v19 = v11;
  id v20 = v12;
  BOOL v23 = a6;
  id v21 = v13;
  uint64_t v22 = self;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  dispatch_async(v14, block);
}

- (void)fileTransferer:(id)a3 didTransferFileAtURL:(id)a4 successfully:(BOOL)a5
{
  id v7 = a4;
  if (!a5)
  {
    id v8 = sub_100008DCC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1003B1BCC();
    }
  }
  [(CSDMomentsController *)self deleteContentsAtURL:v7];
}

- (void)deleteContentsAtURL:(id)a3
{
  id v3 = a3;
  if ([(id)objc_opt_class() shouldPreserveMomentsFile])
  {
    id v4 = sub_100008DCC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Preserving file at URL: %@", buf, 0xCu);
    }
  }
  else
  {
    v5 = +[NSFileManager defaultManager];
    id v9 = 0;
    unsigned int v6 = [v5 removeItemAtURL:v3 error:&v9];
    id v4 = v9;

    id v7 = sub_100008DCC();
    id v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = v3;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Deleted contents at URL: %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      sub_1003A9B54();
    }
  }
}

- (id)contentsOfDirectoryAtURL:(id)a3
{
  id v3 = a3;
  id v4 = +[NSFileManager defaultManager];
  id v9 = 0;
  v5 = [v4 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:0 options:0 error:&v9];
  id v6 = v9;

  if (!v5)
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1003B1C34();
    }

    v5 = &__NSArray0__struct;
  }

  return v5;
}

- (id)urlFromResources:(id)a3 withExtension:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "pathExtension", (void)v15);
        unsigned int v13 = [v12 isEqualToIgnoringCase:v6];

        if (v13)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)unregisterStreamToken:(int64_t)a3
{
  id v5 = [(CSDMomentsController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134217984;
    int64_t v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Unregistering stream token: %ld", (uint8_t *)&v11, 0xCu);
  }

  id v7 = [(CSDMomentsController *)self sessionsByToken];
  id v8 = +[NSNumber numberWithLong:a3];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  id v10 = [v9 moments];
  [v9 setIsRegistered:0];
  [(CSDMomentsController *)self cleanUpForMomentIfNecessary:v10];
}

- (void)cleanUpForMomentIfNecessary:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDMomentsController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 streamToken];
  id v7 = [(CSDMomentsController *)self sessionsByToken];
  id v8 = +[NSNumber numberWithLong:v6];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  unsigned int v10 = [v9 isRegistered];
  LODWORD(v7) = [v4 activeRequestCount];
  signed int v11 = [v4 pendingRequestCount] + v7;
  int64_t v12 = [v9 activeRequestsByTransactionID];
  unsigned int v13 = (char *)[v12 count] + v11;

  id v14 = sub_100008DCC();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if ((v10 & 1) != 0 || v13)
  {
    if (v15)
    {
      int v18 = 67109376;
      LODWORD(v19[0]) = v10;
      WORD2(v19[0]) = 2048;
      *(void *)((char *)v19 + 6) = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Delaying cleanup because moment is still registered (%d) or has outstanding requests (%lu)", (uint8_t *)&v18, 0x12u);
    }
  }
  else
  {
    if (v15)
    {
      int v18 = 138412290;
      v19[0] = v4;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Cleaning up state for moment: %@", (uint8_t *)&v18, 0xCu);
    }

    long long v16 = [(CSDMomentsController *)self sessionsByToken];
    long long v17 = +[NSNumber numberWithLong:v6];
    [v16 setObject:0 forKeyedSubscript:v17];

    id v14 = [(CSDMomentsController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v14 momentsController:self didCleanUpForStream:v6];
    }
  }
}

- (void)_transferFileAtURL:(id)a3 forSession:(id)a4 request:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  signed int v11 = [(CSDMomentsController *)self queue];
  dispatch_assert_queue_V2(v11);

  int64_t v12 = sub_100008DCC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    __int16 v24 = 2112;
    id v25 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "url: %@ session: %@ request: %@", buf, 0x20u);
  }

  unsigned int v13 = [v9 remoteRequesterIDSDestinationFor:v10];
  id v14 = +[NSSet setWithObject:v13];

  BOOL v15 = objc_msgSend(v10, "transactionID", @"CSDMomentsControllerMetadataKeyTransactionID");
  id v19 = v15;
  long long v16 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];

  long long v17 = [(CSDMomentsController *)self fileTransferController];
  [v17 transferFileAtURL:v8 toDestinations:v14 withMetadata:v16];
}

- (void)_handleReceivedResourcesAtDirectoryURL:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDMomentsController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "url: %@", buf, 0xCu);
  }

  id v7 = +[NSFileManager defaultManager];
  id v8 = [v4 path];
  unsigned int v9 = [v7 fileExistsAtPath:v8];

  if (v9)
  {
    id v10 = [(CSDMomentsController *)self contentsOfDirectoryAtURL:v4];
    signed int v11 = [(CSDMomentsController *)self urlFromResources:v10 withExtension:@"jpg"];
    uint64_t v12 = [(CSDMomentsController *)self urlFromResources:v10 withExtension:@"heic"];
    unsigned int v13 = (void *)v12;
    if (v12) {
      id v14 = (void *)v12;
    }
    else {
      id v14 = v11;
    }
    id v15 = v14;
    uint64_t v16 = [(CSDMomentsController *)self urlFromResources:v10 withExtension:@"mov"];
    long long v17 = (void *)v16;
    if (v15 && v16)
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1001D5410;
      v20[3] = &unk_10050A480;
      v20[4] = self;
      id v21 = v4;
      [(CSDMomentsController *)self _saveLivePhotoWithPhotoURL:v15 videoURL:v17 completion:v20];
    }
    else
    {
      id v19 = sub_100008DCC();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1003B1C9C();
      }

      [(CSDMomentsController *)self deleteContentsAtURL:v4];
    }
  }
  else
  {
    uint64_t v18 = sub_100008DCC();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1003B1D04();
    }

    [(CSDMomentsController *)self deleteContentsAtURL:v4];
  }
}

- (void)_handleReceivedVideoURL:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDMomentsController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "_handleReceivedVideoURL: %@", buf, 0xCu);
  }

  if (v4 && TUAllowLocalVideoRecording())
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1001D5640;
    v7[3] = &unk_10050A480;
    v7[4] = self;
    id v8 = v4;
    [(CSDMomentsController *)self _saveVideoWithURL:v8 completion:v7];
  }
}

- (void)_saveLivePhotoWithPhotoURL:(id)a3 videoURL:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  signed int v11 = [(CSDMomentsController *)self queue];
  dispatch_assert_queue_V2(v11);

  uint64_t v12 = sub_100008DCC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "saving live photo with photo url: %@ video url: %@", buf, 0x16u);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001D58E0;
  v18[3] = &unk_10050A4A8;
  id v19 = v8;
  id v20 = v9;
  id v21 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  uint64_t v16 = objc_retainBlock(v18);
  long long v17 = [(CSDMomentsController *)self mediaAssetManager];
  [v17 saveLivePhotoWithPhotoURL:v15 videoURL:v14 completion:v16];
}

- (void)_saveVideoWithURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDMomentsController *)self queue];
  dispatch_assert_queue_V2(v8);

  if (TUAllowLocalVideoRecording())
  {
    id v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Saving video with url: %@", buf, 0xCu);
    }

    id v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    id v15 = sub_1001D5AF4;
    uint64_t v16 = &unk_10050A4D0;
    id v10 = v6;
    id v17 = v10;
    id v18 = v7;
    signed int v11 = objc_retainBlock(&v13);
    uint64_t v12 = [(CSDMomentsController *)self mediaAssetManager];
    [v12 saveVideoWithURL:v10 completion:v11];
  }
}

- (void)_startTimeoutForMomentsRequestWithTransactionID:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDMomentsController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDMomentsController *)self serverBag];
  [v6 momentsRequestTimeout];
  dispatch_time_t v8 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
  id v9 = [(CSDMomentsController *)self queue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001D5C8C;
  v11[3] = &unk_100504F10;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_after(v8, v9, v11);
}

- (id)sessionForTransactionID:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDMomentsController *)self queue];
  dispatch_assert_queue_V2(v5);

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(CSDMomentsController *)self sessionsByToken];
  double v7 = [v6 allValues];

  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        signed int v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = [v11 activeRequestsByTransactionID];
        id v13 = [v12 objectForKeyedSubscript:v4];

        if (v13)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)handleRequestResultWithMomentDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDMomentsController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "momentDescriptor: %@", buf, 0xCu);
  }

  double v7 = [(CSDMomentsController *)self clientManager];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001D6054;
  v9[3] = &unk_10050A430;
  id v10 = v4;
  id v8 = v4;
  [v7 performBlockOnClients:v9];
}

+ (BOOL)isFaceTimePhotosAvailable
{
  id v3 = [a1 localCapabilities];
  if ([v3 isEnabled])
  {
    id v4 = [a1 localCapabilities];
    unsigned int v5 = [v4 isRegionBlocked] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (CSDMomentsControllerLocalCapabilities)localCapabilities
{
  if (qword_10058C5A8 != -1) {
    dispatch_once(&qword_10058C5A8, &stru_10050A4F0);
  }
  v2 = (void *)qword_10058C5B0;

  return (CSDMomentsControllerLocalCapabilities *)v2;
}

+ (void)setLocalCapabilities:(id)a3
{
}

- (int)availabilityWithRemoteAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(id)objc_opt_class() localCapabilities];
  unsigned __int8 v6 = [v5 isRegionBlocked];

  if (v6) {
    return 2;
  }
  unsigned int v8 = [(id)objc_opt_class() isFaceTimePhotosAvailable];
  int result = 1;
  if (v8 && v3)
  {
    uint64_t v9 = [(CSDMomentsController *)self serverBag];
    unsigned int v10 = [v9 isMomentsDisabled];

    if (v10) {
      return 1;
    }
    else {
      return 3;
    }
  }
  return result;
}

+ (BOOL)shouldPreserveMomentsFile
{
  if (qword_10058C5C0[0] != -1) {
    dispatch_once(qword_10058C5C0, &stru_10050A510);
  }
  return byte_10058C5B8;
}

- (CSDMomentsControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSDMomentsControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CSDFileTransferring)fileTransferController
{
  return self->_fileTransferController;
}

- (CSDMediaAssetManaging)mediaAssetManager
{
  return self->_mediaAssetManager;
}

- (NSMutableDictionary)sessionsByToken
{
  return self->_sessionsByToken;
}

- (NSMapTable)streamTokensByCSDClient
{
  return self->_streamTokensByCSDClient;
}

- (CSDCallCenterObserver)callCenterObserver
{
  return self->_callCenterObserver;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (TUMomentsControllerXPCClient)momentsClient
{
  return self->_momentsClient;
}

- (CSDClientManager)clientManager
{
  return self->_clientManager;
}

- (CSDMomentsServerBag)serverBag
{
  return self->_serverBag;
}

- (void)setServerBag:(id)a3
{
}

- (id)momentsGenerator
{
  return self->_momentsGenerator;
}

- (void)setMomentsGenerator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_momentsGenerator, 0);
  objc_storeStrong((id *)&self->_serverBag, 0);
  objc_storeStrong((id *)&self->_clientManager, 0);
  objc_storeStrong((id *)&self->_momentsClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_callCenterObserver, 0);
  objc_storeStrong((id *)&self->_streamTokensByCSDClient, 0);
  objc_storeStrong((id *)&self->_sessionsByToken, 0);
  objc_storeStrong((id *)&self->_mediaAssetManager, 0);
  objc_storeStrong((id *)&self->_fileTransferController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end