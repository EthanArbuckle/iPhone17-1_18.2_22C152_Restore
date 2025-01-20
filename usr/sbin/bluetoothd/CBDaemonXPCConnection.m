@interface CBDaemonXPCConnection
+ (unint64_t)indexForCBApprovedAppID:(id)a3;
- (BOOL)_entitledAndReturnError:(id *)a3;
- (BOOL)_entitledCBAdvertiserAndReturnError:(id)a3 error:(id *)a4;
- (BOOL)entitled;
- (BOOL)remoteAccepted;
- (CBAdvertiser)activatedAdvertiser;
- (CBConnection)activatedConnection;
- (CBController)activatedController;
- (CBDaemonServer)daemon;
- (CBDevice)remoteDevice;
- (CBDiscovery)activatedDiscovery;
- (CBDiscovery)activatedDiscoveryWHB;
- (CBSpatialInteractionSession)activatedSpatialInteractionSession;
- (NSMutableDictionary)deviceMap;
- (NSNumber)remoteClientID;
- (NSString)appID;
- (OS_dispatch_queue)dispatchQueue;
- (OS_xpc_object)xpcCnx;
- (RPCompanionLinkClient)remoteClient;
- (id)_spatialInteractionDecodePeerTokenRequest:(id)a3 error:(id *)a4;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (int)pid;
- (int64_t)_powerStateForClient;
- (unint64_t)xpcToken;
- (void)_remoteInvalidate;
- (void)_setupWHBTimer;
- (void)_spatialInteractionDeviceFound:(id)a3 checkOnly:(BOOL)a4;
- (void)_spatialInteractionDeviceLost:(id)a3 removeUnmatched:(BOOL)a4 reason:(const char *)a5;
- (void)_spatialInteractionReevaluateDevices;
- (void)_updateDeviceMapSpatialInteractionDeviceTimestampArrayDictionary:(unsigned __int8)a3 device:(id)a4;
- (void)_whbTimerFired;
- (void)_xpcAdvertisingAddressChanged;
- (void)_xpcCBAdvertiserActivate:(id)a3;
- (void)_xpcCBAdvertiserUpdate:(id)a3;
- (void)_xpcCBConnection:(id)a3 pairingCompletedWithDevice:(id)a4 error:(id)a5;
- (void)_xpcCBConnection:(id)a3 pairingPromptWithPairingInfo:(id)a4;
- (void)_xpcCBConnectionActivate:(id)a3;
- (void)_xpcCBConnectionDisconnect:(id)a3;
- (void)_xpcCBConnectionPairingContinue:(id)a3;
- (void)_xpcCBControllerActivate:(id)a3;
- (void)_xpcCBDiscoveryActivate:(id)a3;
- (void)_xpcCBDiscoveryActivateLocal:(id)a3 discovery:(id)a4;
- (void)_xpcCBDiscoveryActivateWHB:(id)a3 discovery:(id)a4;
- (void)_xpcCBDiscoveryClearDuplicateFilterCache:(id)a3;
- (void)_xpcCBDiscoveryFinish:(id)a3;
- (void)_xpcCBDiscoveryGetDevices:(id)a3;
- (void)_xpcCBDiscoveryUpdate:(id)a3;
- (void)_xpcCBSpatialInteractionSessionActivate:(id)a3;
- (void)_xpcCBSpatialInteractionSessionAddPeerToken:(id)a3;
- (void)_xpcCBSpatialInteractionSessionRemovePeerToken:(id)a3;
- (void)_xpcCBSpatialInteractionSessionUpdate:(id)a3;
- (void)_xpcDeleteDevice:(id)a3;
- (void)_xpcDeviceFound:(id)a3;
- (void)_xpcDeviceLost:(id)a3;
- (void)_xpcDevicesBuffered:(id)a3;
- (void)_xpcDiagnosticAdvertiser;
- (void)_xpcDiagnosticAssertion;
- (void)_xpcDiagnosticControl:(id)a3;
- (void)_xpcDiagnosticDiscovery;
- (void)_xpcDiagnosticLog:(id)a3;
- (void)_xpcDiagnosticShow:(id)a3;
- (void)_xpcDiagnosticTipiChanged;
- (void)_xpcDiscoverableStateChanged:(int)a3;
- (void)_xpcGetControllerInfo:(id)a3;
- (void)_xpcGetControllerSettings:(id)a3;
- (void)_xpcGetDevices:(id)a3;
- (void)_xpcGetPowerState:(id)a3;
- (void)_xpcInquiryStateChanged:(int)a3;
- (void)_xpcModifyControllerSettings:(id)a3;
- (void)_xpcModifyDevice:(id)a3;
- (void)_xpcPerformDeviceRequest:(id)a3;
- (void)_xpcPowerStateChanged:(int64_t)a3;
- (void)_xpcReadPrefs:(id)a3;
- (void)_xpcReceivedMessage:(id)a3 remoteDevice:(id)a4;
- (void)_xpcReceivedRelayMessageType:(unsigned __int8)a3 messageData:(id)a4 conduitDevice:(id)a5 sourceDevice:(id)a6;
- (void)_xpcResetCBExtension:(id)a3;
- (void)_xpcSendAudioAccessoryConfigMessage:(id)a3;
- (void)_xpcSendAudioAccessoryEventMessage:(id)a3;
- (void)_xpcSendConversationDetectMessage:(id)a3;
- (void)_xpcSendEvent:(id)a3;
- (void)_xpcSendRelayMessage:(id)a3;
- (void)_xpcSendReply:(id)a3;
- (void)_xpcSendReplyError:(id)a3 request:(id)a4;
- (void)_xpcSendSmartRoutingInformation:(id)a3;
- (void)_xpcSetLowPowerMode:(id)a3;
- (void)_xpcSetPowerState:(id)a3;
- (void)_xpcSpatialInteractionAOPDataReceived:(id)a3;
- (void)_xpcSystemOverrideChanged;
- (void)_xpcTipiChanged:(id)a3;
- (void)_xpcUpdateIdentities:(id)a3;
- (void)_xpcWritePref:(id)a3;
- (void)activate;
- (void)aopMessageReceived:(id)a3;
- (void)invalidate;
- (void)reportDeviceFound:(id)a3;
- (void)reportDeviceLost:(id)a3;
- (void)reportDevicesBuffered:(id)a3;
- (void)setActivatedAdvertiser:(id)a3;
- (void)setActivatedConnection:(id)a3;
- (void)setActivatedController:(id)a3;
- (void)setActivatedDiscovery:(id)a3;
- (void)setActivatedDiscoveryWHB:(id)a3;
- (void)setActivatedSpatialInteractionSession:(id)a3;
- (void)setAppID:(id)a3;
- (void)setDaemon:(id)a3;
- (void)setDeviceMap:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEntitled:(BOOL)a3;
- (void)setPid:(int)a3;
- (void)setRemoteAccepted:(BOOL)a3;
- (void)setRemoteClient:(id)a3;
- (void)setRemoteClientID:(id)a3;
- (void)setRemoteDevice:(id)a3;
- (void)setXpcCnx:(id)a3;
- (void)setXpcToken:(unint64_t)a3;
- (void)whbStop;
- (void)xpcReceivedAudioAccessoryDeviceInfoChange:(id)a3;
- (void)xpcReceivedAudioAccessoryEventType:(unsigned __int8)a3 messageData:(id)a4 sourceDevice:(id)a5;
- (void)xpcReceivedEvent:(id)a3;
- (void)xpcReceivedMessage:(id)a3;
- (void)xpcReceivedRequest:(id)a3;
@end

@implementation CBDaemonXPCConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_remoteClientID, 0);
  objc_storeStrong((id *)&self->_remoteClient, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_daemon, 0);
  objc_storeStrong((id *)&self->_deviceMap, 0);
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong((id *)&self->_activatedSpatialInteractionSession, 0);
  objc_storeStrong((id *)&self->_activatedDiscoveryWHB, 0);
  objc_storeStrong((id *)&self->_activatedDiscovery, 0);
  objc_storeStrong((id *)&self->_activatedController, 0);
  objc_storeStrong((id *)&self->_activatedConnection, 0);
  objc_storeStrong((id *)&self->_activatedAdvertiser, 0);
  objc_storeStrong((id *)&self->_whbTimer, 0);
  objc_storeStrong((id *)&self->_whbLostDevicesMap, 0);
  objc_storeStrong((id *)&self->_spatialPeers, 0);
  objc_storeStrong((id *)&self->_spatialDeviceMapUnmatched, 0);

  objc_storeStrong((id *)&self->_spatialDeviceMapMatched, 0);
}

- (void)setXpcCnx:(id)a3
{
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void)setDaemon:(id)a3
{
}

- (void)activate
{
  self->_isHomePod = GestaltGetDeviceClass() == 7;
  if (dword_1009F85F0 <= 20 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
  {
    CUPrintPID();
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();
  }
}

- (CBSpatialInteractionSession)activatedSpatialInteractionSession
{
  return self->_activatedSpatialInteractionSession;
}

- (CBAdvertiser)activatedAdvertiser
{
  return self->_activatedAdvertiser;
}

- (void)xpcReceivedMessage:(id)a3
{
  xpc_object_t xdict = a3;
  if (xpc_get_type(xdict) == (xpc_type_t)&_xpc_type_dictionary)
  {
    v5 = xpc_dictionary_get_dictionary(xdict, "rmtD");
    if (v5) {
      [(CBDaemonXPCConnection *)self _xpcReceivedMessage:xdict remoteDevice:v5];
    }
    else {
      [(CBDaemonXPCConnection *)self xpcReceivedRequest:xdict];
    }

    goto LABEL_17;
  }
  v4 = xdict;
  if (xdict == &_xpc_error_connection_invalid)
  {
    if (dword_1009F85F0 <= 20 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
    {
      v9 = CUPrintPID();
      LogPrintF_safe();
    }
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0;

    [(CBDaemonXPCConnection *)self invalidate];
    goto LABEL_17;
  }
  if (dword_1009F85F0 <= 90)
  {
    if (dword_1009F85F0 != -1 || (int v6 = _LogCategory_Initialize(), v4 = xdict, v6))
    {
      v8 = CUPrintXPC();
      LogPrintF_safe();

LABEL_17:
      v4 = xdict;
    }
  }
}

- (void)xpcReceivedRequest:(id)a3
{
  id v7 = a3;
  string = xpc_dictionary_get_string(v7, "mTyp");
  if (!string)
  {
    if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    if (!CUXPCDictionaryExpectsReply()) {
      goto LABEL_87;
    }
LABEL_50:
    int v6 = CBErrorF();
    [(CBDaemonXPCConnection *)self _xpcSendReplyError:v6 request:v7];

    goto LABEL_87;
  }
  v5 = string;
  if (!strcmp(string, "AdvA"))
  {
    [(CBDaemonXPCConnection *)self _xpcCBAdvertiserActivate:v7];
    goto LABEL_87;
  }
  if (!strcmp(v5, "AdvU"))
  {
    [(CBDaemonXPCConnection *)self _xpcCBAdvertiserUpdate:v7];
    goto LABEL_87;
  }
  if (!strcmp(v5, "CnxA"))
  {
    [(CBDaemonXPCConnection *)self _xpcCBConnectionActivate:v7];
    goto LABEL_87;
  }
  if (!strcmp(v5, "CnxD"))
  {
    [(CBDaemonXPCConnection *)self _xpcCBConnectionDisconnect:v7];
    goto LABEL_87;
  }
  if (!strcmp(v5, "CnPC"))
  {
    [(CBDaemonXPCConnection *)self _xpcCBConnectionPairingContinue:v7];
    goto LABEL_87;
  }
  if (!strcmp(v5, "CtrA"))
  {
    [(CBDaemonXPCConnection *)self _xpcCBControllerActivate:v7];
    goto LABEL_87;
  }
  if (!strcmp(v5, "GCtI"))
  {
    [(CBDaemonXPCConnection *)self _xpcGetControllerInfo:v7];
    goto LABEL_87;
  }
  if (!strcmp(v5, "GCtS"))
  {
    [(CBDaemonXPCConnection *)self _xpcGetControllerSettings:v7];
    goto LABEL_87;
  }
  if (!strcmp(v5, "MCtS"))
  {
    [(CBDaemonXPCConnection *)self _xpcModifyControllerSettings:v7];
    goto LABEL_87;
  }
  if (!strcmp(v5, "GtDv"))
  {
    [(CBDaemonXPCConnection *)self _xpcGetDevices:v7];
    goto LABEL_87;
  }
  if (!strcmp(v5, "DltD"))
  {
    [(CBDaemonXPCConnection *)self _xpcDeleteDevice:v7];
    goto LABEL_87;
  }
  if (!strcmp(v5, "UpDv"))
  {
    [(CBDaemonXPCConnection *)self _xpcModifyDevice:v7];
    goto LABEL_87;
  }
  if (!strcmp(v5, "PfDR"))
  {
    [(CBDaemonXPCConnection *)self _xpcPerformDeviceRequest:v7];
    goto LABEL_87;
  }
  if (!strcmp(v5, "DiCt"))
  {
    [(CBDaemonXPCConnection *)self _xpcDiagnosticControl:v7];
    goto LABEL_87;
  }
  if (!strcmp(v5, "DiLg"))
  {
    [(CBDaemonXPCConnection *)self _xpcDiagnosticLog:v7];
    goto LABEL_87;
  }
  if (!strcmp(v5, "DiSh"))
  {
    [(CBDaemonXPCConnection *)self _xpcDiagnosticShow:v7];
    goto LABEL_87;
  }
  if (!strcmp(v5, "LpmS"))
  {
    [(CBDaemonXPCConnection *)self _xpcSetLowPowerMode:v7];
    goto LABEL_87;
  }
  if (!strcmp(v5, "PwrG"))
  {
    [(CBDaemonXPCConnection *)self _xpcGetPowerState:v7];
    goto LABEL_87;
  }
  if (!strcmp(v5, "PwrS"))
  {
    [(CBDaemonXPCConnection *)self _xpcSetPowerState:v7];
    goto LABEL_87;
  }
  if (!strcmp(v5, "RdPf"))
  {
    [(CBDaemonXPCConnection *)self _xpcReadPrefs:v7];
    goto LABEL_87;
  }
  if (!strcmp(v5, "WrPf"))
  {
    [(CBDaemonXPCConnection *)self _xpcWritePref:v7];
    goto LABEL_87;
  }
  if (!strcmp(v5, "SnAE"))
  {
    [(CBDaemonXPCConnection *)self _xpcSendAudioAccessoryEventMessage:v7];
    goto LABEL_87;
  }
  if (!strcmp(v5, "SnAC"))
  {
    [(CBDaemonXPCConnection *)self _xpcSendAudioAccessoryConfigMessage:v7];
    goto LABEL_87;
  }
  if (!strcmp(v5, "SnCD"))
  {
    [(CBDaemonXPCConnection *)self _xpcSendConversationDetectMessage:v7];
    goto LABEL_87;
  }
  if (!strcmp(v5, "SnRM"))
  {
    [(CBDaemonXPCConnection *)self _xpcSendRelayMessage:v7];
    goto LABEL_87;
  }
  if (!strcmp(v5, "SnSR"))
  {
    [(CBDaemonXPCConnection *)self _xpcSendSmartRoutingInformation:v7];
    goto LABEL_87;
  }
  if (!strcmp(v5, "RstE"))
  {
    [(CBDaemonXPCConnection *)self _xpcResetCBExtension:v7];
    goto LABEL_87;
  }
  if (!strcmp(v5, "UpId"))
  {
    [(CBDaemonXPCConnection *)self _xpcUpdateIdentities:v7];
    goto LABEL_87;
  }
  if (!strcmp(v5, "DscA"))
  {
    [(CBDaemonXPCConnection *)self _xpcCBDiscoveryActivate:v7];
    goto LABEL_87;
  }
  if (!strcmp(v5, "DscF"))
  {
    [(CBDaemonXPCConnection *)self _xpcCBDiscoveryFinish:v7];
    goto LABEL_87;
  }
  if (!strcmp(v5, "DscU"))
  {
    [(CBDaemonXPCConnection *)self _xpcCBDiscoveryUpdate:v7];
    goto LABEL_87;
  }
  if (!strcmp(v5, "DsCD"))
  {
    [(CBDaemonXPCConnection *)self _xpcCBDiscoveryClearDuplicateFilterCache:v7];
    goto LABEL_87;
  }
  if (!strcmp(v5, "DsGD"))
  {
    [(CBDaemonXPCConnection *)self _xpcCBDiscoveryGetDevices:v7];
    goto LABEL_87;
  }
  if (!strcmp(v5, "SpIn"))
  {
    [(CBDaemonXPCConnection *)self _xpcCBSpatialInteractionSessionActivate:v7];
    goto LABEL_87;
  }
  if (!strcmp(v5, "SpIU"))
  {
    [(CBDaemonXPCConnection *)self _xpcCBSpatialInteractionSessionUpdate:v7];
    goto LABEL_87;
  }
  if (!strcmp(v5, "SpAT"))
  {
    [(CBDaemonXPCConnection *)self _xpcCBSpatialInteractionSessionAddPeerToken:v7];
    goto LABEL_87;
  }
  if (!strcmp(v5, "SpRT"))
  {
    [(CBDaemonXPCConnection *)self _xpcCBSpatialInteractionSessionRemovePeerToken:v7];
    goto LABEL_87;
  }
  if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  if (CUXPCDictionaryExpectsReply()) {
    goto LABEL_50;
  }
LABEL_87:
}

- (void)invalidate
{
  xpcCnx = self->_xpcCnx;
  if (xpcCnx) {
    xpc_connection_cancel(xpcCnx);
  }
  v4 = self->_activatedAdvertiser;
  if (v4)
  {
    if (dword_1009F85F0 < 31 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintPID();
      v25 = v24 = v4;
      LogPrintF_safe();
    }
    [(CBAdvertiser *)v4 invalidate];
    activatedAdvertiser = self->_activatedAdvertiser;
    self->_activatedAdvertiser = 0;

    [(CBDaemonServer *)self->_daemon scheduleAdvertiserUpdateImmediate:0];
  }

  int v6 = self->_activatedConnection;
  if (v6)
  {
    if (dword_1009F85F0 < 31 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintPID();
      v25 = v24 = v6;
      LogPrintF_safe();
    }
    [(CBConnection *)v6 invalidate];
    if (self->_connectionAddedPairingClient)
    {
      id v7 = [(CBDaemonServer *)self->_daemon stackController];
      [v7 removePairingClient:v6];

      self->_connectionAddedPairingClient = 0;
    }
    activatedConnection = self->_activatedConnection;
    self->_activatedConnection = 0;
  }
  v9 = self->_activatedController;
  if (v9)
  {
    if (dword_1009F85F0 < 31 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintPID();
      v25 = v24 = v9;
      LogPrintF_safe();
    }
    if (self->_addedDiscoverableController)
    {
      v10 = [(CBDaemonServer *)self->_daemon stackController];
      [v10 removeDiscoverableController:v9];

      self->_addedDiscoverableController = 0;
    }
    [(CBController *)v9 invalidate];
    activatedController = self->_activatedController;
    self->_activatedController = 0;

    [(CBDaemonServer *)self->_daemon scheduleControlUpdateImmediate:0];
  }

  v12 = self->_activatedDiscovery;
  if (v12)
  {
    if (dword_1009F85F0 < 31 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintPID();
      v25 = v24 = v12;
      LogPrintF_safe();
    }
    v13 = +[CBMetricsDaemon sharedCBMetricsDaemon];
    [v13 reportCBDiscovery:v12 daemonCnx:self action:@"stop"];

    [(CBDiscovery *)v12 invalidate];
    activatedDiscovery = self->_activatedDiscovery;
    self->_activatedDiscovery = 0;

    [(CBDaemonServer *)self->_daemon scheduleDiscoveryUpdateImmediate:0];
  }

  v15 = self->_activatedDiscoveryWHB;
  if (v15)
  {
    if (dword_1009F85F0 < 31 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintPID();
      v25 = v24 = v15;
      LogPrintF_safe();
    }
    v16 = +[CBMetricsDaemon sharedCBMetricsDaemon];
    [v16 reportCBDiscovery:v15 daemonCnx:self action:@"stop"];

    [(CBDiscovery *)v15 invalidate];
    activatedDiscoveryWHB = self->_activatedDiscoveryWHB;
    self->_activatedDiscoveryWHB = 0;

    [(CBDaemonServer *)self->_daemon scheduleDiscoveryUpdateImmediate:0];
  }

  if (self->_remoteClient)
  {
    [(CBDaemonXPCConnection *)self _remoteInvalidate];
    [(CBDaemonServer *)self->_daemon scheduleUpdateImmediate:0];
  }
  whbTimer = self->_whbTimer;
  if (whbTimer)
  {
    v19 = whbTimer;
    dispatch_source_cancel(v19);
    v20 = self->_whbTimer;
    self->_whbTimer = 0;
  }
  v21 = self->_activatedSpatialInteractionSession;
  if (v21)
  {
    if (dword_1009F85F0 < 31 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintPID();
      v25 = v24 = v21;
      LogPrintF_safe();
    }
    [(CBSpatialInteractionSession *)v21 invalidate];
    activatedSpatialInteractionSession = self->_activatedSpatialInteractionSession;
    self->_activatedSpatialInteractionSession = 0;

    [(CBDaemonServer *)self->_daemon scheduleSpatialUpdateImmediate:0];
  }

  daemon = self->_daemon;

  [(CBDaemonServer *)daemon xpcConnectionInvalidated:self];
}

- (void)_xpcCBDiscoveryGetDevices:(id)a3
{
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_10004CF3C;
  v23 = sub_10004CD70;
  id v24 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10002B5F8;
  v16[3] = &unk_100997E48;
  v18 = &v19;
  v16[4] = self;
  id v4 = a3;
  id v17 = v4;
  v5 = objc_retainBlock(v16);
  int v6 = (id *)(v20 + 5);
  id obj = (id)v20[5];
  unsigned __int8 v7 = [(CBDaemonXPCConnection *)self _entitledAndReturnError:&obj];
  objc_storeStrong(v6, obj);
  if (v7)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "dsFl");
    if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
    {
      v9 = CBDiscoveryFlagsToString();
      v13 = CUPrintPID();
      LogPrintF_safe();
    }
    v10 = CUXPCDictionaryCreateReply();
    if (v10)
    {
      xpc_object_t v11 = xpc_array_create(0, 0);
      v12 = [(CBDaemonServer *)self->_daemon deviceMap];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000B8E28;
      v14[3] = &unk_100999448;
      v14[4] = v11;
      v14[5] = uint64;
      [v12 enumerateKeysAndObjectsUsingBlock:v14];

      xpc_dictionary_set_value(v10, "devA", v11);
      [(CBDaemonXPCConnection *)self _xpcSendReply:v10];
    }
    else if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v19, 8);
}

