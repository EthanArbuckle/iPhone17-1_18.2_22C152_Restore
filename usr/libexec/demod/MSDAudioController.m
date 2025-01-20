@interface MSDAudioController
+ (id)sharedInstance;
- (AVSystemController)avSystemController;
- (BOOL)addRouteToSystemMusicForSpeaker;
- (BOOL)removeRouteToSystemMusicForSpeaker;
- (BOOL)setVolumeTo:(float)a3 forCategory:(unint64_t)a4;
- (float)getVolumeForCategory:(unint64_t)a3;
- (id)_NSStringFromVolumeCategory:(unint64_t)a3;
- (id)_findRouteDescriptorWithRouteUID:(id)a3 usingRouteDiscoverer:(OpaqueFigRouteDiscoverer *)a4;
- (id)_findRouteDescriptorWithUID:(id)a3;
- (void)_handleAVSystemControllerDiedNotification:(id)a3;
- (void)_initializeAVSystemControllerIfNeeded;
- (void)_monitorRouteConfigUpdateForUUID:(id)a3 withCallback:(id)a4;
- (void)setAvSystemController:(id)a3;
@end

@implementation MSDAudioController

+ (id)sharedInstance
{
  if (qword_100189878 != -1) {
    dispatch_once(&qword_100189878, &stru_100151B10);
  }
  v2 = (void *)qword_100189870;

  return v2;
}

- (BOOL)setVolumeTo:(float)a3 forCategory:(unint64_t)a4
{
  v6 = [(MSDAudioController *)self _NSStringFromVolumeCategory:a4];
  if (v6)
  {
    v7 = [(MSDAudioController *)self avSystemController];
    objc_sync_enter(v7);
    [(MSDAudioController *)self _initializeAVSystemControllerIfNeeded];
    v8 = [(MSDAudioController *)self avSystemController];
    *(float *)&double v9 = a3;
    unsigned __int8 v10 = [v8 setVolumeTo:v6 forCategory:0 mode:v9];

    if ((v10 & 1) == 0)
    {
      v11 = sub_100068600();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000C6624((uint64_t)v6, v11, a3);
      }
    }
    objc_sync_exit(v7);
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (float)getVolumeForCategory:(unint64_t)a3
{
  float v11 = 0.0;
  v4 = [(MSDAudioController *)self _NSStringFromVolumeCategory:a3];
  if (v4)
  {
    v5 = [(MSDAudioController *)self avSystemController];
    objc_sync_enter(v5);
    [(MSDAudioController *)self _initializeAVSystemControllerIfNeeded];
    v6 = [(MSDAudioController *)self avSystemController];
    unsigned int v7 = [v6 getVolume:&v11 forCategory:v4 mode:0];

    if ((v7 & 1) == 0)
    {
      v8 = sub_100068600();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000C66AC((uint64_t)v4, v8);
      }
    }
    objc_sync_exit(v5);

    if (v7) {
      float v9 = v11;
    }
    else {
      float v9 = -1.0;
    }
  }
  else
  {
    float v9 = -1.0;
  }

  return v9;
}

- (BOOL)addRouteToSystemMusicForSpeaker
{
  v3 = [(MSDAudioController *)self _findRouteDescriptorWithUID:@"Speaker"];
  if (!v3)
  {
    BOOL v13 = 0;
    goto LABEL_18;
  }
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  v5 = +[NSUUID UUID];
  v6 = [v5 UUIDString];

  uint64_t v21 = kFigRoutingContextSelectRouteOptionKey_ClientRouteRequestID;
  v22 = v6;
  unsigned int v7 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  CFTypeRef cf = 0;
  v8 = sub_100068600();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "MSDAudioController: Adding route for system music to speaker...", buf, 2u);
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100008E34;
  v17[3] = &unk_100151B38;
  float v9 = v4;
  v18 = v9;
  [(MSDAudioController *)self _monitorRouteConfigUpdateForUUID:v6 withCallback:v17];
  if (FigRoutingContextRemoteCopySystemMusicContext())
  {
    v15 = sub_100068600();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000C678C();
    }
    goto LABEL_14;
  }
  CFTypeRef v10 = cf;
  uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v11) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  v14 = *(unsigned int (**)(CFTypeRef, void *, void *))(v12 + 16);
  if (!v14 || v14(v10, v3, v7))
  {
    v15 = sub_100068600();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000C6724();
    }
LABEL_14:

    BOOL v13 = 0;
    goto LABEL_15;
  }
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  BOOL v13 = 1;
LABEL_15:
  if (cf) {
    CFRelease(cf);
  }

