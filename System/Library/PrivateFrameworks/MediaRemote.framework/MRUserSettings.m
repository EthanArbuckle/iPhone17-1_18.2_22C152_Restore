@interface MRUserSettings
+ (NSString)groupSessionBoopAdvertisementEnabledDidChangeNotification;
+ (id)currentSettings;
- (BOOL)addDebugBadgeToRecommendedRoutes;
- (BOOL)allowAllClientUIConnections;
- (BOOL)alwaysShowGroupSessionHUD;
- (BOOL)alwaysShowVolumeControls;
- (BOOL)calculateDiscoveryUpdates;
- (BOOL)canHostMultiplayerStream;
- (BOOL)computeDevicePlaybackSessionID;
- (BOOL)connectToAllEndpointsWhenAnyEndpointBeginsPlayback;
- (BOOL)connectToAllEndpointsWhenInProximityToAnyDevice;
- (BOOL)connectToEndpointWhenBeginsPlayback;
- (BOOL)connectToUserSelectedEndpoint;
- (BOOL)disablePairedDeviceActiveEndpointSync;
- (BOOL)discoverCompanionDevices;
- (BOOL)donateActiveRoutesToBiome;
- (BOOL)enableDeltaRouteRecommendations;
- (BOOL)enableQueueHandOffForRouteRecommendations;
- (BOOL)enableRouteRecommendations;
- (BOOL)excessiveNowPlayingControllersABC;
- (BOOL)excessiveTaskAssertionsABC;
- (BOOL)forceDeviceInfoDiscovery;
- (BOOL)forceEnableCECVolume;
- (BOOL)forceFadeForEveryHandoff;
- (BOOL)forceNowPlayingSessionFailure;
- (BOOL)groupSessionASEAssertionEnabled;
- (BOOL)groupSessionAutoApproveHomeParticipants;
- (BOOL)groupSessionBoopAdvertisementEnabled;
- (BOOL)groupSessionContactAutoApprovalEnabled;
- (BOOL)groupSessionGenerateSharedSecret;
- (BOOL)groupSessionHUD;
- (BOOL)groupSessionListenForProxyJoinRequests;
- (BOOL)groupSessionNearbyBanner;
- (BOOL)groupSessionNearbyContactDiscoveryEnabled;
- (BOOL)groupSessionNearbyLockscreen;
- (BOOL)groupSessionRotateAfterLastGuest;
- (BOOL)groupSessionSynchronizePendingParticipants;
- (BOOL)hasExternalDeviceSocketQOSLevelSet;
- (BOOL)homepodDemoMode;
- (BOOL)inconsistentPlaybackQueueCacheABC;
- (BOOL)internalUI;
- (BOOL)isExternalDevicePairingAllowed;
- (BOOL)isMultiplayerAware;
- (BOOL)needsMXApplications;
- (BOOL)notifyDevicesInHomeThatPlaybackStarted;
- (BOOL)nowPlayingAppStackShouldAutomaticallyForwardFailedPlayCommands;
- (BOOL)placeholderGroupSessionIdentity;
- (BOOL)preferRoutesMatchingMediaType;
- (BOOL)prefersExpandedLockScreenPlatter;
- (BOOL)prewarmPodcasts;
- (BOOL)remoteDeviceIdleDisconnection;
- (BOOL)removeLocalDevice;
- (BOOL)removeLocalDeviceOnMultiplayerReceiverSession;
- (BOOL)reserveSlotForLocal;
- (BOOL)sendLastPlayingDeviceToHome;
- (BOOL)sendProactivePFSQAfterBoot;
- (BOOL)sendProactivePFSQOnProactiveASEChange;
- (BOOL)sendProactivePFSQOnSiriActivation;
- (BOOL)sendProactivePFSQOnUserSelectedASEChange;
- (BOOL)shouldConnectToLocalEndpoint;
- (BOOL)shouldInitializeGenericBonjourService;
- (BOOL)shouldInitializeRapportService;
- (BOOL)shouldInitializeTelevisionBonjourService;
- (BOOL)shouldLogArtwork;
- (BOOL)shouldLogPairingSetupCode;
- (BOOL)showBluePill;
- (BOOL)showRouteRecommendationsOutsideApps;
- (BOOL)showUncommitedDevices;
- (BOOL)sonicMusicEnabled;
- (BOOL)sonicPodcastsEnabled;
- (BOOL)sourceRecommendationsPlattersFromIR;
- (BOOL)startGroupSessionWithBasicIdentity;
- (BOOL)startGroupSessionsForAllRouteSubtypes;
- (BOOL)startGroupSessionsForAllRoutes;
- (BOOL)startNowPlayingSessionABC;
- (BOOL)supportAirplayStereoPairPersistentConnections;
- (BOOL)supportCoordinatedVolume;
- (BOOL)supportCriticalSectionManagement;
- (BOOL)supportElectedPlayer;
- (BOOL)supportExpanseMigration;
- (BOOL)supportGenericAudioGroup;
- (BOOL)supportGroupSessionActiveEndpoint;
- (BOOL)supportGroupSessionAttribution;
- (BOOL)supportGroupSessionAutoApproval;
- (BOOL)supportGroupSessionLowPowerMode;
- (BOOL)supportGroupSessionOfframp;
- (BOOL)supportGroupSessionParticipantNotifications;
- (BOOL)supportIDSDiscovery;
- (BOOL)supportLargeHomeAudioOptimization;
- (BOOL)supportLastPlayingDevice;
- (BOOL)supportLiveActivityBanner;
- (BOOL)supportLockscreenPlatterDisplayForPersonalDevice;
- (BOOL)supportMRRelay;
- (BOOL)supportManyRecommendationsPlatters;
- (BOOL)supportMigration;
- (BOOL)supportMultiplayerHost;
- (BOOL)supportNanoLinkAgent;
- (BOOL)supportNewMigrationArchitecture;
- (BOOL)supportNewMigrationBehaviorForProximity;
- (BOOL)supportOutOfProcessMigration;
- (BOOL)supportOutputContextPrewarming;
- (BOOL)supportOutputContextSync;
- (BOOL)supportPTOTRefactorPart1;
- (BOOL)supportPTOTRefactorPart2;
- (BOOL)supportProactiveSuggestion;
- (BOOL)supportProximityMigration;
- (BOOL)supportProximityMigrationV2;
- (BOOL)supportRapportRemoteControlConnection;
- (BOOL)supportRapportRemoteControlTransport;
- (BOOL)supportRouteRecommendations;
- (BOOL)supportRoutingContinuity;
- (BOOL)supportSystemEndpoints;
- (BOOL)supportTopologyHealing;
- (BOOL)supportUserSelectedEndpointTimeout;
- (BOOL)supportsNativeThirdPartyApps;
- (BOOL)suppressScreenMirroringErrors;
- (BOOL)takelockScreenAssertion;
- (BOOL)undoUnusedAutoRoutes;
- (BOOL)useAPSyncAPI;
- (BOOL)useClusterDevices;
- (BOOL)useDebugAVRouteWithoutVolumeControl;
- (BOOL)useExternalDeviceSystemPairing;
- (BOOL)useGenericTransportForHostedEndpoints;
- (BOOL)useNoDelayOptionForExternalDeviceSockets;
- (BOOL)usePeerToPeerExternalDeviceConnections;
- (BOOL)useProactivePFSQSender;
- (BOOL)useRSEForProximity;
- (BOOL)useSystemAudioContextForAirPlayTransport;
- (BOOL)verboseConnectionMonitorLogging;
- (BOOL)verboseDiscoveryLogging;
- (BOOL)verboseHostedDiscoverySessionLogging;
- (BOOL)verboseHostedExternalDeviceClientLogging;
- (BOOL)verboseImageLoadingLogging;
- (BOOL)verboseMRDMediaRemoteClientLogging;
- (BOOL)verboseMediaControlLogging;
- (BOOL)verboseNowPlayingControllerLogging;
- (BOOL)verboseNowPlayingStateObserver;
- (BOOL)verboseOriginClientLogging;
- (BOOL)verboseOriginForwarderLogging;
- (BOOL)verboseOutputContextDataSourceLogging;
- (BOOL)verboseOutputContextLogging;
- (BOOL)verboseProtocolMessageLogging;
- (BOOL)verboseRemoteControlDiscoveryLogging;
- (BOOL)visuallyIdentifyProactiveSuggestion;
- (MRUserSettings)init;
- (NSArray)connectedClientAuditTokens;
- (NSArray)destinationResolverReconRetryIntervals;
- (NSArray)expectedClientAuditTokens;
- (NSArray)jsonClientUIDs;
- (NSArray)nearbyDeviceIdentifiers;
- (NSArray)routePickerAirPlayAllowList;
- (NSArray)routePickerAirPlayDenyList;
- (NSArray)routeRecommendationEligibleApps;
- (NSDictionary)personalDeviceState;
- (NSString)groupSessionNearbyContactDiscoveryDidChangeNotification;
- (NSString)lastBootUUID;
- (NSString)nearbyDeviceIdentifiersDidChangeNotification;
- (NSString)recentGroupSessionParticipantsPepper;
- (double)_doubleValueForKey:(double)a3 usingDefaultValue:;
- (double)activeSystemEndpointStartupDelayToAllowAllPreviousClientsTimeToInitializeInterval;
- (double)activeUserTimeoutInterval;
- (double)airPlayOutputContextInitTimeoutDuration;
- (double)autoRouteInactiveTimeout;
- (double)bluetoothDeviceResumeDuration;
- (double)broadcastCommandWaitDuration;
- (double)checkXPCConnectionStatusDefaultResponseTimeout;
- (double)deviceRecentlyUsedInterval;
- (double)discoverEndpointTimeoutInterval;
- (double)electedPlayerInterval;
- (double)endpointRecentlyUserSelectedInterval;
- (double)externalDeviceArtificalConnectionDelay;
- (double)externalDeviceDisconnectSleepDuration;
- (double)externalDeviceDisconnectWaitDuration;
- (double)externalDeviceNowPlayingInfoArtworkCoalesceDuration;
- (double)externalDeviceNowPlayingInfoCoalesceDuration;
- (double)externalDeviceSleepAssertionOnClientConnectDuration;
- (double)externalDeviceTimeoutDuration;
- (double)flipBookUpdateInterval;
- (double)groupSessionAttributionValidityDuration;
- (double)groupSessionEndAfterPauseInterval;
- (double)groupSessionEndpointDiscoveryInterval;
- (double)groupSessionLeaderDiscoveryInterval;
- (double)groupSessionNearbyGroupCreateTimeout;
- (double)groupSessionNearbyGroupJoinTimeout;
- (double)groupSessionNearbyInvitationCreateTimeout;
- (double)groupSessionStartRequestAssertionDuration;
- (double)lastPlayingDeviceThresholdInterval;
- (double)launchApplicationTimeoutInterval;
- (double)lockScreenAPLRatio;
- (double)lockScreenAPLTarget;
- (double)mediaRecentlyPlayedInterval;
- (double)nowPlayingAppStackFailedPlayInterval;
- (double)nowPlayingApplicationTimeout;
- (double)nowPlayingObserverCoalesceInterval;
- (double)nowPlayingUIWakingPlayerEventAssertionDuration;
- (double)oneTapSuggestionInactiveTimeout;
- (double)persistentDiscoveryABCDuration;
- (double)personalDeviceLockScreenTimeout;
- (double)queuedCommandsTimeoutInterval;
- (double)quickControlsInactiveTimeout;
- (double)remoteDeviceIdleDisconnectionInterval;
- (double)sendPlaybackSessionUpdateToCompanionCoalesceInterval;
- (double)transactionWaitDurationOnNetworkSend;
- (double)transactionWaitDurationOnOutOfMemory;
- (double)transactionWaitDurationOnXpcSend;
- (double)undoUnusedAutoRouteTimerDuration;
- (double)wakingPlayerPathAssertionDuration;
- (float)proximitySortingNearbyRadius;
- (id)defaultSupportedCommandsData;
- (id)defaultSupportedCommandsDataForClient:(id)a3;
- (id)localLastPlayingDate;
- (int)nowPlayingControllerVersion;
- (int64_t)externalDeviceSocketQOSLevel;
- (int64_t)maxTransactionMemorySize;
- (int64_t)waveformNonVariableFramerate;
- (uint64_t)_BOOLValueForKey:(uint64_t)a3 usingDefaultValue:;
- (uint64_t)_integerValueForKey:(uint64_t)a3 usingDefaultValue:;
- (unint64_t)checkXPCConnectionStatusDefaultInterval;
- (unint64_t)maxStreamCapacity;
- (unint64_t)maximumNumberOfMediaSuggestions;
- (unsigned)localPlaybackState;
- (void)_loadNearbyDeviceIdentifiers;
- (void)_loadRoutePickerAirPlayAllowList;
- (void)_loadRoutePickerAirPlayDenyList;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setConnectedClientAuditTokens:(id)a3;
- (void)setExpectedClientAuditTokens:(id)a3;
- (void)setExternalDevicePairingAllowed:(BOOL)a3;
- (void)setGroupSessionContactAutoApprovalEnabled:(BOOL)a3;
- (void)setGroupSessionNearbyContactDiscoveryEnabled:(BOOL)a3;
- (void)setHomepodDemoMode:(BOOL)a3;
- (void)setLastBootUUID:(id)a3;
- (void)setLocalLastPlayingDate:(id)a3;
- (void)setLocalPlaybackState:(unsigned int)a3;
- (void)setPersonalDeviceState:(id)a3;
- (void)setPrefersExpandedLockScreenPlatter:(BOOL)a3;
- (void)updateDefaultSupportedCommandsData:(id)a3 forClient:(id)a4;
@end

