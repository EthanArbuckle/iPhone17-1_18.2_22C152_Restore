@interface NRPairedDeviceRegistry
+ (BOOL)shouldBoostProcess;
+ (Class)proxyClass;
+ (id)activeDeviceSelectorBlock;
+ (id)activePairedDeviceSelectorBlock;
+ (id)pairedDevicesSelectorBlock;
+ (id)setupCompletedDevicesSelectorBlock;
+ (id)sharedInstance;
- (BOOL)canPairAnotherClassic;
- (BOOL)canPairAnotherTinker;
- (BOOL)hasCompletedInitialSyncForPairingID:(id)a3;
- (BOOL)isAssertionActive:(id)a3;
- (BOOL)isKeychainEnabled;
- (BOOL)isPaired;
- (BOOL)isWatchSetupPushActive;
- (BOOL)pairedDeviceCountIsLessThanMaxAllPairedDevices;
- (BOOL)pairedDeviceCountIsLessThanMaxClassicPairedDevices;
- (BOOL)pairedDeviceCountIsLessThanMaxTinkerPairedDevices;
- (BOOL)pairedDeviceSupportQuickSwitch;
- (BOOL)supportsWatch;
- (BOOL)watchNeedsGraduation;
- (NRPairedDeviceRegistry)init;
- (NRPairedDeviceRegistry)initWithBoost:(BOOL)a3;
- (NRPairedDeviceRegistry)initWithBoost:(BOOL)a3 disconnected:(BOOL)a4;
- (id)_;
- (id)_deviceIDAtSwitchIndex:(unsigned int)a3 date:(id *)a4;
- (id)_getChangeHistory;
- (id)_getClientInfo;
- (id)_getLocalDeviceCollection;
- (id)_getSecureProperties:(id)a3;
- (id)_mostlyClassicPairedDevices;
- (id)_mostlyTinkerPairedDevices;
- (id)applyDiff:(id)a3;
- (id)blockAndQueryVersions;
- (id)deviceForBTDeviceID:(id)a3;
- (id)deviceForBluetoothID:(id)a3;
- (id)deviceForIDSDevice:(id)a3;
- (id)deviceForNRDevice:(id)a3 fromIDSDevices:(id)a4;
- (id)deviceForPairingID:(id)a3;
- (id)deviceIDForIDSDevice:(id)a3;
- (id)deviceIDForNRDevice:(id)a3;
- (id)devicesFromMigrationConsentRequestData:(id)a3;
- (id)getActivePairedDeviceExcludingAltAccount;
- (id)getActivePairedDeviceIncludingAltAccount;
- (id)getAllDevices;
- (id)getAllDevicesWithArchivedAltAccountDevicesMatching:(id)a3;
- (id)getAllDevicesWithArchivedDevices;
- (id)getAllDevicesWithArchivedDevicesMatching:(id)a3;
- (id)getDevices;
- (id)getDevicesMatching:(id)a3;
- (id)getPairedDevices;
- (id)getSetupCompletedDevices;
- (id)lastMigrationRequestPhoneName;
- (id)migrationConsentRequestData;
- (id)nonActiveDeviceForBTDeviceID:(id)a3;
- (id)nonActiveDeviceForBluetoothID:(id)a3;
- (id)nonActiveDeviceForIDSDevice:(id)a3;
- (id)pairingID;
- (id)pairingStorePath;
- (id)waitForActiveDevice;
- (id)waitForActiveOrAltAccountDevice;
- (id)waitForActivePairedDevice;
- (id)waitForActivePairedOrAltAccountDevice;
- (int64_t)lastSyncSwitchIndex;
- (int64_t)maxAllPairedDeviceCount;
- (int64_t)maxClassicPairedDeviceCount;
- (int64_t)maxPairingCompatibilityVersion;
- (int64_t)maxTinkerPairedDeviceCount;
- (int64_t)migrationCountForPairingID:(id)a3;
- (int64_t)minPairingCompatibilityVersion;
- (int64_t)minQuickSwitchCompatibilityVersion;
- (int64_t)pairingCompatibilityVersion;
- (uint64_t)_getCompatibilityStateWithCollection:(void *)a1;
- (unint64_t)_getStatusWithCollection:(id)a3;
- (unint64_t)status;
- (unsigned)compatibilityState;
- (unsigned)switchIndex;
- (void)_getActiveDeviceAssertionsWithInlineBlock:(id)a3;
- (void)_invalidateActiveDeviceAssertionWithIdentifier:(id)a3;
- (void)_pingActiveGizmoWithPriority:(int64_t)a3 withMessageSize:(int64_t)a4 withBlock:(id)a5;
- (void)_postNotification:(void *)a3 forDeviceID:(void *)a4 withUserInfo:;
- (void)_submitAlbertPairingReport;
- (void)abortPairing;
- (void)abortPairingWithReason:(id)a3;
- (void)altAccountPairingStorePathPairingID:(id)a3;
- (void)beginDiscovery;
- (void)beginMigrationWithDevice:(id)a3 passcode:(id)a4 withBlock:(id)a5;
- (void)beginMigrationWithDevice:(id)a3 withCompletion:(id)a4;
- (void)checkIfFlaggedForRecoveryWithCompletion:(id)a3;
- (void)clearRecoveryFlagWithCompletion:(id)a3;
- (void)clearWatchNeedsGraduation:(id)a3;
- (void)companionOOBDiscoverAndPairWithName:(id)a3 withOutOfBandPairingKey:(id)a4 withOptions:(id)a5 operationHasBegun:(id)a6;
- (void)companionPasscodePairWithDevice:(id)a3 withOptions:(id)a4 operationHasBegun:(id)a5;
- (void)completeRTCPairingMetricForMetricID:(id)a3 withSuccess:(id)a4;
- (void)endDiscovery;
- (void)enterCompatibilityState:(unsigned __int16)a3 forDevice:(id)a4;
- (void)fakePairedSyncIsCompleteWithCompletion:(id)a3;
- (void)getDevicesWithBlock:(id)a3;
- (void)getMigrationPairingCharacteristicReadDataWithQueue:(id)a3 completion:(id)a4;
- (void)getSwitchEventsFromIndex:(unsigned int)a3 inlineCallback:(id)a4;
- (void)gizmoOOBAdvertiseAndPairWithName:(id)a3 operationHasBegun:(id)a4;
- (void)gizmoPasscodeAdvertiseAndPairWithName:(id)a3 operationHasBegun:(id)a4;
- (void)isPhoneReadyToMigrateDevice:(id)a3 withCompletion:(id)a4;
- (void)keepPhoneUnlockedInternalTestSPI:(id)a3;
- (void)logCallFrequency;
- (void)notifyActivationCompleted:(id)a3 withSuccess:(BOOL)a4;
- (void)notifyPairingShouldContinue;
- (void)notifyPasscode:(id)a3 forDevice:(id)a4;
- (void)overrideSignalStrengthLimit:(int64_t)a3;
- (void)pairWithSimulator:(id)a3 withQueue:(id)a4 withCompletion:(id)a5;
- (void)pairingClientDidEnterPhase:(id)a3;
- (void)pairingClientSetAltAccountName:(id)a3 altDSID:(id)a4 forDevice:(id)a5 completion:(id)a6;
- (void)pairingClientSetAltAccountName:(id)a3 forDevice:(id)a4 completion:(id)a5;
- (void)pairingClientSetPairingParentName:(id)a3 pairingParentAltDSID:(id)a4 forDevice:(id)a5 completion:(id)a6;
- (void)pairingStorePathPairingID:(id)a3;
- (void)putMigrationChallengeCharacteristicWriteData:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)resumePairingClientCrashMonitoring;
- (void)retriggerUnpairInfoDialog;
- (void)sendDevicesUpdatedNotification;
- (void)setActivePairedDevice:(id)a3 isMagicSwitch:(BOOL)a4 operationHasCompleted:(id)a5;
- (void)setActivePairedDevice:(id)a3 operationHasCompleted:(id)a4;
- (void)setActivePairedDevice:(id)a3 withActiveDeviceAssertionHandler:(id)a4;
- (void)setMigrationConsented:(BOOL)a3 forDevice:(id)a4 withBlock:(id)a5;
- (void)setMigrationConsented:(BOOL)a3 forDeviceID:(id)a4 withBlock:(id)a5;
- (void)setWatchBuddyCompletedSetupSteps:(id)a3;
- (void)setWatchBuddyPushedSyncTrapUI:(id)a3;
- (void)setWatchNeedsGraduation:(id)a3;
- (void)startWatchSetupPush;
- (void)stopWatchSetupPush;
- (void)suspendPairingClientCrashMonitoring;
- (void)switchToSimulator:(id)a3 withQueue:(id)a4 withCompletion:(id)a5;
- (void)threadIsBlockedWaitingOn_nanoregistryd_syncGrabLegacyRegistryWithBlock:(id)a3;
- (void)triggerTailspinFrom:(unint64_t)a3;
- (void)unpairWithDevice:(id)a3 shouldObliterate:(BOOL)a4 operationHasBegun:(id)a5;
- (void)unpairWithDevice:(id)a3 withOptions:(id)a4 operationHasBegun:(id)a5;
- (void)unpairWithSimulator:(id)a3 withQueue:(id)a4 withCompletion:(id)a5;
- (void)updateWatchBuddyStage:(unsigned int)a3 forPairingID:(id)a4;
- (void)userIsCheckingForUpdate;
- (void)waitForAltAccountPairingStorePathPairingID:(id)a3;
- (void)waitForPairingStorePathPairingID:(id)a3;
- (void)waitForWatchPairingExtendedMetadataForAdvertisedName:(id)a3 completion:(id)a4;
- (void)xpcDeviceID:(id)a3 needsPasscode:(id)a4;
- (void)xpcHasNewOOBKey:(id)a3;
@end

@implementation NRPairedDeviceRegistry

void __53__NRPairedDeviceRegistry_initWithBoost_disconnected___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  *(void *)(*(void *)(a1 + 32) + 176) = [v5 _getStatusWithCollection:v7];
  *(_WORD *)(*(void *)(a1 + 32) + 146) = -[NRPairedDeviceRegistry _getCompatibilityStateWithCollection:](*(void **)(a1 + 32), v7);
  v8 = (void *)[v7 copy];

  v9 = (void *)[v6 copy];
  v10 = nr_framework_log();
  LODWORD(v7) = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    v11 = nr_framework_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = *(void *)(v12 + 176);
      LODWORD(v12) = *(unsigned __int16 *)(v12 + 146);
      *(_DWORD *)buf = 136446722;
      v23 = "-[NRPairedDeviceRegistry initWithBoost:disconnected:]_block_invoke_3";
      __int16 v24 = 2048;
      uint64_t v25 = v13;
      __int16 v26 = 1024;
      int v27 = v12;
      _os_log_impl(&dword_1A356E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s: status(%lu) compatibilityState (%u)", buf, 0x1Cu);
    }
  }
  v14 = *(void **)(a1 + 32);
  v15 = v14[20];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__NRPairedDeviceRegistry_initWithBoost_disconnected___block_invoke_338;
  block[3] = &unk_1E5B00280;
  v19 = v14;
  id v20 = v8;
  id v21 = v9;
  id v16 = v9;
  id v17 = v8;
  dispatch_async(v15, block);
}

- (uint64_t)_getCompatibilityStateWithCollection:(void *)a1
{
  id v3 = a2;
  if (a1
    && ([a1 daemonIdle] & 1) == 0
    && ([v3 activeDeviceID], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v4;
    id v6 = [v3 objectForKeyedSubscript:v4];
    if ([v6 isArchived])
    {
      unsigned __int16 v7 = 0;
    }
    else
    {
      v8 = [v6 objectForKeyedSubscript:@"compatibilityState"];
      v9 = [v8 value];
      unsigned __int16 v7 = [v9 integerValue];
    }
  }
  else
  {
    unsigned __int16 v7 = 0;
  }

  return v7;
}

- (unint64_t)_getStatusWithCollection:(id)a3
{
  id v4 = a3;
  if (![(NRPairedDeviceRegistry *)self supportsWatch])
  {
    unint64_t v5 = 0;
    goto LABEL_14;
  }
  if (![(NRRegistryClient *)self daemonIdle])
  {
    id v6 = [v4 activeDevice];
    unsigned __int16 v7 = v6;
    if (v6)
    {
      if (([v6 isArchived] & 1) == 0)
      {
        v8 = [v7 objectForKeyedSubscript:@"statusCode"];
        v9 = [v8 value];
        unint64_t v5 = [v9 integerValue];

LABEL_13:
        goto LABEL_14;
      }
    }
    else if ([v4 paired])
    {
      if ([v4 allAltAccount]) {
        unint64_t v5 = 2;
      }
      else {
        unint64_t v5 = 3;
      }
      goto LABEL_13;
    }
    unint64_t v5 = 2;
    goto LABEL_13;
  }
  unint64_t v5 = 2;
LABEL_14:

  return v5;
}

- (unint64_t)status
{
  uint64_t v6 = 0;
  unsigned __int16 v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  if ([(NRPairedDeviceRegistry *)self supportsWatch])
  {
    v7[3] = 2;
    if (![(NRRegistryClient *)self daemonIdle])
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __32__NRPairedDeviceRegistry_status__block_invoke;
      v5[3] = &unk_1E5B01410;
      v5[4] = self;
      v5[5] = &v6;
      [(NRRegistryClient *)self syncGrabRegistryWithReadBlock:v5];
    }
  }
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unsigned)compatibilityState
{
  uint64_t v6 = 0;
  unsigned __int16 v7 = &v6;
  uint64_t v8 = 0x2020000000;
  __int16 v9 = 0;
  if (![(NRRegistryClient *)self daemonIdle])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __44__NRPairedDeviceRegistry_compatibilityState__block_invoke;
    v5[3] = &unk_1E5B01410;
    v5[4] = self;
    v5[5] = &v6;
    [(NRRegistryClient *)self syncGrabRegistryWithReadBlock:v5];
  }
  unsigned __int16 v3 = *((_WORD *)v7 + 12);
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __97__NRPairedDeviceRegistry_threadIsBlockedWaitingOn_nanoregistryd_syncGrabLegacyRegistryWithBlock___block_invoke_3(void *a1)
{
  (*(void (**)(void))(a1[7] + 16))();
  double result = (double)(clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - a1[9]) / 1000000.0;
  *(double *)(*(void *)(a1[8] + 8) + 24) = result;
  return result;
}

void __46__NRPairedDeviceRegistry_getDevicesWithBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v8 = [a4 allValues];
  uint64_t v5 = [v8 copy];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  unsigned __int16 v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)getActivePairedDeviceExcludingAltAccount
{
  unsigned __int16 v3 = [(id)objc_opt_class() activePairedDeviceSelectorBlock];
  id v4 = [(NRPairedDeviceRegistry *)self getDevicesMatching:v3];
  uint64_t v5 = [v4 firstObject];

  return v5;
}

- (void)altAccountPairingStorePathPairingID:(id)a3
{
  id v4 = (void (**)(id, void *, void *))a3;
  uint64_t v5 = +[NRPairedDeviceRegistry activeDeviceSelectorBlock];
  uint64_t v6 = [(NRPairedDeviceRegistry *)self getAllDevicesWithArchivedAltAccountDevicesMatching:v5];
  id v9 = [v6 firstObject];

  unsigned __int16 v7 = [v9 objectForKeyedSubscript:@"localPairingDataStorePath"];
  id v8 = [v9 pairingID];
  v4[2](v4, v7, v8);
}

+ (id)activeDeviceSelectorBlock
{
  return &__block_literal_global_355;
}

- (id)getDevicesMatching:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  id v16 = (id)objc_opt_new();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__NRPairedDeviceRegistry_getDevicesMatching___block_invoke;
  v8[3] = &unk_1E5B014B0;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [(NRPairedDeviceRegistry *)self getDevicesWithBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

- (id)getAllDevicesWithArchivedAltAccountDevicesMatching:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  id v16 = (id)objc_opt_new();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__NRPairedDeviceRegistry_getAllDevicesWithArchivedAltAccountDevicesMatching___block_invoke;
  v8[3] = &unk_1E5B014B0;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [(NRPairedDeviceRegistry *)self getDevicesWithBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

+ (id)activePairedDeviceSelectorBlock
{
  return &__block_literal_global_359;
}

- (BOOL)supportsWatch
{
  if (self->_disconnected) {
    return 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)NRPairedDeviceRegistry;
  return [(NRRegistry *)&v3 supportsWatch];
}

- (void)getDevicesWithBlock:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  uint64_t v6 = 0;
  unsigned __int16 v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__NRPairedDeviceRegistry_getDevicesWithBlock___block_invoke;
  v5[3] = &unk_1E5B01488;
  v5[4] = &v6;
  [(NRPairedDeviceRegistry *)self threadIsBlockedWaitingOn_nanoregistryd_syncGrabLegacyRegistryWithBlock:v5];
  v4[2](v4, v7[5]);
  _Block_object_dispose(&v6, 8);
}

- (void)threadIsBlockedWaitingOn_nanoregistryd_syncGrabLegacyRegistryWithBlock:(id)a3
{
  id v4 = a3;
  __uint64_t v5 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  uint64_t v6 = [(NRRegistry *)self managementQueue];
  dispatch_assert_queue_not_V2(v6);

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_pairedDeviceRegistryDeviceListQueue);
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_pairedRegistryGetDevicesQueue);
  pairedRegistryGetDevicesQueue = self->_pairedRegistryGetDevicesQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __97__NRPairedDeviceRegistry_threadIsBlockedWaitingOn_nanoregistryd_syncGrabLegacyRegistryWithBlock___block_invoke;
  v9[3] = &unk_1E5B012F8;
  v9[4] = self;
  id v10 = v4;
  id v11 = v13;
  __uint64_t v12 = v5;
  id v8 = v4;
  dispatch_sync(pairedRegistryGetDevicesQueue, v9);

  _Block_object_dispose(v13, 8);
}

