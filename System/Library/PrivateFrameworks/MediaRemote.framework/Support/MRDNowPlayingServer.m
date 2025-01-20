@interface MRDNowPlayingServer
- (BOOL)_hasForwarderForOrigin:(id)a3;
- (BOOL)activePlayerIsPlaying;
- (BOOL)hasElectedPlayer;
- (BOOL)localActivePlayerIsPlaying;
- (BOOL)lockScreenPlatterActive;
- (BOOL)lockScreenRecommendationActive;
- (BOOL)nowPlayingLauncher:(id)a3 shouldRelaunch:(id)a4;
- (MRDElectedPlayerController)electedPlayerController;
- (MRDLockScreenController)lockScreenController;
- (MRDLockScreenRoutingControllerProtocol)lockScreenRoutingController;
- (MRDNowPlayingClient)activeNowPlayingClient;
- (MRDNowPlayingClient)localActiveNowPlayingClient;
- (MRDNowPlayingLauncher)nowPlayingCapLauncher;
- (MRDNowPlayingOriginClient)activeOriginClient;
- (MRDNowPlayingOriginClient)companionOriginClient;
- (MRDNowPlayingOriginClient)localOriginClient;
- (MRDNowPlayingPlayerClient)activePlayerClient;
- (MRDNowPlayingPlayerClient)localActivePlayerClient;
- (MRDNowPlayingServer)init;
- (MRPlayerPath)activePlayerPath;
- (MRPlayerPath)localActivePlayerPath;
- (NSArray)originClients;
- (NSSet)allLocalNowPlayingInfoClients;
- (NSSet)allNowPlayingInfoClients;
- (NSString)activeClientBundleIdentifier;
- (NSString)localActiveClientBundleIdentifier;
- (id)_createLockScreenRoutingController;
- (id)_onQueue_activeOriginClient;
- (id)_onQueue_allNowPlayingInfoClients;
- (id)_onQueue_allNowPlayingInfoClientsForOrigin:(id)a3;
- (id)_onQueue_companionOriginClient;
- (id)_onQueue_originClientForDeviceUID:(id)a3;
- (id)_onQueue_originClientForGroupLeaderOfDeviceUID:(id)a3;
- (id)_onQueue_originClientForOrigin:(id)a3;
- (id)_onQueue_queryExistingPlayerPath:(id)a3;
- (id)_onQueue_restoredActiveOrigin;
- (id)augmentedUserInfoForPlayerPath:(id)a3;
- (id)localPlayersForXpcClient:(id)a3;
- (id)onQueue_resolveExistingPlayerPath:(id)a3;
- (id)originClientForDeviceUID:(id)a3;
- (id)originClientForGroupLeaderOfDeviceUID:(id)a3;
- (id)originClientForOrigin:(id)a3;
- (id)overrideClient;
- (id)queryExistingPlayerPath:(id)a3;
- (id)queryExistingPlayerPathForXPCMessage:(id)a3 forClient:(id)a4;
- (id)queryPlayerPath:(id)a3 forClient:(id)a4;
- (id)queryPlayerPathForXPCMessage:(id)a3 fromClient:(id)a4;
- (id)resolveExistingPlayerPath:(id)a3;
- (id)resolvePlayerPath:(id)a3 fromClient:(id)a4;
- (id)resolvePlayerPath:(id)a3 fromClient:(id)a4 useDefaultPlayerIfNoneSpecified:(BOOL)a5;
- (id)xpcClientForPlayerPath:(id)a3;
- (int)activeClientPID;
- (int)localActiveClientPID;
- (unsigned)activePlayerPlaybackState;
- (unsigned)localActivePlayerPlaybackState;
- (void)_addOrigin:(id)a3 withDeviceInfo:(id)a4 emitNotification:(BOOL)a5;
- (void)_handleBeginApplicationActivityMessage:(id)a3 fromClient:(id)a4;
- (void)_handleBeginMusicHandoffSessionMessage:(id)a3 fromClient:(id)a4;
- (void)_handleContentItemArtworkChangedMessage:(id)a3 fromClient:(id)a4;
- (void)_handleContentItemChangedMessage:(id)a3 fromClient:(id)a4;
- (void)_handleEndApplicationActivityMessage:(id)a3 fromClient:(id)a4;
- (void)_handleFetchPlaybackQueueParticipantsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetActiveOriginMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetActivePlayerPathsForLocalOriginMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetAnyAppIsPlayingMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetApplicationActivityMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetAudioFormatContentInfoForOriginMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetAvailableOriginsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetClientPropertiesMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetDeviceInfo:(id)a3 fromClient:(id)a4;
- (void)_handleGetElectedPlayerPathMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetImageDimensionsForArtworkDataMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetLastPlayingDateMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetNowPlayingClientMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetNowPlayingClientsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetNowPlayingPlayerMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetNowPlayingPlayersMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetPlaybackStateMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetPlayerPictureInPictureEnabledMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetPlayerPropertiesMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetSupportedCommandsMessage:(id)a3 fromClient:(id)a4;
- (void)_handlePlaybackSessionRequest:(id)a3 fromClient:(id)a4;
- (void)_handleRegisterForWakingNowPlayingNotifications:(id)a3 fromClient:(id)a4;
- (void)_handleRemoveNowPlayingClientMessage:(id)a3 fromClient:(id)a4;
- (void)_handleRemoveNowPlayingPlayerMessage:(id)a3 fromClient:(id)a4;
- (void)_handleRequestAudioAmplitudeSamplesMessage:(id)a3 fromClient:(id)a4;
- (void)_handleRequestPlaybackQueueCapabilities:(id)a3 fromClient:(id)a4;
- (void)_handleRequestVideoThumbnailsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleResetPlaybackQueueRequests:(id)a3 fromClient:(id)a4;
- (void)_handleResolvePlayerPath:(id)a3 fromClient:(id)a4;
- (void)_handleSendLyricsEvent:(id)a3 fromClient:(id)a4;
- (void)_handleSendMusicHandoffEventMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetActiveOriginMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetCanBeNowPlayingAppMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetCanBeNowPlayingPlayerMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetClientPropertiesMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetDefaultSupportedCommandsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetHardwareRemoteBehaviorMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetNowPlayingAppOverrideMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetNowPlayingClientMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetNowPlayingPlayerMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetOriginClientPropertiesMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetOverriddenNowPlayingAppMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetPlaybackQueue:(id)a3 fromClient:(id)a4;
- (void)_handleSetPlaybackQueueCapabilities:(id)a3 fromClient:(id)a4;
- (void)_handleSetPlaybackStateMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetPlayerClientPropertiesMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetPlayerPictureInPictureEnabledMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetPlayerPropertiesMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetSupportedCommandsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleUpdateClientPropertiesMessage:(id)a3 fromClient:(id)a4;
- (void)_handleUpdatePlayerPropertiesMessage:(id)a3 fromClient:(id)a4;
- (void)_onQueue_savePersistentActiveOrigin:(id)a3;
- (void)_onQueue_setActiveOrigin:(id)a3 saveState:(BOOL)a4;
- (void)_removeNowPlayingClient:(id)a3 forOrigin:(id)a4;
- (void)_removeOrigin:(id)a3;
- (void)beginMusicHandoffSessionWithSource:(id)a3 destination:(id)a4 completion:(id)a5;
- (void)clearNowPlayingClientForXPCClient:(id)a3;
- (void)collectDiagnostic:(id)a3;
- (void)dealloc;
- (void)electedPlayerController:(id)a3 electedPlayerDidChange:(id)a4 change:(int64_t)a5 event:(int64_t)a6 reason:(id)a7;
- (void)handleNowPlayingOriginClient:(id)a3 deviceInfoDidChange:(id)a4 previousDeviceInfo:(id)a5;
- (void)handleXPCMessage:(id)a3 fromClient:(id)a4;
- (void)lockScreenController:(id)a3 lockScreenWidgetActiveDidChange:(BOOL)a4;
- (void)lockScreenController:(id)a3 lockScreenWidgetVisibleDidChange:(BOOL)a4;
- (void)lockScreenController:(id)a3 playerPathDidChange:(id)a4;
- (void)maybePostDistributedNotifications;
- (void)nowPlayingClient:(id)a3 activePlayerDidChangeFromPlayerClient:(id)a4 toPlayerClient:(id)a5;
- (void)nowPlayingClient:(id)a3 applicationDidForeground:(BOOL)a4;
- (void)nowPlayingClient:(id)a3 clientStateDidChange:(id)a4;
- (void)nowPlayingClient:(id)a3 playerDidRegister:(id)a4;
- (void)nowPlayingClient:(id)a3 playerDidUnregister:(id)a4;
- (void)nowPlayingOriginClient:(id)a3 activePlayerClientsDidChange:(id)a4;
- (void)nowPlayingOriginClient:(id)a3 activePlayerPathDidChange:(id)a4 withPlaybackState:(unsigned int)a5;
- (void)nowPlayingOriginClient:(id)a3 applicationActivityDidBegin:(id)a4;
- (void)nowPlayingOriginClient:(id)a3 applicationActivityDidEnd:(id)a4;
- (void)nowPlayingOriginClient:(id)a3 applicationActivityStatusDidChange:(id)a4;
- (void)nowPlayingOriginClient:(id)a3 clientDidRegister:(id)a4;
- (void)nowPlayingOriginClient:(id)a3 clientDidUnregister:(id)a4;
- (void)nowPlayingOriginClient:(id)a3 currentRouteIsMutedDidChange:(BOOL)a4;
- (void)nowPlayingOriginClient:(id)a3 currentRouteVolumeControlCapabilitiesDidChange:(unsigned int)a4;
- (void)nowPlayingOriginClient:(id)a3 currentRouteVolumeDidChange:(float)a4;
- (void)nowPlayingOriginClientDidChangeAudioFormatContentInfo:(id)a3;
- (void)nowPlayingOriginClientPlaybackDidTimeout:(id)a3;
- (void)nowPlayingPlayerClient:(id)a3 clientCanBeNowPlayingDidChange:(BOOL)a4;
- (void)nowPlayingPlayerClient:(id)a3 isPlayingDidChange:(BOOL)a4;
- (void)nowPlayingPlayerClient:(id)a3 pictureInPictureEnabledDidChange:(BOOL)a4;
- (void)nowPlayingPlayerClient:(id)a3 playbackQueueArtworkContentItemsDidChange:(id)a4;
- (void)nowPlayingPlayerClient:(id)a3 playbackQueueCapabilitiesDidChange:(unint64_t)a4;
- (void)nowPlayingPlayerClient:(id)a3 playbackQueueContentItemsDidChange:(id)a4;
- (void)nowPlayingPlayerClient:(id)a3 playbackQueueDidChange:(id)a4 nowPlayingItemDidChange:(BOOL)a5;
- (void)nowPlayingPlayerClient:(id)a3 playbackQueueParticipantsDidChange:(id)a4;
- (void)nowPlayingPlayerClient:(id)a3 playbackStateDidChange:(unsigned int)a4;
- (void)nowPlayingPlayerClient:(id)a3 playerCanBeNowPlayingDidChange:(BOOL)a4;
- (void)nowPlayingPlayerClient:(id)a3 playerStateDidChange:(id)a4;
- (void)nowPlayingPlayerClient:(id)a3 supportedCommandsDidChange:(id)a4;
- (void)nowPlayingServer:(id)a3 activeOriginDidChangeFromOriginClient:(id)a4 toOriginClient:(id)a5;
- (void)postActiveOriginDidChange:(id)a3 withPlaybackState:(unsigned int)a4 handler:(id)a5;
- (void)postActivePlayerDidChangeForPlayerPath:(id)a3 withPlaybackState:(unsigned int)a4 handler:(id)a5;
- (void)postActivePlayerPathsDidChangeForOrigin:(id)a3 handler:(id)a4;
- (void)postAudioFormatContentInfoDidChangeForOrigin:(id)a3 handler:(id)a4;
- (void)postClientDidRegisterCanBeNowPlayingForPlayerPath:(id)a3 handler:(id)a4;
- (void)postClientDidRegisterForPlayerPath:(id)a3 handler:(id)a4;
- (void)postClientDidUnregisterCanBeNowPlayingForPlayerPath:(id)a3 handler:(id)a4;
- (void)postClientDidUnregisterForPlayerPath:(id)a3 hasDefaultSupportedCommands:(BOOL)a4 canBeNowPlaying:(BOOL)a5 handler:(id)a6;
- (void)postClientNowPlayingNotificationNamed:(id)a3 userInfo:(id)a4;
- (void)postClientNowPlayingNotificationNamed:(id)a3 userInfo:(id)a4 predicate:(id)a5;
- (void)postDeviceInfoDidChange:(id)a3 previousDeviceInfo:(id)a4 forOrigin:(id)a5 handler:(id)a6;
- (void)postElectedPlayerDidChange:(id)a3 change:(int64_t)a4 event:(int64_t)a5 reason:(id)a6 handler:(id)a7;
- (void)postIsMutedDidChange:(id)a3 isMuted:(BOOL)a4 handler:(id)a5;
- (void)postIsPlayingDidChange:(BOOL)a3 lastPlayingTimestamp:(double)a4 forPlayerPath:(id)a5 handler:(id)a6;
- (void)postLockScreenActiveDidChange:(BOOL)a3 handler:(id)a4;
- (void)postLockScreenControlsDidChangeDistributedNotification;
- (void)postLockScreenPlayerPathDidChange:(id)a3 handler:(id)a4;
- (void)postLockScreenVisibleDidChange:(BOOL)a3 handler:(id)a4;
- (void)postNowPlayingApplicationDidChangeForPlayerPath:(id)a3 withPlaybackState:(unsigned int)a4 handler:(id)a5;
- (void)postNowPlayingClientStateDidChange:(id)a3 forPlayerPath:(id)a4 handler:(id)a5;
- (void)postNowPlayingPlayerStateDidChange:(id)a3 forPlayerPath:(id)a4 handler:(id)a5;
- (void)postOriginDidRegister:(id)a3 handler:(id)a4;
- (void)postOriginDidUnRegister:(id)a3 deviceInfo:(id)a4 handler:(id)a5;
- (void)postPictureInPictureDidChange:(BOOL)a3 forPlayerPath:(id)a4 handler:(id)a5;
- (void)postPlaybackQueueCapabilitiesDidChange:(unint64_t)a3 forPlayerPath:(id)a4 handler:(id)a5;
- (void)postPlaybackQueueContentItemsArtworkDidChange:(id)a3 forPlayerPath:(id)a4 handler:(id)a5;
- (void)postPlaybackQueueContentItemsDidChange:(id)a3 forPlayerPath:(id)a4 handler:(id)a5;
- (void)postPlaybackQueueDidChange:(id)a3 nowPlayingItemDidChange:(BOOL)a4 forPlayerPath:(id)a5 handler:(id)a6;
- (void)postPlaybackQueueParticipantsDidChange:(id)a3 forPlayerPath:(id)a4 handler:(id)a5;
- (void)postPlaybackStateDidChange:(unsigned int)a3 forPlayerPath:(id)a4 handler:(id)a5;
- (void)postPlayerDidRegisterCanBeNowPlayingForPlayerPath:(id)a3 handler:(id)a4;
- (void)postPlayerDidRegisterForPlayerPath:(id)a3 handler:(id)a4;
- (void)postPlayerDidUnregisterCanBeNowPlayingForPlayerPath:(id)a3 handler:(id)a4;
- (void)postPlayerDidUnregisterWithPlaybackState:(unsigned int)a3 canBeNowPlaying:(BOOL)a4 forPlayerPath:(id)a5 handler:(id)a6;
- (void)postSupportedCommandsDidChange:(id)a3 forPlayerPath:(id)a4 handler:(id)a5;
- (void)postVolumeCapabilitiesDidChange:(id)a3 capabilities:(unsigned int)a4 handler:(id)a5;
- (void)postVolumeDidChange:(id)a3 volume:(float)a4 handler:(id)a5;
- (void)registerOrigin:(id)a3 deviceInfo:(id)a4;
- (void)registerOriginForwarder:(id)a3;
- (void)reregisterOrigin:(id)a3 deviceInfo:(id)a4;
- (void)restoreClientState:(id)a3 handler:(id)a4;
- (void)restoreDeviceInfoToClient:(id)a3 handler:(id)a4;
- (void)setActiveOrigin:(id)a3;
- (void)setActiveOriginClient:(id)a3;
- (void)setLocalOriginClient:(id)a3;
- (void)setNowPlayingCapLauncher:(id)a3;
- (void)setOverrideClient:(id)a3;
- (void)startObservingNowPlayingInfoForNowPlayingPlayerClient:(id)a3;
- (void)stopObservingNowPlayingInfo;
- (void)unregisterOrigin:(id)a3;
- (void)unregisterOriginForwarder:(id)a3;
- (void)updateDeviceInfo:(id)a3 origin:(id)a4;
- (void)wakeDeviceIfNecessaryForNowPlayingPlayerClient:(id)a3;
@end

@implementation MRDNowPlayingServer

- (id)_onQueue_activeOriginClient
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v3 = self->_activeOriginClient;
  if (!v3) {
    v3 = self->_localOriginClient;
  }

  return v3;
}

