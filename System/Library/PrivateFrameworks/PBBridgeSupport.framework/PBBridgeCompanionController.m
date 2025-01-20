@interface PBBridgeCompanionController
+ (id)displayNameWithFirstName:(id)a3 lastName:(id)a4;
+ (void)iCloudFirstName:(id *)a3 lastName:(id *)a4;
+ (void)meCardFirstName:(id *)a3 lastName:(id *)a4;
- (BOOL)_dumpActivationRequests;
- (BOOL)_sendRemoteCommandWithMessageID:(unsigned __int16)a3 withArguments:(id)a4;
- (BOOL)_sendResponseToMessage:(id)a3 withResponseMessageID:(unsigned __int16)a4 withArguments:(id)a5;
- (BOOL)allowAnyHTTPSCertificate;
- (BOOL)awaitingCustomResponse;
- (BOOL)connectionFailed;
- (BOOL)isEstablishingPairing;
- (BOOL)nonSilentActivation;
- (BOOL)passcodeSet;
- (BOOL)selectedPairedUnlock;
- (BOOL)sentActivationRequest;
- (BOOL)sentSessionRequest;
- (BOOL)shouldHandleMessageType:(unsigned __int16)a3 fromId:(id)a4;
- (NSDictionary)allHeaders;
- (NSMutableData)activationData;
- (NSMutableURLRequest)activationRequest;
- (NSString)contentType;
- (NSString)internalLastSendMessageID;
- (NSString)remoteActivationUserAgent;
- (NSURLConnection)activationConnection;
- (OS_dispatch_source)activationTimeout;
- (PBBridgeCompanionController)init;
- (PBBridgeConnectionDelegate)delegate;
- (RUILoader)ruiLoader;
- (RUILoaderDelegate)ruiDelegate;
- (RUIStyle)remoteUIStyle;
- (double)offsetEventTime;
- (id)_connectionWithRequest:(id)a3;
- (id)appViewListImageCompletion;
- (id)applicationInstallAllowedCompletion;
- (id)buysOnWatchCredentialsIngestedCompletion;
- (id)connection:(id)a3 willSendRequest:(id)a4 redirectResponse:(id)a5;
- (id)currentNetworks:(BOOL)a3;
- (id)currentWiFiNetworkName;
- (id)customDescriptionOfMessageType:(unsigned __int16)a3;
- (id)initialSyncPrepCompletion;
- (id)languageLocaleCompletion;
- (id)lockedOnAnimationCompletion;
- (id)prepareWatchForForcedSUCompletion;
- (id)remoteAccountForDeviceCompletion;
- (id)serviceIdentifier;
- (id)setupDeviceManagementCompletion;
- (id)tinkerCredentialsIngestedCompletion;
- (id)tinkerWiFiCredentialsIngestedCompletion;
- (id)viewControllerForAlertPresentation;
- (int)activationRetries;
- (int)activationState;
- (unsigned)_testActivationResponseType;
- (unsigned)granularActivationState;
- (void)_cleanup;
- (void)_processActivationData;
- (void)acknowledgeBuysOnWatchCredentialIngestion:(id)a3;
- (void)activationTimedOut;
- (void)beganWaitingForPresentationOfActivationEvent;
- (void)beganWaitingForUserResponseToActivationEvent;
- (void)beginSetupTransaction;
- (void)checkApplicationInstallAllowedWithCompletion:(id)a3;
- (void)connection:(id)a3 didFailWithError:(id)a4;
- (void)connection:(id)a3 didReceiveData:(id)a4;
- (void)connection:(id)a3 didReceiveResponse:(id)a4;
- (void)connectionDidFinishLoading:(id)a3;
- (void)enableSiriForGizmo:(id)a3;
- (void)endSetupTransaction;
- (void)getCompanionLanguage:(id)a3;
- (void)getCompanionRegion:(id)a3;
- (void)getSiriState:(id)a3;
- (void)gizmoActivationFailed:(id)a3;
- (void)gizmoBecameAvailableWantsConfirmation:(id)a3;
- (void)gizmoDidBeginActivating:(id)a3;
- (void)gizmoDidBeginUnlockPairing:(id)a3;
- (void)gizmoDidEndPasscodeChange:(id)a3;
- (void)gizmoDidEndPasscodeCreation:(id)a3;
- (void)gizmoDidEndUnlockPairing:(id)a3;
- (void)gizmoDidFinishActivating:(id)a3;
- (void)gizmoFailedToCreatePasscode:(id)a3;
- (void)handleAppViewListImageResponse:(id)a3;
- (void)handleApplicationInstallRestrictionResponse:(id)a3;
- (void)handleDeviceManagementResponse:(id)a3;
- (void)handleOfflineTermsResponse:(id)a3;
- (void)handlePerformanceResults:(id)a3;
- (void)handleRemoteActivationDetails:(id)a3;
- (void)handleWarrantySentinelResponse:(id)a3;
- (void)invalidateTimeoutTimerWithNewActivationGranularState:(unsigned __int16)a3;
- (void)loader:(id)a3 didFailWithError:(id)a4;
- (void)loader:(id)a3 didReceiveHTTPResponse:(id)a4;
- (void)loader:(id)a3 receivedObjectModel:(id)a4 actionSignal:(unint64_t)a5;
- (void)objectModel:(id)a3 pressedButton:(id)a4 attributes:(id)a5;
- (void)queryGizmoForOfflineTerms;
- (void)queryGizmoForShowWarrantySentinelAndRestoreDeviceName:(id)a3;
- (void)refreshTimeoutTimerWithNewActivationGranularState:(unsigned __int16)a3;
- (void)requestProxiedDeviceForWatchWithCompletion:(id)a3;
- (void)retrieveAppViewListImageFromGizmo:(CGSize)a3 completion:(id)a4;
- (void)returnedRemoteAccountForDevice:(id)a3;
- (void)sendAllTinkerWirelessCredentials:(BOOL)a3;
- (void)sendAllWirelessCredentials:(BOOL)a3;
- (void)sendBuysOnWatchUsername:(id)a3 andPassword:(id)a4 withCompletion:(id)a5;
- (void)sendComputedTimeZoneToGizmo;
- (void)sendDemoWatchWirelessCredentials;
- (void)sendGizmoPasscodeRestrictions;
- (void)sendProxyActivationRequest:(id)a3;
- (void)sendProxyActivationWithCustomRequest:(id)a3;
- (void)sendTinkerAccountCredentialsWithContext:(id)a3 completion:(id)a4;
- (void)setActivationConnection:(id)a3;
- (void)setActivationData:(id)a3;
- (void)setActivationRequest:(id)a3;
- (void)setActivationRetries:(int)a3;
- (void)setActivationState:(int)a3;
- (void)setActivationTimeout:(id)a3;
- (void)setAllHeaders:(id)a3;
- (void)setAllowAnyHTTPSCertificate:(BOOL)a3;
- (void)setAppViewListImageCompletion:(id)a3;
- (void)setApplicationInstallAllowedCompletion:(id)a3;
- (void)setAwaitingCustomResponse:(BOOL)a3;
- (void)setBuysOnWatchCredentialsIngestedCompletion:(id)a3;
- (void)setConnectionFailed:(BOOL)a3;
- (void)setContentType:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGranularActivationState:(unsigned __int16)a3;
- (void)setInitialSyncPrepCompletion:(id)a3;
- (void)setInternalLastSendMessageID:(id)a3;
- (void)setIsEstablishingPairing:(BOOL)a3;
- (void)setLanguageLocaleCompletion:(id)a3;
- (void)setLockedOnAnimationCompletion:(id)a3;
- (void)setNonSilentActivation:(BOOL)a3;
- (void)setPasscodeSet:(BOOL)a3;
- (void)setPrepareWatchForForcedSUCompletion:(id)a3;
- (void)setRemoteAccountForDeviceCompletion:(id)a3;
- (void)setRemoteActivationUserAgent:(id)a3;
- (void)setRemoteUIStyle:(id)a3;
- (void)setRuiDelegate:(id)a3;
- (void)setRuiLoader:(id)a3;
- (void)setSelectedPairedUnlock:(BOOL)a3;
- (void)setSentActivationRequest:(BOOL)a3;
- (void)setSentSessionRequest:(BOOL)a3;
- (void)setSetupDeviceManagementCompletion:(id)a3;
- (void)setTinkerCredentialsIngestedCompletion:(id)a3;
- (void)setTinkerWiFiCredentialsIngestedCompletion:(id)a3;
- (void)setupServiceMessageSelectorMappings;
- (void)startEstablishingPairing;
- (void)tellGizmoToBeginActivation;
- (void)tellGizmoToDeleteWarrantySentinel;
- (void)tellGizmoToKeepAliveForActivationEvent;
- (void)tellGizmoToPopToControllerType:(unint64_t)a3;
- (void)tellGizmoToPrepareForInitialSyncWithCompletion:(id)a3;
- (void)tellGizmoToPushControllerType:(unint64_t)a3;
- (void)tellGizmoToRetryActivation;
- (void)tellGizmoToSetCrownOrientationRight:(BOOL)a3;
- (void)tellGizmoToSetDiagnosticsEnabled:(BOOL)a3;
- (void)tellGizmoToSetFitnessRouteTrackingEnabled:(BOOL)a3;
- (void)tellGizmoToSetLocationEnabled:(BOOL)a3;
- (void)tellGizmoToSetMessagesinCloudEnabled:(BOOL)a3;
- (void)tellGizmoToShowLockedOnAnimationTimeToFlash:(double)a3 animationCompletion:(id)a4;
- (void)tellGizmoToUpdateNanoRegistryToNormalState;
- (void)tellGizmoToUpdateSyncProgressTo:(double)a3 withState:(int64_t)a4;
- (void)tellWatchLanguagesAndLocaleSupportingTermOfAddress:(BOOL)a3 withCompletion:(id)a4;
- (void)tellWatchToChangeDeviceNameFor:(id)a3;
- (void)tellWatchToConfigureDeviceManagementWithData:(id)a3 completion:(id)a4;
- (void)tellWatchToPrepareForForcedSUWithCompletion:(id)a3;
- (void)tellWatchToSetLauncherViewMode:(int64_t)a3;
- (void)tellWatchToSetSiriEnabled:(BOOL)a3;
- (void)tinkerFinishedHealthSharingOptIn:(id)a3;
- (void)tinkerWatchIngestedCredentials:(id)a3;
- (void)transportBecameReachable;
- (void)transportBecameUnreachable;
- (void)watchDidApplyWirelessCredentials:(id)a3;
- (void)watchDidIngestWirelessCredentials:(id)a3;
- (void)watchDidPrepareForForcedSU:(id)a3;
- (void)watchDidPrepareForInitialSync:(id)a3;
- (void)watchDidRespondWithLanguageAndLocaleStatus:(id)a3;
@end

@implementation PBBridgeCompanionController

