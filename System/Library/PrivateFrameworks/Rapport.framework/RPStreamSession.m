@interface RPStreamSession
+ (BOOL)supportsSecureCoding;
- (BOOL)_startServerConnectionAndReturnError:(id *)a3;
- (BOOL)serverMode;
- (NSData)pskData;
- (NSData)streamKey;
- (NSString)destinationString;
- (NSString)serviceType;
- (NSString)streamID;
- (NSString)trafficSessionID;
- (NSUUID)nwClientID;
- (OS_dispatch_queue)dispatchQueue;
- (RPMessageable)messenger;
- (RPStreamSession)init;
- (RPStreamSession)initWithCoder:(id)a3;
- (id)_lowLatencySelfAddressString:(id *)a3;
- (id)connectionReadyHandler;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)disconnectHandler;
- (id)flowControlWriteChangedHandler;
- (id)invalidationHandler;
- (id)receivedEventHandler;
- (id)receivedRequestHandler;
- (id)statusChangedHandler;
- (id)streamAcceptHandler;
- (int)flowControlWriteState;
- (int)streamQoS;
- (int)streamSocket;
- (int)streamType;
- (unint64_t)delegatedProcessUPID;
- (unint64_t)statusFlags;
- (unsigned)_getSockAddrInterfaceType:(const void *)a3;
- (unsigned)streamFlags;
- (unsigned)trafficFlags;
- (void)_clientRPConnectionPrepareResponse:(id)a3 options:(id)a4 completion:(id)a5;
- (void)_clientRPConnectionPrepareWithCompletion:(id)a3;
- (void)_clientRPConnectionStartWithCompletion:(id)a3;
- (void)_clientUDPNWPathNextWithEndpoint:(id)a3 nwInterface:(id)a4 selfMACData:(id)a5 usb:(BOOL)a6 completion:(id)a7;
- (void)_clientUDPNWPathStartResponse:(id)a3 options:(id)a4 localEndpoint:(id)a5 nwInterface:(id)a6 selfIPString:(id)a7 usb:(BOOL)a8 completion:(id)a9;
- (void)_clientUDPNWPathStartWithCompletion:(id)a3;
- (void)_clientUDPSocketStartResponse:(id)a3 options:(id)a4 completion:(id)a5;
- (void)_clientUDPSocketStartWithCompletion:(id)a3;
- (void)_invalidate;
- (void)_invalidated;
- (void)_serverRPConnectionHandleConnectionAccepted:(int)a3;
- (void)_serverRPConnectionHandleConnectionStarted:(id)a3;
- (void)_serverRPConnectionStartRequest:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)_serverUDPNWPathNextWithEndpoint:(id)a3 nwInterface:(id)a4 selfMACData:(id)a5 peerIP:(id *)a6 peerMACData:(id)a7 usb:(BOOL)a8 responseHandler:(id)a9;
- (void)_serverUDPNWPathStartRequest:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)_serverUDPSocketStartRequest:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)_updateTrafficRegistration;
- (void)_updateTrafficRegistrationForDestination:(id)a3;
- (void)_updateTrafficRegistrationForIP:(id *)a3;
- (void)acceptedByServer;
- (void)activateForServerRequest:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)prepareWithCompletion:(id)a3;
- (void)sendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6;
- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)setConnectionReadyHandler:(id)a3;
- (void)setDelegatedProcessUPID:(unint64_t)a3;
- (void)setDestinationString:(id)a3;
- (void)setDisconnectHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setFlowControlWriteChangedHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setMessenger:(id)a3;
- (void)setNwClientID:(id)a3;
- (void)setPskData:(id)a3;
- (void)setReceivedEventHandler:(id)a3;
- (void)setReceivedRequestHandler:(id)a3;
- (void)setServerMode:(BOOL)a3;
- (void)setServiceType:(id)a3;
- (void)setStatusChangedHandler:(id)a3;
- (void)setStreamAcceptHandler:(id)a3;
- (void)setStreamFlags:(unsigned int)a3;
- (void)setStreamID:(id)a3;
- (void)setStreamKey:(id)a3;
- (void)setStreamQoS:(int)a3;
- (void)setStreamQoSOnSocket:(int)a3;
- (void)setStreamSocket:(int)a3;
- (void)setStreamType:(int)a3;
- (void)setTrafficFlags:(unsigned int)a3;
- (void)setTrafficSessionID:(id)a3;
- (void)startServerConnectionWithCompletion:(id)a3;
@end

@implementation RPStreamSession

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPStreamSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)RPStreamSession;
  v2 = [(RPStreamSession *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    v3->_streamSocket = -1;
    v4 = v3;
  }

  return v3;
}

- (RPStreamSession)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)RPStreamSession;
  v5 = [(RPStreamSession *)&v20 init];
  objc_super v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, MEMORY[0x1E4F14428]);
    v6->_streamSocket = -1;
    id v7 = v4;
    if ([v7 containsValueForKey:@"dpUPID"]) {
      v6->_delegatedProcessUPID = [v7 decodeInt64ForKey:@"dpUPID"];
    }

    id v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v9 = v8;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v10 = v9;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v11 = v10;
    if ([v11 containsValueForKey:@"serverMode"]) {
      v6->_serverMode = [v11 decodeBoolForKey:@"serverMode"];
    }

    id v12 = v11;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    uint64_t v21 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      LOBYTE(streamFlags) = v21;
    }
    else {
      unsigned int streamFlags = v6->_streamFlags;
    }
    v6->_unsigned int streamFlags = streamFlags & 2;
    id v14 = v12;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v15 = v14;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    uint64_t v21 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v6->_streamType = v21;
    }
    uint64_t v21 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v6->_streamQoS = v21;
    }
    if ([v15 containsValueForKey:@"streamSocket"])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = [v15 decodeXPCObjectOfType:MEMORY[0x1E4F145B0] forKey:@"streamSocket"];
        v17 = v16;
        if (v16) {
          v6->_streamSocket = xpc_fd_dup(v16);
        }
      }
    }
    v18 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = v4;
  unint64_t delegatedProcessUPID = self->_delegatedProcessUPID;
  v18 = v4;
  if (delegatedProcessUPID)
  {
    [v4 encodeInt64:delegatedProcessUPID forKey:@"dpUPID"];
    v5 = v18;
  }
  destinationString = self->_destinationString;
  if (destinationString)
  {
    [v5 encodeObject:destinationString forKey:@"dstS"];
    v5 = v18;
  }
  nwClientID = self->_nwClientID;
  if (nwClientID)
  {
    [v5 encodeObject:nwClientID forKey:@"nwClientID"];
    v5 = v18;
  }
  pskData = self->_pskData;
  if (pskData)
  {
    [v5 encodeObject:pskData forKey:@"pskD"];
    v5 = v18;
  }
  if (self->_serverMode)
  {
    [v5 encodeBool:1 forKey:@"serverMode"];
    v5 = v18;
  }
  serviceType = self->_serviceType;
  if (serviceType)
  {
    [v5 encodeObject:serviceType forKey:@"streamSrv"];
    v5 = v18;
  }
  if ((self->_streamFlags & 2) != 0)
  {
    objc_msgSend(v5, "encodeInt64:forKey:");
    v5 = v18;
  }
  streamID = self->_streamID;
  if (streamID)
  {
    [v5 encodeObject:streamID forKey:@"streamID"];
    v5 = v18;
  }
  streamKey = self->_streamKey;
  if (streamKey)
  {
    [v5 encodeObject:streamKey forKey:@"streamKey"];
    v5 = v18;
  }
  uint64_t streamType = self->_streamType;
  if (streamType)
  {
    [v5 encodeInteger:streamType forKey:@"streamType"];
    v5 = v18;
  }
  uint64_t streamQoS = self->_streamQoS;
  if (streamQoS)
  {
    [v5 encodeInteger:streamQoS forKey:@"streamQoS"];
    v5 = v18;
  }
  int streamSocket = self->_streamSocket;
  if ((streamSocket & 0x80000000) == 0)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v5 = v18;
    if (isKindOfClass)
    {
      xpc_object_t v17 = xpc_fd_create(streamSocket);
      [v18 encodeXPCObject:v17 forKey:@"streamSocket"];

      v5 = v18;
    }
  }
}

- (void)dealloc
{
  memset_s(self->_ourCurveSK, 0x20uLL, 0, 0x20uLL);
  int streamSocket = self->_streamSocket;
  if ((streamSocket & 0x80000000) == 0)
  {
    if (close(streamSocket) && *__error()) {
      __error();
    }
    self->_int streamSocket = -1;
  }
  [(RPStreamSession *)self _invalidate];
  v4.receiver = self;
  v4.super_class = (Class)RPStreamSession;
  [(RPStreamSession *)&v4 dealloc];
}

- (id)description
{
  return [(RPStreamSession *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  NSAppendPrintF();
  id v4 = 0;
  v5 = v4;
  if (self->_streamType)
  {
    id v15 = v4;
    NSAppendPrintF();
    id v6 = v15;

    v5 = v6;
  }
  serviceType = self->_serviceType;
  if (serviceType)
  {
    id v14 = serviceType;
    NSAppendPrintF();
    id v8 = v5;

    v5 = v8;
  }
  if (self->_streamQoS)
  {
    NSAppendPrintF();
    id v10 = v5;

    v5 = v10;
  }
  if (self->_statusFlags)
  {
    NSAppendPrintF();
    id v11 = v5;

    v5 = v11;
  }
  if (self->_trafficFlags)
  {
    NSAppendPrintF();
    id v12 = v5;

    v5 = v12;
  }
  return v5;
}

- (void)setTrafficFlags:(unsigned int)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_trafficFlags != a3)
  {
    self->_trafficFlags = a3;
    if (self->_trafficRegistrationCalled)
    {
      if (gLogCategory_RPStreamSession <= 30
        && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      dispatchQueue = self->_dispatchQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __35__RPStreamSession_setTrafficFlags___block_invoke;
      block[3] = &unk_1E605B540;
      block[4] = self;
      dispatch_async(dispatchQueue, block);
    }
  }
}

uint64_t __35__RPStreamSession_setTrafficFlags___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTrafficRegistration];
}

- (void)setStreamQoS:(int)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int streamQoS = self->_streamQoS;
  if (streamQoS == a3) {
    return;
  }
  if (gLogCategory_RPStreamSession <= 30)
  {
    if (gLogCategory_RPStreamSession != -1)
    {
LABEL_5:
      id v6 = "Default";
      switch(streamQoS)
      {
        case 0:
          break;
        case 1:
          id v6 = "Background";
          break;
        case 2:
          id v6 = "Video";
          break;
        case 3:
          id v6 = "Voice";
          break;
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
          goto LABEL_11;
        case 10:
          id v6 = "AirPlayAudio";
          break;
        case 11:
          id v6 = "AirPlayScreenAudio";
          break;
        case 12:
          id v6 = "AirPlayScreenVideo";
          break;
        default:
          if (streamQoS == 20) {
            id v6 = "NTP";
          }
          else {
LABEL_11:
          }
            id v6 = "?";
          break;
      }
      id v7 = "Default";
      switch(a3)
      {
        case 0:
          break;
        case 1:
          id v7 = "Background";
          break;
        case 2:
          id v7 = "Video";
          break;
        case 3:
          id v7 = "Voice";
          break;
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
          goto LABEL_21;
        case 10:
          id v7 = "AirPlayAudio";
          break;
        case 11:
          id v7 = "AirPlayScreenAudio";
          break;
        case 12:
          id v7 = "AirPlayScreenVideo";
          break;
        default:
          if (a3 == 20) {
            id v7 = "NTP";
          }
          else {
LABEL_21:
          }
            id v7 = "?";
          break;
      }
      id v12 = v6;
      v13 = v7;
      LogPrintF();
      goto LABEL_28;
    }
    if (_LogCategory_Initialize())
    {
      int streamQoS = self->_streamQoS;
      goto LABEL_5;
    }
  }
LABEL_28:
  self->_int streamQoS = a3;
  id v8 = [(RPConnection *)self->_rpCnx tcpConnection];
  int v9 = [v8 socketFD];

  if (v9 < 0)
  {
    uint64_t streamSocket = self->_streamSocket;
    if ((streamSocket & 0x80000000) != 0) {
      return;
    }
  }
  else
  {
    id v10 = [(RPConnection *)self->_rpCnx tcpConnection];
    uint64_t streamSocket = [v10 socketFD];

    if ((streamSocket & 0x80000000) != 0) {
      return;
    }
  }
  [(RPStreamSession *)self setStreamQoSOnSocket:streamSocket];
}