void __97__NRPairedDeviceRegistry_threadIsBlockedWaitingOn_nanoregistryd_syncGrabLegacyRegistryWithBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (void *)[a2 copy];
  unsigned __int16 v7 = (void *)[v5 copy];

  id v8 = *(NSObject **)(*(void *)(a1 + 32) + 160);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __97__NRPairedDeviceRegistry_threadIsBlockedWaitingOn_nanoregistryd_syncGrabLegacyRegistryWithBlock___block_invoke_3;
  v17[3] = &unk_1E5B012A8;
  id v21 = *(id *)(a1 + 40);
  id v9 = v6;
  id v18 = v9;
  id v10 = v7;
  uint64_t v11 = *(void *)(a1 + 32);
  id v19 = v10;
  uint64_t v20 = v11;
  uint64_t v12 = *(void *)(a1 + 56);
  uint64_t v22 = *(void *)(a1 + 48);
  uint64_t v23 = v12;
  dispatch_sync(v8, v17);
  if (*(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) > 9.0)
  {
    uint64_t v13 = nr_daemon_log();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      v15 = nr_daemon_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v16 = (unint64_t)*(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        *(_DWORD *)buf = 134217984;
        unint64_t v25 = v16;
        _os_log_impl(&dword_1A356E000, v15, OS_LOG_TYPE_DEFAULT, "client was blocked on threadIsBlockedWaitingOn_nanoregistryd_syncGrabLegacyRegistryWithBlock for %lu milliseconds", buf, 0xCu);
      }
    }
  }
}

void __77__NRPairedDeviceRegistry_getAllDevicesWithArchivedAltAccountDevicesMatching___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v9 + 1) + 8 * v7);
        if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v8];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

void __45__NRPairedDeviceRegistry_getDevicesMatching___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v13 + 1) + 8 * v6);
        uint64_t v8 = [v7 valueForProperty:@"isArchived"];
        if ([v8 BOOLValue]) {
          goto LABEL_9;
        }
        long long v9 = [v7 valueForProperty:@"isAltAccount"];
        if ([v9 BOOLValue])
        {

LABEL_9:
          goto LABEL_10;
        }
        int v10 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

        if (v10) {
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v7];
        }
LABEL_10:
        ++v6;
      }
      while (v4 != v6);
      uint64_t v11 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v4 = v11;
    }
    while (v11);
  }
}

+ (Class)proxyClass
{
  return (Class)objc_opt_class();
}

uint64_t __40__NRPairedDeviceRegistry_sharedInstance__block_invoke(uint64_t a1)
{
  qword_1E95CEA30 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (NRPairedDeviceRegistry)init
{
  uint64_t v3 = [(id)objc_opt_class() shouldBoostProcess];

  return [(NRPairedDeviceRegistry *)self initWithBoost:v3];
}

- (NRPairedDeviceRegistry)initWithBoost:(BOOL)a3
{
  return [(NRPairedDeviceRegistry *)self initWithBoost:a3 disconnected:0];
}

+ (BOOL)shouldBoostProcess
{
  MEMORY[0x1F4188790](a1, a2);
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  pid_t v2 = getpid();
  if (proc_pidpath(v2, buffer, 0x1000u) < 1)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v3 = [NSString stringWithUTF8String:buffer];
    uint64_t v4 = [v3 lastPathComponent];
  }
  uint64_t v5 = @"(unknown)";
  if (v4) {
    uint64_t v5 = v4;
  }
  uint64_t v6 = v5;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [&unk_1EF6D4480 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(&unk_1EF6D4480);
        }
        if ([*(id *)(*((void *)&v13 + 1) + 8 * i) isEqualToString:v6])
        {
          BOOL v11 = 1;
          goto LABEL_16;
        }
      }
      uint64_t v8 = [&unk_1EF6D4480 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_16:

  return v11;
}

- (BOOL)canPairAnotherTinker
{
  BOOL v3 = [(NRPairedDeviceRegistry *)self pairedDeviceCountIsLessThanMaxTinkerPairedDevices];
  if (v3)
  {
    LOBYTE(v3) = [(NRPairedDeviceRegistry *)self pairedDeviceCountIsLessThanMaxAllPairedDevices];
  }
  return v3;
}

- (BOOL)canPairAnotherClassic
{
  BOOL v3 = [(NRPairedDeviceRegistry *)self pairedDeviceCountIsLessThanMaxClassicPairedDevices];
  if (v3)
  {
    LOBYTE(v3) = [(NRPairedDeviceRegistry *)self pairedDeviceCountIsLessThanMaxAllPairedDevices];
  }
  return v3;
}

- (BOOL)pairedDeviceCountIsLessThanMaxClassicPairedDevices
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(NRPairedDeviceRegistry *)self _mostlyClassicPairedDevices];
  unint64_t v4 = [v3 count];

  int64_t v5 = [(NRPairedDeviceRegistry *)self maxClassicPairedDeviceCount];
  uint64_t v6 = nr_framework_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    uint64_t v8 = nr_framework_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134218240;
      unint64_t v11 = v4;
      __int16 v12 = 2048;
      int64_t v13 = v5;
      _os_log_impl(&dword_1A356E000, v8, OS_LOG_TYPE_DEFAULT, "ClassicPairedDevices check: paired %lu vs. limit %ld", (uint8_t *)&v10, 0x16u);
    }
  }
  return v4 < [(NRPairedDeviceRegistry *)self maxClassicPairedDeviceCount];
}

- (int64_t)maxAllPairedDeviceCount
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v3 = numberFromCFPrefs(@"maxAllPairedDeviceCount");
  unint64_t v4 = v3;
  if (v3)
  {
    int64_t v5 = [v3 integerValue];
    uint64_t v6 = nr_framework_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      uint64_t v8 = nr_framework_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 134217984;
        int64_t v12 = v5;
        _os_log_impl(&dword_1A356E000, v8, OS_LOG_TYPE_DEFAULT, "Overriding maxAllPairedDeviceCount to %ld", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  else
  {
    int64_t v9 = [(NRPairedDeviceRegistry *)self maxClassicPairedDeviceCount];
    int64_t v5 = [(NRPairedDeviceRegistry *)self maxTinkerPairedDeviceCount] + v9;
  }

  return v5;
}

- (int64_t)maxClassicPairedDeviceCount
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  pid_t v2 = numberFromCFPrefs(@"maxClassicPairedDeviceCount");
  BOOL v3 = v2;
  if (v2)
  {
    int64_t v4 = [v2 integerValue];
    int64_t v5 = nr_framework_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      BOOL v7 = nr_framework_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 134217984;
        int64_t v10 = v4;
        _os_log_impl(&dword_1A356E000, v7, OS_LOG_TYPE_DEFAULT, "Overriding maxClassicPairedDeviceCount to %ld", (uint8_t *)&v9, 0xCu);
      }
    }
  }
  else
  {
    int64_t v4 = 5;
  }

  return v4;
}

- (int64_t)maxTinkerPairedDeviceCount
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  pid_t v2 = numberFromCFPrefs(@"maxTinkerPairedDeviceCount");
  BOOL v3 = v2;
  if (v2)
  {
    int64_t v4 = [v2 integerValue];
    int64_t v5 = nr_framework_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      BOOL v7 = nr_framework_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 134217984;
        int64_t v10 = v4;
        _os_log_impl(&dword_1A356E000, v7, OS_LOG_TYPE_DEFAULT, "Overriding maxTinkerPairedDeviceCount to %ld", (uint8_t *)&v9, 0xCu);
      }
    }
  }
  else
  {
    int64_t v4 = 5;
  }

  return v4;
}

- (BOOL)pairedDeviceCountIsLessThanMaxTinkerPairedDevices
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(NRPairedDeviceRegistry *)self _mostlyTinkerPairedDevices];
  unint64_t v4 = [v3 count];

  unint64_t v5 = [(NRPairedDeviceRegistry *)self maxTinkerPairedDeviceCount];
  BOOL v6 = nr_framework_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    uint64_t v8 = nr_framework_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134218240;
      unint64_t v11 = v4;
      __int16 v12 = 2048;
      unint64_t v13 = v5;
      _os_log_impl(&dword_1A356E000, v8, OS_LOG_TYPE_DEFAULT, "TinkerPairedDevices check: paired %lu vs. limit %ld", (uint8_t *)&v10, 0x16u);
    }
  }
  return v4 < v5;
}

- (BOOL)pairedDeviceCountIsLessThanMaxAllPairedDevices
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(NRPairedDeviceRegistry *)self _mostlyClassicPairedDevices];
  uint64_t v4 = [v3 count];

  unint64_t v5 = [(NRPairedDeviceRegistry *)self _mostlyTinkerPairedDevices];
  uint64_t v6 = [v5 count];

  unint64_t v7 = [(NRPairedDeviceRegistry *)self maxAllPairedDeviceCount];
  uint64_t v8 = nr_framework_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    int v10 = nr_framework_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134218496;
      uint64_t v13 = v4;
      __int16 v14 = 2048;
      uint64_t v15 = v6;
      __int16 v16 = 2048;
      unint64_t v17 = v7;
      _os_log_impl(&dword_1A356E000, v10, OS_LOG_TYPE_DEFAULT, "AllPairedDevices check: Classic paired %lu + Tinker paired %lu vs. limit %ld", (uint8_t *)&v12, 0x20u);
    }
  }
  return v6 + v4 < v7;
}

- (id)_mostlyClassicPairedDevices
{
  pid_t v2 = +[NRPairedDeviceRegistry sharedInstance];
  BOOL v3 = [v2 getAllDevicesWithArchivedAltAccountDevicesMatching:&__block_literal_global_4];

  return v3;
}

- (id)_mostlyTinkerPairedDevices
{
  pid_t v2 = +[NRPairedDeviceRegistry sharedInstance];
  BOOL v3 = [v2 getAllDevicesWithArchivedAltAccountDevicesMatching:&__block_literal_global_315];

  return v3;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__NRPairedDeviceRegistry_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (qword_1E95CEA38 != -1) {
    dispatch_once(&qword_1E95CEA38, block);
  }
  pid_t v2 = (void *)qword_1E95CEA30;

  return v2;
}

- (void)sendDevicesUpdatedNotification
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__NRPairedDeviceRegistry_sendDevicesUpdatedNotification__block_invoke;
  block[3] = &unk_1E5B00230;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (NRPairedDeviceRegistry)initWithBoost:(BOOL)a3 disconnected:(BOOL)a4
{
  v23.receiver = self;
  v23.super_class = (Class)NRPairedDeviceRegistry;
  id v5 = [(NRRegistry *)&v23 init];
  if (v5)
  {
    uint64_t v6 = objc_alloc_init(NRCallbackArray);
    unint64_t v7 = (void *)*((void *)v5 + 23);
    *((void *)v5 + 23) = v6;

    uint64_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.nanoregistry.registry.deviceListQueue", v8);
    int v10 = (void *)*((void *)v5 + 20);
    *((void *)v5 + 20) = v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.nanoregistry.getDevicesQueue", v8);
    int v12 = (void *)*((void *)v5 + 21);
    *((void *)v5 + 21) = v11;

    uint64_t v13 = nr_framework_log();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      uint64_t v15 = nr_framework_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1A356E000, v15, OS_LOG_TYPE_DEFAULT, "Suspending registry operation queue.", (uint8_t *)buf, 2u);
      }
    }
    dispatch_suspend(*((dispatch_object_t *)v5 + 21));
    objc_initWeak(buf, v5);
    *((unsigned char *)v5 + 144) = a4;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __53__NRPairedDeviceRegistry_initWithBoost_disconnected___block_invoke;
    v20[3] = &unk_1E5B01398;
    objc_copyWeak(&v21, buf);
    id v16 = (id)[v5 addDiffIndexObserverWithWriteBlock:v20];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __53__NRPairedDeviceRegistry_initWithBoost_disconnected___block_invoke_3;
    v18[3] = &unk_1E5B013C0;
    id v19 = v5;
    [v19 syncGrabRegistryWithReadBlock:v18];

    objc_destroyWeak(&v21);
    objc_destroyWeak(buf);
  }
  return (NRPairedDeviceRegistry *)v5;
}

void __97__NRPairedDeviceRegistry_threadIsBlockedWaitingOn_nanoregistryd_syncGrabLegacyRegistryWithBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) logCallFrequency];
  pid_t v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __97__NRPairedDeviceRegistry_threadIsBlockedWaitingOn_nanoregistryd_syncGrabLegacyRegistryWithBlock___block_invoke_2;
  v6[3] = &unk_1E5B012D0;
  v6[4] = v2;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v7 = v3;
  uint64_t v8 = v4;
  uint64_t v9 = v5;
  [v2 syncGrabRegistryWithReadBlock:v6];
}

- (void)logCallFrequency
{
  unint64_t v2 = self->_callCount + 1;
  self->_callCount = v2;
  if (__ROR8__(0x1CAC083126E978D5 * v2, 1) <= 0x10624DD2F1A9FBEuLL)
  {
    id v3 = nr_framework_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      uint64_t v5 = nr_framework_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v6 = 0;
        _os_log_error_impl(&dword_1A356E000, v5, OS_LOG_TYPE_ERROR, "NanoRegistry APIs called 250 times", v6, 2u);
      }
    }
  }
}

- (void)_postNotification:(void *)a3 forDeviceID:(void *)a4 withUserInfo:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    if (v8)
    {
      int v10 = *(NSObject **)(a1 + 168);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __69__NRPairedDeviceRegistry__postNotification_forDeviceID_withUserInfo___block_invoke;
      block[3] = &unk_1E5B01438;
      void block[4] = a1;
      id v17 = v8;
      id v18 = v9;
      id v19 = v7;
      dispatch_async(v10, block);

      dispatch_queue_t v11 = v17;
    }
    else
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __69__NRPairedDeviceRegistry__postNotification_forDeviceID_withUserInfo___block_invoke_3;
      v12[3] = &unk_1E5B00280;
      id v13 = v7;
      uint64_t v14 = a1;
      id v15 = v9;
      dispatch_async(MEMORY[0x1E4F14428], v12);

      dispatch_queue_t v11 = v13;
    }
  }
}

void __69__NRPairedDeviceRegistry__postNotification_forDeviceID_withUserInfo___block_invoke_3(void *a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:a1[4] object:a1[5] userInfo:a1[6]];
}

void __56__NRPairedDeviceRegistry_sendDevicesUpdatedNotification__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"NRPairedDeviceRegistryDevicesDidUpdateNotification" object:*(void *)(a1 + 32) userInfo:0];
}

- (BOOL)isPaired
{
  id v2 = [(NRPairedDeviceRegistry *)self getPairedDevices];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)getPairedDevices
{
  BOOL v3 = [(id)objc_opt_class() pairedDevicesSelectorBlock];
  BOOL v4 = [(NRPairedDeviceRegistry *)self getDevicesMatching:v3];

  return v4;
}

+ (id)pairedDevicesSelectorBlock
{
  return &__block_literal_global_357;
}

- (void)retriggerUnpairInfoDialog
{
  id v3 = [(NRRegistryClient *)self connection];
  id v2 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_384];
  [v2 xpcRetriggerUnpairInfoDialogWithBlock:&__block_literal_global_386];
}

- (BOOL)watchNeedsGraduation
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v2 = [(NRRegistryClient *)self connection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__NRPairedDeviceRegistry_watchNeedsGraduation__block_invoke;
  v5[3] = &unk_1E5B01320;
  v5[4] = &v6;
  [v3 xpcWatchNeedsGraduation:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __46__NRPairedDeviceRegistry_watchNeedsGraduation__block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)clearWatchNeedsGraduation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NRRegistryClient *)self connection];
  uint64_t v6 = [v5 remoteObjectProxyWithErrorHandler:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__NRPairedDeviceRegistry_clearWatchNeedsGraduation___block_invoke;
  v8[3] = &unk_1E5B00080;
  id v9 = v4;
  id v7 = v4;
  [v6 xpcClearWatchNeedsGraduation:v8];
}

uint64_t __52__NRPairedDeviceRegistry_clearWatchNeedsGraduation___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setWatchNeedsGraduation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = nr_framework_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = nr_framework_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A356E000, v7, OS_LOG_TYPE_DEFAULT, "setWatchNeedsGraduation", buf, 2u);
    }
  }
  uint64_t v8 = [(NRRegistryClient *)self connection];
  id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__NRPairedDeviceRegistry_setWatchNeedsGraduation___block_invoke;
  v11[3] = &unk_1E5B00080;
  id v12 = v4;
  id v10 = v4;
  [v9 xpcSetWatchNeedsGraduation:v11];
}

