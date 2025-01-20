@interface NRPairingProxy
+ (id)clientExportedInterface;
+ (id)clientRemoteObjectInterface;
+ (id)machServiceName;
+ (id)serverExportedInterface;
+ (id)serverRemoteObjectInterface;
- (id)pairingQueue;
- (id)pairingServicesDelegate;
- (void)xpcAbortPairingReason:(id)a3 withBlock:(id)a4;
- (void)xpcActiveDeviceAssertions:(id)a3;
- (void)xpcBeginDiscoveryWithBlock:(id)a3;
- (void)xpcBeginMigrationWithCompletion:(id)a3;
- (void)xpcBeginMigrationWithDeviceID:(id)a3 completion:(id)a4;
- (void)xpcBeginMigrationWithDeviceID:(id)a3 passcode:(id)a4 withBlock:(id)a5;
- (void)xpcCheckIfFlaggedForRecoveryWithCompletion:(id)a3;
- (void)xpcClearRecoveryFlagWithCompletion:(id)a3;
- (void)xpcClearWatchNeedsGraduation:(id)a3;
- (void)xpcCompanionOOBDiscoverAndPairWithName:(id)a3 withOutOfBandPairingKey:(id)a4 withOptions:(id)a5 operationHasBegun:(id)a6;
- (void)xpcCompanionPasscodePairWithDeviceID:(id)a3 withOptions:(id)a4 operationHasBegun:(id)a5;
- (void)xpcEndDiscoveryWithBlock:(id)a3;
- (void)xpcEnterCompatibilityState:(unsigned __int16)a3 withDeviceID:(id)a4;
- (void)xpcFakePairedSyncIsCompleteWithCompletion:(id)a3;
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
- (void)xpcKeepPhoneUnlockedInternalTestSPI:(id)a3;
- (void)xpcNotifyActivationCompleted:(id)a3 withSuccess:(BOOL)a4;
- (void)xpcNotifyPasscode:(id)a3 withDeviceID:(id)a4;
- (void)xpcPairWithSimulator:(id)a3 withCompletion:(id)a4;
- (void)xpcPairingClientDidEnterPhase:(id)a3 withBlock:(id)a4;
- (void)xpcPairingClientSetAltAccountName:(id)a3 altDSID:(id)a4 forPairingID:(id)a5 completion:(id)a6;
- (void)xpcPairingClientSetPairingParentName:(id)a3 pairingParentAltDSID:(id)a4 forPairingID:(id)a5 completion:(id)a6;
- (void)xpcPairingShouldContinue;
- (void)xpcPingActiveGizmoWithPriority:(int)a3 withMessageSize:(int64_t)a4 withBlock:(id)a5;
- (void)xpcPutMigrationChallengeCharacteristicWriteData:(id)a3 completion:(id)a4;
- (void)xpcResumePairingClientCrashMonitoring:(id)a3;
- (void)xpcRetriggerUnpairInfoDialogWithBlock:(id)a3;
- (void)xpcScanForMigratableWatchesWithBlock:(id)a3;
- (void)xpcSetWatchNeedsGraduation:(id)a3;
- (void)xpcStartWatchSetupPushWithBlock:(id)a3;
- (void)xpcStopWatchSetupPushWithBlock:(id)a3;
- (void)xpcSubmitAlbertPairingReport:(id)a3;
- (void)xpcSubmitRTCPairingMetricForMetricID:(id)a3 withSuccess:(id)a4;
- (void)xpcSubmitServerRequestReportWithRequestType:(id)a3 duration:(double)a4 errorCode:(unsigned int)a5 block:(id)a6;
- (void)xpcSuspendPairingClientCrashMonitoring:(id)a3;
- (void)xpcSwitchActiveDeviceWithDeviceID:(id)a3 isMagicSwitch:(BOOL)a4 operationHasCompleted:(id)a5;
- (void)xpcSwitchActiveDeviceWithDeviceID:(id)a3 withAssertionHandler:(id)a4;
- (void)xpcSwitchToSimulator:(id)a3 withCompletion:(id)a4;
- (void)xpcTriggerTailspinFrom:(unint64_t)a3 forApp:(id)a4;
- (void)xpcTriggerVersion4Workaround;
- (void)xpcUnpairWithDeviceID:(id)a3 withOptions:(id)a4 operationHasBegun:(id)a5;
- (void)xpcUnpairWithSimulator:(id)a3 withCompletion:(id)a4;
- (void)xpcUpdateWatchBuddyStage:(unsigned int)a3 forPairingID:(id)a4;
- (void)xpcWaitForWatchPairingExtendedMetadataForAdvertisedName:(id)a3 completion:(id)a4;
- (void)xpcWatchBuddyCompletedSetupSteps:(id)a3;
- (void)xpcWatchNeedsGraduation:(id)a3;
@end

@implementation NRPairingProxy

+ (id)machServiceName
{
  return @"com.apple.nano.nanoregistry.paireddeviceregistry";
}

+ (id)clientRemoteObjectInterface
{
  if (qword_1EB30BAA0 != -1) {
    dispatch_once(&qword_1EB30BAA0, &__block_literal_global_176);
  }
  v2 = (void *)qword_1EB30BA98;

  return v2;
}

+ (id)clientExportedInterface
{
  if (qword_1EB30BA90 != -1) {
    dispatch_once(&qword_1EB30BA90, &__block_literal_global_174);
  }
  v2 = (void *)qword_1EB30BA88;

  return v2;
}

uint64_t __41__NRPairingProxy_clientExportedInterface__block_invoke()
{
  qword_1EB30BA88 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF6DA4A0];

  return MEMORY[0x1F41817F8]();
}

void __45__NRPairingProxy_clientRemoteObjectInterface__block_invoke()
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF6D8428];
  v1 = (void *)qword_1EB30BA98;
  qword_1EB30BA98 = v0;

  v2 = (void *)qword_1EB30BA98;
  v3 = +[NRMutableDeviceProperty enclosedClassTypes];
  [v2 setClasses:v3 forSelector:sel_xpcRetrieveSecureProperties_block_ argumentIndex:0 ofReply:1];

  v4 = (void *)qword_1EB30BA98;
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  v7 = [v5 setWithArray:v6];
  [v4 setClasses:v7 forSelector:sel_xpcClientInfo_ argumentIndex:0 ofReply:1];

  v8 = (void *)qword_1EB30BA98;
  v9 = +[NRSecureDevicePropertyStore enclosedClassTypes];
  [v8 setClasses:v9 forSelector:sel_xpcGetDiffSinceTokenValue_getSecureProperties_withBlock_ argumentIndex:1 ofReply:1];
}

void __56__NRPairingProxy_xpcRetriggerUnpairInfoDialogWithBlock___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) connection];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__NRPairingProxy_xpcRetriggerUnpairInfoDialogWithBlock___block_invoke_3;
  v3[3] = &unk_1E5B00208;
  id v4 = *(id *)(a1 + 40);
  [v2 runCompletionBlock:v3];
}

uint64_t __56__NRPairingProxy_xpcRetriggerUnpairInfoDialogWithBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56__NRPairingProxy_xpcRetriggerUnpairInfoDialogWithBlock___block_invoke(uint64_t a1)
{
  v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__NRPairingProxy_xpcRetriggerUnpairInfoDialogWithBlock___block_invoke_2;
  v4[3] = &unk_1E5B008A8;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 xpcRetriggerUnpairInfoDialogWithBlock:v4];
}

- (void)xpcRetriggerUnpairInfoDialogWithBlock:(id)a3
{
  id v5 = a3;
  [(NRRegistryProxy *)self logCaller:a2 args:0];
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    v6 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__NRPairingProxy_xpcRetriggerUnpairInfoDialogWithBlock___block_invoke;
    block[3] = &unk_1E5B008A8;
    block[4] = self;
    id v14 = v5;
    id v7 = v5;
    dispatch_async(v6, block);

    v8 = v14;
  }
  else
  {
    v9 = [(NRXPCProxy *)self connection];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__NRPairingProxy_xpcRetriggerUnpairInfoDialogWithBlock___block_invoke_4;
    v11[3] = &unk_1E5B00208;
    id v12 = v5;
    id v10 = v5;
    [v9 runCompletionBlock:v11];

    v8 = v12;
  }
}

- (id)pairingQueue
{
  if (a1)
  {
    v1 = [a1 target];
    v2 = [v1 pairingQueue];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)pairingServicesDelegate
{
  if (a1)
  {
    a1 = [a1 target];
    uint64_t v1 = vars8;
  }
  return a1;
}

+ (id)serverExportedInterface
{
  if (qword_1EB30BA70 != -1) {
    dispatch_once(&qword_1EB30BA70, &__block_literal_global_1);
  }
  v2 = (void *)_MergedGlobals_7;

  return v2;
}

void __41__NRPairingProxy_serverExportedInterface__block_invoke()
{
  v20[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF6D8428];
  uint64_t v1 = (void *)_MergedGlobals_7;
  _MergedGlobals_7 = v0;

  v2 = (void *)_MergedGlobals_7;
  v3 = +[NRSecureDevicePropertyStore enclosedClassTypes];
  [v2 setClasses:v3 forSelector:sel_xpcRetrieveSecureProperties_block_ argumentIndex:0 ofReply:0];

  id v4 = (void *)_MergedGlobals_7;
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  v20[2] = objc_opt_class();
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  id v7 = [v5 setWithArray:v6];
  [v4 setClasses:v7 forSelector:sel_xpcUnpairWithDeviceID_withOptions_operationHasBegun_ argumentIndex:1 ofReply:0];

  v8 = (void *)_MergedGlobals_7;
  v9 = (void *)MEMORY[0x1E4F1CAD0];
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  v19[2] = objc_opt_class();
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  v11 = [v9 setWithArray:v10];
  [v8 setClasses:v11 forSelector:sel_xpcCompanionOOBDiscoverAndPairWithName_withOutOfBandPairingKey_withOptions_operationHasBegun_ argumentIndex:2 ofReply:0];

  id v12 = (void *)_MergedGlobals_7;
  v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:3];
  v15 = objc_msgSend(v13, "setWithArray:", v14, v16, v17);
  [v12 setClasses:v15 forSelector:sel_xpcCompanionPasscodePairWithDeviceID_withOptions_operationHasBegun_ argumentIndex:1 ofReply:0];
}

+ (id)serverRemoteObjectInterface
{
  if (qword_1EB30BA80 != -1) {
    dispatch_once(&qword_1EB30BA80, &__block_literal_global_166);
  }
  v2 = (void *)qword_1EB30BA78;

  return v2;
}

uint64_t __45__NRPairingProxy_serverRemoteObjectInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF6DA4A0];
  uint64_t v1 = qword_1EB30BA78;
  qword_1EB30BA78 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)xpcCompanionOOBDiscoverAndPairWithName:(id)a3 withOutOfBandPairingKey:(id)a4 withOptions:(id)a5 operationHasBegun:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v14 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __111__NRPairingProxy_xpcCompanionOOBDiscoverAndPairWithName_withOutOfBandPairingKey_withOptions_operationHasBegun___block_invoke;
    block[3] = &unk_1E5B007E0;
    block[4] = self;
    id v22 = v10;
    id v23 = v11;
    id v24 = v12;
    id v25 = v13;
    id v15 = v13;
    dispatch_async(v14, block);

    uint64_t v16 = v22;
  }
  else
  {
    uint64_t v17 = [(NRXPCProxy *)self connection];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __111__NRPairingProxy_xpcCompanionOOBDiscoverAndPairWithName_withOutOfBandPairingKey_withOptions_operationHasBegun___block_invoke_4;
    void v19[3] = &unk_1E5B00208;
    id v20 = v13;
    id v18 = v13;
    [v17 runCompletionBlock:v19];

    uint64_t v16 = v20;
  }
}

void __111__NRPairingProxy_xpcCompanionOOBDiscoverAndPairWithName_withOutOfBandPairingKey_withOptions_operationHasBegun___block_invoke(uint64_t a1)
{
  v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  [v2 proxyWillBeginPairing:*(void *)(a1 + 32)];

  v3 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __111__NRPairingProxy_xpcCompanionOOBDiscoverAndPairWithName_withOutOfBandPairingKey_withOptions_operationHasBegun___block_invoke_2;
  v7[3] = &unk_1E5B000A8;
  v7[4] = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  [v3 xpcCompanionOOBDiscoverAndPairWithName:v4 withOutOfBandPairingKey:v5 withOptions:v6 operationHasBegun:v7];
}

