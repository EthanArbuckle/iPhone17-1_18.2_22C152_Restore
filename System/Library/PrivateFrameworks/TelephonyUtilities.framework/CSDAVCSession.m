@interface CSDAVCSession
+ (AVCSessionConfiguration)defaultConfiguration;
+ (TUCallScreenShareAttributes)defaultScreenShareAttributes;
+ (id)avcScreenCaptureConfigurationForScreenAttributes:(id)a3;
+ (int64_t)defaultSessionMode;
- (AVCScreenCapture)avcScreenCapture;
- (AVCSession)session;
- (BOOL)containsRemoteParticipantWithIdentifier:(unint64_t)a3;
- (BOOL)hasCalledStop;
- (BOOL)isAudioEnabled;
- (BOOL)isAudioPaused;
- (BOOL)isAudioReady;
- (BOOL)isOneToOneModeEnabled;
- (BOOL)isRelaying;
- (BOOL)isRemoteScreenEnabledForParticipant:(id)a3;
- (BOOL)isScreenEnabled;
- (BOOL)isScreening;
- (BOOL)isUplinkMuted;
- (BOOL)isVideo;
- (BOOL)isVideoEnabled;
- (BOOL)isVideoPaused;
- (BOOL)shouldDisableOneToOneModeForScreenShare;
- (BOOL)shouldIgnoreBenignErrorOnStart:(id)a3;
- (CGRect)presentationRect;
- (CSDAVCSession)initWithSessionCreationBlock:(id)a3 transportToken:(id)a4 delegate:(id)a5 queue:(id)a6 reportingHierarchyToken:(id)a7 avMode:(unint64_t)a8 videoEnabled:(BOOL)a9 captureSessionCreationBlock:(id)a10;
- (CSDAVCSession)initWithTransportToken:(id)a3 delegate:(id)a4 queue:(id)a5 reportingHierarchyToken:(id)a6 oneToOneModeEnabled:(BOOL)a7 avMode:(unint64_t)a8 videoEnabled:(BOOL)a9 report:(id)a10 serviceName:(id)a11 ABTestConfiguration:(id)a12;
- (CSDAVCSessionDelegate)delegate;
- (NSData)localParticipantData;
- (NSMutableArray)captureSessionQueue;
- (NSMutableArray)sessionUpdateCompletionQueue;
- (NSMutableDictionary)pendingRemovedParticipantsByID;
- (NSMutableDictionary)remoteParticipantsByIdentifier;
- (NSNumber)mostRecentCompletedOneToOneEnabledValue;
- (NSString)sessionIdentifier;
- (OS_dispatch_queue)queue;
- (TUCallScreenShareAttributes)currentLocalScreenShareAttributes;
- (TUCallScreenShareAttributes)mostRecentScreenShareAttributes;
- (TUFeatureFlags)featureFlags;
- (id)avcSessionParticipantCreationBlock;
- (id)captureSessionCreationBlock;
- (id)localParticipantDataWithVersion:(unint64_t)a3;
- (id)pendingRemovedRemoteParticipantByIdentififer:(unint64_t)a3;
- (int)presentationState;
- (int64_t)localCaptionsToken;
- (int64_t)maxVideoDecodesAllowed;
- (int64_t)sessionToken;
- (unsigned)captureCapabilities;
- (unsigned)presentationLayoutForGridDisplayMode:(unint64_t)a3;
- (void)addParticipant:(id)a3 withVideoEnabled:(BOOL)a4 audioPaused:(BOOL)a5 screenEnabled:(BOOL)a6;
- (void)beginParticipantUpdates;
- (void)commitParticipantUpdates;
- (void)participant:(id)a3 didReact:(id)a4;
- (void)participant:(id)a3 mediaPrioritiesDidChange:(id)a4;
- (void)participant:(id)a3 mixingDidStartForMediaType:(unsigned int)a4 mixingMediaType:(unsigned int)a5;
- (void)participant:(id)a3 mixingDidStopForMediaType:(unsigned int)a4;
- (void)participant:(id)a3 remoteAudioEnabledDidChange:(BOOL)a4;
- (void)participant:(id)a3 remoteAudioPausedDidChange:(BOOL)a4;
- (void)participant:(id)a3 remoteMediaStateDidChange:(unsigned int)a4 forMediaType:(unsigned int)a5;
- (void)participant:(id)a3 remoteScreenEnabledDidChange:(BOOL)a4;
- (void)participant:(id)a3 remoteVideoEnabledDidChange:(BOOL)a4;
- (void)participant:(id)a3 screenEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)queueAddParticipantRetryBlock:(id)a3 withVideoEnabled:(BOOL)a4 audioPaused:(BOOL)a5 screenEnabled:(BOOL)a6;
- (void)removeParticipant:(id)a3;
- (void)screenCapture:(id)a3 didStart:(BOOL)a4 withError:(id)a5;
- (void)screenCapture:(id)a3 didStop:(BOOL)a4 withError:(id)a5;
- (void)screenCapture:(id)a3 didUpdateAttributes:(id)a4 error:(id)a5;
- (void)session:(id)a3 addParticipant:(id)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)session:(id)a3 audioEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)session:(id)a3 audioPaused:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)session:(id)a3 didDetectError:(id)a4;
- (void)session:(id)a3 didReact:(id)a4;
- (void)session:(id)a3 didStart:(BOOL)a4 error:(id)a5;
- (void)session:(id)a3 didStopWithError:(id)a4;
- (void)session:(id)a3 didStopWithError:(id)a4 metadata:(id)a5;
- (void)session:(id)a3 didUpdate:(BOOL)a4 configuration:(id)a5 error:(id)a6;
- (void)session:(id)a3 mediaStateDidChange:(unsigned int)a4 forMediaType:(unsigned int)a5 didSucceed:(BOOL)a6 error:(id)a7;
- (void)session:(id)a3 mixingDidStartForMediaType:(unsigned int)a4 mixingMediaType:(unsigned int)a5;
- (void)session:(id)a3 mixingDidStopForMediaType:(unsigned int)a4;
- (void)session:(id)a3 oneToOneEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)session:(id)a3 removeParticipant:(id)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)session:(id)a3 screenEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)session:(id)a3 videoEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)session:(id)a3 videoPaused:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)sessionDidStopReacting:(id)a3;
- (void)sessionServerDidDisconnect:(id)a3;
- (void)sessionShouldReconnect:(id)a3;
- (void)setAudioAndVideoMuted:(BOOL)a3 forParticipantWithIdentifier:(unint64_t)a4;
- (void)setAudioEnabled:(BOOL)a3;
- (void)setAudioPaused:(BOOL)a3;
- (void)setAudioPaused:(BOOL)a3 forParticipantWithIdentifier:(unint64_t)a4;
- (void)setAudioReady:(BOOL)a3;
- (void)setAvcScreenCapture:(id)a3;
- (void)setAvcSessionParticipantCreationBlock:(id)a3;
- (void)setCaptureCapabilities:(unsigned __int8)a3;
- (void)setCurrentLocalScreenShareAttributes:(id)a3;
- (void)setDownlinkMuted:(BOOL)a3 forParticipantWithIdentifier:(unint64_t)a4;
- (void)setFeatureFlags:(id)a3;
- (void)setGridDisplayMode:(unint64_t)a3;
- (void)setHasCalledStop:(BOOL)a3;
- (void)setMostRecentCompletedOneToOneEnabledValue:(id)a3;
- (void)setMostRecentScreenShareAttributes:(id)a3;
- (void)setOneToOneModeEnabled:(BOOL)a3;
- (void)setOneToOneModeEnabled:(BOOL)a3 withCompletionBlock:(id)a4;
- (void)setPresentationRect:(CGRect)a3;
- (void)setPresentationState:(int)a3;
- (void)setRelaying:(BOOL)a3;
- (void)setScreenEnabled:(BOOL)a3;
- (void)setScreenEnabled:(BOOL)a3 attributes:(id)a4;
- (void)setScreenEnabled:(BOOL)a3 forParticipantWithIdentifier:(unint64_t)a4;
- (void)setScreenShareAttributes:(id)a3;
- (void)setScreening:(BOOL)a3;
- (void)setUplinkMuted:(BOOL)a3;
- (void)setVideo:(BOOL)a3;
- (void)setVideoEnabled:(BOOL)a3;
- (void)setVideoPaused:(BOOL)a3;
- (void)setVideoQuality:(unint64_t)a3 visibility:(id)a4 prominence:(id)a5 spatialPosition:(CGRect)a6 isInCanvas:(BOOL)a7 forParticipantWithIdentifier:(unint64_t)a8;
- (void)start;
- (void)startAVCScreenCaptureWithAttributes:(id)a3 preferImmediateActivation:(BOOL)a4 screenControlEnabled:(BOOL)a5 capturesCursor:(BOOL)a6;
- (void)stop;
- (void)stopWithError:(id)a3;
- (void)updateConfigurationSessionMode:(int64_t)a3;
@end

@implementation CSDAVCSession

