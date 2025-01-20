@interface SDXPCConnection
- (SDXPCConnection)initWithServer:(id)a3 xpcConnection:(id)a4;
- (int)_entitled:(id)a3 state:(BOOL *)a4 label:(id)a5;
- (int)_entitledService:(id)a3 state:(BOOL *)a4;
- (void)_getInteractionsFromDBPerPeopleSuggestion:(id)a3 completion:(id)a4;
- (void)_getPeopleInfo:(id)a3 completion:(id)a4;
- (void)_getPeopleSuggestions:(id)a3 completion:(id)a4;
- (void)_handlePairedWatchWristStateChanged;
- (void)_invalidateAssertions;
- (void)accountForAppleID:(id)a3 withCompletion:(id)a4;
- (void)activateAssertionWithIdentifier:(id)a3;
- (void)activityStateWithCompletion:(id)a3;
- (void)appleIDInfoWithCompletion:(id)a3;
- (void)autoFillHelperActivate:(id)a3 completion:(id)a4;
- (void)autoFillHelperDidPickUsername:(id)a3 password:(id)a4 error:(id)a5;
- (void)autoFillHelperTryPIN:(id)a3;
- (void)autoFillHelperUserNotificationDidActivate:(id)a3;
- (void)autoFillHelperUserNotificationDidDismiss:(id)a3;
- (void)b389NFCPromptDidRequestPresentationWithConfiguration:(id)a3 responseHandler:(id)a4;
- (void)b389NFCPromptUpdateConfiguration:(id)a3;
- (void)beginMonitoringPairedWatchWristState;
- (void)bluetoothUserInteraction;
- (void)broadwayPresentCardWithCode:(id)a3 options:(id)a4 completion:(id)a5;
- (void)clearXPCHelperImageCacheWithCompletion:(id)a3;
- (void)connectionInvalidated;
- (void)contactIDForEmailHash:(id)a3 phoneHash:(id)a4 completion:(id)a5;
- (void)coordinatedAlertsRequestCancel;
- (void)coordinatedAlertsRequestFinish;
- (void)coordinatedAlertsRequestStart:(id)a3 completion:(id)a4;
- (void)deviceDiscoveryActivate:(id)a3 completion:(id)a4;
- (void)deviceDiscoveryFastScanCancel:(id)a3;
- (void)deviceDiscoveryFastScanTrigger:(id)a3;
- (void)deviceDiscoveryTriggerEnhancedDiscovery:(id)a3;
- (void)deviceDiscoveryTriggerEnhancedDiscovery:(id)a3 useCase:(unsigned int)a4 completion:(id)a5;
- (void)deviceDiscoveryUpdate:(id)a3;
- (void)diagnosticBLEModeWithCompletion:(id)a3;
- (void)diagnosticControl:(id)a3 completion:(id)a4;
- (void)diagnosticLogControl:(id)a3 completion:(id)a4;
- (void)diagnosticMock:(id)a3 device:(id)a4 completion:(id)a5;
- (void)diagnosticMockStart:(id)a3;
- (void)diagnosticMockStop:(id)a3;
- (void)diagnosticShow:(id)a3 completion:(id)a4;
- (void)diagnosticUnlockTestClientWithDevice:(id)a3;
- (void)diagnosticUnlockTestServer;
- (void)dismissCurrentB389NFCPrompt;
- (void)displayNameForEmailHash:(id)a3 phoneHash:(id)a4 completion:(id)a5;
- (void)displayStringForContactIdentifier:(id)a3 deviceIdentifier:(id)a4 completion:(id)a5;
- (void)findContact:(id)a3 skipIfContactBlocked:(BOOL)a4 completion:(id)a5;
- (void)getDeviceAssets:(id)a3 completion:(id)a4;
- (void)getPairedWatchWristStateWithCompletionHandler:(id)a3;
- (void)getPeopleSuggestions:(id)a3 completion:(id)a4;
- (void)getProblemFlagsWithCompletionHandler:(id)a3;
- (void)hashManagerControl:(id)a3 completion:(id)a4;
- (void)myAccountWithCompletion:(id)a3;
- (void)nfcTagReaderUIActivateWithEndpoint:(id)a3 params:(id)a4 completion:(id)a5;
- (void)openSetupURL:(id)a3 completion:(id)a4;
- (void)personInfoWithEmailOrPhone:(id)a3 completion:(id)a4;
- (void)preheatXPCConnection;
- (void)preventExitForLocaleReason:(id)a3;
- (void)proximityClientActivate:(id)a3 completion:(id)a4;
- (void)proximityClientDismissContentForDevice:(id)a3 completion:(id)a4;
- (void)proximityClientProvideContent:(id)a3 forDevice:(id)a4 force:(BOOL)a5 completion:(id)a6;
- (void)proximityClientRequestScannerTimerReset;
- (void)proximityClientStopSuppressingDevice:(id)a3 completion:(id)a4;
- (void)proximityClientSuppressDevice:(id)a3 completion:(id)a4;
- (void)proximityClientUpdate:(id)a3;
- (void)proximityClientUpdateContent:(id)a3 forDevice:(id)a4 completion:(id)a5;
- (void)reenableProxCardType:(unsigned __int8)a3 completion:(id)a4;
- (void)remoteInteractionSessionActivate:(id)a3 completion:(id)a4;
- (void)remoteInteractionSessionSendPayload:(id)a3;
- (void)repairDevice:(id)a3 flags:(unsigned int)a4 completion:(id)a5;
- (void)requestWithInfo:(id)a3 completion:(id)a4;
- (void)retriggerProximityPairing:(id)a3;
- (void)retriggerProximitySetup:(id)a3;
- (void)serviceActivate:(id)a3 completion:(id)a4;
- (void)servicePeerDisconnected:(id)a3 error:(id)a4;
- (void)serviceSendEvent:(id)a3;
- (void)serviceSendFrameType:(unsigned __int8)a3 data:(id)a4 peer:(id)a5;
- (void)serviceSendRequest:(id)a3;
- (void)serviceSendResponse:(id)a3;
- (void)serviceUpdate:(id)a3;
- (void)sessionActivate:(id)a3 completion:(id)a4;
- (void)sessionSendEvent:(id)a3;
- (void)sessionSendFrameType:(unsigned __int8)a3 data:(id)a4;
- (void)sessionSendRequest:(id)a3;
- (void)sessionSendResponse:(id)a3;
- (void)setAudioRoutingScore:(int)a3 completion:(id)a4;
- (void)setupDevice:(id)a3 homeIdentifier:(id)a4 completion:(id)a5;
- (void)shareAudioSessionActivate:(id)a3 completion:(id)a4;
- (void)shareAudioUserConfirmed;
- (void)showDevicePickerWithInfo:(id)a3 completion:(id)a4;
- (void)startProxCardTransactionWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)statusInfoWithCompletion:(id)a3;
- (void)subCredentialPresentCardWithParams:(id)a3 completion:(id)a4;
- (void)testContinuityKeyboardBegin:(BOOL)a3;
- (void)triggerHomeKitDeviceDetectedWithURL:(id)a3 completion:(id)a4;
- (void)triggerProximityAutoFillDetectedWithURL:(id)a3 completion:(id)a4;
- (void)userNotificationPresent:(id)a3;
- (void)wifiPasswordSharingAvailabilityWithCompletion:(id)a3;
@end

@implementation SDXPCConnection

- (SDXPCConnection)initWithServer:(id)a3 xpcConnection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SDXPCConnection;
  v9 = [(SDXPCConnection *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_server, a3);
    objc_storeStrong((id *)&v10->_xpcCnx, a4);
  }

  return v10;
}

- (void)connectionInvalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100967FA0 <= 20 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v18 = [(NSXPCConnection *)self->_xpcCnx processIdentifier];
    LogPrintF();
  }
  [(SDXPCConnection *)self _invalidateAssertions];
  if (self->_bluetoothUserInteraction)
  {
    [(SDProximityPairingAgent *)self->_server->_ppAgent bluetoothUserInteractionStop:self];
    self->_bluetoothUserInteraction = 0;
  }
  if (self->_caRequest)
  {
    -[SDNearbyAgent coordinatedAlertRequestCancel:](self->_server->_nearbyAgent, "coordinatedAlertRequestCancel:");
    [(SFCoordinatedAlertRequest *)self->_caRequest invalidate];
    caRequest = self->_caRequest;
    self->_caRequest = 0;
  }
  if (self->_diagnosticBLEModeStarted)
  {
    [(SDNearbyAgent *)self->_server->_nearbyAgent diagnosticBLEModeStop:self];
    self->_diagnosticBLEModeStarted = 0;
  }
  if (self->_ddRequest)
  {
    -[SDNearbyAgent deviceDiscoveryRequestStop:](self->_server->_nearbyAgent, "deviceDiscoveryRequestStop:");
    [(SFDeviceDiscovery *)self->_ddRequest invalidate];
    ddRequest = self->_ddRequest;
    self->_ddRequest = 0;
  }
  notification = self->_notification;
  if (notification)
  {
    [(SFUserAlert *)notification invalidate];
    v6 = self->_notification;
    self->_notification = 0;
  }
  if (self->_preventExitForLocaleReason)
  {
    id v7 = +[SDStatusMonitor sharedMonitor];
    [v7 removePreventExitForLocaleReason:self->_preventExitForLocaleReason];

    preventExitForLocaleReason = self->_preventExitForLocaleReason;
    self->_preventExitForLocaleReason = 0;
  }
  if (self->_proxClient)
  {
    -[SDProxHandoffAgent proximityClientStop:](self->_server->_proxHandoffAgent, "proximityClientStop:");
    [(SFProximityClient *)self->_proxClient invalidate];
    proxClient = self->_proxClient;
    self->_proxClient = 0;
  }
  if (self->_riSession)
  {
    -[SDRemoteInteractionAgent sessionStop:](self->_server->_riAgent, "sessionStop:");
    [(SFRemoteInteractionSession *)self->_riSession invalidate];
    riSession = self->_riSession;
    self->_riSession = 0;
  }
  service = self->_service;
  if (service)
  {
    objc_super v12 = [(SFService *)service identifier];
    unsigned int v13 = [v12 isEqualToString:SFServiceIdentifierPasswordSharing];

    if (v13)
    {
      v14 = +[NSNotificationCenter defaultCenter];
      [v14 postNotificationName:SFWiFiPasswordSharingAdvertisingEnded object:0];
    }
    [(SDNearbyAgent *)self->_server->_nearbyAgent serviceStop:self->_service];
    [(SFService *)self->_service invalidate];
    v15 = self->_service;
    self->_service = 0;
  }
  if (self->_session)
  {
    -[SDNearbyAgent sessionStop:](self->_server->_nearbyAgent, "sessionStop:");
    [(SFSession *)self->_session invalidate];
    session = self->_session;
    self->_session = 0;
  }
  [(SFShareAudioSessionDaemon *)self->_shareAudioSession invalidate];
  shareAudioSession = self->_shareAudioSession;
  self->_shareAudioSession = 0;

  if (self->_unlockTestClientStarted)
  {
    [(SDNearbyAgent *)self->_server->_nearbyAgent unlockStopTestClient];
    self->_unlockTestClientStarted = 0;
  }
}

- (int)_entitled:(id)a3 state:(BOOL *)a4 label:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (*a4
    || ([(NSXPCConnection *)self->_xpcCnx cuValueForEntitlementNoCache:v8],
        v10 = objc_claimAutoreleasedReturnValue(),
        *a4 = [v10 isEqual:&__kCFBooleanTrue],
        v10,
        *a4))
  {
    int v11 = 0;
  }
  else
  {
    if (dword_100967FA0 <= 60 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
    {
      [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      LogPrintF();
    }
    int v11 = -6768;
  }

  return v11;
}

- (int)_entitledService:(id)a3 state:(BOOL *)a4
{
  id v6 = a3;
  if (*a4)
  {
    int v8 = 0;
    id v7 = 0;
  }
  else
  {
    id v7 = [(NSXPCConnection *)self->_xpcCnx cuValueForEntitlementNoCache:@"com.apple.sharing.Services"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || CFGetInt64())
    {
      int v8 = 0;
    }
    else
    {
      if (dword_100967FA0 <= 60 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
      {
        [(NSXPCConnection *)self->_xpcCnx processIdentifier];
        LogPrintF();
      }
      int v8 = -6768;
    }
  }

  return v8;
}

- (void)autoFillHelperActivate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  int v8 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
  {
    CFStringRef v16 = @"AutoFillHelperActivate";
    LogPrintF();
  }
  signed int v9 = [(SDXPCConnection *)self _entitled:@"com.apple.sharing.RemoteInteractionSession", &self->_entitledRemoteInteractionSession, @"AutoFillHelperActivate", v16 state label];
  if (!v9)
  {
    if (!self->_afsHelper)
    {
      [v7 setDispatchQueue:self->_server->_dispatchQueue];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1001497AC;
      v19[3] = &unk_1008CA4B8;
      v19[4] = self;
      [v7 setDismissUserNotificationHandler:v19];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100149810;
      v18[3] = &unk_1008CE268;
      v18[4] = self;
      [v7 setPairingResponseHandler:v18];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100149898;
      v17[3] = &unk_1008CC1B0;
      v17[4] = self;
      [v7 setPromptForPINHandler:v17];
      signed int v9 = [(SDAutoFillAgent *)self->_server->_autoFillAgent helperStart:v7];
      if (v9) {
        goto LABEL_10;
      }
      objc_storeStrong((id *)&self->_afsHelper, a3);
    }
    signed int v9 = 0;
  }
LABEL_10:
  if (v8)
  {
    if (v9)
    {
      uint64_t v10 = v9;
      NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
      uint64_t v11 = +[NSString stringWithUTF8String:DebugGetErrorString()];
      objc_super v12 = (void *)v11;
      CFStringRef v13 = @"?";
      if (v11) {
        CFStringRef v13 = (const __CFString *)v11;
      }
      CFStringRef v21 = v13;
      v14 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      v15 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v10 userInfo:v14];
      v8[2](v8, v15);
    }
    else
    {
      v8[2](v8, 0);
    }
  }
}