void __111__NRPairingProxy_xpcCompanionOOBDiscoverAndPairWithName_withOutOfBandPairingKey_withOptions_operationHasBegun___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __111__NRPairingProxy_xpcCompanionOOBDiscoverAndPairWithName_withOutOfBandPairingKey_withOptions_operationHasBegun___block_invoke_3;
  v7[3] = &unk_1E5B00058;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 runCompletionBlock:v7];
}

uint64_t __111__NRPairingProxy_xpcCompanionOOBDiscoverAndPairWithName_withOutOfBandPairingKey_withOptions_operationHasBegun___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __111__NRPairingProxy_xpcCompanionOOBDiscoverAndPairWithName_withOutOfBandPairingKey_withOptions_operationHasBegun___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0x14uLL);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)xpcCompanionPasscodePairWithDeviceID:(id)a3 withOptions:(id)a4 operationHasBegun:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v11 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__NRPairingProxy_xpcCompanionPasscodePairWithDeviceID_withOptions_operationHasBegun___block_invoke;
    block[3] = &unk_1E5B00808;
    block[4] = self;
    id v19 = v8;
    id v20 = v9;
    id v21 = v10;
    id v12 = v10;
    dispatch_async(v11, block);

    id v13 = v19;
  }
  else
  {
    id v14 = [(NRXPCProxy *)self connection];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __85__NRPairingProxy_xpcCompanionPasscodePairWithDeviceID_withOptions_operationHasBegun___block_invoke_4;
    v16[3] = &unk_1E5B00208;
    id v17 = v10;
    id v15 = v10;
    [v14 runCompletionBlock:v16];

    id v13 = v17;
  }
}

void __85__NRPairingProxy_xpcCompanionPasscodePairWithDeviceID_withOptions_operationHasBegun___block_invoke(uint64_t a1)
{
  id v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  [v2 proxyWillBeginPairing:*(void *)(a1 + 32)];

  id v3 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__NRPairingProxy_xpcCompanionPasscodePairWithDeviceID_withOptions_operationHasBegun___block_invoke_2;
  v6[3] = &unk_1E5B000A8;
  v6[4] = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 56);
  [v3 xpcCompanionPasscodePairWithDeviceID:v4 withOptions:v5 operationHasBegun:v6];
}

void __85__NRPairingProxy_xpcCompanionPasscodePairWithDeviceID_withOptions_operationHasBegun___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__NRPairingProxy_xpcCompanionPasscodePairWithDeviceID_withOptions_operationHasBegun___block_invoke_3;
  v7[3] = &unk_1E5B00058;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 runCompletionBlock:v7];
}

uint64_t __85__NRPairingProxy_xpcCompanionPasscodePairWithDeviceID_withOptions_operationHasBegun___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __85__NRPairingProxy_xpcCompanionPasscodePairWithDeviceID_withOptions_operationHasBegun___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0x14uLL);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)xpcGizmoOOBAdvertiseAndPairWithName:(id)a3 operationHasBegun:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v8 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__NRPairingProxy_xpcGizmoOOBAdvertiseAndPairWithName_operationHasBegun___block_invoke;
    block[3] = &unk_1E5B00830;
    block[4] = self;
    id v16 = v6;
    id v17 = v7;
    id v9 = v7;
    dispatch_async(v8, block);

    id v10 = v16;
  }
  else
  {
    id v11 = [(NRXPCProxy *)self connection];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __72__NRPairingProxy_xpcGizmoOOBAdvertiseAndPairWithName_operationHasBegun___block_invoke_4;
    v13[3] = &unk_1E5B00208;
    id v14 = v7;
    id v12 = v7;
    [v11 runCompletionBlock:v13];

    id v10 = v14;
  }
}

void __72__NRPairingProxy_xpcGizmoOOBAdvertiseAndPairWithName_operationHasBegun___block_invoke(uint64_t a1)
{
  id v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  [v2 proxyWillBeginPairing:*(void *)(a1 + 32)];

  id v3 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__NRPairingProxy_xpcGizmoOOBAdvertiseAndPairWithName_operationHasBegun___block_invoke_2;
  v5[3] = &unk_1E5B000A8;
  uint64_t v4 = *(void *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 48);
  [v3 xpcGizmoOOBAdvertiseAndPairWithName:v4 operationHasBegun:v5];
}

void __72__NRPairingProxy_xpcGizmoOOBAdvertiseAndPairWithName_operationHasBegun___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__NRPairingProxy_xpcGizmoOOBAdvertiseAndPairWithName_operationHasBegun___block_invoke_3;
  v7[3] = &unk_1E5B00058;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 runCompletionBlock:v7];
}

uint64_t __72__NRPairingProxy_xpcGizmoOOBAdvertiseAndPairWithName_operationHasBegun___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __72__NRPairingProxy_xpcGizmoOOBAdvertiseAndPairWithName_operationHasBegun___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0x14uLL);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)xpcGizmoPasscodeAdvertiseAndPairWithName:(id)a3 operationHasBegun:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v8 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__NRPairingProxy_xpcGizmoPasscodeAdvertiseAndPairWithName_operationHasBegun___block_invoke;
    block[3] = &unk_1E5B00830;
    block[4] = self;
    id v16 = v6;
    id v17 = v7;
    id v9 = v7;
    dispatch_async(v8, block);

    id v10 = v16;
  }
  else
  {
    id v11 = [(NRXPCProxy *)self connection];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __77__NRPairingProxy_xpcGizmoPasscodeAdvertiseAndPairWithName_operationHasBegun___block_invoke_4;
    v13[3] = &unk_1E5B00208;
    id v14 = v7;
    id v12 = v7;
    [v11 runCompletionBlock:v13];

    id v10 = v14;
  }
}

void __77__NRPairingProxy_xpcGizmoPasscodeAdvertiseAndPairWithName_operationHasBegun___block_invoke(uint64_t a1)
{
  id v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  [v2 proxyWillBeginPairing:*(void *)(a1 + 32)];

  id v3 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__NRPairingProxy_xpcGizmoPasscodeAdvertiseAndPairWithName_operationHasBegun___block_invoke_2;
  v5[3] = &unk_1E5B000A8;
  uint64_t v4 = *(void *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 48);
  [v3 xpcGizmoPasscodeAdvertiseAndPairWithName:v4 operationHasBegun:v5];
}

void __77__NRPairingProxy_xpcGizmoPasscodeAdvertiseAndPairWithName_operationHasBegun___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__NRPairingProxy_xpcGizmoPasscodeAdvertiseAndPairWithName_operationHasBegun___block_invoke_3;
  v7[3] = &unk_1E5B00058;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 runCompletionBlock:v7];
}

uint64_t __77__NRPairingProxy_xpcGizmoPasscodeAdvertiseAndPairWithName_operationHasBegun___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __77__NRPairingProxy_xpcGizmoPasscodeAdvertiseAndPairWithName_operationHasBegun___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0x14uLL);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)xpcPairingClientSetAltAccountName:(id)a3 altDSID:(id)a4 forPairingID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v14 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__NRPairingProxy_xpcPairingClientSetAltAccountName_altDSID_forPairingID_completion___block_invoke;
    block[3] = &unk_1E5B007E0;
    block[4] = self;
    id v22 = v10;
    id v23 = v11;
    id v24 = v12;
    id v25 = v13;
    id v15 = v13;
    dispatch_async(v14, block);

    id v16 = v22;
  }
  else
  {
    id v17 = [(NRXPCProxy *)self connection];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __84__NRPairingProxy_xpcPairingClientSetAltAccountName_altDSID_forPairingID_completion___block_invoke_4;
    void v19[3] = &unk_1E5B00208;
    id v20 = v13;
    id v18 = v13;
    [v17 runCompletionBlock:v19];

    id v16 = v20;
  }
}

void __84__NRPairingProxy_xpcPairingClientSetAltAccountName_altDSID_forPairingID_completion___block_invoke(uint64_t a1)
{
  id v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __84__NRPairingProxy_xpcPairingClientSetAltAccountName_altDSID_forPairingID_completion___block_invoke_2;
  v6[3] = &unk_1E5B000A8;
  v6[4] = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  [v2 xpcPairingClientSetAltAccountName:v3 altDSID:v4 forPairingID:v5 completion:v6];
}

void __84__NRPairingProxy_xpcPairingClientSetAltAccountName_altDSID_forPairingID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__NRPairingProxy_xpcPairingClientSetAltAccountName_altDSID_forPairingID_completion___block_invoke_3;
  v7[3] = &unk_1E5B00058;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 runCompletionBlock:v7];
}

uint64_t __84__NRPairingProxy_xpcPairingClientSetAltAccountName_altDSID_forPairingID_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __84__NRPairingProxy_xpcPairingClientSetAltAccountName_altDSID_forPairingID_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0x14uLL);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)xpcPairingClientSetPairingParentName:(id)a3 pairingParentAltDSID:(id)a4 forPairingID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v14 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __100__NRPairingProxy_xpcPairingClientSetPairingParentName_pairingParentAltDSID_forPairingID_completion___block_invoke;
    block[3] = &unk_1E5B007E0;
    block[4] = self;
    id v22 = v10;
    id v23 = v11;
    id v24 = v12;
    id v25 = v13;
    id v15 = v13;
    dispatch_async(v14, block);

    id v16 = v22;
  }
  else
  {
    id v17 = [(NRXPCProxy *)self connection];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __100__NRPairingProxy_xpcPairingClientSetPairingParentName_pairingParentAltDSID_forPairingID_completion___block_invoke_4;
    void v19[3] = &unk_1E5B00208;
    id v20 = v13;
    id v18 = v13;
    [v17 runCompletionBlock:v19];

    id v16 = v20;
  }
}

void __100__NRPairingProxy_xpcPairingClientSetPairingParentName_pairingParentAltDSID_forPairingID_completion___block_invoke(uint64_t a1)
{
  id v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __100__NRPairingProxy_xpcPairingClientSetPairingParentName_pairingParentAltDSID_forPairingID_completion___block_invoke_2;
  v6[3] = &unk_1E5B000A8;
  v6[4] = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  [v2 xpcPairingClientSetPairingParentName:v3 pairingParentAltDSID:v4 forPairingID:v5 completion:v6];
}

void __100__NRPairingProxy_xpcPairingClientSetPairingParentName_pairingParentAltDSID_forPairingID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __100__NRPairingProxy_xpcPairingClientSetPairingParentName_pairingParentAltDSID_forPairingID_completion___block_invoke_3;
  v7[3] = &unk_1E5B00058;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 runCompletionBlock:v7];
}

uint64_t __100__NRPairingProxy_xpcPairingClientSetPairingParentName_pairingParentAltDSID_forPairingID_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __100__NRPairingProxy_xpcPairingClientSetPairingParentName_pairingParentAltDSID_forPairingID_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0x14uLL);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)xpcWatchNeedsGraduation:(id)a3
{
  id v4 = a3;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v5 = -[NRPairingProxy pairingQueue](self);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __42__NRPairingProxy_xpcWatchNeedsGraduation___block_invoke;
    v6[3] = &unk_1E5B008A8;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

void __42__NRPairingProxy_xpcWatchNeedsGraduation___block_invoke(uint64_t a1)
{
  id v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__NRPairingProxy_xpcWatchNeedsGraduation___block_invoke_2;
  v4[3] = &unk_1E5B00880;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 xpcWatchNeedsGraduation:v4];
}

void __42__NRPairingProxy_xpcWatchNeedsGraduation___block_invoke_2(uint64_t a1, char a2)
{
  id v4 = [*(id *)(a1 + 32) connection];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__NRPairingProxy_xpcWatchNeedsGraduation___block_invoke_3;
  v5[3] = &unk_1E5B00858;
  id v6 = *(id *)(a1 + 40);
  char v7 = a2;
  [v4 runCompletionBlock:v5];
}

