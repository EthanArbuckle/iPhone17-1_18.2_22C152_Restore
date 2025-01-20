@interface MRDExternalDeviceServerClientConnection
- (BOOL)_wantsLibraryCommands;
- (BOOL)hasAccessToPlayerPath:(id)a3;
- (BOOL)isAllowedToSendCommand:(unsigned int)a3;
- (BOOL)isAllowedToSendMessageType:(unint64_t)a3;
- (BOOL)isDestinationLocal;
- (BOOL)removePendingPlaybackSessionMigrateEvent:(id)a3;
- (MRAVEndpoint)destinationEndpoint;
- (MRCoreUtilsPairingSessionPeer)sessionPeer;
- (MRDExternalDeviceServerClientConnection)initWithConnection:(id)a3 queue:(id)a4;
- (MRDExternalDeviceServerClientConnectionDelegate)serverDelegate;
- (MRPasscodeCredentials)credentials;
- (MRPlaybackQueueClient)playbackQueueRequests;
- (NSArray)discoverySessionConfigurations;
- (NSArray)registeredVirtualVoiceInputDevices;
- (NSArray)virtualTouchDevices;
- (NSDictionary)connectUserInfo;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)destinationGroupUID;
- (NSString)destinationOutputDeviceUID;
- (id)exportContentItemArtworkUpdates:(id)a3 forPlayerPath:(id)a4;
- (id)exportContentItems:(id)a3 forPlayerPath:(id)a4;
- (id)exportNowPlayingState:(id)a3 forPlayerPath:(id)a4;
- (id)exportPlaybackQueue:(id)a3 forPlayerPath:(id)a4;
- (id)exportSupportedCommands:(id)a3;
- (id)gameControllerWithID:(unint64_t)a3;
- (id)outputDevicesForEndpoint:(id)a3;
- (id)pinPairingToken;
- (id)virtualTouchDeviceWithID:(unint64_t)a3;
- (unint64_t)addGameController:(id)a3;
- (unint64_t)addVirtualTouchDevice:(id)a3;
- (unint64_t)virtualTouchIDWithPackedID:(unint64_t)a3;
- (unsigned)connectOptions;
- (unsigned)discoveryModeForConfiguration:(id)a3;
- (void)_handleEndpointDidDisconnect:(id)a3;
- (void)addLyricsEvent:(id)a3;
- (void)addPendingPlaybackSessionMigrateEvent:(id)a3 playerPath:(id)a4;
- (void)addRegisteredVirtualVoiceInputDevice:(unsigned int)a3;
- (void)addVolumeEvent:(_MRHIDButtonEvent)a3;
- (void)dealloc;
- (void)flushLyricsEvents:(id)a3;
- (void)flushPendingPlaybackSessionMigrateEvents:(id)a3;
- (void)flushVolumeEvents:(id)a3;
- (void)gameController:(id)a3 propertiesDidChange:(id)a4;
- (void)localizeDestinationOrigin:(id)a3 completion:(id)a4;
- (void)localizeDestinationPlayerPath:(id)a3 completion:(id)a4;
- (void)removeAllVirtualTouchDevices;
- (void)removeGameController:(unint64_t)a3;
- (void)removeLyricsEvent:(id)a3;
- (void)requestConnectedDestinationEndpoint:(id)a3;
- (void)requestDestinationEndpoint:(id)a3;
- (void)setConnectUserInfo:(id)a3;
- (void)setCredentials:(id)a3;
- (void)setDestinationEndpoint:(id)a3;
- (void)setDestinationGroupUID:(id)a3;
- (void)setDestinationOutputDeviceUID:(id)a3;
- (void)setDiscoveryMode:(unsigned int)a3 forConfiguration:(id)a4;
- (void)setPinPairingToken:(id)a3;
- (void)setServerDelegate:(id)a3;
- (void)unregisterAllVirtualVoiceInputDevices;
@end

@implementation MRDExternalDeviceServerClientConnection