- (void)setStreamQoSOnSocket:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (gLogCategory_RPStreamSession <= 30
    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t streamQoS = self->_streamQoS;
  MEMORY[0x1F4116AF0](v3, streamQoS);
}

- (void)acceptedByServer
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__RPStreamSession_acceptedByServer__block_invoke;
  block[3] = &unk_1E605B540;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__RPStreamSession_acceptedByServer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTrafficRegistration];
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(RPMessageable *)self->_messenger dispatchQueue];
  dispatchQueue = v5;
  if (!v5) {
    dispatchQueue = self->_dispatchQueue;
  }
  objc_storeStrong((id *)&self->_dispatchQueue, dispatchQueue);

  id v7 = self->_dispatchQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__RPStreamSession_activateWithCompletion___block_invoke;
  v9[3] = &unk_1E605B650;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

void __42__RPStreamSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if ((*(_DWORD *)(v2 + 144) & 0x80000000) == 0
    || *(void *)(v2 + 288) && *(void *)(v2 + 296)
    || *(void *)(v2 + 208))
  {
    int v3 = 1;
  }
  else
  {
    if (!*(void *)(v2 + 200))
    {
LABEL_23:
      RPErrorF();
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      if (gLogCategory_RPStreamSession <= 90
        && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));

      return;
    }
    int v3 = 0;
  }
  if (!*(void *)(v2 + 264)) {
    goto LABEL_23;
  }
  [*(id *)(v2 + 200) setServiceType:*(void *)(v2 + 240)];
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(_DWORD *)(v4 + 148);
  switch(v5)
  {
    case 3:
      uint64_t v6 = *(void *)(a1 + 40);
      if (v3)
      {
LABEL_18:
        id v7 = *(void (**)(uint64_t, void))(v6 + 16);
        v7(v6, 0);
        return;
      }
      [(id)v4 _clientUDPNWPathStartWithCompletion:v6];
      break;
    case 2:
      if (*(unsigned char *)(v4 + 136))
      {
        id v11 = 0;
        [(id)v4 _startServerConnectionAndReturnError:&v11];
        id v8 = v11;
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
      else
      {
        uint64_t v9 = *(void *)(a1 + 40);
        if (v3)
        {
          [(id)v4 _clientRPConnectionStartWithCompletion:v9];
        }
        else
        {
          [(id)v4 _clientRPConnectionPrepareWithCompletion:v9];
        }
      }
      break;
    case 1:
      uint64_t v6 = *(void *)(a1 + 40);
      if (!v3)
      {
        [(id)v4 _clientUDPSocketStartWithCompletion:v6];
        return;
      }
      goto LABEL_18;
    default:
      goto LABEL_23;
  }
}

- (void)activateForServerRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(RPMessageable *)self->_messenger dispatchQueue];
  dispatchQueue = v11;
  if (!v11) {
    dispatchQueue = self->_dispatchQueue;
  }
  objc_storeStrong((id *)&self->_dispatchQueue, dispatchQueue);

  v13 = self->_dispatchQueue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __68__RPStreamSession_activateForServerRequest_options_responseHandler___block_invoke;
  v17[3] = &unk_1E605BEA8;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(v13, v17);
}

void __68__RPStreamSession_activateForServerRequest_options_responseHandler___block_invoke(void *a1)
{
  *(unsigned char *)(a1[4] + 136) = 1;
  [*(id *)(a1[4] + 200) setServiceType:*(void *)(a1[4] + 240)];
  uint64_t v2 = (_DWORD *)a1[4];
  int v3 = v2[37];
  switch(v3)
  {
    case 3:
      uint64_t v7 = a1[5];
      uint64_t v8 = a1[6];
      uint64_t v9 = a1[7];
      [v2 _serverUDPNWPathStartRequest:v7 options:v8 responseHandler:v9];
      break;
    case 2:
      uint64_t v10 = a1[5];
      uint64_t v11 = a1[6];
      uint64_t v12 = a1[7];
      [v2 _serverRPConnectionStartRequest:v10 options:v11 responseHandler:v12];
      break;
    case 1:
      uint64_t v4 = a1[5];
      uint64_t v5 = a1[6];
      uint64_t v6 = a1[7];
      [v2 _serverUDPSocketStartRequest:v4 options:v5 responseHandler:v6];
      break;
    default:
      RPErrorF();
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      if (gLogCategory_RPStreamSession <= 90
        && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      (*(void (**)(void))(a1[7] + 16))(a1[7]);

      break;
  }
}

- (void)prepareWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__RPStreamSession_prepareWithCompletion___block_invoke;
  v7[3] = &unk_1E605B650;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __41__RPStreamSession_prepareWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 200) || !*(void *)(v2 + 264))
  {
LABEL_9:
    RPErrorF();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));

    return;
  }
  int v3 = *(_DWORD *)(v2 + 148);
  switch(v3)
  {
    case 3:
      uint64_t v5 = *(void *)(a1 + 40);
      [(id)v2 _clientUDPNWPathStartWithCompletion:v5];
      break;
    case 2:
      *(unsigned char *)(v2 + 96) = 1;
      id v6 = *(void **)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      [v6 _clientRPConnectionPrepareWithCompletion:v7];
      break;
    case 1:
      uint64_t v4 = *(void *)(a1 + 40);
      [(id)v2 _clientUDPSocketStartWithCompletion:v4];
      return;
    default:
      goto LABEL_9;
  }
}

- (void)startServerConnectionWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__RPStreamSession_startServerConnectionWithCompletion___block_invoke;
  v7[3] = &unk_1E605B650;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __55__RPStreamSession_startServerConnectionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = 0;
  [v2 _startServerConnectionAndReturnError:&v4];
  id v3 = v4;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)_startServerConnectionAndReturnError:(id *)a3
{
  if (gLogCategory_RPStreamSession <= 30
    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    uint64_t streamType = self->_streamType;
    if (streamType > 3) {
      id v6 = "?";
    }
    else {
      id v6 = off_1E605D948[streamType];
    }
    uint64_t v7 = "yes";
    if (!self->_pskData) {
      uint64_t v7 = "no";
    }
    uint64_t streamSocket = self->_streamSocket;
    v25 = v7;
    v23 = v6;
    LogPrintF();
  }
  uint64_t v8 = self->_streamSocket;
  if ((v8 & 0x80000000) != 0)
  {
    id v15 = RPErrorF();
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (a3) {
      *a3 = v15;
    }

    return 0;
  }
  else
  {
    *(void *)&v33.sa_len = 0;
    *(void *)&v33.sa_data[6] = 0;
    int v35 = 0;
    uint64_t v34 = 0;
    socklen_t v32 = 28;
    getsockname(v8, &v33, &v32);
    id v9 = objc_alloc_init(MEMORY[0x1E4F5E200]);
    [v9 setDispatchQueue:self->_dispatchQueue];
    [v9 setFlags:137];
    uint64_t v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"Stream-%u", SockAddrGetPort());
    [v9 setLabel:v10];

    [v9 setSocketFD:v8];
    self->_uint64_t streamSocket = -1;
    if (self->_streamQoS >= 1) {
      [(RPStreamSession *)self setStreamQoSOnSocket:v8];
    }
    id v31 = 0;
    [v9 activateDirectAndReturnError:&v31];
    id v11 = v31;
    BOOL v12 = v11 == 0;
    if (v11)
    {
      id v13 = v11;
      RPErrorF();
      id v14 = (id)objc_claimAutoreleasedReturnValue();

      if (gLogCategory_RPStreamSession <= 90
        && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
      {
        id v22 = v14;
        LogPrintF();
      }
      objc_msgSend(v9, "invalidate", v22, v23, streamSocket, v25);
      if (a3)
      {
        id v14 = v14;
        *a3 = v14;
      }
    }
    else
    {
      id v16 = objc_alloc_init(RPConnection);
      [(RPConnection *)v16 setDispatchQueue:self->_dispatchQueue];
      [(RPConnection *)v16 setFlags:[(RPConnection *)v16 flags] | 0x80000];
      xpc_object_t v17 = [v9 label];
      [(RPConnection *)v16 setLabel:v17];

      [(RPConnection *)v16 setPskData:self->_pskData];
      pskData = self->_pskData;
      self->_pskData = 0;

      [(RPConnection *)v16 setTcpConnection:v9];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __56__RPStreamSession__startServerConnectionAndReturnError___block_invoke;
      v30[3] = &unk_1E605B540;
      v30[4] = self;
      [(RPConnection *)v16 setInvalidationHandler:v30];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __56__RPStreamSession__startServerConnectionAndReturnError___block_invoke_2;
      v29[3] = &unk_1E605CBA8;
      v29[4] = self;
      [(RPConnection *)v16 setReceivedEventHandler:v29];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __56__RPStreamSession__startServerConnectionAndReturnError___block_invoke_3;
      v28[3] = &unk_1E605CBD0;
      v28[4] = self;
      [(RPConnection *)v16 setReceivedRequestHandler:v28];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __56__RPStreamSession__startServerConnectionAndReturnError___block_invoke_4;
      v27[3] = &unk_1E605CA48;
      v27[4] = self;
      [(RPConnection *)v16 setStateChangedHandler:v27];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __56__RPStreamSession__startServerConnectionAndReturnError___block_invoke_5;
      v26[3] = &unk_1E605B5B0;
      v26[4] = self;
      [(RPConnection *)v16 setReadErrorHandler:v26];
      rpCnx = self->_rpCnx;
      self->_rpCnx = v16;
      id v20 = v16;

      [(RPConnection *)v20 activate];
      id v14 = 0;
    }
  }
  return v12;
}

uint64_t __56__RPStreamSession__startServerConnectionAndReturnError___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 104);
  *(void *)(v2 + 104) = 0;

  id v4 = *(void **)(a1 + 32);
  return [v4 _invalidated];
}

void __56__RPStreamSession__startServerConnectionAndReturnError___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = MEMORY[0x1B3EBCC80](*(void *)(*(void *)(a1 + 32) + 216));
  uint64_t v10 = (void *)v9;
  if (v9) {
    (*(void (**)(uint64_t, id, id, id))(v9 + 16))(v9, v11, v7, v8);
  }
}

void __56__RPStreamSession__startServerConnectionAndReturnError___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v14 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = MEMORY[0x1B3EBCC80](*(void *)(*(void *)(a1 + 32) + 224));
  id v13 = (void *)v12;
  if (v12) {
    (*(void (**)(uint64_t, id, id, id, id))(v12 + 16))(v12, v14, v9, v10, v11);
  }
}

void __56__RPStreamSession__startServerConnectionAndReturnError___block_invoke_4(uint64_t a1, int a2)
{
  if (a2 == 1)
  {
    id v3 = [*(id *)(a1 + 32) connectionReadyHandler];
    if (v3)
    {
      id v4 = v3;
      v3[2]();
      id v3 = v4;
    }
  }
}

void __56__RPStreamSession__startServerConnectionAndReturnError___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 code] == -6723 || objc_msgSend(v3, "code") == -6753)
  {
    id v4 = (void *)MEMORY[0x1B3EBCC80](*(void *)(*(void *)(a1 + 32) + 168));
    if (v4)
    {
      uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 176);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __56__RPStreamSession__startServerConnectionAndReturnError___block_invoke_6;
      block[3] = &unk_1E605D7E0;
      block[4] = v4;
      dispatch_async(v5, block);
    }
  }
}