- (void)_xpcSendReply:(id)a3
{
  id v4 = a3;
  xpcCnx = self->_xpcCnx;
  id v11 = v4;
  if (xpcCnx)
  {
    xpc_connection_send_message(xpcCnx, v4);
  }
  else
  {
    CUXPCObjectGetResponseHandler();
    int v6 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      unsigned __int8 v7 = (void *)CUXPCCreateCFObjectFromXPCObject();
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
        {
          v9 = CUPrintNSObjectOneLine();
          LogPrintF_safe();
        }
        ((void (**)(void, void *, void, void))v6)[2](v6, v7, 0, 0);
      }
      else
      {
        v8 = CBErrorF();
        if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
        {
          v10 = CUPrintNSError();
          LogPrintF_safe();
        }
        ((void (**)(void, void, void, void *))v6)[2](v6, 0, 0, v8);
      }
    }
    else if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
}

- (BOOL)_entitledAndReturnError:(id *)a3
{
  if (!self->_entitled)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    xpc_connection_get_audit_token();
    int v6 = (void *)xpc_copy_entitlement_for_token();
    unsigned __int8 v7 = v6;
    if (!v6
      || !xpc_dictionary_get_BOOL(v6, "com.apple.bluetooth.system")
      && !xpc_dictionary_get_BOOL(v7, "com.apple.bluetooth.internal"))
    {
      CBErrorF();
      v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
      {
        v18 = CUPrintPID();
        uint64_t v21 = CUPrintNSError();
        LogPrintF_safe();
      }
      if (a3)
      {
        v9 = v9;
        BOOL v3 = 0;
        *a3 = v9;
      }
      else
      {
        BOOL v3 = 0;
      }
      goto LABEL_36;
    }
    string = (const char *)xpc_copy_code_signing_identity_for_token();
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10002DF98;
    v22[3] = &unk_100997528;
    v22[4] = string;
    v9 = objc_retainBlock(v22);
    if (string || (string = xpc_dictionary_get_string(v7, "application-identifier")) != 0)
    {
      v10 = +[NSString stringWithUTF8String:string];
      appID = self->_appID;
      self->_appID = v10;

      char v12 = 0;
    }
    else
    {
      char v12 = 1;
    }
    if ([(CBDaemonServer *)self->_daemon prefEnforceApprovedList])
    {
      if (v12)
      {
LABEL_15:
        v16 = CBErrorF();
        if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
        {
          id v17 = CUPrintPID();
          v20 = CUPrintNSError();
          LogPrintF_safe();
        }
        if (a3) {
          *a3 = v16;
        }

        BOOL v3 = 0;
LABEL_35:
        v9[2](v9);
LABEL_36:

        return v3;
      }
      v13 = self->_appID;
      v14 = CBGenerateObfuscatedSHA256HashedString();
      uint64_t v15 = 0;
      while (([v14 isEqualToString:off_100998D28[v15]] & 1) == 0)
      {
        if (++v15 == 172)
        {

          goto LABEL_15;
        }
      }
    }
    if ((v12 & 1) == 0 && !strcmp(string, "com.apple.cloudpaird")) {
      self->_supportsRestrictedMode = 1;
    }
    BOOL v3 = 1;
    self->_entitled = 1;
    goto LABEL_35;
  }
  return 1;
}

- (CBDiscovery)activatedDiscovery
{
  return self->_activatedDiscovery;
}

- (id)description
{
  return [(CBDaemonXPCConnection *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  unsigned __int8 v3 = a3;
  uint64_t v104 = 0;
  v105 = &v104;
  uint64_t v106 = 0x3032000000;
  v107 = sub_10004CF3C;
  v108 = sub_10004CD70;
  v109 = 0;
  if (self->_xpcCnx)
  {
    id obj = 0;
    CUPrintPID();
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    appID = v5;
    NSAppendPrintF_safe();
    objc_storeStrong((id *)&v109, 0);
    goto LABEL_8;
  }
  unint64_t xpcToken = self->_xpcToken;
  if (xpcToken)
  {
    uint64_t v102 = 0;
    appID = (NSString *)xpcToken;
    NSAppendPrintF_safe();
LABEL_5:
    unsigned __int8 v7 = (NSString *)0;
    v5 = v109;
    v109 = v7;
    goto LABEL_8;
  }
  remoteDevice = self->_remoteDevice;
  if (!remoteDevice)
  {
    uint64_t v100 = 0;
    appID = self->_appID;
    NSAppendPrintF_safe();
    goto LABEL_5;
  }
  id v101 = 0;
  v5 = [(CBDevice *)remoteDevice identifier];
  appID = v5;
  NSAppendPrintF_safe();
  objc_storeStrong((id *)&v109, 0);
LABEL_8:

  v9 = self->_activatedAdvertiser;
  v10 = v9;
  if (v9)
  {
    id v11 = (id *)(v105 + 5);
    id v99 = (id)v105[5];
    appID = (NSString *)v9;
    NSAppendPrintF_safe();
    objc_storeStrong(v11, v99);
    int v12 = 1;
  }
  else
  {
    int v12 = 0;
  }

  v13 = self->_activatedConnection;
  v14 = v13;
  if (v13)
  {
    uint64_t v15 = (id *)(v105 + 5);
    id v98 = (id)v105[5];
    appID = (NSString *)v13;
    NSAppendPrintF_safe();
    objc_storeStrong(v15, v98);
    ++v12;
  }

  v16 = self->_activatedController;
  id v17 = v16;
  if (v16)
  {
    v18 = (id *)(v105 + 5);
    id v97 = (id)v105[5];
    appID = (NSString *)v16;
    NSAppendPrintF_safe();
    objc_storeStrong(v18, v97);
    ++v12;
  }

  uint64_t v19 = self->_activatedDiscovery;
  v20 = v19;
  if (v19)
  {
    uint64_t v21 = (id *)(v105 + 5);
    id v96 = (id)v105[5];
    appID = (NSString *)v19;
    NSAppendPrintF_safe();
    objc_storeStrong(v21, v96);
    ++v12;
  }

  v22 = self->_activatedDiscoveryWHB;
  long long v23 = v22;
  if (v22)
  {
    long long v24 = (id *)(v105 + 5);
    id v95 = (id)v105[5];
    appID = (NSString *)v22;
    NSAppendPrintF_safe();
    objc_storeStrong(v24, v95);
    int v12 = 1;
  }

  unsigned int v25 = v3;
  v26 = self;
  v27 = self->_activatedSpatialInteractionSession;
  if (v25 > 0x14)
  {
    if (v27)
    {
      v28 = (id *)(v105 + 5);
      id v94 = (id)v105[5];
      v29 = v27;
      appID = (NSString *)v27;
      NSAppendPrintF_safe();
      objc_storeStrong(v28, v94);
      v27 = v29;
    }

    v30 = self;
    id v31 = [(NSMutableArray *)self->_spatialPeers count];
    if (v31)
    {
      v32 = (id *)(v105 + 5);
      id v93 = (id)v105[5];
      id v63 = v31;
      NSAppendPrintF_safe();
      objc_storeStrong(v32, v93);
      v30 = self;
    }
    unint64_t v33 = (unint64_t)[(NSMutableDictionary *)v30->_spatialDeviceMapMatched count];
    if (v33 | (unint64_t)[(NSMutableDictionary *)v30->_spatialDeviceMapUnmatched count])
    {
      v34 = v105;
      id v92 = (id)v105[5];
      NSAppendPrintF_safe();
      id v35 = v92;
      v72 = (void *)v34[5];
      v34[5] = (uint64_t)v35;
    }
    goto LABEL_72;
  }
  v73 = v27;
  v69 = (CBSpatialInteractionSession *)[(NSMutableArray *)self->_spatialPeers count];
  *((void *)&v70 + 1) = [(NSMutableDictionary *)self->_spatialDeviceMapMatched count];
  *(void *)&long long v70 = [(NSMutableDictionary *)self->_spatialDeviceMapUnmatched count];
  if (v73) {
    BOOL v36 = v12 == 0;
  }
  else {
    BOOL v36 = 1;
  }
  int v37 = !v36;
  int v68 = v37;
  if (v36)
  {
    if (!v73) {
      goto LABEL_37;
    }
    v38 = (void **)(v105 + 5);
    v90 = (void *)v105[5];
    v64 = v73;
    NSAppendPrintF_safe();
    v39 = v90;
  }
  else
  {
    v38 = (void **)(v105 + 5);
    v91 = (void *)v105[5];
    v64 = v73;
    NSAppendPrintF_safe();
    v39 = v91;
  }
  id v40 = v39;
  v41 = *v38;
  *v38 = v40;

  v26 = self;
LABEL_37:
  BOOL v71 = v69 != 0;
  if (v69)
  {
    v42 = (id *)(v105 + 5);
    id v89 = (id)v105[5];
    v64 = v69;
    NSAppendPrintF_safe();
    objc_storeStrong(v42, v89);
    if (v70 == 0)
    {
LABEL_42:
      v44 = (id *)(v105 + 5);
      id v87 = (id)v105[5];
      NSAppendPrintF_safe();
      objc_storeStrong(v44, v87);
      long long v85 = 0u;
      long long v86 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      v45 = self->_spatialPeers;
      id v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v83, v110, 16, v64);
      if (v46)
      {
        uint64_t v47 = *(void *)v84;
        do
        {
          for (i = 0; i != v46; i = (char *)i + 1)
          {
            if (*(void *)v84 != v47) {
              objc_enumerationMutation(v45);
            }
            v49 = *(void **)(*((void *)&v83 + 1) + 8 * i);
            v50 = (id *)(v105 + 5);
            id v82 = (id)v105[5];
            [v49 tokenData:v64 v65 v66 v67];
            v51 = (CBSpatialInteractionSession *)objc_claimAutoreleasedReturnValue();
            v52 = [v49 identifierData];
            v66 = [v49 irkData];
            id v67 = [v49 peerID];
            v64 = v51;
            v65 = v52;
            NSAppendPrintF_safe();
            objc_storeStrong(v50, v82);
          }
          id v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v83, v110, 16, v51, v52, v66, v67);
        }
        while (v46);

        v26 = self;
        if (!*((void *)&v70 + 1))
        {
LABEL_57:
          if (!(void)v70) {
            goto LABEL_64;
          }
          if (v71) {
            goto LABEL_60;
          }
          goto LABEL_59;
        }
      }
      else
      {

        v26 = self;
        if (!*((void *)&v70 + 1)) {
          goto LABEL_56;
        }
      }
LABEL_55:
      spatialDeviceMapMatched = v26->_spatialDeviceMapMatched;
      v80[0] = _NSConcreteStackBlock;
      v80[1] = 3221225472;
      v80[2] = sub_1000AA42C;
      v80[3] = &unk_100999290;
      v80[4] = &v104;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](spatialDeviceMapMatched, "enumerateKeysAndObjectsUsingBlock:", v80, v64);
LABEL_56:
      BOOL v71 = 1;
      goto LABEL_57;
    }
  }
  else if (v70 == 0)
  {
    goto LABEL_63;
  }
  v43 = (id *)(v105 + 5);
  id v88 = (id)v105[5];
  v64 = (CBSpatialInteractionSession *)*((void *)&v70 + 1);
  v65 = (void *)v70;
  NSAppendPrintF_safe();
  objc_storeStrong(v43, v88);
  v26 = self;
  if (v69) {
    goto LABEL_42;
  }
  if (*((void *)&v70 + 1))
  {
    v53 = (id *)(v105 + 5);
    id v81 = (id)v105[5];
    NSAppendPrintF_safe();
    objc_storeStrong(v53, v81);
    v26 = self;
    goto LABEL_55;
  }
  if ((void)v70)
  {
LABEL_59:
    v55 = (id *)(v105 + 5);
    id v79 = (id)v105[5];
    NSAppendPrintF_safe();
    objc_storeStrong(v55, v79);
    v26 = self;
LABEL_60:
    spatialDeviceMapUnmatched = v26->_spatialDeviceMapUnmatched;
    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472;
    v78[2] = sub_1000AA47C;
    v78[3] = &unk_100999290;
    v78[4] = &v104;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](spatialDeviceMapUnmatched, "enumerateKeysAndObjectsUsingBlock:", v78, v64);
    BOOL v71 = 1;
    goto LABEL_64;
  }
LABEL_63:
  BOOL v71 = 0;
LABEL_64:
  if (v68 && [(NSMutableDictionary *)v26->_deviceMap count])
  {
    if (!v71)
    {
      v57 = (id *)(v105 + 5);
      id v77 = (id)v105[5];
      NSAppendPrintF_safe();
      objc_storeStrong(v57, v77);
      v26 = self;
    }
    deviceMap = v26->_deviceMap;
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_1000AA4CC;
    v76[3] = &unk_100999290;
    v76[4] = &v104;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](deviceMap, "enumerateKeysAndObjectsUsingBlock:", v76, v64);
  }
  else if (!v71)
  {
    v59 = (id *)(v105 + 5);
    id v75 = (id)v105[5];
    NSAppendPrintF_safe();
    objc_storeStrong(v59, v75);
  }

LABEL_72:
  id v60 = (id)v105[5];
  _Block_object_dispose(&v104, 8);

  return v60;
}

- (void)aopMessageReceived:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v4 = [(CBSpatialInteractionSession *)self->_activatedSpatialInteractionSession aopDataHandler];
    v5 = (void *)v4;
    if (v4) {
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
    }
  }
}

+ (unint64_t)indexForCBApprovedAppID:(id)a3
{
  unsigned __int8 v3 = CBGenerateObfuscatedSHA256HashedString();
  for (unint64_t i = 0; i != 172; ++i)
  {
    if ([v3 isEqualToString:off_100998D28[i]]) {
      break;
    }
  }

  return i;
}

- (int64_t)_powerStateForClient
{
  unsigned __int8 v3 = [(CBDaemonServer *)self->_daemon stackController];
  id v4 = [v3 powerState];

  if (v4 == (id)10)
  {
    if (self->_supportsRestrictedMode)
    {
      return 10;
    }
    else if (self->_activatedDiscovery)
    {
      return 5;
    }
    else if (self->_activatedSpatialInteractionSession)
    {
      return 5;
    }
    else
    {
      return 10;
    }
  }
  return (int64_t)v4;
}

- (void)_remoteInvalidate
{
  unsigned __int8 v3 = self->_remoteClient;
  if (!v3) {
    goto LABEL_8;
  }
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  [v4 setObject:self->_remoteClientID forKeyedSubscript:@"cid"];
  [v4 setObject:@"Invl" forKeyedSubscript:@"mTyp"];
  BOOL remoteAccepted = self->_remoteAccepted;
  uint64_t v6 = [(NSNumber *)self->_remoteClientID unsignedIntValue];
  if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v13 = v6;
    LogPrintF_safe();
  }
  uint64_t v7 = [(CBDevice *)self->_remoteDevice identifier];
  if (v7)
  {
    v8 = (void *)v7;
    uint64_t v17 = RPOptionTimeoutSeconds;
    v18 = &off_1009E0C38;
    v9 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000AA8E4;
    v14[3] = &unk_100997CB8;
    int v15 = v6;
    BOOL v16 = remoteAccepted;
    v14[4] = v3;
    [(RPCompanionLinkClient *)v3 sendEventID:@"com.apple.bluetooth.event" event:v4 destinationID:v8 options:v9 completion:v14];

LABEL_8:
    [(CBDaemonServer *)self->_daemon remoteDeregisterConnection:self];
    self->_BOOL remoteAccepted = 0;
    remoteClient = self->_remoteClient;
    self->_remoteClient = 0;

    remoteClientID = self->_remoteClientID;
    self->_remoteClientID = 0;

    remoteDevice = self->_remoteDevice;
    self->_remoteDevice = 0;

    goto LABEL_9;
  }
  if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }

LABEL_9:
}

- (void)reportDeviceFound:(id)a3
{
  id v14 = a3;
  activatedDiscovery = self->_activatedDiscovery;
  if (activatedDiscovery)
  {
    v5 = activatedDiscovery;
  }
  else
  {
    v5 = self->_activatedDiscoveryWHB;
    if (!v5) {
      goto LABEL_23;
    }
  }
  uint64_t v6 = [v14 identifier];
  if (v6)
  {
    id v7 = [(NSMutableDictionary *)self->_deviceMap objectForKeyedSubscript:v6];
    if ([v14 discoveryTypesContainCBDiscovery:v5])
    {
      if (v7)
      {
        if (v7 != v14) {
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceMap, "setObject:forKeyedSubscript:");
        }
        if (([(CBDiscovery *)v5 discoveryFlags] & 0x100000) == 0
          && ![v14 changedTypesContainCBDiscovery:v5])
        {
          goto LABEL_21;
        }
      }
      else
      {
        deviceMap = self->_deviceMap;
        id v10 = v14;
        if (!deviceMap)
        {
          id v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          int v12 = self->_deviceMap;
          self->_deviceMap = v11;

          id v10 = v14;
          deviceMap = self->_deviceMap;
        }
        [(NSMutableDictionary *)deviceMap setObject:v10 forKeyedSubscript:v6];
      }
      uint64_t v8 = [(CBDiscovery *)v5 deviceFoundHandler];
    }
    else
    {
      if (!v7)
      {
LABEL_21:

        goto LABEL_22;
      }
      [(NSMutableDictionary *)self->_deviceMap setObject:0 forKeyedSubscript:v6];
      uint64_t v8 = [(CBDiscovery *)v5 deviceLostHandler];
    }
    uint64_t v13 = (void *)v8;
    if (v8) {
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v14);
    }

    goto LABEL_21;
  }
LABEL_22:

LABEL_23:
}

- (void)reportDeviceLost:(id)a3
{
  id v10 = a3;
  id v4 = [v10 identifier];
  if (v4)
  {
    v5 = [(NSMutableDictionary *)self->_deviceMap objectForKeyedSubscript:v4];

    if (v5)
    {
      activatedDiscovery = self->_activatedDiscovery;
      if (activatedDiscovery)
      {
        id v7 = activatedDiscovery;
      }
      else
      {
        id v7 = self->_activatedDiscoveryWHB;
        if (!v7) {
          goto LABEL_9;
        }
      }
      [(NSMutableDictionary *)self->_deviceMap setObject:0 forKeyedSubscript:v4];
      uint64_t v8 = [(CBDiscovery *)v7 deviceLostHandler];
      v9 = (void *)v8;
      if (v8) {
        (*(void (**)(uint64_t, id))(v8 + 16))(v8, v10);
      }
    }
  }
LABEL_9:
}

- (void)reportDevicesBuffered:(id)a3
{
  id v4 = a3;
  v5 = self->_activatedDiscovery;
  if (v5)
  {
    id v6 = objc_alloc_init((Class)NSMutableArray);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          int v12 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v11);
          if (objc_msgSend(v12, "discoveryTypesContainCBDiscovery:", v5, (void)v16)) {
            [v6 addObject:v12];
          }
          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    if ([v6 count])
    {
      uint64_t v14 = [(CBDiscovery *)v5 devicesBufferedHandler];
      int v15 = (void *)v14;
      if (v14) {
        (*(void (**)(uint64_t, id))(v14 + 16))(v14, v6);
      }
    }
  }
}

- (void)_xpcReceivedMessage:(id)a3 remoteDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v33 = 0;
  unsigned __int8 v8 = [(CBDaemonXPCConnection *)self _entitledAndReturnError:&v33];
  id v9 = v33;
  if ((v8 & 1) == 0)
  {
    [(CBDaemonXPCConnection *)self _xpcSendReplyError:v9 request:v6];
    goto LABEL_41;
  }
  if (!self->_remoteAccepted)
  {
    uint64_t v10 = self->_remoteClient;
    if (v10)
    {
      id v11 = v10;
    }
    else
    {
      id v11 = objc_alloc_init((Class)RPCompanionLinkClient);
      objc_storeStrong((id *)&self->_remoteClient, v11);
      [v11 setDispatchQueue:self->_dispatchQueue];
      [v11 setServiceType:@"com.apple.bluetooth.remote"];
      id v32 = v9;
      uint64_t v34 = 0;
      if (CUXPCDecodeUInt64RangedEx() == 6) {
        uint64_t v12 = v34;
      }
      else {
        uint64_t v12 = 0;
      }
      id v13 = v32;

      if (v13)
      {
        [(CBDaemonXPCConnection *)self _xpcSendReplyError:v13 request:v6];
        id v9 = v13;
        goto LABEL_40;
      }
      if (!v12)
      {
        long long v19 = CBErrorF();
        [(CBDaemonXPCConnection *)self _xpcSendReplyError:v19 request:v6];

        id v9 = 0;
        goto LABEL_40;
      }
      uint64_t v14 = +[NSNumber numberWithUnsignedInt:v12];
      objc_storeStrong((id *)&self->_remoteClientID, v14);
      id v31 = 0;
      id v15 = [objc_alloc((Class)CBDevice) initWithXPCObject:v7 error:&v31];
      id v9 = v31;
      if (!v15)
      {
        [(CBDaemonXPCConnection *)self _xpcSendReplyError:v9 request:v6];
        goto LABEL_39;
      }
      long long v16 = [v15 identifier];
      if (!v16)
      {
        v20 = CBErrorF();
        [(CBDaemonXPCConnection *)self _xpcSendReplyError:v20 request:v6];

        goto LABEL_37;
      }
      objc_storeStrong((id *)&self->_remoteDevice, v15);
      [(CBDaemonServer *)self->_daemon remoteRegisterConnection:self clientID:v14];
      id v17 = objc_alloc_init((Class)RPCompanionLinkDevice);
      [v17 setIdentifier:v16];
      [v11 setDestinationDevice:v17];
      if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_1000AB480;
      v27[3] = &unk_1009992B8;
      id v11 = v11;
      id v28 = v11;
      v29 = self;
      v30 = v16;
      [v11 activateWithCompletion:v27];
    }
    uint64_t v14 = (void *)CUXPCCreateCFObjectFromXPCObject();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      CBErrorF();
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      [(CBDaemonXPCConnection *)self _xpcSendReplyError:v15 request:v6];
      goto LABEL_38;
    }
    id v15 = [v14 mutableCopy];
    [v15 setObject:0 forKeyedSubscript:@"rmtD"];
    uint64_t v35 = RPOptionTimeoutSeconds;
    BOOL v36 = &off_1009E0C38;
    long long v16 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    if (CUXPCDictionaryExpectsReply())
    {
      if (dword_1009F85F0 <= 20 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v21 = CUPrintNSObjectOneLine();
        LogPrintF_safe();
      }
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1000AB5AC;
      v25[3] = &unk_100999308;
      v25[4] = self;
      id v26 = v6;
      [v11 sendRequestID:@"com.apple.bluetooth.request" request:v15 options:v16 responseHandler:v25];
    }
    else
    {
      long long v18 = [(CBDevice *)self->_remoteDevice identifier];
      if (v18)
      {
        if (dword_1009F85F0 <= 20 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
        {
          v22 = CUPrintNSObjectOneLine();
          LogPrintF_safe();
        }
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_1000AB7D0;
        v23[3] = &unk_100997B50;
        id v24 = v15;
        [v11 sendEventID:@"com.apple.bluetooth.event" event:v24 destinationID:v18 options:v16 completion:v23];
      }
      else if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
LABEL_37:

LABEL_38:
LABEL_39:

    goto LABEL_40;
  }
  if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  if (CUXPCDictionaryExpectsReply())
  {
    CBErrorF();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    [(CBDaemonXPCConnection *)self _xpcSendReplyError:v11 request:v6];
LABEL_40:
  }
LABEL_41:
}