uint64_t __50__NRPairedDeviceRegistry_setWatchNeedsGraduation___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __53__NRPairedDeviceRegistry__mostlyClassicPairedDevices__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 valueForProperty:@"isArchived"];
  id v4 = [v2 valueForProperty:@"isPaired"];
  uint64_t v5 = [v2 valueForProperty:@"isAltAccount"];

  if ([v4 BOOLValue] && (objc_msgSend(v5, "BOOLValue") & 1) == 0) {
    uint64_t v6 = [v3 BOOLValue] ^ 1;
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __52__NRPairedDeviceRegistry__mostlyTinkerPairedDevices__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 valueForProperty:@"isArchived"];
  id v4 = [v2 valueForProperty:@"isPaired"];
  uint64_t v5 = [v2 valueForProperty:@"isAltAccount"];

  if [v4 BOOLValue] && (objc_msgSend(v5, "BOOLValue"))
  {
    uint64_t v6 = 1;
  }
  else if ([v3 BOOLValue])
  {
    uint64_t v6 = [v5 BOOLValue];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)pairedDeviceSupportQuickSwitch
{
  id v2 = [(NRPairedDeviceRegistry *)self getPairedDevices];
  id v3 = [v2 firstObject];

  if (v3)
  {
    id v4 = [v3 valueForProperty:@"maxPairingCompatibilityVersion"];
    unint64_t v5 = [v4 integerValue];
    uint64_t v6 = [v3 valueForProperty:@"chipID"];
    id v7 = +[NRPairingCompatibilityVersionInfo systemVersions];
    BOOL v8 = v5 >= [v7 minQuickSwitchPairingCompatibilityVersionForChipID:v6];
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (void)setActivePairedDevice:(id)a3 operationHasCompleted:(id)a4
{
}

- (void)setActivePairedDevice:(id)a3 isMagicSwitch:(BOOL)a4 operationHasCompleted:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (![(NRRegistryClient *)self daemonIdle])
  {
    id v10 = [(NRRegistryClient *)self connection];

    if (v10)
    {
      dispatch_queue_t v11 = [(NRRegistryClient *)self connection];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __84__NRPairedDeviceRegistry_setActivePairedDevice_isMagicSwitch_operationHasCompleted___block_invoke;
      v20[3] = &unk_1E5B00080;
      id v12 = &v21;
      id v13 = v9;
      id v21 = v13;
      uint64_t v14 = [v11 remoteObjectProxyWithErrorHandler:v20];
      id v15 = [v8 pairingID];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __84__NRPairedDeviceRegistry_setActivePairedDevice_isMagicSwitch_operationHasCompleted___block_invoke_3;
      v18[3] = &unk_1E5B00080;
      id v19 = v13;
      [v14 xpcSwitchActiveDeviceWithDeviceID:v15 isMagicSwitch:v6 operationHasCompleted:v18];

LABEL_6:
      goto LABEL_7;
    }
  }
  if (v9)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__NRPairedDeviceRegistry_setActivePairedDevice_isMagicSwitch_operationHasCompleted___block_invoke_5;
    block[3] = &unk_1E5B00208;
    id v12 = &v17;
    id v17 = v9;
    dispatch_async(MEMORY[0x1E4F14428], block);
    goto LABEL_6;
  }
LABEL_7:
}

void __84__NRPairedDeviceRegistry_setActivePairedDevice_isMagicSwitch_operationHasCompleted___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__NRPairedDeviceRegistry_setActivePairedDevice_isMagicSwitch_operationHasCompleted___block_invoke_2;
    block[3] = &unk_1E5B00208;
    id v3 = v1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __84__NRPairedDeviceRegistry_setActivePairedDevice_isMagicSwitch_operationHasCompleted___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __84__NRPairedDeviceRegistry_setActivePairedDevice_isMagicSwitch_operationHasCompleted___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __84__NRPairedDeviceRegistry_setActivePairedDevice_isMagicSwitch_operationHasCompleted___block_invoke_4;
    v5[3] = &unk_1E5B00058;
    id v7 = v4;
    id v6 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __84__NRPairedDeviceRegistry_setActivePairedDevice_isMagicSwitch_operationHasCompleted___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __84__NRPairedDeviceRegistry_setActivePairedDevice_isMagicSwitch_operationHasCompleted___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)setActivePairedDevice:(id)a3 withActiveDeviceAssertionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(NRRegistryClient *)self daemonIdle])
  {
    id v8 = [(NRRegistryClient *)self connection];

    if (v8)
    {
      id v9 = [(NRRegistryClient *)self connection];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __81__NRPairedDeviceRegistry_setActivePairedDevice_withActiveDeviceAssertionHandler___block_invoke;
      v19[3] = &unk_1E5B00080;
      id v10 = &v20;
      id v11 = v7;
      id v20 = v11;
      id v12 = [v9 remoteObjectProxyWithErrorHandler:v19];
      id v13 = [v6 pairingID];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __81__NRPairedDeviceRegistry_setActivePairedDevice_withActiveDeviceAssertionHandler___block_invoke_3;
      v16[3] = &unk_1E5B01348;
      id v18 = v11;
      id v17 = v6;
      [v12 xpcSwitchActiveDeviceWithDeviceID:v13 withAssertionHandler:v16];

LABEL_6:
      goto LABEL_7;
    }
  }
  if (v7)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __81__NRPairedDeviceRegistry_setActivePairedDevice_withActiveDeviceAssertionHandler___block_invoke_5;
    v14[3] = &unk_1E5B00208;
    id v10 = &v15;
    id v15 = v7;
    dispatch_async(MEMORY[0x1E4F14428], v14);
    goto LABEL_6;
  }
LABEL_7:
}

void __81__NRPairedDeviceRegistry_setActivePairedDevice_withActiveDeviceAssertionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__NRPairedDeviceRegistry_setActivePairedDevice_withActiveDeviceAssertionHandler___block_invoke_2;
    block[3] = &unk_1E5B00208;
    id v3 = v1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __81__NRPairedDeviceRegistry_setActivePairedDevice_withActiveDeviceAssertionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

void __81__NRPairedDeviceRegistry_setActivePairedDevice_withActiveDeviceAssertionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 40))
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __81__NRPairedDeviceRegistry_setActivePairedDevice_withActiveDeviceAssertionHandler___block_invoke_4;
    v7[3] = &unk_1E5B00808;
    id v8 = v5;
    id v9 = *(id *)(a1 + 32);
    id v10 = v6;
    id v11 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
}

void __81__NRPairedDeviceRegistry_setActivePairedDevice_withActiveDeviceAssertionHandler___block_invoke_4(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    id v2 = 0;
  }
  else {
    id v2 = -[NRActiveDeviceAssertion initWithDevice:identifier:]((id *)[NRActiveDeviceAssertion alloc], *(void **)(a1 + 40), *(void **)(a1 + 48));
  }
  id v3 = v2;
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __81__NRPairedDeviceRegistry_setActivePairedDevice_withActiveDeviceAssertionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

void __53__NRPairedDeviceRegistry_initWithBoost_disconnected___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v14 = (void *)[v11 copy];
    id v15 = (void *)[v12 copy];
    id v16 = WeakRetained[20];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __53__NRPairedDeviceRegistry_initWithBoost_disconnected___block_invoke_2;
    v19[3] = &unk_1E5B01370;
    id v20 = WeakRetained;
    id v21 = v10;
    id v22 = v14;
    id v23 = v15;
    uint64_t v25 = a6;
    id v24 = v11;
    id v17 = v15;
    id v18 = v14;
    dispatch_async(v16, v19);
  }
}

void __53__NRPairedDeviceRegistry_initWithBoost_disconnected___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  id v5 = v3;
  id v6 = v5;
  if (v2)
  {
    uint64_t v25 = v1;
    uint64_t v26 = v5;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 160));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v39 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          id v13 = objc_msgSend(v7, "objectForKeyedSubscript:", v12, v25);
          if ([v13 changeType])
          {
            if ([v13 changeType] == 2) {
              [*(id *)(v2 + 152) removeObjectForKey:v12];
            }
          }
          else
          {
            uint64_t v14 = [[NRDevice alloc] initWithRegistry:v2 diff:v7 pairingID:v12 notify:1];
            [*(id *)(v2 + 152) setObject:v14 forKeyedSubscript:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v39 count:16];
      }
      while (v9);
    }

    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __99__NRPairedDeviceRegistry__fireChangeNotificationsForDiff_collection_secureProperties_index_notify___block_invoke;
    v27[3] = &unk_1E5B01460;
    v27[4] = v2;
    +[NRMutableDeviceCollection parseDiff:v7 forPropertyChange:@"lastPairingError" withBlock:v27];
    id v6 = v26;
    id v15 = v26;
    __int16 v16 = -[NRPairedDeviceRegistry _getCompatibilityStateWithCollection:]((void *)v2, v15);
    if ([(id)v2 daemonIdle])
    {
      id v17 = 0;
    }
    else
    {
      id v17 = [v15 activeDeviceID];
    }
    uint64_t v1 = v25;
    id v18 = objc_msgSend((id)v2, "managementQueue", v25);
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v33 = 3221225472;
    v34 = __83__NRPairedDeviceRegistry__fireCompatibilityStateChangedNotificationWithCollection___block_invoke;
    v35 = &unk_1E5B008F8;
    __int16 v38 = v16;
    uint64_t v36 = v2;
    id v37 = v17;
    id v19 = v17;
    dispatch_async(v18, &block);

    id v20 = (void *)[(id)v2 _getStatusWithCollection:v15];
    id v21 = [(id)v2 managementQueue];
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v33 = 3221225472;
    v34 = __71__NRPairedDeviceRegistry__fireStatusChangedNotificationWithCollection___block_invoke;
    v35 = &unk_1E5B00AD8;
    uint64_t v36 = v2;
    id v37 = v20;
    dispatch_async(v21, &block);

    [(id)v2 sendDevicesUpdatedNotification];
  }

  uint64_t v22 = *(void *)(v1 + 32);
  if (v22)
  {
    uint64_t v23 = *(void *)(v1 + 64);
    id v24 = *(void **)(v22 + 184);
    [v24 sweepWithCollection:v23];
  }
}

void __53__NRPairedDeviceRegistry_initWithBoost_disconnected___block_invoke_338(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  uint64_t v22 = v2;
  if (v1)
  {
    id v3 = v2;
    id v21 = objc_opt_new();
    id v4 = +[NRMutableDeviceCollection diffFrom:to:](NRMutableDeviceCollection, "diffFrom:to:");
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:buf count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v12 = [[NRDevice alloc] initWithRegistry:v1 diff:v4 pairingID:v11 notify:0];
          [v5 setObject:v12 forKeyedSubscript:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:buf count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = 0;
  }

  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(void **)(v13 + 152);
  *(void *)(v13 + 152) = v5;

  [*(id *)(a1 + 32) sendDevicesUpdatedNotification];
  id v15 = nr_framework_log();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

  if (v16)
  {
    id v17 = nr_framework_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A356E000, v17, OS_LOG_TYPE_DEFAULT, "Resuming registry operation queue.", buf, 2u);
    }
  }
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 168));
  uint64_t v18 = *(void *)(a1 + 32);
  long long v28 = @"status";
  id v19 = [NSNumber numberWithUnsignedInteger:*(void *)(v18 + 176)];
  long long v29 = v19;
  id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  -[NRPairedDeviceRegistry _postNotification:forDeviceID:withUserInfo:](v18, @"NRPairedDeviceRegistryStatusDidChange", 0, v20);
}

- (id)_
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__2;
  uint64_t v11 = __Block_byref_object_dispose__2;
  id v12 = 0;
  id v2 = [(NRRegistryClient *)self connection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __27__NRPairedDeviceRegistry____block_invoke;
  v6[3] = &unk_1E5B013E8;
  v6[4] = &v7;
  [v3 xpcClientInfo:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __27__NRPairedDeviceRegistry____block_invoke(uint64_t a1, void *a2)
{
}

void __71__NRPairedDeviceRegistry__fireStatusChangedNotificationWithCollection___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(void *)(v1 + 176) != v2)
  {
    *(void *)(v1 + 176) = v2;
    id v6 = @"status";
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
    v7[0] = v4;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    -[NRPairedDeviceRegistry _postNotification:forDeviceID:withUserInfo:](v3, @"NRPairedDeviceRegistryStatusDidChange", 0, v5);
  }
}

uint64_t __32__NRPairedDeviceRegistry_status__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) _getStatusWithCollection:a2];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __83__NRPairedDeviceRegistry__fireCompatibilityStateChangedNotificationWithCollection___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int16 *)(a1 + 48);
  if (*(unsigned __int16 *)(v1 + 146) != v2)
  {
    *(_WORD *)(v1 + 146) = v2;
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(a1 + 40);
    uint64_t v7 = @"compatibilityState";
    id v5 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 48)];
    v8[0] = v5;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    -[NRPairedDeviceRegistry _postNotification:forDeviceID:withUserInfo:](v3, @"NRPairedDeviceRegistryDeviceDidEnterCompatibilityStateNotification", v4, v6);
  }
}

uint64_t __44__NRPairedDeviceRegistry_compatibilityState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = -[NRPairedDeviceRegistry _getCompatibilityStateWithCollection:](*(void **)(a1 + 32), a2);
  *(_WORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __69__NRPairedDeviceRegistry__postNotification_forDeviceID_withUserInfo___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(*(void *)(a1 + 32) + 152) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v2)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 48) mutableCopy];
    if (!v3)
    {
      uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    [v3 setObject:v2 forKeyedSubscript:@"device"];
    [v3 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"pairingID"];
  }
  else
  {
    uint64_t v3 = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __69__NRPairedDeviceRegistry__postNotification_forDeviceID_withUserInfo___block_invoke_2;
  v7[3] = &unk_1E5B01438;
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v4;
  uint64_t v9 = v5;
  id v10 = v3;
  id v11 = *(id *)(a1 + 48);
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __69__NRPairedDeviceRegistry__postNotification_forDeviceID_withUserInfo___block_invoke_2(void *a1)
{
  int v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = a1[6];
  if (!v3) {
    uint64_t v3 = a1[7];
  }
  id v4 = v2;
  [v2 postNotificationName:a1[4] object:a1[5] userInfo:v3];
}

void __99__NRPairedDeviceRegistry__fireChangeNotificationsForDiff_collection_secureProperties_index_notify___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    id v15 = @"error";
    v16[0] = v7;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    id v10 = (void *)[v9 mutableCopy];

    if ([v8 code] == 1)
    {
      id v11 = [v8 userInfo];
      id v12 = [v11 objectForKeyedSubscript:@"previousDeviceID"];
      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v12];
      if (v13)
      {
        uint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 152) objectForKeyedSubscript:v13];
        if (v14) {
          [v10 setObject:v14 forKeyedSubscript:@"previousDevice"];
        }
      }
    }
    -[NRPairedDeviceRegistry _postNotification:forDeviceID:withUserInfo:](*(void *)(a1 + 32), @"NRPairedDeviceRegistryDeviceDidFailToPairNotification", v6, v10);
  }
}

- (id)getDevices
{
  uint64_t v3 = [(id)objc_opt_class() activePairedDeviceSelectorBlock];
  id v4 = [(NRPairedDeviceRegistry *)self getDevicesMatching:v3];

  return v4;
}

- (id)getActivePairedDeviceIncludingAltAccount
{
  uint64_t v3 = [(id)objc_opt_class() activePairedDeviceSelectorBlock];
  id v4 = [(NRPairedDeviceRegistry *)self getAllDevicesWithArchivedAltAccountDevicesMatching:v3];
  uint64_t v5 = [v4 firstObject];

  return v5;
}

- (id)getSetupCompletedDevices
{
  uint64_t v3 = [(id)objc_opt_class() setupCompletedDevicesSelectorBlock];
  id v4 = [(NRPairedDeviceRegistry *)self getDevicesMatching:v3];

  return v4;
}

- (id)getAllDevices
{
  return [(NRPairedDeviceRegistry *)self getDevicesMatching:&__block_literal_global_351];
}

uint64_t __39__NRPairedDeviceRegistry_getAllDevices__block_invoke()
{
  return 1;
}

- (id)getAllDevicesWithArchivedDevices
{
  return [(NRPairedDeviceRegistry *)self getAllDevicesWithArchivedDevicesMatching:&__block_literal_global_353];
}

uint64_t __58__NRPairedDeviceRegistry_getAllDevicesWithArchivedDevices__block_invoke()
{
  return 1;
}