uint64_t __56__RPStreamSession__startServerConnectionAndReturnError___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__RPStreamSession_invalidate__block_invoke;
  block[3] = &unk_1E605B540;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __29__RPStreamSession_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (gLogCategory_RPStreamSession <= 30
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      uint64_t streamType = self->_streamType;
      if (streamType > 3) {
        id v4 = "?";
      }
      else {
        id v4 = off_1E605D948[streamType];
      }
      streamID = self->_streamID;
      id v14 = v4;
      LogPrintF();
    }
    nwPathEvaluator = self->_nwPathEvaluator;
    if (nwPathEvaluator)
    {
      id v6 = nwPathEvaluator;
      nw_path_evaluator_cancel();
      id v7 = self->_nwPathEvaluator;
      self->_nwPathEvaluator = 0;
    }
    nwListener = self->_nwListener;
    if (nwListener)
    {
      id v9 = nwListener;
      nw_listener_cancel(v9);
      id v10 = self->_nwListener;
      self->_nwListener = 0;
    }
    [(RPConnection *)self->_rpCnx invalidate];
    int streamSocket = self->_streamSocket;
    if ((streamSocket & 0x80000000) == 0)
    {
      if (close(streamSocket) && *__error()) {
        __error();
      }
      self->_int streamSocket = -1;
    }
    [(CUTCPServer *)self->_tcpServer invalidate];
    [(CUWiFiManager *)self->_wifiManager invalidate];
    wifiManager = self->_wifiManager;
    self->_wifiManager = 0;

    [(RPStreamSession *)self _invalidated];
  }
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_rpCnx && !self->_tcpServer)
  {
    uint64_t v3 = MEMORY[0x1B3EBCC80](self->_invalidationHandler);
    id v4 = (void *)v3;
    if (v3) {
      (*(void (**)(uint64_t))(v3 + 16))(v3);
    }

    id disconnectHandler = self->_disconnectHandler;
    self->_id disconnectHandler = 0;

    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    messenger = self->_messenger;
    self->_messenger = 0;

    id receivedEventHandler = self->_receivedEventHandler;
    self->_id receivedEventHandler = 0;

    id receivedRequestHandler = self->_receivedRequestHandler;
    self->_id receivedRequestHandler = 0;

    id statusChangedHandler = self->_statusChangedHandler;
    self->_id statusChangedHandler = 0;

    id streamAcceptHandler = self->_streamAcceptHandler;
    self->_id streamAcceptHandler = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_RPStreamSession <= 30
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_clientUDPNWPathStartWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  socklen_t v32 = __Block_byref_object_copy__6;
  sockaddr v33 = __Block_byref_object_dispose__6;
  id v34 = 0;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __55__RPStreamSession__clientUDPNWPathStartWithCompletion___block_invoke;
  v26[3] = &unk_1E605D6B0;
  v28 = &v29;
  id v5 = v4;
  id v27 = v5;
  id v6 = (void (**)(void))MEMORY[0x1B3EBCC80](v26);
  if (gLogCategory_RPStreamSession <= 30
    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = self->_messenger;
    BOOL v8 = [(RPMessageable *)v7 linkType] == 4;
  }
  else
  {
    BOOL v8 = 0;
  }
  secure_udp = nw_parameters_create_secure_udp((nw_parameters_configure_protocol_block_t)*MEMORY[0x1E4F38C90], (nw_parameters_configure_protocol_block_t)*MEMORY[0x1E4F38C88]);
  if (!secure_udp)
  {
    uint64_t v15 = RPErrorF();
    id v10 = v30[5];
    void v30[5] = v15;
    goto LABEL_24;
  }
  nw_parameters_set_allow_duplicate_state_updates();
  id v10 = 0;
  id v11 = 0;
  id v25 = 0;
  if (!v8) {
    goto LABEL_15;
  }
  if ((self->_streamFlags & 2) == 0) {
    goto LABEL_11;
  }
  id v11 = [(RPStreamSession *)self _lowLatencySelfAddressString:&v25];
  if (!v11)
  {
    if (gLogCategory_RPStreamSession <= 30
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
LABEL_11:
    id v10 = 0;
    id v11 = 0;
LABEL_15:
    uint64_t v12 = self->_nwListener;
    id v13 = v12;
    if (v12) {
      nw_listener_cancel((nw_listener_t)v12);
    }

    nw_listener_t v14 = nw_listener_create(secure_udp);
    objc_storeStrong((id *)&self->_nwListener, v14);
    if (v14)
    {
      nw_listener_set_queue(v14, (dispatch_queue_t)self->_dispatchQueue);
      v23[0] = 0;
      v23[1] = v23;
      v23[2] = 0x3032000000;
      v23[3] = __Block_byref_object_copy__84;
      v23[4] = __Block_byref_object_dispose__85;
      id v24 = (id)MEMORY[0x1B3EBCC80](v5);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __55__RPStreamSession__clientUDPNWPathStartWithCompletion___block_invoke_86;
      v19[3] = &unk_1E605D808;
      v19[4] = v14;
      v19[5] = self;
      id v22 = v23;
      id v10 = v10;
      id v20 = v10;
      id v21 = v25;
      MEMORY[0x1B3EBC8F0](v14, v19);
      nw_listener_set_new_connection_handler(v14, &__block_literal_global_16);
      if (gLogCategory_RPStreamSession <= 30
        && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      nw_listener_start(v14);

      _Block_object_dispose(v23, 8);
    }
    else
    {
      uint64_t v16 = RPErrorF();
      xpc_object_t v17 = (void *)v30[5];
      void v30[5] = v16;
    }
    goto LABEL_23;
  }
  id v10 = nw_interface_create_with_name();
  if (v10)
  {
    nw_parameters_require_interface(secure_udp, v10);
    goto LABEL_15;
  }
  uint64_t v18 = RPErrorF();
  id v10 = 0;
  nw_listener_t v14 = (nw_listener_t)v30[5];
  void v30[5] = v18;
LABEL_23:

LABEL_24:
  v6[2](v6);

  _Block_object_dispose(&v29, 8);
}

uint64_t __55__RPStreamSession__clientUDPNWPathStartWithCompletion___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v1 + 32) + 16);
    return v2();
  }
  return result;
}

void __55__RPStreamSession__clientUDPNWPathStartWithCompletion___block_invoke_86(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (gLogCategory_RPStreamSession <= 30)
  {
    id v13 = v5;
    if (gLogCategory_RPStreamSession != -1 || (v7 = _LogCategory_Initialize(), id v6 = v13, v7))
    {
      LogPrintF();
      id v6 = v13;
    }
  }
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 16))
  {
    if (a2 == 3 || v6)
    {
      nw_listener_t v14 = v6;
      if (v6) {
        BOOL v8 = nw_error_copy_cf_error(v6);
      }
      else {
        BOOL v8 = 0;
      }
      if (gLogCategory_RPStreamSession <= 90
        && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v10 = *(void *)(v9 + 40);
      if (!v10)
      {
        uint64_t v12 = 0;
        goto LABEL_23;
      }
      id v11 = RPNestedErrorF();
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

LABEL_21:
      uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v12 = *(void **)(v9 + 40);
LABEL_23:
      *(void *)(v9 + 40) = 0;

LABEL_24:
      id v6 = v14;
      goto LABEL_25;
    }
    if ((a2 - 1) <= 1 && *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      nw_listener_t v14 = 0;
      BOOL v8 = (void *)nw_listener_copy_local_endpoint();
      if (!v8)
      {
        if (gLogCategory_RPStreamSession <= 90
          && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        goto LABEL_24;
      }
      [*(id *)(a1 + 40) _clientUDPNWPathNextWithEndpoint:v8 nwInterface:*(void *)(a1 + 48) selfMACData:*(void *)(a1 + 56) usb:0 completion:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
      goto LABEL_21;
    }
  }
LABEL_25:
}

void __55__RPStreamSession__clientUDPNWPathStartWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  id v4 = v2;
  if (gLogCategory_RPStreamSession <= 30)
  {
    if (gLogCategory_RPStreamSession != -1 || (int v3 = _LogCategory_Initialize(), v2 = v4, v3))
    {
      LogPrintF();
      uint64_t v2 = v4;
    }
  }
  nw_connection_cancel(v2);
}

- (void)_clientUDPNWPathNextWithEndpoint:(id)a3 nwInterface:(id)a4 selfMACData:(id)a5 usb:(BOOL)a6 completion:(id)a7
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  address = nw_endpoint_get_address(v12);
  if (address)
  {
    int sa_family = address->sa_family;
    if (sa_family == 30)
    {
      if (!*(_DWORD *)&address->sa_data[6]
        && !*(_DWORD *)&address->sa_data[10]
        && !*(_DWORD *)&address[1].sa_len
        && !*(_DWORD *)&address[1].sa_data[2])
      {
        goto LABEL_5;
      }
    }
    else if (sa_family == 2 && !*(_DWORD *)&address->sa_data[2])
    {
LABEL_5:
      uint64_t v18 = 0;
      goto LABEL_14;
    }
    v46[0] = 0;
    SockAddrToString();
    uint64_t v18 = [NSString stringWithUTF8String:v46];
LABEL_14:
    uint64_t Port = SockAddrGetPort();
    if (gLogCategory_RPStreamSession <= 30
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      uint64_t streamType = self->_streamType;
      if (streamType > 3) {
        id v22 = "?";
      }
      else {
        id v22 = off_1E605D948[streamType];
      }
      v38 = v12;
      uint64_t v39 = Port;
      v36 = v18;
      id v37 = v14;
      uint64_t streamFlags = self->_streamFlags;
      int v35 = &unk_1B39722BA;
      streamID = self->_streamID;
      sockaddr v33 = v22;
      LogPrintF();
    }
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v24 = v23;
    if (v18) {
      [v23 setObject:v18 forKeyedSubscript:@"_streamAddr"];
    }
    if (v14) {
      [v24 setObject:v14 forKeyedSubscript:@"_streamMACAddr"];
    }
    if (self->_streamFlags)
    {
      id v25 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
      [v24 setObject:v25 forKeyedSubscript:@"_streamFlags"];
    }
    objc_msgSend(v24, "setObject:forKeyedSubscript:", self->_streamID, @"_streamID", streamID, v33, streamFlags, v35, v36, v37, v38, v39);
    v26 = [NSNumber numberWithInt:Port];
    [v24 setObject:v26 forKeyedSubscript:@"_streamPort"];

    id v27 = [NSNumber numberWithInt:self->_streamType];
    [v24 setObject:v27 forKeyedSubscript:@"_streamType"];

    v28 = [NSNumber numberWithUnsignedInt:self->_trafficFlags];
    [v24 setObject:v28 forKeyedSubscript:@"_tf"];

    serviceType = self->_serviceType;
    if (serviceType) {
      [v24 setObject:serviceType forKeyedSubscript:@"_streamSrv"];
    }
    messenger = self->_messenger;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __91__RPStreamSession__clientUDPNWPathNextWithEndpoint_nwInterface_selfMACData_usb_completion___block_invoke;
    v40[3] = &unk_1E605D850;
    id v44 = v15;
    v40[4] = self;
    v41 = v12;
    id v42 = v13;
    id v43 = v18;
    BOOL v45 = a6;
    id v31 = v18;
    [(RPMessageable *)messenger sendRequestID:@"_streamStart" request:v24 destinationID:@"rapport:rdid:DirectPeer" options:0 responseHandler:v40];

    goto LABEL_33;
  }
  id v19 = RPErrorF();
  if (gLogCategory_RPStreamSession <= 90
    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*((void (**)(id, void *))v15 + 2))(v15, v19);

LABEL_33:
}

void __91__RPStreamSession__clientUDPNWPathNextWithEndpoint_nwInterface_selfMACData_usb_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v12 = v7;
  if (!v12 || v9)
  {
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v10 = *(void *)(a1 + 64);
    if (v9)
    {
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v9);
    }
    else
    {
      id v11 = RPErrorF();
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
    }
  }
  else
  {
    [*(id *)(a1 + 32) _clientUDPNWPathStartResponse:v12 options:v8 localEndpoint:*(void *)(a1 + 40) nwInterface:*(void *)(a1 + 48) selfIPString:*(void *)(a1 + 56) usb:*(unsigned __int8 *)(a1 + 72) completion:*(void *)(a1 + 64)];
  }
}

