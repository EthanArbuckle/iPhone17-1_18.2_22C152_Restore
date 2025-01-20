@interface UASharedPasteboardClientController
- (BOOL)advertiseTypes;
- (BOOL)hasFetchedLocalData;
- (BOOL)isScreenWatcherPresent;
- (BOOL)isUIVisible;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)localReflection;
- (BOOL)remoteAvailable;
- (NSArray)currentLocalPasteboard;
- (NSBundle)uaBundle;
- (NSDate)dontHideUIBefore;
- (NSMutableSet)controlConnections;
- (NSProgress)fetchProgress;
- (NSTimer)localTimeout;
- (NSTimer)showUITimer;
- (NSXPCConnection)auxConnection;
- (NSXPCConnection)clientConnection;
- (NSXPCConnection)clientNotificationConnection;
- (NSXPCConnection)osxUIConnection;
- (NSXPCListener)auxlistener;
- (NSXPCListener)controlListener;
- (NSXPCListener)xpclistener;
- (OS_dispatch_queue)clientq;
- (OS_dispatch_semaphore)pboardFetchSem;
- (SFCompanionAdvertiser)pasteAdvertiser;
- (UARemotePasteboardDidSendLocalEvent)localInfo;
- (UARemotePasteboardWasRequestedEvent)pasteInfo;
- (UASharedPasteboardClientController)initWithManager:(id)a3 name:(id)a4;
- (UASharedPasteboardInfo)currentLocalTypes;
- (UASharedPasteboardInfoWrapper)pboardInfoToSend;
- (UASharedPasteboardInputStreamManager)inStream;
- (UASharedPasteboardOutputStreamManager)outStream;
- (UCRemotePasteboardGeneration)remoteGeneration;
- (UCStreamCoder)coders;
- (__CFUserNotification)notificationRef;
- (id)currentPasteboardActivityInfo;
- (id)eligibleAdvertiseableItemsInOrder;
- (id)localPBStatus;
- (id)statusString;
- (id)uuid;
- (int64_t)currentLocalPasteboardSize;
- (int64_t)sendingCoderVersion;
- (unint64_t)currentLocalGeneration;
- (unint64_t)localSendStartTime;
- (unint64_t)pasteFetchStartTime;
- (unint64_t)streamOpenStartTime;
- (unint64_t)streamXferStartTime;
- (void)advertiser:(id)a3 didReceiveInputStream:(id)a4 outputStream:(id)a5;
- (void)clearLocalPasteboardInformation;
- (void)clearLocalPasteboardTypes:(id)a3;
- (void)dealloc;
- (void)fetchRemoteDeviceName:(id)a3;
- (void)fetchRemotePasteboardForProcess:(int)a3 withCompletion:(id)a4;
- (void)fetchRemotePasteboardStatus:(id)a3;
- (void)fetchRemotePasteboardTypesForProcess:(int)a3 withCompletion:(id)a4;
- (void)getLocalPasteboardInfoData:(id)a3;
- (void)hideProgressUI:(BOOL)a3;
- (void)localPasteboardTypesDidChange:(id)a3 forGeneration:(unint64_t)a4;
- (void)receivePasteboardStreamData:(id)a3 version:(int64_t)a4 withCompletion:(id)a5;
- (void)removeLocalPasteboardFromAdvertisers:(id)a3;
- (void)setAdvertiseTypes:(BOOL)a3;
- (void)setAuxConnection:(id)a3;
- (void)setAuxlistener:(id)a3;
- (void)setClientConnection:(id)a3;
- (void)setClientNotificationConnection:(id)a3;
- (void)setClientq:(id)a3;
- (void)setCoders:(id)a3;
- (void)setControlConnections:(id)a3;
- (void)setControlListener:(id)a3;
- (void)setCurrentLocalGeneration:(unint64_t)a3;
- (void)setCurrentLocalPasteboard:(id)a3;
- (void)setCurrentLocalPasteboardSize:(int64_t)a3;
- (void)setCurrentLocalTypes:(id)a3;
- (void)setDontHideUIBefore:(id)a3;
- (void)setFetchProgress:(id)a3;
- (void)setHasFetchedLocalData:(BOOL)a3;
- (void)setInStream:(id)a3;
- (void)setIsUIVisible:(BOOL)a3;
- (void)setLocalInfo:(id)a3;
- (void)setLocalPasteboardReflection:(BOOL)a3;
- (void)setLocalReflection:(BOOL)a3;
- (void)setLocalSendStartTime:(unint64_t)a3;
- (void)setLocalTimeout:(id)a3;
- (void)setNotificationRef:(__CFUserNotification *)a3;
- (void)setOsxUIConnection:(id)a3;
- (void)setOutStream:(id)a3;
- (void)setPasteAdvertiser:(id)a3;
- (void)setPasteFetchStartTime:(unint64_t)a3;
- (void)setPasteInfo:(id)a3;
- (void)setPboardFetchSem:(id)a3;
- (void)setPboardInfoToSend:(id)a3;
- (void)setRemoteAvailable:(BOOL)a3;
- (void)setRemoteGeneration:(id)a3;
- (void)setRemotePasteboardAvalibility:(BOOL)a3 withDataRequester:(id)a4;
- (void)setReturnPasteboardDataEarlyWithCompletion:(id)a3;
- (void)setScreenWatcherPresent:(BOOL)a3;
- (void)setSendingCoderVersion:(int64_t)a3;
- (void)setShowUITimer:(id)a3;
- (void)setStreamOpenStartTime:(unint64_t)a3;
- (void)setStreamXferStartTime:(unint64_t)a3;
- (void)setUaBundle:(id)a3;
- (void)setXpclistener:(id)a3;
- (void)showProgressUI:(id)a3;
- (void)startConnection:(int)a3;
- (void)startServiceForPasteVersion:(int64_t)a3 handler:(id)a4;
@end

@implementation UASharedPasteboardClientController

- (id)eligibleAdvertiseableItemsInOrder
{
  v3 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = [(UASharedPasteboardClientController *)self currentPasteboardActivityInfo];
    v5 = [v4 allObjects];
    int v9 = 138412290;
    v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[PBOARD CONTROLLER] Return Client Items in Order: %@", (uint8_t *)&v9, 0xCu);
  }
  v6 = [(UASharedPasteboardClientController *)self currentPasteboardActivityInfo];
  v7 = [v6 allObjects];

  return v7;
}

- (id)currentPasteboardActivityInfo
{
  if ([(UASharedPasteboardClientController *)self advertiseTypes])
  {
    v3 = objc_alloc_init(UASharedPasteboardActivityInfo);
    [(UASharedPasteboardActivityInfo *)v3 setActivityType:@"com.apple.continuitypasteboard"];
    [(UASharedPasteboardActivityInfo *)v3 setType:1];
    id v4 = objc_alloc_init((Class)NSMutableSet);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v5 = [(UASharedPasteboardClientController *)self currentLocalTypes];
    v6 = [v5 items];

    id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v16 + 1) + 8 * i) types];
          v12 = [v11 allKeys];
          [v4 addObjectsFromArray:v12];
        }
        id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    [(UASharedPasteboardActivityInfo *)v3 setGeneration:[(UASharedPasteboardClientController *)self currentLocalGeneration]];
    [(UASharedPasteboardActivityInfo *)v3 setPasteboardTypes:v4];
    [(UASharedPasteboardActivityInfo *)v3 setEligibleForHandoff:1];
    v13 = [(UASharedPasteboardClientController *)self uuid];
    [(UASharedPasteboardActivityInfo *)v3 setUuid:v13];

    v14 = +[NSSet setWithObject:v3];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)advertiseTypes
{
  return self->_advertiseTypes;
}