- (void)autoFillHelperDidPickUsername:(id)a3 password:(id)a4 error:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  afsHelper = self->_afsHelper;
  if ((!afsHelper
     || [(SDAutoFillAgent *)self->_server->_autoFillAgent helper:afsHelper didPickUsername:v11 password:v8 error:v9])&& dword_100967FA0 <= 60&& (dword_100967FA0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)autoFillHelperTryPIN:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  afsHelper = self->_afsHelper;
  if ((!afsHelper || [(SDAutoFillAgent *)self->_server->_autoFillAgent helper:afsHelper tryPIN:v5])
    && dword_100967FA0 <= 60
    && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)autoFillHelperUserNotificationDidActivate:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  afsHelper = self->_afsHelper;
  if ((!afsHelper
     || [(SDAutoFillAgent *)self->_server->_autoFillAgent helper:afsHelper userNotificationDidActivate:v5])&& dword_100967FA0 <= 60&& (dword_100967FA0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)autoFillHelperUserNotificationDidDismiss:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  afsHelper = self->_afsHelper;
  if ((!afsHelper
     || [(SDAutoFillAgent *)self->_server->_autoFillAgent helper:afsHelper userNotificationDidDismiss:v5])&& dword_100967FA0 <= 60&& (dword_100967FA0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)activateAssertionWithIdentifier:(id)a3
{
  id v20 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  unsigned int v4 = [(SDXPCConnection *)self _entitled:@"com.apple.sharing.Client" state:&self->_entitledClient label:@"ActivateAssertion"];
  id v5 = v20;
  if (!v4)
  {
    id v6 = v20;
    if (!v6)
    {
LABEL_26:

      id v5 = v20;
      goto LABEL_27;
    }
    if ([(NSMutableSet *)self->_assertions containsObject:v6])
    {
      if (dword_100967FA0 > 30 || dword_100967FA0 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_26;
      }
      goto LABEL_6;
    }
    assertions = self->_assertions;
    if (!assertions)
    {
      id v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      id v9 = self->_assertions;
      self->_assertions = v8;

      assertions = self->_assertions;
    }
    [(NSMutableSet *)assertions addObject:v6];
    NSUInteger v10 = [(NSCountedSet *)self->_server->_assertions countForObject:v6];
    id v11 = self->_server->_assertions;
    if (!v11)
    {
      objc_super v12 = (NSCountedSet *)objc_alloc_init((Class)NSCountedSet);
      server = self->_server;
      v14 = server->_assertions;
      server->_assertions = v12;

      id v11 = self->_server->_assertions;
    }
    [(NSCountedSet *)v11 addObject:v6];
    if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
    {
      NSUInteger v18 = v10;
      NSUInteger v19 = v10 + 1;
      id v17 = v6;
      LogPrintF();
    }
    if (v10) {
      goto LABEL_26;
    }
    if ([v6 isEqual:@"com.apple.sharing.PreventAppleCardActivation"])
    {
      byte_1009942CC = 1;
      goto LABEL_26;
    }
    if ([v6 isEqual:@"com.apple.sharing.DuetSync"])
    {
      byte_1009942CD = 1;
    }
    else
    {
      if ([v6 isEqual:@"com.apple.sharing.PreventContinuityKeyboard"])
      {
        [(SDAutoFillAgent *)self->_server->_autoFillAgent setPreventNotifications:1];
        [(SDRemoteInteractionAgent *)self->_server->_riAgent setPreventNotifications:1];
        goto LABEL_26;
      }
      if (![v6 isEqual:@"com.apple.sharing.PreventNearbyActionAdvertising"])
      {
        if ([v6 isEqual:@"com.apple.sharing.PreventProxCards"])
        {
          gSDProxCardsSuppressed = 1;
          goto LABEL_26;
        }
        if ([v6 isEqual:@"com.apple.sharing.PreventRepair"])
        {
          [(SDSetupAgent *)self->_server->_setupAgent setPreventRepair:1];
          goto LABEL_26;
        }
        if (![v6 isEqual:@"com.apple.sharing.EnhancedDiscovery"])
        {
          if (dword_100967FA0 > 30 || dword_100967FA0 == -1 && !_LogCategory_Initialize()) {
            goto LABEL_26;
          }
LABEL_6:
          LogPrintF();
          goto LABEL_26;
        }
        v15 = +[SDNearbyAgent sharedNearbyAgent];
        [v15 setEnhancedDiscovery:1];
LABEL_23:

        goto LABEL_26;
      }
      CFStringRef v16 = +[SDNearbyAgent sharedNearbyAgent];
      [v16 setPreventNearbyActionAdvertising:1];
    }
    v15 = +[SDNearbyAgent sharedNearbyAgent];
    [v15 update];
    goto LABEL_23;
  }
LABEL_27:
}

- (void)_invalidateAssertions
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v3 = self->_assertions;
  id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v7);
        NSUInteger v9 = -[NSCountedSet countForObject:](self->_server->_assertions, "countForObject:", v8, v13, v14, v15);
        [(NSCountedSet *)self->_server->_assertions removeObject:v8];
        if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
        {
          NSUInteger v14 = v9;
          NSUInteger v15 = v9 - 1;
          CFStringRef v13 = v8;
          LogPrintF();
        }
        if (v9 == 1)
        {
          if ([v8 isEqual:@"com.apple.sharing.PreventAppleCardActivation"])
          {
            byte_1009942CC = 0;
            goto LABEL_21;
          }
          if ([v8 isEqual:@"com.apple.sharing.DuetSync"])
          {
            byte_1009942CD = 0;
            goto LABEL_19;
          }
          if ([v8 isEqual:@"com.apple.sharing.PreventContinuityKeyboard"])
          {
            [(SDAutoFillAgent *)self->_server->_autoFillAgent setPreventNotifications:0];
            [(SDRemoteInteractionAgent *)self->_server->_riAgent setPreventNotifications:0];
            goto LABEL_21;
          }
          if ([v8 isEqual:@"com.apple.sharing.PreventNearbyActionAdvertising"])
          {
            NSUInteger v10 = +[SDNearbyAgent sharedNearbyAgent];
            [v10 setPreventNearbyActionAdvertising:0];

LABEL_19:
            id v11 = +[SDNearbyAgent sharedNearbyAgent];
            [v11 update];
LABEL_20:

            goto LABEL_21;
          }
          if ([v8 isEqual:@"com.apple.sharing.PreventProxCards"])
          {
            gSDProxCardsSuppressed = 0;
          }
          else if ([v8 isEqual:@"com.apple.sharing.PreventRepair"])
          {
            [(SDSetupAgent *)self->_server->_setupAgent setPreventRepair:0];
          }
          else
          {
            if ([v8 isEqual:@"com.apple.sharing.EnhancedDiscovery"])
            {
              id v11 = +[SDNearbyAgent sharedNearbyAgent];
              [v11 setEnhancedDiscovery:0];
              goto LABEL_20;
            }
            if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
            {
              CFStringRef v13 = v8;
              LogPrintF();
            }
          }
        }
LABEL_21:
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v12 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      id v5 = v12;
    }
    while (v12);
  }

  [(NSMutableSet *)self->_assertions removeAllObjects];
}

- (void)activityStateWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  signed int v5 = [(SDXPCConnection *)self _entitled:@"com.apple.sharing.Client" state:&self->_entitledClient label:@"ActivityState"];
  if (v5)
  {
    if (v4)
    {
      uint64_t v6 = v5;
      NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
      uint64_t v7 = +[NSString stringWithUTF8String:DebugGetErrorString()];
      id v8 = (void *)v7;
      CFStringRef v9 = @"?";
      if (v7) {
        CFStringRef v9 = (const __CFString *)v7;
      }
      CFStringRef v13 = v9;
      NSUInteger v10 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
      id v11 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v6 userInfo:v10];
      v4[2](v4, 0, v11);
    }
  }
  else
  {
    [(SDNearbyAgent *)self->_server->_nearbyAgent activityStateWithCompletion:v4];
  }
}

- (void)accountForAppleID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (v7)
  {
    unsigned int v8 = [(SDXPCConnection *)self _entitled:@"com.apple.sharing.Client" state:&self->_entitledClient label:@"AppleIDAuth"];
    if (v8)
    {
      int v11 = v8;
    }
    else
    {
      uint64_t v9 = [(SDAppleIDAgent *)self->_server->_appleIDAgent accountForAppleID:v6];
      if (v9)
      {
        NSUInteger v10 = (void *)v9;
        sub_10014A7DC();
        v7[2](v7, v10, 0);
LABEL_5:

        goto LABEL_6;
      }
      int v11 = 201202;
    }
    sub_10014A7DC();
    uint64_t v12 = v11;
    NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
    uint64_t v13 = +[NSString stringWithUTF8String:DebugGetErrorString()];
    NSUInteger v10 = (void *)v13;
    CFStringRef v14 = @"?";
    if (v13) {
      CFStringRef v14 = (const __CFString *)v13;
    }
    CFStringRef v18 = v14;
    NSUInteger v15 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    long long v16 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v12 userInfo:v15];
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v16);

    goto LABEL_5;
  }
LABEL_6:
}

- (void)appleIDInfoWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, uint64_t, void))a3;
  signed int v5 = +[SDStatusMonitor sharedMonitor];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  signed int v6 = [(SDXPCConnection *)self _entitled:@"com.apple.sharing.Client" state:&self->_entitledClient label:@"AppleIDInfo"];
  if (v6)
  {
    unsigned int v8 = 0;
    NSUInteger v10 = 0;
  }
  else
  {
    uint64_t v7 = [v5 myAppleID];
    if (!v7)
    {
      if (dword_100967FA0 > 60)
      {
        unsigned int v8 = 0;
        NSUInteger v10 = 0;
        goto LABEL_20;
      }
      if (dword_100967FA0 == -1)
      {
        unsigned int v8 = 0;
        if (!_LogCategory_Initialize())
        {
          signed int v6 = -6727;
          NSUInteger v10 = 0;
          goto LABEL_21;
        }
        NSUInteger v10 = 0;
      }
      else
      {
        unsigned int v8 = 0;
        NSUInteger v10 = 0;
      }
LABEL_15:
      LogPrintF();
LABEL_20:
      signed int v6 = -6727;
      goto LABEL_21;
    }
    unsigned int v8 = (void *)v7;
    uint64_t v9 = [v5 myAppleIDValidationRecord];
    NSUInteger v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v9 objectForKeyedSubscript:@"AppleIDAccountValidationRecordData"];
      if (v11)
      {
        uint64_t v12 = (void *)v11;
        if (v4) {
          v4[2](v4, v8, v11, 0);
        }
        goto LABEL_7;
      }
      if (dword_100967FA0 > 60 || dword_100967FA0 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_20;
      }
      goto LABEL_15;
    }
    signed int v6 = -6762;
  }
LABEL_21:
  if (v4)
  {
    uint64_t v13 = v6;
    NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
    uint64_t v14 = +[NSString stringWithUTF8String:DebugGetErrorString()];
    NSUInteger v15 = (void *)v14;
    CFStringRef v16 = @"?";
    if (v14) {
      CFStringRef v16 = (const __CFString *)v14;
    }
    CFStringRef v20 = v16;
    NSErrorUserInfoKey v17 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    CFStringRef v18 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v13 userInfo:v17];
    ((void (**)(id, void *, uint64_t, void *))v4)[2](v4, 0, 0, v18);
  }
  uint64_t v12 = 0;
LABEL_7:
}

- (void)subCredentialPresentCardWithParams:(id)a3 completion:(id)a4
{
  id v9 = a3;
  signed int v6 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (![(SDXPCConnection *)self _entitled:@"com.apple.sharing.Client" state:&self->_entitledClient label:@"subCredentialPresentCard"])
  {
    if (dword_100967FA0 <= 50 && (dword_100967FA0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v7 = +[SDSubCredentialAgent sharedAgent];
    [v7 uiPresentWithParamsDirect:v9 completion:v6];
  }
  if (v6)
  {
    unsigned int v8 = NSErrorWithOSStatusF();
    v6[2](v6, v8);
  }
}

- (void)broadwayPresentCardWithCode:(id)a3 options:(id)a4 completion:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (![(SDXPCConnection *)self _entitled:@"com.apple.sharing.Client" state:&self->_entitledClient label:@"BroadwayPresentCard"])
  {
    if (dword_100967FA0 <= 50 && (dword_100967FA0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    NSUInteger v10 = +[SDBroadwayAgent sharedAgent];
    [v10 preparePresentationWithBroadwayActivationCode:v12 testInfo:v8];
  }
  if (v9)
  {
    uint64_t v11 = NSErrorWithOSStatusF();
    v9[2](v9, v11);
  }
}

- (void)clearXPCHelperImageCacheWithCompletion:(id)a3
{
  v3 = (void (**)(id, void))a3;
  +[SDXPCHelperImageCache clearCacheWithSync:1];
  v3[2](v3, 0);
}

- (void)contactIDForEmailHash:(id)a3 phoneHash:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  NSUInteger v10 = (char *)a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  uint64_t v11 = +[SDStatusMonitor sharedMonitor];
  signed int v12 = [(SDXPCConnection *)self _entitled:@"com.apple.sharing.Client" state:&self->_entitledClient label:@"ContactIDForHashes"];
  if (v12)
  {
    uint64_t v13 = 0;
    NSUInteger v15 = 0;
    CFStringRef v16 = 0;
    if (!v10) {
      goto LABEL_13;
    }
LABEL_7:
    if (!v12)
    {
      (*((void (**)(char *, void *, void))v10 + 2))(v10, v16, 0);
      goto LABEL_13;
    }
    v23 = v10 + 16;
    id v24 = v9;
    id v25 = v8;
    goto LABEL_9;
  }
  uint64_t v13 = [v11 contactsForEmailHash:v8 phoneHash:v9];
  uint64_t v14 = [v11 contactWithPreferredIdentifierForContacts:v13];
  if (v14)
  {
    NSUInteger v15 = v14;
    CFStringRef v16 = [v14 identifier];
    if (v16) {
      signed int v12 = 0;
    }
    else {
      signed int v12 = -6742;
    }
    if (!v10) {
      goto LABEL_13;
    }
    goto LABEL_7;
  }
  if (!v10)
  {
    CFStringRef v16 = 0;
    NSUInteger v15 = 0;
    goto LABEL_13;
  }
  id v24 = v9;
  id v25 = v8;
  NSUInteger v15 = 0;
  CFStringRef v16 = 0;
  v23 = v10 + 16;
  signed int v12 = -6727;
LABEL_9:
  uint64_t v17 = v12;
  NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
  uint64_t v18 = +[NSString stringWithUTF8String:DebugGetErrorString()];
  NSErrorUserInfoKey v19 = (void *)v18;
  CFStringRef v20 = @"?";
  if (v18) {
    CFStringRef v20 = (const __CFString *)v18;
  }
  CFStringRef v27 = v20;
  CFStringRef v21 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1, v23);
  v22 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v17 userInfo:v21];
  (*((void (**)(char *, void *, void *))v10 + 2))(v10, v16, v22);

  id v9 = v24;
  id v8 = v25;
LABEL_13:
}

- (void)displayNameForEmailHash:(id)a3 phoneHash:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  NSUInteger v10 = (void (**)(id, void, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  uint64_t v11 = +[SDStatusMonitor sharedMonitor];
  signed int v12 = [(SDXPCConnection *)self _entitled:@"com.apple.sharing.Client" state:&self->_entitledClient label:@"DisplayNameForHashes"];
  if (v12)
  {
    uint64_t v13 = 0;
    CFStringRef v16 = 0;
    NSUInteger v15 = 0;
    if (!v10) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
  uint64_t v13 = [v11 contactsForEmailHash:v8 phoneHash:v9];
  uint64_t v14 = [v11 contactWithPreferredIdentifierForContacts:v13];
  if (!v14)
  {
    if (!v10)
    {
LABEL_13:
      CFStringRef v16 = 0;
      NSUInteger v15 = 0;
      goto LABEL_5;
    }
    signed int v12 = -6727;
LABEL_10:
    uint64_t v17 = v12;
    NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
    uint64_t v18 = +[NSString stringWithUTF8String:DebugGetErrorString()];
    NSErrorUserInfoKey v19 = (void *)v18;
    CFStringRef v20 = @"?";
    if (v18) {
      CFStringRef v20 = (const __CFString *)v18;
    }
    CFStringRef v24 = v20;
    CFStringRef v21 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    v22 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v17 userInfo:v21];
    v10[2](v10, 0, v22);

    goto LABEL_13;
  }
  NSUInteger v15 = (void *)v14;
  CFStringRef v16 = +[CNContactFormatter stringFromContact:v14 style:0];
  if (v10) {
    ((void (**)(id, void *, void *))v10)[2](v10, v16, 0);
  }
LABEL_5:
}

- (void)displayStringForContactIdentifier:(id)a3 deviceIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  NSUInteger v10 = (void (**)(id, void *, id, void *))a5;
  uint64_t v11 = +[SDStatusMonitor sharedMonitor];
  signed int v12 = [v11 meCard];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  signed int v13 = [(SDXPCConnection *)self _entitled:@"com.apple.sharing.Client" state:&self->_entitledClient label:@"DisplayNameForHashes"];
  if (v13)
  {
    id v15 = 0;
    v22 = 0;
    if (!v10) {
      goto LABEL_21;
    }
    goto LABEL_16;
  }
  uint64_t v14 = [v12 identifier];
  id v15 = [v8 isEqual:v14];

  if (v15)
  {
    CFStringRef v16 = [(SDNearbyAgent *)self->_server->_nearbyAgent idsDeviceForBluetoothDeviceID:v9 conflictDetected:0];
    id v17 = v16;
    if (v16)
    {
      uint64_t v18 = [v16 name];
    }
    else
    {
      if (dword_100967FA0 <= 60 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
      {
        id v31 = v9;
        LogPrintF();
      }
      uint64_t v18 = +[CNContactFormatter stringFromContact:style:](CNContactFormatter, "stringFromContact:style:", v12, 0, v31);
    }
    v22 = (void *)v18;
  }
  else
  {
    id v17 = objc_alloc_init((Class)CNContactStore);
    NSErrorUserInfoKey v19 = +[CNContactFormatter descriptorForRequiredKeysForStyle:0];
    v35 = v19;
    CFStringRef v20 = +[NSArray arrayWithObjects:&v35 count:1];

    CFStringRef v21 = [v17 unifiedContactWithIdentifier:v8 keysToFetch:v20 error:0];
    v22 = +[CNContactFormatter stringFromContact:v21 style:0];
  }
  if (v22) {
    signed int v13 = 0;
  }
  else {
    signed int v13 = -6727;
  }
  if (v10)
  {
LABEL_16:
    if (v13)
    {
      uint64_t v23 = v13;
      id v32 = v8;
      NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
      uint64_t v24 = +[NSString stringWithUTF8String:DebugGetErrorString()];
      id v25 = (void *)v24;
      CFStringRef v26 = @"?";
      if (v24) {
        CFStringRef v26 = (const __CFString *)v24;
      }
      CFStringRef v34 = v26;
      +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      CFStringRef v27 = v12;
      v29 = id v28 = v9;
      v30 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v23 userInfo:v29];
      v10[2](v10, v22, v15, v30);

      id v9 = v28;
      signed int v12 = v27;

      id v8 = v32;
    }
    else
    {
      v10[2](v10, v22, v15, 0);
    }
  }
LABEL_21:
}

- (void)myAccountWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (v4)
  {
    unsigned int v5 = [(SDXPCConnection *)self _entitled:@"com.apple.sharing.Client" state:&self->_entitledClient label:@"AppleIDAuth"];
    if (v5)
    {
      int v8 = v5;
    }
    else
    {
      uint64_t v6 = [(SDAppleIDAgent *)self->_server->_appleIDAgent myAccount];
      if (v6)
      {
        uint64_t v7 = (void *)v6;
        sub_10014A7DC();
        v4[2](v4, v7, 0);
LABEL_5:

        goto LABEL_6;
      }
      int v8 = 201202;
    }
    sub_10014A7DC();
    uint64_t v9 = v8;
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    uint64_t v10 = +[NSString stringWithUTF8String:DebugGetErrorString()];
    uint64_t v7 = (void *)v10;
    CFStringRef v11 = @"?";
    if (v10) {
      CFStringRef v11 = (const __CFString *)v10;
    }
    CFStringRef v15 = v11;
    signed int v12 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    signed int v13 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v9 userInfo:v12];
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v13);

    goto LABEL_5;
  }
LABEL_6:
}

