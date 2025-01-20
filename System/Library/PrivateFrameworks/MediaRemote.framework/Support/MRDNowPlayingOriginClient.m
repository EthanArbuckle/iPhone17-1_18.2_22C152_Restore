@interface MRDNowPlayingOriginClient
- (BOOL)_shouldHandleNotification:(id)a3;
- (BOOL)containsActiveStream;
- (BOOL)isActivityActive;
- (BOOL)isMuted;
- (BOOL)isPlaying;
- (MRDDeviceInfoDataSource)deviceInfoDataSource;
- (MRDMediaRemoteClient)overrideClient;
- (MRDNowPlayingClient)activeNowPlayingClient;
- (MRDNowPlayingClient)computedNowPlayingClient;
- (MRDNowPlayingClient)explicitNowPlayingClient;
- (MRDNowPlayingClient)inferredNowPlayingClient;
- (MRDNowPlayingDataSource)nowPlayingDataSource;
- (MRDNowPlayingOriginClient)initWithDeviceInfoDataSource:(id)a3 delegate:(id)a4;
- (MRDNowPlayingOriginClient)initWithOrigin:(id)a3 deviceInfo:(id)a4 delegate:(id)a5;
- (MRDNowPlayingOriginClient)initWithOrigin:(id)a3 deviceInfo:(id)a4 deviceInfoDataSource:(id)a5 delegate:(id)a6;
- (MRDNowPlayingOriginClientDelegate)delegate;
- (MRDeviceInfo)deviceInfo;
- (MRMutableApplicationActivity)activity;
- (MROrigin)origin;
- (MRPlayerPath)activePlayerPath;
- (MRPlayerPath)playerPath;
- (NSArray)activePlayerClients;
- (NSArray)mostRecentPlayers;
- (NSArray)nowPlayingAudioFormatContentInfos;
- (NSArray)nowPlayingClients;
- (NSData)deviceInfoData;
- (NSDate)registrationDate;
- (NSDictionary)defaultSupportedCommands;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)devicePlaybackSessionID;
- (double)timeSincePlaybackStarted;
- (double)timeSincePlaying;
- (float)volume;
- (id)_onQueue_addNowPlayingClient:(id)a3;
- (id)_onQueue_calculateActiveNowPlayingClient;
- (id)_onQueue_calculateActiveNowPlayingPlayerClients;
- (id)_onQueue_calculateComputedNowPlayingClient;
- (id)_onQueue_calculateInferredNowPlayingClient;
- (id)_playerPathForNowPlayingClient:(id)a3;
- (id)activeContent;
- (id)applicationConnectionOutgoingMessageCallback;
- (id)createNewApplicationConnectionCallback;
- (id)defaultSupportedCommandsDataForClient:(id)a3;
- (id)defaultSupportedCommandsForClient:(id)a3;
- (id)existingNowPlayingClientForClient:(id)a3;
- (id)existingNowPlayingClientForDisplayID:(id)a3;
- (id)existingNowPlayingClientForPid:(int)a3;
- (id)existingNowPlayingClientForPlayerPath:(id)a3;
- (id)nowPlayingClientForClient:(id)a3;
- (id)nowPlayingClientForPlayerPath:(id)a3;
- (unsigned)_onQueue_calculateInferredPlaybackStateForPlayer:(id)a3;
- (unsigned)_stateFromDataSource:(id)a3;
- (unsigned)volumeControlCapabilities;
- (void)_handleActivePlayerDidChange:(id)a3;
- (void)_handleNowPlayingAppMaybeDidChange:(id)a3;
- (void)_handleNowPlayingApplicationDidUnregisterCanBeNowPlaying:(id)a3;
- (void)_handleOriginIsPlayingDidChange:(id)a3;
- (void)_handlePlayerDidRegister:(id)a3;
- (void)_handlePlayerIsPlayingDidChange:(id)a3;
- (void)_handlePlayerPictureInPictureEnabledDidChange:(id)a3;
- (void)_handlePlayerPropertiesDidChange:(id)a3;
- (void)_onQueue_maybeSavePlaybackStateForNotification:(id)a3;
- (void)_onQueue_maybeSetupPlaybackTimeoutTimerForNotification:(id)a3;
- (void)_onQueue_reevaluateStateWithReason:(id)a3;
- (void)_onQueue_reloadInferredStateFromDataSource:(id)a3 reason:(id)a4;
- (void)_onQueue_removeNowPlayingClient:(id)a3;
- (void)_onQueue_updateActivityStatus:(int)a3;
- (void)_registerCallbacks;
- (void)clearDefaultSupportedCommandsData;
- (void)deviceInfoDataSource:(id)a3 deviceInfoDidChange:(id)a4;
- (void)nowPlayingDataSourceNowPlayingApplicationDidChange:(id)a3;
- (void)nowPlayingDataSourceNowPlayingApplicationPlaybackStateDidChange:(id)a3;
- (void)nowPlayingDataSourceNowPlayingApplicationsPlaybackStateDidChange:(id)a3;
- (void)nowPlayingDataSourceNowPlayingAudioFormatContentInfosDidChange:(id)a3;
- (void)nowPlayingDataSourceNowPlayingSessionsPlaybackStateDidChange:(id)a3;
- (void)registerApplicationConnectionOutgoingMessageCallback:(id)a3;
- (void)registerCreateNewApplicationConnectionCallback:(id)a3;
- (void)removeAllClients;
- (void)removeNowPlayingClientForClient:(id)a3;
- (void)setActivity:(id)a3;
- (void)setComputedNowPlayingClient:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setDeviceInfoData:(id)a3;
- (void)setDevicePlaybackSessionID:(id)a3;
- (void)setExplicitNowPlayingClient:(id)a3;
- (void)setInferredNowPlayingClient:(id)a3;
- (void)setIsMuted:(BOOL)a3;
- (void)setNowPlayingDataSource:(id)a3;
- (void)setOverrideClient:(id)a3;
- (void)setVolume:(float)a3;
- (void)setVolumeControlCapabilities:(unsigned int)a3;
- (void)updateDefaultSupportedCommandsData:(id)a3 forClient:(id)a4;
- (void)updateLastPlayingDate:(id)a3;
@end

@implementation MRDNowPlayingOriginClient

- (MRDeviceInfo)deviceInfo
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = sub_1000BB930;
  v8 = sub_1000BB940;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MRDeviceInfo *)v2;
}

- (id)existingNowPlayingClientForClient:(id)a3
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1000BB930;
  v10 = sub_1000BB940;
  id v11 = 0;
  id v5 = a3;
  msv_dispatch_sync_on_queue();
  id v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);

  return v3;
}

- (MRDNowPlayingClient)activeNowPlayingClient
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = sub_1000BB930;
  uint64_t v8 = sub_1000BB940;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MRDNowPlayingClient *)v2;
}

- (MROrigin)origin
{
  return self->_origin;
}

- (BOOL)containsActiveStream
{
  id v2 = [(MRDNowPlayingOriginClient *)self activeNowPlayingClient];
  id v3 = [v2 activePlayerClient];
  unsigned __int8 v4 = [v3 isActiveStream];

  return v4;
}

