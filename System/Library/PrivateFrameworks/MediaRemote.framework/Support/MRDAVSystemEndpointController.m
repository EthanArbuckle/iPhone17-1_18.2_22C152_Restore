@interface MRDAVSystemEndpointController
- (BOOL)_hasPersonalDeviceForContext:(id)a3;
- (BOOL)_requiresConnectionToUpdate:(id)a3;
- (BOOL)_requiresPlaybackToUpdate:(id)a3;
- (MRDAVSystemEndpointController)initWithRoutingController:(id)a3;
- (MRDAVSystemEndpointControllerDelegate)delegate;
- (NSArray)recentlyDismissedRecommendationsInfo;
- (NSDictionary)systemEndpointInfo;
- (NSString)activeOutputDeviceUID;
- (id)_isAllowedToUpdateRecommendationForOutputDevice:(id)a3 recentlyDismissed:(id)a4;
- (id)_onSerialQueue_calculateActiveEndpoint:(int64_t)a3 event:(int64_t)a4 reason:(id *)a5 suppressPairedDeviceSync:(BOOL *)a6;
- (id)_onSerialQueue_calculateProactiveEndpointForEvent:(int64_t)a3 reason:(id *)a4;
- (id)_onSerialQueue_calculateProactiveRecommendedEndpoint:(id *)a3;
- (id)_onSerialQueue_calculateRecommendedEndpointForEvent:(int64_t)a3 reason:(id *)a4;
- (id)_onSerialQueue_calculateUserSelectedEndpointForEvent:(int64_t)a3 reason:(id *)a4 suppressPairedDeviceSync:(BOOL *)a5;
- (id)_onSerialQueue_updateSystemEndpoint:(id)a3 event:(int64_t)a4 eventReason:(id)a5;
- (id)_validate:(id)a3;
- (id)activeOutputDeviceUID:(int64_t)a3;
- (id)originClientForDeviceUID:(id)a3;
- (void)_deviceInfoDidChange:(id)a3;
- (void)_handleIsPlayingDidChangeNotification:(id)a3;
- (void)_handleOriginDidRegisterNotification:(id)a3;
- (void)_handleOriginDidUnregisterNotification:(id)a3;
- (void)_handleOutputContextDidAddOutputDeviceNotification:(id)a3;
- (void)_initializeSystemEndpointInfo;
- (void)_onSerialQueue_clearActiveEndpointType:(int64_t)a3 outputDeviceUID:(id)a4 event:(int64_t)a5 reason:(id)a6 clientBundleIdentifier:(id)a7;
- (void)_onSerialQueue_maybeSetupPlaybackTimerForEvent:(int64_t)a3;
- (void)_onSerialQueue_maybeSetupUserSelectedTimerForEvent:(int64_t)a3;
- (void)_onSerialQueue_reconnectToOutputDevice:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)_onSerialQueue_reevaluateActiveEndpoint:(int64_t)a3 event:(int64_t)a4 changeType:(int64_t)a5 eventReason:(id)a6 clientBundleIdentifier:(id)a7;
- (void)_onSerialQueue_reevaluateActiveEndpoint:(int64_t)a3 event:(int64_t)a4 eventReason:(id)a5 clientBundleIdentifier:(id)a6;
- (void)_storeRecentlyDismissedRecommendationForOutputDeviceUID:(id)a3 disableDuration:(double)a4;
- (void)_writeSystemEndpointInfo:(id)a3 recentlyDismissedRecommendationsInfo:(id)a4;
- (void)clearActiveEndpointType:(int64_t)a3 outputDeviceUID:(id)a4 event:(int64_t)a5 reason:(id)a6 clientBundleIdentifier:(id)a7;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)updateSystemEndpointForRequest:(id)a3;
- (void)updateSystemEndpointForRequest:(id)a3 completion:(id)a4;
- (void)updateSystemEndpointForRequest:(id)a3 event:(int64_t)a4 completion:(id)a5;
- (void)updateSystemEndpointForRequest:(id)a3 event:(int64_t)a4 eventReason:(id)a5 completion:(id)a6;
@end

@implementation MRDAVSystemEndpointController

- (MRDAVSystemEndpointController)initWithRoutingController:(id)a3
{
  id v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)MRDAVSystemEndpointController;
  v6 = [(MRDAVSystemEndpointController *)&v30 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_routingController, a3);
    v8 = +[MRDMediaRemoteServer server];
    uint64_t v9 = [v8 nowPlayingServer];
    nowPlayingServer = v7->_nowPlayingServer;
    v7->_nowPlayingServer = (MRDNowPlayingServer *)v9;

    v11 = (objc_class *)objc_opt_class();
    Name = class_getName(v11);
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create(Name, v13);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v14;

    v16 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.mediaremote"];
    userDefaults = v7->_userDefaults;
    v7->_userDefaults = v16;

    v18 = +[MRAVOutputContext sharedSystemAudioContext];
    v7->_cachedHasPersonalDevices = [(MRDAVSystemEndpointController *)v7 _hasPersonalDeviceForContext:v18];

    v19 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    systemEndpointEntries = v7->_systemEndpointEntries;
    v7->_systemEndpointEntries = v19;

    v21 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    recentlyDismissedRecommendations = v7->_recentlyDismissedRecommendations;
    v7->_recentlyDismissedRecommendations = v21;

    [(MRDAVSystemEndpointController *)v7 _initializeSystemEndpointInfo];
    v23 = [[MRDSystemEndpointControllerHelper alloc] initWithSystemEndpointController:v7];
    helper = v7->_helper;
    v7->_helper = v23;

    v25 = +[NSNotificationCenter defaultCenter];
    uint64_t v26 = kMRMediaRemoteOriginDidRegisterNotification;
    [v25 addObserver:v7 selector:"_handleOriginDidRegisterNotification:" name:kMRMediaRemoteOriginDidRegisterNotification object:0];
    [v25 addObserver:v7 selector:"_handleOriginDidUnregisterNotification:" name:kMRMediaRemoteOriginDidUnregisterNotification object:0];
    uint64_t v27 = MRAVOutputContextDidAddOutputDeviceNotification;
    v28 = +[MRAVOutputContext sharedSystemAudioContext];
    [v25 addObserver:v7 selector:"_handleOutputContextDidAddOutputDeviceNotification:" name:v27 object:v28];

    [v25 addObserver:v7 selector:"_handleIsPlayingDidChangeNotification:" name:kMRMediaRemoteOriginNowPlayingApplicationIsPlayingDidChangeNotification object:0];
    [v25 addObserver:v7 selector:"_deviceInfoDidChange:" name:kMRDeviceInfoDidChangeNotification object:0];
    [v25 addObserver:v7 selector:"_deviceInfoDidChange:" name:v26 object:0];
  }
  return v7;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MRDAVSystemEndpointController;
  [(MRDAVSystemEndpointController *)&v4 dealloc];
}