- (void)findContact:(id)a3 skipIfContactBlocked:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if ([(SDXPCConnection *)self _entitled:@"com.apple.sharing.Client" state:&self->_entitledClient label:@"FindContact"])
  {
    uint64_t v10 = NSErrorWithOSStatusF();
    v9[2](v9, 0, v10);
  }
  else
  {
    contactsQueue = self->_server->_contactsQueue;
    if (!contactsQueue)
    {
      dispatch_queue_t v12 = dispatch_queue_create("SharingFindContact", 0);
      server = self->_server;
      NSErrorUserInfoKey v14 = server->_contactsQueue;
      server->_contactsQueue = (OS_dispatch_queue *)v12;

      contactsQueue = self->_server->_contactsQueue;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10014B914;
    block[3] = &unk_1008CE290;
    id v16 = v8;
    BOOL v18 = a4;
    id v17 = v9;
    dispatch_async(contactsQueue, block);
  }
}

- (void)getDeviceAssets:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  CFStringRef v26 = sub_10014C464;
  CFStringRef v27 = sub_10014C474;
  id v28 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10014C47C;
  v20[3] = &unk_1008CE2B8;
  v22 = &v23;
  id v7 = a4;
  id v21 = v7;
  id v8 = objc_retainBlock(v20);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (-[SDXPCConnection _entitled:state:label:](self, "_entitled:state:label:", @"com.apple.sharing.Session", &self->_entitledClient, @"GetDeviceAssets")|| (uint32_t v9 = arc4random(), (v10 = [v6 bluetoothProductID]) == 0))
  {
    uint64_t v12 = NSErrorF();
    id v13 = (id)v24[5];
    v24[5] = v12;
  }
  else
  {
    unsigned int v11 = [v6 colorCode];
    if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v13 = [objc_alloc((Class)SFDeviceAssetQuery) initWithBluetoothProductIdentifier:v10 color:v11];
    id v14 = objc_alloc_init((Class)SFDeviceAssetManager);
    [v14 setDispatchQueue:self->_server->_dispatchQueue];
    id v15 = objc_alloc((Class)SFDeviceAssetRequestConfiguration);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10014C554;
    v17[3] = &unk_1008CE2E0;
    uint32_t v19 = v9;
    id v18 = v7;
    id v16 = [v15 initWithQueryResultHandler:v17];
    [v6 timeoutSeconds];
    [v16 setTimeout:];
    [v14 activate];
    [v14 getAssetBundleForDeviceQuery:v13 withRequestConfiguration:v16];
  }
  ((void (*)(void *))v8[2])(v8);

  _Block_object_dispose(&v23, 8);
}

- (void)getPeopleSuggestions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint32_t v9 = dispatch_queue_create("SharingGetPeopleSuggestions", v8);

  unsigned int v10 = [v6 contactIDs];

  if (v10)
  {
    unsigned int v11 = v16;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    uint64_t v12 = sub_10014C8DC;
  }
  else
  {
    if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
    {
      [v6 maxPeople];
      [v6 excludeBackfills];
      LogPrintF();
    }
    unsigned int v11 = v15;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    uint64_t v12 = sub_10014C8EC;
  }
  v11[2] = v12;
  v11[3] = &unk_1008CAD48;
  v11[4] = self;
  v11[5] = v6;
  v11[6] = v7;
  id v13 = v7;
  id v14 = v6;
  dispatch_async(v9, v11);
}

- (void)_getPeopleInfo:(id)a3 completion:(id)a4
{
  v37 = (void (**)(id, id, void))a4;
  unsigned int v5 = [a3 contactIDs];
  id v6 = [v5 count];
  if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
  {
    unint64_t v32 = (unint64_t)v6;
    LogPrintF();
  }
  if (v6)
  {
    v58[0] = CNContactEmailAddressesKey;
    v58[1] = CNContactInstantMessageAddressesKey;
    v58[2] = CNContactPhoneNumbersKey;
    id v7 = +[NSArray arrayWithObjects:v58 count:3];
    id v8 = objc_alloc_init((Class)CNContactStore);
    uint32_t v9 = +[CNContact predicateForContactsWithIdentifiers:v5];
    id v55 = 0;
    uint64_t v10 = [v8 unifiedContactsMatchingPredicate:v9 keysToFetch:v7 error:&v55];
    id v11 = v55;
    uint64_t v12 = v11;
    v43 = (void *)v10;
    if ((!v10 || v11) && dword_100967FA0 <= 90 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
    {
      unint64_t v32 = (unint64_t)v12;
      LogPrintF();
    }
  }
  else
  {
    v43 = 0;
  }
  id v41 = objc_alloc_init((Class)NSMutableArray);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v5;
  id v44 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v44)
  {
    int v13 = 0;
    uint64_t v45 = 0;
    id v14 = 0;
    uint64_t v42 = *(void *)v52;
    id v38 = v6;
    uint64_t v39 = 0;
    do
    {
      for (i = 0; i != v44; i = (char *)i + 1)
      {
        int v46 = v13;
        if (*(void *)v52 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v51 + 1) + 8 * i);
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v17 = v43;
        id v18 = [v17 countByEnumeratingWithState:&v47 objects:v56 count:16];
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = *(void *)v48;
LABEL_21:
          uint64_t v21 = 0;
          while (1)
          {
            if (*(void *)v48 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v47 + 1) + 8 * v21);
            uint64_t v23 = [v22 identifier:v32, v33, v34, v35, v36];
            unsigned __int8 v24 = [v23 isEqual:v16];

            if (v24) {
              break;
            }
            if (v19 == (id)++v21)
            {
              id v19 = [v17 countByEnumeratingWithState:&v47 objects:v56 count:16];
              if (v19) {
                goto LABEL_21;
              }
              goto LABEL_27;
            }
          }
          id v25 = v22;

          if (!v25) {
            goto LABEL_32;
          }
          CFStringRef v26 = +[SDStatusMonitor sharedMonitor];
          unsigned int v27 = [v26 contactIsBlocked:v25];

          if (v27)
          {
            id v28 = objc_alloc_init((Class)SFPeopleSuggesterResult);
            [v28 setContactID:v16];
            [v28 setFlags:1];
            [v41 addObject:v28];
            ++v39;
          }
          v29 = [v25 emailAddresses];
          v30 = &v14[(void)[v29 count]];

          id v31 = [v25 phoneNumbers];
          id v14 = (char *)[v31 count] + (void)v30;
        }
        else
        {
LABEL_27:

LABEL_32:
          id v25 = objc_alloc_init((Class)SFPeopleSuggesterResult);
          [v25 setContactID:v16];
          [v25 setFlags:2];
          [v41 addObject:v25];
          ++v45;
        }

        int v13 = v46 + 1;
        if (__ROR8__(0x8F5C28F5C28F5C29 * (void)v14, 2) <= 0x28F5C28F5C28F5CuLL
          && dword_100967FA0 <= 30
          && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v35 = v39;
          uint64_t v36 = v45;
          id v33 = v38;
          CFStringRef v34 = v14;
          unint64_t v32 = (v46 + 1);
          LogPrintF();
        }
      }
      id v44 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
    }
    while (v44);
  }

  if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
  {
    [obj count:v32];
    LogPrintF();
  }
  v37[2](v37, v41, 0);
}

- (void)_getPeopleSuggestions:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v31 = a4;
  id v6 = objc_alloc_init((Class)_PSSuggesterConfiguration);
  if ([v5 excludeBackfills]) {
    [v6 setExcludeBackfillSuggestions:1];
  }
  id v32 = v5;
  id v7 = [v5 maxPeople];
  if (v7) {
    uint64_t v8 = (2 * v7);
  }
  else {
    uint64_t v8 = 100;
  }
  [v6 setMaximumNumberOfSuggestions:v8];
  v30 = v6;
  id v9 = [objc_alloc((Class)_PSSuggester) initWithConfiguration:v6];
  id v28 = objc_alloc_init((Class)_PSPredictionContext);
  v29 = v9;
  uint64_t v10 = [v9 rankedGlobalSuggestionsFromContext:x0 contactsOnly:x1];
  id v11 = objc_alloc_init((Class)NSMutableSet);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v10;
  id v12 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v34 = *(void *)v42;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v42 != v34) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        uint64_t v16 = [v15 recipients];
        id v17 = [v16 countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = *(void *)v38;
          while (2)
          {
            for (j = 0; j != v18; j = (char *)j + 1)
            {
              if (*(void *)v38 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = [*(id *)(*((void *)&v37 + 1) + 8 * (void)j) identifier];
              if (([v11 containsObject:v21] & 1) == 0)
              {
                [v11 addObject:v21];
                if (v7)
                {
                  if ((unint64_t)[v11 count] >= v7)
                  {

                    goto LABEL_23;
                  }
                }
              }
            }
            id v18 = [v16 countByEnumeratingWithState:&v37 objects:v45 count:16];
            if (v18) {
              continue;
            }
            break;
          }
        }
LABEL_23:
      }
      id v13 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v13);
  }

  if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
  {
    id v25 = [obj count];
    id v26 = [v11 count];
    id v24 = v7;
    LogPrintF();
  }
  if (objc_msgSend(v11, "count", v24, v25, v26))
  {
    v22 = v32;
    if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v23 = [v11 allObjects];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10014D310;
    v35[3] = &unk_1008CE308;
    id v36 = v31;
    [(SDXPCConnection *)self _getInteractionsFromDBPerPeopleSuggestion:v23 completion:v35];
  }
  else
  {
    v22 = v32;
    if (dword_100967FA0 <= 90 && (dword_100967FA0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    (*((void (**)(id, void *, void))v31 + 2))(v31, &__NSArray0__struct, 0);
  }
}

- (void)_getInteractionsFromDBPerPeopleSuggestion:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v65 = (void (**)(id, void *, void))a4;
  id v6 = +[_CDInteractionStore defaultDatabaseDirectory];
  id v7 = +[_CDInteractionStore storeWithDirectory:v6 readOnly:1];

  id v68 = objc_alloc_init((Class)NSMutableArray);
  id v8 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v9 = +[NSPredicate predicateWithFormat:@"direction == %i", 1];
  uint64_t v10 = +[NSPredicate predicateWithFormat:@"sender.personId != nil"];
  uint64_t v11 = +[NSPredicate predicateWithFormat:@"ANY recipients.personId IN %@", v5];
  id v12 = +[NSDate date];
  id v13 = [v12 dateByAddingTimeInterval:28800.0];
  uint64_t v14 = +[NSPredicate predicateWithFormat:@"endDate < %@", v13];

  v62 = (void *)v9;
  [v8 addObject:v9];
  v61 = (void *)v10;
  [v8 addObject:v10];
  v60 = (void *)v11;
  [v8 addObject:v11];
  v59 = (void *)v14;
  [v8 addObject:v14];
  v63 = v8;
  uint64_t v15 = +[NSCompoundPredicate andPredicateWithSubpredicates:v8];
  v57 = +[NSSortDescriptor sortDescriptorWithKey:@"startDate" ascending:0];
  v96 = v57;
  uint64_t v16 = +[NSArray arrayWithObjects:&v96 count:1];
  id v91 = 0;
  v64 = v7;
  v58 = (void *)v15;
  id v17 = [v7 queryInteractionsUsingPredicate:v15 sortDescriptors:v16 limit:1000 error:&v91];
  id v56 = v91;

  id v18 = objc_alloc_init((Class)NSMutableDictionary);
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id obj = v17;
  id v74 = [obj countByEnumeratingWithState:&v87 objects:v95 count:16];
  if (v74)
  {
    uint64_t v72 = *(void *)v88;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v88 != v72) {
          objc_enumerationMutation(obj);
        }
        uint64_t v76 = v19;
        uint64_t v20 = *(void **)(*((void *)&v87 + 1) + 8 * v19);
        long long v83 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        uint64_t v21 = [v20 recipients];
        id v22 = [v21 countByEnumeratingWithState:&v83 objects:v94 count:16];
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = *(void *)v84;
          do
          {
            for (i = 0; i != v23; i = (char *)i + 1)
            {
              if (*(void *)v84 != v24) {
                objc_enumerationMutation(v21);
              }
              id v26 = *(void **)(*((void *)&v83 + 1) + 8 * i);
              unsigned int v27 = [v26 personId];
              unsigned int v28 = [v5 containsObject:v27];

              if (v28)
              {
                v29 = [v20 sender];
                v30 = v29;
                if (v29)
                {
                  id v31 = [v29 identifier];
                  if (v31) {
                    [v18 setObject:v31 forKey:v26];
                  }
                }
              }
            }
            id v23 = [v21 countByEnumeratingWithState:&v83 objects:v94 count:16];
          }
          while (v23);
        }

        uint64_t v19 = v76 + 1;
      }
      while ((id)(v76 + 1) != v74);
      id v74 = [obj countByEnumeratingWithState:&v87 objects:v95 count:16];
    }
    while (v74);
  }

  id v32 = objc_alloc_init((Class)CNContactStore);
  v93[0] = CNContactEmailAddressesKey;
  v93[1] = CNContactInstantMessageAddressesKey;
  v93[2] = CNContactPhoneNumbersKey;
  v73 = +[NSArray arrayWithObjects:v93 count:3];
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v33 = v18;
  id v34 = [v33 countByEnumeratingWithState:&v79 objects:v92 count:16];
  if (v34)
  {
    id v35 = v34;
    id v66 = v32;
    uint64_t v67 = 0;
    id v69 = v33;
    uint64_t v70 = 0;
    uint64_t v77 = *(void *)v80;
    id v36 = v68;
    while (1)
    {
      long long v37 = 0;
      id v75 = v35;
      do
      {
        if (*(void *)v80 != v77) {
          objc_enumerationMutation(v33);
        }
        long long v38 = *(void **)(*((void *)&v79 + 1) + 8 * (void)v37);
        long long v39 = [v38 identifier];
        id v40 = [v38 type];
        if (v40 == (id)3)
        {
          [v39 rangeOfString:@"@"];
          if (!v42)
          {
            id v41 = v39;
            goto LABEL_32;
          }
LABEL_31:
          SFNormalizeEmailAddress();
          id v41 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_32;
        }
        if (v40 == (id)2) {
          goto LABEL_31;
        }
        if (v40 != (id)1)
        {
          long long v43 = 0;
          goto LABEL_34;
        }
        SFNormalizePhoneNumber();
        id v41 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:
        long long v43 = v41;
LABEL_34:
        long long v44 = [v38 personId];
        uint64_t v45 = [v33 objectForKeyedSubscript:v38];
        int v46 = (void *)v45;
        if (v43)
        {
          if (v44 && v45 != 0)
          {
            if (dword_100967FA0 <= 40 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
            {
              long long v54 = v43;
              id v55 = v46;
              long long v53 = v44;
              LogPrintF();
            }
            id v48 = objc_alloc_init((Class)SFPeopleSuggesterResult);
            [v48 setContactID:v44];
            uint64_t v78 = 0;
            long long v49 = [v32 unifiedContactWithIdentifier:v44 keysToFetch:v73 error:&v78];
            if (!v49 || v78)
            {
              [v48 setFlags:2, v53, v54, v55];
              ++v70;
            }
            else
            {
              long long v50 = +[SDStatusMonitor sharedMonitor];
              unsigned int v51 = [v50 contactIsBlocked:v49];

              if (v51)
              {
                [v48 setFlags:1];
                ++v67;
              }
              else
              {
                long long v52 = +[NSArray arrayWithObject:v43];
                [v48 setHandles:v52];

                [v48 setSendersKnownAlias:v46];
              }
              id v36 = v68;
              id v32 = v66;
            }
            [v36 addObject:v48, v53];

            id v33 = v69;
            id v35 = v75;
          }
        }

        long long v37 = (char *)v37 + 1;
      }
      while (v35 != v37);
      id v35 = [v33 countByEnumeratingWithState:&v79 objects:v92 count:16];
      if (!v35) {
        goto LABEL_56;
      }
    }
  }
  id v36 = v68;
LABEL_56:

  if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
  {
    [v36 count];
    LogPrintF();
  }
  v65[2](v65, v36, 0);
}

- (void)getPairedWatchWristStateWithCompletionHandler:(id)a3
{
  dispatchQueue = self->_server->_dispatchQueue;
  id v4 = (void (**)(id, id))a3;
  dispatch_assert_queue_V2(dispatchQueue);
  id v5 = +[SDStatusMonitor sharedMonitor];
  v4[2](v4, [v5 pairedWatchWristState]);
}

- (void)beginMonitoringPairedWatchWristState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100967FA0 <= 40 && (dword_100967FA0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_handlePairedWatchWristStateChanged" name:@"com.apple.sharingd.PairedWatchWristStateChanged" object:0];
}

- (void)_handlePairedWatchWristStateChanged
{
  id v4 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxyWithErrorHandler:&stru_1008CE328];
  v2 = +[SDStatusMonitor sharedMonitor];
  id v3 = [v2 pairedWatchWristState];

  [v4 pairedWatchWristStateChanged:v3];
}

- (void)getProblemFlagsWithCompletionHandler:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  unint64_t v4 = [(SDSetupAgent *)self->_server->_setupAgent problemFlags];
  id v5 = v6;
  if (v6)
  {
    (*((void (**)(id, unint64_t, void))v6 + 2))(v6, v4, 0);
    id v5 = v6;
  }
}