- (id)activeContent
{
  id v2 = [(MRDNowPlayingOriginClient *)self activeNowPlayingClient];
  id v3 = [v2 activePlayerClient];
  unsigned __int8 v4 = [v3 activeContent];

  return v4;
}

- (MRDNowPlayingOriginClient)initWithOrigin:(id)a3 deviceInfo:(id)a4 deviceInfoDataSource:(id)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v40.receiver = self;
  v40.super_class = (Class)MRDNowPlayingOriginClient;
  v15 = [(MRDNowPlayingOriginClient *)&v40 init];
  if (!v15) {
    goto LABEL_15;
  }
  v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v17 = dispatch_queue_create("com.apple.mediaremote.MRDNowPlayingOriginClient", v16);
  serialQueue = v15->_serialQueue;
  v15->_serialQueue = (OS_dispatch_queue *)v17;

  objc_storeStrong((id *)&v15->_origin, a3);
  [(MRDNowPlayingOriginClient *)v15 setDeviceInfo:v12];
  objc_storeStrong((id *)&v15->_deviceInfoDataSource, a5);
  [(MRDDeviceInfoDataSource *)v15->_deviceInfoDataSource setDelegate:v15];
  objc_storeWeak((id *)&v15->_delegate, v14);
  v19 = (MRPlayerPath *)[objc_alloc((Class)MRPlayerPath) initWithOrigin:v15->_origin client:0 player:0];
  playerPath = v15->_playerPath;
  v15->_playerPath = v19;

  if (![(MROrigin *)v15->_origin isLocal])
  {
    uint64_t v22 = +[NSDate distantPast];
    goto LABEL_6;
  }
  v21 = +[MRUserSettings currentSettings];
  [v21 localPlaybackState];

  if (MRMediaRemotePlaybackStateIsAdvancing())
  {
    uint64_t v22 = +[NSDate date];
LABEL_6:
    lastPlayingDate = v15->_lastPlayingDate;
    v15->_lastPlayingDate = (NSDate *)v22;
    goto LABEL_11;
  }
  lastPlayingDate = +[MRUserSettings currentSettings];
  v24 = [lastPlayingDate localLastPlayingDate];
  v25 = v24;
  if (v24)
  {
    v26 = v24;
  }
  else
  {
    v26 = +[NSDate distantPast];
  }
  v27 = v15->_lastPlayingDate;
  v15->_lastPlayingDate = v26;

LABEL_11:
  uint64_t v28 = +[NSDate date];
  registrationDate = v15->_registrationDate;
  v15->_registrationDate = (NSDate *)v28;

  if ([(MROrigin *)v15->_origin isLocallyHosted])
  {
    v30 = +[MRUserSettings currentSettings];
    unsigned int v31 = [v30 computeDevicePlaybackSessionID];

    if (v31)
    {
      v32 = +[NSUUID UUID];
      uint64_t v33 = [v32 UUIDString];
      devicePlaybackSessionID = v15->_devicePlaybackSessionID;
      v15->_devicePlaybackSessionID = (NSString *)v33;
    }
  }
  v35 = v15->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BB268;
  block[3] = &unk_100415CC8;
  v36 = v15;
  v39 = v36;
  dispatch_sync(v35, block);
  [(MRDNowPlayingOriginClient *)v36 _registerCallbacks];

LABEL_15:
  return v15;
}

- (MRDNowPlayingOriginClient)initWithOrigin:(id)a3 deviceInfo:(id)a4 delegate:(id)a5
{
  return [(MRDNowPlayingOriginClient *)self initWithOrigin:a3 deviceInfo:a4 deviceInfoDataSource:0 delegate:a5];
}

- (MRDNowPlayingOriginClient)initWithDeviceInfoDataSource:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[MROrigin localOrigin];
  id v9 = [v7 deviceInfo];
  v10 = [(MRDNowPlayingOriginClient *)self initWithOrigin:v8 deviceInfo:v9 deviceInfoDataSource:v7 delegate:v6];

  return v10;
}

- (NSString)description
{
  id v3 = [(NSMutableArray *)self->_nowPlayingClients count];
  unsigned __int8 v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = (void *)v5;
  id v7 = "s";
  if (v3 == (id)1) {
    id v7 = "";
  }
  uint64_t v8 = +[NSString stringWithFormat:@"<%@ %p origin=%@ %llu nowPlayingClient%s>", v5, self, self->_origin, v3, v7];

  return (NSString *)v8;
}

- (NSString)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  unsigned __int8 v4 = NSStringFromClass(v3);
  uint64_t v5 = MRCreateIndentedDebugDescriptionFromObject();
  id v6 = MRCreateIndentedDebugDescriptionFromObject();
  double volume = self->_volume;
  uint64_t v8 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription();
  CFStringRef v9 = @"NO";
  if (self->_isMuted) {
    CFStringRef v10 = @"YES";
  }
  else {
    CFStringRef v10 = @"NO";
  }
  [(MRDNowPlayingOriginClient *)self timeSincePlaying];
  uint64_t v12 = v11;
  [(MRDNowPlayingOriginClient *)self timeSincePlaybackStarted];
  uint64_t v14 = v13;
  if ([(MRDNowPlayingOriginClient *)self isPlaying]) {
    CFStringRef v9 = @"YES";
  }
  v15 = [(MRDNowPlayingOriginClient *)self devicePlaybackSessionID];
  v16 = +[NSMutableString stringWithFormat:@"%@ %p {\n  origin = %@\n  deviceInfo = %@\n  double volume = %f\n  volume capabilities = %@\n  isMuted = %@\n  time since playing = %lf\n  time since playback started = %lf\n  is playing = %@\n  devicePlaybackSessionID = %@\n", v4, self, v5, v6, *(void *)&volume, v8, v10, v12, v14, v9, v15];

  activeNowPlayingClient = self->_activeNowPlayingClient;
  if (activeNowPlayingClient)
  {
    v18 = [(MRDNowPlayingClient *)activeNowPlayingClient client];
    [v16 appendFormat:@"  active now playing client = %@\n", v18];
  }
  overrideClient = self->_overrideClient;
  if (overrideClient)
  {
    v20 = [(MRDMediaRemoteClient *)overrideClient bundleIdentifier];
    [v16 appendFormat:@"  override client = %@\n", v20];
  }
  explicitNowPlayingClient = self->_explicitNowPlayingClient;
  if (explicitNowPlayingClient)
  {
    uint64_t v22 = [(MRDNowPlayingClient *)explicitNowPlayingClient client];
    v23 = MRCreateIndentedDebugDescriptionFromObject();
    [v16 appendFormat:@"  explicit now playing client = %@\n", v23];
  }
  computedNowPlayingClient = self->_computedNowPlayingClient;
  if (computedNowPlayingClient)
  {
    v25 = [(MRDNowPlayingClient *)computedNowPlayingClient client];
    v26 = MRCreateIndentedDebugDescriptionFromObject();
    [v16 appendFormat:@"  computed now playing client = %@\n", v26];
  }
  inferredNowPlayingClient = self->_inferredNowPlayingClient;
  if (inferredNowPlayingClient)
  {
    uint64_t v28 = [(MRDNowPlayingClient *)inferredNowPlayingClient client];
    v29 = MRCreateIndentedDebugDescriptionFromObject();
    [v16 appendFormat:@"  inferred now playing client = %@\n", v29];
  }
  if (self->_activity)
  {
    v30 = MRCreateIndentedDebugDescriptionFromObject();
    [v16 appendFormat:@"  app activity = %@\n", v30];
  }
  if (self->_nowPlayingDataSource)
  {
    unsigned int v31 = MRCreateIndentedDebugDescriptionFromObject();
    [v16 appendFormat:@"  datasource = %@\n", v31];
  }
  v32 = [(MRDNowPlayingOriginClient *)self defaultSupportedCommands];
  if ([v32 count])
  {
    uint64_t v33 = (void *)MRMediaRemoteCopyReadableDictionaryDescription();
    v34 = MRCreateIndentedDebugDescriptionFromObject();
    [v16 appendFormat:@"  default supportedCommands = %@\n", v34];
  }
  if ([(NSMutableArray *)self->_nowPlayingClients count])
  {
    nowPlayingClients = self->_nowPlayingClients;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1000BB760;
    v39[3] = &unk_10041B020;
    v39[4] = self;
    v36 = [(NSMutableArray *)nowPlayingClients sortedArrayUsingComparator:v39];
    v37 = MRCreateIndentedDebugDescriptionFromArray();
    [v16 appendFormat:@"all now playing clients = %@\n", v37];
  }

  return (NSString *)v16;
}

