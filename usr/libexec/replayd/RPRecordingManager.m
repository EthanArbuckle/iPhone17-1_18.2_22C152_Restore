@interface RPRecordingManager
- (BOOL)isMicrophoneRecording;
- (BOOL)volumeMatchesCachePath:(id)a3;
- (NSMutableDictionary)currentAvailableExtensions;
- (NSMutableDictionary)streamUpdateFilterTimers;
- (RPConnectionManager)connectionManager;
- (RPRecordingManager)initWithConnectionManager:(id)a3;
- (UNUserNotificationCenter)userNotificationCenter;
- (id)createNotificationRequestWithAssetURL:(id)a3 ignoreDoNotDisturb:(BOOL)a4 isClip:(BOOL)a5;
- (id)getCallingConnectionBundleID;
- (id)getCallingConnectionClient;
- (id)periodic:(id)a3 urgency:(int)a4;
- (id)purge:(id)a3 urgency:(int)a4;
- (id)purgeable:(id)a3 urgency:(int)a4;
- (void)applicationDisconnectedWithBundleID:(id)a3 withProcessIdentifier:(int)a4;
- (void)connectionManagerDidAcceptNewConnection:(id)a3 bundleIdentifier:(id)a4;
- (void)createNewBroadcastClientWithBundleID:(id)a3 broadcastExtensionBundleID:(id)a4 broadcastConfigurationData:(id)a5 userInfo:(id)a6 isSystemBroadcast:(BOOL)a7 handler:(id)a8;
- (void)dealloc;
- (void)discardInAppRecordingWithHandler:(id)a3;
- (void)displayScreenRecorderNotificationWithURL:(id)a3 ignoreDoNotDisturb:(BOOL)a4 isClip:(BOOL)a5;
- (void)exportClipToURL:(id)a3 duration:(double)a4 completionHandler:(id)a5;
- (void)getSystemBroadcastExtensionInfo:(id)a3;
- (void)getSystemBroadcastPickerInfo:(id)a3;
- (void)macApplicationDidBecomeActiveWithContextID:(id)a3 completionHandler:(id)a4;
- (void)macApplicationDidResignActive;
- (void)openControlCenterSystemRecordingView;
- (void)pauseInAppBroadcast;
- (void)pauseInAppCapture;
- (void)pauseInAppRecording;
- (void)processSaveToPhotos:(id)a3 mixAudioTracks:(BOOL)a4 ignoreDoNotDisturb:(BOOL)a5 isClip:(BOOL)a6;
- (void)reportCameraUsage:(int64_t)a3;
- (void)resumeInAppBroadcastWithWindowLayerContextID:(id)a3 completionHandler:(id)a4;
- (void)resumeInAppCaptureWithWindowLayerContextID:(id)a3 completionHandler:(id)a4;
- (void)resumeInAppClipWithWindowLayerContextID:(id)a3 completionHandler:(id)a4;
- (void)resumeInAppRecordingWithWindowLayerContextID:(id)a3 completionHandler:(id)a4;
- (void)resumeSystemBroadcastWithCompletionHandler:(id)a3;
- (void)resumeSystemRecordingWithCompletionHandler:(id)a3;
- (void)saveClipToCameraRoll:(id)a3 handler:(id)a4;
- (void)saveToCameraRoll:(id)a3 mixAudioTracks:(BOOL)a4 ignoreDoNotDisturb:(BOOL)a5 isClip:(BOOL)a6 handler:(id)a7;
- (void)saveVideo:(id)a3 handler:(id)a4;
- (void)saveVideoToCameraRoll:(id)a3 handler:(id)a4;
- (void)setBroadcastPickerPreferredExt:(id)a3 showsMicButton:(BOOL)a4;
- (void)setBroadcastURL:(id)a3;
- (void)setConnectionManager:(id)a3;
- (void)setCurrentAvailableExtensions:(id)a3;
- (void)setMicrophoneEnabled:(BOOL)a3;
- (void)setMicrophoneRecording:(BOOL)a3;
- (void)setStreamUpdateFilterTimers:(id)a3;
- (void)setUpMemoryPressureNotification;
- (void)setUserNotificationCenter:(id)a3;
- (void)setupBroadcastWithHostBundleID:(id)a3 broadcastExtensionBundleID:(id)a4 broadcastConfigurationData:(id)a5 userInfo:(id)a6 handler:(id)a7;
- (void)setupSystemBroadcastWithHostBundleID:(id)a3 broadcastExtensionBundleID:(id)a4 broadcastConfigurationData:(id)a5 userInfo:(id)a6 handler:(id)a7;
- (void)startClipBufferingWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withCompletionHandler:(id)a7;
- (void)startInAppBroadcastWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 listenerEndpoint:(id)a7 withHandler:(id)a8;
- (void)startInAppCaptureWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7;
- (void)startInAppRecordingWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7;
- (void)startSystemBroadcastWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 listenerEndpoint:(id)a7 withHandler:(id)a8;
- (void)startSystemRecordingWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7;
- (void)stopAllActiveClients;
- (void)stopClipBufferingWithCompletionHandler:(id)a3;
- (void)stopCurrentActiveSessionWithHandler:(id)a3;
- (void)stopInAppBroadcastWithHandler:(id)a3;
- (void)stopInAppCaptureWithHandler:(id)a3;
- (void)stopInAppRecordingWithHandler:(id)a3;
- (void)stopInAppRecordingWithUrl:(id)a3 handler:(id)a4;
- (void)stopSystemBroadcastWithHandler:(id)a3;
- (void)stopSystemRecordingWithHandler:(id)a3;
- (void)stopSystemRecordingWithURLHandler:(id)a3;
- (void)updateClient:(id)a3 withHostBundleID:(id)a4 broadcastExtensionBundleID:(id)a5 broadcastConfigurationData:(id)a6 userInfo:(id)a7 isSystemBroadcast:(BOOL)a8 handler:(id)a9;
- (void)updateProcessIDForAudioCaptureWithPID:(int)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation RPRecordingManager