- (void)_clientUDPNWPathStartResponse:(id)a3 options:(id)a4 localEndpoint:(id)a5 nwInterface:(id)a6 selfIPString:(id)a7 usb:(BOOL)a8 completion:(id)a9
{
  BOOL v9 = a8;
  v62[2] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v48 = a4;
  local_endpoint = a5;
  interface = a6;
  id v49 = a7;
  id v16 = a9;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__6;
  v60 = __Block_byref_object_dispose__6;
  id v61 = 0;
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __111__RPStreamSession__clientUDPNWPathStartResponse_options_localEndpoint_nwInterface_selfIPString_usb_completion___block_invoke;
  v53[3] = &unk_1E605D6B0;
  v55 = &v56;
  id v17 = v16;
  id v54 = v17;
  uint64_t v18 = (void (**)(void))MEMORY[0x1B3EBCC80](v53);
  CFStringGetTypeID();
  if (![ (id) CFDictionaryGetTypedValue() UTF8String])
  {
    uint64_t v38 = RPErrorF();
    id v20 = (void *)v57[5];
    v57[5] = v38;
    goto LABEL_40;
  }
  if (stristr() || stristr())
  {
    StringToSockAddr();
    CFStringGetTypeID();
    id v19 = CFDictionaryGetTypedValue();
    id v20 = v19;
    if (v19)
    {
      if (v49) {
        id v21 = @"%llw0";
      }
      else {
        id v21 = @"%awdl0";
      }
      id v22 = [v19 stringByAppendingString:v21];
      uint64_t v23 = [v22 UTF8String];

      if (!v23)
      {
        uint64_t v41 = RPErrorF();
        id v42 = (void *)v57[5];
        v57[5] = v41;

        goto LABEL_40;
      }
    }
    else if (v49 {
           && gLogCategory_RPStreamSession <= 30
    }
           && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  CFDataGetTypeID();
  id v20 = CFDictionaryGetTypedValue();
  if ((unint64_t)[v20 length] >= 0x20) {
    objc_storeStrong((id *)&self->_streamKey, v20);
  }
  id v24 = CFDictionaryGetCFDataOfLength();
  if (!CFDictionaryGetInt64Ranged())
  {
    uint64_t v39 = RPErrorF();
    v40 = (void *)v57[5];
    v57[5] = v39;

    goto LABEL_39;
  }
  *(void *)&address.sa_len = 0;
  *(void *)&address.sa_data[6] = 0;
  int v52 = 0;
  uint64_t v51 = 0;
  if (!StringToSockAddr())
  {
    SockAddrSetPort();
    if (!SockAddrConvertToIPv6())
    {
      if (v24)
      {
        WORD2(v62[0]) = 0;
        LODWORD(v62[0]) = 0;
        uint64_t v27 = [v24 bytes];
        int v28 = *(_DWORD *)v27;
        WORD2(v62[0]) = *(_WORD *)(v27 + 4);
        LODWORD(v62[0]) = v28;
        uint64_t address_with_ethernet = nw_endpoint_create_address_with_ethernet();
      }
      else
      {
        uint64_t address_with_ethernet = (uint64_t)nw_endpoint_create_address(&address);
      }
      v26 = (void *)address_with_ethernet;
      if (address_with_ethernet)
      {
        [(RPStreamSession *)self _updateTrafficRegistrationForIP:&address];
        if (v9)
        {
          legacy_tcp_socket = nw_parameters_create_legacy_tcp_socket();
          nw_parameters_t secure_udp = legacy_tcp_socket;
          if (legacy_tcp_socket)
          {
            socklen_t v32 = nw_parameters_copy_default_protocol_stack(legacy_tcp_socket);
            if (!v32)
            {
LABEL_47:
              uint64_t v43 = RPErrorF();
              id v44 = (void *)v57[5];
              v57[5] = v43;

LABEL_37:
              goto LABEL_38;
            }
            options = nw_udp_create_options();
            nw_udp_options_set_no_metadata();
            nw_protocol_stack_set_transport_protocol(v32, options);

LABEL_29:
            nw_parameters_set_delegated_unique_pid();
            nw_parameters_set_reuse_local_address(secure_udp, 1);
            if (interface) {
              nw_parameters_require_interface(secure_udp, interface);
            }
            nw_parameters_set_local_endpoint(secure_udp, local_endpoint);
            evaluator_for_endpoint = (OS_nw_path_evaluator *)nw_path_create_evaluator_for_endpoint();
            nwPathEvaluator = self->_nwPathEvaluator;
            self->_nwPathEvaluator = evaluator_for_endpoint;

            if (self->_nwPathEvaluator)
            {
              v62[0] = 0;
              v62[1] = 0;
              nw_path_evaluator_get_client_id();
              v36 = (NSUUID *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v62];
              nwClientID = self->_nwClientID;
              self->_nwClientID = v36;

              if (gLogCategory_RPStreamSession <= 30
                && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
              {
                LogPrintF();
              }
              (*((void (**)(id, void))v17 + 2))(v17, 0);
              goto LABEL_37;
            }
            goto LABEL_47;
          }
        }
        else
        {
          nw_parameters_t secure_udp = nw_parameters_create_secure_udp((nw_parameters_configure_protocol_block_t)*MEMORY[0x1E4F38C90], &__block_literal_global_152);
          if (secure_udp) {
            goto LABEL_29;
          }
        }
      }
      uint64_t v45 = RPErrorF();
      nw_parameters_t secure_udp = (nw_parameters_t)v57[5];
      v57[5] = v45;
      goto LABEL_37;
    }
  }
  uint64_t v25 = RPErrorF();
  v26 = (void *)v57[5];
  v57[5] = v25;
LABEL_38:

LABEL_39:
LABEL_40:

  v18[2](v18);
  _Block_object_dispose(&v56, 8);
}

uint64_t __111__RPStreamSession__clientUDPNWPathStartResponse_options_localEndpoint_nwInterface_selfIPString_usb_completion___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v1 + 32) + 16);
    return v2();
  }
  return result;
}

uint64_t __111__RPStreamSession__clientUDPNWPathStartResponse_options_localEndpoint_nwInterface_selfIPString_usb_completion___block_invoke_2()
{
  return nw_udp_options_set_no_metadata();
}

- (void)_serverUDPNWPathStartRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__6;
  v71 = __Block_byref_object_dispose__6;
  id v72 = 0;
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __72__RPStreamSession__serverUDPNWPathStartRequest_options_responseHandler___block_invoke;
  v64[3] = &unk_1E605D6B0;
  v66 = &v67;
  id v47 = v10;
  id v65 = v47;
  id v11 = (void (**)(void))MEMORY[0x1B3EBCC80](v64);
  if (gLogCategory_RPStreamSession <= 30
    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    uint64_t streamType = self->_streamType;
    if (streamType > 3) {
      id v13 = "?";
    }
    else {
      id v13 = off_1E605D948[streamType];
    }
    uint64_t trafficFlags = self->_trafficFlags;
    id v44 = &unk_1B3972247;
    uint64_t streamFlags = self->_streamFlags;
    id v42 = &unk_1B39722BA;
    streamID = self->_streamID;
    v40 = v13;
    LogPrintF();
  }
  id v63 = 0;
  CFStringGetTypeID();
  if (![ (id) CFDictionaryGetTypedValue() UTF8String])
  {
    uint64_t v29 = RPErrorF();
    id v14 = (NSString *)v68[5];
    v68[5] = v29;
    goto LABEL_55;
  }
  if (!stristr() && !stristr())
  {
    id v14 = 0;
    goto LABEL_21;
  }
  StringToSockAddr();
  if ((self->_streamFlags & 2) != 0)
  {
    id v14 = [(RPStreamSession *)self _lowLatencySelfAddressString:&v63];
    if (v14) {
      goto LABEL_15;
    }
    if (gLogCategory_RPStreamSession <= 30
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  id v14 = 0;
LABEL_15:
  CFStringGetTypeID();
  id v15 = CFDictionaryGetTypedValue();
  id v16 = v15;
  if (v15)
  {
    if (v14) {
      id v17 = @"%llw0";
    }
    else {
      id v17 = @"%awdl0";
    }
    objc_msgSend(v15, "stringByAppendingString:", v17, streamID, v40, streamFlags, v42, trafficFlags, v44);
    id v18 = objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [v18 UTF8String];

    if (!v19)
    {
      uint64_t v36 = RPErrorF();
      id v37 = (void *)v68[5];
      v68[5] = v36;

      goto LABEL_55;
    }
  }
  else if (v14 {
         && gLogCategory_RPStreamSession <= 30
  }
         && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    streamID = v14;
    LogPrintF();
  }

LABEL_21:
  memset(v62, 0, 28);
  int v61 = 0;
  uint64_t v60 = StringToSockAddr();
  if (v60)
  {
    uint64_t v30 = RPErrorF();
    v46 = (void *)v68[5];
    v68[5] = v30;

    goto LABEL_55;
  }
  uint64_t v45 = CFDictionaryGetCFDataOfLength();
  if (!CFDictionaryGetInt64Ranged()) {
    goto LABEL_63;
  }
  SockAddrSetPort();
  unsigned int Int64Ranged = CFDictionaryGetInt64Ranged();
  self->_uint64_t trafficFlags = Int64Ranged;
  if (v14)
  {
    id v21 = [(NSString *)v14 stringByAppendingString:@"%llw0", streamID];
    uint64_t v22 = [v21 UTF8String];

    if (!v22)
    {
LABEL_63:
      uint64_t v31 = RPErrorF();
      socklen_t v32 = (void *)v68[5];
      v68[5] = v31;

      goto LABEL_54;
    }
  }
  else
  {
    CFStringGetTypeID();
    if (![ (id) CFDictionaryGetTypedValue() UTF8String]) {
      goto LABEL_63;
    }
  }
  uint64_t v56 = 0;
  uint64_t v57 = 0;
  int v59 = 0;
  uint64_t v58 = 0;
  LODWORD(v60) = StringToSockAddr();
  if (v60)
  {
    uint64_t v33 = RPErrorF();
    nw_parameters_t secure_udp = v68[5];
    v68[5] = v33;
    goto LABEL_53;
  }
  nw_parameters_t secure_udp = nw_parameters_create_secure_udp((nw_parameters_configure_protocol_block_t)*MEMORY[0x1E4F38C90], (nw_parameters_configure_protocol_block_t)*MEMORY[0x1E4F38C88]);
  if (secure_udp)
  {
    nw_parameters_set_allow_duplicate_state_updates();
    id v24 = 0;
    if (!v14 || (self->_streamFlags & 2) == 0) {
      goto LABEL_31;
    }
    id v24 = nw_interface_create_with_name();
    if (v24)
    {
      nw_parameters_require_interface(secure_udp, v24);
LABEL_31:
      uint64_t v25 = self->_nwListener;
      v26 = v25;
      if (v25) {
        nw_listener_cancel((nw_listener_t)v25);
      }

      nw_listener_t v27 = nw_listener_create(secure_udp);
      objc_storeStrong((id *)&self->_nwListener, v27);
      if (v27)
      {
        nw_listener_set_queue(v27, (dispatch_queue_t)self->_dispatchQueue);
        v54[0] = 0;
        v54[1] = v54;
        v54[2] = 0x3032000000;
        v54[3] = __Block_byref_object_copy__84;
        v54[4] = __Block_byref_object_dispose__85;
        id v55 = (id)MEMORY[0x1B3EBCC80](v47);
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v48[2] = __72__RPStreamSession__serverUDPNWPathStartRequest_options_responseHandler___block_invoke_2;
        v48[3] = &unk_1E605D898;
        v48[4] = v27;
        v48[5] = self;
        int v52 = v54;
        id v49 = v24;
        id v28 = v63;
        v53[0] = v62[0];
        *(_OWORD *)((char *)v53 + 12) = *(_OWORD *)((char *)v62 + 12);
        id v50 = v28;
        uint64_t v51 = v45;
        MEMORY[0x1B3EBC8F0](v27, v48);
        nw_listener_set_new_connection_handler(v27, &__block_literal_global_167);
        if (gLogCategory_RPStreamSession <= 30
          && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        nw_listener_start(v27);

        _Block_object_dispose(v54, 8);
      }
      else
      {
        uint64_t v34 = RPErrorF();
        int v35 = (void *)v68[5];
        v68[5] = v34;
      }
      goto LABEL_52;
    }
  }
  uint64_t v38 = RPErrorF();
  id v24 = v68[5];
  v68[5] = v38;
LABEL_52:

LABEL_53:
LABEL_54:

LABEL_55:
  v11[2](v11);

  _Block_object_dispose(&v67, 8);
}

uint64_t __72__RPStreamSession__serverUDPNWPathStartRequest_options_responseHandler___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v1 + 32) + 16);
    return v2();
  }
  return result;
}

