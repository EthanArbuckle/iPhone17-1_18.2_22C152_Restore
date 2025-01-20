@interface FTLivePhotoController
+ (BOOL)isFaceTimePhotosAvailable;
+ (BOOL)shouldPreserveMomentsFile;
+ (FTMomentsControllerLocalCapabilities)localCapabilities;
+ (id)sharedInstance;
+ (void)setLocalCapabilities:(id)a3;
- (FTFileTransferring)fileTransferController;
- (FTIDSService)idsService;
- (FTLivePhotoController)init;
- (FTLivePhotoController)initWithQueue:(id)a3 fileTransferController:(id)a4 idsService:(id)a5 mediaAssetManager:(id)a6 callCenter:(id)a7 userNotificationProviderDataSource:(id)a8 reportingControllerDataSource:(id)a9 featureFlags:(id)a10;
- (FTLivePhotoControllerDelegate)delegate;
- (FTMediaAssetManaging)mediaAssetManager;
- (FTMomentsServerBag)serverBag;
- (NSMutableDictionary)sandboxURLsByRequestTransactionID;
- (NSMutableDictionary)sessionsByToken;
- (OS_dispatch_queue)queue;
- (TUCallCenter)callCenter;
- (TUFeatureFlags)featureFlags;
- (TUMomentsControllerXPCClient)clientObject;
- (TUReportingControllerDataSource)reportingControllerDataSource;
- (TUUserNotificationProviderDataSource)userNotificationProviderDataSource;
- (id)contentsOfDirectoryAtURL:(id)a3;
- (id)momentsGenerator;
- (id)sessionForTransactionID:(id)a3;
- (id)urlFromResources:(id)a3 withExtension:(id)a4;
- (int)availabilityWithRemoteAvailable:(BOOL)a3;
- (void)_handleReceivedResourcesAtDirectoryURL:(id)a3 transactionID:(id)a4;
- (void)_handleReceivedVideoURL:(id)a3;
- (void)_saveLivePhotoWithPhotoURL:(id)a3 videoURL:(id)a4 completion:(id)a5;
- (void)_saveVideoWithURL:(id)a3 completion:(id)a4;
- (void)_startTimeoutForMomentsRequestWithTransactionID:(id)a3;
- (void)_transferFileAtURL:(id)a3 forSession:(id)a4 request:(id)a5;
- (void)cleanUpForMomentIfNecessary:(id)a3;
- (void)deleteContentsAtURL:(id)a3;
- (void)endRequestWithTransactionID:(id)a3 reply:(id)a4;
- (void)fileTransferer:(id)a3 didReceiveResourcesAtURL:(id)a4 withMetadata:(id)a5 isZipped:(BOOL)a6 fromIDSDestination:(id)a7;
- (void)fileTransferer:(id)a3 didTransferFileAtURL:(id)a4 transactionID:(id)a5 successfully:(BOOL)a6;
- (void)handleRequestResultWithMomentDescriptor:(id)a3;
- (void)moments:(id)a3 capabilitiesDidChange:(unsigned int)a4;
- (void)moments:(id)a3 didEndProcessingRequest:(id)a4 stillImageURL:(id)a5 movieURL:(id)a6 error:(id)a7;
- (void)moments:(id)a3 didFinishRequest:(id)a4 error:(id)a5;
- (void)moments:(id)a3 didStartProcessingRequest:(id)a4 error:(id)a5;
- (void)momentsServerDidDisconnect:(id)a3;
- (void)registerStreamToken:(int64_t)a3 requesterID:(id)a4 remoteIDSDestinations:(id)a5 remoteMomentsAvailable:(BOOL)a6 reply:(id)a7;
- (void)registerXPCClientWithReply:(id)a3;
- (void)requestSandboxExtensionForTransactionID:(id)a3 reply:(id)a4;
- (void)requestSandboxExtensionForURL:(id)a3 reply:(id)a4;
- (void)setClientObject:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMomentsGenerator:(id)a3;
- (void)setServerBag:(id)a3;
- (void)startRequestWithMediaType:(int)a3 forStreamToken:(int64_t)a4 requesteeID:(id)a5 destinationID:(id)a6 reply:(id)a7;
- (void)unregisterStreamToken:(int64_t)a3;
- (void)unregisterStreamToken:(int64_t)a3 reply:(id)a4;
@end

@implementation FTLivePhotoController

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003468;
  block[3] = &unk_100051018;
  block[4] = a1;
  if (qword_10005A9A8 != -1) {
    dispatch_once(&qword_10005A9A8, block);
  }
  v2 = (void *)qword_10005A9A0;

  return v2;
}

- (FTLivePhotoController)init
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, 0);

  dispatch_queue_t v5 = dispatch_queue_create("com.apple.telephonyutilities.FTLivePhotoController", v4);
  v6 = [FTFileTransferController alloc];
  v7 = +[FTLivePhotoIDSService sharedInstance];
  v8 = +[FTServerBag sharedInstance];
  v9 = [(FTFileTransferController *)v6 initWithService:v7 serverBag:v8];

  v10 = objc_alloc_init(FTMediaAssetManager);
  v11 = +[TUCallCenter callCenterWithQueue:v5];
  id v12 = objc_alloc_init((Class)TUFeatureFlags);
  id v13 = objc_alloc_init((Class)TUUserNotificationProviderXPCClient);
  id v14 = objc_alloc_init((Class)TUReportingControllerXPCClient);
  v15 = +[FTLivePhotoIDSService sharedInstance];
  v16 = [(FTLivePhotoController *)self initWithQueue:v5 fileTransferController:v9 idsService:v15 mediaAssetManager:v10 callCenter:v11 userNotificationProviderDataSource:v13 reportingControllerDataSource:v14 featureFlags:v12];

  return v16;
}