- (CSDAVCSession)initWithSessionCreationBlock:(id)a3 transportToken:(id)a4 delegate:(id)a5 queue:(id)a6 reportingHierarchyToken:(id)a7 avMode:(unint64_t)a8 videoEnabled:(BOOL)a9 captureSessionCreationBlock:(id)a10
{
  v15 = (void (**)(id, id, id, id))a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a10;
  v47.receiver = self;
  v47.super_class = (Class)CSDAVCSession;
  v21 = [(CSDAVCSession *)&v47 init];
  if (v21)
  {
    v22 = v15[2](v15, v16, v19, v18);
    if (v22)
    {
      objc_storeStrong((id *)&v21->_queue, a6);
      objc_storeStrong((id *)&v21->_session, v22);
      objc_storeWeak((id *)&v21->_delegate, v17);
      v21->_hasCalledStop = 0;
      uint64_t v23 = +[NSMutableDictionary dictionary];
      remoteParticipantsByIdentifier = v21->_remoteParticipantsByIdentifier;
      v21->_remoteParticipantsByIdentifier = (NSMutableDictionary *)v23;

      uint64_t v25 = +[NSMutableDictionary dictionary];
      pendingRemovedParticipantsByID = v21->_pendingRemovedParticipantsByID;
      v21->_pendingRemovedParticipantsByID = (NSMutableDictionary *)v25;

      v21->_video = a8 == 2;
      v27 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      sessionUpdateCompletionQueue = v21->_sessionUpdateCompletionQueue;
      v21->_sessionUpdateCompletionQueue = v27;

      v29 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:1];
      captureSessionQueue = v21->_captureSessionQueue;
      v21->_captureSessionQueue = v29;

      id v31 = objc_retainBlock(v20);
      id captureSessionCreationBlock = v21->_captureSessionCreationBlock;
      v21->_id captureSessionCreationBlock = v31;

      v21->_captureCapabilities = +[AVCScreenCapture captureCapabilities];
      mostRecentScreenShareAttributes = v21->_mostRecentScreenShareAttributes;
      v21->_mostRecentScreenShareAttributes = 0;

      BOOL v34 = 0;
      if (a9) {
        BOOL v34 = [(CSDAVCSession *)v21 isVideo];
      }
      [v22 setVideoEnabled:v34];
      objc_initWeak(&location, v21);
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_100197D2C;
      v44[3] = &unk_100509568;
      objc_copyWeak(&v45, &location);
      v35 = objc_retainBlock(v44);
      id avcSessionParticipantCreationBlock = v21->_avcSessionParticipantCreationBlock;
      v21->_id avcSessionParticipantCreationBlock = v35;

      unsigned __int8 v37 = +[TUConversationManager allowsVideo];
      if (a8 == 2) {
        unsigned __int8 v38 = v37;
      }
      else {
        unsigned __int8 v38 = 0;
      }
      if ((v38 & 1) == 0)
      {
        v39 = sub_100008DCC();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Updating session to videoEnabled=NO after creation since current device or call does not support video", buf, 2u);
        }

        [v22 setVideoEnabled:0];
        if (!a8) {
          [v22 setAudioEnabled:0];
        }
      }
      objc_destroyWeak(&v45);
      objc_destroyWeak(&location);
    }
    else
    {
      v40 = sub_100008DCC();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        sub_1003AFDC0(v40);
      }

      v21 = 0;
    }
  }
  return v21;
}

- (CSDAVCSession)initWithTransportToken:(id)a3 delegate:(id)a4 queue:(id)a5 reportingHierarchyToken:(id)a6 oneToOneModeEnabled:(BOOL)a7 avMode:(unint64_t)a8 videoEnabled:(BOOL)a9 report:(id)a10 serviceName:(id)a11 ABTestConfiguration:(id)a12
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a10;
  id v22 = a11;
  id v23 = a12;
  objc_initWeak(location, self);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100198004;
  v34[3] = &unk_100509590;
  v24 = self;
  v35 = v24;
  BOOL v39 = a7;
  id v25 = v21;
  id v36 = v25;
  id v26 = v22;
  id v37 = v26;
  id v27 = v23;
  id v38 = v27;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1001982BC;
  v32[3] = &unk_1005095B8;
  objc_copyWeak(&v33, location);
  LOBYTE(v30) = a9;
  v28 = [(CSDAVCSession *)v24 initWithSessionCreationBlock:v34 transportToken:v17 delegate:v18 queue:v19 reportingHierarchyToken:v20 avMode:a8 videoEnabled:v30 captureSessionCreationBlock:v32];
  objc_destroyWeak(&v33);

  objc_destroyWeak(location);
  return v28;
}

- (TUFeatureFlags)featureFlags
{
  featureFlags = self->_featureFlags;
  if (!featureFlags)
  {
    v4 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    v5 = self->_featureFlags;
    self->_featureFlags = v4;

    featureFlags = self->_featureFlags;
  }

  return featureFlags;
}

+ (AVCSessionConfiguration)defaultConfiguration
{
  id v3 = objc_alloc_init((Class)AVCSessionConfiguration);
  objc_msgSend(v3, "setSessionMode:", objc_msgSend(a1, "defaultSessionMode"));

  return (AVCSessionConfiguration *)v3;
}

+ (int64_t)defaultSessionMode
{
  return 0;
}

- (NSData)localParticipantData
{
  id v3 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v3);

  return (NSData *)[(CSDAVCSession *)self localParticipantDataWithVersion:1];
}

- (id)localParticipantDataWithVersion:(unint64_t)a3
{
  v5 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = [(CSDAVCSession *)self session];
  v7 = [v6 negotiationDataForProtocolVersion:a3 == 2];

  return v7;
}

- (BOOL)containsRemoteParticipantWithIdentifier:(unint64_t)a3
{
  v5 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = [(CSDAVCSession *)self remoteParticipantsByIdentifier];
  v7 = +[NSNumber numberWithUnsignedLongLong:a3];
  v8 = [v6 objectForKeyedSubscript:v7];
  LOBYTE(v5) = v8 != 0;

  return (char)v5;
}

- (int64_t)sessionToken
{
  id v3 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [(CSDAVCSession *)self session];
  id v5 = [v4 sessionToken];

  return (int64_t)v5;
}

- (NSString)sessionIdentifier
{
  id v3 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [(CSDAVCSession *)self session];
  id v5 = [v4 uuid];

  return (NSString *)v5;
}

- (int64_t)maxVideoDecodesAllowed
{
  v2 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v2);

  return 0;
}

+ (TUCallScreenShareAttributes)defaultScreenShareAttributes
{
  id v2 = objc_alloc_init((Class)TUCallScreenShareAttributes);
  id v3 = +[NSNumber numberWithInt:0xFFFFFFFFLL];
  [v2 setDisplayID:v3];

  v4 = +[NSValue valueWithRect:](NSValue, "valueWithRect:", 0.0, 0.0, -1.0, -1.0);
  [v2 setOriginalResolution:v4];

  id v5 = +[NSNumber numberWithDouble:60.0];
  [v2 setFrameRate:v5];

  objc_msgSend(v2, "setDeviceFamily:", +[TUCallScreenShareAttributes currentDeviceFamily](TUCallScreenShareAttributes, "currentDeviceFamily"));

  return (TUCallScreenShareAttributes *)v2;
}

- (BOOL)isAudioReady
{
  id v3 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v3);

  return self->_audioReady;
}

- (void)setAudioReady:(BOOL)a3
{
  id v5 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v5);

  self->_audioReady = a3;
}

- (BOOL)isUplinkMuted
{
  id v3 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [(CSDAVCSession *)self session];
  LOBYTE(v3) = [v4 isAudioMuted];

  return (char)v3;
}

- (void)setUplinkMuted:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "uplinkMuted: %d", (uint8_t *)v8, 8u);
  }

  v7 = [(CSDAVCSession *)self session];
  [v7 setAudioMuted:v3];
}

- (BOOL)isAudioEnabled
{
  BOOL v3 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [(CSDAVCSession *)self session];
  LOBYTE(v3) = [v4 isAudioEnabled];

  return (char)v3;
}

- (void)setAudioEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "audioEnabled: %d", (uint8_t *)v8, 8u);
  }

  v7 = [(CSDAVCSession *)self session];
  [v7 setAudioEnabled:v3];
}

- (BOOL)isVideoEnabled
{
  BOOL v3 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [(CSDAVCSession *)self session];
  LOBYTE(v3) = [v4 isVideoEnabled];

  return (char)v3;
}

- (BOOL)isScreenEnabled
{
  BOOL v3 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [(CSDAVCSession *)self session];
  LOBYTE(v3) = [v4 isScreenEnabled];

  return (char)v3;
}

- (void)setVideo:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "setVideo: %d", (uint8_t *)v8, 8u);
  }

  if (v3)
  {
    v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Switching to video is currently not supported", (uint8_t *)v8, 2u);
    }
  }
  else
  {
    self->_video = v3;
  }
}

- (void)setVideoEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v5);

  if (!v3 || +[TUConversationManager allowsVideo])
  {
    v6 = sub_100008DCC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109120;
      v10[1] = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "videoEnabled: %d", (uint8_t *)v10, 8u);
    }

    v7 = [(CSDAVCSession *)self session];
    [v7 setVideoEnabled:v3];

    if ([(CSDAVCSession *)self captureCapabilities] == 1
      && [(CSDAVCSession *)self isScreenEnabled]
      && v3)
    {
      v8 = sub_100008DCC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Device does not support screen sharing with camera on, also updating screenEnabled", (uint8_t *)v10, 2u);
      }

      v9 = [(CSDAVCSession *)self session];
      [v9 setScreenEnabled:0];
    }
  }
}

- (void)setScreenEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(id)objc_opt_class() defaultScreenShareAttributes];
  [(CSDAVCSession *)self setScreenEnabled:v3 attributes:v6];
}

- (BOOL)isVideoPaused
{
  BOOL v3 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [(CSDAVCSession *)self session];
  LOBYTE(v3) = [v4 isVideoPaused];

  return (char)v3;
}

- (void)setVideoPaused:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "videoPaused: %d", (uint8_t *)v8, 8u);
  }

  v7 = [(CSDAVCSession *)self session];
  [v7 setVideoPaused:v3];
}

- (BOOL)isAudioPaused
{
  BOOL v3 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [(CSDAVCSession *)self session];
  LOBYTE(v3) = [v4 isAudioPaused];

  return (char)v3;
}