- (NSArray)activePlayerClients
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  CFStringRef v9 = sub_1000BB930;
  CFStringRef v10 = sub_1000BB940;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000BB948;
  v5[3] = &unk_100415CF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (MRPlayerPath)activePlayerPath
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  CFStringRef v9 = sub_1000BB930;
  CFStringRef v10 = sub_1000BB940;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000BBA84;
  v5[3] = &unk_100415CF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRPlayerPath *)v3;
}

- (void)setDeviceInfo:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

- (NSData)deviceInfoData
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  CFStringRef v9 = sub_1000BB930;
  CFStringRef v10 = sub_1000BB940;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000BBF20;
  v5[3] = &unk_100415940;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSData *)v3;
}

- (float)volume
{
  uint64_t v4 = 0;
  uint64_t v5 = (float *)&v4;
  uint64_t v6 = 0x2020000000;
  int v7 = 0;
  msv_dispatch_sync_on_queue();
  float v2 = v5[6];
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (void)setVolume:(float)a3
{
}

- (unsigned)volumeControlCapabilities
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  int v7 = 0;
  msv_dispatch_sync_on_queue();
  unsigned int v2 = *((_DWORD *)v5 + 6);
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (void)setVolumeControlCapabilities:(unsigned int)a3
{
}

- (BOOL)isMuted
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  msv_dispatch_sync_on_queue();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (void)setIsMuted:(BOOL)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000BC490;
  v4[3] = &unk_100417720;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync((dispatch_queue_t)serialQueue, v4);
}

- (NSArray)nowPlayingClients
{
  id v6 = objc_alloc_init((Class)NSMutableSet);
  id v2 = v6;
  msv_dispatch_sync_on_queue();
  id v3 = objc_msgSend(v2, "allObjects", _NSConcreteStackBlock, 3221225472, sub_1000BC748, &unk_1004158D8, self);

  return (NSArray *)v3;
}

- (NSArray)mostRecentPlayers
{
  id v4 = objc_alloc_init((Class)NSMutableArray);
  msv_dispatch_sync_on_queue();
  id v2 = (NSArray *)v4;

  return v2;
}

- (void)setComputedNowPlayingClient:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

- (void)setExplicitNowPlayingClient:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

- (void)setInferredNowPlayingClient:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

- (void)setOverrideClient:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

- (void)setActivity:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

- (BOOL)isActivityActive
{
  uint64_t v4 = 0;
  BOOL v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  msv_dispatch_sync_on_queue();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (BOOL)isPlaying
{
  uint64_t v4 = 0;
  BOOL v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  msv_dispatch_sync_on_queue();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (double)timeSincePlaying
{
  uint64_t v4 = 0;
  BOOL v5 = (double *)&v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  msv_dispatch_sync_on_queue();
  double v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (double)timeSincePlaybackStarted
{
  uint64_t v4 = 0;
  BOOL v5 = (double *)&v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  msv_dispatch_sync_on_queue();
  double v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (id)nowPlayingClientForClient:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)MRPlayerPath);
  [v5 setOrigin:self->_origin];
  [v5 setClient:v4];

  uint64_t v6 = [(MRDNowPlayingOriginClient *)self nowPlayingClientForPlayerPath:v5];

  return v6;
}

- (id)nowPlayingClientForPlayerPath:(id)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  CFStringRef v9 = sub_1000BB930;
  CFStringRef v10 = sub_1000BB940;
  id v11 = 0;
  id v5 = a3;
  msv_dispatch_sync_on_queue();
  id v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)existingNowPlayingClientForPlayerPath:(id)a3
{
  id v4 = [a3 client];
  id v5 = [(MRDNowPlayingOriginClient *)self existingNowPlayingClientForClient:v4];

  return v5;
}

- (id)existingNowPlayingClientForPid:(int)a3
{
  id v4 = [objc_alloc((Class)MRClient) initWithProcessIdentifier:*(void *)&a3 bundleIdentifier:0];
  id v5 = [(MRDNowPlayingOriginClient *)self existingNowPlayingClientForClient:v4];

  return v5;
}

- (id)existingNowPlayingClientForDisplayID:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)MRClient) initWithProcessIdentifier:0 bundleIdentifier:v4];

  uint64_t v6 = [(MRDNowPlayingOriginClient *)self existingNowPlayingClientForClient:v5];

  return v6;
}

- (void)removeAllClients
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BE414;
  block[3] = &unk_100415CC8;
  void block[4] = self;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
}

- (void)removeNowPlayingClientForClient:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

- (void)_onQueue_removeNowPlayingClient:(id)a3
{
  id v4 = (MRDNowPlayingClient *)a3;
  id v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(MRDNowPlayingClient *)v4 client];
    playerPath = self->_playerPath;
    *(_DWORD *)buf = 138543618;
    uint64_t v28 = v6;
    __int16 v29 = 2114;
    v30 = playerPath;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MRDNowPlayingOriginClient] Removing nowPlayingClient %{public}@ for %{public}@", buf, 0x16u);
  }
  uint64_t v8 = [(MRDNowPlayingClient *)v4 playerClients];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [*(id *)(*((void *)&v22 + 1) + 8 * (void)v12) player];
        [(MRDNowPlayingClient *)v4 removePlayerClientForPlayer:v13];

        uint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained nowPlayingOriginClient:self clientDidUnregister:v4];

  [(NSMutableArray *)self->_nowPlayingClients removeObject:v4];
  v15 = [(MRDNowPlayingClient *)v4 client];
  unsigned int v16 = [(MRDMediaRemoteClient *)self->_overrideClient pid];
  if (v16 == [v15 processIdentifier]) {
    [(MRDNowPlayingOriginClient *)self setOverrideClient:0];
  }
  if (self->_explicitNowPlayingClient == v4) {
    [(MRDNowPlayingOriginClient *)self setExplicitNowPlayingClient:0];
  }
  if (self->_inferredNowPlayingClient == v4) {
    [(MRDNowPlayingOriginClient *)self setInferredNowPlayingClient:0];
  }
  if (self->_computedNowPlayingClient == v4)
  {
    dispatch_queue_t v17 = [(MRDNowPlayingOriginClient *)self _onQueue_calculateComputedNowPlayingClient];
    [(MRDNowPlayingOriginClient *)self setComputedNowPlayingClient:v17];
  }
  activity = self->_activity;
  if (activity)
  {
    unsigned int v19 = [(MRMutableApplicationActivity *)activity creatorProcessID];
    v20 = [(MRDNowPlayingClient *)v4 client];
    unsigned int v21 = [v20 processIdentifier];

    if (v19 == v21) {
      [(MRDNowPlayingOriginClient *)self setActivity:0];
    }
  }
}