uint64_t __42__NRPairingProxy_xpcWatchNeedsGraduation___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)xpcClearWatchNeedsGraduation:(id)a3
{
  id v4 = a3;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v5 = -[NRPairingProxy pairingQueue](self);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __47__NRPairingProxy_xpcClearWatchNeedsGraduation___block_invoke;
    v6[3] = &unk_1E5B008A8;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

void __47__NRPairingProxy_xpcClearWatchNeedsGraduation___block_invoke(uint64_t a1)
{
  id v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__NRPairingProxy_xpcClearWatchNeedsGraduation___block_invoke_2;
  v4[3] = &unk_1E5B000A8;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 xpcClearWatchNeedsGraduation:v4];
}

void __47__NRPairingProxy_xpcClearWatchNeedsGraduation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__NRPairingProxy_xpcClearWatchNeedsGraduation___block_invoke_3;
  v7[3] = &unk_1E5B00058;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 runCompletionBlock:v7];
}

uint64_t __47__NRPairingProxy_xpcClearWatchNeedsGraduation___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)xpcSetWatchNeedsGraduation:(id)a3
{
  id v4 = a3;
  id v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

  if (v6)
  {
    id v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A356E000, v7, OS_LOG_TYPE_ERROR, "xpcSetWatchNeedsGraduation - framework", buf, 2u);
    }
  }
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v8 = -[NRPairingProxy pairingQueue](self);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __45__NRPairingProxy_xpcSetWatchNeedsGraduation___block_invoke;
    v9[3] = &unk_1E5B008A8;
    v9[4] = self;
    id v10 = v4;
    dispatch_async(v8, v9);
  }
}

void __45__NRPairingProxy_xpcSetWatchNeedsGraduation___block_invoke(uint64_t a1)
{
  id v2 = nr_daemon_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    id v4 = nr_daemon_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A356E000, v4, OS_LOG_TYPE_ERROR, "dispatch xpcSetWatchNeedsGraduation - framework", buf, 2u);
    }
  }
  id v5 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__NRPairingProxy_xpcSetWatchNeedsGraduation___block_invoke_186;
  v7[3] = &unk_1E5B000A8;
  BOOL v6 = *(void **)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v6;
  [v5 xpcSetWatchNeedsGraduation:v7];
}

void __45__NRPairingProxy_xpcSetWatchNeedsGraduation___block_invoke_186(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__NRPairingProxy_xpcSetWatchNeedsGraduation___block_invoke_2;
  v7[3] = &unk_1E5B00058;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 runCompletionBlock:v7];
}

uint64_t __45__NRPairingProxy_xpcSetWatchNeedsGraduation___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)xpcWatchBuddyCompletedSetupSteps:(id)a3
{
  id v4 = a3;
  id v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

  if (v6)
  {
    id v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A356E000, v7, OS_LOG_TYPE_ERROR, "xpcWatchBuddyCompletedSetupSteps - framework", buf, 2u);
    }
  }
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v8 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__NRPairingProxy_xpcWatchBuddyCompletedSetupSteps___block_invoke;
    block[3] = &unk_1E5B008A8;
    block[4] = self;
    id v16 = v4;
    id v9 = v4;
    dispatch_async(v8, block);

    id v10 = v16;
  }
  else
  {
    id v11 = [(NRXPCProxy *)self connection];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __51__NRPairingProxy_xpcWatchBuddyCompletedSetupSteps___block_invoke_3;
    v13[3] = &unk_1E5B00208;
    id v14 = v4;
    id v12 = v4;
    [v11 runCompletionBlock:v13];

    id v10 = v14;
  }
}

void __51__NRPairingProxy_xpcWatchBuddyCompletedSetupSteps___block_invoke(uint64_t a1)
{
  id v2 = nr_daemon_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    id v4 = nr_daemon_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A356E000, v4, OS_LOG_TYPE_ERROR, "dispatch xpcWatchBuddyCompletedSetupSteps - framework", buf, 2u);
    }
  }
  id v5 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__NRPairingProxy_xpcWatchBuddyCompletedSetupSteps___block_invoke_187;
  v7[3] = &unk_1E5B000A8;
  BOOL v6 = *(void **)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v6;
  [v5 xpcWatchBuddyCompletedSetupSteps:v7];
}

void __51__NRPairingProxy_xpcWatchBuddyCompletedSetupSteps___block_invoke_187(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__NRPairingProxy_xpcWatchBuddyCompletedSetupSteps___block_invoke_2;
  v7[3] = &unk_1E5B00058;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 runCompletionBlock:v7];
}

uint64_t __51__NRPairingProxy_xpcWatchBuddyCompletedSetupSteps___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __51__NRPairingProxy_xpcWatchBuddyCompletedSetupSteps___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    nrGetPairingError(0x14uLL);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

- (void)xpcBeginMigrationWithDeviceID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v8 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__NRPairingProxy_xpcBeginMigrationWithDeviceID_completion___block_invoke;
    block[3] = &unk_1E5B00830;
    block[4] = self;
    id v16 = v6;
    id v17 = v7;
    id v9 = v7;
    dispatch_async(v8, block);

    id v10 = v16;
  }
  else
  {
    id v11 = [(NRXPCProxy *)self connection];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __59__NRPairingProxy_xpcBeginMigrationWithDeviceID_completion___block_invoke_4;
    v13[3] = &unk_1E5B00208;
    id v14 = v7;
    id v12 = v7;
    [v11 runCompletionBlock:v13];

    id v10 = v14;
  }
}

void __59__NRPairingProxy_xpcBeginMigrationWithDeviceID_completion___block_invoke(uint64_t a1)
{
  id v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__NRPairingProxy_xpcBeginMigrationWithDeviceID_completion___block_invoke_2;
  v4[3] = &unk_1E5B000A8;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  [v2 xpcBeginMigrationWithDeviceID:v3 completion:v4];
}

void __59__NRPairingProxy_xpcBeginMigrationWithDeviceID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__NRPairingProxy_xpcBeginMigrationWithDeviceID_completion___block_invoke_3;
  v7[3] = &unk_1E5B00058;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 runCompletionBlock:v7];
}

uint64_t __59__NRPairingProxy_xpcBeginMigrationWithDeviceID_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __59__NRPairingProxy_xpcBeginMigrationWithDeviceID_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0x14uLL);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)xpcBeginMigrationWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v5 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__NRPairingProxy_xpcBeginMigrationWithCompletion___block_invoke;
    block[3] = &unk_1E5B008A8;
    block[4] = self;
    id v13 = v4;
    id v6 = v4;
    dispatch_async(v5, block);

    id v7 = v13;
  }
  else
  {
    id v8 = [(NRXPCProxy *)self connection];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__NRPairingProxy_xpcBeginMigrationWithCompletion___block_invoke_4;
    void v10[3] = &unk_1E5B00208;
    id v11 = v4;
    id v9 = v4;
    [v8 runCompletionBlock:v10];

    id v7 = v11;
  }
}

void __50__NRPairingProxy_xpcBeginMigrationWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__NRPairingProxy_xpcBeginMigrationWithCompletion___block_invoke_2;
  v4[3] = &unk_1E5B000A8;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 xpcBeginMigrationWithCompletion:v4];
}

void __50__NRPairingProxy_xpcBeginMigrationWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__NRPairingProxy_xpcBeginMigrationWithCompletion___block_invoke_3;
  v7[3] = &unk_1E5B00058;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 runCompletionBlock:v7];
}

uint64_t __50__NRPairingProxy_xpcBeginMigrationWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __50__NRPairingProxy_xpcBeginMigrationWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0x14uLL);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)xpcAbortPairingReason:(id)a3 withBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [NSString stringWithFormat:@"reason=%@", v7];
  [(NRRegistryProxy *)self logCaller:a2 args:v9];

  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v10 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__NRPairingProxy_xpcAbortPairingReason_withBlock___block_invoke;
    block[3] = &unk_1E5B00830;
    id v11 = (id *)v18;
    v18[0] = v7;
    v18[1] = self;
    id v19 = v8;
    id v12 = v8;
    dispatch_async(v10, block);
  }
  else
  {
    id v13 = [(NRXPCProxy *)self connection];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __50__NRPairingProxy_xpcAbortPairingReason_withBlock___block_invoke_2;
    v15[3] = &unk_1E5B00208;
    id v11 = &v16;
    id v16 = v8;
    id v14 = v8;
    [v13 runCompletionBlock:v15];
  }
}

void __50__NRPairingProxy_xpcAbortPairingReason_withBlock___block_invoke(id *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!CFPreferencesGetAppBooleanValue(@"ignoreSharingdRequestsToAbortPairing", @"com.apple.NanoRegistry", 0)|| ![a1[4] hasPrefix:@"com.apple.sharingd."])
  {
    id v7 = -[NRPairingProxy pairingServicesDelegate](a1[5]);
    [v7 proxyWillAbortPairing:a1[5]];

    id v4 = -[NRPairingProxy pairingServicesDelegate](a1[5]);
    [v4 xpcAbortPairingReason:a1[4] withBlock:a1[6]];
LABEL_7:

    goto LABEL_8;
  }
  id v2 = nr_daemon_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = nr_daemon_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [a1[5] appPath];
      id v6 = a1[4];
      *(_DWORD *)buf = 138543618;
      id v12 = v5;
      __int16 v13 = 2114;
      id v14 = v6;
      _os_log_impl(&dword_1A356E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ called abort pairing with reason %{public}@; Ignoring since flag is set to ignore sharingd failures",
        buf,
        0x16u);
    }
    goto LABEL_7;
  }
LABEL_8:
  id v8 = [a1[5] connection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__NRPairingProxy_xpcAbortPairingReason_withBlock___block_invoke_200;
  v9[3] = &unk_1E5B00208;
  id v10 = a1[6];
  [v8 runCompletionBlock:v9];
}

uint64_t __50__NRPairingProxy_xpcAbortPairingReason_withBlock___block_invoke_200(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __50__NRPairingProxy_xpcAbortPairingReason_withBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)xpcUnpairWithDeviceID:(id)a3 withOptions:(id)a4 operationHasBegun:(id)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = (__CFString *)a5;
  id v12 = NSString;
  __int16 v13 = [v9 UUIDString];
  id v14 = [v12 stringWithFormat:@"deviceID=%@ options=%@", v13, v10];
  [(NRRegistryProxy *)self logCaller:a2 args:v14];

  if (![(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v16 = [(NRXPCProxy *)self connection];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __70__NRPairingProxy_xpcUnpairWithDeviceID_withOptions_operationHasBegun___block_invoke_3;
    v53[3] = &unk_1E5B00208;
    v54 = v11;
    id v17 = v11;
    [v16 runCompletionBlock:v53];

    id v18 = v54;
    goto LABEL_42;
  }
  v52 = v11;
  v51 = self;
  if ([v10 count])
  {
    uint64_t v15 = [v10 objectForKeyedSubscript:@"obliterate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unsigned int v50 = [v15 BOOLValue];
    }
    else {
      unsigned int v50 = 1;
    }
    id v23 = [v10 objectForKeyedSubscript:@"brick"];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v23 BOOLValue])
    {
      if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.unpairwithbrick"])
      {
        unsigned int v49 = 1;
        goto LABEL_17;
      }
      id v24 = nr_daemon_log();
      BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);

      if (v25)
      {
        v26 = nr_daemon_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v47 = [(NRXPCProxy *)self appPath];
          *(_DWORD *)buf = 138543874;
          v58 = v47;
          __int16 v59 = 2112;
          v60 = @"com.apple.nano.nanoregistry.unpairwithbrick";
          __int16 v61 = 2112;
          v62 = @"brick";
          _os_log_error_impl(&dword_1A356E000, v26, OS_LOG_TYPE_ERROR, "%{public}@ needs entitlement %@ to enable %@", buf, 0x20u);
        }
      }
    }
    unsigned int v49 = 0;