- (NSDictionary)systemEndpointInfo
{
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  msv_dispatch_sync_on_queue();
  v2 = (NSDictionary *)v4;

  return v2;
}

- (NSArray)recentlyDismissedRecommendationsInfo
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = sub_1000171E4;
  v8 = sub_1000171F4;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSArray *)v2;
}

- (NSString)activeOutputDeviceUID
{
  return (NSString *)[(MRDAVSystemEndpointController *)self activeOutputDeviceUID:0];
}

- (id)activeOutputDeviceUID:(int64_t)a3
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_1000171E4;
  id v9 = sub_1000171F4;
  id v10 = 0;
  msv_dispatch_sync_on_queue();
  id v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

- (BOOL)_requiresConnectionToUpdate:(id)a3
{
  id v3 = a3;
  if ([v3 type] == (id)2)
  {
    uint64_t v4 = [v3 outputDeviceUID];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_requiresPlaybackToUpdate:(id)a3
{
  return [a3 type] == (id)2;
}

- (id)_validate:(id)a3
{
  id v3 = a3;
  if ([v3 type] != (id)2) {
    goto LABEL_4;
  }
  id v4 = [v3 outputDeviceUID];
  if (!v4) {
    goto LABEL_6;
  }
  BOOL v5 = +[MRUserSettings currentSettings];
  unsigned __int8 v6 = [v5 enableRouteRecommendations];

  if ((v6 & 1) == 0)
  {
    id v7 = objc_alloc((Class)NSError);
    active = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription();
    id v4 = [v7 initWithMRError:3, @"%@ is disabled via Settings", active format];
  }
  else
  {
LABEL_4:
    id v4 = 0;
  }
LABEL_6:

  return v4;
}

- (void)updateSystemEndpointForRequest:(id)a3 event:(int64_t)a4 eventReason:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v46 = a5;
  id v10 = a6;
  v43 = v9;
  id v11 = [v9 copy];
  v45 = +[MRDeviceInfoRequest localDeviceInfo];
  v12 = [v11 outputDeviceUID];
  v13 = [v45 WHAIdentifier];
  unsigned int v14 = [v12 isEqualToString:v13];

  if (v14) {
    [v11 setOutputDeviceUID:0];
  }
  v15 = +[NSDate now];
  id v16 = objc_alloc((Class)NSString);
  [v11 type];
  active = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription();
  id v18 = [v16 initWithFormat:@"SystemEndpointController.update%@", active];

  v44 = v18;
  id v19 = [objc_alloc((Class)MRRequestDetails) initWithName:v18 requestID:0 reason:v46];
  id v20 = objc_alloc((Class)NSMutableString);
  v21 = [v19 name];
  v22 = [v19 requestID];
  id v23 = [v20 initWithFormat:@"%@<%@>", v21, v22];

  v24 = [v11 outputDeviceUID];

  if (v24)
  {
    v25 = [v11 outputDeviceUID];
    [v23 appendFormat:@" for %@", v25];
  }
  uint64_t v26 = _MRLogForCategory();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v23;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_100017C0C;
  v59[3] = &unk_100415990;
  id v27 = v11;
  id v60 = v27;
  id v28 = v19;
  id v61 = v28;
  id v42 = v15;
  id v62 = v42;
  id v41 = v10;
  id v63 = v41;
  v29 = objc_retainBlock(v59);
  objc_super v30 = [(MRDAVSystemEndpointController *)self _validate:v27];
  if (!v30)
  {
    v31 = +[NSDate now];
    serialQueue = self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100017EEC;
    block[3] = &unk_1004159B8;
    block[4] = self;
    id v33 = v27;
    id v57 = v33;
    id v34 = v31;
    id v58 = v34;
    dispatch_sync((dispatch_queue_t)serialQueue, block);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v65 = 0x3032000000;
    v66 = sub_1000171E4;
    v67 = sub_1000171F4;
    id v68 = 0;
    v35 = dispatch_group_create();
    if ([(MRDAVSystemEndpointController *)self _requiresPlaybackToUpdate:v33])
    {
      dispatch_group_enter(v35);
      v36 = [v33 outputDeviceUID];
      v37 = v55;
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472;
      v55[2] = sub_100017F94;
      v55[3] = &unk_100415A08;
      v55[5] = &buf;
      v55[4] = v35;
      +[MRAVEndpoint connectToEndpointContainingOutputDeviceUID:v36 options:0 details:v28 completion:v55];
    }
    else
    {
      if (![(MRDAVSystemEndpointController *)self _requiresConnectionToUpdate:v33])
      {
LABEL_14:
        v38 = self->_serialQueue;
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_10001816C;
        v47[3] = &unk_100415A30;
        p_long long buf = &buf;
        v47[4] = self;
        id v48 = v33;
        id v49 = v34;
        int64_t v53 = a4;
        id v50 = v46;
        v51 = v29;
        id v39 = v34;
        dispatch_group_notify(v35, (dispatch_queue_t)v38, v47);

        _Block_object_dispose(&buf, 8);
        goto LABEL_15;
      }
      dispatch_group_enter(v35);
      v36 = [v33 outputDeviceUID];
      v37 = v54;
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_100018108;
      v54[3] = &unk_100415A08;
      v54[5] = &buf;
      v54[4] = v35;
      +[MRAVEndpoint connectToEndpointContainingOutputDeviceUID:v36 options:0 details:v28 completion:v54];
    }

    goto LABEL_14;
  }
  ((void (*)(void *, void *))v29[2])(v29, v30);
LABEL_15:
}

- (void)updateSystemEndpointForRequest:(id)a3 event:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [v9 reason];
  [(MRDAVSystemEndpointController *)self updateSystemEndpointForRequest:v9 event:a4 eventReason:v10 completion:v8];
}

- (void)updateSystemEndpointForRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 reason];
  [(MRDAVSystemEndpointController *)self updateSystemEndpointForRequest:v7 event:1 eventReason:v8 completion:v6];
}

- (void)updateSystemEndpointForRequest:(id)a3
{
}

- (void)clearActiveEndpointType:(int64_t)a3 outputDeviceUID:(id)a4 event:(int64_t)a5 reason:(id)a6 clientBundleIdentifier:(id)a7
{
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  serialQueue = self->_serialQueue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000184E4;
  v19[3] = &unk_100415A58;
  v19[4] = self;
  id v20 = v12;
  int64_t v23 = a3;
  int64_t v24 = a5;
  id v21 = v13;
  id v22 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_sync((dispatch_queue_t)serialQueue, v19);
}

