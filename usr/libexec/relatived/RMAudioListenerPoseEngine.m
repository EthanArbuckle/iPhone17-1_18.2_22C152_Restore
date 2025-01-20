@interface RMAudioListenerPoseEngine
+ (id)sharedInstance;
- (RMAudioListenerPoseEngine)init;
- (SBSExternalDisplayService)externalDisplayService;
- (id)startProducingDataForObject:(id)a3 tempestOptions:(id)a4 forceSessionRestart:(BOOL)a5 callback:(id)a6;
- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5;
- (void)externalDisplayDidConnect:(dispatch_queue_t *)a1;
- (void)facePoseCaptureSessionDidConfigure:(id)a3;
- (void)setExternalDisplayService:(id)a3;
- (void)stopProducingDataForObject:(id)a3;
@end

@implementation RMAudioListenerPoseEngine

+ (id)sharedInstance
{
  if (qword_10002C980 != -1) {
    dispatch_once(&qword_10002C980, &stru_100024840);
  }
  v2 = (void *)qword_10002C978;

  return v2;
}

- (RMAudioListenerPoseEngine)init
{
  v38.receiver = self;
  v38.super_class = (Class)RMAudioListenerPoseEngine;
  v2 = [(RMAudioListenerPoseEngine *)&v38 init];
  if (v2)
  {
    v3 = +[NSMapTable mapTableWithKeyOptions:5 valueOptions:0];
    sub_1000025FC((uint64_t)v2, v3);

    v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v5 = dispatch_queue_create("RMAudioListenerPoseEngineQueue", v4);
    sub_100002BC0((uint64_t)v2, v5);

    dispatch_queue_t v6 = dispatch_queue_create("RMAudioListenerPoseCaptureQueue", v4);
    sub_10000261C((uint64_t)v2, v6);

    v7 = objc_opt_new();
    sub_10000260C((uint64_t)v2, v7);

    id v8 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.RelativeMotion"];
    sub_100002BD0((uint64_t)v2, v8);

    defaults = v2->_defaults;
    v42[0] = @"TempestKeepAliveDuration";
    v42[1] = @"TempestOpportunisticAnchoredKeepAliveDuration";
    v43[0] = &off_100025F10;
    v43[1] = &off_100025F20;
    v42[2] = @"OasisKeepAliveDuration";
    v43[2] = &off_100025F20;
    v10 = defaults;
    v11 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:3];
    [(NSUserDefaults *)v10 registerDefaults:v11];

    unsigned __int8 v12 = 0;
    if (+[RMPlatformInfo isInternalBuild]) {
      unsigned __int8 v12 = [(NSUserDefaults *)v2->_defaults BOOLForKey:@"TempestEnableFacePose"];
    }
    v2->_BOOL faceKitEnabled = +[RMPlatformInfo supportsOpportunisticAnchoredTracking] | v12;
    v13 = v2->_defaults;
    v2->_BOOL facePoseVerboseLoggingEnabled = [(NSUserDefaults *)v13 BOOLForKey:@"TempestEnableFacePoseVerboseLogging"];

    if (qword_10002C538 != -1) {
      dispatch_once(&qword_10002C538, &stru_1000249F0);
    }
    v14 = (void *)qword_10002C540;
    if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      unsigned int v16 = +[RMPlatformInfo supportsOpportunisticAnchoredTracking];
      BOOL faceKitEnabled = v2->_faceKitEnabled;
      BOOL facePoseVerboseLoggingEnabled = v2->_facePoseVerboseLoggingEnabled;
      *(_DWORD *)buf = 67240704;
      *(_DWORD *)v40 = v16;
      *(_WORD *)&v40[4] = 1026;
      *(_DWORD *)&v40[6] = faceKitEnabled;
      LOWORD(v41) = 1026;
      *(_DWORD *)((char *)&v41 + 2) = facePoseVerboseLoggingEnabled;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Face pose supported: %{public}d, face pose enabled: %{public}d, verbose logging: %{public}d", buf, 0x14u);
    }
    if (!v2->_faceKitEnabled) {
      goto LABEL_11;
    }
    v19 = objc_opt_new();
    sub_100002BE0((uint64_t)v2, v19);

    [(RMFacePoseCaptureSession *)v2->_facePoseCaptureSession setDelegate:v2];
    v20 = objc_opt_new();
    sub_100002BF0((uint64_t)v2, v20);

    v21 = objc_opt_new();
    [(RMAudioListenerPoseEngine *)v2 setExternalDisplayService:v21];

    if (v2->_faceKitEnabled)
    {
      v22 = v2->_defaults;
      v23 = v22;
      CFStringRef v24 = @"TempestOpportunisticAnchoredKeepAliveDuration";
    }
    else
    {
LABEL_11:
      v22 = v2->_defaults;
      v23 = v22;
      CFStringRef v24 = @"TempestKeepAliveDuration";
    }
    [(NSUserDefaults *)v22 doubleForKey:v24];
    session = v2->_session;
    if (session) {
      session->_double keepAliveDurationVideo = v25;
    }

    v27 = v2->_defaults;
    [(NSUserDefaults *)v27 doubleForKey:@"OasisKeepAliveDuration"];
    v29 = v2->_session;
    if (v29) {
      v29->_keepAliveDurationMusic = v28;
    }

    if (qword_10002C538 != -1) {
      dispatch_once(&qword_10002C538, &stru_1000249F0);
    }
    v30 = (void *)qword_10002C540;
    if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
    {
      v31 = v2->_session;
      if (v31) {
        double keepAliveDurationVideo = v31->_keepAliveDurationVideo;
      }
      else {
        double keepAliveDurationVideo = 0.0;
      }
      v33 = v2->_session;
      if (v33) {
        v33 = *(RMAudioListenerPoseEngineSession **)&v33->_keepAliveDurationMusic;
      }
      *(_DWORD *)buf = 134349312;
      *(double *)v40 = keepAliveDurationVideo;
      *(_WORD *)&v40[8] = 2050;
      v41 = v33;
      v34 = v31;
      v35 = v30;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "keepAliveDurationVideo: %{public}.3f sec, keepAliveDurationMusic: %{public}.3f sec", buf, 0x16u);
    }
    v2->_userInteractionMonitorClientCount = 0;
    v36 = +[RMUserInteractionMonitor userInteractionMonitor];
    sub_100002C00((uint64_t)v2, v36);
  }
  return v2;
}

