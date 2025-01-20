@interface MRDAVOutputContextExternalDevice
+ (id)_resolveReason:(id)a3 uid:(id)a4 name:(id)a5 requestID:(id)a6;
+ (void)_createPlayerAndWaitForCanBeNowPlaying:(id)a3 deviceInfo:(id)a4 completion:(id)a5;
+ (void)_createPlayerAndWaitForConnection:(id)a3 command:(id)a4 deviceInfo:(id)a5 completion:(id)a6;
+ (void)_createPlayerForClient:(id)a3 playerPath:(id)a4 deviceInfo:(id)a5 completion:(id)a6;
+ (void)_reportStreamCountAnalytics;
+ (void)_sendCommandPreview:(unsigned int)a3 options:(id)a4 playerPath:(id)a5;
+ (void)initialize;
+ (void)prewarm;
+ (void)prewarmApp:(id)a3 origin:(id)a4 deviceInfo:(id)a5;
+ (void)prewarmSoon;
- (BOOL)disconnectWhenUndiscoverable;
- (BOOL)isPaired;
- (BOOL)isUsingSystemPairing;
- (BOOL)supportsDesignatedGroupLeaderUpdates;
- (BOOL)supportsIdleDisconnection;
- (BOOL)verifyCreatedPlayerPath:(id)a3 forClient:(id)a4 error:(id *)a5;
- (BOOL)wantsNowPlayingArtworkNotifications;
- (BOOL)wantsNowPlayingNotifications;
- (BOOL)wantsOutputDeviceNotifications;
- (BOOL)wantsSystemEndpointNotifications;
- (BOOL)wantsVolumeNotifications;
- (MRAVConcreteOutputContext)outputContext;
- (MRAVOutputDevice)designatedGroupLeader;
- (MRDAVOutputContextExternalDevice)initWithOutputContext:(id)a3;
- (MRDAirPlayLeaderInfoPublisher)airplayPublisher;
- (MROrigin)origin;
- (NSError)disconnectionError;
- (NSString)debugDescription;
- (NSString)description;
- (OS_dispatch_queue)connectionStateCallbackQueue;
- (OS_dispatch_queue)deviceInfoCallbackQueue;
- (OS_dispatch_queue)notificationQueue;
- (OS_dispatch_queue)outputDevicesRemovedCallbackQueue;
- (OS_dispatch_queue)outputDevicesUpdatedCallbackQueue;
- (OS_dispatch_queue)serialQueue;
- (OS_dispatch_queue)volumeCallbackQueue;
- (OS_dispatch_queue)volumeControlCapabilitiesCallbackQueue;
- (OS_dispatch_queue)volumeMutedCallbackQueue;
- (OS_dispatch_queue)workerQueue;
- (id)_createResolvedPlayerPathFromPlayerPath:(id)a3;
- (id)_generateDeviceInfoWithDesignatedGroupLeader:(id)a3 outputContext:(id)a4;
- (id)_resolveReason:(id)a3;
- (id)connectionStateCallback;
- (id)currentClientUpdatesConfigMessage;
- (id)customOrigin;
- (id)deviceInfo;
- (id)deviceInfoCallback;
- (id)dictionaryRepresentation;
- (id)errorForCurrentState;
- (id)groupSessionToken;
- (id)hostName;
- (id)name;
- (id)outputDeviceForUID:(id)a3 error:(id *)a4;
- (id)outputDevicesRemovedCallback;
- (id)outputDevicesUpdatedCallback;
- (id)subscribedPlayerPaths;
- (id)supportedMessages;
- (id)uid;
- (id)volumeCallback;
- (id)volumeControlCapabilitiesCallback;
- (id)volumeMutedCallback;
- (int64_t)port;
- (unsigned)connectionState;
- (void)_createPlayerAndWaitForCanBeNowPlaying:(id)a3 completion:(id)a4;
- (void)_createPlayerAndWaitForConnection:(id)a3 command:(id)a4 completion:(id)a5;
- (void)_handlePlaybackQueueRequest:(id)a3 forPlayerPath:(id)a4 completion:(id)a5;
- (void)_handlePlaybackSessionMigrateBeginRequest:(id)a3 forPlayerPath:(id)a4 completion:(id)a5;
- (void)_handlePlaybackSessionMigrateEndRequest:(id)a3 error:(id)a4 forPlayerPath:(id)a5 completion:(id)a6;
- (void)_handlePlaybackSessionMigrateRequest:(id)a3 request:(id)a4 forPlayerPath:(id)a5 completion:(id)a6;
- (void)_handlePlaybackSessionRequest:(id)a3 forPlayerPath:(id)a4 completion:(id)a5;
- (void)_handleRemoteCommand:(unsigned int)a3 withOptions:(id)a4 playerPath:(id)a5 completion:(id)a6;
- (void)_notifyActiveSessionMaybeWillBeHijackedByNativePlaybackFromOutputContextModification:(id)a3;
- (void)_onQueue_clearLocalOriginForwaderWithReason:(id)a3;
- (void)_onQueue_destroyPlayerPathsForOrigin:(id)a3;
- (void)_onQueue_forwardOriginToLocalOrigin:(id)a3;
- (void)_reevaluateDeviceInfo;
- (void)_sendMessageForPlayerPath:(id)a3 timeout:(double)a4 reason:(id)a5 factory:(id)a6 completion:(id)a7;
- (void)adjustOutputDeviceVolume:(int64_t)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)anyDeviceInfoDidChangeNotification:(id)a3;
- (void)cleanUp;
- (void)clusterController:(id)a3 clusterTypeDidChange:(unsigned int)a4;
- (void)commitOutputDeviceToContextIfNeededWithReason:(id)a3 completion:(id)a4;
- (void)connectWithOptions:(unsigned int)a3 userInfo:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)destroyPlayersForClient:(id)a3 origin:(id)a4;
- (void)disconnect:(id)a3;
- (void)localClusterTypeDidChangeNotification:(id)a3;
- (void)modifyTopologyWithRequest:(id)a3 withReplyQueue:(id)a4 completion:(id)a5;
- (void)muteOutputDeviceVolume:(BOOL)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)outputContextDataSourceDidAddOutputDeviceNotification:(id)a3;
- (void)outputContextDataSourceDidRemoveOutputDeviceNotification:(id)a3;
- (void)outputContextDataSourceIsMutedDidChangeNotification:(id)a3;
- (void)outputContextDataSourceOutputDeviceDidChangeNotification:(id)a3;
- (void)outputContextDataSourceVolumeControlCapabilitiesDidChangeNotification:(id)a3;
- (void)outputContextDataSourceVolumeDidChangeNotification:(id)a3;
- (void)outputContextRequestToAddLocalOutputDeviceNotification:(id)a3;
- (void)outputDeviceVolume:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)outputDeviceVolumeControlCapabilities:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)ping:(double)a3 callback:(id)a4 withQueue:(id)a5;
- (void)registerForNotifications;
- (void)removeFromParentGroup:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)requestGroupSessionWithDetails:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)sendMessageWithType:(unint64_t)a3 playerPath:(id)a4 timeout:(double)a5 reason:(id)a6 factory:(id)a7 completion:(id)a8;
- (void)setConnectionState:(unsigned int)a3;
- (void)setConnectionStateCallback:(id)a3;
- (void)setConnectionStateCallback:(id)a3 withQueue:(id)a4;
- (void)setConnectionStateCallbackQueue:(id)a3;
- (void)setDesignatedGroupLeader:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setDeviceInfoCallback:(id)a3;
- (void)setDeviceInfoCallbackQueue:(id)a3;
- (void)setDeviceInfoChangedCallback:(id)a3 withQueue:(id)a4;
- (void)setNotificationQueue:(id)a3;
- (void)setOrigin:(id)a3;
- (void)setOutputContext:(id)a3;
- (void)setOutputDeviceVolume:(float)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)setOutputDevicesRemovedCallback:(id)a3;
- (void)setOutputDevicesRemovedCallback:(id)a3 withQueue:(id)a4;
- (void)setOutputDevicesRemovedCallbackQueue:(id)a3;
- (void)setOutputDevicesUpdatedCallback:(id)a3;
- (void)setOutputDevicesUpdatedCallback:(id)a3 withQueue:(id)a4;
- (void)setOutputDevicesUpdatedCallbackQueue:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setSubscribedPlayerPaths:(id)a3;
- (void)setVolumeCallback:(id)a3;
- (void)setVolumeCallbackQueue:(id)a3;
- (void)setVolumeChangedCallback:(id)a3 withQueue:(id)a4;
- (void)setVolumeControlCapabilitiesCallback:(id)a3;
- (void)setVolumeControlCapabilitiesCallback:(id)a3 withQueue:(id)a4;
- (void)setVolumeControlCapabilitiesCallbackQueue:(id)a3;
- (void)setVolumeMutedCallback:(id)a3;
- (void)setVolumeMutedCallbackQueue:(id)a3;
- (void)setVolumeMutedChangedCallback:(id)a3 withQueue:(id)a4;
- (void)setWorkerQueue:(id)a3;
- (void)updateDesignatedGroupLeader:(id)a3;
@end

@implementation MRDAVOutputContextExternalDevice

- (MRDAVOutputContextExternalDevice)initWithOutputContext:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MRDAVOutputContextExternalDevice;
  v6 = (MRDAVOutputContextExternalDevice *)[(MRDAVOutputContextExternalDevice *)&v22 _init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("MRDAVOutputContextExternalDevice.serialQueue", v7);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("MRDAVOutputContextExternalDevice.workerQueue", v10);
    workerQueue = v6->_workerQueue;
    v6->_workerQueue = (OS_dispatch_queue *)v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("MRDAVOutputContextExternalDevice.notificationQueue", v13);
    notificationQueue = v6->_notificationQueue;
    v6->_notificationQueue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v6->_outputContext, a3);
    v6->_connectionState = 3;
    v16 = (MROutputContextController *)[objc_alloc((Class)MROutputContextController) initWithOutputContext:v5];
    outputContextController = v6->_outputContextController;
    v6->_outputContextController = v16;

    [(MRDAVOutputContextExternalDevice *)v6 registerForNotifications];
    v18 = +[MRAVClusterController sharedController];
    [v18 registerObserver:v6];

    v19 = MRLogCategoryConnections();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = [(MRDAVOutputContextExternalDevice *)v6 outputContext];
      *(_DWORD *)buf = 138543618;
      v24 = v6;
      __int16 v25 = 2114;
      v26 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Creating outputContextExternalDevice for outputContext %{public}@", buf, 0x16u);
    }
  }

  return v6;
}

- (void)dealloc
{
  v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  v6 = sub_10011F784;
  v7 = &unk_100415CC8;
  dispatch_queue_t v8 = self;
  msv_dispatch_sync_on_queue();
  v3.receiver = self;
  v3.super_class = (Class)MRDAVOutputContextExternalDevice;
  [(MRDAVOutputContextExternalDevice *)&v3 dealloc];
}