- (id)resolveExistingPlayerPath:(id)a3
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_1000F15E8;
  v10 = sub_1000F15F8;
  id v11 = 0;
  id v5 = a3;
  msv_dispatch_sync_on_queue();
  id v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)handleXPCMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t uint64 = xpc_dictionary_get_uint64(v6, "MRXPC_MESSAGE_ID_KEY");
  v9 = _MRLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 134218498;
    uint64_t v12 = uint64;
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Received Now Playing message %llu from client %@ : %@", (uint8_t *)&v11, 0x20u);
  }

  switch(uint64)
  {
    case 0x200000000000001uLL:
      [(MRDNowPlayingServer *)self _handleSetNowPlayingAppOverrideMessage:v6 fromClient:v7];
      break;
    case 0x200000000000002uLL:
      [(MRDNowPlayingServer *)self _handleSetOverriddenNowPlayingAppMessage:v6 fromClient:v7];
      break;
    case 0x200000000000003uLL:
      [(MRDNowPlayingServer *)self _handleBeginApplicationActivityMessage:v6 fromClient:v7];
      break;
    case 0x200000000000004uLL:
      [(MRDNowPlayingServer *)self _handleGetApplicationActivityMessage:v6 fromClient:v7];
      break;
    case 0x200000000000005uLL:
      [(MRDNowPlayingServer *)self _handleEndApplicationActivityMessage:v6 fromClient:v7];
      break;
    case 0x200000000000006uLL:
      [(MRDNowPlayingServer *)self _handleSetCanBeNowPlayingAppMessage:v6 fromClient:v7];
      break;
    case 0x200000000000007uLL:
      [(MRDNowPlayingPlaybackQueueServer *)self->_playbackQueueServer handlePlaybackQueueRequest:v6 fromClient:v7];
      break;
    case 0x200000000000008uLL:
      [(MRDNowPlayingServer *)self _handleSetPlaybackQueue:v6 fromClient:v7];
      break;
    case 0x200000000000009uLL:
      [(MRDNowPlayingServer *)self _handleRequestPlaybackQueueCapabilities:v6 fromClient:v7];
      break;
    case 0x20000000000000AuLL:
      [(MRDNowPlayingServer *)self _handleSetPlaybackQueueCapabilities:v6 fromClient:v7];
      break;
    case 0x20000000000000BuLL:
      [(MRDNowPlayingServer *)self _handleResetPlaybackQueueRequests:v6 fromClient:v7];
      break;
    case 0x20000000000000CuLL:
      [(MRDNowPlayingServer *)self _handleGetClientPropertiesMessage:v6 fromClient:v7];
      break;
    case 0x20000000000000DuLL:
      [(MRDNowPlayingServer *)self _handleSetClientPropertiesMessage:v6 fromClient:v7];
      break;
    case 0x20000000000000EuLL:
      [(MRDNowPlayingServer *)self _handleUpdateClientPropertiesMessage:v6 fromClient:v7];
      break;
    case 0x20000000000000FuLL:
      [(MRDNowPlayingServer *)self _handleGetPlayerPropertiesMessage:v6 fromClient:v7];
      break;
    case 0x200000000000010uLL:
      [(MRDNowPlayingServer *)self _handleSetPlayerPropertiesMessage:v6 fromClient:v7];
      break;
    case 0x200000000000011uLL:
      [(MRDNowPlayingServer *)self _handleUpdatePlayerPropertiesMessage:v6 fromClient:v7];
      break;
    case 0x200000000000012uLL:
      [(MRDNowPlayingServer *)self _handleGetPlaybackStateMessage:v6 fromClient:v7];
      break;
    case 0x200000000000013uLL:
      [(MRDNowPlayingServer *)self _handleSetPlaybackStateMessage:v6 fromClient:v7];
      break;
    case 0x200000000000014uLL:
      [(MRDNowPlayingServer *)self _handleGetAnyAppIsPlayingMessage:v6 fromClient:v7];
      break;
    case 0x200000000000015uLL:
      [(MRDNowPlayingServer *)self _handleRequestVideoThumbnailsMessage:v6 fromClient:v7];
      break;
    case 0x200000000000016uLL:
      [(MRDNowPlayingServer *)self _handleRequestAudioAmplitudeSamplesMessage:v6 fromClient:v7];
      break;
    case 0x200000000000017uLL:
      [(MRDNowPlayingServer *)self _handleSendLyricsEvent:v6 fromClient:v7];
      break;
    case 0x200000000000018uLL:
      [(MRDNowPlayingServer *)self _handleResolvePlayerPath:v6 fromClient:v7];
      break;
    case 0x200000000000019uLL:
      [(MRDNowPlayingServer *)self _handleGetAvailableOriginsMessage:v6 fromClient:v7];
      break;
    case 0x20000000000001AuLL:
      [(MRDNowPlayingServer *)self _handleSetActiveOriginMessage:v6 fromClient:v7];
      break;
    case 0x20000000000001BuLL:
      [(MRDNowPlayingServer *)self _handleGetActiveOriginMessage:v6 fromClient:v7];
      break;
    case 0x20000000000001FuLL:
      [(MRDNowPlayingServer *)self _handleGetNowPlayingClientsMessage:v6 fromClient:v7];
      break;
    case 0x200000000000020uLL:
      [(MRDNowPlayingServer *)self _handleSetNowPlayingClientMessage:v6 fromClient:v7];
      break;
    case 0x200000000000021uLL:
      [(MRDNowPlayingServer *)self _handleGetNowPlayingClientMessage:v6 fromClient:v7];
      break;
    case 0x200000000000022uLL:
      [(MRDNowPlayingServer *)self _handleRemoveNowPlayingClientMessage:v6 fromClient:v7];
      break;
    case 0x200000000000023uLL:
      [(MRDNowPlayingServer *)self _handleGetNowPlayingPlayersMessage:v6 fromClient:v7];
      break;
    case 0x200000000000024uLL:
      [(MRDNowPlayingServer *)self _handleSetNowPlayingPlayerMessage:v6 fromClient:v7];
      break;
    case 0x200000000000025uLL:
      [(MRDNowPlayingServer *)self _handleGetNowPlayingPlayerMessage:v6 fromClient:v7];
      break;
    case 0x200000000000026uLL:
      [(MRDNowPlayingServer *)self _handleRemoveNowPlayingPlayerMessage:v6 fromClient:v7];
      break;
    case 0x200000000000027uLL:
      [(MRDNowPlayingServer *)self _handleGetActivePlayerPathsForLocalOriginMessage:v6 fromClient:v7];
      break;
    case 0x200000000000029uLL:
      [(MRDNowPlayingServer *)self _handleSetHardwareRemoteBehaviorMessage:v6 fromClient:v7];
      break;
    case 0x20000000000002AuLL:
      [(MRDNowPlayingServer *)self _handleContentItemArtworkChangedMessage:v6 fromClient:v7];
      break;
    case 0x20000000000002BuLL:
      [(MRDNowPlayingServer *)self _handleContentItemChangedMessage:v6 fromClient:v7];
      break;
    case 0x20000000000002CuLL:
      [(MRDNowPlayingServer *)self _handleGetDeviceInfo:v6 fromClient:v7];
      break;
    case 0x20000000000002EuLL:
      [(MRDNowPlayingServer *)self _handleGetElectedPlayerPathMessage:v6 fromClient:v7];
      break;
    case 0x20000000000002FuLL:
      [(MRDNowPlayingServer *)self _handlePlaybackSessionRequest:v6 fromClient:v7];
      break;
    case 0x200000000000030uLL:
      [(MRDNowPlayingServer *)self _handleGetSupportedCommandsMessage:v6 fromClient:v7];
      break;
    case 0x200000000000031uLL:
      [(MRDNowPlayingServer *)self _handleSetSupportedCommandsMessage:v6 fromClient:v7];
      break;
    case 0x200000000000032uLL:
      [(MRDNowPlayingServer *)self _handleSetDefaultSupportedCommandsMessage:v6 fromClient:v7];
      break;
    case 0x200000000000033uLL:
      [(MRDNowPlayingServer *)self _handleGetPlayerPictureInPictureEnabledMessage:v6 fromClient:v7];
      break;
    case 0x200000000000034uLL:
      [(MRDNowPlayingServer *)self _handleSetPlayerPictureInPictureEnabledMessage:v6 fromClient:v7];
      break;
    case 0x200000000000035uLL:
      [(MRDNowPlayingServer *)self _handleGetLastPlayingDateMessage:v6 fromClient:v7];
      break;
    case 0x200000000000036uLL:
      [(MRDNowPlayingServer *)self _handleSetOriginClientPropertiesMessage:v6 fromClient:v7];
      break;
    case 0x200000000000037uLL:
      [(MRDNowPlayingServer *)self _handleSetPlayerClientPropertiesMessage:v6 fromClient:v7];
      break;
    case 0x200000000000038uLL:
      [(MRDNowPlayingServer *)self _handleSetCanBeNowPlayingPlayerMessage:v6 fromClient:v7];
      break;
    case 0x200000000000039uLL:
      [(MRDNowPlayingServer *)self _handleRegisterForWakingNowPlayingNotifications:v6 fromClient:v7];
      break;
    case 0x20000000000003AuLL:
      [(MRDNowPlayingServer *)self _handleGetAudioFormatContentInfoForOriginMessage:v6 fromClient:v7];
      break;
    case 0x20000000000003BuLL:
      [(MRDNowPlayingServer *)self _handleGetImageDimensionsForArtworkDataMessage:v6 fromClient:v7];
      break;
    case 0x20000000000003CuLL:
      [(MRDNowPlayingServer *)self _handleFetchPlaybackQueueParticipantsMessage:v6 fromClient:v7];
      break;
    case 0x20000000000003DuLL:
      [(MRDNowPlayingServer *)self _handleBeginMusicHandoffSessionMessage:v6 fromClient:v7];
      break;
    case 0x20000000000003EuLL:
      [(MRDNowPlayingServer *)self _handleSendMusicHandoffEventMessage:v6 fromClient:v7];
      break;
    default:
      v10 = _MRLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 134217984;
        uint64_t v12 = uint64;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Now Playing message with id %llu not handled.", (uint8_t *)&v11, 0xCu);
      }

      break;
  }
}

- (id)_onQueue_originClientForOrigin:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_originClients;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        int v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "origin", (void)v16);
        unsigned int v13 = [v12 isEqual:v4];

        if (v13)
        {
          id v14 = v11;

          uint64_t v8 = v14;
        }
      }
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)_handleResolvePlayerPath:(id)a3 fromClient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = MRCreatePlayerPathFromXPCMessage();
  uint64_t v9 = [(MRDNowPlayingServer *)self resolveExistingPlayerPath:v8];
  v10 = _MRLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = [v6 displayName];
    *(_DWORD *)buf = 138543874;
    long long v16 = v12;
    __int16 v17 = 2114;
    long long v18 = v8;
    __int16 v19 = 2114;
    v20 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}@ is requesting to resolve playerPath %{public}@ -> %{public}@", buf, 0x20u);
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100007104;
  v13[3] = &unk_100415DC8;
  id v14 = v9;
  id v11 = v9;
  sub_100014324(v7, v13);
}

- (id)onQueue_resolveExistingPlayerPath:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v5 = [v4 origin];
  if (!v5)
  {
    id v6 = [(MRDNowPlayingServer *)self _onQueue_activeOriginClient];
    id v5 = [v6 origin];
  }
  id v7 = [(MRDNowPlayingServer *)self _onQueue_originClientForOrigin:v5];
  v24 = v4;
  if (!v7)
  {

    id v5 = 0;
    id v10 = 0;
    id v11 = 0;
    uint64_t v12 = 0;
    unsigned int v13 = 0;
    goto LABEL_15;
  }
  uint64_t v8 = [v4 client];
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v14 = [v7 activeNowPlayingClient];
    id v10 = [v14 client];
  }
  __int16 v15 = [v7 deviceInfo];
  [v10 resolvePlaceholdersForDeviceInfo:v15];

  long long v16 = [v7 existingNowPlayingClientForClient:v10];
  if (!v16) {
    [v10 setProcessIdentifier:0];
  }
  id v11 = [v4 player];
  if (!v11)
  {
    __int16 v17 = [v16 activePlayerClient];
    id v11 = [v17 player];
  }
  uint64_t v12 = [v16 existingPlayerClientForPlayer:v11];
  unsigned int v13 = [v7 origin];
  if (!v16)
  {
LABEL_15:
    id v18 = v10;
    id v10 = v18;
    if (!v12) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  id v18 = [v16 client];

  if (!v12)
  {
LABEL_14:
    id v19 = v11;
    goto LABEL_17;
  }
LABEL_16:
  id v19 = [v12 player];
LABEL_17:
  v20 = v19;
  id v21 = [objc_alloc((Class)MRPlayerPath) initWithOrigin:v13 client:v18 player:v19];
  v22 = _MRLogForCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    sub_10032EC44((uint64_t)v24, (uint64_t)v21, v22);
  }

  return v21;
}

- (MRDNowPlayingServer)init
{
  v30.receiver = self;
  v30.super_class = (Class)MRDNowPlayingServer;
  v2 = [(MRDNowPlayingServer *)&v30 init];
  if (v2)
  {
    id v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    id v4 = objc_claimAutoreleasedReturnValue();
    id v5 = (const char *)[v4 UTF8String];
    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create(v5, v6);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.mediaremote.MRDNowPlayingServer.nowPlayingInfoObserverQueue", v9);
    nowPlayingInfoObserverQueue = v2->_nowPlayingInfoObserverQueue;
    v2->_nowPlayingInfoObserverQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = objc_alloc_init(MRDDeviceInfoDataSource);
    deviceInfoDataSource = v2->_deviceInfoDataSource;
    v2->_deviceInfoDataSource = v12;

    id v14 = +[MROrigin localOrigin];
    __int16 v15 = [(MRDDeviceInfoDataSource *)v2->_deviceInfoDataSource deviceInfo];
    [(MRDNowPlayingServer *)v2 _addOrigin:v14 withDeviceInfo:v15 emitNotification:0];

    long long v16 = objc_alloc_init(MRDNowPlayingPlaybackQueueServer);
    playbackQueueServer = v2->_playbackQueueServer;
    v2->_playbackQueueServer = v16;

    id v18 = +[MRUserSettings currentSettings];
    LODWORD(v15) = [v18 takelockScreenAssertion];

    if (v15)
    {
      id v19 = objc_alloc_init(MRDLockScreenController);
      lockScreenController = v2->_lockScreenController;
      v2->_lockScreenController = v19;

      [(MRDLockScreenController *)v2->_lockScreenController setDelegate:v2];
      uint64_t v21 = [(MRDNowPlayingServer *)v2 _createLockScreenRoutingController];
      lockScreenRoutingController = v2->_lockScreenRoutingController;
      v2->_lockScreenRoutingController = (MRDLockScreenRoutingControllerProtocol *)v21;

      [(MRDLockScreenRoutingControllerProtocol *)v2->_lockScreenRoutingController setDataSource:v2];
    }
    v23 = +[MRUserSettings currentSettings];
    unsigned int v24 = [v23 supportElectedPlayer];

    if (v24)
    {
      v25 = [[MRDElectedPlayerController alloc] initWithOriginClient:v2->_localOriginClient];
      electedPlayerController = v2->_electedPlayerController;
      v2->_electedPlayerController = v25;

      [(MRDElectedPlayerController *)v2->_electedPlayerController setDelegate:v2];
    }
    if (MSVDeviceIsAudioAccessory())
    {
      v27 = [[MRDNowPlayingLauncher alloc] initWithBundleIdentifier:@"com.apple.NowPlayingCap" options:1];
      nowPlayingCapLauncher = v2->_nowPlayingCapLauncher;
      v2->_nowPlayingCapLauncher = v27;

      [(MRDNowPlayingLauncher *)v2->_nowPlayingCapLauncher setDelegate:v2];
    }
  }
  return v2;
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MRDNowPlayingServer;
  [(MRDNowPlayingServer *)&v4 dealloc];
}

- (id)_createLockScreenRoutingController
{
  v2 = +[MRUserSettings currentSettings];
  unsigned int v3 = [v2 supportRouteRecommendations];

  objc_super v4 = off_100413BC8;
  if (!v3) {
    objc_super v4 = &off_100413BD8;
  }
  id v5 = objc_alloc_init(*v4);

  return v5;
}

- (int)activeClientPID
{
  v2 = [(MRDNowPlayingServer *)self activeOriginClient];
  unsigned int v3 = [v2 activeNowPlayingClient];
  objc_super v4 = [v3 client];
  int v5 = [v4 processIdentifier];

  return v5;
}

- (int)localActiveClientPID
{
  v2 = [(MRDNowPlayingServer *)self localOriginClient];
  unsigned int v3 = [v2 activeNowPlayingClient];
  objc_super v4 = [v3 client];
  int v5 = [v4 processIdentifier];

  return v5;
}

- (NSString)activeClientBundleIdentifier
{
  v2 = [(MRDNowPlayingServer *)self activeOriginClient];
  unsigned int v3 = [v2 activeNowPlayingClient];
  objc_super v4 = [v3 client];
  int v5 = [v4 bundleIdentifier];

  return (NSString *)v5;
}

- (NSString)localActiveClientBundleIdentifier
{
  v2 = [(MRDNowPlayingServer *)self localOriginClient];
  unsigned int v3 = [v2 activeNowPlayingClient];
  objc_super v4 = [v3 client];
  int v5 = [v4 bundleIdentifier];

  return (NSString *)v5;
}

- (BOOL)activePlayerIsPlaying
{
  v2 = [(MRDNowPlayingServer *)self activeOriginClient];
  unsigned int v3 = [v2 activeNowPlayingClient];
  objc_super v4 = [v3 activePlayerClient];
  unsigned __int8 v5 = [v4 isPlaying];

  return v5;
}

- (BOOL)localActivePlayerIsPlaying
{
  v2 = [(MRDNowPlayingServer *)self localOriginClient];
  unsigned int v3 = [v2 activeNowPlayingClient];
  objc_super v4 = [v3 activePlayerClient];
  unsigned __int8 v5 = [v4 isPlaying];

  return v5;
}

- (unsigned)activePlayerPlaybackState
{
  v2 = [(MRDNowPlayingServer *)self activeOriginClient];
  unsigned int v3 = [v2 activeNowPlayingClient];
  objc_super v4 = [v3 activePlayerClient];
  unsigned int v5 = [v4 playbackState];

  return v5;
}

- (unsigned)localActivePlayerPlaybackState
{
  v2 = [(MRDNowPlayingServer *)self localOriginClient];
  unsigned int v3 = [v2 activeNowPlayingClient];
  objc_super v4 = [v3 activePlayerClient];
  unsigned int v5 = [v4 playbackState];

  return v5;
}

- (MRDNowPlayingPlayerClient)activePlayerClient
{
  v2 = [(MRDNowPlayingServer *)self activeOriginClient];
  unsigned int v3 = [v2 activeNowPlayingClient];
  objc_super v4 = [v3 activePlayerClient];

  return (MRDNowPlayingPlayerClient *)v4;
}

- (MRDNowPlayingPlayerClient)localActivePlayerClient
{
  v2 = [(MRDNowPlayingServer *)self localOriginClient];
  unsigned int v3 = [v2 activeNowPlayingClient];
  objc_super v4 = [v3 activePlayerClient];

  return (MRDNowPlayingPlayerClient *)v4;
}

- (MRDNowPlayingClient)activeNowPlayingClient
{
  v2 = [(MRDNowPlayingServer *)self activeOriginClient];
  unsigned int v3 = [v2 activeNowPlayingClient];

  return (MRDNowPlayingClient *)v3;
}

- (MRDNowPlayingClient)localActiveNowPlayingClient
{
  v2 = [(MRDNowPlayingServer *)self localOriginClient];
  unsigned int v3 = [v2 activeNowPlayingClient];

  return (MRDNowPlayingClient *)v3;
}

- (MRDNowPlayingOriginClient)localOriginClient
{
  uint64_t v4 = 0;
  unsigned int v5 = &v4;
  uint64_t v6 = 0x3032000000;
  dispatch_queue_t v7 = sub_1000F15E8;
  uint64_t v8 = sub_1000F15F8;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MRDNowPlayingOriginClient *)v2;
}

- (MRDNowPlayingOriginClient)activeOriginClient
{
  uint64_t v4 = 0;
  unsigned int v5 = &v4;
  uint64_t v6 = 0x3032000000;
  dispatch_queue_t v7 = sub_1000F15E8;
  uint64_t v8 = sub_1000F15F8;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MRDNowPlayingOriginClient *)v2;
}

- (MRDNowPlayingOriginClient)companionOriginClient
{
  uint64_t v4 = 0;
  unsigned int v5 = &v4;
  uint64_t v6 = 0x3032000000;
  dispatch_queue_t v7 = sub_1000F15E8;
  uint64_t v8 = sub_1000F15F8;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MRDNowPlayingOriginClient *)v2;
}

- (id)_onQueue_companionOriginClient
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unsigned int v3 = self->_originClients;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        dispatch_queue_t v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(v7, "origin", (void)v11);
        unsigned int v9 = [v8 identifier];

        if (v9 == 1129140302)
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (MRPlayerPath)activePlayerPath
{
  id v2 = [(MRDNowPlayingServer *)self activeOriginClient];
  unsigned int v3 = [v2 activePlayerPath];

  return (MRPlayerPath *)v3;
}

- (MRPlayerPath)localActivePlayerPath
{
  id v2 = [(MRDNowPlayingServer *)self localOriginClient];
  unsigned int v3 = [v2 activePlayerPath];

  return (MRPlayerPath *)v3;
}

- (NSSet)allNowPlayingInfoClients
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  dispatch_queue_t v7 = sub_1000F15E8;
  uint64_t v8 = sub_1000F15F8;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSSet *)v2;
}