- (void)setAudioPaused:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "audioPaused: %d", (uint8_t *)v8, 8u);
  }

  v7 = [(CSDAVCSession *)self session];
  [v7 setAudioPaused:v3];
}

- (BOOL)isOneToOneModeEnabled
{
  BOOL v3 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [(CSDAVCSession *)self session];
  LOBYTE(v3) = [v4 isOneToOneEnabled];

  return (char)v3;
}

- (void)setOneToOneModeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDAVCSession *)self session];
  unsigned int v7 = [v6 isOneToOneEnabled];

  if (v7 != v3)
  {
    [(CSDAVCSession *)self setOneToOneModeEnabled:v3 withCompletionBlock:0];
  }
}

- (int)presentationState
{
  BOOL v3 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [(CSDAVCSession *)self session];
  id v5 = v4;
  if (v4)
  {
    [v4 presentationInfo];
    int v6 = v8;

    if (v6 == 2) {
      return 2;
    }
    else {
      return v6 == 1;
    }
  }
  else
  {

    return 0;
  }
}

- (void)setPresentationState:(int)a3
{
  id v5 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v5);

  [(CSDAVCSession *)self beginParticipantUpdates];
  long long v16 = 0u;
  long long v17 = 0u;
  if (a3 == 2) {
    char v6 = 2;
  }
  else {
    char v6 = a3 == 1;
  }
  long long v15 = 0uLL;
  unsigned int v7 = [(CSDAVCSession *)self session];
  unsigned __int8 v8 = v7;
  if (v7)
  {
    [v7 presentationInfo];
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v15 = 0u;
  }

  BYTE8(v17) = v6;
  v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v19 = BYTE8(v17);
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "presentationState: %d", buf, 8u);
  }

  long long v12 = v15;
  long long v13 = v16;
  long long v14 = v17;
  v10 = [(CSDAVCSession *)self session];
  v11[0] = v12;
  v11[1] = v13;
  v11[2] = v14;
  [v10 setPresentationInfo:v11];

  [(CSDAVCSession *)self commitParticipantUpdates];
}

- (CGRect)presentationRect
{
  BOOL v3 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [(CSDAVCSession *)self session];
  id v5 = v4;
  if (v4)
  {
    [v4 presentationInfo];
    double v6 = v15;
    double v7 = v14;
    double v8 = v17;
    double v9 = v16;
  }
  else
  {
    double v8 = 0.0;
    double v9 = 0.0;
    double v6 = 0.0;
    double v7 = 0.0;
  }

  double v10 = v7;
  double v11 = v6;
  double v12 = v9;
  double v13 = v8;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (void)setPresentationRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v8);

  [(CSDAVCSession *)self beginParticipantUpdates];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = 0u;
  double v9 = [(CSDAVCSession *)self session];
  double v10 = v9;
  if (v9)
  {
    [v9 presentationInfo];
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v17 = 0u;
  }

  *(CGFloat *)&long long v17 = x;
  *((CGFloat *)&v17 + 1) = y;
  *(CGFloat *)&long long v18 = width;
  *((CGFloat *)&v18 + 1) = height;
  double v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218752;
    uint64_t v21 = v17;
    __int16 v22 = 2048;
    uint64_t v23 = *((void *)&v17 + 1);
    __int16 v24 = 2048;
    uint64_t v25 = v18;
    __int16 v26 = 2048;
    uint64_t v27 = *((void *)&v18 + 1);
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "presentationRect: (%f, %f, %f, %f)", buf, 0x2Au);
  }

  long long v14 = v17;
  long long v15 = v18;
  long long v16 = v19;
  double v12 = [(CSDAVCSession *)self session];
  v13[0] = v14;
  v13[1] = v15;
  v13[2] = v16;
  [v12 setPresentationInfo:v13];

  [(CSDAVCSession *)self commitParticipantUpdates];
}

- (void)setGridDisplayMode:(unint64_t)a3
{
  id v5 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v5);

  [(CSDAVCSession *)self beginParticipantUpdates];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  double v6 = [(CSDAVCSession *)self session];
  double v7 = v6;
  if (v6)
  {
    [v6 presentationInfo];
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v14 = 0u;
  }

  DWORD1(v16) = [(CSDAVCSession *)self presentationLayoutForGridDisplayMode:a3];
  double v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v18 = DWORD1(v16);
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "setting presentationLayout: (%u)", buf, 8u);
  }

  long long v11 = v14;
  long long v12 = v15;
  long long v13 = v16;
  double v9 = [(CSDAVCSession *)self session];
  v10[0] = v11;
  v10[1] = v12;
  _DWORD v10[2] = v13;
  [v9 setPresentationInfo:v10];

  [(CSDAVCSession *)self commitParticipantUpdates];
}

- (unsigned)presentationLayoutForGridDisplayMode:(unint64_t)a3
{
  return a3 == 1;
}

+ (id)avcScreenCaptureConfigurationForScreenAttributes:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)AVCScreenCaptureConfiguration);
  objc_msgSend(v4, "setIsWindowed:", objc_msgSend(v3, "isWindowed"));
  id v5 = [v3 windowUUID];
  double v6 = [v5 UUIDString];
  [v4 setSelectiveScreenUUID:v6];

  double v7 = [v3 displayID];
  if (v7)
  {
    double v8 = [v3 displayID];
  }
  else
  {
    double v9 = [(id)objc_opt_class() defaultScreenShareAttributes];
    double v8 = [v9 displayID];
  }
  objc_msgSend(v4, "setScreenCaptureDisplayID:", objc_msgSend(v8, "unsignedIntValue"));

  return v4;
}

- (void)setScreenEnabled:(BOOL)a3 attributes:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  double v7 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v7);

  int v8 = TUSharePlayForceDisabled();
  double v9 = sub_100008DCC();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "screenEnabled is not supported - returning", buf, 2u);
    }

    goto LABEL_34;
  }
  if (v10)
  {
    *(_DWORD *)buf = 67109378;
    LODWORD(v34[0]) = v4;
    WORD2(v34[0]) = 2112;
    *(void *)((char *)v34 + 6) = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "setScreenEnabled:%d screenShareAttributes: %@", buf, 0x12u);
  }

  if (v4)
  {
    [(CSDAVCSession *)self setCurrentLocalScreenShareAttributes:v6];
    unsigned int v11 = [(CSDAVCSession *)self captureCapabilities];
    if (v11 == 1)
    {
      if ([(CSDAVCSession *)self isVideoEnabled])
      {
        long long v19 = sub_100008DCC();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Device does not support screen sharing with camera on, also updating videoEnabled", buf, 2u);
        }

        id v20 = [(CSDAVCSession *)self session];
        [v20 setVideoEnabled:0];
      }
    }
    else if (!v11)
    {
      long long v12 = sub_100008DCC();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[WARN] Device does not support screen sharing, ignoring to set screenEnabled", buf, 2u);
      }

      goto LABEL_34;
    }
    objc_initWeak(&location, self);
    uint64_t v25 = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472;
    uint64_t v27 = sub_100199C14;
    v28 = &unk_1005095E0;
    objc_copyWeak(&v30, &location);
    BOOL v31 = v4;
    id v29 = v6;
    uint64_t v21 = objc_retainBlock(&v25);
    if ([(CSDAVCSession *)self isOneToOneModeEnabled]) {
      unsigned int v22 = [(CSDAVCSession *)self shouldDisableOneToOneModeForScreenShare];
    }
    else {
      unsigned int v22 = 0;
    }
    uint64_t v23 = sub_100008DCC();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v24 = @"NO";
      if (v22) {
        CFStringRef v24 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      v34[0] = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Determined shouldSwitchToGFTMode: %@", buf, 0xCu);
    }

    if (v22) {
      [(CSDAVCSession *)self setOneToOneModeEnabled:0 withCompletionBlock:v21];
    }
    else {
      ((void (*)(void ***))v21[2])(v21);
    }

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
  else
  {
    [(CSDAVCSession *)self setCurrentLocalScreenShareAttributes:0];
    long long v13 = [(CSDAVCSession *)self session];
    [v13 setScreenEnabled:0];

    long long v14 = [(CSDAVCSession *)self avcScreenCapture];

    if (v14)
    {
      long long v15 = sub_100008DCC();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        long long v16 = [(CSDAVCSession *)self avcScreenCapture];
        *(_DWORD *)buf = 138412290;
        v34[0] = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Stopped capture of %@", buf, 0xCu);
      }
      long long v17 = [(CSDAVCSession *)self avcScreenCapture];
      [v17 stopCapture];
    }
    else
    {
      long long v17 = [(CSDAVCSession *)self delegate];
      [v17 session:self changedScreenEnabled:0 didSucceed:1 error:0];
    }

    int v18 = [(CSDAVCSession *)self captureSessionQueue];
    [v18 removeAllObjects];
  }
LABEL_34:
}

- (void)setOneToOneModeEnabled:(BOOL)a3 withCompletionBlock:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  double v7 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v7);

  if (v6)
  {
    int v8 = sub_100008DCC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 67109120;
      LODWORD(v19) = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Queueing completion block to execute after updating oneToOneEnabled: %d", (uint8_t *)&v18, 8u);
    }

    double v9 = [(CSDAVCSession *)self sessionUpdateCompletionQueue];
    id v10 = [v6 copy];
    [v9 addObject:v10];
  }
  else
  {
    double v9 = [(CSDAVCSession *)self sessionUpdateCompletionQueue];
    [v9 addObject:&stru_100509600];
  }

  unsigned int v11 = [(CSDAVCSession *)self session];
  long long v12 = [v11 configuration];

  [v12 setOneToOneModeEnabled:v4];
  if (v4) {
    id v13 = [v12 outOfProcessCodecsEnabled];
  }
  else {
    id v13 = 0;
  }
  [v12 setOutOfProcessCodecsEnabled:v13];
  long long v14 = sub_100008DCC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      CFStringRef v15 = @"YES";
    }
    else {
      CFStringRef v15 = @"NO";
    }
    if ([v12 outOfProcessCodecsEnabled]) {
      CFStringRef v16 = @"YES";
    }
    else {
      CFStringRef v16 = @"NO";
    }
    int v18 = 138412546;
    CFStringRef v19 = v15;
    __int16 v20 = 2112;
    CFStringRef v21 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "oneToOneEnabled: %@ oopCodecsEnabled %@", (uint8_t *)&v18, 0x16u);
  }

  long long v17 = [(CSDAVCSession *)self session];
  [v17 updateConfiguration:v12];
}