- (void)xpcReceivedEvent:(id)a3
{
  xpc_object_t xdict = a3;
  if (!self->_remoteDevice || (id v4 = xpc_dictionary_get_string(xdict, "mTyp")) == 0)
  {
LABEL_5:
    id v6 = self->_activatedConnection;
    if (v6 && (string = xpc_dictionary_get_string(xdict, "mTyp")) != 0 && !strcmp(string, "CnxF"))
    {
      [(CBConnection *)v6 xpcReceivedForwardedEvent:xdict];
    }
    else
    {
      unsigned __int8 v8 = self->_xpcCnx;
      id v9 = v8;
      if (v8)
      {
        xpc_connection_send_message(v8, xdict);
      }
      else if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
    goto LABEL_21;
  }
  v5 = v4;
  if (strcmp(v4, "Invl"))
  {
    if (!strcmp(v5, "DscU"))
    {
      [(CBDaemonXPCConnection *)self _xpcCBDiscoveryUpdate:xdict];
      goto LABEL_21;
    }
    goto LABEL_5;
  }
  if (dword_1009F85F0 <= 20 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v10 = CUPrintPID();
    [(CBDevice *)self->_remoteDevice identifier];
    v12 = id v11 = v10;
    LogPrintF_safe();
  }
  [(CBDaemonXPCConnection *)self invalidate];
LABEL_21:
}

- (void)_xpcSendEvent:(id)a3
{
  id v4 = a3;
  v5 = self->_xpcCnx;
  id v6 = v5;
  if (v5)
  {
    xpc_connection_send_message(v5, v4);
  }
  else
  {
    id v7 = self->_remoteClient;
    if (v7)
    {
      unsigned __int8 v8 = (void *)CUXPCCreateCFObjectFromXPCObject();
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = [v8 mutableCopy];
        [v9 setObject:self->_remoteClientID forKeyedSubscript:@"cid"];
        [v9 setObject:0 forKeyedSubscript:@"rmtD"];
        uint64_t v10 = [(CBDevice *)self->_remoteDevice identifier];
        if (v10)
        {
          if (dword_1009F85F0 <= 20 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v12 = CUPrintNSObjectOneLine();
            LogPrintF_safe();
          }
          uint64_t v15 = RPOptionTimeoutSeconds;
          long long v16 = &off_1009E0C38;
          id v11 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1, v12);
          v13[0] = _NSConcreteStackBlock;
          v13[1] = 3221225472;
          v13[2] = sub_1000ABDAC;
          v13[3] = &unk_100997B50;
          id v14 = v9;
          [(RPCompanionLinkClient *)v7 sendEventID:@"com.apple.bluetooth.event" event:v14 destinationID:v10 options:v11 completion:v13];
        }
        else if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
      }
      else if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
    else if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
}

- (void)_xpcSendReplyError:(id)a3 request:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = CUXPCDictionaryCreateReply();
  if (v7)
  {
    CUXPCEncodeNSError();
    xpcCnx = self->_xpcCnx;
    if (xpcCnx)
    {
      xpc_connection_send_message(xpcCnx, v7);
    }
    else
    {
      CUXPCObjectGetResponseHandler();
      id v9 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v10 = CUPrintNSError();
          LogPrintF_safe();
        }
        ((void (**)(void, void, void, id))v9)[2](v9, 0, 0, v11);
      }
      else if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
  }
  else if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (BOOL)_entitledCBAdvertiserAndReturnError:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 safetyAlertsSignature];
  if (v7)
  {
  }
  else
  {
    unsigned __int8 v8 = [v6 safetyAlertsAlertData];

    if (!v8)
    {
LABEL_7:
      BOOL v11 = 1;
      goto LABEL_15;
    }
  }
  xpc_connection_get_audit_token();
  id v9 = (void *)xpc_copy_entitlement_for_token();
  uint64_t v10 = v9;
  if (v9 && xpc_dictionary_get_BOOL(v9, "com.apple.bluetooth.safetyalerts"))
  {

    goto LABEL_7;
  }
  self->_entitled = 0;
  uint64_t v12 = CBErrorF();
  if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
  {
    id v13 = CUPrintPID();
    uint64_t v15 = CUPrintNSError();
    LogPrintF_safe();
  }
  if (a4) {
    *a4 = v12;
  }

  BOOL v11 = 0;
LABEL_15:

  return v11;
}

- (void)_xpcCBAdvertiserActivate:(id)a3
{
  id v4 = a3;
  v44[0] = 0;
  unsigned __int8 v5 = [(CBDaemonXPCConnection *)self _entitledAndReturnError:v44];
  id v6 = v44[0];
  if (v5)
  {
    id v43 = v6;
    id v7 = [objc_alloc((Class)CBAdvertiser) initWithXPCObject:v4 error:&v43];
    id v8 = v43;

    if (v7)
    {
      id v42 = v8;
      unsigned __int8 v9 = [(CBDaemonXPCConnection *)self _entitledCBAdvertiserAndReturnError:v7 error:&v42];
      id v6 = v42;

      if (v9)
      {
        objc_storeStrong((id *)&self->_activatedAdvertiser, v7);
        if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
        {
          CUPrintPID();
          v37 = BOOL v36 = v7;
          LogPrintF_safe();
        }
        -[CBDaemonServer scheduleAdvertiserUpdateImmediate:](self->_daemon, "scheduleAdvertiserUpdateImmediate:", 1, v36, v37);
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472;
        v41[2] = sub_1000AC6C0;
        v41[3] = &unk_100997208;
        v41[4] = v7;
        v41[5] = self;
        [v7 setBluetoothStateChangedHandler:v41];
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = sub_1000AC718;
        v40[3] = &unk_100997208;
        v40[4] = v7;
        v40[5] = self;
        [v7 setAdvertisingAddressChangedHandler:v40];
        uint64_t v10 = CUXPCDictionaryCreateReply();
        if (v10)
        {
          id v38 = v6;
          id v39 = v4;
          BOOL v11 = [(CBDaemonServer *)self->_daemon addressMonitor];
          uint64_t v12 = [v11 connectableAddressData];

          [v7 setAdvertisingAddressDataConnectable:v12];
          if (v12)
          {
            id v13 = v12;
            id v14 = v10;
            id v15 = v13;
            long long v16 = (const char *)[v15 bytes];
            if (v16) {
              id v17 = v16;
            }
            else {
              id v17 = "";
            }
            id v18 = [v15 length];

            xpc_dictionary_set_data(v14, "aaCN", v17, (size_t)v18);
          }
          long long v19 = [(CBDaemonServer *)self->_daemon addressMonitor];
          v20 = [v19 nonConnectableAddressData];

          [v7 setAdvertisingAddressDataNonConnectable:v20];
          if (v20)
          {
            id v21 = v20;
            id v22 = v10;
            id v23 = v21;
            id v24 = (const char *)[v23 bytes];
            if (v24) {
              unsigned int v25 = v24;
            }
            else {
              unsigned int v25 = "";
            }
            id v26 = [v23 length];

            xpc_dictionary_set_data(v22, "aaNC", v25, (size_t)v26);
          }
          v27 = [(CBDaemonServer *)self->_daemon addressMonitor];
          id v28 = [v27 nonConnectableSecondaryAddressData];

          [v7 setAdvertisingAddressDataNonConnectableSecondary:v28];
          if (v28)
          {
            id v29 = v28;
            id v30 = v10;
            id v31 = v29;
            id v32 = (const char *)[v31 bytes];
            if (v32) {
              id v33 = v32;
            }
            else {
              id v33 = "";
            }
            id v34 = [v31 length];

            xpc_dictionary_set_data(v30, "aaNC2", v33, (size_t)v34);
          }
          int64_t v35 = [(CBDaemonXPCConnection *)self _powerStateForClient];
          if (v35) {
            xpc_dictionary_set_int64(v10, "pwrS", v35);
          }
          [(CBDaemonXPCConnection *)self _xpcSendReply:v10];

          id v6 = v38;
          id v4 = v39;
        }
        else if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
      }
      else
      {
        [(CBDaemonXPCConnection *)self _xpcSendReplyError:v6 request:v4];
      }
    }
    else
    {
      if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
      {
        BOOL v36 = CUPrintNSError();
        LogPrintF_safe();
      }
      -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v8, v4, v36);
      id v6 = v8;
    }
  }
  else
  {
    [(CBDaemonXPCConnection *)self _xpcSendReplyError:v6 request:v4];
  }
}

- (void)_xpcCBAdvertiserUpdate:(id)a3
{
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = sub_10004CF3C;
  id v30 = sub_10004CD70;
  id v31 = 0;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000ACCD8;
  v23[3] = &unk_100997E48;
  unsigned int v25 = &v26;
  void v23[4] = self;
  id v4 = a3;
  id v24 = v4;
  unsigned __int8 v5 = objc_retainBlock(v23);
  id v6 = (id *)(v27 + 5);
  id obj = (id)v27[5];
  unsigned __int8 v7 = [(CBDaemonXPCConnection *)self _entitledAndReturnError:&obj];
  objc_storeStrong(v6, obj);
  if (v7)
  {
    id v8 = objc_alloc((Class)CBAdvertiser);
    unsigned __int8 v9 = (id *)(v27 + 5);
    id v21 = (id)v27[5];
    id v10 = [v8 initWithXPCObject:v4 error:&v21];
    objc_storeStrong(v9, v21);
    if (v10)
    {
      BOOL v11 = (id *)(v27 + 5);
      id v20 = (id)v27[5];
      unsigned int v12 = [(CBDaemonXPCConnection *)self _entitledCBAdvertiserAndReturnError:v10 error:&v20];
      objc_storeStrong(v11, v20);
      if (!v12)
      {
LABEL_13:

        goto LABEL_14;
      }
      id v13 = self->_activatedAdvertiser;
      id v14 = v13;
      if (v13)
      {
        unsigned int v15 = [(CBAdvertiser *)v13 updateWithCBAdvertiser:v10];
        if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
        {
          long long v19 = CUPrintPID();
          LogPrintF_safe();
        }
        if (!v15) {
          goto LABEL_12;
        }
        [(CBDaemonServer *)self->_daemon scheduleAdvertiserUpdateImmediate:0];
        long long v16 = +[CBMetricsDaemon sharedCBMetricsDaemon];
        [v16 reportxpcCBAdvertiserUpdate:v10];
      }
      else
      {
        uint64_t v18 = CBErrorF();
        long long v16 = (void *)v27[5];
        v27[5] = v18;
      }
    }
    else
    {
      uint64_t v17 = CBErrorF();
      id v14 = (CBAdvertiser *)v27[5];
      v27[5] = v17;
    }
LABEL_12:

    goto LABEL_13;
  }
LABEL_14:
  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v26, 8);
}

- (void)_xpcCBConnectionActivate:(id)a3
{
  uint64_t v47 = 0;
  v48 = (id *)&v47;
  uint64_t v49 = 0x3032000000;
  v50 = sub_10004CF3C;
  v51 = sub_10004CD70;
  id v52 = 0;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  id v44[2] = sub_1000AD374;
  v44[3] = &unk_100997E48;
  id v46 = &v47;
  v44[4] = self;
  id v4 = a3;
  id v45 = v4;
  unsigned __int8 v5 = objc_retainBlock(v44);
  id v6 = v48;
  id v43 = v48[5];
  unsigned __int8 v7 = [(CBDaemonXPCConnection *)self _entitledAndReturnError:&v43];
  objc_storeStrong(v6 + 5, v43);
  if (v7)
  {
    if (self->_activatedConnection)
    {
      uint64_t v27 = CBErrorF();
      id v10 = v48[5];
      v48[5] = (id)v27;
      goto LABEL_25;
    }
    id v8 = objc_alloc((Class)CBConnection);
    unsigned __int8 v9 = v48;
    id v42 = v48[5];
    id v10 = [v8 initWithXPCObject:v4 error:&v42];
    objc_storeStrong(v9 + 5, v42);
    if (!v10)
    {
LABEL_25:

      goto LABEL_26;
    }
    [v10 setDispatchQueue:self->_dispatchQueue];
    BOOL v11 = [v10 peerDevice];
    if (!v11)
    {
      uint64_t v28 = CBErrorF();
      id v29 = v48[5];
      v48[5] = (id)v28;

      goto LABEL_24;
    }
    if (([v10 internalFlags] & 0x100) != 0)
    {
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_1000AD450;
      v41[3] = &unk_100999330;
      v41[4] = v10;
      v41[5] = self;
      [v10 setPairingCompletedHandler:v41];
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_1000AD470;
      v40[3] = &unk_100999358;
      v40[4] = v10;
      v40[5] = self;
      [v10 setPairingPromptHandler:v40];
      unsigned int v12 = [(CBDaemonServer *)self->_daemon stackController];
      id v13 = v48;
      id obj = v48[5];
      unsigned __int8 v14 = [v12 addPairingClient:v10 error:&obj];
      objc_storeStrong(v13 + 5, obj);

      if ((v14 & 1) == 0)
      {
LABEL_24:

        goto LABEL_25;
      }
      self->_connectionAddedPairingClient = 1;
    }
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_1000AD48C;
    v38[3] = &unk_100997BF0;
    v38[4] = v10;
    v38[5] = self;
    [v10 setXpcSendEventHandler:v38];
    objc_storeStrong((id *)&self->_activatedConnection, v10);
    unsigned int v15 = self->_appID;
    if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
    {
      id v31 = CUPrintPID();
      id v32 = v15;
      id v30 = v10;
      LogPrintF_safe();
    }
    long long v16 = [v10 clientBundleID:v30, v31, v32];
    id v17 = [v16 length];

    if (!v17) {
      [v10 setClientBundleID:v15];
    }
    id v18 = [v10 serviceFlags];
    if (v18)
    {
      id v19 = [v10 connectionFlags];
      daemon = self->_daemon;
      if ((v19 & 2) == 0)
      {
        id v21 = [(CBDaemonServer *)daemon stackController];
        id v22 = v48;
        id v35 = v48[5];
        unsigned __int8 v23 = [v21 connectDevice:v11 connectionFlags:v19 serviceFlags:v18 error:&v35];
        objc_storeStrong(v22 + 5, v35);

        if (v23)
        {
          id v24 = CUXPCDictionaryCreateReply();
          [(CBDaemonXPCConnection *)self _xpcSendReply:v24];
        }
        goto LABEL_23;
      }
      uint64_t v26 = [(CBDaemonServer *)daemon stackController];
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_1000AD4A8;
      v36[3] = &unk_1009992B8;
      v36[4] = v10;
      v36[5] = self;
      id v37 = v4;
      [v26 connectWithCBConnection:v10 completionHandler:v36];

      unsigned int v25 = v37;
    }
    else
    {
      if (self->_remoteClient) {
        [v10 setInternalFlags:[v10 internalFlags] | 0x20];
      }
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_1000AD5F8;
      v33[3] = &unk_1009992B8;
      v33[4] = v10;
      v33[5] = self;
      id v34 = v4;
      [v10 activateWithCompletion:v33];
      unsigned int v25 = v34;
    }

LABEL_23:
    goto LABEL_24;
  }
LABEL_26:
  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v47, 8);
}

- (void)_xpcCBConnectionDisconnect:(id)a3
{
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = sub_10004CF3C;
  id v30 = sub_10004CD70;
  id v31 = 0;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000ADAA4;
  v23[3] = &unk_100997E48;
  unsigned int v25 = &v26;
  void v23[4] = self;
  id v4 = a3;
  id v24 = v4;
  unsigned __int8 v5 = objc_retainBlock(v23);
  id v6 = (id *)(v27 + 5);
  id obj = (id)v27[5];
  unsigned __int8 v7 = [(CBDaemonXPCConnection *)self _entitledAndReturnError:&obj];
  objc_storeStrong(v6, obj);
  if (v7)
  {
    id v8 = objc_alloc((Class)CBConnection);
    unsigned __int8 v9 = (id *)(v27 + 5);
    id v21 = (id)v27[5];
    id v10 = [v8 initWithXPCObject:v4 error:&v21];
    objc_storeStrong(v9, v21);
    if (!v10)
    {
LABEL_14:

      goto LABEL_15;
    }
    BOOL v11 = [v10 peerDevice];
    if (v11 && (id v12 = [v10 serviceFlags], v12))
    {
      if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
      {
        CUPrintFlags32();
        id v19 = v18 = v11;
        LogPrintF_safe();
      }
      id v13 = [(CBDaemonServer *)self->_daemon stackController];
      unsigned __int8 v14 = (id *)(v27 + 5);
      id v20 = (id)v27[5];
      unsigned __int8 v15 = [v13 disconnectDevice:v11 serviceFlags:v12 error:&v20];
      objc_storeStrong(v14, v20);

      if ((v15 & 1) == 0) {
        goto LABEL_13;
      }
      long long v16 = CUXPCDictionaryCreateReply();
      if (v16)
      {
        [(CBDaemonXPCConnection *)self _xpcSendReply:v16];
      }
      else if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
    else
    {
      uint64_t v17 = CBErrorF();
      long long v16 = (void *)v27[5];
      v27[5] = v17;
    }

LABEL_13:
    goto LABEL_14;
  }
LABEL_15:
  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v26, 8);
}

- (void)_xpcCBConnection:(id)a3 pairingCompletedWithDevice:(id)a4 error:(id)a5
{
  id v9 = a5;
  id v7 = a4;
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v8, "mTyp", "PrCm");
  CUXPCEncodeObject();

  if (v9) {
    CUXPCEncodeNSError();
  }
  [(CBDaemonXPCConnection *)self _xpcSendEvent:v8];
}

- (void)_xpcCBConnection:(id)a3 pairingPromptWithPairingInfo:(id)a4
{
  id v5 = a4;
  id v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "mTyp", "PrPm");
  CUXPCEncodeObject();

  [(CBDaemonXPCConnection *)self _xpcSendEvent:v6];
}

- (void)_xpcCBConnectionPairingContinue:(id)a3
{
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  unsigned __int8 v23 = sub_10004CF3C;
  id v24 = sub_10004CD70;
  id v25 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000AE05C;
  v17[3] = &unk_100997E48;
  id v19 = &v20;
  v17[4] = self;
  id v4 = a3;
  id v18 = v4;
  id v5 = objc_retainBlock(v17);
  id v6 = (id *)(v21 + 5);
  id obj = (id)v21[5];
  unsigned __int8 v7 = [(CBDaemonXPCConnection *)self _entitledAndReturnError:&obj];
  objc_storeStrong(v6, obj);
  if (v7)
  {
    xpc_object_t v8 = self->_activatedConnection;
    if (v8)
    {
      id v15 = 0;
      objc_opt_class();
      id v9 = (id *)(v21 + 5);
      id v14 = (id)v21[5];
      CUXPCDecodeObject();
      objc_storeStrong(v9, v14);
      if (!v21[5])
      {
        uint64_t v12 = CBErrorF();
        id v13 = (void *)v21[5];
        v21[5] = v12;
      }
    }
    else
    {
      uint64_t v10 = CBErrorF();
      BOOL v11 = (void *)v21[5];
      v21[5] = v10;
    }
  }
  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v20, 8);
}

- (void)_xpcCBControllerActivate:(id)a3
{
  id v4 = a3;
  id v26 = 0;
  unsigned __int8 v5 = [(CBDaemonXPCConnection *)self _entitledAndReturnError:&v26];
  id v6 = v26;
  if (v5)
  {
    id v7 = objc_alloc((Class)CBController);
    id v25 = v6;
    id v8 = [v7 initWithXPCObject:v4 error:&v25];
    id v9 = v25;

    if (v8)
    {
      [v8 setAppID:self->_appID];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1000AE5C4;
      v24[3] = &unk_100997208;
      v24[4] = v8;
      v24[5] = self;
      [v8 setBluetoothStateChangedHandler:v24];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1000AE61C;
      v23[3] = &unk_100997208;
      void v23[4] = v8;
      void v23[5] = self;
      [v8 setDiscoverableStateChangedHandler:v23];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1000AE694;
      v22[3] = &unk_100997208;
      v22[4] = v8;
      void v22[5] = self;
      [v8 setInquiryStateChangedHandler:v22];
      if (([v8 internalFlags] & 0x40) != 0)
      {
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_1000AE70C;
        v21[3] = &unk_100997C40;
        v21[4] = v8;
        v21[5] = self;
        [v8 setRelayMessageHandler:v21];
      }
      if (([v8 internalFlags] & 0x200) != 0)
      {
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_1000AE734;
        v20[3] = &unk_100997370;
        v20[4] = v8;
        v20[5] = self;
        [v8 setTipiChangedHandler:v20];
      }
      objc_storeStrong((id *)&self->_activatedController, v8);
      if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
      {
        CUPrintPID();
        v19 = id v17 = v8;
        LogPrintF_safe();
      }
      -[CBDaemonServer scheduleControlUpdateImmediate:](self->_daemon, "scheduleControlUpdateImmediate:", 0, v17, v19);
      uint64_t v10 = CUXPCDictionaryCreateReply();
      if (v10)
      {
        BOOL v11 = [(CBDaemonServer *)self->_daemon stackController];
        signed int v12 = [v11 discoverableState];
        if (v12) {
          xpc_dictionary_set_int64(v10, "dsSt", v12);
        }

        id v13 = [(CBDaemonServer *)self->_daemon stackController];
        signed int v14 = [v13 inquiryState];
        if (v14) {
          xpc_dictionary_set_int64(v10, "inqS", v14);
        }

        int64_t v15 = [(CBDaemonXPCConnection *)self _powerStateForClient];
        if (v15) {
          xpc_dictionary_set_int64(v10, "pwrS", v15);
        }
        if (([v8 internalFlags] & 0x2000) != 0)
        {
          long long v16 = [(CBDaemonServer *)self->_daemon getAudioAccessoryDeviceArray];
          if (v16) {
            xpc_dictionary_set_value(v10, "aaDD", v16);
          }
        }
        [(CBDaemonXPCConnection *)self _xpcSendReply:v10];
      }
      else if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
    else if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
    {
      id v18 = CUPrintNSError();
      LogPrintF_safe();

      -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v9, v4, v18);
    }
    else
    {
      -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v9, v4, v17);
    }
  }
  else
  {
    [(CBDaemonXPCConnection *)self _xpcSendReplyError:v6 request:v4];
    id v9 = v6;
  }
}

