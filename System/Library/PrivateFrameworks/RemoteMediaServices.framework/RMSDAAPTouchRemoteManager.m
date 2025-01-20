@interface RMSDAAPTouchRemoteManager
- (CGPoint)_locationForDirection:(int64_t)a3 repeatCount:(int)a4;
- (RMSDAAPTouchRemoteManager)initWithRequestManager:(id)a3;
- (RMSDAAPTouchRemoteManagerDelegate)delegate;
- (unsigned)_timeForDirection:(int64_t)a3 repeatCount:(int)a4;
- (void)_createSocket;
- (void)_parsePortInfoItems:(id)a3;
- (void)_requestPortInfo;
- (void)_requestPromptUpdate:(id)a3;
- (void)initiateControlWithCompletionHandler:(id)a3;
- (void)sendNavigationCommand:(int64_t)a3;
- (void)sendTouchEndWithDirection:(int64_t)a3 repeatCount:(int)a4;
- (void)sendTouchMoveWithDirection:(int64_t)a3 repeatCount:(int)a4;
- (void)setDelegate:(id)a3;
- (void)touchRemoteSocketDidDisconnect:(id)a3;
@end

@implementation RMSDAAPTouchRemoteManager

- (RMSDAAPTouchRemoteManager)initWithRequestManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RMSDAAPTouchRemoteManager;
  v6 = [(RMSDAAPTouchRemoteManager *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_requestManager, a3);
    *(void *)&v7->_touchDistanceMin = 0x439B333342480000;
    *(void *)&v7->_touchTimeMin = 0x3200000001;
    CFPreferencesAppSynchronize(@"com.apple.RemoteMediaServices");
    v7->_shouldWriteTimestampsForPPT = CFPreferencesGetAppBooleanValue(@"WritePPTTimestamps", @"com.apple.RemoteMediaServices", 0) != 0;
  }

  return v7;
}

- (void)initiateControlWithCompletionHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_portSecret)
  {
    do
    {
      unsigned __int16 v5 = arc4random();
      self->_int portSecret = v5;
    }
    while (!v5);
  }
  v6 = RMSLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int portSecret = self->_portSecret;
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = portSecret;
    _os_log_impl(&dword_23C83A000, v6, OS_LOG_TYPE_DEFAULT, "Touch remote port secret is [%d]", (uint8_t *)&buf, 8u);
  }

  objc_initWeak(&buf, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __66__RMSDAAPTouchRemoteManager_initiateControlWithCompletionHandler___block_invoke;
  v9[3] = &unk_264E74A50;
  objc_copyWeak(&v11, &buf);
  id v8 = v4;
  id v10 = v8;
  [(RMSDAAPTouchRemoteManager *)self _requestPromptUpdate:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&buf);
}

uint64_t __66__RMSDAAPTouchRemoteManager_initiateControlWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _createSocket];
  }
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v4();
}

- (void)sendTouchMoveWithDirection:(int64_t)a3 repeatCount:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  -[RMSTouchRemoteSocket sendTouchCode:timeInMilliseconds:location:](self->_socket, "sendTouchCode:timeInMilliseconds:location:", 256, 0, 160.0, 228.5);
  [(RMSDAAPTouchRemoteManager *)self _locationForDirection:a3 repeatCount:v4];
  -[RMSTouchRemoteSocket sendTouchCode:timeInMilliseconds:location:](self->_socket, "sendTouchCode:timeInMilliseconds:location:", 257, [(RMSDAAPTouchRemoteManager *)self _timeForDirection:a3 repeatCount:v4], v7, v8);
  if (self->_shouldWriteTimestampsForPPT)
  {
    objc_super v9 = [MEMORY[0x263EFF910] date];
    id v10 = RMSLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_23C83A000, v10, OS_LOG_TYPE_DEFAULT, "PPT Timestamps enabled, writing timestamp to file", buf, 2u);
    }

    if (sendTouchMoveWithDirection_repeatCount__onceToken != -1) {
      dispatch_once(&sendTouchMoveWithDirection_repeatCount__onceToken, &__block_literal_global_5);
    }
    id v11 = dispatch_get_global_queue(9, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __68__RMSDAAPTouchRemoteManager_sendTouchMoveWithDirection_repeatCount___block_invoke_2;
    block[3] = &unk_264E740A8;
    id v14 = v9;
    id v12 = v9;
    dispatch_async(v11, block);
  }
}