void __72__RPStreamSession__serverUDPNWPathStartRequest_options_responseHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (gLogCategory_RPStreamSession <= 30
    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 16))
  {
    if (a2 == 3 || v5)
    {
      if (v5) {
        id v6 = nw_error_copy_cf_error(v5);
      }
      else {
        id v6 = 0;
      }
      if (gLogCategory_RPStreamSession <= 90
        && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8);
      uint64_t v13 = *(void *)(v12 + 40);
      if (!v13)
      {
        id v15 = 0;
        goto LABEL_23;
      }
      id v14 = RPNestedErrorF();
      (*(void (**)(uint64_t, void, void, void *))(v13 + 16))(v13, 0, 0, v14);

LABEL_21:
      uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8);
      id v15 = *(void **)(v12 + 40);
LABEL_23:
      *(void *)(v12 + 40) = 0;

LABEL_24:
      goto LABEL_25;
    }
    if ((a2 - 1) <= 1 && *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
    {
      id v6 = (void *)nw_listener_copy_local_endpoint();
      if (!v6)
      {
        if (gLogCategory_RPStreamSession <= 90
          && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        goto LABEL_24;
      }
      id v7 = *(void **)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 48);
      uint64_t v9 = *(void *)(a1 + 56);
      uint64_t v10 = *(void *)(a1 + 64);
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      v16[0] = *(_OWORD *)(a1 + 80);
      *(_OWORD *)((char *)v16 + 12) = *(_OWORD *)(a1 + 92);
      [v7 _serverUDPNWPathNextWithEndpoint:v6 nwInterface:v8 selfMACData:v9 peerIP:v16 peerMACData:v10 usb:0 responseHandler:v11];
      goto LABEL_21;
    }
  }
LABEL_25:
}

void __72__RPStreamSession__serverUDPNWPathStartRequest_options_responseHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  id v4 = v2;
  if (gLogCategory_RPStreamSession <= 30)
  {
    if (gLogCategory_RPStreamSession != -1 || (int v3 = _LogCategory_Initialize(), v2 = v4, v3))
    {
      LogPrintF();
      uint64_t v2 = v4;
    }
  }
  nw_connection_cancel(v2);
}

- (void)_serverUDPNWPathNextWithEndpoint:(id)a3 nwInterface:(id)a4 selfMACData:(id)a5 peerIP:(id *)a6 peerMACData:(id)a7 usb:(BOOL)a8 responseHandler:(id)a9
{
  BOOL v9 = a8;
  v69[16] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  interface = a4;
  id v58 = a5;
  id v15 = a7;
  id v16 = a9;
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__6;
  uint64_t v67 = __Block_byref_object_dispose__6;
  id v68 = 0;
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __115__RPStreamSession__serverUDPNWPathNextWithEndpoint_nwInterface_selfMACData_peerIP_peerMACData_usb_responseHandler___block_invoke;
  v60[3] = &unk_1E605D6B0;
  v62 = &v63;
  id v17 = v16;
  id v61 = v17;
  id v18 = (void (**)(void))MEMORY[0x1B3EBCC80](v60);
  uint64_t v19 = nw_endpoint_get_address(v14);
  if (!v19)
  {
    uint64_t v41 = RPErrorF();
    uint64_t v22 = (void *)v64[5];
    v64[5] = v41;
    goto LABEL_36;
  }
  unsigned int Port = SockAddrGetPort();
  int sa_family = v19->sa_family;
  unsigned int v56 = Port;
  if (sa_family != 30)
  {
    if (sa_family == 2 && !*(_DWORD *)&v19->sa_data[2]) {
      goto LABEL_5;
    }
LABEL_11:
    LOBYTE(v69[0]) = 0;
    SockAddrToString();
    uint64_t v22 = [NSString stringWithUTF8String:v69];
    if (!v15) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
  if (*(_DWORD *)&v19->sa_data[6]
    || *(_DWORD *)&v19->sa_data[10]
    || *(_DWORD *)&v19[1].sa_len
    || *(_DWORD *)&v19[1].sa_data[2])
  {
    goto LABEL_11;
  }
LABEL_5:
  uint64_t v22 = 0;
  if (!v15)
  {
LABEL_6:
    uint64_t address_with_ethernet = (uint64_t)nw_endpoint_create_address(&a6->var0);
    goto LABEL_13;
  }
LABEL_12:
  WORD2(v69[0]) = 0;
  LODWORD(v69[0]) = 0;
  uint64_t v24 = [v15 bytes];
  int v25 = *(_DWORD *)v24;
  WORD2(v69[0]) = *(_WORD *)(v24 + 4);
  LODWORD(v69[0]) = v25;
  uint64_t address_with_ethernet = nw_endpoint_create_address_with_ethernet();
LABEL_13:
  v26 = (void *)address_with_ethernet;
  if (!address_with_ethernet) {
    goto LABEL_40;
  }
  if (!v9)
  {
    nw_parameters_t secure_udp = nw_parameters_create_secure_udp((nw_parameters_configure_protocol_block_t)*MEMORY[0x1E4F38C90], &__block_literal_global_172);
    if (secure_udp)
    {
LABEL_19:
      nw_parameters_set_delegated_unique_pid();
      nw_parameters_set_reuse_local_address(secure_udp, 1);
      if (interface) {
        nw_parameters_require_interface(secure_udp, interface);
      }
      nw_parameters_set_local_endpoint(secure_udp, v14);
      evaluator_for_endpoint = (OS_nw_path_evaluator *)nw_path_create_evaluator_for_endpoint();
      nwPathEvaluator = self->_nwPathEvaluator;
      self->_nwPathEvaluator = evaluator_for_endpoint;

      if (self->_nwPathEvaluator)
      {
        v69[0] = 0;
        v69[1] = 0;
        nw_path_evaluator_get_client_id();
        uint64_t v33 = (NSUUID *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v69];
        nwClientID = self->_nwClientID;
        self->_nwClientID = v33;

        int v35 = NSRandomData();
        objc_storeStrong((id *)&self->_streamKey, v35);
        if (gLogCategory_RPStreamSession <= 30
          && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
        {
          uint64_t streamType = self->_streamType;
          if (streamType > 3) {
            id v37 = "?";
          }
          else {
            id v37 = off_1E605D948[streamType];
          }
          id v54 = a6;
          id v55 = v15;
          int v52 = v14;
          v53 = v22;
          uint64_t v51 = self->_nwClientID;
          uint64_t trafficFlags = self->_trafficFlags;
          id v50 = &unk_1B3972247;
          uint64_t streamFlags = self->_streamFlags;
          id v48 = &unk_1B39722BA;
          streamID = self->_streamID;
          v46 = v37;
          LogPrintF();
        }
        id v38 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v39 = v38;
        if (v22) {
          [v38 setObject:v22 forKeyedSubscript:@"_streamAddr"];
        }
        if (v58) {
          [v39 setObject:v58 forKeyedSubscript:@"_streamMACAddr"];
        }
        objc_msgSend(v39, "setObject:forKeyedSubscript:", v35, @"_streamKey", streamID, v46, streamFlags, v48, trafficFlags, v50, v51, v52, v53, v54, v55);
        v40 = [NSNumber numberWithInt:v56];
        [v39 setObject:v40 forKeyedSubscript:@"_streamPort"];

        (*((void (**)(id, void *, void, void))v17 + 2))(v17, v39, 0, 0);
        goto LABEL_35;
      }
      goto LABEL_39;
    }
LABEL_40:
    uint64_t v44 = RPErrorF();
    nw_parameters_t secure_udp = v64[5];
    v64[5] = v44;
    goto LABEL_35;
  }
  legacy_tcp_socket = nw_parameters_create_legacy_tcp_socket();
  nw_parameters_t secure_udp = legacy_tcp_socket;
  if (!legacy_tcp_socket) {
    goto LABEL_40;
  }
  uint64_t v29 = nw_parameters_copy_default_protocol_stack(legacy_tcp_socket);
  if (v29)
  {
    options = nw_udp_create_options();
    nw_udp_options_set_no_metadata();
    nw_protocol_stack_set_transport_protocol(v29, options);

    goto LABEL_19;
  }
LABEL_39:
  uint64_t v42 = RPErrorF();
  uint64_t v43 = (void *)v64[5];
  v64[5] = v42;

LABEL_35:
LABEL_36:

  v18[2](v18);
  _Block_object_dispose(&v63, 8);
}

uint64_t __115__RPStreamSession__serverUDPNWPathNextWithEndpoint_nwInterface_selfMACData_peerIP_peerMACData_usb_responseHandler___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v1 + 32) + 16);
    return v2();
  }
  return result;
}

uint64_t __115__RPStreamSession__serverUDPNWPathNextWithEndpoint_nwInterface_selfMACData_peerIP_peerMACData_usb_responseHandler___block_invoke_2()
{
  return nw_udp_options_set_no_metadata();
}

- (void)_clientUDPSocketStartWithCompletion:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  int streamSocket = self->_streamSocket;
  if ((streamSocket & 0x80000000) == 0)
  {
    if (close(streamSocket) && *__error()) {
      __error();
    }
    self->_int streamSocket = -1;
  }
  unsigned int v15 = 0;
  LODWORD(v12) = 3;
  if (ServerSocketOpenEx2())
  {
    RPErrorF();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v4[2](v4, v6);
  }
  else
  {
    if (self->_streamQoS >= 1) {
      -[RPStreamSession setStreamQoSOnSocket:](self, "setStreamQoSOnSocket:", self->_streamSocket, v12, &self->_streamSocket);
    }
    if (gLogCategory_RPStreamSession <= 30
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v6 setObject:self->_streamID forKeyedSubscript:@"_streamID"];
    id v7 = [NSNumber numberWithInt:v15];
    [v6 setObject:v7 forKeyedSubscript:@"_streamPort"];

    uint64_t v8 = [NSNumber numberWithInt:self->_streamType];
    [v6 setObject:v8 forKeyedSubscript:@"_streamType"];

    BOOL v9 = [NSNumber numberWithUnsignedInt:self->_trafficFlags];
    [v6 setObject:v9 forKeyedSubscript:@"_tf"];

    serviceType = self->_serviceType;
    if (serviceType) {
      [v6 setObject:serviceType forKeyedSubscript:@"_streamSrv"];
    }
    messenger = self->_messenger;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __55__RPStreamSession__clientUDPSocketStartWithCompletion___block_invoke;
    v13[3] = &unk_1E605CEF0;
    v13[4] = self;
    id v14 = v4;
    [(RPMessageable *)messenger sendRequestID:@"_streamStart" request:v6 destinationID:@"rapport:rdid:DirectPeer" options:0 responseHandler:v13];
  }
}

void __55__RPStreamSession__clientUDPSocketStartWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v7;
  id v13 = v10;
  if (!v10 || v9)
  {
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v11 = *(void *)(a1 + 40);
    if (v9)
    {
      (*(void (**)(uint64_t, id))(v11 + 16))(v11, v9);
    }
    else
    {
      uint64_t v12 = RPErrorF();
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
    }
  }
  else
  {
    [*(id *)(a1 + 32) _clientUDPSocketStartResponse:v10 options:v8 completion:*(void *)(a1 + 40)];
  }
}

- (void)_clientUDPSocketStartResponse:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  CFDataGetTypeID();
  uint64_t v11 = CFDictionaryGetTypedValue();
  if ((unint64_t)[v11 length] >= 0x20) {
    objc_storeStrong((id *)&self->_streamKey, v11);
  }
  if (!CFDictionaryGetInt64Ranged()) {
    goto LABEL_7;
  }
  CFStringGetTypeID();
  if (![ (id) CFDictionaryGetTypedValue() UTF8String]
    || (*(void *)&v19.sa_len = 0,
        *(void *)&v19.sa_data[6] = 0,
        int v21 = 0,
        uint64_t v20 = 0,
        StringToSockAddr())
    || (SockAddrSetPort(), SockAddrConvertToIPv6())
    || (int streamSocket = self->_streamSocket, Size = SockAddrGetSize(), connect(streamSocket, &v19, Size))
    && (!*__error() || *__error()))
  {
LABEL_7:
    uint64_t v12 = RPErrorF();
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v10[2](v10, v12);
  }
  else
  {
    *(void *)&v16.sa_len = 0;
    *(void *)&v16.sa_data[6] = 0;
    int v18 = 0;
    uint64_t v17 = 0;
    socklen_t v15 = 28;
    getsockname(self->_streamSocket, &v16, &v15);
    if (gLogCategory_RPStreamSession <= 30
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v10[2](v10, 0);
  }
}