- (FTLivePhotoController)initWithQueue:(id)a3 fileTransferController:(id)a4 idsService:(id)a5 mediaAssetManager:(id)a6 callCenter:(id)a7 userNotificationProviderDataSource:(id)a8 reportingControllerDataSource:(id)a9 featureFlags:(id)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  v38.receiver = self;
  v38.super_class = (Class)FTLivePhotoController;
  v25 = [(FTLivePhotoController *)&v38 init];
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_queue, a3);
    queue = v26->_queue;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100003800;
    v29[3] = &unk_100051080;
    v30 = v26;
    id v31 = v24;
    id v32 = v21;
    id v33 = v18;
    id v34 = v19;
    id v35 = v20;
    id v36 = v22;
    id v37 = v23;
    dispatch_async(queue, v29);
  }
  return v26;
}

- (void)startRequestWithMediaType:(int)a3 forStreamToken:(int64_t)a4 requesteeID:(id)a5 destinationID:(id)a6 reply:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  id v12 = a5;
  id v38 = a6;
  id v13 = (void (**)(id, void *, id))a7;
  id v14 = [(FTLivePhotoController *)self queue];
  dispatch_assert_queue_V2(v14);

  v15 = FTDefaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v52 = v10;
    *(_WORD *)&v52[4] = 2048;
    *(void *)&v52[6] = a4;
    *(_WORD *)&v52[14] = 1024;
    *(_DWORD *)&v52[16] = TUAllowLocalVideoRecording();
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "mediaType: %d, token: %ld localVideoRecordingEnabled: %d", buf, 0x18u);
  }

  v16 = [(FTLivePhotoController *)self serverBag];
  if ([v16 isMomentsDisabled])
  {

    goto LABEL_20;
  }
  unsigned int v17 = [(id)objc_opt_class() isFaceTimePhotosAvailable];

  if (!v17)
  {
LABEL_20:
    id v20 = +[NSString stringWithFormat:@"Asked to start moments request but moments is disabled by server bag or default"];
    NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
    v44 = v20;
    id v31 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    id v28 = +[NSError errorWithDomain:@"com.apple.callservicesdaemon.FTLivePhotocontroller" code:1 userInfo:v31];

    id v21 = FTDefaultLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10003BB18();
    }
LABEL_22:
    v26 = 0;
    goto LABEL_23;
  }
  if ((v10 - 1) > 2)
  {
    id v20 = +[NSString stringWithFormat:@"Asked to start moments request with invalid media type %d", v10];
    NSErrorUserInfoKey v45 = NSLocalizedDescriptionKey;
    v46 = v20;
    id v32 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    id v28 = +[NSError errorWithDomain:@"com.apple.callservicesdaemon.FTLivePhotocontroller" code:1 userInfo:v32];

    id v21 = FTDefaultLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10003BB18();
    }
    goto LABEL_22;
  }
  id v18 = [(FTLivePhotoController *)self sessionsByToken];
  id v19 = +[NSNumber numberWithInteger:a4];
  id v20 = [v18 objectForKeyedSubscript:v19];

  if (v20)
  {
    id v21 = [v20 moments];
    if (TUAllowLocalVideoRecording()) {
      uint64_t v22 = 1;
    }
    else {
      uint64_t v22 = 2;
    }
    id v37 = [v21 newRequestWithMediaType:v10 mode:v22 requesteeID:v12];
    id v23 = [(FTLivePhotoController *)self featureFlags];
    unsigned int v24 = [v23 livePhotoDonation];

    if (v24)
    {
      objc_initWeak((id *)buf, self);
      v25 = [(FTLivePhotoController *)self idsService];
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_10000414C;
      v40[3] = &unk_1000510A8;
      objc_copyWeak(&v42, (id *)buf);
      id v41 = v38;
      [v25 donateWithDestination:v41 completionHandler:v40];

      objc_destroyWeak(&v42);
      objc_destroyWeak((id *)buf);
    }
    if (v37)
    {
      v26 = [v37 transactionID];
      id v36 = [[FTMomentsRequest alloc] initWithAVCRequest:v37 session:v20];
      [v20 setActiveRequest:v36 forTransactionID:v26];
      if ((TUAllowLocalVideoRecording() & 1) == 0) {
        [(FTLivePhotoController *)self _startTimeoutForMomentsRequestWithTransactionID:v26];
      }
      id v39 = 0;
      unsigned int v27 = [v37 startWithError:&v39];
      id v28 = v39;
      v29 = FTDefaultLog();
      v30 = v29;
      if (v27)
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)v52 = v37;
          *(_WORD *)&v52[8] = 2112;
          *(void *)&v52[10] = v26;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Successfully started AVCMomentsRequest: %@, transactionID %@", buf, 0x16u);
        }

        v30 = [(FTLivePhotoController *)self reportingControllerDataSource];
        [v30 didStartRequestForStream:a4 withTransactionID:v26 reply:&stru_1000510E8];
      }
      else if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        sub_10003BBE8();
      }
    }
    else
    {
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Could not start request for mediaType: %d streamToken: %ld. -[AVCMoments newRequestWithMediaType:] returned nil.", v10, a4);
      id v36 = (FTMomentsRequest *)objc_claimAutoreleasedReturnValue();
      NSErrorUserInfoKey v49 = NSLocalizedDescriptionKey;
      v50 = v36;
      id v35 = +[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      id v28 = +[NSError errorWithDomain:@"com.apple.callservicesdaemon.FTLivePhotocontroller" code:1 userInfo:v35];

      v30 = FTDefaultLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_10003BB80();
      }
      v26 = 0;
    }

    id v34 = v37;
  }
  else
  {
    id v21 = +[NSString stringWithFormat:@"Could not start request for mediaType: %d streamToken: %ld. No session has been registered for requested stream token.", v10, a4];
    NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
    v48 = v21;
    id v33 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    id v28 = +[NSError errorWithDomain:@"com.apple.callservicesdaemon.FTLivePhotocontroller" code:1 userInfo:v33];

    id v34 = FTDefaultLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v52 = v21;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "[WARN] %@", buf, 0xCu);
    }
    v26 = 0;
  }