- (PBBridgeCompanionController)init
{
  v7.receiver = self;
  v7.super_class = (Class)PBBridgeCompanionController;
  v2 = [(PBBridgeCompanionController *)&v7 init];
  if (v2)
  {
    xpc_set_event_stream_handler("com.apple.notifyd.matching", MEMORY[0x263EF83A0], &__block_literal_global_8);
    if (PBIsInternalInstall())
    {
      v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
      v2->_allowAnyHTTPSCertificate = [v3 BOOLForKey:@"ActivationAllowAnyHTTPSCertificate"];
    }
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.Bridge.timeout.tracker.queue", 0);
    timeoutTrackerQueue = v2->_timeoutTrackerQueue;
    v2->_timeoutTrackerQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)setRemoteUIStyle:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (void)setupServiceMessageSelectorMappings
{
  v3 = [(PBBridgeIDSServiceDelegate *)self service];
  [v3 setProtobufAction:sel_gizmoBecameAvailableWantsConfirmation_ forIncomingRequestsOfType:1];

  dispatch_queue_t v4 = [(PBBridgeIDSServiceDelegate *)self service];
  [v4 setProtobufAction:sel_sendProxyActivationRequest_ forIncomingRequestsOfType:2];

  v5 = [(PBBridgeIDSServiceDelegate *)self service];
  [v5 setProtobufAction:sel_gizmoDidBeginActivating_ forIncomingRequestsOfType:3];

  v6 = [(PBBridgeIDSServiceDelegate *)self service];
  [v6 setProtobufAction:sel_gizmoDidFinishActivating_ forIncomingRequestsOfType:4];

  objc_super v7 = [(PBBridgeIDSServiceDelegate *)self service];
  [v7 setProtobufAction:sel_gizmoDidFinishActivating_ forIncomingRequestsOfType:21];

  v8 = [(PBBridgeIDSServiceDelegate *)self service];
  [v8 setProtobufAction:sel_getCompanionLanguage_ forIncomingRequestsOfType:5];

  v9 = [(PBBridgeIDSServiceDelegate *)self service];
  [v9 setProtobufAction:sel_getCompanionRegion_ forIncomingRequestsOfType:6];

  v10 = [(PBBridgeIDSServiceDelegate *)self service];
  [v10 setProtobufAction:sel_gizmoDidEndPasscodeCreation_ forIncomingRequestsOfType:7];

  v11 = [(PBBridgeIDSServiceDelegate *)self service];
  [v11 setProtobufAction:sel_gizmoDidEndPasscodeChange_ forIncomingRequestsOfType:28];

  v12 = [(PBBridgeIDSServiceDelegate *)self service];
  [v12 setProtobufAction:sel_gizmoDidBeginUnlockPairing_ forIncomingRequestsOfType:19];

  v13 = [(PBBridgeIDSServiceDelegate *)self service];
  [v13 setProtobufAction:sel_gizmoDidEndUnlockPairing_ forIncomingRequestsOfType:13];

  v14 = [(PBBridgeIDSServiceDelegate *)self service];
  [v14 setProtobufAction:sel_getSiriState_ forIncomingRequestsOfType:8];

  v15 = [(PBBridgeIDSServiceDelegate *)self service];
  [v15 setProtobufAction:sel_gizmoActivationFailed_ forIncomingRequestsOfType:12];

  v16 = [(PBBridgeIDSServiceDelegate *)self service];
  [v16 setProtobufAction:sel_handlePerformanceResults_ forIncomingRequestsOfType:16];

  v17 = [(PBBridgeIDSServiceDelegate *)self service];
  [v17 setProtobufAction:sel_handleWarrantySentinelResponse_ forIncomingResponsesOfType:14];

  v18 = [(PBBridgeIDSServiceDelegate *)self service];
  [v18 setProtobufAction:sel_handleOfflineTermsResponse_ forIncomingResponsesOfType:15];

  v19 = [(PBBridgeIDSServiceDelegate *)self service];
  [v19 setProtobufAction:sel_gizmoFailedToCreatePasscode_ forIncomingRequestsOfType:17];

  v20 = [(PBBridgeIDSServiceDelegate *)self service];
  [v20 setProtobufAction:sel_watchDidPrepareForInitialSync_ forIncomingResponsesOfType:18];

  v21 = [(PBBridgeIDSServiceDelegate *)self service];
  [v21 setProtobufAction:sel_watchDidRespondWithLanguageAndLocaleStatus_ forIncomingRequestsOfType:20];

  v22 = [(PBBridgeIDSServiceDelegate *)self service];
  [v22 setProtobufAction:sel_watchDidIngestWirelessCredentials_ forIncomingRequestsOfType:22];

  v23 = [(PBBridgeIDSServiceDelegate *)self service];
  [v23 setProtobufAction:sel_watchDidPrepareForForcedSU_ forIncomingResponsesOfType:23];

  v24 = [(PBBridgeIDSServiceDelegate *)self service];
  [v24 setProtobufAction:sel_handleRemoteActivationDetails_ forIncomingRequestsOfType:27];

  v25 = [(PBBridgeIDSServiceDelegate *)self service];
  [v25 setProtobufAction:sel_returnedRemoteAccountForDevice_ forIncomingResponsesOfType:25];

  v26 = [(PBBridgeIDSServiceDelegate *)self service];
  [v26 setProtobufAction:sel_tinkerWatchIngestedCredentials_ forIncomingResponsesOfType:26];

  v27 = [(PBBridgeIDSServiceDelegate *)self service];
  [v27 setProtobufAction:sel_tinkerFinishedHealthSharingOptIn_ forIncomingRequestsOfType:29];

  v28 = [(PBBridgeIDSServiceDelegate *)self service];
  [v28 setProtobufAction:sel_acknowledgeBuysOnWatchCredentialIngestion_ forIncomingResponsesOfType:30];

  v29 = [(PBBridgeIDSServiceDelegate *)self service];
  [v29 setProtobufAction:sel_handleAppViewListImageResponse_ forIncomingResponsesOfType:102];

  v30 = [(PBBridgeIDSServiceDelegate *)self service];
  [v30 setProtobufAction:sel_handleDeviceManagementResponse_ forIncomingResponsesOfType:31];

  v31 = [(PBBridgeIDSServiceDelegate *)self service];
  [v31 setProtobufAction:sel_handleApplicationInstallRestrictionResponse_ forIncomingResponsesOfType:32];

  id v32 = [(PBBridgeIDSServiceDelegate *)self service];
  [v32 setProtobufAction:sel_watchDidApplyWirelessCredentials_ forIncomingResponsesOfType:33];
}

- (void)beginSetupTransaction
{
  v3.receiver = self;
  v3.super_class = (Class)PBBridgeCompanionController;
  [(PBBridgeIDSServiceDelegate *)&v3 beginSetupTransaction];
  [(PBBridgeCompanionController *)self invalidateTimeoutTimerWithNewActivationGranularState:0];
}

- (void)endSetupTransaction
{
  v10.receiver = self;
  v10.super_class = (Class)PBBridgeCompanionController;
  [(PBBridgeIDSServiceDelegate *)&v10 endSetupTransaction];
  id languageLocaleCompletion = self->_languageLocaleCompletion;
  self->_id languageLocaleCompletion = 0;

  remoteActivationUserAgent = self->_remoteActivationUserAgent;
  self->_remoteActivationUserAgent = 0;

  [(PBBridgeCompanionController *)self invalidateTimeoutTimerWithNewActivationGranularState:0];
  [(NSURLConnection *)self->_activationConnection cancel];
  activationConnection = self->_activationConnection;
  self->_activationConnection = 0;

  activationRequest = self->_activationRequest;
  self->_activationRequest = 0;

  activationData = self->_activationData;
  self->_activationData = 0;

  contentType = self->_contentType;
  self->_contentType = 0;

  [(RUILoader *)self->_ruiLoader cancel];
  [(RUILoader *)self->_ruiLoader setDelegate:0];
  ruiLoader = self->_ruiLoader;
  self->_ruiLoader = 0;

  self->_connectionFailed = 0;
  self->_nonSilentActivation = 0;
  self->_sentSessionRequest = 0;
  self->_sentActivationRequest = 0;
}

- (id)serviceIdentifier
{
  return @"com.apple.private.alloy.pbbridge";
}

- (double)offsetEventTime
{
  return CFAbsoluteTimeGetCurrent() + *(double *)&PBBridgeAnimationSyncOffsetTime;
}

- (BOOL)_sendRemoteCommandWithMessageID:(unsigned __int16)a3 withArguments:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v147 = *MEMORY[0x263EF8340];
  id v6 = a4;
  switch((int)v4)
  {
    case 1:
      objc_super v7 = objc_alloc_init(PBBProtoBecameActive);
      v8 = [v6 firstObject];
      -[PBBProtoBecameActive setWantsConfirmation:](v7, "setWantsConfirmation:", [v8 BOOLValue]);
      goto LABEL_17;
    case 2:
      objc_super v7 = objc_alloc_init(PBBProtoHandleActivationData);
      v9 = [v6 firstObject];
      [(PBBProtoBecameActive *)v7 setActivationData:v9];

      v8 = [v6 lastObject];
      [(PBBProtoBecameActive *)v7 setResponseHeaders:v8];
      goto LABEL_17;
    case 3:
      objc_super v10 = PBBProtoPushControllerType;
      goto LABEL_6;
    case 4:
      objc_super v10 = PBBProtoPopToControllerType;
LABEL_6:
      objc_super v7 = (PBBProtoBecameActive *)objc_alloc_init(v10);
      v11 = [v6 firstObject];
      -[PBBProtoBecameActive setControllerType:](v7, "setControllerType:", [v11 intValue]);

      [(PBBridgeCompanionController *)self offsetEventTime];
      -[PBBProtoBecameActive setIntendedFireDate:](v7, "setIntendedFireDate:");
      goto LABEL_18;
    case 5:
      objc_super v7 = objc_alloc_init(PBBProtoSetLanguage);
      v8 = [v6 firstObject];
      [(PBBProtoBecameActive *)v7 setLanguage:v8];
      goto LABEL_17;
    case 6:
      objc_super v7 = objc_alloc_init(PBBProtoSetRegion);
      v8 = [v6 firstObject];
      [(PBBProtoBecameActive *)v7 setRegion:v8];
      goto LABEL_17;
    case 7:
      v12 = PBBProtoSiriEnabled;
      goto LABEL_14;
    case 8:
      v12 = PBBProtoLocationServicesEnabled;
      goto LABEL_14;
    case 10:
      v12 = PBBProtoDiagnosticsEnabled;
LABEL_14:
      objc_super v7 = (PBBProtoBecameActive *)objc_alloc_init(v12);
      v14 = [v6 firstObject];
LABEL_15:
      v8 = v14;
      -[PBBProtoBecameActive setEnabled:](v7, "setEnabled:", [v14 BOOLValue]);
      goto LABEL_17;
    case 17:
      objc_super v7 = objc_alloc_init(PBBProtoDevicesLockedOn);
      [(PBBridgeCompanionController *)self offsetEventTime];
      double v16 = v15;
      v8 = [v6 firstObject];
      [v8 doubleValue];
      [(PBBProtoBecameActive *)v7 setIntendedFireDate:v16 + v17];
LABEL_17:

LABEL_18:
      v18 = v7;
LABEL_19:
      v13 = [(PBBProtoBecameActive *)v18 data];

      break;
    default:
      if ((v4 & 0xFFFFFFFB) != 0xB)
      {
        switch((int)v4)
        {
          case 14:
            v28 = objc_alloc_init(PBBProtoWarrantySentinel);
            if (v6)
            {
              v29 = [v6 firstObject];
              if ((unint64_t)[v6 count] < 2)
              {
                v30 = 0;
              }
              else
              {
                v30 = [v6 lastObject];
              }
              if (v29)
              {
                v111 = [MEMORY[0x263EFF9D0] null];
                char v112 = [v29 isEqual:v111];

                if ((v112 & 1) == 0) {
                  -[PBBProtoWarrantySentinel setRemoveSentinel:](v28, "setRemoveSentinel:", [v29 BOOLValue]);
                }
              }
              if (v30) {
                [(PBBProtoWarrantySentinel *)v28 setDeviceName:v30];
              }
              v113 = [MEMORY[0x263EFF960] currentLocale];
              uint64_t v114 = [v113 localeIdentifier];
              v115 = (void *)v114;
              v116 = @"en_US";
              if (v114) {
                v116 = (__CFString *)v114;
              }
              v117 = v116;

              [(PBBProtoWarrantySentinel *)v28 setAppleLocale:v117];
              v118 = (void *)MEMORY[0x263EFF980];
              v119 = [MEMORY[0x263EFF960] preferredLanguages];
              v120 = [v118 arrayWithArray:v119];

              [(PBBProtoWarrantySentinel *)v28 setAppleLanguages:v120];
            }
            goto LABEL_125;
          case 15:
          case 17:
            break;
          case 16:
            v28 = objc_alloc_init(PBBProtoOfflineTerms);
            v43 = [MEMORY[0x263EFF960] currentLocale];
            v44 = [v43 objectForKey:*MEMORY[0x263EFF508]];
            v45 = [v44 lowercaseString];
            [(PBBProtoWarrantySentinel *)v28 setLanguageCode:v45];

            v46 = [MEMORY[0x263EFF960] currentLocale];
            v47 = [v46 objectForKey:*MEMORY[0x263EFF4D0]];
            v48 = [v47 uppercaseString];
            [(PBBProtoWarrantySentinel *)v28 setCountryCode:v48];

            v49 = [MEMORY[0x263EFF960] preferredLanguages];
            v50 = (void *)[v49 mutableCopy];
            [(PBBProtoWarrantySentinel *)v28 setAppleLanguages:v50];

            v13 = [(PBBProtoWarrantySentinel *)v28 data];

            goto LABEL_126;
          case 18:
            objc_super v7 = objc_alloc_init(PBBProtoTellGizmoToSetCrownOrientation);
            v8 = [v6 firstObject];
            -[PBBProtoBecameActive setCrownOrientationRight:](v7, "setCrownOrientationRight:", [v8 BOOLValue]);
            goto LABEL_17;
          case 19:
            objc_super v7 = objc_alloc_init(PBBProtoInitialSyncStateUpdate);
            v51 = [v6 firstObject];
            [v51 floatValue];
            [(PBBProtoBecameActive *)v7 setProgress:v52];

            v8 = [v6 lastObject];
            -[PBBProtoBecameActive setState:](v7, "setState:", [v8 intValue]);
            goto LABEL_17;
          case 20:
            v53 = objc_alloc_init(PBBProtoSetPasscodeRestrictions);
            uint64_t v124 = [MEMORY[0x263EFF990] data];
            v54 = (void *)[objc_alloc(MEMORY[0x263F08910]) initForWritingWithMutableData:v124];
            id v123 = v6;
            v55 = [v6 firstObject];
            long long v136 = 0u;
            long long v137 = 0u;
            long long v138 = 0u;
            long long v139 = 0u;
            uint64_t v56 = [v55 countByEnumeratingWithState:&v136 objects:v146 count:16];
            if (v56)
            {
              uint64_t v57 = v56;
              uint64_t v58 = *(void *)v137;
              do
              {
                for (uint64_t i = 0; i != v57; ++i)
                {
                  if (*(void *)v137 != v58) {
                    objc_enumerationMutation(v55);
                  }
                  uint64_t v60 = *(void *)(*((void *)&v136 + 1) + 8 * i);
                  v61 = [v55 objectForKey:v60];
                  [v54 encodeObject:v61 forKey:v60];
                }
                uint64_t v57 = [v55 countByEnumeratingWithState:&v136 objects:v146 count:16];
              }
              while (v57);
            }
            v62 = self;
            [v54 finishEncoding];
            v63 = (void *)v124;
            [(PBBProtoSetPasscodeRestrictions *)v53 setRestrictions:v124];
            id v64 = (id)*MEMORY[0x263F1D020];
            v65 = [v64 activeWatch];
            v66 = (void *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.Carousel" pairedDevice:v65];
            v67 = v66;
            if (v66)
            {
              char v135 = 0;
              uint64_t v68 = [v66 BOOLForKey:@"DisableWristDetection" keyExistsAndHasValidFormat:&v135];
              if (v135)
              {
                uint64_t v69 = v68;
                [(PBBProtoSetPasscodeRestrictions *)v53 setWristDetectionDisabled:v68];
                v70 = pbb_setupflow_log();
                if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                {
                  v71 = [NSNumber numberWithBool:v69];
                  *(_DWORD *)buf = 138412290;
                  id v141 = v71;
                  _os_log_impl(&dword_21C445000, v70, OS_LOG_TYPE_DEFAULT, "sending restrictions + disableWristDection = %@", buf, 0xCu);
                }
                v63 = (void *)v124;
              }
            }
            v13 = [(PBBProtoSetPasscodeRestrictions *)v53 data];

            id v6 = v123;
            self = v62;
            goto LABEL_20;
          case 21:
            v72 = PBBProtoPrepareWatchForInitialSync;
            goto LABEL_95;
          case 22:
            v72 = PBBProtoBeganWaitingForPresentationOfActivationEvent;
            goto LABEL_95;
          case 23:
            v72 = PBBProtoBeganWaitingForUserResponseToActivationEvent;
            goto LABEL_95;
          case 24:
            v72 = PBBProtoSendActivationEventKeepAlive;
            goto LABEL_95;
          case 25:
            v28 = objc_alloc_init(PBBProtoSendLanguageAndLocale);
            if ((unint64_t)[v6 count] >= 2)
            {
              v73 = [v6 objectAtIndexedSubscript:0];
              [(PBBProtoWarrantySentinel *)v28 setAppleLanguages:v73];

              v74 = [v6 objectAtIndexedSubscript:1];
              [(PBBProtoWarrantySentinel *)v28 setAppleLocale:v74];
            }
            if ([v6 count] == 3)
            {
              v75 = [v6 objectAtIndexedSubscript:2];
              if (v75)
              {
                v76 = (void *)[objc_alloc(MEMORY[0x263F08910]) initRequiringSecureCoding:1];
                [v76 encodeObject:v75 forKey:@"PBBridgeLocalePreferencesKey"];
                [v76 finishEncoding];
                v77 = [v76 encodedData];
                [(PBBProtoWarrantySentinel *)v28 setArchivedPreferences:v77];
              }
            }
            goto LABEL_125;
          case 26:
            v28 = objc_alloc_init(PBBProtoDemoWirelessCredentials);
            v78 = [v6 objectAtIndexedSubscript:0];
            [(PBBProtoWarrantySentinel *)v28 setSsid:v78];

            v79 = [v6 objectAtIndexedSubscript:1];
            [(PBBProtoWarrantySentinel *)v28 setPassword:v79];

            if (PBShouldOfferBetterTogetherFlow()) {
              [(PBBProtoWarrantySentinel *)v28 setCompanionDemoConfig:1];
            }
            goto LABEL_125;
          case 27:
            v72 = PBBProtoPrepareWatchForForcedSU;
            goto LABEL_95;
          case 28:
            objc_super v7 = objc_alloc_init(PBBProtoSetSiriEnabled);
            v14 = [v6 objectAtIndexedSubscript:0];
            goto LABEL_15;
          case 29:
            v72 = PBBProtoRemoteAccountForDevice;
            goto LABEL_95;
          case 30:
            v28 = objc_alloc_init(PBBProtoSendTinkerAccountCredentials);
            v80 = [v6 objectAtIndexedSubscript:0];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) == 0)
            {
              v82 = [v6 objectAtIndexedSubscript:0];
              [(PBBProtoWarrantySentinel *)v28 setUsername:v82];
            }
            v83 = [v6 objectAtIndexedSubscript:1];
            objc_opt_class();
            char v84 = objc_opt_isKindOfClass();

            if ((v84 & 1) == 0)
            {
              v85 = [v6 objectAtIndexedSubscript:1];
              [(PBBProtoWarrantySentinel *)v28 setPassword:v85];
            }
            v86 = [v6 objectAtIndexedSubscript:2];
            objc_opt_class();
            char v87 = objc_opt_isKindOfClass();

            if ((v87 & 1) == 0)
            {
              v88 = [v6 objectAtIndexedSubscript:2];
              [(PBBProtoWarrantySentinel *)v28 setAcceptedTermsData:v88];
            }
            v89 = [v6 objectAtIndexedSubscript:3];
            objc_opt_class();
            char v90 = objc_opt_isKindOfClass();

            if ((v90 & 1) == 0)
            {
              v91 = [v6 objectAtIndexedSubscript:3];
              [(PBBProtoWarrantySentinel *)v28 setPairingParentAppleID:v91];
            }
            v92 = [v6 objectAtIndexedSubscript:4];
            objc_opt_class();
            char v93 = objc_opt_isKindOfClass();

            if ((v93 & 1) == 0)
            {
              v94 = [v6 objectAtIndexedSubscript:4];
              [(PBBProtoWarrantySentinel *)v28 setPairingParentAltDSID:v94];
LABEL_115:
            }
LABEL_125:
            v13 = [(PBBProtoWarrantySentinel *)v28 data];
LABEL_126:

            goto LABEL_20;
          case 31:
            v12 = PBBProtoTinkerMessagesInCloudEnabled;
            goto LABEL_14;
          case 32:
            objc_super v7 = objc_alloc_init(PBBProtoSendBuysOnWatchCredentials);
            v95 = [v6 firstObject];
            [(PBBProtoBecameActive *)v7 setUsername:v95];

            v8 = [v6 lastObject];
            [(PBBProtoBecameActive *)v7 setPassword:v8];
            goto LABEL_17;
          case 33:
            v12 = PBBProtoTinkerFitnessRouteTrackingEnabled;
            goto LABEL_14;
          case 34:
            objc_super v7 = objc_alloc_init(PBBProtoDeviceManagementSetupRequest);
            v8 = [v6 objectAtIndexedSubscript:0];
            [(PBBProtoBecameActive *)v7 setConfigurationData:v8];
            goto LABEL_17;
          case 35:
            v72 = PBBProtoApplicationInstallRestrictionRequest;
            goto LABEL_95;
          case 36:
            v72 = PBBProtoUpdateNanoRegistryToNormalState;
LABEL_95:
            v18 = (PBBProtoBecameActive *)objc_alloc_init(v72);
            objc_super v7 = v18;
            goto LABEL_19;
          case 37:
            v121 = self;
            v31 = objc_alloc_init(PBBProtoSendWirelessCredentialsToWatch);
            long long v126 = 0u;
            long long v127 = 0u;
            long long v128 = 0u;
            long long v129 = 0u;
            id v122 = v6;
            id v32 = v6;
            uint64_t v96 = [v32 countByEnumeratingWithState:&v126 objects:v144 count:16];
            if (v96)
            {
              uint64_t v97 = v96;
              uint64_t v98 = *(void *)v127;
              do
              {
                for (uint64_t j = 0; j != v97; ++j)
                {
                  if (*(void *)v127 != v98) {
                    objc_enumerationMutation(v32);
                  }
                  v100 = *(void **)(*((void *)&v126 + 1) + 8 * j);
                  v101 = pbb_setupflow_log();
                  if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
                  {
                    v102 = [v100 objectForKeyedSubscript:@"SSID_STR"];
                    *(_DWORD *)buf = 138412290;
                    id v141 = v102;
                    _os_log_impl(&dword_21C445000, v101, OS_LOG_TYPE_DEFAULT, "Sending: %@", buf, 0xCu);
                  }
                  id v125 = 0;
                  v103 = [MEMORY[0x263F08910] archivedDataWithRootObject:v100 requiringSecureCoding:1 error:&v125];
                  id v104 = v125;
                  if (v104)
                  {
                    v105 = pbb_setupflow_log();
                    if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      id v141 = v104;
                      _os_log_error_impl(&dword_21C445000, v105, OS_LOG_TYPE_ERROR, "Failed to Archive network record: %@", buf, 0xCu);
                    }
                  }
                  else
                  {
                    [(PBBProtoSendWirelessCredentialsToWatch *)v31 addSerializedNetworkRecord:v103];
                  }
                }
                uint64_t v97 = [v32 countByEnumeratingWithState:&v126 objects:v144 count:16];
              }
              while (v97);
            }
LABEL_110:

            v13 = [(PBBProtoSendWirelessCredentialsToWatch *)v31 data];

            self = v121;
            id v6 = v122;
            goto LABEL_20;
          default:
            switch((int)v4)
            {
              case 'h':
                v121 = self;
                v31 = objc_alloc_init(PBBProtoTinkerWirelessCredentials);
                long long v131 = 0u;
                long long v132 = 0u;
                long long v133 = 0u;
                long long v134 = 0u;
                id v122 = v6;
                id v32 = v6;
                uint64_t v33 = [v32 countByEnumeratingWithState:&v131 objects:v145 count:16];
                if (v33)
                {
                  uint64_t v34 = v33;
                  uint64_t v35 = *(void *)v132;
                  do
                  {
                    for (uint64_t k = 0; k != v34; ++k)
                    {
                      if (*(void *)v132 != v35) {
                        objc_enumerationMutation(v32);
                      }
                      v37 = *(void **)(*((void *)&v131 + 1) + 8 * k);
                      v38 = pbb_setupflow_log();
                      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                      {
                        v39 = [v37 objectForKeyedSubscript:@"SSID_STR"];
                        *(_DWORD *)buf = 138412290;
                        id v141 = v39;
                        _os_log_impl(&dword_21C445000, v38, OS_LOG_TYPE_DEFAULT, "Sending: %@", buf, 0xCu);
                      }
                      id v130 = 0;
                      v40 = [MEMORY[0x263F08910] archivedDataWithRootObject:v37 requiringSecureCoding:1 error:&v130];
                      id v41 = v130;
                      if (v41)
                      {
                        v42 = pbb_setupflow_log();
                        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412290;
                          id v141 = v41;
                          _os_log_error_impl(&dword_21C445000, v42, OS_LOG_TYPE_ERROR, "Failed to Archive network record: %@", buf, 0xCu);
                        }
                      }
                      -[PBBProtoSendWirelessCredentialsToWatch addSerializedNetworkRecord:](v31, "addSerializedNetworkRecord:", v40, v121);
                    }
                    uint64_t v34 = [v32 countByEnumeratingWithState:&v131 objects:v145 count:16];
                  }
                  while (v34);
                }
                goto LABEL_110;
              case 'n':
                objc_super v7 = objc_alloc_init(PBBProtoDeviceName);
                v8 = [v6 firstObject];
                [(PBBProtoBecameActive *)v7 setDeviceName:v8];
                goto LABEL_17;
              case 'o':
                objc_super v7 = objc_alloc_init(PBBProtoSendComputedTimeZone);
                v8 = [v6 firstObject];
                [(PBBProtoBecameActive *)v7 setComputedTimeZone:v8];
                goto LABEL_17;
              case 'p':
                objc_super v7 = objc_alloc_init(PBBProtoTinkerSetLauncherViewMode);
                v8 = [v6 firstObject];
                -[PBBProtoBecameActive setLauncherViewMode:](v7, "setLauncherViewMode:", [v8 integerValue]);
                goto LABEL_17;
              case 'q':
                v28 = objc_alloc_init(PBBProtoAppViewListImageRequest);
                v106 = [v6 objectAtIndexedSubscript:0];
                [v106 doubleValue];
                *(float *)&double v107 = v107;
                [(PBBProtoWarrantySentinel *)v28 setWidth:v107];

                v108 = [v6 objectAtIndexedSubscript:1];
                [v108 doubleValue];
                *(float *)&double v109 = v109;
                [(PBBProtoWarrantySentinel *)v28 setHeight:v109];

                v94 = [v6 objectAtIndexedSubscript:2];
                [v94 doubleValue];
                *(float *)&double v110 = v110;
                [(PBBProtoWarrantySentinel *)v28 setScale:v110];
                goto LABEL_115;
              default:
                goto LABEL_12;
            }
        }
      }
LABEL_12:
      v13 = [MEMORY[0x263EFF8F8] data];
      break;
  }
LABEL_20:
  v19 = (void *)[objc_alloc(MEMORY[0x263F4A228]) initWithProtobufData:v13 type:v4 isResponse:0];
  v20 = pbb_setupflow_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = PBBGMessageDescription(v4);
    *(_DWORD *)buf = 138412546;
    id v141 = v21;
    __int16 v142 = 2112;
    v143 = v19;
    _os_log_impl(&dword_21C445000, v20, OS_LOG_TYPE_DEFAULT, "Sending Protobuf (%@ -- %@)", buf, 0x16u);
  }
  v22 = [(PBBridgeIDSServiceDelegate *)self service];
  v23 = [(PBBridgeIDSServiceDelegate *)self sendProtoBuf:v19 service:v22 priority:300 responseIdentifier:0 expectsResponse:0 retryCount:-1 retryInterval:-1.0];

  v24 = pbb_setupflow_log();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v141 = v23;
    _os_log_impl(&dword_21C445000, v24, OS_LOG_TYPE_DEFAULT, "Got IDS identitifer: %@", buf, 0xCu);
  }

  if (v4 <= 0xF && ((1 << v4) & 0x8804) != 0 && PBIsInternalInstall())
  {
    v25 = (NSString *)[v23 copy];
    internalLastSendMessageID = self->_internalLastSendMessageID;
    self->_internalLastSendMessageID = v25;
  }
  return 0;
}

- (BOOL)_sendResponseToMessage:(id)a3 withResponseMessageID:(unsigned __int16)a4 withArguments:(id)a5
{
  uint64_t v5 = a4;
  uint64_t v22 = *MEMORY[0x263EF8340];
  objc_super v7 = (objc_class *)MEMORY[0x263F4A228];
  id v8 = a3;
  v9 = (void *)[[v7 alloc] initWithProtobufData:0 type:v5 isResponse:1];
  objc_super v10 = pbb_setupflow_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = PBBGMessageDescription(v5);
    int v18 = 138412546;
    v19 = v11;
    __int16 v20 = 2112;
    v21 = v9;
    _os_log_impl(&dword_21C445000, v10, OS_LOG_TYPE_DEFAULT, "Sending Response Protobuf (%@ -- %@)", (uint8_t *)&v18, 0x16u);
  }
  v12 = [(PBBridgeIDSServiceDelegate *)self service];
  v13 = [v8 context];

  v14 = [v13 outgoingResponseIdentifier];
  double v15 = [(PBBridgeIDSServiceDelegate *)self sendProtoBuf:v9 service:v12 priority:300 responseIdentifier:v14 expectsResponse:0 retryCount:-1 retryInterval:-1.0];

  double v16 = pbb_setupflow_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    v19 = v15;
    _os_log_impl(&dword_21C445000, v16, OS_LOG_TYPE_DEFAULT, "Message sent with IDS id: %@", (uint8_t *)&v18, 0xCu);
  }

  return 0;
}