- (id)_onQueue_allNowPlayingInfoClients
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v3 = objc_alloc_init((Class)NSMutableSet);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v4 = self->_originClients;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v20 + 1) + 8 * i) nowPlayingClients];
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v17;
          do
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v17 != v12) {
                objc_enumerationMutation(v9);
              }
              long long v14 = *(void **)(*((void *)&v16 + 1) + 8 * (void)j);
              if ([v14 hasNowPlayingData]) {
                [v3 addObject:v14];
              }
            }
            id v11 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v11);
        }
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }

  return v3;
}

- (NSSet)allLocalNowPlayingInfoClients
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = sub_1000F15E8;
  uint64_t v8 = sub_1000F15F8;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSSet *)v2;
}

- (id)_onQueue_allNowPlayingInfoClientsForOrigin:(id)a3
{
  serialQueue = self->_serialQueue;
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)serialQueue);
  id v6 = objc_alloc_init((Class)NSMutableSet);
  uint64_t v7 = [(MRDNowPlayingServer *)self _onQueue_originClientForOrigin:v5];

  uint64_t v8 = [v7 nowPlayingClients];
  [v6 addObjectsFromArray:v8];

  return v6;
}

- (NSArray)originClients
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = sub_1000F15E8;
  uint64_t v8 = sub_1000F15F8;
  id v9 = objc_alloc_init((Class)NSMutableArray);
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSArray *)v2;
}

- (id)queryPlayerPathForXPCMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a4;
  uint64_t v6 = MRCreatePlayerPathFromXPCMessage();
  uint64_t v7 = [(MRDNowPlayingServer *)self queryPlayerPath:v6 forClient:v5];

  return v7;
}

- (id)queryPlayerPath:(id)a3 forClient:(id)a4
{
  id v5 = [(MRDNowPlayingServer *)self resolvePlayerPath:a3 fromClient:a4];
  uint64_t v6 = [(MRDNowPlayingServer *)self queryExistingPlayerPath:v5];

  return v6;
}

- (id)queryExistingPlayerPathForXPCMessage:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = MRCreatePlayerPathFromXPCMessage();
  id v9 = [(MRDNowPlayingServer *)self resolveExistingPlayerPath:v8];
  id v10 = [(MRDNowPlayingServer *)self queryExistingPlayerPath:v9];
  id v11 = [v10 playerPath];
  unsigned __int8 v12 = [v7 isAllowedAccessToDataFromPlayerPath:v11];

  if ((v12 & 1) == 0)
  {
    if (![v10 error]) {
      [v10 setError:3];
    }
    [v10 setNowPlayingClient:0];
    [v10 setPlayerClient:0];
    long long v13 = [v10 originClient];
    long long v14 = [v13 playerPath];
    [v10 setPlayerPath:v14];

    [v10 setXpcClient:0];
  }
  if (MSVDeviceOSIsInternalInstall()
    && ([v7 isEntitledFor:512] & 1) == 0)
  {
    __int16 v15 = [v7 bundleIdentifier];
    if (qword_10047E170 != -1) {
      dispatch_once(&qword_10047E170, &stru_10041C600);
    }
    long long v16 = self;
    objc_sync_enter(v16);
    if (v15 && ([(id)qword_10047E168 containsObject:v15] & 1) == 0)
    {
      id v18 = v15;
      MRAnalyticsSendEvent();
      [(id)qword_10047E168 addObject:v18];
    }
    objc_sync_exit(v16);
  }

  return v10;
}

- (id)resolvePlayerPath:(id)a3 fromClient:(id)a4
{
  return [(MRDNowPlayingServer *)self resolvePlayerPath:a3 fromClient:a4 useDefaultPlayerIfNoneSpecified:1];
}

- (id)resolvePlayerPath:(id)a3 fromClient:(id)a4 useDefaultPlayerIfNoneSpecified:(BOOL)a5
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  __int16 v15 = sub_1000F15E8;
  long long v16 = sub_1000F15F8;
  id v17 = 0;
  id v10 = v6;
  id v11 = v7;
  msv_dispatch_sync_on_queue();
  id v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v8;
}

- (id)queryExistingPlayerPath:(id)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1000F15E8;
  id v10 = sub_1000F15F8;
  id v11 = 0;
  id v5 = a3;
  msv_dispatch_sync_on_queue();
  id v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_onQueue_queryExistingPlayerPath:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v5 = [[MRDNowPlayingServerResult alloc] initWithUnresolvedPlayerPath:v4];
  id v6 = objc_alloc_init((Class)MRPlayerPath);
  id v7 = [v4 origin];
  uint64_t v8 = [(MRDNowPlayingServer *)self _onQueue_originClientForOrigin:v7];
  [(MRDNowPlayingServerResult *)v5 setOriginClient:v8];

  id v9 = [(MRDNowPlayingServerResult *)v5 originClient];

  id v10 = v5;
  if (!v9)
  {
    uint64_t v23 = 5;
LABEL_7:
    [(MRDNowPlayingServerResult *)v10 setError:v23];
    goto LABEL_10;
  }
  id v11 = [(MRDNowPlayingServerResult *)v5 originClient];
  uint64_t v12 = [v11 origin];
  [v6 setOrigin:v12];

  long long v13 = [(MRDNowPlayingServerResult *)v5 originClient];
  uint64_t v14 = [v13 existingNowPlayingClientForPlayerPath:v4];
  [(MRDNowPlayingServerResult *)v5 setNowPlayingClient:v14];

  __int16 v15 = [(MRDNowPlayingServerResult *)v5 nowPlayingClient];

  id v10 = v5;
  if (!v15)
  {
    uint64_t v23 = 35;
    goto LABEL_7;
  }
  long long v16 = [(MRDNowPlayingServerResult *)v5 nowPlayingClient];
  id v17 = [v16 client];

  [v6 setClient:v17];
  id v18 = [(MRDNowPlayingServerResult *)v5 nowPlayingClient];
  long long v19 = [v18 existingPlayerClientForPlayerPath:v4];
  [(MRDNowPlayingServerResult *)v5 setPlayerClient:v19];

  long long v20 = [(MRDNowPlayingServerResult *)v5 playerClient];

  if (v20)
  {
    long long v21 = [(MRDNowPlayingServerResult *)v5 playerClient];
    long long v22 = [v21 player];

    [v6 setPlayer:v22];
  }
  else
  {
    [(MRDNowPlayingServerResult *)v5 setError:29];
  }

LABEL_10:
  unsigned int v24 = [(MRDNowPlayingServer *)self xpcClientForPlayerPath:v4];
  [(MRDNowPlayingServerResult *)v5 setXpcClient:v24];

  v25 = [(MRDNowPlayingServerResult *)v5 xpcClient];

  if (!v25 && ![(MRDNowPlayingServerResult *)v5 error]) {
    [(MRDNowPlayingServerResult *)v5 setError:4];
  }
  [(MRDNowPlayingServerResult *)v5 setPlayerPath:v6];

  return v5;
}

- (id)xpcClientForPlayerPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 origin];
  unsigned int v6 = [v5 isLocal];

  if (v6)
  {
    id v7 = [v4 origin];
    unsigned int v8 = [(MRDNowPlayingServer *)self _hasForwarderForOrigin:v7];

    if (v8)
    {
      id v9 = +[MRDMediaRemoteServer server];
      id v10 = [v9 daemonClient];
      goto LABEL_13;
    }
    uint64_t v12 = [v4 client];
    id v9 = v12;
    if (!v12)
    {
      id v10 = 0;
      goto LABEL_13;
    }
    id v13 = [v12 processIdentifier];
    uint64_t v14 = [v9 bundleIdentifier];
    id v11 = (void *)v14;
    if ((int)v13 < 1)
    {
      if (!v14)
      {
        id v10 = 0;
        goto LABEL_12;
      }
      __int16 v15 = +[MRDMediaRemoteServer server];
      uint64_t v16 = [v15 clientForBundleIdentifier:v11];
    }
    else
    {
      __int16 v15 = +[MRDMediaRemoteServer server];
      uint64_t v16 = [v15 clientForPID:v13];
    }
    id v10 = (void *)v16;
  }
  else
  {
    id v9 = +[MRDMediaRemoteServer server];
    id v11 = [v4 origin];
    id v10 = [v9 clientWithRegisteredCustomOrigin:v11];
  }
LABEL_12:

LABEL_13:

  return v10;
}

- (id)localPlayersForXpcClient:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDNowPlayingServer *)self localOriginClient];
  id v6 = objc_alloc_init((Class)MRClient);
  id v7 = [v4 pid];

  [v6 setProcessIdentifier:v7];
  unsigned int v8 = [v5 existingNowPlayingClientForClient:v6];
  id v9 = [v8 playerClients];

  return v9;
}

- (id)originClientForOrigin:(id)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1000F15E8;
  id v10 = sub_1000F15F8;
  id v11 = 0;
  id v5 = a3;
  msv_dispatch_sync_on_queue();
  id v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)originClientForDeviceUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  __int16 v15 = sub_1000F15E8;
  uint64_t v16 = sub_1000F15F8;
  id v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F33CC;
  block[3] = &unk_100416730;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)originClientForGroupLeaderOfDeviceUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  __int16 v15 = sub_1000F15E8;
  uint64_t v16 = sub_1000F15F8;
  id v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F352C;
  block[3] = &unk_100416730;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)clearNowPlayingClientForXPCClient:(id)a3
{
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000F3770;
  v22[3] = &unk_10041C650;
  id v4 = a3;
  id v23 = v4;
  unsigned int v24 = self;
  [v4 flushPendingPlaybackSessionMigrateEvents:v22];
  id v5 = objc_alloc((Class)MRClient);
  id v6 = [v4 pid];
  id v7 = [v4 bundleIdentifier];
  id v8 = [v5 initWithProcessIdentifier:v6 bundleIdentifier:v7];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = [(MRDNowPlayingServer *)self originClients];
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        __int16 v15 = [v14 origin];
        unsigned int v16 = [v15 isLocallyHosted];

        if (v16)
        {
          id v17 = [v14 origin];
          [(MRDNowPlayingServer *)self _removeNowPlayingClient:v8 forOrigin:v17];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v25 count:16];
    }
    while (v11);
  }
}

- (void)restoreDeviceInfoToClient:(id)a3 handler:(id)a4
{
  id v6 = a4;
  if ([a3 isEntitledFor:0x2000])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = [(MRDNowPlayingServer *)self originClients];
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v13 = [v12 deviceInfo];
          uint64_t v14 = [v12 origin];
          [(MRDNowPlayingServer *)self postDeviceInfoDidChange:v13 previousDeviceInfo:0 forOrigin:v14 handler:v6];
        }
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
}

- (void)restoreClientState:(id)a3 handler:(id)a4
{
  id v96 = a3;
  id v6 = a4;
  long long v138 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  id v7 = [(MRDNowPlayingServer *)self originClients];
  id v8 = [v7 countByEnumeratingWithState:&v138 objects:v147 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v139;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v139 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [*(id *)(*((void *)&v138 + 1) + 8 * i) origin];
        [(MRDNowPlayingServer *)self postOriginDidRegister:v12 handler:v6];
      }
      id v9 = [v7 countByEnumeratingWithState:&v138 objects:v147 count:16];
    }
    while (v9);
  }

  id v13 = [(MRDNowPlayingServer *)self activePlayerPath];
  uint64_t v14 = [(MRDNowPlayingServer *)self activePlayerClient];
  -[MRDNowPlayingServer postActiveOriginDidChange:withPlaybackState:handler:](self, "postActiveOriginDidChange:withPlaybackState:handler:", v13, [v14 playbackState], v6);

  long long v136 = 0u;
  long long v137 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  id obj = [(MRDNowPlayingServer *)self originClients];
  id v86 = [obj countByEnumeratingWithState:&v134 objects:v146 count:16];
  if (v86)
  {
    uint64_t v85 = *(void *)v135;
    id v94 = v6;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v135 != v85) {
          objc_enumerationMutation(obj);
        }
        uint64_t v87 = v15;
        long long v16 = *(void **)(*((void *)&v134 + 1) + 8 * v15);
        if ([v96 isEntitledFor:0x2000])
        {
          long long v17 = [v16 deviceInfo];
          long long v18 = [v16 origin];
          [(MRDNowPlayingServer *)self postDeviceInfoDidChange:v17 previousDeviceInfo:0 forOrigin:v18 handler:v6];
        }
        [v16 volume];
        int v20 = v19;
        long long v21 = [v16 playerPath];
        LODWORD(v22) = v20;
        [(MRDNowPlayingServer *)self postVolumeDidChange:v21 volume:v6 handler:v22];

        id v23 = [v16 isMuted];
        unsigned int v24 = [v16 playerPath];
        [(MRDNowPlayingServer *)self postIsMutedDidChange:v24 isMuted:v23 handler:v6];

        id v25 = [v16 volumeControlCapabilities];
        v26 = [v16 playerPath];
        [(MRDNowPlayingServer *)self postVolumeCapabilitiesDidChange:v26 capabilities:v25 handler:v6];

        long long v132 = 0u;
        long long v133 = 0u;
        long long v130 = 0u;
        long long v131 = 0u;
        v27 = [v16 nowPlayingClients];
        id v28 = [v27 countByEnumeratingWithState:&v130 objects:v145 count:16];
        if (v28)
        {
          id v29 = v28;
          uint64_t v30 = *(void *)v131;
          do
          {
            for (j = 0; j != v29; j = (char *)j + 1)
            {
              if (*(void *)v131 != v30) {
                objc_enumerationMutation(v27);
              }
              v32 = [*(id *)(*((void *)&v130 + 1) + 8 * (void)j) playerPath];
              [(MRDNowPlayingServer *)self postClientDidRegisterForPlayerPath:v32 handler:v6];
            }
            id v29 = [v27 countByEnumeratingWithState:&v130 objects:v145 count:16];
          }
          while (v29);
        }

        v33 = [v16 activePlayerPath];
        v34 = [v16 activeNowPlayingClient];
        v35 = [v34 activePlayerClient];
        -[MRDNowPlayingServer postNowPlayingApplicationDidChangeForPlayerPath:withPlaybackState:handler:](self, "postNowPlayingApplicationDidChangeForPlayerPath:withPlaybackState:handler:", v33, [v35 playbackState], v6);

        long long v128 = 0u;
        long long v129 = 0u;
        long long v126 = 0u;
        long long v127 = 0u;
        id v88 = [v16 nowPlayingClients];
        id v90 = [v88 countByEnumeratingWithState:&v126 objects:v144 count:16];
        if (v90)
        {
          uint64_t v89 = *(void *)v127;
          v95 = v16;
          do
          {
            uint64_t v36 = 0;
            do
            {
              if (*(void *)v127 != v89) {
                objc_enumerationMutation(v88);
              }
              uint64_t v91 = v36;
              v37 = *(void **)(*((void *)&v126 + 1) + 8 * v36);
              v38 = [v37 client];
              v39 = [v37 playerPath];
              [(MRDNowPlayingServer *)self postNowPlayingClientStateDidChange:v38 forPlayerPath:v39 handler:v6];

              long long v124 = 0u;
              long long v125 = 0u;
              long long v122 = 0u;
              long long v123 = 0u;
              v92 = v37;
              v40 = [v37 playerClients];
              id v41 = [v40 countByEnumeratingWithState:&v122 objects:v143 count:16];
              if (v41)
              {
                id v42 = v41;
                uint64_t v43 = *(void *)v123;
                do
                {
                  for (k = 0; k != v42; k = (char *)k + 1)
                  {
                    if (*(void *)v123 != v43) {
                      objc_enumerationMutation(v40);
                    }
                    v45 = [*(id *)(*((void *)&v122 + 1) + 8 * (void)k) playerPath];
                    [(MRDNowPlayingServer *)self postPlayerDidRegisterForPlayerPath:v45 handler:v6];
                  }
                  id v42 = [v40 countByEnumeratingWithState:&v122 objects:v143 count:16];
                }
                while (v42);
              }

              v46 = [v92 activePlayerClient];
              v47 = [v46 playerPath];
              v48 = [v92 activePlayerClient];
              -[MRDNowPlayingServer postActivePlayerDidChangeForPlayerPath:withPlaybackState:handler:](self, "postActivePlayerDidChangeForPlayerPath:withPlaybackState:handler:", v47, [v48 playbackState], v6);

              long long v120 = 0u;
              long long v121 = 0u;
              long long v118 = 0u;
              long long v119 = 0u;
              id v93 = [v92 playerClients];
              id v98 = [v93 countByEnumeratingWithState:&v118 objects:v142 count:16];
              if (v98)
              {
                uint64_t v97 = *(void *)v119;
                do
                {
                  for (m = 0; m != v98; m = (char *)m + 1)
                  {
                    if (*(void *)v119 != v97) {
                      objc_enumerationMutation(v93);
                    }
                    v50 = *(void **)(*((void *)&v118 + 1) + 8 * (void)m);
                    v51 = [v50 player];
                    v52 = [v50 playerPath];
                    [(MRDNowPlayingServer *)self postNowPlayingPlayerStateDidChange:v51 forPlayerPath:v52 handler:v6];

                    [v16 timeSincePlaying];
                    v53 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");
                    [v53 timeIntervalSinceReferenceDate];
                    double v55 = v54;

                    id v56 = [v50 isPlaying];
                    v57 = [v50 playerPath];
                    [(MRDNowPlayingServer *)self postIsPlayingDidChange:v56 lastPlayingTimestamp:v57 forPlayerPath:v6 handler:v55];

                    id v58 = [v50 playbackState];
                    v59 = [v50 playerPath];
                    [(MRDNowPlayingServer *)self postPlaybackStateDidChange:v58 forPlayerPath:v59 handler:v6];

                    v60 = [v50 supportedRemoteControlCommandsData];
                    v61 = [v50 playerPath];
                    v114[0] = _NSConcreteStackBlock;
                    v114[1] = 3221225472;
                    v114[2] = sub_1000F451C;
                    v114[3] = &unk_10041C678;
                    id v62 = v96;
                    id v115 = v62;
                    v116 = v50;
                    id v63 = v6;
                    id v117 = v63;
                    [(MRDNowPlayingServer *)self postSupportedCommandsDidChange:v60 forPlayerPath:v61 handler:v114];

                    id v64 = [v50 playbackQueueCapabilities];
                    v65 = [v50 playerPath];
                    [(MRDNowPlayingServer *)self postPlaybackQueueCapabilitiesDidChange:v64 forPlayerPath:v65 handler:v63];

                    v66 = [v50 playbackQueue];
                    v67 = [v50 playerPath];
                    v109[0] = _NSConcreteStackBlock;
                    v109[1] = 3221225472;
                    v109[2] = sub_1000F45C8;
                    v109[3] = &unk_10041C6A0;
                    id v68 = v62;
                    id v110 = v68;
                    id v69 = v66;
                    id v111 = v69;
                    v112 = v50;
                    id v70 = v63;
                    id v113 = v70;
                    [(MRDNowPlayingServer *)self postPlaybackQueueDidChange:v69 nowPlayingItemDidChange:1 forPlayerPath:v67 handler:v109];

                    v71 = [v69 contentItems];
                    v72 = [v50 playerPath];
                    v104[0] = _NSConcreteStackBlock;
                    v104[1] = 3221225472;
                    v104[2] = sub_1000F47C8;
                    v104[3] = &unk_10041C6A0;
                    id v73 = v68;
                    id v105 = v73;
                    v106 = v50;
                    id v74 = v69;
                    id v107 = v74;
                    id v75 = v70;
                    id v108 = v75;
                    [(MRDNowPlayingServer *)self postPlaybackQueueContentItemsDidChange:v71 forPlayerPath:v72 handler:v104];

                    v76 = [v74 contentItems];
                    v77 = [v50 playerPath];
                    v99[0] = _NSConcreteStackBlock;
                    v99[1] = 3221225472;
                    v99[2] = sub_1000F48C0;
                    v99[3] = &unk_10041C6A0;
                    id v100 = v73;
                    v101 = v50;
                    id v78 = v74;
                    id v102 = v78;
                    id v79 = v75;
                    id v103 = v79;
                    [(MRDNowPlayingServer *)self postPlaybackQueueContentItemsArtworkDidChange:v76 forPlayerPath:v77 handler:v99];

                    v80 = [v50 participants];
                    v81 = [v50 playerPath];
                    [(MRDNowPlayingServer *)self postPlaybackQueueParticipantsDidChange:v80 forPlayerPath:v81 handler:v79];

                    if ([v50 canBeNowPlayingPlayer])
                    {
                      v82 = [v50 playerPath];
                      [(MRDNowPlayingServer *)self postPlayerDidRegisterCanBeNowPlayingForPlayerPath:v82 handler:v79];
                    }
                    id v6 = v94;
                    long long v16 = v95;
                  }
                  id v98 = [v93 countByEnumeratingWithState:&v118 objects:v142 count:16];
                }
                while (v98);
              }

              if ([v92 canBeNowPlaying])
              {
                v83 = [v92 activePlayerPath];
                [(MRDNowPlayingServer *)self postClientDidRegisterCanBeNowPlayingForPlayerPath:v83 handler:v6];
              }
              uint64_t v36 = v91 + 1;
            }
            while ((id)(v91 + 1) != v90);
            id v90 = [v88 countByEnumeratingWithState:&v126 objects:v144 count:16];
          }
          while (v90);
        }

        uint64_t v15 = v87 + 1;
      }
      while ((id)(v87 + 1) != v86);
      id v86 = [obj countByEnumeratingWithState:&v134 objects:v146 count:16];
    }
    while (v86);
  }
}