- (void)hashManagerControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (v7)
  {
    if ([(SDXPCConnection *)self _entitled:@"com.apple.sharing.Client" state:&self->_entitledClient label:@"HashManagerControl"])
    {
      uint64_t v11 = NSErrorWithOSStatusF();
      uint64_t v20 = 0;
      uint64_t v9 = 0;
      goto LABEL_15;
    }
    id v8 = [v6 objectForKeyedSubscript:@"cmd"];
    uint64_t v9 = v8;
    if (v8)
    {
      if ([v8 isEqualToString:@"hmrebuild"])
      {
        uint64_t v10 = +[SDAirDropContactHashManager shared];
        [v10 rebuildDB];

        uint64_t v11 = 0;
LABEL_14:
        uint64_t v20 = 0;
LABEL_15:
        v7[2](v7, v20, v11);

        goto LABEL_16;
      }
      if ([v9 isEqualToString:@"hmdump"])
      {
        id v12 = NSTemporaryDirectory();
        id v13 = [v12 stringByAppendingPathComponent:@"airdrop-hash-db.txt"];
        uint64_t v14 = +[NSURL fileURLWithPath:v13];

        if (v14
          && (+[SDAirDropContactHashManager shared](_TtC16DaemoniOSLibrary27SDAirDropContactHashManager, "shared"), v15 = objc_claimAutoreleasedReturnValue(), unsigned __int8 v16 = [v15 dumpDBAtFileURL:v14], v15, (v16 & 1) != 0))
        {
          CFStringRef v21 = @"filePath";
          uint64_t v17 = [v14 path];
          id v18 = (void *)v17;
          CFStringRef v19 = @"<unknown>";
          if (v17) {
            CFStringRef v19 = (const __CFString *)v17;
          }
          CFStringRef v22 = v19;
          uint64_t v20 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];

          uint64_t v11 = 0;
        }
        else
        {
          uint64_t v11 = NSErrorWithOSStatusF();
          uint64_t v20 = 0;
        }

        goto LABEL_15;
      }
    }
    uint64_t v11 = NSErrorWithOSStatusF();
    goto LABEL_14;
  }
LABEL_16:
}

- (void)openSetupURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  signed int v8 = [(SDXPCConnection *)self _entitled:@"com.apple.sharing.Client" state:&self->_entitledClient label:@"OpenSetupURL"];
  if (v8)
  {
    if (v7)
    {
      uint64_t v9 = v8;
      NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
      uint64_t v10 = +[NSString stringWithUTF8String:DebugGetErrorString()];
      uint64_t v11 = (void *)v10;
      CFStringRef v12 = @"?";
      if (v10) {
        CFStringRef v12 = (const __CFString *)v10;
      }
      CFStringRef v16 = v12;
      id v13 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      uint64_t v14 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v9 userInfo:v13];
      v7[2](v7, v14);
    }
  }
  else
  {
    [(SDSetupAgent *)self->_server->_setupAgent openSetupURL:v6];
    if (v7) {
      v7[2](v7, 0);
    }
  }
}

- (void)preheatXPCConnection
{
  if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)personInfoWithEmailOrPhone:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (v7)
  {
    unsigned int v8 = [(SDXPCConnection *)self _entitled:@"com.apple.sharing.Client" state:&self->_entitledClient label:@"AppleIDAuth"];
    if (v8)
    {
      signed int v9 = v8;
      sub_10014A7DC();
      uint64_t v10 = v9;
      NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
      uint64_t v11 = +[NSString stringWithUTF8String:DebugGetErrorString()];
      CFStringRef v12 = (void *)v11;
      CFStringRef v13 = @"?";
      if (v11) {
        CFStringRef v13 = (const __CFString *)v11;
      }
      CFStringRef v17 = v13;
      uint64_t v14 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      NSErrorUserInfoKey v15 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v10 userInfo:v14];
      v7[2](v7, 0, v15);
    }
    else
    {
      [(SDAppleIDAgent *)self->_server->_appleIDAgent personInfoWithEmailOrPhone:v6 completion:v7];
    }
  }
}

- (void)preventExitForLocaleReason:(id)a3
{
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if ([(SDXPCConnection *)self _entitled:@"com.apple.sharing.Client" state:&self->_entitledClient label:@"PreventExitForLocale"])
  {
    id v6 = 0;
  }
  else
  {
    id v5 = +[SDStatusMonitor sharedMonitor];
    id v6 = v5;
    preventExitForLocaleReason = self->_preventExitForLocaleReason;
    p_preventExitForLocaleReason = &self->_preventExitForLocaleReason;
    if (preventExitForLocaleReason) {
      [v5 removePreventExitForLocaleReason];
    }
    objc_storeStrong((id *)p_preventExitForLocaleReason, a3);
    if (v9) {
      [v6 addPreventExitForLocaleReason:v9];
    }
  }
}

- (void)reenableProxCardType:(unsigned __int8)a3 completion:(id)a4
{
  uint64_t v4 = a3;
  id v6 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  signed int v7 = [(SDXPCConnection *)self _entitled:@"com.apple.sharing.Client" state:&self->_entitledClient label:@"ReenableProxCardType"];
  if (v7)
  {
LABEL_5:
    if (!v6) {
      goto LABEL_63;
    }
    goto LABEL_6;
  }
  if ([(SDSetupAgent *)self->_server->_setupAgent reenableProxCardType:v4]
    || [(SDProximityPairingAgent *)self->_server->_ppAgent reenableProxCardType:v4])
  {
    signed int v7 = 0;
    goto LABEL_5;
  }
  if (dword_100967FA0 <= 60 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
  {
    if ((int)v4 > 99)
    {
      switch(v4)
      {
        case 'd':
          uint64_t v14 = "B238SetupAfterWiFi";
          break;
        case 'e':
          uint64_t v14 = "B389SetupFromFindMy";
          break;
        case 'f':
          uint64_t v14 = "B389SetupDone";
          break;
        default:
LABEL_60:
          uint64_t v14 = "?";
          break;
      }
    }
    else
    {
      uint64_t v14 = "Unspecified";
      switch((int)v4)
      {
        case 0:
          break;
        case 1:
          uint64_t v14 = "ATVSetup";
          break;
        case 4:
          uint64_t v14 = "MobileBackup";
          break;
        case 5:
          uint64_t v14 = "WatchSetup";
          break;
        case 6:
          uint64_t v14 = "ATVPair";
          break;
        case 7:
          uint64_t v14 = "InternetRelay";
          break;
        case 8:
          uint64_t v14 = "WiFiPassword";
          break;
        case 9:
          uint64_t v14 = "iOSSetup";
          break;
        case 10:
          uint64_t v14 = "Repair";
          break;
        case 11:
          uint64_t v14 = "LegacyHomePodSetup";
          break;
        case 12:
          uint64_t v14 = "ApplePay";
          break;
        case 13:
          uint64_t v14 = "WHASetup";
          break;
        case 14:
          uint64_t v14 = "DevToolsPair";
          break;
        case 17:
          uint64_t v14 = "DDPing";
          break;
        case 18:
          uint64_t v14 = "DDPong";
          break;
        case 19:
          uint64_t v14 = "RemoteAutoFill";
          break;
        case 20:
          uint64_t v14 = "CompanionLinkProx";
          break;
        case 21:
          uint64_t v14 = "RemoteManagement";
          break;
        case 22:
          uint64_t v14 = "RemoteAutoFillPong";
          break;
        case 24:
          uint64_t v14 = "AccessorySetup";
          break;
        case 25:
          uint64_t v14 = "TVLS";
          break;
        case 27:
          uint64_t v14 = "ShareAudio";
          break;
        case 28:
          uint64_t v14 = "AppSignIn";
          break;
        case 29:
          uint64_t v14 = "Fitness";
          break;
        case 30:
          uint64_t v14 = "TVCCS";
          break;
        case 31:
          uint64_t v14 = "TVSA";
          break;
        case 32:
          uint64_t v14 = "AuthenticateAccounts";
          break;
        case 33:
          uint64_t v14 = "HomePodSetup";
          break;
        case 34:
          uint64_t v14 = "CompanionAuthentication";
          break;
        case 36:
          uint64_t v14 = "dovePeace";
          break;
        case 43:
          uint64_t v14 = "AuthenticateAccountsV2";
          break;
        case 50:
          uint64_t v14 = "NeedsRDLink";
          break;
        case 51:
          uint64_t v14 = "NeedsCLink";
          break;
        case 52:
          uint64_t v14 = "Goodbye";
          break;
        case 53:
          uint64_t v14 = "PointToShare";
          break;
        case 55:
          uint64_t v14 = "AUAction";
          break;
        case 56:
          uint64_t v14 = "AcceptedInvitations";
          break;
        case 84:
          uint64_t v14 = "HasInvitations";
          break;
        default:
          goto LABEL_60;
      }
    }
    NSErrorUserInfoKey v15 = v14;
    LogPrintF();
  }
  signed int v7 = -6735;
  if (v6)
  {
LABEL_6:
    if (v7)
    {
      uint64_t v8 = v7;
      NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
      uint64_t v9 = +[NSString stringWithUTF8String:DebugGetErrorString()];
      uint64_t v10 = (void *)v9;
      CFStringRef v11 = @"?";
      if (v9) {
        CFStringRef v11 = (const __CFString *)v9;
      }
      CFStringRef v17 = v11;
      CFStringRef v12 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1, v15);
      CFStringRef v13 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v8 userInfo:v12];
      v6[2](v6, v13);
    }
    else
    {
      v6[2](v6, 0);
    }
  }
LABEL_63:
}

- (void)repairDevice:(id)a3 flags:(unsigned int)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v11 = a3;
  uint64_t v8 = (void (**)(id, uint64_t))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if ([(SDXPCConnection *)self _entitled:@"com.apple.sharing.Client" state:&self->_entitledClient label:@"RepairDevice"])
  {
    uint64_t v10 = NSErrorWithOSStatusF();
    uint64_t v9 = (void *)v10;
    if (v8 && v10) {
      v8[2](v8, v10);
    }
  }
  else
  {
    [(SDSetupAgent *)self->_server->_setupAgent repairDevice:v11 flags:v6 completion:v8];
    uint64_t v9 = 0;
  }
}

- (void)requestWithInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  signed int v7 = (void (**)(id, void, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  unsigned int v8 = [(SDXPCConnection *)self _entitled:@"com.apple.sharing.Client" state:&self->_entitledClient label:@"AppleIDAuth"];
  if (v8)
  {
    if (v7)
    {
      signed int v9 = v8;
      sub_10014A7DC();
      uint64_t v10 = v9;
      NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
      uint64_t v11 = +[NSString stringWithUTF8String:DebugGetErrorString()];
      CFStringRef v12 = (void *)v11;
      CFStringRef v13 = @"?";
      if (v11) {
        CFStringRef v13 = (const __CFString *)v11;
      }
      CFStringRef v17 = v13;
      uint64_t v14 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      NSErrorUserInfoKey v15 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v10 userInfo:v14];
      v7[2](v7, 0, v15);
    }
  }
  else
  {
    [(SDAppleIDAgent *)self->_server->_appleIDAgent requestWithInfo:v6 completion:v7];
  }
}

- (void)retriggerProximityPairing:(id)a3
{
  uint64_t v4 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  signed int v5 = [(SDXPCConnection *)self _entitled:@"com.apple.sharing.Client" state:&self->_entitledClient label:@"RetriggerProximityPairing"];
  if (v5)
  {
    if (v4)
    {
      uint64_t v6 = v5;
      NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
      uint64_t v7 = +[NSString stringWithUTF8String:DebugGetErrorString()];
      unsigned int v8 = (void *)v7;
      CFStringRef v9 = @"?";
      if (v7) {
        CFStringRef v9 = (const __CFString *)v7;
      }
      CFStringRef v13 = v9;
      uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
      uint64_t v11 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v6 userInfo:v10];
      v4[2](v4, v11);
    }
  }
  else
  {
    [(SDProximityPairingAgent *)self->_server->_ppAgent retriggerProximityPairing:v4];
  }
}

- (void)retriggerProximitySetup:(id)a3
{
  uint64_t v4 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  signed int v5 = [(SDXPCConnection *)self _entitled:@"com.apple.sharing.Client" state:&self->_entitledClient label:@"RetriggerProximitySetup"];
  if (v5)
  {
    if (v4)
    {
      uint64_t v6 = v5;
      NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
      uint64_t v7 = +[NSString stringWithUTF8String:DebugGetErrorString()];
      unsigned int v8 = (void *)v7;
      CFStringRef v9 = @"?";
      if (v7) {
        CFStringRef v9 = (const __CFString *)v7;
      }
      CFStringRef v13 = v9;
      uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
      uint64_t v11 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v6 userInfo:v10];
      v4[2](v4, v11);
    }
  }
  else
  {
    [(SDSetupAgent *)self->_server->_setupAgent retriggerProximitySetup:v4];
  }
}

- (void)setAudioRoutingScore:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  unsigned int v8 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if ([(SDXPCConnection *)self _entitled:@"com.apple.sharing.Client" state:&self->_entitledClient label:@"SetAudioRoutingScore"]|| v4 >= 0x10)
  {
    uint64_t v7 = NSErrorWithOSStatusF();
    v8[2](v8, v7);
  }
  else
  {
    uint64_t v6 = +[SDNearbyAgent sharedNearbyAgent];
    [v6 setAudioRoutingScore:v4];

    v8[2](v8, 0);
  }
}

- (void)setupDevice:(id)a3 homeIdentifier:(id)a4 completion:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  CFStringRef v9 = (void (**)(id, uint64_t))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if ([(SDXPCConnection *)self _entitled:@"com.apple.sharing.Client" state:&self->_entitledClient label:@"SetupDevice"])
  {
    uint64_t v11 = NSErrorWithOSStatusF();
    uint64_t v10 = (void *)v11;
    if (v9 && v11) {
      v9[2](v9, v11);
    }
  }
  else
  {
    [(SDSetupAgent *)self->_server->_setupAgent setupDevice:v12 homeIdentifier:v8 completion:v9];
    uint64_t v10 = 0;
  }
}

- (void)showDevicePickerWithInfo:(id)a3 completion:(id)a4
{
  id v9 = a3;
  uint64_t v6 = (void (**)(id, uint64_t))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if ([(SDXPCConnection *)self _entitled:@"com.apple.sharing.Client" state:&self->_entitledClient label:@"ShowDevicePicker"])
  {
    uint64_t v8 = NSErrorWithOSStatusF();
    uint64_t v7 = (void *)v8;
    if (v6 && v8) {
      v6[2](v6, v8);
    }
  }
  else
  {
    [(SDSetupAgent *)self->_server->_setupAgent showDevicePickerWithInfo:v9 completion:v6];
    uint64_t v7 = 0;
  }
}

- (void)statusInfoWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  unsigned int v5 = [(SDXPCConnection *)self _entitled:@"com.apple.sharing.Client" state:&self->_entitledClient label:@"AppleIDAuth"];
  if (v5)
  {
    if (v4)
    {
      signed int v7 = v5;
      sub_10014A7DC();
      uint64_t v8 = v7;
      NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
      uint64_t v9 = +[NSString stringWithUTF8String:DebugGetErrorString()];
      uint64_t v10 = (void *)v9;
      CFStringRef v11 = @"?";
      if (v9) {
        CFStringRef v11 = (const __CFString *)v9;
      }
      CFStringRef v15 = v11;
      id v12 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      CFStringRef v13 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v8 userInfo:v12];
      v4[2](v4, 0, v13);
    }
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [(SDAppleIDAgent *)self->_server->_appleIDAgent statusInfo];
    if (v4)
    {
      sub_10014A7DC();
      ((void (**)(id, void *, void *))v4)[2](v4, v6, 0);
    }
  }
}

- (void)testContinuityKeyboardBegin:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  riAgent = self->_server->_riAgent;
  if (v3)
  {
    [(SDRemoteInteractionAgent *)riAgent handleInputDidBeginWithFlags:0 sessionInfo:0];
  }
  else
  {
    [(SDRemoteInteractionAgent *)riAgent handleInputDidEndWithFlags:0 sessionInfo:0];
  }
}

- (void)triggerHomeKitDeviceDetectedWithURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  signed int v7 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  signed int v8 = [(SDXPCConnection *)self _entitled:@"com.apple.sharing.Client" state:&self->_entitledClient label:@"TriggerHomeKitDeviceDetected"];
  if (v8)
  {
    if (v7)
    {
      uint64_t v9 = v8;
      NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
      uint64_t v10 = +[NSString stringWithUTF8String:DebugGetErrorString()];
      CFStringRef v11 = (void *)v10;
      CFStringRef v12 = @"?";
      if (v10) {
        CFStringRef v12 = (const __CFString *)v10;
      }
      CFStringRef v16 = v12;
      CFStringRef v13 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      NSErrorUserInfoKey v14 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v9 userInfo:v13];
      v7[2](v7, v14);
    }
  }
  else
  {
    [(SDSetupAgent *)self->_server->_setupAgent triggerHomeKitDeviceDetectedWithURL:v6 completion:v7];
  }
}

- (void)triggerProximityAutoFillDetectedWithURL:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(SDAutoFillAgent *)self->_server->_autoFillAgent triggerProximityAutoFillDetectedWithURL:v7 completion:v6];
}

- (void)wifiPasswordSharingAvailabilityWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, uint64_t, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  signed int v5 = [(SDXPCConnection *)self _entitled:@"com.apple.sharing.Services" state:&self->_entitledClient label:@"WiFiPasswordSharingAvailability"];
  if (v5)
  {
    if (v4)
    {
      uint64_t v8 = v5;
      NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
      uint64_t v9 = +[NSString stringWithUTF8String:DebugGetErrorString()];
      uint64_t v10 = (void *)v9;
      CFStringRef v11 = @"?";
      if (v9) {
        CFStringRef v11 = (const __CFString *)v9;
      }
      CFStringRef v15 = v11;
      CFStringRef v12 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      CFStringRef v13 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v8 userInfo:v12];
      v4[2](v4, 1, v13);
    }
  }
  else
  {
    id v6 = +[SDStatusMonitor sharedMonitor];
    id v7 = [v6 wifiPasswordSharingAvailability];

    if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (v4) {
      v4[2](v4, (uint64_t)v7, 0);
    }
  }
}

- (void)startProxCardTransactionWithOptions:(unint64_t)a3 completion:(id)a4
{
  char v4 = a3;
  id v13 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (gSDProxCardsSuppressed)
  {
    if (dword_100967FA0 > 90 || dword_100967FA0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_35;
    }
    goto LABEL_28;
  }
  if ([(SDSetupAgent *)self->_server->_setupAgent uiShowing])
  {
    if (dword_100967FA0 > 90 || dword_100967FA0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_35;
    }
    goto LABEL_28;
  }
  if ((v4 & 4) != 0) {
    int v6 = 509955;
  }
  else {
    int v6 = 509963;
  }
  if ((v4 & 0x10) != 0) {
    v6 &= 0x7C809u;
  }
  if ((v4 & 8) != 0) {
    v6 &= 0x7880Bu;
  }
  int v7 = v6 & 0x7C80A;
  if ((v4 & 1) == 0) {
    int v7 = v6;
  }
  if ((v4 & 2) != 0) {
    v7 &= ~0x20000u;
  }
  if ((v4 & 0x20) != 0) {
    v7 &= 0x6C80Bu;
  }
  if ((v4 & 0x40) != 0) {
    unsigned int v8 = v7 & 0xFFFFF7FF;
  }
  else {
    unsigned int v8 = v7;
  }
  uint64_t v9 = +[SDStatusMonitor sharedMonitor];
  unsigned int v10 = [v9 systemUIFlags] & v8;

  if (!v10)
  {
    [(SDXPCConnection *)self activateAssertionWithIdentifier:@"com.apple.sharing.PreventProxCards"];
    uint64_t v11 = 1;
    goto LABEL_36;
  }
  if (dword_100967FA0 <= 90 && (dword_100967FA0 != -1 || _LogCategory_Initialize())) {
LABEL_28:
  }
    LogPrintF();
LABEL_35:
  uint64_t v11 = 0;
LABEL_36:
  CFStringRef v12 = v13;
  if (v13)
  {
    (*((void (**)(id, uint64_t))v13 + 2))(v13, v11);
    CFStringRef v12 = v13;
  }
}

- (void)coordinatedAlertsRequestStart:(id)a3 completion:(id)a4
{
  id v7 = a3;
  unsigned int v8 = (void (**)(id, void *, uint64_t, void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
  {
    unint64_t v9 = (unint64_t)[v7 type];
    if (v9 > 6) {
      unsigned int v10 = "?";
    }
    else {
      unsigned int v10 = off_1008CE498[v9];
    }
    CFStringRef v18 = @"CoordinatedAlertStart";
    CFStringRef v19 = v10;
    LogPrintF();
  }
  if (!CFPrefs_GetInt64()
    || (signed int v20 = [(SDXPCConnection *)self _entitled:@"com.apple.sharing.CoordinatedAlerts" state:&self->_entitledCoordinatedAlerts label:@"CoordinatedAlertStart"]) == 0)
  {
    if (self->_caRequest)
    {
      signed int v20 = -6721;
      if (dword_100967FA0 <= 60 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
      {
        CFStringRef v17 = (const char *)[(NSXPCConnection *)self->_xpcCnx processIdentifier];
        CFStringRef v18 = @"CoordinatedAlertStart";
        CFStringRef v19 = v17;
        LogPrintF();
      }
    }
    else
    {
      [v7 setCompletionHandler:v8];
      uint64_t v11 = +[NSXPCConnection currentConnection];
      [v7 setXpcConnection:v11];

      objc_storeStrong((id *)&self->_caRequest, a3);
      [(SDNearbyAgent *)self->_server->_nearbyAgent coordinatedAlertRequestStart:v7];
      signed int v20 = 0;
    }
  }
  if (v8 && v20)
  {
    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    uint64_t v12 = +[NSString stringWithUTF8String:DebugGetErrorString()];
    id v13 = (void *)v12;
    CFStringRef v14 = @"?";
    if (v12) {
      CFStringRef v14 = (const __CFString *)v12;
    }
    CFStringRef v22 = v14;
    CFStringRef v15 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1, v18, v19);
    CFStringRef v16 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v20 userInfo:v15];
    v8[2](v8, v16, 1, 0);
  }
}

- (void)coordinatedAlertsRequestFinish
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (self->_caRequest)
  {
    -[SDNearbyAgent coordinatedAlertRequestFinish:](self->_server->_nearbyAgent, "coordinatedAlertRequestFinish:");
    [(SFCoordinatedAlertRequest *)self->_caRequest invalidate];
    caRequest = self->_caRequest;
    self->_caRequest = 0;
  }
}

- (void)coordinatedAlertsRequestCancel
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (self->_caRequest)
  {
    -[SDNearbyAgent coordinatedAlertRequestCancel:](self->_server->_nearbyAgent, "coordinatedAlertRequestCancel:");
    caRequest = self->_caRequest;
    self->_caRequest = 0;
  }
}

- (void)deviceDiscoveryActivate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  unsigned int v8 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
  {
    id v17 = v7;
    uint64_t v18 = [(NSXPCConnection *)self->_xpcCnx processIdentifier];
    CFStringRef v16 = @"DeviceDiscoveryActivate";
    LogPrintF();
  }
  signed int v9 = [(SDXPCConnection *)self _entitled:@"com.apple.sharing.DeviceDiscovery", &self->_entitledDeviceDiscovery, @"DeviceDiscoveryActivate", v16, v17, v18 state label];
  if (v9)
  {
    if (v8)
    {
      uint64_t v10 = v9;
      NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
      uint64_t v11 = +[NSString stringWithUTF8String:DebugGetErrorString()];
      uint64_t v12 = (void *)v11;
      CFStringRef v13 = @"?";
      if (v11) {
        CFStringRef v13 = (const __CFString *)v11;
      }
      CFStringRef v24 = v13;
      CFStringRef v14 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      CFStringRef v15 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v10 userInfo:v14];
      v8[2](v8, v15);
    }
  }
  else
  {
    if (!self->_ddRequest)
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100150474;
      v22[3] = &unk_1008CADB8;
      v22[4] = self;
      [v7 setDeviceFoundHandler:v22];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1001504F4;
      v21[3] = &unk_1008CADB8;
      v21[4] = self;
      [v7 setDeviceLostHandler:v21];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100150574;
      v20[3] = &unk_1008CADE0;
      void v20[4] = self;
      [v7 setDeviceChangedHandler:v20];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1001505FC;
      v19[3] = &unk_1008CB068;
      v19[4] = self;
      [v7 setScanStateChangedHandler:v19];
      objc_storeStrong((id *)&self->_ddRequest, a3);
      [(SDNearbyAgent *)self->_server->_nearbyAgent deviceDiscoveryRequestStart:v7];
    }
    if (v8) {
      v8[2](v8, 0);
    }
  }
}

- (void)deviceDiscoveryUpdate:(id)a3
{
  id v26 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
  {
    CFStringRef v24 = @"DeviceDiscoveryUpdate";
    id v25 = v26;
    LogPrintF();
  }
  if (self->_ddRequest)
  {
    unsigned int v4 = [v26 changeFlags];
    if (v4 != [(SFDeviceDiscovery *)self->_ddRequest changeFlags]) {
      -[SFDeviceDiscovery setChangeFlags:](self->_ddRequest, "setChangeFlags:", [v26 changeFlags]);
    }
    id v5 = [v26 discoveryFlags:v24, v25];
    if (v5 != [(SFDeviceDiscovery *)self->_ddRequest discoveryFlags]) {
      -[SFDeviceDiscovery setDiscoveryFlags:](self->_ddRequest, "setDiscoveryFlags:", [v26 discoveryFlags]);
    }
    int v6 = [(SFDeviceDiscovery *)self->_ddRequest deviceFilter];
    id v7 = [v26 deviceFilter];
    id v8 = v6;
    id v9 = v7;
    if (v8 == v9)
    {
    }
    else
    {
      uint64_t v10 = v9;
      if ((v8 == 0) == (v9 != 0))
      {
      }
      else
      {
        unsigned __int8 v11 = [v8 isEqual:v9];

        if (v11)
        {
LABEL_18:
          id v12 = [v26 fastScanMode];
          if (v12 != [(SFDeviceDiscovery *)self->_ddRequest fastScanMode]) {
            -[SFDeviceDiscovery setFastScanMode:](self->_ddRequest, "setFastScanMode:", [v26 fastScanMode]);
          }
          unsigned int v13 = [v26 overrideScreenOff];
          if (v13 != [(SFDeviceDiscovery *)self->_ddRequest overrideScreenOff]) {
            -[SFDeviceDiscovery setOverrideScreenOff:](self->_ddRequest, "setOverrideScreenOff:", [v26 overrideScreenOff]);
          }
          id v14 = [v26 overrideScreenOffRescanInterval];
          if (v14 != -[SFDeviceDiscovery overrideScreenOffRescanInterval](self->_ddRequest, "overrideScreenOffRescanInterval"))-[SFDeviceDiscovery setOverrideScreenOffRescanInterval:](self->_ddRequest, "setOverrideScreenOffRescanInterval:", [v26 overrideScreenOffRescanInterval]); {
          id v15 = [v26 rssiThreshold];
          }
          if (v15 != [(SFDeviceDiscovery *)self->_ddRequest rssiThreshold]) {
            -[SFDeviceDiscovery setRssiThreshold:](self->_ddRequest, "setRssiThreshold:", [v26 rssiThreshold]);
          }
          id v16 = [v26 scanRate];
          if (v16 != [(SFDeviceDiscovery *)self->_ddRequest scanRate]) {
            -[SFDeviceDiscovery setScanRate:](self->_ddRequest, "setScanRate:", [v26 scanRate]);
          }
          unsigned int v17 = [v26 trackPeers];
          if (v17 != [(SFDeviceDiscovery *)self->_ddRequest trackPeers]) {
            -[SFDeviceDiscovery setTrackPeers:](self->_ddRequest, "setTrackPeers:", [v26 trackPeers]);
          }
          uint64_t v18 = [(SFDeviceDiscovery *)self->_ddRequest useCases];
          CFStringRef v19 = [v26 useCases];
          id v20 = v18;
          id v21 = v19;
          if (v20 == v21)
          {
          }
          else
          {
            CFStringRef v22 = v21;
            if ((v20 == 0) == (v21 != 0))
            {
            }
            else
            {
              unsigned __int8 v23 = [v20 isEqual:v21];

              if (v23) {
                goto LABEL_38;
              }
            }
            id v20 = [v26 useCases];
            [(SFDeviceDiscovery *)self->_ddRequest setUseCases:v20];
          }

LABEL_38:
          [(SDNearbyAgent *)self->_server->_nearbyAgent deviceDiscoveryRequestUpdate:self->_ddRequest];
          goto LABEL_39;
        }
      }
      id v8 = [v26 deviceFilter];
      [(SFDeviceDiscovery *)self->_ddRequest setDeviceFilter:v8];
    }

    goto LABEL_18;
  }
  if (dword_100967FA0 <= 60 && (dword_100967FA0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_39:
}

- (void)deviceDiscoveryFastScanTrigger:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  ddRequest = self->_ddRequest;
  if (ddRequest) {
    [(SDNearbyAgent *)self->_server->_nearbyAgent deviceDiscoveryFastScanTrigger:ddRequest reason:v5];
  }
}

- (void)deviceDiscoveryFastScanCancel:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  ddRequest = self->_ddRequest;
  if (ddRequest) {
    [(SDNearbyAgent *)self->_server->_nearbyAgent deviceDiscoveryFastScanCancel:ddRequest reason:v5];
  }
}

- (void)deviceDiscoveryTriggerEnhancedDiscovery:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  ddRequest = self->_ddRequest;
  if (ddRequest) {
    [(SDNearbyAgent *)self->_server->_nearbyAgent deviceDiscoveryTriggerEnhancedDiscovery:ddRequest reason:v5];
  }
}

- (void)deviceDiscoveryTriggerEnhancedDiscovery:(id)a3 useCase:(unsigned int)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v10 = a3;
  id v8 = (void (**)(id, void))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  ddRequest = self->_ddRequest;
  if (ddRequest) {
    [(SDNearbyAgent *)self->_server->_nearbyAgent deviceDiscoveryTriggerEnhancedDiscovery:ddRequest reason:v10 useCase:v6];
  }
  if (v8) {
    v8[2](v8, 0);
  }
}

- (void)bluetoothUserInteraction
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
  {
    CFStringRef v3 = @"BluetoothUserInteraction";
    LogPrintF();
  }
  if (![(SDXPCConnection *)self _entitled:@"com.apple.sharing.BluetoothUserInteraction", &self->_entitledBluetoothUserInteraction, @"BluetoothUserInteraction", v3 state label])
  {
    [(SDProximityPairingAgent *)self->_server->_ppAgent bluetoothUserInteractionStart:self];
    self->_bluetoothUserInteraction = 1;
  }
}

- (void)diagnosticBLEModeWithCompletion:(id)a3
{
  unsigned int v4 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
  {
    CFStringRef v12 = @"DiagnosticBLEMode";
    LogPrintF();
  }
  signed int v5 = [(SDXPCConnection *)self _entitled:@"com.apple.sharing.Diagnostics", &self->_entitledDiagnostics, @"DiagnosticBLEMode", v12 state label];
  if (v5)
  {
    uint64_t v6 = v5;
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    uint64_t v7 = +[NSString stringWithUTF8String:DebugGetErrorString()];
    id v8 = (void *)v7;
    CFStringRef v9 = @"?";
    if (v7) {
      CFStringRef v9 = (const __CFString *)v7;
    }
    CFStringRef v14 = v9;
    id v10 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    unsigned __int8 v11 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v6 userInfo:v10];
    v4[2](v4, v11);
  }
  else
  {
    [(SDNearbyAgent *)self->_server->_nearbyAgent diagnosticBLEModeStart:self];
    self->_diagnosticBLEModeStarted = 1;
    v4[2](v4, 0);
  }
}

