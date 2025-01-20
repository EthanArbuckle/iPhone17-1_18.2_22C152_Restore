@interface MRDMediaActivityManager
+ (MRDMediaActivityManager)manager;
- (BOOL)isPresentingBanner;
- (BOOL)isPresentingConnectedPill;
- (BOOL)presentingConnectedPillFor:(id)a3;
- (MRDBannerCenter)bannerCenter;
- (MRDBannerCenter)pillCenter;
- (MRDMediaActivityManager)init;
- (MRDStatusItemController)audioStatusItemController;
- (MRDStatusItemController)videoStatusItemController;
- (MRRouteBannerRequest)activePillRequest;
- (MRRouteBannerRequest)activeRequest;
- (NSMutableArray)pendingRequests;
- (id)completion;
- (id)pillCompletion;
- (id)staticRequestForRoute:(id)a3 devices:(id)a4;
- (unint64_t)activeBannerState;
- (unint64_t)activePillBannerState;
- (void)bannerWithRequestIdentifier:(id)a3 didReceiveEvent:(unint64_t)a4;
- (void)dequeueNextPendingRequest;
- (void)dismissAllBannerRequests;
- (void)dismissBannerRequest:(id)a3;
- (void)dismissConnectedBanner;
- (void)dismissPillBannerRequest:(id)a3;
- (void)enqueueRequest:(id)a3 completion:(id)a4;
- (void)postAutoRouteBannerRequestForRoute:(id)a3 devices:(id)a4 endpoint:(id)a5 completion:(id)a6;
- (void)postBannerRequest:(id)a3 completion:(id)a4;
- (void)postConnectedBannerRequestForRoute:(id)a3 devices:(id)a4 endpoint:(id)a5 remoteControl:(BOOL)a6 completion:(id)a7;
- (void)postDeltaBannerRequestForRoute:(id)a3 devices:(id)a4 endpoint:(id)a5 activeSystemEndpoint:(id)a6 completion:(id)a7;
- (void)postOneTapSuggestionBannerRequestForRoute:(id)a3 devices:(id)a4 endpoint:(id)a5 completion:(id)a6;
- (void)postPillBannerRequest:(id)a3 completion:(id)a4;
- (void)presentControlCenterCallToActionVideo:(BOOL)a3 completion:(id)a4;
- (void)setActiveBannerState:(unint64_t)a3;
- (void)setActivePillBannerState:(unint64_t)a3;
- (void)setActivePillRequest:(id)a3;
- (void)setActiveRequest:(id)a3;
- (void)setAudioStatusItemController:(id)a3;
- (void)setBannerCenter:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setPillCenter:(id)a3;
- (void)setPillCompletion:(id)a3;
- (void)setVideoStatusItemController:(id)a3;
@end

@implementation MRDMediaActivityManager

- (BOOL)isPresentingBanner
{
  v2 = [(MRDMediaActivityManager *)self activeRequest];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isPresentingConnectedPill
{
  v2 = [(MRDMediaActivityManager *)self activePillRequest];
  BOOL v3 = v2 != 0;

  return v3;
}

- (MRRouteBannerRequest)activePillRequest
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_activePillRequest;
  objc_sync_exit(v2);

  return v3;
}

- (MRRouteBannerRequest)activeRequest
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_activeRequest;
  objc_sync_exit(v2);

  return v3;
}

+ (MRDMediaActivityManager)manager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100183650;
  block[3] = &unk_1004171F0;
  block[4] = a1;
  if (qword_10047E568[0] != -1) {
    dispatch_once(qword_10047E568, block);
  }
  v2 = (void *)qword_10047E560;

  return (MRDMediaActivityManager *)v2;
}

