@interface TVRMSDAAPTouchRemoteManager
- (BOOL)keyboardEditingSessionActive;
- (CGPoint)_locationForDirection:(int64_t)a3 repeatCount:(int)a4;
- (TVRMSDAAPTouchRemoteManager)initWithRequestManager:(id)a3;
- (TVRMSDAAPTouchRemoteManagerDelegate)delegate;
- (id)_encryptString:(id)a3;
- (id)keyboardInfo;
- (unsigned)_timeForDirection:(int64_t)a3 repeatCount:(int)a4;
- (void)_createSocket;
- (void)_parsePortInfoItems:(id)a3;
- (void)_processAuthenticationUpdateForItems:(id)a3;
- (void)_processKeyboardMessageItems:(id)a3;
- (void)_requestKeyboardStatus;
- (void)_requestPortInfo;
- (void)_requestPromptUpdate:(id)a3;
- (void)clearKeyboardText;
- (void)initiateControlWithCompletionHandler:(id)a3;
- (void)sendKeyboardReturnCommand;
- (void)sendNavigationCommand:(int64_t)a3;
- (void)sendTouchEndWithDirection:(int64_t)a3 repeatCount:(int)a4;
- (void)sendTouchMoveWithDirection:(int64_t)a3 repeatCount:(int)a4;
- (void)setDelegate:(id)a3;
- (void)setKeyboardText:(id)a3;
- (void)touchRemoteSocketDidDisconnect:(id)a3;
@end

@implementation TVRMSDAAPTouchRemoteManager

- (TVRMSDAAPTouchRemoteManager)initWithRequestManager:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TVRMSDAAPTouchRemoteManager;
  v6 = [(TVRMSDAAPTouchRemoteManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_requestManager, a3);
    v8 = objc_alloc_init(TVRMSFairPlayKeyboardEncryption);
    keyboardEncryption = v7->_keyboardEncryption;
    v7->_keyboardEncryption = v8;

    *(void *)&v7->_touchDistanceMin = 0x439B333342480000;
    *(void *)&v7->_touchTimeMin = 0x3200000001;
    v7->_keyboardEditingSessionActive = 0;
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
  v6 = _TVRCRMSLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int portSecret = self->_portSecret;
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = portSecret;
    _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "Touch remote port secret is [%d]", (uint8_t *)&buf, 8u);
  }

  objc_initWeak(&buf, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __68__TVRMSDAAPTouchRemoteManager_initiateControlWithCompletionHandler___block_invoke;
  v9[3] = &unk_2647AEE28;
  objc_copyWeak(&v11, &buf);
  id v8 = v4;
  id v10 = v8;
  [(TVRMSDAAPTouchRemoteManager *)self _requestPromptUpdate:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&buf);
}

uint64_t __68__TVRMSDAAPTouchRemoteManager_initiateControlWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _createSocket];

    id v4 = objc_loadWeakRetained((id *)(a1 + 40));
    [v4 _requestKeyboardStatus];
  }
  unsigned __int16 v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v5();
}

- (void)sendTouchMoveWithDirection:(int64_t)a3 repeatCount:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  -[TVRMSTouchRemoteSocket sendTouchCode:timeInMilliseconds:location:](self->_socket, "sendTouchCode:timeInMilliseconds:location:", 256, 0, 160.0, 228.5);
  [(TVRMSDAAPTouchRemoteManager *)self _locationForDirection:a3 repeatCount:v4];
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(TVRMSDAAPTouchRemoteManager *)self _timeForDirection:a3 repeatCount:v4];
  socket = self->_socket;

  -[TVRMSTouchRemoteSocket sendTouchCode:timeInMilliseconds:location:](socket, "sendTouchCode:timeInMilliseconds:location:", 257, v11, v8, v10);
}

- (void)sendTouchEndWithDirection:(int64_t)a3 repeatCount:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  -[TVRMSDAAPTouchRemoteManager _locationForDirection:repeatCount:](self, "_locationForDirection:repeatCount:");
  double v8 = v7;
  double v10 = v9;
  unsigned int v11 = [(TVRMSDAAPTouchRemoteManager *)self _timeForDirection:a3 repeatCount:v4];
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

  -[TVRMSTouchRemoteSocket sendTouchCode:timeInMilliseconds:location:](socket, "sendTouchCode:timeInMilliseconds:location:", 258, v14, v8, v10);
}

- (void)sendNavigationCommand:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    v3 = @"menu";
  }
  else {
    v3 = off_2647AEE48[a3 - 1];
  }
  id v4 = [(TVRMSDAAPRequestManager *)self->_requestManager requestControlCommand:v3 text:0 promptRevision:self->_controlPromptRevision completionHandler:0];
}

- (void)touchRemoteSocketDidDisconnect:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained touchRemoteManagerDidDisconnect:self];
}

- (BOOL)keyboardEditingSessionActive
{
  return self->_keyboardEditingSessionActive;
}

- (id)keyboardInfo
{
  return self->_keyboardInfo;
}

- (void)clearKeyboardText
{
}