LABEL_23:
  v13[2](v13, v26, v28);
}

- (void)endRequestWithTransactionID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  v8 = [(FTLivePhotoController *)self queue];
  dispatch_assert_queue_V2(v8);

  v9 = FTDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "transactionID: %@", buf, 0xCu);
  }

  uint64_t v10 = [(FTLivePhotoController *)self sessionForTransactionID:v6];
  v11 = [v10 activeRequestsByTransactionID];
  id v12 = [v11 objectForKeyedSubscript:v6];

  if (v12)
  {
    id v13 = [v12 avcRequest];
    id v20 = 0;
    unsigned int v14 = [v13 endWithError:&v20];
    id v15 = v20;

    v16 = FTDefaultLog();
    unsigned int v17 = v16;
    if (v14)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v12;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Successfully ended request %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      sub_10003BD28();
    }
  }
  else
  {
    unsigned int v17 = +[NSString stringWithFormat:@"Could not find request for transaction ID %@", v6];
    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    uint64_t v22 = v17;
    id v18 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    id v15 = +[NSError errorWithDomain:@"com.apple.callservicesdaemon.FTLivePhotocontroller" code:1 userInfo:v18];

    id v19 = FTDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10003BB18();
    }
  }
  v7[2](v7, v15);
}

- (void)registerStreamToken:(int64_t)a3 requesterID:(id)a4 remoteIDSDestinations:(id)a5 remoteMomentsAvailable:(BOOL)a6 reply:(id)a7
{
  BOOL v8 = a6;
  id v40 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, id, void))a7;
  unsigned int v14 = [(FTLivePhotoController *)self queue];
  dispatch_assert_queue_V2(v14);

  uint64_t v15 = [(FTLivePhotoController *)self availabilityWithRemoteAvailable:v8];
  v16 = +[NSSet set];
  unsigned int v17 = [(FTLivePhotoController *)self sessionsByToken];
  id v18 = +[NSNumber numberWithInteger:a3];
  id v19 = [v17 objectForKeyedSubscript:v18];

  if (!v19)
  {
    if (v15 == 3)
    {
      id v23 = FTDefaultLog();
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v24)
        {
          *(_DWORD *)buf = 134218498;
          int64_t v42 = a3;
          __int16 v43 = 2112;
          int64_t v44 = (int64_t)v40;
          __int16 v45 = 2112;
          int64_t v46 = (int64_t)v12;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Registering stream token %ld, requesterID %@ and remoteIDSDestinations %@ with new moments object", buf, 0x20u);
        }

        v25 = [(FTLivePhotoController *)self momentsGenerator];
        v26 = [(FTLivePhotoController *)self queue];
        id v23 = ((void (**)(void, int64_t, id, FTLivePhotoController *, void *))v25)[2](v25, a3, v40, self, v26);

        NSErrorUserInfoKey v21 = mediaTypesCapabilitiesSetForCapabilities((char)[v23 capabilities]);

        unsigned int v27 = FTDefaultLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          int64_t v42 = (int64_t)v23;
          __int16 v43 = 2112;
          int64_t v44 = (int64_t)v21;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Received moments object %@ with supported media types: %@", buf, 0x16u);
        }

        if (![v21 count])
        {
          id v28 = FTDefaultLog();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            int64_t v42 = (int64_t)v21;
            __int16 v43 = 2112;
            int64_t v44 = (int64_t)v23;
            __int16 v45 = 2048;
            int64_t v46 = a3;
            _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "unexpected supportedMediaTypes: %@, moments: %@, streamToken: %ld", buf, 0x20u);
          }
        }
        if (v23)
        {
          int v29 = TUAllowLocalVideoRecording();
          v30 = &__NSDictionary0__struct;
          if (!v29) {
            v30 = v12;
          }
          id v31 = v30;

          id v32 = [FTMomentsControllerSession alloc];
          id v33 = [(FTLivePhotoController *)self callCenter];
          id v39 = v31;
          id v34 = [(FTMomentsControllerSession *)v32 initWithMoments:v23 remoteIDSDestinations:v31 callCenter:v33];

          id v35 = [(FTLivePhotoController *)self sessionsByToken];
          id v36 = +[NSNumber numberWithInteger:a3];
          [v35 setObject:v34 forKeyedSubscript:v36];

          id v37 = FTDefaultLog();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            int64_t v42 = (int64_t)v34;
            __int16 v43 = 2048;
            int64_t v44 = a3;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Created session: %@ for streamToken: %ld", buf, 0x16u);
          }

          id v12 = v39;
        }
        else
        {
          id v34 = FTDefaultLog();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
            sub_10003BD90();
          }
        }

        uint64_t v15 = 3;
        goto LABEL_29;
      }
      if (v24)
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v42) = 3;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[WARN] FaceTime Photos availability is %d but remoteIDSDestination is nil so changing availability to Unavailabile", buf, 8u);
      }
      id v12 = 0;
      uint64_t v15 = 1;
    }
    else
    {
      id v23 = FTDefaultLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v42) = v15;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "FaceTime Photos is not available. Availability is %d", buf, 8u);
      }
    }
    NSErrorUserInfoKey v21 = v16;