- (MRDMediaActivityManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)MRDMediaActivityManager;
  v2 = [(MRDMediaActivityManager *)&v10 init];
  if (v2)
  {
    BOOL v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pendingRequests = v2->_pendingRequests;
    v2->_pendingRequests = v3;

    v5 = [[MRDBannerCenter alloc] initWithDelegate:v2];
    [(MRDMediaActivityManager *)v2 setBannerCenter:v5];

    v6 = [[MRDBannerCenter alloc] initWithDelegate:v2];
    [(MRDMediaActivityManager *)v2 setPillCenter:v6];

    v7 = +[MRDStatusItemController controllerForStatusItemIdentifier:@"com.apple.mediaremoted.status-item.call-to-action.audio-route"];
    [(MRDMediaActivityManager *)v2 setAudioStatusItemController:v7];

    v8 = +[MRDStatusItemController controllerForStatusItemIdentifier:@"com.apple.mediaremoted.status-item.call-to-action.video-route"];
    [(MRDMediaActivityManager *)v2 setVideoStatusItemController:v8];
  }
  return v2;
}

- (void)setActiveRequest:(id)a3
{
  v4 = (MRRouteBannerRequest *)a3;
  obj = self;
  objc_sync_enter(obj);
  activeRequest = obj->_activeRequest;
  obj->_activeRequest = v4;

  objc_sync_exit(obj);
}

- (void)setActivePillRequest:(id)a3
{
  v4 = (MRRouteBannerRequest *)a3;
  obj = self;
  objc_sync_enter(obj);
  activePillRequest = obj->_activePillRequest;
  obj->_activePillRequest = v4;

  objc_sync_exit(obj);
}

- (void)postPillBannerRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(MRDMediaActivityManager *)self setActivePillRequest:v7];
  [(MRDMediaActivityManager *)self setPillCompletion:v6];

  id v8 = [(MRDMediaActivityManager *)self pillCenter];
  [v8 postBannerRequest:v7];
}

- (void)postBannerRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(MRDMediaActivityManager *)self setActiveRequest:v7];
  [(MRDMediaActivityManager *)self setCompletion:v6];

  id v8 = [(MRDMediaActivityManager *)self bannerCenter];
  [v8 postBannerRequest:v7];
}

- (void)postDeltaBannerRequestForRoute:(id)a3 devices:(id)a4 endpoint:(id)a5 activeSystemEndpoint:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v14 = (void (**)(id, void, void *))a7;
  v15 = [(MRDMediaActivityManager *)self activeRequest];

  if (v15)
  {
    v16 = _MRLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [(MRDMediaActivityManager *)self activeRequest];
      int v23 = 138412290;
      v24 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[MRDRRC].MAM already presenting %@, bailing out", (uint8_t *)&v23, 0xCu);
    }
    if (v14)
    {
      v18 = +[NSError errorWithDomain:@"MRBannerErrorDomain" code:1 userInfo:0];
      v14[2](v14, 0, v18);
    }
  }
  else
  {
    v19 = [(MRDMediaActivityManager *)self staticRequestForRoute:v11 devices:v12];
    [v19 setBannerType:4];
    v20 = [v13 outputDevices];
    v21 = objc_msgSend(v20, "msv_compactMap:", &stru_100420250);
    v22 = [v19 staticRequest];
    [v22 setUserSelectedDeviceNames:v21];

    [(MRDMediaActivityManager *)self postBannerRequest:v19 completion:v14];
  }
}

- (void)postOneTapSuggestionBannerRequestForRoute:(id)a3 devices:(id)a4 endpoint:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void, void *))a6;
  id v12 = [(MRDMediaActivityManager *)self activeRequest];

  if (v12)
  {
    id v13 = _MRLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [(MRDMediaActivityManager *)self activeRequest];
      int v17 = 138412290;
      v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[MRDRRC].MAM already presenting %@, bailing out", (uint8_t *)&v17, 0xCu);
    }
    if (v11)
    {
      v15 = +[NSError errorWithDomain:@"MRBannerErrorDomain" code:1 userInfo:0];
      v11[2](v11, 0, v15);
    }
  }
  else
  {
    v16 = [(MRDMediaActivityManager *)self staticRequestForRoute:v9 devices:v10];
    [(MRDMediaActivityManager *)self postBannerRequest:v16 completion:v11];
  }
}