- (void)_xpcGetControllerInfo:(id)a3
{
  id v12 = 0;
  id v4 = a3;
  unsigned __int8 v5 = [(CBDaemonXPCConnection *)self _entitledAndReturnError:&v12];
  id v6 = v12;
  if (v5)
  {
    id v7 = CUXPCDictionaryCreateReply();

    if (v7)
    {
      id v8 = [(CBDaemonServer *)self->_daemon stackController];
      id v9 = [v8 controllerInfo];

      if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
      {
        BOOL v11 = CUDescriptionWithLevel();
        LogPrintF_safe();
      }
      xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
      [v9 encodeWithXPCObject:v10];
      xpc_dictionary_set_value(v7, "ctrI", v10);
      [(CBDaemonXPCConnection *)self _xpcSendReply:v7];
    }
    else if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  else
  {
    [(CBDaemonXPCConnection *)self _xpcSendReplyError:v6 request:v4];
    id v7 = v4;
  }
}

- (void)_xpcGetControllerSettings:(id)a3
{
  id v25 = 0;
  id v4 = a3;
  unsigned __int8 v5 = [(CBDaemonXPCConnection *)self _entitledAndReturnError:&v25];
  id v6 = v25;
  if (v5)
  {
    id v7 = CUXPCDictionaryCreateReply();

    if (v7)
    {
      id v24 = v6;
      id v8 = objc_alloc_init((Class)CBControllerSettings);
      id v9 = [(CBDaemonServer *)self->_daemon stackController];
      [v8 setDiscoverableState:[v9 discoverableState]];

      xpc_object_t v10 = (void *)CFPreferencesCopyValue(@"move3PPLEMSToLegacyMode", @"com.apple.bluetooth", kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
      objc_opt_class();
      char v11 = 1;
      if (objc_opt_isKindOfClass())
      {
        if ([v10 BOOLValue]) {
          char v11 = 1;
        }
        else {
          char v11 = 2;
        }
      }
      [v8 setHid3ppLELegacyMode:v11];
      id v12 = (void *)CFPreferencesCopyValue(@"btvcDefaultAdvRSSI", @"com.apple.bluetooth", kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
      objc_opt_class();
      unsigned __int8 v23 = v10;
      if (objc_opt_isKindOfClass()) {
        signed __int8 v13 = [v12 intValue];
      }
      else {
        signed __int8 v13 = -60;
      }
      signed int v14 = self;
      [v8 setBleAdvRSSI:v13];
      int64_t v15 = (void *)CFPreferencesCopyValue(@"BluetoothAutoSeekKeyboard", @"com.apple.Bluetooth", kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
      objc_opt_class();
      char v16 = 1;
      if (objc_opt_isKindOfClass())
      {
        if ([v15 BOOLValue]) {
          char v16 = 1;
        }
        else {
          char v16 = 2;
        }
      }
      [v8 setSetupAssistantIfNoKeyboard:v16];
      id v17 = (void *)CFPreferencesCopyValue(@"BluetoothAutoSeekPointingDevice", @"com.apple.Bluetooth", kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
      objc_opt_class();
      char v18 = 1;
      if (objc_opt_isKindOfClass())
      {
        if ([v17 BOOLValue]) {
          char v18 = 1;
        }
        else {
          char v18 = 2;
        }
      }
      [v8 setSetupAssistantIfNoPointingDevice:v18];
      id v19 = (void *)CFPreferencesCopyValue(@"SpatialSoundProfileAllowed", @"com.apple.bluetooth", kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
      objc_opt_class();
      char v20 = 1;
      if (objc_opt_isKindOfClass())
      {
        if ([v19 BOOLValue]) {
          char v20 = 1;
        }
        else {
          char v20 = 2;
        }
      }
      [v8 setSpatialSoundProfileAllowed:v20];
      if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v22 = CUDescriptionWithLevel();
        LogPrintF_safe();
      }
      xpc_object_t v21 = xpc_dictionary_create(0, 0, 0);
      [v8 encodeWithXPCObject:v21];
      xpc_dictionary_set_value(v7, "ctrS", v21);
      [(CBDaemonXPCConnection *)v14 _xpcSendReply:v7];

      id v6 = v24;
    }
    else if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  else
  {
    [(CBDaemonXPCConnection *)self _xpcSendReplyError:v6 request:v4];
    id v7 = v4;
  }
}

- (void)_xpcModifyControllerSettings:(id)a3
{
  uint64_t v17 = 0;
  char v18 = &v17;
  uint64_t v19 = 0x3032000000;
  char v20 = sub_10004CF3C;
  xpc_object_t v21 = sub_10004CD70;
  id v22 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000AF43C;
  v14[3] = &unk_100997E48;
  char v16 = &v17;
  v14[4] = self;
  id v4 = a3;
  id v15 = v4;
  unsigned __int8 v5 = objc_retainBlock(v14);
  id v6 = (id *)(v18 + 5);
  id obj = (id)v18[5];
  unsigned __int8 v7 = [(CBDaemonXPCConnection *)self _entitledAndReturnError:&obj];
  objc_storeStrong(v6, obj);
  if (v7)
  {
    id v12 = 0;
    objc_opt_class();
    id v8 = (id *)(v18 + 5);
    id v11 = (id)v18[5];
    CUXPCDecodeObject();
    objc_storeStrong(v8, v11);
    if (!v18[5])
    {
      uint64_t v9 = CBErrorF();
      xpc_object_t v10 = (void *)v18[5];
      v18[5] = v9;
    }
  }
  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v17, 8);
}

- (void)_xpcGetDevices:(id)a3
{
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_10004CF3C;
  id v25 = sub_10004CD70;
  id v26 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000AF848;
  v18[3] = &unk_100997E48;
  char v20 = &v21;
  v18[4] = self;
  id v4 = a3;
  id v19 = v4;
  unsigned __int8 v5 = objc_retainBlock(v18);
  id v6 = (id *)(v22 + 5);
  id obj = (id)v22[5];
  unsigned __int8 v7 = [(CBDaemonXPCConnection *)self _entitledAndReturnError:&obj];
  objc_storeStrong(v6, obj);
  id v8 = (id *)(v22 + 5);
  if (v7)
  {
    id v16 = (id)v22[5];
    uint64_t v27 = 0;
    if (CUXPCDecodeUInt64RangedEx() == 6) {
      uint64_t v9 = v27;
    }
    else {
      uint64_t v9 = 0;
    }
    objc_storeStrong(v8, v16);
    if (!v22[5])
    {
      xpc_object_t v10 = [(CBDaemonServer *)self->_daemon stackController];
      id v11 = (id *)(v22 + 5);
      id v15 = (id)v22[5];
      id v12 = [v10 getDevicesWithFlags:v9 error:&v15];
      objc_storeStrong(v11, v15);

      if (v12)
      {
        if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
        {
          signed int v14 = CUPrintFlags32();
          [v12 count];
          LogPrintF_safe();
        }
        signed __int8 v13 = CUXPCDictionaryCreateReply();
        if (v13)
        {
          CUXPCEncodeNSArrayOfObjects();
          [(CBDaemonXPCConnection *)self _xpcSendReply:v13];
        }
        else if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
      }
    }
  }
  else
  {
    [(CBDaemonXPCConnection *)self _xpcSendReplyError:v22[5] request:v4];
  }
  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v21, 8);
}

- (void)_xpcDeleteDevice:(id)a3
{
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = sub_10004CF3C;
  uint64_t v28 = sub_10004CD70;
  id v29 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000AFC3C;
  v21[3] = &unk_100997E48;
  uint64_t v23 = &v24;
  v21[4] = self;
  id v4 = a3;
  id v22 = v4;
  unsigned __int8 v5 = objc_retainBlock(v21);
  id v6 = (id *)(v25 + 5);
  id obj = (id)v25[5];
  unsigned __int8 v7 = [(CBDaemonXPCConnection *)self _entitledAndReturnError:&obj];
  objc_storeStrong(v6, obj);
  if (v7)
  {
    id v8 = xpc_dictionary_get_dictionary(v4, "devi");
    if (v8)
    {
      id v9 = objc_alloc((Class)CBDevice);
      xpc_object_t v10 = (id *)(v25 + 5);
      id v19 = (id)v25[5];
      id v11 = [v9 initWithXPCObject:v8 error:&v19];
      objc_storeStrong(v10, v19);
      if (v11)
      {
        if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
        {
          id v17 = v11;
          LogPrintF_safe();
        }
        id v12 = [(CBDaemonServer *)self->_daemon stackController];
        signed __int8 v13 = (id *)(v25 + 5);
        id v18 = (id)v25[5];
        unsigned __int8 v14 = [v12 deleteDevice:v11 error:&v18];
        objc_storeStrong(v13, v18);

        if (v14)
        {
          id v15 = CUXPCDictionaryCreateReply();
          if (v15)
          {
            [(CBDaemonXPCConnection *)self _xpcSendReply:v15];
          }
          else if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
        }
      }
    }
    else
    {
      uint64_t v16 = CBErrorF();
      id v11 = (id)v25[5];
      void v25[5] = v16;
    }
  }
  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v24, 8);
}

- (void)_xpcModifyDevice:(id)a3
{
  uint64_t v51 = 0;
  id v52 = (id *)&v51;
  uint64_t v53 = 0x3032000000;
  v54 = sub_10004CF3C;
  v55 = sub_10004CD70;
  id v56 = 0;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_1000B04BC;
  v48[3] = &unk_100997E48;
  v50 = &v51;
  v48[4] = self;
  id v4 = a3;
  id v49 = v4;
  unsigned __int8 v5 = objc_retainBlock(v48);
  id v6 = v52;
  id obj = v52[5];
  unsigned __int8 v7 = [(CBDaemonXPCConnection *)self _entitledAndReturnError:&obj];
  objc_storeStrong(v6 + 5, obj);
  if (v7)
  {
    id v8 = xpc_dictionary_get_dictionary(v4, "devi");
    if (!v8)
    {
      uint64_t v32 = CBErrorF();
      id v11 = v52[5];
      v52[5] = (id)v32;
      goto LABEL_28;
    }
    id v9 = objc_alloc((Class)CBDevice);
    xpc_object_t v10 = v52;
    id v46 = v52[5];
    id v11 = [v9 initWithXPCObject:v8 error:&v46];
    objc_storeStrong(v10 + 5, v46);
    if (!v11)
    {
LABEL_28:

      goto LABEL_29;
    }
    id v12 = v52;
    id v44 = v52[5];
    id v45 = 0;
    char v13 = CUXPCDecodeNSArrayOfNSString();
    objc_storeStrong(v12 + 5, v44);
    if ((v13 & 1) == 0)
    {
LABEL_27:

      goto LABEL_28;
    }
    id v43 = 0;
    objc_opt_class();
    unsigned __int8 v14 = v52;
    id v42 = v52[5];
    char v15 = CUXPCDecodeObject();
    objc_storeStrong(v14 + 5, v42);
    if ((v15 & 1) == 0) {
      goto LABEL_26;
    }
    uint64_t v16 = v52 + 5;
    id v41 = v52[5];
    id v57 = 0;
    int v17 = CUXPCDecodeSInt64RangedEx();
    objc_storeStrong(v16, v41);
    if (v17 == 5
      || (v18 = v52 + 5, id v40 = v52[5],
                         id v57 = 0,
                         int v19 = CUXPCDecodeUInt64RangedEx(),
                         objc_storeStrong(v18, v40),
                         v19 == 5))
    {
LABEL_26:

      goto LABEL_27;
    }
    id v57 = 0;
    objc_opt_class();
    char v20 = v52;
    id v39 = v52[5];
    char v21 = CUXPCDecodeObject();
    objc_storeStrong(v20 + 5, v39);
    if ((v21 & 1) == 0
      || (v22 = v52, v37 = v52[5], v38 = 0, char v23 = CUXPCDecodeDouble(), objc_storeStrong(v22 + 5, v37), (v23 & 1) == 0))
    {
LABEL_25:

      goto LABEL_26;
    }
    id v24 = v57;
    if (!v57)
    {
      if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
      {
        id v33 = v11;
        LogPrintF_safe();
      }
      uint64_t v28 = [(CBDaemonServer *)self->_daemon stackController];
      id v29 = v52;
      id v35 = v52[5];
      unsigned int v30 = [v28 modifyDevice:v11 error:&v35];
      objc_storeStrong(v29 + 5, v35);

      if (!v30) {
        goto LABEL_25;
      }
      goto LABEL_22;
    }
    if (dword_1009F85F0 <= 30)
    {
      if (dword_1009F85F0 != -1)
      {
LABEL_13:
        id v33 = v11;
        id v34 = v24;
        LogPrintF_safe();
        goto LABEL_18;
      }
      if (_LogCategory_Initialize())
      {
        id v24 = v57;
        goto LABEL_13;
      }
    }
LABEL_18:
    id v25 = [(CBDaemonServer *)self->_daemon stackController];
    uint64_t v26 = v52;
    id v36 = v52[5];
    unsigned __int8 v27 = [v25 modifyDevice:v11 settings:v57 error:&v36];
    objc_storeStrong(v26 + 5, v36);

    if ((v27 & 1) == 0) {
      goto LABEL_25;
    }
LABEL_22:
    id v31 = CUXPCDictionaryCreateReply();
    if (v31)
    {
      [(CBDaemonXPCConnection *)self _xpcSendReply:v31];
    }
    else if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

    goto LABEL_25;
  }
LABEL_29:
  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v51, 8);
}

- (void)_xpcPerformDeviceRequest:(id)a3
{
  uint64_t v28 = 0;
  id v29 = (id *)&v28;
  uint64_t v30 = 0x3032000000;
  id v31 = sub_10004CF3C;
  uint64_t v32 = sub_10004CD70;
  id v33 = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000B0A2C;
  v25[3] = &unk_100997E48;
  unsigned __int8 v27 = &v28;
  v25[4] = self;
  id v4 = a3;
  id v26 = v4;
  unsigned __int8 v5 = objc_retainBlock(v25);
  id v6 = v29;
  id obj = v29[5];
  unsigned __int8 v7 = [(CBDaemonXPCConnection *)self _entitledAndReturnError:&obj];
  objc_storeStrong(v6 + 5, obj);
  if (v7)
  {
    id v23 = 0;
    objc_opt_class();
    id v8 = v29;
    id v22 = v29[5];
    char v9 = CUXPCDecodeObject();
    objc_storeStrong(v8 + 5, v22);
    if (v9)
    {
      id v21 = 0;
      objc_opt_class();
      xpc_object_t v10 = v29;
      id v20 = v29[5];
      char v11 = CUXPCDecodeObject();
      objc_storeStrong(v10 + 5, v20);
      if (v11)
      {
        if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
        {
          id v13 = v23;
          id v14 = v21;
          LogPrintF_safe();
        }
        id v12 = [(CBDaemonServer *)self->_daemon stackController];
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_1000B0B08;
        v15[3] = &unk_1009993A8;
        id v16 = v23;
        id v17 = v21;
        id v18 = self;
        id v19 = v4;
        [v12 performDeviceRequest:v21 device:v16 completionHandler:v15];
      }
    }
  }
  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v28, 8);
}

- (void)_xpcDiagnosticControl:(id)a3
{
  uint64_t v132 = 0;
  v133 = (id *)&v132;
  uint64_t v134 = 0x3032000000;
  v135 = sub_10004CF3C;
  v136 = sub_10004CD70;
  id v137 = 0;
  v129[0] = _NSConcreteStackBlock;
  v129[1] = 3221225472;
  v129[2] = sub_1000B26AC;
  v129[3] = &unk_100997E48;
  v131 = &v132;
  v129[4] = self;
  id v4 = a3;
  id v130 = v4;
  uint64_t v104 = objc_retainBlock(v129);
  unsigned __int8 v5 = v133;
  id obj = v133[5];
  unsigned __int8 v6 = [(CBDaemonXPCConnection *)self _entitledAndReturnError:&obj];
  objc_storeStrong(v5 + 5, obj);
  if ((v6 & 1) == 0)
  {
    [(CBDaemonXPCConnection *)self _xpcSendReplyError:v133[5] request:v4];
    goto LABEL_76;
  }
  xpc_dictionary_get_value(v4, "parm");
  xpc_object_t xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  if (xdict && xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
  {
    string = xpc_dictionary_get_string(xdict, "iStr");
    if (!string) {
      goto LABEL_26;
    }
    if (stricmp_prefix())
    {
      if (!stricmp_prefix())
      {
        [(CBDaemonXPCConnection *)self _xpcDiagnosticAdvertiser];
        uint64_t v125 = 0;
        NSAppendPrintF_safe();
        goto LABEL_33;
      }
      if (!strcasecmp(string, "aop-read-debug"))
      {
        if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
        {
          id v96 = string;
          LogPrintF_safe();
        }
        id v17 = [(CBDaemonServer *)self->_daemon stackController];
        id v18 = [v17 diagnosticControl:xdict];

        uint64_t v124 = 0;
        NSAppendPrintF_safe();
        id v13 = (__CFString *)0;

        goto LABEL_67;
      }
      if (!strcasecmp(string, "aop-write-debug"))
      {
        if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
        {
          id v96 = string;
          LogPrintF_safe();
        }
        id v19 = [(CBDaemonServer *)self->_daemon stackController];
        id v20 = [v19 diagnosticControl:xdict];

        uint64_t v123 = 0;
        NSAppendPrintF_safe();
        id v13 = (__CFString *)0;

        goto LABEL_67;
      }
      if (!stricmp_prefix())
      {
        [(CBDaemonXPCConnection *)self _xpcDiagnosticAssertion];
        uint64_t v122 = 0;
        NSAppendPrintF_safe();
        goto LABEL_33;
      }
      if (!stricmp_prefix())
      {
        if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
        {
          id v96 = string;
          LogPrintF_safe();
        }
        id v21 = [(CBDaemonServer *)self->_daemon stackController];
        id v22 = [v21 diagnosticControl:xdict];

        uint64_t v121 = 0;
        NSAppendPrintF_safe();
        id v13 = (__CFString *)0;

        goto LABEL_67;
      }
      if (!stricmp_prefix())
      {
        if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
        {
          id v96 = string;
          LogPrintF_safe();
        }
        id v25 = [(CBDaemonServer *)self->_daemon stackController];
        id v26 = [v25 diagnosticControl:xdict];

        uint64_t v120 = 0;
        NSAppendPrintF_safe();
        id v13 = (__CFString *)0;

        goto LABEL_67;
      }
      if (!stricmp_prefix())
      {
        [(CBDaemonXPCConnection *)self _xpcDiagnosticDiscovery];
        uint64_t v119 = 0;
        NSAppendPrintF_safe();
        goto LABEL_33;
      }
      if (!stricmp_prefix())
      {
        if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize())) {
          LogPrintF_safe();
        }
        long long v117 = 0u;
        long long v118 = 0u;
        long long v115 = 0u;
        long long v116 = 0u;
        uint64_t v32 = [(CBDaemonServer *)self->_daemon xpcConnections];
        id v33 = [v32 countByEnumeratingWithState:&v115 objects:v139 count:16];
        if (v33)
        {
          uint64_t v34 = *(void *)v116;
          do
          {
            for (unint64_t i = 0; i != v33; unint64_t i = (char *)i + 1)
            {
              if (*(void *)v116 != v34) {
                objc_enumerationMutation(v32);
              }
              [*(id *)(*((void *)&v115 + 1) + 8 * i) _spatialInteractionReevaluateDevices];
            }
            id v33 = [v32 countByEnumeratingWithState:&v115 objects:v139 count:16];
          }
          while (v33);
        }

        v114[1] = 0;
        NSAppendPrintF_safe();
        goto LABEL_33;
      }
      if (stricmp_prefix())
      {
        if (!stricmp_prefix())
        {
          if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
          {
            id v96 = string;
            LogPrintF_safe();
          }
          uint64_t v51 = [(CBDaemonServer *)self->_daemon stackController];
          id v52 = [v51 diagnosticControl:xdict];

          uint64_t v112 = 0;
          NSAppendPrintF_safe();
          id v13 = (__CFString *)0;

          goto LABEL_67;
        }
        if (!stricmp_prefix())
        {
          if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
          {
            id v96 = string;
            LogPrintF_safe();
          }
          v54 = [(CBDaemonServer *)self->_daemon stackController];
          v55 = [v54 diagnosticControl:xdict];

          uint64_t v111 = 0;
          NSAppendPrintF_safe();
          id v13 = (__CFString *)0;

          goto LABEL_67;
        }
        if (strcasecmp(string, "LoD-connected"))
        {
          if (!strcasecmp(string, "mp-error"))
          {
            if (dword_1009F85F0 > 30 || dword_1009F85F0 == -1 && !_LogCategory_Initialize()) {
              goto LABEL_136;
            }
          }
          else
          {
            if (strcasecmp(string, "mp-keys-reset"))
            {
              if (stricmp_prefix())
              {
                if (stricmp_prefix())
                {
                  if (stricmp_prefix())
                  {
                    if (stricmp_prefix())
                    {
                      if (*string && strcasecmp(string, "help")) {
                        goto LABEL_26;
                      }
                      if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize())) {
                        LogPrintF_safe();
                      }
                      NSAppendPrintF_safe();
                      id v106 = 0;
                      NSAppendPrintF_safe();
                      id v61 = v106;

                      NSAppendPrintF_safe();
                      id v62 = v61;

                      NSAppendPrintF_safe();
                      id v63 = v62;

                      NSAppendPrintF_safe();
                      id v64 = v63;

                      NSAppendPrintF_safe();
                      id v65 = v64;

                      NSAppendPrintF_safe();
                      id v66 = v65;

                      NSAppendPrintF_safe();
                      id v67 = v66;

                      NSAppendPrintF_safe();
                      id v68 = v67;

                      NSAppendPrintF_safe();
                      id v69 = v68;

                      NSAppendPrintF_safe();
                      id v70 = v69;

                      NSAppendPrintF_safe();
                      id v71 = v70;

                      NSAppendPrintF_safe();
                      id v72 = v71;

                      NSAppendPrintF_safe();
                      id v73 = v72;

                      NSAppendPrintF_safe();
                      id v74 = v73;

                      NSAppendPrintF_safe();
                      id v75 = v74;

                      NSAppendPrintF_safe();
                      id v76 = v75;

                      NSAppendPrintF_safe();
                      id v77 = v76;

                      NSAppendPrintF_safe();
                      id v78 = v77;

                      NSAppendPrintF_safe();
                      id v79 = v78;

                      NSAppendPrintF_safe();
                      id v80 = v79;

                      NSAppendPrintF_safe();
                      id v81 = v80;

                      NSAppendPrintF_safe();
                      id v82 = v81;

                      NSAppendPrintF_safe();
                      id v83 = v82;

                      NSAppendPrintF_safe();
                      id v84 = v83;

                      NSAppendPrintF_safe();
                      id v85 = v84;

                      NSAppendPrintF_safe();
                      id v86 = v85;

                      NSAppendPrintF_safe();
                      id v87 = v86;

                      NSAppendPrintF_safe();
                      id v88 = v87;

                      NSAppendPrintF_safe();
                      id v13 = (__CFString *)v88;
                    }
                    else
                    {
                      if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize())) {
                        LogPrintF_safe();
                      }
                      NSAppendPrintF_safe();
                      id v89 = 0;
                      v90 = [(CBDaemonServer *)self->_daemon stackController];
                      v91 = [v90 diagnosticControl:xdict];

                      NSAppendPrintF_safe();
                      id v13 = (__CFString *)v89;
                    }
                  }
                  else
                  {
                    [(CBDaemonServer *)self->_daemon setWifiCriticalOverride:[(CBDaemonServer *)self->_daemon wifiCriticalOverride] == 0];
                    if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
                    {
                      [(CBDaemonServer *)self->_daemon wifiCriticalOverride];
                      LogPrintF_safe();
                    }
                    NSAppendPrintF_safe();
                    id v13 = (__CFString *)0;
                    [(CBDaemonServer *)self->_daemon scheduleUpdateImmediate:0];
                  }
LABEL_67:
                  unsigned __int8 v27 = CUXPCDictionaryCreateReply();
                  uint64_t v28 = v27;
                  if (v27)
                  {
                    if (v13) {
                      id v29 = v13;
                    }
                    else {
                      id v29 = @"None\n";
                    }
                    id v30 = v27;
                    id v31 = (const char *)[(__CFString *)v29 UTF8String];
                    if (v31) {
                      xpc_dictionary_set_string(v30, "oStr", v31);
                    }

                    [(CBDaemonXPCConnection *)self _xpcSendReply:v30];
                  }
                  else if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
                  {
                    LogPrintF_safe();
                  }

                  goto LABEL_75;
                }
                if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize())) {
                  LogPrintF_safe();
                }
                id v60 = [(CBDaemonServer *)self->_daemon whbDiscoveryDaemon];
                [v60 diagnosticControl:&off_1009E1708];

                NSAppendPrintF_safe();
              }
              else
              {
                [(CBDaemonXPCConnection *)self _xpcDiagnosticTipiChanged];
                NSAppendPrintF_safe();
              }
LABEL_33:
              id v13 = (__CFString *)0;
              goto LABEL_67;
            }
            if (dword_1009F85F0 > 30 || dword_1009F85F0 == -1 && !_LogCategory_Initialize())
            {
LABEL_136:
              v58 = [(CBDaemonServer *)self->_daemon stackController];
              v59 = [v58 diagnosticControl:xdict];

              NSAppendPrintF_safe();
              id v13 = (__CFString *)0;

              goto LABEL_67;
            }
          }
          id v96 = string;
          LogPrintF_safe();
          goto LABEL_136;
        }
        id v36 = (void *)CUXPCCreateCFObjectFromXPCObject();
        if (v36)
        {
          CFStringGetTypeID();
          id v37 = CFDictionaryGetTypedValue();
          if (!v37)
          {
            uint64_t v92 = CBErrorF();
            id v93 = v133[5];
            v133[5] = (id)v92;

            goto LABEL_134;
          }
          id v103 = [objc_alloc((Class)NSUUID) initWithUUIDString:v37];
          if (!v103)
          {
            uint64_t v94 = CBErrorF();
            id v95 = v133[5];
            v133[5] = (id)v94;

            goto LABEL_134;
          }
          id v99 = v37;
          CFStringGetTypeID();
          id v101 = CFDictionaryGetTypedValue();
          uint64_t v102 = v36;
          id v38 = objc_alloc_init((Class)NSMutableArray);
          CFStringGetTypeID();
          id v39 = CFDictionaryGetTypedValue();
          long long v109 = 0u;
          long long v110 = 0u;
          long long v107 = 0u;
          long long v108 = 0u;
          id v40 = [v39 componentsSeparatedByString:@","];
          id v41 = [v40 countByEnumeratingWithState:&v107 objects:v138 count:16];
          uint64_t v100 = v39;
          if (v41)
          {
            uint64_t v42 = *(void *)v108;
            do
            {
              for (j = 0; j != v41; j = (char *)j + 1)
              {
                if (*(void *)v108 != v42) {
                  objc_enumerationMutation(v40);
                }
                id v44 = [objc_alloc((Class)CBUUID) initWithString:*(void *)(*((void *)&v107 + 1) + 8 * (void)j) safe:1];
                if (v44) {
                  [v38 addObject:v44];
                }
              }
              id v41 = [v40 countByEnumeratingWithState:&v107 objects:v138 count:16];
            }
            while (v41);
          }

          id v45 = v103;
          id v46 = v100;
          if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v47 = [v103 UUIDString];
            CUPrintNSObjectOneLine();
            v98 = id v97 = v47;
            id v96 = string;
            LogPrintF_safe();

            id v45 = v103;
            id v46 = v100;
          }
          -[CBDaemonServer notifyConnectedDeviceUUID:name:servicesUUIDs:](self->_daemon, "notifyConnectedDeviceUUID:name:servicesUUIDs:", v45, v101, v38, v96, v97, v98);
          NSAppendPrintF_safe();
          id v13 = (__CFString *)0;

          goto LABEL_67;
        }