- (RPRecordingManager)initWithConnectionManager:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RPRecordingManager;
  v5 = [(RPRecordingManager *)&v11 init];
  if (v5)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v13 = "-[RPRecordingManager initWithConnectionManager:]";
      __int16 v14 = 1024;
      int v15 = 160;
      __int16 v16 = 2048;
      v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
    }
    [(RPRecordingManager *)v5 setConnectionManager:v4];
    v6 = +[NSMutableDictionary dictionary];
    [(RPRecordingManager *)v5 setCurrentAvailableExtensions:v6];

    v7 = +[NSMutableDictionary dictionary];
    [(RPRecordingManager *)v5 setStreamUpdateFilterTimers:v7];

    id v8 = [objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.ReplayKitNotifications"];
    [(RPRecordingManager *)v5 setUserNotificationCenter:v8];

    [(UNUserNotificationCenter *)v5->_userNotificationCenter setDelegate:v5];
    [(UNUserNotificationCenter *)v5->_userNotificationCenter setWantsNotificationResponsesDelivered];
    v9 = +[NSFileManager defaultManager];
    [v9 _srSetupTempDirectory];

    [(RPRecordingManager *)v5 setUpMemoryPressureNotification];
  }

  return v5;
}

- (void)dealloc
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v5 = "-[RPRecordingManager dealloc]";
    __int16 v6 = 1024;
    int v7 = 197;
    __int16 v8 = 2048;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  v3.receiver = self;
  v3.super_class = (Class)RPRecordingManager;
  [(RPRecordingManager *)&v3 dealloc];
}

- (void)setUpMemoryPressureNotification
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v10 = "-[RPRecordingManager setUpMemoryPressureNotification]";
    __int16 v11 = 1024;
    int v12 = 208;
    __int16 v13 = 2048;
    __int16 v14 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100011AB8;
  v8[3] = &unk_1000852D0;
  v8[4] = self;
  objc_super v3 = objc_retainBlock(v8);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100011BA4;
  v7[3] = &unk_1000852D0;
  v7[4] = self;
  id v4 = objc_retainBlock(v7);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100011D50;
  v6[3] = &unk_1000852D0;
  v6[4] = self;
  v5 = objc_retainBlock(v6);
  CacheDeleteRegisterInfoCallbacks();
}

- (BOOL)volumeMatchesCachePath:(id)a3
{
  return [a3 isEqualToString:@"/private/var/mobile"];
}

- (id)purgeable:(id)a3 urgency:(int)a4
{
  v5 = [a3 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  if ([(RPRecordingManager *)self volumeMatchesCachePath:v5])
  {
    __int16 v6 = +[NSFileManager defaultManager];
    id v7 = [v6 _srSizeOfTempDir:0];
  }
  else
  {
    id v7 = 0;
  }
  v11[0] = @"CACHE_DELETE_VOLUME";
  v11[1] = @"CACHE_DELETE_AMOUNT";
  v12[0] = v5;
  __int16 v8 = +[NSNumber numberWithLongLong:v7];
  v12[1] = v8;
  v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (id)purge:(id)a3 urgency:(int)a4
{
  __int16 v6 = [a3 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  if ([(RPRecordingManager *)self volumeMatchesCachePath:v6])
  {
    id v7 = +[NSFileManager defaultManager];
    id v8 = [v7 _srSizeOfTempDir:0];

    if (a4 >= 3)
    {
      if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v18 = "-[RPRecordingManager purge:urgency:]";
        __int16 v19 = 1024;
        int v20 = 256;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d cacheDeleteUrgencyHigh", buf, 0x12u);
      }
      v9 = [(RPRecordingManager *)self getCallingConnectionClient];
      [v9 handleMemoryWarningForCurrentActiveSession];
      v10 = +[RPClientManager sharedInstance];
      __int16 v11 = +[NSError _scUserErrorForCode:-3805 userInfo:0];
      [v10 stopAllClientStreamsWithError:v11];
    }
  }
  else
  {
    id v8 = 0;
  }
  int v12 = +[NSNumber numberWithLongLong:v8, @"CACHE_DELETE_VOLUME", @"CACHE_DELETE_AMOUNT", v6];
  v16[1] = v12;
  __int16 v13 = +[NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:2];

  return v13;
}

- (id)periodic:(id)a3 urgency:(int)a4
{
  v5 = [a3 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  if ([(RPRecordingManager *)self volumeMatchesCachePath:v5])
  {
    __int16 v6 = +[NSFileManager defaultManager];
    id v7 = [v6 _srDeleteFilesOlderThanTimeToLiveInSeconds:1 deleteSystemFiles:86400.0];
  }
  else
  {
    id v7 = 0;
  }
  v11[0] = @"CACHE_DELETE_VOLUME";
  v11[1] = @"CACHE_DELETE_AMOUNT";
  v12[0] = v5;
  id v8 = +[NSNumber numberWithLongLong:v7];
  v12[1] = v8;
  v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (void)connectionManagerDidAcceptNewConnection:(id)a3 bundleIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[RPClientManager sharedInstance];
  id v8 = [v7 getClientWithBundleID:v5];

  if (v8)
  {
    v9 = [[RPClientProxy alloc] initWithConnection:v6];
    [v8 setClientProxy:v9];

    id v10 = [v6 processIdentifier];
    [v8 setClientPID:v10];
  }
  else
  {
    __int16 v11 = [RPClient alloc];
    int v12 = [[RPClientProxy alloc] initWithConnection:v6];
    __int16 v13 = [(RPClient *)v11 initWithConnection:v6 clientProxy:v12 bundleIdentifier:v5];

    if (v13)
    {
      if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136446466;
        __int16 v16 = "-[RPRecordingManager connectionManagerDidAcceptNewConnection:bundleIdentifier:]";
        __int16 v17 = 1024;
        int v18 = 318;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d client created and adding to client manager", (uint8_t *)&v15, 0x12u);
      }
      __int16 v14 = +[RPClientManager sharedInstance];
      [v14 addClient:v13];
    }
    else if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10005049C();
    }
  }
}

- (void)applicationDisconnectedWithBundleID:(id)a3 withProcessIdentifier:(int)a4
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPRecordingManager: applicationDisconnected", buf, 2u);
  }
  id v5 = +[RPClientManager sharedInstance];
  id v6 = [v5 getClientWithBundleID:v4];

  if (v6)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10001263C;
    v7[3] = &unk_100085318;
    id v8 = v6;
    [v8 stopCurrentActiveSessionWithHandler:v7];
  }
  else if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v10 = "-[RPRecordingManager applicationDisconnectedWithBundleID:withProcessIdentifier:]";
    __int16 v11 = 1024;
    int v12 = 353;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d client disconnected, RPClient representation not found or removed", buf, 0x12u);
  }
}