- (void)_onSerialQueue_clearActiveEndpointType:(int64_t)a3 outputDeviceUID:(id)a4 event:(int64_t)a5 reason:(id)a6 clientBundleIdentifier:(id)a7
{
  id v17 = a4;
  id v12 = a6;
  id v13 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v14 = [(MRDAVSystemEndpointController *)self activeOutputDeviceUID:a3];
  if (v14 == v17 || [v17 isEqualToString:v14])
  {
    id v15 = [objc_alloc((Class)MRUpdateActiveSystemEndpointRequest) initWithOutputDeviceUID:0 reason:v12];
    [v15 setClientBundleIdentifier:v13];
    [v15 setType:a3];
    id v16 = [(MRDAVSystemEndpointController *)self _onSerialQueue_updateSystemEndpoint:v15 event:a5 eventReason:v12];
  }
}

- (id)originClientForDeviceUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = [(MRDHostedRoutingController *)self->_routingController availableEndpoints];
    id v5 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v5)
    {
      id v6 = v5;
      id v7 = 0;
      uint64_t v8 = *(void *)v26;
      id v23 = v4;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if (objc_msgSend(v10, "containsOutputDeviceWithUID:", v4, v23))
          {
            id v11 = [v10 externalDevice];
            id v12 = [v11 customOrigin];

            id v13 = [(MRDNowPlayingServer *)self->_nowPlayingServer originClientForOrigin:v12];
            if (!v7) {
              goto LABEL_11;
            }
            id v14 = [v7 registrationDate];
            [v13 registrationDate];
            id v16 = v15 = self;
            id v17 = v6;
            uint64_t v18 = v8;
            id v19 = [v14 compare:v16];

            self = v15;
            BOOL v20 = v19 == (id)1;
            uint64_t v8 = v18;
            id v6 = v17;
            if (v20)
            {
LABEL_11:
              id v21 = v13;

              id v7 = v21;
            }

            id v4 = v23;
          }
        }
        id v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v6);
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = [(MRDNowPlayingServer *)self->_nowPlayingServer localOriginClient];
  }

  return v7;
}

- (void)_handleOriginDidRegisterNotification:(id)a3
{
  id v4 = [a3 userInfo];
  MRGetDeviceInfoFromUserInfo();
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = [(MRDAVSystemEndpointController *)self activeOutputDeviceUID:0];
  id v6 = objc_alloc((Class)NSString);
  active = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription();
  uint64_t v8 = [v15 deviceUID];
  id v9 = [v15 name];
  id v10 = [v6 initWithFormat:@"%@ origin registered <%@> (<%@>) ", active, v8, v9];

  id v11 = [v15 deviceUID];
  LODWORD(v8) = [v5 isEqualToString:v11];

  if (v8)
  {
    id v12 = [objc_alloc((Class)MRUpdateActiveSystemEndpointRequest) initWithOutputDeviceUID:v5 reason:v10];
    [v12 setChangeType:1];
    id v13 = +[NSBundle mainBundle];
    id v14 = [v13 bundleIdentifier];
    [v12 setClientBundleIdentifier:v14];

    [(MRDAVSystemEndpointController *)self updateSystemEndpointForRequest:v12 event:3 eventReason:v10 completion:0];
  }
}

- (void)_handleOriginDidUnregisterNotification:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = MRGetOriginFromUserInfo();

  serialQueue = self->_serialQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100018A54;
  v8[3] = &unk_1004158D8;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_sync((dispatch_queue_t)serialQueue, v8);
}

- (void)_handleOutputContextDidAddOutputDeviceNotification:(id)a3
{
  id v9 = [a3 object];
  unsigned int v4 = -[MRDAVSystemEndpointController _hasPersonalDeviceForContext:](self, "_hasPersonalDeviceForContext:");
  BOOL v5 = v4;
  if (v4 && !self->_cachedHasPersonalDevices)
  {
    id v6 = [objc_alloc((Class)MRUpdateActiveSystemEndpointRequest) initWithOutputDeviceUID:0 reason:@"personal device was attached"];
    id v7 = +[NSBundle mainBundle];
    uint64_t v8 = [v7 bundleIdentifier];
    [v6 setClientBundleIdentifier:v8];

    [(MRDAVSystemEndpointController *)self updateSystemEndpointForRequest:v6];
  }
  self->_cachedHasPersonalDevices = v5;
}

- (void)_handleIsPlayingDidChangeNotification:(id)a3
{
  unsigned int v4 = [a3 playerPath];
  BOOL v5 = [v4 client];
  unsigned int v6 = [v5 processIdentifier];

  uint64_t v7 = 5;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018F14;
  block[3] = &unk_100415AA8;
  if (!v6) {
    uint64_t v7 = 7;
  }
  id v11 = v4;
  id v12 = self;
  uint64_t v13 = v7;
  id v9 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
}

- (void)_onSerialQueue_reevaluateActiveEndpoint:(int64_t)a3 event:(int64_t)a4 eventReason:(id)a5 clientBundleIdentifier:(id)a6
{
}

- (void)_onSerialQueue_reevaluateActiveEndpoint:(int64_t)a3 event:(int64_t)a4 changeType:(int64_t)a5 eventReason:(id)a6 clientBundleIdentifier:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  id v14 = _MRLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_10032A0D4(a3, (uint64_t)v12, v14);
  }

  unsigned __int8 v20 = 0;
  id v19 = 0;
  id v15 = [(MRDAVSystemEndpointController *)self _onSerialQueue_calculateActiveEndpoint:a3 event:a4 reason:&v19 suppressPairedDeviceSync:&v20];
  id v16 = v19;
  id v17 = [objc_alloc((Class)MRUpdateActiveSystemEndpointRequest) initWithOutputDeviceUID:v15 reason:v16];
  [v17 setChangeType:a5];
  [v17 setClientBundleIdentifier:v13];

  [v17 setType:a3];
  [v17 setSuppressPairedDeviceSync:v20];
  id v18 = [(MRDAVSystemEndpointController *)self _onSerialQueue_updateSystemEndpoint:v17 event:a4 eventReason:v12];
}

