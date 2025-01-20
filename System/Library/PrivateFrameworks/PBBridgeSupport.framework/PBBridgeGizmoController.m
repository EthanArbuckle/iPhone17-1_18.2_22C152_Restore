@interface PBBridgeGizmoController
+ (id)prepareOfflineTermsResponse:(id)a3;
+ (id)warrantyFilePathForLanguageCode:(id)a3 countryCode:(id)a4;
- (BOOL)_getActivationData:(BOOL)a3 forRequest:(id)a4 withCompletion:(id)a5;
- (BOOL)_sendRemoteCommandWithMessageID:(unsigned __int16)a3 withArguments:(id)a4;
- (BOOL)_sendResponseToMessage:(id)a3 withResponseMessageID:(unsigned __int16)a4 withArguments:(id)a5;
- (BOOL)canBeginActivation;
- (BOOL)getActivationDataAndHeadersForRequest:(id)a3 withCompletion:(id)a4;
- (BOOL)getActivationDataForRequest:(id)a3 withCompletion:(id)a4;
- (BOOL)getSessionDataForRequest:(id)a3 withCompletion:(id)a4;
- (BOOL)readyToCreatePasscode;
- (BOOL)reportRemoteActivationFailureError:(id)a3;
- (BOOL)sendCompanionPerformanceResults;
- (BOOL)tellCompanionGizmoBeganActivating;
- (BOOL)tellCompanionGizmoFailedActivating:(id)a3;
- (BOOL)tellCompanionGizmoFinishedActivating;
- (BOOL)tellCompanionGizmoFinishedActivatingAsDeKOTA;
- (BOOL)tellCompanionThatLanguageAndLanguageCompletedWithStatus:(unsigned __int16)a3;
- (BOOL)updateLanguageIdentifierWithCompletion:(id)a3;
- (BOOL)updateRegionIdentifierWithCompletion:(id)a3;
- (NSString)internalLastSendMessageID;
- (NSString)languageIdentifer;
- (NSString)regionIdentifer;
- (NSTimer)activationTimeout;
- (PBBridgeConnectionDelegate)delegate;
- (PBBridgeGizmoController)init;
- (id)activationCompletion;
- (id)customDescriptionOfMessageType:(unsigned __int16)a3;
- (id)enableSiriCompletion;
- (id)serviceIdentifier;
- (id)sessionCompletion;
- (id)siriStateCompletion;
- (id)updateLanguageCompletion;
- (id)updateRegionCompletion;
- (unsigned)activationState;
- (void)_recordThatWatchFinishedActivating;
- (void)activationTimeout:(id)a3;
- (void)beganAwaitingAbilityToActivate;
- (void)checkAppInstallationAllowed:(id)a3;
- (void)companionBecameAvailableWantsConfirmation:(id)a3;
- (void)companionDidSendDemoWirelessCredentials:(id)a3;
- (void)companionDidSendLanguageAndLocale:(id)a3;
- (void)companionDidSendTinkerWirelessCredentials:(id)a3;
- (void)companionTermsResponse:(id)a3;
- (void)doInitialSyncPrep:(id)a3;
- (void)enableSiriForGizmoWithCompletion:(id)a3;
- (void)enabledSiri:(id)a3;
- (void)endSetupTransaction;
- (void)fetchTermsAndConditions:(id)a3;
- (void)getSiriStateWithCompletion:(id)a3;
- (void)gotSiriState:(id)a3;
- (void)handleActivationData:(id)a3;
- (void)handleBuysOnWatchIngestion:(id)a3;
- (void)handleOfflineTermsRequest:(id)a3;
- (void)handleRenameDeviceRequest:(id)a3;
- (void)handleSetLauncherViewModeForTinker:(id)a3;
- (void)handleWarrantySentinelRequest:(id)a3;
- (void)ingestTinkerCredentials:(id)a3;
- (void)invalidateTimeoutTimer;
- (void)parseNetworkRecordsAndApplyWirelessCredentialsFromData:(id)a3;
- (void)popToControllerType:(id)a3;
- (void)prepareForForcedWatchSU:(id)a3;
- (void)processReceivedPairingWirelessCredentials:(id)a3;
- (void)provideAppViewListImage:(id)a3;
- (void)pushControllerType:(id)a3;
- (void)refreshTimeoutTimer;
- (void)remoteRequestToKeepAlive:(id)a3;
- (void)retryActivation:(id)a3;
- (void)returnProxiedDeviceForDeviceWithData:(id)a3;
- (void)setActivationCompletion:(id)a3;
- (void)setActivationState:(unsigned __int16)a3;
- (void)setActivationTimeout:(id)a3;
- (void)setCanBeginActivating:(id)a3;
- (void)setCompanionLanguage:(id)a3;
- (void)setCompanionRegion:(id)a3;
- (void)setComputedTimeZone:(id)a3;
- (void)setCrownOrientationRight:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setDiagnosticsEnabled:(id)a3;
- (void)setEnableSiriCompletion:(id)a3;
- (void)setFitnessRouteAuthorizationForTinker:(id)a3;
- (void)setInternalLastSendMessageID:(id)a3;
- (void)setLocationEnabled:(id)a3;
- (void)setPasscodeRestrictions:(id)a3;
- (void)setSessionCompletion:(id)a3;
- (void)setSiriEnabled:(id)a3;
- (void)setSiriStateCompletion:(id)a3;
- (void)setUpdateLanguageCompletion:(id)a3;
- (void)setUpdateRegionCompletion:(id)a3;
- (void)setupDeviceManagement:(id)a3;
- (void)setupServiceMessageSelectorMappings;
- (void)showLockedOnAnimation:(id)a3;
- (void)tellCompanionGizmoFinishedHealthSharingOptInWithSelection:(BOOL)a3;
- (void)tellCompanionThatGizmoFailedToCreatePasscode:(int)a3;
- (void)tellCompanionThatGizmoFinishedChangingPasscode:(BOOL)a3 isLong:(BOOL)a4;
- (void)tellCompanionThatGizmoFinishedSettingPasscode:(BOOL)a3 isLong:(BOOL)a4;
- (void)tellCompanionThatGizmoFinishedUnlockPairing:(BOOL)a3;
- (void)tellCompanionThatGizmoStartedUnlockPairing;
- (void)transportBecameReachable;
- (void)transportBecameUnreachable;
- (void)updateNanoRegistryToNormalState:(id)a3;
- (void)updateSynchProgress:(id)a3;
- (void)waitForDynamicActivationEventPresentation:(id)a3;
- (void)waitForUserResponseToDynamicEventPresentation:(id)a3;
@end

@implementation PBBridgeGizmoController

- (PBBridgeGizmoController)init
{
  v4.receiver = self;
  v4.super_class = (Class)PBBridgeGizmoController;
  v2 = [(PBBridgeGizmoController *)&v4 init];
  if (v2) {
    xpc_set_event_stream_handler("com.apple.notifyd.matching", MEMORY[0x263EF83A0], &__block_literal_global_7);
  }
  return v2;
}

- (void)setupServiceMessageSelectorMappings
{
  v3 = [(PBBridgeIDSServiceDelegate *)self service];
  [v3 setProtobufAction:sel_companionBecameAvailableWantsConfirmation_ forIncomingRequestsOfType:1];

  objc_super v4 = [(PBBridgeIDSServiceDelegate *)self service];
  [v4 setProtobufAction:sel_pushControllerType_ forIncomingRequestsOfType:3];

  v5 = [(PBBridgeIDSServiceDelegate *)self service];
  [v5 setProtobufAction:sel_popToControllerType_ forIncomingRequestsOfType:4];

  v6 = [(PBBridgeIDSServiceDelegate *)self service];
  [v6 setProtobufAction:sel_handleActivationData_ forIncomingRequestsOfType:2];

  v7 = [(PBBridgeIDSServiceDelegate *)self service];
  [v7 setProtobufAction:sel_setCompanionLanguage_ forIncomingRequestsOfType:5];

  v8 = [(PBBridgeIDSServiceDelegate *)self service];
  [v8 setProtobufAction:sel_setCompanionRegion_ forIncomingRequestsOfType:6];

  v9 = [(PBBridgeIDSServiceDelegate *)self service];
  [v9 setProtobufAction:sel_gotSiriState_ forIncomingRequestsOfType:7];

  v10 = [(PBBridgeIDSServiceDelegate *)self service];
  [v10 setProtobufAction:sel_setLocationEnabled_ forIncomingRequestsOfType:8];

  v11 = [(PBBridgeIDSServiceDelegate *)self service];
  [v11 setProtobufAction:sel_setDiagnosticsEnabled_ forIncomingRequestsOfType:10];

  v12 = [(PBBridgeIDSServiceDelegate *)self service];
  [v12 setProtobufAction:sel_setCanBeginActivating_ forIncomingRequestsOfType:11];

  v13 = [(PBBridgeIDSServiceDelegate *)self service];
  [v13 setProtobufAction:sel_waitForDynamicActivationEventPresentation_ forIncomingRequestsOfType:22];

  v14 = [(PBBridgeIDSServiceDelegate *)self service];
  [v14 setProtobufAction:sel_waitForUserResponseToDynamicEventPresentation_ forIncomingRequestsOfType:23];

  v15 = [(PBBridgeIDSServiceDelegate *)self service];
  [v15 setProtobufAction:sel_retryActivation_ forIncomingRequestsOfType:15];

  v16 = [(PBBridgeIDSServiceDelegate *)self service];
  [v16 setProtobufAction:sel_handleWarrantySentinelRequest_ forIncomingRequestsOfType:14];

  v17 = [(PBBridgeIDSServiceDelegate *)self service];
  [v17 setProtobufAction:sel_handleOfflineTermsRequest_ forIncomingRequestsOfType:16];

  v18 = [(PBBridgeIDSServiceDelegate *)self service];
  [v18 setProtobufAction:sel_showLockedOnAnimation_ forIncomingRequestsOfType:17];

  v19 = [(PBBridgeIDSServiceDelegate *)self service];
  [v19 setProtobufAction:sel_setCrownOrientationRight_ forIncomingRequestsOfType:18];

  v20 = [(PBBridgeIDSServiceDelegate *)self service];
  [v20 setProtobufAction:sel_setPasscodeRestrictions_ forIncomingRequestsOfType:20];

  v21 = [(PBBridgeIDSServiceDelegate *)self service];
  [v21 setProtobufAction:sel_updateSynchProgress_ forIncomingRequestsOfType:19];

  v22 = [(PBBridgeIDSServiceDelegate *)self service];
  [v22 setProtobufAction:sel_doInitialSyncPrep_ forIncomingRequestsOfType:21];

  v23 = [(PBBridgeIDSServiceDelegate *)self service];
  [v23 setProtobufAction:sel_remoteRequestToKeepAlive_ forIncomingRequestsOfType:24];

  v24 = [(PBBridgeIDSServiceDelegate *)self service];
  [v24 setProtobufAction:sel_companionDidSendLanguageAndLocale_ forIncomingRequestsOfType:25];

  v25 = [(PBBridgeIDSServiceDelegate *)self service];
  [v25 setProtobufAction:sel_companionDidSendDemoWirelessCredentials_ forIncomingRequestsOfType:26];

  v26 = [(PBBridgeIDSServiceDelegate *)self service];
  [v26 setProtobufAction:sel_prepareForForcedWatchSU_ forIncomingRequestsOfType:27];

  v27 = [(PBBridgeIDSServiceDelegate *)self service];
  [v27 setProtobufAction:sel_fetchTermsAndConditions_ forIncomingRequestsOfType:102];

  v28 = [(PBBridgeIDSServiceDelegate *)self service];
  [v28 setProtobufAction:sel_companionTermsResponse_ forIncomingRequestsOfType:103];

  v29 = [(PBBridgeIDSServiceDelegate *)self service];
  [v29 setProtobufAction:sel_setSiriEnabled_ forIncomingRequestsOfType:28];

  v30 = [(PBBridgeIDSServiceDelegate *)self service];
  [v30 setProtobufAction:sel_returnProxiedDeviceForDeviceWithData_ forIncomingRequestsOfType:29];

  v31 = [(PBBridgeIDSServiceDelegate *)self service];
  [v31 setProtobufAction:sel_setComputedTimeZone_ forIncomingRequestsOfType:111];

  v32 = [(PBBridgeIDSServiceDelegate *)self service];
  [v32 setProtobufAction:sel_ingestTinkerCredentials_ forIncomingRequestsOfType:30];

  v33 = [(PBBridgeIDSServiceDelegate *)self service];
  [v33 setProtobufAction:sel_companionDidSendTinkerWirelessCredentials_ forIncomingRequestsOfType:104];

  v34 = [(PBBridgeIDSServiceDelegate *)self service];
  [v34 setProtobufAction:sel_setMessagesInCloudEnabledForTinker_ forIncomingRequestsOfType:31];

  v35 = [(PBBridgeIDSServiceDelegate *)self service];
  [v35 setProtobufAction:sel_setFitnessRouteAuthorizationForTinker_ forIncomingRequestsOfType:33];

  v36 = [(PBBridgeIDSServiceDelegate *)self service];
  [v36 setProtobufAction:sel_handleRenameDeviceRequest_ forIncomingRequestsOfType:110];

  v37 = [(PBBridgeIDSServiceDelegate *)self service];
  [v37 setProtobufAction:sel_handleBuysOnWatchIngestion_ forIncomingRequestsOfType:32];

  v38 = [(PBBridgeIDSServiceDelegate *)self service];
  [v38 setProtobufAction:sel_handleSetLauncherViewModeForTinker_ forIncomingRequestsOfType:112];

  v39 = [(PBBridgeIDSServiceDelegate *)self service];
  [v39 setProtobufAction:sel_provideAppViewListImage_ forIncomingRequestsOfType:113];

  v40 = [(PBBridgeIDSServiceDelegate *)self service];
  [v40 setProtobufAction:sel_setupDeviceManagement_ forIncomingRequestsOfType:34];

  v41 = [(PBBridgeIDSServiceDelegate *)self service];
  [v41 setProtobufAction:sel_checkAppInstallationAllowed_ forIncomingRequestsOfType:35];

  v42 = [(PBBridgeIDSServiceDelegate *)self service];
  [v42 setProtobufAction:sel_updateNanoRegistryToNormalState_ forIncomingRequestsOfType:36];

  id v43 = [(PBBridgeIDSServiceDelegate *)self service];
  [v43 setProtobufAction:sel_processReceivedPairingWirelessCredentials_ forIncomingRequestsOfType:37];
}

- (void)endSetupTransaction
{
  v10.receiver = self;
  v10.super_class = (Class)PBBridgeGizmoController;
  [(PBBridgeIDSServiceDelegate *)&v10 endSetupTransaction];
  self->_activationState = 0;
  [(NSTimer *)self->_activationTimeout invalidate];
  activationTimeout = self->_activationTimeout;
  self->_activationTimeout = 0;

  id updateLanguageCompletion = self->_updateLanguageCompletion;
  self->_id updateLanguageCompletion = 0;

  id updateRegionCompletion = self->_updateRegionCompletion;
  self->_id updateRegionCompletion = 0;

  id sessionCompletion = self->_sessionCompletion;
  self->_id sessionCompletion = 0;

  id activationCompletion = self->_activationCompletion;
  self->_id activationCompletion = 0;

  id siriStateCompletion = self->_siriStateCompletion;
  self->_id siriStateCompletion = 0;

  id enableSiriCompletion = self->_enableSiriCompletion;
  self->_id enableSiriCompletion = 0;
}