- (void)updateDefaultSupportedCommandsData:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BE994;
  block[3] = &unk_1004159B8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
}

- (id)defaultSupportedCommandsDataForClient:(id)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1000BB930;
  id v10 = sub_1000BB940;
  id v11 = 0;
  id v5 = a3;
  msv_dispatch_sync_on_queue();
  id v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)defaultSupportedCommandsForClient:(id)a3
{
  id v3 = [(MRDNowPlayingOriginClient *)self defaultSupportedCommandsDataForClient:a3];
  id v4 = +[MRCommandInfo commandInfosFromData:v3];

  return v4;
}

- (NSDictionary)defaultSupportedCommands
{
  uint64_t v20 = 0;
  unsigned int v21 = &v20;
  uint64_t v22 = 0x3032000000;
  long long v23 = sub_1000BB930;
  long long v24 = sub_1000BB940;
  id v25 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BEE58;
  block[3] = &unk_100415940;
  void block[4] = self;
  void block[5] = &v20;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  uint64_t v15 = 0;
  unsigned int v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = (void *)v21[5];
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_1000BEEF4;
  id v12 = &unk_10041B068;
  id v5 = v3;
  id v13 = v5;
  uint64_t v14 = &v15;
  [v4 enumerateKeysAndObjectsUsingBlock:&v9];
  if (!*((unsigned char *)v16 + 24))
  {
    uint64_t v6 = (void *)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
    id v7 = (void *)MRMediaRemoteCopySystemMediaApplicationDefaultSupportedCommands();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v6, v9, v10, v11, v12);
  }
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v20, 8);

  return (NSDictionary *)v5;
}

- (void)clearDefaultSupportedCommandsData
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BEFF0;
  block[3] = &unk_100415CC8;
  void block[4] = self;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
}

- (void)updateLastPlayingDate:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000BF094;
  v7[3] = &unk_1004158D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, v7);
}

- (NSArray)nowPlayingAudioFormatContentInfos
{
  double v2 = [(MRDNowPlayingDataSource *)self->_nowPlayingDataSource nowPlayingAudioFormatContentInfos];
  id v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (void)setDevicePlaybackSessionID:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000BF1C0;
  v7[3] = &unk_1004158D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, v7);
}

- (void)registerCreateNewApplicationConnectionCallback:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000BF264;
  v7[3] = &unk_100416988;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async_and_wait((dispatch_queue_t)serialQueue, v7);
}

- (void)registerApplicationConnectionOutgoingMessageCallback:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000BF340;
  v7[3] = &unk_100416988;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async_and_wait((dispatch_queue_t)serialQueue, v7);
}

- (void)setNowPlayingDataSource:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_nowPlayingDataSource, a3);
  [(MRDNowPlayingDataSource *)self->_nowPlayingDataSource addObserver:self];
  if (self->_nowPlayingDataSource)
  {
    serialQueue = self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000BF438;
    block[3] = &unk_100415CC8;
    void block[4] = self;
    dispatch_async((dispatch_queue_t)serialQueue, block);
  }
}

- (void)nowPlayingDataSourceNowPlayingApplicationDidChange:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000BF4E4;
  v7[3] = &unk_1004158D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)serialQueue, v7);
}

- (void)nowPlayingDataSourceNowPlayingApplicationPlaybackStateDidChange:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000BF590;
  v7[3] = &unk_1004158D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)serialQueue, v7);
}

- (void)nowPlayingDataSourceNowPlayingApplicationsPlaybackStateDidChange:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000BF63C;
  v7[3] = &unk_1004158D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)serialQueue, v7);
}

- (void)nowPlayingDataSourceNowPlayingSessionsPlaybackStateDidChange:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000BF6E8;
  v7[3] = &unk_1004158D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)serialQueue, v7);
}

- (void)nowPlayingDataSourceNowPlayingAudioFormatContentInfosDidChange:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 nowPlayingOriginClientDidChangeAudioFormatContentInfo:self];
  }
}

- (void)_onQueue_reloadInferredStateFromDataSource:(id)a3 reason:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (a3)
  {
    id v20 = v6;
    id v8 = [(MRDNowPlayingOriginClient *)self _onQueue_calculateInferredNowPlayingClient];
    [(MRDNowPlayingOriginClient *)self setInferredNowPlayingClient:v8];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v9 = self->_nowPlayingClients;
    id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v26;
      do
      {
        id v13 = 0;
        do
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v13);
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          uint64_t v15 = [v14 playerClients];
          id v16 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v22;
            do
            {
              unsigned int v19 = 0;
              do
              {
                if (*(void *)v22 != v18) {
                  objc_enumerationMutation(v15);
                }
                objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * (void)v19), "setInferredPlaybackState:", -[MRDNowPlayingOriginClient _onQueue_calculateInferredPlaybackStateForPlayer:](self, "_onQueue_calculateInferredPlaybackStateForPlayer:", *(void *)(*((void *)&v21 + 1) + 8 * (void)v19)));
                unsigned int v19 = (char *)v19 + 1;
              }
              while (v17 != v19);
              id v17 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
            }
            while (v17);
          }

          id v13 = (char *)v13 + 1;
        }
        while (v13 != v11);
        id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v11);
    }

    id v7 = v20;
    [(MRDNowPlayingOriginClient *)self _onQueue_reevaluateStateWithReason:v20];
  }
}

- (void)deviceInfoDataSource:(id)a3 deviceInfoDidChange:(id)a4
{
  id v7 = a4;
  id v5 = [(MRDNowPlayingOriginClient *)self origin];
  unsigned int v6 = [v5 isLocal];

  if (v6) {
    [(MRDNowPlayingOriginClient *)self setDeviceInfo:v7];
  }
}

- (void)_handleNowPlayingAppMaybeDidChange:(id)a3
{
  id v4 = a3;
  if ([(MRDNowPlayingOriginClient *)self _shouldHandleNotification:v4])
  {
    serialQueue = self->_serialQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000BFAA0;
    v6[3] = &unk_1004158D8;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync((dispatch_queue_t)serialQueue, v6);
  }
}

- (void)_handlePlayerIsPlayingDidChange:(id)a3
{
  id v4 = a3;
  if ([(MRDNowPlayingOriginClient *)self _shouldHandleNotification:v4])
  {
    serialQueue = self->_serialQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000BFC30;
    v6[3] = &unk_1004158D8;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync((dispatch_queue_t)serialQueue, v6);
  }
}