- (UASharedPasteboardClientController)initWithManager:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v40.receiver = self;
  v40.super_class = (Class)UASharedPasteboardClientController;
  id v8 = [(UAClientController *)&v40 initWithManager:v6 name:v7];
  if (v8)
  {
    uint64_t v9 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] Creating pboard client controller", (uint8_t *)buf, 2u);
    }

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.coreservices.uasharedpboardclientq", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    [(UASharedPasteboardClientController *)v8 setClientq:v10];

    id v11 = objc_alloc((Class)NSXPCListener);
    v12 = UASharedPasteboardManagerServiceName();
    id v13 = [v11 initWithMachServiceName:v12];
    [(UASharedPasteboardClientController *)v8 setXpclistener:v13];

    v14 = [(UASharedPasteboardClientController *)v8 xpclistener];
    [v14 setDelegate:v8];

    id v15 = objc_alloc((Class)NSXPCListener);
    long long v16 = UASharedPasteboardAUXServiceName();
    id v17 = [v15 initWithMachServiceName:v16];
    [(UASharedPasteboardClientController *)v8 setAuxlistener:v17];

    long long v18 = [(UASharedPasteboardClientController *)v8 auxlistener];
    [v18 setDelegate:v8];

    id v19 = objc_alloc_init((Class)NSMutableSet);
    [(UASharedPasteboardClientController *)v8 setControlConnections:v19];

    id v20 = objc_alloc((Class)NSXPCListener);
    v21 = UASharedPasteboardControllServiceName();
    id v22 = [v20 initWithMachServiceName:v21];
    [(UASharedPasteboardClientController *)v8 setControlListener:v22];

    v23 = [(UASharedPasteboardClientController *)v8 controlListener];
    [v23 setDelegate:v8];

    id v24 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.coreservices.uauseractivitypasteboardclient.xpc" options:0];
    [(UASharedPasteboardClientController *)v8 setClientNotificationConnection:v24];

    v25 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___UAPasteboardClientProtocol];
    v26 = [(UASharedPasteboardClientController *)v8 clientNotificationConnection];
    [v26 setRemoteObjectInterface:v25];

    v27 = [(UASharedPasteboardClientController *)v8 clientNotificationConnection];
    [v27 setInterruptionHandler:&stru_1000C53C8];

    objc_initWeak(buf, v8);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100030744;
    v37[3] = &unk_1000C4EE8;
    objc_copyWeak(&v38, buf);
    v28 = [(UASharedPasteboardClientController *)v8 clientNotificationConnection];
    [v28 setInvalidationHandler:v37];

    id v29 = objc_alloc_init((Class)NSMutableSet);
    [(UASharedPasteboardClientController *)v8 setCoders:v29];

    [(UASharedPasteboardClientController *)v8 setRemoteAvailable:0];
    v30 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/UserActivity.framework"];
    [(UASharedPasteboardClientController *)v8 setUaBundle:v30];

    v31 = [(UASharedPasteboardClientController *)v8 uaBundle];
    [v31 load];

    v32 = [(UASharedPasteboardClientController *)v8 xpclistener];
    [v32 resume];

    v33 = [(UASharedPasteboardClientController *)v8 auxlistener];
    [v33 resume];

    v34 = [(UASharedPasteboardClientController *)v8 controlListener];
    [v34 resume];

    v35 = [(UASharedPasteboardClientController *)v8 clientNotificationConnection];
    [v35 resume];

    objc_destroyWeak(&v38);
    objc_destroyWeak(buf);
  }

  return v8;
}

- (void)dealloc
{
  v3 = [(UASharedPasteboardClientController *)self clientConnection];
  [v3 invalidate];

  id v4 = [(UASharedPasteboardClientController *)self clientNotificationConnection];
  [v4 invalidate];

  v5 = [(UASharedPasteboardClientController *)self xpclistener];
  [v5 invalidate];

  v6.receiver = self;
  v6.super_class = (Class)UASharedPasteboardClientController;
  [(UASharedPasteboardClientController *)&v6 dealloc];
}

- (id)uuid
{
  if (qword_1000E6790 != -1) {
    dispatch_once(&qword_1000E6790, &stru_1000C53E8);
  }
  v2 = (void *)qword_1000E6788;

  return v2;
}

- (BOOL)localReflection
{
  v2 = +[UAUserActivityDefaults sharedDefaults];
  unsigned __int8 v3 = [v2 localPasteboardRefection];

  return v3;
}

- (void)setLocalReflection:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[UAUserActivityDefaults sharedDefaults];
  [v4 setLocalPasteboardReflection:v3];
}

- (BOOL)isScreenWatcherPresent
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL screenWatcherPresent = v2->_screenWatcherPresent;
  objc_sync_exit(v2);

  return screenWatcherPresent;
}

- (void)setScreenWatcherPresent:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (v4->_screenWatcherPresent != v3)
  {
    v4->_BOOL screenWatcherPresent = v3;
    if (v3)
    {
      v5 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] Screen sharing session started, disabling universal clipboard", buf, 2u);
      }

      [(UASharedPasteboardClientController *)v4 setRemotePasteboardAvalibility:0 withDataRequester:0];
      [(UASharedPasteboardClientController *)v4 clearLocalPasteboardInformation];
    }
    else
    {
      objc_super v6 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] No more screen sharing sessions, enabling universal clipboard", v7, 2u);
      }
    }
  }
  objc_sync_exit(v4);
}

- (void)startConnection:(int)a3
{
  id v4 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Process %d requested for UC to disable", (uint8_t *)v5, 8u);
  }
}

- (void)setRemotePasteboardAvalibility:(BOOL)a3 withDataRequester:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (![(UASharedPasteboardClientController *)self isScreenWatcherPresent] || !v4)
  {
    id v7 = self;
    objc_sync_enter(v7);
    if (v6 && v4)
    {
      id v8 = [[UCRemotePasteboardGeneration alloc] initWithRequester:v6];
      [(UASharedPasteboardClientController *)v7 setRemoteGeneration:v8];
    }
    else
    {
      uint64_t v9 = [(UASharedPasteboardClientController *)v7 fetchProgress];

      if (!v9) {
        [(UASharedPasteboardClientController *)v7 setRemoteGeneration:0];
      }
    }
    dispatch_queue_t v10 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v11 = @"NO";
      if (v4) {
        CFStringRef v11 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] Sending client xpc remote available update: %@", buf, 0xCu);
    }

    if (v4)
    {
      v12 = [(UASharedPasteboardClientController *)v7 remoteGeneration];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100030DC0;
      v15[3] = &unk_1000C5410;
      v15[4] = v7;
      [v12 requestRemoteTypeInfo:v15];
    }
    id v13 = [(UASharedPasteboardClientController *)v7 clientNotificationConnection];
    v14 = [v13 remoteObjectProxyWithErrorHandler:&stru_1000C5450];
    [v14 remotePasteboardAvailable:v4];

    objc_sync_exit(v7);
  }
}

- (void)setReturnPasteboardDataEarlyWithCompletion:(id)a3
{
  id v8 = (void (**)(id, BOOL))a3;
  BOOL v4 = self;
  objc_sync_enter(v4);
  v5 = [(UASharedPasteboardClientController *)v4 remoteGeneration];

  if (v5)
  {
    id v6 = [(UASharedPasteboardClientController *)v4 remoteGeneration];
    [v6 setReturnEarly:1];

    id v7 = [(UASharedPasteboardClientController *)v4 remoteGeneration];
    v8[2](v8, [v7 state] == (id)5);
  }
  else
  {
    v8[2](v8, 1);
  }
  objc_sync_exit(v4);
}