@implementation MRUserSettings

- (BOOL)supportsNativeThirdPartyApps
{
  return MSVDeviceIsAudioAccessory() ^ 1;
}

+ (id)currentSettings
{
  if (currentSettings___once != -1) {
    dispatch_once(&currentSettings___once, &__block_literal_global_60);
  }
  v2 = (void *)currentSettings___currentSettings;

  return v2;
}

- (BOOL)supportMultiplayerHost
{
  v2 = +[MRSharedSettings currentSettings];
  char v3 = [v2 isMultiplayerHost];

  return v3;
}

- (unint64_t)checkXPCConnectionStatusDefaultInterval
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__MRUserSettings_checkXPCConnectionStatusDefaultInterval__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (checkXPCConnectionStatusDefaultInterval___once != -1) {
    dispatch_once(&checkXPCConnectionStatusDefaultInterval___once, block);
  }
  return checkXPCConnectionStatusDefaultInterval___interval;
}

- (BOOL)canHostMultiplayerStream
{
  v2 = +[MRSharedSettings currentSettings];
  char v3 = [v2 canHostMultiplayerStream];

  return v3;
}

- (BOOL)sonicMusicEnabled
{
  return [(NSUserDefaults *)self->_userDefaults BOOLForKey:@"SonicMusicEnabled"];
}

- (BOOL)sonicPodcastsEnabled
{
  return [(NSUserDefaults *)self->_userDefaults BOOLForKey:@"SonicPodcastsEnabled"];
}

- (BOOL)groupSessionNearbyBanner
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"GroupSessionNearbyBanner", 1);
}

- (void)updateDefaultSupportedCommandsData:(id)a3 forClient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(MRUserSettings *)self defaultSupportedCommandsData];
  id v11 = v8;
  if (v8) {
    id v9 = (id)[v8 mutableCopy];
  }
  else {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  v10 = v9;
  [v9 setObject:v7 forKeyedSubscript:v6];

  [(NSUserDefaults *)self->_userDefaults setObject:v10 forKey:@"DefaultSupportedCommands"];
}

- (id)defaultSupportedCommandsData
{
  return [(NSUserDefaults *)self->_userDefaults objectForKey:@"DefaultSupportedCommands"];
}

- (BOOL)calculateDiscoveryUpdates
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__MRUserSettings_calculateDiscoveryUpdates__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (calculateDiscoveryUpdates_onceToken != -1) {
    dispatch_once(&calculateDiscoveryUpdates_onceToken, block);
  }
  return calculateDiscoveryUpdates_support;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)MRUserSettingsForceEnableCECContext == a6)
  {
    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v14 = v13;
    v15 = @"MRUserSettingsForceEnableCECVolumeDidChange";
LABEL_10:
    [v13 postNotificationName:v15 object:self];

    goto LABEL_11;
  }
  if ((void *)MRUserSettingsGroupSessionNearbyDiscoveryContext == a6)
  {
    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v14 = v13;
    v15 = @"MRGroupSessionNearbyContactDiscoveryDidChangeNotification";
    goto LABEL_10;
  }
  if ((void *)MRUserSettingsRoutePickerAirPlayAllowListContext == a6)
  {
    -[MRUserSettings _loadRoutePickerAirPlayAllowList]((uint64_t)self);
    goto LABEL_11;
  }
  if ((void *)MRUserSettingsRoutePickerAirPlayDenyListContext == a6)
  {
    -[MRUserSettings _loadRoutePickerAirPlayDenyList]((uint64_t)self);
    goto LABEL_11;
  }
  if ((void *)MRUserSettingsNearbyDeviceIdentifiersContext == a6)
  {
    -[MRUserSettings _loadNearbyDeviceIdentifiers]((uint64_t)self);
    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v14 = v13;
    v15 = @"MRUserSettingsNearbyDeviceIdentifiersDidChangeNotification";
    goto LABEL_10;
  }
  if ((void *)MRUserSettingsGroupSessionBoopContext == a6)
  {
    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v14 = v13;
    v15 = @"MRUserSettingsGroupSessionBoopEnabledDidChangeNotification";
    goto LABEL_10;
  }
  v16.receiver = self;
  v16.super_class = (Class)MRUserSettings;
  [(MRUserSettings *)&v16 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
LABEL_11:
}

- (double)sendPlaybackSessionUpdateToCompanionCoalesceInterval
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__MRUserSettings_sendPlaybackSessionUpdateToCompanionCoalesceInterval__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (sendPlaybackSessionUpdateToCompanionCoalesceInterval_onceToken != -1) {
    dispatch_once(&sendPlaybackSessionUpdateToCompanionCoalesceInterval_onceToken, block);
  }
  return *(double *)&sendPlaybackSessionUpdateToCompanionCoalesceInterval___value;
}

- (void)_loadNearbyDeviceIdentifiers
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = [*(id *)(a1 + 8) valueForKey:@"NearbyDeviceIdentifiers"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v4 = v2;
    if ((isKindOfClass & 1) == 0)
    {
      if (v2)
      {
        v7[0] = v2;
        uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
        id v6 = *(void **)(a1 + 32);
        *(void *)(a1 + 32) = v5;

LABEL_7:
        return;
      }
      v4 = 0;
    }
    objc_storeStrong((id *)(a1 + 32), v4);
    goto LABEL_7;
  }
}

- (BOOL)useClusterDevices
{
  return _os_feature_enabled_impl();
}

- (BOOL)supportManyRecommendationsPlatters
{
  return _os_feature_enabled_impl();
}

- (BOOL)showRouteRecommendationsOutsideApps
{
  return _os_feature_enabled_impl();
}

- (BOOL)supportGroupSessionAttribution
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"GroupSessionAttribution", 1);
}