uint64_t __51__NRPairedDeviceRegistry_activeDeviceSelectorBlock__block_invoke(uint64_t a1, void *a2)
{
  int v2 = [a2 valueForProperty:@"isActive"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

uint64_t __52__NRPairedDeviceRegistry_pairedDevicesSelectorBlock__block_invoke(uint64_t a1, void *a2)
{
  int v2 = [a2 valueForProperty:@"isPaired"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

uint64_t __57__NRPairedDeviceRegistry_activePairedDeviceSelectorBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 valueForProperty:@"isPaired"];
  if ([v3 BOOLValue])
  {
    id v4 = [v2 valueForProperty:@"isActive"];
    uint64_t v5 = [v4 BOOLValue];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (id)setupCompletedDevicesSelectorBlock
{
  return &__block_literal_global_361;
}

uint64_t __60__NRPairedDeviceRegistry_setupCompletedDevicesSelectorBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 valueForProperty:@"isPaired"];
  if ([v3 BOOLValue])
  {
    id v4 = [v2 valueForProperty:@"isSetup"];
    uint64_t v5 = [v4 BOOLValue];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)getAllDevicesWithArchivedDevicesMatching:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__2;
  id v15 = __Block_byref_object_dispose__2;
  id v16 = (id)objc_opt_new();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __67__NRPairedDeviceRegistry_getAllDevicesWithArchivedDevicesMatching___block_invoke;
  v8[3] = &unk_1E5B014B0;
  id v5 = v4;
  id v9 = v5;
  id v10 = &v11;
  [(NRPairedDeviceRegistry *)self getDevicesWithBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

void __67__NRPairedDeviceRegistry_getAllDevicesWithArchivedDevicesMatching___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
        {
          id v9 = [v8 valueForProperty:@"isAltAccount"];
          char v10 = [v9 BOOLValue];

          if ((v10 & 1) == 0) {
            [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v8];
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)companionOOBDiscoverAndPairWithName:(id)a3 withOutOfBandPairingKey:(id)a4 withOptions:(id)a5 operationHasBegun:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = [(NRRegistryClient *)self connection];

  if (v14)
  {
    id v15 = [(NRRegistryClient *)self connection];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __116__NRPairedDeviceRegistry_companionOOBDiscoverAndPairWithName_withOutOfBandPairingKey_withOptions_operationHasBegun___block_invoke;
    v25[3] = &unk_1E5B00080;
    uint64_t v16 = &v26;
    id v17 = v13;
    id v26 = v17;
    uint64_t v18 = [v15 remoteObjectProxyWithErrorHandler:v25];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __116__NRPairedDeviceRegistry_companionOOBDiscoverAndPairWithName_withOutOfBandPairingKey_withOptions_operationHasBegun___block_invoke_3;
    v23[3] = &unk_1E5B00080;
    id v24 = v17;
    id v19 = v17;
    [v18 xpcCompanionOOBDiscoverAndPairWithName:v10 withOutOfBandPairingKey:v11 withOptions:v12 operationHasBegun:v23];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __116__NRPairedDeviceRegistry_companionOOBDiscoverAndPairWithName_withOutOfBandPairingKey_withOptions_operationHasBegun___block_invoke_5;
    block[3] = &unk_1E5B00208;
    uint64_t v16 = &v22;
    id v22 = v13;
    id v20 = v13;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __116__NRPairedDeviceRegistry_companionOOBDiscoverAndPairWithName_withOutOfBandPairingKey_withOptions_operationHasBegun___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __116__NRPairedDeviceRegistry_companionOOBDiscoverAndPairWithName_withOutOfBandPairingKey_withOptions_operationHasBegun___block_invoke_2;
    block[3] = &unk_1E5B00208;
    id v3 = v1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __116__NRPairedDeviceRegistry_companionOOBDiscoverAndPairWithName_withOutOfBandPairingKey_withOptions_operationHasBegun___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __116__NRPairedDeviceRegistry_companionOOBDiscoverAndPairWithName_withOutOfBandPairingKey_withOptions_operationHasBegun___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __116__NRPairedDeviceRegistry_companionOOBDiscoverAndPairWithName_withOutOfBandPairingKey_withOptions_operationHasBegun___block_invoke_4;
  v6[3] = &unk_1E5B00058;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __116__NRPairedDeviceRegistry_companionOOBDiscoverAndPairWithName_withOutOfBandPairingKey_withOptions_operationHasBegun___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __116__NRPairedDeviceRegistry_companionOOBDiscoverAndPairWithName_withOutOfBandPairingKey_withOptions_operationHasBegun___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)companionPasscodePairWithDevice:(id)a3 withOptions:(id)a4 operationHasBegun:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(NRRegistryClient *)self connection];

  if (v11)
  {
    id v12 = [(NRRegistryClient *)self connection];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __88__NRPairedDeviceRegistry_companionPasscodePairWithDevice_withOptions_operationHasBegun___block_invoke;
    v23[3] = &unk_1E5B00080;
    id v13 = &v24;
    id v14 = v10;
    id v24 = v14;
    id v15 = [v12 remoteObjectProxyWithErrorHandler:v23];
    uint64_t v16 = [v8 pairingID];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __88__NRPairedDeviceRegistry_companionPasscodePairWithDevice_withOptions_operationHasBegun___block_invoke_3;
    v21[3] = &unk_1E5B00080;
    id v22 = v14;
    id v17 = v14;
    [v15 xpcCompanionPasscodePairWithDeviceID:v16 withOptions:v9 operationHasBegun:v21];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__NRPairedDeviceRegistry_companionPasscodePairWithDevice_withOptions_operationHasBegun___block_invoke_5;
    block[3] = &unk_1E5B00208;
    id v13 = &v20;
    id v20 = v10;
    id v18 = v10;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __88__NRPairedDeviceRegistry_companionPasscodePairWithDevice_withOptions_operationHasBegun___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__NRPairedDeviceRegistry_companionPasscodePairWithDevice_withOptions_operationHasBegun___block_invoke_2;
    block[3] = &unk_1E5B00208;
    id v3 = v1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __88__NRPairedDeviceRegistry_companionPasscodePairWithDevice_withOptions_operationHasBegun___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __88__NRPairedDeviceRegistry_companionPasscodePairWithDevice_withOptions_operationHasBegun___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __88__NRPairedDeviceRegistry_companionPasscodePairWithDevice_withOptions_operationHasBegun___block_invoke_4;
  v6[3] = &unk_1E5B00058;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __88__NRPairedDeviceRegistry_companionPasscodePairWithDevice_withOptions_operationHasBegun___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __88__NRPairedDeviceRegistry_companionPasscodePairWithDevice_withOptions_operationHasBegun___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)gizmoOOBAdvertiseAndPairWithName:(id)a3 operationHasBegun:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NRRegistryClient *)self connection];

  if (v8)
  {
    id v9 = [(NRRegistryClient *)self connection];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __77__NRPairedDeviceRegistry_gizmoOOBAdvertiseAndPairWithName_operationHasBegun___block_invoke;
    v19[3] = &unk_1E5B00080;
    id v10 = &v20;
    id v11 = v7;
    id v20 = v11;
    id v12 = [v9 remoteObjectProxyWithErrorHandler:v19];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __77__NRPairedDeviceRegistry_gizmoOOBAdvertiseAndPairWithName_operationHasBegun___block_invoke_3;
    v17[3] = &unk_1E5B00080;
    id v18 = v11;
    id v13 = v11;
    [v12 xpcGizmoOOBAdvertiseAndPairWithName:v6 operationHasBegun:v17];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__NRPairedDeviceRegistry_gizmoOOBAdvertiseAndPairWithName_operationHasBegun___block_invoke_5;
    block[3] = &unk_1E5B00208;
    id v10 = &v16;
    id v16 = v7;
    id v14 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __77__NRPairedDeviceRegistry_gizmoOOBAdvertiseAndPairWithName_operationHasBegun___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__NRPairedDeviceRegistry_gizmoOOBAdvertiseAndPairWithName_operationHasBegun___block_invoke_2;
    block[3] = &unk_1E5B00208;
    id v3 = v1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __77__NRPairedDeviceRegistry_gizmoOOBAdvertiseAndPairWithName_operationHasBegun___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __77__NRPairedDeviceRegistry_gizmoOOBAdvertiseAndPairWithName_operationHasBegun___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__NRPairedDeviceRegistry_gizmoOOBAdvertiseAndPairWithName_operationHasBegun___block_invoke_4;
  v6[3] = &unk_1E5B00058;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __77__NRPairedDeviceRegistry_gizmoOOBAdvertiseAndPairWithName_operationHasBegun___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __77__NRPairedDeviceRegistry_gizmoOOBAdvertiseAndPairWithName_operationHasBegun___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)gizmoPasscodeAdvertiseAndPairWithName:(id)a3 operationHasBegun:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NRRegistryClient *)self connection];

  if (v8)
  {
    id v9 = [(NRRegistryClient *)self connection];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __82__NRPairedDeviceRegistry_gizmoPasscodeAdvertiseAndPairWithName_operationHasBegun___block_invoke;
    v19[3] = &unk_1E5B00080;
    id v10 = &v20;
    id v11 = v7;
    id v20 = v11;
    id v12 = [v9 remoteObjectProxyWithErrorHandler:v19];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __82__NRPairedDeviceRegistry_gizmoPasscodeAdvertiseAndPairWithName_operationHasBegun___block_invoke_3;
    v17[3] = &unk_1E5B00080;
    id v18 = v11;
    id v13 = v11;
    [v12 xpcGizmoOOBAdvertiseAndPairWithName:v6 operationHasBegun:v17];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__NRPairedDeviceRegistry_gizmoPasscodeAdvertiseAndPairWithName_operationHasBegun___block_invoke_5;
    block[3] = &unk_1E5B00208;
    id v10 = &v16;
    id v16 = v7;
    id v14 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __82__NRPairedDeviceRegistry_gizmoPasscodeAdvertiseAndPairWithName_operationHasBegun___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__NRPairedDeviceRegistry_gizmoPasscodeAdvertiseAndPairWithName_operationHasBegun___block_invoke_2;
    block[3] = &unk_1E5B00208;
    id v3 = v1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __82__NRPairedDeviceRegistry_gizmoPasscodeAdvertiseAndPairWithName_operationHasBegun___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __82__NRPairedDeviceRegistry_gizmoPasscodeAdvertiseAndPairWithName_operationHasBegun___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__NRPairedDeviceRegistry_gizmoPasscodeAdvertiseAndPairWithName_operationHasBegun___block_invoke_4;
  v6[3] = &unk_1E5B00058;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __82__NRPairedDeviceRegistry_gizmoPasscodeAdvertiseAndPairWithName_operationHasBegun___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __82__NRPairedDeviceRegistry_gizmoPasscodeAdvertiseAndPairWithName_operationHasBegun___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)notifyActivationCompleted:(id)a3 withSuccess:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v9 = [(NRRegistryClient *)self connection];
  id v7 = [v9 remoteObjectProxy];
  id v8 = [v6 pairingID];

  [v7 xpcNotifyActivationCompleted:v8 withSuccess:v4];
}

- (void)notifyPasscode:(id)a3 forDevice:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(NRRegistryClient *)self connection];
  id v8 = [v10 remoteObjectProxy];
  id v9 = [v6 pairingID];

  [v8 xpcNotifyPasscode:v7 withDeviceID:v9];
}

- (void)notifyPairingShouldContinue
{
  id v3 = [(NRRegistryClient *)self connection];
  id v2 = [v3 remoteObjectProxy];
  [v2 xpcPairingShouldContinue];
}

- (void)unpairWithDevice:(id)a3 shouldObliterate:(BOOL)a4 operationHasBegun:(id)a5
{
  BOOL v5 = a4;
  v14[1] = *MEMORY[0x1E4F143B8];
  id v13 = @"obliterate";
  id v8 = NSNumber;
  id v9 = a5;
  id v10 = a3;
  id v11 = [v8 numberWithBool:v5];
  v14[0] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  [(NRPairedDeviceRegistry *)self unpairWithDevice:v10 withOptions:v12 operationHasBegun:v9];
}

- (void)unpairWithDevice:(id)a3 withOptions:(id)a4 operationHasBegun:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(NRRegistryClient *)self connection];

  if (v11)
  {
    id v12 = [(NRRegistryClient *)self connection];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __73__NRPairedDeviceRegistry_unpairWithDevice_withOptions_operationHasBegun___block_invoke;
    v21[3] = &unk_1E5B00080;
    id v13 = &v22;
    id v14 = v10;
    id v22 = v14;
    id v15 = [v12 remoteObjectProxyWithErrorHandler:v21];
    id v16 = [v8 pairingID];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __73__NRPairedDeviceRegistry_unpairWithDevice_withOptions_operationHasBegun___block_invoke_3;
    v19[3] = &unk_1E5B00080;
    id v20 = v14;
    [v15 xpcUnpairWithDeviceID:v16 withOptions:v9 operationHasBegun:v19];

LABEL_5:
    goto LABEL_6;
  }
  if (v10)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__NRPairedDeviceRegistry_unpairWithDevice_withOptions_operationHasBegun___block_invoke_5;
    block[3] = &unk_1E5B00208;
    id v13 = &v18;
    id v18 = v10;
    dispatch_async(MEMORY[0x1E4F14428], block);
    goto LABEL_5;
  }
LABEL_6:
}

void __73__NRPairedDeviceRegistry_unpairWithDevice_withOptions_operationHasBegun___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__NRPairedDeviceRegistry_unpairWithDevice_withOptions_operationHasBegun___block_invoke_2;
    block[3] = &unk_1E5B00208;
    id v3 = v1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __73__NRPairedDeviceRegistry_unpairWithDevice_withOptions_operationHasBegun___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __73__NRPairedDeviceRegistry_unpairWithDevice_withOptions_operationHasBegun___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __73__NRPairedDeviceRegistry_unpairWithDevice_withOptions_operationHasBegun___block_invoke_4;
    v5[3] = &unk_1E5B00058;
    id v7 = v4;
    id v6 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __73__NRPairedDeviceRegistry_unpairWithDevice_withOptions_operationHasBegun___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __73__NRPairedDeviceRegistry_unpairWithDevice_withOptions_operationHasBegun___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)pairWithSimulator:(id)a3 withQueue:(id)a4 withCompletion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [(NRRegistryClient *)self connection];

  if (v9)
  {
    id v10 = [(NRRegistryClient *)self connection];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __69__NRPairedDeviceRegistry_pairWithSimulator_withQueue_withCompletion___block_invoke;
    v20[3] = &unk_1E5B00080;
    id v11 = &v21;
    id v12 = v8;
    id v21 = v12;
    id v13 = [v10 remoteObjectProxyWithErrorHandler:v20];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __69__NRPairedDeviceRegistry_pairWithSimulator_withQueue_withCompletion___block_invoke_3;
    v18[3] = &unk_1E5B00080;
    id v19 = v12;
    id v14 = v12;
    [v13 xpcPairWithSimulator:v7 withCompletion:v18];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__NRPairedDeviceRegistry_pairWithSimulator_withQueue_withCompletion___block_invoke_5;
    block[3] = &unk_1E5B00208;
    id v11 = &v17;
    id v17 = v8;
    id v15 = v8;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __69__NRPairedDeviceRegistry_pairWithSimulator_withQueue_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__NRPairedDeviceRegistry_pairWithSimulator_withQueue_withCompletion___block_invoke_2;
    block[3] = &unk_1E5B00208;
    id v3 = v1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __69__NRPairedDeviceRegistry_pairWithSimulator_withQueue_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __69__NRPairedDeviceRegistry_pairWithSimulator_withQueue_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__NRPairedDeviceRegistry_pairWithSimulator_withQueue_withCompletion___block_invoke_4;
  v6[3] = &unk_1E5B00058;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __69__NRPairedDeviceRegistry_pairWithSimulator_withQueue_withCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __69__NRPairedDeviceRegistry_pairWithSimulator_withQueue_withCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)unpairWithSimulator:(id)a3 withQueue:(id)a4 withCompletion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [(NRRegistryClient *)self connection];

  if (v9)
  {
    id v10 = [(NRRegistryClient *)self connection];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __71__NRPairedDeviceRegistry_unpairWithSimulator_withQueue_withCompletion___block_invoke;
    v20[3] = &unk_1E5B00080;
    id v11 = &v21;
    id v12 = v8;
    id v21 = v12;
    id v13 = [v10 remoteObjectProxyWithErrorHandler:v20];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __71__NRPairedDeviceRegistry_unpairWithSimulator_withQueue_withCompletion___block_invoke_3;
    v18[3] = &unk_1E5B00080;
    id v19 = v12;
    id v14 = v12;
    [v13 xpcUnpairWithSimulator:v7 withCompletion:v18];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__NRPairedDeviceRegistry_unpairWithSimulator_withQueue_withCompletion___block_invoke_5;
    block[3] = &unk_1E5B00208;
    id v11 = &v17;
    id v17 = v8;
    id v15 = v8;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __71__NRPairedDeviceRegistry_unpairWithSimulator_withQueue_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__NRPairedDeviceRegistry_unpairWithSimulator_withQueue_withCompletion___block_invoke_2;
    block[3] = &unk_1E5B00208;
    id v3 = v1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __71__NRPairedDeviceRegistry_unpairWithSimulator_withQueue_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __71__NRPairedDeviceRegistry_unpairWithSimulator_withQueue_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__NRPairedDeviceRegistry_unpairWithSimulator_withQueue_withCompletion___block_invoke_4;
  v6[3] = &unk_1E5B00058;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __71__NRPairedDeviceRegistry_unpairWithSimulator_withQueue_withCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __71__NRPairedDeviceRegistry_unpairWithSimulator_withQueue_withCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)switchToSimulator:(id)a3 withQueue:(id)a4 withCompletion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [(NRRegistryClient *)self connection];

  if (v9)
  {
    id v10 = [(NRRegistryClient *)self connection];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __69__NRPairedDeviceRegistry_switchToSimulator_withQueue_withCompletion___block_invoke;
    v20[3] = &unk_1E5B00080;
    id v11 = &v21;
    id v12 = v8;
    id v21 = v12;
    id v13 = [v10 remoteObjectProxyWithErrorHandler:v20];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __69__NRPairedDeviceRegistry_switchToSimulator_withQueue_withCompletion___block_invoke_3;
    v18[3] = &unk_1E5B00080;
    id v19 = v12;
    id v14 = v12;
    [v13 xpcSwitchToSimulator:v7 withCompletion:v18];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__NRPairedDeviceRegistry_switchToSimulator_withQueue_withCompletion___block_invoke_5;
    block[3] = &unk_1E5B00208;
    id v11 = &v17;
    id v17 = v8;
    id v15 = v8;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __69__NRPairedDeviceRegistry_switchToSimulator_withQueue_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__NRPairedDeviceRegistry_switchToSimulator_withQueue_withCompletion___block_invoke_2;
    block[3] = &unk_1E5B00208;
    id v3 = v1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __69__NRPairedDeviceRegistry_switchToSimulator_withQueue_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __69__NRPairedDeviceRegistry_switchToSimulator_withQueue_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__NRPairedDeviceRegistry_switchToSimulator_withQueue_withCompletion___block_invoke_4;
  v6[3] = &unk_1E5B00058;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __69__NRPairedDeviceRegistry_switchToSimulator_withQueue_withCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __69__NRPairedDeviceRegistry_switchToSimulator_withQueue_withCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)fakePairedSyncIsCompleteWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(NRRegistryClient *)self connection];

  if (v5)
  {
    id v6 = [(NRRegistryClient *)self connection];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    void v16[2] = __65__NRPairedDeviceRegistry_fakePairedSyncIsCompleteWithCompletion___block_invoke;
    v16[3] = &unk_1E5B00080;
    id v7 = &v17;
    id v8 = v4;
    id v17 = v8;
    id v9 = [v6 remoteObjectProxyWithErrorHandler:v16];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __65__NRPairedDeviceRegistry_fakePairedSyncIsCompleteWithCompletion___block_invoke_3;
    v14[3] = &unk_1E5B00080;
    id v15 = v8;
    id v10 = v8;
    [v9 xpcFakePairedSyncIsCompleteWithCompletion:v14];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__NRPairedDeviceRegistry_fakePairedSyncIsCompleteWithCompletion___block_invoke_5;
    block[3] = &unk_1E5B00208;
    id v7 = &v13;
    id v13 = v4;
    id v11 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __65__NRPairedDeviceRegistry_fakePairedSyncIsCompleteWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__NRPairedDeviceRegistry_fakePairedSyncIsCompleteWithCompletion___block_invoke_2;
    block[3] = &unk_1E5B00208;
    id v3 = v1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __65__NRPairedDeviceRegistry_fakePairedSyncIsCompleteWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __65__NRPairedDeviceRegistry_fakePairedSyncIsCompleteWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__NRPairedDeviceRegistry_fakePairedSyncIsCompleteWithCompletion___block_invoke_4;
  v6[3] = &unk_1E5B00058;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __65__NRPairedDeviceRegistry_fakePairedSyncIsCompleteWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __65__NRPairedDeviceRegistry_fakePairedSyncIsCompleteWithCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)triggerTailspinFrom:(unint64_t)a3
{
  id v5 = [(NRRegistryClient *)self connection];

  if (v5)
  {
    id v7 = [(NRRegistryClient *)self connection];
    id v6 = [v7 remoteObjectProxyWithErrorHandler:&__block_literal_global_364];
    [v6 xpcTriggerTailspinFrom:a3 forApp:0];
  }
}