- (void)_handleOriginIsPlayingDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  unsigned int v6 = MRGetOriginFromUserInfo();

  if ([v6 isLocal])
  {
    serialQueue = self->_serialQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000BFD88;
    v8[3] = &unk_1004158D8;
    v8[4] = self;
    id v9 = v4;
    dispatch_sync((dispatch_queue_t)serialQueue, v8);
  }
}

- (void)_handlePlayerPropertiesDidChange:(id)a3
{
  if (self->_nowPlayingDataSource)
  {
    id v4 = a3;
    id v5 = objc_alloc((Class)NSString);
    unsigned int v6 = [v4 name];
    id v7 = [v4 userInfo];

    id v8 = MRGetPlayerPathFromUserInfo();
    id v9 = [v5 initWithFormat:@"%@-%@", v6, v8];

    serialQueue = self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000BFEB4;
    block[3] = &unk_1004158D8;
    void block[4] = self;
    id v13 = v9;
    id v11 = v9;
    dispatch_async((dispatch_queue_t)serialQueue, block);
  }
}

- (void)_handlePlayerPictureInPictureEnabledDidChange:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = MRGetOriginFromUserInfo();

  if ([v5 isEqual:self->_origin])
  {
    serialQueue = self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000BFF7C;
    block[3] = &unk_100415CC8;
    void block[4] = self;
    dispatch_sync((dispatch_queue_t)serialQueue, block);
  }
}

- (void)_handleActivePlayerDidChange:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = MRGetOriginFromUserInfo();

  if ([v5 isEqual:self->_origin])
  {
    serialQueue = self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000C0044;
    block[3] = &unk_100415CC8;
    void block[4] = self;
    dispatch_sync((dispatch_queue_t)serialQueue, block);
  }
}

- (void)_handleNowPlayingApplicationDidUnregisterCanBeNowPlaying:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = MRGetOriginFromUserInfo();

  if ([v5 isEqual:self->_origin])
  {
    serialQueue = self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000C010C;
    block[3] = &unk_100415CC8;
    void block[4] = self;
    dispatch_sync((dispatch_queue_t)serialQueue, block);
  }
}

- (void)_handlePlayerDidRegister:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_nowPlayingDataSource)
  {
    unsigned int v6 = [v4 userInfo];
    id v7 = MRGetOriginFromUserInfo();

    if ([v7 isEqual:self->_origin])
    {
      id v8 = objc_alloc((Class)NSString);
      id v9 = [v5 name];
      id v10 = [v5 userInfo];
      id v11 = MRGetPlayerPathFromUserInfo();
      id v12 = [v8 initWithFormat:@"%@-%@", v9, v11];

      serialQueue = self->_serialQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000C0270;
      block[3] = &unk_1004158D8;
      void block[4] = self;
      id v16 = v12;
      id v14 = v12;
      dispatch_sync((dispatch_queue_t)serialQueue, block);
    }
  }
}

- (BOOL)_shouldHandleNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  unsigned int v6 = MRGetOriginFromUserInfo();

  if ([v6 isEqual:self->_origin])
  {
    id v7 = [v4 userInfo];
    id v8 = [v7 objectForKeyedSubscript:_MRMediaRemoteIsImplicitNowPlayingNotificationUserInfoKey];
    unsigned __int8 v9 = [v8 BOOLValue];

    char v10 = v9 ^ 1;
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)_onQueue_calculateActiveNowPlayingClient
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  overrideClient = self->_overrideClient;
  if (overrideClient)
  {
    id v4 = [(MRDNowPlayingOriginClient *)self existingNowPlayingClientForPid:[(MRDMediaRemoteClient *)overrideClient pid]];
    goto LABEL_3;
  }
  explicitNowPlayingClient = self->_explicitNowPlayingClient;
  if (!explicitNowPlayingClient)
  {
    if (self->_computedNowPlayingClient
      && (+[MRUserSettings currentSettings],
          id v7 = objc_claimAutoreleasedReturnValue(),
          unsigned int v8 = [v7 computeNowPlayingApplication],
          v7,
          v8))
    {
      explicitNowPlayingClient = self->_computedNowPlayingClient;
    }
    else
    {
      explicitNowPlayingClient = self->_inferredNowPlayingClient;
      if (!explicitNowPlayingClient)
      {
        id v4 = 0;
        goto LABEL_12;
      }
    }
  }
  id v4 = explicitNowPlayingClient;
LABEL_12:
  if (self->_activity)
  {
    [(MRDNowPlayingOriginClient *)self timeSincePlaying];
    double v10 = v9;
    id v11 = +[MRUserSettings currentSettings];
    [v11 mediaRecentlyPlayedInterval];
    double v13 = v12;

    if (v10 > v13)
    {
      id v14 = objc_msgSend(objc_alloc((Class)MRClient), "initWithProcessIdentifier:bundleIdentifier:", -[MRMutableApplicationActivity creatorProcessID](self->_activity, "creatorProcessID"), 0);
      uint64_t v15 = [(MRDNowPlayingOriginClient *)self nowPlayingClientForClient:v14];

      id v4 = (MRDNowPlayingClient *)v15;
    }
  }
LABEL_3:

  return v4;
}

- (id)_onQueue_calculateComputedNowPlayingClient
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v3 = [(MRDNowPlayingOriginClient *)self mostRecentPlayers];
  id v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      double v9 = 0;
      do
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v9);
        if (objc_msgSend(v10, "isPlaying", (void)v27)) {
          goto LABEL_13;
        }
        id v11 = [v10 playerPath];
        double v12 = [v11 client];
        double v13 = [(MRDNowPlayingOriginClient *)self nowPlayingClientForClient:v12];

        if (v13 == self->_computedNowPlayingClient || v13 == self->_inferredNowPlayingClient) {
          goto LABEL_12;
        }
        id v14 = [v10 snapshotForIsPlaying:0];
        uint64_t v15 = [v14 date];

        if (!v15) {
          goto LABEL_11;
        }
        id v16 = +[NSDate date];
        [v16 timeIntervalSinceDate:v15];
        double v18 = v17;

        unsigned int v19 = +[MRUserSettings currentSettings];
        [v19 nowPlayingApplicationTimeout];
        double v21 = v20;

        if (v18 <= v21)
        {
LABEL_11:

LABEL_12:
LABEL_13:
          double v13 = [v10 playerPath];
          [v4 addObject:v13];
          goto LABEL_14;
        }

LABEL_14:
        double v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v22 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
      id v7 = v22;
    }
    while (v22);
  }

  long long v23 = [v4 firstObject];
  long long v24 = [v23 client];
  long long v25 = [(MRDNowPlayingOriginClient *)self nowPlayingClientForClient:v24];

  return v25;
}