- (void)setKeyboardText:(id)a3
{
  id v7 = a3;
  [(TVRMSDAAPTouchRemoteManager *)self _requestPromptUpdate:0];
  [(TVRMSKeyboardInfo *)self->_keyboardInfo setText:v7];
  if ([(TVRMSKeyboardInfo *)self->_keyboardInfo secureText])
  {
    objc_msgSend(&stru_26DA49BC8, "stringByPaddingToLength:withString:startingAtIndex:", objc_msgSend(v7, "length"), @"*", 0);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = v7;
  }
  unsigned __int16 v5 = v4;
  id v6 = [(TVRMSDAAPRequestManager *)self->_requestManager requestControlCommand:@"PromptUpdate" text:v4 data:0 controlValue:self->_keyboardEditingSessionID promptRevision:self->_controlPromptRevision completionHandler:0];
}

- (void)sendKeyboardReturnCommand
{
  [(TVRMSDAAPTouchRemoteManager *)self _requestPromptUpdate:0];
  BOOL v3 = [(TVRMSKeyboardInfo *)self->_keyboardInfo secureText];
  uint64_t v4 = [(TVRMSKeyboardInfo *)self->_keyboardInfo text];
  if (v3)
  {
    id v7 = (id)v4;
    unsigned __int16 v5 = [(TVRMSDAAPTouchRemoteManager *)self _encryptString:v4];

    uint64_t v4 = 0;
  }
  else
  {
    unsigned __int16 v5 = 0;
  }
  id v8 = (id)v4;
  id v6 = [(TVRMSDAAPRequestManager *)self->_requestManager requestControlCommand:@"PromptDone" text:v4 data:v5 controlValue:self->_keyboardEditingSessionID promptRevision:self->_controlPromptRevision completionHandler:0];
}

- (void)_createSocket
{
  id v5 = [(TVRMSDAAPRequestManager *)self->_requestManager hostName];
  BOOL v3 = [[TVRMSTouchRemoteSocket alloc] initWithHost:v5 port:self->_port encryptionKey:self->_encryptionKey];
  socket = self->_socket;
  self->_socket = v3;

  [(TVRMSTouchRemoteSocket *)self->_socket setDelegate:self];
  [(TVRMSTouchRemoteSocket *)self->_socket connect];
}

- (void)_requestPromptUpdate:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  requestManager = self->_requestManager;
  double v12 = @"prompt-id";
  id v6 = [NSNumber numberWithInteger:self->_controlPromptRevision];
  v13[0] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__TVRMSDAAPTouchRemoteManager__requestPromptUpdate___block_invoke;
  v10[3] = &unk_2647AEB38;
  v10[4] = self;
  id v11 = v4;
  id v8 = v4;
  id v9 = [(TVRMSDAAPRequestManager *)requestManager requestWithPath:@"controlpromptupdate" method:@"GET" postData:0 queryArgs:v7 completionHandler:v10];
}

void __52__TVRMSDAAPTouchRemoteManager__requestPromptUpdate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2 == 1) {
    goto LABEL_4;
  }
  if (a2 == -3)
  {
    [*(id *)(a1 + 32) _requestPromptUpdate:*(void *)(a1 + 40)];
LABEL_4:
    id v6 = +[TVRMSDAAPParser objectWithData:v5];
    id v7 = [v6 objectForKeyedSubscript:@"itemID"];
    *(void *)(*(void *)(a1 + 32) + 32) = [v7 integerValue];

    id v8 = [v6 objectForKeyedSubscript:@"items"];
    if ([v8 count])
    {
      unint64_t v9 = _controlPromptMessageTypeForItems(v8);
      double v10 = _TVRCRMSLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        uint64_t v14 = v8;
        _os_log_impl(&dword_2266D3000, v10, OS_LOG_TYPE_DEFAULT, "Control prompt items: %@", (uint8_t *)&v13, 0xCu);
      }

      if (v9 >= 3)
      {
        if (v9 == 4)
        {
          [*(id *)(a1 + 32) _processAuthenticationUpdateForItems:v8];
        }
        else if (v9 == 5)
        {
          [*(id *)(a1 + 32) _parsePortInfoItems:v8];
          uint64_t v12 = *(void *)(a1 + 40);
          if (v12) {
            (*(void (**)(uint64_t, uint64_t))(v12 + 16))(v12, a2);
          }
        }
        else
        {
          [*(id *)(a1 + 32) _requestPortInfo];
          [*(id *)(a1 + 32) _requestPromptUpdate:*(void *)(a1 + 40)];
        }
      }
      else
      {
        [*(id *)(a1 + 32) _processKeyboardMessageItems:v8];
      }
    }

    goto LABEL_18;
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, a2);
  }
LABEL_18:
}

- (void)_parsePortInfoItems:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    p_encryptionKey = &self->_encryptionKey;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        unint64_t v9 = objc_msgSend(v8, "objectForKeyedSubscript:", @"name", p_encryptionKey);
        double v10 = [v8 objectForKeyedSubscript:@"value"];
        p_port = &self->_port;
        if (([v9 isEqualToString:@"kKeybMsgKey_String"] & 1) != 0
          || (p_port = p_encryptionKey, [v9 isEqualToString:@"kKeybMsgKey_SubText"]))
        {
          int *p_port = self->_portSecret ^ [v10 intValue];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
}