- (id)_onSerialQueue_calculateActiveEndpoint:(int64_t)a3 event:(int64_t)a4 reason:(id *)a5 suppressPairedDeviceSync:(BOOL *)a6
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  switch(a3)
  {
    case 0:
      id v11 = [(MRDAVSystemEndpointController *)self _onSerialQueue_calculateUserSelectedEndpointForEvent:a4 reason:a5 suppressPairedDeviceSync:a6];
      break;
    case 1:
      id v11 = [(MRDAVSystemEndpointController *)self _onSerialQueue_calculateProactiveEndpointForEvent:a4 reason:a5];
      break;
    case 2:
      id v11 = [(MRDAVSystemEndpointController *)self _onSerialQueue_calculateRecommendedEndpointForEvent:a4 reason:a5];
      break;
    case 3:
      id v11 = [(MRDAVSystemEndpointController *)self _onSerialQueue_calculateProactiveRecommendedEndpoint:a5];
      break;
    default:
      id v11 = 0;
      break;
  }

  return v11;
}

- (id)_onSerialQueue_calculateUserSelectedEndpointForEvent:(int64_t)a3 reason:(id *)a4 suppressPairedDeviceSync:(BOOL *)a5
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  uint64_t v8 = [(NSMutableDictionary *)self->_systemEndpointEntries objectForKeyedSubscript:&off_100437C80];
  id v9 = v8;
  if (!v8)
  {
    id v18 = objc_alloc((Class)NSString);
    active = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription();
    id v17 = [v18 initWithFormat:@"No %@SystemEndpoint", active];
    goto LABEL_7;
  }
  id v10 = [v8 outputDeviceUID];
  active = [(MRDAVSystemEndpointController *)self originClientForDeviceUID:v10];

  [active timeSincePlaying];
  double v13 = v12;
  id v14 = [v9 date];
  [v14 timeIntervalSinceNow];
  double v16 = v15;

  if (([v9 supportsIdleReset] & 1) == 0)
  {
    *a4 = @"doesn't participate in idle reset";
LABEL_9:
    id v19 = [v9 outputDeviceUID];
    goto LABEL_10;
  }
  if (a3 == 6 && active)
  {
    id v17 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"was not playing sort of recently <%lf> seconds ago", *(void *)&v13);
LABEL_7:
    id v19 = 0;
    *a4 = v17;
    goto LABEL_10;
  }
  if (active)
  {
    id v21 = +[MRUserSettings currentSettings];
    [v21 mediaRecentlyPlayedInterval];
    double v23 = v22;

    if (v13 < v23)
    {
      *a4 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"was playing recently <%lf> seconds ago", *(void *)&v13);
      goto LABEL_9;
    }
  }
  if (a3 == 2)
  {
    id v24 = objc_alloc((Class)NSString);
    long long v25 = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription();
    id v26 = [v24 initWithFormat:@"was not <%@> sort of recently <%lf> seconds ago", v25, *(void *)&v13];
  }
  else
  {
    double v27 = -v16;
    long long v28 = +[MRUserSettings currentSettings];
    [v28 endpointRecentlyUserSelectedInterval];
    double v30 = v29;

    id v31 = objc_alloc((Class)NSString);
    if (v30 > v27)
    {
      v32 = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription();
      *a4 = [v31 initWithFormat:@"was <%@> recently <%lf> seconds ago", v32, *(void *)&v27];

      goto LABEL_9;
    }
    if (active)
    {
      [active timeSincePlaying];
      uint64_t v34 = v33;
      long long v25 = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription();
      v35 = [v9 date];
      [v35 timeIntervalSinceNow];
      *a4 = [v31 initWithFormat:@"was not playing recently <%lf> ago and was not <%@> recently <%lf> seconds ago", v34, v25, -v36];

      goto LABEL_23;
    }
    long long v25 = [v9 outputDeviceUID];
    id v26 = [v31 initWithFormat:@"Could not find origin with deviceUID = <%@>", v25, v37];
  }
  *a4 = v26;
LABEL_23:

  id v19 = 0;
LABEL_10:

  return v19;
}

- (id)_onSerialQueue_calculateProactiveEndpointForEvent:(int64_t)a3 reason:(id *)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  unsigned int v6 = [(MRDNowPlayingServer *)self->_nowPlayingServer localOriginClient];
  uint64_t v7 = [v6 activeNowPlayingClient];
  uint64_t v8 = [v7 activePlayerClient];

  if ([v8 isPlaying])
  {
    id v9 = objc_alloc((Class)NSString);
    id v10 = [v8 playerPath];
    id v11 = [v9 initWithFormat:@"local activePlayer %@ is playing", v10];
    double v12 = 0;
    *a4 = v11;
  }
  else
  {
    id v10 = [(NSMutableDictionary *)self->_systemEndpointEntries objectForKeyedSubscript:&off_100437C80];
    double v13 = [v10 outputDeviceUID];
    id v14 = [(MRDAVSystemEndpointController *)self originClientForDeviceUID:v13];
    if (v14)
    {
      *a4 = (id)MRMediaRemoteActiveEndpointTypeCopyDescription();
      id v15 = v13;
    }
    else
    {
      *a4 = @"Fallback to previous";
      id v15 = [(MRDAVSystemEndpointController *)self activeOutputDeviceUID:1];
    }
    double v12 = v15;
  }

  return v12;
}

- (id)_onSerialQueue_calculateRecommendedEndpointForEvent:(int64_t)a3 reason:(id *)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  systemEndpointEntries = self->_systemEndpointEntries;
  uint64_t v7 = +[NSNumber numberWithInteger:2];
  uint64_t v8 = [(NSMutableDictionary *)systemEndpointEntries objectForKeyedSubscript:v7];

  if (v8)
  {
    id v9 = [v8 outputDeviceUID];
    active = [(MRDAVSystemEndpointController *)self originClientForDeviceUID:v9];

    id v11 = [active activeNowPlayingClient];
    double v12 = [v11 activePlayerClient];

    if ([v12 isPlaying])
    {
      id v13 = objc_alloc((Class)NSString);
      id v14 = [v12 playerPath];
      *a4 = [v13 initWithFormat:@"%@ is playing", v14];

      id v15 = [v8 outputDeviceUID];
    }
    else
    {
      if (v12)
      {
        id v17 = objc_alloc((Class)NSString);
        id v18 = [v12 playerPath];
        id v19 = [v17 initWithFormat:@"%@ is not playing", v18];
      }
      else
      {
        id v20 = objc_alloc((Class)NSString);
        if (active)
        {
          id v18 = [active playerPath];
          id v19 = [v20 initWithFormat:@"%@ does not have a now playing app", v18];
        }
        else
        {
          id v18 = [v8 outputDeviceUID];
          id v19 = [v20 initWithFormat:@"Could not find origin with deviceUID = <%@>", v18];
        }
      }
      *a4 = v19;

      id v15 = 0;
    }
  }
  else
  {
    id v16 = objc_alloc((Class)NSString);
    active = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription();
    id v15 = 0;
    *a4 = [v16 initWithFormat:@"No %@SystemEndpoint", active];
  }

  return v15;
}