- (void)startInAppRecordingWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v13 = a3;
  id v14 = a7;
  int v15 = +[RPClientManager sharedInstance];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10001285C;
  v18[3] = &unk_100085368;
  v18[4] = self;
  id v19 = v13;
  CGFloat v21 = width;
  CGFloat v22 = height;
  BOOL v23 = a5;
  BOOL v24 = a6;
  id v20 = v14;
  id v16 = v14;
  id v17 = v13;
  [v15 stopAllClientsWithHandler:v18];
}

- (void)stopInAppRecordingWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RPRecordingManager *)self getCallingConnectionClient];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100012A5C;
  v7[3] = &unk_100085390;
  id v8 = v4;
  id v6 = v4;
  [v5 stopInAppRecordingSessionWithHandler:v7];
}

- (void)stopInAppRecordingWithUrl:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v15 = "-[RPRecordingManager stopInAppRecordingWithUrl:handler:]";
    __int16 v16 = 1024;
    int v17 = 519;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  id v8 = [(RPRecordingManager *)self getCallingConnectionClient];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_100012BEC;
  v11[3] = &unk_1000853E0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 stopInAppRecordingSessionWithHandler:v11];
}

- (void)pauseInAppRecording
{
  id v2 = [(RPRecordingManager *)self getCallingConnectionClient];
  [v2 pauseInAppRecording];
}

- (void)resumeInAppRecordingWithWindowLayerContextID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(RPRecordingManager *)self getCallingConnectionClient];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100012F18;
  v10[3] = &unk_100085340;
  id v11 = v6;
  id v9 = v6;
  [v8 resumeInAppRecordingWithContextID:v7 completionHandler:v10];
}

- (void)discardInAppRecordingWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RPRecordingManager *)self getCallingConnectionClient];
  [v5 discardInAppRecordingWithHandler:v4];
}

- (void)startInAppCaptureWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v13 = a3;
  id v14 = a7;
  int v15 = +[RPClientManager sharedInstance];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100013098;
  v18[3] = &unk_100085368;
  v18[4] = self;
  id v19 = v13;
  CGFloat v21 = width;
  CGFloat v22 = height;
  BOOL v23 = a5;
  BOOL v24 = a6;
  id v20 = v14;
  id v16 = v14;
  id v17 = v13;
  [v15 stopAllClientsWithHandler:v18];
}

- (void)stopInAppCaptureWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RPRecordingManager *)self getCallingConnectionClient];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100013298;
  v7[3] = &unk_100084E90;
  id v8 = v4;
  id v6 = v4;
  [v5 stopInAppCaptureSessionWithHandler:v7];
}

- (void)pauseInAppCapture
{
  id v2 = [(RPRecordingManager *)self getCallingConnectionClient];
  [v2 pauseInAppCapture];
}

- (void)resumeInAppCaptureWithWindowLayerContextID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(RPRecordingManager *)self getCallingConnectionClient];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000133B8;
  v10[3] = &unk_100085340;
  id v11 = v6;
  id v9 = v6;
  [v8 resumeInAppCaptureWithContextID:v7 completionHandler:v10];
}