- (id)_onQueue_calculateInferredNowPlayingClient
{
  double v2 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v3 = v2->_nowPlayingDataSource;
  id v4 = +[MRUserSettings currentSettings];
  unsigned int v5 = [v4 supportNowPlayingPIP];

  id v6 = &_sSS10FoundationE19_bridgeToObjectiveCSo8NSStringCyF_ptr_0;
  if (!v5)
  {
LABEL_20:
    id v26 = objc_alloc((Class)v6[357]);
    id v27 = (id)[(MRDNowPlayingDataSource *)v3 nowPlayingApplicationPID];
    long long v28 = [(MRDNowPlayingDataSource *)v3 nowPlayingApplicationDisplayID];
    id v29 = [v26 initWithProcessIdentifier:v27 bundleIdentifier:v28];

    id v33 = [(MRDNowPlayingOriginClient *)v2 existingNowPlayingClientForClient:v29];

    goto LABEL_21;
  }
  id v7 = [(MRDNowPlayingDataSource *)v3 nowPlayingApplications];
  uint64_t v8 = [v7 allValues];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (!v10)
  {

    goto LABEL_20;
  }
  id v11 = v10;
  unsigned int v31 = v3;
  uint64_t v12 = *(void *)v35;
  uint64_t v32 = *(void *)v35;
  id v33 = 0;
  do
  {
    for (i = 0; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v35 != v12) {
        objc_enumerationMutation(v9);
      }
      id v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
      id v15 = objc_alloc((Class)v6[357]);
      id v16 = [v14 pid];
      double v17 = [v14 nowPlayingApplicationDisplayID];
      id v18 = [v15 initWithProcessIdentifier:v16 bundleIdentifier:v17];

      unsigned int v19 = [(MRDNowPlayingOriginClient *)v2 existingNowPlayingClientForClient:v18];
      if ([v14 isEligible])
      {
        double v20 = [v19 activePlayerClient];
        if ([v20 canBeNowPlayingPlayer])
        {
          id v21 = v9;
          id v22 = v2;
          long long v23 = v6;
          if (v33)
          {
            long long v24 = [v33 activePlayerClient];
            unsigned int v25 = [v24 isPictureInPictureEnabled];

            if (!v25)
            {
              id v6 = v23;
              double v2 = v22;
              id v9 = v21;
              uint64_t v12 = v32;
              goto LABEL_15;
            }
          }
          else
          {
          }
          double v20 = v33;
          id v33 = v19;
          id v6 = v23;
          double v2 = v22;
          id v9 = v21;
          uint64_t v12 = v32;
        }
      }
LABEL_15:
    }
    id v11 = [v9 countByEnumeratingWithState:&v34 objects:v38 count:16];
  }
  while (v11);

  id v3 = v31;
  if (!v33) {
    goto LABEL_20;
  }
LABEL_21:

  return v33;
}

- (unsigned)_onQueue_calculateInferredPlaybackStateForPlayer:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  unsigned int v5 = self->_nowPlayingDataSource;
  id v6 = +[MRUserSettings currentSettings];
  unsigned int v7 = [v6 supportMultiplayerHost];

  if (v7)
  {
    uint64_t v8 = [(MRDNowPlayingDataSource *)v5 nowPlayingSessions];
    id v9 = [v4 player];
    id v10 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v9 audioSessionID]);
    id v11 = [v8 objectForKeyedSubscript:v10];

    if ([v11 isPlaying]) {
      unsigned int v12 = 1;
    }
    else {
      unsigned int v12 = 2;
    }

    goto LABEL_32;
  }
  double v13 = +[MRUserSettings currentSettings];
  if ([v13 supportNowPlayingPIP])
  {
    id v14 = [v4 player];
    id v15 = [v14 mxSessionIDs];
    id v16 = [v15 count];

    if (v16)
    {
      double v17 = +[NSMutableSet set];
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v35 = v5;
      id v18 = [(MRDNowPlayingDataSource *)v5 nowPlayingApplications];
      unsigned int v19 = [v18 allValues];

      id v20 = [v19 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (!v20) {
        goto LABEL_20;
      }
      id v21 = v20;
      uint64_t v22 = *(void *)v37;
      while (1)
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v37 != v22) {
            objc_enumerationMutation(v19);
          }
          long long v24 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          unsigned int v25 = [v4 playerPath];
          id v26 = [v25 client];
          unsigned int v27 = [v26 processIdentifier];
          if (v27 == [v24 pid])
          {
            long long v28 = [v24 mxSessionIDs];

            if (!v28) {
              continue;
            }
            unsigned int v25 = [v24 mxSessionIDs];
            [v17 unionSet:v25];
          }
          else
          {
          }
        }
        id v21 = [v19 countByEnumeratingWithState:&v36 objects:v40 count:16];
        if (!v21)
        {
LABEL_20:

          unsigned int v5 = v35;
          if ([(MRDNowPlayingDataSource *)v35 nowPlayingApplicationIsInterrupted]) {
            int v29 = 4;
          }
          else {
            int v29 = 1;
          }
          long long v30 = [v4 player];
          unsigned int v31 = [v30 mxSessionIDs];
          if ([v17 intersectsSet:v31]) {
            unsigned int v12 = v29;
          }
          else {
            unsigned int v12 = 2;
          }

          goto LABEL_32;
        }
      }
    }
  }
  else
  {
  }
  uint64_t v32 = [(MRDNowPlayingOriginClient *)self inferredNowPlayingClient];
  id v33 = [v32 activePlayerClient];
  if (v33 == v4) {
    unsigned int v12 = [(MRDNowPlayingOriginClient *)self _stateFromDataSource:v5];
  }
  else {
    unsigned int v12 = 2;
  }

LABEL_32:
  return v12;
}

- (id)_onQueue_calculateActiveNowPlayingPlayerClients
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v3 = objc_alloc_init((Class)NSMutableSet);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [(MRDNowPlayingOriginClient *)self nowPlayingClients];
  id v20 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v27;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = v4;
        unsigned int v5 = *(void **)(*((void *)&v26 + 1) + 8 * v4);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v6 = [v5 playerClients];
        id v7 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v23;
          do
          {
            for (i = 0; i != v8; i = (char *)i + 1)
            {
              if (*(void *)v23 != v9) {
                objc_enumerationMutation(v6);
              }
              id v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
              unsigned int v12 = [(MRDNowPlayingOriginClient *)self activeNowPlayingClient];
              uint64_t v13 = [v12 activePlayerClient];
              if ((void *)v13 == v11)
              {

LABEL_15:
                [v3 addObject:v11];
                continue;
              }
              id v14 = (void *)v13;
              unsigned __int8 v15 = [v11 isPictureInPictureEnabled];

              if (v15) {
                goto LABEL_15;
              }
            }
            id v8 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v8);
        }

        uint64_t v4 = v21 + 1;
      }
      while ((id)(v21 + 1) != v20);
      id v20 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v20);
  }

  id v16 = [v3 copy];

  return v16;
}