- (id)_onSerialQueue_calculateProactiveRecommendedEndpoint:(id *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  BOOL v5 = [(MRDNowPlayingServer *)self->_nowPlayingServer localOriginClient];
  unsigned int v6 = [v5 activeNowPlayingClient];
  uint64_t v7 = [v6 activePlayerClient];

  if ([v7 isPlaying])
  {
    id v8 = objc_alloc((Class)NSString);
    id v9 = [v7 playerPath];
    id v10 = [v8 initWithFormat:@"local activePlayer %@ is playing", v9];
    id v11 = 0;
    *a3 = v10;
  }
  else
  {
    *a3 = @"Fallback to recommended";
    id v9 = [(NSMutableDictionary *)self->_systemEndpointEntries objectForKeyedSubscript:&off_100437C98];
    id v11 = [v9 outputDeviceUID];
  }

  return v11;
}

- (id)_isAllowedToUpdateRecommendationForOutputDevice:(id)a3 recentlyDismissed:(id)a4
{
  id v5 = a3;
  unsigned int v6 = v5;
  if (!v5)
  {
    id v26 = 0;
    goto LABEL_13;
  }
  v32 = _NSConcreteStackBlock;
  uint64_t v33 = 3221225472;
  uint64_t v34 = sub_100019CC4;
  v35 = &unk_100415AD0;
  id v7 = v5;
  id v36 = v7;
  id v8 = objc_msgSend(a4, "msv_firstWhere:", &v32);
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 date];
    [v9 disableDuration];
    id v11 = objc_msgSend(v10, "dateByAddingTimeInterval:");

    double v12 = +[NSDate now];
    id v13 = [v12 compare:v11];

    if (v13 == (id)-1)
    {
      id v27 = objc_alloc((Class)NSError);
      active = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription();
      id v21 = [v9 date];
      double v22 = [v9 date];
      [v22 timeIntervalSinceNow];
      uint64_t v29 = v28;
      [v11 timeIntervalSinceNow];
      id v26 = [v27 initWithMRError:3, @"Cannot update the %@ yet. Was last dismissed at %@ (%lf seconds ago). Cannot set until %@ (%lf more seconds)", active, v21, v29, v11, v30, v32, v33, v34, v35 format];
    }
    else
    {
      id v14 = +[MRDMediaRemoteServer server];
      id v15 = [v14 nowPlayingServer];
      active = [v15 originClientForDeviceUID:v7];

      id v17 = [active devicePlaybackSessionID];
      id v18 = [v9 devicePlaybackSessionID];
      unsigned int v19 = [v17 isEqualToString:v18];

      if (!v19)
      {
        id v26 = 0;
        goto LABEL_11;
      }
      id v20 = objc_alloc((Class)NSError);
      id v21 = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription();
      double v22 = [v9 devicePlaybackSessionID];
      double v23 = [v9 date];
      id v24 = [v9 date];
      [v24 timeIntervalSinceNow];
      id v26 = [v20 initWithMRError:3, @"Cannot update the %@ to outputDeviceUID=%@ while devicePlaybackSessionID=%@, it was already dismissed at %@ (%lf seconds ago)", v21, v7, v22, v23, v25, v32, v33, v34, v35 format];
    }
LABEL_11:

    goto LABEL_12;
  }
  id v26 = 0;
LABEL_12:

LABEL_13:

  return v26;
}

- (void)_storeRecentlyDismissedRecommendationForOutputDeviceUID:(id)a3 disableDuration:(double)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6 && a4 > 0.0)
  {
    recentlyDismissedRecommendations = self->_recentlyDismissedRecommendations;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100019EA8;
    v18[3] = &unk_100415AD0;
    id v9 = v6;
    id v19 = v9;
    id v10 = [(NSMutableArray *)recentlyDismissedRecommendations msv_firstWhere:v18];
    if (v10) {
      [(NSMutableArray *)self->_recentlyDismissedRecommendations removeObject:v10];
    }
    id v11 = +[MRDMediaRemoteServer server];
    double v12 = [v11 nowPlayingServer];
    id v13 = [v12 originClientForDeviceUID:v9];

    id v14 = [MRDSystemEndpointControllerRecentlyDismissedRecommendation alloc];
    id v15 = +[NSDate now];
    id v16 = [v13 devicePlaybackSessionID];
    id v17 = [(MRDSystemEndpointControllerRecentlyDismissedRecommendation *)v14 initWithOutputDevice:v9 date:v15 disableDuration:v16 devicePlaybackSessionID:a4];

    [(NSMutableArray *)self->_recentlyDismissedRecommendations addObject:v17];
  }
}

