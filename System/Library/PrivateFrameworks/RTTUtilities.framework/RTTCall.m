@interface RTTCall
- (AVCVirtualTTYDevice)ttyDevice;
- (BOOL)_handleInitialGarbageTextFromTTY:(id)a3 device:(id)a4;
- (BOOL)isLocallyHosted;
- (BOOL)isViewControllerVisible;
- (NSDictionary)substitutions;
- (NSString)description;
- (OS_dispatch_queue)callQueue;
- (RTTCall)initWithCall:(id)a3;
- (RTTCallDelegate)delegate;
- (RTTConversation)conversation;
- (TUCall)call;
- (id)_processText:(id)a3 withDevice:(id)a4;
- (void)_postLocalNotificationForText:(id)a3;
- (void)_processMessageTimeoutForMe:(BOOL)a3;
- (void)audioSessionWasInterrupted:(id)a3;
- (void)callDidReceiveText:(id)a3 forUtterance:(id)a4;
- (void)callStatusDidChange:(id)a3;
- (void)dealloc;
- (void)device:(id)a3 didReceiveCharacter:(unsigned __int16)a4;
- (void)device:(id)a3 didReceiveText:(id)a4;
- (void)device:(id)a3 didStart:(BOOL)a4 error:(id)a5;
- (void)deviceDidStop:(id)a3;
- (void)mediaServerDied;
- (void)recreateTTYDevice:(id)a3;
- (void)registerNotifications;
- (void)saveTranscribedTextForConversation:(id)a3 isNew:(BOOL)a4;
- (void)sendString:(id)a3;
- (void)sendVoicemailTranscriptionText:(id)a3;
- (void)setCall:(id)a3;
- (void)setConversation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsViewControllerVisible:(BOOL)a3;
- (void)setSubstitutions:(id)a3;
- (void)setTtyDevice:(id)a3;
- (void)start;
- (void)stop;
- (void)toggleSystemOutputMute:(BOOL)a3;
@end

@implementation RTTCall

- (RTTCall)initWithCall:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)RTTCall;
  v5 = [(RTTCall *)&v18 init];
  v6 = v5;
  if (v5)
  {
    [(RTTCall *)v5 setCall:v4];
    v7 = +[RTTDatabaseManager sharedManager];
    v8 = [v4 callUUID];
    v9 = [v7 conversationForCallUID:v8];

    if (!v9)
    {
      v9 = +[RTTConversation conversationWithCall:v4];
      v10 = +[RTTDatabaseManager sharedManager];
      [v10 saveConversation:v9];
    }
    [(RTTCall *)v6 setConversation:v9];
    dispatch_queue_t v11 = dispatch_queue_create("tty-call-queue", 0);
    callQueue = v6->_callQueue;
    v6->_callQueue = (OS_dispatch_queue *)v11;

    [(RTTCall *)v6 setSubstitutions:&unk_26D1B3AA8];
    [(RTTCall *)v6 registerNotifications];
    uint64_t v13 = [objc_alloc(MEMORY[0x263F21398]) initWithTargetSerialQueue:v6->_callQueue];
    incomingMessageTimeout = v6->_incomingMessageTimeout;
    v6->_incomingMessageTimeout = (AXDispatchTimer *)v13;

    [(AXDispatchTimer *)v6->_incomingMessageTimeout setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    uint64_t v15 = [objc_alloc(MEMORY[0x263F21398]) initWithTargetSerialQueue:v6->_callQueue];
    outgoingMessageTimeout = v6->_outgoingMessageTimeout;
    v6->_outgoingMessageTimeout = (AXDispatchTimer *)v15;

    [(AXDispatchTimer *)v6->_outgoingMessageTimeout setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
  }

  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(RTTCall *)self setDelegate:0];
  [(RTTCall *)self setCall:0];
  [(RTTCall *)self stop];
  v4.receiver = self;
  v4.super_class = (Class)RTTCall;
  [(RTTCall *)&v4 dealloc];
}