LABEL_18:
  return v13;
}

- (BOOL)removeRouteToSystemMusicForSpeaker
{
  v3 = [(MSDAudioController *)self _findRouteDescriptorWithUID:@"Speaker"];
  if (!v3)
  {
    BOOL v13 = 1;
    goto LABEL_18;
  }
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  v5 = +[NSUUID UUID];
  v6 = [v5 UUIDString];

  uint64_t v21 = kFigRoutingContextSelectRouteOptionKey_ClientRouteRequestID;
  v22 = v6;
  unsigned int v7 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  CFTypeRef cf = 0;
  v8 = sub_100068600();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "MSDAudioController: Removing route for system music to speaker...", buf, 2u);
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100009194;
  v17[3] = &unk_100151B38;
  float v9 = v4;
  v18 = v9;
  [(MSDAudioController *)self _monitorRouteConfigUpdateForUUID:v6 withCallback:v17];
  if (FigRoutingContextRemoteCopySystemMusicContext())
  {
    v15 = sub_100068600();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000C678C();
    }
    goto LABEL_14;
  }
  CFTypeRef v10 = cf;
  uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v11) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  v14 = *(unsigned int (**)(CFTypeRef, void *, void *))(v12 + 104);
  if (!v14 || v14(v10, v3, v7))
  {
    v15 = sub_100068600();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000C67F4();
    }
LABEL_14:

    BOOL v13 = 0;
    goto LABEL_15;
  }
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  BOOL v13 = 1;
LABEL_15:
  if (cf) {
    CFRelease(cf);
  }

LABEL_18:
  return v13;
}

- (void)_initializeAVSystemControllerIfNeeded
{
  v3 = [(MSDAudioController *)self avSystemController];

  if (!v3)
  {
    dispatch_semaphore_t v4 = sub_100068600();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MSDAudioController: Initializing AVSystemController!", buf, 2u);
    }

    v5 = +[AVSystemController sharedAVSystemController];
    [(MSDAudioController *)self setAvSystemController:v5];

    v6 = [(MSDAudioController *)self avSystemController];

    if (v6)
    {
      unsigned int v7 = [(MSDAudioController *)self avSystemController];
      uint64_t v22 = AVSystemController_ServerConnectionDiedNotification;
      v8 = +[NSArray arrayWithObjects:&v22 count:1];
      id v20 = 0;
      unsigned __int8 v9 = [v7 setAttribute:v8 forKey:AVSystemController_SubscribeToNotificationsAttribute error:&v20];
      CFTypeRef v10 = v20;

      if (v9)
      {
        uint64_t v11 = +[NSNotificationCenter defaultCenter];
        [v11 addObserver:self selector:"_handleAVSystemControllerDiedNotification:" name:AVSystemController_ServerConnectionDiedNotification object:0];
      }
      else
      {
        v19 = sub_100068600();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_1000C6894(v10, v19);
        }
      }
    }
    else
    {
      CFTypeRef v10 = sub_100068600();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1000C685C(v10, v12, v13, v14, v15, v16, v17, v18);
      }
    }
  }
}

- (id)_NSStringFromVolumeCategory:(unint64_t)a3
{
  CFStringRef v3 = @"PhoneCall";
  if (a3 != 2) {
    CFStringRef v3 = 0;
  }
  if (a3 == 3) {
    return @"Audio/Video";
  }
  else {
    return (id)v3;
  }
}

- (id)_findRouteDescriptorWithUID:(id)a3
{
  dispatch_semaphore_t v4 = a3;
  CFTypeRef cf = 0;
  v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v53 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MSDAudioController: Searching for route with UID: %{public}@", buf, 0xCu);
  }

  uint64_t v50 = kFigRouteDiscovererCreationOption_DiscovererType;
  v51 = &off_100161EE0;
  v6 = +[NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
  if (FigRouteDiscovererXPCRemoteCreate())
  {
    v35 = sub_100068600();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_1000C6A04();
    }
    uint64_t v11 = 0;
    uint64_t v17 = 0;
    id v10 = 0;
    goto LABEL_19;
  }
  id v7 = objc_alloc_init((Class)NSCondition);
  v8 = +[NSNotificationCenter defaultCenter];
  uint64_t v9 = kFigRouteDiscovererNotification_AvailableRoutesChanged;
  v44 = _NSConcreteStackBlock;
  uint64_t v45 = 3221225472;
  v46 = sub_100009974;
  v47 = &unk_100151B60;
  id v10 = v7;
  id v48 = v10;
  uint64_t v11 = [v8 addObserverForName:v9 object:0 queue:0 usingBlock:&v44];

  CFTypeRef v12 = cf;
  uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v13) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t v15 = *(unsigned int (**)(CFTypeRef, void, void))(v14 + 56);
  if (!v15
    || (uint64_t v16 = kFigRouteDiscovererProperty_DiscoveryMode,
        v15(v12, kFigRouteDiscovererProperty_DiscoveryMode, kFigRouteDiscovererDiscoveryMode_DetailedDiscovery)))
  {
    v35 = sub_100068600();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_1000C692C();
    }
    uint64_t v17 = 0;