- (void)setActivationState:(unsigned __int16)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (self->_activationState >= a3)
  {
    v5 = pbb_activation_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if ((unsigned __int16)(self->_activationState - 2) > 3u) {
        v6 = @"Idle";
      }
      else {
        v6 = off_264401858[(__int16)(self->_activationState - 2)];
      }
      if ((unsigned __int16)(a3 - 2) > 3u) {
        v7 = @"Idle";
      }
      else {
        v7 = off_264401858[(__int16)(a3 - 2)];
      }
      int v8 = 138412546;
      v9 = v6;
      __int16 v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "Prevented misordered state change (%@ --> %@)", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    self->_activationState = a3;
  }
}

- (id)serviceIdentifier
{
  return @"com.apple.private.alloy.pbbridge";
}

- (BOOL)_sendRemoteCommandWithMessageID:(unsigned __int16)a3 withArguments:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = v6;
  switch((int)v4)
  {
    case 1:
      v9 = objc_alloc_init(PBBProtoBecameActive);
      __int16 v10 = [v7 firstObject];
      -[PBBProtoBecameActive setWantsConfirmation:](v9, "setWantsConfirmation:", [v10 BOOLValue]);
      goto LABEL_34;
    case 2:
      v9 = [v6 firstObject];
      v11 = (void *)[objc_alloc(MEMORY[0x263F08910]) initRequiringSecureCoding:1];
      [v11 encodeObject:v9 forKey:@"PBBridgeActivationRequestKey"];
      [v11 finishEncoding];
      uint64_t v12 = [v11 encodedData];
      v13 = objc_alloc_init(PBBProtoProxyActivationFetch);
      [(PBBProtoProxyActivationFetch *)v13 setRequest:v12];
      int v8 = [(PBBProtoProxyActivationFetch *)v13 data];

      goto LABEL_23;
    case 7:
      v9 = objc_alloc_init(PBBProtoDidEndPasscodeCreation);
      v14 = [v7 firstObject];
      -[PBBProtoBecameActive setSuccess:](v9, "setSuccess:", [v14 BOOLValue]);

      __int16 v10 = [v7 objectAtIndex:1];
      -[PBBProtoBecameActive setIsLong:](v9, "setIsLong:", [v10 BOOLValue]);
      goto LABEL_34;
    case 12:
      v9 = objc_alloc_init(PBBProtoGizmoActivationFailed);
      __int16 v10 = [v7 firstObject];
      [(PBBProtoBecameActive *)v9 setFailureDescription:v10];
      goto LABEL_34;
    case 13:
      v9 = objc_alloc_init(PBBProtoDidMakeAutoLockChoice);
      __int16 v10 = [v7 firstObject];
      -[PBBProtoBecameActive setAccept:](v9, "setAccept:", [v10 BOOLValue]);
      goto LABEL_34;
    case 16:
      v9 = objc_alloc_init(PBBProtoTransferPerformanceResults);
      v11 = [MEMORY[0x263EFF980] array];
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      v15 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
      v16 = [v15 milestones];
      v17 = [v16 allValues];

      uint64_t v18 = [v17 countByEnumeratingWithState:&v48 objects:v58 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v49;
        do
        {
          uint64_t v21 = 0;
          do
          {
            if (*(void *)v49 != v20) {
              objc_enumerationMutation(v17);
            }
            [v11 addObject:*(void *)(*((void *)&v48 + 1) + 8 * v21++)];
          }
          while (v19 != v21);
          uint64_t v19 = [v17 countByEnumeratingWithState:&v48 objects:v58 count:16];
        }
        while (v19);
      }

      uint64_t v12 = [MEMORY[0x263EFF980] array];
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      v22 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
      v23 = [v22 macroActivities];
      v24 = [v23 allValues];

      uint64_t v25 = [v24 countByEnumeratingWithState:&v44 objects:v57 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v45;
        do
        {
          uint64_t v28 = 0;
          do
          {
            if (*(void *)v45 != v27) {
              objc_enumerationMutation(v24);
            }
            [v12 addObject:*(void *)(*((void *)&v44 + 1) + 8 * v28++)];
          }
          while (v26 != v28);
          uint64_t v26 = [v24 countByEnumeratingWithState:&v44 objects:v57 count:16];
        }
        while (v26);
      }

      v29 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
      v30 = [v29 measurements];
      v31 = (void *)[v30 mutableCopy];

      [(PBBProtoBecameActive *)v9 setMilestones:v11];
      [(PBBProtoBecameActive *)v9 setMacroActivites:v12];
      [(PBBProtoBecameActive *)v9 setMeasures:v31];
      int v8 = [(PBBProtoBecameActive *)v9 data];

LABEL_23:
      goto LABEL_37;
    case 17:
      v9 = objc_alloc_init(PBBProtoDidFailToCreatePasscode);
      __int16 v10 = [v7 firstObject];
      -[PBBProtoBecameActive setError:](v9, "setError:", [v10 intValue]);
      goto LABEL_34;
    case 20:
      v9 = objc_alloc_init(PBBProtoTellCompanionLanguageAndLocaleChangeStatus);
      __int16 v10 = [v7 firstObject];
      -[PBBProtoBecameActive setStatus:](v9, "setStatus:", (double)[v10 integerValue]);
      goto LABEL_34;
    case 22:
      v32 = objc_alloc_init(PBBProtoDemoWatchDidIngestWirelessCredentials);
      v9 = (PBBProtoBecameActive *)v32;
      goto LABEL_36;
    case 27:
      if ([v6 count] == 1)
      {
        v9 = objc_alloc_init(PBBProtoRemoteActivationFailureReport);
        __int16 v10 = [v7 firstObject];
        id v52 = 0;
        v33 = [MEMORY[0x263F08910] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v52];
        id v34 = v52;
        if (v34)
        {
          v35 = pbb_activation_log();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
            -[PBBridgeGizmoController _sendRemoteCommandWithMessageID:withArguments:]();
          }
        }
        [(PBBProtoBecameActive *)v9 setActivationError:v33];

LABEL_34:
      }
      else
      {
        v9 = 0;
      }
      v32 = (PBBProtoDemoWatchDidIngestWirelessCredentials *)v9;
LABEL_36:
      int v8 = [(PBBProtoDemoWatchDidIngestWirelessCredentials *)v32 data];
LABEL_37:

LABEL_38:
      v36 = (void *)[objc_alloc(MEMORY[0x263F4A228]) initWithProtobufData:v8 type:v4 isResponse:0];
      v37 = pbb_setupflow_log();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = PBBCMessageDescription(v4);
        *(_DWORD *)buf = 138412546;
        v54 = v38;
        __int16 v55 = 2112;
        v56 = v36;
        _os_log_impl(&dword_21C445000, v37, OS_LOG_TYPE_DEFAULT, "Sending Protobuf (%@ -- %@)", buf, 0x16u);
      }
      v39 = [(PBBridgeIDSServiceDelegate *)self service];
      v40 = [(PBBridgeIDSServiceDelegate *)self sendProtoBuf:v36 service:v39 priority:300 responseIdentifier:0 expectsResponse:0 retryCount:-1 retryInterval:-1.0];

      if (v4 <= 0x15 && ((1 << v4) & 0x20101C) != 0 && PBIsInternalInstall())
      {
        v41 = (NSString *)[v40 copy];
        internalLastSendMessageID = self->_internalLastSendMessageID;
        self->_internalLastSendMessageID = v41;
      }
      return 0;
    case 29:
      v9 = objc_alloc_init(PBBProtoHealthSharingEnabled);
      __int16 v10 = [v7 firstObject];
      -[PBBProtoBecameActive setEnabled:](v9, "setEnabled:", [v10 BOOLValue]);
      goto LABEL_34;
    default:
      int v8 = [MEMORY[0x263EFF8F8] data];
      goto LABEL_38;
  }
}

- (BOOL)_sendResponseToMessage:(id)a3 withResponseMessageID:(unsigned __int16)a4 withArguments:(id)a5
{
  uint64_t v6 = a4;
  uint64_t v130 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  __int16 v10 = 0;
  switch((int)v6)
  {
    case 14:
      v11 = objc_alloc_init(PBBProtoWarrantySentinel);
      uint64_t v12 = [MEMORY[0x263F08850] defaultManager];
      uint64_t v13 = [v12 fileExistsAtPath:@"/var/mobile/Media/iTunes_Control/iTunes/ShowWarranty"];

      [(PBBProtoWarrantySentinel *)v11 setSentinelExists:v13];
      CFStringRef v14 = (const __CFString *)*MEMORY[0x263EFFE48];
      CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x263EFFE48]);
      CFPropertyListRef v15 = CFPreferencesCopyAppValue(@"AppleLanguages", v14);
      if (!v15) {
        goto LABEL_36;
      }
      v16 = (void *)v15;
      CFTypeID v17 = CFGetTypeID(v15);
      if (v17 == CFArrayGetTypeID())
      {
        uint64_t v18 = (void *)[v16 mutableCopy];
      }
      else
      {
        CFRelease(v16);
LABEL_36:
        uint64_t v18 = 0;
      }
      [(PBBProtoWarrantySentinel *)v11 setAppleLanguages:v18];
      CFPreferencesAppSynchronize(v14);
      CFPropertyListRef v43 = CFPreferencesCopyAppValue(@"AppleLocale", v14);
      if (v43)
      {
        long long v44 = v43;
        CFTypeID v45 = CFGetTypeID(v43);
        if (v45 == CFStringGetTypeID()) {
          [(PBBProtoWarrantySentinel *)v11 setAppleLocale:v44];
        }
        CFRelease(v44);
      }
      long long v46 = pbb_setupflow_log();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v123) = v13;
        _os_log_impl(&dword_21C445000, v46, OS_LOG_TYPE_DEFAULT, "Warranty Sentinel exists: (%d)", buf, 8u);
      }

      __int16 v10 = [(PBBProtoWarrantySentinel *)v11 data];

      goto LABEL_31;
    case 15:
      v11 = [(id)objc_opt_class() prepareOfflineTermsResponse:v9];
      uint64_t v20 = pbb_setupflow_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v119 = [(PBBProtoWarrantySentinel *)v11 license];
        uint64_t v21 = [v119 length];
        v22 = [(PBBProtoWarrantySentinel *)v11 multiterms];
        uint64_t v23 = [v22 length];
        v24 = [(PBBProtoWarrantySentinel *)v11 warranty];
        *(_DWORD *)buf = 134218752;
        uint64_t v123 = (uint64_t)v11;
        __int16 v124 = 2048;
        uint64_t v125 = v21;
        __int16 v126 = 2048;
        uint64_t v127 = v23;
        __int16 v128 = 2048;
        uint64_t v129 = [v24 length];
        _os_log_impl(&dword_21C445000, v20, OS_LOG_TYPE_DEFAULT, "Offline Terms response: (%p); license: (%lu bytes); multiterms: (%lu bytes); warranty: (%lu bytes);",
          buf,
          0x2Au);
      }
      goto LABEL_28;
    case 16:
    case 17:
    case 19:
    case 20:
    case 21:
    case 22:
    case 24:
    case 27:
    case 28:
    case 29:
      goto LABEL_32;
    case 18:
      uint64_t v25 = PBBProtoPrepareWatchForInitialSyncResponse;
      goto LABEL_25;
    case 23:
      uint64_t v25 = PBBProtoPrepareWatchForForcedSUResponse;
      goto LABEL_25;
    case 25:
      v11 = objc_alloc_init(PBBProtoRemoteAccountForDevice);
      uint64_t v20 = [v9 objectAtIndexedSubscript:0];
      [(PBBProtoWarrantySentinel *)v11 setSerializedDevice:v20];
      goto LABEL_28;
    case 26:
      v11 = objc_alloc_init(PBBProtoTinkerAccountCredentialsIngested);
      uint64_t v26 = pbb_setupflow_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v123 = (uint64_t)v9;
        _os_log_impl(&dword_21C445000, v26, OS_LOG_TYPE_DEFAULT, "Got message PBBCMessageIDDidIngestAcountCredentialsForTinkerDevice: %@", buf, 0xCu);
      }

      uint64_t v27 = [v9 objectAtIndexedSubscript:0];
      -[PBBProtoWarrantySentinel setSuccess:](v11, "setSuccess:", [v27 BOOLValue]);

      uint64_t v28 = [v9 objectAtIndexedSubscript:1];
      -[PBBProtoWarrantySentinel setCdpStatus:](v11, "setCdpStatus:", [v28 unsignedIntegerValue]);

      v29 = [v9 objectAtIndexedSubscript:2];
      [(PBBProtoWarrantySentinel *)v11 setErrorDescription:v29];

      if ([v9 count] != 4) {
        goto LABEL_29;
      }
      uint64_t v20 = [v9 objectAtIndexedSubscript:3];
      [(PBBProtoWarrantySentinel *)v11 setDetailedError:v20];
      goto LABEL_28;
    case 30:
      v11 = objc_alloc_init(PBBProtoAcknowledgeBuysOnWatchCredentialIngestion);
      v30 = [v9 objectAtIndexedSubscript:0];
      -[PBBProtoWarrantySentinel setSuccess:](v11, "setSuccess:", [v30 BOOLValue]);

      v31 = [v9 objectAtIndexedSubscript:1];
      -[PBBProtoWarrantySentinel setErrorCode:](v11, "setErrorCode:", [v31 integerValue]);

      uint64_t v20 = [v9 objectAtIndexedSubscript:2];
      [(PBBProtoWarrantySentinel *)v11 setErrorDescription:v20];
      goto LABEL_28;
    case 31:
      v11 = objc_alloc_init(PBBProtoDeviceManagementSetupResponse);
      v32 = [v9 objectAtIndexedSubscript:0];
      [(PBBProtoWarrantySentinel *)v11 setSuccess:v32 != 0];

      if ((unint64_t)[v9 count] < 2) {
        goto LABEL_29;
      }
      uint64_t v20 = [v9 objectAtIndexedSubscript:1];
      [(PBBProtoWarrantySentinel *)v11 setError:v20];
      goto LABEL_28;
    case 32:
      v11 = objc_alloc_init(PBBProtoApplicationInstallRestrictionResponse);
      uint64_t v20 = [v9 objectAtIndexedSubscript:0];
      [(PBBProtoWarrantySentinel *)v11 setAllowed:[v20 BOOLValue]];
      goto LABEL_28;
    case 33:
      uint64_t v25 = PBBProtoWatchDidApplyWirelessCredentials;