- (void)_onQueue_reevaluateStateWithReason:(id)a3
{
  id v4 = a3;
  unsigned int v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10032DC14((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  unsigned int v12 = [(MRDNowPlayingOriginClient *)self _playerPathForNowPlayingClient:self->_activeNowPlayingClient];
  uint64_t v13 = [(MRDNowPlayingOriginClient *)self _onQueue_calculateActiveNowPlayingClient];
  id v14 = [(MRDNowPlayingOriginClient *)self _playerPathForNowPlayingClient:v13];
  if (v13 == self->_activeNowPlayingClient) {
    goto LABEL_21;
  }
  unsigned __int8 v15 = _MRLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v55 = v12;
    __int16 v56 = 2114;
    v57 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[MRDNowPlayingOriginClient] ActiveNowPlayingClient changed from %{public}@ to %{public}@", buf, 0x16u);
  }

  objc_storeStrong((id *)&self->_activeNowPlayingClient, v13);
  if (!self->_activeNowPlayingClient)
  {
    long long v27 = _MRLogForCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      sub_10032DB34((uint64_t)self, v27, v28, v29, v30, v31, v32, v33);
    }

    activeNowPlayingClientTransaction = self->_activeNowPlayingClientTransaction;
    self->_activeNowPlayingClientTransaction = 0;
    goto LABEL_14;
  }
  if (!self->_activeNowPlayingClientTransaction)
  {
    id v16 = _MRLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_10032DBA4((uint64_t)self, v16, v17, v18, v19, v20, v21, v22);
    }

    long long v23 = [(MRPlayerPath *)self->_playerPath description];
    activeNowPlayingClientTransaction = +[NSString stringWithFormat:@"com.apple.mediaremoted.MRDNowPlayingOriginClient/%@", v23];

    long long v25 = (MROSTransaction *)[objc_alloc((Class)MROSTransaction) initWithName:activeNowPlayingClientTransaction];
    long long v26 = self->_activeNowPlayingClientTransaction;
    self->_activeNowPlayingClientTransaction = v25;

    MRRegisterTransaction();
LABEL_14:
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v35 = [v14 copy];
  long long v36 = [(MRDNowPlayingClient *)self->_activeNowPlayingClient activePlayerClient];
  objc_msgSend(WeakRetained, "nowPlayingOriginClient:activePlayerPathDidChange:withPlaybackState:", self, v35, objc_msgSend(v36, "playbackState"));

  if (!self->_activity) {
    goto LABEL_21;
  }
  long long v37 = [v12 client];
  unsigned int v38 = [v37 processIdentifier];
  unsigned int v39 = [(MRMutableApplicationActivity *)self->_activity creatorProcessID];

  if (v38 == v39)
  {
    uint64_t v40 = 4;
  }
  else
  {
    v41 = [(MRDNowPlayingClient *)self->_activeNowPlayingClient client];
    unsigned int v42 = [v41 processIdentifier];
    unsigned int v43 = [(MRMutableApplicationActivity *)self->_activity creatorProcessID];

    if (v42 != v43) {
      goto LABEL_21;
    }
    uint64_t v40 = 2;
  }
  [(MRDNowPlayingOriginClient *)self _onQueue_updateActivityStatus:v40];
LABEL_21:
  v44 = [(MRDNowPlayingOriginClient *)self _onQueue_calculateActiveNowPlayingPlayerClients];
  v45 = +[NSSet setWithArray:self->_activePlayerClients];
  unsigned __int8 v46 = [v45 isEqualToSet:v44];

  if ((v46 & 1) == 0)
  {
    v47 = _MRLogForCategory();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v48 = [(NSArray *)self->_activePlayerClients mr_map:&stru_10041B0A8];
      v49 = [v44 allObjects];
      v50 = objc_msgSend(v49, "mr_map:", &stru_10041B0C8);
      *(_DWORD *)buf = 138543618;
      v55 = v48;
      __int16 v56 = 2114;
      v57 = v50;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "[MRDNowPlayingOriginClient] ActiveNowPlayingPlayersClients changed from %{public}@ to %{public}@", buf, 0x16u);
    }
    v51 = [v44 allObjects];
    activePlayerClients = self->_activePlayerClients;
    self->_activePlayerClients = v51;

    id v53 = objc_loadWeakRetained((id *)&self->_delegate);
    [v53 nowPlayingOriginClient:self activePlayerClientsDidChange:self->_activePlayerClients];
  }
}

- (void)_onQueue_updateActivityStatus:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  activity = self->_activity;
  if (activity && [(MRMutableApplicationActivity *)activity status] != v3)
  {
    [(MRMutableApplicationActivity *)self->_activity setStatus:v3];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v6 = [(MRMutableApplicationActivity *)self->_activity copy];
    [WeakRetained nowPlayingOriginClient:self applicationActivityStatusDidChange:v6];
  }
}

- (id)_onQueue_addNowPlayingClient:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  unsigned int v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MRDNowPlayingOriginClient] Creating nowPlayingClient for %{public}@", buf, 0xCu);
  }

  id v6 = [[MRDNowPlayingClient alloc] initWithPlayerPath:v4];
  uint64_t v7 = +[MRDMediaRemoteServer server];
  uint64_t v8 = [v7 nowPlayingServer];
  [(MRDNowPlayingClient *)v6 setDelegate:v8];

  nowPlayingClients = self->_nowPlayingClients;
  if (!nowPlayingClients)
  {
    uint64_t v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    uint64_t v11 = self->_nowPlayingClients;
    self->_nowPlayingClients = v10;

    nowPlayingClients = self->_nowPlayingClients;
  }
  [(NSMutableArray *)nowPlayingClients addObject:v6];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained nowPlayingOriginClient:self clientDidRegister:v6];

  [(MRDNowPlayingClient *)v6 initializeDisplayName];
  uint64_t v13 = [v4 player];
  id v14 = [(MRDNowPlayingClient *)v6 playerClientForPlayer:v13];

  nowPlayingDataSource = self->_nowPlayingDataSource;
  id v16 = objc_alloc((Class)NSString);
  uint64_t v17 = [v14 playerPath];
  id v18 = [v16 initWithFormat:@"addNowPlayingClient-%@", v17];
  [(MRDNowPlayingOriginClient *)self _onQueue_reloadInferredStateFromDataSource:nowPlayingDataSource reason:v18];

  return v6;
}

- (void)_onQueue_maybeSetupPlaybackTimeoutTimerForNotification:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000C18B8;
  v25[3] = &unk_10041B0F0;
  v25[4] = self;
  if (sub_1000C18B8((uint64_t)v25))
  {
    unsigned int v5 = [(MRDNowPlayingClient *)self->_activeNowPlayingClient activePlayerClient];
    if ([v5 isPlaying])
    {
      playbackTimer = self->_playbackTimer;
      id v7 = objc_alloc((Class)NSString);
      uint64_t v8 = [v5 playerPath];
      uint64_t v9 = [v4 name];
      id v10 = [v7 initWithFormat:@"%@ is playing for notification <%@>", v8, v9];
      [(MRPersistentTimer *)playbackTimer invalidateWithReason:v10];
    }
    else
    {
      [(MRDNowPlayingOriginClient *)self timeSincePlaying];
      double v12 = v11;
      uint64_t v13 = +[MRUserSettings currentSettings];
      [v13 mediaRecentlyPlayedInterval];
      double v15 = v14 + 5.0;

      if (v12 < v15)
      {
        id v16 = objc_alloc((Class)MRPersistentTimer);
        serialQueue = self->_serialQueue;
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_1000C1950;
        v23[3] = &unk_1004158D8;
        v23[4] = self;
        id v24 = v4;
        id v18 = (MRPersistentTimer *)[v16 initWithInterval:@"com.apple.mediaremote.originclient.playbacktimer" name:serialQueue queue:v23 block:v15 - v12];
        uint64_t v19 = self->_playbackTimer;
        self->_playbackTimer = v18;

LABEL_8:
        goto LABEL_9;
      }
      uint64_t v20 = self->_playbackTimer;
      id v21 = objc_alloc((Class)NSString);
      uint64_t v8 = [v5 playerPath];
      id v22 = [v21 initWithFormat:@"%@ was not playing recently", v8];
      [(MRPersistentTimer *)v20 invalidateWithReason:v22];
    }
    goto LABEL_8;
  }