- (void)diagnosticControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
  {
    CFStringRef v49 = @"DiagnosticControl";
    id v51 = v6;
    LogPrintF();
  }
  uint64_t v52 = 0;
  signed int v8 = [(SDXPCConnection *)self _entitled:@"com.apple.sharing.Diagnostics", &self->_entitledDiagnostics, @"DiagnosticControl", v49, v51 state label];
  if (v8) {
    goto LABEL_101;
  }
  if ([v6 hasPrefix:@"afui"])
  {
    autoFillAgent = self->_server->_autoFillAgent;
    id v10 = v6;
    uint64_t v11 = 4;
LABEL_8:
    CFStringRef v12 = [v10 substringFromIndex:v11];
    [autoFillAgent testUI:v12];
LABEL_15:

LABEL_16:
    v7[2](v7, 0);
    goto LABEL_17;
  }
  if ([v6 hasPrefix:@"afremote"])
  {
    NSErrorUserInfoKey v13 = self->_server->_autoFillAgent;
    CFStringRef v12 = [v6 substringFromIndex:8];
    [(SDAutoFillAgent *)v13 testRemote:v12];
    goto LABEL_15;
  }
  if ([v6 hasPrefix:@"afservice"])
  {
    CFStringRef v14 = self->_server->_autoFillAgent;
    CFStringRef v12 = [v6 substringFromIndex:9];
    [(SDAutoFillAgent *)v14 testService:v12];
    goto LABEL_15;
  }
  if ([v6 hasPrefix:@"afkc"])
  {
    id v15 = self->_server->_autoFillAgent;
    CFStringRef v12 = [v6 substringFromIndex:4];
    [(SDAutoFillAgent *)v15 testKeychain:v12];
    goto LABEL_15;
  }
  if (![v6 caseInsensitiveCompare:@"au1"])
  {
    nearbyAgent = self->_server->_nearbyAgent;
    uint64_t v18 = 1;
LABEL_24:
    [(SDNearbyAgent *)nearbyAgent setAutoUnlockActive:v18];
    goto LABEL_16;
  }
  if (![v6 caseInsensitiveCompare:@"au0"])
  {
    nearbyAgent = self->_server->_nearbyAgent;
    uint64_t v18 = 0;
    goto LABEL_24;
  }
  id v16 = v6;
  if (sscanf((const char *)[v16 UTF8String], "auua-%X-%X", (char *)&v52 + 4, &v52) == 2)
  {
    [(SDNearbyAgent *)self->_server->_nearbyAgent unlockUpdateAdvertising:HIDWORD(v52) mask:v52];
    goto LABEL_16;
  }
  if ([v16 hasPrefix:@"choui"])
  {
    autoFillAgent = self->_server->_proxHandoffAgent;
    id v10 = v16;
    uint64_t v11 = 5;
    goto LABEL_8;
  }
  if ([v16 hasPrefix:@"isui"])
  {
    setupAgent = self->_server->_setupAgent;
    CFStringRef v12 = [v16 substringFromIndex:4];
    [(SDSetupAgent *)setupAgent testSetupUIiOS:v12];
    goto LABEL_15;
  }
  if ([v16 hasPrefix:@"kbpost"])
  {
    riAgent = self->_server->_riAgent;
    CFStringRef v12 = [v16 substringFromIndex:6];
    [(SDRemoteInteractionAgent *)riAgent testKeyboardPost:v12];
    goto LABEL_15;
  }
  if (![v16 caseInsensitiveCompare:@"kbpostdelay"])
  {
    [(SDRemoteInteractionAgent *)self->_server->_riAgent testKeyboardPostWithDelay];
    goto LABEL_16;
  }
  if (![v16 caseInsensitiveCompare:@"kbpostupdate"])
  {
    [(SDRemoteInteractionAgent *)self->_server->_riAgent testKeyboardPostThenUpdate];
    goto LABEL_16;
  }
  if (![v16 caseInsensitiveCompare:@"kbremove"])
  {
    [(SDRemoteInteractionAgent *)self->_server->_riAgent testKeyboardRemove];
    goto LABEL_16;
  }
  if (![v16 caseInsensitiveCompare:@"kbremovedelay"])
  {
    [(SDRemoteInteractionAgent *)self->_server->_riAgent testKeyboardRemoveWithDelay];
    goto LABEL_16;
  }
  if (![v16 caseInsensitiveCompare:@"kbupdate"])
  {
    [(SDRemoteInteractionAgent *)self->_server->_riAgent testKeyboardUpdate];
    goto LABEL_16;
  }
  if (![v16 caseInsensitiveCompare:@"kbupdatedelay"])
  {
    [(SDRemoteInteractionAgent *)self->_server->_riAgent testKeyboardUpdateWithDelay];
    goto LABEL_16;
  }
  if ([v16 hasPrefix:@"ppair"])
  {
    ppAgent = self->_server->_ppAgent;
    CFStringRef v12 = [v16 substringFromIndex:5];
    [(SDProximityPairingAgent *)ppAgent testPairingUI:v12];
    goto LABEL_15;
  }
  if ([v16 hasPrefix:@"pstat"])
  {
    CFStringRef v22 = self->_server->_ppAgent;
    CFStringRef v12 = [v16 substringFromIndex:5];
    [(SDProximityPairingAgent *)v22 testStatusUI:v12];
    goto LABEL_15;
  }
  if ([v16 hasPrefix:@"mismatch"])
  {
    [(SDProximityPairingAgent *)self->_server->_ppAgent testStatusUI:v16];
    goto LABEL_16;
  }
  if (![v16 caseInsensitiveCompare:@"btpipe"])
  {
    id v24 = [(SDNearbyAgent *)self->_server->_nearbyAgent sharedNearbyPipe];
    goto LABEL_16;
  }
  if (![v16 caseInsensitiveCompare:@"metrics"])
  {
    SFMetricsLog();
    goto LABEL_16;
  }
  if (![v16 caseInsensitiveCompare:@"pping"])
  {
    [(SDNearbyAgent *)self->_server->_nearbyAgent testPipePing];
    goto LABEL_16;
  }
  id v23 = v16;
  if (sscanf((const char *)[v23 UTF8String], "hotspot=%X", (char *)&v52 + 4) == 1)
  {
    [(SDNearbyAgent *)self->_server->_nearbyAgent setHotspotInfo:HIDWORD(v52)];
    goto LABEL_16;
  }
  if ([v23 hasPrefix:@"atvui"])
  {
    id v25 = self->_server->_setupAgent;
    CFStringRef v12 = [v23 substringFromIndex:5];
    [(SDSetupAgent *)v25 testUIAppleTVSetup:v12];
    goto LABEL_15;
  }
  if (([v23 hasPrefix:@"b238ui"] & 1) != 0
    || [v23 hasPrefix:@"homepodui"])
  {
    id v26 = self->_server->_setupAgent;
    CFStringRef v12 = [v23 substringFromIndex:6];
    [(SDSetupAgent *)v26 testSetupUIB238:v12];
    goto LABEL_15;
  }
  if ([v23 hasPrefix:@"hkui"])
  {
    unsigned int v27 = self->_server->_setupAgent;
    CFStringRef v12 = [v23 substringFromIndex:4];
    [(SDSetupAgent *)v27 testHomeKitDeviceDetected:v12];
    goto LABEL_15;
  }
  if ([v23 hasPrefix:@"nfcui"])
  {
    unsigned int v28 = self->_server->_setupAgent;
    CFStringRef v12 = [v23 substringFromIndex:5];
    [(SDSetupAgent *)v28 testNFCUI:v12];
    goto LABEL_15;
  }
  if ([v23 hasPrefix:@"ppui"])
  {
    v29 = self->_server->_setupAgent;
    CFStringRef v12 = [v23 substringFromIndex:4];
    [(SDSetupAgent *)v29 testPairUI:v12];
    goto LABEL_15;
  }
  if ([v23 hasPrefix:@"pinshow"])
  {
    v30 = self->_server->_setupAgent;
    CFStringRef v12 = [v23 substringFromIndex:7];
    [(SDSetupAgent *)v30 testPINShow:v12];
    goto LABEL_15;
  }
  if (![v23 caseInsensitiveCompare:@"pinhide"])
  {
    [(SDSetupAgent *)self->_server->_setupAgent testPINHide];
    goto LABEL_16;
  }
  if ([v23 hasPrefix:@"dpick"])
  {
    CFStringRef v12 = [v23 substringFromIndex:5];
    id v31 = self->_server->_setupAgent;
    CFStringRef v55 = @"debugParams";
    id v56 = v12;
    id v32 = +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
    [(SDSetupAgent *)v31 showDevicePickerWithInfo:v32 completion:&stru_1008CE348];

    goto LABEL_15;
  }
  if ([v23 hasPrefix:@"pwui"])
  {
    id v33 = self->_server->_setupAgent;
    CFStringRef v12 = [v23 substringFromIndex:4];
    [(SDSetupAgent *)v33 testSetupUIPasswordSharing:v12];
    goto LABEL_15;
  }
  if ([v23 hasPrefix:@"rpui"])
  {
    id v34 = self->_server->_setupAgent;
    CFStringRef v12 = [v23 substringFromIndex:4];
    [(SDSetupAgent *)v34 testRepairUI:v12];
    goto LABEL_15;
  }
  if ([v23 hasPrefix:@"ShareAudioUI"])
  {
    id v35 = self->_server->_setupAgent;
    CFStringRef v12 = [v23 substringFromIndex:12];
    [(SDSetupAgent *)v35 testUIShareAudio:v12];
    goto LABEL_15;
  }
  if ([v23 hasPrefix:@"siriN"])
  {
    [(SDProximityPairingAgent *)self->_server->_ppAgent promptForSiriNotificationsForDevice:0];
    goto LABEL_16;
  }
  if ([v23 hasPrefix:@"TVLatencyUI"])
  {
    id v36 = self->_server->_setupAgent;
    CFStringRef v12 = [v23 substringFromIndex:11];
    [(SDSetupAgent *)v36 testUITVLatencySetup:v12];
    goto LABEL_15;
  }
  if ([v23 hasPrefix:@"TVColorCalibrator"])
  {
    long long v37 = self->_server->_setupAgent;
    CFStringRef v12 = [v23 substringFromIndex:17];
    [(SDSetupAgent *)v37 testUITVLatencyColorimeterSetup:v12];
    goto LABEL_15;
  }
  if ([v23 hasPrefix:@"whaui"])
  {
    long long v38 = self->_server->_setupAgent;
    CFStringRef v12 = [v23 substringFromIndex:5];
    [(SDSetupAgent *)v38 testSetupUIWHA:v12];
    goto LABEL_15;
  }
  if ([v23 hasPrefix:@"wsui"])
  {
    long long v39 = self->_server->_setupAgent;
    CFStringRef v12 = [v23 substringFromIndex:4];
    [(SDSetupAgent *)v39 testSetupUIWatch:v12];
    goto LABEL_15;
  }
  if ([v23 hasPrefix:@"testProxCardKit"])
  {
    id v40 = self->_server->_setupAgent;
    CFStringRef v12 = [v23 substringFromIndex:8];
    [(SDSetupAgent *)v40 testProxCardKit:v12];
    goto LABEL_15;
  }
  if ([v23 hasPrefix:@"unpost"])
  {
    id v41 = +[SDNotificationManager sharedManager];
    uint64_t v42 = [v23 substringFromIndex:6];
    [v41 testPost:v42];

    goto LABEL_16;
  }
  if ([v23 hasPrefix:@"familyHSNotification"])
  {
    [(SDHotspotAgent *)self->_server->_hotspotAgent testNotification];
    goto LABEL_16;
  }
  if (dword_100967FA0 <= 50 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
  {
    id v50 = v23;
    LogPrintF();
  }
  signed int v8 = -6735;
LABEL_101:
  uint64_t v43 = v8;
  NSErrorUserInfoKey v53 = NSLocalizedDescriptionKey;
  uint64_t v44 = +[NSString stringWithUTF8String:DebugGetErrorString()];
  uint64_t v45 = (void *)v44;
  CFStringRef v46 = @"?";
  if (v44) {
    CFStringRef v46 = (const __CFString *)v44;
  }
  CFStringRef v54 = v46;
  long long v47 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1, v50);
  id v48 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v43 userInfo:v47];
  ((void (**)(id, void *))v7)[2](v7, v48);

LABEL_17:
}

- (void)diagnosticLogControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (![(SDXPCConnection *)self _entitled:@"com.apple.sharing.Diagnostics" state:&self->_entitledDiagnostics label:@"DiagnosticLogControl"])
  {
    if (!v6 || ([v6 UTF8String], !LogControl())) {
      LogShow();
    }
  }
  if (v7)
  {
    signed int v8 = NSPrintF();
    v7[2](v7, v8);
  }
}