- (double)wakingPlayerPathAssertionDuration
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MRUserSettings_wakingPlayerPathAssertionDuration__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (wakingPlayerPathAssertionDuration___once != -1) {
    dispatch_once(&wakingPlayerPathAssertionDuration___once, block);
  }
  return *(double *)&wakingPlayerPathAssertionDuration___duration;
}

- (double)groupSessionAttributionValidityDuration
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, @"GroupSessionAttributionValidityDuration", 43200.0);
}

- (NSArray)expectedClientAuditTokens
{
  v2 = [(NSUserDefaults *)self->_userDefaults arrayForKey:@"ExpectedClientAuditTokens"];
  char v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (BOOL)verboseConnectionMonitorLogging
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__MRUserSettings_verboseConnectionMonitorLogging__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (verboseConnectionMonitorLogging___once != -1) {
    dispatch_once(&verboseConnectionMonitorLogging___once, block);
  }
  return verboseConnectionMonitorLogging___should;
}

- (BOOL)supportOutputContextSync
{
  BOOL v3 = [(MRUserSettings *)self supportGenericAudioGroup];
  if (self || v3) {
    return 1;
  }

  return [0 donateActiveRoutesToBiome];
}

- (BOOL)supportGenericAudioGroup
{
  return 0;
}

uint64_t __73__MRUserSettings_groupSessionNearbyContactDiscoveryDidChangeNotification__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addObserver:*(void *)(a1 + 32) forKeyPath:@"MRUserSettingsGroupSessionNearbyContactDiscoveryEnabled" options:0 context:MRUserSettingsGroupSessionNearbyDiscoveryContext];
}

- (BOOL)homepodDemoMode
{
  return self->_homepodDemoMode;
}

uint64_t __33__MRUserSettings_currentSettings__block_invoke()
{
  currentSettings___currentSettings = objc_alloc_init(MRUserSettings);

  return MEMORY[0x1F41817F8]();
}

- (MRUserSettings)init
{
  v6.receiver = self;
  v6.super_class = (Class)MRUserSettings;
  v2 = [(MRUserSettings *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.mediaremote"];
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (NSUserDefaults *)v3;
  }
  return v2;
}

uint64_t __43__MRUserSettings_calculateDiscoveryUpdates__block_invoke(uint64_t a1)
{
  uint64_t result = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](*(void *)(a1 + 32), @"CalculateDiscoveryUpdates", 1);
  calculateDiscoveryUpdates_support = result;
  return result;
}

- (BOOL)verboseNowPlayingStateObserver
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__MRUserSettings_verboseNowPlayingStateObserver__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (verboseNowPlayingStateObserver___once != -1) {
    dispatch_once(&verboseNowPlayingStateObserver___once, block);
  }
  return verboseNowPlayingStateObserver___should;
}

- (BOOL)forceEnableCECVolume
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__MRUserSettings_forceEnableCECVolume__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (forceEnableCECVolume_onceToken != -1) {
    dispatch_once(&forceEnableCECVolume_onceToken, block);
  }
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"ForceEnableCECVolume", 0);
}

uint64_t __55__MRUserSettings_verboseOutputContextDataSourceLogging__block_invoke(uint64_t a1)
{
  uint64_t result = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](*(void *)(a1 + 32), @"verboseOutputContextDataSourceLogging", 0);
  verboseOutputContextDataSourceLogging___should = result;
  return result;
}

uint64_t __44__MRUserSettings_verboseOriginClientLogging__block_invoke(uint64_t a1)
{
  uint64_t result = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](*(void *)(a1 + 32), @"verboseOriginClientLogging", 0);
  verboseOriginClientLogging___should = result;
  return result;
}

- (uint64_t)_BOOLValueForKey:(uint64_t)a3 usingDefaultValue:
{
  id v5 = a2;
  if (a1)
  {
    objc_super v6 = [*(id *)(a1 + 8) objectForKey:v5];

    if (v6) {
      a3 = [*(id *)(a1 + 8) BOOLForKey:v5];
    }
  }
  else
  {
    a3 = 0;
  }

  return a3;
}

- (BOOL)supportGroupSessionActiveEndpoint
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"SupportGroupSessionActiveEndpoint", 0);
}

- (double)checkXPCConnectionStatusDefaultResponseTimeout
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__MRUserSettings_checkXPCConnectionStatusDefaultResponseTimeout__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (checkXPCConnectionStatusDefaultResponseTimeout___once != -1) {
    dispatch_once(&checkXPCConnectionStatusDefaultResponseTimeout___once, block);
  }
  return (double)(unint64_t)checkXPCConnectionStatusDefaultResponseTimeout___timeout;
}

- (NSString)groupSessionNearbyContactDiscoveryDidChangeNotification
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__MRUserSettings_groupSessionNearbyContactDiscoveryDidChangeNotification__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (groupSessionNearbyContactDiscoveryDidChangeNotification_onceToken != -1) {
    dispatch_once(&groupSessionNearbyContactDiscoveryDidChangeNotification_onceToken, block);
  }
  return (NSString *)@"MRGroupSessionNearbyContactDiscoveryDidChangeNotification";
}

- (BOOL)verboseOutputContextDataSourceLogging
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__MRUserSettings_verboseOutputContextDataSourceLogging__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (verboseOutputContextDataSourceLogging___once != -1) {
    dispatch_once(&verboseOutputContextDataSourceLogging___once, block);
  }
  return verboseOutputContextDataSourceLogging___should;
}

- (double)persistentDiscoveryABCDuration
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__MRUserSettings_persistentDiscoveryABCDuration__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (persistentDiscoveryABCDuration_onceToken != -1) {
    dispatch_once(&persistentDiscoveryABCDuration_onceToken, block);
  }
  return *(double *)&persistentDiscoveryABCDuration_duration;
}

- (void)setExpectedClientAuditTokens:(id)a3
{
  userDefaults = self->_userDefaults;
  id v5 = a3;
  [(NSUserDefaults *)userDefaults setObject:0 forKey:@"ExpectedClientPIDs"];
  [(NSUserDefaults *)self->_userDefaults setObject:v5 forKey:@"ExpectedClientAuditTokens"];
}

- (void)setConnectedClientAuditTokens:(id)a3
{
  userDefaults = self->_userDefaults;
  id v5 = a3;
  [(NSUserDefaults *)userDefaults setObject:0 forKey:@"ConnectedClientPIDs"];
  [(NSUserDefaults *)self->_userDefaults setObject:v5 forKey:@"ConnectedClientAuditTokens"];
}

- (BOOL)supportMRRelay
{
  return _os_feature_enabled_impl();
}

- (BOOL)verboseOriginClientLogging
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MRUserSettings_verboseOriginClientLogging__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (verboseOriginClientLogging___once != -1) {
    dispatch_once(&verboseOriginClientLogging___once, block);
  }
  return verboseOriginClientLogging___should;
}

void __46__MRUserSettings_quickControlsInactiveTimeout__block_invoke(uint64_t a1)
{
  quickControlsInactiveTimeout___timeout = -[MRUserSettings _doubleValueForKey:usingDefaultValue:](*(void *)(a1 + 32), @"QuickControlsInactiveTimeout", 5.0);
}

- (double)_doubleValueForKey:(double)a3 usingDefaultValue:
{
  id v5 = a2;
  if (a1)
  {
    objc_super v6 = [*(id *)(a1 + 8) objectForKey:v5];

    if (v6)
    {
      [*(id *)(a1 + 8) doubleForKey:v5];
      a3 = v7;
    }
  }
  else
  {
    a3 = 0.0;
  }

  return a3;
}

- (BOOL)shouldConnectToLocalEndpoint
{
  uint64_t IsAudioAccessory = MSVDeviceIsAudioAccessory();

  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"ShouldConnectToLocalEndpoint", IsAudioAccessory);
}

- (BOOL)forceDeviceInfoDiscovery
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__MRUserSettings_forceDeviceInfoDiscovery__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (forceDeviceInfoDiscovery___once != -1) {
    dispatch_once(&forceDeviceInfoDiscovery___once, block);
  }
  return forceDeviceInfoDiscovery___value;
}

- (BOOL)verboseMRDMediaRemoteClientLogging
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"verboseMRDMediaRemoteClientLogging", 0);
}

- (BOOL)verboseMediaControlLogging
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MRUserSettings_verboseMediaControlLogging__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (verboseMediaControlLogging___once != -1) {
    dispatch_once(&verboseMediaControlLogging___once, block);
  }
  return verboseMediaControlLogging___should;
}

- (BOOL)verboseNowPlayingControllerLogging
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__MRUserSettings_verboseNowPlayingControllerLogging__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (verboseNowPlayingControllerLogging___once != -1) {
    dispatch_once(&verboseNowPlayingControllerLogging___once, block);
  }
  return verboseNowPlayingControllerLogging___should;
}

uint64_t __52__MRUserSettings_verboseNowPlayingControllerLogging__block_invoke(uint64_t a1)
{
  uint64_t result = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](*(void *)(a1 + 32), @"verboseNowPlayingControllerLogging", 1);
  verboseNowPlayingControllerLogging___should = result;
  return result;
}

- (void)_loadRoutePickerAirPlayDenyList
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = [*(id *)(a1 + 8) valueForKey:@"routepicker-airplay-denylist"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v4 = v2;
    if ((isKindOfClass & 1) == 0)
    {
      if (v2)
      {
        v7[0] = v2;
        uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
        objc_super v6 = *(void **)(a1 + 24);
        *(void *)(a1 + 24) = v5;

LABEL_7:
        return;
      }
      v4 = 0;
    }
    objc_storeStrong((id *)(a1 + 24), v4);
    goto LABEL_7;
  }
}