- (id)_onSerialQueue_updateSystemEndpoint:(id)a3 event:(int64_t)a4 eventReason:(id)a5
{
  id v7 = a3;
  id v87 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v8 = [v7 type];
  systemEndpointEntries = self->_systemEndpointEntries;
  id v10 = +[NSNumber numberWithInteger:v8];
  id v11 = [(NSMutableDictionary *)systemEndpointEntries objectForKeyedSubscript:v10];

  id v12 = [v11 outputDeviceUID];
  id v13 = [v7 outputDeviceUID];
  id v14 = +[MRDMediaRemoteServer server];
  id v15 = [v14 groupSessionServer];
  id v16 = [v15 sessionManager];

  v84 = v16;
  id v17 = [v16 session];
  id v18 = [v17 identifier];
  unsigned int v19 = [v18 isEqualToString:v13];

  id v20 = v12;
  if (v8 == (id)2)
  {
    [v7 disableDuration];
    -[MRDAVSystemEndpointController _storeRecentlyDismissedRecommendationForOutputDeviceUID:disableDuration:](self, "_storeRecentlyDismissedRecommendationForOutputDeviceUID:disableDuration:", v12);
    id v21 = [(MRDAVSystemEndpointController *)self _isAllowedToUpdateRecommendationForOutputDevice:v13 recentlyDismissed:self->_recentlyDismissedRecommendations];
    if (v21) {
      goto LABEL_54;
    }
  }
  double v22 = v7;
  id v23 = [v7 changeType];
  BOOL v24 = 0;
  v86 = v13;
  if (v8 == (id)1)
  {
    int64_t v25 = a4;
    if (!v23) {
      goto LABEL_14;
    }
    if (a4 == 5)
    {
      if (v12)
      {
        BOOL v24 = 0;
        goto LABEL_14;
      }
      id v26 = [v22 outputDeviceUID];
    }
    else
    {
      BOOL v24 = 0;
      if ((a4 & 0xFFFFFFFFFFFFFFFBLL) != 2 || !v12) {
        goto LABEL_14;
      }
      id v26 = [(MRDAVSystemEndpointController *)self originClientForDeviceUID:v12];
    }
    BOOL v24 = v26 != 0;
  }
  else
  {
    int64_t v25 = a4;
  }
LABEL_14:
  id v27 = objc_alloc_init(MRDSystemEndpointEntry);
  [(MRDSystemEndpointEntry *)v27 setOutputDeviceUID:v86];
  [(MRDSystemEndpointEntry *)v27 setType:v8];
  [(MRDSystemEndpointEntry *)v27 setEvent:v25];
  uint64_t v28 = [v22 reason];
  [(MRDSystemEndpointEntry *)v27 setSelectionReason:v28];

  [(MRDSystemEndpointEntry *)v27 setEventReason:v87];
  BOOL v85 = v24;
  BOOL v29 = v24;
  id v7 = v22;
  [(MRDSystemEndpointEntry *)v27 setChangeType:v29];
  if (v86) {
    uint64_t v30 = v19 ^ 1;
  }
  else {
    uint64_t v30 = 0;
  }
  [(MRDSystemEndpointEntry *)v27 setSupportsIdleReset:v30];
  id v31 = [v22 demoteWhenSyncingToCompanion];
  v32 = +[NSDate date];
  id v33 = [v7 outputDeviceUID];
  v83 = v12;
  if (v33 == v12)
  {

LABEL_21:
    id v31 = (id)(v31 | [v11 demoteWhenSyncingToCompanion]);
    BOOL v36 = v85;
    if (a4 == 1)
    {
      id v20 = v83;
    }
    else
    {
      id v20 = v83;
      if (v11)
      {
        uint64_t v37 = [v11 date];

        v32 = (void *)v37;
      }
    }
    goto LABEL_25;
  }
  uint64_t v34 = v33;
  unsigned int v35 = [v33 isEqual:v12];

  if (v35) {
    goto LABEL_21;
  }
  id v20 = v12;
  BOOL v36 = v85;
LABEL_25:
  [(MRDSystemEndpointEntry *)v27 setDemoteWhenSyncingToCompanion:v31];
  v81 = v32;
  [(MRDSystemEndpointEntry *)v27 setDate:v32];
  v38 = self->_systemEndpointEntries;
  id v39 = +[NSNumber numberWithInteger:v8];
  [(NSMutableDictionary *)v38 setObject:v27 forKeyedSubscript:v39];

  v40 = [(MRDAVSystemEndpointController *)self systemEndpointInfo];
  id v41 = [(MRDAVSystemEndpointController *)self recentlyDismissedRecommendationsInfo];
  [(MRDAVSystemEndpointController *)self _writeSystemEndpointInfo:v40 recentlyDismissedRecommendationsInfo:v41];

  v99[0] = _NSConcreteStackBlock;
  v99[1] = 3221225472;
  v99[2] = sub_10001A884;
  v99[3] = &unk_100415AF8;
  int64_t v103 = a4;
  BOOL v104 = v36;
  v82 = v11;
  id v42 = v11;
  id v100 = v42;
  id v43 = v7;
  id v101 = v43;
  id v44 = v20;
  id v102 = v44;
  v80 = objc_retainBlock(v99);
  if (((unsigned int (*)(void))v80[2])())
  {
    v76 = v42;
    v45 = v43;
    uint64_t v46 = MRMediaRemoteActiveEndpointChangeTypeCopyDescription();
    active = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription();
    id v47 = objc_alloc((Class)NSString);
    v78 = v45;
    id v48 = [v45 outputDeviceUID];
    if ((unint64_t)a4 > 9) {
      uint64_t v49 = 0;
    }
    else {
      uint64_t v49 = (uint64_t)*(&off_100415D38 + a4);
    }
    v54 = [v78 reason];
    uint64_t v75 = v49;
    id v50 = v46;
    id v77 = [v47 initWithFormat:@"%@SystemEndpoint changed from <%@> to <%@> with changeType = <%@>, eventType = <%@>, eventReason = <%@>, selectionReason = <%@>", active, v44, v48, v46, v75, v87, v54];

    v55 = _MRLogForCategory();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v106 = v77;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "[SystemEndpointController] %{public}@", buf, 0xCu);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001A93C;
    block[3] = &unk_100415B20;
    id v43 = v78;
    id v56 = v78;
    id v95 = v56;
    v96 = self;
    BOOL v36 = v85;
    BOOL v97 = v85;
    id v98 = v8;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    if (([v56 isPairedDeviceSync] & 1) == 0)
    {
      id v57 = sub_10001A9B0(v77);
      id v58 = v57;
      if (v57)
      {
        v59 = v57;
      }
      else if ((unint64_t)a4 >= 0xA)
      {
        v59 = @"unknown";
      }
      else
      {
        v59 = *(&off_100415D38 + a4);
      }

      id v89 = v56;
      id v90 = active;
      v91 = v50;
      v92 = v59;
      id v93 = v76;
      id v61 = v59;
      MRAnalyticsSendEvent();

      BOOL v36 = v85;
    }

    id v20 = v83;
  }
  else
  {
    id v50 = _MRLogForCategory();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      v51 = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription();
      v52 = [v43 outputDeviceUID];
      if ((unint64_t)a4 > 9) {
        uint64_t v53 = 0;
      }
      else {
        uint64_t v53 = (uint64_t)*(&off_100415D38 + a4);
      }
      id v60 = [v43 reason];
      *(_DWORD *)long long buf = 138413314;
      id v106 = v51;
      __int16 v107 = 2112;
      v108 = v52;
      __int16 v109 = 2112;
      uint64_t v110 = v53;
      __int16 v111 = 2112;
      id v112 = v87;
      __int16 v113 = 2112;
      v114 = v60;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "[SystemEndpointController] %@SystemEndpoint remains <%@>, eventType = <%@>, eventReason = <%@>, selectionReason = <%@>", buf, 0x34u);

      id v20 = v83;
      BOOL v36 = v85;
    }
  }

  id v62 = [v43 outputDeviceUID];
  id v63 = [(MRDAVSystemEndpointController *)self originClientForDeviceUID:v62];

  if (v8 == (id)1)
  {
    id v68 = v80;
    if (a4 == 5) {
      notify_post(kMRMediaRemoteProactiveSystemEndpointDidStartPlayingNotifyName);
    }
  }
  else if (v8)
  {
    BOOL v69 = v8 == (id)2;
    id v68 = v80;
    if (v69)
    {
      v70 = [v63 origin];
      v71 = (MROrigin *)[v70 copy];
      activeRecommendedOrigin = self->_activeRecommendedOrigin;
      self->_activeRecommendedOrigin = v71;

      v73 = [v43 clientBundleIdentifier];
      [(MRDAVSystemEndpointController *)self _onSerialQueue_reevaluateActiveEndpoint:3 event:a4 changeType:v36 eventReason:v87 clientBundleIdentifier:v73];
    }
  }
  else
  {
    v64 = [v63 origin];
    uint64_t v65 = (MROrigin *)[v64 copy];
    activeOrigin = self->_activeOrigin;
    self->_activeOrigin = v65;

    v67 = [v43 clientBundleIdentifier];
    [(MRDAVSystemEndpointController *)self _onSerialQueue_reevaluateActiveEndpoint:1 event:a4 changeType:v36 eventReason:v87 clientBundleIdentifier:v67];

    id v68 = v80;
    if (((unsigned int (*)(void *))v80[2])(v80))
    {
      [(MRDAVSystemEndpointController *)self _onSerialQueue_maybeSetupUserSelectedTimerForEvent:1];
      [(MRDAVSystemEndpointController *)self _onSerialQueue_maybeSetupPlaybackTimerForEvent:1];
    }
  }

  id v21 = 0;
  id v11 = v82;
  id v13 = v86;