LABEL_25:
      v33 = (PBBProtoWarrantySentinel *)objc_alloc_init(v25);
      v11 = v33;
      goto LABEL_30;
    default:
      if (v6 != 101)
      {
        if (v6 != 102) {
          goto LABEL_32;
        }
        v11 = objc_alloc_init(PBBProtoAppViewListImageResponse);
        if (v9)
        {
          uint64_t v19 = [v9 objectAtIndexedSubscript:0];
          [(PBBProtoWarrantySentinel *)v11 setImageData:v19];
        }
        uint64_t v20 = pbb_setupflow_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v123 = (uint64_t)v11;
          _os_log_impl(&dword_21C445000, v20, OS_LOG_TYPE_DEFAULT, ">>>> sending appViewListImageResponse %@", buf, 0xCu);
        }
        goto LABEL_28;
      }
      id v34 = objc_alloc_init(PBBProtoTermsAndConditions);
      v11 = (PBBProtoWarrantySentinel *)v34;
      if (v9)
      {
        uint64_t v20 = [v9 objectAtIndexedSubscript:0];
        [(PBBProtoWarrantySentinel *)v11 setServerTerms:v20];
LABEL_28:

        goto LABEL_29;
      }
      v120 = (PBBProtoWarrantySentinel *)v34;
      long long v47 = [MEMORY[0x263EFF960] currentLocale];
      long long v48 = [v47 objectForKey:*MEMORY[0x263EFF508]];
      uint64_t v49 = [v48 lowercaseString];

      long long v50 = [MEMORY[0x263EFF960] currentLocale];
      long long v51 = [v50 objectForKey:*MEMORY[0x263EFF4D0]];
      uint64_t v52 = [v51 uppercaseString];

      [MEMORY[0x263EFF960] preferredLanguages];
      v116 = (void *)v52;
      v117 = (void *)v49;
      v121[0] = v49;
      v115 = v121[1] = v52;
      v53 = (void *)[v115 mutableCopy];
      v121[2] = v53;
      uint64_t v54 = [MEMORY[0x263EFF8C0] arrayWithObjects:v121 count:3];

      __int16 v55 = pbb_setupflow_log();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v123 = v54;
        _os_log_impl(&dword_21C445000, v55, OS_LOG_TYPE_DEFAULT, "args %@", buf, 0xCu);
      }

      v114 = (void *)v54;
      v56 = [(id)objc_opt_class() prepareOfflineTermsResponse:v54];
      v57 = pbb_setupflow_log();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        v111 = [v56 license];
        uint64_t v58 = [v111 length];
        uint64_t v59 = [v56 multiterms];
        uint64_t v60 = [v59 length];
        v61 = [v56 warranty];
        uint64_t v62 = [v61 length];
        *(_DWORD *)buf = 134218752;
        uint64_t v123 = (uint64_t)v56;
        __int16 v124 = 2048;
        uint64_t v125 = v58;
        __int16 v126 = 2048;
        uint64_t v127 = v60;
        __int16 v128 = 2048;
        uint64_t v129 = v62;
        _os_log_impl(&dword_21C445000, v57, OS_LOG_TYPE_DEFAULT, "Offline Terms response: (%p); license: (%lu bytes); multiterms: (%lu bytes); warranty: (%lu bytes);",
          buf,
          0x2Au);
      }
      v118 = v56;
      if ([v56 hasMultiterms])
      {
        id v63 = [NSString alloc];
        v64 = [v56 multiterms];
        v112 = (void *)[v63 initWithData:v64 encoding:4];

        v103 = NSString;
        v105 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v109 = [v105 localizedStringForKey:@"TERMS_AND_CONDITIONS" value:&stru_26CC94B60 table:@"Localizable"];
        v104 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v108 = [v104 localizedStringForKey:@"IMPORTANT" value:&stru_26CC94B60 table:@"Localizable"];
        v102 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v107 = [v102 localizedStringForKey:@"Part1" value:&stru_26CC94B60 table:@"Localizable"];
        v101 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v106 = [v101 localizedStringForKey:@"TC_HEADER" value:&stru_26CC94B60 table:@"Localizable"];
        v100 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v98 = [v100 localizedStringForKey:@"WARRANTY_HEADER" value:&stru_26CC94B60 table:@"Localizable"];
        v99 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v96 = [v99 localizedStringForKey:@"Part2" value:&stru_26CC94B60 table:@"Localizable"];
        v97 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v94 = [v97 localizedStringForKey:@"Part3" value:&stru_26CC94B60 table:@"Localizable"];
        v95 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v65 = [v95 localizedStringForKey:@"AGREE" value:&stru_26CC94B60 table:@"Localizable"];
        v66 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v67 = [v66 localizedStringForKey:@"DISAGREE" value:&stru_26CC94B60 table:@"Localizable"];
        v68 = objc_msgSend(v103, "stringWithFormat:", v112, v109, v108, v107, v106, v98, v96, v94, v65, v67);

        v69 = [v68 dataUsingEncoding:4];
        id v70 = [NSString alloc];
        id v71 = v69;
        v72 = objc_msgSend(v70, "initWithBytes:length:encoding:", objc_msgSend(v71, "bytes"), objc_msgSend(v71, "length"), 4);
        v73 = pbb_setupflow_log();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v123 = (uint64_t)v72;
          _os_log_impl(&dword_21C445000, v73, OS_LOG_TYPE_DEFAULT, "bodyString: %@", buf, 0xCu);
        }

        [(PBBProtoWarrantySentinel *)v120 setMultiterms:v71];
        v56 = v118;
      }
      v74 = [v56 license];
      id v75 = [NSString alloc];
      id v113 = v74;
      uint64_t v76 = objc_msgSend(v75, "initWithBytes:length:encoding:", objc_msgSend(v113, "bytes"), objc_msgSend(v113, "length"), 4);
      v77 = pbb_setupflow_log();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v123 = v76;
        _os_log_impl(&dword_21C445000, v77, OS_LOG_TYPE_DEFAULT, "license: %@", buf, 0xCu);
      }

      v78 = [v56 warranty];
      v110 = (void *)v76;
      v11 = v120;
      [(PBBProtoWarrantySentinel *)v120 setWarranty:v78];

      v79 = [v56 license];
      [(PBBProtoWarrantySentinel *)v120 setLicense:v79];

      v80 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v81 = objc_msgSend(v80, "localizedStringForKey:value:table:", @"TERMS_AND_CONDITIONS");
      [(PBBProtoWarrantySentinel *)v120 setLicenseLabel:v81];

      v82 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v83 = [v82 localizedStringForKey:@"WARRANTY" value:&stru_26CC94B60 table:@"Localizable"];
      [(PBBProtoWarrantySentinel *)v120 setWarrantyLabel:v83];

      v84 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v85 = [v84 localizedStringForKey:@"AGREE_DIALOG_TITLE" value:&stru_26CC94B60 table:@"Localizable"];
      [(PBBProtoWarrantySentinel *)v120 setAgreeDialogTitle:v85];

      v86 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v87 = objc_msgSend(v86, "localizedStringForKey:value:table:", @"AGREE_DIALOG_TEXT", &stru_26CC94B60);
      [(PBBProtoWarrantySentinel *)v120 setAgreeDialogText:v87];

      v88 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v89 = [v88 localizedStringForKey:@"AGREE" value:&stru_26CC94B60 table:@"Localizable"];
      [(PBBProtoWarrantySentinel *)v120 setAgreeLabel:v89];

      v90 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v91 = [v90 localizedStringForKey:@"CANCEL" value:&stru_26CC94B60 table:@"Localizable"];
      [(PBBProtoWarrantySentinel *)v120 setCancelLabel:v91];

      v92 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v93 = [v92 localizedStringForKey:@"DISAGREE" value:&stru_26CC94B60 table:@"Localizable"];
      [(PBBProtoWarrantySentinel *)v120 setDisagreeLabel:v93];

LABEL_29:
      v33 = v11;
LABEL_30:
      __int16 v10 = [(PBBProtoWarrantySentinel *)v33 data];
LABEL_31:

LABEL_32:
      v35 = (void *)[objc_alloc(MEMORY[0x263F4A228]) initWithProtobufData:v10 type:v6 isResponse:1];
      v36 = pbb_setupflow_log();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = PBBCMessageDescription(v6);
        *(_DWORD *)buf = 138412546;
        uint64_t v123 = (uint64_t)v37;
        __int16 v124 = 2112;
        uint64_t v125 = (uint64_t)v35;
        _os_log_impl(&dword_21C445000, v36, OS_LOG_TYPE_DEFAULT, "Sending Response Protobuf (%@ -- %@)", buf, 0x16u);
      }
      v38 = [(PBBridgeIDSServiceDelegate *)self service];
      v39 = [v8 context];
      v40 = [v39 outgoingResponseIdentifier];
      id v41 = [(PBBridgeIDSServiceDelegate *)self sendProtoBuf:v35 service:v38 priority:300 responseIdentifier:v40 expectsResponse:0 retryCount:-1 retryInterval:-1.0];

      return 0;
  }
}

- (BOOL)updateLanguageIdentifierWithCompletion:(id)a3
{
  uint64_t v4 = (void *)[a3 copy];
  id updateLanguageCompletion = self->_updateLanguageCompletion;
  self->_id updateLanguageCompletion = v4;

  uint64_t v6 = MEMORY[0x263EFFA68];
  return [(PBBridgeGizmoController *)self _sendRemoteCommandWithMessageID:5 withArguments:v6];
}

- (BOOL)updateRegionIdentifierWithCompletion:(id)a3
{
  uint64_t v4 = (void *)[a3 copy];
  id updateRegionCompletion = self->_updateRegionCompletion;
  self->_id updateRegionCompletion = v4;

  uint64_t v6 = MEMORY[0x263EFFA68];
  return [(PBBridgeGizmoController *)self _sendRemoteCommandWithMessageID:6 withArguments:v6];
}

- (BOOL)tellCompanionGizmoBeganActivating
{
  return [(PBBridgeGizmoController *)self _sendRemoteCommandWithMessageID:3 withArguments:MEMORY[0x263EFFA68]];
}

- (void)_recordThatWatchFinishedActivating
{
  self->_activationState = 1;
}

- (BOOL)tellCompanionGizmoFinishedActivating
{
  [(PBBridgeGizmoController *)self _recordThatWatchFinishedActivating];
  uint64_t v3 = MEMORY[0x263EFFA68];
  return [(PBBridgeGizmoController *)self _sendRemoteCommandWithMessageID:4 withArguments:v3];
}

- (BOOL)tellCompanionGizmoFinishedActivatingAsDeKOTA
{
  [(PBBridgeGizmoController *)self _recordThatWatchFinishedActivating];
  uint64_t v3 = MEMORY[0x263EFFA68];
  return [(PBBridgeGizmoController *)self _sendRemoteCommandWithMessageID:21 withArguments:v3];
}

- (BOOL)tellCompanionGizmoFailedActivating:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(PBBridgeGizmoController *)self invalidateTimeoutTimer];
  self->_activationState = 1;
  v7[0] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];

  LOBYTE(self) = [(PBBridgeGizmoController *)self _sendRemoteCommandWithMessageID:12 withArguments:v5];
  return (char)self;
}

- (void)tellCompanionGizmoFinishedHealthSharingOptInWithSelection:(BOOL)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  id v4 = [NSNumber numberWithBool:a3];
  v6[0] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  [(PBBridgeGizmoController *)self _sendRemoteCommandWithMessageID:29 withArguments:v5];
}

- (void)setCompanionLanguage:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109378;
    v14[1] = 534;
    __int16 v15 = 2080;
    v16 = "-[PBBridgeGizmoController setCompanionLanguage:]";
    _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)v14, 0x12u);
  }

  uint64_t v6 = [PBBProtoSetLanguage alloc];
  v7 = [v4 data];

  id v8 = [(PBBProtoSetLanguage *)v6 initWithData:v7];
  id v9 = [(PBBProtoSetLanguage *)v8 language];
  __int16 v10 = (NSString *)[v9 copy];
  languageIdentifer = self->_languageIdentifer;
  self->_languageIdentifer = v10;

  id updateLanguageCompletion = (void (**)(id, NSString *))self->_updateLanguageCompletion;
  if (updateLanguageCompletion)
  {
    updateLanguageCompletion[2](updateLanguageCompletion, self->_languageIdentifer);
    id v13 = self->_updateLanguageCompletion;
    self->_id updateLanguageCompletion = 0;
  }
}

- (void)setCompanionRegion:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109378;
    v14[1] = 548;
    __int16 v15 = 2080;
    v16 = "-[PBBridgeGizmoController setCompanionRegion:]";
    _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)v14, 0x12u);
  }

  uint64_t v6 = [PBBProtoSetRegion alloc];
  v7 = [v4 data];

  id v8 = [(PBBProtoSetRegion *)v6 initWithData:v7];
  id v9 = [(PBBProtoSetRegion *)v8 region];
  __int16 v10 = (NSString *)[v9 copy];
  regionIdentifer = self->_regionIdentifer;
  self->_regionIdentifer = v10;

  id updateRegionCompletion = (void (**)(id, NSString *))self->_updateRegionCompletion;
  if (updateRegionCompletion)
  {
    updateRegionCompletion[2](updateRegionCompletion, self->_regionIdentifer);
    id v13 = self->_updateRegionCompletion;
    self->_id updateRegionCompletion = 0;
  }
}

- (void)getSiriStateWithCompletion:(id)a3
{
  id v4 = (void *)[a3 copy];
  id siriStateCompletion = self->_siriStateCompletion;
  self->_id siriStateCompletion = v4;

  uint64_t v6 = MEMORY[0x263EFFA68];
  [(PBBridgeGizmoController *)self _sendRemoteCommandWithMessageID:8 withArguments:v6];
}

- (void)enableSiriForGizmoWithCompletion:(id)a3
{
  id v4 = (void *)[a3 copy];
  id enableSiriCompletion = self->_enableSiriCompletion;
  self->_id enableSiriCompletion = v4;

  uint64_t v6 = MEMORY[0x263EFFA68];
  [(PBBridgeGizmoController *)self _sendRemoteCommandWithMessageID:9 withArguments:v6];
}

- (void)gotSiriState:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v17[0] = 67109378;
    v17[1] = 574;
    __int16 v18 = 2080;
    uint64_t v19 = "-[PBBridgeGizmoController gotSiriState:]";
    _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)v17, 0x12u);
  }

  uint64_t v6 = [PBBProtoSiriEnabled alloc];
  v7 = [v4 data];
  id v8 = [(PBBProtoSiriEnabled *)v6 initWithData:v7];

  id siriStateCompletion = (void (**)(id, uint64_t))self->_siriStateCompletion;
  if (siriStateCompletion)
  {
    siriStateCompletion[2](siriStateCompletion, [(PBBProtoSiriEnabled *)v8 enabled]);
    id v10 = self->_siriStateCompletion;
    self->_id siriStateCompletion = 0;
  }
  if (PBLogPerformanceMetrics())
  {
    v11 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
    double Current = CFAbsoluteTimeGetCurrent();
    id v13 = (objc_class *)objc_opt_class();
    CFStringRef v14 = NSStringFromClass(v13);
    __int16 v15 = [v4 context];
    v16 = [v15 outgoingResponseIdentifier];
    [v11 addMilestone:v14 activityType:v16 activityIdentifier:Current];
  }
}