LABEL_17:
    v27 = [v10 objectForKeyedSubscript:@"store"];

    v28 = nr_daemon_log();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);

    if (v29)
    {
      v30 = nr_daemon_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v46 = [(NRXPCProxy *)self appPath];
        *(_DWORD *)buf = 138543618;
        v58 = v46;
        __int16 v59 = 2112;
        v60 = v27;
        _os_log_error_impl(&dword_1A356E000, v30, OS_LOG_TYPE_ERROR, "%{public}@ valueID=%@", buf, 0x16u);
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v20 = [(__CFString *)v27 BOOLValue];
    }
    else {
      uint64_t v20 = 0;
    }
    v31 = [v10 objectForKeyedSubscript:@"BDE85C67-0FDD-4A95-A9B9-3CB5DD0C06A2"];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v31 BOOLValue])
    {
      if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nanoregistry.BDE85C67-0FDD-4A95-A9B9-3CB5DD0C06A2"])
      {
        BOOL v19 = 1;
LABEL_33:
        v34 = [v10 objectForKeyedSubscript:@"unpairAbortErrorReason"];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v17 = v34;
        }
        else {
          id v17 = 0;
        }
        uint64_t v21 = v49;

        uint64_t v22 = v50;
        goto LABEL_37;
      }
      v32 = nr_daemon_log();
      BOOL v19 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);

      if (!v19) {
        goto LABEL_33;
      }
      v33 = nr_daemon_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v48 = [(NRXPCProxy *)self appPath];
        *(_DWORD *)buf = 138543874;
        v58 = v48;
        __int16 v59 = 2112;
        v60 = @"com.apple.nanoregistry.BDE85C67-0FDD-4A95-A9B9-3CB5DD0C06A2";
        __int16 v61 = 2112;
        v62 = @"BDE85C67-0FDD-4A95-A9B9-3CB5DD0C06A2";
        _os_log_error_impl(&dword_1A356E000, v33, OS_LOG_TYPE_ERROR, "%{public}@ needs entitlement %@ to enable %@", buf, 0x20u);
      }
    }
    BOOL v19 = 0;
    goto LABEL_33;
  }
  id v17 = 0;
  BOOL v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 1;
LABEL_37:
  id v35 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v36 = [NSNumber numberWithBool:v21];
  v37 = [NSNumber numberWithBool:v22];
  v38 = [NSNumber numberWithBool:v20];
  v39 = [NSNumber numberWithBool:v19];
  id v18 = (__CFString *)objc_msgSend(v35, "initWithObjectsAndKeys:", v36, @"brick", v37, @"obliterate", v38, @"store", v39, @"BDE85C67-0FDD-4A95-A9B9-3CB5DD0C06A2", 0);

  [(__CFString *)v18 setObject:v17 forKeyedSubscript:@"unpairAbortErrorReason"];
  v40 = nr_daemon_log();
  LODWORD(v38) = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);

  if (v38)
  {
    v41 = nr_daemon_log();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v45 = [(NRXPCProxy *)v51 appPath];
      *(_DWORD *)buf = 138543618;
      v58 = v45;
      __int16 v59 = 2112;
      v60 = v18;
      _os_log_error_impl(&dword_1A356E000, v41, OS_LOG_TYPE_ERROR, "%{public}@ options again=%@", buf, 0x16u);
    }
  }
  v42 = -[NRPairingProxy pairingServicesDelegate](v51);
  [v42 proxyWillBeginUnpairing:v51];

  v43 = -[NRPairingProxy pairingServicesDelegate](v51);
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __70__NRPairingProxy_xpcUnpairWithDeviceID_withOptions_operationHasBegun___block_invoke;
  v55[3] = &unk_1E5B000A8;
  v55[4] = v51;
  v56 = v52;
  v44 = v52;
  [v43 xpcUnpairWithDeviceID:v9 withOptions:v18 operationHasBegun:v55];

LABEL_42:
}

void __70__NRPairingProxy_xpcUnpairWithDeviceID_withOptions_operationHasBegun___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__NRPairingProxy_xpcUnpairWithDeviceID_withOptions_operationHasBegun___block_invoke_2;
  v7[3] = &unk_1E5B00058;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 runCompletionBlock:v7];
}

uint64_t __70__NRPairingProxy_xpcUnpairWithDeviceID_withOptions_operationHasBegun___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __70__NRPairingProxy_xpcUnpairWithDeviceID_withOptions_operationHasBegun___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0x14uLL);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)xpcNotifyActivationCompleted:(id)a3 withSuccess:(BOOL)a4
{
  id v7 = a3;
  id v8 = NSString;
  id v9 = [v7 UUIDString];
  id v10 = [v8 stringWithFormat:@"deviceID=%@", v9];
  [(NRRegistryProxy *)self logCaller:a2 args:v10];

  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v11 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__NRPairingProxy_xpcNotifyActivationCompleted_withSuccess___block_invoke;
    block[3] = &unk_1E5B008D0;
    void block[4] = self;
    id v13 = v7;
    BOOL v14 = a4;
    dispatch_async(v11, block);
  }
}

void __59__NRPairingProxy_xpcNotifyActivationCompleted_withSuccess___block_invoke(uint64_t a1)
{
  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 xpcNotifyActivationCompleted:*(void *)(a1 + 40) withSuccess:*(unsigned __int8 *)(a1 + 48)];
}

- (void)xpcNotifyPasscode:(id)a3 withDeviceID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = NSString;
  id v10 = [v8 UUIDString];
  id v11 = [v9 stringWithFormat:@"deviceID=%@", v10];
  [(NRRegistryProxy *)self logCaller:a2 args:v11];

  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v12 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__NRPairingProxy_xpcNotifyPasscode_withDeviceID___block_invoke;
    block[3] = &unk_1E5B00280;
    void block[4] = self;
    id v14 = v7;
    id v15 = v8;
    dispatch_async(v12, block);
  }
}

void __49__NRPairingProxy_xpcNotifyPasscode_withDeviceID___block_invoke(uint64_t a1)
{
  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 xpcNotifyPasscode:*(void *)(a1 + 40) withDeviceID:*(void *)(a1 + 48)];
}

- (void)xpcPairingShouldContinue
{
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v3 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__NRPairingProxy_xpcPairingShouldContinue__block_invoke;
    block[3] = &unk_1E5B00230;
    void block[4] = self;
    dispatch_async(v3, block);
  }
}

void __42__NRPairingProxy_xpcPairingShouldContinue__block_invoke(uint64_t a1)
{
  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 xpcPairingShouldContinue];
}

- (void)xpcEnterCompatibilityState:(unsigned __int16)a3 withDeviceID:(id)a4
{
  id v6 = a4;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v7 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__NRPairingProxy_xpcEnterCompatibilityState_withDeviceID___block_invoke;
    block[3] = &unk_1E5B008F8;
    void block[4] = self;
    unsigned __int16 v10 = a3;
    id v9 = v6;
    dispatch_async(v7, block);
  }
}

void __58__NRPairingProxy_xpcEnterCompatibilityState_withDeviceID___block_invoke(uint64_t a1)
{
  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 xpcEnterCompatibilityState:*(unsigned __int16 *)(a1 + 48) withDeviceID:*(void *)(a1 + 40)];
}

- (void)xpcSwitchActiveDeviceWithDeviceID:(id)a3 isMagicSwitch:(BOOL)a4 operationHasCompleted:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = NSString;
  id v12 = [v9 UUIDString];
  id v13 = [v11 stringWithFormat:@"deviceID=%@", v12];
  [(NRRegistryProxy *)self logCaller:a2 args:v13];

  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v14 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__NRPairingProxy_xpcSwitchActiveDeviceWithDeviceID_isMagicSwitch_operationHasCompleted___block_invoke;
    block[3] = &unk_1E5B00920;
    void block[4] = self;
    BOOL v24 = a4;
    id v22 = v9;
    id v23 = v10;
    id v15 = v10;
    dispatch_async(v14, block);

    id v16 = v22;
  }
  else
  {
    id v17 = [(NRXPCProxy *)self connection];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __88__NRPairingProxy_xpcSwitchActiveDeviceWithDeviceID_isMagicSwitch_operationHasCompleted___block_invoke_4;
    void v19[3] = &unk_1E5B00208;
    id v20 = v10;
    id v18 = v10;
    [v17 runCompletionBlock:v19];

    id v16 = v20;
  }
}

void __88__NRPairingProxy_xpcSwitchActiveDeviceWithDeviceID_isMagicSwitch_operationHasCompleted___block_invoke(uint64_t a1)
{
  id v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  [v2 proxyWillTakeSwitchAssertion:*(void *)(a1 + 32)];

  id v3 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __88__NRPairingProxy_xpcSwitchActiveDeviceWithDeviceID_isMagicSwitch_operationHasCompleted___block_invoke_2;
  v6[3] = &unk_1E5B000A8;
  uint64_t v5 = *(void *)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 48);
  [v3 xpcSwitchActiveDeviceWithDeviceID:v5 isMagicSwitch:v4 operationHasCompleted:v6];
}

void __88__NRPairingProxy_xpcSwitchActiveDeviceWithDeviceID_isMagicSwitch_operationHasCompleted___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __88__NRPairingProxy_xpcSwitchActiveDeviceWithDeviceID_isMagicSwitch_operationHasCompleted___block_invoke_3;
  v7[3] = &unk_1E5B00058;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 runCompletionBlock:v7];
}

uint64_t __88__NRPairingProxy_xpcSwitchActiveDeviceWithDeviceID_isMagicSwitch_operationHasCompleted___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __88__NRPairingProxy_xpcSwitchActiveDeviceWithDeviceID_isMagicSwitch_operationHasCompleted___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0x14uLL);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)xpcSwitchActiveDeviceWithDeviceID:(id)a3 withAssertionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = NSString;
  id v10 = [v7 UUIDString];
  id v11 = [v9 stringWithFormat:@"deviceID=%@", v10];
  [(NRRegistryProxy *)self logCaller:a2 args:v11];

  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v12 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__NRPairingProxy_xpcSwitchActiveDeviceWithDeviceID_withAssertionHandler___block_invoke;
    block[3] = &unk_1E5B00830;
    void block[4] = self;
    id v20 = v7;
    id v21 = v8;
    id v13 = v8;
    dispatch_async(v12, block);

    id v14 = v20;
  }
  else
  {
    id v15 = [(NRXPCProxy *)self connection];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __73__NRPairingProxy_xpcSwitchActiveDeviceWithDeviceID_withAssertionHandler___block_invoke_4;
    v17[3] = &unk_1E5B00208;
    id v18 = v8;
    id v16 = v8;
    [v15 runCompletionBlock:v17];

    id v14 = v18;
  }
}

void __73__NRPairingProxy_xpcSwitchActiveDeviceWithDeviceID_withAssertionHandler___block_invoke(uint64_t a1)
{
  id v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  [v2 proxyWillTakeSwitchAssertion:*(void *)(a1 + 32)];

  id v3 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__NRPairingProxy_xpcSwitchActiveDeviceWithDeviceID_withAssertionHandler___block_invoke_2;
  v5[3] = &unk_1E5B00970;
  uint64_t v4 = *(void *)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 48);
  [v3 xpcSwitchActiveDeviceWithDeviceID:v4 withAssertionHandler:v5];
}

void __73__NRPairingProxy_xpcSwitchActiveDeviceWithDeviceID_withAssertionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__NRPairingProxy_xpcSwitchActiveDeviceWithDeviceID_withAssertionHandler___block_invoke_3;
  v11[3] = &unk_1E5B00948;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  [v7 runCompletionBlock:v11];
}

uint64_t __73__NRPairingProxy_xpcSwitchActiveDeviceWithDeviceID_withAssertionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __73__NRPairingProxy_xpcSwitchActiveDeviceWithDeviceID_withAssertionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0x14uLL);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

- (void)xpcInvalidateSwitchAssertionWithIdentifier:(id)a3 block:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [NSString stringWithFormat:@"assertionID=%@", v7];
  [(NRRegistryProxy *)self logCaller:a2 args:v9];

  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v10 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__NRPairingProxy_xpcInvalidateSwitchAssertionWithIdentifier_block___block_invoke;
    block[3] = &unk_1E5B00830;
    void block[4] = self;
    id v18 = v7;
    id v19 = v8;
    id v11 = v8;
    dispatch_async(v10, block);

    id v12 = v18;
  }
  else
  {
    id v13 = [(NRXPCProxy *)self connection];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __67__NRPairingProxy_xpcInvalidateSwitchAssertionWithIdentifier_block___block_invoke_4;
    v15[3] = &unk_1E5B00208;
    id v16 = v8;
    id v14 = v8;
    [v13 runCompletionBlock:v15];

    id v12 = v16;
  }
}