- (void)registerNotifications
{
  v14[1] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_recreateTTYDevice_ name:*MEMORY[0x263F7E348] object:0];

  objc_super v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_recreateTTYDevice_ name:*MEMORY[0x263F7E358] object:0];

  v5 = [MEMORY[0x263F544E0] sharedAVSystemController];
  v6 = (uint64_t *)MEMORY[0x263F54470];
  v14[0] = *MEMORY[0x263F54470];
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  [v5 setAttribute:v7 forKey:*MEMORY[0x263F544A0] error:0];

  v8 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v9 = *v6;
  v10 = [MEMORY[0x263F544E0] sharedAVSystemController];
  [v8 addObserver:self selector:sel_mediaServerDied name:v9 object:v10];

  dispatch_queue_t v11 = [MEMORY[0x263F08A00] defaultCenter];
  [v11 addObserver:self selector:sel_audioSessionWasInterrupted_ name:*MEMORY[0x263EF90A0] object:0];

  v12 = [MEMORY[0x263F08A00] defaultCenter];
  [v12 addObserver:self selector:sel_callStatusDidChange_ name:*MEMORY[0x263F7E310] object:0];

  uint64_t v13 = [MEMORY[0x263F08A00] defaultCenter];
  [v13 addObserver:self selector:sel_callStatusDidChange_ name:*MEMORY[0x263F7E300] object:0];
}

- (void)audioSessionWasInterrupted:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_super v4 = AXLogRTT();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_21FEA9000, v4, OS_LOG_TYPE_INFO, "Media server interrupted %@", buf, 0xCu);
  }

  id v5 = v3;
  AXPerformBlockOnMainThread();
}

void __38__RTTCall_audioSessionWasInterrupted___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 valueForKey:*MEMORY[0x263EF90C8]];
  uint64_t v4 = [v3 unsignedIntegerValue];

  if (!v4)
  {
    id v5 = *(void **)(a1 + 40);
    [v5 recreateTTYDevice:0];
  }
}

- (void)mediaServerDied
{
  id v3 = AXLogRTT();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_21FEA9000, v3, OS_LOG_TYPE_INFO, "Media server died.", v5, 2u);
  }

  uint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  [(RTTCall *)self performSelector:sel_registerNotifications withObject:0 afterDelay:2.0];
  [(RTTCall *)self recreateTTYDevice:0];
}

- (NSString)description
{
  id v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)RTTCall;
  uint64_t v4 = [(RTTCall *)&v9 description];
  id v5 = [(RTTCall *)self call];
  v6 = [(RTTCall *)self conversation];
  id v7 = [v3 stringWithFormat:@"%@ - %@ = %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BOOL)isLocallyHosted
{
  return 1;
}

- (void)callStatusDidChange:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [v4 object];
    uint64_t v8 = [v7 callUUID];
    objc_super v9 = [(RTTCall *)self call];
    v10 = [v9 callUUID];
    int v11 = [v8 isEqualToString:v10];

    if (v11)
    {
      v12 = AXLogRTT();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = [(RTTCall *)self conversation];
        int v16 = 138412546;
        v17 = v13;
        __int16 v18 = 2112;
        v19 = v7;
        _os_log_impl(&dword_21FEA9000, v12, OS_LOG_TYPE_INFO, "Call status changed, saving conversation to database. %@ - %@", (uint8_t *)&v16, 0x16u);
      }
      v14 = +[RTTDatabaseManager sharedManager];
      uint64_t v15 = [(RTTCall *)self conversation];
      [v14 saveConversation:v15];
    }
  }
}

- (void)recreateTTYDevice:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_6;
  }
  id v7 = [v4 object];
  uint64_t v8 = [v7 callUUID];
  objc_super v9 = [(RTTCall *)self call];
  v10 = [v9 callUUID];
  char v11 = [v8 isEqualToString:v10];

  v12 = AXLogRTT();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v11)
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FEA9000, v12, OS_LOG_TYPE_INFO, "Recreating TTY device with updated call", buf, 2u);
    }

    [(RTTCall *)self setCall:v7];