- (void)_serverUDPSocketStartRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  CFStringGetTypeID();
  if ([ (id) CFDictionaryGetTypedValue() UTF8String])
  {
    *(void *)&v27.sa_len = 0;
    *(void *)&v27.sa_data[6] = 0;
    int v29 = 0;
    uint64_t v28 = 0;
    int v26 = 0;
    uint64_t v25 = StringToSockAddr();
    if (!v25)
    {
      if (CFDictionaryGetInt64Ranged())
      {
        SockAddrSetPort();
        self->_uint64_t trafficFlags = CFDictionaryGetInt64Ranged();
        CFStringGetTypeID();
        if ([ (id) CFDictionaryGetTypedValue() UTF8String])
        {
          memset(v23, 0, sizeof(v23));
          int v24 = 0;
          LODWORD(v25) = StringToSockAddr();
          if (!v25)
          {
            p_int streamSocket = &self->_streamSocket;
            if ((self->_streamSocket & 0x80000000) == 0)
            {
              if (close(self->_streamSocket) && *__error()) {
                __error();
              }
              *p_int streamSocket = -1;
            }
            sockaddr v19 = &self->_streamSocket;
            LODWORD(streamID) = 1;
            LODWORD(v25) = ServerSocketOpenEx2();
            if (!v25)
            {
              SockAddrSetPort();
              if (self->_streamQoS >= 1) {
                -[RPStreamSession setStreamQoSOnSocket:](self, "setStreamQoSOnSocket:", self->_streamSocket, streamID, v19);
              }
              LODWORD(v25) = connect(*p_streamSocket, &v27, HIDWORD(v25));
              if (!v25)
              {
                LODWORD(v25) = 0;
                goto LABEL_28;
              }
              if (*__error())
              {
                LODWORD(v25) = *__error();
                if (!v25)
                {
LABEL_28:
                  id v13 = NSRandomData();
                  objc_storeStrong((id *)&self->_streamKey, v13);
                  if (gLogCategory_RPStreamSession <= 30
                    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
                  {
                    uint64_t streamType = self->_streamType;
                    if (streamType > 3) {
                      socklen_t v15 = "?";
                    }
                    else {
                      socklen_t v15 = off_1E605D948[streamType];
                    }
                    serviceType = self->_serviceType;
                    uint64_t v20 = v23;
                    int v21 = &v27;
                    streamID = self->_streamID;
                    sockaddr v19 = (int *)v15;
                    LogPrintF();
                  }
                  v30[1] = @"_streamPort";
                  v31[0] = v13;
                  v30[0] = @"_streamKey";
                  sockaddr v16 = objc_msgSend(NSNumber, "numberWithInt:", 0, streamID, v19, v20, v21, serviceType);
                  v31[1] = v16;
                  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];

                  (*((void (**)(id, void *, void, void))v10 + 2))(v10, v17, 0, 0);
LABEL_38:

                  goto LABEL_12;
                }
              }
              else
              {
                LODWORD(v25) = -6700;
              }
            }
            id v13 = RPErrorF();
            if (gLogCategory_RPStreamSession <= 90
              && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0, 0, v13);
            goto LABEL_38;
          }
        }
      }
    }
  }
  uint64_t v11 = RPErrorF();
  if (gLogCategory_RPStreamSession <= 90
    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0, 0, v11);

LABEL_12:
}

- (void)_clientRPConnectionPrepareWithCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (gLogCategory_RPStreamSession <= 30
    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v5 = RPStreamSessionLog();
  id v6 = RPStreamSessionLog();
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, self->_streamID);

  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    streamID = self->_streamID;
    *(_DWORD *)buf = 138412290;
    sockaddr v19 = streamID;
    _os_signpost_emit_with_name_impl(&dword_1B38EA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "RPStreamBringUpTime", " enableTelemetry=YES {streamID:%@, signpost.description:begin_time}", buf, 0xCu);
  }

  Curve25519MakeKeyPair();
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v9 setObject:self->_streamID forKeyedSubscript:@"_streamID"];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:buf length:32];
  [v9 setObject:v10 forKeyedSubscript:@"_streamKey"];

  uint64_t v11 = [NSNumber numberWithInt:self->_streamType];
  [v9 setObject:v11 forKeyedSubscript:@"_streamType"];

  uint64_t v12 = [NSNumber numberWithUnsignedInt:self->_trafficFlags];
  [v9 setObject:v12 forKeyedSubscript:@"_tf"];

  serviceType = self->_serviceType;
  if (serviceType) {
    [v9 setObject:serviceType forKeyedSubscript:@"_streamSrv"];
  }
  messenger = self->_messenger;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  _OWORD v16[2] = __60__RPStreamSession__clientRPConnectionPrepareWithCompletion___block_invoke;
  v16[3] = &unk_1E605CEF0;
  v16[4] = self;
  id v17 = v4;
  id v15 = v4;
  [(RPMessageable *)messenger sendRequestID:@"_streamStart" request:v9 destinationID:@"rapport:rdid:DirectPeer" options:0 responseHandler:v16];
}

void __60__RPStreamSession__clientRPConnectionPrepareWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v7;
  id v13 = v10;
  if (!v10 || v9)
  {
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v11 = *(void *)(a1 + 40);
    if (v9)
    {
      (*(void (**)(uint64_t, id))(v11 + 16))(v11, v9);
    }
    else
    {
      uint64_t v12 = RPErrorF();
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
    }
  }
  else
  {
    [*(id *)(a1 + 32) _clientRPConnectionPrepareResponse:v10 options:v8 completion:*(void *)(a1 + 40)];
  }
}

- (void)_clientRPConnectionPrepareResponse:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v34 = 0;
  int v35 = &v34;
  uint64_t v36 = 0x3032000000;
  id v37 = __Block_byref_object_copy__6;
  id v38 = __Block_byref_object_dispose__6;
  id v39 = 0;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __73__RPStreamSession__clientRPConnectionPrepareResponse_options_completion___block_invoke;
  void v31[3] = &unk_1E605D6B0;
  uint64_t v33 = &v34;
  id v11 = v10;
  id v32 = v11;
  uint64_t v12 = (void (**)(void))MEMORY[0x1B3EBCC80](v31);
  int Int64Ranged = CFDictionaryGetInt64Ranged();
  if (Int64Ranged
    && (self->_peerunsigned int Port = Int64Ranged,
        CFStringGetTypeID(),
        [ (id) CFDictionaryGetTypedValue() UTF8String]))
  {
    int v27 = 0;
    uint64_t v28 = 0;
    int v30 = 0;
    uint64_t v29 = 0;
    uint64_t v26 = StringToSockAddr();
    if (v26)
    {
      uint64_t v23 = RPErrorF();
      id v17 = (id)v35[5];
      v35[5] = v23;
    }
    else
    {
      SockAddrSetPort();
      NSPrintF();
      id v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      destinationString = self->_destinationString;
      self->_destinationString = v14;

      sockaddr v16 = CFDictionaryGetCFDataOfLength();
      id v17 = v16;
      if (!v16) {
        goto LABEL_21;
      }
      id v17 = v16;
      if (objc_msgSend(v17, "bytes", (char *)&v26 + 4))
      {
        [v17 bytes];
        cccurve25519();
      }
      else
      {
        cccurve25519_make_pub();
      }
      memset_s(self->_ourCurveSK, 0x20uLL, 0, 0x20uLL);
      int8x16_t v18 = vorrq_s8(__s[1], __s[0]);
      if (vorr_s8(*(int8x8_t *)v18.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v18, v18, 8uLL)))
      {
        CryptoHKDF();
        sockaddr v19 = (NSData *)objc_msgSend(MEMORY[0x1E4F1C9B8], "_newZeroingDataWithBytes:length:", __s, 32, __s);
        pskData = self->_pskData;
        self->_pskData = v19;

        memset_s(__s, 0x20uLL, 0, 0x20uLL);
        if (gLogCategory_RPStreamSession <= 30
          && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (self->_prepareOnly) {
          (*((void (**)(id, void))v11 + 2))(v11, 0);
        }
        else {
          [(RPStreamSession *)self _clientRPConnectionStartWithCompletion:v11];
        }
      }
      else
      {
LABEL_21:
        uint64_t v24 = RPErrorF();
        uint64_t v25 = (void *)v35[5];
        v35[5] = v24;
      }
    }
  }
  else
  {
    uint64_t v21 = RPErrorF();
    uint64_t v22 = (void *)v35[5];
    v35[5] = v21;
  }
  v12[2](v12);

  _Block_object_dispose(&v34, 8);
}

uint64_t __73__RPStreamSession__clientRPConnectionPrepareResponse_options_completion___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v1 + 32) + 16);
    return v2();
  }
  return result;
}

- (void)_clientRPConnectionStartWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if (gLogCategory_RPStreamSession <= 30
    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    uint64_t streamType = self->_streamType;
    if (streamType > 3) {
      id v6 = "?";
    }
    else {
      id v6 = off_1E605D948[streamType];
    }
    destinationString = self->_destinationString;
    peerunsigned int Port = self->_peerPort;
    streamID = self->_streamID;
    id v13 = v6;
    LogPrintF();
  }
  -[RPStreamSession _updateTrafficRegistrationForDestination:](self, "_updateTrafficRegistrationForDestination:", self->_destinationString, streamID, v13, destinationString, peerPort);
  id v7 = objc_alloc_init(RPConnection);
  [(RPConnection *)v7 setDestinationString:self->_destinationString];
  [(RPConnection *)v7 setDispatchQueue:self->_dispatchQueue];
  [(RPConnection *)v7 setFlags:[(RPConnection *)v7 flags] | 0x80000];
  id v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Stream-%u", self->_peerPort);
  [(RPConnection *)v7 setLabel:v8];

  [(RPConnection *)v7 setPskData:self->_pskData];
  pskData = self->_pskData;
  self->_pskData = 0;

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke;
  v21[3] = &unk_1E605B540;
  v21[4] = self;
  [(RPConnection *)v7 setInvalidationHandler:v21];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke_2;
  v20[3] = &unk_1E605CBA8;
  v20[4] = self;
  [(RPConnection *)v7 setReceivedEventHandler:v20];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke_3;
  v19[3] = &unk_1E605CBD0;
  v19[4] = self;
  [(RPConnection *)v7 setReceivedRequestHandler:v19];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke_4;
  v18[3] = &unk_1E605B540;
  v18[4] = self;
  [(RPConnection *)v7 setFlowControlWriteChangedHandler:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke_5;
  v17[3] = &unk_1E605CB38;
  v17[4] = self;
  void v17[5] = v7;
  [(RPConnection *)v7 setStateChangedHandler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  _OWORD v16[2] = __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke_201;
  v16[3] = &unk_1E605B5B0;
  v16[4] = self;
  [(RPConnection *)v7 setReadErrorHandler:v16];
  rpCnx = self->_rpCnx;
  self->_rpCnx = v7;
  id v11 = v7;

  [(RPConnection *)v11 activate];
  v4[2](v4, 0);
}

uint64_t __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(void **)(v2 + 104);
  *(void *)(v2 + 104) = 0;

  id v4 = *(void **)(a1 + 32);
  return [v4 _invalidated];
}

void __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = MEMORY[0x1B3EBCC80](*(void *)(*(void *)(a1 + 32) + 216));
  id v10 = (void *)v9;
  if (v9) {
    (*(void (**)(uint64_t, id, id, id))(v9 + 16))(v9, v11, v7, v8);
  }
}

void __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v14 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = MEMORY[0x1B3EBCC80](*(void *)(*(void *)(a1 + 32) + 224));
  id v13 = (void *)v12;
  if (v12) {
    (*(void (**)(uint64_t, id, id, id, id))(v12 + 16))(v12, v14, v9, v10, v11);
  }
}

void __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = (void (**)(void))MEMORY[0x1B3EBCC80](*(void *)(*(void *)(a1 + 32) + 184));
  if (v1)
  {
    uint64_t v2 = v1;
    v1[2]();
    uint64_t v1 = v2;
  }
}