- (void)diagnosticMock:(id)a3 device:(id)a4 completion:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  CFStringRef v9 = (void (**)(id, void))a5;
  if ([v10 caseInsensitiveCompare:@"change"])
  {
    if ([v10 caseInsensitiveCompare:@"found"])
    {
      if ([v10 caseInsensitiveCompare:@"lost"])
      {
        if (dword_100967FA0 <= 50 && (dword_100967FA0 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
      }
      else
      {
        [(SDNearbyAgent *)self->_server->_nearbyAgent diagnosticMockLost:v8];
      }
    }
    else
    {
      [(SDNearbyAgent *)self->_server->_nearbyAgent diagnosticMockFound:v8];
    }
  }
  else
  {
    [(SDNearbyAgent *)self->_server->_nearbyAgent diagnosticMockChanged:v8];
  }
  if (v9) {
    v9[2](v9, 0);
  }
}

- (void)diagnosticMockStart:(id)a3
{
  id v5 = a3;
  if (dword_100967FA0 <= 50 && (dword_100967FA0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(SDNearbyAgent *)self->_server->_nearbyAgent diagnosticBLEModeStart:self];
  unsigned int v4 = v5;
  if (v5)
  {
    (*((void (**)(id, void))v5 + 2))(v5, 0);
    unsigned int v4 = v5;
  }
}

- (void)diagnosticMockStop:(id)a3
{
  id v5 = a3;
  if (dword_100967FA0 <= 50 && (dword_100967FA0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(SDNearbyAgent *)self->_server->_nearbyAgent diagnosticBLEModeStop:self];
  unsigned int v4 = v5;
  if (v5)
  {
    (*((void (**)(id, void))v5 + 2))(v5, 0);
    unsigned int v4 = v5;
  }
}

- (void)diagnosticShow:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if ([(SDXPCConnection *)self _entitled:@"com.apple.sharing.Diagnostics" state:&self->_entitledDiagnostics label:@"DiagnosticShow"])
  {
    uint64_t v11 = 0;
    if (!v7) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if ([v6 isEqual:@"ids"])
  {
    nearbyAgent = self->_server->_nearbyAgent;
    id v66 = 0;
    [(SDNearbyAgent *)nearbyAgent idsDevicesAppendDescription:&v66];
    id v9 = v66;
LABEL_11:
    uint64_t v11 = 0;
    goto LABEL_12;
  }
  if ([v6 isEqual:@"prox"])
  {
    v65[18] = 0;
    id v10 = [(SDNearbyAgent *)self->_server->_nearbyAgent bleProximityInfo];
    NSAppendPrintF();
LABEL_10:
    id v9 = 0;

    goto LABEL_11;
  }
  if ([v6 isEqual:@"autofill"])
  {
    v65[17] = 0;
    id v10 = [(SDAutoFillAgent *)self->_server->_autoFillAgent description];
    NSAppendPrintF();
    goto LABEL_10;
  }
  if ([v6 isEqual:@"handoff"])
  {
    v65[16] = 0;
    id v10 = [(SDProxHandoffAgent *)self->_server->_proxHandoffAgent description];
    NSAppendPrintF();
    goto LABEL_10;
  }
  unsigned __int8 v13 = [v6 isEqual:@"ss"];
  uint64_t v14 = [(SDNearbyAgent *)self->_server->_nearbyAgent description];
  id v15 = (void *)v14;
  if (v14)
  {
    v65[15] = 0;
    NSErrorUserInfoKey v53 = (void *)v14;
    NSAppendPrintF();
    id v16 = 0;
    if (v13) {
      goto LABEL_28;
    }
  }
  else
  {
    id v16 = 0;
    if (v13) {
      goto LABEL_28;
    }
  }
  unsigned int v17 = [(SDAppleIDAgent *)self->_server->_appleIDAgent detailedDescription];

  if (v17)
  {
    v65[14] = v16;
    CFStringRef v54 = v17;
    NSAppendPrintF();
    id v18 = v16;

    id v16 = v18;
  }
  CFStringRef v19 = +[SDAirDropContactHashManager shared];
  id v20 = [v19 detailedDescription];

  if (v20)
  {
    v65[13] = v16;
    CFStringRef v55 = v20;
    NSAppendPrintF();
    id v21 = v16;

    id v16 = v21;
  }
  CFStringRef v22 = +[SDStatusMonitor sharedMonitor];
  id v15 = [v22 description];

  if (v15)
  {
    v65[12] = v16;
    NSErrorUserInfoKey v53 = v15;
    NSAppendPrintF();
    id v23 = v16;

    id v16 = v23;
  }
LABEL_28:
  id v24 = [(SDRemoteInteractionAgent *)self->_server->_riAgent description];

  if (v24)
  {
    v65[11] = v16;
    id v56 = v24;
    NSAppendPrintF();
    id v25 = v16;

    id v16 = v25;
  }
  id v26 = [(SDAutoFillAgent *)self->_server->_autoFillAgent description];

  if (v26)
  {
    v65[10] = v16;
    v57 = v26;
    NSAppendPrintF();
    id v27 = v16;

    id v16 = v27;
  }
  unsigned int v28 = [(SDProxHandoffAgent *)self->_server->_proxHandoffAgent description];

  if (v28)
  {
    v65[9] = v16;
    v58 = v28;
    NSAppendPrintF();
    id v29 = v16;

    id v16 = v29;
  }
  if ((v13 & 1) == 0)
  {
    v30 = +[SDNotificationManager sharedManager];
    id v31 = [v30 description];

    if (v31)
    {
      v65[8] = v16;
      v58 = v31;
      NSAppendPrintF();
      id v32 = v16;

      id v16 = v32;
    }
    id v33 = +[SDAutoUnlockAKSManager sharedManager];
    id v34 = [v33 state];

    if (v34)
    {
      v65[7] = v16;
      v59 = v34;
      NSAppendPrintF();
      id v35 = v16;

      id v16 = v35;
    }
    id v36 = +[SDAutoUnlockSessionManager sharedManager];
    long long v37 = [v36 state];

    if (v37)
    {
      v65[6] = v16;
      v60 = v37;
      NSAppendPrintF();
      id v38 = v16;

      id v16 = v38;
    }
    long long v39 = +[SDAutoUnlockTransport sharedTransport];
    id v40 = [v39 state];

    if (v40)
    {
      v65[5] = v16;
      v61 = v40;
      NSAppendPrintF();
      id v41 = v16;

      id v16 = v41;
    }
    uint64_t v42 = +[SDDeviceAssetMonitor sharedAssetMonitor];
    uint64_t v43 = [v42 state];

    if (v43)
    {
      v65[4] = v16;
      v62 = v43;
      NSAppendPrintF();
      id v44 = v16;

      id v16 = v44;
    }
    uint64_t v45 = +[SDHotspotAgent sharedAgent];
    unsigned int v28 = [v45 description];

    if (v28)
    {
      v65[3] = v16;
      v58 = v28;
      NSAppendPrintF();
      id v46 = v16;

      id v16 = v46;
    }
  }
  long long v47 = [(SDProximityPairingAgent *)self->_server->_ppAgent description];

  if (v47)
  {
    v65[2] = v16;
    v63 = v47;
    NSAppendPrintF();
    id v48 = v16;

    id v16 = v48;
  }
  uint64_t v11 = CUDescriptionWithLevel();

  if (v11)
  {
    v65[1] = v16;
    v63 = v11;
    NSAppendPrintF();
    id v49 = v16;

    id v16 = v49;
  }
  server = self->_server;
  v65[0] = v16;
  -[SDXPCServer stateAppendXPCConnections:](server, "stateAppendXPCConnections:", v65, v63);
  id v9 = v65[0];

  if ([v6 isEqual:@"all"])
  {
    NSAppendPrintF();
    id v51 = v9;

    NSAppendPrintF();
    id v52 = v51;

    v64 = [(SDNearbyAgent *)self->_server->_nearbyAgent bleProximityInfo];
    NSAppendPrintF();
    id v9 = v52;
  }
  if (!v9)
  {
    if (!v7) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_12:
  if (v7)
  {
    if (v9)
    {
      v7[2](v7, v9);
      goto LABEL_17;
    }
LABEL_15:
    CFStringRef v12 = NSPrintF();
    v7[2](v7, v12);

LABEL_16:
    id v9 = 0;
  }
LABEL_17:
}

- (void)diagnosticUnlockTestClientWithDevice:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if ([(SDXPCConnection *)self _entitled:@"com.apple.sharing.Diagnostics" state:&self->_entitledDiagnostics label:@"DiagnosticUnlockTestClientWithDevice"])
  {
    if (dword_100967FA0 <= 60 && (dword_100967FA0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    [(SDNearbyAgent *)self->_server->_nearbyAgent unlockStartTestClientWithDevice:v4];
    self->_unlockTestClientStarted = 1;
  }
}

- (void)diagnosticUnlockTestServer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if ([(SDXPCConnection *)self _entitled:@"com.apple.sharing.Diagnostics" state:&self->_entitledDiagnostics label:@"DiagnosticUnlockTestServer"])
  {
    if (dword_100967FA0 <= 60 && (dword_100967FA0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    nearbyAgent = self->_server->_nearbyAgent;
    [(SDNearbyAgent *)nearbyAgent unlockStartTestServer];
  }
}

- (void)nfcTagReaderUIActivateWithEndpoint:(id)a3 params:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
  {
    CFStringRef v19 = @"NFCTagReaderUIActivate";
    LogPrintF();
  }
  uint64_t v11 = [(SDXPCConnection *)self _entitled:@"com.apple.sharing.Client", &self->_entitledClient, @"NFCTagReaderUIActivate", v19 state label];
  if (v11)
  {
    uint64_t v12 = v11;
    if (dword_100967FA0 <= 60 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
    {
      CFStringRef v20 = @"NFCTagReaderUIActivate";
      uint64_t v21 = v12;
      LogPrintF();
    }
    if (v10)
    {
      uint64_t v13 = (int)v12;
      NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
      uint64_t v14 = +[NSString stringWithUTF8String:DebugGetErrorString()];
      id v15 = (void *)v14;
      CFStringRef v16 = @"?";
      if (v14) {
        CFStringRef v16 = (const __CFString *)v14;
      }
      CFStringRef v23 = v16;
      unsigned int v17 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1, v20, v21);
      id v18 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v13 userInfo:v17];
      v10[2](v10, v18);
    }
  }
  else
  {
    [(SDSetupAgent *)self->_server->_setupAgent nfcTagReaderUIActivateWithEndpoint:v8 params:v9 completion:v10];
  }
}

- (void)b389NFCPromptDidRequestPresentationWithConfiguration:(id)a3 responseHandler:(id)a4
{
  id v12 = a3;
  id v6 = (void (**)(id, void *, void, double))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
  {
    CFStringRef v10 = @"B389NFCPromptShow";
    id v11 = v12;
    LogPrintF();
  }
  signed int v7 = [(SDXPCConnection *)self _entitled:@"com.apple.sharing.DurianTapPromptClient", &self->_entitledB389NFCPromptClient, @"B389NFCPromptShow", v10, v11 state label];
  if (v7
    && (+[NSError errorWithDomain:@"SFB389NFCPromptErrorDomain" code:v7 userInfo:&off_100905988], (id v8 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v9 = v8;
    if (dword_100967FA0 <= 60 && (dword_100967FA0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (v6) {
      v6[2](v6, v9, 0, -1.0);
    }
  }
  else
  {
    id v9 = +[SDB389SetupAgent shared];
    [v9 showNFCPromptWithConfig:v12 responseHandler:v6];
  }
}

- (void)b389NFCPromptUpdateConfiguration:(id)a3
{
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
  {
    CFStringRef v7 = @"B389NFCPromptUpdateTitle";
    id v8 = v9;
    LogPrintF();
  }
  signed int v4 = [(SDXPCConnection *)self _entitled:@"com.apple.sharing.DurianTapPromptClient", &self->_entitledB389NFCPromptClient, @"B389NFCPromptUpdateTitle", v7, v8 state label];
  if (v4
    && (+[NSError errorWithDomain:@"SFB389NFCPromptErrorDomain" code:v4 userInfo:&off_1009059B0], (id v5 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = v5;
    if (dword_100967FA0 <= 60 && (dword_100967FA0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    id v6 = +[SDB389SetupAgent shared];
    [v6 updateNFCPromptConfig:v9 responseHandler:0];
  }
}

- (void)dismissCurrentB389NFCPrompt
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
  {
    CFStringRef v5 = @"B389NFCPromptDismiss";
    LogPrintF();
  }
  signed int v3 = [(SDXPCConnection *)self _entitled:@"com.apple.sharing.DurianTapPromptClient", &self->_entitledB389NFCPromptClient, @"B389NFCPromptDismiss", v5 state label];
  if (v3
    && (+[NSError errorWithDomain:@"SFB389NFCPromptErrorDomain" code:v3 userInfo:&off_1009059D8], (id v4 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = v4;
    if (dword_100967FA0 <= 60 && (dword_100967FA0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    id v6 = +[SDB389SetupAgent shared];
    [v6 dismissNFCPrompt];
  }
}

- (void)proximityClientActivate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
  {
    CFStringRef v16 = @"ProximityClientActivate";
    LogPrintF();
  }
  signed int v9 = [(SDXPCConnection *)self _entitled:@"com.apple.sharing.ProximityClient", &self->_entitledProximityClient, @"ProximityClientActivate", v16 state label];
  if (!v9)
  {
    if (self->_proxClient)
    {
LABEL_11:
      signed int v9 = 0;
      goto LABEL_12;
    }
    [v7 setDispatchQueue:self->_server->_dispatchQueue];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10015344C;
    v26[3] = &unk_1008CB590;
    v26[4] = self;
    [v7 setDeviceEnteredImmediateHandler:v26];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1001534CC;
    v25[3] = &unk_1008CB590;
    v25[4] = self;
    [v7 setDeviceExitedImmediateHandler:v25];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10015354C;
    v24[3] = &unk_1008CB590;
    v24[4] = self;
    [v7 setDeviceEnteredNearbyHandler:v24];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1001535CC;
    v23[3] = &unk_1008CB590;
    v23[4] = self;
    [v7 setDeviceExitedNearbyHandler:v23];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10015364C;
    v22[3] = &unk_1008CB590;
    v22[4] = self;
    [v7 setDeviceWasDismissedHandler:v22];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1001536D0;
    v21[3] = &unk_1008CC2C8;
    v21[4] = self;
    [v7 setDeviceWasDismissedHandlerEx:v21];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100153758;
    v20[3] = &unk_1008CB590;
    void v20[4] = self;
    [v7 setDeviceWasSelectedHandler:v20];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1001537D8;
    v19[3] = &unk_1008CB590;
    v19[4] = self;
    [v7 setDeviceWillTriggerHandler:v19];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100153858;
    v18[3] = &unk_1008CB590;
    v18[4] = self;
    [v7 setDeviceDidUntriggerHandler:v18];
    if ([v7 wantsUpdates])
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1001538D8;
      v17[3] = &unk_1008CE370;
      void v17[4] = self;
      [v7 setDeviceUpdateHandler:v17];
    }
    signed int v9 = [(SDProxHandoffAgent *)self->_server->_proxHandoffAgent proximityClientStart:v7];
    if (!v9)
    {
      objc_storeStrong((id *)&self->_proxClient, a3);
      goto LABEL_11;
    }
  }
LABEL_12:
  if (v8)
  {
    if (v9)
    {
      uint64_t v10 = v9;
      NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
      uint64_t v11 = +[NSString stringWithUTF8String:DebugGetErrorString()];
      id v12 = (void *)v11;
      CFStringRef v13 = @"?";
      if (v11) {
        CFStringRef v13 = (const __CFString *)v11;
      }
      CFStringRef v28 = v13;
      uint64_t v14 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      id v15 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v10 userInfo:v14];
      v8[2](v8, v15);
    }
    else
    {
      v8[2](v8, 0);
    }
  }
}

- (void)proximityClientUpdate:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
  {
    CFStringRef v5 = @"ProximityClientUpdate";
    id v6 = v7;
    LogPrintF();
  }
  if (self->_proxClient)
  {
    unsigned int v4 = [v7 shouldAdvertise];
    if (v4 != [(SFProximityClient *)self->_proxClient shouldAdvertise]) {
      -[SFProximityClient setShouldAdvertise:](self->_proxClient, "setShouldAdvertise:", [v7 shouldAdvertise]);
    }
    -[SDProxHandoffAgent proximityClientUpdate:](self->_server->_proxHandoffAgent, "proximityClientUpdate:", self->_proxClient, v5, v6);
  }
  else if (dword_100967FA0 <= 60 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)proximityClientDismissContentForDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  signed int v8 = [(SDXPCConnection *)self _entitled:@"com.apple.sharing.ProximityClient" state:&self->_entitledProximityClient label:@"ProximityClientDismissContent"];
  if (!v8)
  {
    proxClient = self->_proxClient;
    if (!proxClient)
    {
      if (!v7) {
        goto LABEL_10;
      }
      signed int v8 = -6720;
      goto LABEL_6;
    }
    signed int v8 = [(SDProxHandoffAgent *)self->_server->_proxHandoffAgent proximityClient:proxClient dismissContentForDevice:v6];
  }
  if (!v7) {
    goto LABEL_10;
  }
  if (!v8)
  {
    v7[2](v7, 0);
    goto LABEL_10;
  }
LABEL_6:
  uint64_t v10 = v8;
  NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
  uint64_t v11 = +[NSString stringWithUTF8String:DebugGetErrorString()];
  id v12 = (void *)v11;
  CFStringRef v13 = @"?";
  if (v11) {
    CFStringRef v13 = (const __CFString *)v11;
  }
  CFStringRef v17 = v13;
  uint64_t v14 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  id v15 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v10 userInfo:v14];
  ((void (**)(id, void *))v7)[2](v7, v15);

LABEL_10:
}

- (void)proximityClientProvideContent:(id)a3 forDevice:(id)a4 force:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void))a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  signed int v13 = [(SDXPCConnection *)self _entitled:@"com.apple.sharing.ProximityClient" state:&self->_entitledProximityClient label:@"ProximityClientProvideContent"];
  if (!v13)
  {
    proxClient = self->_proxClient;
    if (!proxClient)
    {
      if (!v12) {
        goto LABEL_10;
      }
      signed int v13 = -6720;
      goto LABEL_6;
    }
    signed int v13 = [(SDProxHandoffAgent *)self->_server->_proxHandoffAgent proximityClient:proxClient provideContent:v10 forDevice:v11 force:v7];
  }
  if (!v12) {
    goto LABEL_10;
  }
  if (!v13)
  {
    v12[2](v12, 0);
    goto LABEL_10;
  }
LABEL_6:
  uint64_t v15 = v13;
  NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
  uint64_t v16 = +[NSString stringWithUTF8String:DebugGetErrorString()];
  CFStringRef v17 = (void *)v16;
  CFStringRef v18 = @"?";
  if (v16) {
    CFStringRef v18 = (const __CFString *)v16;
  }
  CFStringRef v22 = v18;
  CFStringRef v19 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  CFStringRef v20 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v15 userInfo:v19];
  ((void (**)(id, void *))v12)[2](v12, v20);

LABEL_10:
}

- (void)proximityClientSuppressDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  signed int v8 = [(SDXPCConnection *)self _entitled:@"com.apple.sharing.ProximityClient" state:&self->_entitledProximityClient label:@"ProximityClientSuppressDevice"];
  if (!v8)
  {
    proxClient = self->_proxClient;
    if (!proxClient)
    {
      if (!v7) {
        goto LABEL_10;
      }
      signed int v8 = -6720;
      goto LABEL_6;
    }
    signed int v8 = [(SDProxHandoffAgent *)self->_server->_proxHandoffAgent proximityClient:proxClient suppressDevice:v6];
  }
  if (!v7) {
    goto LABEL_10;
  }
  if (!v8)
  {
    v7[2](v7, 0);
    goto LABEL_10;
  }
LABEL_6:
  uint64_t v10 = v8;
  NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
  uint64_t v11 = +[NSString stringWithUTF8String:DebugGetErrorString()];
  id v12 = (void *)v11;
  CFStringRef v13 = @"?";
  if (v11) {
    CFStringRef v13 = (const __CFString *)v11;
  }
  CFStringRef v17 = v13;
  uint64_t v14 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  uint64_t v15 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v10 userInfo:v14];
  ((void (**)(id, void *))v7)[2](v7, v15);

LABEL_10:
}

- (void)proximityClientStopSuppressingDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  signed int v8 = [(SDXPCConnection *)self _entitled:@"com.apple.sharing.ProximityClient" state:&self->_entitledProximityClient label:@"ProximityClientStopSuppressingDevice"];
  if (!v8)
  {
    proxClient = self->_proxClient;
    if (!proxClient)
    {
      if (!v7) {
        goto LABEL_10;
      }
      signed int v8 = -6720;
      goto LABEL_6;
    }
    signed int v8 = [(SDProxHandoffAgent *)self->_server->_proxHandoffAgent proximityClient:proxClient stopSuppressingDevice:v6];
  }
  if (!v7) {
    goto LABEL_10;
  }
  if (!v8)
  {
    v7[2](v7, 0);
    goto LABEL_10;
  }
LABEL_6:
  uint64_t v10 = v8;
  NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
  uint64_t v11 = +[NSString stringWithUTF8String:DebugGetErrorString()];
  id v12 = (void *)v11;
  CFStringRef v13 = @"?";
  if (v11) {
    CFStringRef v13 = (const __CFString *)v11;
  }
  CFStringRef v17 = v13;
  uint64_t v14 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  uint64_t v15 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v10 userInfo:v14];
  ((void (**)(id, void *))v7)[2](v7, v15);

LABEL_10:
}

- (void)proximityClientUpdateContent:(id)a3 forDevice:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  signed int v11 = [(SDXPCConnection *)self _entitled:@"com.apple.sharing.ProximityClient" state:&self->_entitledProximityClient label:@"ProximityClientUpdateContent"];
  if (!v11)
  {
    proxClient = self->_proxClient;
    if (!proxClient)
    {
      if (!v10) {
        goto LABEL_10;
      }
      signed int v11 = -6720;
      goto LABEL_6;
    }
    signed int v11 = [(SDProxHandoffAgent *)self->_server->_proxHandoffAgent proximityClient:proxClient updateContent:v8 forDevice:v9];
  }
  if (!v10) {
    goto LABEL_10;
  }
  if (!v11)
  {
    v10[2](v10, 0);
    goto LABEL_10;
  }
LABEL_6:
  uint64_t v13 = v11;
  NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
  uint64_t v14 = +[NSString stringWithUTF8String:DebugGetErrorString()];
  uint64_t v15 = (void *)v14;
  CFStringRef v16 = @"?";
  if (v14) {
    CFStringRef v16 = (const __CFString *)v14;
  }
  CFStringRef v20 = v16;
  CFStringRef v17 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  CFStringRef v18 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v13 userInfo:v17];
  ((void (**)(id, void *))v10)[2](v10, v18);

LABEL_10:
}

- (void)proximityClientRequestScannerTimerReset
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  unsigned int v3 = [(SDXPCConnection *)self _entitled:@"com.apple.sharing.ProximityClient" state:&self->_entitledProximityClient label:@"ProximityClientUpdateContent"];
  if (v3)
  {
    int v5 = v3;
  }
  else
  {
    if (self->_proxClient)
    {
      proxHandoffAgent = self->_server->_proxHandoffAgent;
      -[SDProxHandoffAgent proximityClientRequestScannerTimerReset:](proxHandoffAgent, "proximityClientRequestScannerTimerReset:");
      return;
    }
    int v5 = -6720;
  }
  if (dword_100967FA0 <= 90 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v6 = v5;
    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    uint64_t v7 = +[NSString stringWithUTF8String:DebugGetErrorString()];
    id v8 = (void *)v7;
    CFStringRef v9 = @"?";
    if (v7) {
      CFStringRef v9 = (const __CFString *)v7;
    }
    CFStringRef v13 = v9;
    uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    signed int v11 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v6 userInfo:v10];
    LogPrintF();
  }
}