LABEL_6:
    [MEMORY[0x263F20F78] stopAudioSession];
    v14 = [(RTTCall *)self ttyDevice];
    [v14 stop];

    [(RTTCall *)self setTtyDevice:0];
    uint64_t v15 = [(RTTCall *)self call];
    char v16 = [v15 supportsTTYWithVoice];

    if ((v16 & 1) == 0)
    {
      [MEMORY[0x263F20F78] setAudioSessionProperties:&unk_26D1B3AF8];
      [MEMORY[0x263F20F78] startAudioSession];
    }
    self->_int64_t ttyMode = 0;
    v17 = [(RTTCall *)self call];
    int v18 = [v17 supportsTTYWithVoice];

    if (v18)
    {
      self->_int64_t ttyMode = 3;
      v19 = [(RTTCall *)self call];
      uint64_t v20 = [v19 providerContext];
      v21 = AXTTYTextStreamToken();
      v22 = [v20 objectForKey:v21];
      uint64_t v23 = [v22 integerValue];
    }
    else
    {
      v24 = [(RTTCall *)self call];
      int v25 = [v24 isUsingBaseband];

      if (v25)
      {
        self->_int64_t ttyMode = 1;
        goto LABEL_17;
      }
      uint64_t v23 = 0;
    }
    if (self->_ttyMode == 3)
    {
      uint64_t v35 = 0;
      v26 = (id *)&v35;
      uint64_t v27 = [objc_alloc(MEMORY[0x263F20FF0]) initWithStreamToken:v23 error:&v35];
LABEL_18:
      v12 = v27;
      id v7 = *v26;
      [v12 setDelegate:self];
      v30 = AXLogRTT();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        int64_t ttyMode = self->_ttyMode;
        v32 = [(RTTCall *)self call];
        *(_DWORD *)buf = 134218754;
        int64_t v37 = ttyMode;
        __int16 v38 = 2112;
        id v39 = v7;
        __int16 v40 = 2112;
        id v41 = v4;
        __int16 v42 = 2112;
        v43 = v32;
        _os_log_impl(&dword_21FEA9000, v30, OS_LOG_TYPE_INFO, "Creating TTY %ld, %@ = %@ = %@", buf, 0x2Au);
      }
      [(RTTCall *)self setTtyDevice:v12];
      v33 = [(RTTCall *)self ttyDevice];
      [v33 start];

      goto LABEL_21;
    }
LABEL_17:
    id v28 = objc_alloc(MEMORY[0x263F20FF0]);
    int64_t v29 = self->_ttyMode;
    uint64_t v34 = 0;
    v26 = (id *)&v34;
    uint64_t v27 = [v28 initWithMode:v29 error:&v34];
    goto LABEL_18;
  }
  if (v13)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FEA9000, v12, OS_LOG_TYPE_INFO, "Call UUID did not match current call. Ignoring call update", buf, 2u);
  }
LABEL_21:
}

- (void)toggleSystemOutputMute:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v4 = AXLogRTT();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_21FEA9000, v4, OS_LOG_TYPE_INFO, "Requesting to toggle mute: %d", (uint8_t *)v5, 8u);
  }

  RTTSetDownlinkMute(v3);
}

- (void)start
{
  BOOL v3 = [(RTTCall *)self ttyDevice];

  if (v3)
  {
    id v4 = [(RTTCall *)self ttyDevice];
    [v4 start];
  }
  else
  {
    [(RTTCall *)self recreateTTYDevice:0];
  }
  id v5 = [(RTTCall *)self call];
  int v6 = [v5 isEmergency];

  if (v6)
  {
    id v7 = AXLogRTT();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FEA9000, v7, OS_LOG_TYPE_INFO, "Sending emergency announce", buf, 2u);
    }

    uint64_t v8 = 15;
    do
    {
      [(RTTCall *)self sendString:@" "];
      --v8;
    }
    while (v8);
  }
  else
  {
    objc_super v9 = [(RTTCall *)self call];
    if ([v9 isTTY])
    {
      v10 = [(RTTCall *)self call];
      char v11 = [v10 supportsTTYWithVoice];

      if ((v11 & 1) == 0) {
        [(RTTCall *)self toggleSystemOutputMute:1];
      }
    }
    else
    {
    }
  }
  v12 = +[RTTTelephonyUtilities sharedUtilityProvider];
  BOOL v13 = [(RTTCall *)self call];
  char v14 = [v12 answerRTTCallAsMutedForCall:v13];

  if ((v14 & 1) == 0) {
    AXPerformBlockAsynchronouslyOnMainThread();
  }
}