void __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke_5(uint64_t a1, int a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a2 == 1)
  {
    int v3 = [MEMORY[0x1E4F28F80] processInfo];
    id v4 = [v3 processName];

    id v5 = RPStreamSessionLog();
    id v6 = RPStreamSessionLog();
    os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, *(const void **)(*(void *)(a1 + 32) + 264));

    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 264);
      unsigned int v9 = [*(id *)(a1 + 40) linkType];
      if (v9 > 0xB) {
        id v10 = "?";
      }
      else {
        id v10 = off_1E605D968[v9];
      }
      int v15 = 138412802;
      uint64_t v16 = v8;
      __int16 v17 = 2080;
      int8x16_t v18 = v10;
      __int16 v19 = 2080;
      uint64_t v20 = [v4 UTF8String];
      _os_signpost_emit_with_name_impl(&dword_1B38EA000, v5, OS_SIGNPOST_INTERVAL_END, v7, "RPStreamBringUpTime", " enableTelemetry=YES {streamID:%@, linkType=%{signpost.telemetry:string1}s, process=%{signpost.telemetry:string2}s, signpost.description:end_time}", (uint8_t *)&v15, 0x20u);
    }

    id v11 = *(int **)(a1 + 32);
    if (v11[38] >= 1)
    {
      uint64_t v12 = [*(id *)(a1 + 40) tcpConnection];
      objc_msgSend(v11, "setStreamQoSOnSocket:", objc_msgSend(v12, "socketFD"));

      id v11 = *(int **)(a1 + 32);
    }
    uint64_t v13 = [v11 connectionReadyHandler];
    id v14 = (void *)v13;
    if (v13) {
      (*(void (**)(uint64_t))(v13 + 16))(v13);
    }
  }
}

void __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke_201(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 code] == -6723 || objc_msgSend(v3, "code") == -6753)
  {
    id v4 = (void *)MEMORY[0x1B3EBCC80](*(void *)(*(void *)(a1 + 32) + 168));
    if (v4)
    {
      id v5 = *(NSObject **)(*(void *)(a1 + 32) + 176);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke_2_202;
      block[3] = &unk_1E605D7E0;
      block[4] = v4;
      dispatch_async(v5, block);
    }
  }
}

uint64_t __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke_2_202(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_serverRPConnectionStartRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x3032000000;
  uint64_t v43 = __Block_byref_object_copy__6;
  uint64_t v44 = __Block_byref_object_dispose__6;
  id v45 = 0;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __75__RPStreamSession__serverRPConnectionStartRequest_options_responseHandler___block_invoke;
  v37[3] = &unk_1E605D8C0;
  id v39 = &v40;
  v37[4] = self;
  id v11 = v10;
  id v38 = v11;
  uint64_t v12 = (void (**)(void))MEMORY[0x1B3EBCC80](v37);
  int v36 = 0;
  uint64_t v13 = CFDictionaryGetCFDataOfLength();
  if (v13
    && (self->_uint64_t trafficFlags = CFDictionaryGetInt64Ranged(),
        CFStringGetTypeID(),
        [ (id) CFDictionaryGetTypedValue() UTF8String])
    && (memset(&v35[10], 0, 28), (int v36 = StringToSockAddr()) == 0))
  {
    id v14 = (CUTCPServer *)objc_alloc_init(MEMORY[0x1E4F5E208]);
    tcpServer = self->_tcpServer;
    self->_tcpServer = v14;

    [(CUTCPServer *)self->_tcpServer setDispatchQueue:self->_dispatchQueue];
    [(CUTCPServer *)self->_tcpServer setFlags:201];
    *(_OWORD *)int v35 = *(_OWORD *)&v35[10];
    *(_OWORD *)&v35[3] = *(_OWORD *)&v35[13];
    [(CUTCPServer *)self->_tcpServer setInterfaceAddress:v35];
    if ((self->_streamFlags & 5) != 0)
    {
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __75__RPStreamSession__serverRPConnectionStartRequest_options_responseHandler___block_invoke_2;
      v34[3] = &unk_1E605CA48;
      v34[4] = self;
      [(CUTCPServer *)self->_tcpServer setConnectionAcceptHandler:v34];
    }
    else
    {
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __75__RPStreamSession__serverRPConnectionStartRequest_options_responseHandler___block_invoke_3;
      v33[3] = &unk_1E605D8E8;
      v33[4] = self;
      [(CUTCPServer *)self->_tcpServer setConnectionStartedHandler:v33];
    }
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __75__RPStreamSession__serverRPConnectionStartRequest_options_responseHandler___block_invoke_4;
    v32[3] = &unk_1E605B540;
    v32[4] = self;
    [(CUTCPServer *)self->_tcpServer setInvalidationHandler:v32];
    uint64_t v16 = self->_tcpServer;
    __int16 v17 = (id *)(v41 + 5);
    id obj = (id)v41[5];
    [(CUTCPServer *)v16 activateDirectAndReturnError:&obj];
    objc_storeStrong(v17, obj);
    if (v41[5])
    {
      uint64_t v28 = RPNestedErrorF();
      uint64_t v29 = (void *)v41[5];
      v41[5] = v28;
    }
    else
    {
      uint64_t v18 = [(CUTCPServer *)self->_tcpServer tcpListeningPort];
      SockAddrSetPort();
      Curve25519MakeKeyPair();
      id v19 = v13;
      if ([v19 bytes])
      {
        [v19 bytes];
        cccurve25519();
      }
      else
      {
        cccurve25519_make_pub();
      }
      memset_s(__s, 0x20uLL, 0, 0x20uLL);
      int8x16_t v20 = vorrq_s8(v48[1], v48[0]);
      if (vorr_s8(*(int8x8_t *)v20.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v20, v20, 8uLL)))
      {
        CryptoHKDF();
        uint64_t v21 = (NSData *)objc_msgSend(MEMORY[0x1E4F1C9B8], "_newZeroingDataWithBytes:length:", v48, 32, v48);
        pskData = self->_pskData;
        self->_pskData = v21;

        memset_s(v48, 0x20uLL, 0, 0x20uLL);
        if (gLogCategory_RPStreamSession <= 30
          && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v46[0] = @"_streamKey";
        uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v50 length:32];
        v46[1] = @"_streamPort";
        v47[0] = v23;
        uint64_t v24 = [NSNumber numberWithInt:v18];
        v47[1] = v24;
        uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:2];

        (*((void (**)(id, void *, void, void))v11 + 2))(v11, v25, 0, 0);
      }
      else
      {
        uint64_t v30 = RPErrorF();
        uint64_t v25 = (void *)v41[5];
        v41[5] = v30;
      }
    }
  }
  else
  {
    uint64_t v26 = RPErrorF();
    int v27 = (void *)v41[5];
    v41[5] = v26;
  }
  v12[2](v12);

  _Block_object_dispose(&v40, 8);
}

uint64_t __75__RPStreamSession__serverRPConnectionStartRequest_options_responseHandler___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(*(void *)(result + 48) + 8) + 40);
  if (!v1) {
    return result;
  }
  uint64_t v2 = (void *)result;
  if (gLogCategory_RPStreamSession <= 90)
  {
    if (gLogCategory_RPStreamSession == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_7;
      }
      uint64_t v1 = *(void *)(*(void *)(v2[6] + 8) + 40);
    }
    uint64_t v6 = v1;
    LogPrintF();
  }
LABEL_7:
  objc_msgSend(*(id *)(v2[4] + 112), "invalidate", v6);
  uint64_t v3 = v2[4];
  id v4 = *(void **)(v3 + 112);
  *(void *)(v3 + 112) = 0;

  id v5 = *(uint64_t (**)(void))(v2[5] + 16);
  return v5();
}

void __75__RPStreamSession__serverRPConnectionStartRequest_options_responseHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(unsigned char **)(a1 + 32);
  if (!v3[8])
  {
    [v3 _serverRPConnectionHandleConnectionAccepted:a2];
    [*(id *)(*(void *)(a1 + 32) + 112) invalidate];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 112);
    *(void *)(v4 + 112) = 0;
  }
}

void __75__RPStreamSession__serverRPConnectionStartRequest_options_responseHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(unsigned char **)(a1 + 32);
  if (!v3[8])
  {
    [v3 _serverRPConnectionHandleConnectionStarted:a2];
    [*(id *)(*(void *)(a1 + 32) + 112) invalidate];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 112);
    *(void *)(v4 + 112) = 0;
  }
}

uint64_t __75__RPStreamSession__serverRPConnectionStartRequest_options_responseHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 112);
  *(void *)(v2 + 112) = 0;

  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 _invalidated];
}

- (void)_serverRPConnectionHandleConnectionAccepted:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (gLogCategory_RPStreamSession <= 30
    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v8 = (void (**)(id, void))MEMORY[0x1B3EBCC80](self->_streamAcceptHandler);
  if (v8)
  {
    id streamAcceptHandler = self->_streamAcceptHandler;
    self->_id streamAcceptHandler = 0;

    int streamSocket = self->_streamSocket;
    if ((streamSocket & 0x80000000) == 0 && close(streamSocket) && *__error()) {
      __error();
    }
    self->_int streamSocket = v3;
    if (self->_streamQoS >= 1) {
      [(RPStreamSession *)self setStreamQoSOnSocket:v3];
    }
    v8[2](v8, v6);
  }
  else
  {
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    close(v3);
  }
}

- (void)_serverRPConnectionHandleConnectionStarted:(id)a3
{
  id v4 = a3;
  if (gLogCategory_RPStreamSession <= 30
    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v5 = objc_alloc_init(RPConnection);
  [(RPConnection *)v5 setDispatchQueue:self->_dispatchQueue];
  [(RPConnection *)v5 setFlags:[(RPConnection *)v5 flags] | 0x80000];
  uint64_t v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"Stream-%u", -[CUTCPServer tcpListeningPort](self->_tcpServer, "tcpListeningPort"));
  [(RPConnection *)v5 setLabel:v6];

  os_signpost_id_t v7 = [(RPConnection *)v5 label];
  [v4 setLabel:v7];

  [(RPConnection *)v5 setPskData:self->_pskData];
  pskData = self->_pskData;
  self->_pskData = 0;

  [(RPConnection *)v5 setTcpConnection:v4];
  if (self->_streamQoS >= 1) {
    -[RPStreamSession setStreamQoSOnSocket:](self, "setStreamQoSOnSocket:", [v4 socketFD]);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  _OWORD v16[2] = __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke;
  v16[3] = &unk_1E605B540;
  v16[4] = self;
  [(RPConnection *)v5 setInvalidationHandler:v16];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke_2;
  v15[3] = &unk_1E605CBA8;
  v15[4] = self;
  [(RPConnection *)v5 setReceivedEventHandler:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke_3;
  v14[3] = &unk_1E605CBD0;
  v14[4] = self;
  [(RPConnection *)v5 setReceivedRequestHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke_4;
  v13[3] = &unk_1E605B540;
  v13[4] = self;
  [(RPConnection *)v5 setFlowControlWriteChangedHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke_5;
  v12[3] = &unk_1E605CA48;
  v12[4] = self;
  [(RPConnection *)v5 setStateChangedHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke_6;
  v11[3] = &unk_1E605B5B0;
  v11[4] = self;
  [(RPConnection *)v5 setReadErrorHandler:v11];
  rpCnx = self->_rpCnx;
  self->_rpCnx = v5;
  id v10 = v5;

  [(RPConnection *)v10 activate];
}

uint64_t __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 104);
  *(void *)(v2 + 104) = 0;

  id v4 = *(void **)(a1 + 32);
  return [v4 _invalidated];
}

void __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = MEMORY[0x1B3EBCC80](*(void *)(*(void *)(a1 + 32) + 216));
  id v10 = (void *)v9;
  if (v9) {
    (*(void (**)(uint64_t, id, id, id))(v9 + 16))(v9, v11, v7, v8);
  }
}

void __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v14 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = MEMORY[0x1B3EBCC80](*(void *)(*(void *)(a1 + 32) + 224));
  uint64_t v13 = (void *)v12;
  if (v12) {
    (*(void (**)(uint64_t, id, id, id, id))(v12 + 16))(v12, v14, v9, v10, v11);
  }
}

void __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = (void (**)(void))MEMORY[0x1B3EBCC80](*(void *)(*(void *)(a1 + 32) + 184));
  if (v1)
  {
    uint64_t v2 = v1;
    v1[2]();
    uint64_t v1 = v2;
  }
}