- (void)fetchRemotePasteboardStatus:(id)a3
{
  id v5 = a3;
  id v6 = [(UASharedPasteboardClientController *)self remoteGeneration];
  (*((void (**)(id, BOOL))a3 + 2))(v5, v6 != 0);
}

- (void)fetchRemoteDeviceName:(id)a3
{
  id v5 = a3;
  id v9 = [(UASharedPasteboardClientController *)self remoteGeneration];
  id v6 = [v9 dataRequester];
  id v7 = [v6 peer];
  id v8 = [v7 name];
  (*((void (**)(id, void *))a3 + 2))(v5, v8);
}

- (void)localPasteboardTypesDidChange:(id)a3 forGeneration:(unint64_t)a4
{
  id v6 = a3;
  id v7 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    unint64_t v34 = a4;
    __int16 v35 = 2112;
    id v36 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] Got type update from client, gen: %lu, %@", buf, 0x16u);
  }

  if ([(UASharedPasteboardClientController *)self isScreenWatcherPresent])
  {
    id v8 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v9 = "[PBOARD CONTROLLER] Ignoring type updates, screen sharing session in progress";
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  dispatch_queue_t v10 = +[UAUserActivityDefaults sharedDefaults];
  unsigned __int8 v11 = [v10 clipboardSharingEnabled];

  if ((v11 & 1) == 0)
  {
    id v8 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v9 = "[PBOARD CONTROLLER] Ignoring type updates, clipboard sharing disabled";
      goto LABEL_15;
    }
LABEL_21:

    goto LABEL_22;
  }
  if ([(UASharedPasteboardClientController *)self currentLocalGeneration] <= a4)
  {
    if ([(UASharedPasteboardClientController *)self currentLocalGeneration] < a4)
    {
      v12 = +[UASharedPasteboardDataManager sharedInstance];
      [v12 cleanupCloneDir];
    }
    [(UASharedPasteboardClientController *)self setCurrentLocalTypes:v6];
    [(UASharedPasteboardClientController *)self setCurrentLocalGeneration:a4];
    [(UASharedPasteboardClientController *)self setHasFetchedLocalData:0];
    if ([(UASharedPasteboardClientController *)self localReflection])
    {
      id v13 = +[UASharedPasteboardDataManager sharedInstance];
      v14 = [v13 createFileForLocalPasteboardBlob];

      id v15 = +[UASharedPasteboardDataManager sharedInstance];
      long long v16 = [v15 fileURLForCloneItems];

      CFStringRef v17 = [(UASharedPasteboardClientController *)self clientConnection];
      long long v18 = v17;
      if (v17) {
        [v17 auditToken];
      }
      else {
        memset(v32, 0, sizeof(v32));
      }
      id v19 = sub_1000301D4(v16, v32);

      id v20 = [(UASharedPasteboardClientController *)self clientConnection];
      v21 = [v20 remoteObjectProxy];
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_100031540;
      v31[3] = &unk_1000C5410;
      v31[4] = self;
      [v21 writeLocalPasteboardToFile:v14 itemDir:v16 extension:v19 withCompletion:v31];
    }
    [(UASharedPasteboardClientController *)self setAdvertiseTypes:1];
    id v22 = [(UACornerActionManagerHandler *)self manager];
    [v22 scheduleUpdatingAdvertisableItems];

    v23 = [(UASharedPasteboardClientController *)self localTimeout];

    if (v23)
    {
      id v24 = [(UASharedPasteboardClientController *)self localTimeout];
      [v24 invalidate];
    }
    v25 = +[UAUserActivityDefaults sharedDefaults];
    [v25 localPasteboardAvalibilityTimeout];
    double v27 = v26;

    v28 = +[NSTimer timerWithTimeInterval:self target:"clearLocalPasteboardTypes:" selector:0 userInfo:0 repeats:v27];
    [(UASharedPasteboardClientController *)self setLocalTimeout:v28];

    id v29 = +[NSRunLoop mainRunLoop];
    v30 = [(UASharedPasteboardClientController *)self localTimeout];
    [v29 addTimer:v30 forMode:NSRunLoopCommonModes];

    id v8 = +[UASharedPasteboardDataManager sharedInstance];
    [v8 cleanupItemsDir];
    goto LABEL_21;
  }
LABEL_22:
}

- (void)clearLocalPasteboardInformation
{
  BOOL v3 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] Clear local pasteboard info: from client", v5, 2u);
  }

  [(UASharedPasteboardClientController *)self setCurrentLocalGeneration:0];
  [(UASharedPasteboardClientController *)self clearLocalPasteboardTypes:0];
  BOOL v4 = +[UADiagnosticManager sharedManager];
  [v4 submitLocalPasteboardInfoWasCleared];
}

- (void)clearLocalPasteboardTypes:(id)a3
{
  BOOL v4 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] Remove Local Types Fired", v15, 2u);
  }

  id v5 = [(UASharedPasteboardClientController *)self pasteAdvertiser];
  [v5 stop];

  [(UASharedPasteboardClientController *)self setPasteAdvertiser:0];
  [(UASharedPasteboardClientController *)self setCurrentLocalTypes:0];
  [(UASharedPasteboardClientController *)self setCurrentLocalPasteboard:0];
  [(UASharedPasteboardClientController *)self setCurrentLocalPasteboardSize:0];
  id v6 = [(UASharedPasteboardClientController *)self localInfo];

  if (!v6) {
    [(UASharedPasteboardClientController *)self setPboardInfoToSend:0];
  }
  if ([(UASharedPasteboardClientController *)self localReflection]) {
    [(UASharedPasteboardClientController *)self setRemotePasteboardAvalibility:0 withDataRequester:0];
  }
  id v7 = [(UASharedPasteboardClientController *)self localTimeout];
  [v7 invalidate];

  id v8 = [(UACornerActionManagerHandler *)self manager];
  [v8 scheduleUpdatingAdvertisableItems];

  id v9 = +[UAUserActivityDefaults sharedDefaults];
  [v9 localPasteboardAvalibilityClearedTimeout];
  double v11 = v10;

  v12 = +[NSTimer timerWithTimeInterval:self target:"removeLocalPasteboardFromAdvertisers:" selector:0 userInfo:0 repeats:v11];
  [(UASharedPasteboardClientController *)self setLocalTimeout:v12];

  id v13 = +[NSRunLoop mainRunLoop];
  v14 = [(UASharedPasteboardClientController *)self localTimeout];
  [v13 addTimer:v14 forMode:NSRunLoopCommonModes];
}

- (void)removeLocalPasteboardFromAdvertisers:(id)a3
{
  BOOL v4 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] Remove Local Timer Fired", v7, 2u);
  }

  [(UASharedPasteboardClientController *)self setAdvertiseTypes:0];
  id v5 = [(UASharedPasteboardClientController *)self localTimeout];
  [v5 invalidate];

  [(UASharedPasteboardClientController *)self setLocalTimeout:0];
  id v6 = [(UACornerActionManagerHandler *)self manager];
  [v6 scheduleUpdatingAdvertisableItems];
}