- (void)beginMusicHandoffSessionWithSource:(id)a3 destination:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000F4C1C;
  v15[3] = &unk_10041B158;
  id v16 = v8;
  id v17 = v9;
  long long v18 = self;
  id v19 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  sub_1001693F4(v11, 0, v15, 7.0);
}

- (void)_handleGetAvailableOriginsMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = [(MRDNowPlayingServer *)self originClients];
  id v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v17 + 1) + 8 * (void)v12) origin];
        [v7 addObject:v13];

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000F5240;
  v15[3] = &unk_100415DC8;
  id v16 = v7;
  id v14 = v7;
  sub_100014324(v5, v15);
}

- (void)_handleSetActiveOriginMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a4;
  id v6 = MRCreateOriginFromXPCMessage();
  id v7 = _MRLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Client %{public}@ requesting to set active origin to %{public}@", (uint8_t *)&v8, 0x16u);
  }

  [(MRDNowPlayingServer *)self setActiveOrigin:v6];
}

- (void)_handleGetActiveOriginMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = [(MRDNowPlayingServer *)self activeOriginClient];
  id v7 = [v6 origin];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000F5400;
  v9[3] = &unk_100415DC8;
  id v10 = v7;
  id v8 = v7;
  sub_100014324(v5, v9);
}

- (void)registerOrigin:(id)a3 deviceInfo:(id)a4
{
}

- (void)reregisterOrigin:(id)a3 deviceInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _MRLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v30 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Re-registering origin %{public}@", buf, 0xCu);
  }

  id v9 = +[MRNowPlayingOriginClientManager sharedManager];
  [v9 removeOrigin:v6];

  id v10 = +[MRNowPlayingOriginClientManager sharedManager];
  uint64_t v11 = [v7 routingContextID];
  id v12 = [v10 createCustomOriginClientForOrigin:v6 routingContextID:v11];

  id v13 = +[MRNowPlayingOriginClientManager sharedManager];
  [v13 removeOriginRequests:v6];

  id v14 = +[MRNowPlayingOriginClientManager sharedManager];
  uint64_t v15 = [v6 playerPath];
  id v16 = [v14 originClientRequestsForPlayerPath:v15];

  [v16 setDeviceInfo:v7];
  long long v17 = [(MRDNowPlayingServer *)self originClientForOrigin:v6];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v18 = objc_msgSend(v17, "nowPlayingClients", 0);
  id v19 = [v18 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v25;
    do
    {
      double v22 = 0;
      do
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = [*(id *)(*((void *)&v24 + 1) + 8 * (void)v22) client];
        [v17 removeNowPlayingClientForClient:v23];

        double v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      id v20 = [v18 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v20);
  }

  [v17 setVolumeControlCapabilities:0];
  [v17 setVolume:0.0];
  [v17 clearDefaultSupportedCommandsData];
  [v17 setDeviceInfo:v7];
}

- (void)unregisterOrigin:(id)a3
{
}

- (void)updateDeviceInfo:(id)a3 origin:(id)a4
{
  id v6 = a3;
  id v7 = [(MRDNowPlayingServer *)self originClientForOrigin:a4];
  [v7 setDeviceInfo:v6];
}

- (void)_handleSetNowPlayingAppOverrideMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = xpc_dictionary_get_BOOL(v6, "MRXPC_NOWPLAYING_APP_OVERRIDE_ENABLED_KEY");
  id v9 = _MRLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v10 = @"disable";
    if (v8) {
      CFStringRef v10 = @"enable";
    }
    int v25 = 138543618;
    id v26 = v7;
    __int16 v27 = 2114;
    CFStringRef v28 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Client %{public}@ requesting to %{public}@ itself as now playing app override", (uint8_t *)&v25, 0x16u);
  }

  uint64_t v11 = [(MRDNowPlayingServer *)self overrideClient];
  id v12 = +[MRDMediaRemoteServer server];
  id v13 = [v12 nowPlayingServer];

  id v14 = +[MROrigin localOrigin];
  uint64_t v15 = [v13 originClientForOrigin:v14];

  id v16 = objc_msgSend(v15, "existingNowPlayingClientForPid:", objc_msgSend(v11, "pid"));
  if (v8)
  {
    long long v17 = +[MRPlayer defaultPlayer];
    long long v18 = [v16 playerClientForPlayer:v17];
    [v18 setCanBeNowPlayingPlayer:1];

    id v19 = +[NSDate now];
    id v20 = +[MRPlayer defaultPlayer];
    uint64_t v21 = [v16 playerClientForPlayer:v20];
    [v21 setCanBeNowPlayingPlayerTimestamp:v19];

    id v22 = v7;
  }
  else
  {
    unsigned int v23 = [v11 pid];
    if (v23 != [v7 pid])
    {
      unsigned int v24 = 3;
      goto LABEL_11;
    }
    id v19 = +[MRPlayer defaultPlayer];
    id v20 = [v16 playerClientForPlayer:v19];
    [v20 setCanBeNowPlayingPlayer:0];
    id v22 = 0;
  }

  [(MRDNowPlayingServer *)self setOverrideClient:v22];
  unsigned int v24 = 0;
LABEL_11:
  sub_1001679D8(v6, v24);
}

- (void)_handleSetOverriddenNowPlayingAppMessage:(id)a3 fromClient:(id)a4
{
  id v6 = (__CFString *)a4;
  id v7 = a3;
  string = (char *)xpc_dictionary_get_string(v7, "MRXPC_NOWPLAYING_DISPLAYID_KEY");
  if (string) {
    string = (char *)[objc_alloc((Class)NSString) initWithUTF8String:string];
  }
  id v9 = _MRLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v10 = @"enable";
    *(_DWORD *)buf = 138543874;
    CFStringRef v28 = v6;
    __int16 v29 = 2114;
    if (!string) {
      CFStringRef v10 = @"disable";
    }
    CFStringRef v30 = v10;
    __int16 v31 = 2114;
    v32 = string;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Client %{public}@ requesting to %{public}@ now playing app override to %{public}@", buf, 0x20u);
  }

  if (string)
  {
    uint64_t v11 = +[MRDMediaRemoteServer server];
    id v12 = [v11 clientForBundleIdentifier:string];

    if (v12)
    {
      +[MRDMediaRemoteServer server];
      id v13 = v26 = self;
      id v14 = [v13 nowPlayingServer];

      uint64_t v15 = +[MROrigin localOrigin];
      id v16 = [v14 originClientForOrigin:v15];

      long long v17 = objc_msgSend(v16, "existingNowPlayingClientForPid:", objc_msgSend(v12, "pid"));
      long long v18 = +[MRPlayer defaultPlayer];
      id v19 = [v17 playerClientForPlayer:v18];
      [v19 setCanBeNowPlayingPlayer:1];

      id v20 = +[NSDate now];
      uint64_t v21 = +[MRPlayer defaultPlayer];
      id v22 = [v17 playerClientForPlayer:v21];
      [v22 setCanBeNowPlayingPlayerTimestamp:v20];

      [(MRDNowPlayingServer *)v26 setOverrideClient:v12];
      unsigned int v23 = 0;
    }
    else
    {
      id v14 = _MRLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = [string length];
        CFStringRef v25 = @"<unknown>";
        if (v24) {
          CFStringRef v25 = (const __CFString *)string;
        }
        *(_DWORD *)buf = 138543362;
        CFStringRef v28 = v25;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Could not set override client. Client %{public}@ not found.", buf, 0xCu);
      }
      unsigned int v23 = 4;
    }
  }
  else
  {
    [(MRDNowPlayingServer *)self setOverrideClient:0];
    unsigned int v23 = 0;
  }
  sub_1001679D8(v7, v23);
}

- (void)_handleSetCanBeNowPlayingAppMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = [(MRDNowPlayingServer *)self queryPlayerPathForXPCMessage:v6 fromClient:a4];
  BOOL v8 = [v7 nowPlayingClient];

  if (v8)
  {
    BOOL v9 = xpc_dictionary_get_BOOL(v6, "MRXPC_NOWPLAYING_APP_ENABLED_KEY");
    CFStringRef v10 = [v7 nowPlayingClient];
    [v10 setCanBeNowPlaying:v9];
    if (v9 && xpc_dictionary_get_double(v6, "MRXPC_TIMESTAMP") > 2.22044605e-16)
    {
      uint64_t v11 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
      [v10 setCanBeNowPlayingTimestamp:v11];
LABEL_7:
    }
  }
  else
  {
    CFStringRef v10 = _MRLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v7 playerPath];
      int v12 = 138412290;
      id v13 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Unable to set can be now playing app. No now playing client found for %@", (uint8_t *)&v12, 0xCu);
      goto LABEL_7;
    }
  }
}

- (void)_handleSetCanBeNowPlayingPlayerMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = [(MRDNowPlayingServer *)self queryPlayerPathForXPCMessage:v6 fromClient:a4];
  BOOL v8 = [v7 playerClient];

  if (v8)
  {
    BOOL v9 = xpc_dictionary_get_BOOL(v6, "MRXPC_NOWPLAYING_APP_ENABLED_KEY");
    CFStringRef v10 = [v7 playerClient];
    [v10 setCanBeNowPlayingPlayer:v9];
    uint64_t v11 = [v7 nowPlayingClient];
    [v11 setPerPlayerCanBeNowPlaying:1];
    if (v9 && xpc_dictionary_get_double(v6, "MRXPC_TIMESTAMP") > 2.22044605e-16)
    {
      int v12 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
      [v10 setCanBeNowPlayingPlayerTimestamp:v12];
    }
    goto LABEL_7;
  }
  CFStringRef v10 = _MRLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v7 playerPath];
    int v13 = 138412290;
    id v14 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Unable to set can be now playing player. No player client found for %@", (uint8_t *)&v13, 0xCu);
LABEL_7:
  }
}

- (void)_handleBeginApplicationActivityMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = (void *)MRCreateAppActivityFromXPCMessage();
  MSVDeviceOSIsInternalInstall();
  id v7 = [(MRDNowPlayingServer *)self localOriginClient];
  MSVDeviceOSIsInternalInstall();
  if (v7)
  {
    id v8 = [v6 mutableCopy];
    MSVDeviceOSIsInternalInstall();
    [v7 setActivity:v8];

    int v9 = 0;
  }
  else
  {
    int v9 = 5;
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000F60D8;
  v10[3] = &unk_10041C710;
  int v11 = v9;
  sub_100014324(v5, v10);
}

- (void)_handleGetApplicationActivityMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = [(MRDNowPlayingServer *)self localOriginClient];
  id v7 = [v6 activity];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000F61AC;
  v9[3] = &unk_100415DC8;
  id v10 = v7;
  id v8 = v7;
  sub_100014324(v5, v9);
}

- (void)_handleEndApplicationActivityMessage:(id)a3 fromClient:(id)a4
{
  id v7 = a3;
  id v5 = [(MRDNowPlayingServer *)self localOriginClient];
  MSVDeviceOSIsInternalInstall();
  if (v5)
  {
    [v5 setActivity:0];
    unsigned int v6 = 0;
  }
  else
  {
    unsigned int v6 = 5;
  }
  sub_1001679D8(v7, v6);
}

- (void)_handleSetPlaybackQueue:(id)a3 fromClient:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  id v7 = [(MRDNowPlayingServer *)self queryPlayerPathForXPCMessage:v22 fromClient:v6];
  id v8 = (void *)MRCreatePlaybackQueueFromXPCMessage();
  int v9 = v8;
  if (v8)
  {
    id v10 = [v8 range];
    int v12 = +[MRPlaybackQueueRequest defaultPlaybackQueueRequestWithRange:](MRPlaybackQueueRequest, "defaultPlaybackQueueRequestWithRange:", v10, v11);
    int v13 = [v6 playbackQueueRequests];
    id v14 = [v7 playerPath];
    uint64_t v15 = [v13 subscriptionControllerForPlayerPath:v14];

    [v15 subscribeToPlaybackQueue:v9 forRequest:v12];
    id v16 = +[MRDMediaRemoteServer server];
    long long v17 = [v16 daemonClient];

    long long v18 = [v17 playbackQueueRequests];
    id v19 = [v7 playerPath];
    id v20 = [v18 subscriptionControllerForPlayerPath:v19];

    [v20 subscribeToPlaybackQueue:v9 forRequest:v12];
  }
  uint64_t v21 = [v7 playerClient];
  [v21 setPlaybackQueue:v9];

  sub_1001679D8(v22, [v7 error]);
}

- (void)_handleRequestPlaybackQueueCapabilities:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  [(MRDNowPlayingServer *)self queryExistingPlayerPathForXPCMessage:v6 forClient:a4];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000F64B8;
  v8[3] = &unk_100415DC8;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v9;
  sub_100014324(v6, v8);
}

- (void)_handleSetPlaybackQueueCapabilities:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v9 = [(MRDNowPlayingServer *)self queryPlayerPathForXPCMessage:v6 fromClient:a4];
  uint64_t v7 = MRCreatePlaybackQueueCapabilitiesFromXPCMessage();
  id v8 = [v9 playerClient];
  [v8 setPlaybackQueueCapabilities:v7];

  sub_1001679D8(v6, [v9 error]);
}

- (void)_handleSetHardwareRemoteBehaviorMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(v6, "MRXPC_HARDWARE_REMOTE_BEHAVIOR_KEY");
  id v8 = _MRLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)MRMediaRemoteCopyHardwareRemoteBehaviorDescription();
    int v10 = 138543618;
    uint64_t v11 = v9;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Setting hardware remote behavior to %{public}@ for client %{public}@", (uint8_t *)&v10, 0x16u);
  }
  [v5 setHardwareRemoteBehavior:uint64];
  sub_1001679D8(v6, 0);
}

- (void)_handleResetPlaybackQueueRequests:(id)a3 fromClient:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  MRCreatePlayerPathFromXPCMessage();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v5 playbackQueueRequests];

  id v8 = [v7 subscriptionControllerForPlayerPath:v11];

  id v9 = (void *)MRCreateDataFromXPCMessage();
  int v10 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:0];
  if (v10) {
    [v8 restoreStateFromController:v10];
  }
}

- (void)_handleGetClientPropertiesMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  [(MRDNowPlayingServer *)self queryExistingPlayerPathForXPCMessage:v6 forClient:a4];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000F68A0;
  v8[3] = &unk_100415DC8;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v9;
  sub_100014324(v6, v8);
}

- (void)_handleSetClientPropertiesMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = MRCreatePlayerPathFromXPCMessage();
  id v9 = [(MRDNowPlayingServer *)self resolvePlayerPath:v8 fromClient:v6 useDefaultPlayerIfNoneSpecified:0];

  int v10 = [(MRDNowPlayingServer *)self queryExistingPlayerPath:v9];
  id v11 = [v8 client];
  __int16 v12 = [v10 nowPlayingClient];
  [v12 setClient:v11];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000F6A64;
  v14[3] = &unk_100415DC8;
  id v15 = v10;
  id v13 = v10;
  sub_100014324(v7, v14);
}

- (void)_handleUpdateClientPropertiesMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = MRCreatePlayerPathFromXPCMessage();
  id v9 = [(MRDNowPlayingServer *)self resolvePlayerPath:v8 fromClient:v6 useDefaultPlayerIfNoneSpecified:0];

  int v10 = [(MRDNowPlayingServer *)self queryExistingPlayerPath:v9];
  id v11 = [v10 nowPlayingClient];
  __int16 v12 = [v8 client];
  [v11 updateClient:v12];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000F6BEC;
  v14[3] = &unk_100415DC8;
  id v15 = v10;
  id v13 = v10;
  sub_100014324(v7, v14);
}

- (void)_handleGetPlayerPropertiesMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  [(MRDNowPlayingServer *)self queryExistingPlayerPathForXPCMessage:v6 forClient:a4];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000F6D18;
  v8[3] = &unk_100415DC8;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v9;
  sub_100014324(v6, v8);
}

- (void)_handleSetPlayerPropertiesMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = MRCreatePlayerPathFromXPCMessage();
  id v9 = [(MRDNowPlayingServer *)self resolvePlayerPath:v8 fromClient:v6];

  int v10 = [(MRDNowPlayingServer *)self queryExistingPlayerPath:v9];
  id v11 = [v10 playerClient];
  [v11 setPlayerPath:v8];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000F6EC0;
  v13[3] = &unk_100415DC8;
  id v14 = v10;
  id v12 = v10;
  sub_100014324(v7, v13);
}

- (void)_handleUpdatePlayerPropertiesMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = MRCreatePlayerPathFromXPCMessage();
  id v9 = [(MRDNowPlayingServer *)self resolvePlayerPath:v8 fromClient:v6];

  int v10 = [(MRDNowPlayingServer *)self queryExistingPlayerPath:v9];
  id v11 = [v10 playerClient];
  id v12 = [v8 player];
  [v11 updatePlayer:v12];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000F7044;
  v14[3] = &unk_100415DC8;
  id v15 = v10;
  id v13 = v10;
  sub_100014324(v7, v14);
}

- (void)_handleGetPlaybackStateMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  [(MRDNowPlayingServer *)self queryExistingPlayerPathForXPCMessage:v6 forClient:a4];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000F7158;
  v8[3] = &unk_100415DC8;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v9;
  sub_100014324(v6, v8);
}