- (void)postAutoRouteBannerRequestForRoute:(id)a3 devices:(id)a4 endpoint:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void, void *))a6;
  id v12 = [(MRDMediaActivityManager *)self activeRequest];

  if (v12)
  {
    id v13 = _MRLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [(MRDMediaActivityManager *)self activeRequest];
      int v17 = 138412290;
      v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[MRDRRC].MAM already presenting %@, bailing out", (uint8_t *)&v17, 0xCu);
    }
    if (v11)
    {
      v15 = +[NSError errorWithDomain:@"MRBannerErrorDomain" code:1 userInfo:0];
      v11[2](v11, 0, v15);
    }
  }
  else
  {
    v16 = [(MRDMediaActivityManager *)self staticRequestForRoute:v9 devices:v10];
    [v16 setBannerType:1];
    [(MRDMediaActivityManager *)self postBannerRequest:v16 completion:v11];
  }
}

- (void)enqueueRequest:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MRRouteBannerRequestQueueItem);
  [(MRRouteBannerRequestQueueItem *)v7 setRequest:v10];
  [(MRRouteBannerRequestQueueItem *)v7 setCompletion:v6];
  id v8 = self;
  objc_sync_enter(v8);
  id v9 = [(MRDMediaActivityManager *)v8 pendingRequests];
  [v9 addObject:v7];

  objc_sync_exit(v8);
}

- (void)dequeueNextPendingRequest
{
  obj = self;
  objc_sync_enter(obj);
  v2 = [(MRDMediaActivityManager *)obj pendingRequests];
  BOOL v3 = [v2 firstObject];

  if (v3)
  {
    v4 = [v3 request];
    v5 = [v3 completion];
    [(MRDMediaActivityManager *)obj postPillBannerRequest:v4 completion:v5];

    id v6 = [(MRDMediaActivityManager *)obj pendingRequests];
    [v6 removeObject:v3];
  }
  objc_sync_exit(obj);
}

- (void)postConnectedBannerRequestForRoute:(id)a3 devices:(id)a4 endpoint:(id)a5 remoteControl:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [a5 outputDevices];
  v16 = (void *)v15;
  if (v15) {
    id v17 = (id)v15;
  }
  else {
    id v17 = v13;
  }
  v18 = [(MRDMediaActivityManager *)self staticRequestForRoute:v14 devices:v17];

  v19 = +[MRDDisplayMonitor sharedMonitor];
  v20 = [v19 primaryUIApplicationBundleIdentifier];
  [v18 setBundleIdentifierAffinity:v20];

  if (v7) {
    uint64_t v21 = 3;
  }
  else {
    uint64_t v21 = 2;
  }
  [v18 setBannerType:v21];
  v22 = [(MRDMediaActivityManager *)self activePillRequest];

  if (v22)
  {
    int v23 = _MRLogForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = [(MRDMediaActivityManager *)self activePillRequest];
      int v25 = 138412546;
      v26 = v24;
      __int16 v27 = 2112;
      v28 = v18;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[MRDRRC].MAM already presenting pill %@, enqueueing request %@", (uint8_t *)&v25, 0x16u);
    }
    [(MRDMediaActivityManager *)self enqueueRequest:v18 completion:v12];
  }
  else
  {
    [(MRDMediaActivityManager *)self postPillBannerRequest:v18 completion:v12];
  }
}

- (BOOL)presentingConnectedPillFor:(id)a3
{
  id v4 = a3;
  v5 = [(MRDMediaActivityManager *)self activePillRequest];
  id v6 = [v5 bundleIdentifierAffinity];
  BOOL v7 = v6;
  if (v6 == v4) {
    unsigned __int8 v8 = 1;
  }
  else {
    unsigned __int8 v8 = [v6 isEqual:v4];
  }

  return v8;
}