- (void)remoteInteractionSessionActivate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
  {
    CFStringRef v16 = @"RemoteInteractionSessionActivate";
    LogPrintF();
  }
  signed int v9 = [(SDXPCConnection *)self _entitled:@"com.apple.sharing.RemoteInteractionSession", &self->_entitledRemoteInteractionSession, @"RemoteInteractionSessionActivate", v16 state label];
  if (!v9)
  {
    if (!self->_riSession)
    {
      [v7 setDispatchQueue:self->_server->_dispatchQueue];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1001548F8;
      v20[3] = &unk_1008CB660;
      void v20[4] = self;
      [v7 setRemoteTextEventHandler:v20];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100154978;
      v19[3] = &unk_1008CE398;
      v19[4] = self;
      [v7 setTextSessionDidBegin:v19];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1001549F8;
      v18[3] = &unk_1008CE398;
      v18[4] = self;
      [v7 setTextSessionDidEnd:v18];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100154A78;
      v17[3] = &unk_1008CE398;
      void v17[4] = self;
      [v7 setTextSessionDidChange:v17];
      signed int v9 = [(SDRemoteInteractionAgent *)self->_server->_riAgent sessionStart:v7];
      if (v9) {
        goto LABEL_10;
      }
      objc_storeStrong((id *)&self->_riSession, a3);
    }
    signed int v9 = 0;
  }
LABEL_10:
  if (v8)
  {
    if (v9)
    {
      uint64_t v10 = v9;
      NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
      uint64_t v11 = +[NSString stringWithUTF8String:DebugGetErrorString()];
      NSErrorUserInfoKey v12 = (void *)v11;
      CFStringRef v13 = @"?";
      if (v11) {
        CFStringRef v13 = (const __CFString *)v11;
      }
      CFStringRef v22 = v13;
      uint64_t v14 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      uint64_t v15 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v10 userInfo:v14];
      v8[2](v8, v15);
    }
    else
    {
      v8[2](v8, 0);
    }
  }
}

- (void)remoteInteractionSessionSendPayload:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id riSession = self->_riSession;
  if (riSession)
  {
    id riSession = [riSession sendPayload:v5];
  }
  else if (dword_100967FA0 <= 60)
  {
    if (dword_100967FA0 != -1 || (id riSession = (id)_LogCategory_Initialize(), riSession)) {
      id riSession = (id)LogPrintF();
    }
  }

  _objc_release_x2(riSession);
}

- (void)serviceActivate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a4;
  signed int v9 = [v7 identifier];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
  {
    id v23 = v7;
    LogPrintF();
  }
  if (!v9)
  {
    int v16 = -6705;
    goto LABEL_20;
  }
  signed int v31 = [(SDXPCConnection *)self _entitledService:v9 state:&self->_entitledService];
  if (!v31)
  {
    if (self->_service)
    {
      int v16 = -6721;
      goto LABEL_20;
    }
    if (CFPrefs_GetInt64())
    {
      uint64_t v10 = [v7 identifier];
      uint64_t v11 = (void *)SFServiceIdentifierDeviceDiagnostics;
      unsigned int v12 = [v10 isEqual:SFServiceIdentifierDeviceDiagnostics];

      if (v12)
      {
        if (dword_100967FA0 <= 60 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
        {
          id v23 = v11;
          LogPrintF();
        }
        int v16 = -71165;
LABEL_20:
        signed int v31 = v16;
        if (!v8) {
          goto LABEL_26;
        }
        goto LABEL_21;
      }
    }
    [v7 setDispatchQueue:self->_server->_dispatchQueue];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10015519C;
    v30[3] = &unk_1008CA5A8;
    v30[4] = self;
    [v7 setErrorHandler:v30];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10015521C;
    v29[3] = &unk_1008CD480;
    v29[4] = self;
    [v7 setEventMessageHandler:v29];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1001552E8;
    v28[3] = &unk_1008CE3C0;
    v28[4] = self;
    [v7 setPeerDisconnectedHandler:v28];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10015538C;
    v27[3] = &unk_1008CE3E8;
    v27[4] = self;
    [v7 setReceivedFramePeerHandler:v27];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100155430;
    v26[3] = &unk_1008CB018;
    v26[4] = self;
    [v7 setRequestMessageHandler:v26];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1001554FC;
    v25[3] = &unk_1008CE410;
    v25[4] = self;
    [v7 setResponseMessageInternalHandler:v25];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1001555C8;
    v24[3] = &unk_1008CE3E8;
    v24[4] = self;
    [v7 setSendFramePeerHandler:v24];
    signed int v31 = [(SDNearbyAgent *)self->_server->_nearbyAgent serviceStart:v7];
    if (!v31)
    {
      objc_storeStrong((id *)&self->_service, a3);
      CFStringRef v13 = [(SFService *)self->_service identifier];
      unsigned int v14 = [v13 isEqualToString:SFServiceIdentifierPasswordSharing];

      if (v14)
      {
        uint64_t v15 = +[NSNotificationCenter defaultCenter];
        [v15 postNotificationName:SFWiFiPasswordSharingAdvertisingBegan object:0];
      }
    }
  }
  if (!v8) {
    goto LABEL_26;
  }
LABEL_21:
  uint64_t v17 = v31;
  if (v31)
  {
    NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
    uint64_t v18 = +[NSString stringWithUTF8String:DebugGetErrorString()];
    NSErrorUserInfoKey v19 = (void *)v18;
    CFStringRef v20 = @"?";
    if (v18) {
      CFStringRef v20 = (const __CFString *)v18;
    }
    CFStringRef v33 = v20;
    NSErrorUserInfoKey v21 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1, v23);
    CFStringRef v22 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v17 userInfo:v21];
    v8[2](v8, v22);
  }
  else
  {
    v8[2](v8, 0);
  }
LABEL_26:
}

- (void)serviceUpdate:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id service = self->_service;
  if (service)
  {
    [service updateWithService:v5];
    id service = [(SDNearbyAgent *)self->_server->_nearbyAgent update];
  }
  else if (dword_100967FA0 <= 60)
  {
    if (dword_100967FA0 != -1 || (id service = (id)_LogCategory_Initialize(), service)) {
      id service = (id)LogPrintF();
    }
  }

  _objc_release_x2(service);
}

- (void)servicePeerDisconnected:(id)a3 error:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100967FA0 <= 10 && (dword_100967FA0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id service = self->_service;
  if (service)
  {
    [(SFService *)service servicePeerDisconnected:v8 error:v6];
  }
  else if (dword_100967FA0 <= 60 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)serviceSendEvent:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100967FA0 <= 10)
  {
    if (dword_100967FA0 != -1 || (id v4 = (id)_LogCategory_Initialize(), v4)) {
      id v4 = (id)LogPrintF();
    }
  }
  if (self->_service)
  {
    id v4 = -[SDNearbyAgent serviceSendEvent:service:](self->_server->_nearbyAgent, "serviceSendEvent:service:", v5);
  }
  else if (dword_100967FA0 <= 60)
  {
    if (dword_100967FA0 != -1 || (id v4 = (id)_LogCategory_Initialize(), v4)) {
      id v4 = (id)LogPrintF();
    }
  }

  _objc_release_x2(v4);
}

- (void)serviceSendFrameType:(unsigned __int8)a3 data:(id)a4 peer:(id)a5
{
  uint64_t v6 = a3;
  id v10 = a4;
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100967FA0 <= 10 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
  {
    [v10 length];
    LogPrintF();
  }
  id service = self->_service;
  if (service)
  {
    [(SDNearbyAgent *)self->_server->_nearbyAgent bleNearbyInfoSendFrameType:v6 serviceType:[(SFService *)service serviceType] data:v10 peer:v8 isSession:0];
  }
  else if (dword_100967FA0 <= 60 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)serviceSendRequest:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100967FA0 <= 10)
  {
    if (dword_100967FA0 != -1 || (id v4 = (id)_LogCategory_Initialize(), v4)) {
      id v4 = (id)LogPrintF();
    }
  }
  if (self->_service)
  {
    id v4 = -[SDNearbyAgent serviceSendRequest:service:](self->_server->_nearbyAgent, "serviceSendRequest:service:", v5);
  }
  else if (dword_100967FA0 <= 60)
  {
    if (dword_100967FA0 != -1 || (id v4 = (id)_LogCategory_Initialize(), v4)) {
      id v4 = (id)LogPrintF();
    }
  }

  _objc_release_x2(v4);
}

- (void)serviceSendResponse:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100967FA0 <= 10)
  {
    if (dword_100967FA0 != -1 || (id v4 = (id)_LogCategory_Initialize(), v4)) {
      id v4 = (id)LogPrintF();
    }
  }
  if (self->_service)
  {
    id v4 = -[SDNearbyAgent serviceSendResponse:service:](self->_server->_nearbyAgent, "serviceSendResponse:service:", v5);
  }
  else if (dword_100967FA0 <= 60)
  {
    if (dword_100967FA0 != -1 || (id v4 = (id)_LogCategory_Initialize(), v4)) {
      id v4 = (id)LogPrintF();
    }
  }

  _objc_release_x2(v4);
}

- (void)sessionActivate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
  {
    CFStringRef v17 = @"SessionActivate";
    LogPrintF();
  }
  signed int v9 = [(SDXPCConnection *)self _entitled:@"com.apple.sharing.Session", &self->_entitledSession, @"SessionActivate", v17 state label];
  if (!v9)
  {
    if (self->_session)
    {
      signed int v9 = -6721;
    }
    else
    {
      id v10 = [v7 serviceUUID];

      if (v10)
      {
        [v7 setDispatchQueue:self->_server->_dispatchQueue];
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_1001561E0;
        v24[3] = &unk_1008CB068;
        v24[4] = self;
        [v7 setBluetoothStateChangedHandler:v24];
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_10015624C;
        v23[3] = &unk_1008CA5A8;
        v23[4] = self;
        [v7 setErrorHandler:v23];
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_1001562CC;
        v22[3] = &unk_1008CD480;
        v22[4] = self;
        [v7 setEventMessageHandler:v22];
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_10015634C;
        v21[3] = &unk_1008CE438;
        v21[4] = self;
        [v7 setReceivedFrameHandler:v21];
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_1001563D4;
        v20[3] = &unk_1008CB018;
        void v20[4] = self;
        [v7 setRequestMessageHandler:v20];
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_100156454;
        v19[3] = &unk_1008CE410;
        v19[4] = self;
        [v7 setResponseMessageInternalHandler:v19];
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_1001564D4;
        v18[3] = &unk_1008CE438;
        v18[4] = self;
        [v7 setSendFrameHandler:v18];
        objc_storeStrong((id *)&self->_session, a3);
        signed int v9 = [(SDNearbyAgent *)self->_server->_nearbyAgent sessionStart:v7];
      }
      else
      {
        signed int v9 = -6745;
      }
    }
  }
  if (v8)
  {
    if (v9)
    {
      uint64_t v11 = v9;
      NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
      uint64_t v12 = +[NSString stringWithUTF8String:DebugGetErrorString()];
      CFStringRef v13 = (void *)v12;
      CFStringRef v14 = @"?";
      if (v12) {
        CFStringRef v14 = (const __CFString *)v12;
      }
      CFStringRef v26 = v14;
      uint64_t v15 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      int v16 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v11 userInfo:v15];
      v8[2](v8, v16);
    }
    else
    {
      v8[2](v8, 0);
    }
  }
}

- (void)sessionSendEvent:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100967FA0 <= 10)
  {
    if (dword_100967FA0 != -1 || (id v4 = (id)_LogCategory_Initialize(), v4)) {
      id v4 = (id)LogPrintF();
    }
  }
  if (self->_session)
  {
    [v5 setSession:];
    id v4 = [(SDNearbyAgent *)self->_server->_nearbyAgent sessionSendEvent:v5 session:self->_session];
  }
  else if (dword_100967FA0 <= 60)
  {
    if (dword_100967FA0 != -1 || (id v4 = (id)_LogCategory_Initialize(), v4)) {
      id v4 = (id)LogPrintF();
    }
  }

  _objc_release_x2(v4);
}

- (void)sessionSendFrameType:(unsigned __int8)a3 data:(id)a4
{
  uint64_t v4 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100967FA0 <= 10 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
  {
    [v9 length];
    LogPrintF();
  }
  session = self->_session;
  if (session
    && ([session peerDevice],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v7 identifier],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        v8))
  {
    [(SDNearbyAgent *)self->_server->_nearbyAgent bleNearbyInfoSendFrameType:v4 serviceType:[(SFSession *)self->_session serviceType] data:v9 peer:v8 isSession:1];
  }
  else if (dword_100967FA0 <= 60)
  {
    if (dword_100967FA0 != -1 || (session = (void *)_LogCategory_Initialize(), session)) {
      session = (void *)LogPrintF();
    }
  }

  _objc_release_x2(session);
}

- (void)sessionSendRequest:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100967FA0 <= 10)
  {
    if (dword_100967FA0 != -1 || (id v4 = (id)_LogCategory_Initialize(), v4)) {
      id v4 = (id)LogPrintF();
    }
  }
  if (self->_session)
  {
    [v5 setSession:];
    id v4 = [(SDNearbyAgent *)self->_server->_nearbyAgent sessionSendRequest:v5 session:self->_session];
  }
  else if (dword_100967FA0 <= 60)
  {
    if (dword_100967FA0 != -1 || (id v4 = (id)_LogCategory_Initialize(), v4)) {
      id v4 = (id)LogPrintF();
    }
  }

  _objc_release_x2(v4);
}

- (void)sessionSendResponse:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100967FA0 <= 10)
  {
    if (dword_100967FA0 != -1 || (id v4 = (id)_LogCategory_Initialize(), v4)) {
      id v4 = (id)LogPrintF();
    }
  }
  if (self->_session)
  {
    [v5 setSession:];
    id v4 = [(SDNearbyAgent *)self->_server->_nearbyAgent sessionSendResponse:v5 session:self->_session];
  }
  else if (dword_100967FA0 <= 60)
  {
    if (dword_100967FA0 != -1 || (id v4 = (id)_LogCategory_Initialize(), v4)) {
      id v4 = (id)LogPrintF();
    }
  }

  _objc_release_x2(v4);
}

- (void)shareAudioSessionActivate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  CFStringRef v20 = sub_10014C464;
  NSErrorUserInfoKey v21 = sub_10014C474;
  id v22 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100156D50;
  v14[3] = &unk_1008CE2B8;
  int v16 = &v17;
  id v7 = a4;
  id v15 = v7;
  id v8 = objc_retainBlock(v14);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
  {
    CFStringRef v12 = @"ShareAudioSession activate";
    LogPrintF();
  }
  if ([(SDXPCConnection *)self _entitled:@"com.apple.sharing.Session", &self->_entitledSession, @"ShareAudioSession activate", v12 state label]|| self->_shareAudioSession)
  {
    uint64_t v11 = NSErrorF();
    id v9 = (SFShareAudioSessionDaemon *)v18[5];
    void v18[5] = v11;
  }
  else
  {
    id v9 = objc_alloc_init(SFShareAudioSessionDaemon);
    objc_storeStrong((id *)&self->_shareAudioSession, v9);
    [(SFShareAudioSessionDaemon *)v9 setDispatchQueue:self->_server->_dispatchQueue];
    id v10 = +[SDStatusMonitor sharedMonitor];
    [(SFShareAudioSessionDaemon *)v9 setStatusMonitor:v10];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100156E2C;
    v13[3] = &unk_1008CE460;
    v13[4] = v9;
    v13[5] = self;
    [(SFShareAudioSessionDaemon *)v9 setProgressHandler:v13];
    [(SFShareAudioSessionDaemon *)v9 activate];
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }

  ((void (*)(void *))v8[2])(v8);
  _Block_object_dispose(&v17, 8);
}

- (void)shareAudioUserConfirmed
{
  uint64_t v11 = 0;
  CFStringRef v12 = &v11;
  uint64_t v13 = 0x3032000000;
  CFStringRef v14 = sub_10014C464;
  id v15 = sub_10014C474;
  id v16 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001570F8;
  v10[3] = &unk_1008CA038;
  v10[4] = &v11;
  unsigned int v3 = objc_retainBlock(v10);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
  {
    CFStringRef v9 = @"ShareAudioSession UserConfirmed";
    LogPrintF();
  }
  if ([(SDXPCConnection *)self _entitled:@"com.apple.sharing.Session", &self->_entitledSession, @"ShareAudioSession UserConfirmed", v9 state label])
  {
    uint64_t v6 = NSErrorF();
    id v5 = (SFShareAudioSessionDaemon *)v12[5];
    v12[5] = v6;
  }
  else
  {
    id v4 = self->_shareAudioSession;
    id v5 = v4;
    if (v4)
    {
      [(SFShareAudioSessionDaemon *)v4 userConfirmed];
    }
    else
    {
      uint64_t v7 = NSErrorF();
      id v8 = (void *)v12[5];
      v12[5] = v7;
    }
  }

  ((void (*)(void *))v3[2])(v3);
  _Block_object_dispose(&v11, 8);
}

- (void)userNotificationPresent:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (dword_100967FA0 <= 50)
  {
    id v6 = v3;
    if (dword_100967FA0 != -1 || (int v5 = _LogCategory_Initialize(), v4 = v6, v5))
    {
      LogPrintF();
      id v4 = v6;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_shareAudioSession, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_riSession, 0);
  objc_storeStrong((id *)&self->_proxClient, 0);
  objc_storeStrong((id *)&self->_preventExitForLocaleReason, 0);
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_ddRequest, 0);
  objc_storeStrong((id *)&self->_caRequest, 0);
  objc_storeStrong((id *)&self->_assertions, 0);

  objc_storeStrong((id *)&self->_afsHelper, 0);
}

@end