+ (void)initialize
{
  objc_super v3 = +[MRUserSettings currentSettings];
  unsigned int v4 = [v3 supportMultiplayerHost];

  if (v4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10011F8BC;
    v8[3] = &unk_1004171F0;
    v8[4] = a1;
    sub_10016A738(&_dispatch_main_q, v8);
    uint64_t v5 = +[NSNotificationCenter defaultCenter];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10011F8C4;
    v7[3] = &unk_10041D790;
    v7[4] = a1;
    id v6 = [v5 addObserverForName:kMRMediaRemotePlayerIsPlayingDidChangeNotification object:0 queue:0 usingBlock:v7];
  }
}

+ (void)prewarmSoon
{
  dispatch_time_t v3 = dispatch_time(0, 3000000000);
  unsigned int v4 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011FAAC;
  block[3] = &unk_1004171F0;
  block[4] = a1;
  dispatch_after(v3, v4, block);
}

+ (void)prewarm
{
  dispatch_time_t v3 = (void *)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
  unsigned int v4 = +[MRDMediaRemoteServer server];
  uint64_t v5 = [v4 nowPlayingServer];
  id v6 = [v5 localOriginClient];
  v7 = [v6 defaultSupportedCommandsDataForClient:v3];

  dispatch_queue_t v8 = (void *)MRMediaRemoteCopyLocalDeviceSystemPodcastApplicationDisplayID();
  v9 = +[MRDMediaRemoteServer server];
  v10 = [v9 nowPlayingServer];
  dispatch_queue_t v11 = [v10 localOriginClient];
  v12 = [v11 defaultSupportedCommandsDataForClient:v8];

  if (!v7 || !v12)
  {
    v13 = +[MRDAVOutputContextManager sharedManager];
    uint64_t v14 = [v13 outputContextForOutputDeviceUID:@"PREWARM-DUMMY-DEVICE"];

    if (!v14)
    {
      [a1 prewarmSoon];
      goto LABEL_12;
    }
    v34 = v8;
    id v15 = objc_alloc_init((Class)MRDeviceInfo);
    [v15 setDeviceUID:@"PREWARM-DUMMY-DEVICE"];
    [v15 setName:@"PREWARM-DUMMY-DEVICE"];
    v16 = +[MRDMediaRemoteServer server];
    [v16 nowPlayingServer];
    v33 = v3;
    v18 = id v17 = a1;
    [v18 localOriginClient];
    v19 = v7;
    v21 = v20 = (void *)v14;
    objc_super v22 = [v21 deviceInfo];
    v23 = [v22 identifier];
    [v15 setIdentifier:v23];

    v24 = v20;
    v7 = v19;

    a1 = v17;
    dispatch_time_t v3 = v33;

    __int16 v25 = [v24 contextID];
    [v15 setRoutingContextID:v25];

    id v26 = objc_alloc((Class)MROrigin);
    v27 = [v15 name];
    id v28 = [v26 initWithIdentifier:0 type:1 displayName:v27];

    v29 = +[MRDMediaRemoteServer server];
    v30 = [v29 nowPlayingServer];
    [v30 registerOrigin:v28 deviceInfo:v15];

    if (!v19) {
      [a1 prewarmApp:v33 origin:v28 deviceInfo:v15];
    }
    dispatch_queue_t v8 = v34;
    if (!v12)
    {
      v31 = +[MRUserSettings currentSettings];
      unsigned int v32 = [v31 prewarmPodcasts];

      if (v32) {
        [a1 prewarmApp:v34 origin:v28 deviceInfo:v15];
      }
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011FDFC;
  block[3] = &unk_1004171F0;
  block[4] = a1;
  if (qword_10047E280 != -1) {
    dispatch_once(&qword_10047E280, block);
  }
LABEL_12:
}

+ (void)prewarmApp:(id)a3 origin:(id)a4 deviceInfo:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  dispatch_queue_t v11 = +[NSDate now];
  v12 = +[NSUUID UUID];
  v13 = [v12 UUIDString];

  id v14 = [objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", @"prewarmApp", v13];
  id v15 = v14;
  if (v8) {
    [v14 appendFormat:@" for %@", v8];
  }
  v16 = _MRLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v28 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  id v17 = [objc_alloc((Class)MRClient) initWithBundleIdentifier:v8];
  id v18 = [objc_alloc((Class)MRPlayerPath) initWithOrigin:v10 client:v17 player:0];

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10012018C;
  v22[3] = &unk_10041D7B8;
  id v23 = v8;
  v24 = @"prewarmApp";
  id v25 = v13;
  id v26 = v11;
  id v19 = v11;
  id v20 = v13;
  id v21 = v8;
  [a1 _createPlayerAndWaitForCanBeNowPlaying:v18 deviceInfo:v9 completion:v22];
}

- (id)dictionaryRepresentation
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = sub_100120624;
  id v8 = sub_100120634;
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [(MRAVConcreteOutputContext *)self->_outputContext uniqueIdentifier];
  uint64_t v5 = [(MRAVOutputDevice *)self->_designatedGroupLeader uid];
  uint64_t v6 = [(MROrigin *)self->_origin displayName];
  signed int v7 = [(MROrigin *)self->_origin identifier];
  if (self->_originForwarder) {
    CFStringRef v8 = @"YES";
  }
  else {
    CFStringRef v8 = @"NO";
  }
  id v9 = +[NSString stringWithFormat:@"<%@: %p id=%@ leader=%@ origin=%@-%ld originFwd=%@>", v3, self, v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (NSString)debugDescription
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = MRCreateIndentedDebugDescriptionFromObject();
  id v5 = [(MROrigin *)self->_origin identifier];
  uint64_t v6 = [(MROrigin *)self->_origin displayName];
  signed int v7 = MRCreateIndentedDebugDescriptionFromObject();
  CFStringRef v8 = MRCreateIndentedDebugDescriptionFromObject();
  id v9 = MRCreateIndentedDebugDescriptionFromObject();
  id v10 = MRCreateIndentedDebugDescriptionFromObject();
  dispatch_queue_t v11 = +[NSString stringWithFormat:@"<%@: %p {\n    designatedGroupLeader = %@\n    origin = %d:%@\n    originForwarder = %@\n    disconnectionError = %@    outputContextController = %@\n    outputContext = %@\n}>", v3, self, v4, v5, v6, v7, v8, v9, v10];

  return (NSString *)v11;
}

- (id)name
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  signed int v7 = sub_100120624;
  CFStringRef v8 = sub_100120634;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

- (id)hostName
{
  return 0;
}

- (int64_t)port
{
  return 0;
}

- (BOOL)supportsIdleDisconnection
{
  return 0;
}

- (id)customOrigin
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  signed int v7 = sub_100120624;
  CFStringRef v8 = sub_100120634;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

- (id)deviceInfo
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  signed int v7 = sub_100120624;
  CFStringRef v8 = sub_100120634;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

- (unsigned)connectionState
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  int v7 = 0;
  msv_dispatch_sync_on_queue();
  unsigned int v2 = *((_DWORD *)v5 + 6);
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (void)setConnectionState:(unsigned int)a3
{
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  char v16 = 0;
  CFStringRef v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_100120FB8;
  dispatch_queue_t v11 = &unk_100417748;
  v12 = self;
  v13 = v15;
  unsigned int v14 = a3;
  msv_dispatch_sync_on_queue();
  notificationQueue = self->_notificationQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100120FF0;
  v6[3] = &unk_100417748;
  unsigned int v7 = a3;
  v6[4] = self;
  v6[5] = v15;
  dispatch_async((dispatch_queue_t)notificationQueue, v6);
  _Block_object_dispose(v15, 8);
}

- (id)uid
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  unsigned int v7 = sub_100120624;
  CFStringRef v8 = sub_100120634;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

- (BOOL)supportsDesignatedGroupLeaderUpdates
{
  return 1;
}

- (void)updateDesignatedGroupLeader:(id)a3
{
  if (self->_disconnectionError)
  {
    uint64_t v4 = MRLogCategoryConnections();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      uint64_t v6 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Ignoring attempt to updateDesignatedGroupLeader on previously disconnected device: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  else
  {
    [(MRDAVOutputContextExternalDevice *)self setDesignatedGroupLeader:a3];
  }
}

- (BOOL)disconnectWhenUndiscoverable
{
  return 1;
}

- (void)setDeviceInfo:(id)a3
{
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = sub_100120624;
  v34 = sub_100120634;
  id v35 = 0;
  id v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  id v25 = sub_1001215F8;
  id v26 = &unk_100416730;
  v29 = &v30;
  v27 = self;
  id v4 = a3;
  id v28 = v4;
  msv_dispatch_sync_on_queue();
  int v5 = [v4 routingContextID];

  if (v5)
  {
    id v6 = [(MRDAVOutputContextExternalDevice *)self origin];
    if (v6)
    {
      unsigned int v7 = +[MRDMediaRemoteServer server];
      CFStringRef v8 = [v7 nowPlayingServer];
      [v8 updateDeviceInfo:v4 origin:v6];
    }
    id v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    id v19 = sub_100121650;
    id v20 = &unk_1004158D8;
    id v21 = self;
    id v22 = v4;
    msv_dispatch_sync_on_queue();
    notificationQueue = self->_notificationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100121744;
    block[3] = &unk_100416730;
    char v16 = &v30;
    id v14 = v22;
    id v15 = self;
    dispatch_async((dispatch_queue_t)notificationQueue, block);
  }
  else
  {
    id v10 = objc_alloc((Class)NSError);
    dispatch_queue_t v11 = [(id)v31[5] routingContextID];
    v12 = [v4 routingContextID];
    id v6 = [v10 initWithMRError:32, @"Invalid routingContextID detected. From %@ to %@", v11, v12 format];

    [(MRDAVOutputContextExternalDevice *)self disconnect:v6];
  }

  _Block_object_dispose(&v30, 8);
}

- (void)setOrigin:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  p_origin = &self->_origin;
  if (self->_origin)
  {
    -[MRDAVOutputContextExternalDevice _onQueue_destroyPlayerPathsForOrigin:](self, "_onQueue_destroyPlayerPathsForOrigin:");
    [(MRDAVOutputContextExternalDevice *)self _onQueue_clearLocalOriginForwaderWithReason:@"Clear Origin"];
    unsigned int v7 = +[MRDMediaRemoteServer server];
    CFStringRef v8 = [v7 nowPlayingServer];
    [v8 unregisterOrigin:*p_origin];

    airplayPublisher = self->_airplayPublisher;
    self->_airplayPublisher = 0;
  }
  objc_storeStrong((id *)&self->_origin, a3);
  if (v5)
  {
    objc_initWeak(location, self);
    v33[1] = _NSConcreteStackBlock;
    v33[2] = (id)3221225472;
    v33[3] = sub_100121D74;
    v33[4] = &unk_10041D7E0;
    objc_copyWeak(&v34, location);
    v33[5] = self;
    MRMediaRemoteSetCommandHandler();
    v32[1] = _NSConcreteStackBlock;
    v32[2] = (id)3221225472;
    v32[3] = sub_100121EB8;
    v32[4] = &unk_10041D808;
    objc_copyWeak(v33, location);
    v32[5] = self;
    MRMediaRemotePlaybackQueueDataSourceSetRequestCallback();
    v31[1] = _NSConcreteStackBlock;
    v31[2] = (id)3221225472;
    v31[3] = sub_100121F80;
    v31[4] = &unk_10041D808;
    objc_copyWeak(v32, location);
    v31[5] = self;
    MRMediaRemotePlaybackSessionSetRequestCallbackForOrigin();
    id v10 = +[MRNowPlayingOriginClientManager sharedManager];
    dispatch_queue_t v11 = [v10 originClientForOrigin:*p_origin];

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10012209C;
    v30[3] = &unk_10041D830;
    objc_copyWeak(v31, location);
    v30[4] = self;
    [v11 setPlaybackSessionMigrateRequestCallback:v30];
    v28[1] = _NSConcreteStackBlock;
    v28[2] = (id)3221225472;
    v28[3] = sub_100122190;
    v28[4] = &unk_10041D858;
    objc_copyWeak(&v29, location);
    v28[5] = self;
    MRMediaRemotePlaybackSessionSetMigrateBeginCallbackForOrigin();
    v27[1] = _NSConcreteStackBlock;
    v27[2] = (id)3221225472;
    v27[3] = sub_1001222BC;
    v27[4] = &unk_10041D880;
    objc_copyWeak(v28, location);
    v27[5] = self;
    MRMediaRemotePlaybackSessionSetMigrateEndCallbackForOrigin();
    v12 = +[MRDMediaRemoteServer server];
    v13 = [v12 nowPlayingServer];
    id v14 = [v13 originClientForOrigin:v5];

    if (_os_feature_enabled_impl())
    {
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1001223F0;
      v26[3] = &unk_10041D8D0;
      objc_copyWeak(v27, location);
      v26[4] = self;
      objc_msgSend(v14, "registerCreateNewApplicationConnectionCallback:", v26, v31, v32, v33, &v34);
      objc_destroyWeak(v27);
    }
    else
    {
      objc_msgSend(v14, "registerCreateNewApplicationConnectionCallback:", &stru_10041D8F0, v31, v32, v33, &v34);
    }
    id v15 = +[MRSharedSettings currentSettings];
    unsigned int v16 = [v15 supportAirPlayLeaderInfoSync];

    if (v16)
    {
      id v17 = [MRDAirPlayLeaderInfoPublisher alloc];
      uint64_t v18 = *p_origin;
      id v19 = [(MRDAVOutputContextExternalDevice *)self outputContext];
      id v20 = [(MRDAirPlayLeaderInfoPublisher *)v17 initWithOrigin:v18 outputContext:v19];
      id v21 = self->_airplayPublisher;
      self->_airplayPublisher = v20;
    }
    if ([(MRAVOutputDevice *)self->_designatedGroupLeader isLocalDevice]) {
      [(MRDAVOutputContextExternalDevice *)self _onQueue_forwardOriginToLocalOrigin:*p_origin];
    }

    objc_destroyWeak(v28);
    objc_destroyWeak(&v29);
    objc_destroyWeak(v22);

    objc_destroyWeak(v23);
    objc_destroyWeak(v24);
    objc_destroyWeak(v25);
    objc_destroyWeak(location);
  }
}

- (MRAVOutputDevice)designatedGroupLeader
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  unsigned int v7 = sub_100120624;
  CFStringRef v8 = sub_100120634;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MRAVOutputDevice *)v2;
}