- (void)dismissConnectedBanner
{
  if ([(MRDMediaActivityManager *)self isPresentingConnectedPill])
  {
    BOOL v3 = [(MRDMediaActivityManager *)self activePillRequest];
    [(MRDMediaActivityManager *)self dismissPillBannerRequest:v3];
  }
  obj = self;
  objc_sync_enter(obj);
  id v4 = [(MRDMediaActivityManager *)obj pendingRequests];
  [v4 removeAllObjects];

  objc_sync_exit(obj);
}

- (void)dismissBannerRequest:(id)a3
{
  id v4 = a3;
  id v6 = [(MRDMediaActivityManager *)self bannerCenter];
  v5 = [v4 requestIdentifier];

  [v6 dismissBannerWithIdentifier:v5];
}

- (void)dismissPillBannerRequest:(id)a3
{
  id v4 = a3;
  id v6 = [(MRDMediaActivityManager *)self pillCenter];
  v5 = [v4 requestIdentifier];

  [v6 dismissBannerWithIdentifier:v5];
}

- (void)dismissAllBannerRequests
{
  BOOL v3 = [(MRDMediaActivityManager *)self activeRequest];

  if (v3)
  {
    id v4 = [(MRDMediaActivityManager *)self activeRequest];
    [(MRDMediaActivityManager *)self dismissBannerRequest:v4];
  }
}