- (BOOL)shouldHandleMessageType:(unsigned __int16)a3 fromId:(id)a4
{
  int v4 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  objc_super v7 = [(PBBridgeIDSServiceDelegate *)self service];
  id v8 = [v7 linkedDeviceForFromID:v6 withRelationship:3];

  if (!v8)
  {
    v9 = pbb_setupflow_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v10 = PBBCMessageDescription(v4);
      int v12 = 138412546;
      v13 = v10;
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_impl(&dword_21C445000, v9, OS_LOG_TYPE_DEFAULT, "Dropping stale message %@ received from: %{public}@", (uint8_t *)&v12, 0x16u);
    }
  }

  return v8 != 0;
}

- (void)getCompanionLanguage:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v14 = 609;
    __int16 v15 = 2080;
    uint64_t v16 = "-[PBBridgeCompanionController getCompanionLanguage:]";
    _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "%d %s", buf, 0x12u);
  }

  uint64_t v6 = [v4 type];
  objc_super v7 = [v4 context];

  id v8 = [v7 fromID];
  LODWORD(v6) = [(PBBridgeCompanionController *)self shouldHandleMessageType:v6 fromId:v8];

  if (v6)
  {
    v9 = [MEMORY[0x263EFF960] preferredLanguages];
    objc_super v10 = [v9 firstObject];

    int v12 = v10;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];
    [(PBBridgeCompanionController *)self _sendRemoteCommandWithMessageID:5 withArguments:v11];
  }
}

- (void)getCompanionRegion:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v13 = 621;
    __int16 v14 = 2080;
    __int16 v15 = "-[PBBridgeCompanionController getCompanionRegion:]";
    _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "%d %s", buf, 0x12u);
  }

  uint64_t v6 = [v4 type];
  objc_super v7 = [v4 context];

  id v8 = [v7 fromID];
  LODWORD(v6) = [(PBBridgeCompanionController *)self shouldHandleMessageType:v6 fromId:v8];

  if (v6)
  {
    v9 = [MEMORY[0x263EFF960] currentLocale];
    v11 = v9;
    objc_super v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:1];
    [(PBBridgeCompanionController *)self _sendRemoteCommandWithMessageID:6 withArguments:v10];
  }
}

- (void)gizmoBecameAvailableWantsConfirmation:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 type];
  uint64_t v6 = [v4 context];
  objc_super v7 = [v6 fromID];
  LODWORD(v5) = [(PBBridgeCompanionController *)self shouldHandleMessageType:v5 fromId:v7];

  if (v5)
  {
    id v8 = [PBBProtoBecameActive alloc];
    v9 = [v4 data];
    objc_super v10 = [(PBBProtoBecameActive *)v8 initWithData:v9];

    v11 = pbb_setupflow_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v19[0] = 67109378;
      v19[1] = 639;
      __int16 v20 = 2080;
      v21 = "-[PBBridgeCompanionController gizmoBecameAvailableWantsConfirmation:]";
      _os_log_impl(&dword_21C445000, v11, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)v19, 0x12u);
    }

    if ([(PBBProtoBecameActive *)v10 wantsConfirmation]) {
      [(PBBridgeCompanionController *)self _sendRemoteCommandWithMessageID:1 withArguments:&unk_26CCA1628];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained remoteDidBecomeAvailable];

    if (PBLogPerformanceMetrics())
    {
      int v13 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
      double Current = CFAbsoluteTimeGetCurrent();
      __int16 v15 = (objc_class *)objc_opt_class();
      uint64_t v16 = NSStringFromClass(v15);
      uint64_t v17 = [v4 context];
      int v18 = [v17 outgoingResponseIdentifier];
      [v13 addMilestone:v16 activityType:v18 activityIdentifier:Current];
    }
  }
}

- (void)getSiriState:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 type];
  uint64_t v6 = [v4 context];

  objc_super v7 = [v6 fromID];
  LODWORD(v5) = [(PBBridgeCompanionController *)self shouldHandleMessageType:v5 fromId:v7];

  if (v5)
  {
    id v8 = [MEMORY[0x263F53C50] sharedConnection];
    BOOL v9 = [v8 effectiveBoolValueForSetting:*MEMORY[0x263F53768]] != 0;

    objc_super v10 = [NSNumber numberWithBool:v9];
    v12[0] = v10;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    [(PBBridgeCompanionController *)self _sendRemoteCommandWithMessageID:7 withArguments:v11];
  }
}

- (void)enableSiriForGizmo:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  objc_super v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109378;
    v5[1] = 664;
    __int16 v6 = 2080;
    objc_super v7 = "-[PBBridgeCompanionController enableSiriForGizmo:]";
    _os_log_impl(&dword_21C445000, v3, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)v5, 0x12u);
  }

  id v4 = [MEMORY[0x263F53C50] sharedConnection];
  [v4 setBoolValue:1 forSetting:*MEMORY[0x263F53768]];
}

- (void)tellWatchLanguagesAndLocaleSupportingTermOfAddress:(BOOL)a3 withCompletion:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a4;
  objc_super v7 = pbb_setupflow_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v31 = "-[PBBridgeCompanionController tellWatchLanguagesAndLocaleSupportingTermOfAddress:withCompletion:]";
    _os_log_impl(&dword_21C445000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (self->_activationState == 6) {
    [(PBBridgeCompanionController *)self refreshTimeoutTimerWithNewActivationGranularState:6];
  }
  uint64_t v8 = [MEMORY[0x263EFF960] preferredLanguages];
  BOOL v9 = [MEMORY[0x263EFF960] currentLocale];
  objc_super v10 = [v9 localeIdentifier];

  v11 = [MEMORY[0x263EFF960] componentsFromLocaleIdentifier:v10];
  int v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263EFF4D0]];
  int v13 = [MEMORY[0x263EFF960] archivedPreferences];
  __int16 v14 = pbb_setupflow_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v13;
    _os_log_impl(&dword_21C445000, v14, OS_LOG_TYPE_DEFAULT, "archivedPreferences dictionary contains:\n%@", buf, 0xCu);
  }

  if (!a3)
  {
    __int16 v15 = [v13 objectForKey:@"ArchivedInflection"];

    if (v15)
    {
      uint64_t v16 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v13];
      [v16 removeObjectForKey:@"ArchivedInflection"];
      uint64_t v17 = [NSDictionary dictionaryWithDictionary:v16];

      int v18 = pbb_setup_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21C445000, v18, OS_LOG_TYPE_DEFAULT, "Pairing watch doesn't support term of address; removed ArchivedInflection key",
          buf,
          2u);
      }

      int v13 = (char *)v17;
    }
  }
  v19 = (void *)v8;
  if (v8)
  {
    if (v12) {
      goto LABEL_14;
    }
LABEL_20:
    v21 = pbb_setupflow_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[PBBridgeCompanionController tellWatchLanguagesAndLocaleSupportingTermOfAddress:withCompletion:]();
    }

    int v12 = &stru_26CC94B60;
    if (v13) {
      goto LABEL_26;
    }
    goto LABEL_23;
  }
  __int16 v20 = pbb_setupflow_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    -[PBBridgeCompanionController tellWatchLanguagesAndLocaleSupportingTermOfAddress:withCompletion:]();
  }

  v19 = (void *)MEMORY[0x263EFFA68];
  if (!v12) {
    goto LABEL_20;
  }
LABEL_14:
  if (!v13)
  {
LABEL_23:
    uint64_t v22 = pbb_setupflow_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[PBBridgeCompanionController tellWatchLanguagesAndLocaleSupportingTermOfAddress:withCompletion:]();
    }

    int v13 = (char *)MEMORY[0x263EFFA78];
    goto LABEL_26;
  }
  if (!v8)
  {
LABEL_26:
    getpid();
    v23 = NSString;
    v24 = [v19 firstObject];
    v25 = [v23 stringWithFormat:@"Error! Invalid Language/Locale/Region/archivedPreferences (%@/%@/%@/%@)", v24, v10, v12, v13];
    SimulateCrash();
  }
  v26 = (void *)MEMORY[0x21D4A74C0](v6);
  id languageLocaleCompletion = self->_languageLocaleCompletion;
  self->_id languageLocaleCompletion = v26;

  v29[0] = v19;
  v29[1] = v12;
  v29[2] = v13;
  v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:3];
  [(PBBridgeCompanionController *)self _sendRemoteCommandWithMessageID:25 withArguments:v28];
}

- (void)watchDidRespondWithLanguageAndLocaleStatus:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 type];
  id v6 = [v4 context];
  objc_super v7 = [v6 fromID];
  LODWORD(v5) = [(PBBridgeCompanionController *)self shouldHandleMessageType:v5 fromId:v7];

  if (v5)
  {
    uint64_t v8 = [PBBProtoTellCompanionLanguageAndLocaleChangeStatus alloc];
    BOOL v9 = [v4 data];
    objc_super v10 = [(PBBProtoTellCompanionLanguageAndLocaleChangeStatus *)v8 initWithData:v9];

    [(PBBProtoTellCompanionLanguageAndLocaleChangeStatus *)v10 status];
    uint64_t v12 = (int)v11;
    int v13 = pbb_setupflow_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = [NSNumber numberWithUnsignedShort:v12];
      *(_DWORD *)buf = 136315394;
      v19 = "-[PBBridgeCompanionController watchDidRespondWithLanguageAndLocaleStatus:]";
      __int16 v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_21C445000, v13, OS_LOG_TYPE_DEFAULT, "%s (Status: %@)", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __74__PBBridgeCompanionController_watchDidRespondWithLanguageAndLocaleStatus___block_invoke;
    v15[3] = &unk_2644018D8;
    objc_copyWeak(&v16, (id *)buf);
    __int16 v17 = v12;
    dispatch_async(MEMORY[0x263EF83A0], v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
}

void __74__PBBridgeCompanionController_watchDidRespondWithLanguageAndLocaleStatus___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    objc_super v3 = [WeakRetained languageLocaleCompletion];

    if (v3)
    {
      id v4 = [v6 languageLocaleCompletion];
      v4[2](v4, *(unsigned __int16 *)(a1 + 40));

      [v6 setLanguageLocaleCompletion:0];
    }
    uint64_t v5 = [MEMORY[0x263F1C408] sharedApplication];
    [v5 setIsLanguageAndLocaleFinished:1];

    id WeakRetained = v6;
  }
}

- (id)customDescriptionOfMessageType:(unsigned __int16)a3
{
  return PBBGMessageDescription(a3);
}

- (void)beganWaitingForPresentationOfActivationEvent
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  objc_super v3 = pbb_activation_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[PBBridgeCompanionController beganWaitingForPresentationOfActivationEvent]";
    _os_log_impl(&dword_21C445000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(PBBridgeCompanionController *)self invalidateTimeoutTimerWithNewActivationGranularState:6];
  [(PBBridgeCompanionController *)self _sendRemoteCommandWithMessageID:22 withArguments:MEMORY[0x263EFFA68]];
  PBNotifyClientOfActivity();
}

- (void)beganWaitingForUserResponseToActivationEvent
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  objc_super v3 = pbb_activation_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[PBBridgeCompanionController beganWaitingForUserResponseToActivationEvent]";
    _os_log_impl(&dword_21C445000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(PBBridgeCompanionController *)self refreshTimeoutTimerWithNewActivationGranularState:6];
  [(PBBridgeCompanionController *)self _sendRemoteCommandWithMessageID:23 withArguments:MEMORY[0x263EFFA68]];
  PBNotifyClientOfActivity();
}

- (void)gizmoDidBeginActivating:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = pbb_activation_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    __int16 v15 = "-[PBBridgeCompanionController gizmoDidBeginActivating:]";
    _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v14, 0xCu);
  }

  uint64_t v6 = [v4 type];
  objc_super v7 = [v4 context];
  uint64_t v8 = [v7 fromID];
  LODWORD(v6) = [(PBBridgeCompanionController *)self shouldHandleMessageType:v6 fromId:v8];

  if (v6)
  {
    [(PBBridgeCompanionController *)self refreshTimeoutTimerWithNewActivationGranularState:4];
    BOOL v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 postNotificationName:@"PBBridgeGizmoDidBeginActivatingNotification" object:0];

    if (PBLogPerformanceMetrics())
    {
      objc_super v10 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
      double Current = CFAbsoluteTimeGetCurrent();
      uint64_t v12 = [v4 context];
      int v13 = [v12 outgoingResponseIdentifier];
      [v10 addMilestone:@"GizmoDidBeginActivating" activityType:v13 activityIdentifier:Current];
    }
    PBNotifyClientOfActivity();
  }
}

- (void)gizmoDidFinishActivating:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = pbb_activation_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    uint64_t v16 = "-[PBBridgeCompanionController gizmoDidFinishActivating:]";
    _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v15, 0xCu);
  }

  uint64_t v6 = [v4 type];
  objc_super v7 = [v4 context];
  uint64_t v8 = [v7 fromID];
  LODWORD(v6) = [(PBBridgeCompanionController *)self shouldHandleMessageType:v6 fromId:v8];

  if (v6)
  {
    [(PBBridgeCompanionController *)self invalidateTimeoutTimerWithNewActivationGranularState:0xFFFFLL];
    if ([v4 type] == 21) {
      BOOL v9 = @"DeKOTA";
    }
    else {
      BOOL v9 = 0;
    }
    objc_super v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 postNotificationName:@"PBBridgeGizmoDidFinishActivatingNotification" object:v9];

    if (PBLogPerformanceMetrics())
    {
      double v11 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
      double Current = CFAbsoluteTimeGetCurrent();
      int v13 = [v4 context];
      int v14 = [v13 outgoingResponseIdentifier];
      [v11 addMilestone:@"GizmoDidFinishActivating" activityType:v14 activityIdentifier:Current];
    }
    PBNotifyClientOfActivity();
  }
}

- (void)gizmoActivationFailed:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = pbb_activation_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136315138;
    uint64_t v22 = "-[PBBridgeCompanionController gizmoActivationFailed:]";
    _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v21, 0xCu);
  }

  uint64_t v6 = [v4 type];
  objc_super v7 = [v4 context];
  uint64_t v8 = [v7 fromID];
  LODWORD(v6) = [(PBBridgeCompanionController *)self shouldHandleMessageType:v6 fromId:v8];

  if (v6)
  {
    BOOL v9 = [PBBProtoGizmoActivationFailed alloc];
    objc_super v10 = [v4 data];
    double v11 = [(PBBProtoGizmoActivationFailed *)v9 initWithData:v10];

    [(PBBridgeCompanionController *)self invalidateTimeoutTimerWithNewActivationGranularState:5];
    uint64_t v12 = [(PBBProtoGizmoActivationFailed *)v11 failureDescription];
    int v13 = pbb_activation_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[PBBridgeCompanionController gizmoActivationFailed:]();
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained remoteDidFailActivation:4 description:v12];

    if (PBLogPerformanceMetrics())
    {
      int v15 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
      double Current = CFAbsoluteTimeGetCurrent();
      uint64_t v17 = (objc_class *)objc_opt_class();
      int v18 = NSStringFromClass(v17);
      v19 = [v4 context];
      __int16 v20 = [v19 outgoingResponseIdentifier];
      [v15 addMilestone:v18 activityType:v20 activityIdentifier:Current];
    }
  }
}

- (void)handlePerformanceResults:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = pbb_activation_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v46 = "-[PBBridgeCompanionController handlePerformanceResults:]";
    _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  uint64_t v6 = [v4 type];
  objc_super v7 = [v4 context];
  uint64_t v8 = [v7 fromID];
  LODWORD(v6) = [(PBBridgeCompanionController *)self shouldHandleMessageType:v6 fromId:v8];

  if (v6)
  {
    uint64_t v34 = self;
    BOOL v9 = [PBBProtoTransferPerformanceResults alloc];
    objc_super v10 = [v4 data];
    double v11 = [(PBBProtoTransferPerformanceResults *)v9 initWithData:v10];

    uint64_t v12 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
    int v13 = [(PBBProtoTransferPerformanceResults *)v11 measures];
    [v12 setRemoteMeasurements:v13];

    int v14 = [MEMORY[0x263EFF9A0] dictionary];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    int v15 = [(PBBProtoTransferPerformanceResults *)v11 macroActivites];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v40 != v18) {
            objc_enumerationMutation(v15);
          }
          __int16 v20 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          int v21 = [v20 activityType];
          [v14 setObject:v20 forKey:v21];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v17);
    }

    [v12 setRemoteMacroActivities:v14];
    uint64_t v22 = [MEMORY[0x263EFF9A0] dictionary];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v33 = v11;
    uint64_t v23 = [(PBBProtoTransferPerformanceResults *)v11 milestones];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v36 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = *(void **)(*((void *)&v35 + 1) + 8 * j);
          v29 = [v28 identifier];
          [v22 setObject:v28 forKey:v29];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v25);
    }

    [v12 setRemoteMilestones:v22];
    [v12 endMonitorTransaction];
    id WeakRetained = objc_loadWeakRetained((id *)&v34->_delegate);
    char v31 = objc_opt_respondsToSelector();

    if (v31)
    {
      id v32 = objc_loadWeakRetained((id *)&v34->_delegate);
      [v32 didHandlePerformanceResults];
    }
  }
}

- (id)_connectionWithRequest:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = pbb_activation_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    double v11 = "-[PBBridgeCompanionController _connectionWithRequest:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "%s: Request (%@)", (uint8_t *)&v10, 0x16u);
  }

  uint64_t v6 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:1];
  [v4 setValue:@"WiFi" forHTTPHeaderField:@"X-iOS-Activation-Medium"];
  self->_connectionFailed = 0;
  objc_super v7 = (void *)[objc_alloc(MEMORY[0x263F08BA8]) _initWithRequest:v4 delegate:self usesCache:1 maxContentLength:0 startImmediately:1 connectionProperties:v6];
  p_sentSessionRequest = &self->_sentSessionRequest;
  if (!self->_sentSessionRequest
    || (p_sentSessionRequest = &self->_sentActivationRequest, !self->_sentActivationRequest))
  {
    BOOL *p_sentSessionRequest = 1;
  }

  return v7;
}