LABEL_26:
        uint64_t v8 = CBErrorF();
        id v9 = v133[5];
        v133[5] = (id)v8;

LABEL_134:
        id v13 = 0;
        goto LABEL_75;
      }
      xpc_object_t v10 = (void *)CUXPCCreateCFObjectFromXPCObject();
      if (v10)
      {
        id v23 = [(CBDaemonServer *)self->_daemon extensionsDaemon];
        BOOL v24 = v23 == 0;

        if (!v24)
        {
          if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
          {
            CUPrintNSObjectOneLine();
            v97 = id v96 = string;
            LogPrintF_safe();
          }
          v48 = [(CBDaemonServer *)self->_daemon extensionsDaemon];
          id v49 = v133 + 5;
          v114[0] = v133[5];
          v50 = [v48 diagnosticControl:v10 error:v114];
          objc_storeStrong(v49, v114[0]);

          if (!v50)
          {

            goto LABEL_134;
          }
          uint64_t v113 = 0;
          NSAppendPrintF_safe();
          id v13 = (__CFString *)0;

          goto LABEL_67;
        }
      }
    }
    else
    {
      xpc_object_t v10 = (void *)CUXPCCreateCFObjectFromXPCObject();
      if (v10)
      {
        char v11 = [(CBDaemonServer *)self->_daemon accessoryDaemon];
        BOOL v12 = v11 == 0;

        if (!v12)
        {
          if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
          {
            CUPrintNSObjectOneLine();
            v97 = id v96 = string;
            LogPrintF_safe();
          }
          id v14 = [(CBDaemonServer *)self->_daemon accessoryDaemon];
          char v15 = v133 + 5;
          id v127 = v133[5];
          id v16 = [v14 diagnosticControl:v10 error:&v127];
          objc_storeStrong(v15, v127);

          if (!v16)
          {

            goto LABEL_134;
          }
          uint64_t v126 = 0;
          NSAppendPrintF_safe();
          id v13 = (__CFString *)0;

          goto LABEL_67;
        }
      }
    }
    uint64_t v56 = CBErrorF();
    id v57 = v133[5];
    v133[5] = (id)v56;

    goto LABEL_134;
  }
  uint64_t v53 = CBErrorF();
  id v13 = (__CFString *)v133[5];
  v133[5] = (id)v53;
LABEL_75:

LABEL_76:
  ((void (*)(void *))v104[2])(v104);

  _Block_object_dispose(&v132, 8);
}

- (void)_xpcDiagnosticAdvertiser
{
  uint64_t v3 = [(CBDaemonServer *)self->_daemon testAdvertiser];
  if (v3)
  {
    id v4 = (void *)v3;
    id v11 = (id)v3;
    if (dword_1009F85F0 <= 30)
    {
      if (dword_1009F85F0 != -1 || (v5 = _LogCategory_Initialize(), id v4 = v11, v5))
      {
        LogPrintF_safe();
        id v4 = v11;
      }
    }
    [v4 invalidate:v11];
    [(CBDaemonServer *)self->_daemon setTestAdvertiser:0];
  }
  else
  {
    if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    unsigned __int8 v6 = objc_alloc_init(CBAdvertiserDaemon);
    [(CBDaemonServer *)self->_daemon setTestAdvertiser:v6];
    [(CBAdvertiserDaemon *)v6 setDispatchQueue:self->_dispatchQueue];
    [(CBAdvertiserDaemon *)v6 setSpatialInteractionFlags:105];
    [(CBAdvertiserDaemon *)v6 setSpatialInteractionConfigFlags:1];
    unsigned __int8 v7 = NSRandomData();
    char v15 = v7;
    uint64_t v8 = +[NSArray arrayWithObjects:&v15 count:1];
    [(CBAdvertiserDaemon *)v6 setSpatialInteractionIdentifiers:v8];

    id v9 = NSRandomData();
    [(CBAdvertiserDaemon *)v6 setSpatialInteractionUWBConfigData:v9];

    xpc_object_t v10 = NSRandomData();
    [(CBAdvertiserDaemon *)v6 setSpatialInteractionPresenceConfigData:v10];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000B2A70;
    v14[3] = &unk_100997230;
    v14[4] = v6;
    [(CBAdvertiserDaemon *)v6 setInvalidationHandler:v14];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000B2AF0;
    v13[3] = &unk_100997398;
    void v13[4] = v6;
    v13[5] = self;
    [(CBAdvertiserDaemon *)v6 activateWithCompletion:v13];
  }
}

- (void)_xpcDiagnosticAssertion
{
  uint64_t v3 = [(CBDaemonServer *)self->_daemon testAssertion];
  if (v3)
  {
    id v4 = (void *)v3;
    id v7 = (id)v3;
    if (dword_1009F85F0 <= 30)
    {
      if (dword_1009F85F0 != -1 || (v5 = _LogCategory_Initialize(), id v4 = v7, v5))
      {
        LogPrintF_safe();
        id v4 = v7;
      }
    }
    [v4 invalidate];
    [(CBDaemonServer *)self->_daemon setTestAssertion:0];
  }
  else
  {
    if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    id v6 = objc_alloc_init((Class)CBController);
    [(CBDaemonServer *)self->_daemon setTestAssertion:v6];
    [v6 setDispatchQueue:self->_dispatchQueue];
    [v6 setLabel:@"CBDiags"];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000B2DE4;
    v8[3] = &unk_100997398;
    v8[4] = v6;
    v8[5] = self;
    [v6 activateAssertionWithFlags:1 completion:v8];
  }
}

- (void)_xpcDiagnosticDiscovery
{
  uint64_t v3 = [(CBDaemonServer *)self->_daemon testDiscovery];
  if (v3)
  {
    id v4 = (void *)v3;
    id v7 = (id)v3;
    if (dword_1009F85F0 <= 30)
    {
      if (dword_1009F85F0 != -1 || (v5 = _LogCategory_Initialize(), id v4 = v7, v5))
      {
        LogPrintF_safe();
        id v4 = v7;
      }
    }
    [v4 invalidate:v7];
    [(CBDaemonServer *)self->_daemon setTestDiscovery:0];
  }
  else
  {
    if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    id v6 = objc_alloc_init((Class)CBDiscovery);
    [(CBDaemonServer *)self->_daemon setTestDiscovery:v6];
    [v6 setDiscoveryFlags:16];
    [v6 setDispatchQueue:self->_dispatchQueue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000B31C4;
    v12[3] = &unk_100997370;
    v12[4] = v6;
    v12[5] = self;
    [v6 setDeviceFoundHandler:v12];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000B3280;
    v11[3] = &unk_100997370;
    v11[4] = v6;
    v11[5] = self;
    [v6 setDeviceLostHandler:v11];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000B333C;
    v10[3] = &unk_100997230;
    v10[4] = v6;
    [v6 setInvalidationHandler:v10];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000B33BC;
    v9[3] = &unk_100997398;
    v9[4] = v6;
    v9[5] = self;
    [v6 activateWithCompletion:v9];
  }
}

- (void)_xpcDiagnosticLog:(id)a3
{
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_10004CF3C;
  id v21 = sub_10004CD70;
  id v22 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000B37F4;
  v14[3] = &unk_100997E48;
  id v16 = &v17;
  v14[4] = self;
  id v4 = a3;
  id v15 = v4;
  int v5 = objc_retainBlock(v14);
  id v6 = (id *)(v18 + 5);
  id obj = (id)v18[5];
  unsigned __int8 v7 = [(CBDaemonXPCConnection *)self _entitledAndReturnError:&obj];
  objc_storeStrong(v6, obj);
  if (v7)
  {
    id v8 = xpc_dictionary_get_value(v4, "parm");
    if (v8
      && (xpc_get_type(v4) != (xpc_type_t)&_xpc_type_dictionary
       || xpc_dictionary_get_string(v8, "iStr") && LogControl()))
    {
      uint64_t v11 = CBErrorF();
      id v12 = (void *)v18[5];
      void v18[5] = v11;
    }
    else
    {
      LogShow();
      uint64_t v9 = CBErrorF();
      xpc_object_t v10 = (void *)v18[5];
      void v18[5] = v9;
    }
  }
  else
  {
    [(CBDaemonXPCConnection *)self _xpcSendReplyError:v18[5] request:v4];
  }
  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v17, 8);
}

- (void)_xpcDiagnosticShow:(id)a3
{
  id v4 = a3;
  id v32 = 0;
  unsigned __int8 v5 = [(CBDaemonXPCConnection *)self _entitledAndReturnError:&v32];
  id v6 = v32;
  if ((v5 & 1) == 0)
  {
    [(CBDaemonXPCConnection *)self _xpcSendReplyError:v6 request:v4];
    goto LABEL_29;
  }
  unsigned __int8 v7 = xpc_dictionary_get_value(v4, "parm");
  if (!v7) {
    goto LABEL_9;
  }
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
  {
    string = xpc_dictionary_get_string(v7, "iStr");
    xpc_dictionary_get_int64(v7, "vrbL");
    if (string)
    {
      if (stricmp_prefix())
      {
        id v22 = (void *)string;
        uint64_t v9 = CBErrorF();

        if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
        {
          id v22 = CUPrintNSError();
          LogPrintF_safe();
        }
        -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v9, v4, v22);
        id v6 = (id)v9;
        goto LABEL_28;
      }
      id v15 = [(CBDaemonServer *)self->_daemon identityArray];
      uint64_t v30 = 0;
      id v24 = [v15 count];
      NSAppendPrintF_safe();
      uint64_t v11 = (__CFString *)0;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v10 = v15;
      id v16 = [v10 countByEnumeratingWithState:&v26 objects:v33 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v27;
        do
        {
          uint64_t v19 = 0;
          id v20 = v11;
          do
          {
            if (*(void *)v27 != v18) {
              objc_enumerationMutation(v10);
            }
            uint64_t v25 = *(void *)(*((void *)&v26 + 1) + 8 * (void)v19);
            NSAppendPrintF_safe();
            uint64_t v11 = v20;

            uint64_t v19 = (char *)v19 + 1;
            id v20 = v11;
          }
          while (v17 != v19);
          id v17 = [v10 countByEnumeratingWithState:&v26 objects:v33 count:16];
        }
        while (v17);
      }

LABEL_10:
      id v12 = CUXPCDictionaryCreateReply();
      if (v12)
      {
        if (v11) {
          id v13 = v11;
        }
        else {
          id v13 = @"None\n";
        }
        id v14 = (const char *)[(__CFString *)v13 UTF8String];
        if (v14) {
          xpc_dictionary_set_string(v12, "oStr", v14);
        }
        -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v12, v23);
      }
      else if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }

      goto LABEL_28;
    }
LABEL_9:
    uint64_t v31 = 0;
    CUDescriptionWithLevel();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v23 = v10;
    NSAppendPrintF_safe();
    uint64_t v11 = (__CFString *)0;
    goto LABEL_10;
  }
  uint64_t v21 = CBErrorF();

  id v6 = (id)v21;
LABEL_28:

LABEL_29:
}

- (void)_xpcDiagnosticTipiChanged
{
  id v12 = objc_alloc_init((Class)CBDevice);
  id v2 = NSRandomData();
  [v12 setBtAddressData:v2];

  id v3 = objc_alloc_init((Class)NSMutableArray);
  for (uint64_t i = 0; i != 3; ++i)
  {
    id v5 = objc_alloc_init((Class)CBDevice);
    id v6 = NSRandomData();
    [v5 setBtAddressData:v6];

    if (i == 1) {
      unsigned int v7 = 2;
    }
    else {
      unsigned int v7 = 3;
    }
    if (i == 1) {
      uint64_t v8 = 3;
    }
    else {
      uint64_t v8 = 1;
    }
    if (i) {
      uint64_t v9 = v7;
    }
    else {
      uint64_t v9 = 1;
    }
    [v5 setTipiConnectionStatus:v9];
    [v5 setTipiState:v8];
    [v3 addObject:v5];
  }
  [v12 setTipiDevices:v3];
  if (dword_1009F85F0 < 31 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
  {
    id v11 = v12;
    LogPrintF_safe();
  }
  id v10 = +[NSNotificationCenter defaultCenter];
  [v10 postNotificationName:@"com.apple.bluetooth.TipiChanged" object:v12 userInfo:0];
}

- (void)_xpcSetLowPowerMode:(id)a3
{
  id v4 = a3;
  id v14 = 0;
  unsigned __int8 v5 = [(CBDaemonXPCConnection *)self _entitledAndReturnError:&v14];
  id v6 = v14;
  if (v5)
  {
    int64_t int64 = xpc_dictionary_get_int64(v4, "ctrP");
    if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
    {
      if (int64 > 2) {
        uint64_t v8 = "?";
      }
      else {
        uint64_t v8 = off_100999530[(int)int64];
      }
      id v10 = v8;
      LogPrintF_safe();
    }
    uint64_t v9 = [(CBDaemonServer *)self->_daemon stackController];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000B3FF0;
    v11[3] = &unk_1009993D0;
    int v13 = int64;
    v11[4] = self;
    id v12 = v4;
    [v9 setLowPowerModeWithReason:int64 completionHandler:v11];
  }
  else
  {
    [(CBDaemonXPCConnection *)self _xpcSendReplyError:v6 request:v4];
  }
}

- (void)_xpcGetPowerState:(id)a3
{
  id v9 = 0;
  id v4 = a3;
  unsigned __int8 v5 = [(CBDaemonXPCConnection *)self _entitledAndReturnError:&v9];
  id v6 = v9;
  if (v5)
  {
    unsigned int v7 = CUXPCDictionaryCreateReply();

    if (v7)
    {
      int64_t v8 = [(CBDaemonXPCConnection *)self _powerStateForClient];
      if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      xpc_dictionary_set_int64(v7, "pwrS", v8);
      [(CBDaemonXPCConnection *)self _xpcSendReply:v7];
    }
    else if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  else
  {
    [(CBDaemonXPCConnection *)self _xpcSendReplyError:v6 request:v4];
    unsigned int v7 = v4;
  }
}

- (void)_xpcSetPowerState:(id)a3
{
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_10004CF3C;
  id v23 = sub_10004CD70;
  id v24 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000B4640;
  v16[3] = &unk_100997E48;
  uint64_t v18 = &v19;
  v16[4] = self;
  id v4 = a3;
  id v17 = v4;
  unsigned __int8 v5 = objc_retainBlock(v16);
  id v6 = (id *)(v20 + 5);
  id obj = (id)v20[5];
  unsigned __int8 v7 = [(CBDaemonXPCConnection *)self _entitledAndReturnError:&obj];
  objc_storeStrong(v6, obj);
  if (v7)
  {
    unint64_t int64 = xpc_dictionary_get_int64(v4, "pwrS");
    if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
    {
      if (int64 > 0xA) {
        id v9 = "?";
      }
      else {
        id v9 = off_100999548[int64];
      }
      int v13 = v9;
      LogPrintF_safe();
    }
    id v10 = [(CBDaemonServer *)self->_daemon stackController];
    id v11 = (id *)(v20 + 5);
    id v14 = (id)v20[5];
    [v10 setPowerState:int64 error:&v14];
    objc_storeStrong(v11, v14);

    if (!v20[5])
    {
      id v12 = CUXPCDictionaryCreateReply();
      if (v12)
      {
        [(CBDaemonXPCConnection *)self _xpcSendReply:v12];
      }
      else if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
  }
  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v19, 8);
}

- (void)_xpcReadPrefs:(id)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = (id *)&v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_10004CF3C;
  uint64_t v21 = sub_10004CD70;
  id v22 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000B4DA0;
  v14[3] = &unk_100997E48;
  id v16 = &v17;
  v14[4] = self;
  id v10 = a3;
  id v15 = v10;
  id v9 = objc_retainBlock(v14);
  id v4 = v18;
  id obj = v18[5];
  unsigned __int8 v5 = [(CBDaemonXPCConnection *)self _entitledAndReturnError:&obj];
  objc_storeStrong(v4 + 5, obj);
  if (v5)
  {
    id v6 = v18 + 5;
    id v11 = v18[5];
    id v12 = 0;
    CUXPCDecodeNSArrayOfNSString();
    objc_storeStrong(v6, v11);
    if (!v18[5])
    {
      uint64_t v7 = CBErrorF();
      id v8 = v18[5];
      void v18[5] = (id)v7;
    }
  }
  ((void (*)(void *))v9[2])(v9);

  _Block_object_dispose(&v17, 8);
}

- (void)_xpcWritePref:(id)a3
{
  uint64_t v16 = 0;
  uint64_t v17 = (id *)&v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_10004CF3C;
  id v20 = sub_10004CD70;
  id v21 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000B52EC;
  v13[3] = &unk_100997E48;
  id v15 = &v16;
  void v13[4] = self;
  id v4 = a3;
  id v14 = v4;
  unsigned __int8 v5 = objc_retainBlock(v13);
  id v6 = v17;
  id obj = v17[5];
  unsigned __int8 v7 = [(CBDaemonXPCConnection *)self _entitledAndReturnError:&obj];
  objc_storeStrong(v6 + 5, obj);
  if (v7)
  {
    id v8 = v17 + 5;
    id v11 = v17[5];
    CUXPCDecodeNSString();
    objc_storeStrong(v8, v11);
    if (!v17[5])
    {
      uint64_t v9 = CBErrorF();
      id v10 = v17[5];
      void v17[5] = (id)v9;
    }
  }
  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v16, 8);
}

- (void)_xpcSendRelayMessage:(id)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = (id *)&v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_10004CF3C;
  id v21 = sub_10004CD70;
  id v22 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000B58E0;
  v14[3] = &unk_100997E48;
  uint64_t v16 = &v17;
  v14[4] = self;
  id v4 = a3;
  id v15 = v4;
  unsigned __int8 v5 = objc_retainBlock(v14);
  id v6 = v18;
  id obj = v18[5];
  unsigned __int8 v7 = [(CBDaemonXPCConnection *)self _entitledAndReturnError:&obj];
  objc_storeStrong(v6 + 5, obj);
  if (v7)
  {
    id v12 = 0;
    objc_opt_class();
    id v8 = v18;
    id v11 = v18[5];
    CUXPCDecodeObject();
    objc_storeStrong(v8 + 5, v11);
    uint64_t v9 = NSErrorNestedF();
    id v10 = v18[5];
    void v18[5] = (id)v9;
  }
  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v17, 8);
}

- (void)_xpcSendSmartRoutingInformation:(id)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = (id *)&v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_10004CF3C;
  id v21 = sub_10004CD70;
  id v22 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000B5D7C;
  v14[3] = &unk_100997E48;
  uint64_t v16 = &v17;
  v14[4] = self;
  id v4 = a3;
  id v15 = v4;
  unsigned __int8 v5 = objc_retainBlock(v14);
  id v6 = v18;
  id obj = v18[5];
  unsigned __int8 v7 = [(CBDaemonXPCConnection *)self _entitledAndReturnError:&obj];
  objc_storeStrong(v6 + 5, obj);
  if (v7)
  {
    id v12 = 0;
    objc_opt_class();
    id v8 = v18;
    id v11 = v18[5];
    CUXPCDecodeObject();
    objc_storeStrong(v8 + 5, v11);
    uint64_t v9 = NSErrorNestedF();
    id v10 = v18[5];
    void v18[5] = (id)v9;
  }
  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v17, 8);
}