- (BOOL)verboseRemoteControlDiscoveryLogging
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__MRUserSettings_verboseRemoteControlDiscoveryLogging__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (verboseRemoteControlDiscoveryLogging___once != -1) {
    dispatch_once(&verboseRemoteControlDiscoveryLogging___once, block);
  }
  return verboseRemoteControlDiscoveryLogging___should;
}

- (BOOL)verboseImageLoadingLogging
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MRUserSettings_verboseImageLoadingLogging__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (verboseImageLoadingLogging___once != -1) {
    dispatch_once(&verboseImageLoadingLogging___once, block);
  }
  return verboseImageLoadingLogging___should;
}

- (BOOL)verboseDiscoveryLogging
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__MRUserSettings_verboseDiscoveryLogging__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (verboseDiscoveryLogging___once != -1) {
    dispatch_once(&verboseDiscoveryLogging___once, block);
  }
  return verboseDiscoveryLogging___should;
}

- (double)quickControlsInactiveTimeout
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__MRUserSettings_quickControlsInactiveTimeout__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (quickControlsInactiveTimeout___once != -1) {
    dispatch_once(&quickControlsInactiveTimeout___once, block);
  }
  return *(double *)&quickControlsInactiveTimeout___timeout;
}

- (BOOL)usePeerToPeerExternalDeviceConnections
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"MRExternalDeviceIncludePeerToPeer", 0);
}

- (BOOL)useNoDelayOptionForExternalDeviceSockets
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"MRExternalDeviceUseNoDelayOptionForExternalDeviceSockets", 1);
}

- (BOOL)useDebugAVRouteWithoutVolumeControl
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"UseDebugAVRouteWithoutVolumeControl", 0);
}

- (BOOL)shouldInitializeTelevisionBonjourService
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"ShouldInitializeTVBonjourService", 0);
}

- (BOOL)shouldInitializeGenericBonjourService
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"ShouldInitializeGenericBonjourService", 0);
}

- (BOOL)shouldInitializeRapportService
{
  return _os_feature_enabled_impl();
}

- (BOOL)shouldLogPairingSetupCode
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"LogPairingSetupCode", 0);
}

- (BOOL)shouldLogArtwork
{
  if (MRProcessIsMediaRemoteDaemon())
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __34__MRUserSettings_shouldLogArtwork__block_invoke;
    block[3] = &unk_1E57D0518;
    block[4] = self;
    if (shouldLogArtwork_onceToken != -1) {
      dispatch_once(&shouldLogArtwork_onceToken, block);
    }
  }
  return shouldLogArtwork_shouldLogArtwork;
}

uint64_t __34__MRUserSettings_shouldLogArtwork__block_invoke(uint64_t a1)
{
  uint64_t result = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](*(void *)(a1 + 32), @"LogArtwork", 0);
  shouldLogArtwork_shouldLogArtwork = result;
  return result;
}

- (BOOL)verboseProtocolMessageLogging
{
  uint64_t IsUsingRoots = MSVProcessIsUsingRoots();

  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"verboseProtocolMessageLogging", IsUsingRoots);
}

- (BOOL)verboseHostedDiscoverySessionLogging
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"verboseHostedDiscoverySessionLogging", 0);
}

- (BOOL)verboseHostedExternalDeviceClientLogging
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"verboseHostedExternalDeviceClientLogging", 0);
}

uint64_t __49__MRUserSettings_verboseConnectionMonitorLogging__block_invoke(uint64_t a1)
{
  uint64_t result = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](*(void *)(a1 + 32), @"verboseConnectionMonitorLogging", 0);
  verboseConnectionMonitorLogging___should = result;
  return result;
}

- (BOOL)verboseOriginForwarderLogging
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__MRUserSettings_verboseOriginForwarderLogging__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (verboseOriginForwarderLogging___once != -1) {
    dispatch_once(&verboseOriginForwarderLogging___once, block);
  }
  return verboseOriginForwarderLogging___should;
}

uint64_t __47__MRUserSettings_verboseOriginForwarderLogging__block_invoke(uint64_t a1)
{
  uint64_t result = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](*(void *)(a1 + 32), @"verboseOriginForwarderLogging", 1);
  verboseOriginForwarderLogging___should = result;
  return result;
}

uint64_t __48__MRUserSettings_verboseNowPlayingStateObserver__block_invoke(uint64_t a1)
{
  uint64_t result = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](*(void *)(a1 + 32), @"verboseNowPlayingStateObserver", 0);
  verboseNowPlayingStateObserver___should = result;
  return result;
}

uint64_t __54__MRUserSettings_verboseRemoteControlDiscoveryLogging__block_invoke(uint64_t a1)
{
  uint64_t result = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](*(void *)(a1 + 32), @"verboseRemoteControlDiscoveryLogging", 0);
  verboseRemoteControlDiscoveryLogging___should = result;
  return result;
}

uint64_t __41__MRUserSettings_verboseDiscoveryLogging__block_invoke(uint64_t a1)
{
  uint64_t result = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](*(void *)(a1 + 32), @"verboseDiscoveryLogging", 0);
  verboseDiscoveryLogging___should = result;
  return result;
}

uint64_t __44__MRUserSettings_verboseImageLoadingLogging__block_invoke(uint64_t a1)
{
  uint64_t result = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](*(void *)(a1 + 32), @"verboseImageLoadingLogging", 0);
  verboseImageLoadingLogging___should = result;
  return result;
}

uint64_t __44__MRUserSettings_verboseMediaControlLogging__block_invoke(uint64_t a1)
{
  uint64_t result = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](*(void *)(a1 + 32), @"verboseMediaControlLogging", 0);
  verboseMediaControlLogging___should = result;
  return result;
}

- (BOOL)verboseOutputContextLogging
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__MRUserSettings_verboseOutputContextLogging__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (verboseOutputContextLogging___once != -1) {
    dispatch_once(&verboseOutputContextLogging___once, block);
  }
  return verboseOutputContextLogging___should;
}

void __45__MRUserSettings_verboseOutputContextLogging__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[MRUserSettings currentSettings];
  verboseOutputContextLogging___should = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](v1, @"verboseOutputContextLogging", [v2 supportOutputContextSync]);
}

- (BOOL)hasExternalDeviceSocketQOSLevelSet
{
  id v2 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"MRExternalDeviceSocketsQOSLevel"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (int64_t)externalDeviceSocketQOSLevel
{
  return [(NSUserDefaults *)self->_userDefaults integerForKey:@"MRExternalDeviceSocketsQOSLevel"];
}

- (double)externalDeviceTimeoutDuration
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, @"kMRSettingsExternalDeviceTimeoutSecondsDurationDefaultsKey", 7.0);
}

- (double)externalDeviceNowPlayingInfoCoalesceDuration
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, @"kMRSettingsExternalDeviceNowPlayingInfoCoalesceDurationDefaultsKey", 0.3);
}

- (double)externalDeviceNowPlayingInfoArtworkCoalesceDuration
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, @"kMRSettingsExternalDeviceNowPlayingInfoArtworkCoalesceDurationDefaultsKey", 0.5);
}

- (double)externalDeviceDisconnectWaitDuration
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, @"kMRSettingsExternalDeviceDisconnectWaitDurationDefaultsKey", 7.0);
}

- (double)externalDeviceDisconnectSleepDuration
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, @"kMRSettingsExternalDeviceDisconnectSleepDurationDefaultsKey", 2.0);
}

- (double)externalDeviceSleepAssertionOnClientConnectDuration
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, @"kMRSettingsExternalDeviceSleepAssertionOnClientConnectDurationDefaultsKey", 10.0);
}

- (double)bluetoothDeviceResumeDuration
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, @"kMRSettingsBluetoothDeviceResumeDurationDefaultsKey", 10.0);
}

- (double)broadcastCommandWaitDuration
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, @"kMRSettingsBroadcastCommandWaitDurationDefaultsKey", 10.0);
}

- (double)airPlayOutputContextInitTimeoutDuration
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, @"AirPlayContextInitTimeoutDuration_v2", 30.0);
}

void __51__MRUserSettings_wakingPlayerPathAssertionDuration__block_invoke(uint64_t a1)
{
  wakingPlayerPathAssertionDuration___duration = -[MRUserSettings _doubleValueForKey:usingDefaultValue:](*(void *)(a1 + 32), @"wakingPlayerPathAssertionDuration", 3.0);
}

- (double)nowPlayingUIWakingPlayerEventAssertionDuration
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__MRUserSettings_nowPlayingUIWakingPlayerEventAssertionDuration__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (nowPlayingUIWakingPlayerEventAssertionDuration___once != -1) {
    dispatch_once(&nowPlayingUIWakingPlayerEventAssertionDuration___once, block);
  }
  return *(double *)&nowPlayingUIWakingPlayerEventAssertionDuration___duration;
}

void __64__MRUserSettings_nowPlayingUIWakingPlayerEventAssertionDuration__block_invoke(uint64_t a1)
{
  nowPlayingUIWakingPlayerEventAssertionDuration___duration = -[MRUserSettings _doubleValueForKey:usingDefaultValue:](*(void *)(a1 + 32), @"nowPlayingUIWakingPlayerEventAssertionDuration", 5.0);
}

uint64_t __57__MRUserSettings_checkXPCConnectionStatusDefaultInterval__block_invoke(uint64_t a1)
{
  uint64_t result = -[MRUserSettings _integerValueForKey:usingDefaultValue:](*(void *)(a1 + 32), @"checkXPCConnectionStatusDefaultInterval", 100);
  checkXPCConnectionStatusDefaultInterval___interval = result;
  return result;
}