- (void)setDesignatedGroupLeader:(id)a3
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  dispatch_queue_t v11 = sub_100120624;
  v12 = sub_100120634;
  id v13 = 0;
  id v4 = a3;
  unsigned int v7 = v4;
  msv_dispatch_sync_on_queue();
  if (*((unsigned char *)v15 + 24) && [v4 isLocalDevice])
  {
    uint64_t v18 = MRExternalDeviceConnectionReasonUserInfoKey;
    CFStringRef v19 = @"Automatic NativeEndpoint Connection";
    id v5 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    [(MRDAVOutputContextExternalDevice *)self connectWithOptions:0 userInfo:v5];
LABEL_6:

    goto LABEL_7;
  }
  if (!v4)
  {
    id v6 = objc_alloc((Class)NSError);
    id v5 = [v6 initWithMRError:32, @"OutputContextExternalDevice does not have a designatedGroupLeader. (PreviousGroupLeader=%@)", v9[5], _NSConcreteStackBlock, 3221225472, sub_100122C0C, &unk_10041BAB0, 0, self, &v14, &v8 format];
    [(MRDAVOutputContextExternalDevice *)self disconnect:v5];
    goto LABEL_6;
  }
LABEL_7:

  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v14, 8);
}

- (void)_handleRemoteCommand:(unsigned int)a3 withOptions:(id)a4 playerPath:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = sub_100120624;
  v50 = sub_100120634;
  uint64_t v30 = v9;
  id v51 = [v9 copy];
  uint64_t v12 = [(id)v47[5] objectForKeyedSubscript:kMRMediaRemoteOptionCommandID];
  id v13 = (void *)v12;
  uint64_t v14 = @"handleRemoteCommand";
  if (v12) {
    uint64_t v14 = (__CFString *)v12;
  }
  id v15 = v14;

  uint64_t v16 = [v10 client];
  char v17 = [v16 bundleIdentifier];
  uint64_t v18 = (void *)MRMediaRemoteCopyLocalDeviceAirPlayReceiverBundleID();
  unsigned int v19 = [v17 isEqualToString:v18];

  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100123200;
  v40[3] = &unk_10041D940;
  v43 = &v46;
  v40[4] = self;
  id v20 = v10;
  id v41 = v20;
  unsigned int v44 = a3;
  char v45 = v19;
  id v21 = v11;
  id v42 = v21;
  id v22 = objc_retainBlock(v40);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10012374C;
  v35[3] = &unk_10041A628;
  unsigned int v39 = a3;
  id v23 = v20;
  id v36 = v23;
  uint64_t v24 = v15;
  v37 = v24;
  id v25 = v22;
  id v38 = v25;
  id v26 = objc_retainBlock(v35);
  v27 = +[MRDMediaRemoteServer server];
  id v28 = [v27 routingServer];
  unsigned int v29 = [v28 airplayActive];

  if (a3 == 132 || (v19 & v29) == 1 && a3 != 122 && a3 != 133)
  {
    ((void (*)(void *))v26[2])(v26);
  }
  else
  {
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1001239EC;
    v32[3] = &unk_100419780;
    id v33 = v21;
    id v34 = v26;
    [(MRDAVOutputContextExternalDevice *)self commitOutputDeviceToContextIfNeededWithReason:v24 completion:v32];
  }
  _Block_object_dispose(&v46, 8);
}

+ (void)_sendCommandPreview:(unsigned int)a3 options:(id)a4 playerPath:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = +[MRDMediaRemoteServer server];
  id v10 = [v9 nowPlayingServer];
  id v11 = [v10 localOriginClient];
  uint64_t v12 = [v11 overrideClient];

  if (v12)
  {
    id v13 = objc_alloc_init((Class)NSMutableDictionary);
    MRAddPlayerPathToUserInfo();
    uint64_t v14 = +[NSNumber numberWithUnsignedInt:v6];
    [v13 setObject:v14 forKeyedSubscript:kMRMediaRemoteOptionCommandType];

    uint64_t v15 = kMRMediaRemoteOptionCommandID;
    uint64_t v16 = [v7 objectForKeyedSubscript:kMRMediaRemoteOptionCommandID];
    [v13 setObject:v16 forKeyedSubscript:v15];

    uint64_t v17 = kMRMediaRemoteOptionSenderID;
    uint64_t v18 = [v7 objectForKeyedSubscript:kMRMediaRemoteOptionSenderID];
    [v13 setObject:v18 forKeyedSubscript:v17];

    uint64_t v19 = kMRMediaRemoteOptionRemoteControlInterfaceIdentifier;
    id v20 = [v7 objectForKeyedSubscript:kMRMediaRemoteOptionRemoteControlInterfaceIdentifier];
    [v13 setObject:v20 forKeyedSubscript:v19];

    id v21 = +[MRDMediaRemoteServer server];
    uint64_t v22 = _MRMediaRemoteWillSendCommandToPlayerNotification;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100123CA8;
    v23[3] = &unk_100416020;
    id v24 = v12;
    [v21 postClientNotificationNamed:v22 userInfo:v13 predicate:v23];
  }
}

- (id)_createResolvedPlayerPathFromPlayerPath:(id)a3
{
  id v3 = a3;
  id v4 = +[MRUserSettings currentSettings];
  unsigned __int8 v5 = [v4 supportMultiplayerHost];

  id v6 = v3;
  if ((v5 & 1) == 0)
  {
    id v7 = objc_alloc((Class)MRPlayerPath);
    id v8 = +[MROrigin localOrigin];
    id v9 = [v3 client];
    id v10 = [v3 player];
    id v6 = [v7 initWithOrigin:v8 client:v9 player:v10];
  }
  id v11 = [v3 client];

  if (!v11)
  {
    id v12 = objc_alloc((Class)MRPlayerPath);
    id v13 = [v6 origin];
    id v14 = objc_alloc((Class)MRClient);
    uint64_t v15 = (void *)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
    id v16 = [v14 initWithBundleIdentifier:v15];
    id v17 = [v12 initWithOrigin:v13 client:v16 player:0];

    id v6 = v17;
  }
  uint64_t v18 = +[MRUserSettings currentSettings];
  unsigned int v19 = [v18 homepodDemoMode];

  if (v19)
  {
    id v20 = objc_alloc((Class)MRPlayerPath);
    id v21 = +[MROrigin localOrigin];
    uint64_t v22 = [v6 client];
    id v23 = [v6 player];
    id v24 = [v20 initWithOrigin:v21 client:v22 player:v23];

    id v6 = v24;
  }
  id v25 = +[MRDMediaRemoteServer server];
  id v26 = [v25 deviceInfo];

  LOBYTE(v25) = [v26 isAirPlayActive];
  v27 = [v3 client];
  id v28 = [v27 bundleIdentifier];
  unsigned int v29 = (void *)MRMediaRemoteCopyLocalDeviceAirPlayReceiverBundleID();
  unsigned __int8 v30 = [v28 isEqualToString:v29];

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100123FC8;
  v34[3] = &unk_10041D988;
  char v35 = (char)v25;
  unsigned __int8 v36 = v30;
  if (sub_100123FC8((uint64_t)v34))
  {
    v31 = +[MROrigin localOrigin];
    uint64_t v32 = [v6 playerPathByRedirectingToOrigin:v31];

    id v6 = (id)v32;
  }

  return v6;
}

- (void)_createPlayerAndWaitForConnection:(id)a3 command:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_opt_class();
  id v12 = [(MRDAVOutputContextExternalDevice *)self deviceInfo];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10012417C;
  v14[3] = &unk_10041D9D8;
  v14[4] = self;
  id v15 = v8;
  id v13 = v8;
  [v11 _createPlayerAndWaitForConnection:v10 command:v9 deviceInfo:v12 completion:v14];
}