LABEL_29:

    uint64_t v22 = [(FTLivePhotoController *)self reportingControllerDataSource];
    [v22 registeredStream:a3 withAvailability:v15 reply:&stru_100051108];
    goto LABEL_30;
  }
  id v20 = [v19 moments];
  NSErrorUserInfoKey v21 = mediaTypesCapabilitiesSetForCapabilities((char)[v20 capabilities]);

  [v19 setRemoteIDSDestinations:v12];
  uint64_t v22 = FTDefaultLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    int64_t v42 = (int64_t)v19;
    __int16 v43 = 2048;
    int64_t v44 = a3;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "updating remoteIDSDestinations and returning registered session: %@ for streamToken: %ld", buf, 0x16u);
  }
LABEL_30:

  id v38 = [objc_alloc((Class)TUMomentsCapabilities) initWithAvailability:v15 supportedMediaTypes:v21];
  v13[2](v13, v38, 0);
}

- (void)unregisterStreamToken:(int64_t)a3 reply:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  v7 = [(FTLivePhotoController *)self queue];
  dispatch_assert_queue_V2(v7);

  BOOL v8 = FTDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    int64_t v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Asked to unregister stream token: %ld", (uint8_t *)&v9, 0xCu);
  }

  [(FTLivePhotoController *)self unregisterStreamToken:a3];
  v6[2](v6, 0);
}

- (void)registerXPCClientWithReply:(id)a3
{
}

- (void)fileTransferer:(id)a3 didReceiveResourcesAtURL:(id)a4 withMetadata:(id)a5 isZipped:(BOOL)a6 fromIDSDestination:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  unsigned int v14 = [(FTLivePhotoController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004E34;
  block[3] = &unk_1000511A0;
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

- (void)fileTransferer:(id)a3 didTransferFileAtURL:(id)a4 transactionID:(id)a5 successfully:(BOOL)a6
{
  id v9 = a4;
  id v10 = a5;
  if (!a6)
  {
    id v11 = FTDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10003C0BC();
    }
  }
  [(FTLivePhotoController *)self deleteContentsAtURL:v9];
  id v12 = [(FTLivePhotoController *)self sandboxURLsByRequestTransactionID];
  [v12 setObject:0 forKeyedSubscript:v10];
}

- (void)deleteContentsAtURL:(id)a3
{
  id v3 = a3;
  if ([(id)objc_opt_class() shouldPreserveMomentsFile])
  {
    v4 = FTDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Preserving file at URL: %@", buf, 0xCu);
    }
  }
  else
  {
    dispatch_queue_t v5 = +[NSFileManager defaultManager];
    id v9 = 0;
    unsigned int v6 = [v5 removeItemAtURL:v3 error:&v9];
    v4 = v9;

    v7 = FTDefaultLog();
    BOOL v8 = v7;
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
      sub_10003C124();
    }
  }
}