- (void)sendProxyActivationRequest:(id)a3
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 type];
  uint64_t v6 = [v4 context];
  objc_super v7 = [v6 fromID];
  LODWORD(v5) = [(PBBridgeCompanionController *)self shouldHandleMessageType:v5 fromId:v7];

  if (v5)
  {
    uint64_t v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
    char v9 = [v8 BOOLForKey:@"__SkipReachabilityChecks"];

    if (v9)
    {
      int v10 = pbb_activation_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[PBBridgeCompanionController sendProxyActivationRequest:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
LABEL_38:

      PBNotifyClientOfActivity();
      goto LABEL_39;
    }
    uint64_t v18 = [PBBProtoProxyActivationFetch alloc];
    v19 = [v4 data];
    int v10 = [(PBBProtoProxyActivationFetch *)v18 initWithData:v19];

    if (PBLogPerformanceMetrics())
    {
      __int16 v20 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
      double Current = CFAbsoluteTimeGetCurrent();
      uint64_t v22 = (objc_class *)objc_opt_class();
      uint64_t v23 = NSStringFromClass(v22);
      uint64_t v24 = [v4 context];
      uint64_t v25 = [v24 outgoingResponseIdentifier];
      [v20 addMilestone:v23 activityType:v25 activityIdentifier:Current];

      uint64_t v26 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
      [v26 endMacroActivity:@"PBBridgeProxyActivationStageOneActivityName" beginTime:CFAbsoluteTimeGetCurrent()];
      double v28 = v27;

      +[PBBridgeCAReporter pushTimingType:2 withValue:v28];
      v29 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
      [v29 beginMacroActivity:@"PBBridgeProxyActivationStageTwoActivityName" beginTime:CFAbsoluteTimeGetCurrent()];
    }
    v30 = [v10 request];

    BOOL v31 = v30 == 0;
    id v32 = pbb_activation_log();
    uint64_t v33 = v32;
    if (v31)
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[PBBridgeCompanionController sendProxyActivationRequest:]();
      }

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained remoteDidFailActivation:4 description:@"Gizmo Sent nil Activation Data"];

      goto LABEL_38;
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v34 = [v10 request];
      *(_DWORD *)buf = 136315394;
      v74 = "-[PBBridgeCompanionController sendProxyActivationRequest:]";
      __int16 v75 = 2048;
      uint64_t v76 = [v34 length];
      _os_log_impl(&dword_21C445000, v33, OS_LOG_TYPE_DEFAULT, "%s request length (%ld bytes)", buf, 0x16u);
    }
    id v35 = objc_alloc(MEMORY[0x263F08928]);
    long long v36 = [v10 request];
    id v72 = 0;
    long long v37 = (void *)[v35 initForReadingFromData:v36 error:&v72];
    long long v38 = (char *)v72;

    if (v38)
    {
      long long v39 = pbb_activation_log();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        long long v40 = v39;
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          v65 = [v10 request];
          uint64_t v66 = [v65 length];
          *(_DWORD *)buf = 138412546;
          v74 = v38;
          __int16 v75 = 2048;
          uint64_t v76 = v66;
          _os_log_error_impl(&dword_21C445000, v40, OS_LOG_TYPE_ERROR, "Error (%@) decoding request (%ld bytes)", buf, 0x16u);
        }
      }
    }
    long long v41 = [v37 decodeObjectOfClass:objc_opt_class() forKey:@"PBBridgeActivationRequestKey"];
    long long v42 = (NSMutableURLRequest *)[v41 copy];
    activationRequest = self->_activationRequest;
    self->_activationRequest = v42;

    if (self->_activationRequest
      || ([v37 error],
          uint64_t v58 = objc_claimAutoreleasedReturnValue(),
          BOOL v59 = v58 == 0,
          v58,
          v59))
    {
      v44 = pbb_activation_log();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v45 = self->_activationRequest;
        *(_DWORD *)buf = 138543362;
        v74 = (const char *)v45;
        _os_log_impl(&dword_21C445000, v44, OS_LOG_TYPE_DEFAULT, "Activation Request %{public}@", buf, 0xCu);
      }

      [v37 finishDecoding];
      v46 = [(NSMutableURLRequest *)self->_activationRequest valueForHTTPHeaderField:@"User-Agent"];
      uint64_t v47 = (NSString *)[v46 copy];
      remoteActivationUserAgent = self->_remoteActivationUserAgent;
      self->_remoteActivationUserAgent = v47;

      if (PBIsInternalInstall()
        && [(PBBridgeCompanionController *)self _dumpActivationRequests])
      {
        objc_msgSend(NSString, "stringWithFormat:", @"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Bridge-Activation-Request-%f.txt", CFAbsoluteTimeGetCurrent());
        v70 = (char *)objc_claimAutoreleasedReturnValue();
        v49 = NSString;
        v50 = [(NSMutableURLRequest *)self->_activationRequest URL];
        v51 = [(NSMutableURLRequest *)self->_activationRequest allHTTPHeaderFields];
        id v52 = [NSString alloc];
        v53 = [(NSMutableURLRequest *)self->_activationRequest HTTPBody];
        v54 = (void *)[v52 initWithData:v53 encoding:4];
        v55 = [v49 stringWithFormat:@"%@\n%@\n%@", v50, v51, v54];

        [v55 writeToFile:v70 atomically:1 encoding:4 error:0];
        uint64_t v56 = pbb_activation_log();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v74 = v70;
          _os_log_impl(&dword_21C445000, v56, OS_LOG_TYPE_DEFAULT, "Writing Activation Request to %@", buf, 0xCu);
        }
      }
      if (self->_activationRequest)
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __58__PBBridgeCompanionController_sendProxyActivationRequest___block_invoke;
        block[3] = &unk_2644011C8;
        block[4] = self;
        dispatch_async(MEMORY[0x263EF83A0], block);
      }
      else
      {
        v63 = pbb_activation_log();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
          -[PBBridgeCompanionController sendProxyActivationRequest:]();
        }

        id v64 = objc_loadWeakRetained((id *)&self->_delegate);
        [v64 remoteDidFailActivation:4 description:@"Decoded request from Gizmo is nil"];
      }
      goto LABEL_38;
    }
    uint64_t v60 = pbb_activation_log();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      v61 = v60;
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        v67 = [v37 error];
        uint64_t v68 = [v10 request];
        uint64_t v69 = [v68 length];
        *(_DWORD *)buf = 138543618;
        v74 = v67;
        __int16 v75 = 2048;
        uint64_t v76 = v69;
        _os_log_error_impl(&dword_21C445000, v61, OS_LOG_TYPE_ERROR, "Decoding error (%{public}@) while decoding request (%ld bytes)", buf, 0x16u);
      }
    }

    id v62 = objc_loadWeakRetained((id *)&self->_delegate);
    [v62 remoteDidFailActivation:4 description:@"Exception decoding request from Gizmo"];
  }
LABEL_39:
}

void __58__PBBridgeCompanionController_sendProxyActivationRequest___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = pbb_activation_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 120);
    int v11 = 138412290;
    uint64_t v12 = v3;
    _os_log_impl(&dword_21C445000, v2, OS_LOG_TYPE_DEFAULT, "Sending Proxy Activation: (%@)", (uint8_t *)&v11, 0xCu);
  }

  *(_DWORD *)(*(void *)(a1 + 32) + 76) = 1;
  [*(id *)(a1 + 32) refreshTimeoutTimerWithNewActivationGranularState:2];
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 68))
  {
    uint64_t v5 = (void *)MEMORY[0x263F08BD8];
    uint64_t v6 = [*(id *)(v4 + 120) URL];
    objc_super v7 = [v6 host];
    [v5 setAllowsAnyHTTPSCertificate:1 forHost:v7];

    uint64_t v4 = *(void *)(a1 + 32);
  }
  uint64_t v8 = [(id)v4 _connectionWithRequest:*(void *)(v4 + 120)];
  uint64_t v9 = *(void *)(a1 + 32);
  int v10 = *(void **)(v9 + 112);
  *(void *)(v9 + 112) = v8;
}

- (BOOL)_dumpActivationRequests
{
  return CFPreferencesGetAppBooleanValue(@"PBDumpActivationRequests", @"com.apple.Bridge", 0) != 0;
}

- (void)sendProxyActivationWithCustomRequest:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    if ((__int16)self->_granularActivationState == -1)
    {
      id WeakRetained = pbb_activation_log();
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21C445000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Custom Activation Request was issued after Watch was already activated. Dropping it on the floor.", buf, 2u);
      }
    }
    else
    {
      self->_awaitingCustomResponse = 1;
      uint64_t v6 = (NSMutableURLRequest *)[v4 mutableCopy];
      activationRequest = self->_activationRequest;
      self->_activationRequest = v6;

      [v5 setValue:self->_remoteActivationUserAgent forHTTPHeaderField:@"User-Agent"];
      if (PBIsInternalInstall()
        && [(PBBridgeCompanionController *)self _dumpActivationRequests])
      {
        uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Bridge-BuddyML-CustomRequest-%f.txt", CFAbsoluteTimeGetCurrent());
        uint64_t v9 = NSString;
        int v10 = [v5 URL];
        int v11 = [v5 allHTTPHeaderFields];
        id v12 = [NSString alloc];
        uint64_t v13 = [v5 HTTPBody];
        uint64_t v14 = (void *)[v12 initWithData:v13 encoding:4];
        uint64_t v15 = [v9 stringWithFormat:@"%@\n%@\n%@", v10, v11, v14];

        [v15 writeToFile:v8 atomically:1 encoding:4 error:0];
        uint64_t v16 = pbb_activation_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v23 = v8;
          _os_log_impl(&dword_21C445000, v16, OS_LOG_TYPE_DEFAULT, "Writing BuddyML Custom Request to %@", buf, 0xCu);
        }
      }
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __68__PBBridgeCompanionController_sendProxyActivationWithCustomRequest___block_invoke;
      block[3] = &unk_264401470;
      __int16 v20 = v5;
      int v21 = self;
      dispatch_async(MEMORY[0x263EF83A0], block);
      id WeakRetained = v20;
    }
  }
  else
  {
    uint64_t v18 = pbb_activation_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[PBBridgeCompanionController sendProxyActivationWithCustomRequest:]();
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained remoteDidFailActivation:4 description:@"Gizmo Sent nil Activation Data"];
  }

  PBNotifyClientOfActivity();
}

void __68__PBBridgeCompanionController_sendProxyActivationWithCustomRequest___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = pbb_activation_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v11 = 136315394;
    id v12 = "-[PBBridgeCompanionController sendProxyActivationWithCustomRequest:]_block_invoke";
    __int16 v13 = 2112;
    uint64_t v14 = v3;
    _os_log_impl(&dword_21C445000, v2, OS_LOG_TYPE_DEFAULT, "%s: Sending Proxy Activation Custom Request (%@)", (uint8_t *)&v11, 0x16u);
  }

  *(_DWORD *)(*(void *)(a1 + 40) + 76) = 1;
  [*(id *)(a1 + 40) refreshTimeoutTimerWithNewActivationGranularState:2];
  id v4 = *(unsigned char **)(a1 + 40);
  if (v4[68])
  {
    uint64_t v5 = (void *)MEMORY[0x263F08BD8];
    uint64_t v6 = [*(id *)(a1 + 32) URL];
    objc_super v7 = [v6 host];
    [v5 setAllowsAnyHTTPSCertificate:1 forHost:v7];

    id v4 = *(unsigned char **)(a1 + 40);
  }
  uint64_t v8 = [v4 _connectionWithRequest:*(void *)(a1 + 32)];
  uint64_t v9 = *(void *)(a1 + 40);
  int v10 = *(void **)(v9 + 112);
  *(void *)(v9 + 112) = v8;
}

- (unsigned)_testActivationResponseType
{
  return CFPreferencesGetAppIntegerValue(@"PBTestActivationType", @"com.apple.Bridge", 0);
}

- (void)connectionDidFinishLoading:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (self->_activationConnection != a3) {
    return;
  }
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:@"PBBridgeActivationServerRespondedNotification" object:0];

  unsigned int v5 = [(PBBridgeCompanionController *)self _testActivationResponseType];
  if (v5)
  {
    uint64_t v6 = pbb_activation_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (v5 > 5) {
        objc_super v7 = &stru_26CC94B60;
      }
      else {
        objc_super v7 = off_264401948[(__int16)(v5 - 1)];
      }
      *(_DWORD *)buf = 138412290;
      id v35 = v7;
      _os_log_impl(&dword_21C445000, v6, OS_LOG_TYPE_DEFAULT, "Testing Fake Activation Response Type: %@", buf, 0xCu);
    }

    _ResponseDataForTestType(v5);
    uint64_t v8 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
    activationData = self->_activationData;
    self->_activationData = v8;
  }
  int v10 = (void *)[[NSString alloc] initWithData:self->_activationData encoding:4];
  contentType = self->_contentType;
  if (contentType) {
    BOOL v12 = [(NSString *)contentType isEqualToString:@"application/x-buddyml"];
  }
  else {
    BOOL v12 = [v10 rangeOfString:@"<xmlui"] != 0x7FFFFFFFFFFFFFFFLL;
  }
  if (PBIsInternalInstall()
    && [(PBBridgeCompanionController *)self _dumpActivationRequests])
  {
    objc_msgSend(NSString, "stringWithFormat:", @"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Bridge-Activation-Response-Data-%f.txt", CFAbsoluteTimeGetCurrent());
    __int16 v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = (void *)[[NSString alloc] initWithData:self->_activationData encoding:4];
    [v14 writeToFile:v13 atomically:1 encoding:4 error:0];

    uint64_t v15 = pbb_activation_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v13;
      _os_log_impl(&dword_21C445000, v15, OS_LOG_TYPE_DEFAULT, "Writing Activation Response Data to %@", buf, 0xCu);
    }
  }
  BOOL v16 = !v12;
  if (v5) {
    BOOL v16 = 0;
  }
  if (!v16)
  {
    self->_nonSilentActivation = 1;
    if ((self->_activationState | 4) == 7)
    {
      uint64_t v17 = pbb_activation_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v18 = "ActivationStateNotSilentPOSTActivation";
LABEL_29:
        _os_log_impl(&dword_21C445000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 2u);
      }
    }
    else
    {
      uint64_t v17 = pbb_activation_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v18 = "ActivationStateNotSilentPREActivation";
        goto LABEL_29;
      }
    }

    [(PBBridgeCompanionController *)self invalidateTimeoutTimerWithNewActivationGranularState:6];
    ruiLoader = self->_ruiLoader;
    if (ruiLoader)
    {
      [(RUILoader *)ruiLoader cancel];
      [(RUILoader *)self->_ruiLoader setDelegate:0];
    }
    uint64_t v25 = (RUILoader *)objc_alloc_init(MEMORY[0x263F63790]);
    uint64_t v26 = self->_ruiLoader;
    self->_ruiLoader = v25;

    [(RUILoader *)self->_ruiLoader setStyle:self->_remoteUIStyle];
    [(RUILoader *)self->_ruiLoader setDelegate:self];
    double v27 = self->_ruiLoader;
    double v28 = self->_activationData;
    v29 = [(NSMutableURLRequest *)self->_activationRequest URL];
    [(RUILoader *)v27 loadXMLUIWithData:v28 baseURL:v29];

    goto LABEL_37;
  }
  int activationState = self->_activationState;
  if (activationState == 6 || activationState == 1)
  {
    __int16 v20 = pbb_activation_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v21 = "ActivationStateTryActivate";
      uint64_t v22 = v20;
      uint32_t v23 = 2;
LABEL_35:
      _os_log_impl(&dword_21C445000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
    }
  }
  else
  {
    __int16 v20 = pbb_activation_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = self->_activationState;
      *(_DWORD *)buf = 67109120;
      LODWORD(v35) = v30;
      int v21 = "Unhandled Activation State %d";
      uint64_t v22 = v20;
      uint32_t v23 = 8;
      goto LABEL_35;
    }
  }

  [(PBBridgeCompanionController *)self _processActivationData];
LABEL_37:
  if (self->_awaitingCustomResponse
    && PBIsInternalInstall()
    && [(PBBridgeCompanionController *)self _dumpActivationRequests])
  {
    objc_msgSend(NSString, "stringWithFormat:", @"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Bridge-BuddyML-CustomReponse-%f.txt", CFAbsoluteTimeGetCurrent());
    BOOL v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v32 = (void *)[[NSString alloc] initWithData:self->_activationData encoding:4];
    [v32 writeToFile:v31 atomically:1 encoding:4 error:0];

    uint64_t v33 = pbb_activation_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v31;
      _os_log_impl(&dword_21C445000, v33, OS_LOG_TYPE_DEFAULT, "Writing BuddyML Custom Response to %@", buf, 0xCu);
    }
  }
  self->_awaitingCustomResponse = 0;
}

- (id)viewControllerForAlertPresentation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v3 = [WeakRetained navigationController];

  return v3;
}

- (void)loader:(id)a3 didFailWithError:(id)a4
{
  p_ruiDelegate = &self->_ruiDelegate;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_ruiDelegate);
  [WeakRetained loader:v8 didFailWithError:v7];

  if (v7)
  {
    int v10 = (void *)[[NSString alloc] initWithData:self->_activationData encoding:4];
    int v11 = pbb_setupflow_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PBBridgeCompanionController loader:didFailWithError:]();
    }
  }
}

- (void)loader:(id)a3 receivedObjectModel:(id)a4 actionSignal:(unint64_t)a5
{
  p_ruiDelegate = &self->_ruiDelegate;
  id v8 = a4;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_ruiDelegate);
  [WeakRetained loader:v9 receivedObjectModel:v8 actionSignal:a5];
}

- (void)loader:(id)a3 didReceiveHTTPResponse:(id)a4
{
  p_ruiDelegate = &self->_ruiDelegate;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_ruiDelegate);
  [WeakRetained loader:v7 didReceiveHTTPResponse:v6];
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a4;
  self->_awaitingCustomResponse = 0;
  id v6 = pbb_activation_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[PBBridgeCompanionController connection:didFailWithError:]((uint64_t)v5, v6);
  }

  if (self->_activationState != 4)
  {
    self->_connectionFailed = 1;
    if ((self->_activationState | 4) == 7)
    {
      id v7 = pbb_activation_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[PBBridgeCompanionController connection:didFailWithError:]();
      }
    }
    else
    {
      id v7 = pbb_activation_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[PBBridgeCompanionController connection:didFailWithError:]();
      }
    }
  }
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    uint64_t v8 = PBUserCorrectableNetworkError([v5 code]);
  }
  else {
    uint64_t v8 = 0;
  }
  if (self->_activationRetries <= 0)
  {
    int v11 = pbb_activation_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      activationRequest = self->_activationRequest;
      *(_DWORD *)buf = 138412290;
      BOOL v16 = activationRequest;
      _os_log_impl(&dword_21C445000, v11, OS_LOG_TYPE_DEFAULT, "Retrying activation due to correctable failure: %@", buf, 0xCu);
    }

    __int16 v13 = [(PBBridgeCompanionController *)self _connectionWithRequest:self->_activationRequest];
    activationConnection = self->_activationConnection;
    self->_activationConnection = v13;

    ++self->_activationRetries;
  }
  else
  {
    [(PBBridgeCompanionController *)self _processActivationData];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int v10 = [NSString stringWithFormat:@"Proxy Activation Request Failed: (%@)", v5];
    [WeakRetained remoteDidFailActivation:5 description:v10 userActionable:v8];
  }
}

- (id)connection:(id)a3 willSendRequest:(id)a4 redirectResponse:(id)a5
{
  uint64_t v8 = (NSURLConnection *)a3;
  id v9 = (NSMutableURLRequest *)a4;
  id v10 = a5;
  int v11 = pbb_activation_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[PBBridgeCompanionController connection:willSendRequest:redirectResponse:]((uint64_t)v9, (uint64_t)self, v11);
  }

  if (v10)
  {
    if ([v10 statusCode] == 302)
    {
      activationRequest = self->_activationRequest;
      if (activationRequest)
      {
        __int16 v13 = [(NSMutableURLRequest *)activationRequest HTTPBody];

        if (v13)
        {
          uint64_t v14 = (NSMutableURLRequest *)[(NSMutableURLRequest *)v9 mutableCopy];
          [(NSMutableURLRequest *)v14 setHTTPMethod:@"POST"];
          uint64_t v15 = [(NSMutableURLRequest *)self->_activationRequest valueForHTTPHeaderField:@"Content-Type"];
          [(NSMutableURLRequest *)v14 setValue:v15 forHTTPHeaderField:@"Content-Type"];

          BOOL v16 = [(NSMutableURLRequest *)self->_activationRequest valueForHTTPHeaderField:@"Content-Length"];
          [(NSMutableURLRequest *)v14 setValue:v16 forHTTPHeaderField:@"Content-Length"];

          uint64_t v17 = [(NSMutableURLRequest *)self->_activationRequest HTTPBody];
          [(NSMutableURLRequest *)v14 setHTTPBody:v17];

          id v9 = v14;
        }
      }
    }
  }
  if (self->_activationConnection == v8 && self->_activationRequest != v9)
  {
    uint64_t v18 = (NSMutableURLRequest *)[(NSMutableURLRequest *)v9 mutableCopy];
    v19 = self->_activationRequest;
    self->_activationRequest = v18;
  }
  return v9;
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = pbb_activation_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)long long v39 = 1237;
    *(_WORD *)&v39[4] = 2080;
    *(void *)&v39[6] = "-[PBBridgeCompanionController connection:didReceiveResponse:]";
    __int16 v40 = 2112;
    id v41 = v5;
    _os_log_impl(&dword_21C445000, v6, OS_LOG_TYPE_DEFAULT, "%d %s -- %@", buf, 0x1Cu);
  }

  uint64_t v7 = [v5 statusCode];
  self->_activationRetries = 0;
  if (PBIsInternalInstall()
    && [(PBBridgeCompanionController *)self _dumpActivationRequests])
  {
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Bridge-Activation-Response-%f.txt", CFAbsoluteTimeGetCurrent());
    id v9 = NSString;
    id v10 = [v5 URL];
    int v11 = [NSNumber numberWithInteger:v7];
    BOOL v12 = [v5 allHeaderFields];
    __int16 v13 = [v9 stringWithFormat:@"%@\n%@\n%@", v10, v11, v12];

    long long v37 = v13;
    [v13 writeToFile:v8 atomically:1 encoding:4 error:0];
    uint64_t v14 = pbb_activation_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)long long v39 = v8;
      _os_log_impl(&dword_21C445000, v14, OS_LOG_TYPE_DEFAULT, "Writing Activation Response to %@", buf, 0xCu);
    }

    uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Bridge-Activation-Request-%f.txt", CFAbsoluteTimeGetCurrent());
    BOOL v16 = NSString;
    uint64_t v17 = [(NSMutableURLRequest *)self->_activationRequest URL];
    uint64_t v18 = [(NSMutableURLRequest *)self->_activationRequest allHTTPHeaderFields];
    id v19 = [NSString alloc];
    __int16 v20 = [(NSMutableURLRequest *)self->_activationRequest HTTPBody];
    int v21 = (void *)[v19 initWithData:v20 encoding:4];
    uint64_t v22 = [v16 stringWithFormat:@"%@%@\n%@", v17, v18, v21];

    [v22 writeToFile:v15 atomically:1 encoding:4 error:0];
    uint32_t v23 = pbb_activation_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)long long v39 = v15;
      _os_log_impl(&dword_21C445000, v23, OS_LOG_TYPE_DEFAULT, "Writing Activation Request to %@", buf, 0xCu);
    }
  }
  if (v7 < 400) {
    goto LABEL_18;
  }
  uint64_t v24 = pbb_activation_log();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    -[PBBridgeCompanionController connection:didReceiveResponse:](v7, v24);
  }

  if (!self->_sentActivationRequest)
  {
    BOOL v31 = pbb_activation_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C445000, v31, OS_LOG_TYPE_DEFAULT, "Passing Session failure to MA for fallback.", buf, 2u);
    }