- (void)fetchRemotePasteboardTypesForProcess:(int)a3 withCompletion:(id)a4
{
  id v5 = (void (**)(id, UASharedPasteboardClientController *, void))a4;
  id v6 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] Pasteboard types fetch requested", buf, 2u);
  }

  if ([(UASharedPasteboardClientController *)self localReflection])
  {
    id v7 = (UASharedPasteboardClientController *)objc_alloc_init((Class)UASharedPasteboardInfo);
    id v8 = [(UASharedPasteboardClientController *)self currentLocalPasteboard];
    [(UASharedPasteboardClientController *)v7 setItems:v8];

    v5[2](v5, v7, 0);
  }
  else
  {
    id v7 = self;
    objc_sync_enter(v7);
    id v9 = [(UASharedPasteboardClientController *)v7 remoteGeneration];

    if (v9)
    {
      double v10 = [(UASharedPasteboardClientController *)v7 remoteGeneration];
      id v11 = [v10 state];

      v12 = [(UASharedPasteboardClientController *)v7 remoteGeneration];
      if ((unint64_t)v11 < 3)
      {
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_100031B90;
        v14[3] = &unk_1000C5478;
        v14[4] = v7;
        id v15 = v5;
        [v12 requestRemoteTypeInfo:v14];

        v12 = v15;
      }
      else
      {
        id v13 = [v12 pbInfo];
        v5[2](v5, v13, 0);
      }
    }
    else
    {
      v5[2](v5, 0, 0);
    }
    objc_sync_exit(v7);
  }
}

- (void)fetchRemotePasteboardForProcess:(int)a3 withCompletion:(id)a4
{
  v79[0] = 0;
  v79[1] = v79;
  v79[2] = 0x2020000000;
  char v80 = 0;
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = sub_100032624;
  v76[3] = &unk_1000C54A0;
  v78 = v79;
  v76[4] = self;
  id v56 = a4;
  id v77 = v56;
  v55 = objc_retainBlock(v76);
  id v6 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v86) = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] Pasteboard data fetch requested for pid: %d", buf, 8u);
  }

  if (![(UASharedPasteboardClientController *)self localReflection])
  {
    double v10 = self;
    objc_sync_enter(v10);
    val = v10;
    id v11 = [(UASharedPasteboardClientController *)v10 remoteGeneration];
    LODWORD(v10) = [v11 state] == (id)5;

    if (v10)
    {
      v12 = [(UASharedPasteboardClientController *)val remoteGeneration];
      id v53 = [v12 pbInfo];

      id v13 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v86 = *(double *)&v53;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] Already have remote data, using it: %@", buf, 0xCu);
      }

      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      id obj = [v53 items];
      id v60 = [obj countByEnumeratingWithState:&v72 objects:v84 count:16];
      if (v60)
      {
        uint64_t v59 = *(void *)v73;
        do
        {
          v61 = 0;
          do
          {
            if (*(void *)v73 != v59) {
              objc_enumerationMutation(obj);
            }
            v14 = *(void **)(*((void *)&v72 + 1) + 8 * (void)v61);
            long long v68 = 0u;
            long long v69 = 0u;
            long long v70 = 0u;
            long long v71 = 0u;
            id v15 = [v14 types];
            id v16 = [v15 countByEnumeratingWithState:&v68 objects:v83 count:16];
            if (v16)
            {
              uint64_t v17 = *(void *)v69;
              do
              {
                long long v18 = 0;
                do
                {
                  if (*(void *)v69 != v17) {
                    objc_enumerationMutation(v15);
                  }
                  uint64_t v19 = *(void *)(*((void *)&v68 + 1) + 8 * (void)v18);
                  id v20 = +[UASharedPasteboardDataManager sharedInstance];
                  v21 = [v20 remotePasteboardBlobForReading];
                  id v22 = [v14 types];
                  v23 = [v22 objectForKeyedSubscript:v19];
                  [v23 setDataFile:v21];

                  long long v18 = (char *)v18 + 1;
                }
                while (v16 != v18);
                id v16 = [v15 countByEnumeratingWithState:&v68 objects:v83 count:16];
              }
              while (v16);
            }

            v61 = (char *)v61 + 1;
          }
          while (v61 != v60);
          id v60 = [obj countByEnumeratingWithState:&v72 objects:v84 count:16];
        }
        while (v60);
      }

      id v24 = +[UASharedPasteboardDataManager sharedInstance];
      v25 = [v24 remotePasteboardBlobForReading];
      [v53 setDataFile:v25];

      (*((void (**)(id, id, void))v56 + 2))(v56, v53, 0);
    }
    else
    {
      double v26 = [(UASharedPasteboardClientController *)val remoteGeneration];
      BOOL v27 = [v26 state] == (id)6;

      if (v27)
      {
        v54 = +[NSError errorWithDomain:UAContinuityErrorDomain code:-125 userInfo:0];
        (*((void (**)(id, void, void *))v56 + 2))(v56, 0, v54);

LABEL_32:
        objc_sync_exit(val);
        goto LABEL_33;
      }
      v28 = [(UASharedPasteboardClientController *)val remoteGeneration];

      if (!v28)
      {
        ((void (*)(void *, void, void))v55[2])(v55, 0, 0);
        goto LABEL_32;
      }
      id v29 = [(UASharedPasteboardClientController *)val remoteGeneration];
      v30 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] Requesting data from remote device", buf, 2u);
      }

      [(UASharedPasteboardClientController *)val setPasteFetchStartTime:mach_absolute_time()];
      v31 = objc_alloc_init(UARemotePasteboardWasRequestedEvent);
      [(UASharedPasteboardClientController *)val setPasteInfo:v31];

      v32 = [(UASharedPasteboardClientController *)val remoteGeneration];
      v33 = [v32 dataRequester];
      unint64_t v34 = [v33 peer];
      __int16 v35 = [v34 modelIdentifier];
      id v36 = [(UASharedPasteboardClientController *)val pasteInfo];
      [v36 setRemoteDeviceType:v35];

      v37 = +[UAUserActivityDefaults sharedDefaults];
      [v37 pasteboardShowUIDelay];
      double v39 = v38;

      objc_super v40 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        double v86 = v39;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "[PBOARD CONTROLLER] Starting timer to show UI in %lf sec", buf, 0xCu);
      }

      v41 = +[NSTimer timerWithTimeInterval:val target:"showProgressUI:" selector:0 userInfo:0 repeats:v39];
      [(UASharedPasteboardClientController *)val setShowUITimer:v41];

      v42 = +[NSRunLoop mainRunLoop];
      v43 = [(UASharedPasteboardClientController *)val showUITimer];
      [v42 addTimer:v43 forMode:NSRunLoopCommonModes];

      objc_initWeak((id *)buf, val);
      id v44 = objc_alloc((Class)NSProgress);
      v45 = +[NSProgress currentProgress];
      uint64_t v81 = NSProgressCategoryKey;
      CFStringRef v82 = @"UASharedPasteboard";
      v46 = +[NSDictionary dictionaryWithObjects:&v82 forKeys:&v81 count:1];
      id v47 = [v44 initWithParent:v45 userInfo:v46];
      [(UASharedPasteboardClientController *)val setFetchProgress:v47];

      v48 = [(UASharedPasteboardClientController *)val fetchProgress];
      [v48 setKind:NSProgressKindFile];

      v49 = [(UASharedPasteboardClientController *)val fetchProgress];
      [v49 setCancellable:1];

      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472;
      v65[2] = sub_10003271C;
      v65[3] = &unk_1000C54C8;
      objc_copyWeak(&v67, (id *)buf);
      v50 = v55;
      id v66 = v50;
      v51 = [(UASharedPasteboardClientController *)val fetchProgress];
      [v51 setCancellationHandler:v65];

      v52 = [(UASharedPasteboardClientController *)val fetchProgress];
      [v52 _publish];

      v62[0] = _NSConcreteStackBlock;
      v62[1] = 3221225472;
      v62[2] = sub_1000329C4;
      v62[3] = &unk_1000C54F0;
      v62[4] = val;
      v64 = v50;
      id v63 = v29;
      id v53 = v63;
      [v63 requestRemotePasteboardData:v62];

      objc_destroyWeak(&v67);
      objc_destroyWeak((id *)buf);
    }

    goto LABEL_32;
  }
  val = (UASharedPasteboardClientController *)objc_alloc_init((Class)UASharedPasteboardInfo);
  id v7 = +[UASharedPasteboardDataManager sharedInstance];
  id v8 = [v7 localPasteboardBlobForReading];
  [(UASharedPasteboardClientController *)val setDataFile:v8];

  id v9 = [(UASharedPasteboardClientController *)self currentLocalPasteboard];
  [(UASharedPasteboardClientController *)val setItems:v9];

  [(UASharedPasteboardClientController *)val setDataSize:[(UASharedPasteboardClientController *)self currentLocalPasteboardSize]];
  (*((void (**)(id, UASharedPasteboardClientController *, void))v56 + 2))(v56, val, 0);