uint64_t __68__RMSDAAPTouchRemoteManager_sendTouchMoveWithDirection_repeatCount___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sendTouchMoveWithDirection_repeatCount__timestampFormatter;
  sendTouchMoveWithDirection_repeatCount__timestampFormatter = v0;

  v2 = (void *)sendTouchMoveWithDirection_repeatCount__timestampFormatter;
  return [v2 setDateFormat:@"MMMdd H:mm:ss.SSS"];
}

void __68__RMSDAAPTouchRemoteManager_sendTouchMoveWithDirection_repeatCount___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v1 = [(id)sendTouchMoveWithDirection_repeatCount__timestampFormatter stringFromDate:*(void *)(a1 + 32)];
  v2 = [NSString stringWithFormat:@"/tmp/NanoRemotePPT-%@", v1];
  [v1 writeToFile:v2 atomically:0 encoding:4 error:0];
  v3 = RMSLogger();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138412290;
    unsigned __int16 v5 = v1;
    _os_log_impl(&dword_23C83A000, v3, OS_LOG_TYPE_DEFAULT, "Wrote timestamp: %@", buf, 0xCu);
  }
}

- (void)sendTouchEndWithDirection:(int64_t)a3 repeatCount:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  -[RMSDAAPTouchRemoteManager _locationForDirection:repeatCount:](self, "_locationForDirection:repeatCount:");
  double v8 = v7;
  double v10 = v9;
  unsigned int v11 = [(RMSDAAPTouchRemoteManager *)self _timeForDirection:a3 repeatCount:v4];
  switch(a3)
  {
    case 0:
      double v12 = -15.0;
      goto LABEL_4;
    case 1:
      double v12 = 15.0;
LABEL_4:
      double v8 = v8 + v12;
      break;
    case 2:
      double v13 = -15.0;
      goto LABEL_7;
    case 3:
      double v13 = 15.0;
LABEL_7:
      double v10 = v10 + v13;
      break;
    default:
      break;
  }
  uint64_t v14 = v11 + 40;
  socket = self->_socket;
  -[RMSTouchRemoteSocket sendTouchCode:timeInMilliseconds:location:](socket, "sendTouchCode:timeInMilliseconds:location:", 258, v14, v8, v10);
}

- (void)sendNavigationCommand:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    v3 = @"menu";
  }
  else {
    v3 = off_264E74A98[a3 - 1];
  }
  id v4 = [(RMSDAAPRequestManager *)self->_requestManager requestControlCommand:v3 text:0 promptRevision:self->_controlPromptRevision completionHandler:0];
}

- (void)touchRemoteSocketDidDisconnect:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained touchRemoteManagerDidDisconnect:self];
}

- (void)_createSocket
{
  id v5 = [(RMSDAAPRequestManager *)self->_requestManager hostName];
  v3 = [[RMSTouchRemoteSocket alloc] initWithHost:v5 port:self->_port encryptionKey:self->_encryptionKey];
  socket = self->_socket;
  self->_socket = v3;

  [(RMSTouchRemoteSocket *)self->_socket setDelegate:self];
  [(RMSTouchRemoteSocket *)self->_socket connect];
}

- (void)_requestPromptUpdate:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  requestManager = self->_requestManager;
  double v12 = @"prompt-id";
  uint64_t v6 = [NSNumber numberWithInteger:self->_controlPromptRevision];
  v13[0] = v6;
  double v7 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__RMSDAAPTouchRemoteManager__requestPromptUpdate___block_invoke;
  v10[3] = &unk_264E74A78;
  v10[4] = self;
  id v11 = v4;
  id v8 = v4;
  id v9 = [(RMSDAAPRequestManager *)requestManager requestWithPath:@"controlpromptupdate" method:@"GET" postData:0 queryArgs:v7 completionHandler:v10];
}