- (void)startAVCScreenCaptureWithAttributes:(id)a3 preferImmediateActivation:(BOOL)a4 screenControlEnabled:(BOOL)a5 capturesCursor:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = [(id)objc_opt_class() avcScreenCaptureConfigurationForScreenAttributes:v9];
  [v10 setIsCursorCaptured:v6];
  [(CSDAVCSession *)self setMostRecentScreenShareAttributes:v9];
  objc_initWeak(&location, self);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10019A3AC;
  v30[3] = &unk_100505558;
  objc_copyWeak(&v32, &location);
  id v11 = v10;
  id v31 = v11;
  long long v12 = objc_retainBlock(v30);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10019A4F0;
  v27[3] = &unk_100505558;
  objc_copyWeak(&v29, &location);
  id v13 = v11;
  id v28 = v13;
  long long v14 = objc_retainBlock(v27);
  CFStringRef v15 = [(CSDAVCSession *)self avcScreenCapture];

  if (v15)
  {
    CFStringRef v16 = objc_retainBlock(v14);
    long long v17 = [(CSDAVCSession *)self avcScreenCapture];
    [v17 stopCapture];

    int v18 = objc_retainBlock(v12);
    if (a4)
    {
      CFStringRef v19 = sub_100008DCC();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v26 = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Bypassing capture queue and starting AVCScreenCapture immediately", v26, 2u);
      }

      v18[2](v18);
      goto LABEL_15;
    }
    unsigned int v22 = sub_100008DCC();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Queueing capture completion block to execute after current capture session is stopped", v26, 2u);
    }

    id v23 = [(CSDAVCSession *)self captureSessionQueue];
    id v24 = [v18 copy];
    [v23 addObject:v24];

LABEL_14:
LABEL_15:

    goto LABEL_16;
  }
  __int16 v20 = [(CSDAVCSession *)self session];
  unsigned __int8 v21 = [v20 isScreenEnabled];

  if ((v21 & 1) == 0)
  {
    uint64_t v25 = sub_100008DCC();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Queueing capture completion block to execute after screen becomes enabled", v26, 2u);
    }

    int v18 = [(CSDAVCSession *)self captureSessionQueue];
    id v23 = [v12 copy];
    [v18 addObject:v23];
    goto LABEL_14;
  }
  ((void (*)(void *))v12[2])(v12);
LABEL_16:

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
}

- (BOOL)shouldDisableOneToOneModeForScreenShare
{
  id v3 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(CSDAVCSession *)self remoteParticipantsByIdentifier];
  id v5 = [v4 allValues];
  id v6 = [v5 count];

  if ((unint64_t)v6 <= 1)
  {
    int v8 = [(CSDAVCSession *)self featureFlags];
    unsigned int v9 = [v8 uPlusOneScreenSharing];

    if (v9)
    {
      id v10 = [(CSDAVCSession *)self delegate];
      id v11 = [v10 onlyAvailableSessionConversationParticipant:self];

      long long v12 = [v11 capabilities];
      unsigned int v7 = [v12 isUPlusOneScreenShareAvailable] ^ 1;
    }
    else
    {
      LOBYTE(v7) = 1;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)setScreenShareAttributes:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "screenShareAttributes: %@", (uint8_t *)&v11, 0xCu);
  }

  unsigned int v7 = [(CSDAVCSession *)self currentLocalScreenShareAttributes];
  unsigned __int8 v8 = [v7 isEqualToScreenShareAttributes:v4];

  if (v8)
  {
    unsigned int v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(CSDAVCSession *)self currentLocalScreenShareAttributes];
      int v11 = 138412546;
      id v12 = v4;
      __int16 v13 = 2112;
      long long v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[WARN] Asked to set screenShareAttributes %@ when local attributes are: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    [(CSDAVCSession *)self setCurrentLocalScreenShareAttributes:v4];
    [(CSDAVCSession *)self startAVCScreenCaptureWithAttributes:v4 preferImmediateActivation:0 screenControlEnabled:0 capturesCursor:1];
  }
}

- (void)updateConfigurationSessionMode:(int64_t)a3
{
  id v5 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    int64_t v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "updatingSessionMode: %ld", (uint8_t *)&v10, 0xCu);
  }

  unsigned int v7 = [(CSDAVCSession *)self session];
  unsigned __int8 v8 = [v7 configuration];

  [v8 setSessionMode:a3];
  unsigned int v9 = [(CSDAVCSession *)self session];
  [v9 updateConfiguration:v8];
}

- (void)setRelaying:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (v3) {
      CFStringRef v7 = @"YES";
    }
    int v9 = 136315394;
    int v10 = "-[CSDAVCSession setRelaying:]";
    __int16 v11 = 2112;
    CFStringRef v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s:  %@", (uint8_t *)&v9, 0x16u);
  }

  self->_relaying = v3;
  if (v3 || [(CSDAVCSession *)self isScreening]) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = (uint64_t)[(id)objc_opt_class() defaultSessionMode];
  }
  [(CSDAVCSession *)self updateConfigurationSessionMode:v8];
}

- (void)setScreening:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v5);

  self->_screening = v3;
  if (v3 || [(CSDAVCSession *)self isRelaying]) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = (uint64_t)[(id)objc_opt_class() defaultSessionMode];
  }
  CFStringRef v7 = [(CSDAVCSession *)self session];
  id v9 = [v7 configuration];

  [v9 setSessionMode:v6];
  if (v3) {
    [v9 setOutOfProcessCodecsEnabled:1];
  }
  uint64_t v8 = [(CSDAVCSession *)self session];
  [v8 updateConfiguration:v9];
}

- (void)queueAddParticipantRetryBlock:(id)a3 withVideoEnabled:(BOOL)a4 audioPaused:(BOOL)a5 screenEnabled:(BOOL)a6
{
  id v10 = a3;
  __int16 v11 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v11);

  objc_initWeak(&location, self);
  long long v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  CFStringRef v19 = sub_10019AD5C;
  __int16 v20 = &unk_100509628;
  objc_copyWeak(&v22, &location);
  id v12 = v10;
  id v21 = v12;
  BOOL v23 = a4;
  BOOL v24 = a5;
  BOOL v25 = a6;
  __int16 v13 = objc_retainBlock(&v17);
  long long v14 = sub_100008DCC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Already have oneToOne transition in progress, delaying addParticipant request for participant: %@", buf, 0xCu);
  }

  CFStringRef v15 = [(CSDAVCSession *)self sessionUpdateCompletionQueue];
  id v16 = [v13 copy];
  [v15 addObject:v16];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)addParticipant:(id)a3 withVideoEnabled:(BOOL)a4 audioPaused:(BOOL)a5 screenEnabled:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  __int16 v11 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = [(CSDAVCSession *)self sessionUpdateCompletionQueue];
  id v13 = [v12 count];

  if (!v13)
  {
    long long v14 = [(CSDAVCSession *)self delegate];
    CFStringRef v15 = objc_msgSend(v14, "session:conversationParticipantWithParticipantIdentifier:", self, objc_msgSend(v10, "identifier"));

    if (v15)
    {
      id v16 = [(CSDAVCSession *)self remoteParticipantsByIdentifier];
      long long v17 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v10 identifier]);
      uint64_t v18 = [v16 objectForKeyedSubscript:v17];

      if (!v18)
      {
        objc_initWeak((id *)buf, self);
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_10019B18C;
        v28[3] = &unk_100509628;
        objc_copyWeak(&v30, (id *)buf);
        id v29 = v10;
        BOOL v31 = v8;
        BOOL v32 = v7;
        BOOL v33 = v6;
        id v22 = objc_retainBlock(v28);
        BOOL v23 = [(CSDAVCSession *)self remoteParticipantsByIdentifier];
        BOOL v24 = [v23 allValues];
        id v25 = [v24 count];

        unsigned int v26 = [(CSDAVCSession *)self isOneToOneModeEnabled];
        if (v25 == (id)1) {
          unsigned int v27 = v26;
        }
        else {
          unsigned int v27 = 0;
        }
        if (v27 == 1) {
          [(CSDAVCSession *)self setOneToOneModeEnabled:0 withCompletionBlock:v22];
        }
        else {
          ((void (*)(void *))v22[2])(v22);
        }

        objc_destroyWeak(&v30);
        objc_destroyWeak((id *)buf);
        goto LABEL_18;
      }
      CFStringRef v19 = sub_100008DCC();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v20 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v10 identifier]);
        *(_DWORD *)buf = 138412290;
        v35 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring request to add participant %@ because they're already in the conversation", buf, 0xCu);
      }
    }
    else
    {
      CFStringRef v19 = sub_100008DCC();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v10 identifier]);
        *(_DWORD *)buf = 138412290;
        v35 = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Could not find participant tracking with identifier %@", buf, 0xCu);
      }
    }

LABEL_18:
    goto LABEL_19;
  }
  [(CSDAVCSession *)self queueAddParticipantRetryBlock:v10 withVideoEnabled:v8 audioPaused:v7 screenEnabled:v6];