LABEL_33:

  _Block_object_dispose(v79, 8);
}

- (void)receivePasteboardStreamData:(id)a3 version:(int64_t)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  double v10 = [(UASharedPasteboardClientController *)self pasteInfo];
  [v10 setUsedStreams:1];

  if (objc_opt_class()) {
    id v11 = [objc_alloc((Class)SFCompanionAdvertiser) initWithServiceType:0];
  }
  else {
    id v11 = 0;
  }
  v12 = dispatch_get_global_queue(25, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000333C0;
  block[3] = &unk_1000C5590;
  id v19 = v9;
  int64_t v20 = a4;
  block[4] = self;
  id v17 = v11;
  id v18 = v8;
  id v13 = v9;
  id v14 = v8;
  id v15 = v11;
  dispatch_async(v12, block);
}

- (void)setLocalPasteboardReflection:(BOOL)a3
{
}

- (void)getLocalPasteboardInfoData:(id)a3
{
  BOOL v4 = (void (**)(id, void *, void))a3;
  id v5 = objc_alloc_init(UASharedPasteboardInfoWrapper);
  id v6 = [(UASharedPasteboardClientController *)self currentLocalTypes];
  [(UASharedPasteboardInfoWrapper *)v5 setPbinfo:v6];

  [(UASharedPasteboardInfoWrapper *)v5 setProtocolVersion:2];
  id v7 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412290;
    double v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[PBOARD CONTROLLER] Archiving pbinfo: %@", (uint8_t *)&v9, 0xCu);
  }

  id v8 = +[NSKeyedArchiver archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];
  v4[2](v4, v8, 0);
}

- (void)startServiceForPasteVersion:(int64_t)a3 handler:(id)a4
{
  id v6 = a4;
  [(UASharedPasteboardClientController *)self setLocalSendStartTime:mach_absolute_time()];
  id v7 = objc_alloc_init(UARemotePasteboardDidSendLocalEvent);
  [(UASharedPasteboardClientController *)self setLocalInfo:v7];

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000352C0;
  v33[3] = &unk_1000C5328;
  v33[4] = self;
  id v8 = v6;
  id v34 = v8;
  int v9 = objc_retainBlock(v33);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10003551C;
  v30[3] = &unk_1000C55B8;
  int64_t v32 = a3;
  v30[4] = self;
  id v10 = v8;
  id v31 = v10;
  id v11 = objc_retainBlock(v30);
  if ([(UASharedPasteboardClientController *)self hasFetchedLocalData])
  {
    v12 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[PBOARD CONTROLLER] Pasteboard data alread fetched sending now", buf, 2u);
    }

    id v13 = [(UASharedPasteboardClientController *)self pboardInfoToSend];
    id v14 = [v13 pbinfo];
    id v15 = [v14 dataSize];
    id v16 = +[UAUserActivityDefaults sharedDefaults];
    id v17 = [v16 pasteboardEmbeddedPayloadSizeLimitInBytes];

    if ((uint64_t)v15 >= (uint64_t)v17) {
      ((void (*)(void *))v11[2])(v11);
    }
    else {
      ((void (*)(void *))v9[2])(v9);
    }
  }
  else
  {
    id v18 = [(UASharedPasteboardClientController *)self pboardFetchSem];

    if (!v18)
    {
      dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
      [(UASharedPasteboardClientController *)self setPboardFetchSem:v19];
    }
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10003577C;
    v25[3] = &unk_1000C5630;
    v25[4] = self;
    id v26 = v10;
    BOOL v27 = v9;
    v28 = v11;
    int64_t v20 = objc_retainBlock(v25);
    v21 = [(UASharedPasteboardClientController *)self clientq];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100036300;
    v23[3] = &unk_1000C5328;
    v23[4] = self;
    id v24 = v20;
    id v22 = v20;
    dispatch_async(v21, v23);
  }
}

- (void)advertiser:(id)a3 didReceiveInputStream:(id)a4 outputStream:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] Received streams, waiting for local data to be available", (uint8_t *)buf, 2u);
  }

  unint64_t v12 = +[UADiagnosticUtils absoluteToNSec:mach_absolute_time() - [(UASharedPasteboardClientController *)self streamOpenStartTime]];
  id v13 = [(UASharedPasteboardClientController *)self localInfo];
  [v13 setStreamOpenDelay:v12];

  id v14 = [(UASharedPasteboardClientController *)self pboardFetchSem];

  if (!v14
    || ([(UASharedPasteboardClientController *)self pboardFetchSem],
        id v15 = objc_claimAutoreleasedReturnValue(),
        dispatch_time_t v16 = dispatch_time(0, 2000000000),
        intptr_t v17 = dispatch_semaphore_wait(v15, v16),
        v15,
        [(UASharedPasteboardClientController *)self setPboardFetchSem:0],
        !v17))
  {
    int64_t v20 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] Local data available, starting out stream", (uint8_t *)buf, 2u);
    }

    v21 = [(UASharedPasteboardClientController *)self pboardInfoToSend];
    id v22 = +[UASharedPasteboardDataManager sharedInstance];
    v23 = [v22 localPasteboardBlobForReading];
    id v24 = [v21 pbinfo];
    [v24 setDataFile:v23];

    objc_initWeak(buf, self);
    [(UASharedPasteboardClientController *)self setStreamXferStartTime:mach_absolute_time()];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100036A14;
    v29[3] = &unk_1000C5680;
    objc_copyWeak(&v30, buf);
    v25 = objc_retainBlock(v29);
    if ((id)[(UASharedPasteboardClientController *)self sendingCoderVersion] == (id)1)
    {
      id v26 = [[UAPBStreamCoderV1 alloc] initWithInputStream:v9 outputStream:v10];
      [(UAPBStreamCoderV1 *)v26 sendPasteboard:v21 withCompletion:v25];
      BOOL v27 = [(UASharedPasteboardClientController *)self coders];
      objc_sync_enter(v27);
      v28 = [(UASharedPasteboardClientController *)self coders];
      [v28 addObject:v26];
    }
    else
    {
      if ((id)[(UASharedPasteboardClientController *)self sendingCoderVersion] != (id)2)
      {
LABEL_15:

        objc_destroyWeak(&v30);
        objc_destroyWeak(buf);

        goto LABEL_16;
      }
      id v26 = [[UCStreamCoderV2 alloc] initWithInputStream:v9 outputStream:v10];
      [(UAPBStreamCoderV1 *)v26 sendPasteboard:v21 withCompletion:v25];
      BOOL v27 = [(UASharedPasteboardClientController *)self coders];
      objc_sync_enter(v27);
      v28 = [(UASharedPasteboardClientController *)self coders];
      [v28 addObject:v26];
    }

    objc_sync_exit(v27);
    goto LABEL_15;
  }
  id v18 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "[PBOARD CONTROLLER] Timeout getting local pasteboard", (uint8_t *)buf, 2u);
  }

  sub_100033BB0(v19, v9, v10);