- (void)createNewBroadcastClientWithBundleID:(id)a3 broadcastExtensionBundleID:(id)a4 broadcastConfigurationData:(id)a5 userInfo:(id)a6 isSystemBroadcast:(BOOL)a7 handler:(id)a8
{
  BOOL v9 = a7;
  id v14 = (RPClient *)a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  int v18 = (void (**)(id, void *))a8;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    BOOL v24 = "-[RPRecordingManager createNewBroadcastClientWithBundleID:broadcastExtensionBundleID:broadcastConfigurationDat"
          "a:userInfo:isSystemBroadcast:handler:]";
    __int16 v25 = 1024;
    int v26 = 634;
    __int16 v27 = 2112;
    v28 = v14;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Calling client doesn't not exist, we need to create a new client with bundleID: %@", buf, 0x1Cu);
  }
  id v19 = [[RPClient alloc] initWithConnection:0 clientProxy:0 bundleIdentifier:v14];
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    BOOL v24 = "-[RPRecordingManager createNewBroadcastClientWithBundleID:broadcastExtensionBundleID:broadcastConfigurationDat"
          "a:userInfo:isSystemBroadcast:handler:]";
    __int16 v25 = 1024;
    int v26 = 638;
    __int16 v27 = 2112;
    v28 = v19;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d client created: %@", buf, 0x1Cu);
  }
  if (v19)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      BOOL v24 = "-[RPRecordingManager createNewBroadcastClientWithBundleID:broadcastExtensionBundleID:broadcastConfigurationD"
            "ata:userInfo:isSystemBroadcast:handler:]";
      __int16 v25 = 1024;
      int v26 = 640;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d client created and adding to client manager", buf, 0x12u);
    }
    id v20 = +[RPClientManager sharedInstance];
    [v20 addClient:v19];

    [(RPRecordingManager *)self updateClient:v19 withHostBundleID:v14 broadcastExtensionBundleID:v15 broadcastConfigurationData:v16 userInfo:v17 isSystemBroadcast:v9 handler:v18];
  }
  else
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100050628();
    }
    CGFloat v21 = +[NSError _rpUserErrorForCode:-5808 userInfo:0];
    if (v9) {
      CFStringRef v22 = @"SystemBroadcast";
    }
    else {
      CFStringRef v22 = @"InAppBroadcast";
    }
    +[RPReportingAgent reportSessionEnded:2 endReason:v21 withServiceName:v22 clientBundleId:v14];
    if (v18) {
      v18[2](v18, v21);
    }
  }
}

- (void)updateClient:(id)a3 withHostBundleID:(id)a4 broadcastExtensionBundleID:(id)a5 broadcastConfigurationData:(id)a6 userInfo:(id)a7 isSystemBroadcast:(BOOL)a8 handler:(id)a9
{
  BOOL v9 = a8;
  id v15 = a9;
  id v16 = v15;
  if (v9)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100013848;
    v20[3] = &unk_100084E90;
    id v17 = &v21;
    id v21 = v15;
    [a3 setupSystemBroadcastWithHostBundleID:a4 broadcastExtensionBundleID:a5 broadcastConfigurationData:a6 userInfo:a7 handler:v20];
  }
  else
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000138C4;
    v18[3] = &unk_100084E90;
    id v17 = &v19;
    id v19 = v15;
    [a3 setupInAppBroadcastExtensionBundleID:a5 broadcastConfigurationData:a6 userInfo:a7 handler:v18];
  }
}

- (void)setupBroadcastWithHostBundleID:(id)a3 broadcastExtensionBundleID:(id)a4 broadcastConfigurationData:(id)a5 userInfo:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v20 = "-[RPRecordingManager setupBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:]";
    __int16 v21 = 1024;
    int v22 = 695;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Getting client and setting up broadcast", buf, 0x12u);
  }
  id v17 = +[RPClientManager sharedInstance];
  int v18 = [v17 getClientForBroadcastWithHostBundleID:v12];

  if (v18)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      id v20 = "-[RPRecordingManager setupBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:us"
            "erInfo:handler:]";
      __int16 v21 = 1024;
      int v22 = 704;
      __int16 v23 = 2112;
      id v24 = v18;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Calling set up in app broadcast on client: %@", buf, 0x1Cu);
    }
    [(RPRecordingManager *)self updateClient:v18 withHostBundleID:v12 broadcastExtensionBundleID:v13 broadcastConfigurationData:v14 userInfo:v15 isSystemBroadcast:0 handler:v16];
  }
  else
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      id v20 = "-[RPRecordingManager setupBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:us"
            "erInfo:handler:]";
      __int16 v21 = 1024;
      int v22 = 700;
      __int16 v23 = 2112;
      id v24 = v12;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Calling client doesn't not exist, we need to create a new client with bundleID: %@", buf, 0x1Cu);
    }
    [(RPRecordingManager *)self createNewBroadcastClientWithBundleID:v12 broadcastExtensionBundleID:v13 broadcastConfigurationData:v14 userInfo:v15 isSystemBroadcast:0 handler:v16];
  }
}

- (void)startInAppBroadcastWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 listenerEndpoint:(id)a7 withHandler:(id)a8
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v15 = a3;
  id v16 = a7;
  id v17 = a8;
  int v18 = +[RPClientManager sharedInstance];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100013D10;
  v22[3] = &unk_100085408;
  v22[4] = self;
  id v23 = v15;
  CGFloat v26 = width;
  CGFloat v27 = height;
  BOOL v28 = a5;
  BOOL v29 = a6;
  id v24 = v16;
  id v25 = v17;
  id v19 = v17;
  id v20 = v16;
  id v21 = v15;
  [v18 stopAllClientsWithHandler:v22];
}

- (void)stopInAppBroadcastWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RPRecordingManager *)self getCallingConnectionClient];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100014034;
  v7[3] = &unk_100084E90;
  id v8 = v4;
  id v6 = v4;
  [v5 stopInAppBroadcastSessionWithHandler:v7];
}

- (void)pauseInAppBroadcast
{
  id v2 = [(RPRecordingManager *)self getCallingConnectionClient];
  [v2 pauseInAppBroadcast];
}