- (uint64_t)_integerValueForKey:(uint64_t)a3 usingDefaultValue:
{
  id v5 = a2;
  if (a1)
  {
    objc_super v6 = [*(id *)(a1 + 8) objectForKey:v5];

    if (v6) {
      a3 = [*(id *)(a1 + 8) integerForKey:v5];
    }
  }
  else
  {
    a3 = 0;
  }

  return a3;
}

void __64__MRUserSettings_checkXPCConnectionStatusDefaultResponseTimeout__block_invoke(uint64_t a1)
{
  checkXPCConnectionStatusDefaultResponseTimeout___timeout = (unint64_t)-[MRUserSettings _doubleValueForKey:usingDefaultValue:](*(void *)(a1 + 32), @"checkXPCConnectionStatusDefaultResponseTimeout", 30.0);
}

- (double)nowPlayingObserverCoalesceInterval
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__MRUserSettings_nowPlayingObserverCoalesceInterval__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (nowPlayingObserverCoalesceInterval___once != -1) {
    dispatch_once(&nowPlayingObserverCoalesceInterval___once, block);
  }
  return *(double *)&nowPlayingObserverCoalesceInterval___interval;
}

void __52__MRUserSettings_nowPlayingObserverCoalesceInterval__block_invoke(uint64_t a1)
{
  nowPlayingObserverCoalesceInterval___interval = -[MRUserSettings _doubleValueForKey:usingDefaultValue:](*(void *)(a1 + 32), @"nowPlayingObserverCoalesceInterval", 0.7);
}

- (double)nowPlayingAppStackFailedPlayInterval
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__MRUserSettings_nowPlayingAppStackFailedPlayInterval__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (nowPlayingAppStackFailedPlayInterval___once != -1) {
    dispatch_once(&nowPlayingAppStackFailedPlayInterval___once, block);
  }
  return *(double *)&nowPlayingAppStackFailedPlayInterval___interval;
}

void __54__MRUserSettings_nowPlayingAppStackFailedPlayInterval__block_invoke(uint64_t a1)
{
  if (_os_feature_enabled_impl()) {
    nowPlayingAppStackFailedPlayInterval___interval = -[MRUserSettings _doubleValueForKey:usingDefaultValue:](*(void *)(a1 + 32), @"nowPlayingAppStackFailedPlayInterval", 5.0);
  }
}

- (BOOL)nowPlayingAppStackShouldAutomaticallyForwardFailedPlayCommands
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__MRUserSettings_nowPlayingAppStackShouldAutomaticallyForwardFailedPlayCommands__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (nowPlayingAppStackShouldAutomaticallyForwardFailedPlayCommands___once != -1) {
    dispatch_once(&nowPlayingAppStackShouldAutomaticallyForwardFailedPlayCommands___once, block);
  }
  return nowPlayingAppStackShouldAutomaticallyForwardFailedPlayCommands_value;
}

uint64_t __80__MRUserSettings_nowPlayingAppStackShouldAutomaticallyForwardFailedPlayCommands__block_invoke(uint64_t a1)
{
  uint64_t result = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](*(void *)(a1 + 32), @"nowPlayingAppStackShouldAutomaticallyForwardFailedPlayCommands", 0);
  nowPlayingAppStackShouldAutomaticallyForwardFailedPlayCommands_value = result;
  return result;
}

- (double)externalDeviceArtificalConnectionDelay
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__MRUserSettings_externalDeviceArtificalConnectionDelay__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (externalDeviceArtificalConnectionDelay___once != -1) {
    dispatch_once(&externalDeviceArtificalConnectionDelay___once, block);
  }
  return *(double *)&externalDeviceArtificalConnectionDelay___interval;
}

void __56__MRUserSettings_externalDeviceArtificalConnectionDelay__block_invoke(uint64_t a1)
{
  externalDeviceArtificalConnectionDelay___interval = -[MRUserSettings _doubleValueForKey:usingDefaultValue:](*(void *)(a1 + 32), @"externalDeviceArtificalConnectionDelay", 0.0);
}

- (BOOL)useExternalDeviceSystemPairing
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"kMRSettingsExternalDeviceSystemPairingDefaultsKey", 1);
}

- (int64_t)maxTransactionMemorySize
{
  return -[MRUserSettings _integerValueForKey:usingDefaultValue:]((uint64_t)self, @"kMRSettingsMaxTransactionSizeDefaultsKey", 2000000);
}

- (double)transactionWaitDurationOnOutOfMemory
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, @"kMRSettingsWaitDurationOnOutOfMemoryDefaultsKey", 0.01);
}

- (double)transactionWaitDurationOnXpcSend
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, @"kMRSettingsWaitDurationOnXpcSendDefaultsKey", 0.0);
}

- (double)transactionWaitDurationOnNetworkSend
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, @"kMRSettingsWaitDurationOnNetworkSendDefaultsKey", 0.001);
}

- (BOOL)useSystemAudioContextForAirPlayTransport
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"UseSystemAudioContextForAirPlayTransport", 0);
}

- (BOOL)useGenericTransportForHostedEndpoints
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"UseGenericTransportForHostedEndpoints", 0);
}

- (NSArray)connectedClientAuditTokens
{
  id v2 = [(NSUserDefaults *)self->_userDefaults arrayForKey:@"ConnectedClientAuditTokens"];
  BOOL v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (double)queuedCommandsTimeoutInterval
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, @"queuedCommandsTimeoutInterval", 30.0);
}

- (double)nowPlayingApplicationTimeout
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__MRUserSettings_nowPlayingApplicationTimeout__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (nowPlayingApplicationTimeout_onceToken != -1) {
    dispatch_once(&nowPlayingApplicationTimeout_onceToken, block);
  }
  return *(double *)&nowPlayingApplicationTimeout_timeout;
}

void __46__MRUserSettings_nowPlayingApplicationTimeout__block_invoke(uint64_t a1)
{
  nowPlayingApplicationTimeout_timeout = -[MRUserSettings _doubleValueForKey:usingDefaultValue:](*(void *)(a1 + 32), @"NowPlayingApplicationTimeout", 480.0);
}

- (BOOL)takelockScreenAssertion
{
  return MGGetSInt32Answer() - 1 < 3;
}

- (BOOL)supportSystemEndpoints
{
  if (-[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"SupportSystemEndpoints", 0)) {
    return 1;
  }
  unsigned int v3 = MGGetSInt32Answer() - 1;
  if (v3 < 6 && ((0x27u >> v3) & 1) != 0) {
    return 1;
  }

  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"SupportSystemEndpoints", 0);
}

- (BOOL)supportElectedPlayer
{
  if ([(MRUserSettings *)self takelockScreenAssertion]) {
    return 1;
  }

  return [(MRUserSettings *)self supportSystemEndpoints];
}

- (BOOL)connectToEndpointWhenBeginsPlayback
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"ConnectToEndpointWhenBeginsPlayback", 1);
}

- (BOOL)notifyDevicesInHomeThatPlaybackStarted
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__MRUserSettings_notifyDevicesInHomeThatPlaybackStarted__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (notifyDevicesInHomeThatPlaybackStarted_onceToken != -1) {
    dispatch_once(&notifyDevicesInHomeThatPlaybackStarted_onceToken, block);
  }
  return notifyDevicesInHomeThatPlaybackStarted___value;
}

uint64_t __56__MRUserSettings_notifyDevicesInHomeThatPlaybackStarted__block_invoke(uint64_t a1)
{
  uint64_t result = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](*(void *)(a1 + 32), @"NotifyDevicesInHomeThatPlaybackStarted", 0);
  notifyDevicesInHomeThatPlaybackStarted___value = result;
  return result;
}

- (BOOL)connectToAllEndpointsWhenAnyEndpointBeginsPlayback
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"ConnectToAllEndpointsWhenAnyEndpointBeginsPlayback", 0);
}

- (BOOL)connectToUserSelectedEndpoint
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"ConnectToUserSelectedEndpoint", 1);
}

- (double)discoverEndpointTimeoutInterval
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, @"DiscoverEndpointTimeoutInterval", 7.0);
}

- (double)deviceRecentlyUsedInterval
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, @"DeviceRecentlyUsedInterval", 14400.0);
}

- (double)mediaRecentlyPlayedInterval
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__MRUserSettings_mediaRecentlyPlayedInterval__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (mediaRecentlyPlayedInterval_onceToken != -1) {
    dispatch_once(&mediaRecentlyPlayedInterval_onceToken, block);
  }
  return *(double *)&mediaRecentlyPlayedInterval___value;
}

void __45__MRUserSettings_mediaRecentlyPlayedInterval__block_invoke(uint64_t a1)
{
  mediaRecentlyPlayedInterval___value = -[MRUserSettings _doubleValueForKey:usingDefaultValue:](*(void *)(a1 + 32), @"MediaRecentlyPlayedInterval", 480.0);
}

- (double)endpointRecentlyUserSelectedInterval
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, @"EndpointRecentlyUserSelectedInterval", 480.0);
}

- (double)activeUserTimeoutInterval
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, @"ActiveUserTimeoutInterval", 480.0);
}

- (double)electedPlayerInterval
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__MRUserSettings_electedPlayerInterval__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (electedPlayerInterval_onceToken != -1) {
    dispatch_once(&electedPlayerInterval_onceToken, block);
  }
  return *(double *)&electedPlayerInterval___value;
}

void __39__MRUserSettings_electedPlayerInterval__block_invoke(uint64_t a1)
{
  electedPlayerInterval___value = -[MRUserSettings _doubleValueForKey:usingDefaultValue:](*(void *)(a1 + 32), @"ElectedPlayerInterval", 480.0);
}

- (BOOL)supportUserSelectedEndpointTimeout
{
  return 1;
}

- (double)remoteDeviceIdleDisconnectionInterval
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, @"RemoteDeviceIdleDisconnectionInterval", 480.0);
}