- (MRDExternalDeviceServerClientConnection)initWithConnection:(id)a3 queue:(id)a4
{
  v25.receiver = self;
  v25.super_class = (Class)MRDExternalDeviceServerClientConnection;
  v4 = [(MRDExternalDeviceServerClientConnection *)&v25 initWithConnection:a3 queue:a4];
  if (v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = (void *)*((void *)v4 + 1);
    *((void *)v4 + 1) = v5;

    id v7 = objc_alloc_init((Class)NSMutableArray);
    v8 = (void *)*((void *)v4 + 2);
    *((void *)v4 + 2) = v7;

    v9 = (objc_class *)objc_opt_class();
    Name = class_getName(v9);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create(Name, v11);
    v13 = (void *)*((void *)v4 + 3);
    *((void *)v4 + 3) = v12;

    id v14 = [objc_alloc((Class)MRPlaybackQueueClient) initWithQueue:*((void *)v4 + 3)];
    v15 = (void *)*((void *)v4 + 16);
    *((void *)v4 + 16) = v14;

    id v16 = objc_alloc_init((Class)NSMutableDictionary);
    v17 = (void *)*((void *)v4 + 4);
    *((void *)v4 + 4) = v16;

    id v18 = objc_alloc_init((Class)NSMutableDictionary);
    v19 = (void *)*((void *)v4 + 6);
    *((void *)v4 + 6) = v18;

    id v20 = objc_alloc_init((Class)NSMutableArray);
    v21 = (void *)*((void *)v4 + 8);
    *((void *)v4 + 8) = v20;

    id v22 = objc_alloc_init((Class)NSMutableDictionary);
    v23 = (void *)*((void *)v4 + 14);
    *((void *)v4 + 14) = v22;

    *((void *)v4 + 9) = 0;
    *((_DWORD *)v4 + 20) = 0;
    *(void *)(v4 + 84) = 0;
    *((_DWORD *)v4 + 23) = 0;
    *((_WORD *)v4 + 20) = 0;
    *((_WORD *)v4 + 28) = 0x3FFF;
  }
  return (MRDExternalDeviceServerClientConnection *)v4;
}

- (void)dealloc
{
  [(MRDExternalDeviceServerClientConnection *)self unregisterAllVirtualVoiceInputDevices];
  v3.receiver = self;
  v3.super_class = (Class)MRDExternalDeviceServerClientConnection;
  [(MRDExternalDeviceServerClientConnection *)&v3 dealloc];
}

- (NSString)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  uint64_t v4 = objc_opt_class();
  id v5 = [(MRDExternalDeviceServerClientConnection *)self connection];
  id v6 = [v3 initWithFormat:@"<%@:%p %@", v4, self, v5];

  id v7 = [(MRDExternalDeviceServerClientConnection *)self destinationOutputDeviceUID];

  if (v7)
  {
    v8 = [(MRDExternalDeviceServerClientConnection *)self destinationOutputDeviceUID];
    [v6 appendFormat:@"destination=%@", v8];
  }
  v9 = [(MRDExternalDeviceServerClientConnection *)self destinationGroupUID];

  if (v9)
  {
    v10 = [(MRDExternalDeviceServerClientConnection *)self destinationGroupUID];
    [v6 appendFormat:@"destinationGroup=%@", v10];
  }
  [v6 appendString:@">"];

  return (NSString *)v6;
}