- (void)_xpcSendAudioAccessoryEventMessage:(id)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_10004CF3C;
  id v21 = sub_10004CD70;
  id v22 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000B62D4;
  v14[3] = &unk_100997E48;
  uint64_t v16 = &v17;
  v14[4] = self;
  id v4 = a3;
  id v15 = v4;
  unsigned __int8 v5 = objc_retainBlock(v14);
  id v6 = (id *)(v18 + 5);
  id obj = (id)v18[5];
  unsigned __int8 v7 = [(CBDaemonXPCConnection *)self _entitledAndReturnError:&obj];
  objc_storeStrong(v6, obj);
  if (v7)
  {
    id v12 = 0;
    objc_opt_class();
    id v8 = (id *)(v18 + 5);
    id v11 = (id)v18[5];
    CUXPCDecodeObject();
    objc_storeStrong(v8, v11);
    uint64_t v9 = NSErrorNestedF();
    id v10 = (void *)v18[5];
    void v18[5] = v9;
  }
  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v17, 8);
}

- (void)_xpcSendAudioAccessoryConfigMessage:(id)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_10004CF3C;
  id v21 = sub_10004CD70;
  id v22 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000B66E8;
  v14[3] = &unk_100997E48;
  uint64_t v16 = &v17;
  v14[4] = self;
  id v4 = a3;
  id v15 = v4;
  unsigned __int8 v5 = objc_retainBlock(v14);
  id v6 = (id *)(v18 + 5);
  id obj = (id)v18[5];
  unsigned __int8 v7 = [(CBDaemonXPCConnection *)self _entitledAndReturnError:&obj];
  objc_storeStrong(v6, obj);
  if (v7)
  {
    id v12 = 0;
    objc_opt_class();
    id v8 = (id *)(v18 + 5);
    id v11 = (id)v18[5];
    CUXPCDecodeObject();
    objc_storeStrong(v8, v11);
    uint64_t v9 = NSErrorNestedF();
    id v10 = (void *)v18[5];
    void v18[5] = v9;
  }
  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v17, 8);
}

- (void)_xpcSendConversationDetectMessage:(id)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = (id *)&v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_10004CF3C;
  id v21 = sub_10004CD70;
  id v22 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000B6B84;
  v14[3] = &unk_100997E48;
  uint64_t v16 = &v17;
  v14[4] = self;
  id v4 = a3;
  id v15 = v4;
  unsigned __int8 v5 = objc_retainBlock(v14);
  id v6 = v18;
  id obj = v18[5];
  unsigned __int8 v7 = [(CBDaemonXPCConnection *)self _entitledAndReturnError:&obj];
  objc_storeStrong(v6 + 5, obj);
  if (v7)
  {
    id v12 = 0;
    objc_opt_class();
    id v8 = v18;
    id v11 = v18[5];
    CUXPCDecodeObject();
    objc_storeStrong(v8 + 5, v11);
    uint64_t v9 = NSErrorNestedF();
    id v10 = v18[5];
    void v18[5] = (id)v9;
  }
  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v17, 8);
}

- (void)_xpcResetCBExtension:(id)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_10004CF3C;
  id v21 = sub_10004CD70;
  id v22 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000B6F5C;
  v14[3] = &unk_100997E48;
  uint64_t v16 = &v17;
  v14[4] = self;
  id v4 = a3;
  id v15 = v4;
  unsigned __int8 v5 = objc_retainBlock(v14);
  id v6 = (id *)(v18 + 5);
  id obj = (id)v18[5];
  unsigned __int8 v7 = [(CBDaemonXPCConnection *)self _entitledAndReturnError:&obj];
  objc_storeStrong(v6, obj);
  if (v7)
  {
    id v8 = (id *)(v18 + 5);
    id v11 = (id)v18[5];
    id v12 = 0;
    CUXPCDecodeNSString();
    objc_storeStrong(v8, v11);
    if (!v18[5])
    {
      uint64_t v9 = CBErrorF();
      id v10 = (void *)v18[5];
      void v18[5] = v9;
    }
  }
  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v17, 8);
}

- (void)_xpcUpdateIdentities:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = sub_10004CF3C;
  uint64_t v19 = sub_10004CD70;
  id v20 = 0;
  id obj = 0;
  unsigned __int8 v5 = [(CBDaemonXPCConnection *)self _entitledAndReturnError:&obj];
  objc_storeStrong(&v20, obj);
  if (v5)
  {
    id v6 = xpc_dictionary_get_array(v4, "idtA");
    if (v6)
    {
      id v7 = objc_alloc_init((Class)NSMutableArray);
      applier[0] = _NSConcreteStackBlock;
      applier[1] = 3221225472;
      applier[2] = sub_1000B733C;
      applier[3] = &unk_1009993F8;
      applier[4] = v7;
      applier[5] = &v15;
      xpc_array_apply(v6, applier);
      if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
      {
        id v11 = [v7 count];
        LogPrintF_safe();
      }
      -[CBDaemonServer updateIdentities:](self->_daemon, "updateIdentities:", v7, v11);
      id v10 = CUXPCDictionaryCreateReply();
      if (v10)
      {
        [(CBDaemonXPCConnection *)self _xpcSendReply:v10];
      }
      else if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
    else
    {
      uint64_t v8 = CBErrorF();
      uint64_t v9 = (void *)v16[5];
      void v16[5] = v8;

      if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
      {
        id v12 = CUPrintNSError();
        LogPrintF_safe();

        -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v16[5], v4, v12);
      }
      else
      {
        -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v16[5], v4, v11);
      }
    }
  }
  else
  {
    [(CBDaemonXPCConnection *)self _xpcSendReplyError:v16[5] request:v4];
  }
  _Block_object_dispose(&v15, 8);
}

- (void)_xpcCBDiscoveryActivate:(id)a3
{
  id v4 = a3;
  id v13 = 0;
  unsigned __int8 v5 = [(CBDaemonXPCConnection *)self _entitledAndReturnError:&v13];
  id v6 = v13;
  if (v5)
  {
    id v7 = objc_alloc((Class)CBDiscovery);
    id v12 = v6;
    id v8 = [v7 initWithXPCObject:v4 error:&v12];
    id v9 = v12;

    if (v8)
    {
      [v8 setAppID:self->_appID];
      if (((unint64_t)[v8 discoveryFlags] & 0x400000000000) != 0) {
        [(CBDaemonXPCConnection *)self _xpcCBDiscoveryActivateWHB:v4 discovery:v8];
      }
      else {
        [(CBDaemonXPCConnection *)self _xpcCBDiscoveryActivateLocal:v4 discovery:v8];
      }
    }
    else if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
    {
      id v11 = CUPrintNSError();
      LogPrintF_safe();

      -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v9, v4, v11);
    }
    else
    {
      -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v9, v4, v10);
    }
  }
  else
  {
    [(CBDaemonXPCConnection *)self _xpcSendReplyError:v6 request:v4];
    id v9 = v6;
  }
}

- (void)_xpcCBDiscoveryActivateLocal:(id)a3 discovery:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_storeStrong((id *)&self->_activatedDiscovery, a4);
  if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
  {
    CUPrintPID();
    v18 = id v17 = v7;
    LogPrintF_safe();
  }
  id v8 = +[CBMetricsDaemon sharedCBMetricsDaemon];
  [v8 reportCBDiscovery:v7 daemonCnx:self action:@"strt"];

  [(CBDaemonServer *)self->_daemon scheduleDiscoveryUpdateImmediate:1];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1000B7A18;
  v37[3] = &unk_100997208;
  v37[4] = self;
  id v9 = v7;
  id v38 = v9;
  [v9 setBluetoothStateChangedHandler:v37];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1000B7A8C;
  v35[3] = &unk_100997370;
  v35[4] = self;
  id v10 = v9;
  id v36 = v10;
  [v10 setDeviceFoundHandler:v35];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000B7AB0;
  v33[3] = &unk_100997370;
  v33[4] = self;
  id v11 = v10;
  id v34 = v11;
  [v11 setDeviceLostHandler:v33];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000B7AD4;
  v31[3] = &unk_100997C18;
  v31[4] = self;
  id v12 = v11;
  id v32 = v12;
  [v12 setDevicesBufferedHandler:v31];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000B7AF8;
  v29[3] = &unk_100997208;
  v29[4] = self;
  id v13 = v12;
  id v30 = v13;
  [v13 setSystemOverrideHandler:v29];
  id v14 = CUXPCDictionaryCreateReply();
  if (v14)
  {
    xpc_dictionary_set_int64(v14, "pwrS", [(CBDaemonXPCConnection *)self _powerStateForClient]);
    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x3032000000;
    long long v26 = sub_10004CF3C;
    long long v27 = sub_10004CD70;
    id v28 = 0;
    uint64_t v15 = [(CBDaemonServer *)self->_daemon deviceMap];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000B7B18;
    v19[3] = &unk_100998240;
    id v20 = v13;
    id v21 = self;
    id v22 = &v23;
    [v15 enumerateKeysAndObjectsUsingBlock:v19];

    uint64_t v16 = (void *)v24[5];
    if (v16) {
      xpc_dictionary_set_value(v14, "devA", v16);
    }
    [(CBDaemonXPCConnection *)self _xpcSendReply:v14];

    _Block_object_dispose(&v23, 8);
  }
  else if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void)_xpcCBDiscoveryActivateWHB:(id)a3 discovery:(id)a4
{
  id v6 = a3;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000B7FCC;
  v30[3] = &unk_100997208;
  v30[4] = self;
  id v7 = a4;
  id v31 = v7;
  [v7 setBluetoothStateChangedHandler:v30];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000B8040;
  v28[3] = &unk_100997370;
  v28[4] = self;
  id v8 = v7;
  id v29 = v8;
  [v8 setDeviceFoundHandler:v28];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000B8064;
  v26[3] = &unk_100997370;
  v26[4] = self;
  id v9 = v8;
  id v27 = v9;
  [v9 setDeviceLostHandler:v26];
  objc_storeStrong((id *)&self->_activatedDiscoveryWHB, a4);
  if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
  {
    CUPrintPID();
    uint64_t v15 = v14 = v9;
    LogPrintF_safe();
  }
  id v10 = +[CBMetricsDaemon sharedCBMetricsDaemon];
  [v10 reportCBDiscovery:v9 daemonCnx:self action:@"strt"];

  [(CBDaemonServer *)self->_daemon scheduleDiscoveryUpdateImmediate:0];
  id v11 = CUXPCDictionaryCreateReply();
  if (v11)
  {
    xpc_dictionary_set_int64(v11, "pwrS", [(CBDaemonXPCConnection *)self _powerStateForClient]);
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x3032000000;
    uint64_t v23 = sub_10004CF3C;
    id v24 = sub_10004CD70;
    id v25 = 0;
    id v12 = [(CBDaemonServer *)self->_daemon whbDeviceMap];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000B8088;
    v16[3] = &unk_100998240;
    id v17 = v9;
    uint64_t v18 = self;
    uint64_t v19 = &v20;
    [v12 enumerateKeysAndObjectsUsingBlock:v16];

    id v13 = (void *)v21[5];
    if (v13) {
      xpc_dictionary_set_value(v11, "devA", v13);
    }
    [(CBDaemonXPCConnection *)self _xpcSendReply:v11];

    _Block_object_dispose(&v20, 8);
  }
  else if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void)_xpcCBDiscoveryFinish:(id)a3
{
  uint64_t v24 = 0;
  id v25 = (id *)&v24;
  uint64_t v26 = 0x3032000000;
  id v27 = sub_10004CF3C;
  id v28 = sub_10004CD70;
  id v29 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000B855C;
  v21[3] = &unk_100997E48;
  uint64_t v23 = &v24;
  v21[4] = self;
  id v4 = a3;
  id v22 = v4;
  unsigned __int8 v5 = objc_retainBlock(v21);
  id v6 = v25;
  id obj = v25[5];
  unsigned __int8 v7 = [(CBDaemonXPCConnection *)self _entitledAndReturnError:&obj];
  objc_storeStrong(v6 + 5, obj);
  if (v7)
  {
    activatedDiscovery = self->_activatedDiscovery;
    if (activatedDiscovery)
    {
      id v9 = activatedDiscovery;
    }
    else
    {
      id v9 = self->_activatedDiscoveryWHB;
      if (!v9)
      {
        uint64_t v14 = CBErrorF();
        id v9 = (CBDiscovery *)v25[5];
        void v25[5] = (id)v14;
LABEL_19:

        goto LABEL_20;
      }
    }
    if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
    {
      id v10 = [(CBDiscovery *)v9 clientID];
      CUPrintPID();
      v16 = id v15 = v10;
      LogPrintF_safe();
    }
    id v11 = [(CBDaemonServer *)self->_daemon stackBLEScanner];
    if (v11)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000B8638;
      v17[3] = &unk_100999420;
      v17[4] = v9;
      id v18 = v4;
      uint64_t v19 = self;
      [v11 finishDiscovery:v9 completionHandler:v17];
    }
    else
    {
      if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
      {
        [(CBDiscovery *)v9 clientID];
        LogPrintF_safe();
      }
      id v12 = CUXPCDictionaryCreateReply();
      if (v12)
      {
        id v13 = objc_alloc_init((Class)CBDiscoverySummary);
        CUXPCEncodeObject();
        [(CBDaemonXPCConnection *)self _xpcSendReply:v12];
      }
      else if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
    goto LABEL_19;
  }
LABEL_20:
  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v24, 8);
}

- (void)_xpcCBDiscoveryUpdate:(id)a3
{
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = sub_10004CF3C;
  id v28 = sub_10004CD70;
  id v29 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000B8A9C;
  v21[3] = &unk_100997E48;
  uint64_t v23 = &v24;
  v21[4] = self;
  id v4 = a3;
  id v22 = v4;
  unsigned __int8 v5 = objc_retainBlock(v21);
  id v6 = (id *)(v25 + 5);
  id obj = (id)v25[5];
  unsigned __int8 v7 = [(CBDaemonXPCConnection *)self _entitledAndReturnError:&obj];
  objc_storeStrong(v6, obj);
  if (v7)
  {
    id v8 = objc_alloc((Class)CBDiscovery);
    id v9 = (id *)(v25 + 5);
    id v19 = (id)v25[5];
    id v10 = [v8 initWithXPCObject:v4 error:&v19];
    objc_storeStrong(v9, v19);
    if (v10)
    {
      activatedDiscovery = self->_activatedDiscovery;
      if (activatedDiscovery)
      {
        id v12 = activatedDiscovery;
        goto LABEL_6;
      }
      id v12 = self->_activatedDiscoveryWHB;
      if (v12)
      {
LABEL_6:
        unsigned int v13 = [(CBDiscovery *)v12 updateWithCBDiscovery:v10];
        if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
        {
          id v18 = CUPrintPID();
          LogPrintF_safe();
        }
        if (v13)
        {
          uint64_t v14 = +[CBMetricsDaemon sharedCBMetricsDaemon];
          [v14 reportCBDiscovery:v12 daemonCnx:self action:@"updt"];

          [(CBDaemonServer *)self->_daemon scheduleDiscoveryUpdateImmediate:0];
        }
        goto LABEL_12;
      }
      uint64_t v16 = CBErrorF();
      id v17 = (void *)v25[5];
      void v25[5] = v16;

      id v12 = 0;
    }
    else
    {
      uint64_t v15 = CBErrorF();
      id v12 = (CBDiscovery *)v25[5];
      void v25[5] = v15;
    }
LABEL_12:
  }
  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v24, 8);
}

- (void)_xpcCBDiscoveryClearDuplicateFilterCache:(id)a3
{
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_10004CF3C;
  uint64_t v20 = sub_10004CD70;
  id v21 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000B8D4C;
  v13[3] = &unk_100997E48;
  uint64_t v15 = &v16;
  void v13[4] = self;
  id v4 = a3;
  id v14 = v4;
  unsigned __int8 v5 = objc_retainBlock(v13);
  id v6 = (id *)(v17 + 5);
  id obj = (id)v17[5];
  unsigned __int8 v7 = [(CBDaemonXPCConnection *)self _entitledAndReturnError:&obj];
  objc_storeStrong(v6, obj);
  if (v7)
  {
    activatedDiscovery = self->_activatedDiscovery;
    if (activatedDiscovery)
    {
      id v9 = activatedDiscovery;
    }
    else
    {
      id v9 = self->_activatedDiscoveryWHB;
      if (!v9)
      {
        uint64_t v10 = CBErrorF();
        id v11 = (void *)v17[5];
        void v17[5] = v10;

        id v9 = 0;
        goto LABEL_6;
      }
    }
    [(CBDaemonServer *)self->_daemon clearDuplicateFilterCache:v9];
LABEL_6:
  }
  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v16, 8);
}

- (void)_xpcCBSpatialInteractionSessionActivate:(id)a3
{
  uint64_t v69 = 0;
  id v70 = (id *)&v69;
  uint64_t v71 = 0x3032000000;
  id v72 = sub_10004CF3C;
  id v73 = sub_10004CD70;
  id v74 = 0;
  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472;
  v66[2] = sub_1000B9924;
  v66[3] = &unk_100997E48;
  id v68 = &v69;
  v66[4] = self;
  id v6 = a3;
  id v67 = v6;
  unsigned __int8 v7 = objc_retainBlock(v66);
  id v8 = v70;
  id v65 = v70[5];
  id v49 = v7;
  unsigned __int8 v9 = [(CBDaemonXPCConnection *)self _entitledAndReturnError:&v65];
  objc_storeStrong(v8 + 5, v65);
  if (v9)
  {
    id v10 = objc_alloc((Class)CBSpatialInteractionSession);
    id v11 = v70;
    id v64 = v70[5];
    id v12 = [v10 initWithXPCObject:v6 error:&v64];
    objc_storeStrong(v11 + 5, v64);
    if (!v12)
    {
      uint64_t v43 = CBErrorF();
      id v44 = v70[5];
      v70[5] = (id)v43;

LABEL_48:
      goto LABEL_49;
    }
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_1000B9A00;
    v63[3] = &unk_100997208;
    v63[4] = v12;
    v63[5] = self;
    [v12 setAdvertisingAddressChangedHandler:v63];
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_1000B9B34;
    v62[3] = &unk_100999470;
    v62[4] = v12;
    v62[5] = self;
    [v12 setAopDataHandler:v62];
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_1000B9B50;
    v61[3] = &unk_100997208;
    v61[4] = v12;
    v61[5] = self;
    [v12 setBluetoothStateChangedHandler:v61];
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_1000B9BA8;
    v60[3] = &unk_100997370;
    v60[4] = v12;
    v60[5] = self;
    [v12 setDeviceFoundHandler:v60];
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_1000B9BC4;
    v59[3] = &unk_100997370;
    v59[4] = v12;
    v59[5] = self;
    [v12 setDeviceLostHandler:v59];
    id v53 = objc_alloc_init((Class)NSMutableDictionary);
    unsigned int v13 = [v12 clientIrkData];
    if (v13
      && ([v12 clientIrkData],
          id v3 = objc_claimAutoreleasedReturnValue(),
          [v3 length] == (id)16))
    {
      id v52 = [v12 clientIrkData];
    }
    else
    {
      id v52 = NSRandomData();
      if (!v13)
      {
LABEL_8:

        [v12 setIrkData:v52];
        [v53 setObject:v52 forKeyedSubscript:&off_1009E0C50];
        id v14 = [v12 clientIdentifierData];
        if (v14
          && ([v12 clientIdentifierData],
              id v4 = objc_claimAutoreleasedReturnValue(),
              [v4 length] == (id)3))
        {
          uint64_t v51 = [v12 clientIdentifierData];
        }
        else
        {
          uint64_t v51 = NSRandomData();
          if (!v14)
          {
LABEL_13:

            [v12 setIdentifierData:v51];
            [v53 setObject:v51 forKeyedSubscript:&off_1009E0C68];
            id v15 = [v12 uwbTokenFlags];
            if (v15)
            {
              uint64_t v16 = +[NSNumber numberWithUnsignedInt:v15];
              [v53 setObject:v16 forKeyedSubscript:&off_1009E0C80];
            }
            int v58 = 0;
            Data = (void *)OPACKEncoderCreateData();
            if (Data)
            {
              [v12 setTokenData:Data];
              objc_storeStrong((id *)&self->_activatedSpatialInteractionSession, v12);
              if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
              {
                CUPrintPID();
                v47 = id v46 = v12;
                LogPrintF_safe();
              }
              id v18 = objc_alloc_init((Class)CBDiscovery);
              objc_storeStrong((id *)&self->_activatedDiscovery, v18);
              [v18 setBleScanRate:[v12 scanRate]];
              [v18 setBleScanRateScreenOff:[v12 scanRateScreenOff]];
              [v18 setBleRSSIThresholdHint:[v12 bleRSSIThresholdHint]];
              [v18 setBleRSSIThresholdOrder:[v12 bleRSSIThresholdOrder]];
              [v18 setDiscoveryFlags:0x40000];
              id v19 = [v12 filter];
              [v18 setSpatialInteractionfilter:v19];

              if (([v12 controlFlags] & 0x1000) != 0) {
                unint64_t v20 = (unint64_t)[v18 discoveryFlags] | 0x2000000;
              }
              else {
                unint64_t v20 = (unint64_t)[v18 discoveryFlags] & 0xFFFFFFFFFDFFFFFFLL;
              }
              [v18 setDiscoveryFlags:v20, v46, v47];
              if (([v12 controlFlags] & 0x2000) != 0) {
                unint64_t v21 = (unint64_t)[v18 discoveryFlags] | 0x200000000;
              }
              else {
                unint64_t v21 = (unint64_t)[v18 discoveryFlags] & 0xFFFFFFFDFFFFFFFFLL;
              }
              [v18 setDiscoveryFlags:v21];
              if (([v12 controlFlags] & 0x10) != 0) {
                unint64_t v22 = [v18 internalFlags] | 0x10;
              }
              else {
                unint64_t v22 = (unint64_t)[v18 internalFlags] & 0xFFFFFFEF;
              }
              [v18 setInternalFlags:v22];
              unsigned __int16 v23 = (unsigned __int16)[v12 controlFlags];
              id v24 = v18;
              id v25 = [v24 discoveryTypesInternalPtr];
              if ((v23 & 0x8000) != 0) {
                char v26 = v25[4] | 0x80;
              }
              else {
                char v26 = v25[4] & 0x7F;
              }
              v25[4] = v26;
              v57[0] = _NSConcreteStackBlock;
              v57[1] = 3221225472;
              v57[2] = sub_1000B9BE0;
              v57[3] = &unk_100997370;
              v57[4] = v24;
              v57[5] = self;
              [v24 setDeviceFoundHandler:v57];
              v56[0] = _NSConcreteStackBlock;
              v56[1] = 3221225472;
              v56[2] = sub_1000B9C00;
              v56[3] = &unk_100997370;
              v56[4] = v24;
              v56[5] = self;
              [v24 setDeviceLostHandler:v56];
              v55[0] = _NSConcreteStackBlock;
              v55[1] = 3221225472;
              v55[2] = sub_1000B9C28;
              v55[3] = &unk_100997208;
              v55[4] = v24;
              v55[5] = self;
              [v24 setSystemOverrideHandler:v55];
              id v27 = +[CBMetricsDaemon sharedCBMetricsDaemon];
              [v27 reportCBDiscovery:v24 daemonCnx:self action:@"strt"];

              [(CBDaemonServer *)self->_daemon scheduleSpatialUpdateImmediate:1];
              id v48 = v6;
              id v28 = CUXPCDictionaryCreateReply();
              if (v28)
              {
                xpc_dictionary_set_int64(v28, "pwrS", [(CBDaemonXPCConnection *)self _powerStateForClient]);
                id v50 = Data;
                unsigned int v29 = [(CBDaemonServer *)self->_daemon supportsNCSecondaryAdvertisingInstance];
                daemon = self->_daemon;
                if (v29)
                {
                  id v31 = [(CBDaemonServer *)daemon addressMonitor];
                  [v31 nonConnectableSecondaryAddressData];
                }
                else
                {
                  id v31 = [(CBDaemonServer *)daemon addressMonitor];
                  [v31 nonConnectableAddressData];
                id v32 = };

                [v12 setAdvertisingAddressData:v32];
                if ([(CBDaemonServer *)self->_daemon supportsNCSecondaryAdvertisingInstance])
                {
                  id v33 = "aaNC2";
                }
                else
                {
                  id v33 = "aaNC";
                }
                if (v32)
                {
                  id v34 = v32;
                  id v35 = v28;
                  id v36 = (const char *)[v34 bytes];
                  id v37 = [v34 length];
                  if (!v36) {
                    id v36 = "";
                  }

                  xpc_dictionary_set_data(v35, v33, v36, (size_t)v37);
                }
                id v38 = v50;
                id v39 = v28;
                id v40 = (const char *)[v38 bytes];
                id v41 = [v38 length];
                if (!v40) {
                  id v40 = "";
                }

                xpc_dictionary_set_data(v39, "siTD", v40, (size_t)v41);
                [(CBDaemonXPCConnection *)self _xpcSendReply:v39];
                self->_spatialActivateResponded = 1;
                uint64_t v42 = [(CBDaemonServer *)self->_daemon deviceMap];
                v54[0] = _NSConcreteStackBlock;
                v54[1] = 3221225472;
                v54[2] = sub_1000B9CDC;
                v54[3] = &unk_100997D58;
                v54[4] = self;
                [v42 enumerateKeysAndObjectsUsingBlock:v54];

                Data = v50;
              }
              else if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
              {
                LogPrintF_safe();
              }

              id v6 = v48;
            }
            else
            {
              uint64_t v45 = CBErrorF();
              id v24 = v70[5];
              v70[5] = (id)v45;
            }

            unsigned __int8 v7 = v49;
            goto LABEL_48;
          }
        }

        goto LABEL_13;
      }
    }

    goto LABEL_8;
  }
LABEL_49:
  ((void (*)(void *))v7[2])(v7);

  _Block_object_dispose(&v69, 8);
}