LABEL_16:
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = (UAAuditToken *)a4;
  id v8 = [(UAAuditToken *)v7 valueForEntitlement:@"com.apple.private.coreservices.useractivityd.sharedpasteboard"];
  unsigned __int8 v9 = [v8 BOOLValue];

  if ((v9 & 1) == 0)
  {
    intptr_t v17 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = [UAAuditToken alloc];
      if (v7) {
        [(UAAuditToken *)v7 auditToken];
      }
      else {
        memset(v42, 0, sizeof(v42));
      }
      id v30 = [(UAAuditToken *)v18 initWithAuditToken:v42];
      *(_DWORD *)buf = 138412290;
      id v44 = v30;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "[PBOARD CONTROLLER] New client connection does not have correct entitlement: %@", buf, 0xCu);
    }
    [(UAAuditToken *)v7 invalidate];
    goto LABEL_21;
  }
  id v10 = [(UASharedPasteboardClientController *)self xpclistener];
  unsigned int v11 = [v6 isEqual:v10];

  if (!v11)
  {
    uint64_t v19 = [(UASharedPasteboardClientController *)self auxlistener];
    unsigned int v20 = [v6 isEqual:v19];

    if (v20)
    {
      v21 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v44 = v7;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] Received new aux connection: %@", buf, 0xCu);
      }

      [(UAAuditToken *)v7 setExportedObject:self];
      id v22 = sub_100047000();
      [(UAAuditToken *)v7 setExportedInterface:v22];

      [(UAAuditToken *)v7 setInterruptionHandler:&stru_1000C56E8];
      objc_initWeak((id *)buf, self);
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_10003764C;
      v37[3] = &unk_1000C4EE8;
      objc_copyWeak(&v38, (id *)buf);
      [(UAAuditToken *)v7 setInvalidationHandler:v37];
      [(UAAuditToken *)v7 resume];
      [(UASharedPasteboardClientController *)self setAuxConnection:v7];
      objc_destroyWeak(&v38);
      objc_destroyWeak((id *)buf);
      goto LABEL_17;
    }
    v23 = [(UASharedPasteboardClientController *)self controlListener];
    unsigned int v24 = [v6 isEqual:v23];

    if (v24)
    {
      [(UAAuditToken *)v7 setExportedObject:self];
      v25 = sub_10004709C();
      [(UAAuditToken *)v7 setExportedInterface:v25];

      [(UAAuditToken *)v7 setInterruptionHandler:&stru_1000C5708];
      objc_initWeak((id *)buf, self);
      objc_initWeak(&location, v7);
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_1000376DC;
      v33[3] = &unk_1000C5730;
      objc_copyWeak(&v34, (id *)buf);
      objc_copyWeak(&v35, &location);
      [(UAAuditToken *)v7 setInvalidationHandler:v33];
      [(UAAuditToken *)v7 resume];
      id v26 = [(UASharedPasteboardClientController *)self controlConnections];
      objc_sync_enter(v26);
      BOOL v27 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v32[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "New Controller connection, disabling UC", (uint8_t *)v32, 2u);
      }

      v28 = [(UASharedPasteboardClientController *)self controlConnections];
      [v28 addObject:v7];

      objc_sync_exit(v26);
      [(UASharedPasteboardClientController *)self setScreenWatcherPresent:1];
      objc_destroyWeak(&v35);
      objc_destroyWeak(&v34);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);
      goto LABEL_17;
    }
LABEL_21:
    BOOL v29 = 0;
    goto LABEL_22;
  }
  unint64_t v12 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v44 = v7;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] Received new client connection: %@", buf, 0xCu);
  }

  id v13 = sub_100046E00();
  [(UAAuditToken *)v7 setRemoteObjectInterface:v13];

  [(UAAuditToken *)v7 setExportedObject:self];
  id v14 = sub_100046BE8();
  [(UAAuditToken *)v7 setExportedInterface:v14];

  [(UAAuditToken *)v7 setInterruptionHandler:&stru_1000C56A0];
  id v15 = [(UASharedPasteboardClientController *)self clientConnection];
  objc_initWeak((id *)buf, self);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1000374F4;
  v39[3] = &unk_1000C56C8;
  objc_copyWeak(&v41, (id *)buf);
  id v16 = v15;
  id v40 = v16;
  [(UAAuditToken *)v7 setInvalidationHandler:v39];
  [(UAAuditToken *)v7 resume];
  [(UASharedPasteboardClientController *)self setClientConnection:v7];

  objc_destroyWeak(&v41);
  objc_destroyWeak((id *)buf);

LABEL_17:
  BOOL v29 = 1;
LABEL_22:

  return v29;
}

