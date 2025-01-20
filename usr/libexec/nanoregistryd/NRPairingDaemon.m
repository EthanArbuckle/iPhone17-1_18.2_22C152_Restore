@interface NRPairingDaemon
+ (Class)proxyClass;
+ (id)countdown:(int64_t)a3 toCompletion:(id)a4;
+ (id)sharedInstance;
+ (void)debugDump:(id)a3 public:(BOOL)a4;
+ (void)updateActiveFlag:(BOOL)a3 andPost:(BOOL)a4;
+ (void)updatePingMyWatchControlCenterModuleVisibility:(id)a3;
- (AbstractTimer)gizmoSetCompatibilityStateTimer;
- (AbstractTimer)idsConnectivityTimer;
- (BOOL)_deviceIsInSetupBasedOnIsSetupValue:(id)a3;
- (BOOL)_hasUpdateModeDevicesInCollection:(id)a3;
- (BOOL)_isBridgeForeground;
- (BOOL)_isIDSPairedAndConsistentWithIDSDevices:(id)a3;
- (BOOL)_requiresNetworkRelayPairingIdentifierUpdateForDevice:(id)a3;
- (BOOL)alreadyRepairedTheSwitch;
- (BOOL)bluetoothIsScanning;
- (BOOL)clientRequestedSuspensionOfMonitoringPairingClientBeyondNewWatchPairingTransactionComplete;
- (BOOL)didRestoreFromBackup;
- (BOOL)hasClassAFile;
- (BOOL)healthKitLastChanceSyncInProgress;
- (BOOL)idsConnectivityTimedOut;
- (BOOL)initRemoteProperties;
- (BOOL)isBluetoothConnected;
- (BOOL)isBluetoothConnected:(int64_t)a3;
- (BOOL)isBluetoothPoweredOn;
- (BOOL)isBluetoothPoweredOn:(int64_t)a3;
- (BOOL)isNotCachingCrashMonitoring;
- (BOOL)isSecureDataAvailable;
- (BOOL)legacyDidRestoreFromBackup;
- (BOOL)managedConfigurationWatchDisabled;
- (BOOL)mightNeedToKickOffPairedSyncAfterLaunch;
- (BOOL)mirrorOfIsPaired;
- (BOOL)monitoringPairingClientBeyondNewWatchPairingTransactionComplete;
- (BOOL)networkRelayPairerIsScanning;
- (BOOL)pairingClientCrashMonitoringCachedValue;
- (BOOL)pairingCompatibilityVersionInitWithCollection:(id)a3;
- (BOOL)pairingQueueIsSuspended;
- (BOOL)proxyIsSecureDataAvailable:(id)a3;
- (BOOL)sentPropertiesFlag;
- (BOOL)setPairingClientCrashMonitoringCache:(BOOL)a3 proxy:(id)a4;
- (BOOL)shouldCollectPairingPerfStackshots;
- (BOOL)shouldWaitForBridgeNotificationForPairingID:(id)a3;
- (BOOL)storeMode;
- (BOOL)supportsEarlyPairedSync;
- (BOOL)syncTrapUIPushed;
- (CBCentralManager)central;
- (EPKeymaster)keymaster;
- (EPNanoRegistryStatusCodeVote)migrationVote;
- (EPNanoRegistryStatusCodeVote)readyStatusCodeVote;
- (EPScalablePipeManager)pusherPipe;
- (EPScalablePipeManagerManager)pusherPipeManager;
- (EPServiceRegistry)serviceRegistry;
- (EPWatchPusher)lastWatchPusher;
- (EPWatchPusher)watchPusher;
- (MCProfileConnection)mcConnection;
- (NBManager)backupManager;
- (NRConnectivityPublisher)connectivityPublisher;
- (NRLocalPropertyMonitor)localProperties;
- (NRMutableDevice)mirrorOfActiveDevice;
- (NROSLogStateProvider)dumper;
- (NROSTransaction)discoveryTransaction;
- (NROSTransaction)pairingClientCrashMonitoringTransaction;
- (NROSTransaction)receivedPropertiesTransaction;
- (NROSTransaction)watchPusherTransaction;
- (NRPairingDaemon)init;
- (NRPairingProxy)lastCaller;
- (NRPairingProxy)pairingClientCrashMonitoringProxy;
- (NRPairingProxy)pairingClientProxy;
- (NRPairingReport)pairingReport;
- (NRPowerAssertionActivity)migrationActivity;
- (NRSimpleReferenceCounter)advertisingClients;
- (NRSimpleReferenceCounter)discoveringClients;
- (NRSimpleReferenceCounter)pairingClients;
- (NRSimpleReferenceCounter)pushingClients;
- (NRSimpleReferenceCounter)switchingClients;
- (NSLock)bluetoothInitBlockLock;
- (NSMapTable)assertionToAssertionInfo;
- (NSMapTable)clientProxyToAssertionInfo;
- (NSMutableArray)bluetoothInitBlocks;
- (NSMutableDictionary)bluetoothIDToPairingID;
- (NSMutableDictionary)clientAssertionIDToAssertionInfo;
- (NSMutableDictionary)deviceDiscoveryDates;
- (NSMutableSet)bluetoothDiscoveryEventDedupe;
- (NSMutableSet)outstandingBluetoothConnectRequests;
- (NSMutableSet)waitForBridgeCompletedPairingIDs;
- (NSNumber)chipIDOfActiveDevice;
- (NSNumber)lastDaemonState;
- (NSObject)mcConnectionSettingsChangedNotificationToken;
- (NSString)pairingClientPhase;
- (NSUUID)bluetoothIsScanningToMatchThisDeviceID;
- (NSUUID)lastActivePairingIDThatFailed;
- (NSUUID)mirrorOfActiveDeviceID;
- (NSUUID)queuedNotIsPairedDeviceIDToMarkIsSetup;
- (OS_dispatch_queue)chipIDOfActiveDeviceQueue;
- (OS_dispatch_queue)pairingQueue;
- (OS_dispatch_source)historyPurgeWorkingSetTimer;
- (OS_dispatch_source)mcDebounceSource;
- (OS_dispatch_source)scheduledTimer;
- (OS_os_transaction)altAccountOSTransaction;
- (id)IDSGetPairedDevices;
- (id)_bluetoothIDFromPairingID:(id)a3;
- (id)_bluetoothIDOfActiveDevice;
- (id)_deviceFromIDSBTUUID:(id)a3;
- (id)_migrationReporter;
- (id)_pathToNanoRegistryStateDirectory;
- (id)_resolveIsSetupNumberForDevice:(id)a3;
- (id)activeDeviceAssertions;
- (id)dumpStateGivenCachedHistoryIndex:(unint64_t)a3;
- (id)getOOBKey;
- (id)getTrafficClassifiersForCompatibilityState:(unsigned __int16)a3;
- (id)legacyUnpairTriggerFileContents;
- (id)localizedString:(id)a3;
- (id)termsAcknowledgementServiceForAltAccount;
- (id)termsAcknowledgementServiceGetCloudObject;
- (id)termsAcknowledgementServiceGetRemoteObject;
- (id)unpairReasonString:(unint64_t)a3;
- (id)unpairTriggerFileContents;
- (int)activeDeviceChipIDNotifyToken;
- (int)getNotifyTokenWithName:(id)a3;
- (int64_t)lastDiscoveryPurgeSeconds;
- (int64_t)maxPairingCompatibilityVersion;
- (int64_t)minPairingCompatibilityVersion;
- (int64_t)mirrorOfPairedDeviceCount;
- (int64_t)pairingVersionFromAdvertisedName:(id)a3;
- (int64_t)pushingReferenceCounter;
- (int64_t)receivedPropertiesTransactionRefCounter;
- (os_unfair_lock_s)lastCallerLock;
- (os_unfair_lock_s)lastStatusCodeCacheLock;
- (os_unfair_lock_s)pairingQueueWriteLock;
- (unint64_t)lastStatusCodeCache;
- (unint64_t)readNotifyToken:(int)a3;
- (void)_archiveDevices:(id)a3 withCollection:(id)a4;
- (void)_beginNetworkRelayDiscovery;
- (void)_cancelScheduleTimerOnQueue:(id)a3;
- (void)_deleteSharingPathWithPairingID:(id)a3;
- (void)_forceMigrationSync:(id)a3 withCollection:(id)a4;
- (void)_isIDSReady;
- (void)_markDeviceIsSetupWhereApplicable:(id)a3 bypassIsSetupNoCheck:(BOOL)a4;
- (void)_notifyClients;
- (void)_onRestartMarkPairedDevicesIsSetup:(id)a3;
- (void)_queueMarkDeviceIsSetup:(id)a3;
- (void)_scheduleTimerOnQueue:(id)a3 afterDelay:(double)a4 block:(id)a5;
- (void)_setBridgeBadgeWithCollection:(id)a3;
- (void)_transactionCoordinatorHasBecomeIdle;
- (void)_updateActiveFlag:(id)a3 andPost:(BOOL)a4;
- (void)_updateCompatibilityStateForDeviceID:(id)a3 withDeviceCollection:(id)a4;
- (void)_updateCompatibilityStateForDeviceID:(id)a3 withDeviceCollection:(id)a4 oldCompatibilityState:(id)a5 newCompatibilityState:(id)a6;
- (void)_updateIsSetupPropertyForNewlyPairedDevice:(id)a3;
- (void)_updateNetworkRelayIdentifierForDevice:(id)a3;
- (void)_updateNetworkRelayIdentifierForDevicesInCollection:(id)a3;
- (void)_updatePairedDevicePropertiesFromIDSDevice:(id)a3 completion:(id)a4;
- (void)_upsertDeviceDiscoveredBy:(unint64_t)a3 pairingID:(id)a4 advertisedName:(id)a5 bluetoothDeviceID:(id)a6 rssiValue:(int64_t)a7 withBlock:(id)a8;
- (void)_xpcWaitForWatchPairingExtendedMetadataForAdvertisedName:(id)a3 completion:(id)a4;
- (void)abortPairingReason:(id)a3 proxy:(id)a4 withBlock:(id)a5;
- (void)ackXPCEvents;
- (void)allocateDictionaries;
- (void)areWePairedOrPairing:(id)a3;
- (void)assertionDescription:(id)a3;
- (void)assertionFactoryDidBecomeIdle:(id)a3;
- (void)beginDiscovery:(BOOL)a3 withDeviceIDToDiscover:(id)a4;
- (void)broadcastActiveDeviceChipID:(id)a3 from:(id)a4;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)checkAndDisableStandAloneMode;
- (void)checkForWatchNeedsGraduation:(id)a3;
- (void)checkLaunchNotificationsSetup;
- (void)cleanupPairingStoreWithCompletion:(id)a3;
- (void)clearMagicSwitchAdvertisingIdentifierSeedIfNeeded;
- (void)createDeviceFromBluetoothDiscoveryWithAdvertisementData:(id)a3 withBluetoothPeer:(id)a4 withRSSI:(id)a5 withBlock:(id)a6;
- (void)createDeviceFromBluetoothPairRequestWithBluetoothPeer:(id)a3 advertisedName:(id)a4 withBlock:(id)a5;
- (void)createDeviceFromNetworkRelayDiscoveryWithAdvertisementName:(id)a3 bluetoothIdentifier:(id)a4 withRSSI:(id)a5 withBlock:(id)a6;
- (void)createUnpairTransactionsWithCompletion:(id)a3;
- (void)dealloc;
- (void)debounceOnQueue:(id)a3 block:(id)a4;
- (void)deleteLocalPairingStore:(id)a3 withCompletion:(id)a4;
- (void)deleteUnexpectedIDSPairedDevicesWithCompletion:(id)a3;
- (void)deviceHasUnpairedBluetooth:(id)a3;
- (void)discoveredCandidateName:(id)a3 bluetoothIdentifier:(id)a4;
- (void)enqueueSetLastPairedDeviceTransactionWithCompletion:(id)a3;
- (void)enterCompatibilityState:(unsigned __int16)a3 withDeviceID:(id)a4 withCompletion:(id)a5;
- (void)forceEndDiscovery;
- (void)getAdvertisedNameFromDeviceID:(id)a3 withCompletion:(id)a4;
- (void)getCanPairAnotherDeviceWithCompletion:(id)a3;
- (void)getEnsureActiveDeviceWithCompletion:(id)a3;
- (void)getPairedPairedPairingIDForBluetoothID:(id)a3 completion:(id)a4;
- (void)getPairedPairingIDForBluetoothID:(id)a3 completion:(id)a4;
- (void)handleDeadPairingClient:(id)a3;
- (void)idsConnectivityTimeout;
- (void)idsSendProperties:(id)a3 thisIsAllOfThem:(BOOL)a4;
- (void)initBluetoothWithBlock:(id)a3;
- (void)initIDSService:(Class)a3 block:(id)a4;
- (void)initNetworkRelayPairerWithBlock:(id)a3;
- (void)initializeAllIDSChannelsBlock:(id)a3;
- (void)initializeTrafficClassBlock:(id)a3;
- (void)initiateSyncAfterSoftwareUpdateForDevice:(id)a3;
- (void)invalidateIDSChannels;
- (void)keychainSyncStatusDidChange:(BOOL)a3;
- (void)lastPairedDeviceWithBlock:(id)a3;
- (void)localMonitor:(id)a3 propertiesDidChange:(id)a4 thisIsAllOfThem:(BOOL)a5;
- (void)logIfVersionsAreOverridden;
- (void)lostCandidateWithName:(id)a3;
- (void)normalizeDaemonStateWithBlock:(id)a3;
- (void)nuke:(id)a3 completion:(id)a4;
- (void)postFirstUnlockInitBlock:(id)a3;
- (void)preFirstUnlockInitCompletion:(id)a3;
- (void)presentWatchWasUpdatedAlertIfNeededForNewBuildVersion:(id)a3 oldBuildVersion:(id)a4;
- (void)proxyWillBeginAdvertising:(id)a3;
- (void)proxyWillBeginDiscovering:(id)a3;
- (void)proxyWillEndAdvertising:(id)a3;
- (void)proxyWillEndDiscovering:(id)a3;
- (void)purgeDiscoveredDevices:(id)a3;
- (void)purgeIDSPairedDevicesExceptFor:(id)a3 withQueue:(id)a4 andCompletion:(id)a5;
- (void)refreshPropertyCache;
- (void)registerManagedConfigurationChanged:(id)a3;
- (void)remoteObject:(id)a3 isConnected:(BOOL)a4;
- (void)remoteObject:(id)a3 receivedAddTermsEvent:(id)a4 fromIDSBTUUID:(id)a5 responseBlock:(id)a6;
- (void)remoteObject:(id)a3 receivedCheckTermsEvent:(id)a4 fromIDSBTUUID:(id)a5 responseBlock:(id)a6;
- (void)remoteObject:(id)a3 receivedMigratedAwayWithAdvertisedName:(id)a4;
- (void)remoteObject:(id)a3 receivedMigrationRequestWithShouldCancel:(BOOL)a4 responseBlock:(id)a5;
- (void)remoteObject:(id)a3 receivedPropertyChanges:(id)a4 isAllProperties:(BOOL)a5 fromIDSBTUUID:(id)a6;
- (void)remoteObject:(id)a3 receivedPropertyRequestWithRequestIdentifier:(id)a4 fromIDSBTUUID:(id)a5;
- (void)remoteObject:(id)a3 receivedSystemVersionBroadcast:(id)a4 fromDeviceID:(id)a5;
- (void)remoteObject:(id)a3 receivedTinkerMigrationRequestWithShouldCancel:(BOOL)a4 responseBlock:(id)a5;
- (void)remoteObject:(id)a3 receivedUnpairRequestWithAdvertisedName:(id)a4 shouldObliterate:(BOOL)a5 shouldBrick:(BOOL)a6 shouldPreserveESim:(BOOL)a7 withPairingFailureCode:(id)a8 withAbortReason:(id)a9 withRequestIdentifier:(id)a10 fromIDSBTUUID:(id)a11;
- (void)remoteObjectDevicesChanged:(id)a3;
- (void)remoteObjectIDSServiceAvailable:(id)a3 withIDSDevice:(id)a4;
- (void)remoteObjectReceivedWatchMigrationCompletion:(unint64_t)a3;
- (void)remoteObjectReveivedWatchMigrationMetricSessionID:(id)a3;
- (void)removeAssertionInfo:(id)a3;
- (void)removeAssertionsForProxy:(id)a3;
- (void)removeAssertionsForProxy:(id)a3 newDeviceID:(id)a4;
- (void)removeCandidateDeviceWithName:(id)a3;
- (void)removeExternalAssertionsForPairingID:(id)a3;
- (void)removeStaleDiscoveredDevices;
- (void)resetIDSConnectivityTimeout;
- (void)resetPhoneStateForNewPairing;
- (void)resetWatchStateForNewPairing;
- (void)resourceAvailabilityDidChange:(id)a3;
- (void)saveAssertionInfo:(id)a3;
- (void)sendPairingIdToActiveDevice:(id)a3;
- (void)sendRemoteUnpairingDidBeginNotificationWithBlock:(id)a3;
- (void)sendXPCDeviceNeedsPasscodeMessage:(id)a3 passcode:(id)a4;
- (void)sendXPCOOBKeyChanged:(id)a3;
- (void)setActiveDeviceChipIDNotifyToken:(int)a3;
- (void)setAdvertisingClients:(id)a3;
- (void)setAlreadyRepairedTheSwitch:(BOOL)a3;
- (void)setAltAccountOSTransaction:(id)a3;
- (void)setAssertionToAssertionInfo:(id)a3;
- (void)setBackupManager:(id)a3;
- (void)setBluetoothDiscoveryEventDedupe:(id)a3;
- (void)setBluetoothIDToPairingID:(id)a3;
- (void)setBluetoothInitBlockLock:(id)a3;
- (void)setBluetoothInitBlocks:(id)a3;
- (void)setBluetoothIsScanning:(BOOL)a3;
- (void)setBluetoothIsScanningToMatchThisDeviceID:(id)a3;
- (void)setCentral:(id)a3;
- (void)setChipIDOfActiveDevice:(id)a3;
- (void)setChipIDOfActiveDeviceQueue:(id)a3;
- (void)setClientAssertionIDToAssertionInfo:(id)a3;
- (void)setClientProxyToAssertionInfo:(id)a3;
- (void)setClientRequestedSuspensionOfMonitoringPairingClientBeyondNewWatchPairingTransactionComplete:(BOOL)a3;
- (void)setConnectivityPublisher:(id)a3;
- (void)setDeviceDiscoveryDates:(id)a3;
- (void)setDidRestoreFromBackup:(BOOL)a3;
- (void)setDiscoveringClients:(id)a3;
- (void)setDiscoveryTransaction:(id)a3;
- (void)setDumper:(id)a3;
- (void)setGizmoSetCompatibilityStateTimer:(id)a3;
- (void)setHasClassAFile:(BOOL)a3;
- (void)setHealthKitLastChanceSyncInProgress:(BOOL)a3;
- (void)setHistoryPurgeWorkingSetTimer:(id)a3;
- (void)setIDSTrafficClassifiersForActiveDeviceWithNewCompatibilityState:(id)a3;
- (void)setIdsConnectivityTimedOut:(BOOL)a3;
- (void)setIdsConnectivityTimer:(id)a3;
- (void)setInitRemoteProperties:(BOOL)a3;
- (void)setIsNotCachingCrashMonitoring:(BOOL)a3;
- (void)setKeymaster:(id)a3;
- (void)setLastActivePairingIDThatFailed:(id)a3;
- (void)setLastCaller:(id)a3;
- (void)setLastCallerLock:(os_unfair_lock_s)a3;
- (void)setLastDaemonState:(id)a3;
- (void)setLastDiscoveryPurgeSeconds:(int64_t)a3;
- (void)setLastStatusCodeCache:(unint64_t)a3;
- (void)setLastStatusCodeCacheLock:(os_unfair_lock_s)a3;
- (void)setLastWatchPusher:(id)a3;
- (void)setLocalProperties:(id)a3;
- (void)setMcConnection:(id)a3;
- (void)setMcConnectionSettingsChangedNotificationToken:(id)a3;
- (void)setMcDebounceSource:(id)a3;
- (void)setMightNeedToKickOffPairedSyncAfterLaunch:(BOOL)a3;
- (void)setMigrationActivity:(id)a3;
- (void)setMigrationVote:(id)a3;
- (void)setMonitoringPairingClientBeyondNewWatchPairingTransactionComplete:(BOOL)a3;
- (void)setNetworkRelayPairerIsScanning:(BOOL)a3;
- (void)setOutstandingBluetoothConnectRequests:(id)a3;
- (void)setPairingClientCrashMonitoringCachedValue:(BOOL)a3;
- (void)setPairingClientCrashMonitoringProxy:(id)a3;
- (void)setPairingClientCrashMonitoringTransaction:(id)a3;
- (void)setPairingClientPhase:(id)a3;
- (void)setPairingClientProxy:(id)a3;
- (void)setPairingClients:(id)a3;
- (void)setPairingQueueIsSuspended:(BOOL)a3;
- (void)setPairingQueueWriteLock:(os_unfair_lock_s)a3;
- (void)setPusherPipe:(id)a3;
- (void)setPusherPipeManager:(id)a3;
- (void)setPushingClients:(id)a3;
- (void)setPushingReferenceCounter:(int64_t)a3;
- (void)setQueuedNotIsPairedDeviceIDToMarkIsSetup:(id)a3;
- (void)setReadyStatusCodeVote:(id)a3;
- (void)setReceivedPropertiesTransaction:(id)a3;
- (void)setReceivedPropertiesTransactionRefCounter:(int64_t)a3;
- (void)setScheduledTimer:(id)a3;
- (void)setSentPropertiesFlag:(BOOL)a3;
- (void)setServiceRegistry:(id)a3;
- (void)setStatusCode:(unint64_t)a3 InCollection:(id)a4;
- (void)setSwitchingClients:(id)a3;
- (void)setUpClientReferenceCounters;
- (void)setUpHistoryCompletionBlocks;
- (void)setWaitForBridgeCompletedPairingIDs:(id)a3;
- (void)setWatchPusher:(id)a3;
- (void)setWatchPusherTransaction:(id)a3;
- (void)setupSignalHandlers;
- (void)sigTerm;
- (void)sigUsr1;
- (void)startIDSConnectivityTimeout;
- (void)startPushing;
- (void)statusCodeManager:(id)a3 electionOutcomeChanged:(unint64_t)a4;
- (void)stopPushing;
- (void)syncPairingClientCrashMonitoringCache;
- (void)termsAcknowledgementServiceGetDeviceMirrorFromDeviceID:(id)a3 block:(id)a4;
- (void)termsAcknowledgementServiceGetNRIDFromBTID:(id)a3 block:(id)a4;
- (void)transactionCoordinatorHasBecomeIdle;
- (void)unpairDeviceWithPairingID:(id)a3 obliterationString:(id)a4 shouldBrick:(id)a5 storeUnpair:(id)a6 migrationUnpair:(id)a7 shouldPreserveESim:(id)a8 pairingReport:(id)a9 remoteUnpairRequestUUID:(id)a10 shouldConnectionWithDevice:(BOOL)a11;
- (void)updateDeviceID:(id)a3 withProperties:(id)a4 withCompletion:(id)a5;
- (void)updateFromBTState;
- (void)updateFromBTState:(int64_t)a3;
- (void)updateIsPairedTelemetryKey;
- (void)updateMirrorWithCollection:(id)a3;
- (void)updateNotifyToken:(int)a3 withValue:(unint64_t)a4 withNotificationName:(id)a5;
- (void)updateNotifyToken:(int)a3 withValue:(unint64_t)a4 withNotificationName:(id)a5 alwaysPost:(BOOL)a6;
- (void)updatePairingSessionIdIfNeededForActiveDevice;
- (void)updateShouldMonitorProxy:(id)a3;
- (void)updateTrafficClass;
- (void)voidIDSService:(Class)a3;
- (void)xpcAbortPairingReason:(id)a3 withBlock:(id)a4;
- (void)xpcActiveDeviceAssertions:(id)a3;
- (void)xpcApplyDiff:(id)a3 withSecureProperties:(id)a4 block:(id)a5;
- (void)xpcBeginDiscoveryWithBlock:(id)a3;
- (void)xpcBeginMigrationWithCompletion:(id)a3;
- (void)xpcBeginMigrationWithDeviceID:(id)a3 completion:(id)a4;
- (void)xpcBeginMigrationWithDeviceID:(id)a3 passcode:(id)a4 withBlock:(id)a5;
- (void)xpcBooleanForInternalPreference:(id)a3 withBlock:(id)a4;
- (void)xpcCheckIfFlaggedForRecoveryWithCompletion:(id)a3;
- (void)xpcClearRecoveryFlagWithCompletion:(id)a3;
- (void)xpcClearWatchNeedsGraduation:(id)a3;
- (void)xpcClientInfo:(id)a3;
- (void)xpcCompanionOOBDiscoverAndPairWithName:(id)a3 withOutOfBandPairingKey:(id)a4 withOptions:(id)a5 operationHasBegun:(id)a6;
- (void)xpcCompanionPasscodePairWithDeviceID:(id)a3 withOptions:(id)a4 operationHasBegun:(id)a5;
- (void)xpcDeviceIDAtSwitchIndex:(unsigned int)a3 withBlock:(id)a4;
- (void)xpcEndDiscoveryWithBlock:(id)a3;
- (void)xpcEnterCompatibilityState:(unsigned __int16)a3 withDeviceID:(id)a4;
- (void)xpcFakePairedSyncIsCompleteWithCompletion:(id)a3;
- (void)xpcFakePairedSyncStartWithCompletion:(id)a3;
- (void)xpcGetChangeHistoryWithBlock:(id)a3;
- (void)xpcGetDeviceCollectionWithBlock:(id)a3;
- (void)xpcGetDiffSinceTokenValue:(unint64_t)a3 getSecureProperties:(BOOL)a4 withBlock:(id)a5;
- (void)xpcGetInitialSyncCompletedForPairingID:(id)a3 completion:(id)a4;
- (void)xpcGetLastMigrationRequestPhoneNameWithCompletion:(id)a3;
- (void)xpcGetLastSwitchIndex:(id)a3;
- (void)xpcGetMigrationCountForPairingID:(id)a3 completion:(id)a4;
- (void)xpcGetMigrationPairingCharacteristicReadDataWithCompletion:(id)a3;
- (void)xpcGizmoOOBAdvertiseAndPairWithName:(id)a3 operationHasBegun:(id)a4;
- (void)xpcGizmoPasscodeAdvertiseAndPairWithName:(id)a3 operationHasBegun:(id)a4;
- (void)xpcInvalidateSwitchAssertionWithIdentifier:(id)a3 block:(id)a4;
- (void)xpcIsAssertionActive:(id)a3 withCompletion:(id)a4;
- (void)xpcIsPhoneReadyToMigrateDevice:(id)a3 withCompletion:(id)a4;
- (void)xpcLongForInternalPreference:(id)a3 withBlock:(id)a4;
- (void)xpcNotifyActivationCompleted:(id)a3 withSuccess:(BOOL)a4;
- (void)xpcNotifyPasscode:(id)a3 withDeviceID:(id)a4;
- (void)xpcPairWithSimulator:(id)a3 withCompletion:(id)a4;
- (void)xpcPairingClientDidEnterPhase:(id)a3 withBlock:(id)a4;
- (void)xpcPairingClientSetAltAccountName:(id)a3 altDSID:(id)a4 forPairingID:(id)a5 completion:(id)a6;
- (void)xpcPairingClientSetPairingParentName:(id)a3 pairingParentAltDSID:(id)a4 forPairingID:(id)a5 completion:(id)a6;
- (void)xpcPingActiveGizmoWithPriority:(int)a3 withMessageSize:(int64_t)a4 withBlock:(id)a5;
- (void)xpcPutMigrationChallengeCharacteristicWriteData:(id)a3 completion:(id)a4;
- (void)xpcResumePairingClientCrashMonitoring:(id)a3;
- (void)xpcRetrieveSecureProperties:(id)a3 block:(id)a4;
- (void)xpcRetriggerUnpairInfoDialogWithBlock:(id)a3;
- (void)xpcScanForMigratableWatchesWithBlock:(id)a3;
- (void)xpcServer:(id)a3 proxyDidDisconnect:(id)a4;
- (void)xpcServer:(id)a3 proxyDidResume:(id)a4;
- (void)xpcServer:(id)a3 proxyDidSuspend:(id)a4;
- (void)xpcSetMigrationConsented:(BOOL)a3 forDeviceID:(id)a4 withBlock:(id)a5;
- (void)xpcStartWatchSetupPushWithBlock:(id)a3;
- (void)xpcStopWatchSetupPushWithBlock:(id)a3;
- (void)xpcSubmitAlbertPairingReport:(id)a3;
- (void)xpcSubmitRTCPairingMetricForMetricID:(id)a3 withSuccess:(id)a4;
- (void)xpcSubmitServerRequestReportWithRequestType:(id)a3 duration:(double)a4 errorCode:(unsigned int)a5 block:(id)a6;
- (void)xpcSuspendPairingClientCrashMonitoring:(id)a3;
- (void)xpcSwitchActiveDeviceWithDeviceID:(id)a3 isMagicSwitch:(BOOL)a4 operationHasCompleted:(id)a5;
- (void)xpcSwitchActiveDeviceWithDeviceID:(id)a3 withAssertionHandler:(id)a4;
- (void)xpcSwitchIndex:(id)a3;
- (void)xpcSwitchToSimulator:(id)a3 withCompletion:(id)a4;
- (void)xpcTriggerTailspinFrom:(unint64_t)a3 forApp:(id)a4;
- (void)xpcUnpairWithDeviceID:(id)a3 withOptions:(id)a4 operationHasBegun:(id)a5;
- (void)xpcUnpairWithSimulator:(id)a3 withCompletion:(id)a4;
- (void)xpcUpdateWatchBuddyStage:(unsigned int)a3 forPairingID:(id)a4;
- (void)xpcWaitForWatchPairingExtendedMetadataForAdvertisedName:(id)a3 completion:(id)a4;
- (void)xpcWatchBuddyCompletedSetupSteps:(id)a3;
- (void)xpcWatchNeedsGraduation:(id)a3;
@end

@implementation NRPairingDaemon

+ (id)sharedInstance
{
  if (qword_1001A10C0 != -1) {
    dispatch_once(&qword_1001A10C0, &stru_1001662D8);
  }
  v2 = (void *)qword_1001A10B8;

  return v2;
}

- (NRPairingDaemon)init
{
  v26.receiver = self;
  v26.super_class = (Class)NRPairingDaemon;
  v2 = [(NRPairingDaemon *)&v26 init];
  if (v2)
  {
    v3 = nr_daemon_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      v5 = nr_daemon_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[NRRegistryDaemon init]", buf, 2u);
      }
    }
    v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    waitForBridgeCompletedPairingIDs = v2->_waitForBridgeCompletedPairingIDs;
    v2->_waitForBridgeCompletedPairingIDs = v6;

    v8 = +[NRFeatureFlags sharedInstance];
    if ([v8 networkRelayPairing])
    {
      v2->_useNetworkRelayPairing = 1;
    }
    else
    {
      v9 = +[NRSystemProperties sharedInstance];
      v2->_useNetworkRelayPairing = [v9 isVirtualDevice];
    }
    objc_initWeak(&location, v2);
    *(void *)buf = 0;
    v20 = buf;
    uint64_t v21 = 0x3032000000;
    v22 = sub_100023880;
    v23 = sub_100023890;
    id v24 = +[NROSTransaction transactionWithName:@"init"];
    v2->_lastCallerLock._os_unfair_lock_opaque = 0;
    v2->_pairingQueueWriteLock._os_unfair_lock_opaque = 0;
    [(NRPairingDaemon *)v2 setPairingQueueIsSuspended:1];
    v2->_lastStatusCodeCacheLock._os_unfair_lock_opaque = 0;
    [(NRPairingDaemon *)v2 updateIsPairedTelemetryKey];
    v10 = +[NRQueue delayPairingRequestQueue];
    [v10 suspend];

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100023898;
    v15[3] = &unk_1001663A0;
    v16 = v2;
    objc_copyWeak(&v18, &location);
    v17 = buf;
    [(NRPairingDaemon *)v16 grabRegistryWithReadBlock:v15];
    objc_destroyWeak(&v18);

    _Block_object_dispose(buf, 8);
    objc_destroyWeak(&location);
  }
  v11 = nr_daemon_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    v13 = nr_daemon_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[NRRegistryDaemon init] Complete", buf, 2u);
    }
  }
  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NRPairingDaemon;
  [(NRPairingDaemon *)&v2 dealloc];
}