LABEL_19:
    uint64_t v18 = 0;
LABEL_30:

    goto LABEL_31;
  }
  uint64_t v17 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 3.0, v44, v45, v46, v47);
  [v10 lock];
  while (1)
  {
    uint64_t v18 = [(MSDAudioController *)self _findRouteDescriptorWithRouteUID:v4 usingRouteDiscoverer:cf];
    if (v18) {
      break;
    }
    if (([v10 waitUntilDate:v17] & 1) == 0)
    {
      v19 = sub_100068600();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1000C69CC(v19, v20, v21, v22, v23, v24, v25, v26);
      }

      [v10 unlock];
      v27 = sub_100068600();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_1000C6994(v27, v28, v29, v30, v31, v32, v33, v34);
      }
      goto LABEL_23;
    }
  }
  [v10 unlock];
  v27 = [v18 objectForKeyedSubscript:kFigEndpointDescriptorKey_RouteName];
  v36 = sub_100068600();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v53 = v27;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "MSDAudioController: Found route with name: %{public}@", buf, 0xCu);
  }

LABEL_23:
  CFTypeRef v37 = cf;
  uint64_t v38 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v38) {
    uint64_t v39 = v38;
  }
  else {
    uint64_t v39 = 0;
  }
  v40 = *(unsigned int (**)(CFTypeRef, uint64_t, void))(v39 + 56);
  if (!v40 || v40(v37, v16, kFigRouteDiscovererDiscoveryMode_None))
  {
    v35 = sub_100068600();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_1000C692C();
    }
    goto LABEL_30;
  }
LABEL_31:
  if (cf) {
    CFRelease(cf);
  }
  if (v11)
  {
    v41 = +[NSNotificationCenter defaultCenter];
    [v41 removeObserver:v11];
  }
  id v42 = v18;

  return v42;
}

- (id)_findRouteDescriptorWithRouteUID:(id)a3 usingRouteDiscoverer:(OpaqueFigRouteDiscoverer *)a4
{
  id v5 = a3;
  id v24 = 0;
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  v8 = *(unsigned int (**)(OpaqueFigRouteDiscoverer *, void, const CFAllocatorRef, id *))(v7 + 48);
  if (!v8 || v8(a4, kFigRouteDiscovererProperty_AvailableRouteDescriptors, kCFAllocatorDefault, &v24))
  {
    uint64_t v9 = sub_100068600();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000C6A6C();
    }
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v9 = v24;
    id v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v21;
      uint64_t v13 = kFigEndpointDescriptorKey_RouteUID;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v16 = [v15 objectForKeyedSubscript:v13];
          uint64_t v17 = v16;
          if (v16 && [v16 isEqualToString:v5])
          {
            id v18 = v15;

            goto LABEL_20;
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
  }
  id v18 = 0;
LABEL_20:

  return v18;
}

- (void)_monitorRouteConfigUpdateForUUID:(id)a3 withCallback:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = +[NSNotificationCenter defaultCenter];
    uint64_t v8 = kFigRoutingContextNotification_RouteConfigUpdated;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100009D44;
    v10[3] = &unk_100151B88;
    id v11 = v5;
    id v12 = 0;
    id v13 = v6;
    uint64_t v9 = [v7 addObserverForName:v8 object:0 queue:0 usingBlock:v10];
  }
}

- (void)_handleAVSystemControllerDiedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDAudioController *)self avSystemController];
  objc_sync_enter(v5);
  id v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "MSDAudioController: AVSystemController died!", v8, 2u);
  }

  [(MSDAudioController *)self setAvSystemController:0];
  uint64_t v7 = +[NSNotificationCenter defaultCenter];
  [v7 removeObserver:self name:AVSystemController_ServerConnectionDiedNotification object:0];

  objc_sync_exit(v5);
}

- (AVSystemController)avSystemController
{
  return self->_avSystemController;
}

- (void)setAvSystemController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end