- (void)_xpcCBSpatialInteractionSessionUpdate:(id)a3
{
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = sub_10004CF3C;
  id v31 = sub_10004CD70;
  id v32 = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000BA0D0;
  v24[3] = &unk_100997E48;
  char v26 = &v27;
  v24[4] = self;
  id v4 = a3;
  id v25 = v4;
  unsigned __int8 v5 = objc_retainBlock(v24);
  id v6 = (id *)(v28 + 5);
  id obj = (id)v28[5];
  unsigned __int8 v7 = [(CBDaemonXPCConnection *)self _entitledAndReturnError:&obj];
  objc_storeStrong(v6, obj);
  if (v7)
  {
    id v8 = objc_alloc((Class)CBSpatialInteractionSession);
    unsigned __int8 v9 = (id *)(v28 + 5);
    id v22 = (id)v28[5];
    id v10 = [v8 initWithXPCObject:v4 error:&v22];
    objc_storeStrong(v9, v22);
    if (v10)
    {
      id v11 = self->_activatedSpatialInteractionSession;
      id v12 = v11;
      if (v11)
      {
        unsigned int v13 = [(CBSpatialInteractionSession *)v11 updateWithSession:v10];
        if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
        {
          CUPrintPID();
          unint64_t v21 = v20 = v12;
          LogPrintF_safe();
        }
        id v14 = self->_activatedDiscovery;
        if (([(CBSpatialInteractionSession *)v12 controlFlags] & 0x1000) != 0) {
          unint64_t v15 = (unint64_t)[(CBDiscovery *)v14 discoveryFlags] | 0x2000000;
        }
        else {
          unint64_t v15 = (unint64_t)[(CBDiscovery *)v14 discoveryFlags] & 0xFFFFFFFFFDFFFFFFLL;
        }
        -[CBDiscovery setDiscoveryFlags:](v14, "setDiscoveryFlags:", v15, v20, v21);
        [(CBDiscovery *)self->_activatedDiscovery setBleScanRate:[(CBSpatialInteractionSession *)v12 scanRate]];
        [(CBDiscovery *)self->_activatedDiscovery setBleScanRateScreenOff:[(CBSpatialInteractionSession *)v12 scanRateScreenOff]];
        [(CBDiscovery *)self->_activatedDiscovery setBleRSSIThresholdHint:[(CBSpatialInteractionSession *)v12 bleRSSIThresholdHint]];
        [(CBDiscovery *)self->_activatedDiscovery setBleRSSIThresholdOrder:[(CBSpatialInteractionSession *)v12 bleRSSIThresholdOrder]];
        if (([(CBSpatialInteractionSession *)v12 controlFlags] & 0x10) != 0) {
          unint64_t v16 = [(CBDiscovery *)v14 internalFlags] | 0x10;
        }
        else {
          unint64_t v16 = (unint64_t)[(CBDiscovery *)v14 internalFlags] & 0xFFFFFFEF;
        }
        [(CBDiscovery *)v14 setInternalFlags:v16];
        if (v13)
        {
          id v17 = +[CBMetricsDaemon sharedCBMetricsDaemon];
          [v17 reportCBDiscovery:v14 daemonCnx:self action:@"updt"];

          [(CBDaemonServer *)self->_daemon scheduleSpatialUpdateImmediate:0];
        }
      }
      else
      {
        uint64_t v19 = CBErrorF();
        id v14 = (CBDiscovery *)v28[5];
        void v28[5] = v19;
      }
    }
    else
    {
      uint64_t v18 = CBErrorF();
      id v12 = (CBSpatialInteractionSession *)v28[5];
      void v28[5] = v18;
    }
  }
  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v27, 8);
}

- (void)_xpcCBSpatialInteractionSessionAddPeerToken:(id)a3
{
  uint64_t v56 = 0;
  id v57 = (id *)&v56;
  uint64_t v58 = 0x3032000000;
  v59 = sub_10004CF3C;
  id v60 = sub_10004CD70;
  id v61 = 0;
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_1000BA71C;
  v53[3] = &unk_100997E48;
  v55 = &v56;
  v53[4] = self;
  id v4 = a3;
  id v54 = v4;
  unsigned __int8 v5 = objc_retainBlock(v53);
  id v6 = v57;
  id obj = v57[5];
  uint64_t v45 = v5;
  unsigned __int8 v7 = [(CBDaemonXPCConnection *)self _entitledAndReturnError:&obj];
  objc_storeStrong(v6 + 5, obj);
  if (v7)
  {
    id v8 = v57;
    id v51 = v57[5];
    unsigned __int8 v9 = [(CBDaemonXPCConnection *)self _spatialInteractionDecodePeerTokenRequest:v4 error:&v51];
    objc_storeStrong(v8 + 5, v51);
    if (!v9)
    {
LABEL_36:

      unsigned __int8 v5 = v45;
      goto LABEL_37;
    }
    id v10 = [v9 irkData];
    id v11 = v57 + 5;
    id v50 = v57[5];
    uint64_t v62 = 0;
    int v12 = CUXPCDecodeUInt64RangedEx();
    if (v12 == 6) {
      uint64_t v13 = v62;
    }
    else {
      uint64_t v13 = 0;
    }
    objc_storeStrong(v11, v50);
    if (v12 == 5)
    {
LABEL_35:

      goto LABEL_36;
    }
    if (!v13)
    {
      uint64_t v35 = CBErrorF();
      id v44 = v57[5];
      v57[5] = (id)v35;

      goto LABEL_35;
    }
    [v9 setPeerID:v13];
    uint64_t v43 = self->_activatedSpatialInteractionSession;
    if (v43)
    {
      id v14 = (char *)[(NSMutableArray *)self->_spatialPeers count];
      id v46 = v4;
      uint64_t v42 = v13;
      if (v14)
      {
        unint64_t v15 = 0;
        id v16 = 0;
        id v17 = v14 - 1;
        do
        {
          uint64_t v19 = [(NSMutableArray *)self->_spatialPeers objectAtIndexedSubscript:v15];
          unint64_t v20 = [v19 irkData];
          unsigned __int8 v21 = [v20 isEqual:v10];

          if (v21)
          {
            id v22 = v19;

            [(NSMutableArray *)self->_spatialPeers setObject:v9 atIndexedSubscript:v15];
            id v16 = v22;
          }

          if (v17 == v15++) {
            char v24 = 1;
          }
          else {
            char v24 = v21;
          }
        }
        while ((v24 & 1) == 0);
        id v4 = v46;
        if (v16)
        {
          unsigned int v25 = [v16 peerID];
          spatialDeviceMapMatched = self->_spatialDeviceMapMatched;
          v47[0] = _NSConcreteStackBlock;
          v47[1] = 3221225472;
          v47[2] = sub_1000BA7F8;
          v47[3] = &unk_100999490;
          unsigned int v48 = v25;
          int v49 = v42;
          [(NSMutableDictionary *)spatialDeviceMapMatched enumerateKeysAndObjectsUsingBlock:v47];
          uint64_t v27 = "replaced";
LABEL_23:
          id v31 = [v9 identifierData];
          if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
          {
            id v32 = [v9 irkData];
            id v33 = CUPrintNSObjectMasked();
            id v40 = CUPrintPID();
            id v41 = v27;
            id v38 = v33;
            uint64_t v39 = v42;
            id v37 = v31;
            LogPrintF_safe();
          }
          id v4 = v46;
          id v34 = CUXPCDictionaryCreateReply();
          if (v34)
          {
            [(CBDaemonXPCConnection *)self _xpcSendReply:v34];
          }
          else if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
          [(CBDaemonXPCConnection *)self _spatialInteractionReevaluateDevices];

          goto LABEL_34;
        }
      }
      if ((unint64_t)[(NSMutableArray *)self->_spatialPeers count] < 0x1E)
      {
        spatialPeers = self->_spatialPeers;
        if (!spatialPeers)
        {
          uint64_t v29 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
          id v30 = self->_spatialPeers;
          self->_spatialPeers = v29;

          spatialPeers = self->_spatialPeers;
        }
        [(NSMutableArray *)spatialPeers addObject:v9];
        id v16 = 0;
        uint64_t v27 = "added";
        goto LABEL_23;
      }
    }
    uint64_t v36 = CBErrorF();
    id v16 = v57[5];
    v57[5] = (id)v36;
LABEL_34:

    goto LABEL_35;
  }
LABEL_37:
  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v56, 8);
}

- (void)_xpcCBSpatialInteractionSessionRemovePeerToken:(id)a3
{
  uint64_t v44 = 0;
  uint64_t v45 = (id *)&v44;
  uint64_t v46 = 0x3032000000;
  uint64_t v47 = sub_10004CF3C;
  unsigned int v48 = sub_10004CD70;
  id v49 = 0;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1000BAD54;
  v41[3] = &unk_100997E48;
  uint64_t v43 = &v44;
  v41[4] = self;
  id v4 = a3;
  id v42 = v4;
  id v34 = objc_retainBlock(v41);
  unsigned __int8 v5 = v45;
  id obj = v45[5];
  unsigned __int8 v6 = [(CBDaemonXPCConnection *)self _entitledAndReturnError:&obj];
  objc_storeStrong(v5 + 5, obj);
  if (v6)
  {
    unsigned __int8 v7 = v45 + 5;
    id v39 = v45[5];
    id v8 = [(CBDaemonXPCConnection *)self _spatialInteractionDecodePeerTokenRequest:v4 error:&v39];
    objc_storeStrong(v7, v39);
    if (v8)
    {
      unsigned __int8 v9 = [v8 irkData];
      id v33 = self->_activatedSpatialInteractionSession;
      if (!v33) {
        goto LABEL_8;
      }
      id v10 = [(NSMutableArray *)self->_spatialPeers count];
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = 0;
      while (1)
      {
        int v12 = [(NSMutableArray *)self->_spatialPeers objectAtIndexedSubscript:v11];
        uint64_t v13 = [v12 irkData];
        unsigned __int8 v14 = [v13 isEqual:v9];

        if (v14) {
          break;
        }

        if (v10 == (id)++v11) {
          goto LABEL_8;
        }
      }
      id v16 = v12;
      [(NSMutableArray *)self->_spatialPeers removeObjectAtIndex:v11];

      if (v16)
      {
        id v17 = [v16 peerID];
        if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
        {
          id v31 = [v16 identifierData];
          uint64_t v18 = [v16 irkData];
          uint64_t v19 = CUPrintNSObjectMasked();
          CUPrintPID();
          v29 = id v28 = v17;
          char v26 = v31;
          uint64_t v27 = v19;
          LogPrintF_safe();
        }
        unint64_t v20 = CUXPCDictionaryCreateReply();
        if (v20)
        {
          [(CBDaemonXPCConnection *)self _xpcSendReply:v20];
        }
        else if (dword_1009F85F0 <= 90 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
        id v30 = v8;
        id v32 = v4;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        unsigned __int8 v21 = [(NSMutableDictionary *)self->_spatialDeviceMapMatched allValues];
        id v22 = [v21 countByEnumeratingWithState:&v35 objects:v50 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v36;
          do
          {
            for (uint64_t i = 0; i != v22; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v36 != v23) {
                objc_enumerationMutation(v21);
              }
              unsigned int v25 = *(void **)(*((void *)&v35 + 1) + 8 * i);
              if ([v25 spatialInteractionPeerID] == v17) {
                [(CBDaemonXPCConnection *)self _spatialInteractionDeviceLost:v25 removeUnmatched:0 reason:"removed token"];
              }
            }
            id v22 = [v21 countByEnumeratingWithState:&v35 objects:v50 count:16];
          }
          while (v22);
        }

        id v8 = v30;
        id v4 = v32;
      }
      else
      {
LABEL_8:
        uint64_t v15 = CBErrorF();
        id v16 = v45[5];
        v45[5] = (id)v15;
      }
    }
  }
  ((void (*)(void *))v34[2])(v34);

  _Block_object_dispose(&v44, 8);
}

- (void)_spatialInteractionDeviceFound:(id)a3 checkOnly:(BOOL)a4
{
  id v133 = a3;
  v114 = [v133 identifier];
  if (!v114) {
    goto LABEL_150;
  }
  id v120 = [v133 btAddressData];
  if ([v120 length] != (id)6) {
    goto LABEL_149;
  }
  unsigned __int8 v6 = [v133 spatialInteractionIdentifiers];
  long long v115 = self->_activatedSpatialInteractionSession;
  uint64_t v125 = self;
  uint64_t v119 = v6;
  BOOL v113 = a4;
  if (([(CBSpatialInteractionSession *)v115 controlFlags] & 0x3E0) != 0)
  {
    unsigned __int8 v7 = [v6 firstObject];
    if ([v7 length] == (id)3)
    {
      long long v151 = 0u;
      long long v152 = 0u;
      long long v149 = 0u;
      long long v150 = 0u;
      id obj = [(CBDaemonServer *)self->_daemon identityArray];
      id v8 = [obj countByEnumeratingWithState:&v149 objects:v169 count:16];
      if (v8)
      {
        id v9 = v8;
        int v134 = 0;
        char v10 = 0;
        uint64_t v11 = *(void *)v150;
        v129 = v7;
        do
        {
          int v12 = 0;
          do
          {
            if (*(void *)v150 != v11) {
              objc_enumerationMutation(obj);
            }
            uint64_t v13 = *(void **)(*((void *)&v149 + 1) + 8 * (void)v12);
            if ([v13 verifyAuthTag:v7 data:v120 type:2 error:0])
            {
              [v133 setInternalFlags:[v133 internalFlags] | 8];
              [v133 updateWithRPIdentity:v13];
              unsigned int v15 = [(CBSpatialInteractionSession *)v115 matchesWithDevice:v133];
              if (self->_isHomePod)
              {
                id v16 = sub_1000BBCA0();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315650;
                  uint64_t v23 = "no";
                  if (v15) {
                    uint64_t v23 = "yes";
                  }
                  uint64_t v155 = (uint64_t)v23;
                  __int16 v156 = 2112;
                  id v157 = v133;
                  __int16 v158 = 2112;
                  uint64_t v159 = (uint64_t)v13;
                  _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Spatial found match sys: match %s, %@, %@", buf, 0x20u);
                }

                unsigned __int8 v7 = v129;
              }
              else if (dword_1009F85F0 <= 20 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
              {
                uint64_t v18 = "no";
                if (v15) {
                  uint64_t v18 = "yes";
                }
                v105 = v133;
                id v107 = v13;
                uint64_t v102 = v18;
                LogPrintF_safe();
              }
              int v22 = v134;
              if (v15) {
                int v22 = 1;
              }
              int v134 = v22;
              if (v15) {
                char v10 = 1;
              }
            }
            else if (self->_isHomePod)
            {
              id v17 = sub_1000BBCA0();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              {
                id v24 = v120;
                [v24 bytes];
                [v24 length];
                unsigned int v25 = CUPrintHex();
                char v26 = [v13 deviceIRKData];
                uint64_t v27 = CUPrintNSObjectMasked();
                *(_DWORD *)buf = 138413058;
                uint64_t v155 = (uint64_t)v25;
                __int16 v156 = 2112;
                id v157 = v27;
                __int16 v158 = 2112;
                uint64_t v159 = (uint64_t)v133;
                __int16 v160 = 2112;
                v161 = (const char *)v13;
                _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Spatial found check sys: SRC <%@>, IRK %@, match no, %@, %@", buf, 0x2Au);

                unsigned __int8 v7 = v129;
                self = v125;
              }
            }
            else if (dword_1009F85F0 <= 5 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
            {
              id v19 = v120;
              [v19 bytes];
              [v19 length];
              CUPrintHex();
              unint64_t v20 = (char *)objc_claimAutoreleasedReturnValue();
              unsigned __int8 v21 = [v13 deviceIRKData];
              CUPrintNSObjectMasked();
              id v107 = v133;
              long long v109 = v13;
              v105 = uint64_t v102 = v20;
              LogPrintF_safe();

              unsigned __int8 v7 = v129;
              self = v125;
            }
            int v12 = (char *)v12 + 1;
          }
          while (v9 != v12);
          id v28 = [obj countByEnumeratingWithState:&v149 objects:v169 count:16];
          id v9 = v28;
        }
        while (v28);
      }
      else
      {
        LOBYTE(v134) = 0;
        char v10 = 0;
      }

      unsigned __int8 v6 = v119;
      char v29 = v134;
    }
    else
    {
      char v29 = 0;
      char v10 = 0;
    }

    int v126 = v29 & 1;
    int v112 = v10 & 1;
  }
  else
  {
    int v126 = 0;
    int v112 = 0;
  }
  id v30 = [(CBSpatialInteractionSession *)v115 identifierData];
  long long v145 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  id v31 = self->_spatialPeers;
  long long v118 = v30;
  id v121 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v145 objects:v168 count:16];
  if (!v121)
  {
    char obja = 0;
    goto LABEL_92;
  }
  char obja = 0;
  uint64_t v32 = *(void *)v146;
  uint64_t v116 = *(void *)v146;
  long long v117 = v31;
  do
  {
    uint64_t v33 = 0;
    do
    {
      if (*(void *)v146 != v32)
      {
        uint64_t v34 = v33;
        objc_enumerationMutation(v31);
        uint64_t v33 = v34;
      }
      uint64_t v123 = v33;
      long long v35 = *(void **)(*((void *)&v145 + 1) + 8 * v33);
      uint64_t v36 = [v35 identifierData];
      long long v37 = (void *)v36;
      if (v36) {
        long long v38 = (void *)v36;
      }
      else {
        long long v38 = v30;
      }
      id v39 = v38;

      id v124 = v39;
      if ([v39 length] != (id)3) {
        goto LABEL_88;
      }
      id v40 = [v35 irkData];
      if ([v40 length] != (id)16) {
        goto LABEL_87;
      }
      char v167 = 0;
      uint64_t v166 = 0;
      id v41 = [v120 bytes];
      __int16 v42 = v41[2];
      LODWORD(v166) = *(_DWORD *)v41;
      WORD2(v166) = v42;
      uint64_t v43 = [v39 bytes];
      char v44 = v43[2];
      HIWORD(v166) = *(_WORD *)v43;
      char v167 = v44;
      [v40 bytes];
      unint64_t v165 = bswap64(SipHash());
      long long v141 = 0u;
      long long v142 = 0u;
      long long v143 = 0u;
      long long v144 = 0u;
      id v135 = v6;
      id v45 = [v135 countByEnumeratingWithState:&v141 objects:v164 count:16];
      if (!v45)
      {
        int v48 = v126;
        goto LABEL_86;
      }
      id v46 = v45;
      id v130 = v35;
      uint64_t v47 = *(void *)v142;
      int v48 = v126;
      do
      {
        id v49 = 0;
        do
        {
          id v50 = v40;
          if (*(void *)v142 != v47) {
            objc_enumerationMutation(v135);
          }
          id v51 = *(void **)(*((void *)&v141 + 1) + 8 * (void)v49);
          if ([v51 length] == (id)3)
          {
            id v53 = (unsigned __int16 *)[v51 bytes];
            BOOL v55 = (unsigned __int16)v165 != *v53 || BYTE2(v165) != *((unsigned __int8 *)v53 + 2);
            if (self->_isHomePod)
            {
              uint64_t v56 = sub_1000BBCA0();
              if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v61 = CUPrintHex();
                v128 = (void *)v61;
                uint64_t v62 = CUPrintNSObjectMasked();
                uint64_t v63 = CUPrintHex();
                *(_DWORD *)buf = 138413314;
                id v64 = "no";
                if (!v55) {
                  id v64 = "yes";
                }
                uint64_t v155 = v61;
                __int16 v156 = 2112;
                id v157 = v62;
                __int16 v158 = 2112;
                uint64_t v159 = v63;
                id v65 = (void *)v63;
                __int16 v160 = 2080;
                v161 = v64;
                __int16 v162 = 2112;
                id v163 = v133;
                _os_log_debug_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEBUG, "Spatial found check token: SRC <%@>, IRK %@, Hash <%@>, match %s, %@", buf, 0x34u);

                self = v125;
              }
              goto LABEL_69;
            }
            if (dword_1009F85F0 <= 10 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
            {
              uint64_t v56 = CUPrintHex();
              CUPrintNSObjectMasked();
              id v57 = v127 = v48;
              uint64_t v58 = CUPrintHex();
              v59 = (void *)v58;
              id v60 = "no";
              if (!v55) {
                id v60 = "yes";
              }
              long long v110 = v60;
              id v111 = v133;
              id v106 = v57;
              uint64_t v108 = v58;
              id v103 = v56;
              LogPrintF_safe();

              self = v125;
              int v48 = v127;
LABEL_69:
            }
            if (!v55)
            {
              [v133 setSpatialInteractionPeerID:[v130 peerID]];
              int v48 = 1;
              char obja = 1;
            }
          }
          id v49 = (char *)v49 + 1;
          id v40 = v50;
        }
        while (v46 != v49);
        id v66 = [v135 countByEnumeratingWithState:&v141 objects:v164 count:16];
        id v46 = v66;
      }
      while (v66);
LABEL_86:
      int v126 = v48;

      id v30 = v118;
      unsigned __int8 v6 = v119;
      uint64_t v32 = v116;
      id v31 = v117;
LABEL_87:

LABEL_88:
      uint64_t v33 = v123 + 1;
    }
    while ((id)(v123 + 1) != v121);
    id v121 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v145 objects:v168 count:16];
  }
  while (v121);