- (NRPairingReport)pairingReport
{
  return 0;
}

- (void)xpcBeginDiscoveryWithBlock:(id)a3
{
  id v5 = a3;
  [(NRPairingDaemon *)self beginDiscovery:1 withDeviceIDToDiscover:0];
  BOOL v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    BOOL v4 = v5;
  }
}

- (void)xpcEndDiscoveryWithBlock:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  [(NRPairingDaemon *)self forceEndDiscovery];
  v4[2]();
}

+ (Class)proxyClass
{
  return (Class)objc_opt_class();
}

+ (void)updateActiveFlag:(BOOL)a3 andPost:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (qword_1001A10C8 != -1) {
    dispatch_once(&qword_1001A10C8, &stru_1001663C0);
  }
  if (dword_10019FD98 != -1)
  {
    if (v5) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 1;
    }
    v7 = nr_daemon_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v8)
    {
      v9 = nr_daemon_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = "not ";
        int v11 = 138412802;
        if (v4) {
          v10 = "";
        }
        uint64_t v12 = NRPairedDeviceRegistryWatchDidBecomeActiveDarwinNotification;
        __int16 v13 = 2048;
        uint64_t v14 = v6;
        __int16 v15 = 2080;
        v16 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "NRPairingDaemon updating %@ to %ld and %sposting", (uint8_t *)&v11, 0x20u);
      }
    }
    notify_set_state(dword_10019FD98, v6);
    if (v4) {
      notify_post((const char *)[NRPairedDeviceRegistryWatchDidBecomeActiveDarwinNotification UTF8String]);
    }
  }
}

- (void)setLastStatusCodeCache:(unint64_t)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002427C;
  v4[3] = &unk_100166120;
  p_lastStatusCodeCacheLock = &self->_lastStatusCodeCacheLock;
  v4[4] = self;
  v4[5] = a3;
  os_unfair_lock_lock_with_options();
  sub_10002427C((uint64_t)v4);
  os_unfair_lock_unlock(p_lastStatusCodeCacheLock);
}

- (unint64_t)lastStatusCodeCache
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  p_lastStatusCodeCacheLock = &self->_lastStatusCodeCacheLock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v7 = sub_100024384;
  BOOL v8 = &unk_100165840;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock_with_options();
  v7((uint64_t)v3);

  os_unfair_lock_unlock(p_lastStatusCodeCacheLock);
  unint64_t v4 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v4;
}

- (void)setUpHistoryCompletionBlocks
{
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100024468;
  v4[3] = &unk_100165CE8;
  objc_copyWeak(&v5, &location);
  id v3 = [(NRPairingDaemon *)self addDiffObserverWithWriteBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_updateActiveFlag:(id)a3 andPost:(BOOL)a4
{
  BOOL v4 = a4;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = a3;
  uint64_t v6 = (uint64_t)[v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = [v5 objectForKeyedSubscript:*(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10];
        if (([v9 isArchived] & 1) == 0
          && (([v9 isPaired] & 1) != 0 || objc_msgSend(v9, "isActive")))
        {

          uint64_t v6 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v6 = (uint64_t)[v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  +[NRPairingDaemon updateActiveFlag:v6 andPost:v4];
}

- (void)_setBridgeBadgeWithCollection:(id)a3
{
  id v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v16;
    uint64_t v8 = _NRDevicePropertyCompatibilityState;
    do
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        long long v10 = [v3 objectForKeyedSubscript:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        long long v11 = [v10 objectForKeyedSubscript:v8];
        long long v12 = [v11 value];

        if ([v10 isPaired]
          && ([v10 isArchived] & 1) == 0
          && [v12 integerValue] == (id)2)
        {
          ++v6;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v13 = [objc_alloc((Class)UISApplicationState) initWithBundleIdentifier:@"com.apple.Bridge"];
  uint64_t v14 = +[NSNumber numberWithInteger:v6];
  [v13 setBadgeValue:v14];
}

- (void)setIDSTrafficClassifiersForActiveDeviceWithNewCompatibilityState:(id)a3
{
  id v4 = a3;
  id v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

  if (v6)
  {
    uint64_t v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000F72DC();
    }
  }
  if (v4)
  {
    uint64_t v8 = objc_opt_new();
    v9 = -[NRPairingDaemon getTrafficClassifiersForCompatibilityState:](self, "getTrafficClassifiersForCompatibilityState:", (unsigned __int16)[v4 integerValue]);
    if ([v4 integerValue] == (id)2) {
      [v8 setShouldDropUnmatchingTraffic:1];
    }
    [v8 setTrafficClasses:v9];
    long long v10 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
    [v10 updateTrafficClassesWithClasses:v8];
    unsigned __int16 v11 = (unsigned __int16)[v4 integerValue];
    long long v12 = [(NRPairingDaemon *)self _bluetoothIDOfActiveDevice];
    [v10 sendPairingModeRequest:v11 toIDSBTUUID:v12 withSentBlock:0];
  }
}

- (void)_deleteSharingPathWithPairingID:(id)a3
{
  id v4 = a3;
  id v5 = [(NRPairingDaemon *)self collection];
  BOOL v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [v6 objectForKeyedSubscript:NRDevicePropertyLocalPairingDataStorePath];
  uint64_t v8 = [v7 value];

  if (v8)
  {
    v9 = [v8 stringByAppendingPathComponent:@"com.apple.sharing"];
    long long v10 = nr_daemon_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      long long v12 = nr_daemon_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Deleting %@", buf, 0xCu);
      }
    }
    id v13 = +[NSFileManager defaultManager];
    id v18 = 0;
    [v13 removeItemAtPath:v9 error:&v18];
    id v14 = v18;

    if (v14)
    {
      long long v15 = nr_daemon_log();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

      if (v16)
      {
        long long v17 = nr_daemon_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_1000F7358();
        }
      }
    }
  }
}

- (BOOL)_hasUpdateModeDevicesInCollection:(id)a3
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
    uint64_t v7 = _NRDevicePropertyCompatibilityState;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        v9 = [v3 objectForKeyedSubscript:*(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17];
        if ([v9 isPaired] && objc_msgSend(v9, "isActive"))
        {
          long long v10 = [v9 objectForKeyedSubscript:v7];
          BOOL v11 = [v10 value];

          if (v11 && [v11 integerValue] == (id)2)
          {

            BOOL v12 = 1;
            goto LABEL_15;
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_15:

  id v13 = nr_daemon_log();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  if (v14)
  {
    long long v15 = nr_daemon_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Collection has device in update mode: %{BOOL}d", buf, 8u);
    }
  }
  return v12;
}

- (BOOL)_isBridgeForeground
{
  objc_super v2 = +[RBSProcessPredicate predicateMatchingBundleIdentifier:@"com.apple.Bridge"];
  id v10 = 0;
  id v3 = +[RBSProcessHandle handleForPredicate:v2 error:&v10];
  id v4 = v10;

  if (v4) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (!v5)
  {
    uint64_t v7 = [v3 currentState];
    LOBYTE(v8) = [v7 taskState] == 4;
LABEL_10:

    goto LABEL_11;
  }
  uint64_t v6 = nr_daemon_log();
  BOOL v8 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

  if (v8)
  {
    uint64_t v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000F73C8();
    }
    LOBYTE(v8) = 0;
    goto LABEL_10;
  }
LABEL_11:

  return v8;
}

- (void)saveAssertionInfo:(id)a3
{
  id v22 = a3;
  id v4 = [v22 clientProxy];
  BOOL v5 = [v22 pairingID];
  [(NRPairingDaemon *)self removeAssertionsForProxy:v4 newDeviceID:v5];

  assertionToAssertionInfo = self->_assertionToAssertionInfo;
  if (!assertionToAssertionInfo)
  {
    uint64_t v7 = +[NSMapTable strongToStrongObjectsMapTable];
    BOOL v8 = self->_assertionToAssertionInfo;
    self->_assertionToAssertionInfo = v7;

    v9 = +[NSMapTable strongToStrongObjectsMapTable];
    clientProxyToAssertionInfo = self->_clientProxyToAssertionInfo;
    self->_clientProxyToAssertionInfo = v9;

    BOOL v11 = +[NSMutableDictionary dictionary];
    clientAssertionIDToAssertionInfo = self->_clientAssertionIDToAssertionInfo;
    self->_clientAssertionIDToAssertionInfo = v11;

    assertionToAssertionInfo = self->_assertionToAssertionInfo;
  }
  id v13 = [v22 assertion];
  [(NSMapTable *)assertionToAssertionInfo setObject:v22 forKey:v13];

  BOOL v14 = self->_clientProxyToAssertionInfo;
  long long v15 = [v22 clientProxy];
  BOOL v16 = [(NSMapTable *)v14 objectForKey:v15];

  if (!v16)
  {
    BOOL v16 = +[NSMutableSet set];
  }
  [v16 addObject:v22];
  long long v17 = self->_clientProxyToAssertionInfo;
  long long v18 = [v22 clientProxy];
  [(NSMapTable *)v17 setObject:v16 forKey:v18];

  long long v19 = self->_clientAssertionIDToAssertionInfo;
  long long v20 = [v22 assertionID];
  [(NSMutableDictionary *)v19 setObject:v22 forKey:v20];

  uint64_t v21 = [v22 clientProxy];
  [(NRPairingDaemon *)self updateShouldMonitorProxy:v21];
}

- (void)removeAssertionInfo:(id)a3
{
  id v18 = a3;
  id v4 = [v18 assertion];
  [v4 invalidate];

  assertionToAssertionInfo = self->_assertionToAssertionInfo;
  uint64_t v6 = [v18 assertion];
  [(NSMapTable *)assertionToAssertionInfo removeObjectForKey:v6];

  clientProxyToAssertionInfo = self->_clientProxyToAssertionInfo;
  BOOL v8 = [v18 clientProxy];
  v9 = [(NSMapTable *)clientProxyToAssertionInfo objectForKey:v8];

  if ([v9 containsObject:v18])
  {
    [v9 removeObject:v18];
  }
  else
  {
    id v10 = [v18 clientBlock];

    if (v10)
    {
      BOOL v11 = [v18 clientBlock];
      BOOL v12 = nrGetPairingError();
      ((void (**)(void, void *, void))v11)[2](v11, v12, 0);

      [v18 setClientBlock:0];
    }
  }
  if (![v9 count])
  {
    id v13 = self->_clientProxyToAssertionInfo;
    BOOL v14 = [v18 clientProxy];
    [(NSMapTable *)v13 removeObjectForKey:v14];
  }
  clientAssertionIDToAssertionInfo = self->_clientAssertionIDToAssertionInfo;
  BOOL v16 = [v18 assertionID];
  [(NSMutableDictionary *)clientAssertionIDToAssertionInfo removeObjectForKey:v16];

  long long v17 = [v18 clientProxy];
  [(NRPairingDaemon *)self updateShouldMonitorProxy:v17];
}

- (void)removeAssertionsForProxy:(id)a3
{
}

- (void)removeAssertionsForProxy:(id)a3 newDeviceID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v20 = v6;
  [(NSMapTable *)self->_clientProxyToAssertionInfo objectForKey:v6];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v19 = long long v24 = 0u;
  id v8 = [v19 copy];
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        BOOL v14 = [v13 pairingID];
        unsigned __int8 v15 = [v14 isEqual:v7];

        if ((v15 & 1) == 0)
        {
          BOOL v16 = nr_daemon_log();
          BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

          if (v17)
          {
            id v18 = nr_daemon_log();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              sub_1000F7438((uint64_t)v25, (uint64_t)v13);
            }
          }
          [(NRPairingDaemon *)self removeAssertionInfo:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v10);
  }

  [(NRPairingDaemon *)self updateShouldMonitorProxy:v20];
}

- (void)removeExternalAssertionsForPairingID:(id)a3
{
  id v4 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = [(NSMapTable *)self->_clientProxyToAssertionInfo copy];
  id v21 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v29;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = v5;
        id v6 = [(NSMapTable *)self->_clientProxyToAssertionInfo objectForKey:*(void *)(*((void *)&v28 + 1) + 8 * v5)];
        id v7 = [v6 copy];

        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = v7;
        id v8 = [v7 copy];
        id v9 = [v8 countByEnumeratingWithState:&v24 objects:v33 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v25 != v11) {
                objc_enumerationMutation(v8);
              }
              id v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
              BOOL v14 = [v13 pairingID];
              unsigned int v15 = [v14 isEqual:v4];

              if (v15)
              {
                BOOL v16 = nr_daemon_log();
                BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

                if (v17)
                {
                  id v18 = nr_daemon_log();
                  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
                    sub_1000F7438((uint64_t)v32, (uint64_t)v13);
                  }
                }
                [(NRPairingDaemon *)self removeAssertionInfo:v13];
              }
            }
            id v10 = [v8 countByEnumeratingWithState:&v24 objects:v33 count:16];
          }
          while (v10);
        }

        uint64_t v5 = v23 + 1;
      }
      while ((id)(v23 + 1) != v21);
      id v21 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v21);
  }
}

- (NRPairingProxy)lastCaller
{
  p_lastCallerLock = &self->_lastCallerLock;
  os_unfair_lock_lock(&self->_lastCallerLock);
  id v4 = self->_lastCaller;
  lastCaller = self->_lastCaller;
  self->_lastCaller = 0;

  os_unfair_lock_unlock(p_lastCallerLock);

  return v4;
}

- (void)setLastCaller:(id)a3
{
  id v4 = (NRPairingProxy *)a3;
  os_unfair_lock_lock(&self->_lastCallerLock);
  lastCaller = self->_lastCaller;
  self->_lastCaller = v4;

  os_unfair_lock_unlock(&self->_lastCallerLock);
}

- (void)xpcSwitchActiveDeviceWithDeviceID:(id)a3 withAssertionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(NRPairingDaemon *)self lastCaller];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100026B14;
  v11[3] = &unk_1001660A8;
  id v12 = v6;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v14 = self;
  id v15 = v7;
  id v8 = v7;
  id v9 = v13;
  id v10 = v6;
  [(NRPairingDaemon *)self grabRegistryWithReadBlockAsync:v11];
}

- (void)xpcInvalidateSwitchAssertionWithIdentifier:(id)a3 block:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  id v7 = a3;
  id v8 = [(NRPairingDaemon *)self lastCaller];
  id v9 = [(NSMutableDictionary *)self->_clientAssertionIDToAssertionInfo objectForKey:v7];

  id v10 = [v9 clientProxy];

  if (v10 == v8)
  {
    [(NRPairingDaemon *)self removeAssertionInfo:v9];
    v6[2](v6, 0);
  }
  else
  {
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    CFStringRef v14 = @"You don't own this assertion";
    uint64_t v11 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    uint64_t v12 = +[NSError errorWithDomain:@"com.apple.NanoRegistry" code:999 userInfo:v11];

    v6[2](v6, v12);
    id v6 = (void (**)(id, void))v12;
  }
}

- (void)xpcDeviceIDAtSwitchIndex:(unsigned int)a3 withBlock:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_1000270A8;
  v6[3] = &unk_100166260;
  unsigned int v8 = a3;
  id v7 = a4;
  id v5 = v7;
  [(NRPairingDaemon *)self grabHistoryWithReadBlock:v6];
}

- (BOOL)storeMode
{
  return CFPreferencesGetAppBooleanValue(@"store", @"com.apple.NanoRegistry", 0) != 0;
}

- (void)nuke:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  unsigned int v8 = nr_daemon_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = nr_daemon_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Nuking device %@", buf, 0xCu);
    }
  }
  if ([(NRPairingDaemon *)self storeMode])
  {
    if (v7) {
      v7[2](v7);
    }
  }
  else if (v6)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000272CC;
    v11[3] = &unk_100166510;
    id v12 = v6;
    [(NRPairingDaemon *)self grabRegistryWithWriteBlockAsync:v11];
  }
}

- (id)unpairTriggerFileContents
{
  id v3 = [(NRPairingDaemon *)self legacyUnpairTriggerFileContents];
  id v4 = [v3 mutableCopy];

  id v5 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
  id v6 = [v5 backupHash];
  if (v6)
  {
    id v7 = +[NSKeyedArchiver secureArchivedDataWithRootObject:v6];
    if (v7)
    {
      unsigned int v8 = +[NSKeyedArchiver secureArchivedDataWithRootObject:v6];
      [v4 appendData:v8];
    }
  }

  return v4;
}

- (id)legacyUnpairTriggerFileContents
{
  objc_super v2 = [@"don't delete me unless you want to unpair\n" dataUsingEncoding:4];
  id v3 = [v2 mutableCopy];

  return v3;
}

- (void)setDidRestoreFromBackup:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = nr_daemon_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = nr_daemon_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v7 = @"NO";
      if (v3) {
        CFStringRef v7 = @"YES";
      }
      int v10 = 136446466;
      uint64_t v11 = "-[NRPairingDaemon setDidRestoreFromBackup:]";
      __int16 v12 = 2114;
      CFStringRef v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s: %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  unsigned int v8 = +[NRRestoreFromBackupTracker sharedInstance];
  BOOL v9 = v8;
  if (v3) {
    [v8 stopTracking];
  }
  else {
    [v8 refresh];
  }
}

- (BOOL)didRestoreFromBackup
{
  BOOL v3 = +[NRRestoreFromBackupTracker sharedInstance];
  unsigned int v4 = [v3 isTracked];

  if (v4)
  {
    BOOL v5 = +[NRRestoreFromBackupTracker sharedInstance];
    unsigned __int8 v6 = [v5 didRestoredFromBackup];

    return v6;
  }
  else
  {
    return [(NRPairingDaemon *)self legacyDidRestoreFromBackup];
  }
}

- (BOOL)legacyDidRestoreFromBackup
{
  BOOL v3 = nr_daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    BOOL v5 = nr_daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v34 = "-[NRPairingDaemon legacyDidRestoreFromBackup]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
  unsigned __int8 v6 = +[NRDataFilePaths _pathToUnpairTriggerFile];
  CFStringRef v7 = +[NSData dataWithContentsOfFile:v6];

  if (v7)
  {
    unsigned int v8 = [(NRPairingDaemon *)self legacyUnpairTriggerFileContents];
    if ([v7 isEqual:v8])
    {
      [(NRPairingDaemon *)self setDidRestoreFromBackup:0];
      BOOL v9 = nr_daemon_log();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

      if (!v10)
      {
LABEL_22:
        BOOL v24 = 0;
LABEL_38:

        goto LABEL_39;
      }
      uint64_t v11 = nr_daemon_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "unpairTriggerFileDoesNotExist- legacy file found (match)", buf, 2u);
      }
LABEL_21:

      goto LABEL_22;
    }
    id v14 = [v7 length];
    uint64_t v15 = v14 - (unsigned char *)[v8 length];
    if (v15 < 1)
    {
      long long v25 = nr_daemon_log();
      BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

      if (!v26)
      {
LABEL_37:
        BOOL v24 = 1;
        goto LABEL_38;
      }
      uint64_t v11 = nr_daemon_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        v34 = "-[NRPairingDaemon legacyDidRestoreFromBackup]";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s: unpairTriggerFileDoesNotExist- restore date not present in trigger file", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v11 = [v7 subdataWithRange:-[NSObject length](v8, "length") v15];
      BOOL v16 = +[NSSet setWithObject:objc_opt_class()];
      BOOL v17 = +[NSKeyedUnarchiver secureUnarchiveObjectOfClasses:v16 withData:v11];

      if (v17)
      {
        id v18 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
        long long v19 = [v18 backupHash];
        unsigned int v20 = [v17 isEqual:v19];

        id v21 = nr_daemon_log();
        BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

        if (v20)
        {
          if (v22)
          {
            uint64_t v23 = nr_daemon_log();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446210;
              v34 = "-[NRPairingDaemon legacyDidRestoreFromBackup]";
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}s: unpairTriggerFileDoesNotExist- restore date match", buf, 0xCu);
            }
          }
          [(NRPairingDaemon *)self setDidRestoreFromBackup:0];

          goto LABEL_21;
        }
        if (v22)
        {
          long long v27 = nr_daemon_log();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446210;
            v34 = "-[NRPairingDaemon legacyDidRestoreFromBackup]";
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}s: unpairTriggerFileDoesNotExist- restore date mismatch", buf, 0xCu);
          }
        }
        goto LABEL_35;
      }
      long long v28 = nr_daemon_log();
      BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);

      if (v29)
      {
        BOOL v17 = nr_daemon_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v31 = 136446210;
          v32 = "-[NRPairingDaemon legacyDidRestoreFromBackup]";
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}s: unpairTriggerFileDoesNotExist- could not unarchive trigger file", (uint8_t *)&v31, 0xCu);
        }
LABEL_35:
      }
    }

    goto LABEL_37;
  }
  __int16 v12 = nr_daemon_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    unsigned int v8 = nr_daemon_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v34 = "-[NRPairingDaemon legacyDidRestoreFromBackup]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s: unpairTriggerFileDoesNotExist- trigger file not present", buf, 0xCu);
    }
    goto LABEL_37;
  }
  BOOL v24 = 1;
LABEL_39:

  return v24;
}

- (id)unpairReasonString:(unint64_t)a3
{
  if (a3 - 2 >= 3)
  {
    BOOL v3 = +[NSString stringWithFormat:@"unexpectedReason%lu", a3];
  }
  else
  {
    BOOL v3 = off_100167750[a3 - 2];
  }

  return v3;
}

- (void)unpairDeviceWithPairingID:(id)a3 obliterationString:(id)a4 shouldBrick:(id)a5 storeUnpair:(id)a6 migrationUnpair:(id)a7 shouldPreserveESim:(id)a8 pairingReport:(id)a9 remoteUnpairRequestUUID:(id)a10 shouldConnectionWithDevice:(BOOL)a11
{
  BOOL v16 = (__CFString *)a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  BOOL v24 = nr_daemon_log();
  LODWORD(a7) = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

  if (a7)
  {
    long long v25 = nr_daemon_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v26 = @"(nil)";
      if (v16) {
        CFStringRef v26 = v16;
      }
      *(_DWORD *)buf = 138543362;
      v111 = (const char *)v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "unpairDeviceWithPairingID: Unpairing device %{public}@", buf, 0xCu);
    }
  }
  if (v22 && [v22 isErrorSet])
  {
    long long v27 = +[NRRTCPairingReporter sharedInstance];
    [v27 addToOrCapOffRTCPairingMetric:[v22 subreason]];
    if (_NRIsInternalInstall())
    {
      id v99 = v20;
      id v95 = v21;
      id v97 = v19;
      id v28 = v18;
      BOOL v29 = (const char *)v16;
      id v30 = [v22 subreason];
      unsigned int v31 = v30;
      v32 = sub_10008DE40((uint64_t)v30);
      v33 = nr_daemon_log();
      BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);

      if (v34)
      {
        v35 = nr_daemon_log();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v111 = v29;
          __int16 v112 = 2112;
          v113 = v32;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Unpairing device %{public}@ due to pairing error with subreason %@", buf, 0x16u);
        }
      }
      v36 = +[NRRepeatingAlertEngine sharedInstance];
      [v36 setEnabled:1 withName:@"InternalPairingFailed"];

      v37 = +[NRRepeatingAlertEngine sharedInstance];
      [v37 addErrorCodeToPairingFailureAlert:v31 withReasonString:v32];

      v38 = +[NRRepeatingAlertEngine sharedInstance];
      [v38 presentAlertsIfNeeded];

      BOOL v16 = (__CFString *)v29;
      id v18 = v28;
      id v19 = v97;
      id v20 = v99;
      id v21 = v95;
    }
  }
  if (MKBDeviceUnlockedSinceBoot())
  {
    if (!CFPreferencesGetAppBooleanValue(@"storeBlockPairingFailure", @"com.apple.NanoRegistry", 0))
    {
      if ([v19 BOOLValue])
      {
        CFPreferencesSetAppValue(@"storeBlockPairingFailure", &__kCFBooleanTrue, @"com.apple.NanoRegistry");
        CFPreferencesAppSynchronize(@"com.apple.NanoRegistry");
        [(NSMutableSet *)self->_waitForBridgeCompletedPairingIDs addObject:v16];
        v42 = +[NSNotificationCenter defaultCenter];
        [v42 postNotificationName:@"NRNotificationWaitForBridgeComplete" object:self];
      }
      id v101 = v23;
      v43 = nr_daemon_log();
      BOOL v44 = os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);

      if (v44)
      {
        v45 = nr_daemon_log();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v46 = [v19 BOOLValue];
          *(_DWORD *)buf = 67109120;
          LODWORD(v111) = v46;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "unpairDeviceWithPairingID: Doing minimal store unpair? %{BOOL}d", buf, 8u);
        }
      }
      uint64_t v86 = 144;
      v47 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
      v48 = nrGetPairingError();
      v91 = v47;
      v90 = [v47 cancelAllQueuedOperationsForPairingID:v16 error:v48];

      v108[0] = @"nrDeviceIdentifier";
      v94 = v16;
      v89 = [[EPSagaOperandUUID alloc] initWithUUID:v16];
      v109[0] = v89;
      v108[1] = @"obliterationString";
      id v93 = v17;
      v88 = [[EPSagaOperandString alloc] initWithString:v17];
      v109[1] = v88;
      v108[2] = @"shouldPreserveESim";
      id v96 = v21;
      v49 = [[EPSagaOperandNumber alloc] initWithNumber:v21];
      v109[2] = v49;
      v108[3] = @"shouldBrick";
      id v92 = v18;
      v50 = [[EPSagaOperandNumber alloc] initWithNumber:v18];
      v109[3] = v50;
      v108[4] = @"pairingReport";
      v51 = [[EPSagaOperandPairingReport alloc] initWithPairingReport:v22];
      v109[4] = v51;
      v108[5] = @"remoteUnpairRequestID";
      v52 = [[EPSagaOperandUUID alloc] initWithUUID:v101];
      v109[5] = v52;
      v108[6] = @"migrationUnpair";
      id v100 = v20;
      v53 = [[EPSagaOperandNumber alloc] initWithNumber:v20];
      v109[6] = v53;
      v108[7] = @"storeUnpair";
      v98 = v19;
      v54 = [[EPSagaOperandNumber alloc] initWithNumber:v19];
      v109[7] = v54;
      v108[8] = @"shouldConnectDevice";
      v55 = [EPSagaOperandNumber alloc];
      v56 = +[NSNumber numberWithBool:a11];
      v57 = [(EPSagaOperandNumber *)v55 initWithNumber:v56];
      v109[8] = v57;
      v58 = +[NSDictionary dictionaryWithObjects:v109 forKeys:v108 count:9];

      v59 = v58;
      long long v103 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      id v60 = v90;
      id v61 = [v60 countByEnumeratingWithState:&v103 objects:v107 count:16];
      v41 = v59;
      if (v61)
      {
        id v62 = v61;
        uint64_t v63 = *(void *)v104;
        while (2)
        {
          for (uint64_t i = 0; i != v62; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v104 != v63) {
              objc_enumerationMutation(v60);
            }
            v65 = *(void **)(*((void *)&v103 + 1) + 8 * i);
            [v65 operationType:v86];
            v66 = (__CFString *)objc_claimAutoreleasedReturnValue();

            if (v66 == @"unpair")
            {
              v67 = [v65 entry];
              v41 = [v67 operands];

              v68 = nr_daemon_log();
              BOOL v69 = os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT);

              if (v69)
              {
                v70 = nr_daemon_log();
                if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v111 = (const char *)v41;
                  _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "Override transaction operands, unpairing with: %@", buf, 0xCu);
                }
              }
              goto LABEL_40;
            }
          }
          id v62 = [v60 countByEnumeratingWithState:&v103 objects:v107 count:16];
          if (v62) {
            continue;
          }
          break;
        }
        v41 = v59;
      }
LABEL_40:

      v71 = objc_opt_new();
      v72 = [EPRoutingSlipEntry alloc];
      BOOL v16 = v94;
      uint64_t v73 = [(__CFString *)v94 UUIDString];
      v74 = (void *)v73;
      if (v73) {
        CFStringRef v75 = (const __CFString *)v73;
      }
      else {
        CFStringRef v75 = @"none";
      }
      v76 = [@"unpair-" stringByAppendingString:v75 v86];
      v77 = [(EPRoutingSlipEntry *)v72 initWithName:v76 transactionClass:objc_opt_class() operands:v41];
      [v71 setEntry:v77];

      v78 = nr_daemon_log();
      BOOL v79 = os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT);

      id v23 = v101;
      if (v79)
      {
        v80 = nr_daemon_log();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
        {
          v81 = [v71 entry];
          *(_DWORD *)buf = 138412290;
          v111 = v81;
          _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "Unpair transaction: %@", buf, 0xCu);

          id v23 = v101;
        }
      }
      [v71 setRunningStatusCode:5];
      [v71 setPersistWhilePending:1];
      [v71 setNotUnrollable:1];
      id v19 = v98;
      unsigned int v82 = [v98 BOOLValue];
      v83 = &off_100165798;
      if (!v82) {
        v83 = &off_100165768;
      }
      [v71 setOperationType:*v83];
      [v71 setTargetPairingID:v94];
      [v71 setDidEnd:&stru_100166550];
      id v21 = v96;
      if ([v22 isErrorSet])
      {
        v84 = [*(id *)&self->super.NRRegistryHistoryStore_opaque[v87] optionalServiceFromClass:objc_opt_class()];
        v85 = v84;
        if (v84 && ([v84 isErrorSet] & 1) == 0) {
          [*(id *)&self->super.NRRegistryHistoryStore_opaque[v87] addService:v22];
        }

        id v23 = v101;
      }
      [v91 addTransaction:v71];

      id v18 = v92;
      id v17 = v93;
      goto LABEL_55;
    }
    v39 = nr_daemon_log();
    BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);

    if (v40)
    {
      id v100 = v20;
      v41 = nr_daemon_log();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v111 = "-[NRPairingDaemon unpairDeviceWithPairingID:obliterationString:shouldBrick:storeUnpair:migrationUnpair:sh"
               "ouldPreserveESim:pairingReport:remoteUnpairRequestUUID:shouldConnectionWithDevice:]";
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%s: skipping unpair on pairing failure due to store demo setup", buf, 0xCu);
      }
LABEL_55:

      id v20 = v100;
    }
  }
}