- (void)_requestPortInfo
{
  BOOL v3 = NSString;
  uint64_t portSecret = self->_portSecret;
  uint64_t v5 = [(TVRMSDAAPRequestManager *)self->_requestManager pairingGUID];
  id v7 = [v3 stringWithFormat:@"%d,%@", portSecret, v5];

  id v6 = [(TVRMSDAAPRequestManager *)self->_requestManager requestControlCommand:@"DRPortInfoRequest" text:v7 promptRevision:self->_controlPromptRevision completionHandler:0];
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

- (void)_requestKeyboardStatus
{
  [(TVRMSDAAPTouchRemoteManager *)self _requestPromptUpdate:0];
  id v3 = [(TVRMSDAAPRequestManager *)self->_requestManager requestControlCommand:@"PromptResendReq" text:0 promptRevision:self->_controlPromptRevision completionHandler:0];
}

- (void)_processKeyboardMessageItems:(id)a3
{
  id v15 = a3;
  [(TVRMSDAAPTouchRemoteManager *)self _requestPromptUpdate:0];
  float v4 = _controlPromptKeyValueForItems(@"challenge", v15);
  if ([v4 length]) {
    [(TVRMSFairPlayKeyboardEncryption *)self->_keyboardEncryption setChallengeString:v4];
  }
  float v5 = _controlPromptKeyValueForItems(@"certificate", v15);
  if ([v5 length]) {
    [(TVRMSFairPlayKeyboardEncryption *)self->_keyboardEncryption setLeafString:v5];
  }
  uint64_t v6 = _controlPromptMessageTypeForItems(v15);
  double v7 = _controlPromptKeyValueForItems(@"kKeybMsgKey_SessionID", v15);
  int64_t v8 = [v7 integerValue];

  if (!self->_keyboardEditingSessionActive || v6)
  {
    self->_keyboardEditingSessionID = v8;
    if (v6 == 2)
    {
      self->_keyboardEditingSessionActive = 0;
      keyboardInfo = self->_keyboardInfo;
      self->_keyboardInfo = 0;

      uint64_t v11 = [(TVRMSDAAPTouchRemoteManager *)self delegate];
      [v11 touchRemoteManagerKeyboardEditingSessionDidEnd:self];
      goto LABEL_15;
    }
    if (v6 != 1)
    {
      if (v6) {
        goto LABEL_16;
      }
      goto LABEL_12;
    }
LABEL_13:
    self->_keyboardEditingSessionActive = 1;
    uint64_t v12 = [[TVRMSKeyboardInfo alloc] initWithItemsArray:v15];
    int v13 = self->_keyboardInfo;
    self->_keyboardInfo = v12;

    uint64_t v11 = [(TVRMSDAAPTouchRemoteManager *)self delegate];
    [v11 touchRemoteManagerKeyboardEditingSessionDidUpdate:self];
    goto LABEL_15;
  }
  if (self->_keyboardEditingSessionID == v8) {
    goto LABEL_13;
  }
  self->_keyboardEditingSessionID = v8;
LABEL_12:
  self->_keyboardEditingSessionActive = 1;
  float v9 = [[TVRMSKeyboardInfo alloc] initWithItemsArray:v15];
  double v10 = self->_keyboardInfo;
  self->_keyboardInfo = v9;

  uint64_t v11 = [(TVRMSDAAPTouchRemoteManager *)self delegate];
  [v11 touchRemoteManagerKeyboardEditingSessionDidBegin:self];
LABEL_15:

LABEL_16:
}

- (void)_processAuthenticationUpdateForItems:(id)a3
{
  if (self->_keyboardEditingSessionActive)
  {
    self->_keyboardEditingSessionActive = 0;
    keyboardInfo = self->_keyboardInfo;
    self->_keyboardInfo = 0;

    float v5 = [(TVRMSDAAPTouchRemoteManager *)self delegate];
    [v5 touchRemoteManagerKeyboardEditingSessionDidEnd:self];
  }

  [(TVRMSDAAPTouchRemoteManager *)self _requestPromptUpdate:0];
}

- (id)_encryptString:(id)a3
{
  id v4 = a3;
  if ([v4 length]
    && [(TVRMSFairPlayKeyboardEncryption *)self->_keyboardEncryption isTrusted])
  {
    float v5 = [(TVRMSFairPlayKeyboardEncryption *)self->_keyboardEncryption encryptString:v4];
  }
  else
  {
    float v5 = 0;
  }

  return v5;
}

- (TVRMSDAAPTouchRemoteManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TVRMSDAAPTouchRemoteManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_keyboardInfo, 0);
  objc_storeStrong((id *)&self->_socket, 0);
  objc_storeStrong((id *)&self->_keyboardEncryption, 0);

  objc_storeStrong((id *)&self->_requestManager, 0);
}

@end