- (NSString)debugDescription
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  if (-[MRDExternalDeviceServerClientConnection registeredToNowPlayingUpdates](self, "registeredToNowPlayingUpdates"))[v3 appendString:@"NowPlaying "]; {
  if (-[MRDExternalDeviceServerClientConnection registeredToOutputDeviceUpdates](self, "registeredToOutputDeviceUpdates"))[v3 appendString:@"OutputDevices "];
  }
  if (-[MRDExternalDeviceServerClientConnection registeredToVolumeUpdates](self, "registeredToVolumeUpdates"))[v3 appendString:@"Volume "]; {
  if (-[MRDExternalDeviceServerClientConnection registeredKeyboardUpdates](self, "registeredKeyboardUpdates"))[v3 appendString:@"Keyboard "];
  }
  if (-[MRDExternalDeviceServerClientConnection registeredToSystemEndpointUpdates](self, "registeredToSystemEndpointUpdates"))[v3 appendString:@"SystemEndpointUpdates "]; {
  uint64_t v4 = (objc_class *)objc_opt_class();
  }
  v24 = NSStringFromClass(v4);
  v26 = [(MRDExternalDeviceServerClientConnection *)self deviceInfo];
  v23 = MRCreateIndentedDebugDescriptionFromObject();
  objc_super v25 = [(MRDExternalDeviceServerClientConnection *)self supportedMessages];
  id v22 = [v25 lastSupportedMessageType];
  v17 = MRCreateIndentedDebugDescriptionFromArray();
  id v5 = MRCreateIndentedDebugDescriptionFromArray();
  playbackQueueRequests = self->_playbackQueueRequests;
  id pinPairingToken = self->_pinPairingToken;
  sessionPeer = self->_sessionPeer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serverDelegate);
  id v6 = [(MRDExternalDeviceServerClientConnection *)self subscribedPlayerPaths];
  id v7 = MRCreateIndentedDebugDescriptionFromArray();
  v8 = [(MRDExternalDeviceServerClientConnection *)self destinationOutputDeviceUID];
  v9 = [(MRDExternalDeviceServerClientConnection *)self destinationGroupUID];
  v10 = [(MRDExternalDeviceServerClientConnection *)self destinationEndpoint];
  uint64_t v11 = [(MRDExternalDeviceServerClientConnection *)self connection];
  id v12 = v3;
  v21 = v3;
  v13 = (void *)v11;
  id v14 = +[NSString stringWithFormat:@"<%@ %p {\n    deviceInfo = %@\n    lastSupportedMessageType = %ld\n    virtualTouchDevices = %@\n    registeredVirtualVoiceInputDevices = %@\n    playbackQueueRequests = %@\n    sessionPeer = %@\n    pinPairingToken = %@\n    serverDelegate = %@\n    registeredUpdates = %@\n    subscribedPlayerPaths = %@\n    destinationOutputDeviceUID = %@\n    destinationGroupID = %@\n    destinationEndpoint = %@\n    connection = %@\n}>", v24, self, v23, v22, v17, v5, playbackQueueRequests, sessionPeer, pinPairingToken, WeakRetained, v12, v7, v8, v9, v10, v11];

  return (NSString *)v14;
}

- (unsigned)connectOptions
{
  v2 = [(MRDExternalDeviceServerClientConnection *)self connectUserInfo];
  id v3 = [v2 objectForKeyedSubscript:@"ConnectOptions"];
  unsigned int v4 = [v3 intValue];

  return v4;
}

- (NSArray)virtualTouchDevices
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_100073EA0;
  v10 = sub_100073EB0;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100073EB8;
  v5[3] = &unk_100415CF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSArray)registeredVirtualVoiceInputDevices
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_100073EA0;
  v10 = sub_100073EB0;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100074004;
  v5[3] = &unk_100415CF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (unint64_t)addGameController:(id)a3
{
  id v4 = a3;
  signed __int16 v5 = self->_gameControllerDeviceIDCounter + 1;
  self->_gameControllerDeviceIDCounter = v5;
  serialQueue = self->_serialQueue;
  unint64_t v7 = v5;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000741A0;
  block[3] = &unk_100415AA8;
  block[4] = self;
  id v12 = v4;
  uint64_t v13 = v5;
  id v8 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  v9 = _MRLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[ExternalDeviceConnection(Server)] Added gamecontroller with deviceID: %llu", buf, 0xCu);
  }

  return v7;
}

- (id)gameControllerWithID:(unint64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_100073EA0;
  serialQueue = self->_serialQueue;
  id v11 = sub_100073EB0;
  id v12 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100074314;
  block[3] = &unk_100415968;
  block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)removeGameController:(unint64_t)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100074418;
  v4[3] = &unk_1004165E8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync((dispatch_queue_t)serialQueue, v4);
}