- (void)_archiveDevices:(id)a3 withCollection:(id)a4
{
  v54 = self;
  id v5 = a3;
  id v6 = a4;
  v68 = +[NSMutableDictionary dictionary];
  v67 = +[NSDate date];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id obj = v5;
  id v69 = [obj countByEnumeratingWithState:&v84 objects:v92 count:16];
  if (v69)
  {
    uint64_t v66 = *(void *)v85;
    uint64_t v7 = _NRDevicePropertyMigrationCount;
    uint64_t v64 = NRDevicePropertyIsActive;
    uint64_t v63 = NRDevicePropertyLastInactiveDate;
    uint64_t v62 = NRDevicePropertyIsPaired;
    uint64_t v61 = NRDevicePropertyIsArchived;
    uint64_t v60 = NRDevicePropertyMigrationConsent;
    uint64_t v59 = NRDevicePropertyIsSetup;
    uint64_t v58 = NRDevicePropertyMigrationConsentDate;
    uint64_t v57 = _NRDevicePropertyBluetoothIdentifier;
    v78 = v6;
    uint64_t v65 = _NRDevicePropertyMigrationCount;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v85 != v66) {
          objc_enumerationMutation(obj);
        }
        BOOL v9 = *(void **)(*((void *)&v84 + 1) + 8 * (void)v8);
        BOOL v10 = +[NSMutableDictionary dictionary];
        uint64_t v11 = [v6 objectForKeyedSubscript:v9];
        __int16 v12 = [v11 objectForKeyedSubscript:v7];
        BOOL v13 = [v12 value];

        uint64_t v14 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v13 integerValue] + 1);

        uint64_t v15 = nr_daemon_log();
        LODWORD(v12) = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

        if (v12)
        {
          BOOL v16 = nr_daemon_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v89 = v9;
            __int16 v90 = 2114;
            uint64_t v91 = v14;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[archiveDevices:withCollection] Updating migration counter for %{public}@ to %{public}@", buf, 0x16u);
          }
        }
        v72 = (char *)v8;
        v77 = (void *)v14;
        id v17 = [objc_alloc((Class)NRDevicePropertyDiff) initWithValue:v14];
        id v18 = [objc_alloc((Class)NRDevicePropertyDiffType) initWithDiff:v17 andChangeType:1];
        id v19 = [objc_alloc((Class)NRDevicePropertyDiff) initWithValue:&__kCFBooleanTrue];

        v71 = v9;
        id v20 = [objc_alloc((Class)NRDevicePropertyDiffType) initWithDiff:v19 andChangeType:1];
        id v21 = [objc_alloc((Class)NRDevicePropertyDiff) initWithValue:&__kCFBooleanFalse];

        v74 = v21;
        id v22 = [objc_alloc((Class)NRDevicePropertyDiffType) initWithDiff:v21 andChangeType:1];
        id v23 = [objc_alloc((Class)NRDevicePropertyDiffType) initWithDiff:0 andChangeType:2];
        id v24 = objc_alloc((Class)NRDevicePropertyDiffType);
        id v25 = [objc_alloc((Class)NRDevicePropertyDiff) initWithValue:v67];
        id v26 = [v24 initWithDiff:v25 andChangeType:1];

        id v76 = v18;
        [v10 setObject:v18 forKeyedSubscript:v7];
        [v10 setObject:v22 forKeyedSubscript:v64];
        v70 = v26;
        [v10 setObject:v26 forKeyedSubscript:v63];
        uint64_t v73 = v22;
        [v10 setObject:v22 forKeyedSubscript:v62];
        id v75 = v20;
        [v10 setObject:v20 forKeyedSubscript:v61];
        [v10 setObject:v23 forKeyedSubscript:v60];
        [v10 setObject:v23 forKeyedSubscript:v59];
        [v10 setObject:v23 forKeyedSubscript:v58];
        id v27 = [objc_alloc((Class)NRDeviceDiff) initWithDiffPropertyDiffs:v10];
        id v28 = [objc_alloc((Class)NRDeviceDiffType) initWithDiff:v27 andChangeType:1];
        [v68 setObject:v28 forKeyedSubscript:v71];
        BOOL v29 = [v78 objectForKeyedSubscript:v71];
        id v30 = [v29 objectForKeyedSubscript:v57];
        unsigned int v31 = [v30 value];

        v32 = nr_daemon_log();
        v33 = v32;
        if (v31)
        {
          BOOL v34 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);

          v35 = v72;
          if (v34)
          {
            v36 = nr_daemon_log();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v89 = v71;
              __int16 v90 = 2112;
              uint64_t v91 = (uint64_t)v31;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Unpairing archived watch device nr=%@ bt=%@ in IDS...", buf, 0x16u);
            }
          }
          v37 = dispatch_get_global_queue(17, 0);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000290B8;
          block[3] = &unk_100165530;
          id v38 = v31;
          id v82 = v38;
          id v83 = v37;
          v39 = v37;
          dispatch_async(v39, block);
          BOOL v40 = nr_daemon_log();
          BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);

          if (v41)
          {
            v42 = nr_daemon_log();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v89 = v38;
              _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Done calling IDS to unpair %@", buf, 0xCu);
            }
          }
          BOOL v44 = v75;
          v43 = v76;
        }
        else
        {
          BOOL v45 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);

          BOOL v44 = v20;
          v43 = v76;
          v35 = v72;
          if (!v45) {
            goto LABEL_24;
          }
          v39 = nr_daemon_log();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
            sub_1000F7548(&v79, v80, v39);
          }
        }

LABEL_24:
        id v8 = v35 + 1;
        id v6 = v78;
        uint64_t v7 = v65;
      }
      while (v69 != v8);
      id v69 = [obj countByEnumeratingWithState:&v84 objects:v92 count:16];
    }
    while (v69);
  }

  if ([v68 count])
  {
    id v46 = [objc_alloc((Class)NRDeviceCollectionDiff) initWithDeviceCollectionDiffDeviceDiffs:v68];
    v47 = nr_daemon_log();
    BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);

    if (v48)
    {
      v49 = nr_daemon_log();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v89 = v46;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "archiveDevice:withCollection: Built diff: %@ for different phone migration", buf, 0xCu);
      }
    }
    id v50 = [v6 applyDiff:v46, v54];
    v51 = [*(id *)(v55 + 144) serviceFromClass:objc_opt_class()];
    v52 = objc_opt_new();
    v53 = [[EPRoutingSlipEntry alloc] initWithName:@"updateAppRemovability" transactionClass:objc_opt_class() operands:&__NSDictionary0__struct];
    [v52 setEntry:v53];

    [v51 addTransaction:v52];
  }
}

- (void)_forceMigrationSync:(id)a3 withCollection:(id)a4
{
  id v5 = a3;
  id v40 = a4;
  v39 = +[NSMutableDictionary dictionary];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v38 = *(void *)v43;
    uint64_t v9 = _NRDevicePropertyMigrationCount;
    *(void *)&long long v7 = 138543618;
    long long v36 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v43 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        __int16 v12 = +[NSMutableDictionary dictionary];
        BOOL v13 = [v40 objectForKeyedSubscript:v11];
        uint64_t v14 = [v13 objectForKeyedSubscript:v9];
        uint64_t v15 = [v14 value];

        BOOL v16 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v15 integerValue] + 1);

        id v17 = nr_daemon_log();
        LODWORD(v15) = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

        if (v15)
        {
          id v18 = nr_daemon_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v36;
            id v47 = v11;
            __int16 v48 = 2114;
            v49 = v16;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Updating migration counter for %{public}@ to %{public}@", buf, 0x16u);
          }
        }
        id v19 = [objc_alloc((Class)NRDevicePropertyDiff) initWithValue:v16];
        id v20 = [objc_alloc((Class)NRDevicePropertyDiffType) initWithDiff:v19 andChangeType:1];
        [v12 setObject:v20 forKeyedSubscript:v9];
        id v21 = [objc_alloc((Class)NRDeviceDiff) initWithDiffPropertyDiffs:v12];
        id v22 = [objc_alloc((Class)NRDeviceDiffType) initWithDiff:v21 andChangeType:1];
        [v39 setObject:v22 forKeyedSubscript:v11];
      }
      id v8 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v8);
  }

  if ([v39 count])
  {
    id v23 = [objc_alloc((Class)NRDeviceCollectionDiff) initWithDeviceCollectionDiffDeviceDiffs:v39];
    id v24 = nr_daemon_log();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

    if (v25)
    {
      id v26 = nr_daemon_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v47 = v23;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Built diff for same phone migration: %@", buf, 0xCu);
      }
    }
    id v27 = [v40 applyDiff:v23];
    id v28 = +[MSDKDemoState sharedInstance];
    uint64_t v41 = 0;
    unsigned int v29 = [v28 isStoreDemoModeEnabled:&v41];
    uint64_t v30 = v41;

    unsigned int v31 = nr_daemon_log();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);

    if (v32)
    {
      v33 = nr_daemon_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v47) = v29;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "MobileStoreDemo enabled: %{BOOL}d", buf, 8u);
      }
    }
    if (v30) {
      char v34 = 0;
    }
    else {
      char v34 = v29;
    }
    if ((v34 & 1) == 0)
    {
      v35 = +[NRQueue registryDaemonQueue];
      [v35 dispatchAsync:&stru_1001665B0];
    }
  }
}

- (void)createUnpairTransactionsWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100029740;
  v4[3] = &unk_100166210;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(NRPairingDaemon *)v5 purgeDiscoveredDevices:v4];
}

- (id)_migrationReporter
{
  id v3 = [(EPServiceRegistry *)self->_serviceRegistry optionalServiceFromClass:objc_opt_class()];
  if (!v3)
  {
    id v3 = [[NRRTCMigrationReporter alloc] initWithServiceRegistry:self->_serviceRegistry];
    [(EPServiceRegistry *)self->_serviceRegistry addService:v3];
  }

  return v3;
}

- (void)initBluetoothWithBlock:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  id v5 = +[NRSystemProperties sharedInstance];
  unsigned int v6 = [v5 isBluetoothCapable];

  long long v7 = nr_daemon_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    uint64_t v9 = nr_daemon_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v10 = &stru_10016A1E8;
      if (!v4) {
        CFStringRef v10 = @"no ";
      }
      int v18 = 138412546;
      CFStringRef v19 = v10;
      __int16 v20 = 1024;
      unsigned int v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "initBluetoothWithBlock(%@block); device supports Bluetooth = %{BOOL}d.",
        (uint8_t *)&v18,
        0x12u);
    }
  }
  if (v6)
  {
    if (v4)
    {
      [(NSLock *)self->_bluetoothInitBlockLock lock];
      bluetoothInitBlocks = self->_bluetoothInitBlocks;
      id v12 = [v4 copy];
      [(NSMutableArray *)bluetoothInitBlocks addObject:v12];

      [(NSLock *)self->_bluetoothInitBlockLock unlock];
    }
    id v13 = objc_alloc((Class)CBCentralManager);
    uint64_t v14 = +[NRQueue registryDaemonQueue];
    uint64_t v15 = [v14 queue];
    BOOL v16 = (CBCentralManager *)[v13 initWithDelegate:self queue:v15];
    central = self->_central;
    self->_central = v16;

    [(NRPairingDaemon *)self updateFromBTState];
  }
  else if (v4)
  {
    v4[2](v4);
  }
}

- (void)initNetworkRelayPairerWithBlock:(id)a3
{
  id v3 = (void (**)(void))a3;
  BOOL v4 = nr_daemon_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    unsigned int v6 = nr_daemon_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v7 = @"block";
      if (!v3) {
        CFStringRef v7 = @"no block";
      }
      int v11 = 138412290;
      CFStringRef v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "initNetworkRelayPairerWithBlock(%@)", (uint8_t *)&v11, 0xCu);
    }
  }
  BOOL v8 = nr_daemon_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    CFStringRef v10 = nr_daemon_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Creating appropriate NetworkRelayPairer for Phone", (uint8_t *)&v11, 2u);
    }
  }
  if (v3) {
    v3[2](v3);
  }
}

- (void)setChipIDOfActiveDevice:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NRPairingDaemon *)self chipIDOfActiveDeviceQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002BDD4;
  v7[3] = &unk_100165530;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (NSNumber)chipIDOfActiveDevice
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  CFStringRef v10 = sub_100023880;
  int v11 = sub_100023890;
  id v12 = 0;
  id v3 = [(NRPairingDaemon *)self chipIDOfActiveDeviceQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_10002BF04;
  v6[3] = &unk_100165840;
  void v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSNumber *)v4;
}

- (BOOL)pairingCompatibilityVersionInitWithCollection:(id)a3
{
  p_activeDeviceChipIDNotifyToken = &self->_activeDeviceChipIDNotifyToken;
  id v5 = a3;
  if (notify_register_check("com.apple.nanoregistry.activedevicechipid", p_activeDeviceChipIDNotifyToken))
  {
    id v6 = nr_daemon_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

    if (v7)
    {
      id v8 = nr_daemon_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000F7610();
      }
    }
  }
  dispatch_queue_t v9 = dispatch_queue_create("com.apple.nanoregistry.chipid.update", 0);
  [(NRPairingDaemon *)self setChipIDOfActiveDeviceQueue:v9];

  CFStringRef v10 = [v5 activeDevice];

  if (v10)
  {
    int v11 = [v10 objectForKeyedSubscript:NRDevicePropertyChipID];
    id v12 = [v11 value];

    [(NRPairingDaemon *)self broadcastActiveDeviceChipID:v12 from:@"Init from active device in device collection"];
  }
  [(NRPairingDaemon *)self logIfVersionsAreOverridden];

  return 1;
}

- (void)updateMirrorWithCollection:(id)a3
{
  id v3 = a3;
  id v4 = [v3 activeDevice];
  id v22 = [v4 copyWithZone:0];

  unsigned int v21 = [v3 activeDeviceID];
  unsigned __int8 v20 = [v3 paired];
  id v5 = +[NSMutableDictionary dictionary];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v24 = 0;
    uint64_t v9 = *(void *)v32;
    uint64_t v10 = _NRDevicePropertyBluetoothIdentifier;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        id v13 = [v6 objectForKeyedSubscript:v12];
        uint64_t v14 = [v13 objectForKeyedSubscript:v10];
        uint64_t v15 = [v14 value];

        if (v15) {
          [v5 setObject:v12 forKeyedSubscript:v15];
        }
        if ([v13 isPaired] && (objc_msgSend(v13, "isAltAccount") & 1) == 0) {
          v24 += [v13 isArchived] ^ 1;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v24 = 0;
  }

  BOOL v16 = +[NRQueue registryDaemonQueue];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10002C2F4;
  v25[3] = &unk_100166708;
  v25[4] = self;
  id v26 = v5;
  id v27 = v22;
  id v28 = v21;
  unsigned __int8 v30 = v20;
  uint64_t v29 = v24;
  id v17 = v21;
  id v18 = v22;
  id v19 = v5;
  [v16 dispatchAsync:v25];
}

- (NRMutableDevice)mirrorOfActiveDevice
{
  id v3 = +[NRQueue registryDaemonQueue];
  id v4 = [v3 queue];
  dispatch_assert_queue_V2(v4);

  mirrorOfActiveDevice = self->_mirrorOfActiveDevice;

  return mirrorOfActiveDevice;
}

- (NSUUID)mirrorOfActiveDeviceID
{
  return self->_mirrorOfActiveDeviceID;
}

- (BOOL)mirrorOfIsPaired
{
  return self->_mirrorOfIsPaired;
}

- (void)broadcastActiveDeviceChipID:(id)a3 from:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [(NRPairingDaemon *)self chipIDOfActiveDevice];
    if ((id)v8 == v6)
    {
    }
    else
    {
      uint64_t v9 = (void *)v8;
      uint64_t v10 = [(NRPairingDaemon *)self chipIDOfActiveDevice];
      unsigned __int8 v11 = [v10 isEqual:v6];

      if ((v11 & 1) == 0)
      {
        uint64_t v12 = nr_daemon_log();
        BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

        if (v13)
        {
          uint64_t v14 = nr_daemon_log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            int v15 = 138412546;
            id v16 = v6;
            __int16 v17 = 2112;
            id v18 = v7;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "ChipID %@ broadcast from %@", (uint8_t *)&v15, 0x16u);
          }
        }
      }
    }
    -[NRPairingDaemon updateNotifyToken:withValue:withNotificationName:alwaysPost:](self, "updateNotifyToken:withValue:withNotificationName:alwaysPost:", self->_activeDeviceChipIDNotifyToken, [v6 unsignedLongLongValue], @"com.apple.nanoregistry.activedevicechipid", 0);
    [(NRPairingDaemon *)self setChipIDOfActiveDevice:v6];
    [(NRLocalPropertyMonitor *)self->_localProperties setRemoteDeviceChipIDNumber:v6];
  }
}

- (void)logIfVersionsAreOverridden
{
  id v3 = +[NRPairingCompatibilityVersionInfo systemVersions];
  unsigned int v4 = [v3 isOverrideActive];

  if (v4)
  {
    id v5 = nr_daemon_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (!v6) {
      goto LABEL_10;
    }
    id v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000F76D0(self);
    }
    goto LABEL_9;
  }
  uint64_t v8 = +[NRPairingCompatibilityVersionInfo systemVersions];
  int v9 = [v8 isRevlockFeatureFlagActive];

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = nr_daemon_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

    if (v11)
    {
      id v7 = nr_daemon_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1000F77EC(self);
      }
LABEL_9:
    }
  }
LABEL_10:
  if (qword_1001A10D8 != -1) {
    dispatch_once(&qword_1001A10D8, &stru_100166728);
  }
  if (byte_1001A10D0 == 1)
  {
    uint64_t v12 = nr_daemon_log();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);

    if (v13)
    {
      uint64_t v14 = nr_daemon_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000F7644(v14, v15, v16);
      }
    }
  }
}

- (OS_dispatch_queue)pairingQueue
{
  objc_super v2 = +[NRQueue xpcPairingQueue];
  id v3 = [v2 queue];

  return (OS_dispatch_queue *)v3;
}

- (void)setupSignalHandlers
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C8E4;
  block[3] = &unk_1001655F8;
  void block[4] = self;
  if (qword_1001A10F0 != -1) {
    dispatch_once(&qword_1001A10F0, block);
  }
}

- (void)sigTerm
{
  id v2 = +[NRQueue registryDaemonQueue];
  [v2 dispatchAsync:&stru_100166748];
}

- (void)sigUsr1
{
  id v4 = [(NRPairingDaemon *)self dumpStateGivenCachedHistoryIndex:0];
  id v2 = objc_opt_class();
  id v3 = [v4 objectForKeyedSubscript:@"NROSLogStateStateString"];
  [v2 debugDump:v3 public:1];
}

+ (void)debugDump:(id)a3 public:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [a3 componentsSeparatedByString:@"\n"];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      int v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v9);
        BOOL v11 = nr_daemon_log();
        BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

        if (v4)
        {
          if (!v12) {
            goto LABEL_13;
          }
          BOOL v13 = nr_daemon_log();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            goto LABEL_12;
          }
          *(_DWORD *)buf = 138543362;
          uint64_t v22 = v10;
          uint64_t v14 = v13;
          uint64_t v15 = "%{public}@";
          goto LABEL_16;
        }
        if (!v12) {
          goto LABEL_13;
        }
        BOOL v13 = nr_daemon_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v22 = v10;
          uint64_t v14 = v13;
          uint64_t v15 = "%@";
LABEL_16:
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);
        }
LABEL_12:

LABEL_13:
        int v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v16 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
      id v7 = v16;
    }
    while (v16);
  }
}

- (void)initIDSService:(Class)a3 block:(id)a4
{
  id v6 = a4;
  uint64_t v20 = 0;
  unsigned int v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_100023880;
  uint64_t v24 = sub_100023890;
  id v25 = [(EPServiceRegistry *)self->_serviceRegistry optionalServiceFromClass:a3];
  if (v21[5])
  {
    id v7 = +[NRQueue registryDaemonQueue];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10002D1D0;
    v13[3] = &unk_1001667C0;
    uint64_t v15 = &v20;
    id v14 = v6;
    [v7 dispatchAsync:v13];
  }
  else
  {
    self->_initRemoteProperties = 1;
    uint64_t v8 = nr_daemon_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      uint64_t v10 = nr_daemon_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v11 = NSStringFromClass(a3);
        *(_DWORD *)buf = 138412546;
        id v27 = v11;
        __int16 v28 = 2080;
        uint64_t v29 = "connected";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "initIDSService: Initializing class %@ as \"%s\"", buf, 0x16u);
      }
    }
    BOOL v12 = dispatch_get_global_queue(21, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002D030;
    block[3] = &unk_100166798;
    long long v18 = &v20;
    Class v19 = a3;
    void block[4] = self;
    id v17 = v6;
    dispatch_async(v12, block);
  }
  _Block_object_dispose(&v20, 8);
}

+ (id)countdown:(int64_t)a3 toCompletion:(id)a4
{
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2810000000;
  v31[3] = &unk_100159365;
  int v32 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v30[3] = a3;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = sub_10002D4D0;
  __int16 v28 = sub_10002D4FC;
  id v29 = 0;
  uint64_t v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = sub_10002D504;
  long long v18 = &unk_100166810;
  uint64_t v20 = v31;
  unsigned int v21 = v30;
  uint64_t v22 = &v24;
  int64_t v23 = a3;
  id v5 = a4;
  id v19 = v5;
  id v6 = objc_retainBlock(&v15);
  id v7 = (void *)v25[5];
  void v25[5] = (uint64_t)v6;

  uint64_t v8 = nr_daemon_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    uint64_t v10 = nr_daemon_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = objc_retainBlock((id)v25[5]);
      BOOL v12 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3, v15, v16, v17, v18);
      *(_DWORD *)buf = 134218242;
      id v34 = v11;
      __int16 v35 = 2112;
      long long v36 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%p] countdown:%@ toCompletion: --started--", buf, 0x16u);
    }
  }
  id v13 = objc_retainBlock((id)v25[5]);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v31, 8);

  return v13;
}

- (void)initializeTrafficClassBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002D980;
  v7[3] = &unk_100166210;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NRPairingDaemon *)self initIDSService:v5 block:v7];
}

- (void)areWePairedOrPairing:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[EPNanoRegistryStatusCodeElection sharedInstance];
  if ([v5 statusCode] == (id)1)
  {
  }
  else
  {
    id v6 = +[EPNanoRegistryStatusCodeElection sharedInstance];
    id v7 = [v6 statusCode];

    if (v7 != (id)4)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10002DE98;
      v8[3] = &unk_1001668B0;
      id v9 = v4;
      [(NRPairingDaemon *)self grabRegistryWithReadBlock:v8];

      goto LABEL_6;
    }
  }
  (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
LABEL_6:
}

- (void)initializeAllIDSChannelsBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10002E278;
  v25[3] = &unk_100166210;
  v25[4] = self;
  id v26 = v4;
  id v6 = v4;
  [v5 countdown:5 toCompletion:v25];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10002E328;
  v23[3] = &unk_100165D10;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v24 = v7;
  [(NRPairingDaemon *)self initializeTrafficClassBlock:v23];
  uint64_t v8 = objc_opt_class();
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10002E340;
  v21[3] = &unk_100165D10;
  id v9 = v7;
  id v22 = v9;
  [(NRPairingDaemon *)self initIDSService:v8 block:v21];
  uint64_t v10 = objc_opt_class();
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10002E358;
  v19[3] = &unk_100165D10;
  id v11 = v9;
  id v20 = v11;
  [(NRPairingDaemon *)self initIDSService:v10 block:v19];
  uint64_t v12 = objc_opt_class();
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10002E370;
  v17[3] = &unk_100165D10;
  id v13 = v11;
  id v18 = v13;
  [(NRPairingDaemon *)self initIDSService:v12 block:v17];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002E388;
  v15[3] = &unk_100166888;
  void v15[4] = self;
  id v16 = v13;
  id v14 = v13;
  [(NRPairingDaemon *)self areWePairedOrPairing:v15];
}

- (void)invalidateIDSChannels
{
  id v3 = nr_daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    uint64_t v5 = nr_daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412546;
      CFStringRef v7 = @"class-a";
      __int16 v8 = 2112;
      CFStringRef v9 = @"class-c";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Invalidating IDS channels %@ and %@.", (uint8_t *)&v6, 0x16u);
    }
  }
  [(NRPairingDaemon *)self voidIDSService:objc_opt_class()];
  [(NRPairingDaemon *)self voidIDSService:objc_opt_class()];
}

- (id)dumpStateGivenCachedHistoryIndex:(unint64_t)a3
{
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_100023880;
  int64_t v23 = sub_100023890;
  id v24 = +[NSMutableString string];
  uint64_t v5 = +[NSDate date];
  int v6 = (void *)v20[5];
  CFStringRef v7 = [v5 description];
  [v5 timeIntervalSince1970];
  [v6 appendFormat:@"Dump timestamp: %@ (%.6f)", v7, v8];

  [(id)v20[5] appendString:@"\nActive assertions:\n"];
  [(NRPairingDaemon *)self assertionDescription:v20[5]];
  [(id)v20[5] appendString:@"Transaction Coordinator:\n"];
  CFStringRef v9 = +[NRQueue registryDaemonQueue];
  uint64_t v10 = [v9 queue];
  dispatch_assert_queue_not_V2(v10);

  id v11 = +[NRQueue registryDaemonQueue];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10002E9BC;
  v18[3] = &unk_1001668D8;
  v18[4] = self;
  v18[5] = &v19;
  [v11 dispatchSync:v18];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10002EA54;
  v17[3] = &unk_100166900;
  void v17[4] = self;
  v17[5] = &v25;
  v17[6] = &v19;
  v17[7] = a3;
  [(NRPairingDaemon *)self enqueueBypass:v17];
  id v12 = objc_alloc((Class)NSMutableDictionary);
  id v13 = +[NSNumber numberWithUnsignedLongLong:v26[3]];
  id v14 = [v12 initWithObjectsAndKeys:v13, @"NROSLogStateHistoryIndex", 0];

  uint64_t v15 = v20[5];
  if (v15) {
    [v14 setObject:v15 forKeyedSubscript:@"NROSLogStateStateString"];
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v14;
}

- (void)preFirstUnlockInitCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    CFStringRef v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "preFirstUnlockInit", buf, 2u);
    }
  }
  uint64_t v8 = objc_opt_class();
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10002F000;
  v30[3] = &unk_100166210;
  void v30[4] = self;
  id v31 = v4;
  id v9 = v4;
  uint64_t v10 = [v8 countdown:4 toCompletion:v30];
  [(NRPairingDaemon *)self setupSignalHandlers];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10002F114;
  v29[3] = &unk_100166928;
  v29[4] = self;
  id v11 = [[NROSLogStateProvider alloc] initWithName:@"com.apple.nanoregistry" maxStringLength:0x20000 block:v29];
  dumper = self->_dumper;
  self->_dumper = v11;

  mach_timebase_info(&stru_1001A10F8);
  [(NRPairingDaemon *)self allocateDictionaries];
  [(NRPairingDaemon *)self setUpHistoryCompletionBlocks];
  id v13 = [EPStaticServiceRegistry alloc];
  id v14 = +[NRQueue registryDaemonQueue];
  uint64_t v15 = [v14 queue];
  id v16 = [(EPStaticServiceRegistry *)v13 initWithQueue:v15];
  serviceRegistry = self->_serviceRegistry;
  self->_serviceRegistry = v16;

  [(EPServiceRegistry *)self->_serviceRegistry addService:self];
  id v18 = [(EPServiceRegistry *)self->_serviceRegistry instantiateServiceByClass:objc_opt_class()];
  id v19 = [(EPServiceRegistry *)self->_serviceRegistry instantiateServiceByClass:objc_opt_class()];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10002F120;
  v27[3] = &unk_100165D10;
  id v20 = v10;
  id v28 = v20;
  [(NRPairingDaemon *)self normalizeDaemonStateWithBlock:v27];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10002F138;
  v25[3] = &unk_100165D10;
  id v21 = v20;
  id v26 = v21;
  [(NRPairingDaemon *)self cleanupPairingStoreWithCompletion:v25];
  [(NRPairingDaemon *)self ackXPCEvents];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10002F150;
  v23[3] = &unk_100166860;
  void v23[4] = self;
  id v24 = v21;
  id v22 = (void (**)(id, const __CFString *))v21;
  [(NRPairingDaemon *)self grabRegistryWithReadBlockAsync:v23];
  v22[2](v22, @"preFirstUnlockInitCompletion");
}

- (void)postFirstUnlockInitBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    CFStringRef v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "postFirstUnlockInit", (uint8_t *)&buf, 2u);
    }
  }
  if (self->_useNetworkRelayPairing) {
    uint64_t v8 = 7;
  }
  else {
    uint64_t v8 = 6;
  }
  id v9 = objc_opt_class();
  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472;
  v66[2] = sub_10002FAA4;
  v66[3] = &unk_100166210;
  v66[4] = self;
  id v10 = v4;
  id v67 = v10;
  id v11 = [v9 countdown:v8 toCompletion:v66];
  id v12 = +[NSSet setWithObject:@"migrationRetryWrapper"];
  +[NRPowerAssertionActivity addActivityGroup:v12];

  id v13 = +[NSSet setWithObject:@"syncActive"];
  +[NRPowerAssertionActivity addActivityGroup:v13];

  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_10002FF18;
  v64[3] = &unk_100165D10;
  id v14 = v11;
  id v65 = v14;
  [(NRPairingDaemon *)self deleteUnexpectedIDSPairedDevicesWithCompletion:v64];
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_10002FF30;
  v62[3] = &unk_100165D10;
  id v15 = v14;
  id v63 = v15;
  [(NRPairingDaemon *)self initializeAllIDSChannelsBlock:v62];
  id v16 = +[NRLocalPropertyMonitor sharedInstance];
  localProperties = self->_localProperties;
  self->_localProperties = v16;

  [(NRLocalPropertyMonitor *)self->_localProperties addPropertyObserver:self];
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_10002FF48;
  v60[3] = &unk_100165D10;
  id v18 = v15;
  id v61 = v18;
  [(NRPairingDaemon *)self initBluetoothWithBlock:v60];
  if (self->_useNetworkRelayPairing)
  {
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_10002FF60;
    v58[3] = &unk_100165D10;
    id v59 = v18;
    [(NRPairingDaemon *)self initNetworkRelayPairerWithBlock:v58];
  }
  id v19 = [(EPServiceRegistry *)self->_serviceRegistry instantiateServiceByClass:objc_opt_class()];
  id v20 = [(EPServiceRegistry *)self->_serviceRegistry instantiateServiceByClass:objc_opt_class()];
  id v21 = +[NRTermsAcknowledgementRegistryService sharedInstance];
  [v21 setDelegate:self];
  [v21 resume];
  [(EPServiceRegistry *)self->_serviceRegistry addService:v21];
  __int16 v48 = [[NRSystemVersionRequestService alloc] initWithServiceRegistry:self->_serviceRegistry];
  -[EPServiceRegistry addService:](self->_serviceRegistry, "addService:");
  [(NRPairingDaemon *)self setUpClientReferenceCounters];
  id v22 = [(EPServiceRegistry *)self->_serviceRegistry instantiateServiceByClass:objc_opt_class()];
  id v23 = [(EPServiceRegistry *)self->_serviceRegistry instantiateServiceByClass:objc_opt_class()];
  if (!self->_keymaster)
  {
    id v24 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
    objc_initWeak(&buf, self);
    uint64_t v25 = [EPKeymaster alloc];
    id v47 = v10;
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_10002FF78;
    v55[3] = &unk_100166950;
    objc_copyWeak(&v56, &buf);
    id v26 = +[NRQueue registryDaemonQueue];
    uint64_t v27 = [v26 queue];
    id v28 = [(EPKeymaster *)v25 initWithKeyName:@"migration2" shouldExport:1 unlockAssertionManager:v24 okayToCreateKeyBlock:v55 queue:v27];
    keymaster = self->_keymaster;
    self->_keymaster = v28;

    [(EPServiceRegistry *)self->_serviceRegistry addService:self->_keymaster];
    id v30 = [(EPServiceRegistry *)self->_serviceRegistry instantiateServiceByClass:objc_opt_class()];
    objc_destroyWeak(&v56);
    objc_destroyWeak(&buf);

    id v10 = v47;
  }
  serviceRegistry = self->_serviceRegistry;
  int v32 = +[NRRepeatingAlertEngine sharedInstance];
  [(EPServiceRegistry *)serviceRegistry addService:v32];

  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_10002FFC0;
  v53[3] = &unk_100166860;
  v53[4] = self;
  id v33 = v18;
  id v54 = v33;
  [(NRPairingDaemon *)self grabRegistryWithReadBlock:v53];
  id v34 = (NRConnectivityPublisher *)objc_opt_new();
  connectivityPublisher = self->_connectivityPublisher;
  self->_connectivityPublisher = v34;

  id v36 = [(EPServiceRegistry *)self->_serviceRegistry instantiateServiceByClass:objc_opt_class()];
  v37 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
  uint64_t v38 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
  [v37 addObserver:v38];
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_10003007C;
  v51[3] = &unk_100165D10;
  id v39 = v33;
  id v52 = v39;
  [(NRPairingDaemon *)self createUnpairTransactionsWithCompletion:v51];
  id v40 = +[NetworkRelayAgent sharedInstance];
  [v40 addDelegate:self];
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_100030094;
  v49[3] = &unk_1001658B8;
  id v41 = v40;
  id v50 = v41;
  [(NRPairingDaemon *)self grabRegistryWithReadBlock:v49];
  long long v42 = +[NRSystemProperties sharedInstance];
  unsigned int v43 = [v42 isVirtualDevice];

  if (v43)
  {
    long long v44 = nr_daemon_log();
    BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT);

    if (v45)
    {
      id v46 = nr_daemon_log();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Virtual device, setting device limit to 1", (uint8_t *)&buf, 2u);
      }
    }
    CFPreferencesSetAppValue(@"maxAllPairedDeviceCount", &off_1001768B0, @"com.apple.NanoRegistry");
    CFPreferencesAppSynchronize(@"com.apple.NanoRegistry");
  }
  (*((void (**)(id, const __CFString *))v39 + 2))(v39, @"postFirstUnlockInitBlock");
}