+ (void)_createPlayerAndWaitForConnection:(id)a3 command:(id)a4 deviceInfo:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v53 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = +[NSDate now];
  id v14 = +[NSUUID UUID];
  id v15 = [v14 UUIDString];

  id v16 = [objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", @"createPlayerAndWaitForConnection", v15];
  id v17 = v16;
  if (v10) {
    [v16 appendFormat:@" for %@", v10];
  }
  uint64_t v18 = _MRLogForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v73 = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  unsigned int v19 = _MRLogForCategory();
  id v20 = (char *)[v15 hash];
  if ((unint64_t)(v20 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v21 = (os_signpost_id_t)v20;
    if (os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_BEGIN, v21, "createPlayerAndWaitForConnection", "", buf, 2u);
    }
  }

  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472;
  v65[2] = sub_10012493C;
  v65[3] = &unk_10041DA00;
  id v22 = v15;
  id v66 = v22;
  v67 = @"createPlayerAndWaitForConnection";
  id v52 = v13;
  id v68 = v52;
  id v51 = v12;
  id v69 = v51;
  id v23 = objc_retainBlock(v65);
  id v24 = objc_alloc((Class)MRBlockGuard);
  id v50 = a1;
  id v25 = objc_opt_class();
  id v26 = [v11 WHAIdentifier];
  v54 = v11;
  v27 = [v11 name];
  id v28 = [v25 _resolveReason:@"createPlayerAndWaitForConnection" uid:v26 name:v27 requestID:v22];
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = sub_100124E44;
  v63[3] = &unk_100415FA8;
  unsigned int v29 = v23;
  id v64 = v29;
  id v30 = [v24 initWithTimeout:v28 reason:v63 handler:8.0];

  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_100124E5C;
  v60[3] = &unk_1004196B8;
  id v31 = v30;
  id v61 = v31;
  uint64_t v32 = v29;
  id v62 = v32;
  id v33 = objc_retainBlock(v60);
  id v34 = +[MRDMediaRemoteServer server];
  char v35 = [v34 nowPlayingServer];
  unsigned __int8 v36 = [v35 queryExistingPlayerPath:v10];

  v37 = [v10 client];
  id v38 = [v37 bundleIdentifier];
  unsigned int v39 = (void *)MRMediaRemoteCopyLocalDeviceAirPlayReceiverBundleID();
  unsigned int v40 = [v38 isEqualToString:v39];

  if (v40)
  {
    ((void (*)(void *, id, void))v33[2])(v33, v10, 0);
    id v41 = v53;
    goto LABEL_19;
  }
  id v42 = [v36 playerClient];

  id v41 = v53;
  if (v42)
  {
    id v43 = [v36 playerClient];
    unsigned int v44 = [v43 playerPath];
    ((void (*)(void *, void *, void))v33[2])(v33, v44, 0);

LABEL_12:
    goto LABEL_19;
  }
  char v45 = [v10 client];
  uint64_t v46 = [v45 bundleIdentifier];

  if (!v46)
  {
    id v43 = [objc_alloc((Class)NSError) initWithMRError:35, @"Could not find application in playerPath %@", v10 format];
    ((void (*)(void *, void, id))v33[2])(v33, 0, v43);
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v70 = kMRMediaRemoteOptionCommandType;
    id v71 = v53;
    v47 = +[NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
  }
  else
  {
    v47 = 0;
  }
  uint64_t v48 = [v10 client];
  v49 = [v48 bundleIdentifier];
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_100124ED4;
  v55[3] = &unk_10041DA28;
  v58 = v33;
  id v56 = v10;
  id v59 = v50;
  id v57 = v54;
  sub_1001688A8(v49, 0, v47, v55, 7.0);

LABEL_19:
}

- (void)_createPlayerAndWaitForCanBeNowPlaying:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_class();
  id v9 = [(MRDAVOutputContextExternalDevice *)self deviceInfo];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100125098;
  v11[3] = &unk_10041D9D8;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v8 _createPlayerAndWaitForCanBeNowPlaying:v7 deviceInfo:v9 completion:v11];
}

+ (void)_createPlayerAndWaitForCanBeNowPlaying:(id)a3 deviceInfo:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[NSDate now];
  id v11 = +[NSUUID UUID];
  id v12 = [v11 UUIDString];

  id v13 = [objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", @"createPlayerAndWaitForCanBeNowPlaying", v12];
  id v14 = v13;
  if (v7) {
    [v13 appendFormat:@" for %@", v7];
  }
  id v15 = _MRLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  id v16 = _MRLogForCategory();
  id v17 = (char *)[v12 hash];
  if ((unint64_t)(v17 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v17, "createPlayerAndWaitForCanBeNowPlaying", "", (uint8_t *)&buf, 2u);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v53 = 0x3032000000;
  v54 = sub_100120624;
  v55 = sub_100120634;
  id v56 = 0;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_1001256BC;
  v46[3] = &unk_10041DA50;
  id v18 = v12;
  id v47 = v18;
  uint64_t v48 = @"createPlayerAndWaitForCanBeNowPlaying";
  id v35 = v10;
  id v49 = v35;
  id v34 = v9;
  id v50 = v34;
  p_long long buf = &buf;
  unsigned int v19 = objc_retainBlock(v46);
  id v20 = v7;
  id v21 = objc_alloc((Class)MRBlockGuard);
  id v22 = objc_opt_class();
  id v23 = [v8 WHAIdentifier];
  id v24 = [v8 name];
  id v25 = [v22 _resolveReason:@"createPlayerAndWaitForCanBeNowPlaying" uid:v23 name:v24 requestID:v18];
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100125B9C;
  v44[3] = &unk_100415FA8;
  id v26 = v19;
  id v45 = v26;
  id v27 = [v21 initWithTimeout:v25 reason:v44 handler:8.0];

  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100125BB8;
  v41[3] = &unk_10041DA78;
  id v28 = v27;
  id v42 = v28;
  unsigned int v29 = v26;
  id v43 = v29;
  id v30 = objc_retainBlock(v41);
  id v31 = objc_opt_class();
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100125C4C;
  v36[3] = &unk_10041DAC8;
  unsigned int v40 = &buf;
  uint64_t v32 = v30;
  id v39 = v32;
  v37 = @"createPlayerAndWaitForCanBeNowPlaying";
  id v33 = v18;
  id v38 = v33;
  [v31 _createPlayerAndWaitForConnection:v20 command:0 deviceInfo:v8 completion:v36];

  _Block_object_dispose(&buf, 8);
}

+ (void)_createPlayerForClient:(id)a3 playerPath:(id)a4 deviceInfo:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = +[NSDate now];
  id v14 = +[NSUUID UUID];
  id v15 = [v14 UUIDString];

  id v16 = [objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", @"createPlayer", v15];
  id v17 = v16;
  if (v9) {
    [v16 appendFormat:@" for %@", v9];
  }
  id v18 = _MRLogForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v38 = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  unsigned int v19 = _MRLogForCategory();
  id v20 = (char *)[v15 hash];
  if ((unint64_t)(v20 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v21 = (os_signpost_id_t)v20;
    if (os_signpost_enabled(v19))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_BEGIN, v21, "CreatePlayer", "", buf, 2u);
    }
  }

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1001262DC;
  v32[3] = &unk_10041DA00;
  id v33 = v15;
  id v34 = v9;
  id v35 = v13;
  id v36 = v10;
  id v22 = v10;
  id v23 = v13;
  id v24 = v9;
  id v25 = v15;
  id v26 = objc_retainBlock(v32);
  [v12 takeAssertion:1 forReason:@"CreatePlayer" duration:30.0];
  id v27 = MRCreateXPCMessage();
  MRAddDeviceInfoToXPCMessage();

  MRAddPlayerPathToXPCMessage();
  id v28 = [v12 connection];

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100126748;
  v30[3] = &unk_10041DAF0;
  id v31 = v26;
  unsigned int v29 = v26;
  [v28 sendMessage:v27 queue:&_dispatch_main_q reply:v30];
}

- (void)sendMessageWithType:(unint64_t)a3 playerPath:(id)a4 timeout:(double)a5 reason:(id)a6 factory:(id)a7 completion:(id)a8
{
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001268F0;
  v18[3] = &unk_10041DB18;
  id v19 = a7;
  unint64_t v20 = a3;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100126984;
  v16[3] = &unk_10041DAF0;
  id v17 = a8;
  id v14 = v17;
  id v15 = v19;
  [(MRDAVOutputContextExternalDevice *)self _sendMessageForPlayerPath:a4 timeout:a6 reason:v18 factory:v16 completion:a5];
}

- (void)_sendMessageForPlayerPath:(id)a3 timeout:(double)a4 reason:(id)a5 factory:(id)a6 completion:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = a3;
  id v16 = objc_alloc((Class)MRBlockGuard);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100126C28;
  v31[3] = &unk_100415FA8;
  id v17 = v14;
  id v32 = v17;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100126C40;
  v28[3] = &unk_10041DB40;
  id v29 = [v16 initWithTimeout:v12 reason:v31 handler:a4];
  id v30 = v17;
  id v18 = v17;
  id v19 = v29;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100126CB8;
  v23[3] = &unk_10041DB68;
  id v24 = v12;
  id v25 = self;
  id v26 = v13;
  id v27 = objc_retainBlock(v28);
  unint64_t v20 = v27;
  id v21 = v12;
  id v22 = v13;
  [(MRDAVOutputContextExternalDevice *)self _createPlayerAndWaitForCanBeNowPlaying:v15 completion:v23];
}

- (void)_handlePlaybackQueueRequest:(id)a3 forPlayerPath:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100127084;
  v28[3] = &unk_10041AA18;
  id v10 = a5;
  id v29 = v10;
  id v11 = objc_retainBlock(v28);
  id v12 = objc_alloc((Class)MRBlockGuard);
  id v13 = [(MRDAVOutputContextExternalDevice *)self _resolveReason:@"_handlePlaybackQueueRequest"];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100127094;
  v26[3] = &unk_100415FA8;
  id v14 = v11;
  id v27 = v14;
  id v15 = [v12 initWithTimeout:v13 reason:v26 handler:7.0];

  id v16 = +[MRDMediaRemoteServer server];
  id v17 = [v9 client];
  id v18 = objc_msgSend(v16, "clientForPID:", objc_msgSend(v17, "processIdentifier"));

  if (v18)
  {
    MRCreateXPCMessage();
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    MRAddPlayerPathToXPCMessage();
    MRAddPlaybackQueueRequestToXPCMessage();
    unint64_t v20 = [v8 description];
    [v18 takeAssertion:2 forReason:v20 duration:30.0];

    id v21 = [v18 connection];
    workerQueue = self->_workerQueue;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1001270AC;
    v23[3] = &unk_10041DB40;
    id v24 = v15;
    id v25 = v14;
    [v21 sendMessage:v19 queue:workerQueue reply:v23];

LABEL_5:
    goto LABEL_6;
  }
  if ([v15 disarm])
  {
    id v19 = [objc_alloc((Class)NSError) initWithMRError:4, @"Could not find xpcClient for playerPath %@", v9 format];
    ((void (*)(void *, void, id))v14[2])(v14, 0, v19);
    goto LABEL_5;
  }
LABEL_6:
}