- (void)resumeInAppBroadcastWithWindowLayerContextID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(RPRecordingManager *)self getCallingConnectionClient];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100014258;
  v10[3] = &unk_100085340;
  id v11 = v6;
  id v9 = v6;
  [v8 resumeInAppBroadcastWithContextID:v7 completionHandler:v10];
}

- (void)setBroadcastURL:(id)a3
{
  id v4 = a3;
  id v5 = [(RPRecordingManager *)self getCallingConnectionClient];
  [v5 updateBroadcastURL:v4];
}

- (void)startSystemRecordingWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v13 = a3;
  id v14 = a7;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    CGFloat v26 = "-[RPRecordingManager startSystemRecordingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:]";
    __int16 v27 = 1024;
    int v28 = 788;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  id v15 = +[RPClientManager sharedInstance];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10001447C;
  v18[3] = &unk_100085368;
  void v18[4] = self;
  id v19 = v13;
  CGFloat v21 = width;
  CGFloat v22 = height;
  BOOL v23 = a5;
  BOOL v24 = a6;
  id v20 = v14;
  id v16 = v14;
  id v17 = v13;
  [v15 stopAllClientsWithHandler:v18];
}

- (void)stopSystemRecordingWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RPRecordingManager *)self getCallingConnectionClient];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000146F0;
  v7[3] = &unk_100084E90;
  id v8 = v4;
  id v6 = v4;
  [v5 stopSystemRecordingSessionWithHandler:v7];
}

- (void)stopSystemRecordingWithURLHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RPRecordingManager *)self getCallingConnectionClient];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000147B4;
  v7[3] = &unk_100085390;
  id v8 = v4;
  id v6 = v4;
  [v5 stopSystemRecordingSessionWithURLHandler:v7];
}

- (void)resumeSystemRecordingWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RPRecordingManager *)self getCallingConnectionClient];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100014878;
  v7[3] = &unk_100085430;
  id v8 = v4;
  id v6 = v4;
  [v5 resumeSystemRecordingWithCompletionHandler:v7];
}

- (void)setupSystemBroadcastWithHostBundleID:(id)a3 broadcastExtensionBundleID:(id)a4 broadcastConfigurationData:(id)a5 userInfo:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v20 = "-[RPRecordingManager setupSystemBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationDat"
          "a:userInfo:handler:]";
    __int16 v21 = 1024;
    int v22 = 863;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Getting client and setting up broadcast", buf, 0x12u);
  }
  id v17 = +[RPClientManager sharedInstance];
  int v18 = [v17 getClientWithBundleID:v12];

  if (v18)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      id v20 = "-[RPRecordingManager setupSystemBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationD"
            "ata:userInfo:handler:]";
      __int16 v21 = 1024;
      int v22 = 872;
      __int16 v23 = 2112;
      id v24 = v18;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Calling set up system broadcast on client: %@", buf, 0x1Cu);
    }
    [(RPRecordingManager *)self updateClient:v18 withHostBundleID:v12 broadcastExtensionBundleID:v13 broadcastConfigurationData:v14 userInfo:v15 isSystemBroadcast:1 handler:v16];
  }
  else
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      id v20 = "-[RPRecordingManager setupSystemBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationD"
            "ata:userInfo:handler:]";
      __int16 v21 = 1024;
      int v22 = 868;
      __int16 v23 = 2112;
      id v24 = v12;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Calling client doesn't not exist, we need to create a new client with bundleID: %@", buf, 0x1Cu);
    }
    [(RPRecordingManager *)self createNewBroadcastClientWithBundleID:v12 broadcastExtensionBundleID:v13 broadcastConfigurationData:v14 userInfo:v15 isSystemBroadcast:1 handler:v16];
  }
}

- (void)startSystemBroadcastWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 listenerEndpoint:(id)a7 withHandler:(id)a8
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v15 = a3;
  id v16 = a7;
  id v17 = a8;
  int v18 = +[RPClientManager sharedInstance];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100014C60;
  v22[3] = &unk_100085408;
  v22[4] = self;
  id v23 = v15;
  CGFloat v26 = width;
  CGFloat v27 = height;
  BOOL v28 = a5;
  BOOL v29 = a6;
  id v24 = v16;
  id v25 = v17;
  id v19 = v17;
  id v20 = v16;
  id v21 = v15;
  [v18 stopAllClientsWithHandler:v22];
}

- (void)stopSystemBroadcastWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RPRecordingManager *)self getCallingConnectionClient];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100014E60;
  v7[3] = &unk_100084E90;
  id v8 = v4;
  id v6 = v4;
  [v5 stopSystemBroadcastSessionWithHandler:v7];
}

- (void)resumeSystemBroadcastWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RPRecordingManager *)self getCallingConnectionClient];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100014F24;
  v7[3] = &unk_100085430;
  id v8 = v4;
  id v6 = v4;
  [v5 resumeSystemBroadcastWithCompletionHandler:v7];
}

- (void)startClipBufferingWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withCompletionHandler:(id)a7
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v13 = a3;
  id v14 = a7;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    CGFloat v26 = "-[RPRecordingManager startClipBufferingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withCompletionHandler:]";
    __int16 v27 = 1024;
    int v28 = 934;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  id v15 = +[RPClientManager sharedInstance];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000150E8;
  v18[3] = &unk_100085368;
  void v18[4] = self;
  id v19 = v13;
  CGFloat v21 = width;
  CGFloat v22 = height;
  BOOL v23 = a5;
  BOOL v24 = a6;
  id v20 = v14;
  id v16 = v14;
  id v17 = v13;
  [v15 stopAllClientsWithHandler:v18];
}