- (void)lastPairedDeviceWithBlock:(id)a3
{
  id v4 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_1000301FC;
  v6[3] = &unk_1001669C8;
  Boolean AppBooleanValue = CFPreferencesGetAppBooleanValue(@"disableSatelliteDisconnect", @"com.apple.NanoRegistry", 0);
  id v7 = v4;
  id v5 = v4;
  [(NRPairingDaemon *)self grabRegistryWithReadBlockAsync:v6];
}

- (void)enqueueSetLastPairedDeviceTransactionWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100030BBC;
  v4[3] = &unk_100166A18;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(NRPairingDaemon *)v5 lastPairedDeviceWithBlock:v4];
}

- (void)transactionCoordinatorHasBecomeIdle
{
  id v3 = nr_daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = nr_daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "transactionCoordinatorHasBecomeIdle", v7, 2u);
    }
  }
  id v6 = [(EPServiceRegistry *)self->_serviceRegistry optionalServiceFromClass:objc_opt_class()];
  if ([v6 idle]) {
    [(NRPairingDaemon *)self _transactionCoordinatorHasBecomeIdle];
  }
}

- (void)_transactionCoordinatorHasBecomeIdle
{
  id v3 = nr_daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = nr_daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_transactionCoordinatorHasBecomeIdle", buf, 2u);
    }
  }
  *(void *)id buf = 0;
  id v14 = buf;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_100023880;
  id v17 = sub_100023890;
  id v18 = +[NROSTransaction transactionWithName:@"idleTasks"];
  id v6 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
  id v7 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
  uint64_t v8 = [v7 assertions];
  id v9 = [v8 count];

  if (v9)
  {
    [v6 resume];
  }
  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000311B4;
    v10[3] = &unk_100166A90;
    v10[4] = self;
    id v11 = v6;
    id v12 = buf;
    [(NRPairingDaemon *)self enqueueSetLastPairedDeviceTransactionWithCompletion:v10];
  }
  _Block_object_dispose(buf, 8);
}

- (void)purgeDiscoveredDevices:(id)a3
{
  id v4 = a3;
  id v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 136315138;
      id v12 = "-[NRPairingDaemon purgeDiscoveredDevices:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100031718;
  v9[3] = &unk_100166AB8;
  id v10 = v4;
  id v8 = v4;
  [(NRPairingDaemon *)self grabRegistryWithWriteBlockAsync:v9];
}

- (void)syncPairingClientCrashMonitoringCache
{
  id v3 = nr_daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = nr_daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Restoring crash monitoring", buf, 2u);
    }
  }
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  *(void *)id buf = 0;
  uint64_t v27 = buf;
  uint64_t v28 = 0x3032000000;
  id v29 = sub_100023880;
  id v30 = sub_100023890;
  id v31 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_100023880;
  v24[4] = sub_100023890;
  id v25 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  id v18 = sub_100031CCC;
  id v19 = &unk_100166AE0;
  id v20 = self;
  id v21 = &v32;
  id v22 = v24;
  id v23 = buf;
  BOOL v6 = v17;
  os_unfair_lock_lock_with_options();
  v18(v6);

  os_unfair_lock_unlock(&self->_pairingQueueWriteLock);
  if (*((void *)v27 + 5))
  {
    if (*((unsigned char *)v33 + 24))
    {
      id v7 = nr_daemon_log();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

      if (v8)
      {
        id v9 = nr_daemon_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v16 = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Restoring suspend crash monitoring", v16, 2u);
        }
      }
      id v10 = +[NRQueue delayPairingRequestQueue];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100031D78;
      v15[3] = &unk_100165640;
      void v15[4] = self;
      void v15[5] = buf;
      v15[6] = v24;
      [v10 dispatchAsync:v15];
    }
    else
    {
      id v11 = nr_daemon_log();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

      if (v12)
      {
        id v13 = nr_daemon_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v16 = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Restoring resume crash monitoring", v16, 2u);
        }
      }
      id v10 = +[NRQueue delayPairingRequestQueue];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100031E20;
      v14[3] = &unk_100165640;
      v14[4] = self;
      v14[5] = buf;
      v14[6] = v24;
      [v10 dispatchAsync:v14];
    }
  }
  _Block_object_dispose(v24, 8);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v32, 8);
}

- (BOOL)setPairingClientCrashMonitoringCache:(BOOL)a3 proxy:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = nr_daemon_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v9 = nr_daemon_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (v4) {
        id v10 = "NO";
      }
      else {
        id v10 = "YES";
      }
      id v11 = [v6 appPath];
      *(_DWORD *)id buf = 136315394;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Setting crash monitoring %s for %@", buf, 0x16u);
    }
  }
  *(void *)id buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  char v24 = 0;
  p_pairingQueueWriteLock = &self->_pairingQueueWriteLock;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  id v17 = sub_1000320D8;
  id v18 = &unk_100166B08;
  id v19 = self;
  id v21 = buf;
  BOOL v22 = v4;
  id v13 = v6;
  id v20 = v13;
  id v14 = v16;
  os_unfair_lock_lock_with_options();
  v17((uint64_t)v14);

  os_unfair_lock_unlock(p_pairingQueueWriteLock);
  LOBYTE(v14) = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
  return (char)v14;
}

- (void)cleanupPairingStoreWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000322C8;
  v4[3] = &unk_100166B30;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(NRPairingDaemon *)v5 grabHistoryWithReadBlock:v4];
}

- (void)debounceOnQueue:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  BOOL v8 = nr_daemon_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = nr_daemon_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[NRPairingDaemon debounceOnQueue:block:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
    }
  }
  if (v6 && v7)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v32 = 0x3032000000;
    id v33 = sub_100023880;
    uint64_t v34 = sub_100023890;
    id v35 = 0;
    mcDebounceSource = self->_mcDebounceSource;
    if (mcDebounceSource
      || (+[NROSTransaction transactionWithName:@"debounceOnQueue"], uint64_t v12 = objc_claimAutoreleasedReturnValue(), v13 = *(void **)(*((void *)&buf + 1) + 40), *(void *)(*((void *)&buf + 1) + 40) = v12, v13, (mcDebounceSource = self->_mcDebounceSource) != 0))
    {
      dispatch_source_cancel(mcDebounceSource);
      id v14 = self->_mcDebounceSource;
      self->_mcDebounceSource = 0;
    }
    uint64_t v15 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v6);
    id v16 = self->_mcDebounceSource;
    self->_mcDebounceSource = v15;

    id v17 = self->_mcDebounceSource;
    if (v17)
    {
      dispatch_time_t v18 = dispatch_time(0, 5000000000);
      dispatch_source_set_timer(v17, v18, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
      id v19 = self->_mcDebounceSource;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1000328B8;
      handler[3] = &unk_100166B58;
      handler[4] = self;
      id v29 = v7;
      p_long long buf = &buf;
      dispatch_source_set_event_handler(v19, handler);
      dispatch_resume((dispatch_object_t)self->_mcDebounceSource);
    }
    else
    {
      id v23 = nr_daemon_log();
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

      if (v24)
      {
        id v25 = nr_daemon_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v27 = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Could not create dispatch source", v27, 2u);
        }
      }
      v7[2](v7);
      id v26 = *(void **)(*((void *)&buf + 1) + 40);
      *(void *)(*((void *)&buf + 1) + 40) = 0;
    }
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v20 = nr_daemon_log();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

    if (v21)
    {
      BOOL v22 = nr_daemon_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Invalid debounce parameter", (uint8_t *)&buf, 2u);
      }
    }
  }
}

- (void)ackXPCEvents
{
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = sub_100023880;
  v14[4] = sub_100023890;
  id v15 = +[NROSTransaction transactionWithName:@"waitForLaunchEvents"];
  id v3 = nr_daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = nr_daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ackXPCEvents", buf, 2u);
    }
  }
  [(NRPairingDaemon *)self checkLaunchNotificationsSetup];
  id v6 = +[NRQueue globalQueueWithIdentifier:21];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100032C18;
  v12[3] = &unk_1001657F0;
  v12[4] = v14;
  [v6 dispatchAsync:v12];

  id v7 = +[NRQueue registryDaemonQueue];
  BOOL v8 = [v7 queue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100032C60;
  v11[3] = &unk_100166BE8;
  void v11[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v8, v11);

  BOOL v9 = +[NRQueue registryDaemonQueue];
  id v10 = [v9 queue];
  xpc_set_event_stream_handler("com.apple.MobileGestalt.MobileGestaltEvents", v10, &stru_100166C28);

  _Block_object_dispose(v14, 8);
}

- (void)allocateDictionaries
{
  id v3 = +[NSMutableArray array];
  bluetoothInitBlocks = self->_bluetoothInitBlocks;
  self->_bluetoothInitBlocks = v3;

  id v5 = (NSLock *)objc_alloc_init((Class)NSLock);
  bluetoothInitBlockLock = self->_bluetoothInitBlockLock;
  self->_bluetoothInitBlockLock = v5;

  id v7 = +[NSMutableSet set];
  outstandingBluetoothConnectRequests = self->_outstandingBluetoothConnectRequests;
  self->_outstandingBluetoothConnectRequests = v7;

  if (!self->_bluetoothDiscoveryEventDedupe)
  {
    BOOL v9 = +[NSMutableSet set];
    bluetoothDiscoveryEventDedupe = self->_bluetoothDiscoveryEventDedupe;
    self->_bluetoothDiscoveryEventDedupe = v9;
    _objc_release_x1(v9, bluetoothDiscoveryEventDedupe);
  }
}

- (int)getNotifyTokenWithName:(id)a3
{
  int out_token = -1;
  id v3 = a3;
  if (notify_register_check((const char *)[v3 UTF8String], &out_token))
  {
    BOOL v4 = nr_daemon_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      id v6 = nr_daemon_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v11 = v3;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Failed to get notify token for %@", buf, 0xCu);
      }
    }
  }
  int v7 = out_token;

  return v7;
}

- (void)updateNotifyToken:(int)a3 withValue:(unint64_t)a4 withNotificationName:(id)a5 alwaysPost:(BOOL)a6
{
  BOOL v6 = a6;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100033614;
  v18[3] = &unk_100166C50;
  id v9 = a5;
  id v19 = v9;
  unint64_t v20 = a4;
  int v21 = a3;
  id v10 = objc_retainBlock(v18);
  if (a3 == -1)
  {
    id v14 = nr_daemon_log();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);

    if (v15)
    {
      id v16 = nr_daemon_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1000F7908();
      }
    }
  }
  else if (v6 || (uint64_t v17 = 0, notify_get_state(a3, &v17), v17 != a4))
  {
    ((void (*)(void *))v10[2])(v10);
  }
  else
  {
    id v11 = nr_daemon_log();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      id v13 = nr_daemon_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412546;
        id v23 = v9;
        __int16 v24 = 2048;
        unint64_t v25 = a4;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Skipping token %@ update, looks like it is already set to value %lld", buf, 0x16u);
      }
    }
  }
}

- (void)updateNotifyToken:(int)a3 withValue:(unint64_t)a4 withNotificationName:(id)a5
{
}

- (unint64_t)readNotifyToken:(int)a3
{
  if (a3 == -1) {
    return 0;
  }
  uint64_t state64 = 0;
  if (notify_get_state(a3, &state64)) {
    return 0;
  }
  else {
    return state64;
  }
}

- (void)registerManagedConfigurationChanged:(id)a3
{
  id v4 = a3;
  BOOL v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    int v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Registering for managed configuration updates", buf, 2u);
    }
  }
  if (!self->_mcConnection)
  {
    BOOL v8 = +[MCProfileConnection sharedConnection];
    mcConnection = self->_mcConnection;
    self->_mcConnection = v8;

    id v10 = +[NSNotificationCenter defaultCenter];
    uint64_t v11 = MCEffectiveSettingsChangedNotification;
    BOOL v12 = self->_mcConnection;
    id v13 = +[NSOperationQueue mainQueue];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    void v16[2] = sub_1000338F0;
    v16[3] = &unk_100166C78;
    id v17 = v4;
    id v14 = [v10 addObserverForName:v11 object:v12 queue:v13 usingBlock:v16];
    mcConnectionSettingsChangedNotificationToken = self->_mcConnectionSettingsChangedNotificationToken;
    self->_mcConnectionSettingsChangedNotificationToken = v14;
  }
}

- (BOOL)managedConfigurationWatchDisabled
{
  mcConnection = self->_mcConnection;
  if (!mcConnection)
  {
    id v4 = +[MCProfileConnection sharedConnection];
    BOOL v5 = self->_mcConnection;
    self->_mcConnection = v4;

    mcConnection = self->_mcConnection;
  }
  unsigned int v6 = [(MCProfileConnection *)mcConnection effectiveBoolValueForSetting:MCFeaturePairedWatchAllowed];
  int v7 = nr_daemon_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v9 = nr_daemon_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134217984;
      uint64_t v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "managedConfigurationWatchDisabled = %ld", (uint8_t *)&v11, 0xCu);
    }
  }
  return v6 == 2;
}

- (BOOL)isSecureDataAvailable
{
  id v2 = [(NRPairingDaemon *)self secureProperties];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)normalizeDaemonStateWithBlock:(id)a3
{
  id v4 = a3;
  BOOL v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    int v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v12 = "-[NRPairingDaemon normalizeDaemonStateWithBlock:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: trace", buf, 0xCu);
    }
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100033B94;
  v9[3] = &unk_100166B30;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(NRPairingDaemon *)self grabHistoryWithReadBlock:v9];
}

- (void)getEnsureActiveDeviceWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    int v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v12 = "-[NRPairingDaemon getEnsureActiveDeviceWithCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: trace", buf, 0xCu);
    }
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100033F9C;
  v9[3] = &unk_1001668B0;
  id v10 = v4;
  id v8 = v4;
  [(NRPairingDaemon *)self grabRegistryWithReadBlock:v9];
}

- (void)voidIDSService:(Class)a3
{
  id v4 = [(EPServiceRegistry *)self->_serviceRegistry optionalServiceFromClass:a3];
  [(EPServiceRegistry *)self->_serviceRegistry removeService:v4];
  [v4 invalidate];
}

- (BOOL)isBluetoothConnected:(int64_t)a3
{
  return a3 != 0;
}

- (BOOL)isBluetoothPoweredOn:(int64_t)a3
{
  return a3 == 5 || a3 == 10;
}

- (BOOL)isBluetoothConnected
{
  id v3 = [(CBCentralManager *)self->_central state];

  return [(NRPairingDaemon *)self isBluetoothConnected:v3];
}

- (BOOL)isBluetoothPoweredOn
{
  id v3 = [(CBCentralManager *)self->_central state];

  return [(NRPairingDaemon *)self isBluetoothPoweredOn:v3];
}

- (void)updateIsPairedTelemetryKey
{
  if (!qword_1001A1100)
  {
    uint64_t v3 = +[NSTimer scheduledTimerWithTimeInterval:self target:"updateIsPairedTelemetryKey" selector:0 userInfo:1 repeats:43200.0];
    id v4 = (void *)qword_1001A1100;
    qword_1001A1100 = v3;
  }

  [(NRPairingDaemon *)self grabRegistryWithReadBlock:&stru_100166CB8];
}

- (void)forceEndDiscovery
{
  uint64_t v3 = nr_daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    BOOL v5 = nr_daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      BOOL v15 = "-[NRPairingDaemon forceEndDiscovery]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: trace", (uint8_t *)&v14, 0xCu);
    }
  }
  BOOL v6 = nr_daemon_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = nr_daemon_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Making the call to Bluetooth central stopScan", (uint8_t *)&v14, 2u);
    }
  }
  [(CBCentralManager *)self->_central stopScan];
  self->_bluetoothIsScanning = 0;
  if (self->_useNetworkRelayPairing && self->_networkRelayPairerIsScanning)
  {
    id v9 = nr_daemon_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      int v11 = nr_daemon_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Making the call to NetworkRelayPairer to stop discovery", (uint8_t *)&v14, 2u);
      }
    }
    uint64_t v12 = +[NRNetworkRelayPair sharedInstance];
    [v12 stopScanningForCandidatesWithDelegate:self];
    self->_networkRelayPairerIsScanning = 0;
  }
  [(NSMutableSet *)self->_bluetoothDiscoveryEventDedupe removeAllObjects];
  [(NRSimpleReferenceCounter *)self->_pushingClients removeAllObjects];
  [(NRSimpleReferenceCounter *)self->_discoveringClients removeAllObjects];
  discoveryTransaction = self->_discoveryTransaction;
  self->_discoveryTransaction = 0;
}

- (void)sendXPCDeviceNeedsPasscodeMessage:(id)a3 passcode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = nr_daemon_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    BOOL v10 = nr_daemon_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v6 UUIDString];
      uint64_t v12 = (void *)v11;
      CFStringRef v13 = @"present";
      if (!v7) {
        CFStringRef v13 = @"absent";
      }
      *(_DWORD *)long long buf = 138543618;
      uint64_t v21 = v11;
      __int16 v22 = 2112;
      CFStringRef v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "sendXPCDeviceNeedsPasscodeMessage: pairingID=%{public}@ passcode=%@", buf, 0x16u);
    }
  }
  pairingClients = self->_pairingClients;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  void v17[2] = sub_100034938;
  v17[3] = &unk_100166CE0;
  id v18 = v6;
  id v19 = v7;
  id v15 = v7;
  id v16 = v6;
  [(NRSimpleReferenceCounter *)pairingClients enumerateObjects:v17];
}

- (void)refreshPropertyCache
{
  uint64_t v3 = [(EPServiceRegistry *)self->_serviceRegistry optionalServiceFromClass:objc_opt_class()];
  BOOL v4 = [(EPServiceRegistry *)self->_serviceRegistry optionalServiceFromClass:objc_opt_class()];
  BOOL v5 = [(NRMutableDevice *)self->_mirrorOfActiveDevice objectForKeyedSubscript:_NRDevicePropertyBluetoothIdentifier];
  id v6 = [v5 value];

  id v7 = [v3 defaultPairedDevice];
  if (([v7 isConnected] & 1) == 0) {
    goto LABEL_13;
  }
  id v8 = [v3 defaultPairedDevice];
  BOOL v9 = [v8 nsuuid];
  if (([v6 isEqual:v9] & 1) == 0)
  {
LABEL_12:

LABEL_13:
    goto LABEL_14;
  }
  BOOL v10 = [v4 defaultPairedDevice];
  if (![v10 isConnected])
  {

    goto LABEL_12;
  }
  uint64_t v11 = [v4 defaultPairedDevice];
  uint64_t v12 = [v11 nsuuid];
  unsigned int v16 = [v6 isEqual:v12];

  if (v16)
  {
    if (self->_initRemoteProperties)
    {
      self->_initRemoteProperties = 0;
      CFStringRef v13 = nr_daemon_log();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

      if (v14)
      {
        id v15 = nr_daemon_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "refreshPropertyCache: IDS is paired AND connected! Sending all the properties now.", buf, 2u);
        }
      }
      [(NRLocalPropertyMonitor *)self->_localProperties registerForNotifications];
      [(NRLocalPropertyMonitor *)self->_localProperties refreshPropertyCache];
      [(NRPairingDaemon *)self initializeTrafficClassBlock:0];
    }
    else
    {
      [(NRLocalPropertyMonitor *)self->_localProperties pollProperties];
    }
  }
LABEL_14:
}

- (void)deleteLocalPairingStore:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = nr_daemon_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = nr_daemon_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = [v5 UUIDString];
      int v13 = 138543362;
      BOOL v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "deviceID=%{public}@", (uint8_t *)&v13, 0xCu);
    }
  }
  if (v5)
  {
    BOOL v10 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
    uint64_t v11 = +[NRQueue registryDaemonQueue];
    uint64_t v12 = [v11 queue];
    [v10 deletePairedStoreWithUUID:v5 withQueue:v12 withCompletion:0];
  }
}

- (void)localMonitor:(id)a3 propertiesDidChange:(id)a4 thisIsAllOfThem:(BOOL)a5
{
  if (!self->_initRemoteProperties) {
    [(NRPairingDaemon *)self idsSendProperties:a4 thisIsAllOfThem:a5];
  }
}

- (void)idsSendProperties:(id)a3 thisIsAllOfThem:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 count])
  {
    BOOL v7 = nr_daemon_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v8)
    {
      BOOL v9 = nr_daemon_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v6;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Sending properties: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    BOOL v10 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
    uint64_t v11 = v10;
    if (v10
      && ([v10 defaultPairedDevice],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          unsigned int v13 = [v12 isConnected],
          v12,
          v13))
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v32 = 0x3032000000;
      id v33 = sub_100023880;
      uint64_t v34 = sub_100023890;
      BOOL v14 = [(NRMutableDevice *)self->_mirrorOfActiveDevice objectForKeyedSubscript:_NRDevicePropertyBluetoothIdentifier];
      id v35 = [v14 value];

      if (*(void *)(*((void *)&buf + 1) + 40)) {
        goto LABEL_10;
      }
      id v15 = [v11 defaultPairedDevice];
      uint64_t v16 = [v15 nsuuid];
      id v17 = *(void **)(*((void *)&buf + 1) + 40);
      *(void *)(*((void *)&buf + 1) + 40) = v16;

      if (*(void *)(*((void *)&buf + 1) + 40))
      {
LABEL_10:
        id v18 = self;
        uint64_t v19 = *(void *)(*((void *)&buf + 1) + 40);
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_1000350D0;
        v27[3] = &unk_100166D30;
        BOOL v30 = v4;
        void v27[4] = v18;
        p_long long buf = &buf;
        unint64_t v20 = v18;
        uint64_t v28 = v20;
        [v11 sendPropertyChanges:v6 isAllProperties:v4 toIDSBTUUID:v19 withSentBlock:v27];
      }
      else
      {
        __int16 v24 = nr_daemon_log();
        BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);

        if (v25)
        {
          id v26 = nr_daemon_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            sub_1000F79A4();
          }
        }
        self->_initRemoteProperties = 1;
      }
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      uint64_t v21 = nr_daemon_log();
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

      if (v22)
      {
        CFStringRef v23 = nr_daemon_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          sub_1000F7970();
        }
      }
      self->_initRemoteProperties = 1;
    }
  }
}

- (void)updateDeviceID:(id)a3 withProperties:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9 && [v9 count])
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10003540C;
    v11[3] = &unk_100166D58;
    id v12 = v9;
    id v13 = v8;
    BOOL v14 = self;
    id v15 = v10;
    [(NRPairingDaemon *)self grabRegistryWithWriteBlockAsync:v11];
  }
}

- (void)deleteUnexpectedIDSPairedDevicesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    BOOL v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      id v12 = "-[NRPairingDaemon deleteUnexpectedIDSPairedDevicesWithCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: trace", buf, 0xCu);
    }
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100035994;
  v9[3] = &unk_100166860;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(NRPairingDaemon *)self grabRegistryWithReadBlockAsync:v9];
}

- (void)purgeIDSPairedDevicesExceptFor:(id)a3 withQueue:(id)a4 andCompletion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3020000000;
  int v33 = 2;
  dispatch_queue_t v10 = dispatch_queue_create("com.apple.NanoRegistry.purgeIDSPairedDevicesExceptFor", 0);
  uint64_t v11 = dispatch_get_global_queue(25, 0);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000360E8;
  v28[3] = &unk_100166DA8;
  id v30 = v9;
  id v31 = v32;
  id v29 = v8;
  id v12 = v8;
  id v13 = v9;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000361A8;
  v23[3] = &unk_100166E20;
  id v24 = v7;
  id v25 = v11;
  uint64_t v27 = objc_retainBlock(v28);
  BOOL v14 = v10;
  id v26 = v14;
  id v15 = v27;
  uint64_t v16 = v11;
  id v17 = v7;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000366E0;
  block[3] = &unk_100165A70;
  uint64_t v21 = v14;
  BOOL v22 = objc_retainBlock(v23);
  id v18 = v14;
  uint64_t v19 = v22;
  dispatch_async(v16, block);

  _Block_object_dispose(v32, 8);
}

- (id)IDSGetPairedDevices
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_100023880;
  id v18 = sub_100023890;
  id v19 = 0;
  id v2 = dispatch_semaphore_create(0);
  uint64_t v3 = dispatch_get_global_queue(21, 0);
  IDSGetPairedDevicesWithCompletionBlock();

  dispatch_time_t v4 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v2, v4))
  {
    id v5 = nr_daemon_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      id v7 = nr_daemon_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "IDS returned paired devices: nil", buf, 2u);
      }
    }
    id v8 = 0;
  }
  else
  {
    id v9 = nr_daemon_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      uint64_t v11 = nr_daemon_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = v15[5];
        *(_DWORD *)long long buf = 138543362;
        uint64_t v21 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "IDS returned paired devices: %{public}@", buf, 0xCu);
      }
    }
    id v8 = (id)v15[5];
  }

  _Block_object_dispose(&v14, 8);

  return v8;
}

- (void)setStatusCode:(unint64_t)a3 InCollection:(id)a4
{
  id v14 = a4;
  id v5 = [v14 activeDevice];

  if (v5)
  {
    BOOL v6 = +[NSMutableDictionary dictionary];
    id v7 = objc_alloc((Class)NRDevicePropertyDiff);
    id v8 = +[NSNumber numberWithUnsignedInteger:a3];
    id v9 = [v7 initWithValue:v8];

    id v10 = [objc_alloc((Class)NRDevicePropertyDiffType) initWithDiff:v9 andChangeType:1];
    [v6 setObject:v10 forKeyedSubscript:_NRDevicePropertyStatusCode];
    id v11 = [objc_alloc((Class)NRDeviceDiff) initWithDiffPropertyDiffs:v6];
    uint64_t v12 = [v14 activeDevice];
    id v13 = [v12 applyDiff:v11];
  }
}

- (void)statusCodeManager:(id)a3 electionOutcomeChanged:(unint64_t)a4
{
  [(NRPairingDaemon *)self setLastStatusCodeCache:a4];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_100036BC8;
  v6[3] = &unk_100166E70;
  void v6[4] = self;
  v6[5] = a4;
  [(NRPairingDaemon *)self grabRegistryWithWriteBlockAsync:v6];
}

- (void)_updateCompatibilityStateForDeviceID:(id)a3 withDeviceCollection:(id)a4
{
  BOOL v6 = (__CFString *)a3;
  id v7 = a4;
  id v8 = [v7 objectForKeyedSubscript:v6];
  id v9 = nr_daemon_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    id v11 = nr_daemon_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543618;
      CFStringRef v48 = v6;
      __int16 v49 = 1024;
      LODWORD(v50) = [v8 isActive];
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Updating compatibility state for device with pairing ID %{public}@; active = %{BOOL}d",
        buf,
        0x12u);
    }
  }
  uint64_t v12 = [v8 objectForKeyedSubscript:NRDevicePropertyModelNumber];
  id v13 = [v12 value];

  id v14 = [v8 objectForKeyedSubscript:_NRDevicePropertyCompatibilityState];
  id v15 = [v14 value];

  uint64_t v16 = [v8 objectForKeyedSubscript:NRDevicePropertyIsAltAccount];
  id v46 = [v16 value];

  id v17 = [v8 objectForKeyedSubscript:NRDevicePropertyMaxPairingCompatibilityVersion];
  id v18 = [v17 value];

  id v19 = [v8 objectForKeyedSubscript:_NRDevicePropertyStatusCode];
  unint64_t v20 = [v19 value];
  id v45 = [v20 integerValue];

  uint64_t v21 = [v8 objectForKeyedSubscript:NRDevicePropertyChipID];
  BOOL v22 = [v21 value];

  if (v18)
  {
    long long v42 = v15;
    unsigned int v43 = v13;
    long long v44 = v6;
    id v23 = v7;
    id v24 = self;
    CFStringRef v25 = (const __CFString *)[v18 integerValue];
    id v26 = +[NRPairingCompatibilityVersionInfo systemVersions];
    if ((uint64_t)v25 < (uint64_t)[v26 minPairingCompatibilityVersionWithChipID] || v22)
    {
      CFStringRef v28 = (const __CFString *)[v26 minPairingCompatibilityVersionForChipID:v22];
      id v29 = nr_daemon_log();
      BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);

      if (v30)
      {
        id v31 = nr_daemon_log();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          id v32 = [v26 maxPairingCompatibilityVersion];
          *(_DWORD *)long long buf = 134218496;
          CFStringRef v48 = v25;
          __int16 v49 = 2048;
          CFStringRef v50 = v28;
          __int16 v51 = 2048;
          id v52 = v32;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "watchVersion: %ld;                      allowedMinimumWatchVersion: %ld;                      maxPairingComp"
            "atibilityVersion: %ld",
            buf,
            0x20u);
        }
      }
      uint64_t v27 = &__kCFBooleanTrue;
      if ((uint64_t)v25 >= (uint64_t)v28 && (uint64_t)v25 <= (uint64_t)[v26 maxPairingCompatibilityVersion]) {
        uint64_t v27 = &__kCFBooleanFalse;
      }
    }
    else
    {
      uint64_t v27 = 0;
    }
    int v33 = nr_daemon_log();
    BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);

    self = v24;
    id v7 = v23;
    BOOL v6 = v44;
    id v15 = v42;
    if (v34)
    {
      id v35 = nr_daemon_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v36 = [v27 BOOLValue];
        CFStringRef v37 = @"NO";
        if (v36) {
          CFStringRef v37 = @"YES";
        }
        *(_DWORD *)long long buf = 138412290;
        CFStringRef v48 = v37;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Is device rev locked %@", buf, 0xCu);
      }
    }
    if (![v8 isPaired])
    {
      unsigned int v39 = [v8 isArchived] & (v45 != (id)4);
      if (v39) {
        uint64_t v38 = &off_1001768C8;
      }
      else {
        uint64_t v38 = &off_100176940;
      }
      id v13 = v43;
      if ((v39 & 1) != 0 || !v43) {
        goto LABEL_39;
      }
      unsigned int v40 = [v27 BOOLValue];
      id v41 = &off_100176928;
      goto LABEL_36;
    }
    id v13 = v43;
LABEL_26:
    if ([v8 isArchived])
    {
      uint64_t v38 = &off_1001768C8;
LABEL_39:
      [(NRPairingDaemon *)self _updateCompatibilityStateForDeviceID:v6 withDeviceCollection:v7 oldCompatibilityState:v15 newCompatibilityState:v38];

      goto LABEL_40;
    }
    unsigned int v40 = [v27 BOOLValue];
    id v41 = &off_1001768F8;
    if (!v46) {
      id v41 = &off_100176910;
    }
LABEL_36:
    if (v40) {
      id v41 = &off_1001768E0;
    }
    uint64_t v38 = v41;
    goto LABEL_39;
  }
  if ([v8 isPaired])
  {
    uint64_t v27 = 0;
    goto LABEL_26;
  }
LABEL_40:
}