- (void)_handlePlaybackSessionRequest:(id)a3 forPlayerPath:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MRDAVOutputContextExternalDevice *)self _resolveReason:@"_handlePlaybackSessionRequest"];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001272A4;
  v17[3] = &unk_10041DB90;
  id v18 = v8;
  id v19 = v9;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001272E8;
  void v15[3] = &unk_10041DBB8;
  id v16 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(MRDAVOutputContextExternalDevice *)self sendMessageWithType:0x20000000000002FLL playerPath:v13 timeout:v11 reason:v17 factory:v15 completion:7.0];
}

- (void)_handlePlaybackSessionMigrateRequest:(id)a3 request:(id)a4 forPlayerPath:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100127490;
  v17[3] = &unk_10041DC08;
  id v21 = v10;
  id v22 = a6;
  id v18 = v11;
  id v19 = v12;
  unint64_t v20 = self;
  id v13 = v10;
  id v14 = v12;
  id v15 = v11;
  id v16 = v22;
  [(MRDAVOutputContextExternalDevice *)self commitOutputDeviceToContextIfNeededWithReason:@"_handlePlaybackSessionMigrateRequest" completion:v17];
}

- (void)_handlePlaybackSessionMigrateBeginRequest:(id)a3 forPlayerPath:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [(MRDAVOutputContextExternalDevice *)self _resolveReason:@"_handlePlaybackSessionMigrateBeginRequest"];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10012797C;
  v16[3] = &unk_10041DC30;
  id v17 = v8;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001279E4;
  v14[3] = &unk_10041DBB8;
  id v15 = v9;
  id v12 = v9;
  id v13 = v8;
  [(MRDAVOutputContextExternalDevice *)self sendMessageWithType:0x400000000000008 playerPath:v10 timeout:v11 reason:v16 factory:v14 completion:7.0];
}

- (void)_handlePlaybackSessionMigrateEndRequest:(id)a3 error:(id)a4 forPlayerPath:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = [(MRDAVOutputContextExternalDevice *)self _resolveReason:@"_handlePlaybackSessionMigrateEndRequest"];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100127B6C;
  v20[3] = &unk_10041DB90;
  id v21 = v10;
  id v22 = v11;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100127BD4;
  v18[3] = &unk_10041DBB8;
  id v19 = v12;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  [(MRDAVOutputContextExternalDevice *)self sendMessageWithType:0x400000000000009 playerPath:v13 timeout:v14 reason:v20 factory:v18 completion:7.0];
}

- (void)setVolumeChangedCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100127CD0;
  block[3] = &unk_10041A008;
  id v13 = v7;
  id v14 = v6;
  void block[4] = self;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
}

- (void)setVolumeControlCapabilitiesCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100127E10;
  block[3] = &unk_10041A008;
  id v13 = v7;
  id v14 = v6;
  void block[4] = self;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
}

- (void)setVolumeMutedChangedCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100127F50;
  block[3] = &unk_10041A008;
  id v13 = v7;
  id v14 = v6;
  void block[4] = self;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
}

- (void)setOutputDevicesUpdatedCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100128090;
  block[3] = &unk_10041A008;
  id v13 = v7;
  id v14 = v6;
  void block[4] = self;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
}

- (void)setOutputDevicesRemovedCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001281D0;
  block[3] = &unk_10041A008;
  id v13 = v7;
  id v14 = v6;
  void block[4] = self;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
}

- (void)setConnectionStateCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100128310;
  block[3] = &unk_10041A008;
  id v13 = v7;
  id v14 = v6;
  void block[4] = self;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
}

- (void)setDeviceInfoChangedCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100128450;
  block[3] = &unk_10041A008;
  id v13 = v7;
  id v14 = v6;
  void block[4] = self;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
}

- (void)outputDeviceVolumeControlCapabilities:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a5;
  outputContextController = self->_outputContextController;
  id v17 = 0;
  id v10 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001285A8;
  v13[3] = &unk_1004162A8;
  unsigned int v16 = [(MROutputContextController *)outputContextController volumeControlCapabilitiesForOutputDeviceUID:a3 error:&v17];
  id v14 = v17;
  id v15 = v8;
  id v11 = v14;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)outputDeviceVolume:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a5;
  outputContextController = self->_outputContextController;
  id v18 = 0;
  id v10 = a4;
  [(MROutputContextController *)outputContextController volumeForOutputDeviceUID:a3 error:&v18];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001286C0;
  v14[3] = &unk_1004162A8;
  int v17 = v11;
  id v15 = v18;
  id v16 = v8;
  id v12 = v15;
  id v13 = v8;
  dispatch_async(v10, v14);
}

- (void)setOutputDeviceVolume:(float)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = +[NSDate now];
  int v17 = [(MRDAVOutputContextExternalDevice *)self designatedGroupLeader];
  id v18 = objc_alloc((Class)NSString);
  uint64_t v19 = objc_opt_class();
  id v38 = v17;
  unint64_t v20 = [v17 debugName];
  id v21 = [v18 initWithFormat:@"%@:%p-%@>", v19, self, v20];

  id v22 = objc_alloc((Class)NSMutableString);
  id v23 = [v13 requestID];
  id v24 = [v22 initWithFormat:@"%@<%@>", @"OutputContextExtenalDevice.setOutputDeviceVolume", v23];

  if (v21) {
    [v24 appendFormat:@" for %@", v21];
  }
  id v25 = _MRLogForCategory();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v56 = v24;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_100128AE4;
  v47[3] = &unk_10041DC58;
  float v54 = a3;
  id v37 = v21;
  id v48 = v37;
  id v49 = @"OutputContextExtenalDevice.setOutputDeviceVolume";
  id v26 = v13;
  id v50 = v26;
  id v27 = v16;
  id v51 = v27;
  id v28 = v14;
  id v52 = v28;
  id v29 = v15;
  id v53 = v29;
  id v30 = objc_retainBlock(v47);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100128F54;
  v42[3] = &unk_10041ACF8;
  v42[4] = self;
  float v46 = a3;
  id v31 = v12;
  id v43 = v31;
  id v32 = v26;
  id v44 = v32;
  id v33 = v30;
  id v45 = v33;
  id v34 = objc_retainBlock(v42);
  id v35 = [(MRAVConcreteOutputContext *)self->_outputContext outputDeviceUIDs];
  id v36 = [v35 count];

  if (v36 || ![(MRAVOutputDevice *)self->_designatedGroupLeader isLocalDevice])
  {
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100128FC8;
    v39[3] = &unk_100419780;
    unsigned int v40 = v33;
    id v41 = v34;
    [(MRDAVOutputContextExternalDevice *)self commitOutputDeviceToContextIfNeededWithReason:@"setOutputDeviceVolume" completion:v39];
  }
  else
  {
    ((void (*)(void *))v34[2])(v34);
  }
}

- (void)adjustOutputDeviceVolume:(int64_t)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v39 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = +[NSDate now];
  id v16 = [(MRDAVOutputContextExternalDevice *)self designatedGroupLeader];
  id v17 = objc_alloc((Class)NSString);
  uint64_t v18 = objc_opt_class();
  id v41 = v16;
  uint64_t v19 = [v16 debugName];
  id v20 = [v17 initWithFormat:@"%@:%p-%@>", v18, self, v19];

  id v21 = objc_alloc((Class)NSMutableString);
  id v22 = [v12 requestID];
  id v23 = [v21 initWithFormat:@"%@<%@>", @"OutputContextExtenalDevice.adjustOutputDeviceVolume", v22];

  if (v20) {
    [v23 appendFormat:@" for %@", v20];
  }
  id v24 = _MRLogForCategory();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v59 = v23;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_100129448;
  v50[3] = &unk_100419A80;
  int64_t v57 = a3;
  id v40 = v20;
  id v51 = v40;
  id v52 = @"OutputContextExtenalDevice.adjustOutputDeviceVolume";
  id v25 = v12;
  id v53 = v25;
  id v26 = v15;
  id v54 = v26;
  id v27 = v13;
  id v55 = v27;
  id v28 = v14;
  id v56 = v28;
  id v29 = objc_retainBlock(v50);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_1001298B0;
  v45[3] = &unk_10041DC80;
  v45[4] = self;
  int64_t v49 = a3;
  id v30 = v39;
  id v46 = v30;
  id v31 = v25;
  id v47 = v31;
  id v32 = v29;
  id v48 = v32;
  id v33 = objc_retainBlock(v45);
  id v34 = [(MRAVConcreteOutputContext *)self->_outputContext outputDeviceUIDs];
  id v35 = [v34 count];

  if (v35 || ![(MRAVOutputDevice *)self->_designatedGroupLeader isLocalDevice])
  {
    id v36 = objc_alloc((Class)NSString);
    id v37 = [v31 requestID];
    id v38 = [v36 initWithFormat:@"%@<%@>", @"OutputContextExtenalDevice.adjustOutputDeviceVolume", v37];

    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_100129924;
    v42[3] = &unk_100419780;
    id v43 = v32;
    id v44 = v33;
    [(MRDAVOutputContextExternalDevice *)self commitOutputDeviceToContextIfNeededWithReason:v38 completion:v42];
  }
  else
  {
    ((void (*)(void *))v33[2])(v33);
  }
}

- (void)muteOutputDeviceVolume:(BOOL)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v39 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = +[NSDate now];
  id v16 = [(MRDAVOutputContextExternalDevice *)self designatedGroupLeader];
  id v17 = objc_alloc((Class)NSString);
  uint64_t v18 = objc_opt_class();
  id v41 = v16;
  uint64_t v19 = [v16 debugName];
  id v20 = [v17 initWithFormat:@"%@:%p-%@>", v18, self, v19];

  id v21 = objc_alloc((Class)NSMutableString);
  id v22 = [v12 requestID];
  id v23 = [v21 initWithFormat:@"%@<%@>", @"OutputContextExtenalDevice.muteOutputDeviceVolume", v22];

  if (v20) {
    [v23 appendFormat:@" for %@", v20];
  }
  id v24 = _MRLogForCategory();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v59 = v23;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_100129DA4;
  v50[3] = &unk_10041DCA8;
  BOOL v57 = a3;
  id v40 = v20;
  id v51 = v40;
  id v52 = @"OutputContextExtenalDevice.muteOutputDeviceVolume";
  id v25 = v12;
  id v53 = v25;
  id v26 = v15;
  id v54 = v26;
  id v27 = v13;
  id v55 = v27;
  id v28 = v14;
  id v56 = v28;
  id v29 = objc_retainBlock(v50);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_10012A214;
  v45[3] = &unk_10041DCD0;
  v45[4] = self;
  BOOL v49 = a3;
  id v30 = v39;
  id v46 = v30;
  id v31 = v25;
  id v47 = v31;
  id v32 = v29;
  id v48 = v32;
  id v33 = objc_retainBlock(v45);
  id v34 = [(MRAVConcreteOutputContext *)self->_outputContext outputDeviceUIDs];
  id v35 = [v34 count];

  if (v35 || ![(MRAVOutputDevice *)self->_designatedGroupLeader isLocalDevice])
  {
    id v36 = objc_alloc((Class)NSString);
    id v37 = [v31 requestID];
    id v38 = [v36 initWithFormat:@"%@<%@>", @"OutputContextExtenalDevice.muteOutputDeviceVolume", v37];

    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_10012A288;
    v42[3] = &unk_100419780;
    id v43 = v32;
    id v44 = v33;
    [(MRDAVOutputContextExternalDevice *)self commitOutputDeviceToContextIfNeededWithReason:v38 completion:v42];
  }
  else
  {
    ((void (*)(void *))v33[2])(v33);
  }
}