- (void)enabledSiri:(id)a3
{
  id enableSiriCompletion = (void (**)(id, SEL, id))self->_enableSiriCompletion;
  if (enableSiriCompletion)
  {
    enableSiriCompletion[2](enableSiriCompletion, a2, a3);
    id v5 = self->_enableSiriCompletion;
    self->_id enableSiriCompletion = 0;
  }
}

- (void)companionBecameAvailableWantsConfirmation:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [PBBProtoBecameActive alloc];
  uint64_t v6 = [v4 data];

  v7 = [(PBBProtoBecameActive *)v5 initWithData:v6];
  id v8 = pbb_setupflow_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109378;
    v10[1] = 600;
    __int16 v11 = 2080;
    uint64_t v12 = "-[PBBridgeGizmoController companionBecameAvailableWantsConfirmation:]";
    _os_log_impl(&dword_21C445000, v8, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)v10, 0x12u);
  }

  if (![(PBBProtoBecameActive *)v7 wantsConfirmation]) {
    [(PBBridgeGizmoController *)self _sendRemoteCommandWithMessageID:1 withArguments:&unk_26CCA1610];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained remoteDidBecomeAvailable];
}

- (BOOL)_getActivationData:(BOOL)a3 forRequest:(id)a4 withCompletion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = pbb_activation_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v21 = "-[PBBridgeGizmoController _getActivationData:forRequest:withCompletion:]";
    _os_log_impl(&dword_21C445000, v10, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  [(PBBridgeGizmoController *)self invalidateTimeoutTimer];
  if (v6) {
    uint64_t v11 = 3;
  }
  else {
    uint64_t v11 = 4;
  }
  if (v6) {
    uint64_t v12 = &OBJC_IVAR___PBBridgeGizmoController__sessionCompletion;
  }
  else {
    uint64_t v12 = &OBJC_IVAR___PBBridgeGizmoController__activationCompletion;
  }
  [(PBBridgeGizmoController *)self setActivationState:v11];
  [(PBBridgeGizmoController *)self refreshTimeoutTimer];
  uint64_t v13 = (objc_class *)[v9 copy];
  uint64_t v14 = *v12;
  __int16 v15 = *(Class *)((char *)&self->super.super.isa + v14);
  *(Class *)((char *)&self->super.super.isa + v14) = v13;

  if (v8)
  {
    id v19 = v8;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
    BOOL v17 = [(PBBridgeGizmoController *)self _sendRemoteCommandWithMessageID:2 withArguments:v16];
  }
  else
  {
    BOOL v17 = [(PBBridgeGizmoController *)self _sendRemoteCommandWithMessageID:2 withArguments:0];
  }

  return v17;
}

- (BOOL)getActivationDataAndHeadersForRequest:(id)a3 withCompletion:(id)a4
{
  return [(PBBridgeGizmoController *)self _getActivationData:0 forRequest:a3 withCompletion:a4];
}

- (BOOL)getSessionDataForRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __67__PBBridgeGizmoController_getSessionDataForRequest_withCompletion___block_invoke;
  v11[3] = &unk_264401708;
  id v12 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = (void *)MEMORY[0x21D4A74C0](v11);
  LOBYTE(self) = [(PBBridgeGizmoController *)self _getActivationData:1 forRequest:v8 withCompletion:v9];

  return (char)self;
}

uint64_t __67__PBBridgeGizmoController_getSessionDataForRequest_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)getActivationDataForRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __70__PBBridgeGizmoController_getActivationDataForRequest_withCompletion___block_invoke;
  v11[3] = &unk_264401708;
  id v12 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = (void *)MEMORY[0x21D4A74C0](v11);
  LOBYTE(self) = [(PBBridgeGizmoController *)self _getActivationData:0 forRequest:v8 withCompletion:v9];

  return (char)self;
}

uint64_t __70__PBBridgeGizmoController_getActivationDataForRequest_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)reportRemoteActivationFailureError:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v8 count:1];

  LOBYTE(self) = -[PBBridgeGizmoController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 27, v6, v8, v9);
  return (char)self;
}

- (void)handleActivationData:(id)a3
{
  *(void *)&v43[5] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(PBBridgeGizmoController *)self invalidateTimeoutTimer];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    int v6 = [WeakRetained checkBrickedState];
  }
  else {
    int v6 = 1;
  }
  id v7 = pbb_activation_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)CFPropertyListRef v43 = "-[PBBridgeGizmoController handleActivationData:]";
    _os_log_impl(&dword_21C445000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (v6)
  {
    [(PBBridgeGizmoController *)self setActivationState:5];
    [(PBBridgeGizmoController *)self refreshTimeoutTimer];
    id v8 = [PBBProtoHandleActivationData alloc];
    uint64_t v9 = [v4 data];
    id v10 = [(PBBProtoHandleActivationData *)v8 initWithData:v9];

    if (PBLogPerformanceMetrics())
    {
      uint64_t v11 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
      double Current = CFAbsoluteTimeGetCurrent();
      uint64_t v13 = (objc_class *)objc_opt_class();
      uint64_t v14 = NSStringFromClass(v13);
      __int16 v15 = [v4 context];
      v16 = [v15 outgoingResponseIdentifier];
      [v11 addMilestone:v14 activityType:v16 activityIdentifier:Current];
    }
    BOOL v17 = pbb_activation_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      v43[0] = 685;
      LOWORD(v43[1]) = 2080;
      *(void *)((char *)&v43[1] + 2) = "-[PBBridgeGizmoController handleActivationData:]";
      _os_log_impl(&dword_21C445000, v17, OS_LOG_TYPE_DEFAULT, "%d %s", buf, 0x12u);
    }

    id sessionCompletion = (void (**)(id, void *, void))self->_sessionCompletion;
    if (sessionCompletion)
    {
      id v19 = [v10 activationData];
      sessionCompletion[2](sessionCompletion, v19, 0);

      uint64_t v20 = self->_sessionCompletion;
      self->_id sessionCompletion = 0;
    }
    else if (self->_activationCompletion)
    {
      id v28 = objc_alloc(MEMORY[0x263F08928]);
      v29 = [v10 responseHeaders];
      id v40 = 0;
      v30 = (void *)[v28 initForReadingFromData:v29 error:&v40];
      uint64_t v20 = v40;

      if (v20)
      {
        v31 = pbb_activation_log();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          -[PBBridgeGizmoController handleActivationData:]();
        }
      }
      v32 = (void *)MEMORY[0x263EFFA08];
      v41[0] = objc_opt_class();
      v41[1] = objc_opt_class();
      v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:2];
      id v34 = [v32 setWithArray:v33];
      v35 = [v30 decodeObjectOfClasses:v34 forKey:@"PBBridgeActivationRequestKey"];
      v36 = (void *)[v35 copy];

      [v30 finishDecoding];
      id activationCompletion = (void (**)(id, void *, void *))self->_activationCompletion;
      v38 = [v10 activationData];
      activationCompletion[2](activationCompletion, v38, v36);

      id v39 = self->_activationCompletion;
      self->_id activationCompletion = 0;
    }
    else
    {
      uint64_t v20 = pbb_activation_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[PBBridgeGizmoController handleActivationData:](v20);
      }
    }
  }
  else
  {
    id v10 = pbb_activation_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[PBBridgeGizmoController handleActivationData:](v10, v21, v22, v23, v24, v25, v26, v27);
    }
  }

  PBNotifyClientOfActivity();
}

- (void)setDiagnosticsEnabled:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [PBBProtoDiagnosticsEnabled alloc];
  id v5 = [v3 data];
  int v6 = [(PBBProtoDiagnosticsEnabled *)v4 initWithData:v5];

  uint64_t v7 = [(PBBProtoDiagnosticsEnabled *)v6 enabled];
  id v8 = pbb_setupflow_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = @"disabled";
    if (v7) {
      uint64_t v9 = @"enabled";
    }
    v17[0] = 67109634;
    v17[1] = 717;
    __int16 v18 = 2080;
    id v19 = "-[PBBridgeGizmoController setDiagnosticsEnabled:]";
    __int16 v20 = 2112;
    uint64_t v21 = v9;
    _os_log_impl(&dword_21C445000, v8, OS_LOG_TYPE_DEFAULT, "%d %s %@", (uint8_t *)v17, 0x1Cu);
  }

  id v10 = [MEMORY[0x263F53C50] sharedConnection];
  [v10 setBoolValue:v7 forSetting:*MEMORY[0x263F53878]];

  if (PBLogPerformanceMetrics())
  {
    uint64_t v11 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v13);
    __int16 v15 = [v3 context];
    v16 = [v15 outgoingResponseIdentifier];
    [v11 addMilestone:v14 activityType:v16 activityIdentifier:Current];
  }
}

- (void)setLocationEnabled:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [PBBProtoLocationServicesEnabled alloc];
  id v5 = [v3 data];
  int v6 = [(PBBProtoLocationServicesEnabled *)v4 initWithData:v5];

  uint64_t v7 = [(PBBProtoLocationServicesEnabled *)v6 enabled];
  id v8 = pbb_setupflow_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = @"disabled";
    if (v7) {
      uint64_t v9 = @"enabled";
    }
    v16[0] = 67109634;
    v16[1] = 730;
    __int16 v17 = 2080;
    __int16 v18 = "-[PBBridgeGizmoController setLocationEnabled:]";
    __int16 v19 = 2112;
    __int16 v20 = v9;
    _os_log_impl(&dword_21C445000, v8, OS_LOG_TYPE_DEFAULT, "%d %s %@", (uint8_t *)v16, 0x1Cu);
  }

  [MEMORY[0x263F00A60] setLocationServicesEnabled:v7];
  if (PBLogPerformanceMetrics())
  {
    id v10 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
    double Current = CFAbsoluteTimeGetCurrent();
    id v12 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v12);
    uint64_t v14 = [v3 context];
    __int16 v15 = [v14 outgoingResponseIdentifier];
    [v10 addMilestone:v13 activityType:v15 activityIdentifier:Current];
  }
}

- (void)setSiriEnabled:(id)a3
{
  id v3 = a3;
  id v4 = [PBBProtoSetSiriEnabled alloc];
  id v5 = [v3 data];

  id v10 = [(PBBProtoSetSiriEnabled *)v4 initWithData:v5];
  uint64_t v6 = [(PBBProtoSetSiriEnabled *)v10 enabled];
  uint64_t v7 = [getAFPreferencesClass() sharedPreferences];
  [v7 setAssistantIsEnabled:v6];

  id v8 = [getAFPreferencesClass() sharedPreferences];
  [v8 setDictationIsEnabled:v6];

  uint64_t v9 = [getAFPreferencesClass() sharedPreferences];
  [v9 synchronize];
}

- (void)setFitnessRouteAuthorizationForTinker:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [PBBProtoTinkerFitnessRouteTrackingEnabled alloc];
  id v5 = [v3 data];

  uint64_t v6 = [(PBBProtoTinkerFitnessRouteTrackingEnabled *)v4 initWithData:v5];
  BOOL v7 = [(PBBProtoTinkerFitnessRouteTrackingEnabled *)v6 enabled];
  id v8 = pbb_setupflow_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = @"disabled";
    if (v7) {
      uint64_t v9 = @"enabled";
    }
    v13[0] = 67109634;
    v13[1] = 777;
    __int16 v14 = 2080;
    __int16 v15 = "-[PBBridgeGizmoController setFitnessRouteAuthorizationForTinker:]";
    __int16 v16 = 2112;
    __int16 v17 = v9;
    _os_log_impl(&dword_21C445000, v8, OS_LOG_TYPE_DEFAULT, "%d %s %@", (uint8_t *)v13, 0x1Cu);
  }

  id v10 = (void *)MEMORY[0x263F00A60];
  if (v7) {
    uint64_t v11 = 4;
  }
  else {
    uint64_t v11 = 2;
  }
  id v12 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/LocationBundles/AppleWatchWorkout.bundle"];
  [v10 setAuthorizationStatusByType:v11 forBundle:v12];
}

- (void)companionDidSendLanguageAndLocale:(id)a3
{
  v28[6] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [PBBProtoSendLanguageAndLocale alloc];
  uint64_t v6 = [v4 data];

  BOOL v7 = [(PBBProtoSendLanguageAndLocale *)v5 initWithData:v6];
  id v8 = [(PBBProtoSendLanguageAndLocale *)v7 appleLanguages];
  uint64_t v9 = [(PBBProtoSendLanguageAndLocale *)v7 appleLocale];
  id v10 = objc_alloc(MEMORY[0x263F08928]);
  uint64_t v11 = [(PBBProtoSendLanguageAndLocale *)v7 archivedPreferences];
  id v25 = 0;
  id v12 = (void *)[v10 initForReadingFromData:v11 error:&v25];
  id v13 = v25;

  if (v13)
  {
    __int16 v14 = pbb_setupflow_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[PBBridgeGizmoController handleActivationData:]();
    }
  }
  id v15 = objc_alloc(MEMORY[0x263EFFA08]);
  v28[0] = objc_opt_class();
  v28[1] = objc_opt_class();
  v28[2] = objc_opt_class();
  v28[3] = objc_opt_class();
  v28[4] = objc_opt_class();
  v28[5] = objc_opt_class();
  __int16 v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:6];
  __int16 v17 = (void *)[v15 initWithArray:v16];
  uint64_t v18 = [v12 decodeObjectOfClasses:v17 forKey:@"PBBridgeLocalePreferencesKey"];
  __int16 v19 = (void *)[v18 copy];

  [v12 finishDecoding];
  __int16 v20 = pbb_setupflow_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v27 = v8;
    _os_log_impl(&dword_21C445000, v20, OS_LOG_TYPE_DEFAULT, "languages %@", buf, 0xCu);
  }

  uint64_t v21 = pbb_setupflow_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v27 = v9;
    _os_log_impl(&dword_21C445000, v21, OS_LOG_TYPE_DEFAULT, "locale %@", buf, 0xCu);
  }

  uint64_t v22 = pbb_setupflow_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v27 = v19;
    _os_log_impl(&dword_21C445000, v22, OS_LOG_TYPE_DEFAULT, "localePreferences %@", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (v19 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [WeakRetained ingestLocalePreferences:v19];
  }
  else if (objc_opt_respondsToSelector())
  {
    [WeakRetained selectLanguageFromAppleLanguages:v8 andLocale:v9];
  }
  else
  {
    uint64_t v24 = pbb_setupflow_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v27 = v9;
      _os_log_impl(&dword_21C445000, v24, OS_LOG_TYPE_DEFAULT, "locale %@", buf, 0xCu);
    }
  }
}