- (void)showProgressUI:(id)a3
{
  id v4 = a3;
  [v4 invalidate];
  id v5 = self;
  objc_sync_enter(v5);
  if ([(UASharedPasteboardClientController *)v5 isUIVisible])
  {
    id v6 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] show pbui, but already visible, skipping", buf, 2u);
    }

    objc_sync_exit(v5);
  }
  else
  {
    [(UASharedPasteboardClientController *)v5 setIsUIVisible:1];
    objc_sync_exit(v5);

    id v7 = +[UAUserActivityDefaults sharedDefaults];
    [v7 pasteboardUIMinimumDurration];
    double v9 = v8;

    id v10 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v37 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[PBOARD CONTROLLER] Setting durration time for %lf sec", buf, 0xCu);
    }

    unsigned int v11 = +[NSDate dateWithTimeIntervalSinceNow:v9];
    [(UASharedPasteboardClientController *)v5 setDontHideUIBefore:v11];

    unint64_t v12 = [(UASharedPasteboardClientController *)v5 remoteGeneration];
    id v13 = [v12 dataRequester];
    id v14 = [v13 peer];

    id v15 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [(UACornerActionManagerHandler *)v14 name];
      intptr_t v17 = [(UASharedPasteboardClientController *)v14 modelIdentifier];
      id v18 = [(UASharedPasteboardClientController *)v14 deviceColor];
      *(_DWORD *)buf = 138412802;
      double v37 = *(double *)&v16;
      __int16 v38 = 2112;
      double v39 = v17;
      __int16 v40 = 2112;
      id v41 = v18;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] Setup progress UI: %@, %@, %@", buf, 0x20u);
    }
    id v19 = objc_alloc_init((Class)NSMutableDictionary);
    unsigned int v20 = [(UACornerActionManagerHandler *)v14 name];
    BOOL v21 = [v20 length] == 0;

    id v22 = [(UASharedPasteboardClientController *)v5 uaBundle];
    if (v21)
    {
      v23 = [v22 localizedStringForKey:@"main-label.default-title" value:&stru_1000C6800 table:@"Localizable"];
      [v19 setObject:v23 forKeyedSubscript:kCFUserNotificationAlertHeaderKey];
    }
    else
    {
      v23 = [v22 localizedStringForKey:@"main-label.title" value:&stru_1000C6800 table:@"Localizable"];
      unsigned int v24 = [(UACornerActionManagerHandler *)v14 name];
      v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v24);
      [v19 setObject:v25 forKeyedSubscript:kCFUserNotificationAlertHeaderKey];
    }
    id v26 = [(UASharedPasteboardClientController *)v5 uaBundle];
    BOOL v27 = [v26 localizedStringForKey:@"cancel-button.title" value:&stru_1000C6800 table:@"Localizable"];
    [v19 setObject:v27 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

    [v19 setObject:&__kCFBooleanTrue forKeyedSubscript:kCFUserNotificationAlertTopMostKey];
    [v19 setObject:&__kCFBooleanTrue forKeyedSubscript:SBUserNotificationDismissOnLock];
    [v19 setObject:&__kCFBooleanTrue forKeyedSubscript:SBUserNotificationDisableIdleSleepWhileVisible];
    [v19 setObject:@"com.apple.UserActivity.UASharedPasteboardiOSUI" forKeyedSubscript:SBUserNotificationExtensionIdentifierKey];
    v28 = +[NSKeyedArchiver archivedDataWithRootObject:&__NSArray0__struct requiringSecureCoding:1 error:0];
    [v19 setObject:v28 forKeyedSubscript:SBUserNotificationExtensionItemsKey];

    BOOL v29 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      double v37 = *(double *)&v19;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "[PBOARD CONTROLLER] Creating notification for progress ui with options: %@", buf, 0xCu);
    }

    SInt32 error = 0;
    CFUserNotificationRef v30 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 3uLL, &error, (CFDictionaryRef)v19);
    v5->_notificationRef = v30;
    id v31 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v37) = error;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "[PBOARD CONTROLLER] Notification creation err: %d", buf, 8u);
    }

    if (error || !v30)
    {
      v33 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67240192;
        LODWORD(v37) = error;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "[PBOARD CONTROLLER] Failed to created user notification ref, err=%{public}d", buf, 8u);
      }
    }
    else
    {
      int64_t v32 = dispatch_get_global_queue(25, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100037EFC;
      block[3] = &unk_1000C5780;
      block[4] = v5;
      void block[5] = v30;
      dispatch_async(v32, block);
    }
    id v5 = v14;
  }
}

- (void)hideProgressUI:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(UASharedPasteboardClientController *)v4 setIsUIVisible:0];
  objc_sync_exit(v4);

  double v5 = 0.0;
  if (!v3)
  {
    id v6 = [(UASharedPasteboardClientController *)v4 dontHideUIBefore];
    [v6 timeIntervalSinceNow];
    double v8 = v7;

    if (v8 < 0.0) {
      double v5 = 0.0;
    }
    else {
      double v5 = v8;
    }
  }
  double v9 = +[UAUserActivityDefaults sharedDefaults];
  [v9 pasteboardHideUIDelay];
  double v11 = v10;

  unint64_t v12 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[PBOARD CONTROLLER] Adding hide delay of %lf sec", buf, 0xCu);
  }

  id v13 = sub_10000BA18(@"pasteboard-server");
  double v14 = v5 + v11;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v15 = @"NO";
    if (v3) {
      CFStringRef v15 = @"YES";
    }
    *(_DWORD *)buf = 134218242;
    double v22 = v14;
    __int16 v23 = 2112;
    CFStringRef v24 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] Hide progress in %lf sec with fail: %@", buf, 0x16u);
  }

  if (!v3 && v14 < 1.25)
  {
    id v16 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[PBOARD CONTROLLER] iOS needs a minimum delay of 1.25 sec, updating delay to 1.25", buf, 2u);
    }

    double v14 = 1.25;
  }
  dispatch_time_t v17 = dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
  id v18 = [(UASharedPasteboardClientController *)v4 clientq];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100038514;
  block[3] = &unk_1000C4CF0;
  block[4] = v4;
  dispatch_after(v17, v18, block);

  id v19 = [(UASharedPasteboardClientController *)v4 fetchProgress];
  [v19 _unpublish];
}

- (id)statusString
{
  return &stru_1000C6800;
}

- (id)localPBStatus
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  if ([(UASharedPasteboardClientController *)self isScreenWatcherPresent])
  {
    id v4 = [(UASharedPasteboardClientController *)self controlConnections];
    double v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"##### Screen Sharing session in progress, Universal Clipboard is disabled: %lu #####\n", [v4 count]);
    [v3 appendString:v5];
  }
  id v6 = [(UASharedPasteboardClientController *)self remoteGeneration];
  if (v6) {
    CFStringRef v7 = @"Available";
  }
  else {
    CFStringRef v7 = @"Unavailable";
  }
  unint64_t v8 = [(UASharedPasteboardClientController *)self currentLocalGeneration];
  if ([(UASharedPasteboardClientController *)self isScreenWatcherPresent]) {
    CFStringRef v9 = @"SCREENSHARING ";
  }
  else {
    CFStringRef v9 = &stru_1000C6800;
  }
  unsigned int v10 = [(UASharedPasteboardClientController *)self localReflection];
  CFStringRef v11 = @"off";
  if (v10) {
    CFStringRef v11 = @"ON";
  }
  [v3 appendFormat:@"##### Continuity Pasteboard: Remote Pasteboard:%@, Local generation=%ld, %@reflection:%@\n", v7, v8, v9, v11];

  unint64_t v12 = [(UASharedPasteboardClientController *)self currentLocalPasteboard];

  if (v12)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v13 = [(UASharedPasteboardClientController *)self currentLocalPasteboard];
    id v14 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v33;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v33 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = [*(id *)(*((void *)&v32 + 1) + 8 * i) description];
          [v3 appendFormat:@"  %@\r\n", v18];
        }
        id v15 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v15);
    }
  }
  else
  {
    id v19 = [(UASharedPasteboardClientController *)self currentLocalTypes];
    unsigned int v20 = [v19 items];
    id v21 = [v20 count];

    if (v21)
    {
      unint64_t v22 = 0;
      do
      {
        __int16 v23 = [(UASharedPasteboardClientController *)self currentLocalTypes];
        CFStringRef v24 = [v23 items];
        v25 = [v24 objectAtIndexedSubscript:v22];

        id v26 = +[NSNumber numberWithInt:v22];
        BOOL v27 = [v25 description];
        [v3 appendFormat:@"Item: %@ \"%@\"\r\n", v26, v27];

        ++v22;
        v28 = [(UASharedPasteboardClientController *)self currentLocalTypes];
        BOOL v29 = [v28 items];
        id v30 = [v29 count];
      }
      while ((unint64_t)v30 > v22);
    }
  }

  return v3;
}

- (OS_dispatch_queue)clientq
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setClientq:(id)a3
{
}

- (NSXPCListener)xpclistener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 64, 1);
}

- (void)setXpclistener:(id)a3
{
}

- (NSXPCListener)auxlistener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAuxlistener:(id)a3
{
}

- (NSXPCListener)controlListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 80, 1);
}

- (void)setControlListener:(id)a3
{
}

- (NSXPCConnection)auxConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAuxConnection:(id)a3
{
}

- (NSXPCConnection)clientConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 96, 1);
}

- (void)setClientConnection:(id)a3
{
}

- (NSXPCConnection)clientNotificationConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 104, 1);
}

- (void)setClientNotificationConnection:(id)a3
{
}