- (void)modifyTopologyWithRequest:(id)a3 withReplyQueue:(id)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10012A394;
  v10[3] = &unk_100415990;
  int v11 = self;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v7 = v14;
  id v8 = v13;
  id v9 = v12;
  [(MRDAVOutputContextExternalDevice *)v11 commitOutputDeviceToContextIfNeededWithReason:@"modifyOutputContext" completion:v10];
}

- (void)ping:(double)a3 callback:(id)a4 withQueue:(id)a5
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012A480;
  block[3] = &unk_100416938;
  id v8 = a4;
  id v6 = v8;
  dispatch_sync((dispatch_queue_t)a5, block);
}

- (void)connectWithOptions:(unsigned int)a3 userInfo:(id)a4 completion:(id)a5
{
  id v36 = a5;
  id v7 = a4;
  id v8 = +[NSDate now];
  id v37 = [(MRDAVOutputContextExternalDevice *)self deviceInfo];
  id v9 = [v7 objectForKeyedSubscript:MRExternalDeviceConnectionCorrelationIDUserInfoKey];
  uint64_t v10 = [v7 objectForKeyedSubscript:MRExternalDeviceConnectionReasonUserInfoKey];

  id v11 = objc_alloc((Class)NSString);
  uint64_t v12 = objc_opt_class();
  id v13 = [(MRDeviceInfo *)self->_deviceInfo WHAIdentifier];
  id v14 = [(MRDeviceInfo *)self->_deviceInfo name];
  id v15 = [v11 initWithFormat:@"%@:%p-%@:%@", v12, self, v13, v14];

  id v16 = [objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", @"OutputContextExternalDevice.connectWithOptions", v9];
  id v17 = v16;
  if (v15) {
    [v16 appendFormat:@" for %@", v15];
  }
  if (v10) {
    [v17 appendFormat:@" because %@", v10];
  }
  id v38 = (void *)v10;
  uint64_t v18 = _MRLogForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v53 = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  qos_class_t v19 = qos_class_self();
  id v20 = [objc_alloc((Class)NSString) initWithFormat:@"com.apple.mediaremote.outputContextExternalDevice.connect.%@", v9];
  id v21 = (const char *)[v20 UTF8String];
  id v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v23 = dispatch_queue_attr_make_with_qos_class(v22, v19, 0);
  id v24 = [(MRDAVOutputContextExternalDevice *)self connectionStateCallbackQueue];
  dispatch_queue_t v25 = dispatch_queue_create_with_target_V2(v21, v23, v24);

  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10012A8B8;
  v44[3] = &unk_10041DCF8;
  qos_class_t v51 = v19;
  id v45 = @"OutputContextExternalDevice.connectWithOptions";
  id v26 = v9;
  id v46 = v26;
  id v47 = v15;
  dispatch_queue_t v49 = v25;
  id v50 = v36;
  id v48 = v8;
  id v27 = v25;
  id v28 = v36;
  id v29 = v8;
  id v30 = v15;
  id v31 = objc_retainBlock(v44);
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012AC58;
  block[3] = &unk_1004196E0;
  void block[4] = self;
  id v40 = @"OutputContextExternalDevice.connectWithOptions";
  id v41 = v26;
  id v42 = v37;
  id v43 = v31;
  id v33 = v37;
  id v34 = v26;
  id v35 = v31;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
}

- (id)_generateDeviceInfoWithDesignatedGroupLeader:(id)a3 outputContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[MRDMediaRemoteServer server];
  id v8 = [v7 nowPlayingServer];
  id v9 = [v8 localOriginClient];
  uint64_t v10 = [v9 deviceInfo];

  if ([v5 isLocalDevice])
  {
    id v11 = v10;
  }
  else
  {
    id v11 = [objc_alloc((Class)MRDeviceInfo) initWithOutputDevice:v5];
    uint64_t v12 = [v6 outputDevices];
    id v13 = [v12 firstObject];
    id v14 = [v13 groupID];
    if (v14)
    {
      [v11 setGroupUID:v14];
    }
    else
    {
      id v15 = [v5 groupID];
      [v11 setGroupUID:v15];
    }
    [v11 setAirPlayActive:1];
    objc_msgSend(v11, "setSupportsOutputContextSync:", objc_msgSend(v10, "supportsOutputContextSync"));
    id v16 = [v10 identifier];
    [v11 setIdentifier:v16];

    id v17 = [v10 systemMediaApplication];
    [v11 setSystemMediaApplication:v17];

    uint64_t v18 = [v10 systemPodcastApplication];
    [v11 setSystemPodcastApplication:v18];

    qos_class_t v19 = [v10 systemBooksApplication];
    [v11 setSystemBooksApplication:v19];

    objc_msgSend(v11, "setSupportsSharedQueue:", objc_msgSend(v10, "supportsSharedQueue"));
    objc_msgSend(v11, "setSharedQueueVersion:", objc_msgSend(v10, "sharedQueueVersion"));
    objc_msgSend(v11, "setSupportsMultiplayer:", objc_msgSend(v10, "supportsMultiplayer"));
    id v20 = [v10 buildVersion];
    [v11 setBuildVersion:v20];

    objc_msgSend(v11, "setProtocolVersion:", objc_msgSend(v10, "protocolVersion"));
  }
  id v21 = [v6 outputDevices];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10012B4F4;
  v26[3] = &unk_1004186C0;
  id v27 = v5;
  id v22 = v5;
  id v23 = objc_msgSend(v21, "msv_compactMap:", v26);

  [v11 setGroupedDevices:v23];
  objc_msgSend(v11, "setGroupLogicalDeviceCount:", objc_msgSend(v23, "count"));
  id v24 = [v6 contextID];
  [v11 setRoutingContextID:v24];

  return v11;
}

- (void)disconnect:(id)a3
{
  id v4 = a3;
  id v5 = MRLogCategoryConnections();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138543618;
    id v8 = self;
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}@ disconnecting with error %{public}@", buf, 0x16u);
  }

  id v6 = v4;
  msv_dispatch_sync_on_queue();
}

- (void)removeFromParentGroup:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v6 = a5;
  id v7 = [objc_alloc((Class)NSError) initWithMRError:3];
  (*((void (**)(id, id))a5 + 2))(v6, v7);
}

- (id)supportedMessages
{
  id v2 = [objc_alloc((Class)MRSupportedProtocolMessages) initWithLastSupportedMessageType:137];

  return v2;
}

- (BOOL)isPaired
{
  return 1;
}

- (BOOL)isUsingSystemPairing
{
  return 1;
}

- (BOOL)wantsNowPlayingNotifications
{
  return 1;
}

- (BOOL)wantsNowPlayingArtworkNotifications
{
  return 0;
}

- (BOOL)wantsVolumeNotifications
{
  return 1;
}

- (BOOL)wantsOutputDeviceNotifications
{
  return 1;
}

- (BOOL)wantsSystemEndpointNotifications
{
  return 0;
}

- (id)errorForCurrentState
{
  return 0;
}

- (id)currentClientUpdatesConfigMessage
{
  return 0;
}

- (id)groupSessionToken
{
  return 0;
}

- (void)requestGroupSessionWithDetails:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_10012BB3C;
  id v17 = &unk_10041A930;
  id v8 = v6;
  id v18 = v8;
  id v9 = v7;
  id v19 = v9;
  id v10 = objc_retainBlock(&v14);
  id v11 = +[MRDMediaRemoteServer server];
  uint64_t v12 = [v11 groupSessionServer];

  if (v12)
  {
    [v12 requestGroupSessionWithCompletion:v10];
  }
  else
  {
    id v13 = [objc_alloc((Class)NSError) initWithMRError:6 description:@"Feature not enabled"];
    ((void (*)(void ***, void, id))v10[2])(v10, 0, v13);
  }
}

- (void)registerForNotifications
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"outputContextDataSourceOutputDevicesDidChangeNotification:" name:MROutputContextDataSourceDidReloadNotification object:self->_outputContextController];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"outputContextDataSourceOutputDeviceDidChangeNotification:" name:MROutputContextDataSourceDidChangeOutputDeviceNotification object:self->_outputContextController];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"outputContextDataSourceDidAddOutputDeviceNotification:" name:MROutputContextDataSourceDidAddOutputDeviceNotification object:self->_outputContextController];

  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"outputContextDataSourceDidRemoveOutputDeviceNotification:" name:MROutputContextDataSourceDidRemoveOutputDeviceNotification object:self->_outputContextController];

  id v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"outputContextDataSourceVolumeControlCapabilitiesDidChangeNotification:" name:MROutputContextDataSourceOutputDeviceDidChangeVolumeControlCapabilitiesNotification object:self->_outputContextController];

  id v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"outputContextDataSourceVolumeDidChangeNotification:" name:MROutputContextDataSourceOutputDeviceDidChangeVolumeNotification object:self->_outputContextController];

  id v9 = +[NSNotificationCenter defaultCenter];
  [v9 addObserver:self selector:"outputContextDataSourceIsMutedDidChangeNotification:" name:MROutputContextDataSourceOutputDeviceDidChangeVolumeMutedNotification object:self->_outputContextController];

  id v10 = +[NSNotificationCenter defaultCenter];
  [v10 addObserver:self selector:"outputContextRequestToAddLocalOutputDeviceNotification:" name:MRAVOutputContextModificationRequestToAddLocalDeviceNotification object:self->_outputContext];

  id v11 = +[NSNotificationCenter defaultCenter];
  [v11 addObserver:self selector:"anyDeviceInfoDidChangeNotification:" name:kMRDeviceInfoDidChangeNotification object:0];

  id v12 = +[NSNotificationCenter defaultCenter];
  [v12 addObserver:self selector:"localClusterTypeDidChangeNotification:" name:@"MRDAVOutputContextExternalDeviceDiscoveryLocalClusterTypeDidChangeNotification" object:0];
}

- (void)outputContextDataSourceOutputDeviceDidChangeNotification:(id)a3
{
  id v3 = [a3 userInfo];
  id v4 = [v3 objectForKeyedSubscript:MROutputContextDataSourceOutputDeviceUserInfoKey];

  id v5 = v4;
  msv_dispatch_sync_on_queue();
}

- (void)outputContextDataSourceDidAddOutputDeviceNotification:(id)a3
{
  id v3 = [a3 userInfo];
  id v4 = [v3 objectForKeyedSubscript:MROutputContextDataSourceOutputDeviceUserInfoKey];

  id v5 = v4;
  msv_dispatch_sync_on_queue();
}

- (void)outputContextDataSourceDidRemoveOutputDeviceNotification:(id)a3
{
  id v3 = [a3 userInfo];
  id v4 = [v3 objectForKeyedSubscript:MROutputContextDataSourceOutputDeviceUserInfoKey];

  id v5 = v4;
  msv_dispatch_sync_on_queue();
}