LABEL_19:
}

- (void)removeParticipant:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = [(CSDAVCSession *)self sessionUpdateCompletionQueue];
  id v7 = [v6 count];

  if (v7)
  {
    objc_initWeak(&location, self);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10019B7A8;
    v27[3] = &unk_100505558;
    objc_copyWeak(&v29, &location);
    id v8 = v4;
    id v28 = v8;
    id v9 = objc_retainBlock(v27);
    id v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Already have oneToOne transition in progress, delaying removeParticipant request for %@", buf, 0xCu);
    }

    __int16 v11 = [(CSDAVCSession *)self sessionUpdateCompletionQueue];
    id v12 = [v9 copy];
    [v11 addObject:v12];

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  else
  {
    id v13 = sub_100008DCC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "removeParticipant: %@", buf, 0xCu);
    }

    long long v14 = [(CSDAVCSession *)self remoteParticipantsByIdentifier];
    CFStringRef v15 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v4 identifier]);
    id v16 = [v14 objectForKeyedSubscript:v15];

    long long v17 = [(CSDAVCSession *)self pendingRemovedParticipantsByID];
    uint64_t v18 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v4 identifier]);
    if (v16)
    {
      [v17 setObject:v4 forKeyedSubscript:v18];

      CFStringRef v19 = [(CSDAVCSession *)self remoteParticipantsByIdentifier];
      __int16 v20 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v4 identifier]);
      [v19 setObject:0 forKeyedSubscript:v20];

      id v21 = [(CSDAVCSession *)self session];
      [v21 removeParticipant:v16];
    }
    else
    {
      id v22 = [v17 objectForKeyedSubscript:v18];

      id v21 = sub_100008DCC();
      BOOL v23 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
      if (v22)
      {
        if (v23)
        {
          id v24 = [v4 identifier];
          *(_DWORD *)buf = 134217984;
          id v32 = v24;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find participant %lu in the active participant list, but they're in the list of pending removals", buf, 0xCu);
        }
      }
      else if (v23)
      {
        id v25 = [v4 identifier];
        unsigned int v26 = [(CSDAVCSession *)self remoteParticipantsByIdentifier];
        *(_DWORD *)buf = 134218242;
        id v32 = v25;
        __int16 v33 = 2112;
        BOOL v34 = v26;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find participant with identifier %lu all participants: %@", buf, 0x16u);
      }
    }
  }
}

- (void)setDownlinkMuted:(BOOL)a3 forParticipantWithIdentifier:(unint64_t)a4
{
  BOOL v5 = a3;
  id v7 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(CSDAVCSession *)self remoteParticipantsByIdentifier];
  id v9 = +[NSNumber numberWithUnsignedLongLong:a4];
  id v10 = [v8 objectForKeyedSubscript:v9];

  __int16 v11 = sub_100008DCC();
  id v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134218240;
      unint64_t v14 = a4;
      __int16 v15 = 1024;
      BOOL v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "identifier: %llu downlinkMuted: %d", (uint8_t *)&v13, 0x12u);
    }

    [v10 setAudioMuted:v5];
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1003AFE48();
    }
  }
}

- (void)setAudioPaused:(BOOL)a3 forParticipantWithIdentifier:(unint64_t)a4
{
  BOOL v5 = a3;
  id v7 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(CSDAVCSession *)self remoteParticipantsByIdentifier];
  id v9 = +[NSNumber numberWithUnsignedLongLong:a4];
  id v10 = [v8 objectForKeyedSubscript:v9];

  __int16 v11 = sub_100008DCC();
  id v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134218240;
      unint64_t v14 = a4;
      __int16 v15 = 1024;
      BOOL v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "identifier: %lu audioPaused: %d", (uint8_t *)&v13, 0x12u);
    }

    [v10 setAudioPaused:v5];
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1003AFED4();
    }
  }
}

- (void)setScreenEnabled:(BOOL)a3 forParticipantWithIdentifier:(unint64_t)a4
{
  BOOL v5 = a3;
  id v7 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(CSDAVCSession *)self remoteParticipantsByIdentifier];
  id v9 = +[NSNumber numberWithUnsignedLongLong:a4];
  id v10 = [v8 objectForKeyedSubscript:v9];

  __int16 v11 = sub_100008DCC();
  id v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134218240;
      unint64_t v14 = a4;
      __int16 v15 = 1024;
      BOOL v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "identifier: %lu screenEnabled: %d", (uint8_t *)&v13, 0x12u);
    }

    [v10 setScreenEnabled:v5];
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1003AFED4();
    }
  }
}

- (void)setAudioAndVideoMuted:(BOOL)a3 forParticipantWithIdentifier:(unint64_t)a4
{
  BOOL v5 = a3;
  id v7 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(CSDAVCSession *)self remoteParticipantsByIdentifier];
  id v9 = +[NSNumber numberWithUnsignedLongLong:a4];
  id v10 = [v8 objectForKeyedSubscript:v9];

  __int16 v11 = sub_100008DCC();
  id v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134218240;
      unint64_t v14 = a4;
      __int16 v15 = 1024;
      BOOL v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "identifier: %llu audioAndVideoMuted: %d", (uint8_t *)&v13, 0x12u);
    }

    [v10 setAudioMuted:v5];
    [v10 setVideoPaused:v5];
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1003AFE48();
    }
  }
}

- (void)setVideoQuality:(unint64_t)a3 visibility:(id)a4 prominence:(id)a5 spatialPosition:(CGRect)a6 isInCanvas:(BOOL)a7 forParticipantWithIdentifier:(unint64_t)a8
{
  BOOL v9 = a7;
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v17 = a4;
  id v18 = a5;
  CFStringRef v19 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v19);

  __int16 v20 = [(CSDAVCSession *)self remoteParticipantsByIdentifier];
  id v21 = +[NSNumber numberWithUnsignedLongLong:a8];
  id v22 = [v20 objectForKeyedSubscript:v21];

  if (v22)
  {
    if (a3 == 2) {
      unsigned int v23 = 10;
    }
    else {
      unsigned int v23 = 5;
    }
    if (a3) {
      uint64_t v24 = v23;
    }
    else {
      uint64_t v24 = 0;
    }
    double v25 = x + width * 0.5;
    double v26 = y + height * 0.5;
    if ([v18 integerValue]) {
      double v27 = 0.0;
    }
    else {
      double v27 = 1.0;
    }
    id v28 = sub_100008DCC();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134220288;
      unint64_t v37 = a8;
      __int16 v38 = 2048;
      unint64_t v39 = a3;
      __int16 v40 = 2048;
      id v41 = [v17 integerValue];
      __int16 v42 = 2048;
      id v43 = [v18 integerValue];
      __int16 v44 = 1024;
      BOOL v45 = v9;
      __int16 v46 = 2048;
      double v47 = v25;
      __int16 v48 = 2048;
      double v49 = v26;
      __int16 v50 = 2048;
      double v51 = v27;
      __int16 v52 = 2048;
      double v53 = width;
      __int16 v54 = 2048;
      double v55 = height;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "identifier: %lu videoQuality: %lu visibility: %lu prominence: %lu positionalInfo: <flags: %u, position: (x: %f, y: %f, z: %f, w: %f, h: %f)>", buf, 0x62u);
    }

    [v22 setVideoQuality:v24];
    objc_msgSend(v22, "setVisibilityIndex:", objc_msgSend(v17, "integerValue"));
    objc_msgSend(v22, "setProminenceIndex:", objc_msgSend(v18, "integerValue"));
    v30[0] = v9;
    v30[1] = 0;
    double v31 = width;
    double v32 = height;
    double v33 = v25;
    double v34 = v26;
    double v35 = v27;
    [v22 setVideoPositionalInfo:v30];
  }
  else
  {
    id v29 = sub_100008DCC();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_1003AFED4();
    }
  }
}

- (void)beginParticipantUpdates
{
  BOOL v3 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = sub_100008DCC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "", v6, 2u);
  }

  BOOL v5 = [(CSDAVCSession *)self session];
  [v5 beginParticipantConfiguration];
}

- (void)commitParticipantUpdates
{
  BOOL v3 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = sub_100008DCC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "", v6, 2u);
  }

  BOOL v5 = [(CSDAVCSession *)self session];
  [v5 endParticipantConfiguration];
}

- (void)start
{
  BOOL v3 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = sub_100008DCC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "", v6, 2u);
  }

  [(CSDAVCSession *)self setHasCalledStop:0];
  BOOL v5 = [(CSDAVCSession *)self session];
  [v5 start];
}

- (void)stop
{
}

- (void)stopWithError:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v5);

  [(CSDAVCSession *)self setHasCalledStop:1];
  BOOL v6 = [(CSDAVCSession *)self avcScreenCapture];

  if (v6)
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Calling stop on screen capture", (uint8_t *)&v11, 2u);
    }

    id v8 = [(CSDAVCSession *)self avcScreenCapture];
    [v8 stopCapture];
  }
  BOOL v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CSDAVCSession: stop with error: %@", (uint8_t *)&v11, 0xCu);
  }

  id v10 = [(CSDAVCSession *)self session];
  [v10 stopWithError:v4];
}

- (BOOL)shouldIgnoreBenignErrorOnStart:(id)a3
{
  id v4 = a3;
  if (v4 && [(CSDAVCSession *)self hasCalledStop])
  {
    BOOL v5 = [v4 domain];
    if ([v5 isEqualToString:@"GKVoiceChatServiceErrorDomain"]
      && [v4 code] == (id)32028)
    {
      BOOL v6 = [v4 localizedFailureReason];
      unsigned __int8 v7 = [v6 isEqualToString:@"Stop called on a starting session"];
    }
    else
    {
      unsigned __int8 v7 = 0;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)session:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v8);

  BOOL v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109378;
    v11[1] = v5;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "didStart: %d error: %@", (uint8_t *)v11, 0x12u);
  }

  if ([(CSDAVCSession *)self shouldIgnoreBenignErrorOnStart:v7])
  {
    id v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring avcSession didStart as the error that was returned was benign", (uint8_t *)v11, 2u);
    }
  }
  else
  {
    id v10 = [(CSDAVCSession *)self delegate];
    [v10 session:self didStart:v5 error:v7];
  }
}