- (BOOL)remoteDeviceIdleDisconnection
{
  return _os_feature_enabled_impl();
}

- (double)launchApplicationTimeoutInterval
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, @"LaunchApplicationTimeoutInterval", 7.0);
}

- (NSArray)jsonClientUIDs
{
  id v2 = [(NSUserDefaults *)self->_userDefaults arrayForKey:@"JSONClientUIDs"];
  unsigned int v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (NSArray)routePickerAirPlayAllowList
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__MRUserSettings_routePickerAirPlayAllowList__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (routePickerAirPlayAllowList_onceToken != -1) {
    dispatch_once(&routePickerAirPlayAllowList_onceToken, block);
  }
  return self->_routePickerAirPlayAllowList;
}

uint64_t __45__MRUserSettings_routePickerAirPlayAllowList__block_invoke(uint64_t a1)
{
  -[MRUserSettings _loadRoutePickerAirPlayAllowList](*(void *)(a1 + 32));
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);

  return objc_msgSend(v2, "addObserver:forKeyPath:options:context:");
}

- (void)_loadRoutePickerAirPlayAllowList
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = [*(id *)(a1 + 8) valueForKey:@"routepicker-airplay-allowlist"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v4 = v2;
    if ((isKindOfClass & 1) == 0)
    {
      if (v2)
      {
        v7[0] = v2;
        uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
        objc_super v6 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v5;

LABEL_7:
        return;
      }
      v4 = 0;
    }
    objc_storeStrong((id *)(a1 + 16), v4);
    goto LABEL_7;
  }
}

- (NSArray)routePickerAirPlayDenyList
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MRUserSettings_routePickerAirPlayDenyList__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (routePickerAirPlayDenyList_onceToken != -1) {
    dispatch_once(&routePickerAirPlayDenyList_onceToken, block);
  }
  return self->_routePickerAirPlayDenyList;
}

uint64_t __44__MRUserSettings_routePickerAirPlayDenyList__block_invoke(uint64_t a1)
{
  -[MRUserSettings _loadRoutePickerAirPlayDenyList](*(void *)(a1 + 32));
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);

  return objc_msgSend(v2, "addObserver:forKeyPath:options:context:");
}

- (BOOL)supportProximityMigration
{
  if ([(MRUserSettings *)self supportProximityMigrationV2]
    || MGGetSInt32Answer() - 1 > 2)
  {
    return 0;
  }

  return _os_feature_enabled_impl();
}

- (NSArray)destinationResolverReconRetryIntervals
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__MRUserSettings_destinationResolverReconRetryIntervals__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (destinationResolverReconRetryIntervals_onceToken != -1) {
    dispatch_once(&destinationResolverReconRetryIntervals_onceToken, block);
  }
  return (NSArray *)(id)destinationResolverReconRetryIntervals_intervals;
}

void __56__MRUserSettings_destinationResolverReconRetryIntervals__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(*(void *)(a1 + 32) + 8) arrayForKey:@"destinationResolverReconRetryIntervals"];
  id v2 = (void *)destinationResolverReconRetryIntervals_intervals;
  destinationResolverReconRetryIntervals_intervals = v1;

  if (![(id)destinationResolverReconRetryIntervals_intervals count])
  {
    unsigned int v3 = (void *)destinationResolverReconRetryIntervals_intervals;
    destinationResolverReconRetryIntervals_intervals = (uint64_t)&unk_1EE66F390;
  }
}

- (int)nowPlayingControllerVersion
{
  return -[MRUserSettings _integerValueForKey:usingDefaultValue:]((uint64_t)self, @"nowPlayingController", 2);
}

- (BOOL)supportMigration
{
  return _os_feature_enabled_impl();
}

- (BOOL)supportNewMigrationBehaviorForProximity
{
  return _os_feature_enabled_impl();
}

- (BOOL)supportNewMigrationArchitecture
{
  return _os_feature_enabled_impl();
}

- (BOOL)supportProximityMigrationV2
{
  return _os_feature_enabled_impl();
}

- (BOOL)supportExpanseMigration
{
  return _os_feature_enabled_impl();
}

- (BOOL)supportOutOfProcessMigration
{
  return _os_feature_enabled_impl();
}

- (BOOL)forceFadeForEveryHandoff
{
  return _os_feature_enabled_impl();
}

- (BOOL)supportLastPlayingDevice
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"SupportLastPlayingDevice", 0);
}

- (BOOL)supportRapportRemoteControlTransport
{
  return _os_feature_enabled_impl();
}

- (BOOL)supportRapportRemoteControlConnection
{
  return _os_feature_enabled_impl();
}

- (BOOL)sendLastPlayingDeviceToHome
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"SendLastPlayingDeviceToHome", 0);
}

- (double)lastPlayingDeviceThresholdInterval
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, @"LastPlayingDeviceThresholdInterval", 172800.0);
}

void __70__MRUserSettings_sendPlaybackSessionUpdateToCompanionCoalesceInterval__block_invoke(uint64_t a1)
{
  sendPlaybackSessionUpdateToCompanionCoalesceInterval___value = -[MRUserSettings _doubleValueForKey:usingDefaultValue:](*(void *)(a1 + 32), @"SendPlaybackSessionUpdateToCompanionCoalesceInterval", 1.0);
}

uint64_t __38__MRUserSettings_forceEnableCECVolume__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addObserver:*(void *)(a1 + 32) forKeyPath:@"ForceEnableCECVolume" options:0 context:MRUserSettingsForceEnableCECContext];
}

- (BOOL)connectToAllEndpointsWhenInProximityToAnyDevice
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"ConnectToAllEndpointsWhenInProximityToAnyDevice", 0);
}

- (BOOL)computeDevicePlaybackSessionID
{
  return 0;
}

- (id)defaultSupportedCommandsDataForClient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MRUserSettings *)self defaultSupportedCommandsData];
  objc_super v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (double)activeSystemEndpointStartupDelayToAllowAllPreviousClientsTimeToInitializeInterval
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, @"ActiveSystemEndpointStartupDelayInterval", 3.0);
}

- (unsigned)localPlaybackState
{
  return -[MRUserSettings _integerValueForKey:usingDefaultValue:]((uint64_t)self, @"LocalPlaybackState", 0);
}

- (void)setLocalPlaybackState:(unsigned int)a3
{
}

- (id)localLastPlayingDate
{
  return [(NSUserDefaults *)self->_userDefaults objectForKey:@"LastPlayingDate"];
}

- (void)setLocalLastPlayingDate:(id)a3
{
}

- (NSString)lastBootUUID
{
  return (NSString *)[(NSUserDefaults *)self->_userDefaults objectForKey:@"LastBootUUID"];
}

- (void)setLastBootUUID:(id)a3
{
}

- (BOOL)supportNanoLinkAgent
{
  return _os_feature_enabled_impl();
}

- (BOOL)discoverCompanionDevices
{
  return 0;
}

- (BOOL)useAPSyncAPI
{
  return 0;
}

- (BOOL)isMultiplayerAware
{
  id v2 = +[MRSharedSettings currentSettings];
  char v3 = [v2 isMultiplayerAware];

  return v3;
}

- (BOOL)removeLocalDevice
{
  id v2 = +[MRSharedSettings currentSettings];
  char v3 = [v2 supportNowPlayingSessionDataSource] ^ 1;

  return v3;
}

- (BOOL)showUncommitedDevices
{
  return ![(MRUserSettings *)self removeLocalDevice];
}

- (BOOL)needsMXApplications
{
  if ([(MRUserSettings *)self supportNowPlayingPIP]) {
    return 1;
  }
  if (self) {
    return MSVDeviceIsAudioAccessory() ^ 1;
  }
  return 0;
}

- (BOOL)supportCoordinatedVolume
{
  return _os_feature_enabled_impl();
}

- (BOOL)supportIDSDiscovery
{
  return _os_feature_enabled_impl();
}

- (BOOL)removeLocalDeviceOnMultiplayerReceiverSession
{
  return _os_feature_enabled_impl();
}

- (BOOL)supportPTOTRefactorPart1
{
  return _os_feature_enabled_impl();
}

- (BOOL)supportPTOTRefactorPart2
{
  return _os_feature_enabled_impl();
}

- (BOOL)supportLargeHomeAudioOptimization
{
  return _os_feature_enabled_impl();
}

- (BOOL)prewarmPodcasts
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"prewarmPodcasts", 1);
}

- (BOOL)supportRouteRecommendations
{
  return self != 0;
}

- (BOOL)enableRouteRecommendations
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"EnableRoutePrediction", @"com.apple.coremedia", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 0;
  }
  return !v3;
}

- (BOOL)addDebugBadgeToRecommendedRoutes
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"CorianderTopOfListBadge", 0);
}

- (BOOL)showBluePill
{
  int v3 = [(MRUserSettings *)self supportRouteRecommendations];
  if (v3)
  {
    LOBYTE(v3) = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"ShowBluePill", 1);
  }
  return v3;
}

- (BOOL)enableQueueHandOffForRouteRecommendations
{
  int v3 = [(MRUserSettings *)self supportRouteRecommendations];
  if (v3)
  {
    LOBYTE(v3) = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"CorianderQHO", 0);
  }
  return v3;
}

- (BOOL)suppressScreenMirroringErrors
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"SuppressScreenMirroringErrors", 0);
}

- (BOOL)supportLiveActivityBanner
{
  return _os_feature_enabled_impl();
}

- (BOOL)alwaysShowVolumeControls
{
  if (_AXSAlwaysShowVolumeControlEnabled()) {
    return 1;
  }

  return [(MRUserSettings *)self internalUI];
}

- (double)oneTapSuggestionInactiveTimeout
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, @"OneTapSuggestionTimeout", 5.0);
}