- (void)outputContextDataSourceVolumeControlCapabilitiesDidChangeNotification:(id)a3
{
  id v3 = a3;
  id v4 = [v3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:MROutputContextDataSourceVolumeCapabilitiesUserInfoKey];

  id v6 = [v3 userInfo];

  id v7 = [v6 objectForKeyedSubscript:MROutputContextDataSourceOutputDeviceUserInfoKey];

  if (v5) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    [v5 intValue];
    id v9 = v7;
    msv_dispatch_sync_on_queue();
  }
}

- (void)outputContextDataSourceVolumeDidChangeNotification:(id)a3
{
  id v3 = a3;
  id v4 = [v3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:MROutputContextDataSourceVolumeUserInfoKey];

  id v6 = [v3 userInfo];

  id v7 = [v6 objectForKeyedSubscript:MROutputContextDataSourceOutputDeviceUserInfoKey];

  if (v5) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    id v9 = v5;
    id v10 = v7;
    msv_dispatch_sync_on_queue();
  }
}

- (void)outputContextDataSourceIsMutedDidChangeNotification:(id)a3
{
  id v3 = a3;
  id v4 = [v3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:MROutputContextDataSourceVolumeMutedUserInfoKey];

  id v6 = [v3 userInfo];

  id v7 = [v6 objectForKeyedSubscript:MROutputContextDataSourceOutputDeviceUserInfoKey];

  if (v5) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    [v5 BOOLValue];
    id v9 = v7;
    msv_dispatch_sync_on_queue();
  }
}

- (void)outputContextRequestToAddLocalOutputDeviceNotification:(id)a3
{
  id v6 = a3;
  id v4 = [v6 userInfo];
  id v5 = [v4 objectForKeyedSubscript:MRAVOutputContextModificationInitiatorUserInfoKey];

  if (([v5 isEqualToString:@"Prewarm"] & 1) == 0) {
    [(MRDAVOutputContextExternalDevice *)self _notifyActiveSessionMaybeWillBeHijackedByNativePlaybackFromOutputContextModification:v6];
  }
}

- (void)_notifyActiveSessionMaybeWillBeHijackedByNativePlaybackFromOutputContextModification:(id)a3
{
  id v3 = a3;
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [v3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:MRAVOutputContextModificationIdentifierUserInfoKey];
  [v9 setObject:v5 forKeyedSubscript:kMRMediaRemoteOptionCommandID];

  id v6 = [v3 userInfo];
  id v7 = [v6 objectForKeyedSubscript:MRAVOutputContextModificationInitiatorUserInfoKey];
  [v9 setObject:v7 forKeyedSubscript:kMRMediaRemoteOptionSenderID];

  BOOL v8 = [v3 name];

  [v9 setObject:v8 forKeyedSubscript:kMRMediaRemoteOptionRemoteControlInterfaceIdentifier];
  [(id)objc_opt_class() _sendCommandPreview:0 options:v9 playerPath:0];
}

- (void)anyDeviceInfoDidChangeNotification:(id)a3
{
  id v4 = [a3 userInfo];
  MRGetOriginFromUserInfo();
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if ([v5 isLocal]) {
    [(MRDAVOutputContextExternalDevice *)self _reevaluateDeviceInfo];
  }
}

- (void)localClusterTypeDidChangeNotification:(id)a3
{
  id v3 = [a3 object];
  id v4 = self;
  if (v3 != self)
  {
    id v5 = [(MRDAVOutputContextExternalDevice *)self designatedGroupLeader];
    unsigned int v6 = [v5 isLocalDevice];

    if (!v6) {
      return;
    }
    id v7 = (MRDAVOutputContextExternalDevice *)[objc_alloc((Class)NSError) initWithMRError:32 format:@"Local device changed clusterType in discovery"];
    [(MRDAVOutputContextExternalDevice *)self disconnect:v7];
    id v4 = v7;
  }
}

- (void)clusterController:(id)a3 clusterTypeDidChange:(unsigned int)a4
{
  unsigned int v6 = [(MRDAVOutputContextExternalDevice *)self designatedGroupLeader];
  unsigned int v7 = [v6 isLocalDevice];

  if (v7)
  {
    BOOL v8 = MRLogCategoryConnections();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543618;
      uint64_t v15 = self;
      __int16 v16 = 1024;
      unsigned int v17 = a4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Local device changed clusterType to: %u", buf, 0x12u);
    }

    id v9 = objc_alloc_init((Class)MRAVLightweightReconnaissanceSession);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10012D15C;
    v12[3] = &unk_10041DD60;
    unsigned int v13 = a4;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10012D1DC;
    v10[3] = &unk_10041DD88;
    void v10[4] = self;
    unsigned int v11 = a4;
    [v9 searchEndpointsWithPredicate:v12 timeout:@"clusterTypeDidChange" reason:0 queue:v10 completion:30.0];
  }
}

- (void)_reevaluateDeviceInfo
{
  id v5 = [(MRDAVOutputContextExternalDevice *)self designatedGroupLeader];
  id v3 = [(MRDAVOutputContextExternalDevice *)self outputContext];
  id v4 = [(MRDAVOutputContextExternalDevice *)self _generateDeviceInfoWithDesignatedGroupLeader:v5 outputContext:v3];
  [(MRDAVOutputContextExternalDevice *)self setDeviceInfo:v4];
}

- (void)cleanUp
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  designatedGroupLeader = self->_designatedGroupLeader;
  self->_designatedGroupLeader = 0;

  [(MRDAVOutputContextExternalDevice *)self setOrigin:0];
}

- (id)outputDeviceForUID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  __int16 v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_100120624;
  id v19 = sub_100120634;
  id v20 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012D5A0;
  block[3] = &unk_100416730;
  id v14 = &v15;
  void block[4] = self;
  id v8 = v6;
  id v13 = v8;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  id v9 = (void *)v16[5];
  if (a4 && !v9)
  {
    *a4 = [objc_alloc((Class)NSError) initWithMRError:39];
    id v9 = (void *)v16[5];
  }
  id v10 = v9;

  _Block_object_dispose(&v15, 8);

  return v10;
}

- (void)commitOutputDeviceToContextIfNeededWithReason:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10012D82C;
  v23[3] = &unk_100418848;
  void v23[4] = self;
  id v8 = v6;
  id v24 = v8;
  id v9 = objc_retainBlock(v23);
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012DAF8;
  block[3] = &unk_10041DDF8;
  void block[4] = self;
  id v11 = v8;
  id v15 = v11;
  id v12 = v7;
  id v16 = v12;
  id v13 = v9;
  id v17 = v13;
  id v18 = &v19;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  if (!*((unsigned char *)v20 + 24)) {
    ((void (*)(void *, void))v13[2])(v13, 0);
  }

  _Block_object_dispose(&v19, 8);
}

- (void)_onQueue_forwardOriginToLocalOrigin:(id)a3
{
  id v4 = a3;
  if (self->_origin && !self->_originForwarder)
  {
    id v5 = MRLogCategoryConnections();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = +[MROrigin localOrigin];
      id v7 = [(MRDAVOutputContextExternalDevice *)self outputContext];
      int v12 = 138544130;
      id v13 = self;
      __int16 v14 = 2114;
      id v15 = v4;
      __int16 v16 = 2114;
      id v17 = v6;
      __int16 v18 = 2114;
      uint64_t v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Begin Forwarding Origin Data from %{public}@ to %{public}@ for outputContext %{public}@", (uint8_t *)&v12, 0x2Au);
    }
    id v8 = [MRDOriginForwarder alloc];
    id v9 = +[MROrigin localOrigin];
    id v10 = [(MRDOriginForwarder *)v8 initWithOrigin:v4 destinationOrigin:v9];
    originForwarder = self->_originForwarder;
    self->_originForwarder = v10;
  }
}

- (void)_onQueue_clearLocalOriginForwaderWithReason:(id)a3
{
  id v4 = a3;
  if (self->_originForwarder)
  {
    id v5 = MRLogCategoryConnections();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543618;
      id v71 = self;
      __int16 v72 = 2112;
      id v73 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Begin clearing all localOrigin nowPlayingData because %@", buf, 0x16u);
    }
    qos_class_t v51 = self;
    id v52 = v4;

    id v6 = (void *)MRMediaRemoteCopyLocalDeviceAirPlayReceiverBundleID();
    id v7 = +[MRNowPlayingOriginClientManager sharedManager];
    id v8 = +[MROrigin localOrigin];
    id v9 = [v7 originClientForOrigin:v8];

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v54 = v9;
    id v10 = [v9 nowPlayingClients];
    id v11 = [v10 countByEnumeratingWithState:&v63 objects:v69 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v64;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v64 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          __int16 v16 = [v15 client];
          id v17 = [v16 bundleIdentifier];
          unsigned __int8 v18 = [v17 isEqualToString:v6];

          if ((v18 & 1) == 0)
          {
            uint64_t v19 = [v15 playerPath];
            [v54 removeClient:v19];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v63 objects:v69 count:16];
      }
      while (v12);
    }

    id v20 = +[MRNowPlayingOriginClientManager sharedManager];
    uint64_t v21 = +[MRPlayerPath localPlayerPath];
    char v22 = [v20 existingOriginClientRequestsForPlayerPath:v21];

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v53 = v22;
    id v23 = [v22 nowPlayingClientRequests];
    id v24 = [v23 countByEnumeratingWithState:&v59 objects:v68 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v60;
      do
      {
        for (j = 0; j != v25; j = (char *)j + 1)
        {
          if (*(void *)v60 != v26) {
            objc_enumerationMutation(v23);
          }
          id v28 = *(void **)(*((void *)&v59 + 1) + 8 * (void)j);
          id v29 = [v28 client];
          id v30 = [v29 bundleIdentifier];
          unsigned __int8 v31 = [v30 isEqualToString:v6];

          if ((v31 & 1) == 0)
          {
            id v32 = objc_alloc((Class)MRPlayerPath);
            id v33 = +[MROrigin anyOrigin];
            id v34 = [v28 client];
            id v35 = [v32 initWithOrigin:v33 client:v34 player:0];

            [v53 removeClient:v35];
          }
        }
        id v25 = [v23 countByEnumeratingWithState:&v59 objects:v68 count:16];
      }
      while (v25);
    }

    id v36 = +[MRDMediaRemoteServer server];
    id v37 = [v36 nowPlayingServer];
    id v38 = [v37 localOriginClient];

    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v39 = [v38 nowPlayingClients];
    id v40 = [v39 countByEnumeratingWithState:&v55 objects:v67 count:16];
    if (v40)
    {
      id v41 = v40;
      uint64_t v42 = *(void *)v56;
      do
      {
        for (k = 0; k != v41; k = (char *)k + 1)
        {
          if (*(void *)v56 != v42) {
            objc_enumerationMutation(v39);
          }
          id v44 = *(void **)(*((void *)&v55 + 1) + 8 * (void)k);
          id v45 = [v44 client];
          id v46 = [v45 bundleIdentifier];
          unsigned __int8 v47 = [v46 isEqualToString:v6];

          if ((v47 & 1) == 0)
          {
            id v48 = [v44 client];
            [v38 removeNowPlayingClientForClient:v48];
          }
        }
        id v41 = [v39 countByEnumeratingWithState:&v55 objects:v67 count:16];
      }
      while (v41);
    }

    dispatch_queue_t v49 = MRLogCategoryConnections();
    id v4 = v52;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543618;
      id v71 = v51;
      __int16 v72 = 2112;
      id v73 = v52;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%{public}@ End clearing all localOrigin nowPlayingData because %@", buf, 0x16u);
    }

    originForwarder = v51->_originForwarder;
    v51->_originForwarder = 0;
  }
}