- (void)session:(id)a3 didStopWithError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NSDictionary);
  [(CSDAVCSession *)self session:v7 didStopWithError:v6 metadata:v8];
}

- (void)session:(id)a3 didStopWithError:(id)a4 metadata:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  BOOL v9 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v9);

  id v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412290;
    uint64_t v26 = (uint64_t)v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "error: %@", (uint8_t *)&v25, 0xCu);
  }

  id v11 = v7;
  unsigned __int8 v12 = [(CSDAVCSession *)self hasCalledStop];
  id v13 = v11;
  if (!v11)
  {
    id v13 = 0;
    if ((v12 & 1) == 0) {
      id v13 = [objc_alloc((Class)NSError) initWithDomain:@"CSDAVCSessionError" code:505 userInfo:0];
    }
  }
  uint64_t v14 = [v8 objectForKey:@"avcKeySessionSentBytes"];
  if (v14)
  {
    __int16 v15 = [v8 objectForKeyedSubscript:@"avcKeySessionSentBytes"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v17 = [v8 objectForKeyedSubscript:@"avcKeySessionSentBytes"];
      uint64_t v14 = (uint64_t)[v17 integerValue];
    }
    else
    {
      uint64_t v14 = 0;
    }
  }
  uint64_t v18 = [v8 objectForKey:@"avcKeySessionReceivedBytes"];
  if (v18)
  {
    CFStringRef v19 = (void *)v18;
    __int16 v20 = [v8 objectForKeyedSubscript:@"avcKeySessionReceivedBytes"];
    objc_opt_class();
    char v21 = objc_opt_isKindOfClass();

    if (v21)
    {
      id v22 = [v8 objectForKeyedSubscript:@"avcKeySessionReceivedBytes"];
      v14 += (uint64_t)[v22 integerValue];
    }
  }
  unsigned int v23 = [(CSDAVCSession *)self delegate];
  if (v14 >= 1)
  {
    uint64_t v24 = sub_100008DCC();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 134217984;
      uint64_t v26 = v14;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Sending delegate bytesOfDataUsageChanged: %ld", (uint8_t *)&v25, 0xCu);
    }

    [v23 session:self changedBytesOfDataUsed:v14];
  }
  [v23 session:self didStopWithError:v13];
}

- (id)pendingRemovedRemoteParticipantByIdentififer:(unint64_t)a3
{
  BOOL v5 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDAVCSession *)self pendingRemovedParticipantsByID];
  id v7 = +[NSNumber numberWithUnsignedLongLong:a3];
  id v8 = [v6 objectForKeyedSubscript:v7];

  return v8;
}

- (void)session:(id)a3 didDetectError:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "didDetectError: %@", (uint8_t *)&v9, 0xCu);
  }

  id v8 = [(CSDAVCSession *)self delegate];
  [v8 session:self didDetectError:v5];
}

- (void)sessionServerDidDisconnect:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_1003AFF60((uint64_t)v4, v6);
  }

  id v7 = [(CSDAVCSession *)self delegate];
  [v7 serverDisconnectedForSession:self];
}

- (void)session:(id)a3 addParticipant:(id)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  id v9 = a4;
  id v10 = a6;
  id v11 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v11);

  unsigned __int8 v12 = sub_100008DCC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v43 = v9;
    __int16 v44 = 1024;
    LODWORD(v45[0]) = v7;
    WORD2(v45[0]) = 2112;
    *(void *)((char *)v45 + 6) = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "addParticipant: %@ didSucceed: %d error: %@", buf, 0x1Cu);
  }

  id v13 = sub_100008DCC();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [(CSDAVCSession *)self remoteParticipantsByIdentifier];
    *(_DWORD *)buf = 138412546;
    id v43 = v9;
    __int16 v44 = 2112;
    v45[0] = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "addParticipant: %@ Active remote participants: %@", buf, 0x16u);
  }
  __int16 v15 = [(CSDAVCSession *)self delegate];
  if (v7)
  {
    id v16 = [v9 captionsToken];
    id v17 = sub_100008DCC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      id v43 = v16;
      __int16 v44 = 2112;
      v45[0] = v9;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Got captions token: %lu for participant %@", buf, 0x16u);
    }

    objc_msgSend(v15, "addedRemoteParticipantWithIdentifier:updatedAudioEnabled:updatedVideoEnabled:streamToken:screenToken:captionsToken:", objc_msgSend(v9, "participantID"), 1, objc_msgSend(v9, "isVideoEnabled"), objc_msgSend(v9, "videoToken"), objc_msgSend(v9, "screenToken"), v16);
    uint64_t v18 = [(CSDAVCSession *)self pendingRemovedParticipantsByID];
    CFStringRef v19 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v9 participantID]);
    __int16 v20 = [v18 objectForKeyedSubscript:v19];

    if (v20) {
      [(CSDAVCSession *)self removeParticipant:v20];
    }
  }
  else
  {
    char v21 = sub_100008DCC();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1003AFFD8();
    }

    id v22 = [(CSDAVCSession *)self remoteParticipantsByIdentifier];
    unsigned int v23 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v9 participantID]);
    [v22 setObject:0 forKeyedSubscript:v23];

    uint64_t v24 = [v10 userInfo];
    __int16 v20 = v24;
    if (v24)
    {
      uint64_t v25 = GKSErrorDetailedError;
      uint64_t v26 = [v24 objectForKeyedSubscript:GKSErrorDetailedError];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        [v10 code];
        goto LABEL_27;
      }
      id v28 = [v20 objectForKeyedSubscript:v25];
      unsigned __int8 v29 = [v28 isEqualToNumber:&off_100523BA8];

      char v30 = v29 ^ 1;
    }
    else
    {
      char v30 = 0;
    }
    if ([v10 code] == (id)32016 && (v30 & 1) == 0)
    {
      uint64_t v31 = objc_msgSend(v15, "session:conversationParticipantWithParticipantIdentifier:", self, objc_msgSend(v9, "participantID"));
      double v32 = sub_100008DCC();
      BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
      id v41 = (void *)v31;
      if (v31)
      {
        if (v33)
        {
          *(_DWORD *)buf = 138412546;
          id v43 = v9;
          __int16 v44 = 2112;
          v45[0] = v10;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Retrying to add participant after one to one mode changes %@: %@", buf, 0x16u);
        }

        double v32 = [(CSDAVCSession *)self session];
        id v34 = [v32 isVideoEnabled];
        double v35 = [(CSDAVCSession *)self session];
        id v36 = [v35 isAudioPaused];
        unint64_t v37 = [(CSDAVCSession *)self session];
        id v38 = [v37 isScreenEnabled];
        unint64_t v39 = self;
        __int16 v40 = v41;
        [(CSDAVCSession *)v39 queueAddParticipantRetryBlock:v41 withVideoEnabled:v34 audioPaused:v36 screenEnabled:v38];
      }
      else
      {
        if (v33)
        {
          *(_DWORD *)buf = 138412290;
          id v43 = v9;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[WARN] Delegate responded that we are not tracking active remote participant anymore, not retrying to add participant: %@", buf, 0xCu);
        }
        __int16 v40 = 0;
      }
    }
  }
LABEL_27:
}

- (void)session:(id)a3 removeParticipant:(id)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  id v9 = a4;
  id v10 = a6;
  id v11 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v11);

  unsigned __int8 v12 = sub_100008DCC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412802;
    id v20 = v9;
    __int16 v21 = 1024;
    BOOL v22 = v7;
    __int16 v23 = 2112;
    id v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "removeParticipant: %@ didSucceed: %d error: %@", (uint8_t *)&v19, 0x1Cu);
  }

  if (v7)
  {
    id v13 = [(CSDAVCSession *)self pendingRemovedParticipantsByID];
    uint64_t v14 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v9 participantID]);
    [v13 setObject:0 forKeyedSubscript:v14];
  }
  else
  {
    __int16 v15 = sub_100008DCC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1003B00D4();
    }

    id v16 = [(CSDAVCSession *)self remoteParticipantsByIdentifier];
    id v17 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v9 participantID]);
    [v16 setObject:v9 forKeyedSubscript:v17];

    id v13 = sub_100008DCC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1003B0040((uint64_t)v9, self);
    }
  }

  uint64_t v18 = [(CSDAVCSession *)self delegate];
  objc_msgSend(v18, "removedRemoteParticipantWithIdentifier:didSucceed:", objc_msgSend(v9, "participantID"), v7);
}

- (void)session:(id)a3 didUpdate:(BOOL)a4 configuration:(id)a5 error:(id)a6
{
  BOOL v7 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v11);

  unsigned __int8 v12 = sub_100008DCC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109634;
    v14[1] = v7;
    __int16 v15 = 2112;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "didUpdate: %d configuration: %@ error: %@", (uint8_t *)v14, 0x1Cu);
  }

  if (!v7)
  {
    id v13 = sub_100008DCC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1003B013C();
    }
  }
}

- (void)session:(id)a3 audioEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v10);

  id v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109634;
    v14[1] = v7;
    __int16 v15 = 1024;
    BOOL v16 = v6;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "audioEnabled: %d didSucceed: %d error: %@", (uint8_t *)v14, 0x18u);
  }

  unsigned __int8 v12 = [(CSDAVCSession *)self delegate];
  [v12 session:self changedLocalAudioEnabled:v7 didSucceed:v6 error:v9];

  if (v9)
  {
    id v13 = sub_100008DCC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1003B01A4();
    }
  }
}