- (double)autoRouteInactiveTimeout
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, @"AutoRouteMementoTimeout", 5.0);
}

- (BOOL)preferRoutesMatchingMediaType
{
  return _os_feature_enabled_impl();
}

- (BOOL)undoUnusedAutoRoutes
{
  return _os_feature_enabled_impl();
}

- (double)undoUnusedAutoRouteTimerDuration
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, @"UndoAutoRouteTimerDuration", 15.0);
}

- (BOOL)enableDeltaRouteRecommendations
{
  return _os_feature_enabled_impl();
}

- (BOOL)sourceRecommendationsPlattersFromIR
{
  return _os_feature_enabled_impl();
}

- (BOOL)useRSEForProximity
{
  return 0;
}

- (BOOL)disablePairedDeviceActiveEndpointSync
{
  return _os_feature_enabled_impl();
}

- (NSString)nearbyDeviceIdentifiersDidChangeNotification
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__MRUserSettings_nearbyDeviceIdentifiersDidChangeNotification__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (nearbyDeviceIdentifiersDidChangeNotification_onceToken != -1) {
    dispatch_once(&nearbyDeviceIdentifiersDidChangeNotification_onceToken, block);
  }
  return (NSString *)@"MRUserSettingsNearbyDeviceIdentifiersDidChangeNotification";
}

uint64_t __62__MRUserSettings_nearbyDeviceIdentifiersDidChangeNotification__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addObserver:*(void *)(a1 + 32) forKeyPath:@"NearbyDeviceIdentifiers" options:0 context:MRUserSettingsNearbyDeviceIdentifiersContext];
}

- (NSArray)nearbyDeviceIdentifiers
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__MRUserSettings_nearbyDeviceIdentifiers__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (nearbyDeviceIdentifiers_onceToken != -1) {
    dispatch_once(&nearbyDeviceIdentifiers_onceToken, block);
  }
  return self->_nearbyDeviceIdentifiers;
}

void __41__MRUserSettings_nearbyDeviceIdentifiers__block_invoke(uint64_t a1)
{
}

- (BOOL)supportOutputContextPrewarming
{
  id v2 = +[MRUserSettings currentSettings];
  if ([v2 supportMultiplayerHost]) {
    char v3 = _os_feature_enabled_impl();
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)supportAirplayStereoPairPersistentConnections
{
  id v2 = +[MRUserSettings currentSettings];
  if ([v2 supportMultiplayerHost]) {
    char v3 = _os_feature_enabled_impl();
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (unint64_t)maxStreamCapacity
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__MRUserSettings_maxStreamCapacity__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (maxStreamCapacity_onceToken != -1) {
    dispatch_once(&maxStreamCapacity_onceToken, block);
  }
  return maxStreamCapacity_max;
}

void __35__MRUserSettings_maxStreamCapacity__block_invoke(uint64_t a1)
{
  id v4 = (id)MGCopyAnswer();
  uint64_t v2 = *(void *)(a1 + 32);
  if ([v4 containsString:@"AudioAccessory1"]) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 3;
  }
  maxStreamCapacity_max = -[MRUserSettings _integerValueForKey:usingDefaultValue:](v2, @"MaxStreamCapacity", v3);
}

- (BOOL)reserveSlotForLocal
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"ReserveSlotForLocal", 0);
}

uint64_t __42__MRUserSettings_forceDeviceInfoDiscovery__block_invoke(uint64_t a1)
{
  uint64_t result = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](*(void *)(a1 + 32), @"ForceDeviceInfoDiscovery", 0);
  forceDeviceInfoDiscovery___value = result;
  return result;
}

- (float)proximitySortingNearbyRadius
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__MRUserSettings_proximitySortingNearbyRadius__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (proximitySortingNearbyRadius___token != -1) {
    dispatch_once(&proximitySortingNearbyRadius___token, block);
  }
  return *(float *)&proximitySortingNearbyRadius___proximitySortingNearbyRadius;
}

float __46__MRUserSettings_proximitySortingNearbyRadius__block_invoke(uint64_t a1)
{
  float result = -[MRUserSettings _doubleValueForKey:usingDefaultValue:](*(void *)(a1 + 32), @"ProximitySortingNearbyRadius", 4.0);
  proximitySortingNearbyRadius___proximitySortingNearbyRadius = LODWORD(result);
  return result;
}

- (BOOL)startNowPlayingSessionABC
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__MRUserSettings_startNowPlayingSessionABC__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (startNowPlayingSessionABC_onceToken != -1) {
    dispatch_once(&startNowPlayingSessionABC_onceToken, block);
  }
  return startNowPlayingSessionABC_support;
}

uint64_t __43__MRUserSettings_startNowPlayingSessionABC__block_invoke(uint64_t a1)
{
  uint64_t result = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](*(void *)(a1 + 32), @"startNowPlayingSessionABC", 1);
  startNowPlayingSessionABC_support = result;
  return result;
}

- (BOOL)excessiveNowPlayingControllersABC
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MRUserSettings_excessiveNowPlayingControllersABC__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (excessiveNowPlayingControllersABC_onceToken != -1) {
    dispatch_once(&excessiveNowPlayingControllersABC_onceToken, block);
  }
  return excessiveNowPlayingControllersABC_support;
}

void __51__MRUserSettings_excessiveNowPlayingControllersABC__block_invoke(uint64_t a1)
{
  int v1 = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](*(void *)(a1 + 32), @"excessiveNowPlayingControllersABC", 1);
  excessiveNowPlayingControllersABC_support = v1;
  if (v1)
  {
    id v3 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v2 = [v3 bundleIdentifier];
    excessiveNowPlayingControllersABC_support = MRMediaRemoteApplicationIsSystemMediaApplication((uint64_t)v2) ^ 1;
  }
}

- (BOOL)forceNowPlayingSessionFailure
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__MRUserSettings_forceNowPlayingSessionFailure__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (forceNowPlayingSessionFailure_onceToken != -1) {
    dispatch_once(&forceNowPlayingSessionFailure_onceToken, block);
  }
  return forceNowPlayingSessionFailure_support;
}

uint64_t __47__MRUserSettings_forceNowPlayingSessionFailure__block_invoke(uint64_t a1)
{
  uint64_t result = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](*(void *)(a1 + 32), @"forceNowPlayingSessionFailure", 0);
  forceNowPlayingSessionFailure_support = result;
  return result;
}

- (BOOL)supportTopologyHealing
{
  if (MSVDeviceIsAudioAccessory() & 1) != 0 || (MSVDeviceIsAppleTV()) {
    return 0;
  }

  return _os_feature_enabled_impl();
}

- (BOOL)supportRoutingContinuity
{
  if (![(MRUserSettings *)self supportSystemEndpoints]
    || !_os_feature_enabled_impl())
  {
    return 0;
  }

  return [(MRUserSettings *)self supportTopologyHealing];
}

void __48__MRUserSettings_persistentDiscoveryABCDuration__block_invoke(uint64_t a1)
{
  persistentDiscoveryABCDuration_duration = -[MRUserSettings _doubleValueForKey:usingDefaultValue:](*(void *)(a1 + 32), @"persistentDiscoveryABCDuration", 7200.0);
}

- (BOOL)excessiveTaskAssertionsABC
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MRUserSettings_excessiveTaskAssertionsABC__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (excessiveTaskAssertionsABC_onceToken != -1) {
    dispatch_once(&excessiveTaskAssertionsABC_onceToken, block);
  }
  return excessiveTaskAssertionsABC_support;
}

uint64_t __44__MRUserSettings_excessiveTaskAssertionsABC__block_invoke(uint64_t a1)
{
  uint64_t result = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](*(void *)(a1 + 32), @"excessiveTaskAssertionsABC", 1);
  excessiveTaskAssertionsABC_support = result;
  return result;
}

- (BOOL)inconsistentPlaybackQueueCacheABC
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MRUserSettings_inconsistentPlaybackQueueCacheABC__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (inconsistentPlaybackQueueCacheABC_onceToken != -1) {
    dispatch_once(&inconsistentPlaybackQueueCacheABC_onceToken, block);
  }
  return inconsistentPlaybackQueueCacheABC_support;
}

uint64_t __51__MRUserSettings_inconsistentPlaybackQueueCacheABC__block_invoke(uint64_t a1)
{
  uint64_t result = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](*(void *)(a1 + 32), @"inconsistentPlaybackQueueCacheABC", 1);
  inconsistentPlaybackQueueCacheABC_support = result;
  return result;
}

- (NSArray)routeRecommendationEligibleApps
{
  uint64_t v2 = [(NSUserDefaults *)self->_userDefaults arrayForKey:@"BannerApps"];
  id v3 = (void *)[v2 copy];
  id v4 = v3;
  if (!v3) {
    id v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v5 = v3;

  return v5;
}

- (BOOL)useProactivePFSQSender
{
  if ([(MRUserSettings *)self sendProactivePFSQOnUserSelectedASEChange]
    || [(MRUserSettings *)self sendProactivePFSQOnProactiveASEChange])
  {
    return 1;
  }

  return [(MRUserSettings *)self sendProactivePFSQAfterBoot];
}

- (BOOL)sendProactivePFSQOnUserSelectedASEChange
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"SendPPFSQOnASEChange", 1);
}

- (BOOL)sendProactivePFSQOnProactiveASEChange
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"SendPPFSQOnProactiveASEChange", 0);
}

- (BOOL)sendProactivePFSQAfterBoot
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"SendPPFSQAfterBoot", 1);
}

- (BOOL)sendProactivePFSQOnSiriActivation
{
  uint64_t IsAudioAccessory = MSVDeviceIsAudioAccessory();

  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"sendProactivePFSQOnSiriActivation", IsAudioAccessory);
}