- (void)companionDidSendDemoWirelessCredentials:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [PBBProtoDemoWirelessCredentials alloc];
  uint64_t v6 = [v4 data];

  BOOL v7 = [(PBBProtoDemoWirelessCredentials *)v5 initWithData:v6];
  id v8 = [(PBBProtoDemoWirelessCredentials *)v7 ssid];
  uint64_t v9 = [(PBBProtoDemoWirelessCredentials *)v7 password];
  uint64_t v10 = [(PBBProtoDemoWirelessCredentials *)v7 companionDemoConfig];
  uint64_t v11 = pbb_setupflow_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    __int16 v14 = v8;
    _os_log_impl(&dword_21C445000, v11, OS_LOG_TYPE_DEFAULT, "Received Credentials for %@", (uint8_t *)&v13, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained prepareWithNetwork:v8 andPassword:v9 withCompanionConfiguration:v10];
  }
  else if (objc_opt_respondsToSelector())
  {
    [WeakRetained prepareWithNetwork:v8 andPassword:v9];
  }
  [(PBBridgeGizmoController *)self _sendRemoteCommandWithMessageID:22 withArguments:MEMORY[0x263EFFA68]];
}

- (void)companionDidSendTinkerWirelessCredentials:(id)a3
{
  id v4 = a3;
  id v5 = [PBBProtoTinkerWirelessCredentials alloc];
  uint64_t v6 = [v4 data];

  id v8 = [(PBBProtoTinkerWirelessCredentials *)v5 initWithData:v6];
  BOOL v7 = [(PBBProtoTinkerWirelessCredentials *)v8 serializedNetworkRecords];
  [(PBBridgeGizmoController *)self parseNetworkRecordsAndApplyWirelessCredentialsFromData:v7];
}

- (void)processReceivedPairingWirelessCredentials:(id)a3
{
  id v4 = a3;
  id v5 = [PBBProtoSendWirelessCredentialsToWatch alloc];
  uint64_t v6 = [v4 data];
  id v8 = [(PBBProtoSendWirelessCredentialsToWatch *)v5 initWithData:v6];

  BOOL v7 = [(PBBProtoSendWirelessCredentialsToWatch *)v8 serializedNetworkRecords];
  [(PBBridgeGizmoController *)self parseNetworkRecordsAndApplyWirelessCredentialsFromData:v7];

  [(PBBridgeGizmoController *)self _sendResponseToMessage:v4 withResponseMessageID:33 withArguments:MEMORY[0x263EFFA68]];
}

- (void)parseNetworkRecordsAndApplyWirelessCredentialsFromData:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v29 = objc_opt_new();
  id v4 = pbb_setupflow_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v32 = [v3 count];
    _os_log_impl(&dword_21C445000, v4, OS_LOG_TYPE_DEFAULT, "Received %lu network records from the phone", buf, 0xCu);
  }

  if ([v3 count])
  {
    unint64_t v5 = 0;
    uint64_t v6 = *MEMORY[0x263F081D0];
    do
    {
      id v7 = objc_alloc(MEMORY[0x263F08928]);
      id v8 = [v3 objectAtIndex:v5];
      uint64_t v9 = (void *)[v7 initForReadingFromData:v8 error:0];

      uint64_t v10 = (void *)MEMORY[0x263EFFA08];
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = objc_opt_class();
      __int16 v16 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, v15, objc_opt_class(), 0);
      id v30 = 0;
      __int16 v17 = [v9 decodeTopLevelObjectOfClasses:v16 forKey:v6 error:&v30];
      id v18 = v30;
      if (v18)
      {
        __int16 v19 = pbb_setupflow_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v32 = (uint64_t)v18;
          __int16 v20 = v19;
          uint64_t v21 = "Error unarchiving: %@";
          uint32_t v22 = 12;
LABEL_8:
          _os_log_impl(&dword_21C445000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, v22);
        }
      }
      else
      {
        __int16 v19 = pbb_setupflow_log();
        BOOL v23 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
        if (v17)
        {
          if (v23)
          {
            uint64_t v24 = [v17 objectForKeyedSubscript:@"SSID_STR"];
            *(_DWORD *)buf = 138412290;
            uint64_t v32 = (uint64_t)v24;
            _os_log_impl(&dword_21C445000, v19, OS_LOG_TYPE_DEFAULT, "Adding: %@", buf, 0xCu);
          }
          [v29 addObject:v17];
          goto LABEL_14;
        }
        if (v23)
        {
          *(_WORD *)buf = 0;
          __int16 v20 = v19;
          uint64_t v21 = "empty data";
          uint32_t v22 = 2;
          goto LABEL_8;
        }
      }

LABEL_14:
      ++v5;
    }
    while ([v3 count] > v5);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v26 = v29;
    [WeakRetained applyWirelessNetworkCredentials:v29];
  }
  else
  {
    uint64_t v27 = pbb_setupflow_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C445000, v27, OS_LOG_TYPE_DEFAULT, "delegate doesn't respond to applyWirelessNetworkCredentials", buf, 2u);
    }

    uint64_t v26 = v29;
  }
}

- (BOOL)tellCompanionThatLanguageAndLanguageCompletedWithStatus:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  unint64_t v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [NSNumber numberWithUnsignedShort:v3];
    *(_DWORD *)buf = 136315394;
    uint64_t v13 = "-[PBBridgeGizmoController tellCompanionThatLanguageAndLanguageCompletedWithStatus:]";
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "%s (Status: %@)", buf, 0x16u);
  }
  id v7 = [NSNumber numberWithUnsignedShort:v3];
  uint64_t v11 = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:1];
  BOOL v9 = [(PBBridgeGizmoController *)self _sendRemoteCommandWithMessageID:20 withArguments:v8];

  return v9;
}

- (void)handleSetLauncherViewModeForTinker:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [PBBProtoTinkerSetLauncherViewMode alloc];
  uint64_t v6 = [v4 data];

  id v7 = [(PBBProtoTinkerSetLauncherViewMode *)v5 initWithData:v6];
  uint64_t v8 = [(PBBProtoTinkerSetLauncherViewMode *)v7 launcherViewMode];
  BOOL v9 = pbb_setupflow_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109634;
    v12[1] = 900;
    __int16 v13 = 2080;
    __int16 v14 = "-[PBBridgeGizmoController handleSetLauncherViewModeForTinker:]";
    __int16 v15 = 1024;
    int v16 = v8;
    _os_log_impl(&dword_21C445000, v9, OS_LOG_TYPE_DEFAULT, ">>>> %d %s launcherViewMode %d", (uint8_t *)v12, 0x18u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v11 = [NSNumber numberWithUnsignedInt:v8];
    [WeakRetained setLauncherViewMode:v11];
  }
  else
  {
    uint64_t v11 = pbb_setupflow_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12[0]) = 0;
      _os_log_impl(&dword_21C445000, v11, OS_LOG_TYPE_DEFAULT, ">>>> delegate doesn't respond to setLauncherViewMode:", (uint8_t *)v12, 2u);
    }
  }
}

- (id)customDescriptionOfMessageType:(unsigned __int16)a3
{
  return PBBCMessageDescription(a3);
}

- (void)tellCompanionThatGizmoFinishedSettingPasscode:(BOOL)a3 isLong:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = pbb_setupflow_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v13 = 921;
    __int16 v14 = 2080;
    __int16 v15 = "-[PBBridgeGizmoController tellCompanionThatGizmoFinishedSettingPasscode:isLong:]";
    _os_log_impl(&dword_21C445000, v7, OS_LOG_TYPE_DEFAULT, "%d %s", buf, 0x12u);
  }

  uint64_t v8 = [NSNumber numberWithBool:v5];
  BOOL v9 = objc_msgSend(NSNumber, "numberWithBool:", v4, v8);
  v11[1] = v9;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
  [(PBBridgeGizmoController *)self _sendRemoteCommandWithMessageID:7 withArguments:v10];
}

- (void)tellCompanionThatGizmoFailedToCreatePasscode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v10 = 927;
    __int16 v11 = 2080;
    uint64_t v12 = "-[PBBridgeGizmoController tellCompanionThatGizmoFailedToCreatePasscode:]";
    _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "%d %s", buf, 0x12u);
  }

  uint64_t v6 = [NSNumber numberWithInt:v3];
  uint64_t v8 = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v8 count:1];
  [(PBBridgeGizmoController *)self _sendRemoteCommandWithMessageID:17 withArguments:v7];
}

- (void)tellCompanionThatGizmoFinishedChangingPasscode:(BOOL)a3 isLong:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = pbb_setupflow_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v13 = 933;
    __int16 v14 = 2080;
    __int16 v15 = "-[PBBridgeGizmoController tellCompanionThatGizmoFinishedChangingPasscode:isLong:]";
    _os_log_impl(&dword_21C445000, v7, OS_LOG_TYPE_DEFAULT, "%d %s", buf, 0x12u);
  }

  uint64_t v8 = [NSNumber numberWithBool:v5];
  BOOL v9 = objc_msgSend(NSNumber, "numberWithBool:", v4, v8);
  v11[1] = v9;
  int v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
  [(PBBridgeGizmoController *)self _sendRemoteCommandWithMessageID:28 withArguments:v10];
}

- (void)tellCompanionThatGizmoStartedUnlockPairing
{
}

- (void)tellCompanionThatGizmoFinishedUnlockPairing:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v10 = 944;
    __int16 v11 = 2080;
    uint64_t v12 = "-[PBBridgeGizmoController tellCompanionThatGizmoFinishedUnlockPairing:]";
    _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "%d %s", buf, 0x12u);
  }

  uint64_t v6 = [NSNumber numberWithBool:v3];
  uint64_t v8 = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v8 count:1];
  [(PBBridgeGizmoController *)self _sendRemoteCommandWithMessageID:13 withArguments:v7];
}

- (void)setCanBeginActivating:(id)a3
{
  *(void *)&v16[5] = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = pbb_activation_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 67109378;
    v16[0] = 952;
    LOWORD(v16[1]) = 2080;
    *(void *)((char *)&v16[1] + 2) = "-[PBBridgeGizmoController setCanBeginActivating:]";
    _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "%d %s -- Companion says we can activate!", (uint8_t *)&v15, 0x12u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_9;
  }
  int v7 = [WeakRetained checkBrickedState];
  uint64_t v8 = pbb_activation_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = @"Activated";
    if (v7) {
      BOOL v9 = @"Bricked";
    }
    int v15 = 138412290;
    *(void *)uint64_t v16 = v9;
    _os_log_impl(&dword_21C445000, v8, OS_LOG_TYPE_DEFAULT, "Watch Is %@!", (uint8_t *)&v15, 0xCu);
  }

  if (!v7)
  {
    [(PBBridgeGizmoController *)self tellCompanionGizmoFinishedActivating];
  }
  else
  {
LABEL_9:
    self->_canBeginActivation = 1;
    int v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 postNotificationName:@"PBBridgeGizmoControllerActivationAbilityChanged" object:0 userInfo:0];

    if (PBLogPerformanceMetrics())
    {
      __int16 v11 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
      double Current = CFAbsoluteTimeGetCurrent();
      uint64_t v13 = [v4 context];
      __int16 v14 = [v13 outgoingResponseIdentifier];
      [v11 addMilestone:@"CanBeginActivating" activityType:v14 activityIdentifier:Current];
    }
  }
}

- (void)waitForDynamicActivationEventPresentation:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  self->_activationState = 6;
  id v4 = pbb_activation_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109378;
    v5[1] = 976;
    __int16 v6 = 2080;
    int v7 = "-[PBBridgeGizmoController waitForDynamicActivationEventPresentation:]";
    _os_log_impl(&dword_21C445000, v4, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)v5, 0x12u);
  }

  [(PBBridgeGizmoController *)self invalidateTimeoutTimer];
  PBNotifyClientOfActivity();
}

- (void)waitForUserResponseToDynamicEventPresentation:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  self->_activationState = 6;
  id v4 = pbb_activation_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109378;
    v5[1] = 984;
    __int16 v6 = 2080;
    int v7 = "-[PBBridgeGizmoController waitForUserResponseToDynamicEventPresentation:]";
    _os_log_impl(&dword_21C445000, v4, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)v5, 0x12u);
  }

  [(PBBridgeGizmoController *)self refreshTimeoutTimer];
  PBNotifyClientOfActivity();
}

- (void)retryActivation:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = pbb_activation_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109378;
    v6[1] = 991;
    __int16 v7 = 2080;
    uint64_t v8 = "-[PBBridgeGizmoController retryActivation:]";
    _os_log_impl(&dword_21C445000, v4, OS_LOG_TYPE_DEFAULT, "%d %s -- Companion says we can activate!", (uint8_t *)v6, 0x12u);
  }

  self->_canBeginActivation = 1;
  BOOL v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:@"PBBridgeGizmoControllerRetryActivation" object:0 userInfo:0];

  PBNotifyClientOfActivity();
}

- (void)beganAwaitingAbilityToActivate
{
  [(PBBridgeGizmoController *)self setActivationState:2];
  [(PBBridgeGizmoController *)self refreshTimeoutTimer];
}

- (void)invalidateTimeoutTimer
{
  [(NSTimer *)self->_activationTimeout invalidate];
  activationTimeout = self->_activationTimeout;
  self->_activationTimeout = 0;
}

- (void)refreshTimeoutTimer
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  unsigned int v3 = self->_activationState - 2;
  double v4 = 0.0;
  if (v3 <= 4) {
    double v4 = dbl_21C494BA0[(__int16)v3];
  }
  BOOL v5 = pbb_activation_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if ((unsigned __int16)(self->_activationState - 2) > 3u) {
      __int16 v6 = @"Idle";
    }
    else {
      __int16 v6 = off_264401858[(__int16)(self->_activationState - 2)];
    }
    int v10 = 134218242;
    double v11 = v4 / 60.0;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "Setting %1.f minute timeout for activation phase (%@)", (uint8_t *)&v10, 0x16u);
  }

  [(NSTimer *)self->_activationTimeout invalidate];
  __int16 v7 = [MEMORY[0x263EFFA20] timerWithTimeInterval:self target:sel_activationTimeout_ selector:0 userInfo:0 repeats:v4];
  activationTimeout = self->_activationTimeout;
  self->_activationTimeout = v7;

  uint64_t v9 = [MEMORY[0x263EFF9F0] currentRunLoop];
  [v9 addTimer:self->_activationTimeout forMode:*MEMORY[0x263EFF588]];
}

- (void)activationTimeout:(id)a3
{
  [(PBBridgeGizmoController *)self invalidateTimeoutTimer];
  double v4 = pbb_activation_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[PBBridgeGizmoController activationTimeout:]((uint64_t)self, v4);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  __int16 v6 = [NSString stringWithFormat:@"Activation Timed Out in Phase Proxy Activation"];
  [WeakRetained remoteDidFailActivation:6 description:v6];
}

- (void)remoteRequestToKeepAlive:(id)a3
{
  double v4 = pbb_activation_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v7 = 0;
    _os_log_impl(&dword_21C445000, v4, OS_LOG_TYPE_DEFAULT, "Companion requested we refresh our activation timeout", v7, 2u);
  }

  unsigned int activationState = self->_activationState;
  if (activationState >= 3 && activationState != 0xFFFF) {
    [(PBBridgeGizmoController *)self refreshTimeoutTimer];
  }
}