- (void)stopClipBufferingWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v10 = "-[RPRecordingManager stopClipBufferingWithCompletionHandler:]";
    __int16 v11 = 1024;
    int v12 = 961;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  id v5 = [(RPRecordingManager *)self getCallingConnectionClient];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001538C;
  v7[3] = &unk_100084E90;
  id v8 = v4;
  id v6 = v4;
  [v5 stopInAppClipSessionWithHandler:v7];
}

- (void)exportClipToURL:(id)a3 duration:(double)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v15 = "-[RPRecordingManager exportClipToURL:duration:completionHandler:]";
    __int16 v16 = 1024;
    int v17 = 975;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  id v10 = [(RPRecordingManager *)self getCallingConnectionClient];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  void v12[2] = sub_100015520;
  v12[3] = &unk_100084E90;
  id v13 = v9;
  id v11 = v9;
  [v10 exportClipToURL:v8 duration:v12 completionHandler:a4];
}

- (void)resumeInAppClipWithWindowLayerContextID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(RPRecordingManager *)self getCallingConnectionClient];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100015600;
  v10[3] = &unk_100085340;
  id v11 = v6;
  id v9 = v6;
  [v8 resumeInAppClipWithContextID:v7 completionHandler:v10];
}

- (id)getCallingConnectionBundleID
{
  id v2 = [(RPRecordingManager *)self connectionManager];
  objc_super v3 = [v2 currentConnection];

  id v4 = +[RPConnectionManager uniqueClientIdentifierWithPID:](RPConnectionManager, "uniqueClientIdentifierWithPID:", [v3 processIdentifier]);

  return v4;
}

- (id)getCallingConnectionClient
{
  id v2 = [(RPRecordingManager *)self getCallingConnectionBundleID];
  objc_super v3 = +[RPClientManager sharedInstance];
  id v4 = [v3 getClientWithBundleID:v2];

  if (v4) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = dword_100099BB8 > 2;
  }
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000508BC();
  }

  return v4;
}

- (void)macApplicationDidResignActive
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    BOOL v5 = "-[RPRecordingManager macApplicationDidResignActive]";
    __int16 v6 = 1024;
    int v7 = 1022;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v4, 0x12u);
  }
  objc_super v3 = [(RPRecordingManager *)self getCallingConnectionClient];
  [v3 pauseCurrentActiveSession];
}

- (void)macApplicationDidBecomeActiveWithContextID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446466;
    id v10 = "-[RPRecordingManager macApplicationDidBecomeActiveWithContextID:completionHandler:]";
    __int16 v11 = 1024;
    int v12 = 1029;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v9, 0x12u);
  }
  id v8 = [(RPRecordingManager *)self getCallingConnectionClient];
  [v8 resumeCurrentActiveSessionWithContextID:v6 completionHandler:v7];
}

- (void)stopCurrentActiveSessionWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RPRecordingManager *)self getCallingConnectionClient];
  [v5 stopCurrentActiveSessionWithHandler:v4];
}

- (void)stopAllActiveClients
{
  id v2 = +[RPClientManager sharedInstance];
  [v2 stopAllClientsWithHandler:&stru_100085470];
}

- (void)saveVideoToCameraRoll:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446466;
    int v9 = "-[RPRecordingManager saveVideoToCameraRoll:handler:]";
    __int16 v10 = 1024;
    int v11 = 1054;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v8, 0x12u);
  }
  [(RPRecordingManager *)self saveToCameraRoll:v6 mixAudioTracks:1 ignoreDoNotDisturb:0 isClip:0 handler:v7];
}

- (void)saveClipToCameraRoll:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446466;
    int v9 = "-[RPRecordingManager saveClipToCameraRoll:handler:]";
    __int16 v10 = 1024;
    int v11 = 1059;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v8, 0x12u);
  }
  [(RPRecordingManager *)self saveToCameraRoll:v6 mixAudioTracks:1 ignoreDoNotDisturb:0 isClip:1 handler:v7];
}

- (void)saveVideo:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446466;
    int v9 = "-[RPRecordingManager saveVideo:handler:]";
    __int16 v10 = 1024;
    int v11 = 1064;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v8, 0x12u);
  }
  [(RPRecordingManager *)self saveToCameraRoll:v6 mixAudioTracks:0 ignoreDoNotDisturb:1 isClip:0 handler:v7];
}

- (void)saveToCameraRoll:(id)a3 mixAudioTracks:(BOOL)a4 ignoreDoNotDisturb:(BOOL)a5 isClip:(BOOL)a6 handler:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = (void (**)(id, void *))a7;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136446466;
    int v18 = "-[RPRecordingManager saveToCameraRoll:mixAudioTracks:ignoreDoNotDisturb:isClip:handler:]";
    __int16 v19 = 1024;
    int v20 = 1069;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v17, 0x12u);
  }
  id v14 = [(RPRecordingManager *)self connectionManager];
  unsigned __int8 v15 = [v14 hasSystemRecordingEntitlements];

  if ((v15 & 1) == 0)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1000509C4();
      if (!v13) {
        goto LABEL_11;
      }
    }
    else if (!v13)
    {
      goto LABEL_11;
    }
    __int16 v16 = +[NSError _rpUserErrorForCode:-5810 userInfo:0];
    v13[2](v13, v16);

    goto LABEL_11;
  }
  [(RPRecordingManager *)self processSaveToPhotos:v12 mixAudioTracks:v10 ignoreDoNotDisturb:v9 isClip:v8];
  if (v13) {
    v13[2](v13, 0);
  }