- (BOOL)supportLockscreenPlatterDisplayForPersonalDevice
{
  return _os_feature_enabled_impl();
}

- (double)personalDeviceLockScreenTimeout
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, @"PersonalDevicesForLockScreenDisplay", 480.0);
}

- (NSDictionary)personalDeviceState
{
  return (NSDictionary *)[(NSUserDefaults *)self->_userDefaults objectForKey:@"PersonalDeviceState"];
}

- (void)setPersonalDeviceState:(id)a3
{
}

- (unint64_t)maximumNumberOfMediaSuggestions
{
  return -[MRUserSettings _integerValueForKey:usingDefaultValue:]((uint64_t)self, @"MaximumNumberOfMediaSuggestions", 12);
}

- (BOOL)supportProactiveSuggestion
{
  return _os_feature_enabled_impl();
}

- (BOOL)visuallyIdentifyProactiveSuggestion
{
  return _os_feature_enabled_impl();
}

- (BOOL)internalUI
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__MRUserSettings_internalUI__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (internalUI_onceToken != -1) {
    dispatch_once(&internalUI_onceToken, block);
  }
  return internalUI___internal;
}

uint64_t __28__MRUserSettings_internalUI__block_invoke(uint64_t a1)
{
  uint64_t result = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:](*(void *)(a1 + 32), @"InternalUI", 0);
  internalUI___internal = result;
  return result;
}

- (BOOL)allowAllClientUIConnections
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"AllowAllClientUIConnections", 0);
}

- (BOOL)placeholderGroupSessionIdentity
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"PlaceholderGroupSessionIdentity", 0);
}

- (BOOL)groupSessionHUD
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"GroupSessionHUD", 0);
}

- (BOOL)alwaysShowGroupSessionHUD
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"AlwaysShowGroupSessionHUD", 0);
}

- (BOOL)groupSessionNearbyLockscreen
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"GroupSessionNearbyLockscreen", 1);
}

- (BOOL)startGroupSessionsForAllRoutes
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"StartGroupSessionsForAllRoutes", 0);
}

- (BOOL)startGroupSessionsForAllRouteSubtypes
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"StartGroupSessionsForAllRouteSubtypes", 0);
}

- (BOOL)startGroupSessionWithBasicIdentity
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"StartGroupSessionWithBasicIdentity", 0);
}

- (BOOL)supportGroupSessionLowPowerMode
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"SupportGroupSessionLowPowerMode", 1);
}

- (double)groupSessionEndAfterPauseInterval
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, @"GroupSessionEndAfterPauseInterval", 3600.0);
}

- (double)groupSessionLeaderDiscoveryInterval
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, @"GroupSessionLeaderDiscoveryInterval", 15.0);
}

- (double)groupSessionNearbyGroupJoinTimeout
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, @"GroupSessionNearbyGroupJoinTimeout", 30.0);
}

- (double)groupSessionNearbyGroupCreateTimeout
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, @"GroupSessionNearbyGroupCreateTimeout", 60.0);
}

- (double)groupSessionNearbyInvitationCreateTimeout
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, @"GroupSessionNearbyInvitationCreateTimeout", 60.0);
}

- (double)groupSessionEndpointDiscoveryInterval
{
  [(MRUserSettings *)self groupSessionLeaderDiscoveryInterval];
  double v4 = v3;
  [(MRUserSettings *)self discoverEndpointTimeoutInterval];
  return v4 + v5;
}

- (BOOL)groupSessionNearbyContactDiscoveryEnabled
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"MRUserSettingsGroupSessionNearbyContactDiscoveryEnabled", 1);
}

- (BOOL)groupSessionContactAutoApprovalEnabled
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"MRUserSettingsGroupSessionContactAutoApprovalEnabled", 0);
}

- (BOOL)supportGroupSessionParticipantNotifications
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"SupportGroupSessionParticipantNotifications", 0);
}

- (void)setGroupSessionNearbyContactDiscoveryEnabled:(BOOL)a3
{
}

- (void)setGroupSessionContactAutoApprovalEnabled:(BOOL)a3
{
}

- (BOOL)supportGroupSessionOfframp
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"GroupSessionOfframp", 1);
}

- (double)groupSessionStartRequestAssertionDuration
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, @"GroupSessionStartRequestAssertionDuration", 480.0);
}

- (NSString)recentGroupSessionParticipantsPepper
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__MRUserSettings_recentGroupSessionParticipantsPepper__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  if (recentGroupSessionParticipantsPepper_onceToken != -1) {
    dispatch_once(&recentGroupSessionParticipantsPepper_onceToken, block);
  }
  return (NSString *)(id)recentGroupSessionParticipantsPepper_pepper;
}

void __54__MRUserSettings_recentGroupSessionParticipantsPepper__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) stringForKey:@"RecentGroupSessionParticipantsPepper"];
  double v3 = (void *)recentGroupSessionParticipantsPepper_pepper;
  recentGroupSessionParticipantsPepper_pepper = v2;

  if (!recentGroupSessionParticipantsPepper_pepper)
  {
    uint64_t v4 = MSVNanoIDCreateTaggedPointer();
    double v5 = (void *)recentGroupSessionParticipantsPepper_pepper;
    recentGroupSessionParticipantsPepper_pepper = v4;

    objc_super v6 = *(void **)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = recentGroupSessionParticipantsPepper_pepper;
    [v6 setObject:v7 forKey:@"RecentGroupSessionParticipantsPepper"];
  }
}

- (BOOL)groupSessionSynchronizePendingParticipants
{
  return 0;
}

- (BOOL)supportGroupSessionAutoApproval
{
  return _os_feature_enabled_impl();
}

- (BOOL)groupSessionAutoApproveHomeParticipants
{
  return 0;
}

- (BOOL)groupSessionGenerateSharedSecret
{
  return 0;
}

- (BOOL)groupSessionListenForProxyJoinRequests
{
  uint64_t v2 = +[MRSharedSettings currentSettings];
  char v3 = [v2 supportGroupSessionHome];

  return v3;
}

- (BOOL)groupSessionBoopAdvertisementEnabled
{
  char v3 = +[MRSharedSettings currentSettings];
  int v4 = [v3 supportGroupSessionHomePodBoop];

  if (v4)
  {
    int IsAudioAccessory = MSVDeviceIsAudioAccessory();
    if (IsAudioAccessory)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__MRUserSettings_groupSessionBoopAdvertisementEnabled__block_invoke;
      block[3] = &unk_1E57D0518;
      block[4] = self;
      if (groupSessionBoopAdvertisementEnabled_onceToken != -1) {
        dispatch_once(&groupSessionBoopAdvertisementEnabled_onceToken, block);
      }
      LOBYTE(IsAudioAccessory) = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"GroupSessionBoopEnabled", 1);
    }
  }
  else
  {
    LOBYTE(IsAudioAccessory) = 0;
  }
  return IsAudioAccessory;
}

uint64_t __54__MRUserSettings_groupSessionBoopAdvertisementEnabled__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addObserver:*(void *)(a1 + 32) forKeyPath:@"GroupSessionBoopEnabled" options:0 context:MRUserSettingsGroupSessionBoopContext];
}

- (BOOL)groupSessionRotateAfterLastGuest
{
  int IsAudioAccessory = MSVDeviceIsAudioAccessory();
  if (IsAudioAccessory)
  {
    LOBYTE(IsAudioAccessory) = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"GroupSessionRotateAfterLastGuest", 0);
  }
  return IsAudioAccessory;
}

- (BOOL)groupSessionASEAssertionEnabled
{
  int IsAudioAccessory = MSVDeviceIsAudioAccessory();
  if (IsAudioAccessory)
  {
    LOBYTE(IsAudioAccessory) = -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"GroupSessionASEAssertionEnabled", 0);
  }
  return IsAudioAccessory;
}

+ (NSString)groupSessionBoopAdvertisementEnabledDidChangeNotification
{
  return (NSString *)@"MRUserSettingsGroupSessionBoopEnabledDidChangeNotification";
}

- (BOOL)prefersExpandedLockScreenPlatter
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"MRUserSettingsPrefersExpandedLockScreenPlatter", 1);
}

- (void)setPrefersExpandedLockScreenPlatter:(BOOL)a3
{
}

- (double)lockScreenAPLTarget
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, @"LockScreenAPLTarget", 0.03);
}

- (double)lockScreenAPLRatio
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, @"LockScreenAPLRatio", 10.0);
}

- (BOOL)donateActiveRoutesToBiome
{
  return -[MRUserSettings _BOOLValueForKey:usingDefaultValue:]((uint64_t)self, @"DonateActiveMediaRoutes", 1);
}

- (int64_t)waveformNonVariableFramerate
{
  return -[MRUserSettings _integerValueForKey:usingDefaultValue:]((uint64_t)self, @"WaveformNonVariableFramerate", 30);
}

- (double)flipBookUpdateInterval
{
  return -[MRUserSettings _doubleValueForKey:usingDefaultValue:]((uint64_t)self, @"FlipBookUpdateInterval", 20.0);
}

- (BOOL)supportCriticalSectionManagement
{
  return 0;
}

- (BOOL)isExternalDevicePairingAllowed
{
  return self->_externalDevicePairingAllowed;
}

- (void)setExternalDevicePairingAllowed:(BOOL)a3
{
  self->_externalDevicePairingAllowed = a3;
}

- (void)setHomepodDemoMode:(BOOL)a3
{
  self->_homepodDemoMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyDeviceIdentifiers, 0);
  objc_storeStrong((id *)&self->_routePickerAirPlayDenyList, 0);
  objc_storeStrong((id *)&self->_routePickerAirPlayAllowList, 0);

  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end