- (void)enterCompatibilityState:(unsigned __int16)a3 forDevice:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  id v9 = [(NRRegistryClient *)self connection];
  id v7 = [v9 remoteObjectProxy];
  id v8 = [v6 pairingID];

  [v7 xpcEnterCompatibilityState:v4 withDeviceID:v8];
}

- (void)pairingStorePathPairingID:(id)a3
{
  uint64_t v4 = (void (**)(id, void *, void *))a3;
  id v7 = [(NRPairedDeviceRegistry *)self getActivePairedDevice];
  id v5 = [v7 objectForKeyedSubscript:@"localPairingDataStorePath"];
  id v6 = [v7 pairingID];
  v4[2](v4, v5, v6);
}

- (void)waitForPairingStorePathPairingID:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = [(NRRegistry *)self managementQueue];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __59__NRPairedDeviceRegistry_waitForPairingStorePathPairingID___block_invoke;
  id v11 = &unk_1E5B002A8;
  id v12 = self;
  dispatch_semaphore_t v13 = v5;
  id v7 = v5;
  dispatch_async(v6, &v8);

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  -[NRPairedDeviceRegistry pairingStorePathPairingID:](self, "pairingStorePathPairingID:", v4, v8, v9, v10, v11, v12);
}

void __59__NRPairedDeviceRegistry_waitForPairingStorePathPairingID___block_invoke(uint64_t a1)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__NRPairedDeviceRegistry_waitForPairingStorePathPairingID___block_invoke_2;
  v6[3] = &unk_1E5B014D8;
  id v2 = *(void **)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v2;
  id v3 = (void *)MEMORY[0x1A624A7E0](v6);
  [*(id *)(*(void *)(a1 + 32) + 184) addObject:v3];
  id v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__NRPairedDeviceRegistry_waitForPairingStorePathPairingID___block_invoke_4;
  v5[3] = &unk_1E5B013C0;
  void v5[4] = v4;
  [v4 _grabRegistryWithReadBlock:v5];
}

uint64_t __59__NRPairedDeviceRegistry_waitForPairingStorePathPairingID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 activeDevice];
  if ([v3 isPaired] && (objc_msgSend(v3, "isAltAccount") & 1) == 0)
  {
    dispatch_semaphore_t v5 = [*(id *)(a1 + 32) managementQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__NRPairedDeviceRegistry_waitForPairingStorePathPairingID___block_invoke_3;
    block[3] = &unk_1E5B00230;
    id v8 = *(id *)(a1 + 40);
    dispatch_async(v5, block);

    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

intptr_t __59__NRPairedDeviceRegistry_waitForPairingStorePathPairingID___block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __59__NRPairedDeviceRegistry_waitForPairingStorePathPairingID___block_invoke_4(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2) {
    return [*(id *)(v2 + 184) sweepWithCollection:a2];
  }
  return result;
}

- (void)waitForAltAccountPairingStorePathPairingID:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = [(NRRegistry *)self managementQueue];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __69__NRPairedDeviceRegistry_waitForAltAccountPairingStorePathPairingID___block_invoke;
  id v11 = &unk_1E5B002A8;
  dispatch_semaphore_t v12 = v5;
  dispatch_semaphore_t v13 = self;
  id v7 = v5;
  dispatch_async(v6, &v8);

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  -[NRPairedDeviceRegistry altAccountPairingStorePathPairingID:](self, "altAccountPairingStorePathPairingID:", v4, v8, v9, v10, v11);
}

void __69__NRPairedDeviceRegistry_waitForAltAccountPairingStorePathPairingID___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__NRPairedDeviceRegistry_waitForAltAccountPairingStorePathPairingID___block_invoke_2;
  v5[3] = &unk_1E5B01500;
  id v6 = *(id *)(a1 + 32);
  uint64_t v2 = (void *)MEMORY[0x1A624A7E0](v5);
  [*(id *)(*(void *)(a1 + 40) + 184) addObject:v2];
  id v3 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__NRPairedDeviceRegistry_waitForAltAccountPairingStorePathPairingID___block_invoke_3;
  v4[3] = &unk_1E5B013C0;
  v4[4] = v3;
  [v3 _grabRegistryWithReadBlock:v4];
}

uint64_t __69__NRPairedDeviceRegistry_waitForAltAccountPairingStorePathPairingID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 activeDevice];
  uint64_t v4 = [v3 isPaired];
  if (v4) {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }

  return v4;
}

uint64_t __69__NRPairedDeviceRegistry_waitForAltAccountPairingStorePathPairingID___block_invoke_3(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2) {
    return [*(id *)(v2 + 184) sweepWithCollection:a2];
  }
  return result;
}

- (id)waitForActivePairedDevice
{
  [(NRPairedDeviceRegistry *)self waitForPairingStorePathPairingID:&__block_literal_global_368];

  return [(NRPairedDeviceRegistry *)self getActivePairedDevice];
}

- (id)waitForActivePairedOrAltAccountDevice
{
  [(NRPairedDeviceRegistry *)self waitForAltAccountPairingStorePathPairingID:&__block_literal_global_370];

  return [(NRPairedDeviceRegistry *)self getActivePairedDevice];
}

- (id)waitForActiveOrAltAccountDevice
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v4 = [(NRRegistry *)self managementQueue];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  dispatch_semaphore_t v12 = __57__NRPairedDeviceRegistry_waitForActiveOrAltAccountDevice__block_invoke;
  dispatch_semaphore_t v13 = &unk_1E5B002A8;
  dispatch_semaphore_t v14 = v3;
  id v15 = self;
  dispatch_semaphore_t v5 = v3;
  dispatch_async(v4, &v10);

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  id v6 = objc_msgSend((id)objc_opt_class(), "activeDeviceSelectorBlock", v10, v11, v12, v13);
  id v7 = [(NRPairedDeviceRegistry *)self getAllDevicesWithArchivedAltAccountDevicesMatching:v6];
  uint64_t v8 = [v7 firstObject];

  return v8;
}

void __57__NRPairedDeviceRegistry_waitForActiveOrAltAccountDevice__block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__NRPairedDeviceRegistry_waitForActiveOrAltAccountDevice__block_invoke_2;
  v5[3] = &unk_1E5B01500;
  id v6 = *(id *)(a1 + 32);
  uint64_t v2 = (void *)MEMORY[0x1A624A7E0](v5);
  [*(id *)(*(void *)(a1 + 40) + 184) addObject:v2];
  dispatch_semaphore_t v3 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__NRPairedDeviceRegistry_waitForActiveOrAltAccountDevice__block_invoke_3;
  v4[3] = &unk_1E5B013C0;
  v4[4] = v3;
  [v3 _grabRegistryWithReadBlock:v4];
}

BOOL __57__NRPairedDeviceRegistry_waitForActiveOrAltAccountDevice__block_invoke_2(uint64_t a1, void *a2)
{
  dispatch_semaphore_t v3 = [a2 activeDevice];
  if (v3) {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }

  return v3 != 0;
}

uint64_t __57__NRPairedDeviceRegistry_waitForActiveOrAltAccountDevice__block_invoke_3(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2) {
    return [*(id *)(v2 + 184) sweepWithCollection:a2];
  }
  return result;
}

- (id)waitForActiveDevice
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v4 = [(NRRegistry *)self managementQueue];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  dispatch_semaphore_t v12 = __45__NRPairedDeviceRegistry_waitForActiveDevice__block_invoke;
  dispatch_semaphore_t v13 = &unk_1E5B002A8;
  dispatch_semaphore_t v14 = v3;
  id v15 = self;
  dispatch_semaphore_t v5 = v3;
  dispatch_async(v4, &v10);

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  id v6 = objc_msgSend((id)objc_opt_class(), "activeDeviceSelectorBlock", v10, v11, v12, v13);
  id v7 = [(NRPairedDeviceRegistry *)self getAllDevicesWithArchivedAltAccountDevicesMatching:v6];
  uint64_t v8 = [v7 firstObject];

  return v8;
}

void __45__NRPairedDeviceRegistry_waitForActiveDevice__block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__NRPairedDeviceRegistry_waitForActiveDevice__block_invoke_2;
  v5[3] = &unk_1E5B01500;
  id v6 = *(id *)(a1 + 32);
  uint64_t v2 = (void *)MEMORY[0x1A624A7E0](v5);
  [*(id *)(*(void *)(a1 + 40) + 184) addObject:v2];
  dispatch_semaphore_t v3 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__NRPairedDeviceRegistry_waitForActiveDevice__block_invoke_3;
  v4[3] = &unk_1E5B013C0;
  v4[4] = v3;
  [v3 _grabRegistryWithReadBlock:v4];
}

uint64_t __45__NRPairedDeviceRegistry_waitForActiveDevice__block_invoke_2(uint64_t a1, void *a2)
{
  dispatch_semaphore_t v3 = [a2 activeDevice];
  uint64_t v4 = v3;
  if (v3 && ([v3 isAltAccount] & 1) == 0)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __45__NRPairedDeviceRegistry_waitForActiveDevice__block_invoke_3(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2) {
    return [*(id *)(v2 + 184) sweepWithCollection:a2];
  }
  return result;
}

- (void)abortPairing
{
}

- (void)abortPairingWithReason:(id)a3
{
  id v6 = a3;
  if (![(NRRegistryClient *)self daemonIdle])
  {
    uint64_t v4 = [(NRRegistryClient *)self connection];
    uint64_t v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_372];
    [v5 xpcAbortPairingReason:v6 withBlock:&__block_literal_global_374];
  }
}

- (void)suspendPairingClientCrashMonitoring
{
  id v3 = [(NRRegistryClient *)self connection];
  uint64_t v2 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_376];
  [v2 xpcSuspendPairingClientCrashMonitoring:&__block_literal_global_378];
}

- (void)resumePairingClientCrashMonitoring
{
  id v3 = [(NRRegistryClient *)self connection];
  uint64_t v2 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_380];
  [v2 xpcResumePairingClientCrashMonitoring:&__block_literal_global_382];
}

- (id)pairingStorePath
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__2;
  uint64_t v11 = __Block_byref_object_dispose__2;
  id v12 = 0;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy__2;
  void v5[4] = __Block_byref_object_dispose__2;
  id v6 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__NRPairedDeviceRegistry_pairingStorePath__block_invoke;
  v4[3] = &unk_1E5B01548;
  v4[4] = &v7;
  void v4[5] = v5;
  [(NRPairedDeviceRegistry *)self pairingStorePathPairingID:v4];
  id v2 = (id)v8[5];
  _Block_object_dispose(v5, 8);

  _Block_object_dispose(&v7, 8);

  return v2;
}

void __42__NRPairedDeviceRegistry_pairingStorePath__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)pairingID
{
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__2;
  void v11[4] = __Block_byref_object_dispose__2;
  id v12 = 0;
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__2;
  uint64_t v9 = __Block_byref_object_dispose__2;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__NRPairedDeviceRegistry_pairingID__block_invoke;
  v4[3] = &unk_1E5B01548;
  v4[4] = v11;
  void v4[5] = &v5;
  [(NRPairedDeviceRegistry *)self pairingStorePathPairingID:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  _Block_object_dispose(v11, 8);

  return v2;
}

void __35__NRPairedDeviceRegistry_pairingID__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)blockAndQueryVersions
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__2;
  id v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  id v2 = [(NRRegistry *)self managementQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__NRPairedDeviceRegistry_blockAndQueryVersions__block_invoke;
  block[3] = &unk_1E5B01570;
  void block[4] = &v6;
  dispatch_sync(v2, block);

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __47__NRPairedDeviceRegistry_blockAndQueryVersions__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[NRPairingCompatibilityVersionInfo systemVersions];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)userIsCheckingForUpdate
{
  id v3 = [(NRRegistryClient *)self connection];
  uint64_t v2 = [v3 remoteObjectProxy];
  [v2 xpcTriggerVersion4Workaround];
}

- (int64_t)pairingCompatibilityVersion
{
  uint64_t v2 = +[NRPairingCompatibilityVersionInfo systemVersions];
  int64_t v3 = [v2 pairingCompatibilityVersion];

  return v3;
}

- (int64_t)maxPairingCompatibilityVersion
{
  uint64_t v2 = +[NRPairingCompatibilityVersionInfo systemVersions];
  int64_t v3 = [v2 maxPairingCompatibilityVersion];

  return v3;
}

- (int64_t)minPairingCompatibilityVersion
{
  uint64_t v2 = +[NRPairingCompatibilityVersionInfo systemVersions];
  int64_t v3 = [v2 minPairingCompatibilityVersion];

  return v3;
}

- (int64_t)minQuickSwitchCompatibilityVersion
{
  uint64_t v2 = +[NRPairingCompatibilityVersionInfo systemVersions];
  int64_t v3 = [v2 minQuickSwitchCompatibilityVersion];

  return v3;
}

- (void)beginDiscovery
{
  id v3 = [(NRRegistryClient *)self connection];
  uint64_t v2 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_388];
  [v2 xpcBeginDiscoveryWithBlock:&__block_literal_global_390];
}

- (void)endDiscovery
{
  id v3 = [(NRRegistryClient *)self connection];
  uint64_t v2 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_392];
  [v2 xpcEndDiscoveryWithBlock:&__block_literal_global_394];
}

- (void)overrideSignalStrengthLimit:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = nr_framework_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    uint64_t v6 = nr_framework_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      int64_t v8 = a3;
      _os_log_impl(&dword_1A356E000, v6, OS_LOG_TYPE_DEFAULT, "overrideSignalStrengthLimit:%ld not implemented", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)xpcDeviceID:(id)a3 needsPasscode:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4)
  {
    uint64_t v9 = @"passcode";
    v10[0] = a4;
    int v7 = (void *)MEMORY[0x1E4F1C9E8];
    id v8 = a4;
    a4 = [v7 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  }
  -[NRPairedDeviceRegistry _postNotification:forDeviceID:withUserInfo:]((uint64_t)self, @"NRPairedDeviceRegistryDeviceNeedsPasscode", v6, a4);
}

- (void)xpcHasNewOOBKey:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    int v7 = @"OOBKey";
    v8[0] = a3;
    uint64_t v4 = (void *)MEMORY[0x1E4F1C9E8];
    id v5 = a3;
    id v6 = [v4 dictionaryWithObjects:v8 forKeys:&v7 count:1];
  }
  else
  {
    id v6 = 0;
  }
  -[NRPairedDeviceRegistry _postNotification:forDeviceID:withUserInfo:]((uint64_t)self, @"NRPairedDeviceRegistryDeviceOOBKeyDidChange", 0, v6);
}