- (id)staticRequestForRoute:(id)a3 devices:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)MRStaticRouteBannerRequest);
  unsigned __int8 v8 = [v6 routeIdentifier];

  [v7 setRouteIdentifier:v8];
  if ([v5 count])
  {
    if (objc_msgSend(v5, "mr_containsVideoOutputDevice")) {
      CFStringRef v9 = @"airplayvideo";
    }
    else {
      CFStringRef v9 = @"airplayaudio";
    }
    [v7 setActionImageName:v9];
    id v10 = objc_msgSend(v5, "msv_compactMap:", &stru_100420270);
    [v7 setOutputDeviceNames:v10];

    id v11 = [v5 count];
    id v12 = [v5 firstObject];
    unsigned int v13 = [v12 deviceSubtype];

    if (v11 == (id)1 && v13 == 12)
    {
      id v14 = [v5 firstObject];
      uint64_t v15 = [v14 modelID];
      [v7 setSoloModelID:v15];

      v16 = [v14 deviceEnclosureColor];
      [v7 setSoloDeviceEnclosureColor:v16];
    }
    id v17 = +[MRAVOutputDeviceSymbolProvider symbolNameForOutputDevices:v5];
    [v7 setRouteSymbolName:v17];

    v18 = _MRLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [v7 routeSymbolName];
      int v22 = 138412546;
      int v23 = v19;
      __int16 v24 = 2112;
      id v25 = v5;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[MRDRRC].MAM Static Request symbol name=%@ for devices:%@", (uint8_t *)&v22, 0x16u);
    }
    v20 = +[MRRouteBannerRequest requestWithStaticRequest:v7];
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)bannerWithRequestIdentifier:(id)a3 didReceiveEvent:(unint64_t)a4
{
  id v6 = a3;
  if (a4 > 4) {
    id v7 = 0;
  }
  else {
    id v7 = (void *)*((void *)&off_100420290 + a4);
  }
  unsigned __int8 v8 = [(MRDMediaActivityManager *)self activeRequest];
  CFStringRef v9 = [v8 requestIdentifier];
  unsigned int v10 = [v6 isEqualToString:v9];

  id v11 = [(MRDMediaActivityManager *)self activePillRequest];
  id v12 = [v11 requestIdentifier];
  unsigned int v13 = [v6 isEqualToString:v12];

  id v14 = _MRLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v46 = 138413058;
    id v47 = v7;
    __int16 v48 = 2112;
    id v49 = v6;
    __int16 v50 = 1024;
    LODWORD(v51[0]) = v10;
    WORD2(v51[0]) = 1024;
    *(_DWORD *)((char *)v51 + 6) = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[MRDRRC].MAM got event %@ for %@ r=%d p=%d", (uint8_t *)&v46, 0x22u);
  }

  unint64_t v15 = [(MRDMediaActivityManager *)self activeBannerState];
  if (v15 > 4)
  {
    v16 = 0;
    if (!v10) {
      goto LABEL_8;
    }
LABEL_13:
    switch(a4)
    {
      case 0uLL:
        unint64_t v19 = [(MRDMediaActivityManager *)self activeBannerState] - 1;
        if (v19 > 3) {
          unint64_t v20 = 0;
        }
        else {
          unint64_t v20 = qword_1003C55B8[v19];
        }
        v38 = [(MRDMediaActivityManager *)self completion];

        if (v38)
        {
          uint64_t v39 = [(MRDMediaActivityManager *)self completion];
          (*(void (**)(uint64_t, unint64_t, void))(v39 + 16))(v39, v20, 0);
        }
        else
        {
          uint64_t v39 = _MRLogForCategory();
          if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_DEFAULT))
          {
            if (v20 > 4) {
              v40 = 0;
            }
            else {
              v40 = (void *)*((void *)&off_1004202E0 + v20);
            }
            int v46 = 138412546;
            id v47 = v40;
            __int16 v48 = 2112;
            id v49 = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v39, OS_LOG_TYPE_DEFAULT, "[MRDRRC].MAM Would have called completion with result %@ error %@ but completion is nil", (uint8_t *)&v46, 0x16u);
          }
        }

        [(MRDMediaActivityManager *)self setActiveBannerState:0];
        [(MRDMediaActivityManager *)self setActiveRequest:0];
        v44 = _MRLogForCategory();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v46) = 0;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "[MRDRRC].MAM cleared activeRequest", (uint8_t *)&v46, 2u);
        }

        [(MRDMediaActivityManager *)self setCompletion:0];
        goto LABEL_83;
      case 1uLL:
        if ((id)[(MRDMediaActivityManager *)self activeBannerState] != (id)1)
        {
          v26 = _MRLogForCategory();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            int v46 = 138412546;
            id v47 = v7;
            __int16 v48 = 2112;
            id v49 = v16;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[MRDRRC].MAM unexpected event %@ while current state is %@, letting it slide.", (uint8_t *)&v46, 0x16u);
          }
        }
        __int16 v27 = self;
        uint64_t v28 = 2;
        goto LABEL_61;
      case 2uLL:
        if ((id)[(MRDMediaActivityManager *)self activeBannerState] != (id)1)
        {
          v29 = _MRLogForCategory();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            int v46 = 138412546;
            id v47 = v7;
            __int16 v48 = 2112;
            id v49 = v16;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[MRDRRC].MAM unexpected event %@ while current state is %@, letting it slide.", (uint8_t *)&v46, 0x16u);
          }
        }
        __int16 v27 = self;
        uint64_t v28 = 3;
        goto LABEL_61;
      case 3uLL:
        if (![(MRDMediaActivityManager *)self activeBannerState])
        {
          __int16 v27 = self;
          uint64_t v28 = 1;
LABEL_61:
          [(MRDMediaActivityManager *)v27 setActiveBannerState:v28];
          goto LABEL_83;
        }
        v30 = _MRLogForCategory();
        if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_51;
        }
        int v46 = 138412546;
        id v47 = v7;
        __int16 v48 = 2112;
        id v49 = v16;
        v31 = "[MRDRRC].MAM unexpected event %@ while current state is %@, ignoring.";
        break;
      case 4uLL:
        if ((id)[(MRDMediaActivityManager *)self activeBannerState] != (id)1)
        {
          v32 = _MRLogForCategory();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            int v46 = 138412546;
            id v47 = v7;
            __int16 v48 = 2112;
            id v49 = v16;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[MRDRRC].MAM unexpected event %@ while current state is %@, letting it slide.", (uint8_t *)&v46, 0x16u);
          }
        }
        __int16 v27 = self;
        uint64_t v28 = 4;
        goto LABEL_61;
      default:
        goto LABEL_83;
    }
    goto LABEL_50;
  }
  v16 = (void *)*((void *)&off_1004202B8 + v15);
  if (v10) {
    goto LABEL_13;
  }