- (void)_updateCompatibilityStateForDeviceID:(id)a3 withDeviceCollection:(id)a4 oldCompatibilityState:(id)a5 newCompatibilityState:(id)a6
{
  id v10 = a5;
  id v11 = (_UNKNOWN **)a6;
  uint64_t v12 = [a4 objectForKeyedSubscript:a3];
  id v13 = [(EPServiceRegistry *)self->_serviceRegistry optionalServiceFromClass:objc_opt_class()];
  if ([v11 isEqual:&off_1001768E0]
    && [v13 hasTransactionType:@"migration"])
  {
    id v14 = nr_daemon_log();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v15)
    {
      uint64_t v16 = nr_daemon_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v28) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "We are moving to update. But we are migrating. Differ setting the compatibility state for now.", (uint8_t *)&v28, 2u);
      }
    }
    id v11 = &off_100176928;
  }
  id v17 = nr_daemon_log();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

  if (v18)
  {
    id v19 = nr_daemon_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 138412802;
      id v29 = v10;
      __int16 v30 = 2112;
      id v31 = v11;
      __int16 v32 = 2114;
      int v33 = v12;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Updating compatibility state from (old)%@ to (new)%@ for device %{public}@", (uint8_t *)&v28, 0x20u);
    }
  }
  if (v11 && ([v11 isEqual:v10] & 1) == 0)
  {
    unint64_t v20 = +[NSMutableDictionary dictionary];
    id v21 = [objc_alloc((Class)NRDevicePropertyDiff) initWithValue:v11];
    id v22 = [objc_alloc((Class)NRDevicePropertyDiffType) initWithDiff:v21 andChangeType:1];
    [v20 setObject:v22 forKeyedSubscript:_NRDevicePropertyCompatibilityState];
    id v23 = [objc_alloc((Class)NRDeviceDiff) initWithDiffPropertyDiffs:v20];
    id v24 = [v12 applyDiff:v23];
    if ([v11 isEqualToNumber:&off_1001768E0])
    {
      unsigned int v25 = [(NRPairingDaemon *)self _isBridgeForeground];
      id v26 = +[NRRepeatingAlertEngine sharedInstance];
      [v26 setEnabled:v25 ^ 1 withName:@"PairedWatchIsIncompatible"];

      uint64_t v27 = +[NRRepeatingAlertEngine sharedInstance];
      [v27 presentAlertIfEnabledWithName:@"PairedWatchIsIncompatible"];
    }
    else if ([v10 isEqualToNumber:&off_1001768E0] {
           && ([v13 hasTransactionType:@"pair"] & 1) == 0)
    }
    {
      [(NRPairingDaemon *)self initiateSyncAfterSoftwareUpdateForDevice:v12];
    }
  }
}

- (void)initiateSyncAfterSoftwareUpdateForDevice:(id)a3
{
  id v4 = a3;
  id v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136446210;
      id v13 = "-[NRPairingDaemon initiateSyncAfterSoftwareUpdateForDevice:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003757C;
  v9[3] = &unk_100165730;
  id v10 = v4;
  id v11 = self;
  id v8 = v4;
  [(NRPairingDaemon *)self grabRegistryWithReadBlockAsync:v9];
}

- (void)createDeviceFromBluetoothPairRequestWithBluetoothPeer:(id)a3 advertisedName:(id)a4 withBlock:(id)a5
{
  id v7 = a5;
  id v8 = [a3 identifier];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000378B0;
  v10[3] = &unk_100166E98;
  id v11 = v7;
  id v9 = v7;
  [(NRPairingDaemon *)self getPairedPairingIDForBluetoothID:v8 completion:v10];
}

- (void)removeStaleDiscoveredDevices
{
  +[NSDate timeIntervalSinceReferenceDate];
  if (self->_lastDiscoveryPurgeSeconds != (uint64_t)v3)
  {
    self->_lastDiscoveryPurgeSeconds = (uint64_t)v3;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100037A30;
    v4[3] = &unk_100166510;
    void v4[4] = self;
    [(NRPairingDaemon *)self grabRegistryWithWriteBlockAsync:v4];
  }
}

- (void)removeCandidateDeviceWithName:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100037D14;
  v5[3] = &unk_100166510;
  id v6 = a3;
  id v4 = v6;
  [(NRPairingDaemon *)self grabRegistryWithWriteBlockAsync:v5];
}

- (void)createDeviceFromBluetoothDiscoveryWithAdvertisementData:(id)a3 withBluetoothPeer:(id)a4 withRSSI:(id)a5 withBlock:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  [(NRPairingDaemon *)self removeStaleDiscoveredDevices];
  id v14 = [v13 objectForKeyedSubscript:CBAdvertisementDataLocalNameKey];

  id v15 = [v11 integerValue];
  if (sub_10009C60C((uint64_t)v15) && [v14 length])
  {
    uint64_t v16 = +[NSDate date];
    id v17 = [v10 identifier];
    if (self->_bluetoothIsScanningToMatchThisDeviceID)
    {
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10003815C;
      v26[3] = &unk_100166EC0;
      v26[4] = self;
      id v27 = v14;
      id v28 = v16;
      id v29 = v11;
      id v30 = v17;
      id v32 = v15;
      id v31 = v12;
      [(NRPairingDaemon *)self grabRegistryWithReadBlock:v26];

      BOOL v18 = v27;
    }
    else
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000383AC;
      v19[3] = &unk_100166EE8;
      id v20 = v14;
      id v21 = self;
      id v22 = v11;
      id v23 = v17;
      id v25 = v15;
      id v24 = v12;
      [(NRPairingDaemon *)self grabRegistryWithReadBlock:v19];

      BOOL v18 = v20;
    }
  }
}

- (void)createDeviceFromNetworkRelayDiscoveryWithAdvertisementName:(id)a3 bluetoothIdentifier:(id)a4 withRSSI:(id)a5 withBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  [(NRPairingDaemon *)self removeStaleDiscoveredDevices];
  id v14 = [v13 integerValue];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100038704;
  v18[3] = &unk_100166F10;
  id v19 = v10;
  id v20 = self;
  id v22 = v12;
  id v23 = v14;
  id v21 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  [(NRPairingDaemon *)self grabRegistryWithReadBlock:v18];
}

- (void)_upsertDeviceDiscoveredBy:(unint64_t)a3 pairingID:(id)a4 advertisedName:(id)a5 bluetoothDeviceID:(id)a6 rssiValue:(int64_t)a7 withBlock:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  BOOL v18 = v17;
  if (v14)
  {
    id v19 = nr_daemon_log();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

    if (v20)
    {
      id v21 = nr_daemon_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134219010;
        unint64_t v35 = a3;
        __int16 v36 = 2112;
        id v37 = v14;
        __int16 v38 = 2112;
        id v39 = v15;
        __int16 v40 = 2112;
        id v41 = v16;
        __int16 v42 = 2048;
        int64_t v43 = a7;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "UPSERT device discoveredBy: %lu, pairingID: %@, advertisedName: %@, bluetoothDeviceID: %@, rssi: %ld", buf, 0x34u);
      }
    }
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100038B74;
    v24[3] = &unk_100166F38;
    v24[4] = self;
    id v25 = v15;
    int64_t v29 = a7;
    unint64_t v30 = a3;
    id v26 = v16;
    id v27 = v14;
    id v28 = v18;
    [(NRPairingDaemon *)self grabRegistryWithWriteBlockAsync:v24];

    id v22 = v25;
    goto LABEL_9;
  }
  if (v17)
  {
    id v23 = +[NRQueue registryDaemonQueue];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100038B60;
    v31[3] = &unk_100165A70;
    id v32 = 0;
    id v33 = v18;
    [v23 dispatchAsync:v31];

    id v22 = v33;
LABEL_9:
  }
}

- (id)_bluetoothIDFromPairingID:(id)a3
{
  id v4 = a3;
  id v5 = [(NRPairingDaemon *)self collection];
  id v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = [v6 objectForKeyedSubscript:_NRDevicePropertyBluetoothIdentifier];
  id v8 = [v7 value];

  return v8;
}

- (id)_bluetoothIDOfActiveDevice
{
  id v2 = [(NRPairingDaemon *)self collection];
  double v3 = [v2 activeDevice];
  id v4 = [v3 objectForKeyedSubscript:_NRDevicePropertyBluetoothIdentifier];
  id v5 = [v4 value];

  return v5;
}

- (void)getAdvertisedNameFromDeviceID:(id)a3 withCompletion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100039334;
  v8[3] = &unk_100166860;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(NRPairingDaemon *)self grabRegistryWithReadBlock:v8];
}

- (void)beginDiscovery:(BOOL)a3 withDeviceIDToDiscover:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  kdebug_trace();
  id v7 = nr_daemon_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v9 = nr_daemon_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      BOOL v20 = "-[NRPairingDaemon beginDiscovery:withDeviceIDToDiscover:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: trace", buf, 0xCu);
    }
  }
  if (!self->_discoveryTransaction)
  {
    id v10 = +[NROSTransaction transactionWithName:@"discovery"];
    discoveryTransaction = self->_discoveryTransaction;
    self->_discoveryTransaction = v10;
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  void v17[2] = sub_10003969C;
  v17[3] = &unk_100165530;
  void v17[4] = self;
  id v12 = v6;
  id v18 = v12;
  id v13 = objc_retainBlock(v17);
  [(NSMutableSet *)self->_bluetoothDiscoveryEventDedupe removeAllObjects];
  if (v4)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10003984C;
    v15[3] = &unk_100166A68;
    void v15[4] = self;
    id v16 = v13;
    [(NRPairingDaemon *)self grabRegistryWithWriteBlockAsync:v15];
  }
  else
  {
    id v14 = +[NRQueue registryDaemonQueue];
    [v14 dispatchAsync:v13];
  }
}

- (void)_beginNetworkRelayDiscovery
{
  double v3 = nr_daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = nr_daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Making the call to NetworkRelayPairer to start scanning", v7, 2u);
    }
  }
  id v6 = +[NRNetworkRelayPair sharedInstance];
  [v6 startScanningForCandidatesWithDelegate:self];
  self->_networkRelayPairerIsScanning = 1;
}

- (id)getOOBKey
{
  return 0;
}

- (void)sendXPCOOBKeyChanged:(id)a3
{
  id v4 = a3;
  id v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = "(data)";
      if (!v4) {
        BOOL v8 = "nil";
      }
      *(_DWORD *)long long buf = 136315138;
      id v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "sendXPCOOBKeyChanged with %s", buf, 0xCu);
    }
  }
  pairingClients = self->_pairingClients;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100039B3C;
  v11[3] = &unk_100166F60;
  id v12 = v4;
  id v10 = v4;
  [(NRSimpleReferenceCounter *)pairingClients enumerateObjects:v11];
}

- (BOOL)_requiresNetworkRelayPairingIdentifierUpdateForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:_NRDevicePropertyBluetoothIdentifier];
  id v5 = [v4 value];

  if (v5)
  {
    BOOL v6 = +[NetworkRelayAgent networkRelayIdentifierForBluetoothIdentifier:v5];
    if (v6)
    {
      id v7 = [v3 objectForKeyedSubscript:_NRDevicePropertyNetworkRelayIdentifier];
      BOOL v8 = [v7 value];

      if (v8) {
        LODWORD(v9) = [v8 isEqual:v6] ^ 1;
      }
      else {
        LOBYTE(v9) = 1;
      }
    }
    else
    {
      id v9 = networkrelay_pairing_log_handle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = [v5 UUIDString];
        int v12 = 138412290;
        id v13 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unable to retrieve NetworkRelayIdentifier for device with Bluetooth identifier %@", (uint8_t *)&v12, 0xCu);
      }
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return (char)v9;
}

- (void)_updateNetworkRelayIdentifierForDevicesInCollection:(id)a3
{
  id v4 = a3;
  id v5 = networkrelay_pairing_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v23 = "-[NRPairingDaemon _updateNetworkRelayIdentifierForDevicesInCollection:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  BOOL v6 = [v4 allPairingIDs];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v18;
    *(void *)&long long v8 = 138412290;
    long long v16 = v8;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        int v12 = [v4 objectForKeyedSubscript:*(void *)(*((void *)&v17 + 1) + 8 * (void)v11), v16];
        if ([v12 isPaired]
          && ([v12 isArchived] & 1) == 0
          && [(NRPairingDaemon *)self _requiresNetworkRelayPairingIdentifierUpdateForDevice:v12])
        {
          [(NRPairingDaemon *)self _updateNetworkRelayIdentifierForDevice:v12];
        }
        else
        {
          id v13 = networkrelay_pairing_log_handle();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            id v14 = [v12 pairingID];
            id v15 = [v14 UUIDString];
            *(_DWORD *)long long buf = v16;
            id v23 = v15;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Not updating NetworkRelayIdentifier for %@", buf, 0xCu);
          }
        }

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

- (void)_updateNetworkRelayIdentifierForDevice:(id)a3
{
  id v3 = a3;
  id v4 = networkrelay_pairing_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315138;
    id v14 = "-[NRPairingDaemon _updateNetworkRelayIdentifierForDevice:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v13, 0xCu);
  }

  id v5 = [v3 objectForKeyedSubscript:_NRDevicePropertyBluetoothIdentifier];
  BOOL v6 = [v5 value];

  if (v6)
  {
    id v7 = +[NetworkRelayAgent networkRelayIdentifierForBluetoothIdentifier:v6];
    if (v7)
    {
      long long v8 = +[NSMutableDictionary dictionary];
      id v9 = (char *)[objc_alloc((Class)NRDevicePropertyDiff) initWithValue:v7];
      id v10 = [objc_alloc((Class)NRDevicePropertyDiffType) initWithDiff:v9 andChangeType:1];
      [v8 setObject:v10 forKeyedSubscript:_NRDevicePropertyNetworkRelayIdentifier];
      id v11 = [objc_alloc((Class)NRDeviceDiff) initWithDiffPropertyDiffs:v8];
      id v12 = [v3 applyDiff:v11];
    }
    else
    {
      long long v8 = networkrelay_pairing_log_handle();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
LABEL_11:

        goto LABEL_12;
      }
      id v9 = [v6 UUIDString];
      int v13 = 138412290;
      id v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Unable to retrieve NetworkRelayIdentifier for device with Bluetooth identifier %@", (uint8_t *)&v13, 0xCu);
    }

    goto LABEL_11;
  }
  id v7 = networkrelay_pairing_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v13 = 138412290;
    id v14 = (const char *)v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Unable to update NetworkRelayIdentifier for device with no Bluetooth identifier: %@", (uint8_t *)&v13, 0xCu);
  }
LABEL_12:
}

- (id)getTrafficClassifiersForCompatibilityState:(unsigned __int16)a3
{
  int v3 = a3;
  id v4 = objc_opt_new();
  id v5 = v4;
  BOOL v6 = off_100169DA8;
  switch(v3)
  {
    case 0:
    case 1:
      BOOL v6 = off_100169D90;
      goto LABEL_6;
    case 2:
      [v4 addObject:@"com.apple.ids.trafficclass.nanoregistry.update"];
      goto LABEL_4;
    case 3:
LABEL_4:
      BOOL v6 = off_100169DA0;
      goto LABEL_6;
    case 4:
      goto LABEL_6;
    case 5:
      BOOL v6 = &off_100169DB0;
LABEL_6:
      [v5 addObject:*v6];
      break;
    default:
      break;
  }

  return v5;
}

- (void)updateTrafficClass
{
  int v3 = [(EPServiceRegistry *)self->_serviceRegistry optionalServiceFromClass:objc_opt_class()];
  uint64_t v4 = [v3 defaultPairedDevice];
  id v5 = (void *)v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10003A35C;
    v7[3] = &unk_100165730;
    v7[4] = self;
    id v8 = v3;
    [(NRPairingDaemon *)self grabRegistryWithReadBlockAsync:v7];
  }
}

- (id)localizedString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NSBundle bundleWithIdentifier:@"com.apple.private.NanoRegistry"];
  id v5 = [v4 localizedStringForKey:v3 value:&stru_10016A1E8 table:@"Localizable-tinker"];

  return v5;
}

- (void)xpcSubmitAlbertPairingReport:(id)a3
{
  id v4 = a3;
  id v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Sending Albert pairing report due to xpc client API request", buf, 2u);
    }
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003A7A8;
  v9[3] = &unk_100166860;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(NRPairingDaemon *)self grabRegistryWithReadBlock:v9];
}

- (void)xpcSubmitRTCPairingMetricForMetricID:(id)a3 withSuccess:(id)a4
{
}

- (void)xpcPairingClientDidEnterPhase:(id)a3 withBlock:(id)a4
{
  BOOL v6 = (NSString *)a3;
  id v7 = (void (**)(void))a4;
  id v8 = nr_daemon_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = nr_daemon_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      int v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Setup entered %{public}@ phase", (uint8_t *)&v12, 0xCu);
    }
  }
  pairingClientPhase = self->_pairingClientPhase;
  self->_pairingClientPhase = v6;

  v7[2](v7);
}

- (void)xpcPairingClientSetPairingParentName:(id)a3 pairingParentAltDSID:(id)a4 forPairingID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  void v16[2] = sub_10003AAA8;
  v16[3] = &unk_100166D58;
  id v17 = a5;
  id v18 = v10;
  id v19 = v11;
  id v20 = a6;
  id v12 = v20;
  id v13 = v11;
  id v14 = v10;
  id v15 = v17;
  [(NRPairingDaemon *)self grabRegistryWithWriteBlockAsync:v16];
}

- (void)xpcPairingClientSetAltAccountName:(id)a3 altDSID:(id)a4 forPairingID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  void v16[2] = sub_10003AF3C;
  v16[3] = &unk_100166D58;
  id v17 = a5;
  id v18 = v10;
  id v19 = v11;
  id v20 = a6;
  id v12 = v20;
  id v13 = v11;
  id v14 = v10;
  id v15 = v17;
  [(NRPairingDaemon *)self grabRegistryWithWriteBlockAsync:v16];
}

- (void)checkForWatchNeedsGraduation:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  if (!_NRIsInternalInstall()) {
    goto LABEL_8;
  }
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"FakeFoundTinkerGraduationPairing", @"com.apple.NanoRegistry", 0);
  BOOL v6 = nr_daemon_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = nr_daemon_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      BOOL v12 = AppBooleanValue != 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "found tinker watch override: %d", buf, 8u);
    }
  }
  if (AppBooleanValue)
  {
    v4[2](v4, 1);
  }
  else
  {
LABEL_8:
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10003B450;
    v9[3] = &unk_100166D80;
    id v10 = v4;
    [(NRPairingDaemon *)self xpcWatchNeedsGraduation:v9];
  }
}

- (void)xpcWatchNeedsGraduation:(id)a3
{
  id v3 = (void (**)(id, BOOL))a3;
  id v4 = nr_framework_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = nr_framework_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "xpcWatchNeedsGraduation", buf, 2u);
    }
  }
  v16[0] = kSecAttrLabel;
  BOOL v7 = +[NSString stringWithFormat:@"%@.%@", @"com.apple.nanoregistry", @"watchgraduation"];
  v17[0] = v7;
  v17[1] = @"com.apple.nanoregistry.watchgraduation";
  v16[1] = kSecAttrAccessGroup;
  void v16[2] = kSecClass;
  void v17[2] = kSecClassGenericPassword;
  v17[3] = kCFBooleanTrue;
  v16[3] = kSecAttrSynchronizable;
  void v16[4] = kSecAttrAccessible;
  void v17[4] = kSecAttrAccessibleAfterFirstUnlock;
  id v8 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:5];
  id v9 = [v8 mutableCopy];

  BOOL v10 = +[EPKeychain keyExistsInKeychain:@"watchgraduation" keychainGroup:@"com.apple.nanoregistry.watchgraduation" attributes:v9];
  id v11 = nr_framework_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (!v10)
  {
    if (!v12)
    {
      BOOL v10 = 0;
      goto LABEL_16;
    }
    id v13 = nr_framework_log();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    *(_WORD *)long long buf = 0;
    id v14 = "Did not find keychain data for watch graduation";
    goto LABEL_12;
  }
  if (!v12)
  {
    BOOL v10 = 1;
    goto LABEL_16;
  }
  id v13 = nr_framework_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    id v14 = "Found keychain data for watch graduation";
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
  }
LABEL_13:

LABEL_16:
  v3[2](v3, v10);
}

- (void)xpcClearWatchNeedsGraduation:(id)a3
{
  id v3 = (void (**)(id, void *))a3;
  id v4 = nr_framework_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = nr_framework_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "xpcClearWatchNeedsGraduation", buf, 2u);
    }
  }
  v18[0] = kSecAttrLabel;
  BOOL v7 = +[NSString stringWithFormat:@"%@.%@", @"com.apple.nanoregistry", @"watchgraduation"];
  v19[0] = v7;
  v19[1] = @"com.apple.nanoregistry.watchgraduation";
  v18[1] = kSecAttrAccessGroup;
  v18[2] = kSecClass;
  v19[2] = kSecClassGenericPassword;
  v19[3] = kCFBooleanTrue;
  v18[3] = kSecAttrSynchronizable;
  void v18[4] = kSecAttrAccessible;
  void v19[4] = kSecAttrAccessibleAfterFirstUnlock;
  id v8 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:5];
  id v9 = [v8 mutableCopy];

  BOOL v10 = +[EPKeychain removeKeyWithName:@"watchgraduation" keychainGroup:@"com.apple.nanoregistry.watchgraduation" attributes:v9];
  id v11 = nr_framework_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    if (v12)
    {
      id v13 = nr_framework_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v17 = v10;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Unable to delete graduation key from keychain: %@", buf, 0xCu);
      }
    }
    v3[2](v3, v10);
  }
  else
  {
    if (v12)
    {
      id v14 = nr_framework_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Deleted graduation key from keychain", buf, 2u);
      }
    }
    v3[2](v3, 0);
  }
  id v15 = +[NRRepeatingAlertEngine sharedInstance];
  [v15 clearUINotificationwithName:@"TinkerWatchFoundInAccount"];
}

- (void)xpcWatchBuddyCompletedSetupSteps:(id)a3
{
  id v4 = a3;
  BOOL v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    BOOL v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      id v15 = "-[NRPairingDaemon xpcWatchBuddyCompletedSetupSteps:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s - watch has completed all setup steps", buf, 0xCu);
    }
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003BB98;
  v12[3] = &unk_100166888;
  v12[4] = self;
  id v13 = v4;
  id v8 = v4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003BCCC;
  v10[3] = &unk_100166860;
  void v10[4] = self;
  id v11 = objc_retainBlock(v12);
  id v9 = v11;
  [(NRPairingDaemon *)self grabRegistryWithReadBlockAsync:v10];
}

- (void)xpcUpdateWatchBuddyStage:(unsigned int)a3 forPairingID:(id)a4
{
  id v6 = a4;
  BOOL v7 = nr_daemon_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v9 = nr_daemon_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315394;
      id v14 = "-[NRPairingDaemon xpcUpdateWatchBuddyStage:forPairingID:]";
      __int16 v15 = 1026;
      unsigned int v16 = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s stage: %{public}d", buf, 0x12u);
    }
  }
  if (v6)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10003BF34;
    v10[3] = &unk_100166F88;
    id v11 = v6;
    unsigned int v12 = a3;
    [(NRPairingDaemon *)self grabRegistryWithWriteBlockAsync:v10];
  }
}

- (void)_updateIsSetupPropertyForNewlyPairedDevice:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NRPairingDaemon *)self queuedNotIsPairedDeviceIDToMarkIsSetup];
  id v6 = [v4 pairingID];
  unsigned int v7 = [v5 isEqual:v6];

  if (v7)
  {
    BOOL v8 = nr_daemon_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      BOOL v10 = nr_daemon_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [v4 pairingID];
        int v14 = 138412290;
        __int16 v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "isSetup is queued, and now %@ isPaired, will try to set isSetup", (uint8_t *)&v14, 0xCu);
      }
    }
    [(NRPairingDaemon *)self _markDeviceIsSetupWhereApplicable:v4 bypassIsSetupNoCheck:1];
    [(NRPairingDaemon *)self setQueuedNotIsPairedDeviceIDToMarkIsSetup:0];
  }
  else
  {
    id v12 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"6F13FF03-6511-4180-BBF3-4C231C10D458"];
    unsigned __int8 v13 = [v4 supportsCapability:v12];

    if ((v13 & 1) == 0) {
      [(NRPairingDaemon *)self _markDeviceIsSetupWhereApplicable:v4 bypassIsSetupNoCheck:0];
    }
  }
}

- (void)_queueMarkDeviceIsSetup:(id)a3
{
  id v4 = a3;
  if ([v4 isPaired])
  {
    [(NRPairingDaemon *)self _markDeviceIsSetupWhereApplicable:v4 bypassIsSetupNoCheck:1];
  }
  else
  {
    BOOL v5 = nr_daemon_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      unsigned int v7 = nr_daemon_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v8 = [v4 pairingID];
        int v10 = 136315394;
        id v11 = "-[NRPairingDaemon _queueMarkDeviceIsSetup:]";
        __int16 v12 = 2112;
        unsigned __int8 v13 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s - device is not paired, queueing %@ to be marked as isSetup once the device is paired", (uint8_t *)&v10, 0x16u);
      }
    }
    BOOL v9 = [v4 pairingID];
    [(NRPairingDaemon *)self setQueuedNotIsPairedDeviceIDToMarkIsSetup:v9];
  }
}

- (void)_onRestartMarkPairedDevicesIsSetup:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 allPairingIDs];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      BOOL v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = [v4 objectForKeyedSubscript:*(void *)(*((void *)&v11 + 1) + 8 * (void)v9)];
        if (([v10 isArchived] & 1) == 0 && objc_msgSend(v10, "isPaired")) {
          [(NRPairingDaemon *)self _markDeviceIsSetupWhereApplicable:v10 bypassIsSetupNoCheck:0];
        }

        BOOL v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (id)_resolveIsSetupNumberForDevice:(id)a3
{
  uint64_t v4 = NRDevicePropertyIsSetup;
  BOOL v5 = [a3 objectForKeyedSubscript:NRDevicePropertyIsSetup];
  id v6 = [v5 value];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = nr_daemon_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v8)
    {
      BOOL v9 = nr_daemon_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000F7BC0(v4, v9, v10);
      }
    }
    long long v11 = [(NRPairingDaemon *)self secureProperties];
    id v12 = [v11 objectForKeyedSubscript:v6];
  }
  else
  {
    id v12 = v6;
  }

  return v12;
}

- (BOOL)_deviceIsInSetupBasedOnIsSetupValue:(id)a3
{
  id v3 = [(NRPairingDaemon *)self _resolveIsSetupNumberForDevice:a3];
  uint64_t v4 = v3;
  if (v3) {
    unsigned int v5 = [v3 BOOLValue] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)_markDeviceIsSetupWhereApplicable:(id)a3 bypassIsSetupNoCheck:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(NRPairingDaemon *)self _resolveIsSetupNumberForDevice:v6];
  BOOL v8 = v7;
  if (v7) {
    unsigned int v9 = [v7 BOOLValue];
  }
  else {
    unsigned int v9 = 1;
  }
  if (![v8 BOOLValue] && ((v9 | v4) & 1) != 0)
  {
    uint64_t v10 = [v6 objectForKeyedSubscript:NRDevicePropertyIsPaired];
    long long v11 = [v10 value];

    id v12 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"6F13FF03-6511-4180-BBF3-4C231C10D458"];
    unsigned int v13 = [v6 supportsCapability:v12];

    if (v13)
    {
      long long v14 = [(NRPairingDaemon *)self pairingClients];
      if ([v14 count]) {
        char v15 = 1;
      }
      else {
        char v15 = [v11 BOOLValue] ^ 1;
      }
    }
    else
    {
      char v15 = [v11 BOOLValue] ^ 1;
    }
    id v18 = nr_daemon_log();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

    if (v19)
    {
      id v20 = nr_daemon_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = [(NRPairingDaemon *)self pairingClients];
        int v34 = 67109632;
        *(_DWORD *)unint64_t v35 = v13;
        *(_WORD *)&v35[4] = 2048;
        *(void *)&v35[6] = [v21 count];
        *(_WORD *)&v35[14] = 1024;
        *(_DWORD *)&v35[16] = [v11 BOOLValue];
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "supportsEarlyPairedSync %{BOOL}d pairing client count %lu isPaired %{BOOL}d", (uint8_t *)&v34, 0x18u);
      }
    }
    id v22 = [v6 objectForKeyedSubscript:NRDevicePropertyPairingID];
    id v23 = [v22 value];

    id v24 = nr_daemon_log();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

    if (v15)
    {
      if (!v25)
      {
LABEL_29:

LABEL_30:
        goto LABEL_31;
      }
      id v26 = nr_daemon_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        int v34 = 136315650;
        *(void *)unint64_t v35 = "-[NRPairingDaemon _markDeviceIsSetupWhereApplicable:bypassIsSetupNoCheck:]";
        *(_WORD *)&v35[8] = 2112;
        *(void *)&v35[10] = v23;
        *(_WORD *)&v35[18] = 1024;
        int v36 = 1;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s - device %@ isInSetup: %{BOOL}d - Will not mark as isSetup", (uint8_t *)&v34, 0x1Cu);
      }
    }
    else
    {
      if (v25)
      {
        id v27 = nr_daemon_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          int v34 = 136315394;
          *(void *)unint64_t v35 = "-[NRPairingDaemon _markDeviceIsSetupWhereApplicable:bypassIsSetupNoCheck:]";
          *(_WORD *)&v35[8] = 2112;
          *(void *)&v35[10] = v23;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%s - Marking device %@ as isSetup", (uint8_t *)&v34, 0x16u);
        }
      }
      id v28 = objc_alloc((Class)NRDevicePropertyDiffType);
      id v29 = [objc_alloc((Class)NRDevicePropertyDiff) initWithValue:&__kCFBooleanTrue];
      id v26 = [v28 initWithDiff:v29 andChangeType:1];

      id v30 = objc_alloc((Class)NRDeviceDiff);
      uint64_t v37 = NRDevicePropertyIsSetup;
      __int16 v38 = v26;
      id v31 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      id v32 = [v30 initWithDiffPropertyDiffs:v31];

      id v33 = [v6 applyDiff:v32];
    }

    goto LABEL_29;
  }
  unsigned int v16 = nr_daemon_log();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

  if (v17)
  {
    long long v11 = nr_daemon_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v34 = 138412546;
      *(void *)unint64_t v35 = v8;
      *(_WORD *)&v35[8] = 1024;
      *(_DWORD *)&v35[10] = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Will not change isSetup to 1 based on isSetup value - isSetup: %@, isSetupNoAllowed: %{BOOL}d", (uint8_t *)&v34, 0x12u);
    }
    goto LABEL_30;
  }
LABEL_31:
}

- (void)updateFromBTState:(int64_t)a3
{
  unsigned int v5 = -[NRPairingDaemon isBluetoothPoweredOn:](self, "isBluetoothPoweredOn:");
  unsigned int v6 = [(NRPairingDaemon *)self isBluetoothConnected:a3];
  id v7 = nr_daemon_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    unsigned int v9 = nr_daemon_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v10 = @"NO";
      if (v6) {
        CFStringRef v11 = @"YES";
      }
      else {
        CFStringRef v11 = @"NO";
      }
      if (v5) {
        CFStringRef v10 = @"YES";
      }
      *(_DWORD *)long long buf = 138412546;
      CFStringRef v26 = v11;
      __int16 v27 = 2112;
      CFStringRef v28 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "connected=%@ poweredOn=%@", buf, 0x16u);
    }
  }
  if (v6)
  {
    [(NRPairingDaemon *)self grabPairingAgent];
    [(NSLock *)self->_bluetoothInitBlockLock lock];
    id v12 = [(NSMutableArray *)self->_bluetoothInitBlocks copy];
    [(NSMutableArray *)self->_bluetoothInitBlocks removeAllObjects];
    [(NSLock *)self->_bluetoothInitBlockLock unlock];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v13 = v12;
    id v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        BOOL v17 = 0;
        do
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v20 + 1) + 8 * (void)v17) + 16))();
          BOOL v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v15);
    }

    if (v5)
    {
      if (self->_bluetoothIsScanning)
      {
        id v18 = +[NRQueue registryDaemonQueue];
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_10003CE30;
        v19[3] = &unk_1001655F8;
        void v19[4] = self;
        [v18 dispatchAsync:v19];
      }
    }
  }
  else
  {
    [(NSMutableSet *)self->_bluetoothDiscoveryEventDedupe removeAllObjects];
  }
}

- (void)updateFromBTState
{
  id v3 = nr_daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    unsigned int v5 = nr_daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      id v7 = "-[NRPairingDaemon updateFromBTState]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: trace", (uint8_t *)&v6, 0xCu);
    }
  }
  [(NRPairingDaemon *)self updateFromBTState:[(CBCentralManager *)self->_central state]];
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = [a3 state];

  [(NRPairingDaemon *)self updateFromBTState:v4];
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
}