- (unint64_t)addVirtualTouchDevice:(id)a3
{
  id v4 = a3;
  signed __int16 v5 = self->_deviceIDCounter + 1;
  self->_deviceIDCounter = v5;
  serialQueue = self->_serialQueue;
  unint64_t v7 = v5;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100074548;
  block[3] = &unk_100415AA8;
  block[4] = self;
  id v11 = v4;
  uint64_t v12 = v5;
  id v8 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, block);

  return v7;
}

- (id)virtualTouchDeviceWithID:(unint64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_100073EA0;
  serialQueue = self->_serialQueue;
  id v11 = sub_100073EB0;
  id v12 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000746F4;
  block[3] = &unk_1004169D8;
  void block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)removeAllVirtualTouchDevices
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000748E4;
  block[3] = &unk_100415CC8;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
}

- (void)addRegisteredVirtualVoiceInputDevice:(unsigned int)a3
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100074A80;
  block[3] = &unk_1004176D0;
  block[4] = self;
  unsigned int v9 = a3;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  objc_initWeak(&location, self);
  id v5 = &_dispatch_main_q;
  objc_copyWeak(&v6, &location);
  MRVirtualVoiceInputSetRecordingStateCallback();

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)unregisterAllVirtualVoiceInputDevices
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_100073EA0;
  v17 = sub_100073EB0;
  id v18 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100074E04;
  block[3] = &unk_100415CF0;
  block[4] = self;
  void block[5] = &v13;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = (id)v14[5];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        objc_msgSend(v7, "unsignedIntValue", (void)v8);
        MRVirtualVoiceInputSetRecordingStateCallback();
        [v7 unsignedIntValue];
        MRVirtualVoiceInputUnregisterDevice();
      }
      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v19 count:16];
    }
    while (v4);
  }

  _Block_object_dispose(&v13, 8);
}

- (unint64_t)virtualTouchIDWithPackedID:(unint64_t)a3
{
  packedDeviceIDToDeviceIDMapping = self->_packedDeviceIDToDeviceIDMapping;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  uint64_t v5 = [(NSMutableDictionary *)packedDeviceIDToDeviceIDMapping objectForKey:v4];
  id v6 = [v5 longLongValue];

  return (unint64_t)v6;
}

- (void)addLyricsEvent:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100074F64;
  v7[3] = &unk_1004158D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, v7);
}

- (void)removeLyricsEvent:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100075018;
  v7[3] = &unk_1004158D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, v7);
}

- (void)flushLyricsEvents:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_100073EA0;
  v19 = sub_100073EB0;
  id v20 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100075370;
  block[3] = &unk_100415CF0;
  block[4] = self;
  void block[5] = &v15;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = (id)v16[5];
  id v7 = [v6 countByEnumeratingWithState:&v10 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      long long v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * (void)v9));
        long long v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v10 objects:v21 count:16];
    }
    while (v7);
  }

  _Block_object_dispose(&v15, 8);
}

- (void)addVolumeEvent:(_MRHIDButtonEvent)a3
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100075450;
  block[3] = &unk_100418910;
  _MRHIDButtonEvent v5 = a3;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
}

- (void)flushVolumeEvents:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  serialQueue = self->_serialQueue;
  char v10 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000755FC;
  block[3] = &unk_100418938;
  block[4] = self;
  void block[5] = &v11;
  void block[6] = &v7;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  if (*((unsigned char *)v12 + 24)) {
    v4[2](v4, 0xE90000000CLL, 0);
  }
  if (*((unsigned char *)v8 + 24)) {
    v4[2](v4, 0xEA0000000CLL, 0);
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
}

- (void)addPendingPlaybackSessionMigrateEvent:(id)a3 playerPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100075714;
  block[3] = &unk_1004159B8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
}