LABEL_11:
}

- (void)processSaveToPhotos:(id)a3 mixAudioTracks:(BOOL)a4 ignoreDoNotDisturb:(BOOL)a5 isClip:(BOOL)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    unsigned __int8 v15 = "-[RPRecordingManager processSaveToPhotos:mixAudioTracks:ignoreDoNotDisturb:isClip:]";
    __int16 v16 = 1024;
    int v17 = 1087;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Start Save to Photos", buf, 0x12u);
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_10001610C;
  v11[3] = &unk_100085498;
  void v11[4] = self;
  BOOL v12 = a5;
  BOOL v13 = a6;
  +[RPPhotosUtility exportVideoToPhotosAsynchronously:v10 mixAudioTracks:v8 completionHandler:v11];
}

- (void)updateProcessIDForAudioCaptureWithPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446722;
    BOOL v9 = "-[RPRecordingManager updateProcessIDForAudioCaptureWithPID:]";
    __int16 v10 = 1024;
    int v11 = 1126;
    __int16 v12 = 1024;
    int v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d pid :%d", (uint8_t *)&v8, 0x18u);
  }
  id v5 = [(RPRecordingManager *)self connectionManager];
  unsigned int v6 = [v5 hasSystemRecordingEntitlements];

  if (v6)
  {
    id v7 = [(RPRecordingManager *)self getCallingConnectionClient];
    [v7 updateProcessIDForAudioCaptureWithPID:v3];
  }
  else if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100050ACC();
  }
}

- (void)displayScreenRecorderNotificationWithURL:(id)a3 ignoreDoNotDisturb:(BOOL)a4 isClip:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136446722;
    __int16 v12 = "-[RPRecordingManager displayScreenRecorderNotificationWithURL:ignoreDoNotDisturb:isClip:]";
    __int16 v13 = 1024;
    int v14 = 1139;
    __int16 v15 = 2048;
    __int16 v16 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", (uint8_t *)&v11, 0x1Cu);
  }
  BOOL v9 = [(RPRecordingManager *)self createNotificationRequestWithAssetURL:v8 ignoreDoNotDisturb:v6 isClip:v5];
  __int16 v10 = [(RPRecordingManager *)self userNotificationCenter];
  [v10 addNotificationRequest:v9 withCompletionHandler:&stru_1000854B8];
}

- (id)createNotificationRequestWithAssetURL:(id)a3 ignoreDoNotDisturb:(BOOL)a4 isClip:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = +[PHObject uuidFromLocalIdentifier:v7];
  BOOL v9 = +[NSString stringWithFormat:@"photos://asset?uuid=%@&albumname=camera-roll", v8];
  uint64_t v10 = +[NSURL URLWithString:v9];

  if (v5) {
    CFStringRef v11 = @"CONTROL_CENTER_CLIPS_TITLE";
  }
  else {
    CFStringRef v11 = @"CONTROL_CENTER_TITLE";
  }
  if (v5) {
    CFStringRef v12 = @"RECORDING_CLIPS_BULLETIN_MESSAGE";
  }
  else {
    CFStringRef v12 = @"RECORDING_BULLETIN_MESSAGE";
  }
  uint64_t v13 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:v11];
  uint64_t v14 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:v12];
  id v15 = objc_alloc_init((Class)UNMutableNotificationContent);
  v31 = (void *)v13;
  [v15 setTitle:v13];
  BOOL v29 = (void *)v14;
  [v15 setBody:v14];
  [v15 setThreadIdentifier:@"orginalRecordID"];
  [v15 setShouldIgnoreDoNotDisturb:v6];
  if (v7)
  {
    CFStringRef v33 = @"photoAssetIdKey";
    id v34 = v7;
    __int16 v16 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    [v15 setUserInfo:v16];
  }
  [v15 setDefaultActionURL:v10];
  int v17 = +[UNNotificationActionIcon iconWithSystemImageName:@"photo.fill"];
  int v18 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"SYSTEM_RECORDING_LONG_PRESS_VIEW"];
  +[UNNotificationAction actionWithIdentifier:@"viewAction" title:v18 url:v10 options:0 icon:v17];
  __int16 v19 = v28 = (void *)v10;

  int v20 = +[UNNotificationActionIcon iconWithSystemImageName:@"xmark.circle"];
  CGFloat v21 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"SYSTEM_RECORDING_LONG_PRESS_DELETE"];
  CGFloat v22 = +[UNNotificationAction actionWithIdentifier:@"deleteAction" title:v21 options:3 icon:v20];

  v32[0] = v19;
  v32[1] = v22;
  BOOL v23 = +[NSArray arrayWithObjects:v32 count:2];
  BOOL v24 = +[UNNotificationCategory categoryWithIdentifier:@"orginalRecordID" actions:v23 intentIdentifiers:&__NSArray0__struct options:0];
  id v25 = +[NSSet setWithObject:v24];
  [(UNUserNotificationCenter *)self->_userNotificationCenter setNotificationCategories:v25];

  [v15 setCategoryIdentifier:@"orginalRecordID"];
  CGFloat v26 = +[UNNotificationRequest requestWithIdentifier:@"orginalRecordID" content:v15 trigger:0];

  return v26;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v6 = a4;
  id v7 = (void (**)(void))a5;
  id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[RPRecordingManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]");
  NSLog(@"%@", v8);

  BOOL v9 = [v6 actionIdentifier];
  unsigned int v10 = [v9 isEqualToString:@"deleteAction"];

  if (v10)
  {
    CFStringRef v11 = [v6 notification];
    CFStringRef v12 = [v11 request];
    uint64_t v13 = [v12 content];
    uint64_t v14 = [v13 userInfo];

    if (!v14) {
      goto LABEL_15;
    }
    uint64_t v15 = [v14 objectForKey:@"photoAssetIdKey"];
    if (!v15) {
      goto LABEL_15;
    }
    __int16 v16 = (void *)v15;
    uint64_t v26 = v15;
    int v17 = +[NSArray arrayWithObjects:&v26 count:1];
    int v18 = +[PHAsset fetchAssetsWithLocalIdentifiers:v17 options:0];
    __int16 v19 = [v18 firstObject];

    if (v19)
    {
      int v20 = +[PHPhotoLibrary sharedPhotoLibrary];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100016BA0;
      v24[3] = &unk_100084E28;
      id v21 = v19;
      id v25 = v21;
      id v23 = 0;
      [v20 performChangesAndWait:v24 error:&v23];
      id v22 = v23;

      if (v22) {
        NSLog(@"RPRecordingManager: didReceiveNotificationResponse: Error deleting photo asset: %@", v22);
      }
      v7[2](v7);
    }
    else
    {
LABEL_15:
      if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100050B50();
      }
    }
  }
}