- (void)_handleSetPlaybackStateMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = [(MRDNowPlayingServer *)self queryPlayerPathForXPCMessage:v6 fromClient:a4];
  id v8 = [v7 nowPlayingClient];

  if (v8)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v6, "MRXPC_PLAYBACK_STATE_KEY");
    double v10 = xpc_dictionary_get_double(v6, "MRXPC_TIMESTAMP");
    id v11 = [v7 playerClient];
    id v12 = v11;
    if (v10 <= 0.0)
    {
      [v11 updatePlaybackState:uint64 date:0];
    }
    else
    {
      id v13 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:v10];
      [v12 updatePlaybackState:uint64 date:v13];
    }
  }
  else
  {
    id v12 = _MRLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v7 playerPath];
      int v15 = 138412290;
      id v16 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unable to set playback state. No now playing client found for %@", (uint8_t *)&v15, 0xCu);
    }
  }

  sub_1001679D8(v6, [v7 error]);
}

- (void)_handleGetAnyAppIsPlayingMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v8 = [(MRDNowPlayingServer *)self queryExistingPlayerPathForXPCMessage:v6 forClient:a4];
  id v7 = [v8 originClient];
  LODWORD(self) = [v7 isPlaying];

  sub_10001432C(v6, (uint64_t)"MRXPC_APP_IS_PLAYING_KEY", 2, self, 0);
}

- (void)_handleRequestVideoThumbnailsMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MRDNowPlayingServer *)self queryExistingPlayerPathForXPCMessage:v6 forClient:v7];
  id v9 = _MRLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    double v10 = [v8 xpcClient];
    int v17 = 138543618;
    id v18 = v7;
    __int16 v19 = 2114;
    id v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received video thumbnails request from %{public}@ for %{public}@", (uint8_t *)&v17, 0x16u);
  }
  id v11 = [v8 xpcClient];

  id v12 = _MRLogForCategory();
  id v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v8 xpcClient];
      int v17 = 138543362;
      id v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Relaying video thumbnails request to %{public}@", (uint8_t *)&v17, 0xCu);
    }
    xpc_dictionary_set_uint64(v6, "MRXPC_MESSAGE_ID_KEY", 0x700000000000004uLL);
    int v15 = [v8 playerPath];
    MRAddPlayerPathToXPCMessage();
    id v16 = [v8 xpcClient];
    [v16 relayXPCMessage:v6 andReply:1];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10032ECCC();
    }

    sub_1001679D8(v6, [v8 error]);
  }
}

- (void)_handleRequestAudioAmplitudeSamplesMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MRDNowPlayingServer *)self queryExistingPlayerPathForXPCMessage:v6 forClient:v7];
  id v9 = _MRLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    double v10 = [v8 xpcClient];
    int v17 = 138543618;
    id v18 = v7;
    __int16 v19 = 2114;
    id v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received audio amplitude samples request from %{public}@ for %{public}@", (uint8_t *)&v17, 0x16u);
  }
  id v11 = [v8 xpcClient];

  id v12 = _MRLogForCategory();
  id v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v8 xpcClient];
      int v17 = 138543362;
      id v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Relaying audio amplitude samples request to %{public}@", (uint8_t *)&v17, 0xCu);
    }
    xpc_dictionary_set_uint64(v6, "MRXPC_MESSAGE_ID_KEY", 0x700000000000005uLL);
    int v15 = [v8 playerPath];
    MRAddPlayerPathToXPCMessage();
    id v16 = [v8 xpcClient];
    [v16 relayXPCMessage:v6 andReply:1];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10032ED00();
    }

    sub_1001679D8(v6, [v8 error]);
  }
}

- (void)_handleSendLyricsEvent:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MRDNowPlayingServer *)self queryExistingPlayerPathForXPCMessage:v6 forClient:v7];
  id v9 = _MRLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    double v10 = [v8 xpcClient];
    int v17 = 138543618;
    id v18 = v7;
    __int16 v19 = 2114;
    id v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received lyrics event from client %{public}@ and sending to %{public}@", (uint8_t *)&v17, 0x16u);
  }
  id v11 = [v8 xpcClient];

  id v12 = _MRLogForCategory();
  id v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v8 xpcClient];
      int v17 = 138543362;
      id v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Relaying lyrics event to %{public}@", (uint8_t *)&v17, 0xCu);
    }
    xpc_dictionary_set_uint64(v6, "MRXPC_MESSAGE_ID_KEY", 0x700000000000006uLL);
    int v15 = [v8 playerPath];
    MRAddPlayerPathToXPCMessage();
    id v16 = [v8 xpcClient];
    [v16 relayXPCMessage:v6 andReply:0];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10032ED34();
    }

    sub_1001679D8(v6, [v8 error]);
  }
}

- (void)_handleGetNowPlayingClientsMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v20 = v6;
  __int16 v19 = [(MRDNowPlayingServer *)self queryExistingPlayerPathForXPCMessage:v6 forClient:v7];
  id v8 = [v19 originClient];
  id v9 = [v8 nowPlayingClients];

  id v21 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * (void)v14);
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_1000F7D18;
        v22[3] = &unk_100416910;
        id v23 = v7;
        uint64_t v24 = v15;
        id v16 = objc_retainBlock(v22);
        if (((unsigned int (*)(void))v16[2])()) {
          [v21 addObject:v15];
        }

        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v12);
  }

  [v21 sortUsingComparator:&stru_10041C750];
  int v17 = objc_msgSend(v21, "msv_map:", &stru_10041C790);
  id v18 = +[NSPropertyListSerialization dataWithPropertyList:v17 format:200 options:0 error:0];
  sub_1001678A4(v20, (uint64_t)"MRXPC_NOWPLAYING_CLIENT_ARRAY_DATA_KEY", v18, 0);
}

- (void)_handleSetNowPlayingClientMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  int v22 = 0;
  id v8 = MRCreatePlayerPathFromXPCMessage();
  id v9 = [v8 origin];
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F8010;
  block[3] = &unk_10041B6E0;
  block[4] = self;
  id v11 = v9;
  id v15 = v11;
  id v12 = v7;
  id v16 = v12;
  id v13 = v8;
  id v17 = v13;
  id v18 = &v19;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  sub_1001679D8(v6, *((_DWORD *)v20 + 6));

  _Block_object_dispose(&v19, 8);
}

- (void)_handleGetNowPlayingClientMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  [(MRDNowPlayingServer *)self queryExistingPlayerPathForXPCMessage:v6 forClient:a4];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000F81D8;
  v8[3] = &unk_100415DC8;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v9;
  sub_100014324(v6, v8);
}

- (void)_handleRemoveNowPlayingClientMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v10 = [(MRDNowPlayingServer *)self queryExistingPlayerPathForXPCMessage:v6 forClient:a4];
  id v7 = [v10 originClient];
  id v8 = [v10 nowPlayingClient];
  id v9 = [v8 client];
  [v7 removeNowPlayingClientForClient:v9];

  sub_1001679D8(v6, [v10 error]);
}

- (void)_handleGetNowPlayingPlayersMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = [(MRDNowPlayingServer *)self queryExistingPlayerPathForXPCMessage:v6 forClient:a4];
  id v8 = [v7 nowPlayingClient];
  id v9 = [v8 playerClients];

  id v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v15);
        id v17 = objc_msgSend(v7, "nowPlayingClient", (void)v22);
        unsigned int v18 = [v17 canBeNowPlayingForPlayerClient:v16];

        if (v18)
        {
          uint64_t v19 = [v16 player];
          id v20 = [v19 data];
          [v10 addObject:v20];
        }
        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }

  uint64_t v21 = +[NSPropertyListSerialization dataWithPropertyList:v10 format:200 options:0 error:0];
  sub_1001678A4(v6, (uint64_t)"MRXPC_NOWPLAYING_PLAYER_ARRAY_DATA_KEY", v21, 0);
}

- (void)_handleSetNowPlayingPlayerMessage:(id)a3 fromClient:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  id v7 = MRCreatePlayerPathFromXPCMessage();
  id v8 = [(MRDNowPlayingServer *)self resolvePlayerPath:v7 fromClient:v6 useDefaultPlayerIfNoneSpecified:0];

  id v9 = [(MRDNowPlayingServer *)self queryExistingPlayerPath:v8];
  id v10 = [v9 playerClient];
  id v11 = [v9 nowPlayingClient];
  [v11 setActivePlayerClient:v10];

  uint64_t v12 = [v7 player];
  if (v12)
  {
    id v13 = (void *)v12;
    uint64_t v14 = [v9 playerClient];

    if (!v14) {
      goto LABEL_5;
    }
  }
  id v15 = [v9 nowPlayingClient];

  if (v15) {
    unsigned int v16 = 0;
  }
  else {
LABEL_5:
  }
    unsigned int v16 = [v9 error];
  sub_1001679D8(v17, v16);
}

- (void)_handleGetNowPlayingPlayerMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  [(MRDNowPlayingServer *)self queryExistingPlayerPathForXPCMessage:v6 forClient:a4];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000F870C;
  v8[3] = &unk_100415DC8;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v9;
  sub_100014324(v6, v8);
}

- (void)_handleRemoveNowPlayingPlayerMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v10 = [(MRDNowPlayingServer *)self queryExistingPlayerPathForXPCMessage:v6 forClient:a4];
  id v7 = [v10 playerClient];
  id v8 = [v7 player];

  id v9 = [v10 nowPlayingClient];
  [v9 removePlayerClientForPlayer:v8];

  sub_1001679D8(v6, [v10 error]);
}

- (void)_handleGetActivePlayerPathsForLocalOriginMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = [(MRDNowPlayingServer *)self localOriginClient];
  id v7 = [v6 activePlayerClients];
  objc_msgSend(v7, "mr_map:", &stru_10041C7D0);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  id v8 = +[NSPropertyListSerialization dataWithPropertyList:v9 format:200 options:0 error:0];
  sub_1001678A4(v5, (uint64_t)"MRXPC_NOWPLAYING_PLAYER_PATH_ARRAY_DATA_KEY", v8, 0);
}

- (void)_handleGetPlayerPictureInPictureEnabledMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = [(MRDNowPlayingServer *)self queryExistingPlayerPathForXPCMessage:v6 forClient:a4];
  id v8 = [v7 playerClient];
  unsigned __int8 v9 = [v8 isPictureInPictureEnabled];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000F8A30;
  v11[3] = &unk_10041C7F8;
  id v12 = v7;
  unsigned __int8 v13 = v9;
  id v10 = v7;
  sub_100014324(v6, v11);
}

- (void)_handleSetPlayerPictureInPictureEnabledMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v9 = [(MRDNowPlayingServer *)self queryPlayerPathForXPCMessage:v6 fromClient:a4];
  BOOL v7 = xpc_dictionary_get_BOOL(v6, "MRXPC_PICTURE_IN_PICTURE_ENABLED_KEY");
  id v8 = [v9 playerClient];
  [v8 setPictureInPictureEnabled:v7];

  sub_1001679D8(v6, [v9 error]);
}

- (void)_handleContentItemChangedMessage:(id)a3 fromClient:(id)a4
{
  id v10 = a3;
  id v5 = -[MRDNowPlayingServer queryExistingPlayerPathForXPCMessage:forClient:](self, "queryExistingPlayerPathForXPCMessage:forClient:");
  id v6 = [v5 playerClient];

  if (v6)
  {
    BOOL v7 = (void *)MRCreateContentItemsFromXPCMessage();
    if (v7)
    {
      id v8 = [objc_alloc((Class)MRPlaybackQueue) initWithContentItems:v7];
      if (v8)
      {
        id v9 = [v5 playerClient];
        [v9 updatePlaybackQueue:v8];
      }
    }
  }
  sub_1001679D8(v10, [v5 error]);
}

- (void)_handleContentItemArtworkChangedMessage:(id)a3 fromClient:(id)a4
{
  id v9 = a3;
  id v5 = -[MRDNowPlayingServer queryExistingPlayerPathForXPCMessage:forClient:](self, "queryExistingPlayerPathForXPCMessage:forClient:");
  id v6 = [v5 playerClient];

  if (v6)
  {
    BOOL v7 = (void *)MRCreateContentItemsFromXPCMessage();
    id v8 = [v5 playerClient];
    [v8 notifyArtworkChangedForContentItems:v7];
  }
  sub_1001679D8(v9, [v5 error]);
}

- (void)_handleGetDeviceInfo:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MRDNowPlayingServer *)self queryExistingPlayerPathForXPCMessage:v6 forClient:v7];
  unsigned int v9 = [v8 error];
  unsigned int v10 = [v7 isEntitledFor:0x2000];

  if (v10)
  {
    id v11 = [v8 originClient];
    id v12 = [v11 deviceInfo];
  }
  else
  {
    id v12 = 0;
    unsigned int v9 = 3;
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000F8E18;
  v14[3] = &unk_10041C820;
  unsigned int v16 = v9;
  id v15 = v12;
  id v13 = v12;
  sub_100014324(v6, v14);
}

- (void)_handleGetElectedPlayerPathMessage:(id)a3 fromClient:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000F8EE4;
  v4[3] = &unk_100415DC8;
  v4[4] = self;
  sub_100014324(a3, v4);
}

- (void)_handlePlaybackSessionRequest:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = MRCreateProtobufFromXPCMessage();
  id v7 = [v6 playerPath];
  id v8 = [(MRDNowPlayingServer *)self queryExistingPlayerPath:v7];

  if ([v8 error])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000F9054;
    v10[3] = &unk_100415DC8;
    id v11 = v8;
    sub_100014324(v5, v10);
  }
  else
  {
    unsigned int v9 = [v8 xpcClient];
    [v9 relayXPCMessage:v5 andReply:1 resultCallback:0];
  }
}

- (void)_handleGetSupportedCommandsMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 setHasRequestedSupportedCommands:1];
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = sub_1000F15E8;
  void v22[4] = sub_1000F15F8;
  id v23 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000F92E8;
  v18[3] = &unk_10041C848;
  v18[4] = self;
  id v8 = v6;
  id v19 = v8;
  id v9 = v7;
  id v20 = v9;
  uint64_t v21 = v22;
  unsigned int v10 = objc_retainBlock(v18);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000F947C;
  v16[3] = &unk_10041C870;
  id v11 = v8;
  id v17 = v11;
  id v12 = objc_retainBlock(v16);
  id v13 = v9;
  uint64_t v14 = v12;
  id v15 = v10;
  ((void (*)(void))v10[2])();

  _Block_object_dispose(v22, 8);
}

- (void)_handleSetSupportedCommandsMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[MRDMediaRemoteServer server];
  id v8 = [v7 nowPlayingServer];
  id v9 = [v8 queryPlayerPathForXPCMessage:v5 fromClient:v6];

  unsigned int v10 = [v9 nowPlayingClient];

  if (v10)
  {
    id v11 = MRCreateSupportedCommandsDataFromXPCMessage();
    id v12 = [v9 playerClient];
    [v12 setSupportedRemoteControlCommandsData:v11];
  }
  else
  {
    id v11 = _MRLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "ERROR: now playing client could not be found for setting supported commands", v13, 2u);
    }
  }

  sub_1001679D8(v5, [v9 error]);
}

- (void)_handleSetDefaultSupportedCommandsMessage:(id)a3 fromClient:(id)a4
{
  id v30 = a3;
  id v6 = a4;
  id v7 = (void *)MRCreateSupportedCommandsDataFromXPCMessage();
  id v8 = +[MRDMediaRemoteServer server];
  id v9 = [v8 nowPlayingServer];
  unsigned int v10 = [v9 queryExistingPlayerPathForXPCMessage:v30 forClient:v6];

  id v11 = [v10 unresolvedPlayerPath];
  id v12 = [v11 client];
  id v13 = [v12 bundleIdentifier];

  uint64_t v14 = [v6 bundleIdentifier];
  if ([v13 isEqualToString:v14])
  {
  }
  else
  {
    unsigned __int8 v15 = [v6 isEntitledFor:256];

    if ((v15 & 1) == 0)
    {
      unsigned int v29 = 3;
      goto LABEL_8;
    }
  }
  unsigned int v16 = [v10 originClient];
  [v16 updateDefaultSupportedCommandsData:v7 forClient:v13];

  id v17 = [v10 nowPlayingClient];

  if (!v17)
  {
    id v18 = objc_alloc_init((Class)MRPlayerPath);
    id v19 = [v10 originClient];
    id v20 = [v19 origin];
    [v18 setOrigin:v20];

    id v21 = objc_alloc_init((Class)MRClient);
    [v18 setClient:v21];

    long long v22 = [v10 unresolvedPlayerPath];
    id v23 = [v22 client];
    long long v24 = [v23 bundleIdentifier];
    long long v25 = [v18 client];
    [v25 setBundleIdentifier:v24];

    [(MRDNowPlayingServer *)self postSupportedCommandsDidChange:v7 forPlayerPath:v18 handler:0];
  }
  id v26 = objc_alloc_init((Class)NSMutableDictionary);
  long long v27 = [v10 unresolvedPlayerPath];
  MRAddPlayerPathToUserInfo();

  long long v28 = +[MRDMediaRemoteServer server];
  [v28 postClientNotificationNamed:_MRMediaRemoteDefaultSupportedCommandsDidChangeNotification userInfo:v26];

  unsigned int v29 = 0;
LABEL_8:
  sub_1001679D8(v30, v29);
}

- (void)_handleGetLastPlayingDateMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = MRCreatePlayerPathFromXPCMessage();
  id v7 = [(MRDNowPlayingServer *)self resolveExistingPlayerPath:v6];
  [(MRDNowPlayingServer *)self queryExistingPlayerPath:v7];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000FA170;
  v11[3] = &unk_1004164F0;
  id v12 = v6;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v5;
  id v8 = v5;
  id v9 = v13;
  id v10 = v6;
  sub_100014324(v8, v11);
}

- (void)_handleSetPlayerClientPropertiesMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = MRCreateProtobufFromXPCMessage();
  id v9 = [(MRDNowPlayingServer *)self queryPlayerPathForXPCMessage:v6 fromClient:v7];

  id v10 = [v9 playerClient];

  if (v10)
  {
    id v11 = [v9 playerClient];
    id v12 = [v8 lastPlayingDate];
    [v11 updateLastPlayingDate:v12];
  }
  else
  {
    id v11 = _MRLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Unable to set properties from message %@. No player client found.", (uint8_t *)&v13, 0xCu);
    }
  }

  sub_1001679D8(v6, [v9 error]);
}

- (void)_handleSetOriginClientPropertiesMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = MRCreateProtobufFromXPCMessage();
  id v7 = MRCreateOriginFromXPCMessage();
  id v8 = [(MRDNowPlayingServer *)self originClientForOrigin:v7];
  if (v8)
  {
    id v9 = [v6 lastPlayingDate];
    [v8 updateLastPlayingDate:v9];

    id v10 = [v6 devicePlaybackSessionID];
    [v8 setDevicePlaybackSessionID:v10];

    id v11 = v5;
    unsigned int v12 = 0;
  }
  else
  {
    int v13 = _MRLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      unsigned __int8 v15 = v6;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Unable to set properties from message %@. No origin client found for %@", (uint8_t *)&v14, 0x16u);
    }

    id v11 = v5;
    unsigned int v12 = 5;
  }
  sub_1001679D8(v11, v12);
}

- (void)_handleRegisterForWakingNowPlayingNotifications:(id)a3 fromClient:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = MRCreatePlayerPathArrayFromXPCMessage();
  if ([v5 isEntitledFor:128])
  {
    [v5 setWantsAssertionsForNotificationsWithPlayerPath:v7];
    id v8 = 0;
  }
  else
  {
    id v8 = [objc_alloc((Class)NSError) initWithMRError:2, @"Unable to register for waking now playing notifications without entitlement: %@", @"com.apple.mediaremote.waking-now-playing-notifications" format];
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000FA684;
  v10[3] = &unk_100415DC8;
  id v11 = v8;
  id v9 = v8;
  sub_100014324(v6, v10);
}