- (id)contentsOfDirectoryAtURL:(id)a3
{
  id v3 = a3;
  v4 = +[NSFileManager defaultManager];
  id v9 = 0;
  dispatch_queue_t v5 = [v4 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:0 options:0 error:&v9];
  id v6 = v9;

  if (!v5)
  {
    v7 = FTDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10003C18C();
    }

    dispatch_queue_t v5 = &__NSArray0__struct;
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
  id v5 = [(FTLivePhotoController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = FTDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134217984;
    int64_t v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Unregistering stream token: %ld", (uint8_t *)&v11, 0xCu);
  }

  id v7 = [(FTLivePhotoController *)self sessionsByToken];
  id v8 = +[NSNumber numberWithLong:a3];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  id v10 = [v9 moments];
  [v9 setIsRegistered:0];
  [(FTLivePhotoController *)self cleanUpForMomentIfNecessary:v10];
}

- (void)cleanUpForMomentIfNecessary:(id)a3
{
  id v4 = a3;
  id v5 = [(FTLivePhotoController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 streamToken];
  id v7 = [(FTLivePhotoController *)self sessionsByToken];
  id v8 = +[NSNumber numberWithLong:v6];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  unsigned int v10 = [v9 isRegistered];
  LODWORD(v7) = [v4 activeRequestCount];
  signed int v11 = [v4 pendingRequestCount] + v7;
  int64_t v12 = [v9 activeRequestsByTransactionID];
  unsigned int v13 = (char *)[v12 count] + v11;

  unsigned int v14 = FTDefaultLog();
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

    long long v16 = [(FTLivePhotoController *)self sessionsByToken];
    long long v17 = +[NSNumber numberWithLong:v6];
    [v16 setObject:0 forKeyedSubscript:v17];

    unsigned int v14 = [(FTLivePhotoController *)self reportingControllerDataSource];
    [v14 didCleanUpForStream:v6 reply:&stru_1000511C0];
  }
}

- (void)_transferFileAtURL:(id)a3 forSession:(id)a4 request:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  signed int v11 = [(FTLivePhotoController *)self queue];
  dispatch_assert_queue_V2(v11);

  int64_t v12 = FTDefaultLog();
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
  unsigned int v14 = +[NSSet setWithObject:v13];

  BOOL v15 = objc_msgSend(v10, "transactionID", @"CSDMomentsControllerMetadataKeyTransactionID");
  id v19 = v15;
  long long v16 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];

  long long v17 = [(FTLivePhotoController *)self fileTransferController];
  [v17 transferFileAtURL:v8 toDestinations:v14 withMetadata:v16];
}

- (void)_handleReceivedResourcesAtDirectoryURL:(id)a3 transactionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FTLivePhotoController *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = FTDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "url: %@", buf, 0xCu);
  }

  id v10 = +[NSFileManager defaultManager];
  signed int v11 = [v6 path];
  unsigned int v12 = [v10 fileExistsAtPath:v11];

  if (v12)
  {
    unsigned int v13 = [(FTLivePhotoController *)self contentsOfDirectoryAtURL:v6];
    unsigned int v14 = [(FTLivePhotoController *)self urlFromResources:v13 withExtension:@"jpg"];
    uint64_t v15 = [(FTLivePhotoController *)self urlFromResources:v13 withExtension:@"heic"];
    long long v16 = (void *)v15;
    if (v15) {
      long long v17 = (void *)v15;
    }
    else {
      long long v17 = v14;
    }
    id v18 = v17;
    uint64_t v19 = [(FTLivePhotoController *)self urlFromResources:v13 withExtension:@"mov"];
    id v20 = (void *)v19;
    if (v18 && v19)
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10000629C;
      v23[3] = &unk_100051210;
      v23[4] = self;
      id v24 = v6;
      id v25 = v7;
      [(FTLivePhotoController *)self _saveLivePhotoWithPhotoURL:v18 videoURL:v20 completion:v23];
    }
    else
    {
      __int16 v22 = FTDefaultLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_10003C1F4();
      }

      [(FTLivePhotoController *)self deleteContentsAtURL:v6];
    }
  }
  else
  {
    id v21 = FTDefaultLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10003C25C();
    }

    [(FTLivePhotoController *)self deleteContentsAtURL:v6];
  }
}

- (void)_handleReceivedVideoURL:(id)a3
{
  id v4 = a3;
  id v5 = [(FTLivePhotoController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = FTDefaultLog();
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
    v7[2] = sub_1000064EC;
    v7[3] = &unk_100051238;
    v7[4] = self;
    id v8 = v4;
    [(FTLivePhotoController *)self _saveVideoWithURL:v8 completion:v7];
  }
}

- (void)_saveLivePhotoWithPhotoURL:(id)a3 videoURL:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  signed int v11 = [(FTLivePhotoController *)self queue];
  dispatch_assert_queue_V2(v11);

  unsigned int v12 = FTDefaultLog();
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
  v18[2] = sub_10000678C;
  v18[3] = &unk_100051260;
  id v19 = v8;
  id v20 = v9;
  id v21 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  long long v16 = objc_retainBlock(v18);
  long long v17 = [(FTLivePhotoController *)self mediaAssetManager];
  [v17 saveLivePhotoWithPhotoURL:v15 videoURL:v14 completion:v16];
}

- (void)_saveVideoWithURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FTLivePhotoController *)self queue];
  dispatch_assert_queue_V2(v8);

  if (TUAllowLocalVideoRecording())
  {
    id v9 = FTDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Saving video with url: %@", buf, 0xCu);
    }

    id v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    id v15 = sub_1000069A0;
    long long v16 = &unk_100051288;
    id v10 = v6;
    id v17 = v10;
    id v18 = v7;
    signed int v11 = objc_retainBlock(&v13);
    unsigned int v12 = [(FTLivePhotoController *)self mediaAssetManager];
    [v12 saveVideoWithURL:v10 completion:v11];
  }
}