void __16__RTTCall_start__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) call];
  [v1 setUplinkMuted:0];
}

- (void)stop
{
  [MEMORY[0x263F20F78] stopAudioSession];
  [(RTTCall *)self toggleSystemOutputMute:0];
  BOOL v3 = [(RTTCall *)self ttyDevice];
  [v3 stop];

  [(RTTCall *)self setTtyDevice:0];
  id v5 = +[RTTDatabaseManager sharedManager];
  id v4 = [(RTTCall *)self conversation];
  [v5 saveConversation:v4];
}

- (void)sendString:(id)a3
{
  id v4 = a3;
  callQueue = self->_callQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __22__RTTCall_sendString___block_invoke;
  v7[3] = &unk_2645400C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(callQueue, v7);
}

void __22__RTTCall_sendString___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = +[RTTTelephonyUtilities sharedUtilityProvider];
  BOOL v3 = [*(id *)(a1 + 32) call];
  id v4 = [v2 contactPathForCall:v3];

  id v5 = +[RTTUtterance utteranceWithContactPath:v4 andText:*(void *)(a1 + 40)];
  id v6 = [*(id *)(a1 + 32) conversation];
  [v6 addUtterance:v5];

  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 48);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __22__RTTCall_sendString___block_invoke_2;
  v22[3] = &unk_264540098;
  v22[4] = v7;
  [v8 afterDelay:v22 processBlock:3.0];
  objc_super v9 = AXLogRTT();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    *(void *)v24 = v10;
    *(_WORD *)&v24[8] = 2112;
    *(void *)&v24[10] = v5;
    _os_log_impl(&dword_21FEA9000, v9, OS_LOG_TYPE_INFO, "Sending string[%@] with uttererance: %@", buf, 0x16u);
  }

  char v11 = AXLogRTT();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = [*(id *)(a1 + 32) conversation];
    *(_DWORD *)buf = 138412290;
    *(void *)v24 = v12;
    _os_log_impl(&dword_21FEA9000, v11, OS_LOG_TYPE_INFO, "Sending with convo: %@", buf, 0xCu);
  }
  BOOL v13 = *(void **)(a1 + 32);
  if (v13[1] == 3)
  {
    char v14 = [v13 ttyDevice];
    int v15 = [v14 sendText:*(void *)(a1 + 40)];

    char v16 = AXLogRTT();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = *(void **)(a1 + 40);
      uint64_t v18 = [v17 length];
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v24 = v15;
      *(_WORD *)&v24[4] = 2112;
      *(void *)&v24[6] = v17;
      *(_WORD *)&v24[14] = 2048;
      *(void *)&v24[16] = v18;
      _os_log_impl(&dword_21FEA9000, v16, OS_LOG_TYPE_INFO, "TTY send string %d = |%@| %lu", buf, 0x1Cu);
    }
  }
  else
  {
    uint64_t v19 = [*(id *)(a1 + 40) characterAtIndex:0];
    uint64_t v20 = AXLogRTT();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v24 = v19;
      *(_WORD *)&v24[4] = 1024;
      *(_DWORD *)&v24[6] = v19;
      _os_log_impl(&dword_21FEA9000, v20, OS_LOG_TYPE_INFO, "TTY send %C, |%x|", buf, 0xEu);
    }

    char v16 = [*(id *)(a1 + 32) ttyDevice];
    id v21 = (id)[v16 sendCharacter:v19];
  }
}

uint64_t __22__RTTCall_sendString___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processMessageTimeoutForMe:1];
}

- (void)device:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a5;
  uint64_t v7 = AXLogRTT();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109378;
    v8[1] = v5;
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_impl(&dword_21FEA9000, v7, OS_LOG_TYPE_INFO, "TTY Start %d %@", (uint8_t *)v8, 0x12u);
  }
}