- (void)_handleGetAudioFormatContentInfoForOriginMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = MRCreateOriginFromXPCMessage();
  id v7 = [(MRDNowPlayingServer *)self originClientForOrigin:v6];
  id v8 = [v7 nowPlayingAudioFormatContentInfos];
  id v9 = v8;
  if (v8)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000FA81C;
    v11[3] = &unk_100415DC8;
    id v12 = v8;
    sub_100014324(v5, v11);
  }
  else
  {
    id v10 = _MRLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      uint64_t v14 = objc_opt_class();
      __int16 v15 = 2114;
      __int16 v16 = v6;
      __int16 v17 = 2114;
      id v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Unable to get audio format content info for origin: %{public}@ | client %{public}@", buf, 0x20u);
    }

    sub_1001679D8(v5, 5u);
  }
}

- (void)_handleGetImageDimensionsForArtworkDataMessage:(id)a3 fromClient:(id)a4
{
  id v4 = a3;
  id v5 = (void *)MRCreateDataFromXPCMessage();
  +[MRImageUtilities imageDimensionsForImageData:v5 error:0];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000FA8F0;
  v8[3] = &unk_10041C998;
  void v8[4] = v6;
  v8[5] = v7;
  sub_100014324(v4, v8);
}

- (void)_handleFetchPlaybackQueueParticipantsMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(MRDNowPlayingServer *)self queryExistingPlayerPathForXPCMessage:v6 forClient:a4];
  id v8 = [v7 playerClient];
  id v9 = [v8 participants];
  id v10 = objc_msgSend(v9, "msv_compactMap:", &stru_10041C9D8);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000FAA7C;
  v13[3] = &unk_100415DF0;
  id v14 = v10;
  id v15 = v7;
  id v11 = v7;
  id v12 = v10;
  sub_100014324(v6, v13);
}

- (void)_handleBeginMusicHandoffSessionMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = (void *)MRCreateDataFromXPCMessage();
  id v7 = [objc_alloc((Class)MRMusicHandoffSession) initWithProtobufData:v6];
  id v8 = [v7 sourcePlayerPath];
  id v9 = [v7 destinationPlayerPath];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000FAC18;
  v11[3] = &unk_10041CA28;
  id v12 = v5;
  id v10 = v5;
  [(MRDNowPlayingServer *)self beginMusicHandoffSessionWithSource:v8 destination:v9 completion:v11];
}

- (void)_handleSendMusicHandoffEventMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MRCreateDataFromXPCMessage();
  id v9 = [objc_alloc((Class)MRMusicHandoffEvent) initWithProtobufData:v8];
  id v10 = objc_alloc((Class)MRPlayerPath);
  id v11 = [v7 createNowPlayingClient];

  id v12 = [v10 initWithOrigin:0 client:v11 player:0];
  int v13 = [(MRDNowPlayingServer *)self resolveExistingPlayerPath:v12];
  id v14 = [(MRDNowPlayingServer *)self queryExistingPlayerPath:v13];

  if ([v14 error])
  {
    id v15 = objc_msgSend(objc_alloc((Class)NSError), "initWithMRError:", objc_msgSend(v14, "error"));
  }
  else
  {
    __int16 v16 = [v14 playerClient];
    id v15 = [v16 handleHandoffEvent:v9];
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000FB0DC;
  v19[3] = &unk_100415DF0;
  id v20 = v15;
  id v21 = v6;
  id v17 = v6;
  id v18 = v15;
  sub_100014324(v17, v19);
}

- (void)nowPlayingPlayerClient:(id)a3 playerStateDidChange:(id)a4
{
  id v6 = a4;
  id v7 = [a3 playerPath];
  [(MRDNowPlayingServer *)self postNowPlayingPlayerStateDidChange:v6 forPlayerPath:v7 handler:0];
}

- (void)nowPlayingPlayerClient:(id)a3 isPlayingDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [v6 timeSincePlaying];
  id v8 = +[NSDate dateWithTimeIntervalSinceNow:-v7];
  [v8 timeIntervalSinceReferenceDate];
  double v10 = v9;

  id v11 = [v6 playerPath];
  [(MRDNowPlayingServer *)self postIsPlayingDidChange:v4 lastPlayingTimestamp:v11 forPlayerPath:0 handler:v10];
  [(MRDNowPlayingServer *)self maybePostDistributedNotifications];
  if (v4)
  {
    id v12 = [v11 origin];
    if ([v12 isLocal])
    {
      int v13 = +[MRUserSettings currentSettings];
      unsigned int v14 = [v13 shouldWakeDeviceForRemoteControlCommands];

      if (v14)
      {
        nowPlayingInfoObserverQueue = self->_nowPlayingInfoObserverQueue;
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_1000FB30C;
        v16[3] = &unk_1004158D8;
        void v16[4] = self;
        id v17 = v6;
        dispatch_async((dispatch_queue_t)nowPlayingInfoObserverQueue, v16);
      }
    }
    else
    {
    }
  }
}

- (void)nowPlayingPlayerClient:(id)a3 playbackStateDidChange:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = [a3 playerPath];
  [(MRDNowPlayingServer *)self postPlaybackStateDidChange:v4 forPlayerPath:v6 handler:0];
}

- (void)nowPlayingPlayerClient:(id)a3 supportedCommandsDidChange:(id)a4
{
  id v6 = a4;
  id v7 = [a3 playerPath];
  [(MRDNowPlayingServer *)self postSupportedCommandsDidChange:v6 forPlayerPath:v7 handler:0];
}

- (void)nowPlayingPlayerClient:(id)a3 playbackQueueDidChange:(id)a4 nowPlayingItemDidChange:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = [a3 playerPath];
  [(MRDNowPlayingServer *)self postPlaybackQueueDidChange:v8 nowPlayingItemDidChange:v5 forPlayerPath:v9 handler:0];
}

- (void)nowPlayingPlayerClient:(id)a3 playbackQueueCapabilitiesDidChange:(unint64_t)a4
{
  id v6 = [a3 playerPath];
  [(MRDNowPlayingServer *)self postPlaybackQueueCapabilitiesDidChange:a4 forPlayerPath:v6 handler:0];
}

- (void)nowPlayingPlayerClient:(id)a3 playbackQueueContentItemsDidChange:(id)a4
{
  id v6 = a4;
  id v7 = [a3 playerPath];
  [(MRDNowPlayingServer *)self postPlaybackQueueContentItemsDidChange:v6 forPlayerPath:v7 handler:0];
}

- (void)nowPlayingPlayerClient:(id)a3 playbackQueueArtworkContentItemsDidChange:(id)a4
{
  id v6 = a4;
  id v7 = [a3 playerPath];
  [(MRDNowPlayingServer *)self postPlaybackQueueContentItemsArtworkDidChange:v6 forPlayerPath:v7 handler:0];
}

- (void)nowPlayingPlayerClient:(id)a3 pictureInPictureEnabledDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [a3 playerPath];
  [(MRDNowPlayingServer *)self postPictureInPictureDidChange:v4 forPlayerPath:v6 handler:0];

  [(MRDNowPlayingServer *)self maybePostDistributedNotifications];
}

- (void)nowPlayingPlayerClient:(id)a3 playerCanBeNowPlayingDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [a3 playerPath];
  if (v4) {
    [(MRDNowPlayingServer *)self postPlayerDidRegisterCanBeNowPlayingForPlayerPath:v6 handler:0];
  }
  else {
    [(MRDNowPlayingServer *)self postPlayerDidUnregisterCanBeNowPlayingForPlayerPath:v6 handler:0];
  }
}

- (void)nowPlayingPlayerClient:(id)a3 playbackQueueParticipantsDidChange:(id)a4
{
  id v6 = a4;
  id v7 = [a3 playerPath];
  [(MRDNowPlayingServer *)self postPlaybackQueueParticipantsDidChange:v6 forPlayerPath:v7 handler:0];
}

- (void)startObservingNowPlayingInfoForNowPlayingPlayerClient:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_nowPlayingInfoObserverQueue);
  BOOL v5 = [v4 playerPath];
  objc_initWeak(location, self);
  objc_initWeak(&from, v4);
  id v6 = +[NSNotificationCenter defaultCenter];
  uint64_t v7 = kMRMediaRemotePlayerNowPlayingInfoDidChangeNotification;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000FBA38;
  v25[3] = &unk_10041CA50;
  objc_copyWeak(&v27, location);
  id v8 = v5;
  id v26 = v8;
  objc_copyWeak(&v28, &from);
  id v9 = [v6 addObserverForName:v7 object:0 queue:0 usingBlock:v25];
  id nowPlayingInfoObserverHandle = self->_nowPlayingInfoObserverHandle;
  self->_id nowPlayingInfoObserverHandle = v9;

  nowPlayingInfoObserverQueue = self->_nowPlayingInfoObserverQueue;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000FBBFC;
  v22[3] = &unk_10041CA78;
  objc_copyWeak(&v23, location);
  objc_copyWeak(&v24, &from);
  id v12 = +[MSVTimer timerWithInterval:nowPlayingInfoObserverQueue queue:v22 block:8.0];
  wakeDeviceTimer = self->_wakeDeviceTimer;
  self->_wakeDeviceTimer = v12;

  unsigned int v14 = [v4 playbackQueue];
  id v15 = [v14 contentItems];
  __int16 v16 = [v15 firstObject];
  id v17 = [v16 metadata];
  id v18 = [v17 mediaType];

  if (v18)
  {
    id v19 = self->_nowPlayingInfoObserverQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000FBC60;
    block[3] = &unk_1004158D8;
    block[4] = self;
    id v21 = v4;
    dispatch_async((dispatch_queue_t)v19, block);
  }
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v28);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&from);
  objc_destroyWeak(location);
}

- (void)stopObservingNowPlayingInfo
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_nowPlayingInfoObserverQueue);
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self->_nowPlayingInfoObserverHandle];

  wakeDeviceTimer = self->_wakeDeviceTimer;

  [(MSVTimer *)wakeDeviceTimer invalidate];
}

- (void)wakeDeviceIfNecessaryForNowPlayingPlayerClient:(id)a3
{
  nowPlayingInfoObserverQueue = self->_nowPlayingInfoObserverQueue;
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)nowPlayingInfoObserverQueue);
  [(MRDNowPlayingServer *)self stopObservingNowPlayingInfo];
  id v14 = [v5 playerPath];
  id v6 = [v5 playbackQueue];

  uint64_t v7 = [v6 contentItems];
  id v8 = [v7 firstObject];
  id v9 = [v8 metadata];
  id v10 = [v9 mediaType];

  id v11 = [(MRDNowPlayingServer *)self localOriginClient];
  id v12 = [v11 deviceInfo];

  if (v10 != (id)1
    && ([v12 isAirPlayActive] & 1) == 0
    && ([v12 isProxyGroupPlayer] & 1) == 0)
  {
    id v13 = [objc_alloc((Class)NSString) initWithFormat:@"Playback started of type %ld for %@", v10, v14];
    sub_10016A990(1);
  }
}

- (void)nowPlayingClient:(id)a3 activePlayerDidChangeFromPlayerClient:(id)a4 toPlayerClient:(id)a5
{
  id v9 = a3;
  id v7 = a5;
  id v8 = [v7 playerPath];
  if (!v8)
  {
    id v8 = [v9 playerPath];
  }
  -[MRDNowPlayingServer postActivePlayerDidChangeForPlayerPath:withPlaybackState:handler:](self, "postActivePlayerDidChangeForPlayerPath:withPlaybackState:handler:", v8, [v7 playbackState], 0);
  [(MRDNowPlayingServer *)self maybePostDistributedNotifications];
}

- (void)nowPlayingClient:(id)a3 clientStateDidChange:(id)a4
{
  id v6 = a4;
  id v7 = [a3 playerPath];
  [(MRDNowPlayingServer *)self postNowPlayingClientStateDidChange:v6 forPlayerPath:v7 handler:0];
}

- (void)nowPlayingClient:(id)a3 playerDidRegister:(id)a4
{
  objc_msgSend(a4, "playerPath", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(MRDNowPlayingServer *)self postPlayerDidRegisterForPlayerPath:v5 handler:0];
}

- (void)nowPlayingClient:(id)a3 playerDidUnregister:(id)a4
{
  id v5 = a4;
  id v6 = [v5 playbackState];
  id v7 = [v5 canBeNowPlayingPlayer];
  id v8 = [v5 playerPath];
  [(MRDNowPlayingServer *)self postPlayerDidUnregisterWithPlaybackState:v6 canBeNowPlaying:v7 forPlayerPath:v8 handler:0];

  id v9 = [v5 handoffSessions];
  id v10 = [v9 objectEnumerator];
  id v11 = [v10 allObjects];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v11;
  id v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      __int16 v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * (void)v16), "invalidate", (void)v17);
        __int16 v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }
}

- (void)nowPlayingPlayerClient:(id)a3 clientCanBeNowPlayingDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [a3 playerPath];
  if (v4) {
    [(MRDNowPlayingServer *)self postClientDidRegisterCanBeNowPlayingForPlayerPath:v6 handler:0];
  }
  else {
    [(MRDNowPlayingServer *)self postClientDidUnregisterCanBeNowPlayingForPlayerPath:v6 handler:0];
  }
}

- (void)nowPlayingClient:(id)a3 applicationDidForeground:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  pid_t v7 = getpid();
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  id v9 = [v6 playerPath];

  MRAddPlayerPathToUserInfo();
  id v10 = +[NSNumber numberWithBool:v4];
  [v8 setObject:v10 forKeyedSubscript:kMRMediaRemoteApplicationForegroundUserInfoKey];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000FC280;
  v11[3] = &unk_10041CA98;
  pid_t v12 = v7;
  [(MRDNowPlayingServer *)self postClientNowPlayingNotificationNamed:_MRMediaRemoteApplicationDidForegroundNotification userInfo:v8 predicate:v11];
}

- (void)nowPlayingOriginClient:(id)a3 activePlayerPathDidChange:(id)a4 withPlaybackState:(unsigned int)a5
{
  [(MRDNowPlayingServer *)self postNowPlayingApplicationDidChangeForPlayerPath:a4 withPlaybackState:*(void *)&a5 handler:0];

  [(MRDNowPlayingServer *)self maybePostDistributedNotifications];
}

- (void)nowPlayingOriginClient:(id)a3 applicationActivityDidBegin:(id)a4
{
  uint64_t v5 = kMRApplicationActivityHasBegunNotification;
  uint64_t v8 = kMRApplicationActivityUserInfoKey;
  id v9 = a4;
  id v6 = a4;
  pid_t v7 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];

  [(MRDNowPlayingServer *)self postClientNowPlayingNotificationNamed:v5 userInfo:v7];
}

- (void)nowPlayingOriginClient:(id)a3 applicationActivityDidEnd:(id)a4
{
  uint64_t v5 = kMRApplicationActivityHasEndedNotification;
  uint64_t v8 = kMRApplicationActivityUserInfoKey;
  id v9 = a4;
  id v6 = a4;
  pid_t v7 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];

  [(MRDNowPlayingServer *)self postClientNowPlayingNotificationNamed:v5 userInfo:v7];
}

- (void)nowPlayingOriginClient:(id)a3 applicationActivityStatusDidChange:(id)a4
{
  uint64_t v5 = kMRApplicationActivityStatusDidChangeNotification;
  uint64_t v8 = kMRApplicationActivityUserInfoKey;
  id v9 = a4;
  id v6 = a4;
  pid_t v7 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];

  [(MRDNowPlayingServer *)self postClientNowPlayingNotificationNamed:v5 userInfo:v7];
}

- (void)handleNowPlayingOriginClient:(id)a3 deviceInfoDidChange:(id)a4 previousDeviceInfo:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[MRNowPlayingOriginClientManager sharedManager];
  pid_t v12 = [v10 playerPath];
  id v14 = [v11 existingOriginClientRequestsForPlayerPath:v12];

  [v14 setDeviceInfo:v9];
  id v13 = [v10 origin];

  [(MRDNowPlayingServer *)self postDeviceInfoDidChange:v9 previousDeviceInfo:v8 forOrigin:v13 handler:0];
}

- (void)nowPlayingOriginClient:(id)a3 clientDidRegister:(id)a4
{
  objc_msgSend(a4, "playerPath", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(MRDNowPlayingServer *)self postClientDidRegisterForPlayerPath:v5 handler:0];
}

- (void)nowPlayingOriginClient:(id)a3 clientDidUnregister:(id)a4
{
  id v6 = a4;
  long long v17 = (MRDNowPlayingOriginClient *)a3;
  pid_t v7 = [(MRDNowPlayingOriginClient *)v17 origin];
  unsigned int v8 = [v7 isHosted];
  localOriginClient = v17;
  if (v8) {
    localOriginClient = self->_localOriginClient;
  }
  id v10 = localOriginClient;

  id v11 = [v6 playerPath];
  pid_t v12 = [v11 client];
  id v13 = [v12 bundleIdentifier];
  id v14 = [(MRDNowPlayingOriginClient *)v10 defaultSupportedCommandsDataForClient:v13];

  uint64_t v15 = [v6 playerPath];
  id v16 = [v6 canBeNowPlaying];

  [(MRDNowPlayingServer *)self postClientDidUnregisterForPlayerPath:v15 hasDefaultSupportedCommands:v14 != 0 canBeNowPlaying:v16 handler:0];
}

- (void)nowPlayingOriginClient:(id)a3 currentRouteVolumeControlCapabilitiesDidChange:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = [a3 playerPath];
  [(MRDNowPlayingServer *)self postVolumeCapabilitiesDidChange:v6 capabilities:v4 handler:0];
}

- (void)nowPlayingOriginClient:(id)a3 currentRouteVolumeDidChange:(float)a4
{
  id v7 = [a3 playerPath];
  *(float *)&double v6 = a4;
  [(MRDNowPlayingServer *)self postVolumeDidChange:v7 volume:0 handler:v6];
}

- (void)nowPlayingOriginClient:(id)a3 currentRouteIsMutedDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [a3 playerPath];
  [(MRDNowPlayingServer *)self postIsMutedDidChange:v6 isMuted:v4 handler:0];
}

- (void)nowPlayingOriginClient:(id)a3 activePlayerClientsDidChange:(id)a4
{
  id v5 = [a3 origin];
  [(MRDNowPlayingServer *)self postActivePlayerPathsDidChangeForOrigin:v5 handler:0];
}

- (void)nowPlayingOriginClientPlaybackDidTimeout:(id)a3
{
  id v4 = a3;
  pid_t v5 = getpid();
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  id v7 = [v4 playerPath];

  MRAddPlayerPathToUserInfo();
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000FCA18;
  v8[3] = &unk_10041CA98;
  pid_t v9 = v5;
  [(MRDNowPlayingServer *)self postClientNowPlayingNotificationNamed:_MRMediaRemotePlaybackDidTimeoutNotification userInfo:v6 predicate:v8];
}

- (void)nowPlayingOriginClientDidChangeAudioFormatContentInfo:(id)a3
{
  id v4 = [a3 origin];
  [(MRDNowPlayingServer *)self postAudioFormatContentInfoDidChangeForOrigin:v4 handler:0];
}