LABEL_18:
    id v32 = (NSMutableData *)objc_alloc_init(MEMORY[0x263EFF990]);
    activationData = self->_activationData;
    self->_activationData = v32;

    uint64_t v34 = [v5 allHeaderFields];
    allHeaders = self->_allHeaders;
    self->_allHeaders = v34;

    id WeakRetained = [(NSDictionary *)self->_allHeaders objectForKey:@"Content-Type"];
    uint64_t v36 = (NSString *)[WeakRetained copy];
    contentType = self->_contentType;
    self->_contentType = v36;
    goto LABEL_19;
  }
  [(NSURLConnection *)self->_activationConnection cancel];
  activationConnection = self->_activationConnection;
  self->_activationConnection = 0;

  activationRequest = self->_activationRequest;
  self->_activationRequest = 0;

  double v27 = self->_contentType;
  self->_contentType = 0;

  double v28 = self->_activationData;
  self->_activationData = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  contentType = objc_msgSend(NSString, "stringWithFormat:", @"Activation Failed with Status: %d", v7);
  [WeakRetained remoteDidFailActivation:7 description:contentType];
LABEL_19:
}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = (NSURLConnection *)a3;
  uint64_t v8 = pbb_activation_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    uint64_t v14 = "-[PBBridgeCompanionController connection:didReceiveData:]";
    __int16 v15 = 2048;
    uint64_t v16 = [v6 length];
    _os_log_impl(&dword_21C445000, v8, OS_LOG_TYPE_DEFAULT, "%s: Bytes received %lu", (uint8_t *)&v13, 0x16u);
  }

  activationConnection = self->_activationConnection;
  if (activationConnection == v7)
  {
    [(PBBridgeCompanionController *)self refreshTimeoutTimerWithNewActivationGranularState:3];
    activationData = self->_activationData;
    if (activationData)
    {
      [(NSMutableData *)activationData appendData:v6];
    }
    else
    {
      int v11 = (NSMutableData *)[objc_alloc(MEMORY[0x263EFF990]) initWithData:v6];
      BOOL v12 = self->_activationData;
      self->_activationData = v11;
    }
  }
}

- (void)_processActivationData
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[PBBridgeCompanionController _processActivationData]";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl(&dword_21C445000, a2, OS_LOG_TYPE_ERROR, "%s request to send activation data before NR is in correct compatibility state: %hu", (uint8_t *)&v2, 0x12u);
}

- (void)_cleanup
{
  self->_nonSilentActivation = 0;
  [(NSURLConnection *)self->_activationConnection cancel];
  activationConnection = self->_activationConnection;
  self->_activationConnection = 0;

  activationRequest = self->_activationRequest;
  self->_activationRequest = 0;

  contentType = self->_contentType;
  self->_contentType = 0;

  activationData = self->_activationData;
  self->_activationData = 0;

  self->_activationRetries = 0;
}

- (void)objectModel:(id)a3 pressedButton:(id)a4 attributes:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = pbb_setupflow_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412802;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    __int16 v16 = 2112;
    id v17 = v10;
    _os_log_impl(&dword_21C445000, v11, OS_LOG_TYPE_DEFAULT, "Pressed RUI Button... (RUIObjectModel %@, buttonName %@, attributes %@)", (uint8_t *)&v12, 0x20u);
  }

  [(PBBridgeCompanionController *)self tellGizmoToBeginActivation];
}

- (void)gizmoDidEndPasscodeCreation:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 type];
  uint64_t v6 = [v4 context];
  uint64_t v7 = [v6 fromID];
  LODWORD(v5) = [(PBBridgeCompanionController *)self shouldHandleMessageType:v5 fromId:v7];

  if (v5)
  {
    id v8 = [PBBProtoDidEndPasscodeCreation alloc];
    id v9 = [v4 data];
    id v10 = [(PBBProtoDidEndPasscodeCreation *)v8 initWithData:v9];

    self->_BOOL passcodeSet = [(PBBProtoDidEndPasscodeCreation *)v10 success];
    BOOL v11 = [(PBBProtoDidEndPasscodeCreation *)v10 isLong];
    if (v11)
    {
      int v12 = [MEMORY[0x263F1C408] sharedApplication];
      id v13 = [v12 activeWatch];

      __int16 v14 = [v13 valueForProperty:*MEMORY[0x263F57620]];
      id v15 = [v13 valueForProperty:*MEMORY[0x263F575E8]];
      __int16 v16 = (void *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.nanosystemsettings" pairingID:v14 pairingDataStore:v15];
      [v16 setBool:0 forKey:@"simple-passcode"];
      id v17 = (id)[v16 synchronize];
    }
    uint64_t v18 = pbb_setupflow_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      BOOL passcodeSet = self->_passcodeSet;
      v27[0] = 67109890;
      v27[1] = 1385;
      __int16 v28 = 2080;
      v29 = "-[PBBridgeCompanionController gizmoDidEndPasscodeCreation:]";
      __int16 v30 = 1024;
      BOOL v31 = passcodeSet;
      __int16 v32 = 1024;
      BOOL v33 = v11;
      _os_log_impl(&dword_21C445000, v18, OS_LOG_TYPE_DEFAULT, "%d %s (Enabled Passcode: %d, is long: %d)", (uint8_t *)v27, 0x1Eu);
    }

    __int16 v20 = [MEMORY[0x263F08A00] defaultCenter];
    [v20 postNotificationName:@"PBBridgeDidCompletePasscodeCreationNotification" object:0];

    if (PBLogPerformanceMetrics())
    {
      int v21 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
      double Current = CFAbsoluteTimeGetCurrent();
      uint32_t v23 = (objc_class *)objc_opt_class();
      uint64_t v24 = NSStringFromClass(v23);
      uint64_t v25 = [v4 context];
      uint64_t v26 = [v25 outgoingResponseIdentifier];
      [v21 addMilestone:v24 activityType:v26 activityIdentifier:Current];
    }
    PBNotifyClientOfActivity();
  }
}

- (void)gizmoFailedToCreatePasscode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  uint64_t v6 = [v4 context];
  uint64_t v7 = [v6 fromID];
  LODWORD(self) = [(PBBridgeCompanionController *)self shouldHandleMessageType:v5 fromId:v7];

  if (self)
  {
    id v8 = [PBBProtoDidFailToCreatePasscode alloc];
    id v9 = [v4 data];
    id v10 = [(PBBProtoDidFailToCreatePasscode *)v8 initWithData:v9];

    int v11 = [(PBBProtoDidFailToCreatePasscode *)v10 error];
    int v12 = pbb_setupflow_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[PBBridgeCompanionController gizmoFailedToCreatePasscode:](v11, v12);
    }

    id v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 postNotificationName:@"PBBridgeDidFailToCreatePasscodeNotification" object:0];

    PBNotifyClientOfActivity();
  }
}

- (void)gizmoDidEndPasscodeChange:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 type];
  uint64_t v6 = [v4 context];
  uint64_t v7 = [v6 fromID];
  LODWORD(v5) = [(PBBridgeCompanionController *)self shouldHandleMessageType:v5 fromId:v7];

  if (v5)
  {
    id v8 = [PBBProtoDidEndPasscodeCreation alloc];
    id v9 = [v4 data];
    id v10 = [(PBBProtoDidEndPasscodeCreation *)v8 initWithData:v9];

    self->_BOOL passcodeSet = [(PBBProtoDidEndPasscodeCreation *)v10 success];
    BOOL v11 = [(PBBProtoDidEndPasscodeCreation *)v10 isLong];
    if (v11)
    {
      int v12 = [MEMORY[0x263F1C408] sharedApplication];
      id v13 = [v12 activeWatch];

      __int16 v14 = [v13 valueForProperty:*MEMORY[0x263F57620]];
      id v15 = [v13 valueForProperty:*MEMORY[0x263F575E8]];
      __int16 v16 = (void *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.nanosystemsettings" pairingID:v14 pairingDataStore:v15];
      [v16 setBool:0 forKey:@"simple-passcode"];
      id v17 = (id)[v16 synchronize];
    }
    uint64_t v18 = pbb_setupflow_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      BOOL passcodeSet = self->_passcodeSet;
      v27[0] = 67109890;
      v27[1] = 1434;
      __int16 v28 = 2080;
      v29 = "-[PBBridgeCompanionController gizmoDidEndPasscodeChange:]";
      __int16 v30 = 1024;
      BOOL v31 = passcodeSet;
      __int16 v32 = 1024;
      BOOL v33 = v11;
      _os_log_impl(&dword_21C445000, v18, OS_LOG_TYPE_DEFAULT, "%d %s (Enabled Passcode: %d, is long: %d)", (uint8_t *)v27, 0x1Eu);
    }

    __int16 v20 = [MEMORY[0x263F08A00] defaultCenter];
    [v20 postNotificationName:@"PBBridgeDidCompletePasscodeChangeNotification" object:0];

    if (PBLogPerformanceMetrics())
    {
      int v21 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
      double Current = CFAbsoluteTimeGetCurrent();
      uint32_t v23 = (objc_class *)objc_opt_class();
      uint64_t v24 = NSStringFromClass(v23);
      uint64_t v25 = [v4 context];
      uint64_t v26 = [v25 outgoingResponseIdentifier];
      [v21 addMilestone:v24 activityType:v26 activityIdentifier:Current];
    }
    PBNotifyClientOfActivity();
  }
}

- (void)gizmoDidBeginUnlockPairing:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v13 = 1447;
    __int16 v14 = 2080;
    id v15 = "-[PBBridgeCompanionController gizmoDidBeginUnlockPairing:]";
    _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "%d %s", buf, 0x12u);
  }

  uint64_t v6 = [v4 type];
  uint64_t v7 = [v4 context];

  id v8 = [v7 fromID];
  LODWORD(v6) = [(PBBridgeCompanionController *)self shouldHandleMessageType:v6 fromId:v8];

  if (v6)
  {
    unlockPairingAssertion = self->_unlockPairingAssertion;
    if (unlockPairingAssertion) {
      CFRelease(unlockPairingAssertion);
    }
    v10[0] = @"MKBAssertionKey";
    v10[1] = @"MKBAssertionTimeout";
    v11[0] = @"RemoteProfile";
    v11[1] = &unk_26CCA15F8;
    [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
    self->_unlockPairingAssertion = (__MKBAssertion *)MKBDeviceLockAssertion();
  }
}

- (void)gizmoDidEndUnlockPairing:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 type];
  uint64_t v6 = [v4 context];
  uint64_t v7 = [v6 fromID];
  LODWORD(v5) = [(PBBridgeCompanionController *)self shouldHandleMessageType:v5 fromId:v7];

  if (v5)
  {
    id v8 = [PBBProtoDidMakeAutoLockChoice alloc];
    id v9 = [v4 data];
    id v10 = [(PBBProtoDidMakeAutoLockChoice *)v8 initWithData:v9];

    self->_selectedPairedUnlocuint64_t k = [(PBBProtoDidMakeAutoLockChoice *)v10 accept];
    BOOL v11 = pbb_setupflow_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      selectedPairedUnlocuint64_t k = self->_selectedPairedUnlock;
      v21[0] = 67109634;
      v21[1] = 1470;
      __int16 v22 = 2080;
      uint32_t v23 = "-[PBBridgeCompanionController gizmoDidEndUnlockPairing:]";
      __int16 v24 = 1024;
      BOOL v25 = selectedPairedUnlock;
      _os_log_impl(&dword_21C445000, v11, OS_LOG_TYPE_DEFAULT, "%d %s (Enabled Paired Unlock %d)", (uint8_t *)v21, 0x18u);
    }

    int v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 postNotificationName:@"PBBridgeDidCompleteUnlockPairingNotification" object:0];

    if (PBLogPerformanceMetrics())
    {
      __int16 v14 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
      double Current = CFAbsoluteTimeGetCurrent();
      uint64_t v16 = (objc_class *)objc_opt_class();
      id v17 = NSStringFromClass(v16);
      uint64_t v18 = [v4 context];
      id v19 = [v18 outgoingResponseIdentifier];
      [v14 addMilestone:v17 activityType:v19 activityIdentifier:Current];
    }
    unlockPairingAssertion = self->_unlockPairingAssertion;
    if (unlockPairingAssertion)
    {
      CFRelease(unlockPairingAssertion);
      self->_unlockPairingAssertion = 0;
    }
    PBNotifyClientOfActivity();
  }
}

- (void)sendGizmoPasscodeRestrictions
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  int v2 = [MEMORY[0x263F53C50] sharedConnection];
  uint64_t v3 = [v2 effectiveRestrictions];

  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v5 = [v3 objectForKey:*MEMORY[0x263F53B20]];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v31;
    uint64_t v9 = *MEMORY[0x263F53B28];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        int v12 = [v5 objectForKey:v11];
        int v13 = [v12 objectForKey:v9];

        if (v13) {
          [v4 setObject:v13 forKey:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v7);
  }
  BOOL v25 = v3;
  __int16 v14 = [v3 objectForKey:*MEMORY[0x263F53B30]];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v27;
    uint64_t v18 = *MEMORY[0x263F53B38];
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v20 = *(void *)(*((void *)&v26 + 1) + 8 * j);
        int v21 = [v14 objectForKey:v20];
        __int16 v22 = [v21 objectForKey:v18];

        if (v22) {
          [v4 setObject:v22 forKey:v20];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v16);
  }
  uint64_t v34 = v4;
  uint32_t v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
  [(PBBridgeCompanionController *)self _sendRemoteCommandWithMessageID:20 withArguments:v23];
}

- (void)tellGizmoToSetDiagnosticsEnabled:(BOOL)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  id v4 = [NSNumber numberWithBool:a3];
  v6[0] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  [(PBBridgeCompanionController *)self _sendRemoteCommandWithMessageID:10 withArguments:v5];
}

- (void)tellGizmoToSetLocationEnabled:(BOOL)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  id v4 = [NSNumber numberWithBool:a3];
  v6[0] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  [(PBBridgeCompanionController *)self _sendRemoteCommandWithMessageID:8 withArguments:v5];
}

- (void)tellGizmoToSetFitnessRouteTrackingEnabled:(BOOL)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  id v4 = [NSNumber numberWithBool:a3];
  v6[0] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  [(PBBridgeCompanionController *)self _sendRemoteCommandWithMessageID:33 withArguments:v5];
}

- (void)tellWatchToSetSiriEnabled:(BOOL)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  id v4 = [NSNumber numberWithBool:a3];
  v6[0] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  [(PBBridgeCompanionController *)self _sendRemoteCommandWithMessageID:28 withArguments:v5];
}

- (void)tellGizmoToSetMessagesinCloudEnabled:(BOOL)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  id v4 = [NSNumber numberWithBool:a3];
  v6[0] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  [(PBBridgeCompanionController *)self _sendRemoteCommandWithMessageID:31 withArguments:v5];
}

- (void)tellWatchToSetLauncherViewMode:(int64_t)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  id v4 = [NSNumber numberWithInteger:a3];
  v6[0] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  [(PBBridgeCompanionController *)self _sendRemoteCommandWithMessageID:112 withArguments:v5];
}

- (void)retrieveAppViewListImageFromGizmo:(CGSize)a3 completion:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a4;
  appViewListImageCompletion = (void (**)(id, void))self->_appViewListImageCompletion;
  if (appViewListImageCompletion) {
    appViewListImageCompletion[2](appViewListImageCompletion, 0);
  }
  uint64_t v9 = (void *)[v7 copy];
  id v10 = self->_appViewListImageCompletion;
  self->_appViewListImageCompletion = v9;

  uint64_t v11 = [MEMORY[0x263F1C920] mainScreen];
  [v11 scale];
  double v13 = v12;

  __int16 v14 = pbb_setupflow_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v26.double width = width;
    v26.double height = height;
    uint64_t v15 = NSStringFromSize(v26);
    *(_DWORD *)buf = 138412546;
    __int16 v22 = v15;
    __int16 v23 = 2048;
    double v24 = v13;
    _os_log_impl(&dword_21C445000, v14, OS_LOG_TYPE_DEFAULT, ">>>> retrieve app view list image from gizmo %@ %f", buf, 0x16u);
  }
  uint64_t v16 = [NSNumber numberWithDouble:width];
  v20[0] = v16;
  uint64_t v17 = [NSNumber numberWithDouble:height];
  v20[1] = v17;
  uint64_t v18 = [NSNumber numberWithDouble:v13];
  v20[2] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:3];
  [(PBBridgeCompanionController *)self _sendRemoteCommandWithMessageID:113 withArguments:v19];
}

- (void)handleAppViewListImageResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  uint64_t v6 = [v4 context];
  id v7 = [v6 fromID];
  LODWORD(v5) = [(PBBridgeCompanionController *)self shouldHandleMessageType:v5 fromId:v7];

  if (v5)
  {
    uint64_t v8 = [PBBProtoAppViewListImageResponse alloc];
    uint64_t v9 = [v4 data];
    id v10 = [(PBBProtoAppViewListImageResponse *)v8 initWithData:v9];

    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    void v12[2] = __62__PBBridgeCompanionController_handleAppViewListImageResponse___block_invoke;
    v12[3] = &unk_264401470;
    v12[4] = self;
    double v13 = v10;
    uint64_t v11 = v10;
    dispatch_async(MEMORY[0x263EF83A0], v12);
  }
}

void __62__PBBridgeCompanionController_handleAppViewListImageResponse___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 264))
  {
    if ([*(id *)(a1 + 40) hasImageData])
    {
      int v2 = (void *)MEMORY[0x263F1C6B0];
      uint64_t v3 = [*(id *)(a1 + 40) imageData];
      id v6 = [v2 imageWithData:v3 scale:2.0];
    }
    else
    {
      id v6 = 0;
    }
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 264) + 16))();
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 264);
    *(void *)(v4 + 264) = 0;
  }
}

- (void)tellGizmoToPushControllerType:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = PBBuddyControllerDescription(a3);
    *(_DWORD *)buf = 67109378;
    int v11 = a3;
    __int16 v12 = 2112;
    double v13 = v6;
    _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "Telling Gizmo to push (%d - %@)", buf, 0x12u);
  }
  id v7 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v9 = v7;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:1];
  [(PBBridgeCompanionController *)self _sendRemoteCommandWithMessageID:3 withArguments:v8];
}

- (void)tellGizmoToPopToControllerType:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = PBBuddyControllerDescription(a3);
    *(_DWORD *)buf = 67109378;
    int v11 = a3;
    __int16 v12 = 2112;
    double v13 = v6;
    _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "Telling Gizmo to pop to (%d - %@)", buf, 0x12u);
  }
  id v7 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v9 = v7;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:1];
  [(PBBridgeCompanionController *)self _sendRemoteCommandWithMessageID:4 withArguments:v8];
}

- (void)tellGizmoToShowLockedOnAnimationTimeToFlash:(double)a3 animationCompletion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = (void *)[a4 copy];
  id lockedOnAnimationCompletion = self->_lockedOnAnimationCompletion;
  self->_id lockedOnAnimationCompletion = v6;

  double v8 = *(double *)&PBBridgeAnimationSyncOffsetTime - a3;
  double v9 = 0.0;
  if (*(double *)&PBBridgeAnimationSyncOffsetTime - a3 < 0.0)
  {
    id v10 = pbb_setupflow_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      double v18 = a3;
      __int16 v19 = 2048;
      uint64_t v20 = PBBridgeAnimationSyncOffsetTime;
      _os_log_impl(&dword_21C445000, v10, OS_LOG_TYPE_DEFAULT, "Time to flash is too long (%f vs %f). Pushing back animation.", buf, 0x16u);
    }

    double v9 = fabs(v8);
    double v8 = 0.0;
  }
  dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __95__PBBridgeCompanionController_tellGizmoToShowLockedOnAnimationTimeToFlash_animationCompletion___block_invoke;
  v15[3] = &unk_2644011C8;
  void v15[4] = self;
  dispatch_after(v11, MEMORY[0x263EF83A0], v15);
  __int16 v12 = pbb_setupflow_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C445000, v12, OS_LOG_TYPE_DEFAULT, "Telling Gizmo show Lock-On Animation", buf, 2u);
  }

  double v13 = [NSNumber numberWithDouble:v9];
  uint64_t v16 = v13;
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
  [(PBBridgeCompanionController *)self _sendRemoteCommandWithMessageID:17 withArguments:v14];

  PBNotifyClientOfActivity();
}

void __95__PBBridgeCompanionController_tellGizmoToShowLockedOnAnimationTimeToFlash_animationCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 184);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 184);
    *(void *)(v3 + 184) = 0;
  }
}