- (void)_startTimeoutForMomentsRequestWithTransactionID:(id)a3
{
  id v4 = a3;
  id v5 = [(FTLivePhotoController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(FTLivePhotoController *)self serverBag];
  [v6 momentsRequestTimeout];
  dispatch_time_t v8 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
  id v9 = [(FTLivePhotoController *)self queue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100006B38;
  v11[3] = &unk_1000511E8;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_after(v8, v9, v11);
}

- (id)sessionForTransactionID:(id)a3
{
  id v4 = a3;
  id v5 = [(FTLivePhotoController *)self queue];
  dispatch_assert_queue_V2(v5);

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(FTLivePhotoController *)self sessionsByToken];
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
  id v5 = [(FTLivePhotoController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = FTDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "momentDescriptor: %@", (uint8_t *)&v8, 0xCu);
  }

  double v7 = [(FTLivePhotoController *)self clientObject];
  [v7 didReceiveLocallyRequestedMomentDescriptor:v4];
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

+ (FTMomentsControllerLocalCapabilities)localCapabilities
{
  if (qword_10005A9B0 != -1) {
    dispatch_once(&qword_10005A9B0, &stru_1000512A8);
  }
  v2 = (void *)qword_10005A9B8;

  return (FTMomentsControllerLocalCapabilities *)v2;
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
    id v9 = [(FTLivePhotoController *)self serverBag];
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
  if (qword_10005A9C8 != -1) {
    dispatch_once(&qword_10005A9C8, &stru_1000512C8);
  }
  return byte_10005A9C0;
}

- (void)moments:(id)a3 didFinishRequest:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  signed int v11 = [(FTLivePhotoController *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = FTDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "didFinish request: %@, error: %@", (uint8_t *)&v13, 0x16u);
  }

  [(FTLivePhotoController *)self cleanUpForMomentIfNecessary:v10];
}

- (void)moments:(id)a3 capabilitiesDidChange:(unsigned int)a4
{
  id v6 = a3;
  double v7 = [(FTLivePhotoController *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = FTDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109120;
    v14[1] = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "new capabilities: %u", (uint8_t *)v14, 8u);
  }

  uint64_t v9 = [(FTLivePhotoController *)self availabilityWithRemoteAvailable:1];
  if (v9 == 3) {
    mediaTypesCapabilitiesSetForCapabilities(a4);
  }
  else {
  id v10 = +[NSSet set];
  }
  id v11 = [objc_alloc((Class)TUMomentsCapabilities) initWithAvailability:v9 supportedMediaTypes:v10];
  id v12 = [(FTLivePhotoController *)self clientObject];
  id v13 = [v6 streamToken];

  [v12 didUpdateCapabilities:v11 forVideoStreamToken:v13];
}

- (void)moments:(id)a3 didStartProcessingRequest:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(FTLivePhotoController *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = FTDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v42 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "didStartProcessing request: %@", buf, 0xCu);
  }

  id v13 = [(FTLivePhotoController *)self serverBag];
  if ([v13 isMomentsDisabled])
  {

LABEL_15:
    id v27 = FTDefaultLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_10003C3A4(v27, v28, v29, v30, v31, v32, v33, v34);
    }

    goto LABEL_18;
  }
  unsigned __int8 v14 = [(id)objc_opt_class() isFaceTimePhotosAvailable];

  if ((v14 & 1) == 0) {
    goto LABEL_15;
  }
  __int16 v15 = FTDefaultLog();
  id v16 = v15;
  if (v9)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Requesting sandbox extension for temp URL", buf, 2u);
    }

    long long v17 = [(FTLivePhotoController *)self sandboxDataSource];
    long long v18 = NSTemporaryDirectory();
    id v19 = +[NSURL fileURLWithPath:v18];
    id v35 = _NSConcreteStackBlock;
    uint64_t v36 = 3221225472;
    id v37 = sub_1000076C4;
    id v38 = &unk_1000512F0;
    id v39 = self;
    id v20 = v9;
    id v40 = v20;
    [v17 requestSandboxExtensionForURL:v19 reply:&v35];

    if (objc_msgSend(v20, "mediaType", v35, v36, v37, v38, v39) != 2
      || (TUAllowLocalVideoRecording() & 1) == 0)
    {
      id v21 = [(FTLivePhotoController *)self clientObject];
      __int16 v22 = [v20 requesterID];
      [v21 willCaptureRemoteRequestFromRequesterID:v22];
    }
    id v23 = [v20 requesterID];

    if (v23)
    {
      __int16 v24 = [(FTLivePhotoController *)self userNotificationProviderDataSource];
      id v25 = [v8 streamToken];
      v26 = [v20 requesterID];
      [v24 momentCapturedForStreamToken:v25 requesterID:v26 reply:&stru_100051310];
    }
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10003C3DC();
    }
  }
LABEL_18:
}