void __67__NRPairingProxy_xpcInvalidateSwitchAssertionWithIdentifier_block___block_invoke(uint64_t a1)
{
  id v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  [v2 proxyWillInvalidateSwitchAssertion:*(void *)(a1 + 32)];

  id v3 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__NRPairingProxy_xpcInvalidateSwitchAssertionWithIdentifier_block___block_invoke_2;
  v5[3] = &unk_1E5B000A8;
  uint64_t v4 = *(void *)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 48);
  [v3 xpcInvalidateSwitchAssertionWithIdentifier:v4 block:v5];
}

void __67__NRPairingProxy_xpcInvalidateSwitchAssertionWithIdentifier_block___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__NRPairingProxy_xpcInvalidateSwitchAssertionWithIdentifier_block___block_invoke_3;
  v7[3] = &unk_1E5B00058;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 runCompletionBlock:v7];
}

uint64_t __67__NRPairingProxy_xpcInvalidateSwitchAssertionWithIdentifier_block___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __67__NRPairingProxy_xpcInvalidateSwitchAssertionWithIdentifier_block___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(0x14uLL);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)xpcBeginDiscoveryWithBlock:(id)a3
{
  id v5 = a3;
  [(NRRegistryProxy *)self logCaller:a2 args:0];
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v6 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__NRPairingProxy_xpcBeginDiscoveryWithBlock___block_invoke;
    block[3] = &unk_1E5B008A8;
    void block[4] = self;
    id v14 = v5;
    id v7 = v5;
    dispatch_async(v6, block);

    id v8 = v14;
  }
  else
  {
    id v9 = [(NRXPCProxy *)self connection];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __45__NRPairingProxy_xpcBeginDiscoveryWithBlock___block_invoke_4;
    v11[3] = &unk_1E5B00208;
    id v12 = v5;
    id v10 = v5;
    [v9 runCompletionBlock:v11];

    id v8 = v12;
  }
}

void __45__NRPairingProxy_xpcBeginDiscoveryWithBlock___block_invoke(uint64_t a1)
{
  id v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  [v2 proxyWillBeginDiscovering:*(void *)(a1 + 32)];

  id v3 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__NRPairingProxy_xpcBeginDiscoveryWithBlock___block_invoke_2;
  v5[3] = &unk_1E5B008A8;
  uint64_t v4 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 xpcBeginDiscoveryWithBlock:v5];
}

void __45__NRPairingProxy_xpcBeginDiscoveryWithBlock___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__NRPairingProxy_xpcBeginDiscoveryWithBlock___block_invoke_3;
  v3[3] = &unk_1E5B00208;
  id v4 = *(id *)(a1 + 40);
  [v2 runCompletionBlock:v3];
}

uint64_t __45__NRPairingProxy_xpcBeginDiscoveryWithBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __45__NRPairingProxy_xpcBeginDiscoveryWithBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)xpcEndDiscoveryWithBlock:(id)a3
{
  id v4 = a3;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v5 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__NRPairingProxy_xpcEndDiscoveryWithBlock___block_invoke;
    block[3] = &unk_1E5B008A8;
    void block[4] = self;
    id v13 = v4;
    id v6 = v4;
    dispatch_async(v5, block);

    id v7 = v13;
  }
  else
  {
    id v8 = [(NRXPCProxy *)self connection];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __43__NRPairingProxy_xpcEndDiscoveryWithBlock___block_invoke_4;
    void v10[3] = &unk_1E5B00208;
    id v11 = v4;
    id v9 = v4;
    [v8 runCompletionBlock:v10];

    id v7 = v11;
  }
}

void __43__NRPairingProxy_xpcEndDiscoveryWithBlock___block_invoke(uint64_t a1)
{
  id v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  [v2 proxyWillEndDiscovering:*(void *)(a1 + 32)];

  id v3 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__NRPairingProxy_xpcEndDiscoveryWithBlock___block_invoke_2;
  v5[3] = &unk_1E5B008A8;
  id v4 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 xpcEndDiscoveryWithBlock:v5];
}

void __43__NRPairingProxy_xpcEndDiscoveryWithBlock___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__NRPairingProxy_xpcEndDiscoveryWithBlock___block_invoke_3;
  v3[3] = &unk_1E5B00208;
  id v4 = *(id *)(a1 + 40);
  [v2 runCompletionBlock:v3];
}

uint64_t __43__NRPairingProxy_xpcEndDiscoveryWithBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __43__NRPairingProxy_xpcEndDiscoveryWithBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)xpcTriggerVersion4Workaround
{
  id v3 = -[NRPairingProxy pairingQueue](self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__NRPairingProxy_xpcTriggerVersion4Workaround__block_invoke;
  block[3] = &unk_1E5B00230;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __46__NRPairingProxy_xpcTriggerVersion4Workaround__block_invoke(uint64_t a1)
{
  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 xpcTriggerVersion4Workaround];
}

- (void)xpcSubmitAlbertPairingReport:(id)a3
{
  id v4 = a3;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.internal"])
  {
    id v5 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__NRPairingProxy_xpcSubmitAlbertPairingReport___block_invoke;
    block[3] = &unk_1E5B008A8;
    void block[4] = self;
    id v13 = v4;
    id v6 = v4;
    dispatch_async(v5, block);

    id v7 = v13;
  }
  else
  {
    id v8 = [(NRXPCProxy *)self connection];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __47__NRPairingProxy_xpcSubmitAlbertPairingReport___block_invoke_4;
    void v10[3] = &unk_1E5B00208;
    id v11 = v4;
    id v9 = v4;
    [v8 runCompletionBlock:v10];

    id v7 = v11;
  }
}

void __47__NRPairingProxy_xpcSubmitAlbertPairingReport___block_invoke(uint64_t a1)
{
  id v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__NRPairingProxy_xpcSubmitAlbertPairingReport___block_invoke_2;
  v4[3] = &unk_1E5B008A8;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 xpcSubmitAlbertPairingReport:v4];
}

void __47__NRPairingProxy_xpcSubmitAlbertPairingReport___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__NRPairingProxy_xpcSubmitAlbertPairingReport___block_invoke_3;
  v3[3] = &unk_1E5B00208;
  id v4 = *(id *)(a1 + 40);
  [v2 runCompletionBlock:v3];
}

uint64_t __47__NRPairingProxy_xpcSubmitAlbertPairingReport___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __47__NRPairingProxy_xpcSubmitAlbertPairingReport___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)xpcSubmitRTCPairingMetricForMetricID:(id)a3 withSuccess:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.submitrtcpairingmetric"])
  {
    id v8 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__NRPairingProxy_xpcSubmitRTCPairingMetricForMetricID_withSuccess___block_invoke;
    block[3] = &unk_1E5B00830;
    void block[4] = self;
    id v16 = v6;
    id v17 = v7;
    id v9 = v7;
    dispatch_async(v8, block);

    id v10 = v16;
  }
  else
  {
    id v11 = [(NRXPCProxy *)self connection];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __67__NRPairingProxy_xpcSubmitRTCPairingMetricForMetricID_withSuccess___block_invoke_4;
    v13[3] = &unk_1E5B00208;
    id v14 = v7;
    id v12 = v7;
    [v11 runCompletionBlock:v13];

    id v10 = v14;
  }
}

void __67__NRPairingProxy_xpcSubmitRTCPairingMetricForMetricID_withSuccess___block_invoke(uint64_t a1)
{
  id v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__NRPairingProxy_xpcSubmitRTCPairingMetricForMetricID_withSuccess___block_invoke_2;
  v4[3] = &unk_1E5B000D0;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  [v2 xpcSubmitRTCPairingMetricForMetricID:v3 withSuccess:v4];
}

void __67__NRPairingProxy_xpcSubmitRTCPairingMetricForMetricID_withSuccess___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) connection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__NRPairingProxy_xpcSubmitRTCPairingMetricForMetricID_withSuccess___block_invoke_3;
  v9[3] = &unk_1E5B00998;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  [v6 runCompletionBlock:v9];
}

uint64_t __67__NRPairingProxy_xpcSubmitRTCPairingMetricForMetricID_withSuccess___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __67__NRPairingProxy_xpcSubmitRTCPairingMetricForMetricID_withSuccess___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)xpcPairingClientDidEnterPhase:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v8 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__NRPairingProxy_xpcPairingClientDidEnterPhase_withBlock___block_invoke;
    block[3] = &unk_1E5B00830;
    void block[4] = self;
    id v16 = v6;
    id v17 = v7;
    id v9 = v7;
    dispatch_async(v8, block);

    id v10 = v16;
  }
  else
  {
    id v11 = [(NRXPCProxy *)self connection];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __58__NRPairingProxy_xpcPairingClientDidEnterPhase_withBlock___block_invoke_4;
    v13[3] = &unk_1E5B00208;
    id v14 = v7;
    id v12 = v7;
    [v11 runCompletionBlock:v13];

    id v10 = v14;
  }
}

void __58__NRPairingProxy_xpcPairingClientDidEnterPhase_withBlock___block_invoke(uint64_t a1)
{
  id v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__NRPairingProxy_xpcPairingClientDidEnterPhase_withBlock___block_invoke_2;
  v4[3] = &unk_1E5B008A8;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  [v2 xpcPairingClientDidEnterPhase:v3 withBlock:v4];
}

void __58__NRPairingProxy_xpcPairingClientDidEnterPhase_withBlock___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__NRPairingProxy_xpcPairingClientDidEnterPhase_withBlock___block_invoke_3;
  v3[3] = &unk_1E5B00208;
  id v4 = *(id *)(a1 + 40);
  [v2 runCompletionBlock:v3];
}

uint64_t __58__NRPairingProxy_xpcPairingClientDidEnterPhase_withBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58__NRPairingProxy_xpcPairingClientDidEnterPhase_withBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)xpcSuspendPairingClientCrashMonitoring:(id)a3
{
  id v5 = a3;
  [(NRRegistryProxy *)self logCaller:a2 args:0];
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v6 = -[NRPairingProxy pairingServicesDelegate](self);
    char v7 = [v6 setPairingClientCrashMonitoringCache:1 proxy:self];

    if (v7)
    {
      id v8 = [(NRXPCProxy *)self connection];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __57__NRPairingProxy_xpcSuspendPairingClientCrashMonitoring___block_invoke_4;
      v14[3] = &unk_1E5B00208;
      id v15 = v5;
      [v8 runCompletionBlock:v14];

      id v9 = v15;
    }
    else
    {
      id v11 = -[NRPairingProxy pairingQueue](self);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __57__NRPairingProxy_xpcSuspendPairingClientCrashMonitoring___block_invoke;
      block[3] = &unk_1E5B008A8;
      void block[4] = self;
      id v17 = v5;
      dispatch_async(v11, block);

      id v9 = v17;
    }
  }
  else
  {
    id v10 = [(NRXPCProxy *)self connection];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __57__NRPairingProxy_xpcSuspendPairingClientCrashMonitoring___block_invoke_5;
    v12[3] = &unk_1E5B00208;
    id v13 = v5;
    [v10 runCompletionBlock:v12];

    id v9 = v13;
  }
}

void __57__NRPairingProxy_xpcSuspendPairingClientCrashMonitoring___block_invoke(uint64_t a1)
{
  id v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  [v2 proxyRequestsSuspensionOfCrashMonitoring:*(void *)(a1 + 32)];

  uint64_t v3 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__NRPairingProxy_xpcSuspendPairingClientCrashMonitoring___block_invoke_2;
  v5[3] = &unk_1E5B008A8;
  id v4 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 xpcSuspendPairingClientCrashMonitoring:v5];
}

void __57__NRPairingProxy_xpcSuspendPairingClientCrashMonitoring___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__NRPairingProxy_xpcSuspendPairingClientCrashMonitoring___block_invoke_3;
  v3[3] = &unk_1E5B00208;
  id v4 = *(id *)(a1 + 40);
  [v2 runCompletionBlock:v3];
}