- (void)tellGizmoToSetCrownOrientationRight:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = @"On Left";
    if (v3) {
      id v6 = @"On Right";
    }
    *(_DWORD *)buf = 138412290;
    dispatch_time_t v11 = v6;
    _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "Telling Gizmo To Set Crown Orientation: %@", buf, 0xCu);
  }

  id v7 = [NSNumber numberWithBool:v3];
  double v9 = v7;
  double v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:1];
  [(PBBridgeCompanionController *)self _sendRemoteCommandWithMessageID:18 withArguments:v8];
}

- (void)tellGizmoToUpdateSyncProgressTo:(double)a3 withState:(int64_t)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = pbb_setupflow_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    double v13 = a3;
    __int16 v14 = 2048;
    int64_t v15 = a4;
    _os_log_impl(&dword_21C445000, v7, OS_LOG_TYPE_DEFAULT, "Telling Gizmo To Update Sync Progress to: %f and state: %ld", buf, 0x16u);
  }

  double v8 = [NSNumber numberWithDouble:a3];
  double v9 = objc_msgSend(NSNumber, "numberWithInteger:", a4, v8);
  v11[1] = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
  [(PBBridgeCompanionController *)self _sendRemoteCommandWithMessageID:19 withArguments:v10];
}

- (void)startEstablishingPairing
{
  self->_isEstablishingPairing = 1;
}

- (void)tellGizmoToBeginActivation
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  BOOL v3 = pbb_activation_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[PBBridgeCompanionController tellGizmoToBeginActivation]";
    _os_log_impl(&dword_21C445000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  [(PBBridgeCompanionController *)self refreshTimeoutTimerWithNewActivationGranularState:1];
  uint64_t v4 = [(id)*MEMORY[0x263F1D020] setupController];
  uint64_t v5 = [v4 pairingReportManager];

  [v5 addPairingTimeEventToPairingReportPlist:12 withValue:MEMORY[0x263EFFA88] withError:0];
  [v5 checkInWithOpenPairingTimeEvent:18];
  [(PBBridgeCompanionController *)self _sendRemoteCommandWithMessageID:11 withArguments:0];
}

- (void)tellGizmoToRetryActivation
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  BOOL v3 = pbb_activation_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[PBBridgeCompanionController tellGizmoToRetryActivation]";
    _os_log_impl(&dword_21C445000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(PBBridgeCompanionController *)self refreshTimeoutTimerWithNewActivationGranularState:1];
  [(PBBridgeCompanionController *)self _sendRemoteCommandWithMessageID:15 withArguments:0];
}

- (void)invalidateTimeoutTimerWithNewActivationGranularState:(unsigned __int16)a3
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_timeoutTrackerQueue);
  timeoutTrackerQueue = self->_timeoutTrackerQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __84__PBBridgeCompanionController_invalidateTimeoutTimerWithNewActivationGranularState___block_invoke;
  v6[3] = &unk_264401900;
  unsigned __int16 v7 = a3;
  v6[4] = self;
  dispatch_sync(timeoutTrackerQueue, v6);
}

void __84__PBBridgeCompanionController_invalidateTimeoutTimerWithNewActivationGranularState___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = pbb_activation_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if ((unsigned __int16)(*(_WORD *)(a1 + 40) + 1) > 7u) {
      BOOL v3 = @"<Unknown State>";
    }
    else {
      BOOL v3 = off_264401970[(__int16)(*(_WORD *)(a1 + 40) + 1)];
    }
    int v7 = 136315394;
    uint64_t v8 = "-[PBBridgeCompanionController invalidateTimeoutTimerWithNewActivationGranularState:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_21C445000, v2, OS_LOG_TYPE_DEFAULT, "%s: new state (%@)", (uint8_t *)&v7, 0x16u);
  }

  *(_WORD *)(*(void *)(a1 + 32) + 74) = *(_WORD *)(a1 + 40);
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 160);
  if (v4)
  {
    dispatch_source_cancel(v4);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 160);
    *(void *)(v5 + 160) = 0;
  }
}

- (void)refreshTimeoutTimerWithNewActivationGranularState:(unsigned __int16)a3
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_timeoutTrackerQueue);
  timeoutTrackerQueue = self->_timeoutTrackerQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __81__PBBridgeCompanionController_refreshTimeoutTimerWithNewActivationGranularState___block_invoke;
  v6[3] = &unk_264401900;
  unsigned __int16 v7 = a3;
  v6[4] = self;
  dispatch_sync(timeoutTrackerQueue, v6);
}

void __81__PBBridgeCompanionController_refreshTimeoutTimerWithNewActivationGranularState___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = pbb_activation_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if ((unsigned __int16)(*(_WORD *)(a1 + 40) + 1) > 7u) {
      BOOL v3 = @"<Unknown State>";
    }
    else {
      BOOL v3 = off_264401970[(__int16)(*(_WORD *)(a1 + 40) + 1)];
    }
    *(_DWORD *)buf = 136315394;
    double v22 = COERCE_DOUBLE("-[PBBridgeCompanionController refreshTimeoutTimerWithNewActivationGranularState:]_block_invoke");
    __int16 v23 = 2112;
    double v24 = v3;
    _os_log_impl(&dword_21C445000, v2, OS_LOG_TYPE_DEFAULT, "%s: new state (%@)", buf, 0x16u);
  }

  *(_WORD *)(*(void *)(a1 + 32) + 74) = *(_WORD *)(a1 + 40);
  int v4 = *(dispatch_source_t **)(a1 + 32);
  if (v4[20])
  {
    dispatch_source_cancel(v4[20]);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 160);
    *(void *)(v5 + 160) = 0;

    int v4 = *(dispatch_source_t **)(a1 + 32);
  }
  unsigned __int16 v7 = [(dispatch_source_t *)v4 service];

  if (v7)
  {
    unsigned int v8 = *(unsigned __int16 *)(*(void *)(a1 + 32) + 74) - 1;
    double v9 = 0.0;
    if (v8 <= 5) {
      double v9 = dbl_21C494BF0[(__int16)v8];
    }
    id v10 = pbb_activation_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if ((unsigned __int16)(*(_WORD *)(*(void *)(a1 + 32) + 74) + 1) > 7u) {
        uint64_t v11 = @"<Unknown State>";
      }
      else {
        uint64_t v11 = off_264401970[(__int16)(*(_WORD *)(*(void *)(a1 + 32) + 74) + 1)];
      }
      *(_DWORD *)buf = 134218242;
      double v22 = v9 / 60.0;
      __int16 v23 = 2112;
      double v24 = v11;
      _os_log_impl(&dword_21C445000, v10, OS_LOG_TYPE_DEFAULT, "Setting %1.f minute timeout for activation phase %@", buf, 0x16u);
    }

    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    dispatch_source_t v13 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
    uint64_t v14 = *(void *)(a1 + 32);
    int64_t v15 = *(void **)(v14 + 160);
    *(void *)(v14 + 160) = v13;

    uint64_t v16 = *(NSObject **)(*(void *)(a1 + 32) + 160);
    dispatch_time_t v17 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
    dispatch_source_set_timer(v16, v17, 0xFFFFFFFFFFFFFFFFLL, 0);
    double v18 = *(NSObject **)(*(void *)(a1 + 32) + 160);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __81__PBBridgeCompanionController_refreshTimeoutTimerWithNewActivationGranularState___block_invoke_588;
    handler[3] = &unk_264401928;
    objc_copyWeak(&v20, (id *)buf);
    dispatch_source_set_event_handler(v18, handler);
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 160));
    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    uint64_t v12 = pbb_activation_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C445000, v12, OS_LOG_TYPE_DEFAULT, "Skipped Timeout Refresh Because Service Was Nil", buf, 2u);
    }
  }
}

void __81__PBBridgeCompanionController_refreshTimeoutTimerWithNewActivationGranularState___block_invoke_588(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setActivationTimeout:0];

  id v3 = objc_loadWeakRetained(v1);
  [v3 activationTimedOut];
}

- (void)activationTimedOut
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ((unsigned __int16)(a1 + 1) > 7u) {
    id v3 = @"<Unknown State>";
  }
  else {
    id v3 = off_264401970[(__int16)(a1 + 1)];
  }
  uint64_t v4 = *(void *)(a2 + 168);
  int v5 = 136315650;
  uint64_t v6 = "-[PBBridgeCompanionController activationTimedOut]";
  __int16 v7 = 2112;
  unsigned int v8 = v3;
  __int16 v9 = 2112;
  uint64_t v10 = v4;
  _os_log_error_impl(&dword_21C445000, log, OS_LOG_TYPE_ERROR, "%s: Activation time out in phase %@ (Last message sent was %@)", (uint8_t *)&v5, 0x20u);
}

- (void)tellGizmoToKeepAliveForActivationEvent
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = pbb_activation_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109378;
    v4[1] = 1752;
    __int16 v5 = 2080;
    uint64_t v6 = "-[PBBridgeCompanionController tellGizmoToKeepAliveForActivationEvent]";
    _os_log_impl(&dword_21C445000, v3, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)v4, 0x12u);
  }

  [(PBBridgeCompanionController *)self _sendRemoteCommandWithMessageID:24 withArguments:MEMORY[0x263EFFA68]];
}

- (void)handleRemoteActivationDetails:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  uint64_t v6 = [v4 context];
  uint64_t v7 = [v6 fromID];
  LODWORD(self) = [(PBBridgeCompanionController *)self shouldHandleMessageType:v5 fromId:v7];

  if (self)
  {
    unsigned int v8 = [PBBProtoRemoteActivationFailureReport alloc];
    __int16 v9 = [v4 data];
    uint64_t v10 = [(PBBProtoRemoteActivationFailureReport *)v8 initWithData:v9];

    uint64_t v11 = [(PBBProtoRemoteActivationFailureReport *)v10 activationError];
    id v17 = 0;
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v11 error:&v17];
    id v13 = v17;
    if (v13)
    {
      uint64_t v14 = pbb_activation_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        [(PBBridgeCompanionController *)(uint64_t)v13 handleRemoteActivationDetails:v14];
      }
    }
    int64_t v15 = [v12 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F081D0]];
    [v12 finishDecoding];
    uint64_t v16 = pbb_activation_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[PBBridgeCompanionController handleRemoteActivationDetails:]();
    }
  }
}

- (void)queryGizmoForShowWarrantySentinelAndRestoreDeviceName:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v22 = 1784;
    __int16 v23 = 2080;
    double v24 = "-[PBBridgeCompanionController queryGizmoForShowWarrantySentinelAndRestoreDeviceName:]";
    __int16 v25 = 2112;
    id v26 = v4;
    _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "%d %s -- Querying for Warranty Sentinel; Device name: %@",
      buf,
      0x1Cu);
  }

  uint64_t v6 = [MEMORY[0x263EFF9D0] null];
  id v20 = v6;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];

  if (v4) {
    goto LABEL_7;
  }
  id v18 = 0;
  id v19 = 0;
  [(id)objc_opt_class() iCloudFirstName:&v19 lastName:&v18];
  id v8 = v19;
  id v9 = v18;
  id v10 = v9;
  if (!v8)
  {

    id v16 = 0;
    id v17 = 0;
    [(id)objc_opt_class() meCardFirstName:&v17 lastName:&v16];
    id v8 = v17;
    id v10 = v16;
    if (!v8) {
      goto LABEL_8;
    }
  }
  uint64_t v11 = [(id)objc_opt_class() displayNameWithFirstName:v8 lastName:v10];
  uint64_t v12 = NSString;
  id v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v14 = [v13 localizedStringForKey:@"DEVICE_NAME" value:&stru_26CC94B60 table:@"Localizable"];
  objc_msgSend(v12, "stringWithFormat:", v14, v11);
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
LABEL_7:
    uint64_t v15 = [v7 arrayByAddingObject:v4];

    id v10 = v4;
    uint64_t v7 = (void *)v15;
LABEL_8:
  }
  [(PBBridgeCompanionController *)self _sendRemoteCommandWithMessageID:14 withArguments:v7];
}

- (void)tellGizmoToDeleteWarrantySentinel
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109378;
    v4[1] = 1814;
    __int16 v5 = 2080;
    uint64_t v6 = "-[PBBridgeCompanionController tellGizmoToDeleteWarrantySentinel]";
    _os_log_impl(&dword_21C445000, v3, OS_LOG_TYPE_DEFAULT, "%d %s -- Telling Gizmo to delete its Warranty Sentinel", (uint8_t *)v4, 0x12u);
  }

  [(PBBridgeCompanionController *)self _sendRemoteCommandWithMessageID:14 withArguments:&unk_26CCA1640];
}

- (void)handleWarrantySentinelResponse:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 type];
  uint64_t v6 = [v4 context];
  uint64_t v7 = [v6 fromID];
  LODWORD(self) = [(PBBridgeCompanionController *)self shouldHandleMessageType:v5 fromId:v7];

  if (self)
  {
    id v8 = [PBBProtoWarrantySentinel alloc];
    id v9 = [v4 data];
    id v10 = [(PBBProtoWarrantySentinel *)v8 initWithData:v9];

    uint64_t v11 = pbb_setupflow_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v28 = v10;
      _os_log_impl(&dword_21C445000, v11, OS_LOG_TYPE_DEFAULT, "Got Warranty Sentinel Response: (%@)", buf, 0xCu);
    }

    if ([(PBBProtoWarrantySentinel *)v10 hasSentinelExists])
    {
      uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", -[PBBProtoWarrantySentinel sentinelExists](v10, "sentinelExists", @"PBBridgeWarrantySentinelExistsKey"));
      id v26 = v12;
      id v13 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      uint64_t v14 = (void *)[v13 mutableCopy];

      uint64_t v15 = [(PBBProtoWarrantySentinel *)v10 appleLanguages];

      if (v15)
      {
        id v16 = [(PBBProtoWarrantySentinel *)v10 appleLanguages];
        [v14 setObject:v16 forKeyedSubscript:@"PBBridgeGizmoAppleLanguagesKey"];
      }
      if ([(PBBProtoWarrantySentinel *)v10 hasAppleLocale])
      {
        id v17 = [(PBBProtoWarrantySentinel *)v10 appleLocale];
        [v14 setObject:v17 forKeyedSubscript:@"PBBridgeGizmoAppleLocaleKey"];
      }
      id v18 = [MEMORY[0x263F08A00] defaultCenter];
      [v18 postNotificationName:@"PBBridgeWarrantySentinelNotification" object:0 userInfo:v14];
    }
    if (PBLogPerformanceMetrics())
    {
      id v19 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
      double Current = CFAbsoluteTimeGetCurrent();
      uint64_t v21 = (objc_class *)objc_opt_class();
      int v22 = NSStringFromClass(v21);
      __int16 v23 = [v4 context];
      double v24 = [v23 outgoingResponseIdentifier];
      [v19 addMilestone:v22 activityType:v24 activityIdentifier:Current];
    }
  }
}

- (void)tellGizmoToPrepareForInitialSyncWithCompletion:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = (void *)[a3 copy];
  id initialSyncPrepCompletion = self->_initialSyncPrepCompletion;
  self->_id initialSyncPrepCompletion = v4;

  uint64_t v6 = pbb_setupflow_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = 1855;
    __int16 v8 = 2080;
    id v9 = "-[PBBridgeCompanionController tellGizmoToPrepareForInitialSyncWithCompletion:]";
    _os_log_impl(&dword_21C445000, v6, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)v7, 0x12u);
  }

  [(PBBridgeCompanionController *)self _sendRemoteCommandWithMessageID:21 withArguments:MEMORY[0x263EFFA68]];
}

- (void)watchDidPrepareForInitialSync:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 type];
  uint64_t v6 = [v4 context];

  uint64_t v7 = [v6 fromID];
  LODWORD(v5) = [(PBBridgeCompanionController *)self shouldHandleMessageType:v5 fromId:v7];

  if (v5)
  {
    __int16 v8 = pbb_setupflow_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109378;
      v11[1] = 1865;
      __int16 v12 = 2080;
      id v13 = "-[PBBridgeCompanionController watchDidPrepareForInitialSync:]";
      _os_log_impl(&dword_21C445000, v8, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)v11, 0x12u);
    }

    id initialSyncPrepCompletion = (void (**)(void))self->_initialSyncPrepCompletion;
    if (initialSyncPrepCompletion)
    {
      initialSyncPrepCompletion[2]();
      id v10 = self->_initialSyncPrepCompletion;
      self->_id initialSyncPrepCompletion = 0;
    }
  }
}

- (void)queryGizmoForOfflineTerms
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109378;
    v4[1] = 1878;
    __int16 v5 = 2080;
    uint64_t v6 = "-[PBBridgeCompanionController queryGizmoForOfflineTerms]";
    _os_log_impl(&dword_21C445000, v3, OS_LOG_TYPE_DEFAULT, "%d %s -- Querying for Offline Terms", (uint8_t *)v4, 0x12u);
  }

  [(PBBridgeCompanionController *)self _sendRemoteCommandWithMessageID:16 withArguments:0];
}

- (void)handleOfflineTermsResponse:(id)a3
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 type];
  uint64_t v6 = [v4 context];
  uint64_t v7 = [v6 fromID];
  LODWORD(self) = [(PBBridgeCompanionController *)self shouldHandleMessageType:v5 fromId:v7];

  if (self)
  {
    __int16 v8 = [PBBProtoOfflineTerms alloc];
    id v9 = [v4 data];
    id v10 = [(PBBProtoOfflineTerms *)v8 initWithData:v9];

    uint64_t v11 = pbb_setupflow_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = [(PBBProtoOfflineTerms *)v10 license];
      uint64_t v13 = [v12 length];
      uint64_t v14 = [(PBBProtoOfflineTerms *)v10 multiterms];
      uint64_t v15 = [v14 length];
      id v16 = [(PBBProtoOfflineTerms *)v10 warranty];
      *(_DWORD *)buf = 134218752;
      uint64_t v56 = v10;
      __int16 v57 = 2048;
      uint64_t v58 = v13;
      __int16 v59 = 2048;
      uint64_t v60 = v15;
      __int16 v61 = 2048;
      uint64_t v62 = [v16 length];
      _os_log_impl(&dword_21C445000, v11, OS_LOG_TYPE_DEFAULT, "Got Offline Terms Response: (%p); license: (%lu bytes); multiterms: (%lu bytes); warranty: (%lu bytes);",
        buf,
        0x2Au);
    }
    if (PBLogPerformanceMetrics())
    {
      id v17 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
      double Current = CFAbsoluteTimeGetCurrent();
      id v19 = (objc_class *)objc_opt_class();
      id v20 = NSStringFromClass(v19);
      uint64_t v21 = [v4 context];
      int v22 = [v21 outgoingResponseIdentifier];
      [v17 addMilestone:v20 activityType:v22 activityIdentifier:Current];
    }
    v53 = @"PBBridgeOfflineTermsLicenseKey";
    __int16 v23 = [(PBBProtoOfflineTerms *)v10 license];
    v54 = v23;
    double v24 = [NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
    uint64_t v25 = (void *)[v24 mutableCopy];

    if ([(PBBProtoOfflineTerms *)v10 hasMultiterms])
    {
      id v26 = [NSString alloc];
      uint64_t v27 = [(PBBProtoOfflineTerms *)v10 multiterms];
      id v52 = (void *)[v26 initWithData:v27 encoding:4];

      v46 = NSString;
      v49 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v50 = v25;
      v51 = [v49 localizedStringForKey:@"TERMS_AND_CONDITIONS" value:&stru_26CC94B60 table:@"Localizable"];
      v48 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v43 = [v48 localizedStringForKey:@"IMPORTANT" value:&stru_26CC94B60 table:@"Localizable"];
      v45 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v41 = [v45 localizedStringForKey:@"Part1" value:&stru_26CC94B60 table:@"Localizable"];
      v44 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      long long v39 = [v44 localizedStringForKey:@"TC_HEADER" value:&stru_26CC94B60 table:@"Localizable"];
      uint64_t v42 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      long long v38 = [v42 localizedStringForKey:@"WARRANTY_HEADER" value:&stru_26CC94B60 table:@"Localizable"];
      __int16 v40 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      long long v28 = [v40 localizedStringForKey:@"Part2" value:&stru_26CC94B60 table:@"Localizable"];
      uint64_t v37 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v29 = [v37 localizedStringForKey:@"Part3" value:&stru_26CC94B60 table:@"Localizable"];
      long long v30 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      long long v31 = [v30 localizedStringForKey:@"AGREE" value:&stru_26CC94B60 table:@"Localizable"];
      long long v32 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      long long v33 = [v32 localizedStringForKey:@"DISAGREE" value:&stru_26CC94B60 table:@"Localizable"];
      uint64_t v47 = objc_msgSend(v46, "stringWithFormat:", v52, v51, v43, v41, v39, v38, v28, v29, v31, v33);

      uint64_t v25 = v50;
      uint64_t v34 = [v47 dataUsingEncoding:4];
      [v50 setObject:v34 forKeyedSubscript:@"PBBridgeOfflineTermsMultitermsKey"];
    }
    if ([(PBBProtoOfflineTerms *)v10 hasWarranty])
    {
      id v35 = [(PBBProtoOfflineTerms *)v10 warranty];
      [v25 setObject:v35 forKeyedSubscript:@"PBBridgeOfflineTermsWarrantyKey"];
    }
    uint64_t v36 = [MEMORY[0x263F08A00] defaultCenter];
    [v36 postNotificationName:@"PBBridgeOfflineTermsNotification" object:0 userInfo:v25];
  }
}