LABEL_9:
}

- (void)_onQueue_maybeSavePlaybackStateForNotification:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v4 = [(MRDNowPlayingClient *)self->_activeNowPlayingClient activePlayerClient];
  unsigned int v5 = [v4 playbackState];
  id v6 = +[MRUserSettings currentSettings];
  unsigned int v7 = [v6 localPlaybackState];

  uint64_t v8 = self->_lastPlayingDate;
  if (v7 != v5)
  {
    if (qword_10047E0F8 != -1) {
      dispatch_once(&qword_10047E0F8, &stru_10041B110);
    }
    uint64_t v9 = qword_10047E0F0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000C1BE8;
    v10[3] = &unk_1004165E8;
    unsigned int v12 = v5;
    unsigned int v13 = v7;
    double v11 = v8;
    dispatch_async(v9, v10);
  }
}

- (void)_registerCallbacks
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  uint64_t v4 = kMRMediaRemotePlayerIsPlayingDidChangeNotification;
  [v3 addObserver:self selector:"_handleNowPlayingAppMaybeDidChange:" name:kMRMediaRemotePlayerIsPlayingDidChangeNotification object:0];

  unsigned int v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_handleNowPlayingAppMaybeDidChange:" name:kMRMediaRemoteNowPlayingApplicationDidRegisterCanBeNowPlaying object:0];

  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"_handleNowPlayingAppMaybeDidChange:" name:kMRMediaRemoteNowPlayingApplicationDidUnregisterCanBeNowPlaying object:0];

  unsigned int v7 = +[NSNotificationCenter defaultCenter];
  uint64_t v8 = kMRMediaRemoteNowPlayingPlayerDidRegister;
  [v7 addObserver:self selector:"_handleNowPlayingAppMaybeDidChange:" name:kMRMediaRemoteNowPlayingPlayerDidRegister object:0];

  uint64_t v9 = +[NSNotificationCenter defaultCenter];
  uint64_t v10 = kMRMediaRemoteNowPlayingPlayerDidUnregister;
  [v9 addObserver:self selector:"_handleNowPlayingAppMaybeDidChange:" name:kMRMediaRemoteNowPlayingPlayerDidUnregister object:0];

  double v11 = +[NSNotificationCenter defaultCenter];
  [v11 addObserver:self selector:"_handlePlayerIsPlayingDidChange:" name:v4 object:0];

  unsigned int v12 = +[NSNotificationCenter defaultCenter];
  [v12 addObserver:self selector:"_handleOriginIsPlayingDidChange:" name:kMRMediaRemoteOriginNowPlayingApplicationIsPlayingDidChangeNotification object:0];

  unsigned int v13 = +[NSNotificationCenter defaultCenter];
  [v13 addObserver:self selector:"_handlePlayerPropertiesDidChange:" name:kMRMediaRemotePlayerStateDidChange object:0];

  double v14 = +[NSNotificationCenter defaultCenter];
  [v14 addObserver:self selector:"_handlePlayerPictureInPictureEnabledDidChange:" name:kMRMediaRemotePlayerPictureInPictureDidChange object:0];

  double v15 = +[NSNotificationCenter defaultCenter];
  [v15 addObserver:self selector:"_handleActivePlayerDidChange:" name:kMRMediaRemoteActivePlayerDidChange object:0];

  id v16 = +[NSNotificationCenter defaultCenter];
  [v16 addObserver:self selector:"_handleNowPlayingApplicationDidUnregisterCanBeNowPlaying:" name:v10 object:0];

  uint64_t v17 = +[NSNotificationCenter defaultCenter];
  [v17 addObserver:self selector:"_handlePlayerDidRegister:" name:v8 object:0];

  if ([(MROrigin *)self->_origin isLocal])
  {
    serialQueue = self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000C1F90;
    block[3] = &unk_100415CC8;
    void block[4] = self;
    dispatch_sync((dispatch_queue_t)serialQueue, block);
  }
}

- (unsigned)_stateFromDataSource:(id)a3
{
  id v3 = a3;
  if ([v3 nowPlayingApplicationIsPlaying]) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = 2;
  }
  unsigned int v5 = [v3 nowPlayingApplicationIsInterrupted];

  if (v5) {
    return 4;
  }
  else {
    return v4;
  }
}

- (id)_playerPathForNowPlayingClient:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 activePlayerClient];
  id v6 = [v5 playerPath];

  if (!v6)
  {
    id v6 = [v4 playerPath];
    if (!v6) {
      id v6 = [(MRPlayerPath *)self->_playerPath copy];
    }
  }

  return v6;
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (void)setDeviceInfoData:(id)a3
{
}

- (MRMutableApplicationActivity)activity
{
  return self->_activity;
}

- (MRDMediaRemoteClient)overrideClient
{
  return self->_overrideClient;
}

- (MRDNowPlayingClient)explicitNowPlayingClient
{
  return self->_explicitNowPlayingClient;
}

- (MRDNowPlayingDataSource)nowPlayingDataSource
{
  return self->_nowPlayingDataSource;
}

- (MRDDeviceInfoDataSource)deviceInfoDataSource
{
  return self->_deviceInfoDataSource;
}

- (NSString)devicePlaybackSessionID
{
  return self->_devicePlaybackSessionID;
}

- (NSDate)registrationDate
{
  return self->_registrationDate;
}

- (id)createNewApplicationConnectionCallback
{
  return self->_createNewApplicationConnectionCallback;
}

- (id)applicationConnectionOutgoingMessageCallback
{
  return self->_applicationConnectionOutgoingMessageCallback;
}

- (MRDNowPlayingOriginClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRDNowPlayingOriginClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MRDNowPlayingClient)computedNowPlayingClient
{
  return self->_computedNowPlayingClient;
}

- (MRDNowPlayingClient)inferredNowPlayingClient
{
  return self->_inferredNowPlayingClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inferredNowPlayingClient, 0);
  objc_storeStrong((id *)&self->_computedNowPlayingClient, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_applicationConnectionOutgoingMessageCallback, 0);
  objc_storeStrong(&self->_createNewApplicationConnectionCallback, 0);
  objc_storeStrong((id *)&self->_registrationDate, 0);
  objc_storeStrong((id *)&self->_devicePlaybackSessionID, 0);
  objc_storeStrong((id *)&self->_deviceInfoDataSource, 0);
  objc_storeStrong((id *)&self->_nowPlayingDataSource, 0);
  objc_storeStrong((id *)&self->_overrideClient, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_deviceInfoData, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_lastPlayingDate, 0);
  objc_storeStrong((id *)&self->_playbackTimer, 0);
  objc_storeStrong((id *)&self->_defaultSupportedCommandsData, 0);
  objc_storeStrong((id *)&self->_activeNowPlayingClientTransaction, 0);
  objc_storeStrong((id *)&self->_activeNowPlayingClient, 0);
  objc_storeStrong((id *)&self->_explicitNowPlayingClient, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_activePlayerClients, 0);
  objc_storeStrong((id *)&self->_nowPlayingClients, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end