- (void)nowPlayingServer:(id)a3 activeOriginDidChangeFromOriginClient:(id)a4 toOriginClient:(id)a5
{
  id v6 = a5;
  id v7 = [v6 activePlayerPath];
  unsigned int v8 = [v6 activeNowPlayingClient];

  pid_t v9 = [v8 activePlayerClient];
  -[MRDNowPlayingServer postActiveOriginDidChange:withPlaybackState:handler:](self, "postActiveOriginDidChange:withPlaybackState:handler:", v7, [v9 playbackState], 0);

  [(MRDNowPlayingServer *)self maybePostDistributedNotifications];
}

- (BOOL)nowPlayingLauncher:(id)a3 shouldRelaunch:(id)a4
{
  BOOL result = 0;
  if (MSVDeviceIsAudioAccessory())
  {
    pid_t v5 = +[MRUserSettings currentSettings];
    unsigned __int8 v6 = [v5 homepodDemoMode];

    if ((v6 & 1) == 0 && [(MRDNowPlayingServer *)self localActivePlayerIsPlaying]) {
      return 1;
    }
  }
  return result;
}

- (void)electedPlayerController:(id)a3 electedPlayerDidChange:(id)a4 change:(int64_t)a5 event:(int64_t)a6 reason:(id)a7
{
}

- (void)lockScreenController:(id)a3 lockScreenWidgetActiveDidChange:(BOOL)a4
{
}

- (void)lockScreenController:(id)a3 lockScreenWidgetVisibleDidChange:(BOOL)a4
{
}

- (void)lockScreenController:(id)a3 playerPathDidChange:(id)a4
{
}

- (BOOL)lockScreenPlatterActive
{
  id v2 = [(MRDNowPlayingServer *)self lockScreenController];
  unsigned __int8 v3 = [v2 isLockScreenWidgetActive];

  return v3;
}

- (BOOL)lockScreenRecommendationActive
{
  id v2 = [(MRDNowPlayingServer *)self lockScreenController];
  unsigned __int8 v3 = [v2 isLockScreenRecommendationActive];

  return v3;
}

- (BOOL)hasElectedPlayer
{
  id v2 = [(MRDNowPlayingServer *)self electedPlayerController];
  unsigned __int8 v3 = [v2 electedPlayerPath];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)collectDiagnostic:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000FCD34;
  v7[3] = &unk_1004158D8;
  id v8 = v4;
  pid_t v9 = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, v7);
}

- (void)postClientNowPlayingNotificationNamed:(id)a3 userInfo:(id)a4
{
}

- (void)postClientNowPlayingNotificationNamed:(id)a3 userInfo:(id)a4 predicate:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = +[MRDMediaRemoteServer server];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000FD110;
  v13[3] = &unk_10041CB00;
  id v14 = v7;
  id v15 = v8;
  id v11 = v8;
  id v12 = v7;
  [v10 postClientNotificationNamed:v9 userInfo:v12 predicate:v13];
}

- (void)postActiveOriginDidChange:(id)a3 withPlaybackState:(unsigned int)a4 handler:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v11 = (void (**)(void))a5;
  id v8 = a3;
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  MRAddPlayerPathToUserInfo();

  id v10 = +[NSNumber numberWithUnsignedInt:v5];
  [v9 setObject:v10 forKey:kMRMediaRemotePlaybackStateUserInfoKey];

  if (v11) {
    v11[2]();
  }
  else {
    [(MRDNowPlayingServer *)self postClientNowPlayingNotificationNamed:_MRMediaRemoteActiveOriginDidChangeNotification userInfo:v9];
  }
}

- (void)postOriginDidRegister:(id)a3 handler:(id)a4
{
  id v9 = (void (**)(void))a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)MRPlayerPath) initWithOrigin:v6 client:0 player:0];

  id v8 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:1];
  MRAddPlayerPathToUserInfo();
  if (v9) {
    v9[2]();
  }
  else {
    [(MRDNowPlayingServer *)self postClientNowPlayingNotificationNamed:_MRMediaRemoteOriginDidRegisterNotification userInfo:v8];
  }
}

- (void)postOriginDidUnRegister:(id)a3 deviceInfo:(id)a4 handler:(id)a5
{
  id v12 = (void (**)(void))a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)MRPlayerPath);
  [v10 setOrigin:v9];

  id v11 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
  MRAddPlayerPathToUserInfo();
  MRAddDeviceInfoToUserInfo();

  if (v12) {
    v12[2]();
  }
  else {
    [(MRDNowPlayingServer *)self postClientNowPlayingNotificationNamed:_MRMediaRemoteOriginDidUnregisterNotification userInfo:v11];
  }
}

- (void)postDeviceInfoDidChange:(id)a3 previousDeviceInfo:(id)a4 forOrigin:(id)a5 handler:(id)a6
{
  id v16 = (void (**)(void))a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [objc_alloc((Class)MRPlayerPath) initWithOrigin:v9 client:0 player:0];

  id v13 = objc_alloc_init((Class)NSMutableDictionary);
  MRAddPlayerPathToUserInfo();
  MRAddDeviceInfoToUserInfo();

  [v13 setObject:v10 forKeyedSubscript:kMRPreviousPairedDeviceUserInfoKey];
  uint64_t v14 = _MRDeviceInfoDidChangeNotification;
  if (v16)
  {
    v16[2]();
  }
  else
  {
    id v15 = +[MRDMediaRemoteServer server];
    [v15 postClientNotificationNamed:v14 userInfo:v13 predicate:&stru_10041CB20];
  }
}

- (void)postVolumeDidChange:(id)a3 volume:(float)a4 handler:(id)a5
{
  id v13 = (void (**)(void))a5;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  MRAddPlayerPathToUserInfo();

  *(float *)&double v9 = a4;
  id v10 = +[NSNumber numberWithFloat:v9];
  [v8 setObject:v10 forKeyedSubscript:kMRMediaRemotePickedRouteVolumeUserInfoKey];

  uint64_t v11 = _MRMediaRemotePickedRouteVolumeDidChangeNotification;
  if (v13)
  {
    v13[2]();
  }
  else
  {
    id v12 = +[MRDMediaRemoteServer server];
    [v12 postClientNotificationNamed:v11 userInfo:v8];
  }
}

- (void)postVolumeCapabilitiesDidChange:(id)a3 capabilities:(unsigned int)a4 handler:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v13 = (void (**)(void))a5;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  MRAddPlayerPathToUserInfo();

  double v9 = +[NSNumber numberWithInt:v5 != 0];
  [v8 setObject:v9 forKeyedSubscript:kMRMediaRemotePickedRouteVolumeControlAvailabilityUserInfoKey];

  id v10 = +[NSNumber numberWithUnsignedInt:v5];
  [v8 setObject:v10 forKeyedSubscript:kMRMediaRemotePickedRouteVolumeControlCapabilitiesUserInfoKey];

  uint64_t v11 = _MRMediaRemotePickedRouteVolumeControlAvailabilityDidChangeNotification;
  if (v13)
  {
    v13[2]();
  }
  else
  {
    id v12 = +[MRDMediaRemoteServer server];
    [v12 postClientNotificationNamed:v11 userInfo:v8];
  }
}

- (void)postIsMutedDidChange:(id)a3 isMuted:(BOOL)a4 handler:(id)a5
{
  BOOL v5 = a4;
  id v12 = (void (**)(void))a5;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  MRAddPlayerPathToUserInfo();

  double v9 = +[NSNumber numberWithBool:v5];
  [v8 setObject:v9 forKeyedSubscript:_MRMediaRemotePickedRouteIsMutedUserInfoKey];

  uint64_t v10 = MRMediaRemotePickedRouteVolumeMutedDidChangeNotification;
  if (v12)
  {
    v12[2]();
  }
  else
  {
    uint64_t v11 = +[MRDMediaRemoteServer server];
    [v11 postClientNotificationNamed:v10 userInfo:v8];
  }
}

- (void)postNowPlayingApplicationDidChangeForPlayerPath:(id)a3 withPlaybackState:(unsigned int)a4 handler:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v14 = a3;
  id v8 = (void (**)(id, void, id))a5;
  double v9 = [v14 origin];
  if ([v9 isLocal]) {
    id v10 = [v14 isHomepodDemoApplication];
  }
  else {
    id v10 = 0;
  }
  uint64_t v11 = +[MRUserSettings currentSettings];
  [v11 setHomepodDemoMode:v10];

  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  MRAddPlayerPathToUserInfo();
  id v13 = +[NSNumber numberWithUnsignedInt:v6];
  [v12 setObject:v13 forKey:kMRMediaRemotePlaybackStateUserInfoKey];

  if (v8) {
    v8[2](v8, _MRMediaRemoteOriginNowPlayingApplicationDidChangeNotification, v12);
  }
  else {
    [(MRDNowPlayingServer *)self postClientNowPlayingNotificationNamed:_MRMediaRemoteOriginNowPlayingApplicationDidChangeNotification userInfo:v12];
  }
}

- (void)postClientDidRegisterCanBeNowPlayingForPlayerPath:(id)a3 handler:(id)a4
{
  id v8 = (void (**)(void))a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  MRAddPlayerPathToUserInfo();

  if (v8)
  {
    v8[2]();
  }
  else
  {
    [(MRDNowPlayingServer *)self postClientNowPlayingNotificationNamed:kMRMediaRemoteNowPlayingApplicationDidRegisterCanBeNowPlaying userInfo:v7];
    if (MRDeviceSupportsExternalTouchBarUI()) {
      notify_post((const char *)[kMRMediaRemoteNowPlayingExternalTouchBarInvocationNotification UTF8String]);
    }
  }
}

- (void)postClientDidUnregisterCanBeNowPlayingForPlayerPath:(id)a3 handler:(id)a4
{
  id v8 = (void (**)(void))a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  MRAddPlayerPathToUserInfo();

  if (v8) {
    v8[2]();
  }
  else {
    [(MRDNowPlayingServer *)self postClientNowPlayingNotificationNamed:kMRMediaRemoteNowPlayingApplicationDidUnregisterCanBeNowPlaying userInfo:v7];
  }
}

- (void)postPlayerDidRegisterCanBeNowPlayingForPlayerPath:(id)a3 handler:(id)a4
{
  id v8 = (void (**)(void))a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  MRAddPlayerPathToUserInfo();

  if (v8) {
    v8[2]();
  }
  else {
    [(MRDNowPlayingServer *)self postClientNowPlayingNotificationNamed:kMRMediaRemoteNowPlayingPlayerDidRegisterCanBeNowPlaying userInfo:v7];
  }
}

- (void)postPlayerDidUnregisterCanBeNowPlayingForPlayerPath:(id)a3 handler:(id)a4
{
  id v8 = (void (**)(void))a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  MRAddPlayerPathToUserInfo();

  if (v8) {
    v8[2]();
  }
  else {
    [(MRDNowPlayingServer *)self postClientNowPlayingNotificationNamed:kMRMediaRemoteNowPlayingPlayerDidUnregisterCanBeNowPlaying userInfo:v7];
  }
}

- (void)postClientDidRegisterForPlayerPath:(id)a3 handler:(id)a4
{
  id v8 = (void (**)(void))a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  MRAddPlayerPathToUserInfo();

  if (v8) {
    v8[2]();
  }
  else {
    [(MRDNowPlayingServer *)self postClientNowPlayingNotificationNamed:_MRMediaRemoteNowPlayingApplicationDidRegister userInfo:v7];
  }
}

- (void)postClientDidUnregisterForPlayerPath:(id)a3 hasDefaultSupportedCommands:(BOOL)a4 canBeNowPlaying:(BOOL)a5 handler:(id)a6
{
  BOOL v8 = a4;
  id v14 = a3;
  id v10 = (void (**)(id, void, id))a6;
  if (a5
    || ([v14 origin],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v12 = [v11 isLocallyHosted],
        v11,
        (v12 & 1) == 0))
  {
    [(MRDNowPlayingServer *)self postClientDidUnregisterCanBeNowPlayingForPlayerPath:v14 handler:v10];
  }
  id v13 = objc_alloc_init((Class)NSMutableDictionary);
  MRAddPlayerPathToUserInfo();
  if (v8) {
    [v13 setObject:&__kCFBooleanTrue forKeyedSubscript:_MRMediaRemoteApplicationHasDefaultSupportedCommandsUserInfoKey];
  }
  if (v10) {
    v10[2](v10, _MRMediaRemoteNowPlayingApplicationDidUnregister, v13);
  }
  else {
    [(MRDNowPlayingServer *)self postClientNowPlayingNotificationNamed:_MRMediaRemoteNowPlayingApplicationDidUnregister userInfo:v13];
  }
}

- (void)postNowPlayingClientStateDidChange:(id)a3 forPlayerPath:(id)a4 handler:(id)a5
{
  double v9 = (void (**)(void))a5;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  MRAddPlayerPathToUserInfo();

  if (v9) {
    v9[2]();
  }
  else {
    [(MRDNowPlayingServer *)self postClientNowPlayingNotificationNamed:_MRMediaRemoteApplicationClientStateDidChange userInfo:v8];
  }
}

- (void)postActivePlayerDidChangeForPlayerPath:(id)a3 withPlaybackState:(unsigned int)a4 handler:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v11 = (void (**)(void))a5;
  id v8 = a3;
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  MRAddPlayerPathToUserInfo();

  id v10 = +[NSNumber numberWithUnsignedInt:v5];
  [v9 setObject:v10 forKey:kMRMediaRemotePlaybackStateUserInfoKey];

  if (v11) {
    v11[2]();
  }
  else {
    [(MRDNowPlayingServer *)self postClientNowPlayingNotificationNamed:_MRMediaRemoteActivePlayerDidChange userInfo:v9];
  }
}

- (void)postIsPlayingDidChange:(BOOL)a3 lastPlayingTimestamp:(double)a4 forPlayerPath:(id)a5 handler:(id)a6
{
  BOOL v8 = a3;
  id v14 = (void (**)(void))a6;
  id v10 = a5;
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  MRAddPlayerPathToUserInfo();

  unsigned __int8 v12 = +[NSNumber numberWithInt:v8];
  [v11 setObject:v12 forKey:kMRMediaRemoteNowPlayingApplicationIsPlayingUserInfoKey];

  id v13 = +[NSNumber numberWithDouble:a4];
  [v11 setObject:v13 forKey:_MRMediaRemoteOriginLastPlayingTimestampUserInfoKey];

  if (v14) {
    v14[2]();
  }
  else {
    [(MRDNowPlayingServer *)self postClientNowPlayingNotificationNamed:_MRMediaRemotePlayerIsPlayingDidChangeNotification userInfo:v11];
  }
}

- (void)postPictureInPictureDidChange:(BOOL)a3 forPlayerPath:(id)a4 handler:(id)a5
{
  BOOL v6 = a3;
  id v11 = (void (**)(void))a5;
  id v8 = a4;
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  MRAddPlayerPathToUserInfo();

  id v10 = +[NSNumber numberWithBool:v6];
  [v9 setObject:v10 forKey:kMRMediaRemotePlayerPictureInPictureEnabledUserInfoKey];

  if (v11) {
    v11[2]();
  }
  else {
    [(MRDNowPlayingServer *)self postClientNowPlayingNotificationNamed:kMRMediaRemotePlayerPictureInPictureDidChange userInfo:v9];
  }
}

- (void)postActivePlayerPathsDidChangeForOrigin:(id)a3 handler:(id)a4
{
  id v9 = a3;
  BOOL v6 = (void (**)(id, void, id))a4;
  if ([v9 isLocal])
  {
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    id v8 = [objc_alloc((Class)MRPlayerPath) initWithOrigin:v9 client:0 player:0];
    MRAddPlayerPathToUserInfo();
    if (v6) {
      v6[2](v6, kMRMediaRemoteActivePlayerPathsDidChange, v7);
    }
    else {
      [(MRDNowPlayingServer *)self postClientNowPlayingNotificationNamed:kMRMediaRemoteActivePlayerPathsDidChange userInfo:v7];
    }
  }
}

- (void)postAudioFormatContentInfoDidChangeForOrigin:(id)a3 handler:(id)a4
{
  id v9 = a3;
  BOOL v6 = (void (**)(id, void, id))a4;
  if ([v9 isLocal])
  {
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    id v8 = [objc_alloc((Class)MRPlayerPath) initWithOrigin:v9 client:0 player:0];
    MRAddPlayerPathToUserInfo();
    if (v6) {
      v6[2](v6, kMRMediaRemoteAudioFormatContentInfoDidChange, v7);
    }
    else {
      [(MRDNowPlayingServer *)self postClientNowPlayingNotificationNamed:kMRMediaRemoteAudioFormatContentInfoDidChange userInfo:v7];
    }
  }
}

- (void)postPlaybackStateDidChange:(unsigned int)a3 forPlayerPath:(id)a4 handler:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v11 = (void (**)(void))a5;
  id v8 = a4;
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  MRAddPlayerPathToUserInfo();

  id v10 = +[NSNumber numberWithUnsignedInt:v6];
  [v9 setObject:v10 forKey:kMRMediaRemotePlaybackStateUserInfoKey];

  if (v11)
  {
    v11[2]();
  }
  else
  {
    [(MRDNowPlayingServer *)self postClientNowPlayingNotificationNamed:_MRMediaRemotePlayerPlaybackStateDidChangeNotification userInfo:v9];
    if (MRDeviceSupportsExternalTouchBarUI()) {
      notify_post((const char *)[kMRMediaRemoteNowPlayingExternalTouchBarInvocationNotification UTF8String]);
    }
  }
}

- (void)postNowPlayingPlayerStateDidChange:(id)a3 forPlayerPath:(id)a4 handler:(id)a5
{
  id v9 = (void (**)(void))a5;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  MRAddPlayerPathToUserInfo();

  if (v9) {
    v9[2]();
  }
  else {
    [(MRDNowPlayingServer *)self postClientNowPlayingNotificationNamed:_MRMediaRemotePlayerStateDidChange userInfo:v8];
  }
}

- (void)postSupportedCommandsDidChange:(id)a3 forPlayerPath:(id)a4 handler:(id)a5
{
  id v8 = (void (**)(id, void, id))a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  MRAddPlayerPathToUserInfo();

  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  [v12 setObject:v10 forKeyedSubscript:kMRSupportedCommandsDataUserInfoKey];

  uint64_t v13 = _MRMediaRemotePlayerSupportedCommandsDidChangeNotification;
  if (v8)
  {
    v8[2](v8, _MRMediaRemotePlayerSupportedCommandsDidChangeNotification, v11);
  }
  else
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000FE7B0;
    v14[3] = &unk_100416020;
    id v15 = v12;
    [(MRDNowPlayingServer *)self postClientNowPlayingNotificationNamed:v13 userInfo:v11 predicate:v14];
  }
}