- (void)transportBecameReachable
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)PBBridgeCompanionController;
  [(PBBridgeIDSServiceDelegate *)&v11 transportBecameReachable];
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
      uint64_t v13 = "-[PBBridgeCompanionController transportBecameReachable]";
      _os_log_impl(&dword_21C445000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }

    uint64_t v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 transportBecameReachable];
  }
  else if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    *(_DWORD *)buf = 136446466;
    uint64_t v13 = "-[PBBridgeCompanionController transportBecameReachable]";
    __int16 v14 = 2112;
    uint64_t v15 = v10;
    _os_log_impl(&dword_21C445000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s: Delegate (%@) missing transportBecameReachable", buf, 0x16u);
  }
}

- (void)transportBecameUnreachable
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)PBBridgeCompanionController;
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
      uint64_t v13 = "-[PBBridgeCompanionController transportBecameUnreachable]";
      _os_log_impl(&dword_21C445000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }

    uint64_t v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 transportBecameUnreachable];
  }
  else if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    *(_DWORD *)buf = 136446466;
    uint64_t v13 = "-[PBBridgeCompanionController transportBecameUnreachable]";
    __int16 v14 = 2112;
    uint64_t v15 = v10;
    _os_log_impl(&dword_21C445000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s: Delegate (%@) missing transportBecameUnreachable", buf, 0x16u);
  }
}

+ (void)meCardFirstName:(id *)a3 lastName:(id *)a4
{
  v22[2] = *MEMORY[0x263EF8340];
  id v6 = objc_alloc_init(MEMORY[0x263EFEA58]);
  BOOL v7 = pbb_setupflow_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v15 = 1947;
    __int16 v16 = 2080;
    id v17 = "+[PBBridgeCompanionController meCardFirstName:lastName:]";
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_21C445000, v7, OS_LOG_TYPE_DEFAULT, "%d %s: contactStore: %@", buf, 0x1Cu);
  }

  if (v6)
  {
    uint64_t v8 = *MEMORY[0x263EFDFB8];
    v22[0] = *MEMORY[0x263EFDFC8];
    v22[1] = v8;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
    id v13 = 0;
    id v10 = objc_msgSend(v6, "_ios_meContactWithKeysToFetch:error:", v9, &v13);
    id v11 = v13;

    __int16 v12 = pbb_setupflow_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109890;
      int v15 = 1953;
      __int16 v16 = 2080;
      id v17 = "+[PBBridgeCompanionController meCardFirstName:lastName:]";
      __int16 v18 = 2112;
      id v19 = v10;
      __int16 v20 = 2112;
      id v21 = v11;
      _os_log_impl(&dword_21C445000, v12, OS_LOG_TYPE_DEFAULT, "%d %s: meContact: %@, error: %@", buf, 0x26u);
    }

    if (v10)
    {
      *a3 = [v10 givenName];
      *a4 = [v10 familyName];
    }
  }
}

+ (void)iCloudFirstName:(id *)a3 lastName:(id *)a4
{
  id v7 = objc_alloc_init(MEMORY[0x263EFB210]);
  id v6 = objc_msgSend(v7, "aa_primaryAppleAccount");
  objc_msgSend(v6, "aa_firstName");
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "aa_lastName");
  *a4 = (id)objc_claimAutoreleasedReturnValue();
}

+ (id)displayNameWithFirstName:(id)a3 lastName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = v5;
    if ([v7 _containsCJKScriptsOnly]
      && [v6 length]
      && [v6 _containsCJKScriptsOnly])
    {
      uint64_t v8 = [v6 stringByAppendingString:v7];

      id v7 = (id)v8;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)tellWatchToChangeDeviceNameFor:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = a3;
    id v5 = objc_opt_class();
    id v6 = [v4 firstName];
    id v7 = [v4 lastName];

    uint64_t v8 = [v5 displayNameWithFirstName:v6 lastName:v7];

    id v9 = NSString;
    id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v11 = [v10 localizedStringForKey:@"DEVICE_NAME" value:&stru_26CC94B60 table:@"Localizable"];
    __int16 v12 = objc_msgSend(v9, "stringWithFormat:", v11, v8);

    v14[0] = v12;
    id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    [(PBBridgeCompanionController *)self _sendRemoteCommandWithMessageID:110 withArguments:v13];
  }
}

- (void)sendDemoWatchWirelessCredentials
{
  void v14[2] = *MEMORY[0x263EF8340];
  id v3 = [(PBBridgeCompanionController *)self currentNetworks:0];
  id v4 = [v3 firstObject];

  uint64_t v5 = [v4 objectForKey:@"SSID_STR"];
  id v6 = (void *)v5;
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  else {
    id v7 = &stru_26CC94B60;
  }
  uint64_t v8 = v7;

  uint64_t v9 = [v4 objectForKey:*MEMORY[0x263F55EC8]];
  id v10 = (void *)v9;
  if (v9) {
    id v11 = (__CFString *)v9;
  }
  else {
    id v11 = &stru_26CC94B60;
  }
  __int16 v12 = v11;

  v14[0] = v8;
  v14[1] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];

  [(PBBridgeCompanionController *)self _sendRemoteCommandWithMessageID:26 withArguments:v13];
}

- (void)sendAllTinkerWirelessCredentials:(BOOL)a3
{
  id v4 = [(PBBridgeCompanionController *)self currentNetworks:a3];
  if ([v4 count]) {
    [(PBBridgeCompanionController *)self _sendRemoteCommandWithMessageID:104 withArguments:v4];
  }
}

- (void)sendAllWirelessCredentials:(BOOL)a3
{
  id v6 = [(PBBridgeCompanionController *)self currentNetworks:a3];
  if ([v6 count])
  {
    [(PBBridgeCompanionController *)self _sendRemoteCommandWithMessageID:37 withArguments:v6];
  }
  else
  {
    id v4 = [(id)*MEMORY[0x263F1D020] setupController];
    uint64_t v5 = [v4 linkUpgradeMonitor];
    [v5 wirelessCredentialUpdateCompletedWithResult:0];
  }
}

- (id)currentNetworks:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = objc_opt_new();
  if (WiFiManagerClientCreate())
  {
    CFArrayRef v5 = (const __CFArray *)WiFiManagerClientCopyDevices();
    if (v5)
    {
      CFArrayRef v6 = v5;
      if (CFArrayGetCount(v5) >= 1)
      {
        CFArrayGetValueAtIndex(v6, 0);
        if (v3)
        {
          CFArrayRef v7 = (const __CFArray *)WiFiManagerClientCopyNetworks();
        }
        else
        {
          *(void *)values = WiFiDeviceClientCopyCurrentNetwork();
          if (!*(void *)values)
          {
            uint64_t v27 = pbb_setupflow_log();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21C445000, v27, OS_LOG_TYPE_DEFAULT, "Unable to share network, none available", buf, 2u);
            }

            goto LABEL_31;
          }
          CFArrayRef v7 = CFArrayCreate(0, (const void **)values, 1, MEMORY[0x263EFFF70]);
        }
        CFArrayRef v8 = v7;
        if (v7)
        {
          CFArrayRef cf = v6;
          long long v32 = v4;
          if (CFArrayGetCount(v7) >= 1)
          {
            CFIndex v9 = 0;
            uint64_t v30 = *MEMORY[0x263F55EC8];
            CFArrayRef v33 = v8;
            do
            {
              CFArrayGetValueAtIndex(v8, v9);
              if (WiFiNetworkIsCaptive()
                || WiFiNetworkIsProfileBased()
                || WiFiNetworkIsEAP())
              {
                id v10 = pbb_setupflow_log();
                if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t SSID = WiFiNetworkGetSSID();
                  __int16 v12 = (void *)SSID;
                  if (SSID) {
                    id v13 = (__CFString *)SSID;
                  }
                  else {
                    id v13 = &stru_26CC94B60;
                  }
                  int IsCaptive = WiFiNetworkIsCaptive();
                  int IsProfileBased = WiFiNetworkIsProfileBased();
                  int IsEAP = WiFiNetworkIsEAP();
                  *(_DWORD *)values = 138413058;
                  *(void *)&values[4] = v13;
                  __int16 v36 = 1024;
                  int v37 = IsCaptive;
                  __int16 v38 = 1024;
                  int v39 = IsProfileBased;
                  __int16 v40 = 1024;
                  int v41 = IsEAP;
                  _os_log_impl(&dword_21C445000, v10, OS_LOG_TYPE_DEFAULT, "Could not share: %@ - Captive: %{BOOL}d ProfileBased: %{BOOL}d EAP: %{BOOL}d", values, 0x1Eu);

                  CFArrayRef v8 = v33;
                }
              }
              else
              {
                id v10 = WiFiNetworkCopyRecord();
                id v17 = [v10 mutableCopy];
                [v17 removeObjectForKey:@"CHANNEL"];
                __int16 v18 = objc_opt_new();
                id v19 = [v17 objectForKeyedSubscript:@"networkKnownBSSListKey"];
                uint64_t v20 = [v19 count];

                if (v20)
                {
                  unint64_t v21 = 0;
                  do
                  {
                    int v22 = [v17 objectForKeyedSubscript:@"networkKnownBSSListKey"];
                    __int16 v23 = [v22 objectAtIndex:v21];

                    [v23 removeObjectForKey:@"CHANNEL"];
                    [v18 insertObject:v23 atIndex:v21];

                    ++v21;
                    double v24 = [v17 objectForKeyedSubscript:@"networkKnownBSSListKey"];
                    unint64_t v25 = [v24 count];
                  }
                  while (v25 > v21);
                }
                [v17 setObject:v18 forKeyedSubscript:@"networkKnownBSSListKey"];
                id v26 = (void *)WiFiNetworkCopyPassword();
                if (v26) {
                  [v17 setObject:v26 forKey:v30];
                }
                [v32 addObject:v17];

                CFArrayRef v8 = v33;
              }

              ++v9;
            }
            while (CFArrayGetCount(v8) > v9);
          }
          CFRelease(cf);
          id v4 = v32;
          goto LABEL_32;
        }
      }
LABEL_31:
      CFArrayRef v8 = v6;
LABEL_32:
      CFRelease(v8);
    }
  }
  long long v28 = pbb_setupflow_log();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)values = 0;
    _os_log_impl(&dword_21C445000, v28, OS_LOG_TYPE_DEFAULT, "return from current networks", values, 2u);
  }

  return v4;
}

- (id)currentWiFiNetworkName
{
  if (WiFiManagerClientCreate())
  {
    CFArrayRef v2 = (const __CFArray *)WiFiManagerClientCopyDevices();
    if (v2)
    {
      CFArrayRef v3 = v2;
      if (CFArrayGetCount(v2) >= 1)
      {
        CFArrayGetValueAtIndex(v3, 0);
        id v4 = (void *)WiFiDeviceClientCopyCurrentNetwork();
        if (!v4)
        {
LABEL_8:
          CFRelease(v3);
          goto LABEL_10;
        }
        if (!WiFiNetworkIsCaptive() && !WiFiNetworkIsProfileBased())
        {
          id v4 = WiFiNetworkGetSSID();
          goto LABEL_8;
        }
      }
      id v4 = 0;
      goto LABEL_8;
    }
  }
  id v4 = 0;
LABEL_10:
  return v4;
}

- (void)watchDidIngestWirelessCredentials:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  CFArrayRef v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[PBBridgeCompanionController watchDidIngestWirelessCredentials:]";
    _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v6 = [v4 type];
  CFArrayRef v7 = [v4 context];

  CFArrayRef v8 = [v7 fromID];
  [(PBBridgeCompanionController *)self shouldHandleMessageType:v6 fromId:v8];
}

- (void)watchDidApplyWirelessCredentials:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  CFArrayRef v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    id v13 = "-[PBBridgeCompanionController watchDidApplyWirelessCredentials:]";
    _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v12, 0xCu);
  }

  uint64_t v6 = [v4 type];
  CFArrayRef v7 = [v4 context];

  CFArrayRef v8 = [v7 fromID];
  BOOL v9 = [(PBBridgeCompanionController *)self shouldHandleMessageType:v6 fromId:v8];

  if (v9)
  {
    id v10 = [(id)*MEMORY[0x263F1D020] setupController];
    uint64_t v11 = [v10 linkUpgradeMonitor];
    [v11 wirelessCredentialUpdateCompletedWithResult:1];
  }
}

- (void)tellWatchToPrepareForForcedSUWithCompletion:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  CFArrayRef v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    BOOL v9 = "-[PBBridgeCompanionController tellWatchToPrepareForForcedSUWithCompletion:]";
    _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "%s:", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v6 = (void *)[v4 copy];
  id prepareWatchForForcedSUCompletion = self->_prepareWatchForForcedSUCompletion;
  self->_id prepareWatchForForcedSUCompletion = v6;

  [(PBBridgeCompanionController *)self _sendRemoteCommandWithMessageID:27 withArguments:MEMORY[0x263EFFA68]];
}

- (void)watchDidPrepareForForcedSU:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  CFArrayRef v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    int v12 = "-[PBBridgeCompanionController watchDidPrepareForForcedSU:]";
    _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "%s:", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v6 = [v4 type];
  CFArrayRef v7 = [v4 context];

  int v8 = [v7 fromID];
  LODWORD(v6) = [(PBBridgeCompanionController *)self shouldHandleMessageType:v6 fromId:v8];

  if (v6)
  {
    id prepareWatchForForcedSUCompletion = (void (**)(void))self->_prepareWatchForForcedSUCompletion;
    if (prepareWatchForForcedSUCompletion)
    {
      prepareWatchForForcedSUCompletion[2]();
      id v10 = self->_prepareWatchForForcedSUCompletion;
      self->_id prepareWatchForForcedSUCompletion = 0;
    }
  }
}

- (void)sendBuysOnWatchUsername:(id)a3 andPassword:(id)a4 withCompletion:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)[a5 copy];
  id buysOnWatchCredentialsIngestedCompletion = self->_buysOnWatchCredentialsIngestedCompletion;
  self->_id buysOnWatchCredentialsIngestedCompletion = v10;

  int v12 = pbb_accountsignin_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v16 = "-[PBBridgeCompanionController sendBuysOnWatchUsername:andPassword:withCompletion:]";
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_impl(&dword_21C445000, v12, OS_LOG_TYPE_DEFAULT, "%s -- username %@", buf, 0x16u);
  }

  v14[0] = v8;
  v14[1] = v9;
  uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  [(PBBridgeCompanionController *)self _sendRemoteCommandWithMessageID:32 withArguments:v13];
}

- (void)requestProxiedDeviceForWatchWithCompletion:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = (void *)[a3 copy];
  id remoteAccountForDeviceCompletion = self->_remoteAccountForDeviceCompletion;
  self->_id remoteAccountForDeviceCompletion = v4;

  uint64_t v6 = pbb_accountsignin_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[PBBridgeCompanionController requestProxiedDeviceForWatchWithCompletion:]";
    _os_log_impl(&dword_21C445000, v6, OS_LOG_TYPE_DEFAULT, "%s:", (uint8_t *)&v7, 0xCu);
  }

  [(PBBridgeCompanionController *)self _sendRemoteCommandWithMessageID:29 withArguments:MEMORY[0x263EFFA68]];
}

- (void)returnedRemoteAccountForDevice:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 type];
  uint64_t v6 = [v4 context];
  int v7 = [v6 fromID];
  LODWORD(v5) = [(PBBridgeCompanionController *)self shouldHandleMessageType:v5 fromId:v7];

  if (v5)
  {
    id v8 = [PBBProtoRemoteAccountForDevice alloc];
    uint64_t v9 = [v4 data];
    id v10 = [(PBBProtoRemoteAccountForDevice *)v8 initWithData:v9];

    int v11 = pbb_accountsignin_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315138;
      __int16 v17 = "-[PBBridgeCompanionController returnedRemoteAccountForDevice:]";
      _os_log_impl(&dword_21C445000, v11, OS_LOG_TYPE_DEFAULT, "%s:", (uint8_t *)&v16, 0xCu);
    }

    int v12 = [(PBBProtoRemoteAccountForDevice *)v10 serializedDevice];
    uint64_t v13 = [MEMORY[0x263F291C0] deviceWithSerializedData:v12];
    [v13 setLinkType:2];
    id remoteAccountForDeviceCompletion = (void (**)(id, void *))self->_remoteAccountForDeviceCompletion;
    if (remoteAccountForDeviceCompletion)
    {
      remoteAccountForDeviceCompletion[2](remoteAccountForDeviceCompletion, v13);
      id v15 = self->_remoteAccountForDeviceCompletion;
      self->_id remoteAccountForDeviceCompletion = 0;
    }
  }
}

- (void)sendComputedTimeZoneToGizmo
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = (id)TMCopyComputedTimeZone();
  id v4 = pbb_setupflow_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v8 = "-[PBBridgeCompanionController sendComputedTimeZoneToGizmo]";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_21C445000, v4, OS_LOG_TYPE_DEFAULT, "%s Sending computed time zone %@ to gizmo", buf, 0x16u);
  }

  if (v3)
  {
    id v6 = v3;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v6 count:1];
    [(PBBridgeCompanionController *)self _sendRemoteCommandWithMessageID:111 withArguments:v5];
  }
}

- (void)sendTinkerAccountCredentialsWithContext:(id)a3 completion:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = (void *)[a4 copy];
  id tinkerCredentialsIngestedCompletion = self->_tinkerCredentialsIngestedCompletion;
  long long v32 = self;
  self->_id tinkerCredentialsIngestedCompletion = v7;

  __int16 v9 = [(id)*MEMORY[0x263F1D020] setupController];
  id v10 = [v6 username];
  [v9 setTinkerSignInId:v10];

  uint64_t v11 = pbb_accountsignin_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = [v6 username];
    *(_DWORD *)buf = 136315394;
    __int16 v36 = "-[PBBridgeCompanionController sendTinkerAccountCredentialsWithContext:completion:]";
    __int16 v37 = 2112;
    __int16 v38 = v12;
    _os_log_impl(&dword_21C445000, v11, OS_LOG_TYPE_DEFAULT, "%s: username %@", buf, 0x16u);
  }
  uint64_t v13 = [v6 acceptedTermsInfo];

  if (v13)
  {
    uint64_t v14 = (void *)MEMORY[0x263F08910];
    id v15 = [v6 acceptedTermsInfo];
    id v33 = 0;
    uint64_t v16 = [v14 archivedDataWithRootObject:v15 requiringSecureCoding:1 error:&v33];
    id v17 = v33;

    if (v17)
    {
      uint64_t v18 = pbb_accountsignin_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[PBBridgeGizmoController _sendRemoteCommandWithMessageID:withArguments:]();
      }
      uint64_t v30 = v17;
    }
    else
    {
      uint64_t v30 = 0;
    }
  }
  else
  {
    uint64_t v30 = 0;
    uint64_t v16 = 0;
  }
  uint64_t v19 = [v6 username];
  uint64_t v20 = (void *)v19;
  if (!v19)
  {
    uint64_t v19 = [MEMORY[0x263EFF9D0] null];
  }
  v34[0] = v19;
  unint64_t v21 = objc_msgSend(v6, "password", v19);
  int v22 = v21;
  if (!v21)
  {
    int v22 = [MEMORY[0x263EFF9D0] null];
  }
  v34[1] = v22;
  __int16 v23 = (void *)v16;
  long long v31 = (void *)v16;
  if (!v16)
  {
    __int16 v23 = [MEMORY[0x263EFF9D0] null];
  }
  v34[2] = v23;
  double v24 = [v6 pairingParentUsername];
  unint64_t v25 = v24;
  if (!v24)
  {
    unint64_t v25 = [MEMORY[0x263EFF9D0] null];
  }
  v34[3] = v25;
  id v26 = [v6 pairingParentAltDSID];
  uint64_t v27 = v26;
  if (!v26)
  {
    uint64_t v27 = [MEMORY[0x263EFF9D0] null];
  }
  v34[4] = v27;
  long long v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:5];
  if (!v26) {

  }
  if (!v24) {
  if (v31)
  }
  {
    if (v21) {
      goto LABEL_26;
    }
  }
  else
  {

    if (v21) {
      goto LABEL_26;
    }
  }

LABEL_26:
  if (!v20) {

  }
  [(PBBridgeCompanionController *)v32 _sendRemoteCommandWithMessageID:30 withArguments:v28];
}