uint64_t __57__NRPairingProxy_xpcSuspendPairingClientCrashMonitoring___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __57__NRPairingProxy_xpcSuspendPairingClientCrashMonitoring___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __57__NRPairingProxy_xpcSuspendPairingClientCrashMonitoring___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)xpcResumePairingClientCrashMonitoring:(id)a3
{
  id v5 = a3;
  [(NRRegistryProxy *)self logCaller:a2 args:0];
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v6 = -[NRPairingProxy pairingServicesDelegate](self);
    char v7 = [v6 setPairingClientCrashMonitoringCache:0 proxy:self];

    if (v7)
    {
      id v8 = [(NRXPCProxy *)self connection];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __56__NRPairingProxy_xpcResumePairingClientCrashMonitoring___block_invoke_4;
      v14[3] = &unk_1E5B00208;
      id v15 = v5;
      [v8 runCompletionBlock:v14];

      id v9 = v15;
    }
    else
    {
      id v11 = -[NRPairingProxy pairingQueue](self);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __56__NRPairingProxy_xpcResumePairingClientCrashMonitoring___block_invoke;
      block[3] = &unk_1E5B008A8;
      void block[4] = self;
      id v17 = v5;
      dispatch_async(v11, block);

      id v9 = v17;
    }
  }
  else
  {
    id v10 = [(NRXPCProxy *)self connection];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56__NRPairingProxy_xpcResumePairingClientCrashMonitoring___block_invoke_5;
    v12[3] = &unk_1E5B00208;
    id v13 = v5;
    [v10 runCompletionBlock:v12];

    id v9 = v13;
  }
}

void __56__NRPairingProxy_xpcResumePairingClientCrashMonitoring___block_invoke(uint64_t a1)
{
  id v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  [v2 proxyRequestsResumptionOfCrashMonitoring:*(void *)(a1 + 32)];

  uint64_t v3 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__NRPairingProxy_xpcResumePairingClientCrashMonitoring___block_invoke_2;
  v5[3] = &unk_1E5B008A8;
  id v4 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 xpcResumePairingClientCrashMonitoring:v5];
}

void __56__NRPairingProxy_xpcResumePairingClientCrashMonitoring___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__NRPairingProxy_xpcResumePairingClientCrashMonitoring___block_invoke_3;
  v3[3] = &unk_1E5B00208;
  id v4 = *(id *)(a1 + 40);
  [v2 runCompletionBlock:v3];
}

uint64_t __56__NRPairingProxy_xpcResumePairingClientCrashMonitoring___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __56__NRPairingProxy_xpcResumePairingClientCrashMonitoring___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __56__NRPairingProxy_xpcResumePairingClientCrashMonitoring___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __56__NRPairingProxy_xpcRetriggerUnpairInfoDialogWithBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)xpcActiveDeviceAssertions:(id)a3
{
  id v4 = a3;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v5 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__NRPairingProxy_xpcActiveDeviceAssertions___block_invoke;
    block[3] = &unk_1E5B008A8;
    void block[4] = self;
    id v13 = v4;
    id v6 = v4;
    dispatch_async(v5, block);

    char v7 = v13;
  }
  else
  {
    id v8 = [(NRXPCProxy *)self connection];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __44__NRPairingProxy_xpcActiveDeviceAssertions___block_invoke_4;
    void v10[3] = &unk_1E5B00208;
    id v11 = v4;
    id v9 = v4;
    [v8 runCompletionBlock:v10];

    char v7 = v11;
  }
}

void __44__NRPairingProxy_xpcActiveDeviceAssertions___block_invoke(uint64_t a1)
{
  id v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__NRPairingProxy_xpcActiveDeviceAssertions___block_invoke_2;
  v4[3] = &unk_1E5B009C0;
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 xpcActiveDeviceAssertions:v4];
}

void __44__NRPairingProxy_xpcActiveDeviceAssertions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__NRPairingProxy_xpcActiveDeviceAssertions___block_invoke_3;
  v7[3] = &unk_1E5B00058;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 runCompletionBlock:v7];
}

uint64_t __44__NRPairingProxy_xpcActiveDeviceAssertions___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __44__NRPairingProxy_xpcActiveDeviceAssertions___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)xpcPairWithSimulator:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v8 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__NRPairingProxy_xpcPairWithSimulator_withCompletion___block_invoke;
    block[3] = &unk_1E5B00830;
    void block[4] = self;
    id v16 = v6;
    id v17 = v7;
    id v9 = v7;
    dispatch_async(v8, block);

    id v10 = v16;
  }
  else
  {
    id v11 = [(NRXPCProxy *)self connection];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __54__NRPairingProxy_xpcPairWithSimulator_withCompletion___block_invoke_4;
    v13[3] = &unk_1E5B00208;
    id v14 = v7;
    id v12 = v7;
    [v11 runCompletionBlock:v13];

    id v10 = v14;
  }
}

void __54__NRPairingProxy_xpcPairWithSimulator_withCompletion___block_invoke(uint64_t a1)
{
  id v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__NRPairingProxy_xpcPairWithSimulator_withCompletion___block_invoke_2;
  v4[3] = &unk_1E5B000A8;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  [v2 xpcPairWithSimulator:v3 withCompletion:v4];
}

void __54__NRPairingProxy_xpcPairWithSimulator_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__NRPairingProxy_xpcPairWithSimulator_withCompletion___block_invoke_3;
  v7[3] = &unk_1E5B00058;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 runCompletionBlock:v7];
}

uint64_t __54__NRPairingProxy_xpcPairWithSimulator_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __54__NRPairingProxy_xpcPairWithSimulator_withCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(5uLL);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)xpcUnpairWithSimulator:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v8 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__NRPairingProxy_xpcUnpairWithSimulator_withCompletion___block_invoke;
    block[3] = &unk_1E5B00830;
    void block[4] = self;
    id v16 = v6;
    id v17 = v7;
    id v9 = v7;
    dispatch_async(v8, block);

    id v10 = v16;
  }
  else
  {
    id v11 = [(NRXPCProxy *)self connection];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56__NRPairingProxy_xpcUnpairWithSimulator_withCompletion___block_invoke_4;
    v13[3] = &unk_1E5B00208;
    id v14 = v7;
    id v12 = v7;
    [v11 runCompletionBlock:v13];

    id v10 = v14;
  }
}

void __56__NRPairingProxy_xpcUnpairWithSimulator_withCompletion___block_invoke(uint64_t a1)
{
  id v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__NRPairingProxy_xpcUnpairWithSimulator_withCompletion___block_invoke_2;
  v4[3] = &unk_1E5B000A8;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  [v2 xpcUnpairWithSimulator:v3 withCompletion:v4];
}

void __56__NRPairingProxy_xpcUnpairWithSimulator_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__NRPairingProxy_xpcUnpairWithSimulator_withCompletion___block_invoke_3;
  v7[3] = &unk_1E5B00058;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 runCompletionBlock:v7];
}

uint64_t __56__NRPairingProxy_xpcUnpairWithSimulator_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __56__NRPairingProxy_xpcUnpairWithSimulator_withCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(5uLL);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)xpcSwitchToSimulator:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v8 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__NRPairingProxy_xpcSwitchToSimulator_withCompletion___block_invoke;
    block[3] = &unk_1E5B00830;
    void block[4] = self;
    id v16 = v6;
    id v17 = v7;
    id v9 = v7;
    dispatch_async(v8, block);

    id v10 = v16;
  }
  else
  {
    id v11 = [(NRXPCProxy *)self connection];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __54__NRPairingProxy_xpcSwitchToSimulator_withCompletion___block_invoke_4;
    v13[3] = &unk_1E5B00208;
    id v14 = v7;
    id v12 = v7;
    [v11 runCompletionBlock:v13];

    id v10 = v14;
  }
}

void __54__NRPairingProxy_xpcSwitchToSimulator_withCompletion___block_invoke(uint64_t a1)
{
  id v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__NRPairingProxy_xpcSwitchToSimulator_withCompletion___block_invoke_2;
  v4[3] = &unk_1E5B000A8;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  [v2 xpcSwitchToSimulator:v3 withCompletion:v4];
}

void __54__NRPairingProxy_xpcSwitchToSimulator_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__NRPairingProxy_xpcSwitchToSimulator_withCompletion___block_invoke_3;
  v7[3] = &unk_1E5B00058;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 runCompletionBlock:v7];
}

uint64_t __54__NRPairingProxy_xpcSwitchToSimulator_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __54__NRPairingProxy_xpcSwitchToSimulator_withCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  nrGetPairingError(5uLL);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)xpcPutMigrationChallengeCharacteristicWriteData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.ids.plugin"])
  {
    id v8 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__NRPairingProxy_xpcPutMigrationChallengeCharacteristicWriteData_completion___block_invoke;
    block[3] = &unk_1E5B00830;
    void block[4] = self;
    id v16 = v6;
    id v17 = v7;
    id v9 = v7;
    dispatch_async(v8, block);

    id v10 = v16;
  }
  else
  {
    id v11 = [(NRXPCProxy *)self connection];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __77__NRPairingProxy_xpcPutMigrationChallengeCharacteristicWriteData_completion___block_invoke_4;
    v13[3] = &unk_1E5B00208;
    id v14 = v7;
    id v12 = v7;
    [v11 runCompletionBlock:v13];

    id v10 = v14;
  }
}

void __77__NRPairingProxy_xpcPutMigrationChallengeCharacteristicWriteData_completion___block_invoke(uint64_t a1)
{
  id v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __77__NRPairingProxy_xpcPutMigrationChallengeCharacteristicWriteData_completion___block_invoke_2;
  v4[3] = &unk_1E5B00880;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  [v2 xpcPutMigrationChallengeCharacteristicWriteData:v3 completion:v4];
}

void __77__NRPairingProxy_xpcPutMigrationChallengeCharacteristicWriteData_completion___block_invoke_2(uint64_t a1, char a2)
{
  id v4 = [*(id *)(a1 + 32) connection];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__NRPairingProxy_xpcPutMigrationChallengeCharacteristicWriteData_completion___block_invoke_3;
  v5[3] = &unk_1E5B00858;
  id v6 = *(id *)(a1 + 40);
  char v7 = a2;
  [v4 runCompletionBlock:v5];
}

uint64_t __77__NRPairingProxy_xpcPutMigrationChallengeCharacteristicWriteData_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __77__NRPairingProxy_xpcPutMigrationChallengeCharacteristicWriteData_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)xpcGetMigrationPairingCharacteristicReadDataWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.ids.plugin"])
  {
    id v5 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__NRPairingProxy_xpcGetMigrationPairingCharacteristicReadDataWithCompletion___block_invoke;
    block[3] = &unk_1E5B008A8;
    void block[4] = self;
    id v13 = v4;
    id v6 = v4;
    dispatch_async(v5, block);

    char v7 = v13;
  }
  else
  {
    id v8 = [(NRXPCProxy *)self connection];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __77__NRPairingProxy_xpcGetMigrationPairingCharacteristicReadDataWithCompletion___block_invoke_4;
    void v10[3] = &unk_1E5B00208;
    id v11 = v4;
    id v9 = v4;
    [v8 runCompletionBlock:v10];

    char v7 = v11;
  }
}

void __77__NRPairingProxy_xpcGetMigrationPairingCharacteristicReadDataWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __77__NRPairingProxy_xpcGetMigrationPairingCharacteristicReadDataWithCompletion___block_invoke_2;
  v4[3] = &unk_1E5B009E8;
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 xpcGetMigrationPairingCharacteristicReadDataWithCompletion:v4];
}

void __77__NRPairingProxy_xpcGetMigrationPairingCharacteristicReadDataWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__NRPairingProxy_xpcGetMigrationPairingCharacteristicReadDataWithCompletion___block_invoke_3;
  v7[3] = &unk_1E5B00058;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 runCompletionBlock:v7];
}

uint64_t __77__NRPairingProxy_xpcGetMigrationPairingCharacteristicReadDataWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __77__NRPairingProxy_xpcGetMigrationPairingCharacteristicReadDataWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)xpcBeginMigrationWithDeviceID:(id)a3 passcode:(id)a4 withBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v11 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__NRPairingProxy_xpcBeginMigrationWithDeviceID_passcode_withBlock___block_invoke;
    block[3] = &unk_1E5B00808;
    void block[4] = self;
    id v19 = v8;
    id v20 = v9;
    id v21 = v10;
    id v12 = v10;
    dispatch_async(v11, block);

    id v13 = v19;
  }
  else
  {
    id v14 = [(NRXPCProxy *)self connection];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __67__NRPairingProxy_xpcBeginMigrationWithDeviceID_passcode_withBlock___block_invoke_4;
    v16[3] = &unk_1E5B00208;
    id v17 = v10;
    id v15 = v10;
    [v14 runCompletionBlock:v16];

    id v13 = v17;
  }
}

