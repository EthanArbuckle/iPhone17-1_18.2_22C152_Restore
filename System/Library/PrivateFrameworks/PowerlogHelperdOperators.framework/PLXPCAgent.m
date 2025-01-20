@interface PLXPCAgent
+ (BOOL)shouldLogiOSWatchOSOnly;
+ (id)defaults;
+ (id)entryAggregateDefinitionKeyboardTime;
+ (id)entryAggregateDefinitionKeyboardWordsAndCharacters;
+ (id)entryAggregateDefinitionTouchEvents;
+ (id)entryAggregateDefinitions;
+ (id)entryEventBackwardDefinitionAVConference;
+ (id)entryEventBackwardDefinitionActiveStylus;
+ (id)entryEventBackwardDefinitionAttentionPolling;
+ (id)entryEventBackwardDefinitionAttentionSampling;
+ (id)entryEventBackwardDefinitionAttentionService;
+ (id)entryEventBackwardDefinitionCKKSSyncing;
+ (id)entryEventBackwardDefinitionCallScreeningDuration;
+ (id)entryEventBackwardDefinitionDRMaxRate;
+ (id)entryEventBackwardDefinitionEnergyTelemetry;
+ (id)entryEventBackwardDefinitionFrameCount;
+ (id)entryEventBackwardDefinitionKeyboardSession;
+ (id)entryEventBackwardDefinitionODHN;
+ (id)entryEventBackwardDefinitionODOff;
+ (id)entryEventBackwardDefinitionODOn;
+ (id)entryEventBackwardDefinitionPassiveStylus;
+ (id)entryEventBackwardDefinitionPeekPop;
+ (id)entryEventBackwardDefinitionSiriFalseAlarm;
+ (id)entryEventBackwardDefinitionSpotlightQos;
+ (id)entryEventBackwardDefinitionTrackpadResidencies;
+ (id)entryEventBackwardDefinitionUbiquityAccountStatistics;
+ (id)entryEventBackwardDefinitionVoicemailDuration;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardCallScreeningEnabled;
+ (id)entryEventForwardDefinitionAccessory;
+ (id)entryEventForwardDefinitionAccessoryMotion;
+ (id)entryEventForwardDefinitionAirDrop;
+ (id)entryEventForwardDefinitionAirDropSession;
+ (id)entryEventForwardDefinitionAppAccessory;
+ (id)entryEventForwardDefinitionAppleBacklightBrightness;
+ (id)entryEventForwardDefinitionAudioRouting;
+ (id)entryEventForwardDefinitionAvailabilityModes;
+ (id)entryEventForwardDefinitionCarPlay;
+ (id)entryEventForwardDefinitionCarPlayScreens;
+ (id)entryEventForwardDefinitionEnhancedDiscovery;
+ (id)entryEventForwardDefinitionInCallService;
+ (id)entryEventForwardDefinitionMXDiscoveryLevel;
+ (id)entryEventForwardDefinitionNetworkRelay;
+ (id)entryEventForwardDefinitionNetworkRelayWiFiAssertion;
+ (id)entryEventForwardDefinitionPasskeyAuthentication;
+ (id)entryEventForwardDefinitionPreferredLink;
+ (id)entryEventForwardDefinitionRapidSecurityResponse;
+ (id)entryEventForwardDefinitionSOSKVSRateLimitingEvent;
+ (id)entryEventForwardDefinitionSafariFetcher;
+ (id)entryEventForwardDefinitionSecondaryDisplay;
+ (id)entryEventForwardDefinitionSiri;
+ (id)entryEventForwardDefinitionSleepMode;
+ (id)entryEventForwardDefinitionSpatialAudio;
+ (id)entryEventForwardDefinitionTelephonyState;
+ (id)entryEventForwardDefinitionThermalHiP;
+ (id)entryEventForwardDefinitionThermalLevel;
+ (id)entryEventForwardDefinitionThermalSensors;
+ (id)entryEventForwardDefinitionUARPStatus;
+ (id)entryEventForwardDefinitionUIKitActivity;
+ (id)entryEventForwardDefinitionUIKitAlert;
+ (id)entryEventForwardDefinitionUIKitEclipse;
+ (id)entryEventForwardDefinitionUIKitKeyboard;
+ (id)entryEventForwardDefinitionWatchPresence;
+ (id)entryEventForwardDefinitionWebApp;
+ (id)entryEventForwardDefinitionWirelessSync;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventForwardDefinitionsDosimetry;
+ (id)entryEventIntervalDefinitionAirTrafficAssetDownload;
+ (id)entryEventIntervalDefinitionAnimatedStickerCreation;
+ (id)entryEventIntervalDefinitionAnimatedStickerScoring;
+ (id)entryEventIntervalDefinitionCoreDuetKnowledgeSync;
+ (id)entryEventIntervalDefinitionMomentsDeferredProcessing;
+ (id)entryEventIntervalDefinitionRapportReceivedMessage;
+ (id)entryEventIntervalDefinitionSpotlightIndexes;
+ (id)entryEventIntervalDefinitionSpotlightQueries;
+ (id)entryEventIntervalDefinitionStaticStickerCreation;
+ (id)entryEventIntervalDefinitionStaticStickerScoring;
+ (id)entryEventIntervalDefinitionUserSafety;
+ (id)entryEventIntervalDefinitions;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitioPortraitHighlightsResult;
+ (id)entryEventPointDefinitionADD;
+ (id)entryEventPointDefinitionAirPlayDiscoveryMode;
+ (id)entryEventPointDefinitionAppActivationPerformanceActivationData;
+ (id)entryEventPointDefinitionAppActivationPerformanceCPUStatistics;
+ (id)entryEventPointDefinitionAppActivationPerformanceMemoryStatistics;
+ (id)entryEventPointDefinitionAppActivationPerformancePowerStateStatistics;
+ (id)entryEventPointDefinitionAppActivationPerformanceProcessData;
+ (id)entryEventPointDefinitionCKKSSyncingRateLimit;
+ (id)entryEventPointDefinitionCacheDelete;
+ (id)entryEventPointDefinitionCloudKit;
+ (id)entryEventPointDefinitionCommuteRefresh;
+ (id)entryEventPointDefinitionDACalendarItemsDownloaded;
+ (id)entryEventPointDefinitionDACalendarItemsUploaded;
+ (id)entryEventPointDefinitionDASyncStart;
+ (id)entryEventPointDefinitionDeepScanReasons;
+ (id)entryEventPointDefinitionFocusFilters;
+ (id)entryEventPointDefinitionJetsam;
+ (id)entryEventPointDefinitionLocationVehicularDetection;
+ (id)entryEventPointDefinitionMachineTranslation;
+ (id)entryEventPointDefinitionMailFetch;
+ (id)entryEventPointDefinitionMobileBackupEvents;
+ (id)entryEventPointDefinitionMobileBackupStatistics;
+ (id)entryEventPointDefinitionMotionWakeReason;
+ (id)entryEventPointDefinitionNanoMailSession;
+ (id)entryEventPointDefinitionNavd;
+ (id)entryEventPointDefinitionNavdGeoNetworkActivity;
+ (id)entryEventPointDefinitionNavdMapsNavigationStateEvent;
+ (id)entryEventPointDefinitionNavdMapsWidgetSession;
+ (id)entryEventPointDefinitionNetworkEnergyModel;
+ (id)entryEventPointDefinitionNetworkRelayBTLinkAssertion;
+ (id)entryEventPointDefinitionOctagonTrust;
+ (id)entryEventPointDefinitionSecItem;
+ (id)entryEventPointDefinitionShortcutsTriggerFired;
+ (id)entryEventPointDefinitionSiriActivication;
+ (id)entryEventPointDefinitionSleepLock;
+ (id)entryEventPointDefinitionSpotlightHighlightsResult;
+ (id)entryEventPointDefinitionSpotlightWatchdogFired;
+ (id)entryEventPointDefinitionTerminusBTWake;
+ (id)entryEventPointDefinitionTestMarkers;
+ (id)entryEventPointDefinitionWeatherNotification;
+ (id)entryEventPointDefinitionWeatherNotificationState;
+ (id)entryEventPointDefinitions;
+ (id)entryEventPointDefinitionsBackgroundTransfer;
+ (id)entryEventPointDefinitionsSymptomsNetworkAdvisory;
+ (void)load;
- (BOOL)shouldLogAppActivationData;
- (NSDate)peekStartTime;
- (NSMutableDictionary)inferenceEntries;
- (NSMutableDictionary)localCache;
- (NSMutableDictionary)summarizationEntries;
- (PLCFNotificationOperatorComposition)gmsAvailablityListener;
- (PLCFNotificationOperatorComposition)gmsOptInListener;
- (PLCFNotificationOperatorComposition)ihaToggleListener;
- (PLEntry)lastDosimetryEntry;
- (PLEntryNotificationOperatorComposition)batteryLevelChangedNotifications;
- (PLNSNotificationOperatorComposition)MemoryWarningListener;
- (PLXPCAgent)init;
- (PLXPCListenerOperatorComposition)ADDListener;
- (PLXPCListenerOperatorComposition)AVConferenceXPCListener;
- (PLXPCListenerOperatorComposition)AccessoriesXPCListener;
- (PLXPCListenerOperatorComposition)AccessoryMotionXPCListener;
- (PLXPCListenerOperatorComposition)AirDropSessionXPCListener;
- (PLXPCListenerOperatorComposition)AirDropXPCListener;
- (PLXPCListenerOperatorComposition)AirPlayDiscoveryModeXPCListener;
- (PLXPCListenerOperatorComposition)AirTrafficAssetDownloadXPCListener;
- (PLXPCListenerOperatorComposition)AppAccessoriesXPCListener;
- (PLXPCListenerOperatorComposition)AppActivationPerformanceActivationDataXPCListener;
- (PLXPCListenerOperatorComposition)AppActivationPerformanceCPUStatisticsXPCListener;
- (PLXPCListenerOperatorComposition)AppActivationPerformanceMemoryStatisticsXPCListener;
- (PLXPCListenerOperatorComposition)AppActivationPerformancePowerStateStatisticsXPCListener;
- (PLXPCListenerOperatorComposition)AppActivationPerformanceProcessDataXPCListener;
- (PLXPCListenerOperatorComposition)AppleBacklightBrightnessXPCListener;
- (PLXPCListenerOperatorComposition)AttentionPollingXPCListener;
- (PLXPCListenerOperatorComposition)AttentionSamplingXPCListener;
- (PLXPCListenerOperatorComposition)AttentionServiceXPCListener;
- (PLXPCListenerOperatorComposition)AudioRoutingXPCListener;
- (PLXPCListenerOperatorComposition)AvailabilityModesXPCListener;
- (PLXPCListenerOperatorComposition)BackgroundTransfer;
- (PLXPCListenerOperatorComposition)CKKSSyncingEventXPCListener;
- (PLXPCListenerOperatorComposition)CPUViolationsXPCListener;
- (PLXPCListenerOperatorComposition)CacheDeleteXPCListener;
- (PLXPCListenerOperatorComposition)CallScreeningDurationListener;
- (PLXPCListenerOperatorComposition)CallScreeningEnabledListener;
- (PLXPCListenerOperatorComposition)CarPlayScreensXPCListener;
- (PLXPCListenerOperatorComposition)CarPlayXPCListener;
- (PLXPCListenerOperatorComposition)CloudKitXPCListener;
- (PLXPCListenerOperatorComposition)CommuteRefreshXPCListener;
- (PLXPCListenerOperatorComposition)CoreDuetKnowledgeSyncXPCListener;
- (PLXPCListenerOperatorComposition)DACalendarItemsDownloadedXPCListener;
- (PLXPCListenerOperatorComposition)DACalendarItemsUploadedXPCListener;
- (PLXPCListenerOperatorComposition)DASyncStartXPCListener;
- (PLXPCListenerOperatorComposition)DRMaxRateListener;
- (PLXPCListenerOperatorComposition)DeepScanReasonsXPCListener;
- (PLXPCListenerOperatorComposition)DosimetryXPCListener;
- (PLXPCListenerOperatorComposition)EnergyTelemetryXPCListener;
- (PLXPCListenerOperatorComposition)EnhancedDiscoveryXPCListener;
- (PLXPCListenerOperatorComposition)FocusFiltersXPCListener;
- (PLXPCListenerOperatorComposition)FrameCountXPCListener;
- (PLXPCListenerOperatorComposition)InCallServiceXPCListener;
- (PLXPCListenerOperatorComposition)KeyboardSessionXPCListener;
- (PLXPCListenerOperatorComposition)LayerCountXPCListener;
- (PLXPCListenerOperatorComposition)LinkAdvisoryXPCListener;
- (PLXPCListenerOperatorComposition)LocationVehicularDetectionXPCListener;
- (PLXPCListenerOperatorComposition)MXDiscoveryLevelXPCListener;
- (PLXPCListenerOperatorComposition)MachineTranslationXPCListener;
- (PLXPCListenerOperatorComposition)MailFetchXPCListener;
- (PLXPCListenerOperatorComposition)MobileBackupEventsXPCListener;
- (PLXPCListenerOperatorComposition)MobileBackupStatisticsXPCListener;
- (PLXPCListenerOperatorComposition)MotionWakeReasonXPCListener;
- (PLXPCListenerOperatorComposition)NanoMailSessionXPCListener;
- (PLXPCListenerOperatorComposition)NanoSiriXPCListener;
- (PLXPCListenerOperatorComposition)NavdXPCListener;
- (PLXPCListenerOperatorComposition)NetworkRelayBTLinkAssertionXPCListener;
- (PLXPCListenerOperatorComposition)NetworkRelayTerminusBTWakeXPCListener;
- (PLXPCListenerOperatorComposition)NetworkRelayWiFiAssertionXPCListener;
- (PLXPCListenerOperatorComposition)NetworkRelayXPCListener;
- (PLXPCListenerOperatorComposition)ODHNXPCListener;
- (PLXPCListenerOperatorComposition)ODOffXPCListener;
- (PLXPCListenerOperatorComposition)ODOnXPCListener;
- (PLXPCListenerOperatorComposition)OctagonTrustEventXPCListener;
- (PLXPCListenerOperatorComposition)PasskeyAuthenticationXPCListener;
- (PLXPCListenerOperatorComposition)PeekXPCListener;
- (PLXPCListenerOperatorComposition)PopXPCListener;
- (PLXPCListenerOperatorComposition)PortraitHighlightsResultXPCListener;
- (PLXPCListenerOperatorComposition)RCSSessionManagementXPCListener;
- (PLXPCListenerOperatorComposition)RapidSecurityResponseXPCListener;
- (PLXPCListenerOperatorComposition)RapportReceivedMessageXPCListener;
- (PLXPCListenerOperatorComposition)RenderPassCountXPCListener;
- (PLXPCListenerOperatorComposition)SOSKVSRateLimitingEventXPCListener;
- (PLXPCListenerOperatorComposition)SafariFetcherXPCListener;
- (PLXPCListenerOperatorComposition)SafariViewServiceXPCListener;
- (PLXPCListenerOperatorComposition)SecItemXPCListener;
- (PLXPCListenerOperatorComposition)SecondaryDisplayXPCListener;
- (PLXPCListenerOperatorComposition)ShortcutsTriggerFiredXPCListener;
- (PLXPCListenerOperatorComposition)SiriXPCListener;
- (PLXPCListenerOperatorComposition)SleepLockXPCListener;
- (PLXPCListenerOperatorComposition)SleepModeXPCListener;
- (PLXPCListenerOperatorComposition)SpatialAudioXPCListener;
- (PLXPCListenerOperatorComposition)SpotlightHighlightsResultXPCListener;
- (PLXPCListenerOperatorComposition)SpotlightIndexesXPCListener;
- (PLXPCListenerOperatorComposition)SpotlightQosXPCListener;
- (PLXPCListenerOperatorComposition)SpotlightQueriesXPCListener;
- (PLXPCListenerOperatorComposition)SpotlightWatchdogFiredXPCListener;
- (PLXPCListenerOperatorComposition)SymptomsNetworkAdvisory;
- (PLXPCListenerOperatorComposition)ThermalHiPXPCListener;
- (PLXPCListenerOperatorComposition)ThermalLevelXPCListener;
- (PLXPCListenerOperatorComposition)ThermalSensorsXPCListener;
- (PLXPCListenerOperatorComposition)UIKitActivityXPCListener;
- (PLXPCListenerOperatorComposition)UIKitAlertXPCListener;
- (PLXPCListenerOperatorComposition)UIKitEclipseXPCListener;
- (PLXPCListenerOperatorComposition)UIKitKeyboardXPCListener;
- (PLXPCListenerOperatorComposition)UbiquityAccountStatisticsXPCListener;
- (PLXPCListenerOperatorComposition)WeatherNotificationStateXPCListener;
- (PLXPCListenerOperatorComposition)WeatherNotificationXPCListener;
- (PLXPCListenerOperatorComposition)WebAppXPCListener;
- (PLXPCListenerOperatorComposition)WirelessSyncStartEventXPCListener;
- (PLXPCListenerOperatorComposition)WirelessSyncStopEventXPCListener;
- (PLXPCListenerOperatorComposition)accessoryUARPListener;
- (PLXPCListenerOperatorComposition)activeStylusXPCListener;
- (PLXPCListenerOperatorComposition)albumAnimationListener;
- (PLXPCListenerOperatorComposition)albumMotionListener;
- (PLXPCListenerOperatorComposition)animatedStickerCreationListener;
- (PLXPCListenerOperatorComposition)animatedStickerScoringListener;
- (PLXPCListenerOperatorComposition)appleDiffusionListener;
- (PLXPCListenerOperatorComposition)assetLoadGFListener;
- (PLXPCListenerOperatorComposition)fileResidentInfoListener;
- (PLXPCListenerOperatorComposition)groupActivitiesXPCListener;
- (PLXPCListenerOperatorComposition)handwritingInferenceListener;
- (PLXPCListenerOperatorComposition)instanceModelLoadListener;
- (PLXPCListenerOperatorComposition)instanceModelUnLoadListener;
- (PLXPCListenerOperatorComposition)keyboardTrackpadXPCListener;
- (PLXPCListenerOperatorComposition)mailCategorizationListener;
- (PLXPCListenerOperatorComposition)mmExecuteRequestListener;
- (PLXPCListenerOperatorComposition)modelCompilationListener;
- (PLXPCListenerOperatorComposition)modelInferenceListener;
- (PLXPCListenerOperatorComposition)modelLoadListener;
- (PLXPCListenerOperatorComposition)modelUnLoadListener;
- (PLXPCListenerOperatorComposition)momentsDeferredProcessingListener;
- (PLXPCListenerOperatorComposition)passiveStylusXPCListener;
- (PLXPCListenerOperatorComposition)relevanceContextUpdateXPCListener;
- (PLXPCListenerOperatorComposition)siriFalseAlarm;
- (PLXPCListenerOperatorComposition)smartReplySessionListener;
- (PLXPCListenerOperatorComposition)staticStickerCreationListener;
- (PLXPCListenerOperatorComposition)staticStickerScoringListener;
- (PLXPCListenerOperatorComposition)summarizationListener;
- (PLXPCListenerOperatorComposition)telNotificationXPCListener;
- (PLXPCListenerOperatorComposition)testMarkerXPCListener;
- (PLXPCListenerOperatorComposition)tgiExecuteRequestListener;
- (PLXPCListenerOperatorComposition)userSafetyProcessing;
- (PLXPCListenerOperatorComposition)vkDataScannerListener;
- (PLXPCListenerOperatorComposition)voicemailDurationListener;
- (PLXPCListenerOperatorComposition)watchPresenceXPCListener;
- (PLXPCResponderOperatorComposition)entryRequestResponder;
- (PLXPCResponderOperatorComposition)taskModeQueryResponder;
- (double)lastSBCupdateTimestamp;
- (double)peekDuration;
- (id)entryRequestResponseForPayload:(id)a3;
- (int)convertPixelCount:(int)a3;
- (int)lastLinearBrightness;
- (int)mapAvailabilityModeSemanticType:(int64_t)a3;
- (int64_t)SOSKVSEntries;
- (int64_t)accessoryUARPEntryCount;
- (int64_t)eventNameStringToEnum:(id)a3;
- (int64_t)mapPixelsToBucket:(unint64_t)a3;
- (int64_t)modeTypeStringToEnum:(id)a3;
- (int64_t)peekCount;
- (int64_t)peekpopProcessID;
- (int64_t)popCount;
- (unint64_t)convertAirDropSessionState:(id)a3;
- (void)createAccessoryAccountingEventWithName:(id)a3 isStartEvent:(BOOL)a4;
- (void)createAirDropAccountingEvent:(id)a3;
- (void)createInCallServiceAccountingEvent:(id)a3;
- (void)distributeBundleIDEntriesToWeight:(id)a3 toDistributionID:(int)a4;
- (void)handleCKKSSyncingEvent:(id)a3;
- (void)handleSBCNotificationWithUserInfo:(id)a3;
- (void)initOperatorDependancies;
- (void)initTaskOperatorDependancies;
- (void)log;
- (void)logAlbumAnimation:(id)a3;
- (void)logAlbumMotion:(id)a3;
- (void)logEventAggregateTelNotification:(id)a3;
- (void)logEventBackwardAVConference:(id)a3;
- (void)logEventBackwardActiveStylus:(id)a3;
- (void)logEventBackwardAttentionPolling:(id)a3;
- (void)logEventBackwardAttentionSampling:(id)a3;
- (void)logEventBackwardAttentionService:(id)a3;
- (void)logEventBackwardCallScreeningDuration:(id)a3;
- (void)logEventBackwardDRMaxRate:(id)a3;
- (void)logEventBackwardEnergyTelemetry:(id)a3;
- (void)logEventBackwardFrameCount:(id)a3;
- (void)logEventBackwardKeyboardSession:(id)a3;
- (void)logEventBackwardKeyboardTrackpad:(id)a3;
- (void)logEventBackwardLayerCount:(id)a3;
- (void)logEventBackwardNamePeek:(id)a3;
- (void)logEventBackwardNamePop:(id)a3;
- (void)logEventBackwardNameSpotlightQos:(id)a3;
- (void)logEventBackwardODHN:(id)a3;
- (void)logEventBackwardODOff:(id)a3;
- (void)logEventBackwardODOn:(id)a3;
- (void)logEventBackwardPassiveStylus:(id)a3;
- (void)logEventBackwardRenderPassCount:(id)a3;
- (void)logEventBackwardSiriFalseAlarm:(id)a3;
- (void)logEventBackwardUbiquityAccountStatistics:(id)a3;
- (void)logEventBackwardVoicemailDuration:(id)a3;
- (void)logEventEventPointRCSSessionManagement:(id)a3;
- (void)logEventForwardAccessory:(id)a3;
- (void)logEventForwardAccessoryMotion:(id)a3;
- (void)logEventForwardAirDrop:(id)a3;
- (void)logEventForwardAirDropSession:(id)a3;
- (void)logEventForwardAppAccessory:(id)a3;
- (void)logEventForwardAppleBackklightBrightness:(id)a3;
- (void)logEventForwardAppleDiffusion:(id)a3;
- (void)logEventForwardAssetLoadGF:(id)a3;
- (void)logEventForwardAudioRouting:(id)a3;
- (void)logEventForwardAvailabilityModes:(id)a3;
- (void)logEventForwardCallScreeningEnabled:(id)a3;
- (void)logEventForwardCarPlay:(id)a3;
- (void)logEventForwardCarPlayScreens:(id)a3;
- (void)logEventForwardDosimetry:(id)a3;
- (void)logEventForwardEnhancedDiscovery:(id)a3;
- (void)logEventForwardGMSOptIn;
- (void)logEventForwardHandwritingInference:(id)a3;
- (void)logEventForwardIHA;
- (void)logEventForwardInCallService:(id)a3;
- (void)logEventForwardLinkAdvisory:(id)a3;
- (void)logEventForwardMMExecuteRequest:(id)a3;
- (void)logEventForwardMXDiscoveryLevel:(id)a3;
- (void)logEventForwardNetworkRelay:(id)a3;
- (void)logEventForwardNetworkRelayWiFiAssertion:(id)a3;
- (void)logEventForwardPasskeyAuthentication:(id)a3;
- (void)logEventForwardRapidSecurityResponse:(id)a3;
- (void)logEventForwardRelevanceContextUpdate:(id)a3;
- (void)logEventForwardSOSKVSRateLimitingEvent:(id)a3;
- (void)logEventForwardSafariFetcherStatus:(id)a3;
- (void)logEventForwardSecondaryDisplay:(id)a3;
- (void)logEventForwardSiri:(id)a3;
- (void)logEventForwardSleepMode:(id)a3;
- (void)logEventForwardSmartReplySession:(id)a3;
- (void)logEventForwardSpatialAudio:(id)a3;
- (void)logEventForwardSummarization:(id)a3;
- (void)logEventForwardTGIExecuteRequest:(id)a3;
- (void)logEventForwardThermalHiP:(id)a3;
- (void)logEventForwardThermalLevel:(id)a3;
- (void)logEventForwardThermalSensors:(id)a3;
- (void)logEventForwardUIKitActivity:(id)a3;
- (void)logEventForwardUIKitAlert:(id)a3;
- (void)logEventForwardUIKitEclipse:(id)a3;
- (void)logEventForwardUIKitKeyboard:(id)a3;
- (void)logEventForwardWatchPresence:(id)a3;
- (void)logEventForwardWebApp:(id)a3;
- (void)logEventForwardWirelessSync:(id)a3;
- (void)logEventFowardUARPStatus:(id)a3;
- (void)logEventIntervalAirTrafficAssetDownload:(id)a3;
- (void)logEventIntervalAnimatedStickerCreation:(id)a3;
- (void)logEventIntervalAnimatedStickerScoring:(id)a3;
- (void)logEventIntervalCoreDuetKnowledgeSync:(id)a3;
- (void)logEventIntervalEndCPUViolations:(id)a3;
- (void)logEventIntervalGroupActivities:(id)a3;
- (void)logEventIntervalMomentsDeferredProcessing:(id)a3;
- (void)logEventIntervalNameSpotlightIndexes:(id)a3;
- (void)logEventIntervalNameSpotlightQueries:(id)a3;
- (void)logEventIntervalRapportReceivedMessage:(id)a3;
- (void)logEventIntervalStaticStickerCreation:(id)a3;
- (void)logEventIntervalStaticStickerScoring:(id)a3;
- (void)logEventIntervalUserSafetyProcessing:(id)a3;
- (void)logEventIntervalVKDataScanner:(id)a3;
- (void)logEventPointADD:(id)a3;
- (void)logEventPointANE:(id)a3 withCategory:(id)a4;
- (void)logEventPointAirPlayDiscoveryMode:(id)a3;
- (void)logEventPointAppActivationPerformanceActivationData:(id)a3;
- (void)logEventPointAppActivationPerformanceCPUStatistics:(id)a3;
- (void)logEventPointAppActivationPerformanceMemoryStatistics:(id)a3;
- (void)logEventPointAppActivationPerformancePowerStateStatistics:(id)a3;
- (void)logEventPointAppActivationPerformanceProcessData:(id)a3;
- (void)logEventPointBackgroundTransfer:(id)a3;
- (void)logEventPointCacheDelete:(id)a3;
- (void)logEventPointCloudKit:(id)a3;
- (void)logEventPointCommuteRefreshSession:(id)a3;
- (void)logEventPointDACalendarItemsDownloaded:(id)a3;
- (void)logEventPointDACalendarItemsUploaded:(id)a3;
- (void)logEventPointDASyncStart:(id)a3;
- (void)logEventPointDeepScanReasons:(id)a3;
- (void)logEventPointFocusFilters:(id)a3;
- (void)logEventPointJetsam:(unint64_t)a3;
- (void)logEventPointLocationVehicularDetectionSession:(id)a3;
- (void)logEventPointMachineTranslation:(id)a3;
- (void)logEventPointMailFetch:(id)a3;
- (void)logEventPointMobileBackupEvents:(id)a3;
- (void)logEventPointMobileBackupStatistics:(id)a3;
- (void)logEventPointMotionWakeReasonSession:(id)a3;
- (void)logEventPointNamePortraitHighlightsResult:(id)a3;
- (void)logEventPointNameSpotlightHighlightsResult:(id)a3;
- (void)logEventPointNameSpotlightWatchdogFired:(id)a3;
- (void)logEventPointNanoMailSession:(id)a3;
- (void)logEventPointNavd:(id)a3;
- (void)logEventPointNavdGeoNetworkActivity:(id)a3;
- (void)logEventPointNavdMapsNavigationStateEvent:(id)a3;
- (void)logEventPointNavdMapsWidgetSession:(id)a3;
- (void)logEventPointNetworkRelayBTLinkAssertion:(id)a3;
- (void)logEventPointNetworkRelayTerminusBTWake:(id)a3;
- (void)logEventPointNetworkSymptomsAdviosry:(id)a3;
- (void)logEventPointOctagonTrustEvent:(id)a3;
- (void)logEventPointSecItemSession:(id)a3;
- (void)logEventPointShortcutsTriggerFired:(id)a3;
- (void)logEventPointSiriActivation:(id)a3;
- (void)logEventPointSleepLock:(id)a3;
- (void)logEventPointTestMarker:(id)a3;
- (void)logEventPointWeatherNotification:(id)a3;
- (void)logEventPointWeatherNotificationState:(id)a3;
- (void)logFileResidentInfo:(id)a3;
- (void)logMailCategorization:(id)a3;
- (void)logNetworkActivity:(id)a3 withEntryKey:(id)a4;
- (void)setADDListener:(id)a3;
- (void)setAVConferenceXPCListener:(id)a3;
- (void)setAccessoriesXPCListener:(id)a3;
- (void)setAccessoryMotionXPCListener:(id)a3;
- (void)setAccessoryUARPEntryCount:(int64_t)a3;
- (void)setAccessoryUARPListener:(id)a3;
- (void)setActiveStylusXPCListener:(id)a3;
- (void)setAirDropSessionXPCListener:(id)a3;
- (void)setAirDropXPCListener:(id)a3;
- (void)setAirPlayDiscoveryModeXPCListener:(id)a3;
- (void)setAirTrafficAssetDownloadXPCListener:(id)a3;
- (void)setAlbumAnimationListener:(id)a3;
- (void)setAlbumMotionListener:(id)a3;
- (void)setAnimatedStickerCreationListener:(id)a3;
- (void)setAnimatedStickerScoringListener:(id)a3;
- (void)setAppAccessoriesXPCListener:(id)a3;
- (void)setAppActivationPerformanceActivationDataXPCListener:(id)a3;
- (void)setAppActivationPerformanceCPUStatisticsXPCListener:(id)a3;
- (void)setAppActivationPerformanceMemoryStatisticsXPCListener:(id)a3;
- (void)setAppActivationPerformancePowerStateStatisticsXPCListener:(id)a3;
- (void)setAppActivationPerformanceProcessDataXPCListener:(id)a3;
- (void)setAppleBacklightBrightnessXPCListener:(id)a3;
- (void)setAppleDiffusionListener:(id)a3;
- (void)setAssetLoadGFListener:(id)a3;
- (void)setAttentionPollingXPCListener:(id)a3;
- (void)setAttentionSamplingXPCListener:(id)a3;
- (void)setAttentionServiceXPCListener:(id)a3;
- (void)setAudioRoutingXPCListener:(id)a3;
- (void)setAvailabilityModesXPCListener:(id)a3;
- (void)setBackgroundTransfer:(id)a3;
- (void)setBatteryLevelChangedNotifications:(id)a3;
- (void)setCKKSSyncingEventXPCListener:(id)a3;
- (void)setCPUViolationsXPCListener:(id)a3;
- (void)setCacheDeleteXPCListener:(id)a3;
- (void)setCallScreeningDurationListener:(id)a3;
- (void)setCallScreeningEnabledListener:(id)a3;
- (void)setCarPlayScreensXPCListener:(id)a3;
- (void)setCarPlayXPCListener:(id)a3;
- (void)setCloudKitXPCListener:(id)a3;
- (void)setCommuteRefreshXPCListener:(id)a3;
- (void)setCoreDuetKnowledgeSyncXPCListener:(id)a3;
- (void)setDACalendarItemsDownloadedXPCListener:(id)a3;
- (void)setDACalendarItemsUploadedXPCListener:(id)a3;
- (void)setDASyncStartXPCListener:(id)a3;
- (void)setDRMaxRateListener:(id)a3;
- (void)setDeepScanReasonsXPCListener:(id)a3;
- (void)setDosimetryXPCListener:(id)a3;
- (void)setEnergyTelemetryXPCListener:(id)a3;
- (void)setEnhancedDiscoveryXPCListener:(id)a3;
- (void)setEntryRequestResponder:(id)a3;
- (void)setFileResidentInfoListener:(id)a3;
- (void)setFocusFiltersXPCListener:(id)a3;
- (void)setFrameCountXPCListener:(id)a3;
- (void)setGmsAvailablityListener:(id)a3;
- (void)setGmsOptInListener:(id)a3;
- (void)setGroupActivitiesXPCListener:(id)a3;
- (void)setHandwritingInferenceListener:(id)a3;
- (void)setIhaToggleListener:(id)a3;
- (void)setInCallServiceXPCListener:(id)a3;
- (void)setInferenceEntries:(id)a3;
- (void)setInferenceEntriesWithBundleID:(id)a3 inferenceStart:(double)a4 inferenceEnd:(double)a5;
- (void)setInstanceModelLoadListener:(id)a3;
- (void)setInstanceModelUnLoadListener:(id)a3;
- (void)setKeyboardSessionXPCListener:(id)a3;
- (void)setKeyboardTrackpadXPCListener:(id)a3;
- (void)setLastDosimetryEntry:(id)a3;
- (void)setLastLinearBrightness:(int)a3;
- (void)setLastSBCupdateTimestamp:(double)a3;
- (void)setLayerCountXPCListener:(id)a3;
- (void)setLinkAdvisoryXPCListener:(id)a3;
- (void)setLocalCache:(id)a3;
- (void)setLocationVehicularDetectionXPCListener:(id)a3;
- (void)setMXDiscoveryLevelXPCListener:(id)a3;
- (void)setMachineTranslationXPCListener:(id)a3;
- (void)setMailCategorizationListener:(id)a3;
- (void)setMailFetchXPCListener:(id)a3;
- (void)setMemoryWarningListener:(id)a3;
- (void)setMmExecuteRequestListener:(id)a3;
- (void)setMobileBackupEventsXPCListener:(id)a3;
- (void)setMobileBackupStatisticsXPCListener:(id)a3;
- (void)setModelCompilationListener:(id)a3;
- (void)setModelInferenceListener:(id)a3;
- (void)setModelLoadListener:(id)a3;
- (void)setModelUnLoadListener:(id)a3;
- (void)setMomentsDeferredProcessingListener:(id)a3;
- (void)setMotionWakeReasonXPCListener:(id)a3;
- (void)setNanoMailSessionXPCListener:(id)a3;
- (void)setNanoSiriXPCListener:(id)a3;
- (void)setNavdXPCListener:(id)a3;
- (void)setNetworkRelayBTLinkAssertionXPCListener:(id)a3;
- (void)setNetworkRelayTerminusBTWakeXPCListener:(id)a3;
- (void)setNetworkRelayWiFiAssertionXPCListener:(id)a3;
- (void)setNetworkRelayXPCListener:(id)a3;
- (void)setODHNXPCListener:(id)a3;
- (void)setODOffXPCListener:(id)a3;
- (void)setODOnXPCListener:(id)a3;
- (void)setOctagonTrustEventXPCListener:(id)a3;
- (void)setPassiveStylusXPCListener:(id)a3;
- (void)setPasskeyAuthenticationXPCListener:(id)a3;
- (void)setPeekCount:(int64_t)a3;
- (void)setPeekDuration:(double)a3;
- (void)setPeekStartTime:(id)a3;
- (void)setPeekXPCListener:(id)a3;
- (void)setPeekpopProcessID:(int64_t)a3;
- (void)setPopCount:(int64_t)a3;
- (void)setPopXPCListener:(id)a3;
- (void)setPortraitHighlightsResultXPCListener:(id)a3;
- (void)setRCSSessionManagementXPCListener:(id)a3;
- (void)setRapidSecurityResponseXPCListener:(id)a3;
- (void)setRapportReceivedMessageXPCListener:(id)a3;
- (void)setRelevanceContextUpdateXPCListener:(id)a3;
- (void)setRenderPassCountXPCListener:(id)a3;
- (void)setSOSKVSEntries:(int64_t)a3;
- (void)setSOSKVSRateLimitingEventXPCListener:(id)a3;
- (void)setSafariFetcherXPCListener:(id)a3;
- (void)setSafariViewServiceXPCListener:(id)a3;
- (void)setSecItemXPCListener:(id)a3;
- (void)setSecondaryDisplayXPCListener:(id)a3;
- (void)setShortcutsTriggerFiredXPCListener:(id)a3;
- (void)setSiriFalseAlarm:(id)a3;
- (void)setSiriXPCListener:(id)a3;
- (void)setSleepLockXPCListener:(id)a3;
- (void)setSleepModeXPCListener:(id)a3;
- (void)setSmartReplySessionListener:(id)a3;
- (void)setSpatialAudioXPCListener:(id)a3;
- (void)setSpotlightHighlightsResultXPCListener:(id)a3;
- (void)setSpotlightIndexesXPCListener:(id)a3;
- (void)setSpotlightQosXPCListener:(id)a3;
- (void)setSpotlightQueriesXPCListener:(id)a3;
- (void)setSpotlightWatchdogFiredXPCListener:(id)a3;
- (void)setStaticStickerCreationListener:(id)a3;
- (void)setStaticStickerScoringListener:(id)a3;
- (void)setSummarizationEntries:(id)a3;
- (void)setSummarizationListener:(id)a3;
- (void)setSymptomsNetworkAdvisory:(id)a3;
- (void)setTaskModeQueryResponder:(id)a3;
- (void)setTelNotificationXPCListener:(id)a3;
- (void)setTestMarkerXPCListener:(id)a3;
- (void)setTgiExecuteRequestListener:(id)a3;
- (void)setThermalHiPXPCListener:(id)a3;
- (void)setThermalLevelXPCListener:(id)a3;
- (void)setThermalSensorsXPCListener:(id)a3;
- (void)setUIKitActivityXPCListener:(id)a3;
- (void)setUIKitAlertXPCListener:(id)a3;
- (void)setUIKitEclipseXPCListener:(id)a3;
- (void)setUIKitKeyboardXPCListener:(id)a3;
- (void)setUbiquityAccountStatisticsXPCListener:(id)a3;
- (void)setUserSafetyProcessing:(id)a3;
- (void)setVkDataScannerListener:(id)a3;
- (void)setVoicemailDurationListener:(id)a3;
- (void)setWatchPresenceXPCListener:(id)a3;
- (void)setWeatherNotificationStateXPCListener:(id)a3;
- (void)setWeatherNotificationXPCListener:(id)a3;
- (void)setWebAppXPCListener:(id)a3;
- (void)setWirelessSyncStartEventXPCListener:(id)a3;
- (void)setWirelessSyncStopEventXPCListener:(id)a3;
@end

@implementation PLXPCAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLXPCAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return &unk_1F400FBC8;
}

+ (BOOL)shouldLogiOSWatchOSOnly
{
  if (shouldLogiOSWatchOSOnly_onceToken != -1) {
    dispatch_once(&shouldLogiOSWatchOSOnly_onceToken, &__block_literal_global_855);
  }
  return shouldLogiOSWatchOSOnly_result;
}

uint64_t __37__PLXPCAgent_shouldLogiOSWatchOSOnly__block_invoke()
{
  if ([MEMORY[0x1E4F92A38] isiOS]) {
    uint64_t result = 1;
  }
  else {
    uint64_t result = [MEMORY[0x1E4F92A38] isWatch];
  }
  shouldLogiOSWatchOSOnly_uint64_t result = result;
  return result;
}

+ (id)entryEventPointDefinitions
{
  v50[44] = *MEMORY[0x1E4F143B8];
  v49[0] = @"TestMarker";
  v48 = [a1 entryEventPointDefinitionTestMarkers];
  v50[0] = v48;
  v49[1] = @"DASyncStart";
  v47 = [a1 entryEventPointDefinitionDASyncStart];
  v50[1] = v47;
  v49[2] = @"MailFetch";
  v46 = [a1 entryEventPointDefinitionMailFetch];
  v50[2] = v46;
  v49[3] = @"NanoMailSession";
  v45 = [a1 entryEventPointDefinitionNanoMailSession];
  v50[3] = v45;
  v49[4] = @"Jetsam";
  v44 = [a1 entryEventPointDefinitionJetsam];
  v50[4] = v44;
  v49[5] = @"Symptoms-NetworkAdvisory";
  v43 = [a1 entryEventPointDefinitionsSymptomsNetworkAdvisory];
  v50[5] = v43;
  v49[6] = @"BackgroundTransfer";
  v42 = [a1 entryEventPointDefinitionsBackgroundTransfer];
  v50[6] = v42;
  v49[7] = @"MobileBackupStatistics";
  v41 = [a1 entryEventPointDefinitionMobileBackupStatistics];
  v50[7] = v41;
  v49[8] = @"MobileBackupEvents";
  v40 = [a1 entryEventPointDefinitionMobileBackupEvents];
  v50[8] = v40;
  v49[9] = @"CloudKit";
  v39 = [a1 entryEventPointDefinitionCloudKit];
  v50[9] = v39;
  v49[10] = @"NetworkEnergyModel";
  v38 = [a1 entryEventPointDefinitionNetworkEnergyModel];
  v50[10] = v38;
  v49[11] = @"CacheDelete";
  v37 = [a1 entryEventPointDefinitionCacheDelete];
  v50[11] = v37;
  v49[12] = @"MachineTranslation";
  v36 = [a1 entryEventPointDefinitionMachineTranslation];
  v50[12] = v36;
  v49[13] = @"DeepScanReasons";
  v35 = [a1 entryEventPointDefinitionDeepScanReasons];
  v50[13] = v35;
  v49[14] = @"AppActivationPerformanceActivationData";
  v34 = [a1 entryEventPointDefinitionAppActivationPerformanceActivationData];
  v50[14] = v34;
  v49[15] = @"AppActivationPerformanceProcessData";
  v33 = [a1 entryEventPointDefinitionAppActivationPerformanceProcessData];
  v50[15] = v33;
  v49[16] = @"AppActivationPerformanceCPUStatistics";
  v32 = [a1 entryEventPointDefinitionAppActivationPerformanceCPUStatistics];
  v50[16] = v32;
  v49[17] = @"AppActivationPerformanceMemoryStatistics";
  v31 = [a1 entryEventPointDefinitionAppActivationPerformanceMemoryStatistics];
  v50[17] = v31;
  v49[18] = @"AppActivationPerformancePowerStateStatistics";
  v30 = [a1 entryEventPointDefinitionAppActivationPerformancePowerStateStatistics];
  v50[18] = v30;
  v49[19] = @"OctagonTrust";
  v29 = [a1 entryEventPointDefinitionOctagonTrust];
  v50[19] = v29;
  v49[20] = @"CKKSSyncingRateLimit";
  v28 = [a1 entryEventPointDefinitionCKKSSyncingRateLimit];
  v50[20] = v28;
  v49[21] = @"ShortcutsTriggerFired";
  v27 = [a1 entryEventPointDefinitionShortcutsTriggerFired];
  v50[21] = v27;
  v49[22] = @"NetworkRelayBTLinkAssertion";
  v26 = [a1 entryEventPointDefinitionNetworkRelayBTLinkAssertion];
  v50[22] = v26;
  v49[23] = @"SleepLock";
  v25 = [a1 entryEventPointDefinitionSleepLock];
  v50[23] = v25;
  v49[24] = @"WeatherNotificationState";
  v24 = [a1 entryEventPointDefinitionWeatherNotificationState];
  v50[24] = v24;
  v49[25] = @"WeatherNotification";
  v23 = [a1 entryEventPointDefinitionWeatherNotification];
  v50[25] = v23;
  v49[26] = @"TerminusBTWake";
  v22 = [a1 entryEventPointDefinitionTerminusBTWake];
  v50[26] = v22;
  v49[27] = @"PortraitHighlightsResult";
  v21 = [a1 entryEventPointDefinitioPortraitHighlightsResult];
  v50[27] = v21;
  v49[28] = @"SpotlightHighlightsResult";
  v20 = [a1 entryEventPointDefinitionSpotlightHighlightsResult];
  v50[28] = v20;
  v49[29] = @"FocusFilters";
  v19 = [a1 entryEventPointDefinitionFocusFilters];
  v50[29] = v19;
  v49[30] = @"DACalendarItemsDownloaded";
  v18 = [a1 entryEventPointDefinitionDACalendarItemsDownloaded];
  v50[30] = v18;
  v49[31] = @"DACalendarItemsUploaded";
  v17 = [a1 entryEventPointDefinitionDACalendarItemsUploaded];
  v50[31] = v17;
  v49[32] = @"navd";
  v16 = [a1 entryEventPointDefinitionNavd];
  v50[32] = v16;
  v49[33] = @"MapsWidgetSession";
  v15 = [a1 entryEventPointDefinitionNavdMapsWidgetSession];
  v50[33] = v15;
  v49[34] = @"GEONetworkActivity";
  v3 = [a1 entryEventPointDefinitionNavdGeoNetworkActivity];
  v50[34] = v3;
  v49[35] = @"MapsNavigationStateEvent";
  v4 = [a1 entryEventPointDefinitionNavdMapsNavigationStateEvent];
  v50[35] = v4;
  v49[36] = @"VehicularDetection";
  v5 = [a1 entryEventPointDefinitionLocationVehicularDetection];
  v50[36] = v5;
  v49[37] = @"MotionWakeReason";
  v6 = [a1 entryEventPointDefinitionMotionWakeReason];
  v50[37] = v6;
  v49[38] = @"CommuteRefresh";
  v7 = [a1 entryEventPointDefinitionCommuteRefresh];
  v50[38] = v7;
  v49[39] = @"SecItem";
  v8 = [a1 entryEventPointDefinitionSecItem];
  v50[39] = v8;
  v49[40] = @"SiriActivation";
  v9 = [a1 entryEventPointDefinitionSiriActivication];
  v50[40] = v9;
  v49[41] = @"SpotlightWatchdogFired";
  v10 = [a1 entryEventPointDefinitionSpotlightWatchdogFired];
  v50[41] = v10;
  v49[42] = @"AirPlayDiscoveryMode";
  v11 = [a1 entryEventPointDefinitionAirPlayDiscoveryMode];
  v50[42] = v11;
  v49[43] = @"ADD";
  v12 = [a1 entryEventPointDefinitionADD];
  v50[43] = v12;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:44];

  return v14;
}

+ (id)entryEventPointDefinitionADD
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v16[0] = *MEMORY[0x1E4F92C50];
  uint64_t v14 = *MEMORY[0x1E4F92CD0];
  v15 = &unk_1F4012078;
  objc_super v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v17[0] = v2;
  v16[1] = *MEMORY[0x1E4F92CA8];
  v12[0] = @"APWakeReason";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v13[0] = v4;
  v12[1] = @"reasonStartTimestamp";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v13[1] = v6;
  v12[2] = @"reasonEndTimestamp";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v13[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  v17[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  return v10;
}

+ (id)entryEventPointDefinitionWeatherNotificationState
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = *MEMORY[0x1E4F92C50];
  uint64_t v12 = *MEMORY[0x1E4F92CD0];
  v13 = &unk_1F4012078;
  objc_super v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E4F92CA8];
  v10[0] = @"severeNotificationEnabled";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_BoolFormat");
  v10[1] = @"precipitationNotificationEnabled";
  v11[0] = v4;
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_BoolFormat");
  v11[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v15[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v8;
}

+ (id)entryEventPointDefinitionWeatherNotification
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v18[0] = *MEMORY[0x1E4F92C50];
  uint64_t v16 = *MEMORY[0x1E4F92CD0];
  v17 = &unk_1F4012088;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  v19[0] = v13;
  v18[1] = *MEMORY[0x1E4F92CA8];
  v14[0] = @"channels";
  objc_super v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v15[0] = v3;
  v14[1] = @"totalRelevantAlerts";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v15[1] = v5;
  void v14[2] = @"totalPushes";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v15[2] = v7;
  v14[3] = @"totalNotifications";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  void v15[3] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  v19[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];

  return v11;
}

+ (id)entryEventPointDefinitionSleepLock
{
  void v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F4012078;
  v12[1] = MEMORY[0x1E4F1CC28];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  v9 = @"state";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventPointDefinitionNetworkRelayBTLinkAssertion
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = *MEMORY[0x1E4F92C50];
  uint64_t v12 = *MEMORY[0x1E4F92CD0];
  v13 = &unk_1F4012078;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E4F92CA8];
  v10[0] = @"client";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  v10[1] = @"type";
  v11[0] = v4;
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v11[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v15[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v8;
}

+ (id)entryEventPointDefinitionTerminusBTWake
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = *MEMORY[0x1E4F92C50];
  uint64_t v12 = *MEMORY[0x1E4F92CD0];
  v13 = &unk_1F4012078;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E4F92CA8];
  v10[0] = @"seqNo";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v10[1] = @"spi";
  v11[0] = v4;
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v11[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v15[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v8;
}

+ (id)entryEventPointDefinitioPortraitHighlightsResult
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v19[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v17[0] = *MEMORY[0x1E4F92CD0];
  v17[1] = v2;
  v18[0] = &unk_1F4012078;
  v18[1] = MEMORY[0x1E4F1CC38];
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E4F92CA8];
  v15[0] = @"BundleID";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_StringFormat_withBundleID");
  v16[0] = v4;
  v15[1] = @"limit";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v16[1] = v6;
  v15[2] = @"portraitResultCount";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  void v16[2] = v8;
  void v15[3] = @"portraitCacheDate";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_DateFormat");
  v16[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
  v20[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

  return v12;
}

+ (id)entryEventPointDefinitionSpotlightHighlightsResult
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F4012078;
  v14[1] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"BundleID";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat_withBundleID");
  v11[1] = @"spotlightResultCount";
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventPointDefinitionFocusFilters
{
  void v19[2] = *MEMORY[0x1E4F143B8];
  v18[0] = *MEMORY[0x1E4F92C50];
  uint64_t v16 = *MEMORY[0x1E4F92CD0];
  v17 = &unk_1F4012078;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  v19[0] = v13;
  v18[1] = *MEMORY[0x1E4F92CA8];
  v14[0] = @"ExtensionCount";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v15[0] = v3;
  v14[1] = @"Reason";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v15[1] = v5;
  void v14[2] = @"Source";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  void v15[2] = v7;
  void v14[3] = @"SemanticType";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  void v15[3] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  v19[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];

  return v11;
}

+ (id)entryEventPointDefinitionNetworkEnergyModel
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventPointDefinitionDASyncStart
{
  void v18[2] = *MEMORY[0x1E4F143B8];
  if (+[PLXPCAgent shouldLogiOSWatchOSOnly])
  {
    v17[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB8];
    v15[0] = *MEMORY[0x1E4F92CD0];
    v15[1] = v2;
    v16[0] = &unk_1F4012078;
    v16[1] = MEMORY[0x1E4F1CC28];
    v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
    v18[0] = v3;
    v17[1] = *MEMORY[0x1E4F92CA8];
    v13[0] = @"AccountClass";
    v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
    v14[0] = v5;
    v13[1] = @"AccountID";
    v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
    v14[1] = v7;
    void v13[2] = @"AccountName";
    v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    v9 = objc_msgSend(v8, "commonTypeDict_StringFormat");
    void v14[2] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
    v18[1] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (id)entryEventPointDefinitionDACalendarItemsDownloaded
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v21[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v19[0] = *MEMORY[0x1E4F92CD0];
  v19[1] = v2;
  v20[0] = &unk_1F4012078;
  v20[1] = MEMORY[0x1E4F1CC28];
  void v19[2] = *MEMORY[0x1E4F92CE8];
  v20[2] = MEMORY[0x1E4F1CC38];
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E4F92CA8];
  v17[0] = @"AccountClass";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_StringFormat");
  v18[0] = v14;
  v17[1] = @"AccountID";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  v18[1] = v4;
  void v17[2] = @"AccountName";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_StringFormat");
  void v18[2] = v6;
  void v17[3] = @"ContainerID";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_StringFormat");
  void v18[3] = v8;
  v17[4] = @"NumberOfItemsChanged";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v18[4] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
  v22[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];

  return v12;
}

+ (id)entryEventPointDefinitionDACalendarItemsUploaded
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v21[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v19[0] = *MEMORY[0x1E4F92CD0];
  v19[1] = v2;
  v20[0] = &unk_1F4012078;
  v20[1] = MEMORY[0x1E4F1CC28];
  void v19[2] = *MEMORY[0x1E4F92CE8];
  v20[2] = MEMORY[0x1E4F1CC38];
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E4F92CA8];
  v17[0] = @"AccountClass";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_StringFormat");
  v18[0] = v14;
  v17[1] = @"AccountID";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  v18[1] = v4;
  void v17[2] = @"AccountName";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_StringFormat");
  void v18[2] = v6;
  void v17[3] = @"ContainerID";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_StringFormat");
  void v18[3] = v8;
  v17[4] = @"NumberOfItemsChanged";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v18[4] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
  v22[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];

  return v12;
}

+ (id)entryEventPointDefinitionMailFetch
{
  v24[2] = *MEMORY[0x1E4F143B8];
  v23[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v21[0] = *MEMORY[0x1E4F92CD0];
  v21[1] = v2;
  v22[0] = &unk_1F4012078;
  v22[1] = MEMORY[0x1E4F1CC28];
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  v24[0] = v18;
  v23[1] = *MEMORY[0x1E4F92CA8];
  v19[0] = @"account";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_StringFormat");
  v20[0] = v16;
  v19[1] = @"cause";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_StringFormat");
  v20[1] = v14;
  void v19[2] = @"duration";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  v20[2] = v4;
  void v19[3] = @"rx";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  void v20[3] = v6;
  v19[4] = @"tx";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v20[4] = v8;
  v19[5] = @"wifi";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_BoolFormat");
  v20[5] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:6];
  v24[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];

  return v12;
}

+ (id)entryEventPointDefinitionNanoMailSession
{
  v20[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isWatch])
  {
    v19[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB8];
    v17[0] = *MEMORY[0x1E4F92CD0];
    v17[1] = v2;
    v18[0] = &unk_1F4012078;
    v18[1] = MEMORY[0x1E4F1CC28];
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
    v20[0] = v14;
    v19[1] = *MEMORY[0x1E4F92CA8];
    v15[0] = @"Category";
    v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v16[0] = v4;
    v15[1] = @"Duration";
    v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_RealFormat_withUnit_s");
    v16[1] = v6;
    void v15[2] = @"Account type";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    void v16[2] = v8;
    void v15[3] = @"Network interface";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    void v16[3] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
    v20[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventPointDefinitionTestMarkers
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F4012078;
  v14[1] = MEMORY[0x1E4F1CC28];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"Status";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v11[1] = @"TestName";
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventPointDefinitionJetsam
{
  void v14[2] = *MEMORY[0x1E4F143B8];
  if (+[PLXPCAgent shouldLogiOSWatchOSOnly])
  {
    v13[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB8];
    v11[0] = *MEMORY[0x1E4F92CD0];
    v11[1] = v2;
    v12[0] = &unk_1F4012078;
    v12[1] = MEMORY[0x1E4F1CC28];
    v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    v14[0] = v3;
    v13[1] = *MEMORY[0x1E4F92CA8];
    v9 = @"Level";
    v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v10 = v5;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    v14[1] = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v7;
}

+ (id)entryEventPointDefinitionsSymptomsNetworkAdvisory
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F4012078;
  v14[1] = MEMORY[0x1E4F1CC28];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"advisoryKey";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v11[1] = @"Network Type";
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventPointDefinitionsBackgroundTransfer
{
  v50[2] = *MEMORY[0x1E4F143B8];
  v49[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v47[0] = *MEMORY[0x1E4F92CD0];
  v47[1] = v2;
  v48[0] = &unk_1F4012098;
  v48[1] = MEMORY[0x1E4F1CC28];
  v47[2] = *MEMORY[0x1E4F92C08];
  v48[2] = MEMORY[0x1E4F1CC38];
  v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:3];
  v50[0] = v44;
  v49[1] = *MEMORY[0x1E4F92CA8];
  v45[0] = @"taskKind";
  v43 = [MEMORY[0x1E4F929D8] sharedInstance];
  v42 = objc_msgSend(v43, "commonTypeDict_IntegerFormat");
  v46[0] = v42;
  v45[1] = @"taskID";
  v41 = [MEMORY[0x1E4F929D8] sharedInstance];
  v40 = objc_msgSend(v41, "commonTypeDict_IntegerFormat");
  v46[1] = v40;
  v45[2] = @"bundleID";
  v39 = [MEMORY[0x1E4F929D8] sharedInstance];
  v38 = objc_msgSend(v39, "commonTypeDict_StringFormat_withBundleID");
  v46[2] = v38;
  v45[3] = @"taskUUID";
  v37 = [MEMORY[0x1E4F929D8] sharedInstance];
  v36 = objc_msgSend(v37, "commonTypeDict_StringFormat");
  v46[3] = v36;
  v45[4] = @"sessionID";
  v35 = [MEMORY[0x1E4F929D8] sharedInstance];
  v34 = objc_msgSend(v35, "commonTypeDict_StringFormat");
  v46[4] = v34;
  v45[5] = @"state";
  v33 = [MEMORY[0x1E4F929D8] sharedInstance];
  v32 = objc_msgSend(v33, "commonTypeDict_IntegerFormat");
  v46[5] = v32;
  v45[6] = @"bytesSent";
  v31 = [MEMORY[0x1E4F929D8] sharedInstance];
  v30 = objc_msgSend(v31, "commonTypeDict_IntegerFormat");
  v46[6] = v30;
  v45[7] = @"bytesReceived";
  v29 = [MEMORY[0x1E4F929D8] sharedInstance];
  v28 = objc_msgSend(v29, "commonTypeDict_IntegerFormat");
  v46[7] = v28;
  v45[8] = @"willRetry";
  v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v46[8] = v26;
  v45[9] = @"previousFailureCount";
  v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v46[9] = v24;
  v45[10] = @"interfaceName";
  v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  v22 = objc_msgSend(v23, "commonTypeDict_StringFormat");
  v46[10] = v22;
  v45[11] = @"errorCode";
  v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v46[11] = v20;
  v45[12] = @"errorDomain";
  v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_StringFormat");
  v46[12] = v18;
  v45[13] = @"errorCFStreamErrorCode";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v46[13] = v16;
  v45[14] = @"errorCFStreamErrorDomain";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v46[14] = v14;
  v45[15] = @"errorFailingURLSessionTask";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  v46[15] = v4;
  v45[16] = @"errorFailingURL";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_StringFormat");
  v46[16] = v6;
  v45[17] = @"isDiscretionary";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_BoolFormat");
  v46[17] = v8;
  v45[18] = @"isDataBudgetingEnabled";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_BoolFormat");
  v46[18] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:19];
  v50[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:2];

  return v12;
}

+ (id)entryEventPointDefinitionNavd
{
  void v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F4012078;
  v12[1] = MEMORY[0x1E4F1CC28];
  void v11[2] = *MEMORY[0x1E4F92CE8];
  void v12[2] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  v9 = @"EventRequest";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventPointDefinitionNavdMapsWidgetSession
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v19[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v17[0] = *MEMORY[0x1E4F92CD0];
  v17[1] = v2;
  v18[0] = &unk_1F4012078;
  v18[1] = MEMORY[0x1E4F1CC28];
  void v17[2] = *MEMORY[0x1E4F92CE8];
  void v18[2] = MEMORY[0x1E4F1CC38];
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E4F92CA8];
  v15[0] = @"StartUnix";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v16[0] = v4;
  v15[1] = @"EndUnix";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v16[1] = v6;
  void v15[2] = @"ScreenLocked";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  void v16[2] = v8;
  void v15[3] = @"TransportType";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  void v16[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
  v20[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

  return v12;
}

+ (id)entryEventPointDefinitionNavdGeoNetworkActivity
{
  void v22[2] = *MEMORY[0x1E4F143B8];
  v21[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v19[0] = *MEMORY[0x1E4F92CD0];
  v19[1] = v2;
  v20[0] = &unk_1F4012078;
  v20[1] = MEMORY[0x1E4F1CC28];
  void v19[2] = *MEMORY[0x1E4F92CE8];
  v20[2] = MEMORY[0x1E4F1CC38];
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E4F92CA8];
  v17[0] = @"StartUnix";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v18[0] = v14;
  v17[1] = @"EndUnix";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v18[1] = v4;
  void v17[2] = @"Client";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_StringFormat");
  void v18[2] = v6;
  void v17[3] = @"NetworkingReason";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  void v18[3] = v8;
  v17[4] = @"RequestCount";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v18[4] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
  v22[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];

  return v12;
}

+ (id)entryEventPointDefinitionNavdMapsNavigationStateEvent
{
  v24[2] = *MEMORY[0x1E4F143B8];
  v23[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v21[0] = *MEMORY[0x1E4F92CD0];
  v21[1] = v2;
  v22[0] = &unk_1F40120A8;
  v22[1] = MEMORY[0x1E4F1CC28];
  void v21[2] = *MEMORY[0x1E4F92CE8];
  void v22[2] = MEMORY[0x1E4F1CC38];
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
  v24[0] = v18;
  v23[1] = *MEMORY[0x1E4F92CA8];
  v19[0] = @"StartUnix";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v20[0] = v16;
  v19[1] = @"EndUnix";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v20[1] = v14;
  void v19[2] = @"NightMode";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v20[2] = v4;
  void v19[3] = @"NavigationType";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  void v20[3] = v6;
  v19[4] = @"NavigationAppState";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  void v20[4] = v8;
  v19[5] = @"NavigationMapType";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v20[5] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:6];
  v24[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];

  return v12;
}

+ (id)entryEventPointDefinitionMobileBackupStatistics
{
  v52[2] = *MEMORY[0x1E4F143B8];
  if (+[PLXPCAgent shouldLogiOSWatchOSOnly])
  {
    v51[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB8];
    v49[0] = *MEMORY[0x1E4F92CD0];
    v49[1] = v2;
    v50[0] = &unk_1F40120B8;
    v50[1] = MEMORY[0x1E4F1CC28];
    v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:2];
    v52[0] = v46;
    v51[1] = *MEMORY[0x1E4F92CA8];
    v47[0] = @"DomainName";
    v45 = [MEMORY[0x1E4F929D8] sharedInstance];
    v44 = objc_msgSend(v45, "commonTypeDict_StringFormat");
    v48[0] = v44;
    v47[1] = @"DirectoryCount";
    v43 = [MEMORY[0x1E4F929D8] sharedInstance];
    v42 = objc_msgSend(v43, "commonTypeDict_IntegerFormat");
    v48[1] = v42;
    v47[2] = @"FileCount";
    v41 = [MEMORY[0x1E4F929D8] sharedInstance];
    v40 = objc_msgSend(v41, "commonTypeDict_IntegerFormat");
    v48[2] = v40;
    void v47[3] = @"SymLinkCount";
    v39 = [MEMORY[0x1E4F929D8] sharedInstance];
    v38 = objc_msgSend(v39, "commonTypeDict_IntegerFormat");
    void v48[3] = v38;
    v47[4] = @"SparseFileCount";
    v37 = [MEMORY[0x1E4F929D8] sharedInstance];
    v36 = objc_msgSend(v37, "commonTypeDict_IntegerFormat");
    v48[4] = v36;
    v47[5] = @"EncryptionKeyCount";
    v35 = [MEMORY[0x1E4F929D8] sharedInstance];
    v34 = objc_msgSend(v35, "commonTypeDict_IntegerFormat");
    v48[5] = v34;
    v47[6] = @"DeletionMarkerCount";
    v33 = [MEMORY[0x1E4F929D8] sharedInstance];
    v32 = objc_msgSend(v33, "commonTypeDict_IntegerFormat");
    v48[6] = v32;
    v47[7] = @"DataProtectionACount";
    v31 = [MEMORY[0x1E4F929D8] sharedInstance];
    v30 = objc_msgSend(v31, "commonTypeDict_IntegerFormat");
    v48[7] = v30;
    v47[8] = @"DataProtectionBCount";
    v29 = [MEMORY[0x1E4F929D8] sharedInstance];
    v28 = objc_msgSend(v29, "commonTypeDict_IntegerFormat");
    v48[8] = v28;
    v47[9] = @"DataProtectionCCount";
    v27 = [MEMORY[0x1E4F929D8] sharedInstance];
    v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
    v48[9] = v26;
    v47[10] = @"DataProtectionDCount";
    v25 = [MEMORY[0x1E4F929D8] sharedInstance];
    v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
    v48[10] = v24;
    v47[11] = @"SQLiteFileCount";
    v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
    v48[11] = v22;
    v47[12] = @"TotalSQLiteFileSize";
    v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
    v48[12] = v20;
    v47[13] = @"TotalFileSize";
    v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
    v48[13] = v18;
    v47[14] = @"TotalResourceSize";
    v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
    v48[14] = v16;
    v47[15] = @"TotalAttributeSize";
    v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v48[15] = v14;
    v47[16] = @"RecordChurnPct";
    v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
    v48[16] = v4;
    v47[17] = @"ContentChurnPct";
    v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_RealFormat");
    v48[17] = v6;
    v47[18] = @"FailureCount";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v48[18] = v8;
    v47[19] = @"BackupType";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v48[19] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:20];
    v52[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventPointDefinitionMobileBackupEvents
{
  void v22[2] = *MEMORY[0x1E4F143B8];
  if (+[PLXPCAgent shouldLogiOSWatchOSOnly])
  {
    v21[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB8];
    v19[0] = *MEMORY[0x1E4F92CD0];
    v19[1] = v2;
    v20[0] = &unk_1F4012078;
    v20[1] = MEMORY[0x1E4F1CC28];
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
    v22[0] = v16;
    v21[1] = *MEMORY[0x1E4F92CA8];
    v17[0] = @"end";
    v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v14 = objc_msgSend(v15, "commonTypeDict_DateFormat");
    v18[0] = v14;
    v17[1] = @"finished";
    v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    v4 = objc_msgSend(v3, "commonTypeDict_BoolFormat");
    v18[1] = v4;
    void v17[2] = @"hasError";
    v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_BoolFormat");
    void v18[2] = v6;
    void v17[3] = @"start";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_DateFormat");
    void v18[3] = v8;
    v17[4] = @"state";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    v10 = objc_msgSend(v9, "commonTypeDict_StringFormat");
    v18[4] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
    v22[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventPointDefinitionAppActivationPerformanceActivationData
{
  v28[2] = *MEMORY[0x1E4F143B8];
  if (+[PLXPCAgent shouldLogiOSWatchOSOnly])
  {
    v27[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB8];
    v25[0] = *MEMORY[0x1E4F92CD0];
    v25[1] = v2;
    v26[0] = &unk_1F4012078;
    v26[1] = MEMORY[0x1E4F1CC28];
    v25[2] = *MEMORY[0x1E4F92C08];
    v26[2] = MEMORY[0x1E4F1CC38];
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
    v28[0] = v22;
    v27[1] = *MEMORY[0x1E4F92CA8];
    v23[0] = @"ActivationID";
    v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
    v24[0] = v20;
    v23[1] = @"UniqueID";
    v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
    v24[1] = v18;
    void v23[2] = @"BundleID";
    v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v16 = objc_msgSend(v17, "commonTypeDict_StringFormat_withBundleID");
    v24[2] = v16;
    v23[3] = @"ActivationDuration_ms";
    v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v24[3] = v14;
    v23[4] = @"ActivationResult";
    v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    void v24[4] = v4;
    v23[5] = @"ActivationType";
    v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v24[5] = v6;
    v23[6] = @"SystemUptime";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v24[6] = v8;
    v23[7] = @"ActivationFlags";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v24[7] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:8];
    v28[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventPointDefinitionAppActivationPerformanceProcessData
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  if (+[PLXPCAgent shouldLogiOSWatchOSOnly])
  {
    v15[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB8];
    v13[0] = *MEMORY[0x1E4F92CD0];
    v13[1] = v2;
    v14[0] = &unk_1F4012078;
    v14[1] = MEMORY[0x1E4F1CC28];
    void v13[2] = *MEMORY[0x1E4F92C08];
    void v14[2] = MEMORY[0x1E4F1CC38];
    v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
    v16[0] = v3;
    v15[1] = *MEMORY[0x1E4F92CA8];
    v11[0] = @"UniqueID";
    v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v11[1] = @"ProcessName";
    v12[0] = v5;
    v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    v7 = objc_msgSend(v6, "commonTypeDict_StringFormat_withProcessName");
    v12[1] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    v16[1] = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  }
  else
  {
    v9 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v9;
}

+ (id)entryEventPointDefinitionAppActivationPerformanceCPUStatistics
{
  v40[2] = *MEMORY[0x1E4F143B8];
  if (+[PLXPCAgent shouldLogiOSWatchOSOnly])
  {
    v39[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB8];
    v37[0] = *MEMORY[0x1E4F92CD0];
    v37[1] = v2;
    v38[0] = &unk_1F4012078;
    v38[1] = MEMORY[0x1E4F1CC28];
    v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
    v40[0] = v34;
    v39[1] = *MEMORY[0x1E4F92CA8];
    v35[0] = @"ActivationID";
    v33 = [MEMORY[0x1E4F929D8] sharedInstance];
    v32 = objc_msgSend(v33, "commonTypeDict_IntegerFormat");
    v36[0] = v32;
    v35[1] = @"UniqueID";
    v31 = [MEMORY[0x1E4F929D8] sharedInstance];
    v30 = objc_msgSend(v31, "commonTypeDict_IntegerFormat");
    v36[1] = v30;
    v35[2] = @"TotalCPU_ms";
    v29 = [MEMORY[0x1E4F929D8] sharedInstance];
    v28 = objc_msgSend(v29, "commonTypeDict_IntegerFormat");
    v36[2] = v28;
    v35[3] = @"QOSDisabled_ms";
    v27 = [MEMORY[0x1E4F929D8] sharedInstance];
    v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
    v36[3] = v26;
    v35[4] = @"QOSUserInteractive_ms";
    v25 = [MEMORY[0x1E4F929D8] sharedInstance];
    v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
    v36[4] = v24;
    v35[5] = @"QOSUserInitiated_ms";
    v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
    v36[5] = v22;
    v35[6] = @"QOSDefault_ms";
    v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
    v36[6] = v20;
    v35[7] = @"QOSUtility_ms";
    v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
    v36[7] = v18;
    v35[8] = @"QOSMaintenance_ms";
    v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
    v36[8] = v16;
    v35[9] = @"QOSBackground_ms";
    v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v36[9] = v14;
    v35[10] = @"IOReads_kb";
    v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v36[10] = v4;
    v35[11] = @"IOWrites_kb";
    v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v36[11] = v6;
    v35[12] = @"PageIns";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v36[12] = v8;
    v35[13] = @"ProcessLifecycleState";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v36[13] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:14];
    v40[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventPointDefinitionAppActivationPerformanceMemoryStatistics
{
  v60[2] = *MEMORY[0x1E4F143B8];
  if (+[PLXPCAgent shouldLogiOSWatchOSOnly])
  {
    v59[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB8];
    v57[0] = *MEMORY[0x1E4F92CD0];
    v57[1] = v2;
    v58[0] = &unk_1F4012078;
    v58[1] = MEMORY[0x1E4F1CC28];
    v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:2];
    v60[0] = v54;
    v59[1] = *MEMORY[0x1E4F92CA8];
    v55[0] = @"SequenceID";
    v53 = [MEMORY[0x1E4F929D8] sharedInstance];
    v52 = objc_msgSend(v53, "commonTypeDict_IntegerFormat");
    v56[0] = v52;
    v55[1] = @"ActivationID";
    v51 = [MEMORY[0x1E4F929D8] sharedInstance];
    v50 = objc_msgSend(v51, "commonTypeDict_IntegerFormat");
    v56[1] = v50;
    v55[2] = @"FreeQueue";
    v49 = [MEMORY[0x1E4F929D8] sharedInstance];
    v48 = objc_msgSend(v49, "commonTypeDict_IntegerFormat");
    v56[2] = v48;
    v55[3] = @"ActiveQueue";
    v47 = [MEMORY[0x1E4F929D8] sharedInstance];
    v46 = objc_msgSend(v47, "commonTypeDict_IntegerFormat");
    v56[3] = v46;
    v55[4] = @"InactiveQueue";
    v45 = [MEMORY[0x1E4F929D8] sharedInstance];
    v44 = objc_msgSend(v45, "commonTypeDict_IntegerFormat");
    v56[4] = v44;
    v55[5] = @"SpeculativeQueue";
    v43 = [MEMORY[0x1E4F929D8] sharedInstance];
    v42 = objc_msgSend(v43, "commonTypeDict_IntegerFormat");
    v56[5] = v42;
    v55[6] = @"ThrottledQueue";
    v41 = [MEMORY[0x1E4F929D8] sharedInstance];
    v40 = objc_msgSend(v41, "commonTypeDict_IntegerFormat");
    v56[6] = v40;
    v55[7] = @"WiredQueue";
    v39 = [MEMORY[0x1E4F929D8] sharedInstance];
    v38 = objc_msgSend(v39, "commonTypeDict_IntegerFormat");
    v56[7] = v38;
    v55[8] = @"PurgeableQueue";
    v37 = [MEMORY[0x1E4F929D8] sharedInstance];
    v36 = objc_msgSend(v37, "commonTypeDict_IntegerFormat");
    v56[8] = v36;
    v55[9] = @"FileBackedQueue";
    v35 = [MEMORY[0x1E4F929D8] sharedInstance];
    v34 = objc_msgSend(v35, "commonTypeDict_IntegerFormat");
    v56[9] = v34;
    v55[10] = @"AnonymousQueue";
    v33 = [MEMORY[0x1E4F929D8] sharedInstance];
    v32 = objc_msgSend(v33, "commonTypeDict_IntegerFormat");
    v56[10] = v32;
    v55[11] = @"Faults";
    v31 = [MEMORY[0x1E4F929D8] sharedInstance];
    v30 = objc_msgSend(v31, "commonTypeDict_IntegerFormat");
    v56[11] = v30;
    v55[12] = @"CopyOnWriteFault";
    v29 = [MEMORY[0x1E4F929D8] sharedInstance];
    v28 = objc_msgSend(v29, "commonTypeDict_IntegerFormat");
    v56[12] = v28;
    v55[13] = @"ZeroFill";
    v27 = [MEMORY[0x1E4F929D8] sharedInstance];
    v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
    v56[13] = v26;
    v55[14] = @"Reactivated";
    v25 = [MEMORY[0x1E4F929D8] sharedInstance];
    v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
    v56[14] = v24;
    v55[15] = @"Purged";
    v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
    v56[15] = v22;
    v55[16] = @"TotalCompressed";
    v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
    v56[16] = v20;
    v55[17] = @"CompressorSize";
    v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
    v56[17] = v18;
    v55[18] = @"Decompressions";
    v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
    v56[18] = v16;
    v55[19] = @"Compressions";
    v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v56[19] = v14;
    v55[20] = @"PageIns";
    v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v56[20] = v4;
    v55[21] = @"PageOuts";
    v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v56[21] = v6;
    v55[22] = @"SwapIns";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v56[22] = v8;
    v55[23] = @"SwapOuts";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v56[23] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:24];
    v60[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventPointDefinitionAppActivationPerformancePowerStateStatistics
{
  void v20[2] = *MEMORY[0x1E4F143B8];
  if (+[PLXPCAgent shouldLogiOSWatchOSOnly])
  {
    v19[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB8];
    v17[0] = *MEMORY[0x1E4F92CD0];
    v17[1] = v2;
    v18[0] = &unk_1F4012078;
    v18[1] = MEMORY[0x1E4F1CC28];
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
    v20[0] = v14;
    v19[1] = *MEMORY[0x1E4F92CA8];
    v15[0] = @"ActivationID";
    v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v16[0] = v4;
    v15[1] = @"CPU";
    v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v16[1] = v6;
    void v15[2] = @"State";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    void v16[2] = v8;
    void v15[3] = @"DutyCycle";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    void v16[3] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
    v20[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventPointDefinitionCloudKit
{
  v82[2] = *MEMORY[0x1E4F143B8];
  v81[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v79[0] = *MEMORY[0x1E4F92CD0];
  v79[1] = v2;
  v80[0] = &unk_1F40120C8;
  v80[1] = MEMORY[0x1E4F1CC28];
  v79[2] = *MEMORY[0x1E4F92C08];
  v80[2] = MEMORY[0x1E4F1CC38];
  v76 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:v79 count:3];
  v82[0] = v76;
  v81[1] = *MEMORY[0x1E4F92CA8];
  v77[0] = @"operationID";
  v75 = [MEMORY[0x1E4F929D8] sharedInstance];
  v74 = objc_msgSend(v75, "commonTypeDict_StringFormat");
  v78[0] = v74;
  v77[1] = @"operationType";
  v73 = [MEMORY[0x1E4F929D8] sharedInstance];
  v72 = objc_msgSend(v73, "commonTypeDict_IntegerFormat");
  v78[1] = v72;
  v77[2] = @"containerIdentifier";
  v71 = [MEMORY[0x1E4F929D8] sharedInstance];
  v70 = objc_msgSend(v71, "commonTypeDict_StringFormat");
  v78[2] = v70;
  v77[3] = @"containerEnvironment";
  v69 = [MEMORY[0x1E4F929D8] sharedInstance];
  v68 = objc_msgSend(v69, "commonTypeDict_IntegerFormat");
  v78[3] = v68;
  v77[4] = @"bundleIdentifier";
  v67 = [MEMORY[0x1E4F929D8] sharedInstance];
  v66 = objc_msgSend(v67, "commonTypeDict_StringFormat_withBundleID");
  v78[4] = v66;
  v77[5] = @"sourceAppBundleIdentifier";
  v65 = [MEMORY[0x1E4F929D8] sharedInstance];
  v64 = objc_msgSend(v65, "commonTypeDict_StringFormat_withAppName");
  v78[5] = v64;
  v77[6] = @"CKStartDate";
  v63 = [MEMORY[0x1E4F929D8] sharedInstance];
  v62 = objc_msgSend(v63, "commonTypeDict_DateFormat");
  v78[6] = v62;
  v77[7] = @"CKDuration";
  v61 = [MEMORY[0x1E4F929D8] sharedInstance];
  v60 = objc_msgSend(v61, "commonTypeDict_RealFormat");
  v78[7] = v60;
  v77[8] = @"CKBytesUploaded";
  v59 = [MEMORY[0x1E4F929D8] sharedInstance];
  v58 = objc_msgSend(v59, "commonTypeDict_IntegerFormat");
  v78[8] = v58;
  v77[9] = @"CKBytesDownloaded";
  v57 = [MEMORY[0x1E4F929D8] sharedInstance];
  v56 = objc_msgSend(v57, "commonTypeDict_IntegerFormat");
  v78[9] = v56;
  v77[10] = @"CKConnections";
  v55 = [MEMORY[0x1E4F929D8] sharedInstance];
  v54 = objc_msgSend(v55, "commonTypeDict_IntegerFormat");
  v78[10] = v54;
  v77[11] = @"CKConnectionsCreated";
  v53 = [MEMORY[0x1E4F929D8] sharedInstance];
  v52 = objc_msgSend(v53, "commonTypeDict_IntegerFormat");
  v78[11] = v52;
  v77[12] = @"CKRecordsUploaded";
  v51 = [MEMORY[0x1E4F929D8] sharedInstance];
  v50 = objc_msgSend(v51, "commonTypeDict_IntegerFormat");
  v78[12] = v50;
  v77[13] = @"CKRecordsDownloaded";
  v49 = [MEMORY[0x1E4F929D8] sharedInstance];
  v48 = objc_msgSend(v49, "commonTypeDict_IntegerFormat");
  v78[13] = v48;
  v77[14] = @"CKRecordsDeleted";
  v47 = [MEMORY[0x1E4F929D8] sharedInstance];
  v46 = objc_msgSend(v47, "commonTypeDict_IntegerFormat");
  v78[14] = v46;
  v77[15] = @"CKRetries";
  v45 = [MEMORY[0x1E4F929D8] sharedInstance];
  v44 = objc_msgSend(v45, "commonTypeDict_IntegerFormat");
  v78[15] = v44;
  v77[16] = @"MMCSDuration";
  v43 = [MEMORY[0x1E4F929D8] sharedInstance];
  v42 = objc_msgSend(v43, "commonTypeDict_RealFormat");
  v78[16] = v42;
  v77[17] = @"MMCSBytesUploaded";
  v41 = [MEMORY[0x1E4F929D8] sharedInstance];
  v40 = objc_msgSend(v41, "commonTypeDict_IntegerFormat");
  v78[17] = v40;
  v77[18] = @"MMCSBytesDownloaded";
  v39 = [MEMORY[0x1E4F929D8] sharedInstance];
  v38 = objc_msgSend(v39, "commonTypeDict_IntegerFormat");
  v78[18] = v38;
  v77[19] = @"MMCSConnections";
  v37 = [MEMORY[0x1E4F929D8] sharedInstance];
  v36 = objc_msgSend(v37, "commonTypeDict_IntegerFormat");
  v78[19] = v36;
  v77[20] = @"MMCSConnectionsCreated";
  v35 = [MEMORY[0x1E4F929D8] sharedInstance];
  v34 = objc_msgSend(v35, "commonTypeDict_IntegerFormat");
  v78[20] = v34;
  v77[21] = @"CKRequestUUIDs";
  v33 = [MEMORY[0x1E4F929D8] sharedInstance];
  v32 = objc_msgSend(v33, "commonTypeDict_StringFormat");
  v78[21] = v32;
  v77[22] = @"MMCSRequestUUIDs";
  v31 = [MEMORY[0x1E4F929D8] sharedInstance];
  v30 = objc_msgSend(v31, "commonTypeDict_StringFormat");
  v78[22] = v30;
  v77[23] = @"operationGroupID";
  v29 = [MEMORY[0x1E4F929D8] sharedInstance];
  v28 = objc_msgSend(v29, "commonTypeDict_StringFormat");
  v78[23] = v28;
  v77[24] = @"operationGroupName";
  v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  v26 = objc_msgSend(v27, "commonTypeDict_StringFormat");
  v78[24] = v26;
  v77[25] = @"operationGroupQuantity";
  v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v78[25] = v24;
  v77[26] = @"CKNumberOfRequests";
  v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v78[26] = v22;
  v77[27] = @"MMCSNumberOfRequests";
  v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v78[27] = v20;
  v77[28] = @"operationQualityOfService";
  v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v78[28] = v18;
  v77[29] = @"CKProtoRequestOperationsByCount";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_StringFormat");
  v78[29] = v16;
  v77[30] = @"CKAssetsUploaded";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v78[30] = v14;
  v77[31] = @"CKAssetsUploadedFileSize";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v78[31] = v4;
  v77[32] = @"CKAssetsDownloaded";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v78[32] = v6;
  v77[33] = @"CKAssetsDownloadedFileSize";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v78[33] = v8;
  v77[34] = @"ZoneNames";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_StringFormat");
  v78[34] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:v77 count:35];
  v82[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:v81 count:2];

  return v12;
}

+ (id)entryEventPointDefinitionLocationVehicularDetection
{
  void v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F4012078;
  v12[1] = MEMORY[0x1E4F1CC28];
  void v11[2] = *MEMORY[0x1E4F92CE8];
  void v12[2] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  v9 = @"Mode";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventPointDefinitionMotionWakeReason
{
  void v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F4012078;
  v12[1] = MEMORY[0x1E4F1CC28];
  void v11[2] = *MEMORY[0x1E4F92CE8];
  void v12[2] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  v9 = @"OscarWakeReason";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventPointDefinitionCommuteRefresh
{
  v30[2] = *MEMORY[0x1E4F143B8];
  v29[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v27[0] = *MEMORY[0x1E4F92CD0];
  v27[1] = v2;
  v28[0] = &unk_1F4012078;
  v28[1] = MEMORY[0x1E4F1CC28];
  void v27[2] = *MEMORY[0x1E4F92CE8];
  v28[2] = MEMORY[0x1E4F1CC38];
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];
  v30[0] = v24;
  v29[1] = *MEMORY[0x1E4F92CA8];
  v25[0] = @"LOIEntryDate";
  v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v26[0] = v22;
  v25[1] = @"LOIExitDate";
  v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v26[1] = v20;
  v25[2] = @"destinationLOI";
  v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v26[2] = v18;
  void v25[3] = @"endDate";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  void v26[3] = v16;
  v25[4] = @"networkRequest";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v26[4] = v14;
  v25[5] = @"notified";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v26[5] = v4;
  v25[6] = @"scheduledWakeup";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v26[6] = v6;
  v25[7] = @"startDate";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v26[7] = v8;
  v25[8] = @"trigger";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v26[8] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:9];
  v30[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];

  return v12;
}

+ (id)entryEventPointDefinitionCacheDelete
{
  v24[2] = *MEMORY[0x1E4F143B8];
  v23[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v21[0] = *MEMORY[0x1E4F92CD0];
  v21[1] = v2;
  v22[0] = &unk_1F4012078;
  v22[1] = MEMORY[0x1E4F1CC28];
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  v24[0] = v18;
  v23[1] = *MEMORY[0x1E4F92CA8];
  v19[0] = @"operationType";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v20[0] = v16;
  v19[1] = @"urgencyLevel";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v20[1] = v14;
  void v19[2] = @"serviceName";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  void v20[2] = v4;
  void v19[3] = @"duration";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_RealFormat");
  void v20[3] = v6;
  v19[4] = @"requestedBytes";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  void v20[4] = v8;
  v19[5] = @"purgedBytes";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v20[5] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:6];
  v24[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];

  return v12;
}

+ (id)entryEventPointDefinitionMachineTranslation
{
  void v17[2] = *MEMORY[0x1E4F143B8];
  v16[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v14[0] = *MEMORY[0x1E4F92CD0];
  v14[1] = v2;
  v15[0] = &unk_1F4012078;
  v15[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92C58];
  void v14[2] = *MEMORY[0x1E4F92C08];
  void v14[3] = v3;
  void v15[2] = MEMORY[0x1E4F1CC38];
  void v15[3] = &unk_1F4013D80;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  v17[0] = v4;
  v16[1] = *MEMORY[0x1E4F92CA8];
  v12[0] = @"processName";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_StringFormat_withProcessName");
  v12[1] = @"requestType";
  v13[0] = v6;
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v13[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v17[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  return v10;
}

+ (id)entryEventPointDefinitionSecItem
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F4012078;
  v14[1] = MEMORY[0x1E4F1CC28];
  void v13[2] = *MEMORY[0x1E4F92CE8];
  void v14[2] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"operation";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v11[1] = @"AccessGroup";
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventPointDefinitionOctagonTrust
{
  void v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F4012078;
  v12[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  v9 = @"operation";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventPointDefinitionCKKSSyncingRateLimit
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F4012078;
  v14[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"accessgroup";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v11[1] = @"ratelimit";
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventPointDefinitionDeepScanReasons
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F4012078;
  v14[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"AppLibraryID";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v11[1] = @"Reason";
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventPointDefinitionSiriActivication
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isWatch])
  {
    v15[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB8];
    v13[0] = *MEMORY[0x1E4F92CD0];
    v13[1] = v2;
    v14[0] = &unk_1F4012078;
    v14[1] = MEMORY[0x1E4F1CC28];
    void v13[2] = *MEMORY[0x1E4F92CE8];
    void v14[2] = MEMORY[0x1E4F1CC38];
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
    v16[0] = v3;
    v15[1] = *MEMORY[0x1E4F92CA8];
    v11[0] = @"event";
    v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v11[1] = @"mode";
    v12[0] = v5;
    v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v12[1] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    v16[1] = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  }
  else
  {
    v9 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v9;
}

+ (id)entryEventPointDefinitionSpotlightWatchdogFired
{
  void v14[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isMac])
  {
    v13[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB8];
    v11[0] = *MEMORY[0x1E4F92CD0];
    v11[1] = v2;
    v12[0] = &unk_1F4012078;
    v12[1] = MEMORY[0x1E4F1CC28];
    void v11[2] = *MEMORY[0x1E4F92CE8];
    void v12[2] = MEMORY[0x1E4F1CC38];
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
    v14[0] = v3;
    v13[1] = *MEMORY[0x1E4F92CA8];
    v9 = @"indexingWatchdogFired";
    v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v10 = v5;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    v14[1] = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v7;
}

+ (id)entryEventPointDefinitionShortcutsTriggerFired
{
  v24[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isiOS])
  {
    v23[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB8];
    v21[0] = *MEMORY[0x1E4F92CD0];
    v21[1] = v2;
    v22[0] = &unk_1F4012078;
    v22[1] = MEMORY[0x1E4F1CC28];
    void v21[2] = *MEMORY[0x1E4F92C08];
    void v22[2] = MEMORY[0x1E4F1CC38];
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
    v24[0] = v18;
    v23[1] = *MEMORY[0x1E4F92CA8];
    v19[0] = @"WFTriggerKind";
    v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
    v20[0] = v16;
    v19[1] = @"WFActionCount";
    v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v20[1] = v14;
    void v19[2] = @"WFTriggerID";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
    void v20[2] = v4;
    void v19[3] = @"WFWorkflowID";
    v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_StringFormat");
    void v20[3] = v6;
    v19[4] = @"WFWorkflowName";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_StringFormat");
    void v20[4] = v8;
    v19[5] = @"WFAssociatedAppBundleID";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    v10 = objc_msgSend(v9, "commonTypeDict_StringFormat_withBundleID");
    v20[5] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:6];
    v24[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventPointDefinitionAirPlayDiscoveryMode
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4F92C50];
  uint64_t v10 = *MEMORY[0x1E4F92CD0];
  v11 = &unk_1F4012078;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E4F92CA8];
  v8 = @"Mode";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v9 = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v13[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v6;
}

+ (id)entryEventForwardDefinitions
{
  v44[38] = *MEMORY[0x1E4F143B8];
  v43[0] = @"UIKitKeyboard";
  v42 = [a1 entryEventForwardDefinitionUIKitKeyboard];
  v44[0] = v42;
  v43[1] = @"UIKitActivity";
  v41 = [a1 entryEventForwardDefinitionUIKitActivity];
  v44[1] = v41;
  v43[2] = @"SafariFetcher";
  v40 = [a1 entryEventForwardDefinitionSafariFetcher];
  v44[2] = v40;
  v43[3] = @"AppAccessory";
  v39 = [a1 entryEventForwardDefinitionAppAccessory];
  v44[3] = v39;
  v43[4] = @"InCallService";
  v38 = [a1 entryEventForwardDefinitionInCallService];
  v44[4] = v38;
  v43[5] = @"WebApp";
  v37 = [a1 entryEventForwardDefinitionWebApp];
  v44[5] = v37;
  v43[6] = @"ThermalLevel";
  v36 = [a1 entryEventForwardDefinitionThermalLevel];
  v44[6] = v36;
  v43[7] = @"AirDrop";
  v35 = [a1 entryEventForwardDefinitionAirDrop];
  v44[7] = v35;
  v43[8] = @"AirDropSession";
  v34 = [a1 entryEventForwardDefinitionAirDropSession];
  v44[8] = v34;
  v43[9] = @"Accessory";
  v33 = [a1 entryEventForwardDefinitionAccessory];
  v44[9] = v33;
  v43[10] = @"UARPStatus";
  v32 = [a1 entryEventForwardDefinitionUARPStatus];
  v44[10] = v32;
  v43[11] = @"CallScreeningEnabled";
  v31 = [a1 entryEventForwardCallScreeningEnabled];
  v44[11] = v31;
  v43[12] = @"SOSKVSRateLimitingEvent";
  v30 = [a1 entryEventForwardDefinitionSOSKVSRateLimitingEvent];
  v44[12] = v30;
  v43[13] = @"ThermalHiP";
  v29 = [a1 entryEventForwardDefinitionThermalHiP];
  v44[13] = v29;
  v43[14] = @"AppleBacklightBrightness";
  v28 = [a1 entryEventForwardDefinitionAppleBacklightBrightness];
  v44[14] = v28;
  v43[15] = @"UIKitEclipse";
  v27 = [a1 entryEventForwardDefinitionUIKitEclipse];
  v44[15] = v27;
  v43[16] = @"Dosimetry";
  v26 = +[PLXPCAgent entryEventForwardDefinitionsDosimetry];
  v44[16] = v26;
  v43[17] = @"SecondaryDisplay";
  v25 = [a1 entryEventForwardDefinitionSecondaryDisplay];
  v44[17] = v25;
  v43[18] = @"SleepMode";
  v24 = [a1 entryEventForwardDefinitionSleepMode];
  v44[18] = v24;
  v43[19] = @"SpatialAudio";
  v23 = [a1 entryEventForwardDefinitionSpatialAudio];
  v44[19] = v23;
  v43[20] = @"ThermalSensors";
  v22 = [a1 entryEventForwardDefinitionThermalSensors];
  v44[20] = v22;
  v43[21] = @"TelephonyState";
  v21 = [a1 entryEventForwardDefinitionTelephonyState];
  v44[21] = v21;
  v43[22] = @"PreferredLink";
  v20 = [a1 entryEventForwardDefinitionPreferredLink];
  v44[22] = v20;
  v43[23] = @"AudioRouting";
  v19 = [a1 entryEventForwardDefinitionAudioRouting];
  v44[23] = v19;
  v43[24] = @"WirelessSync";
  v18 = [a1 entryEventForwardDefinitionWirelessSync];
  v44[24] = v18;
  v43[25] = @"EnhancedDiscovery";
  v17 = [a1 entryEventForwardDefinitionEnhancedDiscovery];
  v44[25] = v17;
  v43[26] = @"Siri";
  uint64_t v16 = [a1 entryEventForwardDefinitionSiri];
  v44[26] = v16;
  v43[27] = @"UIKitAlert";
  v15 = [a1 entryEventForwardDefinitionUIKitAlert];
  v44[27] = v15;
  v43[28] = @"AccessoryMotion";
  uint64_t v3 = [a1 entryEventForwardDefinitionAccessoryMotion];
  v44[28] = v3;
  v43[29] = @"MXDiscoveryLevel";
  v4 = [a1 entryEventForwardDefinitionMXDiscoveryLevel];
  v44[29] = v4;
  v43[30] = @"RapidSecurityResponse";
  v5 = [a1 entryEventForwardDefinitionRapidSecurityResponse];
  v44[30] = v5;
  v43[31] = @"CarPlay";
  v6 = [a1 entryEventForwardDefinitionCarPlay];
  v44[31] = v6;
  v43[32] = @"CarPlayScreens";
  v7 = [a1 entryEventForwardDefinitionCarPlayScreens];
  v44[32] = v7;
  v43[33] = @"NetworkRelay";
  v8 = [a1 entryEventForwardDefinitionNetworkRelay];
  v44[33] = v8;
  v43[34] = @"NetworkRelayWiFiAssertion";
  v9 = [a1 entryEventForwardDefinitionNetworkRelayWiFiAssertion];
  v44[34] = v9;
  v43[35] = @"WatchPresence";
  uint64_t v10 = [a1 entryEventForwardDefinitionWatchPresence];
  v44[35] = v10;
  v43[36] = @"PasskeyAuthentication";
  v11 = [a1 entryEventForwardDefinitionPasskeyAuthentication];
  v44[36] = v11;
  v43[37] = @"AvailabilityModes";
  uint64_t v12 = [a1 entryEventForwardDefinitionAvailabilityModes];
  v44[37] = v12;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:38];

  return v14;
}

+ (id)entryEventForwardDefinitionAvailabilityModes
{
  void v21[2] = *MEMORY[0x1E4F143B8];
  v20[0] = *MEMORY[0x1E4F92C50];
  uint64_t v18 = *MEMORY[0x1E4F92CD0];
  v19 = &unk_1F4012078;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  v21[0] = v15;
  v20[1] = *MEMORY[0x1E4F92CA8];
  v16[0] = @"Available";
  id v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_BoolFormat");
  v17[0] = v13;
  v16[1] = @"ExtensionCount";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v17[1] = v3;
  void v16[2] = @"Reason";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  void v17[2] = v5;
  void v16[3] = @"Source";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  void v17[3] = v7;
  void v16[4] = @"SemanticType";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v17[4] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:5];
  v21[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];

  return v11;
}

+ (id)entryEventForwardDefinitionWatchPresence
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CE8];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F4012078;
  v14[1] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"Event";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v11[1] = @"RSSI";
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventForwardDefinitionUIKitKeyboard
{
  void v18[2] = *MEMORY[0x1E4F143B8];
  if (+[PLXPCAgent shouldLogiOSWatchOSOnly])
  {
    v17[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB8];
    v15[0] = *MEMORY[0x1E4F92CD0];
    v15[1] = v2;
    v16[0] = &unk_1F40120D8;
    v16[1] = MEMORY[0x1E4F1CC28];
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
    v18[0] = v3;
    v17[1] = *MEMORY[0x1E4F92CA8];
    v13[0] = @"Status";
    v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    v5 = objc_msgSend(v4, "commonTypeDict_BoolFormat");
    v14[0] = v5;
    v13[1] = @"Keyboard-ID";
    v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
    v14[1] = v7;
    void v13[2] = @"Process-ID";
    v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    void v14[2] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
    v18[1] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (id)entryEventForwardDefinitionUIKitEclipse
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isiOS])
  {
    v15[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB8];
    v13[0] = *MEMORY[0x1E4F92CD0];
    v13[1] = v2;
    v14[0] = &unk_1F4012078;
    v14[1] = MEMORY[0x1E4F1CC28];
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
    v16[0] = v3;
    v15[1] = *MEMORY[0x1E4F92CA8];
    v11[0] = @"Mode";
    v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v11[1] = @"Value";
    v12[0] = v5;
    v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v12[1] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    v16[1] = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  }
  else
  {
    v9 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v9;
}

+ (id)entryEventForwardDefinitionMXDiscoveryLevel
{
  v32[3] = *MEMORY[0x1E4F143B8];
  v31[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C60];
  v29[0] = *MEMORY[0x1E4F92CD0];
  v29[1] = v2;
  v30[0] = &unk_1F4012088;
  v30[1] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = *MEMORY[0x1E4F92C08];
  v30[2] = MEMORY[0x1E4F1CC38];
  uint64_t v4 = *MEMORY[0x1E4F92C58];
  void v29[2] = v3;
  v29[3] = v4;
  v28[0] = @"Level";
  v28[1] = @"Client";
  v28[2] = @"OnBehalfOf";
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
  v30[3] = v21;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:4];
  v32[0] = v20;
  v31[1] = *MEMORY[0x1E4F92CA8];
  v26[0] = @"ObjectHash";
  v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_StringFormat");
  v27[0] = v18;
  v26[1] = @"Client";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_StringFormat_withAppName");
  v27[1] = v16;
  v26[2] = @"Level";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  void v27[2] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];
  v32[1] = v7;
  v31[2] = *MEMORY[0x1E4F92C68];
  v24[0] = @"key";
  v22 = @"OnBehalfOf";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_StringFormat_withBundleID");
  v23 = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  v24[1] = @"value";
  v25[0] = v10;
  v11 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v12 = objc_msgSend(v11, "commonTypeDict_StringFormat");
  v25[1] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
  v32[2] = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];

  return v14;
}

+ (id)entryEventForwardDefinitionCarPlay
{
  void v17[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isiPhone])
  {
    v16[0] = *MEMORY[0x1E4F92C50];
    uint64_t v14 = *MEMORY[0x1E4F92CD0];
    v15 = &unk_1F4012078;
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    v17[0] = v2;
    v16[1] = *MEMORY[0x1E4F92CA8];
    v12[0] = @"Activated";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_BoolFormat");
    v13[0] = v4;
    v12[1] = @"Wireless";
    v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_BoolFormat");
    v13[1] = v6;
    void v12[2] = @"SessionID";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    void v13[2] = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
    v17[1] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v10;
}

+ (id)entryEventForwardDefinitionCarPlayScreens
{
  void v19[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isiPhone])
  {
    v18[0] = *MEMORY[0x1E4F92C50];
    uint64_t v16 = *MEMORY[0x1E4F92CD0];
    v17 = &unk_1F4012088;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    v19[0] = v13;
    v18[1] = *MEMORY[0x1E4F92CA8];
    v14[0] = @"Resume";
    uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v3 = objc_msgSend(v2, "commonTypeDict_BoolFormat");
    v15[0] = v3;
    v14[1] = @"SessionID";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v15[1] = v5;
    void v14[2] = @"ScreenUUID";
    v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
    void v15[2] = v7;
    void v14[3] = @"Size";
    v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    void v15[3] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
    v19[1] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (id)entryEventForwardDefinitionSecondaryDisplay
{
  void v18[2] = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A38] isiPad] & 1) != 0
    || [MEMORY[0x1E4F92A38] isMac])
  {
    v17[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB8];
    v15[0] = *MEMORY[0x1E4F92CD0];
    v15[1] = v2;
    v16[0] = &unk_1F4012078;
    v16[1] = MEMORY[0x1E4F1CC28];
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
    v18[0] = v3;
    v17[1] = *MEMORY[0x1E4F92CA8];
    v13[0] = @"IsConnected";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v14[0] = v5;
    v13[1] = @"Codec";
    v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
    v14[1] = v7;
    void v13[2] = @"Transport";
    v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    void v14[2] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
    v18[1] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (id)entryEventForwardDefinitionSpatialAudio
{
  void v21[2] = *MEMORY[0x1E4F143B8];
  v20[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v18[0] = *MEMORY[0x1E4F92CD0];
  v18[1] = v2;
  v19[0] = &unk_1F40120A8;
  v19[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92C58];
  void v18[2] = *MEMORY[0x1E4F92C08];
  void v18[3] = v3;
  void v19[2] = MEMORY[0x1E4F1CC38];
  void v19[3] = &unk_1F4013D98;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:4];
  v21[0] = v15;
  v20[1] = *MEMORY[0x1E4F92CA8];
  v16[0] = @"processName";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat_withProcessName");
  v17[0] = v5;
  v16[1] = @"spatialAudio";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_BoolFormat");
  v17[1] = v7;
  void v16[2] = @"headTracking";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_BoolFormat");
  void v17[2] = v9;
  void v16[3] = @"up-mixing";
  uint64_t v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  v11 = objc_msgSend(v10, "commonTypeDict_BoolFormat");
  void v17[3] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
  v21[1] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];

  return v13;
}

+ (id)entryEventForwardDefinitionTelephonyState
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventForwardDefinitionAccessoryMotion
{
  void v18[2] = *MEMORY[0x1E4F143B8];
  v17[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v15[0] = *MEMORY[0x1E4F92CD0];
  v15[1] = v2;
  v16[0] = &unk_1F4012078;
  v16[1] = MEMORY[0x1E4F1CC28];
  void v15[2] = *MEMORY[0x1E4F92C08];
  void v16[2] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E4F92CA8];
  v13[0] = @"client";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat_withBundleID");
  v14[0] = v5;
  v13[1] = @"tracking";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_BoolFormat");
  v14[1] = v7;
  void v13[2] = @"eventType";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  void v14[2] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v18[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

  return v11;
}

+ (id)entryEventForwardDefinitionPreferredLink
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventForwardDefinitionAudioRouting
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F4012078;
  v14[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"EventType";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v11[1] = @"ScanType";
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventForwardDefinitionUIKitActivity
{
  void v14[2] = *MEMORY[0x1E4F143B8];
  if (+[PLXPCAgent shouldLogiOSWatchOSOnly])
  {
    v13[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB8];
    v11[0] = *MEMORY[0x1E4F92CD0];
    v11[1] = v2;
    v12[0] = &unk_1F4012078;
    v12[1] = MEMORY[0x1E4F1CC28];
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    v14[0] = v3;
    v13[1] = *MEMORY[0x1E4F92CA8];
    v9 = @"Status";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    v5 = objc_msgSend(v4, "commonTypeDict_BoolFormat");
    uint64_t v10 = v5;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    v14[1] = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v7;
}

+ (id)entryEventForwardDefinitionUIKitAlert
{
  void v14[2] = *MEMORY[0x1E4F143B8];
  if (+[PLXPCAgent shouldLogiOSWatchOSOnly])
  {
    v13[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB8];
    v11[0] = *MEMORY[0x1E4F92CD0];
    v11[1] = v2;
    v12[0] = &unk_1F4012078;
    v12[1] = MEMORY[0x1E4F1CC28];
    void v11[2] = *MEMORY[0x1E4F92CE8];
    void v12[2] = MEMORY[0x1E4F1CC38];
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
    v14[0] = v3;
    v13[1] = *MEMORY[0x1E4F92CA8];
    v9 = @"Status";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    v5 = objc_msgSend(v4, "commonTypeDict_BoolFormat");
    uint64_t v10 = v5;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    v14[1] = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v7;
}

+ (id)entryEventForwardDefinitionSafariFetcher
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F4012078;
  v14[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"subevent";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v11[1] = @"item";
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventForwardDefinitionAccessory
{
  v35[2] = *MEMORY[0x1E4F143B8];
  v34[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v32[0] = *MEMORY[0x1E4F92CD0];
  v32[1] = v2;
  v33[0] = &unk_1F4012078;
  v33[1] = MEMORY[0x1E4F1CC28];
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
  v35[0] = v27;
  v34[1] = *MEMORY[0x1E4F92CA8];
  v30[0] = *MEMORY[0x1E4F6A520];
  v26 = [MEMORY[0x1E4F929D8] sharedInstance];
  v25 = objc_msgSend(v26, "commonTypeDict_BoolFormat");
  v31[0] = v25;
  v30[1] = *MEMORY[0x1E4F6A580];
  v24 = [MEMORY[0x1E4F929D8] sharedInstance];
  v23 = objc_msgSend(v24, "commonTypeDict_StringFormat");
  v31[1] = v23;
  v30[2] = *MEMORY[0x1E4F6A570];
  v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  v21 = objc_msgSend(v22, "commonTypeDict_StringFormat");
  v31[2] = v21;
  v30[3] = *MEMORY[0x1E4F6A578];
  v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  v19 = objc_msgSend(v20, "commonTypeDict_StringFormat");
  void v31[3] = v19;
  void v30[4] = *MEMORY[0x1E4F6A5E8];
  uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_StringFormat");
  v31[4] = v17;
  v30[5] = *MEMORY[0x1E4F6A548];
  uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_StringFormat");
  v31[5] = v15;
  v30[6] = *MEMORY[0x1E4F6A558];
  uint64_t v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v14, "commonTypeDict_StringFormat");
  v31[6] = v3;
  v30[7] = *MEMORY[0x1E4F6A5E0];
  uint64_t v28 = *MEMORY[0x1E4F92D10];
  v29 = &unk_1F400D228;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  v31[7] = v4;
  v30[8] = *MEMORY[0x1E4F6A5D8];
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_StringFormat");
  v31[8] = v6;
  v30[9] = *MEMORY[0x1E4F6A528];
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v31[9] = v8;
  v30[10] = *MEMORY[0x1E4F6A5F8];
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v31[10] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:11];
  v35[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];

  return v12;
}

+ (id)entryEventForwardDefinitionAppAccessory
{
  void v22[2] = *MEMORY[0x1E4F143B8];
  v21[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v19[0] = *MEMORY[0x1E4F92CD0];
  v19[1] = v2;
  v20[0] = &unk_1F4012078;
  v20[1] = MEMORY[0x1E4F1CC28];
  void v19[2] = *MEMORY[0x1E4F92C08];
  void v20[2] = MEMORY[0x1E4F1CC38];
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E4F92CA8];
  v17[0] = *MEMORY[0x1E4F6A638];
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_BoolFormat");
  v18[0] = v14;
  v17[1] = *MEMORY[0x1E4F6A630];
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_StringFormat_withBundleID");
  v18[1] = v4;
  void v17[2] = *MEMORY[0x1E4F6A580];
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_StringFormat");
  void v18[2] = v6;
  void v17[3] = *MEMORY[0x1E4F6A640];
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_StringFormat");
  void v18[3] = v8;
  void v17[4] = *MEMORY[0x1E4F6A500];
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  void v18[4] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
  v22[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];

  return v12;
}

+ (id)entryEventForwardDefinitionUARPStatus
{
  v26[2] = *MEMORY[0x1E4F143B8];
  v25[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v23[0] = *MEMORY[0x1E4F92CD0];
  v23[1] = v2;
  v24[0] = &unk_1F4012078;
  v24[1] = MEMORY[0x1E4F1CC28];
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
  v26[0] = v20;
  v25[1] = *MEMORY[0x1E4F92CA8];
  v21[0] = @"state";
  v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v22[0] = v18;
  v21[1] = @"model";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_StringFormat");
  v22[1] = v16;
  void v21[2] = @"requestOffset";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  void v22[2] = v14;
  void v21[3] = @"bytesTransferred";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  void v22[3] = v4;
  void v21[4] = @"activeFWVers";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_StringFormat");
  void v22[4] = v6;
  v21[5] = @"fwVersion";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_StringFormat");
  v22[5] = v8;
  v21[6] = @"error";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v22[6] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:7];
  v26[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];

  return v12;
}

+ (id)entryEventForwardCallScreeningEnabled
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4F92C50];
  uint64_t v10 = *MEMORY[0x1E4F92CD0];
  v11 = &unk_1F4012078;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E4F92CA8];
  v8 = @"Enabled";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v9 = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v13[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v6;
}

+ (id)entryEventForwardDefinitionAirDrop
{
  void v20[2] = *MEMORY[0x1E4F143B8];
  if (+[PLXPCAgent shouldLogiOSWatchOSOnly])
  {
    v19[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB8];
    v17[0] = *MEMORY[0x1E4F92CD0];
    v17[1] = v2;
    v18[0] = &unk_1F4012078;
    v18[1] = MEMORY[0x1E4F1CC28];
    void v17[2] = *MEMORY[0x1E4F92C08];
    void v18[2] = MEMORY[0x1E4F1CC38];
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
    v20[0] = v14;
    v19[1] = *MEMORY[0x1E4F92CA8];
    v15[0] = @"Subevent";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
    v16[0] = v4;
    v15[1] = @"State";
    v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_StringFormat");
    v16[1] = v6;
    void v15[2] = @"bundleId";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_StringFormat_withBundleID");
    void v16[2] = v8;
    void v15[3] = @"pid";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    void v16[3] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
    v20[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventForwardDefinitionAirDropSession
{
  void v21[2] = *MEMORY[0x1E4F143B8];
  v20[0] = *MEMORY[0x1E4F92C50];
  uint64_t v18 = *MEMORY[0x1E4F92CD0];
  v19 = &unk_1F4012078;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  v21[0] = v15;
  v20[1] = *MEMORY[0x1E4F92CA8];
  v16[0] = @"FileSize";
  uint64_t v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v17[0] = v13;
  v16[1] = @"Identifier";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v2, "commonTypeDict_StringFormat");
  v17[1] = v3;
  void v16[2] = @"Interface";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  void v17[2] = v5;
  void v16[3] = @"Subevent";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  void v17[3] = v7;
  void v16[4] = @"State";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  void v17[4] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:5];
  v21[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];

  return v11;
}

+ (id)entryEventForwardDefinitionSiri
{
  void v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F4012078;
  v12[1] = MEMORY[0x1E4F1CC28];
  void v11[2] = *MEMORY[0x1E4F92CE8];
  void v12[2] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  v9 = @"event";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  uint64_t v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventForwardDefinitionInCallService
{
  void v22[2] = *MEMORY[0x1E4F143B8];
  v21[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v19[0] = *MEMORY[0x1E4F92CD0];
  v19[1] = v2;
  v20[0] = &unk_1F4012088;
  v20[1] = MEMORY[0x1E4F1CC28];
  void v19[2] = *MEMORY[0x1E4F92C08];
  void v20[2] = MEMORY[0x1E4F1CC38];
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E4F92CA8];
  v17[0] = @"bundleID";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_StringFormat_withBundleID");
  v18[0] = v14;
  v17[1] = @"status";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  v18[1] = v4;
  void v17[2] = @"kCallSubType";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_StringFormat");
  void v18[2] = v6;
  void v17[3] = @"providerIdentifier";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_StringFormat");
  void v18[3] = v8;
  void v17[4] = @"video";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_BoolFormat");
  void v18[4] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
  v22[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];

  return v12;
}

+ (id)entryEventForwardDefinitionWebApp
{
  void v18[2] = *MEMORY[0x1E4F143B8];
  if (+[PLXPCAgent shouldLogiOSWatchOSOnly])
  {
    v17[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB8];
    v15[0] = *MEMORY[0x1E4F92CD0];
    v15[1] = v2;
    v16[0] = &unk_1F4012078;
    v16[1] = MEMORY[0x1E4F1CC28];
    void v15[2] = *MEMORY[0x1E4F92C08];
    void v16[2] = MEMORY[0x1E4F1CC38];
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
    v18[0] = v3;
    v17[1] = *MEMORY[0x1E4F92CA8];
    v13[0] = @"identifier";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    v5 = objc_msgSend(v4, "commonTypeDict_StringFormat_withAppName");
    v14[0] = v5;
    v13[1] = @"title";
    v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
    v14[1] = v7;
    void v13[2] = @"url";
    v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    v9 = objc_msgSend(v8, "commonTypeDict_StringFormat");
    void v14[2] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
    v18[1] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (id)entryEventForwardDefinitionThermalLevel
{
  void v18[2] = *MEMORY[0x1E4F143B8];
  v17[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v15[0] = *MEMORY[0x1E4F92CD0];
  v15[1] = v2;
  v16[0] = &unk_1F4012078;
  v16[1] = MEMORY[0x1E4F1CC38];
  void v15[2] = *MEMORY[0x1E4F92CB8];
  void v16[2] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E4F92CA8];
  v13[0] = @"startOffset";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v14[0] = v5;
  v13[1] = @"thermalLevel";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v14[1] = v7;
  void v13[2] = @"pressureLevel";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  void v14[2] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v18[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

  return v11;
}

+ (id)entryEventForwardDefinitionThermalHiP
{
  void v20[2] = *MEMORY[0x1E4F143B8];
  v19[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v17[0] = *MEMORY[0x1E4F92CD0];
  v17[1] = v2;
  v18[0] = &unk_1F4012078;
  v18[1] = MEMORY[0x1E4F1CC28];
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E4F92CA8];
  v15[0] = @"timeOffset";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v16[0] = v4;
  v15[1] = @"status";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v16[1] = v6;
  void v15[2] = @"client";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  void v16[2] = v8;
  void v15[3] = @"count";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  void v16[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
  v20[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

  return v12;
}

+ (id)entryEventForwardDefinitionSOSKVSRateLimitingEvent
{
  void v18[2] = *MEMORY[0x1E4F143B8];
  v17[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v15[0] = *MEMORY[0x1E4F92CD0];
  v15[1] = v2;
  v16[0] = &unk_1F4012078;
  v16[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E4F92CA8];
  v13[0] = @"AccessGroup";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v14[0] = v5;
  v13[1] = @"BadnessLevel";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v14[1] = v7;
  void v13[2] = @"peerShouldSend";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_BoolFormat");
  void v14[2] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v18[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

  return v11;
}

+ (id)entryEventForwardDefinitionAppleBacklightBrightness
{
  void v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F4012088;
  v12[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  v9 = @"linearBrightness";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  uint64_t v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventForwardDefinitionNetworkRelay
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F4012078;
  v14[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"State";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v11[1] = @"SessionID";
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventForwardDefinitionNetworkRelayWiFiAssertion
{
  void v20[2] = *MEMORY[0x1E4F143B8];
  v19[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v17[0] = *MEMORY[0x1E4F92CD0];
  v17[1] = v2;
  v18[0] = &unk_1F4012078;
  v18[1] = MEMORY[0x1E4F1CC28];
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E4F92CA8];
  v15[0] = @"WiFiWoWState";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v16[0] = v4;
  v15[1] = @"WiFiClientType";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v16[1] = v6;
  void v15[2] = @"WiFiAssertionReason";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  void v16[2] = v8;
  void v15[3] = @"WiFiAssertionClients";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_StringFormat");
  void v16[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
  v20[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

  return v12;
}

+ (id)entryEventForwardDefinitionSleepMode
{
  void v18[2] = *MEMORY[0x1E4F143B8];
  v17[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v15[0] = *MEMORY[0x1E4F92CD0];
  v15[1] = v2;
  v16[0] = &unk_1F4012078;
  v16[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E4F92CA8];
  v13[0] = @"state";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v14[0] = v5;
  v13[1] = @"specificState";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v14[1] = v7;
  void v13[2] = @"sleepScreenEnabled";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_BoolFormat");
  void v14[2] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v18[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

  return v11;
}

+ (id)entryEventForwardDefinitionsDosimetry
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isWatch])
  {
    v12[0] = *MEMORY[0x1E4F92C50];
    uint64_t v10 = *MEMORY[0x1E4F92CD0];
    v11 = &unk_1F4012078;
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    v13[0] = v2;
    v12[1] = *MEMORY[0x1E4F92CA8];
    v8 = @"noiseEnabled";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_BoolFormat");
    v9 = v4;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    v13[1] = v5;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v6;
}

+ (id)entryEventForwardDefinitionThermalSensors
{
  void v34[2] = *MEMORY[0x1E4F143B8];
  v33[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v31[0] = *MEMORY[0x1E4F92CD0];
  v31[1] = v2;
  v32[0] = &unk_1F4012078;
  v32[1] = MEMORY[0x1E4F1CC28];
  uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
  v34[0] = v28;
  v33[1] = *MEMORY[0x1E4F92CA8];
  v29[0] = @"TS0A";
  v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v30[0] = v26;
  v29[1] = @"TG0B";
  v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v30[1] = v24;
  void v29[2] = @"TSBa";
  v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v30[2] = v22;
  v29[3] = @"TSBE";
  v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v30[3] = v20;
  void v29[4] = @"TSBH";
  v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  void v30[4] = v18;
  v29[5] = @"TSRM";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v30[5] = v16;
  v29[6] = @"TSBQ";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v30[6] = v14;
  v29[7] = @"TSBR";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v30[7] = v4;
  v29[8] = @"TSFC";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v30[8] = v6;
  v29[9] = @"TSFD";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v30[9] = v8;
  v29[10] = @"PG0B";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v30[10] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:11];
  v34[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];

  return v12;
}

+ (id)entryEventForwardDefinitionWirelessSync
{
  void v21[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isTVOS])
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    v20[0] = *MEMORY[0x1E4F92C50];
    uint64_t v18 = *MEMORY[0x1E4F92CD0];
    v19 = &unk_1F4012078;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    v21[0] = v15;
    v20[1] = *MEMORY[0x1E4F92CA8];
    v16[0] = @"HostClient";
    uint64_t v14 = [MEMORY[0x1E4F929D8] sharedInstance];
    v13 = objc_msgSend(v14, "commonTypeDict_StringFormat");
    v17[0] = v13;
    v16[1] = @"Service";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
    v17[1] = v4;
    void v16[2] = @"ServiceInstanceID";
    v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_StringFormat");
    void v17[2] = v6;
    void v16[3] = @"DurationSeconds";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
    void v17[3] = v8;
    void v16[4] = @"SyncStart";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v10 = objc_msgSend(v9, "commonTypeDict_BoolFormat");
    void v17[4] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:5];
    v21[1] = v11;
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  }
  return v2;
}

+ (id)entryEventForwardDefinitionPasskeyAuthentication
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4F92C50];
  uint64_t v10 = *MEMORY[0x1E4F92CD0];
  v11 = &unk_1F4012078;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E4F92CA8];
  v8 = @"AuthenticationDidStart";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_BoolFormat");
  v9 = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v13[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v6;
}

+ (id)entryEventForwardDefinitionEnhancedDiscovery
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = *MEMORY[0x1E4F92C50];
  uint64_t v12 = *MEMORY[0x1E4F92CD0];
  v13 = &unk_1F4012078;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E4F92CA8];
  v10[0] = @"Reason";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  v10[1] = @"Enabled";
  v11[0] = v4;
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_BoolFormat");
  v11[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v15[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v8;
}

+ (id)entryEventForwardDefinitionRapidSecurityResponse
{
  void v57[2] = *MEMORY[0x1E4F143B8];
  v56[0] = *MEMORY[0x1E4F92C50];
  uint64_t v54 = *MEMORY[0x1E4F92CD0];
  v55 = &unk_1F4012078;
  v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
  v57[0] = v51;
  v56[1] = *MEMORY[0x1E4F92CA8];
  v52[0] = @"EventType";
  v50 = [MEMORY[0x1E4F929D8] sharedInstance];
  v49 = objc_msgSend(v50, "commonTypeDict_IntegerFormat");
  v53[0] = v49;
  v52[1] = @"event";
  v48 = [MEMORY[0x1E4F929D8] sharedInstance];
  v47 = objc_msgSend(v48, "commonTypeDict_IntegerFormat");
  v53[1] = v47;
  v52[2] = @"RequestUUID";
  v46 = [MEMORY[0x1E4F929D8] sharedInstance];
  v45 = objc_msgSend(v46, "commonTypeDict_StringFormat");
  v53[2] = v45;
  v52[3] = @"result";
  v44 = [MEMORY[0x1E4F929D8] sharedInstance];
  v43 = objc_msgSend(v44, "commonTypeDict_StringFormat");
  v53[3] = v43;
  void v52[4] = @"RollbackRecProcAttributedProc";
  v42 = [MEMORY[0x1E4F929D8] sharedInstance];
  v41 = objc_msgSend(v42, "commonTypeDict_StringFormat");
  v53[4] = v41;
  v52[5] = @"failureReason";
  v40 = [MEMORY[0x1E4F929D8] sharedInstance];
  v39 = objc_msgSend(v40, "commonTypeDict_StringFormat");
  v53[5] = v39;
  v52[6] = @"type";
  v38 = [MEMORY[0x1E4F929D8] sharedInstance];
  v37 = objc_msgSend(v38, "commonTypeDict_StringFormat");
  v53[6] = v37;
  v52[7] = @"updateType";
  v36 = [MEMORY[0x1E4F929D8] sharedInstance];
  v35 = objc_msgSend(v36, "commonTypeDict_IntegerFormat");
  v53[7] = v35;
  v52[8] = @"eventTime";
  v34 = [MEMORY[0x1E4F929D8] sharedInstance];
  v33 = objc_msgSend(v34, "commonTypeDict_IntegerFormat");
  v53[8] = v33;
  v52[9] = @"targetOSVersion";
  v32 = [MEMORY[0x1E4F929D8] sharedInstance];
  v31 = objc_msgSend(v32, "commonTypeDict_StringFormat");
  v53[9] = v31;
  v52[10] = @"installTonight";
  v30 = [MEMORY[0x1E4F929D8] sharedInstance];
  v29 = objc_msgSend(v30, "commonTypeDict_BoolFormat");
  v53[10] = v29;
  v52[11] = @"brainVersion";
  uint64_t v28 = [MEMORY[0x1E4F929D8] sharedInstance];
  v27 = objc_msgSend(v28, "commonTypeDict_StringFormat");
  v53[11] = v27;
  v52[12] = @"MobileAssetAssetAudience";
  v26 = [MEMORY[0x1E4F929D8] sharedInstance];
  v25 = objc_msgSend(v26, "commonTypeDict_StringFormat");
  v53[12] = v25;
  v52[13] = @"breadcrumbs";
  v24 = [MEMORY[0x1E4F929D8] sharedInstance];
  v23 = objc_msgSend(v24, "commonTypeDict_StringFormat");
  v53[13] = v23;
  v52[14] = @"originalOSVersion";
  v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  v21 = objc_msgSend(v22, "commonTypeDict_StringFormat");
  v53[14] = v21;
  v52[15] = @"forcedResetUptime";
  v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v53[15] = v19;
  v52[16] = @"initialForcedResetUptime";
  uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v53[16] = v17;
  v52[17] = @"preRecoveryClientId";
  uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_StringFormat");
  v53[17] = v15;
  v52[18] = @"recoveryInitiated";
  uint64_t v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_BoolFormat");
  v53[18] = v13;
  v52[19] = @"controllerVersion";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v2, "commonTypeDict_StringFormat");
  v53[19] = v3;
  v52[20] = @"preConv";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v53[20] = v5;
  v52[21] = @"postConv";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
  v53[21] = v7;
  v52[22] = @"fsckMetrics";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_StringFormat");
  v53[22] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:23];
  v57[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:2];

  return v11;
}

+ (id)entryEventBackwardDefinitions
{
  v27[21] = *MEMORY[0x1E4F143B8];
  v26[0] = @"SiriAlarm";
  v25 = [a1 entryEventBackwardDefinitionSiriFalseAlarm];
  v27[0] = v25;
  v26[1] = @"PeekPop";
  v24 = [a1 entryEventBackwardDefinitionPeekPop];
  v27[1] = v24;
  v26[2] = @"AASSampling";
  v23 = [a1 entryEventBackwardDefinitionAttentionSampling];
  void v27[2] = v23;
  void v26[3] = @"AASPolling";
  v22 = [a1 entryEventBackwardDefinitionAttentionPolling];
  void v27[3] = v22;
  void v26[4] = @"AASService";
  v21 = [a1 entryEventBackwardDefinitionAttentionService];
  v27[4] = v21;
  v26[5] = @"ODOff";
  v20 = [a1 entryEventBackwardDefinitionODOff];
  v27[5] = v20;
  v26[6] = @"ODOn";
  v19 = [a1 entryEventBackwardDefinitionODOn];
  v27[6] = v19;
  v26[7] = @"ODHN";
  uint64_t v18 = [a1 entryEventBackwardDefinitionODHN];
  v27[7] = v18;
  v26[8] = @"DRMaxRate";
  v17 = [a1 entryEventBackwardDefinitionDRMaxRate];
  v27[8] = v17;
  void v26[9] = @"FrameCount";
  uint64_t v16 = [a1 entryEventBackwardDefinitionFrameCount];
  v27[9] = v16;
  v26[10] = @"EnergyTelemetry";
  v15 = [a1 entryEventBackwardDefinitionEnergyTelemetry];
  v27[10] = v15;
  v26[11] = @"UbiquityAccountStatistics";
  uint64_t v3 = [a1 entryEventBackwardDefinitionUbiquityAccountStatistics];
  v27[11] = v3;
  v26[12] = @"CKKSSyncing";
  uint64_t v4 = [a1 entryEventBackwardDefinitionCKKSSyncing];
  v27[12] = v4;
  v26[13] = @"CallScreeningDuration";
  v5 = [a1 entryEventBackwardDefinitionCallScreeningDuration];
  v27[13] = v5;
  v26[14] = @"KeyboardSession";
  v6 = [a1 entryEventBackwardDefinitionKeyboardSession];
  v27[14] = v6;
  v26[15] = @"KeyboardTrackpadResidencies";
  v7 = [a1 entryEventBackwardDefinitionTrackpadResidencies];
  v27[15] = v7;
  v26[16] = @"ActiveStylusInking";
  v8 = [a1 entryEventBackwardDefinitionActiveStylus];
  v27[16] = v8;
  v26[17] = @"PassiveStylusInking";
  v9 = [a1 entryEventBackwardDefinitionPassiveStylus];
  v27[17] = v9;
  v26[18] = @"VoicemailDuration";
  uint64_t v10 = [a1 entryEventBackwardDefinitionVoicemailDuration];
  v27[18] = v10;
  v26[19] = @"AVConference";
  v11 = [a1 entryEventBackwardDefinitionAVConference];
  v27[19] = v11;
  v26[20] = @"SpotlightQos";
  uint64_t v12 = [a1 entryEventBackwardDefinitionSpotlightQos];
  v27[20] = v12;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:21];

  return v14;
}

+ (id)entryEventBackwardDefinitionSiriFalseAlarm
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F4012078;
  v14[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"numFalseWakeUp";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v11[1] = @"secondsSinceLastReport";
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventBackwardDefinitionCallScreeningDuration
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4F92C50];
  uint64_t v10 = *MEMORY[0x1E4F92CD0];
  v11 = &unk_1F4012078;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E4F92CA8];
  v8 = @"Duration";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
  v9 = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v13[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v6;
}

+ (id)entryEventBackwardDefinitionKeyboardSession
{
  void v24[2] = *MEMORY[0x1E4F143B8];
  v23[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v21[0] = *MEMORY[0x1E4F92CD0];
  v21[1] = v2;
  v22[0] = &unk_1F4012088;
  v22[1] = MEMORY[0x1E4F1CC28];
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  v24[0] = v18;
  v23[1] = *MEMORY[0x1E4F92CA8];
  v19[0] = @"WordsTapped";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v20[0] = v16;
  v19[1] = @"CharactersTapped";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v20[1] = v14;
  void v19[2] = @"WordsPathed";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  void v20[2] = v4;
  void v19[3] = @"CharactersPathed";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  void v20[3] = v6;
  void v19[4] = @"TimeSpentTapTyping";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  void v20[4] = v8;
  v19[5] = @"TimeSpentPathTyping";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v20[5] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:6];
  v24[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];

  return v12;
}

+ (id)entryEventBackwardDefinitionTrackpadResidencies
{
  void v22[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isiPad])
  {
    v21[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB8];
    v19[0] = *MEMORY[0x1E4F92CD0];
    v19[1] = v2;
    v20[0] = &unk_1F4012078;
    v20[1] = MEMORY[0x1E4F1CC28];
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
    v22[0] = v16;
    v21[1] = *MEMORY[0x1E4F92CA8];
    v17[0] = @"SampleTime";
    v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v14 = objc_msgSend(v15, "commonTypeDict_RealFormat");
    v18[0] = v14;
    v17[1] = @"Active";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
    v18[1] = v4;
    void v17[2] = @"Inactive";
    v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_RealFormat");
    void v18[2] = v6;
    void v17[3] = @"LowPower";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
    void v18[3] = v8;
    void v17[4] = @"Ready";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v10 = objc_msgSend(v9, "commonTypeDict_RealFormat");
    void v18[4] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
    v22[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionActiveStylus
{
  void v22[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isiPad])
  {
    v21[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB8];
    v19[0] = *MEMORY[0x1E4F92CD0];
    v19[1] = v2;
    v20[0] = &unk_1F4012088;
    v20[1] = MEMORY[0x1E4F1CC28];
    void v19[2] = *MEMORY[0x1E4F92CE8];
    void v20[2] = MEMORY[0x1E4F1CC38];
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
    v22[0] = v16;
    v21[1] = *MEMORY[0x1E4F92CA8];
    v17[0] = @"Inking";
    v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v14 = objc_msgSend(v15, "commonTypeDict_RealFormat");
    v18[0] = v14;
    v17[1] = @"Hovering";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
    v18[1] = v4;
    void v17[2] = @"NotTracking";
    v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_RealFormat");
    void v18[2] = v6;
    void v17[3] = @"SampleTime";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
    void v18[3] = v8;
    void v17[4] = @"TouchDownCount";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    void v18[4] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
    v22[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionPassiveStylus
{
  void v22[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isiPad])
  {
    v21[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB8];
    v19[0] = *MEMORY[0x1E4F92CD0];
    v19[1] = v2;
    v20[0] = &unk_1F4012088;
    v20[1] = MEMORY[0x1E4F1CC28];
    void v19[2] = *MEMORY[0x1E4F92CE8];
    void v20[2] = MEMORY[0x1E4F1CC38];
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
    v22[0] = v16;
    v21[1] = *MEMORY[0x1E4F92CA8];
    v17[0] = @"Inking";
    v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v14 = objc_msgSend(v15, "commonTypeDict_RealFormat");
    v18[0] = v14;
    v17[1] = @"Hovering";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
    v18[1] = v4;
    void v17[2] = @"NotTracking";
    v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_RealFormat");
    void v18[2] = v6;
    void v17[3] = @"SampleTime";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
    void v18[3] = v8;
    void v17[4] = @"TouchDownCount";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    void v18[4] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
    v22[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionVoicemailDuration
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4F92C50];
  uint64_t v10 = *MEMORY[0x1E4F92CD0];
  v11 = &unk_1F4012078;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E4F92CA8];
  v8 = @"duration";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v9 = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v13[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v6;
}

+ (id)entryEventBackwardDefinitionPeekPop
{
  void v20[2] = *MEMORY[0x1E4F143B8];
  if (+[PLXPCAgent shouldLogiOSWatchOSOnly])
  {
    v19[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB8];
    v17[0] = *MEMORY[0x1E4F92CD0];
    v17[1] = v2;
    v18[0] = &unk_1F4012078;
    v18[1] = MEMORY[0x1E4F1CC28];
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
    v20[0] = v14;
    v19[1] = *MEMORY[0x1E4F92CA8];
    v15[0] = @"Process-ID";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v16[0] = v4;
    v15[1] = @"PeekCount";
    v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v16[1] = v6;
    void v15[2] = @"PopCount";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    void v16[2] = v8;
    void v15[3] = @"PeekDuration";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v10 = objc_msgSend(v9, "commonTypeDict_RealFormat");
    void v16[3] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
    v20[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionSpotlightQos
{
  void v18[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isMac])
  {
    v17[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB8];
    v15[0] = *MEMORY[0x1E4F92CD0];
    v15[1] = v2;
    v16[0] = &unk_1F4012078;
    v16[1] = MEMORY[0x1E4F1CC28];
    void v15[2] = *MEMORY[0x1E4F92CE8];
    void v16[2] = MEMORY[0x1E4F1CC38];
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
    v18[0] = v3;
    v17[1] = *MEMORY[0x1E4F92CA8];
    v13[0] = @"utiType";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
    v14[0] = v5;
    v13[1] = @"qos";
    v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v14[1] = v7;
    void v13[2] = @"count";
    v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    void v14[2] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
    v18[1] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (id)entryEventBackwardDefinitionAttentionSampling
{
  void v18[2] = *MEMORY[0x1E4F143B8];
  if (+[PLXPCAgent shouldLogiOSWatchOSOnly])
  {
    v17[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB8];
    v15[0] = *MEMORY[0x1E4F92CD0];
    v15[1] = v2;
    v16[0] = &unk_1F4012078;
    v16[1] = MEMORY[0x1E4F1CC28];
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
    v18[0] = v3;
    v17[1] = *MEMORY[0x1E4F92CA8];
    v13[0] = @"client";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
    v14[0] = v5;
    v13[1] = @"samplingRateMS";
    v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v14[1] = v7;
    void v13[2] = @"cumulativeSamplingTimeMS";
    v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    void v14[2] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
    v18[1] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (id)entryEventBackwardDefinitionAttentionPolling
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  if (+[PLXPCAgent shouldLogiOSWatchOSOnly])
  {
    v15[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB8];
    v13[0] = *MEMORY[0x1E4F92CD0];
    v13[1] = v2;
    v14[0] = &unk_1F4012078;
    v14[1] = MEMORY[0x1E4F1CC28];
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
    v16[0] = v3;
    v15[1] = *MEMORY[0x1E4F92CA8];
    v11[0] = @"client";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
    v11[1] = @"cumulativeSamplingTimeMS";
    v12[0] = v5;
    v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v12[1] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    v16[1] = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  }
  else
  {
    v9 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v9;
}

+ (id)entryEventBackwardDefinitionAttentionService
{
  void v22[2] = *MEMORY[0x1E4F143B8];
  if (+[PLXPCAgent shouldLogiOSWatchOSOnly])
  {
    v21[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB8];
    v19[0] = *MEMORY[0x1E4F92CD0];
    v19[1] = v2;
    v20[0] = &unk_1F4012078;
    v20[1] = MEMORY[0x1E4F1CC28];
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
    v22[0] = v16;
    v21[1] = *MEMORY[0x1E4F92CA8];
    v17[0] = @"singleShotsRequested";
    v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v18[0] = v14;
    v17[1] = @"pollsRequested";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v18[1] = v4;
    void v17[2] = @"cumulativeSamplingTimeMS";
    v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    void v18[2] = v6;
    void v17[3] = @"positiveOutcomes";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    void v18[3] = v8;
    void v17[4] = @"negativeOutcomes";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    void v18[4] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
    v22[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionODOff
{
  void v34[2] = *MEMORY[0x1E4F143B8];
  if (+[PLXPCAgent shouldLogiOSWatchOSOnly])
  {
    v33[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB8];
    v31[0] = *MEMORY[0x1E4F92CD0];
    v31[1] = v2;
    v32[0] = &unk_1F4012088;
    v32[1] = MEMORY[0x1E4F1CC28];
    uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
    v34[0] = v28;
    v33[1] = *MEMORY[0x1E4F92CA8];
    v29[0] = @"mach_absolute_time";
    v27 = [MEMORY[0x1E4F929D8] sharedInstance];
    v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
    v30[0] = v26;
    v29[1] = @"DR_0";
    v25 = [MEMORY[0x1E4F929D8] sharedInstance];
    v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
    v30[1] = v24;
    void v29[2] = @"DR_1";
    v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
    v30[2] = v22;
    v29[3] = @"DR_2";
    v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
    v30[3] = v20;
    void v29[4] = @"DR_3";
    v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
    void v30[4] = v18;
    v29[5] = @"DR_4";
    v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
    v30[5] = v16;
    v29[6] = @"DR_5";
    v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v30[6] = v14;
    v29[7] = @"DR_6";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v30[7] = v4;
    v29[8] = @"DR_7";
    v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v30[8] = v6;
    v29[9] = @"DR_8";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v30[9] = v8;
    v29[10] = @"DR_9";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v30[10] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:11];
    v34[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionODOn
{
  void v34[2] = *MEMORY[0x1E4F143B8];
  if (+[PLXPCAgent shouldLogiOSWatchOSOnly])
  {
    v33[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB8];
    v31[0] = *MEMORY[0x1E4F92CD0];
    v31[1] = v2;
    v32[0] = &unk_1F4012088;
    v32[1] = MEMORY[0x1E4F1CC28];
    uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
    v34[0] = v28;
    v33[1] = *MEMORY[0x1E4F92CA8];
    v29[0] = @"mach_absolute_time";
    v27 = [MEMORY[0x1E4F929D8] sharedInstance];
    v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
    v30[0] = v26;
    v29[1] = @"DR_0";
    v25 = [MEMORY[0x1E4F929D8] sharedInstance];
    v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
    v30[1] = v24;
    void v29[2] = @"DR_1";
    v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
    v30[2] = v22;
    v29[3] = @"DR_2";
    v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
    v30[3] = v20;
    void v29[4] = @"DR_3";
    v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
    void v30[4] = v18;
    v29[5] = @"DR_4";
    v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
    v30[5] = v16;
    v29[6] = @"DR_5";
    v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v30[6] = v14;
    v29[7] = @"DR_6";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v30[7] = v4;
    v29[8] = @"DR_7";
    v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v30[8] = v6;
    v29[9] = @"DR_8";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v30[9] = v8;
    v29[10] = @"DR_9";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v30[10] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:11];
    v34[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionODHN
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  if (+[PLXPCAgent shouldLogiOSWatchOSOnly])
  {
    v15[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB8];
    v13[0] = *MEMORY[0x1E4F92CD0];
    v13[1] = v2;
    v14[0] = &unk_1F4012088;
    v14[1] = MEMORY[0x1E4F1CC28];
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
    v16[0] = v3;
    v15[1] = *MEMORY[0x1E4F92CA8];
    v11[0] = @"mach_absolute_time";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v11[1] = @"count";
    v12[0] = v5;
    v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v12[1] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    v16[1] = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  }
  else
  {
    v9 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v9;
}

+ (id)entryEventBackwardDefinitionDRMaxRate
{
  void v34[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isiPhone])
  {
    v33[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB8];
    v31[0] = *MEMORY[0x1E4F92CD0];
    v31[1] = v2;
    v32[0] = &unk_1F4012078;
    v32[1] = MEMORY[0x1E4F1CC28];
    void v31[2] = *MEMORY[0x1E4F92CE8];
    void v32[2] = MEMORY[0x1E4F1CC38];
    uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];
    v34[0] = v28;
    v33[1] = *MEMORY[0x1E4F92CA8];
    v29[0] = @"mach_absolute_time";
    v27 = [MEMORY[0x1E4F929D8] sharedInstance];
    v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
    v30[0] = v26;
    v29[1] = @"DR_0";
    v25 = [MEMORY[0x1E4F929D8] sharedInstance];
    v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
    v30[1] = v24;
    void v29[2] = @"DR_1";
    v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
    v30[2] = v22;
    v29[3] = @"DR_2";
    v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
    v30[3] = v20;
    void v29[4] = @"DR_3";
    v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
    void v30[4] = v18;
    v29[5] = @"DR_4";
    v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
    v30[5] = v16;
    v29[6] = @"DR_5";
    v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v30[6] = v14;
    v29[7] = @"DR_6";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v30[7] = v4;
    v29[8] = @"DR_7";
    v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v30[8] = v6;
    v29[9] = @"DR_8";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v30[9] = v8;
    v29[10] = @"DR_9";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v30[10] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:11];
    v34[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionFrameCount
{
  void v24[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isiPhone])
  {
    v23[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB8];
    v21[0] = *MEMORY[0x1E4F92CD0];
    v21[1] = v2;
    v22[0] = &unk_1F4012078;
    v22[1] = MEMORY[0x1E4F1CC28];
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
    v24[0] = v18;
    v23[1] = *MEMORY[0x1E4F92CA8];
    v19[0] = @"reason";
    v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
    v20[0] = v16;
    v19[1] = @"duration";
    v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v20[1] = v14;
    void v19[2] = @"bucket_0";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    void v20[2] = v4;
    void v19[3] = @"bucket_1";
    v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    void v20[3] = v6;
    void v19[4] = @"bucket_2";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    void v20[4] = v8;
    v19[5] = @"bucket_3";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v20[5] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:6];
    v24[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionEnergyTelemetry
{
  void v20[2] = *MEMORY[0x1E4F143B8];
  v19[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v17[0] = *MEMORY[0x1E4F92CD0];
  v17[1] = v2;
  v18[0] = &unk_1F4012088;
  v18[1] = MEMORY[0x1E4F1CC28];
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E4F92CA8];
  v15[0] = @"slot_id";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v16[0] = v4;
  v15[1] = @"wall_energy_consumed";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_RealFormat");
  v16[1] = v6;
  void v15[2] = @"system_energy_consumed";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
  void v16[2] = v8;
  void v15[3] = @"adapter_family";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  void v16[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
  v20[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

  return v12;
}

+ (id)entryEventBackwardDefinitionUbiquityAccountStatistics
{
  void v20[2] = *MEMORY[0x1E4F143B8];
  if (+[PLXPCAgent shouldLogiOSWatchOSOnly])
  {
    v19[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB8];
    v17[0] = *MEMORY[0x1E4F92CD0];
    v17[1] = v2;
    v18[0] = &unk_1F4012078;
    v18[1] = MEMORY[0x1E4F1CC28];
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
    v20[0] = v14;
    v19[1] = *MEMORY[0x1E4F92CA8];
    v15[0] = @"totalNumberOfItems";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v16[0] = v4;
    v15[1] = @"totalNumberOfFaults";
    v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v16[1] = v6;
    void v15[2] = @"totalNumberOfDocuments";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    void v16[2] = v8;
    void v15[3] = @"totalNumberOfDirectories";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    void v16[3] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
    v20[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionCKKSSyncing
{
  void v20[2] = *MEMORY[0x1E4F143B8];
  v19[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v17[0] = *MEMORY[0x1E4F92CD0];
  v17[1] = v2;
  v18[0] = &unk_1F4012078;
  v18[1] = MEMORY[0x1E4F1CC28];
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E4F92CA8];
  v15[0] = @"operation";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  v16[0] = v4;
  v15[1] = @"accessgroup";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_StringFormat");
  v16[1] = v6;
  void v15[2] = @"count";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  void v16[2] = v8;
  void v15[3] = @"zone";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_StringFormat");
  void v16[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
  v20[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

  return v12;
}

+ (id)entryEventBackwardDefinitionAVConference
{
  void v24[2] = *MEMORY[0x1E4F143B8];
  v23[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v21[0] = *MEMORY[0x1E4F92CD0];
  v21[1] = v2;
  v22[0] = &unk_1F4012078;
  v22[1] = MEMORY[0x1E4F1CC28];
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  v24[0] = v18;
  v23[1] = *MEMORY[0x1E4F92CA8];
  v19[0] = @"ClientName";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_StringFormat");
  v20[0] = v16;
  v19[1] = @"ServiceName";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v14 = objc_msgSend(v15, "commonTypeDict_StringFormat");
  v20[1] = v14;
  void v19[2] = @"DRTN";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  void v20[2] = v4;
  void v19[3] = @"DUPTYPE";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  void v20[3] = v6;
  void v19[4] = @"CONFIG";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_StringFormat");
  void v20[4] = v8;
  v19[5] = @"DCCFG";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_StringFormat");
  v20[5] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:6];
  v24[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];

  return v12;
}

+ (id)entryEventIntervalDefinitions
{
  v20[11] = *MEMORY[0x1E4F143B8];
  if (+[PLXPCAgent shouldLogiOSWatchOSOnly])
  {
    v19[0] = @"AirTraffic_AssetDownload";
    uint64_t v16 = [a1 entryEventIntervalDefinitionAirTrafficAssetDownload];
    v20[0] = v16;
    v19[1] = @"AnimatedStickerCreation";
    uint64_t v3 = [a1 entryEventIntervalDefinitionAnimatedStickerCreation];
    v20[1] = v3;
    void v19[2] = @"AnimatedStickerScoring";
    uint64_t v4 = [a1 entryEventIntervalDefinitionAnimatedStickerScoring];
    void v20[2] = v4;
    void v19[3] = @"CoreDuet_KnowledgeSync";
    v5 = [a1 entryEventIntervalDefinitionCoreDuetKnowledgeSync];
    void v20[3] = v5;
    void v19[4] = @"MomentsDeferredProcessing";
    v15 = [a1 entryEventIntervalDefinitionMomentsDeferredProcessing];
    void v20[4] = v15;
    v19[5] = @"RapportReceivedMessage";
    v6 = [a1 entryEventIntervalDefinitionRapportReceivedMessage];
    v20[5] = v6;
    void v19[6] = @"SpotlightIndexes";
    v7 = [a1 entryEventIntervalDefinitionSpotlightIndexes];
    void v20[6] = v7;
    v19[7] = @"SpotlightQueries";
    v8 = [a1 entryEventIntervalDefinitionSpotlightQueries];
    v20[7] = v8;
    v19[8] = @"StaticStickerCreation";
    v9 = [a1 entryEventIntervalDefinitionStaticStickerCreation];
    v20[8] = v9;
    v19[9] = @"StaticStickerScoring";
    uint64_t v10 = [a1 entryEventIntervalDefinitionStaticStickerScoring];
    v20[9] = v10;
    v19[10] = @"UserSafetyProcessing";
    v11 = [a1 entryEventIntervalDefinitionUserSafety];
    v20[10] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:11];

    v13 = (void *)v16;
  }
  else
  {
    v17[0] = @"RapportReceivedMessage";
    v13 = [a1 entryEventIntervalDefinitionRapportReceivedMessage];
    v18[0] = v13;
    v17[1] = @"SpotlightIndexes";
    uint64_t v3 = [a1 entryEventIntervalDefinitionSpotlightIndexes];
    v18[1] = v3;
    void v17[2] = @"SpotlightQueries";
    uint64_t v4 = [a1 entryEventIntervalDefinitionSpotlightQueries];
    void v18[2] = v4;
    void v17[3] = @"UserSafetyProcessing";
    v5 = [a1 entryEventIntervalDefinitionUserSafety];
    void v18[3] = v5;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];
  }

  return v12;
}

+ (id)entryEventIntervalDefinitionAirTrafficAssetDownload
{
  void v33[2] = *MEMORY[0x1E4F143B8];
  v32[0] = *MEMORY[0x1E4F92C50];
  uint64_t v30 = *MEMORY[0x1E4F92CD0];
  v31 = &unk_1F4012078;
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  v33[0] = v27;
  v32[1] = *MEMORY[0x1E4F92CA8];
  v28[0] = @"timestampEnd";
  v26 = [MEMORY[0x1E4F929D8] sharedInstance];
  v25 = objc_msgSend(v26, "commonTypeDict_DateFormat");
  v29[0] = v25;
  v28[1] = @"linkType";
  v24 = [MEMORY[0x1E4F929D8] sharedInstance];
  v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v29[1] = v23;
  v28[2] = @"dataclass";
  v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  v21 = objc_msgSend(v22, "commonTypeDict_StringFormat");
  void v29[2] = v21;
  void v28[3] = @"assetType";
  v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  v19 = objc_msgSend(v20, "commonTypeDict_StringFormat");
  v29[3] = v19;
  void v28[4] = @"sumBytesRequested";
  uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  void v29[4] = v17;
  v28[5] = @"countDownloadsBegun";
  uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v29[5] = v15;
  v28[6] = @"countCanUseCellular";
  id v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v29[6] = v13;
  v28[7] = @"countIsForeground";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v29[7] = v3;
  v28[8] = @"sumBytesDownloaded";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v29[8] = v5;
  v28[9] = @"countDownloadsSucceeded";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v29[9] = v7;
  v28[10] = @"countDownloadsFailed";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v29[10] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:11];
  v33[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];

  return v11;
}

+ (id)entryEventIntervalDefinitionAnimatedStickerCreation
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = *MEMORY[0x1E4F92C50];
  uint64_t v12 = *MEMORY[0x1E4F92CD0];
  v13 = &unk_1F4012078;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E4F92CA8];
  v10[0] = @"ProcessedFrameCount";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v10[1] = @"timestampEnd";
  v11[0] = v4;
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_DateFormat");
  v11[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v15[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v8;
}

+ (id)entryEventIntervalDefinitionAnimatedStickerScoring
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4F92C50];
  uint64_t v10 = *MEMORY[0x1E4F92CD0];
  v11 = &unk_1F4012078;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E4F92CA8];
  v8 = @"timestampEnd";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_DateFormat");
  v9 = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v13[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v6;
}

+ (id)entryEventIntervalDefinitionCoreDuetKnowledgeSync
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = *MEMORY[0x1E4F92C50];
  uint64_t v12 = *MEMORY[0x1E4F92CD0];
  v13 = &unk_1F4012078;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E4F92CA8];
  v10[0] = @"timestampEnd";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_DateFormat");
  v10[1] = @"isEmpty";
  v11[0] = v4;
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_BoolFormat");
  v11[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v15[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v8;
}

+ (id)entryEventIntervalDefinitionMomentsDeferredProcessing
{
  void v19[2] = *MEMORY[0x1E4F143B8];
  v18[0] = *MEMORY[0x1E4F92C50];
  uint64_t v16 = *MEMORY[0x1E4F92CD0];
  v17 = &unk_1F4012078;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  v19[0] = v13;
  v18[1] = *MEMORY[0x1E4F92CA8];
  v14[0] = @"ProcessingType";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v15[0] = v3;
  v14[1] = @"ProcessedAssetCount";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v15[1] = v5;
  void v14[2] = @"RequestedAssetCount";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  void v15[2] = v7;
  void v14[3] = @"timestampEnd";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_DateFormat");
  void v15[3] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  v19[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];

  return v11;
}

+ (id)entryEventIntervalDefinitionRapportReceivedMessage
{
  v28[2] = *MEMORY[0x1E4F143B8];
  v27[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v25[0] = *MEMORY[0x1E4F92CD0];
  v25[1] = v2;
  v26[0] = &unk_1F4012078;
  v26[1] = MEMORY[0x1E4F1CC38];
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
  v28[0] = v22;
  v27[1] = *MEMORY[0x1E4F92CA8];
  v23[0] = @"timestampEnd";
  v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  v20 = objc_msgSend(v21, "commonTypeDict_DateFormat");
  v24[0] = v20;
  v23[1] = @"type";
  v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v24[1] = v18;
  void v23[2] = @"bytes";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  void v24[2] = v16;
  v23[3] = @"identifier";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v14 = objc_msgSend(v15, "commonTypeDict_StringFormat_withBundleID");
  v24[3] = v14;
  v23[4] = @"appID";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_StringFormat_withBundleID");
  void v24[4] = v4;
  v23[5] = @"linkType";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v24[5] = v6;
  v23[6] = @"messages";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v24[6] = v8;
  v23[7] = @"senderID";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_StringFormat");
  v24[7] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:8];
  v28[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];

  return v12;
}

+ (id)entryEventIntervalDefinitionSpotlightIndexes
{
  v36[2] = *MEMORY[0x1E4F143B8];
  v35[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v33[0] = *MEMORY[0x1E4F92CD0];
  v33[1] = v2;
  v34[0] = &unk_1F40120C8;
  v34[1] = MEMORY[0x1E4F1CC38];
  uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
  v36[0] = v30;
  v35[1] = *MEMORY[0x1E4F92CA8];
  v31[0] = @"timestampEnd";
  v29 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v28 = objc_msgSend(v29, "commonTypeDict_DateFormat");
  v32[0] = v28;
  v31[1] = @"BundleID";
  v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  v26 = objc_msgSend(v27, "commonTypeDict_StringFormat_withBundleID");
  v32[1] = v26;
  void v31[2] = @"IndexCount";
  v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  void v32[2] = v24;
  void v31[3] = @"DeletedCount";
  v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  void v32[3] = v22;
  v31[4] = @"WatchdogCount";
  v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v32[4] = v20;
  v31[5] = @"ClientMitigationCount";
  v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  void v32[5] = v18;
  v31[6] = @"processName";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_StringFormat");
  v32[6] = v16;
  v31[7] = @"computeEmbeddings";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v32[7] = v14;
  v31[8] = @"computeKeyphrases";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v32[8] = v4;
  v31[9] = @"reindexItemCount";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v32[9] = v6;
  v31[10] = @"reindexAll";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v32[10] = v8;
  void v31[11] = @"reason";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v32[11] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:12];
  v36[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];

  return v12;
}

+ (id)entryEventIntervalDefinitionSpotlightQueries
{
  v28[2] = *MEMORY[0x1E4F143B8];
  v27[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v25[0] = *MEMORY[0x1E4F92CD0];
  v25[1] = v2;
  v26[0] = &unk_1F40120A8;
  v26[1] = MEMORY[0x1E4F1CC38];
  void v25[2] = *MEMORY[0x1E4F92C58];
  v24[0] = @"BundleID";
  v24[1] = @"ResultCount";
  void v24[2] = @"StartQueryCount";
  v24[3] = @"CancelQueryCount";
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
  void v26[2] = v21;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
  v28[0] = v20;
  v27[1] = *MEMORY[0x1E4F92CA8];
  v22[0] = @"timestampEnd";
  v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_DateFormat");
  v23[0] = v18;
  v22[1] = @"BundleID";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_StringFormat_withBundleID");
  v23[1] = v16;
  void v22[2] = @"Reason";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v14 = objc_msgSend(v15, "commonTypeDict_StringFormat");
  void v23[2] = v14;
  void v22[3] = @"StartQueryCount";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v23[3] = v4;
  void v22[4] = @"CancelQueryCount";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v23[4] = v6;
  v22[5] = @"ResultCount";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v23[5] = v8;
  v22[6] = @"processName";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_StringFormat");
  v23[6] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:7];
  v28[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];

  return v12;
}

+ (id)entryEventIntervalDefinitionStaticStickerCreation
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4F92C50];
  uint64_t v10 = *MEMORY[0x1E4F92CD0];
  v11 = &unk_1F4012078;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E4F92CA8];
  v8 = @"timestampEnd";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_DateFormat");
  v9 = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v13[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v6;
}

+ (id)entryEventIntervalDefinitionStaticStickerScoring
{
  void v21[2] = *MEMORY[0x1E4F143B8];
  v20[0] = *MEMORY[0x1E4F92C50];
  uint64_t v18 = *MEMORY[0x1E4F92CD0];
  v19 = &unk_1F4012078;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  v21[0] = v15;
  v20[1] = *MEMORY[0x1E4F92CA8];
  v16[0] = @"IsOnDemand";
  id v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_BoolFormat");
  v17[0] = v13;
  v16[1] = @"ProcessedAssetCount";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v17[1] = v3;
  void v16[2] = @"StickerScoringAssetCount";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  void v17[2] = v5;
  void v16[3] = @"VisualSearchAssetCount";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  void v17[3] = v7;
  void v16[4] = @"timestampEnd";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_DateFormat");
  void v17[4] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:5];
  v21[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];

  return v11;
}

+ (id)entryEventIntervalDefinitionUserSafety
{
  void v20[2] = *MEMORY[0x1E4F143B8];
  v19[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v17[0] = *MEMORY[0x1E4F92CD0];
  v17[1] = v2;
  v18[0] = &unk_1F4012088;
  v18[1] = MEMORY[0x1E4F1CC38];
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E4F92CA8];
  v15[0] = @"AssetType";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v16[0] = v4;
  v15[1] = @"ClientBundleID";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_StringFormat_withBundleID");
  v16[1] = v6;
  void v15[2] = @"EndTimestamp";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_DateFormat");
  void v16[2] = v8;
  void v15[3] = @"IsCacheReused";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_BoolFormat");
  void v16[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
  v20[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

  return v12;
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryAggregateDefinitions
{
  v30[3] = *MEMORY[0x1E4F143B8];
  if (+[PLXPCAgent shouldLogiOSWatchOSOnly])
  {
    v29[0] = @"Aggregate";
    v27[0] = *MEMORY[0x1E4F92C50];
    uint64_t v3 = *MEMORY[0x1E4F92CB8];
    v25[0] = *MEMORY[0x1E4F92CD0];
    v25[1] = v3;
    v26[0] = &unk_1F4012078;
    v26[1] = MEMORY[0x1E4F1CC28];
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
    v28[0] = v4;
    v27[1] = *MEMORY[0x1E4F92CA8];
    v23[0] = @"name";
    uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    v15 = objc_msgSend(v16, "commonTypeDict_StringFormat");
    v23[1] = @"count";
    v24[0] = v15;
    id v14 = [MEMORY[0x1E4F929D8] sharedInstance];
    v5 = objc_msgSend(v14, "commonTypeDict_RealFormat_aggregateFunction_sum");
    v24[1] = v5;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
    v28[1] = v6;
    void v27[2] = *MEMORY[0x1E4F92BE0];
    v21 = &unk_1F4012068;
    uint64_t v19 = *MEMORY[0x1E4F92BD8];
    v20 = &unk_1F40120E8;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    v22 = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    void v27[3] = *MEMORY[0x1E4F92BF0];
    v28[2] = v8;
    void v28[3] = &unk_1F4013DB0;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:4];
    v30[0] = v9;
    v29[1] = @"KeyboardWordsAndCharacters";
    uint64_t v10 = [a1 entryAggregateDefinitionKeyboardWordsAndCharacters];
    v30[1] = v10;
    void v29[2] = @"KeyboardTime";
    v11 = [a1 entryAggregateDefinitionKeyboardTime];
    v30[2] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:3];
  }
  else
  {
    v17 = @"TouchEvents";
    uint64_t v4 = [a1 entryAggregateDefinitionTouchEvents];
    uint64_t v18 = v4;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  }

  return v12;
}

+ (id)entryAggregateDefinitionKeyboardWordsAndCharacters
{
  void v28[4] = *MEMORY[0x1E4F143B8];
  v27[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v25[0] = *MEMORY[0x1E4F92CD0];
  v25[1] = v2;
  v26[0] = &unk_1F4012078;
  v26[1] = MEMORY[0x1E4F1CC28];
  void v25[2] = *MEMORY[0x1E4F92CE8];
  void v26[2] = MEMORY[0x1E4F1CC38];
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
  v28[0] = v17;
  v27[1] = *MEMORY[0x1E4F92CA8];
  v23[0] = @"WordsTapped";
  uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  v24[0] = v15;
  v23[1] = @"CharactersTapped";
  id v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v14, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  v24[1] = v3;
  void v23[2] = @"WordsPathed";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  void v24[2] = v5;
  v23[3] = @"CharactersPathed";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  v24[3] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:4];
  v28[1] = v8;
  void v27[2] = *MEMORY[0x1E4F92BE0];
  v21 = &unk_1F40120F8;
  uint64_t v19 = *MEMORY[0x1E4F92BD8];
  v20 = &unk_1F40120E8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  v22 = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  v28[2] = v10;
  void v27[3] = *MEMORY[0x1E4F92BF0];
  v18[0] = @"WordsTapped";
  v18[1] = @"CharactersTapped";
  void v18[2] = @"WordsPathed";
  void v18[3] = @"CharactersPathed";
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:4];
  void v28[3] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:4];

  return v12;
}

+ (id)entryAggregateDefinitionKeyboardTime
{
  void v24[4] = *MEMORY[0x1E4F143B8];
  v23[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v21[0] = *MEMORY[0x1E4F92CD0];
  v21[1] = v2;
  v22[0] = &unk_1F4012078;
  v22[1] = MEMORY[0x1E4F1CC28];
  void v21[2] = *MEMORY[0x1E4F92CE8];
  void v22[2] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
  v24[0] = v3;
  v23[1] = *MEMORY[0x1E4F92CA8];
  v19[0] = @"TimeSpentTapTyping";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  v19[1] = @"TimeSpentPathTyping";
  v20[0] = v5;
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  v20[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  v24[1] = v8;
  void v23[2] = *MEMORY[0x1E4F92BE0];
  v17 = &unk_1F4012068;
  uint64_t v15 = *MEMORY[0x1E4F92BD8];
  uint64_t v16 = &unk_1F40120E8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  uint64_t v18 = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  void v24[2] = v10;
  v23[3] = *MEMORY[0x1E4F92BF0];
  v14[0] = @"TimeSpentTapTyping";
  v14[1] = @"TimeSpentPathTyping";
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v24[3] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:4];

  return v12;
}

+ (id)entryAggregateDefinitionTouchEvents
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (PLXPCAgent)init
{
  v16.receiver = self;
  v16.super_class = (Class)PLXPCAgent;
  uint64_t v2 = [(PLAgent *)&v16 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    localCache = v2->_localCache;
    v2->_localCache = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    inferenceEntries = v2->_inferenceEntries;
    v2->_inferenceEntries = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    summarizationEntries = v2->_summarizationEntries;
    v2->_summarizationEntries = (NSMutableDictionary *)v7;

    if (+[PLXPCAgent shouldLogiOSWatchOSOnly]
      && [MEMORY[0x1E4F929C0] BOOLForKey:@"MemoryPressureNotification" ifNotSet:0])
    {
      id v9 = objc_alloc(MEMORY[0x1E4F92A28]);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      void v14[2] = __18__PLXPCAgent_init__block_invoke;
      void v14[3] = &unk_1E6E47908;
      uint64_t v10 = v2;
      uint64_t v15 = v10;
      uint64_t v11 = [v9 initWithOperator:v10 forNotification:@"kPLMemoryPressureNotification" withBlock:v14];
      MemoryWarningListener = v10->_MemoryWarningListener;
      v10->_MemoryWarningListener = (PLNSNotificationOperatorComposition *)v11;
    }
    v2->_lastLinearBrightness = -1;
  }
  return v2;
}

void __18__PLXPCAgent_init__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v12 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v12)
  {
    id v9 = [v12 objectForKeyedSubscript:@"kPLMemoryPressureNotification"];

    if (v9)
    {
      uint64_t v10 = *(void **)(a1 + 32);
      uint64_t v11 = [v12 objectForKeyedSubscript:@"kPLMemoryPressureNotification"];
      objc_msgSend(v10, "logEventPointJetsam:", objc_msgSend(v11, "unsignedLongValue"));
    }
  }
}

- (void)initTaskOperatorDependancies
{
  id v3 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  void v59[2] = __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke;
  v59[3] = &unk_1E6E47740;
  v59[4] = self;
  uint64_t v4 = (void *)[v3 initWithOperator:self withRegistration:&unk_1F400FBF0 withBlock:v59];
  [(PLXPCAgent *)self setNavdXPCListener:v4];

  id v5 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  void v58[2] = __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1780;
  v58[3] = &unk_1E6E47740;
  v58[4] = self;
  v6 = (void *)[v5 initWithOperator:self withRegistration:&unk_1F400FC18 withBlock:v58];
  [(PLXPCAgent *)self setNavdXPCListener:v6];

  id v7 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  void v57[2] = __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1788;
  v57[3] = &unk_1E6E47740;
  void v57[4] = self;
  id v8 = (void *)[v7 initWithOperator:self withRegistration:&unk_1F400FC40 withBlock:v57];
  [(PLXPCAgent *)self setNavdXPCListener:v8];

  id v9 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  void v56[2] = __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1793;
  v56[3] = &unk_1E6E47740;
  v56[4] = self;
  uint64_t v10 = (void *)[v9 initWithOperator:self withRegistration:&unk_1F400FC68 withBlock:v56];
  [(PLXPCAgent *)self setNavdXPCListener:v10];

  id v11 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1800;
  v55[3] = &unk_1E6E47740;
  v55[4] = self;
  id v12 = (void *)[v11 initWithOperator:self withRegistration:&unk_1F400FC90 withBlock:v55];
  [(PLXPCAgent *)self setDACalendarItemsDownloadedXPCListener:v12];

  id v13 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1805;
  v54[3] = &unk_1E6E47740;
  v54[4] = self;
  id v14 = (void *)[v13 initWithOperator:self withRegistration:&unk_1F400FCB8 withBlock:v54];
  [(PLXPCAgent *)self setDACalendarItemsUploadedXPCListener:v14];

  if (+[PLXPCAgent shouldLogiOSWatchOSOnly])
  {
    id v15 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1815;
    v53[3] = &unk_1E6E47740;
    v53[4] = self;
    objc_super v16 = (void *)[v15 initWithOperator:self withRegistration:&unk_1F400FCE0 withBlock:v53];
    [(PLXPCAgent *)self setUIKitAlertXPCListener:v16];
  }
  id v17 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1825;
  v52[3] = &unk_1E6E47740;
  void v52[4] = self;
  uint64_t v18 = (void *)[v17 initWithOperator:self withRegistration:&unk_1F400FD08 withBlock:v52];
  [(PLXPCAgent *)self setSiriXPCListener:v18];

  id v19 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  void v51[2] = __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1830;
  v51[3] = &unk_1E6E47740;
  v51[4] = self;
  v20 = (void *)[v19 initWithOperator:self withRegistration:&unk_1F400FD30 withBlock:v51];
  [(PLXPCAgent *)self setNanoSiriXPCListener:v20];

  id v21 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  void v50[2] = __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1837;
  v50[3] = &unk_1E6E47740;
  void v50[4] = self;
  v22 = (void *)[v21 initWithOperator:self withRegistration:&unk_1F400FD58 withBlock:v50];
  [(PLXPCAgent *)self setSpotlightQosXPCListener:v22];

  id v23 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  void v49[2] = __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1842;
  v49[3] = &unk_1E6E47740;
  v49[4] = self;
  v24 = (void *)[v23 initWithOperator:self withRegistration:&unk_1F400FD80 withBlock:v49];
  [(PLXPCAgent *)self setSpotlightWatchdogFiredXPCListener:v24];

  id v25 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1849;
  void v48[3] = &unk_1E6E47740;
  v48[4] = self;
  v26 = (void *)[v25 initWithOperator:self withRegistration:&unk_1F400FDA8 withBlock:v48];
  [(PLXPCAgent *)self setLocationVehicularDetectionXPCListener:v26];

  id v27 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1854;
  void v47[3] = &unk_1E6E47740;
  v47[4] = self;
  uint64_t v28 = (void *)[v27 initWithOperator:self withRegistration:&unk_1F400FDD0 withBlock:v47];
  [(PLXPCAgent *)self setMotionWakeReasonXPCListener:v28];

  id v29 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1859;
  v46[3] = &unk_1E6E47740;
  v46[4] = self;
  uint64_t v30 = (void *)[v29 initWithOperator:self withRegistration:&unk_1F400FDF8 withBlock:v46];
  [(PLXPCAgent *)self setCommuteRefreshXPCListener:v30];

  id v31 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1866;
  v45[3] = &unk_1E6E47740;
  v45[4] = self;
  v32 = (void *)[v31 initWithOperator:self withRegistration:&unk_1F400FE20 withBlock:v45];
  [(PLXPCAgent *)self setSecItemXPCListener:v32];

  if ([MEMORY[0x1E4F92A38] isiPhone])
  {
    id v33 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1873;
    v44[3] = &unk_1E6E47740;
    v44[4] = self;
    v34 = (void *)[v33 initWithOperator:self withRegistration:&unk_1F400FE48 withBlock:v44];
    [(PLXPCAgent *)self setDRMaxRateListener:v34];
  }
  if ([MEMORY[0x1E4F92A38] isiPad])
  {
    id v35 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1883;
    v43[3] = &unk_1E6E47740;
    v43[4] = self;
    v36 = (void *)[v35 initWithOperator:self withRegistration:&unk_1F400FE70 withBlock:v43];
    [(PLXPCAgent *)self setActiveStylusXPCListener:v36];

    id v37 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1891;
    v42[3] = &unk_1E6E47740;
    v42[4] = self;
    v38 = (void *)[v37 initWithOperator:self withRegistration:&unk_1F400FE98 withBlock:v42];
    [(PLXPCAgent *)self setPassiveStylusXPCListener:v38];
  }
  id v39 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1898;
  v41[3] = &unk_1E6E47740;
  v41[4] = self;
  v40 = (void *)[v39 initWithOperator:self withRegistration:&unk_1F400FEC0 withBlock:v41];
  [(PLXPCAgent *)self setWatchPresenceXPCListener:v40];
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointNavd:v6];
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1780(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1780_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointNavdMapsWidgetSession:v6];
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1788(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1788_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointNavdGeoNetworkActivity:v6];
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1793(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1793_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointNavdMapsNavigationStateEvent:v6];
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1800(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1800_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointDACalendarItemsDownloaded:v6];
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1805(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1805_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointDACalendarItemsUploaded:v6];
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1815(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1815_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardUIKitAlert:v6];
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1825(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1825_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardSiri:v6];
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1830(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1830_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointSiriActivation:v6];
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1837(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1837_cold_1();
  }

  [*(id *)(a1 + 32) logEventBackwardNameSpotlightQos:v6];
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1842(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1842_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointNameSpotlightWatchdogFired:v6];
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1849(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1849_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointLocationVehicularDetectionSession:v6];
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1854(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1854_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointMotionWakeReasonSession:v6];
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1859(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1859_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointCommuteRefreshSession:v6];
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1866(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1866_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointSecItemSession:v6];
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1873(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1873_cold_1();
  }

  [*(id *)(a1 + 32) logEventBackwardDRMaxRate:v6];
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1883(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7 = a3;
  id v8 = a5;
  id v9 = PLLogXPC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1883_cold_1();
  }

  [*(id *)(a1 + 32) logEventBackwardActiveStylus:v8];
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1891(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7 = a3;
  id v8 = a5;
  id v9 = PLLogXPC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1891_cold_1();
  }

  [*(id *)(a1 + 32) logEventBackwardPassiveStylus:v8];
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1898(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1898_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardWatchPresence:v6];
}

- (void)initOperatorDependancies
{
  id v8 = *a1;
  if (*a1)
  {
    id v9 = [*a1 objectForKeyedSubscript:@"noiseEnabled"];
  }
  else
  {
    id v9 = 0;
  }
  OUTLINED_FUNCTION_10(&dword_1E4220000, a2, a3, "Dosimetry state %@ was %@\n", a5, a6, a7, a8, 2u);
  if (v8) {
}
  }

void __38__PLXPCAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLLogXPC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1E4220000, v5, OS_LOG_TYPE_DEFAULT, "GenerativeFunctionMetrics OptIn State Changed: %@", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardGMSOptIn];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1909(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_1909_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardAppleDiffusion:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1917(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_1917_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardSummarization:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1925(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_1925_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardAssetLoadGF:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1933(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_1933_cold_1();
  }

  [*(id *)(a1 + 32) logFileResidentInfo:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1941(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_1941_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardHandwritingInference:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1949(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_1949_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardMMExecuteRequest:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1957(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_1957_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardTGIExecuteRequest:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1965(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_1965_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardSmartReplySession:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1973(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_1973_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointANE:v6 withCategory:@"modelCompilation"];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1984(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_1984_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointANE:v6 withCategory:@"modelInference"];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1995(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_1995_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointANE:v6 withCategory:@"modelLoad"];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2006(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2006_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointANE:v6 withCategory:@"modelUnload"];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2017(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2017_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointANE:v6 withCategory:@"newInstanceModelLoad"];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2028(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2028_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointANE:v6 withCategory:@"newInstanceModelUnload"];
}

uint64_t __38__PLXPCAgent_initOperatorDependancies__block_invoke_2033(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleSBCNotificationWithUserInfo:a2];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2040(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2040_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardMXDiscoveryLevel:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2048(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2048_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointAirPlayDiscoveryMode:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2053(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1859_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointCommuteRefreshSession:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2060(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2060_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointTestMarker:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2067(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_1E4220000, v7, OS_LOG_TYPE_DEFAULT, "[Energy Telemetry] callback %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventBackwardEnergyTelemetry:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2075(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2075_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardUIKitEclipse:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2085(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2085_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardSleepMode:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2090(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2090_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointSleepLock:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2097(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2097_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointWeatherNotificationState:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2102(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2102_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointWeatherNotification:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2112(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2112_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardSecondaryDisplay:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2120(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2120_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardUIKitKeyboard:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2128(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2128_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardUIKitActivity:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2133(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2133_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointDASyncStart:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2141(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2141_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardLinkAdvisory:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2149(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2149_cold_1();
  }

  [*(id *)(a1 + 32) logEventEventPointRCSSessionManagement:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2157(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7 = a3;
  id v8 = a5;
  id v9 = PLLogXPC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2157_cold_1();
  }

  [*(id *)(a1 + 32) logEventIntervalVKDataScanner:v8];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2165(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7 = a3;
  id v8 = a5;
  id v9 = PLLogXPC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2165_cold_1();
  }

  [*(id *)(a1 + 32) logAlbumAnimation:v8];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2173(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7 = a3;
  id v8 = a5;
  id v9 = PLLogXPC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2173_cold_1();
  }

  [*(id *)(a1 + 32) logAlbumMotion:v8];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2180(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7 = a3;
  id v8 = a5;
  id v9 = PLLogXPC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2180_cold_1();
  }

  [*(id *)(a1 + 32) logEventBackwardCallScreeningDuration:v8];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2185(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7 = a3;
  id v8 = a5;
  id v9 = PLLogXPC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2185_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardCallScreeningEnabled:v8];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2193(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7 = a3;
  id v8 = a5;
  id v9 = PLLogXPC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2193_cold_1();
  }

  [*(id *)(a1 + 32) logEventBackwardKeyboardTrackpad:v8];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2198(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2198_cold_1();
  }

  [*(id *)(a1 + 32) logEventBackwardVoicemailDuration:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2208(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2208_cold_1();
  }

  [*(id *)(a1 + 32) logEventBackwardKeyboardSession:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2216(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2216_cold_1();
  }

  [*(id *)(a1 + 32) logEventBackwardRenderPassCount:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2224(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2224_cold_1();
  }

  [*(id *)(a1 + 32) logEventBackwardLayerCount:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2231(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2231_cold_1();
  }

  [*(id *)(a1 + 32) logEventIntervalMomentsDeferredProcessing:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2239(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2239_cold_1();
  }

  [*(id *)(a1 + 32) logEventIntervalGroupActivities:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2247(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2247_cold_1();
  }

  [*(id *)(a1 + 32) logEventIntervalEndCPUViolations:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2252(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2252_cold_1();
  }

  [*(id *)(a1 + 32) logEventIntervalAnimatedStickerCreation:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2257(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2257_cold_1();
  }

  [*(id *)(a1 + 32) logEventIntervalAnimatedStickerScoring:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2262(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2262_cold_1();
  }

  [*(id *)(a1 + 32) logEventIntervalStaticStickerCreation:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2267(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2267_cold_1();
  }

  [*(id *)(a1 + 32) logEventIntervalStaticStickerScoring:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2275(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7 = a3;
  id v8 = a5;
  id v9 = PLLogXPC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2275_cold_1();
  }

  [*(id *)(a1 + 32) logMailCategorization:v8];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2283(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2283_cold_1();
  }

  [*(id *)(a1 + 32) logEventIntervalUserSafetyProcessing:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2288(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2288_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardCarPlay:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2293(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2293_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardCarPlayScreens:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2301(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2301_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardRelevanceContextUpdate:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2311(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2311_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointMailFetch:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2318(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2318_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointNanoMailSession:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2328(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2328_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardSafariFetcherStatus:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2336(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a5;
  id v6 = PLLogXPC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2336_cold_1();
  }

  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [v5 objectForKeyedSubscript:@"bundleIDs"];
  uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * v11);
        id v13 = (void *)MEMORY[0x1E4F28ED0];
        id v14 = [v5 objectForKeyedSubscript:@"bundleIDs"];
        id v15 = objc_msgSend(v13, "numberWithDouble:", 1.0 / (double)(unint64_t)objc_msgSend(v14, "count"));
        [v7 setObject:v15 forKeyedSubscript:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  objc_super v16 = [MEMORY[0x1E4F92900] sharedInstance];
  id v17 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [v16 createDistributionEventForwardWithDistributionID:42 withChildNodeNameToWeight:v7 withStartDate:v17];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2354(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2354_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardAppAccessory:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2362(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2362_cold_1();
  }

  uint64_t v8 = (void *)[v6 mutableCopy];
  uint64_t v9 = *MEMORY[0x1E4F6A5E0];
  uint64_t v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F6A5E0]];
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    uint64_t v12 = [v8 objectForKeyedSubscript:v9];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v14 = [v8 objectForKeyedSubscript:v9];
      id v15 = [v14 allKeys];
      [v8 setObject:v15 forKeyedSubscript:v9];
    }
  }
  [*(id *)(a1 + 32) logEventForwardAccessory:v8];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2369(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2369_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointNetworkSymptomsAdviosry:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2379(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2379_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointBackgroundTransfer:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2389(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2389_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointDeepScanReasons:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2397(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2397_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardInCallService:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2407(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2407_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardWebApp:v6];
}

id __38__PLXPCAgent_initOperatorDependancies__block_invoke_2416(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = [*(id *)(a1 + 32) entryRequestResponseForPayload:v6];
  uint64_t v8 = PLLogXPC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2416_cold_1();
  }

  return v7;
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2425(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2425_cold_1();
  }

  [*(id *)(a1 + 32) logEventAggregateTelNotification:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2435(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2435_cold_1();
  }

  [*(id *)(a1 + 32) logEventBackwardSiriFalseAlarm:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2443(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2443_cold_1();
  }

  [*(id *)(a1 + 32) logEventBackwardNamePeek:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2451(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2451_cold_1();
  }

  [*(id *)(a1 + 32) logEventBackwardNamePop:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2461(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2461_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardThermalLevel:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2469(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2469_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardThermalSensors:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2477(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2477_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardThermalHiP:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2487(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2487_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointMobileBackupStatistics:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2495(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2487_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointMobileBackupEvents:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2505(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2505_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointCloudKit:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2515(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2515_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointCacheDelete:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2525(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2525_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointMachineTranslation:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2533(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2533_cold_1();
  }

  [*(id *)(a1 + 32) logEventBackwardUbiquityAccountStatistics:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2543(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2543_cold_1();
  }

  [*(id *)(a1 + 32) logEventBackwardAttentionSampling:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2551(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2551_cold_1();
  }

  [*(id *)(a1 + 32) logEventBackwardAttentionPolling:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2559(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2559_cold_1();
  }

  [*(id *)(a1 + 32) logEventBackwardAttentionService:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2564(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2564_cold_1();
  }

  [*(id *)(a1 + 32) logEventBackwardODOff:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2569(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2569_cold_1();
  }

  [*(id *)(a1 + 32) logEventBackwardODOn:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2574(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2574_cold_1();
  }

  [*(id *)(a1 + 32) logEventBackwardODHN:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2579(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2579_cold_1();
  }

  [*(id *)(a1 + 32) logEventBackwardFrameCount:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2586(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2586_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardAirDropSession:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2591(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2591_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardAirDrop:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2596(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2596_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardSOSKVSRateLimitingEvent:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2601(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2601_cold_1();
  }

  [*(id *)(a1 + 32) handleCKKSSyncingEvent:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2606(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2606_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointOctagonTrustEvent:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2620(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2620_cold_1();
  }

  [*(id *)(a1 + 32) logEventIntervalAirTrafficAssetDownload:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2627(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2627_cold_1();
  }

  [*(id *)(a1 + 32) logEventIntervalCoreDuetKnowledgeSync:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2637(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2637_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointAppActivationPerformanceActivationData:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2645(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2637_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointAppActivationPerformanceProcessData:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2653(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2637_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointAppActivationPerformanceCPUStatistics:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2661(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2637_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointAppActivationPerformanceMemoryStatistics:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2669(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2637_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointAppActivationPerformancePowerStateStatistics:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2674(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2674_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointShortcutsTriggerFired:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2684(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2684_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardAppleBackklightBrightness:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2694(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2694_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardNetworkRelay:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2702(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2702_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardNetworkRelayWiFiAssertion:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2710(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2710_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointNetworkRelayBTLinkAssertion:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2718(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2718_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointNetworkRelayTerminusBTWake:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2725(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2725_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardAccessoryMotion:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2733(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2733_cold_1();
  }

  [*(id *)(a1 + 32) logEventFowardUARPStatus:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2743(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2743_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardDosimetry:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2753(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2753_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardAudioRouting:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2763(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2763_cold_1();
  }

  [*(id *)(a1 + 32) logEventIntervalRapportReceivedMessage:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2770(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2770_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardEnhancedDiscovery:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2780(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2780_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardWirelessSync:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2788(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2788_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardWirelessSync:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2796(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2796_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardSpatialAudio:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2804(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2804_cold_1();
  }

  [*(id *)(a1 + 32) logEventBackwardAVConference:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2811(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2811_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardAvailabilityModes:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2816(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2816_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointFocusFilters:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2823(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2823_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointNamePortraitHighlightsResult:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2828(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2828_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointNameSpotlightHighlightsResult:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2836(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2836_cold_1();
  }

  [*(id *)(a1 + 32) logEventIntervalNameSpotlightIndexes:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2841(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2841_cold_1();
  }

  [*(id *)(a1 + 32) logEventIntervalNameSpotlightQueries:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2848(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2848_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardPasskeyAuthentication:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2858(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2858_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointADD:v6];
}

id __38__PLXPCAgent_initOperatorDependancies__block_invoke_2866(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a5;
  id v6 = PLLogXPC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2866_cold_1();
  }

  uint64_t v10 = @"Task Mode";
  id v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(MEMORY[0x1E4F929C0], "taskMode"));
  v11[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  return v8;
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2878(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__PLXPCAgent_initOperatorDependancies__block_invoke_2878_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardRapidSecurityResponse:v6];
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2879(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLLogXPC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1E4220000, v5, OS_LOG_TYPE_DEFAULT, "IHA Toggle State Changed: %@", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardIHA];
}

- (id)entryRequestResponseForPayload:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  int v6 = objc_opt_new();
  id v7 = objc_opt_new();
  [v6 setObject:v7 forKeyedSubscript:@"timedout"];

  uint64_t v8 = [v4 objectForKeyedSubscript:@"timeout"];

  if (v8)
  {
    uint64_t v9 = [v4 objectForKeyedSubscript:@"timeout"];
    [v9 doubleValue];
    double v11 = v10;
  }
  else
  {
    double v11 = 60.0;
  }
  uint64_t v12 = [v4 objectForKeyedSubscript:@"Operator"];

  if (v12)
  {
    id v13 = (void *)MEMORY[0x1E4F929E0];
    id v39 = v4;
    id v14 = [v4 objectForKeyedSubscript:@"Operator"];
    id v15 = [v13 entryKeysForOperatorName:v14];
    [v5 addObjectsFromArray:v15];
  }
  else
  {
    objc_super v16 = [v4 objectForKeyedSubscript:@"EntryKey"];

    if (!v16)
    {
      v34 = [MEMORY[0x1E4F92AD0] sharedCore];
      id v35 = [v34 agents];
      [v35 log];

      v36 = [MEMORY[0x1E4F92AD0] sharedCore];
      id v37 = [v36 services];
      [v37 log];

      id v32 = &unk_1F4011220;
      goto LABEL_25;
    }
    id v39 = v4;
    id v14 = [v4 objectForKeyedSubscript:@"EntryKey"];
    [v5 addObject:v14];
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v38 = v5;
  id obj = v5;
  uint64_t v17 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v44;
    unint64_t v20 = 0x1E4F92000uLL;
    v40 = self;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v44 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void *)(*((void *)&v43 + 1) + 8 * v21);
        id v23 = PLLogXPC();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v48 = v22;
          _os_log_debug_impl(&dword_1E4220000, v23, OS_LOG_TYPE_DEBUG, "requesting %@", buf, 0xCu);
        }

        uint64_t v24 = *(void **)(v20 + 2536);
        id v42 = 0;
        id v25 = [v24 requestEntryForEntryKey:v22 forOperator:self withTimeout:&v42 error:v11];
        id v26 = v42;
        if (v26)
        {
          id v27 = [v6 objectForKeyedSubscript:@"timedout"];
          [v27 addObject:v22];

          uint64_t v28 = PLLogXPC();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v48 = v22;
            __int16 v49 = 2112;
            id v50 = v26;
            _os_log_error_impl(&dword_1E4220000, v28, OS_LOG_TYPE_ERROR, "timeout %@: %@", buf, 0x16u);
          }
        }
        id v29 = objc_msgSend(v25, "serializedForJSON", v38);
        if (v29)
        {
          [v6 setObject:v29 forKey:v22];
        }
        else
        {
          [MEMORY[0x1E4F1CA98] null];
          v31 = unint64_t v30 = v20;
          [v6 setObject:v31 forKey:v22];

          unint64_t v20 = v30;
          self = v40;
        }

        ++v21;
      }
      while (v18 != v21);
      uint64_t v18 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v18);
  }

  id v32 = v6;
  id v5 = v38;
  id v4 = v39;
LABEL_25:

  return v32;
}

- (void)handleSBCNotificationWithUserInfo:(id)a3
{
  id v14 = [a3 objectForKeyedSubscript:@"entry"];
  if (v14)
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
    char v5 = [v14 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      int v6 = [v14 entryDate];
      [v6 timeIntervalSince1970];
      self->_lastSBCupdateTimestamp = v7;

      uint64_t v8 = [(PLXPCAgent *)self inferenceEntries];
      [(PLXPCAgent *)self distributeBundleIDEntriesToWeight:v8 toDistributionID:53];

      [(NSMutableDictionary *)self->_inferenceEntries removeAllObjects];
      uint64_t v9 = [(PLXPCAgent *)self summarizationEntries];
      [(PLXPCAgent *)self distributeBundleIDEntriesToWeight:v9 toDistributionID:54];

      double v10 = [MEMORY[0x1E4F92900] sharedInstance];
      double v11 = [(PLXPCAgent *)self summarizationEntries];
      uint64_t v12 = [v11 allKeys];
      id v13 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      [v10 createQualificationEventBackwardWithQualificationID:17 withChildNodeNames:v12 withEndDate:v13];

      [(NSMutableDictionary *)self->_summarizationEntries removeAllObjects];
    }
  }
}

- (void)log
{
  [(PLXPCAgent *)self logEventForwardGMSOptIn];
  [(PLXPCAgent *)self logEventForwardIHA];
}

- (void)logEventAggregateTelNotification:(id)a3
{
  id v11 = a3;
  id v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"Aggregate"];
  if (v11)
  {
    char v5 = [v11 objectForKeyedSubscript:@"telNotification"];
    if (v5)
    {
      int v6 = [v11 objectForKeyedSubscript:@"telNotification"];
      if ([v6 isEqualToString:@"kCTRegistrationCellChangedNotification"])
      {
      }
      else
      {
        double v7 = [v11 objectForKeyedSubscript:@"telNotification"];
        int v8 = [v7 isEqualToString:@"kCTCellMonitorUpdateNotification"];

        if (!v8) {
          goto LABEL_9;
        }
      }
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4];
      if (v9)
      {
        double v10 = [v11 objectForKeyedSubscript:@"telNotification"];
        [v9 setObject:v10 forKeyedSubscript:@"name"];

        [v9 setObject:&unk_1F400D720 forKeyedSubscript:@"count"];
        [(PLOperator *)self logEntry:v9];
      }
    }
  }
LABEL_9:
}

- (void)logEventBackwardSiriFalseAlarm:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D28];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"SiriAlarm"];
  int v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventBackwardKeyboardTrackpad:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D28];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"KeyboardTrackpadResidencies"];
  int v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventBackwardActiveStylus:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D28];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"ActiveStylusInking"];
  int v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventBackwardPassiveStylus:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D28];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"PassiveStylusInking"];
  int v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventBackwardKeyboardSession:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v54 = v4;
    v53 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"KeyboardSession"];
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v53];
    uint64_t v6 = *MEMORY[0x1E4F92D20];
    uint64_t v52 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"KeyboardWordsAndCharacters"];
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v52];
    v51 = +[PLOperator entryKeyForType:v6 andName:@"KeyboardTime"];
    int v8 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v51];
    uint64_t v9 = [v54 objectForKey:@"WordsTapped"];

    if (v9)
    {
      double v10 = (void *)MEMORY[0x1E4F28ED0];
      id v11 = [v54 objectForKeyedSubscript:@"WordsTapped"];
      uint64_t v12 = objc_msgSend(v10, "numberWithInt:", +[PLUtilities roundToSigFig:withSigFig:](PLUtilities, "roundToSigFig:withSigFig:", objc_msgSend(v11, "intValue"), 2));
      [v5 setObject:v12 forKeyedSubscript:@"WordsTapped"];

      id v13 = (void *)MEMORY[0x1E4F28ED0];
      id v14 = [v5 objectForKeyedSubscript:@"WordsTapped"];
      id v15 = objc_msgSend(v13, "numberWithInt:", objc_msgSend(v14, "intValue"));
      [v7 setObject:v15 forKeyedSubscript:@"WordsTapped"];
    }
    objc_super v16 = [v54 objectForKey:@"CharactersTapped"];

    if (v16)
    {
      uint64_t v17 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v18 = [v54 objectForKeyedSubscript:@"CharactersTapped"];
      uint64_t v19 = objc_msgSend(v17, "numberWithInt:", +[PLUtilities roundToSigFig:withSigFig:](PLUtilities, "roundToSigFig:withSigFig:", objc_msgSend(v18, "intValue"), 2));
      [v5 setObject:v19 forKeyedSubscript:@"CharactersTapped"];

      unint64_t v20 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v21 = [v5 objectForKeyedSubscript:@"CharactersTapped"];
      uint64_t v22 = objc_msgSend(v20, "numberWithInt:", objc_msgSend(v21, "intValue"));
      [v7 setObject:v22 forKeyedSubscript:@"CharactersTapped"];
    }
    id v23 = [v54 objectForKey:@"WordsPathed"];

    if (v23)
    {
      uint64_t v24 = (void *)MEMORY[0x1E4F28ED0];
      id v25 = [v54 objectForKeyedSubscript:@"WordsPathed"];
      id v26 = objc_msgSend(v24, "numberWithInt:", +[PLUtilities roundToSigFig:withSigFig:](PLUtilities, "roundToSigFig:withSigFig:", objc_msgSend(v25, "intValue"), 2));
      [v5 setObject:v26 forKeyedSubscript:@"WordsPathed"];

      id v27 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v28 = [v5 objectForKeyedSubscript:@"WordsPathed"];
      id v29 = objc_msgSend(v27, "numberWithInt:", objc_msgSend(v28, "intValue"));
      [v7 setObject:v29 forKeyedSubscript:@"WordsPathed"];
    }
    unint64_t v30 = [v54 objectForKey:@"CharactersPathed"];

    if (v30)
    {
      id v31 = (void *)MEMORY[0x1E4F28ED0];
      id v32 = [v54 objectForKeyedSubscript:@"CharactersPathed"];
      id v33 = objc_msgSend(v31, "numberWithInt:", +[PLUtilities roundToSigFig:withSigFig:](PLUtilities, "roundToSigFig:withSigFig:", objc_msgSend(v32, "intValue"), 2));
      [v5 setObject:v33 forKeyedSubscript:@"CharactersPathed"];

      v34 = (void *)MEMORY[0x1E4F28ED0];
      id v35 = [v5 objectForKeyedSubscript:@"CharactersPathed"];
      v36 = objc_msgSend(v34, "numberWithInt:", objc_msgSend(v35, "intValue"));
      [v7 setObject:v36 forKeyedSubscript:@"CharactersPathed"];
    }
    id v37 = [v54 objectForKey:@"TimeSpentTapTyping"];

    if (v37)
    {
      v38 = (void *)MEMORY[0x1E4F28ED0];
      id v39 = [v54 objectForKeyedSubscript:@"TimeSpentTapTyping"];
      v40 = objc_msgSend(v38, "numberWithInteger:", objc_msgSend(v39, "integerValue"));
      [v5 setObject:v40 forKeyedSubscript:@"TimeSpentTapTyping"];

      v41 = (void *)MEMORY[0x1E4F28ED0];
      id v42 = [v5 objectForKeyedSubscript:@"TimeSpentTapTyping"];
      long long v43 = objc_msgSend(v41, "numberWithInt:", objc_msgSend(v42, "intValue"));
      [v8 setObject:v43 forKeyedSubscript:@"TimeSpentTapTyping"];
    }
    long long v44 = [v54 objectForKey:@"TimeSpentPathTyping"];

    if (v44)
    {
      long long v45 = (void *)MEMORY[0x1E4F28ED0];
      long long v46 = [v54 objectForKeyedSubscript:@"TimeSpentPathTyping"];
      v47 = objc_msgSend(v45, "numberWithInteger:", objc_msgSend(v46, "integerValue"));
      [v5 setObject:v47 forKeyedSubscript:@"TimeSpentPathTyping"];

      uint64_t v48 = (void *)MEMORY[0x1E4F28ED0];
      __int16 v49 = [v5 objectForKeyedSubscript:@"TimeSpentPathTyping"];
      id v50 = objc_msgSend(v48, "numberWithInt:", objc_msgSend(v49, "intValue"));
      [v8 setObject:v50 forKeyedSubscript:@"TimeSpentPathTyping"];
    }
    [(PLOperator *)self logEntry:v5];
    if (([MEMORY[0x1E4F929C0] taskMode] & 1) != 0
      || [MEMORY[0x1E4F929C0] fullMode])
    {
      [(PLOperator *)self logEntry:v7];
      [(PLOperator *)self logEntry:v8];
    }

    id v4 = v54;
  }
}

- (void)logEventBackwardVoicemailDuration:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D28];
  id v5 = a3;
  id v13 = +[PLOperator entryKeyForType:v4 andName:@"VoicemailDuration"];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v13];
  id v7 = [v5 objectForKeyedSubscript:@"duration"];

  uint64_t v8 = [v7 intValue];
  if ((v8 - 1) <= 8)
  {
    [v6 setObject:&unk_1F400D738 forKeyedSubscript:@"duration"];
    goto LABEL_8;
  }
  if ((v8 - 10) > 0x59)
  {
    if ((int)v8 < 100) {
      goto LABEL_8;
    }
    uint64_t v9 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v10 = v8;
    uint64_t v11 = 2;
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v10 = v8;
    uint64_t v11 = 1;
  }
  uint64_t v12 = objc_msgSend(v9, "numberWithInt:", +[PLUtilities roundToSigFig:withSigFig:](PLUtilities, "roundToSigFig:withSigFig:", v10, v11));
  [v6 setObject:v12 forKeyedSubscript:@"duration"];

LABEL_8:
  [(PLOperator *)self logEntry:v6];
}

- (void)logEventPointSleepLock:(id)a3
{
  id v4 = a3;
  if (+[PLUtilities isHealthDataSubmissionAllowed])
  {
    id v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"SleepLock"];
    id v6 = objc_alloc(MEMORY[0x1E4F929D0]);
    id v7 = [v4 objectForKeyedSubscript:@"SleepLock"];
    uint64_t v8 = (void *)[v6 initWithEntryKey:v5 withRawData:v7];

    [(PLOperator *)self logEntry:v8];
  }
  else
  {
    uint64_t v9 = PLLogXPC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[PLXPCAgent logEventPointSleepLock:]();
    }
  }
}

- (void)logEventPointWeatherNotificationState:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"WeatherNotificationState"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventPointWeatherNotification:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"WeatherNotification"];
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5 withRawData:v4];
    [(PLOperator *)self logEntry:v6];
  }
  else
  {
    id v7 = PLLogXPC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[PLXPCAgent logEventPointWeatherNotification:]();
    }
  }
}

- (void)logEventPointNetworkRelayBTLinkAssertion:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"NetworkRelayBTLinkAssertion"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventPointNetworkRelayTerminusBTWake:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v13 = +[PLOperator entryKeyForType:v4 andName:@"TerminusBTWake"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v13];
  id v7 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v8 = [v5 objectForKeyedSubscript:@"Packet SPI"];
  uint64_t v9 = objc_msgSend(v7, "numberWithUnsignedInt:", objc_msgSend(v8, "unsignedIntValue"));
  [v6 setObject:v9 forKeyedSubscript:@"spi"];

  uint64_t v10 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v11 = [v5 objectForKeyedSubscript:@"Packet sequence number"];

  uint64_t v12 = objc_msgSend(v10, "numberWithUnsignedInt:", objc_msgSend(v11, "unsignedIntValue"));
  [v6 setObject:v12 forKeyedSubscript:@"seqNo"];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventPointNamePortraitHighlightsResult:(id)a3
{
  id v19 = a3;
  uint64_t v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"PortraitHighlightsResult"];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4];
  id v6 = [v19 objectForKeyedSubscript:@"client"];
  if (v6)
  {
    id v7 = [MEMORY[0x1E4F223F8] bundleRecordWithApplicationIdentifier:v6 error:0];
    uint64_t v8 = v7;
    if (v7)
    {
      uint64_t v9 = [v7 bundleIdentifier];
      [v5 setObject:v9 forKeyedSubscript:@"BundleID"];
    }
    uint64_t v10 = [v5 objectForKeyedSubscript:@"BundleID"];

    if (!v10) {
      [v5 setObject:v6 forKeyedSubscript:@"BundleID"];
    }
  }
  uint64_t v11 = [v19 objectForKeyedSubscript:@"limit"];
  [v5 setObject:v11 forKeyedSubscript:@"limit"];

  uint64_t v12 = (void *)MEMORY[0x1E4F28ED0];
  id v13 = [v19 objectForKeyedSubscript:@"portraitResultCount"];
  id v14 = objc_msgSend(v12, "numberWithInt:", +[PLUtilities roundToSigFig:withSigFig:](PLUtilities, "roundToSigFig:withSigFig:", objc_msgSend(v13, "intValue"), 2));
  [v5 setObject:v14 forKeyedSubscript:@"portraitResultCount"];

  id v15 = [v19 objectForKeyedSubscript:@"portraitCacheDate"];
  if (v15)
  {
    objc_super v16 = [MEMORY[0x1E4F1CA98] null];
    char v17 = [v15 isEqual:v16];

    if ((v17 & 1) == 0)
    {
      uint64_t v18 = [v15 convertFromSystemToMonotonic];
      [v5 setObject:v18 forKeyedSubscript:@"portraitCacheDate"];
    }
  }
  [(PLOperator *)self logEntry:v5];
}

- (void)logEventPointNameSpotlightHighlightsResult:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v15 = +[PLOperator entryKeyForType:v4 andName:@"SpotlightHighlightsResult"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v15 withRawData:v5];
  id v7 = [v5 objectForKeyedSubscript:@"client"];

  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F223F8] bundleRecordWithApplicationIdentifier:v7 error:0];
    uint64_t v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 bundleIdentifier];
      [v6 setObject:v10 forKeyedSubscript:@"BundleID"];
    }
    uint64_t v11 = [v6 objectForKeyedSubscript:@"BundleID"];

    if (!v11) {
      [v6 setObject:v7 forKeyedSubscript:@"BundleID"];
    }
  }
  uint64_t v12 = (void *)MEMORY[0x1E4F28ED0];
  id v13 = [v6 objectForKeyedSubscript:@"spotlightResultCount"];
  id v14 = objc_msgSend(v12, "numberWithInt:", +[PLUtilities roundToSigFig:withSigFig:](PLUtilities, "roundToSigFig:withSigFig:", objc_msgSend(v13, "intValue"), 2));
  [v6 setObject:v14 forKeyedSubscript:@"spotlightResultCount"];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventPointTestMarker:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"TestMarker"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventPointDASyncStart:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"DASyncStart"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventPointDACalendarItemsDownloaded:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"DACalendarItemsDownloaded"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventPointDACalendarItemsUploaded:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"DACalendarItemsUploaded"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventPointMailFetch:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"MailFetch"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventPointNanoMailSession:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v36 = v4;
    if ([MEMORY[0x1E4F92A38] isWatch])
    {
      id v5 = [v36 objectForKeyedSubscript:@"Category"];

      if (v5)
      {
        id v6 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"NanoMailSession"];
        id v7 = [MEMORY[0x1E4F1C9C8] monotonicDate];
        uint64_t v8 = [v36 objectForKeyedSubscript:@"Timestamp"];

        if (v8)
        {
          uint64_t v9 = (void *)MEMORY[0x1E4F1C9C8];
          uint64_t v10 = [v36 objectForKeyedSubscript:@"Timestamp"];
          [v10 doubleValue];
          uint64_t v11 = objc_msgSend(v9, "dateWithTimeIntervalSince1970:");
          uint64_t v12 = [v11 convertFromSystemToMonotonic];

          id v7 = (void *)v12;
        }
        if (([MEMORY[0x1E4F929C0] fullMode] & 1) == 0)
        {
          id v13 = (void *)MEMORY[0x1E4F1C9C8];
          [v7 timeIntervalSince1970];
          uint64_t v15 = [v13 dateWithTimeIntervalSince1970:round(v14 / 10.0) * 10.0];

          id v7 = (void *)v15;
        }
        objc_super v16 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v6 withDate:v7];
        char v17 = [v36 objectForKeyedSubscript:@"Category"];
        char v18 = [v17 isEqualToString:@"LoadWebView"];

        if (v18)
        {
          uint64_t v19 = 1;
        }
        else
        {
          unint64_t v20 = [v36 objectForKeyedSubscript:@"Category"];
          char v21 = [v20 isEqualToString:@"MailFetch"];

          if (v21)
          {
            uint64_t v19 = 2;
          }
          else
          {
            uint64_t v22 = [v36 objectForKeyedSubscript:@"Category"];
            char v23 = [v22 isEqualToString:@"AttachmentDownload"];

            if (v23)
            {
              uint64_t v19 = 3;
            }
            else
            {
              uint64_t v24 = [v36 objectForKeyedSubscript:@"Category"];
              int v25 = [v24 isEqualToString:@"ContentDownload"];

              if (v25) {
                uint64_t v19 = 4;
              }
              else {
                uint64_t v19 = 0;
              }
            }
          }
        }
        id v26 = [MEMORY[0x1E4F28ED0] numberWithInt:v19];
        [v16 setObject:v26 forKeyedSubscript:@"Category"];

        id v27 = [v36 objectForKeyedSubscript:@"Duration"];
        [v16 setObject:v27 forKeyedSubscript:@"Duration"];

        if ([MEMORY[0x1E4F929C0] fullMode])
        {
          uint64_t v28 = [v36 objectForKeyedSubscript:@"Account type"];
          [v16 setObject:v28 forKeyedSubscript:@"Account type"];

          uint64_t v29 = [v36 objectForKeyedSubscript:@"Duration"];
        }
        else
        {
          unint64_t v30 = [v36 objectForKeyedSubscript:@"Duration"];

          if (!v30)
          {
LABEL_22:
            id v35 = [v36 objectForKeyedSubscript:@"Network interface"];
            [v16 setObject:v35 forKeyedSubscript:@"Network interface"];

            [(PLOperator *)self logEntry:v16];
            goto LABEL_23;
          }
          id v31 = [v36 objectForKeyedSubscript:@"Duration"];
          [v31 doubleValue];
          double v33 = v32;

          uint64_t v29 = [MEMORY[0x1E4F28ED0] numberWithDouble:round(v33 * 100.0) / 100.0];
        }
        v34 = (void *)v29;
        [v16 setObject:v29 forKeyedSubscript:@"Duration"];

        goto LABEL_22;
      }
    }
  }
LABEL_23:
  MEMORY[0x1F41817F8]();
}

- (void)logEventPointJetsam:(unint64_t)a3
{
  id v5 = [(PLOperator *)self storage];
  [v5 flushCachesWithReason:@"Jetsam"];

  id v8 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"Jetsam"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v8];
  id v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:a3];
  [v6 setObject:v7 forKeyedSubscript:@"Level"];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventPointBackgroundTransfer:(id)a3
{
  if (a3)
  {
    id v22 = (id)[a3 mutableCopy];
    uint64_t v4 = [v22 objectForKeyedSubscript:@"errorFailingURL"];
    if (v4)
    {
      id v5 = (void *)v4;
      id v6 = [v22 objectForKeyedSubscript:@"errorFailingURL"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v8 = [v22 objectForKeyedSubscript:@"errorFailingURL"];
        uint64_t v9 = [v8 absoluteString];
        [v22 setObject:v9 forKeyedSubscript:@"errorFailingURL"];
      }
    }
    uint64_t v10 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"BackgroundTransfer"];
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v10 withRawData:v22];
    uint64_t v12 = [v11 objectForKeyedSubscript:@"bytesReceived"];
    int v13 = [v12 intValue];

    if (v13 >= 101)
    {
      double v14 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v15 = [v11 objectForKeyedSubscript:@"bytesReceived"];
      objc_super v16 = objc_msgSend(v14, "numberWithInt:", +[PLUtilities roundToSigFig:withSigFig:](PLUtilities, "roundToSigFig:withSigFig:", objc_msgSend(v15, "intValue"), 2));
      [v11 setObject:v16 forKeyedSubscript:@"bytesReceived"];
    }
    char v17 = [v11 objectForKeyedSubscript:@"bytesSent"];
    int v18 = [v17 intValue];

    if (v18 >= 101)
    {
      uint64_t v19 = (void *)MEMORY[0x1E4F28ED0];
      unint64_t v20 = [v11 objectForKeyedSubscript:@"bytesSent"];
      char v21 = objc_msgSend(v19, "numberWithInt:", +[PLUtilities roundToSigFig:withSigFig:](PLUtilities, "roundToSigFig:withSigFig:", objc_msgSend(v20, "intValue"), 2));
      [v11 setObject:v21 forKeyedSubscript:@"bytesSent"];
    }
    [(PLOperator *)self logEntry:v11];
  }
}

- (void)logEventPointNavd:(id)a3
{
  id v13 = a3;
  uint64_t v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"navd"];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4];
  id v6 = [v13 objectForKey:@"Event"];
  char v7 = [v6 isEqualToString:@"ReceivedNewHypothesis"];

  if (v7)
  {
    id v8 = &unk_1F400D750;
  }
  else
  {
    uint64_t v9 = [v13 objectForKey:@"Event"];
    char v10 = [v9 isEqualToString:@"SendingETARequest"];

    if (v10)
    {
      id v8 = &unk_1F400D768;
    }
    else
    {
      uint64_t v11 = [v13 objectForKey:@"Event"];
      int v12 = [v11 isEqualToString:@"RequestingDirections"];

      if (!v12) {
        goto LABEL_8;
      }
      id v8 = &unk_1F400D780;
    }
  }
  [v5 setObject:v8 forKeyedSubscript:@"EventRequest"];
LABEL_8:
  [(PLOperator *)self logEntry:v5];
}

- (void)logEventPointNavdMapsWidgetSession:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"MapsWidgetSession"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventPointNavdGeoNetworkActivity:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v6 = +[PLOperator entryKeyForType:v4 andName:@"GEONetworkActivity"];
  [(PLXPCAgent *)self logNetworkActivity:v5 withEntryKey:v6];
}

- (void)logNetworkActivity:(id)a3 withEntryKey:(id)a4
{
  int v25 = self;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  double v32 = [v5 objectForKeyedSubscript:@"StartUnix"];
  id v31 = [v5 objectForKeyedSubscript:@"EndUnix"];
  id v7 = objc_opt_new();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = [v5 allKeys];
  uint64_t v8 = [obj countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v38;
    uint64_t v26 = *(void *)v38;
    id v27 = v5;
    do
    {
      uint64_t v11 = 0;
      uint64_t v28 = v9;
      do
      {
        if (*(void *)v38 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v37 + 1) + 8 * v11);
        id v13 = objc_msgSend(v5, "objectForKeyedSubscript:", v12, v25);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          uint64_t v30 = v11;
          uint64_t v15 = [v5 objectForKeyedSubscript:v12];
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          objc_super v16 = [v15 allKeys];
          uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v43 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v34;
            do
            {
              for (uint64_t i = 0; i != v18; ++i)
              {
                if (*(void *)v34 != v19) {
                  objc_enumerationMutation(v16);
                }
                uint64_t v21 = *(void *)(*((void *)&v33 + 1) + 8 * i);
                id v22 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v6];
                [v22 setObject:v32 forKeyedSubscript:@"StartUnix"];
                [v22 setObject:v31 forKeyedSubscript:@"EndUnix"];
                [v22 setObject:v12 forKeyedSubscript:@"Client"];
                [v22 setObject:v21 forKeyedSubscript:@"NetworkingReason"];
                char v23 = [v15 objectForKeyedSubscript:v21];
                [v22 setObject:v23 forKeyedSubscript:@"RequestCount"];

                [v7 addObject:v22];
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v33 objects:v43 count:16];
            }
            while (v18);
          }

          id v5 = v27;
          uint64_t v9 = v28;
          uint64_t v10 = v26;
          uint64_t v11 = v30;
        }
        ++v11;
      }
      while (v11 != v9);
      uint64_t v9 = [obj countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v9);
  }

  id v41 = v6;
  id v42 = v7;
  uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
  [(PLOperator *)v25 logEntries:v24 withGroupID:v6];
}

- (void)logEventPointNavdMapsNavigationStateEvent:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"MapsNavigationStateEvent"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventPointMobileBackupStatistics:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"MobileBackupStatistics"];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = objc_msgSend(v4, "allKeys", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
        id v12 = objc_alloc(MEMORY[0x1E4F929D0]);
        id v13 = [v4 objectForKeyedSubscript:v11];
        double v14 = (void *)[v12 initWithEntryKey:v5 withRawData:v13];

        [(PLOperator *)self logEntry:v14];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (void)logEventPointMobileBackupEvents:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v21 = +[PLOperator entryKeyForType:v4 andName:@"MobileBackupEvents"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v21 withRawData:v5];

  if (([MEMORY[0x1E4F92A38] internalBuild] & 1) == 0)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1C9C8];
    uint64_t v8 = [v6 objectForKeyedSubscript:@"start"];
    [v8 timeIntervalSince1970];
    uint64_t v10 = [v7 dateWithTimeIntervalSince1970:round(v9)];
    [v6 setObject:v10 forKeyedSubscript:@"start"];

    uint64_t v11 = (void *)MEMORY[0x1E4F1C9C8];
    id v12 = [v6 objectForKeyedSubscript:@"end"];
    [v12 timeIntervalSince1970];
    double v14 = [v11 dateWithTimeIntervalSince1970:round(v13)];
    [v6 setObject:v14 forKeyedSubscript:@"end"];
  }
  long long v15 = [v6 objectForKeyedSubscript:@"finished"];
  int v16 = [v15 BOOLValue];

  if (v16)
  {
    long long v17 = (void *)MEMORY[0x1E4F929C0];
    id v18 = objc_alloc(MEMORY[0x1E4F28ED0]);
    uint64_t v19 = [v6 objectForKeyedSubscript:@"end"];
    [v19 timeIntervalSince1970];
    uint64_t v20 = objc_msgSend(v18, "initWithDouble:");
    [v17 setObject:v20 forKey:@"LastBackupTimestamp" saveToDisk:1];
  }
  [(PLOperator *)self logEntry:v6];
}

- (void)logEventPointADD:(id)a3
{
  id v4 = a3;
  if (+[PLUtilities isSafetyDataSubmissionAllowed])
  {
    id v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"ADD"];
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5 withRawData:v4];
    [(PLOperator *)self logEntry:v6];
  }
  else
  {
    uint64_t v7 = PLLogXPC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[PLXPCAgent logEventPointADD:]();
    }
  }
}

- (BOOL)shouldLogAppActivationData
{
  if ([MEMORY[0x1E4F929C0] taskMode]) {
    return 1;
  }
  id v3 = (void *)MEMORY[0x1E4F929C0];
  return [v3 eplEnabled];
}

- (void)logEventPointAppActivationPerformanceActivationData:(id)a3
{
  id v12 = a3;
  if ([(PLXPCAgent *)self shouldLogAppActivationData])
  {
    id v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"AppActivationPerformanceActivationData"];
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4 withRawData:v12];
    id v6 = [v12 objectForKeyedSubscript:@"Timestamp"];

    if (v6)
    {
      uint64_t v7 = [v12 objectForKeyedSubscript:@"Timestamp"];
      [v7 doubleValue];
      double v9 = v8;

      uint64_t v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v9];
      uint64_t v11 = [v10 convertFromSystemToMonotonic];
      [v5 setEntryDate:v11];

      [(PLOperator *)self logEntry:v5];
    }
  }
}

- (void)logEventPointAppActivationPerformanceProcessData:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v23 = self;
  if ([(PLXPCAgent *)self shouldLogAppActivationData])
  {
    id v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"AppActivationPerformanceProcessData"];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = [v4 allKeys];
    uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v25;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * v9);
          id v11 = objc_alloc(MEMORY[0x1E4F929D0]);
          id v12 = [v4 objectForKeyedSubscript:v10];
          double v13 = (void *)[v11 initWithEntryKey:v5 withRawData:v12];

          double v14 = [v4 objectForKeyedSubscript:v10];
          long long v15 = [v14 objectForKeyedSubscript:@"Timestamp"];

          if (v15)
          {
            int v16 = [v4 objectForKeyedSubscript:v10];
            long long v17 = [v16 objectForKeyedSubscript:@"Timestamp"];
            [v17 doubleValue];
            double v19 = v18;

            uint64_t v20 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v19];
            id v21 = [v20 convertFromSystemToMonotonic];
            [v13 setEntryDate:v21];

            [(PLOperator *)v23 logEntry:v13];
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v7);
    }
  }
}

- (void)logEventPointAppActivationPerformanceCPUStatistics:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v23 = self;
  if ([(PLXPCAgent *)self shouldLogAppActivationData])
  {
    id v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"AppActivationPerformanceCPUStatistics"];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = [v4 allKeys];
    uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v25;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * v9);
          id v11 = objc_alloc(MEMORY[0x1E4F929D0]);
          id v12 = [v4 objectForKeyedSubscript:v10];
          double v13 = (void *)[v11 initWithEntryKey:v5 withRawData:v12];

          double v14 = [v4 objectForKeyedSubscript:v10];
          long long v15 = [v14 objectForKeyedSubscript:@"Timestamp"];

          if (v15)
          {
            int v16 = [v4 objectForKeyedSubscript:v10];
            long long v17 = [v16 objectForKeyedSubscript:@"Timestamp"];
            [v17 doubleValue];
            double v19 = v18;

            uint64_t v20 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v19];
            id v21 = [v20 convertFromSystemToMonotonic];
            [v13 setEntryDate:v21];

            [(PLOperator *)v23 logEntry:v13];
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v7);
    }
  }
}

- (void)logEventPointAppActivationPerformanceMemoryStatistics:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v23 = self;
  if ([(PLXPCAgent *)self shouldLogAppActivationData])
  {
    id v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"AppActivationPerformanceMemoryStatistics"];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = [v4 allKeys];
    uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v25;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * v9);
          id v11 = objc_alloc(MEMORY[0x1E4F929D0]);
          id v12 = [v4 objectForKeyedSubscript:v10];
          double v13 = (void *)[v11 initWithEntryKey:v5 withRawData:v12];

          double v14 = [v4 objectForKeyedSubscript:v10];
          long long v15 = [v14 objectForKeyedSubscript:@"Timestamp"];

          if (v15)
          {
            int v16 = [v4 objectForKeyedSubscript:v10];
            long long v17 = [v16 objectForKeyedSubscript:@"Timestamp"];
            [v17 doubleValue];
            double v19 = v18;

            uint64_t v20 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v19];
            id v21 = [v20 convertFromSystemToMonotonic];
            [v13 setEntryDate:v21];

            [(PLOperator *)v23 logEntry:v13];
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v7);
    }
  }
}

- (void)logEventPointAppActivationPerformancePowerStateStatistics:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v23 = self;
  if ([(PLXPCAgent *)self shouldLogAppActivationData])
  {
    id v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"AppActivationPerformancePowerStateStatistics"];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = [v4 allKeys];
    uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v25;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * v9);
          id v11 = objc_alloc(MEMORY[0x1E4F929D0]);
          id v12 = [v4 objectForKeyedSubscript:v10];
          double v13 = (void *)[v11 initWithEntryKey:v5 withRawData:v12];

          double v14 = [v4 objectForKeyedSubscript:v10];
          long long v15 = [v14 objectForKeyedSubscript:@"Timestamp"];

          if (v15)
          {
            int v16 = [v4 objectForKeyedSubscript:v10];
            long long v17 = [v16 objectForKeyedSubscript:@"Timestamp"];
            [v17 doubleValue];
            double v19 = v18;

            uint64_t v20 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v19];
            id v21 = [v20 convertFromSystemToMonotonic];
            [v13 setEntryDate:v21];

            [(PLOperator *)v23 logEntry:v13];
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v7);
    }
  }
}

- (void)logEventForwardAvailabilityModes:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v15 = +[PLOperator entryKeyForType:v4 andName:@"AvailabilityModes"];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v15 withRawData:v5];
  uint64_t v7 = (void *)MEMORY[0x1E4F1C9C8];
  uint64_t v8 = [v5 objectForKeyedSubscript:@"timestamp"];
  uint64_t v9 = [v8 convertFromSystemToMonotonic];
  [v9 timeIntervalSince1970];
  id v11 = [v7 dateWithTimeIntervalSince1970:round(v10)];
  [v6 setEntryDate:v11];

  id v12 = (void *)MEMORY[0x1E4F28ED0];
  double v13 = [v5 objectForKeyedSubscript:@"SemanticType"];

  double v14 = objc_msgSend(v12, "numberWithUnsignedInt:", -[PLXPCAgent mapAvailabilityModeSemanticType:](self, "mapAvailabilityModeSemanticType:", (int)objc_msgSend(v13, "intValue")));
  [v6 setObject:v14 forKeyedSubscript:@"SemanticType"];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventPointFocusFilters:(id)a3
{
  id v14 = a3;
  uint64_t v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"FocusFilters"];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4 withRawData:v14];
  uint64_t v6 = (void *)MEMORY[0x1E4F1C9C8];
  uint64_t v7 = [v14 objectForKeyedSubscript:@"timestamp"];
  uint64_t v8 = [v7 convertFromSystemToMonotonic];
  [v8 timeIntervalSince1970];
  double v10 = [v6 dateWithTimeIntervalSince1970:round(v9)];
  [v5 setEntryDate:v10];

  if (([MEMORY[0x1E4F929C0] taskMode] & 1) != 0
    || [MEMORY[0x1E4F929C0] fullMode])
  {
    id v11 = (void *)MEMORY[0x1E4F28ED0];
    id v12 = [v14 objectForKeyedSubscript:@"SemanticType"];
    double v13 = objc_msgSend(v11, "numberWithUnsignedInt:", -[PLXPCAgent mapAvailabilityModeSemanticType:](self, "mapAvailabilityModeSemanticType:", (int)objc_msgSend(v12, "intValue")));
    [v5 setObject:v13 forKeyedSubscript:@"SemanticType"];
  }
  else
  {
    [v5 setObject:0 forKeyedSubscript:@"SemanticType"];
  }
  [(PLOperator *)self logEntry:v5];
}

- (void)logEventPointCloudKit:(id)a3
{
  id v58 = a3;
  uint64_t v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"CloudKit"];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4 withRawData:v58];
  uint64_t v6 = [v58 objectForKeyedSubscript:@"CKRequestUUIDs"];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    uint64_t v8 = NSString;
    double v9 = [v58 objectForKeyedSubscript:@"CKRequestUUIDs"];
    double v10 = [v8 stringWithFormat:@"%@", v9];
    [v5 setObject:v10 forKeyedSubscript:@"CKRequestUUIDs"];
  }
  id v11 = [v58 objectForKeyedSubscript:@"MMCSRequestUUIDs"];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    double v13 = NSString;
    id v14 = [v58 objectForKeyedSubscript:@"MMCSRequestUUIDs"];
    id v15 = [v13 stringWithFormat:@"%@", v14];
    [v5 setObject:v15 forKeyedSubscript:@"MMCSRequestUUIDs"];
  }
  int v16 = [v58 objectForKeyedSubscript:@"CKProtoRequestOperationsByCount"];
  uint64_t v17 = [v16 count];

  if (v17)
  {
    double v18 = NSString;
    double v19 = [v58 objectForKeyedSubscript:@"CKProtoRequestOperationsByCount"];
    uint64_t v20 = [v19 description];
    id v21 = [v18 stringWithFormat:@"%@", v20];
    [v5 setObject:v21 forKeyedSubscript:@"CKProtoRequestOperationsByCount"];
  }
  if (([MEMORY[0x1E4F929C0] fullMode] & 1) == 0)
  {
    id v22 = [v58 objectForKeyedSubscript:@"operationGroupID"];

    if (v22)
    {
      char v23 = [v58 objectForKeyedSubscript:@"operationGroupID"];
      unint64_t v24 = [v23 length];
      if (v24 >= 4) {
        uint64_t v25 = 4;
      }
      else {
        uint64_t v25 = v24;
      }
      long long v26 = [v23 substringToIndex:v25];
      [v5 setObject:v26 forKeyedSubscript:@"operationGroupID"];
    }
  }
  if (([MEMORY[0x1E4F92A38] internalBuild] & 1) == 0)
  {
    [v5 setObject:&stru_1F3FCA098 forKeyedSubscript:@"operationID"];
    long long v27 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v28 = [v5 objectForKeyedSubscript:@"CKBytesUploaded"];
    uint64_t v29 = objc_msgSend(v27, "numberWithInt:", (100 * ((int)(objc_msgSend(v28, "intValue") + 50) / 100)));
    [v5 setObject:v29 forKeyedSubscript:@"CKBytesUploaded"];

    uint64_t v30 = (void *)MEMORY[0x1E4F28ED0];
    id v31 = [v5 objectForKeyedSubscript:@"CKBytesDownloaded"];
    double v32 = objc_msgSend(v30, "numberWithInt:", (100 * ((int)(objc_msgSend(v31, "intValue") + 50) / 100)));
    [v5 setObject:v32 forKeyedSubscript:@"CKBytesDownloaded"];

    long long v33 = [v5 objectForKeyedSubscript:@"CKRecordsUploaded"];
    int v34 = [v33 intValue];

    if (v34 >= 1001)
    {
      long long v35 = (void *)MEMORY[0x1E4F28ED0];
      long long v36 = [v5 objectForKeyedSubscript:@"CKRecordsUploaded"];
      long long v37 = objc_msgSend(v35, "numberWithInt:", +[PLUtilities roundToSigFig:withSigFig:](PLUtilities, "roundToSigFig:withSigFig:", objc_msgSend(v36, "intValue"), 3));
      [v5 setObject:v37 forKeyedSubscript:@"CKRecordsUploaded"];
    }
    long long v38 = [v5 objectForKeyedSubscript:@"CKRecordsDownloaded"];
    int v39 = [v38 intValue];

    if (v39 >= 1001)
    {
      long long v40 = (void *)MEMORY[0x1E4F28ED0];
      id v41 = [v5 objectForKeyedSubscript:@"CKRecordsDownloaded"];
      id v42 = objc_msgSend(v40, "numberWithInt:", +[PLUtilities roundToSigFig:withSigFig:](PLUtilities, "roundToSigFig:withSigFig:", objc_msgSend(v41, "intValue"), 3));
      [v5 setObject:v42 forKeyedSubscript:@"CKRecordsDownloaded"];
    }
    long long v43 = [v5 objectForKeyedSubscript:@"CKRecordsDeleted"];
    int v44 = [v43 intValue];

    if (v44 >= 1001)
    {
      uint64_t v45 = (void *)MEMORY[0x1E4F28ED0];
      long long v46 = [v5 objectForKeyedSubscript:@"CKRecordsDeleted"];
      v47 = objc_msgSend(v45, "numberWithInt:", +[PLUtilities roundToSigFig:withSigFig:](PLUtilities, "roundToSigFig:withSigFig:", objc_msgSend(v46, "intValue"), 3));
      [v5 setObject:v47 forKeyedSubscript:@"CKRecordsDeleted"];
    }
    uint64_t v48 = [v5 objectForKeyedSubscript:@"CKAssetsUploaded"];
    int v49 = [v48 intValue];

    if (v49 >= 101)
    {
      id v50 = (void *)MEMORY[0x1E4F28ED0];
      v51 = [v5 objectForKeyedSubscript:@"CKAssetsUploaded"];
      uint64_t v52 = objc_msgSend(v50, "numberWithInt:", +[PLUtilities roundToSigFig:withSigFig:](PLUtilities, "roundToSigFig:withSigFig:", objc_msgSend(v51, "intValue"), 2));
      [v5 setObject:v52 forKeyedSubscript:@"CKAssetsUploaded"];
    }
    v53 = [v5 objectForKeyedSubscript:@"CKAssetsDownloaded"];
    int v54 = [v53 intValue];

    if (v54 >= 101)
    {
      v55 = (void *)MEMORY[0x1E4F28ED0];
      v56 = [v5 objectForKeyedSubscript:@"CKAssetsDownloaded"];
      v57 = objc_msgSend(v55, "numberWithInt:", +[PLUtilities roundToSigFig:withSigFig:](PLUtilities, "roundToSigFig:withSigFig:", objc_msgSend(v56, "intValue"), 2));
      [v5 setObject:v57 forKeyedSubscript:@"CKAssetsDownloaded"];
    }
  }
  [(PLOperator *)self logEntry:v5];
}

- (void)logEventPointLocationVehicularDetectionSession:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v14 = +[PLOperator entryKeyForType:v4 andName:@"VehicularDetection"];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v14 withRawData:v5];

  uint64_t v7 = (void *)MEMORY[0x1E4F1C9C8];
  uint64_t v8 = [v6 entryDate];
  [v8 timeIntervalSince1970];
  double v10 = v9;
  id v11 = [v6 entryDate];
  [v11 timeIntervalSince1970];
  *(float *)&double v12 = v12;
  double v13 = objc_msgSend(v7, "dateWithTimeIntervalSince1970:", round(v10 - fmodf(*(float *)&v12, 60.0)));
  [v6 setEntryDate:v13];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventPointMotionWakeReasonSession:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"MotionWakeReason"];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventPointCommuteRefreshSession:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v22 = +[PLOperator entryKeyForType:v4 andName:@"CommuteRefresh"];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v22 withRawData:v5];

  id v7 = [v6 objectForKeyedSubscript:@"LOIEntryDate"];
  LODWORD(v5) = [v7 intValue];

  if ((int)v5 >= 1)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F28ED0];
    double v9 = [v6 objectForKeyedSubscript:@"LOIEntryDate"];
    int v10 = [v9 intValue];
    id v11 = [v6 objectForKeyedSubscript:@"LOIEntryDate"];
    int v12 = [v11 intValue];
    double v13 = [v8 numberWithInt:(v10 + 300 * (v12 / 300) - v12)];
    [v6 setObject:v13 forKeyedSubscript:@"LOIEntryDate"];
  }
  id v14 = [v6 objectForKeyedSubscript:@"LOIExitDate"];
  int v15 = [v14 intValue];

  if (v15 >= 1)
  {
    int v16 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v17 = [v6 objectForKeyedSubscript:@"LOIExitDate"];
    int v18 = [v17 intValue];
    double v19 = [v6 objectForKeyedSubscript:@"LOIExitDate"];
    int v20 = [v19 intValue];
    id v21 = [v16 numberWithInt:(v18 + 300 * (v20 / 300) - v20)];
    [v6 setObject:v21 forKeyedSubscript:@"LOIExitDate"];
  }
  [(PLOperator *)self logEntry:v6];
}

- (void)logEventPointSecItemSession:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"SecItem"];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventPointDeepScanReasons:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"DeepScanReasons"];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v18 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          int v12 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5];
          [v12 setObject:v11 forKeyedSubscript:@"AppLibraryID"];
          if (([MEMORY[0x1E4F929C0] fullMode] & 1) == 0)
          {
            double v13 = [v6 objectForKeyedSubscript:v11];

            if (v13)
            {
              id v14 = [v6 objectForKeyedSubscript:v11];
              unint64_t v15 = [v14 length];
              if (v15 >= 0xC8) {
                uint64_t v16 = 200;
              }
              else {
                uint64_t v16 = v15;
              }
              uint64_t v17 = [v14 substringToIndex:v16];
              [v12 setObject:v17 forKeyedSubscript:@"Reason"];
            }
          }
          [(PLOperator *)self logEntry:v12];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v8);
    }

    id v4 = v18;
  }
}

- (void)logEventPointSiriActivation:(id)a3
{
  id v10 = a3;
  if (v10 && [MEMORY[0x1E4F92A38] isWatch])
  {
    id v4 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    if (([MEMORY[0x1E4F929C0] fullMode] & 1) == 0)
    {
      id v5 = (void *)MEMORY[0x1E4F1C9C8];
      [v4 timeIntervalSince1970];
      uint64_t v7 = [v5 dateWithTimeIntervalSince1970:round(v6 / 60.0) * 60.0];

      id v4 = (void *)v7;
    }
    uint64_t v8 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"SiriActivation"];
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v8 withRawData:v10];
    [v9 setEntryDate:v4];
    [(PLOperator *)self logEntry:v9];
  }
}

- (void)logEventPointAirPlayDiscoveryMode:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v10 = +[PLOperator entryKeyForType:v4 andName:@"AirPlayDiscoveryMode"];
  double v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v10];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"Mode"];

  int64_t v8 = [(PLXPCAgent *)self modeTypeStringToEnum:v7];
  uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:v8];
  [v6 setObject:v9 forKeyedSubscript:@"Mode"];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventPointShortcutsTriggerFired:(id)a3
{
  if (!a3) {
    return;
  }
  id v15 = (id)[a3 mutableCopy];
  if (![MEMORY[0x1E4F929C0] fullMode])
  {
    [v15 setObject:0 forKeyedSubscript:@"WFTriggerID"];
    [v15 setObject:0 forKeyedSubscript:@"WFWorkflowID"];
    [v15 setObject:0 forKeyedSubscript:@"WFWorkflowName"];
    [v15 setObject:0 forKeyedSubscript:@"WFAssociatedAppBundleID"];
LABEL_10:
    uint64_t v9 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"ShortcutsTriggerFired"];
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v9 withRawData:v15];
    if (([MEMORY[0x1E4F929C0] fullMode] & 1) == 0)
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F1C9C8];
      int v12 = [v10 entryDate];
      [v12 timeIntervalSince1970];
      id v14 = [v11 dateWithTimeIntervalSince1970:round(v13)];
      [v10 setEntryDate:v14];
    }
    [(PLOperator *)self logEntry:v10];

    goto LABEL_13;
  }
  uint64_t v4 = [v15 objectForKeyedSubscript:@"WFWorkflowName"];
  if (v4)
  {
    id v5 = v4;
    unint64_t v6 = [v4 length];
    if (v6 >= 0x40) {
      uint64_t v7 = 64;
    }
    else {
      uint64_t v7 = v6;
    }
    int64_t v8 = [v5 substringToIndex:v7];
    [v15 setObject:v8 forKeyedSubscript:@"WFWorkflowName"];

    goto LABEL_10;
  }
LABEL_13:
}

- (void)logEventForwardSOSKVSRateLimitingEvent:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (!v4
    || ([v4 objectForKeyedSubscript:@"timestamp"], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_15:
    uint64_t v11 = PLLogXPC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PLXPCAgent logEventForwardSOSKVSRateLimitingEvent:]();
    }
    goto LABEL_17;
  }
  uint64_t v7 = (void *)v6;
  uint64_t v8 = [v5 objectForKeyedSubscript:@"peerShouldSend"];
  if (!v8)
  {

    goto LABEL_15;
  }
  uint64_t v9 = (void *)v8;
  id v10 = [v5 objectForKeyedSubscript:@"attributeBadness"];

  if (!v10) {
    goto LABEL_15;
  }
  uint64_t v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"SOSKVSRateLimitingEvent"];
  int v12 = [v5 objectForKeyedSubscript:@"timestamp"];
  [v12 doubleValue];
  double v14 = v13;

  id v15 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v14];
  uint64_t v16 = [v15 convertFromSystemToMonotonic];

  uint64_t v17 = [v5 objectForKeyedSubscript:@"peerShouldSend"];
  uint64_t v18 = [v17 BOOLValue];

  uint64_t v30 = v5;
  [v5 objectForKeyedSubscript:@"attributeBadness"];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v32;
    while (2)
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v32 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        int64_t SOSKVSEntries = self->_SOSKVSEntries;
        self->_int64_t SOSKVSEntries = SOSKVSEntries + 1;
        if (SOSKVSEntries >= 1000)
        {
          uint64_t v29 = PLLogXPC();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
            -[PLXPCAgent logEventForwardSOSKVSRateLimitingEvent:]();
          }

          goto LABEL_21;
        }
        long long v26 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v11];
        [v26 setEntryDate:v16];
        [v26 setObject:v24 forKeyedSubscript:@"AccessGroup"];
        long long v27 = [v19 objectForKeyedSubscript:v24];
        [v26 setObject:v27 forKeyedSubscript:@"BadnessLevel"];

        uint64_t v28 = [MEMORY[0x1E4F28ED0] numberWithBool:v18];
        [v26 setObject:v28 forKeyedSubscript:@"peerShouldSend"];

        [(PLOperator *)self logEntry:v26];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }
LABEL_21:

  id v5 = v30;
LABEL_17:
}

- (void)logEventPointOctagonTrustEvent:(id)a3
{
  if (a3)
  {
    uint64_t v4 = *MEMORY[0x1E4F92D48];
    id v5 = a3;
    id v7 = +[PLOperator entryKeyForType:v4 andName:@"OctagonTrust"];
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

    [(PLOperator *)self logEntry:v6];
  }
}

- (void)handleCKKSSyncingEvent:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v12 = v4;
    id v5 = [v4 objectForKey:@"ratelimit"];

    if (v5) {
      uint64_t v6 = @"CKKSSyncingRateLimit";
    }
    else {
      uint64_t v6 = @"CKKSSyncing";
    }
    id v7 = (void *)MEMORY[0x1E4F92D28];
    if (v5) {
      id v7 = (void *)MEMORY[0x1E4F92D48];
    }
    uint64_t v8 = +[PLOperator entryKeyForType:*v7 andName:v6];
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v8 withRawData:v12];
    id v10 = [v12 objectForKey:@"items"];

    if (v10)
    {
      uint64_t v11 = [v12 objectForKeyedSubscript:@"items"];
      [v9 setObject:v11 forKeyedSubscript:@"count"];
    }
    [(PLOperator *)self logEntry:v9];

    id v4 = v12;
  }
}

- (void)logEventForwardGMSOptIn
{
  if ([MEMORY[0x1E4F92A38] hasGenerativeModelSystems]
    && [MEMORY[0x1E4F92A38] isiOS])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __37__PLXPCAgent_logEventForwardGMSOptIn__block_invoke;
    v5[3] = &unk_1E6E48478;
    v5[4] = self;
    [MEMORY[0x1E4F59BB8] getGMOptInToggleWithCompletion:v5];
  }
  else
  {
    id v3 = PLLogXPC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1E4220000, v3, OS_LOG_TYPE_DEFAULT, "Device does not support GenerativeFunctionMetrics OptIn logging", v4, 2u);
    }
  }
}

void __37__PLXPCAgent_logEventForwardGMSOptIn__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = objc_opt_new();
  id v7 = PLLogXPC();
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __37__PLXPCAgent_logEventForwardGMSOptIn__block_invoke_cold_1();
    }

    [v6 setObject:&unk_1F400D798 forKeyedSubscript:@"Enabled"];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v13 = a2;
      _os_log_impl(&dword_1E4220000, v8, OS_LOG_TYPE_DEFAULT, "GenerativeFunctionMetrics OptIn isEnabled state: %d", buf, 8u);
    }

    uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithBool:a2];
    [v6 setObject:v9 forKeyedSubscript:@"Enabled"];
  }
  [*(id *)(a1 + 32) logForSubsystem:@"GenerativeFunctionMetrics" category:@"OptIn" data:v6];
  [*(id *)(a1 + 32) logForSubsystem:@"BackgroundProcessing" category:@"GenerativeFunctionMetricsOptIn" data:v6];
  uint64_t v11 = v6;
  id v10 = v6;
  AnalyticsSendEventLazy();
}

id __37__PLXPCAgent_logEventForwardGMSOptIn__block_invoke_2976(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLLogXPC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"Enabled"];
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1E4220000, v2, OS_LOG_TYPE_DEFAULT, "GenerativeFunctionMetrics OptIn state being sent to Core Analytics: %@", (uint8_t *)&v6, 0xCu);
  }
  id v4 = *(void **)(a1 + 32);
  return v4;
}

- (void)logEventForwardAssetLoadGF:(id)a3
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F92A38] hasGenerativeModelSystems])
  {
    id v5 = [v4 mutableCopy];
    int v6 = (void *)MEMORY[0x1E4F1C9C8];
    id v7 = [v4 objectForKeyedSubscript:@"timestampValue"];
    [v7 doubleValue];
    uint64_t v8 = objc_msgSend(v6, "dateWithTimeIntervalSince1970:");

    uint64_t v9 = [v8 convertFromSystemToMonotonic];

    [v5 removeObjectForKey:@"timestampValue"];
    id v10 = [v4 objectForKeyedSubscript:@"eventType"];
    LODWORD(v7) = [v10 intValue];

    uint64_t v11 = [v4 objectForKeyedSubscript:@"catalogResourceIdentifier"];
    id v12 = +[PLUtilities removeFirstPartyBundleIDPrefix:v11];
    [v5 setObject:v12 forKeyedSubscript:@"catalogResourceIdentifier"];

    if (v7 == 1)
    {
      [(PLOperator *)self logForSubsystem:@"GenerativeFunctionMetrics" category:@"assetLoad" data:v5 date:v9];
    }
    else
    {
      int v13 = (void *)[objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"timestampEnd" withValue:&unk_1F400D798 withComparisonOperation:6];
      id v14 = objc_alloc(MEMORY[0x1E4F92A90]);
      id v15 = [v5 objectForKeyedSubscript:@"catalogResourceIdentifier"];
      uint64_t v16 = (void *)[v14 initWithKey:@"catalogResourceIdentifier" withValue:v15 withComparisonOperation:0];

      uint64_t v17 = [MEMORY[0x1E4F92AD0] sharedCore];
      uint64_t v18 = [v17 storage];
      v28[0] = v16;
      v28[1] = v13;
      id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
      uint64_t v20 = [v18 lastEntryForKey:@"GenerativeFunctionMetrics_assetLoad_1_2" withComparisons:v19 isSingleton:1];

      uint64_t v21 = PLLogXPC();
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
      if (v20)
      {
        if (v22) {
          -[PLXPCAgent logEventForwardAssetLoadGF:]();
        }

        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        void v24[2] = __41__PLXPCAgent_logEventForwardAssetLoadGF___block_invoke;
        v24[3] = &unk_1E6E481B0;
        id v25 = v20;
        id v26 = v9;
        id v27 = v4;
        [(PLOperator *)self updateEntry:v25 withBlock:v24];
      }
      else
      {
        if (v22) {
          -[PLXPCAgent logEventForwardAssetLoadGF:]();
        }

        [v5 setObject:v9 forKeyedSubscript:@"timestampEnd"];
        [(PLOperator *)self logForSubsystem:@"GenerativeFunctionMetrics" category:@"assetLoad" data:v5 date:v9];
      }
    }
  }
  else
  {
    id v5 = PLLogXPC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v23 = 0;
      _os_log_impl(&dword_1E4220000, v5, OS_LOG_TYPE_DEFAULT, "Device does not support GenerativeFunctionMetrics assetLoad logging", v23, 2u);
    }
  }
}

void __41__PLXPCAgent_logEventForwardAssetLoadGF___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKeyedSubscript:@"timestampEnd"];
  uint64_t v2 = [v1[2] objectForKeyedSubscript:@"result"];
  [*v1 setObject:v2 forKeyedSubscript:@"result"];

  id v3 = PLLogXPC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __41__PLXPCAgent_logEventForwardAssetLoadGF___block_invoke_cold_1();
  }
}

- (void)logFileResidentInfo:(id)a3
{
  id v16 = a3;
  id v4 = (void *)[v16 mutableCopy];
  id v5 = (void *)MEMORY[0x1E4F1C9C8];
  int v6 = [v16 objectForKeyedSubscript:@"timestampValue"];
  [v6 doubleValue];
  id v7 = objc_msgSend(v5, "dateWithTimeIntervalSince1970:");

  uint64_t v8 = [v7 convertFromSystemToMonotonic];

  [v4 removeObjectForKey:@"timestampValue"];
  uint64_t v9 = [v16 objectForKeyedSubscript:@"fileResidentRatio"];

  if (v9)
  {
    id v10 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v11 = [v16 objectForKeyedSubscript:@"fileResidentRatio"];
    [v11 doubleValue];
    int v13 = [v10 numberWithInt:(int)(v12 * 100.0)];
    [v4 setObject:v13 forKeyedSubscript:@"fileResidentRatio"];
  }
  id v14 = [v16 objectForKeyedSubscript:@"catalogResourceIdentifier"];
  id v15 = +[PLUtilities removeFirstPartyBundleIDPrefix:v14];
  [v4 setObject:v15 forKeyedSubscript:@"catalogResourceIdentifier"];

  [(PLOperator *)self logForSubsystem:@"GenerativeFunctionMetrics" category:@"fileResidentInfo" data:v4 date:v8];
}

- (void)logEventForwardMMExecuteRequest:(id)a3
{
  void v39[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F92A38] hasGenerativeModelSystems])
  {
    id v5 = [v4 mutableCopy];
    int v6 = (void *)MEMORY[0x1E4F1C9C8];
    id v7 = [v4 objectForKeyedSubscript:@"timestampValue"];
    [v7 doubleValue];
    uint64_t v8 = objc_msgSend(v6, "dateWithTimeIntervalSince1970:");

    uint64_t v9 = [v8 convertFromSystemToMonotonic];

    [v5 removeObjectForKey:@"timestampValue"];
    id v10 = [v4 objectForKeyedSubscript:@"eventType"];
    LODWORD(v7) = [v10 intValue];

    if (v7 == 1)
    {
      uint64_t v11 = [v4 objectForKeyedSubscript:@"createdByBundleIdentifier"];
      double v12 = +[PLUtilities removeFirstPartyBundleIDPrefix:v11];
      [v5 setObject:v12 forKeyedSubscript:@"createdByBundleIdentifier"];

      int v13 = [v4 objectForKeyedSubscript:@"onBehalfOfBundleIdentifier"];
      id v14 = +[PLUtilities removeFirstPartyBundleIDPrefix:v13];
      [v5 setObject:v14 forKeyedSubscript:@"onBehalfOfBundleIdentifier"];

      id v15 = [v4 objectForKeyedSubscript:@"catalogResourceIdentifier"];
      id v16 = +[PLUtilities removeFirstPartyBundleIDPrefix:v15];
      [v5 setObject:v16 forKeyedSubscript:@"catalogResourceIdentifier"];

      [(PLOperator *)self logForSubsystem:@"GenerativeFunctionMetrics" category:@"mmExecuteRequest" data:v5 date:v9];
    }
    else
    {
      uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"timestampEnd" withValue:&unk_1F400D798 withComparisonOperation:6];
      id v18 = objc_alloc(MEMORY[0x1E4F92A90]);
      id v19 = [v5 objectForKeyedSubscript:@"requestIdentifier"];
      uint64_t v20 = (void *)[v18 initWithKey:@"requestIdentifier" withValue:v19 withComparisonOperation:0];

      uint64_t v21 = [MEMORY[0x1E4F92AD0] sharedCore];
      BOOL v22 = [v21 storage];
      v39[0] = v20;
      v39[1] = v17;
      char v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
      uint64_t v24 = [v22 lastEntryForKey:@"GenerativeFunctionMetrics_mmExecuteRequest_1_2" withComparisons:v23 isSingleton:1];

      id v25 = PLLogXPC();
      BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG);
      if (v24)
      {
        if (v26) {
          -[PLXPCAgent logEventForwardMMExecuteRequest:]();
        }

        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        void v35[2] = __46__PLXPCAgent_logEventForwardMMExecuteRequest___block_invoke;
        v35[3] = &unk_1E6E481B0;
        id v27 = v24;
        id v36 = v27;
        id v28 = v9;
        id v37 = v28;
        long long v38 = v5;
        [(PLOperator *)self updateEntry:v27 withBlock:v35];
        uint64_t v29 = [v27 objectForKeyedSubscript:@"onBehalfOfBundleIdentifier"];
        uint64_t v30 = [v27 entryDate];
        [v30 timeIntervalSince1970];
        double v32 = v31;

        [v28 timeIntervalSince1970];
        [(PLXPCAgent *)self setInferenceEntriesWithBundleID:v29 inferenceStart:v32 inferenceEnd:v33];
      }
      else
      {
        if (v26) {
          -[PLXPCAgent logEventForwardMMExecuteRequest:]();
        }

        [v5 setObject:v9 forKeyedSubscript:@"timestampEnd"];
        [(PLOperator *)self logForSubsystem:@"GenerativeFunctionMetrics" category:@"mmExecuteRequest" data:v5 date:v9];
      }
    }
  }
  else
  {
    id v5 = PLLogXPC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v34 = 0;
      _os_log_impl(&dword_1E4220000, v5, OS_LOG_TYPE_DEFAULT, "Device does not support GenerativeFunctionMetrics mmExecuteRequest logging", v34, 2u);
    }
  }
}

void __46__PLXPCAgent_logEventForwardMMExecuteRequest___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKeyedSubscript:@"timestampEnd"];
  uint64_t v2 = [v1[2] objectForKeyedSubscript:@"error"];
  [*v1 setObject:v2 forKeyedSubscript:@"error"];

  id v3 = PLLogXPC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __46__PLXPCAgent_logEventForwardMMExecuteRequest___block_invoke_cold_1();
  }
}

- (void)logEventForwardSummarization:(id)a3
{
  id v25 = a3;
  if (![MEMORY[0x1E4F92A38] hasGenerativeModelSystems]) {
    goto LABEL_14;
  }
  id v4 = (void *)[v25 mutableCopy];
  id v5 = (void *)MEMORY[0x1E4F1C9C8];
  int v6 = [v25 objectForKeyedSubscript:@"timestampEnd"];
  [v6 doubleValue];
  id v7 = objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");

  uint64_t v8 = [v7 convertFromSystemToMonotonic];

  [v4 setObject:v8 forKeyedSubscript:@"timestampEnd"];
  uint64_t v9 = (void *)MEMORY[0x1E4F1C9C8];
  id v10 = [v25 objectForKeyedSubscript:@"timestampStart"];
  [v10 doubleValue];
  uint64_t v11 = objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");

  double v12 = [v11 convertFromSystemToMonotonic];

  [v4 removeObjectForKey:@"timestampStart"];
  uint64_t v13 = [v25 objectForKey:@"kind"];
  if (v13)
  {
    id v14 = (void *)v13;
    id v15 = [v25 objectForKeyedSubscript:@"kind"];
    int v16 = [v15 intValue];

    if (v16 == 4)
    {
      if ([MEMORY[0x1E4F92A38] isiOS])
      {
        uint64_t v17 = @"com.apple.mobilemail";
      }
      else
      {
        if (![MEMORY[0x1E4F92A38] isARMMac]) {
          goto LABEL_9;
        }
        uint64_t v17 = @"com.apple.mail";
      }
      [v4 setObject:v17 forKeyedSubscript:@"bundleID"];
    }
  }
LABEL_9:
  [(PLOperator *)self logForSubsystem:@"GenerativeFunctionMetrics" category:@"Summarization" data:v4 date:v12];
  id v18 = [v25 objectForKeyedSubscript:@"kind"];
  int v19 = [v18 intValue];

  uint64_t v20 = [v25 objectForKeyedSubscript:@"bundleID"];
  uint64_t v21 = [v25 objectForKeyedSubscript:@"stackDepth"];
  uint64_t v22 = [v21 intValue];

  if (v19 && v20 && (int)v22 >= 1)
  {
    summarizationEntries = self->_summarizationEntries;
    uint64_t v24 = [MEMORY[0x1E4F28ED0] numberWithInt:v22];
    [(NSMutableDictionary *)summarizationEntries setObject:v24 forKey:v20];
  }
LABEL_14:
}

- (void)logEventForwardTGIExecuteRequest:(id)a3
{
  void v38[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F92A38] hasGenerativeModelSystems])
  {
    id v5 = [v4 mutableCopy];
    int v6 = (void *)MEMORY[0x1E4F1C9C8];
    id v7 = [v4 objectForKeyedSubscript:@"timestampValue"];
    [v7 doubleValue];
    uint64_t v8 = objc_msgSend(v6, "dateWithTimeIntervalSince1970:");

    uint64_t v9 = [v8 convertFromSystemToMonotonic];

    [v5 removeObjectForKey:@"timestampValue"];
    id v10 = [v4 objectForKeyedSubscript:@"eventType"];
    int v11 = [v10 intValue];

    double v12 = PLLogXPC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[PLXPCAgent logEventForwardTGIExecuteRequest:]();
    }

    if (v11 == 1)
    {
      [(PLOperator *)self logForSubsystem:@"GenerativeFunctionMetrics" category:@"tgiExecuteRequest" data:v5 date:v9];
    }
    else
    {
      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"timestampEnd" withValue:&unk_1F400D798 withComparisonOperation:6];
      id v14 = objc_alloc(MEMORY[0x1E4F92A90]);
      id v15 = [v5 objectForKeyedSubscript:@"requestIdentifier"];
      int v16 = (void *)[v14 initWithKey:@"requestIdentifier" withValue:v15 withComparisonOperation:0];

      uint64_t v17 = [MEMORY[0x1E4F92AD0] sharedCore];
      id v18 = [v17 storage];
      v38[0] = v16;
      v38[1] = v13;
      int v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
      uint64_t v20 = [v18 lastEntryForKey:@"GenerativeFunctionMetrics_tgiExecuteRequest_1_2" withComparisons:v19 isSingleton:1];

      uint64_t v21 = PLLogXPC();
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
      if (v20)
      {
        if (v22) {
          -[PLXPCAgent logEventForwardTGIExecuteRequest:]();
        }

        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        void v34[2] = __47__PLXPCAgent_logEventForwardTGIExecuteRequest___block_invoke;
        v34[3] = &unk_1E6E481B0;
        id v35 = v20;
        id v36 = v9;
        id v37 = v4;
        [(PLOperator *)self updateEntry:v35 withBlock:v34];
      }
      else
      {
        if (v22) {
          -[PLXPCAgent logEventForwardTGIExecuteRequest:]();
        }

        [v5 setObject:v9 forKeyedSubscript:@"timestampEnd"];
        char v23 = [v4 objectForKeyedSubscript:@"sd_draftTokenAcceptanceRate"];

        if (v23)
        {
          uint64_t v24 = (void *)MEMORY[0x1E4F28ED0];
          id v25 = [v4 objectForKeyedSubscript:@"sd_draftTokenAcceptanceRate"];
          [v25 doubleValue];
          id v27 = [v24 numberWithInt:(int)(v26 * 100.0)];
          [v5 setObject:v27 forKeyedSubscript:@"sd_draftTokenAcceptanceRate"];
        }
        id v28 = [v4 objectForKeyedSubscript:@"sd_speculationSuccessRate"];

        if (v28)
        {
          uint64_t v29 = (void *)MEMORY[0x1E4F28ED0];
          uint64_t v30 = [v4 objectForKeyedSubscript:@"sd_speculationSuccessRate"];
          [v30 doubleValue];
          double v32 = [v29 numberWithInt:(int)(v31 * 100.0)];
          [v5 setObject:v32 forKeyedSubscript:@"sd_speculationSuccessRate"];
        }
        [(PLOperator *)self logForSubsystem:@"GenerativeFunctionMetrics" category:@"tgiExecuteRequest" data:v5 date:v9];
      }
    }
  }
  else
  {
    id v5 = PLLogXPC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v33 = 0;
      _os_log_impl(&dword_1E4220000, v5, OS_LOG_TYPE_DEFAULT, "Device does not support GenerativeFunctionMetrics tgiExecuteRequest logging", v33, 2u);
    }
  }
}

void __47__PLXPCAgent_logEventForwardTGIExecuteRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKeyedSubscript:@"timestampEnd"];
  id v3 = [v2[2] objectForKeyedSubscript:@"errorType"];
  [*v2 setObject:v3 forKeyedSubscript:@"errorType"];

  id v4 = [v2[2] objectForKeyedSubscript:@"extendTokenInferenceLatency"];
  [*v2 setObject:v4 forKeyedSubscript:@"extendTokenInferenceLatency"];

  id v5 = [v2[2] objectForKeyedSubscript:@"firstTokenInferenceLatency"];
  [*v2 setObject:v5 forKeyedSubscript:@"firstTokenInferenceLatency"];

  int v6 = [v2[2] objectForKeyedSubscript:@"inputTokensCount"];
  [*v2 setObject:v6 forKeyedSubscript:@"inputTokensCount"];

  id v7 = [v2[2] objectForKeyedSubscript:@"outputTokensCount"];
  [*v2 setObject:v7 forKeyedSubscript:@"outputTokensCount"];

  uint64_t v8 = [v2[2] objectForKeyedSubscript:@"qos"];
  [*v2 setObject:v8 forKeyedSubscript:@"qos"];

  uint64_t v9 = [v2[2] objectForKeyedSubscript:@"sd_draftModelInferenceCallCount"];
  [*v2 setObject:v9 forKeyedSubscript:@"sd_draftModelInferenceCallCount"];

  id v10 = [v2[2] objectForKeyedSubscript:@"sd_targetModelInferenceCallCount"];
  [*v2 setObject:v10 forKeyedSubscript:@"sd_targetModelInferenceCallCount"];

  int v11 = [v2[2] objectForKeyedSubscript:@"sd_draftOutputTokensCount"];
  [*v2 setObject:v11 forKeyedSubscript:@"sd_draftOutputTokensCount"];

  double v12 = [v2[2] objectForKeyedSubscript:@"sd_totalOutputTokensCount"];
  [*v2 setObject:v12 forKeyedSubscript:@"sd_totalOutputTokensCount"];

  uint64_t v13 = [v2[2] objectForKeyedSubscript:@"sd_draftModelTotalLatency"];
  [*v2 setObject:v13 forKeyedSubscript:@"sd_draftModelTotalLatency"];

  id v14 = [v2[2] objectForKeyedSubscript:@"sd_targetModelTotalLatency"];
  [*v2 setObject:v14 forKeyedSubscript:@"sd_targetModelTotalLatency"];

  id v15 = [v2[2] objectForKeyedSubscript:@"sd_draftTokenAcceptanceRate"];

  if (v15)
  {
    int v16 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v17 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"sd_draftTokenAcceptanceRate"];
    [v17 doubleValue];
    int v19 = [v16 numberWithInt:(int)(v18 * 100.0)];
    [*(id *)(a1 + 32) setObject:v19 forKeyedSubscript:@"sd_draftTokenAcceptanceRate"];
  }
  uint64_t v20 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"sd_speculationSuccessRate"];

  if (v20)
  {
    uint64_t v21 = (void *)MEMORY[0x1E4F28ED0];
    BOOL v22 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"sd_speculationSuccessRate"];
    [v22 doubleValue];
    uint64_t v24 = [v21 numberWithInt:(int)(v23 * 100.0)];
    [*(id *)(a1 + 32) setObject:v24 forKeyedSubscript:@"sd_speculationSuccessRate"];
  }
  id v25 = PLLogXPC();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    __47__PLXPCAgent_logEventForwardTGIExecuteRequest___block_invoke_cold_1();
  }
}

- (void)logEventForwardSmartReplySession:(id)a3
{
  v39[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F92A38] hasGenerativeModelSystems])
  {
    id v5 = [v4 mutableCopy];
    int v6 = (void *)MEMORY[0x1E4F1C9C8];
    id v7 = [v4 objectForKeyedSubscript:@"EventTime"];
    [v7 doubleValue];
    uint64_t v8 = objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");

    uint64_t v9 = [v8 convertFromSystemToMonotonic];

    [v5 removeObjectForKey:@"EventTime"];
    id v10 = [v4 objectForKeyedSubscript:@"EventType"];
    int v11 = [v10 intValue];

    double v12 = PLLogXPC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[PLXPCAgent logEventForwardSmartReplySession:]();
    }

    if (v11)
    {
      double v31 = v9;
      double v33 = self;
      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"timestampEnd" withValue:&unk_1F400D798 withComparisonOperation:6];
      id v14 = objc_alloc(MEMORY[0x1E4F92A90]);
      id v15 = [v4 objectForKeyedSubscript:@"App"];
      uint64_t v16 = [v14 initWithKey:@"App" withValue:v15 withComparisonOperation:0];

      id v17 = objc_alloc(MEMORY[0x1E4F92A90]);
      double v18 = [v4 objectForKeyedSubscript:@"QueryType"];
      uint64_t v19 = [v17 initWithKey:@"QueryType" withValue:v18 withComparisonOperation:0];

      id v20 = objc_alloc(MEMORY[0x1E4F92A90]);
      uint64_t v21 = [v4 objectForKeyedSubscript:@"InputTokenCount"];
      BOOL v22 = (void *)[v20 initWithKey:@"InputTokenCount" withValue:v21 withComparisonOperation:0];

      double v23 = (void *)[objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"OutputTokenCount" withValue:&unk_1F400D798 withComparisonOperation:6];
      uint64_t v24 = [MEMORY[0x1E4F92AD0] sharedCore];
      id v25 = [v24 storage];
      v39[0] = v13;
      v39[1] = v16;
      double v32 = (void *)v16;
      uint64_t v30 = (void *)v19;
      void v39[2] = v19;
      void v39[3] = v22;
      v39[4] = v23;
      double v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:5];
      id v27 = [v25 lastEntryForKey:@"GenerativeFunctionMetrics_SmartReplySession_1_2" withComparisons:v26 isSingleton:1];

      id v28 = PLLogXPC();
      BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG);
      if (v27)
      {
        uint64_t v9 = v31;
        if (v29) {
          -[PLXPCAgent logEventForwardSmartReplySession:]();
        }

        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        void v35[2] = __47__PLXPCAgent_logEventForwardSmartReplySession___block_invoke;
        v35[3] = &unk_1E6E481B0;
        id v36 = v27;
        id v37 = v31;
        id v38 = v4;
        [(PLOperator *)v33 updateEntry:v36 withBlock:v35];
      }
      else
      {
        uint64_t v9 = v31;
        if (v29) {
          -[PLXPCAgent logEventForwardSmartReplySession:]();
        }

        [v5 setObject:v31 forKeyedSubscript:@"timestampEnd"];
        [(PLOperator *)v33 logForSubsystem:@"GenerativeFunctionMetrics" category:@"SmartReplySession" data:v5 date:v31];
      }
    }
    else
    {
      [v5 removeObjectForKey:@"OutputTokenCount"];
      [(PLOperator *)self logForSubsystem:@"GenerativeFunctionMetrics" category:@"SmartReplySession" data:v5 date:v9];
    }
  }
  else
  {
    id v5 = PLLogXPC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4220000, v5, OS_LOG_TYPE_DEFAULT, "Device does not support GenerativeFunctionMetrics smartReplySession logging", buf, 2u);
    }
  }
}

void __47__PLXPCAgent_logEventForwardSmartReplySession___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKeyedSubscript:@"timestampEnd"];
  uint64_t v2 = [v1[2] objectForKeyedSubscript:@"OutputTokenCount"];
  [*v1 setObject:v2 forKeyedSubscript:@"OutputTokenCount"];

  id v3 = [v1[2] objectForKeyedSubscript:@"EventType"];
  [*v1 setObject:v3 forKeyedSubscript:@"EventType"];

  id v4 = PLLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __47__PLXPCAgent_logEventForwardSmartReplySession___block_invoke_cold_1();
  }
}

- (int)convertPixelCount:(int)a3
{
  id v4 = PLLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[PLXPCAgent convertPixelCount:]();
  }

  if ((a3 - 100000) < 0x186A1) {
    return 1;
  }
  if ((a3 - 200001) < 0x493E0) {
    return 2;
  }
  if ((a3 - 500001) < 0x927C0) {
    return 3;
  }
  if (a3 > 1100000) {
    return 4;
  }
  int v6 = PLLogXPC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[PLXPCAgent convertPixelCount:]();
  }

  return 5;
}

- (void)logEventForwardAppleDiffusion:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F92A38] hasGenerativeModelSystems])
  {
    id v5 = (void *)[v4 mutableCopy];
    int v6 = [v4 objectForKeyedSubscript:@"endDate"];
    id v7 = [v6 convertFromSystemToMonotonic];

    [v5 setObject:v7 forKeyedSubscript:@"timestampEnd"];
    uint64_t v8 = [v4 objectForKeyedSubscript:@"startDate"];
    uint64_t v9 = [v8 convertFromSystemToMonotonic];

    [v5 removeObjectForKey:@"startDate"];
    id v10 = [v5 objectForKeyedSubscript:@"inputPixels"];

    if (v10)
    {
      int v11 = (void *)MEMORY[0x1E4F28ED0];
      double v12 = [v4 objectForKeyedSubscript:@"inputPixels"];
      uint64_t v13 = objc_msgSend(v11, "numberWithInt:", -[PLXPCAgent convertPixelCount:](self, "convertPixelCount:", objc_msgSend(v12, "intValue")));
      [v5 setObject:v13 forKeyedSubscript:@"inputPixels"];
    }
    id v14 = [v5 objectForKeyedSubscript:@"outputPixels"];

    if (v14)
    {
      id v15 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v16 = [v4 objectForKeyedSubscript:@"outputPixels"];
      id v17 = objc_msgSend(v15, "numberWithInt:", -[PLXPCAgent convertPixelCount:](self, "convertPixelCount:", objc_msgSend(v16, "intValue")));
      [v5 setObject:v17 forKeyedSubscript:@"outputPixels"];
    }
    double v18 = PLLogXPC();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[PLXPCAgent logEventForwardAppleDiffusion:]();
    }

    [(PLOperator *)self logForSubsystem:@"GenerativeFunctionMetrics" category:@"appleDiffusion" data:v5 date:v9];
  }
}

- (void)logEventForwardHandwritingInference:(id)a3
{
  id v29 = a3;
  id v4 = (void *)[v29 mutableCopy];
  id v5 = (void *)MEMORY[0x1E4F1C9C8];
  int v6 = [v29 objectForKeyedSubscript:@"startTimestamp"];
  [v6 doubleValue];
  id v7 = objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");

  uint64_t v8 = [v7 convertFromSystemToMonotonic];

  [v4 removeObjectForKey:@"startTimestamp"];
  uint64_t v9 = (void *)MEMORY[0x1E4F1C9C8];
  id v10 = [v29 objectForKeyedSubscript:@"endTimestamp"];
  [v10 doubleValue];
  int v11 = objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");

  double v12 = [v11 convertFromSystemToMonotonic];

  [v4 setObject:v12 forKeyedSubscript:@"timestampEnd"];
  uint64_t v13 = [v29 objectForKeyedSubscript:@"inputStringLength"];

  if (v13)
  {
    id v14 = (void *)MEMORY[0x1E4F28ED0];
    id v15 = [v29 objectForKeyedSubscript:@"inputStringLength"];
    uint64_t v16 = objc_msgSend(v14, "numberWithInt:", +[PLUtilities roundToSigFig:withSigFig:](PLUtilities, "roundToSigFig:withSigFig:", objc_msgSend(v15, "intValue"), 1));
    [v4 setObject:v16 forKeyedSubscript:@"inputStringLength"];
  }
  id v17 = [v29 objectForKeyedSubscript:@"inputStrokeCount"];

  if (v17)
  {
    double v18 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v19 = [v29 objectForKeyedSubscript:@"inputStrokeCount"];
    id v20 = objc_msgSend(v18, "numberWithInt:", +[PLUtilities roundToSigFig:withSigFig:](PLUtilities, "roundToSigFig:withSigFig:", objc_msgSend(v19, "intValue"), 1));
    [v4 setObject:v20 forKeyedSubscript:@"inputStrokeCount"];
  }
  uint64_t v21 = [v29 objectForKeyedSubscript:@"outputStringLength"];

  if (v21)
  {
    BOOL v22 = (void *)MEMORY[0x1E4F28ED0];
    double v23 = [v29 objectForKeyedSubscript:@"outputStringLength"];
    uint64_t v24 = objc_msgSend(v22, "numberWithInt:", +[PLUtilities roundToSigFig:withSigFig:](PLUtilities, "roundToSigFig:withSigFig:", objc_msgSend(v23, "intValue"), 1));
    [v4 setObject:v24 forKeyedSubscript:@"outputStringLength"];
  }
  id v25 = [v29 objectForKeyedSubscript:@"outputStrokeCount"];

  if (v25)
  {
    double v26 = (void *)MEMORY[0x1E4F28ED0];
    id v27 = [v29 objectForKeyedSubscript:@"outputStrokeCount"];
    id v28 = objc_msgSend(v26, "numberWithInt:", +[PLUtilities roundToSigFig:withSigFig:](PLUtilities, "roundToSigFig:withSigFig:", objc_msgSend(v27, "intValue"), 1));
    [v4 setObject:v28 forKeyedSubscript:@"outputStrokeCount"];
  }
  [(PLOperator *)self logForSubsystem:@"GenerativeFunctionMetrics" category:@"HandwritingInference" data:v4 date:v8];
}

- (void)logEventPointANE:(id)a3 withCategory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![MEMORY[0x1E4F92A38] hasANE]) {
    goto LABEL_22;
  }
  uint64_t v8 = PLLogXPC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[PLXPCAgent logEventPointANE:withCategory:].cold.6();
  }

  if ([MEMORY[0x1E4F92A38] internalBuild])
  {
    uint64_t v9 = PLLogXPC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[PLXPCAgent logEventPointANE:withCategory:]();
    }

    [(PLOperator *)self logForSubsystem:@"ANE" category:v7 data:v6];
    goto LABEL_22;
  }
  id v10 = (void *)[v6 mutableCopy];
  int v11 = PLLogXPC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[PLXPCAgent logEventPointANE:withCategory:].cold.5();
  }

  double v12 = [v6 objectForKey:@"privacy_score"];

  if (v12)
  {
    uint64_t v13 = [v6 objectForKeyedSubscript:@"privacy_score"];
    uint64_t v14 = [v13 BOOLValue];

    id v15 = PLLogXPC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[PLXPCAgent logEventPointANE:withCategory:].cold.4(v14, v15, v16, v17, v18, v19, v20, v21);
    }

    if (v14) {
      goto LABEL_19;
    }
  }
  else
  {
    BOOL v22 = PLLogXPC();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[PLXPCAgent logEventPointANE:withCategory:]();
    }
  }
  [v10 setObject:&stru_1F3FCA098 forKeyedSubscript:@"modelURL"];
LABEL_19:
  double v23 = PLLogXPC();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    -[PLXPCAgent logEventPointANE:withCategory:]();
  }

  [(PLOperator *)self logForSubsystem:@"ANE" category:v7 data:v10];
LABEL_22:
}

- (void)logEventForwardWatchPresence:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v10 = +[PLOperator entryKeyForType:v4 andName:@"WatchPresence"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v10 withRawData:v5];
  id v7 = [v5 objectForKeyedSubscript:@"Event"];

  int64_t v8 = [(PLXPCAgent *)self eventNameStringToEnum:v7];
  uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:v8];
  [v6 setObject:v9 forKeyedSubscript:@"Event"];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardUIKitKeyboard:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"UIKitKeyboard"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardUIKitEclipse:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"UIKitEclipse"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardWirelessSync:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v9 = +[PLOperator entryKeyForType:v4 andName:@"WirelessSync"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v9 withRawData:v5];
  id v7 = [v5 objectForKey:@"DurationSeconds"];

  if (v7) {
    uint64_t v8 = MEMORY[0x1E4F1CC28];
  }
  else {
    uint64_t v8 = MEMORY[0x1E4F1CC38];
  }
  [v6 setObject:v8 forKeyedSubscript:@"SyncStart"];
  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardMXDiscoveryLevel:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v16 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"MXDiscoveryLevel"];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v16];
  id v5 = [v3 objectForKeyedSubscript:@"Client"];
  [v4 setObject:v5 forKeyedSubscript:@"Client"];

  id v6 = [v3 objectForKeyedSubscript:@"ObjectHash"];
  [v4 setObject:v6 forKeyedSubscript:@"ObjectHash"];

  id v7 = [v3 objectForKeyedSubscript:@"Level"];
  [v4 setObject:v7 forKeyedSubscript:@"Level"];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [v3 objectForKeyedSubscript:@"OnBehalfOf"];
  uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        double v23 = @"OnBehalfOf";
        uint64_t v24 = v12;
        uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
        uint64_t v14 = [v3 objectForKeyedSubscript:@"OnBehalfOf"];
        id v15 = [v14 objectForKeyedSubscript:v12];
        [v4 setObject:v15 forKeyedSubscript:v13];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v9);
  }

  [(PLOperator *)self logEntry:v4];
}

- (void)logEventForwardCarPlay:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"CarPlay"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardCarPlayScreens:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v12 = +[PLOperator entryKeyForType:v4 andName:@"CarPlayScreens"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v12 withRawData:v5];
  id v7 = [v5 objectForKeyedSubscript:@"Width"];
  unsigned int v8 = [v7 unsignedIntValue];

  uint64_t v9 = [v5 objectForKeyedSubscript:@"Height"];

  LODWORD(v5) = [v9 unsignedIntValue];
  int64_t v10 = [(PLXPCAgent *)self mapPixelsToBucket:v5 * (unint64_t)v8];
  int v11 = [MEMORY[0x1E4F28ED0] numberWithInteger:v10];
  [v6 setObject:v11 forKeyedSubscript:@"Size"];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardSecondaryDisplay:(id)a3
{
  id v6 = a3;
  if (([MEMORY[0x1E4F92A38] isiPad] & 1) != 0
    || [MEMORY[0x1E4F92A38] isMac])
  {
    uint64_t v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"SecondaryDisplay"];
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4 withRawData:v6];
    [(PLOperator *)self logEntry:v5];
  }
}

- (void)logEventForwardUIKitActivity:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"UIKitActivity"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardUIKitAlert:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"UIKitAlert"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardSafariFetcherStatus:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"SafariFetcher"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardAppleBackklightBrightness:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 objectForKeyedSubscript:@"linearBrightness"];

    if (v6)
    {
      id v7 = [v5 objectForKeyedSubscript:@"linearBrightness"];
      [v7 doubleValue];
      double v9 = v8;

      int v10 = (int)(v9 * 100.0);
      int v11 = PLLogXPC();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLXPCAgent logEventForwardAppleBackklightBrightness:]();
      }

      if (self->_lastLinearBrightness == v10)
      {
        id v12 = PLLogXPC();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          -[PLXPCAgent logEventForwardAppleBackklightBrightness:]();
        }
      }
      else
      {
        self->_lastLinearBrightness = v10;
        id v12 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"AppleBacklightBrightness"];
        uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v12 withRawData:v5];
        uint64_t v14 = [MEMORY[0x1E4F28ED0] numberWithInt:self->_lastLinearBrightness];
        [v13 setObject:v14 forKeyedSubscript:@"linearBrightness"];

        [(PLOperator *)self logEntry:v13];
      }
    }
  }
}

- (void)logEventForwardAccessory:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"Accessory"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardAppAccessory:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"AppAccessory"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (unint64_t)convertAirDropSessionState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Start"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"Stop"])
  {
    unint64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"Failed"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"InterfaceChanged"])
  {
    unint64_t v4 = 3;
  }
  else
  {
    id v5 = PLLogXPC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[PLXPCAgent convertAirDropSessionState:]();
    }

    unint64_t v4 = 4;
  }

  return v4;
}

- (void)logEventForwardAirDropSession:(id)a3
{
  id v23 = a3;
  unint64_t v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"AirDropSession"];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4];
  id v6 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = [v23 objectForKeyedSubscript:@"Subevent"];
  double v8 = objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "isEqualToString:", @"Send") ^ 1);
  [v5 setObject:v8 forKeyedSubscript:@"Subevent"];

  double v9 = [v23 objectForKeyedSubscript:@"State"];
  unint64_t v10 = [(PLXPCAgent *)self convertAirDropSessionState:v9];

  int v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v10];
  [v5 setObject:v11 forKeyedSubscript:@"State"];

  id v12 = [v23 objectForKeyedSubscript:@"ContentSize"];

  if (v12)
  {
    uint64_t v13 = [v23 objectForKeyedSubscript:@"ContentSize"];
    [v13 doubleValue];
    double v15 = v14;

    LODWORD(v16) = llround(v15 * 0.000000953674316);
    uint64_t v17 = [MEMORY[0x1E4F28ED0] numberWithInt:v16];
    [v5 setObject:v17 forKeyedSubscript:@"FileSize"];
  }
  uint64_t v18 = NSString;
  long long v19 = [v23 objectForKeyedSubscript:@"TransferID"];
  long long v20 = [v18 stringWithFormat:@"%@", v19];
  long long v21 = +[PLUtilities hashString:v20];
  [v5 setObject:v21 forKeyedSubscript:@"Identifier"];

  long long v22 = [v23 objectForKeyedSubscript:@"Interface"];
  [v5 setObject:v22 forKeyedSubscript:@"Interface"];

  [(PLOperator *)self logEntry:v5];
}

- (void)logEventForwardAirDrop:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v8 = +[PLOperator entryKeyForType:v4 andName:@"AirDrop"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v8 withRawData:v5];
  id v7 = [v5 objectForKeyedSubscript:@"id"];

  [v6 setObject:v7 forKeyedSubscript:@"bundleId"];
  [(PLOperator *)self logEntry:v6];
  [(PLXPCAgent *)self createAirDropAccountingEvent:v6];
}

- (void)logEventForwardSiri:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"Siri"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardInCallService:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v13 = +[PLOperator entryKeyForType:v4 andName:@"InCallService"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v13 withRawData:v5];
  id v7 = [v5 objectForKeyedSubscript:@"providerContext"];

  id v8 = [v7 objectForKeyedSubscript:@"kCallSubType"];

  if (v8) {
    [v6 setObject:v8 forKeyedSubscript:@"kCallSubType"];
  }
  if (([MEMORY[0x1E4F929C0] fullMode] & 1) == 0)
  {
    double v9 = (void *)MEMORY[0x1E4F1C9C8];
    unint64_t v10 = [v6 entryDate];
    [v10 timeIntervalSince1970];
    id v12 = [v9 dateWithTimeIntervalSince1970:round(v11)];
    [v6 setEntryDate:v12];
  }
  [(PLOperator *)self logEntry:v6];
  [(PLXPCAgent *)self createInCallServiceAccountingEvent:v6];
}

- (void)logEventForwardCallScreeningEnabled:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"CallScreeningEnabled"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardWebApp:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"WebApp"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardThermalLevel:(id)a3
{
  id v17 = a3;
  uint64_t v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"ThermalLevel"];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4 withRawData:v17];
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  id v7 = [v17 objectForKeyedSubscript:@"Time"];

  if (v7)
  {
    id v8 = (void *)MEMORY[0x1E4F1C9C8];
    double v9 = [v17 objectForKeyedSubscript:@"Time"];
    [v9 doubleValue];
    unint64_t v10 = objc_msgSend(v8, "dateWithTimeIntervalSince1970:");

    uint64_t v11 = [v10 earlierDate:v6];

    id v6 = (void *)v11;
  }
  id v12 = [v6 convertFromSystemToMonotonic];
  id v13 = [v5 entryDate];
  [v12 timeIntervalSinceDate:v13];
  unint64_t v15 = llround(v14);

  uint64_t v16 = [MEMORY[0x1E4F28ED0] numberWithLong:v15];
  [v5 setObject:v16 forKeyedSubscript:@"startOffset"];

  [(PLOperator *)self logEntry:v5];
}

- (void)logEventForwardThermalSensors:(id)a3
{
  id v13 = a3;
  uint64_t v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"ThermalSensors"];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4 withRawData:v13];
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  id v7 = [v13 objectForKeyedSubscript:@"Time"];

  if (v7)
  {
    id v8 = (void *)MEMORY[0x1E4F1C9C8];
    double v9 = [v13 objectForKeyedSubscript:@"Time"];
    [v9 doubleValue];
    unint64_t v10 = objc_msgSend(v8, "dateWithTimeIntervalSince1970:");

    uint64_t v11 = [v10 earlierDate:v6];

    id v6 = (void *)v11;
  }
  id v12 = [v6 convertFromSystemToMonotonic];
  [v5 setEntryDate:v12];

  [(PLOperator *)self logEntry:v5];
}

- (void)logEventForwardThermalHiP:(id)a3
{
  id v16 = a3;
  uint64_t v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"ThermalHiP"];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4 withRawData:v16];
  id v6 = [v16 objectForKeyedSubscript:@"Time"];
  if (v6) {
    [v16 objectForKeyedSubscript:@"Time"];
  }
  else {
  id v7 = [MEMORY[0x1E4F1C9C8] date];
  }

  id v8 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)(int)objc_msgSend(v7, "intValue"));
  double v9 = [MEMORY[0x1E4F1C9C8] date];
  unint64_t v10 = [v8 earlierDate:v9];
  uint64_t v11 = [v10 convertFromSystemToMonotonic];

  id v12 = [v5 entryDate];
  [v11 timeIntervalSinceDate:v12];
  unint64_t v14 = llround(v13);

  unint64_t v15 = [MEMORY[0x1E4F28ED0] numberWithLong:v14];
  [v5 setObject:v15 forKeyedSubscript:@"timeOffset"];

  [(PLOperator *)self logEntry:v5];
}

- (void)logEventForwardNetworkRelay:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v11 = +[PLOperator entryKeyForType:v4 andName:@"NetworkRelay"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v11 withRawData:v5];

  id v7 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  if (([MEMORY[0x1E4F929C0] fullMode] & 1) == 0)
  {
    id v8 = (void *)MEMORY[0x1E4F1C9C8];
    [v7 timeIntervalSince1970];
    uint64_t v10 = [v8 dateWithTimeIntervalSince1970:round(v9 / 60.0) * 60.0];

    id v7 = (void *)v10;
  }
  [v6 setEntryDate:v7];
  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardNetworkRelayWiFiAssertion:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"WiFiAssertionClients"];
  id v6 = [v5 allObjects];
  id v12 = [v6 componentsJoinedByString:@","];

  id v7 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"NetworkRelayWiFiAssertion"];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7];
  double v9 = [v4 objectForKeyedSubscript:@"WiFiWoWState"];
  [v8 setObject:v9 forKeyedSubscript:@"WiFiWoWState"];

  uint64_t v10 = [v4 objectForKeyedSubscript:@"WiFiClientType"];
  [v8 setObject:v10 forKeyedSubscript:@"WiFiClientType"];

  id v11 = [v4 objectForKeyedSubscript:@"WiFiAssertionReason"];

  [v8 setObject:v11 forKeyedSubscript:@"WiFiAssertionReason"];
  [v8 setObject:v12 forKeyedSubscript:@"WiFiAssertionClients"];
  [(PLOperator *)self logEntry:v8];
}

- (void)logEventForwardAudioRouting:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"AudioRouting"];
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5];
    id v7 = [v4 valueForKey:@"timestamp"];

    if (v7)
    {
      id v8 = (void *)MEMORY[0x1E4F1C9C8];
      double v9 = [v4 objectForKeyedSubscript:@"timestamp"];
      [v9 doubleValue];
      uint64_t v10 = objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");

      id v11 = [v10 convertFromSystemToMonotonic];
      [v6 setEntryDate:v11];
    }
    id v12 = [v4 valueForKey:@"kEventType"];
    int v13 = [v12 isEqualToString:@"ScanStart"];

    if (v13)
    {
      unint64_t v14 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v15 = 1;
    }
    else
    {
      id v17 = [v4 valueForKey:@"kEventType"];
      int v18 = [v17 isEqualToString:@"ScanStop"];

      unint64_t v14 = (void *)MEMORY[0x1E4F28ED0];
      if (v18) {
        uint64_t v15 = 2;
      }
      else {
        uint64_t v15 = 3;
      }
    }
    long long v19 = [v14 numberWithInt:v15];
    [v6 setObject:v19 forKeyedSubscript:@"EventType"];
    long long v20 = [v4 valueForKey:@"kScanType"];
    [v6 setObject:v20 forKeyedSubscript:@"ScanType"];

    [(PLOperator *)self logEntry:v6];
  }
  else
  {
    id v16 = PLLogXPC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[PLXPCAgent logEventForwardAudioRouting:]();
    }
  }
}

- (void)logEventForwardAccessoryMotion:(id)a3
{
  id v15 = a3;
  id v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"AccessoryMotion"];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4 withRawData:v15];
  uint64_t v6 = [v15 objectForKeyedSubscript:@"client"];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = [v15 objectForKeyedSubscript:@"client"];
    int v9 = [v8 isEqualToString:@"/usr/sbin/mediaserverd"];

    if (v9) {
      [v5 setObject:@"mediaserverd" forKeyedSubscript:@"client"];
    }
  }
  [(PLOperator *)self logEntry:v5];
  uint64_t v10 = [v15 objectForKeyedSubscript:@"tracking"];
  int v11 = [v10 BOOLValue];

  id v12 = [MEMORY[0x1E4F92900] sharedInstance];
  int v13 = [v5 objectForKeyedSubscript:@"client"];
  unint64_t v14 = [v5 entryDate];
  if (v11) {
    [v12 createDistributionEventForwardWithDistributionID:46 withAddingChildNodeName:v13 withStartDate:v14];
  }
  else {
    [v12 createDistributionEventForwardWithDistributionID:46 withRemovingChildNodeName:v13 withStartDate:v14];
  }
}

- (void)logEventFowardUARPStatus:(id)a3
{
  id v4 = a3;
  if ([(PLXPCAgent *)self accessoryUARPEntryCount] < 501)
  {
    uint64_t v6 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"UARPStatus"];
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v6 withRawData:v4];
    [(PLOperator *)self logEntry:v7];
    [(PLXPCAgent *)self setAccessoryUARPEntryCount:[(PLXPCAgent *)self accessoryUARPEntryCount] + 1];
  }
  else
  {
    id v5 = PLLogXPC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[PLXPCAgent logEventFowardUARPStatus:]();
    }
  }
}

- (void)logEventForwardDosimetry:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"noiseEnabled"];

  if (v5)
  {
    p_lastDosimetryEntry = &self->_lastDosimetryEntry;
    lastDosimetryEntry = self->_lastDosimetryEntry;
    if (!lastDosimetryEntry) {
      goto LABEL_4;
    }
    id v8 = [(PLEntry *)lastDosimetryEntry objectForKeyedSubscript:@"noiseEnabled"];
    int v9 = [v8 BOOLValue];
    uint64_t v10 = [v4 objectForKeyedSubscript:@"noiseEnabled"];
    int v11 = [v10 BOOLValue];

    if (v9 != v11)
    {
LABEL_4:
      id v12 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"Dosimetry"];
      int v13 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v12 withRawData:v4];
      [(PLOperator *)self logEntry:v13];
      [(PLXPCAgent *)self setLastDosimetryEntry:v13];
      unint64_t v14 = PLLogXPC();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[PLXPCAgent logEventForwardDosimetry:]((id *)p_lastDosimetryEntry);
      }
    }
    id v15 = PLLogXPC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[PLXPCAgent logEventForwardDosimetry:](v4);
    }
  }
}

- (void)logEventForwardSpatialAudio:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v8 = +[PLOperator entryKeyForType:v4 andName:@"SpatialAudio"];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v8 withRawData:v5];
  id v7 = [v5 objectForKeyedSubscript:@"stereoUpmix"];

  [v6 setObject:v7 forKeyedSubscript:@"up-mixing"];
  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardPasskeyAuthentication:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"PasskeyAuthentication"];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardEnhancedDiscovery:(id)a3
{
  id v4 = a3;
  id v6 = [(id)objc_opt_class() entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"EnhancedDiscovery"];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v6 withRawData:v4];

  [(PLOperator *)self logEntry:v5];
}

- (void)logEventForwardSleepMode:(id)a3
{
  id v4 = a3;
  if (+[PLUtilities isHealthDataSubmissionAllowed])
  {
    id v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"SleepMode"];
    id v6 = objc_alloc(MEMORY[0x1E4F929D0]);
    id v7 = [v4 objectForKeyedSubscript:@"SleepTime"];
    id v8 = (void *)[v6 initWithEntryKey:v5 withRawData:v7];

    [(PLOperator *)self logEntry:v8];
    int out_token = 0;
    notify_register_check((const char *)[@"PLSleepModeNotification" UTF8String], &out_token);
    LODWORD(v7) = out_token;
    int v9 = [v8 objectForKeyedSubscript:@"state"];
    notify_set_state((int)v7, [v9 integerValue]);

    notify_post((const char *)[@"PLSleepModeNotification" UTF8String]);
    notify_cancel(out_token);
  }
  else
  {
    id v5 = PLLogXPC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[PLXPCAgent logEventForwardSleepMode:]();
    }
  }
}

- (void)logEventForwardRapidSecurityResponse:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"RapidSecurityResponse"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardRelevanceContextUpdate:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[v4 mutableCopy];
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = [v4 objectForKeyedSubscript:@"timestampOfEvent"];

  [v7 doubleValue];
  id v8 = objc_msgSend(v6, "dateWithTimeIntervalSince1970:");

  int v9 = [v8 convertFromSystemToMonotonic];

  [v5 removeObjectForKey:@"timestampOfEvent"];
  uint64_t v10 = PLLogXPC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[PLXPCAgent logEventForwardRelevanceContextUpdate:]();
  }

  [(PLOperator *)self logForSubsystem:@"Widget" category:@"RelevanceContextUpdate" data:v5 date:v9];
}

- (void)logEventForwardLinkAdvisory:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[v4 mutableCopy];
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = [v4 objectForKeyedSubscript:@"timestamp"];

  [v7 doubleValue];
  id v8 = objc_msgSend(v6, "dateWithTimeIntervalSince1970:");

  int v9 = [v8 convertFromSystemToMonotonic];

  uint64_t v10 = PLLogXPC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[PLXPCAgent logEventForwardLinkAdvisory:]();
  }

  [(PLOperator *)self logForSubsystem:@"NetworkRelay" category:@"LinkAdvisory" data:v5 date:v9];
}

- (void)logEventForwardIHA
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[PLUtilities isHealthDataSubmissionAllowed];
  id v4 = PLLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_1E4220000, v4, OS_LOG_TYPE_DEFAULT, "IHA Toggle State: %d", (uint8_t *)v7, 8u);
  }

  id v5 = objc_opt_new();
  id v6 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
  [v5 setObject:v6 forKeyedSubscript:@"Enabled"];

  [(PLOperator *)self logForSubsystem:@"XPCMetrics" category:@"IHAConsent" data:v5];
}

- (void)logEventBackwardCallScreeningDuration:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D28];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"CallScreeningDuration"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventBackwardNameSpotlightQos:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([MEMORY[0x1E4F92A38] isMac])
  {
    uint64_t v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"SpotlightQos"];
    id v5 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = [v3 allKeys];
    uint64_t v20 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v20)
    {
      uint64_t v18 = *(void *)v28;
      id v19 = v3;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = v6;
          uint64_t v7 = *(void *)(*((void *)&v27 + 1) + 8 * v6);
          uint64_t v8 = [v3 objectForKeyedSubscript:v7];
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          int v9 = [v8 allKeys];
          uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v24;
            do
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v24 != v12) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * i);
                id v15 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4 withDate:v5];
                [v15 setObject:v7 forKeyedSubscript:@"utiType"];
                [v15 setObject:v14 forKeyedSubscript:@"qos"];
                id v16 = [v8 objectForKeyedSubscript:v14];
                [v15 setObject:v16 forKeyedSubscript:@"count"];

                [(PLOperator *)self logEntry:v15];
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
            }
            while (v11);
          }

          uint64_t v6 = v21 + 1;
          id v3 = v19;
        }
        while (v21 + 1 != v20);
        uint64_t v20 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v20);
    }
  }
}

- (void)logEventPointNameSpotlightWatchdogFired:(id)a3
{
  id v6 = a3;
  if ([MEMORY[0x1E4F92A38] isMac])
  {
    uint64_t v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"SpotlightWatchdogFired"];
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4 withRawData:v6];
    [(PLOperator *)self logEntry:v5];
  }
}

- (void)logEventBackwardNamePop:(id)a3
{
  int64_t v4 = [(PLXPCAgent *)self popCount] + 1;
  [(PLXPCAgent *)self setPopCount:v4];
}

- (void)logEventBackwardNamePeek:(id)a3
{
  id v4 = a3;
  id v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"PeekPop"];
  id v6 = [v4 objectForKeyedSubscript:@"Process-ID"];
  uint64_t v7 = [v6 integerValue];

  uint64_t v8 = [(PLXPCAgent *)self peekStartTime];

  if (!v8)
  {
    [(PLXPCAgent *)self setPeekStartTime:0];
    [(PLXPCAgent *)self setPeekpopProcessID:v7];
    [(PLXPCAgent *)self setPeekCount:0];
    [(PLXPCAgent *)self setPopCount:0];
    [(PLXPCAgent *)self setPeekDuration:0.0];
  }
  if ([(PLXPCAgent *)self peekpopProcessID]
    && v7 != [(PLXPCAgent *)self peekpopProcessID])
  {
    int v9 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5];
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[PLXPCAgent peekpopProcessID](self, "peekpopProcessID"));
    [v9 setObject:v10 forKeyedSubscript:@"Process-ID"];

    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[PLXPCAgent peekCount](self, "peekCount"));
    [v9 setObject:v11 forKeyedSubscript:@"PeekCount"];

    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[PLXPCAgent popCount](self, "popCount"));
    [v9 setObject:v12 forKeyedSubscript:@"PopCount"];

    int v13 = (void *)MEMORY[0x1E4F28ED0];
    [(PLXPCAgent *)self peekDuration];
    uint64_t v14 = objc_msgSend(v13, "numberWithDouble:");
    [v9 setObject:v14 forKeyedSubscript:@"PeekDuration"];

    [(PLOperator *)self logEntry:v9];
    [(PLXPCAgent *)self setPeekCount:0];
    [(PLXPCAgent *)self setPopCount:0];
    [(PLXPCAgent *)self setPeekDuration:0.0];
    [(PLXPCAgent *)self setPeekStartTime:0];
  }
  [(PLXPCAgent *)self setPeekpopProcessID:v7];
  id v15 = [v4 objectForKeyedSubscript:@"Status"];
  uint64_t v16 = [v15 integerValue];

  if (v16 == 1)
  {
    [(PLXPCAgent *)self setPeekCount:[(PLXPCAgent *)self peekCount] + 1];
    id v17 = [v4 objectForKeyedSubscript:@"Timestamp"];
    [(PLXPCAgent *)self setPeekStartTime:v17];

    uint64_t v18 = PLLogXPC();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[PLXPCAgent logEventBackwardNamePeek:](self);
    }
LABEL_13:

    goto LABEL_14;
  }
  id v19 = [(PLXPCAgent *)self peekStartTime];

  if (v19)
  {
    uint64_t v18 = [v4 objectForKeyedSubscript:@"Timestamp"];
    uint64_t v20 = [(PLXPCAgent *)self peekStartTime];
    [v18 timeIntervalSinceDate:v20];
    double v22 = v21;
    [(PLXPCAgent *)self peekDuration];
    [(PLXPCAgent *)self setPeekDuration:v22 + v23];

    long long v24 = PLLogXPC();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[PLXPCAgent logEventBackwardNamePeek:](self);
    }

    goto LABEL_13;
  }
LABEL_14:
}

- (void)logEventBackwardAttentionSampling:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D28];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"AASSampling"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventBackwardAttentionPolling:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D28];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"AASPolling"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventBackwardAttentionService:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D28];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"AASService"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventBackwardODOff:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D28];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"ODOff"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventBackwardODOn:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D28];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"ODOn"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventBackwardODHN:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D28];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"ODHN"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventBackwardFrameCount:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4
    && ([v4 objectForKeyedSubscript:@"data"],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    id v7 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"FrameCount"];
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    int v9 = [v5 objectForKeyedSubscript:@"data"];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __41__PLXPCAgent_logEventBackwardFrameCount___block_invoke;
    void v13[3] = &unk_1E6E49E60;
    uint64_t v10 = v7;
    uint64_t v14 = v10;
    id v11 = v8;
    id v15 = v11;
    [v9 enumerateObjectsUsingBlock:v13];

    if ([v11 count])
    {
      uint64_t v16 = v10;
      v17[0] = v11;
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
      [(PLOperator *)self logEntries:v12 withGroupID:v10];
    }
  }
  else
  {
    uint64_t v10 = PLLogXPC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[PLXPCAgent logEventBackwardFrameCount:]();
    }
  }
}

void __41__PLXPCAgent_logEventBackwardFrameCount___block_invoke(uint64_t a1, void *a2)
{
  id v22 = a2;
  if ([v22 count] == 6)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:*(void *)(a1 + 32)];
    id v4 = (void *)MEMORY[0x1E4F28ED0];
    id v5 = [v22 objectAtIndexedSubscript:0];
    id v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "integerValue"));
    [v3 setObject:v6 forKeyedSubscript:@"reason"];

    id v7 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v8 = [v22 objectAtIndexedSubscript:1];
    int v9 = objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "integerValue"));
    [v3 setObject:v9 forKeyedSubscript:@"bucket_0"];

    uint64_t v10 = (void *)MEMORY[0x1E4F28ED0];
    id v11 = [v22 objectAtIndexedSubscript:2];
    uint64_t v12 = objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v11, "integerValue"));
    [v3 setObject:v12 forKeyedSubscript:@"bucket_1"];

    int v13 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v14 = [v22 objectAtIndexedSubscript:3];
    id v15 = objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "integerValue"));
    [v3 setObject:v15 forKeyedSubscript:@"bucket_2"];

    uint64_t v16 = (void *)MEMORY[0x1E4F28ED0];
    id v17 = [v22 objectAtIndexedSubscript:4];
    uint64_t v18 = objc_msgSend(v16, "numberWithInteger:", objc_msgSend(v17, "integerValue"));
    [v3 setObject:v18 forKeyedSubscript:@"bucket_3"];

    id v19 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v20 = [v22 objectAtIndexedSubscript:5];
    double v21 = objc_msgSend(v19, "numberWithInteger:", objc_msgSend(v20, "integerValue"));
    [v3 setObject:v21 forKeyedSubscript:@"duration"];

    [*(id *)(a1 + 40) addObject:v3];
  }
}

- (void)logEventBackwardRenderPassCount:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[v4 mutableCopy];
  id v6 = [v4 objectForKeyedSubscript:@"data"];

  if ((unint64_t)[v6 count] >= 0xA)
  {
    id v7 = [v6 objectAtIndexedSubscript:0];
    [v5 setObject:v7 forKeyedSubscript:@"bucket0"];

    uint64_t v8 = [v6 objectAtIndexedSubscript:1];
    [v5 setObject:v8 forKeyedSubscript:@"bucket1"];

    int v9 = [v6 objectAtIndexedSubscript:2];
    [v5 setObject:v9 forKeyedSubscript:@"bucket2"];

    uint64_t v10 = [v6 objectAtIndexedSubscript:3];
    [v5 setObject:v10 forKeyedSubscript:@"bucket3"];

    id v11 = [v6 objectAtIndexedSubscript:4];
    [v5 setObject:v11 forKeyedSubscript:@"bucket4"];

    uint64_t v12 = [v6 objectAtIndexedSubscript:5];
    [v5 setObject:v12 forKeyedSubscript:@"bucket5"];

    int v13 = [v6 objectAtIndexedSubscript:6];
    [v5 setObject:v13 forKeyedSubscript:@"bucket6"];

    uint64_t v14 = [v6 objectAtIndexedSubscript:7];
    [v5 setObject:v14 forKeyedSubscript:@"bucket7"];

    id v15 = [v6 objectAtIndexedSubscript:8];
    [v5 setObject:v15 forKeyedSubscript:@"bucket8"];

    uint64_t v16 = [v6 objectAtIndexedSubscript:9];
    [v5 setObject:v16 forKeyedSubscript:@"bucket9"];
  }
  id v17 = PLLogXPC();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[PLXPCAgent logEventBackwardRenderPassCount:]();
  }

  [(PLOperator *)self logForSubsystem:@"RenderData" category:@"RenderPassCount" data:v5];
}

- (void)logEventBackwardLayerCount:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[v4 mutableCopy];
  id v6 = [v4 objectForKeyedSubscript:@"data"];

  if ((unint64_t)[v6 count] >= 0xA)
  {
    id v7 = [v6 objectAtIndexedSubscript:0];
    [v5 setObject:v7 forKeyedSubscript:@"bucket0"];

    uint64_t v8 = [v6 objectAtIndexedSubscript:1];
    [v5 setObject:v8 forKeyedSubscript:@"bucket1"];

    int v9 = [v6 objectAtIndexedSubscript:2];
    [v5 setObject:v9 forKeyedSubscript:@"bucket2"];

    uint64_t v10 = [v6 objectAtIndexedSubscript:3];
    [v5 setObject:v10 forKeyedSubscript:@"bucket3"];

    id v11 = [v6 objectAtIndexedSubscript:4];
    [v5 setObject:v11 forKeyedSubscript:@"bucket4"];

    uint64_t v12 = [v6 objectAtIndexedSubscript:5];
    [v5 setObject:v12 forKeyedSubscript:@"bucket5"];

    int v13 = [v6 objectAtIndexedSubscript:6];
    [v5 setObject:v13 forKeyedSubscript:@"bucket6"];

    uint64_t v14 = [v6 objectAtIndexedSubscript:7];
    [v5 setObject:v14 forKeyedSubscript:@"bucket7"];

    id v15 = [v6 objectAtIndexedSubscript:8];
    [v5 setObject:v15 forKeyedSubscript:@"bucket8"];

    uint64_t v16 = [v6 objectAtIndexedSubscript:9];
    [v5 setObject:v16 forKeyedSubscript:@"bucket9"];
  }
  id v17 = PLLogXPC();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[PLXPCAgent logEventBackwardLayerCount:]();
  }

  [(PLOperator *)self logForSubsystem:@"RenderData" category:@"LayerCount" data:v5];
}

- (void)logEventBackwardEnergyTelemetry:(id)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v58 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"EnergyTelemetry"];
    id v5 = [MEMORY[0x1E4F1CA48] array];
    id v6 = [v4 objectForKeyedSubscript:@"NumRows"];
    int v7 = [v6 unsignedIntValue];

    uint64_t v8 = [v4 objectForKeyedSubscript:@"Keys"];
    uint64_t v9 = [v8 indexOfObject:@"telemetry_date"];

    unint64_t v59 = v9;
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v11 = PLLogXPC();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[PLXPCAgent logEventBackwardEnergyTelemetry:]();
      }
      goto LABEL_31;
    }
    if (!v7)
    {
LABEL_20:
      if (![v5 count])
      {
LABEL_32:

        goto LABEL_33;
      }
      id v36 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      [v36 timeIntervalSince1970];
      double v38 = v37;
      int v39 = [v5 lastObject];
      long long v40 = [v39 entryDate];
      [v40 timeIntervalSince1970];
      double v42 = v41;

      double v43 = (v38 - v42) / 60.0;
      int v44 = PLLogCommon();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v45 = [v5 lastObject];
        long long v46 = [v45 entryDate];
        *(_DWORD *)buf = 138412802;
        *(void *)v75 = v36;
        *(_WORD *)&v75[8] = 2112;
        *(void *)&v75[10] = v46;
        __int16 v76 = 2048;
        double v77 = v43;
        _os_log_impl(&dword_1E4220000, v44, OS_LOG_TYPE_DEFAULT, "[Energy Telemetry] receivedTime = %@, endTime = %@, delayInMinutes = %f", buf, 0x20u);
      }
      uint64_t v66 = MEMORY[0x1E4F143A8];
      uint64_t v67 = 3221225472;
      v68 = __46__PLXPCAgent_logEventBackwardEnergyTelemetry___block_invoke;
      v69 = &__block_descriptor_40_e19___NSDictionary_8__0l;
      double v70 = v43;
      AnalyticsSendEventLazy();
      v72 = v58;
      v73 = v5;
      v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
      [(PLOperator *)self logEntries:v47 withGroupID:v58];

      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      v61 = v5;
      id v48 = v5;
      uint64_t v49 = [v48 countByEnumeratingWithState:&v62 objects:v71 count:16];
      if (v49)
      {
        uint64_t v50 = v49;
        uint64_t v51 = *(void *)v63;
        do
        {
          for (uint64_t i = 0; i != v50; ++i)
          {
            if (*(void *)v63 != v51) {
              objc_enumerationMutation(v48);
            }
            v53 = *(void **)(*((void *)&v62 + 1) + 8 * i);
            int v54 = [v53 dictionary];
            v55 = [v53 entryDate];
            [(PLOperator *)self logForSubsystem:@"EnergyMetrics" category:@"EnergyAccounting" data:v54 date:v55];
          }
          uint64_t v50 = [v48 countByEnumeratingWithState:&v62 objects:v71 count:16];
        }
        while (v50);
      }

      id v11 = v36;
      id v5 = v61;
LABEL_31:

      goto LABEL_32;
    }
    uint64_t v12 = 0;
    unint64_t v13 = 0x1E4F28000uLL;
    *(void *)&long long v10 = 138412546;
    long long v56 = v10;
    v60 = v4;
    int v57 = v7;
    while (1)
    {
      uint64_t v14 = objc_msgSend(*(id *)(v13 + 3792), "numberWithUnsignedInt:", v12, v56);
      uint64_t v15 = [v4 objectForKeyedSubscript:v14];
      if (v15)
      {
        uint64_t v16 = (void *)v15;
        id v17 = [*(id *)(v13 + 3792) numberWithUnsignedInt:v12];
        [v4 objectForKeyedSubscript:v17];
        v19 = unint64_t v18 = v13;
        unint64_t v20 = [v19 count];

        unint64_t v13 = v18;
        if (v20 > v59)
        {
          double v21 = [*(id *)(v18 + 3792) numberWithUnsignedInt:v12];
          id v22 = [v60 objectForKeyedSubscript:v21];
          double v23 = [v22 objectAtIndexedSubscript:v59];

          long long v24 = (void *)MEMORY[0x1E4F1C9E8];
          long long v25 = [*(id *)(v18 + 3792) numberWithUnsignedInt:v12];
          long long v26 = [v60 objectForKeyedSubscript:v25];
          [v60 objectForKeyedSubscript:@"Keys"];
          long long v28 = v27 = v5;
          long long v29 = [v24 dictionaryWithObjects:v26 forKeys:v28];

          id v5 = v27;
          long long v30 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v58 withRawData:v29];
          double v31 = [v23 convertFromSystemToMonotonic];
          [v30 setEntryDate:v31];

          [v27 addObject:v30];
          double v32 = PLLogCommon();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v33 = [v30 entryDate];
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v75 = v12;
            *(_WORD *)&v75[4] = 2112;
            *(void *)&v75[6] = v33;
            _os_log_impl(&dword_1E4220000, v32, OS_LOG_TYPE_DEFAULT, "[Energy Telemetry] sample %d entryDate = %@", buf, 0x12u);
          }
          int v7 = v57;
          unint64_t v13 = v18;
          goto LABEL_16;
        }
      }
      else
      {
      }
      double v23 = PLLogXPC();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        long long v34 = [*(id *)(v13 + 3792) numberWithUnsignedInt:v12];
        id v4 = v60;
        id v35 = [v60 objectForKeyedSubscript:v34];
        *(_DWORD *)buf = v56;
        *(void *)v75 = v35;
        *(_WORD *)&v75[8] = 1024;
        *(_DWORD *)&v75[10] = v12;
        _os_log_error_impl(&dword_1E4220000, v23, OS_LOG_TYPE_ERROR, "[Energy Telemetry] Invalid sample %@ at index %d", buf, 0x12u);

        goto LABEL_17;
      }
LABEL_16:
      id v4 = v60;
LABEL_17:

      uint64_t v12 = (v12 + 1);
      if (v7 == v12) {
        goto LABEL_20;
      }
    }
  }
  id v58 = PLLogXPC();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
    -[PLXPCAgent logEventBackwardEnergyTelemetry:]();
  }
LABEL_33:
}

id __46__PLXPCAgent_logEventBackwardEnergyTelemetry___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"delay";
  v1 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(a1 + 32)];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)logEventBackwardDRMaxRate:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D28];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"DRMaxRate"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventBackwardUbiquityAccountStatistics:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D28];
  id v5 = a3;
  id v27 = +[PLOperator entryKeyForType:v4 andName:@"UbiquityAccountStatistics"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v27 withRawData:v5];

  if (([MEMORY[0x1E4F92A38] internalBuild] & 1) == 0)
  {
    id v7 = [v6 objectForKeyedSubscript:@"totalNumberOfDirectories"];
    int v8 = [v7 intValue];

    if (v8 >= 101)
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F28ED0];
      long long v10 = [v6 objectForKeyedSubscript:@"totalNumberOfDirectories"];
      id v11 = objc_msgSend(v9, "numberWithInt:", +[PLUtilities roundToSigFig:withSigFig:](PLUtilities, "roundToSigFig:withSigFig:", objc_msgSend(v10, "intValue"), 2));
      [v6 setObject:v11 forKeyedSubscript:@"totalNumberOfDirectories"];
    }
    uint64_t v12 = [v6 objectForKeyedSubscript:@"totalNumberOfDocuments"];
    int v13 = [v12 intValue];

    if (v13 >= 101)
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v15 = [v6 objectForKeyedSubscript:@"totalNumberOfDocuments"];
      uint64_t v16 = objc_msgSend(v14, "numberWithInt:", +[PLUtilities roundToSigFig:withSigFig:](PLUtilities, "roundToSigFig:withSigFig:", objc_msgSend(v15, "intValue"), 2));
      [v6 setObject:v16 forKeyedSubscript:@"totalNumberOfDocuments"];
    }
    id v17 = [v6 objectForKeyedSubscript:@"totalNumberOfItems"];
    int v18 = [v17 intValue];

    if (v18 >= 101)
    {
      id v19 = (void *)MEMORY[0x1E4F28ED0];
      unint64_t v20 = [v6 objectForKeyedSubscript:@"totalNumberOfItems"];
      double v21 = objc_msgSend(v19, "numberWithInt:", +[PLUtilities roundToSigFig:withSigFig:](PLUtilities, "roundToSigFig:withSigFig:", objc_msgSend(v20, "intValue"), 2));
      [v6 setObject:v21 forKeyedSubscript:@"totalNumberOfItems"];
    }
    id v22 = [v6 objectForKeyedSubscript:@"totalNumberOfFaults"];
    int v23 = [v22 intValue];

    if (v23 >= 101)
    {
      long long v24 = (void *)MEMORY[0x1E4F28ED0];
      long long v25 = [v6 objectForKeyedSubscript:@"totalNumberOfFaults"];
      long long v26 = objc_msgSend(v24, "numberWithInt:", +[PLUtilities roundToSigFig:withSigFig:](PLUtilities, "roundToSigFig:withSigFig:", objc_msgSend(v25, "intValue"), 2));
      [v6 setObject:v26 forKeyedSubscript:@"totalNumberOfFaults"];
    }
  }
  [(PLOperator *)self logEntry:v6];
}

- (void)logEventPointNetworkSymptomsAdviosry:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v21 = v4;
    id v5 = [v4 objectForKeyedSubscript:@"Network Type"];
    id v4 = v21;
    if (v5)
    {
      id v6 = [v21 objectForKeyedSubscript:@"advisoryKey"];

      id v4 = v21;
      if (v6)
      {
        id v7 = [(PLXPCAgent *)self localCache];
        int v8 = [v7 objectForKeyedSubscript:@"Symptoms-NetworkAdvisory"];

        if (!v8)
        {
          uint64_t v9 = objc_opt_new();
          long long v10 = [(PLXPCAgent *)self localCache];
          [v10 setObject:v9 forKeyedSubscript:@"Symptoms-NetworkAdvisory"];
        }
        id v11 = [v21 objectForKeyedSubscript:@"Network Type"];
        uint64_t v12 = [v21 objectForKeyedSubscript:@"advisoryKey"];
        int v13 = [(PLXPCAgent *)self localCache];
        uint64_t v14 = [v13 objectForKeyedSubscript:@"Symptoms-NetworkAdvisory"];
        uint64_t v15 = [v14 objectForKeyedSubscript:v11];

        if (!v15 || (int v16 = [v15 intValue], v16 != objc_msgSend(v12, "intValue")))
        {
          id v17 = [(PLXPCAgent *)self localCache];
          int v18 = [v17 objectForKeyedSubscript:@"Symptoms-NetworkAdvisory"];
          [v18 setObject:v12 forKeyedSubscript:v11];

          id v19 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"Symptoms-NetworkAdvisory"];
          unint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v19];
          [v20 setObject:v11 forKeyedSubscript:@"Network Type"];
          [v20 setObject:v12 forKeyedSubscript:@"advisoryKey"];
          [(PLOperator *)self logEntry:v20];
        }
        id v4 = v21;
      }
    }
  }
}

- (void)logEventPointCacheDelete:(id)a3
{
  id v19 = self;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"CacheDelete"];
  unint64_t v20 = v3;
  id v5 = [v3 objectForKey:@"events"];
  id v22 = +[PLUtilities deviceBootTime];
  id v6 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v23 + 1) + 8 * v10);
        uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4 withRawData:v11];
        int v13 = [v11 objectForKeyedSubscript:@"startFromUptime"];

        if (v13)
        {
          uint64_t v14 = [v11 objectForKeyedSubscript:@"startFromUptime"];
          [v14 doubleValue];
          double v16 = v15;

          id v17 = [v22 dateByAddingTimeInterval:v16];
          [v12 setEntryDate:v17];
        }
        objc_msgSend(v6, "addObject:", v12, v19);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v8);
  }

  id v27 = v4;
  long long v28 = v6;
  int v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  [(PLOperator *)v19 logEntries:v18 withGroupID:v4];
}

- (void)logEventPointMachineTranslation:(id)a3
{
  id v6 = a3;
  id v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"MachineTranslation"];
  if (v4)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4 withRawData:v6];
    [(PLOperator *)self logEntry:v5];
  }
}

- (void)logEventEventPointRCSSessionManagement:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[v4 mutableCopy];
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  uint64_t v7 = [v4 objectForKeyedSubscript:@"Timestamp"];
  [v7 doubleValue];
  uint64_t v8 = objc_msgSend(v6, "dateWithTimeIntervalSince1970:");

  uint64_t v9 = [v8 convertFromSystemToMonotonic];

  [v5 removeObjectForKey:@"Timestamp"];
  uint64_t v10 = PLLogXPC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[PLXPCAgent logEventEventPointRCSSessionManagement:]();
  }

  [(PLOperator *)self logForSubsystem:@"Message" category:@"RCSSessionManagement" data:v5 date:v9];
  uint64_t v11 = [v4 objectForKeyedSubscript:@"TransactionType"];
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    int v13 = [v4 objectForKeyedSubscript:@"TransactionType"];
    int v14 = [v13 intValue];

    if (v14 == 4)
    {
      double v15 = PLLogXPC();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[PLXPCAgent logEventEventPointRCSSessionManagement:]();
      }

      [(PLOperator *)self logForSubsystem:@"Message" category:@"SIPRegisterKeepAlive" data:v5 date:v9];
    }
  }
}

- (void)logEventIntervalAirTrafficAssetDownload:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v48 = self;
  uint64_t v49 = [(id)objc_opt_class() entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"AirTraffic_AssetDownload"];
  if (v49)
  {
    int v47 = [MEMORY[0x1E4F929C0] fullMode];
    id v44 = v4;
    [v4 objectForKeyedSubscript:@"messages"];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v50 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
    if (v50)
    {
      uint64_t v46 = *(void *)v54;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v54 != v46) {
            objc_enumerationMutation(obj);
          }
          id v6 = *(void **)(*((void *)&v53 + 1) + 8 * v5);
          uint64_t v7 = [v6 objectForKeyedSubscript:@"timestamp"];
          uint64_t v8 = v7;
          uint64_t v52 = v5;
          if (v47)
          {
            uint64_t v9 = [v6 objectForKeyedSubscript:@"timestampEnd"];
          }
          else
          {
            [v7 timeIntervalSince1970];
            uint64_t v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:round(v10 / 10.0) * 10.0];

            uint64_t v12 = [v6 objectForKeyedSubscript:@"timestampEnd"];
            [v12 timeIntervalSince1970];
            uint64_t v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:round(v13 / 10.0) * 10.0];

            [v9 timeIntervalSinceDate:v11];
            if (v14 >= 10.0)
            {
              uint64_t v8 = v11;
            }
            else
            {
              uint64_t v15 = [v11 dateByAddingTimeInterval:10.0];

              uint64_t v8 = v11;
              uint64_t v9 = (void *)v15;
            }
          }
          uint64_t v51 = v9;
          id v16 = objc_alloc(MEMORY[0x1E4F929D0]);
          id v17 = [v8 convertFromSystemToMonotonic];
          int v18 = (void *)[v16 initWithEntryKey:v49 withDate:v17];

          id v19 = [v9 convertFromSystemToMonotonic];
          [v18 setObject:v19 forKeyedSubscript:@"timestampEnd"];

          unint64_t v20 = [v6 objectForKeyedSubscript:@"linkType"];
          [v18 setObject:v20 forKeyedSubscript:@"linkType"];

          id v21 = [v6 objectForKeyedSubscript:@"dataclass"];
          [v18 setObject:v21 forKeyedSubscript:@"dataclass"];

          id v22 = [v6 objectForKeyedSubscript:@"assetType"];
          [v18 setObject:v22 forKeyedSubscript:@"assetType"];

          uint64_t v23 = [v6 objectForKeyedSubscript:@"sumBytesRequested"];
          long long v24 = (void *)v23;
          if (v23) {
            long long v25 = (void *)v23;
          }
          else {
            long long v25 = &unk_1F400D798;
          }
          [v18 setObject:v25 forKeyedSubscript:@"sumBytesRequested"];
          uint64_t v26 = [v6 objectForKeyedSubscript:@"countDownloadsBegun"];
          id v27 = (void *)v26;
          if (v26) {
            long long v28 = (void *)v26;
          }
          else {
            long long v28 = &unk_1F400D798;
          }
          [v18 setObject:v28 forKeyedSubscript:@"countDownloadsBegun"];
          uint64_t v29 = [v6 objectForKeyedSubscript:@"countCanUseCellular"];
          uint64_t v30 = (void *)v29;
          if (v29) {
            double v31 = (void *)v29;
          }
          else {
            double v31 = &unk_1F400D798;
          }
          [v18 setObject:v31 forKeyedSubscript:@"countCanUseCellular"];
          uint64_t v32 = [v6 objectForKeyedSubscript:@"countIsForeground"];
          uint64_t v33 = (void *)v32;
          if (v32) {
            long long v34 = (void *)v32;
          }
          else {
            long long v34 = &unk_1F400D798;
          }
          [v18 setObject:v34 forKeyedSubscript:@"countIsForeground"];
          uint64_t v35 = [v6 objectForKeyedSubscript:@"sumBytesDownloaded"];
          id v36 = (void *)v35;
          if (v35) {
            double v37 = (void *)v35;
          }
          else {
            double v37 = &unk_1F400D798;
          }
          [v18 setObject:v37 forKeyedSubscript:@"sumBytesDownloaded"];
          uint64_t v38 = [v6 objectForKeyedSubscript:@"countDownloadsSucceeded"];
          int v39 = (void *)v38;
          if (v38) {
            long long v40 = (void *)v38;
          }
          else {
            long long v40 = &unk_1F400D798;
          }
          [v18 setObject:v40 forKeyedSubscript:@"countDownloadsSucceeded"];
          uint64_t v41 = [v6 objectForKeyedSubscript:@"countDownloadsFailed"];
          double v42 = (void *)v41;
          if (v41) {
            double v43 = (void *)v41;
          }
          else {
            double v43 = &unk_1F400D798;
          }
          [v18 setObject:v43 forKeyedSubscript:@"countDownloadsFailed"];
          [(PLOperator *)v48 logEntry:v18];

          ++v5;
        }
        while (v50 != v52 + 1);
        uint64_t v50 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
      }
      while (v50);
    }

    id v4 = v44;
  }
}

- (void)logEventIntervalCoreDuetKnowledgeSync:(id)a3
{
  id v4 = a3;
  if (([MEMORY[0x1E4F929C0] fullMode] & 1) != 0
    || [MEMORY[0x1E4F929C0] taskMode])
  {
    uint64_t v5 = [(id)objc_opt_class() entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"CoreDuet_KnowledgeSync"];
    if (!v5)
    {
LABEL_16:

      goto LABEL_17;
    }
    id v6 = [v4 objectForKeyedSubscript:@"timestamp"];
    uint64_t v7 = [v4 objectForKeyedSubscript:@"timestampEnd"];
    uint64_t v8 = [v4 objectForKeyedSubscript:@"isEmpty"];
    uint64_t v9 = [v4 objectForKeyedSubscript:@"transportType"];
    double v10 = v9;
    if (v6 && v7 && v8 && v9)
    {
      if ([v9 integerValue])
      {
LABEL_15:

        goto LABEL_16;
      }
      [v6 timeIntervalSince1970];
      double v12 = v11;
      [v7 timeIntervalSince1970];
      if (v13 >= v12)
      {
        double v15 = v13;
        id v16 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:round(v12)];

        id v17 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:round(v15)];

        id v18 = objc_alloc(MEMORY[0x1E4F929D0]);
        id v19 = [v16 convertFromSystemToMonotonic];
        unint64_t v20 = (void *)[v18 initWithEntryKey:v5 withDate:v19];

        id v21 = [v17 convertFromSystemToMonotonic];
        [v20 setObject:v21 forKeyedSubscript:@"timestampEnd"];

        [v20 setObject:v8 forKeyedSubscript:@"isEmpty"];
        [(PLOperator *)self logEntry:v20];

        uint64_t v7 = v17;
        id v6 = v16;
        goto LABEL_15;
      }
      double v14 = PLLogXPC();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[PLXPCAgent logEventIntervalCoreDuetKnowledgeSync:]();
      }
    }
    else
    {
      double v14 = PLLogXPC();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[PLXPCAgent logEventIntervalCoreDuetKnowledgeSync:]();
      }
    }

    goto LABEL_15;
  }
LABEL_17:
}

- (void)logEventIntervalAnimatedStickerCreation:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D38];
  id v5 = a3;
  id v16 = +[PLOperator entryKeyForType:v4 andName:@"AnimatedStickerCreation"];
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"StartTimestamp"];
  [v7 doubleValue];
  uint64_t v8 = objc_msgSend(v6, "dateWithTimeIntervalSince1970:");

  uint64_t v9 = [v8 convertFromSystemToMonotonic];

  double v10 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v16 withDate:v9];
  double v11 = [v5 objectForKeyedSubscript:@"ProcessedFrameCount"];
  [v10 setObject:v11 forKeyedSubscript:@"ProcessedFrameCount"];

  double v12 = (void *)MEMORY[0x1E4F1C9C8];
  double v13 = [v5 objectForKeyedSubscript:@"EndTimestamp"];

  [v13 doubleValue];
  double v14 = objc_msgSend(v12, "dateWithTimeIntervalSince1970:");

  double v15 = [v14 convertFromSystemToMonotonic];

  [v10 setObject:v15 forKeyedSubscript:@"timestampEnd"];
  [(PLOperator *)self logEntry:v10];
}

- (void)logEventIntervalAnimatedStickerScoring:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D38];
  id v5 = a3;
  id v15 = +[PLOperator entryKeyForType:v4 andName:@"AnimatedStickerScoring"];
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"StartTimestamp"];
  [v7 doubleValue];
  uint64_t v8 = objc_msgSend(v6, "dateWithTimeIntervalSince1970:");

  uint64_t v9 = [v8 convertFromSystemToMonotonic];

  double v10 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v15 withDate:v9];
  double v11 = (void *)MEMORY[0x1E4F1C9C8];
  double v12 = [v5 objectForKeyedSubscript:@"EndTimestamp"];

  [v12 doubleValue];
  double v13 = objc_msgSend(v11, "dateWithTimeIntervalSince1970:");

  double v14 = [v13 convertFromSystemToMonotonic];

  [v10 setObject:v14 forKeyedSubscript:@"timestampEnd"];
  [(PLOperator *)self logEntry:v10];
}

- (void)logEventIntervalMomentsDeferredProcessing:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D38];
  id v5 = a3;
  id v18 = +[PLOperator entryKeyForType:v4 andName:@"MomentsDeferredProcessing"];
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"StartTimestamp"];
  [v7 doubleValue];
  uint64_t v8 = objc_msgSend(v6, "dateWithTimeIntervalSince1970:");

  uint64_t v9 = [v8 convertFromSystemToMonotonic];

  double v10 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v18 withDate:v9];
  double v11 = [v5 objectForKeyedSubscript:@"ProcessedAssetCount"];
  [v10 setObject:v11 forKeyedSubscript:@"ProcessedAssetCount"];

  double v12 = [v5 objectForKeyedSubscript:@"ProcessingType"];
  [v10 setObject:v12 forKeyedSubscript:@"ProcessingType"];

  double v13 = [v5 objectForKeyedSubscript:@"RequestedAssetCount"];
  [v10 setObject:v13 forKeyedSubscript:@"RequestedAssetCount"];

  double v14 = (void *)MEMORY[0x1E4F1C9C8];
  id v15 = [v5 objectForKeyedSubscript:@"EndTimestamp"];

  [v15 doubleValue];
  id v16 = objc_msgSend(v14, "dateWithTimeIntervalSince1970:");

  id v17 = [v16 convertFromSystemToMonotonic];

  [v10 setObject:v17 forKeyedSubscript:@"timestampEnd"];
  [(PLOperator *)self logEntry:v10];
}

- (void)logEventIntervalStaticStickerCreation:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D38];
  id v5 = a3;
  id v15 = +[PLOperator entryKeyForType:v4 andName:@"StaticStickerCreation"];
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"StartTimestamp"];
  [v7 doubleValue];
  uint64_t v8 = objc_msgSend(v6, "dateWithTimeIntervalSince1970:");

  uint64_t v9 = [v8 convertFromSystemToMonotonic];

  double v10 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v15 withDate:v9];
  double v11 = (void *)MEMORY[0x1E4F1C9C8];
  double v12 = [v5 objectForKeyedSubscript:@"EndTimestamp"];

  [v12 doubleValue];
  double v13 = objc_msgSend(v11, "dateWithTimeIntervalSince1970:");

  double v14 = [v13 convertFromSystemToMonotonic];

  [v10 setObject:v14 forKeyedSubscript:@"timestampEnd"];
  [(PLOperator *)self logEntry:v10];
}

- (void)logEventIntervalStaticStickerScoring:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D38];
  id v5 = a3;
  id v19 = +[PLOperator entryKeyForType:v4 andName:@"StaticStickerScoring"];
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"StartTimestamp"];
  [v7 doubleValue];
  uint64_t v8 = objc_msgSend(v6, "dateWithTimeIntervalSince1970:");

  uint64_t v9 = [v8 convertFromSystemToMonotonic];

  double v10 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v19 withDate:v9];
  double v11 = [v5 objectForKeyedSubscript:@"IsOnDemand"];
  [v10 setObject:v11 forKeyedSubscript:@"IsOnDemand"];

  double v12 = [v5 objectForKeyedSubscript:@"ProcessedAssetCount"];
  [v10 setObject:v12 forKeyedSubscript:@"ProcessedAssetCount"];

  double v13 = [v5 objectForKeyedSubscript:@"StickerScoringAssetCount"];
  [v10 setObject:v13 forKeyedSubscript:@"StickerScoringAssetCount"];

  double v14 = [v5 objectForKeyedSubscript:@"VisualSearchAssetCount"];
  [v10 setObject:v14 forKeyedSubscript:@"VisualSearchAssetCount"];

  id v15 = (void *)MEMORY[0x1E4F1C9C8];
  id v16 = [v5 objectForKeyedSubscript:@"EndTimestamp"];

  [v16 doubleValue];
  id v17 = objc_msgSend(v15, "dateWithTimeIntervalSince1970:");

  id v18 = [v17 convertFromSystemToMonotonic];

  [v10 setObject:v18 forKeyedSubscript:@"timestampEnd"];
  [(PLOperator *)self logEntry:v10];
}

- (void)logEventIntervalRapportReceivedMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"RapportReceivedMessage"];
  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:@"timeBegin"];
    uint64_t v7 = [v4 objectForKeyedSubscript:@"timeEnd"];
    uint64_t v8 = (void *)v7;
    if (v6 && v7)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F929D0]);
      double v10 = [v6 convertFromSystemToMonotonic];
      double v11 = (void *)[v9 initWithEntryKey:v5 withDate:v10];

      double v12 = [v8 convertFromSystemToMonotonic];
      [v11 setObject:v12 forKeyedSubscript:@"timestampEnd"];

      double v13 = [v4 objectForKeyedSubscript:@"appID"];
      [v11 setObject:v13 forKeyedSubscript:@"appID"];

      double v14 = [v4 objectForKeyedSubscript:@"type"];
      [v11 setObject:v14 forKeyedSubscript:@"type"];

      id v15 = [v4 objectForKeyedSubscript:@"bytes"];
      [v11 setObject:v15 forKeyedSubscript:@"bytes"];

      id v16 = [v4 objectForKeyedSubscript:@"identifier"];
      [v11 setObject:v16 forKeyedSubscript:@"identifier"];

      id v17 = [v4 objectForKeyedSubscript:@"linkType"];
      [v11 setObject:v17 forKeyedSubscript:@"linkType"];

      id v18 = [v4 objectForKeyedSubscript:@"messages"];
      [v11 setObject:v18 forKeyedSubscript:@"messages"];

      id v19 = [v4 objectForKeyedSubscript:@"senderID"];
      [v11 setObject:v19 forKeyedSubscript:@"senderID"];

      [(PLOperator *)self logEntry:v11];
    }
    else
    {
      unint64_t v20 = PLLogXPC();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[PLXPCAgent logEventIntervalRapportReceivedMessage:]();
      }
    }
  }
}

- (void)logEventIntervalNameSpotlightIndexes:(id)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"processName"];
  id v6 = [v4 objectForKeyedSubscript:@"timestamp"];
  id v7 = [v6 convertFromSystemToMonotonic];

  uint64_t v8 = [v4 objectForKeyedSubscript:@"timestampEnd"];
  id v9 = [v8 convertFromSystemToMonotonic];

  double v10 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  double v11 = v10;
  if (v7)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    id v7 = v10;
    if (v9) {
      goto LABEL_3;
    }
  }
  id v9 = v11;
LABEL_3:
  double v12 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"SpotlightIndexes"];
  double v13 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  id v22 = __51__PLXPCAgent_logEventIntervalNameSpotlightIndexes___block_invoke;
  uint64_t v23 = &unk_1E6E49EB0;
  id v14 = v12;
  id v24 = v14;
  id v15 = v7;
  id v25 = v15;
  id v16 = v9;
  id v26 = v16;
  id v17 = v5;
  id v27 = v17;
  id v18 = v13;
  id v28 = v18;
  [v4 enumerateKeysAndObjectsUsingBlock:&v20];
  if (objc_msgSend(v18, "count", v20, v21, v22, v23))
  {
    id v29 = v14;
    v30[0] = v18;
    id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    [(PLOperator *)self logEntries:v19 withGroupID:v14];
  }
}

void __51__PLXPCAgent_logEventIntervalNameSpotlightIndexes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:*(void *)(a1 + 32) withDate:*(void *)(a1 + 40)];
    [v7 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"timestampEnd"];
    [v7 setObject:v5 forKeyedSubscript:@"BundleID"];
    [v7 setObject:*(void *)(a1 + 56) forKeyedSubscript:@"processName"];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51__PLXPCAgent_logEventIntervalNameSpotlightIndexes___block_invoke_2;
    v9[3] = &unk_1E6E49E88;
    id v10 = v7;
    id v8 = v7;
    [v6 enumerateKeysAndObjectsUsingBlock:v9];
    [*(id *)(a1 + 64) addObject:v8];
  }
}

void __51__PLXPCAgent_logEventIntervalNameSpotlightIndexes___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", +[PLUtilities roundToSigFig:withSigFig:](PLUtilities, "roundToSigFig:withSigFig:", objc_msgSend(a3, "intValue"), 2));
  if ([v5 isEqualToString:@"indexItems"])
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = @"IndexCount";
LABEL_15:
    [v7 setObject:v6 forKeyedSubscript:v8];
    goto LABEL_16;
  }
  if ([v5 isEqualToString:@"deleteItems"])
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = @"DeletedCount";
    goto LABEL_15;
  }
  if ([v5 isEqualToString:@"computeEmbeddings"])
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = @"computeEmbeddings";
    goto LABEL_15;
  }
  if ([v5 isEqualToString:@"computeKeyphrases"])
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = @"computeKeyphrases";
    goto LABEL_15;
  }
  if ([v5 isEqualToString:@"reindexItemCount"])
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = @"reindexItemCount";
    goto LABEL_15;
  }
  if ([v5 isEqualToString:@"reason"])
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = @"reason";
    goto LABEL_15;
  }
  if ([v5 isEqualToString:@"reindexAll"])
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = @"reindexAll";
    goto LABEL_15;
  }
  id v9 = PLLogXPC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    __51__PLXPCAgent_logEventIntervalNameSpotlightIndexes___block_invoke_2_cold_1();
  }

LABEL_16:
}

- (void)logEventIntervalNameSpotlightQueries:(id)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"processName"];
  id v6 = [v4 objectForKeyedSubscript:@"timestamp"];
  id v7 = [v6 convertFromSystemToMonotonic];

  id v8 = [v4 objectForKeyedSubscript:@"timestampEnd"];
  id v9 = [v8 convertFromSystemToMonotonic];

  id v10 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  double v11 = v10;
  if (v7)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    id v7 = v10;
    if (v9) {
      goto LABEL_3;
    }
  }
  id v9 = v11;
LABEL_3:
  double v12 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"SpotlightQueries"];
  double v13 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  id v22 = __51__PLXPCAgent_logEventIntervalNameSpotlightQueries___block_invoke;
  uint64_t v23 = &unk_1E6E49EB0;
  id v14 = v12;
  id v24 = v14;
  id v15 = v7;
  id v25 = v15;
  id v16 = v9;
  id v26 = v16;
  id v17 = v5;
  id v27 = v17;
  id v18 = v13;
  id v28 = v18;
  [v4 enumerateKeysAndObjectsUsingBlock:&v20];
  if (objc_msgSend(v18, "count", v20, v21, v22, v23))
  {
    id v29 = v14;
    v30[0] = v18;
    id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    [(PLOperator *)self logEntries:v19 withGroupID:v14];
  }
}

void __51__PLXPCAgent_logEventIntervalNameSpotlightQueries___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:*(void *)(a1 + 32) withDate:*(void *)(a1 + 40)];
    [v7 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"timestampEnd"];
    [v7 setObject:v5 forKeyedSubscript:@"BundleID"];
    [v7 setObject:*(void *)(a1 + 56) forKeyedSubscript:@"processName"];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51__PLXPCAgent_logEventIntervalNameSpotlightQueries___block_invoke_2;
    v9[3] = &unk_1E6E49ED8;
    id v10 = v7;
    id v8 = v7;
    [v6 enumerateKeysAndObjectsUsingBlock:v9];
    [*(id *)(a1 + 64) addObject:v8];
  }
}

void __51__PLXPCAgent_logEventIntervalNameSpotlightQueries___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setObject:a2 forKeyedSubscript:@"Reason"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __51__PLXPCAgent_logEventIntervalNameSpotlightQueries___block_invoke_3;
  v7[3] = &unk_1E6E49E88;
  id v8 = *(id *)(a1 + 32);
  [v6 enumerateKeysAndObjectsUsingBlock:v7];
}

void __51__PLXPCAgent_logEventIntervalNameSpotlightQueries___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", +[PLUtilities roundToSigFig:withSigFig:](PLUtilities, "roundToSigFig:withSigFig:", objc_msgSend(a3, "intValue"), 2));
  if ([v5 isEqualToString:@"startQuery"])
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = @"StartQueryCount";
LABEL_7:
    [v7 setObject:v6 forKeyedSubscript:v8];
    goto LABEL_8;
  }
  if ([v5 isEqualToString:@"cancelQuery"])
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = @"CancelQueryCount";
    goto LABEL_7;
  }
  if ([v5 isEqualToString:@"finishQuery"])
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = @"ResultCount";
    goto LABEL_7;
  }
  id v9 = PLLogXPC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    __51__PLXPCAgent_logEventIntervalNameSpotlightIndexes___block_invoke_2_cold_1();
  }

LABEL_8:
}

- (void)logEventBackwardAVConference:(id)a3
{
  id v14 = a3;
  uint64_t v4 = [v14 objectForKeyedSubscript:@"method"];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [v14 objectForKeyedSubscript:@"method"];
    int v7 = [v6 intValue];

    if (v7 == 70)
    {
      id v8 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"AVConference"];
      id v9 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v8 withRawData:v14];
      id v10 = [v14 objectForKeyedSubscript:@"_clientName"];

      if (v10)
      {
        double v11 = [v14 objectForKeyedSubscript:@"_clientName"];
        [v9 setObject:v11 forKeyedSubscript:@"ClientName"];
      }
      double v12 = [v14 objectForKeyedSubscript:@"_serviceName"];

      if (v12)
      {
        double v13 = [v14 objectForKeyedSubscript:@"_serviceName"];
        [v9 setObject:v13 forKeyedSubscript:@"ServiceName"];
      }
      [(PLOperator *)self logEntry:v9];
    }
  }
}

- (void)logEventIntervalUserSafetyProcessing:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D38];
  id v5 = a3;
  id v18 = +[PLOperator entryKeyForType:v4 andName:@"UserSafetyProcessing"];
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  int v7 = [v5 objectForKeyedSubscript:@"StartTimestamp"];
  [v7 doubleValue];
  id v8 = objc_msgSend(v6, "dateWithTimeIntervalSince1970:");

  id v9 = [v8 convertFromSystemToMonotonic];

  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v18 withDate:v9];
  double v11 = [v5 objectForKeyedSubscript:@"AssetType"];
  [v10 setObject:v11 forKeyedSubscript:@"AssetType"];

  double v12 = [v5 objectForKeyedSubscript:@"ClientBundleID"];
  [v10 setObject:v12 forKeyedSubscript:@"ClientBundleID"];

  double v13 = (void *)MEMORY[0x1E4F1C9C8];
  id v14 = [v5 objectForKeyedSubscript:@"EndTimestamp"];
  [v14 doubleValue];
  id v15 = objc_msgSend(v13, "dateWithTimeIntervalSince1970:");

  id v16 = [v15 convertFromSystemToMonotonic];

  [v10 setObject:v16 forKeyedSubscript:@"EndTimestamp"];
  id v17 = [v5 objectForKeyedSubscript:@"IsCacheReused"];

  [v10 setObject:v17 forKeyedSubscript:@"IsCacheReused"];
  [(PLOperator *)self logEntry:v10];
}

- (void)logEventIntervalGroupActivities:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[v4 mutableCopy];
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  int v7 = [v4 objectForKeyedSubscript:@"timestampStart"];
  [v7 doubleValue];
  id v8 = objc_msgSend(v6, "dateWithTimeIntervalSince1970:");

  id v9 = [v8 convertFromSystemToMonotonic];

  [v5 removeObjectForKey:@"timestampStart"];
  id v10 = (void *)MEMORY[0x1E4F1C9C8];
  double v11 = [v4 objectForKeyedSubscript:@"timestampEnd"];

  [v11 doubleValue];
  double v12 = objc_msgSend(v10, "dateWithTimeIntervalSince1970:");

  double v13 = [v12 convertFromSystemToMonotonic];

  [v5 setObject:v13 forKeyedSubscript:@"timestampEnd"];
  id v14 = PLLogXPC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[PLXPCAgent logEventIntervalGroupActivities:]();
  }

  [(PLOperator *)self logForSubsystem:@"XPCMetrics" category:@"GroupActivities" data:v5 date:v9];
}

- (void)logEventIntervalEndCPUViolations:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[v4 mutableCopy];
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  int v7 = [v4 objectForKeyedSubscript:@"timestampEnd"];

  [v7 doubleValue];
  id v8 = objc_msgSend(v6, "dateWithTimeIntervalSince1970:");

  id v9 = [v8 convertFromSystemToMonotonic];

  [v5 setObject:v9 forKeyedSubscript:@"timestampEnd"];
  id v10 = PLLogXPC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[PLXPCAgent logEventIntervalEndCPUViolations:]();
  }

  [(PLOperator *)self logForSubsystem:@"XPCMetrics" category:@"CPUViolations" data:v5 date:v9];
}

- (void)logEventIntervalVKDataScanner:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[v4 mutableCopy];
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  int v7 = [v4 objectForKeyedSubscript:@"SessionStartTime"];
  [v7 doubleValue];
  id v8 = objc_msgSend(v6, "dateWithTimeIntervalSince1970:");

  id v9 = [v8 convertFromSystemToMonotonic];

  [v5 removeObjectForKey:@"SessionStartTime"];
  id v10 = (void *)MEMORY[0x1E4F1C9C8];
  double v11 = [v4 objectForKeyedSubscript:@"SessionStopTime"];

  [v11 doubleValue];
  double v12 = objc_msgSend(v10, "dateWithTimeIntervalSince1970:");

  double v13 = [v12 convertFromSystemToMonotonic];

  [v5 setObject:v13 forKeyedSubscript:@"SessionStopTime"];
  id v14 = PLLogXPC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[PLXPCAgent logEventIntervalVKDataScanner:]();
  }

  [(PLOperator *)self logForSubsystem:@"XPCMetrics" category:@"VKDataScanner" data:v5 date:v9];
}

- (void)logAlbumAnimation:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[v4 mutableCopy];
  id v6 = [v4 objectForKeyedSubscript:@"AlbumAnimationDuration"];

  if (v6)
  {
    int v7 = [v4 objectForKeyedSubscript:@"AlbumAnimationDuration"];
    [v7 doubleValue];
    double v9 = v8;

    LODWORD(v7) = llround(v9);
    id v10 = [MEMORY[0x1E4F28ED0] numberWithInt:v7];
    [v5 setValue:v10 forKey:@"AlbumAnimationDuration"];

    double v11 = [MEMORY[0x1E4F28ED0] numberWithInt:v7];
    [v5 setObject:v11 forKeyedSubscript:@"AlbumAnimationDuration"];
  }
  double v12 = PLLogXPC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[PLXPCAgent logAlbumAnimation:]();
  }

  [(PLOperator *)self logForSubsystem:@"RenderData" category:@"AlbumAnimationDuration" data:v5];
}

- (void)logAlbumMotion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[v4 mutableCopy];
  id v6 = [v4 objectForKeyedSubscript:@"AlbumMotionDownload"];

  if (v6)
  {
    int v7 = [v4 objectForKeyedSubscript:@"AlbumMotionDownload"];
    [v7 doubleValue];
    double v9 = v8;

    +[PLUtilities roundToSigFigDouble:2 withSigFig:v9];
    id v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:");
    [v5 setValue:v10 forKey:@"AlbumMotionDownload"];
  }
  double v11 = PLLogXPC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[PLXPCAgent logAlbumMotion:]();
  }

  [(PLOperator *)self logForSubsystem:@"RenderData" category:@"AlbumMotionDownload" data:v5];
}

- (void)logMailCategorization:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[v4 mutableCopy];
  id v6 = [v4 objectForKeyedSubscript:@"count"];

  if (v6)
  {
    int v7 = [v4 objectForKeyedSubscript:@"count"];
    uint64_t v8 = [v7 intValue];

    if ((int)v8 > 10)
    {
      int64_t v9 = +[PLUtilities roundToSigFig:v8 withSigFig:1];
      id v10 = [MEMORY[0x1E4F28ED0] numberWithInt:v9];
      [v5 setValue:v10 forKey:@"count"];
    }
    else
    {
      [v5 setObject:&unk_1F400D7B0 forKeyedSubscript:@"count"];
    }
  }
  double v11 = PLLogXPC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[PLXPCAgent logMailCategorization:]();
  }

  [(PLOperator *)self logForSubsystem:@"XPCMetrics" category:@"MailCategorizationEvent" data:v5];
}

- (void)createAccessoryAccountingEventWithName:(id)a3 isStartEvent:(BOOL)a4
{
  BOOL v4 = a4;
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = (__CFString *)a3;
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0)
  {
    id v6 = @"accessory-unknown";
    if (v5 && [(__CFString *)v5 length]) {
      id v6 = v5;
    }
    int v7 = v6;
    uint64_t v8 = v7;
    if (v4)
    {
      double v12 = v7;
      v13[0] = &unk_1F4012078;
      int64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    }
    else
    {
      int64_t v9 = (void *)MEMORY[0x1E4F1CC08];
    }
    id v10 = [MEMORY[0x1E4F92900] sharedInstance];
    double v11 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    [v10 createDistributionEventForwardWithDistributionID:10 withChildNodeNameToWeight:v9 withStartDate:v11];
  }
}

- (void)createAirDropAccountingEvent:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0)
  {
    uint64_t v4 = [v3 objectForKeyedSubscript:@"State"];
    if (v4)
    {
      id v5 = (__CFString *)v4;
      uint64_t v6 = [v3 objectForKeyedSubscript:@"Subevent"];
      if (!v6) {
        goto LABEL_15;
      }
      int v7 = (void *)v6;
      uint64_t v8 = [v3 objectForKeyedSubscript:@"Subevent"];
      if ([v8 isEqualToString:@"BluetoothScanning"])
      {
LABEL_14:

        goto LABEL_15;
      }
      int64_t v9 = [v3 objectForKeyedSubscript:@"Subevent"];
      char v10 = [v9 isEqualToString:@"BonjourAdvertise"];

      if ((v10 & 1) == 0)
      {
        double v11 = [v3 objectForKeyedSubscript:@"bundleId"];
        if (v11)
        {
          id v5 = [v3 objectForKeyedSubscript:@"bundleId"];
        }
        else
        {
          id v5 = @"airdrop-unknown";
        }

        double v12 = [v3 objectForKeyedSubscript:@"State"];
        int v13 = [v12 isEqualToString:@"Start"];

        if (v13)
        {
          uint64_t v21 = v5;
          v22[0] = &unk_1F4012078;
          int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
          uint64_t v20 = v5;
          uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
LABEL_13:
          id v16 = [MEMORY[0x1E4F92900] sharedInstance];
          id v17 = [v3 entryDate];
          [v16 createQualificationEventForwardWithQualificationID:4 withChildNodeNames:v8 withStartDate:v17];

          id v18 = [MEMORY[0x1E4F92900] sharedInstance];
          id v19 = [v3 entryDate];
          [v18 createDistributionEventForwardWithDistributionID:3 withChildNodeNameToWeight:v7 withStartDate:v19];

          goto LABEL_14;
        }
        id v14 = [v3 objectForKeyedSubscript:@"State"];
        int v15 = [v14 isEqualToString:@"Stop"];

        if (v15)
        {
          uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
          int v7 = &unk_1F4011248;
          goto LABEL_13;
        }
LABEL_15:
      }
    }
  }
}

- (void)createInCallServiceAccountingEvent:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0)
  {
    uint64_t v4 = [v3 objectForKeyedSubscript:@"bundleID"];
    if (v4)
    {
      id v5 = [v3 objectForKeyedSubscript:@"bundleID"];
    }
    else
    {
      id v5 = @"incallservice-unknown";
    }

    uint64_t v6 = [v3 objectForKeyedSubscript:@"status"];
    if ([v6 isEqualToString:@"callForegrounded"])
    {
      int v7 = [MEMORY[0x1E4F92900] sharedInstance];
      uint64_t v8 = [v3 entryDate];
      [v7 createDistributionEventForwardWithDistributionID:1 withAddingChildNodeName:v5 withStartDate:v8];

      int64_t v9 = [MEMORY[0x1E4F92900] sharedInstance];
      char v10 = [v3 entryDate];
      [v9 createQualificationEventForwardWithQualificationID:2 withAddingChildNodeName:v5 withStartDate:v10];
    }
    else if ([v6 isEqualToString:@"callBackgrounded"])
    {
      double v11 = [MEMORY[0x1E4F92900] sharedInstance];
      double v12 = [v3 entryDate];
      [v11 createDistributionEventForwardWithDistributionID:1 withRemovingChildNodeName:v5 withStartDate:v12];

      int64_t v9 = [MEMORY[0x1E4F92900] sharedInstance];
      char v10 = [v3 entryDate];
      [v9 createQualificationEventForwardWithQualificationID:2 withRemovingChildNodeName:v5 withStartDate:v10];
    }
    else if ([v6 isEqualToString:@"callStart"])
    {
      int v13 = [MEMORY[0x1E4F92900] sharedInstance];
      id v14 = [v3 entryDate];
      [v13 createDistributionEventForwardWithDistributionID:11 withAddingChildNodeName:v5 withStartDate:v14];

      int v15 = [MEMORY[0x1E4F92900] sharedInstance];
      id v16 = [v3 entryDate];
      [v15 createDistributionEventForwardWithDistributionID:7 withAddingChildNodeName:v5 withStartDate:v16];

      int64_t v9 = [MEMORY[0x1E4F92900] sharedInstance];
      id v22 = v5;
      v23[0] = &unk_1F4012078;
      char v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      id v17 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      [v9 createDistributionEventForwardWithDistributionID:44 withChildNodeNameToWeight:v10 withStartDate:v17];
    }
    else
    {
      if (![v6 isEqualToString:@"callStop"])
      {
LABEL_14:

        goto LABEL_15;
      }
      id v18 = [MEMORY[0x1E4F92900] sharedInstance];
      id v19 = [v3 entryDate];
      [v18 createDistributionEventForwardWithDistributionID:11 withRemovingChildNodeName:v5 withStartDate:v19];

      uint64_t v20 = [MEMORY[0x1E4F92900] sharedInstance];
      uint64_t v21 = [v3 entryDate];
      [v20 createDistributionEventForwardWithDistributionID:7 withRemovingChildNodeName:v5 withStartDate:v21];

      int64_t v9 = [MEMORY[0x1E4F92900] sharedInstance];
      char v10 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      [v9 createDistributionEventForwardWithDistributionID:44 withChildNodeNameToWeight:&unk_1F4011270 withStartDate:v10];
    }

    goto LABEL_14;
  }
LABEL_15:
}

- (int)mapAvailabilityModeSemanticType:(int64_t)a3
{
  if ((unint64_t)(a3 + 2) > 0xB) {
    return 6;
  }
  else {
    return dword_1E4404788[a3 + 2];
  }
}

- (int64_t)modeTypeStringToEnum:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Presence"])
  {
    int64_t v4 = 10;
  }
  else if ([v3 isEqualToString:@"DetailedNonP2P"])
  {
    int64_t v4 = 20;
  }
  else if ([v3 isEqualToString:@"Detailed"])
  {
    int64_t v4 = 30;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (int64_t)mapPixelsToBucket:(unint64_t)a3
{
  int64_t v3 = 1;
  uint64_t v4 = 2;
  uint64_t v5 = 3;
  uint64_t v6 = 4;
  if (a3 > 0x7E9000) {
    uint64_t v6 = 5;
  }
  if (a3 >= 0x1FA401) {
    uint64_t v5 = v6;
  }
  if (a3 > 0xE1000) {
    uint64_t v4 = v5;
  }
  if (a3 >= 0x7E901) {
    int64_t v3 = v4;
  }
  if (a3 >= 0x5DC01) {
    return v3;
  }
  else {
    return 0;
  }
}

- (int64_t)eventNameStringToEnum:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"WatchPresence"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"WatchAbsence"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"WatchDisconnected"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"WatchConnected"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"WatchUnavailable"])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"WatchUnreachable"])
  {
    int64_t v4 = 6;
  }
  else if ([v3 isEqualToString:@"WatchSwitched"])
  {
    int64_t v4 = 7;
  }
  else if ([v3 isEqualToString:@"WatchWristStatusOnWrist"])
  {
    int64_t v4 = 8;
  }
  else if ([v3 isEqualToString:@"WatchWristStatusOffWrist"])
  {
    int64_t v4 = 9;
  }
  else if ([v3 isEqualToString:@"WatchWristStatusDisabled"])
  {
    int64_t v4 = 10;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (void)setInferenceEntriesWithBundleID:(id)a3 inferenceStart:(double)a4 inferenceEnd:(double)a5
{
  id v8 = a3;
  if (v8)
  {
    double lastSBCupdateTimestamp = self->_lastSBCupdateTimestamp;
    if (lastSBCupdateTimestamp >= a5 || lastSBCupdateTimestamp <= a4) {
      double lastSBCupdateTimestamp = a4;
    }
    double v11 = a5 - lastSBCupdateTimestamp;
    if (v11 > 0.0)
    {
      id v20 = v8;
      double v12 = [(NSMutableDictionary *)self->_inferenceEntries objectForKey:v8];

      inferenceEntries = self->_inferenceEntries;
      if (v12)
      {
        id v14 = [(NSMutableDictionary *)self->_inferenceEntries objectForKey:v20];
        [v14 doubleValue];
        double v16 = v15;

        inferenceEntries = self->_inferenceEntries;
        id v17 = (void *)MEMORY[0x1E4F28ED0];
        double v18 = v11 + v16;
      }
      else
      {
        id v17 = (void *)MEMORY[0x1E4F28ED0];
        double v18 = v11;
      }
      id v19 = [v17 numberWithDouble:v18];
      [(NSMutableDictionary *)inferenceEntries setObject:v19 forKey:v20];
    }
  }
  MEMORY[0x1F41817F8]();
}

- (void)distributeBundleIDEntriesToWeight:(id)a3 toDistributionID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  uint64_t v6 = objc_opt_new();
  uint64_t v16 = 0;
  id v17 = (double *)&v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __65__PLXPCAgent_distributeBundleIDEntriesToWeight_toDistributionID___block_invoke;
  void v15[3] = &unk_1E6E49F00;
  void v15[4] = &v16;
  [v5 enumerateKeysAndObjectsUsingBlock:v15];
  if (v17[3] > 0.0)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __65__PLXPCAgent_distributeBundleIDEntriesToWeight_toDistributionID___block_invoke_2;
    void v12[3] = &unk_1E6E49F28;
    id v7 = v6;
    id v13 = v7;
    id v14 = &v16;
    [v5 enumerateKeysAndObjectsUsingBlock:v12];
    id v8 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    int64_t v9 = [v8 dateByAddingTimeInterval:-5.0];
    char v10 = [MEMORY[0x1E4F92900] sharedInstance];
    [v10 createDistributionEventBackwardWithDistributionID:v4 withChildNodeNameToWeight:v7 withEndDate:v9];

    double v11 = [MEMORY[0x1E4F92900] sharedInstance];
    [v11 createDistributionEventBackwardWithDistributionID:v4 withChildNodeNameToWeight:MEMORY[0x1E4F1CC08] withEndDate:v8];
  }
  _Block_object_dispose(&v16, 8);
}

double __65__PLXPCAgent_distributeBundleIDEntriesToWeight_toDistributionID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  [a3 doubleValue];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = v5 + *(double *)(v4 + 24);
  *(double *)(v4 + 24) = result;
  return result;
}

void __65__PLXPCAgent_distributeBundleIDEntriesToWeight_toDistributionID___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  double v5 = (void *)MEMORY[0x1E4F28ED0];
  id v6 = a2;
  [a3 doubleValue];
  id v8 = [v5 numberWithDouble:v7 / *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v6];
}

- (NSMutableDictionary)localCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLocalCache:(id)a3
{
}

- (PLXPCListenerOperatorComposition)testMarkerXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTestMarkerXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)UIKitKeyboardXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUIKitKeyboardXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)UIKitActivityXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setUIKitActivityXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)UIKitAlertXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setUIKitAlertXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)UIKitEclipseXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setUIKitEclipseXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)userSafetyProcessing
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (void)setUserSafetyProcessing:(id)a3
{
}

- (PLXPCListenerOperatorComposition)activeStylusXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setActiveStylusXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)animatedStickerCreationListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setAnimatedStickerCreationListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)animatedStickerScoringListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 128, 1);
}

- (void)setAnimatedStickerScoringListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)passiveStylusXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 136, 1);
}

- (void)setPassiveStylusXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)keyboardTrackpadXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 144, 1);
}

- (void)setKeyboardTrackpadXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)KeyboardSessionXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 152, 1);
}

- (void)setKeyboardSessionXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)momentsDeferredProcessingListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 160, 1);
}

- (void)setMomentsDeferredProcessingListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)RenderPassCountXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 168, 1);
}

- (void)setRenderPassCountXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)staticStickerCreationListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 176, 1);
}

- (void)setStaticStickerCreationListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)staticStickerScoringListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 184, 1);
}

- (void)setStaticStickerScoringListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)LayerCountXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 192, 1);
}

- (void)setLayerCountXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)vkDataScannerListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 200, 1);
}

- (void)setVkDataScannerListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)albumAnimationListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 208, 1);
}

- (void)setAlbumAnimationListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)albumMotionListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 216, 1);
}

- (void)setAlbumMotionListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)mailCategorizationListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 224, 1);
}

- (void)setMailCategorizationListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)watchPresenceXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 232, 1);
}

- (void)setWatchPresenceXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)CarPlayXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 240, 1);
}

- (void)setCarPlayXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)CarPlayScreensXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 248, 1);
}

- (void)setCarPlayScreensXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)SecondaryDisplayXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 256, 1);
}

- (void)setSecondaryDisplayXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)SpatialAudioXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 264, 1);
}

- (void)setSpatialAudioXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)DASyncStartXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 272, 1);
}

- (void)setDASyncStartXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)DACalendarItemsDownloadedXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 280, 1);
}

- (void)setDACalendarItemsDownloadedXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)DACalendarItemsUploadedXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 288, 1);
}

- (void)setDACalendarItemsUploadedXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)MailFetchXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 296, 1);
}

- (void)setMailFetchXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)NanoMailSessionXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 304, 1);
}

- (void)setNanoMailSessionXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)NavdXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 312, 1);
}

- (void)setNavdXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)SafariFetcherXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 320, 1);
}

- (void)setSafariFetcherXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)SafariViewServiceXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 328, 1);
}

- (void)setSafariViewServiceXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)SiriXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 336, 1);
}

- (void)setSiriXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)NanoSiriXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 344, 1);
}

- (void)setNanoSiriXPCListener:(id)a3
{
}

- (PLNSNotificationOperatorComposition)MemoryWarningListener
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 352, 1);
}

- (void)setMemoryWarningListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)AccessoryMotionXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 360, 1);
}

- (void)setAccessoryMotionXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)accessoryUARPListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 368, 1);
}

- (void)setAccessoryUARPListener:(id)a3
{
}

- (int64_t)accessoryUARPEntryCount
{
  return self->_accessoryUARPEntryCount;
}

- (void)setAccessoryUARPEntryCount:(int64_t)a3
{
  self->_accessoryUARPEntryCount = a3;
}

- (PLXPCListenerOperatorComposition)AccessoriesXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 384, 1);
}

- (void)setAccessoriesXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)AppAccessoriesXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 392, 1);
}

- (void)setAppAccessoriesXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)AirDropXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 400, 1);
}

- (void)setAirDropXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)AirDropSessionXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 408, 1);
}

- (void)setAirDropSessionXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)SymptomsNetworkAdvisory
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 416, 1);
}

- (void)setSymptomsNetworkAdvisory:(id)a3
{
}

- (PLXPCListenerOperatorComposition)voicemailDurationListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 424, 1);
}

- (void)setVoicemailDurationListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)InCallServiceXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 432, 1);
}

- (void)setInCallServiceXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)CallScreeningDurationListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 440, 1);
}

- (void)setCallScreeningDurationListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)CallScreeningEnabledListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 448, 1);
}

- (void)setCallScreeningEnabledListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)WebAppXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 456, 1);
}

- (void)setWebAppXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)BackgroundTransfer
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 464, 1);
}

- (void)setBackgroundTransfer:(id)a3
{
}

- (PLXPCListenerOperatorComposition)telNotificationXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 472, 1);
}

- (void)setTelNotificationXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)PortraitHighlightsResultXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 480, 1);
}

- (void)setPortraitHighlightsResultXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)SpotlightHighlightsResultXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 488, 1);
}

- (void)setSpotlightHighlightsResultXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)SpotlightIndexesXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 496, 1);
}

- (void)setSpotlightIndexesXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)SpotlightQueriesXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 504, 1);
}

- (void)setSpotlightQueriesXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)SpotlightQosXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 512, 1);
}

- (void)setSpotlightQosXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)SpotlightWatchdogFiredXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 520, 1);
}

- (void)setSpotlightWatchdogFiredXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)siriFalseAlarm
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 528, 1);
}

- (void)setSiriFalseAlarm:(id)a3
{
}

- (PLXPCResponderOperatorComposition)entryRequestResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 536, 1);
}

- (void)setEntryRequestResponder:(id)a3
{
}

- (PLXPCResponderOperatorComposition)taskModeQueryResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 544, 1);
}

- (void)setTaskModeQueryResponder:(id)a3
{
}

- (PLXPCListenerOperatorComposition)PeekXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 552, 1);
}

- (void)setPeekXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)PopXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 560, 1);
}

- (void)setPopXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)ThermalLevelXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 568, 1);
}

- (void)setThermalLevelXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)ThermalSensorsXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 576, 1);
}

- (void)setThermalSensorsXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)ThermalHiPXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 584, 1);
}

- (void)setThermalHiPXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)MobileBackupStatisticsXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 592, 1);
}

- (void)setMobileBackupStatisticsXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)MobileBackupEventsXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 600, 1);
}

- (void)setMobileBackupEventsXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)CloudKitXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 608, 1);
}

- (void)setCloudKitXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)SleepModeXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 616, 1);
}

- (void)setSleepModeXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)SleepLockXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 624, 1);
}

- (void)setSleepLockXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)WeatherNotificationStateXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 632, 1);
}

- (void)setWeatherNotificationStateXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)WeatherNotificationXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 640, 1);
}

- (void)setWeatherNotificationXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)CacheDeleteXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 648, 1);
}

- (void)setCacheDeleteXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)MachineTranslationXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 656, 1);
}

- (void)setMachineTranslationXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)AppActivationPerformanceActivationDataXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 664, 1);
}

- (void)setAppActivationPerformanceActivationDataXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)AppActivationPerformanceProcessDataXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 672, 1);
}

- (void)setAppActivationPerformanceProcessDataXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)AppActivationPerformanceCPUStatisticsXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 680, 1);
}

- (void)setAppActivationPerformanceCPUStatisticsXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)AppActivationPerformanceMemoryStatisticsXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 688, 1);
}

- (void)setAppActivationPerformanceMemoryStatisticsXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)AppActivationPerformancePowerStateStatisticsXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 696, 1);
}

- (void)setAppActivationPerformancePowerStateStatisticsXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)UbiquityAccountStatisticsXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 704, 1);
}

- (void)setUbiquityAccountStatisticsXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)DeepScanReasonsXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 712, 1);
}

- (void)setDeepScanReasonsXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)LocationVehicularDetectionXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 720, 1);
}

- (void)setLocationVehicularDetectionXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)MotionWakeReasonXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 728, 1);
}

- (void)setMotionWakeReasonXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)CommuteRefreshXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 736, 1);
}

- (void)setCommuteRefreshXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)SecItemXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 744, 1);
}

- (void)setSecItemXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)SOSKVSRateLimitingEventXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 752, 1);
}

- (void)setSOSKVSRateLimitingEventXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)CKKSSyncingEventXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 760, 1);
}

- (void)setCKKSSyncingEventXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)OctagonTrustEventXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 768, 1);
}

- (void)setOctagonTrustEventXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)AirPlayDiscoveryModeXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 776, 1);
}

- (void)setAirPlayDiscoveryModeXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)MXDiscoveryLevelXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 784, 1);
}

- (void)setMXDiscoveryLevelXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)WirelessSyncStartEventXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 792, 1);
}

- (void)setWirelessSyncStartEventXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)WirelessSyncStopEventXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 800, 1);
}

- (void)setWirelessSyncStopEventXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)groupActivitiesXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 808, 1);
}

- (void)setGroupActivitiesXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)appleDiffusionListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 816, 1);
}

- (void)setAppleDiffusionListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)assetLoadGFListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 824, 1);
}

- (void)setAssetLoadGFListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)fileResidentInfoListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 832, 1);
}

- (void)setFileResidentInfoListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)handwritingInferenceListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 840, 1);
}

- (void)setHandwritingInferenceListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)mmExecuteRequestListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 848, 1);
}

- (void)setMmExecuteRequestListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)summarizationListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 856, 1);
}

- (void)setSummarizationListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)tgiExecuteRequestListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 864, 1);
}

- (void)setTgiExecuteRequestListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)smartReplySessionListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 872, 1);
}

- (void)setSmartReplySessionListener:(id)a3
{
}

- (PLCFNotificationOperatorComposition)gmsAvailablityListener
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 880, 1);
}

- (void)setGmsAvailablityListener:(id)a3
{
}

- (PLCFNotificationOperatorComposition)gmsOptInListener
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 888, 1);
}

- (void)setGmsOptInListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)modelCompilationListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 896, 1);
}

- (void)setModelCompilationListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)modelInferenceListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 904, 1);
}

- (void)setModelInferenceListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)modelLoadListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 912, 1);
}

- (void)setModelLoadListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)modelUnLoadListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 920, 1);
}

- (void)setModelUnLoadListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)instanceModelLoadListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 928, 1);
}

- (void)setInstanceModelLoadListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)instanceModelUnLoadListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 936, 1);
}

- (void)setInstanceModelUnLoadListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)relevanceContextUpdateXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 944, 1);
}

- (void)setRelevanceContextUpdateXPCListener:(id)a3
{
}

- (int64_t)SOSKVSEntries
{
  return self->_SOSKVSEntries;
}

- (void)setSOSKVSEntries:(int64_t)a3
{
  self->_int64_t SOSKVSEntries = a3;
}

- (int64_t)peekpopProcessID
{
  return self->_peekpopProcessID;
}

- (void)setPeekpopProcessID:(int64_t)a3
{
  self->_peekpopProcessID = a3;
}

- (NSDate)peekStartTime
{
  return (NSDate *)objc_getProperty(self, a2, 968, 1);
}

- (void)setPeekStartTime:(id)a3
{
}

- (int64_t)peekCount
{
  return self->_peekCount;
}

- (void)setPeekCount:(int64_t)a3
{
  self->_peekCount = a3;
}

- (int64_t)popCount
{
  return self->_popCount;
}

- (void)setPopCount:(int64_t)a3
{
  self->_popCount = a3;
}

- (double)peekDuration
{
  return self->_peekDuration;
}

- (void)setPeekDuration:(double)a3
{
  self->_peekDuration = a3;
}

- (PLXPCListenerOperatorComposition)AttentionSamplingXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1000, 1);
}

- (void)setAttentionSamplingXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)AttentionPollingXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1008, 1);
}

- (void)setAttentionPollingXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)AttentionServiceXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setAttentionServiceXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)ODOffXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setODOffXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)ODOnXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setODOnXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)ODHNXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setODHNXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)DRMaxRateListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setDRMaxRateListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)FrameCountXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setFrameCountXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)EnergyTelemetryXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setEnergyTelemetryXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)AirTrafficAssetDownloadXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setAirTrafficAssetDownloadXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)CoreDuetKnowledgeSyncXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setCoreDuetKnowledgeSyncXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)AppleBacklightBrightnessXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setAppleBacklightBrightnessXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)ShortcutsTriggerFiredXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setShortcutsTriggerFiredXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)RapportReceivedMessageXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1104, 1);
}

- (void)setRapportReceivedMessageXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)EnhancedDiscoveryXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1112, 1);
}

- (void)setEnhancedDiscoveryXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)AudioRoutingXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1120, 1);
}

- (void)setAudioRoutingXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)NetworkRelayXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1128, 1);
}

- (void)setNetworkRelayXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)NetworkRelayWiFiAssertionXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1136, 1);
}

- (void)setNetworkRelayWiFiAssertionXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)NetworkRelayBTLinkAssertionXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1144, 1);
}

- (void)setNetworkRelayBTLinkAssertionXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)NetworkRelayTerminusBTWakeXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1152, 1);
}

- (void)setNetworkRelayTerminusBTWakeXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)LinkAdvisoryXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1160, 1);
}

- (void)setLinkAdvisoryXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)RCSSessionManagementXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1168, 1);
}

- (void)setRCSSessionManagementXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)ADDListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1176, 1);
}

- (void)setADDListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)DosimetryXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1184, 1);
}

- (void)setDosimetryXPCListener:(id)a3
{
}

- (PLEntry)lastDosimetryEntry
{
  return (PLEntry *)objc_getProperty(self, a2, 1192, 1);
}

- (void)setLastDosimetryEntry:(id)a3
{
}

- (PLXPCListenerOperatorComposition)AVConferenceXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1200, 1);
}

- (void)setAVConferenceXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)AvailabilityModesXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1208, 1);
}

- (void)setAvailabilityModesXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)FocusFiltersXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1216, 1);
}

- (void)setFocusFiltersXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)PasskeyAuthenticationXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1224, 1);
}

- (void)setPasskeyAuthenticationXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)RapidSecurityResponseXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1232, 1);
}

- (void)setRapidSecurityResponseXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)CPUViolationsXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1240, 1);
}

- (void)setCPUViolationsXPCListener:(id)a3
{
}

- (PLCFNotificationOperatorComposition)ihaToggleListener
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 1248, 1);
}

- (void)setIhaToggleListener:(id)a3
{
}

- (int)lastLinearBrightness
{
  return self->_lastLinearBrightness;
}

- (void)setLastLinearBrightness:(int)a3
{
  self->_lastLinearBrightness = a3;
}

- (PLEntryNotificationOperatorComposition)batteryLevelChangedNotifications
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 1256, 1);
}

- (void)setBatteryLevelChangedNotifications:(id)a3
{
}

- (NSMutableDictionary)inferenceEntries
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 1264, 1);
}

- (void)setInferenceEntries:(id)a3
{
}

- (NSMutableDictionary)summarizationEntries
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 1272, 1);
}

- (void)setSummarizationEntries:(id)a3
{
}

- (double)lastSBCupdateTimestamp
{
  return self->_lastSBCupdateTimestamp;
}

- (void)setLastSBCupdateTimestamp:(double)a3
{
  self->_double lastSBCupdateTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summarizationEntries, 0);
  objc_storeStrong((id *)&self->_inferenceEntries, 0);
  objc_storeStrong((id *)&self->_batteryLevelChangedNotifications, 0);
  objc_storeStrong((id *)&self->_ihaToggleListener, 0);
  objc_storeStrong((id *)&self->_CPUViolationsXPCListener, 0);
  objc_storeStrong((id *)&self->_RapidSecurityResponseXPCListener, 0);
  objc_storeStrong((id *)&self->_PasskeyAuthenticationXPCListener, 0);
  objc_storeStrong((id *)&self->_FocusFiltersXPCListener, 0);
  objc_storeStrong((id *)&self->_AvailabilityModesXPCListener, 0);
  objc_storeStrong((id *)&self->_AVConferenceXPCListener, 0);
  objc_storeStrong((id *)&self->_lastDosimetryEntry, 0);
  objc_storeStrong((id *)&self->_DosimetryXPCListener, 0);
  objc_storeStrong((id *)&self->_ADDListener, 0);
  objc_storeStrong((id *)&self->_RCSSessionManagementXPCListener, 0);
  objc_storeStrong((id *)&self->_LinkAdvisoryXPCListener, 0);
  objc_storeStrong((id *)&self->_NetworkRelayTerminusBTWakeXPCListener, 0);
  objc_storeStrong((id *)&self->_NetworkRelayBTLinkAssertionXPCListener, 0);
  objc_storeStrong((id *)&self->_NetworkRelayWiFiAssertionXPCListener, 0);
  objc_storeStrong((id *)&self->_NetworkRelayXPCListener, 0);
  objc_storeStrong((id *)&self->_AudioRoutingXPCListener, 0);
  objc_storeStrong((id *)&self->_EnhancedDiscoveryXPCListener, 0);
  objc_storeStrong((id *)&self->_RapportReceivedMessageXPCListener, 0);
  objc_storeStrong((id *)&self->_ShortcutsTriggerFiredXPCListener, 0);
  objc_storeStrong((id *)&self->_AppleBacklightBrightnessXPCListener, 0);
  objc_storeStrong((id *)&self->_CoreDuetKnowledgeSyncXPCListener, 0);
  objc_storeStrong((id *)&self->_AirTrafficAssetDownloadXPCListener, 0);
  objc_storeStrong((id *)&self->_EnergyTelemetryXPCListener, 0);
  objc_storeStrong((id *)&self->_FrameCountXPCListener, 0);
  objc_storeStrong((id *)&self->_DRMaxRateListener, 0);
  objc_storeStrong((id *)&self->_ODHNXPCListener, 0);
  objc_storeStrong((id *)&self->_ODOnXPCListener, 0);
  objc_storeStrong((id *)&self->_ODOffXPCListener, 0);
  objc_storeStrong((id *)&self->_AttentionServiceXPCListener, 0);
  objc_storeStrong((id *)&self->_AttentionPollingXPCListener, 0);
  objc_storeStrong((id *)&self->_AttentionSamplingXPCListener, 0);
  objc_storeStrong((id *)&self->_peekStartTime, 0);
  objc_storeStrong((id *)&self->_relevanceContextUpdateXPCListener, 0);
  objc_storeStrong((id *)&self->_instanceModelUnLoadListener, 0);
  objc_storeStrong((id *)&self->_instanceModelLoadListener, 0);
  objc_storeStrong((id *)&self->_modelUnLoadListener, 0);
  objc_storeStrong((id *)&self->_modelLoadListener, 0);
  objc_storeStrong((id *)&self->_modelInferenceListener, 0);
  objc_storeStrong((id *)&self->_modelCompilationListener, 0);
  objc_storeStrong((id *)&self->_gmsOptInListener, 0);
  objc_storeStrong((id *)&self->_gmsAvailablityListener, 0);
  objc_storeStrong((id *)&self->_smartReplySessionListener, 0);
  objc_storeStrong((id *)&self->_tgiExecuteRequestListener, 0);
  objc_storeStrong((id *)&self->_summarizationListener, 0);
  objc_storeStrong((id *)&self->_mmExecuteRequestListener, 0);
  objc_storeStrong((id *)&self->_handwritingInferenceListener, 0);
  objc_storeStrong((id *)&self->_fileResidentInfoListener, 0);
  objc_storeStrong((id *)&self->_assetLoadGFListener, 0);
  objc_storeStrong((id *)&self->_appleDiffusionListener, 0);
  objc_storeStrong((id *)&self->_groupActivitiesXPCListener, 0);
  objc_storeStrong((id *)&self->_WirelessSyncStopEventXPCListener, 0);
  objc_storeStrong((id *)&self->_WirelessSyncStartEventXPCListener, 0);
  objc_storeStrong((id *)&self->_MXDiscoveryLevelXPCListener, 0);
  objc_storeStrong((id *)&self->_AirPlayDiscoveryModeXPCListener, 0);
  objc_storeStrong((id *)&self->_OctagonTrustEventXPCListener, 0);
  objc_storeStrong((id *)&self->_CKKSSyncingEventXPCListener, 0);
  objc_storeStrong((id *)&self->_SOSKVSRateLimitingEventXPCListener, 0);
  objc_storeStrong((id *)&self->_SecItemXPCListener, 0);
  objc_storeStrong((id *)&self->_CommuteRefreshXPCListener, 0);
  objc_storeStrong((id *)&self->_MotionWakeReasonXPCListener, 0);
  objc_storeStrong((id *)&self->_LocationVehicularDetectionXPCListener, 0);
  objc_storeStrong((id *)&self->_DeepScanReasonsXPCListener, 0);
  objc_storeStrong((id *)&self->_UbiquityAccountStatisticsXPCListener, 0);
  objc_storeStrong((id *)&self->_AppActivationPerformancePowerStateStatisticsXPCListener, 0);
  objc_storeStrong((id *)&self->_AppActivationPerformanceMemoryStatisticsXPCListener, 0);
  objc_storeStrong((id *)&self->_AppActivationPerformanceCPUStatisticsXPCListener, 0);
  objc_storeStrong((id *)&self->_AppActivationPerformanceProcessDataXPCListener, 0);
  objc_storeStrong((id *)&self->_AppActivationPerformanceActivationDataXPCListener, 0);
  objc_storeStrong((id *)&self->_MachineTranslationXPCListener, 0);
  objc_storeStrong((id *)&self->_CacheDeleteXPCListener, 0);
  objc_storeStrong((id *)&self->_WeatherNotificationXPCListener, 0);
  objc_storeStrong((id *)&self->_WeatherNotificationStateXPCListener, 0);
  objc_storeStrong((id *)&self->_SleepLockXPCListener, 0);
  objc_storeStrong((id *)&self->_SleepModeXPCListener, 0);
  objc_storeStrong((id *)&self->_CloudKitXPCListener, 0);
  objc_storeStrong((id *)&self->_MobileBackupEventsXPCListener, 0);
  objc_storeStrong((id *)&self->_MobileBackupStatisticsXPCListener, 0);
  objc_storeStrong((id *)&self->_ThermalHiPXPCListener, 0);
  objc_storeStrong((id *)&self->_ThermalSensorsXPCListener, 0);
  objc_storeStrong((id *)&self->_ThermalLevelXPCListener, 0);
  objc_storeStrong((id *)&self->_PopXPCListener, 0);
  objc_storeStrong((id *)&self->_PeekXPCListener, 0);
  objc_storeStrong((id *)&self->_taskModeQueryResponder, 0);
  objc_storeStrong((id *)&self->_entryRequestResponder, 0);
  objc_storeStrong((id *)&self->_siriFalseAlarm, 0);
  objc_storeStrong((id *)&self->_SpotlightWatchdogFiredXPCListener, 0);
  objc_storeStrong((id *)&self->_SpotlightQosXPCListener, 0);
  objc_storeStrong((id *)&self->_SpotlightQueriesXPCListener, 0);
  objc_storeStrong((id *)&self->_SpotlightIndexesXPCListener, 0);
  objc_storeStrong((id *)&self->_SpotlightHighlightsResultXPCListener, 0);
  objc_storeStrong((id *)&self->_PortraitHighlightsResultXPCListener, 0);
  objc_storeStrong((id *)&self->_telNotificationXPCListener, 0);
  objc_storeStrong((id *)&self->_BackgroundTransfer, 0);
  objc_storeStrong((id *)&self->_WebAppXPCListener, 0);
  objc_storeStrong((id *)&self->_CallScreeningEnabledListener, 0);
  objc_storeStrong((id *)&self->_CallScreeningDurationListener, 0);
  objc_storeStrong((id *)&self->_InCallServiceXPCListener, 0);
  objc_storeStrong((id *)&self->_voicemailDurationListener, 0);
  objc_storeStrong((id *)&self->_SymptomsNetworkAdvisory, 0);
  objc_storeStrong((id *)&self->_AirDropSessionXPCListener, 0);
  objc_storeStrong((id *)&self->_AirDropXPCListener, 0);
  objc_storeStrong((id *)&self->_AppAccessoriesXPCListener, 0);
  objc_storeStrong((id *)&self->_AccessoriesXPCListener, 0);
  objc_storeStrong((id *)&self->_accessoryUARPListener, 0);
  objc_storeStrong((id *)&self->_AccessoryMotionXPCListener, 0);
  objc_storeStrong((id *)&self->_MemoryWarningListener, 0);
  objc_storeStrong((id *)&self->_NanoSiriXPCListener, 0);
  objc_storeStrong((id *)&self->_SiriXPCListener, 0);
  objc_storeStrong((id *)&self->_SafariViewServiceXPCListener, 0);
  objc_storeStrong((id *)&self->_SafariFetcherXPCListener, 0);
  objc_storeStrong((id *)&self->_NavdXPCListener, 0);
  objc_storeStrong((id *)&self->_NanoMailSessionXPCListener, 0);
  objc_storeStrong((id *)&self->_MailFetchXPCListener, 0);
  objc_storeStrong((id *)&self->_DACalendarItemsUploadedXPCListener, 0);
  objc_storeStrong((id *)&self->_DACalendarItemsDownloadedXPCListener, 0);
  objc_storeStrong((id *)&self->_DASyncStartXPCListener, 0);
  objc_storeStrong((id *)&self->_SpatialAudioXPCListener, 0);
  objc_storeStrong((id *)&self->_SecondaryDisplayXPCListener, 0);
  objc_storeStrong((id *)&self->_CarPlayScreensXPCListener, 0);
  objc_storeStrong((id *)&self->_CarPlayXPCListener, 0);
  objc_storeStrong((id *)&self->_watchPresenceXPCListener, 0);
  objc_storeStrong((id *)&self->_mailCategorizationListener, 0);
  objc_storeStrong((id *)&self->_albumMotionListener, 0);
  objc_storeStrong((id *)&self->_albumAnimationListener, 0);
  objc_storeStrong((id *)&self->_vkDataScannerListener, 0);
  objc_storeStrong((id *)&self->_LayerCountXPCListener, 0);
  objc_storeStrong((id *)&self->_staticStickerScoringListener, 0);
  objc_storeStrong((id *)&self->_staticStickerCreationListener, 0);
  objc_storeStrong((id *)&self->_RenderPassCountXPCListener, 0);
  objc_storeStrong((id *)&self->_momentsDeferredProcessingListener, 0);
  objc_storeStrong((id *)&self->_KeyboardSessionXPCListener, 0);
  objc_storeStrong((id *)&self->_keyboardTrackpadXPCListener, 0);
  objc_storeStrong((id *)&self->_passiveStylusXPCListener, 0);
  objc_storeStrong((id *)&self->_animatedStickerScoringListener, 0);
  objc_storeStrong((id *)&self->_animatedStickerCreationListener, 0);
  objc_storeStrong((id *)&self->_activeStylusXPCListener, 0);
  objc_storeStrong((id *)&self->_userSafetyProcessing, 0);
  objc_storeStrong((id *)&self->_UIKitEclipseXPCListener, 0);
  objc_storeStrong((id *)&self->_UIKitAlertXPCListener, 0);
  objc_storeStrong((id *)&self->_UIKitActivityXPCListener, 0);
  objc_storeStrong((id *)&self->_UIKitKeyboardXPCListener, 0);
  objc_storeStrong((id *)&self->_testMarkerXPCListener, 0);
  objc_storeStrong((id *)&self->_localCache, 0);
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Navd callback: %@", v2, v3, v4, v5, v6);
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1780_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Navd Maps Widget Session callback: %@", v2, v3, v4, v5, v6);
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1788_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Navd GEO Network Activity callback: %@", v2, v3, v4, v5, v6);
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1793_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Navd Navigation State Event callback: %@", v2, v3, v4, v5, v6);
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1800_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "DACalendarItemsDownloaded callback: %@", v2, v3, v4, v5, v6);
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1805_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "DACalendarItemsUploaded callback: %@", v2, v3, v4, v5, v6);
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1815_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "UIKit alert callback: %@", v2, v3, v4, v5, v6);
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1825_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Siri Borealis callback: %@", v2, v3, v4, v5, v6);
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1830_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Siri Activation callback: %@", v2, v3, v4, v5, v6);
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1837_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "SpotlightQos callback: %@", v2, v3, v4, v5, v6);
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1842_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "SpotlightWatchdog callback: %@", v2, v3, v4, v5, v6);
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1849_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Location Vehicular Detection Session callback: %@", v2, v3, v4, v5, v6);
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1854_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "MotionWakeReason Session callback: %@", v2, v3, v4, v5, v6);
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1859_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "CommuteRefresh Session callback: %@", v2, v3, v4, v5, v6);
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1866_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "SecItem Session callback: %@", v2, v3, v4, v5, v6);
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1873_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "DR MaxRate callback %@", v2, v3, v4, v5, v6);
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1883_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_1E4220000, v0, v1, "Active stylus payload received from %@, %@");
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1891_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_1E4220000, v0, v1, "Passive stylus payload received from %@, %@");
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1898_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "WatchPresence payload, %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1909_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "GenerativeFunctionMetrics appleDiffusion payload: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1917_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "GenerativeFunctionMetrics Summarization payload: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1925_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "GenerativeFunctionMetrics assetLoad payload: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1933_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "GenerativeFunctionMetrics fileResidentInfo payload: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1941_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "GenerativeFunctionMetrics HandwritingInference payload: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1949_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "GenerativeFunctionMetrics mmExecuteRequest payload: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1957_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "GenerativeFunctionMetrics tgiExecuteRequest payload: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1965_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "GenerativeFunctionMetrics SmartReplySession payload: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1973_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "ANEd model compilation payload: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1984_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "ANEd model inference payload: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1995_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "ANEd model load payload: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2006_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "ANEd model unload payload: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2017_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "ANEd new instance model load payload: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2028_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "ANEd new instance model unload payload: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2040_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "MXDiscoveryLevel payload: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2048_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Airplay DiscoveryMode payload: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2060_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "TestMarker callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2075_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "UIKit eclipse callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2085_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Sleep Mode activity callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2090_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Sleep Lock activity callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2097_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Weather Notification State callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2102_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Weather Notification callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2112_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "SecondaryDisplay callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2120_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "UIKit keyboard callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2128_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "UIKit activity callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2133_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "DASyncStart callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2141_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "LinkAdvisory payload: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2149_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "RCSSessionManagement payload: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2157_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_1E4220000, v0, v1, "XPCMetrics::VKDataScanner payload received from %@, %@");
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2165_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_1E4220000, v0, v1, "RenderData::AlbumAnimationDuration payload received from %@, %@");
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2173_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_1E4220000, v0, v1, "RenderData::AlbumMotionDownload payload received from %@, %@");
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2180_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_1E4220000, v0, v1, "CallScreeningDuration payload received from %@, %@");
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2185_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_1E4220000, v0, v1, "CallScreeningEnabled payload received from %@, %@");
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2193_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_1E4220000, v0, v1, "Trackpad logging payload received from %@, %@");
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2198_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "VoicemailDuration callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2208_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "KeyboardSession callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2216_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "RenderPassCount callback %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2224_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "LayerCount callback %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2231_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "MomentsDeferredProcessing callback %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2239_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "GroupActivities payload: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2247_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "CPUViolations payload: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2252_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "AnimatedStickerCreation callback %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2257_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "AnimatedStickerScoring callback %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2262_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "StaticStickerCreation callback %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2267_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "StaticStickerScoring callback %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2275_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_1E4220000, v0, v1, "XPCMetrics::MailCategorizationEvent payload received from %@, %@");
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2283_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "MADIVSProcessing callback %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2288_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "CarPlay payload: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2293_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "CarPlayScreens payload: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2301_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "RelevanceContextUpdate payload: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2311_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Mail Framework Fetch AFC callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2318_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "NanoMailSession callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2328_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Safari Reading list fetcher callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2336_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Safari View Service callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2354_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "App Accessory callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2362_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Accessory callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2369_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Network Symptoms callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2379_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Background transfer callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2389_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Deep Scan Reasons callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2397_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "InCallService callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2407_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "WebApp callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2416_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_1E4220000, v0, v1, "EntryRequest callback: payload=%@\nentries=%@");
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2425_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Location callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2435_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Siri False Alarm callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2443_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Peek callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2451_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Pop callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2461_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Thermal level callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2469_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Thermal sensors callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2477_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Thermal HiP callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2487_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Mobile Backup callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2505_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "CloudKit callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2515_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "CacheDelete callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2525_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Translation callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2533_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Ubiquity Account Statistics callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2543_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "AttentionSampling callback %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2551_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "AttentionPolling callback %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2559_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "AttentionService callback %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2564_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "OD Off callback %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2569_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "OD On callback %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2574_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "OD HN callback %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2579_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "FrameCount callback %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2586_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "AirDropSession callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2591_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "AirDrop callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2596_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "SOS KVS Rate Limiting Event callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2601_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "CKKSSyncing Callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2606_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "OctagonTrust callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2620_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "AirTraffic callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2627_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "CoreDuet KnowledgeSync callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2637_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "App Activation Performance callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2674_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Shortcuts trigger fired callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2684_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "AppleBacklight Brightness callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2694_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "NetworkRelay callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2702_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "NetworkRelay WiFi Assertion callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2710_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "NetworkRelay BT Link Assertion callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2718_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "NetworkRelay Terminus BT wake callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2725_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "AccessoryMotion callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2733_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "UARP Update callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2743_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Dosimetry callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2753_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "AudioRouting callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2763_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Rapport received message callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2770_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "EnhancedDiscovery callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2780_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "WirelessSyncStart payload: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2788_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "WirelessSyncStop payload: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2796_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Spatial Audio callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2804_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "AVConference callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2811_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "AvailabilityModes payload: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2816_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "FocusFilters payload: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2823_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "PortraitHighlightsResult payload: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2828_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "SpotlightHighlightsResult payload: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2836_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "SpotlightIndexes payload: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2841_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "SpotlightQueries payload: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2848_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Passkey Authentication callback: %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2858_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "ADD callback %@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2866_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "TaskModeQuery: payload=%@", v2, v3, v4, v5, v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2878_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Rapid Security Response callback: %@", v2, v3, v4, v5, v6);
}

- (void)logEventPointSleepLock:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "SleepLock submission not allowed by IHA", v2, v3, v4, v5, v6);
}

- (void)logEventPointWeatherNotification:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "Empty payload, returning", v2, v3, v4, v5, v6);
}

- (void)logEventPointADD:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Not logging ADD because Improve Safety is not enabled", v2, v3, v4, v5, v6);
}

- (void)logEventForwardSOSKVSRateLimitingEvent:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "SOSKVSRateLimiting Event Dropped, invalid", v2, v3, v4, v5, v6);
}

- (void)logEventForwardSOSKVSRateLimitingEvent:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "SOSKVSRateLimiting Event Dropped, table full", v2, v3, v4, v5, v6);
}

void __37__PLXPCAgent_logEventForwardGMSOptIn__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_3(&dword_1E4220000, v0, v1, "Error grabbing GenerativeFunctionMetrics OptIn state, logging 0: %@", v2, v3, v4, v5, v6);
}

- (void)logEventForwardAssetLoadGF:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "GenerativeFunctionMetrics assetLoad did not find openEntry", v2, v3, v4, v5, v6);
}

- (void)logEventForwardAssetLoadGF:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "GenerativeFunctionMetrics assetLoad found openEntry = %@", v2, v3, v4, v5, v6);
}

void __41__PLXPCAgent_logEventForwardAssetLoadGF___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_13(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "GenerativeFunctionMetrics assetLoad updateEntry: %@", v2, v3, v4, v5, v6);
}

- (void)logEventForwardMMExecuteRequest:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "GenerativeFunctionMetrics mmExecuteRequest did not find openEntry", v2, v3, v4, v5, v6);
}

- (void)logEventForwardMMExecuteRequest:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "GenerativeFunctionMetrics mmExecuteRequest found openEntry = %@", v2, v3, v4, v5, v6);
}

void __46__PLXPCAgent_logEventForwardMMExecuteRequest___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_13(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "GenerativeFunctionMetrics mmExecuteRequest updateEntry: %@", v2, v3, v4, v5, v6);
}

- (void)logEventForwardTGIExecuteRequest:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "GenerativeFunctionMetrics tgiExecuteRequest did not find openEntry", v2, v3, v4, v5, v6);
}

- (void)logEventForwardTGIExecuteRequest:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "GenerativeFunctionMetrics tgiExecuteRequest found openEntry = %@", v2, v3, v4, v5, v6);
}

- (void)logEventForwardTGIExecuteRequest:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1E4220000, v0, v1, "GenerativeFunctionMetrics eventType: %d", v2, v3, v4, v5, v6);
}

void __47__PLXPCAgent_logEventForwardTGIExecuteRequest___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_13(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "GenerativeFunctionMetrics tgiExecuteRequest updateEntry: %@", v2, v3, v4, v5, v6);
}

- (void)logEventForwardSmartReplySession:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "GenerativeFunctionMetrics SmartReplySession did not find openEntry", v2, v3, v4, v5, v6);
}

- (void)logEventForwardSmartReplySession:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "GenerativeFunctionMetrics SmartReplySession found openEntry = %@", v2, v3, v4, v5, v6);
}

- (void)logEventForwardSmartReplySession:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1E4220000, v0, v1, "GenerativeFunctionMetrics SmartReplySession %d", v2, v3, v4, v5, v6);
}

void __47__PLXPCAgent_logEventForwardSmartReplySession___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_13(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "GenerativeFunctionMetrics SmartReplySession updateEntry: %@", v2, v3, v4, v5, v6);
}

- (void)convertPixelCount:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1E4220000, v0, v1, "GenerativeFunctionMetrics appleDiffusion pixelCount %d does not fall in any bucket", v2, v3, v4, v5, v6);
}

- (void)convertPixelCount:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1E4220000, v0, v1, "GenerativeFunctionMetrics appleDiffusion converting pixelCount %d to a bucket", v2, v3, v4, v5, v6);
}

- (void)logEventForwardAppleDiffusion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "GenerativeFunctionMetrics appleDiffusion updatedPayload: %@", v2, v3, v4, v5, v6);
}

- (void)logEventPointANE:withCategory:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "logEventPointANE internal build, payload: %@", v2, v3, v4, v5, v6);
}

- (void)logEventPointANE:withCategory:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "logEventPointANE updated payload: %@", v2, v3, v4, v5, v6);
}

- (void)logEventPointANE:withCategory:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "logEventPointANE privacy_score missing", v2, v3, v4, v5, v6);
}

- (void)logEventPointANE:(uint64_t)a3 withCategory:(uint64_t)a4 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)logEventPointANE:withCategory:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "logEventPointANE mutablepayload: %@", v2, v3, v4, v5, v6);
}

- (void)logEventPointANE:withCategory:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "logEventPointANE for category: %@", v2, v3, v4, v5, v6);
}

- (void)logEventForwardAppleBackklightBrightness:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1E4220000, v0, v1, "Skip same linear brightness logging: %d\n", v2, v3, v4, v5, v6);
}

- (void)logEventForwardAppleBackklightBrightness:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1E4220000, v0, v1, "Received linear brightness: %d\n", v2, v3, v4, v5, v6);
}

- (void)convertAirDropSessionState:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "AirDropSession Unknown/Other AirDropSession State %@", v2, v3, v4, v5, v6);
}

- (void)logEventForwardAudioRouting:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "Received null payload with SmartRouting event.", v2, v3, v4, v5, v6);
}

- (void)logEventFowardUARPStatus:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_3(&dword_1E4220000, v0, v1, "Discarding entry %@", v2, v3, v4, v5, v6);
}

- (void)logEventForwardDosimetry:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 objectForKeyedSubscript:@"noiseEnabled"];
  OUTLINED_FUNCTION_11_3(&dword_1E4220000, v2, v3, "Dosimetry state %@ = %@ %s\n", v4, v5, v6, v7, 2u);
}

- (void)logEventForwardDosimetry:(id *)a1 .cold.2(id *a1)
{
  uint64_t v7 = [*a1 objectForKeyedSubscript:@"noiseEnabled"];
  OUTLINED_FUNCTION_10(&dword_1E4220000, v1, v2, "Dosimetry state %@ changed to %@\n", v3, v4, v5, v6, 2u);
}

- (void)logEventForwardSleepMode:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "SleepMode submission not allowed by IHA", v2, v3, v4, v5, v6);
}

- (void)logEventForwardRelevanceContextUpdate:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "RelevanceContextUpdate updated payload: %@", v2, v3, v4, v5, v6);
}

- (void)logEventForwardLinkAdvisory:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "LinkAdvisory monotonic eventTime: %@", v2, v3, v4, v5, v6);
}

- (void)logEventBackwardNamePeek:(void *)a1 .cold.1(void *a1)
{
  [a1 peekpopProcessID];
  id v8 = [a1 peekStartTime];
  OUTLINED_FUNCTION_10(&dword_1E4220000, v2, v3, "Process-ID=%ld, Peek start time=%@", v4, v5, v6, v7, 2u);
}

- (void)logEventBackwardNamePeek:(void *)a1 .cold.2(void *a1)
{
  [a1 peekpopProcessID];
  [a1 peekDuration];
  OUTLINED_FUNCTION_11_3(&dword_1E4220000, v2, v3, "Process-ID=%ld, Peek end time=%@, Peek duration=%f", v4, v5, v6, v7, 2u);
}

- (void)logEventBackwardFrameCount:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "Error, FrameCount is invalid", v2, v3, v4, v5, v6);
}

- (void)logEventBackwardRenderPassCount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "RenderPassCount updated payload: %@", v2, v3, v4, v5, v6);
}

- (void)logEventBackwardLayerCount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "layerCount updated payload: %@", v2, v3, v4, v5, v6);
}

- (void)logEventBackwardEnergyTelemetry:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "[Energy Telemetry] Empty payload", v2, v3, v4, v5, v6);
}

- (void)logEventBackwardEnergyTelemetry:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "[Energy Telemetry] Date key not found in payload", v2, v3, v4, v5, v6);
}

- (void)logEventEventPointRCSSessionManagement:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Logging SIPRegisterKeepAlive to RAPID", v2, v3, v4, v5, v6);
}

- (void)logEventEventPointRCSSessionManagement:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "RCSSessionManagement monotonic eventTime: %@", v2, v3, v4, v5, v6);
}

- (void)logEventIntervalCoreDuetKnowledgeSync:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "Dropping CoreDuet KnowledgeSync event; End timestamp must be after start timestamp",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)logEventIntervalCoreDuetKnowledgeSync:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_3(&dword_1E4220000, v0, v1, "Dropping CoreDuet KnowledgeSync event; missing required key in payload: %@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)logEventIntervalRapportReceivedMessage:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_3(&dword_1E4220000, v0, v1, "Dropping Rapport received message event; missing required key in payload: %@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __51__PLXPCAgent_logEventIntervalNameSpotlightIndexes___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_3(&dword_1E4220000, v0, v1, "SpotlightIndexes unknown key found: %@", v2, v3, v4, v5, v6);
}

- (void)logEventIntervalGroupActivities:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "GroupActivities updated payload: %@", v2, v3, v4, v5, v6);
}

- (void)logEventIntervalEndCPUViolations:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "CPUViolations updated payload: %@", v2, v3, v4, v5, v6);
}

- (void)logEventIntervalVKDataScanner:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "XPCMetrics::VKDataScanner updated payload: %@", v2, v3, v4, v5, v6);
}

- (void)logAlbumAnimation:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "RenderData::AlbumAnimationDuration updated payload: %@", v2, v3, v4, v5, v6);
}

- (void)logAlbumMotion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "RenderData::AlbumMotionDownload updated payload: %@", v2, v3, v4, v5, v6);
}

- (void)logMailCategorization:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "XPCMetrics::MailCategorizationEvent updated payload: %@", v2, v3, v4, v5, v6);
}

@end