- (void)deviceDidStop:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = AXLogRTT();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = [(RTTCall *)self call];
    v8[0] = 67109120;
    v8[1] = [v5 status];
    _os_log_impl(&dword_21FEA9000, v4, OS_LOG_TYPE_INFO, "TTY Stop %d", (uint8_t *)v8, 8u);
  }
  id v6 = [(RTTCall *)self call];
  int v7 = [v6 status];

  if ((v7 - 1) <= 1) {
    [(RTTCall *)self recreateTTYDevice:0];
  }
}

- (BOOL)_handleInitialGarbageTextFromTTY:(id)a3 device:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 isEqualToString:@"O"] & 1) != 0
    || [v6 isEqualToString:@";"]
    && ([(NSMutableString *)self->_garbageCollection isEqualToString:@"O"] & 1) != 0
    || [v6 isEqualToString:@"?"]
    && [(NSMutableString *)self->_garbageCollection isEqualToString:@"O;"])
  {
    if (!self->_garbageCharacterStripperTimer)
    {
      id v8 = (AXDispatchTimer *)[objc_alloc(MEMORY[0x263F21398]) initWithTargetSerialQueue:self->_callQueue];
      garbageCharacterStripperTimer = self->_garbageCharacterStripperTimer;
      self->_garbageCharacterStripperTimer = v8;

      id v10 = [MEMORY[0x263F089D8] string];
      garbageCollection = self->_garbageCollection;
      self->_garbageCollection = v10;
    }
    [(NSMutableString *)self->_garbageCollection appendString:v6];
    uint64_t v12 = [(NSMutableString *)self->_garbageCollection length];
    [(AXDispatchTimer *)self->_garbageCharacterStripperTimer cancel];
    if (v12 == 3)
    {
      BOOL v13 = self->_garbageCollection;
      self->_garbageCollection = 0;
    }
    else
    {
      int v15 = self->_garbageCharacterStripperTimer;
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __51__RTTCall__handleInitialGarbageTextFromTTY_device___block_invoke;
      v17[3] = &unk_2645400C0;
      v17[4] = self;
      uint64_t v18 = (NSMutableString *)v7;
      [(AXDispatchTimer *)v15 afterDelay:v17 processBlock:1.0];
      BOOL v13 = v18;
    }

    BOOL v14 = 1;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

void __51__RTTCall__handleInitialGarbageTextFromTTY_device___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) device:*(void *)(a1 + 40) didReceiveText:*(void *)(*(void *)(a1 + 32) + 24)];
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = 0;
}

- (void)_processMessageTimeoutForMe:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v5 = [(RTTCall *)self conversation];
  id v6 = [v5 lastUtteranceForMe:v3];

  if ([v6 hasTimedOut])
  {
    id v7 = AXLogRTT();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = @"incoming";
      if (v3) {
        id v8 = @"outgoing";
      }
      int v11 = 138412290;
      uint64_t v12 = v8;
      _os_log_impl(&dword_21FEA9000, v7, OS_LOG_TYPE_INFO, "Last %@ utterance timed out, saving conversation to database", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v9 = +[RTTDatabaseManager sharedManager];
    id v10 = [(RTTCall *)self conversation];
    [v9 saveConversation:v10];
  }
}

- (id)_processText:(id)a3 withDevice:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTTCall *)self conversation];
  uint64_t v9 = [v8 utterances];
  uint64_t v10 = [v9 count];

  if (v10)
  {
LABEL_9:
    id v6 = v6;
    uint64_t v12 = v6;
    goto LABEL_10;
  }
  if (![(RTTCall *)self _handleInitialGarbageTextFromTTY:v6 device:v7])
  {
    if ([(NSMutableString *)self->_garbageCollection length])
    {
      [(NSMutableString *)self->_garbageCollection appendString:v6];
      uint64_t v13 = [(NSMutableString *)self->_garbageCollection copy];

      id v6 = (id)v13;
    }
    garbageCollection = self->_garbageCollection;
    self->_garbageCollection = 0;

    goto LABEL_9;
  }
  int v11 = AXLogRTT();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v16 = 138412290;
    id v17 = v6;
    _os_log_impl(&dword_21FEA9000, v11, OS_LOG_TYPE_INFO, "not processing initial text because it looks like garbage: %@", (uint8_t *)&v16, 0xCu);
  }

  uint64_t v12 = 0;