- (BOOL)removePendingPlaybackSessionMigrateEvent:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  serialQueue = self->_serialQueue;
  char v14 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100075894;
  block[3] = &unk_100416870;
  block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  LOBYTE(serialQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)serialQueue;
}

- (void)flushPendingPlaybackSessionMigrateEvents:(id)a3
{
  id v4 = (void (**)(id, void *, void *))a3;
  if (v4)
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = sub_100073EA0;
    id v22 = sub_100073EB0;
    id v23 = 0;
    serialQueue = self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100075B54;
    block[3] = &unk_100415CF0;
    block[4] = self;
    void block[5] = &v18;
    dispatch_sync((dispatch_queue_t)serialQueue, block);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = (id)v19[5];
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v11 = objc_msgSend(v10, "first", (void)v13);
          id v12 = [v10 second];
          v4[2](v4, v11, v12);
        }
        id v7 = [v6 countByEnumeratingWithState:&v13 objects:v24 count:16];
      }
      while (v7);
    }

    _Block_object_dispose(&v18, 8);
  }
}

- (void)localizeDestinationPlayerPath:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100075C78;
  v8[3] = &unk_100418960;
  id v9 = a3;
  id v10 = a4;
  id v6 = v9;
  id v7 = v10;
  [(MRDExternalDeviceServerClientConnection *)self requestConnectedDestinationEndpoint:v8];
}

- (void)localizeDestinationOrigin:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)MRPlayerPath) initWithOrigin:v7 client:0 player:0];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100075E40;
  v10[3] = &unk_100418988;
  id v11 = v6;
  id v9 = v6;
  [(MRDExternalDeviceServerClientConnection *)self localizeDestinationPlayerPath:v8 completion:v10];
}

- (void)requestConnectedDestinationEndpoint:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100075F34;
  v4[3] = &unk_1004189D8;
  _MRHIDButtonEvent v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(MRDExternalDeviceServerClientConnection *)v5 requestDestinationEndpoint:v4];
}

- (void)requestDestinationEndpoint:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  _MRHIDButtonEvent v5 = [(MRDExternalDeviceServerClientConnection *)self destinationEndpoint];
  if (v5)
  {
    if (v4) {
      v4[2](v4, v5);
    }
  }
  else
  {
    id v6 = +[MRDAutoConnectionControllerReason reasonWithType:4 string:@"ExternalDeviceServerDestination"];
    id v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    long long v13 = sub_1000761CC;
    long long v14 = &unk_1004189D8;
    long long v15 = self;
    long long v16 = v4;
    id v7 = objc_retainBlock(&v11);
    id v8 = [(MRDExternalDeviceServerClientConnection *)self destinationGroupUID];

    id v9 = +[MRDAutoConnectionController sharedConnectionController];
    if (v8)
    {
      id v10 = [(MRDExternalDeviceServerClientConnection *)self destinationGroupUID];
      [v9 discoverGroup:v10 reason:v6 queue:&_dispatch_main_q completion:v7];
    }
    else
    {
      id v10 = [(MRDExternalDeviceServerClientConnection *)self destinationOutputDeviceUID];
      [v9 discoverOutputDevice:v10 reason:v6 queue:&_dispatch_main_q completion:v7];
    }
  }
}

- (BOOL)isDestinationLocal
{
  id v3 = [(MRDExternalDeviceServerClientConnection *)self destinationOutputDeviceUID];

  if (!v3) {
    return 1;
  }
  id v4 = +[MROrigin localOrigin];
  _MRHIDButtonEvent v5 = +[MRDeviceInfoRequest deviceInfoForOrigin:v4];

  id v6 = [(MRDExternalDeviceServerClientConnection *)self destinationOutputDeviceUID];
  id v7 = [v5 WHAIdentifier];
  unsigned __int8 v8 = [v6 isEqualToString:v7];

  return v8;
}