- (void)xpcSubmitServerRequestReportWithRequestType:(id)a3 duration:(double)a4 errorCode:(unsigned int)a5 block:(id)a6
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003D028;
  v8[3] = &unk_1001668B0;
  id v9 = a6;
  id v7 = v9;
  [(NRPairingDaemon *)self grabRegistryWithReadBlock:v8];
}

- (void)xpcServer:(id)a3 proxyDidSuspend:(id)a4
{
  id v5 = a4;
  int v6 = nr_daemon_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    BOOL v8 = nr_daemon_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136446466;
      __int16 v27 = "-[NRPairingDaemon xpcServer:proxyDidSuspend:]";
      __int16 v28 = 2112;
      id v29 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s: Proxy(%@)", buf, 0x16u);
    }
  }
  long long v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  long long v22 = sub_10003D2DC;
  long long v23 = &unk_100165530;
  id v24 = self;
  id v9 = v5;
  id v25 = v9;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, &v20);
  if ([(NRMutableDevice *)self->_mirrorOfActiveDevice isAltAccount])
  {
    CFStringRef v11 = [[NRPreferences alloc] initWithDomain:@"com.apple.NanoRegistry"];
    id v12 = [(NRPreferences *)v11 objectForKeyedSubscript:@"delayForTinkerAssertionRemoval"];
    [v12 doubleValue];
    double v14 = v13;

    if ((_NRIsInternalInstall() & (v14 > 0.0)) == 0) {
      double v14 = 30.0;
    }
    id v15 = nr_daemon_log();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

    if (v16)
    {
      BOOL v17 = nr_daemon_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134217984;
        __int16 v27 = *(const char **)&v14;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Will let go of assertion after %fseconds.", buf, 0xCu);
      }
    }
    id v18 = +[NRQueue registryDaemonQueue];
    BOOL v19 = [v18 queue];
    [(NRPairingDaemon *)self _scheduleTimerOnQueue:v19 afterDelay:v10 block:v14];
  }
  else
  {
    CFStringRef v11 = +[NRQueue registryDaemonQueue];
    [(NRPreferences *)v11 dispatchAsync:v10];
  }
}

- (void)xpcServer:(id)a3 proxyDidResume:(id)a4
{
  id v5 = a4;
  int v6 = nr_daemon_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    BOOL v8 = nr_daemon_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136446466;
      id v12 = "-[NRPairingDaemon xpcServer:proxyDidResume:]";
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s: Proxy(%@)", (uint8_t *)&v11, 0x16u);
    }
  }
  if ([(NRMutableDevice *)self->_mirrorOfActiveDevice isAltAccount])
  {
    id v9 = +[NRQueue registryDaemonQueue];
    dispatch_block_t v10 = [v9 queue];
    [(NRPairingDaemon *)self _cancelScheduleTimerOnQueue:v10];
  }
}

- (void)xpcServer:(id)a3 proxyDidDisconnect:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = nr_daemon_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    dispatch_block_t v10 = nr_daemon_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136446466;
      id v18 = "-[NRPairingDaemon xpcServer:proxyDidDisconnect:]";
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s: Proxy(%@)", buf, 0x16u);
    }
  }
  objc_initWeak((id *)buf, self);
  int v11 = +[NRQueue registryDaemonQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003D644;
  v13[3] = &unk_100167040;
  id v12 = v7;
  id v14 = v12;
  id v15 = self;
  objc_copyWeak(&v16, (id *)buf);
  [v11 dispatchAsync:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

- (void)_scheduleTimerOnQueue:(id)a3 afterDelay:(double)a4 block:(id)a5
{
  BOOL v8 = a3;
  id v9 = a5;
  dispatch_block_t v10 = v9;
  if (a4 < 0.0 || v8 == 0 || v9 == 0)
  {
    __int16 v13 = nr_daemon_log();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);

    if (v14)
    {
      id v15 = nr_daemon_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1000F7C44(v15, v16, v17, v18, v19, v20, v21, v22);
      }
    }
  }
  else
  {
    scheduledTimer = self->_scheduledTimer;
    if (scheduledTimer)
    {
      dispatch_source_cancel(scheduledTimer);
      id v24 = self->_scheduledTimer;
      self->_scheduledTimer = 0;
    }
    id v25 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v8);
    CFStringRef v26 = self->_scheduledTimer;
    self->_scheduledTimer = v25;

    __int16 v27 = self->_scheduledTimer;
    dispatch_time_t v28 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    dispatch_source_set_timer(v27, v28, 0xFFFFFFFFFFFFFFFFLL, 0);
    id v29 = self->_scheduledTimer;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10003DC38;
    v30[3] = &unk_100166210;
    void v30[4] = self;
    id v31 = v10;
    dispatch_source_set_event_handler(v29, v30);
    dispatch_resume((dispatch_object_t)self->_scheduledTimer);
  }
}

- (void)_cancelScheduleTimerOnQueue:(id)a3
{
  if (a3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003DD54;
    block[3] = &unk_1001655F8;
    void block[4] = self;
    dispatch_async((dispatch_queue_t)a3, block);
  }
  else
  {
    id v3 = nr_daemon_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = nr_daemon_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_1000F7CBC(v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
}

- (void)updateShouldMonitorProxy:(id)a3
{
  id v4 = a3;
  if ([(NRSimpleReferenceCounter *)self->_pairingClients containsObject:v4]
    || [(NRSimpleReferenceCounter *)self->_pushingClients containsObject:v4]
    || [(NRSimpleReferenceCounter *)self->_discoveringClients containsObject:v4]
    || [(NRSimpleReferenceCounter *)self->_advertisingClients containsObject:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    uint64_t v11 = [(NSMapTable *)self->_clientProxyToAssertionInfo objectForKey:v4];
    BOOL v5 = v11 != 0;
  }
  uint64_t v6 = nr_daemon_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    uint64_t v8 = nr_daemon_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (v5) {
        uint64_t v9 = "MONITORING";
      }
      else {
        uint64_t v9 = "NOT MONITORING";
      }
      uint64_t v10 = [v4 appPath];
      int v12 = 136315394;
      __int16 v13 = v9;
      __int16 v14 = 2112;
      id v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s pairing client %@", (uint8_t *)&v12, 0x16u);
    }
  }
  [v4 setMonitorClientForSuspension:v5];
}

- (void)setUpClientReferenceCounters
{
  if (!self->_pairingClients)
  {
    objc_initWeak(location, self);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10003E430;
    v31[3] = &unk_100167068;
    objc_copyWeak(&v32, location);
    void v31[4] = self;
    id v3 = objc_retainBlock(v31);
    id v4 = [[NRSimpleReferenceCounter alloc] initWithIdentifier:@"Pairing Clients Counter" allocateBlock:&stru_100167088 freeBlock:&stru_1001670A8 queue:0 async:0];
    pairingClients = self->_pairingClients;
    self->_pairingClients = v4;

    [(NRSimpleReferenceCounter *)self->_pairingClients setDidAddBlock:v3];
    [(NRSimpleReferenceCounter *)self->_pairingClients setDidRemoveBlock:v3];
    uint64_t v6 = [[NRSimpleReferenceCounter alloc] initWithIdentifier:@"Switching Clients Counter" allocateBlock:0 freeBlock:0 queue:0 async:0];
    switchingClients = self->_switchingClients;
    self->_switchingClients = v6;

    [(NRSimpleReferenceCounter *)self->_switchingClients setDidAddBlock:v3];
    [(NRSimpleReferenceCounter *)self->_switchingClients setDidRemoveBlock:v3];
    uint64_t v8 = [NRSimpleReferenceCounter alloc];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10003E534;
    v29[3] = &unk_100165E68;
    objc_copyWeak(&v30, location);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10003E574;
    v27[3] = &unk_100165E68;
    objc_copyWeak(&v28, location);
    uint64_t v9 = +[NRQueue registryDaemonQueue];
    uint64_t v10 = [v9 queue];
    uint64_t v11 = [(NRSimpleReferenceCounter *)v8 initWithIdentifier:@"Pushing Clients Counter" allocateBlock:v29 freeBlock:v27 queue:v10 async:1];
    pushingClients = self->_pushingClients;
    self->_pushingClients = v11;

    [(NRSimpleReferenceCounter *)self->_pushingClients setDidAddBlock:v3];
    [(NRSimpleReferenceCounter *)self->_pushingClients setDidRemoveBlock:v3];
    __int16 v13 = [NRSimpleReferenceCounter alloc];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10003E5B4;
    v25[3] = &unk_100165E68;
    objc_copyWeak(&v26, location);
    __int16 v14 = +[NRQueue delayPairingRequestQueue];
    id v15 = [v14 queue];
    uint64_t v16 = [(NRSimpleReferenceCounter *)v13 initWithIdentifier:@"Discovering Clients Counter" allocateBlock:0 freeBlock:v25 queue:v15 async:1];
    discoveringClients = self->_discoveringClients;
    self->_discoveringClients = v16;

    [(NRSimpleReferenceCounter *)self->_discoveringClients setDidAddBlock:v3];
    [(NRSimpleReferenceCounter *)self->_discoveringClients setDidRemoveBlock:v3];
    uint64_t v18 = [NRSimpleReferenceCounter alloc];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10003E5F4;
    v23[3] = &unk_100165E68;
    objc_copyWeak(&v24, location);
    uint64_t v19 = +[NRQueue delayPairingRequestQueue];
    uint64_t v20 = [v19 queue];
    uint64_t v21 = [(NRSimpleReferenceCounter *)v18 initWithIdentifier:@"Advertising Clients Counter" allocateBlock:0 freeBlock:v23 queue:v20 async:1];
    advertisingClients = self->_advertisingClients;
    self->_advertisingClients = v21;

    [(NRSimpleReferenceCounter *)self->_advertisingClients setDidAddBlock:v3];
    [(NRSimpleReferenceCounter *)self->_advertisingClients setDidRemoveBlock:v3];
    notify_post((const char *)[NRRestartedDarwinNotification cStringUsingEncoding:4]);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);

    objc_destroyWeak(&v32);
    objc_destroyWeak(location);
  }
}

- (void)xpcPairWithSimulator:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  nrGetPairingError();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v5, v6);
}

- (void)xpcUnpairWithSimulator:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  nrGetPairingError();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v5, v6);
}

- (void)xpcSwitchToSimulator:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  nrGetPairingError();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v5, v6);
}

- (int64_t)pairingVersionFromAdvertisedName:(id)a3
{
  id v3 = sub_10001381C(a3);
  id v4 = [v3 objectForKeyedSubscript:@"v"];
  id v5 = [v4 integerValue];

  return (int64_t)v5;
}

- (void)checkAndDisableStandAloneMode
{
  if (qword_1001A1108 != -1) {
    dispatch_once(&qword_1001A1108, &stru_1001670C8);
  }
}

- (void)xpcWaitForWatchPairingExtendedMetadataForAdvertisedName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = +[NRNetworkRelayPair candidateSupportsNetworkRelayPairing:v6];
  uint64_t v9 = nr_daemon_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    if (v10)
    {
      uint64_t v11 = nr_daemon_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        id v18 = v6;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Using NetworkRelayPair to wait for watch pairing extended metadata of %{public}@", buf, 0xCu);
      }
    }
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10003EBE4;
    v15[3] = &unk_100167118;
    id v16 = v7;
    int v12 = objc_retainBlock(v15);
    __int16 v13 = +[NRNetworkRelayPair sharedInstance];
    [v13 waitForWatchPairingExtendedMetadataForAdvertisedName:v6 completion:v12];
  }
  else
  {
    if (v10)
    {
      __int16 v14 = nr_daemon_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        id v18 = v6;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Using legacy path to wait for watch pairing extended metadata of %{public}@", buf, 0xCu);
      }
    }
    [(NRPairingDaemon *)self _xpcWaitForWatchPairingExtendedMetadataForAdvertisedName:v6 completion:v7];
  }
}

- (void)_xpcWaitForWatchPairingExtendedMetadataForAdvertisedName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  char v35 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  char v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  char v31 = 0;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10003EF38;
  v27[3] = &unk_100167140;
  id v8 = v6;
  id v28 = v8;
  id v9 = v7;
  id v29 = v9;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_10002D4D0;
  id v25 = sub_10002D4FC;
  id v26 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10003F054;
  v14[3] = &unk_1001671E0;
  uint64_t v17 = v32;
  id v18 = v34;
  v14[4] = self;
  uint64_t v19 = v30;
  BOOL v10 = objc_retainBlock(v27);
  id v16 = v10;
  uint64_t v20 = &v21;
  id v11 = v8;
  id v15 = v11;
  int v12 = objc_retainBlock(v14);
  __int16 v13 = (void *)v22[5];
  v22[5] = (uint64_t)v12;

  (*(void (**)(void))(v22[5] + 16))();
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);
}

- (void)xpcCompanionOOBDiscoverAndPairWithName:(id)a3 withOutOfBandPairingKey:(id)a4 withOptions:(id)a5 operationHasBegun:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __int16 v14 = nr_daemon_log();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);

  if (v15)
  {
    id v16 = nr_daemon_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1000F7DAC();
    }
  }
  uint64_t v17 = nr_daemon_log();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

  if (v18)
  {
    uint64_t v19 = nr_daemon_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543618;
      id v35 = v10;
      __int16 v36 = 2114;
      id v37 = v12;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "xpcCompanionOOBDiscoverAndPairWithName: advertisedName=%{public}@ options=%{public}@", buf, 0x16u);
    }
  }
  objc_initWeak((id *)buf, self);
  uint64_t v20 = [(NRPairingDaemon *)self lastCaller];
  objc_storeStrong((id *)&self->_pairingClientProxy, v20);
  pairingClients = self->_pairingClients;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10003FA4C;
  v27[3] = &unk_100167258;
  id v22 = v10;
  id v28 = v22;
  id v23 = v12;
  id v29 = v23;
  objc_copyWeak(&v33, (id *)buf);
  id v24 = v20;
  id v30 = v24;
  id v25 = v13;
  id v32 = v25;
  id v26 = v11;
  id v31 = v26;
  [(NRSimpleReferenceCounter *)pairingClients addObject:v24 withAllocationBlock:v27];

  objc_destroyWeak(&v33);
  objc_destroyWeak((id *)buf);
}

- (void)xpcCompanionPasscodePairWithDeviceID:(id)a3 withOptions:(id)a4 operationHasBegun:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = nr_daemon_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

  if (v12)
  {
    id v13 = nr_daemon_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000F7E7C(v8);
    }
  }
  objc_initWeak(&location, self);
  __int16 v14 = [(NRPairingDaemon *)self lastCaller];
  objc_storeStrong((id *)&self->_pairingClientProxy, v14);
  pairingClients = self->_pairingClients;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10004072C;
  v20[3] = &unk_1001672F8;
  id v16 = v8;
  id v21 = v16;
  id v17 = v9;
  id v22 = v17;
  objc_copyWeak(&v25, &location);
  id v18 = v14;
  id v23 = v18;
  id v19 = v10;
  id v24 = v19;
  [(NRSimpleReferenceCounter *)pairingClients addObject:v18 withAllocationBlock:v20];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

- (void)clearMagicSwitchAdvertisingIdentifierSeedIfNeeded
{
  v3[0] = 0;
  v3[1] = v3;
  v3[2] = 0x2020000000;
  char v4 = 1;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100041544;
  v2[3] = &unk_100166D08;
  v2[4] = v3;
  [(NRPairingDaemon *)self grabRegistryWithReadBlock:v2];
  _Block_object_dispose(v3, 8);
}

- (void)xpcGizmoOOBAdvertiseAndPairWithName:(id)a3 operationHasBegun:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = nr_daemon_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

  if (v9)
  {
    id v10 = nr_daemon_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000F7FE8();
    }
  }
  objc_initWeak(&location, self);
  id v11 = [(NRPairingDaemon *)self lastCaller];
  objc_storeStrong((id *)&self->_pairingClientProxy, v11);
  pairingClients = self->_pairingClients;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  void v16[2] = sub_1000418AC;
  v16[3] = &unk_100167348;
  id v13 = v6;
  id v17 = v13;
  objc_copyWeak(&v20, &location);
  id v14 = v7;
  id v19 = v14;
  id v15 = v11;
  id v18 = v15;
  [(NRSimpleReferenceCounter *)pairingClients addObject:v15 withAllocationBlock:v16];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)xpcBeginMigrationWithDeviceID:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000420E0;
  v8[3] = &unk_100167398;
  id v9 = a3;
  id v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  [(NRPairingDaemon *)self grabRegistryWithReadBlock:v8];
}

- (void)xpcBeginMigrationWithCompletion:(id)a3
{
  NSErrorUserInfoKey v7 = NSLocalizedDescriptionKey;
  CFStringRef v8 = @"Not implemented on watch";
  id v4 = a3;
  id v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  id v6 = +[NSError errorWithDomain:@"com.apple.NanoRegistry" code:1200 userInfo:v5];
  (*((void (**)(id, void *))a3 + 2))(v4, v6);
}

- (void)resetPhoneStateForNewPairing
{
  self->_syncTrapUIPushed = 0;
  [(NSMutableSet *)self->_waitForBridgeCompletedPairingIDs removeAllObjects];
  self->_monitoringPairingClientBeyondNewWatchPairingTransactionComplete = 0;
  self->_clientRequestedSuspensionOfMonitoringPairingClientBeyondNewWatchPairingTransactionComplete = 0;
}

- (void)resetWatchStateForNewPairing
{
  self->_syncTrapUIPushed = 0;
  [(NSMutableSet *)self->_waitForBridgeCompletedPairingIDs removeAllObjects];
  self->_monitoringPairingClientBeyondNewWatchPairingTransactionComplete = 0;
  self->_clientRequestedSuspensionOfMonitoringPairingClientBeyondNewWatchPairingTransactionComplete = 0;
  id v3 = +[NRAccountsManager sharedInstance];
  [v3 reset];
}

- (BOOL)supportsEarlyPairedSync
{
  id v2 = [(NRPairingDaemon *)self collection];
  id v3 = [v2 activeDevice];

  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"6F13FF03-6511-4180-BBF3-4C231C10D458"];
  if (![v3 supportsCapability:v4])
  {

    goto LABEL_5;
  }
  unsigned __int8 v5 = [v3 isAltAccount];

  if (v5)
  {
LABEL_5:
    BOOL v6 = 0;
    goto LABEL_6;
  }
  BOOL v6 = 1;
LABEL_6:

  return v6;
}

- (void)xpcGizmoPasscodeAdvertiseAndPairWithName:(id)a3 operationHasBegun:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v8 = nr_daemon_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

  if (v9)
  {
    id v10 = nr_daemon_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000F80C0();
    }
  }
  objc_initWeak(&location, self);
  id v11 = [(NRPairingDaemon *)self lastCaller];
  objc_storeStrong((id *)&self->_pairingClientProxy, v11);
  pairingClients = self->_pairingClients;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  void v16[2] = sub_100042A38;
  v16[3] = &unk_100167348;
  id v13 = v6;
  id v17 = v13;
  objc_copyWeak(&v20, &location);
  id v14 = v7;
  id v19 = v14;
  id v15 = v11;
  id v18 = v15;
  [(NRSimpleReferenceCounter *)pairingClients addObject:v15 withAllocationBlock:v16];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)handleDeadPairingClient:(id)a3
{
  id v4 = a3;
  if (!self->_monitoringPairingClientBeyondNewWatchPairingTransactionComplete
    || self->_clientRequestedSuspensionOfMonitoringPairingClientBeyondNewWatchPairingTransactionComplete
    || self->_syncTrapUIPushed)
  {
    unsigned __int8 v5 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
    id v6 = nrGetPairingError();
    [v5 clearTransactionsWithUserInfo:v4 error:v6];
  }
  else
  {
    id v7 = nr_daemon_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v8)
    {
      BOOL v9 = nr_daemon_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Starting unpair because pairing client exited", (uint8_t *)buf, 2u);
      }
    }
    objc_initWeak(buf, self);
    id v10 = +[NRQueue registryDaemonQueue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000432A4;
    v11[3] = &unk_100165E40;
    objc_copyWeak(&v13, buf);
    void v11[4] = self;
    id v12 = v4;
    [v10 dispatchAsync:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(buf);
  }
  self->_monitoringPairingClientBeyondNewWatchPairingTransactionComplete = 0;
}

- (void)xpcAbortPairingReason:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NRPairingDaemon *)self lastCaller];
  [(NRPairingDaemon *)self abortPairingReason:v7 proxy:v8 withBlock:v6];
}

- (void)abortPairingReason:(id)a3 proxy:(id)a4 withBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = nr_daemon_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    id v13 = nr_daemon_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v9 appPath];
      *(_DWORD *)long long buf = 138543618;
      id v26 = v14;
      __int16 v27 = 2114;
      id v28 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ called abort pairing with reason %{public}@", buf, 0x16u);
    }
  }
  if (![(NRMutableDevice *)self->_mirrorOfActiveDevice isAltAccount]
    || ([v9 appPath],
        id v15 = objc_claimAutoreleasedReturnValue(),
        [v15 lastPathComponent],
        id v16 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v17 = [v16 isEqual:@"sharingd"],
        v16,
        v15,
        (v17 & 1) == 0))
  {
    [(NRPairingDaemon *)self forceEndDiscovery];
    id v20 = [(EPServiceRegistry *)self->_serviceRegistry optionalServiceFromClass:objc_opt_class()];
    id v21 = [v9 appPath];
    [v20 setPairingReportErrorForPairingClient:v21 reason:v8];

    pairingClients = self->_pairingClients;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100043780;
    v23[3] = &unk_100166888;
    void v23[4] = self;
    id v24 = v10;
    [(NRSimpleReferenceCounter *)pairingClients removeAllObjectsWithCleanupBlock:v23];

LABEL_11:
    goto LABEL_12;
  }
  id v18 = nr_daemon_log();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

  if (v19)
  {
    id v20 = nr_daemon_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Ignoring sharingd abort", buf, 2u);
    }
    goto LABEL_11;
  }
LABEL_12:
}

- (void)xpcNotifyActivationCompleted:(id)a3 withSuccess:(BOOL)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000438D0;
    v7[3] = &unk_100165730;
    id v8 = v5;
    id v9 = self;
    [(NRPairingDaemon *)self grabRegistryWithReadBlockAsync:v7];
  }
}

- (void)xpcNotifyPasscode:(id)a3 withDeviceID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = nr_daemon_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = nr_daemon_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v7 UUIDString];
      int v13 = 138543618;
      id v14 = v11;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "xpcNotifyPasscode withDeviceID=%{public}@ passcode=%@", (uint8_t *)&v13, 0x16u);
    }
  }
  BOOL v12 = [(EPServiceRegistry *)self->_serviceRegistry optionalServiceFromClass:objc_opt_class()];
  [v12 notifyPasscode:v6];
}

- (void)xpcEnterCompatibilityState:(unsigned __int16)a3 withDeviceID:(id)a4
{
}

- (void)enterCompatibilityState:(unsigned __int16)a3 withDeviceID:(id)a4 withCompletion:(id)a5
{
  int v5 = a3;
  id v7 = a4;
  id v8 = nr_daemon_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = nr_daemon_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v7 UUIDString];
      *(_DWORD *)long long buf = 138543618;
      id v21 = v11;
      __int16 v22 = 1024;
      int v23 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "_enterCompatibilityState: deviceID=%{public}@ withCompatibilityState=%d", buf, 0x12u);
    }
  }
  if ((v5 & 0xFFFE) == 4)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100043D70;
    v18[3] = &unk_1001673C0;
    void v18[4] = self;
    id v12 = v7;
    id v19 = v12;
    int v13 = objc_retainBlock(v18);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100043EE0;
    v15[3] = &unk_100166860;
    id v16 = v12;
    id v17 = v13;
    id v14 = v13;
    [(NRPairingDaemon *)self grabRegistryWithReadBlockAsync:v15];
  }
}

- (void)xpcUnpairWithDeviceID:(id)a3 withOptions:(id)a4 operationHasBegun:(id)a5
{
  id v8 = a3;
  BOOL v9 = (__CFString *)a4;
  id v37 = a5;
  id v39 = [(NRPairingDaemon *)self lastCaller];
  [(NRPairingDaemon *)self removeAssertionsForProxy:v39 newDeviceID:v8];
  [(NRPairingDaemon *)self forceEndDiscovery];
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x2020000000;
  char v56 = 0;
  id v10 = nr_daemon_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    id v12 = nr_daemon_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      CFStringRef v58 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "xpcUnpairWithDeviceID: options=%@", buf, 0xCu);
    }
  }
  int v13 = [(__CFString *)v9 objectForKeyedSubscript:NRUnpairOptionObliterate];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v38 = [v13 BOOLValue];
  }
  else {
    unsigned int v38 = 1;
  }
  id v14 = [(__CFString *)v9 objectForKeyedSubscript:NRUnpairOptionBrick];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v15 = [v14 BOOLValue];
  }
  else {
    unsigned int v15 = 0;
  }
  id v16 = [(__CFString *)v9 objectForKeyedSubscript:@"BDE85C67-0FDD-4A95-A9B9-3CB5DD0C06A2"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v17 = [v16 BOOLValue];
  }
  else {
    unsigned int v17 = 0;
  }
  id v18 = [(__CFString *)v9 objectForKeyedSubscript:NRUnpairOptionStore];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v19 = [v18 BOOLValue];
    v17 &= v19 ^ 1;
    v15 &= v19 ^ 1;
    v38 &= v19 ^ 1;
  }
  else
  {
    unsigned int v19 = 0;
  }
  id v20 = [(__CFString *)v9 objectForKeyedSubscript:NRUnpairOptionUnpairAbortErrorReason];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v21 = objc_alloc_init(NRPairingReport);
    __int16 v22 = [v39 appPath];
    [(NRPairingReport *)v21 setPairingReportErrorForPairingClient:v22 reason:v20];
  }
  else
  {
    id v21 = 0;
  }
  int v23 = nr_daemon_log();
  BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

  if (v24)
  {
    id v25 = nr_daemon_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = v8;
      __int16 v27 = [v8 UUIDString];
      int v28 = MKBDeviceUnlockedSinceBoot();
      CFStringRef v29 = @"(nil)";
      *(_DWORD *)long long buf = 138544898;
      if (v27) {
        CFStringRef v29 = v27;
      }
      CFStringRef v58 = v29;
      __int16 v59 = 1024;
      unsigned int v60 = v38;
      __int16 v61 = 1024;
      unsigned int v62 = v15;
      __int16 v63 = 1024;
      unsigned int v64 = v19;
      __int16 v65 = 1024;
      unsigned int v66 = v17;
      __int16 v67 = 1024;
      BOOL v68 = v28 != 0;
      __int16 v69 = 1024;
      BOOL v70 = v21 != 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "xpcUnpairWithDeviceID: deviceID=%{public}@ shouldObliterate=%{BOOL}d shouldBrick=%{BOOL}d shouldStore=%{BOOL}d shouldPreserveESim=%{BOOL}d unlockedSinceBoot=%{BOOL}d, pairingReport=%{BOOL}d", buf, 0x30u);

      id v8 = v26;
    }
  }
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_10004455C;
  v50[3] = &unk_1001673E8;
  id v30 = v8;
  id v51 = v30;
  id v52 = self;
  id v54 = v55;
  id v31 = v39;
  id v53 = v31;
  [(NRPairingDaemon *)self grabHistoryWithReadBlock:v50];
  id v32 = +[NRQueue delayPairingRequestQueue];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1000447E4;
  v40[3] = &unk_100167410;
  id v45 = v55;
  v40[4] = self;
  id v33 = v30;
  id v41 = v33;
  char v46 = v38;
  id v34 = v31;
  id v42 = v34;
  char v47 = v15;
  char v48 = v19;
  char v49 = v17;
  id v35 = v21;
  int64_t v43 = v35;
  id v36 = v37;
  id v44 = v36;
  [v32 dispatchAsync:v40];

  _Block_object_dispose(v55, 8);
}

- (void)xpcSuspendPairingClientCrashMonitoring:(id)a3
{
  id v4 = (void (**)(void))a3;
  int v5 = [(NRPairingDaemon *)self lastCaller];
  id v6 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
  unsigned int v7 = [v6 requestSetResumable:1 userInfo:v5 forRunningOperationType:@"pair"];
  id v8 = nr_daemon_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = nr_daemon_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315394;
      int v13 = "-[NRPairingDaemon xpcSuspendPairingClientCrashMonitoring:]";
      __int16 v14 = 1024;
      unsigned int v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s resumableRequestAccepted: %d", buf, 0x12u);
    }
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100044B54;
  v11[3] = &unk_1001658B8;
  void v11[4] = self;
  [(NRPairingDaemon *)self grabRegistryWithReadBlock:v11];
  v4[2](v4);
}

- (void)xpcResumePairingClientCrashMonitoring:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (!CFPreferencesGetAppBooleanValue(@"store", @"com.apple.NanoRegistry", 0))
  {
    int v5 = [(NRPairingDaemon *)self lastCaller];
    id v6 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
    objc_initWeak(&location, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100044DC8;
    v9[3] = &unk_100167018;
    objc_copyWeak(&v11, &location);
    id v7 = v5;
    id v10 = v7;
    [v6 queueResumeCrashMonitoringRequest:v7 forRunningOperationType:@"pair" completion:v9];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100044E30;
    v8[3] = &unk_1001658B8;
    void v8[4] = self;
    [(NRPairingDaemon *)self grabRegistryWithReadBlock:v8];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  v4[2](v4);
}

- (void)xpcRetriggerUnpairInfoDialogWithBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v3 = +[NRRepeatingAlertEngine sharedInstance];
  [v3 presentAlertIfEnabledWithName:@"WatchUnexpectedlyUnpairedBridge"];

  v4[2]();
}

- (void)getCanPairAnotherDeviceWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100044FE4;
  v4[3] = &unk_100167460;
  int v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(NRPairingDaemon *)v5 grabRegistryWithReadBlock:v4];
}

- (BOOL)_isIDSPairedAndConsistentWithIDSDevices:(id)a3
{
  id v4 = a3;
  int v5 = [(NRMutableDevice *)self->_mirrorOfActiveDevice objectForKeyedSubscript:_NRDevicePropertyBluetoothIdentifier];
  id v6 = [v5 value];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v12, "isDefaultPairedDevice", (void)v17))
        {
          int v13 = [v12 nsuuid];
          unsigned int v14 = [v6 isEqual:v13];

          if (v14) {
            continue;
          }
        }
        BOOL v15 = 0;
        goto LABEL_13;
      }
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      BOOL v15 = 1;
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v15 = 1;
  }
LABEL_13:

  return v15;
}

- (void)remoteObject:(id)a3 isConnected:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    uint64_t v7 = [(EPServiceRegistry *)self->_serviceRegistry optionalServiceFromClass:objc_opt_class()];
    if ((id)v7 == v6)
    {
    }
    else
    {
      id v8 = (void *)v7;
      id v9 = [(EPServiceRegistry *)self->_serviceRegistry optionalServiceFromClass:objc_opt_class()];

      if (v9 != v6) {
        goto LABEL_7;
      }
    }
    [(NRPairingDaemon *)self refreshPropertyCache];
  }
LABEL_7:
  id v10 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];

  if (v10 == v6)
  {
    if (v4)
    {
      [(NRConnectivityPublisher *)self->_connectivityPublisher setConnected:1];
      [(NRPairingDaemon *)self resetIDSConnectivityTimeout];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100045614;
      v12[3] = &unk_1001658B8;
      v12[4] = self;
      [(NRPairingDaemon *)self grabRegistryWithReadBlockAsync:v12];
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10004575C;
    v11[3] = &unk_100166510;
    void v11[4] = self;
    [(NRPairingDaemon *)self grabRegistryWithWriteBlockAsync:v11];
  }
}

- (void)remoteObjectIDSServiceAvailable:(id)a3 withIDSDevice:(id)a4
{
  id v8 = a3;
  [(NRPairingDaemon *)self _isIDSReady];
  id v5 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];

  id v6 = v8;
  if (v5 == v8)
  {
    [(NRPairingDaemon *)self updateTrafficClass];
    uint64_t v7 = [v8 defaultPairedDevice];
    if (v7) {
      [(NRPairingDaemon *)self _updatePairedDevicePropertiesFromIDSDevice:v7 completion:0];
    }

    id v6 = v8;
  }
}