LABEL_8:
  if (!v13)
  {
    uint64_t v21 = _MRLogForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = [(MRDMediaActivityManager *)self activeRequest];
      int v23 = [v22 requestIdentifier];
      __int16 v24 = [(MRDMediaActivityManager *)self activePillRequest];
      id v25 = [v24 requestIdentifier];
      int v46 = 138412802;
      id v47 = v6;
      __int16 v48 = 2112;
      id v49 = v23;
      __int16 v50 = 2112;
      v51[0] = v25;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[MRDRRC].MAM got unexpected event from %@. active route is %@ active pill is %@", (uint8_t *)&v46, 0x20u);
    }
    goto LABEL_83;
  }
  switch(a4)
  {
    case 0uLL:
      unint64_t v17 = [(MRDMediaActivityManager *)self activePillBannerState] - 1;
      if (v17 > 3) {
        unint64_t v18 = 0;
      }
      else {
        unint64_t v18 = qword_1003C55B8[v17];
      }
      v41 = [(MRDMediaActivityManager *)self pillCompletion];

      if (v41)
      {
        uint64_t v42 = [(MRDMediaActivityManager *)self pillCompletion];
        (*(void (**)(uint64_t, unint64_t, void))(v42 + 16))(v42, v18, 0);
      }
      else
      {
        uint64_t v42 = _MRLogForCategory();
        if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_DEFAULT))
        {
          if (v18 > 4) {
            v43 = 0;
          }
          else {
            v43 = (void *)*((void *)&off_1004202E0 + v18);
          }
          int v46 = 138412546;
          id v47 = v43;
          __int16 v48 = 2112;
          id v49 = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v42, OS_LOG_TYPE_DEFAULT, "[MRDRRC].MAM Would have called pill completion with result %@ error %@ but completion is nil", (uint8_t *)&v46, 0x16u);
        }
      }

      [(MRDMediaActivityManager *)self setActivePillBannerState:0];
      [(MRDMediaActivityManager *)self setActivePillRequest:0];
      v45 = _MRLogForCategory();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v46) = 0;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "[MRDRRC].MAM cleared activePillRequest", (uint8_t *)&v46, 2u);
      }

      [(MRDMediaActivityManager *)self setPillCompletion:0];
      [(MRDMediaActivityManager *)self dequeueNextPendingRequest];
      goto LABEL_83;
    case 1uLL:
      if ((id)[(MRDMediaActivityManager *)self activePillBannerState] != (id)1)
      {
        v33 = _MRLogForCategory();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          int v46 = 138412546;
          id v47 = v7;
          __int16 v48 = 2112;
          id v49 = v16;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "[MRDRRC].MAM unexpected pill event %@ while current state is %@, letting it slide.", (uint8_t *)&v46, 0x16u);
        }
      }
      v34 = self;
      uint64_t v35 = 2;
      goto LABEL_69;
    case 2uLL:
      if ((id)[(MRDMediaActivityManager *)self activePillBannerState] != (id)1)
      {
        v36 = _MRLogForCategory();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          int v46 = 138412546;
          id v47 = v7;
          __int16 v48 = 2112;
          id v49 = v16;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "[MRDRRC].MAM unexpected pill event %@ while current state is %@, letting it slide.", (uint8_t *)&v46, 0x16u);
        }
      }
      v34 = self;
      uint64_t v35 = 3;
      goto LABEL_69;
    case 3uLL:
      if (![(MRDMediaActivityManager *)self activePillBannerState])
      {
        v34 = self;
        uint64_t v35 = 1;
LABEL_69:
        [(MRDMediaActivityManager *)v34 setActivePillBannerState:v35];
        goto LABEL_83;
      }
      v30 = _MRLogForCategory();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_51;
      }
      int v46 = 138412546;
      id v47 = v7;
      __int16 v48 = 2112;
      id v49 = v16;
      v31 = "[MRDRRC].MAM unexpected pill event %@ while current state is %@, ignoring.";
      break;
    case 4uLL:
      if ((id)[(MRDMediaActivityManager *)self activePillBannerState] != (id)1)
      {
        v37 = _MRLogForCategory();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          int v46 = 138412546;
          id v47 = v7;
          __int16 v48 = 2112;
          id v49 = v16;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "[MRDRRC].MAM unexpected pill event %@ while current state is %@, letting it slide.", (uint8_t *)&v46, 0x16u);
        }
      }
      v34 = self;
      uint64_t v35 = 4;
      goto LABEL_69;
    default:
      goto LABEL_83;
  }