void __67__NRPairingProxy_xpcBeginMigrationWithDeviceID_passcode_withBlock___block_invoke(uint64_t a1)
{
  id v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__NRPairingProxy_xpcBeginMigrationWithDeviceID_passcode_withBlock___block_invoke_2;
  v5[3] = &unk_1E5B008A8;
  void v5[4] = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 56);
  [v2 xpcBeginMigrationWithDeviceID:v3 passcode:v4 withBlock:v5];
}

void __67__NRPairingProxy_xpcBeginMigrationWithDeviceID_passcode_withBlock___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__NRPairingProxy_xpcBeginMigrationWithDeviceID_passcode_withBlock___block_invoke_3;
  v3[3] = &unk_1E5B00208;
  id v4 = *(id *)(a1 + 40);
  [v2 runCompletionBlock:v3];
}

uint64_t __67__NRPairingProxy_xpcBeginMigrationWithDeviceID_passcode_withBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __67__NRPairingProxy_xpcBeginMigrationWithDeviceID_passcode_withBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)xpcGetLastMigrationRequestPhoneNameWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v5 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__NRPairingProxy_xpcGetLastMigrationRequestPhoneNameWithCompletion___block_invoke;
    block[3] = &unk_1E5B008A8;
    void block[4] = self;
    id v13 = v4;
    id v6 = v4;
    dispatch_async(v5, block);

    char v7 = v13;
  }
  else
  {
    id v8 = [(NRXPCProxy *)self connection];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __68__NRPairingProxy_xpcGetLastMigrationRequestPhoneNameWithCompletion___block_invoke_4;
    void v10[3] = &unk_1E5B00208;
    id v11 = v4;
    id v9 = v4;
    [v8 runCompletionBlock:v10];

    char v7 = v11;
  }
}

void __68__NRPairingProxy_xpcGetLastMigrationRequestPhoneNameWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__NRPairingProxy_xpcGetLastMigrationRequestPhoneNameWithCompletion___block_invoke_2;
  v4[3] = &unk_1E5B00A10;
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 xpcGetLastMigrationRequestPhoneNameWithCompletion:v4];
}

void __68__NRPairingProxy_xpcGetLastMigrationRequestPhoneNameWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__NRPairingProxy_xpcGetLastMigrationRequestPhoneNameWithCompletion___block_invoke_3;
  v7[3] = &unk_1E5B00058;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 runCompletionBlock:v7];
}

uint64_t __68__NRPairingProxy_xpcGetLastMigrationRequestPhoneNameWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __68__NRPairingProxy_xpcGetLastMigrationRequestPhoneNameWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)xpcKeepPhoneUnlockedInternalTestSPI:(id)a3
{
  id v4 = a3;
  id v5 = -[NRPairingProxy pairingQueue](self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__NRPairingProxy_xpcKeepPhoneUnlockedInternalTestSPI___block_invoke;
  v7[3] = &unk_1E5B008A8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __54__NRPairingProxy_xpcKeepPhoneUnlockedInternalTestSPI___block_invoke(uint64_t a1)
{
  if (_NRIsInternalInstall___onceToken != -1) {
    dispatch_once(&_NRIsInternalInstall___onceToken, &__block_literal_global_18);
  }
  if (_NRIsInternalInstall___internalInstall
    && [*(id *)(a1 + 32) loudHasEntitlement:@"com.apple.nanoregistry.unlock.assertion.test.5FB2508F-9F17-42C2-90A4-03E7817791D9"])
  {
    id v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __54__NRPairingProxy_xpcKeepPhoneUnlockedInternalTestSPI___block_invoke_2;
    v5[3] = &unk_1E5B008A8;
    id v3 = *(void **)(a1 + 40);
    void v5[4] = *(void *)(a1 + 32);
    id v6 = v3;
    [v2 xpcKeepPhoneUnlockedInternalTestSPI:v5];
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) connection];
    [v4 runCompletionBlock:*(void *)(a1 + 40)];
  }
}

void __54__NRPairingProxy_xpcKeepPhoneUnlockedInternalTestSPI___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  [v2 runCompletionBlock:*(void *)(a1 + 40)];
}

- (void)xpcPingActiveGizmoWithPriority:(int)a3 withMessageSize:(int64_t)a4 withBlock:(id)a5
{
  id v8 = a5;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v9 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__NRPairingProxy_xpcPingActiveGizmoWithPriority_withMessageSize_withBlock___block_invoke;
    block[3] = &unk_1E5B00A88;
    int v19 = a3;
    id v17 = v8;
    int64_t v18 = a4;
    void block[4] = self;
    id v10 = v8;
    dispatch_async(v9, block);

    id v11 = v17;
  }
  else
  {
    id v12 = [(NRXPCProxy *)self connection];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __75__NRPairingProxy_xpcPingActiveGizmoWithPriority_withMessageSize_withBlock___block_invoke_4;
    v14[3] = &unk_1E5B00208;
    id v15 = v8;
    id v13 = v8;
    [v12 runCompletionBlock:v14];

    id v11 = v15;
  }
}

void __75__NRPairingProxy_xpcPingActiveGizmoWithPriority_withMessageSize_withBlock___block_invoke(uint64_t a1)
{
  id v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  uint64_t v3 = *(unsigned int *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__NRPairingProxy_xpcPingActiveGizmoWithPriority_withMessageSize_withBlock___block_invoke_2;
  v6[3] = &unk_1E5B00A60;
  id v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v4;
  [v2 xpcPingActiveGizmoWithPriority:v3 withMessageSize:v5 withBlock:v6];
}

void __75__NRPairingProxy_xpcPingActiveGizmoWithPriority_withMessageSize_withBlock___block_invoke_2(uint64_t a1, char a2, double a3, double a4)
{
  id v8 = [*(id *)(a1 + 32) connection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__NRPairingProxy_xpcPingActiveGizmoWithPriority_withMessageSize_withBlock___block_invoke_3;
  v9[3] = &unk_1E5B00A38;
  id v10 = *(id *)(a1 + 40);
  char v13 = a2;
  double v11 = a3;
  double v12 = a4;
  [v8 runCompletionBlock:v9];
}

uint64_t __75__NRPairingProxy_xpcPingActiveGizmoWithPriority_withMessageSize_withBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, double, double))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __75__NRPairingProxy_xpcPingActiveGizmoWithPriority_withMessageSize_withBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(double, double))(*(void *)(a1 + 32) + 16))(0.0, 0.0);
}

- (void)xpcScanForMigratableWatchesWithBlock:(id)a3
{
  id v4 = a3;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    uint64_t v5 = -[NRPairingProxy pairingQueue](self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__NRPairingProxy_xpcScanForMigratableWatchesWithBlock___block_invoke;
    v7[3] = &unk_1E5B008A8;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(v5, v7);
  }
  else
  {
    id v6 = [(NRXPCProxy *)self connection];
    [v6 runCompletionBlock:v4];
  }
}

void __55__NRPairingProxy_xpcScanForMigratableWatchesWithBlock___block_invoke(uint64_t a1)
{
  id v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  [v2 proxyWillBeginPushing:*(void *)(a1 + 32)];

  uint64_t v3 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__NRPairingProxy_xpcScanForMigratableWatchesWithBlock___block_invoke_2;
  v5[3] = &unk_1E5B008A8;
  id v4 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 xpcScanForMigratableWatchesWithBlock:v5];
}

void __55__NRPairingProxy_xpcScanForMigratableWatchesWithBlock___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  [v2 runCompletionBlock:*(void *)(a1 + 40)];
}

- (void)xpcStartWatchSetupPushWithBlock:(id)a3
{
  id v4 = a3;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    uint64_t v5 = -[NRPairingProxy pairingQueue](self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __50__NRPairingProxy_xpcStartWatchSetupPushWithBlock___block_invoke;
    v7[3] = &unk_1E5B008A8;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(v5, v7);
  }
  else
  {
    id v6 = [(NRXPCProxy *)self connection];
    [v6 runCompletionBlock:v4];
  }
}

void __50__NRPairingProxy_xpcStartWatchSetupPushWithBlock___block_invoke(uint64_t a1)
{
  id v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  [v2 proxyWillBeginPushing:*(void *)(a1 + 32)];

  uint64_t v3 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__NRPairingProxy_xpcStartWatchSetupPushWithBlock___block_invoke_2;
  v5[3] = &unk_1E5B008A8;
  id v4 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 xpcStartWatchSetupPushWithBlock:v5];
}

void __50__NRPairingProxy_xpcStartWatchSetupPushWithBlock___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  [v2 runCompletionBlock:*(void *)(a1 + 40)];
}

- (void)xpcStopWatchSetupPushWithBlock:(id)a3
{
  id v4 = a3;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    uint64_t v5 = -[NRPairingProxy pairingQueue](self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49__NRPairingProxy_xpcStopWatchSetupPushWithBlock___block_invoke;
    v7[3] = &unk_1E5B008A8;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(v5, v7);
  }
  else
  {
    id v6 = [(NRXPCProxy *)self connection];
    [v6 runCompletionBlock:v4];
  }
}

void __49__NRPairingProxy_xpcStopWatchSetupPushWithBlock___block_invoke(uint64_t a1)
{
  id v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  [v2 proxyWillEndPushing:*(void *)(a1 + 32)];

  uint64_t v3 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__NRPairingProxy_xpcStopWatchSetupPushWithBlock___block_invoke_2;
  v5[3] = &unk_1E5B008A8;
  id v4 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 xpcStopWatchSetupPushWithBlock:v5];
}

void __49__NRPairingProxy_xpcStopWatchSetupPushWithBlock___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  [v2 runCompletionBlock:*(void *)(a1 + 40)];
}

- (void)xpcWaitForWatchPairingExtendedMetadataForAdvertisedName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v8 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__NRPairingProxy_xpcWaitForWatchPairingExtendedMetadataForAdvertisedName_completion___block_invoke;
    block[3] = &unk_1E5B00830;
    void block[4] = self;
    id v16 = v6;
    id v17 = v7;
    id v9 = v7;
    dispatch_async(v8, block);

    id v10 = v16;
  }
  else
  {
    double v11 = [(NRXPCProxy *)self connection];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __85__NRPairingProxy_xpcWaitForWatchPairingExtendedMetadataForAdvertisedName_completion___block_invoke_2;
    v13[3] = &unk_1E5B00208;
    id v14 = v7;
    id v12 = v7;
    [v11 runCompletionBlock:v13];

    id v10 = v14;
  }
}

void __85__NRPairingProxy_xpcWaitForWatchPairingExtendedMetadataForAdvertisedName_completion___block_invoke(uint64_t a1)
{
  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 xpcWaitForWatchPairingExtendedMetadataForAdvertisedName:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __85__NRPairingProxy_xpcWaitForWatchPairingExtendedMetadataForAdvertisedName_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)xpcSubmitServerRequestReportWithRequestType:(id)a3 duration:(double)a4 errorCode:(unsigned int)a5 block:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v12 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__NRPairingProxy_xpcSubmitServerRequestReportWithRequestType_duration_errorCode_block___block_invoke;
    block[3] = &unk_1E5B00AB0;
    void block[4] = self;
    id v15 = v10;
    double v17 = a4;
    unsigned int v18 = a5;
    id v16 = v11;
    dispatch_async(v12, block);
  }
  else
  {
    char v13 = [(NRXPCProxy *)self connection];
    [v13 runCompletionBlock:v11];
  }
}

void __87__NRPairingProxy_xpcSubmitServerRequestReportWithRequestType_duration_errorCode_block___block_invoke(uint64_t a1)
{
  id v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  double v3 = *(double *)(a1 + 56);
  uint64_t v4 = *(unsigned int *)(a1 + 64);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __87__NRPairingProxy_xpcSubmitServerRequestReportWithRequestType_duration_errorCode_block___block_invoke_2;
  v6[3] = &unk_1E5B008A8;
  uint64_t v5 = *(void *)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 48);
  [v2 xpcSubmitServerRequestReportWithRequestType:v5 duration:v4 errorCode:v6 block:v3];
}