- (void)completeRTCPairingMetricForMetricID:(id)a3 withSuccess:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NRRegistryClient *)self connection];

  if (v8)
  {
    uint64_t v9 = [(NRRegistryClient *)self connection];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    void v16[2] = __74__NRPairedDeviceRegistry_completeRTCPairingMetricForMetricID_withSuccess___block_invoke;
    v16[3] = &unk_1E5B00080;
    id v10 = &v17;
    id v17 = v7;
    id v11 = v7;
    id v12 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v16];
    [v12 xpcSubmitRTCPairingMetricForMetricID:v6 withSuccess:v11];
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __74__NRPairedDeviceRegistry_completeRTCPairingMetricForMetricID_withSuccess___block_invoke_3;
    v14[3] = &unk_1E5B00208;
    id v10 = &v15;
    id v15 = v7;
    id v13 = v7;
    dispatch_async(MEMORY[0x1E4F14428], v14);
  }
}

void __74__NRPairedDeviceRegistry_completeRTCPairingMetricForMetricID_withSuccess___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__NRPairedDeviceRegistry_completeRTCPairingMetricForMetricID_withSuccess___block_invoke_2;
    block[3] = &unk_1E5B00208;
    id v3 = v1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __74__NRPairedDeviceRegistry_completeRTCPairingMetricForMetricID_withSuccess___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __74__NRPairedDeviceRegistry_completeRTCPairingMetricForMetricID_withSuccess___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateWatchBuddyStage:(unsigned int)a3 forPairingID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if ([(NRRegistryClient *)self daemonIdle]
    || ([(NRRegistryClient *)self connection],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    id v10 = nr_framework_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

    if (v11)
    {
      id v12 = nr_framework_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v13 = 0;
        _os_log_error_impl(&dword_1A356E000, v12, OS_LOG_TYPE_ERROR, "xpc error updating buddy stage", v13, 2u);
      }
    }
  }
  else
  {
    id v8 = [(NRRegistryClient *)self connection];
    uint64_t v9 = [v8 remoteObjectProxyWithErrorHandler:&__block_literal_global_396];
    [v9 xpcUpdateWatchBuddyStage:v4 forPairingID:v6];
  }
}

void __61__NRPairedDeviceRegistry_updateWatchBuddyStage_forPairingID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = nr_framework_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    id v5 = nr_framework_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      id v7 = v2;
      _os_log_error_impl(&dword_1A356E000, v5, OS_LOG_TYPE_ERROR, "connection error updating buddy stage: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (id)deviceForPairingID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  dispatch_semaphore_t v14 = __Block_byref_object_copy__2;
  id v15 = __Block_byref_object_dispose__2;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __45__NRPairedDeviceRegistry_deviceForPairingID___block_invoke;
  v8[3] = &unk_1E5B01598;
  id v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  [(NRPairedDeviceRegistry *)self threadIsBlockedWaitingOn_nanoregistryd_syncGrabLegacyRegistryWithBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

uint64_t __45__NRPairedDeviceRegistry_deviceForPairingID___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = [a4 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void *)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  return MEMORY[0x1F41817F8](v5, v7);
}

- (id)deviceForBTDeviceID:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F29128];
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithUUIDString:v5];

  uint64_t v7 = [(NRPairedDeviceRegistry *)self deviceForBluetoothID:v6];

  return v7;
}

- (id)deviceForBluetoothID:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__NRPairedDeviceRegistry_deviceForBluetoothID___block_invoke;
  v9[3] = &unk_1E5B015C0;
  id v10 = v4;
  id v5 = v4;
  uint64_t v6 = [(NRPairedDeviceRegistry *)self getAllDevicesWithArchivedAltAccountDevicesMatching:v9];
  uint64_t v7 = [v6 firstObject];

  return v7;
}

BOOL __47__NRPairedDeviceRegistry_deviceForBluetoothID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"isPaired"];
  id v5 = [v3 objectForKeyedSubscript:@"isActive"];
  BOOL v8 = 0;
  if (([v4 BOOLValue] & 1) != 0 || objc_msgSend(v5, "BOOLValue"))
  {
    uint64_t v6 = [v3 objectForKeyedSubscript:@"_bluetoothIdentifier"];
    char v7 = [*(id *)(a1 + 32) isEqual:v6];

    if (v7) {
      BOOL v8 = 1;
    }
  }

  return v8;
}

- (id)nonActiveDeviceForBTDeviceID:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F29128];
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithUUIDString:v5];

  char v7 = [(NRPairedDeviceRegistry *)self nonActiveDeviceForBluetoothID:v6];

  return v7;
}

- (id)nonActiveDeviceForBluetoothID:(id)a3
{
  id v3 = [(NRPairedDeviceRegistry *)self getAllDevicesWithArchivedAltAccountDevicesMatching:&__block_literal_global_398];
  id v4 = [v3 firstObject];

  return v4;
}

uint64_t __56__NRPairedDeviceRegistry_nonActiveDeviceForBluetoothID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 valueForProperty:@"isArchived"];
  id v3 = v2;
  if (v2) {
    uint64_t v4 = [v2 BOOLValue] ^ 1;
  }
  else {
    uint64_t v4 = 1;
  }

  return v4;
}

- (id)deviceForIDSDevice:(id)a3
{
  uint64_t v4 = [(NRPairedDeviceRegistry *)self deviceIDForIDSDevice:a3];
  id v5 = [v4 UUIDString];
  uint64_t v6 = [(NRPairedDeviceRegistry *)self deviceForBTDeviceID:v5];

  return v6;
}

- (id)nonActiveDeviceForIDSDevice:(id)a3
{
  uint64_t v4 = [(NRPairedDeviceRegistry *)self deviceIDForIDSDevice:a3];
  id v5 = [v4 UUIDString];
  uint64_t v6 = [(NRPairedDeviceRegistry *)self nonActiveDeviceForBTDeviceID:v5];

  return v6;
}

- (id)deviceForNRDevice:(id)a3 fromIDSDevices:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  char v7 = [(NRPairedDeviceRegistry *)self deviceIDForNRDevice:a3];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        dispatch_semaphore_t v14 = -[NRPairedDeviceRegistry deviceIDForIDSDevice:](self, "deviceIDForIDSDevice:", v13, (void)v18);
        int v15 = [v7 isEqual:v14];

        if (v15)
        {
          id v16 = v13;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  id v16 = 0;
LABEL_11:

  return v16;
}

- (id)deviceIDForNRDevice:(id)a3
{
  return (id)[a3 objectForKeyedSubscript:@"_bluetoothIdentifier"];
}

- (id)deviceIDForIDSDevice:(id)a3
{
  return (id)[a3 nsuuid];
}

- (void)pairingClientDidEnterPhase:(id)a3
{
  id v6 = a3;
  if (![(NRRegistryClient *)self daemonIdle])
  {
    uint64_t v4 = [(NRRegistryClient *)self connection];
    id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_400];
    [v5 xpcPairingClientDidEnterPhase:v6 withBlock:&__block_literal_global_402];
  }
}

- (void)pairingClientSetAltAccountName:(id)a3 forDevice:(id)a4 completion:(id)a5
{
}

- (void)pairingClientSetAltAccountName:(id)a3 altDSID:(id)a4 forDevice:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (![(NRRegistryClient *)self daemonIdle])
  {
    dispatch_semaphore_t v14 = [(NRRegistryClient *)self connection];

    if (v14)
    {
      int v15 = [(NRRegistryClient *)self connection];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __86__NRPairedDeviceRegistry_pairingClientSetAltAccountName_altDSID_forDevice_completion___block_invoke;
      v24[3] = &unk_1E5B00080;
      id v16 = &v25;
      id v17 = v13;
      id v25 = v17;
      long long v18 = [v15 remoteObjectProxyWithErrorHandler:v24];
      long long v19 = [v12 pairingID];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __86__NRPairedDeviceRegistry_pairingClientSetAltAccountName_altDSID_forDevice_completion___block_invoke_3;
      v22[3] = &unk_1E5B00080;
      id v23 = v17;
      [v18 xpcPairingClientSetAltAccountName:v10 altDSID:v11 forPairingID:v19 completion:v22];

LABEL_6:
      goto LABEL_7;
    }
  }
  if (v13)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__NRPairedDeviceRegistry_pairingClientSetAltAccountName_altDSID_forDevice_completion___block_invoke_5;
    block[3] = &unk_1E5B00208;
    id v16 = &v21;
    id v21 = v13;
    dispatch_async(MEMORY[0x1E4F14428], block);
    goto LABEL_6;
  }
LABEL_7:
}

void __86__NRPairedDeviceRegistry_pairingClientSetAltAccountName_altDSID_forDevice_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__NRPairedDeviceRegistry_pairingClientSetAltAccountName_altDSID_forDevice_completion___block_invoke_2;
    block[3] = &unk_1E5B00208;
    id v3 = v1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __86__NRPairedDeviceRegistry_pairingClientSetAltAccountName_altDSID_forDevice_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __86__NRPairedDeviceRegistry_pairingClientSetAltAccountName_altDSID_forDevice_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __86__NRPairedDeviceRegistry_pairingClientSetAltAccountName_altDSID_forDevice_completion___block_invoke_4;
    v5[3] = &unk_1E5B00058;
    id v7 = v4;
    id v6 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __86__NRPairedDeviceRegistry_pairingClientSetAltAccountName_altDSID_forDevice_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __86__NRPairedDeviceRegistry_pairingClientSetAltAccountName_altDSID_forDevice_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)pairingClientSetPairingParentName:(id)a3 pairingParentAltDSID:(id)a4 forDevice:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (![(NRRegistryClient *)self daemonIdle])
  {
    dispatch_semaphore_t v14 = [(NRRegistryClient *)self connection];

    if (v14)
    {
      int v15 = [(NRRegistryClient *)self connection];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __102__NRPairedDeviceRegistry_pairingClientSetPairingParentName_pairingParentAltDSID_forDevice_completion___block_invoke;
      v24[3] = &unk_1E5B00080;
      id v16 = &v25;
      id v17 = v13;
      id v25 = v17;
      long long v18 = [v15 remoteObjectProxyWithErrorHandler:v24];
      long long v19 = [v12 pairingID];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __102__NRPairedDeviceRegistry_pairingClientSetPairingParentName_pairingParentAltDSID_forDevice_completion___block_invoke_3;
      v22[3] = &unk_1E5B00080;
      id v23 = v17;
      [v18 xpcPairingClientSetPairingParentName:v10 pairingParentAltDSID:v11 forPairingID:v19 completion:v22];

LABEL_6:
      goto LABEL_7;
    }
  }
  if (v13)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __102__NRPairedDeviceRegistry_pairingClientSetPairingParentName_pairingParentAltDSID_forDevice_completion___block_invoke_5;
    block[3] = &unk_1E5B00208;
    id v16 = &v21;
    id v21 = v13;
    dispatch_async(MEMORY[0x1E4F14428], block);
    goto LABEL_6;
  }
LABEL_7:
}

void __102__NRPairedDeviceRegistry_pairingClientSetPairingParentName_pairingParentAltDSID_forDevice_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __102__NRPairedDeviceRegistry_pairingClientSetPairingParentName_pairingParentAltDSID_forDevice_completion___block_invoke_2;
    block[3] = &unk_1E5B00208;
    id v3 = v1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __102__NRPairedDeviceRegistry_pairingClientSetPairingParentName_pairingParentAltDSID_forDevice_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __102__NRPairedDeviceRegistry_pairingClientSetPairingParentName_pairingParentAltDSID_forDevice_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __102__NRPairedDeviceRegistry_pairingClientSetPairingParentName_pairingParentAltDSID_forDevice_completion___block_invoke_4;
    v5[3] = &unk_1E5B00058;
    id v7 = v4;
    id v6 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __102__NRPairedDeviceRegistry_pairingClientSetPairingParentName_pairingParentAltDSID_forDevice_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __102__NRPairedDeviceRegistry_pairingClientSetPairingParentName_pairingParentAltDSID_forDevice_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)setWatchBuddyPushedSyncTrapUI:(id)a3
{
  id v4 = a3;
  if (![(NRRegistryClient *)self daemonIdle])
  {
    id v5 = [(NRRegistryClient *)self connection];

    if (v5)
    {
      id v6 = [(NRRegistryClient *)self connection];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      void v14[2] = __56__NRPairedDeviceRegistry_setWatchBuddyPushedSyncTrapUI___block_invoke;
      v14[3] = &unk_1E5B00080;
      id v7 = &v15;
      id v8 = v4;
      id v15 = v8;
      uint64_t v9 = [v6 remoteObjectProxyWithErrorHandler:v14];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __56__NRPairedDeviceRegistry_setWatchBuddyPushedSyncTrapUI___block_invoke_3;
      v12[3] = &unk_1E5B00080;
      id v13 = v8;
      [v9 xpcWatchBuddyCompletedSetupSteps:v12];

LABEL_6:
      goto LABEL_7;
    }
  }
  if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__NRPairedDeviceRegistry_setWatchBuddyPushedSyncTrapUI___block_invoke_5;
    block[3] = &unk_1E5B00208;
    id v7 = &v11;
    id v11 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
    goto LABEL_6;
  }
LABEL_7:
}

void __56__NRPairedDeviceRegistry_setWatchBuddyPushedSyncTrapUI___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__NRPairedDeviceRegistry_setWatchBuddyPushedSyncTrapUI___block_invoke_2;
    block[3] = &unk_1E5B00208;
    id v3 = v1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __56__NRPairedDeviceRegistry_setWatchBuddyPushedSyncTrapUI___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __56__NRPairedDeviceRegistry_setWatchBuddyPushedSyncTrapUI___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __56__NRPairedDeviceRegistry_setWatchBuddyPushedSyncTrapUI___block_invoke_4;
    v5[3] = &unk_1E5B00058;
    id v7 = v4;
    id v6 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __56__NRPairedDeviceRegistry_setWatchBuddyPushedSyncTrapUI___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __56__NRPairedDeviceRegistry_setWatchBuddyPushedSyncTrapUI___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)setWatchBuddyCompletedSetupSteps:(id)a3
{
  id v4 = a3;
  if (![(NRRegistryClient *)self daemonIdle])
  {
    id v5 = [(NRRegistryClient *)self connection];

    if (v5)
    {
      id v6 = [(NRRegistryClient *)self connection];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      void v14[2] = __59__NRPairedDeviceRegistry_setWatchBuddyCompletedSetupSteps___block_invoke;
      v14[3] = &unk_1E5B00080;
      id v7 = &v15;
      id v8 = v4;
      id v15 = v8;
      uint64_t v9 = [v6 remoteObjectProxyWithErrorHandler:v14];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __59__NRPairedDeviceRegistry_setWatchBuddyCompletedSetupSteps___block_invoke_3;
      v12[3] = &unk_1E5B00080;
      id v13 = v8;
      [v9 xpcWatchBuddyCompletedSetupSteps:v12];

LABEL_6:
      goto LABEL_7;
    }
  }
  if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__NRPairedDeviceRegistry_setWatchBuddyCompletedSetupSteps___block_invoke_5;
    block[3] = &unk_1E5B00208;
    id v7 = &v11;
    id v11 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
    goto LABEL_6;
  }
LABEL_7:
}

void __59__NRPairedDeviceRegistry_setWatchBuddyCompletedSetupSteps___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__NRPairedDeviceRegistry_setWatchBuddyCompletedSetupSteps___block_invoke_2;
    block[3] = &unk_1E5B00208;
    id v3 = v1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __59__NRPairedDeviceRegistry_setWatchBuddyCompletedSetupSteps___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __59__NRPairedDeviceRegistry_setWatchBuddyCompletedSetupSteps___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __59__NRPairedDeviceRegistry_setWatchBuddyCompletedSetupSteps___block_invoke_4;
    v5[3] = &unk_1E5B00058;
    id v7 = v4;
    id v6 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __59__NRPairedDeviceRegistry_setWatchBuddyCompletedSetupSteps___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __59__NRPairedDeviceRegistry_setWatchBuddyCompletedSetupSteps___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (unsigned)switchIndex
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 0;
  if (![(NRRegistryClient *)self daemonIdle])
  {
    id v3 = [(NRRegistryClient *)self connection];
    id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_404];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __37__NRPairedDeviceRegistry_switchIndex__block_invoke_2;
    v7[3] = &unk_1E5B015E8;
    void v7[4] = &v8;
    [v4 xpcSwitchIndex:v7];
  }
  unsigned int v5 = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __37__NRPairedDeviceRegistry_switchIndex__block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)getSwitchEventsFromIndex:(unsigned int)a3 inlineCallback:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = a3 + 1;
  unsigned int v8 = [(NRPairedDeviceRegistry *)self switchIndex];
  *(void *)&long long v9 = 67109376;
  long long v16 = v9;
  do
  {
    id v17 = v6;
    if (self)
    {
      uint64_t v10 = nr_framework_log();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

      if (v11)
      {
        id v12 = nr_framework_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v16;
          *(_DWORD *)&uint8_t buf[4] = v7;
          __int16 v19 = 1024;
          unsigned int v20 = v8;
          _os_log_impl(&dword_1A356E000, v12, OS_LOG_TYPE_DEFAULT, "%u %u", buf, 0xEu);
        }
      }
      for (; v7 <= v8; uint64_t v7 = (v7 + 1))
      {
        *(void *)buf = 0;
        uint64_t v13 = -[NRPairedDeviceRegistry _deviceIDAtSwitchIndex:date:](self, "_deviceIDAtSwitchIndex:date:", v7, buf, v16);
        dispatch_semaphore_t v14 = (void *)v13;
        if (*(void *)buf) {
          BOOL v15 = v13 == 0;
        }
        else {
          BOOL v15 = 1;
        }
        if (!v15) {
          (*((void (**)(id, uint64_t))v6 + 2))(v17, v7);
        }
      }
    }

    uint64_t v7 = v8 + 1;
    unsigned int v8 = [(NRPairedDeviceRegistry *)self switchIndex];
  }
  while (v8 >= v7);
}