- (void)session:(id)a3 videoEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v10);

  id v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109634;
    v14[1] = v7;
    __int16 v15 = 1024;
    BOOL v16 = v6;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "videoEnabled: %d didSucceed: %d error: %@", (uint8_t *)v14, 0x18u);
  }

  unsigned __int8 v12 = [(CSDAVCSession *)self delegate];
  [v12 session:self changedLocalVideoEnabled:v7 didSucceed:v6 error:v9];

  if (v9)
  {
    id v13 = sub_100008DCC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1003B020C();
    }
  }
}

- (void)session:(id)a3 screenEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v10);

  id v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    BOOL v29 = v7;
    __int16 v30 = 1024;
    BOOL v31 = v6;
    __int16 v32 = 2112;
    id v33 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "screenEnabled: %d didSucceed: %d error: %@", buf, 0x18u);
  }

  unsigned __int8 v12 = [(CSDAVCSession *)self delegate];
  [v12 session:self changedScreenEnabled:v7 didSucceed:v6 error:v9];

  if (v9)
  {
    id v13 = sub_100008DCC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1003B0274();
    }
LABEL_6:

    goto LABEL_7;
  }
  __int16 v15 = [(CSDAVCSession *)self captureSessionQueue];
  id v16 = [v15 count];

  if (v16 && v7)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v13 = [(CSDAVCSession *)self captureSessionQueue];
    id v17 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v24;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v24 != v19) {
            objc_enumerationMutation(v13);
          }
          uint64_t v21 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          BOOL v22 = sub_100008DCC();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "executing queued up block since screen enabled did succeed", buf, 2u);
          }

          (*(void (**)(uint64_t))(v21 + 16))(v21);
        }
        id v18 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v18);
    }
    goto LABEL_6;
  }
LABEL_7:
  uint64_t v14 = [(CSDAVCSession *)self captureSessionQueue];
  [v14 removeAllObjects];
}

- (void)session:(id)a3 audioPaused:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v10);

  id v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109634;
    v14[1] = v7;
    __int16 v15 = 1024;
    BOOL v16 = v6;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "audioPaused: %d didSucceed: %d error: %@", (uint8_t *)v14, 0x18u);
  }

  unsigned __int8 v12 = [(CSDAVCSession *)self delegate];
  [v12 session:self changedLocalAudioPaused:v7 didSucceed:v6 error:v9];

  if (v9)
  {
    id v13 = sub_100008DCC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1003B02DC();
    }
  }
}

- (void)session:(id)a3 videoPaused:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v10);

  id v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109634;
    v14[1] = v7;
    __int16 v15 = 1024;
    BOOL v16 = v6;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "videoPaused: %d didSucceed: %d error: %@", (uint8_t *)v14, 0x18u);
  }

  unsigned __int8 v12 = [(CSDAVCSession *)self delegate];
  [v12 session:self changedLocalVideoPaused:v7 didSucceed:v6 error:v9];

  if (v9)
  {
    id v13 = sub_100008DCC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1003B0344();
    }
  }
}

- (void)session:(id)a3 oneToOneEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v10);

  id v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    BOOL v35 = v7;
    __int16 v36 = 1024;
    BOOL v37 = v6;
    __int16 v38 = 2112;
    id v39 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "oneToOneEnabled: %d didSucceed: %d error: %@", buf, 0x18u);
  }

  uint64_t v12 = [(CSDAVCSession *)self mostRecentCompletedOneToOneEnabledValue];
  if (v12
    && (id v13 = (void *)v12,
        [(CSDAVCSession *)self mostRecentCompletedOneToOneEnabledValue],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        unsigned int v15 = [v14 intValue],
        v14,
        v13,
        v15 == v7))
  {
    BOOL v16 = sub_100008DCC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Already received oneToOneEnabled callback with this value, not handling", buf, 2u);
    }
  }
  else
  {
    if (v6)
    {
      __int16 v17 = +[NSNumber numberWithBool:v7];
      [(CSDAVCSession *)self setMostRecentCompletedOneToOneEnabledValue:v17];
    }
    if (v9)
    {
      id v18 = sub_100008DCC();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1003B03AC();
      }
    }
    uint64_t v19 = [(CSDAVCSession *)self delegate];
    [v19 session:self requestedOneToOneModeEnabled:v7 didSucceed:v6 error:v9];

    id v20 = [(CSDAVCSession *)self sessionUpdateCompletionQueue];
    BOOL v16 = v20;
    if (v6)
    {
      id v21 = [v20 copy];

      BOOL v22 = [(CSDAVCSession *)self sessionUpdateCompletionQueue];
      [v22 removeAllObjects];

      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      BOOL v16 = v21;
      id v23 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v30;
        do
        {
          long long v26 = 0;
          do
          {
            if (*(void *)v30 != v25) {
              objc_enumerationMutation(v16);
            }
            uint64_t v27 = *(void *)(*((void *)&v29 + 1) + 8 * (void)v26);
            id v28 = sub_100008DCC();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "executing queued up block since oneToOneEnabled succeeded", buf, 2u);
            }

            (*(void (**)(uint64_t))(v27 + 16))(v27);
            long long v26 = (char *)v26 + 1;
          }
          while (v24 != v26);
          id v24 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v24);
      }
    }
    else
    {
      [v20 removeAllObjects];
    }
  }
}

- (void)session:(id)a3 mediaStateDidChange:(unsigned int)a4 forMediaType:(unsigned int)a5 didSucceed:(BOOL)a6 error:(id)a7
{
  BOOL v7 = a6;
  id v11 = a7;
  uint64_t v12 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v12);

  id v13 = sub_100008DCC();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109890;
    v14[1] = a4;
    __int16 v15 = 1024;
    unsigned int v16 = a5;
    __int16 v17 = 1024;
    BOOL v18 = v7;
    __int16 v19 = 2112;
    id v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "mediaStateDidChange: %d forMediaType: %d didSucceed: %d error: %@", (uint8_t *)v14, 0x1Eu);
  }
}

- (void)sessionShouldReconnect:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "session: %@", (uint8_t *)&v8, 0xCu);
  }

  BOOL v7 = [(CSDAVCSession *)self delegate];
  [v7 sessionShouldReconnect:self];
}

- (void)session:(id)a3 mixingDidStartForMediaType:(unsigned int)a4 mixingMediaType:(unsigned int)a5
{
  int v8 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109376;
    v11[1] = a4;
    __int16 v12 = 1024;
    unsigned int v13 = a5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "mixingDidStartForMediaType: %d mixingMediaType: %d", (uint8_t *)v11, 0xEu);
  }

  if (a4 == 2 && a5 == 1)
  {
    id v10 = [(CSDAVCSession *)self delegate];
    [v10 session:self cameraMixedWithScreenDidChange:1];
  }
}

- (void)session:(id)a3 mixingDidStopForMediaType:(unsigned int)a4
{
  BOOL v6 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v6);

  BOOL v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "mixingDidStopForMediaType: %d", (uint8_t *)v9, 8u);
  }

  if (a4 == 2)
  {
    int v8 = [(CSDAVCSession *)self delegate];
    [v8 session:self cameraMixedWithScreenDidChange:0];
  }
}

- (void)session:(id)a3 didReact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "session: %@ didReact: %@", (uint8_t *)&v11, 0x16u);
  }

  id v10 = [(CSDAVCSession *)self delegate];
  [v10 session:self localParticipantDidReact:v7];
}

- (void)sessionDidStopReacting:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "session: %@ didStopReacting", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(CSDAVCSession *)self delegate];
  [v7 sessionLocalParticipantDidStopReacting:self];
}

- (void)participant:(id)a3 remoteAudioEnabledDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v7);

  int v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 1024;
    BOOL v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "participant: %@ remoteAudioEnabledDidChange: %d", (uint8_t *)&v10, 0x12u);
  }

  id v9 = [(CSDAVCSession *)self delegate];
  objc_msgSend(v9, "remoteParticipantWithIdentifier:updatedAudioEnabled:streamToken:screenToken:captionsToken:", objc_msgSend(v6, "participantID"), v4, objc_msgSend(v6, "videoToken"), objc_msgSend(v6, "screenToken"), objc_msgSend(v6, "captionsToken"));
}

- (void)participant:(id)a3 remoteVideoEnabledDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v7);

  int v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 1024;
    BOOL v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "participant: %@ remoteVideoEnabledDidChange: %d", (uint8_t *)&v10, 0x12u);
  }

  id v9 = [(CSDAVCSession *)self delegate];
  objc_msgSend(v9, "remoteParticipantWithIdentifier:updatedVideoEnabled:streamToken:screenToken:captionsToken:", objc_msgSend(v6, "participantID"), v4, objc_msgSend(v6, "videoToken"), objc_msgSend(v6, "screenToken"), objc_msgSend(v6, "captionsToken"));
}

- (void)participant:(id)a3 remoteAudioPausedDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v7);

  int v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 1024;
    BOOL v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "participant: %@ remoteAudioPausedDidChange: %d", (uint8_t *)&v10, 0x12u);
  }

  id v9 = [(CSDAVCSession *)self delegate];
  objc_msgSend(v9, "remoteParticipantWithIdentifier:updatedAudioPaused:streamToken:", objc_msgSend(v6, "participantID"), v4, objc_msgSend(v6, "videoToken"));
}