- (id)_resolveReason:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = [(MRDAVOutputContextExternalDevice *)self uid];
  id v7 = [(MRDAVOutputContextExternalDevice *)self name];
  id v8 = [v5 _resolveReason:v4 uid:v6 name:v7 requestID:0];

  return v8;
}

+ (id)_resolveReason:(id)a3 uid:(id)a4 name:(id)a5 requestID:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [objc_alloc((Class)NSString) initWithFormat:@"OutputContextExternalDevice-%@-%@:%@<%@>", v11, v10, v12, v9];

  return v13;
}

- (void)_onQueue_destroyPlayerPathsForOrigin:(id)a3
{
  id v4 = a3;
  id v5 = MRLogCategoryConnections();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    unsigned __int8 v18 = self;
    __int16 v19 = 2114;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Destroying playerPaths for origin: %{public}@", buf, 0x16u);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = +[MRDMediaRemoteServer server];
  id v7 = [v6 allClients];

  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [(MRDAVOutputContextExternalDevice *)self destroyPlayersForClient:*(void *)(*((void *)&v12 + 1) + 8 * (void)v11) origin:v4];
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)destroyPlayersForClient:(id)a3 origin:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  MRCreateXPCMessage();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  MRAddOriginToXPCMessage();

  id v7 = [v6 connection];

  [v7 sendMessage:v8 queue:0 reply:0];
}

- (BOOL)verifyCreatedPlayerPath:(id)a3 forClient:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = sub_100120624;
  uint64_t v26 = sub_100120634;
  id v27 = 0;
  serialQueue = self->_serialQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10012EF04;
  v21[3] = &unk_100415CF0;
  v21[4] = self;
  v21[5] = &v22;
  dispatch_sync((dispatch_queue_t)serialQueue, v21);
  id v11 = (void *)v23[5];
  long long v12 = [v8 origin];
  id v13 = v11;
  id v14 = v12;
  if (v13 == v14)
  {

    goto LABEL_8;
  }
  long long v15 = v14;
  unsigned __int8 v16 = [v13 isEqual:v14];

  if (v16)
  {
LABEL_8:
    BOOL v19 = 1;
    goto LABEL_9;
  }
  id v17 = MRLogCategoryConnections();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138543618;
    id v29 = self;
    __int16 v30 = 2114;
    id v31 = v8;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@ Origin changed while creating player: %{public}@  - Destroying", buf, 0x16u);
  }

  unsigned __int8 v18 = [v8 origin];
  [(MRDAVOutputContextExternalDevice *)self destroyPlayersForClient:v9 origin:v18];

  BOOL v19 = 0;
  if (a5) {
    *a5 = [objc_alloc((Class)NSError) initWithMRError:6];
  }
LABEL_9:
  _Block_object_dispose(&v22, 8);

  return v19;
}

+ (void)_reportStreamCountAnalytics
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  id v3 = +[MRDMediaRemoteServer server];
  id v4 = [v3 nowPlayingServer];

  id v5 = [v4 localOriginClient];
  id v6 = [v5 deviceInfo];
  id v7 = +[MRDMediaRemoteServer server];
  id v8 = [v7 routingServer];
  id v9 = [v8 hostedRoutingService];
  uint64_t v10 = [v9 hostedRoutingController];

  id v29 = v10;
  id v11 = [v10 availableEndpoints];
  long long v12 = objc_msgSend(v11, "msv_filter:", &stru_10041DE38);

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10012F3A0;
  v33[3] = &unk_10041DE60;
  id v28 = v4;
  id v34 = v28;
  id v13 = objc_msgSend(v12, "msv_compactMap:", v33);
  if ([v6 considerLocalOriginAsSeperateStream])
  {
    uint64_t v14 = [v13 arrayByAddingObject:v5];

    id v13 = (void *)v14;
  }
  long long v15 = objc_msgSend(v13, "msv_filter:", &stru_10041DE80);
  unsigned __int8 v16 = objc_msgSend(v12, "msv_filter:", &stru_10041DEA0);
  __int16 v30 = v5;
  if ([v6 considerLocalOriginAsSeperateStream])
  {
    id v17 = +[MRAVLocalEndpoint sharedLocalEndpoint];
    uint64_t v18 = [v16 arrayByAddingObject:v17];

    unsigned __int8 v16 = (void *)v18;
  }
  BOOL v19 = objc_msgSend(v15, "msv_firstWhere:", &stru_10041DEE0);
  id v20 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v15 count]);
  [v2 setObject:v20 forKeyedSubscript:@"stream_count"];

  uint64_t v21 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v16 count]);
  [v2 setObject:v21 forKeyedSubscript:@"stream_count_can_handoff"];

  uint64_t v22 = [v19 deviceInfo];
  id v23 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v22 isAirPlayActive]);
  [v2 setObject:v23 forKeyedSubscript:@"is_local_receiver"];

  uint64_t v24 = +[NSNumber numberWithInt:v19 != 0];
  [v2 setObject:v24 forKeyedSubscript:@"is_local_playing"];

  if (MSVDeviceOSIsInternalInstall())
  {
    id v25 = objc_msgSend(v16, "msv_map:", &stru_10041DF00);
    [v2 setObject:v25 forKeyedSubscript:@"handoffable_endpoints_debug"];

    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10012F4B8;
    v31[3] = &unk_10041DF28;
    id v32 = v6;
    uint64_t v26 = objc_msgSend(v15, "msv_map:", v31);
    [v2 setObject:v26 forKeyedSubscript:@"playing_player_paths_debug"];
  }
  id v27 = v2;
  MRAnalyticsSendEvent();
}

- (id)subscribedPlayerPaths
{
  return self->subscribedPlayerPaths;
}

- (void)setSubscribedPlayerPaths:(id)a3
{
}

- (MRAVConcreteOutputContext)outputContext
{
  return self->_outputContext;
}

- (void)setOutputContext:(id)a3
{
}

- (MROrigin)origin
{
  return self->_origin;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (void)setWorkerQueue:(id)a3
{
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
}

- (id)connectionStateCallback
{
  return self->_connectionStateCallback;
}

- (void)setConnectionStateCallback:(id)a3
{
}

- (OS_dispatch_queue)connectionStateCallbackQueue
{
  return self->_connectionStateCallbackQueue;
}

- (void)setConnectionStateCallbackQueue:(id)a3
{
}

- (id)outputDevicesUpdatedCallback
{
  return self->_outputDevicesUpdatedCallback;
}

- (void)setOutputDevicesUpdatedCallback:(id)a3
{
}

- (OS_dispatch_queue)outputDevicesUpdatedCallbackQueue
{
  return self->_outputDevicesUpdatedCallbackQueue;
}

- (void)setOutputDevicesUpdatedCallbackQueue:(id)a3
{
}

- (id)outputDevicesRemovedCallback
{
  return self->_outputDevicesRemovedCallback;
}

- (void)setOutputDevicesRemovedCallback:(id)a3
{
}

- (OS_dispatch_queue)outputDevicesRemovedCallbackQueue
{
  return self->_outputDevicesRemovedCallbackQueue;
}

- (void)setOutputDevicesRemovedCallbackQueue:(id)a3
{
}

- (id)volumeCallback
{
  return self->_volumeCallback;
}

- (void)setVolumeCallback:(id)a3
{
}

- (OS_dispatch_queue)volumeCallbackQueue
{
  return self->_volumeCallbackQueue;
}

- (void)setVolumeCallbackQueue:(id)a3
{
}

- (id)volumeControlCapabilitiesCallback
{
  return self->_volumeControlCapabilitiesCallback;
}

- (void)setVolumeControlCapabilitiesCallback:(id)a3
{
}

- (OS_dispatch_queue)volumeControlCapabilitiesCallbackQueue
{
  return self->_volumeControlCapabilitiesCallbackQueue;
}

- (void)setVolumeControlCapabilitiesCallbackQueue:(id)a3
{
}

- (id)volumeMutedCallback
{
  return self->_volumeMutedCallback;
}

- (void)setVolumeMutedCallback:(id)a3
{
}

- (OS_dispatch_queue)volumeMutedCallbackQueue
{
  return self->_volumeMutedCallbackQueue;
}

- (void)setVolumeMutedCallbackQueue:(id)a3
{
}

- (id)deviceInfoCallback
{
  return self->_deviceInfoCallback;
}

- (void)setDeviceInfoCallback:(id)a3
{
}

- (OS_dispatch_queue)deviceInfoCallbackQueue
{
  return self->_deviceInfoCallbackQueue;
}

- (void)setDeviceInfoCallbackQueue:(id)a3
{
}

- (MRDAirPlayLeaderInfoPublisher)airplayPublisher
{
  return self->_airplayPublisher;
}

- (NSError)disconnectionError
{
  return self->_disconnectionError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disconnectionError, 0);
  objc_storeStrong((id *)&self->_airplayPublisher, 0);
  objc_storeStrong((id *)&self->_deviceInfoCallbackQueue, 0);
  objc_storeStrong(&self->_deviceInfoCallback, 0);
  objc_storeStrong((id *)&self->_volumeMutedCallbackQueue, 0);
  objc_storeStrong(&self->_volumeMutedCallback, 0);
  objc_storeStrong((id *)&self->_volumeControlCapabilitiesCallbackQueue, 0);
  objc_storeStrong(&self->_volumeControlCapabilitiesCallback, 0);
  objc_storeStrong((id *)&self->_volumeCallbackQueue, 0);
  objc_storeStrong(&self->_volumeCallback, 0);
  objc_storeStrong((id *)&self->_outputDevicesRemovedCallbackQueue, 0);
  objc_storeStrong(&self->_outputDevicesRemovedCallback, 0);
  objc_storeStrong((id *)&self->_outputDevicesUpdatedCallbackQueue, 0);
  objc_storeStrong(&self->_outputDevicesUpdatedCallback, 0);
  objc_storeStrong((id *)&self->_connectionStateCallbackQueue, 0);
  objc_storeStrong(&self->_connectionStateCallback, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_outputContext, 0);
  objc_storeStrong((id *)&self->subscribedPlayerPaths, 0);
  objc_storeStrong((id *)&self->_designatedGroupLeader, 0);
  objc_storeStrong((id *)&self->_outputContextController, 0);
  objc_storeStrong((id *)&self->_pendingCommitRequests, 0);
  objc_storeStrong((id *)&self->_originForwarder, 0);

  objc_storeStrong((id *)&self->_deviceInfo, 0);
}

@end