- (void)getMigrationPairingCharacteristicReadDataWithQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    unsigned int v8 = v6;
  }
  else
  {
    unsigned int v8 = MEMORY[0x1E4F14428];
    id v9 = MEMORY[0x1E4F14428];
  }
  uint64_t v10 = nr_framework_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    id v12 = nr_framework_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A356E000, v12, OS_LOG_TYPE_DEFAULT, "Received request for characteristic read data", buf, 2u);
    }
  }
  if ([(NRRegistryClient *)self daemonIdle]
    || ([(NRRegistryClient *)self connection],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        !v13))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__NRPairedDeviceRegistry_getMigrationPairingCharacteristicReadDataWithQueue_completion___block_invoke_5;
    block[3] = &unk_1E5B00208;
    BOOL v15 = &v22;
    id v22 = v7;
    id v20 = v7;
    dispatch_async(v8, block);
  }
  else
  {
    dispatch_semaphore_t v14 = [(NRRegistryClient *)self connection];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __88__NRPairedDeviceRegistry_getMigrationPairingCharacteristicReadDataWithQueue_completion___block_invoke;
    v26[3] = &unk_1E5B000A8;
    BOOL v15 = (id *)&v27;
    long long v16 = v8;
    long long v27 = v16;
    id v17 = v7;
    id v28 = v17;
    long long v18 = [v14 remoteObjectProxyWithErrorHandler:v26];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __88__NRPairedDeviceRegistry_getMigrationPairingCharacteristicReadDataWithQueue_completion___block_invoke_3;
    v23[3] = &unk_1E5B009E8;
    id v24 = v16;
    id v25 = v17;
    id v19 = v17;
    [v18 xpcGetMigrationPairingCharacteristicReadDataWithCompletion:v23];
  }
}

void __88__NRPairedDeviceRegistry_getMigrationPairingCharacteristicReadDataWithQueue_completion___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__NRPairedDeviceRegistry_getMigrationPairingCharacteristicReadDataWithQueue_completion___block_invoke_2;
  block[3] = &unk_1E5B00208;
  uint64_t v1 = *(NSObject **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t __88__NRPairedDeviceRegistry_getMigrationPairingCharacteristicReadDataWithQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __88__NRPairedDeviceRegistry_getMigrationPairingCharacteristicReadDataWithQueue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __88__NRPairedDeviceRegistry_getMigrationPairingCharacteristicReadDataWithQueue_completion___block_invoke_4;
  v7[3] = &unk_1E5B00058;
  id v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __88__NRPairedDeviceRegistry_getMigrationPairingCharacteristicReadDataWithQueue_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __88__NRPairedDeviceRegistry_getMigrationPairingCharacteristicReadDataWithQueue_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)putMigrationChallengeCharacteristicWriteData:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = (id)MEMORY[0x1E4F14428];
    id v12 = MEMORY[0x1E4F14428];
  }
  if ([(NRRegistryClient *)self daemonIdle]
    || ([(NRRegistryClient *)self connection],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        !v13))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__NRPairedDeviceRegistry_putMigrationChallengeCharacteristicWriteData_queue_completion___block_invoke_5;
    block[3] = &unk_1E5B00208;
    BOOL v15 = &v22;
    id v22 = v10;
    id v20 = v10;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    dispatch_semaphore_t v14 = [(NRRegistryClient *)self connection];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __88__NRPairedDeviceRegistry_putMigrationChallengeCharacteristicWriteData_queue_completion___block_invoke;
    v26[3] = &unk_1E5B000A8;
    BOOL v15 = &v27;
    id v16 = v11;
    id v27 = v16;
    id v17 = v10;
    id v28 = v17;
    long long v18 = [v14 remoteObjectProxyWithErrorHandler:v26];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __88__NRPairedDeviceRegistry_putMigrationChallengeCharacteristicWriteData_queue_completion___block_invoke_3;
    v23[3] = &unk_1E5B00880;
    id v24 = v16;
    id v25 = v17;
    id v19 = v17;
    [v18 xpcPutMigrationChallengeCharacteristicWriteData:v8 completion:v23];
  }
}

void __88__NRPairedDeviceRegistry_putMigrationChallengeCharacteristicWriteData_queue_completion___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__NRPairedDeviceRegistry_putMigrationChallengeCharacteristicWriteData_queue_completion___block_invoke_2;
  block[3] = &unk_1E5B00208;
  uint64_t v1 = *(NSObject **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t __88__NRPairedDeviceRegistry_putMigrationChallengeCharacteristicWriteData_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __88__NRPairedDeviceRegistry_putMigrationChallengeCharacteristicWriteData_queue_completion___block_invoke_3(uint64_t a1, char a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __88__NRPairedDeviceRegistry_putMigrationChallengeCharacteristicWriteData_queue_completion___block_invoke_4;
  v4[3] = &unk_1E5B00858;
  id v3 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  char v6 = a2;
  dispatch_async(v3, v4);
}

uint64_t __88__NRPairedDeviceRegistry_putMigrationChallengeCharacteristicWriteData_queue_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __88__NRPairedDeviceRegistry_putMigrationChallengeCharacteristicWriteData_queue_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startWatchSetupPush
{
  id v3 = [(NRRegistryClient *)self connection];
  id v2 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_408];
  [v2 xpcStartWatchSetupPushWithBlock:&__block_literal_global_410];
}

- (BOOL)isWatchSetupPushActive
{
  id v2 = nr_framework_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    id v4 = nr_framework_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)char v6 = 0;
      _os_log_error_impl(&dword_1A356E000, v4, OS_LOG_TYPE_ERROR, "isWatchSetupPushActive not implemented", v6, 2u);
    }
  }
  return 0;
}

- (void)stopWatchSetupPush
{
  id v3 = [(NRRegistryClient *)self connection];
  id v2 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_412];
  [v2 xpcStopWatchSetupPushWithBlock:&__block_literal_global_414];
}

- (void)waitForWatchPairingExtendedMetadataForAdvertisedName:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NRRegistryClient *)self connection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __90__NRPairedDeviceRegistry_waitForWatchPairingExtendedMetadataForAdvertisedName_completion___block_invoke;
  v14[3] = &unk_1E5B00080;
  id v9 = v6;
  id v15 = v9;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __90__NRPairedDeviceRegistry_waitForWatchPairingExtendedMetadataForAdvertisedName_completion___block_invoke_3;
  v12[3] = &unk_1E5B01610;
  id v13 = v9;
  id v11 = v9;
  [v10 xpcWaitForWatchPairingExtendedMetadataForAdvertisedName:v7 completion:v12];
}

void __90__NRPairedDeviceRegistry_waitForWatchPairingExtendedMetadataForAdvertisedName_completion___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__NRPairedDeviceRegistry_waitForWatchPairingExtendedMetadataForAdvertisedName_completion___block_invoke_2;
  block[3] = &unk_1E5B00208;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __90__NRPairedDeviceRegistry_waitForWatchPairingExtendedMetadataForAdvertisedName_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __90__NRPairedDeviceRegistry_waitForWatchPairingExtendedMetadataForAdvertisedName_completion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__NRPairedDeviceRegistry_waitForWatchPairingExtendedMetadataForAdvertisedName_completion___block_invoke_4;
  block[3] = &unk_1E5B00998;
  id v6 = *(id *)(a1 + 32);
  char v11 = a2;
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __90__NRPairedDeviceRegistry_waitForWatchPairingExtendedMetadataForAdvertisedName_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)setMigrationConsented:(BOOL)a3 forDeviceID:(id)a4 withBlock:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if (![(NRRegistryClient *)self daemonIdle])
  {
    id v10 = [(NRRegistryClient *)self connection];

    if (v10)
    {
      char v11 = [(NRRegistryClient *)self connection];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __70__NRPairedDeviceRegistry_setMigrationConsented_forDeviceID_withBlock___block_invoke;
      v19[3] = &unk_1E5B00080;
      id v12 = &v20;
      id v13 = v9;
      id v20 = v13;
      dispatch_semaphore_t v14 = [v11 remoteObjectProxyWithErrorHandler:v19];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __70__NRPairedDeviceRegistry_setMigrationConsented_forDeviceID_withBlock___block_invoke_3;
      v17[3] = &unk_1E5B00208;
      id v18 = v13;
      [v14 xpcSetMigrationConsented:v6 forDeviceID:v8 withBlock:v17];

LABEL_6:
      goto LABEL_7;
    }
  }
  if (v9)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__NRPairedDeviceRegistry_setMigrationConsented_forDeviceID_withBlock___block_invoke_5;
    block[3] = &unk_1E5B00208;
    id v12 = &v16;
    id v16 = v9;
    dispatch_async(MEMORY[0x1E4F14428], block);
    goto LABEL_6;
  }
LABEL_7:
}

void __70__NRPairedDeviceRegistry_setMigrationConsented_forDeviceID_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__NRPairedDeviceRegistry_setMigrationConsented_forDeviceID_withBlock___block_invoke_2;
    block[3] = &unk_1E5B00208;
    id v3 = v1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __70__NRPairedDeviceRegistry_setMigrationConsented_forDeviceID_withBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __70__NRPairedDeviceRegistry_setMigrationConsented_forDeviceID_withBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__NRPairedDeviceRegistry_setMigrationConsented_forDeviceID_withBlock___block_invoke_4;
    block[3] = &unk_1E5B00208;
    id v3 = v1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __70__NRPairedDeviceRegistry_setMigrationConsented_forDeviceID_withBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__NRPairedDeviceRegistry_setMigrationConsented_forDeviceID_withBlock___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)setMigrationConsented:(BOOL)a3 forDevice:(id)a4 withBlock:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = [a4 pairingID];
  [(NRPairedDeviceRegistry *)self setMigrationConsented:v6 forDeviceID:v9 withBlock:v8];
}

- (void)beginMigrationWithDevice:(id)a3 passcode:(id)a4 withBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(NRRegistryClient *)self daemonIdle])
  {
    char v11 = [(NRRegistryClient *)self connection];

    if (v11)
    {
      id v12 = [(NRRegistryClient *)self connection];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __70__NRPairedDeviceRegistry_beginMigrationWithDevice_passcode_withBlock___block_invoke;
      v21[3] = &unk_1E5B00080;
      id v13 = &v22;
      id v14 = v10;
      id v22 = v14;
      id v15 = [v12 remoteObjectProxyWithErrorHandler:v21];
      id v16 = [v8 pairingID];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __70__NRPairedDeviceRegistry_beginMigrationWithDevice_passcode_withBlock___block_invoke_3;
      v19[3] = &unk_1E5B00208;
      id v20 = v14;
      [v15 xpcBeginMigrationWithDeviceID:v16 passcode:v9 withBlock:v19];

LABEL_6:
      goto LABEL_7;
    }
  }
  if (v10)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__NRPairedDeviceRegistry_beginMigrationWithDevice_passcode_withBlock___block_invoke_5;
    block[3] = &unk_1E5B00208;
    id v13 = &v18;
    id v18 = v10;
    dispatch_async(MEMORY[0x1E4F14428], block);
    goto LABEL_6;
  }
LABEL_7:
}

void __70__NRPairedDeviceRegistry_beginMigrationWithDevice_passcode_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__NRPairedDeviceRegistry_beginMigrationWithDevice_passcode_withBlock___block_invoke_2;
    block[3] = &unk_1E5B00208;
    id v3 = v1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __70__NRPairedDeviceRegistry_beginMigrationWithDevice_passcode_withBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __70__NRPairedDeviceRegistry_beginMigrationWithDevice_passcode_withBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__NRPairedDeviceRegistry_beginMigrationWithDevice_passcode_withBlock___block_invoke_4;
    block[3] = &unk_1E5B00208;
    id v3 = v1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __70__NRPairedDeviceRegistry_beginMigrationWithDevice_passcode_withBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__NRPairedDeviceRegistry_beginMigrationWithDevice_passcode_withBlock___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)beginMigrationWithDevice:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(NRRegistryClient *)self daemonIdle])
  {
    id v8 = [(NRRegistryClient *)self connection];

    if (v8)
    {
      id v9 = [(NRRegistryClient *)self connection];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __66__NRPairedDeviceRegistry_beginMigrationWithDevice_withCompletion___block_invoke;
      v18[3] = &unk_1E5B00080;
      id v10 = &v19;
      id v11 = v7;
      id v19 = v11;
      id v12 = [v9 remoteObjectProxyWithErrorHandler:v18];
      id v13 = [v6 pairingID];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      void v16[2] = __66__NRPairedDeviceRegistry_beginMigrationWithDevice_withCompletion___block_invoke_3;
      v16[3] = &unk_1E5B00080;
      id v17 = v11;
      [v12 xpcBeginMigrationWithDeviceID:v13 completion:v16];

LABEL_6:
      goto LABEL_7;
    }
  }
  if (v7)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__NRPairedDeviceRegistry_beginMigrationWithDevice_withCompletion___block_invoke_5;
    block[3] = &unk_1E5B00208;
    id v10 = &v15;
    id v15 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
    goto LABEL_6;
  }
LABEL_7:
}

void __66__NRPairedDeviceRegistry_beginMigrationWithDevice_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__NRPairedDeviceRegistry_beginMigrationWithDevice_withCompletion___block_invoke_2;
    block[3] = &unk_1E5B00208;
    id v3 = v1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __66__NRPairedDeviceRegistry_beginMigrationWithDevice_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __66__NRPairedDeviceRegistry_beginMigrationWithDevice_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __66__NRPairedDeviceRegistry_beginMigrationWithDevice_withCompletion___block_invoke_4;
    v5[3] = &unk_1E5B00058;
    id v7 = v4;
    id v6 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __66__NRPairedDeviceRegistry_beginMigrationWithDevice_withCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __66__NRPairedDeviceRegistry_beginMigrationWithDevice_withCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)lastMigrationRequestPhoneName
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__2;
  id v11 = __Block_byref_object_dispose__2;
  id v12 = 0;
  id v2 = [(NRRegistryClient *)self connection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_417];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__NRPairedDeviceRegistry_lastMigrationRequestPhoneName__block_invoke_2;
  v6[3] = &unk_1E5B01638;
  void v6[4] = &v7;
  [v3 xpcGetLastMigrationRequestPhoneNameWithCompletion:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __55__NRPairedDeviceRegistry_lastMigrationRequestPhoneName__block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)migrationConsentRequestData
{
  id v2 = +[NRMigrator sharedMigrator];
  id v3 = [v2 migrationConsentRequestData];

  return v3;
}

- (id)devicesFromMigrationConsentRequestData:(id)a3
{
  id v3 = a3;
  id v4 = +[NRMigrator sharedMigrator];
  id v5 = [v4 devicesFromMigrationConsentRequestData:v3];

  return v5;
}

- (void)keepPhoneUnlockedInternalTestSPI:(id)a3
{
  id v4 = a3;
  id v5 = [(NRRegistryClient *)self connection];
  id v6 = [v5 remoteObjectProxy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __59__NRPairedDeviceRegistry_keepPhoneUnlockedInternalTestSPI___block_invoke;
  v8[3] = &unk_1E5B00208;
  id v9 = v4;
  id v7 = v4;
  [v6 xpcKeepPhoneUnlockedInternalTestSPI:v8];
}

uint64_t __59__NRPairedDeviceRegistry_keepPhoneUnlockedInternalTestSPI___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (int64_t)lastSyncSwitchIndex
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  if (![(NRRegistryClient *)self daemonIdle])
  {
    id v3 = [(NRRegistryClient *)self connection];
    BOOL v4 = v3 == 0;

    if (!v4)
    {
      uint64_t v14 = 0;
      id v15 = &v14;
      uint64_t v16 = 0x3032000000;
      id v17 = __Block_byref_object_copy__2;
      id v18 = __Block_byref_object_dispose__2;
      id v19 = 0;
      id v5 = [(NRRegistryClient *)self connection];
      id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_421];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __45__NRPairedDeviceRegistry_lastSyncSwitchIndex__block_invoke_2;
      v13[3] = &unk_1E5B01660;
      void v13[4] = &v20;
      v13[5] = &v14;
      [v6 xpcGetLastSwitchIndex:v13];

      if (v15[5])
      {
        id v7 = nr_framework_log();
        BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

        if (v8)
        {
          id v9 = nr_framework_log();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            uint64_t v12 = v15[5];
            *(_DWORD *)buf = 138412290;
            uint64_t v25 = v12;
            _os_log_error_impl(&dword_1A356E000, v9, OS_LOG_TYPE_ERROR, "NanoRegistry client: Failed to get switchIndex value from CFPrefs- error %@", buf, 0xCu);
          }
        }
      }
      _Block_object_dispose(&v14, 8);
    }
  }
  int64_t v10 = v21[3];
  _Block_object_dispose(&v20, 8);
  return v10;
}