- (void)pushControllerType:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [PBBProtoPushControllerType alloc];
  __int16 v6 = [v4 data];
  __int16 v7 = [(PBBProtoPushControllerType *)v5 initWithData:v6];

  unsigned int v8 = [(PBBProtoPushControllerType *)v7 controllerType];
  [(PBBProtoPushControllerType *)v7 intendedFireDate];
  double v10 = v9;
  if (PBLogPerformanceMetrics())
  {
    double v11 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v13);
    int v15 = [v4 context];
    uint64_t v16 = [v15 outgoingResponseIdentifier];
    [v11 addMilestone:v14 activityType:v16 activityIdentifier:Current];
  }
  uint64_t v17 = pbb_setupflow_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = PBBuddyControllerDescription(v8);
    v21[0] = 67109890;
    v21[1] = 1123;
    __int16 v22 = 2080;
    BOOL v23 = "-[PBBridgeGizmoController pushControllerType:]";
    __int16 v24 = 1024;
    unsigned int v25 = v8;
    __int16 v26 = 2112;
    uint64_t v27 = v18;
    _os_log_impl(&dword_21C445000, v17, OS_LOG_TYPE_DEFAULT, "%d %s (%d %@)", (uint8_t *)v21, 0x22u);
  }
  double v19 = CleanIntendedFireTimeOffset(v10);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained pushControllerType:v8 withIntendedFireTime:v19];
  PBNotifyClientOfActivity();
}

- (void)popToControllerType:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [PBBProtoPopToControllerType alloc];
  __int16 v6 = [v4 data];
  __int16 v7 = [(PBBProtoPopToControllerType *)v5 initWithData:v6];

  unsigned int v8 = [(PBBProtoPopToControllerType *)v7 controllerType];
  [(PBBProtoPopToControllerType *)v7 intendedFireDate];
  double v10 = v9;
  double v11 = pbb_setupflow_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v12 = PBBuddyControllerDescription(v8);
    v21[0] = 67109890;
    v21[1] = 1138;
    __int16 v22 = 2080;
    BOOL v23 = "-[PBBridgeGizmoController popToControllerType:]";
    __int16 v24 = 1024;
    unsigned int v25 = v8;
    __int16 v26 = 2112;
    uint64_t v27 = v12;
    _os_log_impl(&dword_21C445000, v11, OS_LOG_TYPE_DEFAULT, "%d %s (%d %@)", (uint8_t *)v21, 0x22u);
  }
  double v13 = CleanIntendedFireTimeOffset(v10);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained popToControllerType:v8 withIntendedFireTime:v13];
  if (PBLogPerformanceMetrics())
  {
    int v15 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v17 = (objc_class *)objc_opt_class();
    id v18 = NSStringFromClass(v17);
    double v19 = [v4 context];
    __int16 v20 = [v19 outgoingResponseIdentifier];
    [v15 addMilestone:v18 activityType:v20 activityIdentifier:Current];
  }
  PBNotifyClientOfActivity();
}

- (void)showLockedOnAnimation:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = pbb_setupflow_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109378;
    v6[1] = 1153;
    __int16 v7 = 2080;
    unsigned int v8 = "-[PBBridgeGizmoController showLockedOnAnimation:]";
    _os_log_impl(&dword_21C445000, v4, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)v6, 0x12u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained showLockedOnAnimation];
  PBNotifyClientOfActivity();
}

- (void)setPasscodeRestrictions:(id)a3
{
  v53[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [PBBProtoSetPasscodeRestrictions alloc];
  v37 = v3;
  BOOL v5 = [v3 data];
  __int16 v6 = [(PBBProtoSetPasscodeRestrictions *)v4 initWithData:v5];

  id v7 = objc_alloc(MEMORY[0x263F08928]);
  v36 = v6;
  unsigned int v8 = [(PBBProtoSetPasscodeRestrictions *)v6 restrictions];
  id v47 = 0;
  uint64_t v9 = (void *)[v7 initForReadingFromData:v8 error:&v47];
  id v10 = v47;

  if (v10)
  {
    double v11 = pbb_setupflow_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PBBridgeGizmoController handleActivationData:]();
    }
  }
  uint64_t v12 = *MEMORY[0x263F53A58];
  v53[0] = *MEMORY[0x263F539F8];
  v53[1] = v12;
  v53[2] = *MEMORY[0x263F53738];
  double v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:3];
  uint64_t v14 = *MEMORY[0x263F53988];
  v52[0] = *MEMORY[0x263F53998];
  v52[1] = v14;
  int v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:2];
  uint64_t v16 = objc_opt_new();
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v17 = v13;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v44 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        if ([v9 containsValueForKey:v22])
        {
          BOOL v23 = [v9 decodeObjectOfClass:objc_opt_class() forKey:v22];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v16 MCSetBoolRestriction:v22 value:v23 != 0];
          }
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v19);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v24 = v15;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v39 objects:v50 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v40 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v39 + 1) + 8 * j);
        if ([v9 containsValueForKey:v29])
        {
          id v30 = [v9 decodeObjectOfClass:objc_opt_class() forKey:v29];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v16 MCSetValueRestriction:v29 value:v30];
          }
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v39 objects:v50 count:16];
    }
    while (v26);
  }

  [v9 finishDecoding];
  v31 = pbb_setupflow_log();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v49 = v16;
    _os_log_impl(&dword_21C445000, v31, OS_LOG_TYPE_DEFAULT, "Trying to apply passcode restrictions: %@", buf, 0xCu);
  }

  uint64_t v32 = [MEMORY[0x263F53C50] sharedConnection];
  id v38 = 0;
  [v32 applyRestrictionDictionary:v16 clientType:@"NanoPreferencesSync" clientUUID:@"com.apple.nanobuddy" localizedClientDescription:0 localizedWarningMessage:0 outRestrictionChanged:0 outEffectiveSettingsChanged:0 outError:&v38];
  id v33 = v38;

  if (v33)
  {
    id v34 = pbb_setupflow_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[PBBridgeGizmoController setPasscodeRestrictions:]();
    }
  }
  self->_readyToCreatePasscode = 1;
  PBNotifyClientOfActivity();
}

- (void)setCrownOrientationRight:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [PBBProtoTellGizmoToSetCrownOrientation alloc];
  __int16 v6 = [v4 data];

  id v7 = [(PBBProtoTellGizmoToSetCrownOrientation *)v5 initWithData:v6];
  uint64_t v8 = [(PBBProtoTellGizmoToSetCrownOrientation *)v7 crownOrientationRight];
  uint64_t v9 = pbb_setupflow_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = @"Left";
    if (v8) {
      id v10 = @"Right";
    }
    int v12 = 138412290;
    double v13 = v10;
    _os_log_impl(&dword_21C445000, v9, OS_LOG_TYPE_DEFAULT, "setCrownOrientationRight: %@", (uint8_t *)&v12, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained setCrownOrientationRight:v8];
}

- (void)updateSynchProgress:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [PBBProtoInitialSyncStateUpdate alloc];
  __int16 v6 = [v4 data];

  id v7 = [(PBBProtoInitialSyncStateUpdate *)v5 initWithData:v6];
  [(PBBProtoInitialSyncStateUpdate *)v7 progress];
  double v9 = v8;
  uint64_t v10 = [(PBBProtoInitialSyncStateUpdate *)v7 state];
  double v11 = pbb_setupflow_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134218240;
    double v14 = v9;
    __int16 v15 = 2048;
    uint64_t v16 = v10;
    _os_log_impl(&dword_21C445000, v11, OS_LOG_TYPE_DEFAULT, "updateSynchProgress: %f state: %ld", (uint8_t *)&v13, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained setSyncProgress:v10 andState:v9];
}

- (void)doInitialSyncPrep:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = 1292;
    __int16 v9 = 2080;
    uint64_t v10 = "-[PBBridgeGizmoController doInitialSyncPrep:]";
    _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)v8, 0x12u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained prepareForInitialSync];
  }
  else
  {
    id v7 = pbb_setupflow_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl(&dword_21C445000, v7, OS_LOG_TYPE_DEFAULT, "Warning!! Delegate did not handle prepareForInitialSync!", (uint8_t *)v8, 2u);
    }
  }
  [(PBBridgeGizmoController *)self _sendResponseToMessage:v4 withResponseMessageID:18 withArguments:0];
}

- (void)handleWarrantySentinelRequest:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [PBBProtoWarrantySentinel alloc];
  __int16 v6 = [v4 data];
  id v7 = [(PBBProtoWarrantySentinel *)v5 initWithData:v6];

  double v8 = pbb_setupflow_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v58 = v7;
    _os_log_impl(&dword_21C445000, v8, OS_LOG_TYPE_DEFAULT, "Got Warranty Sentinel request: (%@)", buf, 0xCu);
  }

  if (PBLogPerformanceMetrics())
  {
    __int16 v9 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v11 = (objc_class *)objc_opt_class();
    int v12 = NSStringFromClass(v11);
    int v13 = [v4 context];
    double v14 = [v13 outgoingResponseIdentifier];
    [v9 addMilestone:v12 activityType:v14 activityIdentifier:Current];
  }
  if ([(PBBProtoWarrantySentinel *)v7 hasDeviceName])
  {
    __int16 v15 = [(PBBProtoWarrantySentinel *)v7 deviceName];
    [(PBBridgeGizmoController *)self setDeviceName:v15];
  }
  unint64_t v16 = 0x263EFF000;
  if ([(PBBProtoWarrantySentinel *)v7 hasAppleLocale])
  {
    v56 = self;
    uint64_t v17 = pbb_setupflow_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C445000, v17, OS_LOG_TYPE_DEFAULT, "Applying Locale workaround for 28393103", buf, 2u);
    }

    CFStringRef v18 = (const __CFString *)*MEMORY[0x263EFFE60];
    int v19 = 1;
    while (1)
    {
      uint64_t v20 = objc_msgSend(MEMORY[0x263EFF960], "currentLocale", v56);
      uint64_t v21 = [v20 localeIdentifier];

      uint64_t v22 = (void *)CFPreferencesCopyAppValue(@"AppleLocale", v18);
      BOOL v23 = pbb_setupflow_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v58 = v21;
        __int16 v59 = 2112;
        uint64_t v60 = v22;
        _os_log_impl(&dword_21C445000, v23, OS_LOG_TYPE_DEFAULT, "Locale from NSLocale: (%@); Locale from CFPref: (%@)",
          buf,
          0x16u);
      }

      if ([v22 isEqualToString:v21]) {
        break;
      }
      CFPreferencesFlushCaches();
      _CFLocaleResetCurrent();

      if (++v19 == 11) {
        goto LABEL_19;
      }
    }
    id v24 = pbb_setupflow_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v58) = v19;
      _os_log_impl(&dword_21C445000, v24, OS_LOG_TYPE_DEFAULT, "Workaround did the trick after (%d) iterations", buf, 8u);
    }

LABEL_19:
    uint64_t v25 = [MEMORY[0x263EFF960] currentLocale];
    uint64_t v26 = [v25 localeIdentifier];

    uint64_t v27 = pbb_setupflow_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v58 = v26;
      _os_log_impl(&dword_21C445000, v27, OS_LOG_TYPE_DEFAULT, "Current locale identifier: %@", buf, 0xCu);
    }

    uint64_t v28 = (void *)MEMORY[0x263EFF960];
    uint64_t v29 = [(PBBProtoWarrantySentinel *)v7 appleLocale];
    id v30 = [v28 componentsFromLocaleIdentifier:v29];

    v31 = [v30 objectForKeyedSubscript:@"calendar"];
    uint64_t v32 = [MEMORY[0x263F50758] supportedCalendars];
    char v33 = [v32 containsObject:v31];

    if ((v33 & 1) == 0)
    {

      v31 = 0;
    }
    id v34 = [v30 objectForKeyedSubscript:@"numbers"];
    v35 = [MEMORY[0x263F50758] numberingSystemsForLocaleID:v26];
    if ([v35 containsObject:v34])
    {
      v36 = [MEMORY[0x263F50758] numberingSystemForLocaleID:v26];
      int v37 = [v34 isEqualToString:v36];

      if (!v37) {
        goto LABEL_28;
      }
    }
    else
    {
    }
    id v34 = 0;
LABEL_28:
    id v38 = (void *)MEMORY[0x263EFF9A0];
    long long v39 = [MEMORY[0x263EFF960] componentsFromLocaleIdentifier:v26];
    long long v40 = [v38 dictionaryWithDictionary:v39];

    if (v31) {
      [v40 setObject:v31 forKeyedSubscript:@"calendar"];
    }
    if (v34) {
      [v40 setObject:v34 forKeyedSubscript:@"numbers"];
    }
    long long v41 = [MEMORY[0x263EFF960] canonicalLocaleIdentifierFromComponents:v40];
    long long v42 = pbb_setupflow_log();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v58 = v41;
      __int16 v59 = 2112;
      uint64_t v60 = v40;
      _os_log_impl(&dword_21C445000, v42, OS_LOG_TYPE_DEFAULT, "Will set new locale: %@, given components: %@", buf, 0x16u);
    }

    [MEMORY[0x263EFF960] setLocaleAndResetTimeFormat:v41];
    _CFLocaleResetCurrent();
    long long v43 = (PBBProtoWarrantySentinel *)CFPreferencesCopyValue(@"AppleLocale", (CFStringRef)*MEMORY[0x263EFFE48], (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
    long long v44 = pbb_setupflow_log();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v58 = v43;
      _os_log_impl(&dword_21C445000, v44, OS_LOG_TYPE_DEFAULT, "Set locale to %@ (read back from CFPref)", buf, 0xCu);
    }

    self = v56;
    unint64_t v16 = 0x263EFF000uLL;
  }
  if ([(PBBProtoWarrantySentinel *)v7 appleLanguagesCount])
  {
    long long v45 = [(PBBProtoWarrantySentinel *)v7 appleLanguages];
    long long v46 = *(void **)(v16 + 2400);
    id v47 = [v46 supportedCJLanguageIdentifiers];
    long long v48 = [v46 mostPreferredLanguageOf:v47 withPreferredLanguages:v45 forUsage:1 options:4];

    if ([v48 length])
    {
      uint64_t v49 = *(void **)(v16 + 2400);
      long long v50 = [v49 preferredLanguages];
      long long v51 = [v50 firstObject];
      [v49 setLanguageToPreferredLanguages:v51 fallback:v48];

      uint64_t v52 = pbb_setupflow_log();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        v53 = [*(id *)(v16 + 2400) preferredLanguages];
        *(_DWORD *)buf = 138412290;
        uint64_t v58 = v53;
        _os_log_impl(&dword_21C445000, v52, OS_LOG_TYPE_DEFAULT, "Set languages to %@", buf, 0xCu);
      }
    }
  }
  if ([(PBBProtoWarrantySentinel *)v7 hasRemoveSentinel]
    && [(PBBProtoWarrantySentinel *)v7 removeSentinel])
  {
    uint64_t v54 = pbb_setupflow_log();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C445000, v54, OS_LOG_TYPE_DEFAULT, "Removing Warranty Sentinel", buf, 2u);
    }

    __int16 v55 = [MEMORY[0x263F08850] defaultManager];
    [v55 removeItemAtPath:@"/var/mobile/Media/iTunes_Control/iTunes/ShowWarranty" error:0];
  }
  else
  {
    [(PBBridgeGizmoController *)self _sendResponseToMessage:v4 withResponseMessageID:14 withArguments:0];
  }
  PBNotifyClientOfActivity();
}