- (void)getSystemBroadcastExtensionInfo:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100016CCC;
  v4[3] = &unk_1000854E0;
  id v5 = a3;
  id v3 = v5;
  +[NSExtension extensionsWithMatchingPointName:@"com.apple.broadcast-services-upload" completion:v4];
}

- (void)setMicrophoneEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446722;
    id v7 = "-[RPRecordingManager setMicrophoneEnabled:]";
    __int16 v8 = 1024;
    int v9 = 1300;
    __int16 v10 = 1024;
    BOOL v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d microphone set:%d ", (uint8_t *)&v6, 0x18u);
  }
  id v5 = [(RPRecordingManager *)self getCallingConnectionClient];
  [v5 setCurrentActiveSessionMicrophoneEnabled:v3];
}

- (void)getSystemBroadcastPickerInfo:(id)a3
{
  id v4 = (void (**)(id, NSString *, BOOL))a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    currentPreferredBroadcastExt = self->_currentPreferredBroadcastExt;
    BOOL showsBroadcastPickerMicButton = self->_showsBroadcastPickerMicButton;
    int v7 = 136446978;
    __int16 v8 = "-[RPRecordingManager getSystemBroadcastPickerInfo:]";
    __int16 v9 = 1024;
    int v10 = 1306;
    __int16 v11 = 2112;
    CFStringRef v12 = currentPreferredBroadcastExt;
    __int16 v13 = 1024;
    BOOL v14 = showsBroadcastPickerMicButton;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d preferredExtension: %@ showsMic: %d", (uint8_t *)&v7, 0x22u);
  }
  v4[2](v4, self->_currentPreferredBroadcastExt, self->_showsBroadcastPickerMicButton);
}

- (void)setBroadcastPickerPreferredExt:(id)a3 showsMicButton:(BOOL)a4
{
  BOOL v4 = a4;
  int v6 = (NSString *)a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446978;
    __int16 v9 = "-[RPRecordingManager setBroadcastPickerPreferredExt:showsMicButton:]";
    __int16 v10 = 1024;
    int v11 = 1311;
    __int16 v12 = 2112;
    __int16 v13 = v6;
    __int16 v14 = 1024;
    BOOL v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d preferredExtension: %@ showsMic: %d", (uint8_t *)&v8, 0x22u);
  }
  currentPreferredBroadcastExt = self->_currentPreferredBroadcastExt;
  self->_currentPreferredBroadcastExt = v6;

  self->_BOOL showsBroadcastPickerMicButton = v4;
}

- (void)openControlCenterSystemRecordingView
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136446466;
    BOOL v3 = "-[RPRecordingManager openControlCenterSystemRecordingView]";
    __int16 v4 = 1024;
    int v5 = 1317;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v2, 0x12u);
  }
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100085500);
}

- (void)reportCameraUsage:(int64_t)a3
{
  id v4 = [(RPRecordingManager *)self getCallingConnectionClient];
  [v4 reportCameraUsage:a3];
}

- (UNUserNotificationCenter)userNotificationCenter
{
  return self->_userNotificationCenter;
}

- (void)setUserNotificationCenter:(id)a3
{
}

- (BOOL)isMicrophoneRecording
{
  return self->_microphoneRecording;
}

- (void)setMicrophoneRecording:(BOOL)a3
{
  self->_microphoneRecording = a3;
}

- (RPConnectionManager)connectionManager
{
  return self->_connectionManager;
}

- (void)setConnectionManager:(id)a3
{
}

- (NSMutableDictionary)currentAvailableExtensions
{
  return self->_currentAvailableExtensions;
}

- (void)setCurrentAvailableExtensions:(id)a3
{
}

- (NSMutableDictionary)streamUpdateFilterTimers
{
  return self->_streamUpdateFilterTimers;
}

- (void)setStreamUpdateFilterTimers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamUpdateFilterTimers, 0);
  objc_storeStrong((id *)&self->_currentAvailableExtensions, 0);
  objc_storeStrong((id *)&self->_connectionManager, 0);
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);

  objc_storeStrong((id *)&self->_currentPreferredBroadcastExt, 0);
}

@end