- (void)setDestinationEndpoint:(id)a3
{
  _MRHIDButtonEvent v5 = (MRAVEndpoint *)a3;
  id v6 = self;
  objc_sync_enter(v6);
  p_destinationEndpoint = (id *)&v6->_destinationEndpoint;
  destinationEndpoint = v6->_destinationEndpoint;
  if (destinationEndpoint != v5)
  {
    if (destinationEndpoint)
    {
      id v9 = +[NSNotificationCenter defaultCenter];
      [v9 removeObserver:v6 name:MRAVEndpointDidDisconnectNotification object:*p_destinationEndpoint];

      id v10 = *p_destinationEndpoint;
    }
    else
    {
      id v10 = 0;
    }
    id v11 = [v10 debugName];

    if (v11)
    {
      uint64_t v12 = _MRLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        long long v13 = [*p_destinationEndpoint debugName];
        long long v14 = [(MRAVEndpoint *)v5 debugName];
        *(_DWORD *)buf = 138544130;
        v26 = v6;
        __int16 v27 = 2114;
        CFStringRef v28 = @"destinationEndpoint";
        __int16 v29 = 2112;
        v30 = v13;
        __int16 v31 = 2112;
        v32 = v14;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Set: %{public}@ setting %{public}@ from <%@> to <%@>", buf, 0x2Au);
      }
    }
    else
    {
      uint64_t v12 = _MRLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        long long v15 = [(MRAVEndpoint *)v5 debugName];
        *(_DWORD *)buf = 138543874;
        v26 = v6;
        __int16 v27 = 2114;
        CFStringRef v28 = @"destinationEndpoint";
        __int16 v29 = 2112;
        v30 = v15;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Set: %{public}@ setting %{public}@ to <%@>", buf, 0x20u);
      }
    }

    objc_storeStrong((id *)&v6->_destinationEndpoint, a3);
    if (*p_destinationEndpoint
      || (id v16 = [objc_alloc((Class)NSError) initWithMRError:24],
          [(MRDExternalDeviceServerClientConnection *)v6 disconnectWithError:v16],
          v16,
          *p_destinationEndpoint))
    {
      uint64_t v17 = +[NSNotificationCenter defaultCenter];
      [v17 addObserver:v6 selector:"_handleEndpointDidDisconnect:" name:MRAVEndpointDidDisconnectNotification object:*p_destinationEndpoint];
    }
    uint64_t v18 = [(MRDExternalDeviceServerClientConnection *)v6 label];
    BOOL v19 = [v18 length] == 0;

    if (v19)
    {
      uint64_t v20 = [(MRDExternalDeviceServerClientConnection *)v6 label];
      uint64_t v21 = [*p_destinationEndpoint debugName];
      id v22 = (void *)v21;
      CFStringRef v23 = &stru_10042ACB0;
      if (v20) {
        CFStringRef v23 = v20;
      }
      v24 = +[NSString stringWithFormat:@"%@-%@", v23, v21];
      [(MRDExternalDeviceServerClientConnection *)v6 setLabel:v24];
    }
    else
    {
      uint64_t v20 = [*p_destinationEndpoint debugName];
      [(MRDExternalDeviceServerClientConnection *)v6 setLabel:v20];
    }
  }
  objc_sync_exit(v6);
}

- (MRAVEndpoint)destinationEndpoint
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_destinationEndpoint;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)_wantsLibraryCommands
{
  id v3 = [(MRDExternalDeviceServerClientConnection *)self deviceInfo];
  unsigned __int8 v4 = [v3 isGizmo];

  if (v4) {
    return 1;
  }
  id v6 = [(MRDExternalDeviceServerClientConnection *)self deviceInfo];
  id v7 = [v6 bundleIdentifier];
  unsigned __int8 v8 = [v7 isEqualToString:@"com.apple.TVRemote"];

  return v8;
}

