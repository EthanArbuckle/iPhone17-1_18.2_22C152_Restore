@interface RPNWPeer
+ (const)responseCodeToString:(int)a3;
+ (const)statusCodeToString:(int)a3;
+ (id)createNWEndpointForEndpoint:(id)a3 agentID:(id)a4 applicationService:(id)a5;
+ (id)createNWEndpointWithID:(id)a3 agentID:(id)a4 applicationService:(id)a5;
- (RPNWPeer)init;
- (int)findListenerAndCreateConnection:(id)a3 version:(id)a4 applicationService:(id)a5 listenerID:(id)a6 connectionID:(id)a7;
- (int64_t)_rssiThresholdForApplicationService:(id)a3;
- (void)connectToOneAPIPeer:(id)a3 inboundConnection:(BOOL)a4 applicationService:(id)a5 listenerID:(id)a6 automapListener:(BOOL)a7 connectionID:(id)a8 connectHandler:(id)a9;
- (void)connectToPeer:(id)a3 inboundConnection:(BOOL)a4 controlFlags:(unint64_t)a5 applicationService:(id)a6 listenerID:(id)a7 automapListener:(BOOL)a8 connectionID:(id)a9 connectHandler:(id)a10 lostHandler:(id)a11;
- (void)dealloc;
- (void)handleConnectionData:(BOOL)a3;
- (void)receiveDataForConnection:(id)a3 statusHandler:(id)a4;
- (void)receiveWithRequestID:(id)a3 receiveHandler:(id)a4;
- (void)resolvePeer:(id)a3 controlFlags:(unint64_t)a4 applicationService:(id)a5 clientPublicKey:(id)a6 resolveHandler:(id)a7;
- (void)sendDataForConnection:(id)a3 applicationService:(id)a4 connectionID:(id)a5 responseHandler:(id)a6;
- (void)sendStatusUpdateForConnection:(id)a3 connectionID:(id)a4 status:(int)a5 responseHandler:(id)a6;
- (void)sendWithRequestID:(id)a3 data:(id)a4 status:(int)a5 applicationService:(id)a6 clientPublicKey:(id)a7 listenerID:(id)a8 automapListener:(BOOL)a9 connectionID:(id)a10 responseHandler:(id)a11;
- (void)startDiscovery:(unsigned int)a3 applicationService:(id)a4 controlFlags:(unint64_t)a5 deviceFilter:(id)a6 connectedHandler:(id)a7 updateHandler:(id)a8 lostHandler:(id)a9 invalidationHandler:(id)a10;
- (void)stopDiscovery;
@end

@implementation RPNWPeer