- (id)startProducingDataForObject:(id)a3 tempestOptions:(id)a4 forceSessionRestart:(BOOL)a5 callback:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = v12;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_100002D8C;
  v30 = sub_100002D9C;
  id v31 = 0;
  if (self) {
    producerQueue = self->_producerQueue;
  }
  else {
    producerQueue = 0;
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100002DA4;
  v20[3] = &unk_100024868;
  v20[4] = self;
  id v21 = v11;
  id v22 = v10;
  id v23 = v12;
  CFStringRef v24 = &v26;
  BOOL v25 = a5;
  id v15 = v10;
  id v16 = v13;
  id v17 = v11;
  dispatch_sync((dispatch_queue_t)producerQueue, v20);
  id v18 = (id)v27[5];

  _Block_object_dispose(&v26, 8);

  return v18;
}

- (void)stopProducingDataForObject:(id)a3
{
  id v4 = a3;
  if (self) {
    producerQueue = self->_producerQueue;
  }
  else {
    producerQueue = 0;
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000038E0;
  v7[3] = &unk_1000248B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)producerQueue, v7);
}

- (void)externalDisplayDidConnect:(dispatch_queue_t *)a1
{
  if (a1)
  {
    dispatch_assert_queue_V2(a1[5]);
    v2 = [(dispatch_queue_t *)a1 externalDisplayService];
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100005C28;
    v3[3] = &unk_1000249D0;
    v3[4] = a1;
    [v2 getConnectedDisplayInfoWithCompletionHandler:v3];
  }
}

- (void)facePoseCaptureSessionDidConfigure:(id)a3
{
  id v4 = a3;
  if (self) {
    producerQueue = self->_producerQueue;
  }
  else {
    producerQueue = 0;
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000574C;
  v7[3] = &unk_1000248B8;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)producerQueue, v7);
}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5
{
  if (self) {
    producerQueue = self->_producerQueue;
  }
  else {
    producerQueue = 0;
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005D9C;
  v6[3] = &unk_100024980;
  v6[4] = self;
  v6[5] = a4;
  dispatch_async((dispatch_queue_t)producerQueue, v6);
}

- (SBSExternalDisplayService)externalDisplayService
{
  return self->_externalDisplayService;
}

- (void)setExternalDisplayService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInteractionMonitor, 0);
  objc_storeStrong((id *)&self->_facePoseCaptureSession, 0);
  objc_storeStrong((id *)&self->_lidAngleSensor, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_captureQueue, 0);
  objc_storeStrong((id *)&self->_producerQueue, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_clients, 0);

  objc_storeStrong((id *)&self->_externalDisplayService, 0);
}

@end