- (void)remoteObjectDevicesChanged:(id)a3
{
  id v4 = a3;
  [(NRPairingDaemon *)self _isIDSReady];
  id v5 = [(EPServiceRegistry *)self->_serviceRegistry optionalServiceFromClass:objc_opt_class()];

  if (v5 == v4)
  {
    id v7 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
    [v7 checkIfShouldRetryMigrationWhenIDSDevicesChange];
    id v6 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
    [v6 broadcastVersionChangeToDisconnectedWatches];
  }
}

- (void)getPairedPairedPairingIDForBluetoothID:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100045A4C;
  v8[3] = &unk_100166860;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(NRPairingDaemon *)self grabRegistryWithReadBlock:v8];
}

- (void)_notifyClients
{
  v3.receiver = self;
  v3.super_class = (Class)NRPairingDaemon;
  [(NRRegistryServer *)&v3 _notifyClients];
  [(NRPairingDaemon *)self checkLaunchNotificationsSetup];
}

- (void)checkLaunchNotificationsSetup
{
  if (qword_1001A1118 != -1) {
    dispatch_once(&qword_1001A1118, &stru_100167480);
  }
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3032000000;
  v4[3] = sub_100023880;
  void v4[4] = sub_100023890;
  id v5 = +[NROSTransaction transactionWithName:@"launchNotificationSetup"];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100045E50;
  void v3[3] = &unk_100166D08;
  v3[4] = v4;
  [(NRPairingDaemon *)self grabRegistryWithReadBlockAsync:v3];
  [(id)qword_1001A1110 setLaunchEvent:@"com.apple.purplebuddy.setupexited" enable:1];
  [(id)qword_1001A1110 setLaunchEvent:@"com.apple.mobile.keybagd.first_unlock" enable:1];
  _Block_object_dispose(v4, 8);
}

- (void)_isIDSReady
{
  objc_super v3 = +[NRQueue registryDaemonQueue];
  id v4 = [v3 queue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(EPServiceRegistry *)self->_serviceRegistry optionalServiceFromClass:objc_opt_class()];
  id v6 = [(EPServiceRegistry *)self->_serviceRegistry optionalServiceFromClass:objc_opt_class()];
  id v7 = [(EPServiceRegistry *)self->_serviceRegistry optionalServiceFromClass:objc_opt_class()];
  id v8 = [(EPServiceRegistry *)self->_serviceRegistry optionalServiceFromClass:objc_opt_class()];
  char v47 = [v5 defaultPairedDevice];
  char v46 = [v6 defaultPairedDevice];
  uint64_t v9 = [v7 defaultPairedDevice];
  uint64_t v10 = [v8 defaultPairedDevice];
  id v11 = nr_daemon_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    int v13 = nr_daemon_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      if (v47) {
        CFStringRef v14 = @"YES";
      }
      else {
        CFStringRef v14 = @"NO";
      }
      CFStringRef v45 = v14;
      if ([v5 hasAccounts]) {
        BOOL v15 = "hA";
      }
      else {
        BOOL v15 = "noA!";
      }
      int64_t v43 = v15;
      if ([v5 isDisconnected]) {
        int v16 = 68;
      }
      else {
        int v16 = 69;
      }
      int v42 = v16;
      CFStringRef v17 = @"NO";
      if (v46) {
        CFStringRef v17 = @"YES";
      }
      CFStringRef v44 = v17;
      if ([v6 hasAccounts]) {
        long long v18 = "hA";
      }
      else {
        long long v18 = "noA!";
      }
      id v41 = v18;
      if ([v6 isDisconnected]) {
        int v19 = 68;
      }
      else {
        int v19 = 69;
      }
      int v40 = v19;
      CFStringRef v20 = @"YES";
      if (!v9) {
        CFStringRef v20 = @"NO";
      }
      CFStringRef v39 = v20;
      unsigned int v21 = [v7 hasAccounts];
      __int16 v22 = "noA!";
      int v23 = "hA";
      if (!v21) {
        int v23 = "noA!";
      }
      unsigned int v38 = v23;
      if ([v7 isDisconnected]) {
        int v24 = 68;
      }
      else {
        int v24 = 69;
      }
      int v37 = v24;
      CFStringRef v25 = @"YES";
      if (!v10) {
        CFStringRef v25 = @"NO";
      }
      CFStringRef v36 = v25;
      if ([v8 hasAccounts]) {
        __int16 v22 = "hA";
      }
      *(_DWORD *)long long buf = 138417154;
      if ([v8 isDisconnected]) {
        int v26 = 68;
      }
      else {
        int v26 = 69;
      }
      CFStringRef v50 = v45;
      __int16 v51 = 2080;
      id v52 = v43;
      __int16 v53 = 2048;
      id v54 = v5;
      __int16 v55 = 2048;
      char v56 = v47;
      __int16 v57 = 1024;
      int v58 = v42;
      __int16 v59 = 2112;
      CFStringRef v60 = v44;
      __int16 v61 = 2080;
      unsigned int v62 = v41;
      __int16 v63 = 2048;
      unsigned int v64 = v6;
      __int16 v65 = 2048;
      unsigned int v66 = v46;
      __int16 v67 = 1024;
      int v68 = v40;
      __int16 v69 = 2112;
      CFStringRef v70 = v39;
      __int16 v71 = 2080;
      v72 = v38;
      __int16 v73 = 2048;
      v74 = v7;
      __int16 v75 = 2048;
      uint64_t v76 = v9;
      __int16 v77 = 1024;
      int v78 = v37;
      __int16 v79 = 2112;
      CFStringRef v80 = v36;
      __int16 v81 = 2080;
      id v82 = v22;
      __int16 v83 = 2048;
      long long v84 = v8;
      __int16 v85 = 2048;
      uint64_t v86 = v10;
      __int16 v87 = 1024;
      int v88 = v26;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Cloud=%@ %s [%p-%p]%c A=%@ %s [%p-%p]%c C=%@ %s [%p-%p]%c D=%@ %s [%p-%p]%c", buf, 0xBAu);
    }
  }
  if (!v9 || !v10)
  {
    if (!(v9 | v10)) {
      [(NRConnectivityPublisher *)self->_connectivityPublisher setConnected:0];
    }
    goto LABEL_48;
  }
  v48[0] = v9;
  v48[1] = v10;
  __int16 v27 = +[NSArray arrayWithObjects:v48 count:2];
  unsigned int v28 = [(NRPairingDaemon *)self _isIDSPairedAndConsistentWithIDSDevices:v27];

  if (!v28)
  {
LABEL_48:
    self->_initRemoteProperties = 1;
    [(NRLocalPropertyMonitor *)self->_localProperties unregisterFromNotifications];
    goto LABEL_49;
  }
  [(NRPairingDaemon *)self logIfVersionsAreOverridden];
  kdebug_trace();
  CFStringRef v29 = nr_daemon_log();
  BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);

  if (v30)
  {
    id v31 = nr_daemon_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "IDS account+device found", buf, 2u);
    }
  }
  id v32 = [(EPServiceRegistry *)self->_serviceRegistry optionalServiceFromClass:objc_opt_class()];
  [v32 accountAndDeviceReady];
  if (self->_useNetworkRelayPairing)
  {
    id v33 = +[NRNetworkRelayPair sharedInstance];
    [v33 accountAndDeviceReady];
  }
  id v34 = [(EPServiceRegistry *)self->_serviceRegistry optionalServiceFromClass:objc_opt_class()];
  id v35 = [(id)v9 nsuuid];
  [v34 idsAccountPlusDeviceReceivedWithBTID:v35];

LABEL_49:
}

- (void)presentWatchWasUpdatedAlertIfNeededForNewBuildVersion:(id)a3 oldBuildVersion:(id)a4
{
  id v11 = a3;
  id v5 = a4;
  uint64_t AppBooleanValue = CFPreferencesGetAppBooleanValue(@"hasAdvertisedFaceGallery", @"com.apple.NanoRegistry", 0);
  if (!AppBooleanValue)
  {
    uint64_t v7 = sub_100046720(AppBooleanValue, v5);
    if (v7)
    {
      if ((sub_100046720(v7, v11) & 1) == 0)
      {
        id v8 = +[NRRepeatingAlertEngine sharedInstance];
        [v8 resetStateForAlertWithName:@"PairedWatchWasUpdatedCheckoutFaceGallery"];

        uint64_t v9 = +[NRRepeatingAlertEngine sharedInstance];
        [v9 setEnabled:1 withName:@"PairedWatchWasUpdatedCheckoutFaceGallery"];

        CFPreferencesSetAppValue(@"hasAdvertisedFaceGallery", kCFBooleanTrue, @"com.apple.NanoRegistry");
        CFPreferencesAppSynchronize(@"com.apple.NanoRegistry");
      }
    }
  }
  uint64_t v10 = +[NRRepeatingAlertEngine sharedInstance];
  [v10 presentAlertsIfNeeded];
}

- (void)_updatePairedDevicePropertiesFromIDSDevice:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004684C;
  v8[3] = &unk_100166238;
  id v9 = a3;
  uint64_t v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  [(NRPairingDaemon *)self grabRegistryWithWriteBlockAsync:v8];
}

- (void)remoteObject:(id)a3 receivedUnpairRequestWithAdvertisedName:(id)a4 shouldObliterate:(BOOL)a5 shouldBrick:(BOOL)a6 shouldPreserveESim:(BOOL)a7 withPairingFailureCode:(id)a8 withAbortReason:(id)a9 withRequestIdentifier:(id)a10 fromIDSBTUUID:(id)a11
{
  id v27 = a3;
  id v17 = a4;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  id v22 = v20;
  int v23 = [v22 protobuf];
  if (CFPreferencesGetAppBooleanValue(@"storeBlockPairingFailure", @"com.apple.NanoRegistry", 0))
  {
    int v24 = nr_daemon_log();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

    if (v25)
    {
      int v26 = nr_daemon_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = "-[NRPairingDaemon remoteObject:receivedUnpairRequestWithAdvertisedName:shouldObl"
                                        "iterate:shouldBrick:shouldPreserveESim:withPairingFailureCode:withAbortReason:wi"
                                        "thRequestIdentifier:fromIDSBTUUID:]";
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s: skipping unpair on pairing failure due to store demo setup", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  else if (MKBDeviceUnlockedSinceBoot())
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v38 = 0x2020000000;
    BOOL v39 = a5;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000478E8;
    v28[3] = &unk_1001674F8;
    void v28[4] = self;
    id v29 = v21;
    id v30 = v17;
    p_long long buf = &buf;
    BOOL v35 = a6;
    BOOL v36 = a7;
    id v31 = v18;
    id v32 = v19;
    id v33 = v23;
    [(NRPairingDaemon *)self grabRegistryWithReadBlockAsync:v28];

    _Block_object_dispose(&buf, 8);
  }
}

- (id)_deviceFromIDSBTUUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v5 = [(NRPairingDaemon *)self collection];
    id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v20;
      uint64_t v9 = _NRDevicePropertyBluetoothIdentifier;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * v10);
        BOOL v12 = [(NRPairingDaemon *)self collection];
        int v13 = [v12 objectForKeyedSubscript:v11];

        uint64_t v14 = [v13 objectForKeyedSubscript:v9];
        BOOL v15 = [(id)v14 value];

        LOBYTE(v14) = [v15 isEqual:v4];
        if (v14) {
          goto LABEL_15;
        }

        if (v7 == (id)++v10)
        {
          id v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v7) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
LABEL_14:
    int v13 = 0;
LABEL_15:

    goto LABEL_16;
  }
  int v16 = nr_daemon_log();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

  if (v17)
  {
    id v5 = nr_daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000F8398();
    }
    goto LABEL_14;
  }
  int v13 = 0;
LABEL_16:

  return v13;
}

- (void)remoteObject:(id)a3 receivedPropertyChanges:(id)a4 isAllProperties:(BOOL)a5 fromIDSBTUUID:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  uint64_t v11 = nr_daemon_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    int v13 = nr_daemon_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      long long v21 = "-[NRPairingDaemon remoteObject:receivedPropertyChanges:isAllProperties:fromIDSBTUUID:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: trace", buf, 0xCu);
    }
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  void v16[2] = sub_100048104;
  v16[3] = &unk_100167520;
  void v16[4] = self;
  id v17 = v10;
  id v18 = v9;
  BOOL v19 = a5;
  id v14 = v9;
  id v15 = v10;
  [(NRPairingDaemon *)self grabRegistryWithReadBlock:v16];
}

- (void)remoteObject:(id)a3 receivedPropertyRequestWithRequestIdentifier:(id)a4 fromIDSBTUUID:(id)a5
{
  localProperties = self->_localProperties;
  id v7 = a4;
  id v9 = [(NRLocalPropertyMonitor *)localProperties properties];
  uint64_t v8 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
  [v8 sendPropertyResponseWithTimeout:0 withProperties:v9 withRequestIdentifier:v7 withSentBlock:0];
}

- (void)remoteObject:(id)a3 receivedAddTermsEvent:(id)a4 fromIDSBTUUID:(id)a5 responseBlock:(id)a6
{
  serviceRegistry = self->_serviceRegistry;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(EPServiceRegistry *)serviceRegistry serviceFromClass:objc_opt_class()];
  [v14 remoteObject:v13 receivedAddTermsEvent:v12 fromIDSBTUUID:v11 responseBlock:v10];
}

- (void)remoteObject:(id)a3 receivedCheckTermsEvent:(id)a4 fromIDSBTUUID:(id)a5 responseBlock:(id)a6
{
  serviceRegistry = self->_serviceRegistry;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(EPServiceRegistry *)serviceRegistry serviceFromClass:objc_opt_class()];
  [v14 remoteObject:v13 receivedCheckTermsEvent:v12 fromIDSBTUUID:v11 responseBlock:v10];
}

- (void)remoteObject:(id)a3 receivedSystemVersionBroadcast:(id)a4 fromDeviceID:(id)a5
{
  serviceRegistry = self->_serviceRegistry;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(EPServiceRegistry *)serviceRegistry serviceFromClass:objc_opt_class()];
  [v11 remoteObject:v10 receivedSystemVersionBroadcast:v9 fromDeviceID:v8];
}

- (void)assertionFactoryDidBecomeIdle:(id)a3
{
  id v4 = nr_daemon_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = nr_daemon_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      id v8 = "-[NRPairingDaemon assertionFactoryDidBecomeIdle:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
    }
  }
  [(NRPairingDaemon *)self transactionCoordinatorHasBecomeIdle];
}

- (void)resourceAvailabilityDidChange:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(NSMapTable *)self->_assertionToAssertionInfo objectForKey:v5];
    if ([v5 availability] == (id)1)
    {
      v13[0] = 0;
      v13[1] = v13;
      v13[2] = 0x3032000000;
      v13[3] = sub_100023880;
      void v13[4] = sub_100023890;
      id v14 = [v6 pairingID];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100048B60;
      v9[3] = &unk_1001675B8;
      id v12 = v13;
      id v10 = v6;
      id v11 = self;
      [(NRPairingDaemon *)self grabHistoryWithReadBlock:v9];

      _Block_object_dispose(v13, 8);
    }
    else if ([v5 availability] == (id)2)
    {
      int v7 = [v6 clientBlock];
      if (v7)
      {
        [v6 setClientBlock:0];
        id v8 = [v5 error];
        ((void (**)(void, void *, void))v7)[2](v7, v8, 0);
      }
      [(NRPairingDaemon *)self removeAssertionInfo:v6];
    }
  }
}

- (void)remoteObject:(id)a3 receivedTinkerMigrationRequestWithShouldCancel:(BOOL)a4 responseBlock:(id)a5
{
  BOOL v5 = a4;
  id v6 = (void (**)(id, void))a5;
  int v7 = nr_daemon_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v9 = nr_daemon_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v10 = @"NO";
      if (v5) {
        CFStringRef v10 = @"YES";
      }
      int v12 = 138412290;
      CFStringRef v13 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "receivedMigrationRequestWithShouldCancel:%@", (uint8_t *)&v12, 0xCu);
    }
  }
  if (v5) {
    id v11 = @"com.apple.nanoregistry.idsplugin.stopadvertising";
  }
  else {
    id v11 = @"com.apple.nanoregistry.idsplugin.startadvertising";
  }
  notify_post((const char *)[(__CFString *)v11 UTF8String]);
  v6[2](v6, 0);
}

- (void)remoteObject:(id)a3 receivedMigrationRequestWithShouldCancel:(BOOL)a4 responseBlock:(id)a5
{
  BOOL v5 = a4;
  id v6 = (void (**)(id, void))a5;
  int v7 = nr_daemon_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v9 = nr_daemon_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v10 = @"NO";
      if (v5) {
        CFStringRef v10 = @"YES";
      }
      int v12 = 138412290;
      CFStringRef v13 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "receivedMigrationRequestWithShouldCancel:%@", (uint8_t *)&v12, 0xCu);
    }
  }
  if (v5) {
    id v11 = @"com.apple.nanoregistry.idsplugin.stopadvertising";
  }
  else {
    id v11 = @"com.apple.nanoregistry.idsplugin.startadvertising";
  }
  notify_post((const char *)[(__CFString *)v11 UTF8String]);
  v6[2](v6, 0);
}

- (void)remoteObject:(id)a3 receivedMigratedAwayWithAdvertisedName:(id)a4
{
  id v5 = a4;
  id v6 = nr_daemon_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    BOOL v8 = nr_daemon_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "receivedMigratedAwayWithAdvertisedName:%@", buf, 0xCu);
    }
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000496C0;
  v10[3] = &unk_100165730;
  id v11 = v5;
  int v12 = self;
  id v9 = v5;
  [(NRPairingDaemon *)self grabRegistryWithReadBlock:v10];
}

- (void)xpcPingActiveGizmoWithPriority:(int)a3 withMessageSize:(int64_t)a4 withBlock:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100049B78;
  v8[3] = &unk_100167608;
  int v11 = a3;
  id v9 = a5;
  int64_t v10 = a4;
  void v8[4] = self;
  id v7 = v9;
  [(NRPairingDaemon *)self grabRegistryWithReadBlock:v8];
}

- (BOOL)shouldCollectPairingPerfStackshots
{
  int v2 = _NRIsInternalInstall();
  if (v2) {
    LOBYTE(v2) = CFPreferencesGetAppBooleanValue(@"shouldNotCollectPairingPerfStackshots", @"com.apple.NanoRegistry", 0) == 0;
  }
  return v2;
}

- (void)xpcGetMigrationPairingCharacteristicReadDataWithCompletion:(id)a3
{
  objc_super v3 = (void (**)(id, void))a3;
  id v4 = nr_daemon_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = nr_daemon_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Call to xpcGetMigrationPairingCharacteristicReadDataWithCompletion", v7, 2u);
    }
  }
  v3[2](v3, 0);
}

- (void)xpcPutMigrationChallengeCharacteristicWriteData:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  id v7 = nr_daemon_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v9 = nr_daemon_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Call to xpcPutMigrationChallengeCharacteristicWriteData(%@)", (uint8_t *)&v10, 0xCu);
    }
  }
  v6[2](v6, 0);
}

- (void)startPushing
{
  if (!self->_pushingReferenceCounter)
  {
    objc_super v3 = nr_daemon_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      id v5 = nr_daemon_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting to push watches", v16, 2u);
      }
    }
    [(NRPairingDaemon *)self checkAndDisableStandAloneMode];
    if (!CFPreferencesGetAppBooleanValue(@"pushDisabled", @"com.apple.NanoRegistry", 0))
    {
      id v6 = +[EPScalablePipeManagerManagerFactory sharedPipeManagerManagerFactory];
      id v7 = [v6 pipeManagerManagerWithName:@"com.apple.ep" type:1 priority:1];
      pusherPipeManager = self->_pusherPipeManager;
      self->_pusherPipeManager = v7;

      id v9 = [(EPScalablePipeManagerManager *)self->_pusherPipeManager newManagerWithDelegate:self];
      pusherPipe = self->_pusherPipe;
      self->_pusherPipe = v9;

      id v11 = +[NROSTransaction transactionWithName:@"watchPusher"];
      watchPusherTransaction = self->_watchPusherTransaction;
      self->_watchPusherTransaction = v11;

      CFStringRef v13 = (EPWatchPusher *)objc_opt_new();
      watchPusher = self->_watchPusher;
      self->_watchPusher = v13;

      if (self->_useNetworkRelayPairing)
      {
        id v15 = +[NetworkRelayAgent sharedInstance];
        [v15 startPushingCandidates];
      }
    }
  }
  ++self->_pushingReferenceCounter;
}

- (void)stopPushing
{
  int64_t pushingReferenceCounter = self->_pushingReferenceCounter;
  if (pushingReferenceCounter == 1)
  {
    BOOL v4 = nr_daemon_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      id v6 = nr_daemon_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Stopping watch pushing", v14, 2u);
      }
    }
    pusherPipe = self->_pusherPipe;
    self->_pusherPipe = 0;

    pusherPipeManager = self->_pusherPipeManager;
    self->_pusherPipeManager = 0;

    watchPusherTransaction = self->_watchPusherTransaction;
    self->_watchPusherTransaction = 0;

    [(EPWatchPusher *)self->_watchPusher invalidate];
    objc_storeStrong((id *)&self->_lastWatchPusher, self->_watchPusher);
    watchPusher = self->_watchPusher;
    self->_watchPusher = 0;

    if (self->_useNetworkRelayPairing)
    {
      id v11 = +[NetworkRelayAgent sharedInstance];
      [v11 stopPushingCandidates];
    }
    int64_t pushingReferenceCounter = self->_pushingReferenceCounter;
  }
  BOOL v12 = pushingReferenceCounter < 1;
  int64_t v13 = pushingReferenceCounter - 1;
  if (!v12) {
    self->_int64_t pushingReferenceCounter = v13;
  }
}

- (void)xpcStartWatchSetupPushWithBlock:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  BOOL v5 = [(NRPairingDaemon *)self lastCaller];
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  pairingClients = self->_pairingClients;
  BOOL v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  int v10 = sub_10004A2FC;
  id v11 = &unk_100167630;
  id v7 = v5;
  id v12 = v7;
  int64_t v13 = &v14;
  [(NRSimpleReferenceCounter *)pairingClients enumerateObjects:&v8];
  if (!*((unsigned char *)v15 + 24)) {
    -[NRSimpleReferenceCounter addObject:](self->_pushingClients, "addObject:", v7, v8, v9, v10, v11);
  }
  v4[2](v4);

  _Block_object_dispose(&v14, 8);
}

- (void)xpcStopWatchSetupPushWithBlock:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  id v5 = [(NRPairingDaemon *)self lastCaller];
  [(NRSimpleReferenceCounter *)self->_pushingClients removeObject:v5];
  v4[2](v4);
}

- (void)xpcSetMigrationConsented:(BOOL)a3 forDeviceID:(id)a4 withBlock:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v6) {
    [(NRPairingDaemon *)self checkAndDisableStandAloneMode];
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10004A474;
  v12[3] = &unk_100166058;
  id v13 = v8;
  uint64_t v14 = self;
  BOOL v16 = v6;
  id v15 = v9;
  id v10 = v9;
  id v11 = v8;
  [(NRPairingDaemon *)self grabRegistryWithReadBlock:v12];
}

- (void)xpcApplyDiff:(id)a3 withSecureProperties:(id)a4 block:(id)a5
{
  v5.receiver = self;
  v5.super_class = (Class)NRPairingDaemon;
  [(NRRegistryServer *)&v5 xpcApplyDiff:a3 withSecureProperties:a4 block:a5];
}

- (void)xpcClientInfo:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NRPairingDaemon;
  [(NRRegistryServer *)&v3 xpcClientInfo:a3];
}

- (void)xpcGetChangeHistoryWithBlock:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NRPairingDaemon;
  [(NRRegistryServer *)&v3 xpcGetChangeHistoryWithBlock:a3];
}

- (void)xpcGetDeviceCollectionWithBlock:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NRPairingDaemon;
  [(NRRegistryServer *)&v3 xpcGetDeviceCollectionWithBlock:a3];
}

- (void)xpcGetDiffSinceTokenValue:(unint64_t)a3 getSecureProperties:(BOOL)a4 withBlock:(id)a5
{
  v5.receiver = self;
  v5.super_class = (Class)NRPairingDaemon;
  [(NRRegistryServer *)&v5 xpcGetDiffSinceTokenValue:a3 getSecureProperties:a4 withBlock:a5];
}

- (void)xpcRetrieveSecureProperties:(id)a3 block:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)NRPairingDaemon;
  [(NRRegistryServer *)&v4 xpcRetrieveSecureProperties:a3 block:a4];
}

- (void)xpcSwitchIndex:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NRPairingDaemon;
  [(NRRegistryServer *)&v3 xpcSwitchIndex:a3];
}

- (void)xpcLongForInternalPreference:(id)a3 withBlock:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)NRPairingDaemon;
  [(NRRegistryServer *)&v4 xpcLongForInternalPreference:a3 withBlock:a4];
}

- (void)xpcBooleanForInternalPreference:(id)a3 withBlock:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)NRPairingDaemon;
  [(NRRegistryServer *)&v4 xpcBooleanForInternalPreference:a3 withBlock:a4];
}

- (void)xpcBeginMigrationWithDeviceID:(id)a3 passcode:(id)a4 withBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = nr_daemon_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    id v13 = nr_daemon_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [v8 UUIDString];
      int v16 = 138412290;
      char v17 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "xpcBeginMigrationWithDeviceID: Setting migration consent for device ID %@", (uint8_t *)&v16, 0xCu);
    }
  }
  id v15 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
  [v15 setPasscode:v10];

  [v15 setMigrationConsent:1 forDeviceID:v8 completion:v9];
}

- (void)remoteObjectReceivedWatchMigrationCompletion:(unint64_t)a3
{
  id v7 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
  [v7 migrationCompletionRequestReceivedWithStatus:a3];
  objc_super v5 = objc_opt_new();
  BOOL v6 = [(NRPairingDaemon *)self mirrorOfActiveDeviceID];
  [v5 submitPairingReportWithRegistry:self deviceID:v6];
}

- (void)remoteObjectReveivedWatchMigrationMetricSessionID:(id)a3
{
  serviceRegistry = self->_serviceRegistry;
  id v4 = a3;
  id v5 = [(EPServiceRegistry *)serviceRegistry serviceFromClass:objc_opt_class()];
  [v5 migrationMetricSessionIDReceivedWithID:v4];
}

- (int64_t)minPairingCompatibilityVersion
{
  int v2 = +[NRPairingCompatibilityVersionInfo systemVersions];
  id v3 = [v2 minPairingCompatibilityVersion];

  return (int64_t)v3;
}

- (int64_t)maxPairingCompatibilityVersion
{
  int v2 = +[NRPairingCompatibilityVersionInfo systemVersions];
  id v3 = [v2 maxPairingCompatibilityVersion];

  return (int64_t)v3;
}

- (void)xpcGetLastMigrationRequestPhoneNameWithCompletion:(id)a3
{
  serviceRegistry = self->_serviceRegistry;
  id v4 = (void (**)(id, void *))a3;
  id v6 = [(EPServiceRegistry *)serviceRegistry serviceFromClass:objc_opt_class()];
  id v5 = [v6 lastMigrationRequestPhoneName];
  v4[2](v4, v5);
}

- (void)keychainSyncStatusDidChange:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10004B2C8;
  void v3[3] = &unk_1001676A0;
  BOOL v4 = a3;
  [(NRPairingDaemon *)self grabRegistryWithWriteBlockAsync:v3];
}

- (void)resetIDSConnectivityTimeout
{
  self->_idsConnectivityTimedOut = 0;
  [(AbstractTimer *)self->_idsConnectivityTimer invalidate];
  idsConnectivityTimer = self->_idsConnectivityTimer;
  self->_idsConnectivityTimer = 0;
}

- (void)startIDSConnectivityTimeout
{
  if (!self->_idsConnectivityTimer && !self->_idsConnectivityTimedOut)
  {
    id v3 = +[NRQueue registryDaemonQueue];
    BOOL v4 = [v3 queue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10004B684;
    v7[3] = &unk_1001655F8;
    void v7[4] = self;
    id v5 = +[TimerFactory timerWithIdentifier:@"com.apple.nanoregistry.connectivitytimer" delay:1 gracePeriod:v4 waking:v7 handlerQueue:300.0 handlerBlock:0.0];
    idsConnectivityTimer = self->_idsConnectivityTimer;
    self->_idsConnectivityTimer = v5;
  }
}

- (void)idsConnectivityTimeout
{
  self->_idsConnectivityTimedOut = 1;
  self->_idsConnectivityTimer = 0;
  _objc_release_x1();
}

- (void)getPairedPairingIDForBluetoothID:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004B76C;
  v8[3] = &unk_100166860;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(NRPairingDaemon *)self grabRegistryWithReadBlock:v8];
}

- (id)_pathToNanoRegistryStateDirectory
{
  return 0;
}

- (void)sendRemoteUnpairingDidBeginNotificationWithBlock:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004BA54;
  v5[3] = &unk_100166AB8;
  id v6 = a3;
  id v4 = v6;
  [(NRPairingDaemon *)self grabRegistryWithWriteBlockAsync:v5];
}

- (BOOL)proxyIsSecureDataAvailable:(id)a3
{
  id v3 = [(NRPairingDaemon *)self secureProperties];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)proxyWillBeginDiscovering:(id)a3
{
}

- (void)proxyWillEndDiscovering:(id)a3
{
}

- (void)proxyWillBeginAdvertising:(id)a3
{
}

- (void)proxyWillEndAdvertising:(id)a3
{
}

- (void)xpcScanForMigratableWatchesWithBlock:(id)a3
{
  serviceRegistry = self->_serviceRegistry;
  BOOL v4 = (void (**)(void))a3;
  id v5 = [(EPServiceRegistry *)serviceRegistry serviceFromClass:objc_opt_class()];
  [v5 checkIfShouldRetryMigrationWhenIDSDevicesChange];
  v4[2](v4);
}

- (void)xpcGetLastSwitchIndex:(id)a3
{
  if (a3) {
    (*((void (**)(id, void, void))a3 + 2))(a3, 0, 0);
  }
}

- (void)xpcGetMigrationCountForPairingID:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void, void))a4 + 2))(a4, 0, 0);
  }
}

- (void)xpcGetInitialSyncCompletedForPairingID:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void, void))a4 + 2))(a4, 0, 0);
  }
}

- (void)termsAcknowledgementServiceGetDeviceMirrorFromDeviceID:(id)a3 block:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004BE84;
  v8[3] = &unk_100166860;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(NRPairingDaemon *)self grabRegistryWithReadBlockAsync:v8];
}

- (void)termsAcknowledgementServiceGetNRIDFromBTID:(id)a3 block:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004C170;
  v8[3] = &unk_100166860;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(NRPairingDaemon *)self grabRegistryWithReadBlockAsync:v8];
}

- (id)termsAcknowledgementServiceGetRemoteObject
{
  serviceRegistry = self->_serviceRegistry;
  uint64_t v3 = objc_opt_class();

  return [(EPServiceRegistry *)serviceRegistry serviceFromClass:v3];
}

- (id)termsAcknowledgementServiceGetCloudObject
{
  serviceRegistry = self->_serviceRegistry;
  uint64_t v3 = objc_opt_class();

  return [(EPServiceRegistry *)serviceRegistry serviceFromClass:v3];
}

- (id)termsAcknowledgementServiceForAltAccount
{
  serviceRegistry = self->_serviceRegistry;
  uint64_t v3 = objc_opt_class();

  return [(EPServiceRegistry *)serviceRegistry serviceFromClass:v3];
}

- (void)xpcCheckIfFlaggedForRecoveryWithCompletion:(id)a3
{
  serviceRegistry = self->_serviceRegistry;
  id v4 = a3;
  id v7 = [(EPServiceRegistry *)serviceRegistry serviceFromClass:objc_opt_class()];
  id v5 = +[NRQueue registryDaemonQueue];
  id v6 = [v5 queue];
  [v7 checkIfFlaggedForRecoveryWithQueue:v6 completion:v4];
}

- (void)xpcClearRecoveryFlagWithCompletion:(id)a3
{
  serviceRegistry = self->_serviceRegistry;
  id v4 = a3;
  id v7 = [(EPServiceRegistry *)serviceRegistry serviceFromClass:objc_opt_class()];
  id v5 = +[NRQueue registryDaemonQueue];
  id v6 = [v5 queue];
  [v7 clearRecoveryFlagWithQueue:v6 completion:v4];
}

- (void)xpcFakePairedSyncStartWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v18 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
  v20[0] = @"activeActivityLabels";
  v20[1] = @"completedActivityLabels";
  v21[0] = &__NSArray0__struct;
  v21[1] = &__NSArray0__struct;
  v20[2] = @"migrationSync";
  id v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v18 hasTransactionType:@"migration"]);
  v21[2] = v5;
  v21[3] = &off_100176958;
  v20[3] = @"syncProgressState";
  void v20[4] = @"syncSessionType";
  v20[5] = @"version";
  void v21[4] = &off_100176970;
  v21[5] = &off_1001768B0;
  id v6 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:6];

  id v7 = nr_daemon_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v9 = nr_daemon_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FakePairedSyncIsCompleteWithCompletion: Updating sync state using accessor.", buf, 2u);
    }
  }
  id v10 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.pairedsync"];
  [v10 setObject:v6 forKey:@"PSYWatchSyncClientState"];
  [v10 setObject:&off_100177A00 forKey:@"PSYWatchSyncState"];
  id v11 = [v10 synchronize];
  BOOL v12 = objc_opt_new();
  id v13 = +[NSSet setWithObjects:@"PSYWatchSyncClientState", @"PSYWatchSyncState", 0];
  [v12 synchronizeNanoDomain:@"com.apple.pairedsync" keys:v13];

  id v14 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.nanoprefsyncd"];
  [v14 setBool:1 forKey:@"past-initial-sync"];
  id v15 = [v14 synchronize];
  int v16 = objc_opt_new();
  char v17 = +[NSSet setWithObject:@"past-initial-sync"];
  [v16 synchronizeNanoDomain:@"com.apple.pairedsync" keys:v17];

  notify_post("PSYWatchSyncStateChangedNotification");
  if (v4) {
    v4[2](v4, 0);
  }
}

- (void)xpcFakePairedSyncIsCompleteWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v18 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
  v20[0] = @"activeActivityLabels";
  v20[1] = @"completedActivityLabels";
  v21[0] = &off_100177B68;
  v21[1] = &__NSArray0__struct;
  v20[2] = @"migrationSync";
  id v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v18 hasTransactionType:@"migration"]);
  v21[2] = v5;
  v21[3] = &off_100176988;
  v20[3] = @"syncProgressState";
  void v20[4] = @"syncSessionType";
  v20[5] = @"version";
  void v21[4] = &off_100176970;
  v21[5] = &off_1001768B0;
  id v6 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:6];

  id v7 = nr_daemon_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v9 = nr_daemon_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FakePairedSyncIsCompleteWithCompletion: Updating sync state using accessor.", buf, 2u);
    }
  }
  id v10 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.pairedsync"];
  [v10 setObject:v6 forKey:@"PSYWatchSyncClientState"];
  [v10 setObject:&off_100177A28 forKey:@"PSYWatchSyncState"];
  id v11 = [v10 synchronize];
  BOOL v12 = objc_opt_new();
  id v13 = +[NSSet setWithObjects:@"PSYWatchSyncClientState", @"PSYWatchSyncState", 0];
  [v12 synchronizeNanoDomain:@"com.apple.pairedsync" keys:v13];

  id v14 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.nanoprefsyncd"];
  [v14 setBool:1 forKey:@"past-initial-sync"];
  id v15 = [v14 synchronize];
  int v16 = objc_opt_new();
  char v17 = +[NSSet setWithObject:@"past-initial-sync"];
  [v16 synchronizeNanoDomain:@"com.apple.pairedsync" keys:v17];

  notify_post("com.apple.nanopreferencessync.initialSyncCompletion");
  notify_post("PSYWatchSyncStateChangedNotification");
  if (v4) {
    v4[2](v4, 0);
  }
}

- (void)xpcTriggerTailspinFrom:(unint64_t)a3 forApp:(id)a4
{
  id v7 = (__CFString *)a4;
  if (os_variant_has_internal_diagnostics())
  {
    id v5 = +[NRTailspinCapture sharedInstance];
    if (v7) {
      CFStringRef v6 = v7;
    }
    else {
      CFStringRef v6 = @"unknown";
    }
    [v5 captureForApp:v6 startEdge:a3];
  }
}

- (void)assertionDescription:(id)a3
{
  id v4 = a3;
  id v5 = [(NRPairingDaemon *)self activeDeviceAssertions];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v11 = [v5 objectForKeyedSubscript:v10];
        if ([v11 BOOLValue]) {
          BOOL v12 = "YES";
        }
        else {
          BOOL v12 = "NO";
        }
        [v4 appendFormat:@"%@ %s\n", v10, v12];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)xpcActiveDeviceAssertions:(id)a3
{
  id v5 = a3;
  id v6 = [(NRPairingDaemon *)self activeDeviceAssertions];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (id)activeDeviceAssertions
{
  +[NSMutableDictionary dictionary];
  int v24 = self;
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  id v18 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
  uint64_t v3 = [v18 assertions];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v21 = [v3 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v21)
  {
    BOOL v19 = v3;
    uint64_t v20 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v21; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v33 != v20) {
          objc_enumerationMutation(v3);
        }
        id v5 = [v3 objectForKeyedSubscript:*(void *)(*((void *)&v32 + 1) + 8 * i)];
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id obj = v5;
        id v27 = [v5 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v27)
        {
          long long v22 = i;
          id v6 = 0;
          uint64_t v26 = *(void *)v29;
          do
          {
            id v7 = 0;
            uint64_t v8 = v6;
            do
            {
              if (*(void *)v29 != v26) {
                objc_enumerationMutation(obj);
              }
              id v9 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v7);
              uint64_t v10 = [(NSMapTable *)v24->_assertionToAssertionInfo objectForKey:v9];
              id v11 = [v9 pairingID];
              BOOL v12 = [v11 UUIDString];
              long long v13 = [v10 clientProxy];
              long long v14 = [v13 appPath];
              long long v15 = [v10 clientProxy];
              long long v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%p: pairingID=%@ process=%@.%ld", v9, v12, v14, (int)[v15 pid]);

              id v6 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v9 availability] == (id)1);

              [v25 setObject:v6 forKeyedSubscript:v16];
              id v7 = (char *)v7 + 1;
              uint64_t v8 = v6;
            }
            while (v27 != v7);
            id v27 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
          }
          while (v27);

          uint64_t v3 = v19;
          uint64_t i = v22;
        }
      }
      id v21 = [v3 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v21);
  }

  return v25;
}

- (void)xpcSwitchActiveDeviceWithDeviceID:(id)a3 isMagicSwitch:(BOOL)a4 operationHasCompleted:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [(NRPairingDaemon *)self lastCaller];
  [(NRPairingDaemon *)self setLastCaller:v9];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10004D248;
  v12[3] = &unk_1001676E8;
  id v13 = v9;
  id v14 = v7;
  void v12[4] = self;
  id v10 = v9;
  id v11 = v7;
  [(NRPairingDaemon *)self xpcSwitchActiveDeviceWithDeviceID:v8 withAssertionHandler:v12];
}

- (void)xpcIsPhoneReadyToMigrateDevice:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  serviceRegistry = self->_serviceRegistry;
  id v8 = a3;
  id v9 = [(EPServiceRegistry *)serviceRegistry serviceFromClass:objc_opt_class()];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004D3B4;
  v11[3] = &unk_100167710;
  id v12 = v6;
  id v10 = v6;
  [v9 isDevice:v8 readyToMigrate:v11];
}

- (void)xpcIsAssertionActive:(id)a3 withCompletion:(id)a4
{
  clientAssertionIDToAssertionInfo = self->_clientAssertionIDToAssertionInfo;
  id v6 = (void (**)(id, BOOL, void))a4;
  id v7 = [(NSMutableDictionary *)clientAssertionIDToAssertionInfo objectForKey:a3];
  v6[2](v6, v7 != 0, 0);
}

- (void)deviceHasUnpairedBluetooth:(id)a3
{
  id v3 = a3;
  id v4 = nr_daemon_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = nr_daemon_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Watch with Bluetooth identifier %@ unexpectedly unpaired from watch side.", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)discoveredCandidateName:(id)a3 bluetoothIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = nr_daemon_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = nr_daemon_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543618;
      id v12 = v6;
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Discovered a candidate with name %{public}@, bt UUID %@", (uint8_t *)&v11, 0x16u);
    }
  }
  [(NRPairingDaemon *)self createDeviceFromNetworkRelayDiscoveryWithAdvertisementName:v6 bluetoothIdentifier:v7 withRSSI:&off_1001769B8 withBlock:0];
}

- (void)lostCandidateWithName:(id)a3
{
  id v4 = a3;
  BOOL v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Lost a candidate with name %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  [(NRPairingDaemon *)self removeCandidateDeviceWithName:v4];
}

- (BOOL)shouldWaitForBridgeNotificationForPairingID:(id)a3
{
  return [(NSMutableSet *)self->_waitForBridgeCompletedPairingIDs containsObject:a3] ^ 1;
}

+ (void)updatePingMyWatchControlCenterModuleVisibility:(id)a3
{
  id v3 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (!v4) {
    goto LABEL_16;
  }
  id v5 = v4;
  uint64_t v6 = 0;
  uint64_t v7 = *(void *)v25;
  uint64_t v8 = NRDevicePropertyIsAltAccount;
  do
  {
    for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v25 != v7) {
        objc_enumerationMutation(v3);
      }
      id v10 = [v3 objectForKeyedSubscript:*(void *)(*((void *)&v24 + 1) + 8 * i)];
      if ([v10 isPaired]
        && [v10 isSetup]
        && ([v10 isArchived] & 1) == 0)
      {
        int v11 = [v10 objectForKeyedSubscript:v8];
        id v12 = [v11 value];
        uint64_t v13 = [v12 BOOLValue] ^ 1;

        v6 += v13;
      }
    }
    id v5 = [v3 countByEnumeratingWithState:&v24 objects:v32 count:16];
  }
  while (v5);
  if (!v6)
  {
LABEL_16:
    uint64_t v18 = 0;
    goto LABEL_17;
  }
  id v14 = [v3 activeDeviceID];
  if (!v14)
  {
LABEL_22:

    goto LABEL_23;
  }
  long long v15 = [v3 objectForKeyedSubscript:v14];
  id v16 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"C5BAD2E8-BB79-4E9E-8A0D-757C60D31053"];
  unsigned int v17 = [v15 supportsCapability:v16];

  if (v17)
  {
    uint64_t v18 = 1;
LABEL_17:
    BOOL v19 = nr_daemon_log();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

    if (v20)
    {
      id v21 = nr_daemon_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412546;
        CFStringRef v29 = @"com.apple.PingMyWatchControlCenterUI";
        __int16 v30 = 1024;
        int v31 = v18;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Attempting to update the %@ visibility to: %{BOOL}d", buf, 0x12u);
      }
    }
    id v14 = +[CCSControlCenterService sharedInstance];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10004DA28;
    v22[3] = &unk_100167730;
    char v23 = v18;
    [v14 setVisibility:v18 forModuleWithIdentifier:@"com.apple.PingMyWatchControlCenterUI" completionHandler:v22];
    goto LABEL_22;
  }
LABEL_23:
}

- (int64_t)mirrorOfPairedDeviceCount
{
  return self->_mirrorOfPairedDeviceCount;
}

- (CBCentralManager)central
{
  return self->_central;
}

- (void)setCentral:(id)a3
{
}

- (NSString)pairingClientPhase
{
  return self->_pairingClientPhase;
}

- (void)setPairingClientPhase:(id)a3
{
}

- (BOOL)syncTrapUIPushed
{
  return self->_syncTrapUIPushed;
}

- (NRPairingProxy)pairingClientProxy
{
  return self->_pairingClientProxy;
}

- (void)setPairingClientProxy:(id)a3
{
}

- (EPServiceRegistry)serviceRegistry
{
  return self->_serviceRegistry;
}

- (void)setServiceRegistry:(id)a3
{
}

- (BOOL)sentPropertiesFlag
{
  return self->_sentPropertiesFlag;
}

- (void)setSentPropertiesFlag:(BOOL)a3
{
  self->_sentPropertiesFlag = a3;
}

- (NRLocalPropertyMonitor)localProperties
{
  return self->_localProperties;
}

- (void)setLocalProperties:(id)a3
{
}

- (MCProfileConnection)mcConnection
{
  return self->_mcConnection;
}

- (void)setMcConnection:(id)a3
{
}

- (NSObject)mcConnectionSettingsChangedNotificationToken
{
  return self->_mcConnectionSettingsChangedNotificationToken;
}

- (void)setMcConnectionSettingsChangedNotificationToken:(id)a3
{
}

- (OS_os_transaction)altAccountOSTransaction
{
  return self->_altAccountOSTransaction;
}

- (void)setAltAccountOSTransaction:(id)a3
{
}

- (BOOL)initRemoteProperties
{
  return self->_initRemoteProperties;
}

- (void)setInitRemoteProperties:(BOOL)a3
{
  self->_initRemoteProperties = a3;
}

- (EPNanoRegistryStatusCodeVote)readyStatusCodeVote
{
  return self->_readyStatusCodeVote;
}

- (void)setReadyStatusCodeVote:(id)a3
{
}

- (NSMutableArray)bluetoothInitBlocks
{
  return self->_bluetoothInitBlocks;
}

- (void)setBluetoothInitBlocks:(id)a3
{
}

- (NSLock)bluetoothInitBlockLock
{
  return self->_bluetoothInitBlockLock;
}

- (void)setBluetoothInitBlockLock:(id)a3
{
}

- (NSMutableDictionary)bluetoothIDToPairingID
{
  return self->_bluetoothIDToPairingID;
}

- (void)setBluetoothIDToPairingID:(id)a3
{
}

- (NSMutableSet)bluetoothDiscoveryEventDedupe
{
  return self->_bluetoothDiscoveryEventDedupe;
}

- (void)setBluetoothDiscoveryEventDedupe:(id)a3
{
}

- (NROSTransaction)discoveryTransaction
{
  return self->_discoveryTransaction;
}

- (void)setDiscoveryTransaction:(id)a3
{
}

- (AbstractTimer)gizmoSetCompatibilityStateTimer
{
  return self->_gizmoSetCompatibilityStateTimer;
}

- (void)setGizmoSetCompatibilityStateTimer:(id)a3
{
}

- (BOOL)healthKitLastChanceSyncInProgress
{
  return self->_healthKitLastChanceSyncInProgress;
}

- (void)setHealthKitLastChanceSyncInProgress:(BOOL)a3
{
  self->_healthKitLastChanceSyncInProgress = a3;
}

- (NSNumber)lastDaemonState
{
  return self->_lastDaemonState;
}

- (void)setLastDaemonState:(id)a3
{
}

- (BOOL)bluetoothIsScanning
{
  return self->_bluetoothIsScanning;
}

- (void)setBluetoothIsScanning:(BOOL)a3
{
  self->_bluetoothIsScanning = a3;
}

- (BOOL)networkRelayPairerIsScanning
{
  return self->_networkRelayPairerIsScanning;
}

- (void)setNetworkRelayPairerIsScanning:(BOOL)a3
{
  self->_networkRelayPairerIsScanning = a3;
}

- (NSUUID)bluetoothIsScanningToMatchThisDeviceID
{
  return self->_bluetoothIsScanningToMatchThisDeviceID;
}

- (void)setBluetoothIsScanningToMatchThisDeviceID:(id)a3
{
}

- (OS_dispatch_source)historyPurgeWorkingSetTimer
{
  return self->_historyPurgeWorkingSetTimer;
}

- (void)setHistoryPurgeWorkingSetTimer:(id)a3
{
}

- (NROSTransaction)receivedPropertiesTransaction
{
  return self->_receivedPropertiesTransaction;
}

- (void)setReceivedPropertiesTransaction:(id)a3
{
}

- (int64_t)receivedPropertiesTransactionRefCounter
{
  return self->_receivedPropertiesTransactionRefCounter;
}

- (void)setReceivedPropertiesTransactionRefCounter:(int64_t)a3
{
  self->_receivedPropertiesTransactionRefCounter = a3;
}

- (NSMutableSet)outstandingBluetoothConnectRequests
{
  return self->_outstandingBluetoothConnectRequests;
}

- (void)setOutstandingBluetoothConnectRequests:(id)a3
{
}

- (OS_dispatch_queue)chipIDOfActiveDeviceQueue
{
  return self->_chipIDOfActiveDeviceQueue;
}

- (void)setChipIDOfActiveDeviceQueue:(id)a3
{
}

- (NRConnectivityPublisher)connectivityPublisher
{
  return self->_connectivityPublisher;
}

- (void)setConnectivityPublisher:(id)a3
{
}

- (EPKeymaster)keymaster
{
  return self->_keymaster;
}

- (void)setKeymaster:(id)a3
{
}

- (NROSTransaction)watchPusherTransaction
{
  return self->_watchPusherTransaction;
}

- (void)setWatchPusherTransaction:(id)a3
{
}

- (EPWatchPusher)watchPusher
{
  return self->_watchPusher;
}

- (void)setWatchPusher:(id)a3
{
}

- (EPWatchPusher)lastWatchPusher
{
  return self->_lastWatchPusher;
}

- (void)setLastWatchPusher:(id)a3
{
}

- (EPScalablePipeManagerManager)pusherPipeManager
{
  return self->_pusherPipeManager;
}

- (void)setPusherPipeManager:(id)a3
{
}

- (EPScalablePipeManager)pusherPipe
{
  return self->_pusherPipe;
}

- (void)setPusherPipe:(id)a3
{
}

- (EPNanoRegistryStatusCodeVote)migrationVote
{
  return self->_migrationVote;
}

- (void)setMigrationVote:(id)a3
{
}

- (NBManager)backupManager
{
  return self->_backupManager;
}

- (void)setBackupManager:(id)a3
{
}

- (NRPowerAssertionActivity)migrationActivity
{
  return self->_migrationActivity;
}

- (void)setMigrationActivity:(id)a3
{
}

- (BOOL)mightNeedToKickOffPairedSyncAfterLaunch
{
  return self->_mightNeedToKickOffPairedSyncAfterLaunch;
}

- (void)setMightNeedToKickOffPairedSyncAfterLaunch:(BOOL)a3
{
  self->_mightNeedToKickOffPairedSyncAfterLaunch = a3;
}

- (BOOL)hasClassAFile
{
  return self->_hasClassAFile;
}

- (void)setHasClassAFile:(BOOL)a3
{
  self->_hasClassAFile = a3;
}

- (os_unfair_lock_s)lastCallerLock
{
  return self->_lastCallerLock;
}

- (void)setLastCallerLock:(os_unfair_lock_s)a3
{
  self->_lastCallerLock = a3;
}

- (NRSimpleReferenceCounter)pairingClients
{
  return self->_pairingClients;
}

- (void)setPairingClients:(id)a3
{
}

- (NRSimpleReferenceCounter)switchingClients
{
  return self->_switchingClients;
}

- (void)setSwitchingClients:(id)a3
{
}

- (NRSimpleReferenceCounter)pushingClients
{
  return self->_pushingClients;
}

- (void)setPushingClients:(id)a3
{
}

- (int64_t)pushingReferenceCounter
{
  return self->_pushingReferenceCounter;
}

- (void)setPushingReferenceCounter:(int64_t)a3
{
  self->_int64_t pushingReferenceCounter = a3;
}

- (NRSimpleReferenceCounter)discoveringClients
{
  return self->_discoveringClients;
}

- (void)setDiscoveringClients:(id)a3
{
}

- (NRSimpleReferenceCounter)advertisingClients
{
  return self->_advertisingClients;
}

- (void)setAdvertisingClients:(id)a3
{
}

- (NSMapTable)assertionToAssertionInfo
{
  return self->_assertionToAssertionInfo;
}

- (void)setAssertionToAssertionInfo:(id)a3
{
}

- (NSMapTable)clientProxyToAssertionInfo
{
  return self->_clientProxyToAssertionInfo;
}

- (void)setClientProxyToAssertionInfo:(id)a3
{
}

- (NSMutableDictionary)clientAssertionIDToAssertionInfo
{
  return self->_clientAssertionIDToAssertionInfo;
}

- (void)setClientAssertionIDToAssertionInfo:(id)a3
{
}

- (NROSLogStateProvider)dumper
{
  return self->_dumper;
}

- (void)setDumper:(id)a3
{
}

- (BOOL)idsConnectivityTimedOut
{
  return self->_idsConnectivityTimedOut;
}

- (void)setIdsConnectivityTimedOut:(BOOL)a3
{
  self->_idsConnectivityTimedOut = a3;
}

- (AbstractTimer)idsConnectivityTimer
{
  return self->_idsConnectivityTimer;
}

- (void)setIdsConnectivityTimer:(id)a3
{
}

- (int)activeDeviceChipIDNotifyToken
{
  return self->_activeDeviceChipIDNotifyToken;
}

- (void)setActiveDeviceChipIDNotifyToken:(int)a3
{
  self->_activeDeviceChipIDNotifyToken = a3;
}

- (NSUUID)lastActivePairingIDThatFailed
{
  return self->_lastActivePairingIDThatFailed;
}

- (void)setLastActivePairingIDThatFailed:(id)a3
{
}

- (NSMutableDictionary)deviceDiscoveryDates
{
  return self->_deviceDiscoveryDates;
}

- (void)setDeviceDiscoveryDates:(id)a3
{
}

- (int64_t)lastDiscoveryPurgeSeconds
{
  return self->_lastDiscoveryPurgeSeconds;
}

- (void)setLastDiscoveryPurgeSeconds:(int64_t)a3
{
  self->_lastDiscoveryPurgeSeconds = a3;
}

- (BOOL)alreadyRepairedTheSwitch
{
  return self->_alreadyRepairedTheSwitch;
}

- (void)setAlreadyRepairedTheSwitch:(BOOL)a3
{
  self->_alreadyRepairedTheSwitch = a3;
}

- (os_unfair_lock_s)lastStatusCodeCacheLock
{
  return self->_lastStatusCodeCacheLock;
}

- (void)setLastStatusCodeCacheLock:(os_unfair_lock_s)a3
{
  self->_lastStatusCodeCacheLock = a3;
}

- (os_unfair_lock_s)pairingQueueWriteLock
{
  return self->_pairingQueueWriteLock;
}

- (void)setPairingQueueWriteLock:(os_unfair_lock_s)a3
{
  self->_pairingQueueWriteLock = a3;
}

- (NROSTransaction)pairingClientCrashMonitoringTransaction
{
  return self->_pairingClientCrashMonitoringTransaction;
}

- (void)setPairingClientCrashMonitoringTransaction:(id)a3
{
}

- (NRPairingProxy)pairingClientCrashMonitoringProxy
{
  return self->_pairingClientCrashMonitoringProxy;
}

- (void)setPairingClientCrashMonitoringProxy:(id)a3
{
}

- (BOOL)pairingQueueIsSuspended
{
  return self->_pairingQueueIsSuspended;
}

- (void)setPairingQueueIsSuspended:(BOOL)a3
{
  self->_pairingQueueIsSuspended = a3;
}

- (BOOL)pairingClientCrashMonitoringCachedValue
{
  return self->_pairingClientCrashMonitoringCachedValue;
}

- (void)setPairingClientCrashMonitoringCachedValue:(BOOL)a3
{
  self->_pairingClientCrashMonitoringCachedValue = a3;
}

- (BOOL)isNotCachingCrashMonitoring
{
  return self->_isNotCachingCrashMonitoring;
}

- (void)setIsNotCachingCrashMonitoring:(BOOL)a3
{
  self->_isNotCachingCrashMonitoring = a3;
}

- (NSUUID)queuedNotIsPairedDeviceIDToMarkIsSetup
{
  return self->_queuedNotIsPairedDeviceIDToMarkIsSetup;
}

- (void)setQueuedNotIsPairedDeviceIDToMarkIsSetup:(id)a3
{
}

- (OS_dispatch_source)mcDebounceSource
{
  return self->_mcDebounceSource;
}

- (void)setMcDebounceSource:(id)a3
{
}

- (OS_dispatch_source)scheduledTimer
{
  return self->_scheduledTimer;
}

- (void)setScheduledTimer:(id)a3
{
}

- (BOOL)monitoringPairingClientBeyondNewWatchPairingTransactionComplete
{
  return self->_monitoringPairingClientBeyondNewWatchPairingTransactionComplete;
}

- (void)setMonitoringPairingClientBeyondNewWatchPairingTransactionComplete:(BOOL)a3
{
  self->_monitoringPairingClientBeyondNewWatchPairingTransactionComplete = a3;
}

- (BOOL)clientRequestedSuspensionOfMonitoringPairingClientBeyondNewWatchPairingTransactionComplete
{
  return self->_clientRequestedSuspensionOfMonitoringPairingClientBeyondNewWatchPairingTransactionComplete;
}

- (void)setClientRequestedSuspensionOfMonitoringPairingClientBeyondNewWatchPairingTransactionComplete:(BOOL)a3
{
  self->_clientRequestedSuspensionOfMonitoringPairingClientBeyondNewWatchPairingTransactionComplete = a3;
}

- (NSMutableSet)waitForBridgeCompletedPairingIDs
{
  return self->_waitForBridgeCompletedPairingIDs;
}

- (void)setWaitForBridgeCompletedPairingIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitForBridgeCompletedPairingIDs, 0);
  objc_storeStrong((id *)&self->_scheduledTimer, 0);
  objc_storeStrong((id *)&self->_mcDebounceSource, 0);
  objc_storeStrong((id *)&self->_queuedNotIsPairedDeviceIDToMarkIsSetup, 0);
  objc_storeStrong((id *)&self->_pairingClientCrashMonitoringProxy, 0);
  objc_storeStrong((id *)&self->_pairingClientCrashMonitoringTransaction, 0);
  objc_storeStrong((id *)&self->_deviceDiscoveryDates, 0);
  objc_storeStrong((id *)&self->_lastActivePairingIDThatFailed, 0);
  objc_storeStrong((id *)&self->_idsConnectivityTimer, 0);
  objc_storeStrong((id *)&self->_dumper, 0);
  objc_storeStrong((id *)&self->_clientAssertionIDToAssertionInfo, 0);
  objc_storeStrong((id *)&self->_clientProxyToAssertionInfo, 0);
  objc_storeStrong((id *)&self->_assertionToAssertionInfo, 0);
  objc_storeStrong((id *)&self->_advertisingClients, 0);
  objc_storeStrong((id *)&self->_discoveringClients, 0);
  objc_storeStrong((id *)&self->_pushingClients, 0);
  objc_storeStrong((id *)&self->_switchingClients, 0);
  objc_storeStrong((id *)&self->_pairingClients, 0);
  objc_storeStrong((id *)&self->_migrationActivity, 0);
  objc_storeStrong((id *)&self->_backupManager, 0);
  objc_storeStrong((id *)&self->_migrationVote, 0);
  objc_storeStrong((id *)&self->_pusherPipe, 0);
  objc_storeStrong((id *)&self->_pusherPipeManager, 0);
  objc_storeStrong((id *)&self->_lastWatchPusher, 0);
  objc_storeStrong((id *)&self->_watchPusher, 0);
  objc_storeStrong((id *)&self->_watchPusherTransaction, 0);
  objc_storeStrong((id *)&self->_keymaster, 0);
  objc_storeStrong((id *)&self->_connectivityPublisher, 0);
  objc_storeStrong((id *)&self->_chipIDOfActiveDeviceQueue, 0);
  objc_storeStrong((id *)&self->_outstandingBluetoothConnectRequests, 0);
  objc_storeStrong((id *)&self->_receivedPropertiesTransaction, 0);
  objc_storeStrong((id *)&self->_historyPurgeWorkingSetTimer, 0);
  objc_storeStrong((id *)&self->_bluetoothIsScanningToMatchThisDeviceID, 0);
  objc_storeStrong((id *)&self->_lastDaemonState, 0);
  objc_storeStrong((id *)&self->_gizmoSetCompatibilityStateTimer, 0);
  objc_storeStrong((id *)&self->_discoveryTransaction, 0);
  objc_storeStrong((id *)&self->_bluetoothDiscoveryEventDedupe, 0);
  objc_storeStrong((id *)&self->_bluetoothIDToPairingID, 0);
  objc_storeStrong((id *)&self->_bluetoothInitBlockLock, 0);
  objc_storeStrong((id *)&self->_bluetoothInitBlocks, 0);
  objc_storeStrong((id *)&self->_readyStatusCodeVote, 0);
  objc_storeStrong((id *)&self->_altAccountOSTransaction, 0);
  objc_storeStrong((id *)&self->_mcConnectionSettingsChangedNotificationToken, 0);
  objc_storeStrong((id *)&self->_mcConnection, 0);
  objc_storeStrong((id *)&self->_localProperties, 0);
  objc_storeStrong((id *)&self->_serviceRegistry, 0);
  objc_storeStrong((id *)&self->_pairingClientProxy, 0);
  objc_storeStrong((id *)&self->_pairingClientPhase, 0);
  objc_storeStrong((id *)&self->_central, 0);
  objc_storeStrong((id *)&self->_mirrorOfActiveDeviceID, 0);
  objc_storeStrong((id *)&self->_mirrorOfActiveDevice, 0);
  objc_storeStrong((id *)&self->_chipIDOfActiveDevice, 0);

  objc_storeStrong((id *)&self->_lastCaller, 0);
}

- (void)updatePairingSessionIdIfNeededForActiveDevice
{
  id v3 = [(NRPairingDaemon *)self collection];
  id v4 = [v3 activeDevice];

  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"0B75AFAC-6373-41D2-A4F3-D4C1E9295A07"];
  unsigned int v6 = [v4 supportsCapability:v5];

  if (v6)
  {
    uint64_t v7 = NRDevicePropertyPairingSessionIdentifier;
    uint64_t v8 = [v4 objectForKeyedSubscript:NRDevicePropertyPairingSessionIdentifier];
    id v9 = [v8 value];

    if (!v9)
    {
      id v10 = +[NSUUID UUID];
      id v9 = [v10 UUIDString];

      int v11 = +[NSMutableDictionary dictionary];
      id v12 = [objc_alloc((Class)NRDevicePropertyDiff) initWithValue:v9];
      id v13 = [objc_alloc((Class)NRDevicePropertyDiffType) initWithDiff:v12 andChangeType:0];
      [v11 setObject:v13 forKeyedSubscript:v7];
      id v14 = [objc_alloc((Class)NRDeviceDiff) initWithDiffPropertyDiffs:v11];
      id v21 = _NSConcreteStackBlock;
      uint64_t v22 = 3221225472;
      char v23 = sub_1000E16FC;
      long long v24 = &unk_100165530;
      id v25 = v4;
      id v26 = v14;
      id v15 = v14;
      [(NRPairingDaemon *)self enqueueAsync:&v21];
      -[NRPairingDaemon sendPairingIdToActiveDevice:](self, "sendPairingIdToActiveDevice:", v9, v21, v22, v23, v24);
    }
    id v16 = nr_daemon_log();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

    if (v17)
    {
      uint64_t v18 = nr_daemon_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315394;
        long long v28 = "-[NRPairingDaemon(PairingSessionID) updatePairingSessionIdIfNeededForActiveDevice]";
        __int16 v29 = 2112;
        __int16 v30 = v9;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
      }
    }
LABEL_11:

    goto LABEL_12;
  }
  BOOL v19 = nr_daemon_log();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

  if (v20)
  {
    id v9 = nr_daemon_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      long long v28 = "-[NRPairingDaemon(PairingSessionID) updatePairingSessionIdIfNeededForActiveDevice]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Does not support pairing session Id.", buf, 0xCu);
    }
    goto LABEL_11;
  }
LABEL_12:
}

- (void)sendPairingIdToActiveDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(NRPairingDaemon *)self serviceRegistry];
  id v7 = [v5 serviceFromClass:objc_opt_class()];

  unsigned int v6 = [(NRPairingDaemon *)self _bluetoothIDOfActiveDevice];
  [v7 sendPairingSessionID:v4 toIDSBTUUID:v6 withResponseBlock:&stru_100169A50];
}

@end