LABEL_10:

  return v12;
}

- (void)callDidReceiveText:(id)a3 forUtterance:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = AXLogRTT();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [(RTTCall *)self delegate];
    int v11 = 138412802;
    uint64_t v12 = v9;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_21FEA9000, v8, OS_LOG_TYPE_INFO, "Delegate handling call did receive: %@ for [%@]->%@", (uint8_t *)&v11, 0x20u);
  }
  uint64_t v10 = [(RTTCall *)self delegate];
  [v10 ttyCall:self didReceiveString:v6 forUtterance:v7];
}

- (void)saveTranscribedTextForConversation:(id)a3 isNew:(BOOL)a4
{
  id v6 = a3;
  callQueue = self->_callQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__RTTCall_saveTranscribedTextForConversation_isNew___block_invoke;
  block[3] = &unk_264540630;
  BOOL v11 = a4;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(callQueue, block);
}

uint64_t __52__RTTCall_saveTranscribedTextForConversation_isNew___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  BOOL v3 = [*(id *)(a1 + 32) conversation];
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(a1 + 40);
  if (v2) {
    id v6 = (id)[v3 addTranscriptionFromOtherContactPath:v5];
  }
  else {
    id v7 = (id)[v3 updateTranscriptionFromOtherContactPath:v5];
  }

  id v8 = +[RTTDatabaseManager sharedManager];
  uint64_t v9 = [*(id *)(a1 + 32) conversation];
  [v8 saveConversation:v9];

  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);

  return [v10 _postLocalNotificationForText:v11];
}

- (void)sendVoicemailTranscriptionText:(id)a3
{
  id v4 = a3;
  callQueue = self->_callQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__RTTCall_sendVoicemailTranscriptionText___block_invoke;
  v7[3] = &unk_2645400C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(callQueue, v7);
}

void __42__RTTCall_sendVoicemailTranscriptionText___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) ttyDevice];
  int v3 = [v2 sendText:*(void *)(a1 + 40)];

  id v4 = AXLogRTT();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void **)(a1 + 40);
    v6[0] = 67109634;
    v6[1] = v3;
    __int16 v7 = 2112;
    id v8 = v5;
    __int16 v9 = 2048;
    uint64_t v10 = [v5 length];
    _os_log_impl(&dword_21FEA9000, v4, OS_LOG_TYPE_INFO, "TTY send voicemail transcription %d = |%@| %lu", (uint8_t *)v6, 0x1Cu);
  }
}

- (void)_postLocalNotificationForText:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(RTTCall *)self isViewControllerVisible])
  {
    uint64_t v37 = 0;
    __int16 v38 = &v37;
    uint64_t v39 = 0x2050000000;
    uint64_t v5 = (void *)getAXSpringBoardServerClass_softClass;
    uint64_t v40 = getAXSpringBoardServerClass_softClass;
    if (!getAXSpringBoardServerClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      __int16 v42 = (RTTCall *)__getAXSpringBoardServerClass_block_invoke;
      v43 = &unk_264540250;
      uint64_t v44 = &v37;
      __getAXSpringBoardServerClass_block_invoke((uint64_t)&buf);
      uint64_t v5 = (void *)v38[3];
    }
    id v6 = v5;
    _Block_object_dispose(&v37, 8);
    __int16 v7 = objc_msgSend(v6, "server", v37);
    id v8 = [v7 focusedApps];
    __int16 v9 = objc_msgSend(v8, "ax_filteredArrayUsingBlock:", &__block_literal_global_3);
    uint64_t v10 = [v9 count];
    BOOL v11 = v10 != 0;

    uint64_t v12 = AXLogRTT();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 67109120;
      DWORD1(buf) = v10 != 0;
      _os_log_impl(&dword_21FEA9000, v12, OS_LOG_TYPE_INFO, "VC was visible, but was InCallService? %d", (uint8_t *)&buf, 8u);
    }
  }
  else
  {
    BOOL v11 = 0;
  }
  __int16 v13 = [(RTTCall *)self call];
  if ([v13 isIncoming])
  {
    id v14 = [(RTTCall *)self call];
    int v15 = [v14 isScreening];

    if (v15)
    {
      id v16 = AXLogRTT();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_21FEA9000, v16, OS_LOG_TYPE_INFO, "Skipping user notification for incoming call in screening state", (uint8_t *)&buf, 2u);
      }