void __87__NRPairingProxy_xpcSubmitServerRequestReportWithRequestType_duration_errorCode_block___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  [v2 runCompletionBlock:*(void *)(a1 + 40)];
}

- (void)xpcCheckIfFlaggedForRecoveryWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.internal"])
  {
    uint64_t v5 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__NRPairingProxy_xpcCheckIfFlaggedForRecoveryWithCompletion___block_invoke;
    block[3] = &unk_1E5B008A8;
    void block[4] = self;
    id v13 = v4;
    id v6 = v4;
    dispatch_async(v5, block);

    id v7 = v13;
  }
  else
  {
    id v8 = [(NRXPCProxy *)self connection];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __61__NRPairingProxy_xpcCheckIfFlaggedForRecoveryWithCompletion___block_invoke_4;
    void v10[3] = &unk_1E5B00208;
    id v11 = v4;
    id v9 = v4;
    [v8 runCompletionBlock:v10];

    id v7 = v11;
  }
}

void __61__NRPairingProxy_xpcCheckIfFlaggedForRecoveryWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__NRPairingProxy_xpcCheckIfFlaggedForRecoveryWithCompletion___block_invoke_2;
  v4[3] = &unk_1E5B000D0;
  double v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 xpcCheckIfFlaggedForRecoveryWithCompletion:v4];
}

void __61__NRPairingProxy_xpcCheckIfFlaggedForRecoveryWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) connection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__NRPairingProxy_xpcCheckIfFlaggedForRecoveryWithCompletion___block_invoke_3;
  v9[3] = &unk_1E5B00998;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  [v6 runCompletionBlock:v9];
}

uint64_t __61__NRPairingProxy_xpcCheckIfFlaggedForRecoveryWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __61__NRPairingProxy_xpcCheckIfFlaggedForRecoveryWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)xpcClearRecoveryFlagWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.internal"])
  {
    id v5 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__NRPairingProxy_xpcClearRecoveryFlagWithCompletion___block_invoke;
    block[3] = &unk_1E5B008A8;
    void block[4] = self;
    id v13 = v4;
    id v6 = v4;
    dispatch_async(v5, block);

    id v7 = v13;
  }
  else
  {
    id v8 = [(NRXPCProxy *)self connection];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__NRPairingProxy_xpcClearRecoveryFlagWithCompletion___block_invoke_4;
    void v10[3] = &unk_1E5B00208;
    id v11 = v4;
    id v9 = v4;
    [v8 runCompletionBlock:v10];

    id v7 = v11;
  }
}

void __53__NRPairingProxy_xpcClearRecoveryFlagWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__NRPairingProxy_xpcClearRecoveryFlagWithCompletion___block_invoke_2;
  v4[3] = &unk_1E5B000A8;
  double v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 xpcClearRecoveryFlagWithCompletion:v4];
}

void __53__NRPairingProxy_xpcClearRecoveryFlagWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__NRPairingProxy_xpcClearRecoveryFlagWithCompletion___block_invoke_3;
  v7[3] = &unk_1E5B00058;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 runCompletionBlock:v7];
}

uint64_t __53__NRPairingProxy_xpcClearRecoveryFlagWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __53__NRPairingProxy_xpcClearRecoveryFlagWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)xpcFakePairedSyncIsCompleteWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v5 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__NRPairingProxy_xpcFakePairedSyncIsCompleteWithCompletion___block_invoke;
    block[3] = &unk_1E5B008A8;
    void block[4] = self;
    id v13 = v4;
    id v6 = v4;
    dispatch_async(v5, block);

    id v7 = v13;
  }
  else
  {
    id v8 = [(NRXPCProxy *)self connection];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__NRPairingProxy_xpcFakePairedSyncIsCompleteWithCompletion___block_invoke_4;
    void v10[3] = &unk_1E5B00208;
    id v11 = v4;
    id v9 = v4;
    [v8 runCompletionBlock:v10];

    id v7 = v11;
  }
}

void __60__NRPairingProxy_xpcFakePairedSyncIsCompleteWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__NRPairingProxy_xpcFakePairedSyncIsCompleteWithCompletion___block_invoke_2;
  v4[3] = &unk_1E5B000A8;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 xpcFakePairedSyncIsCompleteWithCompletion:v4];
}

void __60__NRPairingProxy_xpcFakePairedSyncIsCompleteWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__NRPairingProxy_xpcFakePairedSyncIsCompleteWithCompletion___block_invoke_3;
  v7[3] = &unk_1E5B00058;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 runCompletionBlock:v7];
}

uint64_t __60__NRPairingProxy_xpcFakePairedSyncIsCompleteWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __60__NRPairingProxy_xpcFakePairedSyncIsCompleteWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)xpcTriggerTailspinFrom:(unint64_t)a3 forApp:(id)a4
{
  id v6 = -[NRPairingProxy pairingQueue](self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__NRPairingProxy_xpcTriggerTailspinFrom_forApp___block_invoke;
  v7[3] = &unk_1E5B00AD8;
  void v7[4] = self;
  void v7[5] = a3;
  dispatch_async(v6, v7);
}

void __48__NRPairingProxy_xpcTriggerTailspinFrom_forApp___block_invoke(uint64_t a1)
{
  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) appPath];
  id v4 = [v3 lastPathComponent];
  [v5 xpcTriggerTailspinFrom:v2 forApp:v4];
}

- (void)xpcGetLastSwitchIndex:(id)a3
{
  id v7 = (void (**)(id, uint64_t, void))a3;
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  CFPreferencesSynchronize(@"com.apple.pairedsyncd", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  id v4 = (void *)CFPreferencesCopyValue(@"lastSwitchIndex", @"com.apple.pairedsyncd", @"mobile", v3);
  id v5 = v4;
  if (v4) {
    uint64_t v6 = (int)[v4 intValue];
  }
  else {
    uint64_t v6 = 0;
  }
  v7[2](v7, v6, 0);
}

- (void)xpcGetMigrationCountForPairingID:(id)a3 completion:(id)a4
{
  CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  uint64_t v6 = (void (**)(id, uint64_t, void))a4;
  id v7 = a3;
  CFPreferencesSynchronize(@"com.apple.pairedsyncd", @"mobile", v5);
  id v10 = (id)CFPreferencesCopyValue(@"pairingIDMigrationCountDictionary", @"com.apple.pairedsyncd", @"mobile", v5);
  id v8 = [v7 UUIDString];

  id v9 = [v10 objectForKeyedSubscript:v8];

  v6[2](v6, [v9 integerValue], 0);
}

- (void)xpcGetInitialSyncCompletedForPairingID:(id)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (void (**)(id, BOOL, void))a4;
  CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  CFPreferencesSynchronize(@"com.apple.pairedsyncd", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  id v8 = (char *)CFPreferencesCopyValue(@"pairingIDInitialSyncSet", @"com.apple.pairedsyncd", @"mobile", v7);
  id v9 = nr_daemon_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    id v11 = nr_daemon_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      char v12 = [v5 UUIDString];
      int v22 = 136316162;
      id v23 = "-[NRPairingProxy xpcGetInitialSyncCompletedForPairingID:completion:]";
      __int16 v24 = 2114;
      uint64_t v25 = (uint64_t)v12;
      __int16 v26 = 2114;
      v27 = v8;
      __int16 v28 = 2114;
      BOOL v29 = @"com.apple.pairedsyncd";
      __int16 v30 = 2114;
      v31 = @"pairingIDInitialSyncSet";
      _os_log_impl(&dword_1A356E000, v11, OS_LOG_TYPE_DEFAULT, "%s[%{public}@]: retrieved %{public}@ from %{public}@/%{public}@", (uint8_t *)&v22, 0x34u);
    }
  }
  if (v8)
  {
    id v13 = [v5 UUIDString];
    id v14 = [v8 objectForKeyedSubscript:v13];
    BOOL v15 = v14 != 0;
  }
  else
  {
    BOOL v15 = 0;
  }
  id v16 = nr_daemon_log();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

  if (v17)
  {
    unsigned int v18 = nr_daemon_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [v5 UUIDString];
      id v20 = (void *)v19;
      id v21 = "NO";
      id v23 = "-[NRPairingProxy xpcGetInitialSyncCompletedForPairingID:completion:]";
      int v22 = 136315650;
      if (v15) {
        id v21 = "YES";
      }
      __int16 v24 = 2114;
      uint64_t v25 = v19;
      __int16 v26 = 2080;
      v27 = v21;
      _os_log_impl(&dword_1A356E000, v18, OS_LOG_TYPE_DEFAULT, "%s[%{public}@]: returning hasCompleted=%s", (uint8_t *)&v22, 0x20u);
    }
  }
  v6[2](v6, v15, 0);
}

- (void)xpcIsPhoneReadyToMigrateDevice:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v8 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__NRPairingProxy_xpcIsPhoneReadyToMigrateDevice_withCompletion___block_invoke;
    block[3] = &unk_1E5B00830;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

void __64__NRPairingProxy_xpcIsPhoneReadyToMigrateDevice_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__NRPairingProxy_xpcIsPhoneReadyToMigrateDevice_withCompletion___block_invoke_2;
  v4[3] = &unk_1E5B00B28;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  [v2 xpcIsPhoneReadyToMigrateDevice:v3 withCompletion:v4];
}

void __64__NRPairingProxy_xpcIsPhoneReadyToMigrateDevice_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) connection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__NRPairingProxy_xpcIsPhoneReadyToMigrateDevice_withCompletion___block_invoke_3;
  v8[3] = &unk_1E5B00B00;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = a2;
  id v9 = v5;
  id v7 = v5;
  [v6 runCompletionBlock:v8];
}

uint64_t __64__NRPairingProxy_xpcIsPhoneReadyToMigrateDevice_withCompletion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

- (void)xpcIsAssertionActive:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v8 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__NRPairingProxy_xpcIsAssertionActive_withCompletion___block_invoke;
    block[3] = &unk_1E5B00830;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

void __54__NRPairingProxy_xpcIsAssertionActive_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__NRPairingProxy_xpcIsAssertionActive_withCompletion___block_invoke_2;
  v4[3] = &unk_1E5B000D0;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  [v2 xpcIsAssertionActive:v3 withCompletion:v4];
}

void __54__NRPairingProxy_xpcIsAssertionActive_withCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) connection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__NRPairingProxy_xpcIsAssertionActive_withCompletion___block_invoke_3;
  v9[3] = &unk_1E5B00998;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  [v6 runCompletionBlock:v9];
}

uint64_t __54__NRPairingProxy_xpcIsAssertionActive_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)xpcUpdateWatchBuddyStage:(unsigned int)a3 forPairingID:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v7 = -[NRPairingProxy pairingQueue](self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__NRPairingProxy_xpcUpdateWatchBuddyStage_forPairingID___block_invoke;
    block[3] = &unk_1E5B00B50;
    unsigned int v13 = a3;
    void block[4] = self;
    id v12 = v6;
    dispatch_async(v7, block);
  }
  else
  {
    id v8 = nr_daemon_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      id v10 = nr_daemon_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        BOOL v15 = "-[NRPairingProxy xpcUpdateWatchBuddyStage:forPairingID:]";
        _os_log_error_impl(&dword_1A356E000, v10, OS_LOG_TYPE_ERROR, "%s client missing entitlement", buf, 0xCu);
      }
    }
  }
}

void __56__NRPairingProxy_xpcUpdateWatchBuddyStage_forPairingID___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = nr_daemon_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = nr_daemon_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = *(_DWORD *)(a1 + 48);
      int v7 = 136315394;
      id v8 = "-[NRPairingProxy xpcUpdateWatchBuddyStage:forPairingID:]_block_invoke";
      __int16 v9 = 1026;
      int v10 = v5;
      _os_log_impl(&dword_1A356E000, v4, OS_LOG_TYPE_DEFAULT, "%s updating stage: %{public}d", (uint8_t *)&v7, 0x12u);
    }
  }
  id v6 = -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  [v6 xpcUpdateWatchBuddyStage:*(unsigned int *)(a1 + 48) forPairingID:*(void *)(a1 + 40)];
}

@end