LABEL_92:

  id v67 = v6;
  char v68 = obja;
  if (v113) {
    goto LABEL_148;
  }
  if ((v126 & 1) == 0)
  {
    id v88 = [(NSMutableDictionary *)self->_spatialDeviceMapMatched objectForKeyedSubscript:v114];
    if (v88)
    {
      [(CBDaemonXPCConnection *)self _spatialInteractionDeviceLost:v88 removeUnmatched:0 reason:"no match"];
    }
    else
    {
      spatialDeviceMapUnmatched = self->_spatialDeviceMapUnmatched;
      if (!spatialDeviceMapUnmatched)
      {
        uint64_t v94 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        id v95 = self->_spatialDeviceMapUnmatched;
        self->_spatialDeviceMapUnmatched = v94;

        spatialDeviceMapUnmatched = self->_spatialDeviceMapUnmatched;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](spatialDeviceMapUnmatched, "setObject:forKeyedSubscript:", v133, v114, v103, v106, v108, v110, v111);
      [(NSMutableDictionary *)self->_spatialDeviceMapMatched setObject:0 forKeyedSubscript:v114];
      if (self->_isHomePod)
      {
        id v96 = sub_1000BBCA0();
        char v68 = obja;
        if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG)) {
          sub_100744E28((uint64_t)v133, v96);
        }
      }
      else
      {
        char v68 = obja;
        if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize())) {
          LogPrintF_safe();
        }
      }
    }
    goto LABEL_140;
  }
  id v69 = v133;
  long long v137 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  id v70 = [(NSMutableDictionary *)self->_spatialDeviceMapMatched allValues];
  id v71 = [v70 countByEnumeratingWithState:&v137 objects:v153 count:16];
  if (!v71)
  {

    id v30 = v118;
    id v67 = v119;
    goto LABEL_118;
  }
  id v72 = v71;
  uint64_t v73 = *(void *)v138;
  id v136 = v69;
  while (2)
  {
    uint64_t v74 = 0;
    while (2)
    {
      if (*(void *)v138 != v73) {
        objc_enumerationMutation(v70);
      }
      id v75 = *(void **)(*((void *)&v137 + 1) + 8 * v74);
      unsigned int v77 = [v75 spatialInteractionPeerID];
      if (v77 == [v69 spatialInteractionPeerID])
      {
        id v78 = [v75 idsDeviceID];
        id v79 = [v69 idsDeviceID];
        id v80 = v78;
        id v81 = v79;
        if (v80 != v81)
        {
          id v82 = v81;
          if ((v80 == 0) == (v81 != 0))
          {
          }
          else
          {
            unsigned __int8 v83 = [v80 isEqual:v81];

            self = v125;
            if ((v83 & 1) == 0) {
              goto LABEL_111;
            }
LABEL_105:
            id v84 = [v75 lastSeenTicks:v103, v106, v108, v110, v111];
            if (v84 > [v69 lastSeenTicks])
            {
              id v85 = v75;

              id v136 = v85;
              goto LABEL_111;
            }
            id v86 = [v75 identifier];
            unsigned __int8 v87 = [v86 isEqual:v114];

            if ((v87 & 1) == 0)
            {
              self = v125;
              [(CBDaemonXPCConnection *)v125 _spatialInteractionDeviceLost:v75 removeUnmatched:1 reason:"replaced matched"];
              goto LABEL_111;
            }
          }
          self = v125;
          goto LABEL_111;
        }

        self = v125;
        goto LABEL_105;
      }
LABEL_111:
      char v68 = obja;
      if (v72 != (id)++v74) {
        continue;
      }
      break;
    }
    id v72 = [v70 countByEnumeratingWithState:&v137 objects:v153 count:16];
    if (v72) {
      continue;
    }
    break;
  }

  id v88 = v136;
  id v30 = v118;
  id v67 = v119;
  if (v136 == v69)
  {
LABEL_118:
    spatialDeviceMapMatched = self->_spatialDeviceMapMatched;
    if (!spatialDeviceMapMatched)
    {
      v90 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v91 = self->_spatialDeviceMapMatched;
      self->_spatialDeviceMapMatched = v90;

      spatialDeviceMapMatched = self->_spatialDeviceMapMatched;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](spatialDeviceMapMatched, "setObject:forKeyedSubscript:", v69, v114, v103);
    [(NSMutableDictionary *)self->_spatialDeviceMapUnmatched setObject:0 forKeyedSubscript:v114];
    if (self->_isHomePod)
    {
      uint64_t v92 = sub_1000BBCA0();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG)) {
        sub_100744DB0((uint64_t)v69, v92);
      }

      char v68 = obja;
    }
    else
    {
      char v68 = obja;
      if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
      {
        id v104 = v69;
        LogPrintF_safe();
      }
    }
    uint64_t v97 = [(CBSpatialInteractionSession *)v115 deviceFoundHandler];
    id v98 = (void *)v97;
    if (v97) {
      (*(void (**)(uint64_t, id))(v97 + 16))(v97, v69);
    }

    id v88 = v69;
  }
LABEL_140:

  if (IsAppleInternalBuild())
  {
    if (v112) {
      unsigned int v99 = 2;
    }
    else {
      unsigned int v99 = 1;
    }
    if (v68) {
      uint64_t v100 = 4;
    }
    else {
      uint64_t v100 = v99;
    }
    [(CBDaemonXPCConnection *)self _updateDeviceMapSpatialInteractionDeviceTimestampArrayDictionary:v100 device:v133];
  }
LABEL_148:

LABEL_149:
LABEL_150:
}

- (void)_spatialInteractionDeviceLost:(id)a3 removeUnmatched:(BOOL)a4 reason:(const char *)a5
{
  id v8 = a3;
  id v9 = [v8 identifier];
  if (v9)
  {
    char v10 = [(NSMutableDictionary *)self->_spatialDeviceMapMatched objectForKeyedSubscript:v9];
    [(NSMutableDictionary *)self->_spatialDeviceMapMatched setObject:0 forKeyedSubscript:v9];
    if (a4)
    {
      [(NSMutableDictionary *)self->_spatialDeviceMapUnmatched setObject:0 forKeyedSubscript:v9];
      if (!v10) {
        goto LABEL_22;
      }
    }
    else
    {
      if (!v10)
      {
LABEL_22:

        goto LABEL_23;
      }
      spatialDeviceMapUnmatched = self->_spatialDeviceMapUnmatched;
      if (!spatialDeviceMapUnmatched)
      {
        int v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        uint64_t v13 = self->_spatialDeviceMapUnmatched;
        self->_spatialDeviceMapUnmatched = v12;

        spatialDeviceMapUnmatched = self->_spatialDeviceMapUnmatched;
      }
      [(NSMutableDictionary *)spatialDeviceMapUnmatched setObject:v10 forKeyedSubscript:v9];
    }
    if (self->_isHomePod)
    {
      unsigned __int8 v14 = sub_1000BBCA0();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_100744EA0((uint64_t)v8, (uint64_t)a5, v14);
      }
    }
    else if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
    {
      id v18 = v8;
      id v19 = a5;
      LogPrintF_safe();
    }
    if (IsAppleInternalBuild())
    {
      [(CBDaemonXPCConnection *)self _updateDeviceMapSpatialInteractionDeviceTimestampArrayDictionary:8 device:v8];
    }
    uint64_t v16 = [(CBSpatialInteractionSession *)self->_activatedSpatialInteractionSession deviceLostHandler];
    id v17 = (void *)v16;
    if (v16) {
      (*(void (**)(uint64_t, id))(v16 + 16))(v16, v8);
    }

    goto LABEL_22;
  }
LABEL_23:
}

- (void)_spatialInteractionReevaluateDevices
{
  if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
  {
    id v33 = [(NSMutableDictionary *)self->_spatialDeviceMapMatched count];
    id v34 = [(NSMutableDictionary *)self->_spatialDeviceMapUnmatched count];
    LogPrintF_safe();
  }
  id v3 = [(NSMutableDictionary *)self->_spatialDeviceMapMatched allValues];
  id v4 = [(NSMutableDictionary *)self->_spatialDeviceMapUnmatched allValues];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v47 objects:v54 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v48 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v47 + 1) + 8 * i);
        [(CBDaemonXPCConnection *)self _spatialInteractionDeviceFound:v10 checkOnly:1];
      }
      id v7 = [v5 countByEnumeratingWithState:&v47 objects:v54 count:16];
    }
    while (v7);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v12 = v4;
  id v13 = [v12 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v44;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v44 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v43 + 1) + 8 * (void)j);
        [(CBDaemonXPCConnection *)self _spatialInteractionDeviceFound:v17 checkOnly:1];
      }
      id v14 = [v12 countByEnumeratingWithState:&v43 objects:v53 count:16];
    }
    while (v14);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v19 = v5;
  id v20 = [v19 countByEnumeratingWithState:&v39 objects:v52 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v40;
    do
    {
      for (k = 0; k != v21; k = (char *)k + 1)
      {
        if (*(void *)v40 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v39 + 1) + 8 * (void)k);
        [(CBDaemonXPCConnection *)self _spatialInteractionDeviceFound:v24 checkOnly:0];
      }
      id v21 = [v19 countByEnumeratingWithState:&v39 objects:v52 count:16];
    }
    while (v21);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v26 = v12;
  id v27 = [v26 countByEnumeratingWithState:&v35 objects:v51 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v36;
    do
    {
      for (m = 0; m != v28; m = (char *)m + 1)
      {
        if (*(void *)v36 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = *(void *)(*((void *)&v35 + 1) + 8 * (void)m);
        [(CBDaemonXPCConnection *)self _spatialInteractionDeviceFound:v31 checkOnly:0];
      }
      id v28 = [v26 countByEnumeratingWithState:&v35 objects:v51 count:16];
    }
    while (v28);
  }
}

- (id)_spatialInteractionDecodePeerTokenRequest:(id)a3 error:(id *)a4
{
  if (CUXPCDecodeNSData() && a4)
  {
    CBErrorF();
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (void)_updateDeviceMapSpatialInteractionDeviceTimestampArrayDictionary:(unsigned __int8)a3 device:(id)a4
{
  int v4 = a3;
  id v6 = a4;
  unsigned int v7 = [(CBSpatialInteractionSession *)self->_activatedSpatialInteractionSession clientID];
  if (v4 && v6 && v7)
  {
    uint64_t v8 = [(CBDaemonServer *)self->_daemon deviceMap];
    id v9 = [v6 identifier];
    uint64_t v10 = [v8 objectForKeyedSubscript:v9];

    if (v10)
    {
      dispatchQueue = self->_dispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000BC558;
      block[3] = &unk_1009994B8;
      block[4] = self;
      id v13 = v10;
      char v14 = v4;
      dispatch_async(dispatchQueue, block);
    }
  }
}

- (void)_xpcAdvertisingAddressChanged
{
  id xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(xdict, "mTyp", "AdAC");
  id v3 = [(CBDaemonServer *)self->_daemon addressMonitor];
  int v4 = [v3 connectableAddressData];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    id v7 = xdict;
    uint64_t v8 = (const char *)[v6 bytes];
    if (v8) {
      id v9 = v8;
    }
    else {
      id v9 = "";
    }
    xpc_dictionary_set_data(v7, "aaCN", v9, (size_t)[v6 length]);
  }
  uint64_t v10 = [(CBDaemonServer *)self->_daemon addressMonitor];
  uint64_t v11 = [v10 nonConnectableAddressData];
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
    id v14 = xdict;
    uint64_t v15 = (const char *)[v13 bytes];
    if (v15) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = "";
    }
    xpc_dictionary_set_data(v14, "aaNC", v16, (size_t)[v13 length]);
  }
  uint64_t v17 = [(CBDaemonServer *)self->_daemon addressMonitor];
  id v18 = [v17 nonConnectableSecondaryAddressData];
  id v19 = v18;
  if (v18)
  {
    id v20 = v18;
    id v21 = xdict;
    uint64_t v22 = (const char *)[v20 bytes];
    if (v22) {
      uint64_t v23 = v22;
    }
    else {
      uint64_t v23 = "";
    }
    xpc_dictionary_set_data(v21, "aaNC2", v23, (size_t)[v20 length]);
  }
  if ([(CBDaemonServer *)self->_daemon supportsNCSecondaryAdvertisingInstance]) {
    xpc_dictionary_set_BOOL(xdict, "aaUNC2", 1);
  }
  [(CBDaemonXPCConnection *)self _xpcSendEvent:xdict];
}

- (void)_xpcDeviceFound:(id)a3
{
  id v4 = a3;
  id v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "mTyp", "DvFo");
  [v4 encodeWithXPCObject:v5];

  [(CBDaemonXPCConnection *)self _xpcSendEvent:v5];
}

- (void)_xpcDeviceLost:(id)a3
{
  id v4 = a3;
  id v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "mTyp", "DvLo");
  [v4 encodeWithXPCObject:v5];

  [(CBDaemonXPCConnection *)self _xpcSendEvent:v5];
}

- (void)_xpcDevicesBuffered:(id)a3
{
  id v4 = a3;
  id v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "mTyp", "DsBf");
  CUXPCEncodeNSArrayOfObjects();

  [(CBDaemonXPCConnection *)self _xpcSendEvent:v5];
}

- (void)_xpcDiscoverableStateChanged:(int)a3
{
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(xdict, "mTyp", "DscC");
  xpc_dictionary_set_int64(xdict, "dsSt", a3);
  [(CBDaemonXPCConnection *)self _xpcSendEvent:xdict];
}

- (void)_xpcInquiryStateChanged:(int)a3
{
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(xdict, "mTyp", "InqC");
  xpc_dictionary_set_int64(xdict, "inqS", a3);
  [(CBDaemonXPCConnection *)self _xpcSendEvent:xdict];
}

- (void)_xpcPowerStateChanged:(int64_t)a3
{
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(xdict, "mTyp", "PwrC");
  xpc_dictionary_set_int64(xdict, "pwrS", a3);
  [(CBDaemonXPCConnection *)self _xpcSendEvent:xdict];
}

- (void)xpcReceivedAudioAccessoryEventType:(unsigned __int8)a3 messageData:(id)a4 sourceDevice:(id)a5
{
  unsigned int v6 = a3;
  id v16 = a4;
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v9, "mTyp", "AcRc");
  if (v6) {
    xpc_dictionary_set_uint64(v9, "acET", v6);
  }
  if (v16)
  {
    id v10 = v16;
    id v11 = v9;
    id v12 = v10;
    id v13 = (const char *)[v12 bytes];
    if (v13) {
      id v14 = v13;
    }
    else {
      id v14 = "";
    }
    id v15 = [v12 length];

    xpc_dictionary_set_data(v11, "acMd", v14, (size_t)v15);
  }
  CUXPCEncodeObject();
  [(CBDaemonXPCConnection *)self _xpcSendEvent:v9];
}

- (void)xpcReceivedAudioAccessoryDeviceInfoChange:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(xdict, "mTyp", "AcIC");
  xpc_dictionary_set_value(xdict, "aaID", v5);

  [(CBDaemonXPCConnection *)self _xpcSendEvent:xdict];
}

- (void)_xpcReceivedRelayMessageType:(unsigned __int8)a3 messageData:(id)a4 conduitDevice:(id)a5 sourceDevice:(id)a6
{
  unsigned int v8 = a3;
  id v19 = a4;
  id v10 = a5;
  id v11 = a6;
  xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v12, "mTyp", "RlMR");
  if (v8) {
    xpc_dictionary_set_uint64(v12, "rlMT", v8);
  }
  if (v19)
  {
    id v13 = v19;
    id v14 = v12;
    id v15 = v13;
    id v16 = (const char *)[v15 bytes];
    if (v16) {
      uint64_t v17 = v16;
    }
    else {
      uint64_t v17 = "";
    }
    id v18 = [v15 length];

    xpc_dictionary_set_data(v14, "rlMD", v17, (size_t)v18);
  }
  CUXPCEncodeObject();
  CUXPCEncodeObject();

  [(CBDaemonXPCConnection *)self _xpcSendEvent:v12];
}

- (void)_xpcSpatialInteractionAOPDataReceived:(id)a3
{
  id v11 = a3;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "mTyp", "SpAD");
  if (v11)
  {
    id v5 = v11;
    id v6 = v4;
    id v7 = v5;
    unsigned int v8 = (const char *)[v7 bytes];
    if (v8) {
      xpc_object_t v9 = v8;
    }
    else {
      xpc_object_t v9 = "";
    }
    id v10 = [v7 length];

    xpc_dictionary_set_data(v6, "siAD", v9, (size_t)v10);
  }
  [(CBDaemonXPCConnection *)self _xpcSendEvent:v4];
}

- (void)_xpcSystemOverrideChanged
{
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(xdict, "mTyp", "SyOC");
  xpc_dictionary_set_int64(xdict, "scRO", (int)[(CBDiscovery *)self->_activatedDiscovery bleScanRateOverride]);
  xpc_dictionary_set_uint64(xdict, "syOF", [(CBDiscovery *)self->_activatedDiscovery systemOverrideFlags]);
  [(CBDaemonXPCConnection *)self _xpcSendEvent:xdict];
}

- (void)_xpcTipiChanged:(id)a3
{
  id v4 = a3;
  id v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "mTyp", "TpiC");
  CUXPCEncodeObject();

  [(CBDaemonXPCConnection *)self _xpcSendEvent:v5];
}

- (void)_setupWHBTimer
{
  if (!self->_activatedDiscoveryWHB)
  {
    p_whbTimer = &self->_whbTimer;
    id v4 = self->_whbTimer;
    if (!v4)
    {
      dispatch_source_t v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      objc_storeStrong((id *)p_whbTimer, v5);
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1000BD3BC;
      v8[3] = &unk_100997208;
      id v4 = v5;
      xpc_object_t v9 = v4;
      id v10 = self;
      dispatch_source_set_event_handler((dispatch_source_t)v4, v8);
      CUDispatchTimerSet();
      dispatch_activate((dispatch_object_t)self->_whbTimer);
      if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
    }
    if (!self->_whbLostDevicesMap)
    {
      id v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      whbLostDevicesMap = self->_whbLostDevicesMap;
      self->_whbLostDevicesMap = v6;
    }
  }
}

- (void)_whbTimerFired
{
  if (dword_1009F85F0 <= 20 && (dword_1009F85F0 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  activatedDiscovery = self->_activatedDiscovery;
  if (activatedDiscovery)
  {
    uint64_t v17 = activatedDiscovery;
  }
  else
  {
    uint64_t v17 = self->_activatedDiscoveryWHB;
    if (!v17) {
      return;
    }
  }
  mach_absolute_time();
  uint64_t v4 = UpTicksToSeconds();
  dispatch_source_t v5 = [(NSMutableDictionary *)self->_whbLostDevicesMap allKeys];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v18 + 1) + 8 * i);
        id v11 = [(NSMutableDictionary *)self->_whbLostDevicesMap objectForKeyedSubscript:v10];
        xpc_object_t v12 = v11;
        if (v11 && (unint64_t)(v4 - (void)[v11 unsignedLongLongValue]) >= 0x2D)
        {
          id v13 = [(NSMutableDictionary *)self->_deviceMap objectForKeyedSubscript:v10];
          if (v13)
          {
            if (dword_1009F85F0 <= 30 && (dword_1009F85F0 != -1 || _LogCategory_Initialize()))
            {
              id v16 = v13;
              LogPrintF_safe();
            }
            uint64_t v14 = [(CBDiscovery *)v17 deviceLostHandler];
            id v15 = (void *)v14;
            if (v14) {
              (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v13);
            }

            [(NSMutableDictionary *)self->_deviceMap setObject:0 forKeyedSubscript:v10];
          }
          [(NSMutableDictionary *)self->_whbLostDevicesMap removeObjectForKey:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
  if (self->_whbTimer) {
    CUDispatchTimerSet();
  }
}

- (void)whbStop
{
  whbTimer = self->_whbTimer;
  if (whbTimer)
  {
    dispatch_source_t v5 = whbTimer;
    dispatch_source_cancel(v5);
    uint64_t v4 = self->_whbTimer;
    self->_whbTimer = 0;
  }
}

- (void)setActivatedAdvertiser:(id)a3
{
}

- (CBConnection)activatedConnection
{
  return self->_activatedConnection;
}

- (void)setActivatedConnection:(id)a3
{
}

- (CBController)activatedController
{
  return self->_activatedController;
}

- (void)setActivatedController:(id)a3
{
}

- (void)setActivatedDiscovery:(id)a3
{
}

- (CBDiscovery)activatedDiscoveryWHB
{
  return self->_activatedDiscoveryWHB;
}

- (void)setActivatedDiscoveryWHB:(id)a3
{
}

- (void)setActivatedSpatialInteractionSession:(id)a3
{
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
}

- (NSMutableDictionary)deviceMap
{
  return self->_deviceMap;
}

- (void)setDeviceMap:(id)a3
{
}

- (CBDaemonServer)daemon
{
  return self->_daemon;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (BOOL)entitled
{
  return self->_entitled;
}

- (void)setEntitled:(BOOL)a3
{
  self->_entitled = a3;
}

- (int)pid
{
  return self->_pid;
}

- (BOOL)remoteAccepted
{
  return self->_remoteAccepted;
}

- (void)setRemoteAccepted:(BOOL)a3
{
  self->_BOOL remoteAccepted = a3;
}

- (RPCompanionLinkClient)remoteClient
{
  return self->_remoteClient;
}

- (void)setRemoteClient:(id)a3
{
}

- (NSNumber)remoteClientID
{
  return self->_remoteClientID;
}

- (void)setRemoteClientID:(id)a3
{
}

- (CBDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (void)setRemoteDevice:(id)a3
{
}

- (OS_xpc_object)xpcCnx
{
  return self->_xpcCnx;
}

- (unint64_t)xpcToken
{
  return self->_xpcToken;
}

- (void)setXpcToken:(unint64_t)a3
{
  self->_unint64_t xpcToken = a3;
}

@end