- (RPNWPeer)init
{
  v6.receiver = self;
  v6.super_class = (Class)RPNWPeer;
  v2 = [(RPNWPeer *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)RPNWPeer;
  [(RPNWPeer *)&v2 dealloc];
}

- (void)startDiscovery:(unsigned int)a3 applicationService:(id)a4 controlFlags:(unint64_t)a5 deviceFilter:(id)a6 connectedHandler:(id)a7 updateHandler:(id)a8 lostHandler:(id)a9 invalidationHandler:(id)a10
{
  id v15 = a4;
  id v37 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  p_superclass = &OBJC_METACLASS___RPNWEndpoint.superclass;
  if (dword_100142328 <= 30 && (dword_100142328 != -1 || _LogCategory_Initialize()))
  {
    +[RPNWNetworkAgent getLogInfo];
    v21 = id v35 = v15;
    v22 = self;
    id v23 = objc_alloc_init((Class)NSMutableString);
    [v23 appendFormat:@"%p", v22];

    p_superclass = (__objc2_class **)(&OBJC_METACLASS___RPNWEndpoint + 8);
    v33 = v21;
    id v34 = v23;
    LogPrintF();

    id v15 = v35;
  }
  -[RPNWPeer setControlFlags:](self, "setControlFlags:", a5, v33, v34);
  [(RPNWPeer *)self setDeviceFilter:v37];
  [(RPNWPeer *)self setRssiThreshold:[(RPNWPeer *)self _rssiThresholdForApplicationService:v15]];
  int v24 = _os_feature_enabled_impl();
  if ((a5 & 0x10000) != 0 && v24)
  {
    [(RPNWPeer *)self setBleScreenOffRescanInterval:900];
    unsigned int v25 = a3;
LABEL_13:
    [(RPNWPeer *)self setBleScreenOffScanRate:10];
    goto LABEL_14;
  }
  if (dword_100142328 <= 10 && (dword_100142328 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  unsigned int v25 = a3;
  if ((a5 & 0x10000) != 0) {
    goto LABEL_13;
  }
LABEL_14:
  v26 = [p_superclass + 184 sharedNetworkAgent];
  v27 = [v26 dispatchQueue];
  [(RPNWPeer *)self setDispatchQueue:v27];

  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100089E74;
  v44[3] = &unk_100123F68;
  unsigned int v47 = v25;
  id v45 = v16;
  unint64_t v46 = a5;
  id v28 = v16;
  [(RPNWPeer *)self setDeviceFoundHandler:v44];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_10008A0EC;
  v42[3] = &unk_100123F90;
  id v43 = v17;
  id v29 = v17;
  [(RPNWPeer *)self setDeviceChangedHandler:v42];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10008A104;
  v40[3] = &unk_100123FB8;
  id v41 = v18;
  id v30 = v18;
  [(RPNWPeer *)self setDeviceLostHandler:v40];
  [(RPNWPeer *)self setInvalidationHandler:v19];
  v31 = [(RPNWPeer *)self invalidationHandler];
  [(RPNWPeer *)self setInterruptionHandler:v31];

  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10008A114;
  v38[3] = &unk_100122D28;
  id v39 = v19;
  id v32 = v19;
  [(RPNWPeer *)self activateWithCompletion:v38];
}

- (void)stopDiscovery
{
  if (dword_100142328 <= 30 && (dword_100142328 != -1 || _LogCategory_Initialize()))
  {
    v3 = self;
    id v4 = objc_alloc_init((Class)NSMutableString);
    [v4 appendFormat:@"%p", v3];

    LogPrintF();
  }

  [(RPNWPeer *)self invalidate];
}

- (void)resolvePeer:(id)a3 controlFlags:(unint64_t)a4 applicationService:(id)a5 clientPublicKey:(id)a6 resolveHandler:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (dword_100142328 <= 30 && (dword_100142328 != -1 || _LogCategory_Initialize()))
  {
    v22 = +[RPNWNetworkAgent getLogInfo];
    id v23 = v12;
    LogPrintF();
  }
  id v16 = +[RPNWNetworkAgent sharedNetworkAgent];
  id v17 = [v16 dispatchQueue];
  [(RPNWPeer *)self setDispatchQueue:v17];

  [(RPNWPeer *)self setDestinationDevice:v12];
  [(RPNWPeer *)self setControlFlags:a4];
  if (_os_feature_enabled_impl()) {
    [(RPNWPeer *)self setServiceType:v13];
  }
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10008A4D4;
  v24[3] = &unk_100124008;
  id v28 = v14;
  id v29 = v15;
  id v25 = v12;
  v26 = self;
  id v27 = v13;
  id v18 = v14;
  id v19 = v13;
  id v20 = v15;
  id v21 = v12;
  [(RPNWPeer *)self activateWithCompletion:v24];
}

- (void)connectToOneAPIPeer:(id)a3 inboundConnection:(BOOL)a4 applicationService:(id)a5 listenerID:(id)a6 automapListener:(BOOL)a7 connectionID:(id)a8 connectHandler:(id)a9
{
  BOOL v13 = a4;
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = a9;
  id v20 = v19;
  if (v18 && v13)
  {
    (*((void (**)(id, uint64_t, void))v19 + 2))(v19, 2, 0);
  }
  else
  {
    if (v18) {
      CFStringRef v21 = @"com.apple.oneapi.connection";
    }
    else {
      CFStringRef v21 = @"com.apple.oneapi.browsing";
    }
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10008A830;
    v23[3] = &unk_100124030;
    id v24 = v15;
    id v25 = v20;
    LOBYTE(v22) = a7;
    [(RPNWPeer *)self sendWithRequestID:v21 data:0 status:0 applicationService:v16 clientPublicKey:0 listenerID:v17 automapListener:v22 connectionID:v18 responseHandler:v23];
  }
}

- (void)connectToPeer:(id)a3 inboundConnection:(BOOL)a4 controlFlags:(unint64_t)a5 applicationService:(id)a6 listenerID:(id)a7 automapListener:(BOOL)a8 connectionID:(id)a9 connectHandler:(id)a10 lostHandler:(id)a11
{
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  if (dword_100142328 <= 30 && (dword_100142328 != -1 || _LogCategory_Initialize()))
  {
    id v30 = +[RPNWNetworkAgent getLogInfo];
    id v31 = v15;
    LogPrintF();
  }
  CFStringRef v21 = +[RPNWNetworkAgent sharedNetworkAgent];
  uint64_t v22 = [v21 dispatchQueue];
  [(RPNWPeer *)self setDispatchQueue:v22];

  [(RPNWPeer *)self setDestinationDevice:v15];
  if (a5) {
    unint64_t v23 = a5;
  }
  else {
    unint64_t v23 = 32774;
  }
  [(RPNWPeer *)self setControlFlags:v23];
  if (_os_feature_enabled_impl() && !a4) {
    [(RPNWPeer *)self setServiceType:v16];
  }
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10008AB94;
  v34[3] = &unk_100124058;
  id v35 = v15;
  v36 = self;
  id v40 = v19;
  id v41 = v20;
  BOOL v42 = a4;
  id v37 = v16;
  id v38 = v17;
  BOOL v43 = a8;
  id v39 = v18;
  id v24 = v18;
  id v25 = v17;
  id v26 = v16;
  id v27 = v20;
  id v28 = v19;
  id v29 = v15;
  [(RPNWPeer *)self activateWithCompletion:v34];
}

- (int)findListenerAndCreateConnection:(id)a3 version:(id)a4 applicationService:(id)a5 listenerID:(id)a6 connectionID:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (dword_100142328 <= 40 && (dword_100142328 != -1 || _LogCategory_Initialize()))
  {
    id v32 = v13;
    id v35 = v11;
    LogPrintF();
  }
  id v16 = +[RPNWListener findListenerForID:applicationService:fromPeer:](RPNWListener, "findListenerForID:applicationService:fromPeer:", v14, v13, v11, v32, v35);
  id v17 = v16;
  if (v16)
  {
    uint64_t v18 = [v16 getConnectionWithID:v15];
    if (v18)
    {
      id v19 = (RPNWConnection *)v18;
      if (dword_100142328 > 40 || dword_100142328 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_22;
      }
      v33 = v19;
    }
    else
    {
      id v20 = [RPNWConnection alloc];
      CFStringRef v21 = +[NSUUID UUID];
      id v19 = [(RPNWConnection *)v20 initWithPeer:v11 version:v12 inbound:1 internal:1 applicationService:v13 connectionID:v15 endpointID:v21];

      [v17 addIncomingConnection:v19];
      if (dword_100142328 > 30 || dword_100142328 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_22;
      }
      v33 = v19;
      v36 = v17;
    }
    LogPrintF();
LABEL_22:
    memset(buffer, 0, 96);
    if (proc_pidinfo((int)objc_msgSend(v17, "pid", v33, v36), 4, 0, buffer, 96) == 96)
    {
      if (dword_100142328 <= 30 && (dword_100142328 != -1 || _LogCategory_Initialize()))
      {
        id v34 = [v17 pid];
        LogPrintF();
      }
      uint64_t v23 = [v17 agentClient:v34];
      if (v23)
      {
        id v24 = (void *)v23;
        if (dword_100142328 <= 30 && (dword_100142328 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        [(RPNWConnection *)v19 setIsConnected:1];
        if ([v17 hasTriggeredConnection])
        {
          if (dword_100142328 <= 30 && (dword_100142328 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
        }
        else
        {
          id v25 = v12;
          if (dword_100142328 <= 30 && (dword_100142328 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          id v29 = [v24 listen_framer];
          +[RPNWFramer startConnection:v29];

          [v17 markConnectionAsTriggered:v19];
          id v12 = v25;
        }
        [v12 doubleValue];
        if (v30 >= 2.0) {
          int v22 = 1;
        }
        else {
          int v22 = 2;
        }
      }
      else
      {
        id v40 = v12;
        if (dword_100142328 <= 30 && (dword_100142328 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        id v38 = [(RPNWConnection *)v19 peer];
        id v39 = [(RPNWConnection *)v19 peer];
        id v26 = [v39 destinationDevice];
        unsigned int v37 = [(RPNWConnection *)v19 inbound];
        id v27 = [(RPNWConnection *)v19 endpointUUID];
        id v28 = [(RPNWConnection *)v19 connectionUUID];
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472;
        v41[2] = sub_10008B520;
        v41[3] = &unk_100124080;
        BOOL v42 = v19;
        [v38 connectToPeer:v26 inboundConnection:v37 controlFlags:0 applicationService:v13 listenerID:v27 automapListener:0 connectionID:v28 connectHandler:v41 lostHandler:&stru_1001240A0];

        id v24 = 0;
        int v22 = 1;
        id v12 = v40;
      }
    }
    else
    {
      if (dword_100142328 <= 30 && (dword_100142328 != -1 || _LogCategory_Initialize()))
      {
        id v34 = [v17 pid];
        LogPrintF();
      }
      id v24 = [v17 agentClient:v34];
      if (dword_100142328 <= 30 && (dword_100142328 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      int v22 = 0;
    }

    goto LABEL_61;
  }
  if (dword_100142328 <= 90 && (dword_100142328 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  int v22 = 0;
LABEL_61:

  return v22;
}

- (void)handleConnectionData:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10008B6DC;
  v3[3] = &unk_100123768;
  BOOL v4 = a3;
  [(RPNWPeer *)self receiveDataForConnection:v3 statusHandler:&stru_1001240C0];
}

+ (id)createNWEndpointWithID:(id)a3 agentID:(id)a4 applicationService:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(RPNWEndpoint);
  [(RPNWEndpoint *)v11 setEndpointUUID:v10];

  id v12 = [a1 createNWEndpointForEndpoint:v11 agentID:v9 applicationService:v8];

  return v12;
}

+ (id)createNWEndpointForEndpoint:(id)a3 agentID:(id)a4 applicationService:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [v9 UTF8String];
  v65[0] = 0;
  v65[1] = 0;
  id v10 = [v7 endpointUUID];
  [v10 getUUIDBytes:v65];

  application_service = (void *)nw_endpoint_create_application_service();
  if (v8)
  {
    v64[0] = 0;
    v64[1] = 0;
    [v8 getUUIDBytes:v64];
    nw_endpoint_set_agent_identifier();
  }
  id v12 = [v7 device];

  if (v12)
  {
    id v13 = [v7 device];
    id v14 = [v13 name];

    if (v14)
    {
      id v15 = [v7 device];
      id v16 = [v15 name];
      [v16 UTF8String];
      nw_endpoint_set_device_name();
    }
    id v17 = [v7 device];
    uint64_t v18 = [v17 contactID];

    if (v18)
    {
      id v19 = [v7 device];
      id v20 = [v19 contactID];
      [v20 UTF8String];
      nw_endpoint_set_contact_id();
    }
    CFStringRef v21 = [v7 device];
    int v22 = [v21 model];

    if (v22)
    {
      uint64_t v23 = [v7 device];
      id v24 = [v23 model];
      [v24 UTF8String];
      nw_endpoint_set_device_model();
    }
    id v25 = [v7 device];
    id v26 = [v25 idsDeviceIdentifier];

    if (v26)
    {
      id v27 = [v7 device];
      id v28 = [v27 idsDeviceIdentifier];
      [v28 UTF8String];
      nw_endpoint_set_device_id();
    }
    dictionary = nw_txt_record_create_dictionary();
    double v30 = [v7 device];
    id v31 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v30 activityLevel]);
    id v32 = [v31 stringValue];
    v33 = (const char *)[v32 cStringUsingEncoding:4];

    size_t v34 = strlen(v33);
    nw_txt_record_set_key(dictionary, "ActivityLevel", (const uint8_t *)v33, v34);
    id v35 = +[RPIdentityDaemon sharedIdentityDaemon];
    v36 = [v7 device];
    unsigned int v37 = [v36 idsDeviceIdentifier];
    id v38 = [v35 featureFlagsForIdentityMatchingIDSDeviceIdentifier:v37];

    if (v38)
    {
      id v39 = +[NSNumber numberWithUnsignedLongLong:v38];
      id v40 = [v39 stringValue];
      id v41 = (const char *)[v40 cStringUsingEncoding:4];

      size_t v42 = strlen(v41);
      nw_txt_record_set_key(dictionary, "FeatureFlags", (const uint8_t *)v41, v42);
    }
    BOOL v43 = [v7 device];
    id v44 = [v43 statusFlags];

    if (v44)
    {
      id v45 = +[NSNumber numberWithUnsignedLongLong:v44];
      id v46 = [v45 stringValue];
      unsigned int v47 = (const char *)[v46 cStringUsingEncoding:4];

      size_t v48 = strlen(v47);
      nw_txt_record_set_key(dictionary, "StatusFlags", (const uint8_t *)v47, v48);
    }
    v49 = [v7 device];
    v50 = v49;
    if (v49) {
      [v49 operatingSystemVersion];
    }
    else {
      memset(v63, 0, sizeof(v63));
    }
    v51 = sub_10000E8DC(v63);

    if (v51)
    {
      v52 = (const char *)[v51 cStringUsingEncoding:4];
      if (v52)
      {
        v53 = (const uint8_t *)v52;
        size_t v54 = strlen(v52);
        nw_txt_record_set_key(dictionary, "OSVersion", v53, v54);
      }
    }
    if (v9)
    {
      v55 = [v7 device];
      v56 = [v55 serviceTypes];
      unsigned int v57 = [v56 containsObject:v9];

      if (v57)
      {
        v58 = +[NSNumber numberWithBool:1];
        id v59 = [v58 stringValue];
        v60 = (const char *)[v59 cStringUsingEncoding:4];

        size_t v61 = strlen(v60);
        nw_txt_record_set_key(dictionary, "HasService", (const uint8_t *)v60, v61);
      }
    }
    nw_endpoint_set_txt_record();
  }

  return application_service;
}

+ (const)responseCodeToString:(int)a3
{
  if (a3 > 3) {
    return "N/A";
  }
  else {
    return (&off_100124130)[a3];
  }
}

+ (const)statusCodeToString:(int)a3
{
  if ((a3 - 1) > 4) {
    return "N/A";
  }
  else {
    return (&off_100124150)[a3 - 1];
  }
}

- (void)receiveWithRequestID:(id)a3 receiveHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100142328 <= 30 && (dword_100142328 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10008C5EC;
  v10[3] = &unk_1001237F8;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(RPNWPeer *)self registerRequestID:v9 options:0 handler:v10];
}

- (void)sendWithRequestID:(id)a3 data:(id)a4 status:(int)a5 applicationService:(id)a6 clientPublicKey:(id)a7 listenerID:(id)a8 automapListener:(BOOL)a9 connectionID:(id)a10 responseHandler:(id)a11
{
  uint64_t v14 = *(void *)&a5;
  id v37 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a10;
  id v36 = a11;
  id v21 = objc_alloc_init((Class)NSMutableDictionary);
  id v22 = objc_alloc_init((Class)NSMutableString);
  [v21 setObject:&off_10012B448 forKeyedSubscript:@"version"];
  if (v16)
  {
    [v21 setObject:v16 forKeyedSubscript:@"request"];
    [v22 appendFormat:@" data=%zu bytes", [v16 length]];
  }
  else if (v14)
  {
    uint64_t v23 = +[NSNumber numberWithInt:v14];
    [v21 setObject:v23 forKeyedSubscript:@"status"];
    [v22 appendFormat:@" status=%s", +[RPNWPeer statusCodeToString:](RPNWPeer, "statusCodeToString:", v14)];
  }
  [v21 setObject:v17 forKeyedSubscript:@"applicationService"];
  if (v18)
  {
    [v21 setObject:v18 forKeyedSubscript:@"clientPublicKey"];
    [v22 appendFormat:@" clientPublicKey=%zu bytes", [v18 length]];
  }
  if (v19)
  {
    [v21 setObject:v19 forKeyedSubscript:@"listenerID"];
    [v22 appendFormat:@" listenerID=%@", v19];
  }
  id v24 = +[NSNumber numberWithBool:a9];
  [v21 setObject:v24 forKeyedSubscript:@"automapListener"];

  if (v20)
  {
    [v21 setObject:v20 forKeyedSubscript:@"connectionID"];
    [v22 appendFormat:@" connectionID=%@", v20];
  }
  id v38 = v16;
  if (dword_100142328 <= 30 && (dword_100142328 != -1 || _LogCategory_Initialize()))
  {
    id v25 = +[RPNWNetworkAgent getLogInfo];
    id v26 = [(RPNWPeer *)self destinationDevice];
    [v26 name];
    id v34 = v17;
    id v32 = v35 = v22;
    id v33 = v37;
    id v31 = v25;
    LogPrintF();
  }
  CFStringRef v44 = @"timeoutSeconds";
  id v45 = &off_10012B2E8;
  id v27 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1, v31, v32, v33, v34, v35);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10008D0E0;
  v40[3] = &unk_100123820;
  void v40[4] = self;
  id v41 = v37;
  id v42 = v17;
  id v43 = v36;
  id v28 = v36;
  id v29 = v17;
  id v30 = v37;
  [(RPNWPeer *)self sendRequestID:v30 request:v21 destinationID:@"rapport:rdid:DirectPeer" options:v27 responseHandler:v40];
}

- (void)receiveDataForConnection:(id)a3 statusHandler:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10008D490;
  v8[3] = &unk_1001240E8;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(RPNWPeer *)self receiveWithRequestID:@"com.apple.oneapi.data" receiveHandler:v8];
}

- (void)sendDataForConnection:(id)a3 applicationService:(id)a4 connectionID:(id)a5 responseHandler:(id)a6
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10008D790;
  v12[3] = &unk_100124110;
  id v13 = a6;
  id v10 = v13;
  LOBYTE(v11) = 0;
  [(RPNWPeer *)self sendWithRequestID:@"com.apple.oneapi.data" data:a3 status:0 applicationService:a4 clientPublicKey:0 listenerID:0 automapListener:v11 connectionID:a5 responseHandler:v12];
}

- (void)sendStatusUpdateForConnection:(id)a3 connectionID:(id)a4 status:(int)a5 responseHandler:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (dword_100142328 <= 30 && (dword_100142328 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v14 = +[RPNWPeer statusCodeToString:v7];
    LogPrintF();
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10008D8F0;
  v15[3] = &unk_100124110;
  id v16 = v12;
  id v13 = v12;
  LOBYTE(v14) = 0;
  [(RPNWPeer *)self sendWithRequestID:@"com.apple.oneapi.data" data:0 status:v7 applicationService:v10 clientPublicKey:0 listenerID:0 automapListener:v14 connectionID:v11 responseHandler:v15];
}

- (int64_t)_rssiThresholdForApplicationService:(id)a3
{
  if ([a3 isEqualToString:@"com.apple.sharingd.AirDrop"]) {
    return -80;
  }
  else {
    return 0;
  }
}

@end