- (void)handleOfflineTermsRequest:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [PBBProtoOfflineTerms alloc];
  __int16 v6 = [v4 data];
  id v7 = [(PBBProtoOfflineTerms *)v5 initWithData:v6];

  double v8 = pbb_setupflow_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v21 = v7;
    _os_log_impl(&dword_21C445000, v8, OS_LOG_TYPE_DEFAULT, "Got Offline Terms request: (%@)", buf, 0xCu);
  }

  if (PBLogPerformanceMetrics())
  {
    __int16 v9 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v11 = (objc_class *)objc_opt_class();
    int v12 = NSStringFromClass(v11);
    int v13 = [v4 context];
    double v14 = [v13 outgoingResponseIdentifier];
    [v9 addMilestone:v12 activityType:v14 activityIdentifier:Current];
  }
  __int16 v15 = [(PBBProtoOfflineTerms *)v7 languageCode];
  v19[0] = v15;
  unint64_t v16 = [(PBBProtoOfflineTerms *)v7 countryCode];
  v19[1] = v16;
  uint64_t v17 = [(PBBProtoOfflineTerms *)v7 appleLanguages];
  v19[2] = v17;
  CFStringRef v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:3];

  [(PBBridgeGizmoController *)self _sendResponseToMessage:v4 withResponseMessageID:15 withArguments:v18];
  PBNotifyClientOfActivity();
}

- (void)handleRenameDeviceRequest:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [PBBProtoDeviceName alloc];
  __int16 v6 = [v4 data];

  id v7 = [(PBBProtoDeviceName *)v5 initWithData:v6];
  double v8 = [(PBBProtoDeviceName *)v7 deviceName];
  __int16 v9 = pbb_setupflow_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    uint64_t v11 = v8;
    _os_log_impl(&dword_21C445000, v9, OS_LOG_TYPE_DEFAULT, "Received device name request (%@)", (uint8_t *)&v10, 0xCu);
  }

  [(PBBridgeGizmoController *)self setDeviceName:v8];
}

- (void)setDeviceName:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    id v4 = pbb_setupflow_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_21C445000, v4, OS_LOG_TYPE_DEFAULT, "Setting device name to '%@'", buf, 0xCu);
    }

    BOOL v5 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41__PBBridgeGizmoController_setDeviceName___block_invoke;
    block[3] = &unk_2644011C8;
    id v7 = v3;
    dispatch_async(v5, block);
  }
}

void __41__PBBridgeGizmoController_setDeviceName___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (lockdown_connect())
  {
    v2 = (uint64_t *)(a1 + 32);
    int v3 = lockdown_set_value();
    lockdown_disconnect();
    id v4 = pbb_setupflow_log();
    BOOL v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __41__PBBridgeGizmoController_setDeviceName___block_invoke_cold_2(v2, v3, v5);
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *v2;
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "Successfully set name: (%@)", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    BOOL v5 = pbb_setupflow_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __41__PBBridgeGizmoController_setDeviceName___block_invoke_cold_1(v5);
    }
  }
}

+ (id)warrantyFilePathForLanguageCode:(id)a3 countryCode:(id)a4
{
  return 0;
}

+ (id)prepareOfflineTermsResponse:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_alloc_init(PBBProtoOfflineTerms);
  uint64_t v6 = [v4 objectAtIndexedSubscript:0];
  int v7 = [v4 objectAtIndexedSubscript:1];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  _DWORD v17[2] = __55__PBBridgeGizmoController_prepareOfflineTermsResponse___block_invoke_3;
  v17[3] = &unk_264401730;
  id v20 = a1;
  id v8 = v6;
  id v18 = v8;
  id v9 = v7;
  id v19 = v9;
  uint64_t v10 = (void (**)(void))MEMORY[0x21D4A74C0](v17);
  uint64_t v11 = __55__PBBridgeGizmoController_prepareOfflineTermsResponse___block_invoke();
  [(PBBProtoOfflineTerms *)v5 setLicense:v11];

  uint64_t v12 = [MEMORY[0x263F08850] defaultManager];
  int v13 = [v12 fileExistsAtPath:@"/var/mobile/Media/iTunes_Control/iTunes/ShowWarranty"];

  if (v13)
  {
    double v14 = __55__PBBridgeGizmoController_prepareOfflineTermsResponse___block_invoke_2();
    [(PBBProtoOfflineTerms *)v5 setMultiterms:v14];

    __int16 v15 = v10[2](v10);
    [(PBBProtoOfflineTerms *)v5 setWarranty:v15];
  }
  return v5;
}

id __55__PBBridgeGizmoController_prepareOfflineTermsResponse___block_invoke()
{
  v0 = NSString;
  v1 = SFLicenseFilePath();
  v2 = [v0 stringWithContentsOfFile:v1 encoding:4 error:0];

  int v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"TERMS_CONDITIONS_LINK" value:&stru_26CC94B60 table:@"Localizable"];

  BOOL v5 = (void *)MEMORY[0x263EFF960];
  uint64_t v6 = [MEMORY[0x263EFF960] preferredLanguages];
  int v7 = [v6 objectAtIndex:0];
  uint64_t v8 = [v5 characterDirectionForLanguage:v7];

  id v9 = @"ltr";
  if (v8 == 2) {
    id v9 = @"rtl";
  }
  uint64_t v10 = [NSString stringWithFormat:@"<body><p dir=\"%@\" class=\"p1\"><b>%@</b></p><p class=\"p1\"><br></p>", v9, v4];
  uint64_t v11 = [v2 stringByReplacingOccurrencesOfString:@"<body>" withString:v10];

  uint64_t v12 = [v11 dataUsingEncoding:4];

  return v12;
}

id __55__PBBridgeGizmoController_prepareOfflineTermsResponse___block_invoke_2()
{
  v0 = [MEMORY[0x263F086E0] mainBundle];
  v1 = [v0 pathForResource:@"multiterms" ofType:@"xml"];

  v2 = [NSString stringWithContentsOfFile:v1 encoding:4 error:0];
  int v3 = [v2 dataUsingEncoding:4];

  return v3;
}

id __55__PBBridgeGizmoController_prepareOfflineTermsResponse___block_invoke_3(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263EFF8F8];
  v2 = [(id)objc_opt_class() warrantyFilePathForLanguageCode:*(void *)(a1 + 32) countryCode:*(void *)(a1 + 40)];
  int v3 = [v1 dataWithContentsOfFile:v2];

  return v3;
}

- (void)transportBecameReachable
{
  v4.receiver = self;
  v4.super_class = (Class)PBBridgeGizmoController;
  [(PBBridgeIDSServiceDelegate *)&v4 transportBecameReachable];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained transportBecameReachable];
  }
}

- (void)transportBecameUnreachable
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)PBBridgeGizmoController;
  [(PBBridgeIDSServiceDelegate *)&v11 transportBecameUnreachable];
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();
  uint64_t v6 = pbb_setupflow_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 136446210;
      int v13 = "-[PBBridgeGizmoController transportBecameUnreachable]";
      _os_log_impl(&dword_21C445000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }

    [WeakRetained transportBecameUnreachable];
  }
  else
  {
    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)p_delegate);
      id v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 136446466;
      int v13 = "-[PBBridgeGizmoController transportBecameUnreachable]";
      __int16 v14 = 2112;
      __int16 v15 = v10;
      _os_log_impl(&dword_21C445000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s: Delegate (%@) missing transportBecameUnreachable", buf, 0x16u);
    }
  }
}

- (BOOL)sendCompanionPerformanceResults
{
  return [(PBBridgeGizmoController *)self _sendRemoteCommandWithMessageID:16 withArguments:MEMORY[0x263EFFA68]];
}

- (void)prepareForForcedWatchSU:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[PBBridgeGizmoController prepareForForcedWatchSU:]";
    _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "%s:", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained prepareForForcedSU];
  }
  [(PBBridgeGizmoController *)self _sendResponseToMessage:v4 withResponseMessageID:23 withArguments:MEMORY[0x263EFFA68]];
}

- (void)fetchTermsAndConditions:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v23 = 1558;
    __int16 v24 = 2080;
    uint64_t v25 = "-[PBBridgeGizmoController fetchTermsAndConditions:]";
    _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "%d %s", buf, 0x12u);
  }

  uint64_t v6 = [MEMORY[0x263F08850] defaultManager];
  int v7 = [v6 fileExistsAtPath:@"/var/mobile/Media/iTunes_Control/iTunes/ShowWarranty"];

  if (v7)
  {
    v21[0] = &unk_26CCA1658;
    v21[1] = &unk_26CCA16A8;
    _DWORD v21[2] = &unk_26CCA1680;
    id v8 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v9 = v21;
    uint64_t v10 = 3;
  }
  else
  {
    v20[0] = &unk_26CCA1658;
    v20[1] = &unk_26CCA16A8;
    id v8 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v9 = v20;
    uint64_t v10 = 2;
  }
  objc_super v11 = [v8 arrayWithObjects:v9 count:v10];
  v18[0] = @"terms";
  v18[1] = @"format";
  uint64_t v12 = *MEMORY[0x263F25B60];
  v19[0] = v11;
  v19[1] = v12;
  int v13 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  __int16 v14 = (void *)[objc_alloc(MEMORY[0x263F25870]) initWithParameters:v13];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  _DWORD v16[2] = __51__PBBridgeGizmoController_fetchTermsAndConditions___block_invoke;
  v16[3] = &unk_264401780;
  v16[4] = self;
  id v17 = v4;
  id v15 = v4;
  [v14 performRequestWithHandler:v16];
}

void __51__PBBridgeGizmoController_fetchTermsAndConditions___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __51__PBBridgeGizmoController_fetchTermsAndConditions___block_invoke_2;
  v11[3] = &unk_264401758;
  id v12 = v6;
  id v13 = v7;
  id v8 = *(void **)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v8;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v11);
}

void __51__PBBridgeGizmoController_fetchTermsAndConditions___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  int v3 = [v2 responseData];
  id v4 = pbb_setupflow_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [v3 length];
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    uint64_t v15 = v5;
    __int16 v16 = 2114;
    uint64_t v17 = v6;
    _os_log_impl(&dword_21C445000, v4, OS_LOG_TYPE_DEFAULT, "Terms request completed with data length %llu, error (non-nil does not imply failure) = %{public}@", buf, 0x16u);
  }

  uint64_t v7 = [v3 length];
  id v8 = pbb_setupflow_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C445000, v8, OS_LOG_TYPE_DEFAULT, "sending online terms", buf, 2u);
    }

    objc_super v11 = *(void **)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    id v13 = v3;
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
    [v11 _sendResponseToMessage:v10 withResponseMessageID:101 withArguments:v12];
  }
  else
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C445000, v8, OS_LOG_TYPE_DEFAULT, "requesting offline terms", buf, 2u);
    }

    [*(id *)(a1 + 48) _sendResponseToMessage:*(void *)(a1 + 56) withResponseMessageID:101 withArguments:0];
  }
}

- (void)companionTermsResponse:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = pbb_setupflow_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 67109378;
    int v14 = 1592;
    __int16 v15 = 2080;
    *(void *)__int16 v16 = "-[PBBridgeGizmoController companionTermsResponse:]";
    _os_log_impl(&dword_21C445000, v4, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)&v13, 0x12u);
  }

  uint64_t v5 = [PBBProtoCompanionTermsResponse alloc];
  uint64_t v6 = [v3 data];

  uint64_t v7 = [(PBBProtoCompanionTermsResponse *)v5 initWithData:v6];
  if ([(PBBProtoCompanionTermsResponse *)v7 hasTermsAccepted]) {
    int v8 = [(PBBProtoCompanionTermsResponse *)v7 termsAccepted];
  }
  else {
    int v8 = 0;
  }
  if ([(PBBProtoCompanionTermsResponse *)v7 hasIsExistingAccountTerms]) {
    BOOL v9 = [(PBBProtoCompanionTermsResponse *)v7 isExistingAccountTerms];
  }
  else {
    BOOL v9 = 0;
  }
  uint64_t v10 = [(PBBProtoCompanionTermsResponse *)v7 responseData];
  objc_super v11 = [(PBBProtoCompanionTermsResponse *)v7 userAgent];
  id v12 = pbb_setupflow_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 67109890;
    int v14 = v8;
    __int16 v15 = 1024;
    *(_DWORD *)__int16 v16 = v9;
    *(_WORD *)&v16[4] = 2112;
    *(void *)&v16[6] = v10;
    __int16 v17 = 2112;
    uint64_t v18 = v11;
    _os_log_impl(&dword_21C445000, v12, OS_LOG_TYPE_DEFAULT, "companion terms response: hasTermsAccepted: %d isExistingAccountTerms: %d responseData %@ userAgent %@", (uint8_t *)&v13, 0x22u);
  }
}

- (void)returnProxiedDeviceForDeviceWithData:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = pbb_accountsignin_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v11 = 1608;
    __int16 v12 = 2080;
    int v13 = "-[PBBridgeGizmoController returnProxiedDeviceForDeviceWithData:]";
    _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "%d %s", buf, 0x12u);
  }

  uint64_t v6 = [MEMORY[0x263F291C0] currentDevice];
  uint64_t v7 = [v6 serializedData];
  BOOL v9 = v7;
  int v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:1];
  [(PBBridgeGizmoController *)self _sendResponseToMessage:v4 withResponseMessageID:25 withArguments:v8];
}

- (void)setComputedTimeZone:(id)a3
{
  *(void *)&v11[5] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = pbb_setupflow_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 67109378;
    v11[0] = 1622;
    LOWORD(v11[1]) = 2080;
    *(void *)((char *)&v11[1] + 2) = "-[PBBridgeGizmoController setComputedTimeZone:]";
    _os_log_impl(&dword_21C445000, v4, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)&v10, 0x12u);
  }

  uint64_t v5 = [PBBProtoSendComputedTimeZone alloc];
  uint64_t v6 = [v3 data];

  uint64_t v7 = [(PBBProtoSendComputedTimeZone *)v5 initWithData:v6];
  int v8 = [(PBBProtoSendComputedTimeZone *)v7 computedTimeZone];
  BOOL v9 = pbb_setupflow_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    *(void *)int v11 = v8;
    _os_log_impl(&dword_21C445000, v9, OS_LOG_TYPE_DEFAULT, "settings computed time zone to %@", (uint8_t *)&v10, 0xCu);
  }

  TMSetSourceTimeZone();
}