- (void)postPlaybackQueueDidChange:(id)a3 nowPlayingItemDidChange:(BOOL)a4 forPlayerPath:(id)a5 handler:(id)a6
{
  BOOL v8 = a4;
  unsigned int v29 = self;
  id v9 = a3;
  id v10 = a5;
  id v11 = (void (**)(id, void, id))a6;
  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  MRAddPlayerPathToUserInfo();
  id v13 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:1];
  id v30 = v10;
  MRAddPlayerPathToUserInfo();
  id v14 = [v9 contentItemWithOffset:0];
  if (v14)
  {
    id v15 = +[MRPlaybackQueueRequest defaultPlaybackQueueRequestWithRange:](MRPlaybackQueueRequest, "defaultPlaybackQueueRequestWithRange:", 0, 1);
    id v16 = (void *)MRContentItemCreateFromRequest();
    id v17 = objc_alloc((Class)MRPlaybackQueue);
    v34 = v16;
    uint64_t v18 = +[NSArray arrayWithObjects:&v34 count:1];
    id v19 = v9;
    BOOL v20 = v8;
    id v21 = (void *)v18;
    id v22 = v19;
    id v23 = objc_msgSend(v17, "initWithContentItems:location:withPropertiesFromPlaybackQueue:", v18, 0);

    MRPlaybackQueueToUserInfo();
    if (!v20) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v22 = v9;
  id v28 = [objc_alloc((Class)MRPlaybackQueue) initWithContentItems:&__NSArray0__struct location:0 withPropertiesFromPlaybackQueue:v9];
  MRPlaybackQueueToUserInfo();

  id v16 = 0;
  if (v8)
  {
LABEL_3:
    id v24 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1, v29);
    [v12 setObject:v24 forKeyedSubscript:_MRPlayerPlaybackQueueNowPlayingItemDidChangeUserInfoKey];
  }
LABEL_4:
  uint64_t v25 = _MRNowPlayingPlaybackQueueChangedNotification;
  id v26 = v22;
  if (v11)
  {
    v11[2](v11, _MRNowPlayingPlaybackQueueChangedNotification, v12);
    id v27 = v30;
  }
  else
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000FEAD4;
    v31[3] = &unk_10041CB48;
    id v32 = v16;
    id v27 = v30;
    id v33 = v30;
    [(MRDNowPlayingServer *)v29 postClientNowPlayingNotificationNamed:v25 userInfo:v13 predicate:v31];
    [(MRDNowPlayingServer *)v29 postClientNowPlayingNotificationNamed:v25 userInfo:v12 predicate:&stru_10041CB68];
  }
}

- (void)postPlaybackQueueContentItemsDidChange:(id)a3 forPlayerPath:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, id))a5;
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  MRAddPlayerPathToUserInfo();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v8;
  id v13 = (char *)[v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      id v16 = 0;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        if (MRContentItemGetArtworkData()) {
          MRContentItemSetArtworkData();
        }
        ++v16;
      }
      while (v14 != v16);
      id v14 = (char *)[v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }

  uint64_t v17 = _MRPlayerPlaybackQueueContentItemsChangedNotification;
  if (v10)
  {
    v10[2](v10, _MRPlayerPlaybackQueueContentItemsChangedNotification, v11);
  }
  else
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000FEE20;
    v18[3] = &unk_10041CB48;
    id v19 = v9;
    id v20 = v12;
    [(MRDNowPlayingServer *)self postClientNowPlayingNotificationNamed:v17 userInfo:v11 predicate:v18];
  }
}

- (void)postPlaybackQueueContentItemsArtworkDidChange:(id)a3 forPlayerPath:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, id))a5;
  if (v8 && [v8 count])
  {
    id v11 = objc_alloc_init((Class)NSMutableDictionary);
    MRAddPlayerPathToUserInfo();
    uint64_t v12 = _MRPlayerPlaybackQueueContentItemArtworkChangedNotification;
    if (v10)
    {
      v10[2](v10, _MRPlayerPlaybackQueueContentItemArtworkChangedNotification, v11);
    }
    else
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000FF0E8;
      v13[3] = &unk_10041CB48;
      id v14 = v9;
      id v15 = v8;
      [(MRDNowPlayingServer *)self postClientNowPlayingNotificationNamed:v12 userInfo:v11 predicate:v13];
    }
  }
}

- (void)postPlaybackQueueCapabilitiesDidChange:(unint64_t)a3 forPlayerPath:(id)a4 handler:(id)a5
{
  id v11 = (void (**)(void))a5;
  id v8 = a4;
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  MRAddPlayerPathToUserInfo();

  id v10 = +[NSNumber numberWithUnsignedLong:a3];
  [v9 setObject:v10 forKeyedSubscript:kMRPlaybackQueueCapabilitiesUserInfoKey];

  if (v11) {
    v11[2]();
  }
  else {
    [(MRDNowPlayingServer *)self postClientNowPlayingNotificationNamed:kMRPlaybackQueueCapabilitiesChangedNotification userInfo:v9];
  }
}

- (void)postPlaybackQueueParticipantsDidChange:(id)a3 forPlayerPath:(id)a4 handler:(id)a5
{
  id v11 = a4;
  id v7 = (void (**)(id, void, id))a5;
  id v8 = [v11 client];
  unsigned int v9 = [v8 isSystemMediaApplication];

  if (v9)
  {
    id v10 = objc_alloc_init((Class)NSMutableDictionary);
    MRAddPlayerPathToUserInfo();
    if (v7) {
      v7[2](v7, MRPlaybackQueueParticipantsDidChangeForPlayerNotification, v10);
    }
    else {
      [(MRDNowPlayingServer *)self postClientNowPlayingNotificationNamed:MRPlaybackQueueParticipantsDidChangeForPlayerNotification userInfo:v10];
    }
  }
}

- (void)postPlayerDidRegisterForPlayerPath:(id)a3 handler:(id)a4
{
  id v8 = (void (**)(void))a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  MRAddPlayerPathToUserInfo();

  if (v8) {
    v8[2]();
  }
  else {
    [(MRDNowPlayingServer *)self postClientNowPlayingNotificationNamed:_MRMediaRemoteNowPlayingPlayerDidRegister userInfo:v7];
  }
}

- (void)postPlayerDidUnregisterWithPlaybackState:(unsigned int)a3 canBeNowPlaying:(BOOL)a4 forPlayerPath:(id)a5 handler:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v15 = a5;
  id v10 = (void (**)(id, void, id))a6;
  if (a4
    || ([v15 origin],
        id v11 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v12 = [v11 isLocal],
        v11,
        (v12 & 1) == 0))
  {
    [(MRDNowPlayingServer *)self postPlayerDidUnregisterCanBeNowPlayingForPlayerPath:v15 handler:v10];
  }
  id v13 = objc_alloc_init((Class)NSMutableDictionary);
  MRAddPlayerPathToUserInfo();
  id v14 = +[NSNumber numberWithUnsignedInt:v8];
  [v13 setObject:v14 forKey:kMRMediaRemotePlaybackStateUserInfoKey];

  if (v10) {
    v10[2](v10, _MRMediaRemoteNowPlayingPlayerDidUnregister, v13);
  }
  else {
    [(MRDNowPlayingServer *)self postClientNowPlayingNotificationNamed:_MRMediaRemoteNowPlayingPlayerDidUnregister userInfo:v13];
  }
}

- (void)postElectedPlayerDidChange:(id)a3 change:(int64_t)a4 event:(int64_t)a5 reason:(id)a6 handler:(id)a7
{
  id v18 = a6;
  id v11 = (void (**)(id, void, id))a7;
  id v12 = a3;
  id v13 = objc_alloc_init((Class)NSMutableDictionary);
  MRAddPlayerPathToUserInfo();

  if (v18) {
    [v13 setObject:v18 forKeyedSubscript:kMRMediaRemoteElectedPlayerReasonUserInfoKey];
  }
  id v14 = +[NSNumber numberWithInteger:a4];
  [v13 setObject:v14 forKeyedSubscript:kMRMediaRemoteActiveEndpointChangeTypeUserInfoKey];

  id v15 = +[NSNumber numberWithInteger:a5];
  [v13 setObject:v15 forKeyedSubscript:@"MRDElectedPlayerControllerEventUserInfoKey"];

  uint64_t v16 = kMRMediaRemoteElectedPlayerDidChangeNotification;
  if (v11)
  {
    v11[2](v11, kMRMediaRemoteElectedPlayerDidChangeNotification, v13);
  }
  else
  {
    uint64_t v17 = +[MRDMediaRemoteServer server];
    [v17 postClientNotificationNamed:v16 userInfo:v13 predicate:&stru_10041CB88];

    notify_post("com.apple.mediaremote.electedPlayerDidChange");
  }
}

- (void)postLockScreenVisibleDidChange:(BOOL)a3 handler:(id)a4
{
  id v4 = (void **)&kMRMediaRemoteLockScreenControlsDidAppearNotification;
  if (!a3) {
    id v4 = (void **)&kMRMediaRemoteLockScreenControlsDidDisappearNotification;
  }
  uint64_t v5 = *v4;
  if (a4)
  {
    id v7 = (void (*)(id))*((void *)a4 + 2);
    id v9 = v5;
    v7(a4);
  }
  else
  {
    id v8 = v5;
    id v9 = +[MRDMediaRemoteServer server];
    [v9 postClientNotificationNamed:v8 predicate:&stru_10041CBA8];
  }
}

- (void)postLockScreenActiveDidChange:(BOOL)a3 handler:(id)a4
{
  id v4 = (void **)&kMRMediaRemoteLockScreenControlsDidActivateNotification;
  if (!a3) {
    id v4 = (void **)&kMRMediaRemoteLockScreenControlsDidDeactivateNotification;
  }
  uint64_t v5 = *v4;
  if (a4)
  {
    id v7 = (void (*)(id))*((void *)a4 + 2);
    id v9 = v5;
    v7(a4);
  }
  else
  {
    id v8 = v5;
    id v9 = +[MRDMediaRemoteServer server];
    [v9 postClientNotificationNamed:v8 predicate:&stru_10041CBC8];
  }
}

- (void)postLockScreenPlayerPathDidChange:(id)a3 handler:(id)a4
{
  id v6 = (void (**)(id, id, id))a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  MRAddPlayerPathToUserInfo();

  id v9 = kMRMediaRemoteLockScreenControlsPlayerPathDidChangeNotification;
  if (v6)
  {
    v6[2](v6, v9, v8);
  }
  else
  {
    id v10 = +[MRDMediaRemoteServer server];
    [v10 postClientNotificationNamed:v9 userInfo:v8 predicate:&stru_10041CBE8];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FFB84;
  block[3] = &unk_100415CC8;
  block[4] = self;
  if (qword_10047E178 != -1) {
    dispatch_once(&qword_10047E178, block);
  }
  [(MRDNowPlayingServer *)self postLockScreenControlsDidChangeDistributedNotification];
}

- (void)postLockScreenControlsDidChangeDistributedNotification
{
  id v2 = _MRLogForCategory();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  id v4 = (void *)MRMediaRemoteLockScreenControlsDidChangeDistributedNotification;
  if (v3)
  {
    int v5 = 138412290;
    uint64_t v6 = MRMediaRemoteLockScreenControlsDidChangeDistributedNotification;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Posting %@", (uint8_t *)&v5, 0xCu);
  }

  notify_post((const char *)[v4 UTF8String]);
}

- (void)maybePostDistributedNotifications
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FFF38;
  block[3] = &unk_100415CC8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)augmentedUserInfoForPlayerPath:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v6 = [(MRDNowPlayingServer *)self activePlayerPath];
  if (v6) {
    [v5 setObject:v6 forKey:kMRActiveNowPlayingPlayerPathUserInfoKey];
  }
  if (v4)
  {
    id v7 = [(MRDNowPlayingServer *)self queryExistingPlayerPath:v4];
    id v8 = [v7 originClient];
    id v9 = [v8 activeNowPlayingClient];
    id v10 = [v9 activePlayerClient];
    id v11 = [v10 playerPath];

    if (v11) {
      goto LABEL_7;
    }
    id v12 = [v7 originClient];
    id v13 = [v12 activeNowPlayingClient];
    id v11 = [v13 playerPath];

    if (v11
      || ([v7 originClient],
          id v14 = objc_claimAutoreleasedReturnValue(),
          [v14 playerPath],
          id v11 = objc_claimAutoreleasedReturnValue(),
          v14,
          v11))
    {
LABEL_7:
      [v5 setValue:v11 forKey:kMROriginActiveNowPlayingPlayerPathUserInfoKey];
    }
  }

  return v5;
}

- (void)registerOriginForwarder:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100100770;
  v7[3] = &unk_1004158D8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, v7);
}

- (void)unregisterOriginForwarder:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100100870;
  v7[3] = &unk_1004158D8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, v7);
}

- (BOOL)_hasForwarderForOrigin:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_originForwarders;
  id v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "destinationOrigin", (void)v12);
        unsigned __int8 v10 = [v9 isEqual:v4];

        if (v10)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      id v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (void)_addOrigin:(id)a3 withDeviceInfo:(id)a4 emitNotification:(BOOL)a5
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[MRNowPlayingOriginClientManager sharedManager];
  id v9 = [v7 routingContextID];
  unsigned __int8 v10 = [v8 createCustomOriginClientForOrigin:v6 routingContextID:v9];

  id v11 = +[MRNowPlayingOriginClientManager sharedManager];
  long long v12 = [v6 playerPath];
  long long v13 = [v11 originClientRequestsForPlayerPath:v12];

  [v13 setDeviceInfo:v7];
  uint64_t v16 = v6;
  id v14 = v7;
  id v15 = v6;
  msv_dispatch_sync_on_queue();
}

- (void)_removeOrigin:(id)a3
{
  id v6 = a3;
  id v3 = v6;
  msv_dispatch_sync_on_queue();
  id v4 = +[MRNowPlayingOriginClientManager sharedManager];
  [v4 removeOrigin:v3];
}

- (void)_removeNowPlayingClient:(id)a3 forOrigin:(id)a4
{
  id v6 = a3;
  id v7 = [(MRDNowPlayingServer *)self originClientForOrigin:a4];
  [v7 removeNowPlayingClientForClient:v6];
}

- (void)setOverrideClient:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDNowPlayingServer *)self localOriginClient];
  [v5 setOverrideClient:v4];
}

- (id)overrideClient
{
  id v2 = [(MRDNowPlayingServer *)self localOriginClient];
  id v3 = [v2 overrideClient];

  return v3;
}

- (void)setActiveOrigin:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

- (void)_onQueue_setActiveOrigin:(id)a3 saveState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v7 = [(MRDNowPlayingServer *)self _onQueue_originClientForOrigin:v6];
  id v8 = self->_activeOriginClient;
  if (v7 != v8)
  {
    id v9 = _MRLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v10 = [(MRDNowPlayingOriginClient *)v8 origin];
      id v11 = [(MRDNowPlayingOriginClient *)v7 origin];
      int v12 = 138412546;
      long long v13 = v10;
      __int16 v14 = 2112;
      id v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Setting active origin from %@ to %@", (uint8_t *)&v12, 0x16u);
    }
    [(MRDNowPlayingServer *)self setActiveOriginClient:v7];
    [(MRDNowPlayingServer *)self nowPlayingServer:self activeOriginDidChangeFromOriginClient:self->_activeOriginClient toOriginClient:v7];
  }
  if (v4) {
    [(MRDNowPlayingServer *)self _onQueue_savePersistentActiveOrigin:v6];
  }
}

- (void)_onQueue_savePersistentActiveOrigin:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Persisting active origin %@", (uint8_t *)&v9, 0xCu);
  }

  id v6 = +[NSUserDefaults standardUserDefaults];
  id v7 = v6;
  if (v4)
  {
    id v8 = [v4 data];
    [v7 setObject:v8 forKey:@"_MRDActiveOriginDataDefaultsKey"];
  }
  else
  {
    [v6 removeObjectForKey:@"_MRDActiveOriginDataDefaultsKey"];
  }
}

- (id)_onQueue_restoredActiveOrigin
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 objectForKey:@"_MRDActiveOriginDataDefaultsKey"];
  if (v3) {
    id v4 = [objc_alloc((Class)MROrigin) initWithData:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)_onQueue_originClientForDeviceUID:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (v4)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v5 = self->_originClients;
    id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v6)
    {
      id v7 = v6;
      id v8 = 0;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v5);
          }
          id v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          int v12 = objc_msgSend(v11, "deviceInfo", (void)v20);
          long long v13 = [v12 deviceUID];
          unsigned int v14 = [v13 isEqualToString:v4];

          if (v14)
          {
            if (!v8
              || ([(MRDNowPlayingOriginClient *)v8 registrationDate],
                  id v15 = objc_claimAutoreleasedReturnValue(),
                  [v11 registrationDate],
                  uint64_t v16 = objc_claimAutoreleasedReturnValue(),
                  id v17 = [v15 compare:v16],
                  v16,
                  v15,
                  v17 == (id)1))
            {
              id v18 = v11;

              id v8 = v18;
            }
          }
        }
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v7);
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = self->_localOriginClient;
  }

  return v8;
}

- (id)_onQueue_originClientForGroupLeaderOfDeviceUID:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (!v4)
  {
    id v18 = self->_localOriginClient;
LABEL_23:
    id v6 = v18;
    goto LABEL_24;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = self->_originClients;
  id v23 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (!v23)
  {

LABEL_22:
    id v18 = [(MRDNowPlayingServer *)self _onQueue_originClientForDeviceUID:v4];
    goto LABEL_23;
  }
  long long v20 = self;
  id obj = v5;
  id v6 = 0;
  uint64_t v22 = *(void *)v29;
  do
  {
    for (i = 0; i != v23; i = (char *)i + 1)
    {
      if (*(void *)v29 != v22) {
        objc_enumerationMutation(obj);
      }
      id v8 = *(void **)(*((void *)&v28 + 1) + 8 * i);
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      uint64_t v9 = objc_msgSend(v8, "deviceInfo", v20);
      id v10 = [v9 groupedDevices];

      id v11 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v25;
        do
        {
          for (j = 0; j != v12; j = (char *)j + 1)
          {
            if (*(void *)v25 != v13) {
              objc_enumerationMutation(v10);
            }
            id v15 = [*(id *)(*((void *)&v24 + 1) + 8 * (void)j) deviceUID];
            unsigned int v16 = [v15 isEqualToString:v4];

            if (v16)
            {
              id v17 = v8;

              id v6 = v17;
            }
          }
          id v12 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
        }
        while (v12);
      }
    }
    id v23 = [(NSMutableArray *)obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  }
  while (v23);

  self = v20;
  if (!v6) {
    goto LABEL_22;
  }
LABEL_24:

  return v6;
}

- (void)setActiveOriginClient:(id)a3
{
}

- (void)setLocalOriginClient:(id)a3
{
}

- (MRDElectedPlayerController)electedPlayerController
{
  return self->_electedPlayerController;
}

- (MRDLockScreenController)lockScreenController
{
  return self->_lockScreenController;
}

- (MRDLockScreenRoutingControllerProtocol)lockScreenRoutingController
{
  return self->_lockScreenRoutingController;
}

- (MRDNowPlayingLauncher)nowPlayingCapLauncher
{
  return self->_nowPlayingCapLauncher;
}

- (void)setNowPlayingCapLauncher:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nowPlayingCapLauncher, 0);
  objc_storeStrong((id *)&self->_lockScreenRoutingController, 0);
  objc_storeStrong((id *)&self->_lockScreenController, 0);
  objc_storeStrong((id *)&self->_electedPlayerController, 0);
  objc_storeStrong((id *)&self->_localOriginClient, 0);
  objc_storeStrong((id *)&self->_activeOriginClient, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfoObserverQueue, 0);
  objc_storeStrong(&self->_nowPlayingInfoObserverHandle, 0);
  objc_storeStrong((id *)&self->_wakeDeviceTimer, 0);
  objc_storeStrong((id *)&self->_deviceInfoDataSource, 0);
  objc_storeStrong((id *)&self->_originForwarders, 0);
  objc_storeStrong((id *)&self->_playbackQueueServer, 0);
  objc_storeStrong((id *)&self->_nowPlayingApplicationIsPlayingStates, 0);
  objc_storeStrong((id *)&self->_originClients, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end