- (id)exportNowPlayingState:(id)a3 forPlayerPath:(id)a4
{
  id v4 = a3;
  if (a3)
  {
    id v6 = a4;
    id v7 = v4;
    id v4 = [v7 copy];
    unsigned __int8 v8 = [v7 supportedCommands];
    id v9 = [(MRDExternalDeviceServerClientConnection *)self exportSupportedCommands:v8];
    [v4 setSupportedCommands:v9];

    id v10 = [v7 playbackQueue];

    id v11 = [(MRDExternalDeviceServerClientConnection *)self exportPlaybackQueue:v10 forPlayerPath:v6];

    [v4 setPlaybackQueue:v11];
  }

  return v4;
}

- (id)exportSupportedCommands:(id)a3
{
  id v4 = a3;
  if ([(MRDExternalDeviceServerClientConnection *)self _wantsLibraryCommands])
  {
    id v5 = v4;
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000768F8;
    v7[3] = &unk_100418A00;
    unsigned __int8 v8 = &off_1004385D8;
    objc_msgSend(v4, "msv_filter:", v7);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)exportPlaybackQueue:(id)a3 forPlayerPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [v6 range];
    id v10 = +[MRPlaybackQueueRequest defaultPlaybackQueueRequestWithRange:](MRPlaybackQueueRequest, "defaultPlaybackQueueRequestWithRange:", v8, v9);
    id v11 = (void *)MRPlaybackQueueCreateFromRequest();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v12 = objc_msgSend(v11, "contentItems", 0);
    id v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = [*(id *)(*((void *)&v21 + 1) + 8 * i) metadata];
          [v17 setDeviceSpecificUserInfo:0];
        }
        id v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v14);
    }

    uint64_t v18 = [(MRDExternalDeviceServerClientConnection *)self playbackQueueRequests];
    BOOL v19 = [v18 existingSubscriptionControllerForPlayerPath:v7];

    [v19 subscribeToPlaybackQueue:v11 forRequest:v10];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)exportContentItems:(id)a3 forPlayerPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = [(MRDExternalDeviceServerClientConnection *)self playbackQueueRequests];
    uint64_t v9 = [v8 existingSubscriptionControllerForPlayerPath:v7];

    [v9 filteredContentItemsBySubscriptionsForContentItems:v6];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        id v14 = 0;
        do
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v14), "metadata", (void)v19);
          [v15 setDeviceSpecificUserInfo:0];

          id v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }
  }
  else
  {
    id v10 = 0;
  }
  if (objc_msgSend(v10, "count", (void)v19)) {
    id v16 = v10;
  }
  else {
    id v16 = 0;
  }
  id v17 = v16;

  return v17;
}

- (id)exportContentItemArtworkUpdates:(id)a3 forPlayerPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = [(MRDExternalDeviceServerClientConnection *)self playbackQueueRequests];
    uint64_t v9 = [v8 existingSubscriptionControllerForPlayerPath:v7];

    id v10 = [v9 filteredContentItemsBySubscriptionsForContentItems:v6];
  }
  else
  {
    id v10 = 0;
  }
  if ([v10 count]) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  return v12;
}

- (unsigned)discoveryModeForConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)v5->_discoveryModes objectForKeyedSubscript:v4];
  unsigned int v7 = [v6 intValue];

  objc_sync_exit(v5);
  return v7;
}

- (void)setDiscoveryMode:(unsigned int)a3 forConfiguration:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v8 = a4;
  id v6 = self;
  objc_sync_enter(v6);
  unsigned int v7 = +[NSNumber numberWithUnsignedInt:v4];
  [(NSMutableDictionary *)v6->_discoveryModes setObject:v7 forKeyedSubscript:v8];

  objc_sync_exit(v6);
}

- (NSArray)discoverySessionConfigurations
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSMutableDictionary *)v2->_discoveryModes allKeys];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (id)outputDevicesForEndpoint:(id)a3
{
  id v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = sub_100073EA0;
  v9[4] = sub_100073EB0;
  id v10 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007704C;
  v8[3] = &unk_100418A28;
  void v8[4] = self;
  v8[5] = v9;
  id v5 = objc_retainBlock(v8);
  if (((unsigned int (*)(void))v5[2])()) {
    [v4 resolvedOutputDevices];
  }
  else {
  id v6 = [v4 outputDevices];
  }

  _Block_object_dispose(v9, 8);

  return v6;
}