void __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke_5(uint64_t a1, int a2)
{
  if (a2 == 1)
  {
    uint64_t v3 = [*(id *)(a1 + 32) connectionReadyHandler];
    if (v3)
    {
      id v4 = v3;
      v3[2]();
      uint64_t v3 = v4;
    }
  }
}

void __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 code] == -6723 || objc_msgSend(v3, "code") == -6753)
  {
    id v4 = (void *)MEMORY[0x1B3EBCC80](*(void *)(*(void *)(a1 + 32) + 168));
    if (v4)
    {
      id v5 = *(NSObject **)(*(void *)(a1 + 32) + 176);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke_7;
      block[3] = &unk_1E605D7E0;
      block[4] = v4;
      dispatch_async(v5, block);
    }
  }
}

uint64_t __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unsigned)_getSockAddrInterfaceType:(const void *)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unsigned int v7 = 0;
  uint64_t v6 = 0;
  if (!SockAddrSimplify())
  {
    if (getifaddrs(&v6) && *__error()) {
      __error();
    }
    id v4 = v6;
    if (v6)
    {
      char v8 = 0;
      while (!v4->ifa_addr || !v4->ifa_name || SockAddrCompareAddr())
      {
        id v4 = v4->ifa_next;
        if (!v4) {
          goto LABEL_13;
        }
      }
      __strlcpy_chk();
LABEL_13:
      if (v8)
      {
        if (SocketGetInterfaceInfo())
        {
          if (gLogCategory_RPStreamSession <= 90
            && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
          {
            goto LABEL_30;
          }
        }
        else if (!v7 {
               && gLogCategory_RPStreamSession <= 90
        }
               && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
        {
LABEL_30:
          LogPrintF();
        }
      }
      else if (gLogCategory_RPStreamSession <= 90 {
             && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
      }
      {
        goto LABEL_30;
      }
    }
    else
    {
      if (gLogCategory_RPStreamSession > 90) {
        return v7;
      }
      if (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()) {
        goto LABEL_30;
      }
    }
  }
  if (v6) {
    MEMORY[0x1B3EBC610](v6, v3);
  }
  return v7;
}

- (id)_lowLatencySelfAddressString:(id *)a3
{
  CUGetInterfaceAddresses();
  return 0;
}

- (void)sendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (self->_rpCnx)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__RPStreamSession_sendEventID_event_options_completion___block_invoke;
    block[3] = &unk_1E605D910;
    block[4] = self;
    id v17 = v10;
    id v18 = v11;
    id v19 = v12;
    id v20 = v13;
    dispatch_async(dispatchQueue, block);
  }
  else
  {
    int v15 = RPErrorF();
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*((void (**)(id, void *))v13 + 2))(v13, v15);
  }
}

uint64_t __56__RPStreamSession_sendEventID_event_options_completion___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 104) sendEncryptedEventID:a1[5] event:a1[6] options:a1[7] completion:a1[8]];
}

- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (self->_rpCnx)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__RPStreamSession_sendRequestID_request_options_responseHandler___block_invoke;
    block[3] = &unk_1E605D910;
    block[4] = self;
    id v17 = v10;
    id v18 = v11;
    id v19 = v12;
    id v20 = v13;
    dispatch_async(dispatchQueue, block);
  }
  else
  {
    int v15 = RPErrorF();
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*((void (**)(id, void, void, void *))v13 + 2))(v13, 0, 0, v15);
  }
}

uint64_t __65__RPStreamSession_sendRequestID_request_options_responseHandler___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 104) sendEncryptedRequestID:a1[5] request:a1[6] xpcID:0 options:a1[7] responseHandler:a1[8]];
}

- (void)_updateTrafficRegistration
{
  if (self->_peerIP.sa.sa_family)
  {
    [(RPStreamSession *)self _updateTrafficRegistrationForIP:&self->_peerIP];
  }
  else if (self->_trafficFlags)
  {
    int streamSocket = self->_streamSocket;
    if ((streamSocket & 0x80000000) == 0)
    {
      *(void *)&v6.sa_len = 0;
      *(void *)&v6.sa_data[6] = 0;
      int v8 = 0;
      uint64_t v7 = 0;
      socklen_t v5 = 28;
      getpeername(streamSocket, &v6, &v5);
      if (v6.sa_family == 30 && v6.sa_data[6] == 254 && (v6.sa_data[7] & 0xC0) == 0x80)
      {
        int v4 = v8;
        if (v8)
        {
          if (v4 == if_nametoindex("awdl0")) {
            [(RPStreamSession *)self _updateTrafficRegistrationForIP:&v6];
          }
        }
      }
    }
  }
}

- (void)_updateTrafficRegistrationForIP:(id *)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (!self->_trafficSessionID)
  {
    socklen_t v5 = [MEMORY[0x1E4F29128] UUID];
    sockaddr v6 = [v5 UUIDString];
    trafficSessionID = self->_trafficSessionID;
    self->_trafficSessionID = v6;
  }
  if (gLogCategory_RPStreamSession <= 30
    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    uint64_t v16 = &unk_1B3972247;
    id v17 = self->_trafficSessionID;
    id v14 = a3;
    uint64_t trafficFlags = self->_trafficFlags;
    LogPrintF();
  }
  self->_trafficRegistrationCalled = 1;
  if (!self->_wifiManager)
  {
    int v8 = (CUWiFiManager *)objc_alloc_init(MEMORY[0x1E4F5E218]);
    wifiManager = self->_wifiManager;
    self->_wifiManager = v8;

    id v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.rapport.traffic_registration", v10);
    [(CUWiFiManager *)self->_wifiManager setDispatchQueue:v11];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __51__RPStreamSession__updateTrafficRegistrationForIP___block_invoke;
    v19[3] = &unk_1E605B540;
    v19[4] = self;
    [(CUWiFiManager *)self->_wifiManager setWifiStateChangedHandler:v19];
    if (objc_opt_respondsToSelector()) {
      [(CUWiFiManager *)self->_wifiManager setValue:MEMORY[0x1E4F1CC38] forKey:@"degradeOnAnyTrafficUnavailable"];
    }
    -[CUWiFiManager activateWithCompletion:](self->_wifiManager, "activateWithCompletion:", 0, v14, trafficFlags, v16, v17);
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F5E228]);
  v18[0] = a3->var0;
  *(in6_addr *)((char *)v18 + 12) = *(in6_addr *)((char *)&a3->var2.sin6_addr + 4);
  [v12 setPeerIP:v18];
  [v12 setSessionID:self->_trafficSessionID];
  [v12 setTrafficFlags:self->_trafficFlags];
  v20[0] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  [(CUWiFiManager *)self->_wifiManager setTrafficPeers:v13];
}

void __51__RPStreamSession__updateTrafficRegistrationForIP___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 176);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__RPStreamSession__updateTrafficRegistrationForIP___block_invoke_2;
  block[3] = &unk_1E605B540;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __51__RPStreamSession__updateTrafficRegistrationForIP___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 256);
  int v4 = [*(id *)(v2 + 128) wifiFlags];
  unint64_t v5 = v3 & 0xFFFFFFFFF9FFFFFFLL | (v4 << 19) & 0x2000000 | (v4 << 19) & 0x4000000;
  if (v5 != v3)
  {
    *(void *)(*(void *)(a1 + 32) + 256) = v5;
    if (gLogCategory_RPStreamSession <= 30
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    sockaddr v6 = (void (**)(void, void, void, void))MEMORY[0x1B3EBCC80](*(void *)(*(void *)(a1 + 32)
                                                                                             + 248));
    if (v6)
    {
      id v10 = v6;
      v6[2](v6, v7, v8, v9);
      sockaddr v6 = (void (**)(void, void, void, void))v10;
    }
  }
}

- (void)_updateTrafficRegistrationForDestination:(id)a3
{
  memset(v5, 0, 28);
  id v4 = a3;
  [v4 UTF8String];
  if (StringToSockAddr())
  {
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    self->_peerIP.sa = (sockaddr)v5[0];
    *(in6_addr *)((char *)&self->_peerIP.v6.sin6_addr + 4) = *(in6_addr *)((char *)v5 + 12);
    [(RPStreamSession *)self _updateTrafficRegistration];
  }
}

- (int)flowControlWriteState
{
  rpCnx = self->_rpCnx;
  if (rpCnx)
  {
    int v3 = [(RPConnection *)rpCnx flowControlWriteState];
    if (v3 == 10) {
      LODWORD(rpCnx) = 1;
    }
    else {
      LODWORD(rpCnx) = 2 * (v3 == 20);
    }
  }
  return (int)rpCnx;
}

- (unint64_t)delegatedProcessUPID
{
  return self->_delegatedProcessUPID;
}

- (void)setDelegatedProcessUPID:(unint64_t)a3
{
  self->_unint64_t delegatedProcessUPID = a3;
}

- (id)disconnectHandler
{
  return self->_disconnectHandler;
}

- (void)setDisconnectHandler:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)flowControlWriteChangedHandler
{
  return self->_flowControlWriteChangedHandler;
}

- (void)setFlowControlWriteChangedHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (RPMessageable)messenger
{
  return self->_messenger;
}

- (void)setMessenger:(id)a3
{
}

- (NSUUID)nwClientID
{
  return self->_nwClientID;
}

- (void)setNwClientID:(id)a3
{
}

- (id)receivedEventHandler
{
  return self->_receivedEventHandler;
}

- (void)setReceivedEventHandler:(id)a3
{
}

- (id)receivedRequestHandler
{
  return self->_receivedRequestHandler;
}

- (void)setReceivedRequestHandler:(id)a3
{
}

- (id)connectionReadyHandler
{
  return self->_connectionReadyHandler;
}

- (void)setConnectionReadyHandler:(id)a3
{
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (id)statusChangedHandler
{
  return self->_statusChangedHandler;
}

- (void)setStatusChangedHandler:(id)a3
{
}

- (unint64_t)statusFlags
{
  return self->_statusFlags;
}

- (unsigned)streamFlags
{
  return self->_streamFlags;
}

- (void)setStreamFlags:(unsigned int)a3
{
  self->_uint64_t streamFlags = a3;
}

- (NSString)streamID
{
  return self->_streamID;
}

- (void)setStreamID:(id)a3
{
}

- (NSData)streamKey
{
  return self->_streamKey;
}

- (void)setStreamKey:(id)a3
{
}

- (int)streamSocket
{
  return self->_streamSocket;
}

- (void)setStreamSocket:(int)a3
{
  self->_int streamSocket = a3;
}

- (int)streamType
{
  return self->_streamType;
}

- (void)setStreamType:(int)a3
{
  self->_uint64_t streamType = a3;
}

- (int)streamQoS
{
  return self->_streamQoS;
}

- (unsigned)trafficFlags
{
  return self->_trafficFlags;
}

- (NSString)trafficSessionID
{
  return self->_trafficSessionID;
}

- (void)setTrafficSessionID:(id)a3
{
}

- (NSString)destinationString
{
  return self->_destinationString;
}

- (void)setDestinationString:(id)a3
{
}

- (NSData)pskData
{
  return self->_pskData;
}

- (void)setPskData:(id)a3
{
}

- (BOOL)serverMode
{
  return self->_serverMode;
}

- (void)setServerMode:(BOOL)a3
{
  self->_serverMode = a3;
}

- (id)streamAcceptHandler
{
  return self->_streamAcceptHandler;
}

- (void)setStreamAcceptHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_streamAcceptHandler, 0);
  objc_storeStrong((id *)&self->_pskData, 0);
  objc_storeStrong((id *)&self->_destinationString, 0);
  objc_storeStrong((id *)&self->_trafficSessionID, 0);
  objc_storeStrong((id *)&self->_streamKey, 0);
  objc_storeStrong((id *)&self->_streamID, 0);
  objc_storeStrong(&self->_statusChangedHandler, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong(&self->_connectionReadyHandler, 0);
  objc_storeStrong(&self->_receivedRequestHandler, 0);
  objc_storeStrong(&self->_receivedEventHandler, 0);
  objc_storeStrong((id *)&self->_nwClientID, 0);
  objc_storeStrong((id *)&self->_messenger, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_flowControlWriteChangedHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_disconnectHandler, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_tcpServer, 0);
  objc_storeStrong((id *)&self->_rpCnx, 0);
  objc_storeStrong((id *)&self->_nwPathEvaluator, 0);
  objc_storeStrong((id *)&self->_nwListener, 0);
}

@end