- (NSMutableSet)controlConnections
{
  return (NSMutableSet *)objc_getProperty(self, a2, 112, 1);
}

- (void)setControlConnections:(id)a3
{
}

- (UASharedPasteboardInfo)currentLocalTypes
{
  return (UASharedPasteboardInfo *)objc_getProperty(self, a2, 120, 1);
}

- (void)setCurrentLocalTypes:(id)a3
{
}

- (unint64_t)currentLocalGeneration
{
  return self->_currentLocalGeneration;
}

- (void)setCurrentLocalGeneration:(unint64_t)a3
{
  self->_currentLocalGeneration = a3;
}

- (NSTimer)localTimeout
{
  return (NSTimer *)objc_getProperty(self, a2, 136, 1);
}

- (void)setLocalTimeout:(id)a3
{
}

- (BOOL)hasFetchedLocalData
{
  return self->_hasFetchedLocalData;
}

- (void)setHasFetchedLocalData:(BOOL)a3
{
  self->_hasFetchedLocalData = a3;
}

- (NSArray)currentLocalPasteboard
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (void)setCurrentLocalPasteboard:(id)a3
{
}

- (int64_t)currentLocalPasteboardSize
{
  return self->_currentLocalPasteboardSize;
}

- (void)setCurrentLocalPasteboardSize:(int64_t)a3
{
  self->_currentLocalPasteboardSize = a3;
}

- (void)setAdvertiseTypes:(BOOL)a3
{
  self->_advertiseTypes = a3;
}

- (BOOL)remoteAvailable
{
  return self->_remoteAvailable;
}

- (void)setRemoteAvailable:(BOOL)a3
{
  self->_remoteAvailable = a3;
}

- (SFCompanionAdvertiser)pasteAdvertiser
{
  return (SFCompanionAdvertiser *)objc_getProperty(self, a2, 160, 1);
}

- (void)setPasteAdvertiser:(id)a3
{
}

- (UCRemotePasteboardGeneration)remoteGeneration
{
  return (UCRemotePasteboardGeneration *)objc_getProperty(self, a2, 168, 1);
}

- (void)setRemoteGeneration:(id)a3
{
}

- (OS_dispatch_semaphore)pboardFetchSem
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 176, 1);
}

- (void)setPboardFetchSem:(id)a3
{
}

- (UASharedPasteboardInfoWrapper)pboardInfoToSend
{
  return (UASharedPasteboardInfoWrapper *)objc_getProperty(self, a2, 184, 1);
}

- (void)setPboardInfoToSend:(id)a3
{
}

- (UASharedPasteboardOutputStreamManager)outStream
{
  return (UASharedPasteboardOutputStreamManager *)objc_getProperty(self, a2, 192, 1);
}

- (void)setOutStream:(id)a3
{
}

- (UASharedPasteboardInputStreamManager)inStream
{
  return (UASharedPasteboardInputStreamManager *)objc_getProperty(self, a2, 200, 1);
}

- (void)setInStream:(id)a3
{
}

- (UCStreamCoder)coders
{
  return (UCStreamCoder *)objc_getProperty(self, a2, 208, 1);
}

- (void)setCoders:(id)a3
{
}

- (int64_t)sendingCoderVersion
{
  return self->_sendingCoderVersion;
}

- (void)setSendingCoderVersion:(int64_t)a3
{
  self->_sendingCoderVersion = a3;
}

- (NSProgress)fetchProgress
{
  return (NSProgress *)objc_getProperty(self, a2, 224, 1);
}

- (void)setFetchProgress:(id)a3
{
}

- (NSTimer)showUITimer
{
  return (NSTimer *)objc_getProperty(self, a2, 232, 1);
}

- (void)setShowUITimer:(id)a3
{
}

- (NSDate)dontHideUIBefore
{
  return (NSDate *)objc_getProperty(self, a2, 240, 1);
}

- (void)setDontHideUIBefore:(id)a3
{
}

- (BOOL)isUIVisible
{
  return self->_isUIVisible;
}

- (void)setIsUIVisible:(BOOL)a3
{
  self->_isUIVisible = a3;
}

- (NSXPCConnection)osxUIConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 248, 1);
}

- (void)setOsxUIConnection:(id)a3
{
}

- (__CFUserNotification)notificationRef
{
  return self->_notificationRef;
}

- (void)setNotificationRef:(__CFUserNotification *)a3
{
  self->_notificationRef = a3;
}

- (unint64_t)pasteFetchStartTime
{
  return self->_pasteFetchStartTime;
}

- (void)setPasteFetchStartTime:(unint64_t)a3
{
  self->_pasteFetchStartTime = a3;
}

- (unint64_t)localSendStartTime
{
  return self->_localSendStartTime;
}

- (void)setLocalSendStartTime:(unint64_t)a3
{
  self->_localSendStartTime = a3;
}

- (unint64_t)streamOpenStartTime
{
  return self->_streamOpenStartTime;
}

- (void)setStreamOpenStartTime:(unint64_t)a3
{
  self->_streamOpenStartTime = a3;
}

- (unint64_t)streamXferStartTime
{
  return self->_streamXferStartTime;
}

- (void)setStreamXferStartTime:(unint64_t)a3
{
  self->_streamXferStartTime = a3;
}

- (UARemotePasteboardWasRequestedEvent)pasteInfo
{
  return (UARemotePasteboardWasRequestedEvent *)objc_getProperty(self, a2, 296, 1);
}

- (void)setPasteInfo:(id)a3
{
}

- (UARemotePasteboardDidSendLocalEvent)localInfo
{
  return (UARemotePasteboardDidSendLocalEvent *)objc_getProperty(self, a2, 304, 1);
}

- (void)setLocalInfo:(id)a3
{
}

- (NSBundle)uaBundle
{
  return (NSBundle *)objc_getProperty(self, a2, 312, 1);
}

- (void)setUaBundle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uaBundle, 0);
  objc_storeStrong((id *)&self->_localInfo, 0);
  objc_storeStrong((id *)&self->_pasteInfo, 0);
  objc_storeStrong((id *)&self->_osxUIConnection, 0);
  objc_storeStrong((id *)&self->_dontHideUIBefore, 0);
  objc_storeStrong((id *)&self->_showUITimer, 0);
  objc_storeStrong((id *)&self->_fetchProgress, 0);
  objc_storeStrong((id *)&self->_coders, 0);
  objc_storeStrong((id *)&self->_inStream, 0);
  objc_storeStrong((id *)&self->_outStream, 0);
  objc_storeStrong((id *)&self->_pboardInfoToSend, 0);
  objc_storeStrong((id *)&self->_pboardFetchSem, 0);
  objc_storeStrong((id *)&self->_remoteGeneration, 0);
  objc_storeStrong((id *)&self->_pasteAdvertiser, 0);
  objc_storeStrong((id *)&self->_currentLocalPasteboard, 0);
  objc_storeStrong((id *)&self->_localTimeout, 0);
  objc_storeStrong((id *)&self->_currentLocalTypes, 0);
  objc_storeStrong((id *)&self->_controlConnections, 0);
  objc_storeStrong((id *)&self->_clientNotificationConnection, 0);
  objc_storeStrong((id *)&self->_clientConnection, 0);
  objc_storeStrong((id *)&self->_auxConnection, 0);
  objc_storeStrong((id *)&self->_controlListener, 0);
  objc_storeStrong((id *)&self->_auxlistener, 0);
  objc_storeStrong((id *)&self->_xpclistener, 0);

  objc_storeStrong((id *)&self->_clientq, 0);
}

@end