- (BOOL)hasAccessToPlayerPath:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDExternalDeviceServerClientConnection *)self connection];
  unsigned __int8 v6 = [v5 hasAccessToPlayerPath:v4];

  return v6;
}

- (BOOL)isAllowedToSendMessageType:(unint64_t)a3
{
  id v4 = [(MRDExternalDeviceServerClientConnection *)self connection];
  LOBYTE(a3) = [v4 isAllowedToSendMessageType:a3];

  return a3;
}

- (BOOL)isAllowedToSendCommand:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(MRDExternalDeviceServerClientConnection *)self connection];
  LOBYTE(v3) = [v4 isAllowedToSendCommand:v3];

  return v3;
}

- (void)_handleEndpointDidDisconnect:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:NSUnderlyingErrorKey];

  [(MRDExternalDeviceServerClientConnection *)self disconnectWithError:v5];
  [(MRDExternalDeviceServerClientConnection *)self setDestinationEndpoint:0];
}

- (void)gameController:(id)a3 propertiesDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000773DC;
  block[3] = &unk_100416870;
  block[4] = self;
  id v9 = v6;
  id v14 = v9;
  uint64_t v15 = &v16;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  if (v17[3])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_serverDelegate);
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = objc_loadWeakRetained((id *)&self->_serverDelegate);
      [v12 externalDeviceClient:self gameController:v17[3] propertiesChanged:v7];
    }
  }

  _Block_object_dispose(&v16, 8);
}

- (MRPasscodeCredentials)credentials
{
  return self->_credentials;
}

- (void)setCredentials:(id)a3
{
}

- (MRPlaybackQueueClient)playbackQueueRequests
{
  return self->_playbackQueueRequests;
}

- (MRCoreUtilsPairingSessionPeer)sessionPeer
{
  return self->_sessionPeer;
}

- (id)pinPairingToken
{
  return self->_pinPairingToken;
}

- (void)setPinPairingToken:(id)a3
{
}

- (NSString)destinationOutputDeviceUID
{
  return self->_destinationOutputDeviceUID;
}

- (void)setDestinationOutputDeviceUID:(id)a3
{
}

- (NSString)destinationGroupUID
{
  return self->_destinationGroupUID;
}

- (void)setDestinationGroupUID:(id)a3
{
}

- (MRDExternalDeviceServerClientConnectionDelegate)serverDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serverDelegate);

  return (MRDExternalDeviceServerClientConnectionDelegate *)WeakRetained;
}

- (void)setServerDelegate:(id)a3
{
}

- (NSDictionary)connectUserInfo
{
  return self->_connectUserInfo;
}

- (void)setConnectUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectUserInfo, 0);
  objc_destroyWeak((id *)&self->_serverDelegate);
  objc_storeStrong((id *)&self->_destinationGroupUID, 0);
  objc_storeStrong((id *)&self->_destinationOutputDeviceUID, 0);
  objc_storeStrong(&self->_pinPairingToken, 0);
  objc_storeStrong((id *)&self->_sessionPeer, 0);
  objc_storeStrong((id *)&self->_playbackQueueRequests, 0);
  objc_storeStrong((id *)&self->_credentials, 0);
  objc_storeStrong((id *)&self->_discoveryModes, 0);
  objc_storeStrong((id *)&self->_destinationEndpoint, 0);
  objc_storeStrong((id *)&self->_pendingPlaybackSessionMigrateEvents, 0);
  objc_storeStrong((id *)&self->_lyricsEvents, 0);
  objc_storeStrong((id *)&self->_gameControllers, 0);
  objc_storeStrong((id *)&self->_packedDeviceIDToDeviceIDMapping, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_registeredVirtualVoiceInputDevices, 0);

  objc_storeStrong((id *)&self->_virtualTouchDevices, 0);
}

@end