void __45__NRPairedDeviceRegistry_lastSyncSwitchIndex__block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (int64_t)migrationCountForPairingID:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  if (![(NRRegistryClient *)self daemonIdle])
  {
    id v5 = [(NRRegistryClient *)self connection];
    BOOL v6 = !v4 || v5 == 0;
    BOOL v7 = !v6;

    if (v7)
    {
      uint64_t v17 = 0;
      id v18 = &v17;
      uint64_t v19 = 0x3032000000;
      uint64_t v20 = __Block_byref_object_copy__2;
      uint64_t v21 = __Block_byref_object_dispose__2;
      id v22 = 0;
      BOOL v8 = [(NRRegistryClient *)self connection];
      id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_424];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      void v16[2] = __53__NRPairedDeviceRegistry_migrationCountForPairingID___block_invoke_2;
      v16[3] = &unk_1E5B01660;
      void v16[4] = &v23;
      v16[5] = &v17;
      [v9 xpcGetMigrationCountForPairingID:v4 completion:v16];

      if (v18[5])
      {
        int64_t v10 = nr_framework_log();
        BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

        if (v11)
        {
          uint64_t v12 = nr_framework_log();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            uint64_t v15 = v18[5];
            *(_DWORD *)buf = 138412546;
            id v28 = v4;
            __int16 v29 = 2112;
            uint64_t v30 = v15;
            _os_log_error_impl(&dword_1A356E000, v12, OS_LOG_TYPE_ERROR, "NanoRegistry client: Failed to get migrationCount value for pairingID %@ from CFPrefs- error %@", buf, 0x16u);
          }
        }
      }
      _Block_object_dispose(&v17, 8);
    }
  }
  int64_t v13 = v24[3];
  _Block_object_dispose(&v23, 8);

  return v13;
}

void __53__NRPairedDeviceRegistry_migrationCountForPairingID___block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)hasCompletedInitialSyncForPairingID:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  if (![(NRRegistryClient *)self daemonIdle])
  {
    id v5 = [(NRRegistryClient *)self connection];
    BOOL v6 = !v4 || v5 == 0;
    BOOL v7 = !v6;

    if (v7)
    {
      uint64_t v17 = 0;
      id v18 = &v17;
      uint64_t v19 = 0x3032000000;
      uint64_t v20 = __Block_byref_object_copy__2;
      uint64_t v21 = __Block_byref_object_dispose__2;
      id v22 = 0;
      BOOL v8 = [(NRRegistryClient *)self connection];
      id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_426];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      void v16[2] = __62__NRPairedDeviceRegistry_hasCompletedInitialSyncForPairingID___block_invoke_2;
      v16[3] = &unk_1E5B01688;
      void v16[4] = &v23;
      v16[5] = &v17;
      [v9 xpcGetInitialSyncCompletedForPairingID:v4 completion:v16];

      if (v18[5])
      {
        int64_t v10 = nr_framework_log();
        BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

        if (v11)
        {
          uint64_t v12 = nr_framework_log();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            uint64_t v15 = v18[5];
            *(_DWORD *)buf = 138412546;
            id v28 = v4;
            __int16 v29 = 2112;
            uint64_t v30 = v15;
            _os_log_error_impl(&dword_1A356E000, v12, OS_LOG_TYPE_ERROR, "NanoRegistry client: Failed to get initialsynccompleted value for pairingID %@ from CFPrefs- error %@", buf, 0x16u);
          }
        }
      }
      _Block_object_dispose(&v17, 8);
    }
  }
  BOOL v13 = *((unsigned char *)v24 + 24) != 0;
  _Block_object_dispose(&v23, 8);

  return v13;
}

void __62__NRPairedDeviceRegistry_hasCompletedInitialSyncForPairingID___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)isAssertionActive:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  if (![(NRRegistryClient *)self daemonIdle])
  {
    id v5 = [(NRRegistryClient *)self connection];
    BOOL v6 = !v4 || v5 == 0;
    BOOL v7 = !v6;

    if (v7)
    {
      uint64_t v17 = 0;
      id v18 = &v17;
      uint64_t v19 = 0x3032000000;
      uint64_t v20 = __Block_byref_object_copy__2;
      uint64_t v21 = __Block_byref_object_dispose__2;
      id v22 = 0;
      BOOL v8 = [(NRRegistryClient *)self connection];
      id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_429];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      void v16[2] = __44__NRPairedDeviceRegistry_isAssertionActive___block_invoke_2;
      v16[3] = &unk_1E5B01688;
      void v16[4] = &v23;
      v16[5] = &v17;
      [v9 xpcIsAssertionActive:v4 withCompletion:v16];

      if (v18[5])
      {
        int64_t v10 = nr_framework_log();
        BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

        if (v11)
        {
          uint64_t v12 = nr_framework_log();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            uint64_t v15 = v18[5];
            *(_DWORD *)buf = 138412546;
            id v28 = v4;
            __int16 v29 = 2112;
            uint64_t v30 = v15;
            _os_log_error_impl(&dword_1A356E000, v12, OS_LOG_TYPE_ERROR, "NanoRegistry client: Failed to get isAssertionActive value for assertion %@- error %@", buf, 0x16u);
          }
        }
      }
      _Block_object_dispose(&v17, 8);
    }
  }
  BOOL v13 = *((unsigned char *)v24 + 24) != 0;
  _Block_object_dispose(&v23, 8);

  return v13;
}

void __44__NRPairedDeviceRegistry_isAssertionActive___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)isPhoneReadyToMigrateDevice:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(NRRegistryClient *)self daemonIdle])
  {
    BOOL v8 = [(NRRegistryClient *)self connection];

    if (v8)
    {
      id v9 = [(NRRegistryClient *)self connection];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __69__NRPairedDeviceRegistry_isPhoneReadyToMigrateDevice_withCompletion___block_invoke;
      v18[3] = &unk_1E5B00080;
      int64_t v10 = &v19;
      id v11 = v7;
      id v19 = v11;
      uint64_t v12 = [v9 remoteObjectProxyWithErrorHandler:v18];
      BOOL v13 = [v6 pairingID];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      void v16[2] = __69__NRPairedDeviceRegistry_isPhoneReadyToMigrateDevice_withCompletion___block_invoke_3;
      v16[3] = &unk_1E5B016B0;
      id v17 = v11;
      [v12 xpcIsPhoneReadyToMigrateDevice:v13 withCompletion:v16];

LABEL_6:
      goto LABEL_7;
    }
  }
  if (v7)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__NRPairedDeviceRegistry_isPhoneReadyToMigrateDevice_withCompletion___block_invoke_5;
    block[3] = &unk_1E5B00208;
    int64_t v10 = &v15;
    id v15 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
    goto LABEL_6;
  }
LABEL_7:
}

void __69__NRPairedDeviceRegistry_isPhoneReadyToMigrateDevice_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__NRPairedDeviceRegistry_isPhoneReadyToMigrateDevice_withCompletion___block_invoke_2;
    block[3] = &unk_1E5B00208;
    id v3 = v1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __69__NRPairedDeviceRegistry_isPhoneReadyToMigrateDevice_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, 3, v2);
}

void __69__NRPairedDeviceRegistry_isPhoneReadyToMigrateDevice_withCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (v6)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__NRPairedDeviceRegistry_isPhoneReadyToMigrateDevice_withCompletion___block_invoke_4;
    block[3] = &unk_1E5B00B00;
    id v9 = v6;
    uint64_t v10 = a2;
    id v8 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __69__NRPairedDeviceRegistry_isPhoneReadyToMigrateDevice_withCompletion___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

void __69__NRPairedDeviceRegistry_isPhoneReadyToMigrateDevice_withCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitingForRegistryUpdateBlocks, 0);
  objc_storeStrong((id *)&self->_pairedRegistryGetDevicesQueue, 0);
  objc_storeStrong((id *)&self->_pairedDeviceRegistryDeviceListQueue, 0);

  objc_storeStrong((id *)&self->_legacyDevices, 0);
}

- (void)_submitAlbertPairingReport
{
  if (![(NRRegistryClient *)self daemonIdle])
  {
    id v4 = [(NRRegistryClient *)self connection];
    id v3 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_14];
    [v3 xpcSubmitAlbertPairingReport:&__block_literal_global_10];
  }
}

- (id)_getLocalDeviceCollection
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__10;
  id v9 = __Block_byref_object_dispose__10;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__NRPairedDeviceRegistry_Internal___getLocalDeviceCollection__block_invoke;
  v4[3] = &unk_1E5B01C68;
  void v4[4] = &v5;
  [(NRRegistryClient *)self syncGrabRegistryWithReadBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __61__NRPairedDeviceRegistry_Internal___getLocalDeviceCollection__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copyWithZone:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return MEMORY[0x1F41817F8](v3, v5);
}

- (id)_getChangeHistory
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__10;
  BOOL v13 = __Block_byref_object_dispose__10;
  id v14 = 0;
  id v2 = [(NRRegistryClient *)self connection];
  uint64_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __53__NRPairedDeviceRegistry_Internal___getChangeHistory__block_invoke;
  v8[3] = &unk_1E5B01C90;
  void v8[4] = &v9;
  [v3 xpcGetChangeHistoryWithBlock:v8];

  uint64_t v4 = (void *)v10[5];
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = objc_alloc_init(NRDeviceCollectionHistory);
  }
  id v6 = v5;
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __53__NRPairedDeviceRegistry_Internal___getChangeHistory__block_invoke(uint64_t a1, void *a2)
{
}

- (id)_getSecureProperties:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__10;
  id v15 = __Block_byref_object_dispose__10;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __57__NRPairedDeviceRegistry_Internal___getSecureProperties___block_invoke;
  v8[3] = &unk_1E5B01410;
  id v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  [(NRRegistryClient *)self syncGrabRegistryWithReadBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

void __57__NRPairedDeviceRegistry_Internal___getSecureProperties___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = *(id *)(a1 + 32);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v16 = objc_msgSend(v6, "objectForKeyedSubscript:", v15, (void)v17);
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v16 forKeyedSubscript:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }
}

- (id)_deviceIDAtSwitchIndex:(unsigned int)a3 date:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__10;
  id v16 = __Block_byref_object_dispose__10;
  id v17 = 0;
  if (![(NRRegistryClient *)self daemonIdle])
  {
    uint64_t v7 = [(NRRegistryClient *)self connection];
    uint64_t v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_15];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64__NRPairedDeviceRegistry_Internal___deviceIDAtSwitchIndex_date___block_invoke_2;
    v11[3] = &unk_1E5B01CB8;
    void v11[4] = &v12;
    void v11[5] = a4;
    [v8 xpcDeviceIDAtSwitchIndex:v5 withBlock:v11];
  }
  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __64__NRPairedDeviceRegistry_Internal___deviceIDAtSwitchIndex_date___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  uint64_t v7 = *(id **)(a1 + 40);
  if (v7) {
    objc_storeStrong(v7, a3);
  }
}

- (void)_invalidateActiveDeviceAssertionWithIdentifier:(id)a3
{
  id v6 = a3;
  if (![(NRRegistryClient *)self daemonIdle])
  {
    id v4 = [(NRRegistryClient *)self connection];
    uint64_t v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_18];
    [v5 xpcInvalidateSwitchAssertionWithIdentifier:v6 block:&__block_literal_global_20];
  }
}

- (void)_getActiveDeviceAssertionsWithInlineBlock:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__10;
  uint64_t v12 = __Block_byref_object_dispose__10;
  id v13 = 0;
  if (![(NRRegistryClient *)self daemonIdle])
  {
    uint64_t v5 = [(NRRegistryClient *)self connection];
    id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_22];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __78__NRPairedDeviceRegistry_Internal___getActiveDeviceAssertionsWithInlineBlock___block_invoke_2;
    v7[3] = &unk_1E5B01CE0;
    void v7[4] = &v8;
    [v6 xpcActiveDeviceAssertions:v7];
  }
  v4[2](v4, v9[5]);
  _Block_object_dispose(&v8, 8);
}

void __78__NRPairedDeviceRegistry_Internal___getActiveDeviceAssertionsWithInlineBlock___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)_pingActiveGizmoWithPriority:(int64_t)a3 withMessageSize:(int64_t)a4 withBlock:(id)a5
{
  id v8 = a5;
  if ([(NRRegistryClient *)self daemonIdle]
    || ([(NRRegistryClient *)self connection],
        id v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        !v9))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__NRPairedDeviceRegistry_Internal___pingActiveGizmoWithPriority_withMessageSize_withBlock___block_invoke_5;
    block[3] = &unk_1E5B00208;
    uint64_t v11 = &v17;
    id v17 = v8;
    id v15 = v8;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    uint64_t v10 = [(NRRegistryClient *)self connection];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __91__NRPairedDeviceRegistry_Internal___pingActiveGizmoWithPriority_withMessageSize_withBlock___block_invoke;
    v20[3] = &unk_1E5B00080;
    uint64_t v11 = &v21;
    id v12 = v8;
    id v21 = v12;
    id v13 = [v10 remoteObjectProxyWithErrorHandler:v20];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __91__NRPairedDeviceRegistry_Internal___pingActiveGizmoWithPriority_withMessageSize_withBlock___block_invoke_3;
    v18[3] = &unk_1E5B01D30;
    id v19 = v12;
    id v14 = v12;
    [v13 xpcPingActiveGizmoWithPriority:a3 withMessageSize:a4 withBlock:v18];
  }
}

void __91__NRPairedDeviceRegistry_Internal___pingActiveGizmoWithPriority_withMessageSize_withBlock___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__NRPairedDeviceRegistry_Internal___pingActiveGizmoWithPriority_withMessageSize_withBlock___block_invoke_2;
  block[3] = &unk_1E5B00208;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __91__NRPairedDeviceRegistry_Internal___pingActiveGizmoWithPriority_withMessageSize_withBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(double, double))(*(void *)(a1 + 32) + 16))(0.0, 0.0);
}

void __91__NRPairedDeviceRegistry_Internal___pingActiveGizmoWithPriority_withMessageSize_withBlock___block_invoke_3(uint64_t a1, double a2, double a3)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__NRPairedDeviceRegistry_Internal___pingActiveGizmoWithPriority_withMessageSize_withBlock___block_invoke_4;
  block[3] = &unk_1E5B01D08;
  id v6 = *(id *)(a1 + 32);
  double v7 = a2;
  double v8 = a3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __91__NRPairedDeviceRegistry_Internal___pingActiveGizmoWithPriority_withMessageSize_withBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, double, double))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 1, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __91__NRPairedDeviceRegistry_Internal___pingActiveGizmoWithPriority_withMessageSize_withBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(double, double))(*(void *)(a1 + 32) + 16))(0.0, 0.0);
}

- (id)_getClientInfo
{
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__10;
  uint64_t v11 = __Block_byref_object_dispose__10;
  id v12 = (id)MEMORY[0x1E4F1CBF0];
  id v2 = [(NRRegistryClient *)self connection];
  uint64_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__NRPairedDeviceRegistry_Internal___getClientInfo__block_invoke;
  v6[3] = &unk_1E5B013E8;
  void v6[4] = &v7;
  [v3 xpcClientInfo:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __50__NRPairedDeviceRegistry_Internal___getClientInfo__block_invoke(uint64_t a1, void *a2)
{
}

- (id)applyDiff:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NRRegistryClient *)self connection];

  if (v5)
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000;
    long long v18 = __Block_byref_object_copy__10;
    id v19 = __Block_byref_object_dispose__10;
    id v20 = 0;
    id v6 = [(NRRegistryClient *)self connection];
    uint64_t v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_27];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __46__NRPairedDeviceRegistry_Internal__applyDiff___block_invoke_2;
    v14[3] = &unk_1E5B01D58;
    void v14[4] = &v15;
    [v7 xpcApplyDiff:v4 withSecureProperties:0 block:v14];

    if (v16[5])
    {
      double v8 = nr_framework_log();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

      if (v9)
      {
        uint64_t v10 = nr_framework_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          uint64_t v13 = v16[5];
          *(_DWORD *)buf = 138412290;
          uint64_t v22 = v13;
          _os_log_error_impl(&dword_1A356E000, v10, OS_LOG_TYPE_ERROR, "NanoRegistry client: Failed to apply diff to registry because %@", buf, 0xCu);
        }
      }
    }
    id v11 = (id)v16[5];
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

void __46__NRPairedDeviceRegistry_Internal__applyDiff___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)isKeychainEnabled
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "pairedDevicesSelectorBlock", 0);
  id v4 = [(NRPairedDeviceRegistry *)self getDevicesMatching:v3];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v13 + 1) + 8 * v8) valueForProperty:@"_keychainOff"];
        if (v9)
        {
          uint64_t v10 = (void *)v9;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 0;
LABEL_11:

  char v11 = [v10 BOOLValue];
  return v11 ^ 1;
}

- (void)checkIfFlaggedForRecoveryWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(NRRegistryClient *)self connection];
  uint64_t v5 = [v6 remoteObjectProxy];
  [v5 xpcCheckIfFlaggedForRecoveryWithCompletion:v4];
}

- (void)clearRecoveryFlagWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(NRRegistryClient *)self connection];
  uint64_t v5 = [v6 remoteObjectProxy];
  [v5 xpcClearRecoveryFlagWithCompletion:v4];
}

@end