- (void)participant:(id)a3 screenEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v9 = a3;
  int v10 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v10);

  id v11 = [(CSDAVCSession *)self remoteParticipantsByIdentifier];
  __int16 v12 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v9 participantID]);
  BOOL v13 = [v11 objectForKeyedSubscript:v12];

  if (v13)
  {
    unsigned int v14 = [(CSDAVCSession *)self isRemoteScreenEnabledForParticipant:v9];
    __int16 v15 = sub_100008DCC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138413058;
      id v18 = v9;
      __int16 v19 = 1024;
      BOOL v20 = v7;
      __int16 v21 = 1024;
      BOOL v22 = v6;
      __int16 v23 = 1024;
      unsigned int v24 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "participant: %@ screenEnabled: %d didSucceed: %d remoteScreenEnabled: %d", (uint8_t *)&v17, 0x1Eu);
    }

    unsigned int v16 = [(CSDAVCSession *)self delegate];
    objc_msgSend(v16, "remoteParticipantWithIdentifier:updatedScreenEnabled:streamToken:screenToken:captionsToken:", objc_msgSend(v9, "participantID"), v7 & v14, objc_msgSend(v9, "videoToken"), objc_msgSend(v9, "screenToken"), objc_msgSend(v9, "captionsToken"));
  }
}

- (void)participant:(id)a3 remoteScreenEnabledDidChange:(BOOL)a4
{
  id v4 = (id)a4;
  id v6 = a3;
  BOOL v7 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v7);

  int v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412802;
    id v11 = v6;
    __int16 v12 = 1024;
    int v13 = (int)v4;
    __int16 v14 = 1024;
    unsigned int v15 = [v6 isScreenEnabled];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "participant: %@ remoteScreenEnabledDidChange: %d participantScreenEnabled: %d", (uint8_t *)&v10, 0x18u);
  }

  if (v4) {
    id v4 = [v6 isScreenEnabled];
  }
  id v9 = [(CSDAVCSession *)self delegate];
  objc_msgSend(v9, "remoteParticipantWithIdentifier:updatedScreenEnabled:streamToken:screenToken:captionsToken:", objc_msgSend(v6, "participantID"), v4, objc_msgSend(v6, "videoToken"), objc_msgSend(v6, "screenToken"), objc_msgSend(v6, "captionsToken"));
}

- (void)participant:(id)a3 mediaPrioritiesDidChange:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [v6 objectForKeyedSubscript:AVCSessionParticipantMediaTypeKeyAudio];
  id v10 = [v9 integerValue];

  id v11 = [v6 objectForKeyedSubscript:AVCSessionParticipantMediaTypeKeyVideo];

  id v12 = [v11 integerValue];
  id v14 = [(CSDAVCSession *)self delegate];
  id v13 = [v7 participantID];

  [v14 remoteParticipantWithIdentifier:v13 didChangeAudioPriority:v10 videoPriority:v12];
}

- (void)participant:(id)a3 didReact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "participant: %@ didReact: %@", (uint8_t *)&v11, 0x16u);
  }

  id v10 = [(CSDAVCSession *)self delegate];
  objc_msgSend(v10, "remoteParticipantWithIdentifier:didReact:", objc_msgSend(v6, "participantID"), v7);
}

- (void)participant:(id)a3 remoteMediaStateDidChange:(unsigned int)a4 forMediaType:(unsigned int)a5
{
  id v8 = a3;
  id v9 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v9);

  id v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412802;
    id v12 = v8;
    __int16 v13 = 1024;
    unsigned int v14 = a4;
    __int16 v15 = 1024;
    unsigned int v16 = a5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "participant: %@ remoteMediaStateDidChange: %d forMediaType: %d", (uint8_t *)&v11, 0x18u);
  }
}

- (void)participant:(id)a3 mixingDidStartForMediaType:(unsigned int)a4 mixingMediaType:(unsigned int)a5
{
  id v8 = a3;
  id v9 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v9);

  id v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412802;
    id v13 = v8;
    __int16 v14 = 1024;
    unsigned int v15 = a4;
    __int16 v16 = 1024;
    unsigned int v17 = a5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "participant: %@ mixingDidStartForMediaType: %d mixingMediaType: %d", (uint8_t *)&v12, 0x18u);
  }

  if (a4 == 2 && a5 == 1)
  {
    int v11 = [(CSDAVCSession *)self delegate];
    objc_msgSend(v11, "remoteParticipantWithIdentifier:cameraMixedWithScreenDidChange:", objc_msgSend(v8, "participantID"), 1);
  }
}

- (void)participant:(id)a3 mixingDidStopForMediaType:(unsigned int)a4
{
  id v6 = a3;
  id v7 = [(CSDAVCSession *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 1024;
    unsigned int v13 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "participant: %@ mixingDidStopForMediaType: %d", (uint8_t *)&v10, 0x12u);
  }

  if (a4 == 2)
  {
    id v9 = [(CSDAVCSession *)self delegate];
    objc_msgSend(v9, "remoteParticipantWithIdentifier:cameraMixedWithScreenDidChange:", objc_msgSend(v6, "participantID"), 0);
  }
}

- (void)screenCapture:(id)a3 didStart:(BOOL)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int v10 = [(CSDAVCSession *)self queue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10019F178;
  _OWORD v13[3] = &unk_100506C18;
  BOOL v17 = a4;
  id v14 = v8;
  id v15 = v9;
  __int16 v16 = self;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)screenCapture:(id)a3 didStop:(BOOL)a4 withError:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  int v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v17 = v8;
    __int16 v18 = 1024;
    BOOL v19 = v6;
    __int16 v20 = 2112;
    id v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "screenCapture: %@ didStop: %d, captureWithError: %@", buf, 0x1Cu);
  }

  id v11 = [(CSDAVCSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10019F3FC;
  block[3] = &unk_1005050D0;
  BOOL v15 = v6;
  block[4] = self;
  id v14 = v9;
  id v12 = v9;
  dispatch_async(v11, block);
}

- (void)screenCapture:(id)a3 didUpdateAttributes:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v20 = v8;
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "screenCapture: %@ didUpdateAttributes: %@, error: %@", buf, 0x20u);
  }

  id v12 = [(CSDAVCSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10019F748;
  block[3] = &unk_100504FE0;
  id v16 = v10;
  id v17 = v9;
  __int16 v18 = self;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(v12, block);
}

- (BOOL)isRemoteScreenEnabledForParticipant:(id)a3
{
  id v3 = a3;
  BOOL v4 = (objc_opt_respondsToSelector() & 1) != 0 && [v3 performSelector:"remoteScreenEnabled"] != 0;

  return v4;
}

- (int64_t)localCaptionsToken
{
  id v3 = [(CSDAVCSession *)self session];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = [(CSDAVCSession *)self session];
  id v6 = [v5 streamTokenForStreamGroupID:1667330164];

  return (int64_t)v6;
}

- (BOOL)isVideo
{
  return self->_video;
}

- (BOOL)isRelaying
{
  return self->_relaying;
}

- (BOOL)isScreening
{
  return self->_screening;
}

- (AVCSession)session
{
  return self->_session;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSDAVCSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSDAVCSessionDelegate *)WeakRetained;
}

- (NSMutableDictionary)remoteParticipantsByIdentifier
{
  return self->_remoteParticipantsByIdentifier;
}

- (NSMutableDictionary)pendingRemovedParticipantsByID
{
  return self->_pendingRemovedParticipantsByID;
}

- (id)captureSessionCreationBlock
{
  return self->_captureSessionCreationBlock;
}

- (TUCallScreenShareAttributes)mostRecentScreenShareAttributes
{
  return self->_mostRecentScreenShareAttributes;
}

- (void)setMostRecentScreenShareAttributes:(id)a3
{
}

- (BOOL)hasCalledStop
{
  return self->_hasCalledStop;
}

- (void)setHasCalledStop:(BOOL)a3
{
  self->_hasCalledStop = a3;
}

- (NSNumber)mostRecentCompletedOneToOneEnabledValue
{
  return self->_mostRecentCompletedOneToOneEnabledValue;
}

- (void)setMostRecentCompletedOneToOneEnabledValue:(id)a3
{
}

- (AVCScreenCapture)avcScreenCapture
{
  return self->_avcScreenCapture;
}

- (void)setAvcScreenCapture:(id)a3
{
}

- (unsigned)captureCapabilities
{
  return self->_captureCapabilities;
}

- (void)setCaptureCapabilities:(unsigned __int8)a3
{
  self->_captureCapabilities = a3;
}

- (void)setFeatureFlags:(id)a3
{
}

- (NSMutableArray)captureSessionQueue
{
  return self->_captureSessionQueue;
}

- (NSMutableArray)sessionUpdateCompletionQueue
{
  return self->_sessionUpdateCompletionQueue;
}

- (id)avcSessionParticipantCreationBlock
{
  return self->_avcSessionParticipantCreationBlock;
}

- (void)setAvcSessionParticipantCreationBlock:(id)a3
{
}

- (TUCallScreenShareAttributes)currentLocalScreenShareAttributes
{
  return self->_currentLocalScreenShareAttributes;
}

- (void)setCurrentLocalScreenShareAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLocalScreenShareAttributes, 0);
  objc_storeStrong(&self->_avcSessionParticipantCreationBlock, 0);
  objc_storeStrong((id *)&self->_sessionUpdateCompletionQueue, 0);
  objc_storeStrong((id *)&self->_captureSessionQueue, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_avcScreenCapture, 0);
  objc_storeStrong((id *)&self->_mostRecentCompletedOneToOneEnabledValue, 0);
  objc_storeStrong((id *)&self->_mostRecentScreenShareAttributes, 0);
  objc_storeStrong(&self->_captureSessionCreationBlock, 0);
  objc_storeStrong((id *)&self->_pendingRemovedParticipantsByID, 0);
  objc_storeStrong((id *)&self->_remoteParticipantsByIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end