LABEL_54:

  return v21;
}

- (void)_onSerialQueue_reconnectToOutputDevice:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc((Class)NSString);
  active = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription();
  id v13 = [v11 initWithFormat:@"%@ endpoint disconnected and attempting to reconnect", active];

  +[MRDAutoConnectionControllerReason reasonWithType:3 string:v13];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10001AE1C;
  v22[3] = &unk_100415BC0;
  id v23 = v9;
  id v24 = v8;
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  id v26 = self;
  id v14 = v25;
  id v15 = v8;
  id v16 = v9;
  id v20 = objc_retainBlock(v22);
  id v21 = v10;
  id v17 = (void (*)(double))v20[2];
  id v18 = v10;
  unsigned int v19 = v20;
  v17(0.0);
}

- (void)_onSerialQueue_maybeSetupUserSelectedTimerForEvent:(int64_t)a3
{
  id v5 = [(NSMutableDictionary *)self->_systemEndpointEntries objectForKeyedSubscript:&off_100437C80];
  id v6 = v5;
  if (v5)
  {
    if ([v5 supportsIdleReset])
    {
      id v7 = [v6 outputDeviceUID];
      id v8 = [(MRDAVSystemEndpointController *)self originClientForDeviceUID:v7];

      if ([v8 isPlaying])
      {
        userSelectedTimer = self->_userSelectedTimer;
        id v10 = objc_alloc((Class)NSString);
        active = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription();
        id v12 = [v10 initWithFormat:@"%@Endpoint is playing", active];
      }
      else
      {
        id v17 = [v6 date];
        [v17 timeIntervalSinceNow];
        double v19 = v18;
        double v20 = -v18;

        id v21 = +[MRUserSettings currentSettings];
        [v21 endpointRecentlyUserSelectedInterval];
        double v23 = v22 + 5.0;

        if (v23 > v20)
        {
          id v24 = self->_userSelectedTimer;
          id v25 = objc_alloc((Class)NSString);
          id v26 = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription();
          id v27 = [v25 initWithFormat:@"%@Endpoint changed", v26];
          [(MRPersistentTimer *)v24 invalidateWithReason:v27];

          id v28 = objc_alloc((Class)MRPersistentTimer);
          serialQueue = self->_serialQueue;
          v34[0] = _NSConcreteStackBlock;
          v34[1] = 3221225472;
          v34[2] = sub_10001B464;
          v34[3] = &unk_100415C38;
          *(double *)&v34[6] = v23;
          v34[4] = self;
          v34[5] = a3;
          uint64_t v30 = (MRPersistentTimer *)[v28 initWithInterval:@"com.apple.mediaremote.systemendpointcontroller.userselectedtimer" name:serialQueue queue:v34 block:v19 + v23];
          id v31 = self->_userSelectedTimer;
          self->_userSelectedTimer = v30;

LABEL_10:
          goto LABEL_11;
        }
        userSelectedTimer = self->_userSelectedTimer;
        id v32 = objc_alloc((Class)NSString);
        active = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription();
        id v12 = [v32 initWithFormat:@"%@Endpoint timeout imminent", active];
      }
      id v33 = v12;
      [(MRPersistentTimer *)userSelectedTimer invalidateWithReason:v12];

      goto LABEL_10;
    }
    id v13 = self->_userSelectedTimer;
    id v14 = objc_alloc((Class)NSString);
    id v15 = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription();
    id v16 = [v14 initWithFormat:@"%@Endpoint doesn't reset when idle", v15];
    [(MRPersistentTimer *)v13 invalidateWithReason:v16];
  }
LABEL_11:
}

- (void)_onSerialQueue_maybeSetupPlaybackTimerForEvent:(int64_t)a3
{
  id v5 = [(NSMutableDictionary *)self->_systemEndpointEntries objectForKeyedSubscript:&off_100437C80];
  id v6 = v5;
  if (v5)
  {
    if ([v5 supportsIdleReset])
    {
      id v7 = [v6 outputDeviceUID];
      id v8 = [(MRDAVSystemEndpointController *)self originClientForDeviceUID:v7];

      if ([v8 isPlaying])
      {
        [(MRDAVSystemEndpointController *)self _onSerialQueue_maybeSetupUserSelectedTimerForEvent:a3];
        playbackTimer = self->_playbackTimer;
        id v10 = objc_alloc((Class)NSString);
        active = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription();
        id v12 = [v10 initWithFormat:@"%@Endpoint is playing", active];
      }
      else
      {
        [v8 timeSincePlaying];
        double v18 = v17;
        double v19 = +[MRUserSettings currentSettings];
        [v19 mediaRecentlyPlayedInterval];
        double v21 = v20 + 5.0;

        if (v18 < v21)
        {
          id v22 = objc_alloc((Class)MRPersistentTimer);
          serialQueue = self->_serialQueue;
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472;
          v28[2] = sub_10001B7A0;
          v28[3] = &unk_100415B20;
          uint64_t v30 = self;
          int64_t v31 = a3;
          double v32 = v21;
          id v29 = v8;
          id v24 = (MRPersistentTimer *)[v22 initWithInterval:@"com.apple.mediaremote.systemendpointcontroller.playbacktimer" name:serialQueue queue:v28 block:v21 - v18];
          id v25 = self->_playbackTimer;
          self->_playbackTimer = v24;

LABEL_10:
          goto LABEL_11;
        }
        playbackTimer = self->_playbackTimer;
        id v26 = objc_alloc((Class)NSString);
        active = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription();
        id v12 = [v26 initWithFormat:@"%@Endpoint timeout imminent", active];
      }
      id v27 = v12;
      [(MRPersistentTimer *)playbackTimer invalidateWithReason:v12];

      goto LABEL_10;
    }
    id v13 = self->_playbackTimer;
    id v14 = objc_alloc((Class)NSString);
    id v15 = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription();
    id v16 = [v14 initWithFormat:@"%@Endpoint doesn't reset when idle", v15];
    [(MRPersistentTimer *)v13 invalidateWithReason:v16];
  }
LABEL_11:
}