- (void)tinkerWatchIngestedCredentials:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 type];
  id v6 = [v4 context];
  int v7 = [v6 fromID];
  LODWORD(v5) = [(PBBridgeCompanionController *)self shouldHandleMessageType:v5 fromId:v7];

  if (v5)
  {
    id v8 = [PBBProtoTinkerAccountCredentialsIngested alloc];
    __int16 v9 = [v4 data];
    id v10 = [(PBBProtoTinkerAccountCredentialsIngested *)v8 initWithData:v9];

    uint64_t v11 = [(PBBProtoTinkerAccountCredentialsIngested *)v10 success];
    uint64_t v12 = [(PBBProtoTinkerAccountCredentialsIngested *)v10 cdpStatus];
    uint64_t v13 = [(PBBProtoTinkerAccountCredentialsIngested *)v10 errorDescription];
    uint64_t v14 = [(PBBProtoTinkerAccountCredentialsIngested *)v10 detailedError];
    if (v14)
    {
      id v21 = 0;
      id v15 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v14 error:&v21];
      id v16 = v21;
      if (v16)
      {
        id v17 = pbb_accountsignin_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[PBBridgeCompanionController tinkerWatchIngestedCredentials:]();
        }
      }
    }
    else
    {
      id v15 = 0;
    }
    uint64_t v18 = pbb_accountsignin_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [NSNumber numberWithBool:v11];
      *(_DWORD *)buf = 136316162;
      __int16 v23 = "-[PBBridgeCompanionController tinkerWatchIngestedCredentials:]";
      __int16 v24 = 2112;
      unint64_t v25 = v19;
      __int16 v26 = 2114;
      uint64_t v27 = v13;
      __int16 v28 = 2114;
      uint64_t v29 = v15;
      __int16 v30 = 2048;
      uint64_t v31 = v12;
      _os_log_impl(&dword_21C445000, v18, OS_LOG_TYPE_DEFAULT, " %s: Success %@ (Error message %{public}@) detailed: %{public}@ status: %ld", buf, 0x34u);
    }
    id tinkerCredentialsIngestedCompletion = (void (**)(id, uint64_t, void, void *, void *))self->_tinkerCredentialsIngestedCompletion;
    if (tinkerCredentialsIngestedCompletion) {
      tinkerCredentialsIngestedCompletion[2](tinkerCredentialsIngestedCompletion, v11, v12, v13, v15);
    }
  }
}

- (void)tinkerFinishedHealthSharingOptIn:(id)a3
{
  id v15 = a3;
  uint64_t v4 = [v15 type];
  uint64_t v5 = [v15 context];
  id v6 = [v5 fromID];
  LODWORD(v4) = [(PBBridgeCompanionController *)self shouldHandleMessageType:v4 fromId:v6];

  if (v4)
  {
    int v7 = [PBBProtoHealthSharingEnabled alloc];
    id v8 = [v15 data];
    __int16 v9 = [(PBBProtoHealthSharingEnabled *)v7 initWithData:v8];

    uint64_t v10 = [(PBBProtoHealthSharingEnabled *)v9 enabled];
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      id v14 = objc_loadWeakRetained((id *)p_delegate);
      [v14 remoteFinishedHealthSharingOptInWithSelection:v10];
    }
  }
}

- (void)acknowledgeBuysOnWatchCredentialIngestion:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 type];
  id v6 = [v4 context];
  int v7 = [v6 fromID];
  LODWORD(v5) = [(PBBridgeCompanionController *)self shouldHandleMessageType:v5 fromId:v7];

  if (v5)
  {
    id v8 = [PBBProtoAcknowledgeBuysOnWatchCredentialIngestion alloc];
    __int16 v9 = [v4 data];
    uint64_t v10 = [(PBBProtoAcknowledgeBuysOnWatchCredentialIngestion *)v8 initWithData:v9];

    uint64_t v11 = [(PBBProtoAcknowledgeBuysOnWatchCredentialIngestion *)v10 success];
    uint64_t v12 = [(PBBProtoAcknowledgeBuysOnWatchCredentialIngestion *)v10 errorCode];
    char v13 = [(PBBProtoAcknowledgeBuysOnWatchCredentialIngestion *)v10 errorDescription];
    id v14 = pbb_accountsignin_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [NSNumber numberWithBool:v11];
      id v16 = [NSNumber numberWithInteger:v12];
      int v19 = 136315906;
      uint64_t v20 = "-[PBBridgeCompanionController acknowledgeBuysOnWatchCredentialIngestion:]";
      __int16 v21 = 2112;
      int v22 = v15;
      __int16 v23 = 2112;
      __int16 v24 = v16;
      __int16 v25 = 2112;
      __int16 v26 = v13;
      _os_log_impl(&dword_21C445000, v14, OS_LOG_TYPE_DEFAULT, "%s -- success: %@ (Error: %@ %@)", (uint8_t *)&v19, 0x2Au);
    }
    id buysOnWatchCredentialsIngestedCompletion = (void (**)(id, uint64_t, void, void *))self->_buysOnWatchCredentialsIngestedCompletion;
    if (buysOnWatchCredentialsIngestedCompletion)
    {
      buysOnWatchCredentialsIngestedCompletion[2](buysOnWatchCredentialsIngestedCompletion, v11, v12, v13);
      id v18 = self->_buysOnWatchCredentialsIngestedCompletion;
      self->_id buysOnWatchCredentialsIngestedCompletion = 0;
    }
  }
}

- (void)tellWatchToConfigureDeviceManagementWithData:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = (void *)MEMORY[0x21D4A74C0](a4);
  id setupDeviceManagementCompletion = self->_setupDeviceManagementCompletion;
  self->_id setupDeviceManagementCompletion = v7;

  __int16 v9 = pbb_devicemanagement_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    char v13 = "-[PBBridgeCompanionController tellWatchToConfigureDeviceManagementWithData:completion:]";
    __int16 v14 = 1024;
    BOOL v15 = v6 != 0;
    _os_log_impl(&dword_21C445000, v9, OS_LOG_TYPE_DEFAULT, "%s -- configuration data: %{BOOL}d", buf, 0x12u);
  }

  id v11 = v6;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:1];
  [(PBBridgeCompanionController *)self _sendRemoteCommandWithMessageID:34 withArguments:v10];
}

- (void)handleDeviceManagementResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  id v6 = [v4 context];
  int v7 = [v6 fromID];
  LODWORD(v5) = [(PBBridgeCompanionController *)self shouldHandleMessageType:v5 fromId:v7];

  if (v5)
  {
    id v8 = [PBBProtoDeviceManagementSetupResponse alloc];
    __int16 v9 = [v4 data];
    uint64_t v10 = [(PBBProtoDeviceManagementSetupResponse *)v8 initWithData:v9];

    uint64_t v11 = [(PBBProtoDeviceManagementSetupResponse *)v10 success];
    uint64_t v12 = [(PBBProtoDeviceManagementSetupResponse *)v10 error];
    if (v12)
    {
      id v18 = 0;
      char v13 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v12 error:&v18];
      id v14 = v18;
      if (v14)
      {
        BOOL v15 = pbb_devicemanagement_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[PBBridgeCompanionController handleDeviceManagementResponse:]();
        }
      }
    }
    else
    {
      char v13 = 0;
    }
    id setupDeviceManagementCompletion = (void (**)(id, uint64_t, void *))self->_setupDeviceManagementCompletion;
    if (setupDeviceManagementCompletion)
    {
      setupDeviceManagementCompletion[2](setupDeviceManagementCompletion, v11, v13);
      id v17 = self->_setupDeviceManagementCompletion;
      self->_id setupDeviceManagementCompletion = 0;
    }
  }
}

- (void)checkApplicationInstallAllowedWithCompletion:(id)a3
{
  id v4 = (void *)MEMORY[0x21D4A74C0](a3, a2);
  id applicationInstallAllowedCompletion = self->_applicationInstallAllowedCompletion;
  self->_id applicationInstallAllowedCompletion = v4;

  uint64_t v6 = MEMORY[0x263EFFA68];
  [(PBBridgeCompanionController *)self _sendRemoteCommandWithMessageID:35 withArguments:v6];
}

- (void)handleApplicationInstallRestrictionResponse:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [v13 type];
  uint64_t v5 = [v13 context];
  uint64_t v6 = [v5 fromID];
  LODWORD(v4) = [(PBBridgeCompanionController *)self shouldHandleMessageType:v4 fromId:v6];

  if (v4)
  {
    int v7 = [PBBProtoApplicationInstallRestrictionResponse alloc];
    id v8 = [v13 data];
    __int16 v9 = [(PBBProtoApplicationInstallRestrictionResponse *)v7 initWithData:v8];

    uint64_t v10 = [(PBBProtoApplicationInstallRestrictionResponse *)v9 allowed];
    id applicationInstallAllowedCompletion = (void (**)(id, uint64_t))self->_applicationInstallAllowedCompletion;
    if (applicationInstallAllowedCompletion)
    {
      applicationInstallAllowedCompletion[2](applicationInstallAllowedCompletion, v10);
      id v12 = self->_applicationInstallAllowedCompletion;
      self->_id applicationInstallAllowedCompletion = 0;
    }
  }
}

- (void)tellGizmoToUpdateNanoRegistryToNormalState
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[PBBridgeCompanionController tellGizmoToUpdateNanoRegistryToNormalState]";
    _os_log_impl(&dword_21C445000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(PBBridgeCompanionController *)self _sendRemoteCommandWithMessageID:36 withArguments:0];
}

- (RUIStyle)remoteUIStyle
{
  return self->_remoteUIStyle;
}

- (RUILoaderDelegate)ruiDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ruiDelegate);
  return (RUILoaderDelegate *)WeakRetained;
}

- (void)setRuiDelegate:(id)a3
{
}

- (PBBridgeConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PBBridgeConnectionDelegate *)WeakRetained;
}

- (NSURLConnection)activationConnection
{
  return self->_activationConnection;
}

- (void)setActivationConnection:(id)a3
{
}

- (NSMutableURLRequest)activationRequest
{
  return self->_activationRequest;
}

- (void)setActivationRequest:(id)a3
{
}

- (NSMutableData)activationData
{
  return self->_activationData;
}

- (void)setActivationData:(id)a3
{
}

- (RUILoader)ruiLoader
{
  return self->_ruiLoader;
}

- (void)setRuiLoader:(id)a3
{
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
}

- (NSDictionary)allHeaders
{
  return self->_allHeaders;
}

- (void)setAllHeaders:(id)a3
{
}

- (BOOL)nonSilentActivation
{
  return self->_nonSilentActivation;
}

- (void)setNonSilentActivation:(BOOL)a3
{
  self->_nonSilentActivation = a3;
}

- (BOOL)connectionFailed
{
  return self->_connectionFailed;
}

- (void)setConnectionFailed:(BOOL)a3
{
  self->_connectionFailed = a3;
}

- (BOOL)awaitingCustomResponse
{
  return self->_awaitingCustomResponse;
}

- (void)setAwaitingCustomResponse:(BOOL)a3
{
  self->_awaitingCustomResponse = a3;
}

- (int)activationState
{
  return self->_activationState;
}

- (void)setActivationState:(int)a3
{
  self->_int activationState = a3;
}

- (BOOL)isEstablishingPairing
{
  return self->_isEstablishingPairing;
}

- (void)setIsEstablishingPairing:(BOOL)a3
{
  self->_isEstablishingPairing = a3;
}

- (unsigned)granularActivationState
{
  return self->_granularActivationState;
}

- (void)setGranularActivationState:(unsigned __int16)a3
{
  self->_granularActivationState = a3;
}

- (OS_dispatch_source)activationTimeout
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

- (BOOL)allowAnyHTTPSCertificate
{
  return self->_allowAnyHTTPSCertificate;
}

- (void)setAllowAnyHTTPSCertificate:(BOOL)a3
{
  self->_allowAnyHTTPSCertificate = a3;
}

- (NSString)remoteActivationUserAgent
{
  return self->_remoteActivationUserAgent;
}

- (void)setRemoteActivationUserAgent:(id)a3
{
}

- (id)lockedOnAnimationCompletion
{
  return self->_lockedOnAnimationCompletion;
}

- (void)setLockedOnAnimationCompletion:(id)a3
{
}

- (id)initialSyncPrepCompletion
{
  return self->_initialSyncPrepCompletion;
}

- (void)setInitialSyncPrepCompletion:(id)a3
{
}

- (id)languageLocaleCompletion
{
  return self->_languageLocaleCompletion;
}

- (void)setLanguageLocaleCompletion:(id)a3
{
}

- (id)prepareWatchForForcedSUCompletion
{
  return self->_prepareWatchForForcedSUCompletion;
}

- (void)setPrepareWatchForForcedSUCompletion:(id)a3
{
}

- (id)remoteAccountForDeviceCompletion
{
  return self->_remoteAccountForDeviceCompletion;
}

- (void)setRemoteAccountForDeviceCompletion:(id)a3
{
}

- (id)tinkerCredentialsIngestedCompletion
{
  return self->_tinkerCredentialsIngestedCompletion;
}

- (void)setTinkerCredentialsIngestedCompletion:(id)a3
{
}

- (id)tinkerWiFiCredentialsIngestedCompletion
{
  return self->_tinkerWiFiCredentialsIngestedCompletion;
}

- (void)setTinkerWiFiCredentialsIngestedCompletion:(id)a3
{
}

- (id)buysOnWatchCredentialsIngestedCompletion
{
  return self->_buysOnWatchCredentialsIngestedCompletion;
}

- (void)setBuysOnWatchCredentialsIngestedCompletion:(id)a3
{
}

- (id)setupDeviceManagementCompletion
{
  return self->_setupDeviceManagementCompletion;
}

- (void)setSetupDeviceManagementCompletion:(id)a3
{
}

- (id)applicationInstallAllowedCompletion
{
  return self->_applicationInstallAllowedCompletion;
}

- (void)setApplicationInstallAllowedCompletion:(id)a3
{
}

- (BOOL)sentSessionRequest
{
  return self->_sentSessionRequest;
}

- (void)setSentSessionRequest:(BOOL)a3
{
  self->_sentSessionRequest = a3;
}

- (BOOL)sentActivationRequest
{
  return self->_sentActivationRequest;
}

- (void)setSentActivationRequest:(BOOL)a3
{
  self->_sentActivationRequest = a3;
}

- (id)appViewListImageCompletion
{
  return self->_appViewListImageCompletion;
}

- (void)setAppViewListImageCompletion:(id)a3
{
}

- (BOOL)passcodeSet
{
  return self->_passcodeSet;
}

- (void)setPasscodeSet:(BOOL)a3
{
  self->_BOOL passcodeSet = a3;
}

- (BOOL)selectedPairedUnlock
{
  return self->_selectedPairedUnlock;
}

- (void)setSelectedPairedUnlock:(BOOL)a3
{
  self->_selectedPairedUnlocuint64_t k = a3;
}

- (int)activationRetries
{
  return self->_activationRetries;
}

- (void)setActivationRetries:(int)a3
{
  self->_activationRetries = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_appViewListImageCompletion, 0);
  objc_storeStrong(&self->_applicationInstallAllowedCompletion, 0);
  objc_storeStrong(&self->_setupDeviceManagementCompletion, 0);
  objc_storeStrong(&self->_buysOnWatchCredentialsIngestedCompletion, 0);
  objc_storeStrong(&self->_tinkerWiFiCredentialsIngestedCompletion, 0);
  objc_storeStrong(&self->_tinkerCredentialsIngestedCompletion, 0);
  objc_storeStrong(&self->_remoteAccountForDeviceCompletion, 0);
  objc_storeStrong(&self->_prepareWatchForForcedSUCompletion, 0);
  objc_storeStrong(&self->_languageLocaleCompletion, 0);
  objc_storeStrong(&self->_initialSyncPrepCompletion, 0);
  objc_storeStrong(&self->_lockedOnAnimationCompletion, 0);
  objc_storeStrong((id *)&self->_remoteActivationUserAgent, 0);
  objc_storeStrong((id *)&self->_internalLastSendMessageID, 0);
  objc_storeStrong((id *)&self->_activationTimeout, 0);
  objc_storeStrong((id *)&self->_allHeaders, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_ruiLoader, 0);
  objc_storeStrong((id *)&self->_activationData, 0);
  objc_storeStrong((id *)&self->_activationRequest, 0);
  objc_storeStrong((id *)&self->_activationConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_ruiDelegate);
  objc_storeStrong((id *)&self->_remoteUIStyle, 0);
  objc_storeStrong((id *)&self->_timeoutTrackerQueue, 0);
}

- (void)tellWatchLanguagesAndLocaleSupportingTermOfAddress:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C445000, v0, v1, "ERROR! archivedPreferences was nil!!", v2, v3, v4, v5, v6);
}

- (void)tellWatchLanguagesAndLocaleSupportingTermOfAddress:withCompletion:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C445000, v0, v1, "ERROR! regionIdentifier was nil!!", v2, v3, v4, v5, v6);
}

- (void)tellWatchLanguagesAndLocaleSupportingTermOfAddress:withCompletion:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C445000, v0, v1, "ERROR! languages was nil!!", v2, v3, v4, v5, v6);
}

- (void)gizmoActivationFailed:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21C445000, v0, v1, "Gizmo Failed to Activate: (%@)", v2, v3, v4, v5, v6);
}

- (void)sendProxyActivationRequest:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sendProxyActivationRequest:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C445000, v0, v1, "Activation Request was nil.", v2, v3, v4, v5, v6);
}

- (void)sendProxyActivationRequest:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C445000, v0, v1, "Decoded request from Gizmo is nil.", v2, v3, v4, v5, v6);
}

- (void)sendProxyActivationWithCustomRequest:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C445000, v0, v1, "Activation Custom Request was nil.", v2, v3, v4, v5, v6);
}

- (void)loader:didFailWithError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21C445000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

- (void)connection:didFailWithError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21C445000, v0, v1, "ActivationStateFailure %@", v2, v3, v4, v5, v6);
}

- (void)connection:didFailWithError:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C445000, v0, v1, "Cloud Config State FAIL", v2, v3, v4, v5, v6);
}

- (void)connection:(uint64_t)a1 didFailWithError:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2[0] = 67109634;
  v2[1] = 1184;
  __int16 v3 = 2080;
  uint64_t v4 = "-[PBBridgeCompanionController connection:didFailWithError:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_error_impl(&dword_21C445000, a2, OS_LOG_TYPE_ERROR, "%d %s -- %@", (uint8_t *)v2, 0x1Cu);
}

- (void)connection:(uint64_t)a1 willSendRequest:(uint64_t)a2 redirectResponse:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a2 + 120);
  v4[0] = 67109890;
  v4[1] = 1218;
  __int16 v5 = 2080;
  uint64_t v6 = "-[PBBridgeCompanionController connection:willSendRequest:redirectResponse:]";
  __int16 v7 = 2112;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = v3;
  _os_log_error_impl(&dword_21C445000, log, OS_LOG_TYPE_ERROR, "%d %s -- %@ %@", (uint8_t *)v4, 0x26u);
}

- (void)connection:(int)a1 didReceiveResponse:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21C445000, a2, OS_LOG_TYPE_ERROR, "Receive Failure Response: %d", (uint8_t *)v2, 8u);
}

- (void)gizmoFailedToCreatePasscode:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2[0] = 67109634;
  v2[1] = 1404;
  __int16 v3 = 2080;
  uint64_t v4 = "-[PBBridgeCompanionController gizmoFailedToCreatePasscode:]";
  __int16 v5 = 2048;
  uint64_t v6 = a1;
  _os_log_error_impl(&dword_21C445000, a2, OS_LOG_TYPE_ERROR, "%d %s (Failed with Error: %ld)", (uint8_t *)v2, 0x1Cu);
}

- (void)handleRemoteActivationDetails:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21C445000, v0, v1, "ACTIVATION ERROR! %{public}@", v2, v3, v4, v5, v6);
}

- (void)handleRemoteActivationDetails:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v4 = 136315650;
  uint64_t v5 = "-[PBBridgeCompanionController handleRemoteActivationDetails:]";
  __int16 v6 = 2114;
  uint64_t v7 = a1;
  __int16 v8 = 2048;
  uint64_t v9 = [a2 length];
  _os_log_error_impl(&dword_21C445000, a3, OS_LOG_TYPE_ERROR, "%s Error (%{public}@) decoding request (%ld bytes)", (uint8_t *)&v4, 0x20u);
}

- (void)tinkerWatchIngestedCredentials:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_21C445000, v0, OS_LOG_TYPE_ERROR, " %s: Error unarchiving incoming error: %{public}@", (uint8_t *)v1, 0x16u);
}

- (void)handleDeviceManagementResponse:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_21C445000, v0, OS_LOG_TYPE_ERROR, " %s: Error unarchiving device management information: %{public}@", (uint8_t *)v1, 0x16u);
}

@end