LABEL_27:

      goto LABEL_28;
    }
  }
  else
  {
  }
  uint64_t v17 = AXLogRTT();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = [(RTTCall *)self call];
    int v19 = [v18 isEndpointOnCurrentDevice];
    LODWORD(buf) = 67109634;
    DWORD1(buf) = v19;
    WORD4(buf) = 1024;
    *(_DWORD *)((char *)&buf + 10) = !v11;
    HIWORD(buf) = 2112;
    __int16 v42 = self;
    _os_log_impl(&dword_21FEA9000, v17, OS_LOG_TYPE_INFO, "Generating user notification based on whether device is endpoint %d of call and view control is hidden: %d [%@]", (uint8_t *)&buf, 0x18u);
  }
  if (!v11)
  {
    uint64_t v20 = [(RTTCall *)self call];
    int v21 = [v20 isEndpointOnCurrentDevice];

    if (v21)
    {
      v22 = [(RTTCall *)self call];
      id v16 = [v22 displayName];

      if (![v16 length])
      {
        uint64_t v23 = (void *)MEMORY[0x263EFEA20];
        v24 = (void *)MEMORY[0x263EFE9F8];
        uint64_t v25 = [(RTTCall *)self conversation];
        v26 = [v25 otherContactPath];
        uint64_t v27 = [v24 contactForPhoneNumber:v26];
        uint64_t v28 = [v23 stringFromContact:v27 style:0];

        id v16 = v28;
      }
      int64_t v29 = [(RTTCall *)self conversation];
      v30 = [v29 utterances];
      v31 = [v30 lastObject];

      v32 = AXLogRTT();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v31;
        _os_log_impl(&dword_21FEA9000, v32, OS_LOG_TYPE_INFO, "Generating user notification with utterance: %@", (uint8_t *)&buf, 0xCu);
      }

      char v33 = [v31 isMe];
      if (v31) {
        char v34 = v33;
      }
      else {
        char v34 = 1;
      }
      if ((v34 & 1) == 0)
      {
        uint64_t v35 = [(RTTCall *)self call];
        v36 = [v35 callUUID];
        RTTGenerateUserNotificationForContact(v16, v4, v31, v36);
      }
      goto LABEL_27;
    }
  }
LABEL_28:
}

uint64_t __41__RTTCall__postLocalNotificationForText___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = [v2 bundleIdentifier];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  id v4 = (void *)getAXInCallServiceNameSymbolLoc_ptr;
  uint64_t v12 = getAXInCallServiceNameSymbolLoc_ptr;
  if (!getAXInCallServiceNameSymbolLoc_ptr)
  {
    uint64_t v5 = (void *)AccessibilityUtilitiesLibrary();
    v10[3] = (uint64_t)dlsym(v5, "AXInCallServiceName");
    getAXInCallServiceNameSymbolLoc_ptr = v10[3];
    id v4 = (void *)v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v4)
  {
    id v8 = (_Unwind_Exception *)__41__RTTCall__postLocalNotificationForText___block_invoke_cold_1();
    _Block_object_dispose(&v9, 8);
    _Unwind_Resume(v8);
  }
  uint64_t v6 = [v3 isEqualToString:*v4];

  return v6;
}