- (BOOL)_hasPersonalDeviceForContext:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = objc_msgSend(a3, "outputDevices", 0);
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v7 deviceType] != 1
          && [v7 deviceType] != 4
          && [v7 deviceSubtype] != 8)
        {
          LOBYTE(v4) = 1;
          goto LABEL_13;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return (char)v4;
}

- (void)_writeSystemEndpointInfo:(id)a3 recentlyDismissedRecommendationsInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10047DEA8 != -1) {
    dispatch_once(&qword_10047DEA8, &stru_100415C78);
  }
  id v8 = qword_10047DEA0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001BB2C;
  block[3] = &unk_1004159B8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)_initializeSystemEndpointInfo
{
  id v3 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"SystemEndpoint"];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10001BE08;
  v23[3] = &unk_100415CA0;
  v23[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v23];
  id v4 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"SystemEndpointRecentlyDismissedRecommendations"];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        recentlyDismissedRecommendations = self->_recentlyDismissedRecommendations;
        id v10 = [[MRDSystemEndpointControllerRecentlyDismissedRecommendation alloc] initWithDictionaryRepresentation:*(void *)(*((void *)&v19 + 1) + 8 * i)];
        [(NSMutableArray *)recentlyDismissedRecommendations addObject:v10];
      }
      id v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }
  long long v11 = [(NSMutableDictionary *)self->_systemEndpointEntries objectForKeyedSubscript:&off_100437C80];
  id v12 = [v11 outputDeviceUID];
  if (v12)
  {
    id v13 = +[MRUserSettings currentSettings];
    [v13 activeSystemEndpointStartupDelayToAllowAllPreviousClientsTimeToInitializeInterval];
    int64_t v15 = (uint64_t)(v14 * 1000000000.0);
  }
  else
  {
    int64_t v15 = 0;
  }

  dispatch_time_t v16 = dispatch_time(0, v15);
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001C024;
  block[3] = &unk_100415CC8;
  void block[4] = self;
  dispatch_after(v16, (dispatch_queue_t)serialQueue, block);
}

- (void)_deviceInfoDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDAVSystemEndpointController *)self activeOutputDeviceUID:0];
  id v6 = [v4 userInfo];
  uint64_t v7 = MRGetDeviceInfoFromUserInfo();

  id v8 = [v4 userInfo];
  id v9 = MRGetOriginFromUserInfo();

  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  unsigned int v35 = sub_1000171E4;
  BOOL v36 = sub_1000171F4;
  id v37 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001C4E4;
  block[3] = &unk_100415CF0;
  void block[4] = self;
  void block[5] = &v32;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  if (([(id)v33[5] isLocal] & 1) == 0
    && ([v9 isEqual:v33[5]] & 1) != 0
    && [v7 supportsMultiplayer])
  {
    long long v11 = [v7 deviceUID];
    if ([v11 isEqual:v5])
    {
LABEL_15:

      goto LABEL_16;
    }
    id v12 = [v7 clusterID];
    unsigned __int8 v13 = [v12 isEqual:v5];

    if ((v13 & 1) == 0)
    {
      double v14 = [v7 groupedDevices];
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_10001C4F8;
      v29[3] = &unk_100415D18;
      id v15 = v5;
      id v30 = v15;
      unsigned __int8 v16 = objc_msgSend(v14, "mr_any:", v29);

      if ((v16 & 1) == 0)
      {
        double v17 = [v7 deviceUID];
        unsigned __int8 v18 = [v17 isEqual:v15];

        if ((v18 & 1) == 0)
        {
          long long v19 = [v7 deviceUID];
          if (v19) {
            goto LABEL_10;
          }
        }
        long long v20 = [v7 groupedDevices];
        id v24 = _NSConcreteStackBlock;
        uint64_t v25 = 3221225472;
        id v26 = sub_10001C53C;
        id v27 = &unk_100415D18;
        id v28 = v15;
        long long v21 = objc_msgSend(v20, "mr_first:", &v24);
        long long v19 = objc_msgSend(v21, "deviceUID", v24, v25, v26, v27);

        if (v19)
        {
LABEL_10:
          long long v22 = _MRLogForCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138543362;
            id v39 = v19;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[SystemEndpointController] Requesting to move ASE to deviceUID: %{public}@ because the old ASE changed groups", buf, 0xCu);
          }

          id v23 = [objc_alloc((Class)MRUpdateActiveSystemEndpointRequest) initWithOutputDeviceUID:v19 reason:@"ASE moved to another endpoint"];
          [(MRDAVSystemEndpointController *)self updateSystemEndpointForRequest:v23 event:9 completion:0];
        }
        else
        {
          long long v19 = _MRLogForCategory();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[SystemEndpointController] ASE changed groups, but no other devices found in old group", buf, 2u);
          }
        }
      }
      long long v11 = v30;
      goto LABEL_15;
    }
  }
LABEL_16:
  _Block_object_dispose(&v32, 8);
}

- (MRDAVSystemEndpointControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRDAVSystemEndpointControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_helper, 0);
  objc_storeStrong((id *)&self->_lastClientUpdateDate, 0);
  objc_storeStrong((id *)&self->_activeRecommendedOrigin, 0);
  objc_storeStrong((id *)&self->_activeOrigin, 0);
  objc_storeStrong((id *)&self->_playbackTimer, 0);
  objc_storeStrong((id *)&self->_userSelectedTimer, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_recentlyDismissedRecommendations, 0);
  objc_storeStrong((id *)&self->_systemEndpointEntries, 0);
  objc_storeStrong((id *)&self->_routingController, 0);
  objc_storeStrong((id *)&self->_nowPlayingServer, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end