LABEL_50:
  _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, v31, (uint8_t *)&v46, 0x16u);
LABEL_51:

LABEL_83:
}

- (void)presentControlCenterCallToActionVideo:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v7 = [(MRDMediaActivityManager *)self videoStatusItemController];
    CFStringRef v8 = @"video";
  }
  else
  {
    id v7 = [(MRDMediaActivityManager *)self audioStatusItemController];
    CFStringRef v8 = @"audio";
  }
  [v7 setIsStatusItemActive:1];
  CFStringRef v9 = _MRLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    unint64_t v19 = v7;
    __int16 v20 = 2112;
    CFStringRef v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[MRDRRC].MAM Asked %@ to activate - %@", buf, 0x16u);
  }

  dispatch_time_t v10 = dispatch_time(0, 5000000000);
  id v11 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018522C;
  block[3] = &unk_1004161E0;
  id v15 = v7;
  v16 = (__CFString *)v8;
  id v17 = v6;
  id v12 = v6;
  id v13 = v7;
  dispatch_after(v10, v11, block);
}

- (MRDBannerCenter)bannerCenter
{
  return self->_bannerCenter;
}

- (void)setBannerCenter:(id)a3
{
}

- (MRDBannerCenter)pillCenter
{
  return self->_pillCenter;
}

- (void)setPillCenter:(id)a3
{
}

- (unint64_t)activePillBannerState
{
  return self->_activePillBannerState;
}

- (void)setActivePillBannerState:(unint64_t)a3
{
  self->_activePillBannerState = a3;
}

- (unint64_t)activeBannerState
{
  return self->_activeBannerState;
}

- (void)setActiveBannerState:(unint64_t)a3
{
  self->_activeBannerState = a3;
}

- (NSMutableArray)pendingRequests
{
  return self->_pendingRequests;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (id)pillCompletion
{
  return self->_pillCompletion;
}

- (void)setPillCompletion:(id)a3
{
}

- (MRDStatusItemController)audioStatusItemController
{
  return self->_audioStatusItemController;
}

- (void)setAudioStatusItemController:(id)a3
{
}

- (MRDStatusItemController)videoStatusItemController
{
  return self->_videoStatusItemController;
}

- (void)setVideoStatusItemController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoStatusItemController, 0);
  objc_storeStrong((id *)&self->_audioStatusItemController, 0);
  objc_storeStrong(&self->_pillCompletion, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_pillCenter, 0);
  objc_storeStrong((id *)&self->_bannerCenter, 0);
  objc_storeStrong((id *)&self->_activePillRequest, 0);

  objc_storeStrong((id *)&self->_activeRequest, 0);
}

@end