- (void)moments:(id)a3 didEndProcessingRequest:(id)a4 stillImageURL:(id)a5 movieURL:(id)a6 error:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  __int16 v15 = [(FTLivePhotoController *)self queue];
  dispatch_assert_queue_V2(v15);

  id v16 = FTDefaultLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v98 = v12;
    __int16 v99 = 2112;
    id v100 = v13;
    __int16 v101 = 2112;
    id v102 = v14;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "didEndProcessing request: %@, stillImageURL: %@ movieURL: %@", buf, 0x20u);
  }

  long long v17 = [(FTLivePhotoController *)self serverBag];
  if ([v17 isMomentsDisabled])
  {

    goto LABEL_16;
  }
  unsigned __int8 v18 = [(id)objc_opt_class() isFaceTimePhotosAvailable];

  if ((v18 & 1) == 0)
  {
LABEL_16:
    id v21 = FTDefaultLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10003C4AC(v21, v35, v36, v37, v38, v39, v40, v41);
    }
    goto LABEL_18;
  }
  id v19 = [(FTLivePhotoController *)self sessionsByToken];
  id v20 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v11 streamToken]);
  id v21 = [v19 objectForKeyedSubscript:v20];

  if (!v21)
  {
    id v42 = FTDefaultLog();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      sub_10003C4E4(v11);
    }
    goto LABEL_21;
  }
  if [v12 mediaType] == 2 || (TUAllowLocalVideoRecording())
  {
    if (!TUAllowLocalVideoRecording())
    {
LABEL_15:
      [(FTLivePhotoController *)self cleanUpForMomentIfNecessary:v11];
      goto LABEL_18;
    }
    if (v14)
    {
      id v22 = objc_alloc((Class)NSUUID);
      id v23 = [v12 transactionID];
      id v24 = [v22 initWithUUIDString:v23];

      if (v24)
      {
        v86 = NSTemporaryDirectory();
        v94[0] = v86;
        v78 = v24;
        v83 = [v24 UUIDString];
        v94[1] = v83;
        id v25 = +[NSUUID UUID];
        v26 = [v25 UUIDString];
        v94[2] = v26;
        uint64_t v27 = +[NSArray arrayWithObjects:v94 count:3];
        uint64_t v28 = +[NSURL fileURLWithPathComponents:v27];

        uint64_t v29 = +[NSFileManager defaultManager];
        id v90 = 0;
        LOBYTE(v27) = [v29 createDirectoryAtURL:v28 withIntermediateDirectories:1 attributes:0 error:&v90];
        id v30 = v90;

        if (v27)
        {
          v87 = v28;
          uint64_t v31 = [v28 URLByAppendingPathComponent:@"lp_movie"];
          uint64_t v32 = [v14 pathExtension];
          uint64_t v33 = [v31 URLByAppendingPathExtension:v32];

          uint64_t v34 = +[NSFileManager defaultManager];
          id v89 = v30;
          LOBYTE(v32) = [v34 copyItemAtURL:v14 toURL:v33 error:&v89];
          id v84 = v89;

          if (v32)
          {
            [(FTLivePhotoController *)self _handleReceivedVideoURL:v33];

            goto LABEL_15;
          }
          v72 = FTDefaultLog();
          __int16 v43 = v78;
          id v30 = v84;
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
            sub_10003C648();
          }

          v70 = v87;
        }
        else
        {
          v70 = v28;
          uint64_t v33 = FTDefaultLog();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            sub_10003C6B0();
          }
          __int16 v43 = v78;
        }

        goto LABEL_51;
      }
      id v42 = FTDefaultLog();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        sub_10003C5C4(v12);
      }
    }
    else
    {
      id v42 = FTDefaultLog();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        sub_10003C55C();
      }
    }
LABEL_21:

    goto LABEL_18;
  }
  __int16 v43 = [v21 remoteRequesterIDSDestinationFor:v12];
  if (!v43)
  {
    v70 = FTDefaultLog();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
      sub_10003C718((uint64_t)v12, v21, v70);
    }
    goto LABEL_51;
  }
  if (!v13 || !v14)
  {
    v70 = FTDefaultLog();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
      sub_10003C88C();
    }
LABEL_51:

LABEL_52:
    goto LABEL_18;
  }
  v96[0] = @"jpg";
  v96[1] = @"heic";
  v96[2] = @"mov";
  int64_t v44 = +[NSArray arrayWithObjects:v96 count:3];
  __int16 v45 = +[NSSet setWithArray:v44];

  int64_t v46 = [v13 pathExtension];
  NSErrorUserInfoKey v47 = [v46 lowercaseString];
  v88 = v45;
  if (([v45 containsObject:v47] & 1) == 0)
  {

    goto LABEL_44;
  }
  v81 = [v14 pathExtension];
  [v81 lowercaseString];
  v48 = v85 = v43;
  unsigned __int8 v49 = [v45 containsObject:v48];

  __int16 v43 = v85;
  if ((v49 & 1) == 0)
  {
LABEL_44:
    v71 = FTDefaultLog();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
      sub_10003C824();
    }

    goto LABEL_52;
  }
  id v50 = objc_alloc((Class)NSUUID);
  v51 = [v12 transactionID];
  id v52 = [v50 initWithUUIDString:v51];

  if (v52)
  {
    v79 = NSTemporaryDirectory();
    v95[0] = v79;
    id v75 = v52;
    v76 = [v52 UUIDString];
    v95[1] = v76;
    uint64_t v53 = +[NSUUID UUID];
    v54 = [(id)v53 UUIDString];
    v95[2] = v54;
    v55 = +[NSArray arrayWithObjects:v95 count:3];
    v56 = +[NSURL fileURLWithPathComponents:v55];

    v57 = +[NSFileManager defaultManager];
    id v93 = 0;
    LOBYTE(v53) = [v57 createDirectoryAtURL:v56 withIntermediateDirectories:1 attributes:0 error:&v93];
    id v58 = v93;

    v82 = v56;
    if (v53)
    {
      v59 = [v56 URLByAppendingPathComponent:@"lp_image"];
      uint64_t v60 = [v13 pathExtension];
      uint64_t v61 = [v59 URLByAppendingPathExtension:v60];

      v62 = +[NSFileManager defaultManager];
      id v92 = v58;
      v80 = v61;
      LOBYTE(v60) = [v62 copyItemAtURL:v13 toURL:v61 error:&v92];
      id v63 = v92;

      if (v60)
      {
        v64 = [v82 URLByAppendingPathComponent:@"lp_movie"];
        uint64_t v65 = [v14 pathExtension];
        uint64_t v66 = [v64 URLByAppendingPathExtension:v65];

        v67 = +[NSFileManager defaultManager];
        id v91 = v63;
        v77 = v66;
        LOBYTE(v65) = [v67 copyItemAtURL:v14 toURL:v66 error:&v91];
        id v58 = v91;

        if (v65)
        {
          [(FTLivePhotoController *)self _transferFileAtURL:v82 forSession:v21 request:v12];
          int v68 = 0;
          v69 = v88;
          id v52 = v75;
        }
        else
        {
          v74 = FTDefaultLog();
          id v52 = v75;
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
            sub_10003C648();
          }

          int v68 = 1;
          v69 = v88;
        }
      }
      else
      {
        id v58 = v63;
        v77 = FTDefaultLog();
        v69 = v88;
        id v52 = v75;
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
          sub_10003C7BC();
        }
        int v68 = 1;
      }
    }
    else
    {
      v80 = FTDefaultLog();
      v69 = v88;
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
        sub_10003C6B0();
      }
      int v68 = 1;
      id v52 = v75;
    }

    v73 = v82;
  }
  else
  {
    v73 = FTDefaultLog();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
      sub_10003C5C4(v12);
    }
    int v68 = 1;
    v69 = v88;
  }

  if (!v68) {
    goto LABEL_15;
  }
LABEL_18:
}

- (void)momentsServerDidDisconnect:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(FTLivePhotoController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = FTDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_10003C8F4();
  }

  double v7 = [(FTLivePhotoController *)self sessionsByToken];
  [v7 removeAllObjects];
}

- (void)requestSandboxExtensionForTransactionID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = FTDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "requesting sandbox extension for transactionID: %@", buf, 0xCu);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100008434;
  v15[3] = &unk_100051338;
  v15[4] = self;
  id v16 = v6;
  id v17 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = objc_retainBlock(v15);
  id v12 = [(FTLivePhotoController *)self sandboxDataSource];
  id v13 = NSTemporaryDirectory();
  id v14 = +[NSURL fileURLWithPath:v13];
  [v12 requestSandboxExtensionForURL:v14 reply:v11];
}

- (void)requestSandboxExtensionForURL:(id)a3 reply:(id)a4
{
  id v4 = (void (**)(id, id, void))a4;
  id v5 = objc_alloc((Class)TUSandboxExtendedURL);
  id v6 = NSTemporaryDirectory();
  id v7 = +[NSURL fileURLWithPath:v6];
  id v8 = [v5 initWithURL:v7];

  v4[2](v4, v8, 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (FTLivePhotoControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FTLivePhotoControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TUMomentsControllerXPCClient)clientObject
{
  return self->_clientObject;
}

- (void)setClientObject:(id)a3
{
}

- (FTMomentsServerBag)serverBag
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

- (NSMutableDictionary)sessionsByToken
{
  return self->_sessionsByToken;
}

- (FTFileTransferring)fileTransferController
{
  return self->_fileTransferController;
}

- (FTIDSService)idsService
{
  return self->_idsService;
}

- (FTMediaAssetManaging)mediaAssetManager
{
  return self->_mediaAssetManager;
}

- (NSMutableDictionary)sandboxURLsByRequestTransactionID
{
  return self->_sandboxURLsByRequestTransactionID;
}

- (TUUserNotificationProviderDataSource)userNotificationProviderDataSource
{
  return self->_userNotificationProviderDataSource;
}

- (TUReportingControllerDataSource)reportingControllerDataSource
{
  return self->_reportingControllerDataSource;
}

- (TUCallCenter)callCenter
{
  return self->_callCenter;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_callCenter, 0);
  objc_storeStrong((id *)&self->_reportingControllerDataSource, 0);
  objc_storeStrong((id *)&self->_userNotificationProviderDataSource, 0);
  objc_storeStrong((id *)&self->_sandboxURLsByRequestTransactionID, 0);
  objc_storeStrong((id *)&self->_mediaAssetManager, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_fileTransferController, 0);
  objc_storeStrong((id *)&self->_sessionsByToken, 0);
  objc_storeStrong(&self->_momentsGenerator, 0);
  objc_storeStrong((id *)&self->_serverBag, 0);
  objc_storeStrong((id *)&self->_clientObject, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end