- (void)ingestTinkerCredentials:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = pbb_accountsignin_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v31 = 1635;
    __int16 v32 = 2080;
    char v33 = "-[PBBridgeGizmoController ingestTinkerCredentials:]";
    _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "%d %s", buf, 0x12u);
  }

  uint64_t v6 = [PBBProtoSendTinkerAccountCredentials alloc];
  uint64_t v7 = [v4 data];
  int v8 = [(PBBProtoSendTinkerAccountCredentials *)v6 initWithData:v7];

  __int16 v24 = [(PBBProtoSendTinkerAccountCredentials *)v8 username];
  BOOL v9 = [(PBBProtoSendTinkerAccountCredentials *)v8 password];
  int v10 = [(PBBProtoSendTinkerAccountCredentials *)v8 acceptedTermsData];
  int v23 = [(PBBProtoSendTinkerAccountCredentials *)v8 pairingParentAppleID];
  int v11 = [(PBBProtoSendTinkerAccountCredentials *)v8 pairingParentAltDSID];
  if (v10)
  {
    __int16 v12 = (void *)MEMORY[0x263F08928];
    uint64_t v13 = objc_opt_class();
    id v29 = 0;
    uint64_t v14 = [v12 unarchivedDictionaryWithKeysOfClass:v13 objectsOfClass:objc_opt_class() fromData:v10 error:&v29];
    id v15 = v29;
    if (v15)
    {
      __int16 v16 = pbb_accountsignin_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[PBBridgeGizmoController ingestTinkerCredentials:]();
      }
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  __int16 v17 = objc_opt_new();
  [v17 setUsername:v24];
  [v17 setPassword:v9];
  [v17 setAcceptedTermsInfo:v14];
  [v17 setPairingParentAltDSID:v11];
  [v17 setPairingParentUsername:v23];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __51__PBBridgeGizmoController_ingestTinkerCredentials___block_invoke;
  v27[3] = &unk_2644017A8;
  v27[4] = self;
  id v18 = v4;
  id v28 = v18;
  uint64_t v19 = (void *)MEMORY[0x21D4A74C0](v27);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __51__PBBridgeGizmoController_ingestTinkerCredentials___block_invoke_380;
  v25[3] = &unk_2644017D0;
  v25[4] = self;
  id v20 = v18;
  id v26 = v20;
  uint64_t v21 = (void *)MEMORY[0x21D4A74C0](v25);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained ingestTinkerCredentialsWithContext:v17 completion:v21];
  }
  else if (objc_opt_respondsToSelector())
  {
    [WeakRetained ingestTinkerCredentials:v9 forUser:v24 responseCompletion:v19];
  }
}

void __51__PBBridgeGizmoController_ingestTinkerCredentials___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a4;
  int v8 = pbb_accountsignin_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v16 = a3;
    _os_log_impl(&dword_21C445000, v8, OS_LOG_TYPE_DEFAULT, "response completion called with status: %ld", buf, 0xCu);
  }

  int v10 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  int v11 = [NSNumber numberWithBool:a2];
  v14[0] = v11;
  __int16 v12 = [NSNumber numberWithInteger:a3];
  v14[1] = v12;
  _DWORD v14[2] = v7;
  uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:3];
  [v10 _sendResponseToMessage:v9 withResponseMessageID:26 withArguments:v13];
}

void __51__PBBridgeGizmoController_ingestTinkerCredentials___block_invoke_380(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a4;
  int v8 = pbb_accountsignin_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v23 = a3;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl(&dword_21C445000, v8, OS_LOG_TYPE_DEFAULT, "response completion called with status: %ld error: %@", buf, 0x16u);
  }

  uint64_t v9 = [v7 localizedDescription];
  int v10 = (void *)v9;
  int v11 = &stru_26CC94B60;
  if (v9) {
    int v11 = (__CFString *)v9;
  }
  __int16 v12 = v11;

  uint64_t v13 = [NSNumber numberWithBool:a2];
  v21[0] = v13;
  uint64_t v14 = [NSNumber numberWithInteger:a3];
  v21[1] = v14;
  _DWORD v21[2] = v12;
  id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];

  if (v7)
  {
    id v20 = 0;
    uint64_t v16 = [MEMORY[0x263F08910] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v20];
    id v17 = v20;
    if (v17)
    {
      id v18 = pbb_accountsignin_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v17;
        _os_log_impl(&dword_21C445000, v18, OS_LOG_TYPE_DEFAULT, "error serializing incoming error: %@", buf, 0xCu);
      }
    }
    if (v16)
    {
      uint64_t v19 = [v15 arrayByAddingObject:v16];

      id v15 = (void *)v19;
    }
  }
  [*(id *)(a1 + 32) _sendResponseToMessage:*(void *)(a1 + 40) withResponseMessageID:26 withArguments:v15];
}

- (void)handleBuysOnWatchIngestion:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = pbb_accountsignin_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v22 = "-[PBBridgeGizmoController handleBuysOnWatchIngestion:]";
    _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  uint64_t v6 = [PBBProtoSendBuysOnWatchCredentials alloc];
  id v7 = [v4 data];
  int v8 = [(PBBProtoSendBuysOnWatchCredentials *)v6 initWithData:v7];

  uint64_t v9 = [(PBBProtoSendBuysOnWatchCredentials *)v8 username];
  int v10 = [(PBBProtoSendBuysOnWatchCredentials *)v8 password];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  id v17 = __54__PBBridgeGizmoController_handleBuysOnWatchIngestion___block_invoke;
  id v18 = &unk_2644017A8;
  uint64_t v19 = self;
  id v11 = v4;
  id v20 = v11;
  __int16 v12 = (void *)MEMORY[0x21D4A74C0](&v15);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(WeakRetained, "ingestBuysOnWatchCredentialsUsername:andPassword:responseCompletion:", v9, v10, v12, v15, v16, v17, v18, v19);
  }
  else
  {
    uint64_t v14 = pbb_accountsignin_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v22 = "-[PBBridgeGizmoController handleBuysOnWatchIngestion:]";
      _os_log_impl(&dword_21C445000, v14, OS_LOG_TYPE_DEFAULT, "%s -- Client doesn't implement handler.", buf, 0xCu);
    }
  }
}

void __54__PBBridgeGizmoController_handleBuysOnWatchIngestion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a4;
  int v8 = pbb_accountsignin_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [NSNumber numberWithBool:a2];
    *(_DWORD *)buf = 136315394;
    uint64_t v19 = "-[PBBridgeGizmoController handleBuysOnWatchIngestion:]_block_invoke";
    __int16 v20 = 2112;
    uint64_t v21 = v9;
    _os_log_impl(&dword_21C445000, v8, OS_LOG_TYPE_DEFAULT, "%s -- Success: %@", buf, 0x16u);
  }
  id v11 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  __int16 v12 = [NSNumber numberWithBool:a2];
  v17[0] = v12;
  uint64_t v13 = [NSNumber numberWithInteger:a3];
  uint64_t v14 = (void *)v13;
  uint64_t v15 = @"no error";
  if (v7) {
    uint64_t v15 = v7;
  }
  v17[1] = v13;
  _DWORD v17[2] = v15;
  uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];
  [v11 _sendResponseToMessage:v10 withResponseMessageID:30 withArguments:v16];
}

- (void)provideAppViewListImage:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [PBBProtoAppViewListImageRequest alloc];
  uint64_t v6 = [v4 data];
  id v7 = [(PBBProtoAppViewListImageRequest *)v5 initWithData:v6];

  int v8 = pbb_setupflow_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id buf = (id)0x6B704000302;
    __int16 v21 = 2080;
    uint64_t v22 = "-[PBBridgeGizmoController provideAppViewListImage:]";
    __int16 v23 = 2112;
    __int16 v24 = v7;
    _os_log_impl(&dword_21C445000, v8, OS_LOG_TYPE_DEFAULT, ">>>> %d %s request for app view list image received %@", (uint8_t *)&buf, 0x1Cu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&buf, self);
    [(PBBProtoAppViewListImageRequest *)v7 width];
    float v11 = v10;
    [(PBBProtoAppViewListImageRequest *)v7 height];
    float v13 = v12;
    [(PBBProtoAppViewListImageRequest *)v7 scale];
    float v15 = v14;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    _DWORD v17[2] = __51__PBBridgeGizmoController_provideAppViewListImage___block_invoke;
    void v17[3] = &unk_2644017F8;
    objc_copyWeak(&v19, &buf);
    id v18 = v4;
    [WeakRetained provideAppViewListImage:v17 height:v11 scale:v13 completion:v15];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&buf);
  }
  else
  {
    uint64_t v16 = pbb_setupflow_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_21C445000, v16, OS_LOG_TYPE_DEFAULT, ">>>> delegate doesn't respond to provideAppViewListImage:width:height:completion", (uint8_t *)&buf, 2u);
    }
  }
}

void __51__PBBridgeGizmoController_provideAppViewListImage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = pbb_setupflow_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138412546;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_21C445000, v7, OS_LOG_TYPE_DEFAULT, ">>>> got response to provideAppViewListImage:width:height:completion imageData %@ error %@", buf, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v5)
  {
    id v10 = v5;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v10 count:1];
  }
  else
  {
    uint64_t v9 = 0;
  }
  [WeakRetained _sendResponseToMessage:*(void *)(a1 + 32) withResponseMessageID:102 withArguments:v9];
}

- (void)setupDeviceManagement:(id)a3
{
  id v4 = a3;
  id v5 = [PBBProtoDeviceManagementSetupRequest alloc];
  id v6 = [v4 data];
  id v7 = [(PBBProtoDeviceManagementSetupRequest *)v5 initWithData:v6];

  int v8 = [(PBBProtoDeviceManagementSetupRequest *)v7 configurationData];
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    void v11[2] = __49__PBBridgeGizmoController_setupDeviceManagement___block_invoke;
    v11[3] = &unk_264401820;
    id v12 = v9;
    objc_copyWeak(&v14, &location);
    id v13 = v4;
    [WeakRetained setupDeviceManagementWithData:v8 completion:v11];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    [v9 addObject:MEMORY[0x263EFFA80]];
    [(PBBridgeGizmoController *)self _sendResponseToMessage:v4 withResponseMessageID:31 withArguments:v9];
  }
}

void __49__PBBridgeGizmoController_setupDeviceManagement___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v12 = 0;
    id v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v12];
    id v7 = v12;
    if (v7)
    {
      int v8 = pbb_devicemanagement_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __49__PBBridgeGizmoController_setupDeviceManagement___block_invoke_cold_1();
      }
    }
  }
  else
  {
    id v6 = 0;
  }
  id v9 = *(void **)(a1 + 32);
  id v10 = [NSNumber numberWithBool:a2];
  [v9 addObject:v10];

  if (v6) {
    [*(id *)(a1 + 32) addObject:v6];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _sendResponseToMessage:*(void *)(a1 + 40) withResponseMessageID:31 withArguments:*(void *)(a1 + 32)];
}

- (void)checkAppInstallationAllowed:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263F53C50];
  id v5 = a3;
  id v6 = [v4 sharedConnection];
  BOOL v7 = [v6 effectiveBoolValueForSetting:*MEMORY[0x263F53750]] == 2;

  int v8 = [NSNumber numberWithBool:v7];
  v10[0] = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  [(PBBridgeGizmoController *)self _sendResponseToMessage:v5 withResponseMessageID:32 withArguments:v9];
}

- (void)updateNanoRegistryToNormalState:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = pbb_setupflow_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[PBBridgeGizmoController updateNanoRegistryToNormalState:]";
    _os_log_impl(&dword_21C445000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 updateNanoRegisryToNormalState];
  }
}

- (PBBridgeConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PBBridgeConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)languageIdentifer
{
  return self->_languageIdentifer;
}

- (NSString)regionIdentifer
{
  return self->_regionIdentifer;
}

- (BOOL)canBeginActivation
{
  return self->_canBeginActivation;
}

- (BOOL)readyToCreatePasscode
{
  return self->_readyToCreatePasscode;
}

- (unsigned)activationState
{
  return self->_activationState;
}

- (NSTimer)activationTimeout
{
  return self->_activationTimeout;
}

- (void)setActivationTimeout:(id)a3
{
}

- (NSString)internalLastSendMessageID
{
  return self->_internalLastSendMessageID;
}

- (void)setInternalLastSendMessageID:(id)a3
{
}

- (id)updateLanguageCompletion
{
  return self->_updateLanguageCompletion;
}

- (void)setUpdateLanguageCompletion:(id)a3
{
}

- (id)updateRegionCompletion
{
  return self->_updateRegionCompletion;
}

- (void)setUpdateRegionCompletion:(id)a3
{
}

- (id)sessionCompletion
{
  return self->_sessionCompletion;
}

- (void)setSessionCompletion:(id)a3
{
}

- (id)activationCompletion
{
  return self->_activationCompletion;
}

- (void)setActivationCompletion:(id)a3
{
}

- (id)siriStateCompletion
{
  return self->_siriStateCompletion;
}

- (void)setSiriStateCompletion:(id)a3
{
}

- (id)enableSiriCompletion
{
  return self->_enableSiriCompletion;
}

- (void)setEnableSiriCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_enableSiriCompletion, 0);
  objc_storeStrong(&self->_siriStateCompletion, 0);
  objc_storeStrong(&self->_activationCompletion, 0);
  objc_storeStrong(&self->_sessionCompletion, 0);
  objc_storeStrong(&self->_updateRegionCompletion, 0);
  objc_storeStrong(&self->_updateLanguageCompletion, 0);
  objc_storeStrong((id *)&self->_internalLastSendMessageID, 0);
  objc_storeStrong((id *)&self->_activationTimeout, 0);
  objc_storeStrong((id *)&self->_regionIdentifer, 0);
  objc_storeStrong((id *)&self->_languageIdentifer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_sendRemoteCommandWithMessageID:withArguments:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21C445000, v0, v1, "Error archiving NSError: %@", v2, v3, v4, v5, v6);
}

- (void)handleActivationData:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21C445000, log, OS_LOG_TYPE_ERROR, "Error! Missing sessionCompletion && activationCompletion", v1, 2u);
}

- (void)handleActivationData:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21C445000, v0, v1, "Error Unarchiving Object! %@", v2, v3, v4, v5, v6);
}

- (void)handleActivationData:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)activationTimeout:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ((unsigned __int16)(*(_WORD *)(a1 + 50) - 2) > 3u) {
    uint64_t v2 = @"Idle";
  }
  else {
    uint64_t v2 = off_264401858[(__int16)(*(_WORD *)(a1 + 50) - 2)];
  }
  uint64_t v3 = *(void *)(a1 + 88);
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_21C445000, a2, OS_LOG_TYPE_ERROR, "Activation timeout in phase (%@) (Last message sent was %@)", (uint8_t *)&v4, 0x16u);
}

- (void)setPasscodeRestrictions:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21C445000, v0, v1, "Couldn’t apply passcode restrictions! %@", v2, v3, v4, v5, v6);
}

void __41__PBBridgeGizmoController_setDeviceName___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21C445000, log, OS_LOG_TYPE_ERROR, "Failed to connect to lockdown.", v1, 2u);
}

void __41__PBBridgeGizmoController_setDeviceName___block_invoke_cold_2(uint64_t *a1, int a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 1024;
  int v7 = a2;
  _os_log_error_impl(&dword_21C445000, log, OS_LOG_TYPE_ERROR, "Failed to set define name (%@) with error: %d", (uint8_t *)&v4, 0x12u);
}

- (void)ingestTinkerCredentials:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21C445000, v0, v1, "error unarchiving terms info: %@", v2, v3, v4, v5, v6);
}

void __49__PBBridgeGizmoController_setupDeviceManagement___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21C445000, v0, v1, "error serializing device management information: %{public}@", v2, v3, v4, v5, v6);
}

@end