void __50__RMSDAAPTouchRemoteManager__requestPromptUpdate___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (a2 == 1)
  {
    v3 = +[RMSDAAPParser objectWithData:](RMSDAAPParser, "objectWithData:");
    id v4 = [v3 objectForKeyedSubscript:@"itemID"];
    *(void *)(*(void *)(a1 + 32) + 24) = [v4 integerValue];

    id v5 = [v3 objectForKeyedSubscript:@"items"];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:buf count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          double v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v11 = [v10 objectForKeyedSubscript:@"name"];
          if ([v11 isEqualToString:@"kKeybMsgKey_MessageType"])
          {
            uint64_t v14 = [v10 objectForKeyedSubscript:@"value"];
            uint64_t v12 = [v14 integerValue];

            goto LABEL_15;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:buf count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    uint64_t v12 = 0;
LABEL_15:

    v15 = RMSLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 138412290;
      id v22 = v5;
      _os_log_impl(&dword_23C83A000, v15, OS_LOG_TYPE_DEFAULT, "Control prompt items: %@", buf, 0xCu);
    }

    v16 = *(void **)(a1 + 32);
    if (v12 == 5)
    {
      [v16 _parsePortInfoItems:v5];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      [v16 _requestPortInfo];
      [*(id *)(a1 + 32) _requestPromptUpdate:*(void *)(a1 + 40)];
    }
  }
  else
  {
    double v13 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v13();
  }
}

- (void)_parsePortInfoItems:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    p_int encryptionKey = &self->_encryptionKey;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "objectForKeyedSubscript:", @"name", p_encryptionKey);
        double v10 = [v8 objectForKeyedSubscript:@"value"];
        p_int port = &self->_port;
        if (([v9 isEqualToString:@"kKeybMsgKey_String"] & 1) != 0
          || (p_int port = p_encryptionKey, [v9 isEqualToString:@"kKeybMsgKey_SubText"]))
        {
          int *p_port = self->_portSecret ^ [v10 intValue];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v5);
  }
  uint64_t v12 = RMSLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int port = self->_port;
    int encryptionKey = self->_encryptionKey;
    *(_DWORD *)id buf = 67109376;
    int v22 = port;
    __int16 v23 = 1024;
    int v24 = encryptionKey;
    _os_log_impl(&dword_23C83A000, v12, OS_LOG_TYPE_DEFAULT, "Touch remote port info: [%d / %d]", buf, 0xEu);
  }
}

- (void)_requestPortInfo
{
  v3 = NSString;
  uint64_t portSecret = self->_portSecret;
  uint64_t v5 = [(RMSDAAPRequestManager *)self->_requestManager pairingGUID];
  id v7 = [v3 stringWithFormat:@"%d,%@", portSecret, v5];

  id v6 = [(RMSDAAPRequestManager *)self->_requestManager requestControlCommand:@"DRPortInfoRequest" text:v7 promptRevision:self->_controlPromptRevision completionHandler:0];
}

- (unsigned)_timeForDirection:(int64_t)a3 repeatCount:(int)a4
{
  float v4 = (double)a4 * 6.0;
  float v5 = (float)self->_touchTimeMax - (float)(v4 * v4);
  if (v5 <= (float)self->_touchTimeMin) {
    return (float)self->_touchTimeMin;
  }
  return v5;
}

- (CGPoint)_locationForDirection:(int64_t)a3 repeatCount:(int)a4
{
  float v4 = 12.0;
  if (a4 == 2) {
    float v4 = 16.0;
  }
  if (a4 > 2) {
    float v4 = 23.0;
  }
  float v5 = fminf(self->_touchDistanceMax, (float)(v4 * (float)a4) + self->_touchDistanceMin);
  switch(a3)
  {
    case 0:
      float v6 = 160.0 - v5;
      goto LABEL_9;
    case 1:
      float v6 = v5 + 160.0;
LABEL_9:
      double v8 = v6 + 0.5;
      double v7 = 228.0;
      break;
    case 2:
      float v9 = 228.0 - v5;
      goto LABEL_12;
    case 3:
      float v9 = v5 + 228.0;
LABEL_12:
      double v7 = v9;
      double v8 = 160.0;
      break;
    default:
      double v7 = 0.0;
      double v8 = 0.0;
      break;
  }
  result.y = v7;
  result.x = v8;
  return result;
}

- (RMSDAAPTouchRemoteManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RMSDAAPTouchRemoteManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_socket, 0);
  objc_storeStrong((id *)&self->_requestManager, 0);
}

@end