- (void)device:(id)a3 didReceiveText:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = AXLogRTT();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [v7 length];
    if (v9) {
      LODWORD(v9) = [v7 characterAtIndex:0];
    }
    *(_DWORD *)long long buf = 138412546;
    id v21 = v7;
    __int16 v22 = 1024;
    int v23 = v9;
    _os_log_impl(&dword_21FEA9000, v8, OS_LOG_TYPE_INFO, "TTY receive string '%@' [%d]", buf, 0x12u);
  }

  uint64_t v10 = [(RTTCall *)self substitutions];
  uint64_t v11 = [v10 objectForKey:v7];

  if (v11)
  {
    id v12 = v11;

    __int16 v13 = AXLogRTT();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v21 = v12;
      _os_log_impl(&dword_21FEA9000, v13, OS_LOG_TYPE_INFO, "Replacing with |%@|", buf, 0xCu);
    }
  }
  else
  {
    id v12 = v7;
  }
  callQueue = self->_callQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__RTTCall_device_didReceiveText___block_invoke;
  block[3] = &unk_264540678;
  block[4] = self;
  id v18 = v12;
  id v19 = v6;
  id v15 = v6;
  id v16 = v12;
  dispatch_async(callQueue, block);
}

void __33__RTTCall_device_didReceiveText___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) _processText:*(void *)(a1 + 40) withDevice:*(void *)(a1 + 48)];
  if ([v2 length])
  {
    unint64_t v4 = 0;
    *(void *)&long long v3 = 138412290;
    long long v16 = v3;
    do
    {
      uint64_t v5 = objc_msgSend(v2, "rangeOfComposedCharacterSequenceAtIndex:", v4, v16);
      uint64_t v7 = v6;
      id v8 = objc_msgSend(v2, "substringWithRange:", v5, v6);
      uint64_t v9 = AXLogRTT();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = v16;
        id v19 = v8;
        _os_log_impl(&dword_21FEA9000, v9, OS_LOG_TYPE_INFO, "Processing individual substring: '%@'", buf, 0xCu);
      }

      uint64_t v10 = [*(id *)(a1 + 32) conversation];
      uint64_t v11 = [v10 appendStringFromOtherContactPath:v8];

      id v12 = *(void **)(a1 + 32);
      __int16 v13 = [v11 text];
      [v12 callDidReceiveText:v8 forUtterance:v13];

      v4 += v7;
    }
    while (v4 < [v2 length]);
  }
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = *(void **)(v14 + 40);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __33__RTTCall_device_didReceiveText___block_invoke_365;
  v17[3] = &unk_264540098;
  v17[4] = v14;
  [v15 afterDelay:v17 processBlock:3.0];
  [*(id *)(a1 + 32) _postLocalNotificationForText:*(void *)(a1 + 40)];
}

uint64_t __33__RTTCall_device_didReceiveText___block_invoke_365(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processMessageTimeoutForMe:0];
}

- (void)device:(id)a3 didReceiveCharacter:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = AXLogRTT();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 67109376;
    int v10 = v4;
    __int16 v11 = 1024;
    int v12 = v4;
    _os_log_impl(&dword_21FEA9000, v7, OS_LOG_TYPE_INFO, "TTY receive %C, |%x|", buf, 0xEu);
  }

  id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%C", v4);
  [(RTTCall *)self device:v6 didReceiveText:v8];
}

- (RTTCallDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RTTCallDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RTTConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
}

- (TUCall)call
{
  return self->_call;
}

- (void)setCall:(id)a3
{
}

- (OS_dispatch_queue)callQueue
{
  return self->_callQueue;
}

- (BOOL)isViewControllerVisible
{
  return self->_isViewControllerVisible;
}

- (void)setIsViewControllerVisible:(BOOL)a3
{
  self->_isViewControllerVisible = a3;
}

- (AVCVirtualTTYDevice)ttyDevice
{
  return self->_ttyDevice;
}

- (void)setTtyDevice:(id)a3
{
}

- (NSDictionary)substitutions
{
  return self->_substitutions;
}

- (void)setSubstitutions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_substitutions, 0);
  objc_storeStrong((id *)&self->_ttyDevice, 0);
  objc_storeStrong((id *)&self->_call, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_outgoingMessageTimeout, 0);
  objc_storeStrong((id *)&self->_incomingMessageTimeout, 0);
  objc_storeStrong((id *)&self->_garbageCharacterStripperTimer, 0);
  objc_storeStrong((id *)&self->_garbageCollection, 0);

  objc_storeStrong((id *)&self->_callQueue, 0);
}

uint64_t __41__RTTCall__postLocalNotificationForText___block_invoke_cold_1()
{
  return __getAXSpringBoardServerClass_block_invoke_cold_1();
}

@end